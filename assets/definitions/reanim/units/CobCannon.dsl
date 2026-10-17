export component CobCannon {
    fps: 12;
    Track {
        source-name: "anim_unarmed_idle";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 24 { cel: -1; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 39 { cel: 0; }
        frame 40 { cel: -10000; }
        frame 58 { cel: -1; }
        frame 59 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 58 { cel: 0; }
        frame 59 { cel: -10000; }
    }
    Track {
        source-name: "anim_charge";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
        frame 39 { cel: -1; }
        frame 40 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: 0; }
        frame 2 { cel: -10000; }
        frame 4 { cel: -1; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "CobCannon_backwheels";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 31.7000008; y: -5.69999981; scale-x: 0.720000029; scale-y: 0.720000029; cel: 0; image: IMAGE_REANIM_COBCANNON_WHEEL; }
        frame 6 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 59 { x: 31.1000004; y: -4.4000001; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 60 { x: 30.5; y: -2.79999995; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 61 { x: 29.8999996; y: -1.29999995; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 62 { x: 29.3999996; y: 0.100000001; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 63 { x: 30.6000004; y: -2.9000001; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 64 { x: 31.7000008; y: -5.69999981; skew-x: 0; skew-y: 0; }
        frame 65 { x: -10000; y: -4.80000019; skew-x: -10000; skew-y: -10000; scale-y: 0.708999991; }
        frame 66 { y: -4; scale-y: 0.697000027; }
        frame 67 { y: -4.80000019; scale-y: 0.708999991; }
        frame 68 { y: -5.69999981; scale-y: 0.720000029; }
        frame 69 { y: -10000; scale-y: -10000; }
        frame 77 { x: 31.1000004; y: -4.4000001; scale-x: 0.727999985; scale-y: 0.703000009; }
        frame 78 { x: 30.3999996; y: -3.20000005; scale-x: 0.736000001; scale-y: 0.685000002; }
        frame 79 { x: 31.1000004; y: -4.4000001; scale-x: 0.727999985; scale-y: 0.703000009; }
        frame 80 { x: 31.7000008; y: -5.69999981; scale-x: 0.720000029; scale-y: 0.720000029; }
        frame 81 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: -5.0999999; scale-y: 0.712000012; }
        frame 85 { y: -4.5; scale-y: 0.703999996; }
        frame 86 { y: -4; scale-y: 0.697000027; }
        frame 87 { y: -3.4000001; scale-y: 0.68900001; }
        frame 88 { y: -4.5; scale-y: 0.703999996; }
        frame 89 { y: -5.69999981; scale-y: 0.720000029; }
        frame 90 { y: -10000; scale-y: -10000; }
        frame 96 { y: -5.0999999; scale-y: 0.711000025; }
        frame 97 { y: -4.5; scale-y: 0.703000009; }
        frame 98 { y: -5.0999999; scale-y: 0.711000025; }
        frame 99 { y: -5.69999981; scale-y: 0.720000029; }
    }
    Track {
        source-name: "CobCannon_backwheels2";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 98.5999985; y: -5.69999981; scale-x: 0.720000029; scale-y: 0.720000029; cel: 0; image: IMAGE_REANIM_COBCANNON_WHEEL; }
        frame 6 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 59 { x: 98; y: -5.9000001; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 60 { x: 97.3000031; y: -6.0999999; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 61 { x: 96.5999985; y: -6.30000019; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 62 { x: 96; y: -6.5; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 63 { x: 97.4000015; y: -6.0999999; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 64 { x: 98.5999985; y: -5.69999981; skew-x: 0; skew-y: 0; }
        frame 65 { x: -10000; y: -4.80000019; skew-x: -10000; skew-y: -10000; scale-y: 0.708999991; }
        frame 66 { y: -4; scale-y: 0.697000027; }
        frame 67 { y: -4.80000019; scale-y: 0.708999991; }
        frame 68 { y: -5.69999981; scale-y: 0.720000029; }
        frame 69 { y: -10000; scale-y: -10000; }
        frame 77 { x: 98.6999969; y: -4.4000001; scale-x: 0.727999985; scale-y: 0.703000009; }
        frame 78 { x: 98.8000031; y: -3.20000005; scale-x: 0.736000001; scale-y: 0.685000002; }
        frame 79 { x: 98.6999969; y: -4.4000001; scale-x: 0.727999985; scale-y: 0.703000009; }
        frame 80 { x: 98.5999985; y: -5.69999981; scale-x: 0.720000029; scale-y: 0.720000029; }
        frame 81 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: -5.0999999; scale-y: 0.712000012; }
        frame 85 { y: -4.5; scale-y: 0.703999996; }
        frame 86 { y: -4; scale-y: 0.697000027; }
        frame 87 { y: -3.4000001; scale-y: 0.68900001; }
        frame 88 { y: -4.5; scale-y: 0.703999996; }
        frame 89 { y: -5.69999981; scale-y: 0.720000029; }
        frame 90 { y: -10000; scale-y: -10000; }
        frame 96 { y: -5.0999999; scale-y: 0.711000025; }
        frame 97 { y: -4.5; scale-y: 0.703000009; }
        frame 98 { y: -5.0999999; scale-y: 0.711000025; }
        frame 99 { y: -5.69999981; scale-y: 0.720000029; }
    }
    Track {
        source-name: "CobCannon_log2";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 15.1999998; y: 11.1999998; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_COBCANNON_LOG; }
        frame 6 { x: -10000; y: 11.3999996; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 11.5; }
        frame 8 { y: 11.6999998; }
        frame 9 { y: 11.8000002; }
        frame 10 { y: 12; }
        frame 11 { y: 12.1999998; }
        frame 12 { y: 12.3000002; }
        frame 13 { y: 12.5; }
        frame 14 { y: 12.6000004; }
        frame 15 { y: 12.5; }
        frame 16 { y: 12.3000002; }
        frame 17 { y: 12.1999998; }
        frame 18 { y: 12; }
        frame 19 { y: 11.8000002; }
        frame 20 { y: 11.6999998; }
        frame 21 { y: 11.5; }
        frame 22 { y: 11.3999996; }
        frame 23 { y: 11.1999998; }
        frame 24 { y: -10000; }
        frame 40 { y: 11.3999996; }
        frame 41 { y: 11.5; }
        frame 42 { y: 11.6999998; }
        frame 43 { y: 11.8000002; }
        frame 44 { y: 12; }
        frame 45 { y: 12.1999998; }
        frame 46 { y: 12.3000002; }
        frame 47 { y: 12.5; }
        frame 48 { y: 12.6000004; }
        frame 49 { y: 12.5; }
        frame 50 { y: 12.3000002; }
        frame 51 { y: 12.1999998; }
        frame 52 { y: 12; }
        frame 53 { y: 11.8000002; }
        frame 54 { y: 11.6999998; }
        frame 55 { y: 11.5; }
        frame 56 { y: 11.3999996; }
        frame 57 { y: 11.1999998; }
        frame 58 { y: -10000; }
        frame 59 { x: 14.6000004; y: 11.1000004; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 60 { x: 14.1000004; y: -10000; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 61 { x: 13.6000004; y: 11; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 62 { x: 13.1000004; y: 10.8999996; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 63 { x: 14.1999998; y: 11; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 64 { x: 15.1999998; y: 11.1999998; skew-x: 0; skew-y: 0; }
        frame 65 { x: -10000; y: 12.3999996; skew-x: -10000; skew-y: -10000; }
        frame 66 { y: 13.6000004; }
        frame 67 { y: 12.3999996; }
        frame 68 { y: 11.1999998; }
        frame 69 { y: -10000; }
        frame 77 { y: 13.8000002; }
        frame 78 { y: 16.3999996; }
        frame 79 { y: 10.8999996; scale-y: 0.819000006; }
        frame 80 { y: 5.30000019; scale-y: 0.838; }
        frame 81 { y: 7.30000019; scale-y: 0.825999975; }
        frame 82 { y: 9.30000019; scale-y: 0.813000023; }
        frame 83 { y: 11.1999998; scale-y: 0.800000012; }
        frame 84 { x: 15; y: 11.8000002; scale-x: 0.801999986; scale-y: 0.791999996; }
        frame 85 { x: 14.8999996; y: 12.3000002; scale-x: 0.80400002; scale-y: 0.783999979; }
        frame 86 { x: 14.6999998; y: 12.8999996; scale-x: 0.805999994; scale-y: 0.776000023; }
        frame 87 { x: 14.5; y: 13.5; scale-x: 0.808000028; scale-y: 0.768000007; }
        frame 88 { x: 14.8999996; y: 12.3999996; scale-x: 0.80400002; scale-y: 0.783999979; }
        frame 89 { x: 15.1999998; y: 11.1999998; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 90 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 14.6000004; y: 12.5; scale-x: 0.808000028; scale-y: 0.796000004; }
        frame 97 { x: 14.1000004; y: 13.8000002; scale-x: 0.815999985; scale-y: 0.791999996; }
        frame 98 { x: 14.6000004; y: 12.5; scale-x: 0.808000028; scale-y: 0.796000004; }
        frame 99 { x: 15.1999998; y: 11.1999998; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "CobCannon_fuse";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -12.5; y: 19.5; skew-x: -44.9000015; skew-y: -44.9000015; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_COBCANNON_FUSE; }
        frame 6 { x: -13; y: 21; skew-x: -46.2999992; skew-y: -47.7999992; scale-x: 0.799000025; scale-y: 0.800999999; cel: -10000; image: none; }
        frame 7 { x: -13.3999996; y: 22.7000008; skew-x: -47.7999992; skew-y: -50.5; scale-x: -10000; scale-y: 0.802999973; }
        frame 8 { x: -13.8000002; y: 24.2000008; skew-x: -49.2999992; skew-y: -53.2999992; scale-x: 0.800000012; scale-y: 0.805000007; }
        frame 9 { x: -14.1999998; y: 25.8999996; skew-x: -50.7999992; skew-y: -56; scale-x: -10000; scale-y: 0.806999981; }
        frame 10 { x: -14.5; y: 27.5; skew-x: -52.2999992; skew-y: -58.7999992; scale-x: 0.800999999; scale-y: 0.809000015; }
        frame 11 { x: -14.8999996; y: 29.2000008; skew-x: -53.7999992; skew-y: -61.5; scale-x: -10000; scale-y: 0.81099999; }
        frame 12 { x: -15.1999998; y: 30.7999992; skew-x: -55.2999992; skew-y: -64.3000031; scale-x: 0.801999986; scale-y: 0.813000023; }
        frame 13 { x: -15.3999996; y: 32.5; skew-x: -56.7999992; skew-y: -67.0999985; scale-x: -10000; scale-y: 0.814999998; }
        frame 14 { x: -15.6999998; y: 34.0999985; skew-x: -58.2999992; skew-y: -69.6999969; scale-x: 0.80400002; scale-y: 0.818000019; }
        frame 15 { x: -14.8999996; y: 36.4000015; skew-x: -64.3000031; skew-y: -77.9000015; scale-x: 0.801999986; scale-y: 0.824999988; }
        frame 16 { x: -13.8999996; y: 38.5; skew-x: -70.3000031; skew-y: -85.9000015; scale-x: -10000; scale-y: 0.833999991; }
        frame 17 { x: -14.1000004; y: 35.7000008; skew-x: -66.8000031; skew-y: -80.0999985; scale-x: 0.800000012; scale-y: 0.828000009; }
        frame 18 { x: -14.1999998; y: 33; skew-x: -63.0999985; skew-y: -74.3000031; scale-x: -10000; scale-y: 0.823000014; }
        frame 19 { x: -14.1000004; y: 30.2000008; skew-x: -59.5; skew-y: -68.4000015; scale-y: 0.818000019; }
        frame 20 { x: -14; y: 27.3999996; skew-x: -55.7999992; skew-y: -62.5999985; scale-x: 0.799000025; scale-y: 0.813000023; }
        frame 21 { x: -13.6999998; y: 24.6000004; skew-x: -52.2999992; skew-y: -56.5999985; scale-x: -10000; scale-y: 0.808000028; }
        frame 22 { x: -13.1000004; y: 21.8999996; skew-x: -48.5; skew-y: -50.7999992; scale-y: 0.802999973; }
        frame 23 { x: -12.5; y: 19.5; skew-x: -44.9000015; skew-y: -44.9000015; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -13; y: 21; skew-x: -46.2999992; skew-y: -47.7999992; scale-x: 0.799000025; scale-y: 0.800999999; }
        frame 41 { x: -13.3999996; y: 22.7000008; skew-x: -47.7999992; skew-y: -50.5; scale-x: -10000; scale-y: 0.802999973; }
        frame 42 { x: -13.8000002; y: 24.2000008; skew-x: -49.2999992; skew-y: -53.2999992; scale-x: 0.800000012; scale-y: 0.805000007; }
        frame 43 { x: -14.1999998; y: 25.8999996; skew-x: -50.7999992; skew-y: -56; scale-x: -10000; scale-y: 0.806999981; }
        frame 44 { x: -14.5; y: 27.5; skew-x: -52.2999992; skew-y: -58.7999992; scale-x: 0.800999999; scale-y: 0.809000015; }
        frame 45 { x: -14.8999996; y: 29.2000008; skew-x: -53.7999992; skew-y: -61.5; scale-x: -10000; scale-y: 0.81099999; }
        frame 46 { x: -15.1999998; y: 30.7999992; skew-x: -55.2999992; skew-y: -64.3000031; scale-x: 0.801999986; scale-y: 0.813000023; }
        frame 47 { x: -15.3999996; y: 32.5; skew-x: -56.7999992; skew-y: -67.0999985; scale-x: -10000; scale-y: 0.814999998; }
        frame 48 { x: -15.6999998; y: 34.0999985; skew-x: -58.2999992; skew-y: -69.6999969; scale-x: 0.80400002; scale-y: 0.818000019; }
        frame 49 { x: -14.8999996; y: 37.7999992; skew-x: -64.3000031; skew-y: -77.9000015; scale-x: 0.801999986; scale-y: 0.824999988; }
        frame 50 { x: -13.8999996; y: 41.2999992; skew-x: -70.3000031; skew-y: -85.9000015; scale-x: -10000; scale-y: 0.833999991; }
        frame 51 { x: -14.1999998; y: 38.0999985; skew-x: -66.8000031; skew-y: -80.0999985; scale-x: 0.800000012; scale-y: 0.828000009; }
        frame 52 { x: -14.3000002; y: 34.9000015; skew-x: -63.0999985; skew-y: -74.3000031; scale-x: -10000; scale-y: 0.823000014; }
        frame 53 { x: -14.1999998; y: 31.7000008; skew-x: -59.5; skew-y: -68.4000015; scale-y: 0.818000019; }
        frame 54 { x: -14; y: 28.5; skew-x: -55.7999992; skew-y: -62.5999985; scale-x: 0.799000025; scale-y: 0.813000023; }
        frame 55 { x: -13.6000004; y: 25.3999996; skew-x: -52.2999992; skew-y: -56.5999985; scale-x: -10000; scale-y: 0.808000028; }
        frame 56 { x: -13.1000004; y: 22.2999992; skew-x: -48.5; skew-y: -50.7999992; scale-y: 0.802999973; }
        frame 57 { x: -12.5; y: 19.5; skew-x: -44.9000015; skew-y: -44.9000015; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -11.6999998; y: 36.2000008; skew-x: -64.9000015; skew-y: -64.9000015; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 60 { x: -8.80000019; y: 52.4000015; skew-x: -85.0999985; skew-y: -85.0999985; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 61 { x: -4.19999981; y: 67.0999985; skew-x: -104.900002; skew-y: -104.900002; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 9.80000019; y: 70; skew-x: -114.699997; skew-y: -114.699997; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 63 { x: 24.2999992; y: 72.3000031; skew-x: -125; skew-y: -125; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 38.5999985; y: 74.3000031; skew-x: -134.899994; skew-y: -134.899994; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 15.1000004; y: 69.5999985; skew-x: -117.5; skew-y: -117.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 93 { x: -7.5999999; y: 63.4000015; skew-x: -100.199997; skew-y: -100.199997; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 94 { x: -11.8000002; y: 42.4000015; skew-x: -72.5999985; skew-y: -72.5999985; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: -12.5; y: 19.5; skew-x: -44.9000015; skew-y: -44.9000015; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 96 { x: -13.3000002; y: 20.7000008; skew-x: -44.5; skew-y: -45.2999992; scale-x: 0.800999999; scale-y: 0.800999999; }
        frame 97 { x: -14.1999998; y: 21.8999996; skew-x: -44.0999985; skew-y: -45.7000008; scale-x: 0.80400002; scale-y: 0.80400002; }
        frame 98 { x: -13.3000002; y: 20.7000008; skew-x: -44.5; skew-y: -45.2999992; scale-x: 0.800999999; scale-y: 0.800999999; }
        frame 99 { x: -12.5; y: 19.5; skew-x: -44.9000015; skew-y: -44.9000015; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "CobCannon_husk4";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 51.2000008; y: 5.30000019; cel: 0; image: IMAGE_REANIM_COBCANNON_HUSK4; }
        frame 6 { x: 51.0999985; y: 6; scale-x: 1.00399995; scale-y: 0.996999979; cel: -10000; image: none; }
        frame 7 { x: 51; y: 6.5999999; scale-x: 1.00699997; scale-y: 0.995000005; }
        frame 8 { x: -10000; y: 7.19999981; scale-x: 1.01100004; scale-y: 0.991999984; }
        frame 9 { x: 51; y: 7.80000019; scale-x: 1.01400006; scale-y: 0.99000001; }
        frame 10 { x: 50.7999992; y: 8.5; scale-x: 1.01800001; scale-y: 0.986999989; }
        frame 11 { x: -10000; y: 9.10000038; scale-x: 1.02100003; scale-y: 0.984000027; }
        frame 12 { x: 50.7000008; y: 9.80000019; scale-x: 1.02499998; scale-y: 0.981999993; }
        frame 13 { x: 50.5999985; y: 10.3999996; scale-x: 1.028; scale-y: 0.978999972; }
        frame 14 { x: -10000; y: 11; scale-x: 1.03199995; scale-y: 0.976000011; }
        frame 15 { x: 50.7000008; y: 10.3999996; scale-x: 1.028; scale-y: 0.978999972; }
        frame 16 { x: 50.7999992; y: 9.69999981; scale-x: 1.02499998; scale-y: 0.981999993; }
        frame 17 { x: -10000; y: 9.10000038; scale-x: 1.02100003; scale-y: 0.984000027; }
        frame 18 { x: 50.9000015; y: 8.5; scale-x: 1.01800001; scale-y: 0.986999989; }
        frame 19 { x: 51; y: 7.80000019; scale-x: 1.01400006; scale-y: 0.99000001; }
        frame 20 { x: -10000; y: 7.19999981; scale-x: 1.01100004; scale-y: 0.991999984; }
        frame 21 { x: 51.0999985; y: 6.5999999; scale-x: 1.00699997; scale-y: 0.995000005; }
        frame 22 { x: -10000; y: 5.9000001; scale-x: 1.00399995; scale-y: 0.996999979; }
        frame 23 { x: 51.2000008; y: 5.30000019; scale-x: 1; scale-y: 1; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 51.2999992; skew-x: 0.300000012; scale-x: 1.00300002; }
        frame 26 { x: 51.4000015; skew-x: 0.5; scale-x: 1.00600004; }
        frame 27 { x: 51.5; skew-x: 0.800000012; scale-x: 1.00899994; }
        frame 28 { x: 51.5999985; skew-x: 1; scale-x: 1.01199996; }
        frame 29 { x: 51.9000015; skew-x: 1.29999995; scale-x: 1.01499999; }
        frame 30 { x: 52; skew-x: 1.5; scale-x: 1.01800001; }
        frame 31 { x: 52.0999985; skew-x: 1.79999995; scale-x: 1.02199996; }
        frame 32 { x: 52.2000008; skew-x: 2; scale-x: 1.02499998; }
        frame 33 { x: 52.2999992; skew-x: 2.29999995; scale-x: 1.028; }
        frame 34 { x: 52.0999985; y: 5.4000001; skew-x: 1.79999995; scale-x: 1.02199996; }
        frame 35 { x: 51.7999992; y: -10000; skew-x: 1.29999995; scale-x: 1.01699996; }
        frame 36 { x: 51.5999985; y: 5.5; skew-x: 0.800000012; scale-x: 1.01100004; }
        frame 37 { x: 51.4000015; y: -10000; skew-x: 0.300000012; scale-x: 1.00600004; }
        frame 38 { x: 51.2000008; y: 5.30000019; skew-x: 0; scale-x: 1; }
        frame 39 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 40 { x: 51.0999985; y: 6; scale-x: 1.00399995; scale-y: 0.996999979; }
        frame 41 { x: 51; y: 6.5999999; scale-x: 1.00699997; scale-y: 0.995000005; }
        frame 42 { x: -10000; y: 7.19999981; scale-x: 1.01100004; scale-y: 0.991999984; }
        frame 43 { x: 51; y: 7.80000019; scale-x: 1.01400006; scale-y: 0.99000001; }
        frame 44 { x: 50.7999992; y: 8.5; scale-x: 1.01800001; scale-y: 0.986999989; }
        frame 45 { x: -10000; y: 9.10000038; scale-x: 1.02100003; scale-y: 0.984000027; }
        frame 46 { x: 50.7000008; y: 9.80000019; scale-x: 1.02499998; scale-y: 0.981999993; }
        frame 47 { x: 50.5999985; y: 10.3999996; scale-x: 1.028; scale-y: 0.978999972; }
        frame 48 { x: -10000; y: 11; scale-x: 1.03199995; scale-y: 0.976000011; }
        frame 49 { x: 50.7000008; y: 10.3999996; scale-x: 1.028; scale-y: 0.978999972; }
        frame 50 { x: 50.7999992; y: 9.69999981; scale-x: 1.02499998; scale-y: 0.981999993; }
        frame 51 { x: -10000; y: 9.10000038; scale-x: 1.02100003; scale-y: 0.984000027; }
        frame 52 { x: 50.9000015; y: 8.5; scale-x: 1.01800001; scale-y: 0.986999989; }
        frame 53 { x: 51; y: 7.80000019; scale-x: 1.01400006; scale-y: 0.99000001; }
        frame 54 { x: -10000; y: 7.19999981; scale-x: 1.01100004; scale-y: 0.991999984; }
        frame 55 { x: 51.0999985; y: 6.5999999; scale-x: 1.00699997; scale-y: 0.995000005; }
        frame 56 { x: -10000; y: 5.9000001; scale-x: 1.00399995; scale-y: 0.996999979; }
        frame 57 { x: 51.2000008; y: 5.30000019; scale-x: 1; scale-y: 1; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 51.5; y: 6.30000019; skew-x: -14.6999998; skew-y: -14.6999998; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 60 { x: 40.2000008; y: 3.70000005; skew-x: -29.7000008; skew-y: -29.7000008; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 61 { x: 32.4000015; y: 1.20000005; skew-x: -44.9000015; skew-y: -44.9000015; scale-x: 1; scale-y: 1; }
        frame 62 { x: 27.7999992; y: 6.0999999; skew-x: -59.9000015; skew-y: -59.9000015; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 63 { x: 26.2999992; y: 9.5; skew-x: -75.0999985; skew-y: -75.0999985; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 27.2999992; y: 10; skew-x: -89.9000015; skew-y: -89.9000015; scale-x: 1; scale-y: 1; }
        frame 65 { x: 27.1000004; y: 11.6000004; skew-x: -10000; skew-y: -10000; scale-x: 0.990999997; scale-y: 1.01499999; }
        frame 66 { x: 26.7999992; y: 13.1999998; scale-x: 0.98299998; scale-y: 1.02999997; }
        frame 67 { x: 27.1000004; y: 11.5; scale-x: 0.990999997; scale-y: 1.01499999; }
        frame 68 { x: 27.2999992; y: 10; scale-x: 1; scale-y: 1; }
        frame 69 { x: 26.2999992; y: 11.3999996; skew-x: -89.0999985; scale-x: 0.985000014; scale-y: 1.02499998; }
        frame 70 { x: 25.3999996; y: 12.8999996; skew-x: -88.4000015; scale-x: 0.970000029; scale-y: 1.051; }
        frame 71 { x: 24.3999996; y: 14.3000002; skew-x: -87.5999985; scale-x: 0.953999996; scale-y: 1.07599998; }
        frame 72 { x: 23.2999992; y: 15.8000002; skew-x: -86.5999985; scale-x: 0.93900001; scale-y: 1.10099995; }
        frame 73 { x: 22.5; y: 17.1000004; skew-x: -85.9000015; scale-x: 0.924000025; scale-y: 1.12600005; }
        frame 74 { x: 21.6000004; y: 18.5; skew-x: -85.0999985; scale-x: 0.908999979; scale-y: 1.15199995; }
        frame 75 { x: 20.6000004; y: 19.8999996; skew-x: -84.0999985; scale-x: 0.893999994; scale-y: 1.17700005; }
        frame 76 { x: 19.6000004; y: 21.2999992; skew-x: -83.3000031; scale-x: 0.879000008; scale-y: 1.20200002; }
        frame 77 { x: 19.5; y: 24.6000004; skew-x: -82.4000015; scale-x: 0.86500001; scale-y: 1.21899998; }
        frame 78 { x: 19.2000008; y: 28; skew-x: -81.4000015; scale-x: 0.851000011; scale-y: 1.23500001; }
        frame 79 { x: 19.2999992; y: 20; skew-x: -86.3000031; scale-x: 0.92900002; scale-y: 1.21899998; }
        frame 80 { x: 19.6000004; y: 11.8000002; skew-x: -91; scale-x: 1.00800002; scale-y: 1.20200002; }
        frame 81 { x: 20.8999996; y: 9.80000019; skew-x: -90.6999969; scale-x: 1.05299997; scale-y: 1.10399997; }
        frame 82 { x: 22.3999996; y: 7.69999981; skew-x: -10000; scale-x: 1.09800005; scale-y: 1.005; }
        frame 83 { x: 23.7999992; y: 5.69999981; skew-x: -90.5999985; scale-x: 1.14300001; scale-y: 0.907000005; }
        frame 84 { x: 23; y: 7.0999999; skew-x: -90.4000015; scale-x: 1.10000002; scale-y: 0.950999975; }
        frame 85 { x: 22.3999996; y: 8.5; skew-x: -90.1999969; scale-x: 1.05599999; scale-y: 0.995999992; }
        frame 86 { x: 21.6000004; y: 9.89999962; skew-x: -89.9000015; scale-x: 1.01300001; scale-y: 1.03999996; }
        frame 87 { x: 21.1000004; y: 11.3999996; skew-x: -10000; scale-x: 0.968999982; scale-y: 1.08399999; }
        frame 88 { x: 21.7000008; y: 10.6999998; scale-x: 0.985000014; scale-y: 1.04200006; }
        frame 89 { x: 22.2999992; y: 10; scale-x: 1; scale-y: 1; }
        frame 90 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 25.7000008; y: 12.3000002; skew-x: -62.7999992; skew-y: -62.7999992; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 93 { x: 38.5999985; y: 8.19999981; skew-x: -35.7999992; skew-y: -35.7999992; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 42.4000015; y: 6.0999999; skew-x: -17.7000008; skew-y: -17.7000008; }
        frame 95 { x: 51.2000008; y: 5.30000019; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 96 { x: 51; y: 6.69999981; skew-x: -10000; skew-y: -10000; scale-x: 1.00999999; scale-y: 0.995000005; }
        frame 97 { x: 50.7999992; y: 7.9000001; scale-x: 1.01900005; scale-y: 0.990999997; }
        frame 98 { x: 51; y: 6.69999981; scale-x: 1.00999999; scale-y: 0.995000005; }
        frame 99 { x: 51.2000008; y: 5.30000019; scale-x: 1; scale-y: 1; }
    }
    Track {
        source-name: "CobCannon_husk4.2";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { x: 51.4000015; y: 5.30000019; cel: 0; alpha: 0; image: IMAGE_REANIM_COBCANNON_HUSK4; }
        frame 25 { x: 51.5; y: -10000; skew-x: 0.300000012; scale-x: 1.00300002; cel: -10000; alpha: 0.109999999; image: none; }
        frame 26 { x: -10000; y: 5.4000001; skew-x: 0.5; scale-x: 1.00600004; alpha: 0.219999999; }
        frame 27 { x: 51.7000008; y: -10000; skew-x: 0.800000012; scale-x: 1.00899994; alpha: 0.330000013; }
        frame 28 { x: 51.7999992; y: 5.30000019; skew-x: 1; scale-x: 1.01199996; alpha: 0.449999988; }
        frame 29 { x: 52; y: 5.4000001; skew-x: 1.29999995; scale-x: 1.01499999; alpha: 0.550000012; }
        frame 30 { x: 52.0999985; y: -10000; skew-x: 1.5; scale-x: 1.01800001; alpha: 0.670000017; }
        frame 31 { x: 52.2999992; y: 5.30000019; skew-x: 1.79999995; scale-x: 1.02199996; alpha: 0.779999971; }
        frame 32 { x: 52.4000015; y: 5.4000001; skew-x: 2; scale-x: 1.02499998; alpha: 0.889999986; }
        frame 33 { x: 52.5; y: 5.30000019; skew-x: 2.29999995; scale-x: 1.028; alpha: 1; }
        frame 34 { x: 52.0999985; y: -10000; skew-x: 1.79999995; scale-x: 1.02100003; alpha: 0.75; }
        frame 35 { x: 51.9000015; y: 5.5; skew-x: 1; scale-x: 1.01400006; alpha: 0.5; }
        frame 36 { x: 51.5999985; y: -10000; skew-x: 0.5; scale-x: 1.00699997; alpha: 0.25; }
        frame 37 { x: 51.4000015; y: 5.30000019; skew-x: 0; scale-x: 1; alpha: 0; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; cel: -1; alpha: -10000; }
        frame 39 { cel: -10000; }
        frame 78 { x: 19.2000008; y: 28; skew-x: -81.4000015; skew-y: -89.9000015; scale-x: 0.851000011; scale-y: 1.23500001; cel: 0; alpha: 1; }
        frame 79 { x: -10000; y: 19.8999996; skew-x: -86.4000015; skew-y: -10000; scale-x: 0.92900002; scale-y: 1.21800005; cel: -10000; alpha: -10000; }
        frame 80 { x: 19.6000004; y: 11.6000004; skew-x: -91; scale-x: 1.00699997; scale-y: 1.20200002; }
        frame 81 { x: 20.8999996; y: 9.5; skew-x: -90.6999969; scale-x: 1.05200005; scale-y: 1.10399997; }
        frame 82 { x: 22.3999996; y: 7.5; skew-x: -10000; scale-x: 1.097; scale-y: 1.005; }
        frame 83 { x: 23.7999992; y: 5.5; skew-x: -90.5999985; scale-x: 1.14300001; scale-y: 0.907000005; }
        frame 84 { x: -10000; y: 5.80000019; skew-x: -90.6999969; scale-x: 1.08700001; scale-y: 0.938000023; alpha: 0.75; }
        frame 85 { y: 6.30000019; skew-x: -10000; scale-x: 1.03199995; scale-y: 0.970000029; alpha: 0.5; }
        frame 86 { x: 23.7000008; y: 6.69999981; scale-x: 0.976999998; scale-y: 1.00199997; alpha: 0.25; }
        frame 87 { x: 23.8999996; y: 7; skew-x: -90.9000015; scale-x: 0.921999991; scale-y: 1.03400004; alpha: 0; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 89 { cel: -10000; }
    }
    Track {
        source-name: "CobCannon_husk3";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 67.1999969; y: -8.30000019; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_COBCANNON_HUSK3; }
        frame 6 { x: 67.3000031; y: -7.69999981; scale-x: 0.802999973; scale-y: 0.797999978; cel: -10000; image: none; }
        frame 7 { x: 67.1999969; y: -7; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 8 { x: -10000; y: -6.30000019; scale-x: 0.808000028; scale-y: 0.79400003; }
        frame 9 { y: -5.5999999; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 10 { y: -4.9000001; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 11 { y: -4.19999981; scale-x: 0.816999972; scale-y: 0.787; }
        frame 12 { x: 67.0999985; y: -3.5999999; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 13 { x: -10000; y: -2.9000001; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 14 { y: -2.29999995; scale-x: 0.824999988; scale-y: 0.781000018; }
        frame 15 { y: -2.9000001; skew-x: 0.5; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 16 { x: 67.1999969; y: -3.5999999; skew-x: 1.29999995; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 17 { x: 67.0999985; y: -4.30000019; skew-x: 1; scale-x: 0.816999972; scale-y: 0.787; }
        frame 18 { x: 67.1999969; y: -4.80000019; skew-x: 0.800000012; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 19 { x: -10000; y: -5.5999999; skew-x: 0.600000024; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 20 { y: -6.30000019; skew-x: 0.5; scale-x: 0.809000015; scale-y: 0.79400003; }
        frame 21 { y: -6.9000001; skew-x: 0.300000012; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 22 { y: -7.5999999; skew-x: 0; scale-x: 0.802999973; scale-y: 0.797999978; }
        frame 23 { y: -8.30000019; skew-x: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: 67.3000031; y: -8.39999962; skew-x: -0.200000003; scale-x: 0.801999986; scale-y: -10000; }
        frame 25 { x: 67.5; y: -8.30000019; skew-x: -0.400000006; scale-x: 0.80400002; }
        frame 26 { x: 67.5999985; y: -8.39999962; skew-x: -0.699999988; scale-x: 0.806999981; }
        frame 27 { x: 67.8000031; y: -10000; skew-x: -0.899999976; scale-x: 0.809000015; }
        frame 28 { x: 68; skew-x: -1.20000005; scale-x: 0.81099999; }
        frame 29 { x: 68.0999985; skew-x: -1.39999998; scale-x: 0.813000023; }
        frame 30 { x: 68.3000031; skew-x: -1.70000005; scale-x: 0.815999985; }
        frame 31 { x: 68.4000015; skew-x: -1.89999998; scale-x: 0.818000019; }
        frame 32 { x: 68.5999985; skew-x: -2.20000005; scale-x: 0.819999993; }
        frame 33 { x: 68.6999969; y: -8.30000019; skew-x: -2.5; scale-x: 0.822000027; }
        frame 34 { x: 68.4000015; y: -8.39999962; skew-x: -1.89999998; scale-x: 0.818000019; }
        frame 35 { x: 68.0999985; y: -8.30000019; skew-x: -1.39999998; scale-x: 0.813000023; }
        frame 36 { x: 67.8000031; y: -10000; skew-x: -0.899999976; scale-x: 0.809000015; }
        frame 37 { x: 67.5; skew-x: -0.400000006; scale-x: 0.80400002; }
        frame 38 { x: 67.1999969; skew-x: 0; scale-x: 0.800000012; }
        frame 39 { x: -10000; skew-x: -10000; scale-x: -10000; }
        frame 40 { x: 67.3000031; y: -7.69999981; scale-x: 0.802999973; scale-y: 0.797999978; }
        frame 41 { x: 67.1999969; y: -7; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 42 { x: -10000; y: -6.30000019; scale-x: 0.808000028; scale-y: 0.79400003; }
        frame 43 { y: -5.5999999; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 44 { y: -4.9000001; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 45 { y: -4.19999981; scale-x: 0.816999972; scale-y: 0.787; }
        frame 46 { x: 67.0999985; y: -3.5999999; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 47 { x: -10000; y: -2.9000001; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 48 { y: -2.29999995; scale-x: 0.824999988; scale-y: 0.781000018; }
        frame 49 { y: -2.9000001; skew-x: 0.5; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 50 { x: 67.1999969; y: -3.5999999; skew-x: 1.29999995; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 51 { x: 67.0999985; y: -4.30000019; skew-x: 1; scale-x: 0.816999972; scale-y: 0.787; }
        frame 52 { x: 67.1999969; y: -4.80000019; skew-x: 0.800000012; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 53 { x: -10000; y: -5.5999999; skew-x: 0.600000024; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 54 { y: -6.30000019; skew-x: 0.5; scale-x: 0.809000015; scale-y: 0.79400003; }
        frame 55 { y: -6.9000001; skew-x: 0.300000012; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 56 { y: -7.5999999; skew-x: 0; scale-x: 0.802999973; scale-y: 0.797999978; }
        frame 57 { y: -8.30000019; skew-x: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 59.9000015; y: -14.6999998; skew-x: -14.6999998; skew-y: -14.6999998; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 60 { x: 46; y: -15.1000004; skew-x: -29.7000008; skew-y: -29.7000008; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 35; y: -10000; skew-x: -44.9000015; skew-y: -44.9000015; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 62 { x: 22.8999996; y: -11.1000004; skew-x: -59.9000015; skew-y: -59.9000015; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 63 { x: 13.8000002; y: -8.30000019; skew-x: -75.0999985; skew-y: -75.0999985; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 6.69999981; y: -7.9000001; skew-x: -89.9000015; skew-y: -89.9000015; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 65 { x: 6.19999981; y: -6.0999999; skew-x: -10000; skew-y: -10000; scale-x: 0.792999983; scale-y: 0.811999977; }
        frame 66 { x: 5.5999999; y: -4.4000001; scale-x: 0.786000013; scale-y: 0.824000001; }
        frame 67 { x: 6.0999999; y: -6.0999999; scale-x: 0.792999983; scale-y: 0.811999977; }
        frame 68 { x: 6.69999981; y: -7.9000001; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 69 { x: 5.19999981; y: -6.19999981; skew-x: -90.9000015; scale-x: 0.787999988; scale-y: 0.819999993; }
        frame 70 { x: 3.9000001; y: -4.4000001; skew-x: -91.9000015; scale-x: 0.776000023; scale-y: 0.839999974; }
        frame 71 { x: 2.4000001; y: -2.70000005; skew-x: -92.9000015; scale-x: 0.764999986; scale-y: 0.861000001; }
        frame 72 { x: 0.899999976; y: -0.899999976; skew-x: -93.9000015; scale-x: 0.753000021; scale-y: 0.880999982; }
        frame 73 { x: -0.400000006; y: 0.5; skew-x: -94.9000015; scale-x: 0.740999997; scale-y: 0.901000023; }
        frame 74 { x: -1.89999998; y: 2.20000005; skew-x: -95.9000015; scale-x: 0.728999972; scale-y: 0.921000004; }
        frame 75 { x: -3.5; y: 3.9000001; skew-x: -97; scale-x: 0.717000008; scale-y: 0.941999972; }
        frame 76 { x: -4.9000001; y: 5.5999999; skew-x: -98.0999985; scale-x: 0.70599997; scale-y: 0.962000012; }
        frame 77 { x: -5.5; y: 9.19999981; skew-x: -99.4000015; scale-x: 0.69599998; scale-y: 0.975000024; }
        frame 78 { x: -6.0999999; y: 12.8000002; skew-x: -100.800003; scale-x: 0.68599999; scale-y: 0.987999976; }
        frame 79 { x: -5.30000019; y: 3.29999995; skew-x: -95.9000015; scale-x: 0.745999992; scale-y: 0.975000024; }
        frame 80 { x: -4.9000001; y: -6.19999981; skew-x: -91.3000031; scale-x: 0.805999994; scale-y: 0.962000012; }
        frame 81 { x: -1.60000002; y: -9.10000038; skew-x: -91; scale-x: 0.842000008; scale-y: 0.883000016; }
        frame 82 { x: 1.79999995; y: -11.8000002; skew-x: -90.9000015; scale-x: 0.878000021; scale-y: 0.80400002; }
        frame 83 { x: 5.19999981; y: -14.8000002; skew-x: -90.8000031; scale-x: 0.915000021; scale-y: 0.726000011; }
        frame 84 { x: 3.5; y: -12.6000004; skew-x: -90.4000015; scale-x: 0.879999995; scale-y: 0.760999978; }
        frame 85 { x: 1.89999998; y: -10.3000002; skew-x: -90.1999969; scale-x: 0.845000029; scale-y: 0.796999991; }
        frame 86 { x: 0.200000003; y: -8.19999981; skew-x: -90; scale-x: 0.810000002; scale-y: 0.832000017; }
        frame 87 { x: -1.10000002; y: -5.9000001; skew-x: -89.9000015; scale-x: 0.776000023; scale-y: 0.866999984; }
        frame 88 { x: 0.300000012; y: -6.9000001; skew-x: -10000; scale-x: 0.787999988; scale-y: 0.833999991; }
        frame 89 { x: 1.70000005; y: -7.9000001; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 90 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 17.2000008; y: -6.80000019; skew-x: -62.7999992; skew-y: -62.7999992; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 93 { x: 41.5999985; y: -10.5; skew-x: -35.7999992; skew-y: -35.7999992; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 94 { x: 52.2999992; y: -10.1000004; skew-x: -17.7000008; skew-y: -17.7000008; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 67.1999969; y: -8.30000019; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 96 { x: -10000; y: -6.9000001; skew-x: -10000; skew-y: -10000; scale-x: 0.808000028; scale-y: 0.796000004; }
        frame 97 { x: 67.0999985; y: -5.5999999; scale-x: 0.815999985; scale-y: 0.791999996; }
        frame 98 { x: 67.1999969; y: -7; scale-x: 0.808000028; scale-y: 0.796000004; }
        frame 99 { x: -10000; y: -8.30000019; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "CobCannon_husk3.2";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { x: 67.3000031; y: -8.10000038; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; alpha: 0; image: IMAGE_REANIM_COBCANNON_HUSK3; }
        frame 25 { x: 67.5; y: -10000; skew-x: -0.200000003; scale-x: 0.801999986; scale-y: -10000; cel: -10000; alpha: 0.109999999; image: none; }
        frame 26 { x: 67.5999985; y: -8.19999981; skew-x: -0.400000006; scale-x: 0.805000007; alpha: 0.219999999; }
        frame 27 { x: 67.6999969; y: -10000; skew-x: -0.699999988; scale-x: 0.806999981; alpha: 0.330000013; }
        frame 28 { x: 67.9000015; skew-x: -0.899999976; scale-x: 0.810000002; alpha: 0.449999988; }
        frame 29 { x: 68.0999985; y: -8.30000019; skew-x: -1.20000005; scale-x: 0.811999977; alpha: 0.550000012; }
        frame 30 { x: 68.3000031; y: -10000; skew-x: -1.5; scale-x: 0.814999998; alpha: 0.670000017; }
        frame 31 { x: 68.5; y: -8.19999981; skew-x: -1.89999998; scale-x: 0.816999972; alpha: 0.779999971; }
        frame 32 { x: 68.5999985; y: -10000; skew-x: -2.20000005; scale-x: 0.819999993; alpha: 0.889999986; }
        frame 33 { x: 68.8000031; y: -8.10000038; skew-x: -2.5; scale-x: 0.822000027; alpha: 1; }
        frame 34 { x: 68.3000031; y: -8.19999981; skew-x: -1.70000005; scale-x: 0.816999972; alpha: 0.75; }
        frame 35 { x: 68; y: -8.10000038; skew-x: -1.20000005; scale-x: 0.81099999; alpha: 0.5; }
        frame 36 { x: 67.5999985; y: -8.19999981; skew-x: -0.400000006; scale-x: 0.805999994; alpha: 0.25; }
        frame 37 { x: 67.3000031; y: -8.10000038; skew-x: 0; scale-x: 0.800000012; alpha: 0; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; cel: -1; alpha: -10000; }
        frame 39 { cel: -10000; }
        frame 78 { x: -6.30000019; y: 12.8999996; skew-x: -100.699997; skew-y: -89.9000015; scale-x: 0.68599999; scale-y: 0.987999976; cel: 0; alpha: 1; }
        frame 79 { x: -5.69999981; y: 3.29999995; skew-x: -95.9000015; skew-y: -10000; scale-x: 0.745000005; scale-y: 0.975000024; cel: -10000; alpha: -10000; }
        frame 80 { x: -5.5999999; y: -6.19999981; skew-x: -91.1999969; scale-x: 0.805000007; scale-y: 0.962000012; }
        frame 81 { x: -2.20000005; y: -9.10000038; skew-x: -90.9000015; scale-x: 0.841000021; scale-y: 0.883000016; }
        frame 82 { x: 1.10000002; y: -11.8999996; skew-x: -90.6999969; scale-x: 0.878000021; scale-y: 0.80400002; }
        frame 83 { x: 4.69999981; y: -14.8000002; skew-x: -90.8000031; scale-x: 0.913999975; scale-y: 0.726000011; }
        frame 84 { x: 3.5; y: -13.3999996; skew-x: -90.6999969; scale-x: 0.870000005; scale-y: 0.750999987; alpha: 0.75; }
        frame 85 { x: 2.5; y: -12; skew-x: -90.9000015; scale-x: 0.824999988; scale-y: 0.776000023; alpha: 0.5; }
        frame 86 { x: 1.29999995; y: -10.6000004; skew-x: -10000; scale-x: 0.781000018; scale-y: 0.801999986; alpha: 0.25; }
        frame 87 { x: 0.300000012; y: -9.30000019; skew-x: -91.0999985; scale-x: 0.736999989; scale-y: 0.827000022; alpha: 0; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 89 { cel: -10000; }
    }
    Track {
        source-name: "CobCannon_cob";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 30 { x: 24.1000004; y: -6.0999999; scale-x: 0.465000004; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_COBCANNON_COB; }
        frame 31 { x: 24.2000008; y: -10000; scale-x: 0.584999979; scale-y: -10000; cel: -10000; image: none; }
        frame 32 { x: 24.1000004; scale-x: 0.704999983; }
        frame 33 { x: -10000; scale-x: 0.824999988; }
        frame 34 { scale-x: 0.816999972; }
        frame 35 { x: 24.2000008; scale-x: 0.808000028; }
        frame 36 { x: 24.1000004; scale-x: 0.800000012; }
        frame 37 { x: -10000; scale-x: -10000; }
        frame 40 { x: 24; y: -5.4000001; scale-x: 0.802999973; scale-y: 0.797999978; }
        frame 41 { x: 23.7999992; y: -4.80000019; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 42 { x: 23.6000004; y: -4.0999999; scale-x: 0.808000028; scale-y: 0.79400003; }
        frame 43 { x: 23.5; y: -3.5; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 44 { x: 23.3999996; y: -2.79999995; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 45 { x: 23.1000004; y: -2.0999999; scale-x: 0.816999972; scale-y: 0.787; }
        frame 46 { x: 23; y: -1.5; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 47 { x: 22.8999996; y: -0.800000012; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 48 { x: 22.6000004; y: -0.100000001; scale-x: 0.824999988; scale-y: 0.781000018; }
        frame 49 { x: 22.7999992; y: 0.300000012; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 50 { x: 22.8999996; y: 1; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 51 { x: 23.1000004; y: 0; scale-x: 0.816999972; scale-y: 0.787; }
        frame 52 { x: 23.2000008; y: -0.899999976; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 53 { x: 23.3999996; y: -1.89999998; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 54 { x: 23.6000004; y: -3; scale-x: 0.808000028; scale-y: 0.79400003; }
        frame 55 { x: 23.7000008; y: -4; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 56 { x: 23.8999996; y: -5.0999999; scale-x: 0.802999973; scale-y: 0.797999978; }
        frame 57 { x: 24.1000004; y: -6.0999999; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 10.6000004; y: 2.9000001; skew-x: -14.6999998; skew-y: -14.6999998; scale-x: 0.799000025; scale-y: 0.795000017; }
        frame 60 { x: 1.89999998; y: 13.1000004; skew-x: -29.7000008; skew-y: -29.7000008; scale-x: -10000; scale-y: 0.790000021; }
        frame 61 { x: -2; y: 23.1000004; skew-x: -44.9000015; skew-y: -44.9000015; scale-x: 0.800000012; scale-y: 0.787; }
        frame 62 { x: -1; y: 32.7999992; skew-x: -59.9000015; skew-y: -59.9000015; scale-x: 0.799000025; scale-y: 0.782000005; }
        frame 63 { x: 3.79999995; y: 40; skew-x: -75.0999985; skew-y: -75.0999985; scale-x: -10000; scale-y: 0.777999997; }
        frame 64 { x: 11.6999998; y: 43; skew-x: -89.9000015; skew-y: -89.9000015; scale-x: 0.800000012; scale-y: 0.773999989; }
        frame 65 { x: 11.1999998; y: 44.5; skew-x: -10000; skew-y: -10000; scale-x: 0.792999983; scale-y: 0.786000013; }
        frame 66 { x: 10.8000002; y: 45.5999985; scale-x: 0.786000013; scale-y: 0.797999978; }
        frame 67 { x: 11.1999998; y: 44.4000015; scale-x: 0.792999983; scale-y: 0.786000013; }
        frame 68 { x: 11.6999998; y: 43; scale-x: 0.800000012; scale-y: 0.773999989; }
        frame 69 { x: 10.6000004; y: 44; scale-x: 0.790000021; scale-y: 0.790000021; }
        frame 70 { x: 9.5; y: 45; scale-x: 0.779999971; scale-y: 0.805999994; }
        frame 71 { x: 8.39999962; y: 46; scale-x: 0.769999981; scale-y: 0.82099998; }
        frame 72 { x: 7.30000019; y: 47; scale-x: 0.759000003; scale-y: 0.837000012; }
        frame 73 { x: 6.30000019; y: 48; scale-x: 0.749000013; scale-y: 0.852999985; }
        frame 74 { x: 5.19999981; y: 49; scale-x: 0.739000022; scale-y: 0.867999971; }
        frame 75 { x: 4.0999999; y: 50; scale-x: 0.728999972; scale-y: 0.884000003; }
        frame 76 { x: 3; y: 51; scale-x: 0.718999982; scale-y: 0.899999976; }
        frame 77 { x: 1.89999998; y: 52; scale-x: 0.708999991; scale-y: 0.915000021; }
        frame 78 { x: 0.899999976; y: 53; scale-x: 0.698000014; scale-y: 0.930999994; }
        frame 79 { x: 1.20000005; y: 21.5; scale-x: 0.749000013; scale-y: 0.922999978; }
        frame 80 { x: 1.5; y: -9.80000019; scale-x: 0.799000025; scale-y: 0.915000021; }
        frame 81 { x: 1.79999995; y: -41.4000015; scale-x: 0.850000024; scale-y: 0.907999992; }
        frame 82 { x: 2; y: -73; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 83 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 84 { cel: -10000; }
    }
    Track {
        source-name: "CobCannon_husk2";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 13.5; y: 0.300000012; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_COBCANNON_HUSK2; }
        frame 6 { x: 13.3000002; y: 0.899999976; scale-x: 0.802999973; scale-y: 0.797999978; cel: -10000; image: none; }
        frame 7 { x: 13.1000004; y: 1.60000002; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 8 { x: 12.8999996; y: 2.20000005; scale-x: 0.808000028; scale-y: 0.79400003; }
        frame 9 { x: 12.6999998; y: 2.9000001; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 10 { x: 12.5; y: 3.5; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 11 { x: 12.3000002; y: 4.19999981; scale-x: 0.816999972; scale-y: 0.787; }
        frame 12 { x: 12.1000004; y: 4.80000019; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 13 { x: 11.8999996; y: 5.5; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 14 { x: 11.6999998; y: 6.19999981; scale-x: 0.824999988; scale-y: 0.781000018; }
        frame 15 { x: 11.8999996; y: 5.5; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 16 { x: 12.1000004; y: 4.80000019; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 17 { x: 12.3000002; y: 4.19999981; scale-x: 0.816999972; scale-y: 0.787; }
        frame 18 { x: 12.5; y: 3.5; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 19 { x: 12.6999998; y: 2.9000001; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 20 { x: 12.8999996; y: 2.29999995; scale-x: 0.808000028; scale-y: 0.79400003; }
        frame 21 { x: 13.1000004; y: 1.60000002; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 22 { x: 13.3999996; y: 1; scale-x: 0.802999973; scale-y: 0.797999978; }
        frame 23 { x: 13.5; y: 0.300000012; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { y: 0.5; skew-x: 0.100000001; scale-x: 0.801999986; }
        frame 26 { x: 13.6000004; y: -10000; skew-x: 0.300000012; scale-x: 0.805000007; }
        frame 27 { x: 13.5; skew-x: 0.5; scale-x: 0.806999981; }
        frame 28 { x: -10000; skew-x: 0.800000012; scale-x: 0.810000002; }
        frame 29 { y: 0.400000006; skew-x: 1; scale-x: 0.811999977; }
        frame 30 { y: -10000; skew-x: 1.29999995; scale-x: 0.814999998; }
        frame 31 { x: 13.6000004; y: 0.300000012; skew-x: 1.5; scale-x: 0.816999972; }
        frame 32 { x: 13.5; y: -10000; skew-x: 1.79999995; scale-x: 0.819999993; }
        frame 33 { x: 13.6000004; skew-x: 2; scale-x: 0.822000027; }
        frame 34 { x: -10000; skew-x: 1.5; scale-x: 0.818000019; }
        frame 35 { x: 13.5; y: 0.400000006; skew-x: 1; scale-x: 0.813000023; }
        frame 36 { x: 13.6000004; y: 0.300000012; skew-x: 0.800000012; scale-x: 0.809000015; }
        frame 37 { x: 13.5; y: 0.400000006; skew-x: 0.300000012; scale-x: 0.80400002; }
        frame 38 { x: -10000; y: 0.300000012; skew-x: 0; scale-x: 0.800000012; }
        frame 39 { y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 40 { x: 13.3000002; y: 0.899999976; scale-x: 0.802999973; scale-y: 0.797999978; }
        frame 41 { x: 13.1000004; y: 1.60000002; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 42 { x: 12.8999996; y: 2.20000005; scale-x: 0.808000028; scale-y: 0.79400003; }
        frame 43 { x: 12.6999998; y: 2.9000001; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 44 { x: 12.5; y: 3.5; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 45 { x: 12.3000002; y: 4.19999981; scale-x: 0.816999972; scale-y: 0.787; }
        frame 46 { x: 12.1000004; y: 4.80000019; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 47 { x: 11.8999996; y: 5.5; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 48 { x: 11.6999998; y: 6.19999981; scale-x: 0.824999988; scale-y: 0.781000018; }
        frame 49 { x: 11.8999996; y: 5.5; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 50 { x: 12.1000004; y: 4.80000019; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 51 { x: 12.3000002; y: 4.19999981; scale-x: 0.816999972; scale-y: 0.787; }
        frame 52 { x: 12.5; y: 3.5; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 53 { x: 12.6999998; y: 2.9000001; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 54 { x: 12.8999996; y: 2.29999995; scale-x: 0.808000028; scale-y: 0.79400003; }
        frame 55 { x: 13.1000004; y: 1.60000002; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 56 { x: 13.3999996; y: 1; scale-x: 0.802999973; scale-y: 0.797999978; }
        frame 57 { x: 13.5; y: 0.300000012; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 6.69999981; y: 13.8999996; skew-x: -14.6999998; skew-y: -14.6999998; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 60 { x: 2.4000001; y: 22.8999996; skew-x: -29.5; skew-y: -29.7000008; scale-x: 0.797999978; scale-y: -10000; }
        frame 61 { x: 2.29999995; y: 31.8999996; skew-x: -44.2999992; skew-y: -44.9000015; scale-x: 0.799000025; scale-y: 0.800000012; }
        frame 62 { x: 4.5; y: 41.5999985; skew-x: -59.0999985; skew-y: -59.9000015; scale-x: 0.797999978; scale-y: 0.799000025; }
        frame 63 { x: 10.3999996; y: 49.2000008; skew-x: -73.9000015; skew-y: -75.0999985; scale-x: 0.799000025; scale-y: -10000; }
        frame 64 { x: 19.5; y: 53.2999992; skew-x: -88.5999985; skew-y: -89.9000015; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 65 { x: 19.2000008; y: 54.5; skew-x: -10000; skew-y: -10000; scale-x: 0.792999983; scale-y: 0.811999977; }
        frame 66 { x: 18.7999992; y: 55.7000008; skew-x: -88.5; scale-x: 0.786000013; scale-y: 0.824000001; }
        frame 67 { x: 19.2000008; y: 54.5; skew-x: -88.5999985; scale-x: 0.792999983; scale-y: 0.811999977; }
        frame 68 { x: 19.5; y: 53.2999992; skew-x: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 69 { x: 18.2000008; y: 54.0999985; skew-x: -87.0999985; scale-x: 0.790000021; scale-y: 0.819999993; }
        frame 70 { x: 17; y: 55; skew-x: -85.5999985; scale-x: 0.778999984; scale-y: 0.839999974; }
        frame 71 { x: 15.8000002; y: 55.7000008; skew-x: -84.0999985; scale-x: 0.768999994; scale-y: 0.861000001; }
        frame 72 { x: 14.6000004; y: 56.5; skew-x: -82.5999985; scale-x: 0.759000003; scale-y: 0.880999982; }
        frame 73 { x: 13.3999996; y: 57.0999985; skew-x: -81.0999985; scale-x: 0.748000026; scale-y: 0.901000023; }
        frame 74 { x: 12.3000002; y: 57.9000015; skew-x: -79.5999985; scale-x: 0.737999976; scale-y: 0.921000004; }
        frame 75 { x: 11.3000002; y: 58.4000015; skew-x: -78.0999985; scale-x: 0.727999985; scale-y: 0.941999972; }
        frame 76 { x: 10.3000002; y: 59; skew-x: -76.5; scale-x: 0.717999995; scale-y: 0.962000012; }
        frame 77 { x: 10; y: 61.5999985; skew-x: -75.4000015; scale-x: 0.708000004; scale-y: 0.975000024; }
        frame 78 { x: 9.69999981; y: 64.3000031; skew-x: -74.1999969; scale-x: 0.699000001; scale-y: 0.987999976; }
        frame 79 { x: 9.39999962; y: 60; skew-x: -80.4000015; scale-x: 0.768000007; scale-y: 0.975000024; }
        frame 80 { x: 10.3000002; y: 55.4000015; skew-x: -86.5; scale-x: 0.837000012; scale-y: 0.962000012; }
        frame 81 { x: 12.6000004; y: 55.2999992; skew-x: -87.0999985; scale-x: 0.874000013; scale-y: 0.883000016; }
        frame 82 { x: 14.6999998; y: 55.2000008; skew-x: -87.4000015; scale-x: 0.911000013; scale-y: 0.80400002; }
        frame 83 { x: 16.7999992; y: 55.0999985; skew-x: -87.6999969; scale-x: 0.948000014; scale-y: 0.726000011; }
        frame 84 { x: 15.8999996; y: 54.5999985; skew-x: -87.9000015; scale-x: 0.904999971; scale-y: 0.760999978; }
        frame 85 { x: 14.8999996; y: 54.2000008; skew-x: -88.0999985; scale-x: 0.861999989; scale-y: 0.796999991; }
        frame 86 { x: 13.8999996; y: 53.7000008; skew-x: -88.4000015; scale-x: 0.819000006; scale-y: 0.832000017; }
        frame 87 { x: 12.6000004; y: 53.2999992; skew-x: -88.5; scale-x: 0.776000023; scale-y: 0.866999984; }
        frame 88 { x: 13.6999998; y: -10000; skew-x: -88.5999985; scale-x: 0.787999988; scale-y: 0.833999991; }
        frame 89 { x: 14.5; skew-x: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 90 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 2.20000005; y: 44.0999985; skew-x: -62.0999985; skew-y: -62.7999992; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 93 { x: 1.5; y: 26.7000008; skew-x: -35.2999992; skew-y: -35.7999992; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 94 { x: 4.4000001; y: 12.8999996; skew-x: -17.5; skew-y: -17.7000008; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 13.5; y: 0.300000012; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 96 { x: 13; y: 1.60000002; skew-x: -10000; skew-y: -10000; scale-x: 0.808000028; scale-y: 0.796000004; }
        frame 97 { x: 12.3999996; y: 3; scale-x: 0.815999985; scale-y: 0.791999996; }
        frame 98 { x: 13; y: 1.70000005; scale-x: 0.808000028; scale-y: 0.796000004; }
        frame 99 { x: 13.5; y: 0.300000012; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 11.8000002; y: -17.3999996; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_COBCANNON_HUSK1; }
        frame 6 { x: 11.6000004; y: -16.7000008; scale-x: 0.802999973; scale-y: 0.797999978; cel: -10000; image: none; }
        frame 7 { x: 11.3999996; y: -16; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 8 { x: 11.1999998; y: -15.3000002; scale-x: 0.808000028; scale-y: 0.79400003; }
        frame 9 { x: 11; y: -14.6000004; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 10 { x: 10.8000002; y: -13.8999996; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 11 { x: 10.6000004; y: -13.1999998; scale-x: 0.816999972; scale-y: 0.787; }
        frame 12 { x: 10.3999996; y: -12.5; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 13 { x: 10.1999998; y: -11.8999996; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 14 { x: 10; y: -11.1999998; scale-x: 0.824999988; scale-y: 0.781000018; }
        frame 15 { x: 10.1999998; y: -11.6999998; skew-x: 0.5; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 16 { x: 10.3999996; y: -12.5; skew-x: 1.29999995; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 17 { x: 10.6000004; y: -13.1999998; skew-x: 1; scale-x: 0.816999972; scale-y: 0.787; }
        frame 18 { x: 10.8999996; y: -13.8000002; skew-x: 0.800000012; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 19 { x: 11.1000004; y: -14.5; skew-x: 0.600000024; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 20 { x: 11.1999998; y: -15.3999996; skew-x: 0.5; scale-x: 0.809000015; scale-y: 0.79400003; }
        frame 21 { x: 11.3999996; y: -16; skew-x: 0.300000012; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 22 { x: 11.6999998; y: -16.6000004; skew-x: 0; scale-x: 0.802999973; scale-y: 0.797999978; }
        frame 23 { x: 11.8000002; y: -17.3999996; skew-x: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 11.8999996; y: -17.5; skew-x: -0.200000003; scale-x: 0.801999986; }
        frame 26 { x: 11.8000002; y: -10000; skew-x: -0.400000006; scale-x: 0.805000007; }
        frame 27 { x: -10000; y: -17.6000004; skew-x: -0.699999988; scale-x: 0.806999981; }
        frame 28 { y: -10000; skew-x: -1; scale-x: 0.810000002; }
        frame 29 { x: 11.8999996; y: -17.5; skew-x: -1.39999998; scale-x: 0.811999977; }
        frame 30 { x: 11.8000002; y: -10000; skew-x: -1.70000005; scale-x: 0.814999998; }
        frame 31 { x: -10000; y: -17.6000004; skew-x: -1.89999998; scale-x: 0.816999972; }
        frame 32 { y: -10000; skew-x: -2.20000005; scale-x: 0.819999993; }
        frame 33 { y: -17.3999996; skew-x: -2.70000005; scale-x: 0.823000014; }
        frame 34 { y: -17.6000004; skew-x: -2; scale-x: 0.818000019; }
        frame 35 { y: -10000; skew-x: -1.39999998; scale-x: 0.813000023; }
        frame 36 { y: -17.5; skew-x: -0.899999976; scale-x: 0.809000015; }
        frame 37 { y: -10000; skew-x: -0.400000006; scale-x: 0.80400002; }
        frame 38 { y: -17.3999996; skew-x: 0; scale-x: 0.800000012; }
        frame 39 { y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 40 { x: 11.6000004; y: -16.7000008; scale-x: 0.802999973; scale-y: 0.797999978; }
        frame 41 { x: 11.3999996; y: -16; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 42 { x: 11.1999998; y: -15.3000002; scale-x: 0.808000028; scale-y: 0.79400003; }
        frame 43 { x: 11; y: -14.6000004; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 44 { x: 10.8000002; y: -13.8999996; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 45 { x: 10.6000004; y: -13.1999998; scale-x: 0.816999972; scale-y: 0.787; }
        frame 46 { x: 10.3999996; y: -12.5; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 47 { x: 10.1999998; y: -11.8999996; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 48 { x: 10; y: -11.1999998; scale-x: 0.824999988; scale-y: 0.781000018; }
        frame 49 { x: 10.1999998; y: -11.6999998; skew-x: 0.5; scale-x: 0.823000014; scale-y: 0.782999992; }
        frame 50 { x: 10.3999996; y: -12.5; skew-x: 1.29999995; scale-x: 0.819999993; scale-y: 0.785000026; }
        frame 51 { x: 10.6000004; y: -13.1999998; skew-x: 1; scale-x: 0.816999972; scale-y: 0.787; }
        frame 52 { x: 10.8999996; y: -13.8000002; skew-x: 0.800000012; scale-x: 0.81400001; scale-y: 0.790000021; }
        frame 53 { x: 11.1000004; y: -14.5; skew-x: 0.600000024; scale-x: 0.81099999; scale-y: 0.791999996; }
        frame 54 { x: 11.1999998; y: -15.3999996; skew-x: 0.5; scale-x: 0.809000015; scale-y: 0.79400003; }
        frame 55 { x: 11.3999996; y: -16; skew-x: 0.300000012; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 56 { x: 11.6999998; y: -16.6000004; skew-x: 0; scale-x: 0.802999973; scale-y: 0.797999978; }
        frame 57 { x: 11.8000002; y: -17.3999996; skew-x: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 0.600000024; y: -6.0999999; skew-x: -14.8999996; skew-y: -14.6999998; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 60 { x: -9.10000038; y: 6.0999999; skew-x: -30; skew-y: -29.7000008; scale-x: 0.797999978; scale-y: -10000; }
        frame 61 { x: -14.3999996; y: 18.6000004; skew-x: -45.2999992; skew-y: -44.9000015; scale-x: 0.799000025; scale-y: 0.800000012; }
        frame 62 { x: -12.5; y: 33.5; skew-x: -60.5; skew-y: -59.9000015; scale-x: 0.797999978; scale-y: 0.799000025; }
        frame 63 { x: -7.0999999; y: 46; skew-x: -75.5999985; skew-y: -75.0999985; scale-x: 0.799000025; scale-y: -10000; }
        frame 64 { x: 1.60000002; y: 55; skew-x: -90.6999969; skew-y: -89.9000015; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 65 { x: 0.899999976; y: 56.0999985; skew-x: -10000; skew-y: -10000; scale-x: 0.792999983; scale-y: 0.811999977; }
        frame 66 { x: 0.300000012; y: 57.4000015; scale-x: 0.786000013; scale-y: 0.824000001; }
        frame 67 { x: 1; y: 56.2000008; scale-x: 0.792999983; scale-y: 0.811999977; }
        frame 68 { x: 1.60000002; y: 55; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 69 { x: 0; y: 55.7999992; skew-x: -92.1999969; scale-x: 0.790000021; scale-y: 0.819999993; }
        frame 70 { x: -1.20000005; y: 56.5; skew-x: -93.9000015; scale-x: 0.779999971; scale-y: 0.839999974; }
        frame 71 { x: -2.9000001; y: 57.4000015; skew-x: -95.4000015; scale-x: 0.768999994; scale-y: 0.861000001; }
        frame 72 { x: -4.30000019; y: 58; skew-x: -97.1999969; scale-x: 0.759000003; scale-y: 0.880999982; }
        frame 73 { x: -6; y: 58.7999992; skew-x: -98.6999969; scale-x: 0.749000013; scale-y: 0.901000023; }
        frame 74 { x: -7.5999999; y: 59.4000015; skew-x: -100.400002; scale-x: 0.739000022; scale-y: 0.921000004; }
        frame 75 { x: -9.39999962; y: 60; skew-x: -101.900002; scale-x: 0.728999972; scale-y: 0.941999972; }
        frame 76 { x: -11.1000004; y: 60.5; skew-x: -103.599998; scale-x: 0.718999982; scale-y: 0.962000012; }
        frame 77 { x: -11.8999996; y: 63.0999985; skew-x: -104.699997; scale-x: 0.708999991; scale-y: 0.975000024; }
        frame 78 { x: -12.6000004; y: 65.8000031; skew-x: -105.900002; scale-x: 0.700999975; scale-y: 0.987999976; }
        frame 79 { x: -11.1000004; y: 61.7000008; skew-x: -99.1999969; scale-x: 0.77700001; scale-y: 0.975000024; }
        frame 80 { x: -10000; y: 57; skew-x: -92.5; scale-x: 0.855000019; scale-y: 0.962000012; }
        frame 81 { x: -7.30000019; y: -10000; skew-x: -92.1999969; scale-x: 0.893000007; scale-y: 0.883000016; }
        frame 82 { x: -3.29999995; skew-x: -91.9000015; scale-x: 0.930999994; scale-y: 0.80400002; }
        frame 83 { x: 0.5; skew-x: -91.6999969; scale-x: 0.970000029; scale-y: 0.726000011; }
        frame 84 { x: -1.29999995; y: 56.5; skew-x: -91.4000015; scale-x: 0.921000004; scale-y: 0.760999978; }
        frame 85 { x: -3.20000005; y: 56; skew-x: -91.1999969; scale-x: 0.873000026; scale-y: 0.796999991; }
        frame 86 { x: -5.0999999; y: 55.5; skew-x: -90.9000015; scale-x: 0.824000001; scale-y: 0.832000017; }
        frame 87 { x: -6.5999999; y: 55; skew-x: -90.8000031; scale-x: 0.776000023; scale-y: 0.866999984; }
        frame 88 { x: -5; y: -10000; skew-x: -90.6999969; scale-x: 0.787999988; scale-y: 0.833999991; }
        frame 89 { x: -3.29999995; skew-x: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 90 { x: -3.4000001; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -3.29999995; }
        frame 92 { x: -13; y: 43; skew-x: -68.0999985; skew-y: -67.4000015; scale-x: 0.799000025; }
        frame 93 { x: -14.8999996; y: 24.5; skew-x: -45.2999992; skew-y: -44.9000015; scale-x: -10000; }
        frame 94 { x: -6.69999981; y: 2.79999995; skew-x: -22.5; skew-y: -22.3999996; }
        frame 95 { x: 11.8000002; y: -17.3999996; skew-x: 0; skew-y: 0; scale-x: 0.800000012; }
        frame 96 { x: 11.1999998; y: -16; skew-x: -10000; skew-y: -10000; scale-x: 0.808000028; scale-y: 0.796000004; }
        frame 97 { x: 10.6999998; y: -14.6000004; scale-x: 0.815999985; scale-y: 0.791999996; }
        frame 98 { x: 11.3000002; y: -16; scale-x: 0.808000028; scale-y: 0.796000004; }
        frame 99 { x: 11.8000002; y: -17.3999996; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "CobCannon_blink";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { x: 51.7999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_COBCANNON_BLINK1; }
        frame 2 { x: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_COBCANNON_BLINK2; }
        frame 3 { image: IMAGE_REANIM_COBCANNON_BLINK1; }
        frame 4 { cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 78 { x: -0.200000003; y: 31.6000004; skew-x: -105.900002; skew-y: -89.9000015; scale-x: 0.686999977; scale-y: 0.888999999; cel: 0; }
        frame 79 { x: 4.19999981; y: 22.8999996; skew-x: -100.5; skew-y: -10000; scale-x: 0.772000015; scale-y: 0.927999973; cel: -10000; image: IMAGE_REANIM_COBCANNON_BLINK2; }
        frame 80 { x: 7.80000019; y: 13.3999996; skew-x: -91.6999969; scale-x: 0.828000009; scale-y: -10000; image: none; }
        frame 81 { x: 10.3000002; y: 11.6999998; skew-x: -10000; scale-x: 0.856999993; scale-y: 0.856000006; }
        frame 82 { x: 12.8000002; y: 10.1999998; scale-x: 0.885999978; scale-y: 0.785000026; }
        frame 83 { x: 15.1000004; y: 8.5; scale-x: 0.915000021; scale-y: 0.713; }
        frame 84 { x: 14.3000002; y: 10.5; skew-x: -91.9000015; scale-x: 0.904999971; scale-y: 0.739000022; image: IMAGE_REANIM_COBCANNON_BLINK1; }
        frame 85 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 86 { cel: -10000; }
    }
    Track {
        source-name: "CobCannon_log1";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 6.19999981; y: 35; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_COBCANNON_LOG; }
        frame 6 { x: -10000; y: 35.0999985; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 35.2999992; }
        frame 8 { y: 35.5; }
        frame 9 { y: 35.5999985; }
        frame 10 { y: 35.7999992; }
        frame 11 { y: 36; }
        frame 12 { y: 36.0999985; }
        frame 13 { y: 36.2999992; }
        frame 14 { y: 36.4000015; }
        frame 15 { y: 36.2999992; }
        frame 16 { y: 36.0999985; }
        frame 17 { y: 36; }
        frame 18 { y: 35.7999992; }
        frame 19 { y: 35.5999985; }
        frame 20 { y: 35.5; }
        frame 21 { y: 35.2999992; }
        frame 22 { y: 35.0999985; }
        frame 23 { y: 35; }
        frame 24 { y: -10000; }
        frame 40 { y: 35.0999985; }
        frame 41 { y: 35.2999992; }
        frame 42 { y: 35.5; }
        frame 43 { y: 35.5999985; }
        frame 44 { y: 35.7999992; }
        frame 45 { y: 36; }
        frame 46 { y: 36.0999985; }
        frame 47 { y: 36.2999992; }
        frame 48 { y: 36.4000015; }
        frame 49 { y: 36.2999992; }
        frame 50 { y: 36.0999985; }
        frame 51 { y: 36; }
        frame 52 { y: 35.7999992; }
        frame 53 { y: 35.5999985; }
        frame 54 { y: 35.5; }
        frame 55 { y: 35.2999992; }
        frame 56 { y: 35.0999985; }
        frame 57 { y: 35; }
        frame 58 { y: -10000; }
        frame 59 { x: 5.80000019; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 60 { x: 5.69999981; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 61 { x: 5.30000019; skew-x: -1.39999998; skew-y: -1.39999998; }
        frame 62 { x: 5.0999999; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 63 { x: 5.5999999; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 64 { x: 6.19999981; skew-x: 0; skew-y: 0; }
        frame 65 { x: -10000; y: 36.2000008; skew-x: -10000; skew-y: -10000; }
        frame 66 { y: 37.4000015; }
        frame 67 { y: 36.2000008; }
        frame 68 { y: 35; }
        frame 69 { y: -10000; }
        frame 77 { y: 37.5999985; }
        frame 78 { y: 40.2000008; }
        frame 79 { y: 35.4000015; scale-y: 0.819000006; }
        frame 80 { y: 30.3999996; scale-y: 0.838; }
        frame 81 { y: 31.8999996; scale-y: 0.825999975; }
        frame 82 { y: 33.5; scale-y: 0.813000023; }
        frame 83 { y: 35; scale-y: 0.800000012; }
        frame 84 { x: 6; y: 35.4000015; scale-x: 0.801999986; scale-y: 0.791999996; }
        frame 85 { x: 5.80000019; y: 35.7000008; scale-x: 0.80400002; scale-y: 0.783999979; }
        frame 86 { x: 5.5999999; y: 36; scale-x: 0.805999994; scale-y: 0.776000023; }
        frame 87 { x: 5.4000001; y: 36.2999992; scale-x: 0.808000028; scale-y: 0.768000007; }
        frame 88 { x: 5.80000019; y: 35.5999985; scale-x: 0.80400002; scale-y: 0.783999979; }
        frame 89 { x: 6.19999981; y: 35; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 90 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 5.5; y: 36.2000008; scale-x: 0.808000028; scale-y: 0.796000004; }
        frame 97 { x: 4.80000019; y: 37.2999992; scale-x: 0.815999985; scale-y: 0.791999996; }
        frame 98 { x: 5.5; y: 36.0999985; scale-x: 0.808000028; scale-y: 0.796000004; }
        frame 99 { x: 6.19999981; y: 35; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "CobCannon_outerwheels";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 13; y: 31.8999996; scale-x: 0.699999988; scale-y: 0.699999988; cel: 0; image: IMAGE_REANIM_COBCANNON_WHEEL; }
        frame 6 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 59 { x: 12.5; y: 32.4000015; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 60 { x: 12; y: 33.0999985; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 61 { x: 11.6000004; y: 33.5; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 62 { x: 11.1999998; y: 34.4000015; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 63 { x: 12; y: 33.0999985; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 64 { x: 13; y: 31.8999996; skew-x: 0; skew-y: 0; }
        frame 65 { x: -10000; y: 32.9000015; skew-x: -10000; skew-y: -10000; scale-y: 0.68599999; }
        frame 66 { y: 33.9000015; scale-y: 0.671999991; }
        frame 67 { y: 32.9000015; scale-y: 0.68599999; }
        frame 68 { y: 31.8999996; scale-y: 0.699999988; }
        frame 69 { y: -10000; scale-y: -10000; }
        frame 77 { x: 12; y: 33.5; scale-x: 0.712000012; scale-y: 0.676999986; }
        frame 78 { x: 10.8999996; y: 35.0999985; scale-x: 0.723999977; scale-y: 0.653999984; }
        frame 79 { x: 11.8999996; y: 33.5; scale-x: 0.712000012; scale-y: 0.676999986; }
        frame 80 { x: 13; y: 31.8999996; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 81 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 32.2999992; scale-y: 0.694000006; }
        frame 85 { y: 32.7999992; scale-y: 0.688000023; }
        frame 86 { y: 33.2000008; scale-y: 0.681999981; }
        frame 87 { y: 33.5999985; scale-y: 0.675999999; }
        frame 88 { y: 32.7999992; scale-y: 0.688000023; }
        frame 89 { y: 31.8999996; scale-y: 0.699999988; }
        frame 90 { y: -10000; scale-y: -10000; }
        frame 96 { y: 32.7000008; scale-y: 0.68900001; }
        frame 97 { y: 33.5; scale-y: 0.676999986; }
        frame 98 { y: 32.7999992; scale-y: 0.68900001; }
        frame 99 { y: 31.8999996; scale-y: 0.699999988; }
    }
    Track {
        source-name: "CobCannon_outerwheels2";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 87.3000031; y: 31.8999996; scale-x: 0.699999988; scale-y: 0.699999988; cel: 0; image: IMAGE_REANIM_COBCANNON_WHEEL; }
        frame 6 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 59 { x: 86.8000031; y: 31; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 60 { x: 86.3000031; y: 30.2000008; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 61 { x: 85.8000031; y: 29.2999992; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 62 { x: 85.3000031; y: 28.5; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 63 { x: 86.3000031; y: 30.2000008; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 64 { x: 87.3000031; y: 31.8999996; skew-x: 0; skew-y: 0; }
        frame 65 { x: -10000; y: 32.9000015; skew-x: -10000; skew-y: -10000; scale-y: 0.68599999; }
        frame 66 { y: 33.9000015; scale-y: 0.671999991; }
        frame 67 { y: 32.9000015; scale-y: 0.68599999; }
        frame 68 { y: 31.8999996; scale-y: 0.699999988; }
        frame 69 { y: -10000; scale-y: -10000; }
        frame 77 { x: 87.5999985; y: 33.5; scale-x: 0.712000012; scale-y: 0.676999986; }
        frame 78 { x: 87.8000031; y: 35.0999985; scale-x: 0.723999977; scale-y: 0.653999984; }
        frame 79 { x: 87.5999985; y: 33.5; scale-x: 0.712000012; scale-y: 0.676999986; }
        frame 80 { x: 87.3000031; y: 31.8999996; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 81 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 32.2999992; scale-y: 0.694000006; }
        frame 85 { y: 32.7999992; scale-y: 0.688000023; }
        frame 86 { y: 33.2000008; scale-y: 0.681999981; }
        frame 87 { y: 33.5999985; scale-y: 0.675999999; }
        frame 88 { y: 32.7999992; scale-y: 0.688000023; }
        frame 89 { y: 31.8999996; scale-y: 0.699999988; }
        frame 90 { y: -10000; scale-y: -10000; }
        frame 96 { y: 32.7000008; scale-y: 0.68900001; }
        frame 97 { y: 33.5; scale-y: 0.676999986; }
        frame 98 { y: 32.7999992; scale-y: 0.68900001; }
        frame 99 { y: 31.8999996; scale-y: 0.699999988; }
    }
}
