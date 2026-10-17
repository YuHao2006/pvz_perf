export component Umbrellaleaf {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 32;
        frame 4 { cel: -1; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { cel: 0; }
        frame 5 { cel: -10000; }
        frame 19 { cel: -1; }
        frame 20 { cel: -10000; }
    }
    Track {
        source-name: "anim_block";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 19 { x: -57.5; y: -53.0999985; scale-x: 2.47900009; scale-y: 3.08899999; cel: 0; }
        frame 20 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 27.6000004; y: 33.5; scale-x: 0.637000024; scale-y: 0.637000024; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_BODY; }
        frame 5 { x: 27.5; y: 34; scale-x: 0.646000028; scale-y: 0.630999982; cel: -10000; image: none; }
        frame 6 { x: 27.2999992; y: 34.2999992; scale-x: 0.656000018; scale-y: 0.624000013; }
        frame 7 { x: 27.1000004; y: 34.7000008; scale-x: 0.665000021; scale-y: 0.617999971; }
        frame 8 { x: 27; y: 35; scale-x: 0.674000025; scale-y: 0.611000001; }
        frame 9 { x: 26.8999996; y: 35.4000015; scale-x: 0.683000028; scale-y: 0.603999972; }
        frame 10 { x: 26.7000008; y: 35.7999992; scale-x: 0.691999972; scale-y: 0.59799999; }
        frame 11 { x: 26.5; y: 36.2000008; scale-x: 0.700999975; scale-y: 0.591000021; }
        frame 12 { x: 26.7000008; y: 35.7999992; scale-x: 0.691999972; scale-y: 0.59799999; }
        frame 13 { x: 26.7999992; y: 35.4000015; scale-x: 0.683000028; scale-y: 0.603999972; }
        frame 14 { x: 27; y: 35; scale-x: 0.674000025; scale-y: 0.611000001; }
        frame 15 { x: 27.2000008; y: 34.5999985; scale-x: 0.665000021; scale-y: 0.617999971; }
        frame 16 { x: -10000; y: 34.2999992; scale-x: 0.656000018; scale-y: 0.624000013; }
        frame 17 { x: 27.3999996; y: 33.9000015; scale-x: 0.646000028; scale-y: 0.630999982; }
        frame 18 { x: 27.6000004; y: 33.5; scale-x: 0.637000024; scale-y: 0.637000024; }
        frame 19 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 27.2000008; y: 32.2999992; scale-x: 0.661000013; scale-y: 0.661000013; }
        frame 21 { x: 26.7999992; y: 31; scale-x: 0.684000015; scale-y: 0.684000015; }
        frame 22 { x: 26.3999996; y: 29.7999992; scale-x: 0.707000017; scale-y: 0.707000017; }
        frame 23 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 26.7999992; y: 31; scale-x: 0.684000015; scale-y: 0.684000015; }
        frame 29 { x: 27.1000004; y: 31.8999996; scale-x: 0.667999983; scale-y: 0.667999983; }
        frame 30 { x: 27.2999992; y: 32.7000008; scale-x: 0.652999997; scale-y: 0.652999997; }
        frame 31 { x: 27.6000004; y: 33.5; scale-x: 0.637000024; scale-y: 0.637000024; }
    }
    Track {
        source-name: "Umbrellaleaf_blink";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { x: 33.0999985; y: 50.5999985; scale-x: 0.665000021; scale-y: 0.665000021; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_BLINK1; }
        frame 2 { x: 33; y: 50.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_UMBRELLALEAF_BLINK2; }
        frame 3 { x: 33.0999985; y: 50.5999985; image: IMAGE_REANIM_UMBRELLALEAF_BLINK1; }
        frame 4 { x: -10000; y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf5";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 32.9000015; y: 3.9000001; scale-x: 0.637000024; scale-y: 0.637000024; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF5; }
        frame 5 { x: 32.5; y: 4; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 32; y: 4.30000019; skew-x: -3.0999999; skew-y: -3.0999999; }
        frame 7 { x: 32.5; y: 4.4000001; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 8 { x: 33; y: 4.69999981; skew-x: 1; skew-y: 1; }
        frame 9 { x: 33.5999985; y: 4.80000019; skew-x: 3.29999995; skew-y: 3.29999995; }
        frame 10 { x: 34.0999985; y: 5; skew-x: 5.5; skew-y: 5.5; }
        frame 11 { x: 34.9000015; y: 5.19999981; skew-x: 7.80000019; skew-y: 7.80000019; }
        frame 12 { x: 34.5; y: 6.30000019; skew-x: 6.5; skew-y: 6.5; scale-y: 0.610000014; }
        frame 13 { x: 34.0999985; y: 7.4000001; skew-x: 5.5; skew-y: 5.5; scale-y: 0.583000004; }
        frame 14 { x: 33.9000015; y: 6.80000019; skew-x: 4.30000019; skew-y: 4.30000019; scale-y: 0.593999982; }
        frame 15 { x: 33.5999985; y: 6; skew-x: 3.29999995; skew-y: 3.29999995; scale-y: 0.603999972; }
        frame 16 { x: 33.4000015; y: 5.30000019; skew-x: 2.0999999; skew-y: 2.0999999; scale-y: 0.61500001; }
        frame 17 { x: 33; y: 4.69999981; skew-x: 1; skew-y: 1; scale-y: 0.625999987; }
        frame 18 { x: 32.9000015; y: 3.9000001; skew-x: 0; skew-y: 0; scale-y: 0.637000024; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 20 { x: 26.1000004; y: -36; skew-x: -2.70000005; skew-y: -1.70000005; scale-x: 1.23800004; scale-y: 1.35800004; }
        frame 21 { x: 18.5; y: -74.6999969; skew-x: -5.4000001; skew-y: -3.4000001; scale-x: 1.83899999; scale-y: 2.07800007; }
        frame 22 { x: 10.1000004; y: -111.900002; skew-x: -8.30000019; skew-y: -5.4000001; scale-x: 2.44099998; scale-y: 2.79900002; }
        frame 23 { x: 11.3999996; y: -106.800003; skew-x: -8.19999981; skew-y: -5.19999981; scale-x: 2.34699988; scale-y: 2.69099998; }
        frame 24 { x: 12.3000002; y: -101.5; skew-x: -8.30000019; skew-y: -5.4000001; scale-x: 2.25500011; scale-y: 2.58599997; }
        frame 25 { x: 11.3000002; y: -106.800003; skew-x: -8.19999981; skew-y: -5.19999981; scale-x: 2.34699988; scale-y: 2.69099998; }
        frame 26 { x: 10.1000004; y: -111.900002; skew-x: -8.30000019; skew-y: -5.4000001; scale-x: 2.44099998; scale-y: 2.79900002; }
        frame 27 { x: 20; y: -62.0999985; skew-x: -6.19999981; skew-y: -4.69999981; scale-x: 1.64900005; scale-y: 1.80400002; }
        frame 28 { x: 29.3999996; y: -10.8000002; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.859000027; scale-y: 0.810000002; }
        frame 29 { x: 30.6000004; y: -5.9000001; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.785000026; scale-y: 0.751999974; }
        frame 30 { x: 31.7000008; y: -1; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.711000025; scale-y: 0.694999993; }
        frame 31 { x: 32.9000015; y: 3.9000001; skew-x: 0; skew-y: 0; scale-x: 0.637000024; scale-y: 0.637000024; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf4";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 9.60000038; y: 4.80000019; scale-x: 0.637000024; scale-y: 0.637000024; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF4; }
        frame 5 { x: 9.80000019; y: 4.4000001; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 10; y: 4; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 7 { x: 9.5; y: 5.30000019; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 8 { x: 9; y: 6.69999981; skew-x: -3.4000001; skew-y: -3.4000001; }
        frame 9 { x: 8.60000038; y: 8.19999981; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 10 { x: 8.19999981; y: 9.60000038; skew-x: -8.19999981; skew-y: -8.19999981; }
        frame 11 { x: 7.69999981; y: 11.1000004; skew-x: -10.6999998; skew-y: -10.6999998; }
        frame 12 { x: 8.19999981; y: 12.3999996; skew-x: -11.3999996; skew-y: -9.19999981; scale-y: 0.603999972; }
        frame 13 { x: 8.5; y: 13.6000004; skew-x: -12.3000002; skew-y: -8.10000038; scale-x: 0.638000011; scale-y: 0.57099998; }
        frame 14 { x: 8.60000038; y: 11.8000002; skew-x: -9.69999981; skew-y: -6.4000001; scale-x: -10000; scale-y: 0.583999991; }
        frame 15 { x: 8.89999962; y: 10; skew-x: -7.19999981; skew-y: -4.69999981; scale-y: 0.597000003; }
        frame 16 { x: 9.10000038; y: 8.30000019; skew-x: -4.69999981; skew-y: -3.20000005; scale-x: 0.637000024; scale-y: 0.611000001; }
        frame 17 { x: 9.39999962; y: 6.5; skew-x: -2.20000005; skew-y: -1.39999998; scale-x: -10000; scale-y: 0.624000013; }
        frame 18 { x: 9.60000038; y: 4.80000019; skew-x: 0; skew-y: 0; scale-y: 0.637000024; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 20 { x: -16.8999996; y: -36.7999992; skew-x: 3; skew-y: 1.79999995; scale-x: 1.23899996; scale-y: 1.35699999; }
        frame 21 { x: -42.5999985; y: -80; skew-x: 6; skew-y: 3.79999995; scale-x: 1.84000003; scale-y: 2.0769999; }
        frame 22 { x: -67.0999985; y: -124.699997; skew-x: 9.10000038; skew-y: 5.9000001; scale-x: 2.44199991; scale-y: 2.79699993; }
        frame 23 { x: -63.0999985; y: -119; skew-x: 9; skew-y: 5.80000019; scale-x: 2.34800005; scale-y: 2.69000006; }
        frame 24 { x: -59.0999985; y: -113.400002; skew-x: 9.10000038; skew-y: 5.9000001; scale-x: 2.25600004; scale-y: 2.58500004; }
        frame 25 { x: -63.0999985; y: -119.099998; skew-x: 9; skew-y: 5.80000019; scale-x: 2.34800005; scale-y: 2.69000006; }
        frame 26 { x: -67.0999985; y: -124.699997; skew-x: 9.10000038; skew-y: 5.9000001; scale-x: 2.44199991; scale-y: 2.79699993; }
        frame 27 { x: -33.4000015; y: -67.8000031; skew-x: 6.80000019; skew-y: 5.30000019; scale-x: 1.64999998; scale-y: 1.80299997; }
        frame 28 { x: 0.800000012; y: -12.6999998; skew-x: 4.80000019; skew-y: 4.80000019; scale-x: 0.859000027; scale-y: 0.810000002; }
        frame 29 { x: 3.5999999; y: -6.69999981; skew-x: 3; skew-y: 3; scale-x: 0.785000026; scale-y: 0.751999974; }
        frame 30 { x: 6.5; y: -0.800000012; skew-x: 1.5; skew-y: 1.5; scale-x: 0.711000025; scale-y: 0.694999993; }
        frame 31 { x: 9.60000038; y: 4.80000019; skew-x: 0; skew-y: 0; scale-x: 0.637000024; scale-y: 0.637000024; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf6";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 33.5; y: 11.3999996; scale-x: 0.637000024; scale-y: 0.637000024; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF6; }
        frame 5 { x: 33.4000015; y: 11.1999998; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 33.2999992; y: 11; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 7 { x: 33.7999992; y: 11.1000004; skew-x: 0.100000001; skew-y: 0.100000001; }
        frame 8 { x: 34.2999992; y: 11; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 9 { x: 34.7999992; y: 11.1999998; skew-x: 4.5999999; skew-y: 4.5999999; }
        frame 10 { x: 35.5; y: 11.1000004; skew-x: 7; skew-y: 7; }
        frame 11 { x: 36.0999985; y: 11.3000002; skew-x: 9.30000019; skew-y: 9.30000019; }
        frame 12 { x: 36.2000008; y: 11; skew-x: 11.1000004; skew-y: -10000; }
        frame 13 { x: 36.4000015; y: 10.6999998; skew-x: 13.1000004; scale-x: 0.638000011; }
        frame 14 { x: 35.7000008; y: 10.8999996; skew-x: 10.3000002; skew-y: 7.30000019; scale-x: -10000; }
        frame 15 { x: 35.0999985; y: 11; skew-x: 7.80000019; skew-y: 5.5; scale-x: 0.637000024; }
        frame 16 { x: 34.5999985; y: 11.1999998; skew-x: 5.0999999; skew-y: 3.5999999; scale-x: -10000; }
        frame 17 { x: 34; y: 11.3000002; skew-x: 2.5; skew-y: 1.79999995; }
        frame 18 { x: 33.5; y: 11.3999996; skew-x: 0; skew-y: 0; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 20 { x: 30.7000008; y: -19.2000008; skew-x: -1.70000005; skew-y: -1; scale-x: 1.29900002; scale-y: 1.35899997; }
        frame 21 { x: 27.2000008; y: -48.4000015; skew-x: -3.70000005; skew-y: -2.20000005; scale-x: 1.96000004; scale-y: 2.08100009; }
        frame 22 { x: 23; y: -76.0999985; skew-x: -5.5999999; skew-y: -3.5999999; scale-x: 2.62100005; scale-y: 2.80299997; }
        frame 23 { x: 23.7000008; y: -72.4000015; skew-x: -5.4000001; skew-y: -3.4000001; scale-x: 2.52099991; scale-y: 2.6960001; }
        frame 24 { x: 24.2000008; y: -68.4000015; skew-x: -5.5999999; skew-y: -3.5999999; scale-x: 2.42199993; scale-y: 2.58899999; }
        frame 25 { x: 23.7000008; y: -72.5; skew-x: -5.4000001; skew-y: -3.4000001; scale-x: 2.52099991; scale-y: 2.69499993; }
        frame 26 { x: 23; y: -76.0999985; skew-x: -5.5999999; skew-y: -3.5999999; scale-x: 2.62100005; scale-y: 2.80299997; }
        frame 27 { x: 28.1000004; y: -39.0999985; skew-x: -4.19999981; skew-y: -3.20000005; scale-x: 1.76400006; scale-y: 1.80599999; }
        frame 28 { x: 32.9000015; y: -0.699999988; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.907999992; scale-y: 0.810000002; }
        frame 29 { x: 33.0999985; y: 3.0999999; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.818000019; scale-y: 0.753000021; }
        frame 30 { x: 33.2999992; y: 7.19999981; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.727999985; scale-y: 0.694999993; }
        frame 31 { x: 33.5; y: 11.3999996; skew-x: 0; skew-y: 0; scale-x: 0.637000024; scale-y: 0.637000024; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf3";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { y: 16.2999992; scale-x: 0.637000024; scale-y: 0.637000024; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF3; }
        frame 5 { x: 0.100000001; y: 15.1000004; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 0.5; y: 13.8999996; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 7 { x: -0.100000001; y: 15.8000002; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 8 { x: -0.600000024; y: 17.6000004; skew-x: -2; skew-y: -2; }
        frame 9 { x: -1.20000005; y: 19.6000004; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 10 { x: -1.79999995; y: 21.5; skew-x: -7.19999981; skew-y: -7.19999981; }
        frame 11 { x: -2.29999995; y: 23.3999996; skew-x: -9.69999981; skew-y: -9.69999981; }
        frame 12 { x: -2.5999999; y: 24.5; skew-x: -11.8999996; skew-y: -10.5; scale-y: 0.635999978; }
        frame 13 { x: -2.79999995; y: 25.5; skew-x: -14.1999998; skew-y: -11.5; scale-y: 0.637000024; }
        frame 14 { x: -2.29999995; y: 23.5; skew-x: -11.1999998; skew-y: -9.19999981; scale-y: 0.635999978; }
        frame 15 { x: -1.79999995; y: 21.7000008; skew-x: -8.39999962; skew-y: -6.69999981; scale-y: 0.637000024; }
        frame 16 { x: -1.29999995; y: 19.7999992; skew-x: -5.5; skew-y: -4.4000001; scale-y: -10000; }
        frame 17 { x: -0.600000024; y: 18; skew-x: -2.70000005; skew-y: -2.20000005; }
        frame 18 { x: -0; y: 16.2999992; skew-x: 0; skew-y: 0; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 20 { x: -38.5; y: -13.1999998; skew-x: 1.79999995; skew-y: 1; scale-x: 1.301; scale-y: 1.35899997; }
        frame 21 { x: -76.4000015; y: -44.2000008; skew-x: 3.5; skew-y: 2.29999995; scale-x: 1.96599996; scale-y: 2.08100009; }
        frame 22 { x: -113.599998; y: -76.8000031; skew-x: 5.30000019; skew-y: 3.4000001; scale-x: 2.63000011; scale-y: 2.80299997; }
        frame 23 { x: -107.800003; y: -72.9000015; skew-x: -10000; skew-y: 3.29999995; scale-x: 2.52900004; scale-y: 2.6960001; }
        frame 24 { x: -101.900002; y: -69.0999985; skew-y: 3.4000001; scale-x: 2.43000007; scale-y: 2.58999991; }
        frame 25 { x: -107.900002; y: -72.8000031; skew-y: 3.29999995; scale-x: 2.52900004; scale-y: 2.6960001; }
        frame 26 { x: -113.599998; y: -76.8000031; skew-y: 3.4000001; scale-x: 2.63000011; scale-y: 2.80299997; }
        frame 27 { x: -64.1999969; y: -37.0999985; skew-x: 4; skew-y: 3; scale-x: 1.76999998; scale-y: 1.80599999; }
        frame 28 { x: -14.6000004; y: 1.10000002; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.911000013; scale-y: 0.810000002; }
        frame 29 { x: -9.80000019; y: 6.19999981; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: 0.819000006; scale-y: 0.753000021; }
        frame 30 { x: -5; y: 11.3000002; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.727999985; scale-y: 0.694999993; }
        frame 31 { x: -0; y: 16.2999992; skew-x: 0; skew-y: 0; scale-x: 0.637000024; scale-y: 0.637000024; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf7";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 37.7000008; y: 19.1000004; scale-x: 0.637000024; scale-y: 0.637000024; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF7; }
        frame 5 { x: 37.4000015; y: 19.3999996; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 37; y: 19.7000008; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 7 { x: 37.5; y: 19.7999992; skew-x: -1; skew-y: -1; }
        frame 8 { x: 37.9000015; y: 19.8999996; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 9 { x: 38.4000015; y: 20; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 10 { x: 38.9000015; y: 20.1000004; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 11 { x: 39.4000015; y: -10000; skew-x: 7; skew-y: 7; }
        frame 12 { x: 39.5; y: 19.6000004; skew-x: 8.80000019; skew-y: 6.80000019; }
        frame 13 { x: -10000; y: 19.1000004; skew-x: 10.6000004; skew-y: 6.5; scale-x: 0.638000011; }
        frame 14 { x: 39.0999985; y: -10000; skew-x: 8.30000019; skew-y: 5.0999999; scale-x: -10000; }
        frame 15 { x: 38.5999985; skew-x: 6.30000019; skew-y: 3.79999995; }
        frame 16 { x: 38.2999992; y: 19.2000008; skew-x: 4.0999999; skew-y: 2.5; }
        frame 17 { x: 38; y: 19.1000004; skew-x: 2; skew-y: 1.29999995; scale-x: 0.637000024; }
        frame 18 { x: 37.7000008; y: -10000; skew-x: 0; skew-y: 0; scale-x: -10000; }
        frame 19 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 20 { x: 33.9000015; y: -2.9000001; skew-x: -1.70000005; skew-y: -0.899999976; scale-x: 1.30299997; scale-y: 1.35899997; }
        frame 21 { x: 29.2999992; y: -23.8999996; skew-x: -3.4000001; skew-y: -2.20000005; scale-x: 1.96800005; scale-y: 2.08100009; }
        frame 22 { x: 24.5; y: -43.2999992; skew-x: -5.19999981; skew-y: -3.29999995; scale-x: 2.63400006; scale-y: 2.80299997; }
        frame 23 { x: 25.2999992; y: -40.7999992; skew-x: -10000; skew-y: -3.20000005; scale-x: 2.53299999; scale-y: 2.6960001; }
        frame 24 { x: 25.6000004; y: -38.2000008; skew-y: -3.29999995; scale-x: 2.43400002; scale-y: 2.58999991; }
        frame 25 { x: 25.1000004; y: -40.7999992; skew-y: -3.20000005; scale-x: 2.53299999; scale-y: 2.6960001; }
        frame 26 { x: 24.5; y: -43.2999992; skew-y: -3.29999995; scale-x: 2.63400006; scale-y: 2.80299997; }
        frame 27 { x: 29.7999992; y: -17.8999996; skew-x: -3.9000001; skew-y: -2.9000001; scale-x: 1.773; scale-y: 1.80599999; }
        frame 28 { x: 34.7999992; y: 8.80000019; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: 0.912; scale-y: 0.810000002; }
        frame 29 { x: 35.9000015; y: 12.1000004; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.819999993; scale-y: 0.753000021; }
        frame 30 { x: 36.7999992; y: 15.5; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.728999972; scale-y: 0.694999993; }
        frame 31 { x: 37.7000008; y: 19.1000004; skew-x: 0; skew-y: 0; scale-x: 0.637000024; scale-y: 0.637000024; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf2";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 11.1000004; y: 23.2000008; scale-x: 0.637000024; scale-y: 0.637000024; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF2; }
        frame 5 { x: 11.3999996; y: 22.7999992; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: 0.623000026; cel: -10000; image: none; }
        frame 6 { x: 11.6999998; y: 22.6000004; skew-x: 1.5; skew-y: 1.5; scale-y: 0.60799998; }
        frame 7 { x: 11.3999996; y: 23.3999996; skew-x: 0.5; skew-y: 0.5; scale-y: 0.614000022; }
        frame 8 { x: 11.1999998; y: 24.1000004; skew-x: -0.200000003; skew-y: -0.200000003; scale-y: 0.620000005; }
        frame 9 { x: 11; y: 24.7999992; skew-x: -1; skew-y: -1; scale-y: 0.625999987; }
        frame 10 { x: 10.6999998; y: 25.6000004; skew-x: -1.89999998; skew-y: -1.89999998; scale-y: 0.630999982; }
        frame 11 { x: 10.3000002; y: 26.2000008; skew-x: -2.9000001; skew-y: -2.9000001; scale-y: 0.637000024; }
        frame 12 { x: 10.1000004; y: 26.7999992; skew-x: -4.4000001; skew-y: -4.4000001; scale-y: -10000; }
        frame 13 { x: 9.69999981; y: 27.3999996; skew-x: -6.19999981; skew-y: -6.19999981; }
        frame 14 { x: 10; y: 26.5; skew-x: -4.9000001; skew-y: -4.9000001; }
        frame 15 { x: 10.1999998; y: 25.7000008; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 16 { x: 10.6000004; y: 24.7999992; skew-x: -2.4000001; skew-y: -2.4000001; }
        frame 17 { x: 10.8000002; y: 24; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 18 { x: 11.1000004; y: 23.2000008; skew-x: 0; skew-y: 0; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 20 { x: -21.1000004; y: 2.0999999; skew-x: 1.5; skew-y: 1; scale-x: 1.35699999; scale-y: 1.35899997; }
        frame 21 { x: -52.7000008; y: -19.7999992; skew-x: 3; skew-y: 2; scale-x: 2.0769999; scale-y: 2.08100009; }
        frame 22 { x: -83.3000031; y: -42.7999992; skew-x: 4.69999981; skew-y: 3.0999999; scale-x: 2.79699993; scale-y: 2.8039999; }
        frame 23 { x: -78.6999969; y: -39.9000015; skew-x: 4.5999999; skew-y: 3; scale-x: 2.69000006; scale-y: 2.69700003; }
        frame 24 { x: -74; y: -37.7000008; skew-x: 4.69999981; skew-y: 3.0999999; scale-x: 2.58400011; scale-y: 2.58999991; }
        frame 25 { x: -78.6999969; y: -40.0999985; skew-x: 4.5999999; skew-y: 3; scale-x: 2.69000006; scale-y: 2.69700003; }
        frame 26 { x: -83.3000031; y: -42.7999992; skew-x: 4.69999981; skew-y: 3.0999999; scale-x: 2.79699993; scale-y: 2.8039999; }
        frame 27 { x: -43.2999992; y: -15.3000002; skew-x: 3.5; skew-y: 2.79999995; scale-x: 1.87600005; scale-y: 1.80700004; }
        frame 28 { x: -2.9000001; y: 10.6000004; skew-x: 2.5; skew-y: 2.5; scale-x: 0.954999983; scale-y: 0.81099999; }
        frame 29 { x: 1.5; y: 14.8999996; skew-x: 1.5; skew-y: 1.5; scale-x: 0.848999977; scale-y: 0.753000021; }
        frame 30 { x: 6.30000019; y: 19.1000004; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.742999971; scale-y: 0.694999993; }
        frame 31 { x: 11.1000004; y: 23.2000008; skew-x: 0; skew-y: 0; scale-x: 0.637000024; scale-y: 0.637000024; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf1";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 32; y: 24; scale-x: 0.637000024; scale-y: 0.637000024; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF1; }
        frame 5 { x: 32.0999985; y: 24.1000004; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: -10000; scale-y: 0.621999979; cel: -10000; image: none; }
        frame 6 { x: 32.4000015; y: 24.2000008; skew-x: -0.899999976; skew-y: -0.899999976; scale-y: 0.606999993; }
        frame 7 { x: -10000; y: 24.2999992; skew-x: -0.200000003; skew-y: -0.200000003; scale-y: 0.612999976; }
        frame 8 { y: 24.5; skew-x: 0.100000001; skew-y: 0.100000001; scale-y: 0.619000018; }
        frame 9 { x: 32.5; y: 24.6000004; skew-x: 0.800000012; skew-y: 0.800000012; scale-y: 0.625; }
        frame 10 { x: -10000; y: 24.7999992; skew-x: 1.29999995; skew-y: 1.29999995; scale-y: 0.630999982; }
        frame 11 { y: 25; skew-x: 2; skew-y: 2; scale-y: 0.637000024; }
        frame 12 { x: 32.7000008; y: 24.7000008; skew-x: 2.79999995; skew-y: 2.79999995; scale-y: 0.648000002; }
        frame 13 { x: 32.9000015; y: 24.5; skew-x: 3.5999999; skew-y: 3.5999999; scale-y: 0.658999979; }
        frame 14 { x: 32.5999985; y: 24.3999996; skew-x: 2.79999995; skew-y: 2.79999995; scale-y: 0.653999984; }
        frame 15 { x: 32.5; y: -10000; skew-x: 2; skew-y: 2; scale-y: 0.649999976; }
        frame 16 { x: 32.4000015; y: 24.2000008; skew-x: 1.29999995; skew-y: 1.29999995; scale-y: 0.646000028; }
        frame 17 { x: 32.0999985; y: -10000; skew-x: 0.600000024; skew-y: 0.600000024; scale-y: 0.64200002; }
        frame 18 { x: 32; y: 24; skew-x: 0; skew-y: 0; scale-y: 0.637000024; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 20 { x: 27.3999996; y: 4.80000019; skew-x: -2.20000005; skew-y: -1.39999998; scale-x: 1.25199997; scale-y: 1.48199999; }
        frame 21 { x: 21.3999996; y: -12.6999998; skew-x: -4.69999981; skew-y: -3; scale-x: 1.86600006; scale-y: 2.3269999; }
        frame 22 { x: 13.6000004; y: -28.7000008; skew-x: -7.4000001; skew-y: -4.69999981; scale-x: 2.48099995; scale-y: 3.17199993; }
        frame 23 { x: 14.8999996; y: -26.7000008; skew-x: -7.19999981; skew-y: -10000; scale-x: 2.38599992; scale-y: 3.05100012; }
        frame 24 { x: 15.5; y: -24.6000004; skew-x: -7.4000001; scale-x: 2.29299998; scale-y: 2.93099999; }
        frame 25 { x: 14.8000002; y: -26.7999992; skew-x: -7.19999981; scale-x: 2.38599992; scale-y: 3.05100012; }
        frame 26 { x: 13.6000004; y: -28.7000008; skew-x: -7.4000001; scale-x: 2.48099995; scale-y: 3.17199993; }
        frame 27 { x: 22.2999992; y: -8.30000019; skew-x: -5.5; skew-y: -4.19999981; scale-x: 1.67499995; scale-y: 2.02999997; }
        frame 28 { x: 30.2000008; y: 13.5; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: 0.870000005; scale-y: 0.889999986; }
        frame 29 { x: 31; y: 16.7999992; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.791999996; scale-y: 0.805000007; }
        frame 30 { x: 31.6000004; y: 20.3999996; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.714999974; scale-y: 0.721000016; }
        frame 31 { x: 32; y: 24; skew-x: 0; skew-y: 0; scale-x: 0.637000024; scale-y: 0.637000024; }
    }
}
