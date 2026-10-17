export component Plantern {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 25;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "Plantern_stem";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 24.5; y: 56.7999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_PLANTERN_STEM; }
        frame 6 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 10.8999996; y: -2.70000005; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_PLANTERN_BODY; }
        frame 6 { x: 10.6999998; y: -1.89999998; scale-x: 0.805000007; scale-y: 0.795000017; cel: -10000; image: none; }
        frame 7 { x: 10.5; y: -1.10000002; scale-x: 0.81099999; scale-y: 0.790000021; }
        frame 8 { x: 10.3000002; y: -0.300000012; scale-x: 0.815999985; scale-y: 0.785000026; }
        frame 9 { x: 10.1000004; y: 0.400000006; scale-x: 0.822000027; scale-y: 0.778999984; }
        frame 10 { x: 9.89999962; y: 1.20000005; scale-x: 0.827000022; scale-y: 0.773999989; }
        frame 11 { x: 9.69999981; y: 2; scale-x: 0.832000017; scale-y: 0.768999994; }
        frame 12 { x: 9.5; y: 2.9000001; scale-x: 0.838; scale-y: 0.763999999; }
        frame 13 { x: 9.30000019; y: 3.5999999; scale-x: 0.842999995; scale-y: 0.759000003; }
        frame 14 { x: 9.10000038; y: 4.4000001; scale-x: 0.848999977; scale-y: 0.754000008; }
        frame 15 { x: 9.19999981; y: 3.70000005; scale-x: 0.843999982; scale-y: 0.758000016; }
        frame 16 { x: 9.39999962; y: 3; scale-x: 0.838999987; scale-y: 0.763000011; }
        frame 17 { x: 9.60000038; y: 2.29999995; scale-x: 0.833999991; scale-y: 0.768000007; }
        frame 18 { x: 9.80000019; y: 1.5; scale-x: 0.828999996; scale-y: 0.772000015; }
        frame 19 { x: 10; y: 0.800000012; scale-x: 0.824000001; scale-y: 0.77700001; }
        frame 20 { x: 10.1999998; y: 0; scale-x: 0.819000006; scale-y: 0.781000018; }
        frame 21 { x: 10.3999996; y: -0.5; scale-x: 0.814999998; scale-y: 0.786000013; }
        frame 22 { x: 10.6000004; y: -1.29999995; scale-x: 0.810000002; scale-y: 0.791000009; }
        frame 23 { x: 10.6999998; y: -2; scale-x: 0.805000007; scale-y: 0.795000017; }
        frame 24 { x: 10.8999996; y: -2.70000005; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Plantern_blink";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { x: 42.5; y: 30.7999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_PLANTERN_EYES; }
        frame 2 { x: -10000; y: 30.7000008; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_PLANTERN_EYES2; }
        frame 3 { y: 30.7999992; image: IMAGE_REANIM_PLANTERN_EYES; }
        frame 4 { y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "Plantern_leaf1";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 5.69999981; y: 7.69999981; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF1; }
        frame 6 { x: 5.80000019; y: 7.9000001; skew-x: 4; skew-y: 4; scale-x: 0.799000025; scale-y: 0.799000025; cel: -10000; image: none; }
        frame 7 { x: 5.9000001; y: 8.10000038; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 8 { x: 4.80000019; y: 9.89999962; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 4; y: 11.8999996; skew-x: -4.9000001; skew-y: -4.9000001; }
        frame 10 { x: 3.0999999; y: 13.8000002; skew-x: -11.5; skew-y: -11.5; }
        frame 11 { x: 2.5; y: 15.8999996; skew-x: -18.2000008; skew-y: -18.2000008; }
        frame 12 { x: 1.79999995; y: 18; skew-x: -24.8999996; skew-y: -24.8999996; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 13 { x: 1.29999995; y: 20.2000008; skew-x: -31.5; skew-y: -31.5; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 0.699999988; y: 22.2000008; skew-x: -38.2000008; skew-y: -38.2000008; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 15 { x: 1.39999998; y: 25.5; skew-x: -57.5999985; skew-y: -57.5999985; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 16 { x: 2.70000005; y: 28.6000004; skew-x: -76.9000015; skew-y: -76.9000015; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 2.5; y: 26.1000004; skew-x: -67.3000031; skew-y: -67.3000031; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 18 { x: 2.29999995; y: 23.5; skew-x: -57.5999985; skew-y: -57.5999985; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 19 { x: 2.4000001; y: 20.7000008; skew-x: -48; skew-y: -48; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 2.5999999; y: 18.1000004; skew-x: -38.2999992; skew-y: -38.2999992; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 21 { x: 3.0999999; y: 15.3999996; skew-x: -28.7000008; skew-y: -28.7000008; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 3.79999995; y: 12.6999998; skew-x: -19; skew-y: -19; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 23 { x: 4.69999981; y: 10.1000004; skew-x: -9.39999962; skew-y: -9.39999962; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 24 { x: 5.69999981; y: 7.69999981; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Plantern_leaf2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -1.10000002; y: 11.3000002; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF2; }
        frame 6 { x: -0; y: 10.3000002; skew-x: 8; skew-y: 9; scale-x: -10000; scale-y: 0.799000025; cel: -10000; image: none; }
        frame 7 { x: 1; y: 9.5; skew-x: 16.2999992; skew-y: 18.2999992; scale-x: 0.800999999; scale-y: 0.797999978; }
        frame 8 { x: -0; y: 11.6999998; skew-x: 9.30000019; skew-y: 12.3000002; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: -1; y: 13.8000002; skew-x: 2.5; skew-y: 6.5; scale-x: 0.802999973; }
        frame 10 { x: -1.89999998; y: 16; skew-x: -4.19999981; skew-y: 0.800000012; scale-x: 0.80400002; }
        frame 11 { x: -2.5999999; y: 18.2999992; skew-x: -10.8999996; skew-y: -4.9000001; scale-x: 0.805000007; }
        frame 12 { x: -3.20000005; y: 20.7999992; skew-x: -17.7000008; skew-y: -10.6999998; scale-x: 0.805999994; }
        frame 13 { x: -3.5999999; y: 23.2000008; skew-x: -24.7000008; skew-y: -16.5; scale-x: 0.806999981; }
        frame 14 { x: -3.79999995; y: 25.6000004; skew-x: -31.6000004; skew-y: -22.3999996; scale-x: 0.809000015; scale-y: 0.799000025; }
        frame 15 { x: -2.5; y: 27.7000008; skew-x: -41.2999992; skew-y: -26.5; scale-x: 0.828999996; scale-y: 0.796999991; }
        frame 16 { x: -1; y: 29.6000004; skew-x: -51.2000008; skew-y: -30.7999992; scale-x: 0.851999998; scale-y: -10000; }
        frame 17 { x: -1.39999998; y: 27.2999992; skew-x: -44.7999992; skew-y: -26.8999996; scale-x: 0.843999982; scale-y: 0.796000004; }
        frame 18 { x: -1.70000005; y: 25; skew-x: -38.2999992; skew-y: -23; scale-x: 0.837000012; scale-y: 0.796999991; }
        frame 19 { x: -1.89999998; y: 22.7999992; skew-x: -32; skew-y: -19.2000008; scale-x: 0.83099997; scale-y: -10000; }
        frame 20 { x: -10000; y: 20.5; skew-x: -25.5; skew-y: -15.1999998; scale-x: 0.824999988; scale-y: 0.797999978; }
        frame 21 { x: -1.79999995; y: 18.2000008; skew-x: -19; skew-y: -11.3999996; scale-x: 0.819000006; scale-y: -10000; }
        frame 22 { x: -1.70000005; y: 15.8999996; skew-x: -12.6999998; skew-y: -7.5; scale-x: 0.811999977; scale-y: 0.799000025; }
        frame 23 { x: -1.39999998; y: 13.5; skew-x: -6.19999981; skew-y: -3.70000005; scale-x: 0.805999994; scale-y: -10000; }
        frame 24 { x: -1.10000002; y: 11.3000002; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Plantern_leaf3";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 7.4000001; y: 16.5; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF3; }
        frame 6 { x: 7; y: 16.7000008; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.890999973; scale-y: 0.748000026; cel: -10000; image: none; }
        frame 7 { x: 6.5; y: 16.8999996; skew-x: 5; skew-y: 5; scale-x: 0.981999993; scale-y: 0.694999993; }
        frame 8 { x: 6.30000019; y: 18; skew-x: 2.5; skew-y: 2.5; scale-x: 0.954999983; scale-y: 0.720000029; }
        frame 9 { x: 6.19999981; y: 19.2000008; skew-x: 0; skew-y: 0; scale-x: 0.92900002; scale-y: 0.745999992; }
        frame 10 { x: 6.0999999; y: 20.2999992; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.902999997; scale-y: 0.769999981; }
        frame 11 { x: 5.9000001; y: 21.3999996; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.876999974; scale-y: 0.795000017; }
        frame 12 { x: 5.80000019; y: 22.5; skew-x: -7.19999981; skew-y: -7.19999981; scale-x: 0.851000011; scale-y: 0.819999993; }
        frame 13 { x: 5.69999981; y: 23.6000004; skew-x: -9.69999981; skew-y: -9.69999981; scale-x: 0.824999988; scale-y: 0.845000029; }
        frame 14 { x: 5.5999999; y: 24.7000008; skew-x: -12.1999998; skew-y: -12.1999998; scale-x: 0.799000025; scale-y: 0.870999992; }
        frame 15 { x: 5.69999981; y: 24.5; skew-x: -17.8999996; skew-y: -11.8999996; scale-x: 0.806999981; scale-y: 0.912999988; }
        frame 16 { x: 5.80000019; y: 24.1000004; skew-x: -23.7999992; skew-y: -11.6999998; scale-x: 0.816999972; scale-y: 0.957000017; }
        frame 17 { x: 6; y: 23; skew-x: -20.7000008; skew-y: -10.1999998; scale-x: 0.81400001; scale-y: 0.936999977; }
        frame 18 { x: 6.19999981; y: 22.1000004; skew-x: -17.7000008; skew-y: -8.69999981; scale-x: 0.811999977; scale-y: 0.916999996; }
        frame 19 { x: 6.4000001; y: 21.1000004; skew-x: -14.6999998; skew-y: -7.19999981; scale-x: 0.810000002; scale-y: 0.898000002; }
        frame 20 { x: 6.69999981; y: 20.1000004; skew-x: -11.6999998; skew-y: -5.69999981; scale-x: 0.808000028; scale-y: 0.878000021; }
        frame 21 { x: 6.9000001; y: 19.2999992; skew-x: -8.69999981; skew-y: -4.19999981; scale-x: 0.805999994; scale-y: 0.859000027; }
        frame 22 { x: 7; y: 18.2999992; skew-x: -5.69999981; skew-y: -2.70000005; scale-x: 0.80400002; scale-y: 0.838999987; }
        frame 23 { x: 7.30000019; y: 17.2999992; skew-x: -2.70000005; skew-y: -1.20000005; scale-x: 0.801999986; scale-y: 0.819999993; }
        frame 24 { x: 7.4000001; y: 16.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Plantern_leaf1.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 74.5; y: 9.80000019; skew-x: -163.800003; skew-y: 16.1000004; scale-x: 0.735000014; scale-y: 0.735000014; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF1; }
        frame 6 { x: 73.9000015; y: 8.39999962; skew-x: -176.100006; skew-y: 3.79999995; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 73.1999969; y: 7.4000001; skew-x: -188.199997; skew-y: -8.19999981; scale-x: 0.736000001; scale-y: 0.736000001; }
        frame 8 { x: 73.9000015; y: 9; skew-x: -181.399994; skew-y: -1.70000005; scale-x: 0.736999989; scale-y: 0.736999989; }
        frame 9 { x: 74.5; y: 10.8000002; skew-x: -174.899994; skew-y: 4.5; scale-x: 0.739000022; scale-y: 0.739000022; }
        frame 10 { x: 75.0999985; y: 12.5; skew-x: -168.300003; skew-y: 11; scale-x: 0.74000001; scale-y: 0.740999997; }
        frame 11 { x: 75.6999969; y: 14.1999998; skew-x: -161.600006; skew-y: 17.5; scale-x: 0.740999997; scale-y: 0.741999984; }
        frame 12 { x: 76; y: 16.1000004; skew-x: -155.100006; skew-y: 23.7999992; scale-x: 0.741999984; scale-y: 0.744000018; }
        frame 13 { x: 76.4000015; y: 18; skew-x: -148.300003; skew-y: 30.2999992; scale-x: 0.744000018; scale-y: 0.745000005; }
        frame 14 { x: 76.6999969; y: 19.8999996; skew-x: -141.600006; skew-y: 36.9000015; scale-x: 0.745999992; scale-y: 0.748000026; }
        frame 15 { x: 75.9000015; y: 23.7000008; skew-x: -118.300003; skew-y: 60.4000015; scale-x: 0.742999971; scale-y: 0.744000018; }
        frame 16 { x: 74.0999985; y: 27.2000008; skew-x: -95.1999969; skew-y: 83.6999969; scale-x: 0.741999984; scale-y: 0.742999971; }
        frame 17 { x: 74.5999985; y: 25.2000008; skew-x: -103.699997; skew-y: 75.4000015; scale-x: 0.74000001; scale-y: 0.740999997; }
        frame 18 { x: 75; y: 23; skew-x: -112.199997; skew-y: 66.9000015; scale-x: 0.739000022; scale-y: 0.74000001; }
        frame 19 { x: 75.3000031; y: 20.8999996; skew-x: -121; skew-y: 58.4000015; scale-x: 0.737999976; scale-y: 0.739000022; }
        frame 20 { x: 75.5; y: 18.7000008; skew-x: -129.5; skew-y: 49.9000015; scale-x: 0.736999989; scale-y: 0.737999976; }
        frame 21 { x: 75.4000015; y: 16.5; skew-x: -138; skew-y: 41.4000015; scale-x: 0.736000001; scale-y: 0.736999989; }
        frame 22 { x: 75.1999969; y: 14.3000002; skew-x: -146.600006; skew-y: 32.9000015; scale-x: -10000; scale-y: 0.736000001; }
        frame 23 { x: 74.9000015; y: 12; skew-x: -155.300003; skew-y: 24.5; scale-x: 0.735000014; scale-y: 0.735000014; }
        frame 24 { x: 74.5; y: 9.80000019; skew-x: -163.800003; skew-y: 16.1000004; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Plantern_leaf2.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 81.0999985; y: 12.8000002; skew-x: -169.600006; skew-y: 10.3000002; scale-x: 0.736000001; scale-y: 0.736000001; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF2; }
        frame 6 { x: 80; y: 10.3999996; skew-x: -182.699997; skew-y: -3.70000005; scale-x: 0.768000007; scale-y: 0.76700002; cel: -10000; image: none; }
        frame 7 { x: 78.5; y: 8.30000019; skew-x: -196.199997; skew-y: -18.2000008; scale-x: 0.800999999; scale-y: 0.797999978; }
        frame 8 { x: 79.3000031; y: 10.6000004; skew-x: -188; skew-y: -11.1999998; scale-x: 0.79400003; scale-y: 0.791000009; }
        frame 9 { x: 79.8000031; y: 13; skew-x: -179.899994; skew-y: -4.4000001; scale-x: 0.787; scale-y: 0.785000026; }
        frame 10 { x: 80.3000031; y: 15.3999996; skew-x: -172.100006; skew-y: 2.29999995; scale-x: 0.779999971; scale-y: 0.778999984; }
        frame 11 { x: 80.4000015; y: 18; skew-x: -164.100006; skew-y: 9; scale-x: 0.773000002; scale-y: 0.772000015; }
        frame 12 { x: 80.5; y: 20.6000004; skew-x: -155.899994; skew-y: 16; scale-x: 0.765999973; scale-y: 0.764999986; }
        frame 13 { x: 80.3000031; y: 23.1000004; skew-x: -147.800003; skew-y: 22.7999992; scale-x: 0.75999999; scale-y: 0.758000016; }
        frame 14 { x: 79.9000015; y: 25.6000004; skew-x: -139.800003; skew-y: 29.7999992; scale-x: 0.754000008; scale-y: 0.753000021; }
        frame 15 { x: 78.6999969; y: 25.7999992; skew-x: -137.5; skew-y: 26.6000004; scale-x: 0.773000002; scale-y: 0.749000013; }
        frame 16 { x: 77.8000031; y: 26; skew-x: -135.100006; skew-y: 23.6000004; scale-x: 0.795000017; scale-y: 0.746999979; }
        frame 17 { x: 78.3000031; y: 24.3999996; skew-x: -139.300003; skew-y: 21.7999992; scale-x: 0.786000013; scale-y: 0.745000005; }
        frame 18 { x: 78.9000015; y: 22.7999992; skew-x: -143.800003; skew-y: 20.2999992; scale-x: 0.778999984; scale-y: 0.744000018; }
        frame 19 { x: 79.3000031; y: 21.2000008; skew-x: -148.100006; skew-y: 18.5; scale-x: 0.771000028; scale-y: 0.741999984; }
        frame 20 { x: 79.6999969; y: 19.5; skew-x: -152.300003; skew-y: 16.7999992; scale-x: 0.763999999; scale-y: 0.740999997; }
        frame 21 { x: 80.0999985; y: 17.8999996; skew-x: -156.600006; skew-y: 15.3000002; scale-x: 0.757000029; scale-y: 0.739000022; }
        frame 22 { x: 80.5; y: 16.2000008; skew-x: -161.100006; skew-y: 13.5; scale-x: 0.75; scale-y: 0.737999976; }
        frame 23 { x: 80.6999969; y: 14.5; skew-x: -165.399994; skew-y: 11.8000002; scale-x: 0.741999984; scale-y: 0.736999989; }
        frame 24 { x: 81.0999985; y: 12.8000002; skew-x: -169.600006; skew-y: 10.3000002; scale-x: 0.736000001; scale-y: 0.736000001; }
    }
    Track {
        source-name: "Plantern_leaf3.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 71.0999985; y: 14.1000004; skew-x: 174.899994; skew-y: -5; scale-x: 0.736000001; scale-y: 0.736000001; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF3; }
        frame 6 { x: 72.3000031; y: 14.6000004; skew-x: 175; skew-y: -4.9000001; scale-x: 0.85799998; scale-y: 0.714999974; cel: -10000; image: none; }
        frame 7 { x: 73.5999985; y: 15.1000004; skew-x: -10000; skew-y: -10000; scale-x: 0.981999993; scale-y: 0.694999993; }
        frame 8 { x: 73.4000015; y: 16.1000004; skew-x: 177.5; skew-y: -2.4000001; scale-x: 0.947000027; scale-y: 0.713999987; }
        frame 9 { x: 73.1999969; y: 17.2000008; skew-x: 180; skew-y: -0.200000003; scale-x: 0.912999988; scale-y: 0.731999993; }
        frame 10 { x: 73; y: 18.1000004; skew-x: 182.100006; skew-y: 1.79999995; scale-x: 0.878000021; scale-y: 0.75; }
        frame 11 { x: 72.8000031; y: 19.2999992; skew-x: 184.5; skew-y: 4.0999999; scale-x: 0.843999982; scale-y: 0.768000007; }
        frame 12 { x: 72.5999985; y: 20.2999992; skew-x: 187; skew-y: 6.5; scale-x: 0.809000015; scale-y: 0.787; }
        frame 13 { x: 72.4000015; y: 21.3999996; skew-x: 189.300003; skew-y: 8.80000019; scale-x: 0.773999989; scale-y: 0.805000007; }
        frame 14 { x: 72.3000031; y: 22.2000008; skew-x: 191.899994; skew-y: 11.1999998; scale-x: 0.74000001; scale-y: 0.823000014; }
        frame 15 { x: 71.9000015; y: 22.7999992; skew-x: 202.300003; skew-y: 11.5; scale-x: 0.764999986; scale-y: 0.813000023; }
        frame 16 { x: 71.4000015; y: 23.2999992; skew-x: 213; skew-y: 12.1000004; scale-x: 0.790000021; scale-y: 0.805000007; }
        frame 17 { x: 71.5; y: 22.1000004; skew-x: 208.100006; skew-y: 9.80000019; scale-x: 0.782000005; scale-y: 0.796000004; }
        frame 18 { x: -10000; y: 20.8999996; skew-x: 203.300003; skew-y: 7.80000019; scale-x: 0.776000023; scale-y: 0.787; }
        frame 19 { y: 19.7999992; skew-x: 198.600006; skew-y: 5.5; scale-x: 0.768999994; scale-y: 0.778999984; }
        frame 20 { y: 18.6000004; skew-x: 193.800003; skew-y: 3.5; scale-x: 0.762000024; scale-y: 0.769999981; }
        frame 21 { x: 71.4000015; y: 17.3999996; skew-x: 189.100006; skew-y: 1.29999995; scale-x: 0.755999982; scale-y: 0.762000024; }
        frame 22 { x: 71.3000031; y: 16.2000008; skew-x: 184.300003; skew-y: -0.699999988; scale-x: 0.749000013; scale-y: 0.753000021; }
        frame 23 { x: 71.1999969; y: 15.1000004; skew-x: 179.699997; skew-y: -2.70000005; scale-x: 0.742999971; scale-y: 0.744000018; }
        frame 24 { x: 71.0999985; y: 14.1000004; skew-x: 174.899994; skew-y: -5; scale-x: 0.736000001; scale-y: 0.736000001; }
    }
    Track {
        source-name: "Plantern_leaf4";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 26; y: 23.2999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF4; }
        frame 6 { x: 26.3999996; y: 22; skew-x: 5; skew-y: 5; scale-x: 0.799000025; scale-y: 0.799000025; cel: -10000; image: none; }
        frame 7 { x: 26.7999992; y: 20.7000008; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 26.6000004; y: 22.2000008; skew-x: 6.80000019; skew-y: 6.80000019; }
        frame 9 { x: 26.3999996; y: 23.7000008; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 10 { x: 26.1000004; y: 25.2000008; skew-x: 0.5; skew-y: 0.5; }
        frame 11 { x: 25.8999996; y: 26.6000004; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 12 { x: 25.7000008; y: 28.1000004; skew-x: -5.4000001; skew-y: -5.4000001; }
        frame 13 { x: 25.6000004; y: 29.7000008; skew-x: -8.39999962; skew-y: -8.39999962; }
        frame 14 { x: 25.2999992; y: 31.2999992; skew-x: -11.6999998; skew-y: -11.6999998; }
        frame 15 { x: -10000; y: 34.2999992; skew-x: -26.7000008; skew-y: -21.8999996; scale-x: 0.802999973; scale-y: 0.797999978; }
        frame 16 { x: 25.6000004; y: 37.2999992; skew-x: -41.7999992; skew-y: -32.2000008; scale-x: 0.809000015; scale-y: -10000; }
        frame 17 { x: 25.5; y: 35.5999985; skew-x: -36.5; skew-y: -28.2000008; scale-x: 0.806999981; scale-y: 0.796999991; }
        frame 18 { x: 25.2999992; y: 33.7999992; skew-x: -31.2000008; skew-y: -24.2000008; scale-x: 0.805999994; scale-y: 0.797999978; }
        frame 19 { x: -10000; y: 32; skew-x: -26; skew-y: -20; scale-x: 0.805000007; scale-y: -10000; }
        frame 20 { x: 25.3999996; y: 30.2000008; skew-x: -20.7000008; skew-y: -16; scale-x: 0.80400002; }
        frame 21 { x: -10000; y: 28.5; skew-x: -15.5; skew-y: -11.8999996; scale-x: 0.802999973; scale-y: 0.799000025; }
        frame 22 { x: 25.6000004; y: 26.7999992; skew-x: -10.1999998; skew-y: -7.9000001; scale-x: 0.801999986; scale-y: -10000; }
        frame 23 { x: 25.8999996; y: 25; skew-x: -5; skew-y: -3.9000001; scale-x: 0.800999999; scale-y: 0.800000012; }
        frame 24 { x: 26; y: 23.2999992; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: -10000; }
    }
    Track {
        source-name: "Plantern_leaf4.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 53; y: 26.7000008; skew-x: -164.899994; skew-y: 15; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF4; }
        frame 6 { x: 52.5; y: 25.2000008; skew-x: -175.100006; skew-y: 4.80000019; scale-x: 0.799000025; scale-y: 0.799000025; cel: -10000; image: none; }
        frame 7 { x: 51.7999992; y: 23.7000008; skew-x: -185.199997; skew-y: -5.19999981; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 8 { x: 52.2000008; y: 25.1000004; skew-x: -180.399994; skew-y: -0.400000006; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 52.5; y: 26.6000004; skew-x: -175.899994; skew-y: 4; }
        frame 10 { x: 52.7000008; y: 28; skew-x: -171.100006; skew-y: 8.80000019; }
        frame 11 { x: 52.9000015; y: 29.5; skew-x: -166.399994; skew-y: 13.5; }
        frame 12 { x: 53.0999985; y: 30.8999996; skew-x: -161.800003; skew-y: 18.1000004; }
        frame 13 { x: 53.2000008; y: 32.4000015; skew-x: -157.100006; skew-y: 22.7999992; }
        frame 14 { x: -10000; y: 33.9000015; skew-x: -152.300003; skew-y: 27.6000004; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 15 { x: 52.7999992; y: 36.4000015; skew-x: -139.5; skew-y: 35.7999992; scale-x: 0.808000028; scale-y: 0.796999991; }
        frame 16 { x: 52.0999985; y: 38.5999985; skew-x: -126.599998; skew-y: 43.9000015; scale-x: 0.819999993; scale-y: 0.797999978; }
        frame 17 { x: 52.4000015; y: 37.0999985; skew-x: -131.300003; skew-y: 40.0999985; scale-x: 0.815999985; scale-y: 0.796999991; }
        frame 18 { x: 52.5999985; y: 35.5999985; skew-x: -136.199997; skew-y: 36.5999985; scale-x: 0.81400001; scale-y: -10000; }
        frame 19 { x: 52.7999992; y: 34.0999985; skew-x: -141; skew-y: 33.0999985; scale-x: 0.81099999; }
        frame 20 { x: 52.9000015; y: 32.7999992; skew-x: -145.800003; skew-y: 29.2999992; scale-x: 0.809000015; scale-y: 0.797999978; }
        frame 21 { x: -10000; y: 31.2000008; skew-x: -150.600006; skew-y: 25.7999992; scale-x: 0.805999994; scale-y: -10000; }
        frame 22 { x: 53; y: 29.7999992; skew-x: -155.300003; skew-y: 22.1000004; scale-x: 0.80400002; }
        frame 23 { x: 52.9000015; y: 28.2000008; skew-x: -160.100006; skew-y: 18.5; scale-x: 0.801999986; scale-y: 0.799000025; }
        frame 24 { x: 53; y: 26.7000008; skew-x: -164.899994; skew-y: 15; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Plantern_leaf5";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 26.7000008; y: 26; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF5; }
        frame 6 { x: 27.1000004; y: 24.7999992; skew-x: 6.5; skew-y: 6.5; scale-x: 0.800999999; scale-y: 0.806999981; cel: -10000; image: none; }
        frame 7 { x: 27.5; y: 23.7999992; skew-x: 13.1000004; skew-y: 13.1000004; scale-x: 0.801999986; scale-y: 0.814999998; }
        frame 8 { x: 27.2000008; y: 25.1000004; skew-x: 9.5; skew-y: 9.5; scale-x: 0.802999973; scale-y: 0.823000014; }
        frame 9 { x: 27; y: 26.3999996; skew-x: 6; skew-y: 6; scale-x: 0.805000007; scale-y: 0.83099997; }
        frame 10 { x: 26.7999992; y: 27.7999992; skew-x: 2.5; skew-y: 2.5; scale-x: 0.806999981; scale-y: 0.838999987; }
        frame 11 { x: 26.6000004; y: 29.1000004; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.809000015; scale-y: 0.847000003; }
        frame 12 { x: 26.2999992; y: 30.5; skew-x: -4.19999981; skew-y: -4.19999981; scale-x: 0.810000002; scale-y: 0.855000019; }
        frame 13 { x: -10000; y: 32; skew-x: -7.69999981; skew-y: -7.69999981; scale-x: 0.811999977; scale-y: 0.862999976; }
        frame 14 { x: 26.1000004; y: 33.2999992; skew-x: -11.1999998; skew-y: -11.1999998; scale-x: 0.81400001; scale-y: 0.870999992; }
        frame 15 { x: 27; y: 33.5; skew-x: -14.5; skew-y: -14.5; scale-x: 0.76700002; scale-y: 0.913999975; }
        frame 16 { x: 27.8999996; y: -10000; skew-x: -18; skew-y: -18; scale-x: 0.722000003; scale-y: 0.958000004; }
        frame 17 { x: 27.7999992; y: 32.5; skew-x: -15.6999998; skew-y: -15.6999998; scale-x: 0.731000006; scale-y: 0.936999977; }
        frame 18 { x: 27.7000008; y: 31.6000004; skew-x: -13.3999996; skew-y: -13.3999996; scale-x: 0.740999997; scale-y: 0.917999983; }
        frame 19 { x: 27.6000004; y: 30.7000008; skew-x: -11.1999998; skew-y: -11.1999998; scale-x: 0.750999987; scale-y: 0.898000002; }
        frame 20 { x: 27.3999996; y: 29.7000008; skew-x: -8.89999962; skew-y: -8.89999962; scale-x: 0.760999978; scale-y: 0.879000008; }
        frame 21 { x: 27.2999992; y: 28.7000008; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: 0.771000028; scale-y: 0.859000027; }
        frame 22 { x: 27.1000004; y: 27.7999992; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.779999971; scale-y: 0.838999987; }
        frame 23 { x: 27; y: 26.8999996; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.790000021; scale-y: 0.819999993; }
        frame 24 { x: 26.7000008; y: 26; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
}
