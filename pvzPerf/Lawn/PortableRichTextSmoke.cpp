#include "Sexy.TodLib/generated/EntityStrings.h"
#include "PortableRichTextSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Plant.h"
#include "Zombie.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "graphics/Font.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include <array>
#include <cstdlib>
#include <fstream>
#include <stdexcept>
#include <vector>

namespace {
using namespace Sexy;
void Require(bool value,const char* message){if(!value)throw std::runtime_error(message);}
struct RestoreFormats {
    TodStringListFormat* formats=gTodStringFormats;int count=gTodStringFormatCount;
    ~RestoreFormats(){gTodStringFormats=formats;gTodStringFormatCount=count;}
};
struct Glyph {int font,x,y;char ch;Color color;bool operator==(const Glyph&) const=default;};
struct Metrics {
    std::vector<Glyph> glyphs;
    void Reset(){glyphs.clear();}
};
class ProbeFont final : public _Font {
    Metrics& metrics;
public:
    int id,width;
    ProbeFont(Metrics& m,int i,int w,int height,int ascent,int padding):metrics(m),id(i),width(w){
        mHeight=height;mAscent=ascent;mAscentPadding=padding;
    }
    int CharWidth(SexyChar c) override {return c=='\n'||c=='\r'?0:c==' '?width/2:width;}
    int CharWidthKern(SexyChar c,SexyChar) override {return CharWidth(c);}
    int StringWidth(const SexyString& s) override {int n=0;for(char c:s)n+=CharWidth(c);return n;}
    void DrawString(Graphics*,int x,int y,const SexyString& s,const Color& c,const Rect&) override {
        for(char ch:s){metrics.glyphs.push_back({id,x,y,ch,c});x+=CharWidth(ch);}
    }
    _Font* Duplicate() override {return new ProbeFont(*this);}
};
const Color red(200,20,30),blue(10,40,220),green(30,170,50);
struct Run {int font;const char* text;Color color;};
struct SingleCase {const char* text;std::vector<Run> runs;};
int AlignedX(int x,int width,int textWidth,DrawStringJustification a){
    return x+((a==DS_ALIGN_RIGHT||a==DS_ALIGN_RIGHT_VERTICAL_MIDDLE)?width-textWidth:
        (a==DS_ALIGN_CENTER||a==DS_ALIGN_CENTER_VERTICAL_MIDDLE)?(width-textWidth)/2:0);
}
constexpr std::array aligns{DS_ALIGN_LEFT,DS_ALIGN_RIGHT,DS_ALIGN_CENTER,
    DS_ALIGN_LEFT_VERTICAL_MIDDLE,DS_ALIGN_RIGHT_VERTICAL_MIDDLE,DS_ALIGN_CENTER_VERTICAL_MIDDLE};

unsigned Synthetic(std::ostream& log,unsigned& cases) {
    RestoreFormats restore;Metrics m;
    ProbeFont a(m,0,10,20,16,2),b(m,1,6,12,9,1),c(m,2,14,28,21,0);
    std::array<_Font*,3> fonts{&a,&b,&c};
    TodStringListFormat styles[]={{StringFormatId::Normal,&fonts[0],red,0,0},{StringFormatId::Keyword,&fonts[1],blue,0,0},
        {StringFormatId::Stat,&fonts[2],green,0,0},{StringFormatId::Flavor,nullptr,green,0,1}};
    gTodStringFormats=styles;gTodStringFormatCount=4;
    // The metric font never paints to an image. Set a real clip explicitly:
    // SetClipRect() intersects with the zero-sized Graphics(nullptr) target.
    Graphics g(nullptr);g.mClipRect=Rect(0,0,800,600);
    const std::vector<SingleCase> single{
        {"ABCD",{{0,"ABCD",red}}},
        {"A\x1B\x03" "BC\x1B\x01" "D",{{0,"A",red},{1,"BC",blue},{0,"D",red}}},
        {"AB\x1B\x03" "C\x1B\x06" "DE",{{0,"AB",red},{1,"C",blue},{2,"DE",green}}},
        {"\x1B\x03" "ABC",{{1,"ABC",blue}}},
        {"\x1B\x02" "A  \n B",{{0,"A B",green}}},
        {"\x1B\x02" "A \n\x1B\x02" " B",{{0,"A ",green},{0,"B",green}}},
        {"A \x1B\x02" " \n B",{{0,"A ",red},{0," B",green}}},
        {"\x1B\x7F" "AB",{{0,"AB",red}}},
        {"A\x1B\x7F" "B",{{0,"A",red},{0,"B",red}}},
        {"\x1B\x7F" "",{}}
    };
    unsigned wrong=0;
    auto append=[&](std::vector<Glyph>& output,const std::vector<Run>& runs,int x,int y){
        for(const auto& r:runs)for(char ch:std::string(r.text)){
            output.push_back({r.font,x,y,ch,r.color});x+=fonts[r.font]->CharWidth(ch);
        }
    };
    auto lineWidth=[&](const std::vector<Run>& runs){int width=0;for(const auto& r:runs)width+=fonts[r.font]->StringWidth(r.text);return width;};
    auto logGlyphs=[&](const char* label,const std::vector<Glyph>& glyphs){
        log<<label;
        for(const auto& glyph:glyphs)log<<" ["<<int(static_cast<unsigned char>(glyph.ch))
            <<","<<glyph.font<<","<<glyph.x<<","<<glyph.y<<","<<glyph.color.mRed
            <<","<<glyph.color.mGreen<<","<<glyph.color.mBlue<<","<<glyph.color.mAlpha<<"]";
        log<<std::endl;
    };
    for(const auto& s:single)for(auto align:aligns)for(bool draw:{false,true}){
        m.Reset();const int width=lineWidth(s.runs);std::vector<Glyph> expected;
        if(draw)append(expected,s.runs,AlignedX(30,240,width,align),70);
        TodStringListFormat format(StringFormatId::None,&fonts[0],red,0,0);
        const int actual=TodWriteString(&g,s.text,30,70,format,240,align,draw,0,-1);
        const bool pass=actual==width && m.glyphs==expected;
        ++cases;wrong+=!pass;log<<"single case="<<cases<<" align="<<int(align)<<" draw="<<draw
            <<" width="<<actual<<" expected="<<width<<" glyphs="<<(m.glyphs==expected)<<" pass="<<pass<<std::endl;
    }
    struct Wrapped {const char* text;int width,font;std::vector<std::vector<Run>> lines;};
    const std::vector<Wrapped> wrapped{
        {"ABCD",20,0,{{{0,"AB",red}},{{0,"CD",red}}}},
        {"\x1B\x01" "ABCD",20,0,{{{0,"AB",red}},{{0,"CD",red}}}},
        {"AB \x1B\x01" "CD",25,0,{{{0,"AB",red}},{{0,"CD",red}}}},
        {"\x1B\x01" "AB CD EF",25,0,{{{0,"AB",red}},{{0,"CD",red}},{{0,"EF",red}}}},
        {"\x1B\x7F" "AB",20,0,{{{0,"AB",red}}}},
        {"A\x1B\x7F" "B",20,0,{{{0,"AB",red}}}},
        {"\x1B\x7F" "",20,0,{{}}},
        {"\x1B\x7F" "\x1B\x7F" "",20,0,{{}}},
        {"\x1B\x7F" "AB",20,0,{{{0,"AB",red}}}},
        {"AB\nCD",50,0,{{{0,"AB",red}},{{0,"CD",red}}}},
        {"\x1B\x02" "AB \n  CD",100,0,{{{0,"AB CD",green}}}},
        {"\x1B\x03" "\x1B\x06" "\x1B\x03" "ABC",500,1,{{{1,"ABC",blue}}}}
    };
    for(const auto& w:wrapped)for(auto align:aligns)for(bool draw:{false,true}){
        m.Reset();auto* f=fonts[w.font];const int ascent=f->mAscent-f->mAscentPadding,spacing=f->mHeight;
        const int height=ascent+(f->mHeight-f->mAscent)+int(w.lines.size()-1)*spacing;
        std::vector<Glyph> expected;
        if(draw)for(size_t line=0;line<w.lines.size();++line)
            append(expected,w.lines[line],AlignedX(30,w.width,lineWidth(w.lines[line]),align),40+ascent+int(line)*spacing);
        const int actual=TodDrawStringWrappedHelper(&g,w.text,Rect(30,40,w.width,300),fonts[0],red,align,draw);
        const bool pass=actual==height && m.glyphs==expected;
        ++cases;wrong+=!pass;
        log<<"wrapped case="<<cases<<" align="<<int(align)<<" draw="<<draw<<" text="<<w.text
           <<" height="<<actual<<" expected="<<height
           <<" glyphs="<<(m.glyphs==expected)<<" pass="<<pass<<std::endl;
        if(!pass){logGlyphs("actual-glyphs",m.glyphs);logGlyphs("expected-glyphs",expected);}
    }
    return wrong;
}

unsigned GPU(LawnApp& app,std::ostream& log,unsigned& count) {
    RestoreFormats restore;
    std::array<_Font*,3> fonts{FONT_DWARVENTODCRAFT18,FONT_BRIANNETOD12,FONT_HOUSEOFTERROR16};
    TodStringListFormat styles[]={{StringFormatId::Normal,&fonts[0],red,0,0},{StringFormatId::Keyword,&fonts[1],blue,0,0},
        {StringFormatId::Stat,&fonts[2],green,0,0},{StringFormatId::Flavor,nullptr,green,0,1}};
    gTodStringFormats=styles;gTodStringFormatCount=4;unsigned wrong=0;
    const std::vector<SingleCase> single{
        {"Normal \x1B\x03" "small\x1B\x01" " BIG",{{0,"Normal ",red},{1,"small",blue},{0," BIG",red}}},
        {"\x1B\x02" "word \n   word",{{0,"word word",green}}},
        {"\x1B\x03" "a\x1B\x06" "b\x1B\x03" "c",{{1,"a",blue},{2,"b",green},{1,"c",blue}}},
        {"\x1B\x7F" "A\x1B\x7F" "B",{{0,"A",red},{0,"B",red}}}
    };
    auto pixels=[&](){auto& r=*app.mDDInterface->mRenderInterface;r.Flush();return r.mRenderer->ReadScenePixels();};
    auto screen=app.mDDInterface->mScreenImage;
    auto clear=[&](){screen->FillRect(Rect(0,0,800,600),Color(19,31,47),0);};
    auto drawRuns=[&](Graphics& g,const std::vector<Run>& runs,int y,DrawStringJustification align){
        int width=0;for(const auto& r:runs)width+=fonts[r.font]->StringWidth(r.text);
        int x=AlignedX(40,600,width,align);
        for(const auto& r:runs){fonts[r.font]->DrawString(&g,x,y,r.text,r.color,g.mClipRect);x+=fonts[r.font]->StringWidth(r.text);}
    };
    for(const auto& s:single)for(auto align:aligns){
        clear();Graphics g(screen);TodStringListFormat format(StringFormatId::None,&fonts[0],red,0,0);
        TodWriteString(&g,s.text,40,130,format,600,align,true,0,-1);const auto actual=pixels();
        clear();drawRuns(g,s.runs,130,align);const auto expected=pixels();
        clear();const auto empty=pixels();Require(expected!=empty,"Real rich-text reference rendered no glyphs");
        const bool pass=actual.size()==480000 && actual==expected;++count;wrong+=!pass;
        log<<"gpu-single case="<<count<<" align="<<int(align)<<" pass="<<pass<<std::endl;
    }
    // Wide single-line wrapped cases have independent baseline/height checks;
    // synthetic cases above separately exercise actual line breaking.
    const std::vector<SingleCase> wrapped{
        {"\x1B\x01" "ABCD",{{0,"ABCD",red}}},{"\x1B\x7F" "AB",{{0,"AB",red}}},
        {"\x1B\x03" "\x1B\x06" "\x1B\x03" "short",{{1,"short",blue}}},{"\x1B\x02" "AB \n  CD",{{0,"AB CD",green}}}
    };
    for(const auto& w:wrapped)for(auto align:aligns){
        auto* f=fonts[w.runs[0].font];const int ascent=f->mAscent-f->mAscentPadding;
        clear();Graphics g(screen);
        const int height=TodDrawStringWrappedHelper(&g,w.text,Rect(40,180,600,200),fonts[0],red,align,true);
        const auto actual=pixels();clear();drawRuns(g,w.runs,180+ascent,align);const auto expected=pixels();
        clear();Require(expected!=pixels(),"Wrapped reference rendered no glyphs");
        const bool pass=height==ascent+f->GetDescent() && actual.size()==480000 && actual==expected;
        ++count;wrong+=!pass;log<<"gpu-wrapped case="<<count<<" align="<<int(align)<<" pass="<<pass<<std::endl;
    }
    return wrong;
}

void AlmanacHeightInventory(LawnApp& app) {
    RestoreFormats restore;gTodStringFormats=gLawnStringFormats;gTodStringFormatCount=gLawnStringFormatCount;
    std::ofstream log(ModernSmoke::ProbePath("richtext-almanac-heights.txt"));Require(bool(log),"Cannot write almanac height inventory");
    Graphics g(nullptr);g.mClipRect=Rect(0,0,800,600);
    auto measure=[&](const SexyString& text,int index,const char* kind){
        if(text.find("<Missing ")!=SexyString::npos)return;
        Require(text.find('\0')==SexyString::npos,"Native almanac baseline contains a truncated control record");
        const int height=TodDrawStringWrappedHelper(&g,text,Rect(0,0,258,600),FONT_BRIANNETOD12,Color(40,50,90),DS_ALIGN_LEFT,false);
        log<<kind<<' '<<index<<' '<<height<<std::endl;
    };
    for(int i=0;i<NUM_SEEDS_IN_CHOOSER;++i)measure(EntityPlantDescription(SeedType(i)),i,"plant");
    for(int i=0;i<NUM_ZOMBIE_TYPES;++i)measure(EntityZombieDescription(ZombieType(i)),i,"zombie");
}
}

void PortableRichTextSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"),"Rich-text probe must be hidden and isolated");
    std::ofstream log(ModernSmoke::ProbePath("richtext-format-cases.txt"));Require(bool(log),"Cannot write rich-text evidence");
    unsigned cases=0,gpu=0;const unsigned wrong=Synthetic(log,cases);
    AlmanacHeightInventory(app);
    const unsigned gpuWrong=GPU(app,log,gpu);
    log<<"synthetic="<<cases<<" wrong="<<wrong<<" gpu="<<gpu<<" gpu-wrong="<<gpuWrong<<std::endl;
    Require(cases==264 && wrong==0 && gpu==48 && gpuWrong==0,
        "Rich-text format/spacing/advance differs from 1073; see richtext-format-cases.txt");
    ModernSmoke::Report("portable-richtext-264-layout-48-gpu-format-font-space-cases",app);
}
