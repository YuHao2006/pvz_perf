#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstdint>
struct V { float r,g,b; };
V oldFilter(V rgb,int kind) {
 float high=std::max(std::max(rgb.r,rgb.g),rgb.b),low=std::min(std::min(rgb.r,rgb.g),rgb.b);
 float l=(low+high)/2.0f,h=0,s=high-low;
 if(l<=0) return {0,0,0};
 if(s>0) {
  s/=l<=0.5f ? low+high : 2.0f-low-high;
  float r=(high-rgb.r)/(high-low),g=(high-rgb.g)/(high-low),b=(high-rgb.b)/(high-low);
  if(high==rgb.r) h=rgb.g==low ? 5.0f+b : 1.0f-g;
  else if(high==rgb.g) h=rgb.b==low ? 1.0f+r : 3.0f-b;
  else h=rgb.r==low ? 3.0f+g : 5.0f-r;
  h/=6.0f;
 }
 s*=kind==2 ? 0.2f : 0.3f;l*=kind==2 ? 1.8f : 1.2f;
 float v=l<=0.5f ? l*(1+s) : l+s-l*s;
 if(v<=0) return {0,0,0};
 float y=2*l-v,sv=(v-y)/v;h*=6;
 int k=std::clamp(int(h),0,5);float vsf=v*sv*(h-float(k)),x=y+vsf,z=v-vsf;
 switch(k) {case 0:return {v,x,y};case 1:return {z,v,y};case 2:return {y,v,x};case 3:return {y,z,v};case 4:return {x,y,v};default:return {v,y,z};}
}
V direct(V rgb,int kind) {
 float hi=std::max(std::max(rgb.r,rgb.g),rgb.b),lo=std::min(std::min(rgb.r,rgb.g),rgb.b);
 float oldL=(lo+hi)*0.5f,newL=oldL*(kind==2 ? 1.8f : 1.2f),sat=kind==2 ? 0.2f : 0.3f;
 float denominator=oldL<=0.5f ? oldL : 1-oldL,numerator=newL<=0.5f ? newL : 1-newL;
 float ratio=denominator!=0 ? sat*numerator/denominator : 0;
 if(newL+(hi-lo)*ratio*0.5f<=0) return {0,0,0};
 return {(rgb.r-oldL)*ratio+newL,(rgb.g-oldL)*ratio+newL,(rgb.b-oldL)*ratio+newL};
}
int byte(float f) { return int(std::clamp(f*255.0f,0.0f,255.0f)); }
int main() {
 for(int kind: {2,3}) {
  unsigned long long hist[256]{};int maxErr=0;
  for(int r=0;r<256;++r) for(int g=0;g<256;++g) for(int b=0;b<256;++b) {
   V a{r/255.0f,g/255.0f,b/255.0f};V x=oldFilter(a,kind),y=direct(a,kind);
   int e=std::max({std::abs(byte(x.r)-byte(y.r)),std::abs(byte(x.g)-byte(y.g)),std::abs(byte(x.b)-byte(y.b))});hist[e]++;maxErr=std::max(maxErr,e);
  }
  std::printf("kind=%d colors=16777216 max_channel_error=%d identical=%llu one_byte=%llu more=%llu\n",kind,maxErr,hist[0],hist[1],16777216ULL-hist[0]-hist[1]);
  unsigned state=1,valid=0,skipped=0;int hdrMax=0;
  for(unsigned i=0;i<1000000;++i) {
   float v[3];for(auto& f:v) {state=state*1664525u+1013904223u;f=float(state>>8)/16777215.0f*4;}
   V x=oldFilter({v[0],v[1],v[2]},kind),y=direct({v[0],v[1],v[2]},kind);
   if(!std::isfinite(x.r)||!std::isfinite(x.g)||!std::isfinite(x.b)){++skipped;continue;}
   ++valid;if (hdrMax==0 && std::max({std::abs(byte(x.r)-byte(y.r)),std::abs(byte(x.g)-byte(y.g)),std::abs(byte(x.b)-byte(y.b))})>1) std::printf("mismatch %g %g %g old=%g,%g,%g new=%g,%g,%g\n",v[0],v[1],v[2],x.r,x.g,x.b,y.r,y.g,y.b);hdrMax=std::max(hdrMax,std::max({std::abs(byte(x.r)-byte(y.r)),std::abs(byte(x.g)-byte(y.g)),std::abs(byte(x.b)-byte(y.b))}));
  }
  std::printf("kind=%d HDR_positive_random=%u skipped_nonfinite_reference=%u max_channel_error=%d\n",kind,valid,skipped,hdrMax);
 }
}



