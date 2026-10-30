#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <evntrace.h>
#include <evntcons.h>
#include <tlhelp32.h>
#include <array>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <string>
#include <unordered_set>
#include <vector>

namespace {
constexpr GUID ThreadProvider{0x3d6fa8d1,0xfe05,0x11d0,{0x9d,0xda,0x00,0xc0,0x4f,0xd7,0xba,0x7c}};
struct Slice { unsigned int core; long long begin, end; };
struct Running { long long begin=0; bool known=false, target=false; };
struct Decoder {
    DWORD pid;
    unsigned long long mask;
    std::unordered_set<DWORD> threads;
    std::array<Running,256> running{};
    std::vector<Slice> slices;
    bool failed=false;
};

void WINAPI Decode(EVENT_RECORD* event) noexcept {
    auto& state=*static_cast<Decoder*>(event->UserContext);
    try {
        if (!IsEqualGUID(event->EventHeader.ProviderId,ThreadProvider)) return;
        const unsigned int opcode=event->EventHeader.EventDescriptor.Opcode;
        if (event->UserDataLength<8) return;
        DWORD first,second;
        std::memcpy(&first,event->UserData,4);
        std::memcpy(&second,static_cast<const char*>(event->UserData)+4,4);
        if (opcode==1 || opcode==3 || opcode==4) {
            // Thread Start/DCStart/DCEnd begins with ProcessId, ThreadId.
            if (first==state.pid) state.threads.insert(second);
            else if(opcode!=4) state.threads.erase(second);
            return;
        }
        if (opcode==2) { state.threads.erase(second); return; }
        if (opcode!=36) return; // Classic Thread/CSwitch: NewThreadId, OldThreadId.
        const unsigned int core=(event->EventHeader.Flags & EVENT_HEADER_FLAG_PROCESSOR_INDEX)
            ? event->BufferContext.ProcessorIndex : event->BufferContext.ProcessorNumber;
        if (core>=state.running.size() || core>=64 || !(state.mask & (1ull<<core))) return;
        auto& running=state.running[core];
        const auto now=event->EventHeader.TimeStamp.QuadPart;
        if (!running.known && state.threads.contains(second))
            state.slices.push_back({core,0,now}); // Clip to the observer's first sample boundary.
        if (running.known && running.target && now>running.begin)
            state.slices.push_back({core,running.begin,now});
        running={now,true,state.threads.contains(first)};
    } catch (...) { state.failed=true; }
}

std::vector<unsigned char> Properties(const std::wstring& session,const std::wstring& path) {
    std::vector<unsigned char> storage(sizeof(EVENT_TRACE_PROPERTIES)+
        (session.size()+path.size()+2)*sizeof(wchar_t));
    auto& p=*reinterpret_cast<EVENT_TRACE_PROPERTIES*>(storage.data());
    p.Wnode.BufferSize=static_cast<ULONG>(storage.size());
    p.Wnode.Flags=WNODE_FLAG_TRACED_GUID;
    p.Wnode.ClientContext=1; // Raw QueryPerformanceCounter timestamps.
    // GUID_NULL requests an independent session GUID. SystemTraceControlGuid
    // is reserved for the legacy "NT Kernel Logger" session name.
    p.LogFileMode=EVENT_TRACE_FILE_MODE_SEQUENTIAL|EVENT_TRACE_SYSTEM_LOGGER_MODE;
    p.EnableFlags=EVENT_TRACE_FLAG_PROCESS|EVENT_TRACE_FLAG_THREAD|EVENT_TRACE_FLAG_CSWITCH;
    p.BufferSize=64;p.MinimumBuffers=64;p.MaximumBuffers=256;p.FlushTimer=1;
    p.LoggerNameOffset=sizeof(EVENT_TRACE_PROPERTIES);
    p.LogFileNameOffset=p.LoggerNameOffset+static_cast<ULONG>((session.size()+1)*sizeof(wchar_t));
    std::memcpy(storage.data()+p.LoggerNameOffset,session.c_str(),(session.size()+1)*sizeof(wchar_t));
    std::memcpy(storage.data()+p.LogFileNameOffset,path.c_str(),(path.size()+1)*sizeof(wchar_t));
    return storage;
}
}

int wmain(int argc,wchar_t** argv) {
    if(argc!=4) {std::cerr<<"Usage: process_core_trace PID core-mask output-directory\n";return 2;}
    Decoder decoder{static_cast<DWORD>(std::stoul(argv[1])),std::stoull(argv[2],nullptr,0)};
    HANDLE token=nullptr;
    if(OpenProcessToken(GetCurrentProcess(),TOKEN_ADJUST_PRIVILEGES|TOKEN_QUERY,&token)) {
        TOKEN_PRIVILEGES privilege{};privilege.PrivilegeCount=1;
        LookupPrivilegeValueW(nullptr,L"SeSystemProfilePrivilege",&privilege.Privileges[0].Luid);
        privilege.Privileges[0].Attributes=SE_PRIVILEGE_ENABLED;
        AdjustTokenPrivileges(token,FALSE,&privilege,0,nullptr,nullptr);
        CloseHandle(token);
    }
    const std::filesystem::path directory(argv[3]);
    std::filesystem::create_directories(directory);
    const auto etl=directory/L"process-core.etl";
    const auto session=L"PvZCore-"+std::to_wstring(GetCurrentProcessId())+L"-"+std::to_wstring(GetTickCount64());
    HANDLE snapshot=CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD,0);
    THREADENTRY32 entry{sizeof(entry)};
    if(snapshot==INVALID_HANDLE_VALUE) return 3;
    if(Thread32First(snapshot,&entry)) do {
        if(entry.th32OwnerProcessID==decoder.pid) decoder.threads.insert(entry.th32ThreadID);
    } while(Thread32Next(snapshot,&entry));
    CloseHandle(snapshot);
    auto storage=Properties(session,etl.wstring());
    auto* properties=reinterpret_cast<EVENT_TRACE_PROPERTIES*>(storage.data());
    TRACEHANDLE recording=0;
    const auto started=StartTraceW(&recording,session.c_str(),properties);
    if(started!=ERROR_SUCCESS) {
        std::cerr<<"ETW StartTrace failed: "<<started;
        if(started==ERROR_ACCESS_DENIED || started==ERROR_PRIVILEGE_NOT_HELD)
            std::cerr<<". Kernel context-switch tracing requires an Administrator measurement console.";
        else if(started==ERROR_INVALID_PARAMETER)
            std::cerr<<". Invalid ETW session configuration; no recording was started.";
        std::cerr<<'\n';
        return 4;
    }
    LARGE_INTEGER frequency{};QueryPerformanceFrequency(&frequency);
    std::cout<<"READY "<<frequency.QuadPart<<std::endl;
    std::string command;
    std::getline(std::cin,command); // Parent closes or sends STOP; never polls during capture.
    LARGE_INTEGER stopTime{};QueryPerformanceCounter(&stopTime);
    const auto stopped=ControlTraceW(recording,session.c_str(),properties,EVENT_TRACE_CONTROL_STOP);
    if(stopped!=ERROR_SUCCESS) {std::cerr<<"ETW stop failed: "<<stopped<<'\n';return 5;}
    if(properties->EventsLost || properties->LogBuffersLost || properties->RealTimeBuffersLost) {
        std::cerr<<"ETW events/buffers lost; per-core results are not valid.\n";return 6;
    }
    EVENT_TRACE_LOGFILEW log{};
    auto name=etl.wstring();log.LogFileName=name.data();
    log.ProcessTraceMode=PROCESS_TRACE_MODE_EVENT_RECORD|PROCESS_TRACE_MODE_RAW_TIMESTAMP;
    log.EventRecordCallback=&Decode;log.Context=&decoder;
    TRACEHANDLE consumer=OpenTraceW(&log);
    if(consumer==INVALID_PROCESSTRACE_HANDLE) {std::cerr<<"OpenTrace failed\n";return 7;}
    const auto processed=ProcessTrace(&consumer,1,nullptr,nullptr);
    CloseTrace(consumer);
    if(processed!=ERROR_SUCCESS || decoder.failed || log.EventsLost) {
        std::cerr<<"ETW decode failed/lost data: "<<processed<<'\n';return 8;
    }
    for(unsigned int core=0;core<decoder.running.size();++core) {
        const auto& running=decoder.running[core];
        if(running.known && running.target && stopTime.QuadPart>running.begin)
            decoder.slices.push_back({core,running.begin,stopTime.QuadPart});
    }
    std::ofstream output(directory/L"process-core-slices.csv");
    output<<"core,begin_qpc,end_qpc\n";
    for(const auto& slice:decoder.slices) output<<slice.core<<','<<slice.begin<<','<<slice.end<<'\n';
    if(!output) return 9;
    std::cout<<"COMPLETE "<<decoder.slices.size()<<std::endl;
    return 0;
}
