#pragma once
void startOutput();
void stopOutput();
void sfx_load(int,const unsigned char*,int);
void sfx_pcm(int,const float*,int,int,int);
void sfx_release(int);
int sfx_play(int,int,bool,double,double,int);
void sfx_stop(int);
bool sfx_playing(int);
void sfx_volume(double);
int sfx_pause(int);
void sfx_resume(int,int,bool);
void sfx_parameters(int,double,double,int);
unsigned loadTracker(const void*,unsigned,bool);
unsigned beginPcm(int,int,int);
int writePcm(unsigned,int,int,const float*,int);
double musicCommand(unsigned,const char*,double,int);
void setMusicMaster(double);
