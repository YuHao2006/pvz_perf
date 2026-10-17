export component Stinky {
    fps: 12;
    Track {
        source-name: "_ground";
        frame-count: 71;
        frame 0 { x: -23.2000008; y: -6.30000019; }
        frame 1 { x: -23; y: -10000; }
        frame 2 { x: -22.8999996; }
        frame 3 { x: -22.7999992; }
        frame 4 { x: -22.7000008; }
        frame 5 { x: -22.5; }
        frame 6 { x: -22.3999996; }
        frame 7 { x: -21.7000008; }
        frame 8 { x: -21; }
        frame 9 { x: -20.2999992; }
        frame 10 { x: -19.6000004; }
        frame 11 { x: -18.8999996; }
        frame 12 { x: -10000; }
        frame 16 { cel: -1; }
        frame 17 { cel: -10000; }
    }
    Track {
        source-name: "turn";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 16 { x: 0.100000001; cel: 0; image: IMAGE_REANIM_STINKY_TURN1; }
        frame 17 { x: -10000; y: 0.200000003; cel: -10000; image: IMAGE_REANIM_STINKY_TURN2; }
        frame 18 { y: 0.899999976; image: IMAGE_REANIM_STINKY_TURN3; }
        frame 19 { x: -0; y: 0; image: IMAGE_REANIM_STINKY_TURN4; }
        frame 20 { x: 0.100000001; y: -10000; image: IMAGE_REANIM_STINKY_TURN5; }
        frame 21 { x: -10000; image: IMAGE_REANIM_STINKY_TURN6; }
        frame 22 { y: -0.899999976; image: IMAGE_REANIM_STINKY_TURN7; }
        frame 23 { y: -1.89999998; image: IMAGE_REANIM_STINKY_TURN8; }
        frame 24 { y: -10000; cel: -1; image: none; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_crawl";
        frame-count: 71;
        frame 16 { cel: -1; }
        frame 17 { cel: -10000; }
    }
    Track {
        source-name: "anim_turn";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 16 { cel: 0; }
        frame 17 { cel: -10000; }
        frame 24 { cel: -1; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_in";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
        frame 43 { cel: -1; }
        frame 44 { cel: -10000; }
    }
    Track {
        source-name: "anim_out";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 43 { cel: 0; }
        frame 44 { cel: -10000; }
        frame 58 { cel: -1; }
        frame 59 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 58 { cel: 0; }
        frame 59 { cel: -10000; }
    }
    Track {
        source-name: "tail";
        frame-count: 71;
        frame 0 { x: 58.0999985; y: 40.9000015; image: IMAGE_REANIM_STINKY_TAIL; }
        frame 1 { x: -10000; y: -10000; image: none; }
        frame 7 { x: 56.2000008; scale-x: 1.11000001; }
        frame 8 { x: 54.0999985; scale-x: 1.22000003; }
        frame 9 { x: 52.2000008; scale-x: 1.329; }
        frame 10 { x: 55.0999985; scale-x: 1.16499996; }
        frame 11 { x: 57.9000015; scale-x: 1; }
        frame 12 { x: 58; scale-x: -10000; }
        frame 14 { x: 58.0999985; }
        frame 15 { x: -10000; }
        frame 16 { cel: -1; }
        frame 17 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
        frame 29 { x: 58.2000008; scale-x: 0.855000019; }
        frame 30 { x: 58.2999992; scale-x: 0.708999991; }
        frame 31 { x: -10000; scale-x: 0.56400001; }
        frame 32 { x: 58.4000015; scale-x: 0.419; }
        frame 33 { x: 55.0999985; scale-x: -10000; }
        frame 34 { x: 51.9000015; }
        frame 35 { x: 51.2999992; y: 40.4000015; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 36 { x: 50.5999985; y: 40; skew-x: -7.4000001; skew-y: -7.4000001; }
        frame 37 { x: 51.2000008; y: 40.5; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 38 { x: 51.9000015; y: 40.9000015; skew-x: 0; skew-y: 0; }
        frame 39 { x: 52.4000015; y: 41; skew-x: 2; skew-y: 2; }
        frame 40 { x: 53; y: 41.0999985; skew-x: 4.30000019; skew-y: 4.30000019; scale-y: 0.999000013; }
        frame 41 { x: 52.5; y: 41; skew-x: 2; skew-y: 2; scale-y: 1; }
        frame 42 { x: 51.9000015; y: 40.9000015; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 55.0999985; scale-x: 0.465999991; }
        frame 45 { x: 58.4000015; scale-x: 0.513000011; }
        frame 46 { x: 61.5999985; scale-x: 0.560000002; }
        frame 47 { x: -10000; scale-x: -10000; }
        frame 50 { x: 60.2999992; scale-x: 0.646000028; }
        frame 51 { x: 59; scale-x: 0.73299998; }
        frame 52 { x: 57.5999985; scale-x: 0.819999993; }
        frame 53 { x: 57.7999992; scale-x: 0.856000006; }
        frame 54 { x: 57.9000015; scale-x: 0.89200002; }
        frame 55 { x: 58; scale-x: 0.927999973; }
        frame 56 { scale-x: 0.963999987; }
        frame 57 { x: 58.0999985; scale-x: 1; }
        frame 58 { x: -10000; scale-x: -10000; }
        frame 59 { x: 58.2000008; scale-x: 1.00999999; }
        frame 60 { x: 58.0999985; scale-x: 1.01999998; }
        frame 61 { x: 58.2000008; scale-x: 1.02999997; }
        frame 62 { x: 58.0999985; scale-x: 1.03999996; }
        frame 63 { x: -10000; scale-x: 1.04999995; }
        frame 64 { scale-x: 1.05999994; }
        frame 65 { x: 58.2000008; scale-x: 1.04999995; }
        frame 66 { x: 58.0999985; scale-x: 1.03999996; }
        frame 67 { x: 58.2000008; scale-x: 1.02999997; }
        frame 68 { x: -10000; scale-x: 1.01999998; }
        frame 69 { x: 58.0999985; scale-x: 1.00999999; }
        frame 70 { x: -10000; scale-x: 1; }
    }
    Track {
        source-name: "body";
        frame-count: 71;
        frame 0 { x: 1.20000005; y: 12.8999996; image: IMAGE_REANIM_STINKY_BODY; }
        frame 1 { x: 0.600000024; y: -10000; skew-y: -0.699999988; scale-x: 1.005; scale-y: 1.00100005; image: none; }
        frame 2 { x: -0.100000001; skew-y: -1.70000005; scale-x: 1.00999999; scale-y: 1.00199997; }
        frame 3 { x: -0.699999988; skew-y: -2.70000005; scale-x: 1.01499999; scale-y: -10000; }
        frame 4 { x: -1.5; skew-y: -3.70000005; scale-x: 1.01999998; scale-y: 1.00300002; }
        frame 5 { x: -2.20000005; skew-y: -4.69999981; scale-x: 1.02499998; scale-y: 1.00399995; }
        frame 6 { x: -2.9000001; skew-y: -5.5999999; scale-x: 1.02999997; scale-y: 1.005; }
        frame 7 { x: -1.5; skew-y: -4.4000001; scale-x: 1.02400005; scale-y: 1.00399995; }
        frame 8 { x: -0.200000003; skew-y: -3.20000005; scale-x: 1.01800001; scale-y: 1.00300002; }
        frame 9 { x: 1; skew-y: -2.20000005; scale-x: 1.01199996; scale-y: 1.00199997; }
        frame 10 { x: 2.29999995; skew-y: -0.899999976; scale-x: 1.00600004; scale-y: 1.00100005; }
        frame 11 { x: 3.5999999; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 12 { x: 3; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 2.4000001; }
        frame 14 { x: 1.79999995; }
        frame 15 { x: 1.20000005; }
        frame 16 { x: -10000; cel: -1; }
        frame 17 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { x: 1.10000002; y: 15.5; skew-x: -7.19999981; skew-y: -7.19999981; cel: -10000; }
        frame 26 { x: 1.29999995; y: 18.5; skew-x: -14.6999998; skew-y: -14.6999998; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 27 { x: 2; y: 21.7000008; skew-x: -22.2000008; skew-y: -22.2000008; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 3; y: 25.2000008; skew-x: -29.8999996; skew-y: -29.8999996; scale-x: 1; scale-y: 1; }
        frame 29 { x: 8.69999981; y: 41.4000015; skew-x: -47.2999992; skew-y: -47; scale-x: 0.992999971; scale-y: 0.984000027; }
        frame 30 { x: 16; y: 48.5; skew-x: -64.9000015; skew-y: -64.0999985; scale-x: 0.99000001; scale-y: 0.972000003; }
        frame 31 { x: 21.1000004; y: 52.5999985; skew-x: -82.4000015; skew-y: -81.3000031; scale-x: 0.986000001; scale-y: 0.958000004; }
        frame 32 { x: 28; y: 55; skew-x: -99.8000031; skew-y: -98.3000031; scale-x: 0.981999993; scale-y: 0.94599998; }
        frame 33 { x: 28.2000008; y: 55.0999985; skew-x: -99.6999969; skew-y: -98.1999969; scale-x: -10000; scale-y: 0.885999978; }
        frame 34 { x: 28.3999996; y: 55.4000015; skew-x: -99.8000031; skew-y: -98.3000031; scale-y: 0.827000022; }
        frame 35 { x: 29; y: 55.5; skew-x: -103.5; skew-y: -101.900002; scale-x: 0.981000006; scale-y: 0.825999975; }
        frame 36 { x: 29.7000008; y: -10000; skew-x: -107.400002; skew-y: -105.800003; scale-x: 0.981999993; scale-y: -10000; }
        frame 37 { x: 29.3999996; y: 54.5999985; skew-x: -103.5; skew-y: -101.900002; scale-x: 0.981000006; }
        frame 38 { x: 29.1000004; y: 53.5999985; skew-x: -99.8000031; skew-y: -98.3000031; scale-x: 0.981999993; scale-y: 0.827000022; }
        frame 39 { x: -10000; y: 52.7999992; skew-x: -97.6999969; skew-y: -96; scale-x: -10000; scale-y: 0.825999975; }
        frame 40 { x: 29.2999992; y: 52.0999985; skew-x: -95.5999985; skew-y: -94; scale-y: -10000; }
        frame 41 { x: 29.2000008; y: 52.9000015; skew-x: -97.6999969; skew-y: -96; }
        frame 42 { x: 29.1000004; y: 53.5999985; skew-x: -99.8000031; skew-y: -98.3000031; scale-y: 0.827000022; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 44 { x: 18.3999996; y: 54.7000008; skew-x: -78.9000015; skew-y: -77.4000015; scale-x: 0.981000006; scale-y: 0.876999974; }
        frame 45 { x: 10.1999998; y: 49.5; skew-x: -57.7999992; skew-y: -56.2999992; scale-x: 0.980000019; scale-y: 0.927999973; }
        frame 46 { x: 7.69999981; y: 44; skew-x: -48.5; skew-y: -46.9000015; scale-x: 0.981000006; scale-y: 0.981000006; }
        frame 47 { x: 5.5; y: 33.7000008; skew-x: -38.5; skew-y: -37; scale-x: 0.980000019; scale-y: 0.978999972; }
        frame 48 { x: 4.19999981; y: 23.5; skew-x: -28.5; skew-y: -26.8999996; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 3.5999999; y: 13.6999998; skew-x: -18.5; skew-y: -16.8999996; scale-x: 0.981000006; scale-y: 0.981000006; }
        frame 50 { x: 1.5; y: 15.6999998; skew-x: -15.8999996; skew-y: -14.1999998; scale-x: 0.980000019; scale-y: 0.980000019; }
        frame 51 { x: -0.5; y: 17.7000008; skew-x: -13.1999998; skew-y: -11.6999998; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: -2.70000005; y: 19.7000008; skew-x: -10.8000002; skew-y: -9.30000019; scale-x: 0.981000006; }
        frame 53 { x: -1.89999998; y: 18.2999992; skew-x: -8.5; skew-y: -7.19999981; scale-x: 0.984000027; scale-y: 0.984000027; }
        frame 54 { x: -1.10000002; y: 17.1000004; skew-x: -6.4000001; skew-y: -5.4000001; scale-x: 0.987999976; scale-y: 0.987999976; }
        frame 55 { x: -0.300000012; y: 15.6999998; skew-x: -4.19999981; skew-y: -3.5; scale-x: 0.991999984; scale-y: 0.991999984; }
        frame 56 { x: 0.300000012; y: 14.3000002; skew-x: -1.89999998; skew-y: -1.70000005; scale-x: 0.995999992; scale-y: 0.995999992; }
        frame 57 { x: 1.20000005; y: 12.8999996; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 0.899999976; y: 13.1000004; scale-x: 1.00800002; scale-y: 0.995000005; }
        frame 60 { x: 0.600000024; y: 13.3000002; scale-x: 1.01499999; scale-y: 0.99000001; }
        frame 61 { x: 0.300000012; y: 13.5; scale-x: 1.023; scale-y: 0.985000014; }
        frame 62 { x: 0.100000001; y: 13.6999998; scale-x: 1.03100002; scale-y: 0.980000019; }
        frame 63 { x: -0.100000001; y: 13.8999996; scale-x: 1.03799999; scale-y: 0.976000011; }
        frame 64 { x: -0.400000006; y: 14.1000004; scale-x: 1.046; scale-y: 0.971000016; }
        frame 65 { x: -0.100000001; y: 14.6000004; skew-x: -0.899999976; scale-x: 1.03900003; scale-y: 0.975000024; }
        frame 66 { x: 0; y: 15.1999998; skew-x: -2.0999999; scale-x: 1.03199995; scale-y: 0.980000019; }
        frame 67 { x: 0.300000012; y: 14.6000004; skew-x: -1.39999998; scale-x: 1.02400005; scale-y: 0.985000014; }
        frame 68 { x: 0.600000024; y: 14.1000004; skew-x: -0.899999976; scale-x: 1.01600003; scale-y: 0.99000001; }
        frame 69 { x: 0.899999976; y: 13.5; skew-x: -0.400000006; scale-x: 1.00800002; scale-y: 0.995000005; }
        frame 70 { x: 1.20000005; y: 12.8999996; skew-x: 0; scale-x: 1; scale-y: 1; }
    }
    Track {
        source-name: "antenna";
        frame-count: 71;
        frame 0 { x: 3.29999995; y: 2.79999995; image: IMAGE_REANIM_STINKY_ANTENNA; }
        frame 1 { x: -10000; y: 2.5999999; skew-y: 2; scale-x: 1.005; scale-y: 1.00399995; image: none; }
        frame 2 { x: 3.5; y: -10000; skew-y: 4.0999999; scale-x: 1.00999999; scale-y: 1.00800002; }
        frame 3 { x: -10000; y: 2.5; skew-y: 6.30000019; scale-x: 1.01499999; scale-y: 1.01199996; }
        frame 4 { y: 2.4000001; skew-y: 8.30000019; scale-x: 1.01999998; scale-y: 1.01600003; }
        frame 5 { x: 3.5999999; y: -10000; skew-y: 10.5; scale-x: 1.02499998; scale-y: 1.01999998; }
        frame 6 { x: 3.5; y: 2.29999995; skew-y: 12.6000004; scale-x: 1.02999997; scale-y: 1.02499998; }
        frame 7 { x: 4.0999999; y: 2.4000001; skew-y: 10; scale-x: 1.02400005; scale-y: 1.01900005; }
        frame 8 { x: 4.5; y: 2.5; skew-y: 7.5; scale-x: 1.01800001; scale-y: 1.01400006; }
        frame 9 { x: 4.80000019; y: -10000; skew-y: 5; scale-x: 1.01199996; scale-y: 1.00999999; }
        frame 10 { x: 5.30000019; y: 2.5999999; skew-y: 2.5; scale-x: 1.00600004; scale-y: 1.005; }
        frame 11 { x: 5.80000019; y: 2.79999995; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 12 { x: 5.19999981; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 4.5999999; }
        frame 14 { x: 4; }
        frame 15 { x: 3.29999995; }
        frame 16 { x: -10000; cel: -1; }
        frame 17 { cel: -10000; }
        frame 24 { x: 3; y: 2; cel: 0; }
        frame 25 { x: 0; y: 6.80000019; skew-x: -11.5; skew-y: -18.2000008; scale-x: 1.02100003; scale-y: 1.00600004; cel: -10000; }
        frame 26 { x: -2.5999999; y: 12.3999996; skew-x: -23.2000008; skew-y: -36.7000008; scale-x: 1.04299998; scale-y: 1.01300001; }
        frame 27 { x: -4.4000001; y: 18.6000004; skew-x: -35; skew-y: -55.2999992; scale-x: 1.06400001; scale-y: 1.01999998; }
        frame 28 { x: -5.19999981; y: 24.8999996; skew-x: -46.9000015; skew-y: -73.5999985; scale-x: 1.08800006; scale-y: 1.02900004; }
        frame 29 { x: 4.0999999; y: 37.5; skew-x: -45.7999992; skew-y: -72.0999985; scale-x: 1.08099997; scale-y: 0.663999975; }
        frame 30 { x: 12.1999998; y: 45.4000015; skew-x: -59.5999985; skew-y: -85.6999969; scale-x: 1.07700002; scale-y: 0.463; }
        frame 31 { x: 18.7000008; y: 48.5; skew-x: -80.9000015; skew-y: -83.9000015; scale-x: 1.07200003; scale-y: 0.398999989; }
        frame 32 { x: 25.3999996; y: 50.2000008; skew-x: -102.099998; skew-y: -82; scale-x: 1.06700003; scale-y: 0.335000008; }
        frame 33 { x: 26.8999996; y: 50.2999992; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.230000004; }
        frame 34 { x: 27.7000008; y: 50.0999985; scale-y: 0.159999996; }
        frame 35 { x: -10000; y: -10000; scale-y: -10000; cel: -1; }
        frame 36 { cel: -10000; }
        frame 44 { x: 18.1000004; y: 49.7999992; skew-x: -87.0999985; skew-y: -67; scale-y: 0.333000004; cel: 0; }
        frame 45 { x: 10.1999998; y: 45.2999992; skew-x: -66.5999985; skew-y: -69.5999985; scale-x: 1.07299995; scale-y: 0.497999996; cel: -10000; }
        frame 46 { x: 2.4000001; y: 40; skew-x: -45.7999992; skew-y: -72.0999985; scale-x: 1.08099997; scale-y: 0.663999975; }
        frame 47 { x: -10000; y: 24.8999996; skew-x: -30.5; skew-y: -43.7999992; scale-x: 1.06200004; scale-y: 0.782999992; }
        frame 48 { x: 5; y: 10.6999998; skew-x: -15.1999998; skew-y: -15.3999996; scale-x: 1.04499996; scale-y: 0.902999997; }
        frame 49 { x: 10.3000002; y: -1.29999995; skew-x: 0; skew-y: 12.6000004; scale-x: 1.02999997; scale-y: 1.02499998; }
        frame 50 { x: 11.6000004; y: 0.5; skew-x: 7.5; skew-y: 24.2999992; scale-x: 1.02900004; scale-y: 1.04799998; }
        frame 51 { x: 12.8999996; y: 2.79999995; skew-x: 15; skew-y: 36.2999992; scale-x: 1.02999997; scale-y: 1.07299995; }
        frame 52 { x: 4.9000001; y: 5.30000019; skew-x: 7.5; skew-y: 18.1000004; scale-x: 1.01400006; scale-y: 1.03600001; }
        frame 53 { x: 0.800000012; y: 5.80000019; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 54 { x: 0.300000012; y: 5.30000019; skew-x: -1.70000005; skew-y: -7.4000001; scale-x: 0.991999984; scale-y: 1.01699996; }
        frame 55 { x: 0; y: 5.0999999; skew-x: -3.79999995; skew-y: -14.8999996; scale-x: 0.984000027; scale-y: 1.03499997; }
        frame 56 { x: 1.60000002; y: 3.9000001; skew-x: -1.70000005; skew-y: -7.4000001; scale-x: 0.991999984; scale-y: 1.01699996; }
        frame 57 { x: 3.29999995; y: 2.79999995; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { y: 3; skew-y: 0.800000012; scale-x: 1.00800002; scale-y: 0.995999992; }
        frame 60 { x: 3.20000005; y: 3.4000001; skew-y: 1.79999995; scale-x: 1.01499999; scale-y: 0.991999984; }
        frame 61 { x: -10000; y: 3.5; skew-y: 2.79999995; scale-x: 1.023; scale-y: 0.987999976; }
        frame 62 { x: 3.0999999; y: 3.79999995; skew-y: 3.79999995; scale-x: 1.03100002; scale-y: 0.984000027; }
        frame 63 { x: 3.20000005; y: 4.0999999; skew-y: 4.80000019; scale-x: 1.03799999; scale-y: 0.978999972; }
        frame 64 { x: 3.0999999; y: 4.30000019; skew-y: 5.80000019; scale-x: 1.046; scale-y: 0.976000011; }
        frame 65 { x: 4; y: 4.80000019; skew-x: -0.899999976; skew-y: 7.30000019; scale-x: 1.03900003; scale-y: 0.986999989; }
        frame 66 { x: 4.5; y: 5.19999981; skew-x: -2.0999999; skew-y: 8.89999962; scale-x: 1.03199995; scale-y: 0.999000013; }
        frame 67 { x: 4.19999981; y: 4.5; skew-x: -1.39999998; skew-y: 6.5; scale-x: 1.02400005; scale-y: -10000; }
        frame 68 { x: 3.9000001; y: 4; skew-x: -0.899999976; skew-y: 4.30000019; scale-x: 1.01600003; }
        frame 69 { x: 3.5; y: 3.4000001; skew-x: -0.400000006; skew-y: 2.0999999; scale-x: 1.00800002; scale-y: 1; }
        frame 70 { x: 3.29999995; y: 2.79999995; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: -10000; }
    }
    Track {
        source-name: "shell";
        frame-count: 71;
        frame 0 { x: 24.1000004; y: 7.80000019; image: IMAGE_REANIM_STINKY_SHELL; }
        frame 1 { x: 23.7999992; y: -10000; scale-x: 1.00600004; image: none; }
        frame 2 { x: 23.6000004; scale-x: 1.01100004; }
        frame 3 { x: 23.2999992; scale-x: 1.01699996; }
        frame 4 { x: 23; scale-x: 1.023; }
        frame 5 { x: 22.7999992; scale-x: 1.02900004; }
        frame 6 { x: 22.6000004; scale-x: 1.03400004; }
        frame 7 { x: 23.1000004; y: 7.69999981; scale-x: 1.01600003; scale-y: 1.00300002; }
        frame 8 { x: 23.7000008; y: 7.5; scale-x: 0.996999979; scale-y: 1.00600004; }
        frame 9 { x: 24.2999992; y: 7.30000019; scale-x: 0.977999985; scale-y: 1.00899994; }
        frame 10 { x: 24.8999996; y: 7.19999981; scale-x: 0.959999979; scale-y: 1.01300001; }
        frame 11 { x: 26.6000004; y: 7.0999999; scale-x: 0.940999985; scale-y: 1.01600003; }
        frame 12 { x: 25.8999996; y: 7.30000019; scale-x: 0.95599997; scale-y: 1.01199996; }
        frame 13 { x: 25.3999996; y: 7.5; scale-x: 0.971000016; scale-y: 1.00800002; }
        frame 14 { x: 24.7000008; y: 7.69999981; scale-x: 0.985000014; scale-y: 1.00399995; }
        frame 15 { x: 24.1000004; y: 7.80000019; scale-x: 1; scale-y: 1; }
        frame 16 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 17 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { x: 26.5; y: 5.80000019; skew-x: 3.5999999; skew-y: 3.5999999; cel: -10000; }
        frame 26 { x: 29.2000008; y: 3.79999995; skew-x: 7.30000019; skew-y: 7.30000019; }
        frame 27 { x: 32; y: 1.89999998; skew-x: 11.1000004; skew-y: 11.1000004; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 28 { x: 34.9000015; y: 0.100000001; skew-x: 15; skew-y: 15; scale-x: 1; scale-y: 1; }
        frame 29 { x: 32.5; y: 1.39999998; skew-x: 11.8000002; skew-y: 11.8000002; scale-x: 0.999000013; scale-y: 1.00300002; }
        frame 30 { x: 30.3999996; y: 2.5999999; skew-x: 8.80000019; skew-y: 8.80000019; scale-x: -10000; scale-y: 1.00800002; }
        frame 31 { x: 28.2000008; y: 4; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 1; scale-y: 1.01199996; }
        frame 32 { x: 26.1000004; y: 5.4000001; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: -10000; scale-y: 1.01699996; }
        frame 33 { x: 24.1000004; y: 6.80000019; skew-x: 0; skew-y: 0; scale-y: 1.02100003; }
        frame 34 { x: 23.3999996; y: 7.30000019; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.975000024; scale-y: 1.023; }
        frame 35 { x: 22.5; y: 7.9000001; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: 0.949000001; scale-y: 1.02499998; }
        frame 36 { x: 20.6000004; y: 9.19999981; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: 0.973999977; scale-y: 1.01199996; }
        frame 37 { x: 18.7000008; y: 10.8000002; skew-x: -7.4000001; skew-y: -7.4000001; scale-x: 1; scale-y: 1; }
        frame 38 { x: 24.1000004; y: 7.80000019; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 25.7999992; y: 7; skew-x: 2; skew-y: 2; }
        frame 40 { x: 27.6000004; y: 6.0999999; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 41 { x: 25.7999992; y: 6.9000001; skew-x: 2; skew-y: 2; scale-x: 1; scale-y: 1; }
        frame 42 { x: 24.1000004; y: 7.80000019; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 25.6000004; y: 6.9000001; skew-x: 2; skew-y: 2; }
        frame 45 { x: 27.2000008; y: 6.0999999; skew-x: 4; skew-y: 4; }
        frame 46 { x: 28.8999996; y: 5.19999981; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 47 { x: 32.4000015; y: 2.70000005; skew-x: 11.3000002; skew-y: 11.3000002; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 48 { x: 36.0999985; y: 0.300000012; skew-x: 16.2999992; skew-y: 16.2999992; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 39.9000015; y: -1.60000002; skew-x: 21.2999992; skew-y: 21.2999992; scale-x: 1; scale-y: 1; }
        frame 50 { x: 33.5999985; y: 1.20000005; skew-x: 13.8000002; skew-y: 13.8000002; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 51 { x: 27.7000008; y: 4.5999999; skew-x: 6.30000019; skew-y: 6.30000019; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 22.2000008; y: 8.39999962; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 53 { x: 21.8999996; y: 9.10000038; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 1.02400005; scale-y: 0.984000027; }
        frame 54 { x: 21.7000008; y: 9.69999981; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: 1.04900002; scale-y: 0.967999995; }
        frame 55 { x: 22.6000004; y: 9; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: 1.03199995; scale-y: 0.978999972; }
        frame 56 { x: 23.3999996; y: 8.39999962; skew-x: 0; skew-y: 0; scale-x: 1.01600003; scale-y: 0.989000022; }
        frame 57 { x: 24.1000004; y: 7.80000019; skew-x: -10000; skew-y: -10000; scale-x: 1; scale-y: 1; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 23.8999996; y: 8.10000038; scale-x: 1.005; scale-y: 0.994000018; }
        frame 60 { x: 23.7999992; y: 8.39999962; scale-x: 1.00999999; scale-y: 0.987999976; }
        frame 61 { x: 23.7000008; y: 8.69999981; scale-x: 1.01499999; scale-y: 0.981999993; }
        frame 62 { x: 23.6000004; y: 9; scale-x: 1.01999998; scale-y: 0.976000011; }
        frame 63 { x: 23.5; y: 9.30000019; scale-x: 1.02499998; scale-y: 0.970000029; }
        frame 64 { x: 23.2999992; y: 9.60000038; scale-x: 1.02900004; scale-y: 0.963999987; }
        frame 65 { x: 23.3999996; y: 9.30000019; scale-x: 1.02499998; scale-y: 0.970000029; }
        frame 66 { x: 23.6000004; y: 9; scale-x: 1.01999998; scale-y: 0.976000011; }
        frame 67 { x: 23.7000008; y: 8.69999981; scale-x: 1.01499999; scale-y: 0.981999993; }
        frame 68 { x: 23.7999992; y: 8.39999962; scale-x: 1.00999999; scale-y: 0.987999976; }
        frame 69 { x: 23.8999996; y: 8.10000038; scale-x: 1.005; scale-y: 0.994000018; }
        frame 70 { x: 24.1000004; y: 7.80000019; scale-x: 1; scale-y: 1; }
    }
}
