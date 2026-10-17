#pragma once
#include <windows.h>
#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <span>
#include <stdexcept>
#include <string_view>

namespace Sexy::DemoTools {
enum class DialogKind { Markers, JumpTime };
inline constexpr std::size_t DialogTemplateCapacity=1024;

class DialogTemplateWriter {
    std::span<std::byte> storage;
    std::size_t used=0;
public:
    explicit DialogTemplateWriter(std::span<std::byte> bytes):storage(bytes) {
        if(reinterpret_cast<std::uintptr_t>(bytes.data())%alignof(DWORD)!=0)
            throw std::invalid_argument("Unaligned demo dialog storage");
        std::fill(storage.begin(),storage.end(),std::byte{});
    }
    void Bytes(const void* data,std::size_t size) {
        if(used>storage.size() || size>storage.size()-used)
            throw std::length_error("Demo dialog template exceeds its storage");
        if(size) std::memcpy(storage.data()+used,data,size);
        used+=size;
    }
    void Word(WORD value){Bytes(&value,sizeof(value));}
    void Text(std::wstring_view value){Bytes(value.data(),value.size()*sizeof(wchar_t));Word(0);}
    void Align(){used=(used+3)&~std::size_t(3);}
    void Item(short x,short y,short width,short height,WORD id,DWORD style,
        WORD windowClass,std::wstring_view title,DWORD extendedStyle=0) {
        Align();
        const DLGITEMTEMPLATE item{style,extendedStyle,x,y,width,height,id};
        Bytes(&item,sizeof(item));
        Word(0xffff);Word(windowClass);Text(title);
        Align();Word(0); // Creation data, zero length; next item aligns separately.
    }
};

// Build exactly the old Win32 layouts. Align OFFSETS, not a pointer narrowed
// through ULONG (which is still 32 bits on Windows x64). The caller owns the
// storage throughout DialogBoxIndirect; no GlobalLock/GlobalFree pair is needed.
inline LPCDLGTEMPLATE BuildDialogTemplate(std::span<std::byte> storage,DialogKind kind) {
    static_assert(sizeof(DLGTEMPLATE)==18 && sizeof(DLGITEMTEMPLATE)==18 && sizeof(wchar_t)==2);
    DialogTemplateWriter writer(storage);
    const bool markers=kind==DialogKind::Markers;
    DLGTEMPLATE dialog{};
    dialog.style=WS_POPUP|WS_BORDER|WS_SYSMENU|DS_MODALFRAME|WS_CAPTION|DS_SETFONT;
    dialog.cdit=markers?1:3;dialog.x=10;dialog.y=10;dialog.cx=200;dialog.cy=markers?200:50;
    writer.Bytes(&dialog,sizeof(dialog));
    writer.Word(0);writer.Word(0); // No menu; default dialog class.
    writer.Text(markers?L"Marker List":L"Jump To Time");
    writer.Word(8);writer.Text(L"Tahoma");
    if(markers) {
        writer.Item(5,5,190,195,100,WS_VISIBLE|WS_CHILD|WS_VSCROLL|WS_HSCROLL|LBS_NOTIFY,
            0x0083,L"",WS_EX_CLIENTEDGE);
    } else {
        writer.Item(5,5,190,15,100,WS_VISIBLE|WS_CHILD,0x0081,L"",WS_EX_CLIENTEDGE);
        writer.Item(30,25,60,15,IDOK,WS_VISIBLE|WS_CHILD|BS_DEFPUSHBUTTON,0x0080,L"Ok");
        writer.Item(100,25,60,15,IDCANCEL,WS_VISIBLE|WS_CHILD,0x0080,L"Cancel");
    }
    return reinterpret_cast<LPCDLGTEMPLATE>(storage.data());
}
}
