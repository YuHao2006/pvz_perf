export component ScaredyShroom {
    fps: 12;
    Track {
        source-name: "anim_sleep";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 70 { cel: 0; }
        frame 71 { cel: -10000; }
    }
    Track {
        source-name: "anim_grow";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 60 { cel: 0; }
        frame 61 { cel: -10000; }
        frame 70 { cel: -1; }
        frame 71 { cel: -10000; }
    }
    Track {
        source-name: "anim_scaredidle";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 49 { cel: 0; }
        frame 50 { cel: -10000; }
        frame 60 { cel: -1; }
        frame 61 { cel: -10000; }
    }
    Track {
        source-name: "anim_scared";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 36 { cel: 0; }
        frame 37 { cel: -10000; }
        frame 49 { cel: -1; }
        frame 50 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { cel: 0; }
        frame 22 { cel: -10000; }
        frame 36 { cel: -1; }
        frame 37 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 21 { cel: -1; }
        frame 22 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: 0; }
        frame 2 { cel: -10000; }
        frame 4 { cel: -1; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "ScaredyShroom_head_inner";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 22.5; y: 25.6000004; scale-x: 0.762000024; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_HEAD_INNER; }
        frame 6 { x: -10000; y: 25.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 25.3999996; }
        frame 8 { y: 26; }
        frame 9 { y: 26.5; }
        frame 10 { y: 27.1000004; }
        frame 11 { y: 27.6000004; }
        frame 12 { y: 28.2000008; }
        frame 13 { x: 21.7000008; y: 29; scale-x: 0.80400002; scale-y: 0.768000007; }
        frame 14 { x: 20.7999992; y: 29.7999992; scale-x: 0.846000016; scale-y: 0.736000001; }
        frame 15 { x: 21.1000004; y: 29.1000004; scale-x: 0.832000017; scale-y: 0.745999992; }
        frame 16 { x: 21.3999996; y: 28.3999996; scale-x: 0.818000019; scale-y: 0.757000029; }
        frame 17 { x: 21.6000004; y: 27.7000008; scale-x: 0.80400002; scale-y: 0.768000007; }
        frame 18 { x: 22; y: 27; scale-x: 0.790000021; scale-y: 0.778999984; }
        frame 19 { x: 22.2000008; y: 26.2999992; scale-x: 0.776000023; scale-y: 0.788999975; }
        frame 20 { x: 22.5; y: 25.6000004; scale-x: 0.762000024; scale-y: 0.800000012; }
        frame 21 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 21.5; y: 26; skew-x: -0.699999988; skew-y: -1.20000005; }
        frame 23 { x: 20.5; y: 26.3999996; skew-x: -1.39999998; skew-y: -2.4000001; }
        frame 24 { x: 19.6000004; y: 26.7000008; skew-x: -2.20000005; skew-y: -3.70000005; }
        frame 25 { x: 18.6000004; y: 26.8999996; skew-x: -2.9000001; skew-y: -4.9000001; }
        frame 26 { x: 17.7000008; y: 27.3999996; skew-x: -3.70000005; skew-y: -6.19999981; }
        frame 27 { x: 16.6000004; y: 27.7000008; skew-x: -4.4000001; skew-y: -7.4000001; scale-y: 0.800999999; }
        frame 28 { x: 20.8999996; y: 26.5; skew-x: 2; skew-y: 2.5999999; scale-x: 0.740999997; scale-y: 0.799000025; }
        frame 29 { x: 42.0999985; y: 24.1000004; skew-x: 20.3999996; skew-y: 28.2999992; scale-x: 0.697000027; scale-y: 0.79400003; }
        frame 30 { x: 36.5; y: 24.7999992; skew-x: 14.3000002; skew-y: 20.5; scale-x: 0.707000017; scale-y: -10000; }
        frame 31 { x: 30.8999996; y: 25.7999992; skew-x: 8.60000038; skew-y: 12.8000002; scale-x: 0.718999982; scale-y: 0.796000004; }
        frame 32 { x: 28.7999992; y: 25.7000008; skew-x: 6.30000019; skew-y: 9.5; scale-x: 0.728999972; scale-y: 0.796999991; }
        frame 33 { x: 26.7000008; y: -10000; skew-x: 4.30000019; skew-y: 6.30000019; scale-x: 0.74000001; scale-y: 0.797999978; }
        frame 34 { x: 24.6000004; skew-x: 2; skew-y: 3.0999999; scale-x: 0.750999987; scale-y: 0.799000025; }
        frame 35 { x: 22.5; y: 25.6000004; skew-x: 0; skew-y: 0; scale-x: 0.762000024; scale-y: 0.800000012; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { y: 24.6000004; }
        frame 38 { y: 23.5; }
        frame 39 { y: 22.5; }
        frame 40 { y: -10000; }
        frame 42 { x: 22.3999996; y: 34; skew-x: 8; skew-y: 7.80000019; scale-x: 0.795000017; scale-y: 0.751999974; }
        frame 43 { x: -10000; y: 45.5999985; skew-x: 16.1000004; skew-y: 15.5; scale-x: 0.828000009; scale-y: 0.703999996; }
        frame 44 { x: 22.7999992; y: 57.2999992; skew-x: 24.2000008; skew-y: 23.2999992; scale-x: 0.861999989; scale-y: 0.656000018; }
        frame 45 { x: 21.2999992; y: 59.5; skew-x: 21.7999992; skew-y: 24.7999992; scale-x: 0.889999986; scale-y: 0.59799999; }
        frame 46 { x: 19.7999992; y: 61.5999985; skew-x: 19.7000008; skew-y: 26.2999992; scale-x: 0.91900003; scale-y: 0.541999996; }
        frame 47 { x: 21.8999996; y: 55.0999985; skew-x: 25.2999992; skew-y: 22.7999992; scale-x: 0.898999989; scale-y: 0.702000022; }
        frame 48 { x: 24.1000004; y: 48.5999985; skew-x: 31.2000008; skew-y: 19.5; scale-x: 0.882000029; scale-y: 0.862999976; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 23.8999996; y: 49.2000008; skew-x: 30.2999992; skew-y: 20; scale-x: 0.888999999; scale-y: 0.853999972; }
        frame 51 { x: 23.7000008; y: 49.5999985; skew-x: 29.6000004; skew-y: 20.6000004; scale-x: 0.898999989; scale-y: 0.84799999; }
        frame 52 { x: 23.7999992; y: 48.5; skew-x: 30.1000004; skew-y: 20.2999992; scale-x: 0.89200002; scale-y: 0.851999998; }
        frame 53 { x: 24; y: 47.2999992; skew-x: 30.6000004; skew-y: 19.7999992; scale-x: 0.887000024; scale-y: 0.856999993; }
        frame 54 { x: 24.1000004; y: 46.0999985; skew-x: 31.2000008; skew-y: 19.5; scale-x: 0.882000029; scale-y: 0.862999976; }
        frame 55 { x: 24.7999992; y: 46.2000008; skew-x: 31.7999992; skew-y: 20.1000004; scale-x: 0.859000027; scale-y: 0.861000001; }
        frame 56 { x: 25.3999996; y: 46.2999992; skew-x: 32.4000015; skew-y: 20.8999996; scale-x: 0.838; scale-y: 0.861999989; }
        frame 57 { x: 25; y: 47; skew-x: 32.0999985; skew-y: 20.2999992; scale-x: 0.851999998; scale-y: 0.861000001; }
        frame 58 { x: 24.6000004; y: 48; skew-x: 31.6000004; skew-y: 19.7999992; scale-x: 0.865999997; scale-y: 0.861999989; }
        frame 59 { x: 24.1000004; y: 48.5999985; skew-x: 31.2000008; skew-y: 19.5; scale-x: 0.882000029; scale-y: 0.862999976; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 23.7999992; y: 51.5999985; skew-x: 28.7999992; skew-y: 20.7999992; scale-x: 0.874000013; scale-y: 0.792999983; }
        frame 62 { x: 23.3999996; y: 54.5; skew-x: 26.5; skew-y: 22; scale-x: 0.867999971; scale-y: 0.723999977; }
        frame 63 { x: 22.7999992; y: 57.2999992; skew-x: 24.2000008; skew-y: 23.2999992; scale-x: 0.861999989; scale-y: 0.656000018; }
        frame 64 { x: 22.6000004; y: 45.5999985; skew-x: 16.1000004; skew-y: 15.5; scale-x: 0.828000009; scale-y: 0.703999996; }
        frame 65 { x: -10000; y: 34; skew-x: 8; skew-y: 7.80000019; scale-x: 0.795000017; scale-y: 0.751999974; }
        frame 66 { x: 22.5; y: 22.5; skew-x: 0; skew-y: 0; scale-x: 0.762000024; scale-y: 0.800000012; }
        frame 67 { x: -10000; y: 23.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { y: 24.6000004; }
        frame 69 { y: 25.6000004; }
        frame 70 { x: 27.6000004; y: 25.5; skew-x: 22.6000004; skew-y: 22.6000004; scale-y: 0.799000025; }
        frame 71 { x: -10000; y: 25.2999992; skew-x: 23.1000004; skew-y: 21.7999992; scale-x: 0.755999982; scale-y: 0.810000002; }
        frame 72 { y: 24.8999996; skew-x: 23.7999992; skew-y: 21.2999992; scale-x: 0.750999987; scale-y: 0.823000014; }
        frame 73 { y: 25.6000004; skew-x: 23.6000004; skew-y: 21.5; scale-x: 0.751999974; scale-y: 0.818000019; }
        frame 74 { y: 26.2000008; skew-x: 23.2999992; skew-y: 21.7999992; scale-x: 0.754999995; scale-y: 0.813000023; }
        frame 75 { x: 27.5; y: 26.8999996; skew-x: 23; skew-y: 22; scale-x: 0.757000029; scale-y: 0.808000028; }
        frame 76 { x: 27.6000004; y: 27.5; skew-x: 22.7999992; skew-y: 22.2999992; scale-x: 0.759000003; scale-y: 0.802999973; }
        frame 77 { x: -10000; y: 28.2000008; skew-x: 22.6000004; skew-y: 22.6000004; scale-x: 0.762000024; scale-y: 0.799000025; }
        frame 78 { x: 27.3999996; y: 28.2999992; skew-x: 21.7999992; skew-y: 23.1000004; scale-x: 0.771000028; scale-y: 0.791999996; }
        frame 79 { x: 27.2999992; y: -10000; skew-x: 21.3999996; skew-y: 23.7999992; scale-x: 0.782999992; scale-y: 0.787999988; }
        frame 80 { x: -10000; y: 27.7999992; skew-x: 21.5; skew-y: 23.6000004; scale-x: 0.778999984; scale-y: 0.788999975; }
        frame 81 { y: 27.3999996; skew-x: 21.7999992; skew-y: 23.2999992; scale-x: 0.774999976; scale-y: 0.790000021; }
        frame 82 { x: 27.3999996; y: 27; skew-x: -10000; skew-y: 23.1000004; scale-x: 0.771000028; scale-y: 0.791999996; }
        frame 83 { x: -10000; y: 26.3999996; skew-x: 22.1000004; skew-y: 22.7999992; scale-x: 0.768000007; scale-y: 0.79400003; }
        frame 84 { y: 26; skew-x: 22.2999992; skew-y: -10000; scale-x: 0.763999999; scale-y: 0.796000004; }
        frame 85 { x: 27.6000004; y: 25.5; skew-x: 22.6000004; skew-y: 22.6000004; scale-x: 0.762000024; scale-y: 0.799000025; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 27.6000004; y: 35.0999985; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_STEM; }
        frame 6 { x: -10000; y: 35.7999992; scale-x: -10000; scale-y: 0.788999975; cel: -10000; image: none; }
        frame 7 { y: 36.4000015; scale-y: 0.77700001; }
        frame 8 { y: 37; scale-y: 0.765999973; }
        frame 9 { y: 37.5; scale-y: 0.754000008; }
        frame 10 { y: 38.0999985; scale-y: 0.742999971; }
        frame 11 { y: 38.7999992; scale-y: 0.731999993; }
        frame 12 { y: 39.4000015; scale-y: 0.720000029; }
        frame 13 { y: 38.9000015; scale-y: 0.730000019; }
        frame 14 { y: 38.4000015; scale-y: 0.74000001; }
        frame 15 { y: 37.7999992; scale-y: 0.75; }
        frame 16 { y: 37.2999992; scale-y: 0.75999999; }
        frame 17 { y: 36.7000008; scale-y: 0.769999981; }
        frame 18 { y: 36.2000008; scale-y: 0.779999971; }
        frame 19 { y: 35.5999985; scale-y: 0.790000021; }
        frame 20 { y: 35.0999985; scale-y: 0.800000012; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 22 { x: 27.2000008; skew-y: -0.400000006; }
        frame 23 { x: 26.8999996; skew-y: -0.899999976; }
        frame 24 { x: 26.5; skew-y: -1.39999998; }
        frame 25 { x: 26.2000008; skew-y: -1.89999998; scale-y: 0.800999999; }
        frame 26 { x: 25.7999992; skew-y: -2.4000001; scale-y: -10000; }
        frame 27 { x: 25.3999996; skew-y: -2.9000001; }
        frame 28 { x: 29.3999996; y: 35; skew-y: 2.29999995; scale-y: 0.80400002; }
        frame 29 { x: 33.5; y: 35.0999985; skew-y: 7.9000001; scale-y: 0.808000028; }
        frame 30 { x: 32.4000015; y: -10000; skew-y: 6.5; scale-y: 0.805999994; }
        frame 31 { x: 31.5; skew-y: 5.30000019; scale-y: 0.805000007; }
        frame 32 { x: 30.5; skew-y: 3.79999995; scale-y: 0.80400002; }
        frame 33 { x: 29.5; y: 35; skew-y: 2.5; scale-y: 0.801999986; }
        frame 34 { x: 28.5; y: 35.0999985; skew-y: 1.29999995; scale-y: 0.800999999; }
        frame 35 { x: 27.6000004; y: -10000; skew-y: 0; scale-y: 0.800000012; }
        frame 36 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 37 { y: 34.4000015; scale-y: 0.814999998; }
        frame 38 { y: 33.5; scale-y: 0.829999983; }
        frame 39 { y: 32.7999992; scale-y: 0.845000029; }
        frame 40 { y: 30; scale-y: 0.899999976; }
        frame 41 { y: 27.2000008; scale-y: 0.954999983; }
        frame 42 { y: 35; scale-y: 0.805999994; }
        frame 43 { y: 43; scale-y: 0.657000005; }
        frame 44 { y: 50.9000015; scale-y: 0.508000016; }
        frame 45 { x: 27; y: 51.9000015; scale-x: 0.856999993; scale-y: 0.49000001; }
        frame 46 { x: 26.3999996; y: 52.9000015; scale-x: 0.913999975; scale-y: 0.470999986; }
        frame 47 { x: 27; y: 51.9000015; scale-x: 0.856999993; scale-y: 0.49000001; }
        frame 48 { x: 27.6000004; y: 50.9000015; scale-x: 0.800000012; scale-y: 0.508000016; }
        frame 49 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 64 { y: 43; scale-y: 0.657000005; }
        frame 65 { y: 35; scale-y: 0.805999994; }
        frame 66 { y: 27.2000008; scale-y: 0.954999983; }
        frame 67 { y: 29.8999996; scale-y: 0.902999997; }
        frame 68 { y: 32.5; scale-y: 0.851999998; }
        frame 69 { y: 35.0999985; scale-y: 0.800000012; }
        frame 70 { y: -10000; scale-y: -10000; }
        frame 71 { y: 35.7999992; scale-y: 0.788999975; }
        frame 72 { y: 36.4000015; scale-y: 0.77700001; }
        frame 73 { y: 37; scale-y: 0.765999973; }
        frame 74 { y: 37.5; scale-y: 0.754000008; }
        frame 75 { y: 38.0999985; scale-y: 0.742999971; }
        frame 76 { y: 38.7999992; scale-y: 0.731999993; }
        frame 77 { y: 39.4000015; scale-y: 0.720000029; }
        frame 78 { y: 38.9000015; scale-y: 0.730000019; }
        frame 79 { y: 38.4000015; scale-y: 0.74000001; }
        frame 80 { y: 37.7999992; scale-y: 0.75; }
        frame 81 { y: 37.2999992; scale-y: 0.75999999; }
        frame 82 { y: 36.7000008; scale-y: 0.769999981; }
        frame 83 { y: 36.2000008; scale-y: 0.779999971; }
        frame 84 { y: 35.5999985; scale-y: 0.790000021; }
        frame 85 { y: 35.0999985; scale-y: 0.800000012; }
    }
    Track {
        source-name: "anim_eye2";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { x: 39.4000015; y: 35; scale-x: 0.800000012; scale-y: 0.439999998; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_EYE2; }
        frame 2 { x: -10000; y: 36.5; scale-x: -10000; scale-y: 0.123999998; cel: -10000; image: none; }
        frame 3 { y: 35; scale-y: 0.439999998; }
        frame 4 { y: -10000; scale-y: -10000; cel: -1; }
        frame 5 { y: 33.0999985; scale-y: 0.800000012; cel: 0; }
        frame 6 { y: 33.4000015; scale-y: -10000; cel: -10000; }
        frame 7 { y: 33.5999985; }
        frame 8 { y: 33.9000015; }
        frame 9 { y: 34.2000008; }
        frame 10 { y: 34.5; }
        frame 11 { y: 34.7000008; }
        frame 12 { y: 35; }
        frame 13 { y: 34.7999992; }
        frame 14 { y: 34.5; }
        frame 15 { y: 34.2999992; }
        frame 16 { y: 34; }
        frame 17 { y: 33.9000015; }
        frame 18 { y: 33.5999985; }
        frame 19 { y: 33.4000015; }
        frame 20 { y: 33.0999985; }
        frame 21 { y: -10000; }
        frame 22 { x: 39; skew-y: -0.400000006; }
        frame 23 { x: 38.5999985; skew-y: -0.899999976; }
        frame 24 { x: 38.2000008; skew-y: -1.39999998; }
        frame 25 { x: 37.7999992; skew-y: -1.89999998; scale-y: 0.800999999; }
        frame 26 { x: 37.4000015; skew-y: -2.4000001; scale-y: -10000; }
        frame 27 { x: 37; skew-y: -2.9000001; }
        frame 28 { x: 41.2999992; skew-y: 2.29999995; scale-y: 0.80400002; }
        frame 29 { x: 45.5; skew-y: 7.9000001; scale-y: 0.808000028; }
        frame 30 { x: 44.5; skew-y: 6.5; scale-y: 0.805999994; }
        frame 31 { x: 43.5; skew-y: 5.30000019; scale-y: 0.805000007; }
        frame 32 { x: 42.5; skew-y: 3.79999995; scale-y: 0.80400002; }
        frame 33 { x: 41.5; skew-y: 2.5; scale-y: 0.801999986; }
        frame 34 { x: 40.4000015; skew-y: 1.29999995; scale-y: 0.800999999; }
        frame 35 { x: 39.4000015; skew-y: 0; scale-y: 0.800000012; }
        frame 36 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 37 { x: 39.5999985; y: 32; scale-x: 0.838; scale-y: 0.901000023; }
        frame 38 { x: 39.7999992; y: 30.8999996; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.875; scale-y: 1.00100005; }
        frame 39 { x: 40; y: 29.8999996; skew-x: 0.600000024; skew-y: 0.600000024; scale-x: 0.912999988; scale-y: 1.102; }
        frame 40 { x: -10000; y: -10000; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 41 { skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 42 { x: 39.9000015; y: 39.0999985; skew-x: 0.5; skew-y: 0.5; }
        frame 43 { x: 39.7000008; y: 52.2999992; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 39.5999985; y: 65.3000031; skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 45 { x: 39.5; y: 65; skew-x: 0.5; skew-y: 0.5; scale-x: 0.961000025; scale-y: 1.12800002; }
        frame 46 { x: -10000; y: 64.4000015; skew-x: -10000; skew-y: -10000; scale-x: 1.00899994; scale-y: 1.153; }
        frame 47 { y: 64; scale-x: 1.05599999; scale-y: 1.17900002; }
        frame 48 { x: 39.4000015; y: 63.4000015; skew-x: 0.600000024; skew-y: 0.600000024; scale-x: 1.10399997; scale-y: 1.20500004; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { skew-x: 0.5; skew-y: 0.5; }
        frame 51 { skew-x: -10000; skew-y: -10000; }
        frame 54 { skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 55 { skew-x: 0.5; skew-y: 0.5; }
        frame 56 { skew-x: -10000; skew-y: -10000; }
        frame 59 { skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 60 { skew-x: -10000; skew-y: -10000; }
        frame 61 { x: 39.5; y: 64.0999985; skew-x: 0.5; skew-y: 0.5; scale-x: 1.03999996; scale-y: 1.171; }
        frame 62 { x: -10000; y: 64.6999969; skew-x: -10000; skew-y: -10000; scale-x: 0.976999998; scale-y: 1.13600004; }
        frame 63 { x: 39.5999985; y: 65.3000031; skew-x: 0.600000024; skew-y: 0.600000024; scale-x: 0.912999988; scale-y: 1.102; }
        frame 64 { x: 39.7999992; y: 53.5; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 39.9000015; y: 41.5999985; skew-x: -10000; skew-y: -10000; }
        frame 66 { x: 40; y: 29.8999996; skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 67 { x: 39.7999992; y: 31; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.875; scale-y: 1.00100005; }
        frame 68 { x: 39.5999985; y: 32.0999985; skew-x: 0; skew-y: 0; scale-x: 0.838; scale-y: 0.901000023; }
        frame 69 { x: 39.4000015; y: 33.0999985; skew-x: -10000; skew-y: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 70 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { y: 33.4000015; }
        frame 72 { y: 33.5999985; }
        frame 73 { y: 33.9000015; }
        frame 74 { y: 34.2000008; }
        frame 75 { y: 34.5; }
        frame 76 { y: 34.7000008; }
        frame 77 { y: 35; }
        frame 78 { y: 34.7999992; }
        frame 79 { y: 34.5; }
        frame 80 { y: 34.2999992; }
        frame 81 { y: 34; }
        frame 82 { y: 33.9000015; }
        frame 83 { y: 33.5999985; }
        frame 84 { y: 33.4000015; }
        frame 85 { y: 33.0999985; }
    }
    Track {
        source-name: "ScaredyShroom_eye_big2";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 49 { x: 40.2999992; y: 64.5; scale-x: 0.699999988; scale-y: 0.699999988; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_EYE_BIG; }
        frame 50 { x: -10000; y: 64; scale-x: 0.726000011; scale-y: 0.726000011; cel: -10000; image: none; }
        frame 51 { y: 63.5; scale-x: 0.751999974; scale-y: 0.751999974; }
        frame 52 { y: 64; scale-x: 0.726000011; scale-y: 0.726000011; }
        frame 53 { y: 64.5; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 54 { y: 64; scale-x: 0.726000011; scale-y: 0.726000011; }
        frame 55 { y: 63.5; scale-x: 0.751999974; scale-y: 0.751999974; }
        frame 56 { y: 64; scale-x: 0.726000011; scale-y: 0.726000011; }
        frame 57 { y: 64.5; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 58 { y: 64; scale-x: 0.726000011; scale-y: 0.726000011; }
        frame 59 { y: 63.5; scale-x: 0.751999974; scale-y: 0.751999974; }
        frame 60 { y: 64.5; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 61 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 63 { cel: -1; }
        frame 64 { cel: -10000; }
    }
    Track {
        source-name: "ScaredyShroom_mouth";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 38.5; y: 43.5999985; scale-x: 1.60000002; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_MOUTH; }
        frame 6 { x: -10000; y: 43.9000015; skew-x: -3; scale-x: 1.60500002; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 44.2999992; skew-x: -6.30000019; scale-x: 1.61000001; }
        frame 8 { y: 44.5; skew-x: -4.9000001; scale-x: 1.60800004; }
        frame 9 { y: 44.7999992; skew-x: -3.70000005; scale-x: 1.60599995; }
        frame 10 { y: 45; skew-x: -2.4000001; scale-x: 1.60399997; }
        frame 11 { y: 45.2999992; skew-x: -1.20000005; scale-x: 1.602; }
        frame 12 { y: 45.5; skew-x: 0; scale-x: 1.60000002; }
        frame 13 { y: 45.4000015; skew-x: 3.0999999; scale-x: 1.60500002; }
        frame 14 { y: 45.2000008; skew-x: 6.4000001; scale-x: 1.61000001; }
        frame 15 { y: 45; skew-x: 5.30000019; scale-x: 1.60800004; }
        frame 16 { y: 44.7000008; skew-x: 4.30000019; scale-x: 1.60599995; }
        frame 17 { y: 44.5; skew-x: 3.0999999; scale-x: 1.60500002; }
        frame 18 { y: 44.2000008; skew-x: 2; scale-x: 1.60300004; }
        frame 19 { y: 43.9000015; skew-x: 1; scale-x: 1.602; }
        frame 20 { y: 43.5999985; skew-x: 0; scale-x: 1.60000002; }
        frame 21 { y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 22 { x: 38.2000008; skew-y: -0.400000006; scale-x: 1.41299999; }
        frame 23 { x: 38; skew-y: -0.899999976; scale-x: 1.227; }
        frame 24 { x: 37.7000008; y: 43.5; skew-y: -1.39999998; scale-x: 1.03999996; }
        frame 25 { x: 37.5; y: 43.5999985; skew-y: -1.89999998; scale-x: 0.852999985; scale-y: 0.800999999; }
        frame 26 { x: 37.2000008; y: -10000; skew-y: -2.4000001; scale-x: 0.666999996; scale-y: -10000; }
        frame 27 { x: 37; skew-y: -2.9000001; scale-x: 0.479999989; }
        frame 28 { x: 40.0999985; y: 44.4000015; skew-y: 2.29999995; scale-x: 1.77699995; scale-y: 0.68900001; }
        frame 29 { x: 43.4000015; y: 45.0999985; skew-y: 7.9000001; scale-x: 3.07399988; scale-y: 0.575999975; }
        frame 30 { x: 42.5999985; y: 44.9000015; skew-y: 6.5; scale-x: 2.82800007; scale-y: 0.612999976; }
        frame 31 { x: 41.9000015; y: 44.5999985; skew-y: 5.30000019; scale-x: 2.58299994; scale-y: 0.651000023; }
        frame 32 { x: 41.0999985; y: 44.4000015; skew-y: 3.79999995; scale-x: 2.33699989; scale-y: 0.688000023; }
        frame 33 { x: 40.4000015; y: 44; skew-y: 2.5; scale-x: 2.09100008; scale-y: 0.725000024; }
        frame 34 { x: 39.5; y: 43.9000015; skew-y: 1.29999995; scale-x: 1.84599996; scale-y: 0.763000011; }
        frame 35 { x: 38.5; y: 43.5999985; skew-y: 0; scale-x: 1.60000002; scale-y: 0.800000012; }
        frame 36 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { skew-x: -1.39999998; scale-x: 1.52199996; }
        frame 38 { x: 38.4000015; skew-x: -3.20000005; scale-x: 1.44299996; }
        frame 39 { x: -10000; skew-x: -4.9000001; scale-x: 1.36500001; }
        frame 40 { y: 43.5; skew-x: -6.9000001; scale-x: 1.37100005; }
        frame 41 { y: -10000; skew-x: -9; scale-x: 1.37699997; }
        frame 42 { y: 51; skew-x: -7.5; scale-x: 1.37199998; }
        frame 43 { x: 38.2999992; y: 57; skew-x: -6.19999981; scale-x: 1.36800003; }
        frame 44 { x: 38.4000015; y: 63; skew-x: -4.9000001; scale-x: 1.36500001; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; cel: -1; }
        frame 46 { cel: -10000; }
        frame 63 { cel: 0; }
        frame 64 { y: 56.5; skew-x: -6.19999981; scale-x: 1.36899996; cel: -10000; }
        frame 65 { y: 50; skew-x: -7.5; scale-x: 1.37199998; }
        frame 66 { y: 43.5; skew-x: -9; scale-x: 1.37699997; }
        frame 67 { y: -10000; skew-x: -5.9000001; scale-x: 1.45099998; }
        frame 68 { x: 38.5; y: 43.5999985; skew-x: -2.9000001; scale-x: 1.52499998; }
        frame 69 { x: -10000; y: -10000; skew-x: 0; scale-x: 1.60000002; }
        frame 70 { skew-x: -10000; scale-x: -10000; }
        frame 71 { y: 43.9000015; skew-x: -3; scale-x: 1.60500002; }
        frame 72 { y: 44.2999992; skew-x: -6.30000019; scale-x: 1.61000001; }
        frame 73 { y: 44.5; skew-x: -4.9000001; scale-x: 1.60800004; }
        frame 74 { y: 44.7999992; skew-x: -3.70000005; scale-x: 1.60599995; }
        frame 75 { y: 45; skew-x: -2.4000001; scale-x: 1.60399997; }
        frame 76 { y: 45.2999992; skew-x: -1.20000005; scale-x: 1.602; }
        frame 77 { y: 45.5; skew-x: 0; scale-x: 1.60000002; }
        frame 78 { y: 45.4000015; skew-x: 3.0999999; scale-x: 1.60500002; }
        frame 79 { y: 45.2000008; skew-x: 6.4000001; scale-x: 1.61000001; }
        frame 80 { y: 45; skew-x: 5.30000019; scale-x: 1.60800004; }
        frame 81 { y: 44.7000008; skew-x: 4.30000019; scale-x: 1.60599995; }
        frame 82 { y: 44.5; skew-x: 3.0999999; scale-x: 1.60500002; }
        frame 83 { y: 44.2000008; skew-x: 2; scale-x: 1.60300004; }
        frame 84 { y: 43.9000015; skew-x: 1; scale-x: 1.602; }
        frame 85 { y: 43.5999985; skew-x: 0; scale-x: 1.60000002; }
    }
    Track {
        source-name: "ScaredyShroom_lips";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 43.5; y: 39.5; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_LIPS; }
        frame 6 { x: 43.0999985; y: 39.5999985; skew-x: -1.89999998; skew-y: -1.89999998; scale-x: -10000; scale-y: 0.771000028; cel: -10000; image: none; }
        frame 7 { x: 42.9000015; y: -10000; skew-x: -4.19999981; skew-y: -4.19999981; scale-y: 0.741999984; }
        frame 8 { x: 43; y: 40; skew-x: -3.20000005; skew-y: -3.20000005; scale-y: 0.753000021; }
        frame 9 { x: 43.0999985; y: 40.4000015; skew-x: -2.4000001; skew-y: -2.4000001; scale-y: 0.764999986; }
        frame 10 { x: 43.2000008; y: 40.5999985; skew-x: -1.5; skew-y: -1.5; scale-y: 0.77700001; }
        frame 11 { x: 43.4000015; y: 41; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.787999988; }
        frame 12 { x: 43.5; y: 41.5; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 13 { x: 43.7000008; y: 42.4000015; skew-x: 2.29999995; skew-y: 2.29999995; scale-y: 0.778999984; }
        frame 14 { x: 43.9000015; y: 43.0999985; skew-x: 4.80000019; skew-y: 4.80000019; scale-y: 0.758000016; }
        frame 15 { x: 43.7999992; y: 42.5999985; skew-x: 4; skew-y: 4; scale-y: 0.764999986; }
        frame 16 { x: -10000; y: 42; skew-x: 3.0999999; skew-y: 3.0999999; scale-y: 0.772000015; }
        frame 17 { x: 43.5999985; y: 41.4000015; skew-x: 2.29999995; skew-y: 2.29999995; scale-y: 0.778999984; }
        frame 18 { x: -10000; y: 40.7000008; skew-x: 1.5; skew-y: 1.5; scale-y: 0.786000013; }
        frame 19 { x: 43.5; y: 40.0999985; skew-x: 0.800000012; skew-y: 0.800000012; scale-y: 0.792999983; }
        frame 20 { x: -10000; y: 39.5; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 21 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 22 { x: 42.5; y: 39.2999992; skew-y: -0.400000006; scale-x: 0.768999994; scale-y: 0.818000019; }
        frame 23 { x: 41.5; y: 39.0999985; skew-y: -0.899999976; scale-x: 0.736999989; scale-y: 0.834999979; }
        frame 24 { x: 40.5; y: 38.9000015; skew-y: -1.39999998; scale-x: 0.70599997; scale-y: 0.852999985; }
        frame 25 { x: 39.5999985; y: 38.7999992; skew-y: -1.89999998; scale-x: 0.674000025; scale-y: 0.870000005; }
        frame 26 { x: 38.5; y: 38.5; skew-y: -2.4000001; scale-x: 0.643000007; scale-y: 0.888000011; }
        frame 27 { x: 37.5999985; y: 38.2999992; skew-y: -2.9000001; scale-x: 0.611000001; scale-y: 0.904999971; }
        frame 28 { x: 45.4000015; y: 40; skew-y: -1.39999998; scale-x: 0.70599997; scale-y: 0.765999973; }
        frame 29 { x: 53; y: 41.5999985; skew-y: 0; scale-x: 0.800000012; scale-y: 0.626999974; }
        frame 30 { x: 51.4000015; y: 41.2999992; skew-y: -10000; scale-x: -10000; scale-y: 0.656000018; }
        frame 31 { x: 49.7999992; y: 40.9000015; scale-y: 0.685000002; }
        frame 32 { x: 48.2999992; y: 40.5; scale-y: 0.713999987; }
        frame 33 { x: 46.7000008; y: 40.2000008; scale-y: 0.741999984; }
        frame 34 { x: 45.0999985; y: 39.9000015; scale-y: 0.771000028; }
        frame 35 { x: 43.5; y: 39.5; scale-y: 0.800000012; }
        frame 36 { x: -10000; y: -10000; scale-y: -10000; }
        frame 37 { x: 43; y: 39; scale-y: 0.82099998; }
        frame 38 { x: 42.5; y: 38.5; scale-y: 0.842000008; }
        frame 39 { x: 42; y: 38; scale-y: 0.861999989; }
        frame 40 { x: -10000; y: 37.5999985; skew-x: -1.89999998; scale-x: 0.800999999; scale-y: -10000; }
        frame 41 { y: 37.0999985; skew-x: -4; scale-x: 0.801999986; }
        frame 42 { x: 41.7999992; y: 44.7999992; skew-x: -2.70000005; scale-x: 0.800999999; }
        frame 43 { x: 41.9000015; y: 49.5; skew-x: -1.20000005; scale-x: -10000; }
        frame 44 { x: 42; y: 54.2999992; skew-x: 0; scale-x: 0.800000012; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; cel: -1; }
        frame 46 { cel: -10000; }
        frame 63 { cel: 0; }
        frame 64 { x: 42; y: 48.5; skew-x: -1.20000005; scale-x: 0.800999999; cel: -10000; }
        frame 65 { x: -10000; y: 42.9000015; skew-x: -2.70000005; scale-x: -10000; }
        frame 66 { x: 42; y: 37.0999985; skew-x: -4; scale-x: 0.801999986; }
        frame 67 { x: 42.5; y: 38; skew-x: -2.70000005; scale-x: 0.800999999; scale-y: 0.842000008; }
        frame 68 { x: 43; y: 38.7999992; skew-x: -1.20000005; scale-x: -10000; scale-y: 0.82099998; }
        frame 69 { x: 43.5; y: 39.5; skew-x: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 43.0999985; y: 39.5999985; skew-x: -1.89999998; skew-y: -1.89999998; scale-y: 0.771000028; }
        frame 72 { x: 42.9000015; y: -10000; skew-x: -4.19999981; skew-y: -4.19999981; scale-y: 0.741999984; }
        frame 73 { x: 43; y: 40; skew-x: -3.20000005; skew-y: -3.20000005; scale-y: 0.753000021; }
        frame 74 { x: 43.0999985; y: 40.4000015; skew-x: -2.4000001; skew-y: -2.4000001; scale-y: 0.764999986; }
        frame 75 { x: 43.2000008; y: 40.5999985; skew-x: -1.5; skew-y: -1.5; scale-y: 0.77700001; }
        frame 76 { x: 43.4000015; y: 41; skew-x: -0.699999988; skew-y: -0.699999988; scale-y: 0.787999988; }
        frame 77 { x: 43.5; y: 41.5; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
        frame 78 { x: 43.7000008; y: 42.4000015; skew-x: 2.29999995; skew-y: 2.29999995; scale-y: 0.778999984; }
        frame 79 { x: 43.9000015; y: 43.0999985; skew-x: 4.80000019; skew-y: 4.80000019; scale-y: 0.758000016; }
        frame 80 { x: 43.7999992; y: 42.5999985; skew-x: 4; skew-y: 4; scale-y: 0.764999986; }
        frame 81 { x: -10000; y: 42; skew-x: 3.0999999; skew-y: 3.0999999; scale-y: 0.772000015; }
        frame 82 { x: 43.5999985; y: 41.4000015; skew-x: 2.29999995; skew-y: 2.29999995; scale-y: 0.778999984; }
        frame 83 { x: -10000; y: 40.7000008; skew-x: 1.5; skew-y: 1.5; scale-y: 0.786000013; }
        frame 84 { x: 43.5; y: 40.0999985; skew-x: 0.800000012; skew-y: 0.800000012; scale-y: 0.792999983; }
        frame 85 { x: -10000; y: 39.5; skew-x: 0; skew-y: 0; scale-y: 0.800000012; }
    }
    Track {
        source-name: "anim_eye1";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { x: 33.4000015; y: 36.5999985; scale-x: 0.800000012; scale-y: 0.439999998; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_EYE1; }
        frame 2 { x: 33.2999992; y: 38.4000015; skew-x: -4.19999981; skew-y: -4.19999981; scale-x: -10000; scale-y: 0.123999998; cel: -10000; image: none; }
        frame 3 { x: 33.4000015; y: 36.5999985; skew-x: 0; skew-y: 0; scale-y: 0.439999998; }
        frame 4 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 5 { y: 34.9000015; scale-y: 0.800000012; cel: 0; }
        frame 6 { y: 35.0999985; scale-y: -10000; cel: -10000; }
        frame 7 { y: 35.4000015; }
        frame 8 { y: 35.5999985; }
        frame 9 { y: 35.9000015; }
        frame 10 { y: 36.0999985; }
        frame 11 { y: 36.4000015; }
        frame 12 { y: 36.5999985; }
        frame 13 { y: 36.5; }
        frame 14 { y: 36.2000008; }
        frame 15 { y: 36; }
        frame 16 { y: 35.7999992; }
        frame 17 { y: 35.5; }
        frame 18 { y: 35.2999992; }
        frame 19 { y: 35.0999985; }
        frame 20 { y: 34.9000015; }
        frame 21 { y: -10000; }
        frame 22 { x: 33; skew-y: -0.400000006; }
        frame 23 { x: 32.5; skew-y: -0.899999976; }
        frame 24 { x: 32.2999992; y: 34.7999992; skew-y: -1.39999998; }
        frame 25 { x: 31.8999996; y: 34.9000015; skew-y: -1.89999998; scale-y: 0.800999999; }
        frame 26 { x: 31.5; y: -10000; skew-y: -2.4000001; scale-y: -10000; }
        frame 27 { x: 31.1000004; skew-y: -2.9000001; }
        frame 28 { x: 35.0999985; skew-y: 2.29999995; scale-y: 0.80400002; }
        frame 29 { x: 39.2999992; skew-y: 7.9000001; scale-y: 0.808000028; }
        frame 30 { x: 38.2999992; skew-y: 6.5; scale-y: 0.805999994; }
        frame 31 { x: 37.2999992; skew-y: 5.30000019; scale-y: 0.805000007; }
        frame 32 { x: 36.2999992; skew-y: 3.79999995; scale-y: 0.80400002; }
        frame 33 { x: 35.2999992; skew-y: 2.5; scale-y: 0.801999986; }
        frame 34 { x: 34.2999992; skew-y: 1.29999995; scale-y: 0.800999999; }
        frame 35 { x: 33.4000015; skew-y: 0; scale-y: 0.800000012; }
        frame 36 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 37 { x: 33.2999992; y: 34; scale-x: 0.838; scale-y: 0.901000023; }
        frame 38 { x: -10000; y: 33; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.875; scale-y: 1.00100005; }
        frame 39 { x: 33.0999985; y: 32.2000008; skew-x: 0.600000024; skew-y: 0.600000024; scale-x: 0.912999988; scale-y: 1.102; }
        frame 40 { x: 33.2000008; y: 32.0999985; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 33.0999985; y: 32.2000008; skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 42 { x: 33; y: 41.4000015; skew-x: 0.5; skew-y: 0.5; }
        frame 43 { x: 32.9000015; y: 53.9000015; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 32.7000008; y: 66.5; skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 45 { x: 32.4000015; y: 65.9000015; skew-x: 0.5; skew-y: 0.5; scale-x: 0.962000012; scale-y: 1.15999997; }
        frame 46 { x: 32; y: 65.3000031; skew-x: -10000; skew-y: -10000; scale-x: 1.00999999; scale-y: 1.21899998; }
        frame 47 { x: 31.6000004; y: 64.8000031; scale-x: 1.05900002; scale-y: 1.27699995; }
        frame 48 { x: 31.2000008; y: 64.3000031; skew-x: 0.600000024; skew-y: 0.600000024; scale-x: 1.10699999; scale-y: 1.33599997; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { skew-x: 0.5; skew-y: 0.5; }
        frame 51 { skew-x: -10000; skew-y: -10000; }
        frame 54 { skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 55 { skew-x: 0.5; skew-y: 0.5; }
        frame 56 { skew-x: -10000; skew-y: -10000; }
        frame 59 { skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 60 { skew-x: -10000; skew-y: -10000; }
        frame 61 { x: 31.7000008; y: 65; skew-x: 0.5; skew-y: 0.5; scale-x: 1.04299998; scale-y: 1.25800002; }
        frame 62 { x: 32.0999985; y: 65.6999969; skew-x: -10000; skew-y: -10000; scale-x: 0.977999985; scale-y: 1.17999995; }
        frame 63 { x: 32.7000008; y: 66.5; skew-x: 0.600000024; skew-y: 0.600000024; scale-x: 0.912999988; scale-y: 1.102; }
        frame 64 { x: 32.9000015; y: 55; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 33; y: 43.5; skew-x: -10000; skew-y: -10000; }
        frame 66 { x: 33.0999985; y: 32.2000008; skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 67 { x: 33.2999992; y: 33.0999985; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.875; scale-y: 1.00100005; }
        frame 68 { x: 33.2000008; y: 34; skew-x: 0; skew-y: 0; scale-x: 0.838; scale-y: 0.901000023; }
        frame 69 { x: 33.4000015; y: 34.9000015; skew-x: -10000; skew-y: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 70 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { y: 35.0999985; }
        frame 72 { y: 35.4000015; }
        frame 73 { y: 35.5999985; }
        frame 74 { y: 35.9000015; }
        frame 75 { y: 36.0999985; }
        frame 76 { y: 36.4000015; }
        frame 77 { y: 36.5999985; }
        frame 78 { y: 36.5; }
        frame 79 { y: 36.2000008; }
        frame 80 { y: 36; }
        frame 81 { y: 35.7999992; }
        frame 82 { y: 35.5; }
        frame 83 { y: 35.2999992; }
        frame 84 { y: 35.0999985; }
        frame 85 { y: 34.9000015; }
    }
    Track {
        source-name: "ScaredyShroom_eye_big1";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 49 { x: 31.2999992; y: 64; scale-x: 0.910000026; scale-y: 0.910000026; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_EYE_BIG; }
        frame 50 { x: 30.8999996; y: 63.5999985; scale-x: 0.944000006; scale-y: 0.944000006; cel: -10000; image: none; }
        frame 51 { x: 30.6000004; y: 63; scale-x: 0.977999985; scale-y: 0.977999985; }
        frame 52 { x: 31; y: 63.5; scale-x: 0.944000006; scale-y: 0.944000006; }
        frame 53 { x: 31.2999992; y: 64; scale-x: 0.910000026; scale-y: 0.910000026; }
        frame 54 { x: 30.8999996; y: 63.5999985; scale-x: 0.944000006; scale-y: 0.944000006; }
        frame 55 { x: 30.6000004; y: 63; scale-x: 0.977999985; scale-y: 0.977999985; }
        frame 56 { x: 31; y: 63.5; scale-x: 0.944000006; scale-y: 0.944000006; }
        frame 57 { x: 31.2999992; y: 64; scale-x: 0.910000026; scale-y: 0.910000026; }
        frame 58 { x: 30.8999996; y: 63.5999985; scale-x: 0.944000006; scale-y: 0.944000006; }
        frame 59 { x: 30.6000004; y: 63; scale-x: 0.977999985; scale-y: 0.977999985; }
        frame 60 { x: 31.2999992; y: 64; scale-x: 0.910000026; scale-y: 0.910000026; }
        frame 61 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 63 { cel: -1; }
        frame 64 { cel: -10000; }
    }
    Track {
        source-name: "ScaredyShroom_head";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 5.19999981; y: 6.5999999; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_HEAD; }
        frame 6 { x: -10000; y: 6.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 6.30000019; }
        frame 8 { y: 6.9000001; }
        frame 9 { y: 7.5; }
        frame 10 { y: 8; }
        frame 11 { y: 8.60000038; }
        frame 12 { y: 9.10000038; }
        frame 13 { x: 4.4000001; y: 10.3000002; scale-x: 0.827000022; scale-y: 0.778999984; }
        frame 14 { x: 3.5; y: 11.3999996; scale-x: 0.853999972; scale-y: 0.758000016; }
        frame 15 { x: 3.79999995; y: 10.6000004; scale-x: 0.845000029; scale-y: 0.764999986; }
        frame 16 { x: 4.0999999; y: 9.69999981; scale-x: 0.836000025; scale-y: 0.772000015; }
        frame 17 { x: 4.30000019; y: 8.89999962; scale-x: 0.827000022; scale-y: 0.778999984; }
        frame 18 { x: 4.5999999; y: 8.19999981; scale-x: 0.818000019; scale-y: 0.786000013; }
        frame 19 { x: 4.9000001; y: 7.30000019; scale-x: 0.809000015; scale-y: 0.792999983; }
        frame 20 { x: 5.19999981; y: 6.5999999; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 21 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 3.79999995; y: 7.19999981; skew-x: -0.699999988; skew-y: -1.20000005; }
        frame 23 { x: 2.4000001; y: 7.80000019; skew-x: -1.39999998; skew-y: -2.4000001; }
        frame 24 { x: 1.10000002; y: 8.30000019; skew-x: -2.20000005; skew-y: -3.70000005; }
        frame 25 { x: -0.200000003; y: 9; skew-x: -2.9000001; skew-y: -4.9000001; }
        frame 26 { x: -1.60000002; y: 9.5; skew-x: -3.70000005; skew-y: -6.19999981; }
        frame 27 { x: -2.9000001; y: 10.1999998; skew-x: -4.4000001; skew-y: -7.4000001; scale-y: 0.800999999; }
        frame 28 { x: 3.0999999; y: 7.69999981; skew-x: -1; skew-y: -0.699999988; scale-x: 0.77700001; scale-y: 0.829999983; }
        frame 29 { x: 26.6000004; y: 3.0999999; skew-x: 14.3000002; skew-y: 21.7000008; scale-x: 0.838; scale-y: 0.800999999; }
        frame 30 { x: 24.1000004; y: 3.79999995; skew-x: 11; skew-y: 16.7999992; scale-x: 0.768999994; scale-y: 0.825999975; }
        frame 31 { x: 21.7000008; y: 4.30000019; skew-x: 8; skew-y: 11.8000002; scale-x: 0.699999988; scale-y: 0.852999985; }
        frame 32 { x: 17.5; y: 4.69999981; skew-x: 6; skew-y: 8.80000019; scale-x: 0.725000024; scale-y: 0.838999987; }
        frame 33 { x: 13.3999996; y: 5.19999981; skew-x: 4; skew-y: 5.80000019; scale-x: 0.75; scale-y: 0.825999975; }
        frame 34 { x: 9.30000019; y: 5.9000001; skew-x: 2; skew-y: 2.79999995; scale-x: 0.774999976; scale-y: 0.813000023; }
        frame 35 { x: 5.19999981; y: 6.5999999; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { y: 5.5999999; }
        frame 38 { y: 4.69999981; }
        frame 39 { y: 3.70000005; }
        frame 40 { y: 2.5999999; scale-y: 0.811999977; }
        frame 41 { y: 1.60000002; scale-y: 0.823000014; }
        frame 42 { x: 8.60000038; y: 11; skew-x: 8.5; skew-y: 8.80000019; scale-x: 0.823000014; scale-y: 0.814999998; }
        frame 43 { x: 12.5; y: 20.6000004; skew-x: 17; skew-y: 17.5; scale-x: 0.847000003; scale-y: 0.805999994; }
        frame 44 { x: 16.7999992; y: 30.7000008; skew-x: 25.7000008; skew-y: 26.3999996; scale-x: 0.870999992; scale-y: 0.799000025; }
        frame 45 { x: 13.1999998; y: 33.5999985; skew-x: 23.1000004; skew-y: 26.2999992; scale-x: 0.91900003; scale-y: 0.742999971; }
        frame 46 { x: 9.39999962; y: 36.9000015; skew-x: 20.5; skew-y: -10000; scale-x: 0.968999982; scale-y: 0.689999998; }
        frame 47 { x: 13.1000004; y: 32.5999985; skew-x: 23.1000004; scale-x: 0.91900003; scale-y: 0.742999971; }
        frame 48 { x: 16.7999992; y: 28.2999992; skew-x: 25.7000008; skew-y: 26.3999996; scale-x: 0.870999992; scale-y: 0.799000025; alpha: 0; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 50 { cel: -10000; }
        frame 61 { x: 18.7999992; y: 29.2999992; skew-x: 25.6000004; skew-y: 26.2999992; scale-x: 0.799000025; cel: 0; alpha: 1; }
        frame 62 { x: 17.8999996; y: 30.1000004; skew-x: -10000; skew-y: -10000; scale-x: 0.833999991; scale-y: 0.797999978; cel: -10000; alpha: -10000; }
        frame 63 { x: 16.7999992; y: 30.7000008; skew-x: 25.7000008; skew-y: 26.3999996; scale-x: 0.870999992; scale-y: 0.799000025; }
        frame 64 { x: 12.6000004; y: 20.7000008; skew-x: 17; skew-y: 17.5; scale-x: 0.847000003; scale-y: 0.805999994; }
        frame 65 { x: 8.80000019; y: 11.1000004; skew-x: 8.5; skew-y: 8.80000019; scale-x: 0.823000014; scale-y: 0.814999998; }
        frame 66 { x: 5.19999981; y: 1.60000002; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.823000014; }
        frame 67 { x: -10000; y: 3.29999995; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.814999998; }
        frame 68 { y: 4.9000001; scale-y: 0.808000028; }
        frame 69 { y: 6.5999999; scale-y: 0.800000012; }
        frame 70 { x: 17.7000008; y: 2.29999995; skew-x: 20.2999992; skew-y: 20.2999992; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 71 { x: 17.8999996; y: 1.5; skew-x: 20.7999992; skew-y: 19.6000004; scale-x: 0.791999996; scale-y: 0.81099999; }
        frame 72 { x: 18.1000004; y: 0.600000024; skew-x: 21.5; skew-y: 19.1000004; scale-x: 0.787; scale-y: 0.824000001; }
        frame 73 { x: 17.8999996; y: 1.5; skew-x: 21.1000004; skew-y: 19.2999992; scale-x: 0.787999988; scale-y: 0.818000019; }
        frame 74 { x: -10000; y: 2.29999995; skew-x: 20.7999992; skew-y: 19.5; scale-x: 0.791000009; scale-y: 0.813000023; }
        frame 75 { x: 17.7999992; y: 3.0999999; skew-x: 20.6000004; skew-y: 19.7999992; scale-x: 0.792999983; scale-y: 0.808000028; }
        frame 76 { x: -10000; y: 3.9000001; skew-x: 20.2999992; skew-y: 20; scale-x: 0.795000017; scale-y: 0.802999973; }
        frame 77 { x: 17.7000008; y: 4.5999999; skew-x: -10000; skew-y: 20.2999992; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 78 { x: 17.3999996; y: 5; skew-x: 19.6000004; skew-y: 20.7999992; scale-x: 0.810000002; scale-y: 0.791000009; }
        frame 79 { x: 17.1000004; y: 5.30000019; skew-x: 19.2000008; skew-y: 21.3999996; scale-x: 0.823000014; scale-y: 0.786000013; }
        frame 80 { x: 17.2000008; y: 4.80000019; skew-x: 19.2999992; skew-y: 21.1000004; scale-x: 0.818000019; scale-y: 0.787; }
        frame 81 { x: 17.3999996; y: 4.30000019; skew-x: 19.5; skew-y: 21; scale-x: 0.81400001; scale-y: 0.788999975; }
        frame 82 { x: 17.5; y: 3.9000001; skew-x: 19.6000004; skew-y: 20.7999992; scale-x: 0.810000002; scale-y: 0.791000009; }
        frame 83 { x: -10000; y: 3.4000001; skew-x: 19.7999992; skew-y: 20.6000004; scale-x: 0.805999994; scale-y: 0.79400003; }
        frame 84 { x: 17.6000004; y: 2.9000001; skew-x: 20; skew-y: 20.2999992; scale-x: 0.801999986; scale-y: 0.796000004; }
        frame 85 { x: 17.7000008; y: 2.29999995; skew-x: 20.2999992; skew-y: -10000; scale-x: 0.799000025; scale-y: 0.799000025; }
    }
    Track {
        source-name: "ScaredyShroom_head2";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 46 { x: 14.8000002; y: 36.7999992; skew-x: 23.3999996; skew-y: 33.4000015; scale-x: 0.908999979; scale-y: 0.74000001; cel: 0; alpha: 0.270000011; image: IMAGE_REANIM_SCAREDYSHROOM_HEAD2; }
        frame 47 { x: 17.7999992; y: 32.5; skew-x: 25.5; skew-y: 32; scale-x: 0.870999992; scale-y: 0.778999984; cel: -10000; alpha: 1; image: none; }
        frame 48 { x: 21; y: 28.3999996; skew-x: 27.7000008; skew-y: 30.7000008; scale-x: 0.833000004; scale-y: 0.819999993; alpha: -10000; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 20.7999992; y: 29.1000004; skew-x: 27.1000004; skew-y: 31.6000004; scale-x: 0.842999995; scale-y: 0.814999998; }
        frame 51 { x: 20.5; y: 29.8999996; skew-x: 26.3999996; skew-y: 32.4000015; scale-x: 0.851999998; scale-y: 0.813000023; }
        frame 52 { x: 20.7999992; y: 28.6000004; skew-x: 26.8999996; skew-y: 31.8999996; scale-x: 0.845000029; scale-y: 0.814999998; }
        frame 53 { x: -10000; y: 27.2999992; skew-x: 27.3999996; skew-y: 31.2999992; scale-x: 0.839999974; scale-y: 0.815999985; }
        frame 54 { x: 21; y: 26; skew-x: 27.7000008; skew-y: 30.7000008; scale-x: 0.833000004; scale-y: 0.819999993; }
        frame 55 { x: 21.2999992; y: 24.7999992; skew-x: 29.2000008; skew-y: 29.5; scale-x: 0.82099998; scale-y: -10000; }
        frame 56 { x: 21.3999996; y: 23.5; skew-x: 30.5; skew-y: 28.2000008; scale-x: 0.810000002; scale-y: 0.82099998; }
        frame 57 { x: 21.2999992; y: 25.2000008; skew-x: 29.6000004; skew-y: 29.1000004; scale-x: 0.816999972; scale-y: 0.819999993; }
        frame 58 { x: 21.2000008; y: 26.7999992; skew-x: 28.7000008; skew-y: 30; scale-x: 0.824999988; scale-y: 0.819000006; }
        frame 59 { x: 21; y: 28.3999996; skew-x: 27.7000008; skew-y: 30.7000008; scale-x: 0.833000004; scale-y: 0.819999993; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 21.1000004; y: 29.2999992; skew-x: 27.7999992; skew-y: 30.7999992; scale-y: 0.819000006; alpha: 0.670000017; }
        frame 62 { x: -10000; y: 30.2000008; skew-x: -10000; skew-y: -10000; scale-y: -10000; alpha: 0.330000013; }
        frame 63 { x: 21; y: 31.1000004; skew-x: 27.7000008; skew-y: 30.7000008; scale-y: 0.819999993; alpha: 0; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; alpha: -10000; }
        frame 66 { cel: -1; }
        frame 67 { cel: -10000; }
    }
    Track {
        source-name: "ScaredyShroom_eyebrow1";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 28.2000008; y: 30; scale-x: 1.01800001; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_EYEBROW1; }
        frame 6 { x: 28; y: 30.2000008; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 27.7999992; y: 30.3999996; skew-x: -9.69999981; skew-y: -9.69999981; }
        frame 8 { x: 27.7000008; y: 30.7000008; skew-x: -14.8999996; skew-y: -14.8999996; }
        frame 9 { x: 27.7999992; y: 32; skew-x: -14.6999998; skew-y: -14.6999998; scale-x: 1.01699996; scale-y: 0.799000025; }
        frame 10 { x: -10000; y: 33.2000008; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { y: 34.5; }
        frame 12 { x: 27.7000008; y: 35.7999992; skew-x: -14.8999996; skew-y: -14.8999996; scale-x: 1.01800001; scale-y: 0.800000012; }
        frame 13 { x: 27.8999996; y: 35; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 28.2999992; y: 34.2999992; skew-x: 3.9000001; skew-y: 3.9000001; }
        frame 15 { x: -10000; y: 33.5; skew-x: 3.29999995; skew-y: 3.29999995; scale-x: 1.01699996; scale-y: 0.799000025; }
        frame 16 { y: 32.7999992; skew-x: 2.5; skew-y: 2.5; scale-x: 1.01800001; scale-y: 0.800000012; }
        frame 17 { x: 28.2000008; y: 32.0999985; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 28.2999992; y: 31.3999996; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 19 { x: -10000; y: 30.7000008; skew-x: 0.5; skew-y: 0.5; }
        frame 20 { x: 28.2000008; y: 30; skew-x: 0; skew-y: 0; }
        frame 21 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 22 { x: 27.3999996; y: 29.8999996; skew-x: -1; skew-y: -1.5; }
        frame 23 { x: 26.5; y: 29.7999992; skew-x: -2.20000005; skew-y: -3.20000005; }
        frame 24 { x: 25.7000008; y: -10000; skew-x: -3.4000001; skew-y: -4.9000001; }
        frame 25 { x: 24.8999996; y: 29.7000008; skew-x: -4.69999981; skew-y: -6.69999981; }
        frame 26 { x: 24; y: 29.6000004; skew-x: -5.9000001; skew-y: -8.39999962; scale-x: 1.01699996; }
        frame 27 { x: 23.1000004; y: 29.5; skew-x: -7.19999981; skew-y: -10.1999998; scale-x: 1.01800001; scale-y: 0.800999999; }
        frame 28 { x: 25.1000004; y: 31.5; skew-x: -10; skew-y: -10.3999996; scale-x: 1.023; scale-y: 0.796999991; }
        frame 29 { x: 38; y: 34.9000015; skew-x: 10.8999996; skew-y: 18.6000004; scale-x: 1.04100001; scale-y: 0.787; }
        frame 30 { x: 36.5; y: 35; skew-x: 7.80000019; skew-y: 13.6000004; scale-x: 1.03699994; scale-y: 0.788999975; }
        frame 31 { x: 35.0999985; y: 35.0999985; skew-x: 4.80000019; skew-y: 8.80000019; scale-x: 1.03299999; scale-y: 0.791000009; }
        frame 32 { x: 33.5; y: 33.9000015; skew-x: 3.5; skew-y: 6.5; scale-x: 1.02900004; scale-y: 0.792999983; }
        frame 33 { x: 31.7000008; y: 32.5; skew-x: 2.29999995; skew-y: 4.30000019; scale-x: 1.02600002; scale-y: 0.795000017; }
        frame 34 { x: 30; y: 31.3999996; skew-x: 1; skew-y: 2.0999999; scale-x: 1.02199996; scale-y: 0.797999978; }
        frame 35 { x: 28.2000008; y: 30; skew-x: 0; skew-y: 0; scale-x: 1.01800001; scale-y: 0.800000012; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 27.6000004; y: 29.2000008; skew-x: -8.5; skew-y: -8.5; scale-x: 1.01699996; scale-y: 0.799000025; }
        frame 38 { x: 27.2000008; y: 28.5; skew-x: -17.2000008; skew-y: -17.2000008; scale-x: 1.01600003; scale-y: -10000; }
        frame 39 { x: 26.7999992; y: 27.6000004; skew-x: -26; skew-y: -26; scale-x: 1.01699996; }
        frame 40 { x: 26.8999996; y: 27; skew-x: -10000; skew-y: -10000; scale-x: 1.01499999; scale-y: 0.796999991; }
        frame 41 { x: 26.7999992; y: 26.3999996; scale-x: 1.01600003; scale-y: 0.797999978; }
        frame 42 { x: 26.6000004; y: 41.2999992; skew-x: -28.2000008; skew-y: -28.2000008; scale-x: 1.01400006; scale-y: 0.796999991; }
        frame 43 { x: 26.3999996; y: 56; skew-x: -30.7000008; skew-y: -30.7000008; scale-x: 1.01499999; scale-y: -10000; }
        frame 44 { x: 26.1000004; y: 70.8000031; skew-x: -33; skew-y: -33; scale-x: 1.01600003; scale-y: 0.799000025; }
        frame 45 { x: -10000; y: 69.1999969; skew-x: -10000; skew-y: -10000; scale-x: 1.01499999; scale-y: 0.796999991; }
        frame 46 { y: 67.6999969; scale-x: -10000; scale-y: -10000; }
        frame 47 { y: 66.1999969; }
        frame 48 { y: 64.5999985; scale-x: 1.01600003; scale-y: 0.799000025; }
        frame 49 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { y: 64.3000031; scale-x: 1.01499999; scale-y: 0.796999991; }
        frame 51 { y: 64.0999985; scale-x: -10000; scale-y: -10000; }
        frame 52 { y: 63.7999992; }
        frame 53 { y: 63.5; }
        frame 54 { y: 63.2999992; scale-x: 1.01600003; scale-y: 0.799000025; }
        frame 55 { y: 63.5; scale-x: 1.01499999; scale-y: 0.796999991; }
        frame 56 { y: 63.7999992; scale-x: -10000; scale-y: -10000; }
        frame 57 { y: 64.0999985; }
        frame 58 { y: 64.3000031; }
        frame 59 { y: 64.5999985; scale-x: 1.01600003; scale-y: 0.799000025; }
        frame 60 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { y: 66.6999969; scale-x: 1.01499999; scale-y: 0.796999991; }
        frame 62 { y: 68.6999969; scale-x: -10000; scale-y: -10000; }
        frame 63 { y: 70.8000031; scale-x: 1.01600003; scale-y: 0.799000025; }
        frame 64 { x: 26.3999996; y: 56; skew-x: -30.7000008; skew-y: -30.7000008; scale-x: 1.01499999; scale-y: 0.796999991; }
        frame 65 { x: 26.6000004; y: 41.0999985; skew-x: -28.2000008; skew-y: -28.2000008; scale-x: 1.01400006; scale-y: -10000; }
        frame 66 { x: 26.7999992; y: 26.3999996; skew-x: -26; skew-y: -26; scale-x: 1.01600003; scale-y: 0.797999978; }
        frame 67 { x: 27.2000008; y: 27.6000004; skew-x: -17.2000008; skew-y: -17.2000008; scale-x: 1.01499999; scale-y: -10000; }
        frame 68 { x: 27.6000004; y: 28.7999992; skew-x: -8.5; skew-y: -8.5; scale-x: 1.01699996; scale-y: 0.799000025; }
        frame 69 { x: 28.2000008; y: 30; skew-x: 0; skew-y: 0; scale-x: 1.01800001; scale-y: 0.800000012; }
        frame 70 { x: -10000; y: 36.4000015; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 28.2999992; y: 35.5999985; }
        frame 72 { x: -10000; y: 34.9000015; }
        frame 73 { y: 35.2999992; }
        frame 74 { y: 35.7999992; }
        frame 75 { x: 28.3999996; y: 36.2999992; }
        frame 76 { x: -10000; y: 36.7999992; }
        frame 77 { y: 37.2000008; }
        frame 78 { y: 37.5999985; }
        frame 79 { y: 38.0999985; }
        frame 80 { x: 28.2999992; y: 37.7999992; }
        frame 81 { x: -10000; y: 37.5; }
        frame 82 { y: 37.2999992; }
        frame 83 { x: 28.2000008; y: 37; }
        frame 84 { x: -10000; y: 36.7000008; }
        frame 85 { y: 36.4000015; }
    }
    Track {
        source-name: "ScaredyShroom_eyebrow2";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 38.5999985; y: 26.5; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_EYEBROW2; }
        frame 6 { x: 39.5999985; y: 25.3999996; skew-x: 9.80000019; skew-y: 9.80000019; scale-x: 0.999000013; scale-y: 0.999000013; cel: -10000; image: none; }
        frame 7 { x: 40.9000015; y: 24.3999996; skew-x: 20; skew-y: 20; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 42; y: 23.7000008; skew-x: 30; skew-y: 30; scale-x: 1; scale-y: 1; }
        frame 9 { x: -10000; y: 24.8999996; skew-x: 29.8999996; skew-y: 29.8999996; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 10 { y: 26.2000008; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { y: 27.5; }
        frame 12 { y: 28.7999992; skew-x: 30; skew-y: 30; scale-x: 1; scale-y: 1; }
        frame 13 { x: 40.5999985; y: 29.6000004; skew-x: 18.6000004; skew-y: 18.6000004; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 14 { x: 39.2999992; y: 30.7000008; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 15 { x: -10000; y: 30.1000004; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 39.0999985; y: 29.2999992; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 17 { x: 39; y: 28.6000004; skew-x: 3.5; skew-y: 3.5; }
        frame 18 { x: 38.9000015; y: 27.8999996; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 19 { x: 38.7999992; y: 27.2999992; skew-x: 1.10000002; skew-y: 1.10000002; scale-x: 1; scale-y: 1; }
        frame 20 { x: 38.5999985; y: 26.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 22 { x: 37.5999985; y: 26.2000008; skew-x: -1; skew-y: -1.5; }
        frame 23 { x: 36.5999985; y: 25.8999996; skew-x: -2.20000005; skew-y: -3.20000005; }
        frame 24 { x: 35.7999992; y: 25.6000004; skew-x: -3.4000001; skew-y: -4.9000001; }
        frame 25 { x: 34.7999992; y: 25.2999992; skew-x: -4.69999981; skew-y: -6.69999981; scale-x: 0.999000013; }
        frame 26 { x: 33.7999992; y: 24.8999996; skew-x: -5.9000001; skew-y: -8.39999962; scale-x: -10000; }
        frame 27 { x: 32.7999992; y: 24.7000008; skew-x: -7.19999981; skew-y: -10.1999998; scale-x: 1; scale-y: 1.00100005; }
        frame 28 { x: 34.0999985; y: 26.3999996; skew-x: -13; skew-y: -13.3999996; scale-x: 1.005; scale-y: 0.995999992; }
        frame 29 { x: 47.2999992; y: 33.2999992; skew-x: -1; skew-y: 6.5999999; scale-x: 1.023; scale-y: 0.984000027; }
        frame 30 { x: 45.7999992; y: 33.0999985; skew-x: -1.89999998; skew-y: 3.5999999; scale-x: 1.01900005; scale-y: 0.986999989; }
        frame 31 { x: 44.2999992; y: 32.9000015; skew-x: -2.9000001; skew-y: 0.800000012; scale-x: 1.01499999; scale-y: 0.99000001; }
        frame 32 { x: 42.9000015; y: 31.2999992; skew-x: -2.20000005; skew-y: 0.5; scale-x: 1.01100004; scale-y: 0.991999984; }
        frame 33 { x: 41.5; y: 29.7000008; skew-x: -1.39999998; skew-y: 0.300000012; scale-x: 1.00800002; scale-y: 0.995000005; }
        frame 34 { x: 40; y: 28.1000004; skew-x: -0.699999988; skew-y: 0.100000001; scale-x: 1.00399995; scale-y: 0.996999979; }
        frame 35 { x: 38.5999985; y: 26.5; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 39.0999985; y: 24.2000008; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 38 { x: 39.7000008; y: 22; skew-x: 11.8000002; skew-y: 11.8000002; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 40.2999992; y: 19.8999996; skew-x: 17.7999992; skew-y: 17.7999992; }
        frame 40 { x: -10000; y: 19.3999996; skew-x: -10000; skew-y: -10000; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 41 { y: 18.7999992; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 40.9000015; y: 33; skew-x: 24.6000004; skew-y: 24.6000004; scale-x: 0.996999979; scale-y: 0.996999979; }
        frame 43 { x: 41.4000015; y: 47.4000015; skew-x: 31.3999996; skew-y: 31.3999996; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 41.9000015; y: 61.7999992; skew-x: 38.4000015; skew-y: 38.4000015; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 45 { x: 42.5; y: 60.2999992; skew-x: 38.2999992; skew-y: 38.2999992; scale-x: 0.995999992; scale-y: 0.995999992; }
        frame 46 { x: 43; y: 58.7999992; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 43.4000015; y: 57.2000008; }
        frame 48 { x: 43.9000015; y: 55.5999985; skew-x: 38.4000015; skew-y: 38.4000015; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { y: 55.4000015; skew-x: 38.2999992; skew-y: 38.2999992; scale-x: 0.995999992; scale-y: 0.995999992; }
        frame 51 { y: 55; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 52 { y: 54.5999985; }
        frame 53 { y: 54.2999992; }
        frame 54 { y: 53.9000015; skew-x: 38.4000015; skew-y: 38.4000015; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 55 { y: 54.2000008; skew-x: 38.2999992; skew-y: 38.2999992; scale-x: 0.995999992; scale-y: 0.995999992; }
        frame 56 { y: 54.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { y: 55; }
        frame 58 { y: 55.2999992; }
        frame 59 { y: 55.5999985; skew-x: 38.4000015; skew-y: 38.4000015; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 60 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 43.2999992; y: 57.7999992; skew-x: 38.2999992; skew-y: 38.2999992; scale-x: 0.995999992; scale-y: 0.995999992; }
        frame 62 { x: 42.5999985; y: 59.7999992; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 41.9000015; y: 61.7999992; skew-x: 38.4000015; skew-y: 38.4000015; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 64 { x: 41.2999992; y: 47.4000015; skew-x: 31.3999996; skew-y: 31.3999996; scale-x: 0.996999979; scale-y: 0.996999979; }
        frame 65 { x: 40.7999992; y: 33; skew-x: 24.6000004; skew-y: 24.6000004; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 40.2999992; y: 18.7999992; skew-x: 17.7999992; skew-y: 17.7999992; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 67 { x: 39.7000008; y: 21.2999992; skew-x: 11.8000002; skew-y: 11.8000002; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 39.0999985; y: 23.7999992; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 69 { x: 38.5999985; y: 26.5; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 70 { x: 44.5; y: 32; skew-x: 37.7999992; skew-y: 37.7999992; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 71 { x: 44.5999985; y: 31.2999992; skew-x: -10000; skew-y: -10000; scale-x: 0.995999992; scale-y: 0.995999992; }
        frame 72 { x: -10000; y: 30.6000004; scale-x: 0.996999979; scale-y: 0.996999979; }
        frame 73 { y: 31; scale-x: 0.995999992; scale-y: 0.995999992; }
        frame 74 { y: 31.6000004; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 44.5; y: 32.0999985; }
        frame 76 { x: -10000; y: 32.5999985; scale-x: 0.996999979; scale-y: 0.996999979; }
        frame 77 { y: 33.0999985; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 78 { y: 33.5; scale-x: 0.995999992; scale-y: 0.995999992; }
        frame 79 { y: 34; scale-x: 0.996999979; scale-y: 0.996999979; }
        frame 80 { x: 44.5999985; y: 33.5999985; scale-x: 0.995999992; scale-y: 0.995999992; }
        frame 81 { x: 44.5; y: 33.2999992; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: -10000; y: 33; }
        frame 83 { x: 44.5999985; y: 32.7000008; }
        frame 84 { x: 44.5; y: 32.4000015; scale-x: 0.996999979; scale-y: 0.996999979; }
        frame 85 { x: -10000; y: 32; scale-x: 0.998000026; scale-y: 0.998000026; }
    }
    Track {
        source-name: "ScaredyShroom_sweat2";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 50 { x: 44.0999985; y: 65.6999969; scale-x: 0.800000012; scale-y: 0.584999979; cel: 0; alpha: 0.349999994; image: IMAGE_REANIM_SCAREDYSHROOM_SWEAT; }
        frame 51 { x: 46.0999985; y: 63; scale-x: 1.13800001; scale-y: 0.832000017; cel: -10000; alpha: 1; image: none; }
        frame 52 { x: 49.0999985; y: 61.5; scale-x: -10000; scale-y: 1.13100004; alpha: 0.25999999; }
        frame 53 { x: 51.5999985; y: 56.7000008; scale-y: 1.39699996; alpha: 0; }
        frame 54 { x: -10000; y: -10000; scale-y: -10000; alpha: -10000; }
        frame 55 { x: 44.0999985; y: 65.6999969; scale-x: 0.800000012; scale-y: 0.584999979; alpha: 0.349999994; }
        frame 56 { x: 46.0999985; y: 63; scale-x: 1.13800001; scale-y: 0.832000017; alpha: 1; }
        frame 57 { x: 49.0999985; y: 61.5; scale-x: -10000; scale-y: 1.13100004; alpha: 0.25999999; }
        frame 58 { x: 51.5999985; y: 56.7000008; scale-y: 1.39699996; alpha: 0; }
        frame 59 { x: -10000; y: -10000; scale-y: -10000; alpha: -10000; }
        frame 60 { cel: -1; }
        frame 61 { cel: -10000; }
    }
    Track {
        source-name: "ScaredyShroom_sweat1";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 50 { x: 34.5; y: 66.3000031; skew-x: 180; scale-x: 0.800000012; scale-y: 0.584999979; cel: 0; alpha: 0.349999994; image: IMAGE_REANIM_SCAREDYSHROOM_SWEAT; }
        frame 51 { x: 32.5999985; y: 63; skew-x: -10000; scale-x: 1.13800001; scale-y: 0.832000017; cel: -10000; alpha: 1; image: none; }
        frame 52 { x: 28.2000008; y: 61.7999992; scale-x: -10000; scale-y: 1.13100004; alpha: 0.25999999; }
        frame 53 { x: 25.2000008; y: 56.7000008; scale-y: 1.39699996; alpha: 0; }
        frame 54 { x: -10000; y: -10000; scale-y: -10000; alpha: -10000; }
        frame 55 { x: 34.5; y: 66.3000031; scale-x: 0.800000012; scale-y: 0.584999979; alpha: 0.349999994; }
        frame 56 { x: 32.5999985; y: 63; scale-x: 1.13800001; scale-y: 0.832000017; alpha: 1; }
        frame 57 { x: 28.2000008; y: 61.7999992; scale-x: -10000; scale-y: 1.13100004; alpha: 0.25999999; }
        frame 58 { x: 25.2000008; y: 56.7000008; scale-y: 1.39699996; alpha: 0; }
        frame 59 { x: -10000; y: -10000; scale-y: -10000; alpha: -10000; }
        frame 60 { cel: -1; }
        frame 61 { cel: -10000; }
    }
}
