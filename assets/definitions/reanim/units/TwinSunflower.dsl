export component TwinSunflower {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { cel: 0; }
        frame 5 { cel: -10000; }
        frame 9 { cel: -1; }
        frame 10 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink2";
        frame-count: 34;
        frame 4 { cel: -1; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { cel: 0; }
        frame 10 { cel: -10000; }
    }
    Track {
        source-name: "backleaf";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 27.7000008; y: 53; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF; }
        frame 10 { x: -10000; y: 53.5; scale-x: 0.56099999; scale-y: 0.528999984; cel: -10000; image: none; }
        frame 11 { y: 54.0999985; scale-x: 0.565999985; scale-y: 0.501999974; }
        frame 12 { x: 27.6000004; y: 54.7000008; scale-x: 0.572000027; scale-y: 0.476000011; }
        frame 13 { x: -10000; y: 55.2999992; scale-x: 0.577000022; scale-y: 0.449000001; }
        frame 14 { y: 55.9000015; scale-x: 0.583000004; scale-y: 0.423000008; }
        frame 15 { y: 55.5; scale-x: 0.588; scale-y: 0.439999998; }
        frame 16 { x: 27.5; y: 55.2999992; scale-x: 0.592000008; scale-y: 0.458000004; }
        frame 17 { x: 27.6000004; y: 55; scale-x: 0.597000003; scale-y: 0.474999994; }
        frame 18 { x: 27.5; y: 54.5; scale-x: 0.601000011; scale-y: 0.493000001; }
        frame 19 { x: -10000; y: 54.2000008; scale-x: 0.606000006; scale-y: 0.50999999; }
        frame 20 { y: 53.9000015; scale-x: 0.610000014; scale-y: 0.527999997; }
        frame 21 { y: 54.0999985; scale-x: 0.606999993; scale-y: 0.513000011; }
        frame 22 { y: 54.5; scale-x: 0.602999985; scale-y: 0.497999996; }
        frame 23 { y: 54.7999992; scale-x: 0.598999977; scale-y: 0.48300001; }
        frame 24 { x: 27.6000004; y: 55; scale-x: 0.595000029; scale-y: 0.467999995; }
        frame 25 { x: -10000; y: 55.2999992; scale-x: 0.591000021; scale-y: 0.453000009; }
        frame 26 { y: 55.5; scale-x: 0.587000012; scale-y: 0.437999994; }
        frame 27 { y: 55.9000015; scale-x: 0.583000004; scale-y: 0.423000008; }
        frame 28 { x: 27.7000008; y: 55.4000015; scale-x: 0.578000009; scale-y: 0.444999993; }
        frame 29 { x: -10000; y: 54.9000015; scale-x: 0.574000001; scale-y: 0.467000008; }
        frame 30 { x: 27.6000004; y: 54.5; scale-x: 0.569000006; scale-y: 0.488999993; }
        frame 31 { x: 27.7000008; y: 53.9000015; scale-x: 0.564999998; scale-y: 0.510999978; }
        frame 32 { x: -10000; y: 53.5; scale-x: 0.560000002; scale-y: 0.532999992; }
        frame 33 { y: 53; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "backleaf_left_tip";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 25; y: 53.9000015; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF_LEFTTIP; }
        frame 10 { x: -10000; y: 54.4000015; skew-x: 0.300000012; skew-y: 0.5; scale-x: 0.564999998; scale-y: 0.532999992; cel: -10000; image: none; }
        frame 11 { x: 24.8999996; y: 54.7999992; skew-x: 0.800000012; skew-y: 1.29999995; scale-x: 0.574999988; scale-y: 0.50999999; }
        frame 12 { x: -10000; y: 55.2999992; skew-x: 1.29999995; skew-y: 1.79999995; scale-x: 0.583999991; scale-y: 0.488000005; }
        frame 13 { y: 55.7999992; skew-x: 1.79999995; skew-y: 2.5; scale-x: 0.593999982; scale-y: 0.465000004; }
        frame 14 { x: 25; y: 56.0999985; skew-x: 2.4000001; skew-y: 3.20000005; scale-x: 0.603999972; scale-y: 0.442999989; }
        frame 15 { x: 24.7999992; y: 56; skew-x: 0.100000001; skew-y: 1.29999995; scale-x: 0.614000022; scale-y: 0.474000007; }
        frame 16 { x: 24.6000004; y: -10000; skew-x: -1.70000005; skew-y: -0; scale-x: 0.625; scale-y: 0.504999995; }
        frame 17 { x: 24.5; y: 56; skew-x: -3.9000001; skew-y: -1.70000005; scale-x: 0.635999978; scale-y: 0.537; }
        frame 18 { x: 24.2000008; y: 55.9000015; skew-x: -6; skew-y: -3.4000001; scale-x: 0.647000015; scale-y: 0.568000019; }
        frame 19 { x: 24; y: -10000; skew-x: -8.19999981; skew-y: -5.19999981; scale-x: 0.657000005; scale-y: 0.598999977; }
        frame 20 { x: 23.8999996; skew-x: -10.3999996; skew-y: -6.9000001; scale-x: 0.667999983; scale-y: 0.629999995; }
        frame 21 { x: 24; skew-x: -8.39999962; skew-y: -5.4000001; scale-x: 0.658999979; scale-y: 0.602999985; }
        frame 22 { x: 24.2000008; y: 56; skew-x: -6.69999981; skew-y: -3.9000001; scale-x: 0.649999976; scale-y: 0.577000022; }
        frame 23 { x: 24.2999992; y: -10000; skew-x: -4.69999981; skew-y: -2.4000001; scale-x: 0.639999986; scale-y: 0.550000012; }
        frame 24 { x: 24.6000004; y: 56; skew-x: -2.9000001; skew-y: -0.899999976; scale-x: 0.630999982; scale-y: 0.523000002; }
        frame 25 { x: 24.7000008; y: -10000; skew-x: -1.20000005; skew-y: 0.300000012; scale-x: 0.621999979; scale-y: 0.495999992; }
        frame 26 { x: 24.7999992; y: 56.0999985; skew-x: 0.5; skew-y: 1.60000002; scale-x: 0.612999976; scale-y: 0.469000012; }
        frame 27 { x: 25; y: 56; skew-x: 2.4000001; skew-y: 3.20000005; scale-x: 0.603999972; scale-y: 0.442999989; }
        frame 28 { x: -10000; y: 55.5999985; skew-x: 1.79999995; skew-y: 2.5; scale-x: 0.596000016; scale-y: 0.460999995; }
        frame 29 { x: 25.1000004; y: 55.4000015; skew-x: 1.5; skew-y: 2; scale-x: 0.588; scale-y: 0.479999989; }
        frame 30 { x: 25; y: 55; skew-x: 1; skew-y: 1.5; scale-x: 0.579999983; scale-y: 0.499000013; }
        frame 31 { x: 25.1000004; y: 54.5; skew-x: 0.800000012; skew-y: 1; scale-x: 0.57099998; scale-y: 0.518000007; }
        frame 32 { x: 25; y: 54.0999985; skew-x: 0.300000012; skew-y: 0.5; scale-x: 0.563000023; scale-y: 0.537; }
        frame 33 { y: 53.9000015; skew-x: 0; skew-y: 0; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "backleaf_right_tip";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 47; y: 52.9000015; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF_RIGHTTIP; }
        frame 10 { x: 47.2000008; y: 53.4000015; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.578000009; scale-y: 0.532999992; cel: -10000; image: none; }
        frame 11 { x: 47.2999992; y: 54; skew-x: 0.5; skew-y: 0.600000024; scale-x: 0.600000024; scale-y: 0.50999999; }
        frame 12 { x: 47.5; y: 54.5; skew-x: 0.800000012; skew-y: 1; scale-x: 0.621999979; scale-y: 0.488000005; }
        frame 13 { x: -10000; y: 55; skew-x: 1; skew-y: 1.29999995; scale-x: 0.644999981; scale-y: 0.465000004; }
        frame 14 { x: 47.7000008; y: 55.5999985; skew-x: 1.29999995; skew-y: 1.79999995; scale-x: 0.666999996; scale-y: 0.442000002; }
        frame 15 { x: 47.7999992; y: 55.2999992; skew-x: 2.79999995; skew-y: 2.5; scale-x: 0.662; scale-y: 0.465999991; }
        frame 16 { x: 48; y: 55; skew-x: 4.30000019; skew-y: 3.5; scale-x: 0.657000005; scale-y: 0.488999993; }
        frame 17 { x: 48.2999992; y: 54.5999985; skew-x: 6; skew-y: 4.30000019; scale-x: 0.65200001; scale-y: 0.513000011; }
        frame 18 { x: 48.4000015; y: 54.2999992; skew-x: 7.5; skew-y: 5.30000019; scale-x: 0.646000028; scale-y: 0.536000013; }
        frame 19 { x: 48.5; y: 53.9000015; skew-x: 9; skew-y: 6.30000019; scale-x: 0.640999973; scale-y: 0.560000002; }
        frame 20 { x: 48.7999992; y: 53.5999985; skew-x: 10.8000002; skew-y: 7.19999981; scale-x: 0.635999978; scale-y: 0.583999991; }
        frame 21 { x: 48.5; y: 53.9000015; skew-x: 9.30000019; skew-y: 6.30000019; scale-x: 0.639999986; scale-y: 0.563000023; }
        frame 22 { x: 48.4000015; y: 54.0999985; skew-x: 8; skew-y: 5.5; scale-x: 0.644999981; scale-y: 0.542999983; }
        frame 23 { x: 48.2000008; y: 54.5; skew-x: 6.5999999; skew-y: 4.80000019; scale-x: 0.648999989; scale-y: 0.523000002; }
        frame 24 { x: 48; y: 54.7999992; skew-x: 5.30000019; skew-y: 4; scale-x: 0.653999984; scale-y: 0.503000021; }
        frame 25 { x: 47.9000015; y: 55; skew-x: 4; skew-y: 3.29999995; scale-x: 0.657999992; scale-y: 0.48300001; }
        frame 26 { x: 47.7999992; y: 55.5; skew-x: 2.5; skew-y: 2.5; scale-x: 0.662999988; scale-y: 0.463; }
        frame 27 { x: 47.7000008; y: 55.5999985; skew-x: 1.29999995; skew-y: 1.79999995; scale-x: 0.666999996; scale-y: 0.442000002; }
        frame 28 { x: 47.5999985; y: 55.2000008; skew-x: 1; skew-y: 1.29999995; scale-x: 0.648999989; scale-y: 0.460999995; }
        frame 29 { x: 47.5; y: 54.5999985; skew-x: 0.800000012; skew-y: 1; scale-x: 0.629999995; scale-y: 0.479999989; }
        frame 30 { x: -10000; y: 54.2000008; skew-x: 0.5; skew-y: 0.800000012; scale-x: 0.611000001; scale-y: 0.499000013; }
        frame 31 { x: 47.4000015; y: 53.7999992; skew-x: 0.300000012; skew-y: 0.5; scale-x: 0.592999995; scale-y: 0.518000007; }
        frame 32 { x: 47.2999992; y: 53.2999992; skew-x: 0.100000001; skew-y: 0.300000012; scale-x: 0.574000001; scale-y: 0.537; }
        frame 33 { x: 47.0999985; y: 52.9000015; skew-x: 0; skew-y: 0; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "TwinSunflower_stem2";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 16.7999992; y: 38.4000015; skew-y: -9.19999981; scale-x: 0.800000012; scale-y: 0.912; cel: 0; image: IMAGE_REANIM_TWINSUNFLOWER_STEM1; }
        frame 10 { x: 18.1000004; y: 37.7999992; skew-y: -6.9000001; scale-x: 0.790000021; scale-y: 0.926999986; cel: -10000; image: none; }
        frame 11 { x: 19.5; y: 37.0999985; skew-y: -4.69999981; scale-x: 0.779999971; scale-y: 0.943000019; }
        frame 12 { x: 20.7999992; y: 36.5; skew-y: -2.4000001; scale-x: 0.769999981; scale-y: 0.958999991; }
        frame 13 { x: 22.1000004; y: 35.7999992; skew-y: -0.200000003; scale-x: 0.759000003; scale-y: 0.973999977; }
        frame 14 { x: 23.3999996; y: 35.0999985; skew-y: 1.60000002; scale-x: 0.749000013; scale-y: 0.99000001; }
        frame 15 { x: 24.7000008; y: 34.7000008; skew-y: 3.9000001; scale-x: 0.739000022; scale-y: 1.005; }
        frame 16 { x: 25.3999996; y: 34.9000015; skew-x: 2.5; skew-y: 5.80000019; scale-x: 0.749000013; scale-y: 0.986999989; }
        frame 17 { x: 26.2000008; y: 35.0999985; skew-x: 5.30000019; skew-y: 8; scale-x: 0.759000003; scale-y: 0.970000029; }
        frame 18 { x: 27; y: 35.4000015; skew-x: 7.80000019; skew-y: 10; scale-x: 0.768999994; scale-y: 0.952000022; }
        frame 19 { x: 27.7999992; y: 35.5999985; skew-x: 10.5; skew-y: 12.1000004; scale-x: 0.778999984; scale-y: 0.934000015; }
        frame 20 { x: 28.6000004; y: 35.9000015; skew-x: 13.1000004; skew-y: 14.3000002; scale-x: 0.788999975; scale-y: 0.916000009; }
        frame 21 { x: 29.3999996; y: 36; skew-x: 15.8000002; skew-y: 16.3999996; scale-x: 0.799000025; scale-y: 0.899999976; }
        frame 22 { x: 28.6000004; y: 35.7999992; skew-x: 13.1000004; skew-y: 14.3000002; scale-x: 0.788999975; scale-y: 0.916000009; }
        frame 23 { x: 27.8999996; y: 35.5; skew-x: 10.5; skew-y: 12.1000004; scale-x: 0.778999984; scale-y: 0.934000015; }
        frame 24 { x: 27; y: 35.4000015; skew-x: 7.80000019; skew-y: 10; scale-x: 0.768999994; scale-y: 0.952000022; }
        frame 25 { x: 26.2999992; y: 35.0999985; skew-x: 5.30000019; skew-y: 8; scale-x: 0.759000003; scale-y: 0.970000029; }
        frame 26 { x: 25.3999996; y: 34.7999992; skew-x: 2.5; skew-y: 5.80000019; scale-x: 0.749000013; scale-y: 0.986999989; }
        frame 27 { x: 24.7000008; y: 34.7000008; skew-x: 0; skew-y: 3.9000001; scale-x: 0.739000022; scale-y: 1.005; }
        frame 28 { x: 23.2000008; y: 35.2999992; skew-x: -10000; skew-y: 1.5; scale-x: 0.749000013; scale-y: 0.99000001; }
        frame 29 { x: 22; y: 35.9000015; skew-y: -0.400000006; scale-x: 0.759000003; scale-y: 0.973999977; }
        frame 30 { x: 20.7000008; y: 36.5; skew-y: -2.4000001; scale-x: 0.769999981; scale-y: 0.958999991; }
        frame 31 { x: 19.3999996; y: 37.2000008; skew-y: -4.69999981; scale-x: 0.779999971; scale-y: 0.943000019; }
        frame 32 { x: 18.1000004; y: 37.7999992; skew-y: -6.9000001; scale-x: 0.790000021; scale-y: 0.926999986; }
        frame 33 { x: 16.7999992; y: 38.4000015; skew-y: -9.19999981; scale-x: 0.800000012; scale-y: 0.912; }
    }
    Track {
        source-name: "TwinSunflower_leaf1";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 23.7999992; y: 46.9000015; skew-x: 151.899994; skew-y: -28; scale-x: 0.592000008; scale-y: 0.592000008; cel: 0; image: IMAGE_REANIM_TWINSUNFLOWER_LEAF; }
        frame 10 { x: 24.5; y: 46.4000015; skew-x: 147.899994; skew-y: -27; scale-x: 0.596000016; scale-y: 0.587000012; cel: -10000; image: none; }
        frame 11 { x: 25.1000004; y: 45.7999992; skew-x: 144.100006; skew-y: -26; scale-x: 0.601000011; scale-y: 0.583000004; }
        frame 12 { x: 25.7000008; y: 45.2999992; skew-x: 140.199997; skew-y: -25; scale-x: 0.606999993; scale-y: 0.578999996; }
        frame 13 { x: 26.5; y: 45; skew-x: 142.199997; skew-y: -24; scale-x: 0.601000011; scale-y: 0.574999988; }
        frame 14 { x: 27.3999996; y: 44.7000008; skew-x: 144.199997; skew-y: -23; scale-x: 0.595000029; scale-y: 0.57099998; }
        frame 15 { x: 28; y: 44.5; skew-x: 146.199997; skew-y: -22; scale-x: 0.591000021; scale-y: 0.568000019; }
        frame 16 { x: 28.8999996; y: 44.7000008; skew-x: 154.699997; skew-y: -18.7000008; scale-x: 0.588999987; scale-y: 0.57099998; }
        frame 17 { x: 29.7000008; y: 44.9000015; skew-x: 163.199997; skew-y: -15.5; scale-x: -10000; scale-y: 0.574999988; }
        frame 18 { x: 30.2999992; y: 45.0999985; skew-x: 171.699997; skew-y: -12.5; scale-y: 0.578999996; }
        frame 19 { x: 30.8999996; y: 45.5; skew-x: 173.5; skew-y: -9.19999981; scale-x: 0.589999974; scale-y: 0.583000004; }
        frame 20 { x: 31.6000004; y: 45.9000015; skew-x: 175.199997; skew-y: -6.19999981; scale-x: -10000; scale-y: 0.587000012; }
        frame 21 { x: 32.2999992; y: 46; skew-x: 176.699997; skew-y: -3.20000005; scale-x: 0.591000021; scale-y: 0.591000021; }
        frame 22 { x: 31.7000008; y: 45.7999992; skew-x: 169.699997; skew-y: -6.19999981; scale-x: 0.593999982; scale-y: 0.587000012; }
        frame 23 { x: 31.2000008; y: 45.4000015; skew-x: 162.699997; skew-y: -9.19999981; scale-x: 0.597000003; scale-y: 0.583000004; }
        frame 24 { x: 30.5; y: 45.2000008; skew-x: 155.600006; skew-y: -12.5; scale-x: 0.600000024; scale-y: 0.578999996; }
        frame 25 { x: 29.7000008; y: 44.9000015; skew-x: 152.5; skew-y: -15.5; scale-x: 0.596000016; scale-y: 0.574999988; }
        frame 26 { x: 29; y: 44.7999992; skew-x: 149.399994; skew-y: -18.7000008; scale-x: 0.592999995; scale-y: 0.57099998; }
        frame 27 { x: 28; y: 44.5; skew-x: 146.199997; skew-y: -22; scale-x: 0.591000021; scale-y: 0.568000019; }
        frame 28 { x: 27.3999996; y: 44.9000015; skew-x: 150.699997; skew-y: -23; scale-x: 0.588999987; scale-y: 0.57099998; }
        frame 29 { x: 26.6000004; y: 45.4000015; skew-x: 155.399994; skew-y: -24; scale-x: -10000; scale-y: 0.574999988; }
        frame 30 { x: 25.8999996; y: 45.7999992; skew-x: 159.899994; skew-y: -25; scale-x: 0.589999974; scale-y: 0.578999996; }
        frame 31 { x: 25.1000004; y: 46.2000008; skew-x: 157.199997; skew-y: -26; scale-x: -10000; scale-y: 0.583000004; }
        frame 32 { x: 24.5; y: 46.5999985; skew-x: 154.699997; skew-y: -27; scale-x: 0.591000021; scale-y: 0.587000012; }
        frame 33 { x: 23.7999992; y: 46.9000015; skew-x: 151.899994; skew-y: -28; scale-x: 0.592000008; scale-y: 0.592000008; }
    }
    Track {
        source-name: "TwinSunflower_stem1";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 42.2999992; y: 21.2000008; skew-y: 1.89999998; scale-x: 0.800000012; scale-y: 0.867999971; cel: 0; image: IMAGE_REANIM_TWINSUNFLOWER_STEM2; }
        frame 10 { x: 41.2999992; y: 21; skew-y: 0.5; scale-x: -10000; scale-y: 0.871999979; cel: -10000; image: none; }
        frame 11 { x: 40.5; y: 20.7999992; skew-y: -0.400000006; scale-y: 0.875999987; }
        frame 12 { x: 39.5; y: 20.7000008; skew-y: -1.60000002; scale-y: 0.879999995; }
        frame 13 { x: 38.7999992; y: 20.3999996; skew-y: -2.70000005; scale-y: 0.887000024; }
        frame 14 { x: 37.9000015; y: 20; skew-y: -3.70000005; scale-y: 0.894999981; }
        frame 15 { x: 37; y: 19.6000004; skew-y: -4.9000001; scale-y: 0.902999997; }
        frame 16 { x: 35.5999985; y: 20; skew-y: -6.69999981; scale-y: 0.898999989; }
        frame 17 { x: 34.4000015; y: 20.5; skew-y: -8.39999962; scale-y: 0.894999981; }
        frame 18 { x: 33; y: 20.7999992; skew-y: -10.1999998; scale-y: 0.89200002; }
        frame 19 { x: 31.6000004; y: 21.7000008; skew-y: -12.1999998; scale-y: 0.879999995; }
        frame 20 { x: 30.2999992; y: 22.5; skew-y: -14.1999998; scale-y: 0.867999971; }
        frame 21 { x: 28.8999996; y: 23.3999996; skew-y: -16.2999992; scale-y: 0.856999993; }
        frame 22 { x: 30; y: 23; skew-y: -14.6999998; scale-y: 0.861000001; }
        frame 23 { x: 31; y: 22.5; skew-y: -13.1999998; scale-y: 0.86500001; }
        frame 24 { x: 32; y: 22; skew-y: -11.8999996; scale-y: 0.870999992; }
        frame 25 { x: 33.5; y: 21.2999992; skew-y: -9.69999981; scale-y: 0.880999982; }
        frame 26 { x: 35.0999985; y: 20.3999996; skew-y: -7.5; scale-y: 0.89200002; }
        frame 27 { x: 36.5999985; y: 19.6000004; skew-y: -5.4000001; scale-y: 0.902999997; }
        frame 28 { x: 37.4000015; y: 20; skew-y: -4.5; scale-y: 0.897000015; }
        frame 29 { x: 38.0999985; y: 20.1000004; skew-y: -3.70000005; scale-y: 0.890999973; }
        frame 30 { x: 38.9000015; y: 20.3999996; skew-y: -3.0999999; scale-y: 0.885999978; }
        frame 31 { x: 40.0999985; y: 20.6000004; skew-y: -1.20000005; scale-y: 0.879999995; }
        frame 32 { x: 41.0999985; y: 20.8999996; skew-y: 0; scale-y: 0.874000013; }
        frame 33 { x: 42.2999992; y: 21.2000008; skew-y: 1.89999998; scale-y: 0.867999971; }
    }
    Track {
        source-name: "TwinSunflower_leaf1";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 55.2000008; y: 33.0999985; skew-x: 17.6000004; skew-y: 17.6000004; scale-x: 0.799000025; scale-y: 0.799000025; cel: 0; image: IMAGE_REANIM_TWINSUNFLOWER_LEAF; }
        frame 10 { x: 54.4000015; y: 33; skew-x: 19.7999992; skew-y: 16.2999992; scale-x: 0.808000028; scale-y: 0.796999991; cel: -10000; image: none; }
        frame 11 { x: 53.9000015; y: 32.9000015; skew-x: 22.1000004; skew-y: 15.3000002; scale-x: 0.816999972; scale-y: 0.796000004; }
        frame 12 { x: 53.2999992; y: 32.7999992; skew-x: 24.6000004; skew-y: 14.1000004; scale-x: 0.827000022; scale-y: 0.795000017; }
        frame 13 { x: 52.5999985; y: 32.5; skew-x: 23.1000004; skew-y: 12.8000002; scale-x: 0.828999996; scale-y: 0.796999991; }
        frame 14 { x: 52; y: 32.2000008; skew-x: 21.7999992; skew-y: 11.8000002; scale-x: 0.832000017; scale-y: 0.800000012; }
        frame 15 { x: 51.4000015; y: 32; skew-x: 20.3999996; skew-y: 10.6000004; scale-x: 0.836000025; scale-y: 0.802999973; }
        frame 16 { x: 50.2999992; y: 32.2000008; skew-x: 15.8000002; skew-y: 8.80000019; scale-x: 0.833999991; scale-y: 0.792999983; }
        frame 17 { x: 49.2999992; y: 32.5; skew-x: 11.3000002; skew-y: 7.0999999; scale-x: 0.832000017; scale-y: 0.782999992; }
        frame 18 { x: 48.4000015; y: 32.9000015; skew-x: 6.69999981; skew-y: 5.5; scale-x: 0.829999983; scale-y: 0.773999989; }
        frame 19 { x: 47.4000015; y: 33.5; skew-x: 7.0999999; skew-y: 3.79999995; scale-x: 0.834999979; scale-y: 0.755999982; }
        frame 20 { x: 46.5; y: 34.0999985; skew-x: 7.5999999; skew-y: 2; scale-x: 0.839999974; scale-y: 0.739000022; }
        frame 21 { x: 45.5; y: 34.7000008; skew-x: 8.19999981; skew-y: 0.400000006; scale-x: 0.846000016; scale-y: 0.721000016; }
        frame 22 { x: 46.2999992; y: 34.4000015; skew-x: 11.1000004; skew-y: 1.5; scale-x: 0.84799999; scale-y: 0.731000006; }
        frame 23 { x: 47; y: 34.0999985; skew-x: 14.1000004; skew-y: 2.79999995; scale-x: 0.850000024; scale-y: 0.74000001; }
        frame 24 { x: 47.7000008; y: 33.5999985; skew-x: 17.2999992; skew-y: 4.30000019; scale-x: 0.852999985; scale-y: 0.75; }
        frame 25 { x: 48.7999992; y: 33; skew-x: 18.2999992; skew-y: 6.0999999; scale-x: 0.84799999; scale-y: 0.76700002; }
        frame 26 { x: 50; y: 32.4000015; skew-x: 19.2999992; skew-y: 8; scale-x: 0.842999995; scale-y: 0.783999979; }
        frame 27 { x: 51; y: 32; skew-x: 20.2999992; skew-y: 10.1000004; scale-x: 0.838999987; scale-y: 0.801999986; }
        frame 28 { x: 51.7000008; y: 32.2000008; skew-x: 15.8000002; skew-y: 9.30000019; scale-x: 0.833999991; scale-y: 0.792999983; }
        frame 29 { x: 52.5; y: 32.5; skew-x: 11.3000002; skew-y: 8.80000019; scale-x: 0.828999996; scale-y: 0.786000013; }
        frame 30 { x: 53.0999985; y: 32.9000015; skew-x: 6.80000019; skew-y: 8.30000019; scale-x: 0.824999988; scale-y: 0.777999997; }
        frame 31 { x: 53.7000008; y: 33; skew-x: 10.3000002; skew-y: 11.3000002; scale-x: 0.815999985; scale-y: 0.785000026; }
        frame 32 { x: 54.2999992; y: 33.0999985; skew-x: 13.8000002; skew-y: 14.3000002; scale-x: 0.806999981; scale-y: 0.791999996; }
        frame 33 { x: 55.2000008; y: -10000; skew-x: 17.6000004; skew-y: 17.6000004; scale-x: 0.799000025; scale-y: 0.799000025; }
    }
    Track {
        source-name: "TwinSunflower_leaf1";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 51.2000008; y: 40.9000015; skew-x: -164.199997; skew-y: 15.6999998; scale-x: 0.593999982; scale-y: 0.593999982; cel: 0; image: IMAGE_REANIM_TWINSUNFLOWER_LEAF; }
        frame 10 { x: 50.7999992; y: 40.7000008; skew-x: -167.100006; skew-y: 14.5; scale-x: 0.596000016; scale-y: 0.592000008; cel: -10000; image: none; }
        frame 11 { x: 50.4000015; y: 40.5999985; skew-x: -169.899994; skew-y: 13.3000002; scale-x: 0.600000024; scale-y: -10000; }
        frame 12 { x: 49.7999992; y: -10000; skew-x: -172.600006; skew-y: 12.1000004; scale-x: 0.603999972; }
        frame 13 { x: 49.4000015; y: 40.5; skew-x: -172.100006; skew-y: 10.8000002; scale-x: 0.605000019; scale-y: 0.593999982; }
        frame 14 { x: 48.7999992; y: 40.2999992; skew-x: -171.300003; skew-y: 9.80000019; scale-x: 0.606999993; scale-y: 0.596000016; }
        frame 15 { x: 48.4000015; y: 40.0999985; skew-x: -170.5; skew-y: 8.69999981; scale-x: 0.610000014; scale-y: 0.598999977; }
        frame 16 { x: 47.5999985; y: 40.2999992; skew-x: -166.600006; skew-y: 6.80000019; scale-x: 0.623000026; scale-y: 0.592000008; }
        frame 17 { x: 47; y: 40.5; skew-x: -162.800003; skew-y: 5.0999999; scale-x: 0.637000024; scale-y: 0.584999979; }
        frame 18 { x: 46.2000008; y: 40.5999985; skew-x: -158.899994; skew-y: 3.5; scale-x: 0.651000023; scale-y: 0.578999996; }
        frame 19 { x: 45.5; y: 41.0999985; skew-x: -160.100006; skew-y: 1.60000002; scale-x: 0.65200001; scale-y: 0.565999985; }
        frame 20 { x: 44.5999985; y: 41.7000008; skew-x: -161.100006; skew-y: 0; scale-x: -10000; scale-y: 0.55400002; }
        frame 21 { x: 44; y: 42.2000008; skew-x: -162.100006; skew-y: -1.60000002; scale-x: 0.653999984; scale-y: 0.541000009; }
        frame 22 { x: 44.5; y: 41.9000015; skew-x: -165.600006; skew-y: -0.200000003; scale-x: 0.643999994; scale-y: 0.547999978; }
        frame 23 { x: 45.0999985; y: 41.5999985; skew-x: -168.899994; skew-y: 0.800000012; scale-x: 0.634000003; scale-y: 0.55400002; }
        frame 24 { x: 45.5999985; y: 41.5; skew-x: -172.199997; skew-y: 2.29999995; scale-x: 0.625; scale-y: 0.56099999; }
        frame 25 { x: 46.5; y: 41; skew-x: -171.600006; skew-y: 4.0999999; scale-x: 0.620000005; scale-y: 0.573000014; }
        frame 26 { x: 47.4000015; y: 40.5; skew-x: -171.100006; skew-y: 6.0999999; scale-x: 0.61500001; scale-y: 0.584999979; }
        frame 27 { x: 48.0999985; y: 40.0999985; skew-x: -170.5; skew-y: 8.19999981; scale-x: 0.610000014; scale-y: 0.59799999; }
        frame 28 { x: 48.5999985; y: 40.4000015; skew-x: -164.600006; skew-y: 9.30000019; scale-x: 0.620000005; scale-y: 0.592000008; }
        frame 29 { x: 49.0999985; y: 40.5999985; skew-x: -158.899994; skew-y: 10.5; scale-x: 0.629999995; scale-y: 0.586000025; }
        frame 30 { x: 49.4000015; y: 40.9000015; skew-x: -153; skew-y: 11.8000002; scale-x: 0.640999973; scale-y: 0.58099997; }
        frame 31 { x: 50; y: -10000; skew-x: -156.800003; skew-y: 13; scale-x: 0.624000013; scale-y: 0.584999979; }
        frame 32 { x: 50.5; skew-x: -160.600006; skew-y: 14.3000002; scale-x: 0.609000027; scale-y: 0.588999987; }
        frame 33 { x: 51.2000008; skew-x: -164.199997; skew-y: 15.6999998; scale-x: 0.593999982; scale-y: 0.593999982; }
    }
    Track {
        source-name: "frontleaf";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 22.7999992; y: 54.4000015; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF; }
        frame 10 { x: -10000; y: 54; scale-x: 0.558000028; scale-y: 0.569000006; cel: -10000; image: none; }
        frame 11 { x: 22.6000004; y: 53.5999985; scale-x: 0.561999977; scale-y: 0.582000017; }
        frame 12 { x: -10000; y: 53.2000008; scale-x: 0.564999998; scale-y: 0.596000016; }
        frame 13 { x: 22.5; y: 52.9000015; scale-x: 0.568000019; scale-y: 0.609000027; }
        frame 14 { x: 22.3999996; y: 52.5; scale-x: 0.57099998; scale-y: 0.623000026; }
        frame 15 { x: 22.2999992; y: 52; scale-x: 0.574000001; scale-y: 0.635999978; }
        frame 16 { x: 22.2000008; y: 52.7000008; scale-x: 0.578000009; scale-y: 0.611000001; }
        frame 17 { x: 22.1000004; y: 53.5; scale-x: 0.582000017; scale-y: 0.587000012; }
        frame 18 { x: 22; y: 54.2000008; scale-x: 0.587000012; scale-y: 0.561999977; }
        frame 19 { x: 21.8999996; y: 55; scale-x: 0.591000021; scale-y: 0.537; }
        frame 20 { x: 21.7999992; y: 55.7000008; scale-x: 0.595000029; scale-y: 0.512000024; }
        frame 21 { x: 21.7000008; y: 56.5; scale-x: 0.600000024; scale-y: 0.486999989; }
        frame 22 { x: 21.7999992; y: 55.7999992; scale-x: 0.595000029; scale-y: 0.512000024; }
        frame 23 { x: 21.8999996; y: 55; scale-x: 0.591000021; scale-y: 0.537; }
        frame 24 { x: 22; y: 54.2999992; scale-x: 0.587000012; scale-y: 0.561999977; }
        frame 25 { x: 22.1000004; y: 53.5; scale-x: 0.582000017; scale-y: 0.587000012; }
        frame 26 { x: 22.2999992; y: 52.7999992; scale-x: 0.578000009; scale-y: 0.611000001; }
        frame 27 { x: -10000; y: 52; scale-x: 0.574000001; scale-y: 0.635999978; }
        frame 28 { x: 22.3999996; y: 52.4000015; scale-x: 0.57099998; scale-y: 0.623000026; }
        frame 29 { x: 22.5; y: 52.7999992; scale-x: 0.568000019; scale-y: 0.609000027; }
        frame 30 { x: 22.6000004; y: 53.2000008; scale-x: 0.564999998; scale-y: 0.596000016; }
        frame 31 { x: -10000; y: 53.5999985; scale-x: 0.561999977; scale-y: 0.582000017; }
        frame 32 { x: 22.7000008; y: 54; scale-x: 0.558000028; scale-y: 0.569000006; }
        frame 33 { x: 22.7999992; y: 54.4000015; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "frontleaf_right_tip";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 56.2999992; y: 56; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_RIGHTTIP; }
        frame 10 { x: 56.0999985; y: 55.5999985; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.583999991; scale-y: 0.57099998; cel: -10000; image: none; }
        frame 11 { x: 56; y: 55.2000008; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.612999976; scale-y: 0.587000012; }
        frame 12 { x: 55.7999992; y: 55; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.64200002; scale-y: 0.602999985; }
        frame 13 { x: 55.5999985; y: 54.5999985; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.671000004; scale-y: 0.619000018; }
        frame 14 { x: 55.4000015; y: 54.2000008; skew-x: -7.5; skew-y: -7.5; scale-x: 0.699999988; scale-y: 0.634000003; }
        frame 15 { x: 55.0999985; y: 54; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: 0.728999972; scale-y: 0.651000023; }
        frame 16 { x: 55.5999985; y: 54.5; skew-x: -7.5; skew-y: -7.5; scale-x: 0.707000017; scale-y: 0.630999982; }
        frame 17 { x: 56.0999985; y: 55; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.68599999; scale-y: 0.611999989; }
        frame 18 { x: 56.5; y: 55.5; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.663999975; scale-y: 0.592999995; }
        frame 19 { x: 56.9000015; y: 56.0999985; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.643000007; scale-y: 0.574000001; }
        frame 20 { x: 57.4000015; y: 56.5999985; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.620999992; scale-y: 0.555000007; }
        frame 21 { x: 57.9000015; y: 57.0999985; skew-x: 0; skew-y: 0; scale-x: 0.600000024; scale-y: 0.535000026; }
        frame 22 { x: 57.5; y: 56.5999985; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.620999992; scale-y: 0.555000007; }
        frame 23 { x: 57; y: 56; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.643000007; scale-y: 0.574000001; }
        frame 24 { x: 56.5999985; y: 55.5; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.663999975; scale-y: 0.592999995; }
        frame 25 { x: 56.0999985; y: 55; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.68599999; scale-y: 0.611999989; }
        frame 26 { x: 55.5999985; y: 54.5; skew-x: -7.5; skew-y: -7.5; scale-x: 0.707000017; scale-y: 0.630999982; }
        frame 27 { x: 55.0999985; y: 54; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: 0.728999972; scale-y: 0.651000023; }
        frame 28 { x: 55.4000015; y: 54.2000008; skew-x: -7.5; skew-y: -7.5; scale-x: 0.699999988; scale-y: 0.634000003; }
        frame 29 { x: 55.5; y: 54.5999985; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.671000004; scale-y: 0.619000018; }
        frame 30 { x: 55.7999992; y: 54.9000015; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.64200002; scale-y: 0.602999985; }
        frame 31 { x: 55.9000015; y: 55.2999992; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.612999976; scale-y: 0.587000012; }
        frame 32 { x: 56; y: 55.5999985; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.583999991; scale-y: 0.57099998; }
        frame 33 { x: 56.2999992; y: 56; skew-x: 0; skew-y: 0; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "frontleaf_left_tip";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 19.3999996; y: 61.5999985; scale-x: 0.555000007; scale-y: 0.555000007; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_LEFTTIP; }
        frame 10 { x: -10000; y: 61.0999985; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.573000014; scale-y: 0.57099998; cel: -10000; image: none; }
        frame 11 { y: 60.5999985; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.591000021; scale-y: 0.587000012; }
        frame 12 { x: 19.5; y: 60.2999992; skew-x: 4; skew-y: 4; scale-x: 0.609000027; scale-y: 0.602999985; }
        frame 13 { x: -10000; y: 59.7999992; skew-x: 5.5; skew-y: 5.5; scale-x: 0.625999987; scale-y: 0.617999971; }
        frame 14 { x: 19.6000004; y: 59.2999992; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: 0.643999994; scale-y: 0.634000003; }
        frame 15 { x: 19.5; y: 58.5; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.662; scale-y: 0.649999976; }
        frame 16 { x: 19.1000004; y: 59.2000008; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 0.648000002; scale-y: 0.638999999; }
        frame 17 { x: 18.8999996; y: 59.9000015; skew-x: 3.5; skew-y: 3.5; scale-x: 0.63499999; scale-y: 0.626999974; }
        frame 18 { x: 18.7000008; y: 60.5; skew-x: 1.29999995; skew-y: 1; scale-x: 0.620999992; scale-y: 0.615999997; }
        frame 19 { x: 18.5; y: 61.0999985; skew-x: -0.899999976; skew-y: -1.20000005; scale-x: 0.606999993; scale-y: 0.603999972; }
        frame 20 { x: 18.2999992; y: 61.7999992; skew-x: -3.20000005; skew-y: -3.4000001; scale-x: 0.592999995; scale-y: 0.592999995; }
        frame 21 { x: 18.2000008; y: 62.5; skew-x: -5.69999981; skew-y: -5.9000001; scale-x: 0.579999983; scale-y: 0.582000017; }
        frame 22 { x: 18.2999992; y: 61.9000015; skew-x: -3.20000005; skew-y: -3.4000001; scale-x: 0.592999995; scale-y: 0.592999995; }
        frame 23 { x: 18.5; y: 61.2000008; skew-x: -0.899999976; skew-y: -1.20000005; scale-x: 0.606999993; scale-y: 0.603999972; }
        frame 24 { x: 18.7000008; y: 60.5; skew-x: 1.29999995; skew-y: 1; scale-x: 0.620999992; scale-y: 0.615999997; }
        frame 25 { x: 19; y: 59.9000015; skew-x: 3.5; skew-y: 3.5; scale-x: 0.63499999; scale-y: 0.626999974; }
        frame 26 { x: 19.2000008; y: 59.4000015; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 0.648000002; scale-y: 0.638999999; }
        frame 27 { x: 19.5; y: 58.5; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.662; scale-y: 0.649999976; }
        frame 28 { x: 19.2999992; y: 59; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: 0.643999994; scale-y: 0.634000003; }
        frame 29 { x: -10000; y: 59.5; skew-x: 5.5; skew-y: 5.5; scale-x: 0.625999987; scale-y: 0.617999971; }
        frame 30 { y: 60; skew-x: 4; skew-y: 4; scale-x: 0.609000027; scale-y: 0.602999985; }
        frame 31 { y: 60.5; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.591000021; scale-y: 0.587000012; }
        frame 32 { x: 19.2000008; y: 61; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.573000014; scale-y: 0.57099998; }
        frame 33 { x: 19.3999996; y: 61.5999985; skew-x: 0; skew-y: 0; scale-x: 0.555000007; scale-y: 0.555000007; }
    }
    Track {
        source-name: "Sunflower_double_petals1";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 36.9000015; y: -3.20000005; scale-x: 0.600000024; scale-y: 0.600000024; cel: 0; image: IMAGE_REANIM_SUNFLOWER_DOUBLE_PETALS; }
        frame 10 { x: 36.4000015; y: -4; scale-x: 0.589999974; scale-y: 0.611000001; cel: -10000; image: none; }
        frame 11 { x: 36; y: -4.80000019; scale-x: 0.579999983; scale-y: 0.623000026; }
        frame 12 { x: 34.9000015; y: -5.30000019; scale-x: 0.584999979; scale-y: 0.616999984; }
        frame 13 { x: 34; y: -5.5999999; scale-x: 0.589999974; scale-y: 0.611000001; }
        frame 14 { x: 32.9000015; y: -6.0999999; scale-x: 0.595000029; scale-y: 0.606000006; }
        frame 15 { x: 31.8999996; y: -6.5; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 16 { x: 30.8999996; y: -10000; scale-x: -10000; scale-y: 0.596000016; }
        frame 17 { x: 29.7999992; scale-y: 0.592000008; }
        frame 18 { x: 28.7000008; y: -5.5; scale-y: 0.593999982; }
        frame 19 { x: 27.7000008; y: -4.5; scale-y: 0.596000016; }
        frame 20 { x: 26.6000004; y: -3.5; scale-y: 0.59799999; }
        frame 21 { x: 25.5; y: -2.5999999; scale-y: 0.600000024; }
        frame 22 { x: 26.6000004; y: -3.29999995; scale-y: 0.596000016; }
        frame 23 { x: 27.7000008; y: -4; scale-y: 0.592000008; }
        frame 24 { x: 28.7999992; y: -4.69999981; scale-y: 0.593999982; }
        frame 25 { x: 29.7999992; y: -5.5; scale-y: 0.596000016; }
        frame 26 { x: 30.7999992; y: -6.19999981; scale-y: 0.59799999; }
        frame 27 { x: 31.8999996; y: -6.9000001; scale-y: 0.600000024; }
        frame 28 { x: 32.7000008; y: -6.5; scale-y: 0.595000029; }
        frame 29 { x: 33.5; y: -6.30000019; scale-y: 0.589999974; }
        frame 30 { x: 34.4000015; y: -5.5; scale-y: 0.592999995; }
        frame 31 { x: 35.2000008; y: -4.80000019; scale-y: 0.595000029; }
        frame 32 { x: 36; y: -4; scale-y: 0.59799999; }
        frame 33 { x: 36.9000015; y: -3.20000005; scale-y: 0.600000024; }
    }
    Track {
        source-name: "anim_face2";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 43.4000015; y: 2; scale-x: 0.600000024; scale-y: 0.533999979; cel: 0; image: IMAGE_REANIM_SUNFLOWER_HEAD; }
        frame 10 { x: 42.5999985; y: 1.20000005; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { x: 41.7999992; y: 0.400000006; }
        frame 12 { x: 40.9000015; y: 0; }
        frame 13 { x: 40.0999985; y: -0.300000012; }
        frame 14 { x: 39.2999992; y: -0.699999988; }
        frame 15 { x: 38.4000015; y: -1.10000002; }
        frame 16 { x: 37.4000015; y: -0.5; }
        frame 17 { x: 36.2999992; y: 0.100000001; }
        frame 18 { x: 35.2000008; y: 0.699999988; }
        frame 19 { x: 34.0999985; y: 1.29999995; }
        frame 20 { x: 33; y: 2; }
        frame 21 { x: 32; y: 2.5999999; }
        frame 22 { x: 33; y: 1.89999998; }
        frame 23 { x: 34.0999985; y: 1.20000005; }
        frame 24 { x: 35.2000008; y: 0.5; }
        frame 25 { x: 36.2999992; y: -0.100000001; }
        frame 26 { x: 37.4000015; y: -0.800000012; }
        frame 27 { x: 38.4000015; y: -1.5; }
        frame 28 { x: 39.2999992; y: -0.899999976; }
        frame 29 { x: 40; y: -0.300000012; }
        frame 30 { x: 40.9000015; y: 0.200000003; }
        frame 31 { x: 41.7999992; y: 0.800000012; }
        frame 32 { x: 42.5; y: 1.39999998; }
        frame 33 { x: 43.4000015; y: 2; }
    }
    Track {
        source-name: "Sunflower_double_petals2";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: -3.79999995; y: 14.1000004; scale-x: 0.600000024; scale-y: 0.600000024; cel: 0; image: IMAGE_REANIM_SUNFLOWER_DOUBLE_PETALS; }
        frame 10 { x: -2; y: 13.1999998; scale-x: 0.583999991; scale-y: 0.609000027; cel: -10000; image: none; }
        frame 11 { x: -0.200000003; y: 12.3000002; scale-x: 0.568000019; scale-y: 0.616999984; }
        frame 12 { x: 0.400000006; y: 11.3999996; scale-x: 0.575999975; scale-y: 0.612999976; }
        frame 13 { x: 1.20000005; y: 10.5; scale-x: 0.583999991; scale-y: 0.609000027; }
        frame 14 { x: 1.89999998; y: 9.60000038; scale-x: 0.592000008; scale-y: 0.603999972; }
        frame 15 { x: 2.5999999; y: 8.69999981; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 16 { x: 3.5; y: 9.10000038; scale-x: -10000; scale-y: 0.592999995; }
        frame 17 { x: 4.30000019; y: 9.39999962; scale-y: 0.586000025; }
        frame 18 { x: 5.0999999; y: 10.6999998; scale-y: 0.589999974; }
        frame 19 { x: 6; y: 11.8999996; scale-y: 0.592999995; }
        frame 20 { x: 6.80000019; y: 13.1999998; scale-y: 0.597000003; }
        frame 21 { x: 7.5999999; y: 14.3999996; scale-y: 0.600000024; }
        frame 22 { x: 6.80000019; y: 14; scale-y: 0.596000016; }
        frame 23 { x: 6; y: 13.5; scale-y: 0.592000008; }
        frame 24 { x: 5.0999999; y: 12.3000002; scale-y: 0.593999982; }
        frame 25 { x: 4.30000019; y: 11.1000004; scale-y: 0.596000016; }
        frame 26 { x: 3.5; y: 9.89999962; scale-y: 0.59799999; }
        frame 27 { x: 2.5999999; y: 8.69999981; scale-y: 0.600000024; }
        frame 28 { x: 1.5; y: 9.10000038; scale-y: 0.59799999; }
        frame 29 { x: 0.400000006; y: 9.5; scale-y: 0.596000016; }
        frame 30 { x: -0.5; y: 10.6999998; scale-y: 0.597000003; }
        frame 31 { x: -1.60000002; y: 11.8000002; scale-y: 0.59799999; }
        frame 32 { x: -2.70000005; y: 13; scale-y: 0.598999977; }
        frame 33 { x: -3.79999995; y: 14.1000004; scale-y: 0.600000024; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 2.5999999; y: 19.5; scale-x: 0.600000024; scale-y: 0.533999979; cel: 0; image: IMAGE_REANIM_SUNFLOWER_HEAD; }
        frame 10 { x: 3.70000005; y: 18.6000004; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { x: 4.80000019; y: 17.7000008; }
        frame 12 { x: 5.9000001; y: 16.7999992; }
        frame 13 { x: 7; y: 15.8999996; }
        frame 14 { x: 8.10000038; y: 15; }
        frame 15 { x: 9.19999981; y: 14.1000004; }
        frame 16 { x: 10; y: 15; }
        frame 17 { x: 10.8000002; y: 16; }
        frame 18 { x: 11.6999998; y: 17; }
        frame 19 { x: 12.5; y: 17.8999996; }
        frame 20 { x: 13.3000002; y: 18.8999996; }
        frame 21 { x: 14.1999998; y: 19.7999992; }
        frame 22 { x: 13.3000002; y: 18.8999996; }
        frame 23 { x: 12.5; y: 17.8999996; }
        frame 24 { x: 11.6999998; y: 17; }
        frame 25 { x: 10.8000002; y: 16; }
        frame 26 { x: 10; y: 15; }
        frame 27 { x: 9.19999981; y: 14.1000004; }
        frame 28 { x: 8.10000038; y: 15; }
        frame 29 { x: 7; y: 15.8999996; }
        frame 30 { x: 5.9000001; y: 16.7999992; }
        frame 31 { x: 4.80000019; y: 17.7000008; }
        frame 32 { x: 3.70000005; y: 18.6000004; }
        frame 33 { x: 2.5999999; y: 19.5; }
    }
    Track {
        source-name: "SunFlower_blink";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 12.1999998; y: 24; scale-x: 0.600000024; scale-y: 0.600000024; cel: 0; image: IMAGE_REANIM_SUNFLOWER_BLINK2; }
        frame 6 { x: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_SUNFLOWER_BLINK1; }
        frame 7 { image: IMAGE_REANIM_SUNFLOWER_BLINK2; }
        frame 8 { y: -10000; cel: -1; image: none; }
        frame 9 { cel: -10000; }
    }
    Track {
        source-name: "SunFlower_blink2";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { x: 52.9000015; y: 6.69999981; scale-x: 0.600000024; scale-y: 0.600000024; cel: 0; image: IMAGE_REANIM_SUNFLOWER_BLINK2; }
        frame 2 { x: -10000; y: 6.4000001; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_SUNFLOWER_BLINK1; }
        frame 3 { y: 6.69999981; image: IMAGE_REANIM_SUNFLOWER_BLINK2; }
        frame 4 { y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
}
