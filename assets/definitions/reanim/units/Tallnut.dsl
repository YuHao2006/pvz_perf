export component Tallnut {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 20 { y: -37.0999985; scale-x: 0.800000012; scale-y: 0.815999985; cel: 0; image: IMAGE_REANIM_TALLNUT_BODY; }
        frame 21 { x: -0.600000024; y: -36.0999985; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: 0.80400002; scale-y: 0.810000002; cel: -10000; image: none; }
        frame 22 { x: -1.29999995; y: -35; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: 0.808000028; scale-y: 0.80400002; }
        frame 23 { x: -2.0999999; y: -34; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.811999977; scale-y: 0.797999978; }
        frame 24 { x: -2.79999995; y: -33; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.815999985; scale-y: 0.791999996; }
        frame 25 { x: -2.0999999; y: -34; skew-x: -0.699999988; skew-y: -0.600000024; scale-x: 0.811999977; scale-y: 0.797999978; }
        frame 26 { x: -1.29999995; y: -35.0999985; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: 0.808000028; scale-y: 0.80400002; }
        frame 27 { x: -0.699999988; y: -36.0999985; skew-x: -0.200000003; skew-y: -0.100000001; scale-x: 0.80400002; scale-y: 0.810000002; }
        frame 28 { x: 0; y: -37.0999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.815999985; }
        frame 29 { x: 0.200000003; y: -36.4000015; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.80400002; scale-y: 0.810000002; }
        frame 30 { x: 0.5; y: -35.7000008; skew-x: 0.5; skew-y: 0.5; scale-x: 0.808000028; scale-y: 0.80400002; }
        frame 31 { x: 0.800000012; y: -35; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.811999977; scale-y: 0.797999978; }
        frame 32 { x: 1.10000002; y: -34.2999992; skew-x: 1; skew-y: 1; scale-x: 0.815999985; scale-y: 0.791999996; }
        frame 33 { x: 0.800000012; y: -35; skew-x: 0.800000012; skew-y: 0.699999988; scale-x: 0.811999977; scale-y: 0.797999978; }
        frame 34 { x: 0.5; y: -35.5999985; skew-x: 0.5; skew-y: 0.5; scale-x: 0.808000028; scale-y: 0.80400002; }
        frame 35 { x: 0.200000003; y: -36.4000015; skew-x: 0.300000012; skew-y: 0.200000003; scale-x: 0.80400002; scale-y: 0.810000002; }
        frame 36 { x: 0; y: -37.0999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.815999985; }
    }
    Track {
        source-name: "anim_blink_twice";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { x: 31.2000008; y: -15; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 2 { x: 31.1000004; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_TALLNUT_BLINK2; }
        frame 3 { x: 31.2000008; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 4 { x: -10000; cel: -1; image: none; }
        frame 5 { cel: 0; }
        frame 6 { x: 31.1000004; cel: -10000; image: IMAGE_REANIM_TALLNUT_BLINK2; }
        frame 7 { x: 31.2000008; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 8 { x: -10000; cel: -1; image: none; }
        frame 9 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink_thrice";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 31.2000008; y: -15; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 10 { x: 31.1000004; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_TALLNUT_BLINK2; }
        frame 11 { x: 31.2000008; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 12 { x: -10000; cel: -1; image: none; }
        frame 13 { cel: 0; }
        frame 14 { x: 31.1000004; cel: -10000; image: IMAGE_REANIM_TALLNUT_BLINK2; }
        frame 15 { x: 31.2000008; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 16 { x: -10000; cel: -1; image: none; }
        frame 17 { cel: 0; }
        frame 18 { x: 31.1000004; cel: -10000; image: IMAGE_REANIM_TALLNUT_BLINK2; }
        frame 19 { x: 31.2000008; image: IMAGE_REANIM_TALLNUT_BLINK1; }
        frame 20 { x: -10000; cel: -1; image: none; }
        frame 21 { cel: -10000; }
    }
}
