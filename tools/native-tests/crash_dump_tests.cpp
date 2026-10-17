#include "SexyAppFramework/misc/Win32CrashDump.h"
#include <DbgHelp.h>
#include <cstdio>
#include <cstring>
#include <vector>

namespace {
constexpr DWORD code=0xE0421073;
constexpr ULONG_PTR payload=0x12345678ABCDEF00ULL;
bool written=false;
DWORD writeError=0;
void* exceptionAddress=nullptr;
LONG Record(EXCEPTION_POINTERS* exception,const char* path) {
    exceptionAddress=exception->ExceptionRecord->ExceptionAddress;
    written=Sexy::WriteCurrentProcessMinidump(path,exception);
    writeError=GetLastError();
    return EXCEPTION_EXECUTE_HANDLER;
}
void Capture(const char* path) {
    __try { const ULONG_PTR args[]={payload}; RaiseException(code,0,1,args); }
    __except(Record(GetExceptionInformation(),path)) {}
}
}
int main() {
    // Deliberately handle a test-only exception. No game, window, or WER crash.
    Capture("crash-dump-regression.dmp");
    if(!written) { fprintf(stderr,"dump failed: %08lX\n",writeError); return 1; }
    FILE* file=nullptr;
    if(fopen_s(&file,"crash-dump-regression.dmp","rb")!=0) return 2;
    fseek(file,0,SEEK_END); const auto length=ftell(file); rewind(file);
    std::vector<unsigned char> bytes(length>0?size_t(length):0);
    const auto got=fread(bytes.data(),1,bytes.size(),file); fclose(file);
    if(got!=bytes.size() || bytes.size()<sizeof(MINIDUMP_HEADER)) return 3;
    auto* header=reinterpret_cast<const MINIDUMP_HEADER*>(bytes.data());
    if(header->Signature!=MINIDUMP_SIGNATURE) return 4;
    bool found=false;
    for(unsigned i=0;i<header->NumberOfStreams;++i) {
        const size_t offset=header->StreamDirectoryRva+i*sizeof(MINIDUMP_DIRECTORY);
        if(offset+sizeof(MINIDUMP_DIRECTORY)>bytes.size()) return 5;
        const auto* entry=reinterpret_cast<const MINIDUMP_DIRECTORY*>(bytes.data()+offset);
        if(entry->StreamType!=ExceptionStream) continue;
        if(entry->Location.Rva+sizeof(MINIDUMP_EXCEPTION_STREAM)>bytes.size()) return 6;
        const auto* stream=reinterpret_cast<const MINIDUMP_EXCEPTION_STREAM*>(bytes.data()+entry->Location.Rva);
        const auto& record=stream->ExceptionRecord;
        if(stream->ThreadId!=GetCurrentThreadId() || record.ExceptionCode!=code ||
            record.ExceptionAddress!=reinterpret_cast<ULONG64>(exceptionAddress) ||
            record.NumberParameters!=1 || record.ExceptionInformation[0]!=payload) return 7;
        if(stream->ThreadContext.Rva+stream->ThreadContext.DataSize>bytes.size() ||
            stream->ThreadContext.DataSize<sizeof(CONTEXT)) return 8;
        found=true;
    }
    if(!found) return 9;
    // An invalid destination must report failure, never a fake success.
    Capture("missing-crash-test-directory/crash.dmp");
    if(written || writeError!=ERROR_PATH_NOT_FOUND) return 10;
    printf("PASS SDK x64 ABI, original exception/thread/address/payload/context, I/O error; bytes=%zu\n",bytes.size());
    return 0;
}
