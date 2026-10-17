export component DoomShroom {
    fps: 12;
    Track {
        source-name: "anim_sleep";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 52 { cel: 0; }
        frame 53 { cel: -10000; }
    }
    Track {
        source-name: "anim_explode";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 19 { cel: 0; }
        frame 20 { cel: -10000; }
        frame 52 { cel: -1; }
        frame 53 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 77;
        frame 20 { cel: -1; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "DoomShroom_body";
        frame-count: 77;
        frame 0 { x: 17.1000004; y: 40; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_DOOMSHROOM_BODY; }
        frame 1 { x: 16.8999996; y: 40.5999985; scale-x: 0.809000015; scale-y: 0.787; image: none; }
        frame 2 { x: 16.6000004; y: 41.4000015; scale-x: 0.818000019; scale-y: 0.773000002; }
        frame 3 { x: 16.3999996; y: 42; scale-x: 0.827000022; scale-y: 0.75999999; }
        frame 4 { x: 16.2000008; y: 42.7000008; scale-x: 0.837000012; scale-y: 0.746999979; }
        frame 5 { x: 15.8999996; y: 43.4000015; scale-x: 0.846000016; scale-y: 0.73299998; }
        frame 6 { x: 16.2000008; y: 42.5999985; scale-x: 0.837000012; scale-y: 0.746999979; }
        frame 7 { x: 16.3999996; y: 42; scale-x: 0.828000009; scale-y: 0.75999999; }
        frame 8 { x: 16.6000004; y: 41.2999992; scale-x: 0.818000019; scale-y: 0.773000002; }
        frame 9 { x: 16.8999996; y: 40.5999985; scale-x: 0.809000015; scale-y: 0.787; }
        frame 10 { x: 17.1000004; y: 40; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 11 { x: 17.3999996; y: 39.2999992; scale-x: 0.788999975; scale-y: 0.81400001; }
        frame 12 { x: 17.7999992; y: 38.5; scale-x: 0.77700001; scale-y: 0.828999996; }
        frame 13 { x: 18.1000004; y: 37.7999992; scale-x: 0.765999973; scale-y: 0.842999995; }
        frame 14 { x: 18.2999992; y: 37.0999985; scale-x: 0.754999995; scale-y: 0.856999993; }
        frame 15 { x: 18.1000004; y: 37.7000008; scale-x: 0.763999999; scale-y: 0.846000016; }
        frame 16 { x: 17.8999996; y: 38.2999992; scale-x: 0.773000002; scale-y: 0.833999991; }
        frame 17 { x: 17.6000004; y: 38.9000015; scale-x: 0.782000005; scale-y: 0.823000014; }
        frame 18 { x: 17.2999992; y: 39.4000015; scale-x: 0.791000009; scale-y: 0.81099999; }
        frame 19 { x: 17.1000004; y: 40; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 20 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 16.7000008; y: 40.5; skew-y: -0.699999988; scale-y: 0.788999975; }
        frame 54 { x: 16.2999992; y: 41; skew-y: -1.39999998; scale-y: 0.777999997; }
        frame 55 { x: 15.6999998; y: 41.5999985; skew-y: -2.20000005; scale-y: 0.76700002; }
        frame 56 { x: 15.3000002; y: 42.0999985; skew-y: -3; scale-y: 0.755999982; }
        frame 57 { x: 14.8999996; y: 42.5999985; skew-y: -3.9000001; scale-y: 0.744000018; }
        frame 58 { x: 14.3999996; y: 43.2000008; skew-y: -4.69999981; scale-y: 0.734000027; }
        frame 59 { x: 14.6000004; y: 43.0999985; skew-y: -4.19999981; scale-y: 0.737999976; }
        frame 60 { x: 14.8000002; y: 42.7000008; skew-y: -3.9000001; scale-y: 0.742999971; }
        frame 61 { x: 15; y: 42.5999985; skew-y: -3.70000005; scale-y: 0.748000026; }
        frame 62 { x: 15.1999998; y: 42.2999992; skew-y: -3.20000005; scale-y: 0.751999974; }
        frame 63 { x: 15.3999996; y: 42.0999985; skew-y: -2.9000001; scale-y: 0.757000029; }
        frame 64 { x: 15.5; y: 41.9000015; skew-y: -2.70000005; scale-y: 0.762000024; }
        frame 65 { x: 16.2999992; y: 42.0999985; skew-y: -1.39999998; scale-y: 0.757000029; }
        frame 66 { x: 17; y: 42.2000008; skew-y: -0; scale-y: 0.751999974; }
        frame 67 { x: 17.7000008; y: 42.5; skew-y: 1; scale-y: 0.748000026; }
        frame 68 { x: 18.3999996; y: 42.5999985; skew-y: 2.29999995; scale-y: 0.742999971; }
        frame 69 { x: 19.1000004; y: 42.7999992; skew-y: 3.5; scale-y: 0.737999976; }
        frame 70 { x: 19.7999992; y: 43; skew-y: 4.80000019; scale-y: 0.73299998; }
        frame 71 { x: 19.2999992; y: 42.5; skew-y: 3.79999995; scale-y: 0.744000018; }
        frame 72 { x: 18.8999996; y: 42; skew-y: 3; scale-y: 0.754999995; }
        frame 73 { x: 18.5; y: 41.5; skew-y: 2.29999995; scale-y: 0.76700002; }
        frame 74 { x: 18; y: 41; skew-y: 1.5; scale-y: 0.777999997; }
        frame 75 { x: 17.6000004; y: 40.5; skew-y: 0.800000012; scale-y: 0.788999975; }
        frame 76 { x: 17.1000004; y: 40; skew-y: 0; scale-y: 0.800000012; }
    }
    Track {
        source-name: "DoomShroom_head1";
        frame-count: 77;
        frame 0 { y: 3.5999999; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_DOOMSHROOM_HEAD1; }
        frame 1 { x: -0.200000003; y: 4.69999981; scale-x: 0.806999981; scale-y: 0.790000021; image: none; }
        frame 2 { x: -0.600000024; y: 5.80000019; scale-x: 0.81400001; scale-y: 0.779999971; }
        frame 3 { x: -1; y: 6.9000001; scale-x: 0.82099998; scale-y: 0.768999994; }
        frame 4 { x: -1.29999995; y: 7.9000001; scale-x: 0.828999996; scale-y: 0.759000003; }
        frame 5 { x: -1.70000005; y: 9; scale-x: 0.836000025; scale-y: 0.749000013; }
        frame 6 { x: -1.39999998; y: 7.9000001; scale-x: 0.828999996; scale-y: 0.759000003; }
        frame 7 { x: -1; y: 6.9000001; scale-x: 0.82099998; scale-y: 0.768999994; }
        frame 8 { x: -0.600000024; y: 5.80000019; scale-x: 0.81400001; scale-y: 0.779999971; }
        frame 9 { x: -0.300000012; y: 4.69999981; scale-x: 0.806999981; scale-y: 0.790000021; }
        frame 10 { x: 0; y: 3.5999999; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 11 { x: 0.400000006; y: 2.29999995; scale-x: 0.791999996; scale-y: 0.815999985; }
        frame 12 { x: 0.800000012; y: 0.899999976; scale-x: 0.783999979; scale-y: 0.833000004; }
        frame 13 { x: 1.20000005; y: -0.300000012; scale-x: 0.776000023; scale-y: 0.848999977; }
        frame 14 { x: 1.60000002; y: -1.60000002; scale-x: 0.768000007; scale-y: 0.86500001; }
        frame 15 { x: 1.29999995; y: -0.600000024; scale-x: 0.774999976; scale-y: 0.851999998; }
        frame 16 { x: 1; y: 0.400000006; scale-x: 0.781000018; scale-y: 0.838999987; }
        frame 17 { x: 0.600000024; y: 1.5; scale-x: 0.787; scale-y: 0.825999975; }
        frame 18 { x: 0.300000012; y: 2.5; scale-x: 0.79400003; scale-y: 0.813000023; }
        frame 19 { x: 0; y: 3.5999999; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 20 { x: -0.300000012; y: 2.9000001; scale-x: 0.809000015; scale-y: 0.811999977; }
        frame 21 { x: -0.699999988; y: 2.0999999; scale-x: 0.816999972; scale-y: 0.824000001; }
        frame 22 { x: -1.20000005; y: 1.39999998; scale-x: 0.825999975; scale-y: 0.836000025; }
        frame 23 { x: -1.60000002; y: 0.699999988; scale-x: 0.833999991; scale-y: 0.84799999; }
        frame 24 { x: -2; y: 0; scale-x: 0.842999995; scale-y: 0.859000027; }
        frame 25 { x: -2.5; y: -0.600000024; scale-x: 0.851000011; scale-y: 0.870999992; }
        frame 26 { x: -2.9000001; y: -1.29999995; scale-x: 0.860000014; scale-y: 0.883000016; }
        frame 27 { x: -3.29999995; y: -2; scale-x: 0.867999971; scale-y: 0.894999981; }
        frame 28 { x: -3.70000005; y: -2.79999995; scale-x: 0.876999974; scale-y: 0.907000005; }
        frame 29 { x: -4.19999981; y: -3.5; scale-x: 0.88499999; scale-y: 0.91900003; }
        frame 30 { x: -4.5999999; y: -4.19999981; scale-x: 0.893999994; scale-y: 0.930999994; }
        frame 31 { x: -5; y: -4.9000001; scale-x: 0.90200001; scale-y: 0.943000019; }
        frame 32 { x: -5.5; y: -5.69999981; scale-x: 0.911000013; scale-y: 0.954999983; }
        frame 33 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 34 { cel: -10000; }
    }
    Track {
        source-name: "DoomShroom_head2";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 26 { x: -6; y: -5; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; alpha: 0; image: IMAGE_REANIM_DOOMSHROOM_HEAD2; }
        frame 27 { x: -10000; y: -5.4000001; scale-x: -10000; scale-y: -10000; cel: -10000; alpha: 0.170000002; image: none; }
        frame 28 { y: -5.69999981; alpha: 0.330000013; }
        frame 29 { y: -6; alpha: 0.5; }
        frame 30 { y: -6.4000001; alpha: 0.670000017; }
        frame 31 { y: -6.69999981; alpha: 0.829999983; }
        frame 32 { y: -7; alpha: 1; }
        frame 33 { x: -6.5999999; y: -7.80000019; scale-x: 0.810000002; scale-y: 0.811999977; alpha: -10000; }
        frame 34 { x: -7.19999981; y: -8.5; scale-x: 0.819000006; scale-y: 0.823000014; }
        frame 35 { x: -7.80000019; y: -9.30000019; scale-x: 0.828999996; scale-y: 0.834999979; }
        frame 36 { x: -8.30000019; y: -10; scale-x: 0.838999987; scale-y: 0.846000016; }
        frame 37 { x: -8.89999962; y: -10.8000002; scale-x: 0.848999977; scale-y: 0.85799998; }
        frame 38 { x: -9.39999962; y: -11.6000004; scale-x: 0.85799998; scale-y: 0.870000005; }
        frame 39 { x: -10; y: -12.3000002; scale-x: 0.867999971; scale-y: 0.880999982; }
        frame 40 { x: -10.6000004; y: -13.1000004; scale-x: 0.878000021; scale-y: 0.893000007; }
        frame 41 { x: -10.1999998; y: -12.6999998; scale-x: 0.871999979; scale-y: -10000; }
        frame 42 { x: -9.80000019; y: -12.3000002; scale-x: 0.86500001; scale-y: 0.893999994; }
        frame 43 { x: -9.5; y: -11.8999996; scale-x: 0.859000027; scale-y: -10000; }
        frame 44 { x: -9.10000038; y: -11.3999996; scale-x: 0.852999985; }
        frame 45 { x: -8.69999981; y: -11; scale-x: 0.847000003; scale-y: 0.894999981; }
        frame 46 { x: -8.39999962; y: -10.6999998; scale-x: 0.839999974; scale-y: -10000; }
        frame 47 { x: -8; y: -10.3999996; scale-x: 0.833999991; }
        frame 48 { x: -10000; y: -10000; scale-x: -10000; cel: -1; }
        frame 49 { cel: -10000; }
    }
    Track {
        source-name: "DoomShroom_head3";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 32 { x: -6.30000019; y: -11.1000004; scale-x: 0.749000013; scale-y: 0.749000013; cel: 0; alpha: 0; image: IMAGE_REANIM_DOOMSHROOM_HEAD3; }
        frame 33 { x: -6.69999981; y: -11.3000002; scale-x: 0.755999982; scale-y: 0.755999982; cel: -10000; alpha: 0.129999995; image: none; }
        frame 34 { x: -7.0999999; y: -11.6000004; scale-x: 0.762000024; scale-y: 0.762000024; alpha: 0.25; }
        frame 35 { x: -7.5; y: -11.8000002; scale-x: 0.768000007; scale-y: 0.768000007; alpha: 0.379999995; }
        frame 36 { x: -7.9000001; y: -12.1000004; scale-x: 0.774999976; scale-y: 0.774999976; alpha: 0.5; }
        frame 37 { x: -8.30000019; y: -12.3999996; scale-x: 0.781000018; scale-y: 0.781000018; alpha: 0.629999995; }
        frame 38 { x: -8.69999981; y: -12.6000004; scale-x: 0.787; scale-y: 0.787; alpha: 0.75; }
        frame 39 { x: -9.10000038; y: -12.8000002; scale-x: 0.79400003; scale-y: 0.79400003; alpha: 0.879999995; }
        frame 40 { x: -9.5; y: -13.1000004; scale-x: 0.800000012; scale-y: 0.800000012; alpha: 1; }
        frame 41 { x: -10.5; y: -14.1000004; scale-x: 0.815999985; scale-y: 0.815999985; alpha: -10000; }
        frame 42 { x: -11.5; y: -15.3000002; scale-x: 0.832000017; scale-y: 0.832000017; }
        frame 43 { x: -12.6000004; y: -16.2999992; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 44 { x: -13.6000004; y: -17.3999996; scale-x: 0.86500001; scale-y: 0.86500001; }
        frame 45 { x: -14.6000004; y: -18.5; scale-x: 0.880999982; scale-y: 0.880999982; }
        frame 46 { x: -15.6000004; y: -19.7000008; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 47 { x: -16.7000008; y: -20.7999992; scale-x: 0.912999988; scale-y: 0.912999988; }
        frame 48 { x: -17.7000008; y: -21.7999992; scale-x: 0.92900002; scale-y: 0.92900002; }
        frame 49 { x: -18.7000008; y: -22.8999996; scale-x: 0.94599998; scale-y: 0.94599998; }
        frame 50 { x: -19.7000008; y: -24; scale-x: 0.962000012; scale-y: 0.962000012; }
        frame 51 { x: -20.7999992; y: -25.1000004; scale-x: 0.977999985; scale-y: 0.977999985; }
        frame 52 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 53 { cel: -10000; }
    }
    Track {
        source-name: "DoomShroom_sleepinghead";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 52 { y: 3.5999999; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_DOOMSHROOM_SLEEPINGHEAD; }
        frame 53 { x: -0.600000024; y: 5; scale-x: 0.805999994; scale-y: 0.782000005; cel: -10000; image: none; }
        frame 54 { x: -1.39999998; y: 6.5; scale-x: 0.811999977; scale-y: 0.763000011; }
        frame 55 { x: -2.20000005; y: 8; scale-x: 0.818000019; scale-y: 0.745000005; }
        frame 56 { x: -2.9000001; y: 9.39999962; scale-x: 0.824000001; scale-y: 0.726999998; }
        frame 57 { x: -3.70000005; y: 10.8999996; scale-x: 0.829999983; scale-y: 0.708000004; }
        frame 58 { x: -4.5; y: 12.3999996; scale-x: 0.836000025; scale-y: 0.689999998; }
        frame 59 { x: -3.70000005; y: 11; scale-x: 0.829999983; scale-y: 0.708000004; }
        frame 60 { x: -3; y: 9.5; scale-x: 0.824000001; scale-y: 0.726999998; }
        frame 61 { x: -2.20000005; y: 8; scale-x: 0.818000019; scale-y: 0.745000005; }
        frame 62 { x: -1.39999998; y: 6.5; scale-x: 0.811999977; scale-y: 0.763000011; }
        frame 63 { x: -0.699999988; y: 5.0999999; scale-x: 0.805999994; scale-y: 0.782000005; }
        frame 64 { x: 0; y: 3.5999999; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 65 { x: 0.300000012; y: 5; scale-x: 0.805999994; scale-y: 0.782000005; }
        frame 66 { x: 0.600000024; y: 6.5; scale-x: 0.811999977; scale-y: 0.763000011; }
        frame 67 { x: 1; y: 8; scale-x: 0.818000019; scale-y: 0.745000005; }
        frame 68 { x: 1.29999995; y: 9.39999962; scale-x: 0.824000001; scale-y: 0.726999998; }
        frame 69 { x: 1.60000002; y: 10.8999996; scale-x: 0.829999983; scale-y: 0.708000004; }
        frame 70 { x: 2; y: 12.3999996; scale-x: 0.836000025; scale-y: 0.689999998; }
        frame 71 { x: 1.60000002; y: 11; scale-x: 0.829999983; scale-y: 0.708000004; }
        frame 72 { x: 1.29999995; y: 9.5; scale-x: 0.824000001; scale-y: 0.726999998; }
        frame 73 { x: 1; y: 8; scale-x: 0.818000019; scale-y: 0.745000005; }
        frame 74 { x: 0.600000024; y: 6.5; scale-x: 0.811999977; scale-y: 0.763000011; }
        frame 75 { x: 0.300000012; y: 5.0999999; scale-x: 0.805999994; scale-y: 0.782000005; }
        frame 76 { x: 0; y: 3.5999999; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
}
