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
        frame 0 { x: -45; y: 30.2000008; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_FIRE1; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_FIRE2; }
        frame 2 { image: IMAGE_REANIM_FIRE3; }
        frame 3 { x: -41.7999992; y: 26.3999996; scale-y: 0.843999982; image: IMAGE_REANIM_FIRE4; }
        frame 4 { x: -43.9000015; y: 22.8999996; scale-y: 0.800000012; image: IMAGE_REANIM_FIRE4B; }
        frame 5 { x: -41.5; y: 14.1000004; scale-y: -10000; image: IMAGE_REANIM_FIRE5; }
        frame 6 { x: -42; y: 6.0999999; image: IMAGE_REANIM_FIRE5B; }
        frame 7 { x: -44.5999985; y: -3.4000001; image: IMAGE_REANIM_FIRE6; }
        frame 8 { x: -43.9000015; y: -14.6000004; image: IMAGE_REANIM_FIRE6B; }
        frame 9 { x: -44; y: -29.1000004; image: IMAGE_REANIM_FIRE7; }
        frame 10 { x: -45.7000008; y: -30.2999992; image: IMAGE_REANIM_FIRE7B; }
        frame 11 { x: -44.4000015; y: -39.5; image: IMAGE_REANIM_FIRE8; }
        frame 12 { x: -44.2000008; y: -46.5; alpha: 0; image: none; }
    }
}
