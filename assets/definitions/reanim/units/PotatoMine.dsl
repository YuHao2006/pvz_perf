export component PotatoMine {
    fps: 12;
    Track {
        source-name: "anim_armed";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 20 { cel: 0; }
        frame 21 { cel: -10000; }
        frame 31 { cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "anim_rise";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: 0; }
        frame 2 { cel: -10000; }
        frame 20 { cel: -1; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 37;
        frame 1 { cel: -1; }
        frame 2 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 32 { cel: 0; }
        frame 33 { cel: -10000; }
        frame 35 { cel: -1; }
        frame 36 { cel: -10000; }
    }
    Track {
        source-name: "anim_mashed";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 36 { x: -2.4000001; y: 22.2999992; scale-x: 0.639999986; scale-y: 0.639999986; cel: 0; image: IMAGE_REANIM_POTATOMINE_MASHED; }
    }
    Track {
        source-name: "PotatoMine_rock4";
        frame-count: 37;
        frame 0 { x: 38.5999985; y: 62.5999985; scale-x: 0.589999974; scale-y: 0.589999974; image: IMAGE_REANIM_POTATOMINE_ROCK4; }
        frame 1 { x: -10000; y: 63.0999985; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 63.5999985; }
        frame 3 { y: 63.0999985; }
        frame 4 { y: 62.5999985; }
        frame 5 { y: 63.0999985; }
        frame 6 { y: 63.5999985; }
        frame 7 { y: 63.0999985; }
        frame 8 { y: 62.5999985; }
        frame 9 { y: -10000; }
        frame 11 { x: 43.0999985; y: 62.2999992; }
        frame 12 { x: 47.5999985; y: 61.9000015; }
        frame 13 { x: 52.0999985; y: 61.5; }
        frame 14 { x: 56.7000008; y: 61.0999985; }
        frame 15 { x: 61.2000008; y: 60.7999992; }
        frame 16 { x: -10000; y: -10000; }
        frame 31 { cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock2";
        frame-count: 37;
        frame 0 { x: 23.8999996; y: 61.7999992; scale-x: 0.699999988; scale-y: 0.699999988; image: IMAGE_REANIM_POTATOMINE_ROCK2; }
        frame 1 { x: -10000; y: 59.7999992; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 61.7999992; }
        frame 3 { y: 59.7999992; }
        frame 4 { y: 61.7999992; }
        frame 5 { y: 59.7999992; }
        frame 6 { y: 61.7999992; }
        frame 7 { y: 59.7999992; }
        frame 8 { y: 61.7999992; }
        frame 9 { y: -10000; }
        frame 11 { x: 17.7000008; y: 61.5; }
        frame 12 { x: 11.5; y: 61.2999992; }
        frame 13 { x: 5.30000019; y: 61; }
        frame 14 { x: -0.800000012; y: 60.7000008; }
        frame 15 { x: -7; y: 60.4000015; }
        frame 16 { x: -10000; y: -10000; }
        frame 31 { cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 10 { x: 25; y: 67.3000031; scale-x: 0.264999986; scale-y: 0.0529999994; cel: 0; image: IMAGE_REANIM_POTATOMINE_BODY; }
        frame 11 { x: 19.6000004; y: 59.4000015; scale-x: 0.372000009; scale-y: 0.202999994; cel: -10000; image: none; }
        frame 12 { x: 14.1999998; y: 51.5; scale-x: 0.479000002; scale-y: 0.351999998; }
        frame 13 { x: 8.80000019; y: 43.5; scale-x: 0.586000025; scale-y: 0.500999987; }
        frame 14 { x: 3.4000001; y: 35.5999985; scale-x: 0.693000019; scale-y: 0.651000023; }
        frame 15 { x: -1.89999998; y: 27.7000008; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 16 { x: -10000; y: 24.8999996; scale-x: -10000; scale-y: 0.833999991; }
        frame 17 { y: 22; scale-y: 0.869000018; }
        frame 18 { y: 24.8999996; scale-y: 0.833999991; }
        frame 19 { y: 27.7000008; scale-y: 0.800000012; }
        frame 20 { y: -10000; scale-y: -10000; }
        frame 21 { x: -2.20000005; y: 28.2999992; scale-x: 0.808000028; scale-y: 0.791000009; }
        frame 22 { x: -2.70000005; y: 28.8999996; scale-x: 0.814999998; scale-y: 0.782000005; }
        frame 23 { x: -3.0999999; y: 29.5; scale-x: 0.823000014; scale-y: 0.772000015; }
        frame 24 { x: -3.4000001; y: 30.1000004; scale-x: 0.83099997; scale-y: 0.763000011; }
        frame 25 { x: -3.79999995; y: 30.7000008; scale-x: 0.838999987; scale-y: 0.754000008; }
        frame 26 { x: -3.4000001; y: 30.1000004; scale-x: 0.83099997; scale-y: 0.763000011; }
        frame 27 { x: -3.0999999; y: 29.5; scale-x: 0.823000014; scale-y: 0.772000015; }
        frame 28 { x: -2.70000005; y: 28.8999996; scale-x: 0.814999998; scale-y: 0.782000005; }
        frame 29 { x: -2.29999995; y: 28.2999992; scale-x: 0.808000028; scale-y: 0.791000009; }
        frame 30 { x: -1.89999998; y: 27.7000008; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 31 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_stem";
        frame-count: 37;
        frame 0 { x: 20.2999992; y: 57; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_POTATOMINE_STEM; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 11 { x: 22.2999992; y: 53.2000008; scale-x: 0.711000025; }
        frame 12 { x: 22.3999996; y: 49.5; scale-x: -10000; scale-y: 0.70599997; }
        frame 13 { x: 20.6000004; y: 44.2999992; scale-x: 0.754999995; scale-y: 0.658999979; }
        frame 14 { x: 19.1000004; y: 37; scale-x: 0.836000025; scale-y: 0.800000012; alpha: 0; }
        frame 15 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 16 { cel: -10000; }
    }
    Track {
        source-name: "anim_eye";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 10 { x: 33.5; y: 68.1999969; scale-x: 0.430999994; scale-y: 0.455000013; cel: 0; image: IMAGE_REANIM_POTATOMINE_EYES; }
        frame 11 { x: 34.5999985; y: 65.0999985; scale-x: 0.377999991; scale-y: 0.326000005; cel: -10000; image: none; }
        frame 12 { x: 33.5999985; y: 61.2999992; scale-x: 0.483999997; scale-y: 0.444999993; }
        frame 13 { x: 32.5999985; y: 57.5; scale-x: 0.588999987; scale-y: 0.563000023; }
        frame 14 { x: 31.7000008; y: 53.7999992; scale-x: 0.694999993; scale-y: 0.681999981; }
        frame 15 { x: 30.7000008; y: 50; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 16 { x: -10000; y: 48.7999992; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: 47.5999985; }
        frame 18 { y: 48.7999992; }
        frame 19 { y: 50; }
        frame 20 { y: -10000; }
        frame 21 { x: 30.7999992; y: 50.4000015; scale-y: 0.781000018; }
        frame 22 { x: 30.8999996; y: 50.7999992; scale-y: 0.762000024; }
        frame 23 { x: 31; y: 51.2000008; scale-y: 0.741999984; }
        frame 24 { y: 51.5; scale-y: 0.72299999; }
        frame 25 { x: 31.1000004; y: 52; scale-y: 0.703999996; }
        frame 26 { x: 31; y: 51.5; scale-y: 0.72299999; }
        frame 27 { y: 51.2999992; scale-y: 0.741999984; }
        frame 28 { x: 30.8999996; y: 50.7999992; scale-y: 0.762000024; }
        frame 29 { x: 30.7999992; y: 50.4000015; scale-y: 0.781000018; }
        frame 30 { x: 30.7000008; y: 50; scale-y: 0.800000012; }
        frame 31 { x: -10000; y: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_blink";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 32 { x: 31; y: 50; scale-x: 0.785000026; scale-y: 0.839999974; cel: 0; image: IMAGE_REANIM_POTATOMINE_BLINK1; }
        frame 33 { x: 31.1000004; y: 50.2999992; scale-x: 0.782000005; scale-y: 0.800000012; cel: -10000; image: IMAGE_REANIM_POTATOMINE_BLINK2; }
        frame 34 { x: 31; y: 50; scale-x: 0.785000026; scale-y: 0.839999974; image: IMAGE_REANIM_POTATOMINE_BLINK1; }
        frame 35 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 36 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock4";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 14 { x: 19.5; y: 68.5; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: 0.488999993; scale-y: 0.442999989; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK4; }
        frame 15 { x: 18.8999996; y: 65.8000031; skew-x: 8; skew-y: 8; scale-x: 0.507000029; scale-y: 0.503000021; cel: -10000; image: none; }
        frame 16 { x: -10000; y: 66.1999969; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.501999974; }
        frame 17 { y: 66.5999985; scale-y: 0.503000021; }
        frame 18 { y: 66.1999969; scale-y: 0.501999974; }
        frame 19 { y: 65.8000031; scale-y: 0.503000021; }
        frame 20 { y: -10000; scale-y: -10000; }
        frame 21 { x: 19; scale-y: 0.501999974; }
        frame 22 { x: 18.8999996; scale-y: -10000; }
        frame 23 { x: 19; }
        frame 24 { x: 18.8999996; }
        frame 25 { x: -10000; scale-y: 0.503000021; }
        frame 26 { scale-y: 0.501999974; }
        frame 27 { scale-y: -10000; }
        frame 30 { scale-y: 0.503000021; }
        frame 31 { scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock3b";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 10 { x: 20; y: 65.4000015; skew-x: -4.9000001; skew-y: -4.9000001; scale-x: 0.759000003; scale-y: 0.772000015; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 11 { x: 23.3999996; y: 65.0999985; skew-x: 0.5; skew-y: 0.5; scale-x: 0.758000016; scale-y: -10000; cel: -10000; image: none; }
        frame 12 { x: 26.7999992; y: 64.8000031; skew-x: 6.30000019; skew-y: 6.30000019; scale-x: -10000; }
        frame 13 { x: 29.1000004; y: 63.2999992; skew-x: 19.6000004; skew-y: 19.6000004; scale-y: 0.771000028; }
        frame 14 { x: 27; y: 66.4000015; skew-x: 2.5; skew-y: 2.5; scale-x: 0.757000029; scale-y: 0.769999981; }
        frame 15 { x: 26.3999996; y: 69.5; skew-x: -16.5; skew-y: -16.5; scale-x: 0.755999982; scale-y: 0.768999994; }
        frame 16 { x: -10000; y: 68.6999969; skew-x: -16.3999996; skew-y: -16.3999996; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: 67.9000015; skew-x: -16.5; skew-y: -16.5; }
        frame 18 { y: 68.6999969; skew-x: -16.3999996; skew-y: -16.3999996; }
        frame 19 { y: 69.5; skew-x: -16.5; skew-y: -16.5; }
        frame 20 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 21 { skew-x: -16.3999996; skew-y: -16.3999996; scale-x: 0.754999995; scale-y: 0.768000007; }
        frame 22 { skew-x: -10000; skew-y: -10000; scale-x: 0.755999982; scale-y: 0.768999994; }
        frame 23 { y: 69.4000015; scale-x: 0.754999995; scale-y: 0.768000007; }
        frame 24 { y: 69.5; scale-x: -10000; scale-y: 0.768999994; }
        frame 25 { y: -10000; skew-x: -16.5; skew-y: -16.5; scale-x: 0.755999982; scale-y: -10000; }
        frame 26 { skew-x: -16.3999996; skew-y: -16.3999996; scale-x: -10000; }
        frame 27 { skew-x: -10000; skew-y: -10000; }
        frame 30 { skew-x: -16.5; skew-y: -16.5; }
        frame 31 { skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock1b";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 14 { x: 56.9000015; y: 80.8000031; skew-x: -159.100006; skew-y: -159.100006; scale-x: 0.795000017; scale-y: 0.795000017; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK1; }
        frame 15 { x: 56.5999985; y: 81.3000031; skew-x: -129; skew-y: -129; scale-x: 0.79400003; scale-y: 0.79400003; cel: -10000; image: none; }
        frame 16 { x: 56.5; y: 81.6999969; skew-x: -10000; skew-y: -10000; scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 17 { x: 56.5999985; y: 82.0999985; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 18 { x: -10000; y: 81.6999969; scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 19 { y: 81.3000031; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 20 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 22 { x: 56.5; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -10000; scale-x: 0.791000009; scale-y: 0.791000009; }
        frame 24 { scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 25 { x: 56.5999985; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 26 { x: 56.5; scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 27 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 56.5999985; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 31 { x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock6b";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { x: 42; y: 70.8000031; skew-x: -20.7000008; skew-y: -20.7000008; scale-x: 0.533999979; scale-y: 0.527999997; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK6; }
        frame 12 { x: 44.5; y: 68.3000031; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.632000029; scale-y: 0.617999971; cel: -10000; image: none; }
        frame 13 { x: 50; y: 65.0999985; skew-x: 17.1000004; skew-y: 17.1000004; scale-x: 0.811999977; scale-y: 0.728999972; }
        frame 14 { x: 53.5999985; y: 70.0999985; skew-x: -11.1000004; skew-y: -11.1000004; scale-x: 0.879999995; scale-y: 0.822000027; }
        frame 15 { x: 57.7999992; y: 68.1999969; skew-x: -1.79999995; skew-y: -1.79999995; scale-x: -10000; scale-y: 0.823000014; }
        frame 16 { x: 57.9000015; y: 67.8000031; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.822000027; }
        frame 17 { x: 57.7999992; y: 67.3000031; skew-x: -1.79999995; skew-y: -1.79999995; scale-y: 0.823000014; }
        frame 18 { x: 57.9000015; y: 67.8000031; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.822000027; }
        frame 19 { x: 57.7999992; y: 68.1999969; skew-x: -1.79999995; skew-y: -1.79999995; scale-y: 0.823000014; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 57.9000015; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.822000027; }
        frame 22 { x: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 23 { x: 57.7999992; }
        frame 24 { x: -10000; }
        frame 25 { skew-x: -1.79999995; skew-y: -1.79999995; scale-y: 0.823000014; }
        frame 26 { x: 57.9000015; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.822000027; }
        frame 27 { x: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 30 { x: 57.7999992; skew-x: -1.79999995; skew-y: -1.79999995; scale-y: 0.823000014; }
        frame 31 { x: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock5b";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { x: 20.2999992; y: 68.6999969; scale-x: 0.623000026; scale-y: 0.699999988; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK5; }
        frame 12 { x: 16.7000008; y: 67.4000015; skew-x: 4.80000019; skew-y: 4.80000019; scale-x: 0.711000025; scale-y: 0.75; cel: -10000; image: none; }
        frame 13 { x: 13.1999998; y: 65.8000031; skew-x: 9.80000019; skew-y: 9.80000019; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 14 { x: 5.9000001; y: 66.6999969; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 15 { x: 0.800000012; y: 67.5999985; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: -10000; y: 67.9000015; skew-x: -10000; skew-y: -10000; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 17 { y: 68.3000031; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 18 { y: 67.9000015; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 19 { y: 67.5999985; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 20 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 67.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 22 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { y: 67.5999985; }
        frame 24 { x: 0.899999976; y: -10000; }
        frame 25 { x: 0.800000012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 26 { x: -10000; y: 67.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 27 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 67.5999985; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 31 { y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "anim_light";
        frame-count: 37;
        frame 0 { x: 28.2000008; y: 40.5; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_POTATOMINE_LIGHT1; }
        frame 1 { x: -10000; y: 41.2000008; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 42; }
        frame 3 { y: 42.7000008; }
        frame 4 { y: 43.5; }
        frame 5 { y: 42.7000008; }
        frame 6 { y: 42; }
        frame 7 { y: 41.2000008; }
        frame 8 { y: 40.5; }
        frame 9 { y: -10000; }
        frame 11 { y: 35.0999985; }
        frame 12 { y: 29.7999992; }
        frame 13 { y: 24.3999996; }
        frame 14 { y: 19; }
        frame 15 { y: 12.5; }
        frame 16 { y: 8.39999962; scale-y: 0.833999991; }
        frame 17 { y: 4.19999981; scale-y: 0.869000018; }
        frame 18 { y: 7.5999999; scale-y: 0.833999991; }
        frame 19 { y: 12.5; scale-y: 0.800000012; }
        frame 20 { y: -10000; scale-y: -10000; }
        frame 23 { x: 28; y: 14.5; scale-x: 0.819000006; scale-y: 0.77700001; }
        frame 24 { x: 27.7000008; y: 16.3999996; scale-x: 0.838999987; scale-y: 0.754000008; }
        frame 25 { x: 27.6000004; y: 17.1000004; scale-x: 0.847000003; scale-y: -10000; }
        frame 26 { x: 27.5; y: 16.6000004; scale-x: 0.856000006; }
        frame 27 { x: 27.2999992; y: 16.2000008; scale-x: 0.86500001; }
        frame 28 { x: 27.6000004; y: 15; scale-x: 0.842999995; scale-y: 0.769999981; }
        frame 29 { x: 27.8999996; y: 13.8000002; scale-x: 0.822000027; scale-y: 0.785000026; }
        frame 30 { x: 28.2000008; y: 12.5; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 31 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "anim_glow";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 20 { x: 21.1000004; y: 5.30000019; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_POTATOMINE_LIGHT2; }
        frame 21 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 22 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock6";
        frame-count: 37;
        frame 0 { x: 14.6999998; y: 66.0999985; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_POTATOMINE_ROCK6; }
        frame 1 { x: -10000; y: 67.0999985; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 66.0999985; }
        frame 3 { y: 67.0999985; }
        frame 4 { y: 66.0999985; }
        frame 5 { y: 67.0999985; }
        frame 6 { y: 66.0999985; }
        frame 7 { y: 67.0999985; }
        frame 8 { y: 66.0999985; }
        frame 9 { y: -10000; }
        frame 10 { x: 10; y: 67.5999985; skew-x: -9.89999962; skew-y: -9.89999962; }
        frame 11 { x: 9; y: 69.1999969; skew-x: -20.7000008; skew-y: -20.7000008; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 12 { x: 5.9000001; y: 74.5999985; skew-x: -55; skew-y: -55; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 13 { x: 7; y: 80.4000015; skew-x: -115.199997; skew-y: -115.199997; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 14 { x: 5.5; y: 79.0999985; skew-x: -156; skew-y: -156; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 15 { x: 7.5999999; y: 72.4000015; skew-x: -201.100006; skew-y: -201.100006; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 16 { x: -10000; y: 72; skew-x: -201; skew-y: -201; scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 17 { y: 71.5999985; skew-x: -201.100006; skew-y: -201.100006; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 18 { x: 7.69999981; y: 72; skew-x: -201; skew-y: -201; scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 19 { x: 7.5999999; y: 72.4000015; skew-x: -201.100006; skew-y: -201.100006; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { skew-x: -201; skew-y: -201; scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 22 { y: 72.3000031; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 7.69999981; y: -10000; }
        frame 24 { x: 7.5999999; }
        frame 25 { x: -10000; y: 72.4000015; skew-x: -201.100006; skew-y: -201.100006; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 26 { y: 72.3000031; skew-x: -201; skew-y: -201; scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 27 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { skew-x: -200.899994; skew-y: -200.899994; }
        frame 30 { skew-x: -201; skew-y: -201; }
        frame 31 { skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock1";
        frame-count: 37;
        frame 0 { x: 26.7999992; y: 68.5; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_POTATOMINE_ROCK1; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 69.5; }
        frame 3 { y: -10000; }
        frame 4 { y: 68.5; }
        frame 5 { y: -10000; }
        frame 6 { y: 69.5; }
        frame 7 { y: -10000; }
        frame 8 { y: 68.5; }
        frame 9 { y: -10000; }
        frame 10 { x: 25.2000008; y: 70.5; skew-x: -16.5; skew-y: -16.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 11 { x: 23.8999996; y: 71.1999969; skew-x: -30.2999992; skew-y: -30.2999992; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 22.1000004; y: 73.0999985; skew-x: -50.2999992; skew-y: -50.2999992; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 13 { x: 23; y: 77.0999985; skew-x: -100.199997; skew-y: -100.199997; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 14 { x: 22.5; y: 77.5999985; skew-x: -159.100006; skew-y: -159.100006; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 15 { x: 23.7999992; y: 75.1999969; skew-x: -194.699997; skew-y: -194.699997; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 16 { x: -10000; y: 75.5999985; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: 76; }
        frame 18 { y: 75.5999985; }
        frame 19 { y: 75.1999969; }
        frame 20 { y: -10000; }
        frame 21 { scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 22 { scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 23 { scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 24 { y: 75.3000031; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 25 { y: 75.1999969; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 23.8999996; y: 75.3000031; }
        frame 27 { x: 23.7999992; y: 75.1999969; }
        frame 28 { x: -10000; y: 75.3000031; scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 29 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 75.1999969; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 31 { y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock3";
        frame-count: 37;
        frame 0 { x: 42.5; y: 64.5; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 1 { x: -10000; y: 63.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 62.5; }
        frame 3 { y: 63.5; }
        frame 4 { y: 64.5; }
        frame 5 { y: 63.5; }
        frame 6 { y: 62.5; }
        frame 7 { y: 63.5; }
        frame 8 { y: 64.5; }
        frame 9 { y: -10000; }
        frame 10 { x: 46.9000015; y: 63; skew-x: 12.3000002; skew-y: 12.3000002; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 11 { x: 50.5; y: 62; skew-x: 20.6000004; skew-y: 20.6000004; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 64.3000031; y: 61.0999985; skew-x: 73.6999969; skew-y: 73.6999969; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 13 { x: 78.0999985; y: 67.8000031; skew-x: 126.800003; skew-y: 126.800003; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 14 { x: 85.3000031; y: 71.4000015; skew-x: 147.899994; skew-y: 147.899994; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 15 { x: -10000; y: 74.3000031; skew-x: 164.899994; skew-y: 164.899994; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 16 { x: 85.4000015; y: -10000; skew-x: 165; skew-y: 165; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 85.3000031; skew-x: 164.899994; skew-y: 164.899994; }
        frame 18 { x: 85.4000015; skew-x: 165; skew-y: 165; }
        frame 19 { x: 85.3000031; skew-x: 164.899994; skew-y: 164.899994; }
        frame 20 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 21 { x: 85.4000015; y: 74.1999969; skew-x: 165; skew-y: 165; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 22 { x: -10000; y: 74.3000031; skew-x: -10000; skew-y: -10000; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 23 { y: 74.1999969; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 24 { x: 85.3000031; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -10000; y: 74.3000031; skew-x: 164.899994; skew-y: 164.899994; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 26 { y: -10000; skew-x: 165; skew-y: 165; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 27 { y: 74.1999969; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 85.4000015; y: -10000; }
        frame 29 { x: 85.5; y: 74.3000031; }
        frame 30 { x: 85.4000015; y: -10000; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 31 { x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock5";
        frame-count: 37;
        frame 0 { x: 31.1000004; y: 69.0999985; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_POTATOMINE_ROCK5; }
        frame 1 { x: -10000; y: 68.0999985; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 69.0999985; }
        frame 3 { y: 68.0999985; }
        frame 4 { y: 69.0999985; }
        frame 5 { y: 68.0999985; }
        frame 6 { y: 69.0999985; }
        frame 7 { y: 68.0999985; }
        frame 8 { y: 69.0999985; }
        frame 9 { y: -10000; }
        frame 10 { x: 31.8999996; }
        frame 11 { x: -10000; }
        frame 12 { x: 36.5; y: 66.8000031; skew-x: 16.7999992; skew-y: 16.7999992; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 13 { x: 36; y: 68.8000031; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 38.2999992; y: 67; skew-x: 16.6000004; skew-y: 16.6000004; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 15 { x: 38.5; y: 70.4000015; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 16 { x: -10000; y: 70; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: 69.5999985; }
        frame 18 { y: 70; }
        frame 19 { y: 70.4000015; }
        frame 20 { y: -10000; }
        frame 23 { x: 38.4000015; }
        frame 24 { x: 38.5; }
        frame 25 { x: -10000; }
        frame 28 { x: 38.4000015; }
        frame 29 { x: -10000; }
        frame 30 { x: 38.5; }
        frame 31 { x: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
}
