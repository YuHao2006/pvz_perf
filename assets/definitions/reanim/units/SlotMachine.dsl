export component SlotMachine {
    fps: 12;
    Track {
        source-name: "anim_return";
        frame-count: 9;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { cel: 0; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "anim_pull";
        frame-count: 9;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "shaft";
        frame-count: 9;
        frame 0 { x: 378.3; y: 83.3; skew-x: 296; skew-y: 296; scale-x: 0.599; scale-y: 0.599; image: IMAGE_REANIM_SLOTMACHINE_SHAFT; }
        frame 1 { x: 376.4; y: 80.3; skew-x: 317.7; skew-y: 317.7; scale-x: 0.355; scale-y: 0.598; image: none; }
        frame 2 { x: 378.4; y: 76.1; skew-x: 356; skew-y: 356; scale-x: 0.263; scale-y: 0.599; }
        frame 3 { x: 383.4; y: 73.8; skew-x: 400.8; skew-y: 400.8; scale-x: 0.336; scale-y: 0.598; }
        frame 4 { x: 388; y: 73.4; skew-x: 422.2; skew-y: 422.2; scale-x: 0.464; scale-y: -10000; }
        frame 5 { x: 383.4; y: 73.8; skew-x: 400.8; skew-y: 400.8; scale-x: 0.336; }
        frame 6 { x: 378.4; y: 76.1; skew-x: 356; skew-y: 356; scale-x: 0.263; scale-y: 0.599; }
        frame 7 { x: 376.4; y: 80.3; skew-x: 317.7; skew-y: 317.7; scale-x: 0.355; scale-y: 0.598; }
        frame 8 { x: 378.3; y: 83.3; skew-x: 296; skew-y: 296; scale-x: 0.599; scale-y: 0.599; }
    }
    Track {
        source-name: "base";
        frame-count: 9;
        frame 0 { x: 378.5; y: 34.3; scale-x: 0.6; scale-y: 0.6; image: IMAGE_REANIM_SLOTMACHINE_BASE; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
    }
    Track {
        source-name: "ball";
        frame-count: 9;
        frame 0 { x: 390.4; y: 31.2; scale-x: 0.6; scale-y: 0.6; image: IMAGE_REANIM_SLOTMACHINE_BALL; }
        frame 1 { x: 388.9; y: 46.4; scale-x: 0.67; scale-y: 0.67; image: none; }
        frame 2 { x: 387.3; y: 61.6; scale-x: 0.741; scale-y: 0.741; }
        frame 3 { x: 391; y: 87.7; scale-x: 0.643; scale-y: 0.643; }
        frame 4 { x: 390.4; y: 101.1; scale-x: 0.6; scale-y: 0.6; }
        frame 5 { x: 391; y: 87.7; scale-x: 0.643; scale-y: 0.643; }
        frame 6 { x: 387.3; y: 61.6; scale-x: 0.741; scale-y: 0.741; }
        frame 7 { x: 388.9; y: 46.4; scale-x: 0.67; scale-y: 0.67; }
        frame 8 { x: 390.4; y: 31.2; scale-x: 0.6; scale-y: 0.6; }
    }
}
