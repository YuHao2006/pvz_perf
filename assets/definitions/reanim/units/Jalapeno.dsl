export component Jalapeno {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 25;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 12 { cel: -1; }
        frame 13 { cel: -10000; }
    }
    Track {
        source-name: "anim_explode";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 12 { cel: 0; }
        frame 13 { cel: -10000; }
    }
    Track {
        source-name: "Jalapeno_stem";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 33; y: 2.5999999; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_JALAPENO_STEM; }
        frame 6 { x: 34.0999985; y: 2.9000001; skew-x: 6; skew-y: 5.0999999; scale-x: 0.776000023; scale-y: 0.795000017; cel: -10000; image: none; }
        frame 7 { x: 35.2000008; y: 3.29999995; skew-x: 12; skew-y: 10.3000002; scale-x: 0.753000021; scale-y: 0.790000021; }
        frame 8 { x: 36.4000015; y: 3.79999995; skew-x: 18.1000004; skew-y: 15.6000004; scale-x: 0.730000019; scale-y: 0.786000013; }
        frame 9 { x: 35.2000008; y: 3.20000005; skew-x: 12; skew-y: 10.3000002; scale-x: 0.753000021; scale-y: 0.790000021; }
        frame 10 { x: 34.0999985; y: 2.9000001; skew-x: 6; skew-y: 5.0999999; scale-x: 0.776000023; scale-y: 0.795000017; }
        frame 11 { x: 33; y: 2.5999999; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 12 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { y: 1.29999995; skew-x: 1.5; skew-y: 2; scale-x: 0.80400002; scale-y: 0.813000023; }
        frame 14 { x: 33.0999985; y: 0; skew-x: 3.0999999; skew-y: 4; scale-x: 0.808000028; scale-y: 0.824999988; }
        frame 15 { x: 33.2000008; y: -1.20000005; skew-x: 4.80000019; skew-y: 6.0999999; scale-x: 0.811999977; scale-y: 0.838; }
        frame 16 { x: 33.4000015; y: -2.5; skew-x: 6.30000019; skew-y: 8.30000019; scale-x: 0.816999972; scale-y: 0.850000024; }
        frame 17 { x: 33.5; y: -3.79999995; skew-x: 8; skew-y: 10.3000002; scale-x: 0.82099998; scale-y: 0.862999976; }
        frame 18 { x: 33.5999985; y: -5; skew-x: 9.5; skew-y: 12.3000002; scale-x: 0.824999988; scale-y: 0.875999987; }
        frame 19 { x: 33.7000008; y: -6.30000019; skew-x: 11.1000004; skew-y: 14.5; scale-x: 0.828999996; scale-y: 0.888000011; }
        frame 20 { x: 34; y: -7.5999999; skew-x: 12.8000002; skew-y: 16.5; scale-x: 0.833000004; scale-y: 0.901000023; }
        frame 21 { y: -8.89999962; skew-x: 14.3000002; skew-y: 18.6000004; scale-x: 0.838; scale-y: 0.913999975; }
        frame 22 { x: 34.2999992; y: -10.1000004; skew-x: 16; skew-y: 20.7999992; scale-x: 0.842000008; scale-y: 0.925999999; }
        frame 23 { x: 34.5; y: -11.3000002; skew-x: 17.5; skew-y: 22.7999992; scale-x: 0.846000016; scale-y: 0.93900001; }
        frame 24 { x: -10000; y: -12.6999998; skew-x: 19.2000008; skew-y: 24.8999996; scale-x: 0.851000011; scale-y: 0.953000009; }
    }
    Track {
        source-name: "Jalapeno_body";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 17.1000004; y: 10.3999996; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_JALAPENO_BODY; }
        frame 6 { x: 16.8999996; y: 11; scale-x: 0.813000023; scale-y: 0.786000013; cel: -10000; image: none; }
        frame 7 { x: 16.7000008; y: 11.6000004; scale-x: 0.825999975; scale-y: 0.772000015; }
        frame 8 { x: 16.5; y: 12.3000002; scale-x: 0.838999987; scale-y: 0.759000003; }
        frame 9 { x: 16.7000008; y: 11.6000004; scale-x: 0.825999975; scale-y: 0.772000015; }
        frame 10 { x: 16.8999996; y: 11; scale-x: 0.813000023; scale-y: 0.786000013; }
        frame 11 { x: 17.1000004; y: 10.3999996; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 12 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 16.1000004; y: 9.19999981; scale-x: 0.838; scale-y: 0.818000019; }
        frame 14 { x: 15.1000004; y: 8; scale-x: 0.875999987; scale-y: 0.836000025; }
        frame 15 { x: 14.1000004; y: 6.80000019; scale-x: 0.913999975; scale-y: 0.853999972; }
        frame 16 { x: 13.1999998; y: 5.5999999; scale-x: 0.953000009; scale-y: 0.871999979; }
        frame 17 { x: 12.1999998; y: 4.30000019; scale-x: 0.990999997; scale-y: 0.889999986; }
        frame 18 { x: 11.1999998; y: 3.0999999; scale-x: 1.02900004; scale-y: 0.907999992; }
        frame 19 { x: 10.1999998; y: 1.89999998; scale-x: 1.06700003; scale-y: 0.925999999; }
        frame 20 { x: 9.19999981; y: 0.600000024; scale-x: 1.10500002; scale-y: 0.944000006; }
        frame 21 { x: 8.30000019; y: -0.5; scale-x: 1.14300001; scale-y: 0.962000012; }
        frame 22 { x: 7.30000019; y: -1.60000002; scale-x: 1.18200004; scale-y: 0.980000019; }
        frame 23 { x: 6.30000019; y: -2.9000001; scale-x: 1.22000003; scale-y: 0.996999979; }
        frame 24 { x: 5.4000001; y: -4.19999981; scale-x: 1.25800002; scale-y: 1.01499999; }
    }
    Track {
        source-name: "Jalapeno_mouth";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 27.2000008; y: 34.0999985; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_JALAPENO_MOUTH; }
        frame 6 { x: 26; y: 34.2999992; scale-x: 0.865999997; scale-y: 0.754000008; cel: -10000; image: none; }
        frame 7 { x: 24.7999992; y: 34.4000015; scale-x: 0.931999981; scale-y: 0.708000004; }
        frame 8 { x: 23.6000004; y: 34.5; scale-x: 0.998000026; scale-y: 0.661000013; }
        frame 9 { x: 24.7999992; y: 34.4000015; scale-x: 0.931999981; scale-y: 0.708000004; }
        frame 10 { x: 26; y: 34.2999992; scale-x: 0.865999997; scale-y: 0.754000008; }
        frame 11 { x: 27.2000008; y: 34.0999985; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 12 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 26.1000004; y: 33.7999992; skew-x: -0.200000003; skew-y: 0.300000012; scale-x: 0.864000022; scale-y: 0.832000017; }
        frame 14 { x: 24.8999996; y: 33.4000015; skew-x: -0.400000006; skew-y: 0.5; scale-x: 0.92900002; scale-y: 0.862999976; }
        frame 15 { x: 23.7000008; y: 33; skew-x: -0.699999988; skew-y: 0.800000012; scale-x: 0.992999971; scale-y: 0.894999981; }
        frame 16 { x: 22.6000004; y: 32.7000008; skew-x: -0.899999976; skew-y: 1.10000002; scale-x: 1.05799997; scale-y: 0.926999986; }
        frame 17 { x: 21.5; y: 32.4000015; skew-x: -1.20000005; skew-y: 1.5; scale-x: 1.12199998; scale-y: 0.958000004; }
        frame 18 { x: 20.2999992; y: 32.0999985; skew-x: -1.39999998; skew-y: 1.79999995; scale-x: 1.18700004; scale-y: 0.99000001; }
        frame 19 { x: 19.2999992; y: 31.8999996; skew-x: -1.70000005; skew-y: 2; scale-x: 1.25100005; scale-y: 1.02100003; }
        frame 20 { x: 18.1000004; y: 31.3999996; skew-x: -1.89999998; skew-y: 2.29999995; scale-x: 1.31500006; scale-y: 1.05299997; }
        frame 21 { x: 17; y: 31.2000008; skew-x: -2.20000005; skew-y: 2.5999999; scale-x: 1.38; scale-y: 1.08500004; }
        frame 22 { x: 16; y: 30.8999996; skew-x: -2.4000001; skew-y: 3; scale-x: 1.44400001; scale-y: 1.11600006; }
        frame 23 { x: 14.8000002; y: 30.5; skew-x: -2.70000005; skew-y: 3.29999995; scale-x: 1.50899994; scale-y: 1.148; }
        frame 24 { x: 13.6999998; y: 30.6000004; skew-x: -3.0999999; skew-y: 3.5999999; scale-x: 1.57299995; scale-y: 1.17999995; }
    }
    Track {
        source-name: "Jalapeno_eye1";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 21.2999992; y: 19.2000008; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_JALAPENO_EYE1; }
        frame 6 { x: -10000; y: 19.7000008; scale-x: -10000; scale-y: 0.754000008; cel: -10000; image: none; }
        frame 7 { y: 20.2999992; scale-y: 0.707000017; }
        frame 8 { y: 20.7999992; scale-y: 0.661000013; }
        frame 9 { y: 20.2999992; scale-y: 0.707000017; }
        frame 10 { y: 19.7000008; scale-y: 0.754000008; }
        frame 11 { y: 19.2000008; scale-y: 0.800000012; }
        frame 12 { y: -10000; scale-y: -10000; }
        frame 13 { x: 20.1000004; y: 17.7000008; scale-x: 0.851000011; scale-y: 0.860000014; }
        frame 14 { x: 18.8999996; y: 16.2000008; scale-x: 0.901000023; scale-y: 0.920000017; }
        frame 15 { x: 17.7000008; y: 14.8000002; scale-x: 0.952000022; scale-y: 0.980000019; }
        frame 16 { x: 16.6000004; y: 13.3000002; scale-x: 1.00199997; scale-y: 1.03900003; }
        frame 17 { x: 15.3000002; y: 11.8000002; scale-x: 1.05299997; scale-y: 1.09899998; }
        frame 18 { x: 14.1999998; y: 10.3000002; scale-x: 1.10399997; scale-y: 1.15900004; }
        frame 19 { x: 13; y: 8.89999962; scale-x: 1.15400004; scale-y: 1.21899998; }
        frame 20 { x: 11.8000002; y: 7.4000001; scale-x: 1.20500004; scale-y: 1.27900004; }
        frame 21 { x: 10.6000004; y: 5.9000001; scale-x: 1.255; scale-y: 1.33899999; }
        frame 22 { x: 9.5; y: 4.5; scale-x: 1.30599999; scale-y: 1.39900005; }
        frame 23 { x: 8.30000019; y: 3; scale-x: 1.35699999; scale-y: 1.45899999; }
        frame 24 { x: 7.0999999; y: 1.5; scale-x: 1.40699995; scale-y: 1.51800001; }
    }
    Track {
        source-name: "Jalapeno_eye2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 41; y: 25; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_JALAPENO_EYE2; }
        frame 6 { x: -10000; y: 25.6000004; scale-x: -10000; scale-y: 0.697000027; cel: -10000; image: none; }
        frame 7 { y: 26.1000004; scale-y: 0.593999982; }
        frame 8 { y: 26.7000008; scale-y: 0.490999997; }
        frame 9 { y: 26.1000004; scale-y: 0.593999982; }
        frame 10 { y: 25.5; scale-y: 0.697000027; }
        frame 11 { y: 25; scale-y: 0.800000012; }
        frame 12 { y: -10000; scale-y: -10000; }
        frame 13 { x: 41.2000008; y: 23.7999992; scale-x: 0.867999971; scale-y: 0.861000001; }
        frame 14 { x: 41.4000015; y: 22.5; scale-x: 0.93599999; scale-y: 0.921000004; }
        frame 15 { x: 41.5999985; y: 21.2000008; scale-x: 1.00399995; scale-y: 0.981999993; }
        frame 16 { x: 41.7000008; y: 20; scale-x: 1.07200003; scale-y: 1.04200006; }
        frame 17 { x: 42; y: 18.7000008; scale-x: 1.13999999; scale-y: 1.10300004; }
        frame 18 { x: 42.0999985; y: 17.5; scale-x: 1.20799994; scale-y: 1.16400003; }
        frame 19 { x: 42.2999992; y: 16.2999992; scale-x: 1.27600002; scale-y: 1.22399998; }
        frame 20 { x: 42.5999985; y: 14.8999996; scale-x: 1.34399998; scale-y: 1.28499997; }
        frame 21 { x: 42.7999992; y: 13.6999998; scale-x: 1.41199994; scale-y: 1.34500003; }
        frame 22 { x: 43; y: 12.5; scale-x: 1.48000002; scale-y: 1.40600002; }
        frame 23 { x: 43.0999985; y: 11.1999998; scale-x: 1.54799998; scale-y: 1.46700001; }
        frame 24 { x: 43.2999992; y: 9.89999962; scale-x: 1.61600006; scale-y: 1.52699995; }
    }
    Track {
        source-name: "Jalapeno_cheek";
        frame-count: 25;
        frame 0 { x: 42.0999985; y: 29.1000004; scale-x: 0.630999982; scale-y: 0.800000012; image: IMAGE_REANIM_JALAPENO_CHEEK; }
        frame 1 { x: 41.9000015; y: 27.8999996; scale-x: -10000; scale-y: 0.925000012; image: none; }
        frame 2 { x: 42.0999985; y: 29.1000004; scale-y: 0.800000012; }
        frame 3 { x: -10000; y: -10000; scale-y: -10000; }
        frame 4 { x: 41.9000015; y: 27.8999996; scale-y: 0.925000012; }
        frame 5 { x: 42.0999985; y: 29.1000004; scale-y: 0.800000012; }
        frame 6 { x: 41.7000008; y: 28.8999996; scale-x: 0.698000014; scale-y: 0.755999982; }
        frame 7 { x: 41.4000015; y: 28.6000004; scale-x: 0.764999986; scale-y: 0.711000025; }
        frame 8 { x: 41.2000008; y: 28.3999996; scale-x: 0.83099997; scale-y: 0.666999996; }
        frame 9 { x: 41.5999985; y: 28.6000004; scale-x: 0.764999986; scale-y: 0.711000025; }
        frame 10 { x: 41.7999992; y: 28.8999996; scale-x: 0.698000014; scale-y: 0.755999982; }
        frame 11 { x: 42.0999985; y: 29.1000004; scale-x: 0.630999982; scale-y: 0.800000012; }
        frame 12 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 42.2000008; y: 28.1000004; skew-y: 1.79999995; scale-x: 0.690999985; scale-y: 0.828000009; }
        frame 14 { x: 42.4000015; y: 27.2000008; skew-x: 0.300000012; skew-y: 3.5; scale-x: 0.750999987; scale-y: 0.856000006; }
        frame 15 { x: 42.5; y: 26.2999992; skew-x: 0.5; skew-y: 5.30000019; scale-x: 0.81099999; scale-y: 0.88499999; }
        frame 16 { x: 42.7000008; y: 25.2999992; skew-x: -10000; skew-y: 7.0999999; scale-x: 0.870999992; scale-y: 0.912999988; }
        frame 17 { x: 42.9000015; y: 24.3999996; skew-x: 0.800000012; skew-y: 9; scale-x: 0.930999994; scale-y: 0.940999985; }
        frame 18 { x: 43.0999985; y: 23.3999996; skew-x: 1; skew-y: 10.8000002; scale-x: 0.991999984; scale-y: 0.968999982; }
        frame 19 { x: 43.2999992; y: 22.6000004; skew-x: 1.10000002; skew-y: 12.5; scale-x: 1.05200005; scale-y: 0.996999979; }
        frame 20 { x: 43.5; y: 21.7000008; skew-x: 1.29999995; skew-y: 14.3000002; scale-x: 1.11199999; scale-y: 1.02499998; }
        frame 21 { x: 43.5999985; y: 20.7000008; skew-x: 1.5; skew-y: 16.1000004; scale-x: 1.17200005; scale-y: 1.05299997; }
        frame 22 { x: 43.9000015; y: 19.7999992; skew-x: 1.60000002; skew-y: 18; scale-x: 1.23199999; scale-y: 1.08200002; }
        frame 23 { x: 44.0999985; y: 18.7999992; skew-x: 1.79999995; skew-y: 19.7999992; scale-x: 1.29200006; scale-y: 1.11000001; }
        frame 24 { x: 44.2999992; y: 17.7999992; skew-x: 2.0999999; skew-y: 21.6000004; scale-x: 1.352; scale-y: 1.13900006; }
    }
    Track {
        source-name: "Jalapeno_eyebrow1";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 22.2999992; y: 15.8000002; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_JALAPENO_EYEBROW1; }
        frame 6 { x: 23.2000008; y: 16; skew-x: 5; skew-y: 4.80000019; scale-x: 0.837000012; scale-y: 0.79400003; cel: -10000; image: none; }
        frame 7 { x: 24; y: -10000; skew-x: 10; skew-y: 9.80000019; scale-x: 0.875; scale-y: 0.788999975; }
        frame 8 { x: 25; y: 15.8999996; skew-x: 15; skew-y: 15; scale-x: 0.912999988; scale-y: 0.783999979; }
        frame 9 { x: 24; y: 15.8000002; skew-x: 10; skew-y: 9.80000019; scale-x: 0.875; scale-y: 0.788999975; }
        frame 10 { x: 23; y: -10000; skew-x: 5; skew-y: 4.80000019; scale-x: 0.837000012; scale-y: 0.79400003; }
        frame 11 { x: 22.2999992; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 12 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 21.1000004; y: 14.5; skew-x: 1.29999995; skew-y: 0.5; scale-x: 0.888000011; scale-y: 0.870000005; }
        frame 14 { x: 20.1000004; y: 13; skew-x: 2.79999995; skew-y: 1.10000002; scale-x: 0.976999998; scale-y: 0.939999998; }
        frame 15 { x: 19; y: 11.6000004; skew-x: 4; skew-y: 1.79999995; scale-x: 1.06500006; scale-y: 1.00999999; }
        frame 16 { x: 17.8999996; y: 10.1999998; skew-x: 5.5; skew-y: 2.29999995; scale-x: 1.153; scale-y: 1.08000004; }
        frame 17 { x: 16.7999992; y: 8.60000038; skew-x: 6.80000019; skew-y: 3; scale-x: 1.24100006; scale-y: 1.14900005; }
        frame 18 { x: 15.8000002; y: 7; skew-x: 8.30000019; skew-y: 3.5; scale-x: 1.329; scale-y: 1.21899998; }
        frame 19 { x: 14.8000002; y: 5.5; skew-x: 9.5; skew-y: 4.0999999; scale-x: 1.41799998; scale-y: 1.28900003; }
        frame 20 { x: 13.8000002; y: 3.79999995; skew-x: 11; skew-y: 4.80000019; scale-x: 1.50600004; scale-y: 1.35899997; }
        frame 21 { x: 12.8000002; y: 2.20000005; skew-x: 12.3000002; skew-y: 5.30000019; scale-x: 1.59399998; scale-y: 1.42900002; }
        frame 22 { x: 11.8999996; y: 0.5; skew-x: 13.8000002; skew-y: 6; scale-x: 1.68200004; scale-y: 1.49899995; }
        frame 23 { x: 11; y: -1; skew-x: 15.1000004; skew-y: 6.5; scale-x: 1.76999998; scale-y: 1.56799996; }
        frame 24 { x: 10.1999998; y: -2.9000001; skew-x: 16.5; skew-y: 7.30000019; scale-x: 1.86000001; scale-y: 1.63900006; }
    }
    Track {
        source-name: "Jalapeno_eyebrow2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 39.9000015; y: 21.2999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_JALAPENO_EYEBROW2; }
        frame 6 { x: 40; y: 21.8999996; scale-x: 0.841000021; scale-y: 0.774999976; cel: -10000; image: none; }
        frame 7 { x: 40.0999985; y: 22.5; scale-x: 0.882000029; scale-y: 0.75; }
        frame 8 { x: -10000; y: 23.1000004; scale-x: 0.922999978; scale-y: 0.725000024; }
        frame 9 { x: 40; y: 22.5; scale-x: 0.882000029; scale-y: 0.75; }
        frame 10 { x: 39.9000015; y: 21.8999996; scale-x: 0.841000021; scale-y: 0.774999976; }
        frame 11 { x: -10000; y: 21.2999992; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 12 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 40.0999985; y: 20.2000008; skew-x: 0.800000012; skew-y: 0.300000012; scale-x: 0.864000022; scale-y: 0.865999997; }
        frame 14 { x: 40.4000015; y: 19; skew-x: 1.5; skew-y: 0.5; scale-x: 0.926999986; scale-y: 0.931999981; }
        frame 15 { x: 40.5999985; y: 18; skew-x: 2.29999995; skew-y: 0.800000012; scale-x: 0.990999997; scale-y: 0.998000026; }
        frame 16 { x: 40.9000015; y: 16.8999996; skew-x: 3; skew-y: 1; scale-x: 1.05499995; scale-y: 1.06400001; }
        frame 17 { x: 41.0999985; y: 15.6999998; skew-x: 3.79999995; skew-y: 1.29999995; scale-x: 1.11899996; scale-y: 1.13100004; }
        frame 18 { x: 41.2999992; y: 14.5; skew-x: 4.5; skew-y: 1.5; scale-x: 1.18200004; scale-y: 1.19700003; }
        frame 19 { x: 41.5999985; y: 13.3999996; skew-x: 5.30000019; skew-y: 1.79999995; scale-x: 1.24600005; scale-y: 1.26300001; }
        frame 20 { x: 41.7999992; y: 12.1999998; skew-x: 6; skew-y: 2; scale-x: 1.30999994; scale-y: 1.329; }
        frame 21 { x: 42; y: 11; skew-x: 6.80000019; skew-y: 2.29999995; scale-x: 1.37300003; scale-y: 1.39499998; }
        frame 22 { x: 42.2999992; y: 9.80000019; skew-x: 7.5; skew-y: 2.5999999; scale-x: 1.43700004; scale-y: 1.46099997; }
        frame 23 { x: 42.5999985; y: 8.60000038; skew-x: 8.30000019; skew-y: 2.79999995; scale-x: 1.50100005; scale-y: 1.52699995; }
        frame 24 { x: 43; y: 7.5999999; skew-x: 9; skew-y: 3.20000005; scale-x: 1.56500006; scale-y: 1.59399998; }
    }
}
