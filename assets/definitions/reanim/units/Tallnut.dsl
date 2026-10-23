export component Tallnut {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 20 { y: -37.1; scale-x: 0.8; scale-y: 0.816; cel: 0; image: IMAGE_REANIM_TALLNUT_BODY; }
        frame 21 { x: -0.6; y: -36.1; skew-x: -0.2; skew-y: -0.2; scale-x: 0.804; scale-y: 0.81; cel: -10000; image: none; }
        frame 22 { x: -1.3; y: -35; skew-x: -0.4; skew-y: -0.4; scale-x: 0.808; scale-y: 0.804; }
        frame 23 { x: -2.1; y: -34; skew-x: -0.7; skew-y: -0.7; scale-x: 0.812; scale-y: 0.798; }
        frame 24 { x: -2.8; y: -33; skew-x: -0.9; skew-y: -0.9; scale-x: 0.816; scale-y: 0.792; }
        frame 25 { x: -2.1; y: -34; skew-x: -0.7; skew-y: -0.6; scale-x: 0.812; scale-y: 0.798; }
        frame 26 { x: -1.3; y: -35.1; skew-x: -0.4; skew-y: -0.4; scale-x: 0.808; scale-y: 0.804; }
        frame 27 { x: -0.7; y: -36.1; skew-x: -0.2; skew-y: -0.1; scale-x: 0.804; scale-y: 0.81; }
        frame 28 { x: 0; y: -37.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.816; }
        frame 29 { x: 0.2; y: -36.4; skew-x: 0.3; skew-y: 0.3; scale-x: 0.804; scale-y: 0.81; }
        frame 30 { x: 0.5; y: -35.7; skew-x: 0.5; skew-y: 0.5; scale-x: 0.808; scale-y: 0.804; }
        frame 31 { x: 0.8; y: -35; skew-x: 0.8; skew-y: 0.8; scale-x: 0.812; scale-y: 0.798; }
        frame 32 { x: 1.1; y: -34.3; skew-x: 1; skew-y: 1; scale-x: 0.816; scale-y: 0.792; }
        frame 33 { x: 0.8; y: -35; skew-x: 0.8; skew-y: 0.7; scale-x: 0.812; scale-y: 0.798; }
        frame 34 { x: 0.5; y: -35.6; skew-x: 0.5; skew-y: 0.5; scale-x: 0.808; scale-y: 0.804; }
        frame 35 { x: 0.2; y: -36.4; skew-x: 0.3; skew-y: 0.2; scale-x: 0.804; scale-y: 0.81; }
        frame 36 { x: 0; y: -37.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.816; }
    }
    Track {
        source-name: "anim_blink_twice";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { x: 31.2; y: -15; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 2 { x: 31.1; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_TALLNUT_BLINK2; }
        frame 3 { x: 31.2; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 4 { x: -10000; cel: -1; image: none; }
        frame 5 { cel: 0; }
        frame 6 { x: 31.1; cel: -10000; image: IMAGE_REANIM_TALLNUT_BLINK2; }
        frame 7 { x: 31.2; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 8 { x: -10000; cel: -1; image: none; }
        frame 9 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink_thrice";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 31.2; y: -15; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 10 { x: 31.1; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_TALLNUT_BLINK2; }
        frame 11 { x: 31.2; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 12 { x: -10000; cel: -1; image: none; }
        frame 13 { cel: 0; }
        frame 14 { x: 31.1; cel: -10000; image: IMAGE_REANIM_TALLNUT_BLINK2; }
        frame 15 { x: 31.2; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 16 { x: -10000; cel: -1; image: none; }
        frame 17 { cel: 0; }
        frame 18 { x: 31.1; cel: -10000; image: IMAGE_REANIM_TALLNUT_BLINK2; }
        frame 19 { x: 31.2; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 20 { x: -10000; cel: -1; image: none; }
        frame 21 { cel: -10000; }
    }
}
