export component SeaShroom {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 93;
        frame 4 { cel: -1; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "anim_sleep";
        frame-count: 93;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 43 { cel: 0; }
        frame 44 { cel: -10000; }
        frame 68 { cel: -1; }
        frame 69 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 93;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { cel: 0; }
        frame 5 { cel: -10000; }
        frame 29 { cel: -1; }
        frame 30 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle_aquarium";
        frame-count: 93;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 68 { cel: 0; }
        frame 69 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 93;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 29 { cel: 0; }
        frame 30 { cel: -10000; }
        frame 43 { cel: -1; }
        frame 44 { cel: -10000; }
    }
    Track {
        source-name: "SeaShroom_tentacles";
        frame-count: 93;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 17.6; y: 52; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_SEASHROOM_TENTACLES; }
        frame 5 { x: 17.3; scale-x: 0.708; scale-y: 0.672; cel: -10000; image: none; }
        frame 6 { x: 17; y: -10000; scale-x: 0.716; scale-y: 0.643; }
        frame 7 { x: 16.8; y: 52.1; scale-x: 0.724; scale-y: 0.615; }
        frame 8 { x: 16.6; y: -10000; scale-x: 0.731; scale-y: 0.587; }
        frame 9 { x: 16.3; y: 52.2; scale-x: 0.739; scale-y: 0.558; }
        frame 10 { x: 16; y: 52.3; scale-x: 0.747; scale-y: 0.53; }
        frame 11 { x: 16.3; y: -10000; scale-x: 0.739; scale-y: 0.558; }
        frame 12 { x: 16.6; y: 52.2; scale-x: 0.731; scale-y: 0.587; }
        frame 13 { x: 16.8; y: 52.1; scale-x: 0.724; scale-y: 0.615; }
        frame 14 { x: 17; y: 52; scale-x: 0.716; scale-y: 0.643; }
        frame 15 { x: 17.4; y: -10000; scale-x: 0.708; scale-y: 0.672; }
        frame 16 { x: 17.6; y: 52; scale-x: 0.7; scale-y: 0.7; }
        frame 17 { x: 18.3; scale-x: 0.678; scale-y: 0.739; }
        frame 18 { x: 19; y: -10000; scale-x: 0.656; scale-y: 0.779; }
        frame 19 { x: 19.7; y: 52.1; scale-x: 0.634; scale-y: 0.818; }
        frame 20 { x: 20.4; y: 52.2; scale-x: 0.612; scale-y: 0.858; }
        frame 21 { x: 21.2; y: 52.3; scale-x: 0.59; scale-y: 0.897; }
        frame 22 { x: 21.9; y: 52.4; scale-x: 0.568; scale-y: 0.937; }
        frame 23 { x: 21.2; y: 52.3; scale-x: 0.59; scale-y: 0.897; }
        frame 24 { x: 20.5; y: -10000; scale-x: 0.612; scale-y: 0.858; }
        frame 25 { x: 19.8; y: 52.1; scale-x: 0.634; scale-y: 0.818; }
        frame 26 { x: 19; y: -10000; scale-x: 0.656; scale-y: 0.779; }
        frame 27 { x: 18.3; y: 52; scale-x: 0.678; scale-y: 0.739; }
        frame 28 { x: 17.6; scale-x: 0.7; scale-y: 0.7; }
        frame 29 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 16.5; skew-y: -3.9; scale-x: 0.723; scale-y: 0.663; }
        frame 31 { x: 15.6; y: 52; skew-y: -8; scale-x: 0.745; scale-y: 0.626; }
        frame 32 { x: 14.7; y: 52.1; skew-y: -12.2; scale-x: 0.768; scale-y: 0.589; }
        frame 33 { x: 13.9; y: 52.3; skew-y: -16.2; scale-x: 0.79; scale-y: 0.552; }
        frame 34 { x: 13.1; y: 52.4; skew-y: -20.4; scale-x: 0.813; scale-y: 0.516; }
        frame 35 { x: 16.2; y: 51.1; skew-y: -3.7; scale-x: 0.714; scale-y: 0.706; }
        frame 36 { x: 20.8; y: 50.6; skew-y: 12.8; scale-x: 0.614; scale-y: 0.895; }
        frame 37 { x: 26.5; y: 51.5; skew-y: 29.4; scale-x: 0.514; scale-y: 1.086; }
        frame 38 { x: 24.4; y: 51.2; skew-y: 23.5; scale-x: 0.552; scale-y: 1.007; }
        frame 39 { x: 22.4; y: 51.1; skew-y: 17.6; scale-x: 0.589; scale-y: 0.931; }
        frame 40 { x: 20.6; y: 51.3; skew-y: 11.8; scale-x: 0.626; scale-y: 0.854; }
        frame 41 { x: 19; y: 51.5; skew-y: 5.8; scale-x: 0.663; scale-y: 0.777; }
        frame 42 { x: 17.6; y: 52; skew-y: 0; scale-x: 0.7; scale-y: 0.7; }
        frame 43 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 17.3; y: 52; scale-x: 0.708; scale-y: 0.672; }
        frame 45 { x: 17; y: -10000; scale-x: 0.716; scale-y: 0.643; }
        frame 46 { x: 16.8; y: 52.1; scale-x: 0.724; scale-y: 0.615; }
        frame 47 { x: 16.6; y: -10000; scale-x: 0.731; scale-y: 0.587; }
        frame 48 { x: 16.3; y: 52.2; scale-x: 0.739; scale-y: 0.558; }
        frame 49 { x: 16; y: 52.3; scale-x: 0.747; scale-y: 0.53; }
        frame 50 { x: 16.3; y: -10000; scale-x: 0.739; scale-y: 0.558; }
        frame 51 { x: 16.6; y: 52.2; scale-x: 0.731; scale-y: 0.587; }
        frame 52 { x: 16.8; y: 52.1; scale-x: 0.724; scale-y: 0.615; }
        frame 53 { x: 17; y: 52; scale-x: 0.716; scale-y: 0.643; }
        frame 54 { x: 17.4; y: -10000; scale-x: 0.708; scale-y: 0.672; }
        frame 55 { x: 17.6; y: 52; scale-x: 0.7; scale-y: 0.7; }
        frame 56 { x: 18.3; scale-x: 0.678; scale-y: 0.739; }
        frame 57 { x: 19; y: -10000; scale-x: 0.656; scale-y: 0.779; }
        frame 58 { x: 19.7; y: 52.1; scale-x: 0.634; scale-y: 0.818; }
        frame 59 { x: 20.4; y: 52.2; scale-x: 0.612; scale-y: 0.858; }
        frame 60 { x: 21.2; y: 52.3; scale-x: 0.59; scale-y: 0.897; }
        frame 61 { x: 21.9; y: 52.4; scale-x: 0.568; scale-y: 0.937; }
        frame 62 { x: 21.2; y: 52.3; scale-x: 0.59; scale-y: 0.897; }
        frame 63 { x: 20.5; y: -10000; scale-x: 0.612; scale-y: 0.858; }
        frame 64 { x: 19.8; y: 52.1; scale-x: 0.634; scale-y: 0.818; }
        frame 65 { x: 19; y: -10000; scale-x: 0.656; scale-y: 0.779; }
        frame 66 { x: 18.3; y: 52; scale-x: 0.678; scale-y: 0.739; }
        frame 67 { x: 17.6; scale-x: 0.7; scale-y: 0.7; }
        frame 68 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 69 { cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 93;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 24; y: 34; scale-x: 0.738; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_SEASHROOM_BODY; }
        frame 5 { x: 23.9; y: 34.4; scale-x: 0.744; scale-y: 0.69; cel: -10000; image: none; }
        frame 6 { x: 23.7; y: 34.6; scale-x: 0.751; scale-y: 0.68; }
        frame 7 { x: -10000; y: 34.9; scale-x: 0.757; scale-y: 0.67; }
        frame 8 { x: 23.5; y: 35.1; scale-x: 0.764; scale-y: 0.66; }
        frame 9 { x: 23.3; y: 35.4; scale-x: 0.77; scale-y: 0.651; }
        frame 10 { x: 23.2; y: 35.6; scale-x: 0.777; scale-y: 0.641; }
        frame 11 { x: 23.3; y: 35.4; scale-x: 0.77; scale-y: 0.651; }
        frame 12 { x: 23.5; y: 35; scale-x: 0.764; scale-y: 0.66; }
        frame 13 { x: 23.7; y: 34.9; scale-x: 0.757; scale-y: 0.67; }
        frame 14 { x: -10000; y: 34.6; scale-x: 0.751; scale-y: 0.68; }
        frame 15 { x: 23.9; y: 34.4; scale-x: 0.744; scale-y: 0.69; }
        frame 16 { x: 24; y: 34; scale-x: 0.738; scale-y: 0.7; }
        frame 17 { x: 24.1; y: 33.8; scale-x: 0.731; scale-y: 0.708; }
        frame 18 { x: 24.3; y: 33.5; scale-x: 0.724; scale-y: 0.717; }
        frame 19 { x: 24.4; y: 33.2; scale-x: 0.717; scale-y: 0.725; }
        frame 20 { x: 24.6; y: 32.9; scale-x: 0.711; scale-y: 0.733; }
        frame 21 { x: 24.7; y: 32.6; scale-x: 0.704; scale-y: 0.742; }
        frame 22 { x: 24.8; y: 32.3; scale-x: 0.697; scale-y: 0.75; }
        frame 23 { x: 24.7; y: 32.6; scale-x: 0.704; scale-y: 0.742; }
        frame 24 { x: 24.6; y: 32.9; scale-x: 0.711; scale-y: 0.733; }
        frame 25 { x: 24.4; y: 33.1; scale-x: 0.717; scale-y: 0.725; }
        frame 26 { x: 24.3; y: 33.5; scale-x: 0.724; scale-y: 0.717; }
        frame 27 { x: 24.1; y: 33.8; scale-x: 0.731; scale-y: 0.708; }
        frame 28 { x: 24; y: 34; scale-x: 0.738; scale-y: 0.7; }
        frame 29 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 23.5; y: 32.5; skew-y: 0.5; scale-x: 0.767; scale-y: 0.76; }
        frame 31 { x: 23; y: 31.2; skew-y: 1.3; scale-x: 0.797; scale-y: 0.82; }
        frame 32 { x: 22.6; y: 29.7; skew-y: 2; scale-x: 0.827; scale-y: 0.88; }
        frame 33 { x: 22.1; y: 28.2; skew-x: -0; skew-y: 2.5; scale-x: 0.856; scale-y: 0.939; }
        frame 34 { x: 21.7; y: 26.7; skew-x: -0.2; skew-y: 3.4; scale-x: 0.886; scale-y: 1; }
        frame 35 { x: 21.4; y: 30.3; skew-x: -0; skew-y: 2.1; scale-x: 0.887; scale-y: 0.854; }
        frame 36 { x: 21.2; y: 34; skew-x: 0; skew-y: 1; scale-x: 0.889; scale-y: 0.709; }
        frame 37 { x: -10000; y: 37.8; skew-x: -10000; skew-y: 0; scale-x: 0.89; scale-y: 0.563; }
        frame 38 { x: 21.7; y: 37; skew-y: -10000; scale-x: 0.859; scale-y: 0.591; }
        frame 39 { x: 22.3; y: 36.3; scale-x: 0.829; scale-y: 0.618; }
        frame 40 { x: 22.8; y: 35.5; scale-x: 0.799; scale-y: 0.645; }
        frame 41 { x: 23.4; y: 34.8; scale-x: 0.768; scale-y: 0.673; }
        frame 42 { x: 24; y: 34; scale-x: 0.738; scale-y: 0.7; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 23.9; y: 34.4; scale-x: 0.744; scale-y: 0.69; }
        frame 45 { x: 23.7; y: 34.6; scale-x: 0.751; scale-y: 0.68; }
        frame 46 { x: -10000; y: 34.9; scale-x: 0.757; scale-y: 0.67; }
        frame 47 { x: 23.5; y: 35.1; scale-x: 0.764; scale-y: 0.66; }
        frame 48 { x: 23.3; y: 35.4; scale-x: 0.77; scale-y: 0.651; }
        frame 49 { x: 23.2; y: 35.6; scale-x: 0.777; scale-y: 0.641; }
        frame 50 { x: 23.3; y: 35.4; scale-x: 0.77; scale-y: 0.651; }
        frame 51 { x: 23.5; y: 35; scale-x: 0.764; scale-y: 0.66; }
        frame 52 { x: 23.7; y: 34.9; scale-x: 0.757; scale-y: 0.67; }
        frame 53 { x: -10000; y: 34.6; scale-x: 0.751; scale-y: 0.68; }
        frame 54 { x: 23.9; y: 34.4; scale-x: 0.744; scale-y: 0.69; }
        frame 55 { x: 24; y: 34; scale-x: 0.738; scale-y: 0.7; }
        frame 56 { x: 24.1; y: 33.8; scale-x: 0.731; scale-y: 0.708; }
        frame 57 { x: 24.3; y: 33.5; scale-x: 0.724; scale-y: 0.717; }
        frame 58 { x: 24.4; y: 33.2; scale-x: 0.717; scale-y: 0.725; }
        frame 59 { x: 24.6; y: 32.9; scale-x: 0.711; scale-y: 0.733; }
        frame 60 { x: 24.7; y: 32.6; scale-x: 0.704; scale-y: 0.742; }
        frame 61 { x: 24.8; y: 32.3; scale-x: 0.697; scale-y: 0.75; }
        frame 62 { x: 24.7; y: 32.6; scale-x: 0.704; scale-y: 0.742; }
        frame 63 { x: 24.6; y: 32.9; scale-x: 0.711; scale-y: 0.733; }
        frame 64 { x: 24.4; y: 33.1; scale-x: 0.717; scale-y: 0.725; }
        frame 65 { x: 24.3; y: 33.5; scale-x: 0.724; scale-y: 0.717; }
        frame 66 { x: 24.1; y: 33.8; scale-x: 0.731; scale-y: 0.708; }
        frame 67 { x: 24; y: 34; scale-x: 0.738; scale-y: 0.7; }
        frame 68 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 23.9; y: 34.4; scale-x: 0.744; scale-y: 0.69; }
        frame 70 { x: 23.7; y: 34.6; scale-x: 0.751; scale-y: 0.68; }
        frame 71 { x: -10000; y: 34.9; scale-x: 0.757; scale-y: 0.67; }
        frame 72 { x: 23.5; y: 35.1; scale-x: 0.764; scale-y: 0.66; }
        frame 73 { x: 23.3; y: 35.4; scale-x: 0.77; scale-y: 0.651; }
        frame 74 { x: 23.2; y: 35.6; scale-x: 0.777; scale-y: 0.641; }
        frame 75 { x: 23.3; y: 35.4; scale-x: 0.77; scale-y: 0.651; }
        frame 76 { x: 23.5; y: 35; scale-x: 0.764; scale-y: 0.66; }
        frame 77 { x: 23.7; y: 34.9; scale-x: 0.757; scale-y: 0.67; }
        frame 78 { x: -10000; y: 34.6; scale-x: 0.751; scale-y: 0.68; }
        frame 79 { x: 23.9; y: 34.4; scale-x: 0.744; scale-y: 0.69; }
        frame 80 { x: 24; y: 34; scale-x: 0.738; scale-y: 0.7; }
        frame 81 { x: 24.1; y: 33.8; scale-x: 0.731; scale-y: 0.708; }
        frame 82 { x: 24.3; y: 33.5; scale-x: 0.724; scale-y: 0.717; }
        frame 83 { x: 24.4; y: 33.2; scale-x: 0.717; scale-y: 0.725; }
        frame 84 { x: 24.6; y: 32.9; scale-x: 0.711; scale-y: 0.733; }
        frame 85 { x: 24.7; y: 32.6; scale-x: 0.704; scale-y: 0.742; }
        frame 86 { x: 24.8; y: 32.3; scale-x: 0.697; scale-y: 0.75; }
        frame 87 { x: 24.7; y: 32.6; scale-x: 0.704; scale-y: 0.742; }
        frame 88 { x: 24.6; y: 32.9; scale-x: 0.711; scale-y: 0.733; }
        frame 89 { x: 24.4; y: 33.1; scale-x: 0.717; scale-y: 0.725; }
        frame 90 { x: 24.3; y: 33.5; scale-x: 0.724; scale-y: 0.717; }
        frame 91 { x: 24.1; y: 33.8; scale-x: 0.731; scale-y: 0.708; }
        frame 92 { x: 24; y: 34; scale-x: 0.738; scale-y: 0.7; }
    }
    Track {
        source-name: "SeaShroom_blink";
        frame-count: 93;
        frame 0 { cel: -1; }
        frame 1 { x: 41; y: 37.5; scale-x: 0.732; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_SEASHROOM_BLINK1; }
        frame 2 { x: 40.9; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_SEASHROOM_BLINK2; }
        frame 3 { x: 41; image: IMAGE_REANIM_SEASHROOM_BLINK1; }
        frame 4 { x: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 36 { x: 43; y: 37.3; scale-x: 0.824; cel: 0; }
        frame 37 { x: 44.1; y: 39.3; scale-x: 0.778; cel: -10000; image: IMAGE_REANIM_SEASHROOM_BLINK2; }
        frame 38 { x: 42.3; y: 39; scale-x: 0.824; image: IMAGE_REANIM_SEASHROOM_BLINK1; }
        frame 39 { x: -10000; y: -10000; scale-x: -10000; cel: -1; image: none; }
        frame 40 { cel: -10000; }
        frame 43 { x: 40.8; y: 37.6; scale-x: 0.732; cel: 0; }
        frame 44 { x: 40.9; y: 37.8; scale-x: -10000; cel: -10000; }
        frame 45 { x: 41; y: 38; }
        frame 46 { y: 38.1; }
        frame 47 { x: 41.1; y: 38.3; }
        frame 48 { x: 41.2; y: 38.5; }
        frame 49 { x: 41.3; y: 38.6; }
        frame 50 { x: 41.1; y: 38.8; scale-x: 0.744; scale-y: 0.679; }
        frame 51 { x: 41; y: 38.9; scale-x: 0.756; scale-y: 0.658; }
        frame 52 { x: -10000; y: 38.6; scale-x: 0.75; scale-y: 0.669; }
        frame 53 { x: 40.9; y: 38.3; scale-x: 0.744; scale-y: 0.679; }
        frame 54 { x: -10000; y: 38; scale-x: 0.738; scale-y: 0.69; }
        frame 55 { x: 40.8; y: 37.6; scale-x: 0.732; scale-y: 0.7; }
        frame 56 { x: 40.9; y: 37.4; scale-x: 0.724; scale-y: 0.721; }
        frame 57 { x: 41; y: 37; scale-x: 0.716; scale-y: 0.742; }
        frame 58 { y: 36.8; scale-x: 0.707; scale-y: 0.762; }
        frame 59 { x: 41.1; y: 36.5; scale-x: 0.699; scale-y: 0.783; }
        frame 60 { x: 41.2; y: 36.2; scale-x: 0.691; scale-y: 0.804; }
        frame 61 { x: 41.3; y: 35.9; scale-x: 0.682; scale-y: 0.825; }
        frame 62 { x: 41.2; y: 36.1; scale-x: 0.691; scale-y: 0.804; }
        frame 63 { x: 41.1; y: 36.5; scale-x: 0.699; scale-y: 0.783; }
        frame 64 { x: 41; y: 36.8; scale-x: 0.707; scale-y: 0.762; }
        frame 65 { y: 37; scale-x: 0.716; scale-y: 0.742; }
        frame 66 { x: 40.9; y: 37.3; scale-x: 0.724; scale-y: 0.721; }
        frame 67 { x: 40.8; y: 37.6; scale-x: 0.732; scale-y: 0.7; }
        frame 68 { x: 17; y: 47.3; scale-x: 0.7; scale-y: -10000; image: IMAGE_REANIM_SEASHROOM_TENTACLES_ZENGARDEN; }
        frame 69 { x: 16.7; y: 47.5; scale-x: 0.708; scale-y: 0.672; image: none; }
        frame 70 { x: 16.5; y: 47.8; scale-x: 0.716; scale-y: 0.643; }
        frame 71 { x: 16.2; y: 48; scale-x: 0.724; scale-y: 0.615; }
        frame 72 { x: 16.1; y: 48.1; scale-x: 0.731; scale-y: 0.587; }
        frame 73 { x: 15.8; y: 48.5; scale-x: 0.739; scale-y: 0.558; }
        frame 74 { x: 15.6; y: 48.6; scale-x: 0.747; scale-y: 0.53; }
        frame 75 { x: 15.8; y: 48.4; scale-x: 0.739; scale-y: 0.558; }
        frame 76 { x: 16.1; y: 48.2; scale-x: 0.731; scale-y: 0.587; }
        frame 77 { x: 16.4; y: 48; scale-x: 0.724; scale-y: 0.615; }
        frame 78 { x: 16.7; y: 47.8; scale-x: 0.716; scale-y: 0.643; }
        frame 79 { x: 16.9; y: 47.5; scale-x: 0.708; scale-y: 0.672; }
        frame 80 { x: 17.2; y: 47.4; scale-x: 0.7; scale-y: 0.7; }
        frame 81 { x: 17.3; y: 47; scale-x: 0.699; scale-y: 0.731; }
        frame 82 { x: 17.2; y: 46.7; scale-x: -10000; scale-y: 0.763; }
        frame 83 { x: -10000; y: 46.4; scale-x: 0.698; scale-y: 0.794; }
        frame 84 { y: 46; scale-x: -10000; scale-y: 0.825; }
        frame 85 { y: 45.8; scale-x: 0.697; scale-y: 0.857; }
        frame 86 { x: 17.3; y: 45.4; scale-x: 0.696; scale-y: 0.888; }
        frame 87 { x: -10000; y: 45.6; scale-x: 0.697; scale-y: 0.857; }
        frame 88 { x: 17.2; y: 46; scale-x: 0.698; scale-y: 0.825; }
        frame 89 { x: -10000; y: 46.3; scale-x: -10000; scale-y: 0.794; }
        frame 90 { x: 17.1; y: 46.6; scale-x: 0.699; scale-y: 0.763; }
        frame 91 { x: 17.2; y: 46.9; scale-x: -10000; scale-y: 0.731; }
        frame 92 { x: 17; y: 47.3; scale-x: 0.7; scale-y: 0.7; }
    }
    Track {
        source-name: "SeaShroom_blink2";
        frame-count: 93;
        frame 0 { cel: -1; }
        frame 1 { x: 41; y: 37.5; scale-x: 0.732; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_SEASHROOM_BLINK1; }
        frame 2 { x: 40.9; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_SEASHROOM_BLINK2; }
        frame 3 { x: 41; image: IMAGE_REANIM_SEASHROOM_BLINK1; }
        frame 4 { x: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 36 { x: 43; y: 37.3; scale-x: 0.824; cel: 0; }
        frame 37 { x: 44.1; y: 39.3; scale-x: 0.778; cel: -10000; image: IMAGE_REANIM_SEASHROOM_BLINK2; }
        frame 38 { x: 42.3; y: 39; scale-x: 0.824; image: IMAGE_REANIM_SEASHROOM_BLINK1; }
        frame 39 { x: -10000; y: -10000; scale-x: -10000; cel: -1; image: none; }
        frame 40 { cel: -10000; }
        frame 43 { x: 40.7; y: 37.6; scale-x: 0.732; cel: 0; image: IMAGE_REANIM_SEASHROOM_BLINK2; }
        frame 44 { x: 40.8; y: 37.8; scale-x: -10000; cel: -10000; image: none; }
        frame 45 { x: 40.9; y: 38; }
        frame 46 { x: 41; y: 38.1; }
        frame 47 { y: 38.3; }
        frame 48 { x: 41.1; y: 38.5; }
        frame 49 { x: -10000; y: 38.6; }
        frame 50 { x: 41; y: 38.8; scale-x: 0.744; scale-y: 0.679; }
        frame 51 { y: 38.9; scale-x: 0.756; scale-y: 0.658; }
        frame 52 { x: 40.9; y: 38.5; scale-x: 0.75; scale-y: 0.669; }
        frame 53 { x: 40.8; y: 38.3; scale-x: 0.744; scale-y: 0.679; }
        frame 54 { x: -10000; y: 38; scale-x: 0.738; scale-y: 0.69; }
        frame 55 { x: 40.7; y: 37.6; scale-x: 0.732; scale-y: 0.7; }
        frame 56 { x: 40.8; y: 37.3; scale-x: 0.724; scale-y: 0.721; }
        frame 57 { x: 40.9; y: 37; scale-x: 0.716; scale-y: 0.742; }
        frame 58 { x: 41; y: 36.8; scale-x: 0.707; scale-y: 0.762; }
        frame 59 { y: 36.5; scale-x: 0.699; scale-y: 0.783; }
        frame 60 { x: 41.1; y: 36.1; scale-x: 0.691; scale-y: 0.804; }
        frame 61 { x: -10000; y: 35.9; scale-x: 0.682; scale-y: 0.825; }
        frame 62 { y: 36.1; scale-x: 0.691; scale-y: 0.804; }
        frame 63 { x: 41; y: 36.5; scale-x: 0.699; scale-y: 0.783; }
        frame 64 { y: 36.7; scale-x: 0.707; scale-y: 0.762; }
        frame 65 { x: 40.9; y: 37; scale-x: 0.716; scale-y: 0.742; }
        frame 66 { x: 40.8; y: 37.3; scale-x: 0.724; scale-y: 0.721; }
        frame 67 { x: 40.7; y: 37.6; scale-x: 0.732; scale-y: 0.7; }
        frame 68 { x: 17; y: 47.3; scale-x: 0.7; scale-y: -10000; image: IMAGE_REANIM_SEASHROOM_TENTACLES_ZENGARDEN; }
        frame 69 { x: 16.7; y: 47.5; scale-x: 0.708; scale-y: 0.672; image: none; }
        frame 70 { x: 16.5; y: 47.8; scale-x: 0.716; scale-y: 0.643; }
        frame 71 { x: 16.2; y: 48; scale-x: 0.724; scale-y: 0.615; }
        frame 72 { x: 16.1; y: 48.1; scale-x: 0.731; scale-y: 0.587; }
        frame 73 { x: 15.8; y: 48.5; scale-x: 0.739; scale-y: 0.558; }
        frame 74 { x: 15.6; y: 48.6; scale-x: 0.747; scale-y: 0.53; }
        frame 75 { x: 15.8; y: 48.4; scale-x: 0.739; scale-y: 0.558; }
        frame 76 { x: 16.1; y: 48.2; scale-x: 0.731; scale-y: 0.587; }
        frame 77 { x: 16.4; y: 48; scale-x: 0.724; scale-y: 0.615; }
        frame 78 { x: 16.7; y: 47.8; scale-x: 0.716; scale-y: 0.643; }
        frame 79 { x: 16.9; y: 47.5; scale-x: 0.708; scale-y: 0.672; }
        frame 80 { x: 17.2; y: 47.4; scale-x: 0.7; scale-y: 0.7; }
        frame 81 { x: 17.3; y: 47; scale-x: 0.699; scale-y: 0.731; }
        frame 82 { x: 17.2; y: 46.7; scale-x: -10000; scale-y: 0.763; }
        frame 83 { x: -10000; y: 46.4; scale-x: 0.698; scale-y: 0.794; }
        frame 84 { y: 46; scale-x: -10000; scale-y: 0.825; }
        frame 85 { y: 45.8; scale-x: 0.697; scale-y: 0.857; }
        frame 86 { x: 17.3; y: 45.4; scale-x: 0.696; scale-y: 0.888; }
        frame 87 { x: -10000; y: 45.6; scale-x: 0.697; scale-y: 0.857; }
        frame 88 { x: 17.2; y: 46; scale-x: 0.698; scale-y: 0.825; }
        frame 89 { x: -10000; y: 46.3; scale-x: -10000; scale-y: 0.794; }
        frame 90 { x: 17.1; y: 46.6; scale-x: 0.699; scale-y: 0.763; }
        frame 91 { x: 17.2; y: 46.9; scale-x: -10000; scale-y: 0.731; }
        frame 92 { x: 17; y: 47.3; scale-x: 0.7; scale-y: 0.7; }
    }
    Track {
        source-name: "anim_waterline";
        frame-count: 93;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 28.4; y: 51; scale-x: 0.783; scale-y: 0.773; cel: 0; image: IMAGE_REANIM_SEASHROOM_FOAM; }
        frame 5 { x: 28.3; y: -10000; scale-x: 0.79; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 28.2; scale-x: 0.796; }
        frame 7 { x: 28.1; scale-x: 0.803; }
        frame 8 { x: 27.9; scale-x: 0.81; }
        frame 9 { x: 27.8; scale-x: 0.817; }
        frame 10 { x: -10000; scale-x: 0.823; }
        frame 11 { scale-x: 0.817; }
        frame 12 { x: 28; scale-x: 0.81; }
        frame 13 { x: 28.1; scale-x: 0.803; }
        frame 14 { x: 28.3; scale-x: 0.796; }
        frame 15 { x: -10000; scale-x: 0.79; }
        frame 16 { x: 28.4; scale-x: 0.783; }
        frame 17 { x: 28.5; scale-x: 0.773; }
        frame 18 { x: 28.7; scale-x: 0.764; }
        frame 19 { x: 28.9; scale-x: 0.754; }
        frame 20 { x: 29; scale-x: 0.744; }
        frame 21 { x: 29.1; scale-x: 0.735; }
        frame 22 { x: 29.3; scale-x: 0.725; }
        frame 23 { x: 29.2; scale-x: 0.735; }
        frame 24 { x: 29.1; scale-x: 0.744; }
        frame 25 { x: 29; scale-x: 0.754; }
        frame 26 { x: 28.8; scale-x: 0.764; }
        frame 27 { x: 28.6; scale-x: 0.773; }
        frame 28 { x: 28.4; scale-x: 0.783; }
        frame 29 { x: -10000; scale-x: -10000; }
        frame 30 { x: 28.2; scale-x: 0.797; }
        frame 31 { x: 27.9; scale-x: 0.812; }
        frame 32 { x: 27.7; scale-x: 0.827; }
        frame 33 { x: 27.4; scale-x: 0.841; }
        frame 34 { x: 27.2; scale-x: 0.856; }
        frame 35 { x: 26.9; scale-x: 0.881; }
        frame 36 { x: 26.4; scale-x: 0.906; }
        frame 37 { x: 26; scale-x: 0.931; }
        frame 38 { x: 26.4; scale-x: 0.901; }
        frame 39 { x: 27; scale-x: 0.872; }
        frame 40 { x: 27.5; scale-x: 0.842; }
        frame 41 { x: 28; scale-x: 0.812; }
        frame 42 { x: 28.4; scale-x: 0.783; }
        frame 43 { x: -10000; scale-x: -10000; }
        frame 44 { x: 28.3; scale-x: 0.79; }
        frame 45 { x: 28.2; scale-x: 0.796; }
        frame 46 { x: 28.1; scale-x: 0.803; }
        frame 47 { x: 27.9; scale-x: 0.81; }
        frame 48 { x: 27.8; scale-x: 0.817; }
        frame 49 { x: -10000; scale-x: 0.823; }
        frame 50 { scale-x: 0.817; }
        frame 51 { x: 28; scale-x: 0.81; }
        frame 52 { x: 28.1; scale-x: 0.803; }
        frame 53 { x: 28.3; scale-x: 0.796; }
        frame 54 { x: -10000; scale-x: 0.79; }
        frame 55 { x: 28.4; scale-x: 0.783; }
        frame 56 { x: 28.5; scale-x: 0.773; }
        frame 57 { x: 28.7; scale-x: 0.764; }
        frame 58 { x: 28.9; scale-x: 0.754; }
        frame 59 { x: 29; scale-x: 0.744; }
        frame 60 { x: 29.1; scale-x: 0.735; }
        frame 61 { x: 29.3; scale-x: 0.725; }
        frame 62 { x: 29.2; scale-x: 0.735; }
        frame 63 { x: 29.1; scale-x: 0.744; }
        frame 64 { x: 29; scale-x: 0.754; }
        frame 65 { x: 28.8; scale-x: 0.764; }
        frame 66 { x: 28.6; scale-x: 0.773; }
        frame 67 { x: 28.4; scale-x: 0.783; }
        frame 68 { x: -10000; scale-x: -10000; cel: -1; }
        frame 69 { cel: -10000; }
    }
    Track {
        source-name: "SeaShroom_head";
        frame-count: 93;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 21; y: 20.9; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_SEASHROOM_HEAD; }
        frame 5 { x: 20.9; y: 21.4; scale-x: 0.705; scale-y: 0.693; cel: -10000; image: none; }
        frame 6 { x: 20.7; y: 21.7; scale-x: 0.71; scale-y: 0.685; }
        frame 7 { x: 20.6; y: 22.2; scale-x: 0.715; scale-y: 0.678; }
        frame 8 { x: 20.5; y: 22.6; scale-x: 0.72; scale-y: 0.671; }
        frame 9 { x: 20.3; y: 23; scale-x: 0.725; scale-y: 0.663; }
        frame 10 { x: 20.2; y: 23.4; scale-x: 0.73; scale-y: 0.656; }
        frame 11 { x: 19.8; y: 24.1; scale-x: 0.746; scale-y: 0.64; }
        frame 12 { x: 19.3; y: 24.7; scale-x: 0.763; scale-y: 0.625; }
        frame 13 { x: 19.7; y: 23.8; scale-x: 0.747; scale-y: 0.644; }
        frame 14 { x: 20.2; y: 22.9; scale-x: 0.731; scale-y: 0.663; }
        frame 15 { x: 20.6; y: 22.1; scale-x: 0.716; scale-y: 0.681; }
        frame 16 { x: 21; y: 21.2; scale-x: 0.7; scale-y: 0.7; }
        frame 17 { x: 21.2; y: 20.9; scale-x: 0.694; scale-y: -10000; }
        frame 18 { x: 21.3; y: 20.7; scale-x: 0.688; }
        frame 19 { x: 21.5; y: 20.4; scale-x: 0.682; }
        frame 20 { x: 21.7; y: 20.2; scale-x: 0.677; }
        frame 21 { x: 21.9; y: 19.9; scale-x: 0.671; }
        frame 22 { x: 22; y: 19.7; scale-x: 0.665; }
        frame 23 { x: 22.2; y: 19.1; scale-x: 0.66; scale-y: 0.731; }
        frame 24 { x: 22.3; y: 18.5; scale-x: 0.655; scale-y: 0.763; }
        frame 25 { x: 22; y: 19.1; scale-x: 0.666; scale-y: 0.747; }
        frame 26 { x: 21.7; y: 19.7; scale-x: 0.678; scale-y: 0.731; }
        frame 27 { x: 21.3; y: 20.4; scale-x: 0.689; scale-y: 0.716; }
        frame 28 { x: 21; y: 20.9; scale-x: 0.7; scale-y: 0.7; }
        frame 29 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 20.8; y: 19.5; skew-x: -0; skew-y: -0; scale-x: 0.709; scale-y: 0.726; }
        frame 31 { x: 20.5; y: 18.2; skew-x: -0.2; skew-y: -0.2; scale-x: 0.719; scale-y: 0.751; }
        frame 32 { x: 20.3; y: 16.8; skew-x: -0.4; skew-y: -0.4; scale-x: 0.728; scale-y: 0.777; }
        frame 33 { x: 20.1; y: 15.4; skew-x: -0.7; skew-y: -0.7; scale-x: 0.738; scale-y: 0.803; }
        frame 34 { x: 19.8; y: 14.3; skew-x: -0.9; skew-y: -0.9; scale-x: 0.747; scale-y: 0.829; }
        frame 35 { x: 20.2; y: 18.4; skew-x: -0.4; skew-y: -0.5; scale-x: 0.752; scale-y: 0.746; }
        frame 36 { x: 20.5; y: 22.7; skew-x: -0.2; skew-y: -0.2; scale-x: 0.756; scale-y: 0.664; }
        frame 37 { x: 20.9; y: 26.9; skew-x: 0; skew-y: 0; scale-x: 0.76; scale-y: 0.582; }
        frame 38 { x: 21.1; y: 26.7; skew-x: -10000; skew-y: -10000; scale-x: 0.742; scale-y: 0.569; }
        frame 39 { x: 21.4; y: -10000; scale-x: 0.724; scale-y: 0.556; }
        frame 40 { x: 21.2; y: 24.8; scale-x: 0.716; scale-y: 0.604; }
        frame 41 { x: -10000; y: 22.9; scale-x: 0.708; scale-y: 0.652; }
        frame 42 { x: 21; y: 20.9; scale-x: 0.7; scale-y: 0.7; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 20.9; y: 21.4; scale-x: 0.705; scale-y: 0.693; }
        frame 45 { x: 20.7; y: 21.7; scale-x: 0.71; scale-y: 0.685; }
        frame 46 { x: 20.6; y: 22.2; scale-x: 0.715; scale-y: 0.678; }
        frame 47 { x: 20.5; y: 22.6; scale-x: 0.72; scale-y: 0.671; }
        frame 48 { x: 20.3; y: 23; scale-x: 0.725; scale-y: 0.663; }
        frame 49 { x: 20.2; y: 23.4; scale-x: 0.73; scale-y: 0.656; }
        frame 50 { x: 19.8; y: 24.1; scale-x: 0.746; scale-y: 0.64; }
        frame 51 { x: 19.3; y: 24.7; scale-x: 0.763; scale-y: 0.625; }
        frame 52 { x: 19.7; y: 23.8; scale-x: 0.747; scale-y: 0.644; }
        frame 53 { x: 20.2; y: 22.9; scale-x: 0.731; scale-y: 0.663; }
        frame 54 { x: 20.6; y: 22.1; scale-x: 0.716; scale-y: 0.681; }
        frame 55 { x: 21; y: 21.2; scale-x: 0.7; scale-y: 0.7; }
        frame 56 { x: 21.2; y: 20.9; scale-x: 0.694; scale-y: -10000; }
        frame 57 { x: 21.3; y: 20.7; scale-x: 0.688; }
        frame 58 { x: 21.5; y: 20.4; scale-x: 0.682; }
        frame 59 { x: 21.7; y: 20.2; scale-x: 0.677; }
        frame 60 { x: 21.9; y: 19.9; scale-x: 0.671; }
        frame 61 { x: 22; y: 19.7; scale-x: 0.665; }
        frame 62 { x: 22.2; y: 19.1; scale-x: 0.66; scale-y: 0.731; }
        frame 63 { x: 22.3; y: 18.5; scale-x: 0.655; scale-y: 0.763; }
        frame 64 { x: 22; y: 19.1; scale-x: 0.666; scale-y: 0.747; }
        frame 65 { x: 21.7; y: 19.7; scale-x: 0.678; scale-y: 0.731; }
        frame 66 { x: 21.3; y: 20.4; scale-x: 0.689; scale-y: 0.716; }
        frame 67 { x: 21; y: 20.9; scale-x: 0.7; scale-y: 0.7; }
        frame 68 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 20.9; y: 21.4; scale-x: 0.705; scale-y: 0.693; }
        frame 70 { x: 20.7; y: 21.7; scale-x: 0.71; scale-y: 0.685; }
        frame 71 { x: 20.6; y: 22.2; scale-x: 0.715; scale-y: 0.678; }
        frame 72 { x: 20.5; y: 22.6; scale-x: 0.72; scale-y: 0.671; }
        frame 73 { x: 20.3; y: 23; scale-x: 0.725; scale-y: 0.663; }
        frame 74 { x: 20.2; y: 23.4; scale-x: 0.73; scale-y: 0.656; }
        frame 75 { x: 19.8; y: 24.1; scale-x: 0.746; scale-y: 0.64; }
        frame 76 { x: 19.3; y: 24.7; scale-x: 0.763; scale-y: 0.625; }
        frame 77 { x: 19.7; y: 23.8; scale-x: 0.747; scale-y: 0.644; }
        frame 78 { x: 20.2; y: 22.9; scale-x: 0.731; scale-y: 0.663; }
        frame 79 { x: 20.6; y: 22.1; scale-x: 0.716; scale-y: 0.681; }
        frame 80 { x: 21; y: 21.2; scale-x: 0.7; scale-y: 0.7; }
        frame 81 { x: 21.2; y: 20.9; scale-x: 0.694; scale-y: -10000; }
        frame 82 { x: 21.3; y: 20.7; scale-x: 0.688; }
        frame 83 { x: 21.5; y: 20.4; scale-x: 0.682; }
        frame 84 { x: 21.7; y: 20.2; scale-x: 0.677; }
        frame 85 { x: 21.9; y: 19.9; scale-x: 0.671; }
        frame 86 { x: 22; y: 19.7; scale-x: 0.665; }
        frame 87 { x: 22.2; y: 19.1; scale-x: 0.66; scale-y: 0.731; }
        frame 88 { x: 22.3; y: 18.5; scale-x: 0.655; scale-y: 0.763; }
        frame 89 { x: 22; y: 19.1; scale-x: 0.666; scale-y: 0.747; }
        frame 90 { x: 21.7; y: 19.7; scale-x: 0.678; scale-y: 0.731; }
        frame 91 { x: 21.3; y: 20.4; scale-x: 0.689; scale-y: 0.716; }
        frame 92 { x: 21; y: 20.9; scale-x: 0.7; scale-y: 0.7; }
    }
    Track {
        source-name: "SeahShroom_mouth";
        frame-count: 93;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 52; y: 42.3; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_SEASHROOM_MOUTH; }
        frame 5 { x: -10000; y: -10000; skew-x: 1.3; scale-x: 0.701; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 52.1; skew-x: 2.5; scale-x: 0.702; }
        frame 7 { x: 52.3; y: 42.4; skew-x: 3.8; scale-x: 0.703; }
        frame 8 { x: 52.4; y: 42.5; skew-x: 5; scale-x: 0.704; }
        frame 9 { x: -10000; y: -10000; skew-x: 6.3; scale-x: 0.705; }
        frame 10 { x: 52.5; skew-x: 7.7; scale-x: 0.706; }
        frame 11 { x: 52.4; skew-x: 6.3; scale-x: 0.705; }
        frame 12 { x: 52.3; skew-x: 5; scale-x: 0.704; }
        frame 13 { x: 52.1; y: 42.4; skew-x: 3.8; scale-x: 0.703; }
        frame 14 { x: 52; y: -10000; skew-x: 2.5; scale-x: 0.702; }
        frame 15 { x: 51.9; y: 42.3; skew-x: 1.3; scale-x: 0.701; }
        frame 16 { x: 51.8; y: -10000; skew-x: 0; scale-x: 0.7; }
        frame 17 { x: 51.6; y: 42; skew-x: -0.7; scale-x: -10000; }
        frame 18 { x: 51.7; y: 41.8; skew-x: -1.4; scale-x: 0.701; }
        frame 19 { x: 51.6; y: 41.5; skew-x: -2.2; scale-x: -10000; }
        frame 20 { x: -10000; y: 41.2; skew-x: -3; scale-x: 0.702; }
        frame 21 { y: 41; skew-x: -3.9; scale-x: -10000; }
        frame 22 { x: 51.5; y: 40.8; skew-x: -4.7; scale-x: 0.703; }
        frame 23 { x: 51.6; y: 41; skew-x: -3.9; scale-x: 0.702; }
        frame 24 { x: 51.7; y: 41.3; skew-x: -3; scale-x: -10000; }
        frame 25 { x: 51.8; y: 41.5; skew-x: -2.2; scale-x: 0.701; }
        frame 26 { x: 51.9; y: 41.8; skew-x: -1.4; scale-x: -10000; }
        frame 27 { x: -10000; y: 42; skew-x: -0.7; scale-x: 0.7; }
        frame 28 { x: 52; y: 42.3; skew-x: 0; scale-x: -10000; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; }
        frame 30 { x: 52.5; y: 41.9; scale-x: 0.636; }
        frame 31 { x: 53; y: 41.6; scale-x: 0.572; }
        frame 32 { x: 53.6; y: 41.3; scale-x: 0.508; }
        frame 33 { x: 54.1; y: 41; scale-x: 0.444; }
        frame 34 { x: 54.7; y: 40.6; scale-x: 0.38; }
        frame 35 { x: 54.4; y: 41.5; scale-x: 0.834; }
        frame 36 { x: 54; y: 42.3; scale-x: 1.289; }
        frame 37 { x: 53.7; y: 43.1; scale-x: 1.744; }
        frame 38 { x: 53.4; y: 43; scale-x: 1.535; }
        frame 39 { x: 53; y: 42.8; scale-x: 1.326; }
        frame 40 { x: 52.7; y: 42.6; scale-x: 1.117; }
        frame 41 { x: 52.4; y: 42.4; scale-x: 0.909; }
        frame 42 { x: 52; y: 42.3; scale-x: 0.7; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; }
        frame 44 { skew-x: 1.3; scale-x: 0.701; }
        frame 45 { x: 52.1; skew-x: 2.5; scale-x: 0.702; }
        frame 46 { x: 52.3; y: 42.4; skew-x: 3.8; scale-x: 0.703; }
        frame 47 { x: 52.4; y: 42.5; skew-x: 5; scale-x: 0.704; }
        frame 48 { x: -10000; y: -10000; skew-x: 6.3; scale-x: 0.705; }
        frame 49 { x: 52.5; skew-x: 7.7; scale-x: 0.706; }
        frame 50 { x: 52.4; skew-x: 6.3; scale-x: 0.705; }
        frame 51 { x: 52.3; skew-x: 5; scale-x: 0.704; }
        frame 52 { x: 52.1; y: 42.4; skew-x: 3.8; scale-x: 0.703; }
        frame 53 { x: 52; y: -10000; skew-x: 2.5; scale-x: 0.702; }
        frame 54 { x: 51.9; y: 42.3; skew-x: 1.3; scale-x: 0.701; }
        frame 55 { x: 51.8; y: -10000; skew-x: 0; scale-x: 0.7; }
        frame 56 { x: 51.6; y: 42; skew-x: -0.7; scale-x: -10000; }
        frame 57 { x: 51.7; y: 41.8; skew-x: -1.4; scale-x: 0.701; }
        frame 58 { x: 51.6; y: 41.5; skew-x: -2.2; scale-x: -10000; }
        frame 59 { x: -10000; y: 41.2; skew-x: -3; scale-x: 0.702; }
        frame 60 { y: 41; skew-x: -3.9; scale-x: -10000; }
        frame 61 { x: 51.5; y: 40.8; skew-x: -4.7; scale-x: 0.703; }
        frame 62 { x: 51.6; y: 41; skew-x: -3.9; scale-x: 0.702; }
        frame 63 { x: 51.7; y: 41.3; skew-x: -3; scale-x: -10000; }
        frame 64 { x: 51.8; y: 41.5; skew-x: -2.2; scale-x: 0.701; }
        frame 65 { x: 51.9; y: 41.8; skew-x: -1.4; scale-x: -10000; }
        frame 66 { x: -10000; y: 42; skew-x: -0.7; scale-x: 0.7; }
        frame 67 { x: 52; y: 42.3; skew-x: 0; scale-x: -10000; }
        frame 68 { x: -10000; y: -10000; skew-x: -10000; }
        frame 69 { skew-x: 1.3; scale-x: 0.701; }
        frame 70 { x: 52.1; skew-x: 2.5; scale-x: 0.702; }
        frame 71 { x: 52.3; y: 42.4; skew-x: 3.8; scale-x: 0.703; }
        frame 72 { x: 52.4; y: 42.5; skew-x: 5; scale-x: 0.704; }
        frame 73 { x: -10000; y: -10000; skew-x: 6.3; scale-x: 0.705; }
        frame 74 { x: 52.5; skew-x: 7.7; scale-x: 0.706; }
        frame 75 { x: 52.4; skew-x: 6.3; scale-x: 0.705; }
        frame 76 { x: 52.3; skew-x: 5; scale-x: 0.704; }
        frame 77 { x: 52.1; y: 42.4; skew-x: 3.8; scale-x: 0.703; }
        frame 78 { x: 52; y: -10000; skew-x: 2.5; scale-x: 0.702; }
        frame 79 { x: 51.9; y: 42.3; skew-x: 1.3; scale-x: 0.701; }
        frame 80 { x: 51.8; y: -10000; skew-x: 0; scale-x: 0.7; }
        frame 81 { x: 51.6; y: 42; skew-x: -0.7; scale-x: -10000; }
        frame 82 { x: 51.7; y: 41.8; skew-x: -1.4; scale-x: 0.701; }
        frame 83 { x: 51.6; y: 41.5; skew-x: -2.2; scale-x: -10000; }
        frame 84 { x: -10000; y: 41.2; skew-x: -3; scale-x: 0.702; }
        frame 85 { y: 41; skew-x: -3.9; scale-x: -10000; }
        frame 86 { x: 51.5; y: 40.8; skew-x: -4.7; scale-x: 0.703; }
        frame 87 { x: 51.6; y: 41; skew-x: -3.9; scale-x: 0.702; }
        frame 88 { x: 51.7; y: 41.3; skew-x: -3; scale-x: -10000; }
        frame 89 { x: 51.8; y: 41.5; skew-x: -2.2; scale-x: 0.701; }
        frame 90 { x: 51.9; y: 41.8; skew-x: -1.4; scale-x: -10000; }
        frame 91 { x: -10000; y: 42; skew-x: -0.7; scale-x: 0.7; }
        frame 92 { x: 52; y: 42.3; skew-x: 0; scale-x: -10000; }
    }
    Track {
        source-name: "SeaShroom_lips";
        frame-count: 93;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 55.8; y: 40.3; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_SEASHROOM_LIPS; }
        frame 5 { x: 56; y: 40.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { y: 40.6; }
        frame 7 { x: 56.2; y: 40.9; }
        frame 8 { x: 56.3; y: 41; }
        frame 9 { x: 56.5; y: 41.3; }
        frame 10 { x: -10000; y: 41.5; }
        frame 11 { x: 56.9; y: 41.4; skew-x: 6; skew-y: 2.5; scale-x: 0.702; }
        frame 12 { x: 57.3; y: 41.3; skew-x: 12.2; skew-y: 5; scale-x: 0.705; }
        frame 13 { x: 57.1; y: 41; skew-x: 9; skew-y: 3.8; scale-x: 0.704; }
        frame 14 { x: 57; y: 40.8; skew-x: 6; skew-y: 2.5; scale-x: 0.702; }
        frame 15 { x: 56.8; y: 40.5; skew-x: 3; skew-y: 1.3; scale-x: 0.701; }
        frame 16 { x: 56.5; y: 40.3; skew-x: 0; skew-y: 0; scale-x: 0.7; }
        frame 17 { x: -10000; y: 40; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 18 { x: 56.4; y: 39.6; }
        frame 19 { x: 56.3; y: 39.3; }
        frame 20 { x: 56.2; y: 39; }
        frame 21 { x: 56.1; y: 38.6; }
        frame 22 { x: 56; y: 38.3; }
        frame 23 { x: 56.1; y: 38.2; skew-x: -0.4; skew-y: -0.4; }
        frame 24 { x: 56.3; y: 38.1; skew-x: -1; skew-y: -1; }
        frame 25 { x: 56.1; y: 38.7; skew-x: -0.7; skew-y: -0.7; }
        frame 26 { x: 56; y: 39.2; skew-x: -0.4; skew-y: -0.4; }
        frame 27 { y: 39.8; skew-x: -0.2; skew-y: -0.2; }
        frame 28 { x: 55.8; y: 40.3; skew-x: 0; skew-y: 0; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 56; y: 39.6; scale-y: 0.739; }
        frame 31 { x: 56.3; y: 39; scale-y: 0.778; }
        frame 32 { x: 56.5; y: 38.4; scale-y: 0.817; }
        frame 33 { x: 56.8; y: 37.7; scale-y: 0.856; }
        frame 34 { x: 57; y: 37.1; scale-y: 0.896; }
        frame 35 { x: 59.5; y: 39; scale-y: 0.784; }
        frame 36 { x: 61.9; y: 40.9; scale-y: 0.673; }
        frame 37 { x: 64.3; y: 42.8; scale-y: 0.561; }
        frame 38 { x: 62.6; y: 42.3; scale-y: 0.589; }
        frame 39 { x: 61; y: 41.7; scale-y: 0.617; }
        frame 40 { x: 59.2; y: 41.3; scale-y: 0.644; }
        frame 41 { x: 57.5; y: 40.7; scale-y: 0.672; }
        frame 42 { x: 55.8; y: 40.3; scale-y: 0.7; }
        frame 43 { x: -10000; y: -10000; scale-y: -10000; }
        frame 44 { x: 56; y: 40.5; }
        frame 45 { y: 40.6; }
        frame 46 { x: 56.2; y: 40.9; }
        frame 47 { x: 56.3; y: 41; }
        frame 48 { x: 56.5; y: 41.3; }
        frame 49 { x: -10000; y: 41.5; }
        frame 50 { x: 56.9; y: 41.4; skew-x: 6; skew-y: 2.5; scale-x: 0.702; }
        frame 51 { x: 57.3; y: 41.3; skew-x: 12.2; skew-y: 5; scale-x: 0.705; }
        frame 52 { x: 57.1; y: 41; skew-x: 9; skew-y: 3.8; scale-x: 0.704; }
        frame 53 { x: 57; y: 40.8; skew-x: 6; skew-y: 2.5; scale-x: 0.702; }
        frame 54 { x: 56.8; y: 40.5; skew-x: 3; skew-y: 1.3; scale-x: 0.701; }
        frame 55 { x: 56.5; y: 40.3; skew-x: 0; skew-y: 0; scale-x: 0.7; }
        frame 56 { x: -10000; y: 40; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 57 { x: 56.4; y: 39.6; }
        frame 58 { x: 56.3; y: 39.3; }
        frame 59 { x: 56.2; y: 39; }
        frame 60 { x: 56.1; y: 38.6; }
        frame 61 { x: 56; y: 38.3; }
        frame 62 { x: 56.1; y: 38.2; skew-x: -0.4; skew-y: -0.4; }
        frame 63 { x: 56.3; y: 38.1; skew-x: -1; skew-y: -1; }
        frame 64 { x: 56.1; y: 38.7; skew-x: -0.7; skew-y: -0.7; }
        frame 65 { x: 56; y: 39.2; skew-x: -0.4; skew-y: -0.4; }
        frame 66 { y: 39.8; skew-x: -0.2; skew-y: -0.2; }
        frame 67 { x: 55.8; y: 40.3; skew-x: 0; skew-y: 0; }
        frame 68 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 69 { x: 56; y: 40.5; }
        frame 70 { y: 40.6; }
        frame 71 { x: 56.2; y: 40.9; }
        frame 72 { x: 56.3; y: 41; }
        frame 73 { x: 56.5; y: 41.3; }
        frame 74 { x: -10000; y: 41.5; }
        frame 75 { x: 56.9; y: 41.4; skew-x: 6; skew-y: 2.5; scale-x: 0.702; }
        frame 76 { x: 57.3; y: 41.3; skew-x: 12.2; skew-y: 5; scale-x: 0.705; }
        frame 77 { x: 57.1; y: 41; skew-x: 9; skew-y: 3.8; scale-x: 0.704; }
        frame 78 { x: 57; y: 40.8; skew-x: 6; skew-y: 2.5; scale-x: 0.702; }
        frame 79 { x: 56.8; y: 40.5; skew-x: 3; skew-y: 1.3; scale-x: 0.701; }
        frame 80 { x: 56.5; y: 40.3; skew-x: 0; skew-y: 0; scale-x: 0.7; }
        frame 81 { x: -10000; y: 40; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 82 { x: 56.4; y: 39.6; }
        frame 83 { x: 56.3; y: 39.3; }
        frame 84 { x: 56.2; y: 39; }
        frame 85 { x: 56.1; y: 38.6; }
        frame 86 { x: 56; y: 38.3; }
        frame 87 { x: 56.1; y: 38.2; skew-x: -0.4; skew-y: -0.4; }
        frame 88 { x: 56.3; y: 38.1; skew-x: -1; skew-y: -1; }
        frame 89 { x: 56.1; y: 38.7; skew-x: -0.7; skew-y: -0.7; }
        frame 90 { x: 56; y: 39.2; skew-x: -0.4; skew-y: -0.4; }
        frame 91 { y: 39.8; skew-x: -0.2; skew-y: -0.2; }
        frame 92 { x: 55.8; y: 40.3; skew-x: 0; skew-y: 0; }
    }
}
