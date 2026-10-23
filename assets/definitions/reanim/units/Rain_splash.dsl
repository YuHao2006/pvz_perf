export component Rain_splash {
    fps: 12;
    Track {
        source-name: "rain";
        frame-count: 8;
        frame 0 { cel: -1; }
        frame 1 { x: 0.3; y: 0.2; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_RAIN_SPLASH1; }
        frame 2 { x: 0.1; y: 0.3; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_RAIN_SPLASH2; }
        frame 3 { x: 0.3; y: -10000; image: IMAGE_REANIM_RAIN_SPLASH3; }
        frame 4 { x: 0.2; y: 0.1; image: IMAGE_REANIM_RAIN_SPLASH4; }
        frame 5 { x: -2.1; y: -1.9; scale-x: 0.936; scale-y: 0.936; alpha: 0.67; image: none; }
        frame 6 { x: -4.4; y: -3.9; scale-x: 1.072; scale-y: 1.072; alpha: 0.33; }
        frame 7 { x: -6.8; y: -6; scale-x: 1.208; scale-y: 1.208; alpha: 0; }
    }
}
