export component ZenGarden_wateringcan {
    fps: 20;
    Track {
        source-name: "anim_water";
        frame-count: 34;
        frame 0 { skew-x: 356.5; skew-y: 356.5; }
        frame 1 { skew-x: -10000; skew-y: -10000; }
        frame 17 { cel: -1; }
        frame 18 { cel: -10000; }
    }
    Track {
        source-name: "anim_water_area";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 17 { skew-x: -3.4; skew-y: -3.4; cel: 0; }
        frame 18 { skew-x: -10000; skew-y: -10000; cel: -10000; }
    }
    Track {
        source-name: "can";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 7 { x: -11.2; y: -2.4; cel: 0; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER1; }
        frame 8 { x: -11.4; y: -3.4; cel: -10000; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER2; }
        frame 9 { x: -9.4; y: -2.7; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER3; }
        frame 10 { x: -8.7; y: -2.9; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER4; }
        frame 11 { x: -5.2; y: -2.7; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER5; }
        frame 12 { x: -1.4; y: -0.7; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER6; }
        frame 13 { x: -1.2; y: -7.4; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER7; }
        frame 14 { x: -10000; y: -4.9; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER8; }
        frame 15 { x: 0.8; y: -3.7; scale-x: 0.806; scale-y: 1.071; alpha: 0.5; image: none; }
        frame 16 { x: 2.9; y: -2.4; scale-x: 0.612; scale-y: 1.143; alpha: 0; }
        frame 17 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 18 { cel: -10000; }
        frame 24 { x: -11.2; scale-x: 1; scale-y: 1; cel: 0; alpha: 1; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER1; }
        frame 25 { x: 3.8; y: 14.4; scale-x: -10000; scale-y: -10000; cel: -10000; alpha: -10000; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER2; }
        frame 26 { x: 24.5; y: 22.4; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER3; }
        frame 27 { x: 47; y: 13.8; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER4; }
        frame 28 { x: 59.3; y: 0.9; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER5; }
        frame 29 { x: 48; y: -16.8; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER6; }
        frame 30 { x: 28.7; y: -22.6; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER7; }
        frame 31 { x: 5.6; y: -23.3; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN_WATER8; }
        frame 32 { x: 4.3; y: -15.9; scale-x: 0.806; scale-y: 1.071; alpha: 0.5; image: none; }
        frame 33 { x: 2.9; y: -8.4; scale-x: 0.612; scale-y: 1.143; alpha: 0; }
    }
    Track {
        source-name: "water";
        frame-count: 34;
        frame 0 { x: 5.1; y: 4.9; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN1; }
        frame 1 { x: 1.6; y: 3.4; skew-x: -6.2; skew-y: -6.2; image: none; }
        frame 2 { x: -1.4; y: 2.4; skew-x: -12.7; skew-y: -12.7; scale-x: 0.999; scale-y: 0.999; }
        frame 3 { x: -3.9; y: 1.7; skew-x: -19.2; skew-y: -19.2; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: -5.8; y: 1.2; skew-x: -25.5; skew-y: -25.5; }
        frame 5 { x: -7.2; y: 1; skew-x: -32; skew-y: -32; }
        frame 6 { x: -7.9; y: -10000; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998; scale-y: 0.998; }
        frame 7 { x: -8; y: 1; skew-x: -44.9; skew-y: -44.9; scale-x: 1; scale-y: 1; }
        frame 8 { x: -10000; y: 0.2; skew-x: -47.9; skew-y: -47.9; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN2; }
        frame 9 { x: -7.6; y: 0.4; skew-x: -52.4; skew-y: -52.4; image: none; }
        frame 10 { x: -6.9; y: 3.8; skew-x: -58.5; skew-y: -58.5; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN3; }
        frame 11 { x: -4.7; y: 7.3; skew-x: -66.7; skew-y: -66.7; scale-x: 1; scale-y: 1; image: none; }
        frame 12 { x: -3.6; y: 8.7; skew-x: -68.9; skew-y: -68.9; scale-x: 0.999; scale-y: 0.999; image: "IMAGE_REANIM_ZENGARDEN-WATERINGCAN4"; }
        frame 13 { x: -3.5; y: 5.9; skew-x: -69.1; skew-y: -69.1; scale-x: 0.998; scale-y: 0.998; image: none; }
        frame 14 { x: -3.6; y: 2.9; skew-x: -68.9; skew-y: -68.9; scale-x: 0.999; scale-y: 0.999; }
        frame 15 { x: -6; y: 2; skew-x: -60.8; skew-y: -60.8; scale-x: 0.998; scale-y: 0.998; }
        frame 16 { x: -7.6; y: 0.4; skew-x: -52.4; skew-y: -52.4; scale-x: 1; scale-y: 1; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN2; }
        frame 17 { x: 5.1; y: 4.9; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN1_GOLD; }
        frame 18 { x: 1.6; y: 3.4; skew-x: -6.2; skew-y: -6.2; image: none; }
        frame 19 { x: -1.4; y: 2.4; skew-x: -12.7; skew-y: -12.7; scale-x: 0.999; scale-y: 0.999; }
        frame 20 { x: -3.9; y: 1.7; skew-x: -19.2; skew-y: -19.2; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -5.8; y: 1.2; skew-x: -25.5; skew-y: -25.5; }
        frame 22 { x: -7.2; y: 1; skew-x: -32; skew-y: -32; }
        frame 23 { x: -7.9; y: -10000; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998; scale-y: 0.998; }
        frame 24 { x: -8; y: 1; skew-x: -44.9; skew-y: -44.9; scale-x: 1; scale-y: 1; }
        frame 25 { x: 6.8; y: 22.4; skew-x: -52.7; skew-y: -52.7; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 24; y: 26.8; skew-x: -57.7; skew-y: -57.7; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN2_GOLD; }
        frame 27 { x: 48.1; y: 23.6; skew-x: -65.7; skew-y: -65.7; scale-x: 0.998; scale-y: 0.998; image: none; }
        frame 28 { x: 59.9; y: 12.5; skew-x: -73.4; skew-y: -73.4; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZENGARDEN_WATERINGCAN3_GOLD; }
        frame 29 { x: 48.5; y: 1.2; skew-x: -81; skew-y: -81; scale-x: -10000; scale-y: -10000; image: none; }
        frame 30 { x: 30.3; y: -0; skew-x: -86.2; skew-y: -86.2; }
        frame 31 { x: 13.6; y: 5.7; skew-x: -94.4; skew-y: -94.4; scale-x: 0.997; scale-y: 0.997; }
        frame 32 { x: 2.9; y: 14.9; skew-x: -100.6; skew-y: -100.6; scale-x: 0.998; scale-y: 0.998; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
}
