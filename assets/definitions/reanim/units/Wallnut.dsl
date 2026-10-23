export component Wallnut {
    fps: 12;
    Track {
        source-name: "_ground";
        frame-count: 56;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 43 { x: 44.8; y: 75.5; cel: 0; }
        frame 44 { x: 27.6; y: -10000; cel: -10000; }
        frame 45 { x: 8.9; }
        frame 46 { x: -11.3; }
        frame 47 { x: -31.5; }
        frame 48 { x: -50.2; }
        frame 49 { x: -67.4; }
        frame 50 { x: -84.6; }
        frame 51 { x: -103.4; }
        frame 52 { x: -123.6; }
        frame 53 { x: -143.8; }
        frame 54 { x: -162.5; }
        frame 55 { x: -179.8; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 56;
        frame 17 { cel: -1; }
        frame 18 { cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 56;
        frame 0 { x: 6.9; y: 3.6; scale-x: 0.7; scale-y: 0.719; image: IMAGE_REANIM_WALLNUT_BODY; }
        frame 1 { x: 6; y: 4.8; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: 0.711; image: none; }
        frame 2 { x: 5.2; y: 6.2; skew-x: -1.4; skew-y: -1.4; scale-y: 0.702; }
        frame 3 { x: 4.3; y: 7.5; skew-x: -2.2; skew-y: -2.1; scale-y: 0.694; }
        frame 4 { x: 3.5; y: 8.8; skew-x: -2.9; skew-y: -2.9; scale-y: 0.686; }
        frame 5 { x: 4.3; y: 7.5; skew-x: -2.2; skew-y: -2.2; scale-y: 0.694; }
        frame 6 { x: 5.2; y: 6.2; skew-x: -1.4; skew-y: -1.4; scale-y: 0.702; }
        frame 7 { x: 6; y: 4.8; skew-x: -0.6; skew-y: -0.6; scale-y: 0.71; }
        frame 8 { x: 7; y: 3.6; skew-x: 0; skew-y: 0; scale-y: 0.719; }
        frame 9 { x: 7.9; y: 3.9; skew-x: 0.8; skew-y: 0.7; scale-y: 0.711; }
        frame 10 { x: 8.8; y: 4.3; skew-x: 1.5; skew-y: 1.5; scale-y: 0.702; }
        frame 11 { x: 9.8; y: 4.6; skew-x: 2.3; skew-y: 2.3; scale-y: 0.694; }
        frame 12 { x: 10.5; y: 4.9; skew-x: 3; skew-y: 3; scale-y: 0.686; }
        frame 13 { x: 9.6; y: 4.5; skew-x: 2.3; skew-y: 2.3; scale-y: 0.694; }
        frame 14 { x: 8.7; y: 4.2; skew-x: 1.5; skew-y: 1.5; scale-y: 0.702; }
        frame 15 { x: 7.8; y: 3.7; skew-x: 0.8; skew-y: 0.8; scale-y: 0.711; }
        frame 16 { x: 7; y: 3.5; skew-x: 0; skew-y: 0; scale-y: 0.719; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 18 { cel: -10000; }
        frame 43 { x: 7.3; y: 3.6; cel: 0; }
        frame 44 { x: 29.2; y: -7.4; skew-x: 27.6; skew-y: 27.6; scale-x: 0.699; scale-y: 0.718; cel: -10000; }
        frame 45 { x: 56.7; y: -6.3; skew-x: 57.7; skew-y: 57.7; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 82.5; y: 10.1; skew-x: 90; skew-y: 90; scale-x: 0.7; scale-y: 0.719; }
        frame 47 { x: 96.2; y: 33.1; skew-x: 122.3; skew-y: 122.3; scale-x: 0.699; scale-y: 0.718; }
        frame 48 { x: 94.6; y: 57.9; skew-x: 152.4; skew-y: 152.4; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 81.1; y: 76.7; skew-x: 180; skew-y: 180; scale-x: 0.7; scale-y: 0.719; }
        frame 50 { x: 59.1; y: 91.3; skew-x: 207.6; skew-y: 207.6; scale-x: 0.699; scale-y: 0.718; }
        frame 51 { x: 31.5; y: 94.1; skew-x: 237.7; skew-y: 237.7; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 5.7; y: 81.7; skew-x: 270; skew-y: 270; scale-x: 0.7; scale-y: 0.719; }
        frame 53 { x: -7.9; y: 54.5; skew-x: 302.3; skew-y: 302.3; scale-x: 0.699; scale-y: 0.718; }
        frame 54 { x: -6.3; y: 25.9; skew-x: 332.4; skew-y: 332.4; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 6.9; y: 3.6; skew-x: 360; skew-y: 360; scale-x: 0.7; scale-y: 0.719; }
    }
    Track {
        source-name: "anim_blink_twitch";
        frame-count: 56;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 17 { x: 29.2; y: 35.6; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_WALLNUT_TWITCH; }
        frame 18 { x: -10000; y: 34.2; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 19 { y: 35.6; }
        frame 20 { y: 34.2; }
        frame 21 { y: 35.6; }
        frame 22 { y: -10000; cel: -1; }
        frame 23 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink_twice";
        frame-count: 56;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 23 { x: 28; y: 21.6; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_WALLNUT_BLINK1; }
        frame 24 { x: -10000; y: 21.8; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_WALLNUT_BLINK2; }
        frame 25 { y: 21.6; image: IMAGE_REANIM_WALLNUT_BLINK1; }
        frame 26 { y: -10000; cel: -1; image: none; }
        frame 27 { cel: 0; }
        frame 28 { y: 21.8; cel: -10000; image: IMAGE_REANIM_WALLNUT_BLINK2; }
        frame 29 { y: 21.6; image: IMAGE_REANIM_WALLNUT_BLINK1; }
        frame 30 { y: -10000; cel: -1; image: none; }
        frame 31 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink_thrice";
        frame-count: 56;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 31 { x: 28; y: 21.6; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_WALLNUT_BLINK1; }
        frame 32 { x: -10000; y: 21.8; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_WALLNUT_BLINK2; }
        frame 33 { y: 21.6; image: IMAGE_REANIM_WALLNUT_BLINK1; }
        frame 34 { y: -10000; cel: -1; image: none; }
        frame 35 { cel: 0; }
        frame 36 { y: 21.8; cel: -10000; image: IMAGE_REANIM_WALLNUT_BLINK2; }
        frame 37 { y: 21.6; image: IMAGE_REANIM_WALLNUT_BLINK1; }
        frame 38 { y: -10000; cel: -1; image: none; }
        frame 39 { cel: 0; }
        frame 40 { y: 21.8; cel: -10000; image: IMAGE_REANIM_WALLNUT_BLINK2; }
        frame 41 { y: 21.6; image: IMAGE_REANIM_WALLNUT_BLINK1; }
        frame 42 { y: -10000; cel: -1; image: none; }
        frame 43 { cel: -10000; }
    }
}
