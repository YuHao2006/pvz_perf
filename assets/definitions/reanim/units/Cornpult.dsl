export component Cornpult {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 77;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 24 { cel: -1; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
        frame 58 { cel: -1; }
        frame 59 { cel: -10000; }
    }
    Track {
        source-name: "anim_full_idle";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 58 { cel: 0; }
        frame 59 { cel: -10000; }
    }
    Track {
        source-name: "Cornpult_husk5";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 55.7000008; y: 55.5; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSK5; }
        frame 6 { x: 55.4000015; y: 55.2999992; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.787; scale-y: 0.813000023; cel: -10000; image: none; }
        frame 7 { x: 55.0999985; y: 55; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: 0.773999989; scale-y: 0.825999975; }
        frame 8 { x: 54.7999992; y: 54.7999992; skew-x: -4.19999981; skew-y: -4.19999981; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 9 { x: 55; y: 54.9000015; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: 0.776000023; scale-y: 0.832000017; }
        frame 10 { x: 55.2999992; y: 55; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: 0.790000021; scale-y: 0.825999975; }
        frame 11 { x: 55.5999985; y: 55.0999985; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.805000007; scale-y: 0.819000006; }
        frame 12 { x: 55.7999992; y: 55.2999992; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.819000006; scale-y: 0.813000023; }
        frame 13 { x: 56.0999985; y: 55.4000015; skew-x: -0.5; skew-y: -0.5; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 14 { x: 56.4000015; y: 55.5; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 15 { x: 57.4000015; y: 56.0999985; skew-x: 0.800000012; skew-y: 12.3000002; scale-x: 0.882000029; scale-y: 0.814999998; }
        frame 16 { x: 58.4000015; y: 56.7000008; skew-x: 1.5; skew-y: 24.6000004; scale-x: 0.916999996; scale-y: 0.829999983; }
        frame 17 { x: 59.2999992; y: 57.5; skew-x: 2.5; skew-y: 37; scale-x: 0.952000022; scale-y: 0.846000016; }
        frame 18 { x: 58.7000008; y: 57.0999985; skew-x: 2; skew-y: 30.7999992; scale-x: 0.926999986; scale-y: 0.837000012; }
        frame 19 { x: 58; y: 56.7000008; skew-x: 1.5; skew-y: 24.6000004; scale-x: 0.90200001; scale-y: 0.829999983; }
        frame 20 { x: 57.5; y: 56.4000015; skew-x: 1.29999995; skew-y: 18.2999992; scale-x: 0.875999987; scale-y: 0.822000027; }
        frame 21 { x: 56.7999992; y: 56; skew-x: 0.800000012; skew-y: 12.3000002; scale-x: 0.851000011; scale-y: 0.814999998; }
        frame 22 { x: 56.2000008; y: 55.7000008; skew-x: 0.300000012; skew-y: 6; scale-x: 0.824999988; scale-y: 0.806999981; }
        frame 23 { x: 55.7000008; y: 55.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 55.5; y: 55.4000015; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.791999996; scale-y: 0.808000028; }
        frame 26 { x: 55.4000015; y: 55.2000008; skew-x: -1.5; skew-y: -1.5; scale-x: 0.785000026; scale-y: 0.814999998; }
        frame 27 { x: 55.0999985; y: 55; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.77700001; scale-y: 0.823000014; }
        frame 28 { x: 55; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.768999994; scale-y: 0.83099997; }
        frame 29 { x: 54.7999992; y: 54.7999992; skew-x: -4.19999981; skew-y: -4.19999981; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 30 { x: 55.2000008; y: 55.0999985; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.781000018; scale-y: 0.819000006; }
        frame 31 { x: 55.7000008; y: 55.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 32 { x: 56.5; y: 56; skew-x: 0.5; skew-y: 9.10000038; scale-x: 0.838; scale-y: 0.81099999; }
        frame 33 { x: 57.5; y: 56.4000015; skew-x: 1.29999995; skew-y: 18.2999992; scale-x: 0.875999987; scale-y: 0.822000027; }
        frame 34 { x: 58.5; y: 57; skew-x: 1.79999995; skew-y: 27.6000004; scale-x: 0.913999975; scale-y: 0.833000004; }
        frame 35 { x: 59.2999992; y: 57.5; skew-x: 2.5; skew-y: 37; scale-x: 0.952000022; scale-y: 0.846000016; }
        frame 36 { x: 59.2000008; y: 57.5999985; skew-x: -10000; skew-y: 36.9000015; scale-x: -10000; scale-y: 0.845000029; }
        frame 37 { x: 59.2999992; y: 57.5; skew-y: 37; scale-y: 0.846000016; }
        frame 38 { x: 59.2000008; y: 57.5999985; skew-y: 36.9000015; scale-y: 0.845000029; }
        frame 39 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 44 { x: 59.2999992; y: 57.5; skew-y: 37; scale-y: 0.846000016; }
        frame 45 { x: -10000; y: 57.5999985; skew-y: 36.9000015; scale-y: 0.845000029; }
        frame 46 { y: -10000; skew-y: -10000; scale-y: 0.843999982; }
        frame 47 { scale-y: -10000; }
        frame 48 { x: 59.2000008; }
        frame 49 { x: -10000; }
        frame 51 { scale-y: 0.845000029; }
        frame 52 { x: 58.5999985; y: 57.2000008; skew-x: 2; skew-y: 30.6000004; scale-x: 0.926999986; scale-y: 0.836000025; }
        frame 53 { x: 58; y: 56.7999992; skew-x: 1.5; skew-y: 24.6000004; scale-x: 0.901000023; scale-y: 0.828999996; }
        frame 54 { x: 57.5; y: 56.4000015; skew-x: 1.29999995; skew-y: 18.2999992; scale-x: 0.875999987; scale-y: 0.822000027; }
        frame 55 { x: 56.7999992; y: 56; skew-x: 0.800000012; skew-y: 12.3000002; scale-x: 0.851000011; scale-y: 0.81400001; }
        frame 56 { x: 56.2000008; y: 55.7999992; skew-x: 0.300000012; skew-y: 6; scale-x: 0.824999988; scale-y: 0.806999981; }
        frame 57 { x: 55.7000008; y: 55.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 55.4000015; y: 55.2999992; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.787; scale-y: 0.813000023; }
        frame 60 { x: 55.0999985; y: 55; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: 0.773999989; scale-y: 0.825999975; }
        frame 61 { x: 54.7999992; y: 54.7999992; skew-x: -4.19999981; skew-y: -4.19999981; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 62 { x: 55; y: 54.9000015; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: 0.776000023; scale-y: 0.832000017; }
        frame 63 { x: 55.2999992; y: 55; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: 0.790000021; scale-y: 0.825999975; }
        frame 64 { x: 55.5999985; y: 55.0999985; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.805000007; scale-y: 0.819000006; }
        frame 65 { x: 55.7999992; y: 55.2999992; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.819000006; scale-y: 0.813000023; }
        frame 66 { x: 56.0999985; y: 55.4000015; skew-x: -0.5; skew-y: -0.5; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 67 { x: 56.4000015; y: 55.5; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 68 { x: 57.4000015; y: 56.0999985; skew-x: 0.800000012; skew-y: 12.3000002; scale-x: 0.882000029; scale-y: 0.814999998; }
        frame 69 { x: 58.4000015; y: 56.7000008; skew-x: 1.5; skew-y: 24.6000004; scale-x: 0.916999996; scale-y: 0.829999983; }
        frame 70 { x: 59.2999992; y: 57.5; skew-x: 2.5; skew-y: 37; scale-x: 0.952000022; scale-y: 0.846000016; }
        frame 71 { x: 58.7000008; y: 57.0999985; skew-x: 2; skew-y: 30.7999992; scale-x: 0.926999986; scale-y: 0.837000012; }
        frame 72 { x: 58; y: 56.7000008; skew-x: 1.5; skew-y: 24.6000004; scale-x: 0.90200001; scale-y: 0.829999983; }
        frame 73 { x: 57.5; y: 56.4000015; skew-x: 1.29999995; skew-y: 18.2999992; scale-x: 0.875999987; scale-y: 0.822000027; }
        frame 74 { x: 56.7999992; y: 56; skew-x: 0.800000012; skew-y: 12.3000002; scale-x: 0.851000011; scale-y: 0.814999998; }
        frame 75 { x: 56.2000008; y: 55.7000008; skew-x: 0.300000012; skew-y: 6; scale-x: 0.824999988; scale-y: 0.806999981; }
        frame 76 { x: 55.7000008; y: 55.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cornpult_husk6";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 16.7999992; y: 55.0999985; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSK6; }
        frame 6 { x: 17.2999992; y: 54.2999992; skew-x: 2; skew-y: 2; scale-x: 0.787; scale-y: 0.813000023; cel: -10000; image: none; }
        frame 7 { x: 17.8999996; y: 53.5; skew-x: 4; skew-y: 4; scale-x: 0.773999989; scale-y: 0.825999975; }
        frame 8 { x: 18.6000004; y: 52.7999992; skew-x: 6.0999999; skew-y: 6.0999999; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 9 { x: 18; y: 53.0999985; skew-x: 5; skew-y: 5; scale-x: 0.776000023; scale-y: 0.832000017; }
        frame 10 { x: 17.5; y: 53.5999985; skew-x: 4; skew-y: 4; scale-x: 0.790000021; scale-y: 0.825999975; }
        frame 11 { x: 16.8999996; y: 54; skew-x: 3; skew-y: 3; scale-x: 0.80400002; scale-y: 0.819000006; }
        frame 12 { x: 16.2999992; y: 54.4000015; skew-x: 2; skew-y: 2; scale-x: 0.819000006; scale-y: 0.813000023; }
        frame 13 { x: 15.8000002; y: 54.7999992; skew-x: 1; skew-y: 1; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 14 { x: 15.1999998; y: 55.0999985; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 15 { x: 14.3000002; y: 55.7999992; skew-x: -1.20000005; skew-y: -10000; scale-x: 0.885999978; scale-y: 0.749000013; }
        frame 16 { x: 13.5; y: 56.5; skew-x: -2.70000005; scale-x: 0.924000025; scale-y: 0.698000014; }
        frame 17 { x: 12.5; y: 57.2999992; skew-x: -4.4000001; scale-x: 0.962000012; scale-y: 0.647000015; }
        frame 18 { x: 13.1999998; y: 56.9000015; skew-x: -3.5; scale-x: 0.935000002; scale-y: 0.671999991; }
        frame 19 { x: 13.8999996; y: 56.5; skew-x: -2.70000005; scale-x: 0.907999992; scale-y: 0.698000014; }
        frame 20 { x: 14.6000004; y: 56.0999985; skew-x: -2; scale-x: 0.880999982; scale-y: 0.72299999; }
        frame 21 { x: 15.3000002; y: 55.7999992; skew-x: -1.20000005; scale-x: 0.853999972; scale-y: 0.749000013; }
        frame 22 { x: 16; y: 55.4000015; skew-x: -0.5; scale-x: 0.827000022; scale-y: 0.773999989; }
        frame 23 { x: 16.7999992; y: 55.0999985; skew-x: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 17.1000004; y: 54.5999985; skew-x: 1.10000002; skew-y: 1.10000002; scale-x: 0.791999996; scale-y: 0.808000028; }
        frame 26 { x: 17.3999996; y: 54.0999985; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.785000026; scale-y: 0.814999998; }
        frame 27 { x: 17.7999992; y: 53.7999992; skew-x: 3.5; skew-y: 3.5; scale-x: 0.77700001; scale-y: 0.823000014; }
        frame 28 { x: 18.2000008; y: 53.2000008; skew-x: 4.80000019; skew-y: 4.80000019; scale-x: 0.768999994; scale-y: 0.83099997; }
        frame 29 { x: 18.6000004; y: 52.7999992; skew-x: 6.0999999; skew-y: 6.0999999; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 30 { x: 17.7999992; y: 54; skew-x: 3; skew-y: 3; scale-x: 0.781000018; scale-y: 0.819000006; }
        frame 31 { x: 16.7999992; y: 55.0999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 32 { x: 15.6999998; y: 55.5999985; skew-x: -0.899999976; skew-y: -10000; scale-x: 0.839999974; scale-y: 0.762000024; }
        frame 33 { x: 14.6999998; y: 56.0999985; skew-x: -2; scale-x: 0.880999982; scale-y: 0.72299999; }
        frame 34 { x: 13.6000004; y: 56.7000008; skew-x: -3.20000005; scale-x: 0.921000004; scale-y: 0.685000002; }
        frame 35 { x: 12.5; y: 57.2999992; skew-x: -4.4000001; scale-x: 0.962000012; scale-y: 0.647000015; }
        frame 36 { x: -10000; y: -10000; skew-x: -4.19999981; scale-x: -10000; scale-y: -10000; }
        frame 37 { skew-x: -4.4000001; }
        frame 38 { skew-x: -4.19999981; }
        frame 39 { skew-x: -10000; }
        frame 44 { skew-x: -4.4000001; }
        frame 45 { skew-x: -4.19999981; }
        frame 46 { skew-x: -10000; }
        frame 48 { x: 12.3999996; }
        frame 49 { x: -10000; }
        frame 50 { y: 57.2000008; }
        frame 51 { x: 12.5; y: 57.2999992; }
        frame 52 { x: 13.1999998; y: 56.9000015; skew-x: -3.4000001; scale-x: 0.935000002; scale-y: 0.671999991; }
        frame 53 { x: 13.8000002; y: 56.5; skew-x: -2.70000005; scale-x: 0.907999992; scale-y: 0.698000014; }
        frame 54 { x: 14.6000004; y: 56.0999985; skew-x: -1.89999998; scale-x: 0.880999982; scale-y: 0.72299999; }
        frame 55 { x: 15.3000002; y: 55.7999992; skew-x: -1.20000005; scale-x: 0.853999972; scale-y: 0.749000013; }
        frame 56 { x: 16; y: 55.4000015; skew-x: -0.5; scale-x: 0.827000022; scale-y: 0.773999989; }
        frame 57 { x: 16.7999992; y: 55.0999985; skew-x: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 17.2999992; y: 54.2999992; skew-x: 2; skew-y: 2; scale-x: 0.787; scale-y: 0.813000023; }
        frame 60 { x: 17.8999996; y: 53.5; skew-x: 4; skew-y: 4; scale-x: 0.773999989; scale-y: 0.825999975; }
        frame 61 { x: 18.6000004; y: 52.7999992; skew-x: 6.0999999; skew-y: 6.0999999; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 62 { x: 18; y: 53.0999985; skew-x: 5; skew-y: 5; scale-x: 0.776000023; scale-y: 0.832000017; }
        frame 63 { x: 17.5; y: 53.5999985; skew-x: 4; skew-y: 4; scale-x: 0.790000021; scale-y: 0.825999975; }
        frame 64 { x: 16.8999996; y: 54; skew-x: 3; skew-y: 3; scale-x: 0.80400002; scale-y: 0.819000006; }
        frame 65 { x: 16.2999992; y: 54.4000015; skew-x: 2; skew-y: 2; scale-x: 0.819000006; scale-y: 0.813000023; }
        frame 66 { x: 15.8000002; y: 54.7999992; skew-x: 1; skew-y: 1; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 67 { x: 15.1999998; y: 55.0999985; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 68 { x: 14.3000002; y: 55.7999992; skew-x: -1.20000005; skew-y: -10000; scale-x: 0.885999978; scale-y: 0.749000013; }
        frame 69 { x: 13.5; y: 56.5; skew-x: -2.70000005; scale-x: 0.924000025; scale-y: 0.698000014; }
        frame 70 { x: 12.5; y: 57.2999992; skew-x: -4.4000001; scale-x: 0.962000012; scale-y: 0.647000015; }
        frame 71 { x: 13.1999998; y: 56.9000015; skew-x: -3.5; scale-x: 0.935000002; scale-y: 0.671999991; }
        frame 72 { x: 13.8999996; y: 56.5; skew-x: -2.70000005; scale-x: 0.907999992; scale-y: 0.698000014; }
        frame 73 { x: 14.6000004; y: 56.0999985; skew-x: -2; scale-x: 0.880999982; scale-y: 0.72299999; }
        frame 74 { x: 15.3000002; y: 55.7999992; skew-x: -1.20000005; scale-x: 0.853999972; scale-y: 0.749000013; }
        frame 75 { x: 16; y: 55.4000015; skew-x: -0.5; scale-x: 0.827000022; scale-y: 0.773999989; }
        frame 76 { x: 16.7999992; y: 55.0999985; skew-x: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 23.3999996; y: 18.2000008; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_BODY; }
        frame 6 { x: 23.2000008; y: 18.6000004; scale-x: 0.806999981; scale-y: 0.795000017; cel: -10000; image: none; }
        frame 7 { x: 23; y: 18.8999996; scale-x: 0.813000023; scale-y: 0.790000021; }
        frame 8 { x: 22.8999996; y: 19.2999992; scale-x: 0.819999993; scale-y: 0.783999979; }
        frame 9 { x: 22.7000008; y: 19.6000004; scale-x: 0.827000022; scale-y: 0.778999984; }
        frame 10 { x: 22.5; y: 20; scale-x: 0.833999991; scale-y: 0.773999989; }
        frame 11 { x: 22.2999992; y: 20.2999992; scale-x: 0.839999974; scale-y: 0.768999994; }
        frame 12 { x: 22.1000004; y: 20.7000008; scale-x: 0.847000003; scale-y: 0.763000011; }
        frame 13 { x: 21.8999996; y: 21; scale-x: 0.853999972; scale-y: 0.758000016; }
        frame 14 { x: 21.7999992; y: 21.3999996; scale-x: 0.861000001; scale-y: 0.753000021; }
        frame 15 { x: 22; y: 21; scale-x: 0.853999972; scale-y: 0.758000016; }
        frame 16 { x: 22.1000004; y: 20.7000008; scale-x: 0.847000003; scale-y: 0.763000011; }
        frame 17 { x: 22.2999992; y: 20.2999992; scale-x: 0.839999974; scale-y: 0.768999994; }
        frame 18 { x: 22.5; y: 20; scale-x: 0.833999991; scale-y: 0.773999989; }
        frame 19 { x: 22.7000008; y: 19.6000004; scale-x: 0.827000022; scale-y: 0.778999984; }
        frame 20 { x: 22.8999996; y: 19.2999992; scale-x: 0.819999993; scale-y: 0.783999979; }
        frame 21 { x: 23; y: 18.8999996; scale-x: 0.813000023; scale-y: 0.790000021; }
        frame 22 { x: 23.2000008; y: 18.6000004; scale-x: 0.806999981; scale-y: 0.795000017; }
        frame 23 { x: 23.3999996; y: 18.2000008; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 21.6000004; y: 18.1000004; skew-y: -1.70000005; scale-y: 0.801999986; }
        frame 26 { x: 19.7000008; y: -10000; skew-y: -3.70000005; scale-y: 0.80400002; }
        frame 27 { x: 17.7999992; skew-y: -5.69999981; scale-y: 0.806999981; }
        frame 28 { x: 16.1000004; skew-y: -7.5; scale-y: 0.809000015; }
        frame 29 { x: 14.1999998; y: 18.2000008; skew-y: -9.5; scale-y: 0.81099999; }
        frame 30 { x: 15.8999996; y: -10000; skew-y: -7.69999981; scale-y: 0.808000028; }
        frame 31 { x: 17.7000008; skew-y: -5.9000001; scale-y: 0.80400002; }
        frame 32 { x: 20.7000008; y: 18.1000004; skew-y: -2.70000005; scale-y: -10000; }
        frame 33 { x: 23.3999996; y: 18; skew-y: 0; scale-y: 0.805000007; }
        frame 34 { x: 26.2999992; y: 18.1000004; skew-y: 3; scale-y: -10000; }
        frame 35 { x: 29.2999992; y: 18.2000008; skew-y: 6.19999981; }
        frame 36 { x: 29.8999996; y: -10000; skew-y: 6.80000019; scale-y: 0.805999994; }
        frame 37 { x: 30.7000008; skew-y: 7.69999981; scale-y: 0.806999981; }
        frame 38 { x: 30.3999996; skew-y: 7.30000019; scale-y: -10000; }
        frame 39 { x: 30.2999992; skew-y: -10000; scale-y: 0.805999994; }
        frame 40 { x: 30; skew-y: 7; scale-y: -10000; }
        frame 41 { x: 29.8999996; skew-y: 6.80000019; scale-y: 0.805000007; }
        frame 42 { x: 29.6000004; skew-y: 6.5; scale-y: -10000; }
        frame 43 { x: 29.3999996; skew-y: 6.30000019; }
        frame 44 { x: 29.2999992; skew-y: 6.19999981; }
        frame 45 { x: 29.3999996; skew-y: 6.30000019; }
        frame 46 { x: -10000; skew-y: -10000; }
        frame 48 { x: 29.6000004; skew-y: 6.5; }
        frame 49 { x: 29.7000008; skew-y: -10000; }
        frame 50 { x: -10000; skew-y: 6.5999999; }
        frame 51 { x: 29.8999996; skew-y: 6.80000019; scale-y: 0.805999994; }
        frame 52 { x: 28.7999992; skew-y: 5.5; scale-y: 0.80400002; }
        frame 53 { x: 27.7999992; y: 18.1000004; skew-y: 4.5; scale-y: -10000; }
        frame 54 { x: 26.6000004; y: 18.2000008; skew-y: 3.29999995; scale-y: 0.802999973; }
        frame 55 { x: 25.6000004; y: -10000; skew-y: 2.29999995; scale-y: 0.801999986; }
        frame 56 { x: 24.5; y: 18.1000004; skew-y: 1; scale-y: 0.800999999; }
        frame 57 { x: 23.3999996; y: 18.2000008; skew-y: 0; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 59 { x: 23.2000008; y: 18.6000004; scale-x: 0.806999981; scale-y: 0.795000017; }
        frame 60 { x: 23; y: 18.8999996; scale-x: 0.813000023; scale-y: 0.790000021; }
        frame 61 { x: 22.8999996; y: 19.2999992; scale-x: 0.819999993; scale-y: 0.783999979; }
        frame 62 { x: 22.7000008; y: 19.6000004; scale-x: 0.827000022; scale-y: 0.778999984; }
        frame 63 { x: 22.5; y: 20; scale-x: 0.833999991; scale-y: 0.773999989; }
        frame 64 { x: 22.2999992; y: 20.2999992; scale-x: 0.839999974; scale-y: 0.768999994; }
        frame 65 { x: 22.1000004; y: 20.7000008; scale-x: 0.847000003; scale-y: 0.763000011; }
        frame 66 { x: 21.8999996; y: 21; scale-x: 0.853999972; scale-y: 0.758000016; }
        frame 67 { x: 21.7999992; y: 21.3999996; scale-x: 0.861000001; scale-y: 0.753000021; }
        frame 68 { x: 22; y: 21; scale-x: 0.853999972; scale-y: 0.758000016; }
        frame 69 { x: 22.1000004; y: 20.7000008; scale-x: 0.847000003; scale-y: 0.763000011; }
        frame 70 { x: 22.2999992; y: 20.2999992; scale-x: 0.839999974; scale-y: 0.768999994; }
        frame 71 { x: 22.5; y: 20; scale-x: 0.833999991; scale-y: 0.773999989; }
        frame 72 { x: 22.7000008; y: 19.6000004; scale-x: 0.827000022; scale-y: 0.778999984; }
        frame 73 { x: 22.8999996; y: 19.2999992; scale-x: 0.819999993; scale-y: 0.783999979; }
        frame 74 { x: 23; y: 18.8999996; scale-x: 0.813000023; scale-y: 0.790000021; }
        frame 75 { x: 23.2000008; y: 18.6000004; scale-x: 0.806999981; scale-y: 0.795000017; }
        frame 76 { x: 23.3999996; y: 18.2000008; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cornpult_blink";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { x: 45.7999992; y: 46.2000008; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_BLINK1; }
        frame 2 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_CORNPULT_BLINK2; }
        frame 3 { image: IMAGE_REANIM_CORNPULT_BLINK1; }
        frame 4 { cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 36 { x: 49.2000008; skew-y: 10.3999996; scale-y: 0.813000023; cel: 0; }
        frame 37 { x: 49.0999985; skew-y: 9.10000038; scale-y: 0.810000002; cel: -10000; image: IMAGE_REANIM_CORNPULT_BLINK2; }
        frame 38 { x: 48.9000015; skew-y: 9; scale-y: -10000; image: none; }
        frame 39 { x: 48.7000008; skew-y: -10000; }
        frame 40 { x: 48.5; skew-y: 9.10000038; }
        frame 41 { x: 48.5999985; skew-y: 9; }
        frame 42 { x: 48.7000008; skew-y: -10000; }
        frame 43 { x: 48.7999992; }
        frame 44 { x: 48.9000015; skew-y: 9.10000038; }
        frame 45 { x: 48.5999985; skew-y: 10.3999996; scale-y: 0.813000023; image: IMAGE_REANIM_CORNPULT_BLINK1; }
        frame 46 { x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 47 { cel: -10000; }
    }
    Track {
        source-name: "Cabbagepult_basket";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -16.5; y: 4.5999999; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.600000024; scale-y: 0.600000024; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_BASKET; }
        frame 6 { x: -14.6999998; y: -0.200000003; skew-x: 11; skew-y: 11; scale-x: 0.598999977; scale-y: 0.598999977; cel: -10000; image: none; }
        frame 7 { x: -12.6000004; y: -4.9000001; skew-x: 18.1000004; skew-y: 18.1000004; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: -13.6999998; y: -1.29999995; skew-x: 13; skew-y: 13; }
        frame 9 { x: -14.6999998; y: 2.29999995; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 10 { x: -15.6999998; y: 6.30000019; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 11 { x: -16.3999996; y: 10.1999998; skew-x: -1.5; skew-y: -1.5; }
        frame 12 { x: -16.8999996; y: 14.3000002; skew-x: -6.4000001; skew-y: -6.4000001; }
        frame 13 { x: -17.5; y: 18.5; skew-x: -11.3999996; skew-y: -11.3999996; }
        frame 14 { x: -17.7999992; y: 22.7000008; skew-x: -16.5; skew-y: -16.5; }
        frame 15 { x: -18.1000004; y: 24.5; skew-x: -17.5; skew-y: -17.5; }
        frame 16 { x: -18.5; y: 26.2999992; skew-x: -18.7000008; skew-y: -18.7000008; }
        frame 17 { x: -18.3999996; y: 23.1000004; skew-x: -15.3999996; skew-y: -15.3999996; }
        frame 18 { x: -18.1000004; y: 20; skew-x: -12.1999998; skew-y: -12.1999998; }
        frame 19 { x: -10000; y: 16.8999996; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 20 { x: -17.7999992; y: 13.6000004; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 21 { x: -17.3999996; y: 10.5; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 22 { x: -16.8999996; y: 7.5999999; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -16.5; y: 4.5999999; skew-x: 4.0999999; skew-y: 4.0999999; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: -18.3999996; y: 12.8000002; skew-x: -4.5; skew-y: -4.5; scale-x: 0.598999977; scale-y: 0.598999977; }
        frame 26 { x: -19.7999992; y: 21.2000008; skew-x: -13.1999998; skew-y: -13.1999998; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -20.7999992; y: 30; skew-x: -22.2000008; skew-y: -22.2000008; scale-x: 0.59799999; scale-y: 0.59799999; }
        frame 28 { x: -21.2000008; y: 38.5999985; skew-x: -31; skew-y: -31; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: -21.2999992; y: 47.4000015; skew-x: -39.7000008; skew-y: -39.7000008; }
        frame 30 { x: -20.3999996; y: 49; skew-x: -42.7999992; skew-y: -42.7999992; scale-x: 0.597000003; scale-y: 0.597000003; }
        frame 31 { x: -19.6000004; y: 50.5999985; skew-x: -45.7000008; skew-y: -45.7000008; scale-x: 0.59799999; scale-y: 0.59799999; }
        frame 32 { x: -23.7000008; y: 34.2999992; skew-x: -37.2999992; skew-y: -37.2999992; scale-x: 0.596000016; scale-y: 0.596000016; }
        frame 33 { x: -19.1000004; y: -2.0999999; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 13.5; y: -42.0999985; skew-x: 44.5999985; skew-y: 44.7000008; scale-y: 0.595000029; }
        frame 35 { x: 65.3000031; y: -46.7999992; skew-x: 93; skew-y: 93; scale-x: 0.597000003; scale-y: 0.596000016; }
        frame 36 { x: 74.3000031; y: -43.4000015; skew-x: 105; skew-y: 105; scale-x: 0.596000016; scale-y: 0.595000029; }
        frame 37 { x: 82.5; y: -39.5; skew-x: 117.300003; skew-y: 117.300003; scale-x: 0.597000003; scale-y: -10000; }
        frame 38 { x: 80.1999969; y: -40.5999985; skew-x: 113.800003; skew-y: 113.800003; scale-x: 0.596000016; scale-y: 0.593999982; }
        frame 39 { x: 78; y: -41.7999992; skew-x: 110.300003; skew-y: 110.300003; scale-x: -10000; scale-y: 0.595000029; }
        frame 40 { x: 75.5999985; y: -42.9000015; skew-x: 106.800003; skew-y: 106.800003; scale-y: -10000; }
        frame 41 { x: 73.1999969; y: -44; skew-x: 103.300003; skew-y: 103.300003; scale-x: 0.597000003; }
        frame 42 { x: 70.8000031; y: -45; skew-x: 99.8000031; skew-y: 99.8000031; scale-x: -10000; }
        frame 43 { x: 68.3000031; y: -46; skew-x: 96.3000031; skew-y: 96.3000031; scale-y: 0.596000016; }
        frame 44 { x: 65.8000031; y: -46.7999992; skew-x: 93; skew-y: 93; scale-y: -10000; }
        frame 45 { x: 67.0999985; y: -46.4000015; skew-x: 94.5; skew-y: 94.5; }
        frame 46 { x: 68.3000031; y: -46.0999985; skew-x: 96.3000031; skew-y: 96.3000031; scale-y: 0.595000029; }
        frame 47 { x: 69.5999985; y: -45.7999992; skew-x: 98; skew-y: 98; scale-y: -10000; }
        frame 48 { x: 70.8000031; y: -45.4000015; skew-x: 99.8000031; skew-y: 99.8000031; }
        frame 49 { x: 71.8000031; y: -44.9000015; skew-x: 101.5; skew-y: 101.5; scale-x: 0.596000016; }
        frame 50 { x: 73.3000031; y: -44.5; skew-x: 103.300003; skew-y: 103.300003; scale-x: -10000; }
        frame 51 { x: 74.5; y: -44.0999985; skew-x: 105; skew-y: 105; }
        frame 52 { x: 55.4000015; y: -43.7000008; skew-x: 85.1999969; skew-y: 85.1999969; }
        frame 53 { x: 34.7000008; y: -41.2000008; skew-x: 65.1999969; skew-y: 65.1999969; }
        frame 54 { x: 13.8999996; y: -35.9000015; skew-x: 45.0999985; skew-y: 45.0999985; scale-x: 0.597000003; scale-y: 0.596000016; }
        frame 55 { x: 3; y: -23.3999996; skew-x: 31.2999992; skew-y: 31.2999992; scale-x: -10000; scale-y: 0.597000003; }
        frame 56 { x: -7.0999999; y: -9.80000019; skew-x: 17.6000004; skew-y: 17.6000004; scale-x: 0.59799999; scale-y: 0.59799999; }
        frame 57 { x: -16.5; y: 4.5999999; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -14.6999998; y: -0.200000003; skew-x: 11; skew-y: 11; scale-x: 0.598999977; scale-y: 0.598999977; }
        frame 60 { x: -12.6000004; y: -4.9000001; skew-x: 18.1000004; skew-y: 18.1000004; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -13.6999998; y: -1.29999995; skew-x: 13; skew-y: 13; }
        frame 62 { x: -14.6999998; y: 2.29999995; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 63 { x: -15.6999998; y: 6.30000019; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 64 { x: -16.3999996; y: 10.1999998; skew-x: -1.5; skew-y: -1.5; }
        frame 65 { x: -16.8999996; y: 14.3000002; skew-x: -6.4000001; skew-y: -6.4000001; }
        frame 66 { x: -17.5; y: 18.5; skew-x: -11.3999996; skew-y: -11.3999996; }
        frame 67 { x: -17.7999992; y: 22.7000008; skew-x: -16.5; skew-y: -16.5; }
        frame 68 { x: -18.1000004; y: 24.5; skew-x: -17.5; skew-y: -17.5; }
        frame 69 { x: -18.5; y: 26.2999992; skew-x: -18.7000008; skew-y: -18.7000008; }
        frame 70 { x: -18.3999996; y: 23.1000004; skew-x: -15.3999996; skew-y: -15.3999996; }
        frame 71 { x: -18.1000004; y: 20; skew-x: -12.1999998; skew-y: -12.1999998; }
        frame 72 { x: -10000; y: 16.8999996; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 73 { x: -17.7999992; y: 13.6000004; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 74 { x: -17.3999996; y: 10.5; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 75 { x: -16.8999996; y: 7.5999999; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: -16.5; y: 4.5999999; skew-x: 4.0999999; skew-y: 4.0999999; }
    }
    Track {
        source-name: "Cabbagepult_basket2";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -16.3999996; y: 4.80000019; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.600000024; scale-y: 0.600000024; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_BASKET_OVERLAY; }
        frame 6 { x: -14.6000004; y: -0; skew-x: 11; skew-y: 11; scale-x: 0.598999977; scale-y: 0.598999977; cel: -10000; image: none; }
        frame 7 { x: -12.6000004; y: -4.69999981; skew-x: 18.1000004; skew-y: 18.1000004; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: -13.6000004; y: -1.10000002; skew-x: 13; skew-y: 13; }
        frame 9 { x: -14.6999998; y: 2.4000001; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 10 { x: -15.6000004; y: 6.5; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 11 { x: -16.2999992; y: 10.3000002; skew-x: -1.5; skew-y: -1.5; }
        frame 12 { x: -16.7999992; y: 14.5; skew-x: -6.4000001; skew-y: -6.4000001; }
        frame 13 { x: -17.3999996; y: 18.6000004; skew-x: -11.3999996; skew-y: -11.3999996; }
        frame 14 { x: -17.6000004; y: 22.7999992; skew-x: -16.5; skew-y: -16.5; }
        frame 15 { x: -17.8999996; y: 24.5; skew-x: -17.5; skew-y: -17.5; }
        frame 16 { x: -18.2999992; y: 26.3999996; skew-x: -18.7000008; skew-y: -18.7000008; }
        frame 17 { x: -10000; y: 23.2000008; skew-x: -15.3999996; skew-y: -15.3999996; }
        frame 18 { x: -18; y: 20.1000004; skew-x: -12.1999998; skew-y: -12.1999998; }
        frame 19 { x: -17.8999996; y: 17.1000004; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 20 { x: -17.6000004; y: 13.8000002; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 21 { x: -17.2999992; y: 10.6999998; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 22 { x: -16.7999992; y: 7.69999981; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -16.3999996; y: 4.80000019; skew-x: 4.0999999; skew-y: 4.0999999; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: -18.2999992; y: 12.8999996; skew-x: -4.5; skew-y: -4.5; scale-x: 0.598999977; scale-y: 0.598999977; }
        frame 26 { x: -19.7000008; y: 21.3999996; skew-x: -13.1999998; skew-y: -13.1999998; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -20.6000004; y: 30.1000004; skew-x: -22.2000008; skew-y: -22.2000008; scale-x: 0.59799999; scale-y: 0.59799999; }
        frame 28 { x: -21.1000004; y: 38.7000008; skew-x: -31; skew-y: -31; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: -10000; y: 47.4000015; skew-x: -39.7000008; skew-y: -39.7000008; }
        frame 30 { x: -20.2999992; y: 49; skew-x: -42.7999992; skew-y: -42.7999992; scale-x: 0.597000003; scale-y: 0.597000003; }
        frame 31 { x: -19.5; y: 50.5999985; skew-x: -45.7000008; skew-y: -45.7000008; scale-x: 0.59799999; scale-y: 0.59799999; }
        frame 32 { x: -23.5; y: 34.2999992; skew-x: -37.2999992; skew-y: -37.2999992; scale-x: 0.596000016; scale-y: 0.596000016; }
        frame 33 { x: -19; y: -1.89999998; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 13.5; y: -41.9000015; skew-x: 44.5999985; skew-y: 44.7000008; scale-y: 0.595000029; }
        frame 35 { x: 65.1999969; y: -46.7000008; skew-x: 93; skew-y: 93; scale-x: 0.597000003; scale-y: 0.596000016; }
        frame 36 { x: 74.1999969; y: -43.4000015; skew-x: 105; skew-y: 105; scale-x: 0.596000016; scale-y: 0.595000029; }
        frame 37 { x: 82.3000031; y: -39.5; skew-x: 117.300003; skew-y: 117.300003; scale-x: 0.597000003; scale-y: -10000; }
        frame 38 { x: 80; y: -40.5999985; skew-x: 113.800003; skew-y: 113.800003; scale-x: 0.596000016; scale-y: 0.593999982; }
        frame 39 { x: 77.8000031; y: -41.7999992; skew-x: 110.300003; skew-y: 110.300003; scale-x: -10000; scale-y: 0.595000029; }
        frame 40 { x: 75.5; y: -42.7999992; skew-x: 106.800003; skew-y: 106.800003; scale-y: -10000; }
        frame 41 { x: 73; y: -43.9000015; skew-x: 103.300003; skew-y: 103.300003; scale-x: 0.597000003; }
        frame 42 { x: 70.5999985; y: -44.9000015; skew-x: 99.8000031; skew-y: 99.8000031; scale-x: -10000; }
        frame 43 { x: 68.0999985; y: -45.9000015; skew-x: 96.3000031; skew-y: 96.3000031; scale-y: 0.596000016; }
        frame 44 { x: 65.5999985; y: -46.7000008; skew-x: 93; skew-y: 93; scale-y: -10000; }
        frame 45 { x: 66.9000015; y: -46.4000015; skew-x: 94.5; skew-y: 94.5; }
        frame 46 { x: 68.0999985; y: -46.0999985; skew-x: 96.3000031; skew-y: 96.3000031; scale-y: 0.595000029; }
        frame 47 { x: 69.3000031; y: -45.7000008; skew-x: 98; skew-y: 98; scale-y: -10000; }
        frame 48 { x: 70.5999985; y: -45.2999992; skew-x: 99.8000031; skew-y: 99.8000031; }
        frame 49 { x: 71.6999969; y: -44.9000015; skew-x: 101.5; skew-y: 101.5; scale-x: 0.596000016; }
        frame 50 { x: 73.0999985; y: -44.5; skew-x: 103.300003; skew-y: 103.300003; scale-x: -10000; }
        frame 51 { x: 74.3000031; y: -44.0999985; skew-x: 105; skew-y: 105; }
        frame 52 { x: 55.2000008; y: -43.5999985; skew-x: 85.1999969; skew-y: 85.1999969; }
        frame 53 { x: 34.5999985; y: -41; skew-x: 65.1999969; skew-y: 65.1999969; }
        frame 54 { x: 13.8000002; y: -35.7999992; skew-x: 45.0999985; skew-y: 45.0999985; scale-x: 0.597000003; scale-y: 0.596000016; }
        frame 55 { x: 3; y: -23.2999992; skew-x: 31.2999992; skew-y: 31.2999992; scale-x: -10000; scale-y: 0.597000003; }
        frame 56 { x: -7.0999999; y: -9.60000038; skew-x: 17.6000004; skew-y: 17.6000004; scale-x: 0.59799999; scale-y: 0.59799999; }
        frame 57 { x: -16.3999996; y: 4.80000019; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -14.6000004; y: -0; skew-x: 11; skew-y: 11; scale-x: 0.598999977; scale-y: 0.598999977; }
        frame 60 { x: -12.6000004; y: -4.69999981; skew-x: 18.1000004; skew-y: 18.1000004; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -13.6000004; y: -1.10000002; skew-x: 13; skew-y: 13; }
        frame 62 { x: -14.6999998; y: 2.4000001; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 63 { x: -15.6000004; y: 6.5; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 64 { x: -16.2999992; y: 10.3000002; skew-x: -1.5; skew-y: -1.5; }
        frame 65 { x: -16.7999992; y: 14.5; skew-x: -6.4000001; skew-y: -6.4000001; }
        frame 66 { x: -17.3999996; y: 18.6000004; skew-x: -11.3999996; skew-y: -11.3999996; }
        frame 67 { x: -17.6000004; y: 22.7999992; skew-x: -16.5; skew-y: -16.5; }
        frame 68 { x: -17.8999996; y: 24.5; skew-x: -17.5; skew-y: -17.5; }
        frame 69 { x: -18.2999992; y: 26.3999996; skew-x: -18.7000008; skew-y: -18.7000008; }
        frame 70 { x: -10000; y: 23.2000008; skew-x: -15.3999996; skew-y: -15.3999996; }
        frame 71 { x: -18; y: 20.1000004; skew-x: -12.1999998; skew-y: -12.1999998; }
        frame 72 { x: -17.8999996; y: 17.1000004; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 73 { x: -17.6000004; y: 13.8000002; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 74 { x: -17.2999992; y: 10.6999998; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 75 { x: -16.7999992; y: 7.69999981; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: -16.3999996; y: 4.80000019; skew-x: 4.0999999; skew-y: 4.0999999; }
    }
    Track {
        source-name: "Cornpult_kernal";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -16.7000008; y: 11.1000004; skew-x: -40.9000015; skew-y: -40.9000015; scale-x: 0.949999988; scale-y: 0.949999988; cel: 0; image: IMAGE_REANIM_CORNPULT_KERNAL; }
        frame 6 { x: -13.6000004; y: 2.70000005; skew-x: -23.5; skew-y: -23.5; scale-x: 0.947000027; scale-y: 0.947000027; cel: -10000; image: none; }
        frame 7 { x: -9.60000038; y: -4.80000019; skew-x: -6.30000019; skew-y: -6.30000019; scale-x: 0.94599998; scale-y: 0.94599998; }
        frame 8 { x: -10.6999998; y: -1; skew-x: -11.8999996; skew-y: -11.8999996; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: -11.8000002; y: 2.9000001; skew-x: -17.7000008; skew-y: -17.7000008; }
        frame 10 { x: -12.6999998; y: 7; skew-x: -23.5; skew-y: -23.5; }
        frame 11 { x: -13.5; y: 11.1999998; skew-x: -29.2000008; skew-y: -29.2000008; }
        frame 12 { x: -14.1999998; y: 15.3999996; skew-x: -35; skew-y: -35; scale-x: 0.947000027; scale-y: 0.947000027; }
        frame 13 { x: -14.6999998; y: 19.7000008; skew-x: -40.7999992; skew-y: -40.7999992; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: -15; y: 23.8999996; skew-x: -46.5; skew-y: -46.5; scale-x: 0.949000001; scale-y: 0.949000001; }
        frame 15 { x: -16.2000008; y: 28.2000008; skew-x: -55.5; skew-y: -55.5; scale-x: 0.94599998; scale-y: 0.94599998; }
        frame 16 { x: -17.2000008; y: 32.2999992; skew-x: -64.4000015; skew-y: -64.4000015; scale-x: 0.947000027; scale-y: 0.947000027; }
        frame 17 { x: -10000; y: 29.3999996; skew-x: -61.0999985; skew-y: -61.0999985; scale-x: 0.94599998; scale-y: 0.94599998; }
        frame 18 { x: -17.2999992; y: 26.2999992; skew-x: -57.7999992; skew-y: -57.7999992; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -10000; y: 23.2999992; skew-x: -54.2999992; skew-y: -54.2999992; scale-x: 0.947000027; scale-y: 0.947000027; }
        frame 20 { x: -17.2000008; y: 20.3999996; skew-x: -51; skew-y: -51; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -10000; y: 17.2000008; skew-x: -47.5; skew-y: -47.5; }
        frame 22 { x: -17; y: 14.3000002; skew-x: -44.2999992; skew-y: -44.2999992; scale-x: 0.948000014; scale-y: 0.948000014; }
        frame 23 { x: -16.7000008; y: 11.1000004; skew-x: -40.9000015; skew-y: -40.9000015; scale-x: 0.949999988; scale-y: 0.949999988; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -17.6000004; y: 20.1000004; skew-x: -52.5999985; skew-y: -52.5999985; scale-x: 0.948000014; scale-y: 0.948000014; }
        frame 26 { x: -17.7999992; y: 29.1000004; skew-x: -64.3000031; skew-y: -64.3000031; scale-x: 0.947000027; scale-y: 0.947000027; }
        frame 27 { x: -17.5; y: 38; skew-x: -76.0999985; skew-y: -76.0999985; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -16.6000004; y: 46.7999992; skew-x: -87.9000015; skew-y: -87.9000015; }
        frame 29 { x: -15.1999998; y: 55; skew-x: -99.5; skew-y: -99.5; }
        frame 30 { x: -14; y: 56.4000015; skew-x: -102.400002; skew-y: -102.400002; scale-x: 0.94599998; scale-y: 0.94599998; }
        frame 31 { x: -12.8999996; y: 57.5; skew-x: -105.5; skew-y: -105.5; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -15.6999998; y: 42.5; skew-x: -97.1999969; skew-y: -97.4000015; scale-x: 0.943000019; scale-y: 0.944000006; }
        frame 33 { x: -15.3000002; y: 9.30000019; skew-x: -63.0999985; skew-y: -63.2999992; scale-x: 0.941999972; scale-y: 0.943000019; }
        frame 34 { x: 13.3000002; y: -36.5999985; skew-x: -14.6999998; skew-y: -14.8999996; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 36 { cel: -10000; }
        frame 57 { x: -16.7000008; y: 11.1000004; skew-x: -40.9000015; skew-y: -40.9000015; scale-x: 0.949999988; scale-y: 0.949999988; cel: 0; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 59 { x: -13.6000004; y: 2.70000005; skew-x: -23.5; skew-y: -23.5; scale-x: 0.947000027; scale-y: 0.947000027; }
        frame 60 { x: -9.60000038; y: -4.80000019; skew-x: -6.30000019; skew-y: -6.30000019; scale-x: 0.94599998; scale-y: 0.94599998; }
        frame 61 { x: -10.6999998; y: -1; skew-x: -11.8999996; skew-y: -11.8999996; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: -11.8000002; y: 2.9000001; skew-x: -17.7000008; skew-y: -17.7000008; }
        frame 63 { x: -12.6999998; y: 7; skew-x: -23.5; skew-y: -23.5; }
        frame 64 { x: -13.5; y: 11.1999998; skew-x: -29.2000008; skew-y: -29.2000008; }
        frame 65 { x: -14.1999998; y: 15.3999996; skew-x: -35; skew-y: -35; scale-x: 0.947000027; scale-y: 0.947000027; }
        frame 66 { x: -14.6999998; y: 19.7000008; skew-x: -40.7999992; skew-y: -40.7999992; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: -15; y: 23.8999996; skew-x: -46.5; skew-y: -46.5; scale-x: 0.949000001; scale-y: 0.949000001; }
        frame 68 { x: -16.2000008; y: 28.2000008; skew-x: -55.5; skew-y: -55.5; scale-x: 0.94599998; scale-y: 0.94599998; }
        frame 69 { x: -17.2000008; y: 32.2999992; skew-x: -64.4000015; skew-y: -64.4000015; scale-x: 0.947000027; scale-y: 0.947000027; }
        frame 70 { x: -10000; y: 29.3999996; skew-x: -61.0999985; skew-y: -61.0999985; scale-x: 0.94599998; scale-y: 0.94599998; }
        frame 71 { x: -17.2999992; y: 26.2999992; skew-x: -57.7999992; skew-y: -57.7999992; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -10000; y: 23.2999992; skew-x: -54.2999992; skew-y: -54.2999992; scale-x: 0.947000027; scale-y: 0.947000027; }
        frame 73 { x: -17.2000008; y: 20.3999996; skew-x: -51; skew-y: -51; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -10000; y: 17.2000008; skew-x: -47.5; skew-y: -47.5; }
        frame 75 { x: -17; y: 14.3000002; skew-x: -44.2999992; skew-y: -44.2999992; scale-x: 0.948000014; scale-y: 0.948000014; }
        frame 76 { x: -16.7000008; y: 11.1000004; skew-x: -40.9000015; skew-y: -40.9000015; scale-x: 0.949999988; scale-y: 0.949999988; }
    }
    Track {
        source-name: "Cornpult_butter";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -22; y: -18.7999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_BUTTER; }
        frame 6 { x: -21.5; y: -20.7999992; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: -21; y: -22.7999992; }
        frame 8 { x: -21.2000008; y: -20.2999992; }
        frame 9 { x: -21.2999992; y: -17.7000008; }
        frame 10 { x: -21.5; y: -15.1000004; }
        frame 11 { x: -21.6000004; y: -12.5; }
        frame 12 { x: -21.7000008; y: -10; }
        frame 13 { x: -21.8999996; y: -7.4000001; }
        frame 14 { x: -22; y: -4.80000019; }
        frame 15 { x: -22.5; y: -3.79999995; }
        frame 16 { x: -23; y: -2.79999995; }
        frame 17 { x: -22.8999996; y: -5.0999999; }
        frame 18 { x: -22.7000008; y: -7.4000001; }
        frame 19 { x: -22.6000004; y: -9.69999981; }
        frame 20 { x: -22.5; y: -12; }
        frame 21 { x: -22.2999992; y: -14.3000002; }
        frame 22 { x: -22.2000008; y: -16.5; }
        frame 23 { x: -22; y: -18.7999992; }
        frame 24 { x: -10000; y: -10000; }
        frame 25 { x: -26.8999996; y: -8.80000019; skew-x: -8.69999981; skew-y: -8.69999981; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 26 { x: -31.3999996; y: 1.39999998; skew-x: -17.5; skew-y: -17.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 27 { x: -35.0999985; y: 12.1999998; skew-x: -26.3999996; skew-y: -26.3999996; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -38.4000015; y: 23.1000004; skew-x: -35.2000008; skew-y: -35.2000008; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 29 { x: -41; y: 34; skew-x: -44.0999985; skew-y: -44.0999985; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 30 { x: -41.9000015; y: 39.9000015; skew-x: -48.7999992; skew-y: -52.7999992; scale-x: 0.796999991; scale-y: 0.800000012; }
        frame 31 { x: -42.2999992; y: 45.9000015; skew-x: -53.5999985; skew-y: -61.5999985; scale-x: 0.797999978; scale-y: 0.805000007; }
        frame 32 { x: -44.0999985; y: 15.5; skew-x: -32; skew-y: -39.4000015; scale-x: 0.795000017; scale-y: 0.805999994; }
        frame 33 { x: -17.7999992; y: -29.1000004; skew-x: 15.3000002; skew-y: 11.8000002; scale-x: 0.827000022; scale-y: 0.750999987; }
        frame 34 { x: 44.7999992; y: -62.5999985; skew-x: 63.0999985; skew-y: 63.0999985; scale-x: 0.79400003; scale-y: 0.80400002; }
        frame 35 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 36 { cel: -10000; }
    }
    Track {
        source-name: "Cabbagepult_basket_overlay";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -16.5; y: 4.30000019; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.600000024; scale-y: 0.600000024; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_BASKET_OVERLAY; }
        frame 6 { x: -14.6999998; y: -0.400000006; skew-x: 11; skew-y: 11; scale-x: 0.598999977; scale-y: 0.598999977; cel: -10000; image: none; }
        frame 7 { x: -12.6999998; y: -5; skew-x: 18.1000004; skew-y: 18.1000004; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: -13.8000002; y: -1.39999998; skew-x: 13; skew-y: 13; }
        frame 9 { x: -14.8999996; y: 2.20000005; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 10 { x: -15.8000002; y: 6.19999981; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 11 { x: -16.5; y: 10.1000004; skew-x: -1.5; skew-y: -1.5; }
        frame 12 { x: -17.1000004; y: 14.1999998; skew-x: -6.4000001; skew-y: -6.4000001; }
        frame 13 { x: -17.6000004; y: 18.2999992; skew-x: -11.3999996; skew-y: -11.3999996; }
        frame 14 { x: -17.8999996; y: 22.6000004; skew-x: -16.5; skew-y: -16.5; }
        frame 15 { x: -18.2000008; y: 24.2999992; skew-x: -17.5; skew-y: -17.5; }
        frame 16 { x: -18.5; y: 26.2000008; skew-x: -18.7000008; skew-y: -18.7000008; }
        frame 17 { x: -18.3999996; y: 23; skew-x: -15.3999996; skew-y: -15.3999996; }
        frame 18 { x: -18.2000008; y: 19.7999992; skew-x: -12.1999998; skew-y: -12.1999998; }
        frame 19 { x: -18; y: 16.7999992; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 20 { x: -17.7999992; y: 13.5; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 21 { x: -17.3999996; y: 10.3999996; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 22 { x: -17; y: 7.4000001; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -16.5; y: 4.30000019; skew-x: 4.0999999; skew-y: 4.0999999; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: -18.5; y: 12.5; skew-x: -4.5; skew-y: -4.5; scale-x: 0.598999977; scale-y: 0.598999977; }
        frame 26 { x: -20; y: 21; skew-x: -13.1999998; skew-y: -13.1999998; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -20.8999996; y: 29.7999992; skew-x: -22.2000008; skew-y: -22.2000008; scale-x: 0.59799999; scale-y: 0.59799999; }
        frame 28 { x: -21.3999996; y: 38.5; skew-x: -31; skew-y: -31; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: -21.2999992; y: 47.2000008; skew-x: -39.7000008; skew-y: -39.7000008; }
        frame 30 { x: -20.5; y: 48.7999992; skew-x: -42.7999992; skew-y: -42.7999992; scale-x: 0.597000003; scale-y: 0.597000003; }
        frame 31 { x: -19.7000008; y: 50.4000015; skew-x: -45.7000008; skew-y: -45.7000008; scale-x: 0.59799999; scale-y: 0.59799999; }
        frame 32 { x: -23.7000008; y: 33.9000015; skew-x: -37.2999992; skew-y: -37.2999992; scale-x: 0.596000016; scale-y: 0.596000016; }
        frame 33 { x: -19; y: -2.20000005; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 13.6999998; y: -42.0999985; skew-x: 44.5999985; skew-y: 44.7000008; scale-y: 0.595000029; }
        frame 35 { x: 65.5999985; y: -46.7000008; skew-x: 93; skew-y: 93; scale-x: 0.597000003; scale-y: 0.596000016; }
        frame 36 { x: 74.5; y: -43.2999992; skew-x: 105; skew-y: 105; scale-x: 0.596000016; scale-y: 0.595000029; }
        frame 37 { x: 82.5999985; y: -39.4000015; skew-x: 117.300003; skew-y: 117.300003; scale-x: 0.597000003; scale-y: -10000; }
        frame 38 { x: 80.3000031; y: -40.5999985; skew-x: 113.800003; skew-y: 113.800003; scale-x: 0.596000016; scale-y: 0.593999982; }
        frame 39 { x: 78.1999969; y: -41.7000008; skew-x: 110.300003; skew-y: 110.300003; scale-x: -10000; scale-y: 0.595000029; }
        frame 40 { x: 75.9000015; y: -42.7999992; skew-x: 106.800003; skew-y: 106.800003; scale-y: -10000; }
        frame 41 { x: 73.5; y: -43.9000015; skew-x: 103.300003; skew-y: 103.300003; scale-x: 0.597000003; }
        frame 42 { x: 70.9000015; y: -44.9000015; skew-x: 99.8000031; skew-y: 99.8000031; scale-x: -10000; }
        frame 43 { x: 68.5; y: -45.9000015; skew-x: 96.3000031; skew-y: 96.3000031; scale-y: 0.596000016; }
        frame 44 { x: 66; y: -46.7000008; skew-x: 93; skew-y: 93; scale-y: -10000; }
        frame 45 { x: 67.3000031; y: -46.4000015; skew-x: 94.5; skew-y: 94.5; }
        frame 46 { x: 68.5; y: -46; skew-x: 96.3000031; skew-y: 96.3000031; scale-y: 0.595000029; }
        frame 47 { x: 69.8000031; y: -45.5999985; skew-x: 98; skew-y: 98; scale-y: -10000; }
        frame 48 { x: 70.8000031; y: -45.2000008; skew-x: 99.8000031; skew-y: 99.8000031; }
        frame 49 { x: 72.0999985; y: -44.7000008; skew-x: 101.5; skew-y: 101.5; scale-x: 0.596000016; }
        frame 50 { x: 73.3000031; y: -44.2999992; skew-x: 103.300003; skew-y: 103.300003; scale-x: -10000; }
        frame 51 { x: 74.5999985; y: -44; skew-x: 105; skew-y: 105; }
        frame 52 { x: 55.4000015; y: -43.7000008; skew-x: 85.1999969; skew-y: 85.1999969; }
        frame 53 { x: 34.9000015; y: -41.2000008; skew-x: 65.1999969; skew-y: 65.1999969; }
        frame 54 { x: 14; y: -36; skew-x: 45.0999985; skew-y: 45.0999985; scale-x: 0.597000003; scale-y: 0.596000016; }
        frame 55 { x: 3.0999999; y: -23.5; skew-x: 31.2999992; skew-y: 31.2999992; scale-x: -10000; scale-y: 0.597000003; }
        frame 56 { x: -7.0999999; y: -9.89999962; skew-x: 17.6000004; skew-y: 17.6000004; scale-x: 0.59799999; scale-y: 0.59799999; }
        frame 57 { x: -16.5; y: 4.30000019; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -14.6999998; y: -0.400000006; skew-x: 11; skew-y: 11; scale-x: 0.598999977; scale-y: 0.598999977; }
        frame 60 { x: -12.6999998; y: -5; skew-x: 18.1000004; skew-y: 18.1000004; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -13.8000002; y: -1.39999998; skew-x: 13; skew-y: 13; }
        frame 62 { x: -14.8999996; y: 2.20000005; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 63 { x: -15.8000002; y: 6.19999981; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 64 { x: -16.5; y: 10.1000004; skew-x: -1.5; skew-y: -1.5; }
        frame 65 { x: -17.1000004; y: 14.1999998; skew-x: -6.4000001; skew-y: -6.4000001; }
        frame 66 { x: -17.6000004; y: 18.2999992; skew-x: -11.3999996; skew-y: -11.3999996; }
        frame 67 { x: -17.8999996; y: 22.6000004; skew-x: -16.5; skew-y: -16.5; }
        frame 68 { x: -18.2000008; y: 24.2999992; skew-x: -17.5; skew-y: -17.5; }
        frame 69 { x: -18.5; y: 26.2000008; skew-x: -18.7000008; skew-y: -18.7000008; }
        frame 70 { x: -18.3999996; y: 23; skew-x: -15.3999996; skew-y: -15.3999996; }
        frame 71 { x: -18.2000008; y: 19.7999992; skew-x: -12.1999998; skew-y: -12.1999998; }
        frame 72 { x: -18; y: 16.7999992; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 73 { x: -17.7999992; y: 13.5; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 74 { x: -17.3999996; y: 10.3999996; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 75 { x: -17; y: 7.4000001; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: -16.5; y: 4.30000019; skew-x: 4.0999999; skew-y: 4.0999999; }
    }
    Track {
        source-name: "Cornpult_husk3";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 12.3999996; y: 58.2999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSK3; }
        frame 6 { x: 12.8999996; y: 57.5999985; skew-x: 1; skew-y: 1; scale-x: 0.787; scale-y: 0.813000023; cel: -10000; image: none; }
        frame 7 { x: 13.5; y: 56.7999992; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.773999989; scale-y: 0.825999975; }
        frame 8 { x: 14.1999998; y: 56.0999985; skew-x: 3.5; skew-y: 3.5; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 9 { x: 13.5; y: 56.5999985; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.776000023; scale-y: 0.832000017; }
        frame 10 { x: 12.8999996; y: 56.9000015; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.790000021; scale-y: 0.825999975; }
        frame 11 { x: 12.3000002; y: 57.2000008; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: 0.805000007; scale-y: 0.819000006; }
        frame 12 { x: 11.6000004; y: 57.5999985; skew-x: 1; skew-y: 1; scale-x: 0.819000006; scale-y: 0.813000023; }
        frame 13 { x: 11; y: 58; skew-x: 0.5; skew-y: 0.5; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 14 { x: 10.5; y: 58.2999992; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 15 { x: 9.89999962; y: 58.5; skew-x: -10000; skew-y: -10000; scale-x: 0.870000005; scale-y: 0.792999983; }
        frame 16 { x: 9.19999981; y: 58.5999985; scale-x: 0.893000007; scale-y: 0.786000013; }
        frame 17 { x: 8.60000038; y: 58.9000015; scale-x: 0.915000021; scale-y: 0.777999997; }
        frame 18 { x: 9.19999981; y: 58.7999992; scale-x: 0.896000028; scale-y: 0.782000005; }
        frame 19 { x: 9.89999962; y: 58.5999985; scale-x: 0.876999974; scale-y: 0.786000013; }
        frame 20 { x: 10.5; y: 58.5; scale-x: 0.85799998; scale-y: 0.788999975; }
        frame 21 { x: 11.1000004; y: -10000; scale-x: 0.838; scale-y: 0.792999983; }
        frame 22 { x: 11.6999998; y: 58.4000015; scale-x: 0.819000006; scale-y: 0.796000004; }
        frame 23 { x: 12.3999996; y: 58.2999992; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 12.6999998; y: 57.9000015; skew-x: 0.5; skew-y: 0.5; scale-x: 0.791999996; scale-y: 0.808000028; }
        frame 26 { x: 13.1000004; y: 57.4000015; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.785000026; scale-y: 0.814999998; }
        frame 27 { x: 13.5; y: 56.9000015; skew-x: 2; skew-y: 2; scale-x: 0.77700001; scale-y: 0.823000014; }
        frame 28 { x: 13.8999996; y: 56.5; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.768999994; scale-y: 0.83099997; }
        frame 29 { x: 14.1999998; y: 56.0999985; skew-x: 3.5; skew-y: 3.5; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 30 { x: 13.3000002; y: 57.2999992; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: 0.781000018; scale-y: 0.819000006; }
        frame 31 { x: 12.3999996; y: 58.2999992; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 32 { x: 11.5; y: 58.4000015; skew-x: -10000; skew-y: -10000; scale-x: 0.828999996; scale-y: 0.795000017; }
        frame 33 { x: 10.5; y: 58.5; scale-x: 0.85799998; scale-y: 0.788999975; }
        frame 34 { x: 9.60000038; y: 58.5999985; scale-x: 0.885999978; scale-y: 0.783999979; }
        frame 35 { x: 8.60000038; y: 58.9000015; scale-x: 0.915000021; scale-y: 0.777999997; }
        frame 36 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 8.5; }
        frame 49 { x: -10000; }
        frame 51 { x: 8.60000038; }
        frame 52 { x: 9.19999981; y: 58.7999992; scale-x: 0.896000028; scale-y: 0.782000005; }
        frame 53 { x: 9.80000019; y: 58.5999985; scale-x: 0.876999974; scale-y: 0.786000013; }
        frame 54 { x: 10.3999996; y: 58.5; scale-x: 0.85799998; scale-y: 0.788999975; }
        frame 55 { x: 11.1000004; y: -10000; scale-x: 0.838; scale-y: 0.792999983; }
        frame 56 { x: 11.6999998; y: 58.4000015; scale-x: 0.819000006; scale-y: 0.796000004; }
        frame 57 { x: 12.3999996; y: 58.2999992; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 12.8999996; y: 57.5999985; skew-x: 1; skew-y: 1; scale-x: 0.787; scale-y: 0.813000023; }
        frame 60 { x: 13.5; y: 56.7999992; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.773999989; scale-y: 0.825999975; }
        frame 61 { x: 14.1999998; y: 56.0999985; skew-x: 3.5; skew-y: 3.5; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 62 { x: 13.5; y: 56.5999985; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.776000023; scale-y: 0.832000017; }
        frame 63 { x: 12.8999996; y: 56.9000015; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.790000021; scale-y: 0.825999975; }
        frame 64 { x: 12.3000002; y: 57.2000008; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: 0.805000007; scale-y: 0.819000006; }
        frame 65 { x: 11.6000004; y: 57.5999985; skew-x: 1; skew-y: 1; scale-x: 0.819000006; scale-y: 0.813000023; }
        frame 66 { x: 11; y: 58; skew-x: 0.5; skew-y: 0.5; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 67 { x: 10.5; y: 58.2999992; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 68 { x: 9.89999962; y: 58.5; skew-x: -10000; skew-y: -10000; scale-x: 0.870000005; scale-y: 0.792999983; }
        frame 69 { x: 9.19999981; y: 58.5999985; scale-x: 0.893000007; scale-y: 0.786000013; }
        frame 70 { x: 8.60000038; y: 58.9000015; scale-x: 0.915000021; scale-y: 0.777999997; }
        frame 71 { x: 9.19999981; y: 58.7999992; scale-x: 0.896000028; scale-y: 0.782000005; }
        frame 72 { x: 9.89999962; y: 58.5999985; scale-x: 0.876999974; scale-y: 0.786000013; }
        frame 73 { x: 10.5; y: 58.5; scale-x: 0.85799998; scale-y: 0.788999975; }
        frame 74 { x: 11.1000004; y: -10000; scale-x: 0.838; scale-y: 0.792999983; }
        frame 75 { x: 11.6999998; y: 58.4000015; scale-x: 0.819000006; scale-y: 0.796000004; }
        frame 76 { x: 12.3999996; y: 58.2999992; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cornpult_husktip3";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 7.69999981; y: 59.0999985; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSKTIP3; }
        frame 6 { x: 9; y: 57.5999985; skew-x: 7; skew-y: 7; scale-x: 0.787; scale-y: 0.811999977; cel: -10000; image: none; }
        frame 7 { x: 10.3999996; y: 56.4000015; skew-x: 14; skew-y: 14; scale-x: 0.773000002; scale-y: 0.824999988; }
        frame 8 { x: 12; y: 55.0999985; skew-x: 21.1000004; skew-y: 21.1000004; scale-x: 0.760999978; scale-y: 0.838; }
        frame 9 { x: 10.8999996; y: 55.7999992; skew-x: 17.5; skew-y: 17.5; scale-x: 0.774999976; scale-y: 0.83099997; }
        frame 10 { x: 9.80000019; y: 56.4000015; skew-x: 14; skew-y: 14; scale-x: 0.788999975; scale-y: 0.824999988; }
        frame 11 { x: 8.69999981; y: 57; skew-x: 10.5; skew-y: 10.5; scale-x: 0.80400002; scale-y: 0.819000006; }
        frame 12 { x: 7.5999999; y: 57.5999985; skew-x: 7; skew-y: 7; scale-x: 0.818000019; scale-y: 0.811999977; }
        frame 13 { x: 6.5999999; y: 58.4000015; skew-x: 3.5; skew-y: 3.5; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 14 { x: 5.5; y: 59.0999985; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 15 { x: 4.5; y: 59.9000015; skew-x: -4.69999981; skew-y: -5; scale-x: 0.88499999; scale-y: 0.768000007; }
        frame 16 { x: 3.5; y: 60.7999992; skew-x: -9.39999962; skew-y: -10.1999998; scale-x: 0.922999978; scale-y: 0.736000001; }
        frame 17 { x: 2.5999999; y: 61.7999992; skew-x: -14.1999998; skew-y: -15.6000004; scale-x: 0.962000012; scale-y: 0.703999996; }
        frame 18 { x: 3.4000001; y: 61.2999992; skew-x: -11.6999998; skew-y: -12.8999996; scale-x: 0.934000015; scale-y: 0.718999982; }
        frame 19 { x: 4.30000019; y: 60.7999992; skew-x: -9.39999962; skew-y: -10.1999998; scale-x: 0.907000005; scale-y: 0.736000001; }
        frame 20 { x: 5.0999999; y: 60.4000015; skew-x: -6.9000001; skew-y: -7.69999981; scale-x: 0.879999995; scale-y: 0.751999974; }
        frame 21 { x: 6; y: 60; skew-x: -4.69999981; skew-y: -5; scale-x: 0.853999972; scale-y: 0.768000007; }
        frame 22 { x: 6.80000019; y: 59.5; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.827000022; scale-y: 0.783999979; }
        frame 23 { x: 7.69999981; y: 59.0999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 8.5; y: 58.2999992; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.791999996; scale-y: 0.806999981; }
        frame 26 { x: 9.30000019; y: 57.4000015; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.783999979; scale-y: 0.814999998; }
        frame 27 { x: 10.1000004; y: 56.5999985; skew-x: 12.6000004; skew-y: 12.6000004; scale-x: 0.776000023; scale-y: 0.822000027; }
        frame 28 { x: 11; y: 55.9000015; skew-x: 16.7999992; skew-y: 16.7999992; scale-x: 0.768000007; scale-y: 0.829999983; }
        frame 29 { x: 12; y: 55.0999985; skew-x: 21.1000004; skew-y: 21.1000004; scale-x: 0.760999978; scale-y: 0.838; }
        frame 30 { x: 9.80000019; y: 57; skew-x: 10.5; skew-y: 10.5; scale-x: 0.779999971; scale-y: 0.819000006; }
        frame 31 { x: 7.69999981; y: 59.0999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 32 { x: 6.30000019; y: 59.7000008; skew-x: -3.4000001; skew-y: -3.70000005; scale-x: 0.839999974; scale-y: 0.776000023; }
        frame 33 { x: 5.0999999; y: 60.2999992; skew-x: -6.9000001; skew-y: -7.69999981; scale-x: 0.879999995; scale-y: 0.751999974; }
        frame 34 { x: 3.79999995; y: 61; skew-x: -10.6999998; skew-y: -11.6999998; scale-x: 0.921000004; scale-y: 0.726999998; }
        frame 35 { x: 2.5999999; y: 61.7999992; skew-x: -14.1999998; skew-y: -15.6000004; scale-x: 0.962000012; scale-y: 0.703999996; }
        frame 36 { x: -10000; y: 61.7000008; skew-x: -10000; skew-y: -15.5; scale-x: 0.961000025; scale-y: 0.703000009; }
        frame 37 { y: 61.7999992; skew-y: -15.6000004; scale-x: 0.962000012; scale-y: 0.703999996; }
        frame 38 { y: 61.7000008; skew-y: -15.5; scale-x: 0.961000025; scale-y: 0.703000009; }
        frame 39 { y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { y: 61.7999992; skew-y: -15.6000004; scale-x: 0.962000012; scale-y: 0.703999996; }
        frame 45 { y: -10000; skew-y: -15.5; scale-x: 0.961000025; scale-y: 0.703000009; }
        frame 46 { skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { skew-y: -15.3999996; }
        frame 48 { y: 61.7000008; skew-y: -10000; }
        frame 49 { y: -10000; scale-x: 0.959999979; }
        frame 50 { y: 61.5999985; scale-x: -10000; }
        frame 51 { y: 61.7000008; skew-y: -15.5; scale-x: 0.961000025; }
        frame 52 { x: 3.4000001; y: 61.2000008; skew-x: -11.6999998; skew-y: -12.6999998; scale-x: 0.933000028; scale-y: 0.718999982; }
        frame 53 { x: 4.30000019; y: 60.7999992; skew-x: -9.39999962; skew-y: -10.1999998; scale-x: 0.907000005; scale-y: 0.735000014; }
        frame 54 { x: 5.19999981; y: 60.2999992; skew-x: -6.9000001; skew-y: -7.69999981; scale-x: 0.879999995; scale-y: 0.750999987; }
        frame 55 { x: 5.9000001; y: 60; skew-x: -4.69999981; skew-y: -4.9000001; scale-x: 0.852999985; scale-y: 0.768000007; }
        frame 56 { x: 6.80000019; y: 59.5; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.827000022; scale-y: 0.783999979; }
        frame 57 { x: 7.69999981; y: 59.0999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 9; y: 57.5999985; skew-x: 7; skew-y: 7; scale-x: 0.787; scale-y: 0.811999977; }
        frame 60 { x: 10.3999996; y: 56.4000015; skew-x: 14; skew-y: 14; scale-x: 0.773000002; scale-y: 0.824999988; }
        frame 61 { x: 12; y: 55.0999985; skew-x: 21.1000004; skew-y: 21.1000004; scale-x: 0.760999978; scale-y: 0.838; }
        frame 62 { x: 10.8999996; y: 55.7999992; skew-x: 17.5; skew-y: 17.5; scale-x: 0.774999976; scale-y: 0.83099997; }
        frame 63 { x: 9.80000019; y: 56.4000015; skew-x: 14; skew-y: 14; scale-x: 0.788999975; scale-y: 0.824999988; }
        frame 64 { x: 8.69999981; y: 57; skew-x: 10.5; skew-y: 10.5; scale-x: 0.80400002; scale-y: 0.819000006; }
        frame 65 { x: 7.5999999; y: 57.5999985; skew-x: 7; skew-y: 7; scale-x: 0.818000019; scale-y: 0.811999977; }
        frame 66 { x: 6.5999999; y: 58.4000015; skew-x: 3.5; skew-y: 3.5; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 67 { x: 5.5; y: 59.0999985; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 68 { x: 4.5; y: 59.9000015; skew-x: -4.69999981; skew-y: -5; scale-x: 0.88499999; scale-y: 0.768000007; }
        frame 69 { x: 3.5; y: 60.7999992; skew-x: -9.39999962; skew-y: -10.1999998; scale-x: 0.922999978; scale-y: 0.736000001; }
        frame 70 { x: 2.5999999; y: 61.7999992; skew-x: -14.1999998; skew-y: -15.6000004; scale-x: 0.962000012; scale-y: 0.703999996; }
        frame 71 { x: 3.4000001; y: 61.2999992; skew-x: -11.6999998; skew-y: -12.8999996; scale-x: 0.934000015; scale-y: 0.718999982; }
        frame 72 { x: 4.30000019; y: 60.7999992; skew-x: -9.39999962; skew-y: -10.1999998; scale-x: 0.907000005; scale-y: 0.736000001; }
        frame 73 { x: 5.0999999; y: 60.4000015; skew-x: -6.9000001; skew-y: -7.69999981; scale-x: 0.879999995; scale-y: 0.751999974; }
        frame 74 { x: 6; y: 60; skew-x: -4.69999981; skew-y: -5; scale-x: 0.853999972; scale-y: 0.768000007; }
        frame 75 { x: 6.80000019; y: 59.5; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.827000022; scale-y: 0.783999979; }
        frame 76 { x: 7.69999981; y: 59.0999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cornpult_husk1";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 19.2999992; y: 61.5999985; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSK1; }
        frame 6 { x: 19.7999992; y: 61; skew-x: 0.5; skew-y: 0.5; scale-x: 0.787; scale-y: 0.813000023; cel: -10000; image: none; }
        frame 7 { x: 20.2999992; y: 60.4000015; skew-x: 1; skew-y: 1; scale-x: 0.774999976; scale-y: 0.825999975; }
        frame 8 { x: 20.7000008; y: 59.7999992; skew-x: 1.5; skew-y: 1.5; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 9 { x: 20.2999992; y: 60.0999985; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.776000023; scale-y: 0.832000017; }
        frame 10 { x: 19.7999992; y: 60.5; skew-x: 1; skew-y: 1; scale-x: 0.790000021; scale-y: 0.825999975; }
        frame 11 { x: 19.3999996; y: 60.7999992; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.805000007; scale-y: 0.819000006; }
        frame 12 { x: 18.7999992; y: 61; skew-x: 0.5; skew-y: 0.5; scale-x: 0.819000006; scale-y: 0.813000023; }
        frame 13 { x: 18.3999996; y: 61.4000015; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 14 { x: 17.7999992; y: 61.5999985; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 15 { x: 17.5; y: 61.7999992; skew-x: -10000; skew-y: -10000; scale-x: 0.856999993; scale-y: 0.792999983; }
        frame 16 { x: 17.1000004; y: 62; scale-x: 0.866999984; scale-y: 0.786000013; }
        frame 17 { x: 16.8999996; y: 62.0999985; scale-x: 0.875999987; scale-y: 0.777999997; }
        frame 18 { x: 17.2999992; y: 62; scale-x: 0.864000022; scale-y: 0.782000005; }
        frame 19 { x: 17.7000008; y: 61.9000015; scale-x: 0.851000011; scale-y: 0.786000013; }
        frame 20 { x: 18.1000004; y: -10000; scale-x: 0.838; scale-y: 0.788999975; }
        frame 21 { x: 18.5; scale-x: 0.824999988; scale-y: 0.792999983; }
        frame 22 { x: 19; y: 61.7999992; scale-x: 0.813000023; scale-y: 0.796000004; }
        frame 23 { x: 19.2999992; y: 61.5999985; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 19.5; y: 61.2999992; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.791999996; scale-y: 0.808000028; }
        frame 26 { x: 19.8999996; y: 60.9000015; skew-x: 0.5; skew-y: 0.5; scale-x: 0.785000026; scale-y: 0.815999985; }
        frame 27 { x: 20.1000004; y: 60.5; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.77700001; scale-y: 0.823000014; }
        frame 28 { x: 20.2999992; y: 60.2999992; skew-x: 1.10000002; skew-y: 1.10000002; scale-x: 0.769999981; scale-y: 0.83099997; }
        frame 29 { x: 20.7000008; y: 59.7999992; skew-x: 1.5; skew-y: 1.5; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 30 { x: 20.1000004; y: 60.7999992; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.781000018; scale-y: 0.819000006; }
        frame 31 { x: 19.2999992; y: 61.5999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 32 { x: 18.7000008; y: 61.7999992; skew-x: -10000; skew-y: -10000; scale-x: 0.819000006; scale-y: 0.795000017; }
        frame 33 { x: 18.1000004; y: 61.9000015; scale-x: 0.838; scale-y: 0.788999975; }
        frame 34 { x: 17.5; y: 62; scale-x: 0.856999993; scale-y: 0.783999979; }
        frame 35 { x: 16.8999996; y: 62.0999985; scale-x: 0.875999987; scale-y: 0.777999997; }
        frame 36 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 17.2999992; y: 62; scale-x: 0.864000022; scale-y: 0.782000005; }
        frame 53 { x: 17.7000008; y: 61.9000015; scale-x: 0.851000011; scale-y: 0.786000013; }
        frame 54 { x: 18.1000004; y: -10000; scale-x: 0.838; scale-y: 0.788999975; }
        frame 55 { x: 18.5; scale-x: 0.824999988; scale-y: 0.792999983; }
        frame 56 { x: 19; y: 61.7999992; scale-x: 0.813000023; scale-y: 0.796000004; }
        frame 57 { x: 19.2999992; y: 61.5999985; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 19.7999992; y: 61; skew-x: 0.5; skew-y: 0.5; scale-x: 0.787; scale-y: 0.813000023; }
        frame 60 { x: 20.2999992; y: 60.4000015; skew-x: 1; skew-y: 1; scale-x: 0.774999976; scale-y: 0.825999975; }
        frame 61 { x: 20.7000008; y: 59.7999992; skew-x: 1.5; skew-y: 1.5; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 62 { x: 20.2999992; y: 60.0999985; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.776000023; scale-y: 0.832000017; }
        frame 63 { x: 19.7999992; y: 60.5; skew-x: 1; skew-y: 1; scale-x: 0.790000021; scale-y: 0.825999975; }
        frame 64 { x: 19.3999996; y: 60.7999992; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.805000007; scale-y: 0.819000006; }
        frame 65 { x: 18.7999992; y: 61; skew-x: 0.5; skew-y: 0.5; scale-x: 0.819000006; scale-y: 0.813000023; }
        frame 66 { x: 18.3999996; y: 61.4000015; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 67 { x: 17.7999992; y: 61.5999985; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 68 { x: 17.5; y: 61.7999992; skew-x: -10000; skew-y: -10000; scale-x: 0.856999993; scale-y: 0.792999983; }
        frame 69 { x: 17.1000004; y: 62; scale-x: 0.866999984; scale-y: 0.786000013; }
        frame 70 { x: 16.8999996; y: 62.0999985; scale-x: 0.875999987; scale-y: 0.777999997; }
        frame 71 { x: 17.2999992; y: 62; scale-x: 0.864000022; scale-y: 0.782000005; }
        frame 72 { x: 17.7000008; y: 61.9000015; scale-x: 0.851000011; scale-y: 0.786000013; }
        frame 73 { x: 18.1000004; y: -10000; scale-x: 0.838; scale-y: 0.788999975; }
        frame 74 { x: 18.5; scale-x: 0.824999988; scale-y: 0.792999983; }
        frame 75 { x: 19; y: 61.7999992; scale-x: 0.813000023; scale-y: 0.796000004; }
        frame 76 { x: 19.2999992; y: 61.5999985; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cornpult_husktip1";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 11.8000002; y: 67.3000031; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSKTIP1; }
        frame 6 { x: 13.3999996; y: 65.9000015; skew-x: 5.5; skew-y: 10.3000002; scale-x: 0.787; scale-y: 0.82099998; cel: -10000; image: none; }
        frame 7 { x: 14.8999996; y: 64.6999969; skew-x: 11; skew-y: 20.6000004; scale-x: 0.773999989; scale-y: 0.842999995; }
        frame 8 { x: 16.6000004; y: 63.7000008; skew-x: 16.7000008; skew-y: 31; scale-x: 0.760999978; scale-y: 0.86500001; }
        frame 9 { x: 15.3999996; y: 64.1999969; skew-x: 13.8000002; skew-y: 25.7999992; scale-x: 0.774999976; scale-y: 0.852999985; }
        frame 10 { x: 14.3000002; y: 64.6999969; skew-x: 11; skew-y: 20.6000004; scale-x: 0.788999975; scale-y: 0.842999995; }
        frame 11 { x: 13.1999998; y: 65.3000031; skew-x: 8.30000019; skew-y: 15.5; scale-x: 0.80400002; scale-y: 0.832000017; }
        frame 12 { x: 12; y: 66; skew-x: 5.5; skew-y: 10.3000002; scale-x: 0.818000019; scale-y: 0.82099998; }
        frame 13 { x: 11; y: 66.5999985; skew-x: 2.79999995; skew-y: 5; scale-x: 0.833000004; scale-y: 0.81099999; }
        frame 14 { x: 9.89999962; y: 67.3000031; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 15 { x: 9; y: 68.3000031; skew-x: -4.69999981; skew-y: -5; scale-x: 0.84799999; scale-y: 0.792999983; }
        frame 16 { x: 8.19999981; y: 69.3000031; skew-x: -9.39999962; skew-y: -10.1999998; scale-x: 0.848999977; scale-y: 0.787; }
        frame 17 { x: 7.19999981; y: 70.3000031; skew-x: -14.1999998; skew-y: -15.6000004; scale-x: 0.851000011; scale-y: 0.781000018; }
        frame 18 { x: 7.9000001; y: 69.8000031; skew-x: -11.6999998; skew-y: -12.8999996; scale-x: 0.842000008; scale-y: 0.783999979; }
        frame 19 { x: 8.69999981; y: 69.3000031; skew-x: -9.39999962; skew-y: -10.1999998; scale-x: 0.833000004; scale-y: 0.787; }
        frame 20 { x: 9.39999962; y: 68.8000031; skew-x: -6.9000001; skew-y: -7.69999981; scale-x: 0.824999988; scale-y: 0.790000021; }
        frame 21 { x: 10.1999998; y: 68.3000031; skew-x: -4.69999981; skew-y: -5; scale-x: 0.816999972; scale-y: 0.792999983; }
        frame 22 { x: 11; y: 67.8000031; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.808000028; scale-y: 0.796999991; }
        frame 23 { x: 11.8000002; y: 67.3000031; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 12.8000002; y: 66.5; skew-x: 3.29999995; skew-y: 6.0999999; scale-x: 0.791999996; scale-y: 0.813000023; }
        frame 26 { x: 13.6000004; y: 65.5999985; skew-x: 6.5; skew-y: 12.3000002; scale-x: 0.783999979; scale-y: 0.825999975; }
        frame 27 { x: 14.6000004; y: 65; skew-x: 9.80000019; skew-y: 18.5; scale-x: 0.776000023; scale-y: 0.838; }
        frame 28 { x: 15.6000004; y: 64.3000031; skew-x: 13.3000002; skew-y: 24.7999992; scale-x: 0.768000007; scale-y: 0.851000011; }
        frame 29 { x: 16.6000004; y: 63.7000008; skew-x: 16.7000008; skew-y: 31; scale-x: 0.760999978; scale-y: 0.86500001; }
        frame 30 { x: 14.1999998; y: 65.3000031; skew-x: 8.30000019; skew-y: 15.5; scale-x: 0.779999971; scale-y: 0.832000017; }
        frame 31 { x: 11.8000002; y: 67.3000031; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 32 { x: 10.6000004; y: 68; skew-x: -3.4000001; skew-y: -3.70000005; scale-x: 0.813000023; scale-y: 0.795000017; }
        frame 33 { x: 9.5; y: 68.8000031; skew-x: -6.9000001; skew-y: -7.69999981; scale-x: 0.824999988; scale-y: 0.790000021; }
        frame 34 { x: 8.39999962; y: 69.5; skew-x: -10.6999998; skew-y: -11.6999998; scale-x: 0.838; scale-y: 0.785000026; }
        frame 35 { x: 7.19999981; y: 70.3000031; skew-x: -14.1999998; skew-y: -15.6000004; scale-x: 0.851000011; scale-y: 0.781000018; }
        frame 36 { x: 7.30000019; y: -10000; skew-x: -10000; skew-y: -15.5; scale-x: 0.850000024; scale-y: 0.779999971; }
        frame 37 { x: 7.19999981; skew-y: -15.6000004; scale-x: 0.851000011; scale-y: 0.781000018; }
        frame 38 { x: 7.30000019; skew-y: -15.5; scale-x: 0.850000024; scale-y: 0.779999971; }
        frame 39 { x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 7.19999981; skew-y: -15.6000004; scale-x: 0.851000011; scale-y: 0.781000018; }
        frame 45 { x: 7.30000019; skew-y: -15.5; scale-x: 0.850000024; scale-y: 0.779999971; }
        frame 46 { x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { skew-y: -15.3999996; }
        frame 48 { y: 70.4000015; skew-y: -10000; }
        frame 49 { y: 70.3000031; }
        frame 50 { y: -10000; }
        frame 51 { skew-y: -15.5; }
        frame 52 { x: 8; y: 69.8000031; skew-x: -11.6999998; skew-y: -12.6999998; scale-x: 0.841000021; scale-y: 0.782999992; }
        frame 53 { x: 8.69999981; y: 69.3000031; skew-x: -9.39999962; skew-y: -10.1999998; scale-x: 0.833000004; scale-y: 0.786000013; }
        frame 54 { x: 9.39999962; y: 68.8000031; skew-x: -6.9000001; skew-y: -7.69999981; scale-x: 0.824999988; scale-y: 0.790000021; }
        frame 55 { x: 10.1999998; y: 68.3000031; skew-x: -4.69999981; skew-y: -4.9000001; scale-x: 0.815999985; scale-y: 0.792999983; }
        frame 56 { x: 11; y: 67.8000031; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.808000028; scale-y: 0.796999991; }
        frame 57 { x: 11.8000002; y: 67.3000031; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 13.3999996; y: 65.9000015; skew-x: 5.5; skew-y: 10.3000002; scale-x: 0.787; scale-y: 0.82099998; }
        frame 60 { x: 14.8999996; y: 64.6999969; skew-x: 11; skew-y: 20.6000004; scale-x: 0.773999989; scale-y: 0.842999995; }
        frame 61 { x: 16.6000004; y: 63.7000008; skew-x: 16.7000008; skew-y: 31; scale-x: 0.760999978; scale-y: 0.86500001; }
        frame 62 { x: 15.3999996; y: 64.1999969; skew-x: 13.8000002; skew-y: 25.7999992; scale-x: 0.774999976; scale-y: 0.852999985; }
        frame 63 { x: 14.3000002; y: 64.6999969; skew-x: 11; skew-y: 20.6000004; scale-x: 0.788999975; scale-y: 0.842999995; }
        frame 64 { x: 13.1999998; y: 65.3000031; skew-x: 8.30000019; skew-y: 15.5; scale-x: 0.80400002; scale-y: 0.832000017; }
        frame 65 { x: 12; y: 66; skew-x: 5.5; skew-y: 10.3000002; scale-x: 0.818000019; scale-y: 0.82099998; }
        frame 66 { x: 11; y: 66.5999985; skew-x: 2.79999995; skew-y: 5; scale-x: 0.833000004; scale-y: 0.81099999; }
        frame 67 { x: 9.89999962; y: 67.3000031; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 68 { x: 9; y: 68.3000031; skew-x: -4.69999981; skew-y: -5; scale-x: 0.84799999; scale-y: 0.792999983; }
        frame 69 { x: 8.19999981; y: 69.3000031; skew-x: -9.39999962; skew-y: -10.1999998; scale-x: 0.848999977; scale-y: 0.787; }
        frame 70 { x: 7.19999981; y: 70.3000031; skew-x: -14.1999998; skew-y: -15.6000004; scale-x: 0.851000011; scale-y: 0.781000018; }
        frame 71 { x: 7.9000001; y: 69.8000031; skew-x: -11.6999998; skew-y: -12.8999996; scale-x: 0.842000008; scale-y: 0.783999979; }
        frame 72 { x: 8.69999981; y: 69.3000031; skew-x: -9.39999962; skew-y: -10.1999998; scale-x: 0.833000004; scale-y: 0.787; }
        frame 73 { x: 9.39999962; y: 68.8000031; skew-x: -6.9000001; skew-y: -7.69999981; scale-x: 0.824999988; scale-y: 0.790000021; }
        frame 74 { x: 10.1999998; y: 68.3000031; skew-x: -4.69999981; skew-y: -5; scale-x: 0.816999972; scale-y: 0.792999983; }
        frame 75 { x: 11; y: 67.8000031; skew-x: -2.20000005; skew-y: -2.4000001; scale-x: 0.808000028; scale-y: 0.796999991; }
        frame 76 { x: 11.8000002; y: 67.3000031; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cornpult_husk4";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 56.2999992; y: 61.5; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSK4; }
        frame 6 { x: 56; y: 61.2999992; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.787; scale-y: 0.813000023; cel: -10000; image: none; }
        frame 7 { x: 55.7999992; y: 61.0999985; skew-x: -2.5; skew-y: -2.5; scale-x: 0.773999989; scale-y: 0.825999975; }
        frame 8 { x: 55.5; y: 61; skew-x: -4; skew-y: -4; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 9 { x: 55.7000008; y: 61.0999985; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.776000023; scale-y: 0.832000017; }
        frame 10 { x: 56; y: 61.2000008; skew-x: -2.5; skew-y: -2.5; scale-x: 0.790000021; scale-y: 0.825999975; }
        frame 11 { x: 56.2000008; y: 61.2999992; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.805000007; scale-y: 0.819000006; }
        frame 12 { x: 56.5; y: 61.4000015; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.819000006; scale-y: 0.813000023; }
        frame 13 { x: 56.7000008; y: -10000; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 14 { x: 57; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 15 { y: 61.5999985; skew-x: -10000; skew-y: -10000; scale-x: 0.870999992; scale-y: 0.792999983; }
        frame 16 { x: 57.0999985; y: 61.7999992; scale-x: 0.894999981; scale-y: 0.786000013; }
        frame 17 { x: 57.2999992; y: 61.9000015; scale-x: 0.91900003; scale-y: 0.777999997; }
        frame 18 { x: 57; y: -10000; scale-x: 0.898999989; scale-y: 0.782000005; }
        frame 19 { y: 61.7999992; scale-x: 0.879000008; scale-y: 0.786000013; }
        frame 20 { x: 56.7000008; y: 61.7000008; scale-x: 0.859000027; scale-y: 0.788999975; }
        frame 21 { x: 56.5; y: 61.5999985; scale-x: 0.839999974; scale-y: 0.792999983; }
        frame 22 { x: 56.4000015; y: 61.5; scale-x: 0.819999993; scale-y: 0.796000004; }
        frame 23 { x: 56.2999992; y: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 56; y: 61.4000015; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.791999996; scale-y: 0.808000028; }
        frame 26 { x: 55.9000015; y: 61.2999992; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.785000026; scale-y: 0.814999998; }
        frame 27 { x: 55.7999992; y: 61.0999985; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.77700001; scale-y: 0.823000014; }
        frame 28 { x: 55.5; y: 61; skew-x: -3; skew-y: -3; scale-x: 0.768999994; scale-y: 0.83099997; }
        frame 29 { x: -10000; y: -10000; skew-x: -4; skew-y: -4; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 30 { x: 55.9000015; y: 61.2999992; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.781000018; scale-y: 0.819000006; }
        frame 31 { x: 56.2999992; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 32 { x: 56.5; y: 61.5999985; skew-x: -10000; skew-y: -10000; scale-x: 0.829999983; scale-y: 0.795000017; }
        frame 33 { x: 56.7999992; y: 61.7000008; scale-x: 0.859000027; scale-y: 0.788999975; }
        frame 34 { x: 57; y: 61.7999992; scale-x: 0.888999999; scale-y: 0.783999979; }
        frame 35 { x: 57.2999992; y: 61.9000015; scale-x: 0.91900003; scale-y: 0.777999997; }
        frame 36 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 57; scale-x: 0.898999989; scale-y: 0.782000005; }
        frame 53 { y: 61.7999992; scale-x: 0.879000008; scale-y: 0.786000013; }
        frame 54 { x: 56.7000008; y: 61.7000008; scale-x: 0.859000027; scale-y: 0.788999975; }
        frame 55 { x: 56.5; y: 61.5999985; scale-x: 0.839999974; scale-y: 0.792999983; }
        frame 56 { x: 56.4000015; y: 61.5; scale-x: 0.819999993; scale-y: 0.796000004; }
        frame 57 { x: 56.2999992; y: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 56; y: 61.2999992; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.787; scale-y: 0.813000023; }
        frame 60 { x: 55.7999992; y: 61.0999985; skew-x: -2.5; skew-y: -2.5; scale-x: 0.773999989; scale-y: 0.825999975; }
        frame 61 { x: 55.5; y: 61; skew-x: -4; skew-y: -4; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 62 { x: 55.7000008; y: 61.0999985; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.776000023; scale-y: 0.832000017; }
        frame 63 { x: 56; y: 61.2000008; skew-x: -2.5; skew-y: -2.5; scale-x: 0.790000021; scale-y: 0.825999975; }
        frame 64 { x: 56.2000008; y: 61.2999992; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.805000007; scale-y: 0.819000006; }
        frame 65 { x: 56.5; y: 61.4000015; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.819000006; scale-y: 0.813000023; }
        frame 66 { x: 56.7000008; y: -10000; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 67 { x: 57; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 68 { y: 61.5999985; skew-x: -10000; skew-y: -10000; scale-x: 0.870999992; scale-y: 0.792999983; }
        frame 69 { x: 57.0999985; y: 61.7999992; scale-x: 0.894999981; scale-y: 0.786000013; }
        frame 70 { x: 57.2999992; y: 61.9000015; scale-x: 0.91900003; scale-y: 0.777999997; }
        frame 71 { x: 57; y: -10000; scale-x: 0.898999989; scale-y: 0.782000005; }
        frame 72 { y: 61.7999992; scale-x: 0.879000008; scale-y: 0.786000013; }
        frame 73 { x: 56.7000008; y: 61.7000008; scale-x: 0.859000027; scale-y: 0.788999975; }
        frame 74 { x: 56.5; y: 61.5999985; scale-x: 0.839999974; scale-y: 0.792999983; }
        frame 75 { x: 56.4000015; y: 61.5; scale-x: 0.819999993; scale-y: 0.796000004; }
        frame 76 { x: 56.2999992; y: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cornpult_husk2";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 44.9000015; y: 63; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSK2; }
        frame 6 { x: 44.5999985; y: 63.0999985; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.787; scale-y: 0.813000023; cel: -10000; image: none; }
        frame 7 { x: 44.4000015; y: -10000; skew-x: -4; skew-y: -4; scale-x: 0.773999989; scale-y: 0.825999975; }
        frame 8 { x: 44.0999985; y: 63.2000008; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 9 { x: 44.2000008; y: -10000; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.776000023; scale-y: 0.832000017; }
        frame 10 { x: 44.5; y: 63.0999985; skew-x: -4; skew-y: -4; scale-x: 0.790000021; scale-y: 0.825999975; }
        frame 11 { x: -10000; y: -10000; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.80400002; scale-y: 0.819000006; }
        frame 12 { x: 44.5999985; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.819000006; scale-y: 0.813000023; }
        frame 13 { x: 44.7000008; y: 63; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 14 { x: 44.9000015; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 15 { x: 44.7999992; y: 63.2999992; skew-x: -10000; skew-y: -10000; scale-x: 0.866999984; scale-y: 0.792999983; }
        frame 16 { x: -10000; y: 63.5; scale-x: 0.885999978; scale-y: 0.786000013; }
        frame 17 { y: 63.5999985; scale-x: 0.904999971; scale-y: 0.777999997; }
        frame 18 { y: 63.5; scale-x: 0.888000011; scale-y: 0.782000005; }
        frame 19 { y: -10000; scale-x: 0.870000005; scale-y: 0.786000013; }
        frame 20 { x: 44.9000015; y: 63.4000015; scale-x: 0.852999985; scale-y: 0.788999975; }
        frame 21 { x: -10000; y: 63.2000008; scale-x: 0.834999979; scale-y: 0.792999983; }
        frame 22 { y: 63.0999985; scale-x: 0.818000019; scale-y: 0.796000004; }
        frame 23 { y: 63; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 44.7000008; y: 63.0999985; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.791999996; scale-y: 0.808000028; }
        frame 26 { x: 44.5; y: -10000; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: 0.785000026; scale-y: 0.814999998; }
        frame 27 { x: 44.4000015; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: 0.77700001; scale-y: 0.823000014; }
        frame 28 { x: 44.2000008; y: 63.2000008; skew-x: -4.9000001; skew-y: -4.9000001; scale-x: 0.768999994; scale-y: 0.83099997; }
        frame 29 { x: 44.0999985; y: -10000; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 30 { x: 44.5; y: 63.0999985; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.781000018; scale-y: 0.819000006; }
        frame 31 { x: 44.9000015; y: 63; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 32 { x: 44.7999992; y: 63.2000008; skew-x: -10000; skew-y: -10000; scale-x: 0.825999975; scale-y: 0.795000017; }
        frame 33 { x: 44.9000015; y: 63.4000015; scale-x: 0.852999985; scale-y: 0.788999975; }
        frame 34 { x: -10000; y: 63.5; scale-x: 0.879000008; scale-y: 0.783999979; }
        frame 35 { x: 44.7999992; y: 63.5999985; scale-x: 0.904999971; scale-y: 0.777999997; }
        frame 36 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 44.9000015; }
        frame 49 { x: -10000; }
        frame 51 { x: 44.7999992; }
        frame 52 { x: 44.9000015; y: 63.5; scale-x: 0.888000011; scale-y: 0.782000005; }
        frame 53 { x: 44.7999992; y: -10000; scale-x: 0.870000005; scale-y: 0.786000013; }
        frame 54 { x: 44.9000015; y: 63.4000015; scale-x: 0.852999985; scale-y: 0.788999975; }
        frame 55 { x: -10000; y: 63.2000008; scale-x: 0.834999979; scale-y: 0.792999983; }
        frame 56 { y: 63.0999985; scale-x: 0.818000019; scale-y: 0.796000004; }
        frame 57 { y: 63; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 44.5999985; y: 63.0999985; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.787; scale-y: 0.813000023; }
        frame 60 { x: 44.4000015; y: -10000; skew-x: -4; skew-y: -4; scale-x: 0.773999989; scale-y: 0.825999975; }
        frame 61 { x: 44.0999985; y: 63.2000008; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: 0.762000024; scale-y: 0.838999987; }
        frame 62 { x: 44.2000008; y: -10000; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.776000023; scale-y: 0.832000017; }
        frame 63 { x: 44.5; y: 63.0999985; skew-x: -4; skew-y: -4; scale-x: 0.790000021; scale-y: 0.825999975; }
        frame 64 { x: -10000; y: -10000; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.80400002; scale-y: 0.819000006; }
        frame 65 { x: 44.5999985; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.819000006; scale-y: 0.813000023; }
        frame 66 { x: 44.7000008; y: 63; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.833000004; scale-y: 0.805999994; }
        frame 67 { x: 44.9000015; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 68 { x: 44.7999992; y: 63.2999992; skew-x: -10000; skew-y: -10000; scale-x: 0.866999984; scale-y: 0.792999983; }
        frame 69 { x: -10000; y: 63.5; scale-x: 0.885999978; scale-y: 0.786000013; }
        frame 70 { y: 63.5999985; scale-x: 0.904999971; scale-y: 0.777999997; }
        frame 71 { y: 63.5; scale-x: 0.888000011; scale-y: 0.782000005; }
        frame 72 { y: -10000; scale-x: 0.870000005; scale-y: 0.786000013; }
        frame 73 { x: 44.9000015; y: 63.4000015; scale-x: 0.852999985; scale-y: 0.788999975; }
        frame 74 { x: -10000; y: 63.2000008; scale-x: 0.834999979; scale-y: 0.792999983; }
        frame 75 { y: 63.0999985; scale-x: 0.818000019; scale-y: 0.796000004; }
        frame 76 { y: 63; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cornpult_husktip2";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 62.5; y: 65.5; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSKTIP2; }
        frame 6 { x: 61.4000015; y: 65; skew-x: -3; skew-y: -7.5; scale-x: 0.787; scale-y: 0.82099998; cel: -10000; image: none; }
        frame 7 { x: 60.2999992; y: 64.5; skew-x: -6.19999981; skew-y: -15.1999998; scale-x: 0.773999989; scale-y: 0.841000021; }
        frame 8 { x: 59.2999992; y: 64.3000031; skew-x: -9.5; skew-y: -23.1000004; scale-x: 0.762000024; scale-y: 0.862999976; }
        frame 9 { x: 60; y: 64.5999985; skew-x: -7.9000001; skew-y: -19.2000008; scale-x: 0.776000023; scale-y: 0.851000011; }
        frame 10 { x: 60.7999992; y: 64.6999969; skew-x: -6.19999981; skew-y: -15.1999998; scale-x: 0.790000021; scale-y: 0.841000021; }
        frame 11 { x: 61.5; y: 64.9000015; skew-x: -4.69999981; skew-y: -11.3999996; scale-x: 0.80400002; scale-y: 0.83099997; }
        frame 12 { x: 62.0999985; y: 65.0999985; skew-x: -3; skew-y: -7.5; scale-x: 0.819000006; scale-y: 0.82099998; }
        frame 13 { x: 62.9000015; y: 65.4000015; skew-x: -1.39999998; skew-y: -3.70000005; scale-x: 0.833000004; scale-y: 0.810000002; }
        frame 14 { x: 63.5; y: 65.5; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 15 { x: 65.5; y: 65.3000031; skew-x: 9.5; skew-y: 15.1000004; scale-x: 0.846000016; scale-y: 0.806999981; }
        frame 16 { x: 67.5999985; y: 65.6999969; skew-x: 19.1000004; skew-y: 30.3999996; scale-x: 0.843999982; scale-y: 0.81400001; }
        frame 17 { x: 69.4000015; y: 66.1999969; skew-x: 28.8999996; skew-y: 45.7000008; scale-x: -10000; scale-y: 0.823000014; }
        frame 18 { x: 68.3000031; y: 65.9000015; skew-x: 24; skew-y: 38.0999985; scale-x: 0.834999979; scale-y: 0.816999972; }
        frame 19 { x: 67.1999969; y: 65.8000031; skew-x: 19.1000004; skew-y: 30.3999996; scale-x: 0.828000009; scale-y: 0.81400001; }
        frame 20 { x: 66; y: 65.5; skew-x: 14.3000002; skew-y: 22.7999992; scale-x: 0.82099998; scale-y: 0.810000002; }
        frame 21 { x: 64.8000031; y: -10000; skew-x: 9.5; skew-y: 15.1000004; scale-x: 0.81400001; scale-y: 0.806999981; }
        frame 22 { x: 63.5999985; skew-x: 4.80000019; skew-y: 7.5; scale-x: 0.806999981; scale-y: 0.802999973; }
        frame 23 { x: 62.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 61.9000015; y: 65.0999985; skew-x: -1.70000005; skew-y: -4.4000001; scale-x: 0.791999996; scale-y: 0.811999977; }
        frame 26 { x: 61.0999985; y: 64.8000031; skew-x: -3.70000005; skew-y: -9.19999981; scale-x: 0.783999979; scale-y: 0.824999988; }
        frame 27 { x: 60.5999985; y: 64.5999985; skew-x: -5.69999981; skew-y: -13.6999998; scale-x: 0.77700001; scale-y: 0.837000012; }
        frame 28 { x: 59.9000015; y: 64.4000015; skew-x: -7.5; skew-y: -18.3999996; scale-x: 0.768999994; scale-y: 0.848999977; }
        frame 29 { x: 59.2999992; y: 64.3000031; skew-x: -9.5; skew-y: -23.1000004; scale-x: 0.762000024; scale-y: 0.862999976; }
        frame 30 { x: 61; y: 64.8000031; skew-x: -4.69999981; skew-y: -11.3999996; scale-x: 0.781000018; scale-y: 0.83099997; }
        frame 31 { x: 62.5; y: 65.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 32 { x: 64.3000031; y: 65.4000015; skew-x: 7.0999999; skew-y: 11.3000002; scale-x: 0.81099999; scale-y: 0.805000007; }
        frame 33 { x: 66; y: 65.5; skew-x: 14.3000002; skew-y: 22.7999992; scale-x: 0.82099998; scale-y: 0.810000002; }
        frame 34 { x: 67.6999969; y: 65.6999969; skew-x: 21.6000004; skew-y: 34.2999992; scale-x: 0.832000017; scale-y: 0.815999985; }
        frame 35 { x: 69.4000015; y: 66.1999969; skew-x: 28.8999996; skew-y: 45.7000008; scale-x: 0.843999982; scale-y: 0.823000014; }
        frame 36 { x: -10000; y: 66.3000031; skew-x: 28.7999992; skew-y: 45.5999985; scale-x: 0.842999995; scale-y: 0.82099998; }
        frame 37 { y: 66.1999969; skew-x: 28.8999996; skew-y: 45.7000008; scale-x: 0.843999982; scale-y: 0.823000014; }
        frame 38 { y: 66.3000031; skew-x: 28.7999992; skew-y: 45.5999985; scale-x: 0.842999995; scale-y: 0.82099998; }
        frame 39 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { y: 66.1999969; skew-x: 28.8999996; skew-y: 45.7000008; scale-x: 0.843999982; scale-y: 0.823000014; }
        frame 45 { y: 66.3000031; skew-x: 28.7999992; skew-y: 45.5999985; scale-x: 0.842000008; scale-y: 0.82099998; }
        frame 46 { x: 69.3000031; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: -10000; y: 66.1999969; }
        frame 48 { x: 69.4000015; y: 66.3000031; scale-y: 0.819999993; }
        frame 49 { x: -10000; y: -10000; scale-y: -10000; }
        frame 51 { scale-x: 0.842999995; scale-y: 0.82099998; }
        frame 52 { x: 68.3000031; y: 65.9000015; skew-x: 24; skew-y: 38.0999985; scale-x: 0.833999991; scale-y: 0.815999985; }
        frame 53 { x: 67.1999969; y: 65.6999969; skew-x: 19.1000004; skew-y: 30.2999992; scale-x: 0.828000009; scale-y: 0.813000023; }
        frame 54 { x: 66; y: 65.5999985; skew-x: 14.3000002; skew-y: 22.7999992; scale-x: 0.82099998; scale-y: 0.810000002; }
        frame 55 { x: 64.8000031; y: 65.4000015; skew-x: 9.5; skew-y: 15.1000004; scale-x: 0.81400001; scale-y: 0.805999994; }
        frame 56 { x: 63.5999985; y: -10000; skew-x: 4.80000019; skew-y: 7.5; scale-x: 0.806999981; scale-y: 0.802999973; }
        frame 57 { x: 62.5; y: 65.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 61.4000015; y: 65; skew-x: -3; skew-y: -7.5; scale-x: 0.787; scale-y: 0.82099998; }
        frame 60 { x: 60.2999992; y: 64.5; skew-x: -6.19999981; skew-y: -15.1999998; scale-x: 0.773999989; scale-y: 0.841000021; }
        frame 61 { x: 59.2999992; y: 64.3000031; skew-x: -9.5; skew-y: -23.1000004; scale-x: 0.762000024; scale-y: 0.862999976; }
        frame 62 { x: 60; y: 64.5999985; skew-x: -7.9000001; skew-y: -19.2000008; scale-x: 0.776000023; scale-y: 0.851000011; }
        frame 63 { x: 60.7999992; y: 64.6999969; skew-x: -6.19999981; skew-y: -15.1999998; scale-x: 0.790000021; scale-y: 0.841000021; }
        frame 64 { x: 61.5; y: 64.9000015; skew-x: -4.69999981; skew-y: -11.3999996; scale-x: 0.80400002; scale-y: 0.83099997; }
        frame 65 { x: 62.0999985; y: 65.0999985; skew-x: -3; skew-y: -7.5; scale-x: 0.819000006; scale-y: 0.82099998; }
        frame 66 { x: 62.9000015; y: 65.4000015; skew-x: -1.39999998; skew-y: -3.70000005; scale-x: 0.833000004; scale-y: 0.810000002; }
        frame 67 { x: 63.5; y: 65.5; skew-x: 0; skew-y: 0; scale-x: 0.847000003; scale-y: 0.800000012; }
        frame 68 { x: 65.5; y: 65.3000031; skew-x: 9.5; skew-y: 15.1000004; scale-x: 0.846000016; scale-y: 0.806999981; }
        frame 69 { x: 67.5999985; y: 65.6999969; skew-x: 19.1000004; skew-y: 30.3999996; scale-x: 0.843999982; scale-y: 0.81400001; }
        frame 70 { x: 69.4000015; y: 66.1999969; skew-x: 28.8999996; skew-y: 45.7000008; scale-x: -10000; scale-y: 0.823000014; }
        frame 71 { x: 68.3000031; y: 65.9000015; skew-x: 24; skew-y: 38.0999985; scale-x: 0.834999979; scale-y: 0.816999972; }
        frame 72 { x: 67.1999969; y: 65.8000031; skew-x: 19.1000004; skew-y: 30.3999996; scale-x: 0.828000009; scale-y: 0.81400001; }
        frame 73 { x: 66; y: 65.5; skew-x: 14.3000002; skew-y: 22.7999992; scale-x: 0.82099998; scale-y: 0.810000002; }
        frame 74 { x: 64.8000031; y: -10000; skew-x: 9.5; skew-y: 15.1000004; scale-x: 0.81400001; scale-y: 0.806999981; }
        frame 75 { x: 63.5999985; skew-x: 4.80000019; skew-y: 7.5; scale-x: 0.806999981; scale-y: 0.802999973; }
        frame 76 { x: 62.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "Cornpult_stalk1";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 38.7999992; y: 9.39999962; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK1; }
        frame 6 { x: 38.5999985; y: 9.80000019; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 38.5; y: 10.1000004; skew-x: 3; skew-y: 3; }
        frame 8 { x: -10000; y: 10.5; skew-x: 2.5999999; skew-y: 2.5999999; }
        frame 9 { x: 38.4000015; y: 10.8000002; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 10 { x: 38.2999992; y: 11.1999998; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 11 { x: 38.0999985; y: 11.5; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 12 { x: -10000; y: 12; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 13 { x: 38; y: 12.3000002; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 14 { x: -10000; y: 12.6000004; skew-x: 0; skew-y: 0; }
        frame 15 { y: 12.3000002; skew-x: -10000; skew-y: -10000; }
        frame 16 { y: 12.1000004; }
        frame 17 { x: 38; y: 11.6999998; skew-x: 0.5; skew-y: 0.5; }
        frame 18 { x: 38.2000008; y: 11.3000002; skew-x: 1; skew-y: 1; }
        frame 19 { x: 38.2999992; y: 10.8999996; skew-x: 1.60000002; skew-y: 1.60000002; }
        frame 20 { x: 38.4000015; y: 10.5; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 21 { x: 38.5; y: 10.1999998; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 22 { x: 38.5999985; y: 9.80000019; skew-x: 3.29999995; skew-y: 3.29999995; }
        frame 23 { x: 38.7999992; y: 9.39999962; skew-x: 4.0999999; skew-y: 4.0999999; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 35.9000015; y: 10.6000004; skew-x: -3.9000001; skew-y: -1.70000005; scale-x: 0.802999973; }
        frame 26 { x: 33; y: 11.8000002; skew-x: -12.1999998; skew-y: -7.69999981; scale-x: 0.805000007; scale-y: 0.799000025; }
        frame 27 { x: 30.3999996; y: 13.1000004; skew-x: -20.2000008; skew-y: -13.5; scale-x: 0.808000028; scale-y: -10000; }
        frame 28 { x: 27.7999992; y: 14.3999996; skew-x: -28.5; skew-y: -19.5; scale-x: 0.81099999; scale-y: 0.797999978; }
        frame 29 { x: 25.3999996; y: 15.8000002; skew-x: -36.7999992; skew-y: -25.5; scale-x: 0.814999998; scale-y: 0.799000025; }
        frame 30 { x: 25; y: -10000; skew-x: -35.7999992; skew-y: -36.7999992; scale-x: 0.749000013; scale-y: 0.862999976; }
        frame 31 { x: 24.6000004; y: 16.1000004; skew-x: -35; skew-y: -48.2000008; scale-x: 0.685000002; scale-y: 0.930000007; }
        frame 32 { x: 30.7000008; y: 11.8000002; skew-x: -17.2000008; skew-y: -27.7000008; scale-x: 0.684000015; scale-y: 0.921000004; }
        frame 33 { x: 37.7999992; y: 8.30000019; skew-x: 0.300000012; skew-y: -7.5; scale-x: -10000; scale-y: 0.913999975; }
        frame 34 { x: 45.5; y: 5.30000019; skew-x: 8.39999962; skew-y: 15.1000004; scale-x: 0.67900002; scale-y: 1.05999994; }
        frame 35 { x: 54.2999992; y: 4.69999981; skew-x: 49; skew-y: 35.7999992; scale-x: 0.685000002; scale-y: 0.927999973; }
        frame 36 { x: 55.2000008; y: -10000; skew-x: 48.9000015; skew-y: 35.5999985; scale-x: 0.683000028; scale-y: 0.926999986; }
        frame 37 { x: 56.0999985; skew-x: 48.7000008; skew-y: -10000; scale-x: 0.684000015; scale-y: 0.927999973; }
        frame 38 { x: 55.9000015; skew-x: 48.9000015; scale-x: 0.683000028; scale-y: 0.926999986; }
        frame 39 { x: 55.5; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 55.2999992; }
        frame 41 { x: 55; }
        frame 42 { x: 54.7999992; y: 4.5999999; scale-x: 0.684000015; }
        frame 43 { x: 54.5; y: 4.69999981; skew-y: 35.7999992; scale-x: -10000; }
        frame 44 { x: 54.2999992; y: -10000; skew-x: 49; skew-y: -10000; scale-x: 0.685000002; scale-y: 0.927999973; }
        frame 45 { x: 54.4000015; skew-x: 48.9000015; scale-x: 0.683000028; scale-y: 0.926999986; }
        frame 46 { x: 54.5; skew-x: -10000; scale-x: -10000; scale-y: 0.925999999; }
        frame 47 { x: 54.5999985; skew-y: 35.5999985; scale-y: -10000; }
        frame 48 { x: 54.7999992; skew-y: -10000; }
        frame 49 { x: 54.9000015; }
        frame 50 { x: 55; y: 4.80000019; scale-y: 0.925000012; }
        frame 51 { x: 55.0999985; y: 4.69999981; scale-y: 0.926999986; }
        frame 52 { x: 52.2000008; y: 5.9000001; skew-x: 41.4000015; skew-y: 30.2999992; scale-x: 0.700999975; scale-y: 0.848999977; }
        frame 53 { x: 49.5; y: 7.30000019; skew-x: 33.7999992; skew-y: 25; scale-x: 0.721000016; scale-y: 0.774999976; }
        frame 54 { x: 46.5999985; y: 6.30000019; skew-x: 26.2999992; skew-y: 19.7999992; scale-x: 0.740999997; scale-y: 0.861999989; }
        frame 55 { x: 43.9000015; y: 7.0999999; skew-x: 18.7999992; skew-y: 14.5; scale-x: 0.75999999; scale-y: 0.841000021; }
        frame 56 { x: 41.2999992; y: 8.19999981; skew-x: 11.3000002; skew-y: 9.30000019; scale-x: 0.779999971; scale-y: 0.819999993; }
        frame 57 { x: 38.7999992; y: 9.39999962; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 38.5999985; y: 9.80000019; skew-x: 3.5; skew-y: 3.5; }
        frame 60 { x: 38.5; y: 10.1000004; skew-x: 3; skew-y: 3; }
        frame 61 { x: -10000; y: 10.5; skew-x: 2.5999999; skew-y: 2.5999999; }
        frame 62 { x: 38.4000015; y: 10.8000002; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 63 { x: 38.2999992; y: 11.1999998; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 64 { x: 38.0999985; y: 11.5; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 65 { x: -10000; y: 12; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 66 { x: 38; y: 12.3000002; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 67 { x: -10000; y: 12.6000004; skew-x: 0; skew-y: 0; }
        frame 68 { y: 12.3000002; skew-x: -10000; skew-y: -10000; }
        frame 69 { y: 12.1000004; }
        frame 70 { x: 38; y: 11.6999998; skew-x: 0.5; skew-y: 0.5; }
        frame 71 { x: 38.2000008; y: 11.3000002; skew-x: 1; skew-y: 1; }
        frame 72 { x: 38.2999992; y: 10.8999996; skew-x: 1.60000002; skew-y: 1.60000002; }
        frame 73 { x: 38.4000015; y: 10.5; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 74 { x: 38.5; y: 10.1999998; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 75 { x: 38.5999985; y: 9.80000019; skew-x: 3.29999995; skew-y: 3.29999995; }
        frame 76 { x: 38.7999992; y: 9.39999962; skew-x: 4.0999999; skew-y: 4.0999999; }
    }
    Track {
        source-name: "Cornpult_stalk2";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 26.2000008; y: 8.5; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK2; }
        frame 6 { x: 26.6000004; y: 8.10000038; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: 0.799000025; scale-y: 0.799000025; cel: -10000; image: none; }
        frame 7 { x: 27.1000004; y: 7.5999999; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 26.7999992; y: 8.5; skew-x: 8.5; skew-y: 8.5; }
        frame 9 { x: 26.6000004; y: 9.30000019; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 10 { x: 26.2999992; y: 10; skew-x: 4.0999999; skew-y: 4.0999999; }
        frame 11 { x: 26.1000004; y: 10.8000002; skew-x: 2; skew-y: 2; }
        frame 12 { x: 25.8999996; y: 11.6999998; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 13 { x: 25.7000008; y: 12.5; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 25.5; y: 13.3999996; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 15 { x: -10000; y: 13.6000004; skew-x: -6.4000001; skew-y: -3.9000001; scale-x: 0.800999999; }
        frame 16 { x: 25.3999996; y: 13.8000002; skew-x: -8.60000038; skew-y: -3.4000001; scale-x: 0.802999973; }
        frame 17 { x: 25.5; y: 13; skew-x: -6.69999981; skew-y: -2.20000005; scale-x: 0.801999986; }
        frame 18 { x: -10000; y: 12.1999998; skew-x: -4.9000001; skew-y: -1.20000005; scale-x: -10000; }
        frame 19 { x: 25.7000008; y: 11.5; skew-x: -3; skew-y: -0.200000003; scale-x: 0.800999999; }
        frame 20 { x: 25.7999992; y: 10.6999998; skew-x: -1.20000005; skew-y: 0.800000012; scale-x: -10000; }
        frame 21 { x: 25.8999996; y: 10; skew-x: 0.300000012; skew-y: 1.79999995; }
        frame 22 { x: -10000; y: 9.30000019; skew-x: 2.0999999; skew-y: 2.79999995; scale-x: 0.800000012; }
        frame 23 { x: 26.2000008; y: 8.5; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: -10000; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 23.5; y: 10.6000004; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 26 { x: 20.8999996; y: 12.8000002; skew-x: -7.69999981; skew-y: -7.69999981; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 27 { x: 18.3999996; y: 15.1000004; skew-x: -13.5; skew-y: -13.5; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 15.8999996; y: 17.3999996; skew-x: -19.5; skew-y: -19.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 29 { x: 13.6000004; y: 19.7999992; skew-x: -25.5; skew-y: -25.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 30 { x: 14.5; y: 19.6000004; skew-x: -24.3999996; skew-y: -19; scale-x: 0.797999978; scale-y: 0.805000007; }
        frame 31 { x: 15.3999996; y: 19.2999992; skew-x: -23.3999996; skew-y: -12.8000002; scale-x: 0.799000025; scale-y: 0.813000023; }
        frame 32 { x: 21.3999996; y: 9; skew-x: 9; skew-y: 19.6000004; scale-x: 0.802999973; scale-y: 0.805000007; }
        frame 33 { x: 32.4000015; y: 0.400000006; skew-x: 41.7000008; skew-y: 52.2999992; scale-x: 0.808000028; scale-y: 0.799000025; }
        frame 34 { x: 46.9000015; y: -4.5999999; skew-x: 78.5; skew-y: 88.8000031; scale-x: 0.921000004; scale-y: 0.802999973; }
        frame 35 { x: 61.0999985; y: 0.899999976; skew-x: 115.199997; skew-y: 126; scale-x: 0.797999978; scale-y: 0.810000002; }
        frame 36 { x: 62.4000015; y: 1.29999995; skew-x: 118.900002; skew-y: 129.600006; scale-x: 0.796000004; scale-y: 0.809000015; }
        frame 37 { x: 63.5; y: 1.79999995; skew-x: 122.699997; skew-y: 133.5; scale-x: 0.796999991; scale-y: 0.810000002; }
        frame 38 { x: 63.2000008; y: 1.70000005; skew-x: 121.599998; skew-y: 132.399994; scale-x: 0.796000004; scale-y: 0.809000015; }
        frame 39 { x: 62.9000015; y: 1.60000002; skew-x: 120.599998; skew-y: 131.399994; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 62.5; y: 1.5; skew-x: 119.599998; skew-y: 130.300003; }
        frame 41 { x: 62.2000008; y: 1.29999995; skew-x: 118.300003; skew-y: 129.100006; }
        frame 42 { x: 61.7999992; y: 1.20000005; skew-x: 117.300003; skew-y: 128.100006; }
        frame 43 { x: 61.5; y: 1.10000002; skew-x: 116.300003; skew-y: 127.099998; }
        frame 44 { x: 61.0999985; y: 0.899999976; skew-x: 115.199997; skew-y: 126; scale-x: 0.797999978; scale-y: 0.810000002; }
        frame 45 { x: 61.2999992; y: 1; skew-x: 115.599998; skew-y: 126.400002; scale-x: 0.796000004; scale-y: 0.809000015; }
        frame 46 { x: 61.5; y: -10000; skew-x: 116.300003; skew-y: 127.099998; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 61.5999985; y: 1.10000002; skew-x: 116.800003; skew-y: 127.599998; scale-y: 0.808000028; }
        frame 48 { x: 61.7999992; y: 1.20000005; skew-x: 117.300003; skew-y: 128.100006; scale-y: -10000; }
        frame 49 { x: 62; y: 1.29999995; skew-x: 117.800003; skew-y: 128.600006; }
        frame 50 { x: 62.0999985; y: 1.20000005; skew-x: 118.300003; skew-y: 129.100006; scale-x: 0.795000017; }
        frame 51 { x: 62.4000015; y: 1.39999998; skew-x: 118.900002; skew-y: 129.600006; scale-x: 0.796000004; scale-y: 0.809000015; }
        frame 52 { x: 57; y: -0.400000006; skew-x: 99.5999985; skew-y: 108.599998; scale-x: -10000; scale-y: 0.805999994; }
        frame 53 { x: 50.9000015; y: -1.89999998; skew-x: 80.6999969; skew-y: 88; scale-y: 0.805000007; }
        frame 54 { x: 43.7999992; y: -2.5; skew-x: 61.4000015; skew-y: 66.9000015; scale-x: 0.796999991; scale-y: 0.802999973; }
        frame 55 { x: 37.5999985; y: -0.100000001; skew-x: 42.4000015; skew-y: 45.9000015; scale-x: -10000; scale-y: 0.800999999; }
        frame 56 { x: 31.7000008; y: 3.5; skew-x: 23.1000004; skew-y: 25; scale-x: 0.797999978; scale-y: 0.800000012; }
        frame 57 { x: 26.2000008; y: 8.5; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.800000012; scale-y: -10000; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 59 { x: 26.6000004; y: 8.10000038; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 60 { x: 27.1000004; y: 7.5999999; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 26.7999992; y: 8.5; skew-x: 8.5; skew-y: 8.5; }
        frame 62 { x: 26.6000004; y: 9.30000019; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 63 { x: 26.2999992; y: 10; skew-x: 4.0999999; skew-y: 4.0999999; }
        frame 64 { x: 26.1000004; y: 10.8000002; skew-x: 2; skew-y: 2; }
        frame 65 { x: 25.8999996; y: 11.6999998; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 66 { x: 25.7000008; y: 12.5; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 25.5; y: 13.3999996; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 68 { x: -10000; y: 13.6000004; skew-x: -6.4000001; skew-y: -3.9000001; scale-x: 0.800999999; }
        frame 69 { x: 25.3999996; y: 13.8000002; skew-x: -8.60000038; skew-y: -3.4000001; scale-x: 0.802999973; }
        frame 70 { x: 25.5; y: 13; skew-x: -6.69999981; skew-y: -2.20000005; scale-x: 0.801999986; }
        frame 71 { x: -10000; y: 12.1999998; skew-x: -4.9000001; skew-y: -1.20000005; scale-x: -10000; }
        frame 72 { x: 25.7000008; y: 11.5; skew-x: -3; skew-y: -0.200000003; scale-x: 0.800999999; }
        frame 73 { x: 25.7999992; y: 10.6999998; skew-x: -1.20000005; skew-y: 0.800000012; scale-x: -10000; }
        frame 74 { x: 25.8999996; y: 10; skew-x: 0.300000012; skew-y: 1.79999995; }
        frame 75 { x: -10000; y: 9.30000019; skew-x: 2.0999999; skew-y: 2.79999995; scale-x: 0.800000012; }
        frame 76 { x: 26.2000008; y: 8.5; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: -10000; }
    }
    Track {
        source-name: "Cornpult_stalk4";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 14; y: 13.5; skew-x: 19.1000004; skew-y: 19.1000004; scale-x: 0.754999995; scale-y: 0.754999995; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK4; }
        frame 6 { x: 14.5; y: 12; skew-x: 23.2999992; skew-y: 23.2999992; scale-x: 0.754000008; scale-y: 0.754000008; cel: -10000; image: none; }
        frame 7 { x: 15; y: 10.5; skew-x: 27.6000004; skew-y: 27.6000004; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 14.8000002; y: 11.8999996; skew-x: 24.2999992; skew-y: 24.2999992; scale-x: 0.753000021; scale-y: 0.753000021; }
        frame 9 { x: 14.6999998; y: 13.5; skew-x: 21.2999992; skew-y: 21.2999992; scale-x: 0.754000008; scale-y: 0.754000008; }
        frame 10 { x: 14.5; y: 15; skew-x: 18.1000004; skew-y: 18.1000004; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 14.3999996; y: 16.5; skew-x: 14.8000002; skew-y: 14.8000002; }
        frame 12 { x: 14.1999998; y: 18; skew-x: 11.8000002; skew-y: 11.8000002; }
        frame 13 { x: 14; y: 19.6000004; skew-x: 8.5; skew-y: 8.5; scale-x: 0.754999995; scale-y: 0.754999995; }
        frame 14 { x: 13.8000002; y: 21.1000004; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 13.3000002; y: 21.8999996; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 16 { x: 12.6999998; y: 22.7999992; skew-x: -6.4000001; skew-y: -6.4000001; scale-x: 0.754000008; scale-y: 0.754000008; }
        frame 17 { x: 12.8000002; y: 21.5; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 13; y: 20; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.754999995; scale-y: 0.754999995; }
        frame 19 { x: 13.1999998; y: 18.7000008; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 13.3000002; y: 17.2999992; skew-x: 8; skew-y: 8; }
        frame 21 { x: 13.6000004; y: 16; skew-x: 11.6000004; skew-y: 11.6000004; }
        frame 22 { x: 13.6999998; y: 14.6999998; skew-x: 15.3000002; skew-y: 15.3000002; }
        frame 23 { x: 14; y: 13.5; skew-x: 19.1000004; skew-y: 19.1000004; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 12.3999996; y: 17.5; skew-x: 9; skew-y: 9; }
        frame 26 { x: 10.8000002; y: 21.5; skew-x: -0.5; skew-y: -0.5; }
        frame 27 { x: 9.30000019; y: 25.7999992; skew-x: -10.3999996; skew-y: -10.3999996; scale-x: 0.754000008; scale-y: 0.754000008; }
        frame 28 { x: 7.80000019; y: 30.1000004; skew-x: -20.2000008; skew-y: -20.2000008; scale-x: 0.753000021; scale-y: 0.753000021; }
        frame 29 { x: 6.69999981; y: 34.5; skew-x: -30.2000008; skew-y: -30.2000008; scale-x: 0.754000008; scale-y: 0.754000008; }
        frame 30 { x: 6.80000019; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.753000021; scale-y: 0.753000021; }
        frame 31 { x: 6.69999981; scale-x: 0.754000008; scale-y: 0.754000008; }
        frame 32 { x: 5.69999981; y: 21.2000008; skew-x: -8.89999962; skew-y: -8.89999962; scale-x: 0.751999974; scale-y: 0.751999974; }
        frame 33 { x: 14; y: 2.79999995; skew-x: 31.2999992; skew-y: 31.2999992; scale-x: -10000; scale-y: 0.750999987; }
        frame 34 { x: 31.5; y: -14.8999996; skew-x: 69.9000015; skew-y: 70; scale-x: 0.750999987; scale-y: 0.75; }
        frame 35 { x: 57.5999985; y: -16.1000004; skew-x: 108.400002; skew-y: 108.5; scale-x: 0.753000021; scale-y: 0.750999987; }
        frame 36 { x: 60.5999985; y: -15.5; skew-x: 117.800003; skew-y: 118; scale-x: 0.750999987; scale-y: 0.75; }
        frame 37 { x: 63.4000015; y: -14.8000002; skew-x: 127.5; skew-y: 127.5; scale-x: 0.751999974; scale-y: -10000; }
        frame 38 { x: 62.5999985; y: -15; skew-x: 124.800003; skew-y: 124.800003; scale-x: 0.750999987; scale-y: 0.749000013; }
        frame 39 { x: 61.9000015; y: -15.1000004; skew-x: 122.099998; skew-y: 122.099998; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 61; y: -15.3999996; skew-x: 119.300003; skew-y: 119.300003; scale-y: 0.75; }
        frame 41 { x: 60.2999992; y: -15.5; skew-x: 116.599998; skew-y: 116.599998; scale-y: -10000; }
        frame 42 { x: 59.4000015; y: -15.6999998; skew-x: 113.800003; skew-y: 113.800003; }
        frame 43 { x: 58.5; y: -15.8999996; skew-x: 111.099998; skew-y: 111.099998; scale-x: 0.751999974; }
        frame 44 { x: 57.5999985; y: -16.1000004; skew-x: 108.400002; skew-y: 108.5; scale-x: 0.753000021; scale-y: 0.750999987; }
        frame 45 { x: 58; y: -16; skew-x: 109.800003; skew-y: 109.800003; scale-x: 0.751999974; scale-y: 0.75; }
        frame 46 { x: 58.5; y: -10000; skew-x: 111; skew-y: 111.099998; scale-x: 0.750999987; scale-y: -10000; }
        frame 47 { x: 58.9000015; y: -15.8999996; skew-x: 112.300003; skew-y: 112.5; scale-x: -10000; }
        frame 48 { x: 59.5; y: -15.8000002; skew-x: 113.800003; skew-y: 113.800003; scale-y: 0.749000013; }
        frame 49 { x: 59.9000015; y: -15.6999998; skew-x: 115.099998; skew-y: 115.300003; scale-y: -10000; }
        frame 50 { x: 60.2999992; y: -15.6000004; skew-x: 116.300003; skew-y: 116.599998; scale-x: 0.75; }
        frame 51 { x: 60.5999985; y: -15.3999996; skew-x: 117.800003; skew-y: 118; scale-x: 0.750999987; scale-y: 0.75; }
        frame 52 { x: 51.5; y: -13.3999996; skew-x: 101.300003; skew-y: 101.5; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 42; y: -11.1999998; skew-x: 85; skew-y: 85.1999969; scale-x: 0.751999974; scale-y: 0.750999987; }
        frame 54 { x: 32; y: -8.69999981; skew-x: 68.5; skew-y: 68.6999969; scale-x: -10000; scale-y: 0.751999974; }
        frame 55 { x: 26.2000008; y: -1.79999995; skew-x: 51.9000015; skew-y: 52.0999985; scale-y: -10000; }
        frame 56 { x: 20.2000008; y: 5.5; skew-x: 35.5999985; skew-y: 35.5999985; scale-x: 0.753000021; scale-y: 0.753000021; }
        frame 57 { x: 14; y: 13.5; skew-x: 19.1000004; skew-y: 19.1000004; scale-x: 0.754999995; scale-y: 0.754999995; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 14.5; y: 12; skew-x: 23.2999992; skew-y: 23.2999992; scale-x: 0.754000008; scale-y: 0.754000008; }
        frame 60 { x: 15; y: 10.5; skew-x: 27.6000004; skew-y: 27.6000004; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 14.8000002; y: 11.8999996; skew-x: 24.2999992; skew-y: 24.2999992; scale-x: 0.753000021; scale-y: 0.753000021; }
        frame 62 { x: 14.6999998; y: 13.5; skew-x: 21.2999992; skew-y: 21.2999992; scale-x: 0.754000008; scale-y: 0.754000008; }
        frame 63 { x: 14.5; y: 15; skew-x: 18.1000004; skew-y: 18.1000004; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 14.3999996; y: 16.5; skew-x: 14.8000002; skew-y: 14.8000002; }
        frame 65 { x: 14.1999998; y: 18; skew-x: 11.8000002; skew-y: 11.8000002; }
        frame 66 { x: 14; y: 19.6000004; skew-x: 8.5; skew-y: 8.5; scale-x: 0.754999995; scale-y: 0.754999995; }
        frame 67 { x: 13.8000002; y: 21.1000004; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 13.3000002; y: 21.8999996; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 69 { x: 12.6999998; y: 22.7999992; skew-x: -6.4000001; skew-y: -6.4000001; scale-x: 0.754000008; scale-y: 0.754000008; }
        frame 70 { x: 12.8000002; y: 21.5; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 13; y: 20; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.754999995; scale-y: 0.754999995; }
        frame 72 { x: 13.1999998; y: 18.7000008; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 13.3000002; y: 17.2999992; skew-x: 8; skew-y: 8; }
        frame 74 { x: 13.6000004; y: 16; skew-x: 11.6000004; skew-y: 11.6000004; }
        frame 75 { x: 13.6999998; y: 14.6999998; skew-x: 15.3000002; skew-y: 15.3000002; }
        frame 76 { x: 14; y: 13.5; skew-x: 19.1000004; skew-y: 19.1000004; }
    }
    Track {
        source-name: "Cornpult_stalk3";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 14.6000004; y: 16; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK3; }
        frame 6 { x: 14.8000002; y: 14.5; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.799000025; scale-y: 0.799000025; cel: -10000; image: none; }
        frame 7 { x: 15.1000004; y: 13; skew-x: 12.8000002; skew-y: 12.8000002; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: -10000; y: 14.5; skew-x: 9.5; skew-y: 9.5; }
        frame 9 { x: 15; y: 16; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 10 { y: 17.3999996; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 11 { x: -10000; y: 18.8999996; skew-x: 0; skew-y: 0; }
        frame 12 { y: 20.3999996; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 13 { y: 21.8999996; skew-x: -6.19999981; skew-y: -6.19999981; }
        frame 14 { y: 23.3999996; skew-x: -9.39999962; skew-y: -9.39999962; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 15 { x: 15; y: 24.1000004; skew-x: -12.3999996; skew-y: -8.19999981; scale-x: 0.802999973; scale-y: 0.799000025; }
        frame 16 { y: 25; skew-x: -15.5; skew-y: -7.19999981; scale-x: 0.808000028; scale-y: -10000; }
        frame 17 { x: 14.8999996; y: 23.7000008; skew-x: -12.6999998; skew-y: -5.4000001; scale-x: 0.805999994; }
        frame 18 { x: 14.6999998; y: 22.3999996; skew-x: -9.69999981; skew-y: -3.9000001; scale-x: 0.805000007; }
        frame 19 { x: 14.6000004; y: 21.2000008; skew-x: -6.9000001; skew-y: -2.20000005; scale-x: 0.80400002; }
        frame 20 { x: -10000; y: 20; skew-x: -4.19999981; skew-y: -0.699999988; scale-x: 0.802999973; scale-y: 0.800000012; }
        frame 21 { x: 14.5; y: 18.7000008; skew-x: -1.39999998; skew-y: 0.800000012; scale-x: 0.801999986; scale-y: -10000; }
        frame 22 { x: -10000; y: 17.5; skew-x: 1.10000002; skew-y: 2.29999995; scale-x: 0.800999999; }
        frame 23 { x: 14.6000004; y: 16; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.800000012; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 25 { x: 13; y: 19.7999992; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 26 { x: 11.6999998; y: 23.7000008; skew-x: -15.5; skew-y: -15.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 27 { x: 10.5; y: 27.7999992; skew-x: -25.5; skew-y: -25.5; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 9.69999981; y: 31.7999992; skew-x: -35.2999992; skew-y: -35.2999992; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 29 { x: 9; y: 35.7000008; skew-x: -45.2000008; skew-y: -45.2000008; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 30 { x: 9.10000038; y: 35.5999985; skew-x: -44; skew-y: -44; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 31 { x: 9.19999981; y: 35.2999992; skew-x: -42.9000015; skew-y: -42.9000015; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 32 { x: 7.4000001; y: 23.7999992; skew-x: -32; skew-y: -32; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 33 { x: 13.3000002; y: 5.5999999; skew-x: -2.4000001; skew-y: -2.4000001; scale-x: -10000; scale-y: 0.79400003; }
        frame 34 { x: 30.5; y: -12.6999998; skew-x: 46.5999985; skew-y: 46.5999985; scale-y: 0.792999983; }
        frame 35 { x: 55.2999992; y: -15; skew-x: 95.6999969; skew-y: 95.6999969; scale-x: 0.796999991; scale-y: 0.795000017; }
        frame 36 { x: 58.0999985; y: -14.6999998; skew-x: 101.800003; skew-y: 101.800003; scale-x: 0.796000004; scale-y: 0.79400003; }
        frame 37 { x: 60.9000015; y: -14.5; skew-x: 108; skew-y: 108; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 60.0999985; y: -10000; skew-x: 106.300003; skew-y: 106.300003; }
        frame 39 { x: 59.4000015; y: -14.6000004; skew-x: 104.5; skew-y: 104.5; }
        frame 40 { x: 58.5999985; y: -14.6999998; skew-x: 102.800003; skew-y: 102.800003; }
        frame 41 { x: 57.7999992; y: -14.8000002; skew-x: 101; skew-y: 101; }
        frame 42 { x: 57; y: -14.8999996; skew-x: 99.0999985; skew-y: 99.3000031; }
        frame 43 { x: 56.0999985; y: -15; skew-x: 97.3000031; skew-y: 97.3000031; scale-x: 0.796999991; scale-y: 0.795000017; }
        frame 44 { x: 55.2999992; y: -10000; skew-x: 95.6999969; skew-y: 95.6999969; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 55.5999985; skew-x: 96.5; skew-y: 96.5; }
        frame 46 { x: 56.0999985; y: -14.8999996; skew-x: 97.3000031; skew-y: 97.3000031; scale-x: 0.796000004; scale-y: 0.79400003; }
        frame 47 { x: 56.5; y: -14.8000002; skew-x: 98.3000031; skew-y: 98.3000031; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 57; y: -10000; skew-x: 99.0999985; skew-y: 99.0999985; }
        frame 49 { x: 57.4000015; skew-x: 100; skew-y: 100; }
        frame 50 { x: 57.7999992; y: -14.6999998; skew-x: 100.800003; skew-y: 100.800003; }
        frame 51 { x: 58.2000008; y: -10000; skew-x: 101.800003; skew-y: 101.800003; }
        frame 52 { x: 48.9000015; y: -13.1000004; skew-x: 85.5; skew-y: 85.6999969; scale-y: 0.795000017; }
        frame 53 { x: 39.2000008; y: -11; skew-x: 69.1999969; skew-y: 69.1999969; scale-y: 0.79400003; }
        frame 54 { x: 29.5; y: -8.10000038; skew-x: 52.9000015; skew-y: 52.9000015; scale-x: 0.796999991; scale-y: 0.796000004; }
        frame 55 { x: 24.2000008; y: -0.600000024; skew-x: 36.5999985; skew-y: 36.5999985; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 19.2000008; y: 7.30000019; skew-x: 20.2999992; skew-y: 20.2999992; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 57 { x: 14.6000004; y: 16; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 14.8000002; y: 14.5; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 60 { x: 15.1000004; y: 13; skew-x: 12.8000002; skew-y: 12.8000002; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -10000; y: 14.5; skew-x: 9.5; skew-y: 9.5; }
        frame 62 { x: 15; y: 16; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 63 { y: 17.3999996; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 64 { x: -10000; y: 18.8999996; skew-x: 0; skew-y: 0; }
        frame 65 { y: 20.3999996; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 66 { y: 21.8999996; skew-x: -6.19999981; skew-y: -6.19999981; }
        frame 67 { y: 23.3999996; skew-x: -9.39999962; skew-y: -9.39999962; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 68 { x: 15; y: 24.1000004; skew-x: -12.3999996; skew-y: -8.19999981; scale-x: 0.802999973; scale-y: 0.799000025; }
        frame 69 { y: 25; skew-x: -15.5; skew-y: -7.19999981; scale-x: 0.808000028; scale-y: -10000; }
        frame 70 { x: 14.8999996; y: 23.7000008; skew-x: -12.6999998; skew-y: -5.4000001; scale-x: 0.805999994; }
        frame 71 { x: 14.6999998; y: 22.3999996; skew-x: -9.69999981; skew-y: -3.9000001; scale-x: 0.805000007; }
        frame 72 { x: 14.6000004; y: 21.2000008; skew-x: -6.9000001; skew-y: -2.20000005; scale-x: 0.80400002; }
        frame 73 { x: -10000; y: 20; skew-x: -4.19999981; skew-y: -0.699999988; scale-x: 0.802999973; scale-y: 0.800000012; }
        frame 74 { x: 14.5; y: 18.7000008; skew-x: -1.39999998; skew-y: 0.800000012; scale-x: 0.801999986; scale-y: -10000; }
        frame 75 { x: -10000; y: 17.5; skew-x: 1.10000002; skew-y: 2.29999995; scale-x: 0.800999999; }
        frame 76 { x: 14.6000004; y: 16; skew-x: 4.0999999; skew-y: 4.0999999; scale-x: 0.800000012; }
    }
    Track {
        source-name: "Cornpult_eyebrow1";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 38.7000008; y: 42; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_CORNPULT_EYEBROW; }
        frame 6 { x: 38.2999992; y: 43; skew-x: -8.89999962; skew-y: -8.89999962; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 38; y: 44; skew-x: -18.2000008; skew-y: -18.2000008; }
        frame 8 { x: -10000; y: 44.2999992; skew-x: -17.7000008; skew-y: -17.7000008; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 9 { x: 38.0999985; y: 44.5999985; skew-x: -17.2000008; skew-y: -17.2000008; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 38; y: 45; skew-x: -16.7000008; skew-y: -16.7000008; }
        frame 11 { x: 38.0999985; y: 45.2000008; skew-x: -16.2000008; skew-y: -16.2000008; }
        frame 12 { x: -10000; y: 45.5; skew-x: -15.6999998; skew-y: -15.6999998; }
        frame 13 { y: 45.7000008; skew-x: -15.1999998; skew-y: -15.1999998; }
        frame 14 { y: 46.0999985; skew-x: -14.8999996; skew-y: -14.8999996; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 15 { x: 38.5999985; y: 44.9000015; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 16 { x: 39.4000015; y: 44; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 39.2999992; y: 43.5999985; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 18 { x: 39.0999985; y: 43.4000015; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 19 { x: 39; y: 43.0999985; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: -10000; scale-y: -10000; }
        frame 20 { y: 42.9000015; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 21 { x: 38.9000015; y: 42.5; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 22 { x: 38.7999992; y: 42.4000015; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 23 { x: 38.7000008; y: 42; skew-x: 0; skew-y: 0; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 38; y: 42; skew-x: -2.4000001; skew-y: -2.4000001; }
        frame 26 { x: 37.0999985; y: 41.9000015; skew-x: -4.9000001; skew-y: -4.9000001; }
        frame 27 { x: 36.4000015; y: 41.7999992; skew-x: -7.4000001; skew-y: -7.4000001; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 28 { x: 35.5; y: 41.7000008; skew-x: -9.89999962; skew-y: -9.89999962; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 34.9000015; y: 41.5999985; skew-x: -12.3999996; skew-y: -12.3999996; }
        frame 30 { x: 36.5; y: 40.5; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 31 { x: 38.2999992; y: 39.5; skew-x: 10.3000002; skew-y: 10.3000002; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 32 { x: 40.4000015; y: 40; skew-x: 14.8000002; skew-y: 17.5; scale-x: 0.790000021; scale-y: 0.809000015; }
        frame 33 { x: 42.5999985; y: 40.5999985; skew-x: 19.2999992; skew-y: 24.6000004; scale-x: 0.782000005; scale-y: 0.819999993; }
        frame 34 { x: 44.7000008; y: 41.2999992; skew-x: 23.7999992; skew-y: 31.7999992; scale-x: 0.773999989; scale-y: 0.83099997; }
        frame 35 { x: 46.9000015; y: 42; skew-x: 28.2999992; skew-y: 39.0999985; scale-x: 0.768000007; scale-y: 0.843999982; }
        frame 36 { x: 47.2000008; y: 42.2000008; skew-x: 32.0999985; skew-y: 42.9000015; scale-x: 0.765999973; scale-y: 0.842000008; }
        frame 37 { x: 47.5999985; y: 42.4000015; skew-x: 35.7999992; skew-y: 46.7000008; scale-x: 0.76700002; scale-y: 0.843999982; }
        frame 38 { x: 47.2999992; y: -10000; skew-x: -10000; skew-y: 46.5999985; scale-x: 0.765999973; scale-y: 0.842000008; }
        frame 39 { x: 47; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 46.7000008; skew-y: 46.7000008; scale-x: 0.76700002; scale-y: 0.843999982; }
        frame 41 { x: 46.9000015; y: 42.2999992; skew-y: 46.5999985; scale-x: 0.765999973; scale-y: 0.842000008; }
        frame 42 { x: 47.0999985; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 47.4000015; }
        frame 44 { x: 47.5999985; y: 42.4000015; skew-y: 46.7000008; scale-x: 0.76700002; scale-y: 0.843999982; }
        frame 45 { x: 46.7999992; y: 42.2999992; skew-x: 33.0999985; skew-y: 43.0999985; scale-x: 0.768999994; scale-y: 0.838999987; }
        frame 46 { x: 46.0999985; y: 42.0999985; skew-x: 30.2999992; skew-y: 39.4000015; scale-x: 0.771000028; scale-y: 0.836000025; }
        frame 47 { x: 45.4000015; y: 42; skew-x: 27.5; skew-y: 35.9000015; scale-x: 0.773999989; scale-y: 0.832000017; }
        frame 48 { x: 44.7000008; skew-x: 24.7999992; skew-y: 32.2999992; scale-x: 0.776000023; scale-y: 0.828999996; }
        frame 49 { x: 44; y: 41.9000015; skew-x: 22; skew-y: 28.6000004; scale-x: 0.778999984; scale-y: 0.825999975; }
        frame 50 { x: 43.4000015; y: -10000; skew-x: 19.2999992; skew-y: 25.1000004; scale-x: 0.782000005; scale-y: 0.822000027; }
        frame 51 { x: 42.5999985; y: 41.7999992; skew-x: 16.5; skew-y: 21.5; scale-x: 0.783999979; scale-y: 0.819000006; }
        frame 52 { x: 42; y: -10000; skew-x: 13.8000002; skew-y: 17.7999992; scale-x: 0.787; scale-y: 0.815999985; }
        frame 53 { x: 41.2999992; y: 41.9000015; skew-x: 11; skew-y: 14.3000002; scale-x: 0.788999975; scale-y: 0.813000023; }
        frame 54 { x: 40.5999985; y: -10000; skew-x: 8.30000019; skew-y: 10.8000002; scale-x: 0.791999996; scale-y: 0.810000002; }
        frame 55 { x: 40; y: 42; skew-x: 5.5; skew-y: 7; scale-x: 0.795000017; scale-y: 0.805999994; }
        frame 56 { x: 39.5; skew-x: 2.70000005; skew-y: 3.5; scale-x: 0.796999991; scale-y: 0.802999973; }
        frame 57 { x: 38.7000008; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 58 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 38.2999992; y: 43; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 60 { x: 38; y: 44; skew-x: -18.2000008; skew-y: -18.2000008; }
        frame 61 { x: -10000; y: 44.2999992; skew-x: -17.7000008; skew-y: -17.7000008; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 62 { x: 38.0999985; y: 44.5999985; skew-x: -17.2000008; skew-y: -17.2000008; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 38; y: 45; skew-x: -16.7000008; skew-y: -16.7000008; }
        frame 64 { x: 38.0999985; y: 45.2000008; skew-x: -16.2000008; skew-y: -16.2000008; }
        frame 65 { x: -10000; y: 45.5; skew-x: -15.6999998; skew-y: -15.6999998; }
        frame 66 { y: 45.7000008; skew-x: -15.1999998; skew-y: -15.1999998; }
        frame 67 { y: 46.0999985; skew-x: -14.8999996; skew-y: -14.8999996; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 68 { x: 38.5999985; y: 44.9000015; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 69 { x: 39.4000015; y: 44; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 39.2999992; y: 43.5999985; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 71 { x: 39.0999985; y: 43.4000015; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 72 { x: 39; y: 43.0999985; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: -10000; scale-y: -10000; }
        frame 73 { y: 42.9000015; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 74 { x: 38.9000015; y: 42.5; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 75 { x: 38.7999992; y: 42.4000015; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 76 { x: 38.7000008; y: 42; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Cornpult_eyebrow2";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 64.6999969; y: 42.0999985; skew-x: 180; scale-x: 0.620999992; scale-y: 0.620999992; cel: 0; image: IMAGE_REANIM_CORNPULT_EYEBROW; }
        frame 6 { x: 65; y: 42.7999992; skew-x: 189; skew-y: 9; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 65.1999969; y: 43.4000015; skew-x: 198.300003; skew-y: 18.2999992; }
        frame 8 { x: 65.0999985; y: 43.7999992; skew-x: 197.800003; skew-y: 17.7999992; scale-x: 0.620000005; scale-y: 0.620000005; }
        frame 9 { x: 65.1999969; y: 44; skew-x: 197.300003; skew-y: 17.2999992; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 65.0999985; y: 44.4000015; skew-x: 196.800003; skew-y: 16.7999992; }
        frame 11 { x: -10000; y: 44.7999992; skew-x: 196.300003; skew-y: 16.2999992; }
        frame 12 { y: 45.0999985; skew-x: 195.800003; skew-y: 15.8000002; }
        frame 13 { y: 45.4000015; skew-x: 195.300003; skew-y: 15.3000002; }
        frame 14 { y: 45.7999992; skew-x: 195; skew-y: 15; scale-x: 0.620999992; scale-y: 0.620999992; }
        frame 15 { x: 65; y: 45.0999985; skew-x: 185.800003; skew-y: 5.80000019; scale-x: 0.620000005; scale-y: 0.620000005; }
        frame 16 { x: 64.8000031; y: 44.5; skew-x: 176.5; skew-y: -3.4000001; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: -10000; y: 44.0999985; skew-x: 177.199997; skew-y: -2.70000005; }
        frame 18 { y: 43.7999992; skew-x: 177.699997; skew-y: -2.20000005; scale-x: 0.620999992; scale-y: 0.620999992; }
        frame 19 { y: 43.5; skew-x: 178.199997; skew-y: -1.70000005; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 64.6999969; y: 43.0999985; skew-x: 178.699997; skew-y: -1.20000005; }
        frame 21 { x: -10000; y: 42.7999992; skew-x: 179.199997; skew-y: -0.699999988; }
        frame 22 { x: 64.5999985; y: 42.5; skew-x: 179.699997; skew-y: -0.200000003; }
        frame 23 { x: 64.6999969; y: 42.0999985; skew-x: 180; skew-y: 0; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 64.3000031; y: 41.7999992; skew-x: 181.800003; skew-y: 1.79999995; }
        frame 26 { x: 63.9000015; y: 41.5; skew-x: 183.800003; skew-y: 3.79999995; }
        frame 27 { x: 63.4000015; y: 41.0999985; skew-x: 185.800003; skew-y: 5.80000019; scale-x: 0.620000005; scale-y: 0.620000005; }
        frame 28 { x: 62.9000015; y: 40.9000015; skew-x: 187.800003; skew-y: 7.80000019; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 62.5; y: 40.5; skew-x: 189.800003; skew-y: 9.80000019; scale-x: 0.620999992; scale-y: 0.620999992; }
        frame 30 { x: 62.7000008; y: 40.0999985; skew-x: 179.699997; skew-y: -0.200000003; scale-x: 0.620000005; scale-y: 0.620000005; }
        frame 31 { x: 62.5999985; y: 39.7000008; skew-x: 169.199997; skew-y: -10.6999998; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 63.2999992; y: 40.4000015; skew-x: 165; skew-y: -12; scale-x: 0.625; scale-y: 0.616999984; }
        frame 33 { x: 64; y: 41; skew-x: 160.699997; skew-y: -13.3999996; scale-x: 0.630999982; scale-y: 0.614000022; }
        frame 34 { x: 64.5999985; y: 41.5999985; skew-x: 156.199997; skew-y: -14.8999996; scale-x: 0.637000024; scale-y: 0.611000001; }
        frame 35 { x: 65.1999969; y: 42.0999985; skew-x: 151.800003; skew-y: -16.3999996; scale-x: 0.643999994; scale-y: 0.60799998; }
        frame 36 { x: 64.3000031; y: 42.4000015; skew-x: 145.600006; skew-y: -22.5; scale-x: 0.64200002; scale-y: -10000; }
        frame 37 { x: 63.5; y: 42.5999985; skew-x: 139.300003; skew-y: -28.8999996; scale-x: 0.643000007; }
        frame 38 { x: 63.0999985; y: -10000; skew-x: 139.399994; skew-y: -28.7999992; scale-x: 0.64200002; scale-y: 0.606999993; }
        frame 39 { x: 62.7999992; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 62.5; skew-x: 139.300003; skew-y: -28.8999996; scale-x: 0.643000007; scale-y: 0.60799998; }
        frame 41 { x: 62.7999992; skew-x: 139.399994; skew-y: -28.7999992; scale-x: 0.64200002; scale-y: 0.606999993; }
        frame 42 { x: 63; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 63.2000008; }
        frame 44 { x: 63.5; skew-x: 139.300003; skew-y: -28.8999996; scale-x: 0.643000007; scale-y: 0.60799998; }
        frame 45 { x: 63.5999985; y: 42.5; skew-x: 142.399994; skew-y: -26.7000008; scale-x: 0.639999986; scale-y: -10000; }
        frame 46 { x: 63.7999992; y: 42.4000015; skew-x: 145.600006; skew-y: -24.3999996; scale-x: 0.638999999; scale-y: 0.609000027; }
        frame 47 { x: 63.9000015; y: -10000; skew-x: 148.699997; skew-y: -22.2000008; scale-x: 0.637000024; scale-y: 0.610000014; }
        frame 48 { x: 64.1999969; y: 42.2999992; skew-x: 151.899994; skew-y: -19.8999996; scale-x: 0.63499999; scale-y: 0.611000001; }
        frame 49 { x: -10000; y: -10000; skew-x: 155; skew-y: -17.7000008; scale-x: 0.634000003; scale-y: 0.611999989; }
        frame 50 { x: 64.3000031; skew-x: 158.199997; skew-y: -15.3999996; scale-x: 0.632000029; scale-y: 0.612999976; }
        frame 51 { x: 64.5; skew-x: 161.199997; skew-y: -13.1999998; scale-x: 0.630999982; scale-y: 0.614000022; }
        frame 52 { x: 64.5999985; y: 42.2000008; skew-x: 164.399994; skew-y: -10.8999996; scale-x: 0.629000008; scale-y: 0.615999997; }
        frame 53 { x: 64.6999969; y: 42.0999985; skew-x: 167.5; skew-y: -8.69999981; scale-x: 0.626999974; scale-y: 0.616999984; }
        frame 54 { x: -10000; y: -10000; skew-x: 170.699997; skew-y: -6.5; scale-x: 0.625999987; scale-y: 0.617999971; }
        frame 55 { x: 64.8000031; skew-x: 173.699997; skew-y: -4.19999981; scale-x: 0.624000013; scale-y: 0.619000018; }
        frame 56 { x: -10000; skew-x: 177; skew-y: -2; scale-x: 0.621999979; scale-y: 0.620000005; }
        frame 57 { x: 64.6999969; skew-x: 180; skew-y: 0; scale-x: 0.620999992; scale-y: 0.620999992; }
        frame 58 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 65; y: 42.7999992; skew-x: 189; skew-y: 9; }
        frame 60 { x: 65.1999969; y: 43.4000015; skew-x: 198.300003; skew-y: 18.2999992; }
        frame 61 { x: 65.0999985; y: 43.7999992; skew-x: 197.800003; skew-y: 17.7999992; scale-x: 0.620000005; scale-y: 0.620000005; }
        frame 62 { x: 65.1999969; y: 44; skew-x: 197.300003; skew-y: 17.2999992; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 65.0999985; y: 44.4000015; skew-x: 196.800003; skew-y: 16.7999992; }
        frame 64 { x: -10000; y: 44.7999992; skew-x: 196.300003; skew-y: 16.2999992; }
        frame 65 { y: 45.0999985; skew-x: 195.800003; skew-y: 15.8000002; }
        frame 66 { y: 45.4000015; skew-x: 195.300003; skew-y: 15.3000002; }
        frame 67 { y: 45.7999992; skew-x: 195; skew-y: 15; scale-x: 0.620999992; scale-y: 0.620999992; }
        frame 68 { x: 65; y: 45.0999985; skew-x: 185.800003; skew-y: 5.80000019; scale-x: 0.620000005; scale-y: 0.620000005; }
        frame 69 { x: 64.8000031; y: 44.5; skew-x: 176.5; skew-y: -3.4000001; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: -10000; y: 44.0999985; skew-x: 177.199997; skew-y: -2.70000005; }
        frame 71 { y: 43.7999992; skew-x: 177.699997; skew-y: -2.20000005; scale-x: 0.620999992; scale-y: 0.620999992; }
        frame 72 { y: 43.5; skew-x: 178.199997; skew-y: -1.70000005; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 64.6999969; y: 43.0999985; skew-x: 178.699997; skew-y: -1.20000005; }
        frame 74 { x: -10000; y: 42.7999992; skew-x: 179.199997; skew-y: -0.699999988; }
        frame 75 { x: 64.5999985; y: 42.5; skew-x: 179.699997; skew-y: -0.200000003; }
        frame 76 { x: 64.6999969; y: 42.0999985; skew-x: 180; skew-y: 0; }
    }
}
