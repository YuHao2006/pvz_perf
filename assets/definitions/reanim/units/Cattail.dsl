export component Cattail {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 40;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 24 { cel: -1; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "Cattail_paw2";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 6.5; y: 54; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CATTAIL_PAW2; }
        frame 6 { x: 6.30000019; y: -10000; scale-x: 0.802999973; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 6.19999981; scale-x: 0.806999981; }
        frame 8 { x: 6.0999999; scale-x: 0.810000002; }
        frame 9 { x: 5.9000001; scale-x: 0.81400001; }
        frame 10 { x: 5.80000019; scale-x: 0.816999972; }
        frame 11 { x: 5.5999999; scale-x: 0.819999993; }
        frame 12 { x: 5.5; scale-x: 0.824000001; }
        frame 13 { x: 5.30000019; scale-x: 0.827000022; }
        frame 14 { x: 5.19999981; scale-x: 0.83099997; }
        frame 15 { x: 5.4000001; scale-x: 0.827000022; }
        frame 16 { x: 5.5; scale-x: 0.824000001; }
        frame 17 { x: 5.69999981; scale-x: 0.819999993; }
        frame 18 { x: 5.80000019; scale-x: 0.816999972; }
        frame 19 { x: 6; scale-x: 0.81400001; }
        frame 20 { x: 6.0999999; scale-x: 0.810000002; }
        frame 21 { x: 6.30000019; scale-x: 0.806999981; }
        frame 22 { x: 6.4000001; scale-x: 0.802999973; }
        frame 23 { x: 6.5; scale-x: 0.800000012; }
        frame 24 { x: -10000; scale-x: -10000; }
        frame 30 { x: 7; skew-y: 2.29999995; scale-y: 0.802999973; }
        frame 31 { x: 7.5; skew-y: 4.5; scale-y: 0.805999994; }
        frame 32 { x: 8; skew-y: 6.80000019; scale-y: 0.809000015; }
        frame 33 { x: 8.5; skew-y: 9; scale-y: 0.811999977; }
        frame 34 { x: 9; skew-y: 11.3000002; scale-y: 0.815999985; }
        frame 35 { x: 8.5; skew-y: 9; scale-y: 0.811999977; }
        frame 36 { x: 8; skew-y: 6.80000019; scale-y: 0.809000015; }
        frame 37 { x: 7.5999999; skew-y: 4.5; scale-y: 0.805999994; }
        frame 38 { x: 7.0999999; skew-y: 2.29999995; scale-y: 0.802999973; }
        frame 39 { x: 6.5; skew-y: 0; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cattail_paw3";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 57.7999992; y: 50.5999985; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CATTAIL_PAW3; }
        frame 6 { x: 57.7000008; y: -10000; scale-x: 0.810000002; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: -10000; scale-x: 0.82099998; }
        frame 8 { x: 57.5999985; scale-x: 0.83099997; }
        frame 9 { x: -10000; scale-x: 0.841000021; }
        frame 10 { scale-x: 0.851999998; }
        frame 11 { scale-x: 0.861999989; }
        frame 12 { x: 57.5; scale-x: 0.871999979; }
        frame 13 { x: -10000; scale-x: 0.883000016; }
        frame 14 { scale-x: 0.893000007; }
        frame 15 { scale-x: 0.883000016; }
        frame 16 { scale-x: 0.871999979; }
        frame 17 { x: 57.5999985; scale-x: 0.861999989; }
        frame 18 { x: -10000; scale-x: 0.851999998; }
        frame 19 { scale-x: 0.841000021; }
        frame 20 { scale-x: 0.83099997; }
        frame 21 { x: 57.7000008; scale-x: 0.82099998; }
        frame 22 { x: 57.5999985; scale-x: 0.810000002; }
        frame 23 { x: 57.7999992; scale-x: 0.800000012; }
        frame 24 { x: -10000; scale-x: -10000; }
        frame 30 { x: 57.5; y: 50.5; skew-x: 1.10000002; scale-x: 0.800999999; }
        frame 31 { x: 57.2999992; y: -10000; skew-x: 2.29999995; scale-x: 0.801999986; }
        frame 32 { x: 57; y: 50.4000015; skew-x: 3.5; scale-x: 0.802999973; }
        frame 33 { x: 56.7000008; y: 50.2999992; skew-x: 4.80000019; scale-x: -10000; }
        frame 34 { x: 56.5; y: 50.0999985; skew-x: 6.0999999; scale-x: 0.805000007; }
        frame 35 { x: 56.7000008; y: 50.2999992; skew-x: 4.80000019; scale-x: 0.802999973; }
        frame 36 { x: 57; y: 50.4000015; skew-x: 3.5; scale-x: -10000; }
        frame 37 { x: 57.2999992; y: 50.5; skew-x: 2.29999995; scale-x: 0.801999986; }
        frame 38 { x: 57.5; y: 50.5999985; skew-x: 1.10000002; scale-x: 0.800999999; }
        frame 39 { x: 57.7999992; y: -10000; skew-x: 0; scale-x: 0.800000012; }
    }
    Track {
        source-name: "Cattail_tail";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 2.4000001; y: 33.7999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CATTAIL_TAIL; }
        frame 6 { x: 3.29999995; y: 33.5; skew-x: 1; skew-y: 1.79999995; scale-x: -10000; scale-y: 0.799000025; cel: -10000; image: none; }
        frame 7 { x: 4.30000019; y: 33.4000015; skew-x: 2; skew-y: 3.5; scale-x: 0.800999999; scale-y: -10000; }
        frame 8 { x: 5.30000019; y: 33; skew-x: 3; skew-y: 5.30000019; scale-x: -10000; scale-y: 0.797999978; }
        frame 9 { x: 3.9000001; y: 34; skew-x: 0.600000024; skew-y: 2.5; scale-y: -10000; }
        frame 10 { x: 2.70000005; y: 34.7999992; skew-x: -1.39999998; skew-y: 0; scale-y: 0.799000025; }
        frame 11 { x: 1.39999998; y: 35.7999992; skew-x: -3.70000005; skew-y: -2.70000005; scale-x: 0.800000012; scale-y: -10000; }
        frame 12 { x: 0.200000003; y: 36.7000008; skew-x: -5.9000001; skew-y: -5.19999981; scale-x: -10000; }
        frame 13 { x: -0.899999976; y: 37.5999985; skew-x: -8.19999981; skew-y: -7.9000001; scale-x: 0.799000025; }
        frame 14 { x: -2.20000005; y: 38.7999992; skew-x: -10.6999998; skew-y: -10.6999998; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 15 { x: -10000; y: 39.0999985; skew-x: -10.8999996; skew-y: -10000; scale-x: 0.800999999; scale-y: 0.796999991; }
        frame 16 { y: 39.5; skew-x: -11.3999996; skew-y: -11; scale-x: 0.802999973; scale-y: 0.79400003; }
        frame 17 { y: 39.9000015; skew-x: -11.8000002; skew-y: -11.3000002; scale-x: 0.805999994; scale-y: 0.792999983; }
        frame 18 { x: -1.5; y: 38.7999992; skew-x: -9.69999981; skew-y: -9.39999962; scale-x: 0.80400002; scale-y: -10000; }
        frame 19 { x: -0.699999988; y: 37.7999992; skew-x: -7.69999981; skew-y: -7.4000001; scale-x: 0.802999973; scale-y: 0.795000017; }
        frame 20 { x: 0; y: 36.7000008; skew-x: -5.69999981; skew-y: -5.5; scale-x: -10000; scale-y: 0.796000004; }
        frame 21 { x: 0.699999988; y: 35.7000008; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: 0.801999986; scale-y: 0.796999991; }
        frame 22 { x: 1.60000002; y: 34.7000008; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.800999999; scale-y: 0.799000025; }
        frame 23 { x: 2.4000001; y: 33.7999992; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -1.20000005; y: 36.5; skew-x: -4.9000001; skew-y: -8.89999962; scale-y: 0.810000002; }
        frame 26 { x: -4.9000001; y: 39.5999985; skew-x: -9.89999962; skew-y: -17.8999996; scale-x: 0.799000025; scale-y: 0.819000006; }
        frame 27 { x: -8.30000019; y: 43; skew-x: -15; skew-y: -27; scale-x: -10000; scale-y: 0.828999996; }
        frame 28 { x: -11.5; y: 46.5999985; skew-x: -20.2000008; skew-y: -36; scale-x: 0.797999978; scale-y: 0.838999987; }
        frame 29 { x: -14.5; y: 50.5; skew-x: -25.2000008; skew-y: -45.2000008; scale-x: 0.799000025; scale-y: 0.850000024; }
        frame 30 { x: -9.10000038; y: 41.4000015; skew-x: -12.6999998; skew-y: -30; scale-x: 0.800000012; scale-y: 0.838; }
        frame 31 { x: -2.5999999; y: 32.9000015; skew-x: -0.200000003; skew-y: -15; scale-x: 0.801999986; scale-y: 0.828999996; }
        frame 32 { x: 5.19999981; y: 27.7000008; skew-x: 12.1000004; skew-y: 0; scale-x: 0.802999973; scale-y: 0.819000006; }
        frame 33 { x: 13.6999998; y: 23.3999996; skew-x: 24.6000004; skew-y: 14.8000002; scale-x: 0.80400002; scale-y: 0.809000015; }
        frame 34 { x: 22.7000008; y: 20.1000004; skew-x: 37.0999985; skew-y: 30; scale-x: 0.805999994; scale-y: 0.800000012; }
        frame 35 { x: 19.2999992; y: 22.5; skew-x: 29.8999996; skew-y: 25.5; scale-x: 0.795000017; scale-y: 0.805999994; }
        frame 36 { x: 16; y: 24.8999996; skew-x: 22.7999992; skew-y: 21; scale-x: 0.786000013; scale-y: 0.81400001; }
        frame 37 { x: 11.1999998; y: 27.6000004; skew-x: 15.1000004; skew-y: 14; scale-x: 0.790000021; scale-y: 0.809000015; }
        frame 38 { x: 6.69999981; y: 30.6000004; skew-x: 7.5; skew-y: 7; scale-x: 0.795000017; scale-y: 0.80400002; }
        frame 39 { x: 2.4000001; y: 33.7999992; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cattail_tail2";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -1.39999998; y: 4.69999981; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CATTAIL_TAIL2; }
        frame 6 { x: 3.20000005; y: 3.9000001; skew-x: 6.0999999; skew-y: 7.80000019; scale-x: 0.797999978; scale-y: 0.801999986; cel: -10000; image: none; }
        frame 7 { x: 8.19999981; y: 3.5; skew-x: 12.3000002; skew-y: 15.6000004; scale-x: 0.795000017; scale-y: 0.80400002; }
        frame 8 { x: 13.1999998; y: -10000; skew-x: 18.7000008; skew-y: 23.6000004; scale-x: 0.79400003; scale-y: 0.806999981; }
        frame 9 { x: 7.5; y: 4.69999981; skew-x: 11.3000002; skew-y: 15.3000002; scale-x: -10000; scale-y: 0.805000007; }
        frame 10 { x: 2; y: 6.0999999; skew-x: 3.79999995; skew-y: 7; scale-x: 0.796000004; scale-y: 0.80400002; }
        frame 11 { x: -3; y: 8.10000038; skew-x: -3.4000001; skew-y: -0.899999976; scale-x: 0.796999991; scale-y: 0.802999973; }
        frame 12 { x: -8.10000038; y: 10.1000004; skew-x: -10.6999998; skew-y: -9.19999981; scale-x: -10000; scale-y: 0.800999999; }
        frame 13 { x: -12.8999996; y: 12.6999998; skew-x: -18.2000008; skew-y: -17.3999996; scale-x: 0.797999978; scale-y: 0.800000012; }
        frame 14 { x: -17.5; y: 15.3999996; skew-x: -25.7000008; skew-y: -25.7000008; scale-x: 0.800000012; scale-y: -10000; }
        frame 15 { x: -19.5; y: 17.2999992; skew-x: -29; skew-y: -30.2000008; scale-x: 0.799000025; scale-y: 0.797999978; }
        frame 16 { x: -21.2999992; y: 19.3999996; skew-x: -32.5; skew-y: -35; scale-x: 0.800000012; scale-y: 0.796999991; }
        frame 17 { x: -23.1000004; y: 21.6000004; skew-x: -36.0999985; skew-y: -39.7000008; scale-x: 0.801999986; scale-y: -10000; }
        frame 18 { x: -20; y: 18.3999996; skew-x: -30; skew-y: -33; scale-x: 0.800999999; scale-y: 0.796000004; }
        frame 19 { x: -16.7000008; y: 15.3999996; skew-x: -24; skew-y: -26.3999996; scale-x: 0.800000012; scale-y: 0.796999991; }
        frame 20 { x: -13.1000004; y: 12.5; skew-x: -17.8999996; skew-y: -19.7000008; scale-x: -10000; scale-y: 0.797999978; }
        frame 21 { x: -9.39999962; y: 9.69999981; skew-x: -11.8999996; skew-y: -13.1999998; scale-y: -10000; }
        frame 22 { x: -5.5; y: 7.19999981; skew-x: -5.9000001; skew-y: -6.4000001; scale-y: 0.799000025; }
        frame 23 { x: -1.39999998; y: 4.69999981; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: -9.39999962; y: 9.10000038; skew-x: -4.9000001; skew-y: -8.89999962; scale-y: 0.810000002; }
        frame 26 { x: -17.3999996; y: 13.8999996; skew-x: -9.89999962; skew-y: -17.8999996; scale-x: 0.799000025; scale-y: 0.819000006; }
        frame 27 { x: -25.2000008; y: 19; skew-x: -15; skew-y: -27; scale-x: -10000; scale-y: 0.828999996; }
        frame 28 { x: -32.7000008; y: 24.7000008; skew-x: -20.2000008; skew-y: -36; scale-x: 0.797999978; scale-y: 0.838999987; }
        frame 29 { x: -40; y: 30.5; skew-x: -25.2000008; skew-y: -45.2000008; scale-x: 0.799000025; scale-y: 0.850000024; }
        frame 30 { x: -35.2000008; y: 23.7000008; skew-x: -29.7000008; skew-y: -48; scale-x: 0.790000021; scale-y: 0.861000001; }
        frame 31 { x: -30.5; y: 16.8999996; skew-x: -34.2999992; skew-y: -50.7999992; scale-x: 0.782999992; scale-y: 0.875; }
        frame 32 { x: -11.6999998; y: 3; skew-x: -8.69999981; skew-y: -23.8999996; scale-x: 0.776000023; scale-y: 0.888999999; }
        frame 33 { x: 11; y: -7.4000001; skew-x: 16.5; skew-y: 2.79999995; scale-x: 0.768999994; scale-y: 0.904999971; }
        frame 34 { x: 36.2999992; y: -13.3000002; skew-x: 42; skew-y: 29.7999992; scale-x: 0.762000024; scale-y: 0.920000017; }
        frame 35 { x: 33.7999992; y: -9.39999962; skew-x: 39.9000015; skew-y: 31.2999992; scale-x: 0.759000003; scale-y: 0.90200001; }
        frame 36 { x: 31.2000008; y: -5.5999999; skew-x: 37.7999992; skew-y: 32.9000015; scale-x: 0.758000016; scale-y: 0.887000024; }
        frame 37 { x: 19.7000008; y: -3.0999999; skew-x: 25.1000004; skew-y: 21.7999992; scale-x: 0.771000028; scale-y: 0.856999993; }
        frame 38 { x: 8.80000019; y: 0.300000012; skew-x: 12.5; skew-y: 10.8000002; scale-x: 0.786000013; scale-y: 0.828000009; }
        frame 39 { x: -1.39999998; y: 4.69999981; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cattail_spike";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 8.30000019; y: 2.4000001; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CATTAIL_SPIKE; }
        frame 6 { x: 13.3000002; y: 3; skew-x: 6.0999999; skew-y: 7.80000019; scale-x: 0.797999978; scale-y: 0.801999986; cel: -10000; image: none; }
        frame 7 { x: 18.2000008; y: 3.5999999; skew-x: 12.3000002; skew-y: 15.6000004; scale-x: 0.795000017; scale-y: 0.80400002; }
        frame 8 { x: 23.2000008; y: 4.5; skew-x: 18.7000008; skew-y: 23.6000004; scale-x: 0.79400003; scale-y: 0.806999981; }
        frame 9 { x: 17.5; y: 4.80000019; skew-x: 11.3000002; skew-y: 15.3000002; scale-x: -10000; scale-y: 0.805000007; }
        frame 10 { x: 11.8000002; y: 5.30000019; skew-x: 3.79999995; skew-y: 7; scale-x: 0.796000004; scale-y: 0.80400002; }
        frame 11 { x: 6.19999981; y: 6; skew-x: -3.4000001; skew-y: -0.899999976; scale-x: 0.796999991; scale-y: 0.802999973; }
        frame 12 { x: 0.699999988; y: 6.80000019; skew-x: -10.6999998; skew-y: -9.19999981; scale-x: -10000; scale-y: 0.800999999; }
        frame 13 { x: -4.4000001; y: 7.80000019; skew-x: -18.2000008; skew-y: -17.3999996; scale-x: 0.797999978; scale-y: 0.800000012; }
        frame 14 { x: -9.69999981; y: 9; skew-x: -25.7000008; skew-y: -25.7000008; scale-x: 0.800000012; scale-y: -10000; }
        frame 15 { x: -12; y: 10.6999998; skew-x: -29; skew-y: -30.2000008; scale-x: 0.799000025; scale-y: 0.797999978; }
        frame 16 { x: -14.3999996; y: 12.3999996; skew-x: -32.5; skew-y: -35; scale-x: 0.800000012; scale-y: 0.796999991; }
        frame 17 { x: -16.7000008; y: 14.1999998; skew-x: -36.0999985; skew-y: -39.7000008; scale-x: 0.801999986; scale-y: -10000; }
        frame 18 { x: -12.8000002; y: 12; skew-x: -30; skew-y: -33; scale-x: 0.800999999; scale-y: 0.796000004; }
        frame 19 { x: -8.69999981; y: 9.89999962; skew-x: -24; skew-y: -26.3999996; scale-x: 0.800000012; scale-y: 0.796999991; }
        frame 20 { x: -4.5; y: 8; skew-x: -17.8999996; skew-y: -19.7000008; scale-x: -10000; scale-y: 0.797999978; }
        frame 21 { x: -0.300000012; y: 5.9000001; skew-x: -11.8999996; skew-y: -13.1999998; scale-y: -10000; }
        frame 22 { x: 3.9000001; y: 4.0999999; skew-x: -5.9000001; skew-y: -6.4000001; scale-y: 0.799000025; }
        frame 23 { x: 8.30000019; y: 2.4000001; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: 0.100000001; y: 6.30000019; skew-x: -4.9000001; skew-y: -8.89999962; scale-y: 0.810000002; }
        frame 26 { x: -7.9000001; y: 10.5; skew-x: -9.89999962; skew-y: -17.8999996; scale-x: 0.799000025; scale-y: 0.819000006; }
        frame 27 { x: -15.8999996; y: 14.8000002; skew-x: -15; skew-y: -27; scale-x: -10000; scale-y: 0.828999996; }
        frame 28 { x: -23.8999996; y: 19.3999996; skew-x: -20.2000008; skew-y: -36; scale-x: 0.797999978; scale-y: 0.838999987; }
        frame 29 { x: -31.7000008; y: 24; skew-x: -25.2000008; skew-y: -45.2000008; scale-x: 0.799000025; scale-y: 0.850000024; }
        frame 30 { x: -27.2999992; y: 17.2999992; skew-x: -29.7000008; skew-y: -48; scale-x: 0.790000021; scale-y: 0.861000001; }
        frame 31 { x: -22.8999996; y: 10.8000002; skew-x: -34.2999992; skew-y: -50.7999992; scale-x: 0.782999992; scale-y: 0.875; }
        frame 32 { x: -0.899999976; y: 1.10000002; skew-x: -8.69999981; skew-y: -24; scale-x: 0.774999976; scale-y: 0.888999999; }
        frame 33 { x: 23.1000004; y: -6.80000019; skew-x: 16.5; skew-y: 2.79999995; scale-x: 0.768999994; scale-y: 0.904999971; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 35 { cel: -10000; }
        frame 39 { x: 8.30000019; y: 2.4000001; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; }
    }
    Track {
        source-name: "Cattail_tail2_overlay";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -0.699999988; y: 8.80000019; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CATTAIL_TAIL2_OVERLAY; }
        frame 6 { x: 3.4000001; y: 8.10000038; skew-x: 6.0999999; skew-y: 7.80000019; scale-x: 0.797999978; scale-y: 0.801999986; cel: -10000; image: none; }
        frame 7 { x: 7.80000019; y: 7.5999999; skew-x: 12.3000002; skew-y: 15.6000004; scale-x: 0.795000017; scale-y: 0.80400002; }
        frame 8 { x: 12.3000002; y: 7.30000019; skew-x: 18.7000008; skew-y: 23.6000004; scale-x: 0.79400003; scale-y: 0.806999981; }
        frame 9 { x: 7.19999981; y: 8.69999981; skew-x: 11.3000002; skew-y: 15.3000002; scale-x: -10000; scale-y: 0.805000007; }
        frame 10 { x: 2.29999995; y: 10.3000002; skew-x: 3.79999995; skew-y: 7; scale-x: 0.796000004; scale-y: 0.80400002; }
        frame 11 { x: -2.20000005; y: 12.1000004; skew-x: -3.4000001; skew-y: -0.899999976; scale-x: 0.796999991; scale-y: 0.802999973; }
        frame 12 { x: -6.80000019; y: 14.1000004; skew-x: -10.6999998; skew-y: -9.19999981; scale-x: -10000; scale-y: 0.800999999; }
        frame 13 { x: -11.1000004; y: 16.3999996; skew-x: -18.2000008; skew-y: -17.3999996; scale-x: 0.797999978; scale-y: 0.800000012; }
        frame 14 { x: -15.1000004; y: 18.7000008; skew-x: -25.7000008; skew-y: -25.7000008; scale-x: 0.800000012; scale-y: -10000; }
        frame 15 { x: -16.7999992; y: 20.5; skew-x: -29; skew-y: -30.2000008; scale-x: 0.799000025; scale-y: 0.797999978; }
        frame 16 { x: -18.2999992; y: 22.3999996; skew-x: -32.5; skew-y: -35; scale-x: 0.800000012; scale-y: 0.796999991; }
        frame 17 { x: -20; y: 24.2999992; skew-x: -36.0999985; skew-y: -39.7000008; scale-x: 0.801999986; scale-y: -10000; }
        frame 18 { x: -17.2000008; y: 21.6000004; skew-x: -30; skew-y: -33; scale-x: 0.800999999; scale-y: 0.796000004; }
        frame 19 { x: -14.1999998; y: 18.7999992; skew-x: -24; skew-y: -26.3999996; scale-x: 0.800000012; scale-y: 0.796999991; }
        frame 20 { x: -11; y: 16.1000004; skew-x: -17.8999996; skew-y: -19.7000008; scale-x: -10000; scale-y: 0.797999978; }
        frame 21 { x: -7.69999981; y: 13.6000004; skew-x: -11.8999996; skew-y: -13.1999998; scale-y: -10000; }
        frame 22 { x: -4.19999981; y: 11.1000004; skew-x: -5.9000001; skew-y: -6.4000001; scale-y: 0.799000025; }
        frame 23 { x: -0.699999988; y: 8.80000019; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: -8; y: 13.1000004; skew-x: -4.9000001; skew-y: -8.89999962; scale-y: 0.810000002; }
        frame 26 { x: -15.3999996; y: 17.7999992; skew-x: -9.89999962; skew-y: -17.8999996; scale-x: 0.799000025; scale-y: 0.819000006; }
        frame 27 { x: -22.5; y: 22.6000004; skew-x: -15; skew-y: -27; scale-x: -10000; scale-y: 0.828999996; }
        frame 28 { x: -29.5; y: 27.7999992; skew-x: -20.2000008; skew-y: -36; scale-x: 0.797999978; scale-y: 0.838999987; }
        frame 29 { x: -36.2999992; y: 33.2000008; skew-x: -25.2000008; skew-y: -45.2000008; scale-x: 0.799000025; scale-y: 0.850000024; }
        frame 30 { x: -31.2999992; y: 26.2999992; skew-x: -29.7000008; skew-y: -48; scale-x: 0.790000021; scale-y: 0.861000001; }
        frame 31 { x: -26.1000004; y: 19.3999996; skew-x: -34.2999992; skew-y: -50.7999992; scale-x: 0.782999992; scale-y: 0.875; }
        frame 32 { x: -8.69999981; y: 7.5; skew-x: -8.69999981; skew-y: -23.8999996; scale-x: 0.776000023; scale-y: 0.888999999; }
        frame 33 { x: 11.8999996; y: -2.0999999; skew-x: 16.5; skew-y: 2.79999995; scale-x: 0.768999994; scale-y: 0.904999971; }
        frame 34 { x: 34.5; y: -8.80000019; skew-x: 42; skew-y: 29.7999992; scale-x: 0.762000024; scale-y: 0.920000017; }
        frame 35 { x: 32; y: -5; skew-x: 39.9000015; skew-y: 31.2999992; scale-x: 0.759000003; scale-y: 0.90200001; }
        frame 36 { x: 29.3999996; y: -1.29999995; skew-x: 37.7999992; skew-y: 32.9000015; scale-x: 0.758000016; scale-y: 0.887000024; }
        frame 37 { x: 18.7000008; y: 1.39999998; skew-x: 25.1000004; skew-y: 21.7999992; scale-x: 0.771000028; scale-y: 0.856999993; }
        frame 38 { x: 8.69999981; y: 4.69999981; skew-x: 12.5; skew-y: 10.8000002; scale-x: 0.786000013; scale-y: 0.828000009; }
        frame 39 { x: -0.699999988; y: 8.80000019; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 26; y: 25.1000004; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CATTAIL_HEAD; }
        frame 6 { x: 25.7999992; y: 25.2999992; scale-x: 0.806999981; scale-y: 0.796000004; cel: -10000; image: none; }
        frame 7 { x: 25.6000004; y: 25.5; scale-x: 0.81400001; scale-y: 0.791999996; }
        frame 8 { x: 25.5; y: 25.7000008; scale-x: 0.82099998; scale-y: 0.787999988; }
        frame 9 { x: 25.2999992; y: 25.8999996; scale-x: 0.828000009; scale-y: 0.783999979; }
        frame 10 { x: 25.2000008; y: 26.1000004; scale-x: 0.834999979; scale-y: 0.778999984; }
        frame 11 { x: 25; y: 26.2999992; scale-x: 0.842000008; scale-y: 0.774999976; }
        frame 12 { x: 24.8999996; y: 26.5; scale-x: 0.848999977; scale-y: 0.771000028; }
        frame 13 { x: 24.7999992; y: 26.7000008; scale-x: 0.856999993; scale-y: 0.76700002; }
        frame 14 { x: 24.6000004; y: 26.8999996; scale-x: 0.864000022; scale-y: 0.763000011; }
        frame 15 { x: 24.7000008; y: 26.7000008; scale-x: 0.856999993; scale-y: 0.76700002; }
        frame 16 { x: 24.8999996; y: 26.6000004; scale-x: 0.848999977; scale-y: 0.771000028; }
        frame 17 { x: 25; y: 26.3999996; scale-x: 0.842000008; scale-y: 0.774999976; }
        frame 18 { x: 25.2000008; y: 26.2000008; scale-x: 0.834999979; scale-y: 0.778999984; }
        frame 19 { x: 25.2999992; y: 25.8999996; scale-x: 0.828000009; scale-y: 0.783999979; }
        frame 20 { x: 25.5; y: 25.7000008; scale-x: 0.82099998; scale-y: 0.787999988; }
        frame 21 { x: 25.6000004; y: 25.5; scale-x: 0.81400001; scale-y: 0.791999996; }
        frame 22 { x: 25.7999992; y: 25.2999992; scale-x: 0.806999981; scale-y: 0.796000004; }
        frame 23 { x: 26; y: 25.1000004; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 24.7999992; skew-y: -1.39999998; scale-y: 0.801999986; }
        frame 26 { x: 23.3999996; skew-y: -3.20000005; scale-y: 0.802999973; }
        frame 27 { x: 22.1000004; skew-y: -4.9000001; scale-y: 0.805000007; }
        frame 28 { x: 20.8999996; skew-y: -6.5; scale-y: 0.806999981; }
        frame 29 { x: 19.5; skew-y: -8.30000019; scale-y: 0.809000015; }
        frame 30 { x: 23; y: 24.1000004; skew-x: 4.0999999; skew-y: -1.89999998; scale-y: 0.806999981; }
        frame 31 { x: 26.6000004; y: 23.2000008; skew-x: 8.30000019; skew-y: 4.30000019; scale-x: 0.799000025; scale-y: 0.805000007; }
        frame 32 { x: 30.2999992; y: 22.6000004; skew-x: 12.6000004; skew-y: 10.8000002; scale-x: -10000; scale-y: 0.801999986; }
        frame 33 { x: 34; y: 22.2000008; skew-x: 16.7999992; skew-y: 17.1000004; scale-y: 0.800000012; }
        frame 34 { x: 37.9000015; y: 22; skew-x: 21.2000008; skew-y: 23.6000004; scale-x: 0.800000012; scale-y: 0.799000025; }
        frame 35 { x: 35.2000008; y: 22.3999996; skew-x: 16.7999992; skew-y: 18.7999992; scale-x: 0.799000025; scale-y: 0.797999978; }
        frame 36 { x: 32.7999992; y: 22.8999996; skew-x: 12.6000004; skew-y: 14; scale-x: -10000; scale-y: 0.799000025; }
        frame 37 { x: 30.3999996; y: 23.5; skew-x: 8.30000019; skew-y: 9.30000019; scale-y: -10000; }
        frame 38 { x: 28.1000004; y: 24.2999992; skew-x: 4.0999999; skew-y: 4.5999999; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 39 { x: 26; y: 25.1000004; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Cattail_paw1";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 31.2000008; y: 59.4000015; scale-x: 0.850000024; scale-y: 0.850000024; cel: 0; image: IMAGE_REANIM_CATTAIL_PAW1; }
        frame 6 { x: 31.1000004; y: -10000; scale-x: 0.853999972; scale-y: 0.856000006; cel: -10000; image: none; }
        frame 7 { x: 31; scale-x: 0.85799998; scale-y: 0.861000001; }
        frame 8 { x: 30.8999996; y: 59.5; scale-x: 0.861999989; scale-y: 0.866999984; }
        frame 9 { x: 30.7999992; y: -10000; scale-x: 0.86500001; scale-y: 0.873000026; }
        frame 10 { x: 30.7000008; scale-x: 0.869000018; scale-y: 0.878000021; }
        frame 11 { x: -10000; scale-x: 0.873000026; scale-y: 0.884000003; }
        frame 12 { x: 30.6000004; y: 59.5999985; scale-x: 0.876999974; scale-y: 0.889999986; }
        frame 13 { x: 30.5; y: -10000; scale-x: 0.880999982; scale-y: 0.896000028; }
        frame 14 { x: 30.3999996; scale-x: 0.88499999; scale-y: 0.901000023; }
        frame 15 { x: 30.5; y: 59.5; scale-x: 0.880999982; scale-y: 0.896000028; }
        frame 16 { x: 30.6000004; y: 59.5999985; scale-x: 0.876999974; scale-y: 0.889999986; }
        frame 17 { x: 30.7000008; y: 59.5; scale-x: 0.873000026; scale-y: 0.884000003; }
        frame 18 { x: -10000; y: -10000; scale-x: 0.869000018; scale-y: 0.878000021; }
        frame 19 { x: 30.8999996; scale-x: 0.86500001; scale-y: 0.873000026; }
        frame 20 { x: -10000; scale-x: 0.861999989; scale-y: 0.866999984; }
        frame 21 { x: 31; y: 59.4000015; scale-x: 0.85799998; scale-y: 0.861000001; }
        frame 22 { x: 31.1000004; y: 59.5; scale-x: 0.853999972; scale-y: 0.856000006; }
        frame 23 { x: 31.2000008; y: 59.4000015; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 30.7000008; y: 58.5; skew-x: 1.29999995; scale-x: 0.862999976; }
        frame 31 { x: 30.2000008; y: 57.5999985; skew-x: 2.79999995; scale-x: 0.875; }
        frame 32 { x: 29.7999992; y: 56.7000008; skew-x: 4.30000019; scale-x: 0.888000011; }
        frame 33 { x: 29.3999996; y: 55.7999992; skew-x: 5.80000019; scale-x: 0.901000023; }
        frame 34 { x: 28.8999996; y: 54.7999992; skew-x: 7.4000001; scale-x: 0.913999975; }
        frame 35 { x: 29.3999996; y: 55.7999992; skew-x: 5.80000019; scale-x: 0.901000023; }
        frame 36 { x: 29.7999992; y: 56.7999992; skew-x: 4.30000019; scale-x: 0.888000011; }
        frame 37 { x: 30.2000008; y: 57.5999985; skew-x: 2.79999995; scale-x: 0.875; }
        frame 38 { x: 30.7000008; y: 58.5999985; skew-x: 1.29999995; scale-x: 0.862999976; }
        frame 39 { x: 31.2000008; y: 59.4000015; skew-x: 0; scale-x: 0.850000024; }
    }
    Track {
        source-name: "Cattail_hat";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 11.8000002; y: 9.30000019; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CATTAIL_HAT; }
        frame 6 { x: 11.5; y: 9.60000038; scale-x: 0.806999981; scale-y: 0.796000004; cel: -10000; image: none; }
        frame 7 { x: 11.1999998; y: 9.80000019; scale-x: 0.81400001; scale-y: 0.791999996; }
        frame 8 { x: 10.8999996; y: 10.1000004; scale-x: 0.82099998; scale-y: 0.787999988; }
        frame 9 { x: 10.6999998; y: 10.3999996; scale-x: 0.828000009; scale-y: 0.783999979; }
        frame 10 { x: 10.3000002; y: 10.6999998; scale-x: 0.834999979; scale-y: 0.778999984; }
        frame 11 { x: 10.1000004; y: 11; scale-x: 0.842000008; scale-y: 0.774999976; }
        frame 12 { x: 9.89999962; y: 11.1999998; scale-x: 0.848999977; scale-y: 0.771000028; }
        frame 13 { x: 9.5; y: 11.5; scale-x: 0.856999993; scale-y: 0.76700002; }
        frame 14 { x: 9.30000019; y: 11.8000002; scale-x: 0.864000022; scale-y: 0.763000011; }
        frame 15 { x: 9.5; y: 11.5; scale-x: 0.856999993; scale-y: 0.76700002; }
        frame 16 { x: 9.89999962; y: 11.1999998; scale-x: 0.848999977; scale-y: 0.771000028; }
        frame 17 { x: 10.1000004; y: 10.8999996; scale-x: 0.842000008; scale-y: 0.774999976; }
        frame 18 { x: 10.3999996; y: 10.6000004; scale-x: 0.834999979; scale-y: 0.778999984; }
        frame 19 { x: 10.6999998; y: 10.3000002; scale-x: 0.828000009; scale-y: 0.783999979; }
        frame 20 { x: 11; y: 10.1000004; scale-x: 0.82099998; scale-y: 0.787999988; }
        frame 21 { x: 11.1999998; y: 9.80000019; scale-x: 0.81400001; scale-y: 0.791999996; }
        frame 22 { x: 11.5; y: 9.5; scale-x: 0.806999981; scale-y: 0.796000004; }
        frame 23 { x: 11.8000002; y: 9.30000019; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 10.1000004; y: 9.19999981; skew-y: -1.39999998; scale-y: 0.801999986; }
        frame 26 { x: 8.30000019; y: -10000; skew-y: -3.20000005; scale-y: 0.802999973; }
        frame 27 { x: 6.5; skew-y: -4.9000001; scale-y: 0.805000007; }
        frame 28 { x: 4.80000019; skew-y: -6.5; scale-y: 0.806999981; }
        frame 29 { x: 3; y: 9.30000019; skew-y: -8.30000019; scale-y: 0.809000015; }
        frame 30 { x: 8.39999962; y: 7.30000019; skew-x: 4.0999999; skew-y: -1.89999998; scale-y: 0.806999981; }
        frame 31 { x: 13.8000002; y: 5.5999999; skew-x: 8.30000019; skew-y: 4.30000019; scale-x: 0.799000025; scale-y: 0.805000007; }
        frame 32 { x: 19.5; y: 4.19999981; skew-x: 12.6000004; skew-y: 10.8000002; scale-x: -10000; scale-y: 0.801999986; }
        frame 33 { x: 25.2000008; y: 3.0999999; skew-x: 16.7999992; skew-y: 17.1000004; scale-y: 0.800000012; }
        frame 34 { x: 31; y: 2.29999995; skew-x: 21.2000008; skew-y: 23.6000004; scale-x: 0.800000012; scale-y: 0.799000025; }
        frame 35 { x: 26.7999992; y: 3.4000001; skew-x: 16.7999992; skew-y: 18.7999992; scale-x: 0.799000025; scale-y: 0.797999978; }
        frame 36 { x: 22.8999996; y: 4.5999999; skew-x: 12.6000004; skew-y: 14; scale-x: -10000; scale-y: 0.799000025; }
        frame 37 { x: 19; y: 6.0999999; skew-x: 8.30000019; skew-y: 9.30000019; scale-y: -10000; }
        frame 38 { x: 15.3000002; y: 7.5999999; skew-x: 4.0999999; skew-y: 4.5999999; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 39 { x: 11.8000002; y: 9.30000019; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Cattail_blink";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { x: 41.0999985; y: 33.7999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CATTAIL_BLINK1; }
        frame 2 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_CATTAIL_BLINK2; }
        frame 3 { image: IMAGE_REANIM_CATTAIL_BLINK1; }
        frame 4 { cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 33 { x: 46.5999985; y: 36.2000008; skew-x: 13.1999998; skew-y: 23.5; scale-x: 0.796000004; scale-y: 0.815999985; cel: 0; }
        frame 34 { x: 45.7999992; y: 35.0999985; skew-x: 19.3999996; skew-y: 14.6000004; scale-x: 0.853999972; scale-y: 0.799000025; cel: -10000; image: IMAGE_REANIM_CATTAIL_BLINK2; }
        frame 35 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 36 { cel: -10000; }
    }
    Track {
        source-name: "Cattail_eyebrow1";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 38.5999985; y: 34; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CATTAIL_EYEBROW1; }
        frame 6 { x: -10000; y: 34.4000015; scale-x: 0.806999981; scale-y: 0.796000004; cel: -10000; image: none; }
        frame 7 { y: 34.5999985; scale-x: 0.81400001; scale-y: 0.791999996; }
        frame 8 { x: 38.5; y: 35; scale-x: 0.82099998; scale-y: 0.787999988; }
        frame 9 { x: -10000; y: 35.2999992; scale-x: 0.828000009; scale-y: 0.783999979; }
        frame 10 { y: 35.5999985; scale-x: 0.834999979; scale-y: 0.778999984; }
        frame 11 { y: 35.9000015; scale-x: 0.842000008; scale-y: 0.774999976; }
        frame 12 { x: 38.4000015; y: 36.2999992; scale-x: 0.848999977; scale-y: 0.771000028; }
        frame 13 { x: -10000; y: 36.5; scale-x: 0.856999993; scale-y: 0.76700002; }
        frame 14 { x: 38.2999992; y: 36.9000015; scale-x: 0.864000022; scale-y: 0.763000011; }
        frame 15 { x: -10000; y: 36.5999985; scale-x: 0.856999993; scale-y: 0.76700002; }
        frame 16 { y: 36.2999992; scale-x: 0.848999977; scale-y: 0.771000028; }
        frame 17 { x: 38.4000015; y: 36; scale-x: 0.842000008; scale-y: 0.774999976; }
        frame 18 { x: -10000; y: 35.5999985; scale-x: 0.834999979; scale-y: 0.778999984; }
        frame 19 { x: 38.5; y: 35.4000015; scale-x: 0.828000009; scale-y: 0.783999979; }
        frame 20 { x: -10000; y: 35; scale-x: 0.82099998; scale-y: 0.787999988; }
        frame 21 { y: 34.7000008; scale-x: 0.81400001; scale-y: 0.791999996; }
        frame 22 { y: 34.4000015; scale-x: 0.806999981; scale-y: 0.796000004; }
        frame 23 { x: 38.5999985; y: 34; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 38; y: 33.4000015; }
        frame 26 { x: 37.2999992; y: 32.7999992; }
        frame 27 { x: 36.5; y: 32.2000008; }
        frame 28 { x: 35.9000015; y: 31.6000004; }
        frame 29 { x: 35.0999985; y: 31; }
        frame 30 { x: 38.2999992; y: 32.2999992; skew-x: 11.8000002; skew-y: 12.1000004; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 31 { x: 41.5; y: 33.7999992; skew-x: 23.5; skew-y: 24.2999992; scale-x: 0.797999978; scale-y: 0.796999991; }
        frame 32 { x: 44.9000015; y: 35.5999985; skew-x: 35.2999992; skew-y: 36.5999985; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 47.9000015; y: 39.0999985; skew-x: 47.0999985; skew-y: 48.9000015; scale-x: 0.796999991; scale-y: 0.796000004; }
        frame 34 { x: 51; y: 43; skew-x: 58.7999992; skew-y: 61.2000008; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 35 { x: 48.5; y: 40.7000008; skew-x: 47.0999985; skew-y: 48.9000015; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 36 { x: 45.9000015; y: 38.5999985; skew-x: 35.2999992; skew-y: 36.5999985; scale-x: 0.797999978; scale-y: -10000; }
        frame 37 { x: 43.5; y: 36.9000015; skew-x: 23.5; skew-y: 24.2999992; scale-x: -10000; scale-y: 0.797999978; }
        frame 38 { x: 41; y: 35.2999992; skew-x: 11.8000002; skew-y: 12.1000004; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 39 { x: 38.5999985; y: 34; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cattail_eyebrow2";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 60.9000015; y: 31.3999996; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CATTAIL_EYEBROW2; }
        frame 6 { x: 61; y: 31.7000008; scale-x: 0.806999981; scale-y: 0.796000004; cel: -10000; image: none; }
        frame 7 { x: 61.2999992; y: 32.0999985; scale-x: 0.81400001; scale-y: 0.791999996; }
        frame 8 { x: 61.4000015; y: 32.4000015; scale-x: 0.82099998; scale-y: 0.787999988; }
        frame 9 { x: 61.5; y: 32.7999992; scale-x: 0.828000009; scale-y: 0.783999979; }
        frame 10 { x: 61.5999985; y: 33; scale-x: 0.834999979; scale-y: 0.778999984; }
        frame 11 { x: 61.7999992; y: 33.5; scale-x: 0.842000008; scale-y: 0.774999976; }
        frame 12 { x: 62; y: 33.7000008; scale-x: 0.848999977; scale-y: 0.771000028; }
        frame 13 { x: 62.0999985; y: 34; scale-x: 0.856999993; scale-y: 0.76700002; }
        frame 14 { x: 62.2999992; y: 34.4000015; scale-x: 0.864000022; scale-y: 0.763000011; }
        frame 15 { x: 62.0999985; y: 34.0999985; scale-x: 0.856999993; scale-y: 0.76700002; }
        frame 16 { x: 62; y: 33.7000008; scale-x: 0.848999977; scale-y: 0.771000028; }
        frame 17 { x: 61.7999992; y: 33.4000015; scale-x: 0.842000008; scale-y: 0.774999976; }
        frame 18 { x: 61.5999985; y: 33; scale-x: 0.834999979; scale-y: 0.778999984; }
        frame 19 { x: 61.5; y: 32.7000008; scale-x: 0.828000009; scale-y: 0.783999979; }
        frame 20 { x: 61.4000015; y: 32.4000015; scale-x: 0.82099998; scale-y: 0.787999988; }
        frame 21 { x: 61.2999992; y: 32; scale-x: 0.81400001; scale-y: 0.791999996; }
        frame 22 { x: 61; y: 31.7000008; scale-x: 0.806999981; scale-y: 0.796000004; }
        frame 23 { x: 60.9000015; y: 31.3999996; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 60.2000008; y: 30.7999992; }
        frame 26 { x: 59.5; y: 30.2000008; }
        frame 27 { x: 58.7999992; y: 29.6000004; }
        frame 28 { x: 58.0999985; y: 29; }
        frame 29 { x: 57.4000015; y: 28.3999996; }
        frame 30 { x: 59; y: 32; skew-x: -5.19999981; skew-y: -4.69999981; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 31 { x: 60.5; y: 35.7000008; skew-x: -10.5; skew-y: -9.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 32 { x: 62; y: 39.4000015; skew-x: -15.8999996; skew-y: -14.3999996; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 63.7999992; y: 44.5999985; skew-x: -21.2000008; skew-y: -19.2000008; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 34 { x: 65.6999969; y: 49.7000008; skew-x: -26.6000004; skew-y: -24.2000008; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 35 { x: 64.6999969; y: 46; skew-x: -21.2000008; skew-y: -19.2000008; scale-x: -10000; scale-y: 0.796999991; }
        frame 36 { x: 63.7999992; y: 42.4000015; skew-x: -15.8999996; skew-y: -14.3999996; scale-y: 0.797999978; }
        frame 37 { x: 62.9000015; y: 38.7000008; skew-x: -10.5; skew-y: -9.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 38 { x: 61.9000015; y: 35; skew-x: -5.19999981; skew-y: -4.69999981; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 60.9000015; y: 31.3999996; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
}
