#include "ImageDiagnostics.h"
#include "SexyAppFramework/imagelib/ImageLib.h"
#include "RenderInterface.h"
#include <fstream>

namespace Sexy {
namespace {
std::string Html(const std::string& value) {
    std::string out;
    for(char c:value)switch(c) {
        case '&':out+="&amp;";break;case '<':out+="&lt;";break;case '>':out+="&gt;";break;
        case '"':out+="&quot;";break;case '\'':out+="&#39;";break;default:out+=c;
    }
    return out;
}
std::filesystem::path NewDirectory(const std::filesystem::path& root) {
    std::filesystem::create_directories(root);
    for(uint64_t n=1;;n=AddImageBytes(n,1)) {
        const auto path=root/("dump-"+std::to_string(n));
        if(std::filesystem::create_directory(path))return path;
    }
}
}
ImageCpuUsage MeasureDecodedImageCpuUsage(const ImageLib::Image* image) {
    if(!image)return {};
    ImageCpuUsage usage;
    if(image->mBits) {
        const auto capacity=uint64_t(image->mPixelCapacity);
        usage.bits=AddImageBytes(capacity,capacity);
        usage.bits=AddImageBytes(usage.bits,usage.bits);
    }
    for(const auto* layer:image->mAlphaLayers)
        if(layer)
            usage.bits=AddImageBytes(usage.bits,MeasureDecodedImageCpuUsage(layer).Total());
    return usage;
}
void AppendAtlasTextureDiagnostics(RenderInterface& render,
    std::vector<ImageDiagnosticRecord>& records,bool includePixels) {
    if(includePixels && render.mSceneBegun)
        throw std::logic_error("Atlas diagnostic readback requires Flush");
    for(const auto& [texture,dimensions]:render.mAtlasTextures) {
        ImageDiagnosticRecord record;
        record.path="<definition atlas>";
        record.width=dimensions[0];record.height=dimensions[1];
        record.traits="renderer-owned definition atlas";
        record.path="<definition atlas slot "+std::to_string(GpuRenderer::SlotOf(texture))+">";
        record.gpuTexels=ImageTexelBytes(record.width,record.height);
        if(!includePixels)record.pixelStatus="metadata only";
        else {
            record.pixels=render.mRenderer->ReadTexturePixels(texture);
            if(record.pixels->width!=record.width || record.pixels->height!=record.height)
                throw std::logic_error("Atlas diagnostic snapshot dimensions disagree");
            record.pixelStatus="native definition atlas GPU";
        }
        records.push_back(std::move(record));
    }
}
std::string DescribeImageDiagnostics(const std::vector<ImageDiagnosticRecord>& records) {
    const auto totals=CountImageDiagnostics(records);
    std::ostringstream text;
    text<<"Registered images: "<<totals.images<<"\r\n"
        <<"CPU pixel/storage buffers: "<<totals.cpu<<" bytes\r\n"
        <<"Resident image texel payload: "<<totals.gpuTexels<<" bytes\r\n"
        <<"Images with GPU payload: "<<totals.texturedImages<<"\r\n\r\n"
        <<"GPU payload includes owned whole-image texels, definition atlases and the logical screen.\r\n"
        <<"Filter aliases share their owner's texture and add no texel payload.\r\n"
        <<"It excludes driver alignment, retired textures, swapchains and scaling intermediates.\r\n"
        <<"This is not the process RAM usage or a measured VRAM budget.";
    return text.str();
}
std::filesystem::path WriteImageDiagnosticDump(const std::filesystem::path& root,
    const std::vector<ImageDiagnosticRecord>& records) {
    // A unique directory avoids deleting previous evidence or overwriting files.
    // Filesystem failures propagate; there is no Sleep/retry-until-success loop.
    const auto directory=NewDirectory(root);
    std::ostringstream rows;
    size_t number=0,exported=0;
    for(const auto& record:records) {
        rows<<"<tr><td>";
        if(record.pixels) {
            const auto& image=*record.pixels;
            if(image.width!=record.width || image.height!=record.height || image.width<=0 || image.height<=0 ||
                image.pixels.size()!=uint64_t(image.width)*image.height)
                throw std::logic_error("Diagnostic snapshot dimensions disagree");
            const auto full="img"+std::to_string(number)+".png",thumb="thumb"+std::to_string(number)+".png";
            ImagePixels thumbnail(64,64);
            for(int y=0;y<64;++y)for(int x=0;x<64;++x) {
                const auto sx=uint64_t(2*x+1)*image.width/128,sy=uint64_t(2*y+1)*image.height/128;
                thumbnail.pixels[size_t(y)*64+x]=image.pixels[sy*image.width+sx];
            }
            if(!ImageLib::WritePNGImage((directory/full).string(),image.width,image.height,image.pixels) ||
                !ImageLib::WritePNGImage((directory/thumb).string(),64,64,thumbnail.pixels))
                throw std::runtime_error("Cannot encode diagnostic PNG in "+directory.string());
            rows<<"<a href=\""<<full<<"\"><img src=\""<<thumb<<"\" width=\"64\" height=\"64\"></a>";
            ++exported;
        } else rows<<"No pixel snapshot";
        rows<<"</td><td>"<<record.width<<" x "<<record.height<<"</td><td>"<<record.cpu.Total()
            <<"</td><td>"<<record.gpuTexels<<"</td><td>"<<Html(record.traits)<<"</td><td>"
            <<Html(record.pixelStatus)<<"</td><td>"<<Html(record.path)<<"</td></tr>\n";
        ++number;
    }
    // Publish the index only after every requested image was encoded.
    std::ofstream html(directory/"imagelist.html",std::ios::binary);
    html.exceptions(std::ios::badbit|std::ios::failbit);
    html<<"<!doctype html><meta charset=\"utf-8\"><title>Image diagnostics</title>"
        <<"<h1>Image diagnostics</h1><pre>"<<Html(DescribeImageDiagnostics(records))<<"</pre>"
        <<"<table border=\"1\"><tr><th>Image</th><th>Size</th><th>CPU bytes</th>"
        <<"<th>GPU texel bytes</th><th>Flags</th><th>Snapshot</th><th>Resource</th></tr>"
        <<rows.str()<<"</table>\n";
    html.close();
    std::ofstream complete(directory/"complete.txt",std::ios::binary);
    complete.exceptions(std::ios::badbit|std::ios::failbit);
    complete<<"images="<<records.size()<<" exported="<<exported<<"\n";complete.close();
    return directory;
}
}
