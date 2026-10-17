export component Marigold {
    fps: 33;
    Track {
        source-name: "anim_idle";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 30;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "backleaf";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 27.7000008; y: 53; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF; }
        frame 6 { x: -10000; y: 53.2999992; scale-x: 0.56099999; scale-y: 0.542999983; cel: -10000; image: none; }
        frame 7 { y: 53.5; scale-x: 0.565999985; scale-y: 0.529999971; }
        frame 8 { x: 27.6000004; y: 53.9000015; scale-x: 0.572000027; scale-y: 0.518000007; }
        frame 9 { x: -10000; y: 54.0999985; scale-x: 0.577000022; scale-y: 0.504999995; }
        frame 10 { y: 54.5; scale-x: 0.583000004; scale-y: 0.492000014; }
        frame 11 { y: 54.7999992; scale-x: 0.588; scale-y: 0.479999989; }
        frame 12 { y: 55; scale-x: 0.593999982; scale-y: 0.467000008; }
        frame 13 { x: 27.5; y: 55.2999992; scale-x: 0.598999977; scale-y: 0.453999996; }
        frame 14 { x: -10000; y: 55.5999985; scale-x: 0.605000019; scale-y: 0.442000002; }
        frame 15 { y: 55.9000015; scale-x: 0.610000014; scale-y: 0.42899999; }
        frame 16 { y: 55.5999985; scale-x: 0.606999993; scale-y: 0.437999994; }
        frame 17 { y: 55.5; scale-x: 0.602999985; scale-y: 0.446999997; }
        frame 18 { y: 55.2999992; scale-x: 0.598999977; scale-y: 0.456; }
        frame 19 { x: 27.6000004; y: 55; scale-x: 0.595000029; scale-y: 0.465000004; }
        frame 20 { x: -10000; y: 54.9000015; scale-x: 0.591000021; scale-y: 0.474000007; }
        frame 21 { y: 54.5999985; scale-x: 0.587000012; scale-y: 0.48300001; }
        frame 22 { y: 54.4000015; scale-x: 0.583000004; scale-y: 0.492000014; }
        frame 23 { y: 54.2000008; scale-x: 0.578999996; scale-y: 0.500999987; }
        frame 24 { y: 54; scale-x: 0.574999988; scale-y: 0.50999999; }
        frame 25 { x: 27.7000008; y: 53.7000008; scale-x: 0.57099998; scale-y: 0.518999994; }
        frame 26 { x: -10000; y: 53.5999985; scale-x: 0.566999972; scale-y: 0.527999997; }
        frame 27 { y: 53.4000015; scale-x: 0.563000023; scale-y: 0.537; }
        frame 28 { y: 53.0999985; scale-x: 0.559000015; scale-y: 0.546000004; }
        frame 29 { y: 53; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "backleaf_left_tip";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 25; y: 53.9000015; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF_LEFTTIP; }
        frame 6 { x: -10000; y: 54; skew-x: 0.5; skew-y: 0.5; scale-x: 0.564999998; scale-y: 0.546999991; cel: -10000; image: none; }
        frame 7 { x: 24.8999996; y: 54.2000008; skew-x: 1; skew-y: 1; scale-x: 0.574999988; scale-y: 0.538999975; }
        frame 8 { x: -10000; y: 54.4000015; skew-x: 1.5; skew-y: 1.5; scale-x: 0.583999991; scale-y: 0.531000018; }
        frame 9 { y: 54.5; skew-x: 2; skew-y: 2; scale-x: 0.593999982; scale-y: 0.523000002; }
        frame 10 { x: 25; y: 54.7000008; skew-x: 2.70000005; skew-y: 2.70000005; scale-x: 0.603999972; scale-y: 0.514999986; }
        frame 11 { x: 24.7000008; y: 55.2999992; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.615999997; scale-y: -10000; }
        frame 12 { x: 24.5; y: 55.7999992; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.628000021; }
        frame 13 { x: 24.2999992; y: 56.4000015; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: 0.639999986; }
        frame 14 { x: 24; y: 57; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: 0.65200001; }
        frame 15 { x: 23.8999996; y: 57.5; skew-x: -8.5; skew-y: -8.5; scale-x: 0.665000021; }
        frame 16 { x: 24.1000004; y: 57; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: 0.656000018; }
        frame 17 { x: 24.2000008; y: 56.7999992; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.647000015; }
        frame 18 { x: 24.2999992; y: 56.2999992; skew-x: -3.5; skew-y: -3.5; scale-x: 0.638000011; }
        frame 19 { x: 24.5; y: 55.9000015; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: 0.629999995; }
        frame 20 { x: 24.7000008; y: 55.5; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: 0.620999992; }
        frame 21 { x: 24.7999992; y: 55.0999985; skew-x: 1; skew-y: 1; scale-x: 0.612999976; }
        frame 22 { x: 25; y: 54.7000008; skew-x: 2.70000005; skew-y: 2.70000005; scale-x: 0.603999972; }
        frame 23 { y: 54.5; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.597000003; scale-y: 0.521000028; }
        frame 24 { x: 24.8999996; y: -10000; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: 0.589999974; scale-y: 0.52700001; }
        frame 25 { x: 25.1000004; y: 54.4000015; skew-x: 1.5; skew-y: 1.5; scale-x: 0.583000004; scale-y: 0.532000005; }
        frame 26 { x: 25; y: 54.2999992; skew-x: 1; skew-y: 1; scale-x: 0.575999975; scale-y: 0.537999988; }
        frame 27 { y: 54.0999985; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.569000006; scale-y: 0.54400003; }
        frame 28 { y: 54; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.561999977; scale-y: 0.550000012; }
        frame 29 { x: -10000; y: 53.9000015; skew-x: 0; skew-y: 0; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "backleaf_right_tip";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 47; y: 52.9000015; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF_RIGHTTIP; }
        frame 6 { x: 47.2000008; y: 53.0999985; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.578000009; scale-y: 0.546999991; cel: -10000; image: none; }
        frame 7 { x: 47.2999992; y: 53.4000015; skew-x: 0.5; skew-y: 0.5; scale-x: 0.600000024; scale-y: 0.538999975; }
        frame 8 { x: 47.5; y: 53.5999985; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.623000026; scale-y: 0.531000018; }
        frame 9 { x: -10000; y: 54; skew-x: 1.10000002; skew-y: 1.10000002; scale-x: 0.644999981; scale-y: 0.523000002; }
        frame 10 { x: 47.7000008; y: 54.0999985; skew-x: 1.5; skew-y: 1.5; scale-x: 0.666999996; scale-y: 0.514999986; }
        frame 11 { x: 47.9000015; y: 54.4000015; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.660000026; scale-y: 0.508000016; }
        frame 12 { x: 48.0999985; y: 54.7999992; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.652999997; scale-y: 0.5; }
        frame 13 { x: 48.4000015; y: 55; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 0.646000028; scale-y: 0.492000014; }
        frame 14 { x: 48.5999985; y: 55.4000015; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: 0.638999999; scale-y: 0.483999997; }
        frame 15 { x: 48.7999992; y: 55.7000008; skew-x: 8.80000019; skew-y: 8.80000019; scale-x: 0.633000016; scale-y: 0.476999998; }
        frame 16 { x: 48.5; y: 55.5; skew-x: 7.5999999; skew-y: 7.5999999; scale-x: 0.637000024; scale-y: 0.481999993; }
        frame 17 { x: 48.4000015; y: 55.2999992; skew-x: 6.5; skew-y: 6.5; scale-x: 0.64200002; scale-y: 0.488000005; }
        frame 18 { x: 48.2999992; y: 55; skew-x: 5.5; skew-y: 5.5; scale-x: 0.647000015; scale-y: 0.493000001; }
        frame 19 { x: 48; y: 54.7999992; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.65200001; scale-y: 0.499000013; }
        frame 20 { y: 54.5999985; skew-x: 3.29999995; skew-y: 3.29999995; scale-x: 0.657000005; scale-y: 0.504000008; }
        frame 21 { x: 47.7999992; y: 54.4000015; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.662; scale-y: 0.50999999; }
        frame 22 { x: 47.7000008; y: 54.0999985; skew-x: 1.20000005; skew-y: 1.20000005; scale-x: 0.666999996; scale-y: 0.514999986; }
        frame 23 { x: 47.5; y: 54; skew-x: 1; skew-y: 1; scale-x: 0.651000023; scale-y: 0.521000028; }
        frame 24 { x: -10000; y: 53.7999992; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.63499999; scale-y: 0.52700001; }
        frame 25 { y: 53.5; skew-x: 0.600000024; skew-y: 0.600000024; scale-x: 0.619000018; scale-y: 0.532999992; }
        frame 26 { x: 47.4000015; y: 53.4000015; skew-x: 0.5; skew-y: 0.5; scale-x: 0.602999985; scale-y: 0.537999988; }
        frame 27 { x: -10000; y: 53.2000008; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.587000012; scale-y: 0.54400003; }
        frame 28 { x: 47.2999992; y: 53; skew-x: 0; skew-y: 0; scale-x: 0.57099998; scale-y: 0.550000012; }
        frame 29 { x: 47.0999985; y: 52.9000015; skew-x: -10000; skew-y: -10000; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "stalk_bottom";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 36.0999985; y: 52.5999985; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_STALK_BOTTOM; }
        frame 6 { x: 36.5; y: 52.0999985; skew-x: 2; skew-y: 1.29999995; scale-x: 0.555999994; scale-y: 0.574000001; cel: -10000; image: none; }
        frame 7 { x: 36.5999985; y: 51.5999985; skew-x: 4.0999999; skew-y: 2.79999995; scale-x: 0.556999981; scale-y: 0.592000008; }
        frame 8 { x: 37; y: 51.0999985; skew-x: 6.30000019; skew-y: 4; scale-x: 0.558000028; scale-y: 0.610000014; }
        frame 9 { x: 37.4000015; y: 50.7999992; skew-x: 8.30000019; skew-y: 5.5; scale-x: 0.559000015; scale-y: 0.629000008; }
        frame 10 { x: 37.7000008; y: 50.2999992; skew-x: 10.5; skew-y: 6.80000019; scale-x: -10000; scale-y: 0.647000015; }
        frame 11 { x: 38; y: 49.7999992; skew-x: 12.6999998; skew-y: 8.30000019; scale-x: 0.560000002; scale-y: 0.665000021; }
        frame 12 { x: 38.7999992; y: 49.9000015; skew-x: 15.8000002; skew-y: 11.3000002; scale-x: -10000; scale-y: 0.646000028; }
        frame 13 { x: 39.5; y: 50.0999985; skew-x: 18.7999992; skew-y: 14.5; scale-y: 0.626999974; }
        frame 14 { x: 40.0999985; y: 50.2999992; skew-x: 22.1000004; skew-y: 17.6000004; scale-y: 0.609000027; }
        frame 15 { x: 40.7999992; y: 50.5; skew-x: 25.2999992; skew-y: 20.7999992; scale-x: 0.559000015; scale-y: 0.589999974; }
        frame 16 { x: 41.5; y: 50.5999985; skew-x: 28.2999992; skew-y: 23.7999992; scale-x: -10000; scale-y: 0.57099998; }
        frame 17 { x: 42.2000008; y: 50.9000015; skew-x: 31.6000004; skew-y: 27.1000004; scale-x: 0.560000002; scale-y: 0.552999973; }
        frame 18 { x: 41.5; y: 50.7999992; skew-x: 28.2999992; skew-y: 23.7999992; scale-x: 0.559000015; scale-y: 0.57099998; }
        frame 19 { x: 40.7999992; y: 50.5; skew-x: 25.2999992; skew-y: 20.7999992; scale-x: -10000; scale-y: 0.589999974; }
        frame 20 { x: 40.2000008; y: 50.4000015; skew-x: 22.1000004; skew-y: 17.6000004; scale-x: 0.560000002; scale-y: 0.609000027; }
        frame 21 { x: 39.5; y: 50.2000008; skew-x: 18.7999992; skew-y: 14.5; scale-x: -10000; scale-y: 0.626999974; }
        frame 22 { x: 38.7000008; y: 50; skew-x: 15.8000002; skew-y: 11.3000002; scale-y: 0.646000028; }
        frame 23 { x: 38; y: 49.7999992; skew-x: 12.6999998; skew-y: 8.30000019; scale-y: 0.665000021; }
        frame 24 { x: 37.5999985; y: 50.4000015; skew-x: 10.5; skew-y: 6.80000019; scale-x: 0.559000015; scale-y: 0.647000015; }
        frame 25 { x: 37.4000015; y: 50.7999992; skew-x: 8.30000019; skew-y: 5.5; scale-x: -10000; scale-y: 0.629000008; }
        frame 26 { x: 37; y: 51.2000008; skew-x: 6.30000019; skew-y: 4; scale-x: 0.558000028; scale-y: 0.610000014; }
        frame 27 { x: 36.5999985; y: 51.5999985; skew-x: 4.0999999; skew-y: 2.79999995; scale-x: 0.556999981; scale-y: 0.592000008; }
        frame 28 { x: 36.4000015; y: 52.0999985; skew-x: 2; skew-y: 1.29999995; scale-x: 0.555999994; scale-y: 0.574000001; }
        frame 29 { x: 36.0999985; y: 52.5999985; skew-x: 0; skew-y: 0; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "stalk_top";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 31; y: 45.2999992; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_STALK_TOP; }
        frame 6 { x: 31.3999996; y: 43; skew-x: 1.79999995; skew-y: 1; scale-x: 0.555999994; scale-y: 0.633000016; cel: -10000; image: none; }
        frame 7 { x: 32; y: 40.7999992; skew-x: 3.79999995; skew-y: 2.29999995; scale-x: 0.556999981; scale-y: 0.709999979; }
        frame 8 { x: 32.5; y: 38.5; skew-x: 5.69999981; skew-y: 3.5; scale-x: -10000; scale-y: 0.787; }
        frame 9 { x: 33.5999985; y: 37.7000008; skew-x: 7.30000019; skew-y: 4.5; scale-x: 0.560000002; scale-y: 0.810000002; }
        frame 10 { x: 34.9000015; y: 36.7999992; skew-x: 9.10000038; skew-y: 5.5; scale-x: 0.563000023; scale-y: 0.833999991; }
        frame 11 { x: 36.0999985; y: 35.7999992; skew-x: 11; skew-y: 6.5; scale-x: 0.565999985; scale-y: 0.85799998; }
        frame 12 { x: 36.7999992; y: 36.2999992; skew-x: 13.1000004; skew-y: 8.80000019; scale-x: 0.56400001; scale-y: 0.842999995; }
        frame 13 { x: 37.4000015; y: 36.5999985; skew-x: 15.5; skew-y: 11; scale-x: 0.561999977; scale-y: 0.828999996; }
        frame 14 { x: 38; y: 37.0999985; skew-x: 17.7999992; skew-y: 13.3000002; scale-x: 0.56099999; scale-y: 0.814999998; }
        frame 15 { x: 40.2000008; y: 37.5; skew-x: 24.1000004; skew-y: 19.6000004; scale-x: 0.559000015; scale-y: 0.786000013; }
        frame 16 { x: 42.5; y: 37.7999992; skew-x: 30.3999996; skew-y: 26; scale-x: 0.558000028; scale-y: 0.757000029; }
        frame 17 { x: 44.5999985; y: 38.4000015; skew-x: 36.7999992; skew-y: 32.4000015; scale-x: 0.556999981; scale-y: 0.730000019; }
        frame 18 { x: 42.4000015; y: 37.9000015; skew-x: 30.3999996; skew-y: 26; scale-x: 0.558000028; scale-y: 0.757000029; }
        frame 19 { x: 40.0999985; y: 37.5; skew-x: 24.1000004; skew-y: 19.6000004; scale-x: 0.559000015; scale-y: 0.786000013; }
        frame 20 { x: 38; y: 37.0999985; skew-x: 17.7999992; skew-y: 13.3000002; scale-x: 0.56099999; scale-y: 0.814999998; }
        frame 21 { x: 36.7999992; y: 36.9000015; skew-x: 15.5; skew-y: 11; scale-x: 0.561999977; scale-y: 0.828999996; }
        frame 22 { x: 35.5; y: 36.7999992; skew-x: 13.1000004; skew-y: 8.80000019; scale-x: 0.56400001; scale-y: 0.842999995; }
        frame 23 { x: 34.2999992; y: 36.5999985; skew-x: 11; skew-y: 6.5; scale-x: 0.565999985; scale-y: 0.85799998; }
        frame 24 { x: 33.7000008; y: 37.2999992; skew-x: 9.10000038; skew-y: 5.5; scale-x: 0.563000023; scale-y: 0.833999991; }
        frame 25 { x: 33.0999985; y: 37.9000015; skew-x: 7.30000019; skew-y: 4.5; scale-x: 0.560000002; scale-y: 0.810000002; }
        frame 26 { x: 32.5; y: 38.5; skew-x: 5.69999981; skew-y: 3.5; scale-x: 0.556999981; scale-y: 0.787; }
        frame 27 { x: 32; y: 40.9000015; skew-x: 3.79999995; skew-y: 2.29999995; scale-x: -10000; scale-y: 0.709999979; }
        frame 28 { x: 31.5; y: 43; skew-x: 1.79999995; skew-y: 1; scale-x: 0.555999994; scale-y: 0.633000016; }
        frame 29 { x: 31; y: 45.2999992; skew-x: 0; skew-y: 0; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "frontleaf";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 22.7999992; y: 54.4000015; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF; }
        frame 6 { x: 22.7000008; y: 54.5; scale-x: 0.559000015; scale-y: 0.550000012; cel: -10000; image: none; }
        frame 7 { x: 22.6000004; y: 54.7999992; scale-x: 0.563000023; scale-y: 0.54400003; }
        frame 8 { x: 22.5; y: 55; scale-x: 0.565999985; scale-y: 0.537999988; }
        frame 9 { x: 22.3999996; y: 55.0999985; scale-x: 0.569999993; scale-y: 0.532999992; }
        frame 10 { x: 22.2999992; y: 55.2999992; scale-x: 0.574000001; scale-y: 0.52700001; }
        frame 11 { x: 22.2000008; y: 55.4000015; scale-x: 0.577000022; scale-y: 0.521000028; }
        frame 12 { x: 22.1000004; y: 55.5999985; scale-x: 0.58099997; scale-y: 0.515999973; }
        frame 13 { x: 22; y: 55.7999992; scale-x: 0.584999979; scale-y: 0.50999999; }
        frame 14 { x: 21.8999996; y: 56; scale-x: 0.588; scale-y: 0.504000008; }
        frame 15 { x: 21.7999992; y: 56.0999985; scale-x: 0.592000008; scale-y: 0.499000013; }
        frame 16 { x: 21.7000008; y: 56.4000015; scale-x: 0.596000016; scale-y: 0.493000001; }
        frame 17 { x: -10000; y: 56.5; scale-x: 0.600000024; scale-y: 0.486999989; }
        frame 18 { y: 56.4000015; scale-x: 0.596000016; scale-y: 0.493000001; }
        frame 19 { x: 21.8999996; y: 56.0999985; scale-x: 0.592000008; scale-y: 0.499000013; }
        frame 20 { x: 22; y: 56; scale-x: 0.588; scale-y: 0.504000008; }
        frame 21 { x: 22.1000004; y: 55.9000015; scale-x: 0.584999979; scale-y: 0.50999999; }
        frame 22 { x: 22.2000008; y: 55.5999985; scale-x: 0.58099997; scale-y: 0.515999973; }
        frame 23 { x: -10000; y: 55.5; scale-x: 0.577000022; scale-y: 0.521000028; }
        frame 24 { x: 22.2999992; y: 55.2999992; scale-x: 0.574000001; scale-y: 0.52700001; }
        frame 25 { x: 22.3999996; y: 55.0999985; scale-x: 0.569999993; scale-y: 0.532999992; }
        frame 26 { x: 22.5; y: 54.9000015; scale-x: 0.565999985; scale-y: 0.537999988; }
        frame 27 { x: 22.6000004; y: 54.7999992; scale-x: 0.563000023; scale-y: 0.54400003; }
        frame 28 { x: 22.7000008; y: 54.5999985; scale-x: 0.559000015; scale-y: 0.550000012; }
        frame 29 { x: 22.7999992; y: 54.4000015; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "frontleaf_right_tip";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 56.2999992; y: 56; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_RIGHTTIP; }
        frame 6 { x: 56.0999985; y: -10000; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.583999991; scale-y: 0.55400002; cel: -10000; image: none; }
        frame 7 { x: -10000; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.612999976; scale-y: 0.551999986; }
        frame 8 { x: 56; y: 56.0999985; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.64200002; scale-y: 0.550000012; }
        frame 9 { x: 55.9000015; y: 56.2999992; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.671000004; scale-y: 0.547999978; }
        frame 10 { x: 55.7999992; y: 56.4000015; skew-x: -7.5; skew-y: -7.5; scale-x: 0.699999988; scale-y: 0.546999991; }
        frame 11 { x: 55.5; y: 56.5; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: 0.728999972; scale-y: 0.545000017; }
        frame 12 { x: 56; y: -10000; skew-x: -7.5; skew-y: -7.5; scale-x: 0.707000017; scale-y: 0.542999983; }
        frame 13 { x: 56.4000015; y: 56.5999985; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.68599999; scale-y: 0.541999996; }
        frame 14 { x: 56.7999992; y: 56.7999992; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.663999975; scale-y: 0.540000021; }
        frame 15 { x: 57; y: 56.9000015; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.643000007; scale-y: 0.538999975; }
        frame 16 { x: 57.4000015; y: 57; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.620999992; scale-y: 0.537; }
        frame 17 { x: 57.9000015; y: 57.0999985; skew-x: 0; skew-y: 0; scale-x: 0.600000024; scale-y: 0.535000026; }
        frame 18 { x: 57.5; y: 57; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.620999992; scale-y: 0.537; }
        frame 19 { x: 57.0999985; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.643000007; scale-y: 0.538999975; }
        frame 20 { x: 56.7999992; y: 56.7999992; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.663999975; scale-y: 0.540000021; }
        frame 21 { x: 56.4000015; y: -10000; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.68599999; scale-y: 0.541999996; }
        frame 22 { x: 56; y: 56.7000008; skew-x: -7.5; skew-y: -7.5; scale-x: 0.707000017; scale-y: 0.542999983; }
        frame 23 { x: 55.5; y: 56.5999985; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: 0.728999972; scale-y: 0.545000017; }
        frame 24 { x: 55.5999985; y: 56.5; skew-x: -7.5; skew-y: -7.5; scale-x: 0.699999988; scale-y: 0.546999991; }
        frame 25 { x: 55.7000008; y: 56.4000015; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.671000004; scale-y: 0.547999978; }
        frame 26 { x: 55.9000015; y: 56.2999992; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.64200002; scale-y: 0.550000012; }
        frame 27 { x: 56; y: 56.0999985; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.612999976; scale-y: 0.551999986; }
        frame 28 { x: 56.0999985; y: 56; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.583999991; scale-y: 0.55400002; }
        frame 29 { x: 56.2999992; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "frontleaf_tip_left";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 19.3999996; y: 61.5999985; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_LEFTTIP; }
        frame 6 { x: 19.5; y: 61.4000015; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.566999972; scale-y: 0.55400002; cel: -10000; image: none; }
        frame 7 { x: -10000; y: 61.2999992; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.579999983; scale-y: 0.551999986; }
        frame 8 { y: 61.0999985; skew-x: 4; skew-y: 4; scale-x: 0.592000008; scale-y: 0.550000012; }
        frame 9 { x: 19.6000004; y: 60.9000015; skew-x: 5.5; skew-y: 5.5; scale-x: 0.603999972; scale-y: 0.547999978; }
        frame 10 { x: 19.7000008; y: 60.7999992; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: 0.615999997; scale-y: 0.546000004; }
        frame 11 { x: 19.6000004; y: 60.4000015; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.628000021; scale-y: 0.545000017; }
        frame 12 { x: -10000; y: 60.7999992; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 0.609000027; scale-y: 0.550999999; }
        frame 13 { x: 19.5; y: 61.2000008; skew-x: 3.5; skew-y: 3.5; scale-x: 0.591000021; scale-y: 0.556999981; }
        frame 14 { x: -10000; y: 61.5; skew-x: 1; skew-y: 1; scale-x: 0.573000014; scale-y: 0.563000023; }
        frame 15 { y: 61.9000015; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.55400002; scale-y: 0.569000006; }
        frame 16 { x: 19.3999996; y: 62.2999992; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: 0.536000013; scale-y: 0.574999988; }
        frame 17 { x: -10000; y: 62.5999985; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.51700002; scale-y: 0.582000017; }
        frame 18 { x: 19.5; y: 62.4000015; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: 0.536000013; scale-y: 0.574999988; }
        frame 19 { x: -10000; y: 62; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.55400002; scale-y: 0.569000006; }
        frame 20 { y: 61.5999985; skew-x: 1; skew-y: 1; scale-x: 0.573000014; scale-y: 0.563000023; }
        frame 21 { x: 19.6000004; y: 61.4000015; skew-x: 3.5; skew-y: 3.5; scale-x: 0.591000021; scale-y: 0.556999981; }
        frame 22 { x: -10000; y: 61; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 0.609000027; scale-y: 0.550999999; }
        frame 23 { y: 60.5999985; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.628000021; scale-y: 0.545000017; }
        frame 24 { x: 19.5; y: 60.9000015; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: 0.615999997; scale-y: 0.546000004; }
        frame 25 { x: -10000; y: -10000; skew-x: 5.5; skew-y: 5.5; scale-x: 0.603999972; scale-y: 0.547999978; }
        frame 26 { y: 61.0999985; skew-x: 4; skew-y: 4; scale-x: 0.592000008; scale-y: 0.550000012; }
        frame 27 { x: 19.3999996; y: 61.2000008; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.579999983; scale-y: 0.551999986; }
        frame 28 { x: 19.2999992; y: 61.4000015; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.566999972; scale-y: 0.55400002; }
        frame 29 { x: 19.3999996; y: 61.5999985; skew-x: 0; skew-y: 0; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "Marigold_petals";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 13.8000002; y: 6; scale-x: 0.699999988; scale-y: 0.663999975; cel: 0; image: IMAGE_REANIM_MARIGOLD_PETALS; }
        frame 6 { x: 14.1999998; y: 4.5; scale-x: -10000; scale-y: 0.675999999; cel: -10000; image: none; }
        frame 7 { x: 14.6000004; y: 3; scale-y: 0.688000023; }
        frame 8 { x: 15; y: 1.5; scale-y: 0.699999988; }
        frame 9 { x: 15.6000004; y: 1; scale-y: -10000; }
        frame 10 { x: 16.2000008; y: 0.5; }
        frame 11 { x: 16.7999992; y: 0; }
        frame 12 { x: 17.3999996; y: 0.699999988; }
        frame 13 { x: 18; y: 1.39999998; }
        frame 14 { x: 18.6000004; y: 2.0999999; }
        frame 15 { x: 19.6000004; y: 3.5; scale-y: 0.688000023; }
        frame 16 { x: 20.5; y: 4.80000019; scale-y: 0.675999999; }
        frame 17 { x: 21.3999996; y: 6.19999981; scale-y: 0.663999975; }
        frame 18 { x: 20.5; y: 4.80000019; scale-y: 0.675999999; }
        frame 19 { x: 19.6000004; y: 3.5; scale-y: 0.688000023; }
        frame 20 { x: 18.6000004; y: 2.0999999; scale-y: 0.699999988; }
        frame 21 { x: 18; y: 1.39999998; scale-y: -10000; }
        frame 22 { x: 17.3999996; y: 0.699999988; }
        frame 23 { x: 16.7999992; y: 0; }
        frame 24 { x: 16.2000008; y: 0.5; }
        frame 25 { x: 15.6000004; y: 1; }
        frame 26 { x: 15; y: 1.5; }
        frame 27 { x: 14.6000004; y: 3; scale-y: 0.688000023; }
        frame 28 { x: 14.1999998; y: 4.5; scale-y: 0.675999999; }
        frame 29 { x: 13.8000002; y: 6; scale-y: 0.663999975; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 25.8999996; y: 15.3999996; scale-x: 0.699999988; scale-y: 0.699999988; cel: 0; image: IMAGE_REANIM_MARIGOLD_HEAD; }
        frame 6 { x: 26.2999992; y: 14.6999998; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 26.7000008; y: 14; }
        frame 8 { x: 27.1000004; y: 13.1999998; }
        frame 9 { x: 27.7000008; y: 13; }
        frame 10 { x: 28.2999992; y: 12.6999998; }
        frame 11 { x: 28.8999996; y: 12.3999996; }
        frame 12 { x: 29.5; y: 12.8999996; }
        frame 13 { x: 30.1000004; y: 13.3999996; }
        frame 14 { x: 30.7000008; y: 13.8000002; }
        frame 15 { x: 31.7000008; y: 14.5; }
        frame 16 { x: 32.7000008; y: 15.1999998; }
        frame 17 { x: 33.7999992; y: 15.8000002; }
        frame 18 { x: 32.7000008; y: 15.1999998; }
        frame 19 { x: 31.7000008; y: 14.5; }
        frame 20 { x: 30.7000008; y: 13.8000002; }
        frame 21 { x: 30.1000004; y: 13.3999996; }
        frame 22 { x: 29.5; y: 12.8999996; }
        frame 23 { x: 28.8999996; y: 12.3999996; }
        frame 24 { x: 28.2999992; y: 12.6999998; }
        frame 25 { x: 27.7000008; y: 13; }
        frame 26 { x: 27.1000004; y: 13.1999998; }
        frame 27 { x: 26.7000008; y: 14; }
        frame 28 { x: 26.2999992; y: 14.6999998; }
        frame 29 { x: 25.8999996; y: 15.3999996; }
    }
    Track {
        source-name: "Marigold_mouth";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 33; y: 27.5; skew-x: 5.9000001; skew-y: 5.9000001; scale-x: 0.699999988; scale-y: 0.976999998; cel: 0; image: IMAGE_REANIM_MARIGOLD_MOUTH; }
        frame 6 { x: 33.0999985; y: 27.3999996; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: -10000; scale-y: 0.88499999; cel: -10000; image: none; }
        frame 7 { x: 33.2999992; y: -10000; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 0.791999996; }
        frame 8 { x: 33.5999985; y: 27.2999992; skew-x: 0; skew-y: 0; scale-y: 0.699999988; }
        frame 9 { x: 34.0999985; y: 27.7999992; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.621999979; }
        frame 10 { x: 34.5999985; y: 28.1000004; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.54400003; }
        frame 11 { x: 35.2000008; y: 28.7000008; skew-x: -2.70000005; skew-y: -2.70000005; scale-y: 0.467000008; }
        frame 12 { x: 35.9000015; y: 28.5; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.54400003; }
        frame 13 { x: 36.5; y: 28.1000004; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.621999979; }
        frame 14 { x: 37; y: -10000; skew-x: 0; skew-y: 0; scale-y: 0.699999988; }
        frame 15 { x: 38.4000015; y: 27.8999996; skew-x: 2.5; skew-y: 2.5; scale-y: 0.791999996; }
        frame 16 { x: 39.7000008; y: 27.7999992; skew-x: 5; skew-y: 5; scale-y: 0.88499999; }
        frame 17 { x: 41.0999985; y: 27.6000004; skew-x: 7.69999981; skew-y: 7.69999981; scale-y: 0.976999998; }
        frame 18 { x: 39.5999985; y: 27.7999992; skew-x: 5; skew-y: 5; scale-y: 0.88499999; }
        frame 19 { x: 38.4000015; y: 28; skew-x: 2.5; skew-y: 2.5; scale-y: 0.791999996; }
        frame 20 { x: 37; y: 28.1000004; skew-x: 0; skew-y: 0; scale-y: 0.699999988; }
        frame 21 { x: 36.4000015; y: 28.2000008; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.621999979; }
        frame 22 { x: 35.7999992; y: 28.5; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.54400003; }
        frame 23 { x: 35.2000008; y: 28.7000008; skew-x: -2.70000005; skew-y: -2.70000005; scale-y: 0.467000008; }
        frame 24 { x: 34.7000008; y: 28.2000008; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.54400003; }
        frame 25 { x: 34.2000008; y: 27.6000004; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.621999979; }
        frame 26 { x: 33.5999985; y: 27.2999992; skew-x: 0; skew-y: 0; scale-y: 0.699999988; }
        frame 27 { x: 33.4000015; y: 27.3999996; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 0.791999996; }
        frame 28 { x: 33.0999985; y: 27.5; skew-x: 3.79999995; skew-y: 3.79999995; scale-y: 0.88499999; }
        frame 29 { x: 33; y: -10000; skew-x: 5.9000001; skew-y: 5.9000001; scale-y: 0.976999998; }
    }
    Track {
        source-name: "Marigold_eyebrow1";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 30.1000004; y: 21; scale-x: 0.49000001; scale-y: 0.49000001; cel: 0; image: IMAGE_REANIM_MARIGOLD_EYEBROW1; }
        frame 6 { x: 30.5; y: 20.2999992; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 30.8999996; y: 19.7999992; skew-x: -7.9000001; skew-y: -7.9000001; }
        frame 8 { x: 31.3999996; y: 19.1000004; skew-x: -11.8999996; skew-y: -11.8999996; }
        frame 9 { x: 32; y: 18.6000004; skew-x: -12.6999998; skew-y: -12.6999998; scale-x: 0.488999993; scale-y: 0.488999993; }
        frame 10 { x: 32.5999985; y: 18; skew-x: -13.5; skew-y: -13.5; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 33.2000008; y: 17.3999996; skew-x: -14.3999996; skew-y: -14.3999996; scale-x: 0.49000001; scale-y: 0.49000001; }
        frame 12 { x: 34.2999992; y: 17.8999996; skew-x: -10; skew-y: -10; scale-x: 0.488999993; scale-y: 0.488999993; }
        frame 13 { x: 35.4000015; y: 18.2999992; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 36.5; y: 18.7000008; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.49000001; scale-y: 0.49000001; }
        frame 15 { x: 37.5999985; y: 19.2000008; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 38.7999992; y: 19.7000008; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: 0.488999993; scale-y: 0.488999993; }
        frame 17 { x: 40; y: 20.2000008; skew-x: 11.1999998; skew-y: 11.1999998; scale-x: 0.49000001; scale-y: 0.49000001; }
        frame 18 { x: 38.5999985; y: 20; skew-x: 6.30000019; skew-y: 6.30000019; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 37.0999985; y: 19.7000008; skew-x: 1.5; skew-y: 1.5; }
        frame 20 { x: 35.9000015; y: 19.3999996; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 21 { x: 35; y: 18.7000008; skew-x: -6.9000001; skew-y: -6.9000001; }
        frame 22 { x: 34.2000008; y: 18; skew-x: -10.6999998; skew-y: -10.6999998; scale-x: 0.488999993; scale-y: 0.488999993; }
        frame 23 { x: 33.2000008; y: 17.3999996; skew-x: -14.3999996; skew-y: -14.3999996; scale-x: 0.49000001; scale-y: 0.49000001; }
        frame 24 { x: 32.5; y: 18; skew-x: -13.5; skew-y: -13.5; scale-x: 0.488999993; scale-y: 0.488999993; }
        frame 25 { x: 31.8999996; y: 18.5; skew-x: -12.6999998; skew-y: -12.6999998; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 31.3999996; y: 19.1000004; skew-x: -11.8999996; skew-y: -11.8999996; scale-x: 0.49000001; scale-y: 0.49000001; }
        frame 27 { x: 30.8999996; y: 19.7999992; skew-x: -7.9000001; skew-y: -7.9000001; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 30.6000004; y: 20.3999996; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 29 { x: 30.1000004; y: 21; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Marigold_eyebrow2";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 46.2999992; y: 18.1000004; scale-x: 0.49000001; scale-y: 0.49000001; cel: 0; image: IMAGE_REANIM_MARIGOLD_EYEBROW2; }
        frame 6 { x: 46.5; y: 17.2999992; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 46.9000015; y: 16.5; }
        frame 8 { x: 47.0999985; y: 15.6999998; }
        frame 9 { x: 47.9000015; y: 14.8000002; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 10 { x: 48.7999992; y: 13.8999996; skew-x: 7.5; skew-y: 7.5; scale-x: 0.488999993; scale-y: 0.488999993; }
        frame 11 { x: 49.5999985; y: 13; skew-x: 11.3000002; skew-y: 11.3000002; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 50.2999992; y: 14; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 13 { x: 50.7999992; y: 14.8999996; skew-x: 5.30000019; skew-y: 5.30000019; }
        frame 14 { x: 51.4000015; y: 16; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 15 { x: 51.9000015; y: 17; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: 0.488000005; scale-y: 0.488000005; }
        frame 16 { x: 52.5; y: 18; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 53.2999992; y: 19.1000004; skew-x: -6.5; skew-y: -6.5; }
        frame 18 { x: 52.2999992; y: 18.1000004; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 19 { x: 51.2999992; y: 17.2000008; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.488999993; scale-y: 0.488999993; }
        frame 20 { x: 50.2999992; y: 16.2000008; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 50; y: 15.1999998; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 22 { x: 49.9000015; y: 14.1000004; skew-x: 7; skew-y: 7; }
        frame 23 { x: 49.5999985; y: 13; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 24 { x: 48.7999992; y: 13.8999996; skew-x: 7.5; skew-y: 7.5; }
        frame 25 { x: 48; y: 14.6999998; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: 0.49000001; scale-y: 0.49000001; }
        frame 26 { x: 47.0999985; y: 15.6999998; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 46.9000015; y: 16.5; skew-x: -10000; skew-y: -10000; }
        frame 28 { x: 46.5; y: 17.2999992; }
        frame 29 { x: 46.2999992; y: 18.1000004; }
    }
    Track {
        source-name: "Marigold_blink";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { x: 31.3999996; y: 20.2999992; scale-x: 0.699999988; scale-y: 0.699999988; cel: 0; image: IMAGE_REANIM_MARIGOLD_BLINK1; }
        frame 2 { x: 31.2999992; y: 20.3999996; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_MARIGOLD_BLINK2; }
        frame 3 { x: 31.3999996; y: 20.2999992; image: IMAGE_REANIM_MARIGOLD_BLINK1; }
        frame 4 { x: -10000; y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
}
