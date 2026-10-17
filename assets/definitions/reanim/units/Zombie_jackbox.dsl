export component Zombie_jackbox {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { cel: 0; }
        frame 14 { cel: -10000; }
        frame 30 { cel: -1; }
        frame 31 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 30 { x: -9; y: 8.80000019; skew-x: -10.3000002; skew-y: -10.3000002; scale-x: 0.998000026; scale-y: 0.998000026; cel: 0; }
        frame 31 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 49 { cel: -1; }
        frame 50 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 49 { cel: 0; }
        frame 50 { cel: -10000; }
        frame 64 { cel: -1; }
        frame 65 { cel: -10000; }
    }
    Track {
        source-name: "anim_pop";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 64 { cel: 0; }
        frame 65 { cel: -10000; }
        frame 80 { cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 80 { cel: 0; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 30 { x: -49.7999992; y: 70; cel: 0; }
        frame 31 { x: -10000; y: -10000; cel: -10000; }
        frame 32 { x: -49.2000008; }
        frame 33 { x: -48.5999985; }
        frame 34 { x: -47.9000015; }
        frame 35 { x: -44.2999992; }
        frame 36 { x: -40.7000008; }
        frame 37 { x: -39.7000008; }
        frame 38 { x: -38.7000008; }
        frame 39 { x: -10000; }
        frame 40 { x: -37.7999992; }
        frame 41 { x: -36.7999992; }
        frame 42 { x: -35.7999992; }
        frame 43 { x: -34; }
        frame 44 { x: -32.0999985; }
        frame 45 { x: -10000; }
        frame 47 { x: -30.5; }
        frame 48 { x: -28.8999996; }
        frame 49 { x: -10000; cel: -1; }
        frame 50 { cel: -10000; }
    }
    Track {
        source-name: "zombie_jackbox_innerleg_foot";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 27; y: 104.5; scale-x: 0.748000026; scale-y: 0.748000026; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_INNERLEG_FOOT; }
        frame 14 { x: 27.1000004; y: 104.400002; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 27.2999992; y: 104.300003; skew-x: 0.5; skew-y: 0.5; }
        frame 16 { x: 27.5; y: 104.099998; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 17 { x: 28.2000008; y: 103.300003; skew-x: 3.29999995; skew-y: 3.29999995; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 18 { x: 28.6000004; y: 103; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 28.7999992; y: 102.800003; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 21 { x: 28.8999996; y: 102.699997; skew-x: 5.30000019; skew-y: 5.30000019; }
        frame 22 { x: 28.7000008; y: 103; skew-x: 4.5; skew-y: 4.5; }
        frame 23 { x: 28.3999996; y: 103.199997; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 24 { x: 28.1000004; y: 103.400002; skew-x: 3; skew-y: 3; }
        frame 25 { x: 27.8999996; y: 103.599998; skew-x: 2.5; skew-y: 2.5; }
        frame 26 { x: 27.7000008; y: 103.800003; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 27 { x: 27.3999996; y: 104.099998; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 28 { x: 27.2000008; y: 104.300003; skew-x: 0.5; skew-y: 0.5; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 29 { x: 27; y: 104.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: 27.7000008; }
        frame 33 { x: 28.3999996; }
        frame 34 { x: 29; }
        frame 35 { x: 32.2000008; }
        frame 36 { x: 35.4000015; }
        frame 37 { x: 36.5; }
        frame 38 { x: 37.5999985; }
        frame 39 { x: -10000; }
        frame 40 { x: 39.5999985; y: 104.099998; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 41 { x: 41.5999985; y: 103.599998; skew-x: 2.5; skew-y: 2.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 42 { x: 43.5999985; y: 103.099998; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 45 { x: 37.4000015; y: 103.5; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 46 { x: 31.6000004; y: 103.900002; skew-x: -8.80000019; skew-y: -8.80000019; }
        frame 47 { x: 29.2999992; y: 104.099998; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 48 { x: 27; y: 104.5; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 27.2999992; y: 103.800003; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 51 { x: 27.7000008; y: 103; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 28.1000004; y: 102.199997; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 53 { x: 28.5; y: 101.400002; skew-x: 5.80000019; skew-y: 5.80000019; }
        frame 54 { x: 28.7999992; y: 100.599998; skew-x: 7.30000019; skew-y: 7.30000019; }
        frame 55 { x: 28.3999996; y: 101.599998; skew-x: 5.30000019; skew-y: 5.30000019; }
        frame 56 { x: 27.8999996; y: 102.599998; skew-x: 3.5; skew-y: 3.5; }
        frame 57 { x: 27.3999996; y: 103.5; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 58 { x: 27; y: 104.5; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 27.7000008; y: 103.5; skew-x: 2; skew-y: 2; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 74 { x: 28.3999996; y: 102.300003; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 77 { y: 102.800003; }
        frame 78 { y: 103.099998; }
        frame 79 { y: -10000; }
        frame 80 { x: 27; y: 104.5; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 81 { x: 26.5; y: 105; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 82 { x: 26.2000008; y: 105.699997; skew-x: -4.9000001; skew-y: -4.9000001; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 25.7000008; y: 106.199997; skew-x: -7.5; skew-y: -7.5; }
        frame 84 { x: 25.2999992; y: 106.800003; skew-x: -10.1999998; skew-y: -10.1999998; }
        frame 85 { x: 25.1000004; y: 109.199997; skew-x: -25.7000008; skew-y: -25.7000008; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 86 { x: 26.3999996; y: 111.699997; skew-x: -41.2999992; skew-y: -41.2999992; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 87 { x: 29.2000008; y: 113.800003; skew-x: -56.7999992; skew-y: -56.7999992; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 33.5; y: 115.5; skew-x: -72.4000015; skew-y: -72.4000015; }
        frame 89 { x: 38.5999985; y: 108.599998; skew-x: -99.1999969; skew-y: -99.1999969; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 90 { x: 45.0999985; y: 97.3000031; skew-x: -126; skew-y: -126; scale-x: 0.741999984; scale-y: 0.741999984; }
        frame 91 { x: 44.5999985; y: 96.5999985; skew-x: -133.300003; skew-y: -133.300003; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 92 { x: 44; y: 95.4000015; skew-x: -140.600006; skew-y: -140.600006; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 43.0999985; y: 94; skew-x: -148; skew-y: -148; }
        frame 94 { x: 42.4000015; y: 92.3000031; skew-x: -155.300003; skew-y: -155.300003; scale-x: 0.741999984; scale-y: 0.741999984; }
        frame 95 { x: 39; y: 114.699997; skew-x: -127; skew-y: -127; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 96 { x: 35.0999985; y: 131.800003; skew-x: -98.9000015; skew-y: -98.9000015; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 36.0999985; y: 132.399994; skew-x: -99.1999969; skew-y: -98.4000015; scale-x: 0.726000011; scale-y: 0.751999974; }
        frame 98 { x: 37.0999985; y: 132.800003; skew-x: -99.5999985; skew-y: -98.3000031; scale-x: 0.713; scale-y: 0.764999986; }
        frame 99 { x: 36.5; y: 131.699997; skew-x: -100.5; skew-y: -99.9000015; scale-x: 0.726000011; scale-y: 0.751999974; }
        frame 100 { x: 36.0999985; y: 130.699997; skew-x: -101.699997; skew-y: -101.699997; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 101 { x: 36.2000008; y: 131.800003; skew-x: -10000; skew-y: -10000; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 102 { x: 36.0999985; y: 132.899994; scale-x: 0.74000001; scale-y: 0.74000001; }
    }
    Track {
        source-name: "zombie_jackbox_innerleg_lower";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 27.2000008; y: 93.5999985; scale-x: 0.748000026; scale-y: 0.748000026; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_INNERLEG_LOWER; }
        frame 14 { x: 27.3999996; y: -10000; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 27.5; y: 93.3000031; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 16 { x: 27.8999996; y: 92.8000031; skew-x: 1.5; skew-y: 1.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 17 { x: 29; y: 91.5999985; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 29.5; y: 91; skew-x: 5; skew-y: 5; }
        frame 19 { x: 29.8999996; y: 90.6999969; skew-x: 5.80000019; skew-y: 5.80000019; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 21 { x: 30.2000008; y: 90.4000015; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 22 { x: 29.7000008; y: 90.9000015; skew-x: 5.30000019; skew-y: 5.30000019; }
        frame 23 { x: 29.3999996; y: 91.3000031; skew-x: 4.5999999; skew-y: 4.5999999; }
        frame 24 { x: 29; y: 91.6999969; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 25 { x: 28.7000008; y: 92; skew-x: 3; skew-y: 3; }
        frame 26 { x: 28.2999992; y: 92.5; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 27 { x: 27.8999996; y: 92.8000031; skew-x: 1.5; skew-y: 1.5; }
        frame 28 { x: 27.6000004; y: 93.3000031; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 29 { x: 27.2000008; y: 93.5999985; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 28.7999992; y: 92.6999969; skew-x: 3.29999995; skew-y: 3.29999995; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 32 { x: 28.3999996; y: 93.5; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 28.1000004; y: 94.3000031; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 34 { x: 28; y: 95.1999969; skew-x: -4.9000001; skew-y: -4.9000001; }
        frame 35 { x: 30.2000008; y: 95.5999985; skew-x: -7.9000001; skew-y: -7.9000001; }
        frame 36 { x: 32.5; y: 95.9000015; skew-x: -10.8999996; skew-y: -10.8999996; }
        frame 37 { x: 34.2999992; y: 95.3000031; skew-x: -8.69999981; skew-y: -8.69999981; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 38 { x: 36.0999985; y: 94.6999969; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 37.4000015; y: 94.0999985; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 40 { x: 36; y: 95.9000015; skew-x: -9.69999981; skew-y: -9.69999981; }
        frame 41 { x: 35.0999985; y: 97.8000031; skew-x: -15.3999996; skew-y: -15.3999996; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 42 { x: 34.0999985; y: 99.8000031; skew-x: -21.2999992; skew-y: -21.2999992; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 32.5999985; y: 101.300003; skew-x: -27.7000008; skew-y: -27.7000008; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 44 { x: 31.2999992; y: 102.800003; skew-x: -34.0999985; skew-y: -34.0999985; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 45 { x: 28.2000008; y: 97.9000015; skew-x: -21.3999996; skew-y: -21.3999996; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 46 { x: 26.3999996; y: 93.4000015; skew-x: -8.80000019; skew-y: -8.80000019; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 27; y: 93.5999985; skew-x: -4.19999981; skew-y: -4.19999981; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 48 { x: 27.2000008; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 49 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 27.1000004; y: 93.5; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 51 { x: -10000; y: -10000; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 52 { x: 27; y: 93.3000031; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 53 { x: -10000; y: -10000; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 26.8999996; y: 93.0999985; skew-x: -2.4000001; skew-y: -2.4000001; }
        frame 55 { x: 27.8999996; y: 92.6999969; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 56 { x: 28.7000008; y: 92.4000015; skew-x: 1.5; skew-y: 1.5; }
        frame 57 { x: 29.7000008; y: 92.0999985; skew-x: 3.5; skew-y: 3.5; }
        frame 58 { x: 30.7000008; y: 91.8000031; skew-x: 5.80000019; skew-y: 5.80000019; }
        frame 59 { x: 30; y: 92.1999969; skew-x: 4.5; skew-y: 4.5; }
        frame 60 { x: 29.2999992; y: 92.5999985; skew-x: 3.29999995; skew-y: 3.29999995; }
        frame 61 { x: 28.6000004; y: 92.9000015; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 62 { x: 28; y: 93.3000031; skew-x: 1; skew-y: 1; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 63 { x: 27.2000008; y: 93.5999985; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 26.7000008; y: 92.5999985; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.746999979; scale-y: 0.782000005; }
        frame 74 { x: 26.2000008; y: 91.5999985; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: -10000; scale-y: 0.816999972; }
        frame 75 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: 0.815999985; }
        frame 76 { scale-y: 0.816999972; }
        frame 77 { x: 26.6000004; y: 91.4000015; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.815999985; }
        frame 78 { x: 26.8999996; y: 91.1999969; skew-x: -0.200000003; skew-y: -0.200000003; scale-y: -10000; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 27.2000008; y: 93.5999985; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 81 { x: 26.8999996; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 26.5; y: 93.5; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 83 { x: 26.2000008; y: 93.3000031; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 26; y: 93.1999969; skew-x: 0.699999988; skew-y: 0.699999988; }
        frame 85 { x: 21.7999992; y: 98.3000031; skew-x: -18.7000008; skew-y: -18.7000008; scale-x: 0.745999992; scale-y: 0.765999973; }
        frame 86 { x: 19.6000004; y: 104.300003; skew-x: -38.2999992; skew-y: -38.2999992; scale-x: 0.744000018; scale-y: 0.783999979; }
        frame 87 { x: 19.7999992; y: 110.400002; skew-x: -57.7999992; skew-y: -57.7999992; scale-x: -10000; scale-y: 0.80400002; }
        frame 88 { x: 22.2999992; y: 116; skew-x: -77.4000015; skew-y: -77.4000015; scale-y: 0.824000001; }
        frame 89 { x: 29.7000008; y: 112.900002; skew-x: -105; skew-y: -105; scale-x: 0.741999984; scale-y: 0.82099998; }
        frame 90 { x: 39.4000015; y: 105.300003; skew-x: -132.800003; skew-y: -132.800003; scale-x: 0.740999997; scale-y: 0.819999993; }
        frame 91 { x: 39.9000015; y: -10000; skew-x: -140.300003; skew-y: -140.300003; scale-x: 0.739000022; scale-y: 0.819000006; }
        frame 92 { x: 40.2999992; y: 105; skew-x: -147.800003; skew-y: -147.800003; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 40.5; y: 104.300003; skew-x: -155.399994; skew-y: -155.399994; scale-x: 0.74000001; }
        frame 94 { x: 40.5999985; y: 103.300003; skew-x: -162.899994; skew-y: -162.899994; scale-x: -10000; scale-y: 0.819999993; }
        frame 95 { x: 35.0999985; y: 124.099998; skew-x: -137.600006; skew-y: -137.600006; scale-x: 0.737999976; scale-y: 0.818000019; }
        frame 96 { x: 29; y: 140.699997; skew-x: -112.300003; skew-y: -112.300003; scale-x: 0.739000022; scale-y: -10000; }
        frame 97 { x: 30; y: 140.899994; skew-x: -113; skew-y: -111.5; scale-x: 0.727999985; scale-y: 0.827000022; }
        frame 98 { x: 30.7999992; y: 141.300003; skew-x: -113.900002; skew-y: -110.900002; scale-x: 0.718999982; scale-y: 0.838999987; }
        frame 99 { x: 29.8999996; y: 140.899994; skew-x: -113; skew-y: -111.5; scale-x: 0.727999985; scale-y: 0.827000022; }
        frame 100 { x: 29; y: 140.699997; skew-x: -112.300003; skew-y: -112.300003; scale-x: 0.739000022; scale-y: 0.818000019; }
        frame 101 { y: 140.600006; skew-x: -112.199997; skew-y: -112.199997; scale-x: 0.737999976; scale-y: 0.816999972; }
        frame 102 { y: 140.699997; skew-x: -112.300003; skew-y: -112.300003; scale-x: 0.739000022; scale-y: 0.818000019; }
    }
    Track {
        source-name: "zombie_jackbox_innerleg_upper";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 41.7000008; y: 75.5999985; scale-x: 0.748000026; scale-y: 0.748000026; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_INNERLEG_UPPER; }
        frame 14 { x: 41.5; y: 75.6999969; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 41.4000015; y: 75.8000031; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 16 { x: 41; y: 76.0999985; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 39.9000015; y: 76.8000031; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 18 { x: 39.2999992; y: 77.3000031; skew-x: -7.4000001; skew-y: -7.4000001; }
        frame 19 { x: 38.9000015; y: 77.5999985; skew-x: -8.69999981; skew-y: -8.69999981; }
        frame 20 { x: -10000; y: -10000; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 21 { x: 38.7999992; y: 77.6999969; skew-x: -9.39999962; skew-y: -9.39999962; }
        frame 22 { x: 39.0999985; y: 77.4000015; skew-x: -8.19999981; skew-y: -8.19999981; }
        frame 23 { x: 39.5; y: 77.1999969; skew-x: -6.9000001; skew-y: -6.9000001; }
        frame 24 { x: 39.9000015; y: 76.8000031; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 25 { x: 40.2999992; y: 76.5999985; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 26 { x: 40.5999985; y: 76.4000015; skew-x: -3.4000001; skew-y: -3.4000001; }
        frame 27 { x: 41; y: 76.0999985; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 28 { x: 41.4000015; y: 75.8000031; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 29 { x: 41.7000008; y: 75.5999985; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 41; y: 77.1999969; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 32 { x: 41.9000015; y: 76.3000031; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 42.9000015; y: 75.5; skew-x: 2.5; skew-y: 2.5; }
        frame 34 { x: 43.9000015; y: 74.6999969; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 35 { x: 43.5999985; y: 75.5999985; skew-x: 0; skew-y: 0; }
        frame 36 { x: 43.5; y: 76.8000031; skew-x: -6.4000001; skew-y: -6.4000001; }
        frame 37 { x: 44.7000008; y: 77; skew-x: -9.69999981; skew-y: -9.69999981; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 38 { x: 45.7999992; y: 77.1999969; skew-x: -13.3000002; skew-y: -13.3000002; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 45.4000015; y: 79; skew-x: -16.1000004; skew-y: -16.1000004; }
        frame 40 { x: 44.7000008; y: 78.8000031; skew-x: -14.6999998; skew-y: -14.6999998; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 41 { x: 44.0999985; y: 78.5; skew-x: -13.1999998; skew-y: -13.1999998; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 43.4000015; y: 78.3000031; skew-x: -12; skew-y: -12; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 43 { x: 43.5; y: 76.9000015; skew-x: -4.9000001; skew-y: -4.9000001; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 44 { x: 43.9000015; y: 75.6999969; skew-x: 1.89999998; skew-y: 1.89999998; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 43.5; y: 73.5999985; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 46 { x: 43.2999992; y: 71.5999985; skew-x: 5.9000001; skew-y: 5.9000001; }
        frame 47 { x: 42.5; y: 73.6999969; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 48 { x: 41.7000008; y: 75.5999985; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 42; y: 75.1999969; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 51 { x: 42.4000015; y: 74.6999969; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 52 { x: 42.5999985; y: 74.1999969; skew-x: 1.10000002; skew-y: 1.10000002; }
        frame 53 { x: 43; y: 73.6999969; skew-x: 1.5; skew-y: 1.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 54 { x: 43.2999992; y: 73.3000031; skew-x: 2; skew-y: 2; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 55 { x: 42.5; y: 74.3000031; skew-x: -0.5; skew-y: -0.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 56 { x: 41.7999992; y: 75.5; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 41; y: 76.5999985; skew-x: -6.19999981; skew-y: -6.19999981; }
        frame 58 { x: 40.4000015; y: 77.8000031; skew-x: -9; skew-y: -9; }
        frame 59 { x: 40.5; y: 77.3000031; skew-x: -7.19999981; skew-y: -7.19999981; }
        frame 60 { x: 40.9000015; y: 76.8000031; skew-x: -5.19999981; skew-y: -5.19999981; }
        frame 61 { x: 41.0999985; y: 76.4000015; skew-x: -3.4000001; skew-y: -3.4000001; }
        frame 62 { x: 41.4000015; y: 76; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 63 { x: 41.7000008; y: 75.5999985; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 43.2000008; y: 72.3000031; skew-x: 3.5; skew-y: 3.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 74 { x: 44.5999985; y: 69; skew-x: 7.0999999; skew-y: 7.0999999; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -10000; y: -10000; skew-x: 7; skew-y: 7; }
        frame 76 { skew-x: 7.0999999; skew-y: 7.0999999; }
        frame 77 { y: 69.8000031; skew-x: 7; skew-y: 7; }
        frame 78 { y: 70.6999969; skew-x: 7.0999999; skew-y: 7.0999999; }
        frame 79 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 41.7000008; y: 75.5999985; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 81 { x: 38.2000008; y: 77.3000031; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 82 { x: 34.7999992; y: 79.0999985; skew-x: -12.6999998; skew-y: -12.6999998; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 31.5; y: 81.0999985; skew-x: -19; skew-y: -19; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 84 { x: 28.2999992; y: 83.1999969; skew-x: -25.5; skew-y: -25.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 85 { x: 23.7000008; y: 84.0999985; skew-x: -30.2000008; skew-y: -30.2000008; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 86 { x: 19.1000004; y: 85.0999985; skew-x: -35; skew-y: -35; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 14.6999998; y: 86.0999985; skew-x: -39.7999992; skew-y: -39.7999992; }
        frame 88 { x: 10.5; y: 87.0999985; skew-x: -44.5999985; skew-y: -44.5999985; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 89 { x: 6.4000001; y: 93.6999969; skew-x: -69.9000015; skew-y: -69.9000015; scale-x: 0.744000018; scale-y: 0.777999997; }
        frame 90 { x: 5.0999999; y: 99.8000031; skew-x: -95.1999969; skew-y: -95.1999969; scale-x: 0.742999971; scale-y: 0.813000023; }
        frame 91 { x: -10000; y: 103.300003; skew-x: -102; skew-y: -102; scale-x: -10000; scale-y: 0.82099998; }
        frame 92 { x: 5.5; y: 106.599998; skew-x: -108.900002; skew-y: -108.900002; scale-x: 0.741999984; scale-y: 0.828999996; }
        frame 93 { x: 5.80000019; y: 109.800003; skew-x: -115.900002; skew-y: -115.900002; scale-x: -10000; scale-y: 0.837000012; }
        frame 94 { x: 6.19999981; y: 112.800003; skew-x: -122.900002; skew-y: -122.900002; scale-y: 0.847000003; }
        frame 95 { x: 2; y: 119.800003; skew-x: -104.199997; skew-y: -104.199997; scale-x: 0.740999997; scale-y: 0.845000029; }
        frame 96 { x: -0.699999988; y: 125.599998; skew-x: -85.5; skew-y: -85.5; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: -0.300000012; y: 126.300003; skew-x: -85.4000015; skew-y: -85.8000031; scale-x: 0.726999998; scale-y: 0.860000014; }
        frame 98 { x: 0; y: 126.800003; skew-x: -85.1999969; skew-y: -10000; scale-x: 0.713; scale-y: 0.875; }
        frame 99 { x: -0.300000012; y: 126.300003; skew-x: -85.4000015; scale-x: 0.726999998; scale-y: 0.860000014; }
        frame 100 { x: -0.699999988; y: 125.599998; skew-x: -85.5; skew-y: -85.5; scale-x: 0.740999997; scale-y: 0.845000029; }
        frame 101 { x: -10000; y: -10000; skew-x: -85.5999985; skew-y: -85.5999985; scale-x: -10000; scale-y: -10000; }
        frame 102 { skew-x: -85.5; skew-y: -85.5; }
    }
    Track {
        source-name: "Zombie_jackbox_body2";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 38.4000015; y: 59.7000008; scale-x: 0.748000026; scale-y: 0.748000026; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_BODY2; }
        frame 14 { x: -10000; y: 59.7999992; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { y: 59.9000015; }
        frame 16 { y: 60.0999985; }
        frame 17 { x: 38.2999992; y: 60.7999992; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 18 { x: 38.4000015; y: 61.0999985; skew-x: -10000; skew-y: -10000; }
        frame 19 { x: -10000; y: 61.4000015; }
        frame 20 { y: 61.5; }
        frame 21 { x: 38.2000008; y: -10000; skew-x: -0.5; skew-y: -0.5; }
        frame 22 { x: 38.4000015; y: 61.2000008; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 23 { x: 38.2999992; y: 61; skew-x: -10000; skew-y: -10000; }
        frame 24 { x: 38.4000015; y: 60.7000008; skew-x: -0; skew-y: -0; }
        frame 25 { x: 38.5; y: 60.5; skew-x: 0; skew-y: 0; }
        frame 26 { x: -10000; y: 60.2999992; skew-x: -10000; skew-y: -10000; }
        frame 27 { x: 38.4000015; y: 60.0999985; }
        frame 28 { x: -10000; y: 59.9000015; }
        frame 29 { y: 59.7000008; }
        frame 30 { y: -10000; }
        frame 31 { y: 60.2000008; }
        frame 32 { y: 59.5999985; }
        frame 33 { y: 59; }
        frame 34 { y: 58.5; }
        frame 35 { x: 38.2000008; y: 58.2000008; skew-x: 0.5; skew-y: 0.5; }
        frame 36 { x: 38; y: 57.9000015; skew-x: 1; skew-y: 1; }
        frame 37 { x: 37.7000008; y: 59.4000015; skew-x: 2; skew-y: 2; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 38 { x: 37.2000008; y: 60.9000015; skew-x: 3.0999999; skew-y: 3.0999999; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 36.7999992; y: 64.8000031; skew-x: -2.0999999; skew-y: -2.0999999; }
        frame 40 { x: 37.2999992; y: 63; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 41 { x: 37.9000015; y: 61.2999992; skew-x: -0.5; skew-y: -0.5; }
        frame 42 { x: 38.4000015; y: 59.7000008; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 43 { x: -10000; y: 59.0999985; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { y: 58.5; }
        frame 45 { x: 38.2000008; y: 58.2000008; skew-x: 0.5; skew-y: 0.5; }
        frame 46 { x: 38; y: 57.9000015; skew-x: 1; skew-y: 1; }
        frame 47 { x: 38.2000008; y: 58.7999992; skew-x: 0.5; skew-y: 0.5; }
        frame 48 { x: 38.4000015; y: 59.7000008; skew-x: 0; skew-y: 0; }
        frame 49 { x: 36.9000015; y: 62.2999992; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 50 { x: 38.5; y: 60; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 40; y: 58; skew-x: 1.5; skew-y: 1.5; }
        frame 52 { x: 41.7999992; y: 55.9000015; skew-x: 5; skew-y: 5; }
        frame 53 { x: 43.5999985; y: 53.9000015; skew-x: 8.5; skew-y: 8.5; }
        frame 54 { x: 45.5; y: 51.9000015; skew-x: 12.1000004; skew-y: 12.1000004; }
        frame 55 { x: 43.7999992; y: 53.7999992; skew-x: 9.5; skew-y: 9.5; }
        frame 56 { x: 42; y: 55.5999985; skew-x: 7; skew-y: 7; }
        frame 57 { x: 40.4000015; y: 57.5999985; skew-x: 4.5; skew-y: 4.5; }
        frame 58 { x: 38.7999992; y: 59.5999985; skew-x: 2; skew-y: 2; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 59 { x: 38.7000008; y: 59.7000008; skew-x: 1.5; skew-y: 1.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 60 { x: 38.5; y: -10000; skew-x: 1.10000002; skew-y: 1.10000002; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 61 { x: -10000; y: 59.5999985; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: -10000; }
        frame 62 { y: 59.7999992; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 63 { x: 38.4000015; y: 59.7000008; skew-x: 0; skew-y: 0; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 40.7000008; y: 56.2999992; skew-x: 3.5; skew-y: 3.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 74 { x: 43.2999992; y: 52.7999992; skew-x: 7.0999999; skew-y: 7.0999999; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 43.7999992; y: 52.4000015; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 76 { x: 44.2999992; y: 51.9000015; skew-x: 9.60000038; skew-y: 9.60000038; }
        frame 77 { x: 43.5999985; y: 53.2000008; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 78 { x: 43.2999992; y: 54.5; skew-x: 7.0999999; skew-y: 7.0999999; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 38.4000015; y: 59.7000008; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 81 { x: 33.9000015; y: 62.7999992; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 82 { x: 29.6000004; y: 66.1999969; skew-x: -11.8999996; skew-y: -11.8999996; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 83 { x: 25.5; y: 69.5999985; skew-x: -18; skew-y: -18; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 21.6000004; y: 73.3000031; skew-x: -24.2000008; skew-y: -24.2000008; }
        frame 85 { x: 16.2000008; y: 74.8000031; skew-x: -29; skew-y: -29; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 86 { x: 10.8999996; y: 76.5; skew-x: -33.7000008; skew-y: -33.7000008; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 5.80000019; y: 78.1999969; skew-x: -38.5; skew-y: -38.5; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 88 { x: 0.899999976; y: 79.8000031; skew-x: -43.2000008; skew-y: -43.2000008; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 89 { x: -4.9000001; y: 92.5; skew-x: -66.0999985; skew-y: -66.0999985; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 90 { x: -7.0999999; y: 103.699997; skew-x: -88.9000015; skew-y: -88.9000015; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -6.9000001; y: 108.400002; skew-x: -95.1999969; skew-y: -95.1999969; }
        frame 92 { x: -6.5; y: 113; skew-x: -101.400002; skew-y: -101.400002; scale-x: 0.741999984; scale-y: 0.741999984; }
        frame 93 { x: -6.0999999; y: 117.300003; skew-x: -107.699997; skew-y: -107.699997; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: -5.4000001; y: 121.5; skew-x: -114; skew-y: -114; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 95 { x: -14.6000004; y: 123.099998; skew-x: -87.4000015; skew-y: -89.9000015; scale-x: 0.740999997; scale-y: -10000; }
        frame 96 { x: -20.5; y: 121.099998; skew-x: -60.5999985; skew-y: -65.9000015; scale-x: -10000; scale-y: 0.744000018; }
        frame 97 { x: -20.3999996; y: 121.800003; skew-x: -59.7999992; skew-y: -66.8000031; scale-x: 0.731999993; scale-y: 0.751999974; }
        frame 98 { x: -10000; y: 122.5; skew-x: -58.7999992; skew-y: -67.4000015; scale-x: 0.726000011; scale-y: 0.760999978; }
        frame 99 { y: 121.800003; skew-x: -59.7999992; skew-y: -66.8000031; scale-x: 0.731999993; scale-y: 0.751999974; }
        frame 100 { x: -20.5; y: 121.099998; skew-x: -60.5999985; skew-y: -65.9000015; scale-x: 0.740999997; scale-y: 0.744000018; }
        frame 101 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.74000001; scale-y: 0.742999971; }
        frame 102 { scale-x: 0.740999997; scale-y: 0.744000018; }
    }
    Track {
        source-name: "zombie_jackbox_outerleg_foot";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 48.4000015; y: 113.5; scale-x: 0.748000026; scale-y: 0.748000026; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERLEG_FOOT; }
        frame 14 { x: 48.2999992; y: 113.599998; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: -10000; y: 113.800003; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 16 { x: 48.0999985; y: 114; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 17 { x: 47.7999992; y: 114.599998; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 47.5999985; y: 114.900002; skew-x: -5.19999981; skew-y: -5.19999981; }
        frame 19 { x: -10000; y: 115.099998; skew-x: -6.19999981; skew-y: -6.19999981; }
        frame 20 { x: 47.7000008; y: 115; skew-x: -10000; skew-y: -10000; }
        frame 21 { x: 47.5; y: 115.199997; skew-x: -6.69999981; skew-y: -6.69999981; }
        frame 22 { x: -10000; y: 115; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 23 { x: 47.5999985; y: 114.800003; skew-x: -4.9000001; skew-y: -4.9000001; }
        frame 24 { x: 47.7999992; y: 114.5; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 25 { x: 47.9000015; y: 114.300003; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 26 { x: 48; y: 114.199997; skew-x: -2.4000001; skew-y: -2.4000001; }
        frame 27 { x: 48.0999985; y: 114; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 28 { x: 48.2999992; y: 113.800003; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 29 { x: 48.4000015; y: 113.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: 47.5; y: 113.599998; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 33 { x: 46.7999992; y: 113.5; skew-x: -4; skew-y: -4; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 45.7999992; y: -10000; skew-x: -6.30000019; skew-y: -6.30000019; }
        frame 35 { x: 41.9000015; y: 110.099998; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 36 { x: 38.4000015; y: 106.800003; skew-x: 9.10000038; skew-y: 9.10000038; }
        frame 37 { x: 38.5; y: 108.800003; skew-x: 8.5; skew-y: 8.5; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 38 { x: 38.7999992; y: 110.800003; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 39.2999992; y: 111; skew-x: 7.80000019; skew-y: 7.80000019; }
        frame 40 { x: 40.5999985; y: 111.099998; skew-x: -10000; skew-y: -10000; }
        frame 41 { x: 41.9000015; y: -10000; }
        frame 42 { x: 43; y: 111; }
        frame 43 { x: 44.9000015; y: 111.099998; }
        frame 44 { x: 46.7999992; y: 111; }
        frame 45 { x: 46.5; y: 111.400002; skew-x: 5.80000019; skew-y: 5.80000019; }
        frame 46 { x: 46.0999985; y: 111.800003; skew-x: 4; skew-y: 4; }
        frame 47 { x: 47.2000008; y: 112.699997; skew-x: 2; skew-y: 2; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 48 { x: 48.4000015; y: 113.5; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 48.2999992; y: 113.599998; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 51 { x: 48.0999985; y: 113.800003; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 52 { x: 48; y: 114; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 47.7999992; y: 114.099998; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 54 { x: 47.5999985; y: 114.199997; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 55 { x: 47.7999992; y: 114; skew-x: -3.4000001; skew-y: -3.4000001; }
        frame 56 { x: 48; y: 113.800003; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 57 { x: 48.0999985; y: 113.699997; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 58 { x: 48.4000015; y: 113.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 47.9000015; y: 114; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 74 { x: 47.5; y: 114.599998; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 77 { x: 47.7000008; y: 114.400002; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 78 { x: 48; y: 114.199997; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 48.4000015; y: 113.5; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 81 { x: 48; y: 114; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 82 { x: 47.5999985; y: 114.400002; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 47.2999992; y: 114.800003; skew-x: -8.19999981; skew-y: -8.19999981; }
        frame 84 { x: 47; y: 115.300003; skew-x: -11.1999998; skew-y: -11.1999998; }
        frame 85 { x: 45.2999992; y: 114.800003; skew-x: -20.5; skew-y: -20.5; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 86 { x: 44.2000008; y: 114.199997; skew-x: -30; skew-y: -30; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 87 { x: 43.5; y: 113.599998; skew-x: -39.2999992; skew-y: -39.2999992; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: -10000; y: 112.800003; skew-x: -48.7000008; skew-y: -48.7000008; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 89 { x: 49; y: 102.400002; skew-x: -95.6999969; skew-y: -95.6999969; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 90 { x: 58.7000008; y: 80.3000031; skew-x: -142.800003; skew-y: -142.800003; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 91 { x: 55.0999985; y: 76.8000031; skew-x: -151.600006; skew-y: -151.600006; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 92 { x: 51.4000015; y: 73; skew-x: -160.300003; skew-y: -160.300003; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 47.2999992; y: 68.8000031; skew-x: -169.100006; skew-y: -169.100006; }
        frame 94 { x: 43; y: 64.5999985; skew-x: -177.600006; skew-y: -177.600006; }
        frame 95 { x: 45; y: 106; skew-x: -148; skew-y: -148; scale-x: 0.736000001; scale-y: 0.736000001; }
        frame 96 { x: 44.2999992; y: 143.199997; skew-x: -118.199997; skew-y: -118.199997; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 97 { x: 45.5; y: 143.5; skew-x: -119; skew-y: -117.199997; scale-x: 0.723999977; scale-y: 0.739000022; }
        frame 98 { x: 46.5999985; y: 143.800003; skew-x: -120; skew-y: -116.5; scale-x: 0.717999995; scale-y: 0.746999979; }
        frame 99 { x: 46.7000008; y: 141.899994; skew-x: -122.699997; skew-y: -121; scale-x: 0.723999977; scale-y: 0.739000022; }
        frame 100 { x: 46.7999992; y: 140; skew-x: -125.300003; skew-y: -125.300003; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 101 { x: 47.7000008; y: 140.899994; skew-x: -128.199997; skew-y: -128.199997; scale-x: 0.731999993; scale-y: 0.731999993; }
        frame 102 { x: 48.7000008; y: 141.899994; skew-x: -131.100006; skew-y: -131.100006; scale-x: 0.73299998; scale-y: 0.73299998; }
    }
    Track {
        source-name: "zombie_jackbox_outerleg_lower";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 57.5999985; y: 92.8000031; scale-x: 0.748000026; scale-y: 0.748000026; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERLEG_LOWER; }
        frame 14 { x: 57.4000015; y: -10000; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 57; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 16 { x: 56.4000015; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 17 { x: 54.5999985; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 53.7999992; y: 92.9000015; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 19 { x: 53.0999985; y: 93; skew-x: -6.69999981; skew-y: -6.69999981; }
        frame 20 { x: 53; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 21 { x: 52.9000015; skew-x: -7.19999981; skew-y: -7.19999981; }
        frame 22 { x: 53.5; skew-x: -6.19999981; skew-y: -6.19999981; }
        frame 23 { x: 54; y: 92.9000015; skew-x: -5.19999981; skew-y: -5.19999981; }
        frame 24 { x: 54.5999985; y: 92.8000031; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 25 { x: 55.2999992; y: 92.9000015; skew-x: -3.4000001; skew-y: -3.4000001; }
        frame 26 { x: 55.9000015; y: 92.8000031; skew-x: -2.4000001; skew-y: -2.4000001; }
        frame 27 { x: 56.5; y: -10000; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 28 { x: 57.0999985; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 29 { x: 57.5999985; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 30 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 56.2000008; y: 93.9000015; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 32 { x: 55.2000008; y: 93.0999985; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 54.2999992; y: 92.3000031; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 34 { x: 53.2000008; y: 91.6999969; skew-x: -4.9000001; skew-y: -4.9000001; }
        frame 35 { x: 52; y: 89.5999985; skew-x: 1.70000005; skew-y: 1.70000005; }
        frame 36 { x: 51; y: 87.8000031; skew-x: 8.5; skew-y: 8.5; }
        frame 37 { x: 49.5; y: 89.8000031; skew-x: 4.80000019; skew-y: 4.80000019; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 38 { x: 48.2000008; y: 91.8000031; skew-x: 1.20000005; skew-y: 1.20000005; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 46.5999985; y: 92.4000015; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 40 { x: 48.4000015; y: 91.6999969; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 41 { x: 50; y: 91.0999985; skew-x: 0.5; skew-y: 0.5; }
        frame 42 { x: 51.5999985; y: 90.3000031; skew-x: 2.70000005; skew-y: 2.70000005; }
        frame 43 { x: 53.5999985; y: 90.0999985; skew-x: 4.5999999; skew-y: 4.5999999; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 44 { x: 56; y: 89.6999969; skew-x: 6.69999981; skew-y: 6.69999981; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 56.5; y: 89.3000031; skew-x: 8; skew-y: 8; }
        frame 46 { x: 57.0999985; y: 89; skew-x: 9.30000019; skew-y: 9.30000019; }
        frame 47 { x: 57.2999992; y: 90.8000031; skew-x: 4.5; skew-y: 4.5; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 48 { x: 57.5999985; y: 92.8000031; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 58; y: 92.5; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 51 { x: 58.4000015; y: 92.0999985; skew-x: 1.5; skew-y: 1.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 52 { x: 58.9000015; y: 91.6999969; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 59.2999992; y: 91.4000015; skew-x: 3.29999995; skew-y: 3.29999995; }
        frame 54 { x: 59.7000008; y: 91; skew-x: 4.19999981; skew-y: 4.19999981; }
        frame 55 { x: 58.2000008; y: 91.6999969; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 56 { x: 56.9000015; y: 92.4000015; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 57 { x: 55.5; y: 93.1999969; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 58 { x: 54.0999985; y: 94.0999985; skew-x: -7.4000001; skew-y: -7.4000001; }
        frame 59 { x: 54.7999992; y: 93.8000031; skew-x: -5.9000001; skew-y: -5.9000001; }
        frame 60 { x: 55.5; y: 93.5; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 61 { x: 56.2999992; y: 93.3000031; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 62 { x: 57; y: 93.0999985; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 63 { x: 57.5999985; y: 92.8000031; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 58.5; y: 90.6999969; skew-x: 4; skew-y: 4; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 74 { x: 59.5; y: 88.5; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 77 { x: 59.2999992; y: 89.4000015; skew-x: 6.0999999; skew-y: 6.0999999; }
        frame 78 { x: 59.0999985; y: 90.3000031; skew-x: 4.5; skew-y: 4.5; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 57.5999985; y: 92.8000031; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 81 { x: 55; y: 92.9000015; skew-x: -4; skew-y: -4; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 82 { x: 52.2999992; y: 93; skew-x: -8.19999981; skew-y: -8.19999981; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 49.5999985; y: 93.1999969; skew-x: -12.3999996; skew-y: -12.3999996; }
        frame 84 { x: 47.2999992; y: 93.5; skew-x: -16.7000008; skew-y: -16.7000008; }
        frame 85 { x: 42.7999992; y: 93; skew-x: -25.2000008; skew-y: -25.2000008; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 86 { x: 38.5999985; y: 92.5999985; skew-x: -33.7000008; skew-y: -33.7000008; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 87 { x: 35.0999985; y: 92.3000031; skew-x: -42.2999992; skew-y: -42.2999992; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 32; y: 92.1999969; skew-x: -50.7999992; skew-y: -50.7999992; }
        frame 89 { x: 26.6000004; y: 93.5; skew-x: -86.3000031; skew-y: -86.3000031; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 90 { x: 27.7999992; y: 88.5; skew-x: -121.5; skew-y: -121.5; scale-x: 0.741999984; scale-y: 0.741999984; }
        frame 91 { x: 26.3999996; y: 89.4000015; skew-x: -131; skew-y: -131; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 92 { x: 25; y: 89.5999985; skew-x: -140.5; skew-y: -140.5; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 23.3999996; y: 89.0999985; skew-x: -150.100006; skew-y: -150.100006; }
        frame 94 { x: 21.7999992; y: 88.3000031; skew-x: -159.5; skew-y: -159.5; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 95 { x: 15.3000002; y: 114.099998; skew-x: -119.5; skew-y: -119.5; scale-x: 0.736000001; scale-y: 0.736000001; }
        frame 96 { x: 11.8999996; y: 128.800003; skew-x: -79.6999969; skew-y: -79.6999969; scale-x: 0.734000027; scale-y: 0.734000027; }
        frame 97 { x: 12.5; y: 129.300003; skew-x: -79.4000015; skew-y: -80.0999985; scale-x: 0.720000029; scale-y: 0.745000005; }
        frame 98 { x: 13.1000004; y: 129.899994; skew-x: -79; skew-y: -80.5; scale-x: 0.707000017; scale-y: 0.758000016; }
        frame 99 { x: 12.8999996; y: 129.800003; skew-x: -82.9000015; skew-y: -83.5999985; scale-x: 0.720000029; scale-y: 0.745000005; }
        frame 100 { x: 12.8000002; y: 129.600006; skew-x: -86.8000031; skew-y: -86.8000031; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 101 { x: 12.1999998; y: 129.800003; skew-x: -83.4000015; skew-y: -83.4000015; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 11.6000004; y: -10000; skew-x: -79.8000031; skew-y: -79.8000031; }
    }
    Track {
        source-name: "zombie_jackbox_outerleg_upper";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 56.4000015; y: 73.5; scale-x: 0.748000026; scale-y: 0.748000026; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERLEG_UPPER; }
        frame 14 { x: 56.5; y: -10000; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.746999979; scale-y: 0.746999979; cel: -10000; image: none; }
        frame 15 { x: -10000; y: 73.3000031; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 56.5999985; y: 73; skew-x: 3; skew-y: 3; }
        frame 17 { x: 57.0999985; y: 72.3000031; skew-x: 7.5; skew-y: 7.5; }
        frame 18 { x: 57.4000015; y: 72; skew-x: 9.80000019; skew-y: 9.80000019; }
        frame 19 { x: 57.5; y: 71.6999969; skew-x: 11.3000002; skew-y: 11.3000002; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 20 { x: -10000; y: -10000; skew-x: 11.5; skew-y: 11.5; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 71.5999985; skew-x: 12.3000002; skew-y: 12.3000002; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 22 { x: 57.4000015; y: 71.9000015; skew-x: 10.6000004; skew-y: 10.6000004; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 23 { x: 57.0999985; y: 72.0999985; skew-x: 9.10000038; skew-y: 9.10000038; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 24 { x: 57; y: 72.3000031; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 56.9000015; y: 72.5; skew-x: 6; skew-y: 6; }
        frame 26 { x: 56.7999992; y: 72.8000031; skew-x: 4.5; skew-y: 4.5; }
        frame 27 { x: 56.5; y: 73; skew-x: 3; skew-y: 3; }
        frame 28 { x: -10000; y: 73.3000031; skew-x: 1.5; skew-y: 1.5; }
        frame 29 { x: 56.4000015; y: 73.5; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 57.4000015; y: 73.3000031; skew-x: 6; skew-y: 6; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 32 { x: 57.5; y: 72.0999985; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 57.7000008; y: 70.9000015; skew-x: 10.3000002; skew-y: 10.3000002; }
        frame 34 { x: 57.9000015; y: 69.8000031; skew-x: 12.3999996; skew-y: 12.3999996; }
        frame 35 { x: 58.5999985; y: 68.8000031; skew-x: 18.6000004; skew-y: 18.6000004; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 36 { x: 59.5; y: 67.8000031; skew-x: 25.1000004; skew-y: 25.1000004; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 58.2999992; y: 69.5999985; skew-x: 23.7999992; skew-y: 23.7999992; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 38 { x: 57.0999985; y: 71.4000015; skew-x: 22.7999992; skew-y: 22.7999992; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 59; y: 70.6999969; skew-x: 28.8999996; skew-y: 28.8999996; scale-x: 0.744000018; scale-y: 0.76700002; }
        frame 40 { y: 70.1999969; skew-x: 26.1000004; skew-y: 26.1000004; scale-x: 0.742999971; scale-y: 0.765999973; }
        frame 41 { x: -10000; y: 69.5999985; skew-x: 23.2999992; skew-y: 23.2999992; scale-x: -10000; scale-y: -10000; }
        frame 42 { y: 69.0999985; skew-x: 20.6000004; skew-y: 20.6000004; scale-x: 0.744000018; scale-y: 0.76700002; }
        frame 43 { x: 58.4000015; y: 69.5999985; skew-x: 14.8000002; skew-y: 14.8000002; scale-x: 0.742999971; scale-y: 0.765999973; }
        frame 44 { x: 57.7999992; y: 70.1999969; skew-x: 9.10000038; skew-y: 9.10000038; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 56.9000015; y: 70.0999985; skew-x: 5.80000019; skew-y: 5.80000019; }
        frame 46 { x: 56.0999985; y: 69.9000015; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 47 { x: 56.2999992; y: 71.8000031; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.745000005; scale-y: 0.757000029; }
        frame 48 { x: 56.4000015; y: 73.5; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 56.7999992; y: 73.1999969; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 51 { x: 57; y: 72.8000031; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 52 { x: 57.4000015; y: 72.5; skew-x: 1.10000002; skew-y: 1.10000002; }
        frame 53 { x: 57.7999992; y: 72.0999985; skew-x: 1.5; skew-y: 1.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 54 { x: 58.0999985; y: 71.6999969; skew-x: 2; skew-y: 2; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 55 { x: 57.7999992; y: 71.8000031; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 56 { x: 57.5999985; y: -10000; skew-x: 6.30000019; skew-y: 6.30000019; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 57.4000015; y: 72; skew-x: 8.5; skew-y: 8.5; }
        frame 58 { x: 57.0999985; skew-x: 10.8000002; skew-y: 10.8000002; }
        frame 59 { x: 57; y: 72.3000031; skew-x: 8.5; skew-y: 8.5; }
        frame 60 { x: 56.7999992; y: 72.5999985; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 61 { x: 56.7000008; y: 72.8000031; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 62 { x: 56.5; y: 73.1999969; skew-x: 2; skew-y: 2; }
        frame 63 { x: 56.4000015; y: 73.5; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 58; y: 71.1999969; skew-x: 3.5; skew-y: 3.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 74 { x: 59.5; y: 68.6999969; skew-x: 7.0999999; skew-y: 7.0999999; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 59.4000015; y: -10000; skew-x: 7; skew-y: 7; }
        frame 76 { x: 59.5; skew-x: 7.0999999; skew-y: 7.0999999; }
        frame 77 { x: 59.4000015; y: 69.5999985; skew-x: 7; skew-y: 7; }
        frame 78 { x: 59.5; y: 70.5; skew-x: 7.0999999; skew-y: 7.0999999; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 56.4000015; y: 73.5; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 81 { x: 53.0999985; y: 73.3000031; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 82 { x: 49.9000015; y: 73.1999969; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 46.5999985; y: 73; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 84 { x: 43.0999985; y: 72.8000031; skew-x: -7.9000001; skew-y: -7.9000001; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 37.5; y: 72.6999969; skew-x: -12.6999998; skew-y: -12.6999998; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 86 { x: 32; y: 72.5; skew-x: -17.3999996; skew-y: -17.3999996; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 26.5; y: 72.4000015; skew-x: -22.2000008; skew-y: -22.2000008; }
        frame 88 { x: 21.1000004; y: 72.3000031; skew-x: -27; skew-y: -27; }
        frame 89 { x: 10.1999998; y: 79.1999969; skew-x: -57.2999992; skew-y: -57.2999992; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 90 { x: 3.5999999; y: 85.9000015; skew-x: -87.4000015; skew-y: -87.4000015; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 2.5; y: 89.6999969; skew-x: -95.4000015; skew-y: -95.4000015; scale-x: 0.741999984; scale-y: 0.741999984; }
        frame 92 { x: 1.5; y: 93.1999969; skew-x: -103.5; skew-y: -103.5; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 0.800000012; y: 96.5999985; skew-x: -111.699997; skew-y: -111.699997; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 94 { x: 0.300000012; y: 99.5; skew-x: -119.900002; skew-y: -119.900002; scale-x: 0.741999984; scale-y: 0.741999984; }
        frame 95 { x: -5.4000001; y: 103.300003; skew-x: -74.0999985; skew-y: -74.0999985; scale-x: 0.739000022; scale-y: 0.782000005; }
        frame 96 { x: -1.20000005; y: 103; skew-x: -28.2999992; skew-y: -28.2999992; scale-x: 0.737999976; scale-y: 0.824999988; }
        frame 97 { x: -0.800000012; y: 104.099998; skew-x: -27.5; skew-y: -29.2000008; scale-x: 0.744000018; scale-y: 0.814999998; }
        frame 98 { x: -0.5; y: 105.099998; skew-x: -26.6000004; skew-y: -30.1000004; scale-x: 0.751999974; scale-y: 0.806999981; }
        frame 99 { x: -0.899999976; y: 104; skew-x: -27.5; skew-y: -29.2000008; scale-x: 0.744000018; scale-y: 0.814999998; }
        frame 100 { x: -1.20000005; y: 103; skew-x: -28.2999992; skew-y: -28.2999992; scale-x: 0.737999976; scale-y: 0.824999988; }
        frame 101 { x: -10000; y: 102.900002; skew-x: -28.2000008; skew-y: -28.2000008; scale-x: 0.736999989; scale-y: 0.823000014; }
        frame 102 { y: 103; skew-x: -28.2999992; skew-y: -28.2999992; scale-x: 0.737999976; scale-y: 0.824999988; }
    }
    Track {
        source-name: "Zombie_jackbox_innerarm_upper";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 15.8000002; y: 33.4000015; skew-x: 2.0999999; skew-y: 2.0999999; scale-x: 0.814999998; scale-y: 0.757000029; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_INNERARM_UPPER; }
        frame 14 { x: 16.5; y: 32.4000015; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.81400001; scale-y: 0.755999982; cel: -10000; image: none; }
        frame 15 { x: 12.8999996; y: 36; skew-x: -2.5999999; skew-y: -2.5999999; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 17 { x: 12; y: 37.0999985; skew-x: -3.4000001; skew-y: -3.4000001; }
        frame 18 { x: 14.3999996; y: 33.4000015; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 19 { x: 12.6999998; y: 36.0999985; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 20 { x: 14.6000004; y: 32.5999985; skew-x: 0.699999988; skew-y: 0.699999988; }
        frame 21 { x: 12.6999998; y: 37.2999992; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 22 { x: 12.3999996; y: 37.4000015; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 23 { x: 12; y: -10000; skew-x: -5.19999981; skew-y: -5.19999981; }
        frame 24 { x: 12.5; y: 36.5999985; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 25 { x: 13.3000002; y: 35.9000015; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 26 { x: 13.8999996; y: 35.2999992; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 27 { x: 14.5; y: 34.5999985; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: 0.814999998; scale-y: 0.757000029; }
        frame 28 { x: 15.1000004; y: 33.9000015; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 15.8000002; y: 33.4000015; skew-x: 2.0999999; skew-y: 2.0999999; }
        frame 30 { x: 21.3999996; y: 26.3999996; skew-x: 10.1000004; skew-y: 10.1000004; scale-x: 0.81400001; scale-y: 0.755999982; }
        frame 31 { x: 21.1000004; y: 28.1000004; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 20.7999992; y: 27.7000008; skew-x: 9.5; skew-y: 9.5; }
        frame 33 { x: 20.6000004; y: 34.2999992; skew-x: -11.3000002; skew-y: -11.3999996; scale-x: 0.811999977; scale-y: 0.754000008; }
        frame 34 { x: 25.3999996; y: 43.4000015; skew-x: -43.7999992; skew-y: -43.7999992; scale-x: 0.813000023; scale-y: 0.754999995; }
        frame 35 { x: 31.7999992; y: 32.7000008; skew-x: -16.2000008; skew-y: -16.2000008; scale-x: 0.811999977; scale-y: 0.754000008; }
        frame 36 { x: 38.2999992; y: 24.2999992; skew-x: 11; skew-y: 11; scale-x: 0.813000023; scale-y: 0.754999995; }
        frame 37 { x: 36.5; y: 26.6000004; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 27.3999996; y: 25; skew-x: 20.1000004; skew-y: 20.1000004; }
        frame 39 { x: 19.2000008; y: 34; skew-x: 9.5; skew-y: 9.5; scale-x: 0.811999977; scale-y: 0.754000008; }
        frame 40 { x: 24.3999996; y: 29.2000008; skew-x: 19.2000008; skew-y: 21.2999992; scale-x: -10000; scale-y: 0.754999995; }
        frame 41 { x: 20.1000004; y: 32.2999992; skew-x: 3.29999995; skew-y: 4.69999981; scale-x: 0.813000023; scale-y: 0.754000008; }
        frame 42 { x: 24.2999992; y: 31.2999992; skew-x: 0.800000012; skew-y: -0.200000003; scale-x: 0.824999988; scale-y: 0.745999992; }
        frame 43 { x: 25; y: 42.5; skew-x: -36.2999992; skew-y: -36.7999992; scale-x: 0.816999972; scale-y: 0.749000013; }
        frame 44 { x: 30.6000004; y: 33; skew-x: -15.6999998; skew-y: -15.6999998; scale-x: 0.813000023; scale-y: 0.754999995; }
        frame 45 { x: 34.0999985; y: 28.2999992; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 28.8999996; y: 38.5; skew-x: -32; skew-y: -32; scale-x: 0.811999977; scale-y: 0.754000008; }
        frame 47 { x: 25.6000004; y: 20.7000008; skew-x: 11.1000004; skew-y: 11.1000004; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 21.3999996; y: 26.3999996; skew-x: 10.1000004; skew-y: 10.1000004; scale-x: 0.81400001; scale-y: 0.755999982; }
        frame 49 { x: 11.8000002; y: 38; skew-x: -3.0999999; skew-y: -3.0999999; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 18; y: 35.9000015; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.809000015; scale-y: 0.751999974; }
        frame 51 { x: 19.8999996; y: 35.5; skew-x: -15.6000004; skew-y: -15.6000004; scale-x: 0.81099999; scale-y: 0.753000021; }
        frame 52 { x: 29.7999992; y: 35.2000008; skew-x: -16.2000008; skew-y: -16.2000008; scale-x: 0.809000015; scale-y: 0.751999974; }
        frame 53 { x: 42.4000015; y: 22.7999992; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: 0.813000023; scale-y: 0.754999995; }
        frame 54 { x: 36.4000015; y: 31.3999996; skew-x: -16.5; skew-y: -16.5; scale-x: 0.811999977; scale-y: 0.754000008; }
        frame 55 { x: 27.6000004; y: 23.5; skew-x: 9.80000019; skew-y: 9.80000019; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 18.7000008; y: 32.5999985; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.81099999; scale-y: 0.753000021; }
        frame 57 { x: 22.5; y: 35.5; skew-x: 13.3000002; skew-y: 17; scale-x: 0.810000002; scale-y: 0.809000015; }
        frame 58 { x: 11.3999996; y: 47.5; skew-x: -24.3999996; skew-y: -24.3999996; scale-x: 0.811999977; scale-y: 0.754000008; }
        frame 59 { x: 14.8999996; y: 47; skew-x: -36.2000008; skew-y: -36.2000008; scale-x: 0.81099999; scale-y: 0.753000021; }
        frame 60 { x: 22.3999996; y: 42; skew-x: -23.3999996; skew-y: -23.3999996; scale-x: -10000; scale-y: 0.754000008; }
        frame 61 { x: 27.2999992; y: 37.2999992; skew-x: -10.5; skew-y: -10.5; scale-x: 0.813000023; scale-y: 0.754999995; }
        frame 62 { x: 22.2000008; y: 31.2000008; skew-x: 12.8000002; skew-y: 12.8000002; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 15.8000002; y: 33.4000015; skew-x: 2.0999999; skew-y: 2.0999999; scale-x: 0.814999998; scale-y: 0.757000029; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 18; y: 34; skew-x: 15; skew-y: 15; scale-x: 0.813000023; scale-y: 0.754999995; }
        frame 66 { x: 17.7000008; y: 34.2000008; skew-x: 14.8000002; skew-y: 14.8000002; scale-x: 0.811999977; scale-y: 0.768000007; }
        frame 67 { x: 18.7999992; y: 33.4000015; skew-x: 14.5; skew-y: 14.5; scale-x: 0.81099999; scale-y: 0.782000005; }
        frame 68 { x: 20; y: 32.7999992; skew-x: 14.3000002; skew-y: 14.3000002; scale-x: 0.811999977; scale-y: 0.796000004; }
        frame 69 { x: 21.1000004; y: 32.0999985; skew-x: 14.1000004; skew-y: 14.1000004; scale-x: -10000; scale-y: 0.81099999; }
        frame 70 { x: 20.2000008; y: 32.5; skew-x: 11.8000002; skew-y: 11.8000002; scale-y: 0.791000009; }
        frame 71 { x: 19.5; y: 32.9000015; skew-x: 9.60000038; skew-y: 9.60000038; scale-y: 0.773000002; }
        frame 72 { x: 18.7999992; y: 33.0999985; skew-x: 7.5999999; skew-y: 7.5999999; scale-x: 0.813000023; scale-y: 0.754999995; }
        frame 73 { x: 27.5; y: 26.3999996; skew-x: 15.5; skew-y: 15.5; scale-x: 0.811999977; scale-y: 0.754000008; }
        frame 74 { x: 36.2999992; y: 19.8999996; skew-x: 23.7000008; skew-y: 23.7000008; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 37.5; y: 19.3999996; skew-x: 24.7999992; skew-y: 24.7999992; scale-x: 0.81099999; scale-y: 0.753000021; }
        frame 76 { x: 38.7999992; y: 18.7999992; skew-x: 26.2000008; skew-y: 26.2000008; scale-x: 0.811999977; scale-y: 0.754000008; }
        frame 77 { x: -10000; y: 19.7999992; skew-x: 26.1000004; skew-y: 26.1000004; scale-x: 0.81099999; scale-y: 0.753000021; }
        frame 78 { y: 20.6000004; skew-x: 26.2000008; skew-y: 26.2000008; scale-x: 0.811999977; scale-y: 0.754000008; }
        frame 79 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 20.1000004; y: 31.7999992; skew-x: 8.10000038; skew-y: 8.10000038; scale-x: 0.81400001; scale-y: 0.755999982; }
        frame 81 { x: 12.6999998; y: 38.2000008; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 5.5; y: 44.7999992; skew-x: -5.9000001; skew-y: -5.9000001; }
        frame 83 { x: -1.29999995; y: 51.5999985; skew-x: -12.8999996; skew-y: -12.8999996; scale-x: 0.813000023; scale-y: 0.754999995; }
        frame 84 { x: -7.80000019; y: 58.7999992; skew-x: -20.1000004; skew-y: -20.1000004; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: -11.1999998; y: 52.9000015; skew-x: 0; skew-y: 0; scale-x: 0.811999977; scale-y: 0.754000008; }
        frame 86 { x: -12.6999998; y: 48.7999992; skew-x: 19.7999992; skew-y: 19.7999992; scale-x: 0.81099999; scale-y: 0.753000021; }
        frame 87 { x: -12.8999996; y: 47.0999985; skew-x: 39.9000015; skew-y: 39.9000015; scale-x: 0.809000015; scale-y: 0.751999974; }
        frame 88 { x: -10000; y: 48; skew-x: 59.9000015; skew-y: 59.9000015; scale-x: 0.810000002; scale-y: -10000; }
        frame 89 { x: -25.7999992; y: 64.9000015; skew-x: 50.9000015; skew-y: 50.9000015; scale-x: 0.806999981; scale-y: 0.749000013; }
        frame 90 { x: -38.9000015; y: 82.1999969; skew-x: 41.5999985; skew-y: 41.5999985; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -41.5999985; y: 86.0999985; skew-x: 40.9000015; skew-y: 40.9000015; scale-x: 0.805000007; scale-y: 0.748000026; }
        frame 92 { x: -44.2999992; y: 89.9000015; skew-x: 40.0999985; skew-y: 40.0999985; scale-x: 0.805999994; scale-y: -10000; }
        frame 93 { x: -47.0999985; y: 93.8000031; skew-x: 39.0999985; skew-y: 39.0999985; scale-x: -10000; }
        frame 94 { x: -50; y: 97.8000031; skew-x: 38.4000015; skew-y: 38.4000015; scale-x: 0.806999981; scale-y: 0.75; }
        frame 95 { x: -50.7000008; y: 98.5999985; skew-x: 43.5999985; skew-y: 46.2000008; scale-x: 0.815999985; scale-y: -10000; }
        frame 96 { x: -51.5; y: 99.5999985; skew-x: 49; skew-y: 54; scale-x: 0.828000009; scale-y: 0.754000008; }
        frame 97 { x: -52; y: 100.800003; skew-x: 47.9000015; skew-y: 55.0999985; scale-x: 0.824999988; scale-y: 0.755999982; }
        frame 98 { x: -52.5; y: 101.800003; skew-x: 46.9000015; skew-y: 56; scale-x: 0.824000001; scale-y: 0.762000024; }
        frame 99 { x: -51.9000015; y: 100.699997; skew-x: 47.9000015; skew-y: 55.0999985; scale-x: 0.824999988; scale-y: 0.755999982; }
        frame 100 { x: -51.5; y: 99.5999985; skew-x: 49; skew-y: 54; scale-x: 0.828000009; scale-y: 0.754000008; }
        frame 101 { x: -10000; y: 99.6999969; skew-x: 48.9000015; skew-y: 54.0999985; scale-x: 0.827000022; scale-y: 0.751999974; }
        frame 102 { y: 99.5999985; skew-x: 49; skew-y: 54; scale-x: 0.828000009; scale-y: 0.754000008; }
    }
    Track {
        source-name: "Zombie_jackbox_innerarm_lower";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: -12; y: 44.5; scale-x: 0.774999976; scale-y: 0.748000026; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_INNERARM_LOWER; }
        frame 14 { x: -11.5; y: 43.2999992; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: 0.746999979; cel: -10000; image: none; }
        frame 15 { x: -13.8000002; y: 49.2999992; skew-x: -4.5; skew-y: -4.5; scale-y: -10000; }
        frame 16 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 17 { x: -14.6000004; y: 50.9000015; skew-x: -5.4000001; skew-y: -5.4000001; }
        frame 18 { x: -13; y: 45.5999985; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.773999989; }
        frame 19 { x: -14; y: 49.9000015; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: -10000; }
        frame 20 { x: -12.8999996; y: 44.5; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 21 { x: -14.1000004; y: 50.7999992; skew-x: -4.9000001; skew-y: -4.9000001; scale-x: 0.774999976; }
        frame 22 { x: -10000; y: 51.5; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: -10000; }
        frame 23 { y: 52.2000008; skew-x: -7.4000001; skew-y: -7.4000001; }
        frame 24 { x: -13.8000002; y: 50.9000015; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: 0.773999989; }
        frame 25 { x: -13.3999996; y: 49.5999985; skew-x: -4.9000001; skew-y: -4.9000001; scale-x: 0.774999976; }
        frame 26 { x: -13; y: 48.2999992; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: -10000; }
        frame 27 { x: -12.8000002; y: 47; skew-x: -2.4000001; skew-y: -2.4000001; }
        frame 28 { x: -12.3999996; y: 45.7000008; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 29 { x: -12; y: 44.5; skew-x: 0; skew-y: 0; scale-y: 0.748000026; }
        frame 30 { x: -7.80000019; y: 33.4000015; skew-x: 8.10000038; skew-y: 8.10000038; scale-y: 0.746999979; }
        frame 31 { x: -8; y: 35.4000015; skew-x: 7.30000019; skew-y: 7.30000019; scale-y: -10000; }
        frame 32 { x: -10.1999998; y: 56.0999985; skew-x: -29.2999992; skew-y: -29.2999992; scale-x: 0.773000002; scale-y: 0.745000005; }
        frame 33 { x: -2.9000001; y: 59.0999985; skew-x: -27; skew-y: -27; scale-x: 0.772000015; scale-y: -10000; }
        frame 34 { x: 5.30000019; y: 58.2999992; skew-x: -31.7999992; skew-y: -31.7999992; scale-x: 0.773000002; }
        frame 35 { x: 13.6999998; y: 39.4000015; skew-x: 2.20000005; skew-y: 2.20000005; scale-x: 0.772000015; }
        frame 36 { x: 15; y: 28; skew-x: 13.5; skew-y: 13.5; scale-x: 0.773999989; scale-y: 0.745999992; }
        frame 37 { x: 10.1999998; y: 25.7000008; skew-x: 24.1000004; skew-y: 24.1000004; scale-x: 0.772000015; scale-y: 0.744000018; }
        frame 38 { x: -2.5999999; y: 27; skew-x: 18.6000004; skew-y: 18.6000004; scale-x: 0.773000002; scale-y: 0.745999992; }
        frame 39 { x: -10; y: 41.5; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: 0.745000005; }
        frame 40 { x: -10.3999996; y: 38.5; skew-x: 3.5; skew-y: 3.5; scale-x: 0.805999994; scale-y: -10000; }
        frame 41 { x: -10.6000004; y: 53.7000008; skew-x: -17; skew-y: -17; scale-x: 0.815999985; }
        frame 42 { x: -3.20000005; y: 61.4000015; skew-x: -32.5; skew-y: -32.5; scale-x: 0.808000028; scale-y: 0.745999992; }
        frame 43 { x: 4.80000019; y: 58.7999992; skew-x: -29; skew-y: -29; scale-x: 0.790000021; scale-y: 0.745000005; }
        frame 44 { x: 12.1000004; y: 42.5999985; skew-x: -7.4000001; skew-y: -7.4000001; scale-x: 0.773999989; scale-y: 0.745999992; }
        frame 45 { x: 15.3999996; y: 27.8999996; skew-x: 14.8000002; skew-y: 14.8000002; scale-x: 0.772000015; scale-y: 0.745000005; }
        frame 46 { x: 8.30000019; y: 22.6000004; skew-x: 14.3000002; skew-y: 14.3000002; scale-x: 0.773999989; scale-y: 0.745999992; }
        frame 47 { x: -3.4000001; y: 25.7999992; skew-x: 11.1000004; skew-y: 11.1000004; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: -7.80000019; y: 33.4000015; skew-x: 8.10000038; skew-y: 8.10000038; scale-x: 0.774999976; scale-y: 0.746999979; }
        frame 49 { x: -14.8999996; y: 51.5999985; skew-x: -5.0999999; skew-y: -5.0999999; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: -9.69999981; y: 58.7000008; skew-x: -19.8999996; skew-y: -19.8999996; scale-x: 0.772000015; scale-y: 0.745000005; }
        frame 51 { x: -0.400000006; y: 68; skew-x: -40.5; skew-y: -40.5; scale-x: 0.768999994; scale-y: 0.741999984; }
        frame 52 { x: 15.1000004; y: 50.0999985; skew-x: -20.3999996; skew-y: -20.3999996; scale-x: 0.768000007; scale-y: 0.740999997; }
        frame 53 { x: 19; y: 32.4000015; skew-x: 6.0999999; skew-y: 6.0999999; scale-x: 0.771000028; scale-y: 0.742999971; }
        frame 54 { x: 13.1000004; y: 25.5; skew-x: 6.30000019; skew-y: 6.30000019; scale-x: 0.772000015; scale-y: 0.745000005; }
        frame 55 { x: 0.699999988; y: 30.3999996; skew-x: 9; skew-y: 9; scale-x: 0.771000028; scale-y: 0.744000018; }
        frame 56 { x: -7.69999981; y: 42.7000008; skew-x: 0.699999988; skew-y: 0.699999988; scale-x: 0.772000015; scale-y: 0.745000005; }
        frame 57 { x: -9.60000038; y: 70.1999969; skew-x: -38; skew-y: -38; scale-x: 0.823000014; scale-y: 0.745999992; }
        frame 58 { x: -7.19999981; y: 75.3000031; skew-x: -36; skew-y: -36; scale-x: 0.772000015; scale-y: 0.745000005; }
        frame 59 { x: 0.699999988; y: 74.0999985; skew-x: -40.5; skew-y: -40.5; scale-x: 0.769999981; scale-y: 0.742999971; }
        frame 60 { x: 8.80000019; y: 43.2000008; skew-x: 2.5; skew-y: 2.5; scale-x: 0.772000015; scale-y: 0.744000018; }
        frame 61 { x: 8; y: 33.5; skew-x: 19.6000004; skew-y: 19.6000004; scale-x: 0.773000002; scale-y: 0.745000005; }
        frame 62 { x: -6.5; y: 36.4000015; skew-x: 12.8000002; skew-y: 12.8000002; scale-x: -10000; scale-y: 0.745999992; }
        frame 63 { x: -12; y: 44.5; skew-x: 0; skew-y: 0; scale-x: 0.774999976; scale-y: 0.748000026; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -15.1000004; y: 47.7999992; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: 0.796999991; scale-y: 0.746999979; }
        frame 66 { x: -18; y: 51.4000015; skew-x: -7.9000001; skew-y: -7.9000001; scale-x: 0.818000019; scale-y: -10000; }
        frame 67 { x: -17.7000008; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.823000014; }
        frame 68 { x: -17.2999992; scale-x: 0.828000009; }
        frame 69 { x: -17; y: 51.2000008; scale-x: 0.833999991; }
        frame 70 { x: -10000; y: 51.0999985; scale-x: 0.81400001; }
        frame 71 { x: -16.8999996; y: -10000; scale-x: 0.79400003; }
        frame 72 { x: -10000; y: 51; scale-x: 0.773999989; }
        frame 73 { x: -16.7000008; y: 48; skew-x: -8.19999981; skew-y: -8.19999981; scale-x: -10000; scale-y: 0.745999992; }
        frame 74 { x: -16.6000004; y: 44.9000015; skew-x: -8.60000038; skew-y: -8.60000038; scale-x: 0.773000002; scale-y: -10000; }
        frame 75 { x: -14.8999996; y: 51.9000015; skew-x: -15.8999996; skew-y: -15.8999996; scale-x: 0.772000015; scale-y: 0.745000005; }
        frame 76 { x: -13; y: 59; skew-x: -23.2999992; skew-y: -23.2999992; scale-x: 0.773000002; scale-y: -10000; }
        frame 77 { x: -14.6000004; y: 59.5999985; skew-x: -26; skew-y: -26; scale-x: 0.771000028; scale-y: 0.744000018; }
        frame 78 { x: -16.3999996; y: 60.2999992; skew-x: -28.7999992; skew-y: -28.7999992; scale-x: 0.772000015; scale-y: 0.745000005; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: -12; y: 44.5; skew-x: 0; skew-y: 0; scale-x: 0.774999976; scale-y: 0.748000026; }
        frame 81 { x: -17.7000008; y: 44.5999985; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: 0.773999989; scale-y: 0.746999979; }
        frame 82 { x: -23.3999996; y: 44.7999992; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: -10000; scale-y: 0.745999992; }
        frame 83 { x: -28.8999996; y: 44.9000015; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 0.773000002; scale-y: 0.745000005; }
        frame 84 { x: -34.5; y: 45; skew-x: 7.80000019; skew-y: 7.80000019; scale-x: 0.772000015; scale-y: -10000; }
        frame 85 { x: -37.0999985; y: 41.0999985; skew-x: 17.1000004; skew-y: 17.1000004; scale-x: 0.771000028; scale-y: 0.744000018; }
        frame 86 { x: -39.5; y: 37.5999985; skew-x: 26.6000004; skew-y: 26.6000004; scale-x: 0.769999981; scale-y: 0.742999971; }
        frame 87 { x: -41.7999992; y: 34.7999992; skew-x: 35.9000015; skew-y: 35.9000015; scale-x: 0.768999994; scale-y: 0.741999984; }
        frame 88 { x: -43.7999992; y: 32.5; skew-x: 45.4000015; skew-y: 45.4000015; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -58.2999992; y: 54.9000015; skew-x: 36.0999985; skew-y: 36.0999985; scale-x: 0.76700002; scale-y: 0.74000001; }
        frame 90 { x: -72.8000031; y: 77.5; skew-x: 26.8999996; skew-y: 26.8999996; scale-x: -10000; scale-y: 0.739000022; }
        frame 91 { x: -72.5; y: 79; skew-x: 33.4000015; skew-y: 33.4000015; scale-x: 0.764999986; scale-y: 0.737999976; }
        frame 92 { x: -72.3000031; y: 80.8000031; skew-x: 40.0999985; skew-y: 40.0999985; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -71.9000015; y: 83; skew-x: 46.5999985; skew-y: 46.5999985; }
        frame 94 { x: -71.5999985; y: 85.5; skew-x: 53.2000008; skew-y: 53.2000008; scale-x: 0.765999973; scale-y: 0.739000022; }
        frame 95 { x: -82.3000031; y: 93.5; skew-x: 26.6000004; skew-y: 29.1000004; scale-x: -10000; scale-y: 0.748000026; }
        frame 96 { x: -91.5; y: 105.300003; skew-x: 0; skew-y: 5; scale-x: 0.76700002; scale-y: 0.759000003; }
        frame 97 { x: -92.8000031; y: 106.400002; skew-x: -10000; skew-y: -10000; scale-x: 0.781000018; scale-y: 0.745000005; }
        frame 98 { x: -94; y: 107.300003; skew-y: 5.4000001; scale-x: 0.79400003; scale-y: 0.731000006; }
        frame 99 { x: -91.1999969; y: 103.300003; skew-x: 5; skew-y: 10.3000002; scale-x: 0.779999971; scale-y: 0.744000018; }
        frame 100 { x: -88.0999985; y: 99.1999969; skew-x: 10.3000002; skew-y: 15.3000002; scale-x: 0.76700002; scale-y: 0.759000003; }
        frame 101 { x: -89; y: 100.900002; skew-x: 7.5; skew-y: 12.5; scale-x: 0.765999973; scale-y: 0.758000016; }
        frame 102 { x: -89.9000015; y: 102.5; skew-x: 4.69999981; skew-y: 9.80000019; scale-x: 0.76700002; scale-y: 0.759000003; }
    }
    Track {
        source-name: "Zombie_jackbox_body1";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 26.8999996; y: 27.2000008; scale-x: 0.748000026; scale-y: 0.748000026; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_BODY1; }
        frame 14 { x: 28.1000004; y: 26.3999996; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.746999979; scale-y: 0.746999979; cel: -10000; image: none; }
        frame 15 { x: 24.3999996; y: 28.6000004; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 26.5; y: 27.8999996; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 17 { x: 23.6000004; y: 30; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 18 { x: 26.7000008; y: 27; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 24.8999996; y: 29.1000004; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 20 { x: 27.5; y: 26.2999992; skew-x: 1.20000005; skew-y: 1.20000005; }
        frame 21 { x: 24.8999996; y: 30.3999996; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 22 { x: 25.2999992; y: 29.8999996; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.746999979; scale-y: 0.754999995; }
        frame 23 { x: 25.5; y: 29.5; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: -10000; scale-y: 0.762000024; }
        frame 24 { x: 25.7000008; y: 29; skew-x: -1.20000005; skew-y: -1.20000005; scale-y: 0.75999999; }
        frame 25 { x: 25.8999996; y: 28.6000004; skew-x: -0.899999976; skew-y: -0.899999976; scale-y: 0.757000029; }
        frame 26 { x: 26.2000008; y: 28.2999992; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.754999995; }
        frame 27 { x: 26.3999996; y: 27.8999996; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: 0.748000026; scale-y: 0.751999974; }
        frame 28 { x: 26.6000004; y: 27.5; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: -10000; scale-y: 0.75; }
        frame 29 { x: 26.8999996; y: 27.2000008; skew-x: 0; skew-y: 0; scale-y: 0.748000026; }
        frame 30 { x: 33.2999992; y: 21.7999992; skew-x: 8.10000038; skew-y: 8.10000038; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 31 { x: 32.9000015; y: 23.2999992; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: -10000; scale-y: 0.762000024; }
        frame 32 { x: 33; y: 22.3999996; skew-x: 7.5; skew-y: 7.5; scale-y: 0.757000029; }
        frame 33 { x: 33.0999985; y: 21.5; skew-x: 7.80000019; skew-y: 7.80000019; scale-y: 0.750999987; }
        frame 34 { x: 33.2999992; y: 20.6000004; skew-x: 8; skew-y: 8; scale-y: 0.746999979; }
        frame 35 { x: 33.5; y: 20.1000004; skew-x: 8.5; skew-y: 8.5; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 36 { x: 33.5999985; y: 19.5; skew-x: 9; skew-y: 9; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 37 { x: 33.4000015; y: 21.7999992; skew-x: 8.80000019; skew-y: 8.80000019; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 38 { x: 33.2000008; y: 24; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 23.1000004; y: 31.8999996; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.745000005; scale-y: 0.757000029; }
        frame 40 { x: 26.2999992; y: 28.3999996; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.745999992; scale-y: 0.754000008; }
        frame 41 { x: 29.8999996; y: 25.1000004; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: -10000; scale-y: 0.75; }
        frame 42 { x: 33.2999992; y: 21.7999992; skew-x: 8.10000038; skew-y: 8.10000038; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 43 { x: -10000; y: 21.2000008; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 44 { y: 20.6000004; skew-x: -10000; skew-y: -10000; }
        frame 45 { x: 33.5; y: 20.1000004; skew-x: 8.5; skew-y: 8.5; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 46 { x: 33.5999985; y: 19.5; skew-x: 9; skew-y: 9; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 47 { x: 33.5; y: 20.7000008; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 33.2999992; y: 21.7999992; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 49 { x: 22.2999992; y: 30.8999996; skew-x: -5.0999999; skew-y: -5.0999999; }
        frame 50 { x: 26.5; y: 27.6000004; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 51 { x: 30.7000008; y: 24.6000004; skew-x: 3; skew-y: 3; }
        frame 52 { x: 35.0999985; y: 21.7000008; skew-x: 7.30000019; skew-y: 7.30000019; }
        frame 53 { x: 39.5999985; y: 19.1000004; skew-x: 11.3000002; skew-y: 11.3000002; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 54 { x: 44.2999992; y: 16.3999996; skew-x: 15.6000004; skew-y: 15.6000004; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 55 { x: 38.0999985; y: 19.5; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 32.2000008; y: 22.8999996; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 57 { x: 26.5; y: 26.3999996; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 58 { x: 21; y: 30.5; skew-x: -6.69999981; skew-y: -6.69999981; }
        frame 59 { x: 22.5; y: 29.6000004; skew-x: -4.9000001; skew-y: -4.9000001; }
        frame 60 { x: 24; y: 28.6000004; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 61 { x: 25.5; y: 27.8999996; skew-x: -1.5; skew-y: -1.5; }
        frame 62 { x: 26.2000008; y: 27.6000004; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 63 { x: 26.8999996; y: 27.2000008; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 65 { x: 26; y: 27.5; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.746999979; scale-y: 0.754000008; }
        frame 66 { x: 25.1000004; y: 27.8999996; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: -10000; scale-y: 0.760999978; }
        frame 67 { x: 24; y: 28.2000008; skew-x: -3.20000005; skew-y: -3.20000005; scale-y: 0.768000007; }
        frame 68 { x: 25.5; y: 27.6000004; skew-x: -1.39999998; skew-y: -1.39999998; scale-y: 0.758000016; }
        frame 69 { x: 26.8999996; y: 27.2000008; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 36.0999985; y: 21.6000004; skew-x: 8; skew-y: 8; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 74 { x: 45.7999992; y: 16.5; skew-x: 16.1000004; skew-y: 16.1000004; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 47; y: 16.2000008; skew-x: 17.2999992; skew-y: 17.2999992; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 76 { x: 48.4000015; y: 15.8000002; skew-x: 18.6000004; skew-y: 18.6000004; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 77 { x: 47; y: 17.1000004; skew-x: 17.2999992; skew-y: 17.2999992; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 78 { x: 45.7999992; y: 18.2999992; skew-x: 16.1000004; skew-y: 16.1000004; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 26.8999996; y: 27.2000008; skew-x: 0; skew-y: 0; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 81 { x: 18.5; y: 32.5999985; skew-x: -6.9000001; skew-y: -6.9000001; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 82 { x: 10.5; y: 38.5999985; skew-x: -14; skew-y: -14; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 83 { x: 2.9000001; y: 44.9000015; skew-x: -21; skew-y: -21; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: -4; y: 51.5; skew-x: -28.2000008; skew-y: -28.2000008; }
        frame 85 { x: -11; y: 55.4000015; skew-x: -33; skew-y: -33; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 86 { x: -17.7000008; y: 59.5; skew-x: -37.7000008; skew-y: -37.7000008; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -24.1000004; y: 63.5999985; skew-x: -42.5; skew-y: -42.5; }
        frame 88 { x: -30.3999996; y: 67.5999985; skew-x: -47.2999992; skew-y: -47.2999992; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 89 { x: -40.2999992; y: 88.4000015; skew-x: -62.0999985; skew-y: -62.0999985; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 90 { x: -47.9000015; y: 108.800003; skew-x: -76.8000031; skew-y: -76.8000031; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -50.5999985; y: 112.099998; skew-x: -76.0999985; skew-y: -76.0999985; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 92 { x: -53.4000015; y: 115.300003; skew-x: -75.3000031; skew-y: -75.3000031; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -56.2000008; y: 118.5; skew-x: -74.4000015; skew-y: -74.4000015; }
        frame 94 { x: -58.7999992; y: 121.800003; skew-x: -73.5999985; skew-y: -73.5999985; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 95 { x: -59.0999985; y: 122.300003; skew-x: -72.9000015; skew-y: -74.3000031; scale-x: 0.734000027; scale-y: 0.763000011; }
        frame 96 { x: -59.5999985; y: 122.900002; skew-x: -72.0999985; skew-y: -74.9000015; scale-x: 0.726000011; scale-y: 0.783999979; }
        frame 97 { x: -60.0999985; y: 123.699997; skew-x: -71.5999985; skew-y: -75.5999985; scale-x: 0.713999987; scale-y: 0.796000004; }
        frame 98 { x: -60.9000015; y: 124.300003; skew-x: -70.8000031; skew-y: -75.9000015; scale-x: 0.703999996; scale-y: 0.808000028; }
        frame 99 { x: -60.0999985; y: 123; skew-x: -71.4000015; skew-y: -75.4000015; scale-x: 0.713999987; scale-y: 0.796000004; }
        frame 100 { x: -59.5999985; y: 121.699997; skew-x: -71.8000031; skew-y: -74.5999985; scale-x: 0.726000011; scale-y: 0.783999979; }
        frame 101 { x: -10000; y: 122.300003; skew-x: -72.0999985; skew-y: -74.9000015; scale-x: -10000; scale-y: -10000; }
        frame 102 { y: 122.900002; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 0.300000012; y: -1.39999998; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_HEAD; }
        frame 14 { x: 2.4000001; y: -3.20000005; skew-x: 1.70000005; skew-y: 1.70000005; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: -3.4000001; y: 1.10000002; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 16 { x: 0.5; y: -1.39999998; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 17 { x: -4.5; y: 3.20000005; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 18 { x: 0.100000001; y: -0.800000012; skew-x: 0.100000001; skew-y: 0.100000001; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 19 { x: -3.0999999; y: 2.79999995; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 1.10000002; y: -1.70000005; skew-x: 1.20000005; skew-y: 1.20000005; }
        frame 21 { x: -2.9000001; y: 3.9000001; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 22 { x: -3.20000005; y: 4.69999981; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -3.5; y: 5.5999999; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 24 { x: -2.9000001; y: 4.30000019; skew-x: -3.4000001; skew-y: -3.4000001; }
        frame 25 { x: -2.0999999; y: 3.0999999; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 26 { x: -1.5; y: 1.89999998; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 27 { x: -0.800000012; y: 0.699999988; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 28 { x: -0.100000001; y: -0.300000012; skew-x: -0.5; skew-y: -0.5; }
        frame 29 { x: 0.300000012; y: -1.39999998; skew-x: 0; skew-y: 0; }
        frame 30 { x: 11.1000004; y: -10.3000002; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 31 { x: 8.69999981; y: -7.4000001; skew-x: 5; skew-y: 5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 32 { x: 10; y: -9.19999981; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 11.1999998; y: -11; skew-x: 8.5; skew-y: 8.5; }
        frame 34 { x: 12.3999996; y: -12.8000002; skew-x: 10.3000002; skew-y: 10.3000002; }
        frame 35 { x: 12.8000002; y: -13.3999996; skew-x: 10.6000004; skew-y: 10.6000004; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 36 { x: 13.3000002; y: -14.1999998; skew-x: 11; skew-y: 11; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 37 { x: 13; y: -11.8000002; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 38 { x: 12.8000002; y: -9.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: -8.39999962; y: 9.69999981; skew-x: -11.6000004; skew-y: -11.6000004; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 40 { x: -2.0999999; y: 2.5999999; skew-x: -4.9000001; skew-y: -4.9000001; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 41 { x: 4.19999981; y: -3.9000001; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 42 { x: 11.1000004; y: -10.3000002; skew-x: 8.10000038; skew-y: 8.10000038; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 43 { x: 11.6999998; y: -11.3999996; skew-x: 9.10000038; skew-y: 9.10000038; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 44 { x: 12.3999996; y: -12.8000002; skew-x: 10.3000002; skew-y: 10.3000002; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 12.8000002; y: -13.3999996; skew-x: 10.6000004; skew-y: 10.6000004; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 46 { x: 13.3000002; y: -14.1999998; skew-x: 11; skew-y: 11; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 47 { x: 12.1999998; y: -12.1999998; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 11.1000004; y: -10.3000002; skew-x: 8.10000038; skew-y: 8.10000038; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 49 { x: -9.80000019; y: 9.10000038; skew-x: -10.8999996; skew-y: -10.8999996; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 50 { x: -2; y: 2.5; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.787999988; scale-y: 0.813000023; }
        frame 51 { x: 5.9000001; y: -3.5999999; skew-x: 1.60000002; skew-y: 1.60000002; scale-x: 0.777999997; scale-y: 0.827000022; }
        frame 52 { x: 14.5; y: -9.60000038; skew-x: 8; skew-y: 8; scale-x: 0.76700002; scale-y: 0.839999974; }
        frame 53 { x: 23.3999996; y: -15.1000004; skew-x: 14.5; skew-y: 14.5; scale-x: 0.755999982; scale-y: 0.853999972; }
        frame 54 { x: 32.5; y: -20.2999992; skew-x: 20.8999996; skew-y: 20.8999996; scale-x: 0.745999992; scale-y: 0.867999971; }
        frame 55 { x: 22.2999992; y: -14.3999996; skew-x: 15; skew-y: 15; scale-x: 0.759000003; scale-y: 0.838999987; }
        frame 56 { x: 12.5; y: -8.30000019; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: 0.773000002; scale-y: 0.81099999; }
        frame 57 { x: 0.899999976; y: 0.100000001; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.786000013; scale-y: 0.782000005; }
        frame 58 { x: -10; y: 9.10000038; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: 0.800000012; scale-y: 0.753000021; }
        frame 59 { x: -7.9000001; y: 6.9000001; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.799000025; scale-y: 0.763000011; }
        frame 60 { x: -5.80000019; y: 4.80000019; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: 0.800000012; scale-y: 0.772000015; }
        frame 61 { x: -3.70000005; y: 2.5999999; skew-x: -2.5; skew-y: -2.5; scale-x: -10000; scale-y: 0.781000018; }
        frame 62 { x: -1.60000002; y: 0.5; skew-x: -1.20000005; skew-y: -1.20000005; scale-y: 0.791000009; }
        frame 63 { x: 0.300000012; y: -1.39999998; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 65 { x: -1.5; y: 0.400000006; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.796999991; scale-y: 0.786000013; }
        frame 66 { x: -3.5; y: 2.29999995; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.79400003; scale-y: 0.771000028; }
        frame 67 { x: -5.5; y: 4.30000019; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.791000009; scale-y: 0.757000029; }
        frame 68 { x: -2.5; y: 1.29999995; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.796000004; scale-y: 0.777999997; }
        frame 69 { x: 0.300000012; y: -1.39999998; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 14.1000004; y: -10.1000004; skew-x: 8; skew-y: 8; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 74 { x: 28.2999992; y: -18.2999992; skew-x: 16.1000004; skew-y: 16.1000004; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 29.7000008; y: -18.6000004; skew-x: -10000; skew-y: -10000; image: IMAGE_REANIM_ZOMBIE_JACKBOX_HEAD2; }
        frame 76 { x: 35.4000015; y: -23.5; skew-x: 18.6000004; skew-y: 18.6000004; scale-x: 0.76700002; scale-y: 0.902999997; image: none; }
        frame 77 { x: 31.3999996; y: -18.6000004; skew-x: 16.2999992; skew-y: 16.2999992; scale-x: 0.782999992; scale-y: 0.850000024; }
        frame 78 { x: 27.6000004; y: -13.6999998; skew-x: 14.1000004; skew-y: 14.1000004; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 79 { x: 28.5; y: -15.1999998; skew-x: 14; skew-y: 14; scale-x: 0.773000002; scale-y: 0.824000001; }
        frame 80 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 10.1000004; y: 35.5; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_JAW; }
        frame 14 { x: 11.1000004; y: 34; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 8; y: 37.4000015; skew-x: -3.4000001; skew-y: -3.4000001; }
        frame 16 { x: 9.69999981; y: 35.0999985; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 17 { x: 7.30000019; y: 39.7000008; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 18 { x: 9.89999962; y: 36.5; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 19 { x: 8.5; y: 40; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 10.1999998; y: 36.0999985; skew-x: 1.20000005; skew-y: 1.20000005; }
        frame 21 { x: 8.30000019; y: 41.2999992; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 22 { x: 8.89999962; y: 42; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: -10000; scale-y: 0.828999996; }
        frame 23 { x: 9.39999962; y: 42.5; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.856999993; }
        frame 24 { x: 9.5; y: 41.2999992; skew-x: -1.20000005; skew-y: -1.20000005; scale-y: 0.84799999; }
        frame 25 { x: 9.60000038; y: 40.0999985; skew-x: -0.899999976; skew-y: -0.899999976; scale-y: 0.838; }
        frame 26 { x: 9.69999981; y: 39; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.828999996; }
        frame 27 { x: 9.80000019; y: 37.9000015; skew-x: -0.400000006; skew-y: -0.400000006; scale-y: 0.819000006; }
        frame 28 { x: 9.89999962; y: 36.7000008; skew-x: -0.200000003; skew-y: -0.200000003; scale-y: 0.810000002; }
        frame 29 { x: 10.1000004; y: 35.5; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 30 { x: 15.3999996; y: 27.7000008; skew-x: 8.10000038; skew-y: 8.10000038; scale-y: -10000; }
        frame 31 { x: 15.1000004; y: 30.2999992; skew-x: 5; skew-y: 5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 32 { x: 15.3000002; y: 28.6000004; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: -10000; y: 26.8999996; skew-x: 8.5; skew-y: 8.5; }
        frame 34 { y: 25.2999992; skew-x: 10.3000002; skew-y: 10.3000002; }
        frame 35 { x: 15.3999996; y: 24.7999992; skew-x: 10.6000004; skew-y: 10.6000004; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 36 { x: 15.5; y: 24; skew-x: 11; skew-y: 11; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 37 { x: 15.3999996; y: 26.3999996; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 38 { x: 15.1999998; y: 28.6000004; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 8.19999981; y: 44.2000008; skew-x: -11.6000004; skew-y: -11.6000004; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 40 { x: 10.3999996; y: 38.5999985; skew-x: -4.9000001; skew-y: -4.9000001; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 41 { x: 12.8000002; y: 33.0999985; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 42 { x: 15.3999996; y: 27.7000008; skew-x: 8.10000038; skew-y: 8.10000038; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 43 { x: -10000; y: 26.5; skew-x: 9.10000038; skew-y: 9.10000038; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 44 { x: 15.3000002; y: 25.2999992; skew-x: 10.3000002; skew-y: 10.3000002; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 15.3999996; y: 24.7999992; skew-x: 10.6000004; skew-y: 10.6000004; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 46 { x: 15.5; y: 24; skew-x: 11; skew-y: 11; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 47 { x: -10000; y: 26; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 15.3999996; y: 27.7000008; skew-x: 8.10000038; skew-y: 8.10000038; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 49 { x: 6.69999981; y: 43.5999985; skew-x: -10.8999996; skew-y: -10.8999996; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 50 { x: 10.1999998; y: 39.4000015; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 13.8999996; y: 35.2000008; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 52 { x: 17.6000004; y: 31.2000008; skew-x: 5; skew-y: 5; }
        frame 53 { x: 21.5; y: 27.1000004; skew-x: 10.5; skew-y: 10.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 54 { x: 25.2999992; y: 23; skew-x: 15.8999996; skew-y: 15.8999996; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 55 { x: 19.7999992; y: 27.7000008; skew-x: 12; skew-y: 11; scale-x: 0.818000019; scale-y: 0.797999978; }
        frame 56 { x: 14.3999996; y: 32.2999992; skew-x: 8.30000019; skew-y: 6.30000019; scale-x: 0.838999987; scale-y: 0.799000025; }
        frame 57 { x: 7.69999981; y: 35.5; skew-x: 3.29999995; skew-y: -1.70000005; scale-x: 0.862999976; scale-y: -10000; }
        frame 58 { x: 1.5; y: 38.5999985; skew-x: -1.29999995; skew-y: -10; scale-x: 0.888000011; }
        frame 59 { x: 3.29999995; y: 38; skew-x: -0.899999976; skew-y: -7.9000001; scale-x: 0.870000005; }
        frame 60 { x: 5.0999999; y: 37.2999992; skew-x: -0.699999988; skew-y: -5.9000001; scale-x: 0.852999985; }
        frame 61 { x: 6.80000019; y: 36.5; skew-x: -0.400000006; skew-y: -3.9000001; scale-x: 0.834999979; }
        frame 62 { x: 8.60000038; y: 36; skew-x: -0.200000003; skew-y: -1.89999998; scale-x: 0.816999972; scale-y: 0.800000012; }
        frame 63 { x: 10.1000004; y: 35.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: -10000; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 65 { x: 8.30000019; y: 35.9000015; skew-y: -0.400000006; scale-x: 0.83099997; }
        frame 66 { x: 6.4000001; y: 36.2000008; skew-x: 0.100000001; skew-y: -0.899999976; scale-x: 0.861000001; }
        frame 67 { x: 4.80000019; y: 36.4000015; skew-x: 0.300000012; skew-y: -1.39999998; scale-x: 0.89200002; }
        frame 68 { x: 7.5; y: 36; skew-x: 0; skew-y: -0.699999988; scale-x: 0.846000016; }
        frame 69 { x: 10.1000004; y: 35.5; skew-x: -10000; skew-y: 0; scale-x: 0.800000012; }
        frame 70 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; }
        frame 73 { x: 18.3999996; y: 28.8999996; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 74 { x: 26.6000004; y: 22.2999992; skew-x: 7.5999999; skew-y: 7.5999999; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 75 { x: 29.2000008; y: 20.8999996; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 31.7999992; y: 22.2000008; skew-x: 6.5999999; skew-y: 6.5999999; scale-x: 0.734000027; scale-y: 0.962000012; }
        frame 77 { x: 29.8999996; y: 24.1000004; skew-x: 6; skew-y: 6; scale-x: 0.765999973; scale-y: 0.879999995; }
        frame 78 { x: 28; y: 25.7999992; skew-x: 5.4000001; skew-y: 5.4000001; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 79 { x: 27.2999992; y: 26.5; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_handle";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: -3; y: 45.5999985; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_HANDLE; }
        frame 14 { x: -2.4000001; y: 44.5; skew-x: 0.699999988; skew-y: 0.699999988; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: -4.80000019; y: 49.7000008; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 16 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 17 { x: -5.5999999; y: 51.5; skew-x: -6.5; skew-y: -6.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 18 { x: -3.9000001; y: 46.9000015; skew-x: -3.5; skew-y: -3.5; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -4.9000001; y: 50.5999985; skew-x: -6.9000001; skew-y: -6.9000001; }
        frame 20 { x: -3.9000001; y: 45.9000015; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 21 { x: -5.0999999; y: 51.7000008; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 22 { x: -5.19999981; y: 52.5; skew-x: -9.89999962; skew-y: -9.89999962; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -5.30000019; y: 53.5; skew-x: -13.5; skew-y: -13.5; }
        frame 24 { x: -4.9000001; y: 52.0999985; skew-x: -11.1999998; skew-y: -11.1999998; }
        frame 25 { x: -4.5999999; y: 50.7999992; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 26 { x: -4.0999999; y: 49.5; skew-x: -6.69999981; skew-y: -6.69999981; }
        frame 27 { x: -3.9000001; y: 48.2000008; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 28 { x: -3.4000001; y: 46.9000015; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 29 { x: -3; y: 45.5999985; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -1; y: 37.5; skew-x: 1.10000002; skew-y: 1.10000002; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 31 { x: -0.899999976; y: 38.9000015; skew-x: 0.699999988; skew-y: 0.699999988; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -2; y: 56; skew-x: -45.5; skew-y: -45.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 33 { x: 6.80000019; y: 66.8000031; skew-x: -89.5999985; skew-y: -89.5999985; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 34 { x: 22.2999992; y: 68; skew-x: -134.800003; skew-y: -134.800003; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 35 { x: 35.2999992; y: 57; skew-x: -180.199997; skew-y: -180.199997; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 36 { x: 36.7999992; y: 39.9000015; skew-x: -231.600006; skew-y: -231.600006; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 37 { x: 27.6000004; y: 31.3999996; skew-x: -269.899994; skew-y: -269.899994; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 38 { x: 10.3000002; y: 30.6000004; skew-x: -319.299988; skew-y: -319.299988; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 39 { x: 2.4000001; y: 43; skew-x: -329.899994; skew-y: -329.899994; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 40 { x: -1.79999995; y: 40.9000015; skew-x: -359.5; skew-y: -359.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 41 { x: -2.5; y: 58.4000015; skew-x: -411.799988; skew-y: -411.799988; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 42 { x: 6.80000019; y: 67; skew-x: -448.399994; skew-y: -448.399994; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 43 { x: 21.2999992; y: 68.0999985; skew-x: -489.5; skew-y: -489.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 44 { x: 34.5; y: 58.0999985; skew-x: -536.299988; skew-y: -536.299988; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 36.5999985; y: 40; skew-x: -592.299988; skew-y: -592.299988; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 46 { x: 27.2000008; y: 28.8999996; skew-x: -629.200012; skew-y: -629.200012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 47 { x: 12.8000002; y: 27.7000008; skew-x: -670.5; skew-y: -670.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 48 { x: -1; y: 37.5; skew-x: -718.799988; skew-y: -718.799988; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 49 { x: -5.9000001; y: 51.9000015; skew-x: -725.099976; skew-y: -725.099976; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: -2; y: 61.5; skew-x: -768.099976; skew-y: -768.099976; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 51 { x: 9.30000019; y: 71; skew-x: -808.700012; skew-y: -808.700012; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 52 { x: 39.7999992; y: 61.2999992; skew-x: -902.099976; skew-y: -902.099976; scale-x: 0.791000009; scale-y: 0.791000009; }
        frame 53 { x: 43.2999992; y: 42.5; skew-x: -952.299988; skew-y: -952.299988; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 54 { x: 35; y: 29.6000004; skew-x: -990.900024; skew-y: -990.900024; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 55 { x: 14; y: 31.5; skew-x: -1045.69995; skew-y: -1045.69995; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 56 { x: 0.699999988; y: 43.7999992; skew-x: -1079.59998; skew-y: -1079.59998; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 57 { x: -2.20000005; y: 69.4000015; skew-x: -1137.59998; skew-y: -1137.59998; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 58 { x: 2.5; y: 80.1999969; skew-x: -1168.90002; skew-y: -1168.90002; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 59 { x: 17.1000004; y: -10000; skew-x: -1213.80005; skew-y: -1213.80005; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 60 { x: 33.4000015; y: 52.7999992; skew-x: -1309.59998; skew-y: -1309.59998; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 24.7999992; y: 40; skew-x: -1350.40002; skew-y: -1350.40002; }
        frame 62 { x: 7.80000019; y: 38.5; skew-x: -1395.09998; skew-y: -1395.09998; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 63 { x: -3; y: 45.5999985; skew-x: -1439.90002; skew-y: -1439.90002; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -5.4000001; y: 48.5999985; skew-x: -1442.69995; skew-y: -1442.69995; }
        frame 66 { x: -7.80000019; y: 51.7999992; skew-x: -1445.69995; skew-y: -1445.69995; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 67 { x: -7.5999999; y: 51.4000015; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: -7.4000001; y: 51.0999985; }
        frame 69 { x: -7.19999981; y: 50.7999992; }
        frame 70 { x: -10000; y: -10000; }
        frame 73 { x: -7.5; y: 48.2999992; skew-x: -1447.19995; skew-y: -1447.19995; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 74 { x: -7.9000001; y: 45.7999992; skew-x: -1448.59998; skew-y: -1448.59998; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -6.19999981; y: 51.2999992; skew-x: -1456.5; skew-y: -1456.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 76 { x: -4.4000001; y: 56.9000015; skew-x: -1464.5; skew-y: -1464.5; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -5.80000019; y: 56.7000008; skew-x: -10000; skew-y: -10000; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 78 { x: -7.30000019; y: 56.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 79 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: -3; y: 45.5999985; skew-x: -1439.90002; skew-y: -1439.90002; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 81 { x: -8.80000019; y: 43; skew-x: -1434.90002; skew-y: -1434.90002; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 82 { x: -14.3000002; y: 40.5999985; skew-x: -1429.59998; skew-y: -1429.59998; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 83 { x: -20; y: 38.2000008; skew-x: -1424.59998; skew-y: -1424.59998; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 84 { x: -25.5; y: 35.7999992; skew-x: -1419.30005; skew-y: -1419.30005; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: -28.5; y: 31.5; skew-x: -1413.30005; skew-y: -1413.30005; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 86 { x: -31.5; y: 27.2999992; skew-x: -1407.30005; skew-y: -1407.30005; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -34.5; y: 23.2000008; skew-x: -1401.5; skew-y: -1401.5; }
        frame 88 { x: -37.5; y: 19.2000008; skew-x: -1395.40002; skew-y: -1395.40002; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 89 { x: -39.7000008; y: 28.1000004; skew-x: -1383.69995; skew-y: -1383.69995; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 90 { x: -41.9000015; y: 37.5; skew-x: -1372; skew-y: -1372; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -44.2999992; y: 47.2999992; skew-x: -1360.40002; skew-y: -1360.40002; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 92 { x: -46.7999992; y: 57.5; skew-x: -1348.90002; skew-y: -1348.90002; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -49.5999985; y: 68.0999985; skew-x: -1337.09998; skew-y: -1337.09998; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 94 { x: -52.7000008; y: 79; skew-x: -1325.5; skew-y: -1325.5; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 95 { x: -55; y: 83; skew-x: -1332.09998; skew-y: -1335.80005; scale-x: 0.746999979; scale-y: 0.851999998; }
        frame 96 { x: -57.2000008; y: 87.0999985; skew-x: -1338.59998; skew-y: -1345.80005; scale-x: 0.700999975; scale-y: 0.910000026; }
        frame 97 { x: -58.4000015; y: 79.4000015; skew-x: -1339.80005; skew-y: -1343.40002; scale-x: 0.746999979; scale-y: 0.851999998; }
        frame 98 { x: -59.7999992; y: 71.6999969; skew-x: -1340.69995; skew-y: -1340.69995; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 99 { x: -60.2999992; y: 75.6999969; skew-x: -1342.09998; skew-y: -1342.09998; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: -61; y: 79.8000031; skew-x: -1343.30005; skew-y: -1343.30005; }
        frame 101 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_box";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 7.80000019; y: 43.5; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.670000017; scale-y: 0.670000017; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_BOX; }
        frame 14 { x: 8.69999981; y: 42; skew-x: -4.5; skew-y: -4.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 6.30000019; y: 45.5999985; skew-x: -9.30000019; skew-y: -9.30000019; }
        frame 16 { x: 7.5999999; y: 43.5; skew-x: -6.30000019; skew-y: -6.30000019; }
        frame 17 { x: 5.5999999; y: 47.5999985; skew-x: -9.80000019; skew-y: -9.80000019; }
        frame 18 { x: 7.5999999; y: 43.9000015; skew-x: -6.0999999; skew-y: -6.0999999; }
        frame 19 { x: 6.69999981; y: 47.0999985; skew-x: -8.80000019; skew-y: -8.80000019; }
        frame 20 { x: 8; y: 43.0999985; skew-x: -4.5999999; skew-y: -4.5999999; }
        frame 21 { x: 6.5999999; y: 48.4000015; skew-x: -8.30000019; skew-y: -8.30000019; }
        frame 22 { x: -10000; y: 48.9000015; skew-x: -8.80000019; skew-y: -8.80000019; }
        frame 23 { x: 6.30000019; y: 49.4000015; skew-x: -9.60000038; skew-y: -9.60000038; }
        frame 24 { x: 6.69999981; y: 48.4000015; skew-x: -8.80000019; skew-y: -8.80000019; }
        frame 25 { x: 6.9000001; y: 47.4000015; skew-x: -8.30000019; skew-y: -8.30000019; }
        frame 26 { x: 7.0999999; y: 46.4000015; skew-x: -7.5; skew-y: -7.5; }
        frame 27 { x: 7.30000019; y: 45.5; skew-x: -7; skew-y: -7; }
        frame 28 { x: 7.69999981; y: 44.5; skew-x: -6.30000019; skew-y: -6.30000019; }
        frame 29 { x: 7.80000019; y: 43.5; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 30 { x: 12.1999998; y: 35.2999992; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 31 { x: 12; y: 37; skew-x: 1.39999998; skew-y: 1.39999998; }
        frame 32 { x: 12.1000004; y: 36; skew-x: 1.70000005; skew-y: 1.70000005; }
        frame 33 { x: 12.1999998; y: 35; skew-x: 1.89999998; skew-y: 1.89999998; }
        frame 34 { x: -10000; y: 34; skew-x: 2.20000005; skew-y: 2.20000005; }
        frame 35 { y: 33.5; skew-x: 2.70000005; skew-y: 2.70000005; scale-x: 0.66900003; scale-y: 0.66900003; }
        frame 36 { x: 12.3000002; y: 33; skew-x: 3.20000005; skew-y: 3.20000005; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 12.1000004; y: 35.4000015; skew-x: 2.9000001; skew-y: 2.9000001; }
        frame 38 { x: 12; y: 37.5; skew-x: 3; skew-y: 3; }
        frame 39 { x: 5.0999999; y: 49.5; skew-x: -9.10000038; skew-y: -9.10000038; scale-x: 0.667999983; scale-y: 0.667999983; }
        frame 40 { x: 7.30000019; y: 44.7999992; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: 0.66900003; scale-y: 0.66900003; }
        frame 41 { x: 9.69999981; y: 39.9000015; skew-x: -1.5; skew-y: -1.5; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 12.1999998; y: 35.2999992; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.670000017; scale-y: 0.670000017; }
        frame 43 { x: 12.3000002; y: 34.5999985; skew-x: 2.20000005; skew-y: 2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 12.1999998; y: 34; skew-x: -10000; skew-y: -10000; }
        frame 45 { x: -10000; y: 33.5; skew-x: 2.70000005; skew-y: 2.70000005; scale-x: 0.66900003; scale-y: 0.66900003; }
        frame 46 { x: 12.3000002; y: 33; skew-x: 3.20000005; skew-y: 3.20000005; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: -10000; y: 34.0999985; skew-x: 2.70000005; skew-y: 2.70000005; }
        frame 48 { x: 12.1999998; y: 35.2999992; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.670000017; scale-y: 0.670000017; }
        frame 49 { x: 4.80000019; y: 49; skew-x: -11; skew-y: -11; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 7.5; y: 45.7999992; skew-x: -8.5; skew-y: -8.5; }
        frame 51 { x: 10.1999998; y: 42.5; skew-x: -6; skew-y: -6; }
        frame 52 { x: 13; y: 39.5; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 53 { x: 15.8000002; y: 36.2999992; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.66900003; scale-y: 0.66900003; }
        frame 54 { x: 18.7000008; y: 33.2000008; skew-x: 1.20000005; skew-y: 1.20000005; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 14.8000002; y: 36.5; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 56 { x: 11.1000004; y: 39.7999992; skew-x: -4; skew-y: -4; scale-x: 0.670000017; scale-y: 0.670000017; }
        frame 57 { x: 7.30000019; y: 43; skew-x: -6.5; skew-y: -6.5; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 3.5999999; y: 46.4000015; skew-x: -9.19999981; skew-y: -9.19999981; }
        frame 59 { x: 4.5; y: 45.9000015; skew-x: -8.5; skew-y: -8.5; }
        frame 60 { x: 5.30000019; y: 45.2999992; skew-x: -7.80000019; skew-y: -7.80000019; }
        frame 61 { x: 6.19999981; y: 44.5999985; skew-x: -7; skew-y: -7; }
        frame 62 { x: 7.0999999; y: 44; skew-x: -6.30000019; skew-y: -6.30000019; }
        frame 63 { x: 7.80000019; y: 43.5; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 65 { x: 4.9000001; y: 45.9000015; skew-x: -9.5; skew-y: -9.5; }
        frame 66 { x: 2; y: 48.2999992; skew-x: -13.5; skew-y: -13.5; }
        frame 67 { x: 0.800000012; y: 47.0999985; skew-x: -15.5; skew-y: -15.5; }
        frame 68 { x: 1.39999998; y: 45.0999985; skew-x: -10000; skew-y: -10000; scale-x: 0.66900003; scale-y: 0.66900003; }
        frame 69 { x: 1.89999998; y: 43.2999992; skew-x: -15.8000002; skew-y: -15.8000002; scale-x: 0.670000017; scale-y: 0.670000017; }
        frame 70 { x: -10000; y: 43.5999985; skew-x: -10000; skew-y: -10000; scale-x: 0.66900003; scale-y: 0.66900003; }
        frame 71 { x: 2; y: 43.7999992; skew-x: -15.6000004; skew-y: -15.6000004; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 1.89999998; y: 44.2000008; skew-x: -15.6999998; skew-y: -15.6999998; scale-x: 0.670000017; scale-y: 0.670000017; }
        frame 73 { x: 0.699999988; y: 41.4000015; skew-x: -18.2999992; skew-y: -18.2999992; scale-x: 0.66900003; scale-y: 0.66900003; }
        frame 74 { x: -0.5; y: 38.5999985; skew-x: -21.2000008; skew-y: -21.2000008; scale-x: 0.670000017; scale-y: 0.670000017; }
        frame 75 { x: 0.800000012; y: 42.5; skew-x: -24.7999992; skew-y: -24.7999992; scale-x: 0.66900003; scale-y: 0.66900003; }
        frame 76 { x: 2.29999995; y: 46.5; skew-x: -28.2999992; skew-y: -28.2999992; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 1.29999995; y: 47.2999992; skew-x: -28.5; skew-y: -28.5; }
        frame 78 { x: 0.200000003; y: 47.9000015; skew-x: -28.7000008; skew-y: -28.7000008; }
        frame 79 { x: -10000; y: 48; skew-x: -28.8999996; skew-y: -28.8999996; }
        frame 80 { x: 7.80000019; y: 43.5; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.670000017; scale-y: 0.670000017; }
        frame 81 { x: 2; y: 42; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: -3.5; y: 40.4000015; skew-x: 4.4000001; skew-y: 4.4000001; scale-x: 0.66900003; scale-y: 0.66900003; }
        frame 83 { x: -9.10000038; y: 39; skew-x: 9.5; skew-y: 9.5; scale-x: 0.667999983; scale-y: 0.667999983; }
        frame 84 { x: -14.3999996; y: 37.7999992; skew-x: 14.8000002; skew-y: 14.8000002; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: -18; y: 34.2999992; skew-x: 20.7000008; skew-y: 20.7000008; scale-x: 0.666000009; scale-y: 0.666000009; }
        frame 86 { x: -21.5; y: 31.1000004; skew-x: 26.7000008; skew-y: 26.7000008; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -24.8999996; y: 28.2000008; skew-x: 32.5; skew-y: 32.5; }
        frame 88 { x: -28.1000004; y: 25.5; skew-x: 38.5999985; skew-y: 38.5999985; scale-x: 0.666999996; scale-y: 0.666999996; }
        frame 89 { x: -31.7000008; y: 33.7999992; skew-x: 50.2999992; skew-y: 50.2999992; scale-x: 0.666000009; scale-y: 0.666000009; }
        frame 90 { x: -35.2999992; y: 43; skew-x: 62.0999985; skew-y: 62.0999985; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -39.5; y: 53.5; skew-x: 73.5999985; skew-y: 73.5999985; }
        frame 92 { x: -44; y: 64.8000031; skew-x: 85.1999969; skew-y: 85.1999969; }
        frame 93 { x: -49.2999992; y: 77; skew-x: 96.9000015; skew-y: 96.9000015; }
        frame 94 { x: -55.4000015; y: 89.9000015; skew-x: 108.599998; skew-y: 108.599998; }
        frame 95 { x: -56; y: 93.5; skew-x: 101.099998; skew-y: 99; scale-x: 0.621999979; scale-y: 0.717000008; }
        frame 96 { x: -56.7999992; y: 96.6999969; skew-x: 93.6999969; skew-y: 89.5999985; scale-x: 0.579999983; scale-y: 0.768999994; }
        frame 97 { x: -58.0999985; y: 89.8000031; skew-x: 93.4000015; skew-y: 91.4000015; scale-x: 0.623000026; scale-y: 0.717000008; }
        frame 98 { x: -59.4000015; y: 82.9000015; skew-x: 93.3000031; skew-y: 93.3000031; scale-x: 0.665000021; scale-y: 0.665000021; }
        frame 99 { x: -59.7999992; y: 86.8000031; skew-x: 91.9000015; skew-y: 91.9000015; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: -60.0999985; y: 91; skew-x: 90.8000031; skew-y: 90.8000031; }
        frame 101 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_box2";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 67 { x: -10.3999996; y: 35.0999985; skew-x: -15.3999996; skew-y: -15.3999996; scale-x: 0.67900002; scale-y: 0.67900002; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_BOX2; }
        frame 68 { x: -9.60000038; y: 33.2000008; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 69 { x: -8.89999962; y: 31.2000008; }
        frame 70 { x: -10000; y: 31.5; }
        frame 71 { y: 31.7999992; }
        frame 72 { y: 32.2999992; skew-x: -15.5; skew-y: -15.5; }
        frame 73 { x: -10.8999996; y: 30.1000004; skew-x: -18.3999996; skew-y: -18.3999996; }
        frame 74 { x: -12.8999996; y: 27.8999996; skew-x: -21.3999996; skew-y: -21.3999996; scale-x: 0.680000007; scale-y: 0.680000007; }
        frame 75 { x: -11.8000002; y: 32.7999992; skew-x: -25; skew-y: -25; scale-x: 0.67900002; scale-y: 0.67900002; }
        frame 76 { x: -10.6999998; y: 37.5; skew-x: -28.7000008; skew-y: -28.7000008; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -11.8000002; y: 38.2000008; skew-x: -10000; skew-y: -10000; scale-x: 0.677999973; scale-y: 0.677999973; }
        frame 78 { x: -12.8999996; y: 38.7999992; scale-x: 0.67900002; scale-y: 0.67900002; }
        frame 79 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_clownneck3";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 68 { x: 16; y: 49.4000015; scale-x: 0.800000012; scale-y: 0.210999995; cel: 0; alpha: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_CLOWNNECK; }
        frame 69 { x: 15.1999998; y: 36.5; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.686999977; scale-y: 0.901000023; cel: -10000; alpha: 1; image: none; }
        frame 70 { x: 15.8000002; y: 48; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.191; alpha: 0; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 72 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_clownneck2";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 68 { x: 15.8999996; y: 44.2000008; scale-x: 0.800000012; scale-y: 0.412999988; cel: 0; alpha: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_CLOWNNECK; }
        frame 69 { x: 8.10000038; y: 29; skew-x: -18.2000008; skew-y: -18.2000008; scale-x: 0.68599999; scale-y: 0.899999976; cel: -10000; alpha: 1; image: none; }
        frame 70 { x: 15.1000004; y: 36.9000015; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.776000023; scale-y: 0.861999989; alpha: -10000; }
        frame 71 { x: 15.5; y: 38.9000015; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.745999992; }
        frame 72 { x: 15.1000004; y: 36.9000015; scale-y: 0.861999989; }
        frame 73 { x: 13.3000002; y: 33.9000015; scale-y: -10000; }
        frame 74 { x: 12.5; y: 30.2999992; }
        frame 75 { x: 13.8999996; y: 33; }
        frame 76 { x: 14.6000004; y: 36.7000008; skew-x: -12.5; skew-y: -12.5; scale-x: 0.774999976; scale-y: 0.861000001; }
        frame 77 { x: 13.3000002; y: 37.4000015; skew-x: -13.8999996; skew-y: -13.8999996; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 12.8000002; y: 38.4000015; skew-x: -15.3999996; skew-y: -15.3999996; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_clownneck1";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 68 { x: 14.6999998; y: 39.9000015; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_CLOWNNECK; }
        frame 69 { x: -0.400000006; y: 23.1000004; skew-x: -30.7999992; skew-y: -30.7999992; scale-x: 0.685000002; scale-y: 0.898999989; cel: -10000; image: none; }
        frame 70 { x: 8.10000038; y: 29.7999992; skew-x: -13.8999996; skew-y: -13.8999996; scale-x: 0.774999976; scale-y: 0.861000001; }
        frame 71 { x: 6.5999999; y: 31.7000008; skew-x: -21.2000008; skew-y: -21.2000008; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 8.10000038; y: 29.7999992; skew-x: -13.8999996; skew-y: -13.8999996; }
        frame 73 { x: 6.69999981; y: 26.1000004; skew-x: -10000; skew-y: -10000; }
        frame 74 { x: 5.80000019; y: 22.7000008; }
        frame 75 { x: 6.80000019; y: 26; }
        frame 76 { x: 6.5; y: 30.8999996; skew-x: -23.5; skew-y: -23.5; }
        frame 77 { x: 5.0999999; y: 31.7999992; skew-x: -24.8999996; skew-y: -24.8999996; scale-x: 0.773999989; scale-y: 0.860000014; }
        frame 78 { x: 5; y: 32.4000015; skew-x: -26.3999996; skew-y: -26.3999996; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_clownhead";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 67 { x: 6.19999981; y: 37.2999992; skew-x: 1.70000005; skew-y: 1.70000005; scale-x: 0.541000009; scale-y: 0.307000011; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_CLOWNHEAD; }
        frame 68 { x: -2.79999995; y: 17.5; skew-x: -12.1999998; skew-y: -12.1999998; scale-x: 0.535000026; scale-y: 0.711000025; cel: -10000; image: none; }
        frame 69 { x: -19.2999992; y: 4; skew-x: -23.7999992; skew-y: -23.7999992; scale-x: 0.501999974; scale-y: 0.73299998; }
        frame 70 { x: -15.1000004; y: 9.80000019; skew-x: -19.3999996; skew-y: -19.3999996; scale-x: 0.559000015; scale-y: 0.648999989; }
        frame 71 { x: -11.3000002; y: 15.8000002; skew-x: -15.1999998; skew-y: -15.1999998; scale-x: 0.617999971; scale-y: 0.565999985; }
        frame 72 { x: -11; y: 12.8999996; skew-x: -10000; skew-y: -10000; scale-x: 0.583000004; scale-y: 0.583000004; }
        frame 73 { x: -13.1000004; y: 10.8000002; skew-x: -18; skew-y: -18; scale-x: 0.582000017; scale-y: 0.582000017; }
        frame 74 { x: -15.1999998; y: 8.89999962; skew-x: -21; skew-y: -21; scale-x: 0.583000004; scale-y: 0.583000004; }
        frame 75 { x: -15.8000002; y: 14.1000004; skew-x: -24.5; skew-y: -24.5; scale-x: 0.582000017; scale-y: 0.582000017; }
        frame 76 { x: -16.2999992; y: 19.5; skew-x: -28.2999992; skew-y: -28.2999992; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -17; y: 19.7000008; skew-x: -28.2000008; skew-y: -28.2000008; scale-x: 0.58099997; scale-y: 0.58099997; }
        frame 78 { x: -17.7999992; y: 20; skew-x: -28.2999992; skew-y: -28.2999992; scale-x: 0.582000017; scale-y: 0.582000017; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_outerarm_upper";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 44.5999985; y: 38.0999985; skew-x: -7.80000019; skew-y: 5.0999999; scale-x: 0.76700002; scale-y: 0.795000017; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERARM_UPPER; }
        frame 14 { x: 45.5; y: 37.5; skew-x: -6.4000001; skew-y: 6.0999999; scale-x: 0.765999973; scale-y: 0.79400003; cel: -10000; image: none; }
        frame 15 { x: 42.5999985; y: 38.4000015; skew-x: -11.1999998; skew-y: 1.29999995; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 44.2999992; y: 38.7999992; skew-x: -8.39999962; skew-y: 4.30000019; scale-x: 0.76700002; scale-y: 0.795000017; }
        frame 17 { x: 42; y: 39.5999985; skew-x: -11.6999998; skew-y: 0.800000012; scale-x: 0.765999973; scale-y: 0.79400003; }
        frame 18 { x: 44.5; y: 37.7000008; skew-x: -8; skew-y: 4.5; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 43; y: 39.0999985; skew-x: -10.6999998; skew-y: 1.79999995; }
        frame 20 { x: 44.7999992; y: 37.7000008; skew-x: -6.69999981; skew-y: 5.80000019; }
        frame 21 { x: 43.0999985; y: 40.5; skew-x: -10.3000002; skew-y: 2.5999999; scale-x: 0.76700002; scale-y: 0.795000017; }
        frame 22 { x: 43.2999992; y: -10000; skew-x: -9.89999962; skew-y: 2.79999995; scale-x: 0.765999973; scale-y: -10000; }
        frame 23 { x: 43.5; skew-x: -9.69999981; skew-y: 3.0999999; scale-x: -10000; }
        frame 24 { x: 43.5999985; y: 40.0999985; skew-x: -9.19999981; skew-y: 3.29999995; }
        frame 25 { x: 43.7999992; y: 39.7999992; skew-x: -8.89999962; skew-y: 3.5999999; }
        frame 26 { x: 44.0999985; y: 39.4000015; skew-x: -8.69999981; skew-y: 4; }
        frame 27 { x: 44.2999992; y: 39; skew-x: -8.39999962; skew-y: 4.30000019; }
        frame 28 { x: 44.5; y: 38.5; skew-x: -8; skew-y: 4.80000019; scale-x: 0.76700002; }
        frame 29 { x: 44.5999985; y: 38.0999985; skew-x: -7.80000019; skew-y: 5.0999999; scale-x: -10000; }
        frame 30 { x: 49.2999992; y: 35; skew-x: 0.300000012; skew-y: 13.1000004; scale-x: 0.765999973; scale-y: 0.79400003; }
        frame 31 { x: 49.0999985; y: 36.2999992; skew-x: -0.400000006; skew-y: 12.3000002; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -10000; y: 35.5; skew-x: -0.200000003; skew-y: -10000; scale-y: 0.792999983; }
        frame 33 { y: 34.5; skew-x: -10000; scale-y: -10000; }
        frame 34 { y: 33.7999992; scale-y: 0.79400003; }
        frame 35 { y: 33.4000015; skew-x: 0; scale-y: 0.792999983; }
        frame 36 { x: 49; y: 32.9000015; skew-x: -0; scale-y: -10000; }
        frame 37 { x: 48.5999985; y: 35.2000008; skew-x: 0; scale-y: 0.791999996; }
        frame 38 { x: 48.4000015; y: 37.5; skew-x: -10000; scale-y: 0.792999983; }
        frame 39 { x: 40.5999985; y: 40.9000015; skew-x: -11.1999998; skew-y: 1; scale-x: 0.764999986; scale-y: 0.791999996; }
        frame 40 { x: 43.2000008; y: 38.5; skew-x: -7.4000001; skew-y: 4.5; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 45.7999992; y: 36.0999985; skew-x: -3.70000005; skew-y: 8.30000019; scale-x: 0.765999973; }
        frame 42 { x: 48.5; y: 34; skew-x: -0.200000003; skew-y: 12; scale-x: -10000; }
        frame 43 { x: 48.5999985; y: 33.2999992; skew-x: 0; skew-y: -10000; }
        frame 44 { x: 48.7999992; y: 32.5; skew-x: -10000; skew-y: 12.3000002; }
        frame 45 { x: 49; y: -10000; skew-y: 12.5; }
        frame 46 { x: 49.2999992; skew-x: 0.200000003; skew-y: 12.8000002; scale-y: 0.792999983; }
        frame 47 { x: -10000; y: 33.7999992; skew-x: 0.300000012; skew-y: -10000; scale-y: -10000; }
        frame 48 { y: 35; skew-x: -10000; skew-y: 13.1000004; scale-y: 0.79400003; }
        frame 49 { x: 40.9000015; y: 40.0999985; skew-x: -13.1000004; skew-y: -0; scale-y: -10000; }
        frame 50 { x: 43.9000015; y: 38.5; skew-x: -10.5; skew-y: 2.29999995; }
        frame 51 { x: 46.7999992; y: 37; skew-x: -8; skew-y: 4.80000019; }
        frame 52 { x: 49.9000015; y: 35.4000015; skew-x: -5.69999981; skew-y: 7.30000019; }
        frame 53 { x: 52.7999992; y: 33.9000015; skew-x: -3.20000005; skew-y: 9.60000038; scale-y: 0.792999983; }
        frame 54 { x: 55.7999992; y: 32.2999992; skew-x: -0.699999988; skew-y: 12.1999998; scale-y: 0.79400003; }
        frame 55 { x: 51.7999992; y: 33.7999992; skew-x: -3.20000005; skew-y: 9.5; scale-y: 0.792999983; }
        frame 56 { x: 47.7999992; y: 35.2999992; skew-x: -5.9000001; skew-y: 6.80000019; scale-y: 0.79400003; }
        frame 57 { x: 43.9000015; y: 37; skew-x: -8.69999981; skew-y: 4.30000019; scale-y: -10000; }
        frame 58 { x: 40.0999985; y: 38.5999985; skew-x: -11.3000002; skew-y: 1.60000002; scale-x: 0.76700002; }
        frame 59 { x: 41; y: 38.5; skew-x: -10.5; skew-y: 2.29999995; scale-x: 0.765999973; }
        frame 60 { x: 42; y: -10000; skew-x: -9.89999962; skew-y: 3; scale-x: -10000; }
        frame 61 { x: 42.9000015; y: 38.2999992; skew-x: -9.19999981; skew-y: 3.5999999; }
        frame 62 { x: 43.7999992; y: 38.0999985; skew-x: -8.39999962; skew-y: 4.30000019; scale-x: 0.76700002; scale-y: 0.795000017; }
        frame 63 { x: 44.5999985; y: -10000; skew-x: -7.80000019; skew-y: 5.0999999; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 65 { x: 44.0999985; y: 38; skew-x: -7.69999981; skew-y: 5; }
        frame 66 { x: 43.5; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.765999973; scale-y: 0.79400003; }
        frame 67 { x: 43; scale-x: 0.76700002; scale-y: 0.795000017; }
        frame 68 { x: 43.7999992; y: 38.0999985; scale-x: 0.765999973; scale-y: -10000; }
        frame 69 { x: 44.5999985; y: -10000; skew-x: -7.80000019; skew-y: 5.0999999; scale-x: 0.76700002; }
        frame 70 { x: -10000; y: 38; skew-x: -7.69999981; skew-y: 5; scale-x: -10000; }
        frame 71 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 72 { y: 38.0999985; skew-x: -7.80000019; skew-y: 5.0999999; }
        frame 73 { x: 53.4000015; y: 34; skew-x: 6; skew-y: 19.7999992; scale-x: 0.765999973; scale-y: 0.862999976; }
        frame 74 { x: 62.7999992; y: 31.2999992; skew-x: 20.2999992; skew-y: 34.5999985; scale-x: -10000; scale-y: 0.933000028; }
        frame 75 { x: 63.2000008; y: 30.7000008; skew-x: 18.2999992; skew-y: 32.5999985; scale-x: 0.764999986; scale-y: 0.930999994; }
        frame 76 { x: 63.7999992; y: 30.1000004; skew-x: 16.5; skew-y: 30.7999992; scale-x: -10000; scale-y: 0.931999981; }
        frame 77 { x: 62.7000008; y: 31; skew-x: 16.2999992; skew-y: -10000; scale-y: 0.930999994; }
        frame 78 { x: 61.5999985; y: 31.8999996; skew-x: 16.5; scale-y: 0.931999981; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 80 { x: 44.5999985; y: 38.0999985; skew-x: -7.80000019; skew-y: 5.0999999; scale-x: 0.76700002; scale-y: 0.795000017; }
        frame 81 { x: 39.0999985; y: 40.0999985; skew-x: -5.69999981; skew-y: 7; scale-x: 0.765999973; scale-y: 0.79400003; }
        frame 82 { x: 33.5999985; y: 42.2999992; skew-x: -3.9000001; skew-y: 9; scale-x: 0.764999986; scale-y: 0.792999983; }
        frame 83 { x: 28; y: 44.2999992; skew-x: -1.89999998; skew-y: 10.8000002; scale-x: -10000; scale-y: 0.791999996; }
        frame 84 { x: 22.3999996; y: 46.4000015; skew-x: -0; skew-y: 12.8999996; scale-x: 0.763999999; scale-y: -10000; }
        frame 85 { x: 15.5; y: 47.5999985; skew-x: 2.79999995; skew-y: 15.8000002; scale-x: -10000; scale-y: 0.791000009; }
        frame 86 { x: 8.69999981; y: 49; skew-x: 5.80000019; skew-y: 18.7999992; scale-x: 0.763000011; scale-y: 0.790000021; }
        frame 87 { x: 1.79999995; y: 50.4000015; skew-x: 8.80000019; skew-y: 21.7999992; scale-x: 0.762000024; scale-y: -10000; }
        frame 88 { x: -4.9000001; y: 51.7999992; skew-x: 11.8999996; skew-y: 24.8999996; scale-x: -10000; }
        frame 89 { x: -18.1000004; y: 65.9000015; skew-x: 1; skew-y: 14; scale-y: 0.787999988; }
        frame 90 { x: -31.1000004; y: 80.5999985; skew-x: -9.39999962; skew-y: 3.29999995; scale-x: 0.760999978; scale-y: -10000; }
        frame 91 { x: -34.0999985; y: 84.0999985; skew-x: -5.69999981; skew-y: 6.80000019; scale-x: 0.75999999; scale-y: 0.787; }
        frame 92 { x: -36.9000015; y: 87.6999969; skew-x: -2.20000005; skew-y: 10.3000002; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -39.7999992; y: 91.5; skew-x: 1; skew-y: 14; }
        frame 94 { x: -42.7000008; y: 95.1999969; skew-x: 4.5999999; skew-y: 17.7000008; scale-x: 0.759000003; }
        frame 95 { x: -10000; y: 96.0999985; skew-x: 4.30000019; skew-y: 18.2999992; scale-x: 0.782999992; scale-y: 0.777999997; }
        frame 96 { y: 97.0999985; skew-x: 4.19999981; skew-y: 19.2999992; scale-x: 0.805999994; scale-y: 0.769999981; }
        frame 97 { x: -43.0999985; y: 98.3000031; skew-x: 4; skew-y: 19.7999992; scale-x: 0.819999993; scale-y: 0.757000029; }
        frame 98 { x: -43.4000015; y: 99.4000015; skew-x: 3.9000001; skew-y: 20.6000004; scale-x: 0.833999991; scale-y: 0.746999979; }
        frame 99 { x: -43.0999985; y: 98; skew-x: 4; skew-y: 19.7999992; scale-x: 0.819999993; scale-y: 0.757000029; }
        frame 100 { x: -42.7000008; y: 96.3000031; skew-x: 4.19999981; skew-y: 19.2999992; scale-x: 0.805999994; scale-y: 0.769999981; }
        frame 101 { x: -10000; y: 96.8000031; skew-x: 4.0999999; skew-y: -10000; scale-x: -10000; scale-y: 0.768999994; }
        frame 102 { y: 97.0999985; skew-x: 4.19999981; scale-y: 0.769999981; }
    }
    Track {
        source-name: "Zombie_jackbox_outerarm_lower";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 14.1999998; y: 59.5; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.746999979; scale-y: 0.746999979; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERARM_LOWER; }
        frame 14 { x: 14.8999996; y: 58; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 13.8000002; y: 60.9000015; skew-x: -8.5; skew-y: -8.5; }
        frame 16 { x: 14.1000004; y: 59; skew-x: -4.9000001; skew-y: -4.9000001; }
        frame 17 { x: 13; y: 62.9000015; skew-x: -9.69999981; skew-y: -9.69999981; }
        frame 18 { x: 13.8999996; y: 59.9000015; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 19 { x: 13.6999998; y: 63.0999985; skew-x: -10; skew-y: -10; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: -10000; y: 59.5999985; skew-x: -5.9000001; skew-y: -5.9000001; }
        frame 21 { x: 13.3000002; y: 64.3000031; skew-x: -9.80000019; skew-y: -9.80000019; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 22 { x: 13.5; y: 64.8000031; skew-x: -10.3999996; skew-y: -10.3999996; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 13.6000004; y: 65.0999985; skew-x: -11.1999998; skew-y: -11.1999998; }
        frame 24 { x: 13.8000002; y: 64.0999985; skew-x: -10.1999998; skew-y: -10.1999998; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 25 { x: -10000; y: 63.2000008; skew-x: -9.39999962; skew-y: -9.39999962; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 26 { x: 14; y: 62.2999992; skew-x: -8.39999962; skew-y: -8.39999962; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 14.1000004; y: 61.2999992; skew-x: -7.4000001; skew-y: -7.4000001; }
        frame 28 { x: -10000; y: 60.5; skew-x: -6.69999981; skew-y: -6.69999981; }
        frame 29 { x: 14.1999998; y: 59.5; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 30 { x: 16.1000004; y: 52; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 31 { x: 16.2000008; y: 53.5999985; skew-x: 1.5; skew-y: 1.5; }
        frame 32 { x: 16.1000004; y: 52.9000015; skew-x: -10000; skew-y: -10000; }
        frame 33 { x: -10000; y: 52; }
        frame 34 { y: 51.2000008; }
        frame 35 { x: 16; y: 50.7999992; }
        frame 36 { x: 15.8999996; y: 50.2999992; }
        frame 37 { x: 15.5; y: 52.5; }
        frame 38 { x: 15.3000002; y: 54.7999992; }
        frame 39 { x: 12; y: 65.8000031; skew-x: -12.8000002; skew-y: -12.5; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 40 { x: 13.1999998; y: 61.2000008; skew-x: -8.69999981; skew-y: -8.39999962; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 14.3999996; y: 56.7999992; skew-x: -4.69999981; skew-y: -4.4000001; }
        frame 42 { x: 15.6999998; y: 52.5; skew-x: -0.699999988; skew-y: -0.400000006; }
        frame 43 { x: 15.8000002; y: 51.5; skew-x: -0.200000003; skew-y: 0; }
        frame 44 { x: -10000; y: 50.5; skew-x: 0.300000012; skew-y: 0.300000012; scale-y: 0.746999979; }
        frame 45 { x: 15.8999996; y: 50.0999985; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.746999979; scale-y: -10000; }
        frame 46 { x: 16; y: 49.7000008; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: -10000; }
        frame 47 { x: 16.1000004; y: 51; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 48 { x: -10000; y: 52; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 49 { x: 12.5; y: 64.1999969; skew-x: -11; skew-y: -11; }
        frame 50 { x: 14.5; y: 61.4000015; skew-x: -8.69999981; skew-y: -8.69999981; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 51 { x: 16.5; y: 58.7000008; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 18.3999996; y: 56; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 53 { x: 20.5; y: 53.2000008; skew-x: -2.4000001; skew-y: -2.4000001; }
        frame 54 { x: 22.6000004; y: 50.5; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 55 { x: 19.7999992; y: 53.2000008; skew-x: -2.5; skew-y: -2.5; }
        frame 56 { x: 16.8999996; y: 56.0999985; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 57 { x: 14; y: 59; skew-x: -6.9000001; skew-y: -6.9000001; }
        frame 58 { x: 11.1000004; y: 61.9000015; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 59 { x: 11.6999998; y: 61.2999992; skew-x: -8.39999962; skew-y: -8.39999962; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 12.3000002; y: 60.9000015; skew-x: -7.69999981; skew-y: -7.69999981; }
        frame 61 { x: 13; y: 60.4000015; skew-x: -7; skew-y: -7; }
        frame 62 { x: 13.6000004; y: 60; skew-x: -6.4000001; skew-y: -6.4000001; }
        frame 63 { x: 14.1999998; y: 59.5; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 65 { x: 13.6999998; y: 60.5; skew-x: -7.19999981; skew-y: -6.19999981; }
        frame 66 { x: 13.3000002; y: 61.5; skew-x: -8.5; skew-y: -6.69999981; }
        frame 67 { x: 12.8000002; y: 62.5; skew-x: -10.1000004; skew-y: -7.4000001; scale-x: 0.748000026; }
        frame 68 { x: 13.6000004; y: 61; skew-x: -7.9000001; skew-y: -6.4000001; scale-x: 0.746999979; }
        frame 69 { x: 14.1999998; y: 59.5; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: -10000; }
        frame 70 { x: 14.3000002; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: -10000; }
        frame 72 { x: 14.1999998; }
        frame 73 { x: 15.3000002; y: 54.5; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.768000007; }
        frame 74 { x: 16.3999996; y: 49.5999985; skew-x: 1.20000005; skew-y: 1.20000005; scale-x: 0.790000021; }
        frame 75 { x: 18; y: 52.4000015; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.788999975; scale-y: 0.745999992; }
        frame 76 { x: 19.7999992; y: 55.4000015; skew-x: -11; skew-y: -11; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 18.7999992; y: 56.4000015; skew-x: -10.8999996; skew-y: -10.8999996; scale-x: 0.787999988; }
        frame 78 { x: 17.6000004; y: 57.5; skew-x: -11; skew-y: -11; scale-x: 0.788999975; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 80 { x: 14.3000002; y: 56.5; skew-x: -0.100000001; skew-y: -0.100000001; scale-x: 0.746999979; scale-y: 0.746999979; image: IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERARM_LOWER2; }
        frame 81 { x: 8.19999981; y: 57.5; skew-x: 1.5; skew-y: 1.5; scale-x: 0.745999992; scale-y: 0.745999992; image: none; }
        frame 82 { x: 2; y: 58.5; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: -3.79999995; y: 59.5; skew-x: 5.5; skew-y: 5.5; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 84 { x: -9.89999962; y: 60.4000015; skew-x: 7.5; skew-y: 7.5; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 85 { x: -17.3999996; y: 59.9000015; skew-x: 10.5; skew-y: 10.5; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: -24.7999992; y: 59.4000015; skew-x: 13.5; skew-y: 13.5; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 87 { x: -32.0999985; y: 59; skew-x: 16.5; skew-y: 16.5; scale-x: 0.741999984; scale-y: 0.741999984; }
        frame 88 { x: -39.5; y: 58.7000008; skew-x: 19.6000004; skew-y: 19.6000004; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 89 { x: -48.9000015; y: 74.4000015; skew-x: 15.8000002; skew-y: 15.8000002; scale-x: 0.740999997; scale-y: 0.740999997; }
        frame 90 { x: -58.2000008; y: 90.1999969; skew-x: 12.1000004; skew-y: 12.1000004; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 91 { x: -60.2999992; y: 89.5999985; skew-x: 19.1000004; skew-y: 19.1000004; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 92 { x: -62.2999992; y: 89.5; skew-x: 26.1000004; skew-y: 26.1000004; scale-x: 0.737999976; scale-y: 0.737999976; }
        frame 93 { x: -64; y: 89.8000031; skew-x: 33.2999992; skew-y: 33.2999992; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: -65.8000031; y: 90.5999985; skew-x: 40.4000015; skew-y: 40.4000015; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 95 { x: -66.5; y: 91.5999985; skew-x: 39.0999985; skew-y: 41.5999985; scale-x: 0.745999992; scale-y: 0.740999997; }
        frame 96 { x: -67.1999969; y: 92.5999985; skew-x: 37.9000015; skew-y: 43; scale-x: 0.755999982; scale-y: 0.745000005; }
        frame 97 { x: -68; y: 93.9000015; skew-x: 36.7999992; skew-y: 44.0999985; scale-x: 0.758000016; scale-y: 0.742999971; }
        frame 98 { x: -68.8000031; y: 95.0999985; skew-x: 35.7999992; skew-y: 45.0999985; scale-x: 0.763000011; scale-y: -10000; }
        frame 99 { x: -66.9000015; y: 92.5999985; skew-x: 38.5999985; skew-y: 45.9000015; scale-x: 0.758000016; }
        frame 100 { x: -65; y: 90; skew-x: 41.5999985; skew-y: 46.7999992; scale-x: 0.755999982; scale-y: 0.745000005; }
        frame 101 { x: -66.3000031; y: 90.8000031; skew-x: 39.5999985; skew-y: 44.5999985; scale-x: 0.754999995; scale-y: 0.744000018; }
        frame 102 { x: -67.5; y: 91.6999969; skew-x: 37.4000015; skew-y: 42.5; scale-x: 0.755999982; scale-y: 0.745000005; }
    }
}
