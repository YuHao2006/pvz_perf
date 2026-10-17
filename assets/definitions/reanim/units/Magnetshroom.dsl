export component Magnetshroom {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: 0; }
        frame 2 { cel: -10000; }
        frame 4 { cel: -1; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { cel: 0; }
        frame 5 { cel: -10000; }
        frame 33 { cel: -1; }
        frame 34 { cel: -10000; }
    }
    Track {
        source-name: "anim_nonactive_idle";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 33 { cel: 0; }
        frame 34 { cel: -10000; }
        frame 62 { cel: -1; }
        frame 63 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 71 { cel: 0; }
        frame 72 { cel: -10000; }
        frame 97 { cel: -1; }
        frame 98 { cel: -10000; }
    }
    Track {
        source-name: "anim_sleep";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 108 { cel: 0; }
        frame 109 { cel: -10000; }
        frame 126 { cel: -1; }
        frame 127 { cel: -10000; }
    }
    Track {
        source-name: "anim_nonactive_idle2";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 126 { cel: 0; }
        frame 127 { cel: -10000; }
    }
    Track {
        source-name: "Magnetshroom_stem";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 35.9000015; y: 58.0999985; scale-x: 0.600000024; scale-y: 0.620000005; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_STEM; }
        frame 5 { x: 36.2000008; y: 58.2999992; skew-y: 1.29999995; scale-x: -10000; scale-y: 0.615999997; cel: -10000; image: none; }
        frame 6 { x: 36.5999985; y: 58.5; skew-y: 2.79999995; scale-y: 0.611000001; }
        frame 7 { x: 36.9000015; y: -10000; skew-y: 4.0999999; scale-y: 0.606999993; }
        frame 8 { x: 37.2999992; y: 58.7000008; skew-y: 5.5; scale-y: 0.602999985; }
        frame 9 { x: 37.5999985; y: 58.9000015; skew-y: 7; scale-y: 0.598999977; }
        frame 10 { x: 38; y: 59; skew-y: 8.30000019; scale-y: 0.593999982; }
        frame 11 { x: 38.4000015; y: 59.0999985; skew-y: 9.80000019; scale-y: 0.589999974; }
        frame 12 { x: 38; y: 59; skew-y: 8.30000019; scale-y: 0.593999982; }
        frame 13 { x: 37.5999985; y: 58.7999992; skew-y: 7; scale-y: 0.598999977; }
        frame 14 { x: 37.2999992; y: 58.7000008; skew-y: 5.5; scale-y: 0.602999985; }
        frame 15 { x: 37; y: 58.5; skew-y: 4.0999999; scale-y: 0.606999993; }
        frame 16 { x: 36.5; y: -10000; skew-y: 2.79999995; scale-y: 0.611000001; }
        frame 17 { x: 36.2000008; y: 58.2000008; skew-y: 1.29999995; scale-y: 0.615999997; }
        frame 18 { x: 35.9000015; y: 58.0999985; skew-y: 0; scale-y: 0.620000005; }
        frame 19 { x: 35.5; y: 58.2999992; skew-y: -1.20000005; scale-y: 0.614000022; }
        frame 20 { x: 35.2000008; y: 58.5; skew-y: -2.70000005; scale-y: 0.60799998; }
        frame 21 { x: 34.9000015; y: 58.5999985; skew-y: -4; scale-y: 0.601999998; }
        frame 22 { x: 34.5999985; y: 58.7999992; skew-y: -5.4000001; scale-y: 0.597000003; }
        frame 23 { x: 34.2999992; y: 58.9000015; skew-y: -6.9000001; scale-y: 0.591000021; }
        frame 24 { x: 34; y: 59.0999985; skew-y: -8.19999981; scale-y: 0.584999979; }
        frame 25 { x: 33.5999985; y: 59.2999992; skew-y: -9.69999981; scale-y: 0.579999983; }
        frame 26 { x: 34; y: 59.0999985; skew-y: -8.19999981; scale-y: 0.584999979; }
        frame 27 { x: 34.2999992; y: 59; skew-y: -6.9000001; scale-y: 0.591000021; }
        frame 28 { x: 34.5999985; y: 58.7999992; skew-y: -5.4000001; scale-y: 0.597000003; }
        frame 29 { x: 35; y: 58.5999985; skew-y: -4; scale-y: 0.601999998; }
        frame 30 { x: 35.2999992; y: 58.5; skew-y: -2.70000005; scale-y: 0.60799998; }
        frame 31 { x: 35.5999985; y: 58.2999992; skew-y: -1.20000005; scale-y: 0.614000022; }
        frame 32 { x: 35.9000015; y: 58.0999985; skew-y: 0; scale-y: 0.620000005; }
        frame 33 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 34 { x: 36.2000008; y: 58.2999992; skew-y: 1.29999995; scale-y: 0.615999997; }
        frame 35 { x: 36.5999985; y: 58.5; skew-y: 2.79999995; scale-y: 0.611000001; }
        frame 36 { x: 36.9000015; y: -10000; skew-y: 4.0999999; scale-y: 0.606999993; }
        frame 37 { x: 37.2999992; y: 58.7000008; skew-y: 5.5; scale-y: 0.602999985; }
        frame 38 { x: 37.5999985; y: 58.9000015; skew-y: 7; scale-y: 0.598999977; }
        frame 39 { x: 38; y: 59; skew-y: 8.30000019; scale-y: 0.593999982; }
        frame 40 { x: 38.4000015; y: 59.0999985; skew-y: 9.80000019; scale-y: 0.589999974; }
        frame 41 { x: 38; y: 59; skew-y: 8.30000019; scale-y: 0.593999982; }
        frame 42 { x: 37.5999985; y: 58.7999992; skew-y: 7; scale-y: 0.598999977; }
        frame 43 { x: 37.2999992; y: 58.7000008; skew-y: 5.5; scale-y: 0.602999985; }
        frame 44 { x: 37; y: 58.5; skew-y: 4.0999999; scale-y: 0.606999993; }
        frame 45 { x: 36.5; y: -10000; skew-y: 2.79999995; scale-y: 0.611000001; }
        frame 46 { x: 36.2000008; y: 58.2000008; skew-y: 1.29999995; scale-y: 0.615999997; }
        frame 47 { x: 35.9000015; y: 58.0999985; skew-y: 0; scale-y: 0.620000005; }
        frame 48 { x: 35.5; y: 58.2999992; skew-y: -1.20000005; scale-y: 0.614000022; }
        frame 49 { x: 35.2000008; y: 58.5; skew-y: -2.70000005; scale-y: 0.60799998; }
        frame 50 { x: 34.9000015; y: 58.5999985; skew-y: -4; scale-y: 0.601999998; }
        frame 51 { x: 34.5999985; y: 58.7999992; skew-y: -5.4000001; scale-y: 0.597000003; }
        frame 52 { x: 34.2999992; y: 58.9000015; skew-y: -6.9000001; scale-y: 0.591000021; }
        frame 53 { x: 34; y: 59.0999985; skew-y: -8.19999981; scale-y: 0.584999979; }
        frame 54 { x: 33.5999985; y: 59.2999992; skew-y: -9.69999981; scale-y: 0.579999983; }
        frame 55 { x: 34; y: 59.0999985; skew-y: -8.19999981; scale-y: 0.584999979; }
        frame 56 { x: 34.2999992; y: 59; skew-y: -6.9000001; scale-y: 0.591000021; }
        frame 57 { x: 34.5999985; y: 58.7999992; skew-y: -5.4000001; scale-y: 0.597000003; }
        frame 58 { x: 35; y: 58.5999985; skew-y: -4; scale-y: 0.601999998; }
        frame 59 { x: 35.2999992; y: 58.5; skew-y: -2.70000005; scale-y: 0.60799998; }
        frame 60 { x: 35.5999985; y: 58.2999992; skew-y: -1.20000005; scale-y: 0.614000022; }
        frame 61 { x: 35.9000015; y: 58.0999985; skew-y: 0; scale-y: 0.620000005; }
        frame 62 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 63 { x: 35.4000015; y: 57.7000008; skew-y: -1.70000005; scale-y: 0.639999986; }
        frame 64 { x: 35; y: 57.2999992; skew-y: -3.4000001; scale-y: 0.660000026; }
        frame 65 { x: 34.5; y: 56.9000015; skew-y: -5.19999981; scale-y: 0.680000007; }
        frame 66 { x: 34; y: 56.5; skew-y: -6.9000001; scale-y: 0.699999988; }
        frame 67 { x: 33.5; y: 56; skew-y: -8.69999981; scale-y: 0.720000029; }
        frame 68 { x: 33.0999985; y: 55.7000008; skew-y: -10.5; scale-y: 0.74000001; }
        frame 69 { x: 32.5; y: 55.2999992; skew-y: -12.3999996; scale-y: 0.760999978; }
        frame 70 { x: 35.7999992; y: 56; skew-y: -1.20000005; scale-y: 0.727999985; }
        frame 71 { x: 38.9000015; y: 57; skew-y: 9.5; scale-y: 0.694999993; }
        frame 72 { x: 41.9000015; y: 58.2999992; skew-y: 20.7999992; scale-y: 0.662999988; }
        frame 73 { x: 41.7999992; y: 58.4000015; skew-y: -10000; scale-y: 0.662; }
        frame 74 { x: -10000; y: -10000; scale-y: -10000; }
        frame 80 { x: 41.9000015; y: 58.2999992; scale-y: 0.662999988; }
        frame 81 { x: -10000; y: -10000; scale-y: -10000; }
        frame 82 { x: 41.7999992; y: 58.4000015; scale-y: 0.662; }
        frame 83 { x: -10000; y: -10000; scale-y: -10000; }
        frame 88 { x: 41.9000015; y: 58.2999992; scale-y: 0.662999988; }
        frame 89 { x: -10000; y: -10000; scale-y: -10000; }
        frame 90 { x: 41.7999992; y: 58.4000015; scale-y: 0.662; }
        frame 91 { x: -10000; y: -10000; scale-y: -10000; }
        frame 96 { x: 41.9000015; y: 58.2999992; scale-y: 0.662999988; }
        frame 97 { x: 40.5999985; y: 58.2000008; skew-y: 16.5; scale-y: 0.653999984; }
        frame 98 { x: 39.5; y: 58.0999985; skew-y: 12.3000002; scale-y: 0.644999981; }
        frame 99 { x: 38.2000008; y: -10000; skew-y: 8.30000019; scale-y: 0.637000024; }
        frame 100 { x: 37; skew-y: 4; scale-y: 0.628000021; }
        frame 101 { x: 35.9000015; skew-y: 0; scale-y: 0.620000005; }
        frame 102 { x: 35.4000015; y: 57.5999985; skew-y: -1.70000005; scale-y: 0.640999973; }
        frame 103 { x: 34.7999992; y: 57; skew-y: -3.5999999; scale-y: 0.662999988; }
        frame 104 { x: -10000; y: -10000; skew-y: -3.5; scale-y: -10000; }
        frame 105 { skew-y: -3.5999999; }
        frame 106 { x: 35.2999992; y: 57.5999985; skew-y: -1.70000005; scale-y: 0.640999973; }
        frame 107 { x: 35.9000015; y: 58.0999985; skew-y: 0; scale-y: 0.620000005; }
        frame 108 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 109 { x: 35.5999985; y: 57.9000015; scale-x: 0.609000027; scale-y: 0.630999982; }
        frame 110 { x: -10000; y: 57.5999985; scale-x: 0.616999984; scale-y: 0.643000007; }
        frame 111 { x: 35.5; y: 58; scale-x: 0.625999987; scale-y: 0.628000021; }
        frame 112 { x: -10000; y: 58.2999992; scale-x: 0.63499999; scale-y: 0.614000022; }
        frame 113 { x: 35.4000015; y: 58.5999985; scale-x: 0.643999994; scale-y: 0.598999977; }
        frame 114 { x: 35.2999992; y: 59; scale-x: 0.65200001; scale-y: 0.583999991; }
        frame 115 { x: 35.2000008; y: 59.2999992; scale-x: 0.661000013; scale-y: 0.569999993; }
        frame 116 { x: 35; y: 59.5; scale-x: 0.670000017; scale-y: 0.555000007; }
        frame 117 { y: -10000; scale-x: 0.662999988; scale-y: 0.561999977; }
        frame 118 { x: 35.0999985; y: 59.2999992; scale-x: 0.656000018; scale-y: 0.568000019; }
        frame 119 { x: -10000; y: 59; scale-x: 0.648000002; scale-y: 0.575999975; }
        frame 120 { x: 35.2999992; scale-x: 0.639999986; scale-y: 0.583000004; }
        frame 121 { x: 35.4000015; y: 58.7999992; scale-x: 0.632000029; scale-y: 0.589999974; }
        frame 122 { x: 35.5; y: 58.5; scale-x: 0.624000013; scale-y: 0.59799999; }
        frame 123 { x: 35.5999985; y: 58.4000015; scale-x: 0.615999997; scale-y: 0.605000019; }
        frame 124 { x: 35.7000008; y: 58.2999992; scale-x: 0.60799998; scale-y: 0.611999989; }
        frame 125 { x: 35.9000015; y: 58.0999985; scale-x: 0.600000024; scale-y: 0.620000005; }
        frame 126 { x: 41.9000015; y: 58.2999992; skew-y: 20.7999992; scale-x: -10000; scale-y: 0.662999988; }
        frame 127 { x: 41.4000015; y: 58.4000015; skew-y: 19.1000004; scale-y: 0.656000018; }
        frame 128 { x: 40.9000015; y: 58.2999992; skew-y: 17.5; scale-y: 0.649999976; }
        frame 129 { x: 41.4000015; y: 58.4000015; skew-y: 19.1000004; scale-y: 0.656000018; }
        frame 130 { x: 41.9000015; y: 58.2999992; skew-y: 20.7999992; scale-y: 0.662999988; }
    }
    Track {
        source-name: "Magnetshroom_stemcap";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 27.7999992; y: 44.5999985; scale-x: 0.600000024; scale-y: 0.620000005; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_STEMCAP; }
        frame 5 { x: 28.2999992; y: 44.9000015; skew-x: 1.10000002; skew-y: 1; scale-x: -10000; scale-y: 0.614000022; cel: -10000; image: none; }
        frame 6 { x: 28.7999992; y: 45.0999985; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.598999977; scale-y: 0.609000027; }
        frame 7 { x: 29.2999992; y: 45.2999992; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: 0.602999985; }
        frame 8 { x: 29.7999992; y: 45.5; skew-x: 4.80000019; skew-y: 4.5999999; scale-x: 0.59799999; scale-y: 0.59799999; }
        frame 9 { x: 30.3999996; y: 45.5999985; skew-x: 6; skew-y: 5.80000019; scale-x: -10000; scale-y: 0.592000008; }
        frame 10 { x: 30.8999996; y: 46; skew-x: 7.0999999; skew-y: 7; scale-x: 0.597000003; scale-y: 0.587000012; }
        frame 11 { x: 31.3999996; y: 46.0999985; skew-x: 8.39999962; skew-y: 8.30000019; scale-x: -10000; scale-y: 0.58099997; }
        frame 12 { x: 31; y: 46; skew-x: 7; skew-y: 7; scale-x: 0.59799999; scale-y: 0.587000012; }
        frame 13 { x: 30.5; y: 45.7999992; skew-x: 5.80000019; skew-y: 6; scale-x: 0.598999977; scale-y: 0.592000008; }
        frame 14 { x: 30; y: 45.5; skew-x: 4.5; skew-y: 4.80000019; scale-x: -10000; scale-y: 0.59799999; }
        frame 15 { x: 29.5; y: 45.2999992; skew-x: 3.29999995; skew-y: 3.5; scale-y: 0.602999985; }
        frame 16 { x: 28.7999992; y: 45.0999985; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.600000024; scale-y: 0.609000027; }
        frame 17 { x: 28.2999992; y: 44.9000015; skew-x: 1; skew-y: 1.10000002; scale-x: -10000; scale-y: 0.614000022; }
        frame 18 { x: 27.7999992; y: 44.5999985; skew-x: 0; skew-y: 0; scale-y: 0.620000005; }
        frame 19 { x: 27.2999992; y: 45.5; skew-x: -0.899999976; skew-y: -1; scale-x: 0.602999985; scale-y: 0.611000001; }
        frame 20 { x: 26.7000008; y: 46.4000015; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.606000006; scale-y: 0.602999985; }
        frame 21 { x: 26.1000004; y: 47.2999992; skew-x: -3.20000005; skew-y: -3.4000001; scale-x: 0.609000027; scale-y: 0.593999982; }
        frame 22 { x: 25.3999996; y: 48.2000008; skew-x: -4.4000001; skew-y: -4.69999981; scale-x: 0.611000001; scale-y: 0.586000025; }
        frame 23 { x: 24.7999992; y: 49; skew-x: -5.5; skew-y: -5.9000001; scale-x: 0.614000022; scale-y: 0.577000022; }
        frame 24 { x: 24.2999992; y: 50; skew-x: -6.69999981; skew-y: -7.19999981; scale-x: 0.616999984; scale-y: 0.569000006; }
        frame 25 { x: 23.7000008; y: 50.9000015; skew-x: -7.9000001; skew-y: -8.5; scale-x: 0.620000005; scale-y: 0.56099999; }
        frame 26 { x: 24.3999996; y: 49.7000008; skew-x: -6.69999981; skew-y: -7.19999981; scale-x: 0.609000027; scale-y: 0.574999988; }
        frame 27 { x: 25.2000008; y: 48.5999985; skew-x: -5.5; skew-y: -5.9000001; scale-x: 0.598999977; scale-y: 0.591000021; }
        frame 28 { x: 25.7000008; y: 47.7999992; skew-x: -4.19999981; skew-y: -4.69999981; scale-x: -10000; scale-y: 0.596000016; }
        frame 29 { x: 26.2000008; y: 47; skew-x: -3.20000005; skew-y: -3.4000001; scale-y: 0.601999998; }
        frame 30 { x: 26.7999992; y: 46.0999985; skew-x: -2; skew-y: -2.20000005; scale-x: 0.600000024; scale-y: 0.60799998; }
        frame 31 { x: 27.2999992; y: 45.5; skew-x: -0.899999976; skew-y: -1; scale-x: -10000; scale-y: 0.614000022; }
        frame 32 { x: 27.7999992; y: 44.5999985; skew-x: 0; skew-y: 0; scale-y: 0.620000005; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 34 { x: 28.2999992; y: 44.9000015; skew-x: 1.10000002; skew-y: 1; scale-y: 0.614000022; }
        frame 35 { x: 28.7999992; y: 45.0999985; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.598999977; scale-y: 0.609000027; }
        frame 36 { x: 29.2999992; y: 45.2999992; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: 0.602999985; }
        frame 37 { x: 29.7999992; y: 45.5; skew-x: 4.80000019; skew-y: 4.5999999; scale-x: 0.59799999; scale-y: 0.59799999; }
        frame 38 { x: 30.3999996; y: 45.5999985; skew-x: 6; skew-y: 5.80000019; scale-x: -10000; scale-y: 0.592000008; }
        frame 39 { x: 30.8999996; y: 46; skew-x: 7.0999999; skew-y: 7; scale-x: 0.597000003; scale-y: 0.587000012; }
        frame 40 { x: 31.3999996; y: 46.0999985; skew-x: 8.39999962; skew-y: 8.30000019; scale-x: -10000; scale-y: 0.58099997; }
        frame 41 { x: 31; y: 46; skew-x: 7; skew-y: 7; scale-x: 0.59799999; scale-y: 0.587000012; }
        frame 42 { x: 30.5; y: 45.7999992; skew-x: 5.80000019; skew-y: 6; scale-x: 0.598999977; scale-y: 0.592000008; }
        frame 43 { x: 30; y: 45.5; skew-x: 4.5; skew-y: 4.80000019; scale-x: -10000; scale-y: 0.59799999; }
        frame 44 { x: 29.5; y: 45.2999992; skew-x: 3.29999995; skew-y: 3.5; scale-y: 0.602999985; }
        frame 45 { x: 28.7999992; y: 45.0999985; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.600000024; scale-y: 0.609000027; }
        frame 46 { x: 28.2999992; y: 44.9000015; skew-x: 1; skew-y: 1.10000002; scale-x: -10000; scale-y: 0.614000022; }
        frame 47 { x: 27.7999992; y: 44.5999985; skew-x: 0; skew-y: 0; scale-y: 0.620000005; }
        frame 48 { x: 27.2999992; y: 45.5; skew-x: -0.899999976; skew-y: -1; scale-x: 0.602999985; scale-y: 0.611000001; }
        frame 49 { x: 26.7000008; y: 46.4000015; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.606000006; scale-y: 0.602999985; }
        frame 50 { x: 26.1000004; y: 47.2999992; skew-x: -3.20000005; skew-y: -3.4000001; scale-x: 0.609000027; scale-y: 0.593999982; }
        frame 51 { x: 25.3999996; y: 48.2000008; skew-x: -4.4000001; skew-y: -4.69999981; scale-x: 0.611000001; scale-y: 0.586000025; }
        frame 52 { x: 24.7999992; y: 49; skew-x: -5.5; skew-y: -5.9000001; scale-x: 0.614000022; scale-y: 0.577000022; }
        frame 53 { x: 24.2999992; y: 50; skew-x: -6.69999981; skew-y: -7.19999981; scale-x: 0.616999984; scale-y: 0.569000006; }
        frame 54 { x: 23.7000008; y: 50.9000015; skew-x: -7.9000001; skew-y: -8.5; scale-x: 0.620000005; scale-y: 0.56099999; }
        frame 55 { x: 24.3999996; y: 49.7000008; skew-x: -6.69999981; skew-y: -7.19999981; scale-x: 0.609000027; scale-y: 0.574999988; }
        frame 56 { x: 25.2000008; y: 48.5999985; skew-x: -5.5; skew-y: -5.9000001; scale-x: 0.598999977; scale-y: 0.591000021; }
        frame 57 { x: 25.7000008; y: 47.7999992; skew-x: -4.19999981; skew-y: -4.69999981; scale-x: -10000; scale-y: 0.596000016; }
        frame 58 { x: 26.2000008; y: 47; skew-x: -3.20000005; skew-y: -3.4000001; scale-y: 0.601999998; }
        frame 59 { x: 26.7999992; y: 46.0999985; skew-x: -2; skew-y: -2.20000005; scale-x: 0.600000024; scale-y: 0.60799998; }
        frame 60 { x: 27.2999992; y: 45.5; skew-x: -0.899999976; skew-y: -1; scale-x: -10000; scale-y: 0.614000022; }
        frame 61 { x: 27.7999992; y: 44.5999985; skew-x: 0; skew-y: 0; scale-y: 0.620000005; }
        frame 62 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 63 { x: 27.2999992; y: 44.5; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.59799999; scale-y: 0.624000013; }
        frame 64 { x: 26.7999992; y: 44.2000008; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.595000029; scale-y: 0.628000021; }
        frame 65 { x: 26.2999992; y: 44; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.592999995; scale-y: 0.632000029; }
        frame 66 { x: 25.7999992; y: 43.7000008; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.589999974; scale-y: 0.635999978; }
        frame 67 { x: 25.2999992; y: 43.5; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: 0.588; scale-y: 0.640999973; }
        frame 68 { x: 24.7999992; y: 43.4000015; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.584999979; scale-y: 0.644999981; }
        frame 69 { x: 24.2000008; y: 43.0999985; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: 0.583000004; scale-y: 0.648999989; }
        frame 70 { x: 29.7999992; y: 43.2999992; skew-x: 1.5; skew-y: 7.80000019; scale-x: 0.588999987; scale-y: 0.634000003; }
        frame 71 { x: 35.5; y: 44; skew-x: 8.60000038; skew-y: 21.2999992; scale-x: 0.593999982; scale-y: 0.620000005; }
        frame 72 { x: 41.0999985; y: 45; skew-x: 15.8000002; skew-y: 34.7000008; scale-x: 0.600000024; scale-y: 0.606999993; }
        frame 73 { x: -10000; y: 44.9000015; skew-x: -10000; skew-y: 34.5999985; scale-x: 0.598999977; scale-y: 0.606000006; }
        frame 74 { y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { y: 45; skew-y: 34.7000008; scale-x: 0.600000024; scale-y: 0.606999993; }
        frame 81 { y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 82 { y: 44.9000015; skew-y: 34.5999985; scale-x: 0.598999977; scale-y: 0.606000006; }
        frame 83 { y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 88 { y: 45; skew-y: 34.7000008; scale-x: 0.600000024; scale-y: 0.606999993; }
        frame 89 { y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 90 { y: 44.9000015; skew-y: 34.5999985; scale-x: 0.598999977; scale-y: 0.606000006; }
        frame 91 { y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 96 { y: 45; skew-y: 34.7000008; scale-x: 0.600000024; scale-y: 0.606999993; }
        frame 97 { x: 39.5; y: 44.2999992; skew-x: 14.8000002; skew-y: 29.8999996; scale-x: 0.598999977; scale-y: 0.60799998; }
        frame 98 { x: 37.7999992; y: 43.7000008; skew-x: 13.8000002; skew-y: 25.2999992; scale-x: -10000; scale-y: 0.611000001; }
        frame 99 { x: 34.4000015; y: 43.7999992; skew-x: 9.10000038; skew-y: 16.7999992; scale-y: 0.614000022; }
        frame 100 { x: 31.1000004; y: 44; skew-x: 4.5; skew-y: 8.30000019; scale-x: 0.600000024; scale-y: 0.616999984; }
        frame 101 { x: 27.7999992; y: 44.5999985; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.620000005; }
        frame 102 { x: 27.2000008; y: 44.9000015; skew-x: -1.39999998; skew-y: -1.39999998; scale-y: -10000; }
        frame 103 { x: 26.5; y: 45; skew-x: -3; skew-y: -3; }
        frame 104 { x: 26.2000008; y: 45.2999992; skew-x: -3.5; skew-y: -3.5; }
        frame 105 { x: 25.7000008; y: 45.5999985; skew-x: -4.30000019; skew-y: -4.30000019; }
        frame 106 { x: 26.7000008; y: 45.0999985; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 107 { x: 27.7999992; y: 44.5999985; skew-x: 0; skew-y: 0; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 109 { x: 28; y: 44.0999985; scale-x: 0.592000008; scale-y: 0.629000008; }
        frame 110 { y: 43.5; scale-x: 0.583999991; scale-y: 0.638999999; }
        frame 111 { y: 44; scale-x: 0.588999987; scale-y: 0.630999982; }
        frame 112 { x: -10000; y: 44.5; scale-x: 0.595000029; scale-y: 0.623000026; }
        frame 113 { x: 27.7999992; y: 45; scale-x: 0.600000024; scale-y: 0.61500001; }
        frame 114 { x: -10000; y: 45.5999985; scale-x: 0.605000019; scale-y: 0.606999993; }
        frame 115 { x: 27.7000008; y: 46.0999985; scale-x: 0.610000014; scale-y: 0.600000024; }
        frame 116 { x: 27.6000004; y: 46.5999985; scale-x: 0.61500001; scale-y: 0.592000008; }
        frame 117 { x: 27.3999996; y: 47; scale-x: 0.626999974; scale-y: 0.583000004; }
        frame 118 { x: 27; y: 47.4000015; scale-x: 0.638999999; scale-y: 0.573000014; }
        frame 119 { x: 27.2000008; y: 47; scale-x: 0.634000003; scale-y: 0.579999983; }
        frame 120 { x: 27.2999992; y: 46.5999985; scale-x: 0.628000021; scale-y: 0.587000012; }
        frame 121 { x: 27.3999996; y: 46.2000008; scale-x: 0.621999979; scale-y: 0.592999995; }
        frame 122 { x: 27.5; y: 45.9000015; scale-x: 0.616999984; scale-y: 0.600000024; }
        frame 123 { x: 27.6000004; y: 45.5; scale-x: 0.611000001; scale-y: 0.606999993; }
        frame 124 { x: 27.7000008; y: 45; scale-x: 0.606000006; scale-y: 0.612999976; }
        frame 125 { x: 27.7999992; y: 44.5999985; scale-x: 0.600000024; scale-y: 0.620000005; }
        frame 126 { x: 41.0999985; y: 45; skew-x: 15.8000002; skew-y: 34.7000008; scale-x: -10000; scale-y: 0.606999993; }
        frame 127 { x: 40.9000015; y: 44.7999992; skew-x: -10000; skew-y: 34.5999985; scale-x: 0.598999977; scale-y: 0.606000006; }
        frame 128 { x: 40.5999985; y: 44.7000008; skew-y: 34.7000008; scale-x: 0.600000024; scale-y: 0.606999993; }
        frame 129 { x: 40.9000015; y: 44.7999992; skew-y: 34.5999985; scale-x: 0.598999977; scale-y: 0.606000006; }
        frame 130 { x: 41.0999985; y: 45; skew-y: 34.7000008; scale-x: 0.600000024; scale-y: 0.606999993; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 1.89999998; y: -5.5999999; scale-x: 0.600000024; scale-y: 0.620000005; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_HEAD1; }
        frame 5 { x: 3.5; y: -10000; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: 0.614000022; cel: -10000; image: none; }
        frame 6 { x: 5.30000019; skew-x: 3; skew-y: 3; scale-y: 0.609000027; }
        frame 7 { x: 7.0999999; y: -5.5; skew-x: 4.5; skew-y: 4.80000019; scale-x: 0.598999977; scale-y: 0.602999985; }
        frame 8 { x: 8.89999962; y: -5.4000001; skew-x: 6; skew-y: 6.30000019; scale-x: -10000; scale-y: 0.59799999; }
        frame 9 { x: 10.6000004; y: -10000; skew-x: 7.5; skew-y: 7.80000019; scale-y: 0.592999995; }
        frame 10 { x: 12.3999996; y: -5.19999981; skew-x: 9; skew-y: 9.5; scale-y: 0.587000012; }
        frame 11 { x: 14.1999998; y: -10000; skew-x: 10.5; skew-y: 11.1999998; scale-y: 0.582000017; }
        frame 12 { x: 14.5; y: -6.4000001; skew-x: 11.3000002; skew-y: 11.8000002; scale-y: 0.587000012; }
        frame 13 { x: 15; y: -7.80000019; skew-x: 12.3000002; skew-y: 12.6999998; scale-y: 0.592000008; }
        frame 14 { x: 12.3000002; y: -7.4000001; skew-x: 9.80000019; skew-y: 10; scale-y: 0.59799999; }
        frame 15 { x: 9.60000038; y: -7; skew-x: 7.30000019; skew-y: 7.5; scale-y: 0.602999985; }
        frame 16 { x: 7; y: -6.5999999; skew-x: 4.80000019; skew-y: 5; scale-y: 0.609000027; }
        frame 17 { x: 4.30000019; y: -6; skew-x: 2.29999995; skew-y: 2.5; scale-x: 0.600000024; scale-y: 0.614000022; }
        frame 18 { x: 1.89999998; y: -5.5999999; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.620000005; }
        frame 19 { x: 0.100000001; y: -3.5999999; skew-x: -1.20000005; skew-y: -1.39999998; scale-y: 0.614000022; }
        frame 20 { x: -1.5; y: -1.29999995; skew-x: -2.70000005; skew-y: -2.9000001; scale-x: 0.598999977; scale-y: 0.60799998; }
        frame 21 { x: -3.29999995; y: 0.800000012; skew-x: -4.19999981; skew-y: -4.69999981; scale-x: -10000; scale-y: 0.601999998; }
        frame 22 { x: -4.80000019; y: 3.0999999; skew-x: -5.69999981; skew-y: -6.19999981; scale-x: 0.59799999; scale-y: 0.596000016; }
        frame 23 { x: -6.5; y: 5.30000019; skew-x: -7.19999981; skew-y: -7.69999981; scale-x: -10000; scale-y: 0.589999974; }
        frame 24 { x: -8.10000038; y: 7.80000019; skew-x: -8.69999981; skew-y: -9.39999962; scale-x: 0.597000003; scale-y: 0.583000004; }
        frame 25 { x: -9.69999981; y: 10.3000002; skew-x: -10.3000002; skew-y: -11.1000004; scale-x: -10000; scale-y: 0.578000009; }
        frame 26 { x: -9.19999981; y: 8.69999981; skew-x: -9.89999962; skew-y: -10.6999998; scale-y: 0.583000004; }
        frame 27 { x: -8.69999981; y: 7.0999999; skew-x: -9.80000019; skew-y: -10.3000002; scale-x: 0.59799999; scale-y: 0.588999987; }
        frame 28 { x: -6.5999999; y: 4.30000019; skew-x: -7.69999981; skew-y: -8.19999981; scale-x: -10000; scale-y: 0.595000029; }
        frame 29 { x: -4.5; y: 1.89999998; skew-x: -5.69999981; skew-y: -6; scale-y: 0.601000011; }
        frame 30 { x: -2.4000001; y: -0.600000024; skew-x: -3.70000005; skew-y: -3.9000001; scale-x: 0.598999977; scale-y: 0.60799998; }
        frame 31 { x: -0.400000006; y: -3.0999999; skew-x: -1.70000005; skew-y: -1.89999998; scale-x: -10000; scale-y: 0.614000022; }
        frame 32 { x: 1.89999998; y: -5.5999999; skew-x: 0; skew-y: 0; scale-x: 0.600000024; scale-y: 0.620000005; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_MAGNETSHROOM_HEAD2; }
        frame 34 { x: 3.5; skew-x: 1.5; skew-y: 1.5; scale-y: 0.614000022; image: none; }
        frame 35 { x: 5.30000019; skew-x: 3; skew-y: 3; scale-y: 0.609000027; }
        frame 36 { x: 7.0999999; y: -5.5; skew-x: 4.5; skew-y: 4.80000019; scale-x: 0.598999977; scale-y: 0.602999985; }
        frame 37 { x: 8.89999962; y: -5.4000001; skew-x: 6; skew-y: 6.30000019; scale-x: -10000; scale-y: 0.59799999; }
        frame 38 { x: 10.6000004; y: -10000; skew-x: 7.5; skew-y: 7.80000019; scale-y: 0.592999995; }
        frame 39 { x: 12.3999996; y: -5.19999981; skew-x: 9; skew-y: 9.5; scale-y: 0.587000012; }
        frame 40 { x: 14.1999998; y: -10000; skew-x: 10.5; skew-y: 11.1999998; scale-y: 0.582000017; }
        frame 41 { x: 14.5; y: -6.4000001; skew-x: 11.3000002; skew-y: 11.8000002; scale-y: 0.587000012; }
        frame 42 { x: 15; y: -7.80000019; skew-x: 12.3000002; skew-y: 12.6999998; scale-y: 0.592000008; }
        frame 43 { x: 12.3000002; y: -7.4000001; skew-x: 9.80000019; skew-y: 10; scale-y: 0.59799999; }
        frame 44 { x: 9.60000038; y: -7; skew-x: 7.30000019; skew-y: 7.5; scale-y: 0.602999985; }
        frame 45 { x: 7; y: -6.5999999; skew-x: 4.80000019; skew-y: 5; scale-y: 0.609000027; }
        frame 46 { x: 4.30000019; y: -6; skew-x: 2.29999995; skew-y: 2.5; scale-x: 0.600000024; scale-y: 0.614000022; }
        frame 47 { x: 1.89999998; y: -5.5999999; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.620000005; }
        frame 48 { x: 0.100000001; y: -3.5999999; skew-x: -1.20000005; skew-y: -1.39999998; scale-y: 0.614000022; }
        frame 49 { x: -1.5; y: -1.29999995; skew-x: -2.70000005; skew-y: -2.9000001; scale-x: 0.598999977; scale-y: 0.60799998; }
        frame 50 { x: -3.29999995; y: 0.800000012; skew-x: -4.19999981; skew-y: -4.69999981; scale-x: -10000; scale-y: 0.601999998; }
        frame 51 { x: -4.80000019; y: 3.0999999; skew-x: -5.69999981; skew-y: -6.19999981; scale-x: 0.59799999; scale-y: 0.596000016; }
        frame 52 { x: -6.5; y: 5.30000019; skew-x: -7.19999981; skew-y: -7.69999981; scale-x: -10000; scale-y: 0.589999974; }
        frame 53 { x: -8.10000038; y: 7.80000019; skew-x: -8.69999981; skew-y: -9.39999962; scale-x: 0.597000003; scale-y: 0.583000004; }
        frame 54 { x: -9.69999981; y: 10.3000002; skew-x: -10.3000002; skew-y: -11.1000004; scale-x: -10000; scale-y: 0.578000009; }
        frame 55 { x: -9.19999981; y: 8.69999981; skew-x: -9.89999962; skew-y: -10.6999998; scale-y: 0.583000004; }
        frame 56 { x: -8.69999981; y: 7.0999999; skew-x: -9.80000019; skew-y: -10.3000002; scale-x: 0.59799999; scale-y: 0.588999987; }
        frame 57 { x: -6.5999999; y: 4.30000019; skew-x: -7.69999981; skew-y: -8.19999981; scale-x: -10000; scale-y: 0.595000029; }
        frame 58 { x: -4.5; y: 1.89999998; skew-x: -5.69999981; skew-y: -6; scale-y: 0.601000011; }
        frame 59 { x: -2.4000001; y: -0.600000024; skew-x: -3.70000005; skew-y: -3.9000001; scale-x: 0.598999977; scale-y: 0.60799998; }
        frame 60 { x: -0.400000006; y: -3.0999999; skew-x: -1.70000005; skew-y: -1.89999998; scale-x: -10000; scale-y: 0.614000022; }
        frame 61 { x: 1.89999998; y: -5.5999999; skew-x: 0; skew-y: 0; scale-x: 0.600000024; scale-y: 0.620000005; }
        frame 62 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_MAGNETSHROOM_HEAD1; }
        frame 63 { x: 0.699999988; y: -5.80000019; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.59799999; scale-y: 0.624000013; image: none; }
        frame 64 { x: -0.200000003; y: -6; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.595000029; scale-y: 0.628000021; }
        frame 65 { x: -1.29999995; y: -6.19999981; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.592999995; scale-y: 0.632000029; }
        frame 66 { x: -2.4000001; y: -6.4000001; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.589999974; scale-y: 0.635999978; }
        frame 67 { x: -3.5999999; y: -6.69999981; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: 0.588; scale-y: 0.640999973; }
        frame 68 { x: -4.80000019; y: -10000; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.584999979; scale-y: 0.644999981; }
        frame 69 { x: -5.80000019; y: -6.80000019; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: 0.583000004; scale-y: 0.648999989; }
        frame 70 { x: 11.3999996; y: -10.1999998; skew-x: 7; skew-y: 9.5; scale-x: 0.587000012; scale-y: 0.634000003; }
        frame 71 { x: 29.5; y: -11.3000002; skew-x: 19.6000004; skew-y: 24.7999992; scale-x: 0.592000008; scale-y: 0.620000005; }
        frame 72 { x: 48.0999985; y: -9.89999962; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 73 { x: 48; y: -10000; skew-x: 32.2999992; skew-y: 40.0999985; scale-x: 0.596000016; scale-y: 0.606000006; image: IMAGE_REANIM_MAGNETSHROOM_HEAD4; }
        frame 74 { x: 48.0999985; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 75 { x: 48; skew-x: 32.2999992; skew-y: 40.0999985; scale-x: 0.596000016; scale-y: 0.606000006; image: IMAGE_REANIM_MAGNETSHROOM_HEAD4; }
        frame 76 { x: 48.0999985; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 77 { x: 48; skew-x: 32.2999992; skew-y: 40.0999985; scale-x: 0.596000016; scale-y: 0.606000006; image: IMAGE_REANIM_MAGNETSHROOM_HEAD4; }
        frame 78 { x: 48.0999985; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 79 { x: 48; skew-x: 32.2999992; skew-y: 40.0999985; scale-x: 0.596000016; scale-y: 0.606000006; image: IMAGE_REANIM_MAGNETSHROOM_HEAD4; }
        frame 80 { x: 48.0999985; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 81 { x: 48; skew-x: 32.2999992; skew-y: 40.0999985; scale-x: 0.596000016; scale-y: 0.606000006; image: IMAGE_REANIM_MAGNETSHROOM_HEAD4; }
        frame 82 { x: 48.0999985; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 83 { x: 48; skew-x: 32.2999992; skew-y: 40.0999985; scale-x: 0.596000016; scale-y: 0.606000006; image: IMAGE_REANIM_MAGNETSHROOM_HEAD4; }
        frame 84 { x: 48.0999985; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 85 { x: 48; skew-x: 32.2999992; skew-y: 40.0999985; scale-x: 0.596000016; scale-y: 0.606000006; image: IMAGE_REANIM_MAGNETSHROOM_HEAD4; }
        frame 86 { x: 48.0999985; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 87 { x: 48; skew-x: 32.2999992; skew-y: 40.0999985; scale-x: 0.596000016; scale-y: 0.606000006; image: IMAGE_REANIM_MAGNETSHROOM_HEAD4; }
        frame 88 { x: 48.0999985; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 89 { x: 48; skew-x: 32.2999992; skew-y: 40.0999985; scale-x: 0.596000016; scale-y: 0.606000006; image: IMAGE_REANIM_MAGNETSHROOM_HEAD4; }
        frame 90 { x: 48.0999985; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 91 { x: 48; skew-x: 32.2999992; skew-y: 40.0999985; scale-x: 0.596000016; scale-y: 0.606000006; image: IMAGE_REANIM_MAGNETSHROOM_HEAD4; }
        frame 92 { x: 48.0999985; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 93 { x: 48; skew-x: 32.2999992; skew-y: 40.0999985; scale-x: 0.596000016; scale-y: 0.606000006; image: IMAGE_REANIM_MAGNETSHROOM_HEAD4; }
        frame 94 { x: 48.0999985; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 95 { x: 48; skew-x: 32.2999992; skew-y: 40.0999985; scale-x: 0.596000016; scale-y: 0.606000006; image: IMAGE_REANIM_MAGNETSHROOM_HEAD4; }
        frame 96 { x: 48.0999985; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; image: IMAGE_REANIM_MAGNETSHROOM_HEAD3; }
        frame 97 { x: 43.2999992; y: -11; skew-x: 30.1000004; skew-y: 36.5999985; scale-x: 0.596000016; scale-y: 0.60799998; image: none; }
        frame 98 { x: 38.4000015; y: -12.5; skew-x: 28.1000004; skew-y: 32.9000015; scale-x: 0.597000003; scale-y: 0.611000001; }
        frame 99 { x: 25.7999992; y: -11.6000004; skew-x: 18.7999992; skew-y: 21.7999992; scale-x: 0.59799999; scale-y: 0.612999976; }
        frame 100 { x: 13.6000004; y: -9.10000038; skew-x: 9.30000019; skew-y: 10.8000002; scale-x: 0.598999977; scale-y: 0.615999997; }
        frame 101 { x: 1.89999998; y: -5.5999999; skew-x: 0; skew-y: 0; scale-x: 0.600000024; scale-y: 0.620000005; image: IMAGE_REANIM_MAGNETSHROOM_HEAD1; }
        frame 102 { x: -0; y: -4.69999981; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: -10000; scale-y: -10000; image: none; }
        frame 103 { x: -2; y: -3.70000005; skew-x: -3; skew-y: -3; }
        frame 104 { x: -4.19999981; y: -2.29999995; skew-x: -4.69999981; skew-y: -4.69999981; scale-y: 0.619000018; }
        frame 105 { x: -6.5; y: -0.899999976; skew-x: -6.5; skew-y: -6.5; scale-y: 0.620000005; }
        frame 106 { x: -2.29999995; y: -3.29999995; skew-x: -3.20000005; skew-y: -3.20000005; scale-y: -10000; }
        frame 107 { x: 1.89999998; y: -5.5999999; skew-x: 0; skew-y: 0; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; image: IMAGE_REANIM_MAGNETSHROOM_HEAD2; }
        frame 109 { x: 2.29999995; y: -7; scale-x: 0.592000008; scale-y: 0.629000008; image: none; }
        frame 110 { x: 2.79999995; y: -8.39999962; scale-x: 0.583999991; scale-y: 0.638999999; }
        frame 111 { x: 2.5; y: -7.19999981; scale-x: 0.588999987; scale-y: 0.630999982; }
        frame 112 { x: 2.20000005; y: -6; scale-x: 0.595000029; scale-y: 0.623000026; }
        frame 113 { x: 1.89999998; y: -4.9000001; scale-x: 0.600000024; scale-y: 0.61500001; }
        frame 114 { x: 1.60000002; y: -3.70000005; scale-x: 0.605000019; scale-y: 0.606999993; }
        frame 115 { x: 1.29999995; y: -2.5999999; scale-x: 0.610000014; scale-y: 0.600000024; }
        frame 116 { x: 1; y: -1.29999995; scale-x: 0.61500001; scale-y: 0.592000008; }
        frame 117 { x: 0.600000024; y: -0.800000012; scale-x: 0.621999979; scale-y: 0.589999974; }
        frame 118 { x: 0.200000003; y: -0.200000003; scale-x: 0.629999995; scale-y: 0.588; }
        frame 119 { x: 0.400000006; y: -0.899999976; scale-x: 0.625; scale-y: 0.592999995; }
        frame 120 { x: 0.699999988; y: -1.70000005; scale-x: 0.620999992; scale-y: 0.597000003; }
        frame 121 { x: 0.899999976; y: -2.5; scale-x: 0.616999984; scale-y: 0.601999998; }
        frame 122 { x: 1.20000005; y: -3.29999995; scale-x: 0.612999976; scale-y: 0.606000006; }
        frame 123 { x: 1.39999998; y: -4; scale-x: 0.60799998; scale-y: 0.611000001; }
        frame 124 { x: 1.60000002; y: -4.80000019; scale-x: 0.603999972; scale-y: 0.61500001; }
        frame 125 { x: 1.89999998; y: -5.5999999; scale-x: 0.600000024; scale-y: 0.620000005; }
        frame 126 { x: 48.0999985; y: -9.89999962; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; }
        frame 127 { x: 45.9000015; y: -9.60000038; skew-x: 30.1000004; skew-y: 38.0999985; scale-x: 0.596000016; scale-y: 0.606000006; }
        frame 128 { x: 43.5999985; y: -10000; skew-x: 28.1000004; skew-y: 35.9000015; scale-x: 0.597000003; scale-y: -10000; }
        frame 129 { x: 45.9000015; skew-x: 30.1000004; skew-y: 38.0999985; scale-x: 0.596000016; }
        frame 130 { x: 48.0999985; y: -9.89999962; skew-x: 32.4000015; skew-y: 40.2000008; scale-x: 0.597000003; scale-y: 0.606999993; }
    }
    Track {
        source-name: "Magnetshroom_stemcap_overlay";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 27.7999992; y: 44.7000008; scale-x: 0.600000024; scale-y: 0.620000005; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_STEMCAP_OVERLAY; }
        frame 5 { x: 28.2999992; y: 45; skew-x: 1.10000002; skew-y: 1; scale-x: 0.601000011; scale-y: 0.614000022; cel: -10000; image: none; }
        frame 6 { x: 28.7000008; y: 45.0999985; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: -10000; scale-y: 0.609000027; }
        frame 7 { x: 29.2999992; y: 45.2999992; skew-x: 3.5; skew-y: 3.5; scale-x: 0.601999998; scale-y: 0.602999985; }
        frame 8 { x: 29.6000004; y: 45.5; skew-x: 4.80000019; skew-y: 4.5999999; scale-x: 0.602999985; scale-y: 0.59799999; }
        frame 9 { x: 30.2000008; y: 45.7000008; skew-x: 6; skew-y: 5.80000019; scale-x: 0.603999972; scale-y: 0.592000008; }
        frame 10 { x: 30.7000008; y: 46; skew-x: 7.0999999; skew-y: 7; scale-x: -10000; scale-y: 0.587000012; }
        frame 11 { x: 31.2000008; y: 46.2000008; skew-x: 8.39999962; skew-y: 8.30000019; scale-x: 0.605000019; scale-y: 0.58099997; }
        frame 12 { x: 30.8999996; y: 46.0999985; skew-x: 7; skew-y: 7; scale-x: 0.601999998; scale-y: 0.587000012; }
        frame 13 { x: 30.5; y: 45.9000015; skew-x: 5.80000019; skew-y: 6; scale-x: 0.598999977; scale-y: 0.592000008; }
        frame 14 { x: 30; y: 45.5999985; skew-x: 4.5; skew-y: 4.80000019; scale-x: -10000; scale-y: 0.59799999; }
        frame 15 { x: 29.3999996; y: 45.4000015; skew-x: 3.29999995; skew-y: 3.5; scale-y: 0.602999985; }
        frame 16 { x: 28.7999992; y: 45.0999985; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.600000024; scale-y: 0.609000027; }
        frame 17 { x: 28.2999992; y: 45; skew-x: 1; skew-y: 1.10000002; scale-x: -10000; scale-y: 0.614000022; }
        frame 18 { x: 27.7999992; y: 44.7000008; skew-x: 0; skew-y: 0; scale-y: 0.620000005; }
        frame 19 { x: 27.2000008; y: 45.5; skew-x: -0.899999976; skew-y: -1; scale-x: 0.602999985; scale-y: 0.614000022; }
        frame 20 { x: 26.6000004; y: 46.4000015; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.606000006; scale-y: 0.60799998; }
        frame 21 { x: 26; y: 47.2999992; skew-x: -3.20000005; skew-y: -3.4000001; scale-x: 0.60799998; scale-y: 0.601999998; }
        frame 22 { x: 25.3999996; y: 48.0999985; skew-x: -4.4000001; skew-y: -4.69999981; scale-x: 0.611000001; scale-y: 0.597000003; }
        frame 23 { x: 24.7999992; y: 48.9000015; skew-x: -5.5; skew-y: -5.9000001; scale-x: 0.614000022; scale-y: 0.591000021; }
        frame 24 { x: 24.2000008; y: 49.9000015; skew-x: -6.69999981; skew-y: -7.19999981; scale-x: 0.616999984; scale-y: 0.584999979; }
        frame 25 { x: 23.6000004; y: 50.5999985; skew-x: -7.9000001; skew-y: -8.5; scale-x: 0.620000005; scale-y: 0.578999996; }
        frame 26 { x: 24.2999992; y: 49.5999985; skew-x: -6.69999981; skew-y: -7.19999981; scale-x: 0.609000027; scale-y: 0.584999979; }
        frame 27 { x: 25.2000008; y: 48.5999985; skew-x: -5.5; skew-y: -5.9000001; scale-x: 0.598999977; scale-y: 0.591000021; }
        frame 28 { x: 25.7000008; y: 47.9000015; skew-x: -4.19999981; skew-y: -4.69999981; scale-x: -10000; scale-y: 0.596000016; }
        frame 29 { x: 26.2000008; y: 47.0999985; skew-x: -3.20000005; skew-y: -3.4000001; scale-y: 0.601999998; }
        frame 30 { x: 26.7999992; y: 46.2999992; skew-x: -2; skew-y: -2.20000005; scale-x: 0.600000024; scale-y: 0.60799998; }
        frame 31 { x: 27.2999992; y: 45.5; skew-x: -0.899999976; skew-y: -1; scale-x: -10000; scale-y: 0.614000022; }
        frame 32 { x: 27.7999992; y: 44.7000008; skew-x: 0; skew-y: 0; scale-y: 0.620000005; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 34 { x: 28.2999992; y: 45; skew-x: 1.10000002; skew-y: 1; scale-x: 0.601000011; scale-y: 0.614000022; }
        frame 35 { x: 28.7000008; y: 45.0999985; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: -10000; scale-y: 0.609000027; }
        frame 36 { x: 29.2999992; y: 45.2999992; skew-x: 3.5; skew-y: 3.5; scale-x: 0.601999998; scale-y: 0.602999985; }
        frame 37 { x: 29.6000004; y: 45.5; skew-x: 4.80000019; skew-y: 4.5999999; scale-x: 0.602999985; scale-y: 0.59799999; }
        frame 38 { x: 30.2000008; y: 45.7000008; skew-x: 6; skew-y: 5.80000019; scale-x: 0.603999972; scale-y: 0.592000008; }
        frame 39 { x: 30.7000008; y: 46; skew-x: 7.0999999; skew-y: 7; scale-x: -10000; scale-y: 0.587000012; }
        frame 40 { x: 31.2000008; y: 46.2000008; skew-x: 8.39999962; skew-y: 8.30000019; scale-x: 0.605000019; scale-y: 0.58099997; }
        frame 41 { x: 30.8999996; y: 46.0999985; skew-x: 7; skew-y: 7; scale-x: 0.601999998; scale-y: 0.587000012; }
        frame 42 { x: 30.5; y: 45.9000015; skew-x: 5.80000019; skew-y: 6; scale-x: 0.598999977; scale-y: 0.592000008; }
        frame 43 { x: 30; y: 45.5999985; skew-x: 4.5; skew-y: 4.80000019; scale-x: -10000; scale-y: 0.59799999; }
        frame 44 { x: 29.3999996; y: 45.4000015; skew-x: 3.29999995; skew-y: 3.5; scale-y: 0.602999985; }
        frame 45 { x: 28.7999992; y: 45.0999985; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.600000024; scale-y: 0.609000027; }
        frame 46 { x: 28.2999992; y: 45; skew-x: 1; skew-y: 1.10000002; scale-x: -10000; scale-y: 0.614000022; }
        frame 47 { x: 27.7999992; y: 44.7000008; skew-x: 0; skew-y: 0; scale-y: 0.620000005; }
        frame 48 { x: 27.2000008; y: 45.5; skew-x: -0.899999976; skew-y: -1; scale-x: 0.602999985; scale-y: 0.614000022; }
        frame 49 { x: 26.6000004; y: 46.4000015; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.606000006; scale-y: 0.60799998; }
        frame 50 { x: 26; y: 47.2999992; skew-x: -3.20000005; skew-y: -3.4000001; scale-x: 0.60799998; scale-y: 0.601999998; }
        frame 51 { x: 25.3999996; y: 48.0999985; skew-x: -4.4000001; skew-y: -4.69999981; scale-x: 0.611000001; scale-y: 0.597000003; }
        frame 52 { x: 24.7999992; y: 48.9000015; skew-x: -5.5; skew-y: -5.9000001; scale-x: 0.614000022; scale-y: 0.591000021; }
        frame 53 { x: 24.2000008; y: 49.9000015; skew-x: -6.69999981; skew-y: -7.19999981; scale-x: 0.616999984; scale-y: 0.584999979; }
        frame 54 { x: 23.6000004; y: 50.5999985; skew-x: -7.9000001; skew-y: -8.5; scale-x: 0.620000005; scale-y: 0.578999996; }
        frame 55 { x: 24.2999992; y: 49.5999985; skew-x: -6.69999981; skew-y: -7.19999981; scale-x: 0.609000027; scale-y: 0.584999979; }
        frame 56 { x: 25.2000008; y: 48.5999985; skew-x: -5.5; skew-y: -5.9000001; scale-x: 0.598999977; scale-y: 0.591000021; }
        frame 57 { x: 25.7000008; y: 47.9000015; skew-x: -4.19999981; skew-y: -4.69999981; scale-x: -10000; scale-y: 0.596000016; }
        frame 58 { x: 26.2000008; y: 47.0999985; skew-x: -3.20000005; skew-y: -3.4000001; scale-y: 0.601999998; }
        frame 59 { x: 26.7999992; y: 46.2999992; skew-x: -2; skew-y: -2.20000005; scale-x: 0.600000024; scale-y: 0.60799998; }
        frame 60 { x: 27.2999992; y: 45.5; skew-x: -0.899999976; skew-y: -1; scale-x: -10000; scale-y: 0.614000022; }
        frame 61 { x: 27.7999992; y: 44.7000008; skew-x: 0; skew-y: 0; scale-y: 0.620000005; }
        frame 62 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 63 { x: 27.2999992; y: 44.5; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.59799999; scale-y: 0.624000013; }
        frame 64 { x: 26.7000008; y: 44.2999992; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.595000029; scale-y: 0.628000021; }
        frame 65 { x: 26.2000008; y: 44; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.592999995; scale-y: 0.632000029; }
        frame 66 { x: 25.7999992; y: 43.7999992; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.589999974; scale-y: 0.635999978; }
        frame 67 { x: 25.2999992; y: 43.5999985; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: 0.588; scale-y: 0.640999973; }
        frame 68 { x: 24.7000008; y: 43.4000015; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.584999979; scale-y: 0.644999981; }
        frame 69 { x: 24.1000004; y: 43.0999985; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: 0.583000004; scale-y: 0.648999989; }
        frame 70 { x: 29.6000004; y: 43.2999992; skew-x: 2.0999999; skew-y: 6.80000019; scale-x: 0.588; scale-y: 0.629000008; }
        frame 71 { x: 35.0999985; y: 43.7000008; skew-x: 10; skew-y: 19; scale-x: 0.593999982; scale-y: 0.610000014; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 73 { cel: -10000; }
        frame 101 { x: 27.7999992; y: 44.7000008; skew-x: 0; skew-y: 0; scale-x: 0.600000024; scale-y: 0.620000005; cel: 0; }
        frame 102 { x: 27.1000004; y: 44.9000015; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 103 { x: 26.3999996; y: 45.0999985; skew-x: -3; skew-y: -3; }
        frame 104 { x: 26.1000004; y: 45.4000015; skew-x: -3.5; skew-y: -3.5; }
        frame 105 { x: 25.6000004; y: 45.7000008; skew-x: -4.30000019; skew-y: -4.30000019; }
        frame 106 { x: 26.7000008; y: 45.2000008; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 107 { x: 27.7999992; y: 44.7000008; skew-x: 0; skew-y: 0; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 109 { x: 27.8999996; y: 44.2000008; scale-x: 0.592000008; scale-y: 0.629000008; }
        frame 110 { x: 28; y: 43.5; scale-x: 0.583999991; scale-y: 0.638999999; }
        frame 111 { x: 27.8999996; y: 44; scale-x: 0.588999987; scale-y: 0.630999982; }
        frame 112 { x: -10000; y: 44.5999985; scale-x: 0.595000029; scale-y: 0.623000026; }
        frame 113 { x: 27.7999992; y: 45.0999985; scale-x: 0.600000024; scale-y: 0.61500001; }
        frame 114 { x: 27.7000008; y: 45.5999985; scale-x: 0.605000019; scale-y: 0.606999993; }
        frame 115 { x: 27.6000004; y: 46.2000008; scale-x: 0.610000014; scale-y: 0.600000024; }
        frame 116 { x: -10000; y: 46.7000008; scale-x: 0.61500001; scale-y: 0.592000008; }
        frame 117 { x: 27.2999992; y: 47.0999985; scale-x: 0.626999974; scale-y: 0.583000004; }
        frame 118 { x: 27; y: 47.5; scale-x: 0.638999999; scale-y: 0.573000014; }
        frame 119 { x: 27.1000004; y: 47.0999985; scale-x: 0.634000003; scale-y: 0.579999983; }
        frame 120 { x: 27.2000008; y: 46.5999985; scale-x: 0.628000021; scale-y: 0.587000012; }
        frame 121 { x: 27.2999992; y: 46.2999992; scale-x: 0.621999979; scale-y: 0.592999995; }
        frame 122 { x: 27.3999996; y: 45.9000015; scale-x: 0.616999984; scale-y: 0.600000024; }
        frame 123 { x: 27.5; y: 45.5; scale-x: 0.611000001; scale-y: 0.606999993; }
        frame 124 { x: 27.7000008; y: 45.0999985; scale-x: 0.606000006; scale-y: 0.612999976; }
        frame 125 { x: 27.7999992; y: 44.7000008; scale-x: 0.600000024; scale-y: 0.620000005; }
        frame 126 { x: 40.5; y: 43.7000008; skew-x: 18.6000004; skew-y: 27.6000004; scale-x: 0.593999982; scale-y: 0.609000027; }
        frame 127 { x: 39.9000015; y: 44; skew-x: 16.7999992; skew-y: 25.7999992; scale-x: 0.592999995; scale-y: 0.60799998; }
        frame 128 { x: 39.2999992; y: 44.2999992; skew-x: 15.3000002; skew-y: 24.2999992; scale-x: -10000; scale-y: 0.609000027; }
        frame 129 { x: 39.7999992; y: 44; skew-x: 16.7999992; skew-y: 25.7999992; scale-y: 0.60799998; }
        frame 130 { x: 40.5; y: 43.7000008; skew-x: 18.6000004; skew-y: 27.6000004; scale-x: 0.593999982; scale-y: 0.609000027; }
    }
    Track {
        source-name: "anim_eyes";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 34.9000015; y: 36.4000015; scale-x: 0.600000024; scale-y: 0.620000005; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_EYE1; }
        frame 5 { x: 35.4000015; y: 36.7999992; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: 0.614000022; cel: -10000; image: none; }
        frame 6 { x: 36; y: 37.2000008; skew-x: 3; skew-y: 3; scale-y: 0.609000027; }
        frame 7 { x: 36.5999985; y: 37.7000008; skew-x: 4.5; skew-y: 4.80000019; scale-x: 0.598999977; scale-y: 0.602999985; }
        frame 8 { x: 37.2000008; y: 38.0999985; skew-x: 6; skew-y: 6.30000019; scale-x: -10000; scale-y: 0.59799999; }
        frame 9 { x: 37.7999992; y: 38.5999985; skew-x: 7.5; skew-y: 7.80000019; scale-y: 0.592999995; }
        frame 10 { x: 38.4000015; y: 39; skew-x: 9; skew-y: 9.5; scale-y: 0.587000012; }
        frame 11 { x: 39; y: 39.5; skew-x: 10.5; skew-y: 11.1999998; scale-y: 0.582000017; }
        frame 12 { x: 38.7000008; y: 39; skew-x: 11.3000002; skew-y: 11.8000002; scale-y: 0.587000012; }
        frame 13 { x: 38.5; y: 38.5; skew-x: 12.3000002; skew-y: 12.6999998; scale-y: 0.592000008; }
        frame 14 { x: 37.7000008; y: 38.0999985; skew-x: 9.80000019; skew-y: 10; scale-y: 0.59799999; }
        frame 15 { x: 37; y: 37.5999985; skew-x: 7.30000019; skew-y: 7.5; scale-y: 0.602999985; }
        frame 16 { x: 36.2999992; y: 37.2999992; skew-x: 4.80000019; skew-y: 5; scale-y: 0.609000027; }
        frame 17 { x: 35.5; y: 36.9000015; skew-x: 2.29999995; skew-y: 2.5; scale-x: 0.600000024; scale-y: 0.614000022; }
        frame 18 { x: 34.9000015; y: 36.4000015; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.620000005; }
        frame 19 { x: 34.0999985; y: 37.2000008; skew-x: -1.20000005; skew-y: -1.20000005; scale-y: 0.614000022; }
        frame 20 { x: 33.4000015; y: 38.0999985; skew-x: -2.70000005; skew-y: -2.70000005; scale-y: 0.60799998; }
        frame 21 { x: 32.7999992; y: 39; skew-x: -3.9000001; skew-y: -4.19999981; scale-x: 0.598999977; scale-y: 0.601999998; }
        frame 22 { x: 32; y: 40; skew-x: -5.4000001; skew-y: -5.69999981; scale-x: -10000; scale-y: 0.597000003; }
        frame 23 { x: 31.3999996; y: 40.9000015; skew-x: -6.69999981; skew-y: -7.19999981; scale-y: 0.591000021; }
        frame 24 { x: 30.7000008; y: 41.7999992; skew-x: -8.19999981; skew-y: -8.69999981; scale-y: 0.584999979; }
        frame 25 { x: 30; y: 42.7999992; skew-x: -9.60000038; skew-y: -10.3000002; scale-y: 0.578999996; }
        frame 26 { x: 30.3999996; y: 41.5999985; skew-x: -9.39999962; skew-y: -9.89999962; scale-y: 0.584999979; }
        frame 27 { x: 30.7000008; y: 40.5999985; skew-x: -9.30000019; skew-y: -9.80000019; scale-y: 0.591000021; }
        frame 28 { x: 31.6000004; y: 39.7999992; skew-x: -7.19999981; skew-y: -7.69999981; scale-y: 0.596000016; }
        frame 29 { x: 32.2999992; y: 38.9000015; skew-x: -5.4000001; skew-y: -5.69999981; scale-y: 0.601999998; }
        frame 30 { x: 33.2000008; y: 38; skew-x: -3.5; skew-y: -3.70000005; scale-y: 0.60799998; }
        frame 31 { x: 34; y: 37.2000008; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.600000024; scale-y: 0.614000022; }
        frame 32 { x: 34.9000015; y: 36.4000015; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.620000005; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 34 { x: 35.4000015; y: 36.7999992; skew-x: 1.5; skew-y: 1.5; scale-y: 0.614000022; }
        frame 35 { x: 36; y: 37.2000008; skew-x: 3; skew-y: 3; scale-y: 0.609000027; }
        frame 36 { x: 36.5999985; y: 37.7000008; skew-x: 4.5; skew-y: 4.80000019; scale-x: 0.598999977; scale-y: 0.602999985; }
        frame 37 { x: 37.2000008; y: 38.0999985; skew-x: 6; skew-y: 6.30000019; scale-x: -10000; scale-y: 0.59799999; }
        frame 38 { x: 37.7999992; y: 38.5999985; skew-x: 7.5; skew-y: 7.80000019; scale-y: 0.592999995; }
        frame 39 { x: 38.4000015; y: 39; skew-x: 9; skew-y: 9.5; scale-y: 0.587000012; }
        frame 40 { x: 39; y: 39.5; skew-x: 10.5; skew-y: 11.1999998; scale-y: 0.582000017; }
        frame 41 { x: 38.7000008; y: 39; skew-x: 11.3000002; skew-y: 11.8000002; scale-y: 0.587000012; }
        frame 42 { x: 38.5; y: 38.5; skew-x: 12.3000002; skew-y: 12.6999998; scale-y: 0.592000008; }
        frame 43 { x: 37.7000008; y: 38.0999985; skew-x: 9.80000019; skew-y: 10; scale-y: 0.59799999; }
        frame 44 { x: 37; y: 37.5999985; skew-x: 7.30000019; skew-y: 7.5; scale-y: 0.602999985; }
        frame 45 { x: 36.2999992; y: 37.2999992; skew-x: 4.80000019; skew-y: 5; scale-y: 0.609000027; }
        frame 46 { x: 35.5; y: 36.9000015; skew-x: 2.29999995; skew-y: 2.5; scale-x: 0.600000024; scale-y: 0.614000022; }
        frame 47 { x: 34.9000015; y: 36.4000015; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.620000005; }
        frame 48 { x: 34.0999985; y: 37.2000008; skew-x: -1.20000005; skew-y: -1.20000005; scale-y: 0.614000022; }
        frame 49 { x: 33.4000015; y: 38.0999985; skew-x: -2.70000005; skew-y: -2.70000005; scale-y: 0.60799998; }
        frame 50 { x: 32.7999992; y: 39; skew-x: -3.9000001; skew-y: -4.19999981; scale-x: 0.598999977; scale-y: 0.601999998; }
        frame 51 { x: 32; y: 40; skew-x: -5.4000001; skew-y: -5.69999981; scale-x: -10000; scale-y: 0.597000003; }
        frame 52 { x: 31.3999996; y: 40.9000015; skew-x: -6.69999981; skew-y: -7.19999981; scale-y: 0.591000021; }
        frame 53 { x: 30.7000008; y: 41.7999992; skew-x: -8.19999981; skew-y: -8.69999981; scale-y: 0.584999979; }
        frame 54 { x: 30; y: 42.7999992; skew-x: -9.60000038; skew-y: -10.3000002; scale-y: 0.578999996; }
        frame 55 { x: 30.3999996; y: 41.5999985; skew-x: -9.39999962; skew-y: -9.89999962; scale-y: 0.584999979; }
        frame 56 { x: 30.7000008; y: 40.5999985; skew-x: -9.30000019; skew-y: -9.80000019; scale-y: 0.591000021; }
        frame 57 { x: 31.6000004; y: 39.7999992; skew-x: -7.19999981; skew-y: -7.69999981; scale-y: 0.596000016; }
        frame 58 { x: 32.2999992; y: 38.9000015; skew-x: -5.4000001; skew-y: -5.69999981; scale-y: 0.601999998; }
        frame 59 { x: 33.2000008; y: 38; skew-x: -3.5; skew-y: -3.70000005; scale-y: 0.60799998; }
        frame 60 { x: 34; y: 37.2000008; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.600000024; scale-y: 0.614000022; }
        frame 61 { x: 34.9000015; y: 36.4000015; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.620000005; }
        frame 62 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 63 { x: 34.2999992; y: 36; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.59799999; scale-y: 0.624000013; }
        frame 64 { x: 33.5; y: 35.5; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.595000029; scale-y: 0.628000021; }
        frame 65 { x: 32.9000015; y: 35.2000008; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.592999995; scale-y: 0.632000029; }
        frame 66 { x: 32.0999985; y: 34.7999992; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.589999974; scale-y: 0.635999978; }
        frame 67 { x: 31.5; y: 34.5; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: 0.588; scale-y: 0.640999973; }
        frame 68 { x: 30.8999996; y: 34; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.584999979; scale-y: 0.644999981; }
        frame 69 { x: 30.2000008; y: 33.7000008; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: 0.583000004; scale-y: 0.648999989; }
        frame 70 { x: 36.9000015; y: 35.5; skew-x: 5; skew-y: 5; scale-x: 0.588; scale-y: 0.632000029; }
        frame 71 { x: 43.7000008; y: 37.5; skew-x: 15.6000004; skew-y: 15.6000004; scale-x: 0.592999995; scale-y: 0.61500001; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 73 { cel: -10000; }
        frame 101 { x: 34.9000015; y: 36.4000015; skew-x: 0; skew-y: 0; scale-x: 0.600000024; scale-y: 0.620000005; cel: 0; }
        frame 102 { x: 34; y: -10000; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 103 { x: 33; skew-x: -3; skew-y: -3; }
        frame 104 { x: 32; y: 36.5; skew-x: -4.69999981; skew-y: -4.69999981; scale-y: 0.619000018; }
        frame 105 { x: 31; y: 36.9000015; skew-x: -6.5; skew-y: -6.5; scale-y: 0.620000005; }
        frame 106 { x: 32.9000015; y: 36.5999985; skew-x: -3.20000005; skew-y: -3.20000005; scale-y: -10000; }
        frame 107 { x: 34.9000015; y: 36.4000015; skew-x: 0; skew-y: 0; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 109 { cel: -10000; }
        frame 126 { x: 50.0999985; y: 39.7999992; skew-x: 23.8999996; skew-y: 23.8999996; scale-x: 0.592999995; scale-y: 0.61500001; cel: 0; }
        frame 127 { x: 49.5999985; y: -10000; skew-x: 21.2999992; skew-y: 21.2999992; scale-x: 0.592000008; scale-y: 0.614000022; cel: -10000; }
        frame 128 { x: 49.2999992; y: 39.7000008; skew-x: 18.7999992; skew-y: 18.7999992; scale-x: 0.592999995; scale-y: 0.61500001; }
        frame 129 { x: 49.7999992; y: 39.7999992; skew-x: 21.2999992; skew-y: 21.2999992; scale-x: 0.592000008; scale-y: 0.614000022; }
        frame 130 { x: 50.0999985; y: -10000; skew-x: 23.8999996; skew-y: 23.8999996; scale-x: 0.592999995; scale-y: 0.61500001; }
    }
    Track {
        source-name: "anim_eyes2";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 49.5999985; y: 31.6000004; scale-x: 0.569999993; scale-y: 0.588999987; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_EYE1; }
        frame 5 { x: 50.2999992; y: 32.4000015; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: 0.583999991; cel: -10000; image: none; }
        frame 6 { x: 50.9000015; y: 33.2000008; skew-x: 3; skew-y: 3; scale-y: 0.578000009; }
        frame 7 { x: 51.5999985; y: 34.2000008; skew-x: 4.5; skew-y: 4.80000019; scale-x: 0.569000006; scale-y: 0.573000014; }
        frame 8 { x: 52.2999992; y: 35; skew-x: 6; skew-y: 6.30000019; scale-x: -10000; scale-y: 0.568000019; }
        frame 9 { x: 53; y: 36; skew-x: 7.5; skew-y: 7.80000019; scale-y: 0.563000023; }
        frame 10 { x: 53.5999985; y: 36.9000015; skew-x: 9; skew-y: 9.5; scale-y: 0.558000028; }
        frame 11 { x: 54.2999992; y: 37.7999992; skew-x: 10.5; skew-y: 11.1999998; scale-y: 0.552999973; }
        frame 12 { x: 54; y: 37.5; skew-x: 11.3000002; skew-y: 11.8000002; scale-y: 0.556999981; }
        frame 13 { x: 53.9000015; y: 37.2000008; skew-x: 12.3999996; skew-y: 12.6999998; scale-y: 0.563000023; }
        frame 14 { x: 53; y: 36; skew-x: 9.80000019; skew-y: 10; scale-y: 0.568000019; }
        frame 15 { x: 52.0999985; y: 34.9000015; skew-x: 7.30000019; skew-y: 7.5; scale-y: 0.573000014; }
        frame 16 { x: 51.4000015; y: 33.7999992; skew-x: 4.80000019; skew-y: 5; scale-y: 0.578000009; }
        frame 17 { x: 50.5; y: 32.7000008; skew-x: 2.29999995; skew-y: 2.5; scale-x: 0.569999993; scale-y: 0.583999991; }
        frame 18 { x: 49.5999985; y: 31.6000004; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.588999987; }
        frame 19 { x: 48.7000008; y: 32.0999985; skew-x: -1.20000005; skew-y: -1.20000005; scale-y: 0.583000004; }
        frame 20 { x: 47.9000015; y: 32.7000008; skew-x: -2.70000005; skew-y: -2.70000005; scale-y: 0.578000009; }
        frame 21 { x: 47; y: 33.2999992; skew-x: -3.9000001; skew-y: -4.19999981; scale-x: 0.569000006; scale-y: 0.572000027; }
        frame 22 { x: 46.2000008; y: 34; skew-x: -5.4000001; skew-y: -5.69999981; scale-x: -10000; scale-y: 0.566999972; }
        frame 23 { x: 45.4000015; y: 34.5999985; skew-x: -6.69999981; skew-y: -7.19999981; scale-y: 0.56099999; }
        frame 24 { x: 44.5; y: 35.2000008; skew-x: -8.19999981; skew-y: -8.69999981; scale-y: 0.555999994; }
        frame 25 { x: 43.5999985; y: 35.9000015; skew-x: -9.60000038; skew-y: -10.3000002; scale-y: 0.550000012; }
        frame 26 { x: 44; y: 34.7999992; skew-x: -9.39999962; skew-y: -9.89999962; scale-y: 0.555000007; }
        frame 27 { x: 44.4000015; y: 33.7999992; skew-x: -9.30000019; skew-y: -9.80000019; scale-y: 0.56099999; }
        frame 28 { x: 45.5; y: 33.2999992; skew-x: -7.19999981; skew-y: -7.69999981; scale-y: 0.565999985; }
        frame 29 { x: 46.5; y: 32.7999992; skew-x: -5.4000001; skew-y: -5.69999981; scale-y: 0.572000027; }
        frame 30 { x: 47.5; y: 32.4000015; skew-x: -3.5; skew-y: -3.70000005; scale-y: 0.578000009; }
        frame 31 { x: 48.5; y: 32; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.569999993; scale-y: 0.583000004; }
        frame 32 { x: 49.5999985; y: 31.6000004; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.588999987; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 34 { x: 50.2999992; y: 32.4000015; skew-x: 1.5; skew-y: 1.5; scale-y: 0.583999991; }
        frame 35 { x: 50.9000015; y: 33.2000008; skew-x: 3; skew-y: 3; scale-y: 0.578000009; }
        frame 36 { x: 51.5999985; y: 34.2000008; skew-x: 4.5; skew-y: 4.80000019; scale-x: 0.569000006; scale-y: 0.573000014; }
        frame 37 { x: 52.2999992; y: 35; skew-x: 6; skew-y: 6.30000019; scale-x: -10000; scale-y: 0.568000019; }
        frame 38 { x: 53; y: 36; skew-x: 7.5; skew-y: 7.80000019; scale-y: 0.563000023; }
        frame 39 { x: 53.5999985; y: 36.9000015; skew-x: 9; skew-y: 9.5; scale-y: 0.558000028; }
        frame 40 { x: 54.2999992; y: 37.7999992; skew-x: 10.5; skew-y: 11.1999998; scale-y: 0.552999973; }
        frame 41 { x: 54; y: 37.5; skew-x: 11.3000002; skew-y: 11.8000002; scale-y: 0.556999981; }
        frame 42 { x: 53.9000015; y: 37.2000008; skew-x: 12.3999996; skew-y: 12.6999998; scale-y: 0.563000023; }
        frame 43 { x: 53; y: 36; skew-x: 9.80000019; skew-y: 10; scale-y: 0.568000019; }
        frame 44 { x: 52.0999985; y: 34.9000015; skew-x: 7.30000019; skew-y: 7.5; scale-y: 0.573000014; }
        frame 45 { x: 51.4000015; y: 33.7999992; skew-x: 4.80000019; skew-y: 5; scale-y: 0.578000009; }
        frame 46 { x: 50.5; y: 32.7000008; skew-x: 2.29999995; skew-y: 2.5; scale-x: 0.569999993; scale-y: 0.583999991; }
        frame 47 { x: 49.5999985; y: 31.6000004; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.588999987; }
        frame 48 { x: 48.7000008; y: 32.0999985; skew-x: -1.20000005; skew-y: -1.20000005; scale-y: 0.583000004; }
        frame 49 { x: 47.9000015; y: 32.7000008; skew-x: -2.70000005; skew-y: -2.70000005; scale-y: 0.578000009; }
        frame 50 { x: 47; y: 33.2999992; skew-x: -3.9000001; skew-y: -4.19999981; scale-x: 0.569000006; scale-y: 0.572000027; }
        frame 51 { x: 46.2000008; y: 34; skew-x: -5.4000001; skew-y: -5.69999981; scale-x: -10000; scale-y: 0.566999972; }
        frame 52 { x: 45.4000015; y: 34.5999985; skew-x: -6.69999981; skew-y: -7.19999981; scale-y: 0.56099999; }
        frame 53 { x: 44.5; y: 35.2000008; skew-x: -8.19999981; skew-y: -8.69999981; scale-y: 0.555999994; }
        frame 54 { x: 43.5999985; y: 35.9000015; skew-x: -9.60000038; skew-y: -10.3000002; scale-y: 0.550000012; }
        frame 55 { x: 44; y: 34.7999992; skew-x: -9.39999962; skew-y: -9.89999962; scale-y: 0.555000007; }
        frame 56 { x: 44.4000015; y: 33.7999992; skew-x: -9.30000019; skew-y: -9.80000019; scale-y: 0.56099999; }
        frame 57 { x: 45.5; y: 33.2999992; skew-x: -7.19999981; skew-y: -7.69999981; scale-y: 0.565999985; }
        frame 58 { x: 46.5; y: 32.7999992; skew-x: -5.4000001; skew-y: -5.69999981; scale-y: 0.572000027; }
        frame 59 { x: 47.5; y: 32.4000015; skew-x: -3.5; skew-y: -3.70000005; scale-y: 0.578000009; }
        frame 60 { x: 48.5; y: 32; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.569999993; scale-y: 0.583000004; }
        frame 61 { x: 49.5999985; y: 31.6000004; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.588999987; }
        frame 62 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 63 { x: 48.7999992; y: 30.8999996; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.568000019; scale-y: 0.592999995; }
        frame 64 { x: 48; y: 30.2999992; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: 0.564999998; scale-y: 0.597000003; }
        frame 65 { x: 47.2999992; y: 29.7000008; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.563000023; scale-y: 0.601000011; }
        frame 66 { x: 46.4000015; y: 29.1000004; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.56099999; scale-y: 0.605000019; }
        frame 67 { x: 45.5999985; y: 28.6000004; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: 0.558000028; scale-y: 0.609000027; }
        frame 68 { x: 44.7999992; y: 27.8999996; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.555999994; scale-y: 0.611999989; }
        frame 69 { x: 44; y: 27.2999992; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: 0.55400002; scale-y: 0.616999984; }
        frame 70 { x: 51.5999985; y: 32; skew-x: 5; skew-y: 5; scale-x: 0.559000015; scale-y: 0.600000024; }
        frame 71 { x: 59; y: 36.7999992; skew-x: 15.6000004; skew-y: 15.6000004; scale-x: 0.56400001; scale-y: 0.584999979; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 73 { cel: -10000; }
        frame 101 { x: 49.5999985; y: 31.6000004; skew-x: 0; skew-y: 0; scale-x: 0.569999993; scale-y: 0.588999987; cel: 0; }
        frame 102 { x: 48.5; y: 31.2000008; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 103 { x: 47.5; y: 30.7999992; skew-x: -3; skew-y: -3; }
        frame 104 { x: 46.2000008; y: 30.6000004; skew-x: -4.69999981; skew-y: -4.69999981; scale-y: 0.588; }
        frame 105 { x: 45; y: 30.5; skew-x: -6.5; skew-y: -6.5; scale-y: 0.588999987; }
        frame 106 { x: 47.2999992; y: 31; skew-x: -3.20000005; skew-y: -3.20000005; scale-y: -10000; }
        frame 107 { x: 49.5999985; y: 31.6000004; skew-x: 0; skew-y: 0; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 109 { cel: -10000; }
        frame 126 { x: 65.3000031; y: 41.2999992; skew-x: 23.8999996; skew-y: 23.8999996; scale-x: 0.563000023; scale-y: 0.583999991; cel: 0; }
        frame 127 { x: 64.9000015; y: 40.5999985; skew-x: 21.2999992; skew-y: 21.2999992; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 128 { x: 64.5999985; y: 39.9000015; skew-x: 18.7999992; skew-y: 18.7999992; }
        frame 129 { x: 65; y: 40.5999985; skew-x: 21.2999992; skew-y: 21.2999992; }
        frame 130 { x: 65.3000031; y: 41.2999992; skew-x: 23.8999996; skew-y: 23.8999996; }
    }
    Track {
        source-name: "anim_eyes2";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 72 { x: 51.0999985; y: 39.9000015; skew-x: 26.2999992; skew-y: 26.2999992; scale-x: 0.598999977; scale-y: 0.598999977; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_EYE3; }
        frame 73 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 97 { x: 48.5; y: 38.4000015; skew-x: 24.7999992; skew-y: 24.2999992; scale-x: 0.600000024; scale-y: 0.603999972; }
        frame 98 { x: 45.5999985; y: 36.7999992; skew-x: 23; skew-y: 22; scale-x: 0.601000011; scale-y: 0.609000027; }
        frame 99 { x: 41.5999985; y: 36.2999992; skew-x: 15.8000002; skew-y: 14.8000002; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 37.7999992; y: 35.7999992; skew-x: 8.5; skew-y: 7.5; }
        frame 101 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 102 { cel: -10000; }
        frame 108 { x: 49.5999985; y: 31.8999996; skew-x: 0; skew-y: 0; scale-x: 0.522000015; scale-y: 0.522000015; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_EYE1; }
        frame 109 { x: 49.5; y: 31.1000004; skew-x: -10000; skew-y: -10000; scale-x: 0.514999986; scale-y: 0.529999971; cel: -10000; image: none; }
        frame 110 { x: 49.2999992; y: 30.2000008; scale-x: 0.509000003; scale-y: 0.537999988; }
        frame 111 { x: 49.4000015; y: 30.8999996; scale-x: 0.513000011; scale-y: 0.532000005; }
        frame 112 { x: 49.5; y: 31.6000004; scale-x: 0.518000007; scale-y: 0.524999976; }
        frame 113 { x: -10000; y: 32.2999992; scale-x: 0.522000015; scale-y: 0.518000007; }
        frame 114 { x: 49.7000008; y: 33; scale-x: 0.526000023; scale-y: 0.512000024; }
        frame 115 { x: 49.9000015; y: 33.7000008; scale-x: 0.531000018; scale-y: 0.504999995; }
        frame 116 { x: 50; y: 34.4000015; scale-x: 0.535000026; scale-y: 0.499000013; }
        frame 117 { x: 50.2000008; y: 35; scale-x: 0.541999996; scale-y: 0.497000009; }
        frame 118 { x: 50.2999992; y: 35.4000015; scale-x: 0.547999978; scale-y: 0.495999992; }
        frame 119 { x: 50.2000008; y: 34.9000015; scale-x: 0.54400003; scale-y: 0.5; }
        frame 120 { x: 50.0999985; y: 34.5; scale-x: 0.541000009; scale-y: 0.503000021; }
        frame 121 { x: 50; y: 33.9000015; scale-x: 0.537; scale-y: 0.507000029; }
        frame 122 { x: 49.9000015; y: 33.4000015; scale-x: 0.532999992; scale-y: 0.510999978; }
        frame 123 { x: 49.7999992; y: 32.9000015; scale-x: 0.529999971; scale-y: 0.514999986; }
        frame 124 { x: 49.7000008; y: 32.4000015; scale-x: 0.526000023; scale-y: 0.518000007; }
        frame 125 { x: 49.5999985; y: 31.8999996; scale-x: 0.522000015; scale-y: 0.522000015; }
        frame 126 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 127 { cel: -10000; }
    }
    Track {
        source-name: "anim_eyes22";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 72 { x: 66.5; y: 41; skew-x: 26.2999992; skew-y: 26.2999992; scale-x: 0.598999977; scale-y: 0.598999977; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_EYE3; }
        frame 73 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 97 { x: 63.9000015; y: 39.0999985; skew-x: 24.7999992; skew-y: 24.2999992; scale-x: 0.600000024; scale-y: 0.603999972; }
        frame 98 { x: 61; y: 37; skew-x: 23; skew-y: 22; scale-x: 0.601000011; scale-y: 0.609000027; }
        frame 99 { x: 56.9000015; y: 34.5; skew-x: 15.8000002; skew-y: 14.8000002; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 52.7000008; y: 32.0999985; skew-x: 8.5; skew-y: 7.5; }
        frame 101 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 102 { cel: -10000; }
        frame 108 { x: 34.9000015; y: 36.2000008; skew-x: 0; skew-y: 0; scale-x: 0.600000024; scale-y: 0.600000024; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_EYE1; }
        frame 109 { x: -10000; y: 35.5; skew-x: -10000; skew-y: -10000; scale-x: 0.592000008; scale-y: 0.609000027; cel: -10000; image: none; }
        frame 110 { y: 34.7000008; scale-x: 0.583999991; scale-y: 0.617999971; }
        frame 111 { y: 35.2999992; scale-x: 0.588999987; scale-y: 0.611000001; }
        frame 112 { y: 36; scale-x: 0.595000029; scale-y: 0.602999985; }
        frame 113 { x: 34.7999992; y: 36.5999985; scale-x: 0.600000024; scale-y: 0.596000016; }
        frame 114 { x: -10000; y: 37.2999992; scale-x: 0.605000019; scale-y: 0.588; }
        frame 115 { x: 34.9000015; y: 37.9000015; scale-x: 0.610000014; scale-y: 0.579999983; }
        frame 116 { x: 34.7999992; y: 38.5; scale-x: 0.61500001; scale-y: 0.573000014; }
        frame 117 { x: 34.9000015; y: 39.0999985; scale-x: 0.621999979; scale-y: 0.57099998; }
        frame 118 { x: -10000; y: 39.5; scale-x: 0.629999995; scale-y: 0.569999993; }
        frame 119 { y: 39; scale-x: 0.625; scale-y: 0.574000001; }
        frame 120 { x: 34.7999992; y: 38.5999985; scale-x: 0.620999992; scale-y: 0.578000009; }
        frame 121 { x: 34.9000015; y: 38.0999985; scale-x: 0.616999984; scale-y: 0.583000004; }
        frame 122 { x: -10000; y: 37.5999985; scale-x: 0.612999976; scale-y: 0.587000012; }
        frame 123 { y: 37.2000008; scale-x: 0.60799998; scale-y: 0.591000021; }
        frame 124 { y: 36.5999985; scale-x: 0.603999972; scale-y: 0.596000016; }
        frame 125 { y: 36.2000008; scale-x: 0.600000024; scale-y: 0.600000024; }
        frame 126 { y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 127 { cel: -10000; }
    }
    Track {
        source-name: "blink2";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { x: 49.0999985; y: 31; scale-x: 0.541999996; scale-y: 0.549000025; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_EYEBLINK3; }
        frame 2 { x: -10000; y: 30.8999996; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_MAGNETSHROOM_EYEBLINK4; }
        frame 3 { y: 31; image: IMAGE_REANIM_MAGNETSHROOM_EYEBLINK3; }
        frame 4 { y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "blink1";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { x: 34.2999992; y: 35.7999992; scale-x: 0.595000029; scale-y: 0.602999985; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_EYEBLINK3; }
        frame 2 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_MAGNETSHROOM_EYEBLINK4; }
        frame 3 { image: IMAGE_REANIM_MAGNETSHROOM_EYEBLINK3; }
        frame 4 { cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "Magnetshroom_eyebrows";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 40.7000008; y: 31.7999992; skew-x: 68.3000031; skew-y: 67; scale-x: 0.615999997; scale-y: 0.601999998; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_EYEBROW; }
        frame 5 { x: 41.2999992; y: 32.7000008; skew-x: 69.6999969; skew-y: 68.6999969; scale-x: 0.611000001; scale-y: 0.601000011; cel: -10000; image: none; }
        frame 6 { x: 42; y: 33.5999985; skew-x: 71; skew-y: 70.4000015; scale-x: 0.606999993; scale-y: 0.600000024; }
        frame 7 { x: 42.5999985; y: 34.5; skew-x: 72.5; skew-y: 72.0999985; scale-x: 0.601000011; scale-y: -10000; }
        frame 8 { x: 43.2999992; y: 35.5; skew-x: 73.9000015; skew-y: 73.8000031; scale-x: 0.596000016; scale-y: 0.598999977; }
        frame 9 { x: 44; y: 36.5; skew-x: 75.1999969; skew-y: 75.5; scale-x: 0.592000008; scale-y: 0.59799999; }
        frame 10 { x: 44.5999985; y: 37.5; skew-x: 76.6999969; skew-y: 77.1999969; scale-x: 0.586000025; scale-y: -10000; }
        frame 11 { x: 45.2999992; y: 38.4000015; skew-x: 78.1999969; skew-y: 78.9000015; scale-x: 0.58099997; }
        frame 12 { x: 45.0999985; y: 37.7000008; skew-x: 79; skew-y: 79.5; scale-x: 0.586000025; }
        frame 13 { x: 44.7999992; y: 36.9000015; skew-x: 80.0999985; skew-y: 80.3000031; scale-x: 0.592000008; }
        frame 14 { x: 44; y: 36; skew-x: 77.5999985; skew-y: 77.5; scale-x: 0.596000016; scale-y: 0.598999977; }
        frame 15 { x: 43.0999985; y: 34.9000015; skew-x: 75.3000031; skew-y: 74.9000015; scale-x: 0.601000011; scale-y: 0.600000024; }
        frame 16 { x: 42.2999992; y: 33.9000015; skew-x: 73; skew-y: 72.1999969; scale-x: 0.606000006; scale-y: 0.601000011; }
        frame 17 { x: 41.5; y: 32.7999992; skew-x: 70.5999985; skew-y: 69.5; scale-x: 0.611000001; scale-y: 0.601999998; }
        frame 18 { x: 40.7000008; y: 31.7999992; skew-x: 68.3000031; skew-y: 67; scale-x: 0.615999997; scale-y: -10000; }
        frame 19 { x: 39.9000015; y: 32.9000015; skew-x: 66.8000031; skew-y: 65.9000015; scale-x: 0.611000001; scale-y: 0.601000011; }
        frame 20 { x: 39; y: 34; skew-x: 65.1999969; skew-y: 64.5999985; scale-x: 0.606000006; scale-y: 0.600000024; }
        frame 21 { x: 38.2999992; y: 35.0999985; skew-x: 63.5; skew-y: 63.5; scale-x: 0.601999998; scale-y: 0.59799999; }
        frame 22 { x: 37.5; y: 36.0999985; skew-x: 61.7999992; skew-y: 62.2000008; scale-x: 0.597000003; scale-y: 0.597000003; }
        frame 23 { x: 36.7000008; y: 37.2999992; skew-x: 60.2000008; skew-y: 61.0999985; scale-x: 0.592999995; scale-y: 0.595000029; }
        frame 24 { x: 35.7999992; y: 38.4000015; skew-x: 58.5; skew-y: 59.7999992; scale-x: 0.588; scale-y: 0.593999982; }
        frame 25 { x: 35.0999985; y: 39.5; skew-x: 56.7000008; skew-y: 58.5; scale-x: 0.583999991; scale-y: 0.592999995; }
        frame 26 { x: 35.5; y: 38.2999992; skew-x: 57.2000008; skew-y: 58.5999985; scale-x: 0.588; scale-y: 0.593999982; }
        frame 27 { x: 35.9000015; y: 37; skew-x: 57.5999985; skew-y: 58.5; scale-x: 0.592999995; scale-y: 0.595000029; }
        frame 28 { x: 36.9000015; y: 35.9000015; skew-x: 59.9000015; skew-y: 60.4000015; scale-x: 0.59799999; scale-y: 0.596000016; }
        frame 29 { x: 37.7000008; y: 34.9000015; skew-x: 62; skew-y: 62; scale-x: 0.601999998; scale-y: 0.59799999; }
        frame 30 { x: 38.5999985; y: 33.7999992; skew-x: 64.1999969; skew-y: 63.7999992; scale-x: 0.606999993; scale-y: 0.598999977; }
        frame 31 { x: 39.5999985; y: 32.7999992; skew-x: 66.3000031; skew-y: 65.4000015; scale-x: 0.611000001; scale-y: 0.601000011; }
        frame 32 { x: 40.7000008; y: 31.7999992; skew-x: 68.3000031; skew-y: 67; scale-x: 0.615999997; scale-y: 0.601999998; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 41.2999992; y: 32.7000008; skew-x: 69.6999969; skew-y: 68.6999969; scale-x: 0.611000001; scale-y: 0.601000011; }
        frame 35 { x: 42; y: 33.5999985; skew-x: 71; skew-y: 70.4000015; scale-x: 0.606999993; scale-y: 0.600000024; }
        frame 36 { x: 42.5999985; y: 34.5; skew-x: 72.5; skew-y: 72.0999985; scale-x: 0.601000011; scale-y: -10000; }
        frame 37 { x: 43.2999992; y: 35.5; skew-x: 73.9000015; skew-y: 73.8000031; scale-x: 0.596000016; scale-y: 0.598999977; }
        frame 38 { x: 44; y: 36.5; skew-x: 75.1999969; skew-y: 75.5; scale-x: 0.592000008; scale-y: 0.59799999; }
        frame 39 { x: 44.5999985; y: 37.5; skew-x: 76.6999969; skew-y: 77.1999969; scale-x: 0.586000025; scale-y: -10000; }
        frame 40 { x: 45.2999992; y: 38.4000015; skew-x: 78.1999969; skew-y: 78.9000015; scale-x: 0.58099997; }
        frame 41 { x: 45.0999985; y: 37.7000008; skew-x: 79; skew-y: 79.5; scale-x: 0.586000025; }
        frame 42 { x: 44.7999992; y: 36.9000015; skew-x: 80.0999985; skew-y: 80.3000031; scale-x: 0.592000008; }
        frame 43 { x: 44; y: 36; skew-x: 77.5999985; skew-y: 77.5; scale-x: 0.596000016; scale-y: 0.598999977; }
        frame 44 { x: 43.0999985; y: 34.9000015; skew-x: 75.3000031; skew-y: 74.9000015; scale-x: 0.601000011; scale-y: 0.600000024; }
        frame 45 { x: 42.2999992; y: 33.9000015; skew-x: 73; skew-y: 72.1999969; scale-x: 0.606000006; scale-y: 0.601000011; }
        frame 46 { x: 41.5; y: 32.7999992; skew-x: 70.5999985; skew-y: 69.5; scale-x: 0.611000001; scale-y: 0.601999998; }
        frame 47 { x: 40.7000008; y: 31.7999992; skew-x: 68.3000031; skew-y: 67; scale-x: 0.615999997; scale-y: -10000; }
        frame 48 { x: 39.9000015; y: 32.9000015; skew-x: 66.8000031; skew-y: 65.9000015; scale-x: 0.611000001; scale-y: 0.601000011; }
        frame 49 { x: 39; y: 34; skew-x: 65.1999969; skew-y: 64.5999985; scale-x: 0.606000006; scale-y: 0.600000024; }
        frame 50 { x: 38.2999992; y: 35.0999985; skew-x: 63.5; skew-y: 63.5; scale-x: 0.601999998; scale-y: 0.59799999; }
        frame 51 { x: 37.5; y: 36.0999985; skew-x: 61.7999992; skew-y: 62.2000008; scale-x: 0.597000003; scale-y: 0.597000003; }
        frame 52 { x: 36.7000008; y: 37.2999992; skew-x: 60.2000008; skew-y: 61.0999985; scale-x: 0.592999995; scale-y: 0.595000029; }
        frame 53 { x: 35.7999992; y: 38.4000015; skew-x: 58.5; skew-y: 59.7999992; scale-x: 0.588; scale-y: 0.593999982; }
        frame 54 { x: 35.0999985; y: 39.5; skew-x: 56.7000008; skew-y: 58.5; scale-x: 0.583999991; scale-y: 0.592999995; }
        frame 55 { x: 35.5; y: 38.2999992; skew-x: 57.2000008; skew-y: 58.5999985; scale-x: 0.588; scale-y: 0.593999982; }
        frame 56 { x: 35.9000015; y: 37; skew-x: 57.5999985; skew-y: 58.5; scale-x: 0.592999995; scale-y: 0.595000029; }
        frame 57 { x: 36.9000015; y: 35.9000015; skew-x: 59.9000015; skew-y: 60.4000015; scale-x: 0.59799999; scale-y: 0.596000016; }
        frame 58 { x: 37.7000008; y: 34.9000015; skew-x: 62; skew-y: 62; scale-x: 0.601999998; scale-y: 0.59799999; }
        frame 59 { x: 38.5999985; y: 33.7999992; skew-x: 64.1999969; skew-y: 63.7999992; scale-x: 0.606999993; scale-y: 0.598999977; }
        frame 60 { x: 39.5999985; y: 32.7999992; skew-x: 66.3000031; skew-y: 65.4000015; scale-x: 0.611000001; scale-y: 0.601000011; }
        frame 61 { x: 40.7000008; y: 31.7999992; skew-x: 68.3000031; skew-y: 67; scale-x: 0.615999997; scale-y: 0.601999998; }
        frame 62 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 39.9000015; y: 31.2999992; skew-x: 67.8000031; skew-y: 66; scale-x: 0.620000005; scale-y: 0.601000011; }
        frame 64 { x: 39.0999985; y: 30.7999992; skew-x: 67.1999969; skew-y: 65.0999985; scale-x: 0.623000026; scale-y: 0.598999977; }
        frame 65 { x: 38.5; y: 30.3999996; skew-x: 66.6999969; skew-y: 64.0999985; scale-x: 0.625999987; scale-y: 0.59799999; }
        frame 66 { x: 37.5999985; y: 30; skew-x: 66.0999985; skew-y: 63.0999985; scale-x: 0.629000008; scale-y: 0.596000016; }
        frame 67 { x: 37; y: 29.5; skew-x: 65.5999985; skew-y: 62.0999985; scale-x: 0.632000029; scale-y: 0.595000029; }
        frame 68 { x: 36.0999985; y: 29; skew-x: 64.8000031; skew-y: 60.9000015; scale-x: 0.635999978; scale-y: 0.593999982; }
        frame 69 { x: 35.4000015; y: 28.5; skew-x: 64.1999969; skew-y: 59.9000015; scale-x: 0.638999999; scale-y: 0.592000008; }
        frame 70 { x: 42.5999985; y: 32; skew-x: 78.6999969; skew-y: 71; scale-x: 0.602999985; scale-y: 0.619000018; }
        frame 71 { x: 50; y: 35.5; skew-x: 93.3000031; skew-y: 82.4000015; scale-x: 0.568000019; scale-y: 0.643000007; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 73 { cel: -10000; }
        frame 101 { x: 40.7000008; y: 31.7999992; skew-x: 68.3000031; skew-y: 67; scale-x: 0.615999997; scale-y: 0.601999998; cel: 0; }
        frame 102 { x: 39.5999985; y: 31.7000008; skew-x: 66.8000031; skew-y: 65.5; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 103 { x: 38.5999985; y: 31.6000004; skew-x: 65.3000031; skew-y: 64; }
        frame 104 { x: 37.4000015; y: 31.7000008; skew-x: 63.5999985; skew-y: 62.2000008; }
        frame 105 { x: 36.2999992; y: -10000; skew-x: 61.7000008; skew-y: 60.4000015; }
        frame 106 { x: 38.5; y: 31.7999992; skew-x: 65.0999985; skew-y: 63.7999992; }
        frame 107 { x: 40.7000008; y: -10000; skew-x: 68.3000031; skew-y: 67; }
        frame 108 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 109 { x: 40.5999985; y: 30.6000004; skew-x: 68.9000015; skew-y: 66.4000015; scale-x: 0.623000026; scale-y: 0.597000003; }
        frame 110 { x: -10000; y: 29.3999996; skew-x: 69.4000015; skew-y: 65.8000031; scale-x: 0.630999982; scale-y: 0.592000008; }
        frame 111 { y: 30.3999996; skew-x: 69; skew-y: 66.3000031; scale-x: 0.624000013; scale-y: 0.595000029; }
        frame 112 { y: 31.3999996; skew-x: 68.5999985; skew-y: 66.6999969; scale-x: 0.617999971; scale-y: 0.59799999; }
        frame 113 { y: 32.5; skew-x: 68.1999969; skew-y: 67.1999969; scale-x: 0.611999989; scale-y: 0.601000011; }
        frame 114 { x: 40.7000008; y: 33.5; skew-x: 67.8000031; skew-y: 67.5999985; scale-x: 0.606000006; scale-y: 0.603999972; }
        frame 115 { x: 40.7999992; y: 34.5; skew-x: 67.3000031; skew-y: 68; scale-x: 0.600000024; scale-y: 0.60799998; }
        frame 116 { x: -10000; y: 35.5999985; skew-x: 66.9000015; skew-y: 68.4000015; scale-x: 0.593999982; scale-y: 0.611000001; }
        frame 117 { x: 41; y: 36.0999985; skew-x: 66.5999985; skew-y: 68.6999969; scale-x: -10000; scale-y: 0.616999984; }
        frame 118 { x: -10000; y: 36.5; skew-x: 66.3000031; skew-y: 69; scale-y: 0.623000026; }
        frame 119 { y: 35.9000015; skew-x: 66.5999985; skew-y: 68.6999969; scale-x: 0.597000003; scale-y: 0.620000005; }
        frame 120 { x: 40.9000015; y: 35.2000008; skew-x: 66.9000015; skew-y: 68.5; scale-x: 0.600000024; scale-y: 0.616999984; }
        frame 121 { x: -10000; y: 34.5; skew-x: 67.1999969; skew-y: 68.1999969; scale-x: 0.602999985; scale-y: 0.614000022; }
        frame 122 { x: 40.7999992; y: 33.9000015; skew-x: 67.5; skew-y: 67.9000015; scale-x: 0.606999993; scale-y: 0.611000001; }
        frame 123 { x: -10000; y: 33.2000008; skew-x: 67.8000031; skew-y: 67.5999985; scale-x: 0.610000014; scale-y: 0.60799998; }
        frame 124 { x: 40.7000008; y: 32.5; skew-x: 68; skew-y: 67.3000031; scale-x: 0.612999976; scale-y: 0.605000019; }
        frame 125 { x: -10000; y: 31.7999992; skew-x: 68.3000031; skew-y: 67; scale-x: 0.615999997; scale-y: 0.601999998; }
        frame 126 { x: 56.5; y: 39.0999985; skew-x: 90.8000031; skew-y: 89.5; scale-x: 0.61500001; scale-y: 0.601000011; }
        frame 127 { x: 56.0999985; y: 39; skew-x: 88.5999985; skew-y: 87.3000031; scale-x: 0.614000022; scale-y: 0.600000024; }
        frame 128 { x: 55.5999985; y: 38.5999985; skew-x: 86.5; skew-y: 85.1999969; scale-x: 0.61500001; scale-y: 0.601000011; }
        frame 129 { x: 56; y: 38.9000015; skew-x: 88.5999985; skew-y: 87.3000031; scale-x: 0.614000022; scale-y: 0.600000024; }
        frame 130 { x: 56.5; y: 39.0999985; skew-x: 90.8000031; skew-y: 89.5; scale-x: 0.61500001; scale-y: 0.601000011; }
    }
    Track {
        source-name: "Magnetshroom_eyebrows2";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 48; y: 28.5; skew-x: 102.699997; skew-y: -76.4000015; scale-x: 0.617999971; scale-y: 0.600000024; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_EYEBROW; }
        frame 5 { x: 48.7000008; y: 29.7000008; skew-x: 104.300003; skew-y: -75; scale-x: 0.612999976; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 49.5; y: 30.7999992; skew-x: 105.900002; skew-y: -73.5999985; scale-x: 0.60799998; scale-y: 0.598999977; }
        frame 7 { x: 50.2999992; y: 32; skew-x: 107.800003; skew-y: -72.1999969; scale-x: 0.602999985; scale-y: 0.59799999; }
        frame 8 { x: 51; y: 33.2000008; skew-x: 109.400002; skew-y: -70.8000031; scale-x: 0.59799999; scale-y: -10000; }
        frame 9 { x: 51.7000008; y: 34.4000015; skew-x: 111; skew-y: -69.4000015; scale-x: 0.592999995; scale-y: 0.597000003; }
        frame 10 { x: 52.4000015; y: 35.5; skew-x: 112.800003; skew-y: -68; scale-x: 0.588; scale-y: 0.596000016; }
        frame 11 { x: 53.0999985; y: 36.7000008; skew-x: 114.599998; skew-y: -66.5999985; scale-x: 0.583000004; scale-y: -10000; }
        frame 12 { x: 52.9000015; y: 36; skew-x: 115.099998; skew-y: -65.6999969; scale-x: 0.588; }
        frame 13 { x: 52.5999985; y: 35.4000015; skew-x: 115.900002; skew-y: -64.5999985; scale-x: 0.592000008; scale-y: 0.597000003; }
        frame 14 { x: 51.7999992; y: 34; skew-x: 113.099998; skew-y: -67; scale-x: 0.597000003; scale-y: -10000; }
        frame 15 { x: 50.7999992; y: 32.5999985; skew-x: 110.5; skew-y: -69.4000015; scale-x: 0.601999998; scale-y: 0.59799999; }
        frame 16 { x: 50; y: 31.2000008; skew-x: 107.900002; skew-y: -71.8000031; scale-x: 0.60799998; scale-y: -10000; }
        frame 17 { x: 48.9000015; y: 29.8999996; skew-x: 105.300003; skew-y: -74.1999969; scale-x: 0.612999976; scale-y: 0.598999977; }
        frame 18 { x: 48; y: 28.5; skew-x: 102.699997; skew-y: -76.4000015; scale-x: 0.617999971; scale-y: 0.600000024; }
        frame 19 { x: 47.0999985; y: 29.5; skew-x: 101.5; skew-y: -77.8000031; scale-x: 0.611999989; scale-y: -10000; }
        frame 20 { x: 46.2000008; y: 30.3999996; skew-x: 100.099998; skew-y: -79.4000015; scale-x: 0.606999993; scale-y: 0.598999977; }
        frame 21 { x: 45.4000015; y: 31.3999996; skew-x: 98.6999969; skew-y: -80.8000031; scale-x: 0.601000011; scale-y: -10000; }
        frame 22 { x: 44.5; y: 32.2999992; skew-x: 97.4000015; skew-y: -82.4000015; scale-x: 0.595000029; }
        frame 23 { x: 43.5; y: 33.2999992; skew-x: 96; skew-y: -83.8000031; scale-x: 0.588999987; }
        frame 24 { x: 42.5999985; y: 34.2999992; skew-x: 94.5999985; skew-y: -85.4000015; scale-x: 0.583000004; scale-y: 0.59799999; }
        frame 25 { x: 41.7999992; y: 35.2999992; skew-x: 93.0999985; skew-y: -87; scale-x: 0.578000009; scale-y: 0.598999977; }
        frame 26 { x: 42.0999985; y: 34; skew-x: 93.4000015; skew-y: -86.5999985; scale-x: 0.583000004; scale-y: 0.59799999; }
        frame 27 { x: 42.5; y: 32.5999985; skew-x: -10000; skew-y: -86.4000015; scale-x: 0.588999987; scale-y: 0.598999977; }
        frame 28 { x: 43.7000008; y: 31.7999992; skew-x: 95.4000015; skew-y: -84.1999969; scale-x: 0.593999982; scale-y: -10000; }
        frame 29 { x: 44.7000008; y: 31; skew-x: 97.1999969; skew-y: -82.3000031; scale-x: 0.600000024; }
        frame 30 { x: 45.7999992; y: 30.1000004; skew-x: 99.0999985; skew-y: -80.1999969; scale-x: 0.606000006; }
        frame 31 { x: 46.9000015; y: 29.3999996; skew-x: 101; skew-y: -78.3000031; scale-x: 0.611999989; scale-y: 0.600000024; }
        frame 32 { x: 48; y: 28.5; skew-x: 102.699997; skew-y: -76.4000015; scale-x: 0.617999971; scale-y: -10000; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 34 { x: 48.7000008; y: 29.7000008; skew-x: 104.300003; skew-y: -75; scale-x: 0.612999976; }
        frame 35 { x: 49.5; y: 30.7999992; skew-x: 105.900002; skew-y: -73.5999985; scale-x: 0.60799998; scale-y: 0.598999977; }
        frame 36 { x: 50.2999992; y: 32; skew-x: 107.800003; skew-y: -72.1999969; scale-x: 0.602999985; scale-y: 0.59799999; }
        frame 37 { x: 51; y: 33.2000008; skew-x: 109.400002; skew-y: -70.8000031; scale-x: 0.59799999; scale-y: -10000; }
        frame 38 { x: 51.7000008; y: 34.4000015; skew-x: 111; skew-y: -69.4000015; scale-x: 0.592999995; scale-y: 0.597000003; }
        frame 39 { x: 52.4000015; y: 35.5; skew-x: 112.800003; skew-y: -68; scale-x: 0.588; scale-y: 0.596000016; }
        frame 40 { x: 53.0999985; y: 36.7000008; skew-x: 114.599998; skew-y: -66.5999985; scale-x: 0.583000004; scale-y: -10000; }
        frame 41 { x: 52.9000015; y: 36; skew-x: 115.099998; skew-y: -65.6999969; scale-x: 0.588; }
        frame 42 { x: 52.5999985; y: 35.4000015; skew-x: 115.900002; skew-y: -64.5999985; scale-x: 0.592000008; scale-y: 0.597000003; }
        frame 43 { x: 51.7999992; y: 34; skew-x: 113.099998; skew-y: -67; scale-x: 0.597000003; scale-y: -10000; }
        frame 44 { x: 50.7999992; y: 32.5999985; skew-x: 110.5; skew-y: -69.4000015; scale-x: 0.601999998; scale-y: 0.59799999; }
        frame 45 { x: 50; y: 31.2000008; skew-x: 107.900002; skew-y: -71.8000031; scale-x: 0.60799998; scale-y: -10000; }
        frame 46 { x: 48.9000015; y: 29.8999996; skew-x: 105.300003; skew-y: -74.1999969; scale-x: 0.612999976; scale-y: 0.598999977; }
        frame 47 { x: 48; y: 28.5; skew-x: 102.699997; skew-y: -76.4000015; scale-x: 0.617999971; scale-y: 0.600000024; }
        frame 48 { x: 47.0999985; y: 29.5; skew-x: 101.5; skew-y: -77.8000031; scale-x: 0.611999989; scale-y: -10000; }
        frame 49 { x: 46.2000008; y: 30.3999996; skew-x: 100.099998; skew-y: -79.4000015; scale-x: 0.606999993; scale-y: 0.598999977; }
        frame 50 { x: 45.4000015; y: 31.3999996; skew-x: 98.6999969; skew-y: -80.8000031; scale-x: 0.601000011; scale-y: -10000; }
        frame 51 { x: 44.5; y: 32.2999992; skew-x: 97.4000015; skew-y: -82.4000015; scale-x: 0.595000029; }
        frame 52 { x: 43.5; y: 33.2999992; skew-x: 96; skew-y: -83.8000031; scale-x: 0.588999987; }
        frame 53 { x: 42.5999985; y: 34.2999992; skew-x: 94.5999985; skew-y: -85.4000015; scale-x: 0.583000004; scale-y: 0.59799999; }
        frame 54 { x: 41.7999992; y: 35.2999992; skew-x: 93.0999985; skew-y: -87; scale-x: 0.578000009; scale-y: 0.598999977; }
        frame 55 { x: 42.0999985; y: 34; skew-x: 93.4000015; skew-y: -86.5999985; scale-x: 0.583000004; scale-y: 0.59799999; }
        frame 56 { x: 42.5; y: 32.5999985; skew-x: -10000; skew-y: -86.4000015; scale-x: 0.588999987; scale-y: 0.598999977; }
        frame 57 { x: 43.7000008; y: 31.7999992; skew-x: 95.4000015; skew-y: -84.1999969; scale-x: 0.593999982; scale-y: -10000; }
        frame 58 { x: 44.7000008; y: 31; skew-x: 97.1999969; skew-y: -82.3000031; scale-x: 0.600000024; }
        frame 59 { x: 45.7999992; y: 30.1000004; skew-x: 99.0999985; skew-y: -80.1999969; scale-x: 0.606000006; }
        frame 60 { x: 46.9000015; y: 29.3999996; skew-x: 101; skew-y: -78.3000031; scale-x: 0.611999989; scale-y: 0.600000024; }
        frame 61 { x: 48; y: 28.5; skew-x: 102.699997; skew-y: -76.4000015; scale-x: 0.617999971; scale-y: -10000; }
        frame 62 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 63 { x: 47.2000008; y: 27.8999996; skew-x: 101.800003; skew-y: -77; scale-x: 0.621999979; scale-y: 0.59799999; }
        frame 64 { x: 46.2999992; y: 27.2999992; skew-x: 100.900002; skew-y: -77.5999985; scale-x: 0.625; scale-y: 0.596000016; }
        frame 65 { x: 45.5999985; y: 26.7000008; skew-x: 100; skew-y: -78.3000031; scale-x: 0.629000008; scale-y: 0.593999982; }
        frame 66 { x: 44.7000008; y: 26.2000008; skew-x: 99.0999985; skew-y: -78.9000015; scale-x: 0.633000016; scale-y: 0.592000008; }
        frame 67 { x: 43.9000015; y: 25.6000004; skew-x: 98.1999969; skew-y: -79.5; scale-x: 0.637000024; scale-y: 0.589999974; }
        frame 68 { x: 43; y: 25; skew-x: 97.1999969; skew-y: -80.3000031; scale-x: 0.640999973; scale-y: 0.588; }
        frame 69 { x: 42.2000008; y: 24.3999996; skew-x: 96.3000031; skew-y: -80.9000015; scale-x: 0.644999981; scale-y: 0.586000025; }
        frame 70 { x: 50.4000015; y: 29.2000008; skew-x: 112.099998; skew-y: -71.6999969; scale-x: 0.646000028; scale-y: 0.574000001; }
        frame 71 { x: 58.5; y: 34.2999992; skew-x: 127.800003; skew-y: -62.5; scale-x: 0.647000015; scale-y: 0.563000023; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 73 { cel: -10000; }
        frame 101 { x: 48; y: 28.5; skew-x: 102.699997; skew-y: -76.4000015; scale-x: 0.617999971; scale-y: 0.600000024; cel: 0; }
        frame 102 { x: 47; y: 28.2000008; skew-x: 101.199997; skew-y: -77.9000015; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 103 { x: 45.7999992; y: 27.8999996; skew-x: 99.5999985; skew-y: -79.5; }
        frame 104 { x: 44.5; y: 27.7999992; skew-x: 97.9000015; skew-y: -81.1999969; scale-x: 0.616999984; }
        frame 105 { x: 43.0999985; y: 27.6000004; skew-x: 96.0999985; skew-y: -83; scale-x: 0.617999971; }
        frame 106 { x: 45.5999985; y: 28.1000004; skew-x: 99.4000015; skew-y: -79.6999969; scale-x: -10000; }
        frame 107 { x: 48; y: 28.5; skew-x: 102.699997; skew-y: -76.4000015; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 109 { x: 47.9000015; y: 27.2000008; skew-x: 102.300003; skew-y: -76; scale-x: 0.625999987; scale-y: 0.592999995; }
        frame 110 { x: 47.7999992; y: 25.8999996; skew-x: 102; skew-y: -75.5999985; scale-x: 0.63499999; scale-y: 0.586000025; }
        frame 111 { x: 47.9000015; y: 27; skew-x: 102.300003; skew-y: -75.9000015; scale-x: 0.628000021; scale-y: 0.591000021; }
        frame 112 { x: -10000; y: 28.1000004; skew-x: 102.5; skew-y: -76.1999969; scale-x: 0.620999992; scale-y: 0.595000029; }
        frame 113 { x: 48; y: 29.2000008; skew-x: 102.800003; skew-y: -76.5; scale-x: 0.614000022; scale-y: 0.598999977; }
        frame 114 { x: 48.0999985; y: 30.2999992; skew-x: 103; skew-y: -76.8000031; scale-x: 0.606000006; scale-y: 0.603999972; }
        frame 115 { x: 48.2000008; y: 31.3999996; skew-x: 103.300003; skew-y: -77; scale-x: 0.598999977; scale-y: 0.60799998; }
        frame 116 { x: 48.4000015; y: 32.5; skew-x: 103.599998; skew-y: -77.3000031; scale-x: 0.592000008; scale-y: 0.612999976; }
        frame 117 { x: 48.5999985; y: 33; skew-x: 103.800003; skew-y: -77.5; scale-x: 0.591000021; scale-y: 0.620000005; }
        frame 118 { x: 48.7000008; y: 33.4000015; skew-x: 104; skew-y: -77.5999985; scale-x: 0.589999974; scale-y: 0.625999987; }
        frame 119 { x: 48.5999985; y: 32.7999992; skew-x: 103.800003; skew-y: -77.5; scale-x: 0.593999982; scale-y: 0.623000026; }
        frame 120 { x: 48.5; y: 32; skew-x: 103.599998; skew-y: -77.3000031; scale-x: 0.59799999; scale-y: 0.619000018; }
        frame 121 { x: 48.4000015; y: 31.3999996; skew-x: 103.400002; skew-y: -77.0999985; scale-x: 0.601999998; scale-y: 0.61500001; }
        frame 122 { x: -10000; y: 30.6000004; skew-x: 103.199997; skew-y: -76.9000015; scale-x: 0.606000006; scale-y: 0.611000001; }
        frame 123 { x: 48.2999992; y: 30; skew-x: 103; skew-y: -76.8000031; scale-x: 0.610000014; scale-y: 0.60799998; }
        frame 124 { x: 48.0999985; y: 29.2999992; skew-x: 102.900002; skew-y: -76.5999985; scale-x: 0.614000022; scale-y: 0.603999972; }
        frame 125 { x: 48; y: 28.5; skew-x: 102.699997; skew-y: -76.4000015; scale-x: 0.617999971; scale-y: 0.600000024; }
        frame 126 { x: 64.5999985; y: 38.9000015; skew-x: 125.199997; skew-y: -53.9000015; scale-x: 0.615999997; scale-y: 0.598999977; }
        frame 127 { x: 64.0999985; y: 38.4000015; skew-x: 123; skew-y: -56.0999985; scale-x: -10000; scale-y: 0.59799999; }
        frame 128 { x: 63.5999985; y: 37.7999992; skew-x: 120.900002; skew-y: -58.2000008; scale-y: -10000; }
        frame 129 { x: 64.0999985; y: 38.4000015; skew-x: 123; skew-y: -56.0999985; }
        frame 130 { x: 64.5999985; y: 38.9000015; skew-x: 125.199997; skew-y: -53.9000015; scale-y: 0.598999977; }
    }
    Track {
        source-name: "Magnetshroom_spot";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 73 { x: 64.0999985; y: 25.6000004; scale-x: 0.600000024; scale-y: 0.600000024; cel: 0; alpha: 0.600000024; image: IMAGE_REANIM_MAGNETSHROOM_DOT; }
        frame 74 { x: 64.5; y: 22.8999996; scale-x: -10000; scale-y: -10000; cel: -10000; alpha: -10000; image: none; }
        frame 75 { x: 64.8000031; y: 20.2000008; }
        frame 76 { x: -10000; y: -10000; cel: -1; }
        frame 77 { x: 64.0999985; y: 25.6000004; cel: 0; }
        frame 78 { x: 64.5; y: 22.8999996; cel: -10000; }
        frame 79 { x: 64.8000031; y: 20.2000008; }
        frame 80 { x: -10000; y: -10000; cel: -1; }
        frame 81 { x: 64.0999985; y: 25.6000004; cel: 0; }
        frame 82 { x: 64.5; y: 22.8999996; cel: -10000; }
        frame 83 { x: 64.8000031; y: 20.2000008; }
        frame 84 { x: -10000; y: -10000; cel: -1; }
        frame 85 { x: 64.0999985; y: 25.6000004; cel: 0; }
        frame 86 { x: 64.5; y: 22.8999996; cel: -10000; }
        frame 87 { x: 64.8000031; y: 20.2000008; }
        frame 88 { x: -10000; y: -10000; cel: -1; }
        frame 89 { x: 64.0999985; y: 25.6000004; cel: 0; }
        frame 90 { x: 64.5; y: 22.8999996; cel: -10000; }
        frame 91 { x: 64.8000031; y: 20.2000008; }
        frame 92 { x: -10000; y: -10000; cel: -1; }
        frame 93 { x: 64.0999985; y: 25.6000004; cel: 0; }
        frame 94 { x: 64.5; y: 22.8999996; cel: -10000; }
        frame 95 { x: 64.8000031; y: 20.2000008; }
        frame 96 { x: -10000; y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
    }
    Track {
        source-name: "Magnetshroom_shock";
        frame-count: 131;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 6 { x: 29.2000008; y: 12.5; scale-x: 0.648999989; scale-y: 0.600000024; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_IDLE_ELECTRIC1; }
        frame 7 { x: 31.7999992; y: 10.5; skew-x: 8.60000038; skew-y: 8.60000038; scale-x: 0.600000024; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_MAGNETSHROOM_IDLE_ELECTRIC2; }
        frame 8 { x: 31.7000008; y: 10.3999996; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: -10000; image: IMAGE_REANIM_MAGNETSHROOM_IDLE_ELECTRIC3; }
        frame 9 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; image: none; }
        frame 10 { cel: -10000; }
        frame 14 { x: 33.2000008; y: 14.8999996; skew-x: 0; skew-y: 0; scale-x: 0.648999989; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_IDLE_ELECTRIC1; }
        frame 15 { x: 33; y: 10.8000002; skew-x: 8.60000038; skew-y: 8.60000038; scale-x: 0.600000024; cel: -10000; image: IMAGE_REANIM_MAGNETSHROOM_IDLE_ELECTRIC2; }
        frame 16 { x: 30.6000004; y: 9; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: -10000; image: IMAGE_REANIM_MAGNETSHROOM_IDLE_ELECTRIC3; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; image: none; }
        frame 18 { cel: -10000; }
        frame 22 { x: 22; y: 20; skew-x: -16.3999996; skew-y: -16.3999996; scale-x: 0.648999989; scale-y: 0.598999977; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_IDLE_ELECTRIC1; }
        frame 23 { x: 21.5; y: 16.6000004; skew-x: -4.5; skew-y: -4.5; scale-x: 0.59799999; scale-y: 0.59799999; cel: -10000; image: IMAGE_REANIM_MAGNETSHROOM_IDLE_ELECTRIC2; }
        frame 24 { x: 18.3999996; y: 16.2000008; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.598999977; scale-y: 0.598999977; image: IMAGE_REANIM_MAGNETSHROOM_IDLE_ELECTRIC3; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 26 { cel: -10000; }
        frame 29 { x: 22.3999996; y: 18.1000004; skew-x: -13.6999998; skew-y: -13.6999998; scale-x: 0.648999989; scale-y: 0.600000024; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_IDLE_ELECTRIC1; }
        frame 30 { x: 25; y: 12.1000004; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: 0.598999977; scale-y: 0.598999977; cel: -10000; image: IMAGE_REANIM_MAGNETSHROOM_IDLE_ELECTRIC2; }
        frame 31 { x: 24.2000008; y: 10.1999998; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.600000024; scale-y: 0.600000024; image: IMAGE_REANIM_MAGNETSHROOM_IDLE_ELECTRIC3; }
        frame 32 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 33 { cel: -10000; }
        frame 73 { x: 58.4000015; y: 21.6000004; skew-x: 27.2999992; skew-y: 27.2999992; scale-x: 0.697000027; scale-y: 0.598999977; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK2; }
        frame 74 { x: 59.5999985; y: 14.8999996; skew-x: 34.4000015; skew-y: 34.4000015; scale-x: 0.797999978; scale-y: 0.797999978; cel: -10000; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK1; }
        frame 75 { x: -10000; y: 13.3999996; skew-x: 27.2000008; skew-y: 27.2000008; scale-x: 0.675999999; scale-y: 0.598999977; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK3; }
        frame 76 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 77 { x: 58.4000015; y: 21.6000004; skew-x: 27.2999992; skew-y: 27.2999992; scale-x: 0.697000027; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK2; }
        frame 78 { x: 59.5999985; y: 14.8999996; skew-x: 34.4000015; skew-y: 34.4000015; scale-x: 0.797999978; scale-y: 0.797999978; cel: -10000; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK1; }
        frame 79 { x: -10000; y: 13.3999996; skew-x: 27.2000008; skew-y: 27.2000008; scale-x: 0.675999999; scale-y: 0.598999977; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK3; }
        frame 80 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 81 { x: 58.4000015; y: 21.6000004; skew-x: 27.2999992; skew-y: 27.2999992; scale-x: 0.697000027; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK2; }
        frame 82 { x: 59.5999985; y: 14.8999996; skew-x: 34.4000015; skew-y: 34.4000015; scale-x: 0.797999978; scale-y: 0.797999978; cel: -10000; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK1; }
        frame 83 { x: -10000; y: 13.3999996; skew-x: 27.2000008; skew-y: 27.2000008; scale-x: 0.675999999; scale-y: 0.598999977; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK3; }
        frame 84 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 85 { x: 58.4000015; y: 21.6000004; skew-x: 27.2999992; skew-y: 27.2999992; scale-x: 0.697000027; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK2; }
        frame 86 { x: 59.5999985; y: 14.8999996; skew-x: 34.4000015; skew-y: 34.4000015; scale-x: 0.797999978; scale-y: 0.797999978; cel: -10000; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK1; }
        frame 87 { x: -10000; y: 13.3999996; skew-x: 27.2000008; skew-y: 27.2000008; scale-x: 0.675999999; scale-y: 0.598999977; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK3; }
        frame 88 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 89 { x: 58.4000015; y: 21.6000004; skew-x: 27.2999992; skew-y: 27.2999992; scale-x: 0.697000027; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK2; }
        frame 90 { x: 59.5999985; y: 14.8999996; skew-x: 34.4000015; skew-y: 34.4000015; scale-x: 0.797999978; scale-y: 0.797999978; cel: -10000; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK1; }
        frame 91 { x: -10000; y: 13.3999996; skew-x: 27.2000008; skew-y: 27.2000008; scale-x: 0.675999999; scale-y: 0.598999977; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK3; }
        frame 92 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 93 { x: 58.4000015; y: 21.6000004; skew-x: 27.2999992; skew-y: 27.2999992; scale-x: 0.697000027; cel: 0; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK2; }
        frame 94 { x: 59.5999985; y: 14.8999996; skew-x: 34.4000015; skew-y: 34.4000015; scale-x: 0.797999978; scale-y: 0.797999978; cel: -10000; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK1; }
        frame 95 { x: -10000; y: 13.3999996; skew-x: 27.2000008; skew-y: 27.2000008; scale-x: 0.675999999; scale-y: 0.598999977; image: IMAGE_REANIM_MAGNETSHROOM_SHOCK3; }
        frame 96 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 97 { cel: -10000; }
    }
}
