export component HypnoShroom {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 40;
        frame 20 { cel: -1; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "anim_sleep";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 20 { cel: 0; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "Layer 1";
        frame-count: 40;
        frame 0 { x: 21.5; y: 35.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_HYPNOSHROOM_BODY; }
        frame 1 { x: 22.6; y: 36.5; skew-y: 1.5; scale-x: -10000; scale-y: 0.787; image: none; }
        frame 2 { x: 23.6; y: 37.3; skew-y: 3; scale-y: 0.774; }
        frame 3 { x: 24.6; y: 38.1; skew-y: 4.5; scale-y: 0.76; }
        frame 4 { x: 25.6; y: 38.8; skew-y: 6.1; scale-y: 0.748; }
        frame 5 { x: 24.8; y: 38.1; skew-y: 4.8; scale-y: 0.758; }
        frame 6 { x: 24; y: 37.6; skew-y: 3.5; scale-y: 0.768; }
        frame 7 { x: 23.2; y: 37; skew-y: 2.3; scale-y: 0.779; }
        frame 8 { x: 22.3; y: 36.4; skew-y: 1.1; scale-y: 0.789; }
        frame 9 { x: 21.5; y: 35.8; skew-y: 0; scale-y: 0.8; }
        frame 10 { x: 20.7; y: 36.4; skew-y: -1; scale-y: 0.789; }
        frame 11 { x: 19.9; y: 37; skew-y: -2.2; scale-y: 0.779; }
        frame 12 { x: 19.1; y: 37.5; skew-y: -3.4; scale-y: 0.768; }
        frame 13 { x: 18.2; y: 38.1; skew-y: -4.7; scale-y: 0.757; }
        frame 14 { x: 17.4; y: 38.9; skew-y: -5.9; scale-y: 0.747; }
        frame 15 { x: 18.3; y: 38.2; skew-y: -4.7; scale-y: 0.757; }
        frame 16 { x: 19.1; y: 37.6; skew-y: -3.4; scale-y: 0.768; }
        frame 17 { x: 19.9; y: 37; skew-y: -2.2; scale-y: 0.779; }
        frame 18 { x: 20.7; y: 36.5; skew-y: -1; scale-y: 0.789; }
        frame 19 { x: 21.5; y: 35.8; skew-y: 0; scale-y: 0.8; }
        frame 20 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 21.4; y: 36.1; scale-x: 0.807; scale-y: 0.794; }
        frame 22 { x: 21.2; y: 36.5; scale-x: 0.813; scale-y: 0.788; }
        frame 23 { x: 21.1; y: 36.8; scale-x: 0.82; scale-y: 0.782; }
        frame 24 { x: 20.9; y: 37.1; scale-x: 0.827; scale-y: 0.775; }
        frame 25 { x: 20.8; y: 37.5; scale-x: 0.833; scale-y: 0.769; }
        frame 26 { x: 20.6; y: 37.8; scale-x: 0.84; scale-y: 0.763; }
        frame 27 { x: 20.5; y: 38.1; scale-x: 0.847; scale-y: 0.757; }
        frame 28 { x: 20.3; y: 38.4; scale-x: 0.853; scale-y: 0.751; }
        frame 29 { x: 20.2; y: 38.8; scale-x: 0.86; scale-y: 0.745; }
        frame 30 { x: 20; y: 39; scale-x: 0.867; scale-y: 0.739; }
        frame 31 { x: 20.2; y: 38.7; scale-x: 0.859; scale-y: 0.745; }
        frame 32 { x: 20.4; y: 38.4; scale-x: 0.852; scale-y: 0.752; }
        frame 33 { x: 20.5; y: 38; scale-x: 0.844; scale-y: 0.759; }
        frame 34 { x: 20.7; y: 37.6; scale-x: 0.837; scale-y: 0.766; }
        frame 35 { x: 20.9; y: 37.3; scale-x: 0.83; scale-y: 0.773; }
        frame 36 { x: 21; y: 36.9; scale-x: 0.822; scale-y: 0.78; }
        frame 37 { x: 21.2; y: 36.5; scale-x: 0.815; scale-y: 0.786; }
        frame 38 { x: 21.4; y: 36.2; scale-x: 0.807; scale-y: 0.793; }
        frame 39 { x: 21.5; y: 35.8; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Layer 3";
        frame-count: 40;
        frame 0 { x: 37.3; y: 49.7; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_HYPNOSHROOM_EYE1; }
        frame 1 { x: 39.1; y: 49.4; skew-x: 11.2; skew-y: 11.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 41.2; y: -10000; skew-x: 22.5; skew-y: 22.5; }
        frame 3 { x: 43.3; y: 49.6; skew-x: 33.8; skew-y: 33.8; }
        frame 4 { x: 44.8; y: 50.5; skew-x: 45; skew-y: 45; }
        frame 5 { x: 47.5; y: 51.4; skew-x: 72; skew-y: 72; scale-x: 0.753; scale-y: 0.753; }
        frame 6 { x: 49.1; y: 53.5; skew-x: 98.8; skew-y: 98.8; scale-x: 0.706; scale-y: 0.706; }
        frame 7 { x: 49.2; y: 56; skew-x: 126.1; skew-y: 126.1; scale-x: 0.659; scale-y: 0.659; }
        frame 8 { x: 47.8; y: 58.4; skew-x: 153.1; skew-y: 153.1; scale-x: 0.612; scale-y: 0.612; }
        frame 9 { x: 46; y: 60.3; skew-x: 180; skew-y: 180; scale-x: 0.567; scale-y: 0.567; }
        frame 10 { x: 44.9; y: 61.3; skew-x: 188.8; skew-y: 188.8; scale-x: 0.613; scale-y: 0.613; }
        frame 11 { x: 43.5; y: 62.4; skew-x: 197.8; skew-y: 197.8; scale-x: 0.659; scale-y: 0.659; }
        frame 12 { x: 42; y: 63.3; skew-x: 207; skew-y: 207; scale-x: 0.706; scale-y: 0.706; }
        frame 13 { x: 40.3; y: 64.1; skew-x: 216.1; skew-y: 216.1; scale-x: 0.752; scale-y: 0.752; }
        frame 14 { x: 38.4; y: 64.7; skew-x: 225; skew-y: 225; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 35.4; y: 63.5; skew-x: 252; skew-y: 252; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 33.3; y: 60.9; skew-x: 278.8; skew-y: 278.8; scale-x: 0.8; scale-y: 0.8; }
        frame 17 { x: 32.7; y: 57; skew-x: 306.1; skew-y: 306.1; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 34.1; y: 53; skew-x: 333.1; skew-y: 333.1; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 37.3; y: 49.7; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { x: 35.2; y: 50.4; skew-x: -10000; skew-y: -10000; scale-x: 0.782; scale-y: 0.679; image: IMAGE_REANIM_HYPNOSHROOM_SLEEPEYE; }
        frame 21 { x: -10000; y: 50.6; scale-x: 0.788; scale-y: 0.674; image: none; }
        frame 22 { y: 50.8; scale-x: 0.795; scale-y: 0.668; }
        frame 23 { x: 35.1; y: 51; scale-x: 0.801; scale-y: 0.663; }
        frame 24 { x: -10000; y: 51.2; scale-x: 0.808; scale-y: 0.658; }
        frame 25 { y: 51.5; scale-x: 0.814; scale-y: 0.653; }
        frame 26 { x: 35; y: 51.7; scale-x: 0.821; scale-y: 0.648; }
        frame 27 { x: -10000; y: 51.9; scale-x: 0.828; scale-y: 0.642; }
        frame 28 { y: 52.1; scale-x: 0.834; scale-y: 0.637; }
        frame 29 { x: 35; y: 52.3; scale-x: 0.841; scale-y: 0.632; }
        frame 30 { x: 34.9; y: 52.5; scale-x: 0.847; scale-y: 0.627; }
        frame 31 { x: 35; y: 52.2; scale-x: 0.84; scale-y: 0.633; }
        frame 32 { x: -10000; y: 51.9; scale-x: 0.833; scale-y: 0.638; }
        frame 33 { x: 35; y: 51.7; scale-x: 0.825; scale-y: 0.644; }
        frame 34 { x: -10000; y: 51.5; scale-x: 0.818; scale-y: 0.65; }
        frame 35 { y: 51.3; scale-x: 0.811; scale-y: 0.656; }
        frame 36 { x: 35.1; y: 51; scale-x: 0.804; scale-y: 0.661; }
        frame 37 { x: -10000; y: 50.8; scale-x: 0.796; scale-y: 0.667; }
        frame 38 { y: 50.5; scale-x: 0.789; scale-y: 0.673; }
        frame 39 { x: 35.2; y: 50.4; scale-x: 0.782; scale-y: 0.679; }
    }
    Track {
        source-name: "Layer 2";
        frame-count: 40;
        frame 0 { x: 11.8; y: 1.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_HYPNOSHROOM_HEAD; }
        frame 1 { x: 14.6; y: 1.9; skew-x: 2.5; skew-y: 2.8; scale-x: 0.803; scale-y: 0.78; image: none; }
        frame 2 { x: 17.3; y: 2.6; skew-x: 5; skew-y: 5.5; scale-x: 0.807; scale-y: 0.761; }
        frame 3 { x: 20; y: 3.4; skew-x: 7.6; skew-y: 8.3; scale-x: 0.81; scale-y: 0.742; }
        frame 4 { x: 22.7; y: 4.2; skew-x: 10.3; skew-y: 11.3; scale-x: 0.814; scale-y: 0.723; }
        frame 5 { x: 24.1; y: 3.1; skew-x: 12.8; skew-y: 12.8; scale-x: 0.81; scale-y: 0.718; }
        frame 6 { x: 21; y: 2.6; skew-x: 9.5; skew-y: 9.5; scale-x: 0.807; scale-y: 0.738; }
        frame 7 { x: 17.9; y: 2; skew-x: 6.3; skew-y: 6.3; scale-x: 0.805; scale-y: 0.759; }
        frame 8 { x: 14.9; y: 1.7; skew-x: 3.1; skew-y: 3.1; scale-x: 0.802; scale-y: 0.779; }
        frame 9 { x: 11.8; y: 1.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 10 { x: 9.3; y: 3.9; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: 0.783; }
        frame 11 { x: 6.8; y: 6.5; skew-x: -4.7; skew-y: -4.7; scale-y: 0.765; }
        frame 12 { x: 4.3; y: 9.3; skew-x: -7.2; skew-y: -7.2; scale-x: 0.799; scale-y: 0.748; }
        frame 13 { x: 2; y: 12.1; skew-x: -9.7; skew-y: -9.7; scale-x: -10000; scale-y: 0.73; }
        frame 14 { x: -0; y: 14.9; skew-x: -12.2; skew-y: -12.2; scale-y: 0.713; }
        frame 15 { x: -1.1; y: 15.6; skew-x: -14.2; skew-y: -14.2; scale-y: 0.707; }
        frame 16 { x: 1.7; y: 11.9; skew-x: -10.5; skew-y: -10.7; scale-y: 0.73; }
        frame 17 { x: 5; y: 8.3; skew-x: -6.9; skew-y: -6.9; scale-y: 0.753; }
        frame 18 { x: 8.3; y: 4.8; skew-x: -3.4; skew-y: -3.4; scale-x: 0.8; scale-y: 0.777; }
        frame 19 { x: 11.8; y: 1.2; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.8; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 11.9; y: 0.5; scale-x: 0.799; scale-y: 0.807; }
        frame 22 { x: -10000; y: -0.1; scale-x: 0.798; scale-y: 0.814; }
        frame 23 { y: -0.9; scale-x: -10000; scale-y: 0.821; }
        frame 24 { x: 11.5; y: -0; scale-x: 0.81; scale-y: 0.814; }
        frame 25 { x: 11.1; y: 0.8; scale-x: 0.823; scale-y: 0.808; }
        frame 26 { x: 10.6; y: 1.8; scale-x: 0.836; scale-y: 0.801; }
        frame 27 { x: 10.2; y: 2.6; scale-x: 0.849; scale-y: 0.795; }
        frame 28 { x: 9.7; y: 3.5; scale-x: 0.861; scale-y: 0.788; }
        frame 29 { x: 9.3; y: 4.5; scale-x: 0.874; scale-y: 0.782; }
        frame 30 { x: 8.8; y: 5.5; scale-x: 0.887; scale-y: 0.775; }
        frame 31 { x: -10000; y: 6; scale-x: 0.888; scale-y: 0.769; }
        frame 32 { x: 8.7; y: 6.5; scale-x: 0.89; scale-y: 0.762; }
        frame 33 { x: 9.2; y: 5.7; scale-x: 0.877; scale-y: 0.768; }
        frame 34 { x: 9.6; y: 5; scale-x: 0.864; scale-y: 0.773; }
        frame 35 { x: 10; y: 4.2; scale-x: 0.851; scale-y: 0.779; }
        frame 36 { x: 10.5; y: 3.5; scale-x: 0.838; scale-y: 0.784; }
        frame 37 { x: 10.9; y: 2.6; scale-x: 0.826; scale-y: 0.789; }
        frame 38 { x: 11.3; y: 1.9; scale-x: 0.813; scale-y: 0.795; }
        frame 39 { x: 11.8; y: 1.2; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Layer 4";
        frame-count: 40;
        frame 0 { x: 48.7; y: 51; scale-x: 0.618; scale-y: 0.618; image: IMAGE_REANIM_HYPNOSHROOM_EYE2; }
        frame 1 { x: 48.5; y: 52; skew-x: -11.2; skew-y: -11.2; scale-x: 0.664; scale-y: 0.664; image: none; }
        frame 2 { x: 48.3; y: 53.4; skew-x: -22.4; skew-y: -22.4; scale-x: 0.709; scale-y: 0.709; }
        frame 3 { x: -10000; y: 54.9; skew-x: -33.6; skew-y: -33.6; scale-x: 0.755; scale-y: 0.755; }
        frame 4 { x: 48.4; y: 56.6; skew-x: -44.9; skew-y: -44.9; scale-x: 0.8; scale-y: 0.8; }
        frame 5 { x: -10000; y: 58.9; skew-x: -71.9; skew-y: -71.9; scale-x: 0.799; scale-y: 0.799; }
        frame 6 { x: 49.5; y: 60.5; skew-x: -98.7; skew-y: -98.7; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { x: 51.4; y: 61; skew-x: -126; skew-y: -126; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 53.5; y: 60.3; skew-x: -153; skew-y: -153; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 55.3; y: 58.3; skew-x: -179.9; skew-y: -179.9; scale-x: 0.8; scale-y: 0.8; }
        frame 10 { x: 55.2; y: 57.4; skew-x: -188.7; skew-y: -188.7; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 55.1; y: 56.4; skew-x: -197.7; skew-y: -197.7; scale-x: 0.799; scale-y: 0.799; }
        frame 12 { x: 54.8; y: 55.3; skew-x: -206.9; skew-y: -206.9; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 54.4; y: 54.3; skew-x: -216; skew-y: -216; }
        frame 14 { x: 53.8; y: 53.1; skew-x: -224.9; skew-y: -224.9; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: 50.6; skew-x: -251.9; skew-y: -251.9; scale-x: 0.763; scale-y: 0.763; }
        frame 16 { x: 52.7; y: 49; skew-x: -278.7; skew-y: -278.7; scale-x: 0.727; scale-y: 0.727; }
        frame 17 { x: 51.1; y: 48.5; skew-x: -306; skew-y: -306; scale-x: 0.69; scale-y: 0.69; }
        frame 18 { x: 49.6; y: 49.3; skew-x: -333; skew-y: -333; scale-x: 0.654; scale-y: 0.654; }
        frame 19 { x: 48.7; y: 51; skew-x: -359.9; skew-y: -359.9; scale-x: 0.618; scale-y: 0.618; }
        frame 20 { x: 54; y: 48.8; skew-x: -200.1; skew-y: -380.1; scale-x: 0.493; scale-y: 0.521; image: IMAGE_REANIM_HYPNOSHROOM_SLEEPEYE; }
        frame 21 { y: 49.1; skew-x: -199.7; skew-y: -380.4; scale-x: 0.496; scale-y: 0.517; image: none; }
        frame 22 { x: 54.3; y: 49.3; skew-x: -199.5; skew-y: -380.7; scale-x: 0.499; scale-y: 0.514; }
        frame 23 { x: 54.4; y: 49.5; skew-x: -199.2; skew-y: -381; scale-x: 0.503; scale-y: 0.511; }
        frame 24 { x: 54.5; y: 49.8; skew-x: -198.9; skew-y: -381.2; scale-x: 0.506; scale-y: 0.508; }
        frame 25 { x: -10000; y: 50; skew-x: -198.7; skew-y: -381.7; scale-x: 0.509; scale-y: 0.506; }
        frame 26 { x: 54.7; y: 50.1; skew-x: -198.4; skew-y: -382; scale-x: 0.512; scale-y: 0.503; }
        frame 27 { x: 54.9; y: 50.4; skew-x: -198.2; skew-y: -382.2; scale-x: 0.516; scale-y: 0.5; }
        frame 28 { x: 55; y: 50.5; skew-x: -197.9; skew-y: -382.7; scale-x: 0.519; scale-y: 0.497; }
        frame 29 { y: 50.9; skew-x: -197.5; skew-y: -382.9; scale-x: 0.522; scale-y: 0.494; }
        frame 30 { x: 55.1; y: 51; skew-x: -197.3; skew-y: -383.3; scale-x: 0.526; scale-y: 0.492; }
        frame 31 { x: 55; y: 50.8; skew-x: -197.7; skew-y: -382.9; scale-x: 0.522; scale-y: 0.494; }
        frame 32 { y: 50.5; skew-x: -197.9; skew-y: -382.5; scale-x: 0.518; scale-y: 0.497; }
        frame 33 { x: 54.8; y: 50.4; skew-x: -198.2; skew-y: -382.2; scale-x: 0.514; scale-y: 0.501; }
        frame 34 { x: 54.6; y: 50; skew-x: -198.5; skew-y: -381.7; scale-x: 0.511; scale-y: 0.504; }
        frame 35 { x: 54.4; y: 49.8; skew-x: -198.7; skew-y: -381.5; scale-x: 0.507; scale-y: 0.507; }
        frame 36 { x: -10000; y: 49.5; skew-x: -199.2; skew-y: -381.2; scale-x: 0.504; scale-y: 0.51; }
        frame 37 { x: 54.2; y: 49.4; skew-x: -199.4; skew-y: -380.7; scale-x: 0.5; scale-y: 0.514; }
        frame 38 { x: 54; y: 49; skew-x: -199.7; skew-y: -380.4; scale-x: 0.497; scale-y: 0.517; }
        frame 39 { y: 48.8; skew-x: -200.1; skew-y: -380.1; scale-x: 0.493; scale-y: 0.521; }
    }
}
