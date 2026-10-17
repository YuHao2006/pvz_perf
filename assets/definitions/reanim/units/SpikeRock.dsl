export component SpikeRock {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 33;
        frame 3 { cel: -1; }
        frame 4 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { cel: 0; }
        frame 4 { cel: -10000; }
        frame 18 { cel: -1; }
        frame 19 { cel: -10000; }
    }
    Track {
        source-name: "anim_attack";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 18 { cel: 0; }
        frame 19 { cel: -10000; }
    }
    Track {
        source-name: "spike1";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 50.4000015; y: 39.7999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 50.2999992; y: 39.9000015; scale-x: 0.792999983; scale-y: 0.79400003; cel: -10000; image: none; }
        frame 5 { x: -10000; y: 40; scale-x: 0.785000026; scale-y: 0.787; }
        frame 6 { x: 50.4000015; y: 40.2999992; scale-x: 0.791999996; scale-y: 0.781000018; }
        frame 7 { x: -10000; y: 40.5; scale-x: 0.799000025; scale-y: 0.774999976; }
        frame 8 { x: 50.5; y: 40.9000015; scale-x: 0.805999994; scale-y: 0.768999994; }
        frame 9 { x: -10000; y: 41.0999985; scale-x: 0.813000023; scale-y: 0.762000024; }
        frame 10 { x: 50.5999985; y: 41.5; scale-x: 0.819999993; scale-y: 0.755999982; }
        frame 11 { x: -10000; y: -10000; scale-x: 0.816999972; scale-y: 0.735000014; }
        frame 12 { x: 50.5; y: 41.4000015; scale-x: 0.81400001; scale-y: 0.713; }
        frame 13 { x: -10000; y: 41; scale-x: 0.81099999; scale-y: 0.730000019; }
        frame 14 { y: 40.7999992; scale-x: 0.808000028; scale-y: 0.748000026; }
        frame 15 { y: 40.4000015; scale-x: 0.805999994; scale-y: 0.764999986; }
        frame 16 { x: 50.4000015; y: 40.0999985; scale-x: 0.802999973; scale-y: 0.782999992; }
        frame 17 { x: -10000; y: 39.7999992; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 18 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 38.5999985; scale-y: 0.828999996; }
        frame 20 { y: 37.5; scale-y: 0.856999993; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 23 { y: 33.2999992; scale-y: 1.02499998; }
        frame 24 { y: 34.9000015; scale-y: 0.968999982; }
        frame 25 { y: 36.5; scale-y: 0.912; }
        frame 26 { y: 38.0999985; scale-y: 0.856000006; }
        frame 27 { y: 39.7999992; scale-y: 0.800000012; }
        frame 28 { y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "spike7";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 59.0999985; y: 40.7999992; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 59; y: 40.4000015; scale-x: 0.792999983; scale-y: 0.79400003; cel: -10000; image: none; }
        frame 5 { x: -10000; y: 40; scale-x: 0.785000026; scale-y: 0.787; }
        frame 6 { x: 59.0999985; y: 40.2999992; scale-x: 0.791999996; scale-y: 0.781000018; }
        frame 7 { x: 59.2000008; y: 40.5; scale-x: 0.799000025; scale-y: 0.774999976; }
        frame 8 { x: 59.2999992; y: 40.9000015; scale-x: 0.805999994; scale-y: 0.768999994; }
        frame 9 { x: -10000; y: 41.0999985; scale-x: 0.813000023; scale-y: 0.762000024; }
        frame 10 { x: 59.4000015; y: 41.5; scale-x: 0.819999993; scale-y: 0.755999982; }
        frame 11 { x: -10000; y: -10000; scale-x: 0.816999972; scale-y: 0.735000014; }
        frame 12 { x: 59.2999992; y: 41.4000015; scale-x: 0.81400001; scale-y: 0.713; }
        frame 13 { x: -10000; y: 41; scale-x: 0.81099999; scale-y: 0.730000019; }
        frame 14 { x: 59.2000008; y: 40.7999992; scale-x: 0.808000028; scale-y: 0.748000026; }
        frame 15 { x: -10000; y: 40.4000015; scale-x: 0.805999994; scale-y: 0.764999986; }
        frame 16 { x: 59.0999985; y: 40.0999985; scale-x: 0.802999973; scale-y: 0.782999992; }
        frame 17 { x: -10000; y: 39.7999992; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 18 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 39.2000008; scale-y: 0.828999996; }
        frame 20 { y: 38.7000008; scale-y: 0.856999993; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 23 { y: 29.6000004; scale-y: 1.30900002; }
        frame 24 { y: 32.5; scale-y: 1.18200004; }
        frame 25 { y: 35.2999992; scale-y: 1.05400002; }
        frame 26 { y: 38.0999985; scale-y: 0.926999986; }
        frame 27 { y: 41; scale-y: 0.800000012; }
        frame 28 { y: 41.5999985; scale-y: -10000; }
        frame 29 { y: 42.2999992; }
        frame 30 { y: 41.9000015; }
        frame 31 { y: 41.4000015; }
        frame 32 { y: 41; }
    }
    Track {
        source-name: "spike8";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 6.5999999; y: 41; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 7.30000019; y: 40.5; scale-x: 0.792999983; scale-y: 0.79400003; cel: -10000; image: none; }
        frame 5 { x: 8; y: 40; scale-x: 0.785000026; scale-y: 0.787; }
        frame 6 { x: 7.80000019; y: 40.2999992; scale-x: 0.791999996; scale-y: 0.781000018; }
        frame 7 { x: 7.5; y: 40.5; scale-x: 0.799000025; scale-y: 0.774999976; }
        frame 8 { x: 7.19999981; y: 40.9000015; scale-x: 0.805999994; scale-y: 0.768999994; }
        frame 9 { x: 6.9000001; y: 41.0999985; scale-x: 0.813000023; scale-y: 0.762000024; }
        frame 10 { x: 6.5999999; y: 41.5; scale-x: 0.819999993; scale-y: 0.755999982; }
        frame 11 { x: 6.69999981; y: 42; scale-x: 0.816999972; scale-y: 0.735000014; }
        frame 12 { x: 6.80000019; y: 42.4000015; scale-x: 0.81400001; scale-y: 0.713; }
        frame 13 { x: -10000; y: 42.0999985; scale-x: 0.81099999; scale-y: 0.730000019; }
        frame 14 { x: 6.69999981; y: 41.7999992; scale-x: 0.808000028; scale-y: 0.748000026; }
        frame 15 { x: -10000; y: 41.5; scale-x: 0.805999994; scale-y: 0.764999986; }
        frame 16 { y: 41.2999992; scale-x: 0.802999973; scale-y: 0.782999992; }
        frame 17 { x: 6.5999999; y: 41; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 6.80000019; y: 39.9000015; scale-y: 0.828999996; }
        frame 20 { x: 7.0999999; y: 38.7000008; scale-y: 0.856999993; }
        frame 21 { x: -10000; y: -10000; scale-y: -10000; }
        frame 23 { x: 7.30000019; y: 30.1000004; scale-y: 1.30900002; }
        frame 24 { x: 7.19999981; y: 32.9000015; scale-y: 1.18200004; }
        frame 25 { x: 7; y: 35.5; scale-y: 1.05400002; }
        frame 26 { x: 6.80000019; y: 38.2999992; scale-y: 0.926999986; }
        frame 27 { x: 6.5999999; y: 41; scale-y: 0.800000012; }
        frame 28 { x: -10000; y: 41.5999985; scale-y: -10000; }
        frame 29 { y: 42.2999992; }
        frame 30 { y: 41.9000015; }
        frame 31 { y: 41.4000015; }
        frame 32 { y: 41; }
    }
    Track {
        source-name: "spike2";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 42; y: 39; scale-x: 0.800000012; scale-y: 0.683000028; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: -10000; y: 38.2999992; scale-x: 0.792999983; scale-y: 0.686999977; cel: -10000; image: none; }
        frame 5 { y: 37.5999985; scale-x: 0.786000013; scale-y: 0.690999985; }
        frame 6 { y: 38.2999992; scale-x: 0.792999983; scale-y: 0.681999981; }
        frame 7 { y: 38.9000015; scale-x: 0.799000025; scale-y: 0.672999978; }
        frame 8 { y: 39.5; scale-x: 0.805999994; scale-y: 0.662999988; }
        frame 9 { x: 42; y: 40.0999985; scale-x: 0.813000023; scale-y: 0.653999984; }
        frame 10 { x: -10000; y: 40.7999992; scale-x: 0.819999993; scale-y: 0.644999981; }
        frame 11 { x: 42; y: -10000; scale-x: 0.816999972; scale-y: 0.651000023; }
        frame 12 { x: -10000; scale-x: 0.81400001; scale-y: 0.656000018; }
        frame 13 { x: 42; y: 40.5; scale-x: 0.81099999; scale-y: 0.661000013; }
        frame 14 { y: 40; scale-x: 0.808000028; scale-y: 0.666999996; }
        frame 15 { x: -10000; y: 39.7999992; scale-x: 0.805999994; scale-y: 0.671999991; }
        frame 16 { y: 39.5; scale-x: 0.802999973; scale-y: 0.676999986; }
        frame 17 { y: 39; scale-x: 0.800000012; scale-y: 0.683000028; }
        frame 18 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 37.9000015; scale-y: 0.707000017; }
        frame 20 { y: 36.5999985; scale-y: 0.731000006; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 24 { y: 37.2999992; scale-y: 0.718999982; }
        frame 25 { y: 37.9000015; scale-y: 0.707000017; }
        frame 26 { y: 38.5; scale-y: 0.694999993; }
        frame 27 { y: 39; scale-y: 0.683000028; }
        frame 28 { y: 34; scale-y: 0.870000005; }
        frame 29 { y: 29.2000008; scale-y: 1.05799997; }
        frame 30 { y: 32.4000015; scale-y: 0.933000028; }
        frame 31 { y: 35.7999992; scale-y: 0.808000028; }
        frame 32 { y: 39; scale-y: 0.683000028; }
    }
    Track {
        source-name: "spike3";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 32.7999992; y: 37.2999992; scale-x: 0.944000006; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 32.9000015; y: 36.7999992; scale-x: 0.93599999; scale-y: 0.805000007; cel: -10000; image: none; }
        frame 5 { x: 33; y: 36.4000015; scale-x: 0.926999986; scale-y: 0.810000002; }
        frame 6 { x: 32.9000015; y: 36.9000015; scale-x: 0.935000002; scale-y: 0.799000025; }
        frame 7 { x: 32.7999992; y: 37.5; scale-x: 0.943000019; scale-y: 0.787999988; }
        frame 8 { x: -10000; y: 38; scale-x: 0.950999975; scale-y: 0.777999997; }
        frame 9 { x: 32.7000008; y: 38.5999985; scale-x: 0.958999991; scale-y: 0.76700002; }
        frame 10 { x: 32.5999985; y: 39.0999985; scale-x: 0.967000008; scale-y: 0.755999982; }
        frame 11 { x: -10000; y: 38.9000015; scale-x: 0.963999987; scale-y: 0.762000024; }
        frame 12 { y: 38.5999985; scale-x: 0.959999979; scale-y: 0.768999994; }
        frame 13 { x: 32.7000008; y: 38.2999992; scale-x: 0.957000017; scale-y: 0.774999976; }
        frame 14 { x: 32.7999992; y: 38; scale-x: 0.953999996; scale-y: 0.781000018; }
        frame 15 { x: -10000; y: 37.7999992; scale-x: 0.949999988; scale-y: 0.787; }
        frame 16 { x: 32.9000015; y: 37.5; scale-x: 0.947000027; scale-y: 0.79400003; }
        frame 17 { x: 32.7999992; y: 37.2999992; scale-x: 0.944000006; scale-y: 0.800000012; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 36; scale-y: 0.828999996; }
        frame 20 { y: 34.7999992; scale-y: 0.856999993; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 23 { y: 29; scale-y: 1.15900004; }
        frame 24 { y: 31.1000004; scale-y: 1.06900001; }
        frame 25 { y: 33.0999985; scale-y: 0.978999972; }
        frame 26 { y: 35.2000008; scale-y: 0.889999986; }
        frame 27 { y: 37.2999992; scale-y: 0.800000012; }
        frame 28 { y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "spike4";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 23.7000008; y: 39.4000015; scale-x: 0.861999989; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 23.8999996; y: 39.5; scale-x: 0.855000019; scale-y: 0.79400003; cel: -10000; image: none; }
        frame 5 { x: 24.1000004; y: -10000; scale-x: 0.847000003; scale-y: 0.787; }
        frame 6 { x: 23.8999996; y: 39.9000015; scale-x: 0.853999972; scale-y: 0.781000018; }
        frame 7 { x: 23.7000008; y: 40.2000008; scale-x: 0.861000001; scale-y: 0.774999976; }
        frame 8 { x: 23.6000004; y: 40.5; scale-x: 0.869000018; scale-y: 0.768999994; }
        frame 9 { x: 23.3999996; y: 40.7999992; scale-x: 0.875999987; scale-y: 0.762000024; }
        frame 10 { x: 23.2999992; y: 41.0999985; scale-x: 0.884000003; scale-y: 0.755999982; }
        frame 11 { x: 23.3999996; y: -10000; scale-x: 0.880999982; scale-y: 0.735000014; }
        frame 12 { x: -10000; y: 41.2999992; scale-x: 0.878000021; scale-y: 0.713; }
        frame 13 { x: 23.5; y: 40.9000015; scale-x: 0.875; scale-y: 0.730000019; }
        frame 14 { x: 23.6000004; y: 40.5; scale-x: 0.871999979; scale-y: 0.748000026; }
        frame 15 { x: -10000; y: 40.0999985; scale-x: 0.869000018; scale-y: 0.764999986; }
        frame 16 { x: 23.7000008; y: 39.7999992; scale-x: 0.865999997; scale-y: 0.782999992; }
        frame 17 { x: -10000; y: 39.4000015; scale-x: 0.861999989; scale-y: 0.800000012; }
        frame 18 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 38.0999985; scale-y: 0.828999996; }
        frame 20 { y: 37; scale-y: 0.856999993; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 24 { y: 37.5999985; scale-y: 0.842999995; }
        frame 25 { y: 38.2000008; scale-y: 0.828999996; }
        frame 26 { y: 38.7999992; scale-y: 0.81400001; }
        frame 27 { y: 39.4000015; scale-y: 0.800000012; }
        frame 28 { y: 33.7999992; scale-y: 1.01900005; }
        frame 29 { y: 28.2999992; scale-y: 1.23699999; }
        frame 30 { y: 32; scale-y: 1.09099996; }
        frame 31 { y: 35.7000008; scale-y: 0.94599998; }
        frame 32 { y: 39.4000015; scale-y: 0.800000012; }
    }
    Track {
        source-name: "spike5";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 15; y: 40; scale-x: 0.861999989; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 15.1999998; y: 39.7000008; scale-x: 0.855000019; scale-y: 0.805000007; cel: -10000; image: none; }
        frame 5 { x: 15.3999996; y: 39.4000015; scale-x: 0.847000003; scale-y: 0.810000002; }
        frame 6 { x: 15.1999998; y: 39.7999992; scale-x: 0.855000019; scale-y: 0.799000025; }
        frame 7 { x: 15; y: 40.2999992; scale-x: 0.861999989; scale-y: 0.787999988; }
        frame 8 { x: 14.8000002; y: 40.7000008; scale-x: 0.869000018; scale-y: 0.777999997; }
        frame 9 { x: 14.6000004; y: 41.0999985; scale-x: 0.875999987; scale-y: 0.76700002; }
        frame 10 { x: 14.3999996; y: 41.5999985; scale-x: 0.884000003; scale-y: 0.755999982; }
        frame 11 { x: 14.5; y: 41.5; scale-x: 0.880999982; scale-y: 0.762000024; }
        frame 12 { x: 14.6000004; y: 41.2000008; scale-x: 0.878000021; scale-y: 0.768999994; }
        frame 13 { x: -10000; y: 41; scale-x: 0.875; scale-y: 0.774999976; }
        frame 14 { x: 14.6999998; y: 40.5999985; scale-x: 0.871999979; scale-y: 0.781000018; }
        frame 15 { x: 14.8000002; y: 40.4000015; scale-x: 0.869000018; scale-y: 0.787; }
        frame 16 { x: 14.8999996; y: 40.2000008; scale-x: 0.865999997; scale-y: 0.79400003; }
        frame 17 { x: 15; y: 40; scale-x: 0.861999989; scale-y: 0.800000012; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 38.9000015; scale-y: 0.828999996; }
        frame 20 { y: 37.5999985; scale-y: 0.856999993; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 24 { y: 38.0999985; scale-y: 0.842999995; }
        frame 25 { y: 38.7999992; scale-y: 0.828999996; }
        frame 26 { y: 39.2999992; scale-y: 0.81400001; }
        frame 27 { y: 40; scale-y: 0.800000012; }
        frame 28 { y: 35.7999992; scale-y: 0.958999991; }
        frame 29 { y: 31.6000004; scale-y: 1.11899996; }
        frame 30 { y: 34.4000015; scale-y: 1.01300001; }
        frame 31 { y: 37.0999985; scale-y: 0.906000018; }
        frame 32 { y: 40; scale-y: 0.800000012; }
    }
    Track {
        source-name: "spike9";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 0.300000012; y: 44.0999985; scale-x: 0.754999995; scale-y: 0.63499999; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 0.5; y: 44.2000008; scale-x: 0.751999974; scale-y: 0.629999995; cel: -10000; image: none; }
        frame 5 { x: 0.699999988; y: 44.2999992; scale-x: 0.748000026; scale-y: 0.625; }
        frame 6 { x: 0.400000006; y: 44.5; scale-x: 0.753000021; scale-y: 0.620000005; }
        frame 7 { x: 0.100000001; y: 44.7999992; scale-x: 0.758000016; scale-y: 0.61500001; }
        frame 8 { x: 0; y: 45.0999985; scale-x: 0.763000011; scale-y: 0.610000014; }
        frame 9 { x: -0.200000003; y: 45.4000015; scale-x: 0.768000007; scale-y: 0.605000019; }
        frame 10 { x: -0.5; y: 45.5999985; scale-x: 0.773000002; scale-y: 0.600000024; }
        frame 11 { x: -0.300000012; y: 45.7000008; scale-x: 0.771000028; scale-y: 0.583000004; }
        frame 12 { x: -0.200000003; y: 45.7999992; scale-x: 0.768000007; scale-y: 0.565999985; }
        frame 13 { x: -0.100000001; y: 45.4000015; scale-x: 0.764999986; scale-y: 0.578999996; }
        frame 14 { x: 0; y: 45.0999985; scale-x: 0.763000011; scale-y: 0.592999995; }
        frame 15 { x: 0.100000001; y: 44.7999992; scale-x: 0.75999999; scale-y: 0.606999993; }
        frame 16 { x: 0.200000003; y: 44.5; scale-x: 0.757000029; scale-y: 0.620999992; }
        frame 17 { x: 0.300000012; y: 44.0999985; scale-x: 0.754999995; scale-y: 0.63499999; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 43.0999985; scale-y: 0.657000005; }
        frame 20 { y: 42.0999985; scale-y: 0.680000007; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 23 { y: 35.0999985; scale-y: 1.02600002; }
        frame 24 { y: 37.4000015; scale-y: 0.927999973; }
        frame 25 { y: 39.5999985; scale-y: 0.83099997; }
        frame 26 { y: 42; scale-y: 0.73299998; }
        frame 27 { y: 44.0999985; scale-y: 0.63499999; }
        frame 28 { y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "spike6";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 67; y: 44.9000015; scale-x: 0.754999995; scale-y: 0.63499999; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 66.8000031; y: 45; scale-x: 0.751999974; scale-y: 0.629999995; cel: -10000; image: none; }
        frame 5 { x: 66.6999969; y: -10000; scale-x: 0.748000026; scale-y: 0.625; }
        frame 6 { x: 66.8000031; y: 45.2999992; scale-x: 0.753000021; scale-y: 0.620000005; }
        frame 7 { x: 67.0999985; y: 45.5; scale-x: 0.758000016; scale-y: 0.61500001; }
        frame 8 { x: 67.1999969; y: 45.7999992; scale-x: 0.763000011; scale-y: 0.610000014; }
        frame 9 { x: 67.5; y: 46; scale-x: 0.768000007; scale-y: 0.605000019; }
        frame 10 { x: 67.5999985; y: 46.2999992; scale-x: 0.773000002; scale-y: 0.600000024; }
        frame 11 { x: 67.5; y: 46; scale-x: 0.771000028; scale-y: 0.583000004; }
        frame 12 { x: 67.4000015; y: 45.5; scale-x: 0.768000007; scale-y: 0.565999985; }
        frame 13 { x: 67.3000031; y: 45.4000015; scale-x: 0.764999986; scale-y: 0.578999996; }
        frame 14 { x: -10000; y: 45.2999992; scale-x: 0.763000011; scale-y: 0.592999995; }
        frame 15 { x: 67.0999985; y: 45.0999985; scale-x: 0.75999999; scale-y: 0.606999993; }
        frame 16 { x: 67; y: 45; scale-x: 0.757000029; scale-y: 0.620999992; }
        frame 17 { y: 44.9000015; scale-x: 0.754999995; scale-y: 0.63499999; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 43.9000015; scale-y: 0.657000005; }
        frame 20 { y: 42.9000015; scale-y: 0.680000007; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 24 { y: 43.4000015; scale-y: 0.66900003; }
        frame 25 { y: 43.9000015; scale-y: 0.657000005; }
        frame 26 { y: 44.4000015; scale-y: 0.646000028; }
        frame 27 { y: 44.9000015; scale-y: 0.63499999; }
        frame 28 { x: 67; y: 40.0999985; scale-y: 0.841000021; }
        frame 29 { y: 35.4000015; scale-y: 1.04700005; }
        frame 30 { x: -10000; y: 38.5; scale-y: 0.910000026; }
        frame 31 { x: 66.9000015; y: 41.5999985; scale-y: 0.772000015; }
        frame 32 { x: 67; y: 44.9000015; scale-y: 0.63499999; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: -0.400000006; y: 40; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SPIKEROCK_BODY; }
        frame 4 { x: -0; y: 39.9000015; scale-x: 0.792999983; scale-y: 0.805000007; cel: -10000; image: none; }
        frame 5 { x: 0.200000003; y: 39.5999985; scale-x: 0.786000013; scale-y: 0.810000002; }
        frame 6 { x: -0; y: 40; scale-x: 0.792999983; scale-y: 0.799000025; }
        frame 7 { x: -0.300000012; y: 40.5; scale-x: 0.799000025; scale-y: 0.787999988; }
        frame 8 { x: -0.699999988; y: 40.9000015; scale-x: 0.805999994; scale-y: 0.777999997; }
        frame 9 { x: -1; y: 41.2999992; scale-x: 0.813000023; scale-y: 0.76700002; }
        frame 10 { x: -1.39999998; y: 41.7999992; scale-x: 0.819999993; scale-y: 0.755999982; }
        frame 11 { x: -1.29999995; y: 41.5; scale-x: 0.816999972; scale-y: 0.762000024; }
        frame 12 { x: -1.10000002; y: 41.2999992; scale-x: 0.81400001; scale-y: 0.768999994; }
        frame 13 { x: -1; y: 41; scale-x: 0.81099999; scale-y: 0.774999976; }
        frame 14 { x: -0.800000012; y: 40.7999992; scale-x: 0.808000028; scale-y: 0.781000018; }
        frame 15 { x: -0.699999988; y: 40.5999985; scale-x: 0.805999994; scale-y: 0.787; }
        frame 16 { x: -0.5; y: 40.4000015; scale-x: 0.802999973; scale-y: 0.79400003; }
        frame 17 { x: -0.400000006; y: 40; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 39; scale-y: 0.828999996; }
        frame 20 { y: 37.7000008; scale-y: 0.856999993; }
        frame 21 { x: -1; y: 41.4000015; scale-x: 0.811999977; scale-y: 0.754000008; }
        frame 22 { x: -1.60000002; y: 45.0999985; scale-x: 0.824000001; scale-y: 0.651000023; }
        frame 23 { x: -1.39999998; y: 44.2999992; scale-x: 0.819999993; scale-y: 0.675999999; }
        frame 24 { x: -1.20000005; y: 43.5; scale-x: 0.815999985; scale-y: 0.700999975; }
        frame 25 { x: -1; y: 42.4000015; scale-x: 0.81099999; scale-y: 0.734000027; }
        frame 26 { x: -0.699999988; y: 41.2999992; scale-x: 0.805000007; scale-y: 0.76700002; }
        frame 27 { x: -0.400000006; y: 40; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 28 { x: -1; y: 42.5999985; scale-x: 0.811999977; scale-y: 0.726000011; }
        frame 29 { x: -1.60000002; y: 45.0999985; scale-x: 0.824000001; scale-y: 0.651000023; }
        frame 30 { x: -1.20000005; y: 43.5; scale-x: 0.815999985; scale-y: 0.700999975; }
        frame 31 { x: -0.800000012; y: 41.7999992; scale-x: 0.808000028; scale-y: 0.75; }
        frame 32 { x: -0.400000006; y: 40; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "bigspike1";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 8.10000038; y: 29.1000004; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SPIKEROCK_BIGSPIKE1; }
        frame 4 { x: 8.39999962; y: 28.7000008; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 5 { x: 8.60000038; y: 28.2999992; }
        frame 6 { x: 8.39999962; y: 28.7000008; }
        frame 7 { x: 8.19999981; y: 29.1000004; }
        frame 8 { x: 8; y: 29.5; }
        frame 9 { x: 7.80000019; y: 29.8999996; }
        frame 10 { x: 7.5999999; y: 30.2999992; }
        frame 11 { x: 7.19999981; y: 31; scale-x: 0.842000008; scale-y: 0.788999975; }
        frame 12 { x: 6.80000019; y: 31.6000004; scale-x: 0.88499999; scale-y: 0.778999984; }
        frame 13 { x: 7.0999999; y: 31; scale-x: 0.867999971; scale-y: 0.782999992; }
        frame 14 { x: 7.4000001; y: 30.6000004; scale-x: 0.851000011; scale-y: 0.787; }
        frame 15 { x: 7.5999999; y: 30; scale-x: 0.833999991; scale-y: 0.791999996; }
        frame 16 { x: 7.80000019; y: 29.6000004; scale-x: 0.816999972; scale-y: 0.796000004; }
        frame 17 { x: 8.10000038; y: 29.1000004; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 27.7000008; }
        frame 20 { y: 26.2999992; }
        frame 21 { y: 28.7999992; }
        frame 22 { y: 31.2999992; }
        frame 23 { y: -10000; }
        frame 24 { y: 26.2999992; scale-y: 0.93900001; }
        frame 25 { y: 27.2000008; scale-y: 0.893000007; }
        frame 26 { x: 8.19999981; y: 28.2000008; scale-y: 0.846000016; }
        frame 27 { x: 8.10000038; y: 29.1000004; scale-y: 0.800000012; }
        frame 28 { x: -10000; y: -10000; scale-y: -10000; }
        frame 29 { y: 24.1000004; scale-y: 1.01600003; }
        frame 30 { y: 25.7999992; scale-y: 0.944000006; }
        frame 31 { x: 8.19999981; y: 27.5; scale-y: 0.871999979; }
        frame 32 { x: 8.10000038; y: 29.1000004; scale-y: 0.800000012; }
    }
    Track {
        source-name: "bigspike2";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 33; y: 33.4000015; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SPIKEROCK_BIGSPIKE2; }
        frame 4 { x: -10000; y: 32.9000015; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 5 { y: 32.4000015; }
        frame 6 { y: 32.5999985; }
        frame 7 { y: 32.7999992; }
        frame 8 { y: 33; }
        frame 9 { y: 33.2000008; }
        frame 10 { y: 33.4000015; }
        frame 11 { x: 32.7999992; y: 34; scale-x: 0.824999988; scale-y: 0.792999983; }
        frame 12 { x: 32.5; y: 34.5999985; scale-x: 0.851000011; scale-y: 0.787; }
        frame 13 { x: -10000; y: 34.4000015; scale-x: 0.839999974; scale-y: 0.788999975; }
        frame 14 { x: 32.7000008; y: 34.2000008; scale-x: 0.829999983; scale-y: 0.791999996; }
        frame 15 { x: 32.7999992; y: 33.9000015; scale-x: 0.819999993; scale-y: 0.795000017; }
        frame 16 { x: 32.9000015; y: 33.5999985; scale-x: 0.810000002; scale-y: 0.796999991; }
        frame 17 { x: 33; y: 33.4000015; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 32; }
        frame 20 { y: 30.7000008; }
        frame 21 { y: 33.4000015; }
        frame 22 { y: 36.0999985; }
        frame 23 { y: -10000; }
        frame 24 { y: 29.8999996; scale-y: 0.973999977; }
        frame 25 { y: 31; scale-y: 0.916000009; }
        frame 26 { y: 32.2000008; scale-y: 0.85799998; }
        frame 27 { y: 33.4000015; scale-y: 0.800000012; }
        frame 28 { y: -10000; scale-y: -10000; }
        frame 29 { y: 27.8999996; scale-y: 1.04400003; }
        frame 30 { y: 29.7000008; scale-y: 0.963; }
        frame 31 { y: 31.5; scale-y: 0.880999982; }
        frame 32 { y: 33.4000015; scale-y: 0.800000012; }
    }
    Track {
        source-name: "bigspike3";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 56.7999992; y: 29.1000004; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SPIKEROCK_BIGSPIKE3; }
        frame 4 { x: 56.5; y: 28.7999992; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 5 { x: 56.2999992; y: 28.3999996; }
        frame 6 { x: 56.5999985; y: 28.6000004; }
        frame 7 { x: 56.9000015; y: 28.8999996; }
        frame 8 { x: 57.2000008; y: 29.1000004; }
        frame 9 { x: 57.5; y: 29.3999996; }
        frame 10 { x: 57.7999992; y: 29.6000004; }
        frame 11 { x: 57.5999985; y: 30.3999996; scale-x: 0.822000027; scale-y: 0.785000026; }
        frame 12 { x: 57.2999992; y: 31.1000004; scale-x: 0.843999982; scale-y: 0.769999981; }
        frame 13 { x: 57.2000008; y: 30.7000008; scale-x: 0.834999979; scale-y: 0.776000023; }
        frame 14 { x: 57; y: 30.2999992; scale-x: 0.825999975; scale-y: 0.782000005; }
        frame 15 { y: 30; scale-x: 0.816999972; scale-y: 0.787999988; }
        frame 16 { x: 56.9000015; y: 29.6000004; scale-x: 0.809000015; scale-y: 0.79400003; }
        frame 17 { x: 56.7999992; y: 29.1000004; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 27.7999992; }
        frame 20 { y: 26.3999996; }
        frame 21 { y: 29.3999996; }
        frame 22 { y: 32.4000015; }
        frame 23 { y: -10000; }
        frame 24 { y: 26.8999996; scale-y: 0.967999995; }
        frame 25 { y: 27.6000004; scale-y: 0.912; }
        frame 26 { y: 28.2999992; scale-y: 0.856000006; }
        frame 27 { y: 29.1000004; scale-y: 0.800000012; }
        frame 28 { y: -10000; scale-y: -10000; }
        frame 29 { y: 24.8999996; scale-y: 1.04200006; }
        frame 30 { y: 26.2999992; scale-y: 0.961000025; }
        frame 31 { y: 27.7000008; scale-y: 0.880999982; }
        frame 32 { y: 29.1000004; scale-y: 0.800000012; }
    }
    Track {
        source-name: "anim_eye_leftbrow";
        frame-count: 33;
        frame 0 { x: 17.1000004; y: 49.2999992; skew-x: 354.5; skew-y: 354.5; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_SPIKEROCK_EYEBROW; }
        frame 1 { x: 16.2999992; y: 51; skew-x: 357.700012; skew-y: 357.700012; scale-x: 0.883000016; scale-y: 0.736999989; image: none; }
        frame 2 { x: 17.1000004; y: 49.2999992; skew-x: 354.5; skew-y: 354.5; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 3 { x: 18.7999992; y: 45.5; skew-x: 369.5; skew-y: 369.5; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: -10000; y: 45.0999985; skew-x: 368; skew-y: 367.799988; scale-x: 0.791999996; scale-y: 0.80400002; }
        frame 5 { x: 18.8999996; y: 44.7999992; skew-x: 366.600006; skew-y: 366.200012; scale-x: 0.785000026; scale-y: 0.808000028; }
        frame 6 { x: 18.7999992; y: 45.2999992; skew-x: 367; skew-y: 367; scale-x: 0.791000009; scale-y: 0.797999978; }
        frame 7 { x: -10000; y: 45.9000015; skew-x: 367.299988; skew-y: 367.799988; scale-x: 0.797999978; scale-y: 0.787999988; }
        frame 8 { x: 18.6000004; y: 46.4000015; skew-x: 367.799988; skew-y: 368.5; scale-x: 0.80400002; scale-y: 0.77700001; }
        frame 9 { x: 18.5; y: 46.9000015; skew-x: 368.299988; skew-y: 369.299988; scale-x: 0.81099999; scale-y: 0.76700002; }
        frame 10 { x: 18.2999992; y: 47.5; skew-x: 368.799988; skew-y: 370.299988; scale-x: 0.816999972; scale-y: 0.758000016; }
        frame 11 { x: 18.1000004; y: 47.5999985; skew-x: 367; skew-y: 368.299988; scale-x: 0.81400001; scale-y: 0.763000011; }
        frame 12 { x: 17.7999992; y: 47.7000008; skew-x: 365.299988; skew-y: 366.5; scale-x: 0.811999977; scale-y: 0.768999994; }
        frame 13 { x: 18.1000004; y: 47.2999992; skew-x: 366; skew-y: 367; scale-x: 0.809000015; scale-y: 0.774999976; }
        frame 14 { x: 18.2000008; y: 47; skew-x: 366.799988; skew-y: 367.600006; scale-x: 0.805999994; scale-y: 0.781000018; }
        frame 15 { x: 18.3999996; y: 46.5; skew-x: 367.799988; skew-y: 368.299988; scale-x: 0.80400002; scale-y: 0.787; }
        frame 16 { x: 18.6000004; y: 46; skew-x: 368.5; skew-y: 368.799988; scale-x: 0.801999986; scale-y: 0.792999983; }
        frame 17 { x: 18.7999992; y: 45.5; skew-x: 369.5; skew-y: 369.5; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 18 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 17.7999992; y: 45.2999992; skew-x: 362.299988; skew-y: 361.600006; scale-y: 0.827000022; }
        frame 20 { x: 16.8999996; y: 45.0999985; skew-x: 355.200012; skew-y: 353.899994; scale-x: 0.800999999; scale-y: 0.855000019; }
        frame 21 { x: 17.7999992; y: 46.5999985; skew-x: 362.299988; skew-y: 361.600006; scale-x: 0.800000012; scale-y: 0.827000022; }
        frame 22 { x: 18.7999992; y: 48; skew-x: 369.5; skew-y: 369.5; scale-x: -10000; scale-y: 0.800000012; }
        frame 23 { x: -10000; y: 47.5999985; skew-x: -10000; skew-y: -10000; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 24 { y: 47.2000008; scale-x: -10000; scale-y: -10000; }
        frame 25 { y: 46.7000008; }
        frame 26 { x: 18.8999996; y: 46.0999985; }
        frame 27 { x: 18.7999992; y: 45.5; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 28 { x: -10000; y: 46.9000015; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 29 { y: 48; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 30 { y: 47.2000008; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 31 { y: 46.4000015; scale-x: -10000; scale-y: -10000; }
        frame 32 { y: 45.5; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "anim_eye_rightbrow";
        frame-count: 33;
        frame 0 { x: 63; y: 48.5999985; skew-x: 180; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_SPIKEROCK_EYEBROW; }
        frame 1 { x: 63.7000008; y: 50.9000015; skew-x: 177.199997; skew-y: -2.70000005; scale-x: 0.884000003; scale-y: 0.736999989; image: none; }
        frame 2 { x: 63; y: 48.5999985; skew-x: 180; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 3 { x: 61.0999985; y: 45.0999985; skew-x: 165; skew-y: -14.8999996; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 61.5; y: 45; skew-x: 168.699997; skew-y: -11.1999998; scale-x: 0.791999996; scale-y: 0.80400002; }
        frame 5 { x: 61.7999992; y: 44.9000015; skew-x: 172; skew-y: -7.80000019; scale-x: 0.783999979; scale-y: 0.809000015; }
        frame 6 { x: -10000; y: 45.4000015; skew-x: 171; skew-y: -9.39999962; scale-x: 0.790000021; scale-y: 0.797999978; }
        frame 7 { x: 61.7000008; y: 45.7000008; skew-x: 169.699997; skew-y: -11; scale-x: 0.796000004; scale-y: 0.788999975; }
        frame 8 { x: 61.5999985; y: 46.0999985; skew-x: 168.5; skew-y: -12.6999998; scale-x: 0.801999986; scale-y: 0.778999984; }
        frame 9 { x: -10000; y: 46.5999985; skew-x: 167.399994; skew-y: -14.3999996; scale-x: 0.809000015; scale-y: 0.769999981; }
        frame 10 { y: 47; skew-x: 166.100006; skew-y: -16.1000004; scale-x: 0.814999998; scale-y: 0.760999978; }
        frame 11 { x: 61.9000015; y: 47.0999985; skew-x: 167.899994; skew-y: -14; scale-x: 0.811999977; scale-y: 0.764999986; }
        frame 12 { x: 62; y: 47.2999992; skew-x: 169.399994; skew-y: -12.1999998; scale-x: 0.810000002; scale-y: 0.771000028; }
        frame 13 { x: 61.9000015; y: 46.9000015; skew-x: 168.699997; skew-y: -12.6999998; scale-x: 0.806999981; scale-y: 0.776000023; }
        frame 14 { x: 61.5999985; y: 46.4000015; skew-x: 167.699997; skew-y: -13.1999998; scale-x: 0.805000007; scale-y: 0.782000005; }
        frame 15 { x: 61.5; y: 46; skew-x: 166.899994; skew-y: -13.6999998; scale-x: 0.802999973; scale-y: 0.787999988; }
        frame 16 { x: 61.2999992; y: 45.5; skew-x: 166; skew-y: -14.1999998; scale-x: 0.800999999; scale-y: 0.792999983; }
        frame 17 { x: 61.0999985; y: 45.0999985; skew-x: 165; skew-y: -14.8999996; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 18 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 62.2000008; y: 44.5; skew-x: 172; skew-y: -6.9000001; scale-x: 0.801999986; scale-y: 0.825999975; }
        frame 20 { x: 63.2999992; y: 43.7000008; skew-x: 179; skew-y: 1; scale-x: 0.80400002; scale-y: 0.853999972; }
        frame 21 { x: 62.2000008; y: 45.5999985; skew-x: 172; skew-y: -6.9000001; scale-x: 0.801999986; scale-y: 0.825999975; }
        frame 22 { x: 61.0999985; y: 47.5999985; skew-x: 165; skew-y: -14.8999996; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 23 { x: -10000; y: 47.2000008; skew-x: 165.199997; skew-y: -14.6999998; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 24 { y: 46.7999992; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { y: 46.2999992; }
        frame 26 { y: 45.7000008; }
        frame 27 { y: 45.0999985; skew-x: 165; skew-y: -14.8999996; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 28 { y: 46.4000015; skew-x: 165.199997; skew-y: -14.6999998; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 29 { y: 47.5999985; skew-x: 165; skew-y: -14.8999996; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 30 { y: 46.7999992; skew-x: 165.199997; skew-y: -14.6999998; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 31 { y: 46; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 32 { y: 45.0999985; skew-x: 165; skew-y: -14.8999996; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
    Track {
        source-name: "mouth";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 28.2999992; y: 56.4000015; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_SPIKEROCK_MOUTH; }
        frame 4 { x: 28.6000004; y: 55.9000015; scale-x: 0.776000023; scale-y: 0.823000014; cel: -10000; image: none; }
        frame 5 { x: 29; y: 55.5; scale-x: 0.751999974; scale-y: 0.847000003; }
        frame 6 { x: 28.7000008; y: 55.5999985; scale-x: 0.765999973; scale-y: 0.834999979; }
        frame 7 { x: 28.6000004; y: 56; scale-x: 0.778999984; scale-y: 0.823000014; }
        frame 8 { x: 28.3999996; y: 56.2000008; scale-x: 0.792999983; scale-y: 0.81099999; }
        frame 9 { x: 28.2000008; y: 56.4000015; scale-x: 0.805999994; scale-y: 0.799000025; }
        frame 10 { x: 28; y: 56.5; scale-x: 0.819999993; scale-y: 0.787; }
        frame 11 { x: 27.8999996; y: 56.7999992; scale-x: 0.825999975; scale-y: 0.776000023; }
        frame 12 { x: 27.7999992; y: 56.9000015; scale-x: 0.833000004; scale-y: 0.765999973; }
        frame 13 { x: 27.8999996; y: 56.7999992; scale-x: 0.825999975; scale-y: 0.773000002; }
        frame 14 { x: 28; y: 56.5999985; scale-x: 0.819999993; scale-y: 0.779999971; }
        frame 15 { y: 56.5; scale-x: 0.813000023; scale-y: 0.786000013; }
        frame 16 { x: 28.1000004; y: 56.4000015; scale-x: 0.806999981; scale-y: 0.792999983; }
        frame 17 { x: 28.2999992; y: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 18 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 27.8999996; y: 56.7000008; scale-x: 0.825999975; scale-y: 0.783999979; }
        frame 20 { x: 27.5; y: 57; scale-x: 0.851999998; scale-y: 0.768999994; }
        frame 21 { x: 28.3999996; y: 55.2999992; scale-x: 0.791000009; scale-y: 0.848999977; }
        frame 22 { x: 29.2999992; y: 53.7999992; scale-x: 0.731000006; scale-y: 0.930000007; }
        frame 23 { x: 29.1000004; y: 54.2000008; scale-x: 0.742999971; scale-y: 0.907999992; }
        frame 24 { x: 28.8999996; y: 54.5999985; scale-x: 0.754000008; scale-y: 0.887000024; }
        frame 25 { x: 28.7000008; y: 55.2000008; scale-x: 0.768999994; scale-y: 0.85799998; }
        frame 26 { x: 28.3999996; y: 55.9000015; scale-x: 0.785000026; scale-y: 0.828999996; }
        frame 27 { x: 28.2999992; y: 56.4000015; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 28 { x: 28.7999992; y: 55; scale-x: 0.765999973; scale-y: 0.86500001; }
        frame 29 { x: 29.2999992; y: 53.7999992; scale-x: 0.731000006; scale-y: 0.930000007; }
        frame 30 { x: 28.8999996; y: 54.5999985; scale-x: 0.754000008; scale-y: 0.887000024; }
        frame 31 { x: 28.6000004; y: 55.5; scale-x: 0.77700001; scale-y: 0.842999995; }
        frame 32 { x: 28.2999992; y: 56.4000015; scale-x: 0.800000012; scale-y: 0.800000012; }
    }
}
