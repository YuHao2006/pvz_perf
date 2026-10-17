export component Squash {
    fps: 12;
    Track {
        source-name: "anim_jumpdown";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 65 { cel: 0; }
        frame 66 { cel: -10000; }
    }
    Track {
        source-name: "anim_jumpup";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 50 { cel: 0; }
        frame 51 { cel: -10000; }
        frame 65 { cel: -1; }
        frame 66 { cel: -10000; }
    }
    Track {
        source-name: "anim_lookright";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 37 { cel: 0; }
        frame 38 { cel: -10000; }
        frame 43 { cel: -1; }
        frame 44 { cel: -10000; }
    }
    Track {
        source-name: "anim_lookleft";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
        frame 30 { cel: -1; }
        frame 31 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 24 { cel: -1; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 73;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "Squash_stem";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 33.4000015; y: -1.79999995; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SQUASH_STEM; }
        frame 6 { x: 34; y: -3; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 34.5; y: -4.0999999; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 8 { x: 35.2999992; y: -5.19999981; skew-x: 7.30000019; skew-y: 7.30000019; }
        frame 9 { x: 36; y: -6.30000019; skew-x: 9.80000019; skew-y: 9.80000019; }
        frame 10 { x: 36.5999985; y: -7.4000001; skew-x: 12.3000002; skew-y: 12.3000002; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 11 { x: 37.2999992; y: -8.5; skew-x: 15; skew-y: 15; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 12 { x: 36.2000008; y: -6.19999981; skew-x: 9.80000019; skew-y: 9.80000019; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 35.0999985; y: -3.9000001; skew-x: 5; skew-y: 5; }
        frame 14 { x: 34.2999992; y: -1.60000002; skew-x: 0; skew-y: 0; }
        frame 15 { x: 33.5; y: 0.699999988; skew-x: -4.9000001; skew-y: -4.9000001; }
        frame 16 { x: 32.7000008; y: 3; skew-x: -9.69999981; skew-y: -9.69999981; }
        frame 17 { x: 32; y: 5.5999999; skew-x: -14.8999996; skew-y: -14.8999996; }
        frame 18 { x: 32.2999992; y: 4.30000019; skew-x: -12.1999998; skew-y: -12.1999998; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 19 { x: 32.5; y: 2.9000001; skew-x: -9.69999981; skew-y: -9.69999981; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 20 { x: 32.5999985; y: 1.79999995; skew-x: -7.19999981; skew-y: -7.19999981; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 32.9000015; y: 0.5; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 22 { x: 33.0999985; y: -0.600000024; skew-x: -2.4000001; skew-y: -2.4000001; }
        frame 23 { x: 33.4000015; y: -1.79999995; skew-x: 0; skew-y: 0; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 51 { x: 33.7999992; y: 2.5; skew-x: 2.5; skew-y: 2.5; scale-x: 0.819000006; scale-y: 0.754999995; }
        frame 52 { x: 34.0999985; y: 7; skew-x: 4.80000019; skew-y: 5; scale-x: 0.838999987; scale-y: 0.709999979; }
        frame 53 { x: 34.5; y: 11.3999996; skew-x: 7.30000019; skew-y: 7.5; scale-x: 0.85799998; scale-y: 0.665000021; }
        frame 54 { x: 34.9000015; y: 15.8000002; skew-x: 9.80000019; skew-y: 10; scale-x: 0.876999974; scale-y: 0.620000005; }
        frame 55 { x: 35.2000008; y: 20.2000008; skew-x: 12.3000002; skew-y: 12.5; scale-x: 0.897000015; scale-y: 0.574999988; }
        frame 56 { x: 35.5; y: 24.5; skew-x: 15; skew-y: 15; scale-x: 0.916999996; scale-y: 0.529999971; }
        frame 57 { x: 36.4000015; y: 19; skew-x: 16.7999992; skew-y: 16.7999992; scale-x: 0.893999994; scale-y: 0.583000004; }
        frame 58 { x: 37.2999992; y: 13.3999996; skew-x: 18.6000004; skew-y: 18.7999992; scale-x: 0.870999992; scale-y: 0.635999978; }
        frame 59 { x: 38.0999985; y: 7.80000019; skew-x: 20.6000004; skew-y: 20.6000004; scale-x: 0.848999977; scale-y: 0.68900001; }
        frame 60 { x: 39; y: 2.29999995; skew-x: 22.5; skew-y: 22.5; scale-x: 0.827000022; scale-y: 0.741999984; }
        frame 61 { x: 39.9000015; y: -3; skew-x: 24.2999992; skew-y: 24.2999992; scale-x: 0.805000007; scale-y: 0.795000017; }
        frame 62 { x: 40.9000015; y: -8.5; skew-x: 26.2999992; skew-y: 26.2999992; scale-x: 0.782000005; scale-y: 0.84799999; }
        frame 63 { x: 41.9000015; y: -13.8000002; skew-x: 28.1000004; skew-y: 28.1000004; scale-x: 0.75999999; scale-y: 0.901000023; }
        frame 64 { x: 42.7999992; y: -19.2000008; skew-x: 30; skew-y: 30; scale-x: 0.739000022; scale-y: 0.954999983; }
        frame 65 { x: 39.5999985; y: -15.3999996; skew-x: 18.7999992; skew-y: 18.6000004; scale-x: 0.753000021; scale-y: 0.915000021; }
        frame 66 { x: 36.9000015; y: -10.8999996; skew-x: 7.5; skew-y: 7.5; scale-x: 0.768999994; scale-y: 0.876999974; }
        frame 67 { x: 34.7999992; y: -6.0999999; skew-x: -3.5; skew-y: -3.5; scale-x: 0.785000026; scale-y: 0.838999987; }
        frame 68 { x: 33.0999985; y: -0.899999976; skew-x: -14.8999996; skew-y: -14.8999996; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 69 { x: 33.5; y: 8.30000019; skew-x: -8.39999962; skew-y: -5.9000001; scale-x: 0.852999985; scale-y: 0.709999979; }
        frame 70 { x: 33.5999985; y: 17.7000008; skew-x: -1.89999998; skew-y: 2.5999999; scale-x: 0.907000005; scale-y: 0.620999992; }
        frame 71 { x: 33.9000015; y: 27.1000004; skew-x: 4.30000019; skew-y: 11.5; scale-x: 0.959999979; scale-y: 0.531000018; }
        frame 72 { x: 34; y: 36.2999992; skew-x: 10.8999996; skew-y: 20.5; scale-x: 1.01400006; scale-y: 0.442000002; }
    }
    Track {
        source-name: "Squash_body";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 6.5999999; y: 5.19999981; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SQUASH_BODY; }
        frame 6 { x: 7; y: 4.0999999; scale-x: 0.792999983; scale-y: 0.81099999; cel: -10000; image: none; }
        frame 7 { x: 7.30000019; y: 3; scale-x: 0.787; scale-y: 0.822000027; }
        frame 8 { x: 7.80000019; y: 2; scale-x: 0.779999971; scale-y: 0.833000004; }
        frame 9 { x: 8.19999981; y: 1; scale-x: 0.773999989; scale-y: 0.843999982; }
        frame 10 { x: 8.5; y: 0; scale-x: 0.76700002; scale-y: 0.855000019; }
        frame 11 { x: 8.89999962; y: -1; scale-x: 0.760999978; scale-y: 0.865999997; }
        frame 12 { x: 8.30000019; y: 1; scale-x: 0.773999989; scale-y: 0.843999982; }
        frame 13 { x: 7.5999999; y: 3; scale-x: 0.787; scale-y: 0.822000027; }
        frame 14 { x: 6.9000001; y: 5.19999981; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 15 { x: 6.19999981; y: 7.19999981; scale-x: 0.813000023; scale-y: 0.777999997; }
        frame 16 { x: 5.5; y: 9.39999962; scale-x: 0.825999975; scale-y: 0.755999982; }
        frame 17 { x: 4.80000019; y: 11.5; scale-x: 0.839999974; scale-y: 0.73299998; }
        frame 18 { x: 5.19999981; y: 10.5; scale-x: 0.833000004; scale-y: 0.745000005; }
        frame 19 { x: 5.4000001; y: 9.5; scale-x: 0.825999975; scale-y: 0.755999982; }
        frame 20 { x: 5.80000019; y: 8.39999962; scale-x: 0.819999993; scale-y: 0.76700002; }
        frame 21 { x: 6; y: 7.4000001; scale-x: 0.813000023; scale-y: 0.777999997; }
        frame 22 { x: 6.30000019; y: 6.30000019; scale-x: 0.806999981; scale-y: 0.788999975; }
        frame 23 { x: 6.5999999; y: 5.19999981; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 5.19999981; y: 9.39999962; scale-x: 0.828999996; scale-y: 0.754999995; }
        frame 52 { x: 3.79999995; y: 13.6999998; scale-x: 0.856999993; scale-y: 0.709999979; }
        frame 53 { x: 2.4000001; y: 17.8999996; scale-x: 0.885999978; scale-y: 0.665000021; }
        frame 54 { x: 1.10000002; y: 22.1000004; scale-x: 0.915000021; scale-y: 0.620000005; }
        frame 55 { x: -0.100000001; y: 26.3999996; scale-x: 0.944000006; scale-y: 0.574999988; }
        frame 56 { x: -1.5; y: 30.6000004; scale-x: 0.972000003; scale-y: 0.529999971; }
        frame 57 { x: -0.100000001; y: 25.6000004; scale-x: 0.943000019; scale-y: 0.583999991; }
        frame 58 { x: 1.20000005; y: 20.6000004; scale-x: 0.913999975; scale-y: 0.637000024; }
        frame 59 { x: 2.5; y: 15.6000004; scale-x: 0.88499999; scale-y: 0.689999998; }
        frame 60 { x: 4; y: 10.6999998; scale-x: 0.856000006; scale-y: 0.742999971; }
        frame 61 { x: 5.4000001; y: 5.69999981; scale-x: 0.827000022; scale-y: 0.796000004; }
        frame 62 { x: 6.80000019; y: 0.699999988; scale-x: 0.796999991; scale-y: 0.848999977; }
        frame 63 { x: 8.30000019; y: -4.0999999; scale-x: 0.768000007; scale-y: 0.90200001; }
        frame 64 { x: 9.69999981; y: -9.10000038; scale-x: 0.739000022; scale-y: 0.954999983; }
        frame 65 { x: 9; y: -5.4000001; scale-x: 0.754000008; scale-y: 0.916000009; }
        frame 66 { x: 8.19999981; y: -1.79999995; scale-x: 0.768999994; scale-y: 0.876999974; }
        frame 67 { x: 7.4000001; y: 1.60000002; scale-x: 0.785000026; scale-y: 0.838999987; }
        frame 68 { x: 6.5999999; y: 5.19999981; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 69 { x: 3; y: 14; scale-x: 0.873000026; scale-y: 0.707000017; }
        frame 70 { x: -0.5; y: 22.7000008; scale-x: 0.947000027; scale-y: 0.614000022; }
        frame 71 { x: -4.0999999; y: 31.5; scale-x: 1.01999998; scale-y: 0.521000028; }
        frame 72 { x: -7.69999981; y: 40.0999985; scale-x: 1.09300005; scale-y: 0.428000003; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 33.2000008; y: 30; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SQUASH_EYES; }
        frame 6 { x: 33.4000015; y: 29.3999996; scale-x: 0.795000017; scale-y: 0.80400002; cel: -10000; image: none; }
        frame 7 { x: 33.5; y: 28.7999992; scale-x: 0.788999975; scale-y: 0.809000015; }
        frame 8 { x: 33.7999992; y: 28.2999992; scale-x: 0.783999979; scale-y: 0.813000023; }
        frame 9 { x: 33.9000015; y: 27.7999992; scale-x: 0.777999997; scale-y: 0.816999972; }
        frame 10 { x: 34; y: 27.2000008; scale-x: 0.773000002; scale-y: 0.82099998; }
        frame 11 { x: 34.2000008; y: 26.6000004; scale-x: 0.768000007; scale-y: 0.825999975; }
        frame 12 { x: 34; y: 27.8999996; scale-x: 0.773000002; scale-y: 0.810000002; }
        frame 13 { x: 33.9000015; y: 29.1000004; scale-x: 0.777999997; scale-y: 0.795000017; }
        frame 14 { x: 33.7000008; y: 30.3999996; scale-x: 0.783999979; scale-y: 0.778999984; }
        frame 15 { x: 33.5; y: 31.6000004; scale-x: 0.788999975; scale-y: 0.763999999; }
        frame 16 { x: 33.4000015; y: 32.9000015; scale-x: 0.795000017; scale-y: 0.749000013; }
        frame 17 { x: 33.2000008; y: 34.0999985; scale-x: 0.800000012; scale-y: 0.73299998; }
        frame 18 { x: -10000; y: 33.4000015; scale-x: -10000; scale-y: 0.745000005; }
        frame 19 { y: 32.7999992; scale-y: 0.755999982; }
        frame 20 { y: 32; scale-y: 0.76700002; }
        frame 21 { y: 31.2999992; scale-y: 0.777999997; }
        frame 22 { y: 30.7000008; scale-y: 0.788999975; }
        frame 23 { y: 30; scale-y: 0.800000012; }
        frame 24 { y: -10000; scale-y: -10000; }
        frame 25 { x: 32.7999992; }
        frame 26 { x: 32.4000015; }
        frame 27 { x: 32; }
        frame 28 { x: 31.5; }
        frame 29 { x: 31.1000004; }
        frame 30 { x: -10000; }
        frame 32 { x: 31.5; }
        frame 33 { x: 32; }
        frame 34 { x: 32.4000015; }
        frame 35 { x: 32.7999992; }
        frame 36 { x: 33.2000008; }
        frame 37 { x: -10000; }
        frame 38 { x: 33.5999985; }
        frame 39 { x: 34; }
        frame 40 { x: 34.4000015; }
        frame 41 { x: 34.7999992; }
        frame 42 { x: 35.0999985; }
        frame 43 { x: -10000; }
        frame 45 { x: 34.7999992; }
        frame 46 { x: 34.4000015; }
        frame 47 { x: 34; }
        frame 48 { x: 33.5999985; }
        frame 49 { x: 33.2000008; }
        frame 50 { x: -10000; }
        frame 51 { x: 32.9000015; y: 32.7999992; scale-x: 0.819000006; scale-y: 0.754999995; }
        frame 52 { x: 32.5; y: 35.5999985; scale-x: 0.838999987; scale-y: 0.709999979; }
        frame 53 { x: 32.2000008; y: 38.5; scale-x: 0.85799998; scale-y: 0.665000021; }
        frame 54 { x: 31.8999996; y: 41.2999992; scale-x: 0.878000021; scale-y: 0.620000005; }
        frame 55 { x: 31.6000004; y: 44.0999985; scale-x: 0.897000015; scale-y: 0.574999988; }
        frame 56 { x: 31.2999992; y: 47; scale-x: 0.916999996; scale-y: 0.529999971; }
        frame 57 { x: 31.7000008; y: 43.7000008; scale-x: 0.893999994; scale-y: 0.583999991; }
        frame 58 { x: 32; y: 40.4000015; scale-x: 0.871999979; scale-y: 0.637000024; }
        frame 59 { x: 32.5; y: 37; scale-x: 0.850000024; scale-y: 0.689999998; }
        frame 60 { x: 32.7999992; y: 33.7000008; scale-x: 0.828000009; scale-y: 0.742999971; }
        frame 61 { x: 33.0999985; y: 30.3999996; scale-x: 0.805999994; scale-y: 0.796000004; }
        frame 62 { x: 33.5; y: 27.1000004; scale-x: 0.782999992; scale-y: 0.848999977; }
        frame 63 { x: 34; y: 23.7999992; scale-x: 0.760999978; scale-y: 0.90200001; }
        frame 64 { x: 34.4000015; y: 20.2999992; scale-x: 0.739000022; scale-y: 0.954999983; }
        frame 65 { x: 34.0999985; y: 22.7000008; scale-x: 0.754000008; scale-y: 0.916000009; }
        frame 66 { x: 33.7999992; y: 25.1000004; scale-x: 0.768999994; scale-y: 0.876999974; }
        frame 67 { x: 33.5; y: 27.6000004; scale-x: 0.785000026; scale-y: 0.838999987; }
        frame 68 { x: 33.2000008; y: 30; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 69 { x: 32.2000008; y: 35.7999992; scale-x: 0.85799998; scale-y: 0.707000017; }
        frame 70 { x: 31.2000008; y: 41.7000008; scale-x: 0.915000021; scale-y: 0.614000022; }
        frame 71 { x: 30.1000004; y: 47.5; scale-x: 0.97299999; scale-y: 0.521000028; }
        frame 72 { x: 29.2000008; y: 53.4000015; scale-x: 1.02999997; scale-y: 0.428000003; }
    }
    Track {
        source-name: "anim_eye";
        frame-count: 73;
        frame 0 { x: 25.2999992; y: 18.8999996; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_SQUASH_EYEBROWS; }
        frame 1 { x: 24.3999996; y: 21.7999992; scale-x: 0.851999998; scale-y: 0.80400002; image: none; }
        frame 2 { x: 23.6000004; y: 22.1000004; scale-x: 0.893999994; scale-y: 0.916000009; }
        frame 3 { x: 24.3999996; y: 21.7999992; scale-x: 0.851999998; scale-y: 0.80400002; }
        frame 4 { x: 25.2999992; y: 18.8999996; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 5 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 25.6000004; y: 18.2000008; scale-x: 0.795000017; scale-y: 0.80400002; }
        frame 7 { x: 25.7999992; y: 17.5; scale-x: 0.788999975; scale-y: 0.809000015; }
        frame 8 { x: 26; y: 16.8999996; scale-x: 0.783999979; scale-y: 0.813000023; }
        frame 9 { x: 26.2000008; y: 16.2000008; scale-x: 0.777999997; scale-y: 0.816999972; }
        frame 10 { x: 26.5; y: 15.5; scale-x: 0.773000002; scale-y: 0.82099998; }
        frame 11 { x: 26.7000008; y: 14.8000002; scale-x: 0.768000007; scale-y: 0.825999975; }
        frame 12 { x: 26.5; y: 16.3999996; scale-x: 0.773000002; scale-y: 0.810000002; }
        frame 13 { x: 26.2000008; y: 17.8999996; scale-x: 0.777999997; scale-y: 0.795000017; }
        frame 14 { x: 26; y: 19.3999996; scale-x: 0.783999979; scale-y: 0.778999984; }
        frame 15 { x: 25.7999992; y: 20.8999996; scale-x: 0.788999975; scale-y: 0.763999999; }
        frame 16 { x: 25.6000004; y: 22.3999996; scale-x: 0.795000017; scale-y: 0.749000013; }
        frame 17 { x: 25.2999992; y: 24; scale-x: 0.800000012; scale-y: 0.73299998; }
        frame 18 { x: -10000; y: 23.1000004; scale-x: -10000; scale-y: 0.745000005; }
        frame 19 { y: 22.2999992; scale-y: 0.755999982; }
        frame 20 { y: 21.5; scale-y: 0.76700002; }
        frame 21 { y: 20.6000004; scale-y: 0.777999997; }
        frame 22 { y: 19.7000008; scale-y: 0.788999975; }
        frame 23 { y: 18.8999996; scale-y: 0.800000012; }
        frame 24 { y: -10000; scale-y: -10000; }
        frame 25 { y: 18.1000004; skew-x: 2.5; scale-x: 0.80400002; }
        frame 26 { x: 25.3999996; y: 17.2000008; skew-x: 5; scale-x: 0.808000028; }
        frame 27 { x: -10000; y: 16.3999996; skew-x: 7.5; scale-x: 0.81099999; }
        frame 28 { x: 25.6000004; y: 15.6000004; skew-x: 10; scale-x: 0.814999998; }
        frame 29 { x: 25.7000008; y: 14.6999998; skew-x: 12.6000004; scale-x: 0.819999993; }
        frame 30 { x: -10000; y: -10000; skew-x: 12.5; scale-x: 0.819000006; }
        frame 31 { skew-x: 12.6000004; scale-x: 0.819999993; }
        frame 32 { x: 25.6000004; y: 15.6000004; skew-x: 10; scale-x: 0.814999998; }
        frame 33 { x: 25.3999996; y: 16.3999996; skew-x: 7.5; scale-x: 0.81099999; }
        frame 34 { x: -10000; y: 17.2000008; skew-x: 5; scale-x: 0.808000028; }
        frame 35 { x: 25.2999992; y: 18; skew-x: 2.5; scale-x: 0.80400002; }
        frame 36 { x: -10000; y: 18.8999996; skew-x: 0; scale-x: 0.800000012; }
        frame 37 { y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 38 { x: 25.2000008; y: 19.7000008; skew-x: -3.20000005; scale-x: 0.806999981; }
        frame 39 { x: -10000; y: 20.6000004; skew-x: -6.4000001; scale-x: 0.813000023; }
        frame 40 { y: 21.3999996; skew-x: -9.69999981; scale-x: 0.819999993; }
        frame 41 { y: 22.2999992; skew-x: -12.8999996; scale-x: 0.825999975; }
        frame 42 { x: 25.2999992; y: 23.2000008; skew-x: -16.2999992; scale-x: 0.833999991; }
        frame 43 { x: -10000; y: -10000; skew-x: -16.2000008; scale-x: 0.833000004; }
        frame 44 { skew-x: -16.2999992; scale-x: 0.833999991; }
        frame 45 { x: 25.2000008; y: 22.2999992; skew-x: -12.8999996; scale-x: 0.825999975; }
        frame 46 { x: -10000; y: 21.3999996; skew-x: -9.69999981; scale-x: 0.819999993; }
        frame 47 { y: 20.6000004; skew-x: -6.4000001; scale-x: 0.813000023; }
        frame 48 { y: 19.7000008; skew-x: -3.20000005; scale-x: 0.806999981; }
        frame 49 { x: 25.2999992; y: 18.8999996; skew-x: 0; scale-x: 0.800000012; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 51 { x: 24.6000004; y: 22.6000004; scale-x: 0.832000017; scale-y: 0.762000024; }
        frame 52 { x: 23.7999992; y: 26.3999996; scale-x: 0.864000022; scale-y: 0.72299999; }
        frame 53 { x: 23.1000004; y: 30.2000008; scale-x: 0.896000028; scale-y: 0.685000002; }
        frame 54 { x: 22.2999992; y: 33.9000015; scale-x: 0.926999986; scale-y: 0.646000028; }
        frame 55 { x: 21.6000004; y: 37.5999985; scale-x: 0.958999991; scale-y: 0.60799998; }
        frame 56 { x: 20.7999992; y: 41.4000015; scale-x: 0.990999997; scale-y: 0.569000006; }
        frame 57 { x: 21.6000004; y: 36.2000008; scale-x: 0.959999979; scale-y: 0.617999971; }
        frame 58 { x: 22.3999996; y: 31.1000004; scale-x: 0.927999973; scale-y: 0.666000009; }
        frame 59 { x: 23.1000004; y: 26; scale-x: 0.897000015; scale-y: 0.713999987; }
        frame 60 { x: 23.8999996; y: 20.8999996; scale-x: 0.86500001; scale-y: 0.762000024; }
        frame 61 { x: 24.7000008; y: 15.6999998; scale-x: 0.833999991; scale-y: 0.810000002; }
        frame 62 { x: 25.5; y: 10.6000004; scale-x: 0.801999986; scale-y: 0.859000027; }
        frame 63 { x: 26.2000008; y: 5.5; scale-x: 0.769999981; scale-y: 0.907000005; }
        frame 64 { x: 27; y: 0.400000006; scale-x: 0.739000022; scale-y: 0.954999983; }
        frame 65 { x: 26.6000004; y: 5; scale-x: 0.754000008; scale-y: 0.916000009; }
        frame 66 { x: 26.2000008; y: 9.60000038; scale-x: 0.768999994; scale-y: 0.876999974; }
        frame 67 { x: 25.7999992; y: 14.3000002; scale-x: 0.785000026; scale-y: 0.838999987; }
        frame 68 { x: 25.2999992; y: 18.8999996; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 69 { x: 23.3999996; y: 26.5; scale-x: 0.879000008; scale-y: 0.714999974; }
        frame 70 { x: 21.3999996; y: 34.2999992; scale-x: 0.957000017; scale-y: 0.629999995; }
        frame 71 { x: 19.3999996; y: 41.9000015; scale-x: 1.03600001; scale-y: 0.545000017; }
        frame 72 { x: 17.3999996; y: 49.5; scale-x: 1.11399996; scale-y: 0.460000008; }
    }
}
