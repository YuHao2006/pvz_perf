export component Zombie_bungi {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 67;
        frame 20 { cel: -1; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "anim_drop";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 20 { cel: 0; }
        frame 21 { cel: -10000; }
        frame 29 { cel: -1; }
        frame 30 { cel: -10000; }
    }
    Track {
        source-name: "anim_grab";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 29 { cel: 0; }
        frame 30 { cel: -10000; }
        frame 44 { cel: -1; }
        frame 45 { cel: -10000; }
    }
    Track {
        source-name: "anim_hold";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 44 { cel: 0; }
        frame 45 { cel: -10000; }
        frame 54 { cel: -1; }
        frame 55 { cel: -10000; }
    }
    Track {
        source-name: "anim_raise";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 54 { cel: 0; }
        frame 55 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_body";
        frame-count: 67;
        frame 0 { x: 17.6000004; y: 17; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_BODY; }
        frame 1 { x: -10000; y: 17.3999996; scale-x: -10000; scale-y: 0.688000023; image: none; }
        frame 2 { y: 17.7999992; scale-y: 0.675000012; }
        frame 3 { y: 20.3999996; scale-y: 0.67900002; }
        frame 4 { y: 22.8999996; scale-y: 0.683000028; }
        frame 5 { y: 25.5; scale-y: 0.686999977; }
        frame 6 { y: 28; scale-y: 0.689999998; }
        frame 7 { y: 30.6000004; scale-y: 0.694000006; }
        frame 8 { y: 33; scale-y: 0.698000014; }
        frame 9 { y: 35.5999985; scale-y: 0.702000022; }
        frame 10 { y: 38.2000008; scale-y: 0.677999973; }
        frame 11 { y: 40.9000015; scale-y: 0.653999984; }
        frame 12 { y: 43.5; scale-y: 0.629999995; }
        frame 13 { y: 39.7000008; scale-y: 0.639999986; }
        frame 14 { y: 36; scale-y: 0.651000023; }
        frame 15 { y: 32.0999985; scale-y: 0.661000013; }
        frame 16 { y: 28.3999996; scale-y: 0.671000004; }
        frame 17 { y: 24.6000004; scale-y: 0.680999994; }
        frame 18 { y: 20.7999992; scale-y: 0.690999985; }
        frame 19 { y: 17; scale-y: 0.702000022; }
        frame 20 { y: -10000; scale-y: -10000; }
        frame 30 { x: 17.1000004; y: 17.8999996; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 31 { x: 16.7000008; y: 18.7000008; scale-x: 0.728999972; scale-y: 0.676999986; }
        frame 32 { x: 17.2000008; y: 17.8999996; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 33 { x: 17.6000004; y: 17; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 34 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 41 { cel: -1; }
        frame 42 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightleg_upper";
        frame-count: 67;
        frame 0 { x: 12.5; y: 50.5999985; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTLEG_UPPER; }
        frame 1 { x: 14.1999998; y: 48.4000015; skew-x: 5.5; skew-y: 5.5; scale-x: 0.700999975; scale-y: 0.700999975; image: none; }
        frame 2 { x: 15.8999996; y: 46.0999985; skew-x: 11.3000002; skew-y: 11.3000002; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 15.6999998; y: 49.2999992; skew-x: 10.3000002; skew-y: 10.3000002; }
        frame 4 { x: 15.5; y: 52.0999985; skew-x: 9.60000038; skew-y: 9.60000038; }
        frame 5 { x: 15.3999996; y: 55.2999992; skew-x: 8.80000019; skew-y: 8.80000019; }
        frame 6 { x: 15.1000004; y: 58.2999992; skew-x: 8; skew-y: 8; }
        frame 7 { x: 15; y: 61.4000015; skew-x: 7.30000019; skew-y: 7.30000019; }
        frame 8 { x: 14.8000002; y: 64.4000015; skew-x: 6.5; skew-y: 6.5; }
        frame 9 { x: 14.6999998; y: 67.4000015; skew-x: 5.80000019; skew-y: 5.80000019; }
        frame 10 { x: 13.8000002; y: 70.3000031; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 11 { x: 13.1000004; y: 73.1999969; skew-x: -4.9000001; skew-y: -4.9000001; }
        frame 12 { x: 12.3000002; y: 76.1999969; skew-x: -10.3999996; skew-y: -10.3999996; }
        frame 13 { x: -10000; y: 72.5; skew-x: -8.69999981; skew-y: -8.69999981; }
        frame 14 { y: 68.8000031; skew-x: -7.19999981; skew-y: -7.19999981; }
        frame 15 { x: 12.3999996; y: 65.0999985; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 16 { x: -10000; y: 61.5; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 17 { x: 12.3000002; y: 57.9000015; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 18 { x: 12.3999996; y: 54.0999985; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 19 { x: 12.5; y: 50.5999985; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 50.4000015; skew-x: 0.600000024; }
        frame 22 { y: 50.2000008; skew-x: 1.29999995; }
        frame 23 { y: 49.9000015; skew-x: 2; }
        frame 24 { y: 49.5; skew-x: 2.9000001; }
        frame 25 { y: 49.9000015; skew-x: 2; scale-y: 0.700999975; }
        frame 26 { y: 50.0999985; skew-x: 1.29999995; scale-y: -10000; }
        frame 27 { y: 50.4000015; skew-x: 0.600000024; }
        frame 28 { y: 50.5999985; skew-x: 0; scale-y: 0.702000022; }
        frame 29 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 30 { y: 50; skew-x: 1.79999995; }
        frame 31 { y: 49.4000015; skew-x: 3.5999999; scale-x: 0.703000009; }
        frame 32 { y: 50; skew-x: 1.79999995; scale-x: 0.702000022; scale-y: 0.700999975; }
        frame 33 { y: 50.5999985; skew-x: 0; scale-x: -10000; scale-y: 0.702000022; }
        frame 34 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 38 { x: 13; y: 50; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 39 { x: 13.6999998; y: 49.2000008; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 14.1999998; y: 48.5; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 41 { x: 13.6000004; y: 49.2999992; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 42 { x: 13; y: 49.9000015; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 43 { x: 12.5; y: 50.5999985; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 12.6000004; skew-x: -2.4000001; scale-x: 0.703999996; }
        frame 62 { x: 12.5; y: 50.5; skew-x: -5.19999981; scale-x: 0.70599997; }
        frame 63 { x: -10000; y: -10000; skew-x: -7.9000001; scale-x: 0.708000004; }
        frame 64 { x: 11.3000002; y: 52; skew-x: -17.7000008; skew-y: -9.39999962; scale-x: 0.726999998; scale-y: 0.700999975; }
        frame 65 { x: 10.3000002; y: 53.5999985; skew-x: -27.7000008; skew-y: -18.8999996; scale-x: 0.745999992; scale-y: 0.699999988; }
        frame 66 { x: 9.80000019; y: 55.4000015; skew-x: -37.7000008; skew-y: -28.5; scale-x: 0.765999973; scale-y: 0.700999975; }
    }
    Track {
        source-name: "Zombie_bungi_rightleg_lower";
        frame-count: 67;
        frame 0 { x: 5.80000019; y: 52.5999985; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTLEG_LOWER; }
        frame 1 { x: 7.5; y: 49.9000015; skew-x: 6.80000019; skew-y: 6; scale-x: 0.700999975; scale-y: 0.700999975; image: none; }
        frame 2 { x: 9.30000019; y: 47.2999992; skew-x: 13.8000002; skew-y: 12.3000002; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -10000; y: 50.2999992; skew-x: 13.3000002; skew-y: 12; scale-y: 0.699999988; }
        frame 4 { x: 9.19999981; y: 53.2000008; skew-x: 12.8000002; skew-y: 11.8000002; scale-y: -10000; }
        frame 5 { x: -10000; y: 56.0999985; skew-x: 12.5; skew-y: 11.6000004; scale-y: 0.700999975; }
        frame 6 { x: 9.10000038; y: 59.0999985; skew-x: 12; skew-y: 11.3000002; scale-y: -10000; }
        frame 7 { x: 9.19999981; y: 62.0999985; skew-x: 11.6000004; skew-y: -10000; }
        frame 8 { x: -10000; y: 65; skew-x: 11.3000002; skew-y: 11; }
        frame 9 { x: 9.10000038; y: 68; skew-x: 10.8000002; skew-y: 10.8000002; }
        frame 10 { x: 8.19999981; y: 71.3000031; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 11 { x: 7.5; y: 74.8000031; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 12 { x: 6.80000019; y: 78.5; skew-x: -6.5999999; skew-y: -6.5999999; }
        frame 13 { x: -10000; y: 74.8000031; skew-x: -5.5; skew-y: -5.5; }
        frame 14 { x: 6.5; y: 71.0999985; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 15 { x: 6.30000019; y: 67.4000015; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 16 { x: 6.19999981; y: 63.7000008; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 17 { x: 6.0999999; y: 60; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 18 { x: 5.80000019; y: 56.2999992; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 19 { x: -10000; y: 52.5999985; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 52.2999992; skew-x: 0.600000024; }
        frame 22 { y: 52; skew-x: 1.29999995; }
        frame 23 { y: 51.5999985; skew-x: 2; }
        frame 24 { y: 51.2000008; skew-x: 2.9000001; }
        frame 25 { y: 51.5999985; skew-x: 2; scale-y: 0.700999975; }
        frame 26 { y: 52; skew-x: 1.29999995; scale-y: -10000; }
        frame 27 { y: 52.2999992; skew-x: 0.600000024; }
        frame 28 { y: 52.5999985; skew-x: 0; scale-y: 0.702000022; }
        frame 29 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 30 { y: 51.7999992; skew-x: 1.79999995; }
        frame 31 { y: 50.9000015; skew-x: 3.5999999; scale-x: 0.703000009; }
        frame 32 { y: 51.7000008; skew-x: 1.79999995; scale-x: 0.702000022; scale-y: 0.700999975; }
        frame 33 { y: 52.5999985; skew-x: 0; scale-x: -10000; scale-y: 0.702000022; }
        frame 34 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 38 { x: 6.30000019; y: 51.2000008; skew-x: 4; skew-y: 4; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 39 { x: 6.69999981; y: 49.7999992; skew-x: 8.10000038; skew-y: 8.10000038; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 7.30000019; y: 48.5; skew-x: 12.3000002; skew-y: 12.3000002; }
        frame 41 { x: 6.69999981; y: 49.9000015; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 42 { x: 6.30000019; y: 51.2000008; skew-x: 4; skew-y: 4; }
        frame 43 { x: 5.80000019; y: 52.5999985; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { y: 52.7999992; }
        frame 62 { y: 52.9000015; }
        frame 63 { y: 53; }
        frame 64 { x: 6.19999981; y: 53.7999992; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.700999975; scale-y: 0.717000008; }
        frame 65 { x: 6.4000001; y: 54.5; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: -10000; scale-y: 0.731999993; }
        frame 66 { x: 6.69999981; y: 55.5; skew-x: -7.9000001; skew-y: -7.9000001; scale-y: 0.748000026; }
    }
    Track {
        source-name: "Zombie_bungi_rightleg_foot";
        frame-count: 67;
        frame 0 { x: -12.8000002; y: 66.3000031; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_FOOT; }
        frame 1 { x: -11.1999998; y: 60.4000015; skew-x: 10.3000002; skew-y: 10.3000002; scale-x: 0.700999975; scale-y: 0.700999975; image: none; }
        frame 2 { x: -9.10000038; y: 54.7999992; skew-x: 20.7999992; skew-y: 20.7999992; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 3 { x: -9.19999981; y: 57.5; skew-x: 20.6000004; skew-y: 20.6000004; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: -9.10000038; y: 60.0999985; skew-x: 20.5; skew-y: 20.5; }
        frame 5 { x: -10000; y: 62.9000015; skew-x: 20.2999992; skew-y: 20.2999992; }
        frame 6 { x: -9; y: 65.6999969; skew-x: -10000; skew-y: -10000; }
        frame 7 { x: -10000; y: 68.4000015; skew-x: 20.1000004; skew-y: 20.1000004; }
        frame 8 { y: 71.0999985; skew-x: 20; skew-y: 20; }
        frame 9 { x: -9.10000038; y: 73.8000031; skew-x: 19.8999996; skew-y: 19.8999996; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 10 { x: -12; y: 82.6999969; skew-x: 3.29999995; skew-y: 3.29999995; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 11 { x: -13.5; y: 92.8000031; skew-x: -12.8999996; skew-y: -12.8999996; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: -10000; y: 103.800003; skew-x: -29.6000004; skew-y: -29.6000004; }
        frame 13 { x: -13.6999998; y: 98.3000031; skew-x: -25.2000008; skew-y: -25.2000008; }
        frame 14 { x: -13.8999996; y: 92.8000031; skew-x: -21; skew-y: -21; }
        frame 15 { x: -10000; y: 87.5; skew-x: -16.7000008; skew-y: -16.7000008; }
        frame 16 { x: -13.8000002; y: 82.0999985; skew-x: -12.5; skew-y: -12.5; }
        frame 17 { x: -13.5; y: 76.8000031; skew-x: -8.19999981; skew-y: -8.19999981; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 18 { x: -13.3000002; y: 71.5; skew-x: -4; skew-y: -4; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -12.8000002; y: 66.3000031; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -12.5; y: 65.3000031; skew-x: 1.5; skew-y: 1.5; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 22 { x: -12.1000004; y: 64.3000031; skew-x: 3.29999995; skew-y: 3.29999995; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -12.6000004; y: 65.3000031; skew-x: 1.5; skew-y: 1.5; }
        frame 24 { x: -12.8000002; y: 66.3000031; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 25 { x: -12.5; y: 65.3000031; skew-x: 1.5; skew-y: 1.5; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 26 { x: -12.1000004; y: 64.3000031; skew-x: 3.29999995; skew-y: 3.29999995; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -12.6000004; y: 65.3000031; skew-x: 1.5; skew-y: 1.5; }
        frame 28 { x: -12.8000002; y: 66.3000031; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 64.9000015; skew-x: 1.79999995; }
        frame 31 { y: 63.5; skew-x: 3.5999999; scale-x: 0.703000009; }
        frame 32 { y: 65; skew-x: 1.79999995; scale-x: 0.702000022; scale-y: 0.700999975; }
        frame 33 { y: 66.3000031; skew-x: 0; scale-x: -10000; scale-y: 0.702000022; }
        frame 34 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 38 { x: -12.3999996; y: 62.2999992; skew-x: 7; skew-y: 7; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 39 { x: -11.8000002; y: 58.4000015; skew-x: 14.3000002; skew-y: 14.3000002; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 40 { x: -11; y: 54.9000015; skew-x: 21.3999996; skew-y: 21.3999996; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 41 { x: -11.8000002; y: 58.5; skew-x: 14.3000002; skew-y: 14.3000002; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 42 { x: -12.5; y: 62.4000015; skew-x: 7; skew-y: 7; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 43 { x: -12.8000002; y: 66.3000031; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { y: 66.5; }
        frame 62 { y: 66.5999985; }
        frame 63 { y: 66.8000031; }
        frame 64 { x: -13.3999996; y: 72.1999969; skew-x: -11.3999996; skew-y: -11.3999996; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 65 { x: -13.3000002; y: 78.1999969; skew-x: -23; skew-y: -23; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 66 { x: -12.3999996; y: 84.4000015; skew-x: -34.7999992; skew-y: -34.7999992; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftleg_upper";
        frame-count: 67;
        frame 0 { x: 51.2999992; y: 47.5; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTLEG_UPPER; }
        frame 1 { x: 51; y: 47.2999992; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.700999975; scale-y: 0.700999975; image: none; }
        frame 2 { x: 50.5999985; y: 47; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 50.2999992; y: 49.9000015; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 4 { x: 50; y: 52.7999992; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 5 { x: 49.5999985; y: 55.5999985; skew-x: -5.19999981; skew-y: -5.19999981; }
        frame 6 { x: 49.2999992; y: 58.5; skew-x: -6.19999981; skew-y: -6.19999981; }
        frame 7 { x: 49; y: 61.4000015; skew-x: -7.4000001; skew-y: -7.4000001; }
        frame 8 { x: 48.7000008; y: 64.3000031; skew-x: -8.5; skew-y: -8.5; }
        frame 9 { x: 48.2999992; y: 67.3000031; skew-x: -9.69999981; skew-y: -9.69999981; }
        frame 10 { x: 49.4000015; y: 68; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 11 { x: 50.5; y: 68.6999969; skew-x: 1.60000002; skew-y: 1.60000002; }
        frame 12 { x: 51.9000015; y: 69.5999985; skew-x: 7.5; skew-y: 7.5; }
        frame 13 { x: 51.7999992; y: 66.5; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 14 { x: 51.5999985; y: 63.2999992; skew-x: 5.30000019; skew-y: 5.30000019; }
        frame 15 { x: 51.5; y: 60.0999985; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 16 { x: 51.4000015; y: 57; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 17 { x: -10000; y: 53.7999992; skew-x: 2; skew-y: 2; }
        frame 18 { x: 51.2999992; y: 50.5999985; skew-x: 1; skew-y: 1; }
        frame 19 { x: -10000; y: 47.5; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { skew-x: -1.20000005; }
        frame 22 { skew-x: -2.4000001; scale-x: 0.703000009; }
        frame 23 { x: 51.4000015; skew-x: -3.70000005; scale-x: -10000; }
        frame 24 { x: 51.2999992; y: 47.5999985; skew-x: -4.9000001; scale-x: 0.703999996; }
        frame 25 { x: 51.4000015; y: -10000; skew-x: -3.70000005; scale-x: 0.703000009; scale-y: 0.700999975; }
        frame 26 { x: 51.2999992; skew-x: -2.4000001; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -10000; skew-x: -1.20000005; scale-x: 0.702000022; }
        frame 28 { y: 47.5; skew-x: 0; scale-x: -10000; scale-y: 0.702000022; }
        frame 29 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 30 { skew-x: -1.5; }
        frame 31 { skew-x: -3.4000001; scale-x: 0.703000009; }
        frame 32 { skew-x: -1.5; scale-x: 0.702000022; scale-y: 0.700999975; }
        frame 33 { skew-x: 0; scale-x: -10000; scale-y: 0.702000022; }
        frame 34 { skew-x: -10000; scale-y: -10000; }
        frame 38 { x: 51.0999985; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 39 { x: 50.9000015; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 50.5999985; y: 47.5999985; skew-x: -4.5; skew-y: -4.5; }
        frame 41 { x: 50.7999992; y: -10000; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 42 { x: 51; y: 47.5; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 43 { x: 51.2999992; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 44 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { y: 46.5; skew-x: 2; scale-x: 0.703000009; }
        frame 62 { y: 45.5; skew-x: 4.30000019; scale-x: 0.703999996; }
        frame 63 { y: 44.5; skew-x: 6.5; scale-x: 0.70599997; }
        frame 64 { x: 53.0999985; y: 42.5; skew-x: 14.3000002; skew-y: 7.80000019; scale-x: 0.704999983; scale-y: 0.700999975; }
        frame 65 { x: 55.0999985; y: 40.5999985; skew-x: 22.2999992; skew-y: 15.8000002; scale-x: -10000; scale-y: 0.699999988; }
        frame 66 { x: 57.2999992; y: 39; skew-x: 30.2999992; skew-y: 23.7999992; scale-y: 0.700999975; }
    }
    Track {
        source-name: "Zombie_bungi_left_tatter";
        frame-count: 67;
        frame 0 { x: 58; y: 44; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFT_TATTER; }
        frame 1 { x: 57.5; y: 44.5999985; skew-x: -2.9000001; skew-y: -1.39999998; scale-x: 0.703000009; scale-y: 0.711000025; image: none; }
        frame 2 { x: 57.0999985; y: 45.2000008; skew-x: -5.9000001; skew-y: -3.20000005; scale-x: 0.704999983; scale-y: 0.721000016; }
        frame 3 { x: 56.7000008; y: 48; skew-x: -8.89999962; skew-y: -4.69999981; scale-x: 0.70599997; scale-y: 0.730000019; }
        frame 4 { x: 56.2000008; y: 50.7000008; skew-x: -11.8999996; skew-y: -6.4000001; scale-x: 0.708000004; scale-y: 0.74000001; }
        frame 5 { x: 55.7999992; y: 53.4000015; skew-x: -14.8999996; skew-y: -8.19999981; scale-x: 0.709999979; scale-y: 0.749000013; }
        frame 6 { x: 55.4000015; y: 56.2000008; skew-x: -17.8999996; skew-y: -9.69999981; scale-x: 0.711000025; scale-y: 0.759000003; }
        frame 7 { x: 55; y: 58.9000015; skew-x: -20.8999996; skew-y: -11.3999996; scale-x: 0.713; scale-y: 0.768000007; }
        frame 8 { x: 54.5999985; y: 61.5999985; skew-x: -23.8999996; skew-y: -13.1999998; scale-x: 0.714999974; scale-y: 0.777999997; }
        frame 9 { x: 54.4000015; y: 64.4000015; skew-x: -27; skew-y: -14.8999996; scale-x: 0.717000008; scale-y: 0.787999988; }
        frame 10 { x: 55.2000008; y: 65.5999985; skew-x: -14.8999996; skew-y: -3.70000005; scale-x: 0.714999974; scale-y: 0.781000018; }
        frame 11 { x: 56.2999992; y: 67; skew-x: -2.9000001; skew-y: 7.30000019; scale-x: 0.713999987; scale-y: 0.774999976; }
        frame 12 { x: 57.5999985; y: 68.4000015; skew-x: 9; skew-y: 18.5; scale-x: 0.713; scale-y: 0.768000007; }
        frame 13 { x: 57.5; y: 65; skew-x: 7.5999999; skew-y: 15.8000002; scale-x: 0.711000025; scale-y: 0.758000016; }
        frame 14 { x: 57.7000008; y: 61.4000015; skew-x: 6.30000019; skew-y: 13.1000004; scale-x: 0.708999991; scale-y: 0.749000013; }
        frame 15 { x: -10000; y: 58; skew-x: 5; skew-y: 10.5; scale-x: 0.708000004; scale-y: 0.739000022; }
        frame 16 { y: 54.5; skew-x: 3.79999995; skew-y: 7.80000019; scale-x: 0.70599997; scale-y: 0.730000019; }
        frame 17 { x: 57.9000015; y: 51; skew-x: 2.5; skew-y: 5.30000019; scale-x: 0.704999983; scale-y: 0.720000029; }
        frame 18 { x: -10000; y: 47.5999985; skew-x: 1.29999995; skew-y: 2.5; scale-x: 0.703000009; scale-y: 0.711000025; }
        frame 19 { x: 58; y: 44; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 56.5999985; y: 43.2999992; skew-y: -12; scale-y: 0.842000008; }
        frame 22 { x: 55; y: 42.9000015; skew-y: -24.2999992; scale-y: 0.984000027; }
        frame 23 { x: 56.5999985; y: 43.4000015; skew-y: -12; scale-x: 0.700999975; scale-y: 0.842000008; }
        frame 24 { x: 58; y: 44; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 25 { x: 59.4000015; y: -10000; skew-x: 2; skew-y: 12.8000002; scale-x: 0.700999975; scale-y: 0.727999985; }
        frame 26 { x: 60.7999992; y: 44.0999985; skew-x: 4; skew-y: 26; scale-x: -10000; scale-y: 0.755999982; }
        frame 27 { x: 59.5; y: -10000; skew-x: 2; skew-y: 12.8000002; scale-y: 0.727999985; }
        frame 28 { x: 58; y: 44; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 43.7999992; }
        frame 31 { y: 43.5; }
        frame 32 { y: 43.7999992; }
        frame 33 { y: 44; }
        frame 34 { y: -10000; }
        frame 38 { x: 57.7999992; y: 44.2000008; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 39 { x: 57.5999985; y: 44.4000015; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 57.5; y: 44.5; skew-x: -8.19999981; skew-y: -8.19999981; }
        frame 41 { x: -10000; y: 44.7000008; skew-x: -10.8999996; skew-y: -10.8999996; }
        frame 42 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 55 { x: 57.7000008; y: 44.4000015; skew-x: -5.4000001; skew-y: -5.4000001; }
        frame 56 { x: 58; y: 44; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 57 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { y: 43; }
        frame 62 { y: 42; }
        frame 63 { y: 41; }
        frame 64 { y: 39; }
        frame 65 { y: 37; }
        frame 66 { y: 35; }
    }
    Track {
        source-name: "Zombie_bungi_leftshirt";
        frame-count: 67;
        frame 0 { x: 58.7000008; y: 30.2000008; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTSHIRT; }
        frame 1 { x: 57.4000015; y: 30.5; skew-x: -11.3999996; skew-y: -4.69999981; scale-x: 0.713999987; scale-y: 0.700999975; image: none; }
        frame 2 { x: 56.5; y: 30.7999992; skew-x: -22.8999996; skew-y: -9.39999962; scale-x: 0.726999998; scale-y: -10000; }
        frame 3 { x: 56.7999992; y: 33.5; skew-x: -22; skew-y: -7.9000001; scale-x: -10000; }
        frame 4 { x: 57.0999985; y: 36.4000015; skew-x: -21.2000008; skew-y: -6.69999981; scale-x: 0.727999985; }
        frame 5 { x: 57.4000015; y: 39; skew-x: -20.3999996; skew-y: -5.19999981; scale-x: 0.728999972; }
        frame 6 { x: 57.5999985; y: 41.7000008; skew-x: -19.5; skew-y: -3.9000001; scale-x: 0.730000019; }
        frame 7 { x: 57.9000015; y: 44.5; skew-x: -18.7000008; skew-y: -2.5; scale-x: 0.731999993; }
        frame 8 { x: 58.2999992; y: 47.2999992; skew-x: -17.8999996; skew-y: -1.20000005; scale-x: 0.73299998; }
        frame 9 { x: 58.5; y: 50; skew-x: -17.1000004; skew-y: 0; scale-x: 0.735000014; scale-y: 0.702000022; }
        frame 10 { x: 58.0999985; y: 51.4000015; skew-x: -8.89999962; skew-y: -10000; scale-x: 0.726999998; scale-y: 0.700999975; }
        frame 11 { x: 57.9000015; y: 52.9000015; skew-x: -0.699999988; scale-x: 0.720000029; scale-y: -10000; }
        frame 12 { x: 58; y: 54.0999985; skew-x: 7.5; scale-x: 0.713; }
        frame 13 { x: 58.0999985; y: 50.7000008; skew-x: 6.30000019; scale-x: 0.711000025; }
        frame 14 { x: 58.2000008; y: 47.2999992; skew-x: 5.30000019; scale-x: 0.709999979; }
        frame 15 { x: 58.2999992; y: 43.9000015; skew-x: 4.30000019; scale-x: 0.708000004; }
        frame 16 { x: 58.4000015; y: 40.5; skew-x: 3.0999999; scale-x: 0.70599997; }
        frame 17 { x: 58.5; y: 37; skew-x: 2; scale-x: 0.704999983; }
        frame 18 { x: -10000; y: 33.5999985; skew-x: 1; scale-x: 0.703000009; }
        frame 19 { x: 58.7000008; y: 30.2000008; skew-x: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 58.5999985; y: 30.7000008; skew-x: -5.5; scale-x: 0.708000004; }
        frame 22 { x: 58.7000008; y: 31.2000008; skew-x: -11.3000002; scale-x: 0.716000021; }
        frame 23 { x: 58.5999985; y: 30.7000008; skew-x: -5.5; scale-x: 0.708000004; scale-y: 0.700999975; }
        frame 24 { x: 58.7000008; y: 30.2000008; skew-x: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 25 { x: 58.5999985; y: 30.7000008; skew-x: -5.5; scale-x: 0.708000004; scale-y: -10000; }
        frame 26 { x: 58.7000008; y: 31.2000008; skew-x: -11.3000002; scale-x: 0.716000021; }
        frame 27 { x: 58.5999985; y: 30.7000008; skew-x: -5.5; scale-x: 0.708000004; scale-y: 0.700999975; }
        frame 28 { x: 58.7000008; y: 30.2000008; skew-x: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 59; y: 30.8999996; skew-x: -1.20000005; scale-x: 0.717000008; scale-y: 0.68900001; }
        frame 31 { x: 59.4000015; y: 31.7000008; skew-x: -2.70000005; scale-x: 0.731999993; scale-y: 0.676999986; }
        frame 32 { x: 59; y: 30.8999996; skew-x: -1.20000005; scale-x: 0.716000021; scale-y: 0.68900001; }
        frame 33 { x: 58.7000008; y: 30.2000008; skew-x: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 34 { x: -10000; y: 30.3999996; skew-x: -1.89999998; scale-x: 0.703000009; scale-y: -10000; }
        frame 35 { y: 30.6000004; skew-x: -3.9000001; scale-x: 0.704999983; }
        frame 36 { y: 30.7999992; skew-x: -5.9000001; scale-x: 0.70599997; }
        frame 37 { y: 31; skew-x: -7.9000001; scale-x: 0.708000004; }
        frame 38 { x: 57.5999985; y: 29.2999992; skew-x: 17.2999992; skew-y: 7.5; scale-x: 0.703999996; scale-y: 0.745000005; }
        frame 39 { x: 58.5999985; y: 28.3999996; skew-x: 42.5999985; skew-y: 15.1000004; scale-x: 0.699999988; scale-y: 0.788999975; }
        frame 40 { x: 62.5; y: 28.2000008; skew-x: 64.9000015; skew-y: 37.4000015; scale-x: 0.699000001; scale-y: 0.787999988; }
        frame 41 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 42 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightshirt";
        frame-count: 67;
        frame 0 { x: 2.29999995; y: 36.4000015; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTSHIRT; }
        frame 1 { x: 4; y: 33; skew-x: 8.30000019; skew-y: 6.5; scale-x: 0.703000009; scale-y: 0.699000001; image: none; }
        frame 2 { x: 6.0999999; y: 29.8999996; skew-x: 16.5; skew-y: 13.3000002; scale-x: 0.70599997; scale-y: 0.697000027; }
        frame 3 { x: 5.80000019; y: 32.7999992; skew-x: 15.8000002; skew-y: 13.5; scale-x: 0.707000017; scale-y: 0.694999993; }
        frame 4 { x: 5.5999999; y: 35.7999992; skew-x: 15.3000002; skew-y: 13.6000004; scale-x: 0.708999991; scale-y: 0.694000006; }
        frame 5 { x: 5.30000019; y: 38.5999985; skew-x: 14.8000002; skew-y: 13.8000002; scale-x: 0.711000025; scale-y: 0.691999972; }
        frame 6 { x: 5; y: 41.5; skew-x: 14.1000004; skew-y: 14; scale-x: 0.712000012; scale-y: 0.689999998; }
        frame 7 { x: 4.80000019; y: 44.5; skew-x: 13.5; skew-y: 14.3000002; scale-x: 0.713999987; scale-y: 0.68900001; }
        frame 8 { x: 4.5999999; y: 47.4000015; skew-x: 12.8000002; skew-y: 14.5; scale-x: 0.716000021; scale-y: 0.686999977; }
        frame 9 { x: 4.19999981; y: 50; skew-x: 12.3999996; skew-y: 14.6999998; scale-x: 0.717999995; scale-y: 0.68599999; }
        frame 10 { x: 3; y: 55.7000008; skew-x: 2; skew-y: 7.30000019; scale-x: 0.726000011; scale-y: 0.681999981; }
        frame 11 { x: 2.5; y: 61.5999985; skew-x: -7.9000001; skew-y: 0; scale-x: 0.73299998; scale-y: 0.67900002; }
        frame 12 { x: -10000; y: 67.5999985; skew-x: -18.2000008; skew-y: -7.0999999; scale-x: 0.740999997; scale-y: 0.675999999; }
        frame 13 { x: 2.4000001; y: 63; skew-x: -15.5; skew-y: -6; scale-x: 0.735000014; scale-y: 0.67900002; }
        frame 14 { x: 2.29999995; y: 58.5; skew-x: -12.8999996; skew-y: -4.9000001; scale-x: 0.728999972; scale-y: 0.683000028; }
        frame 15 { x: 2.20000005; y: 54; skew-x: -10.1999998; skew-y: -3.9000001; scale-x: 0.723999977; scale-y: 0.686999977; }
        frame 16 { x: 2.0999999; y: 49.5999985; skew-x: -7.69999981; skew-y: -2.9000001; scale-x: 0.717999995; scale-y: 0.689999998; }
        frame 17 { x: -10000; y: 45.0999985; skew-x: -5; skew-y: -1.89999998; scale-x: 0.713; scale-y: 0.694000006; }
        frame 18 { y: 40.5999985; skew-x: -2.4000001; skew-y: -0.899999976; scale-x: 0.707000017; scale-y: 0.698000014; }
        frame 19 { x: 2.29999995; y: 36.4000015; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 34.7999992; skew-x: 4.30000019; scale-x: 0.704999983; }
        frame 22 { y: 33.0999985; skew-x: 8.80000019; scale-x: 0.709999979; }
        frame 23 { y: 34.7000008; skew-x: 4.30000019; scale-x: 0.704999983; scale-y: 0.700999975; }
        frame 24 { y: 36.4000015; skew-x: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 25 { y: 34.7999992; skew-x: 4.30000019; scale-x: 0.704999983; scale-y: -10000; }
        frame 26 { y: 33.0999985; skew-x: 8.80000019; scale-x: 0.709999979; }
        frame 27 { y: 34.7000008; skew-x: 4.30000019; scale-x: 0.704999983; scale-y: 0.700999975; }
        frame 28 { y: 36.4000015; skew-x: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 29 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 34.7999992; skew-x: 4; scale-x: 0.704999983; }
        frame 31 { y: 33.0999985; skew-x: 8.19999981; scale-x: 0.708999991; }
        frame 32 { x: 2.20000005; y: 34.7999992; skew-x: 4; scale-x: 0.704999983; scale-y: 0.700999975; }
        frame 33 { x: 2.29999995; y: 36.4000015; skew-x: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 34 { x: -10000; y: 36; skew-x: 0.800000012; scale-x: -10000; scale-y: -10000; }
        frame 35 { y: 35.5; skew-x: 1.79999995; }
        frame 36 { y: 35.0999985; skew-x: 2.79999995; scale-x: 0.703000009; }
        frame 37 { y: 34.5999985; skew-x: 3.9000001; scale-x: -10000; }
        frame 38 { x: 4; y: 41.5; skew-x: -15.6999998; skew-y: -2.70000005; scale-x: 0.700999975; scale-y: 0.755999982; }
        frame 39 { x: 7; y: 47.9000015; skew-x: -35.7000008; skew-y: -5.5; scale-x: 0.699999988; scale-y: 0.810000002; }
        frame 40 { x: 10.3999996; y: 57.5999985; skew-x: -62.5999985; skew-y: -47.5999985; scale-x: 0.699000001; scale-y: 0.723999977; }
        frame 41 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 42 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftleg_lower";
        frame-count: 67;
        frame 0 { x: 57.7999992; y: 53; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTLEG_LOWER; }
        frame 1 { x: 57.4000015; y: 53.4000015; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.700999975; scale-y: 0.700999975; image: none; }
        frame 2 { x: 56.9000015; y: 53.9000015; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 56.5; y: 57; skew-x: -7; skew-y: -7; }
        frame 4 { x: 56.2000008; y: 60.2999992; skew-x: -9.39999962; skew-y: -9.39999962; }
        frame 5 { x: 55.9000015; y: 63.5; skew-x: -11.8999996; skew-y: -11.8999996; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 6 { x: 55.5; y: 67; skew-x: -14.3999996; skew-y: -14.3999996; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 55.2999992; y: 70.3000031; skew-x: -16.7000008; skew-y: -16.7000008; }
        frame 8 { x: 55.0999985; y: 73.5999985; skew-x: -19.2000008; skew-y: -19.2000008; }
        frame 9 { x: 54.9000015; y: 76.8000031; skew-x: -21.7000008; skew-y: -21.7000008; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 10 { x: 55; y: 77.4000015; skew-x: -15; skew-y: -15; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 11 { x: 55.4000015; y: 78.3000031; skew-x: -8.19999981; skew-y: -8.19999981; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 55.9000015; y: 79.3000031; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 13 { x: 56.0999985; y: 75.5999985; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 14 { x: 56.4000015; y: 71.8000031; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 15 { x: 56.5999985; y: 68; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 57; y: 64.1999969; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 17 { x: 57.2999992; y: 60.5; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 18 { x: 57.5; y: 56.5999985; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 19 { x: 57.7999992; y: 53; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 52.5999985; }
        frame 22 { y: 52.2999992; }
        frame 23 { y: 52; }
        frame 24 { y: 51.5999985; }
        frame 25 { y: 52; }
        frame 26 { y: 52.2999992; }
        frame 27 { y: 52.5999985; }
        frame 28 { y: 53; }
        frame 29 { y: -10000; }
        frame 30 { y: 52.7999992; skew-x: -1.5; }
        frame 31 { y: 52.5999985; skew-x: -3.4000001; scale-x: 0.703000009; }
        frame 32 { x: 57.9000015; y: 52.7999992; skew-x: -1.5; scale-x: 0.702000022; scale-y: 0.700999975; }
        frame 33 { x: 57.7999992; y: 53; skew-x: 0; scale-x: -10000; scale-y: 0.702000022; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 38 { x: 57.5; y: 53.2999992; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 39 { x: 57.4000015; y: 53.5; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 57.2000008; y: 54; skew-x: -8.19999981; skew-y: -8.19999981; }
        frame 41 { x: 57.4000015; y: 53.5999985; skew-x: -5.4000001; skew-y: -5.4000001; }
        frame 42 { x: 57.5999985; y: 53.2999992; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 43 { x: 57.7999992; y: 53; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { y: 53.0999985; }
        frame 63 { y: 53.2000008; }
        frame 64 { x: 56.7999992; y: 53.7999992; }
        frame 65 { x: 55.5999985; y: 54.4000015; }
        frame 66 { x: 54.5999985; y: 55; }
    }
    Track {
        source-name: "Zombie_bungi_leftleg_tatter";
        frame-count: 67;
        frame 0 { x: 73.0999985; y: 64.3000031; scale-x: 0.746999979; scale-y: 0.746999979; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTLEG_TATTER; }
        frame 1 { x: 72.6999969; y: 64.0999985; skew-x: -4.4000001; skew-y: -3.9000001; scale-x: -10000; scale-y: 0.745999992; image: none; }
        frame 2 { x: 72.4000015; y: 63.9000015; skew-x: -9.19999981; skew-y: -7.9000001; scale-y: -10000; }
        frame 3 { x: 72.0999985; y: 66.5; skew-x: -13.6999998; skew-y: -11.8999996; }
        frame 4 { x: 71.8000031; y: 69.1999969; skew-x: -18.5; skew-y: -16.2000008; scale-y: 0.745000005; }
        frame 5 { x: 71.5999985; y: 71.6999969; skew-x: -23.2000008; skew-y: -20.2000008; scale-y: -10000; }
        frame 6 { x: 71.5; y: 74.5; skew-x: -28; skew-y: -24.3999996; }
        frame 7 { x: 71.3000031; y: 77.1999969; skew-x: -32.7000008; skew-y: -28.5; }
        frame 8 { x: -10000; y: 79.8000031; skew-x: -37.2999992; skew-y: -32.5; }
        frame 9 { y: 82.6999969; skew-x: -42; skew-y: -36.7000008; scale-x: 0.749000013; scale-y: 0.745999992; }
        frame 10 { x: 71.5999985; y: 85.3000031; skew-x: -18.8999996; skew-y: -13.8999996; scale-x: 0.748000026; scale-y: 0.745000005; }
        frame 11 { x: 72.8000031; y: 88.5999985; skew-x: 4; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 74.8000031; y: 92.5; skew-x: 27.2000008; skew-y: 31.3999996; scale-x: 0.746999979; }
        frame 13 { x: 74.5; y: 88.3000031; skew-x: 23.2999992; skew-y: 26.7999992; scale-x: 0.745999992; scale-y: 0.744000018; }
        frame 14 { x: 74.3000031; y: 84.3000031; skew-x: 19.2999992; skew-y: 22.2999992; scale-x: -10000; scale-y: 0.745000005; }
        frame 15 { x: 74; y: 80.1999969; skew-x: 15.5; skew-y: 17.7999992; scale-y: -10000; }
        frame 16 { x: 73.6999969; y: 76.0999985; skew-x: 11.5; skew-y: 13.3000002; }
        frame 17 { x: 73.3000031; y: 72.0999985; skew-x: 7.80000019; skew-y: 8.80000019; scale-x: 0.746999979; scale-y: 0.745999992; }
        frame 18 { x: 73.1999969; y: 68.0999985; skew-x: 3.79999995; skew-y: 4.30000019; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 73.0999985; y: 64.3000031; skew-x: 0; skew-y: 0; scale-y: 0.746999979; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 71.6999969; y: 64.1999969; skew-y: -9.69999981; scale-y: 0.768999994; }
        frame 22 { x: 70.3000031; y: 64.3000031; skew-y: -19.5; scale-y: 0.792999983; }
        frame 23 { x: 71.8000031; y: 64.1999969; skew-y: -9.69999981; scale-y: 0.768999994; }
        frame 24 { x: 73.0999985; y: 64.3000031; skew-y: 0; scale-y: 0.746999979; }
        frame 25 { x: 73.8000031; y: -10000; skew-y: 7.80000019; scale-x: 0.777999997; scale-y: 0.760999978; }
        frame 26 { x: 74.8000031; y: 64.5; skew-y: 15.6000004; scale-x: 0.810000002; scale-y: 0.774999976; }
        frame 27 { x: 73.9000015; y: 64.3000031; skew-y: 7.80000019; scale-x: 0.777999997; scale-y: 0.760999978; }
        frame 28 { x: 73.0999985; y: -10000; skew-y: 0; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 29 { x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 63.7999992; }
        frame 31 { y: 63.2999992; }
        frame 32 { y: 63.7999992; }
        frame 33 { y: 64.3000031; }
        frame 34 { y: -10000; }
        frame 38 { x: 73.1999969; y: 64.0999985; skew-x: -4.5; skew-y: -4.5; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 39 { x: 73.3000031; y: 63.9000015; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 73.5; y: 64; skew-x: -14; skew-y: -14; }
        frame 41 { x: 73.3000031; y: 64.0999985; skew-x: -9.19999981; skew-y: -9.19999981; }
        frame 42 { x: 73.1999969; y: 64.3000031; skew-x: -4.5; skew-y: -4.5; }
        frame 43 { x: 73.0999985; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 44 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 73; y: 65; skew-x: 10.8000002; skew-y: 11.1000004; scale-x: 0.779999971; scale-y: 0.745999992; }
        frame 65 { x: 73.0999985; y: 65.8000031; skew-x: 21.5; skew-y: 22.2999992; scale-x: 0.813000023; scale-y: 0.745000005; }
        frame 66 { x: 73.3000031; y: 67.0999985; skew-x: 32.4000015; skew-y: 33.5999985; scale-x: 0.84799999; scale-y: 0.745999992; }
    }
    Track {
        source-name: "Zombie_bungi_leftleg_foot";
        frame-count: 67;
        frame 0 { x: 95.5999985; y: 70.6999969; skew-x: 180; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_FOOT; }
        frame 1 { x: -10000; y: 69.0999985; skew-x: 176.699997; skew-y: -3.20000005; scale-x: 0.700999975; scale-y: 0.700999975; image: none; }
        frame 2 { x: 95.5; y: 67.5; skew-x: 173.5; skew-y: -6.4000001; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 95.3000031; y: 68.8000031; skew-x: 170.199997; skew-y: -9.69999981; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 4 { x: -10000; y: 70; skew-x: 166.899994; skew-y: -13; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 95.0999985; y: 71.1999969; skew-x: 163.5; skew-y: -16.3999996; }
        frame 6 { x: 94.6999969; y: 72.5999985; skew-x: 160.199997; skew-y: -19.7000008; }
        frame 7 { x: 94.5; y: 74; skew-x: 156.899994; skew-y: -23; }
        frame 8 { x: 94.0999985; y: 75.5999985; skew-x: 153.5; skew-y: -26.3999996; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 9 { x: 93.6999969; y: 76.9000015; skew-x: 150.199997; skew-y: -29.7000008; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 10 { x: 95.1999969; y: 83.5999985; skew-x: 162.5; skew-y: -17.3999996; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 11 { x: 96.0999985; y: 91.0999985; skew-x: 174.699997; skew-y: -5.19999981; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 12 { x: 96.1999969; y: 99.1999969; skew-x: 186.899994; skew-y: 6.9000001; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 96.0999985; y: 95.0999985; skew-x: 185.800003; skew-y: 5.80000019; }
        frame 14 { x: -10000; y: 91.0999985; skew-x: 184.800003; skew-y: 4.80000019; }
        frame 15 { x: 96; y: 86.8000031; skew-x: 183.800003; skew-y: 3.79999995; }
        frame 16 { x: 95.8000031; y: 82.8000031; skew-x: 182.800003; skew-y: 2.79999995; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 17 { x: -10000; y: 78.5999985; skew-x: 181.800003; skew-y: 1.79999995; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 95.6999969; y: 74.5999985; skew-x: 180.800003; skew-y: 0.800000012; }
        frame 19 { x: 95.5999985; y: 70.6999969; skew-x: 180; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 95.3000031; y: 69.5; skew-x: 178.399994; skew-y: -1.5; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 22 { x: 94.6999969; y: 68.3000031; skew-x: 176.5; skew-y: -3.4000001; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 95.1999969; y: 69.5; skew-x: 178.399994; skew-y: -1.5; }
        frame 24 { x: 95.5999985; y: 70.6999969; skew-x: 180; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 25 { x: 95.3000031; y: 69.5; skew-x: 178.399994; skew-y: -1.5; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 26 { x: 94.6999969; y: 68.3000031; skew-x: 176.5; skew-y: -3.4000001; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 95.1999969; y: 69.5; skew-x: 178.399994; skew-y: -1.5; }
        frame 28 { x: 95.5999985; y: 70.6999969; skew-x: 180; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 69.3000031; skew-x: 178.399994; }
        frame 31 { y: 68; skew-x: 176.5; scale-x: 0.703000009; }
        frame 32 { y: 69.3000031; skew-x: 178.399994; scale-x: 0.702000022; scale-y: 0.700999975; }
        frame 33 { y: 70.6999969; skew-x: 180; scale-x: -10000; scale-y: 0.702000022; }
        frame 34 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 38 { x: 95.6999969; y: 68.5; skew-x: 175.5; skew-y: -4.4000001; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 39 { x: 95.5999985; y: 66.5; skew-x: 170.699997; skew-y: -9.19999981; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 95.5; y: 64.4000015; skew-x: 166.100006; skew-y: -13.8000002; }
        frame 41 { x: 95.5999985; y: 66.4000015; skew-x: 170.699997; skew-y: -9.19999981; }
        frame 42 { x: -10000; y: 68.5; skew-x: 175.5; skew-y: -4.4000001; }
        frame 43 { y: 70.6999969; skew-x: 180; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 44 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { y: 70.8000031; }
        frame 63 { y: -10000; }
        frame 64 { x: 96.3000031; y: 74.6999969; skew-x: 187.800003; skew-y: 7.80000019; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 65 { x: 96.8000031; y: 78.6999969; skew-x: 195.600006; skew-y: 15.6000004; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 66 { x: -10000; y: 82.9000015; skew-x: 203.600006; skew-y: 23.6000004; scale-x: 0.700999975; scale-y: 0.700999975; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_upper";
        frame-count: 67;
        frame 0 { x: 0.5; y: 8.39999962; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTARM_UPPER; }
        frame 1 { x: 2; y: 6; skew-x: 4.80000019; skew-y: 3.79999995; scale-x: 0.700999975; scale-y: -10000; image: none; }
        frame 2 { x: 3.5; y: 3.5; skew-x: 9.80000019; skew-y: 7.5999999; scale-x: -10000; scale-y: 0.703000009; }
        frame 3 { x: -10000; y: 5.9000001; skew-x: 10.5; skew-y: 7.0999999; scale-y: 0.703999996; }
        frame 4 { y: 8.39999962; skew-x: 11.3000002; skew-y: 6.80000019; scale-y: 0.704999983; }
        frame 5 { y: 10.6999998; skew-x: 12; skew-y: 6.5; scale-x: 0.699999988; scale-y: 0.707000017; }
        frame 6 { y: 13; skew-x: 12.8000002; skew-y: 6.0999999; scale-x: -10000; scale-y: 0.708000004; }
        frame 7 { y: 15.3999996; skew-x: 13.5; skew-y: 5.80000019; scale-y: 0.708999991; }
        frame 8 { y: 17.8999996; skew-x: 14.3000002; skew-y: 5.5; scale-y: 0.709999979; }
        frame 9 { y: 20.2999992; skew-x: 15.1000004; skew-y: 5.19999981; scale-x: 0.700999975; scale-y: 0.712000012; }
        frame 10 { x: 1.5; y: 23.2000008; skew-x: 10.6000004; skew-y: 1.5; scale-x: 0.699999988; scale-y: 0.711000025; }
        frame 11 { x: -0.200000003; y: 26; skew-x: 6.30000019; skew-y: -1.70000005; scale-x: -10000; scale-y: 0.709999979; }
        frame 12 { x: -2; y: 29; skew-x: 2; skew-y: -5.5; scale-y: 0.708999991; }
        frame 13 { x: -1.60000002; y: 26.1000004; skew-x: 1.60000002; skew-y: -4.69999981; scale-y: 0.707000017; }
        frame 14 { x: -1.20000005; y: 23.2000008; skew-x: 1.29999995; skew-y: -3.70000005; scale-x: 0.700999975; scale-y: 0.70599997; }
        frame 15 { x: -0.800000012; y: 20.2000008; skew-x: 1; skew-y: -2.9000001; scale-x: -10000; scale-y: 0.704999983; }
        frame 16 { x: -0.400000006; y: 17.2999992; skew-x: 0.800000012; skew-y: -2.20000005; scale-y: -10000; }
        frame 17 { x: -0.100000001; y: 14.3999996; skew-x: 0.5; skew-y: -1.39999998; scale-y: 0.703000009; }
        frame 18 { x: 0.200000003; y: 11.3999996; skew-x: 0.300000012; skew-y: -0.699999988; scale-y: 0.702000022; }
        frame 19 { x: 0.5; y: 8.39999962; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: -10000; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 21 { y: 8.19999981; }
        frame 22 { y: 8; }
        frame 23 { y: 7.80000019; }
        frame 24 { y: 7.5999999; }
        frame 25 { y: 7.80000019; }
        frame 26 { y: 8; }
        frame 27 { y: 8.19999981; }
        frame 28 { y: 8.39999962; }
        frame 29 { y: -10000; }
        frame 30 { x: 0.300000012; y: 8.80000019; skew-x: 1.29999995; skew-y: 1.5; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 31 { x: 0.200000003; y: 9.10000038; skew-x: 2.79999995; skew-y: 3.29999995; scale-x: 0.728999972; scale-y: 0.676999986; }
        frame 32 { x: 0.300000012; y: 8.80000019; skew-x: 1.29999995; skew-y: 1.5; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 33 { x: 0.5; y: 8.39999962; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 34 { x: 1.29999995; y: 7.5; skew-x: 2; skew-y: 2; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 35 { x: 2.0999999; y: 6.69999981; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 3; y: 5.80000019; skew-x: 6; skew-y: 6; }
        frame 37 { x: 3.9000001; y: 4.9000001; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 38 { x: -3.70000005; y: 14.6000004; skew-x: -14.3999996; skew-y: -14.3999996; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 39 { x: -8.60000038; y: 26.2000008; skew-x: -37.2000008; skew-y: -37.2000008; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_lower";
        frame-count: 67;
        frame 0 { x: -9.10000038; y: 9.5; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTARM_LOWER; }
        frame 1 { x: -6.80000019; y: 5.5999999; skew-x: 9; skew-y: 9; scale-x: 0.700999975; scale-y: 0.700999975; image: none; }
        frame 2 { x: -4.4000001; y: 2; skew-x: 18.3999996; skew-y: 18.3999996; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -10000; y: 4.5; skew-x: 19.1000004; skew-y: 19.1000004; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 4 { x: -4.30000019; y: 6.80000019; skew-x: 20; skew-y: 20; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: -10000; y: 9.30000019; skew-x: 20.7999992; skew-y: 20.7999992; }
        frame 6 { x: -4.19999981; y: 11.8999996; skew-x: 21.7999992; skew-y: 21.7999992; }
        frame 7 { x: -10000; y: 14.1999998; skew-x: 22.6000004; skew-y: 22.6000004; }
        frame 8 { y: 16.7000008; skew-x: 23.2999992; skew-y: 23.2999992; }
        frame 9 { x: -4; y: 18.8999996; skew-x: 24.2999992; skew-y: 24.2999992; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 10 { x: -6.5999999; y: 23.2000008; skew-x: 14.3000002; skew-y: 14.3000002; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 11 { x: -9.19999981; y: 27.8999996; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: -11.3999996; y: 32.5999985; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 13 { x: -11; y: 29.2999992; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 14 { x: -10.6999998; y: 26; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 15 { x: -10.3000002; y: 22.7000008; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 16 { x: -10; y: 19.3999996; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: -9.69999981; y: 16.1000004; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 18 { x: -9.39999962; y: 12.8000002; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 19 { x: -9.10000038; y: 9.5; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 9.30000019; }
        frame 22 { y: 9.10000038; }
        frame 23 { y: 8.89999962; }
        frame 24 { y: 8.69999981; }
        frame 25 { y: 8.89999962; }
        frame 26 { y: 9.10000038; }
        frame 27 { y: 9.30000019; }
        frame 28 { y: 9.5; }
        frame 29 { y: -10000; }
        frame 30 { x: -9.39999962; y: 9.60000038; skew-x: 1.29999995; skew-y: 1.5; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 31 { x: -9.69999981; y: 9.69999981; skew-x: 2.79999995; skew-y: 3.29999995; scale-x: 0.728999972; scale-y: 0.676999986; }
        frame 32 { x: -9.30000019; y: 9.60000038; skew-x: 1.29999995; skew-y: 1.5; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 33 { x: -9.10000038; y: 9.5; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 34 { x: -8.30000019; y: 8.30000019; skew-x: 2; skew-y: 2; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 35 { x: -7.4000001; y: 7.0999999; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -6.5999999; y: 5.80000019; skew-x: 6; skew-y: 6; }
        frame 37 { x: -5.69999981; y: 4.5999999; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 38 { x: -10.3999996; y: 20.5; skew-x: -22.3999996; skew-y: -22.3999996; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 39 { x: -12.1000004; y: 37.5999985; skew-x: -53; skew-y: -53; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_cuff";
        frame-count: 67;
        frame 0 { x: -17.2999992; y: 11.1999998; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTARM_CUFF; }
        frame 1 { x: -15.5; y: 5.80000019; skew-x: 6.5; skew-y: 6.5; scale-x: 0.700999975; scale-y: 0.700999975; image: none; }
        frame 2 { x: -13.6999998; y: 0.600000024; skew-x: 13.1000004; skew-y: 13.1000004; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -14.3000002; y: 3.20000005; skew-x: 11.1000004; skew-y: 11.1000004; }
        frame 4 { x: -14.6999998; y: 5.80000019; skew-x: 9.30000019; skew-y: 9.30000019; }
        frame 5 { x: -15.3000002; y: 8.5; skew-x: 7.30000019; skew-y: 7.30000019; }
        frame 6 { x: -15.8000002; y: 11.1999998; skew-x: 5.5; skew-y: 5.5; }
        frame 7 { x: -16.2000008; y: 13.8999996; skew-x: 3.5999999; skew-y: 3.5999999; }
        frame 8 { x: -16.7000008; y: 16.5; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 9 { x: -17.2999992; y: 19.2000008; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 10 { x: -18.2999992; y: 26.7999992; skew-x: -8; skew-y: -8; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 11 { x: -19.2000008; y: 34.5999985; skew-x: -16.2000008; skew-y: -16.2000008; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: -19.7000008; y: 42.7000008; skew-x: -24.5; skew-y: -24.5; }
        frame 13 { x: -19.5; y: 38.0999985; skew-x: -20.8999996; skew-y: -20.8999996; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 14 { x: -19.2000008; y: 33.5; skew-x: -17.3999996; skew-y: -17.3999996; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 15 { x: -18.8999996; y: 29; skew-x: -13.8999996; skew-y: -13.8999996; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: -18.5; y: 24.3999996; skew-x: -10.3999996; skew-y: -10.3999996; }
        frame 17 { x: -18.1000004; y: 20; skew-x: -6.9000001; skew-y: -6.9000001; }
        frame 18 { x: -17.7000008; y: 15.6000004; skew-x: -3.4000001; skew-y: -3.4000001; }
        frame 19 { x: -17.2999992; y: 11.1999998; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -16.2999992; y: 10.6999998; skew-y: 3.5; scale-y: 0.703999996; }
        frame 22 { x: -15.1000004; y: 10.3999996; skew-y: 7.19999981; scale-y: 0.707000017; }
        frame 23 { x: -16.2999992; y: 10.8000002; skew-y: 3.5; scale-x: 0.700999975; scale-y: 0.703999996; }
        frame 24 { x: -17.2999992; y: 11.1999998; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 25 { x: -18.3999996; y: 10.8999996; skew-x: -2.70000005; skew-y: -4.19999981; scale-x: 0.700999975; scale-y: -10000; }
        frame 26 { x: -19.7000008; y: 10.8000002; skew-x: -5.5; skew-y: -8.39999962; scale-x: -10000; }
        frame 27 { x: -18.5; y: 11; skew-x: -2.70000005; skew-y: -4.19999981; }
        frame 28 { x: -17.2999992; y: 11.1999998; skew-x: 0; skew-y: 0; scale-x: 0.702000022; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 30 { x: -17.8999996; y: 12.3000002; skew-x: 1.29999995; skew-y: 1.5; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 31 { x: -18.2999992; y: 13.3999996; skew-x: 2.79999995; skew-y: 3.29999995; scale-x: 0.728999972; scale-y: 0.676999986; }
        frame 32 { x: -17.7999992; y: 12.8000002; skew-x: 1.29999995; skew-y: 1.5; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 33 { x: -17.2999992; y: 12.1999998; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 34 { x: -16.5; y: 11.1999998; skew-x: 2; skew-y: 2; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 35 { x: -15.8000002; y: 10.3000002; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -14.8999996; y: 9.30000019; skew-x: 6; skew-y: 6; }
        frame 37 { x: -14.1000004; y: 8.30000019; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 38 { x: -15.1999998; y: 25.3999996; skew-x: -22.3999996; skew-y: -22.3999996; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 39 { x: -13.6999998; y: 44.0999985; skew-x: -53; skew-y: -53; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_hand";
        frame-count: 67;
        frame 0 { x: -32.2999992; y: 9.5; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_HAND; }
        frame 1 { x: -28.5; y: 1.5; skew-x: 12.3000002; skew-y: 12.3000002; scale-x: 0.699999988; scale-y: 0.699999988; image: none; }
        frame 2 { x: -24.3999996; y: -5.69999981; skew-x: 24.7000008; skew-y: 24.7000008; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -25.2000008; y: -2.70000005; skew-x: 22.2999992; skew-y: 22.2999992; }
        frame 4 { x: -26; y: 0.100000001; skew-x: 20.2999992; skew-y: 20.2999992; }
        frame 5 { x: -26.7000008; y: 3.0999999; skew-x: 18; skew-y: 18; }
        frame 6 { x: -27.3999996; y: 6.19999981; skew-x: 15.8000002; skew-y: 15.8000002; }
        frame 7 { x: -28.1000004; y: 9.19999981; skew-x: 13.6000004; skew-y: 13.6000004; }
        frame 8 { x: -28.7999992; y: 12.3000002; skew-x: 11.5; skew-y: 11.5; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 9 { x: -29.3999996; y: 15.3999996; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: -32.7000008; y: 25.6000004; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 11 { x: -35.2000008; y: 36.5; skew-x: -18.3999996; skew-y: -18.3999996; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 12 { x: -36.9000015; y: 47.9000015; skew-x: -32.4000015; skew-y: -32.4000015; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 13 { x: -36.4000015; y: 42.2999992; skew-x: -27.7000008; skew-y: -27.7000008; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 14 { x: -36; y: 36.5; skew-x: -23; skew-y: -23; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: -35.4000015; y: 31; skew-x: -18.3999996; skew-y: -18.3999996; }
        frame 16 { x: -34.7999992; y: 25.6000004; skew-x: -13.6999998; skew-y: -13.6999998; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 17 { x: -33.9000015; y: 20.2000008; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -33.0999985; y: 14.6999998; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 19 { x: -32.2999992; y: 9.5; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -32; y: 9; skew-x: 1; skew-y: 1; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 22 { x: -31.7999992; y: 8.5; skew-x: 2.0999999; skew-y: 2.0999999; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -32.0999985; y: 9; skew-x: 1; skew-y: 1; }
        frame 24 { x: -32.2999992; y: 9.5; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 25 { x: -32; y: 9; skew-x: 1; skew-y: 1; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 26 { x: -31.7999992; y: 8.5; skew-x: 2.0999999; skew-y: 2.0999999; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -32.0999985; y: 9; skew-x: 1; skew-y: 1; }
        frame 28 { x: -32.2999992; y: 9.5; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 7.9000001; skew-x: 3.79999995; skew-y: 4.5; scale-x: 0.713999987; scale-y: 0.68900001; }
        frame 31 { y: 6.30000019; skew-x: 7.9000001; skew-y: 9.19999981; scale-x: 0.726999998; scale-y: 0.676999986; }
        frame 32 { y: 8; skew-x: 3.79999995; skew-y: 4.5; scale-x: 0.713999987; scale-y: 0.68900001; }
        frame 33 { y: 9.5; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 34 { x: -30.7000008; y: 6.19999981; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 35 { x: -28.7999992; y: 2.9000001; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -27; y: -0; skew-x: 16.1000004; skew-y: 16.1000004; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 37 { x: -25; y: -3.0999999; skew-x: 21.6000004; skew-y: 21.6000004; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 38 { x: -29.7999992; y: 24.7000008; skew-x: -19.2000008; skew-y: -19.2000008; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 39 { x: -27.1000004; y: 56.5999985; skew-x: -60.5; skew-y: -60.5; scale-x: 0.698000014; scale-y: 0.698000014; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftarm_upper";
        frame-count: 67;
        frame 0 { x: 57; y: 9; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTARM_UPPER; }
        frame 1 { x: 54.9000015; y: 10.3000002; skew-x: -6.19999981; skew-y: -5.4000001; scale-x: 0.700999975; scale-y: -10000; image: none; }
        frame 2 { x: 52.7999992; y: 11.8000002; skew-x: -12.6999998; skew-y: -11.1999998; scale-x: -10000; }
        frame 3 { x: 53; y: 14.3999996; skew-x: -12.8999996; skew-y: -10.6999998; }
        frame 4 { x: 53.0999985; y: 17; skew-x: -13.1999998; skew-y: -10.3999996; scale-y: 0.703000009; }
        frame 5 { x: 53.4000015; y: 19.6000004; skew-x: -13.5; skew-y: -9.89999962; scale-y: -10000; }
        frame 6 { x: 53.5; y: 22.2000008; skew-x: -13.8999996; skew-y: -9.5; scale-y: 0.703999996; }
        frame 7 { x: 53.7999992; y: 24.7000008; skew-x: -14.1999998; skew-y: -9.19999981; scale-y: -10000; }
        frame 8 { x: 54; y: 27.3999996; skew-x: -14.5; skew-y: -8.69999981; scale-y: 0.704999983; }
        frame 9 { x: 54.0999985; y: 30; skew-x: -14.8999996; skew-y: -8.39999962; scale-x: 0.702000022; scale-y: 0.70599997; }
        frame 10 { x: 55.2999992; y: 31.1000004; skew-x: -10.3999996; skew-y: -4.4000001; scale-x: 0.700999975; scale-y: 0.704999983; }
        frame 11 { x: 56.4000015; y: 32.2000008; skew-x: -5.9000001; skew-y: -0.400000006; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 57.5999985; y: 33.4000015; skew-x: -1.60000002; skew-y: 3.29999995; scale-y: 0.703999996; }
        frame 13 { x: 57.5; y: 29.7999992; skew-x: -1.20000005; skew-y: 2.79999995; scale-y: -10000; }
        frame 14 { x: 57.4000015; y: 26.3999996; skew-x: -1; skew-y: 2.29999995; scale-y: 0.703000009; }
        frame 15 { x: -10000; y: 22.8999996; skew-x: -0.699999988; skew-y: 1.79999995; scale-y: -10000; }
        frame 16 { x: 57.2000008; y: 19.3999996; skew-x: -0.5; skew-y: 1.29999995; }
        frame 17 { x: 57.0999985; y: 15.8999996; skew-x: -0.200000003; skew-y: 0.800000012; scale-y: 0.702000022; }
        frame 18 { x: 57; y: 12.5; skew-x: -0; skew-y: 0.300000012; scale-y: -10000; }
        frame 19 { y: 9; skew-x: 0; skew-y: 0; scale-x: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 21 { y: 8.89999962; }
        frame 22 { y: 8.69999981; }
        frame 23 { y: 8.60000038; }
        frame 24 { y: 8.39999962; }
        frame 25 { y: 8.60000038; }
        frame 26 { y: 8.69999981; }
        frame 27 { y: 8.89999962; }
        frame 28 { y: 9; }
        frame 29 { y: -10000; }
        frame 30 { x: 56.5999985; y: 10.3999996; skew-x: -1.70000005; skew-y: -1.89999998; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 31 { x: 56.4000015; y: 11.8999996; skew-x: -3.4000001; skew-y: -4; scale-x: 0.727999985; scale-y: 0.676999986; }
        frame 32 { x: 56.7000008; y: 10.5; skew-x: -1.70000005; skew-y: -1.89999998; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 33 { x: 57; y: 9; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 34 { x: 56.2000008; y: 9.60000038; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 35 { x: 55.5; y: 10.1999998; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 54.7999992; y: 10.6999998; skew-x: -7.19999981; skew-y: -7.19999981; }
        frame 37 { x: 54; y: 11.3999996; skew-x: -9.69999981; skew-y: -9.69999981; }
        frame 38 { x: 58.7999992; y: 10.1000004; skew-x: 12; skew-y: 12; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 39 { x: 64.9000015; y: 10.6999998; skew-x: 34.0999985; skew-y: 34.0999985; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftarm_lower";
        frame-count: 67;
        frame 0 { x: 74; y: 8.89999962; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTARM_LOWER; }
        frame 1 { x: 70.4000015; y: 9.39999962; skew-x: -11.3999996; skew-y: -11.3999996; scale-x: 0.700999975; scale-y: 0.700999975; image: none; }
        frame 2 { x: 67.5999985; y: 10.6000004; skew-x: -23.2000008; skew-y: -23.2000008; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 67.9000015; y: 12.8000002; skew-x: -22; skew-y: -22; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 4 { x: 68.3000031; y: 14.8999996; skew-x: -20.7000008; skew-y: -20.7000008; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 68.6999969; y: 17; skew-x: -19.5; skew-y: -19.5; }
        frame 6 { x: 69; y: 19.2000008; skew-x: -18.3999996; skew-y: -18.3999996; }
        frame 7 { x: 69.3000031; y: 21.5; skew-x: -17.2000008; skew-y: -17.2000008; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 8 { x: 69.8000031; y: 23.6000004; skew-x: -16; skew-y: -16; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 70; y: 25.7999992; skew-x: -14.8999996; skew-y: -14.8999996; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 10 { x: 71.4000015; y: 27.6000004; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 11 { x: 73.3000031; y: 29.7000008; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 75.3000031; y: 32.0999985; skew-x: 13.3000002; skew-y: 13.3000002; }
        frame 13 { x: 75.0999985; y: 28.7999992; skew-x: 11.3000002; skew-y: 11.3000002; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 14 { x: 74.8000031; y: 25.3999996; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 15 { x: 74.6999969; y: 22.1000004; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 74.4000015; y: 18.7000008; skew-x: 5.5; skew-y: 5.5; }
        frame 17 { x: 74.3000031; y: 15.5; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 18 { x: 74.0999985; y: 12.1999998; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 19 { x: 74; y: 8.89999962; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 8.69999981; }
        frame 22 { y: 8.60000038; }
        frame 23 { y: 8.39999962; }
        frame 24 { y: 8.30000019; }
        frame 25 { y: 8.39999962; }
        frame 26 { y: 8.60000038; }
        frame 27 { y: 8.69999981; }
        frame 28 { y: 8.89999962; }
        frame 29 { y: -10000; }
        frame 30 { x: 73.8000031; y: 9.89999962; skew-x: -2.4000001; skew-y: -2.70000005; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 31 { x: 73.5999985; y: 10.8000002; skew-x: -5; skew-y: -5.80000019; scale-x: 0.727999985; scale-y: 0.676999986; }
        frame 32 { x: 73.8000031; y: 9.80000019; skew-x: -2.4000001; skew-y: -2.70000005; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 33 { x: 74; y: 8.89999962; skew-x: 0; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 34 { x: 72.9000015; y: -10000; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 35 { x: 72; y: 8.80000019; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 71; y: -10000; skew-x: -10.1999998; skew-y: -10.1999998; }
        frame 37 { x: 70; y: 9; skew-x: -13.6999998; skew-y: -13.6999998; }
        frame 38 { x: 73.8000031; y: 12.8999996; skew-x: 13.8000002; skew-y: 13.8000002; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 39 { x: 79.6999969; y: 20.2999992; skew-x: 41.5999985; skew-y: 41.5999985; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftarm_hand";
        frame-count: 67;
        frame 0 { x: 112.699997; y: 16.1000004; skew-x: 180; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_HAND; }
        frame 1 { x: 108.099998; y: 7.30000019; skew-x: 163.5; skew-y: -16.3999996; scale-x: 0.699999988; scale-y: 0.699999988; image: none; }
        frame 2 { x: 102.800003; y: -0; skew-x: 146.899994; skew-y: -33; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 103.800003; y: 2.79999995; skew-x: 149.600006; skew-y: -30.2999992; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 4 { x: 104.800003; y: 5.69999981; skew-x: 152.199997; skew-y: -27.7000008; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 5 { x: 105.699997; y: 8.60000038; skew-x: 154.699997; skew-y: -25.2000008; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 106.699997; y: 11.5; skew-x: 157.399994; skew-y: -22.5; }
        frame 7 { x: 107.699997; y: 14.5; skew-x: 159.899994; skew-y: -20; }
        frame 8 { x: 108.599998; y: 17.6000004; skew-x: 162.5; skew-y: -17.3999996; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 9 { x: 109.599998; y: 20.7000008; skew-x: 165; skew-y: -14.8999996; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 10 { x: 111.900002; y: 30.2999992; skew-x: 179.5; skew-y: -0.400000006; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 11 { x: 113.400002; y: 40.5; skew-x: 193.800003; skew-y: 13.8000002; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 12 { x: 114.300003; y: 51.7000008; skew-x: 208.300003; skew-y: 28.2999992; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 13 { x: -10000; y: 46.5; skew-x: 204.100006; skew-y: 24.1000004; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 14 { x: 114.099998; y: 41.2999992; skew-x: 200.100006; skew-y: 20.1000004; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 114; y: 36.0999985; skew-x: 196.100006; skew-y: 16.1000004; }
        frame 16 { x: 113.800003; y: 31.1000004; skew-x: 192; skew-y: 12; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 17 { x: 113.599998; y: 26.1000004; skew-x: 188; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 113.199997; y: 21; skew-x: 184; skew-y: 4; }
        frame 19 { x: 112.699997; y: 16.1000004; skew-x: 180; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 112.199997; y: 15.3999996; skew-x: 178; skew-y: -1.89999998; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 22 { x: 111.699997; y: 14.6999998; skew-x: 176; skew-y: -3.9000001; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 112.199997; y: 15.3999996; skew-x: 178; skew-y: -1.89999998; }
        frame 24 { x: 112.699997; y: 16.1000004; skew-x: 180; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 25 { x: 112.199997; y: 15.3999996; skew-x: 178; skew-y: -1.89999998; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 26 { x: 111.699997; y: 14.6999998; skew-x: 176; skew-y: -3.9000001; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 112.199997; y: 15.3999996; skew-x: 178; skew-y: -1.89999998; }
        frame 28 { x: 112.699997; y: 16.1000004; skew-x: 180; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 113.099998; y: 14.3999996; skew-x: 176; skew-y: -4.69999981; scale-x: 0.713999987; scale-y: 0.68900001; }
        frame 31 { x: 113.300003; y: 12.8999996; skew-x: 171.600006; skew-y: -9.60000038; scale-x: 0.726999998; scale-y: 0.676999986; }
        frame 32 { x: 113; y: 14.5; skew-x: 176; skew-y: -4.69999981; scale-x: 0.713999987; scale-y: 0.68900001; }
        frame 33 { x: 112.699997; y: 16.1000004; skew-x: 180; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 34 { x: 111.400002; y: 12.8000002; skew-x: 174.5; skew-y: -5.4000001; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 35 { x: 110; y: 9.80000019; skew-x: 168.699997; skew-y: -11.1999998; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 108.5; y: 6.80000019; skew-x: 163.199997; skew-y: -16.7000008; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 37 { x: 106.800003; y: 3.9000001; skew-x: 157.399994; skew-y: -22.5; scale-x: 0.700999975; scale-y: 0.700999975; }
        frame 38 { x: 107.800003; y: 27.1000004; skew-x: 192.800003; skew-y: 12.8000002; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 39 { x: 103.699997; y: 53.9000015; skew-x: 228.600006; skew-y: 48.5999985; scale-x: 0.698000014; scale-y: 0.698000014; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_body2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 41 { x: 18.3999996; y: 17.2000008; scale-x: 0.699999988; scale-y: 0.699999988; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_BODY2; }
        frame 42 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 61 { y: 16.2000008; }
        frame 62 { y: 15.1999998; }
        frame 63 { y: 14.1999998; }
        frame 64 { y: 12.1999998; }
        frame 65 { y: 10.1999998; }
        frame 66 { y: 8.19999981; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_upper2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 15.1999998; y: 12; skew-x: 37.4000015; skew-y: 32.7000008; scale-x: 0.56099999; scale-y: 0.621999979; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTARM_UPPER2; }
        frame 41 { x: 15.5; y: 13.6000004; skew-x: 24.5; skew-y: 24.5; scale-x: 0.55400002; scale-y: 0.657000005; cel: -10000; image: none; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 8.80000019; y: 22.5; skew-x: -7.19999981; skew-y: -7.19999981; scale-x: 0.619000018; scale-y: 0.658999979; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 8.60000038; y: 20.7999992; scale-y: 0.697000027; }
        frame 48 { x: 8.69999981; y: 21.6000004; scale-y: 0.676999986; }
        frame 49 { x: 8.80000019; y: 22.5; scale-y: 0.658999979; }
        frame 50 { x: -10000; y: 21.7000008; scale-y: 0.676999986; }
        frame 51 { x: 8.60000038; y: 20.7999992; scale-y: 0.697000027; }
        frame 52 { x: 8.69999981; y: 21.6000004; scale-y: 0.676999986; }
        frame 53 { x: 8.80000019; y: 22.5; scale-y: 0.658999979; }
        frame 54 { x: 15.5; y: 13.6000004; skew-x: 24.5; skew-y: 24.5; scale-x: 0.55400002; scale-y: 0.657000005; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftarm_upper2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 48; y: 22.7999992; skew-x: -28.8999996; skew-y: -41; scale-x: 0.776000023; scale-y: 0.698000014; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTARM_UPPER2; }
        frame 41 { x: 47; y: 24; skew-x: -31.5; skew-y: -35.7000008; scale-x: 0.791000009; scale-y: 0.69599998; cel: -10000; image: none; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 52; y: 21.2999992; skew-x: 4.19999981; skew-y: 0; scale-x: 0.791999996; scale-y: 0.697000027; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 46 { y: 21.3999996; skew-x: 4.0999999; }
        frame 47 { y: 19.7000008; skew-x: 4.19999981; scale-y: 0.73299998; }
        frame 48 { y: 20.5; skew-x: 4; scale-y: 0.714999974; }
        frame 49 { y: 21.3999996; skew-x: 4.0999999; scale-y: 0.697000027; }
        frame 50 { y: 20.6000004; skew-x: 4; scale-y: 0.714999974; }
        frame 51 { y: 19.7000008; skew-x: 4.19999981; scale-y: 0.73299998; }
        frame 52 { y: 20.6000004; skew-x: 4.0999999; scale-y: 0.714999974; }
        frame 53 { y: 21.2999992; skew-x: 4.19999981; scale-y: 0.697000027; }
        frame 54 { x: 47; y: 24; skew-x: -31.5; skew-y: -35.7000008; scale-x: 0.791000009; scale-y: 0.69599998; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_jaw";
        frame-count: 67;
        frame 0 { x: 26.2999992; y: 33.5; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_JAW; }
        frame 1 { x: -10000; y: 33.4000015; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 33.2999992; }
        frame 3 { y: 35.4000015; }
        frame 4 { y: 37.4000015; }
        frame 5 { y: 39.5; }
        frame 6 { y: 41.5999985; }
        frame 7 { y: 43.7000008; }
        frame 8 { y: 45.7999992; }
        frame 9 { y: 47.9000015; }
        frame 10 { y: 51.2000008; }
        frame 11 { y: 54.5; }
        frame 12 { y: 57.9000015; }
        frame 13 { y: 54.4000015; }
        frame 14 { y: 50.9000015; }
        frame 15 { y: 47.4000015; }
        frame 16 { y: 43.9000015; }
        frame 17 { y: 40.4000015; }
        frame 18 { y: 37; }
        frame 19 { y: 33.5; }
        frame 20 { y: 35.5999985; }
        frame 21 { y: 36; }
        frame 22 { y: 36.2999992; }
        frame 23 { y: 36; }
        frame 24 { y: 35.5999985; }
        frame 25 { y: 36; }
        frame 26 { y: 36.2999992; }
        frame 27 { y: 36; }
        frame 28 { y: 35.5999985; }
        frame 29 { y: -10000; }
        frame 30 { y: 36.2999992; scale-y: 0.716000021; }
        frame 31 { y: 36.9000015; scale-y: 0.731000006; }
        frame 32 { y: 36.2999992; scale-y: 0.716000021; }
        frame 33 { y: 35.5999985; scale-y: 0.702000022; }
        frame 34 { y: 35.7999992; scale-y: 0.720000029; }
        frame 35 { y: 36; scale-y: 0.739000022; }
        frame 36 { y: 36.0999985; scale-y: 0.757000029; }
        frame 37 { y: 36.4000015; scale-y: 0.776000023; }
        frame 38 { y: -10000; scale-y: -10000; }
        frame 40 { y: 35.7999992; }
        frame 41 { y: 35.0999985; }
        frame 42 { y: 34.0999985; scale-y: 0.82099998; }
        frame 43 { y: 33.0999985; scale-y: 0.865999997; }
        frame 44 { y: -10000; scale-y: -10000; }
        frame 45 { y: 32.5; }
        frame 46 { y: 31.7999992; }
        frame 47 { y: 31.1000004; }
        frame 48 { y: 32.0999985; }
        frame 49 { y: 33.0999985; }
        frame 50 { y: 32.0999985; }
        frame 51 { y: 31.1000004; }
        frame 52 { y: 32.0999985; }
        frame 53 { y: 33.0999985; }
        frame 54 { y: -10000; }
        frame 55 { y: 34.7999992; scale-y: 0.82099998; }
        frame 56 { y: 36.4000015; scale-y: 0.776000023; }
        frame 57 { y: -10000; scale-y: -10000; }
        frame 58 { y: 35.5; }
        frame 59 { y: 34.7999992; }
        frame 60 { y: 34; }
        frame 61 { y: 34.7999992; }
        frame 62 { y: 35.5; }
        frame 63 { y: 36.4000015; }
        frame 64 { y: 34.5999985; scale-y: 0.838999987; }
        frame 65 { y: 33; scale-y: 0.902999997; }
        frame 66 { y: 31.2000008; scale-y: 0.966000021; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 67;
        frame 0 { x: 22.1000004; y: 1; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_HEAD; }
        frame 1 { x: -10000; y: -0.200000003; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: -1.60000002; }
        frame 3 { y: 0.899999976; }
        frame 4 { y: 3.5; }
        frame 5 { y: 6.19999981; }
        frame 6 { y: 8.80000019; }
        frame 7 { y: 11.5; }
        frame 8 { y: 14.1000004; }
        frame 9 { y: 16.7999992; }
        frame 10 { y: 18.7999992; }
        frame 11 { y: 20.7999992; }
        frame 12 { y: 22.8999996; }
        frame 13 { y: 19.7000008; }
        frame 14 { y: 16.6000004; }
        frame 15 { y: 13.5; }
        frame 16 { y: 10.3999996; }
        frame 17 { y: 7.19999981; }
        frame 18 { y: 4.0999999; }
        frame 19 { y: 1; }
        frame 20 { y: -10000; }
        frame 21 { y: 0.699999988; }
        frame 22 { y: 0.300000012; }
        frame 23 { y: 0.699999988; }
        frame 24 { y: 1; }
        frame 25 { y: 0.699999988; }
        frame 26 { y: 0.300000012; }
        frame 27 { y: 0.699999988; }
        frame 28 { y: 1; }
        frame 29 { y: -10000; }
        frame 30 { x: 21.7000008; y: 2.5; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 31 { x: 21.2999992; y: 4.19999981; scale-x: 0.728999972; scale-y: 0.676999986; }
        frame 32 { x: 21.7000008; y: 2.5999999; scale-x: 0.714999974; scale-y: 0.68900001; }
        frame 33 { x: 22.1000004; y: 1; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 34 { x: -10000; y: 0.699999988; scale-x: -10000; scale-y: -10000; }
        frame 35 { y: 0.300000012; }
        frame 36 { y: 0.100000001; }
        frame 37 { y: -0.100000001; }
        frame 38 { y: -10000; }
        frame 40 { y: 0.300000012; }
        frame 41 { y: 1; }
        frame 42 { y: -1.60000002; }
        frame 43 { y: -4.30000019; }
        frame 44 { y: -10000; }
        frame 45 { y: -3.70000005; }
        frame 46 { y: -3.0999999; }
        frame 47 { y: -2.5; }
        frame 48 { y: -3.4000001; }
        frame 49 { y: -4.30000019; }
        frame 50 { y: -3.4000001; }
        frame 51 { y: -2.5; }
        frame 52 { y: -3.4000001; }
        frame 53 { y: -4.30000019; }
        frame 54 { y: -10000; }
        frame 55 { y: -2.20000005; }
        frame 56 { y: -0.100000001; }
        frame 57 { y: -10000; }
        frame 64 { y: -1.5; }
        frame 65 { y: -2.9000001; }
        frame 66 { y: -4.30000019; }
    }
    Track {
        source-name: "Zombie_bungi_hair";
        frame-count: 67;
        frame 0 { x: 19.3999996; y: -3; scale-x: 0.702000022; scale-y: 0.702000022; image: IMAGE_REANIM_ZOMBIE_BUNGI_HAIR; }
        frame 1 { x: -10000; y: -4.5; scale-x: -10000; scale-y: 0.723999977; image: none; }
        frame 2 { y: -6; scale-y: 0.745999992; }
        frame 3 { y: -3.70000005; scale-y: 0.768000007; }
        frame 4 { y: -1.20000005; scale-y: 0.791000009; }
        frame 5 { y: 0.899999976; scale-y: 0.813000023; }
        frame 6 { y: 3.29999995; scale-y: 0.834999979; }
        frame 7 { y: 5.69999981; scale-y: 0.85799998; }
        frame 8 { y: 8.10000038; scale-y: 0.879999995; }
        frame 9 { y: 10.3999996; scale-y: 0.90200001; }
        frame 10 { y: 13.3999996; scale-y: 0.813000023; }
        frame 11 { y: 16.3999996; scale-y: 0.725000024; }
        frame 12 { y: 19.5; scale-y: 0.635999978; }
        frame 13 { y: 16.2999992; scale-y: 0.644999981; }
        frame 14 { y: 13; scale-y: 0.654999971; }
        frame 15 { y: 9.80000019; scale-y: 0.663999975; }
        frame 16 { y: 6.5; scale-y: 0.672999978; }
        frame 17 { y: 3.29999995; scale-y: 0.683000028; }
        frame 18 { y: 0.100000001; scale-y: 0.691999972; }
        frame 19 { y: -3; scale-y: 0.702000022; }
        frame 20 { y: -10000; scale-y: -10000; }
        frame 21 { x: 20.5; y: -3.4000001; skew-y: 3.79999995; scale-y: 0.728999972; }
        frame 22 { x: 21.8999996; y: -3.9000001; skew-y: 7.9000001; scale-y: 0.755999982; }
        frame 23 { x: 20.6000004; y: -3.5; skew-y: 3.79999995; scale-x: 0.700999975; scale-y: 0.728999972; }
        frame 24 { x: 19.3999996; y: -3; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 25 { x: 18.3999996; y: -3.20000005; skew-y: -4.19999981; scale-x: 0.690999985; scale-y: 0.704999983; }
        frame 26 { x: 17.2999992; y: -3.5999999; skew-y: -8.60000038; scale-x: 0.680000007; scale-y: 0.709999979; }
        frame 27 { x: 18.3999996; y: -3.29999995; skew-y: -4.19999981; scale-x: 0.690999985; scale-y: 0.704999983; }
        frame 28 { x: 19.3999996; y: -3; skew-y: 0; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 29 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 18.7999992; y: 0; scale-x: 0.714999974; scale-y: 0.640999973; }
        frame 31 { x: 18.1000004; y: 3.20000005; scale-x: 0.728999972; scale-y: 0.579999983; }
        frame 32 { x: 18.7000008; y: 0.100000001; scale-x: 0.714999974; scale-y: 0.640999973; }
        frame 33 { x: 19.3999996; y: -3; scale-x: 0.702000022; scale-y: 0.702000022; }
        frame 34 { x: -10000; y: -3.29999995; scale-x: -10000; scale-y: -10000; }
        frame 35 { y: -3.5999999; }
        frame 36 { y: -3.9000001; }
        frame 37 { y: -4.19999981; }
        frame 38 { y: -10000; }
        frame 40 { y: -3.5999999; }
        frame 41 { y: -3; }
        frame 42 { y: -5.80000019; }
        frame 43 { y: -8.60000038; }
        frame 44 { y: -10000; }
        frame 45 { y: -8.19999981; }
        frame 46 { y: -7.80000019; }
        frame 47 { y: -7.4000001; }
        frame 48 { y: -8; }
        frame 49 { y: -8.60000038; }
        frame 50 { y: -8; }
        frame 51 { y: -7.4000001; }
        frame 52 { y: -8; }
        frame 53 { y: -8.60000038; }
        frame 54 { y: -10000; }
        frame 55 { y: -6.4000001; }
        frame 56 { y: -4.19999981; }
        frame 57 { y: -10000; }
        frame 64 { x: 19.2999992; y: -4.30000019; scale-y: 0.652999997; }
        frame 65 { x: 19.2000008; y: -4.4000001; scale-y: 0.603999972; }
        frame 66 { x: -10000; y: -4.5; scale-y: 0.555000007; }
    }
    Track {
        source-name: "Zombie_bungi_leftarm_hand2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 84.1999969; y: 57.4000015; skew-x: 163.199997; skew-y: -16.7000008; scale-x: 0.648999989; scale-y: 0.648999989; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_HAND2; }
        frame 41 { x: 69.6999969; y: 55; skew-x: 194.300003; skew-y: 14.3000002; scale-x: 0.647000015; scale-y: 0.647000015; cel: -10000; image: none; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 66.8000031; y: 68.8000031; skew-x: 181; skew-y: 1; scale-x: 0.648999989; scale-y: 0.648999989; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 66.6999969; y: 68.6999969; skew-x: 180.800003; skew-y: 0.800000012; }
        frame 51 { x: 66.8000031; y: 68.8000031; skew-x: 181; skew-y: 1; }
        frame 52 { x: 66.6999969; y: 68.6999969; skew-x: 180.800003; skew-y: 0.800000012; }
        frame 53 { x: 66.8000031; y: 68.8000031; skew-x: 181; skew-y: 1; }
        frame 54 { x: 69.6999969; y: 55; skew-x: 194.300003; skew-y: 14.3000002; scale-x: 0.647000015; scale-y: 0.647000015; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftarm_lower2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 40; y: 46.7999992; skew-x: -27.6000004; skew-y: -27.6000004; scale-x: 0.699000001; scale-y: 0.699000001; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTARM_LOWER2; }
        frame 41 { x: 38.7999992; y: 23.7000008; skew-x: 6.80000019; skew-y: 13.3000002; scale-x: 0.702000022; scale-y: 0.697000027; cel: -10000; image: none; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 29.6000004; y: 45.2999992; skew-x: -6.4000001; skew-y: 0; scale-x: 0.703000009; scale-y: 0.699000001; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 38.7999992; y: 23.7000008; skew-x: 6.80000019; skew-y: 13.3000002; scale-x: 0.702000022; scale-y: 0.697000027; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_hand2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 1.70000005; y: 54; skew-x: 23.6000004; skew-y: 23.6000004; scale-x: 0.648999989; scale-y: 0.648999989; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_HAND2; }
        frame 41 { x: 14; y: 60.9000015; skew-x: -14.5; skew-y: -14.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 17.7999992; y: 68.5999985; skew-x: 0; skew-y: 0; scale-x: 0.649999976; scale-y: 0.649999976; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 14; y: 60.9000015; skew-x: -14.5; skew-y: -14.5; scale-x: 0.648999989; scale-y: 0.648999989; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_lower2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 5.5999999; y: 34.7000008; skew-x: 28.7999992; skew-y: 28.7999992; scale-x: 0.630999982; scale-y: 0.630999982; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTARM_LOWER2; }
        frame 41 { x: 6.80000019; y: 40.2000008; skew-x: -2.70000005; skew-y: -5.5999999; scale-x: 0.629999995; scale-y: 0.693000019; cel: -10000; image: none; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 16.1000004; y: 46.7999992; skew-x: 11.8000002; skew-y: 8.80000019; scale-x: 0.630999982; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 50 { y: 46.9000015; scale-x: 0.629999995; }
        frame 51 { y: 46.7999992; scale-x: 0.630999982; }
        frame 52 { y: 46.9000015; scale-x: 0.629999995; }
        frame 53 { y: 46.7999992; scale-x: 0.630999982; }
        frame 54 { x: 6.80000019; y: 40.2000008; skew-x: -2.70000005; skew-y: -5.5999999; scale-x: 0.629999995; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
    }
}
