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
        frame 0 { x: 378.299988; y: 83.3000031; skew-x: 296; skew-y: 296; scale-x: 0.598999977; scale-y: 0.598999977; image: IMAGE_REANIM_SLOTMACHINE_SHAFT; }
        frame 1 { x: 376.399994; y: 80.3000031; skew-x: 317.700012; skew-y: 317.700012; scale-x: 0.354999989; scale-y: 0.59799999; image: none; }
        frame 2 { x: 378.399994; y: 76.0999985; skew-x: 356; skew-y: 356; scale-x: 0.263000011; scale-y: 0.598999977; }
        frame 3 { x: 383.399994; y: 73.8000031; skew-x: 400.799988; skew-y: 400.799988; scale-x: 0.335999995; scale-y: 0.59799999; }
        frame 4 { x: 388; y: 73.4000015; skew-x: 422.200012; skew-y: 422.200012; scale-x: 0.463999987; scale-y: -10000; }
        frame 5 { x: 383.399994; y: 73.8000031; skew-x: 400.799988; skew-y: 400.799988; scale-x: 0.335999995; }
        frame 6 { x: 378.399994; y: 76.0999985; skew-x: 356; skew-y: 356; scale-x: 0.263000011; scale-y: 0.598999977; }
        frame 7 { x: 376.399994; y: 80.3000031; skew-x: 317.700012; skew-y: 317.700012; scale-x: 0.354999989; scale-y: 0.59799999; }
        frame 8 { x: 378.299988; y: 83.3000031; skew-x: 296; skew-y: 296; scale-x: 0.598999977; scale-y: 0.598999977; }
    }
    Track {
        source-name: "base";
        frame-count: 9;
        frame 0 { x: 378.5; y: 34.2999992; scale-x: 0.600000024; scale-y: 0.600000024; image: IMAGE_REANIM_SLOTMACHINE_BASE; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
    }
    Track {
        source-name: "ball";
        frame-count: 9;
        frame 0 { x: 390.399994; y: 31.2000008; scale-x: 0.600000024; scale-y: 0.600000024; image: IMAGE_REANIM_SLOTMACHINE_BALL; }
        frame 1 { x: 388.899994; y: 46.4000015; scale-x: 0.670000017; scale-y: 0.670000017; image: none; }
        frame 2 { x: 387.299988; y: 61.5999985; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 3 { x: 391; y: 87.6999969; scale-x: 0.643000007; scale-y: 0.643000007; }
        frame 4 { x: 390.399994; y: 101.099998; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 5 { x: 391; y: 87.6999969; scale-x: 0.643000007; scale-y: 0.643000007; }
        frame 6 { x: 387.299988; y: 61.5999985; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 7 { x: 388.899994; y: 46.4000015; scale-x: 0.670000017; scale-y: 0.670000017; }
        frame 8 { x: 390.399994; y: 31.2000008; scale-x: 0.600000024; scale-y: 0.600000024; }
    }
}
