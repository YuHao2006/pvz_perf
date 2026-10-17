#pragma once
class LawnApp;
namespace Sexy {class SexyAppBase;}
namespace LoadingCloseSmoke {
bool Enabled();
void AfterInit(LawnApp& app);
void Stage(LawnApp& app,const char* stage);
bool Tick(LawnApp& app);
void CloseUpdate(LawnApp& app);
void AfterLoop(Sexy::SexyAppBase& app);
void AfterShutdown(LawnApp& app);
void AfterDestruction();
}
