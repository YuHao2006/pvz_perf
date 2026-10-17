#include "PortablePoolReadSmoke.h"
#include "Sexy.TodLib/TodAllocator.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Zombie.h"
#include "System/SaveGame.h"
#include "System/LevelSaveFormat.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/Attachment.h"
#include <zlib.h>
#include <fstream>
#include <limits>
#include <stdexcept>
#include <vector>

namespace {
void Require(bool ok,const char* message){if(!ok)throw std::runtime_error(message);}
using Bytes=std::vector<unsigned char>;
unsigned Read32(const Bytes& b,size_t at){unsigned n=0;for(unsigned i=0;i<4;++i)n|=unsigned(b.at(at+i))<<(8*i);return n;}
void Put32(Bytes& b,size_t at,unsigned n){for(unsigned i=0;i<4;++i)b.at(at+i)=static_cast<unsigned char>(n>>(8*i));}
Bytes Read(LawnApp& app,const std::string& path){Sexy::Buffer b;Require(app.ReadBufferFromFile(path,&b,false),"Cannot read pool fixture");return b.mData;}

void CheckDefinitionReads(LawnApp& app) {
    std::ofstream log(ModernSmoke::ProbePath("save-definition-reads.txt"));
    Require(bool(log), "Cannot write definition-read evidence");
    unsigned cases = 0, cleanups = 0;
    auto check = [&]<class T>(const char* name, T* definition, void (SaveGameContext::*sync)(T*&)) {
        Require(definition != nullptr, "Definition-read probe requires loaded assets");
        for (auto encoding : {LevelSaveEncoding::Legacy1073, LevelSaveEncoding::Dat64V1}) {
            for (T* initial : {static_cast<T*>(nullptr), definition}) {
                for (bool failed : {false, true}) {
                    for (unsigned length = 0; length <= 4; ++length) {
                        if (!failed && length == 4) continue;
                        SaveGameContext context;
                        context.mReading = true; context.mFailed = failed; context.mEncoding = encoding;
                        context.mBuffer.SetData(Bytes(length, 0));
                        auto* result = initial;
                        (context.*sync)(result);
                        Require(context.mFailed && result == initial && context.mBuffer.mReadBitPos == 0,
                            "Failed definition read changed ownership or read position");
                        log << "case=" << ++cases << " type=" << name << " bytes=" << length
                            << " already-failed=" << failed << " preserved=1\n";
                    }
                }
            }
        }
    };
    check("reanimation", gReanimatorDefArray, &SaveGameContext::SyncReanimationDef);
    check("particle", gParticleDefArray, &SaveGameContext::SyncParticleDef);
    Require(gReanimatorDefArray[0].mTracks.count > 0, "Cleanup control needs nonempty definition zero");
    for (auto encoding : {LevelSaveEncoding::Legacy1073, LevelSaveEncoding::Dat64V1}) {
        for (unsigned length = 0; length < 4; ++length) {
            SaveGameContext context;
            context.mReading = true; context.mFailed = false; context.mEncoding = encoding;
            context.mBuffer.SetData(Bytes(length, 0));
            {
                Reanimation animation;
                SyncReanimation(nullptr, &animation, context);
                Require(context.mFailed && !animation.mDefinition && !animation.mTrackInstances,
                    "Truncated definition published an animation without tracks");
            }
            log << "cleanup=" << ++cleanups << " bytes=" << length << " destroyed=1\n";
        }
    }
    Require(cases == 72 && cleanups == 8, "Definition-read coverage incomplete");  // Trail 定义矩阵已随系统退役
    ModernSmoke::Report("portable-save-definition-72-failed-reads-8-cleanups", app);
}

// Synchronous isolated pool: no ordinary game update is dispatched while the
// app points at it. Definitions/images are the game's real loaded resources.
struct ParticleReadFixture {
    TodParticleData data;
    TodParticleHolder holder;
    EffectSystem& effects;  // 槽位宿主：EffectSystem 三 holder 改 unique_ptr 后不能持有槽位引用
    TodParticleHolder* original;
    TodParticleSystem *system, *other;
    TodParticleEmitter *e0, *e1;
    TodParticle *p0, *p1;
    unsigned ei0, ei1, pi0, pi1;
    explicit ParticleReadFixture(LawnApp& app) :
        holder(&data),
        effects(*app.mEffectSystem), original(effects.mParticleHolder.get()) {
        data.Initialize();
        system=holder.mParticleSystems.DataArrayAlloc();
        other=holder.mParticleSystems.DataArrayAlloc();
        e0=holder.mEmitters.DataArrayAlloc(); e1=holder.mEmitters.DataArrayAlloc();
        p0=holder.mParticles.DataArrayAlloc(); p1=holder.mParticles.DataArrayAlloc();
        ei0=holder.mEmitters.DataArrayGetID(e0); ei1=holder.mEmitters.DataArrayGetID(e1);
        pi0=holder.mParticles.DataArrayGetID(p0); pi1=holder.mParticles.DataArrayGetID(p1);
        effects.mParticleHolder.release();
        effects.mParticleHolder.reset(&holder);  // 装入栈上隔离池（析构 release 归还）
    }
    ~ParticleReadFixture() {
        data.Dispose();
        effects.mParticleHolder.release();       // unique_ptr 不得删除栈上隔离池
        effects.mParticleHolder.reset(original); // 归还原池所有权
    }
    void Dispose() {
        // Do not detach or repair lists in this positive regression. Run the
        // same object/pool destruction order as data.Dispose, checking nodes
        // before allocator FreeAll could conceal an abandoned live node.
        holder.mParticleSystems.DataArrayFreeAll();
        holder.mEmitters.DataArrayFreeAll();
        holder.mParticles.DataArrayFreeAll();
        // 节点分配器已随 TodList 退役删除（2026-10-02）；泄漏防护改由
        // PVZ_*_ROSTER_SHADOW 名册 shadow 承担（集合/悬空三向逐帧对拍）。
        data.Dispose();
    }
};

void CheckParticleDataViews(LawnApp& app) {
    struct DataViews {
        TodParticleData data;
        TodParticleHolder holder{&data},alias{&data};
        DataViews() { data.Initialize(); }
        ~DataViews() { data.Dispose(); }
    } firstViews,secondViews;
    auto& firstData=firstViews.data;
    auto& secondData=secondViews.data;
    auto& first=firstViews.holder;
    auto& second=secondViews.holder;
    auto& alias=firstViews.alias;
    struct Graph {
        TodParticleSystem* system;
        TodParticleEmitter* emitter;
        TodParticle* particle;
    };
    const auto bind=[](TodParticleHolder& holder) {
        auto* system=holder.mParticleSystems.DataArrayAlloc();
        auto* emitter=holder.mEmitters.DataArrayAlloc();
        auto* particle=holder.mParticles.DataArrayAlloc();
        Require(system && emitter && particle,"Cannot allocate borrowed particle-data fixture");
        system->mParticleHolder=&holder;system->mParticleDef=gParticleDefArray;
        emitter->mParticleSystem=system;emitter->mEmitterDef=gParticleDefArray[0].mEmitterDefs;
        particle->mParticleEmitter=emitter;
        Require(system->EmitterRosterAdd(emitter) && emitter->ParticleRosterAdd(particle),
            "Cannot bind borrowed particle-data fixture");
        return Graph{system,emitter,particle};
    };
    const auto a=bind(first),b=bind(second);
    const unsigned systemID=first.mParticleSystems.DataArrayGetID(a.system);
    const unsigned emitterID=first.mEmitters.DataArrayGetID(a.emitter);
    const unsigned particleID=first.mParticles.DataArrayGetID(a.particle);
    Require(systemID==second.mParticleSystems.DataArrayGetID(b.system) &&
        emitterID==second.mEmitters.DataArrayGetID(b.emitter) &&
        particleID==second.mParticles.DataArrayGetID(b.particle) &&
        first.mParticleSystems.mBlock!=second.mParticleSystems.mBlock &&
        first.mEmitters.mBlock!=second.mEmitters.mBlock &&
        first.mParticles.mBlock!=second.mParticles.mBlock,"Independent particle data must collide IDs, not storage");
    const auto requireSecond=[&] {
        Require(second.mParticleSystems.mSize==1 && second.mEmitters.mSize==1 && second.mParticles.mSize==1 &&
            second.mParticleSystems.DataArrayTryToGet(systemID)==b.system &&
            b.system->mParticleHolder==&second && b.system->EmitterRosterCount()==1 &&
            b.system->EmitterRosterEmitterAt(0)==b.emitter && b.emitter->ParticleRosterCount()==1 &&
            b.emitter->ParticleRosterParticleAt(0)==b.particle && b.particle->mParticleEmitter==b.emitter,
            "One particle-data owner changed the other equal-ID graph");
    };
    {
        TodParticleHolder transient(&firstData);
        Require(&transient.mParticleSystems==&first.mParticleSystems && &alias.mEmitters==&first.mEmitters &&
            &alias.mParticles==&first.mParticles && transient.mParticleSystems.DataArrayTryToGet(systemID)==a.system,
            "Borrowed holder did not reuse the supplied DataArrays");
        a.system->mParticleHolder=&alias;
        Require(a.system->EmitterRosterCount()==1 && a.system->EmitterRosterEmitterAt(0)==a.emitter &&
            a.emitter->ParticleRosterCount()==1 && a.emitter->ParticleRosterParticleAt(0)==a.particle,
            "Rebinding a holder view reset the shared data's roster");
        auto* extra=alias.mParticles.DataArrayAlloc();
        Require(extra && first.mParticles.mSize==2,"Alias allocation did not use the shared DataArray");
        first.mParticles.DataArrayFree(extra);
        a.emitter->ParticleRosterRemoveAt(0);
        Require(a.emitter->ParticleRosterCount()==0 && a.emitter->ParticleRosterAdd(a.particle),
            "Alias roster mutation did not remain in the supplied data");
        requireSecond();
        a.system->mParticleHolder=&first;
    }
    Require(first.mParticleSystems.DataArrayTryToGet(systemID)==a.system &&
        a.system->EmitterRosterCount()==1 && a.emitter->ParticleRosterCount()==1,
        "Destroying a borrowed holder released or reset supplied data");
    first.mParticleSystems.DataArrayFree(a.system);
    Require(first.mParticleSystems.mSize==0 && first.mEmitters.mSize==0 && first.mParticles.mSize==0,
        "Borrowed holder cleanup did not release exactly its graph");
    requireSecond();
    auto* replacement=first.mParticleSystems.DataArrayAlloc();
    replacement->mParticleHolder=&first;
    Require(first.mParticleSystems.DataArrayGetID(replacement)!=systemID && replacement->EmitterRosterCount()==0,
        "Reused DataArray slot inherited an old roster");
    firstData.Dispose();
    requireSecond();
    secondData.Dispose();
    Require(!first.mParticleSystems.mBlock && !first.mEmitters.mBlock && !first.mParticles.mBlock &&
        !second.mParticleSystems.mBlock && !second.mEmitters.mBlock && !second.mParticles.mBlock,
        "Particle data owner retained a pool after disposal");
    ModernSmoke::Report("portable-particle-data-two-borrowed-views-reuse-equal-id-isolation",app);
}

void CheckParticleListReads(LawnApp& app) {
    auto* original=app.mEffectSystem->mParticleHolder.get();
    Require(gParticleDefArray && gParticleDefArray[0].mEmitterDefCount>0,
        "Particle read fixture requires loaded definition zero");
    CheckParticleDataViews(app);
    std::ofstream log(ModernSmoke::ProbePath("particle-list-reads.txt"));
    Require(bool(log),"Cannot write particle-list evidence");
    auto writeIDs=[](SaveGameContext& c, const std::vector<unsigned>& ids) {
        int count=static_cast<int>(ids.size()); c.SyncInt(count);
        for(unsigned id:ids)c.SyncBytes(&id,sizeof(id));
    };
    auto emitter=[&](int definition,const std::vector<unsigned>& ids) {
        SaveGameContext c{}; c.SyncInt(definition);
        Image* image=nullptr; c.SyncImage(image); writeIDs(c,ids);
        return c.mBuffer.mData;
    };
    auto wire=[&](const std::vector<unsigned>& ids,const std::vector<Bytes>& children) {
        SaveGameContext c{}; auto* def=gParticleDefArray; c.SyncParticleDef(def);
        writeIDs(c,ids);
        for(const auto& child:children)c.mBuffer.WriteBytes(child.data(),static_cast<int>(child.size()));
        return c.mBuffer.mData;
    };
    unsigned reads=0,disposals=0,rejections=0;
    for(auto encoding:{LevelSaveEncoding::Legacy1073,LevelSaveEncoding::Dat64V1}) {
        for(unsigned cycle=0;cycle<4;++cycle) {
            auto read=[&](TodParticleSystem* system,const Bytes& bytes) {
                SaveGameContext c{}; c.mReading=true; c.mEncoding=encoding;
                c.mBuffer.SetData(bytes); SyncParticleSystem(app.mBoard,system,c); ++reads;
                if(c.mFailed)++rejections;
                return c.mFailed;
            };
            for(unsigned mode=0;mode<10;++mode) {
                ParticleReadFixture f(app);
                std::vector<unsigned> ids{f.ei0,f.ei1};
                auto a=emitter(0,{f.pi0}),b=emitter(0,{f.pi1});
                if(mode==1)ids[1]=f.ei0;
                if(mode==2)ids[1]=0;
                if(mode==3)b=emitter(0,{f.pi0});
                if(mode==4)a=emitter(0,{f.pi0,f.pi0});
                if(mode==5)b=emitter(0,{0});
                if(mode==6)b=emitter(-1,{f.pi1});
                if(mode==7)b.resize(2);
                if(mode==8)Put32(b,4,0xffffffffu); // invalid image resource ID
                if(mode==9)Put32(b,12,3); // bad SyncBytes ID block size
                const auto bytes=wire(ids,{a,b});
                const bool failed=read(f.system,bytes);
                Require(failed==(mode!=0),"Particle ownership input result wrong");
                if(!failed) {
                    Require(f.e0->mParticleSystem==f.system && f.e1->mParticleSystem==f.system &&
                        f.p0->mParticleEmitter==f.e0 && f.p1->mParticleEmitter==f.e1,
                        "Particle ownership pointers were not restored");
                    SaveGameContext output{}; output.mEncoding=encoding;
                    SyncParticleSystem(app.mBoard,f.system,output);
                    Require(!output.mFailed && output.mBuffer.mData==bytes,
                        "Particle save field order or bytes changed");
                } else Require(f.system->EmitterRosterCount()==0,
                    "Failed particle graph published an owning emitter list");
                f.system->ParticleSystemDie();
                Require(f.holder.mEmitters.mSize==(failed?2u:0u) &&
                    f.holder.mParticles.mSize==(failed?2u:0u),
                    "Particle read cleanup released an object more than once");
                f.Dispose(); ++disposals;
                log<<"read="<<reads<<" mode="<<mode<<" rejected="<<failed<<" cleanup=1\n";
            }
            {
                ParticleReadFixture f(app);
                Require(!read(f.system,wire({f.ei0},{emitter(0,{f.pi0})})),"First particle owner failed");
                Require(read(f.other,wire({f.ei0},{emitter(0,{f.pi1})})),"Second system stole emitter ownership");
                Require(f.other->EmitterRosterCount()==0 && f.e0->mParticleSystem==f.system &&
                    f.p0->mParticleEmitter==f.e0,"Failed particle takeover changed existing owner");
                f.system->ParticleSystemDie(); f.other->ParticleSystemDie();
                Require(f.holder.mEmitters.mSize==1 && f.holder.mParticles.mSize==1,
                    "Cross-system ownership cleanup released the wrong objects");
                f.Dispose(); ++disposals;
                log<<"read="<<reads<<" mode=two-systems rejected=1 cleanup=1\n";
            }
        }
    }
    Require(app.mEffectSystem->mParticleHolder.get()==original && reads==96 && disposals==88 && rejections==80,
        "Particle read coverage or original pool restoration incomplete");
    log<<"PASS reads="<<reads<<" rejections="<<rejections<<" disposals="<<disposals<<'\n';
    ModernSmoke::Report("portable-particle-list-96-reads-88-disposals",app);
}

void CheckReanimationTrackReads(LawnApp& app) {
    auto* original=app.mEffectSystem;
    Require(gEffectSystem==original,"Animation read probe requires consistent effect globals");
    std::ofstream log(ModernSmoke::ProbePath("reanimation-track-reads.txt"));
    Require(bool(log),"Cannot write animation track evidence");
    unsigned rejections=0,roundtrips=0;
    struct PrivateEffects {
        LawnApp& app; EffectSystem* old; EffectSystem effects;
        explicit PrivateEffects(LawnApp& a):app(a),old(a.mEffectSystem) {
            gEffectSystem=nullptr;app.mEffectSystem=&effects;
            try { effects.EffectSystemInitialize(); }
            catch (...) { effects.EffectSystemDispose();app.mEffectSystem=old;gEffectSystem=old;throw; }
        }
        ~PrivateEffects() { effects.EffectSystemDispose();app.mEffectSystem=old;gEffectSystem=old; }
    };
    // No scene callbacks or updates run inside these private-pool scopes.
    for(auto encoding:{LevelSaveEncoding::Legacy1073,LevelSaveEncoding::Dat64V1}) {
        PrivateEffects privateEffects(app);
        auto& effects=privateEffects.effects;
        {
            Reanimation source;source.ReanimationInitializeType(0,0,REANIM_SUN);
            const int count=source.mDefinition->mTracks.count;
            Require(count>0,"Animation cleanup fixture has no tracks");
            auto* allocator=FindGlobalAllocator(count*sizeof(ReanimatorTrackInstance));
            auto save=[&]() {
                SaveGameContext c{};c.mEncoding=encoding;SyncReanimation(app.mBoard,&source,c);
                Require(!c.mFailed,"Cannot serialize animation cleanup fixture");return c.mBuffer.mData;
            };
            // A successful stream is first checked without any child IDs, so
            // source and restored objects do not become duplicate child owners.
            const auto plain=save();
            for(bool dead:{false,true}) {
                const auto live=allocator->mTotalItems;
                {
                    Reanimation restored;restored.mDead=dead;restored.mAnimTime=0.375f;
                    restored.mFrameStart=2;restored.mFrameCount=7;
                    SaveGameContext c{};c.mReading=true;c.mEncoding=encoding;c.mBuffer.SetData(plain);
                    SyncReanimation(app.mBoard,&restored,c);
                    Require(!c.mFailed && c.ByteLeftToRead()==0 && restored.mDefinition==source.mDefinition &&
                        restored.mReanimationHolder==effects.mReanimationHolder.get() && restored.mDead==dead &&
                        restored.mAnimTime==0.375f && restored.mFrameStart==2 && restored.mFrameCount==7,
                        "Track read changed outer animation state or lost ownership");
                    SaveGameContext w{};w.mEncoding=encoding;SyncReanimation(app.mBoard,&restored,w);
                    Require(!w.mFailed && w.mBuffer.mData==plain,"Actual animation track bytes changed");
                    ++roundtrips;
                }
                Require(allocator->mTotalItems==live,"Successful track stream leaked storage");
            }
            auto* child=app.AddReanimation(0,0,0,REANIM_SUN);
            Require(child!=nullptr,"Cannot allocate child animation fixture");
            const auto childID=app.ReanimationGetID(child);
            AttachReanim(source.mTrackInstances[0].mAttachmentID,child,0,0);
            const auto attachment=source.mTrackInstances[0].mAttachmentID;
            const auto wire=save();
            const size_t stride=encoding==LevelSaveEncoding::Dat64V1?112:96;
            const size_t imageOffset=8+size_t(count)*stride;
            Require(wire.size()==imageOffset+size_t(count)*4,"Unexpected animation substream layout");
            const auto live=allocator->mTotalItems;
            auto reject=[&](const char* name,const Bytes& bytes,bool prefailed=false) {
                {
                    Reanimation restored;
                    SaveGameContext c{};c.mReading=true;c.mFailed=prefailed;c.mEncoding=encoding;c.mBuffer.SetData(bytes);
                    SyncReanimation(app.mBoard,&restored,c);
                    Require(c.mFailed && !restored.mDefinition && !restored.mTrackInstances && !restored.mReanimationHolder,
                        "Failed track read published a partial animation");
                }
                auto* carrier=effects.mAttachmentHolder->mAttachments.DataArrayTryToGet(unsigned(attachment));
                Require(allocator->mTotalItems==live && app.ReanimationTryToGet(childID)==child && !child->mDead &&
                    carrier && !carrier->mDead && source.mTrackInstances[0].mAttachmentID==attachment,
                    "Failed track read leaked memory or destroyed a borrowed child ID");
                log<<"case="<<++rejections<<" encoding="<<int(encoding)<<" kind="<<name
                    <<" bytes="<<bytes.size()<<" child-alive=1 live-allocations="<<live<<'\n';
            };
            for(size_t length=0;length<wire.size();++length) {
                auto bytes=wire;bytes.resize(length);reject("truncated",bytes);
            }
            for(int track=0;track<count;++track) {
                auto bytes=wire;Put32(bytes,imageOffset+size_t(track)*4,0xffffffffu);reject("image-id",bytes);
            }
            for(unsigned size:{0u,4u,unsigned(count*stride-1),unsigned(count*stride+1),0xffffffffu}) {
                auto bytes=wire;Put32(bytes,4,size);reject("track-block-length",bytes);
            }
            reject("prefailed",wire,true);
            SaveGameContext overwrite{};overwrite.mReading=true;overwrite.mEncoding=encoding;overwrite.mBuffer.SetData(wire);
            bool reported=false;
            try { SyncReanimation(app.mBoard,&source,overwrite); }
            catch(const std::logic_error&) { reported=true; }
            Require(reported && !overwrite.mFailed && overwrite.mBuffer.mReadBitPos==0 && !child->mDead &&
                allocator->mTotalItems==live,"Overwriting a live animation did not expose caller misuse without mutation");
        }
        effects.ProcessDeleteQueue();
        Require(effects.mReanimationHolder->mReanimations.mSize==0 && effects.mAttachmentHolder->mAttachments.mSize==0,
            "Animation source cleanup left its real child or attachment behind");
    }
    Require(app.mEffectSystem==original && gEffectSystem==original && roundtrips==4 && rejections>0,
        "Animation track probe did not restore original effect system");
    log<<"PASS rejections="<<rejections<<" roundtrips="<<roundtrips<<" private-pools=2\n";
    ModernSmoke::Report("portable-reanimation-track-failures-real-child-preserved",app);
}
}
void PortablePoolReadSmoke(LawnApp& app){
    Require(getenv("PVZ_MODERN_HIDDEN")&&getenv("PVZ_APPDATA_DIR")&&app.mBoard,"Pool read probe needs hidden isolated gameplay");
    const auto beforePath=ModernSmoke::ProbePath("pool-state-before.dat64");
    const auto afterPath=ModernSmoke::ProbePath("pool-state-after.dat64");
    Require(LawnSaveGame(app.mBoard,beforePath),"Cannot save pool baseline");
    const Bytes before=Read(app,beforePath);
    CheckDefinitionReads(app);
    CheckParticleListReads(app);
    CheckReanimationTrackReads(app);
    const auto probesPath=ModernSmoke::ProbePath("pool-state-after-probes.dat64");
    Require(LawnSaveGame(app.mBoard,probesPath) && Read(app,probesPath)==before,
        "Isolated ownership probes modified active board state");
    const size_t pool=LevelSaveFormat::DAT64_HEADER_SIZE+4+LevelSaveFormat::DAT64_BOARD_STATE_SIZE;
    constexpr auto& zombieLayout=LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::Zombie);
    constexpr size_t stride=zombieLayout.mDat64ArraySlotSize;
    const unsigned used=Read32(before,pool+4),size=Read32(before,pool+8);
    Require(used>0&&size>0&&Read32(before,pool+12)==used*stride,"Expected live zombie pool fixture");
    unsigned active=0;while(active<used&&!(Read32(before,pool+16+active*stride+zombieLayout.mDat64Size)&DATA_ARRAY_KEY_MASK))++active;
    Require(active<used,"Zombie pool has no active record");
    std::ofstream log(ModernSmoke::ProbePath("pool-read-rejections.txt"));Require(bool(log),"Cannot write pool rejection evidence");
    unsigned cases=0;
    auto check=[&](const char* name,Bytes bytes){
        // Repair the outer size and CRC deliberately: this must reach the
        // actual pool reader, not merely the existing outer-file CRC check.
        const auto length=bytes.size()-LevelSaveFormat::DAT64_HEADER_SIZE;
        Put32(bytes,24,unsigned(length));Put32(bytes,28,0);
        Put32(bytes,32,crc32(0,bytes.data()+LevelSaveFormat::DAT64_HEADER_SIZE,static_cast<uInt>(length)));
        const auto path=ModernSmoke::ProbePath("pool-invalid-"+std::to_string(++cases)+".dat64");
        Sexy::Buffer buffer;buffer.SetData(bytes);Require(app.WriteBufferToFile(path,&buffer),"Cannot write invalid pool fixture");
        const bool rejected=!LawnLoadGame(app.mBoard,path);
        Require(rejected,"Structurally invalid pool accepted");
        Require(LawnSaveGame(app.mBoard,afterPath),"Rejected pool damaged writable board state");
        const bool unchanged=Read(app,afterPath)==before;
        log<<"case="<<cases<<" name="<<name<<" rejected="<<rejected<<" full-save-unchanged="<<unchanged<<std::endl;
        Require(unchanged,"First-pool rejection modified serialized game state");
    };
    auto field=[&](const char* name,size_t offset,unsigned value){auto bytes=before;Put32(bytes,offset,value);check(name,std::move(bytes));};
    for(unsigned n:{app.mBoard->mZombies.mMaxSize+1,0x80000000u,0xffffffffu})field("used-over-capacity",pool+4,n);
    field("free-head-over-used",pool,used+1);
    field("active-count-over-used",pool+8,used+1);
    field("wrong-block-length",pool+12,Read32(before,pool+12)+1);
    for(size_t bytesToKeep:{size_t(0),size_t(3),size_t(used*stride-1)}){
        auto bytes=before;bytes.resize(pool+16+bytesToKeep);check("truncated-block",std::move(bytes));
    }
    const size_t idAt=pool+16+active*stride+zombieLayout.mDat64Size;
    field("active-id-wrong-index",idAt,(Read32(before,idAt)&DATA_ARRAY_KEY_MASK)|((active+1)&DATA_ARRAY_INDEX_MASK));
    field("missing-active-id",idAt,0);
    size_t next=pool;
    for(unsigned index=0;index<11;++index){
        const unsigned block=Read32(before,next+12),count=Read32(before,next+4);
        if(index){
            // Failure in every later pool must also precede mutation of the
            // already-valid earlier pools. No repair/rollback in this fixture.
            field("later-pool-used-over-capacity",next+4,0xffffffffu);
            field("later-pool-free-head-over-used",next,count+1);
            field("later-pool-wrong-block-length",next+12,block+1);
        }
        next+=16+block;
    }
    Require(cases==41,"Pool rejection coverage incomplete");
    ModernSmoke::Report("portable-pool-read-41-rejections-all-11-pools-unchanged-save",app);
}
