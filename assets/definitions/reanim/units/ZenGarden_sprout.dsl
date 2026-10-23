export component ZenGarden_sprout {
    fps: 12;
    Track {
        source-name: "anim_sprout";
        frame-count: 60;
        frame 0 { x: 34.9; y: 42.2; }
        frame 1 { x: -10000; y: -10000; }
        frame 10 { cel: -1; }
        frame 11 { cel: -10000; }
    }
    Track {
        source-name: "anim_flower";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 10 { x: 34.9; y: 42.2; cel: 0; }
        frame 11 { x: -10000; y: -10000; cel: -10000; }
        frame 18 { cel: -1; }
        frame 19 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 18 { x: 34.9; y: 42.2; cel: 0; }
        frame 19 { x: -10000; y: -10000; cel: -10000; }
        frame 39 { cel: -1; }
        frame 40 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle_noflower";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 39 { x: 34.9; y: 42.2; cel: 0; }
        frame 40 { x: -10000; y: -10000; cel: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 40; y: 64.8; skew-x: 15; skew-y: 15; scale-x: 0.2; scale-y: 0.2; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
    }
    Track {
        source-name: "sprout";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 39; y: 67.7; scale-x: 0.134; scale-y: 0.025; cel: 0; image: IMAGE_REANIM_SPROUT_BODY; }
        frame 5 { x: 36.4; y: 59.3; scale-x: 0.452; scale-y: 0.304; cel: -10000; image: none; }
        frame 6 { x: 35.6; y: 49.7; scale-x: 0.569; scale-y: 0.624; }
        frame 7 { x: 35.7; y: 40.7; scale-x: 0.582; scale-y: 0.924; }
        frame 8 { x: 33.2; y: 46; scale-x: 0.8; scale-y: 0.772; }
        frame 9 { x: 33.3; y: 46.4; scale-x: -10000; scale-y: 0.763; }
        frame 10 { x: 33.2; y: 46.6; scale-y: 0.753; }
        frame 11 { x: -10000; y: -10000; scale-y: -10000; }
        frame 19 { x: 33.9; y: 47; skew-y: 1.8; scale-y: 0.744; }
        frame 20 { x: 34.7; y: 47.3; skew-y: 3.5; scale-y: 0.735; }
        frame 21 { x: 35.4; y: 47.8; skew-y: 5.5; scale-y: 0.726; }
        frame 22 { x: 36.1; y: 48; skew-y: 7.3; scale-y: 0.716; }
        frame 23 { x: 36.9; y: 48.4; skew-y: 9.2; scale-y: 0.708; }
        frame 24 { x: 36.1; y: 48; skew-y: 7.3; scale-y: 0.716; }
        frame 25 { x: 35.4; y: 47.6; skew-y: 5.5; scale-y: 0.726; }
        frame 26 { x: 34.6; y: 47.3; skew-y: 3.5; scale-y: 0.735; }
        frame 27 { x: 33.9; y: 47; skew-y: 1.8; scale-y: 0.744; }
        frame 28 { x: 33.2; y: 46.6; skew-y: 0; scale-y: 0.753; }
        frame 29 { x: 32.5; y: 47.3; skew-y: -1.7; scale-y: 0.738; }
        frame 30 { x: 31.8; y: 47.8; skew-y: -3.4; scale-y: 0.723; }
        frame 31 { x: 31.1; y: 48.3; skew-y: -5.2; scale-y: 0.707; }
        frame 32 { x: 30.4; y: 48.9; skew-y: -7; scale-y: 0.692; }
        frame 33 { x: 29.8; y: 49.4; skew-y: -8.9; scale-y: 0.677; }
        frame 34 { x: 30.4; y: 48.9; skew-y: -7; scale-y: 0.692; }
        frame 35 { x: 31.1; y: 48.3; skew-y: -5.2; scale-y: 0.707; }
        frame 36 { x: 31.8; y: 47.7; skew-y: -3.4; scale-y: 0.723; }
        frame 37 { x: 32.5; y: 47.2; skew-y: -1.7; scale-y: 0.738; }
        frame 38 { x: 33.2; y: 46.6; skew-y: 0; scale-y: 0.753; }
        frame 39 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 40 { cel: -10000; }
    }
    Track {
        source-name: "Layer 26";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 39 { x: 33.3; y: 46.5; scale-x: 0.8; scale-y: 0.753; cel: 0; image: IMAGE_REANIM_SPROUT_BODY1; }
        frame 40 { x: 32.4; y: 47; skew-x: -0.5; skew-y: -2.4; scale-x: 0.799; scale-y: 0.748; cel: -10000; image: none; }
        frame 41 { x: 31.4; y: 47.4; skew-x: -1.2; skew-y: -5.2; scale-x: 0.797; scale-y: 0.744; }
        frame 42 { x: 30.5; y: 47.8; skew-x: -1.9; skew-y: -7.9; scale-x: 0.796; scale-y: 0.739; }
        frame 43 { x: 29.5; y: 48.3; skew-x: -2.7; skew-y: -10.7; scale-x: 0.795; scale-y: 0.734; }
        frame 44 { x: 28.5; y: 48.9; skew-x: -3.5; skew-y: -13.3; scale-x: 0.793; scale-y: 0.73; }
        frame 45 { x: 29.6; y: 48.4; skew-x: -2.7; skew-y: -10.5; scale-x: 0.794; scale-y: 0.734; }
        frame 46 { x: 30.4; y: 47.9; skew-x: -1.9; skew-y: -7.9; scale-x: 0.796; scale-y: 0.739; }
        frame 47 { x: 31.3; y: 47.4; skew-x: -1.2; skew-y: -5.2; scale-x: 0.797; scale-y: 0.743; }
        frame 48 { x: 32.3; y: 46.9; skew-x: -0.4; skew-y: -2.4; scale-x: 0.799; scale-y: 0.748; }
        frame 49 { x: 33.3; y: 46.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.753; }
        frame 50 { x: 33.9; y: 47.1; skew-x: 0.3; skew-y: 1.3; scale-x: -10000; scale-y: 0.734; }
        frame 51 { x: 34.4; y: 47.6; skew-x: 0.5; skew-y: 2.8; scale-x: 0.799; scale-y: 0.716; }
        frame 52 { x: 34.9; y: 48.4; skew-x: 1; skew-y: 4.1; scale-x: -10000; scale-y: 0.697; }
        frame 53 { x: 35.5; y: 48.9; skew-x: 1.3; skew-y: 5.5; scale-x: 0.798; scale-y: 0.679; }
        frame 54 { x: 35.8; y: 49.5; skew-x: 1.7; skew-y: 7; scale-x: -10000; scale-y: 0.66; }
        frame 55 { x: 35.2; y: 49; skew-x: 1.3; skew-y: 5.5; scale-y: 0.679; }
        frame 56 { x: 34.6; y: 48.5; skew-x: 1; skew-y: 4.1; scale-x: 0.799; scale-y: 0.697; }
        frame 57 { x: 34.1; y: 47.9; skew-x: 0.5; skew-y: 2.6; scale-x: -10000; scale-y: 0.716; }
        frame 58 { x: 33.6; y: 47.3; skew-x: 0.3; skew-y: 1.3; scale-x: 0.8; scale-y: 0.734; }
        frame 59 { x: 33.3; y: 46.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.753; }
    }
    Track {
        source-name: "Layer 27";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 39 { x: 36.4; y: 47; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SPROUT_BODY2; }
        frame 40 { x: 35; y: 48; skew-x: -5.2; skew-y: -6; scale-x: 0.79; scale-y: 0.802; cel: -10000; image: none; }
        frame 41 { x: 33.6; y: 49.1; skew-x: -10.7; skew-y: -12.2; scale-x: 0.779; scale-y: 0.804; }
        frame 42 { x: 32.5; y: 50.3; skew-x: -16; skew-y: -18.5; scale-x: 0.769; scale-y: 0.806; }
        frame 43 { x: 31.2; y: 51.5; skew-x: -21.5; skew-y: -24.7; scale-x: 0.758; scale-y: 0.809; }
        frame 44 { x: 30; y: 52.8; skew-x: -26.9; skew-y: -31.1; scale-x: 0.749; scale-y: 0.812; }
        frame 45 { x: 30.4; y: 51.9; skew-x: -21.4; skew-y: -28.2; scale-x: 0.758; scale-y: 0.813; }
        frame 46 { x: 31; y: 50.9; skew-x: -16; skew-y: -25.4; scale-x: 0.769; scale-y: 0.817; }
        frame 47 { x: 32.6; y: 49.4; skew-x: -10.5; skew-y: -16.7; scale-x: 0.779; scale-y: 0.81; }
        frame 48 { x: 34.5; y: 48.2; skew-x: -5.2; skew-y: -8.2; scale-x: 0.789; scale-y: 0.805; }
        frame 49 { x: 36.4; y: 47; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: 37.4; y: 47.4; skew-x: 0.8; skew-y: 3.8; scale-x: 0.801; scale-y: 0.797; }
        frame 51 { x: 38.5; y: 48; skew-x: 1.8; skew-y: 7.5; scale-x: 0.803; scale-y: 0.794; }
        frame 52 { x: 39.4; y: 48.6; skew-x: 2.8; skew-y: 11.3; scale-x: 0.804; scale-y: 0.791; }
        frame 53 { x: 40.5; y: 49.1; skew-x: 3.8; skew-y: 15; scale-x: 0.806; scale-y: 0.788; }
        frame 54 { x: 41.6; y: 49.8; skew-x: 4.9; skew-y: 18.9; scale-x: 0.807; scale-y: 0.786; }
        frame 55 { x: 42; y: 49.5; skew-x: 6.1; skew-y: 22.6; scale-x: 0.806; scale-y: 0.811; }
        frame 56 { x: 42.4; y: 49; skew-x: 7.5; skew-y: 26.6; scale-x: 0.804; scale-y: 0.837; }
        frame 57 { x: 40.5; y: 48.3; skew-x: 5; skew-y: 17.6; scale-x: 0.803; scale-y: 0.824; }
        frame 58 { x: 38.5; y: 47.5; skew-x: 2.5; skew-y: 8.8; scale-x: 0.801; scale-y: 0.812; }
        frame 59 { x: 36.4; y: 47; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "rock";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { x: 38.1; y: 65.9; skew-x: 15; skew-y: 15; scale-x: 0.128; scale-y: 0.137; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 2 { x: 36.6; y: 65.5; skew-x: 0; skew-y: 0; scale-x: 0.185; scale-y: 0.191; cel: -10000; image: none; }
        frame 3 { x: 35; y: 65.6; skew-x: -14.7; skew-y: -14.7; scale-x: 0.243; scale-y: 0.245; }
        frame 4 { x: 33.5; y: 65.9; skew-x: -29.9; skew-y: -29.9; scale-x: 0.3; scale-y: 0.3; }
        frame 5 { x: 32.3; y: 67.8; skew-x: -59.9; skew-y: -59.9; scale-x: 0.362; scale-y: 0.362; }
        frame 6 { x: 32.6; y: 69.8; skew-x: -89.9; skew-y: -89.9; scale-x: 0.424; scale-y: 0.424; }
        frame 7 { x: 33.1; y: 71; skew-x: -104.9; skew-y: -104.9; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 33.8; y: 71.8; skew-x: -119.9; skew-y: -119.9; }
        frame 9 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 6 { x: 40; y: 66.7; skew-x: -29.9; skew-y: -29.9; scale-x: 0.245; scale-y: 0.265; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 7 { x: 40.2; y: 66.1; skew-x: -19.9; skew-y: -19.9; scale-x: 0.29; scale-y: 0.296; cel: -10000; image: none; }
        frame 8 { x: 40.4; y: 65.5; skew-x: -9.9; skew-y: -9.9; scale-x: 0.336; scale-y: 0.327; }
        frame 9 { x: 40.9; y: 64.7; skew-x: 0; skew-y: 0; scale-x: 0.382; scale-y: 0.359; }
        frame 10 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { x: 36.8; y: 65.6; skew-x: 15; skew-y: 15; scale-x: 0.2; scale-y: 0.2; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 2 { x: 36.5; y: 65.8; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 3 { x: 36.3; y: 66.1; skew-x: -10000; skew-y: -10000; }
        frame 4 { x: 36; y: 66.3; skew-x: 15; skew-y: 15; }
        frame 5 { y: 66.2; skew-x: 14.8; skew-y: 14.8; }
        frame 6 { x: 35.8; y: 66; skew-x: 15; skew-y: 15; }
        frame 7 { x: 36; y: 66.3; skew-x: -10000; skew-y: -10000; }
        frame 8 { x: -10000; y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 40.9; y: 67.5; skew-x: 15; skew-y: 15; scale-x: 0.109; scale-y: 0.127; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 4 { x: 41.3; y: 67.1; skew-x: -10000; skew-y: -10000; scale-x: 0.2; scale-y: 0.2; cel: -10000; image: none; }
        frame 5 { x: 41.5; y: 66.8; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 41.6; y: 66.5; skew-x: 15; skew-y: 15; }
        frame 7 { x: 41.3; y: 67.1; skew-x: -10000; skew-y: -10000; }
        frame 8 { x: -10000; y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 2 { x: 38.9; y: 66.8; scale-x: 0.2; scale-y: 0.2; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK1; }
        frame 3 { x: 38; y: 66.9; skew-x: -18.7; skew-y: -18.7; scale-x: 0.288; scale-y: 0.288; cel: -10000; image: none; }
        frame 4 { x: 37.2; y: 67.5; skew-x: -37.5; skew-y: -37.5; scale-x: 0.377; scale-y: 0.377; }
        frame 5 { x: 36.6; y: 68.5; skew-x: -56.3; skew-y: -56.3; scale-x: 0.466; scale-y: 0.466; }
        frame 6 { x: 36.7; y: 69.8; skew-x: -74.9; skew-y: -74.9; scale-x: 0.555; scale-y: 0.555; }
        frame 7 { x: 37; y: 70.3; skew-x: -89.9; skew-y: -89.9; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 37.5; y: 70.6; skew-x: -104.9; skew-y: -104.9; }
        frame 9 { x: 37.3; y: 70.9; skew-x: -10000; skew-y: -10000; }
        frame 10 { x: 37; y: 71.1; }
        frame 11 { x: -10000; y: -10000; }
    }
    Track {
        source-name: "sprout_petal";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { x: 40; y: 46.7; skew-x: 84.5; skew-y: 82.5; scale-x: 0.035; scale-y: 0.027; cel: 0; image: IMAGE_REANIM_SPROUT_PETAL; }
        frame 12 { x: 40.2; y: 40.7; skew-x: -10000; skew-y: -10000; scale-x: 0.467; scale-y: 0.463; cel: -10000; image: none; }
        frame 13 { x: 40.3; y: 34.7; scale-x: 0.9; scale-y: 0.9; }
        frame 14 { x: 40.1; y: 35.2; skew-x: 84.7; scale-x: 0.85; scale-y: 0.85; }
        frame 15 { x: 39.9; y: 35.6; skew-x: 84.5; scale-x: 0.8; scale-y: 0.8; }
        frame 16 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 40.9; skew-x: 86.5; skew-y: 82.7; scale-x: 0.814; scale-y: 0.802; }
        frame 20 { x: 42; y: 35.5; skew-x: 88.2; skew-y: -10000; scale-x: 0.828; scale-y: 0.806; }
        frame 21 { x: 43.2; y: 36.4; skew-x: 90; skew-y: 83; scale-x: 0.799; scale-y: 0.808; }
        frame 22 { x: 44.1; y: 37.3; skew-x: 91.5; skew-y: 83.2; scale-x: 0.769; scale-y: 0.811; }
        frame 23 { x: 45.1; y: 38.1; skew-x: 93.3; skew-y: -10000; scale-x: 0.74; scale-y: 0.815; }
        frame 24 { x: 44; y: 37.9; skew-x: 91.5; scale-x: 0.734; scale-y: 0.811; }
        frame 25 { x: 43; y: 37.5; skew-x: 89.9; skew-y: 83; scale-x: 0.728; scale-y: 0.809; }
        frame 26 { x: 42; y: 36.8; skew-x: 88.2; skew-y: 82.9; scale-x: 0.752; scale-y: 0.805; }
        frame 27 { x: 41; y: 36.2; skew-x: 86.5; skew-y: 82.7; scale-x: 0.776; scale-y: 0.803; }
        frame 28 { x: 39.9; y: 35.6; skew-x: 84.5; skew-y: 82.5; scale-x: 0.8; scale-y: 0.8; }
        frame 29 { x: 38.8; y: -10000; skew-x: 83; skew-y: 82.7; scale-x: 0.816; scale-y: 0.796; }
        frame 30 { x: 37.8; skew-x: 81.2; skew-y: -10000; scale-x: 0.834; scale-y: 0.793; }
        frame 31 { x: 36.9; y: 37; skew-x: 79.2; skew-y: 83; scale-x: 0.799; scale-y: 0.79; }
        frame 32 { x: 35.8; y: 38.3; skew-x: 77.2; skew-y: 83.2; scale-x: 0.765; scale-y: 0.787; }
        frame 33 { x: 34.9; y: 39.5; skew-x: 75.1; skew-y: -10000; scale-x: 0.732; scale-y: 0.784; }
        frame 34 { x: 36; y: 38.8; skew-x: 77.2; skew-y: 83; scale-x: 0.728; scale-y: 0.787; }
        frame 35 { x: 36.9; y: 37.9; skew-x: 79.4; skew-y: 82.7; scale-x: 0.726; scale-y: 0.79; }
        frame 36 { x: 37.8; y: 37.1; skew-x: 81.2; skew-y: -10000; scale-x: 0.75; scale-y: 0.793; }
        frame 37 { x: 38.8; y: 36.4; skew-x: 83; scale-x: 0.775; scale-y: 0.796; }
        frame 38 { x: 39.9; y: 35.6; skew-x: 84.5; skew-y: 82.5; scale-x: 0.8; scale-y: 0.8; }
        frame 39 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 40 { cel: -10000; }
    }
    Track {
        source-name: "sprout_petal";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 40.8; y: 46.8; skew-x: 135; skew-y: -44.9; scale-x: 0.024; scale-y: 0.024; cel: 0; image: IMAGE_REANIM_SPROUT_PETAL; }
        frame 14 { x: 43.5; y: 41.8; skew-x: -10000; skew-y: -10000; scale-x: 0.462; scale-y: 0.462; cel: -10000; image: none; }
        frame 15 { x: 46.3; y: 36.9; scale-x: 0.9; scale-y: 0.9; }
        frame 16 { x: 46.1; y: 37.5; scale-x: 0.85; scale-y: 0.85; }
        frame 17 { x: 46; y: 38; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 46.6; skew-x: 133.6; skew-y: -44.3; scale-x: 0.807; scale-y: 0.782; }
        frame 20 { x: 47.2; y: 37.8; skew-x: 132.4; skew-y: -43.7; scale-x: 0.817; scale-y: 0.767; }
        frame 21 { x: 48.5; y: 38.6; skew-x: 135.4; skew-y: -43.3; scale-x: 0.822; scale-y: 0.747; }
        frame 22 { x: 49.6; y: 39.5; skew-x: 138.2; skew-y: -42.8; scale-x: 0.828; scale-y: 0.729; }
        frame 23 { x: 51; y: 40.3; skew-x: 141.1; skew-y: -42.4; scale-x: 0.836; scale-y: 0.711; }
        frame 24 { x: 50.3; y: 40.1; skew-x: 141.9; skew-y: -42.8; scale-x: 0.831; scale-y: 0.73; }
        frame 25 { x: 49.6; y: 39.9; skew-x: 142.8; skew-y: -43; scale-x: 0.829; scale-y: 0.751; }
        frame 26 { x: 48.4; y: 39.3; skew-x: 140.2; skew-y: -43.6; scale-x: 0.818; scale-y: 0.766; }
        frame 27 { x: 47.3; y: 38.6; skew-x: 137.6; skew-y: -44.3; scale-x: 0.808; scale-y: 0.782; }
        frame 28 { x: 46; y: 38; skew-x: 135; skew-y: -44.9; scale-x: 0.8; scale-y: 0.8; }
        frame 29 { x: 44.6; skew-x: 132.1; skew-y: -46; scale-x: 0.783; scale-y: 0.805; }
        frame 30 { x: 43.3; y: -10000; skew-x: 129.1; skew-y: -47.1; scale-x: 0.768; scale-y: 0.813; }
        frame 31 { x: 42.6; y: 39.2; skew-x: 130.6; skew-y: -48.8; scale-x: 0.744; scale-y: -10000; }
        frame 32 { x: 42; y: 40.5; skew-x: 132.4; skew-y: -50.3; scale-x: 0.721; scale-y: 0.815; }
        frame 33 { x: 41.3; y: 41.7; skew-x: 134; skew-y: -52; scale-x: 0.699; scale-y: 0.818; }
        frame 34 { x: 42.8; y: 40.9; skew-x: 136.4; skew-y: -48.5; scale-x: 0.726; scale-y: 0.815; }
        frame 35 { x: 44; y: 40.1; skew-x: 138.9; skew-y: -44.8; scale-x: 0.756; scale-y: -10000; }
        frame 36 { x: 44.6; y: 39.5; skew-x: 137.6; skew-y: -10000; scale-x: 0.769; scale-y: 0.808; }
        frame 37 { x: 45.4; y: 38.8; skew-x: 136.4; scale-x: 0.784; scale-y: 0.804; }
        frame 38 { x: 46; y: 38; skew-x: 135; skew-y: -44.9; scale-x: 0.8; scale-y: 0.8; }
        frame 39 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 40 { cel: -10000; }
    }
    Track {
        source-name: "sprout_petal";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 10 { x: 38.2; y: 47.5; scale-x: 0.118; scale-y: 0.116; cel: 0; image: IMAGE_REANIM_SPROUT_PETAL; }
        frame 11 { x: 32.9; y: 45.5; skew-x: 3.5; skew-y: 3.5; scale-x: 0.509; scale-y: 0.508; cel: -10000; image: none; }
        frame 12 { x: 28.1; y: 43; skew-x: 7.3; skew-y: 7.3; scale-x: 0.9; scale-y: 0.9; }
        frame 13 { x: 28.6; y: 43.4; skew-x: -10000; skew-y: -10000; scale-x: 0.849; scale-y: 0.849; }
        frame 14 { x: 29.1; y: 43.6; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 30.1; y: 43.3; skew-x: 10.1; skew-y: 9; scale-x: 0.795; scale-y: 0.796; }
        frame 20 { x: 31.1; y: 42.8; skew-x: 13.1; skew-y: 10.8; scale-x: 0.792; scale-y: 0.793; }
        frame 21 { x: 31.8; y: 43.7; skew-x: 11; skew-y: 12.8; scale-x: 0.789; scale-y: 0.784; }
        frame 22 { x: 32.5; y: 44.6; skew-x: 8.8; skew-y: 14.6; scale-x: 0.786; scale-y: 0.776; }
        frame 23 { x: 33.1; y: 45.6; skew-x: 6.9; skew-y: 16.7; scale-x: 0.784; scale-y: 0.768; }
        frame 24 { x: 32.2; y: -10000; skew-x: 4.6; skew-y: 14.5; scale-x: 0.791; scale-y: 0.778; }
        frame 25 { x: 31.3; y: 45.5; skew-x: 2.6; skew-y: 12.6; scale-x: 0.798; scale-y: 0.789; }
        frame 26 { x: 30.5; y: 44.9; skew-x: 4; skew-y: 10.8; scale-x: 0.799; scale-y: 0.792; }
        frame 27 { x: 29.8; y: 44.3; skew-x: 5.6; skew-y: 9; scale-x: -10000; scale-y: 0.796; }
        frame 28 { x: 29.1; y: 43.6; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 29 { x: 28.3; y: 43.4; skew-x: 9.8; skew-y: 5.5; scale-x: 0.806; scale-y: 0.788; }
        frame 30 { x: 27.7; y: 43; skew-x: 12.7; skew-y: 4; scale-x: 0.813; scale-y: 0.777; }
        frame 31 { x: 26.9; y: 44.2; skew-x: 10.5; skew-y: 2.3; scale-x: 0.812; scale-y: 0.753; }
        frame 32 { x: 26.1; y: 45.5; skew-x: 8.3; skew-y: 0.8; scale-x: -10000; scale-y: 0.729; }
        frame 33 { x: 25.2; y: 46.6; skew-x: 6.3; skew-y: -0.8; scale-y: 0.705; }
        frame 34 { x: 26; y: 46.1; skew-x: 4.3; skew-y: 0.6; scale-x: 0.808; scale-y: 0.735; }
        frame 35 { x: 26.7; y: 45.6; skew-x: 2.3; skew-y: 2.3; scale-x: 0.805; scale-y: 0.766; }
        frame 36 { x: 27.5; y: 45; skew-x: 3.8; skew-y: 3.8; scale-x: 0.803; scale-y: 0.777; }
        frame 37 { x: 28.2; y: 44.3; skew-x: 5.5; skew-y: 5.5; scale-x: 0.801; scale-y: 0.788; }
        frame 38 { x: 29.1; y: 43.6; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 39 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 40 { cel: -10000; }
    }
}
