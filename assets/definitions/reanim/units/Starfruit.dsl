export component Starfruit {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 39;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 22 { cel: -1; }
        frame 23 { cel: -10000; }
    }
    Track {
        source-name: "anim_shoot";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 22 { cel: 0; }
        frame 23 { cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 3.0999999; y: 9.69999981; scale-x: 0.70599997; scale-y: 0.70599997; cel: 0; image: IMAGE_REANIM_STARFRUIT_BODY; }
        frame 6 { x: 2.79999995; y: 10; scale-x: 0.713; scale-y: 0.699999988; cel: -10000; image: none; }
        frame 7 { x: 2.4000001; y: 10.3000002; scale-x: 0.720000029; scale-y: 0.694999993; }
        frame 8 { x: 2; y: 10.5; scale-x: 0.727999985; scale-y: 0.689999998; }
        frame 9 { x: 1.79999995; y: 10.8000002; scale-x: 0.735000014; scale-y: 0.685000002; }
        frame 10 { x: 1.29999995; y: 11.1000004; scale-x: 0.742999971; scale-y: 0.680000007; }
        frame 11 { x: 2; y: 10.3999996; scale-x: 0.726000011; scale-y: 0.690999985; }
        frame 12 { x: 3; y: 9.89999962; scale-x: 0.709999979; scale-y: 0.703000009; }
        frame 13 { x: 3.70000005; y: 9.30000019; scale-x: 0.693000019; scale-y: 0.713999987; }
        frame 14 { x: 4.5; y: 8.60000038; scale-x: 0.676999986; scale-y: 0.726000011; }
        frame 15 { x: 5.30000019; y: 8; scale-x: 0.660000026; scale-y: 0.736999989; }
        frame 16 { x: 6.19999981; y: 7.5; scale-x: 0.643999994; scale-y: 0.749000013; }
        frame 17 { x: 5.5999999; y: 7.9000001; scale-x: 0.656000018; scale-y: 0.74000001; }
        frame 18 { x: 5; y: 8.39999962; scale-x: 0.667999983; scale-y: 0.731000006; }
        frame 19 { x: 4.4000001; y: 8.89999962; scale-x: 0.680999994; scale-y: 0.72299999; }
        frame 20 { x: 3.79999995; y: 9.30000019; scale-x: 0.693000019; scale-y: 0.713999987; }
        frame 21 { x: 3.0999999; y: 9.69999981; scale-x: 0.70599997; scale-y: 0.70599997; }
        frame 22 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 3.70000005; y: 9.39999962; scale-x: 0.694999993; scale-y: 0.712000012; }
        frame 24 { x: 4.30000019; y: 9.10000038; scale-x: 0.684000015; scale-y: 0.717000008; }
        frame 25 { x: 4.80000019; y: 8.89999962; scale-x: 0.672999978; scale-y: 0.72299999; }
        frame 26 { x: 5.30000019; y: 8.60000038; scale-x: 0.662999988; scale-y: 0.728999972; }
        frame 27 { x: 5.80000019; y: 8.30000019; scale-x: 0.65200001; scale-y: 0.735000014; }
        frame 28 { x: 6.4000001; y: 7.9000001; scale-x: 0.640999973; scale-y: 0.740999997; }
        frame 29 { x: 6.9000001; y: 7.69999981; scale-x: 0.629999995; scale-y: 0.746999979; }
        frame 30 { x: 7.5; y: 7.30000019; scale-x: 0.620000005; scale-y: 0.753000021; }
        frame 31 { x: 3.9000001; y: 8.60000038; scale-x: 0.691999972; scale-y: 0.727999985; }
        frame 32 { x: 0.200000003; y: 9.89999962; scale-x: 0.763999999; scale-y: 0.702000022; }
        frame 33 { x: 0.699999988; y: 9.80000019; scale-x: 0.754000008; scale-y: 0.703000009; }
        frame 34 { x: 1.20000005; y: -10000; scale-x: 0.745000005; scale-y: -10000; }
        frame 35 { x: 1.70000005; scale-x: 0.735000014; scale-y: 0.703999996; }
        frame 36 { x: 2.0999999; scale-x: 0.725000024; scale-y: 0.704999983; }
        frame 37 { x: 2.5999999; scale-x: 0.714999974; scale-y: -10000; }
        frame 38 { x: 3.0999999; y: 9.69999981; scale-x: 0.70599997; scale-y: 0.70599997; }
    }
    Track {
        source-name: "Starfruit_mouth";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 30 { x: 42.5999985; y: 41.2000008; scale-x: 0.328999996; scale-y: 0.256000012; cel: 0; image: IMAGE_REANIM_STARFRUIT_MOUTH; }
        frame 31 { x: 41.7999992; y: 40.5; skew-x: 1.29999995; skew-y: 8; scale-x: 0.569000006; scale-y: 0.492000014; cel: -10000; image: none; }
        frame 32 { x: 41.9000015; y: 39.7000008; skew-x: 2.5999999; skew-y: 16.1000004; scale-x: 0.810000002; scale-y: 0.728999972; }
        frame 33 { x: 41.7999992; y: 40; skew-x: 2.0999999; skew-y: 13.3000002; scale-x: 0.730000019; scale-y: 0.649999976; }
        frame 34 { x: 42; y: 40.2000008; skew-x: 1.79999995; skew-y: 10.6000004; scale-x: 0.649999976; scale-y: 0.57099998; }
        frame 35 { x: 42.0999985; y: 40.5; skew-x: 1.29999995; skew-y: 8; scale-x: 0.569000006; scale-y: 0.492000014; }
        frame 36 { x: 42.5; y: 40.9000015; skew-x: 0.800000012; skew-y: 5.30000019; scale-x: 0.488999993; scale-y: 0.412999988; }
        frame 37 { x: 42.7999992; y: 41.0999985; skew-x: 0.300000012; skew-y: 2.5; scale-x: 0.409000009; scale-y: 0.333999991; }
        frame 38 { x: 43.2999992; y: 41.5999985; skew-x: 0; skew-y: 0; scale-x: 0.328999996; scale-y: 0.256000012; }
    }
    Track {
        source-name: "Starfruit_smile";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 34.5999985; y: 35.2999992; scale-x: 0.70599997; scale-y: 0.70599997; cel: 0; image: IMAGE_REANIM_STARFRUIT_SMILE; }
        frame 6 { x: 34.0999985; y: -10000; skew-y: -0.899999976; scale-x: 0.730000019; scale-y: 0.704999983; cel: -10000; image: none; }
        frame 7 { x: 33.7999992; y: 35.4000015; skew-y: -1.89999998; scale-x: 0.754000008; scale-y: 0.703999996; }
        frame 8 { x: 33.4000015; y: -10000; skew-y: -2.9000001; scale-x: 0.777999997; scale-y: 0.703000009; }
        frame 9 { x: 33; skew-y: -3.9000001; scale-x: 0.802999973; scale-y: -10000; }
        frame 10 { x: 32.5999985; skew-y: -5.0999999; scale-x: 0.827000022; scale-y: 0.702000022; }
        frame 11 { x: 33; y: 35.2999992; skew-y: -4.19999981; scale-x: 0.796000004; scale-y: 0.709999979; }
        frame 12 { x: 33.5; y: 35.2000008; skew-y: -3.20000005; scale-x: 0.765999973; scale-y: 0.717999995; }
        frame 13 { x: 33.7999992; y: 35; skew-y: -2.4000001; scale-x: 0.735000014; scale-y: 0.725000024; }
        frame 14 { x: 34.2000008; skew-y: -1.5; scale-x: 0.704999983; scale-y: 0.73299998; }
        frame 15 { x: 34.5; y: 34.7999992; skew-y: -0.699999988; scale-x: 0.674000025; scale-y: 0.740999997; }
        frame 16 { x: 34.9000015; y: 34.5999985; skew-y: 0; scale-x: 0.643999994; scale-y: 0.749000013; }
        frame 17 { x: 34.7999992; y: 34.7999992; skew-y: -10000; scale-x: 0.656000018; scale-y: 0.74000001; }
        frame 18 { x: -10000; y: 34.9000015; scale-x: 0.667999983; scale-y: 0.731000006; }
        frame 19 { x: 34.5999985; y: 35; scale-x: 0.680999994; scale-y: 0.72299999; }
        frame 20 { x: -10000; y: 35.0999985; scale-x: 0.693000019; scale-y: 0.713999987; }
        frame 21 { y: 35.2999992; scale-x: 0.70599997; scale-y: 0.70599997; }
        frame 22 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 34.9000015; y: 35.0999985; skew-x: 0.800000012; scale-x: 0.683000028; scale-y: 0.704999983; }
        frame 24 { x: 35.0999985; y: 35; skew-x: 1.60000002; scale-x: 0.660000026; scale-y: 0.703999996; }
        frame 25 { x: 35.5; y: 34.7999992; skew-x: 2.5; scale-x: 0.637000024; scale-y: -10000; }
        frame 26 { x: 35.7000008; y: 34.5999985; skew-x: 3.29999995; scale-x: 0.614000022; scale-y: 0.703000009; }
        frame 27 { x: 36; y: 34.5; skew-x: 4.30000019; scale-x: 0.591000021; scale-y: -10000; }
        frame 28 { x: 36.2999992; y: 34.2999992; skew-x: 5; scale-x: 0.569000006; scale-y: 0.702000022; }
        frame 29 { x: 36.5999985; y: 34.0999985; skew-x: 6; scale-x: 0.546000004; scale-y: 0.700999975; }
        frame 30 { x: 36.7999992; y: 33.9000015; skew-x: 6.9000001; scale-x: 0.523000002; scale-y: -10000; }
        frame 31 { x: 35.2999992; y: 35; skew-x: 1.5; skew-y: -4.19999981; scale-x: 0.648000002; scale-y: 0.649999976; }
        frame 32 { x: 33.7000008; y: 36.5; skew-x: -3.5; skew-y: -8.80000019; scale-x: 0.773999989; scale-y: 0.598999977; }
        frame 33 { x: 33.9000015; y: 36.2999992; skew-x: -2.9000001; skew-y: -7.19999981; scale-x: 0.762000024; scale-y: 0.615999997; }
        frame 34 { x: 34; y: 36; skew-x: -2.20000005; skew-y: -5.69999981; scale-x: 0.750999987; scale-y: 0.634000003; }
        frame 35 { y: 35.9000015; skew-x: -1.70000005; skew-y: -4.19999981; scale-x: 0.74000001; scale-y: 0.65200001; }
        frame 36 { x: 34.2000008; y: 35.5999985; skew-x: -1; skew-y: -2.70000005; scale-x: 0.727999985; scale-y: 0.670000017; }
        frame 37 { x: 34.2999992; y: 35.5; skew-x: -0.400000006; skew-y: -1.20000005; scale-x: 0.717000008; scale-y: 0.688000023; }
        frame 38 { x: 34.5999985; y: 35.2999992; skew-x: 0; skew-y: 0; scale-x: 0.70599997; scale-y: 0.70599997; }
    }
    Track {
        source-name: "Starfruit_leaf";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 26.7000008; y: 5.19999981; scale-x: 0.70599997; scale-y: 0.70599997; cel: 0; image: IMAGE_REANIM_STARFRUIT_LEAF; }
        frame 6 { x: 27.2000008; y: 4.9000001; skew-x: 3.0999999; skew-y: 1.5; scale-x: -10000; scale-y: 0.731999993; cel: -10000; image: none; }
        frame 7 { x: 27.7000008; y: 4.5999999; skew-x: 6.5; skew-y: 3.29999995; scale-y: 0.758000016; }
        frame 8 { x: 28.1000004; y: 4.69999981; skew-x: 11.3000002; skew-y: 7.80000019; scale-y: 0.74000001; }
        frame 9 { x: 28.5; y: 4.80000019; skew-x: 16; skew-y: 12.5; scale-y: 0.722000003; }
        frame 10 { x: 28.6000004; y: 4.9000001; skew-x: 20.7999992; skew-y: 17.2000008; scale-y: 0.704999983; }
        frame 11 { x: 28.1000004; y: 5.80000019; skew-x: 10.3000002; skew-y: 8; scale-x: 0.704999983; scale-y: 0.661000013; }
        frame 12 { x: 27.6000004; y: 7.19999981; skew-x: 0.100000001; skew-y: -0.899999976; scale-x: 0.703999996; scale-y: 0.617999971; }
        frame 13 { x: 28; y: 5.80000019; skew-x: 2.5; skew-y: 2.29999995; scale-x: 0.689999998; scale-y: 0.648999989; }
        frame 14 { x: 28.5; y: 4.4000001; skew-x: 4.80000019; skew-y: 5.80000019; scale-x: 0.675999999; scale-y: 0.680000007; }
        frame 15 { x: 28.8999996; y: 3.0999999; skew-x: 7.30000019; skew-y: 9.30000019; scale-x: 0.662; scale-y: 0.711000025; }
        frame 16 { x: 29.7000008; y: 2; skew-x: 9.80000019; skew-y: 12.8999996; scale-x: 0.648000002; scale-y: 0.742999971; }
        frame 17 { x: 29.8999996; y: 1.70000005; skew-x: 13; skew-y: 15.5; scale-x: 0.658999979; scale-y: 0.734000027; }
        frame 18 { x: 30.1000004; y: 1.5; skew-x: 16.2999992; skew-y: 18.1000004; scale-x: 0.670000017; scale-y: 0.726999998; }
        frame 19 { x: 29; y: 2.5; skew-x: 10.8000002; skew-y: 12; scale-x: 0.681999981; scale-y: 0.718999982; }
        frame 20 { x: 27.8999996; y: 3.79999995; skew-x: 5.30000019; skew-y: 6; scale-x: 0.694000006; scale-y: 0.712000012; }
        frame 21 { x: 26.7000008; y: 5.19999981; skew-x: 0; skew-y: 0; scale-x: 0.70599997; scale-y: 0.70599997; }
        frame 22 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 26.8999996; y: 4.80000019; scale-x: 0.694999993; scale-y: 0.712000012; }
        frame 24 { x: 27; y: 4.5999999; scale-x: 0.684000015; scale-y: 0.717000008; }
        frame 25 { x: 27.2000008; y: 4.19999981; scale-x: 0.672999978; scale-y: 0.72299999; }
        frame 26 { x: 27.5; y: 3.9000001; scale-x: 0.662999988; scale-y: 0.728999972; }
        frame 27 { x: 27.6000004; y: 3.5; scale-x: 0.65200001; scale-y: 0.735000014; }
        frame 28 { x: 27.7999992; y: 3.20000005; scale-x: 0.640999973; scale-y: 0.740999997; }
        frame 29 { x: 27.8999996; y: 2.9000001; scale-x: 0.629999995; scale-y: 0.746999979; }
        frame 30 { x: 28.2000008; y: 2.5; scale-x: 0.620000005; scale-y: 0.753000021; }
        frame 31 { x: 35.2999992; y: 2.5999999; skew-x: 44; skew-y: 45.2999992; scale-x: 0.635999978; scale-y: 0.723999977; }
        frame 32 { x: 24.3999996; y: 9.39999962; skew-x: -15.6999998; skew-y: -15.6999998; scale-x: 0.763000011; scale-y: 0.702000022; }
        frame 33 { x: 24.7000008; y: 7.80000019; skew-x: -13.8999996; skew-y: -16.7000008; scale-x: 0.722000003; scale-y: 0.709999979; }
        frame 34 { x: 25; y: 6.30000019; skew-x: -12.1000004; skew-y: -17.8999996; scale-x: 0.681999981; scale-y: 0.720000029; }
        frame 35 { x: 25.5; y: 6; skew-x: -8.89999962; skew-y: -13.3999996; scale-x: 0.686999977; scale-y: 0.716000021; }
        frame 36 { x: 26; y: 5.5999999; skew-x: -5.9000001; skew-y: -8.89999962; scale-x: 0.693000019; scale-y: 0.712000012; }
        frame 37 { x: 26.3999996; y: 5.30000019; skew-x: -2.9000001; skew-y: -4.4000001; scale-x: 0.699000001; scale-y: 0.708999991; }
        frame 38 { x: 26.7000008; y: 5.19999981; skew-x: 0; skew-y: 0; scale-x: 0.70599997; scale-y: 0.70599997; }
    }
    Track {
        source-name: "Starfruit_stem";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 29.2999992; y: 6.4000001; scale-x: 0.70599997; scale-y: 0.70599997; cel: 0; image: IMAGE_REANIM_STARFRUIT_STEM; }
        frame 6 { x: -10000; y: 6.5999999; scale-x: 0.720000029; scale-y: 0.712000012; cel: -10000; image: none; }
        frame 7 { y: 6.69999981; scale-x: 0.734000027; scale-y: 0.717999995; }
        frame 8 { y: 7.30000019; scale-x: 0.744000018; scale-y: 0.686999977; }
        frame 9 { y: 7.80000019; scale-x: 0.753000021; scale-y: 0.656000018; }
        frame 10 { y: 8.5; scale-x: 0.763000011; scale-y: 0.625; }
        frame 11 { x: 29.5; y: 8.39999962; scale-x: 0.748000026; scale-y: 0.634000003; }
        frame 12 { x: 29.7000008; y: 8.19999981; scale-x: 0.734000027; scale-y: 0.643000007; }
        frame 13 { x: 29.8999996; y: 7.0999999; scale-x: 0.697000027; scale-y: 0.684000015; }
        frame 14 { x: 30.2000008; y: 6.0999999; scale-x: 0.660000026; scale-y: 0.726000011; }
        frame 15 { x: 30.2999992; y: 5; scale-x: 0.623000026; scale-y: 0.76700002; }
        frame 16 { x: 30.6000004; y: 3.9000001; scale-x: 0.586000025; scale-y: 0.809000015; }
        frame 17 { x: -10000; y: 4.0999999; scale-x: 0.610000014; scale-y: 0.822000027; }
        frame 18 { x: 30.5; y: 4.19999981; scale-x: 0.634000003; scale-y: 0.834999979; }
        frame 19 { x: 30.1000004; y: 5; scale-x: 0.657999992; scale-y: 0.791999996; }
        frame 20 { x: 29.7999992; y: 5.69999981; scale-x: 0.681999981; scale-y: 0.749000013; }
        frame 21 { x: 29.2999992; y: 6.4000001; scale-x: 0.70599997; scale-y: 0.70599997; }
        frame 22 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 29.3999996; y: 6.0999999; scale-x: 0.694999993; scale-y: 0.712000012; }
        frame 24 { x: 29.5; y: 5.80000019; scale-x: 0.684000015; scale-y: 0.717000008; }
        frame 25 { x: 29.7000008; y: 5.5; scale-x: 0.672999978; scale-y: 0.72299999; }
        frame 26 { x: 29.7999992; y: 5.19999981; scale-x: 0.662999988; scale-y: 0.728999972; }
        frame 27 { x: 30; y: 4.80000019; scale-x: 0.65200001; scale-y: 0.735000014; }
        frame 28 { x: 30.1000004; y: 4.5; scale-x: 0.640999973; scale-y: 0.740999997; }
        frame 29 { x: 30.2999992; y: 4.0999999; scale-x: 0.629999995; scale-y: 0.746999979; }
        frame 30 { x: 30.5; y: 3.79999995; scale-x: 0.620000005; scale-y: 0.753000021; }
        frame 31 { x: 32.5; y: 5.5999999; skew-x: 19.3999996; skew-y: 10.1000004; scale-x: 0.637000024; scale-y: 0.714999974; }
        frame 32 { x: 26.2999992; y: 8.80000019; skew-x: 0; skew-y: -20.1000004; scale-x: 0.763999999; scale-y: 0.681999981; }
        frame 33 { x: 26.6000004; y: 8; skew-x: -10000; skew-y: -17.7000008; scale-x: 0.727999985; scale-y: 0.697000027; }
        frame 34 { x: 26.8999996; y: 7.0999999; skew-y: -15.6000004; scale-x: 0.691999972; scale-y: 0.713; }
        frame 35 { x: 27.5; y: 6.80000019; skew-y: -11.6999998; scale-x: 0.694999993; scale-y: 0.711000025; }
        frame 36 { x: 28.1000004; y: 6.69999981; skew-y: -7.69999981; scale-x: 0.699000001; scale-y: 0.708999991; }
        frame 37 { x: 28.7000008; y: 6.5; skew-y: -3.70000005; scale-x: 0.702000022; scale-y: 0.707000017; }
        frame 38 { x: 29.2999992; y: 6.4000001; skew-y: 0; scale-x: 0.70599997; scale-y: 0.70599997; }
    }
    Track {
        source-name: "Starfruit_eyes";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { x: 29.2000008; y: 25.7999992; scale-x: 0.70599997; scale-y: 0.713999987; cel: 0; image: IMAGE_REANIM_STARFRUIT_EYES1; }
        frame 2 { x: 29.2999992; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_STARFRUIT_EYES2; }
        frame 3 { x: 29.2000008; image: IMAGE_REANIM_STARFRUIT_EYES1; }
        frame 4 { x: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 31 { x: 28.2999992; y: 24.1000004; scale-x: 0.754000008; scale-y: 0.825999975; cel: 0; }
        frame 32 { x: 27.5; y: 24.6000004; scale-x: 0.838999987; scale-y: 0.805000007; cel: -10000; image: IMAGE_REANIM_STARFRUIT_EYES2; }
        frame 33 { x: 28.2000008; y: 24.2000008; scale-x: 0.771000028; scale-y: 0.843999982; image: IMAGE_REANIM_STARFRUIT_EYES1; }
        frame 34 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 35 { cel: -10000; }
    }
}
