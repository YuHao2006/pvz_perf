export component Puff {
    fps: 12;
    Track {
        source-name: "anim_puff";
        frame-count: 15;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 6 { x: 88.3; y: 94; cel: 0; }
        frame 7 { x: -10000; y: -10000; cel: -10000; }
    }
    Track {
        source-name: "Puff";
        frame-count: 15;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 6 { x: 88.6; y: 94.2; cel: 0; image: IMAGE_REANIM_PUFF_1; }
        frame 7 { x: 88.1; y: 90.7; cel: -10000; image: IMAGE_REANIM_PUFF_3; }
        frame 8 { x: 87.2; y: 90; image: IMAGE_REANIM_PUFF_4; }
        frame 9 { x: 83.2; y: 87.2; image: IMAGE_REANIM_PUFF_5; }
        frame 10 { x: 76.8; y: 84.3; image: IMAGE_REANIM_PUFF_7; }
        frame 11 { x: 65; y: 74.7; scale-x: 1.223; scale-y: 1.223; alpha: 0.75; image: none; }
        frame 12 { x: 53; y: 65.1; scale-x: 1.446; scale-y: 1.446; alpha: 0.5; }
        frame 13 { x: 41.1; y: 55.5; scale-x: 1.669; scale-y: 1.669; alpha: 0.25; }
        frame 14 { x: 29.3; y: 45.9; scale-x: 1.892; scale-y: 1.892; alpha: 0; }
    }
}
