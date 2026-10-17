export component ZenGarden_sprout {
    fps: 12;
    Track {
        source-name: "anim_sprout";
        frame-count: 60;
        frame 0 { x: 34.9000015; y: 42.2000008; }
        frame 1 { x: -10000; y: -10000; }
        frame 10 { cel: -1; }
        frame 11 { cel: -10000; }
    }
    Track {
        source-name: "anim_flower";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 10 { x: 34.9000015; y: 42.2000008; cel: 0; }
        frame 11 { x: -10000; y: -10000; cel: -10000; }
        frame 18 { cel: -1; }
        frame 19 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 18 { x: 34.9000015; y: 42.2000008; cel: 0; }
        frame 19 { x: -10000; y: -10000; cel: -10000; }
        frame 39 { cel: -1; }
        frame 40 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle_noflower";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 39 { x: 34.9000015; y: 42.2000008; cel: 0; }
        frame 40 { x: -10000; y: -10000; cel: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 40; y: 64.8000031; skew-x: 15; skew-y: 15; scale-x: 0.200000003; scale-y: 0.200000003; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
    }
    Track {
        source-name: "sprout";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 39; y: 67.6999969; scale-x: 0.134000003; scale-y: 0.0250000004; cel: 0; image: IMAGE_REANIM_SPROUT_BODY; }
        frame 5 { x: 36.4000015; y: 59.2999992; scale-x: 0.451999992; scale-y: 0.30399999; cel: -10000; image: none; }
        frame 6 { x: 35.5999985; y: 49.7000008; scale-x: 0.569000006; scale-y: 0.624000013; }
        frame 7 { x: 35.7000008; y: 40.7000008; scale-x: 0.582000017; scale-y: 0.924000025; }
        frame 8 { x: 33.2000008; y: 46; scale-x: 0.800000012; scale-y: 0.772000015; }
        frame 9 { x: 33.2999992; y: 46.4000015; scale-x: -10000; scale-y: 0.763000011; }
        frame 10 { x: 33.2000008; y: 46.5999985; scale-y: 0.753000021; }
        frame 11 { x: -10000; y: -10000; scale-y: -10000; }
        frame 19 { x: 33.9000015; y: 47; skew-y: 1.79999995; scale-y: 0.744000018; }
        frame 20 { x: 34.7000008; y: 47.2999992; skew-y: 3.5; scale-y: 0.735000014; }
        frame 21 { x: 35.4000015; y: 47.7999992; skew-y: 5.5; scale-y: 0.726000011; }
        frame 22 { x: 36.0999985; y: 48; skew-y: 7.30000019; scale-y: 0.716000021; }
        frame 23 { x: 36.9000015; y: 48.4000015; skew-y: 9.19999981; scale-y: 0.708000004; }
        frame 24 { x: 36.0999985; y: 48; skew-y: 7.30000019; scale-y: 0.716000021; }
        frame 25 { x: 35.4000015; y: 47.5999985; skew-y: 5.5; scale-y: 0.726000011; }
        frame 26 { x: 34.5999985; y: 47.2999992; skew-y: 3.5; scale-y: 0.735000014; }
        frame 27 { x: 33.9000015; y: 47; skew-y: 1.79999995; scale-y: 0.744000018; }
        frame 28 { x: 33.2000008; y: 46.5999985; skew-y: 0; scale-y: 0.753000021; }
        frame 29 { x: 32.5; y: 47.2999992; skew-y: -1.70000005; scale-y: 0.737999976; }
        frame 30 { x: 31.7999992; y: 47.7999992; skew-y: -3.4000001; scale-y: 0.72299999; }
        frame 31 { x: 31.1000004; y: 48.2999992; skew-y: -5.19999981; scale-y: 0.707000017; }
        frame 32 { x: 30.3999996; y: 48.9000015; skew-y: -7; scale-y: 0.691999972; }
        frame 33 { x: 29.7999992; y: 49.4000015; skew-y: -8.89999962; scale-y: 0.676999986; }
        frame 34 { x: 30.3999996; y: 48.9000015; skew-y: -7; scale-y: 0.691999972; }
        frame 35 { x: 31.1000004; y: 48.2999992; skew-y: -5.19999981; scale-y: 0.707000017; }
        frame 36 { x: 31.7999992; y: 47.7000008; skew-y: -3.4000001; scale-y: 0.72299999; }
        frame 37 { x: 32.5; y: 47.2000008; skew-y: -1.70000005; scale-y: 0.737999976; }
        frame 38 { x: 33.2000008; y: 46.5999985; skew-y: 0; scale-y: 0.753000021; }
        frame 39 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 40 { cel: -10000; }
    }
    Track {
        source-name: "Layer 26";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 39 { x: 33.2999992; y: 46.5; scale-x: 0.800000012; scale-y: 0.753000021; cel: 0; image: IMAGE_REANIM_SPROUT_BODY1; }
        frame 40 { x: 32.4000015; y: 47; skew-x: -0.5; skew-y: -2.4000001; scale-x: 0.799000025; scale-y: 0.748000026; cel: -10000; image: none; }
        frame 41 { x: 31.3999996; y: 47.4000015; skew-x: -1.20000005; skew-y: -5.19999981; scale-x: 0.796999991; scale-y: 0.744000018; }
        frame 42 { x: 30.5; y: 47.7999992; skew-x: -1.89999998; skew-y: -7.9000001; scale-x: 0.796000004; scale-y: 0.739000022; }
        frame 43 { x: 29.5; y: 48.2999992; skew-x: -2.70000005; skew-y: -10.6999998; scale-x: 0.795000017; scale-y: 0.734000027; }
        frame 44 { x: 28.5; y: 48.9000015; skew-x: -3.5; skew-y: -13.3000002; scale-x: 0.792999983; scale-y: 0.730000019; }
        frame 45 { x: 29.6000004; y: 48.4000015; skew-x: -2.70000005; skew-y: -10.5; scale-x: 0.79400003; scale-y: 0.734000027; }
        frame 46 { x: 30.3999996; y: 47.9000015; skew-x: -1.89999998; skew-y: -7.9000001; scale-x: 0.796000004; scale-y: 0.739000022; }
        frame 47 { x: 31.2999992; y: 47.4000015; skew-x: -1.20000005; skew-y: -5.19999981; scale-x: 0.796999991; scale-y: 0.742999971; }
        frame 48 { x: 32.2999992; y: 46.9000015; skew-x: -0.400000006; skew-y: -2.4000001; scale-x: 0.799000025; scale-y: 0.748000026; }
        frame 49 { x: 33.2999992; y: 46.5; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.753000021; }
        frame 50 { x: 33.9000015; y: 47.0999985; skew-x: 0.300000012; skew-y: 1.29999995; scale-x: -10000; scale-y: 0.734000027; }
        frame 51 { x: 34.4000015; y: 47.5999985; skew-x: 0.5; skew-y: 2.79999995; scale-x: 0.799000025; scale-y: 0.716000021; }
        frame 52 { x: 34.9000015; y: 48.4000015; skew-x: 1; skew-y: 4.0999999; scale-x: -10000; scale-y: 0.697000027; }
        frame 53 { x: 35.5; y: 48.9000015; skew-x: 1.29999995; skew-y: 5.5; scale-x: 0.797999978; scale-y: 0.67900002; }
        frame 54 { x: 35.7999992; y: 49.5; skew-x: 1.70000005; skew-y: 7; scale-x: -10000; scale-y: 0.660000026; }
        frame 55 { x: 35.2000008; y: 49; skew-x: 1.29999995; skew-y: 5.5; scale-y: 0.67900002; }
        frame 56 { x: 34.5999985; y: 48.5; skew-x: 1; skew-y: 4.0999999; scale-x: 0.799000025; scale-y: 0.697000027; }
        frame 57 { x: 34.0999985; y: 47.9000015; skew-x: 0.5; skew-y: 2.5999999; scale-x: -10000; scale-y: 0.716000021; }
        frame 58 { x: 33.5999985; y: 47.2999992; skew-x: 0.300000012; skew-y: 1.29999995; scale-x: 0.800000012; scale-y: 0.734000027; }
        frame 59 { x: 33.2999992; y: 46.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.753000021; }
    }
    Track {
        source-name: "Layer 27";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 39 { x: 36.4000015; y: 47; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SPROUT_BODY2; }
        frame 40 { x: 35; y: 48; skew-x: -5.19999981; skew-y: -6; scale-x: 0.790000021; scale-y: 0.801999986; cel: -10000; image: none; }
        frame 41 { x: 33.5999985; y: 49.0999985; skew-x: -10.6999998; skew-y: -12.1999998; scale-x: 0.778999984; scale-y: 0.80400002; }
        frame 42 { x: 32.5; y: 50.2999992; skew-x: -16; skew-y: -18.5; scale-x: 0.768999994; scale-y: 0.805999994; }
        frame 43 { x: 31.2000008; y: 51.5; skew-x: -21.5; skew-y: -24.7000008; scale-x: 0.758000016; scale-y: 0.809000015; }
        frame 44 { x: 30; y: 52.7999992; skew-x: -26.8999996; skew-y: -31.1000004; scale-x: 0.749000013; scale-y: 0.811999977; }
        frame 45 { x: 30.3999996; y: 51.9000015; skew-x: -21.3999996; skew-y: -28.2000008; scale-x: 0.758000016; scale-y: 0.813000023; }
        frame 46 { x: 31; y: 50.9000015; skew-x: -16; skew-y: -25.3999996; scale-x: 0.768999994; scale-y: 0.816999972; }
        frame 47 { x: 32.5999985; y: 49.4000015; skew-x: -10.5; skew-y: -16.7000008; scale-x: 0.778999984; scale-y: 0.810000002; }
        frame 48 { x: 34.5; y: 48.2000008; skew-x: -5.19999981; skew-y: -8.19999981; scale-x: 0.788999975; scale-y: 0.805000007; }
        frame 49 { x: 36.4000015; y: 47; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 50 { x: 37.4000015; y: 47.4000015; skew-x: 0.800000012; skew-y: 3.79999995; scale-x: 0.800999999; scale-y: 0.796999991; }
        frame 51 { x: 38.5; y: 48; skew-x: 1.79999995; skew-y: 7.5; scale-x: 0.802999973; scale-y: 0.79400003; }
        frame 52 { x: 39.4000015; y: 48.5999985; skew-x: 2.79999995; skew-y: 11.3000002; scale-x: 0.80400002; scale-y: 0.791000009; }
        frame 53 { x: 40.5; y: 49.0999985; skew-x: 3.79999995; skew-y: 15; scale-x: 0.805999994; scale-y: 0.787999988; }
        frame 54 { x: 41.5999985; y: 49.7999992; skew-x: 4.9000001; skew-y: 18.8999996; scale-x: 0.806999981; scale-y: 0.786000013; }
        frame 55 { x: 42; y: 49.5; skew-x: 6.0999999; skew-y: 22.6000004; scale-x: 0.805999994; scale-y: 0.81099999; }
        frame 56 { x: 42.4000015; y: 49; skew-x: 7.5; skew-y: 26.6000004; scale-x: 0.80400002; scale-y: 0.837000012; }
        frame 57 { x: 40.5; y: 48.2999992; skew-x: 5; skew-y: 17.6000004; scale-x: 0.802999973; scale-y: 0.824000001; }
        frame 58 { x: 38.5; y: 47.5; skew-x: 2.5; skew-y: 8.80000019; scale-x: 0.800999999; scale-y: 0.811999977; }
        frame 59 { x: 36.4000015; y: 47; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "rock";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { x: 38.0999985; y: 65.9000015; skew-x: 15; skew-y: 15; scale-x: 0.128000006; scale-y: 0.136999995; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 2 { x: 36.5999985; y: 65.5; skew-x: 0; skew-y: 0; scale-x: 0.185000002; scale-y: 0.191; cel: -10000; image: none; }
        frame 3 { x: 35; y: 65.5999985; skew-x: -14.6999998; skew-y: -14.6999998; scale-x: 0.243000001; scale-y: 0.245000005; }
        frame 4 { x: 33.5; y: 65.9000015; skew-x: -29.8999996; skew-y: -29.8999996; scale-x: 0.300000012; scale-y: 0.300000012; }
        frame 5 { x: 32.2999992; y: 67.8000031; skew-x: -59.9000015; skew-y: -59.9000015; scale-x: 0.361999989; scale-y: 0.361999989; }
        frame 6 { x: 32.5999985; y: 69.8000031; skew-x: -89.9000015; skew-y: -89.9000015; scale-x: 0.423999995; scale-y: 0.423999995; }
        frame 7 { x: 33.0999985; y: 71; skew-x: -104.900002; skew-y: -104.900002; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 33.7999992; y: 71.8000031; skew-x: -119.900002; skew-y: -119.900002; }
        frame 9 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 6 { x: 40; y: 66.6999969; skew-x: -29.8999996; skew-y: -29.8999996; scale-x: 0.245000005; scale-y: 0.264999986; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 7 { x: 40.2000008; y: 66.0999985; skew-x: -19.8999996; skew-y: -19.8999996; scale-x: 0.289999992; scale-y: 0.296000004; cel: -10000; image: none; }
        frame 8 { x: 40.4000015; y: 65.5; skew-x: -9.89999962; skew-y: -9.89999962; scale-x: 0.335999995; scale-y: 0.326999992; }
        frame 9 { x: 40.9000015; y: 64.6999969; skew-x: 0; skew-y: 0; scale-x: 0.381999999; scale-y: 0.358999997; }
        frame 10 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { x: 36.7999992; y: 65.5999985; skew-x: 15; skew-y: 15; scale-x: 0.200000003; scale-y: 0.200000003; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 2 { x: 36.5; y: 65.8000031; skew-x: 14.8000002; skew-y: 14.8000002; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 3 { x: 36.2999992; y: 66.0999985; skew-x: -10000; skew-y: -10000; }
        frame 4 { x: 36; y: 66.3000031; skew-x: 15; skew-y: 15; }
        frame 5 { y: 66.1999969; skew-x: 14.8000002; skew-y: 14.8000002; }
        frame 6 { x: 35.7999992; y: 66; skew-x: 15; skew-y: 15; }
        frame 7 { x: 36; y: 66.3000031; skew-x: -10000; skew-y: -10000; }
        frame 8 { x: -10000; y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 40.9000015; y: 67.5; skew-x: 15; skew-y: 15; scale-x: 0.108999997; scale-y: 0.127000004; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 4 { x: 41.2999992; y: 67.0999985; skew-x: -10000; skew-y: -10000; scale-x: 0.200000003; scale-y: 0.200000003; cel: -10000; image: none; }
        frame 5 { x: 41.5; y: 66.8000031; skew-x: 14.8000002; skew-y: 14.8000002; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 41.5999985; y: 66.5; skew-x: 15; skew-y: 15; }
        frame 7 { x: 41.2999992; y: 67.0999985; skew-x: -10000; skew-y: -10000; }
        frame 8 { x: -10000; y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 2 { x: 38.9000015; y: 66.8000031; scale-x: 0.200000003; scale-y: 0.200000003; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK1; }
        frame 3 { x: 38; y: 66.9000015; skew-x: -18.7000008; skew-y: -18.7000008; scale-x: 0.287999988; scale-y: 0.287999988; cel: -10000; image: none; }
        frame 4 { x: 37.2000008; y: 67.5; skew-x: -37.5; skew-y: -37.5; scale-x: 0.377000004; scale-y: 0.377000004; }
        frame 5 { x: 36.5999985; y: 68.5; skew-x: -56.2999992; skew-y: -56.2999992; scale-x: 0.465999991; scale-y: 0.465999991; }
        frame 6 { x: 36.7000008; y: 69.8000031; skew-x: -74.9000015; skew-y: -74.9000015; scale-x: 0.555000007; scale-y: 0.555000007; }
        frame 7 { x: 37; y: 70.3000031; skew-x: -89.9000015; skew-y: -89.9000015; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 37.5; y: 70.5999985; skew-x: -104.900002; skew-y: -104.900002; }
        frame 9 { x: 37.2999992; y: 70.9000015; skew-x: -10000; skew-y: -10000; }
        frame 10 { x: 37; y: 71.0999985; }
        frame 11 { x: -10000; y: -10000; }
    }
    Track {
        source-name: "sprout_petal";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { x: 40; y: 46.7000008; skew-x: 84.5; skew-y: 82.5; scale-x: 0.0350000001; scale-y: 0.0270000007; cel: 0; image: IMAGE_REANIM_SPROUT_PETAL; }
        frame 12 { x: 40.2000008; y: 40.7000008; skew-x: -10000; skew-y: -10000; scale-x: 0.467000008; scale-y: 0.463; cel: -10000; image: none; }
        frame 13 { x: 40.2999992; y: 34.7000008; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 14 { x: 40.0999985; y: 35.2000008; skew-x: 84.6999969; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 15 { x: 39.9000015; y: 35.5999985; skew-x: 84.5; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 16 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 40.9000015; skew-x: 86.5; skew-y: 82.6999969; scale-x: 0.81400001; scale-y: 0.801999986; }
        frame 20 { x: 42; y: 35.5; skew-x: 88.1999969; skew-y: -10000; scale-x: 0.828000009; scale-y: 0.805999994; }
        frame 21 { x: 43.2000008; y: 36.4000015; skew-x: 90; skew-y: 83; scale-x: 0.799000025; scale-y: 0.808000028; }
        frame 22 { x: 44.0999985; y: 37.2999992; skew-x: 91.5; skew-y: 83.1999969; scale-x: 0.768999994; scale-y: 0.81099999; }
        frame 23 { x: 45.0999985; y: 38.0999985; skew-x: 93.3000031; skew-y: -10000; scale-x: 0.74000001; scale-y: 0.814999998; }
        frame 24 { x: 44; y: 37.9000015; skew-x: 91.5; scale-x: 0.734000027; scale-y: 0.81099999; }
        frame 25 { x: 43; y: 37.5; skew-x: 89.9000015; skew-y: 83; scale-x: 0.727999985; scale-y: 0.809000015; }
        frame 26 { x: 42; y: 36.7999992; skew-x: 88.1999969; skew-y: 82.9000015; scale-x: 0.751999974; scale-y: 0.805000007; }
        frame 27 { x: 41; y: 36.2000008; skew-x: 86.5; skew-y: 82.6999969; scale-x: 0.776000023; scale-y: 0.802999973; }
        frame 28 { x: 39.9000015; y: 35.5999985; skew-x: 84.5; skew-y: 82.5; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 29 { x: 38.7999992; y: -10000; skew-x: 83; skew-y: 82.6999969; scale-x: 0.815999985; scale-y: 0.796000004; }
        frame 30 { x: 37.7999992; skew-x: 81.1999969; skew-y: -10000; scale-x: 0.833999991; scale-y: 0.792999983; }
        frame 31 { x: 36.9000015; y: 37; skew-x: 79.1999969; skew-y: 83; scale-x: 0.799000025; scale-y: 0.790000021; }
        frame 32 { x: 35.7999992; y: 38.2999992; skew-x: 77.1999969; skew-y: 83.1999969; scale-x: 0.764999986; scale-y: 0.787; }
        frame 33 { x: 34.9000015; y: 39.5; skew-x: 75.0999985; skew-y: -10000; scale-x: 0.731999993; scale-y: 0.783999979; }
        frame 34 { x: 36; y: 38.7999992; skew-x: 77.1999969; skew-y: 83; scale-x: 0.727999985; scale-y: 0.787; }
        frame 35 { x: 36.9000015; y: 37.9000015; skew-x: 79.4000015; skew-y: 82.6999969; scale-x: 0.726000011; scale-y: 0.790000021; }
        frame 36 { x: 37.7999992; y: 37.0999985; skew-x: 81.1999969; skew-y: -10000; scale-x: 0.75; scale-y: 0.792999983; }
        frame 37 { x: 38.7999992; y: 36.4000015; skew-x: 83; scale-x: 0.774999976; scale-y: 0.796000004; }
        frame 38 { x: 39.9000015; y: 35.5999985; skew-x: 84.5; skew-y: 82.5; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 39 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 40 { cel: -10000; }
    }
    Track {
        source-name: "sprout_petal";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 40.7999992; y: 46.7999992; skew-x: 135; skew-y: -44.9000015; scale-x: 0.0240000002; scale-y: 0.0240000002; cel: 0; image: IMAGE_REANIM_SPROUT_PETAL; }
        frame 14 { x: 43.5; y: 41.7999992; skew-x: -10000; skew-y: -10000; scale-x: 0.462000012; scale-y: 0.462000012; cel: -10000; image: none; }
        frame 15 { x: 46.2999992; y: 36.9000015; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 16 { x: 46.0999985; y: 37.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 17 { x: 46; y: 38; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 46.5999985; skew-x: 133.600006; skew-y: -44.2999992; scale-x: 0.806999981; scale-y: 0.782000005; }
        frame 20 { x: 47.2000008; y: 37.7999992; skew-x: 132.399994; skew-y: -43.7000008; scale-x: 0.816999972; scale-y: 0.76700002; }
        frame 21 { x: 48.5; y: 38.5999985; skew-x: 135.399994; skew-y: -43.2999992; scale-x: 0.822000027; scale-y: 0.746999979; }
        frame 22 { x: 49.5999985; y: 39.5; skew-x: 138.199997; skew-y: -42.7999992; scale-x: 0.828000009; scale-y: 0.728999972; }
        frame 23 { x: 51; y: 40.2999992; skew-x: 141.100006; skew-y: -42.4000015; scale-x: 0.836000025; scale-y: 0.711000025; }
        frame 24 { x: 50.2999992; y: 40.0999985; skew-x: 141.899994; skew-y: -42.7999992; scale-x: 0.83099997; scale-y: 0.730000019; }
        frame 25 { x: 49.5999985; y: 39.9000015; skew-x: 142.800003; skew-y: -43; scale-x: 0.828999996; scale-y: 0.750999987; }
        frame 26 { x: 48.4000015; y: 39.2999992; skew-x: 140.199997; skew-y: -43.5999985; scale-x: 0.818000019; scale-y: 0.765999973; }
        frame 27 { x: 47.2999992; y: 38.5999985; skew-x: 137.600006; skew-y: -44.2999992; scale-x: 0.808000028; scale-y: 0.782000005; }
        frame 28 { x: 46; y: 38; skew-x: 135; skew-y: -44.9000015; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 29 { x: 44.5999985; skew-x: 132.100006; skew-y: -46; scale-x: 0.782999992; scale-y: 0.805000007; }
        frame 30 { x: 43.2999992; y: -10000; skew-x: 129.100006; skew-y: -47.0999985; scale-x: 0.768000007; scale-y: 0.813000023; }
        frame 31 { x: 42.5999985; y: 39.2000008; skew-x: 130.600006; skew-y: -48.7999992; scale-x: 0.744000018; scale-y: -10000; }
        frame 32 { x: 42; y: 40.5; skew-x: 132.399994; skew-y: -50.2999992; scale-x: 0.721000016; scale-y: 0.814999998; }
        frame 33 { x: 41.2999992; y: 41.7000008; skew-x: 134; skew-y: -52; scale-x: 0.699000001; scale-y: 0.818000019; }
        frame 34 { x: 42.7999992; y: 40.9000015; skew-x: 136.399994; skew-y: -48.5; scale-x: 0.726000011; scale-y: 0.814999998; }
        frame 35 { x: 44; y: 40.0999985; skew-x: 138.899994; skew-y: -44.7999992; scale-x: 0.755999982; scale-y: -10000; }
        frame 36 { x: 44.5999985; y: 39.5; skew-x: 137.600006; skew-y: -10000; scale-x: 0.768999994; scale-y: 0.808000028; }
        frame 37 { x: 45.4000015; y: 38.7999992; skew-x: 136.399994; scale-x: 0.783999979; scale-y: 0.80400002; }
        frame 38 { x: 46; y: 38; skew-x: 135; skew-y: -44.9000015; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 39 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 40 { cel: -10000; }
    }
    Track {
        source-name: "sprout_petal";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 10 { x: 38.2000008; y: 47.5; scale-x: 0.118000001; scale-y: 0.115999997; cel: 0; image: IMAGE_REANIM_SPROUT_PETAL; }
        frame 11 { x: 32.9000015; y: 45.5; skew-x: 3.5; skew-y: 3.5; scale-x: 0.509000003; scale-y: 0.508000016; cel: -10000; image: none; }
        frame 12 { x: 28.1000004; y: 43; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 13 { x: 28.6000004; y: 43.4000015; skew-x: -10000; skew-y: -10000; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 14 { x: 29.1000004; y: 43.5999985; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 15 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 30.1000004; y: 43.2999992; skew-x: 10.1000004; skew-y: 9; scale-x: 0.795000017; scale-y: 0.796000004; }
        frame 20 { x: 31.1000004; y: 42.7999992; skew-x: 13.1000004; skew-y: 10.8000002; scale-x: 0.791999996; scale-y: 0.792999983; }
        frame 21 { x: 31.7999992; y: 43.7000008; skew-x: 11; skew-y: 12.8000002; scale-x: 0.788999975; scale-y: 0.783999979; }
        frame 22 { x: 32.5; y: 44.5999985; skew-x: 8.80000019; skew-y: 14.6000004; scale-x: 0.786000013; scale-y: 0.776000023; }
        frame 23 { x: 33.0999985; y: 45.5999985; skew-x: 6.9000001; skew-y: 16.7000008; scale-x: 0.783999979; scale-y: 0.768000007; }
        frame 24 { x: 32.2000008; y: -10000; skew-x: 4.5999999; skew-y: 14.5; scale-x: 0.791000009; scale-y: 0.777999997; }
        frame 25 { x: 31.2999992; y: 45.5; skew-x: 2.5999999; skew-y: 12.6000004; scale-x: 0.797999978; scale-y: 0.788999975; }
        frame 26 { x: 30.5; y: 44.9000015; skew-x: 4; skew-y: 10.8000002; scale-x: 0.799000025; scale-y: 0.791999996; }
        frame 27 { x: 29.7999992; y: 44.2999992; skew-x: 5.5999999; skew-y: 9; scale-x: -10000; scale-y: 0.796000004; }
        frame 28 { x: 29.1000004; y: 43.5999985; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 29 { x: 28.2999992; y: 43.4000015; skew-x: 9.80000019; skew-y: 5.5; scale-x: 0.805999994; scale-y: 0.787999988; }
        frame 30 { x: 27.7000008; y: 43; skew-x: 12.6999998; skew-y: 4; scale-x: 0.813000023; scale-y: 0.77700001; }
        frame 31 { x: 26.8999996; y: 44.2000008; skew-x: 10.5; skew-y: 2.29999995; scale-x: 0.811999977; scale-y: 0.753000021; }
        frame 32 { x: 26.1000004; y: 45.5; skew-x: 8.30000019; skew-y: 0.800000012; scale-x: -10000; scale-y: 0.728999972; }
        frame 33 { x: 25.2000008; y: 46.5999985; skew-x: 6.30000019; skew-y: -0.800000012; scale-y: 0.704999983; }
        frame 34 { x: 26; y: 46.0999985; skew-x: 4.30000019; skew-y: 0.600000024; scale-x: 0.808000028; scale-y: 0.735000014; }
        frame 35 { x: 26.7000008; y: 45.5999985; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.805000007; scale-y: 0.765999973; }
        frame 36 { x: 27.5; y: 45; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: 0.802999973; scale-y: 0.77700001; }
        frame 37 { x: 28.2000008; y: 44.2999992; skew-x: 5.5; skew-y: 5.5; scale-x: 0.800999999; scale-y: 0.787999988; }
        frame 38 { x: 29.1000004; y: 43.5999985; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 39 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 40 { cel: -10000; }
    }
}
