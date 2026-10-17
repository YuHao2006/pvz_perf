export component PoolCleaner {
    fps: 12;
    Track {
        source-name: "anim_land";
        frame-count: 70;
        frame 11 { cel: -1; }
        frame 12 { cel: -10000; }
    }
    Track {
        source-name: "anim_water";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { cel: 0; }
        frame 12 { cel: -10000; }
        frame 23 { cel: -1; }
        frame 24 { cel: -10000; }
    }
    Track {
        source-name: "anim_suck";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 23 { cel: 0; }
        frame 24 { cel: -10000; }
        frame 47 { cel: -1; }
        frame 48 { cel: -10000; }
    }
    Track {
        source-name: "anim_landsuck";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 47 { cel: 0; }
        frame 48 { cel: -10000; }
    }
    Track {
        source-name: "PoolCleaner_backwheel1";
        frame-count: 70;
        frame 0 { x: 37.5; y: 32.9000015; scale-x: 0.720000029; scale-y: 0.720000029; image: IMAGE_REANIM_POOLCLEANER_WHEEL; }
        frame 1 { x: -10000; y: 32.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 32; }
        frame 3 { y: 31.7000008; }
        frame 4 { y: 31.2999992; }
        frame 5 { y: 30.8999996; }
        frame 6 { y: 31.2999992; }
        frame 7 { y: 31.7000008; }
        frame 8 { y: 32; }
        frame 9 { y: 32.5; }
        frame 10 { y: 32.9000015; }
        frame 11 { y: -10000; cel: -1; }
        frame 12 { cel: -10000; }
        frame 47 { cel: 0; }
        frame 48 { y: 32.2000008; cel: -10000; }
        frame 49 { y: 31.5; }
        frame 50 { y: 30.8999996; }
        frame 51 { y: 31.2999992; }
        frame 52 { y: 31.7000008; }
        frame 53 { y: 32; }
        frame 54 { y: 32.5; }
        frame 55 { y: 32.9000015; }
        frame 56 { y: 32.5; }
        frame 57 { y: 32; }
        frame 58 { y: 31.7000008; }
        frame 59 { y: 31.2999992; }
        frame 60 { y: 30.8999996; }
        frame 61 { y: 31.2999992; }
        frame 62 { y: 31.7000008; }
        frame 63 { y: 32; }
        frame 64 { y: 32.5; }
        frame 65 { y: 32.9000015; }
        frame 66 { y: 32.4000015; }
        frame 67 { y: 31.8999996; }
        frame 68 { y: 31.3999996; }
        frame 69 { y: 30.8999996; }
    }
    Track {
        source-name: "PoolCleaner_backwheel2";
        frame-count: 70;
        frame 0 { x: 9.10000038; y: 30.3999996; scale-x: 0.720000029; scale-y: 0.720000029; image: IMAGE_REANIM_POOLCLEANER_WHEEL; }
        frame 1 { x: -10000; y: 30.8999996; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 31.3999996; }
        frame 3 { y: 31.8999996; }
        frame 4 { y: 32.4000015; }
        frame 5 { y: 32.9000015; }
        frame 6 { y: 32.4000015; }
        frame 7 { y: 31.8999996; }
        frame 8 { y: 31.3999996; }
        frame 9 { y: 30.8999996; }
        frame 10 { y: 30.3999996; }
        frame 11 { y: -10000; cel: -1; }
        frame 12 { cel: -10000; }
        frame 47 { cel: 0; }
        frame 48 { y: 31.2999992; cel: -10000; }
        frame 49 { y: 32; }
        frame 50 { y: 32.9000015; }
        frame 51 { y: 32.4000015; }
        frame 52 { y: 31.8999996; }
        frame 53 { y: 31.3999996; }
        frame 54 { y: 30.8999996; }
        frame 55 { y: 30.3999996; }
        frame 56 { y: 30.8999996; }
        frame 57 { y: 31.3999996; }
        frame 58 { y: 31.8999996; }
        frame 59 { y: 32.4000015; }
        frame 60 { y: 32.9000015; }
        frame 61 { y: 32.4000015; }
        frame 62 { y: 31.8999996; }
        frame 63 { y: 31.3999996; }
        frame 64 { y: 30.8999996; }
        frame 65 { y: 30.3999996; }
        frame 66 { y: 31.1000004; }
        frame 67 { y: 31.7000008; }
        frame 68 { y: 32.2999992; }
        frame 69 { y: 32.9000015; }
    }
    Track {
        source-name: "PoolCleaner_body";
        frame-count: 70;
        frame 0 { x: 11.1000004; y: 14.1000004; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_POOLCLEANER_BODY1; }
        frame 1 { x: -10000; y: 14.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 15; }
        frame 4 { y: 15.1000004; }
        frame 5 { y: 14.6999998; }
        frame 6 { y: 14.1999998; }
        frame 7 { y: 14.6999998; }
        frame 8 { y: 15.1000004; }
        frame 9 { y: 14.6000004; }
        frame 10 { y: 14.1000004; }
        frame 11 { y: -10000; cel: -1; }
        frame 12 { cel: -10000; }
        frame 47 { y: 14.1999998; cel: 0; }
        frame 48 { y: 14.6999998; cel: -10000; }
        frame 49 { y: 15.1000004; }
        frame 50 { y: 14.6000004; }
        frame 51 { y: 14.1000004; }
        frame 52 { y: 14.5; }
        frame 53 { y: 15; }
        frame 54 { y: 14.6000004; }
        frame 55 { y: 14.1999998; }
        frame 56 { y: 14.6999998; }
        frame 57 { y: 15.1000004; }
        frame 58 { y: 14.6000004; }
        frame 59 { y: 14.1000004; }
        frame 60 { y: 14.5; }
        frame 61 { y: 15; }
        frame 62 { y: 14.5; }
        frame 63 { y: 14.1000004; }
        frame 64 { y: 14.5; }
        frame 65 { y: 15; }
        frame 66 { y: 14.5; }
        frame 67 { y: 14.1000004; }
        frame 68 { y: 14.5; }
        frame 69 { y: 15; }
    }
    Track {
        source-name: "PoolCleaner_body2";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { x: 12.6999998; y: 56.2000008; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_POOLCLEANER_BODY2; }
        frame 12 { x: -10000; y: 56.4000015; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 13 { y: 56.5999985; }
        frame 14 { y: 56.7999992; }
        frame 15 { y: 57; }
        frame 16 { y: 57.2000008; }
        frame 17 { y: 57; }
        frame 18 { y: 56.9000015; }
        frame 19 { y: 56.7000008; }
        frame 20 { y: 56.5; }
        frame 21 { y: 56.4000015; }
        frame 22 { y: 56.2000008; }
        frame 23 { y: -10000; }
        frame 24 { y: 56.5; }
        frame 25 { y: 56.9000015; }
        frame 26 { y: 57.2000008; }
        frame 27 { y: 57; }
        frame 28 { y: 56.9000015; }
        frame 29 { y: 56.7000008; }
        frame 30 { y: 56.5; }
        frame 31 { y: 56.4000015; }
        frame 32 { y: 56.2000008; }
        frame 33 { y: 56.4000015; }
        frame 34 { y: 56.5999985; }
        frame 35 { y: 56.7999992; }
        frame 36 { y: 57; }
        frame 37 { y: 57.2000008; }
        frame 38 { x: 11.5; y: 56.4000015; scale-x: 0.861000001; scale-y: 0.861000001; }
        frame 39 { x: 10.1999998; y: 55.5999985; scale-x: 0.922999978; scale-y: 0.922999978; }
        frame 40 { x: 8.89999962; y: 54.7999992; scale-x: 0.984000027; scale-y: 0.984000027; }
        frame 41 { x: 10.1999998; y: 55.2999992; scale-x: 0.922999978; scale-y: 0.922999978; }
        frame 42 { x: 11.5; y: 55.7000008; scale-x: 0.861000001; scale-y: 0.861000001; }
        frame 43 { x: 12.6999998; y: 56.2000008; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 44 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { cel: -1; }
        frame 48 { cel: -10000; }
    }
    Track {
        source-name: "PoolCleaner_tubeend";
        frame-count: 70;
        frame 0 { x: 30.7999992; y: 15.1999998; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_POOLCLEANER_TUBEEND; }
        frame 1 { x: -10000; y: 15.3000002; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 31; y: 15.5; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 3 { y: 15.3999996; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 4 { x: 31.1000004; y: -10000; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 5 { x: -10000; skew-x: 2.4000001; skew-y: 2.4000001; }
        frame 6 { skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 7 { x: 30.8999996; y: 15.1999998; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 8 { x: -10000; y: -10000; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 9 { x: 30.7999992; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 10 { x: -10000; skew-x: 0; skew-y: 0; }
        frame 11 { y: 54.9000015; skew-x: -10000; skew-y: -10000; }
        frame 12 { y: 55; }
        frame 13 { y: 55.2000008; }
        frame 14 { y: 55.4000015; }
        frame 15 { y: 55.5; }
        frame 16 { y: 55.5999985; }
        frame 17 { y: 55.5; }
        frame 18 { y: 55.4000015; }
        frame 19 { y: 55.2999992; }
        frame 20 { y: 55.0999985; }
        frame 21 { y: 55; }
        frame 22 { y: 54.9000015; }
        frame 23 { y: -10000; }
        frame 24 { y: 55.0999985; }
        frame 25 { y: 55.4000015; }
        frame 26 { y: 55.5999985; }
        frame 27 { y: 55.5; }
        frame 28 { y: 55.4000015; }
        frame 29 { y: 55.2999992; }
        frame 30 { y: 55.0999985; }
        frame 31 { y: 55; }
        frame 32 { y: 54.9000015; }
        frame 33 { y: 55; }
        frame 34 { y: 55.2000008; }
        frame 35 { y: 55.4000015; }
        frame 36 { y: 55.5; }
        frame 37 { y: 55.5999985; }
        frame 38 { x: 29.2000008; y: 55.2000008; scale-x: 0.976999998; scale-y: 0.810000002; }
        frame 39 { x: 27.5; y: 54.7000008; scale-x: 1.153; scale-y: 0.82099998; }
        frame 40 { x: 28.3999996; y: 54.7999992; scale-x: 1.06500006; scale-y: 0.815999985; }
        frame 41 { x: 29.2000008; y: -10000; scale-x: 0.976999998; scale-y: 0.810000002; }
        frame 42 { x: 30; y: 54.9000015; scale-x: 0.888000011; scale-y: 0.805000007; }
        frame 43 { x: 30.7999992; y: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 44 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { y: 15.1999998; }
        frame 48 { y: -10000; }
    }
    Track {
        source-name: "PoolCleaner_whitewater1";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { x: 10.6000004; y: 64.5; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_POOLCLEANER_WHITEWATER1; }
        frame 12 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 13 { cel: -10000; }
        frame 14 { y: 64; cel: 0; }
        frame 15 { y: -10000; cel: -1; }
        frame 16 { cel: -10000; }
        frame 17 { y: 64.1999969; cel: 0; }
        frame 18 { y: -10000; cel: -1; }
        frame 19 { cel: -10000; }
        frame 20 { x: 9.80000019; y: 64.3000031; cel: 0; }
        frame 21 { x: -10000; y: -10000; cel: -1; }
        frame 22 { cel: -10000; }
        frame 23 { x: 10.6000004; y: 64.5; cel: 0; }
        frame 24 { x: -10000; y: -10000; cel: -1; }
        frame 25 { cel: -10000; }
        frame 26 { cel: 0; }
        frame 27 { cel: -1; }
        frame 28 { cel: -10000; }
        frame 29 { cel: 0; }
        frame 30 { cel: -1; }
        frame 31 { cel: -10000; }
        frame 32 { y: 64; cel: 0; }
        frame 33 { y: -10000; cel: -1; }
        frame 34 { cel: -10000; }
        frame 35 { y: 64.1999969; cel: 0; }
        frame 36 { y: -10000; cel: -1; }
        frame 37 { cel: -10000; }
        frame 38 { x: 8.10000038; y: 64.3000031; scale-x: 0.869000018; cel: 0; }
        frame 39 { x: -10000; y: -10000; scale-x: -10000; cel: -1; }
        frame 40 { cel: -10000; }
        frame 41 { x: 10.6000004; y: 64.5; scale-x: 0.800000012; cel: 0; }
        frame 42 { x: -10000; y: -10000; scale-x: -10000; cel: -1; }
        frame 43 { cel: -10000; }
        frame 44 { cel: 0; }
        frame 45 { cel: -1; }
        frame 46 { cel: -10000; }
    }
    Track {
        source-name: "PoolCleaner_whitewater2";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 12 { x: 7.5; y: 64.0999985; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_POOLCLEANER_WHITEWATER2; }
        frame 13 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 14 { cel: -10000; }
        frame 15 { x: 8; cel: 0; }
        frame 16 { x: -10000; cel: -1; }
        frame 17 { cel: -10000; }
        frame 18 { cel: 0; }
        frame 19 { cel: -1; }
        frame 20 { cel: -10000; }
        frame 21 { cel: 0; }
        frame 22 { cel: -1; }
        frame 23 { cel: -10000; }
        frame 24 { x: 7.5; cel: 0; }
        frame 25 { x: -10000; cel: -1; }
        frame 26 { cel: -10000; }
        frame 27 { cel: 0; }
        frame 28 { cel: -1; }
        frame 29 { cel: -10000; }
        frame 30 { cel: 0; }
        frame 31 { cel: -1; }
        frame 32 { cel: -10000; }
        frame 33 { x: 8; cel: 0; }
        frame 34 { x: -10000; cel: -1; }
        frame 35 { cel: -10000; }
        frame 36 { cel: 0; }
        frame 37 { cel: -1; }
        frame 38 { cel: -10000; }
        frame 39 { x: 7.0999999; y: 64.8000031; skew-x: 0.5; scale-x: 0.84799999; cel: 0; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; cel: -1; }
        frame 41 { cel: -10000; }
        frame 42 { x: 7.5; y: 64.0999985; skew-x: 0; scale-x: 0.800000012; cel: 0; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; cel: -1; }
        frame 44 { cel: -10000; }
        frame 45 { cel: 0; }
        frame 46 { cel: -1; }
        frame 47 { cel: -10000; }
    }
    Track {
        source-name: "PoolCleaner_whitewater3";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 7.9000001; y: 64; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_POOLCLEANER_WHITEWATER3; }
        frame 14 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 15 { cel: -10000; }
        frame 16 { y: 64.5; cel: 0; }
        frame 17 { y: -10000; cel: -1; }
        frame 18 { cel: -10000; }
        frame 19 { y: 64; cel: 0; }
        frame 20 { y: -10000; cel: -1; }
        frame 21 { cel: -10000; }
        frame 22 { cel: 0; }
        frame 23 { cel: -1; }
        frame 24 { cel: -10000; }
        frame 25 { cel: 0; }
        frame 26 { cel: -1; }
        frame 27 { cel: -10000; }
        frame 28 { cel: 0; }
        frame 29 { cel: -1; }
        frame 30 { cel: -10000; }
        frame 31 { cel: 0; }
        frame 32 { cel: -1; }
        frame 33 { cel: -10000; }
        frame 34 { y: 64.5; cel: 0; }
        frame 35 { y: -10000; cel: -1; }
        frame 36 { cel: -10000; }
        frame 37 { y: 64; cel: 0; }
        frame 38 { y: -10000; cel: -1; }
        frame 39 { cel: -10000; }
        frame 40 { x: 5.80000019; scale-x: 0.874000013; cel: 0; }
        frame 41 { x: -10000; scale-x: -10000; cel: -1; }
        frame 42 { cel: -10000; }
        frame 43 { x: 7.9000001; scale-x: 0.800000012; cel: 0; }
        frame 44 { x: -10000; scale-x: -10000; cel: -1; }
        frame 45 { cel: -10000; }
        frame 46 { cel: 0; }
        frame 47 { cel: -1; }
        frame 48 { cel: -10000; }
    }
    Track {
        source-name: "PoolCleaner_tube";
        frame-count: 70;
        frame 0 { x: 35.5; y: -4.19999981; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_POOLCLEANER_TUBE; }
        frame 1 { x: 35.7999992; y: -3.4000001; skew-y: 0.300000012; scale-x: -10000; scale-y: 0.782999992; image: none; }
        frame 2 { x: 36.0999985; y: -2.79999995; skew-x: 0.200000003; skew-y: 0.800000012; scale-y: 0.76700002; }
        frame 3 { x: 36.9000015; y: -2.0999999; skew-x: 1.5; skew-y: 2.5; scale-y: 0.75; }
        frame 4 { x: 37.5; y: -1.29999995; skew-x: 3; skew-y: 4.30000019; scale-y: 0.734000027; }
        frame 5 { x: 38.0999985; y: -0.699999988; skew-x: 4.5; skew-y: 6.19999981; scale-y: 0.717999995; }
        frame 6 { x: 38; y: -1.39999998; skew-x: -10000; skew-y: 5.80000019; scale-x: 0.799000025; scale-y: 0.734000027; }
        frame 7 { x: -10000; y: -2.0999999; skew-x: 4.5999999; skew-y: 5.5999999; scale-x: 0.800000012; scale-y: 0.75; }
        frame 8 { x: 37; y: -2.9000001; skew-x: 3; skew-y: 3.5999999; scale-x: -10000; scale-y: 0.76700002; }
        frame 9 { x: 36.2999992; y: -3.5999999; skew-x: 1.5; skew-y: 1.79999995; scale-y: 0.782999992; }
        frame 10 { x: 35.5; y: -4.19999981; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 11 { x: -10000; y: 35.4000015; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 12 { y: 36.0999985; scale-y: 0.778999984; }
        frame 13 { x: 35.4000015; y: 36.7999992; skew-x: 0.200000003; skew-y: -0.100000001; scale-y: 0.759000003; }
        frame 14 { x: 36.2999992; y: 37.2999992; skew-x: 1.5; skew-y: 1.79999995; scale-y: 0.745000005; }
        frame 15 { x: 37.0999985; y: 37.9000015; skew-x: 3; skew-y: 4; scale-y: 0.731000006; }
        frame 16 { x: 38.0999985; y: 38.4000015; skew-x: 4.5; skew-y: 6.19999981; scale-y: 0.717999995; }
        frame 17 { x: 38.5999985; y: 37.4000015; skew-x: 4.80000019; skew-y: 7.30000019; scale-x: 0.799000025; scale-y: 0.737999976; }
        frame 18 { x: 39.2000008; y: 36.5; skew-x: 5.30000019; skew-y: 8.60000038; scale-x: 0.800000012; scale-y: 0.75999999; }
        frame 19 { x: 38.2999992; y: 36.2000008; skew-x: 4; skew-y: 6.30000019; scale-x: -10000; scale-y: 0.769999981; }
        frame 20 { x: 37.5; y: 36; skew-x: 2.5; skew-y: 4.30000019; scale-y: 0.779999971; }
        frame 21 { x: 36.5; y: 35.7000008; skew-x: 1.29999995; skew-y: 2; scale-y: 0.790000021; }
        frame 22 { x: 35.5; y: 35.4000015; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 23 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 24 { x: 55.4000015; y: 40.7999992; skew-x: 44.9000015; skew-y: 49.2999992; scale-x: 0.799000025; scale-y: 0.800999999; }
        frame 25 { x: 53.7000008; y: 40.5999985; skew-x: 42.0999985; skew-y: 46.5; scale-x: -10000; scale-y: 0.76700002; }
        frame 26 { x: 51.5; y: 39; skew-x: -10000; skew-y: 40.2999992; scale-x: 0.796999991; scale-y: 0.768000007; }
        frame 27 { x: 49; y: 37.5; skew-y: 34.0999985; scale-x: 0.799000025; scale-y: 0.772000015; }
        frame 28 { x: 47.4000015; y: 36.0999985; skew-y: 29.1000004; scale-x: 0.796999991; scale-y: 0.786000013; }
        frame 29 { x: 45.5999985; y: 34.7000008; skew-y: 24.3999996; scale-x: 0.799000025; scale-y: 0.801999986; }
        frame 30 { x: 48.5; y: 33.4000015; skew-y: 27.7999992; scale-x: 0.796999991; scale-y: 0.86500001; }
        frame 31 { x: 51.5; y: 32.0999985; skew-y: 31.3999996; scale-x: 0.799000025; scale-y: 0.930000007; }
        frame 32 { x: 48.7000008; y: 31.6000004; skew-x: 33.7999992; skew-y: 26.1000004; scale-x: 0.845000029; scale-y: 0.940999985; }
        frame 33 { x: 46; y: 31.2999992; skew-x: 25.7000008; skew-y: 21; scale-x: 0.893000007; scale-y: 0.953999996; }
        frame 34 { x: 44.4000015; y: 31; skew-x: 22.7999992; skew-y: 19; scale-x: 0.89200002; scale-y: 0.952000022; }
        frame 35 { x: 42.9000015; y: 30.7999992; skew-x: 20.2000008; skew-y: 17; scale-x: 0.893000007; scale-y: -10000; }
        frame 36 { x: 43; y: 29.2999992; skew-x: 20.1000004; skew-y: -10000; scale-x: 0.89200002; scale-y: 0.99000001; }
        frame 37 { y: 27.7999992; skew-x: 20.2000008; scale-x: 0.893000007; scale-y: 1.02900004; }
        frame 38 { x: 43.2999992; y: 30.1000004; skew-x: 20.1000004; scale-x: 0.833999991; scale-y: 0.975000024; }
        frame 39 { x: 43.5; y: 32.2999992; skew-x: 20.2000008; scale-x: 0.77700001; scale-y: 0.922999978; }
        frame 40 { x: 46.9000015; y: 34.0999985; skew-x: 26.2999992; skew-y: 25.1000004; scale-x: 0.781000018; scale-y: 0.89200002; }
        frame 41 { x: 50; y: 36.0999985; skew-x: 32.5999985; skew-y: 33.0999985; scale-x: 0.787; scale-y: 0.861000001; }
        frame 42 { x: 52.9000015; y: 38.4000015; skew-x: 38.5999985; skew-y: 41.0999985; scale-x: 0.791999996; scale-y: 0.829999983; }
        frame 43 { x: 55.4000015; y: 40.7999992; skew-x: 44.9000015; skew-y: 49.2999992; scale-x: 0.799000025; scale-y: 0.800999999; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 45.5; y: 36.9000015; skew-x: 22.2999992; skew-y: 24.6000004; scale-x: 0.797999978; scale-y: 0.800000012; }
        frame 46 { x: 35.5; y: 35.4000015; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: -10000; }
        frame 47 { x: -10000; y: -4.5999999; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 48 { x: 55; y: 0.100000001; skew-x: 44.9000015; skew-y: 49.2999992; scale-x: 0.799000025; scale-y: 0.800999999; }
        frame 49 { x: 53.4000015; y: -10000; skew-x: 42.0999985; skew-y: 46.5; scale-x: -10000; scale-y: 0.76700002; }
        frame 50 { x: 51.4000015; y: -1.39999998; skew-x: -10000; skew-y: 40.2999992; scale-x: 0.796999991; scale-y: 0.768000007; }
        frame 51 { x: 49.4000015; y: -2.9000001; skew-y: 34.0999985; scale-x: 0.799000025; scale-y: 0.772000015; }
        frame 52 { x: 47.9000015; y: -4.5; skew-y: 29.1000004; scale-x: 0.796999991; scale-y: 0.786000013; }
        frame 53 { x: 46.5; y: -6; skew-y: 24.3999996; scale-x: 0.799000025; scale-y: 0.801999986; }
        frame 54 { x: 48.9000015; y: -7; skew-y: 27.7999992; scale-x: 0.796999991; scale-y: 0.86500001; }
        frame 55 { x: 51.2999992; y: -8.10000038; skew-y: 31.3999996; scale-x: 0.799000025; scale-y: 0.930000007; }
        frame 56 { x: 48.5; y: -9.30000019; skew-x: 33.7999992; skew-y: 26.1000004; scale-x: 0.845000029; scale-y: 0.940999985; }
        frame 57 { x: 45.5999985; y: -10.3000002; skew-x: 25.7000008; skew-y: 21; scale-x: 0.893000007; scale-y: 0.953999996; }
        frame 58 { x: 44.5; y: -10.1999998; skew-x: 22.7999992; skew-y: 19; scale-x: 0.89200002; scale-y: 0.952000022; }
        frame 59 { x: 43.5; y: -10000; skew-x: 20.2000008; skew-y: 17; scale-x: 0.893000007; scale-y: -10000; }
        frame 60 { x: 42.9000015; y: -12.3000002; skew-x: 20.1000004; skew-y: -10000; scale-x: 0.89200002; scale-y: 0.99000001; }
        frame 61 { x: 42.4000015; y: -14.3000002; skew-x: 20.2000008; scale-x: 0.893000007; scale-y: 1.02900004; }
        frame 62 { x: 42.9000015; y: -11.8999996; skew-x: 20.1000004; scale-x: 0.833999991; scale-y: 0.975000024; }
        frame 63 { x: 43.5; y: -9.80000019; skew-x: 20.2000008; scale-x: 0.77700001; scale-y: 0.922999978; }
        frame 64 { x: 47.7999992; y: -6.69999981; skew-x: 28.2999992; skew-y: 27.7999992; scale-x: 0.782999992; scale-y: 0.880999982; }
        frame 65 { x: 51.7999992; y: -3.29999995; skew-x: 36.5999985; skew-y: 38.5999985; scale-x: 0.790000021; scale-y: 0.839999974; }
        frame 66 { x: 55; y: 0.300000012; skew-x: 44.9000015; skew-y: 49.2999992; scale-x: 0.799000025; scale-y: 0.800999999; }
        frame 67 { x: 55.4000015; y: 0.600000024; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 46.0999985; y: -3.5; skew-x: 22.2999992; skew-y: 24.6000004; scale-x: 0.797999978; scale-y: 0.800000012; }
        frame 69 { x: 35.5; y: -4.19999981; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: -10000; }
    }
    Track {
        source-name: "PoolCleaner_bubble";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 27 { x: 61.0999985; y: 39.9000015; skew-x: 84.8000031; skew-y: 84.8000031; scale-x: 0.5; scale-y: 0.56400001; cel: 0; image: IMAGE_REANIM_POOLCLEANER_BUBBLE; }
        frame 28 { x: 59.0999985; y: 34; skew-x: 83.5; skew-y: 83.5; scale-x: 0.972000003; scale-y: 0.638999999; cel: -10000; image: none; }
        frame 29 { x: 56.5999985; y: 28; skew-x: 82; skew-y: 82; scale-x: 1.44500005; scale-y: 0.713; }
        frame 30 { x: 50.5999985; y: 29.6000004; skew-x: 63.7000008; skew-y: 60.5999985; scale-x: 1.33800006; scale-y: 0.829999983; }
        frame 31 { x: 44; y: 32; skew-x: 45.2999992; skew-y: 39.0999985; scale-x: 1.23500001; scale-y: 0.948000014; }
        frame 32 { x: 40.2999992; y: 35; skew-x: 37.0999985; skew-y: 29.7999992; scale-x: 1.09200001; scale-y: 0.920000017; }
        frame 33 { x: 37; y: 38.2000008; skew-x: 28.8999996; skew-y: 20.7000008; scale-x: 0.953999996; scale-y: 0.893999994; }
        frame 34 { x: 32.9000015; y: 40.9000015; skew-x: 25.7999992; skew-y: 17.5; scale-x: 1.15600002; scale-y: 0.765999973; }
        frame 35 { x: 28.6000004; y: 43.5; skew-x: 22.7000008; skew-y: 14.5; scale-x: 1.36099994; scale-y: 0.638999999; }
        frame 36 { x: 31.7000008; y: 45.5999985; skew-x: 22.6000004; skew-y: 14.3000002; scale-x: 1.07099998; scale-y: 0.614000022; }
        frame 37 { x: 34.5999985; y: 47.5; skew-x: 22.7000008; skew-y: 14.5; scale-x: 0.783999979; scale-y: 0.589999974; }
        frame 38 { x: 36.5; y: 50; skew-x: 28.1000004; skew-y: 19.7999992; scale-x: 0.612999976; scale-y: 0.48300001; }
        frame 39 { x: 37.9000015; y: 52.7999992; skew-x: 33.7000008; skew-y: 25.5; scale-x: 0.444000006; scale-y: 0.375999987; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
        frame 51 { x: 61.4000015; y: -0.5; skew-x: 84.8000031; skew-y: 84.8000031; scale-x: 0.5; scale-y: 0.56400001; cel: 0; }
        frame 52 { x: 59.5999985; y: -6.4000001; skew-x: 83.5; skew-y: 83.5; scale-x: 0.972000003; scale-y: 0.638999999; cel: -10000; }
        frame 53 { x: 57.5; y: -12.6999998; skew-x: 82; skew-y: 82; scale-x: 1.44500005; scale-y: 0.713; }
        frame 54 { x: 50.9000015; y: -10.8000002; skew-x: 63.7000008; skew-y: 60.5999985; scale-x: 1.33800006; scale-y: 0.829999983; }
        frame 55 { x: 43.7999992; y: -8.19999981; skew-x: 45.2999992; skew-y: 39.0999985; scale-x: 1.23500001; scale-y: 0.948000014; }
        frame 56 { x: 39.9000015; y: -5.9000001; skew-x: 37.0999985; skew-y: 29.7999992; scale-x: 1.09200001; scale-y: 0.920000017; }
        frame 57 { x: 36.7000008; y: -3.29999995; skew-x: 28.8999996; skew-y: 20.7000008; scale-x: 0.953999996; scale-y: 0.893999994; }
        frame 58 { x: 32.9000015; y: -0.5; skew-x: 25.7999992; skew-y: 17.5; scale-x: 1.15600002; scale-y: 0.765999973; }
        frame 59 { x: 29.2000008; y: 2.5; skew-x: 22.7000008; skew-y: 14.5; scale-x: 1.36099994; scale-y: 0.638999999; }
        frame 60 { x: 31.5; y: 3.9000001; skew-x: 22.6000004; skew-y: 14.3000002; scale-x: 1.07099998; scale-y: 0.614000022; }
        frame 61 { x: 34; y: 5.30000019; skew-x: 22.7000008; skew-y: 14.5; scale-x: 0.783999979; scale-y: 0.589999974; }
        frame 62 { x: 36.0999985; y: 7.80000019; skew-x: 28.1000004; skew-y: 19.7999992; scale-x: 0.612999976; scale-y: 0.48300001; }
        frame 63 { x: 37.9000015; y: 10.5; skew-x: 33.7000008; skew-y: 25.5; scale-x: 0.444000006; scale-y: 0.375999987; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 65 { cel: -10000; }
    }
    Track {
        source-name: "PoolCleaner_funnel";
        frame-count: 70;
        frame 0 { x: 41.4000015; y: -21.2000008; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_POOLCLEANER_FUNNEL; }
        frame 1 { x: 40.7999992; y: -21; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.898999989; scale-y: 0.898999989; image: none; }
        frame 2 { x: 40; y: -20.7000008; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 43.2999992; y: -20.1000004; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 4 { x: 46.5999985; y: -19.2999992; skew-x: 8.5; skew-y: 8.5; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 5 { x: 50.4000015; y: -18.2999992; skew-x: 15.3000002; skew-y: 15.3000002; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 6 { x: 51; y: -18.2000008; skew-x: 16.6000004; skew-y: 16.6000004; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 7 { x: 51.5999985; y: -10000; skew-x: 18.1000004; skew-y: 18.1000004; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 48.0999985; y: -19.5; skew-x: 12; skew-y: 12; }
        frame 9 { x: 44.5999985; y: -20.5; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 10 { x: 41.4000015; y: -21.2000008; skew-x: 0; skew-y: 0; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 11 { x: -10000; y: 18.3999996; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 39.7999992; y: 19.2000008; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 13 { x: 38.0999985; y: 20; skew-x: -7.19999981; skew-y: -7.19999981; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 14 { x: 42; y: 19.7000008; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 15 { x: 45.9000015; y: -10000; skew-x: 7.80000019; skew-y: 7.80000019; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 16 { x: 50.4000015; y: 20.1000004; skew-x: 15.3000002; skew-y: 15.3000002; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 17 { x: 51.7999992; y: 20.2000008; skew-x: 18.2999992; skew-y: 18.2999992; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 18 { x: 53.4000015; y: 20.1000004; skew-x: 21.6000004; skew-y: 21.6000004; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 50.2000008; y: 19.3999996; skew-x: 16.1000004; skew-y: 16.1000004; }
        frame 20 { x: 47.0999985; y: 18.8999996; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 21 { x: 44.0999985; y: 18.6000004; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 41.4000015; y: 18.3999996; skew-x: 0; skew-y: 0; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 23 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 61.7000008; y: 27.2000008; skew-x: 13; skew-y: 13; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 25 { x: 60.5; y: 17.3999996; skew-x: 17.7999992; skew-y: 9.5; scale-x: 0.950999975; scale-y: 1.273; }
        frame 26 { x: 58.5; y: 18.8999996; skew-x: 16.2999992; skew-y: 10.3000002; scale-x: 0.941999972; scale-y: 1.16299999; }
        frame 27 { x: 56.7999992; y: 20.2999992; skew-x: 14.8000002; skew-y: 11.5; scale-x: 0.93599999; scale-y: 1.05400002; }
        frame 28 { x: 56.5; y: 19.2000008; skew-x: -10000; skew-y: -10000; scale-x: 0.935000002; scale-y: 1.05299997; }
        frame 29 { x: 56.2000008; y: 18.1000004; skew-x: 15.1000004; skew-y: 11.8000002; scale-x: -10000; scale-y: 1.05400002; }
        frame 30 { x: 54; y: 18.5; skew-x: 7.80000019; skew-y: 6; scale-x: 0.915000021; scale-y: 0.973999977; }
        frame 31 { x: 52.5999985; y: 19; skew-x: 0.5; skew-y: 0.5; scale-x: 0.896000028; scale-y: 0.896000028; }
        frame 32 { x: 50.7999992; y: 18.3999996; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 48.9000015; y: 17.7999992; skew-x: -5.4000001; skew-y: -5.4000001; }
        frame 34 { x: 45.5999985; y: 17.8999996; skew-x: -10.6999998; skew-y: -10.6999998; scale-x: 0.894999981; scale-y: 0.894999981; }
        frame 35 { x: 42.5; y: 18.1000004; skew-x: -16; skew-y: -16; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 37.7999992; y: 18.7000008; skew-x: -24.7000008; skew-y: -24.7000008; scale-x: 0.893999994; scale-y: 0.893999994; }
        frame 37 { x: 33.5999985; y: 19.7000008; skew-x: -33.7999992; skew-y: -33.7999992; scale-x: 0.894999981; scale-y: 0.894999981; }
        frame 38 { x: 37; y: 19.6000004; skew-x: -26.7000008; skew-y: -26.7000008; scale-x: 0.893000007; scale-y: 0.893000007; }
        frame 39 { x: 40.5999985; y: 19.5; skew-x: -19.5; skew-y: -19.5; scale-x: 0.893999994; scale-y: 0.893999994; }
        frame 40 { x: 45.4000015; y: 20.8999996; skew-x: -11.1999998; skew-y: -11.1999998; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 50.4000015; y: 22.7000008; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.894999981; scale-y: 0.894999981; }
        frame 42 { x: 55.7999992; y: 24.7000008; skew-x: 4.80000019; skew-y: 4.80000019; scale-x: 0.896000028; scale-y: 0.896000028; }
        frame 43 { x: 61.7000008; y: 27.2000008; skew-x: 13; skew-y: 13; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 51.5; y: 22.7000008; skew-x: 6.5; skew-y: 6.5; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 46 { x: 41.4000015; y: 18.3999996; skew-x: 0; skew-y: 0; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 47 { x: -10000; y: -21.6000004; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 61.4000015; y: -13.3999996; skew-x: 13; skew-y: 13; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 49 { x: 60.0999985; y: -23; skew-x: 17.7999992; skew-y: 9.5; scale-x: 0.950999975; scale-y: 1.273; }
        frame 50 { x: 58.5; y: -21.5; skew-x: 16.2999992; skew-y: 10.3000002; scale-x: 0.941999972; scale-y: 1.16299999; }
        frame 51 { x: 57; y: -20.1000004; skew-x: 14.8000002; skew-y: 11.5; scale-x: 0.93599999; scale-y: 1.05400002; }
        frame 52 { y: -21.2999992; skew-x: -10000; skew-y: -10000; scale-x: 0.935000002; scale-y: 1.05299997; }
        frame 53 { y: -22.6000004; skew-x: 15.1000004; skew-y: 11.8000002; scale-x: -10000; scale-y: 1.05400002; }
        frame 54 { x: 54.5; y: -22; skew-x: 7.80000019; skew-y: 6; scale-x: 0.915000021; scale-y: 0.973999977; }
        frame 55 { x: 52.4000015; y: -21.2000008; skew-x: 0.5; skew-y: 0.5; scale-x: 0.896000028; scale-y: 0.896000028; }
        frame 56 { x: 50.4000015; y: -22.3999996; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 48.5; y: -23.7000008; skew-x: -5.4000001; skew-y: -5.4000001; }
        frame 58 { x: 45.5999985; y: -23.2999992; skew-x: -10.6999998; skew-y: -10.6999998; scale-x: 0.894999981; scale-y: 0.894999981; }
        frame 59 { x: 43; y: -22.7999992; skew-x: -16; skew-y: -16; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 37.7999992; y: -10000; skew-x: -24.7000008; skew-y: -24.7000008; scale-x: 0.893999994; scale-y: 0.893999994; }
        frame 61 { x: 33; y: -22.2999992; skew-x: -33.7999992; skew-y: -33.7999992; scale-x: 0.894999981; scale-y: 0.894999981; }
        frame 62 { x: 36.7999992; y: -22.5; skew-x: -26.7000008; skew-y: -26.7000008; scale-x: 0.893000007; scale-y: 0.893000007; }
        frame 63 { x: 40.5; y: -22.6000004; skew-x: -19.5; skew-y: -19.5; scale-x: 0.893999994; scale-y: 0.893999994; }
        frame 64 { x: 46.7999992; y: -20; skew-x: -8.5; skew-y: -8.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 53.5999985; y: -16.7999992; skew-x: 2; skew-y: 2; scale-x: 0.896000028; scale-y: 0.896000028; }
        frame 66 { x: 61.2999992; y: -13.1000004; skew-x: 13; skew-y: 13; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 67 { x: 61.5999985; y: -12.8000002; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 52; y: -17.7000008; skew-x: 6.5; skew-y: 6.5; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 69 { x: 41.4000015; y: -21.2000008; skew-x: 0; skew-y: 0; scale-x: 0.899999976; scale-y: 0.899999976; }
    }
    Track {
        source-name: "PoolCleaner_funnel_overlay";
        frame-count: 70;
        frame 0 { x: 41.5999985; y: -21.2000008; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_POOLCLEANER_FUNNEL_OVERLAY; }
        frame 1 { x: 41; y: -21; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.898999989; scale-y: 0.898999989; image: none; }
        frame 2 { x: 40.4000015; y: -20.7999992; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 43.5999985; y: -20.2000008; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 4 { x: 47.0999985; y: -19.3999996; skew-x: 8.5; skew-y: 8.5; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 5 { x: 50.5999985; y: -18.2999992; skew-x: 15.3000002; skew-y: 15.3000002; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 6 { x: 51.2999992; y: -18.2000008; skew-x: 16.6000004; skew-y: 16.6000004; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 7 { x: 51.9000015; y: -18.3999996; skew-x: 18.1000004; skew-y: 18.1000004; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 48.4000015; y: -19.6000004; skew-x: 12; skew-y: 12; }
        frame 9 { x: 44.7999992; y: -20.7000008; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 10 { x: 41.5999985; y: -21.2000008; skew-x: 0; skew-y: 0; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 11 { x: -10000; y: 18.3999996; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 40; y: 19; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 13 { x: 38.5; y: 19.7999992; skew-x: -7.19999981; skew-y: -7.19999981; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 14 { x: 42.2999992; y: 19.6000004; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 15 { x: 46.4000015; y: 19.7000008; skew-x: 7.80000019; skew-y: 7.80000019; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 16 { x: 50.5999985; y: 20; skew-x: 15.3000002; skew-y: 15.3000002; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 17 { x: 52; y: 20.1000004; skew-x: 18.2999992; skew-y: 18.2999992; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 18 { x: 53.5; y: 20; skew-x: 21.6000004; skew-y: 21.6000004; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 50.4000015; y: 19.2999992; skew-x: 16.1000004; skew-y: 16.1000004; }
        frame 20 { x: 47.4000015; y: 18.7999992; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 21 { x: 44.4000015; y: 18.5; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 41.5999985; y: 18.3999996; skew-x: 0; skew-y: 0; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 23 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 62; y: 27.2000008; skew-x: 13; skew-y: 13; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 25 { x: 60.9000015; y: 17.3999996; skew-x: 17.7999992; skew-y: 9.5; scale-x: 0.950999975; scale-y: 1.273; }
        frame 26 { x: 58.9000015; y: 18.7999992; skew-x: 16.2999992; skew-y: 10.3000002; scale-x: 0.941999972; scale-y: 1.16299999; }
        frame 27 { x: 57.0999985; y: 20.2999992; skew-x: 14.8000002; skew-y: 11.5; scale-x: 0.93599999; scale-y: 1.05400002; }
        frame 28 { x: 56.7999992; y: 19.2000008; skew-x: -10000; skew-y: -10000; scale-x: 0.935000002; scale-y: 1.05299997; }
        frame 29 { x: 56.5; y: 18.1000004; skew-x: 15.1000004; skew-y: 11.8000002; scale-x: -10000; scale-y: 1.05400002; }
        frame 30 { x: 54.5; y: 18.5; skew-x: 7.80000019; skew-y: 6; scale-x: 0.915000021; scale-y: 0.973999977; }
        frame 31 { x: 52.9000015; y: 18.8999996; skew-x: 0.5; skew-y: 0.5; scale-x: 0.896000028; scale-y: 0.896000028; }
        frame 32 { x: 51; y: 18.2000008; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 49.0999985; y: 17.7000008; skew-x: -5.4000001; skew-y: -5.4000001; }
        frame 34 { x: 45.9000015; y: 17.7999992; skew-x: -10.6999998; skew-y: -10.6999998; scale-x: 0.894999981; scale-y: 0.894999981; }
        frame 35 { x: 42.7999992; y: 17.8999996; skew-x: -16; skew-y: -16; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 38.0999985; y: 18.5; skew-x: -24.7000008; skew-y: -24.7000008; scale-x: 0.893999994; scale-y: 0.893999994; }
        frame 37 { x: 33.9000015; y: 19.3999996; skew-x: -33.7999992; skew-y: -33.7999992; scale-x: 0.894999981; scale-y: 0.894999981; }
        frame 38 { x: 37.2999992; y: 19.2999992; skew-x: -26.7000008; skew-y: -26.7000008; scale-x: 0.893000007; scale-y: 0.893000007; }
        frame 39 { x: 40.9000015; y: -10000; skew-x: -19.5; skew-y: -19.5; scale-x: 0.893999994; scale-y: 0.893999994; }
        frame 40 { x: 45.5999985; y: 20.7000008; skew-x: -11.1999998; skew-y: -11.1999998; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 50.7999992; y: 22.5; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.894999981; scale-y: 0.894999981; }
        frame 42 { x: 56.2999992; y: 24.6000004; skew-x: 4.80000019; skew-y: 4.80000019; scale-x: 0.896000028; scale-y: 0.896000028; }
        frame 43 { x: 62; y: 27.2000008; skew-x: 13; skew-y: 13; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 51.7999992; y: 22.7000008; skew-x: 6.5; skew-y: 6.5; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 46 { x: 41.5999985; y: 18.3999996; skew-x: 0; skew-y: 0; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 47 { x: -10000; y: -21.6000004; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 61.5999985; y: -13.3999996; skew-x: 13; skew-y: 13; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 49 { x: 60.5; y: -23; skew-x: 17.7999992; skew-y: 9.5; scale-x: 0.950999975; scale-y: 1.273; }
        frame 50 { x: 58.9000015; y: -21.5; skew-x: 16.2999992; skew-y: 10.3000002; scale-x: 0.941999972; scale-y: 1.16299999; }
        frame 51 { x: 57.4000015; y: -20.1000004; skew-x: 14.8000002; skew-y: 11.5; scale-x: 0.93599999; scale-y: 1.05400002; }
        frame 52 { x: -10000; y: -21.2999992; skew-x: -10000; skew-y: -10000; scale-x: 0.935000002; scale-y: 1.05299997; }
        frame 53 { y: -22.6000004; skew-x: 15.1000004; skew-y: 11.8000002; scale-x: -10000; scale-y: 1.05400002; }
        frame 54 { x: 54.7999992; y: -22; skew-x: 7.80000019; skew-y: 6; scale-x: 0.915000021; scale-y: 0.973999977; }
        frame 55 { x: 52.7000008; y: -21.2999992; skew-x: 0.5; skew-y: 0.5; scale-x: 0.896000028; scale-y: 0.896000028; }
        frame 56 { x: 50.7999992; y: -22.6000004; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 48.7999992; y: -23.8999996; skew-x: -5.4000001; skew-y: -5.4000001; }
        frame 58 { x: 46; y: -23.5; skew-x: -10.6999998; skew-y: -10.6999998; scale-x: 0.894999981; scale-y: 0.894999981; }
        frame 59 { x: 43.2999992; y: -23; skew-x: -16; skew-y: -16; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 38; y: -10000; skew-x: -24.7000008; skew-y: -24.7000008; scale-x: 0.893999994; scale-y: 0.893999994; }
        frame 61 { x: 33.2000008; y: -22.6000004; skew-x: -33.7999992; skew-y: -33.7999992; scale-x: 0.894999981; scale-y: 0.894999981; }
        frame 62 { x: 36.9000015; y: -22.7999992; skew-x: -26.7000008; skew-y: -26.7000008; scale-x: 0.893000007; scale-y: 0.893000007; }
        frame 63 { x: 40.7999992; y: -10000; skew-x: -19.5; skew-y: -19.5; scale-x: 0.893999994; scale-y: 0.893999994; }
        frame 64 { x: 47.2000008; y: -20.2000008; skew-x: -8.5; skew-y: -8.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 54.0999985; y: -17; skew-x: 2; skew-y: 2; scale-x: 0.896000028; scale-y: 0.896000028; }
        frame 66 { x: 61.5999985; y: -13.1000004; skew-x: 13; skew-y: 13; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 67 { x: 62; y: -12.8000002; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 52.2999992; y: -17.7000008; skew-x: 6.5; skew-y: 6.5; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 69 { x: 41.5999985; y: -21.2000008; skew-x: 0; skew-y: 0; scale-x: 0.899999976; scale-y: 0.899999976; }
    }
    Track {
        source-name: "PoolCleaner_frontwheel1";
        frame-count: 70;
        frame 0 { x: 4.80000019; y: 51.7999992; scale-x: 0.720000029; scale-y: 0.720000029; image: IMAGE_REANIM_POOLCLEANER_WHEEL; }
        frame 1 { x: 4.9000001; y: 51.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 5; y: 51.0999985; }
        frame 3 { y: 50.5999985; }
        frame 4 { x: 4.80000019; y: 50.0999985; }
        frame 5 { x: -10000; y: 49.5; }
        frame 6 { y: 50; }
        frame 7 { y: 50.5; }
        frame 8 { y: 50.9000015; }
        frame 9 { y: 51.4000015; }
        frame 10 { y: 51.7999992; }
        frame 11 { y: -10000; cel: -1; }
        frame 12 { cel: -10000; }
        frame 47 { cel: 0; }
        frame 48 { y: 51; cel: -10000; }
        frame 49 { y: 50.2999992; }
        frame 50 { y: 49.5; }
        frame 51 { y: 50; }
        frame 52 { y: 50.5; }
        frame 53 { y: 50.9000015; }
        frame 54 { y: 51.4000015; }
        frame 55 { y: 51.7999992; }
        frame 56 { y: 51.4000015; }
        frame 57 { y: 50.9000015; }
        frame 58 { y: 50.5; }
        frame 59 { y: 50; }
        frame 60 { y: 49.5; }
        frame 61 { y: 50; }
        frame 62 { y: 50.5; }
        frame 63 { y: 50.9000015; }
        frame 64 { y: 51.4000015; }
        frame 65 { y: 51.7999992; }
        frame 66 { y: 51.2999992; }
        frame 67 { y: 50.7000008; }
        frame 68 { y: 50.0999985; }
        frame 69 { y: 49.5; }
    }
    Track {
        source-name: "PoolCleaner_frontwheel1";
        frame-count: 70;
        frame 0 { x: 33; y: 50; scale-x: 0.720000029; scale-y: 0.720000029; image: IMAGE_REANIM_POOLCLEANER_WHEEL; }
        frame 1 { x: -10000; y: 50.4000015; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 50.7999992; }
        frame 3 { y: 51.0999985; }
        frame 4 { y: 51.5; }
        frame 5 { y: 52; }
        frame 6 { y: 51.5; }
        frame 7 { y: 51.0999985; }
        frame 8 { y: 50.7999992; }
        frame 9 { y: 50.4000015; }
        frame 10 { y: 50; }
        frame 11 { y: -10000; cel: -1; }
        frame 12 { cel: -10000; }
        frame 47 { cel: 0; }
        frame 48 { y: 50.5999985; cel: -10000; }
        frame 49 { y: 51.2999992; }
        frame 50 { y: 52; }
        frame 51 { y: 51.5; }
        frame 52 { y: 51.0999985; }
        frame 53 { y: 50.7999992; }
        frame 54 { y: 50.4000015; }
        frame 55 { y: 50; }
        frame 56 { y: 50.4000015; }
        frame 57 { y: 50.7999992; }
        frame 58 { y: 51.0999985; }
        frame 59 { y: 51.5; }
        frame 60 { y: 52; }
        frame 61 { y: 51.5; }
        frame 62 { y: 51.0999985; }
        frame 63 { y: 50.7999992; }
        frame 64 { y: 50.4000015; }
        frame 65 { y: 50; }
        frame 66 { y: 50.5; }
        frame 67 { y: 51; }
        frame 68 { y: 51.5; }
        frame 69 { y: 52; }
    }
}
