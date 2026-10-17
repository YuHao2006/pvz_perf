#include "PortableDemoReaderSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "misc/MTRand.h"
#include <array>
#include <fstream>
#include <stdexcept>
#include <vector>

namespace {
using Bytes=std::vector<unsigned char>;
void Word(Bytes& out,std::uint32_t value,unsigned width=4) {
    for(unsigned i=0;i<width;++i) out.push_back(static_cast<unsigned char>(value>>(i*8)));
}
void SetWord(Bytes& out,std::size_t pos,std::uint32_t value,unsigned width=4) {
    for(unsigned i=0;i<width;++i) out.at(pos+i)=static_cast<unsigned char>(value>>(i*8));
}
Bytes File(const std::string& product,unsigned version,const Bytes& markers) {
    Bytes out;Word(out,0x42beef78);Word(out,version);Word(out,0x76543210);
    Word(out,static_cast<unsigned>(product.size()),2);
    out.insert(out.end(),product.begin(),product.end());
    if(version>=2) {Word(out,static_cast<unsigned>(markers.size()));out.insert(out.end(),markers.begin(),markers.end());}
    Word(out,0xf0000000);out.insert(out.end(),{0x50,0xab,0,0xff,0x7f});
    return out;
}
}

void PortableDemoReaderSmoke(LawnApp& app) {
    using namespace Sexy;
    const auto require=[](bool ok,const char* message){if(!ok) throw std::runtime_error(message);};
    require(!app.mDDInterface,"Demo reader probe must run before real session RNG initialization");
    struct Restore {
        LawnApp& app;std::string filename;Buffer buffer;SexyAppBase::DemoMarkerList markers;
        std::uint32_t length;unsigned int seed;
        ~Restore() {
            app.mDemoFileName=std::move(filename);app.mDemoBuffer=buffer;
            app.mDemoMarkerList=std::move(markers);app.mDemoLength=length;app.mRandSeed=seed;
            SRand(seed); // Real Init reseeds later; this probe cannot run in a live game.
        }
    } restore{app,app.mDemoFileName,app.mDemoBuffer,app.mDemoMarkerList,app.mDemoLength,app.mRandSeed};
    app.mDemoFileName=ModernSmoke::ProbePath("demo-checked-reader.dmo");
    std::ofstream log(ModernSmoke::ProbePath("demo-checked-reader.txt"));
    require(bool(log),"Cannot write demo reader evidence");
    const auto write=[&](const Bytes& bytes) {
        std::ofstream out(app.mDemoFileName,std::ios::binary|std::ios::trunc);
        out.write(reinterpret_cast<const char*>(bytes.data()),static_cast<std::streamsize>(bytes.size()));
        out.close();require(bool(out),"Cannot write isolated demo fixture");
    };
    const std::size_t header=14+app.mProductVersion.size();
    Bytes markers;Word(markers,1);Word(markers,3,2);
    markers.insert(markers.end(),{'a',0,'b'});Word(markers,0xefffffff);
    const auto valid=File(app.mProductVersion,2,markers);
    std::vector<std::pair<std::string,Bytes>> invalid;
    auto add=[&](std::string name,Bytes bytes){invalid.emplace_back(std::move(name),std::move(bytes));};
    auto changed=valid;SetWord(changed,4,3);add("unsupported-v3",changed);
    changed=File(app.mProductVersion,1,{});SetWord(changed,4,0);add("unsupported-v0",changed);
    Bytes broken;Word(broken,1);Word(broken,3,2);broken.insert(broken.end(),{'a','b','c'});
    add("missing-marker-tick",File(app.mProductVersion,2,broken));
    broken.clear();Word(broken,1);Word(broken,3,2);broken.push_back('a');
    add("truncated-marker-name",File(app.mProductVersion,2,broken));
    broken=markers;SetWord(broken,4,0xffff,2);add("negative-marker-name-size",File(app.mProductVersion,2,broken));
    broken=markers;broken.push_back(0);add("trailing-marker-byte",File(app.mProductVersion,2,broken));
    // Negative production test is deliberately restricted to bounded cases:
    // no huge allocation requests or uninitialized short header reads.
    const bool boundedOnly=std::getenv("PVZ_DEMO_READER_BOUNDED_NEGATIVE")!=nullptr;
    if(!boundedOnly) {
        for(std::size_t length=0;length<header;++length)
            add("short-header-"+std::to_string(length),Bytes(valid.begin(),valid.begin()+length));
        for(unsigned count=0;count<4;++count)
            add("short-marker-size-"+std::to_string(count),Bytes(valid.begin(),valid.begin()+header+count));
        for(unsigned count=0;count<4;++count)
            add("short-duration-"+std::to_string(count),Bytes(valid.begin(),valid.end()-9+count));
        changed=valid;changed.resize(changed.size()-5);add("missing-commands",changed);
        changed=valid;SetWord(changed,header,0xffffffff);add("negative-marker-size",changed);
        changed=valid;SetWord(changed,header,0x7fffffff);add("oversize-marker-size",changed);
        changed=valid;SetWord(changed,header+4,0xffffffff);add("negative-marker-count",changed);
        changed=valid;SetWord(changed,header+4,0x7fffffff);add("oversize-marker-count",changed);
        changed=valid;SetWord(changed,0,0x12345678);add("wrong-magic",changed);
    }
    bool all=true;
    for(const auto& [name,bytes]:invalid) {
        write(bytes);
        app.mRandSeed=0x1073;SRand(app.mRandSeed);
        MTRand expected(app.mRandSeed);
        for(int i=0;i<7;++i) {Rand();expected.NextNoAssert();}
        app.mDemoBuffer.Clear();app.mDemoBuffer.WriteByte(0xa5);app.mDemoBuffer.ReadNumBits(3,false);
        const auto old=app.mDemoBuffer;
        app.mDemoMarkerList={{"untouched",27}};app.mDemoLength=456;
        std::string error;
        bool accepted=false;bool threw=false;
        try {accepted=app.ReadDemoBuffer(error);} catch(const std::exception& e) {threw=true;error=e.what();}
        const bool unchanged=app.mRandSeed==0x1073 && app.mDemoLength==456 &&
            app.mDemoMarkerList==SexyAppBase::DemoMarkerList{{"untouched",27}} &&
            app.mDemoBuffer.mData==old.mData && app.mDemoBuffer.mDataBitSize==old.mDataBitSize &&
            app.mDemoBuffer.mReadBitPos==old.mReadBitPos && app.mDemoBuffer.mWriteBitPos==old.mWriteBitPos;
        const bool rng=static_cast<unsigned int>(Rand())==expected.NextNoAssert();
        const bool ok=!accepted && !threw && !error.empty() && unchanged && rng;
        log<<name<<" rejected="<<!accepted<<" exception="<<threw<<" state-unchanged="<<unchanged
            <<" rng-position-unchanged="<<rng<<" diagnostic="<<error<<" pass="<<ok<<std::endl;
        all &= ok;
    }
    unsigned successful=0;
    for(unsigned version:{1u,2u}) {
        write(File(app.mProductVersion,version,markers));
        // Repeated reads must replace the session, not append another command
        // stream/marker list. Explicit byte construction is independent of Buffer.
        for(int repeat=0;repeat<2;++repeat) {
            std::string error="stale-error";
            const bool ok=app.ReadDemoBuffer(error);
            MTRand expected(0x76543210UL);
            const SexyAppBase::DemoMarkerList expectedMarkers=version==1?SexyAppBase::DemoMarkerList{}:
                SexyAppBase::DemoMarkerList{{std::string("a\0b",3),0xefffffff}};
            const bool fields=app.mRandSeed==0x76543210 && app.mDemoLength==0xf0000000 &&
                app.mDemoMarkerList==expectedMarkers && app.mDemoBuffer.mData==Bytes({0x50,0xab,0,0xff,0x7f}) &&
                app.mDemoBuffer.mReadBitPos==0 && app.mDemoBuffer.mDataBitSize==40 &&
                static_cast<unsigned int>(Rand())==expected.NextNoAssert();
            log<<"valid-v"<<version<<" repeat="<<repeat<<" accepted="<<ok<<" exact-fields="<<fields
                <<" error-cleared="<<error.empty()<<std::endl;
            all &= ok && fields && error.empty();++successful;
        }
    }
    log<<"invalid-cases="<<invalid.size()<<" valid-cases="<<successful<<" all="<<all<<std::endl;
    require(all,"Demo container accepted malformed metadata or changed state after failed parsing");
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    require(bool(result),"Cannot write demo reader result");
    result<<"portable-demo-checked-metadata-transactional-v1-v2 before-renderer=1\n";
}
