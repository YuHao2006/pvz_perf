export component IceShroom {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 38;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { cel: 0; }
        frame 5 { cel: -10000; }
        frame 21 { cel: -1; }
        frame 22 { cel: -10000; }
    }
    Track {
        source-name: "anim_sleep";
        frame-count: 38;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { cel: 0; }
        frame 22 { cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 38;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 13.7; y: 38.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ICESHROOM_BODY; }
        frame 5 { x: 13.6; y: 38.5; scale-x: 0.803; scale-y: 0.79; cel: -10000; image: none; }
        frame 6 { x: 13.5; y: 39; scale-x: 0.806; scale-y: 0.779; }
        frame 7 { x: 13.4; y: 39.4; scale-x: 0.81; scale-y: 0.769; }
        frame 8 { x: 13.3; y: 39.8; scale-x: 0.813; scale-y: 0.759; }
        frame 9 { x: 13.2; y: 40.3; scale-x: 0.816; scale-y: 0.748; }
        frame 10 { x: 13.1; y: 40.7; scale-x: 0.819; scale-y: 0.738; }
        frame 11 { x: 13; y: 41.1; scale-x: 0.823; scale-y: 0.727; }
        frame 12 { x: 12.9; y: 41.5; scale-x: 0.826; scale-y: 0.717; }
        frame 13 { x: 13; y: 41.1; scale-x: 0.823; scale-y: 0.727; }
        frame 14 { x: 13.1; y: 40.6; scale-x: 0.819; scale-y: 0.738; }
        frame 15 { x: 13.2; y: 40.2; scale-x: 0.816; scale-y: 0.748; }
        frame 16 { x: 13.3; y: 39.8; scale-x: 0.813; scale-y: 0.759; }
        frame 17 { x: 13.4; y: 39.4; scale-x: 0.81; scale-y: 0.769; }
        frame 18 { x: 13.5; y: 38.9; scale-x: 0.806; scale-y: 0.779; }
        frame 19 { x: 13.6; y: 38.5; scale-x: 0.803; scale-y: 0.79; }
        frame 20 { x: 13.7; y: 38.1; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 13.6; y: 38.5; scale-x: 0.803; scale-y: 0.79; }
        frame 23 { x: 13.5; y: 39; scale-x: 0.806; scale-y: 0.779; }
        frame 24 { x: 13.4; y: 39.4; scale-x: 0.81; scale-y: 0.769; }
        frame 25 { x: 13.3; y: 39.8; scale-x: 0.813; scale-y: 0.759; }
        frame 26 { x: 13.2; y: 40.3; scale-x: 0.816; scale-y: 0.748; }
        frame 27 { x: 13.1; y: 40.7; scale-x: 0.819; scale-y: 0.738; }
        frame 28 { x: 13; y: 41.1; scale-x: 0.823; scale-y: 0.727; }
        frame 29 { x: 12.9; y: 41.5; scale-x: 0.826; scale-y: 0.717; }
        frame 30 { x: 13; y: 41.1; scale-x: 0.823; scale-y: 0.727; }
        frame 31 { x: 13.1; y: 40.6; scale-x: 0.819; scale-y: 0.738; }
        frame 32 { x: 13.2; y: 40.2; scale-x: 0.816; scale-y: 0.748; }
        frame 33 { x: 13.3; y: 39.8; scale-x: 0.813; scale-y: 0.759; }
        frame 34 { x: 13.4; y: 39.4; scale-x: 0.81; scale-y: 0.769; }
        frame 35 { x: 13.5; y: 38.9; scale-x: 0.806; scale-y: 0.779; }
        frame 36 { x: 13.6; y: 38.5; scale-x: 0.803; scale-y: 0.79; }
        frame 37 { x: 13.7; y: 38.1; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "IceShroom_base";
        frame-count: 38;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 8.5; y: 60.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ICESHROOM_BASE; }
        frame 5 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
    }
    Track {
        source-name: "anim_sleep";
        frame-count: 38;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { x: 27.3; y: 37.9; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ICESHROOM_BLINK2; }
        frame 22 { x: -10000; y: 38.3; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 23 { y: 38.6; }
        frame 24 { y: 38.9; }
        frame 25 { y: 39.3; }
        frame 26 { y: 39.6; }
        frame 27 { y: 40; }
        frame 28 { y: 40.3; }
        frame 29 { y: 40.6; }
        frame 30 { y: 40.3; }
        frame 31 { y: 40; }
        frame 32 { y: 39.6; }
        frame 33 { y: 39.3; }
        frame 34 { y: 38.9; }
        frame 35 { y: 38.6; }
        frame 36 { y: 38.3; }
        frame 37 { y: 37.9; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 38;
        frame 0 { cel: -1; }
        frame 1 { x: 27.3; y: 38.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ICESHROOM_BLINK1; }
        frame 2 { x: -10000; y: 37.9; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_ICESHROOM_BLINK2; }
        frame 3 { y: 38.1; image: IMAGE_REANIM_ICESHROOM_BLINK1; }
        frame 4 { y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "IceShroom_head";
        frame-count: 38;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: -1.4; y: 1.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ICESHROOM_HEAD; }
        frame 5 { x: -10000; y: -10000; scale-x: -10000; scale-y: 0.804; cel: -10000; image: none; }
        frame 6 { scale-y: 0.808; }
        frame 7 { y: 2; scale-y: 0.806; }
        frame 8 { y: 2.5; scale-y: 0.805; }
        frame 9 { y: 3; scale-y: 0.804; }
        frame 10 { y: 3.5; scale-y: 0.803; }
        frame 11 { y: 4.1; scale-y: 0.801; }
        frame 12 { y: 4.6; scale-y: 0.8; }
        frame 13 { y: 5; scale-y: 0.786; }
        frame 14 { y: 5.4; scale-y: 0.772; }
        frame 15 { y: 4.8; scale-y: 0.777; }
        frame 16 { y: 4.1; scale-y: 0.781; }
        frame 17 { y: 3.5; scale-y: 0.786; }
        frame 18 { y: 2.8; scale-y: 0.791; }
        frame 19 { y: 2.1; scale-y: 0.795; }
        frame 20 { y: 1.5; scale-y: 0.8; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 22 { scale-y: 0.804; }
        frame 23 { scale-y: 0.808; }
        frame 24 { y: 2; scale-y: 0.806; }
        frame 25 { y: 2.5; scale-y: 0.805; }
        frame 26 { y: 3; scale-y: 0.804; }
        frame 27 { y: 3.5; scale-y: 0.803; }
        frame 28 { y: 4.1; scale-y: 0.801; }
        frame 29 { y: 4.6; scale-y: 0.8; }
        frame 30 { y: 5; scale-y: 0.786; }
        frame 31 { y: 5.4; scale-y: 0.772; }
        frame 32 { y: 4.8; scale-y: 0.777; }
        frame 33 { y: 4.1; scale-y: 0.781; }
        frame 34 { y: 3.5; scale-y: 0.786; }
        frame 35 { y: 2.8; scale-y: 0.791; }
        frame 36 { y: 2.1; scale-y: 0.795; }
        frame 37 { y: 1.5; scale-y: 0.8; }
    }
}
