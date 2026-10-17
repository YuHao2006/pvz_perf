// The caller delegates non-client points to the normal window procedure.
bool NativePointInsideClient(HWND window,LPARAM position) {
    POINT point{GET_X_LPARAM(position),GET_Y_LPARAM(position)};
    RECT client{};
    if(!ScreenToClient(window,&point)) WindowFailure("ScreenToClient(client hit-test)");
    if(!GetClientRect(window,&client)) WindowFailure("GetClientRect(client hit-test)");
    return PtInRect(&client,point)!=FALSE;
}
