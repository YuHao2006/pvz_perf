#include "SexyAppFramework/misc/Buffer.h"
#include "Sexy.TodLib/DefinitionCacheReader.h"
#include <array>
#include <bit>
#include <cstdio>
#include <limits>

namespace {
unsigned checks=0,wires=0,blocks=0,utf8=0,views=0;
class ProbeError final : public std::exception {};
void Check(bool ok) {
    ++checks;
    if(!ok)throw ProbeError{};
}
std::uint32_t Next(std::uint32_t& state) {
    state^=state<<13;state^=state>>17;state^=state<<5;return state;
}
void BitWires() {
    using namespace Sexy;
    std::uint32_t random=0x1073;
    for(unsigned round=0;round<128;++round)for(int prefix=0;prefix<8;++prefix)for(int width=0;width<=32;++width) {
        const auto value=Next(random);
        Buffer buffer;buffer.WriteNumBits(0x55,prefix);buffer.WriteNumBits(std::bit_cast<int>(value),width);
        ByteVector expected((prefix+width+7)/8);
        for(int bit=0;bit<prefix;++bit)if((0x55>>bit)&1)expected[bit/8]|=uchar(1u<<(bit%8));
        for(int bit=0;bit<width;++bit)if((value>>bit)&1)expected[(prefix+bit)/8]|=uchar(1u<<((prefix+bit)%8));
        Check(buffer.mData==expected&&buffer.mDataBitSize==prefix+width);
        const auto mask=width==32?0xffffffffu:(1u<<width)-1;
        buffer.mReadBitPos=prefix;
        Check(static_cast<unsigned>(buffer.ReadNumBits(width,false))==(value&mask));
        Check(buffer.mReadBitPos==prefix+width);++wires;
    }
}
void BlockReads() {
    using namespace Sexy;
    std::uint32_t random=0x19661010;
    for(int prefix=0;prefix<8;++prefix)for(unsigned length=0;length<65;++length) {
        ByteVector bytes(length);for(auto& byte:bytes)byte=uchar(Next(random));
        Buffer buffer;buffer.WriteNumBits(0x55,prefix);buffer.WriteBuffer(bytes);buffer.mReadBitPos=prefix;
        ByteVector output{7,8};buffer.ReadBuffer(&output);
        Check(output==bytes&&buffer.mReadBitPos==buffer.mDataBitSize);++blocks;
        for(size_t retained=0;retained<buffer.mData.size();++retained) {
            Buffer truncated;truncated.SetData(ByteVector(buffer.mData.begin(),buffer.mData.begin()+retained));
            truncated.mReadBitPos=prefix;output={7,8};bool rejected=false;
            try {truncated.ReadBuffer(&output);}
            catch(const BufferError& error) {
                Check(error.operation==BufferOperation::ReadBuffer&&
                    (error.reason==BufferFailure::TruncatedLength||error.reason==BufferFailure::TruncatedPayload));
                rejected=true;
            }
            Check(rejected&&output==ByteVector({7,8})&&truncated.mReadBitPos==prefix);++blocks;
        }
    }
    for(unsigned round=0;round<4096;++round) {
        const unsigned length=4+Next(random)%61;
        ByteVector bytes(length);for(auto& byte:bytes)byte=uchar(Next(random));
        const auto count=Next(random);
        for(unsigned i=0;i<4;++i)bytes[i]=uchar(count>>(i*8));
        Buffer buffer;buffer.SetData(bytes);ByteVector output{9};bool rejected=false;
        try {buffer.ReadBuffer(&output);}
        catch(const BufferError& error) {
            Check(error.operation==BufferOperation::ReadBuffer&&error.reason==BufferFailure::TruncatedPayload);
            rejected=true;
        }
        if(count>length-4)Check(rejected&&output==ByteVector{9}&&buffer.mReadBitPos==0);
        else Check(!rejected&&output==ByteVector(bytes.begin()+4,bytes.begin()+4+count));
        ++blocks;
    }
}
void Utf8Reads() {
    using namespace Sexy;
    const std::array<ByteVector,8> tails={{
        {0x80},{0xc0,0x80},{0xc2},{0xed,0xa0,0x80},
        {0xf4,0x90,0x80,0x80},{0xe2,0x28,0xa1},{0xef,0xbf,0xbe},{0xff}
    }};
    for(unsigned prefix=0;prefix<64;++prefix)for(const auto& tail:tails) {
        ByteVector bytes(prefix,0x41);bytes.insert(bytes.end(),tail.begin(),tail.end());
        Buffer buffer;buffer.SetData(bytes);bool rejected=false;
        try {buffer.UTF8ToWideString();}
        catch(const UTF8DecodeError& error) {Check(error.byteOffset==prefix);rejected=true;}
        Check(rejected&&buffer.mData==bytes);++utf8;
    }
    for(unsigned value=0;value<128;++value) {
        Buffer buffer;buffer.SetData(ByteVector{uchar(value)});
        Check(buffer.UTF8ToWideString()==std::wstring(1,wchar_t(value)));++utf8;
    }
}
void BoundedViews() {
    const std::array<std::uint8_t,64> payload{};
    for(size_t size=0;size<=payload.size();++size)for(size_t prefix=0;prefix<=size;++prefix)for(size_t tail=0;tail<67;++tail) {
        DefinitionCacheReader reader(payload.data(),size);
        Check(reader.Take(prefix)==reinterpret_cast<const char*>(payload.data()));
        const auto* result=reader.Take(tail);
        if(tail<=size-prefix)Check(result&&reader.mPosition==prefix+tail&&reader.mError==DefinitionReadFailure::None);
        else Check(!result&&reader.mPosition==prefix&&reader.mError==DefinitionReadFailure::PayloadBounds);
        ++views;
    }
}
}
int main() {
    try {BitWires();BlockReads();Utf8Reads();BoundedViews();}
    catch(...) {std::fprintf(stderr,"%u\n",checks);return 1;}
    std::printf("%u %u %u %u %u\n",wires,blocks,utf8,views,checks);
    return 0;
}
