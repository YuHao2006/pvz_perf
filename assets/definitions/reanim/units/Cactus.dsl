export component Cactus {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 95;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 20 { cel: -1; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 20 { cel: 0; }
        frame 21 { cel: -10000; }
        frame 38 { cel: -1; }
        frame 39 { cel: -10000; }
    }
    Track {
        source-name: "anim_rise";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 38 { cel: 0; }
        frame 39 { cel: -10000; }
        frame 53 { cel: -1; }
        frame 54 { cel: -10000; }
    }
    Track {
        source-name: "anim_idlehigh";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 53 { cel: 0; }
        frame 54 { cel: -10000; }
        frame 68 { cel: -1; }
        frame 69 { cel: -10000; }
    }
    Track {
        source-name: "anim_shootinghigh";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 68 { y: -50.9000015; cel: 0; }
        frame 69 { y: -10000; cel: -10000; }
        frame 82 { cel: -1; }
        frame 83 { cel: -10000; }
    }
    Track {
        source-name: "anim_lower";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 82 { y: -76.4000015; cel: 0; }
        frame 83 { y: -10000; cel: -10000; }
    }
    Track {
        source-name: "Cactus_flower";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 11.6999998; y: 0.300000012; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CACTUS_FLOWER; }
        frame 6 { x: 10.3000002; y: 0.200000003; skew-y: -2.70000005; scale-x: 0.819000006; scale-y: 0.809000015; cel: -10000; image: none; }
        frame 7 { x: 8.89999962; y: 0.100000001; skew-y: -5.80000019; scale-x: 0.837000012; scale-y: 0.819000006; }
        frame 8 { x: 9.39999962; y: -0.600000024; skew-y: -4.69999981; scale-x: 0.829999983; scale-y: 0.824999988; }
        frame 9 { x: 10; y: -1.39999998; skew-y: -3.4000001; scale-x: 0.822000027; scale-y: 0.832000017; }
        frame 10 { x: 10.5; y: -2.20000005; skew-y: -2.20000005; scale-x: 0.814999998; scale-y: 0.838; }
        frame 11 { x: 11.1999998; y: -3; skew-y: -0.899999976; scale-x: 0.806999981; scale-y: 0.845000029; }
        frame 12 { x: 11.6999998; y: -3.79999995; skew-y: 0; scale-x: 0.800000012; scale-y: 0.851000011; }
        frame 13 { x: 12.1000004; y: -4.4000001; skew-y: -10000; scale-x: 0.781000018; scale-y: 0.885999978; }
        frame 14 { x: 12.5; y: -5.19999981; scale-x: 0.763000011; scale-y: 0.921000004; }
        frame 15 { x: 12.3000002; y: -4.0999999; scale-x: 0.769999981; scale-y: 0.896000028; }
        frame 16 { x: 12.1999998; y: -2.9000001; scale-x: 0.777999997; scale-y: 0.871999979; }
        frame 17 { x: 12; y: -1.79999995; scale-x: 0.785000026; scale-y: 0.84799999; }
        frame 18 { x: 11.8999996; y: -0.699999988; scale-x: 0.792999983; scale-y: 0.824000001; }
        frame 19 { x: 11.6999998; y: 0.300000012; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 20 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 12.8999996; y: 0.100000001; skew-y: 3; scale-y: 0.801999986; }
        frame 22 { x: 14; y: 0; skew-y: 6.0999999; scale-y: 0.80400002; }
        frame 23 { x: 12; y: -10000; skew-y: 4.30000019; scale-y: -10000; }
        frame 24 { x: 10; skew-y: 2.5999999; scale-y: 0.802999973; }
        frame 25 { x: 8; y: 0.100000001; skew-y: 1; scale-y: -10000; }
        frame 26 { x: 6; y: -10000; skew-y: -0.400000006; }
        frame 27 { x: 4.0999999; y: 0.200000003; skew-y: -2; scale-y: 0.801999986; }
        frame 28 { x: 2; y: 0.300000012; skew-y: -3.79999995; scale-y: -10000; }
        frame 29 { x: 11.3000002; y: -10000; skew-y: -6.80000019; scale-y: 0.805999994; }
        frame 30 { x: 24.7999992; y: -0.899999976; skew-x: 3; skew-y: 6; scale-y: 0.811999977; }
        frame 31 { x: 38.0999985; y: -1.79999995; skew-x: 6.30000019; skew-y: 19; scale-y: 0.819000006; }
        frame 32 { x: 33.7999992; y: -1.5; skew-x: 5.30000019; skew-y: 15.8000002; scale-x: 0.799000025; scale-y: 0.815999985; }
        frame 33 { x: 29.2000008; y: -1.20000005; skew-x: 4.0999999; skew-y: 12.5; scale-x: 0.800000012; scale-y: 0.811999977; }
        frame 34 { x: 24.7999992; y: -0.899999976; skew-x: 3; skew-y: 9.30000019; scale-x: -10000; scale-y: 0.809000015; }
        frame 35 { x: 20.5; y: -0.5; skew-x: 2; skew-y: 6.30000019; scale-y: 0.805999994; }
        frame 36 { x: 16; y: -0.100000001; skew-x: 1; skew-y: 3; scale-y: 0.802999973; }
        frame 37 { x: 11.6999998; y: 0.300000012; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 39 { x: 12.8000002; y: -0.200000003; scale-x: 0.750999987; scale-y: 0.875; }
        frame 40 { x: 12.6999998; y: 1.60000002; scale-x: 0.757000029; scale-y: 0.839999974; }
        frame 41 { x: -10000; y: 3.5999999; skew-y: 0.200000003; scale-x: 0.763000011; scale-y: 0.805000007; }
        frame 42 { x: 12.3999996; y: -2.9000001; skew-y: 0; scale-x: 0.772000015; scale-y: 0.808000028; }
        frame 43 { x: 12.1999998; y: -9.5; skew-y: -10000; scale-x: 0.781000018; scale-y: 0.81099999; }
        frame 44 { x: 11.8999996; y: -16.2000008; scale-x: 0.791000009; scale-y: 0.813000023; }
        frame 45 { x: 11.6999998; y: -22.8999996; scale-x: 0.800000012; scale-y: 0.815999985; }
        frame 46 { x: 12.8999996; y: -40.2000008; scale-x: 0.744000018; scale-y: 0.871999979; }
        frame 47 { x: 12.3000002; y: -55.2000008; scale-x: 0.772000015; scale-y: 0.836000025; }
        frame 48 { x: 11.6999998; y: -70.3000031; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 49 { x: 13; y: -74.6999969; skew-y: 2.29999995; scale-x: 0.764999986; scale-y: 0.899999976; }
        frame 50 { x: 14.5; y: -79.0999985; skew-y: 4.69999981; scale-x: 0.730000019; scale-y: 1; }
        frame 51 { x: 13; y: -74.6999969; skew-y: 2.29999995; scale-x: 0.764999986; scale-y: 0.899999976; }
        frame 52 { x: 11.6999998; y: -70.3000031; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 10.3000002; y: -71; skew-y: -2.70000005; scale-x: 0.819000006; scale-y: 0.809000015; }
        frame 55 { x: 8.89999962; y: -71.6999969; skew-y: -5.80000019; scale-x: 0.837000012; scale-y: 0.819000006; }
        frame 56 { x: 9.39999962; y: -72.3000031; skew-y: -4.69999981; scale-x: 0.829999983; scale-y: 0.824999988; }
        frame 57 { x: 10; y: -73; skew-y: -3.4000001; scale-x: 0.822000027; scale-y: 0.832000017; }
        frame 58 { x: 10.6000004; y: -73.6999969; skew-y: -2.20000005; scale-x: 0.814999998; scale-y: 0.838; }
        frame 59 { x: 11.1999998; y: -74.1999969; skew-y: -0.899999976; scale-x: 0.806999981; scale-y: 0.845000029; }
        frame 60 { x: 11.6999998; y: -74.9000015; skew-y: 0; scale-x: 0.800000012; scale-y: 0.851000011; }
        frame 61 { x: 12.1000004; y: -74.5; skew-y: -10000; scale-x: 0.781000018; scale-y: 0.885999978; }
        frame 62 { x: 12.5; y: -74.1999969; scale-x: 0.763000011; scale-y: 0.921000004; }
        frame 63 { x: 12.3000002; y: -73.4000015; scale-x: 0.769999981; scale-y: 0.896000028; }
        frame 64 { x: 12.1999998; y: -72.5999985; scale-x: 0.777999997; scale-y: 0.871999979; }
        frame 65 { x: 12; y: -71.6999969; scale-x: 0.785000026; scale-y: 0.84799999; }
        frame 66 { x: 11.8999996; y: -70.9000015; scale-x: 0.792999983; scale-y: 0.824000001; }
        frame 67 { x: 11.6999998; y: -70; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 68 { x: -10000; y: -70.3000031; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 7.30000019; y: -70.5; skew-y: -0.699999988; }
        frame 70 { x: 2.79999995; y: -70.8000031; skew-y: -1.70000005; scale-y: 0.800999999; }
        frame 71 { x: -1.5; y: -71; skew-y: -2.70000005; scale-y: -10000; }
        frame 72 { x: -6; y: -71.0999985; skew-y: -3.79999995; scale-y: 0.801999986; }
        frame 73 { x: 7.80000019; y: -10000; skew-y: -10.1999998; scale-y: 0.813000023; }
        frame 74 { x: 38.0999985; y: -72.6999969; skew-x: 3; skew-y: 4.30000019; scale-y: 0.815999985; }
        frame 75 { x: 68.3000031; y: -73.5; skew-x: 6.30000019; skew-y: 19; scale-y: 0.819000006; }
        frame 76 { x: 58.9000015; y: -73; skew-x: 5.30000019; skew-y: 15.8000002; scale-x: 0.799000025; scale-y: 0.815999985; }
        frame 77 { x: 49.4000015; y: -72.4000015; skew-x: 4.0999999; skew-y: 12.5; scale-x: 0.800000012; scale-y: 0.811999977; }
        frame 78 { x: 40; y: -71.8000031; skew-x: 3; skew-y: 9.30000019; scale-x: -10000; scale-y: 0.809000015; }
        frame 79 { x: 30.5; y: -71.1999969; skew-x: 2; skew-y: 6.30000019; scale-y: 0.805999994; }
        frame 80 { x: 21; y: -70.5; skew-x: 1; skew-y: 3; scale-y: 0.802999973; }
        frame 81 { x: 11.6999998; y: -69.6999969; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 82 { x: -10000; y: -70; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 83 { x: 11.6000004; y: -71.5; scale-x: 0.800999999; scale-y: 0.825999975; }
        frame 84 { x: -10000; y: -72.6999969; scale-x: 0.801999986; scale-y: 0.851999998; }
        frame 85 { x: 11.6999998; y: -47.7000008; scale-x: 0.800999999; scale-y: 0.833999991; }
        frame 86 { x: -10000; y: -22.8999996; scale-x: 0.800000012; scale-y: 0.815999985; }
        frame 87 { x: 11.8999996; y: -16.2999992; scale-x: 0.791000009; scale-y: 0.813000023; }
        frame 88 { x: 12.1999998; y: -9.60000038; scale-x: 0.781000018; scale-y: 0.81099999; }
        frame 89 { x: 12.3999996; y: -2.9000001; scale-x: 0.772000015; scale-y: 0.808000028; }
        frame 90 { x: 12.6999998; y: 3.5999999; skew-y: 0.200000003; scale-x: 0.763000011; scale-y: 0.805000007; }
        frame 91 { x: 12.3999996; y: 2.79999995; skew-y: 0; scale-x: 0.772000015; scale-y: 0.80400002; }
        frame 92 { x: 12.1999998; y: 2; skew-y: -10000; scale-x: 0.781000018; scale-y: 0.802999973; }
        frame 93 { x: 11.8999996; y: 1.10000002; scale-x: 0.791000009; scale-y: 0.800999999; }
        frame 94 { x: 11.6999998; y: 0.300000012; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cactus_floer_top";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 20.7000008; y: -3.9000001; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CACTUS_FLOWER_TOP; }
        frame 6 { x: 20.2999992; y: -3.70000005; skew-x: -3; skew-y: -3; scale-x: 0.799000025; scale-y: 0.806999981; cel: -10000; image: none; }
        frame 7 { x: 19.7000008; y: -3.4000001; skew-x: -6.4000001; skew-y: -6.4000001; scale-x: -10000; scale-y: 0.81400001; }
        frame 8 { x: 19.8999996; y: -4.4000001; skew-x: -5; skew-y: -5; scale-y: 0.82099998; }
        frame 9 { x: 20.1000004; y: -5.4000001; skew-x: -3.70000005; skew-y: -3.70000005; scale-y: 0.828999996; }
        frame 10 { x: 20.2999992; y: -6.5; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.800000012; scale-y: 0.836000025; }
        frame 11 { x: 20.6000004; y: -7.30000019; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: -10000; scale-y: 0.843999982; }
        frame 12 { x: 20.7000008; y: -8.5; skew-x: 0; skew-y: 0; scale-y: 0.851000011; }
        frame 13 { x: 21.5; y: -9.10000038; skew-x: 4.5; skew-y: 4.5; scale-y: 0.843999982; }
        frame 14 { x: 22.2000008; y: -9.89999962; skew-x: 9; skew-y: 9; scale-y: 0.836000025; }
        frame 15 { x: 21.8999996; y: -8.69999981; skew-x: 7.0999999; skew-y: 7.0999999; scale-x: 0.799000025; scale-y: 0.828999996; }
        frame 16 { x: 21.6000004; y: -7.4000001; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: -10000; scale-y: 0.822000027; }
        frame 17 { x: 21.2999992; y: -6.30000019; skew-x: 3.5; skew-y: 3.5; scale-x: 0.800000012; scale-y: 0.81400001; }
        frame 18 { x: 21; y: -5; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: -10000; scale-y: 0.806999981; }
        frame 19 { x: 20.7000008; y: -3.9000001; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 22; y: -4.0999999; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 22 { x: 23.2000008; y: -4.19999981; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 23 { x: 24.5; y: -4.30000019; skew-x: 5.80000019; skew-y: 5.80000019; }
        frame 24 { x: 22; y: -4.19999981; skew-x: 4.5; skew-y: 3.79999995; }
        frame 25 { x: 19.5; y: -10000; skew-x: 3.29999995; skew-y: 1.79999995; }
        frame 26 { x: 17; y: -4.0999999; skew-x: 2.29999995; skew-y: 0; scale-y: 0.800999999; }
        frame 27 { x: 14.5; y: -4; skew-x: 1; skew-y: -1.70000005; scale-y: -10000; }
        frame 28 { x: 11.8999996; y: -3.9000001; skew-x: 0; skew-y: -3.79999995; scale-y: 0.801999986; }
        frame 29 { x: 19.1000004; y: -4.0999999; skew-x: -16.1000004; skew-y: -18.7000008; scale-x: 0.799000025; scale-y: 0.800000012; }
        frame 30 { x: 43.4000015; y: -3.70000005; skew-x: 4.30000019; skew-y: 3; scale-x: -10000; scale-y: 0.799000025; }
        frame 31 { x: 68.5; y: -3.0999999; skew-x: 25.1000004; skew-y: 25.1000004; scale-y: -10000; }
        frame 32 { x: 60.5; y: -3.29999995; skew-x: 20.7999992; skew-y: 20.7999992; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 33 { x: 52.4000015; y: -3.4000001; skew-x: 16.6000004; skew-y: 16.6000004; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 34 { x: 44.5; y: -3.5999999; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 36.5999985; y: -3.70000005; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 36 { x: 28.6000004; y: -3.79999995; skew-x: 4; skew-y: 4; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 37 { x: 20.7000008; y: -3.9000001; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 39 { x: 21.1000004; y: -4.69999981; scale-y: 0.782000005; }
        frame 40 { x: 21.3999996; y: -2.79999995; scale-y: 0.763999999; }
        frame 41 { x: 21.7000008; y: -0.899999976; skew-y: 0.200000003; scale-y: 0.745999992; }
        frame 42 { x: 21.5; y: -7.5; skew-y: 0; scale-y: 0.763000011; }
        frame 43 { x: 21.2000008; y: -14.1000004; skew-y: -10000; scale-y: 0.781000018; }
        frame 44 { x: 21; y: -20.7999992; scale-y: 0.797999978; }
        frame 45 { x: 20.7000008; y: -27.2999992; scale-y: 0.815999985; }
        frame 46 { x: -10000; y: -43.2999992; scale-y: 0.81099999; }
        frame 47 { y: -58.5999985; scale-y: 0.805000007; }
        frame 48 { y: -73.9000015; scale-y: 0.800000012; }
        frame 49 { x: 21.5; y: -78.5; skew-y: 0.300000012; scale-y: 0.828000009; }
        frame 50 { x: 22.2000008; y: -83.0999985; skew-y: 0.899999976; scale-y: 0.855000019; }
        frame 51 { x: 21.6000004; y: -78.5; skew-y: 0.300000012; scale-y: 0.828000009; }
        frame 52 { x: 20.7000008; y: -73.9000015; skew-y: 0; scale-y: 0.800000012; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { x: 20.2999992; y: -74.6999969; skew-x: -3; skew-y: -3; scale-x: 0.799000025; scale-y: 0.806999981; }
        frame 55 { x: 19.7000008; y: -75.4000015; skew-x: -6.4000001; skew-y: -6.4000001; scale-x: -10000; scale-y: 0.81400001; }
        frame 56 { x: 20; y: -76.1999969; skew-x: -5; skew-y: -5; scale-y: 0.82099998; }
        frame 57 { x: 20.1000004; y: -77.0999985; skew-x: -3.70000005; skew-y: -3.70000005; scale-y: 0.828999996; }
        frame 58 { x: 20.2999992; y: -78; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.800000012; scale-y: 0.836000025; }
        frame 59 { x: 20.6000004; y: -78.6999969; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: -10000; scale-y: 0.843999982; }
        frame 60 { x: 20.7000008; y: -79.5999985; skew-x: 0; skew-y: 0; scale-y: 0.851000011; }
        frame 61 { x: 21.5; y: -79.1999969; skew-x: 4.5; skew-y: 4.5; scale-y: 0.843999982; }
        frame 62 { x: 22.2000008; y: -78.9000015; skew-x: 9; skew-y: 9; scale-y: 0.836000025; }
        frame 63 { x: 21.7999992; y: -78; skew-x: 7.0999999; skew-y: 7.0999999; scale-x: 0.799000025; scale-y: 0.828999996; }
        frame 64 { x: 21.5; y: -77; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: -10000; scale-y: 0.822000027; }
        frame 65 { x: 21.2999992; y: -76.1999969; skew-x: 3.5; skew-y: 3.5; scale-x: 0.800000012; scale-y: 0.81400001; }
        frame 66 { x: 21; y: -75.3000031; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: -10000; scale-y: 0.806999981; }
        frame 67 { x: 20.7000008; y: -74.4000015; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 68 { x: -10000; y: -73.9000015; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 69 { x: 16.5; y: -74.3000031; skew-y: -0.699999988; }
        frame 70 { x: 12.3000002; y: -74.6999969; skew-y: -1.70000005; scale-y: 0.800999999; }
        frame 71 { x: 8.10000038; y: -75.1999969; skew-y: -2.70000005; scale-y: -10000; }
        frame 72 { x: 3.79999995; y: -75.5; skew-y: -3.79999995; scale-y: 0.801999986; }
        frame 73 { x: 14.1000004; y: -75.6999969; skew-x: -16.3999996; skew-y: -21.7000008; scale-x: 0.786000013; scale-y: 0.815999985; }
        frame 74 { x: 55.5; y: -76.5999985; skew-x: 4.30000019; skew-y: 1.5; scale-x: 0.791999996; scale-y: 0.806999981; }
        frame 75 { x: 97.5; y: -77.1999969; skew-x: 25.1000004; skew-y: 25.1000004; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 76 { x: 84.6999969; y: -76.6999969; skew-x: 20.7999992; skew-y: 20.7999992; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 77 { x: 71.8000031; y: -76.1999969; skew-x: 16.6000004; skew-y: 16.6000004; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 78 { x: 59; y: -75.8000031; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 46.2999992; y: -75.1999969; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 80 { x: 33.5; y: -74.5999985; skew-x: 4; skew-y: 4; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 81 { x: 20.7000008; y: -74.0999985; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: -10000; y: -74.4000015; skew-x: -10000; skew-y: -10000; }
        frame 83 { y: -75.4000015; scale-y: 0.816999972; }
        frame 84 { y: -76.5; scale-y: 0.834999979; }
        frame 85 { y: -51.9000015; scale-y: 0.824999988; }
        frame 86 { y: -27.2999992; scale-y: 0.815999985; }
        frame 87 { x: 21; y: -20.7999992; scale-y: 0.797999978; }
        frame 88 { x: 21.2000008; y: -14.1000004; scale-y: 0.781000018; }
        frame 89 { x: 21.5; y: -7.5; scale-y: 0.763000011; }
        frame 90 { x: 21.7000008; y: -0.899999976; skew-y: 0.200000003; scale-y: 0.745999992; }
        frame 91 { x: 21.5; y: -1.70000005; skew-y: 0; scale-y: 0.759000003; }
        frame 92 { x: 21.2000008; y: -2.4000001; skew-y: -10000; scale-y: 0.773000002; }
        frame 93 { x: 21; y: -3.20000005; scale-y: 0.786000013; }
        frame 94 { x: 20.7000008; y: -3.9000001; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cactus_floer_top2";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 15.3999996; y: 0.699999988; scale-x: 0.5; scale-y: 0.5; cel: 0; image: IMAGE_REANIM_CACTUS_FLOWER_TOP; }
        frame 6 { x: 15.1999998; y: 1.20000005; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: 0.504000008; cel: -10000; image: none; }
        frame 7 { x: 15; y: 1.79999995; skew-x: -6.4000001; skew-y: -6.4000001; scale-x: 0.499000013; scale-y: 0.509000003; }
        frame 8 { x: 15.1000004; y: 0.699999988; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: 0.513000011; }
        frame 9 { x: -10000; y: -0.200000003; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: 0.5; scale-y: 0.518000007; }
        frame 10 { x: 15.3000002; y: -1.29999995; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: -10000; scale-y: 0.523000002; }
        frame 11 { x: 15.3999996; y: -2.29999995; skew-x: -1.20000005; skew-y: -1.20000005; scale-y: 0.52700001; }
        frame 12 { x: -10000; y: -3.5; skew-x: 0; skew-y: 0; scale-y: 0.532000005; }
        frame 13 { x: 15.8000002; y: -4.69999981; skew-x: 4.5; skew-y: 4.5; scale-y: 0.52700001; }
        frame 14 { x: 16.2999992; y: -5.80000019; skew-x: 9; skew-y: 9; scale-y: 0.523000002; }
        frame 15 { x: 16; y: -4.5; skew-x: 7.0999999; skew-y: 7.0999999; scale-y: 0.518000007; }
        frame 16 { x: 15.8999996; y: -3.0999999; skew-x: 5.30000019; skew-y: 5.30000019; scale-y: 0.513000011; }
        frame 17 { x: 15.6999998; y: -1.79999995; skew-x: 3.5; skew-y: 3.5; scale-y: 0.509000003; }
        frame 18 { x: 15.5; y: -0.400000006; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 0.504000008; }
        frame 19 { x: 15.3999996; y: 0.699999988; skew-x: 0; skew-y: 0; scale-y: 0.5; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 16.5; y: 0.300000012; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 22 { x: 17.6000004; y: 0; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 23 { x: 18.7999992; y: -0.200000003; skew-x: 5.80000019; skew-y: 5.80000019; }
        frame 24 { x: 16.3999996; y: 0; skew-x: 4.5; skew-y: 3.79999995; }
        frame 25 { x: 14.1000004; y: 0.100000001; skew-x: 3.29999995; skew-y: 1.79999995; }
        frame 26 { x: 11.6999998; y: 0.300000012; skew-x: 2.29999995; skew-y: 0; scale-y: 0.500999987; }
        frame 27 { x: 9.39999962; y: 0.600000024; skew-x: 1; skew-y: -1.70000005; scale-y: -10000; }
        frame 28 { x: 6.9000001; y: 0.699999988; skew-x: 0; skew-y: -3.79999995; }
        frame 29 { x: 15.6000004; y: 1.70000005; skew-x: -16.1000004; skew-y: -18.7000008; scale-x: 0.499000013; scale-y: 0.5; }
        frame 30 { x: 37.9000015; y: 0.5; skew-x: 4.30000019; skew-y: 3; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 61.7999992; y: -1.10000002; skew-x: 25.1000004; skew-y: 25.1000004; scale-y: 0.499000013; }
        frame 32 { x: 53.9000015; y: -0.800000012; skew-x: 20.7999992; skew-y: 20.7999992; scale-y: -10000; }
        frame 33 { x: 46; y: -0.400000006; skew-x: 16.6000004; skew-y: 16.6000004; }
        frame 34 { x: 38.2999992; y: -0.100000001; skew-x: 12.5; skew-y: 12.5; }
        frame 35 { x: 30.7000008; y: 0.100000001; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.5; scale-y: 0.5; }
        frame 36 { x: 23; y: 0.300000012; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 15.3999996; y: 0.699999988; skew-x: 0; skew-y: 0; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 39 { x: 15.8000002; y: -0.100000001; scale-y: 0.488999993; }
        frame 40 { x: 16.1000004; y: 1.5; scale-y: 0.476999998; }
        frame 41 { x: 16.3999996; y: 3.4000001; skew-y: 0.200000003; scale-y: 0.465999991; }
        frame 42 { x: 16.2000008; y: -3.0999999; skew-y: 0; scale-y: 0.476999998; }
        frame 43 { x: 15.8999996; y: -9.5; skew-y: -10000; scale-y: 0.488000005; }
        frame 44 { x: 15.6999998; y: -16.1000004; scale-y: 0.499000013; }
        frame 45 { x: 15.3999996; y: -22.6000004; scale-y: 0.50999999; }
        frame 46 { x: -10000; y: -38.5; scale-y: 0.507000029; }
        frame 47 { y: -53.7999992; scale-y: 0.503000021; }
        frame 48 { y: -69.1999969; scale-y: 0.5; }
        frame 49 { x: 16.1000004; y: -73.5999985; skew-y: 0.300000012; scale-y: 0.51700002; }
        frame 50 { x: 16.8999996; y: -78.0999985; skew-y: 0.899999976; scale-y: 0.535000026; }
        frame 51 { x: 16.2000008; y: -73.5999985; skew-y: 0.300000012; scale-y: 0.51700002; }
        frame 52 { x: 15.3999996; y: -69.1999969; skew-y: 0; scale-y: 0.5; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { x: 15.1999998; y: -69.6999969; skew-x: -3; skew-y: -3; scale-y: 0.504000008; }
        frame 55 { x: 15; y: -70.0999985; skew-x: -6.4000001; skew-y: -6.4000001; scale-x: 0.499000013; scale-y: 0.509000003; }
        frame 56 { x: 15.1000004; y: -71; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: 0.513000011; }
        frame 57 { x: -10000; y: -71.9000015; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: 0.5; scale-y: 0.518000007; }
        frame 58 { x: 15.1999998; y: -72.8000031; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: -10000; scale-y: 0.523000002; }
        frame 59 { x: 15.3999996; y: -73.5999985; skew-x: -1.20000005; skew-y: -1.20000005; scale-y: 0.52700001; }
        frame 60 { x: -10000; y: -74.5999985; skew-x: 0; skew-y: 0; scale-y: 0.532000005; }
        frame 61 { x: 15.8000002; y: -74.6999969; skew-x: 4.5; skew-y: 4.5; scale-y: 0.52700001; }
        frame 62 { x: 16.2999992; y: -74.8000031; skew-x: 9; skew-y: 9; scale-y: 0.523000002; }
        frame 63 { x: 16; y: -73.8000031; skew-x: 7.0999999; skew-y: 7.0999999; scale-y: 0.518000007; }
        frame 64 { x: 15.8000002; y: -72.6999969; skew-x: 5.30000019; skew-y: 5.30000019; scale-y: 0.513000011; }
        frame 65 { x: 15.6999998; y: -71.6999969; skew-x: 3.5; skew-y: 3.5; scale-y: 0.509000003; }
        frame 66 { x: 15.5; y: -70.6999969; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 0.504000008; }
        frame 67 { x: 15.3999996; y: -69.6999969; skew-x: 0; skew-y: 0; scale-y: 0.5; }
        frame 68 { x: -10000; y: -69.1999969; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 69 { x: 11.3000002; y: -69.5999985; skew-y: -0.699999988; }
        frame 70 { x: 7.19999981; y: -70; skew-y: -1.70000005; scale-y: 0.500999987; }
        frame 71 { x: 3; y: -70.5; skew-y: -2.70000005; scale-y: -10000; }
        frame 72 { x: -1.10000002; y: -70.8000031; skew-y: -3.79999995; }
        frame 73 { x: 10.8999996; y: -69.8000031; skew-x: -16.3999996; skew-y: -21.7000008; scale-x: 0.490999997; scale-y: 0.50999999; }
        frame 74 { x: 50.0999985; y: -72.3000031; skew-x: 4.30000019; skew-y: 1.5; scale-x: 0.495000005; scale-y: 0.504999995; }
        frame 75 { x: 90.8000031; y: -75.1999969; skew-x: 25.1000004; skew-y: 25.1000004; scale-x: 0.499000013; scale-y: 0.499000013; }
        frame 76 { x: 78.0999985; y: -74.1999969; skew-x: 20.7999992; skew-y: 20.7999992; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 65.4000015; y: -73.1999969; skew-x: 16.6000004; skew-y: 16.6000004; }
        frame 78 { x: 52.7999992; y: -72.3000031; skew-x: 12.5; skew-y: 12.5; }
        frame 79 { x: 40.4000015; y: -71.3000031; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.5; scale-y: 0.5; }
        frame 80 { x: 27.7999992; y: -70.3000031; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 15.3999996; y: -69.4000015; skew-x: 0; skew-y: 0; }
        frame 82 { x: -10000; y: -69.6999969; skew-x: -10000; skew-y: -10000; }
        frame 83 { y: -70.5999985; scale-y: 0.510999978; }
        frame 84 { y: -71.5999985; scale-y: 0.522000015; }
        frame 85 { y: -47; scale-y: 0.515999973; }
        frame 86 { y: -22.6000004; scale-y: 0.50999999; }
        frame 87 { x: 15.6999998; y: -16.1000004; scale-y: 0.499000013; }
        frame 88 { x: 15.8999996; y: -9.5; scale-y: 0.488000005; }
        frame 89 { x: 16.2000008; y: -3.0999999; scale-y: 0.476999998; }
        frame 90 { x: 16.3999996; y: 3.4000001; skew-y: 0.200000003; scale-y: 0.465999991; }
        frame 91 { x: 16.2000008; y: 2.70000005; skew-y: 0; scale-y: 0.474999994; }
        frame 92 { x: 15.8999996; y: 2; skew-y: -10000; scale-y: 0.48300001; }
        frame 93 { x: 15.6999998; y: 1.29999995; scale-y: 0.492000014; }
        frame 94 { x: 15.3999996; y: 0.699999988; scale-y: 0.5; }
    }
    Track {
        source-name: "Cactus_floer_top3";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 16.2000008; y: -4.19999981; scale-x: 0.550000012; scale-y: 0.550000012; cel: 0; image: IMAGE_REANIM_CACTUS_FLOWER_TOP; }
        frame 6 { x: 15.6999998; y: -3.79999995; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: 0.555000007; cel: -10000; image: none; }
        frame 7 { x: 15.3000002; y: -3.20000005; skew-x: -6.4000001; skew-y: -6.4000001; scale-x: 0.549000025; scale-y: 0.559000015; }
        frame 8 { x: 15.3999996; y: -4.30000019; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: 0.56400001; }
        frame 9 { x: 15.6000004; y: -5.30000019; skew-x: -3.70000005; skew-y: -3.70000005; scale-y: 0.569999993; }
        frame 10 { x: 15.8000002; y: -6.5; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.550000012; scale-y: 0.574999988; }
        frame 11 { x: 16.1000004; y: -7.5; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: -10000; scale-y: 0.579999983; }
        frame 12 { x: 16.2000008; y: -8.69999981; skew-x: 0; skew-y: 0; scale-y: 0.584999979; }
        frame 13 { x: 17; y: -9.80000019; skew-x: 4.5; skew-y: 4.5; scale-y: 0.579999983; }
        frame 14 { x: 17.8999996; y: -10.8000002; skew-x: 9; skew-y: 9; scale-y: 0.574999988; }
        frame 15 { x: 17.5; y: -9.5; skew-x: 7.0999999; skew-y: 7.0999999; scale-y: 0.569999993; }
        frame 16 { x: 17.2000008; y: -8.10000038; skew-x: 5.30000019; skew-y: 5.30000019; scale-y: 0.564999998; }
        frame 17 { x: 16.7999992; y: -6.80000019; skew-x: 3.5; skew-y: 3.5; scale-y: 0.560000002; }
        frame 18 { x: 16.5; y: -5.4000001; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 0.555000007; }
        frame 19 { x: 16.2000008; y: -4.19999981; skew-x: 0; skew-y: 0; scale-y: 0.550000012; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 17.5; y: -4.5; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 22 { x: 18.7000008; y: -4.80000019; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 23 { x: 20.1000004; y: -5; skew-x: 5.80000019; skew-y: 5.80000019; }
        frame 24 { x: 17.5; y: -4.80000019; skew-x: 4.5; skew-y: 3.79999995; }
        frame 25 { x: 15; y: -4.69999981; skew-x: 3.29999995; skew-y: 1.79999995; }
        frame 26 { x: 12.5; y: -4.5; skew-x: 2.29999995; skew-y: 0; scale-y: 0.550999999; }
        frame 27 { x: 10; y: -4.30000019; skew-x: 1; skew-y: -1.70000005; scale-y: -10000; }
        frame 28 { x: 7.4000001; y: -4.19999981; skew-x: 0; skew-y: -3.79999995; }
        frame 29 { x: 14.6999998; y: -3.0999999; skew-x: -16.1000004; skew-y: -18.7000008; scale-x: 0.549000025; scale-y: 0.550000012; }
        frame 30 { x: 39; y: -4.30000019; skew-x: 4.30000019; skew-y: 3; scale-x: -10000; scale-y: 0.549000025; }
        frame 31 { x: 64.5; y: -5.19999981; skew-x: 25.1000004; skew-y: 25.1000004; scale-y: -10000; }
        frame 32 { x: 56.4000015; y: -10000; skew-x: 20.7999992; skew-y: 20.7999992; }
        frame 33 { x: 48.2000008; y: -5; skew-x: 16.6000004; skew-y: 16.6000004; }
        frame 34 { x: 40.2000008; y: -4.80000019; skew-x: 12.5; skew-y: 12.5; }
        frame 35 { x: 32.0999985; y: -4.5999999; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 36 { x: 24.1000004; y: -4.4000001; skew-x: 4; skew-y: 4; scale-x: 0.550000012; scale-y: 0.550000012; }
        frame 37 { x: 16.2000008; y: -4.19999981; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 39 { x: 16.6000004; y: -5; scale-y: 0.537999988; }
        frame 40 { x: 16.8999996; y: -3.0999999; scale-y: 0.524999976; }
        frame 41 { x: 17.2000008; y: -1.20000005; skew-y: 0.200000003; scale-y: 0.513000011; }
        frame 42 { x: 17; y: -7.80000019; skew-y: 0; scale-y: 0.524999976; }
        frame 43 { x: 16.7000008; y: -14.3999996; skew-y: -10000; scale-y: 0.537; }
        frame 44 { x: 16.5; y: -21; scale-y: 0.549000025; }
        frame 45 { x: 16.2000008; y: -27.6000004; scale-y: 0.56099999; }
        frame 46 { x: -10000; y: -43.5; scale-y: 0.556999981; }
        frame 47 { y: -58.7999992; scale-y: 0.55400002; }
        frame 48 { y: -74.1999969; scale-y: 0.550000012; }
        frame 49 { x: 17; y: -78.6999969; skew-y: 0.300000012; scale-y: 0.569000006; }
        frame 50 { x: 17.7999992; y: -83.4000015; skew-y: 0.899999976; scale-y: 0.588; }
        frame 51 { x: 17.1000004; y: -78.6999969; skew-y: 0.300000012; scale-y: 0.569000006; }
        frame 52 { x: 16.2000008; y: -74.1999969; skew-y: 0; scale-y: 0.550000012; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { x: 15.6999998; y: -74.8000031; skew-x: -3; skew-y: -3; scale-y: 0.555000007; }
        frame 55 { x: 15.3000002; y: -75.1999969; skew-x: -6.4000001; skew-y: -6.4000001; scale-x: 0.549000025; scale-y: 0.559000015; }
        frame 56 { x: 15.5; y: -76.0999985; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: 0.56400001; }
        frame 57 { x: 15.6000004; y: -77; skew-x: -3.70000005; skew-y: -3.70000005; scale-y: 0.569999993; }
        frame 58 { x: 15.8000002; y: -78; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.550000012; scale-y: 0.574999988; }
        frame 59 { x: 16.1000004; y: -78.9000015; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: -10000; scale-y: 0.579999983; }
        frame 60 { x: 16.2000008; y: -79.8000031; skew-x: 0; skew-y: 0; scale-y: 0.584999979; }
        frame 61 { x: 17; y: -10000; skew-x: 4.5; skew-y: 4.5; scale-y: 0.579999983; }
        frame 62 { x: 17.8999996; skew-x: 9; skew-y: 9; scale-y: 0.574999988; }
        frame 63 { x: 17.3999996; y: -78.8000031; skew-x: 7.0999999; skew-y: 7.0999999; scale-y: 0.569999993; }
        frame 64 { x: 17.1000004; y: -77.6999969; skew-x: 5.30000019; skew-y: 5.30000019; scale-y: 0.564999998; }
        frame 65 { x: 16.7999992; y: -76.6999969; skew-x: 3.5; skew-y: 3.5; scale-y: 0.560000002; }
        frame 66 { x: 16.5; y: -75.6999969; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 0.555000007; }
        frame 67 { x: 16.2000008; y: -74.6999969; skew-x: 0; skew-y: 0; scale-y: 0.550000012; }
        frame 68 { x: -10000; y: -74.1999969; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 69 { x: 12; y: -74.5999985; skew-y: -0.699999988; }
        frame 70 { x: 7.80000019; y: -75; skew-y: -1.70000005; scale-y: 0.550999999; }
        frame 71 { x: 3.5; y: -75.4000015; skew-y: -2.70000005; scale-y: -10000; }
        frame 72 { x: -0.600000024; y: -75.8000031; skew-y: -3.79999995; }
        frame 73 { x: 9.69999981; y: -74.6999969; skew-x: -16.3999996; skew-y: -21.7000008; scale-x: 0.540000021; scale-y: 0.56099999; }
        frame 74 { x: 51; y: -77.1999969; skew-x: 4.30000019; skew-y: 1.5; scale-x: 0.545000017; scale-y: 0.555000007; }
        frame 75 { x: 93.5; y: -79.3000031; skew-x: 25.1000004; skew-y: 25.1000004; scale-x: 0.549000025; scale-y: 0.549000025; }
        frame 76 { x: 80.5999985; y: -78.5999985; skew-x: 20.7999992; skew-y: 20.7999992; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 67.5999985; y: -77.6999969; skew-x: 16.6000004; skew-y: 16.6000004; }
        frame 78 { x: 54.5999985; y: -77; skew-x: 12.5; skew-y: 12.5; }
        frame 79 { x: 41.7999992; y: -76.0999985; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 80 { x: 29; y: -75.1999969; skew-x: 4; skew-y: 4; scale-x: 0.550000012; scale-y: 0.550000012; }
        frame 81 { x: 16.2000008; y: -74.4000015; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: -10000; y: -74.6999969; skew-x: -10000; skew-y: -10000; }
        frame 83 { y: -75.6999969; scale-y: 0.561999977; }
        frame 84 { y: -76.6999969; scale-y: 0.574000001; }
        frame 85 { y: -52.0999985; scale-y: 0.566999972; }
        frame 86 { y: -27.6000004; scale-y: 0.56099999; }
        frame 87 { x: 16.5; y: -21; scale-y: 0.549000025; }
        frame 88 { x: 16.7000008; y: -14.3999996; scale-y: 0.537; }
        frame 89 { x: 17; y: -7.80000019; scale-y: 0.524999976; }
        frame 90 { x: 17.2000008; y: -1.20000005; skew-y: 0.200000003; scale-y: 0.513000011; }
        frame 91 { x: 17; y: -1.89999998; skew-y: 0; scale-y: 0.522000015; }
        frame 92 { x: 16.7000008; y: -2.70000005; skew-y: -10000; scale-y: 0.531000018; }
        frame 93 { x: 16.5; y: -3.4000001; scale-y: 0.541000009; }
        frame 94 { x: 16.2000008; y: -4.19999981; scale-y: 0.550000012; }
    }
    Track {
        source-name: "Cactus_arm2_2";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 52; y: 44.2999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CACTUS_ARM2_2; }
        frame 6 { x: -10000; y: 44; skew-x: 3.79999995; scale-x: 0.802999973; scale-y: 0.806999981; cel: -10000; image: none; }
        frame 7 { y: 43.5999985; skew-x: 7.69999981; scale-x: 0.806999981; scale-y: 0.814999998; }
        frame 8 { x: 52; y: 43.5; skew-x: 6; scale-x: 0.805999994; scale-y: 0.822000027; }
        frame 9 { y: 43.4000015; skew-x: 4.5; scale-x: 0.80400002; scale-y: 0.828999996; }
        frame 10 { x: -10000; y: 43.2999992; skew-x: 3; scale-x: 0.802999973; scale-y: 0.837000012; }
        frame 11 { y: 43; skew-x: 1.5; scale-x: 0.800999999; scale-y: 0.843999982; }
        frame 12 { y: 42.9000015; skew-x: 0; scale-x: 0.800000012; scale-y: 0.851000011; }
        frame 13 { y: 43.0999985; skew-x: -2.70000005; scale-x: 0.801999986; scale-y: 0.843999982; }
        frame 14 { y: 43.4000015; skew-x: -5.9000001; scale-x: 0.80400002; scale-y: 0.837000012; }
        frame 15 { y: 43.5; skew-x: -4.69999981; scale-x: 0.802999973; scale-y: 0.828999996; }
        frame 16 { x: 52; y: 43.7999992; skew-x: -3.4000001; scale-x: 0.801999986; scale-y: 0.822000027; }
        frame 17 { x: -10000; y: 43.9000015; skew-x: -2.20000005; scale-x: -10000; scale-y: 0.814999998; }
        frame 18 { x: 52; y: 44.0999985; skew-x: -0.899999976; scale-x: 0.800999999; scale-y: 0.806999981; }
        frame 19 { x: -10000; y: 44.2999992; skew-x: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 20 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 51.5; skew-y: -0.400000006; }
        frame 24 { x: 50.7999992; skew-y: -1.20000005; scale-y: 0.800999999; }
        frame 25 { x: 50.2999992; y: 44.4000015; skew-y: -1.70000005; scale-y: -10000; }
        frame 26 { x: 49.5; y: 44.2999992; skew-y: -2.4000001; }
        frame 27 { x: 49; y: -10000; skew-y: -3; }
        frame 28 { x: 48.2999992; skew-y: -3.79999995; scale-y: 0.801999986; }
        frame 29 { x: 51.4000015; skew-y: 0; scale-x: 0.612999976; scale-y: 0.800000012; }
        frame 30 { x: 53.4000015; skew-y: -10000; scale-x: 0.707000017; scale-y: -10000; }
        frame 31 { x: 55.4000015; scale-x: 0.800000012; }
        frame 32 { x: 55.2999992; scale-x: -10000; }
        frame 33 { x: 55; }
        frame 34 { x: 54.2999992; }
        frame 35 { x: 53.5; }
        frame 36 { x: 52.7999992; }
        frame 37 { x: 52; }
        frame 38 { x: -10000; }
        frame 39 { y: 43.7999992; scale-y: 0.782000005; }
        frame 40 { x: 52.2999992; y: 44.7999992; scale-y: 0.763999999; }
        frame 41 { x: 52.5; y: 45.7999992; skew-y: 0.200000003; scale-y: 0.745999992; }
        frame 42 { x: 52.4000015; y: 40; skew-y: 0; scale-y: 0.759000003; }
        frame 43 { x: 52.2999992; y: 34; skew-y: -10000; scale-y: 0.773000002; }
        frame 44 { x: 52.0999985; y: 28.2999992; scale-y: 0.786000013; }
        frame 45 { x: 52; y: 22.2999992; scale-y: 0.800000012; }
        frame 46 { x: -10000; y: 7.0999999; skew-x: -5.5999999; scale-x: 0.80400002; scale-y: -10000; }
        frame 47 { y: -9.10000038; skew-x: -2.70000005; scale-x: 0.801999986; }
        frame 48 { y: -25.5; skew-x: 0; scale-x: 0.800000012; }
        frame 49 { x: 52.2999992; y: -26.7000008; skew-x: -2.9000001; skew-y: 0.300000012; scale-x: 0.802999973; scale-y: 0.828000009; }
        frame 50 { x: 52.5; y: -28; skew-x: -6; skew-y: 0.899999976; scale-x: 0.805999994; scale-y: 0.855000019; }
        frame 51 { x: 52.2999992; y: -26.7999992; skew-x: -2.9000001; skew-y: 0.300000012; scale-x: 0.802999973; scale-y: 0.828000009; }
        frame 52 { x: 52; y: -25.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 54 { y: -26.7999992; skew-x: 3.79999995; scale-x: 0.802999973; scale-y: 0.806999981; }
        frame 55 { y: -28.2000008; skew-x: 7.69999981; scale-x: 0.806999981; scale-y: 0.814999998; }
        frame 56 { x: 52; y: -28.1000004; skew-x: 6; scale-x: 0.805999994; scale-y: 0.822000027; }
        frame 57 { y: -10000; skew-x: 4.5; scale-x: 0.80400002; scale-y: 0.828999996; }
        frame 58 { x: -10000; skew-x: 3; scale-x: 0.802999973; scale-y: 0.837000012; }
        frame 59 { skew-x: 1.5; scale-x: 0.800999999; scale-y: 0.843999982; }
        frame 60 { y: -28; skew-x: 0; scale-x: 0.800000012; scale-y: 0.851000011; }
        frame 61 { y: -26.7000008; skew-x: -2.70000005; scale-x: 0.801999986; scale-y: 0.843999982; }
        frame 62 { y: -25.5; skew-x: -5.9000001; scale-x: 0.80400002; scale-y: 0.837000012; }
        frame 63 { y: -10000; skew-x: -4.69999981; scale-x: 0.802999973; scale-y: 0.828999996; }
        frame 64 { x: 52; y: -25.7000008; skew-x: -3.4000001; scale-x: 0.801999986; scale-y: 0.822000027; }
        frame 65 { x: -10000; y: -25.7999992; skew-x: -2.20000005; scale-x: -10000; scale-y: 0.814999998; }
        frame 66 { x: 52; y: -25.8999996; skew-x: -0.899999976; scale-x: 0.800999999; scale-y: 0.806999981; }
        frame 67 { x: -10000; y: -26; skew-x: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 68 { y: -25.5; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 49.0999985; y: -25.8999996; skew-y: -0.699999988; }
        frame 70 { x: 46.0999985; y: -26.2999992; skew-y: -1.70000005; scale-y: 0.800999999; }
        frame 71 { x: 43.0999985; y: -26.7000008; skew-y: -2.70000005; scale-y: -10000; }
        frame 72 { x: 40.2000008; y: -27.1000004; skew-y: -3.79999995; scale-y: 0.801999986; }
        frame 73 { x: 54.5999985; y: -27.5; skew-y: 0; scale-x: 0.612999976; scale-y: 0.800000012; }
        frame 74 { x: 70.0999985; y: -27.3999996; skew-y: -10000; scale-x: 0.707000017; scale-y: -10000; }
        frame 75 { x: 85.5999985; y: -27.2000008; scale-x: 0.800000012; }
        frame 76 { x: 78.5; y: -26.8999996; scale-x: -10000; }
        frame 77 { x: 71.3000031; y: -26.6000004; }
        frame 78 { x: 66.5; y: -26.3999996; }
        frame 79 { x: 61.7000008; y: -26.2000008; }
        frame 80 { x: 56.9000015; y: -25.8999996; }
        frame 81 { x: 52; y: -25.7000008; }
        frame 82 { x: -10000; y: -26; }
        frame 83 { y: -25.8999996; scale-y: 0.816999972; }
        frame 84 { y: -26; scale-y: 0.834999979; }
        frame 85 { y: -1.70000005; scale-y: 0.816999972; }
        frame 86 { y: 22.2999992; scale-y: 0.800000012; }
        frame 87 { x: 52.0999985; y: 28.2000008; scale-y: 0.786000013; }
        frame 88 { x: 52.2999992; y: 34; scale-y: 0.773000002; }
        frame 89 { x: 52.4000015; y: 40; scale-y: 0.759000003; }
        frame 90 { x: 52.5; y: 45.7999992; skew-y: 0.200000003; scale-y: 0.745999992; }
        frame 91 { x: 52.4000015; y: 45.5; skew-y: 0; scale-y: 0.759000003; }
        frame 92 { x: 52.2999992; y: 45; skew-y: -10000; scale-y: 0.773000002; }
        frame 93 { x: 52.0999985; y: 44.7999992; scale-y: 0.786000013; }
        frame 94 { x: 52; y: 44.2999992; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cactus_body3";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 45 { x: 11.1000004; y: 50; scale-x: 0.800000012; scale-y: 0.393999994; cel: 0; image: IMAGE_REANIM_CACTUS_BODY3; }
        frame 46 { x: 11.1999998; y: 37.0999985; scale-x: -10000; scale-y: 0.68900001; cel: -10000; image: none; }
        frame 47 { x: 11.3000002; y: 24.2999992; scale-y: 0.985000014; }
        frame 48 { x: 11.3999996; y: 11.5; scale-y: 1.28100002; }
        frame 49 { x: -10000; y: -10000; scale-y: 1.26499999; }
        frame 50 { x: 11.1999998; skew-y: -0.200000003; scale-y: 1.24800003; }
        frame 51 { x: -10000; y: 14; skew-y: 0; scale-y: 1.20099998; }
        frame 52 { x: 11.3999996; y: 16.7999992; skew-y: -10000; scale-y: 1.153; }
        frame 53 { x: -10000; y: -10000; scale-y: -10000; }
        frame 54 { y: 16.3999996; scale-y: 1.16199994; }
        frame 55 { y: 16; scale-y: 1.171; }
        frame 56 { y: 15.6999998; scale-y: 1.17900002; }
        frame 57 { y: 15.3000002; scale-y: 1.18799996; }
        frame 58 { y: 14.8999996; scale-y: 1.19599998; }
        frame 59 { y: 14.5; skew-y: -0; scale-y: 1.20500004; }
        frame 60 { x: 11.3000002; y: 14; skew-y: -0.100000001; scale-y: 1.21399999; }
        frame 61 { x: 11.3999996; y: 14.3999996; skew-y: -0; scale-y: 1.20500004; }
        frame 62 { x: -10000; y: 14.8000002; skew-y: 0; scale-y: 1.19599998; }
        frame 63 { y: 15.1000004; skew-y: -10000; scale-y: 1.18799996; }
        frame 64 { y: 15.5; scale-y: 1.17900002; }
        frame 65 { y: 15.8999996; scale-y: 1.171; }
        frame 66 { y: 16.2999992; scale-y: 1.16199994; }
        frame 67 { y: 16.7999992; scale-y: 1.153; }
        frame 68 { y: -10000; scale-y: -10000; }
        frame 69 { x: 10.6000004; skew-y: -0.600000024; }
        frame 70 { x: 8.5; y: 16.6000004; skew-y: -3.5; scale-y: 1.15499997; }
        frame 71 { x: 6.19999981; y: -10000; skew-y: -6.5; scale-y: 1.15799999; }
        frame 72 { x: 3.9000001; y: 16.5; skew-y: -9.60000038; scale-y: 1.15999997; }
        frame 73 { x: 12.3000002; y: 17.8999996; skew-y: 1; scale-y: 1.10399997; }
        frame 74 { x: 22.7000008; y: 15.6999998; skew-y: 10.3000002; scale-y: 1.20899999; }
        frame 75 { x: 33.0999985; y: 13.3999996; skew-y: 19.8999996; scale-y: 1.31500006; }
        frame 76 { x: 26.7000008; y: 14; skew-y: 14.6000004; scale-y: 1.23000002; }
        frame 77 { x: 21.6000004; y: 16.2000008; skew-y: 9.5; scale-y: 1.14600003; }
        frame 78 { x: 19.1000004; y: 16.2999992; skew-y: 7; scale-y: 1.14699996; }
        frame 79 { x: 16.5; y: 16.3999996; skew-y: 4.5999999; scale-y: 1.14900005; }
        frame 80 { x: 13.8999996; y: 16.6000004; skew-y: 2.29999995; scale-y: 1.15100002; }
        frame 81 { x: 11.3999996; y: 16.7999992; skew-y: 0; scale-y: 1.153; }
        frame 82 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 83 { y: 17.7000008; scale-y: 1.13499999; }
        frame 84 { x: 11.3000002; y: 18.3999996; skew-y: -0; scale-y: 1.11699998; }
        frame 85 { x: 11.1000004; y: 43.7999992; skew-y: 0; scale-y: 0.465000004; }
        frame 86 { x: 11.3000002; y: 57.5; skew-y: -10000; scale-y: 0.0489999987; }
        frame 87 { x: -10000; y: -10000; scale-y: -10000; cel: -1; }
        frame 88 { cel: -10000; }
    }
    Track {
        source-name: "Cactus_body2";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 10; y: 54.9000015; scale-x: 0.84799999; scale-y: 0.400000006; cel: 0; image: IMAGE_REANIM_CACTUS_BODY2; }
        frame 41 { x: 10.1999998; y: 51.9000015; scale-x: 0.839999974; scale-y: 0.508000016; cel: -10000; image: none; }
        frame 42 { x: 10.3999996; y: 49; scale-x: 0.832000017; scale-y: 0.616999984; }
        frame 43 { x: 10.6000004; y: 46.2000008; scale-x: 0.824000001; scale-y: 0.725000024; }
        frame 44 { x: 10.8000002; y: 43.2999992; scale-x: 0.815999985; scale-y: 0.833999991; }
        frame 45 { x: 10.8999996; y: 40.5999985; scale-x: 0.808000028; scale-y: 0.941999972; }
        frame 46 { x: -10000; y: 25.1000004; scale-x: 0.805000007; scale-y: 0.924000025; }
        frame 47 { x: 11; y: 9.69999981; scale-x: 0.802999973; scale-y: 0.906000018; }
        frame 48 { x: 11.1999998; y: -5.69999981; scale-x: 0.800000012; scale-y: 0.888000011; }
        frame 49 { x: 10.8999996; y: -6.80000019; skew-y: -0.200000003; scale-x: -10000; scale-y: 0.910000026; }
        frame 50 { x: 10.6999998; y: -7.9000001; skew-y: -0.400000006; scale-y: 0.930999994; }
        frame 51 { x: 11; y: -6.80000019; skew-y: -0.200000003; scale-y: 0.949999988; }
        frame 52 { x: 11.1999998; y: -5.69999981; skew-y: 0; scale-y: 0.968999982; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { y: -5.9000001; scale-y: 0.966000021; }
        frame 55 { y: -6.0999999; scale-y: 0.963; }
        frame 56 { y: -6.30000019; scale-y: 0.959999979; }
        frame 57 { y: -6.5; scale-y: 0.95599997; }
        frame 58 { y: -6.80000019; scale-y: 0.953000009; }
        frame 59 { y: -7; scale-y: 0.949999988; }
        frame 60 { y: -7.19999981; scale-y: 0.94599998; }
        frame 61 { y: -5.30000019; scale-y: 0.889999986; }
        frame 62 { y: -3.5; scale-y: 0.833999991; }
        frame 63 { y: -3.9000001; scale-y: 0.861000001; }
        frame 64 { y: -4.4000001; scale-y: 0.888000011; }
        frame 65 { y: -4.80000019; scale-y: 0.915000021; }
        frame 66 { y: -5.19999981; scale-y: 0.941999972; }
        frame 67 { y: -5.69999981; scale-y: 0.968999982; }
        frame 68 { y: -10000; scale-y: -10000; }
        frame 69 { x: 8.39999962; skew-y: -4.5999999; scale-y: 0.97299999; }
        frame 70 { x: 5.80000019; y: -6; skew-y: -5.5; scale-y: 0.964999974; }
        frame 71 { x: 3.20000005; y: -6.19999981; skew-y: -6.5; scale-y: 0.957000017; }
        frame 72 { x: 0.5; y: -6.5999999; skew-y: -7.5999999; scale-y: 0.949999988; }
        frame 73 { x: 12.6000004; y: -8.69999981; skew-y: 0.800000012; scale-y: 0.954999983; }
        frame 74 { x: 26.6000004; y: -8.60000038; skew-y: 10.3000002; scale-y: 0.986000001; }
        frame 75 { x: 40.7999992; y: -7.80000019; skew-y: 19.7000008; scale-y: 1.01900005; }
        frame 76 { x: 33.9000015; y: -10000; skew-y: 16.1000004; scale-y: 0.968999982; }
        frame 77 { x: 27; y: -7.5; skew-y: 12.6999998; scale-y: 0.921999991; }
        frame 78 { x: 23; y: -7.0999999; skew-y: 9.5; scale-y: 0.912999988; }
        frame 79 { x: 19; y: -6.69999981; skew-y: 6.30000019; scale-y: 0.904999971; }
        frame 80 { x: 15; y: -6.19999981; skew-y: 3; scale-y: 0.896000028; }
        frame 81 { x: 11.1999998; y: -5.69999981; skew-y: 0; scale-y: 0.888000011; }
        frame 82 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 83 { y: -5.5; scale-y: 0.907000005; }
        frame 84 { y: -5.30000019; scale-y: 0.925999999; }
        frame 85 { y: 18.8999996; skew-y: 0.300000012; scale-y: 0.91900003; }
        frame 86 { y: 43; skew-y: -0.5; scale-y: 0.73299998; }
        frame 87 { x: 11.3000002; y: 48.5; skew-y: 0.400000006; scale-y: 0.582000017; }
        frame 88 { x: 11.1999998; y: 53.9000015; skew-y: 0.100000001; scale-y: 0.400000006; }
        frame 89 { x: 11.1000004; y: 59.2999992; skew-y: 0; scale-y: 0.217999995; }
        frame 90 { x: 11.1999998; y: 64.5999985; skew-y: -10000; scale-y: 0.0350000001; }
        frame 91 { x: -10000; y: -10000; scale-y: -10000; cel: -1; }
        frame 92 { cel: -10000; }
    }
    Track {
        source-name: "Cactus_arm2_1";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 54.7000008; y: 32.0999985; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CACTUS_ARM2_1; }
        frame 6 { x: 55.5; y: 31.8999996; skew-x: 3; skew-y: 3; scale-x: -10000; scale-y: 0.806999981; cel: -10000; image: none; }
        frame 7 { x: 56.5; y: 31.5; skew-x: 6.30000019; skew-y: 6.30000019; scale-y: 0.81400001; }
        frame 8 { x: 56; y: 31.2000008; skew-x: 5; skew-y: 5; scale-x: 0.799000025; scale-y: 0.822000027; }
        frame 9 { x: 55.7000008; y: 30.8999996; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: 0.800000012; scale-y: 0.828999996; }
        frame 10 { x: 55.4000015; y: 30.6000004; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: 0.836000025; }
        frame 11 { x: 55; y: 30.2999992; skew-x: 1.29999995; skew-y: 1.29999995; scale-y: 0.843999982; }
        frame 12 { x: 54.7000008; y: 29.8999996; skew-x: 0; skew-y: 0; scale-y: 0.851000011; }
        frame 13 { x: 54; y: 30.2000008; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.843999982; }
        frame 14 { x: 53.2999992; y: 30.5; skew-x: -3.70000005; skew-y: -3.70000005; scale-y: 0.837000012; }
        frame 15 { x: 53.5999985; y: 30.8999996; skew-x: -2.9000001; skew-y: -2.9000001; scale-y: 0.828999996; }
        frame 16 { x: 53.9000015; y: 31.1000004; skew-x: -2.20000005; skew-y: -2.20000005; scale-y: 0.822000027; }
        frame 17 { x: 54.0999985; y: 31.5; skew-x: -1.39999998; skew-y: -1.39999998; scale-y: 0.814999998; }
        frame 18 { x: 54.4000015; y: 31.7999992; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.806999981; }
        frame 19 { x: 54.7000008; y: 32.0999985; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 55; y: 32; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 22 { x: 55.2999992; y: 31.8999996; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 23 { x: 53.7000008; y: 32; skew-x: 0.5; skew-y: 0; }
        frame 24 { x: 52.2999992; y: 32.0999985; skew-x: -0.200000003; skew-y: -1.39999998; }
        frame 25 { x: 51; y: 32.5; skew-x: -1.39999998; skew-y: -3.20000005; scale-y: 0.800999999; }
        frame 26 { x: 49.4000015; y: 32.5999985; skew-x: -2.4000001; skew-y: -4.9000001; scale-y: -10000; }
        frame 27 { x: 48; y: 32.7999992; skew-x: -3.5; skew-y: -6.69999981; }
        frame 28 { x: 46.5; y: 33.0999985; skew-x: -4.69999981; skew-y: -8.60000038; scale-y: 0.801999986; }
        frame 29 { x: 45.5; y: 33.7999992; skew-x: -8.69999981; skew-y: -8.69999981; scale-y: 0.800000012; }
        frame 30 { x: 55; y: 31.2000008; skew-x: 7.80000019; skew-y: 5; scale-x: 0.800999999; scale-y: 0.799000025; }
        frame 31 { x: 65.3000031; y: 29.6000004; skew-x: 24.7999992; skew-y: 19.1000004; scale-x: 0.802999973; scale-y: -10000; }
        frame 32 { x: 66.5; y: 29.8999996; skew-x: 27.7999992; skew-y: 22.7999992; scale-x: 0.800999999; scale-y: 0.797999978; }
        frame 33 { x: 67.5; y: 30.2999992; skew-x: 31.2000008; skew-y: 26.5; scale-x: -10000; scale-y: 0.799000025; }
        frame 34 { x: 64.0999985; y: 30.3999996; skew-x: 23.2999992; skew-y: 19.7999992; scale-x: 0.800000012; scale-y: 0.797999978; }
        frame 35 { x: 60.7999992; y: 30.7999992; skew-x: 15.5; skew-y: 13.1000004; scale-x: -10000; scale-y: 0.799000025; }
        frame 36 { x: 57.7999992; y: 31.3999996; skew-x: 7.80000019; skew-y: 6.5; scale-y: -10000; }
        frame 37 { x: 54.7000008; y: 32.0999985; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 39 { y: 31.8999996; scale-y: 0.782000005; }
        frame 40 { x: 55; y: 33.0999985; scale-y: 0.763999999; }
        frame 41 { x: 55.2000008; y: 34.5; skew-y: 0.200000003; scale-y: 0.745999992; }
        frame 42 { x: 55.0999985; y: 28.3999996; skew-y: 0; scale-y: 0.759000003; }
        frame 43 { x: 55; y: 22.2999992; skew-y: -10000; scale-y: 0.773000002; }
        frame 44 { x: 54.7999992; y: 16.2999992; scale-y: 0.786000013; }
        frame 45 { x: 54.7000008; y: 10.1000004; scale-y: 0.800000012; }
        frame 46 { x: -10000; y: -6.5; scale-y: -10000; }
        frame 47 { y: -22.1000004; }
        frame 48 { y: -37.7000008; }
        frame 49 { x: 54.9000015; y: -40.2999992; skew-x: 0.5; skew-y: 0.800000012; scale-y: 0.828000009; }
        frame 50 { x: 55.0999985; y: -43; skew-x: 1.10000002; skew-y: 1.89999998; scale-y: 0.855000019; }
        frame 51 { x: 54.9000015; y: -40.2999992; skew-x: 0.5; skew-y: 0.800000012; scale-y: 0.828000009; }
        frame 52 { x: 54.7000008; y: -37.7000008; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { x: 55.5; y: -39; skew-x: 3; skew-y: 3; scale-y: 0.806999981; }
        frame 55 { x: 56.5; y: -40.2999992; skew-x: 6.30000019; skew-y: 6.30000019; scale-y: 0.81400001; }
        frame 56 { x: 56.0999985; y: -40.5; skew-x: 5; skew-y: 5; scale-x: 0.799000025; scale-y: 0.822000027; }
        frame 57 { x: 55.7999992; y: -40.5999985; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: 0.800000012; scale-y: 0.828999996; }
        frame 58 { x: 55.4000015; y: -40.7000008; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: 0.836000025; }
        frame 59 { x: 55; y: -40.7999992; skew-x: 1.29999995; skew-y: 1.29999995; scale-y: 0.843999982; }
        frame 60 { x: 54.7000008; y: -41; skew-x: 0; skew-y: 0; scale-y: 0.851000011; }
        frame 61 { x: 54; y: -39.7000008; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.843999982; }
        frame 62 { x: 53.2999992; y: -38.4000015; skew-x: -3.70000005; skew-y: -3.70000005; scale-y: 0.837000012; }
        frame 63 { x: 53.5999985; y: -38.2999992; skew-x: -2.9000001; skew-y: -2.9000001; scale-y: 0.828999996; }
        frame 64 { x: 53.9000015; y: -10000; skew-x: -2.20000005; skew-y: -2.20000005; scale-y: 0.822000027; }
        frame 65 { x: 54.0999985; skew-x: -1.39999998; skew-y: -1.39999998; scale-y: 0.814999998; }
        frame 66 { x: 54.4000015; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.806999981; }
        frame 67 { x: 54.7000008; y: -38.2000008; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 68 { x: -10000; y: -37.7000008; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 69 { x: 50.5999985; y: -38.0999985; skew-x: -1; skew-y: -1.89999998; }
        frame 70 { x: 46.5; y: -38.4000015; skew-x: -2.20000005; skew-y: -4.19999981; scale-y: 0.800999999; }
        frame 71 { x: 42.5; y: -38.5999985; skew-x: -3.4000001; skew-y: -6.4000001; scale-y: -10000; }
        frame 72 { x: 38.5; y: -38.9000015; skew-x: -4.69999981; skew-y: -8.60000038; scale-y: 0.801999986; }
        frame 73 { x: 48.5999985; y: -38.5999985; skew-x: -8.69999981; skew-y: -8.69999981; scale-y: 0.800000012; }
        frame 74 { x: 71.4000015; y: -40.7999992; skew-x: 7.80000019; skew-y: 5; scale-x: 0.800999999; scale-y: 0.799000025; }
        frame 75 { x: 95; y: -42; skew-x: 24.7999992; skew-y: 19.1000004; scale-x: 0.802999973; scale-y: -10000; }
        frame 76 { x: 89.4000015; y: -41.4000015; skew-x: 27.7999992; skew-y: 22.7999992; scale-x: 0.800999999; scale-y: 0.797999978; }
        frame 77 { x: 83.8000031; y: -40.9000015; skew-x: 31.2000008; skew-y: 26.5; scale-x: -10000; scale-y: 0.799000025; }
        frame 78 { x: 76.3000031; y: -40.5; skew-x: 23.2999992; skew-y: 19.7999992; scale-x: 0.800000012; scale-y: 0.797999978; }
        frame 79 { x: 68.9000015; y: -39.9000015; skew-x: 15.5; skew-y: 13.1000004; scale-x: -10000; scale-y: 0.799000025; }
        frame 80 { x: 61.7999992; y: -39; skew-x: 7.80000019; skew-y: 6.5; scale-y: -10000; }
        frame 81 { x: 54.7000008; y: -37.9000015; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 82 { x: -10000; y: -38.2000008; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 83 { y: -38.5; scale-y: 0.816999972; }
        frame 84 { y: -38.7000008; scale-y: 0.834999979; }
        frame 85 { y: -14.1999998; scale-y: 0.816999972; }
        frame 86 { y: 10.1000004; scale-y: 0.800000012; }
        frame 87 { x: 54.7999992; y: 16.2999992; scale-y: 0.786000013; }
        frame 88 { x: 55; y: 22.2999992; scale-y: 0.773000002; }
        frame 89 { y: 28.3999996; scale-y: 0.759000003; }
        frame 90 { x: 55.2000008; y: 34.5; skew-y: 0.200000003; scale-y: 0.745999992; }
        frame 91 { x: 55.0999985; y: 33.9000015; skew-y: 0; scale-y: 0.759000003; }
        frame 92 { x: 55; y: 33.2999992; skew-y: -10000; scale-y: 0.773000002; }
        frame 93 { x: 54.7999992; y: 32.7999992; scale-y: 0.786000013; }
        frame 94 { x: 54.7000008; y: 32.0999985; scale-y: 0.800000012; }
    }
    Track {
        source-name: "body_overlay";
        frame-count: 95;
        frame 0 { x: 17.3999996; y: 64.5; scale-x: 0.800000012; scale-y: 0.643000007; image: IMAGE_REANIM_CACTUS_BODY_OVERLAY; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 39 { x: 17.2000008; scale-x: 0.818000019; }
        frame 40 { x: 16.8999996; scale-x: 0.834999979; }
        frame 41 { x: 16.6000004; scale-x: 0.852999985; }
        frame 42 { x: 16.7999992; y: 64.4000015; scale-x: 0.838999987; }
        frame 43 { x: 17; y: 64.3000031; scale-x: 0.824000001; }
        frame 44 { x: 17.2000008; y: -10000; scale-x: 0.810000002; }
        frame 45 { x: 17.3999996; y: 64.1999969; scale-x: 0.796000004; image: IMAGE_REANIM_CACTUS_BODY_OVERLAY2; }
        frame 46 { x: 17.8999996; y: 58.7000008; scale-x: -10000; scale-y: 1.06700003; image: none; }
        frame 47 { x: -10000; y: -10000; scale-y: -10000; }
        frame 74 { x: 20.5; y: 58.5999985; skew-y: 10.3000002; scale-y: 1.102; }
        frame 75 { x: 23; y: 58.7000008; skew-y: 20.5; scale-y: 1.13900006; }
        frame 76 { x: 21.8999996; y: 58.5999985; skew-y: 16.2999992; scale-y: 1.11399996; }
        frame 77 { x: 20.8999996; y: 58.7000008; skew-y: 12.3999996; scale-y: 1.09200001; }
        frame 78 { x: 20.1000004; y: -10000; skew-y: 9.30000019; scale-y: 1.08500004; }
        frame 79 { x: 19.2999992; skew-y: 6; scale-y: 1.079; }
        frame 80 { x: 18.5; y: 58.5999985; skew-y: 3; scale-y: 1.07299995; }
        frame 81 { x: 17.8999996; y: 58.7000008; skew-y: 0; scale-y: 1.06700003; }
        frame 82 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 87 { x: 17.3999996; y: 64.5; scale-x: 0.800000012; scale-y: 0.643000007; image: IMAGE_REANIM_CACTUS_BODY_OVERLAY; }
        frame 88 { x: 17.2000008; y: -10000; scale-x: 0.816999972; scale-y: -10000; image: none; }
        frame 89 { x: 16.8999996; scale-x: 0.834999979; }
        frame 90 { x: 16.7000008; scale-x: 0.851999998; }
        frame 91 { x: 16.8999996; scale-x: 0.838999987; }
        frame 92 { x: 17; scale-x: 0.825999975; }
        frame 93 { x: 17.2999992; scale-x: 0.813000023; }
        frame 94 { x: 17.3999996; scale-x: 0.800000012; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 9.5; y: 7.5; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CACTUS_BODY1; }
        frame 6 { x: -10000; y: 7; scale-x: -10000; scale-y: 0.806999981; cel: -10000; image: none; }
        frame 7 { y: 6.4000001; scale-y: 0.814999998; }
        frame 8 { y: 5.9000001; scale-y: 0.822000027; }
        frame 9 { y: 5.30000019; scale-y: 0.828999996; }
        frame 10 { y: 4.80000019; scale-y: 0.837000012; }
        frame 11 { y: 4.19999981; scale-y: 0.843999982; }
        frame 12 { y: 3.70000005; scale-y: 0.851000011; }
        frame 13 { y: 4.30000019; scale-y: 0.843999982; }
        frame 14 { y: 4.80000019; scale-y: 0.837000012; }
        frame 15 { y: 5.30000019; scale-y: 0.828999996; }
        frame 16 { y: 5.9000001; scale-y: 0.822000027; }
        frame 17 { y: 6.5; scale-y: 0.814999998; }
        frame 18 { y: 7; scale-y: 0.806999981; }
        frame 19 { y: 7.5; scale-y: 0.800000012; }
        frame 20 { y: -10000; scale-y: -10000; }
        frame 21 { x: 8.39999962; skew-y: -1; scale-y: 0.800999999; }
        frame 22 { x: 7.0999999; y: 7.4000001; skew-y: -2.20000005; scale-y: 0.802999973; }
        frame 23 { x: 5.80000019; y: 7.5; skew-y: -3.5; scale-y: 0.80400002; }
        frame 24 { x: 4.5; y: 7.4000001; skew-y: -4.69999981; scale-y: 0.805999994; }
        frame 25 { x: 3.29999995; y: -10000; skew-y: -6; scale-y: 0.806999981; }
        frame 26 { x: 1.89999998; y: 7.30000019; skew-y: -7.19999981; scale-y: 0.809000015; }
        frame 27 { x: 0.699999988; y: 7.5; skew-y: -8.5; scale-y: 0.810000002; }
        frame 28 { x: -0.5; y: -10000; skew-y: -9.89999962; scale-y: 0.811999977; }
        frame 29 { x: 9.80000019; y: 6.5; skew-y: 0.300000012; scale-y: 0.827000022; }
        frame 30 { x: 20.5; y: -10000; skew-y: 10.5; scale-y: 0.841000021; }
        frame 31 { x: 31.2000008; y: 7.5; skew-y: 20.8999996; scale-y: 0.856000006; }
        frame 32 { x: 27.5; y: 7.19999981; skew-y: 17.2999992; scale-y: 0.846000016; }
        frame 33 { x: 23.8999996; y: 7; skew-y: 13.8000002; scale-y: 0.837000012; }
        frame 34 { x: 20.2000008; y: -10000; skew-y: 10.3000002; scale-y: 0.828000009; }
        frame 35 { x: 16.6000004; y: 7.0999999; skew-y: 6.80000019; scale-y: 0.818000019; }
        frame 36 { x: 13; y: 7.19999981; skew-y: 3.29999995; scale-y: 0.809000015; }
        frame 37 { x: 9.5; y: 7.5; skew-y: 0; scale-y: 0.800000012; }
        frame 38 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 39 { x: 9.10000038; y: 9.30000019; scale-x: 0.815999985; scale-y: 0.773000002; }
        frame 40 { x: 8.60000038; y: 11; scale-x: 0.832000017; scale-y: 0.745999992; }
        frame 41 { x: 8.30000019; y: 12.6999998; skew-y: 0.200000003; scale-x: 0.84799999; scale-y: 0.717999995; }
        frame 42 { x: 8.60000038; y: 5.69999981; skew-y: 0; scale-x: 0.836000025; scale-y: 0.742999971; }
        frame 43 { x: 8.89999962; y: -1.29999995; skew-y: -10000; scale-x: 0.824000001; scale-y: 0.76700002; }
        frame 44 { x: 9.30000019; y: -8.39999962; scale-x: 0.811999977; scale-y: 0.791000009; }
        frame 45 { x: 9.5; y: -15.5; scale-x: 0.800000012; scale-y: 0.815999985; }
        frame 46 { x: -10000; y: -31.1000004; scale-x: -10000; scale-y: 0.81099999; }
        frame 47 { y: -46.7000008; scale-y: 0.805000007; }
        frame 48 { y: -62.2999992; scale-y: 0.800000012; }
        frame 49 { y: -65.4000015; scale-y: 0.828000009; }
        frame 50 { x: 9.39999962; y: -68.4000015; skew-y: 0.200000003; scale-y: 0.856000006; }
        frame 51 { x: -10000; y: -65.3000031; skew-y: 0; scale-y: 0.828000009; }
        frame 52 { x: 9.5; y: -62.2999992; skew-y: -10000; scale-y: 0.800000012; }
        frame 53 { x: -10000; y: -10000; scale-y: -10000; }
        frame 54 { y: -63.2999992; }
        frame 55 { y: -64.3000031; }
        frame 56 { y: -64.9000015; scale-y: 0.810000002; }
        frame 57 { y: -65.5; scale-y: 0.82099998; }
        frame 58 { y: -66.0999985; scale-y: 0.83099997; }
        frame 59 { y: -66.5999985; scale-y: 0.841000021; }
        frame 60 { y: -67.1999969; scale-y: 0.851000011; }
        frame 61 { y: -66.1999969; scale-y: -10000; }
        frame 62 { y: -65.0999985; }
        frame 63 { y: -64.5999985; scale-y: 0.841000021; }
        frame 64 { y: -64.1999969; scale-y: 0.83099997; }
        frame 65 { y: -63.7999992; scale-y: 0.82099998; }
        frame 66 { y: -63.2999992; scale-y: 0.810000002; }
        frame 67 { y: -62.7999992; scale-y: 0.800000012; }
        frame 68 { y: -62.2999992; scale-y: -10000; }
        frame 69 { x: 4.5; y: -62.7999992; skew-y: -2.20000005; scale-y: 0.802999973; }
        frame 70 { x: -0.600000024; y: -63.2999992; skew-y: -4.69999981; scale-y: 0.805999994; }
        frame 71 { x: -5.69999981; y: -63.5999985; skew-y: -7.19999981; scale-y: 0.809000015; }
        frame 72 { x: -11; y: -63.9000015; skew-y: -9.89999962; scale-y: 0.811999977; }
        frame 73 { x: 11.1999998; y: -65; skew-y: 0.300000012; scale-y: 0.827000022; }
        frame 74 { x: 35.9000015; y: -65.0999985; skew-y: 10.5; scale-y: 0.841000021; }
        frame 75 { x: 60.7999992; y: -64.1999969; skew-y: 20.8999996; scale-y: 0.856000006; }
        frame 76 { x: 50; y: -64.0999985; skew-y: 17.2999992; scale-y: 0.846000016; }
        frame 77 { x: 39.4000015; y: -64; skew-y: 13.8000002; scale-y: 0.837000012; }
        frame 78 { x: 31.8999996; y: -63.9000015; skew-y: 10.3000002; scale-y: 0.827000022; }
        frame 79 { x: 24.3999996; y: -63.4000015; skew-y: 6.80000019; scale-y: 0.818000019; }
        frame 80 { x: 16.8999996; y: -63; skew-y: 3.29999995; scale-y: 0.809000015; }
        frame 81 { x: 9.5; y: -62.5; skew-y: 0; scale-y: 0.800000012; }
        frame 82 { x: -10000; y: -62.7999992; skew-y: -10000; scale-y: -10000; }
        frame 83 { y: -63.5999985; scale-y: 0.816999972; }
        frame 84 { y: -64.4000015; scale-y: 0.834999979; }
        frame 85 { y: -39.9000015; scale-y: 0.824999988; }
        frame 86 { y: -15.5; scale-y: 0.815999985; }
        frame 87 { x: 9.19999981; y: -8.39999962; scale-x: 0.811999977; scale-y: 0.791000009; }
        frame 88 { x: 8.80000019; y: -1.29999995; scale-x: 0.824000001; scale-y: 0.76700002; }
        frame 89 { x: 8.39999962; y: 5.5999999; scale-x: 0.836000025; scale-y: 0.742999971; }
        frame 90 { x: 8.30000019; y: 12.6999998; skew-y: 0.200000003; scale-x: 0.84799999; scale-y: 0.717999995; }
        frame 91 { x: 8.60000038; y: 11.3999996; skew-y: 0; scale-x: 0.836000025; scale-y: 0.739000022; }
        frame 92 { x: 8.89999962; y: 10.1000004; skew-y: -10000; scale-x: 0.824000001; scale-y: 0.759000003; }
        frame 93 { x: 9.30000019; y: 8.80000019; scale-x: 0.811999977; scale-y: 0.779999971; }
        frame 94 { x: 9.5; y: 7.5; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cactus_arm1_2";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 2.70000005; y: 41.2999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CACTUS_ARM1_2; }
        frame 6 { x: -10000; y: 41.7999992; skew-x: -1.70000005; scale-x: 0.800999999; scale-y: 0.806999981; cel: -10000; image: none; }
        frame 7 { y: 42.0999985; skew-x: -3.79999995; scale-x: 0.801999986; scale-y: 0.814999998; }
        frame 8 { x: 2.5999999; y: 41.5999985; skew-x: -2.9000001; scale-x: 0.800999999; scale-y: 0.822000027; }
        frame 9 { x: 2.70000005; y: 41; skew-x: -2.20000005; scale-x: -10000; scale-y: 0.828999996; }
        frame 10 { x: -10000; y: 40.5; skew-x: -1.39999998; scale-y: 0.837000012; }
        frame 11 { y: 40; skew-x: -0.699999988; scale-x: 0.800000012; scale-y: 0.843999982; }
        frame 12 { y: 39.5999985; skew-x: 0; scale-x: -10000; scale-y: 0.851000011; }
        frame 13 { x: 2.5999999; y: 38.7000008; skew-x: 2.79999995; scale-x: 0.801999986; scale-y: 0.843999982; }
        frame 14 { x: 2.70000005; y: 37.5999985; skew-x: 5.9000001; scale-x: 0.80400002; scale-y: 0.837000012; }
        frame 15 { x: -10000; y: 38.2999992; skew-x: 4.5; scale-x: 0.802999973; scale-y: 0.828999996; }
        frame 16 { y: 39; skew-x: 3.5; scale-x: 0.801999986; scale-y: 0.822000027; }
        frame 17 { x: 2.5999999; y: 39.7999992; skew-x: 2.29999995; scale-x: -10000; scale-y: 0.814999998; }
        frame 18 { x: 2.70000005; y: 40.5999985; skew-x: 1; scale-x: 0.800999999; scale-y: 0.806999981; }
        frame 19 { x: -10000; y: 41.2999992; skew-x: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 20 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 2.29999995; skew-y: -0.200000003; }
        frame 22 { x: 2; y: 41.2000008; skew-y: -0.699999988; }
        frame 23 { x: 1.5; y: -10000; skew-y: -1.20000005; scale-y: 0.800999999; }
        frame 24 { x: 1.10000002; y: 41.2999992; skew-y: -1.70000005; scale-y: -10000; }
        frame 25 { x: 0.699999988; y: -10000; skew-y: -2.20000005; }
        frame 26 { x: 0.200000003; y: 41.2000008; skew-y: -2.70000005; }
        frame 27 { x: -0; y: 41.2999992; skew-y: -3.20000005; }
        frame 28 { x: -0.400000006; y: -10000; skew-y: -3.79999995; scale-y: 0.801999986; }
        frame 29 { x: 3.9000001; skew-y: 0; scale-y: 0.800000012; }
        frame 30 { x: 9.80000019; y: 41.0999985; skew-x: 0.5; skew-y: 0.5; scale-x: 0.671000004; scale-y: -10000; }
        frame 31 { x: 15.6999998; y: 40.9000015; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.541999996; }
        frame 32 { x: 13.6000004; y: -10000; skew-x: 1; skew-y: 1; scale-x: 0.584999979; }
        frame 33 { x: 11.3999996; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.628000021; }
        frame 34 { x: 9.19999981; y: 41; skew-x: 0.5; skew-y: 0.5; scale-x: 0.671000004; }
        frame 35 { x: 7; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.713999987; }
        frame 36 { x: 4.80000019; y: 41.0999985; skew-x: 0; skew-y: 0; scale-x: 0.757000029; }
        frame 37 { x: 2.70000005; y: 41.2999992; skew-x: -10000; skew-y: -10000; scale-x: 0.800000012; }
        frame 38 { x: -10000; y: -10000; scale-x: -10000; }
        frame 39 { y: 40.9000015; skew-x: 0.800000012; scale-y: 0.782000005; }
        frame 40 { x: 2.5; y: 41.5; skew-x: 1.79999995; scale-y: 0.763999999; }
        frame 41 { x: 2.4000001; y: 42; skew-x: 2.9000001; skew-y: 0.200000003; scale-x: 0.800999999; scale-y: 0.745999992; }
        frame 42 { x: 2.5; y: 36.4000015; skew-x: 2; skew-y: 0; scale-x: -10000; scale-y: 0.759000003; }
        frame 43 { x: -10000; y: 30.7000008; skew-x: 1.29999995; skew-y: -10000; scale-x: 0.800000012; scale-y: 0.773000002; }
        frame 44 { x: 2.5999999; y: 25.1000004; skew-x: 0.600000024; scale-x: -10000; scale-y: 0.786000013; }
        frame 45 { x: 2.70000005; y: 19.2999992; skew-x: 0; scale-y: 0.800000012; }
        frame 46 { x: -10000; y: 2.5999999; skew-x: 4.0999999; scale-x: 0.801999986; scale-y: -10000; }
        frame 47 { y: -12.8999996; skew-x: 2; scale-x: 0.800999999; }
        frame 48 { y: -28.6000004; skew-x: 0; scale-x: 0.800000012; }
        frame 49 { x: 3; y: -30.3999996; skew-x: -10000; skew-y: 0.300000012; scale-x: -10000; scale-y: 0.828000009; }
        frame 50 { x: 3.4000001; y: -32.0999985; skew-y: 0.899999976; scale-y: 0.855000019; }
        frame 51 { x: 3; y: -30.2999992; skew-y: 0.300000012; scale-y: 0.828000009; }
        frame 52 { x: 2.70000005; y: -28.6000004; skew-y: 0; scale-y: 0.800000012; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { y: -29.1000004; skew-x: -1.70000005; scale-x: 0.800999999; scale-y: 0.806999981; }
        frame 55 { y: -29.7000008; skew-x: -3.79999995; scale-x: 0.801999986; scale-y: 0.814999998; }
        frame 56 { x: 2.5999999; y: -30; skew-x: -2.9000001; scale-x: 0.800999999; scale-y: 0.822000027; }
        frame 57 { x: 2.70000005; y: -30.3999996; skew-x: -2.20000005; scale-x: -10000; scale-y: 0.828999996; }
        frame 58 { x: -10000; y: -30.7000008; skew-x: -1.39999998; scale-y: 0.837000012; }
        frame 59 { y: -31.1000004; skew-x: -0.699999988; scale-x: 0.800000012; scale-y: 0.843999982; }
        frame 60 { y: -31.2999992; skew-x: 0; scale-x: -10000; scale-y: 0.851000011; }
        frame 61 { x: 2.5999999; y: -31.2000008; skew-x: 2.79999995; scale-x: 0.801999986; scale-y: 0.843999982; }
        frame 62 { x: 2.70000005; y: -10000; skew-x: 5.9000001; scale-x: 0.80400002; scale-y: 0.837000012; }
        frame 63 { x: -10000; y: -30.7000008; skew-x: 4.5; scale-x: 0.802999973; scale-y: 0.828999996; }
        frame 64 { y: -30.3999996; skew-x: 3.5; scale-x: 0.801999986; scale-y: 0.822000027; }
        frame 65 { x: 2.5999999; y: -29.8999996; skew-x: 2.29999995; scale-x: -10000; scale-y: 0.814999998; }
        frame 66 { x: 2.70000005; y: -29.3999996; skew-x: 1; scale-x: 0.800999999; scale-y: 0.806999981; }
        frame 67 { x: -10000; y: -29.1000004; skew-x: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 68 { y: -28.6000004; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: -0; y: -29; skew-y: -0.699999988; }
        frame 70 { x: -2.79999995; y: -29.3999996; skew-y: -1.70000005; scale-y: 0.800999999; }
        frame 71 { x: -5.69999981; y: -29.7999992; skew-y: -2.70000005; scale-y: -10000; }
        frame 72 { x: -8.5; y: -30.2000008; skew-y: -3.79999995; scale-y: 0.801999986; }
        frame 73 { x: 3.9000001; y: -10000; skew-y: 0; scale-y: 0.800000012; }
        frame 74 { x: 24.6000004; y: -30.3999996; skew-x: 0.5; skew-y: 0.5; scale-x: 0.671000004; scale-y: -10000; }
        frame 75 { x: 45.2999992; y: -30.7000008; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.541999996; }
        frame 76 { x: 34.7999992; y: -30.3999996; skew-x: 1; skew-y: 1; scale-x: 0.584999979; }
        frame 77 { x: 24.2999992; y: -30.2000008; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.628000021; }
        frame 78 { x: 18.8999996; y: -29.7999992; skew-x: 0.5; skew-y: 0.5; scale-x: 0.671000004; }
        frame 79 { x: 13.5; y: -29.5; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.713999987; }
        frame 80 { x: 8.19999981; y: -29.1000004; skew-x: 0; skew-y: 0; scale-x: 0.757000029; }
        frame 81 { x: 2.70000005; y: -28.7999992; skew-x: -10000; skew-y: -10000; scale-x: 0.800000012; }
        frame 82 { x: -10000; y: -29.1000004; scale-x: -10000; }
        frame 83 { y: -10000; scale-y: 0.816999972; }
        frame 84 { y: -29.2000008; scale-y: 0.834999979; }
        frame 85 { y: -4.9000001; scale-y: 0.816999972; }
        frame 86 { y: 19.2999992; scale-y: 0.800000012; }
        frame 87 { x: 2.5999999; y: 25; skew-x: 0.600000024; scale-y: 0.786000013; }
        frame 88 { x: 2.5; y: 30.7000008; skew-x: 1.29999995; scale-y: 0.773000002; }
        frame 89 { x: -10000; y: 36.2999992; skew-x: 2; scale-x: 0.800999999; scale-y: 0.759000003; }
        frame 90 { x: 2.4000001; y: 42; skew-x: 2.9000001; skew-y: 0.200000003; scale-x: -10000; scale-y: 0.745999992; }
        frame 91 { x: 2.5; y: 41.9000015; skew-x: 2; skew-y: 0; scale-y: 0.759000003; }
        frame 92 { x: -10000; y: 41.7000008; skew-x: 1.29999995; skew-y: -10000; scale-x: 0.800000012; scale-y: 0.773000002; }
        frame 93 { x: 2.5999999; y: 41.5; skew-x: 0.600000024; scale-x: -10000; scale-y: 0.786000013; }
        frame 94 { x: 2.70000005; y: 41.2999992; skew-x: 0; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cactus_arm1_1";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -10.1000004; y: 17.2999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CACTUS_ARM1_1; }
        frame 6 { x: -11.1000004; y: 18.1000004; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: -10000; scale-y: 0.806999981; cel: -10000; image: none; }
        frame 7 { x: -12.1000004; y: 18.8999996; skew-x: -5; skew-y: -5; scale-y: 0.81400001; }
        frame 8 { x: -11.6999998; y: 17.8999996; skew-x: -3.9000001; skew-y: -3.9000001; scale-y: 0.822000027; }
        frame 9 { x: -11.3000002; y: 17; skew-x: -2.9000001; skew-y: -2.9000001; scale-y: 0.828999996; }
        frame 10 { x: -10.8999996; y: 16; skew-x: -1.89999998; skew-y: -1.89999998; scale-y: 0.837000012; }
        frame 11 { x: -10.5; y: 15; skew-x: -0.899999976; skew-y: -0.899999976; scale-y: 0.843999982; }
        frame 12 { x: -10.1000004; y: 14.1000004; skew-x: 0; skew-y: 0; scale-y: 0.851000011; }
        frame 13 { x: -8.39999962; y: 12.8999996; skew-x: 2.29999995; skew-y: 2.29999995; scale-y: 0.843999982; }
        frame 14 { x: -6.80000019; y: 11.6999998; skew-x: 4.5999999; skew-y: 4.5999999; scale-y: 0.837000012; }
        frame 15 { x: -7.5999999; y: 12.8999996; skew-x: 3.5; skew-y: 3.5; scale-y: 0.828999996; }
        frame 16 { x: -8.10000038; y: 13.8999996; skew-x: 2.79999995; skew-y: 2.79999995; scale-y: 0.822000027; }
        frame 17 { x: -8.80000019; y: 15; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 0.814999998; }
        frame 18 { x: -9.5; y: 16.2000008; skew-x: 0.800000012; skew-y: 0.800000012; scale-y: 0.806999981; }
        frame 19 { x: -10.1000004; y: 17.2999992; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: -8.39999962; y: 16.7000008; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 22 { x: -6.5999999; y: 16.2000008; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 23 { x: -8.10000038; y: 16.3999996; skew-x: 3; skew-y: 2.5; }
        frame 24 { x: -9.39999962; y: 16.5; skew-x: 2.5; skew-y: 1.29999995; }
        frame 25 { x: -10.8000002; y: 16.7000008; skew-x: 1.79999995; skew-y: 0; scale-y: 0.800999999; }
        frame 26 { x: -12.1000004; y: 16.8999996; skew-x: 1.29999995; skew-y: -1.20000005; scale-y: -10000; }
        frame 27 { x: -13.5; y: 17.2000008; skew-x: 0.5; skew-y: -2.4000001; }
        frame 28 { x: -14.8000002; y: 17.2999992; skew-x: 0; skew-y: -3.79999995; scale-y: 0.801999986; }
        frame 29 { x: -10000; y: 20.7999992; skew-x: -11; skew-y: -11; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 30 { x: 1.20000005; y: 16.6000004; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 18.2999992; y: 14.5; skew-x: 23.1000004; skew-y: 23.1000004; }
        frame 32 { x: 16.2999992; y: -10000; skew-x: 21.7999992; skew-y: 21.7999992; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 33 { x: 14.3999996; y: 14.6000004; skew-x: 20.6000004; skew-y: 20.6000004; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 8.10000038; y: 15.1000004; skew-x: 15.3000002; skew-y: 15.3000002; }
        frame 35 { x: 1.89999998; y: 15.6000004; skew-x: 10.3000002; skew-y: 10.3000002; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 36 { x: -4; y: 16.3999996; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: -10.1000004; y: 17.2999992; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { y: 17; }
        frame 40 { x: -10.3000002; y: 17.7000008; }
        frame 41 { x: -10.5; y: 18.2999992; }
        frame 42 { x: -10.3999996; y: 12.5; }
        frame 43 { x: -10.3000002; y: 6.80000019; }
        frame 44 { x: -10.1999998; y: 1; }
        frame 45 { x: -10.1000004; y: -4.5999999; }
        frame 46 { x: -9.89999962; y: -21; }
        frame 47 { x: -10; y: -36.7999992; }
        frame 48 { x: -10.1000004; y: -52.5999985; }
        frame 49 { x: -9; y: -56; skew-x: 1.29999995; skew-y: 1.5; scale-y: 0.828000009; }
        frame 50 { x: -7.69999981; y: -59.5999985; skew-x: 2.70000005; skew-y: 3.29999995; scale-x: 0.799000025; scale-y: 0.855000019; }
        frame 51 { x: -8.89999962; y: -56; skew-x: 1.29999995; skew-y: 1.5; scale-x: 0.800000012; scale-y: 0.828000009; }
        frame 52 { x: -10.1000004; y: -52.5999985; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.800000012; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { x: -11.1000004; y: -52.7999992; skew-x: -2.4000001; skew-y: -2.4000001; scale-y: 0.806999981; }
        frame 55 { x: -12.1000004; y: -53; skew-x: -5; skew-y: -5; scale-y: 0.81400001; }
        frame 56 { x: -11.6999998; y: -53.7999992; skew-x: -3.9000001; skew-y: -3.9000001; scale-y: 0.822000027; }
        frame 57 { x: -11.3000002; y: -54.5; skew-x: -2.9000001; skew-y: -2.9000001; scale-y: 0.828999996; }
        frame 58 { x: -10.8999996; y: -55.2999992; skew-x: -1.89999998; skew-y: -1.89999998; scale-y: 0.837000012; }
        frame 59 { x: -10.5; y: -56.0999985; skew-x: -0.899999976; skew-y: -0.899999976; scale-y: 0.843999982; }
        frame 60 { x: -10.1000004; y: -56.7999992; skew-x: 0; skew-y: 0; scale-y: 0.851000011; }
        frame 61 { x: -8.39999962; y: -57; skew-x: 2.29999995; skew-y: 2.29999995; scale-y: 0.843999982; }
        frame 62 { x: -6.80000019; y: -57.0999985; skew-x: 4.5999999; skew-y: 4.5999999; scale-y: 0.837000012; }
        frame 63 { x: -7.5; y: -56.2999992; skew-x: 3.5; skew-y: 3.5; scale-y: 0.828999996; }
        frame 64 { x: -8.19999981; y: -55.5; skew-x: 2.79999995; skew-y: 2.79999995; scale-y: 0.822000027; }
        frame 65 { x: -8.89999962; y: -54.7000008; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 0.814999998; }
        frame 66 { x: -9.5; y: -53.7999992; skew-x: 0.800000012; skew-y: 0.800000012; scale-y: 0.806999981; }
        frame 67 { x: -10.1000004; y: -53.0999985; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 68 { x: -10000; y: -52.5999985; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 69 { x: -13.1999998; y: -53; skew-y: -0.699999988; }
        frame 70 { x: -16.3999996; y: -53.4000015; skew-y: -1.70000005; scale-y: 0.800999999; }
        frame 71 { x: -19.6000004; y: -53.7999992; skew-y: -2.70000005; scale-y: -10000; }
        frame 72 { x: -22.8999996; y: -54.2000008; skew-y: -3.79999995; scale-y: 0.801999986; }
        frame 73 { x: -14.8000002; y: -50.5999985; skew-x: -11; skew-y: -11; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 74 { x: 16; y: -54.9000015; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 47.9000015; y: -57.0999985; skew-x: 23.1000004; skew-y: 23.1000004; }
        frame 76 { x: 37.5; y: -56.7999992; skew-x: 21.7999992; skew-y: 21.7999992; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 77 { x: 27.2999992; y: -56.5; skew-x: 20.6000004; skew-y: 20.6000004; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 17.8999996; y: -55.7999992; skew-x: 15.3000002; skew-y: 15.3000002; }
        frame 79 { x: 8.39999962; y: -55.0999985; skew-x: 10.3000002; skew-y: 10.3000002; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 80 { x: -0.800000012; y: -53.9000015; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -10.1000004; y: -52.7999992; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 82 { x: -10000; y: -53.0999985; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 83 { y: -54.0999985; scale-y: 0.816999972; }
        frame 84 { y: -55.0999985; scale-y: 0.834999979; }
        frame 85 { y: -29.7999992; scale-y: 0.816999972; }
        frame 86 { y: -4.5999999; scale-y: 0.800000012; }
        frame 87 { x: -10.1999998; y: 1; scale-y: -10000; }
        frame 88 { x: -10.3000002; y: 6.80000019; }
        frame 89 { x: -10.3999996; y: 12.5; }
        frame 90 { x: -10.5; y: 18.2999992; }
        frame 91 { x: -10.3999996; y: 18; }
        frame 92 { x: -10.3000002; y: 17.7999992; }
        frame 93 { x: -10.1999998; y: 17.5; }
        frame 94 { x: -10.1000004; y: 17.2999992; }
    }
    Track {
        source-name: "Cactus_mouth";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 48.5; y: 25; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CACTUS_MOUTH; }
        frame 6 { x: -10000; y: 24.7999992; skew-x: 2.0999999; scale-x: 0.800999999; scale-y: 0.814999998; cel: -10000; image: none; }
        frame 7 { y: 24.5; skew-x: 4.4000001; scale-x: 0.801999986; scale-y: 0.828999996; }
        frame 8 { y: 24; skew-x: 3.5; scale-x: -10000; scale-y: 0.833999991; }
        frame 9 { y: 23.6000004; skew-x: 2.5; scale-x: 0.800999999; scale-y: 0.838; }
        frame 10 { y: 23.2000008; skew-x: 1.79999995; scale-x: -10000; scale-y: 0.842999995; }
        frame 11 { x: 48.4000015; y: 22.7000008; skew-x: 0.800000012; scale-x: 0.800000012; scale-y: 0.847000003; }
        frame 12 { x: 48.5; y: 22.3999996; skew-x: 0; scale-x: -10000; scale-y: 0.851000011; }
        frame 13 { x: -10000; y: 22.6000004; skew-x: -2.20000005; scale-x: 0.800999999; scale-y: 0.843999982; }
        frame 14 { x: 48.5999985; y: 22.7999992; skew-x: -4.9000001; scale-x: 0.802999973; scale-y: 0.837000012; }
        frame 15 { x: -10000; y: 23.2999992; skew-x: -3.70000005; scale-x: 0.801999986; scale-y: 0.828999996; }
        frame 16 { x: 48.5; y: 23.7999992; skew-x: -2.70000005; scale-x: -10000; scale-y: 0.822000027; }
        frame 17 { x: -10000; y: 24.2000008; skew-x: -1.70000005; scale-x: 0.800999999; scale-y: 0.814999998; }
        frame 18 { y: 24.6000004; skew-x: -0.699999988; scale-x: -10000; scale-y: 0.806999981; }
        frame 19 { y: 25; skew-x: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 20 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 47.5999985; scale-x: 1.12800002; }
        frame 22 { x: 46.9000015; scale-x: 1.45700002; }
        frame 23 { x: 46.7000008; scale-x: 1.33299994; }
        frame 24 { x: 45.2999992; skew-y: -0.699999988; scale-x: 1.227; }
        frame 25 { x: 43.7999992; y: 25; skew-y: -1.39999998; scale-x: 1.12; scale-y: 0.800999999; }
        frame 26 { x: 42.4000015; skew-y: -2.20000005; scale-x: 1.01300001; scale-y: -10000; }
        frame 27 { x: 40.9000015; y: -10000; skew-y: -2.9000001; scale-x: 0.907000005; }
        frame 28 { x: 39.5; skew-y: -3.79999995; scale-x: 0.800000012; scale-y: 0.801999986; }
        frame 29 { x: 46.9000015; y: 25.1000004; skew-y: -2.4000001; scale-x: 2.06500006; scale-y: 0.782000005; }
        frame 30 { x: 54.2000008; y: -10000; skew-y: -1.20000005; scale-x: 3.32999992; scale-y: 0.762000024; }
        frame 31 { x: 61.5; y: 25.2000008; skew-y: 0; scale-x: 4.59499979; scale-y: 0.742999971; }
        frame 32 { x: 59.5; y: -10000; skew-y: -10000; scale-x: 4.171; scale-y: 0.751999974; }
        frame 33 { x: 57.5; y: 25.1000004; scale-x: 3.74600005; scale-y: 0.762000024; }
        frame 34 { x: 55.2999992; y: -10000; scale-x: 3.00999999; scale-y: 0.771000028; }
        frame 35 { x: 53; scale-x: 2.273; scale-y: 0.781000018; }
        frame 36 { x: 50.7000008; scale-x: 1.53699994; scale-y: 0.790000021; }
        frame 37 { x: 48.5; y: 25; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 38 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 48.7000008; y: 26.5; scale-y: 0.773000002; }
        frame 41 { x: 49; y: 27.7999992; skew-y: 0.200000003; scale-y: 0.745999992; }
        frame 42 { x: 48.9000015; y: 21.5; skew-y: 0; scale-y: 0.759000003; }
        frame 43 { x: 48.7000008; y: 15.1999998; skew-y: -10000; scale-y: 0.773000002; }
        frame 44 { x: 48.5999985; y: 8.89999962; scale-y: 0.786000013; }
        frame 45 { x: 48.5; y: 2.5999999; scale-y: 0.800000012; }
        frame 46 { x: -10000; y: -12.8999996; scale-y: -10000; }
        frame 47 { y: -28.8999996; }
        frame 48 { y: -44.7999992; }
        frame 49 { x: 48.2000008; y: -47.0999985; skew-y: 0.300000012; scale-x: 1.07799995; scale-y: 0.828000009; }
        frame 50 { x: 48; y: -49.5; skew-y: 0.899999976; scale-x: 1.35599995; scale-y: 0.855000019; }
        frame 51 { x: 48.0999985; y: -47.2000008; skew-y: 0.300000012; scale-x: 1.07799995; scale-y: 0.828000009; }
        frame 52 { x: 48.5; y: -44.7999992; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 54 { y: -46.0999985; skew-x: 2.0999999; scale-x: 0.800999999; scale-y: 0.814999998; }
        frame 55 { y: -47.4000015; skew-x: 4.4000001; scale-x: 0.801999986; scale-y: 0.828999996; }
        frame 56 { y: -47.5999985; skew-x: 3.5; scale-x: -10000; scale-y: 0.833999991; }
        frame 57 { y: -47.7999992; skew-x: 2.5; scale-x: 0.800999999; scale-y: 0.838; }
        frame 58 { y: -48; skew-x: 1.79999995; scale-x: -10000; scale-y: 0.842999995; }
        frame 59 { x: 48.4000015; y: -48.2999992; skew-x: 0.800000012; scale-x: 0.800000012; scale-y: 0.847000003; }
        frame 60 { x: 48.5; y: -48.5999985; skew-x: 0; scale-x: -10000; scale-y: 0.851000011; }
        frame 61 { x: -10000; y: -47.4000015; skew-x: -2.20000005; scale-x: 0.800999999; scale-y: 0.843999982; }
        frame 62 { x: 48.5999985; y: -46; skew-x: -4.9000001; scale-x: 0.802999973; scale-y: 0.837000012; }
        frame 63 { x: -10000; y: -45.9000015; skew-x: -3.70000005; scale-x: 0.801999986; scale-y: 0.828999996; }
        frame 64 { x: 48.5; y: -45.7000008; skew-x: -2.70000005; scale-x: -10000; scale-y: 0.822000027; }
        frame 65 { x: -10000; y: -45.5; skew-x: -1.70000005; scale-x: 0.800999999; scale-y: 0.814999998; }
        frame 66 { y: -10000; skew-x: -0.699999988; scale-x: -10000; scale-y: 0.806999981; }
        frame 67 { y: -45.2999992; skew-x: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 68 { y: -44.7999992; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 44.0999985; y: -45.2000008; skew-y: -0.699999988; }
        frame 70 { x: 40; y: -45.5999985; skew-y: -1.70000005; scale-y: 0.800999999; }
        frame 71 { x: 35.5999985; y: -46; skew-y: -2.70000005; scale-y: -10000; }
        frame 72 { x: 31.3999996; y: -46.4000015; skew-y: -3.79999995; scale-y: 0.801999986; }
        frame 73 { x: 49.9000015; y: -10000; skew-y: -2.4000001; scale-x: 2.87299991; scale-y: 0.782000005; }
        frame 74 { x: 70.6999969; y: -46.2999992; skew-y: -1.20000005; scale-x: 3.73399997; scale-y: 0.762000024; }
        frame 75 { x: 91.1999969; y: -10000; skew-y: 0; scale-x: 4.59499979; scale-y: 0.742999971; }
        frame 76 { x: 80.8000031; y: -46.0999985; skew-y: -10000; scale-x: 4.171; scale-y: 0.751999974; }
        frame 77 { x: 70.3000031; y: -46; scale-x: 3.74600005; scale-y: 0.762000024; }
        frame 78 { x: 65; y: -45.7999992; scale-x: 3.00999999; scale-y: 0.771000028; }
        frame 79 { x: 59.5; y: -45.5; scale-x: 2.273; scale-y: 0.781000018; }
        frame 80 { x: 54; y: -45.2999992; scale-x: 1.53699994; scale-y: 0.790000021; }
        frame 81 { x: 48.5; y: -45; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 82 { x: -10000; y: -45.2999992; scale-x: -10000; scale-y: -10000; }
        frame 83 { y: -45.7999992; skew-x: 4.80000019; scale-x: 0.805999994; scale-y: 0.816999972; }
        frame 84 { y: -46.2999992; skew-x: 9.89999962; scale-x: 0.811999977; scale-y: 0.834999979; }
        frame 85 { y: -21.7999992; skew-x: 4.80000019; scale-x: 0.805999994; scale-y: 0.816999972; }
        frame 86 { y: 2.5999999; skew-x: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 87 { x: 48.5999985; y: 8.89999962; skew-x: -10000; scale-x: -10000; scale-y: 0.786000013; }
        frame 88 { x: 48.7000008; y: 15.3000002; scale-y: 0.773000002; }
        frame 89 { x: 48.9000015; y: 21.5; scale-y: 0.759000003; }
        frame 90 { x: 49; y: 27.7999992; skew-y: 0.200000003; scale-y: 0.745999992; }
        frame 91 { x: 48.9000015; y: 27.1000004; skew-y: 0; scale-y: 0.759000003; }
        frame 92 { x: 48.7000008; y: 26.3999996; skew-y: -10000; scale-y: 0.773000002; }
        frame 93 { x: 48.5999985; y: 25.7000008; scale-y: 0.786000013; }
        frame 94 { x: 48.5; y: 25; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cactus_lips";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 50.4000015; y: 19.5; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CACTUS_LIPS; }
        frame 6 { x: 50.7999992; y: 19.6000004; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: -10000; scale-y: 0.806999981; cel: -10000; image: none; }
        frame 7 { x: 51.2999992; y: 19.5; skew-x: 4.5999999; skew-y: 4.5999999; scale-y: 0.81400001; }
        frame 8 { x: 51.0999985; y: 18.7999992; skew-x: 3.5; skew-y: 3.5; scale-y: 0.822000027; }
        frame 9 { x: 50.9000015; y: 18.2999992; skew-x: 2.79999995; skew-y: 2.79999995; scale-y: 0.828999996; }
        frame 10 { x: 50.7999992; y: 17.6000004; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 0.837000012; }
        frame 11 { x: 50.5; y: 17.1000004; skew-x: 0.800000012; skew-y: 0.800000012; scale-y: 0.843999982; }
        frame 12 { x: 50.4000015; y: 16.5; skew-x: 0; skew-y: 0; scale-y: 0.851000011; }
        frame 13 { x: 49.9000015; y: 16.2000008; skew-x: -2.20000005; skew-y: -2.20000005; scale-y: 0.843999982; }
        frame 14 { x: 49.5; y: 15.8999996; skew-x: -4.4000001; skew-y: -4.4000001; scale-y: 0.837000012; }
        frame 15 { x: 49.5999985; y: 16.6000004; skew-x: -3.4000001; skew-y: -3.4000001; scale-y: 0.828999996; }
        frame 16 { x: 49.9000015; y: 17.2999992; skew-x: -2.5; skew-y: -2.5; scale-y: 0.822000027; }
        frame 17 { x: 50; y: 18; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.814999998; }
        frame 18 { x: 50.2000008; y: 18.7000008; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.806999981; }
        frame 19 { x: 50.4000015; y: 19.5; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 50.5; y: 19.3999996; scale-x: 0.786000013; scale-y: 0.805000007; }
        frame 22 { x: -10000; y: -10000; scale-x: 0.773000002; scale-y: 0.810000002; }
        frame 23 { x: 50.5999985; y: 19.2999992; scale-x: 0.759000003; scale-y: 0.814999998; }
        frame 24 { x: 48.5; y: 19.1000004; skew-y: -0.699999988; scale-x: 0.734000027; scale-y: 0.824000001; }
        frame 25 { x: 46.4000015; y: 19; skew-y: -1.39999998; scale-x: 0.708999991; scale-y: 0.833000004; }
        frame 26 { x: 44.2999992; y: 18.8999996; skew-y: -2.20000005; scale-x: 0.685000002; scale-y: 0.842999995; }
        frame 27 { x: 42.2999992; y: 18.7999992; skew-y: -2.9000001; scale-x: 0.660000026; scale-y: 0.851999998; }
        frame 28 { x: 40.0999985; y: 18.7000008; skew-y: -3.79999995; scale-x: 0.63499999; scale-y: 0.861000001; }
        frame 29 { x: 51.5; y: 19.5; skew-y: -2.4000001; scale-x: -10000; scale-y: 0.800999999; }
        frame 30 { x: 62.9000015; y: 20.2999992; skew-y: -1.20000005; scale-y: 0.74000001; }
        frame 31 { x: 74.1999969; y: 21.1000004; skew-y: 0; scale-y: 0.680000007; }
        frame 32 { x: 70.8000031; y: 20.7999992; skew-y: -10000; scale-x: 0.662999988; scale-y: 0.699999988; }
        frame 33 { x: 67.3000031; y: 20.6000004; scale-x: 0.689999998; scale-y: 0.720000029; }
        frame 34 { x: 63; y: 20.2999992; scale-x: 0.717999995; scale-y: 0.74000001; }
        frame 35 { x: 58.7999992; y: 20.1000004; scale-x: 0.745000005; scale-y: 0.75999999; }
        frame 36 { x: 54.5; y: 19.7999992; scale-x: 0.773000002; scale-y: 0.779999971; }
        frame 37 { x: 50.4000015; y: 19.5; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 38 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { y: 18.7000008; }
        frame 40 { x: 50.7000008; y: 20.7000008; scale-y: 0.773000002; }
        frame 41 { x: 51.0999985; y: 22.7000008; skew-y: 0.200000003; scale-y: 0.745999992; }
        frame 42 { x: 50.9000015; y: 16.3999996; skew-y: 0; scale-y: 0.759000003; }
        frame 43 { x: 50.7000008; y: 10.1000004; skew-y: -10000; scale-y: 0.773000002; }
        frame 44 { x: 50.5; y: 3.79999995; scale-y: 0.786000013; }
        frame 45 { x: 50.4000015; y: -2.4000001; scale-y: 0.800000012; }
        frame 46 { x: -10000; y: -19.7000008; scale-y: -10000; }
        frame 47 { y: -35.0999985; }
        frame 48 { y: -50.5999985; }
        frame 49 { x: 50.5; y: -53.9000015; skew-y: 0.300000012; scale-y: 0.828000009; }
        frame 50 { x: -10000; y: -57.2000008; skew-y: 0.899999976; scale-y: 0.855000019; }
        frame 51 { y: -53.9000015; skew-y: 0.300000012; scale-y: 0.828000009; }
        frame 52 { x: 50.4000015; y: -50.5999985; skew-y: 0; scale-y: 0.800000012; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { x: 50.7999992; y: -51.4000015; skew-x: 2.29999995; skew-y: 2.29999995; scale-y: 0.806999981; }
        frame 55 { x: 51.2999992; y: -52.4000015; skew-x: 4.5999999; skew-y: 4.5999999; scale-y: 0.81400001; }
        frame 56 { x: 51; y: -52.7999992; skew-x: 3.5; skew-y: 3.5; scale-y: 0.822000027; }
        frame 57 { x: 50.9000015; y: -53.2000008; skew-x: 2.79999995; skew-y: 2.79999995; scale-y: 0.828999996; }
        frame 58 { x: 50.7999992; y: -53.7000008; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 0.837000012; }
        frame 59 { x: 50.5; y: -54.0999985; skew-x: 0.800000012; skew-y: 0.800000012; scale-y: 0.843999982; }
        frame 60 { x: 50.4000015; y: -54.5; skew-x: 0; skew-y: 0; scale-y: 0.851000011; }
        frame 61 { x: 49.9000015; y: -53.7000008; skew-x: -2.20000005; skew-y: -2.20000005; scale-y: 0.843999982; }
        frame 62 { x: 49.5; y: -53; skew-x: -4.4000001; skew-y: -4.4000001; scale-y: 0.837000012; }
        frame 63 { x: 49.7000008; y: -52.5999985; skew-x: -3.4000001; skew-y: -3.4000001; scale-y: 0.828999996; }
        frame 64 { x: 49.9000015; y: -52.2000008; skew-x: -2.5; skew-y: -2.5; scale-y: 0.822000027; }
        frame 65 { x: 50; y: -51.7000008; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.814999998; }
        frame 66 { x: 50.2000008; y: -51.2999992; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.806999981; }
        frame 67 { x: 50.4000015; y: -50.9000015; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 68 { x: -10000; y: -50.5999985; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 69 { x: 45.7999992; y: -51.0999985; skew-y: -0.699999988; scale-x: 0.759000003; scale-y: 0.814999998; }
        frame 70 { x: 41.2999992; y: -51.5999985; skew-y: -1.70000005; scale-x: 0.717999995; scale-y: 0.83099997; }
        frame 71 { x: 36.7000008; y: -52.2000008; skew-y: -2.70000005; scale-x: 0.675999999; scale-y: 0.846000016; }
        frame 72 { x: 32; y: -52.7999992; skew-y: -3.79999995; scale-x: 0.63499999; scale-y: 0.861000001; }
        frame 73 { x: 56; y: -52; skew-y: -2.4000001; scale-x: -10000; scale-y: 0.800999999; }
        frame 74 { x: 79.8000031; y: -51.2000008; skew-y: -1.20000005; scale-y: 0.74000001; }
        frame 75 { x: 103.800003; y: -50.4000015; skew-y: 0; scale-y: 0.680000007; }
        frame 76 { x: 92; y: -50.5; skew-y: -10000; scale-x: 0.662999988; scale-y: 0.699999988; }
        frame 77 { x: 80.1999969; y: -50.5999985; scale-x: 0.689999998; scale-y: 0.720000029; }
        frame 78 { x: 72.6999969; y: -50.5; scale-x: 0.717999995; scale-y: 0.74000001; }
        frame 79 { x: 65.3000031; y: -50.5999985; scale-x: 0.745000005; scale-y: 0.75999999; }
        frame 80 { x: 57.7999992; y: -50.5; scale-x: 0.773000002; scale-y: 0.779999971; }
        frame 81 { x: 50.4000015; y: -50.5999985; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 82 { x: -10000; y: -50.9000015; scale-x: -10000; scale-y: -10000; }
        frame 83 { y: -51.9000015; scale-y: 0.816999972; }
        frame 84 { y: -53; scale-y: 0.834999979; }
        frame 85 { y: -27.7000008; scale-y: 0.816999972; }
        frame 86 { y: -2.4000001; scale-y: 0.800000012; }
        frame 87 { x: 50.5; y: 3.79999995; scale-y: 0.786000013; }
        frame 88 { x: 50.7000008; y: 10.1000004; scale-y: 0.773000002; }
        frame 89 { x: 50.9000015; y: 16.3999996; scale-y: 0.759000003; }
        frame 90 { x: 51.0999985; y: 22.7000008; skew-y: 0.200000003; scale-y: 0.745999992; }
        frame 91 { x: 50.9000015; y: 22.6000004; skew-y: 0; scale-y: 0.759000003; }
        frame 92 { x: 50.7000008; y: 22.2999992; skew-y: -10000; scale-y: 0.773000002; }
        frame 93 { x: 50.5; y: 20.8999996; scale-y: 0.786000013; }
        frame 94 { x: 50.4000015; y: 19.5; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cactus_blink";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { x: 24; y: 18; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CACTUS_BLINK1; }
        frame 2 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_CACTUS_BLINK2; }
        frame 3 { image: IMAGE_REANIM_CACTUS_BLINK1; }
        frame 4 { cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 30 { x: 34.2999992; y: 17; skew-x: 0.800000012; skew-y: 22.6000004; scale-y: 0.861999989; cel: 0; }
        frame 31 { x: 41.5999985; y: 18; skew-x: 0; skew-y: 24.2000008; scale-y: 0.876999974; cel: -10000; image: IMAGE_REANIM_CACTUS_BLINK2; }
        frame 32 { x: 38.2999992; y: 17; skew-x: 0.800000012; skew-y: 12.3000002; scale-y: 0.816999972; image: IMAGE_REANIM_CACTUS_BLINK1; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 34 { cel: -10000; }
        frame 74 { x: 45.9000015; y: -54.7999992; skew-y: 16.2999992; scale-y: 0.829999983; cel: 0; }
        frame 75 { x: 71.3000031; y: -54.0999985; skew-x: 0; skew-y: 24.2000008; scale-y: 0.876999974; cel: -10000; image: IMAGE_REANIM_CACTUS_BLINK2; }
        frame 76 { x: 58.5; y: -54.4000015; skew-x: 0.800000012; skew-y: 14.3000002; scale-y: 0.823000014; image: IMAGE_REANIM_CACTUS_BLINK1; }
        frame 77 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 78 { cel: -10000; }
    }
}
