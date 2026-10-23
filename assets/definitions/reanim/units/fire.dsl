export component fire {
    fps: 12;
    Track {
        source-name: "anim_flame";
        frame-count: 13;
        frame 3 { cel: -1; }
        frame 4 { cel: -10000; }
    }
    Track {
        source-name: "anim_done";
        frame-count: 13;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { cel: 0; }
        frame 4 { cel: -10000; }
    }
    Track {
        source-name: "Layer 1";
        frame-count: 13;
        frame 0 { x: -45; y: 30.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_FIRE1; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_FIRE2; }
        frame 2 { image: IMAGE_REANIM_FIRE3; }
        frame 3 { x: -41.8; y: 26.4; scale-y: 0.844; image: IMAGE_REANIM_FIRE4; }
        frame 4 { x: -43.9; y: 22.9; scale-y: 0.8; image: IMAGE_REANIM_FIRE4B; }
        frame 5 { x: -41.5; y: 14.1; scale-y: -10000; image: IMAGE_REANIM_FIRE5; }
        frame 6 { x: -42; y: 6.1; image: IMAGE_REANIM_FIRE5B; }
        frame 7 { x: -44.6; y: -3.4; image: IMAGE_REANIM_FIRE6; }
        frame 8 { x: -43.9; y: -14.6; image: IMAGE_REANIM_FIRE6B; }
        frame 9 { x: -44; y: -29.1; image: IMAGE_REANIM_FIRE7; }
        frame 10 { x: -45.7; y: -30.3; image: IMAGE_REANIM_FIRE7B; }
        frame 11 { x: -44.4; y: -39.5; image: IMAGE_REANIM_FIRE8; }
        frame 12 { x: -44.2; y: -46.5; alpha: 0; image: none; }
    }
}
