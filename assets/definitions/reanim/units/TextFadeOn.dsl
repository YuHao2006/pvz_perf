export component TextFadeOn {
    fps: 12;
    Track {
        source-name: "anim_leave";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 19 { cel: 0; }
        frame 20 { cel: -10000; }
    }
    Track {
        source-name: "anim_enter";
        frame-count: 40;
        frame 20 { cel: -1; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "locator_text";
        frame-count: 40;
        frame 0 { x: 400; y: 300; scale-x: 2.003; scale-y: 2.003; alpha: 0; }
        frame 1 { x: -10000; y: -10000; scale-x: 1.967; scale-y: 1.967; alpha: 0.05; }
        frame 2 { scale-x: 1.933; scale-y: 1.933; alpha: 0.11; }
        frame 3 { scale-x: 1.899; scale-y: 1.899; alpha: 0.16; }
        frame 4 { scale-x: 1.866; scale-y: 1.866; alpha: 0.21; }
        frame 5 { scale-x: 1.834; scale-y: 1.834; alpha: 0.26; }
        frame 6 { scale-x: 1.802; scale-y: 1.802; alpha: 0.32; }
        frame 7 { scale-x: 1.769; scale-y: 1.769; alpha: 0.37; }
        frame 8 { scale-x: 1.735; scale-y: 1.735; alpha: 0.42; }
        frame 9 { scale-x: 1.7; scale-y: 1.7; alpha: 0.47; }
        frame 10 { scale-x: 1.663; scale-y: 1.663; alpha: 0.53; }
        frame 11 { scale-x: 1.622; scale-y: 1.622; alpha: 0.58; }
        frame 12 { scale-x: 1.576; scale-y: 1.576; alpha: 0.63; }
        frame 13 { scale-x: 1.524; scale-y: 1.524; alpha: 0.68; }
        frame 14 { scale-x: 1.464; scale-y: 1.464; alpha: 0.74; }
        frame 15 { scale-x: 1.395; scale-y: 1.395; alpha: 0.79; }
        frame 16 { scale-x: 1.316; scale-y: 1.316; alpha: 0.84; }
        frame 17 { scale-x: 1.224; scale-y: 1.224; alpha: 0.89; }
        frame 18 { scale-x: 1.119; scale-y: 1.119; alpha: 0.95; }
        frame 19 { scale-x: 1.001; scale-y: 1.001; alpha: 1; }
        frame 20 { scale-x: -10000; scale-y: -10000; alpha: -10000; }
        frame 36 { alpha: 0.75; }
        frame 37 { alpha: 0.5; }
        frame 38 { alpha: 0.25; }
        frame 39 { alpha: 0; }
    }
}
