#include "PortableTooltipSmoke.h"
#include "ModernVulkanSmoke.h"
#include "ToolTipWidget.h"
#include "LawnApp.h"
#include "Resources.h"
#include "graphics/Font.h"
#include "graphics/Graphics.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include <algorithm>
#include <array>
#include <cstdlib>
#include <fstream>
#include <iomanip>
#include <stdexcept>
#include <vector>

namespace {
using namespace Sexy;
void Require(bool value,const char* message){if(!value)throw std::runtime_error(message);}
struct Case { std::string label; std::vector<std::string> lines; };
// Explicit expected lines: no copy of the production wrapping algorithm.
const std::array<Case,12> cases{{
    {"",{}}, {" ",{" "}}, {"foo ",{"foo "}}, {"foo  ",{"foo  "}},
    {"\n",{""}}, {"foo\n",{"foo"}}, {"foo\n  ",{"foo"}},
    {"foo\n  bar ",{"foo","bar "}}, {"foo \nbar ",{"foo ","bar "}},
    {"foo bar",{"foo bar"}}, {"\n\n",{"",""}},
    {"Supercalifragilisticexpialidocious",{"Supercalifragilisticexpialidocious"}}
}};
struct Size {int width,height,wrap;};
Size ExpectedSize(const ToolTipWidget& tip,const std::vector<std::string>& lines) {
    int width=std::max(FONT_TINYBOLD->StringWidth(tip.mTitle),FONT_PICO129->StringWidth(tip.mWarningText));
    const int wrap=std::max(width-30,100);
    for(const auto& line:lines)width=std::max(width,FONT_PICO129->StringWidth(line));
    int height=tip.mTitle.empty()?6:FONT_TINYBOLD->mAscent+8;
    // Keep the original 00524E10 sizing convention; Draw itself uses PICO.
    if(!tip.mWarningText.empty())height+=FONT_TINYBOLD->mAscent+2;
    height+=int(lines.size())*(FONT_PICO129->mAscent+2)-2;
    return {width+10,height,wrap};
}
void DrawExpected(Graphics& g,const ToolTipWidget& tip,const Size& size,
                  const std::vector<std::string>& lines,bool body) {
    const int x=tip.mX;
    int y=tip.mY;
    g.mColor = Color(255,255,200,255);g.FillRect(x,y,size.width,size.height);
    g.mColor = Color::Black;g.DrawRect(x,y,size.width-1,size.height-1);++y;
    auto text=[&](const std::string& s,_Font* font,const Color& color){
        g.mFont = font;g.mColor = color;
        g.DrawString(s,x+(size.width-font->StringWidth(s))/2,y+font->mAscent);
        y+=font->mAscent+2;
    };
    if(!tip.mTitle.empty())text(tip.mTitle,FONT_TINYBOLD,Color::Black);
    if(!tip.mWarningText.empty())text(tip.mWarningText,FONT_PICO129,Color(255,0,0));
    if(body)for(const auto& line:lines)text(line,FONT_PICO129,Color::Black);
}
}

void PortableTooltipSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"),"Tooltip test needs hidden isolated runtime");
    std::ofstream log(ModernSmoke::ProbePath("tooltip-wrap-gpu.txt"));
    Require(bool(log),"Cannot write tooltip regression evidence");
    unsigned layouts=0,wrong=0,frames=0,visible=0;
    // Exercise real PICO129 widths immediately either side of the 1073 >=
    // boundary; a word itself is never split, even with limit zero.
    const int aWidth=FONT_PICO129->CharWidth('A');
    Require(aWidth>0 && FONT_PICO129->StringWidth("foo bar")<100,"Unexpected tooltip font fixture metrics");
    for(int width:{0,aWidth,aWidth+1,100}) {
        ToolTipWidget tip;tip.mLabel="A W";tip.mGetsLinesWidth=width;
        const std::vector<std::string> expected=width<=aWidth?
            std::vector<std::string>{"A","W"}:std::vector<std::string>{"A W"};
        std::vector<std::string> actual;tip.GetLines(actual);
        const bool pass=actual==expected;++layouts;wrong+=!pass;
        log<<"boundary width="<<width<<" pass="<<pass<<std::endl;
    }
    auto* screen=app.mDDInterface->mScreenImage;
    auto pixels=[&](){auto& render=*app.mDDInterface->mRenderInterface;render.Flush();return render.mRenderer->ReadScenePixels();};
    auto clear=[&](){screen->FillRect(Rect(0,0,800,600),Color(19,31,47),0);};
    for(const auto& item:cases)for(bool title:{false,true})for(bool warning:{false,true}) {
        ToolTipWidget tip;tip.mLabel=item.label;tip.mTitle=title?"Tooltip":"";
        tip.mWarningText=warning?"Warning":"";tip.mX=200;tip.mY=180;
        const auto size=ExpectedSize(tip,item.lines);
        Require(size.wrap==100 && size.width<600,"Tooltip fixture left intended unclipped wrap range");
        tip.CalculateSize();std::vector<std::string> actual;tip.GetLines(actual);
        const bool layout=actual==item.lines && tip.mWidth==size.width && tip.mHeight==size.height && tip.mGetsLinesWidth==size.wrap;
        ++layouts;wrong+=!layout;
        clear();Graphics g(screen);tip.Draw(&g);const auto drawn=pixels();
        clear();DrawExpected(g,tip,size,item.lines,true);const auto expected=pixels();
        clear();DrawExpected(g,tip,size,item.lines,false);const auto noBody=pixels();
        Require(drawn.size()==480000 && expected.size()==drawn.size() && noBody.size()==drawn.size(),"Tooltip readback size changed");
        unsigned different=0;for(size_t i=0;i<drawn.size();++i)different+=drawn[i]!=expected[i];
        const bool hasGlyph=item.label.find_first_not_of(" \n")!=std::string::npos;
        const bool visibleBody=expected!=noBody;
        const bool pass=different==0 && hasGlyph==visibleBody;
        ++frames;wrong+=!pass;visible+=visibleBody;
        log<<"frame="<<frames<<" label="<<std::quoted(item.label)<<" title="<<title<<" warning="<<warning
           <<" layout="<<layout<<" different-pixels="<<different<<" visible-body="<<visibleBody<<" pass="<<pass<<std::endl;
    }
    log<<"layouts="<<layouts<<" frames="<<frames<<" visible="<<visible<<" wrong="<<wrong<<std::endl;
    Require(layouts==52 && frames==48 && visible==32 && wrong==0,"Tooltip differs from 1073; see tooltip-wrap-gpu.txt");
    ModernSmoke::Report("portable-tooltip-52-layout-48-gpu-original-tail-boundaries",app);
}
