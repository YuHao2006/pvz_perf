#pragma once
#include "LawnApp.h"
#include "Widget/StoreScreen.h"
#include "widget/WidgetManager.h"
#include <stdexcept>

// Diagnostic-only registration of a stack-owned shop. Production shops are
// heap-owned by the application. Unregister without transferring/deleting the
// stack object, so the tests exercise the same live dialog identity contract.
class PortableStoreRegistration final {
    LawnApp& app;
    StoreScreen& store;
public:
    PortableStoreRegistration(LawnApp& a,StoreScreen& s):app(a),store(s) {
        if(app.GetDialog(DIALOG_STORE))throw std::logic_error("Fixture already has a store");
        app.AddDialog(&store);app.mWidgetManager->SetFocus(&store);
    }
    ~PortableStoreRegistration() {
        if(app.GetDialog(DIALOG_STORE)==&store)
            app.SexyAppBase::KillDialog(DIALOG_STORE,true,false);
    }
    PortableStoreRegistration(const PortableStoreRegistration&)=delete;
    PortableStoreRegistration& operator=(const PortableStoreRegistration&)=delete;
};
