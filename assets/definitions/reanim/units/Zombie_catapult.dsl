export component Zombie_catapult {
    fps: 12;
    Track {
        source-name: "anim_walk";
        frame-count: 85;
        frame 25 { cel: -1; }
        frame 26 { cel: -10000; }
    }
    Track {
        source-name: "anim_shoot";
        frame-count: 85;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 25 { cel: 0; }
        frame 26 { cel: -10000; }
        frame 57 { cel: -1; }
        frame 58 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 85;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 57 { cel: 0; }
        frame 58 { cel: -10000; }
        frame 70 { cel: -1; }
        frame 71 { cel: -10000; }
    }
    Track {
        source-name: "anim_bounce";
        frame-count: 85;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 70 { cel: 0; }
        frame 71 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_catapult_crank";
        frame-count: 85;
        frame 0 { x: 16.1000004; y: 52.7999992; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_CRANK; }
        frame 1 { x: -10000; y: 52.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 52.2999992; }
        frame 3 { y: 52; }
        frame 4 { y: 51.7999992; }
        frame 5 { y: 51.5; }
        frame 6 { y: 51.2000008; }
        frame 7 { y: 51.5; }
        frame 8 { y: 51.5999985; }
        frame 9 { y: 51.9000015; }
        frame 10 { y: 52.0999985; }
        frame 11 { y: 52.4000015; }
        frame 12 { y: 52.5999985; }
        frame 13 { y: 52.5; }
        frame 14 { y: 52.4000015; }
        frame 15 { y: 52.2000008; }
        frame 16 { y: 52; }
        frame 18 { y: 51.7999992; }
        frame 19 { y: 52; }
        frame 20 { y: 52.0999985; }
        frame 21 { y: 52.2999992; }
        frame 22 { y: 52.5; }
        frame 23 { y: 52.5999985; }
        frame 24 { y: 52.7999992; }
        frame 25 { y: -10000; }
        frame 27 { x: 21.8999996; y: 61; skew-x: 3.0999999; skew-y: 4.5; scale-x: 0.768999994; scale-y: 0.781000018; }
        frame 28 { x: 28.2000008; y: 65.1999969; skew-x: 6; skew-y: 9; scale-x: 0.605000019; scale-y: 0.614000022; }
        frame 29 { x: 34.0999985; y: 69.6999969; skew-x: 9.10000038; skew-y: 13.6999998; scale-x: 0.442000002; scale-y: 0.448000014; }
        frame 30 { x: 35.5999985; y: 69.3000031; skew-x: -4.9000001; skew-y: -0.400000006; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 37.2999992; y: 69.1999969; skew-x: -19.2000008; skew-y: -14.6999998; }
        frame 32 { x: 36.9000015; y: 60.9000015; skew-x: -11.1999998; skew-y: -6.69999981; scale-x: 0.638999999; scale-y: 0.700999975; }
        frame 33 { x: 37.0999985; y: 51.7999992; skew-x: -3.0999999; skew-y: 1.29999995; scale-x: 0.836000025; scale-y: 0.953999996; }
        frame 34 { x: 34.0999985; y: 50; skew-x: -9.39999962; skew-y: -4.9000001; scale-x: 0.834999979; scale-y: 0.953000009; }
        frame 35 { x: 31.2000008; y: 48.4000015; skew-x: -15.6999998; skew-y: -11.1999998; scale-x: 0.833999991; scale-y: 0.952000022; }
        frame 36 { x: 28.5; y: 46.5; skew-x: -13.6999998; skew-y: -9.19999981; scale-x: 0.833000004; scale-y: 0.950999975; }
        frame 37 { x: 25.7999992; y: 44.5; skew-x: -11.8000002; skew-y: -7.30000019; scale-x: 0.832000017; scale-y: 0.949999988; }
        frame 38 { x: 21.8999996; y: 46.5; skew-x: -14.3999996; skew-y: -9.89999962; scale-x: 0.83099997; scale-y: 0.948000014; }
        frame 39 { x: 17.7999992; y: 48.5; skew-x: -17; skew-y: -12.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 16.7999992; y: 50.5; skew-x: -8.39999962; skew-y: -6.19999981; scale-x: 0.86500001; scale-y: 0.924000025; }
        frame 41 { x: 16.1000004; y: 52.7999992; skew-x: 0; skew-y: 0; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 14.1000004; y: 54.7000008; skew-x: -5; skew-y: -5; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 44 { x: 12.3000002; y: 56.7000008; skew-x: -10.1999998; skew-y: -10.1999998; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 10.5; y: 58.9000015; skew-x: -15.3999996; skew-y: -15.3999996; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 46 { x: 8.80000019; y: 60.9000015; skew-x: -20.7000008; skew-y: -20.7000008; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 47 { x: 11; y: 58.0999985; skew-x: -13.6999998; skew-y: -13.6999998; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 13.5; y: 55.4000015; skew-x: -6.69999981; skew-y: -6.69999981; }
        frame 49 { x: 16.1000004; y: 52.7999992; skew-x: 0; skew-y: 0; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 25; y: 37.2999992; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 34.2999992; y: 22; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 28.6000004; y: 27.1000004; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 23; y: 32.0999985; skew-x: 4; skew-y: 4; }
        frame 75 { x: 17.3999996; y: 37.4000015; skew-x: 0; skew-y: 0; }
        frame 76 { x: 12.1000004; y: 42.5; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 12.3000002; y: 48.4000015; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: -10000; y: 54.2000008; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: 13; y: 55.2999992; skew-x: -3; skew-y: -3.20000005; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 80 { x: 13.3999996; y: 56.5999985; skew-x: -2.29999995; skew-y: -2.5; scale-x: 0.916000009; scale-y: 0.879999995; }
        frame 81 { x: 14.1000004; y: 54; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 82 { x: 14.6999998; y: 51.2999992; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: -10000; y: 53; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 54.7999992; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_driver_innerarm_hand";
        frame-count: 85;
        frame 0 { x: 16.3999996; y: 47; skew-x: 13.8999996; skew-y: 13.8999996; scale-x: 0.74000001; scale-y: 0.74000001; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_INNERARM_HAND; }
        frame 1 { x: 16.2999992; y: 46.9000015; skew-x: 13.3000002; skew-y: 13.3000002; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -10000; y: -10000; skew-x: 12.8000002; skew-y: 12.8000002; }
        frame 3 { skew-x: 12.3000002; skew-y: 12.3000002; }
        frame 4 { x: 16.1000004; y: 46.7999992; skew-x: 11.8000002; skew-y: 11.8000002; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 5 { x: -10000; y: -10000; skew-x: 11.3000002; skew-y: 11.3000002; scale-x: -10000; scale-y: -10000; }
        frame 6 { y: 46.7000008; skew-x: 10.8999996; skew-y: 10.8999996; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 7 { x: 16.2000008; y: 46.7999992; skew-x: 11.3000002; skew-y: 11.3000002; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 8 { x: -10000; y: 46.9000015; skew-x: 11.8000002; skew-y: 11.8000002; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 16.2999992; y: -10000; skew-x: 12.3000002; skew-y: 12.3000002; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 10 { x: 16.3999996; skew-x: 12.8000002; skew-y: 12.8000002; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: -10000; y: 47; skew-x: 13.3000002; skew-y: 13.3000002; }
        frame 12 { skew-x: 13.8999996; skew-y: 13.8999996; }
        frame 13 { x: 16.2999992; y: 46.9000015; skew-x: 13.3000002; skew-y: 13.3000002; }
        frame 14 { x: -10000; y: -10000; skew-x: 12.8000002; skew-y: 12.8000002; }
        frame 15 { skew-x: 12.3000002; skew-y: 12.3000002; }
        frame 16 { x: 16.1000004; y: 46.7999992; skew-x: 11.8000002; skew-y: 11.8000002; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 17 { x: -10000; y: -10000; skew-x: 11.3000002; skew-y: 11.3000002; scale-x: -10000; scale-y: -10000; }
        frame 18 { y: 46.7000008; skew-x: 10.8999996; skew-y: 10.8999996; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 19 { x: 16.2000008; y: 46.7999992; skew-x: 11.3000002; skew-y: 11.3000002; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 20 { x: -10000; y: 46.9000015; skew-x: 11.8000002; skew-y: 11.8000002; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 16.2999992; y: -10000; skew-x: 12.3000002; skew-y: 12.3000002; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 22 { x: 16.3999996; skew-x: 12.8000002; skew-y: 12.8000002; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -10000; y: 47; skew-x: 13.3000002; skew-y: 13.3000002; }
        frame 24 { skew-x: 13.8999996; skew-y: 13.8999996; }
        frame 25 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 27 { x: 20.6000004; y: 53.5999985; skew-x: 13.8000002; skew-y: 13.8000002; }
        frame 28 { x: 25.7999992; y: 54.5999985; skew-x: 16.7999992; skew-y: 16.7999992; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 29 { x: 31.1000004; y: 55.7999992; skew-x: 19.8999996; skew-y: 19.8999996; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 36.0999985; y: 55.2999992; skew-x: 25.1000004; skew-y: 25.1000004; scale-x: 0.737999976; scale-y: 0.737999976; }
        frame 31 { x: 41.4000015; y: 55; skew-x: 30.3999996; skew-y: 30.3999996; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 32 { x: 42.5; y: 49.0999985; skew-x: 33.2999992; skew-y: 33.2999992; scale-x: 0.737999976; scale-y: 0.737999976; }
        frame 33 { x: 43.5; y: 43.4000015; skew-x: 36.2000008; skew-y: 36.2000008; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 34 { x: 42.5; y: 41.5999985; skew-x: 36.9000015; skew-y: 40.5999985; scale-x: 0.74000001; scale-y: 0.736999989; }
        frame 35 { x: 41.2999992; y: 39.7000008; skew-x: 37.7000008; skew-y: 45; scale-x: 0.744000018; scale-y: 0.737999976; }
        frame 36 { x: 38.5; y: 39.0999985; skew-x: 33.0999985; skew-y: 44.9000015; scale-x: 0.755999982; scale-y: 0.75999999; }
        frame 37 { x: 35.5999985; y: 38.5; skew-x: 28.5; skew-y: 45; scale-x: 0.769999981; scale-y: 0.785000026; }
        frame 38 { x: 30.6000004; y: 39.0999985; skew-x: 28.1000004; skew-y: 40.0999985; scale-x: 0.755999982; scale-y: 0.768000007; }
        frame 39 { x: 25.3999996; y: 39.7999992; skew-x: 27.8999996; skew-y: 35.2000008; scale-x: 0.744000018; scale-y: 0.754000008; }
        frame 40 { x: 20.7999992; y: 43.5; skew-x: 20.7999992; skew-y: 24.6000004; scale-x: 0.740999997; scale-y: 0.745999992; }
        frame 41 { x: 16.3999996; y: 47; skew-x: 13.8999996; skew-y: 13.8999996; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 15.5; y: 47.9000015; skew-x: 13.8000002; skew-y: 13.8000002; }
        frame 44 { x: 14.5; y: 48.7999992; skew-x: -10000; skew-y: -10000; }
        frame 45 { x: 13.6000004; y: 49.7000008; }
        frame 46 { x: 12.6000004; y: 50.5999985; skew-x: 13.8999996; skew-y: 13.8999996; }
        frame 47 { x: 13.8000002; y: 49.4000015; skew-x: 13.8000002; skew-y: 13.8000002; }
        frame 48 { x: 15.1000004; y: 48.0999985; skew-x: -10000; skew-y: -10000; }
        frame 49 { x: 16.3999996; y: 47; skew-x: 13.8999996; skew-y: 13.8999996; }
        frame 50 { x: -10000; y: -10000; skew-x: 13.8000002; skew-y: 13.8000002; }
        frame 51 { skew-x: -10000; skew-y: -10000; }
        frame 54 { skew-x: 13.8999996; skew-y: 13.8999996; }
        frame 55 { skew-x: 13.8000002; skew-y: 13.8000002; }
        frame 56 { skew-x: 13.8999996; skew-y: 13.8999996; }
        frame 57 { skew-x: -10000; skew-y: -10000; }
        frame 59 { skew-x: 13.8000002; skew-y: 13.8000002; }
        frame 60 { skew-x: -10000; skew-y: -10000; }
        frame 63 { skew-x: 13.8999996; skew-y: 13.8999996; }
        frame 64 { skew-x: 13.8000002; skew-y: 13.8000002; }
        frame 65 { skew-x: -10000; skew-y: -10000; }
        frame 69 { skew-x: 13.8999996; skew-y: 13.8999996; }
        frame 70 { skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 29.6000004; y: 30.1000004; skew-x: 31.2999992; skew-y: 31.2999992; scale-x: 0.737999976; scale-y: 0.737999976; }
        frame 72 { x: 43; y: 14.3000002; skew-x: 48.7999992; skew-y: 48.7999992; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 73 { x: 35; y: 19.6000004; skew-x: 40.0999985; skew-y: 40.0999985; scale-x: 0.736999989; scale-y: 0.736999989; }
        frame 74 { x: 27.2999992; y: 25.2999992; skew-x: 31.2999992; skew-y: 31.2999992; scale-x: 0.737999976; scale-y: 0.737999976; }
        frame 75 { x: 22.5; y: 29.5; skew-x: 30.6000004; skew-y: 30.6000004; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 17.7999992; y: 33.7999992; skew-x: 29.8999996; skew-y: 29.8999996; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 77 { x: 15.6000004; y: 40; skew-x: 21.7999992; skew-y: 21.7999992; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 13.6999998; y: 46.2999992; skew-x: 13.8999996; skew-y: 13.8999996; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 79 { x: 15.6999998; y: 47.5; skew-x: 20.2999992; skew-y: 20.2999992; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 80 { x: 17.7999992; y: 48.7999992; skew-x: 26.7000008; skew-y: 26.7000008; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 18.2999992; y: 45.7999992; skew-x: 26.7999992; skew-y: 26.7999992; }
        frame 82 { x: 18.8999996; y: 42.5999985; skew-x: 27.2000008; skew-y: 27.2000008; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 83 { x: 17.6000004; y: 44.7999992; skew-x: 20.5; skew-y: 20.5; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 84 { x: 16.3999996; y: 47; skew-x: 13.8999996; skew-y: 13.8999996; scale-x: 0.74000001; scale-y: 0.74000001; }
    }
    Track {
        source-name: "Zombie_catapult_driver_innerarm_lower";
        frame-count: 85;
        frame 0 { x: 50.0999985; y: 41.5999985; skew-x: 63; skew-y: 73.9000015; scale-x: 0.740999997; scale-y: 0.754000008; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_INNERARM_LOWER; }
        frame 1 { x: 50; y: 41.2999992; skew-x: 62.4000015; skew-y: 73.1999969; scale-x: 0.74000001; scale-y: -10000; image: none; }
        frame 2 { x: 49.9000015; y: 41.0999985; skew-x: 61.7000008; skew-y: 72.6999969; scale-x: -10000; }
        frame 3 { x: 49.7999992; y: 40.7999992; skew-x: 60.9000015; skew-y: 71.9000015; scale-y: 0.753000021; }
        frame 4 { x: 49.5999985; y: 40.4000015; skew-x: 60.2000008; skew-y: 71.1999969; scale-x: 0.739000022; scale-y: -10000; }
        frame 5 { x: 49.4000015; y: 40.0999985; skew-x: 59.4000015; skew-y: 70.5; scale-x: -10000; }
        frame 6 { x: 49.2000008; y: 39.7999992; skew-x: 58.7999992; skew-y: 69.6999969; scale-x: 0.74000001; scale-y: 0.754000008; }
        frame 7 { x: 49.4000015; y: 40.0999985; skew-x: 59.4000015; skew-y: 70.5; scale-x: 0.739000022; scale-y: 0.753000021; }
        frame 8 { x: 49.5; y: 40.4000015; skew-x: 60.2000008; skew-y: 71.1999969; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 49.7000008; y: 40.7000008; skew-x: 60.9000015; skew-y: 71.9000015; scale-x: 0.74000001; }
        frame 10 { x: 49.9000015; y: 41.0999985; skew-x: 61.7000008; skew-y: 72.6999969; scale-x: -10000; scale-y: 0.754000008; }
        frame 11 { x: 50; y: 41.4000015; skew-x: 62.4000015; skew-y: 73.1999969; scale-y: -10000; }
        frame 12 { x: 50.0999985; y: 41.5999985; skew-x: 63; skew-y: 73.9000015; scale-x: 0.740999997; }
        frame 13 { x: 50; y: 41.2999992; skew-x: 62.4000015; skew-y: 73.1999969; scale-x: 0.74000001; }
        frame 14 { x: 49.9000015; y: 41.0999985; skew-x: 61.7000008; skew-y: 72.6999969; scale-x: -10000; }
        frame 15 { x: 49.7999992; y: 40.7999992; skew-x: 60.9000015; skew-y: 71.9000015; scale-y: 0.753000021; }
        frame 16 { x: 49.5999985; y: 40.4000015; skew-x: 60.2000008; skew-y: 71.1999969; scale-x: 0.739000022; scale-y: -10000; }
        frame 17 { x: 49.4000015; y: 40.0999985; skew-x: 59.4000015; skew-y: 70.5; scale-x: -10000; }
        frame 18 { x: 49.2000008; y: 39.7999992; skew-x: 58.7999992; skew-y: 69.6999969; scale-x: 0.74000001; scale-y: 0.754000008; }
        frame 19 { x: 49.4000015; y: 40.0999985; skew-x: 59.4000015; skew-y: 70.5; scale-x: 0.739000022; scale-y: 0.753000021; }
        frame 20 { x: 49.5; y: 40.4000015; skew-x: 60.2000008; skew-y: 71.1999969; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 49.7000008; y: 40.7000008; skew-x: 60.9000015; skew-y: 71.9000015; scale-x: 0.74000001; }
        frame 22 { x: 49.9000015; y: 41.0999985; skew-x: 61.7000008; skew-y: 72.6999969; scale-x: -10000; scale-y: 0.754000008; }
        frame 23 { x: 50; y: 41.4000015; skew-x: 62.4000015; skew-y: 73.1999969; scale-y: -10000; }
        frame 24 { x: 50.0999985; y: 41.5999985; skew-x: 63; skew-y: 73.9000015; scale-x: 0.740999997; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 27 { x: 48.9000015; y: 42.5999985; skew-x: 51.4000015; skew-y: 56.4000015; scale-x: 0.739000022; scale-y: 0.741999984; }
        frame 28 { x: 54.5; y: 45; skew-x: 53.9000015; skew-y: 59.2000008; scale-x: 0.736999989; scale-y: 0.740999997; }
        frame 29 { x: 60.2000008; y: 47.5; skew-x: 56.5999985; skew-y: 61.7000008; scale-x: 0.737999976; scale-y: -10000; }
        frame 30 { x: 64.3000031; y: -10000; skew-x: 56.7000008; skew-y: -10000; scale-x: 0.736999989; scale-y: 0.74000001; }
        frame 31 { x: 68.5999985; skew-x: 56.5999985; scale-x: 0.737999976; scale-y: 0.740999997; }
        frame 32 { x: 69.8000031; y: 43.7000008; skew-x: 60.9000015; skew-y: 65.9000015; scale-x: 0.736999989; scale-y: 0.74000001; }
        frame 33 { x: 71.0999985; y: 40; skew-x: 64.9000015; skew-y: 70; scale-x: -10000; scale-y: 0.740999997; }
        frame 34 { x: 70.8000031; y: 42; skew-x: 71.5; skew-y: 80.1999969; scale-x: 0.744000018; scale-y: 0.74000001; }
        frame 35 { x: 69.9000015; y: 44.2999992; skew-x: 77.9000015; skew-y: 90.3000031; scale-x: 0.750999987; scale-y: -10000; }
        frame 36 { x: 68.3000031; y: 44.0999985; skew-x: 80.5; skew-y: 92.5999985; scale-x: -10000; }
        frame 37 { x: 66.8000031; y: -10000; skew-x: 82.6999969; skew-y: 95.0999985; }
        frame 38 { x: 62.2999992; y: 44.2999992; skew-x: 82.4000015; skew-y: 94.5; }
        frame 39 { x: 57.9000015; y: 44.5; skew-x: 81.8000031; skew-y: 94.1999969; }
        frame 40 { x: 54.2999992; y: 43; skew-x: 72.5; skew-y: 84.1999969; scale-x: 0.745000005; scale-y: 0.746999979; }
        frame 41 { x: 50.0999985; y: 41.5999985; skew-x: 63; skew-y: 73.9000015; scale-x: 0.740999997; scale-y: 0.754000008; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 48.5; skew-x: 60.7000008; skew-y: 71.5; scale-x: 0.74000001; }
        frame 44 { x: 47; y: 41.7000008; skew-x: 58.2000008; skew-y: 69.1999969; scale-x: 0.739000022; scale-y: 0.753000021; }
        frame 45 { x: 45.5; y: 41.9000015; skew-x: 55.7000008; skew-y: 66.6999969; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 43.7999992; y: 42; skew-x: 53.2000008; skew-y: 64.0999985; scale-x: 0.74000001; scale-y: 0.754000008; }
        frame 47 { x: 45.9000015; y: 41.7999992; skew-x: 56.4000015; skew-y: 67.4000015; scale-x: 0.739000022; scale-y: 0.753000021; }
        frame 48 { x: 48.0999985; y: 41.7000008; skew-x: 59.9000015; skew-y: 70.6999969; scale-x: 0.74000001; scale-y: 0.754000008; }
        frame 49 { x: 50.0999985; y: 41.5999985; skew-x: 63; skew-y: 73.9000015; scale-x: 0.740999997; scale-y: -10000; }
        frame 50 { x: 50.2000008; y: -10000; skew-x: 63.2000008; skew-y: 74; scale-x: 0.74000001; }
        frame 51 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 54 { x: 50.0999985; skew-x: 63; skew-y: 73.9000015; scale-x: 0.740999997; }
        frame 55 { x: 50.2000008; skew-x: 63.2000008; skew-y: 74; scale-x: 0.74000001; }
        frame 56 { x: 50.0999985; skew-x: 63; skew-y: 73.9000015; scale-x: 0.740999997; }
        frame 57 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 59 { x: 50.5999985; y: 42.4000015; skew-x: 65; skew-y: 76; scale-x: 0.74000001; }
        frame 60 { x: 51; y: 43.0999985; skew-x: 66.9000015; skew-y: 77.9000015; scale-x: -10000; }
        frame 61 { x: 51.5; y: 43.9000015; skew-x: 68.9000015; skew-y: 79.6999969; }
        frame 62 { x: 51.7999992; y: 44.7000008; skew-x: 70.6999969; skew-y: 81.6999969; }
        frame 63 { x: 52.2000008; y: 45.5; skew-x: 72.5999985; skew-y: 83.5; }
        frame 64 { x: 52; y: 44.7999992; skew-x: 71.1999969; skew-y: 82; }
        frame 65 { x: 51.5; y: 44.2000008; skew-x: 69.5; skew-y: 80.5; }
        frame 66 { x: 51.2999992; y: 43.5; skew-x: 67.9000015; skew-y: 78.6999969; }
        frame 67 { x: 50.9000015; y: 42.9000015; skew-x: 66.1999969; skew-y: 77.1999969; }
        frame 68 { x: 50.5; y: 42.2999992; skew-x: 64.6999969; skew-y: 75.6999969; }
        frame 69 { x: 50.0999985; y: 41.5999985; skew-x: 63; skew-y: 73.9000015; scale-x: 0.740999997; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 71 { x: 62.9000015; y: 36.7000008; skew-x: 85; skew-y: 95.8000031; scale-x: 0.739000022; scale-y: 0.753000021; }
        frame 72 { x: 73.3000031; y: 33.2999992; skew-x: 106.900002; skew-y: 117.800003; scale-x: -10000; scale-y: 0.751999974; }
        frame 73 { x: 67.8000031; y: 33.5999985; skew-x: 98; skew-y: 108.800003; scale-y: -10000; }
        frame 74 { x: 61.7999992; y: 34; skew-x: 89.3000031; skew-y: 100.099998; scale-y: 0.753000021; }
        frame 75 { x: 56.0999985; y: 35.9000015; skew-x: 84.1999969; skew-y: 94.8000031; scale-y: -10000; }
        frame 76 { x: 50; y: 37.9000015; skew-x: 78.8000031; skew-y: 89.6999969; scale-x: 0.74000001; }
        frame 77 { x: 48.5999985; y: 39.7000008; skew-x: 71; skew-y: 82; scale-x: 0.739000022; scale-y: 0.754000008; }
        frame 78 { x: 46.9000015; y: 41.5999985; skew-x: 63; skew-y: 73.9000015; scale-x: 0.740999997; scale-y: -10000; }
        frame 79 { x: 47.5999985; y: 44.5999985; skew-x: 65.4000015; skew-y: 76.4000015; scale-x: 0.74000001; }
        frame 80 { x: 48.2999992; y: 47.5; skew-x: 67.6999969; skew-y: 78.6999969; scale-x: -10000; }
        frame 81 { x: 50; y: 44.9000015; skew-x: 68.6999969; skew-y: 79.5; }
        frame 82 { x: 51.7000008; y: 42.2999992; skew-x: 69.3000031; skew-y: 80.1999969; }
        frame 83 { x: 51; y: 42; skew-x: 66.1999969; skew-y: 77.1999969; }
        frame 84 { x: 50.0999985; y: 41.5999985; skew-x: 63; skew-y: 73.9000015; scale-x: 0.740999997; }
    }
    Track {
        source-name: "Zombie_catapult_driver_innerarm_upper";
        frame-count: 85;
        frame 0 { x: 64.0999985; y: 29.1000004; skew-x: 65.9000015; skew-y: 49.5999985; scale-x: 0.800000012; scale-y: 0.714999974; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_INNERARM_UPPER; }
        frame 1 { x: 63.5999985; y: 28.6000004; skew-x: 64.5; skew-y: 48.2000008; scale-x: 0.797999978; scale-y: 0.713999987; image: none; }
        frame 2 { x: 63.2000008; y: 27.7999992; skew-x: 63.2000008; skew-y: 46.9000015; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 62.7999992; y: 27.2000008; skew-x: 61.7000008; skew-y: 45.4000015; }
        frame 4 { x: 62.2999992; y: 26.6000004; skew-x: 60.4000015; skew-y: 44.0999985; }
        frame 5 { x: 62; y: 26; skew-x: 58.9000015; skew-y: 42.5999985; }
        frame 6 { x: 61.5; y: 25.2999992; skew-x: 57.5999985; skew-y: 41.2999992; scale-x: 0.799000025; scale-y: 0.714999974; }
        frame 7 { x: 61.9000015; y: 26; skew-x: 58.9000015; skew-y: 42.5999985; scale-x: 0.797999978; scale-y: 0.713999987; }
        frame 8 { x: 62.2999992; y: 26.7000008; skew-x: 60.4000015; skew-y: 44.0999985; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 62.7000008; y: 27.2000008; skew-x: 61.7000008; skew-y: 45.4000015; }
        frame 10 { x: 63.2999992; y: 27.7999992; skew-x: 63.2000008; skew-y: 46.9000015; }
        frame 11 { x: 63.5999985; y: 28.5; skew-x: 64.5; skew-y: 48.2000008; scale-x: 0.799000025; }
        frame 12 { x: 64.0999985; y: 29.1000004; skew-x: 65.9000015; skew-y: 49.5999985; scale-x: 0.800000012; scale-y: 0.714999974; }
        frame 13 { x: 63.5999985; y: 28.6000004; skew-x: 64.5; skew-y: 48.2000008; scale-x: 0.797999978; scale-y: 0.713999987; }
        frame 14 { x: 63.2000008; y: 27.7999992; skew-x: 63.2000008; skew-y: 46.9000015; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 62.7999992; y: 27.2000008; skew-x: 61.7000008; skew-y: 45.4000015; }
        frame 16 { x: 62.2999992; y: 26.6000004; skew-x: 60.4000015; skew-y: 44.0999985; }
        frame 17 { x: 62; y: 26; skew-x: 58.9000015; skew-y: 42.5999985; }
        frame 18 { x: 61.5; y: 25.2999992; skew-x: 57.5999985; skew-y: 41.2999992; scale-x: 0.799000025; scale-y: 0.714999974; }
        frame 19 { x: 61.9000015; y: 26; skew-x: 58.9000015; skew-y: 42.5999985; scale-x: 0.797999978; scale-y: 0.713999987; }
        frame 20 { x: 62.2999992; y: 26.7000008; skew-x: 60.4000015; skew-y: 44.0999985; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 62.7000008; y: 27.2000008; skew-x: 61.7000008; skew-y: 45.4000015; }
        frame 22 { x: 63.2999992; y: 27.7999992; skew-x: 63.2000008; skew-y: 46.9000015; }
        frame 23 { x: 63.5999985; y: 28.5; skew-x: 64.5; skew-y: 48.2000008; scale-x: 0.799000025; }
        frame 24 { x: 64.0999985; y: 29.1000004; skew-x: 65.9000015; skew-y: 49.5999985; scale-x: 0.800000012; scale-y: 0.714999974; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 62.5; y: 28.6000004; skew-x: 58.7000008; skew-y: 42.4000015; scale-x: 0.797999978; scale-y: 0.713999987; }
        frame 28 { x: 57.2999992; y: 30.7000008; skew-x: 31.2999992; skew-y: 22.2999992; scale-x: 0.779999971; scale-y: 0.712000012; }
        frame 29 { x: 53.4000015; y: 34.9000015; skew-x: 3.79999995; skew-y: 2.5999999; scale-x: 0.764999986; scale-y: -10000; }
        frame 30 { x: 54.2000008; y: -10000; skew-x: -10000; skew-y: 2.5; scale-x: 0.763999999; }
        frame 31 { x: 55; skew-y: 2.5999999; scale-x: 0.764999986; }
        frame 32 { x: -10000; skew-y: 2.5; scale-x: 0.763999999; }
        frame 33 { skew-y: 2.5999999; scale-x: 0.764999986; }
        frame 34 { skew-y: 2.5; scale-x: 0.763999999; }
        frame 35 { skew-y: 2.5999999; scale-x: 0.764999986; }
        frame 36 { skew-y: 2.5; scale-x: 0.763999999; }
        frame 37 { skew-y: 2.5999999; scale-x: 0.764999986; }
        frame 38 { skew-y: 2.5; scale-x: 0.763999999; }
        frame 39 { skew-y: 2.5999999; scale-x: 0.764999986; }
        frame 40 { x: 58.9000015; y: 30.2999992; skew-x: 34.7999992; skew-y: 26.1000004; scale-x: 0.781000018; scale-y: 0.713; }
        frame 41 { x: 64.0999985; y: 29.1000004; skew-x: 65.9000015; skew-y: 49.5999985; scale-x: 0.800000012; scale-y: 0.714999974; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 63.2999992; y: 29.7000008; skew-x: 64; skew-y: 50.5999985; scale-x: 0.791000009; scale-y: 0.713999987; }
        frame 44 { x: 62.5999985; y: 30.1000004; skew-x: 62.2000008; skew-y: 51.4000015; scale-x: 0.783999979; scale-y: -10000; }
        frame 45 { x: 61.9000015; y: 30.7000008; skew-x: 60.2000008; skew-y: 52.4000015; scale-x: 0.776000023; }
        frame 46 { x: 61.0999985; y: 31.2000008; skew-x: 58.2999992; skew-y: 53.4000015; scale-x: 0.769999981; scale-y: 0.714999974; }
        frame 47 { x: 62.0999985; y: 30.5; skew-x: 60.9000015; skew-y: 52.0999985; scale-x: 0.778999984; scale-y: 0.713999987; }
        frame 48 { x: 63.0999985; y: 29.8999996; skew-x: 63.4000015; skew-y: 50.9000015; scale-x: 0.788999975; scale-y: -10000; }
        frame 49 { x: 64.0999985; y: 29.1000004; skew-x: 65.9000015; skew-y: 49.5999985; scale-x: 0.800000012; scale-y: 0.714999974; }
        frame 50 { x: -10000; y: 29.2000008; skew-x: -10000; skew-y: -10000; scale-x: 0.799000025; scale-y: 0.713999987; }
        frame 51 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 54 { y: 29.1000004; scale-x: 0.800000012; scale-y: 0.714999974; }
        frame 55 { y: 29.2000008; scale-x: 0.799000025; scale-y: 0.713999987; }
        frame 56 { y: 29.1000004; scale-x: 0.800000012; scale-y: 0.714999974; }
        frame 57 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 63; y: 29.2999992; skew-x: 63.7000008; skew-y: 47.2000008; scale-x: 0.797999978; scale-y: 0.713999987; }
        frame 60 { x: 62; y: 29.3999996; skew-x: 61.2000008; skew-y: 44.9000015; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 60.9000015; y: 29.7000008; skew-x: 58.9000015; skew-y: 42.4000015; }
        frame 62 { x: 59.7000008; y: 29.8999996; skew-x: 56.4000015; skew-y: 40.0999985; }
        frame 63 { x: 58.5999985; y: 30.1000004; skew-x: 54.0999985; skew-y: 37.7999992; scale-x: 0.799000025; scale-y: 0.714999974; }
        frame 64 { x: 59.5; y: 29.8999996; skew-x: 56.0999985; skew-y: 39.5999985; scale-x: 0.797999978; scale-y: 0.713999987; }
        frame 65 { x: 60.5; y: 29.7000008; skew-x: 58.0999985; skew-y: 41.5999985; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 61.4000015; y: 29.5; skew-x: 59.9000015; skew-y: 43.5999985; }
        frame 67 { x: 62.2999992; y: 29.2999992; skew-x: 61.9000015; skew-y: 45.5999985; }
        frame 68 { x: 63.0999985; y: 29.2000008; skew-x: 63.9000015; skew-y: 47.5999985; }
        frame 69 { x: 64.0999985; y: 29.1000004; skew-x: 65.9000015; skew-y: 49.5999985; scale-x: 0.800000012; scale-y: 0.714999974; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 74; y: 24.6000004; skew-x: 73.6999969; skew-y: 57.2000008; scale-x: 0.799000025; scale-y: 0.713999987; }
        frame 72 { x: 83.6999969; y: 20.3999996; skew-x: 81.1999969; skew-y: 64.9000015; scale-x: -10000; scale-y: 0.714999974; }
        frame 73 { x: 78.8000031; y: 21.5; skew-x: 77.5; skew-y: 61.2000008; scale-x: 0.797999978; scale-y: 0.713; }
        frame 74 { x: 73.8000031; y: 22.6000004; skew-x: 73.6999969; skew-y: 57.2000008; scale-x: 0.799000025; scale-y: 0.713999987; }
        frame 75 { x: 71; y: 26.3999996; skew-x: 76.6999969; skew-y: 60.4000015; scale-x: 0.797999978; scale-y: 0.713; }
        frame 76 { x: 68.1999969; y: 30; skew-x: 79.6999969; skew-y: 63.4000015; scale-x: 0.799000025; scale-y: 0.714999974; }
        frame 77 { x: 65.0999985; y: 29.7000008; skew-x: 71.6999969; skew-y: 55.4000015; scale-x: 0.797999978; scale-y: 0.713999987; }
        frame 78 { x: 61.7999992; y: -10000; skew-x: 63.5999985; skew-y: 47.2999992; scale-x: 0.800000012; scale-y: 0.714999974; }
        frame 79 { x: 56.7999992; y: 29.3999996; skew-x: 56.9000015; skew-y: 34.7999992; scale-x: 0.83099997; scale-y: 0.713999987; }
        frame 80 { x: 51.4000015; y: 29.7999992; skew-x: 50; skew-y: 22.3999996; scale-x: 0.864000022; scale-y: -10000; }
        frame 81 { x: 57.5; y: 28.7999992; skew-x: 55.7000008; skew-y: 33.5999985; scale-x: 0.829999983; }
        frame 82 { x: 63.0999985; y: 28.2999992; skew-x: 61.2999992; skew-y: 45; scale-x: 0.799000025; scale-y: 0.714999974; }
        frame 83 { x: 63.5999985; y: 28.7000008; skew-x: 63.7000008; skew-y: 47.4000015; scale-x: 0.797999978; scale-y: 0.713999987; }
        frame 84 { x: 64.0999985; y: 29.1000004; skew-x: 65.9000015; skew-y: 49.5999985; scale-x: 0.800000012; scale-y: 0.714999974; }
    }
    Track {
        source-name: "Zombie_catapult_crankarm";
        frame-count: 85;
        frame 0 { x: 16; y: 52.7999992; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_CRANKARM; }
        frame 1 { x: -10000; y: 52.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 52.2999992; }
        frame 3 { y: 52; }
        frame 4 { y: 51.7999992; }
        frame 5 { y: 51.5; }
        frame 6 { y: 51.2000008; }
        frame 7 { y: 51.5; }
        frame 8 { y: 51.5999985; }
        frame 9 { y: 51.9000015; }
        frame 10 { y: 52.0999985; }
        frame 11 { y: 52.4000015; }
        frame 12 { y: 52.5999985; }
        frame 13 { y: 52.5; }
        frame 14 { y: 52.4000015; }
        frame 15 { y: 52.2000008; }
        frame 16 { y: 52; }
        frame 18 { y: 51.7999992; }
        frame 19 { y: 52; }
        frame 20 { y: 52.0999985; }
        frame 21 { y: 52.2999992; }
        frame 22 { y: 52.5; }
        frame 23 { y: 52.5999985; }
        frame 24 { y: 52.7999992; }
        frame 25 { y: -10000; }
        frame 27 { x: 12; y: 72.0999985; skew-x: -44.9000015; skew-y: -44.9000015; }
        frame 28 { x: 16.3999996; y: 80.6999969; skew-x: -67.4000015; skew-y: -67.4000015; }
        frame 29 { x: 22.7000008; y: 88.3000031; skew-x: -89.9000015; skew-y: -89.9000015; }
        frame 30 { x: 32; y: 91.4000015; skew-x: -112.400002; skew-y: -112.400002; }
        frame 31 { x: 41.9000015; y: 92.4000015; skew-x: -134.899994; skew-y: -134.899994; }
        frame 32 { x: 50.5999985; y: 88.0999985; skew-x: -157.399994; skew-y: -157.399994; }
        frame 33 { x: 58.2999992; y: 81.8000031; skew-x: -179.899994; skew-y: -179.899994; }
        frame 34 { x: 61.4000015; y: 72.5; skew-x: -202.399994; skew-y: -202.399994; }
        frame 35 { x: 62.4000015; y: 62.5; skew-x: -224.899994; skew-y: -224.899994; }
        frame 36 { x: 58.0999985; y: 53.7999992; skew-x: -247.399994; skew-y: -247.399994; }
        frame 37 { x: 51.9000015; y: 46; skew-x: -269.899994; skew-y: -269.899994; }
        frame 38 { x: 42.5; y: 43; skew-x: -292.399994; skew-y: -292.399994; }
        frame 39 { x: 32.5; y: 41.9000015; skew-x: -314.899994; skew-y: -314.899994; }
        frame 40 { x: 23.7999992; y: 46.4000015; skew-x: -337.399994; skew-y: -337.399994; }
        frame 41 { x: 16; y: 52.7999992; skew-x: -359.899994; skew-y: -359.899994; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 43 { x: 14; y: 54.7000008; skew-x: -365; skew-y: -365; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 44 { x: 12.1999998; y: 56.7999992; skew-x: -370.200012; skew-y: -370.200012; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 10.3999996; y: 58.7999992; skew-x: -375.399994; skew-y: -375.399994; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 46 { x: 8.69999981; y: 61; skew-x: -380.700012; skew-y: -380.700012; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 47 { x: 10.8999996; y: 58.0999985; skew-x: -373.700012; skew-y: -373.700012; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 13.3999996; y: 55.4000015; skew-x: -366.700012; skew-y: -366.700012; }
        frame 49 { x: 16; y: 52.7999992; skew-x: -359.899994; skew-y: -359.899994; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 24.8999996; y: 37.2999992; skew-x: -353.899994; skew-y: -353.899994; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 34.0999985; y: 22; skew-x: -347.5; skew-y: -347.5; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 28.5; y: 27.1000004; skew-x: -351.600006; skew-y: -351.600006; }
        frame 74 { x: 22.8999996; y: 32.0999985; skew-x: -355.899994; skew-y: -355.899994; }
        frame 75 { x: 17.2999992; y: 37.2999992; skew-x: -359.899994; skew-y: -359.899994; }
        frame 76 { x: 12; y: 42.5; skew-x: -363.899994; skew-y: -363.899994; }
        frame 77 { x: 12.1999998; y: 48.4000015; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: -10000; y: 54.2000008; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: 12.8999996; y: 55.2999992; skew-x: -363; skew-y: -363.200012; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 80 { x: 13.3000002; y: 56.5999985; skew-x: -362.299988; skew-y: -362.5; scale-x: 0.916000009; scale-y: 0.879999995; }
        frame 81 { x: 14; y: 53.9000015; skew-x: -362.200012; skew-y: -362.399994; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 82 { x: 14.6000004; y: 51.2999992; skew-x: -362.399994; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: -10000; y: 53; skew-x: -362.200012; skew-y: -362.200012; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 54.7999992; skew-x: -362.399994; skew-y: -362.399994; }
    }
    Track {
        source-name: "Zombie_catapult_driver_innerleg_foot";
        frame-count: 85;
        frame 0 { x: 63; y: 98.5; scale-x: 0.740999997; scale-y: 0.740999997; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_INNERLEG_FOOT; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
    }
    Track {
        source-name: "Zombie_catapult_driver_innerleg_lower";
        frame-count: 85;
        frame 0 { x: 61.5; y: 93.0999985; scale-x: 0.740999997; scale-y: 0.740999997; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_INNERLEG_LOWER; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
    }
    Track {
        source-name: "Zombie_catapult_driver_innerleg_upper";
        frame-count: 85;
        frame 0 { x: 63.5; y: 75.6999969; scale-x: 0.740999997; scale-y: 0.740999997; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_INNERLEG_UPPER; }
        frame 1 { x: 63.5999985; y: 76.3000031; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 63.7999992; y: 76.8000031; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 3 { x: 64; y: 77.5; skew-x: -6.9000001; skew-y: -6.9000001; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 4 { x: 64.3000031; y: 78.0999985; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 64.5; y: 78.6999969; skew-x: -11.5; skew-y: -11.5; }
        frame 6 { x: 64.8000031; y: 79.4000015; skew-x: -13.8999996; skew-y: -13.8999996; }
        frame 7 { x: -10000; y: 79.5999985; skew-x: -10000; skew-y: -10000; }
        frame 8 { y: 79.6999969; }
        frame 9 { y: 79.8000031; }
        frame 10 { y: -10000; }
        frame 11 { y: 80; }
        frame 13 { x: 64.5999985; y: 79.3000031; skew-x: -11.5; skew-y: -11.5; }
        frame 14 { x: 64.3000031; y: 78.5; skew-x: -9.19999981; skew-y: -9.19999981; }
        frame 15 { x: 64; y: 77.8000031; skew-x: -6.9000001; skew-y: -6.9000001; }
        frame 16 { x: 63.9000015; y: 77.0999985; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 17 { x: 63.7000008; y: 76.3000031; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 63.5; y: 75.6999969; skew-x: 0; skew-y: 0; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 77 { x: 63.2999992; y: 75.9000015; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 78 { x: 63; y: 76.3000031; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 79 { x: 63.2999992; y: 75.9000015; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 80 { x: 63.5; y: 75.6999969; skew-x: 0; skew-y: 0; }
        frame 81 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "Zombie_catapult_driver_body";
        frame-count: 85;
        frame 0 { x: 50.4000015; y: 15.1999998; scale-x: 0.740999997; scale-y: 0.740999997; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_BODY; }
        frame 1 { x: 50.0999985; y: 14.8999996; scale-x: 0.746999979; scale-y: 0.746999979; image: none; }
        frame 2 { x: 49.9000015; y: 14.8000002; skew-x: -0.100000001; skew-y: -0.100000001; scale-x: 0.754000008; scale-y: 0.754000008; }
        frame 3 { x: 50.5999985; y: 14.1999998; skew-x: 0.600000024; skew-y: 0.600000024; scale-x: 0.75; scale-y: 0.75; }
        frame 4 { x: 51.5; y: 13.3000002; skew-x: 1.5; skew-y: 1.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 5 { x: 52.4000015; y: 12.5; skew-x: 2.5; skew-y: 2.5; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 6 { x: 53.0999985; y: 11.6000004; skew-x: 3.5999999; skew-y: 3.5999999; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 7 { x: 52.5; y: 12.3000002; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 52.0999985; y: 12.8999996; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 9 { x: 51.7999992; y: 13.5; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 10 { x: 51.2000008; y: 14.1000004; skew-x: 1; skew-y: 1; }
        frame 11 { x: 50.9000015; y: 14.6999998; skew-x: 0.5; skew-y: 0.5; }
        frame 12 { x: 50.4000015; y: 15.1999998; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: 14.6999998; skew-x: 0.5; skew-y: 0.5; scale-x: 0.748000026; scale-y: 0.744000018; }
        frame 14 { x: 50.5; y: 14.1000004; skew-x: 1; skew-y: 1; scale-x: 0.754999995; scale-y: 0.746999979; }
        frame 15 { x: 51.0999985; y: 13.5; skew-x: 1.5; skew-y: 1.5; scale-x: 0.750999987; scale-y: 0.745000005; }
        frame 16 { x: 51.7999992; y: 12.8000002; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.748000026; scale-y: 0.744000018; }
        frame 17 { x: 52.2000008; y: 12.1999998; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.744000018; scale-y: 0.741999984; }
        frame 18 { x: 53.0999985; y: 11.6000004; skew-x: 3.5999999; skew-y: 3.5999999; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 19 { x: 52.5; y: 12.3000002; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 52.0999985; y: 12.8999996; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 21 { x: 51.7999992; y: 13.5; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 22 { x: 51.2000008; y: 14.1000004; skew-x: 1; skew-y: 1; }
        frame 23 { x: 50.9000015; y: 14.6999998; skew-x: 0.5; skew-y: 0.5; }
        frame 24 { x: 50.4000015; y: 15.1999998; skew-x: 0; skew-y: 0; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 50; y: 15.5; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 27 { x: 49.5999985; y: 15.8999996; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 28 { x: 49.2999992; y: 16.1000004; skew-x: -1.5; skew-y: -1.5; }
        frame 29 { x: 48.9000015; y: 16.6000004; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 30 { x: 48.5; y: 16.8999996; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 31 { x: 48; y: 17.2000008; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 32 { x: 47.7999992; y: 17.5; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 33 { x: 47.2999992; y: 18; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 34 { x: 47.9000015; y: 17.5; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 35 { x: 48.2000008; y: 17.2000008; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 36 { x: 48.5; y: 16.8999996; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 37 { x: 48.9000015; y: 16.6000004; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 38 { x: 49.4000015; y: 16.2000008; skew-x: -1.5; skew-y: -1.5; }
        frame 39 { x: 49.7000008; y: 15.8000002; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 40 { x: 50.0999985; y: 15.6000004; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 41 { x: 50.4000015; y: 15.1999998; skew-x: 0; skew-y: 0; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 43 { x: 49.5999985; y: 14.8000002; }
        frame 44 { x: 48.9000015; y: 14.3999996; }
        frame 45 { x: 48.2000008; y: 14; }
        frame 46 { x: 47.5; y: 13.5; skew-x: 0.200000003; skew-y: 0.200000003; }
        frame 47 { x: 47.7999992; y: 13.8000002; skew-x: 0; skew-y: 0; }
        frame 48 { x: 48.0999985; y: 14; skew-x: -10000; skew-y: -10000; }
        frame 49 { x: 48.5; y: 14.1999998; }
        frame 50 { x: 48.9000015; y: 14.3999996; }
        frame 51 { x: 49.2999992; y: 14.6000004; }
        frame 52 { x: 49.5999985; y: 14.8999996; }
        frame 53 { x: 50; y: 15.1000004; }
        frame 54 { x: 50.4000015; y: 15.1999998; }
        frame 55 { x: -10000; y: -10000; }
        frame 59 { x: 49.7999992; y: 15.6000004; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 60 { x: 49.0999985; y: 16.1000004; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 61 { x: 48.5; y: 16.5; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 62 { x: 47.9000015; y: 16.8999996; skew-x: -2; skew-y: -2; }
        frame 63 { x: 47.2000008; y: 17.5; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 64 { x: 47.7999992; y: 17.1000004; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 65 { x: 48.4000015; y: 16.7000008; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 66 { x: 49; y: 16.2999992; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 67 { x: 49.4000015; y: 15.8999996; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 68 { x: 50; y: 15.6000004; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 69 { x: 50.4000015; y: 15.1999998; skew-x: 0; skew-y: 0; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 61; y: 8.80000019; skew-x: 7.5; skew-y: 7.5; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 72 { x: 72.1999969; y: 3; skew-x: 15.3000002; skew-y: 15.3000002; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 66.3000031; y: 5.9000001; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 74 { x: 60.9000015; y: 8.80000019; skew-x: 7.5; skew-y: 7.5; }
        frame 75 { x: 55.5; y: 11.8999996; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 76 { x: 50.4000015; y: 15.1999998; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 49; y: 15.8000002; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 78 { x: 47.5; y: 16.3999996; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 79 { x: 45.7999992; y: 17.3999996; skew-x: -3.4000001; skew-y: -3.4000001; }
        frame 80 { x: 43.9000015; y: 18.2999992; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 81 { x: 47.9000015; y: 16.2999992; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 82 { x: 51.7999992; y: 14.5; skew-x: 1.5; skew-y: 1.5; }
        frame 83 { x: 51.0999985; y: 14.8000002; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 84 { x: 50.4000015; y: 15.1999998; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_catapult_driver_mouth";
        frame-count: 85;
        frame 0 { x: 40.7999992; y: 27.7999992; scale-x: 0.740999997; scale-y: 0.740999997; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_MOUTH; }
        frame 1 { x: 41.0999985; y: 28.1000004; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 41.2999992; y: 28.3999996; skew-x: -0.600000024; skew-y: -0.600000024; }
        frame 3 { x: 41.7999992; y: 26.7000008; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 4 { x: 42.2999992; y: 25; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 42.7999992; y: 23.2999992; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 6 { x: 43.2999992; y: 21.7000008; skew-x: 7.9000001; skew-y: 7.9000001; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 7 { x: 43.5999985; y: 21.2000008; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 8 { x: 43.7999992; y: 20.7000008; skew-x: 8.80000019; skew-y: 8.80000019; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 43; y: 22.5; skew-x: 6.5; skew-y: 6.5; }
        frame 10 { x: 42.0999985; y: 24.2999992; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 11 { x: 41.4000015; y: 26; skew-x: 2; skew-y: 2; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 12 { x: 40.7999992; y: 27.7999992; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 41.0999985; y: 28.1000004; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 14 { x: 41.2999992; y: 28.3999996; skew-x: -0.600000024; skew-y: -0.600000024; }
        frame 15 { x: 41.7999992; y: 26.7000008; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 16 { x: 42.2999992; y: 25; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 42.7999992; y: 23.2999992; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 18 { x: 43.2999992; y: 21.7000008; skew-x: 7.9000001; skew-y: 7.9000001; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 19 { x: 43.5999985; y: 21.2000008; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 20 { x: 43.7999992; y: 20.7000008; skew-x: 8.80000019; skew-y: 8.80000019; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 43; y: 22.5; skew-x: 6.5; skew-y: 6.5; }
        frame 22 { x: 42.0999985; y: 24.2999992; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 23 { x: 41.4000015; y: 26; skew-x: 2; skew-y: 2; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 24 { x: 40.7999992; y: 27.7999992; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 40.5; y: 28.2000008; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 27 { x: 40.0999985; y: 28.6000004; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 28 { x: 39.9000015; y: 29.1000004; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 29 { x: 39.5; y: 29.5; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 30 { x: 39.2000008; y: 30; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 31 { x: 39; y: 30.3999996; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 32 { x: 38.7000008; y: 30.8999996; skew-x: -2; skew-y: -2; }
        frame 33 { x: 38.4000015; y: 31.2999992; skew-x: -2.4000001; skew-y: -2.4000001; }
        frame 34 { x: 38.7000008; y: 30.8999996; skew-x: -2; skew-y: -2; }
        frame 35 { x: 39; y: 30.3999996; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 36 { x: 39.2000008; y: 30; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 37 { x: 39.5; y: 29.6000004; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 38 { x: 39.9000015; y: 29.1000004; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 39 { x: 40.0999985; y: 28.7000008; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 40 { x: 40.5; y: 28.2000008; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 41 { x: 40.7999992; y: 27.7999992; skew-x: 0; skew-y: 0; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 43 { x: 39.7000008; y: 25.8999996; skew-x: 2.5; skew-y: 2.5; }
        frame 44 { x: 38.5999985; y: 24.1000004; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 45 { x: 37.7000008; y: 22.2999992; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 36.5999985; y: 20.3999996; skew-x: 10.8000002; skew-y: 10.8000002; }
        frame 47 { x: 36.7999992; y: 20.8999996; skew-x: 12; skew-y: 9.80000019; scale-x: 0.754999995; }
        frame 48 { x: 37; y: 21.2000008; skew-x: 13.3000002; skew-y: 8.80000019; scale-x: 0.771000028; }
        frame 49 { y: 21.5; skew-x: 14.6999998; skew-y: 8.10000038; scale-x: 0.787; }
        frame 50 { x: 37.7999992; y: 22.7000008; skew-x: 11.8000002; skew-y: 6.30000019; scale-x: 0.777999997; }
        frame 51 { x: 38.5; y: 23.8999996; skew-x: 8.80000019; skew-y: 4.80000019; scale-x: 0.768000007; }
        frame 52 { x: 39.2999992; y: 25.2999992; skew-x: 5.80000019; skew-y: 3.0999999; scale-x: 0.759000003; }
        frame 53 { x: 40; y: 26.5; skew-x: 2.79999995; skew-y: 1.5; scale-x: 0.75; scale-y: 0.740999997; }
        frame 54 { x: 40.7999992; y: 27.7999992; skew-x: 0; skew-y: 0; scale-x: 0.740999997; scale-y: -10000; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 58 { x: 40.5; y: 27.1000004; skew-x: 0.5; skew-y: 0.5; }
        frame 59 { x: 40.2000008; y: 26.3999996; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 60 { x: 39.7000008; y: 27.3999996; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 61 { x: 39.2000008; y: 28.3999996; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 62 { x: 38.7999992; y: 29.2999992; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 63 { x: 38.0999985; y: 30.3999996; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 64 { x: 38.5999985; y: 31.2000008; skew-x: -3.70000005; skew-y: -1.89999998; }
        frame 65 { x: 39; y: 31.7999992; skew-x: -4.69999981; skew-y: -1.39999998; scale-x: 0.741999984; }
        frame 66 { x: 39.5; y: 30.7999992; skew-x: -3.4000001; skew-y: -0.899999976; scale-x: -10000; }
        frame 67 { x: 39.9000015; y: 29.7999992; skew-x: -2.20000005; skew-y: -0.699999988; scale-x: 0.740999997; }
        frame 68 { x: 40.2999992; y: 28.7999992; skew-x: -0.899999976; skew-y: -0.200000003; scale-x: -10000; }
        frame 69 { x: 40.7999992; y: 27.7999992; skew-x: 0; skew-y: 0; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 50.0999985; y: 19.7000008; skew-x: 7.5; skew-y: 7.5; scale-x: 0.74000001; scale-y: 0.773999989; }
        frame 72 { x: 59.7999992; y: 11.8000002; skew-x: 15.3000002; skew-y: 15.3000002; scale-x: -10000; scale-y: 0.808000028; }
        frame 73 { x: 55; y: 15.8000002; skew-x: 11.3000002; skew-y: 11.3000002; scale-y: 0.790000021; }
        frame 74 { x: 50.0999985; y: 19.7000008; skew-x: 7.5; skew-y: 7.5; scale-y: 0.773999989; }
        frame 75 { x: 45.5; y: 23.7999992; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: 0.740999997; scale-y: 0.757000029; }
        frame 76 { x: 40.7999992; y: 27.7999992; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.740999997; }
        frame 77 { x: 40.0999985; y: 28; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 78 { x: 39.5; y: 28.2999992; }
        frame 79 { x: 37.5; y: 29.8999996; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 80 { x: 35.4000015; y: 31.6000004; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 81 { x: 38; y: 29.5; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 82 { x: 40.7999992; y: 27.2999992; skew-x: 1.5; skew-y: 1.5; }
        frame 83 { x: -10000; y: 27.6000004; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 84 { y: 27.7999992; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_catapult_driver_head";
        frame-count: 85;
        frame 0 { x: 33.7999992; y: -1.70000005; scale-x: 0.740999997; scale-y: 0.740999997; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_HEAD; }
        frame 1 { x: 34; y: -10000; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: -1.60000002; skew-x: -0.600000024; skew-y: -0.600000024; }
        frame 3 { x: 35.5; y: -3.29999995; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 4 { x: 37.2000008; y: -5; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 38.7999992; y: -6.5999999; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 6 { x: 40.4000015; y: -8.5; skew-x: 7.9000001; skew-y: 7.9000001; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 7 { x: 40.5; y: -8.60000038; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 8 { x: 40.7000008; y: -8.69999981; skew-x: 8.80000019; skew-y: 8.80000019; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 38.7999992; y: -7; skew-x: 6.5; skew-y: 6.5; }
        frame 10 { x: 37.0999985; y: -5.30000019; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 11 { x: 35.2999992; y: -3.5; skew-x: 2; skew-y: 2; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 12 { x: 33.7999992; y: -1.70000005; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 34; y: -10000; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 14 { y: -1.60000002; skew-x: -0.600000024; skew-y: -0.600000024; }
        frame 15 { x: 35.5; y: -3.29999995; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 16 { x: 37.2000008; y: -5; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 38.7999992; y: -6.5999999; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 18 { x: 40.4000015; y: -8.5; skew-x: 7.9000001; skew-y: 7.9000001; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 19 { x: 40.5; y: -8.60000038; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 20 { x: 40.7000008; y: -8.69999981; skew-x: 8.80000019; skew-y: 8.80000019; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 38.7999992; y: -7; skew-x: 6.5; skew-y: 6.5; }
        frame 22 { x: 37.0999985; y: -5.30000019; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 23 { x: 35.2999992; y: -3.5; skew-x: 2; skew-y: 2; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 24 { x: 33.7999992; y: -1.70000005; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 33.4000015; y: -1.20000005; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 27 { x: 33; y: -0.699999988; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 28 { x: 32.5; y: -0.200000003; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 29 { x: 32; y: 0.200000003; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 30 { x: 31.5; y: 0.600000024; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 31 { x: 31.1000004; y: 1.10000002; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 32 { x: 30.7000008; y: 1.60000002; skew-x: -2; skew-y: -2; }
        frame 33 { x: 30.2000008; y: 2; skew-x: -2.4000001; skew-y: -2.4000001; }
        frame 34 { x: 30.7000008; y: 1.60000002; skew-x: -2; skew-y: -2; }
        frame 35 { x: 31.1000004; y: 1.10000002; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 36 { x: 31.5; y: 0.600000024; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 37 { x: 32; y: 0.100000001; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 38 { x: 32.5; y: -0.300000012; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 39 { x: 33; y: -0.800000012; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 40 { x: 33.4000015; y: -1.29999995; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 41 { x: 33.7999992; y: -1.70000005; skew-x: 0; skew-y: 0; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 43 { x: 34; y: -3.70000005; skew-x: 2.5; skew-y: 2.5; }
        frame 44 { x: 34.5; y: -5.80000019; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 45 { x: 35; y: -7.80000019; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 35.5; y: -9.80000019; skew-x: 10.8000002; skew-y: 10.8000002; }
        frame 47 { x: 35.2000008; y: -8.89999962; skew-x: 9.80000019; skew-y: 9.80000019; }
        frame 48 { x: 34.7999992; y: -8.10000038; skew-x: 8.80000019; skew-y: 8.80000019; }
        frame 49 { x: 34.5999985; y: -7.5; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 50 { x: 34.4000015; y: -6.4000001; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 51 { x: 34.2999992; y: -5.30000019; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 52 { x: 34.0999985; y: -4; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 53 { x: 34; y: -2.9000001; skew-x: 1.5; skew-y: 1.5; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 54 { x: 33.7999992; y: -1.70000005; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { x: 33.5; y: -1.89999998; skew-x: 0.5; skew-y: 0.5; }
        frame 59 { x: 33.2999992; y: -2.20000005; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 60 { x: 32.4000015; y: -1.29999995; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 61 { x: 31.5; y: -0.400000006; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 62 { x: 30.6000004; y: 0.300000012; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 63 { x: 29.7999992; y: 1.20000005; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 64 { x: 29.6000004; y: 1.5; skew-x: -3.20000005; skew-y: -3.4000001; }
        frame 65 { x: 29.2000008; y: 1.89999998; skew-x: -4; skew-y: -4.4000001; }
        frame 66 { x: 30.3999996; y: 0.899999976; skew-x: -2.9000001; skew-y: -3.20000005; }
        frame 67 { x: 31.5; y: 0; skew-x: -1.89999998; skew-y: -2.20000005; }
        frame 68 { x: 32.5999985; y: -0.699999988; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 69 { x: 33.7999992; y: -1.70000005; skew-x: 0; skew-y: 0; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 49.5; y: -11.6000004; skew-x: 11.1000004; skew-y: 11.1000004; scale-x: 0.74000001; scale-y: 0.748000026; }
        frame 72 { x: 65.9000015; y: -20.5; skew-x: 22.3999996; skew-y: 22.3999996; scale-x: -10000; scale-y: 0.754999995; }
        frame 73 { x: 57.5999985; y: -16.1000004; skew-x: 16.7999992; skew-y: 16.7999992; scale-y: 0.750999987; }
        frame 74 { x: 49.4000015; y: -11.5; skew-x: 11.1000004; skew-y: 11.1000004; scale-y: 0.748000026; }
        frame 75 { x: 41.5; y: -6.69999981; skew-x: 5.5; skew-y: 5.5; scale-y: 0.744000018; }
        frame 76 { x: 33.7999992; y: -1.70000005; skew-x: 0; skew-y: 0; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 77 { x: 32.0999985; y: -0.800000012; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 30.2999992; y: 0; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 79 { x: 27.8999996; y: 2.29999995; skew-x: -3.4000001; skew-y: -3.4000001; }
        frame 80 { x: 25.5; y: 4.5; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 81 { x: 31.2000008; y: -0; skew-x: 0; skew-y: 0; }
        frame 82 { x: 37; y: -4.5; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 83 { x: 35.2999992; y: -3.0999999; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 84 { x: 33.7999992; y: -1.70000005; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_catapult_driver_outerleg_foot";
        frame-count: 85;
        frame 0 { x: 76.6999969; y: 105; scale-x: 0.777999997; scale-y: 0.740999997; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_OUTERLEG_FOOT; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
    }
    Track {
        source-name: "Zombie_catapult_driver_outerleg_lower";
        frame-count: 85;
        frame 0 { x: 88.3000031; y: 87.9000015; scale-x: 0.740999997; scale-y: 0.740999997; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_OUTERLEG_LOWER; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
    }
    Track {
        source-name: "Zombie_catapult_driver_outerleg_upper";
        frame-count: 85;
        frame 0 { x: 88; y: 64.1999969; scale-x: 0.740999997; scale-y: 0.740999997; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_OUTERLEG_UPPER; }
        frame 1 { x: 87.9000015; y: 64; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 87.8000031; y: 63.7999992; skew-x: 1; skew-y: 1; }
        frame 3 { x: -10000; y: 63.5; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 4 { x: 87.6999969; y: 63.2999992; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 5 { x: 87.5; y: 63; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 6 { x: 87.5999985; y: 62.9000015; skew-x: 3.5999999; skew-y: 3.5999999; }
        frame 7 { x: -10000; y: 63.0999985; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 8 { x: 87.6999969; y: 63.4000015; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 9 { x: 87.8000031; y: 63.5999985; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 10 { x: -10000; y: 63.7999992; skew-x: 1; skew-y: 1; }
        frame 11 { x: 88; y: 64.0999985; skew-x: 0.5; skew-y: 0.5; }
        frame 12 { x: -10000; y: 64.1999969; skew-x: 0; skew-y: 0; }
        frame 13 { x: 87.9000015; y: 64; skew-x: 0.5; skew-y: 0.5; }
        frame 14 { x: 87.8000031; y: 63.7999992; skew-x: 1; skew-y: 1; }
        frame 15 { x: -10000; y: 63.5; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 16 { x: 87.6999969; y: 63.2999992; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 17 { x: 87.5; y: 63; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 18 { x: 87.5999985; y: 62.9000015; skew-x: 3.5999999; skew-y: 3.5999999; }
        frame 19 { x: -10000; y: 63.0999985; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 20 { x: 87.6999969; y: 63.4000015; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 21 { x: 87.8000031; y: 63.5999985; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 22 { x: -10000; y: 63.7999992; skew-x: 1; skew-y: 1; }
        frame 23 { x: 88; y: 64.0999985; skew-x: 0.5; skew-y: 0.5; }
        frame 24 { x: -10000; y: 64.1999969; skew-x: 0; skew-y: 0; }
        frame 25 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 43 { x: 87.5; y: 64.6999969; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 44 { x: 86.8000031; y: 65.1999969; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 45 { x: 86.3000031; y: 65.5999985; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 46 { x: 85.8000031; y: 66.1999969; skew-x: -6; skew-y: -6; }
        frame 47 { x: 86.1999969; y: 65.9000015; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 48 { x: 86.4000015; y: 65.5999985; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 49 { x: 86.6999969; y: 65.4000015; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 87; y: 65.1999969; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 51 { x: 87.1999969; y: 65; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 52 { x: 87.5; y: 64.6999969; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 53 { x: 87.8000031; y: 64.5; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 54 { x: 88; y: 64.1999969; skew-x: 0; skew-y: 0; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { x: 87.9000015; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 59 { x: 87.8000031; y: 64.3000031; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 60 { x: 87.5999985; y: -10000; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 61 { x: 87.4000015; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 62 { x: 87.3000031; y: 64.5; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 63 { x: 87.1999969; y: -10000; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 64 { x: 87.3000031; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 65 { x: 87.5; y: 64.4000015; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 66 { x: 87.6999969; y: 64.3000031; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 67 { x: 87.8000031; y: -10000; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 68 { x: 88; y: 64.1999969; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 69 { x: -10000; y: -10000; skew-x: 0; skew-y: 0; }
        frame 70 { skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 91.5999985; y: 62; skew-x: 7.5; skew-y: 7.5; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 72 { x: 95.5; y: 60.2000008; skew-x: 15.3000002; skew-y: 15.3000002; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 93.5; y: 61.0999985; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 74 { x: 91.6999969; y: 62.0999985; skew-x: 7.5; skew-y: 7.5; }
        frame 75 { x: 89.8000031; y: 63; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 76 { x: 88; y: 64.1999969; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 87.5999985; y: 64; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 78 { x: 87.0999985; y: 63.9000015; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 79 { x: 86.1999969; y: 64; skew-x: -3.4000001; skew-y: -3.4000001; }
        frame 80 { x: 85.5; y: 63.9000015; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 81 { x: 86.9000015; y: 64.0999985; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 82 { x: 88; y: 64.1999969; skew-x: 0; skew-y: 0; }
        frame 83 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "Zombie_catapult_driver_hankie";
        frame-count: 85;
        frame 0 { x: 114.599998; y: 61.5; scale-x: 0.740999997; scale-y: 0.740999997; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_HANKIE; }
        frame 1 { x: -10000; y: 61.5999985; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: 0.754999995; image: none; }
        frame 2 { y: 61.7000008; skew-x: 4.0999999; skew-y: 4.0999999; scale-y: 0.768999994; }
        frame 3 { x: 114.5; y: 61.5999985; skew-x: 4.30000019; skew-y: 4.30000019; scale-y: 0.762000024; }
        frame 4 { x: -10000; y: 61.7000008; skew-x: 4.80000019; skew-y: 4.80000019; scale-x: 0.74000001; scale-y: 0.754999995; }
        frame 5 { y: 61.5999985; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: -10000; scale-y: 0.748000026; }
        frame 6 { x: 114.300003; y: -10000; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 7 { x: 113.900002; y: 61.9000015; skew-x: 2; skew-y: 2; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 8 { x: 113.699997; y: 62; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 113.400002; y: 62.4000015; skew-x: -5.19999981; skew-y: -5.19999981; }
        frame 10 { x: 113.199997; y: 62.5999985; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 11 { x: 114; y: 62.0999985; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 12 { x: 114.599998; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 13 { x: -10000; y: 61.5999985; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: 0.754999995; }
        frame 14 { y: 61.7000008; skew-x: 4.0999999; skew-y: 4.0999999; scale-y: 0.768999994; }
        frame 15 { x: 114.5; y: -10000; skew-x: 3.79999995; skew-y: 3.79999995; scale-y: 0.762000024; }
        frame 16 { x: 114.400002; skew-x: -10000; skew-y: -10000; scale-y: 0.754999995; }
        frame 17 { x: 114.300003; y: 61.7999992; skew-x: 3.5; skew-y: 3.5; scale-y: 0.748000026; }
        frame 18 { x: -10000; y: -10000; skew-x: 3.5999999; skew-y: 3.5999999; scale-y: 0.740999997; }
        frame 19 { x: 114; y: 62; skew-x: 0.300000012; skew-y: 0.300000012; scale-y: -10000; }
        frame 20 { x: 113.699997; y: 62.0999985; skew-x: -2.5; skew-y: -2.5; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 21 { x: 113.300003; y: 62.4000015; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 113.199997; y: 62.5999985; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 23 { x: 114; y: 62.0999985; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 24 { x: 114.599998; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 114.099998; y: 61.0999985; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 44 { x: 113.400002; y: 60.9000015; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 45 { x: 112.900002; y: 60.5999985; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 112.199997; y: 60.4000015; skew-x: -12.3999996; skew-y: -12.3999996; }
        frame 47 { x: 112.5; y: 60.5; skew-x: -10.6999998; skew-y: -10.6999998; }
        frame 48 { x: 112.800003; y: 60.5999985; skew-x: -9.19999981; skew-y: -9.19999981; }
        frame 49 { x: 113.099998; y: 60.7999992; skew-x: -7.69999981; skew-y: -7.69999981; }
        frame 50 { x: 113.300003; y: 60.9000015; skew-x: -6.19999981; skew-y: -6.19999981; }
        frame 51 { x: 113.699997; y: 61; skew-x: -4.5; skew-y: -4.5; }
        frame 52 { x: 114; y: 61.0999985; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 53 { x: 114.300003; y: 61.2999992; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 114.599998; y: 61.5; skew-x: 0; skew-y: 0; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { x: 114.5; y: 61.2999992; skew-x: -0.400000006; skew-y: -2.9000001; scale-y: 0.741999984; }
        frame 59 { x: 114.300003; y: 61; skew-x: -0.899999976; skew-y: -6.19999981; scale-y: 0.744000018; }
        frame 60 { x: 114.199997; y: 60.9000015; skew-x: -1.20000005; skew-y: -5.19999981; scale-y: 0.742999971; }
        frame 61 { x: 114; y: 60.7999992; skew-x: -1.70000005; skew-y: -4.4000001; scale-y: 0.741999984; }
        frame 62 { x: 113.800003; y: 60.5999985; skew-x: -2.20000005; skew-y: -3.4000001; scale-y: 0.740999997; }
        frame 63 { x: 113.599998; y: 60.5; skew-x: -2.70000005; skew-y: -2.70000005; scale-y: -10000; }
        frame 64 { x: 113.699997; y: 60.5999985; skew-x: -1.89999998; skew-y: -0.200000003; }
        frame 65 { x: 114; y: 60.9000015; skew-x: -1.39999998; skew-y: 2; scale-y: 0.741999984; }
        frame 66 { x: 114.199997; y: 61; skew-x: -0.899999976; skew-y: 1.5; scale-y: -10000; }
        frame 67 { x: 114.300003; y: 61.0999985; skew-x: -0.699999988; skew-y: 1; }
        frame 68 { x: 114.5; y: 61.2999992; skew-x: -0.200000003; skew-y: 0.5; scale-y: 0.740999997; }
        frame 69 { x: 114.599998; y: 61.5; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 118.199997; y: 63; skew-x: 7.5; skew-y: 7.5; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 72 { x: 121.800003; y: 64.5999985; skew-x: 15.3000002; skew-y: 15.3000002; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 120.099998; y: 63.7000008; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 74 { x: 118.300003; y: 63; skew-x: 7.5; skew-y: 7.5; }
        frame 75 { x: 116.5; y: 62.0999985; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 76 { x: 114.599998; y: 61.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 114.199997; y: 60.7999992; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 78 { x: 113.599998; y: 60; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 79 { x: 112.400002; skew-x: -7.5; skew-y: -7.5; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 80 { x: 111.300003; y: 59.7999992; skew-x: -13; skew-y: -13; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 113; y: 60.5; skew-x: -6.4000001; skew-y: -6.4000001; }
        frame 82 { x: 114.599998; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 83 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_catapult_driver_outerarm_hand";
        frame-count: 85;
        frame 0 { x: 59.2000008; y: 62; skew-x: 39; skew-y: 40.7000008; scale-x: 0.736999989; scale-y: 0.741999984; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_OUTERARM_HAND; }
        frame 1 { x: 59.4000015; y: 61.7999992; skew-x: 39.5999985; skew-y: 41.4000015; scale-x: 0.735000014; scale-y: 0.740999997; image: none; }
        frame 2 { x: 59.5999985; y: 61.7000008; skew-x: 40.2999992; skew-y: 42.0999985; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 59.7999992; y: 61.5999985; skew-x: 40.9000015; skew-y: 42.7999992; }
        frame 4 { x: 59.9000015; y: 61.5; skew-x: 41.5999985; skew-y: 43.4000015; }
        frame 5 { x: 60; y: 61.4000015; skew-x: 42.4000015; skew-y: 44.0999985; }
        frame 6 { x: 60.0999985; y: 61.2000008; skew-x: 43; skew-y: 44.7999992; scale-x: 0.736000001; scale-y: 0.741999984; }
        frame 7 { x: 60; y: 61.2999992; skew-x: 42.4000015; skew-y: 44.0999985; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 8 { x: 59.7999992; y: 61.5; skew-x: 41.5999985; skew-y: 43.4000015; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 59.5999985; y: 61.5999985; skew-x: 40.9000015; skew-y: 42.7999992; }
        frame 10 { x: 59.5; y: 61.7000008; skew-x: 40.2999992; skew-y: 42.0999985; }
        frame 11 { x: 59.2999992; y: 61.9000015; skew-x: 39.5999985; skew-y: 41.4000015; }
        frame 12 { x: 59.2000008; y: 62; skew-x: 39; skew-y: 40.7000008; scale-x: 0.736999989; scale-y: 0.741999984; }
        frame 13 { x: -10000; y: -10000; skew-x: 38.9000015; skew-y: 40.5999985; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 14 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 18 { skew-x: 39; skew-y: 40.7000008; scale-x: 0.736999989; scale-y: 0.741999984; }
        frame 19 { skew-x: 38.9000015; skew-y: 40.5999985; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 20 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 24 { skew-x: 39; skew-y: 40.7000008; scale-x: 0.736999989; scale-y: 0.741999984; }
        frame 25 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { y: 62; skew-x: 38.9000015; skew-y: 40.5999985; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 27 { x: 59.0999985; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 59.2000008; y: 62; }
        frame 29 { x: -10000; y: -10000; scale-y: 0.74000001; }
        frame 30 { y: 62; scale-y: -10000; }
        frame 31 { x: 59.0999985; y: -10000; }
        frame 32 { x: -10000; scale-x: 0.734000027; }
        frame 33 { x: 59.2000008; y: 62; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 34 { x: -10000; scale-x: 0.734000027; scale-y: 0.74000001; }
        frame 35 { x: 59.2999992; y: -10000; scale-x: 0.735000014; scale-y: -10000; }
        frame 36 { x: -10000; scale-x: -10000; }
        frame 37 { x: 59.2000008; }
        frame 38 { x: -10000; scale-y: 0.740999997; }
        frame 39 { scale-y: -10000; }
        frame 40 { x: 59.2999992; y: 62; }
        frame 41 { x: 59.2000008; y: -10000; skew-x: 39; skew-y: 40.7000008; scale-x: 0.736999989; scale-y: 0.741999984; }
        frame 42 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 58.5; y: 62; skew-x: 38.9000015; skew-y: 40.5999985; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 44 { x: 57.9000015; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.74000001; }
        frame 45 { x: 57.0999985; y: 62.2000008; scale-y: -10000; }
        frame 46 { x: 56.5999985; y: 62.0999985; scale-y: 0.740999997; }
        frame 47 { x: 56.9000015; y: 62.2000008; scale-x: 0.734000027; scale-y: 0.74000001; }
        frame 48 { x: 57.2999992; y: -10000; scale-x: 0.735000014; scale-y: -10000; }
        frame 49 { x: 57.5999985; y: 62.0999985; scale-x: -10000; }
        frame 50 { x: 57.9000015; y: 62; }
        frame 51 { x: 58.2999992; y: -10000; scale-y: 0.740999997; }
        frame 52 { x: 58.5; scale-y: -10000; }
        frame 53 { x: 58.9000015; }
        frame 54 { x: 59.2000008; y: 62; skew-x: 39; skew-y: 40.7000008; scale-x: 0.736999989; scale-y: 0.741999984; }
        frame 55 { x: -10000; y: -10000; skew-x: 38.9000015; skew-y: 40.5999985; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 56 { skew-x: 39; skew-y: 40.7000008; scale-x: 0.736999989; scale-y: 0.741999984; }
        frame 57 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { skew-x: 38.9000015; skew-y: 40.5999985; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 60 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 63 { skew-x: 39; skew-y: 40.7000008; scale-x: 0.736999989; scale-y: 0.741999984; }
        frame 64 { skew-x: 38.9000015; skew-y: 40.5999985; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 65 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 69 { skew-x: 39; skew-y: 40.7000008; scale-x: 0.736999989; scale-y: 0.741999984; }
        frame 70 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 66.6999969; y: 50.5; skew-x: 62.9000015; skew-y: 64.6999969; scale-x: 0.735000014; scale-y: 0.74000001; }
        frame 72 { x: 73.8000031; y: 41.4000015; skew-x: 86.6999969; skew-y: 88.5; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 70.5; y: 44.5999985; skew-x: 79.9000015; skew-y: 81.6999969; scale-x: 0.734000027; }
        frame 74 { x: 67; y: 48; skew-x: 73; skew-y: 74.6999969; scale-x: 0.735000014; }
        frame 75 { x: 63.5; y: 51.5; skew-x: 66; skew-y: 67.6999969; scale-x: -10000; }
        frame 76 { x: 59.7999992; y: 55.4000015; skew-x: 59.0999985; skew-y: 60.7999992; scale-x: 0.736000001; scale-y: 0.740999997; }
        frame 77 { x: 59; y: 58.9000015; skew-x: 47.9000015; skew-y: 49.5999985; scale-x: 0.735000014; scale-y: -10000; }
        frame 78 { x: 58.2000008; y: 62.7999992; skew-x: 36.7000008; skew-y: 38.4000015; scale-x: 0.736000001; scale-y: 0.741999984; }
        frame 79 { x: 57.7000008; y: 66.1999969; skew-x: 31.1000004; skew-y: 32.7999992; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 80 { x: 57.2999992; y: 69.8000031; skew-x: 25.2999992; skew-y: 27.1000004; scale-x: 0.736000001; scale-y: 0.741999984; }
        frame 81 { x: 58.0999985; y: 64.3000031; skew-x: 35.2999992; skew-y: 37.0999985; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 82 { x: 59.2000008; y: 59; skew-x: 45.2999992; skew-y: 47.0999985; scale-x: 0.736000001; scale-y: 0.741999984; }
        frame 83 { x: -10000; y: 60.5; skew-x: 42.0999985; skew-y: 43.9000015; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 84 { y: 62; skew-x: 39; skew-y: 40.7000008; scale-x: 0.736999989; scale-y: 0.741999984; }
    }
    Track {
        source-name: "Zombie_catapult_driver_outerarm_upper";
        frame-count: 85;
        frame 0 { x: 71.5; y: 28.7000008; skew-x: 6.5; skew-y: 6.5; scale-x: 0.740999997; scale-y: 0.740999997; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_OUTERARM_UPPER; }
        frame 1 { x: 71.5999985; y: 28.5; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: 0.74000001; scale-y: 0.74000001; image: none; }
        frame 2 { x: 71.6999969; y: 28.2999992; skew-x: 7.0999999; skew-y: 7.0999999; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 71.9000015; y: 28; skew-x: 7.5; skew-y: 7.5; }
        frame 4 { x: 72.0999985; y: 27.8999996; skew-x: 7.80000019; skew-y: 7.80000019; }
        frame 5 { x: 72.1999969; y: 27.6000004; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 6 { x: 72.5; y: 27.2999992; skew-x: 8.60000038; skew-y: 8.60000038; }
        frame 7 { x: 72.3000031; y: 27.6000004; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 8 { x: 72.0999985; y: 27.8999996; skew-x: 7.80000019; skew-y: 7.80000019; }
        frame 9 { x: 72; y: 28.1000004; skew-x: 7.5; skew-y: 7.5; }
        frame 10 { x: 71.8000031; y: 28.2999992; skew-x: 7.0999999; skew-y: 7.0999999; }
        frame 11 { x: 71.6999969; y: 28.5; skew-x: 6.80000019; skew-y: 6.80000019; }
        frame 12 { x: 71.5; y: 28.7000008; skew-x: 6.5; skew-y: 6.5; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 13 { x: 71.5999985; y: 28.5; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 14 { x: 71.6999969; y: 28.2999992; skew-x: 7.0999999; skew-y: 7.0999999; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 71.9000015; y: 28; skew-x: 7.5; skew-y: 7.5; }
        frame 16 { x: 72.0999985; y: 27.8999996; skew-x: 7.80000019; skew-y: 7.80000019; }
        frame 17 { x: 72.1999969; y: 27.6000004; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 18 { x: 72.5; y: 27.2999992; skew-x: 8.60000038; skew-y: 8.60000038; }
        frame 19 { x: 72.3000031; y: 27.6000004; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 20 { x: 72.0999985; y: 27.8999996; skew-x: 7.80000019; skew-y: 7.80000019; }
        frame 21 { x: 72; y: 28.1000004; skew-x: 7.5; skew-y: 7.5; }
        frame 22 { x: 71.8000031; y: 28.2999992; skew-x: 7.0999999; skew-y: 7.0999999; }
        frame 23 { x: 71.6999969; y: 28.5; skew-x: 6.80000019; skew-y: 6.80000019; }
        frame 24 { x: 71.5; y: 28.7000008; skew-x: 6.5; skew-y: 6.5; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 71.0999985; y: 28.8999996; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 27 { x: 70.8000031; y: 29; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 70.6999969; y: 29.1000004; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 29 { x: 70.3000031; y: 29.2000008; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 30 { x: 70; y: 29.5; skew-x: 3.5; skew-y: 3.5; }
        frame 31 { x: 69.8000031; y: 29.6000004; skew-x: 3; skew-y: 3; }
        frame 32 { x: 69.5; y: 29.7000008; skew-x: 2.5; skew-y: 2.5; }
        frame 33 { x: 69.1999969; y: 29.7999992; skew-x: 2; skew-y: 2; }
        frame 34 { x: 69.5; y: 29.6000004; skew-x: 2.5; skew-y: 2.5; }
        frame 35 { x: 69.8000031; y: 29.5; skew-x: 3; skew-y: 3; }
        frame 36 { x: 70.0999985; y: 29.3999996; skew-x: 3.5; skew-y: 3.5; }
        frame 37 { x: 70.3000031; y: 29.2000008; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 38 { x: 70.5999985; y: 29; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 39 { x: 70.8000031; y: 28.8999996; skew-x: 5.30000019; skew-y: 5.30000019; }
        frame 40 { x: 71.0999985; y: 28.7999992; skew-x: 5.80000019; skew-y: 5.80000019; }
        frame 41 { x: 71.5; y: 28.7000008; skew-x: 6.5; skew-y: 6.5; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 70.6999969; y: 28.2000008; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 44 { x: 69.9000015; y: 28; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 69.0999985; y: 27.5; }
        frame 46 { x: 68.3000031; y: 27.1000004; skew-x: 6.69999981; skew-y: 6.69999981; }
        frame 47 { x: 68.8000031; y: 27.3999996; skew-x: 6.5999999; skew-y: 6.5999999; }
        frame 48 { x: 69.1999969; y: 27.5; skew-x: 6.5; skew-y: 6.5; }
        frame 49 { x: 69.5; y: 27.7000008; skew-x: -10000; skew-y: -10000; }
        frame 50 { x: 69.8000031; y: 27.8999996; }
        frame 51 { x: 70.1999969; y: 28; }
        frame 52 { x: 70.5999985; y: 28.2999992; }
        frame 53 { x: 71.0999985; y: 28.5; }
        frame 54 { x: 71.5; y: 28.7000008; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 55 { x: 71.3000031; y: -10000; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 56 { x: 71.5; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 57 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 70.8000031; y: 29.2000008; skew-x: 5.5; skew-y: 5.5; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 60 { x: 70.1999969; y: 29.7999992; skew-x: 4.5; skew-y: 4.5; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 69.5999985; y: 30.3999996; skew-x: 3.5; skew-y: 3.5; }
        frame 62 { x: 68.9000015; y: 30.8999996; skew-x: 2.5; skew-y: 2.5; }
        frame 63 { x: 68.3000031; y: 31.5; skew-x: 1.70000005; skew-y: 1.70000005; }
        frame 64 { x: 68.8000031; y: 31; skew-x: 2.5; skew-y: 2.5; }
        frame 65 { x: 69.3000031; y: 30.5; skew-x: 3.29999995; skew-y: 3.29999995; }
        frame 66 { x: 69.9000015; y: 30.1000004; skew-x: 4; skew-y: 4; }
        frame 67 { x: 70.3000031; y: 29.6000004; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 68 { x: 70.9000015; y: 29.2000008; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 69 { x: 71.5; y: 28.7000008; skew-x: 6.5; skew-y: 6.5; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 82; y: 24.8999996; skew-x: 16.6000004; skew-y: 16.6000004; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 72 { x: 93.0999985; y: 21.7000008; skew-x: 26.8999996; skew-y: 26.8999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 88.6999969; y: 23.2000008; skew-x: 23.2999992; skew-y: 23.2999992; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 74 { x: 84.3000031; y: 24.7999992; skew-x: 19.7999992; skew-y: 19.7999992; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 79.8000031; y: 26.3999996; skew-x: 16.2999992; skew-y: 16.2999992; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 76 { x: 75.3000031; y: 28.1000004; skew-x: 12.8000002; skew-y: 12.8000002; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 72.1999969; y: 28.5; skew-x: 8.5; skew-y: 8.5; }
        frame 78 { x: 69.1999969; y: 29; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 79 { x: 67.5999985; y: 30.1000004; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 80 { x: 66; y: 30.8999996; skew-x: 1.70000005; skew-y: 1.70000005; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 69.0999985; y: 29.7999992; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 82 { x: 72.4000015; y: 28.5; skew-x: 8.10000038; skew-y: 8.10000038; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 83 { x: 71.9000015; y: 28.6000004; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 84 { x: 71.5; y: 28.7000008; skew-x: 6.5; skew-y: 6.5; scale-x: 0.740999997; scale-y: 0.740999997; }
    }
    Track {
        source-name: "Zombie_catapult_driver_outerarm_lower";
        frame-count: 85;
        frame 0 { x: 68.8000031; y: 51; skew-x: 18.6000004; skew-y: 20.3999996; scale-x: 0.736999989; scale-y: 0.742999971; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_OUTERARM_LOWER; }
        frame 1 { x: -10000; skew-x: 18.5; skew-y: 20.2999992; scale-x: -10000; scale-y: 0.741999984; image: none; }
        frame 2 { x: 68.6999969; y: 50.9000015; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 3 { x: -10000; y: 50.7999992; }
        frame 4 { y: 50.5; }
        frame 5 { x: 68.5999985; y: -10000; skew-x: 18.2999992; skew-y: 20.1000004; scale-x: 0.736000001; }
        frame 6 { x: -10000; y: 50.2999992; skew-x: 18.3999996; skew-y: 20.2000008; scale-x: 0.736999989; scale-y: 0.742999971; }
        frame 7 { x: 68.6999969; y: 50.4000015; skew-x: 18.2999992; skew-y: 20.1000004; scale-x: 0.736000001; scale-y: 0.741999984; }
        frame 8 { x: 68.8000031; y: 50.5; skew-x: 18.5; skew-y: 20.2999992; scale-x: 0.736999989; scale-y: -10000; }
        frame 9 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.736000001; }
        frame 10 { y: 50.7999992; scale-x: -10000; }
        frame 11 { x: 68.9000015; y: 50.9000015; }
        frame 12 { x: 68.8000031; y: 51; skew-x: 18.6000004; skew-y: 20.3999996; scale-x: 0.736999989; scale-y: 0.742999971; }
        frame 13 { x: -10000; skew-x: 18.5; skew-y: 20.2999992; scale-x: -10000; scale-y: 0.741999984; }
        frame 14 { x: 68.6999969; y: 50.9000015; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 15 { x: -10000; y: 50.7999992; }
        frame 16 { y: 50.5; }
        frame 17 { x: 68.5999985; y: -10000; skew-x: 18.2999992; skew-y: 20.1000004; scale-x: 0.736000001; }
        frame 18 { x: -10000; y: 50.2999992; skew-x: 18.3999996; skew-y: 20.2000008; scale-x: 0.736999989; scale-y: 0.742999971; }
        frame 19 { y: 50.4000015; skew-x: 18.2999992; skew-y: 20.1000004; scale-x: 0.736000001; scale-y: 0.741999984; }
        frame 20 { x: 68.8000031; y: 50.5; skew-x: 18.5; skew-y: 20.2999992; scale-x: 0.736999989; scale-y: -10000; }
        frame 21 { x: -10000; y: 50.5999985; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 22 { y: -10000; }
        frame 23 { y: 50.9000015; }
        frame 24 { y: 51; skew-x: 18.6000004; skew-y: 20.3999996; scale-y: 0.742999971; }
        frame 25 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { y: 51.2999992; skew-x: 18.2999992; skew-y: 20.5; scale-y: 0.741999984; }
        frame 27 { y: 51.5; skew-x: 18; skew-y: 20.6000004; scale-y: -10000; }
        frame 28 { y: 51.5999985; skew-x: 17.7999992; skew-y: 20.7999992; }
        frame 29 { x: 68.9000015; y: 51.9000015; skew-x: 17.2999992; skew-y: -10000; scale-x: 0.737999976; }
        frame 30 { x: 68.8000031; y: 52; skew-x: 17.1000004; scale-x: -10000; }
        frame 31 { x: 69; y: 52.2999992; skew-x: 16.7999992; skew-y: 21.1000004; }
        frame 32 { x: 68.8000031; y: 52.5; skew-x: 16.5; skew-y: -10000; scale-y: 0.740999997; }
        frame 33 { x: 69.0999985; y: 52.5999985; skew-x: 16.2999992; skew-y: 21.2999992; scale-x: 0.739000022; scale-y: 0.741999984; }
        frame 34 { x: -10000; y: 52.5; skew-x: 16.5; skew-y: 21.1000004; scale-x: 0.737999976; scale-y: 0.740999997; }
        frame 35 { x: 69.1999969; y: 52.0999985; skew-x: 16.7999992; skew-y: -10000; scale-x: -10000; scale-y: 0.741999984; }
        frame 36 { x: 69.0999985; y: 52; skew-x: 17.1000004; skew-y: 20.7999992; scale-y: -10000; }
        frame 37 { x: 69; y: 51.7999992; skew-x: 17.2999992; skew-y: -10000; }
        frame 38 { x: 69.0999985; y: 51.5999985; skew-x: 17.7999992; scale-x: 0.736999989; }
        frame 39 { x: -10000; y: 51.5; skew-x: 18; skew-y: 20.6000004; scale-x: -10000; }
        frame 40 { x: 69; y: 51.2000008; skew-x: 18.2999992; skew-y: 20.5; }
        frame 41 { x: 68.8000031; y: 51; skew-x: 18.6000004; skew-y: 20.3999996; scale-y: 0.742999971; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 43 { x: 68.0999985; skew-x: 17.6000004; skew-y: 21.7999992; scale-x: 0.74000001; scale-y: 0.741999984; }
        frame 44 { x: 67.4000015; skew-x: 16.7999992; skew-y: 23.5; scale-x: 0.742999971; scale-y: 0.740999997; }
        frame 45 { x: 66.6999969; skew-x: 15.8000002; skew-y: 25; scale-x: 0.746999979; scale-y: -10000; }
        frame 46 { x: 66; y: 51; skew-x: 15; skew-y: 26.6000004; scale-x: 0.750999987; }
        frame 47 { x: 66.3000031; skew-x: 15.3000002; skew-y: 25.7999992; scale-x: 0.748000026; }
        frame 48 { x: 66.8000031; y: -10000; skew-x: 15.8000002; skew-y: 25; scale-x: 0.746999979; }
        frame 49 { x: 67.0999985; skew-x: 16.2999992; skew-y: 24.2999992; scale-x: 0.745000005; }
        frame 50 { x: 67.5; skew-x: 16.7999992; skew-y: 23.5; scale-x: 0.742999971; }
        frame 51 { x: 67.8000031; y: 50.9000015; skew-x: 17.2999992; skew-y: 22.6000004; scale-x: 0.741999984; scale-y: 0.741999984; }
        frame 52 { x: 68.1999969; y: 51; skew-x: 17.6000004; skew-y: 21.7999992; scale-x: 0.74000001; scale-y: -10000; }
        frame 53 { x: 68.5999985; skew-x: 18.1000004; skew-y: 21.1000004; scale-x: 0.737999976; }
        frame 54 { x: 68.8000031; skew-x: 18.6000004; skew-y: 20.3999996; scale-x: 0.736999989; scale-y: 0.742999971; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: 20.2999992; scale-x: -10000; scale-y: 0.741999984; }
        frame 56 { skew-y: 20.3999996; scale-y: 0.742999971; }
        frame 57 { skew-y: -10000; scale-y: -10000; }
        frame 59 { y: 51.0999985; skew-x: 18.7999992; skew-y: 20.6000004; scale-y: 0.741999984; }
        frame 60 { y: 51.2999992; skew-x: 19.1000004; skew-y: 21; scale-y: -10000; }
        frame 61 { y: 51.5; skew-x: 19.5; skew-y: 21.2999992; }
        frame 62 { y: -10000; skew-x: 19.7999992; skew-y: 21.6000004; scale-x: 0.736000001; }
        frame 63 { x: 68.6999969; skew-x: 20.1000004; skew-y: 21.8999996; scale-x: 0.736999989; scale-y: 0.742999971; }
        frame 64 { x: -10000; skew-x: 19.7999992; skew-y: 21.6000004; scale-x: 0.736000001; scale-y: 0.741999984; }
        frame 65 { x: 68.8000031; y: 51.4000015; skew-x: 19.6000004; skew-y: 21.2999992; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: -10000; y: 51.2999992; skew-x: 19.2999992; skew-y: 21.1000004; scale-x: 0.736999989; }
        frame 67 { y: 51.0999985; skew-x: 19.1000004; skew-y: 20.7999992; scale-x: -10000; }
        frame 68 { y: -10000; skew-x: 18.7999992; skew-y: 20.6000004; }
        frame 69 { y: 51; skew-x: 18.6000004; skew-y: 20.3999996; scale-y: 0.742999971; }
        frame 70 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 71 { x: 78.5; y: 44.4000015; skew-x: 42.4000015; skew-y: 44.2999992; scale-x: 0.735000014; scale-y: 0.740999997; }
        frame 72 { x: 88.3000031; y: 41.2000008; skew-x: 66.4000015; skew-y: 68.0999985; scale-x: 0.736000001; scale-y: -10000; }
        frame 73 { x: 84.4000015; y: 42.5; skew-x: 59.4000015; skew-y: 61.2000008; scale-x: 0.735000014; scale-y: 0.74000001; }
        frame 74 { x: 80.5; y: 44.4000015; skew-x: 52.5999985; skew-y: 54.4000015; scale-x: -10000; scale-y: 0.740999997; }
        frame 75 { x: 76.5; y: 46.2999992; skew-x: 45.5999985; skew-y: 47.4000015; scale-y: -10000; }
        frame 76 { x: 72.5999985; y: 48.5; skew-x: 38.7000008; skew-y: 40.5; scale-x: 0.736999989; scale-y: 0.741999984; }
        frame 77 { x: 69.9000015; y: 49.5999985; skew-x: 27.5; skew-y: 29.2999992; scale-x: 0.736000001; scale-y: -10000; }
        frame 78 { x: 67.5; y: 51.4000015; skew-x: 16.2999992; skew-y: 18.1000004; scale-x: 0.736999989; scale-y: 0.742999971; }
        frame 79 { x: 65.6999969; y: 54.0999985; skew-x: 10.5; skew-y: 12.3000002; scale-x: -10000; scale-y: 0.741999984; }
        frame 80 { x: 64.0999985; y: 57; skew-x: 5; skew-y: 6.80000019; scale-y: 0.742999971; }
        frame 81 { x: 66.8000031; y: 52.9000015; skew-x: 14.8000002; skew-y: 16.7999992; scale-x: 0.736000001; scale-y: 0.741999984; }
        frame 82 { x: 70; y: 49.2999992; skew-x: 25; skew-y: 26.7000008; scale-x: 0.736999989; scale-y: 0.742999971; }
        frame 83 { x: 69.5; y: 50.0999985; skew-x: 21.7999992; skew-y: 23.5; scale-x: 0.736000001; scale-y: 0.741999984; }
        frame 84 { x: 68.8000031; y: 51; skew-x: 18.6000004; skew-y: 20.3999996; scale-x: 0.736999989; scale-y: 0.742999971; }
    }
    Track {
        source-name: "Zombie_catapult_innerwheel_rear1";
        frame-count: 85;
        frame 0 { x: 9.60000038; y: 89; image: IMAGE_REANIM_LAWNMOWER_WHEEL2; }
        frame 1 { x: -10000; y: -10000; image: none; }
        frame 43 { x: 9.19999981; y: 89.1999969; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: 8.60000038; y: 89.5999985; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: 8.10000038; y: 89.8000031; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: 7.5999999; y: 90.1999969; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: 8.19999981; y: 89.8000031; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 48 { x: 8.89999962; y: 89.3000031; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 49 { x: 9.60000038; y: 89; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 14.8999996; y: 72.5; skew-x: 6; skew-y: 6; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 72 { x: 20.2000008; y: 56; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 17.2000008; y: 61.5999985; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 14; y: 67.4000015; skew-x: 4; skew-y: 4; }
        frame 75 { x: 11; y: 73.1999969; skew-x: 0; skew-y: 0; }
        frame 76 { x: 8.19999981; y: 78.9000015; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 8.30000019; y: 84.8000031; skew-x: -10000; skew-y: -10000; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 78 { x: 8.39999962; y: 90.6999969; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 79 { x: 8.5; y: 91.5; skew-x: -3; skew-y: -3.20000005; scale-x: 1.00800002; scale-y: 0.987999976; }
        frame 80 { x: -10000; y: 92.3000031; skew-x: -2.29999995; skew-y: -2.5; scale-x: 1.01800001; scale-y: 0.977999985; }
        frame 81 { x: 9.10000038; y: 89.9000015; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 1.00800002; scale-y: 0.987999976; }
        frame 82 { x: 9.80000019; y: 87.6999969; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 83 { x: 9.89999962; y: 89.5; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 9.80000019; y: 91.1999969; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_innerwheel_rear2";
        frame-count: 85;
        frame 0 { x: 84.4000015; y: 89.1999969; image: IMAGE_REANIM_LAWNMOWER_WHEEL2; }
        frame 1 { x: -10000; y: -10000; image: none; }
        frame 43 { x: 83.8000031; y: 88.5999985; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: 83.3000031; y: 88; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: 82.8000031; y: 87.3000031; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: 82.3000031; y: 86.8000031; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: 83; y: 87.5999985; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 48 { x: 83.8000031; y: 88.3000031; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 49 { x: 84.4000015; y: 89.1999969; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 88.5999985; y: 80.6999969; skew-x: 6; skew-y: 6; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 72 { x: 93.0999985; y: 72.1999969; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 90.3000031; y: 72.5; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 87.6999969; y: 72.9000015; skew-x: 4; skew-y: 4; }
        frame 75 { x: 85.0999985; y: 73.4000015; skew-x: 0; skew-y: 0; }
        frame 76 { x: 82.5999985; y: 73.9000015; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 82.8000031; y: 79.8000031; skew-x: -10000; skew-y: -10000; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 78 { x: -10000; y: 85.6999969; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 79 { x: 83.6999969; y: 87.5; skew-x: -3; skew-y: -3.20000005; scale-x: 1.00800002; scale-y: 0.987999976; }
        frame 80 { x: 84.4000015; y: 89.3000031; skew-x: -2.29999995; skew-y: -2.5; scale-x: 1.01800001; scale-y: 0.977999985; }
        frame 81 { x: -10000; y: 87; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 1.00800002; scale-y: 0.987999976; }
        frame 82 { x: 84.3000031; y: 84.6999969; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 83 { x: 84.4000015; y: 86.4000015; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 84.3000031; y: 88.1999969; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_body";
        frame-count: 85;
        frame 0 { x: -2.4000001; y: 58.5; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BODY; }
        frame 1 { x: -10000; y: 58.2999992; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 58; }
        frame 3 { y: 57.9000015; }
        frame 4 { y: 57.5999985; }
        frame 5 { y: 57.5; }
        frame 6 { y: 57.2999992; }
        frame 7 { y: 57.5; }
        frame 8 { y: 57.5999985; }
        frame 9 { y: 57.9000015; }
        frame 10 { y: 58; }
        frame 11 { y: 58.2999992; }
        frame 12 { y: 58.5; }
        frame 13 { y: 58.2999992; }
        frame 14 { y: 58; }
        frame 15 { y: 57.9000015; }
        frame 16 { y: 57.5999985; }
        frame 17 { y: 57.5; }
        frame 18 { y: 57.2999992; }
        frame 19 { y: 57.5; }
        frame 20 { y: 57.5999985; }
        frame 21 { y: 57.9000015; }
        frame 22 { y: 58; }
        frame 23 { y: 58.2999992; }
        frame 24 { y: 58.5; }
        frame 25 { y: -10000; }
        frame 43 { x: -3.20000005; y: 58.7000008; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: -4.0999999; y: 59.2000008; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: -5; y: 59.5999985; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: -5.9000001; y: 60.2000008; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: -4.69999981; y: 59.5; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 48 { x: -3.5; y: 58.9000015; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 49 { x: -2.4000001; y: 58.5; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 58.9000015; }
        frame 59 { y: 59.2999992; }
        frame 60 { y: 58.9000015; }
        frame 61 { y: 58.5; }
        frame 62 { y: 58.9000015; }
        frame 63 { y: 59.2999992; }
        frame 64 { y: 58.9000015; }
        frame 65 { y: 58.5; }
        frame 66 { y: 58.9000015; }
        frame 67 { y: 59.2999992; }
        frame 68 { y: 58.9000015; }
        frame 69 { y: 58.5; }
        frame 70 { y: -10000; }
        frame 71 { x: 5.69999981; y: 41; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 14.8999996; y: 23.6000004; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 9.19999981; y: 29.7000008; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 3.5999999; y: 36.0999985; skew-x: 4; skew-y: 4; }
        frame 75 { x: -1.29999995; y: 42.5999985; skew-x: 0; skew-y: 0; }
        frame 76 { x: -6; y: 49.2999992; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: -5.80000019; y: 55.2999992; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: -5.69999981; y: 61; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: -5.5; y: 61.9000015; skew-x: -3; skew-y: -3.20000005; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 80 { x: -5.19999981; y: 62.9000015; skew-x: -2.29999995; skew-y: -2.5; scale-x: 0.916000009; scale-y: 0.879999995; }
        frame 81 { x: -4.4000001; y: 60; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 82 { x: -3.5999999; y: 57.7000008; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: -3.5; y: 59.2000008; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: -3.5999999; y: 61.2000008; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_spring";
        frame-count: 85;
        frame 0 { x: 10.3999996; y: 87.3000031; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_SPRING; }
        frame 1 { x: 10.5; y: 86.8000031; scale-x: -10000; scale-y: 0.912; image: none; }
        frame 2 { x: -10000; y: 86.3000031; scale-y: 0.924000025; }
        frame 3 { x: 10.6000004; y: 85.9000015; scale-y: 0.93599999; }
        frame 4 { x: -10000; y: 85.5; scale-y: 0.948000014; }
        frame 5 { y: 85; scale-y: 0.959999979; }
        frame 6 { x: 10.6999998; y: 84.5; scale-y: 0.972000003; }
        frame 7 { x: -10000; y: 85.5999985; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.930000007; }
        frame 8 { x: 10.6000004; y: 86.6999969; skew-x: -1.5; skew-y: -1.5; scale-y: 0.888000011; }
        frame 9 { x: 10.6999998; y: 86.8000031; skew-x: -0.899999976; skew-y: -0.899999976; scale-y: 0.890999973; }
        frame 10 { x: 10.6000004; y: 87; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.893999994; }
        frame 11 { x: 10.6999998; y: 87.0999985; skew-x: -0.200000003; skew-y: -0.200000003; scale-y: 0.897000015; }
        frame 12 { x: -10000; y: 87.3000031; skew-x: 0; skew-y: 0; scale-y: 0.899999976; }
        frame 13 { y: 86.8000031; skew-x: -10000; skew-y: -10000; scale-y: 0.912; }
        frame 14 { y: 86.3000031; scale-y: 0.924000025; }
        frame 15 { y: 85.9000015; scale-y: 0.93599999; }
        frame 16 { y: 85.5; scale-y: 0.948000014; }
        frame 17 { y: 85; scale-y: 0.959999979; }
        frame 18 { y: 84.5; scale-y: 0.972000003; }
        frame 19 { x: 10.8000002; y: 85.5999985; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.930000007; }
        frame 20 { x: -10000; y: 86.6999969; skew-x: -1.5; skew-y: -1.5; scale-y: 0.888000011; }
        frame 21 { x: 11; y: 86.8000031; skew-x: -0.899999976; skew-y: -0.899999976; scale-y: 0.890999973; }
        frame 22 { y: 87; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.893999994; }
        frame 23 { x: 11.1000004; y: 87.1999969; skew-x: -0.200000003; skew-y: -0.200000003; scale-y: 0.897000015; }
        frame 24 { x: 11.1999998; y: 87.3000031; skew-x: 0; skew-y: 0; scale-y: 0.899999976; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { y: 86.8000031; scale-x: 0.89200002; scale-y: 0.917999983; }
        frame 27 { y: 86.5; scale-x: 0.88499999; scale-y: 0.936999977; }
        frame 28 { x: 11.1000004; y: 86.0999985; scale-x: 0.876999974; scale-y: 0.954999983; }
        frame 29 { x: -10000; y: 85.6999969; scale-x: 0.870000005; scale-y: 0.97299999; }
        frame 30 { x: 11.1999998; y: 85.3000031; scale-x: 0.861999989; scale-y: 0.991999984; }
        frame 31 { x: -10000; y: 84.8000031; scale-x: 0.855000019; scale-y: 1.00999999; }
        frame 32 { x: 11.1000004; y: 84.5; scale-x: 0.847000003; scale-y: 1.02900004; }
        frame 33 { x: -10000; y: 84.0999985; scale-x: 0.838999987; scale-y: 1.04700005; }
        frame 34 { y: 83.6999969; scale-x: 0.832000017; scale-y: 1.06500006; }
        frame 35 { y: 83.3000031; scale-x: 0.824000001; scale-y: 1.08399999; }
        frame 36 { y: 82.9000015; scale-x: 0.816999972; scale-y: 1.102; }
        frame 37 { y: 82.5999985; scale-x: 0.809000015; scale-y: 1.12; }
        frame 38 { y: 82.0999985; scale-x: 0.801999986; scale-y: 1.13900006; }
        frame 39 { y: 81.8000031; scale-x: 0.79400003; scale-y: 1.15699995; }
        frame 40 { y: 81.3000031; scale-x: 0.787; scale-y: 1.17499995; }
        frame 41 { y: 80.9000015; scale-x: 0.778999984; scale-y: 1.19400001; }
        frame 42 { x: 14.1000004; y: 88.3000031; skew-x: 3.70000005; skew-y: 15.1999998; scale-x: 0.977999985; scale-y: 0.879000008; }
        frame 43 { x: 13.3000002; y: 88.8000031; skew-x: 0.800000012; skew-y: 12.3000002; scale-x: -10000; scale-y: 0.862999976; }
        frame 44 { x: 12.6000004; y: 89.3000031; skew-x: -1.70000005; skew-y: 9.60000038; scale-y: 0.848999977; }
        frame 45 { x: 11.8999996; y: 89.8000031; skew-x: -4.4000001; skew-y: 6.80000019; scale-x: 0.976999998; scale-y: 0.833999991; }
        frame 46 { x: 11.3000002; y: 90.3000031; skew-x: -7.19999981; skew-y: 4.19999981; scale-x: -10000; scale-y: 0.819000006; }
        frame 47 { x: -10000; y: 91.6999969; skew-x: -2.70000005; skew-y: 6.30000019; scale-x: 1.09500003; scale-y: 0.712000012; }
        frame 48 { x: 12.5; y: 90.1999969; skew-x: 1.5; skew-y: 7.30000019; scale-x: 1.02699995; scale-y: 0.764999986; }
        frame 49 { x: 13.6000004; y: 88.8000031; skew-x: 6; skew-y: 8.69999981; scale-x: 0.958999991; scale-y: 0.819000006; }
        frame 50 { x: 13.1000004; y: 88.1999969; skew-x: 4.80000019; skew-y: 7; scale-x: 0.947000027; scale-y: 0.850000024; }
        frame 51 { x: 12.5; y: 87.5999985; skew-x: 3.5; skew-y: 5.30000019; scale-x: 0.935000002; scale-y: 0.880999982; }
        frame 52 { x: 12; y: 86.9000015; skew-x: 2.29999995; skew-y: 3.79999995; scale-x: 0.922999978; scale-y: 0.912999988; }
        frame 53 { x: 11.3999996; y: 86.3000031; skew-x: 1; skew-y: 2.0999999; scale-x: 0.912; scale-y: 0.944000006; }
        frame 54 { x: 10.6999998; y: 85.5999985; skew-x: 0; skew-y: 0.600000024; scale-x: 0.899999976; scale-y: 0.976000011; }
        frame 55 { x: 10.8000002; y: 86.5999985; skew-x: -10000; skew-y: 0.300000012; scale-x: -10000; scale-y: 0.938000023; }
        frame 56 { x: 10.8999996; y: 87.3000031; skew-y: 0; scale-y: 0.899999976; }
        frame 57 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 58 { x: 10.8000002; y: 87.6999969; }
        frame 59 { x: 10.6999998; y: 88.0999985; }
        frame 60 { x: 10.8999996; y: 86.4000015; scale-y: 0.959999979; }
        frame 61 { x: 10.6999998; y: 87.3000031; scale-y: 0.899999976; }
        frame 62 { x: -10000; y: 88.3000031; scale-x: 0.967999995; scale-y: 0.867999971; }
        frame 63 { y: 88.0999985; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 64 { y: 86.4000015; scale-x: -10000; scale-y: 0.959999979; }
        frame 65 { x: 10.8999996; y: -10000; scale-y: 0.939999998; }
        frame 66 { x: -10000; y: 88.0999985; scale-y: 0.899999976; }
        frame 67 { y: 87.8000031; scale-y: -10000; }
        frame 68 { x: 11.1999998; y: 86.4000015; scale-y: 0.959999979; }
        frame 69 { x: 10.8999996; y: 87.3000031; scale-y: 0.899999976; }
        frame 70 { x: -10000; y: -10000; scale-y: -10000; }
        frame 71 { x: 16.8999996; y: 67.6999969; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 1.04100001; }
        frame 72 { x: 23.2000008; y: 48.2999992; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: 1.18299997; }
        frame 73 { x: 19.6000004; y: 55.2999992; skew-x: 8.30000019; skew-y: 8.30000019; scale-y: 1.11099994; }
        frame 74 { x: 15.8999996; y: 62.5999985; skew-x: 4; skew-y: 4; scale-y: 1.03999996; }
        frame 75 { x: 12.5; y: 69.8000031; skew-x: 0; skew-y: 0; scale-y: 0.970000029; }
        frame 76 { x: 9.30000019; y: 77.0999985; skew-x: -3.9000001; skew-y: -3.9000001; scale-y: 0.898999989; }
        frame 77 { x: 9.39999962; y: 83.0999985; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: 9.5; y: 88.8000031; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: 9.60000038; y: 88.5999985; skew-x: -3; skew-y: -3.20000005; scale-x: 0.907000005; scale-y: 0.936999977; }
        frame 80 { x: -10000; y: 88.1999969; skew-x: -2.29999995; skew-y: -2.5; scale-x: 0.916000009; scale-y: 0.975000024; }
        frame 81 { x: 10.1999998; y: 87.0999985; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.907000005; scale-y: 0.936999977; }
        frame 82 { x: 11; y: 86; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: -10000; y: 87.6999969; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 89.5; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_pole";
        frame-count: 85;
        frame 0 { x: 2.5; y: 29.1000004; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_POLE_WITHBALL; }
        frame 1 { x: 2.79999995; y: 28.6000004; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 3.29999995; y: 28.2000008; skew-x: 0.5; skew-y: 0.5; }
        frame 3 { x: 3.5999999; y: 27.5; skew-x: 1; skew-y: 1; }
        frame 4 { x: 4.0999999; y: 27; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 5 { x: 4.4000001; y: 26.7000008; skew-x: 1.60000002; skew-y: 1.60000002; }
        frame 6 { x: 4.80000019; y: 25.7999992; skew-x: 2; skew-y: 2; }
        frame 7 { x: 3.9000001; y: 27.1000004; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 8 { x: 3; y: 28.2000008; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 9 { x: 3.20000005; y: -10000; skew-x: -0; skew-y: -0; }
        frame 10 { x: 3.29999995; y: 28.5; skew-x: 0; skew-y: 0; }
        frame 11 { x: 3.4000001; y: 28.7999992; skew-x: -10000; skew-y: -10000; }
        frame 12 { x: 3.5; y: 29.1000004; }
        frame 13 { x: 3.70000005; y: 28.6000004; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 14 { x: 4; y: 28.2000008; skew-x: 0.5; skew-y: 0.5; }
        frame 15 { x: 4.30000019; y: 27.5; skew-x: 1; skew-y: 1; }
        frame 16 { x: 4.5999999; y: 27.1000004; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 17 { x: 4.80000019; y: 26.7000008; skew-x: 1.60000002; skew-y: 1.60000002; }
        frame 18 { x: 5.0999999; y: 25.7999992; skew-x: 2; skew-y: 2; }
        frame 19 { x: 4; y: 27.1000004; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 20 { x: 3; y: 28.2000008; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 21 { x: 3.0999999; y: -10000; skew-x: -0; skew-y: -0; }
        frame 22 { x: -10000; y: 28.5; skew-x: 0; skew-y: 0; }
        frame 23 { x: 3.20000005; y: 28.7999992; skew-x: -10000; skew-y: -10000; }
        frame 24 { x: 3.29999995; y: 29.1000004; }
        frame 25 { x: -10000; y: -10000; }
        frame 26 { x: 3.9000001; y: 28.6000004; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 27 { x: 4.5; y: 28.2000008; skew-x: 1.60000002; skew-y: 1.60000002; }
        frame 28 { x: 5.30000019; y: 27.3999996; skew-x: 2.5; skew-y: 2.5; }
        frame 29 { x: 5.9000001; y: 27; skew-x: 3.29999995; skew-y: 3.29999995; }
        frame 30 { x: 6.80000019; y: 26.2999992; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 31 { x: 7.5; y: 25.8999996; skew-x: 5; skew-y: 5; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 32 { x: 8.39999962; y: 25.2000008; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 9.10000038; y: 24.8999996; skew-x: 6.80000019; skew-y: 6.80000019; }
        frame 34 { x: 10; y: 24.2000008; skew-x: 7.80000019; skew-y: 7.80000019; }
        frame 35 { x: 10.8000002; y: 23.7999992; skew-x: 8.5; skew-y: 8.5; }
        frame 36 { x: 11.5; y: 23.5; skew-x: 9.30000019; skew-y: 9.30000019; }
        frame 37 { x: 12.5; y: 22.7999992; skew-x: 10.3000002; skew-y: 10.3000002; }
        frame 38 { x: 13.3000002; y: 22.5; skew-x: 11.1000004; skew-y: 11.1000004; }
        frame 39 { x: 14.3000002; y: 22; skew-x: 12; skew-y: 12; }
        frame 40 { x: 15.1000004; y: 21.5; skew-x: 12.8000002; skew-y: 12.8000002; }
        frame 41 { x: 16.2000008; y: 20.8999996; skew-x: 13.8000002; skew-y: 13.8000002; }
        frame 42 { x: -13.3999996; y: 44.0999985; skew-x: -29.7000008; skew-y: -29.7000008; scale-x: 0.897000015; scale-y: 0.897000015; image: IMAGE_REANIM_ZOMBIE_CATAPULT_POLE; }
        frame 43 { x: -14.8000002; y: 44.7999992; skew-x: -30.2999992; skew-y: -30.2999992; scale-x: 0.896000028; scale-y: 0.896000028; image: none; }
        frame 44 { x: -16.2000008; y: 45.5; skew-x: -31; skew-y: -31; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: -17.7000008; y: 46.2999992; skew-x: -31.7000008; skew-y: -31.7000008; }
        frame 46 { x: -19.2000008; y: 47.0999985; skew-x: -32.5; skew-y: -32.5; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 47 { x: -18.6000004; y: 49; skew-x: -33.5999985; skew-y: -33.5999985; scale-x: 0.896000028; scale-y: 0.896000028; }
        frame 48 { x: -17.1000004; y: 47; skew-x: -31.5; skew-y: -31.5; scale-x: 0.894999981; scale-y: 0.894999981; }
        frame 49 { x: -15.5; y: 45.2999992; skew-x: -29.7000008; skew-y: -29.7000008; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 50 { x: -13.6999998; y: 41.4000015; skew-x: -23.2000008; skew-y: -23.3999996; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: -10.6999998; y: 37.5; skew-x: -17; skew-y: -17.2000008; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 52 { x: -6.69999981; y: 34; skew-x: -10.6999998; skew-y: -10.8999996; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: -1.60000002; y: 30.7000008; skew-x: -4.4000001; skew-y: -4.69999981; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 54 { x: 4.30000019; y: 27.6000004; skew-x: 1.79999995; skew-y: 1.5; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 55 { x: 3.5; y: 28.5; skew-x: 0.800000012; skew-y: 0.600000024; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 3; y: 29.1000004; skew-x: 0; skew-y: 0; image: IMAGE_REANIM_ZOMBIE_CATAPULT_POLE_WITHBALL; }
        frame 57 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; image: none; }
        frame 58 { y: 29.5; }
        frame 59 { y: 29.8999996; }
        frame 60 { x: 3.79999995; y: 29.1000004; skew-x: 1; skew-y: 1; }
        frame 61 { x: 3; y: -10000; skew-x: 0; skew-y: 0; }
        frame 62 { x: 1.60000002; y: 30.1000004; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 63 { x: 3; y: 29.8999996; skew-x: 0; skew-y: 0; }
        frame 64 { x: 3.79999995; y: 29.1000004; skew-x: 1; skew-y: 1; }
        frame 65 { x: 2.79999995; y: -10000; skew-x: 0; skew-y: 0; }
        frame 66 { x: 1.60000002; y: 30.1000004; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 67 { x: 3; y: 29.8999996; skew-x: 0; skew-y: 0; }
        frame 68 { x: 3.79999995; y: 29.1000004; skew-x: 1; skew-y: 1; }
        frame 69 { x: 3; y: -10000; skew-x: 0; skew-y: 0; }
        frame 70 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 21; y: 8; skew-x: 12; skew-y: 12; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 42.4000015; y: -10.8999996; skew-x: 24.2000008; skew-y: 24.2000008; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 29.3999996; y: -4.30000019; skew-x: 17.1000004; skew-y: 17.1000004; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 74 { x: 17.5; y: 2.79999995; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 6.80000019; y: 11; skew-x: 3; skew-y: 3; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 76 { x: -2.5999999; y: 19.7000008; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -2.4000001; y: 25.6000004; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: -2.29999995; y: 31.3999996; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: -0.5; y: 31.2999992; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 80 { x: 1.10000002; y: 31.3999996; skew-x: 0.899999976; skew-y: 0.699999988; scale-x: 0.916000009; scale-y: 0.879999995; }
        frame 81 { x: 0.899999976; y: 29.7999992; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 82 { x: 0.5; y: 28.2000008; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: 0.699999988; y: 29.7999992; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 0.5; y: 31.7000008; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_basket";
        frame-count: 85;
        frame 0 { x: 72.5999985; y: 77.8000031; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BASKET; }
        frame 1 { x: 72.5; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 72.4000015; y: 78; }
        frame 3 { x: 72.3000031; }
        frame 4 { x: -10000; y: 77.8000031; }
        frame 5 { x: 72.1999969; y: 77.5; }
        frame 6 { x: 72.0999985; y: 77.1999969; }
        frame 7 { x: -10000; y: 76.9000015; }
        frame 8 { x: 72; y: 77.0999985; }
        frame 9 { y: 77.3000031; }
        frame 10 { x: 71.9000015; y: 77.5; }
        frame 11 { x: 71.8000031; y: 77.5999985; }
        frame 12 { x: -10000; y: 77.8000031; }
        frame 13 { x: 72; y: -10000; }
        frame 14 { x: 72.1999969; y: 78; }
        frame 15 { x: 72.3000031; }
        frame 16 { x: 72.0999985; y: 77.6999969; }
        frame 17 { x: 71.8000031; y: 77.3000031; }
        frame 18 { x: 71.5999985; y: 77; }
        frame 19 { x: 71.3000031; y: 76.6999969; }
        frame 20 { x: 71.5; y: 76.9000015; }
        frame 21 { x: 71.5999985; y: 77.0999985; }
        frame 22 { x: 71.8000031; y: 77.3000031; }
        frame 23 { x: 71.9000015; y: 77.5999985; }
        frame 24 { x: 72.0999985; y: 77.8000031; }
        frame 25 { x: -10000; y: -10000; }
        frame 26 { x: 72; }
        frame 27 { x: -10000; }
        frame 28 { x: 72; }
        frame 29 { x: -10000; }
        frame 30 { x: 71.9000015; }
        frame 31 { x: 71.8000031; }
        frame 32 { x: -10000; }
        frame 36 { x: 71.6999969; }
        frame 37 { x: -10000; }
        frame 39 { x: 71.5999985; }
        frame 40 { x: -10000; }
        frame 42 { x: 71.8000031; }
        frame 43 { x: 71; y: 77.0999985; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: 70.1999969; y: 76.5; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: 69.3000031; y: 75.6999969; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: 68.5; y: 75.0999985; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: 69.5999985; y: 76; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 48 { x: 70.6999969; y: 76.8000031; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 49 { x: 71.8000031; y: 77.8000031; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 78.1999969; }
        frame 59 { y: 78.5999985; }
        frame 60 { y: 78.1999969; }
        frame 61 { y: 77.8000031; }
        frame 62 { x: 71.6999969; y: 78.1999969; }
        frame 63 { x: 71.5999985; y: 78.5999985; }
        frame 64 { x: -10000; y: 78.1999969; }
        frame 65 { y: 77.8000031; }
        frame 66 { y: 78.1999969; }
        frame 67 { y: 78.5999985; }
        frame 68 { x: 71.6999969; y: 78.1999969; }
        frame 69 { x: 71.8000031; y: 77.8000031; }
        frame 70 { x: -10000; y: -10000; }
        frame 71 { x: 77.3000031; y: 68.0999985; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 83.1999969; y: 58.2999992; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 79.5; y: 59.4000015; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 76; y: 60.7999992; skew-x: 4; skew-y: 4; }
        frame 75 { x: 72.5; y: 61.9000015; skew-x: 0; skew-y: 0; }
        frame 76 { x: 69.1999969; y: 63.4000015; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 69.4000015; y: 69.3000031; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: 69.5; y: 75.1999969; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: 70.3000031; y: 77.6999969; skew-x: -2.9000001; skew-y: -3.20000005; scale-x: 0.907000005; scale-y: 0.866999984; }
        frame 80 { x: 71; y: 80.3000031; skew-x: -2.20000005; skew-y: -2.5999999; scale-x: 0.916000009; scale-y: 0.836000025; }
        frame 81 { x: 71.1999969; y: 77; skew-x: -10000; skew-y: -2.4000001; scale-x: 0.907000005; scale-y: 0.866999984; }
        frame 82 { x: -10000; y: 73.8000031; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: 71.3000031; y: 75.5; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 71.1999969; y: 77.3000031; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_basketball";
        frame-count: 85;
        frame 0 { x: 76.1999969; y: 76.5; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL; }
        frame 1 { x: -10000; y: 75.8000031; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 76.5; }
        frame 3 { y: 75.8000031; }
        frame 4 { y: 76.5; }
        frame 5 { y: 75.8000031; }
        frame 6 { y: 76.5; }
        frame 7 { y: 75.8000031; }
        frame 8 { y: 76.5; }
        frame 9 { y: 75.8000031; }
        frame 10 { y: 76.5; }
        frame 11 { y: 75.8000031; }
        frame 12 { y: 76.5; }
        frame 13 { y: 75.8000031; }
        frame 14 { y: 76.5; }
        frame 15 { y: 75.8000031; }
        frame 16 { y: 76.5; }
        frame 17 { y: 75.8000031; }
        frame 18 { y: 76.5; }
        frame 19 { y: 75.8000031; }
        frame 20 { y: 76.5; }
        frame 21 { y: 75.8000031; }
        frame 22 { y: 76.5; }
        frame 23 { y: 75.8000031; }
        frame 24 { y: 76.5; }
        frame 25 { y: 75.8000031; }
        frame 26 { y: -10000; }
        frame 27 { y: 75.9000015; }
        frame 28 { y: 76; }
        frame 30 { y: -10000; }
        frame 31 { y: 76.0999985; }
        frame 32 { y: -10000; }
        frame 33 { y: 76.1999969; }
        frame 34 { y: -10000; }
        frame 35 { y: 76.3000031; }
        frame 36 { y: -10000; }
        frame 39 { y: 76.4000015; }
        frame 40 { y: 76.5; }
        frame 41 { y: -10000; }
        frame 43 { x: 75.5999985; y: 75.5999985; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: 74.8000031; y: 74.6999969; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: 74.1999969; y: 73.9000015; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: 73.5; y: 73; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: 73.9000015; y: 72.8000031; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 48 { x: 74.3000031; y: 72.5; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 49 { x: 74.9000015; y: 73.8000031; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 50 { x: 75.5999985; y: 75.0999985; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 51 { x: 76.1999969; y: 76.5; skew-x: 0; skew-y: 0; }
        frame 52 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 76.9000015; }
        frame 59 { y: 77.3000031; }
        frame 60 { y: 76.9000015; }
        frame 61 { y: 76.5; }
        frame 62 { y: -10000; }
        frame 63 { y: 77.3000031; }
        frame 64 { y: 76.9000015; }
        frame 65 { y: 76.5; }
        frame 66 { y: -10000; }
        frame 67 { y: 77.3000031; }
        frame 68 { y: 76.9000015; }
        frame 69 { y: 76.5; }
        frame 70 { y: -10000; }
        frame 71 { x: 81.9000015; y: 67.1999969; skew-x: 6; skew-y: 6; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 72 { x: 87.8000031; y: 58; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 84.1999969; y: 58.9000015; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 80.5999985; y: 59.9000015; skew-x: 4; skew-y: 4; }
        frame 75 { x: 77; y: 60.5999985; skew-x: 0; skew-y: 0; }
        frame 76 { x: 73.5; y: 61.7999992; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 73.6999969; y: 67.6999969; skew-x: -10000; skew-y: -10000; }
        frame 78 { x: 73.8000031; y: 73.5999985; }
        frame 79 { x: 74.6999969; y: 76.9000015; skew-x: -2.9000001; skew-y: -3.20000005; scale-x: 0.805999994; scale-y: 0.763999999; }
        frame 80 { x: 75.5; y: 80.0999985; skew-x: -2.0999999; skew-y: -2.70000005; scale-x: 0.81400001; scale-y: 0.728999972; }
        frame 81 { x: 75.5999985; y: 76.1999969; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.805999994; scale-y: 0.763999999; }
        frame 82 { x: -10000; y: 72.3000031; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 83 { x: 75.6999969; y: 74.1999969; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 75.5999985; y: 75.8000031; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_basketball2";
        frame-count: 85;
        frame 0 { x: 93.6999969; y: 72.6999969; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 72; }
        frame 3 { y: 72.3000031; }
        frame 4 { y: 72.6999969; }
        frame 5 { y: 72.3000031; }
        frame 6 { y: 72; }
        frame 7 { y: 72.6999969; }
        frame 8 { y: 72.3000031; }
        frame 9 { y: 72; }
        frame 10 { y: 72.6999969; }
        frame 11 { y: 72; }
        frame 12 { y: 72.3000031; }
        frame 13 { y: 72.6999969; }
        frame 14 { y: 72; }
        frame 15 { y: 72.3000031; }
        frame 16 { y: 72.6999969; }
        frame 17 { y: 72; }
        frame 18 { y: 72.3000031; }
        frame 19 { y: 72.6999969; }
        frame 20 { y: 72; }
        frame 21 { y: 72.6999969; }
        frame 22 { y: 72; }
        frame 23 { y: 72.6999969; }
        frame 24 { y: -10000; }
        frame 43 { x: 92.8000031; y: 71.5; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: 92; y: 70.5; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: 91.1999969; y: 69.4000015; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: 90.3000031; y: 68.3000031; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: 90.6999969; y: 66.6999969; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 48 { x: 91.1999969; y: 67.6999969; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 49 { x: 91.6999969; y: 68.6999969; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 50 { x: 92.1999969; y: 69.6999969; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 51 { x: 92.6999969; y: 70.5999985; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 52 { x: 93.1999969; y: 71.6999969; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 53 { x: 93.6999969; y: 72.6999969; skew-x: 0; skew-y: 0; }
        frame 54 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 73.0999985; }
        frame 59 { y: 73.5; }
        frame 60 { y: 73.0999985; }
        frame 61 { y: 72.6999969; }
        frame 62 { y: -10000; }
        frame 63 { y: 73.5; }
        frame 64 { y: 73.0999985; }
        frame 65 { y: 72.6999969; }
        frame 66 { y: -10000; }
        frame 67 { y: 73.5; }
        frame 68 { y: 73.0999985; }
        frame 69 { y: 72.6999969; }
        frame 70 { y: -10000; }
        frame 71 { x: 99.5999985; y: 65.3000031; skew-x: 6; skew-y: 6; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 72 { x: 105.699997; y: 58; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 101.800003; y: 57.5; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 98.0999985; y: 57.2999992; skew-x: 4; skew-y: 4; }
        frame 75 { x: 94.3000031; y: 56.9000015; skew-x: 0; skew-y: 0; }
        frame 76 { x: 90.6999969; y: 56.7999992; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 90.8000031; y: 62.5999985; skew-x: -10000; skew-y: -10000; }
        frame 78 { x: 90.9000015; y: 68.5; }
        frame 79 { x: 92; y: 72.1999969; skew-x: -2.9000001; skew-y: -3.20000005; scale-x: 0.805999994; scale-y: 0.763999999; }
        frame 80 { x: 93.0999985; y: 75.8000031; skew-x: -2.0999999; skew-y: -2.70000005; scale-x: 0.81400001; scale-y: 0.728999972; }
        frame 81 { x: -10000; y: 71.8000031; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.805999994; scale-y: 0.763999999; }
        frame 82 { x: 92.8000031; y: 67.8000031; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 83 { x: 92.9000015; y: 69.5; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 92.8000031; y: 71.3000031; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_basketball3";
        frame-count: 85;
        frame 0 { x: 97.8000031; y: 81; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL; }
        frame 1 { x: -10000; y: 80.3000031; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 80.5999985; }
        frame 3 { y: 81; }
        frame 4 { y: 80.3000031; }
        frame 5 { y: 81; }
        frame 6 { y: 80.5999985; }
        frame 7 { y: 81; }
        frame 8 { y: 80.5999985; }
        frame 9 { y: 80.3000031; }
        frame 10 { y: 81; }
        frame 11 { y: 80.3000031; }
        frame 12 { y: 80.5999985; }
        frame 13 { y: 81; }
        frame 14 { y: 80.5999985; }
        frame 15 { y: 81; }
        frame 16 { y: 80.3000031; }
        frame 17 { y: 80.5999985; }
        frame 18 { y: 81; }
        frame 19 { y: 80.3000031; }
        frame 20 { y: 81; }
        frame 21 { y: 80.3000031; }
        frame 22 { y: 80.5999985; }
        frame 23 { y: 81; }
        frame 24 { y: -10000; }
        frame 43 { x: 97.1999969; y: 79.8000031; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: 96.5999985; y: 78.8000031; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: 96; y: 77.6999969; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: 95.1999969; y: 76.5999985; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: 95.6999969; y: 76.3000031; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 48 { x: 96.0999985; y: 76; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 49 { x: 96.9000015; y: 78.4000015; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 50 { x: 97.8000031; y: 81; skew-x: 0; skew-y: 0; }
        frame 51 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 81.3000031; }
        frame 59 { y: 81.8000031; }
        frame 60 { y: 81.3000031; }
        frame 61 { y: 81; }
        frame 62 { y: 80.5999985; }
        frame 63 { y: 81.8000031; }
        frame 64 { y: 81.3000031; }
        frame 65 { y: 81; }
        frame 66 { y: 80.5999985; }
        frame 67 { y: 81.8000031; }
        frame 68 { y: 81.3000031; }
        frame 69 { y: 81; }
        frame 70 { y: -10000; }
        frame 71 { x: 102.800003; y: 73.9000015; skew-x: 6; skew-y: 6; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 72 { x: 108; y: 67; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 104.800003; y: 66.3000031; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 101.699997; y: 65.8000031; skew-x: 4; skew-y: 4; }
        frame 75 { x: 98.5; y: 65.1999969; skew-x: 0; skew-y: 0; }
        frame 76 { x: 95.3000031; y: 64.8000031; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 95.5; y: 70.6999969; skew-x: -10000; skew-y: -10000; }
        frame 78 { x: 95.5999985; y: 76.5; }
        frame 79 { x: 96.6999969; y: 79.9000015; skew-x: -2.9000001; skew-y: -3.20000005; scale-x: 0.805999994; scale-y: 0.763999999; }
        frame 80 { x: 97.5999985; y: 83.3000031; skew-x: -2.0999999; skew-y: -2.70000005; scale-x: 0.81400001; scale-y: 0.728999972; }
        frame 81 { x: 97.5; y: 79.5999985; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.805999994; scale-y: 0.763999999; }
        frame 82 { x: 97.3000031; y: 75.9000015; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 83 { x: -10000; y: 77.6999969; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 79.4000015; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_basketball4";
        frame-count: 85;
        frame 0 { x: 82.0999985; y: 85; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 84.3000031; }
        frame 3 { y: 84.5999985; }
        frame 4 { y: 85; }
        frame 5 { y: -10000; }
        frame 6 { y: 84.5999985; }
        frame 7 { y: 84.3000031; }
        frame 8 { y: 85; }
        frame 9 { y: 84.3000031; }
        frame 10 { y: 85; }
        frame 11 { y: 84.3000031; }
        frame 12 { y: 85; }
        frame 13 { y: 84.5999985; }
        frame 14 { y: 84.3000031; }
        frame 15 { y: 85; }
        frame 16 { y: 84.5999985; }
        frame 17 { y: 85; }
        frame 18 { y: -10000; }
        frame 19 { y: 84.3000031; }
        frame 20 { y: 84.5999985; }
        frame 21 { y: 85; }
        frame 22 { y: 84.5999985; }
        frame 23 { y: 85; }
        frame 24 { y: -10000; }
        frame 43 { x: 81.5; y: 84.1999969; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: 80.9000015; y: 83.5; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: 80.3000031; y: 82.8000031; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: 79.6999969; y: 82.1999969; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: 80.5; y: 80.5; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 48 { x: 80.8000031; y: 81.3000031; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 49 { x: 81.0999985; y: 82.3000031; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 50 { x: 81.4000015; y: 83.0999985; skew-x: -0.5; skew-y: -0.5; }
        frame 51 { x: 81.6999969; y: 84.0999985; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 52 { x: 82.0999985; y: 85; skew-x: 0; skew-y: 0; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 85.3000031; }
        frame 59 { y: 85.8000031; }
        frame 60 { y: 85.3000031; }
        frame 61 { y: 85; }
        frame 62 { y: 84.3000031; }
        frame 63 { y: 85.8000031; }
        frame 64 { y: 85.3000031; }
        frame 65 { y: 85; }
        frame 66 { y: 84.3000031; }
        frame 67 { y: 85.8000031; }
        frame 68 { y: 85.3000031; }
        frame 69 { y: 85; }
        frame 70 { y: -10000; }
        frame 71 { x: 86.8000031; y: 76.1999969; skew-x: 6; skew-y: 6; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 72 { x: 91.8000031; y: 67.5999985; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 88.8000031; y: 68.1999969; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 85.8000031; y: 68.5999985; skew-x: 4; skew-y: 4; }
        frame 75 { x: 82.8000031; y: 69.1999969; skew-x: 0; skew-y: 0; }
        frame 76 { x: 80; y: 69.8000031; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 80.0999985; y: 75.8000031; skew-x: -10000; skew-y: -10000; }
        frame 78 { x: 80.1999969; y: 81.5999985; }
        frame 79 { x: 81.0999985; y: 84.5999985; skew-x: -2.9000001; skew-y: -3.20000005; scale-x: 0.805999994; scale-y: 0.763999999; }
        frame 80 { x: 81.8000031; y: 87.5999985; skew-x: -2.0999999; skew-y: -2.70000005; scale-x: 0.81400001; scale-y: 0.728999972; }
        frame 81 { x: -10000; y: 84.0999985; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.805999994; scale-y: 0.763999999; }
        frame 82 { y: 80.5999985; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 83 { y: 82.3000031; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 84.0999985; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_basket_overlay";
        frame-count: 85;
        frame 0 { x: 72.5; y: 79.5999985; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BASKET_OVERLAY; }
        frame 1 { x: 72.4000015; y: 79.8000031; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 72.3000031; y: -10000; }
        frame 3 { x: -10000; y: 80; }
        frame 4 { x: 72.1999969; y: 79.6999969; }
        frame 5 { x: -10000; y: 79.3000031; }
        frame 6 { x: 72.0999985; y: 79.0999985; }
        frame 7 { x: 72; y: 78.6999969; }
        frame 8 { y: 78.9000015; }
        frame 9 { x: 71.9000015; y: 79.0999985; }
        frame 10 { x: 71.8000031; y: 79.3000031; }
        frame 11 { x: -10000; y: 79.4000015; }
        frame 12 { y: 79.5999985; }
        frame 13 { x: 71.9000015; y: 79.8000031; }
        frame 14 { x: 72.0999985; y: -10000; }
        frame 15 { x: 72.3000031; y: 80; }
        frame 16 { x: 72; y: 79.5999985; }
        frame 17 { x: 71.8000031; y: 79.3000031; }
        frame 18 { x: 71.5; y: 78.8000031; }
        frame 19 { x: 71.3000031; y: 78.5; }
        frame 20 { x: 71.4000015; y: 78.6999969; }
        frame 21 { x: 71.5999985; y: 78.9000015; }
        frame 22 { x: 71.6999969; y: 79.1999969; }
        frame 23 { x: 71.8000031; y: 79.3000031; }
        frame 24 { x: 72; y: 79.5999985; }
        frame 25 { x: -10000; y: -10000; }
        frame 26 { x: 72; }
        frame 27 { x: -10000; }
        frame 28 { x: 71.9000015; }
        frame 29 { x: -10000; }
        frame 30 { x: 71.8000031; }
        frame 31 { x: -10000; }
        frame 34 { x: 71.6999969; }
        frame 35 { x: -10000; }
        frame 38 { x: 71.5999985; }
        frame 39 { x: -10000; }
        frame 41 { x: 71.5; }
        frame 42 { x: 71.8000031; }
        frame 43 { x: 71; y: 78.8000031; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: 70.0999985; y: 78; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: 69.3000031; y: 77.0999985; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: 68.5; y: 76.3000031; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: 69.5999985; y: 77.4000015; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 48 { x: 70.8000031; y: 78.5; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 49 { x: 71.8000031; y: 79.5999985; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 80; }
        frame 59 { y: 80.4000015; }
        frame 60 { y: 80; }
        frame 61 { y: 79.5999985; }
        frame 62 { x: 71.6999969; y: 80; }
        frame 63 { x: 71.5; y: 80.4000015; }
        frame 64 { x: -10000; y: 80; }
        frame 65 { y: 79.5999985; }
        frame 66 { y: 80; }
        frame 67 { y: 80.4000015; }
        frame 68 { x: 71.6999969; y: 80; }
        frame 69 { x: 71.8000031; y: 79.5999985; }
        frame 70 { x: -10000; y: -10000; }
        frame 71 { x: 77.1999969; y: 69.8000031; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 82.8000031; y: 60.0999985; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 79.3000031; y: 61.2000008; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 75.8000031; y: 62.5; skew-x: 4; skew-y: 4; }
        frame 75 { x: 72.5; y: 63.7999992; skew-x: 0; skew-y: 0; }
        frame 76 { x: 69.3000031; y: 65.3000031; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 69.4000015; y: 71.1999969; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: 69.5; y: 77; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: 70.3000031; y: 79.4000015; skew-x: -2.9000001; skew-y: -3.20000005; scale-x: 0.907000005; scale-y: 0.866999984; }
        frame 80 { x: 71; y: 82.0999985; skew-x: -2.20000005; skew-y: -2.5999999; scale-x: 0.916000009; scale-y: 0.836000025; }
        frame 81 { x: 71.1999969; y: 78.8000031; skew-x: -10000; skew-y: -2.4000001; scale-x: 0.907000005; scale-y: 0.866999984; }
        frame 82 { x: -10000; y: 75.6999969; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: 71.3000031; y: 77.3000031; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 71.1999969; y: 79.1999969; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "LawnMower_wheelpiece";
        frame-count: 85;
        frame 0 { x: 48.9000015; y: 110.199997; skew-x: 180; image: IMAGE_REANIM_LAWNMOWER_WHEELPIECE; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; image: none; }
        frame 2 { y: 110.099998; }
        frame 3 { y: -10000; }
        frame 4 { y: 110; }
        frame 5 { y: 109.900002; }
        frame 6 { y: 109.800003; }
        frame 7 { y: -10000; }
        frame 9 { y: 109.699997; }
        frame 10 { y: -10000; }
        frame 11 { y: 109.599998; }
        frame 12 { y: -10000; }
        frame 13 { y: 109.5; }
        frame 14 { y: 109.400002; }
        frame 15 { y: 109.300003; }
        frame 16 { y: -10000; }
        frame 18 { y: 109.199997; }
        frame 19 { y: 109.300003; }
        frame 20 { y: -10000; }
        frame 21 { y: 109.5; }
        frame 22 { y: 109.599998; }
        frame 23 { y: -10000; }
        frame 24 { y: 109.699997; }
        frame 25 { y: -10000; }
        frame 71 { x: 51.5; y: 97; skew-x: 186; skew-y: 6; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 72 { x: 54.0999985; y: 84.5999985; skew-x: 192.399994; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 52.9000015; y: 87.5999985; skew-x: 188.300003; skew-y: 8.30000019; }
        frame 74 { x: 51.5999985; y: 90.6999969; skew-x: 184; skew-y: 4; }
        frame 75 { x: 50.2000008; y: 93.6999969; skew-x: 180; skew-y: 0; }
        frame 76 { x: 48.5999985; y: 96.8000031; skew-x: 176; skew-y: -3.9000001; }
        frame 77 { x: 48.9000015; y: 102.699997; skew-x: -10000; skew-y: -10000; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 78 { x: -10000; y: 108.599998; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 79 { x: 49.7999992; y: 110.300003; skew-x: 176.899994; skew-y: -3.20000005; scale-x: 1.05400002; scale-y: 0.968999982; }
        frame 80 { x: 50.5; y: 111.800003; skew-x: 177.600006; skew-y: -2.5; scale-x: 1.10899997; scale-y: 0.939999998; }
        frame 81 { x: 50.0999985; y: 109.300003; skew-x: 177.699997; skew-y: -2.4000001; scale-x: 1.05400002; scale-y: 0.968999982; }
        frame 82 { x: 49.9000015; y: 106.699997; skew-x: 177.5; skew-y: -10000; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 83 { x: -10000; y: 108.599998; skew-x: 177.699997; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 110.199997; skew-x: 177.5; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_outerwheel_front1";
        frame-count: 85;
        frame 0 { x: 24.5; y: 113.300003; image: IMAGE_REANIM_LAWNMOWER_WHEEL2; }
        frame 1 { x: 21.8999996; y: 116.5; skew-x: -12.6999998; skew-y: -12.6999998; scale-x: 0.999000013; scale-y: 0.999000013; image: none; }
        frame 2 { x: 20.1000004; y: 120.300003; skew-x: -25.5; skew-y: -25.5; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 19.2999992; y: 124.300003; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 4 { x: -10000; y: 128.399994; skew-x: -51.2999992; skew-y: -51.2999992; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 20.2000008; y: 132.399994; skew-x: -64.3000031; skew-y: -64.3000031; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 6 { x: 21.8999996; y: 136; skew-x: -77.0999985; skew-y: -77.0999985; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 24.5; y: 139.300003; skew-x: -89.9000015; skew-y: -89.9000015; scale-x: 1; scale-y: 1; }
        frame 8 { x: 28.2999992; y: 142.300003; skew-x: -104.900002; skew-y: -104.900002; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 9 { x: 32.5999985; y: 144.199997; skew-x: -119.800003; skew-y: -119.800003; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 37.4000015; y: 145; skew-x: -134.899994; skew-y: -134.899994; scale-x: 1; scale-y: 1; }
        frame 11 { x: 42.0999985; y: 144.600006; skew-x: -150; skew-y: -150; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 12 { x: 46.5; y: 142.800003; skew-x: -164.899994; skew-y: -164.899994; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 50.4000015; y: 140.100006; skew-x: -179.899994; skew-y: -179.899994; scale-x: 1; scale-y: 1; }
        frame 14 { x: 53.2999992; y: 136.100006; skew-x: -194.899994; skew-y: -194.899994; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 15 { x: 55; y: 131.699997; skew-x: -209.800003; skew-y: -209.800003; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 55.7999992; y: 126.800003; skew-x: -224.899994; skew-y: -224.899994; scale-x: 1; scale-y: 1; }
        frame 17 { x: 55.0999985; y: 121.800003; skew-x: -240; skew-y: -240; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 18 { x: 53.2999992; y: 117.300003; skew-x: -254.899994; skew-y: -254.899994; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 50.4000015; y: 113.300003; skew-x: -269.899994; skew-y: -269.899994; scale-x: 1; scale-y: 1; }
        frame 20 { x: 45.7999992; y: 110.099998; skew-x: -287.700012; skew-y: -287.700012; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 21 { x: 40.2999992; y: 108.300003; skew-x: -305.799988; skew-y: -305.799988; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 22 { x: 34.5; y: 108.199997; skew-x: -324; skew-y: -324; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 29.1000004; y: 110; skew-x: -342.100006; skew-y: -342.100006; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 24 { x: 24.5; y: 113.300003; skew-x: -359.899994; skew-y: -359.899994; scale-x: 1; scale-y: 1; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 24.3999996; }
        frame 44 { x: -10000; }
        frame 45 { x: 24.2999992; }
        frame 46 { x: -10000; }
        frame 48 { x: 24.3999996; }
        frame 49 { x: 24.5; }
        frame 50 { x: -10000; }
        frame 71 { x: 26.7999992; y: 98.0999985; skew-x: -353.899994; skew-y: -353.899994; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 72 { x: 29.5; y: 83; skew-x: -347.5; skew-y: -347.5; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 28.2999992; y: 87.6999969; skew-x: -351.600006; skew-y: -351.600006; }
        frame 74 { x: 26.8999996; y: 92.5; skew-x: -355.899994; skew-y: -355.899994; }
        frame 75 { x: 25.7999992; y: 97.3000031; skew-x: -359.899994; skew-y: -359.899994; }
        frame 76 { x: 24.7000008; y: 102.199997; skew-x: -363.899994; skew-y: -363.899994; }
        frame 77 { x: 25.2999992; y: 107.599998; skew-x: -361.700012; skew-y: -361.700012; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 78 { x: 25.7999992; y: 113; skew-x: -359.600006; skew-y: -359.600006; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 24.7999992; y: 114.199997; skew-x: -359.100006; skew-y: -358.899994; scale-x: 1.07500005; scale-y: 0.967000008; }
        frame 80 { x: 23.8999996; y: 115.300003; skew-x: -358.299988; skew-y: -358; scale-x: 1.15199995; scale-y: 0.93599999; }
        frame 81 { x: 25.2000008; y: 113.099998; skew-x: -358.399994; skew-y: -358.100006; scale-x: 1.07500005; scale-y: 0.967000008; }
        frame 82 { x: 26.6000004; y: 110.5; skew-x: -358.100006; skew-y: -10000; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 83 { x: -10000; y: 112.300003; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 114; }
    }
    Track {
        source-name: "Zombie_catapult_siding";
        frame-count: 85;
        frame 0 { x: -9.19999981; y: 84.3000031; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_SIDING; }
        frame 1 { x: -9.60000038; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -10; y: 84.1999969; }
        frame 3 { x: -10.3999996; y: 84.0999985; }
        frame 4 { x: -10.1000004; y: 83.5999985; }
        frame 5 { x: -9.89999962; y: 83; }
        frame 6 { x: -9.60000038; y: 82.4000015; }
        frame 7 { x: -10000; y: 82.5999985; }
        frame 8 { y: 82.8000031; }
        frame 9 { y: 82.9000015; }
        frame 10 { x: -9.5; y: 83.5; }
        frame 11 { x: -10000; y: 84.0999985; }
        frame 12 { x: -9.39999962; y: 84.5999985; }
        frame 13 { x: -9.5; y: 84.5; }
        frame 14 { x: -10000; y: 84.3000031; }
        frame 15 { x: -9.60000038; y: 84.0999985; }
        frame 16 { x: -9.5; y: 83.5999985; }
        frame 17 { x: -10000; y: 83; }
        frame 18 { x: -9.39999962; y: 82.4000015; }
        frame 19 { x: -9.5; y: 82.5999985; }
        frame 20 { x: -9.69999981; y: 82.8000031; }
        frame 21 { x: -9.89999962; y: 82.9000015; }
        frame 22 { x: -9.69999981; y: 83.5; }
        frame 23 { x: -9.5; y: 84.0999985; }
        frame 24 { x: -9.39999962; y: 84.5999985; }
        frame 25 { x: -10000; y: -10000; }
        frame 30 { x: -9.5; }
        frame 31 { x: -10000; }
        frame 37 { x: -9.60000038; }
        frame 38 { x: -10000; }
        frame 43 { y: 85.3000031; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: -9.5; y: 86; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: -9.60000038; y: 86.6999969; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: -10000; y: 87.3000031; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: -9.89999962; y: 87.1999969; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 48 { x: -9.5; y: 85.8000031; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 49 { x: -9.10000038; y: 84.5999985; skew-x: 0; skew-y: 0; }
        frame 50 { x: -9; y: 84.1999969; skew-x: -10000; skew-y: -10000; }
        frame 51 { x: -8.89999962; y: 83.8000031; }
        frame 52 { x: -9; y: 84.0999985; }
        frame 53 { x: -9.19999981; y: 84.3000031; }
        frame 54 { x: -9.39999962; y: 84.5999985; }
        frame 55 { x: -10000; y: -10000; }
        frame 58 { y: 85; }
        frame 59 { y: 85.4000015; }
        frame 60 { x: -9.19999981; y: 85; }
        frame 61 { x: -9.10000038; y: 84.5999985; }
        frame 62 { x: -9.19999981; y: 85; }
        frame 63 { x: -9.39999962; y: 85.4000015; }
        frame 64 { x: -10000; y: 85; }
        frame 65 { y: 84.5999985; }
        frame 66 { y: 85; }
        frame 67 { y: 85.4000015; }
        frame 68 { y: 85; }
        frame 69 { y: 84.5999985; }
        frame 70 { y: -10000; }
        frame 71 { x: -3.5; y: 66; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 2.4000001; y: 47.5; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: -1; y: 54.5; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: -4.5; y: 61.5; skew-x: 4; skew-y: 4; }
        frame 75 { x: -7.80000019; y: 68.6999969; skew-x: 0; skew-y: 0; }
        frame 76 { x: -11.1000004; y: 75.9000015; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: -10.8999996; y: 81.8000031; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: -10000; y: 87.6999969; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { y: 89; skew-x: -3; skew-y: -3.20000005; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 80 { x: -11.1000004; y: 90.3000031; skew-x: -2.29999995; skew-y: -2.5; scale-x: 0.916000009; scale-y: 0.879999995; }
        frame 81 { x: -10.1999998; y: 87.1999969; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 82 { x: -9.39999962; y: 84.1999969; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: -9.30000019; y: 85.9000015; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: -9.39999962; y: 87.6999969; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_body_overlays";
        frame-count: 85;
        frame 0 { x: 81; y: 105.5; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BODY_OVERLAY1; }
        frame 1 { x: -10000; y: 105.300003; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 105; }
        frame 3 { x: 81; y: 104.800003; }
        frame 4 { x: -10000; y: 104.599998; }
        frame 5 { y: 104.300003; }
        frame 6 { y: 104.199997; }
        frame 7 { y: 104.300003; }
        frame 8 { y: 104.599998; }
        frame 9 { y: 104.800003; }
        frame 10 { y: 105; }
        frame 11 { y: 105.199997; }
        frame 12 { y: 105.300003; }
        frame 13 { y: 105.199997; }
        frame 14 { y: 105; }
        frame 15 { y: 104.800003; }
        frame 16 { y: 104.599998; }
        frame 17 { y: 104.300003; }
        frame 18 { y: 104.199997; }
        frame 19 { y: 104.300003; }
        frame 20 { y: 104.599998; }
        frame 21 { y: 104.800003; }
        frame 22 { y: 105; }
        frame 23 { y: 105.199997; }
        frame 24 { y: 105.300003; }
        frame 25 { y: -10000; }
        frame 43 { x: 80.5999985; y: 104.800003; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: 80.1999969; y: 104.099998; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: 79.8000031; y: 103.400002; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: 79.5; y: 102.900002; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: 80.0999985; y: 103.699997; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 48 { x: 80.5; y: 104.599998; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 49 { x: 81; y: 105.300003; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 105.800003; }
        frame 59 { y: 106.199997; }
        frame 60 { y: 105.800003; }
        frame 61 { y: 105.300003; }
        frame 62 { y: 105.800003; }
        frame 63 { y: 106.199997; }
        frame 64 { y: 105.800003; }
        frame 65 { y: 105.300003; }
        frame 66 { y: 105.800003; }
        frame 67 { y: 106.199997; }
        frame 68 { y: 105.800003; }
        frame 69 { y: 105.300003; }
        frame 70 { y: -10000; }
        frame 71 { x: 83.8000031; y: 96.4000015; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 86.4000015; y: 87.1999969; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 85; y: 88; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 83.5; y: 88.8000031; skew-x: 4; skew-y: 4; }
        frame 75 { x: 81.9000015; y: 89.5; skew-x: 0; skew-y: 0; }
        frame 76 { x: 80.3000031; y: 90.1999969; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 80.5; y: 96.1999969; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: 80.5999985; y: 102; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: 81.0999985; y: 103.599998; skew-x: -3; skew-y: -3.20000005; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 80 { x: 81.6999969; y: 105.300003; skew-x: -2.29999995; skew-y: -2.5; scale-x: 0.916000009; scale-y: 0.879999995; }
        frame 81 { x: -10000; y: 103.099998; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 82 { y: 101; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { y: 102.800003; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 104.5; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_body_overlays2";
        frame-count: 85;
        frame 0 { x: 27.2000008; y: 69.3000031; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BODY_OVERLAY2; }
        frame 1 { x: -10000; y: 69.1999969; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 68.9000015; }
        frame 3 { x: 27.2999992; y: 68.6999969; }
        frame 4 { x: -10000; y: 68.5; }
        frame 5 { y: 68.3000031; }
        frame 6 { y: 68.0999985; }
        frame 7 { y: 68.3000031; }
        frame 8 { y: 68.5; }
        frame 9 { y: 68.6999969; }
        frame 10 { y: 68.8000031; }
        frame 11 { y: 69.0999985; }
        frame 12 { y: 69.3000031; }
        frame 13 { y: 69.0999985; }
        frame 14 { y: 68.8000031; }
        frame 15 { y: 68.6999969; }
        frame 16 { y: 68.5; }
        frame 17 { y: 68.3000031; }
        frame 18 { y: 68.0999985; }
        frame 19 { y: 68.3000031; }
        frame 20 { y: 68.5; }
        frame 21 { y: 68.6999969; }
        frame 22 { y: 68.8000031; }
        frame 23 { y: 69.0999985; }
        frame 24 { y: 69.3000031; }
        frame 25 { y: -10000; }
        frame 43 { x: 26.5; y: 69.1999969; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: 25.7000008; y: 69.3000031; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: 24.8999996; y: -10000; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: 24.1000004; y: 69.4000015; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: 25.2000008; y: 69.3000031; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 48 { x: 26.2999992; y: 69.1999969; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 49 { x: 27.2999992; y: 69.3000031; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 69.6999969; }
        frame 59 { y: 70.0999985; }
        frame 60 { y: 69.6999969; }
        frame 61 { y: 69.3000031; }
        frame 62 { y: 69.6999969; }
        frame 63 { y: 70.0999985; }
        frame 64 { y: 69.6999969; }
        frame 65 { y: 69.3000031; }
        frame 66 { y: 69.6999969; }
        frame 67 { y: 70.0999985; }
        frame 68 { y: 69.6999969; }
        frame 69 { y: 69.3000031; }
        frame 70 { y: -10000; }
        frame 71 { x: 34.0999985; y: 54.9000015; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 41.5999985; y: 40.5; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 37; y: 44.5999985; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 32.5; y: 49; skew-x: 4; skew-y: 4; }
        frame 75 { x: 28.2000008; y: 53.5; skew-x: 0; skew-y: 0; }
        frame 76 { x: 24.2999992; y: 58; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 24.5; y: 64; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: -10000; y: 69.8000031; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: 25; y: 70.8000031; skew-x: -3; skew-y: -3.20000005; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 80 { x: 25.3999996; y: 72.3000031; skew-x: -2.29999995; skew-y: -2.5; scale-x: 0.916000009; scale-y: 0.879999995; }
        frame 81 { x: 26; y: 69.5999985; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 82 { x: 26.5; y: 67.1999969; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: 26.6000004; y: 68.8000031; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 26.5; y: 70.6999969; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_engine";
        frame-count: 85;
        frame 0 { x: 44.0999985; y: 76.3000031; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_ENGINE; }
        frame 1 { x: -10000; y: 75.6999969; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 75.0999985; }
        frame 3 { y: 75.5; }
        frame 4 { y: 75.9000015; }
        frame 5 { y: 75.5; }
        frame 6 { y: 75.0999985; }
        frame 7 { y: 75.8000031; }
        frame 8 { y: 76.5; }
        frame 9 { y: 76; }
        frame 10 { y: 75.4000015; }
        frame 11 { y: 75.8000031; }
        frame 12 { y: 76.3000031; }
        frame 13 { y: 76; }
        frame 14 { y: 75.6999969; }
        frame 15 { y: 76.3000031; }
        frame 16 { y: 76.8000031; }
        frame 17 { y: 76.5999985; }
        frame 18 { y: 76.3000031; }
        frame 19 { y: 75.5999985; }
        frame 20 { y: 74.9000015; }
        frame 21 { y: 75.8000031; }
        frame 22 { y: 76.5999985; }
        frame 23 { y: 76.5; }
        frame 24 { y: 76.3000031; }
        frame 25 { y: -10000; }
        frame 26 { y: 76.5999985; }
        frame 27 { y: 76.9000015; }
        frame 28 { y: 76.5999985; }
        frame 29 { y: 76.3000031; }
        frame 30 { y: 76.5999985; }
        frame 31 { y: 76.9000015; }
        frame 32 { y: 76.5999985; }
        frame 33 { y: 76.3000031; }
        frame 34 { y: 76.5999985; }
        frame 35 { y: 76.9000015; }
        frame 36 { y: 76.5999985; }
        frame 37 { y: 76.3000031; }
        frame 38 { y: 76.5999985; }
        frame 39 { y: 76.9000015; }
        frame 40 { y: 76.5999985; }
        frame 41 { y: 76.3000031; }
        frame 42 { y: -10000; }
        frame 43 { x: 43.4000015; y: 76.1999969; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 44 { x: 42.7999992; y: 76; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 45 { x: 42; y: 75.8000031; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 46 { x: 41.2999992; y: -10000; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 47 { x: 42.2999992; y: 76; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 48 { x: 43.0999985; y: 76.0999985; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 49 { x: 44.0999985; y: 76.3000031; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: 76.5999985; skew-x: -10000; skew-y: -10000; }
        frame 51 { y: 76.9000015; }
        frame 52 { y: 76.5999985; }
        frame 53 { y: 76.3000031; }
        frame 54 { y: 76.5999985; }
        frame 55 { y: 76.9000015; }
        frame 56 { y: 76.3000031; }
        frame 57 { y: -10000; }
        frame 58 { y: 76.5999985; }
        frame 59 { y: 76.9000015; }
        frame 60 { y: 76.5999985; }
        frame 61 { y: 76.3000031; }
        frame 62 { y: 76.5999985; }
        frame 63 { y: 76.9000015; }
        frame 64 { y: 76.5999985; }
        frame 65 { y: 76.3000031; }
        frame 66 { y: 76.5999985; }
        frame 67 { y: 76.9000015; }
        frame 68 { y: -10000; }
        frame 71 { x: 50; y: 64.1999969; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 56.4000015; y: 51.5; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 52.5999985; y: 54.5999985; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 48.9000015; y: 57.7000008; skew-x: 4; skew-y: 4; }
        frame 75 { x: 45.2000008; y: 61; skew-x: 0; skew-y: 0; }
        frame 76 { x: 41.5999985; y: 64.5; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 41.7999992; y: 70.5; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: 41.9000015; y: 76.3000031; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: 42.4000015; y: 77.6999969; skew-x: -3; skew-y: -3.20000005; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 80 { x: 42.9000015; y: 79.0999985; skew-x: -2.29999995; skew-y: -2.5; scale-x: 0.916000009; scale-y: 0.879999995; }
        frame 81 { x: 43.2000008; y: 76.5999985; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 82 { x: 43.5999985; y: 74.1999969; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: -10000; y: 76; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 77.6999969; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_manhole";
        frame-count: 85;
        frame 0 { x: 92.8000031; y: 96.4000015; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_MANHOLE; }
        frame 1 { x: -10000; y: 96.3000031; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: -10000; }
        frame 4 { y: 96.1999969; }
        frame 5 { y: -10000; }
        frame 6 { y: 96.0999985; }
        frame 7 { y: -10000; }
        frame 8 { y: 96; }
        frame 10 { y: 95.9000015; }
        frame 11 { y: 95.8000031; }
        frame 12 { y: -10000; }
        frame 14 { y: 95.9000015; }
        frame 15 { y: 96; }
        frame 17 { y: 96.0999985; }
        frame 18 { y: -10000; }
        frame 19 { y: 96.1999969; }
        frame 20 { y: -10000; }
        frame 21 { y: 96.3000031; }
        frame 22 { y: -10000; }
        frame 24 { y: 96.4000015; }
        frame 25 { y: -10000; }
        frame 43 { x: 92.5; y: 95.6999969; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 44 { x: 92; y: 95; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 45 { x: 91.5999985; y: 94.4000015; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 46 { x: 91.0999985; y: 93.6999969; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 47 { x: 91.6999969; y: 94.5999985; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 48 { x: 92.1999969; y: 95.4000015; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 49 { x: 92.8000031; y: 96.4000015; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 96.1999969; y: 88.6999969; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 99.8000031; y: 81; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 97.5; y: 80.8000031; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 95.4000015; y: 80.5999985; skew-x: 4; skew-y: 4; }
        frame 75 { x: 93.3000031; y: 80.5; skew-x: 0; skew-y: 0; }
        frame 76 { x: 91.5; y: -10000; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 91.5999985; y: 86.3000031; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: 91.6999969; y: 92.1999969; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: 92.5999985; y: 94; skew-x: -3; skew-y: -3.20000005; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 80 { x: 93.3000031; y: 95.9000015; skew-x: -2.29999995; skew-y: -2.5; scale-x: 0.916000009; scale-y: 0.879999995; }
        frame 81 { x: 93.1999969; y: 93.6999969; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 82 { x: 93.0999985; y: 91.5; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: -10000; y: 93.1999969; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 95; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
    Track {
        source-name: "Zombie_catapult_manhole_overlay";
        frame-count: 85;
        frame 0 { x: 96.3000031; y: 98.1999969; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_MANHOLE_OVERLAY; }
        frame 1 { x: 91.5; y: 104.599998; skew-x: -14.8999996; skew-y: -14.8999996; scale-x: 0.898999989; scale-y: 0.898999989; image: none; }
        frame 2 { x: 88.3000031; y: 112; skew-x: -29.7999992; skew-y: -29.7999992; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 87.3000031; y: 120.099998; skew-x: -44.9000015; skew-y: -44.9000015; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 4 { x: 88.4000015; y: 128.300003; skew-x: -60; skew-y: -60; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 5 { x: 91.5; y: 135.600006; skew-x: -74.9000015; skew-y: -74.9000015; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 96.3000031; y: 142.100006; skew-x: -89.9000015; skew-y: -89.9000015; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 7 { x: 102.800003; y: 146.899994; skew-x: -104.900002; skew-y: -104.900002; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 8 { x: 110.199997; y: 149.899994; skew-x: -119.800003; skew-y: -119.800003; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 118.300003; y: 151; skew-x: -134.899994; skew-y: -134.899994; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 10 { x: 126.5; y: 149.899994; skew-x: -150; skew-y: -150; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 11 { x: 133.800003; y: 146.600006; skew-x: -164.899994; skew-y: -164.899994; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 140.300003; y: 141.699997; skew-x: -179.899994; skew-y: -179.899994; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 13 { x: 145.199997; y: 135.300003; skew-x: -194.899994; skew-y: -194.899994; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 14 { x: 148.300003; y: 128; skew-x: -209.800003; skew-y: -209.800003; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 149.300003; y: 119.900002; skew-x: -224.899994; skew-y: -224.899994; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 16 { x: 148.300003; y: 111.800003; skew-x: -240; skew-y: -240; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 17 { x: 145.199997; y: 104.5; skew-x: -254.899994; skew-y: -254.899994; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 140.300003; y: 98.1999969; skew-x: -269.899994; skew-y: -269.899994; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 19 { x: 133.800003; y: 93.3000031; skew-x: -284.899994; skew-y: -284.899994; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 20 { x: 126.5; y: 90.1999969; skew-x: -299.799988; skew-y: -299.799988; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 118.300003; y: 89.0999985; skew-x: -314.899994; skew-y: -314.899994; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 22 { x: 110.300003; y: 90.1999969; skew-x: -330; skew-y: -330; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 23 { x: 102.800003; y: 93.1999969; skew-x: -344.899994; skew-y: -344.899994; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 96.3000031; y: 98.1999969; skew-x: -359.899994; skew-y: -359.899994; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 96; y: 97.4000015; skew-x: -360.399994; skew-y: -360.399994; }
        frame 44 { x: 95.5; y: 96.6999969; skew-x: -361.200012; skew-y: -361.200012; }
        frame 45 { x: 95.0999985; y: 96.0999985; skew-x: -361.899994; skew-y: -361.899994; }
        frame 46 { x: 94.6999969; y: 95.3000031; skew-x: -362.700012; skew-y: -362.700012; }
        frame 47 { x: 95.3000031; y: 96.1999969; skew-x: -361.700012; skew-y: -361.700012; }
        frame 48 { x: 95.8000031; y: 97.1999969; skew-x: -360.700012; skew-y: -360.700012; }
        frame 49 { x: 96.3000031; y: 98.1999969; skew-x: -359.899994; skew-y: -359.899994; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 99.5; y: 90.6999969; skew-x: -353.899994; skew-y: -353.899994; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 102.900002; y: 83.5; skew-x: -347.5; skew-y: -347.5; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 101; y: 83; skew-x: -351.600006; skew-y: -351.600006; }
        frame 74 { x: 98.9000015; y: 82.5999985; skew-x: -355.899994; skew-y: -355.899994; }
        frame 75 { x: 97; y: 82.1999969; skew-x: -359.899994; skew-y: -359.899994; }
        frame 76 { x: 95.1999969; y: 82; skew-x: -363.899994; skew-y: -363.899994; }
        frame 77 { x: 95.4000015; y: 87.8000031; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: 95.5; y: 93.6999969; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: 96.3000031; y: 95.5999985; skew-x: -363; skew-y: -363.200012; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 80 { x: 97; y: 97.5999985; skew-x: -362.299988; skew-y: -362.5; scale-x: 0.916000009; scale-y: 0.879999995; }
        frame 81 { x: 96.9000015; y: 95.3000031; skew-x: -362.200012; skew-y: -362.399994; scale-x: 0.907000005; scale-y: 0.888999999; }
        frame 82 { x: 96.6999969; y: 93.0999985; skew-x: -362.399994; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: 96.8000031; y: 94.8000031; skew-x: -362.200012; skew-y: -362.200012; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 96.6999969; y: 96.5999985; skew-x: -362.399994; skew-y: -362.399994; }
    }
    Track {
        source-name: "Zombie_catapult_tape";
        frame-count: 85;
        frame 0 { x: 79.5999985; y: 115.199997; scale-x: 0.899999976; scale-y: 0.899999976; image: IMAGE_REANIM_ZOMBIE_CATAPULT_TAPE; }
        frame 1 { x: 79.8000031; y: 115; scale-x: -10000; scale-y: 0.91900003; image: none; }
        frame 2 { x: 80; y: 114.800003; scale-y: 0.93900001; }
        frame 3 { x: -10000; y: 114.599998; scale-y: 0.907999992; }
        frame 4 { y: 114.300003; scale-y: 0.876999974; }
        frame 5 { y: 114.099998; scale-y: 0.845000029; }
        frame 6 { y: 113.800003; scale-y: 0.81400001; }
        frame 7 { x: 79.5999985; y: 113.300003; skew-x: 1.29999995; skew-y: 1.29999995; scale-y: -10000; }
        frame 8 { x: 79.3000031; y: 112.599998; skew-x: 2.5; skew-y: 2.5; }
        frame 9 { x: 79.5; y: 113.199997; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 0.836000025; }
        frame 10 { x: 79.5999985; y: 113.900002; skew-x: 1.29999995; skew-y: 1.29999995; scale-y: 0.856999993; }
        frame 11 { x: 79.8000031; y: 114.5; skew-x: 0.5; skew-y: 0.5; scale-y: 0.879000008; }
        frame 12 { x: 80; y: 115.199997; skew-x: 0; skew-y: 0; scale-y: 0.899999976; }
        frame 13 { x: 79.9000015; y: 115; skew-x: -10000; skew-y: -10000; scale-y: 0.91900003; }
        frame 14 { x: 79.8000031; y: 114.800003; scale-y: 0.93900001; }
        frame 15 { x: 79.6999969; y: 114.599998; scale-y: 0.907999992; }
        frame 16 { x: -10000; y: 114.300003; scale-y: 0.876999974; }
        frame 17 { x: 79.5999985; y: 114.099998; scale-y: 0.845000029; }
        frame 18 { x: 79.5; y: 113.800003; scale-y: 0.81400001; }
        frame 19 { x: -10000; y: 113.300003; skew-x: 1.29999995; skew-y: 1.29999995; scale-y: -10000; }
        frame 20 { y: 112.599998; skew-x: 2.5; skew-y: 2.5; }
        frame 21 { x: 79.5999985; y: 113.300003; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 0.836000025; }
        frame 22 { x: 79.8000031; y: 114; skew-x: 1.29999995; skew-y: 1.29999995; scale-y: 0.856999993; }
        frame 23 { x: -10000; y: 114.599998; skew-x: 0.5; skew-y: 0.5; scale-y: 0.879000008; }
        frame 24 { x: 80; y: 115.199997; skew-x: 0; skew-y: 0; scale-y: 0.899999976; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 27 { x: 80; }
        frame 28 { x: -10000; }
        frame 30 { x: 79.9000015; }
        frame 31 { x: -10000; }
        frame 34 { x: 79.8000031; }
        frame 35 { x: -10000; }
        frame 43 { x: 79.3000031; y: 114.699997; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 44 { x: 79; y: 114.300003; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 45 { x: 78.5999985; y: 114; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 46 { x: 78.1999969; y: 113.599998; skew-x: -7.5; skew-y: -7.5; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 47 { x: 77.5; y: 114.800003; skew-x: -16.2000008; skew-y: -16.2000008; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 48 { x: 78.5999985; y: -10000; skew-x: -7.9000001; skew-y: -7.9000001; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 79.8000031; y: 115.199997; skew-x: 0; skew-y: 0; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 50 { x: 80; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.94599998; }
        frame 51 { x: 80.3000031; scale-y: 0.991999984; }
        frame 52 { x: 80.0999985; scale-y: 0.961000025; }
        frame 53 { x: 79.9000015; scale-y: 0.930999994; }
        frame 54 { x: 79.8000031; scale-y: 0.899999976; }
        frame 55 { x: -10000; scale-y: -10000; }
        frame 58 { x: 79.6999969; y: 115.599998; }
        frame 59 { x: 79.5; y: 116; }
        frame 60 { x: 79.8000031; y: 116.199997; }
        frame 61 { x: 79.5; y: 115.199997; }
        frame 62 { x: 79.8000031; y: 115; }
        frame 63 { x: 79.5; y: 116; }
        frame 64 { x: 79.8000031; y: 116.199997; }
        frame 65 { x: 79.5; y: 115.199997; }
        frame 66 { x: 79.8000031; y: 115; }
        frame 67 { x: -10000; y: 116; }
        frame 68 { y: 116.199997; }
        frame 69 { y: 115.199997; }
        frame 70 { y: -10000; }
        frame 71 { x: 81.3000031; y: 105.800003; skew-x: 6; skew-y: 6; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 72 { x: 83; y: 96.5; skew-x: 12.3999996; skew-y: 12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 82.3000031; y: 97.4000015; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 74 { x: 81.3000031; y: 98.3000031; skew-x: 4; skew-y: 4; }
        frame 75 { x: 80.5999985; y: 99.1999969; skew-x: 0; skew-y: 0; }
        frame 76 { x: 79.8000031; y: 100.099998; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 80; y: 106; skew-x: -10000; skew-y: -10000; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 78 { x: 80.0999985; y: 111.800003; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 79 { x: 80.5; y: 113.800003; skew-x: -3; skew-y: -3.20000005; scale-x: 0.907000005; scale-y: 0.931999981; }
        frame 80 { x: 80.8000031; y: 115.699997; skew-x: -2.29999995; skew-y: -2.5; scale-x: 0.916000009; scale-y: 0.966000021; }
        frame 81 { x: -10000; y: 113.300003; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.907000005; scale-y: 0.931999981; }
        frame 82 { y: 110.800003; skew-x: -2.4000001; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 83 { x: 80.9000015; y: 112.599998; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 80.8000031; y: 114.300003; skew-x: -2.4000001; skew-y: -2.4000001; }
    }
}
