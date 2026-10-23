export component Cactus {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 95;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 20 { cel: -1; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 20 { cel: 0; }
        frame 21 { cel: -10000; }
        frame 38 { cel: -1; }
        frame 39 { cel: -10000; }
    }
    Track {
        source-name: "anim_rise";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 38 { cel: 0; }
        frame 39 { cel: -10000; }
        frame 53 { cel: -1; }
        frame 54 { cel: -10000; }
    }
    Track {
        source-name: "anim_idlehigh";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 53 { cel: 0; }
        frame 54 { cel: -10000; }
        frame 68 { cel: -1; }
        frame 69 { cel: -10000; }
    }
    Track {
        source-name: "anim_shootinghigh";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 68 { y: -50.9; cel: 0; }
        frame 69 { y: -10000; cel: -10000; }
        frame 82 { cel: -1; }
        frame 83 { cel: -10000; }
    }
    Track {
        source-name: "anim_lower";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 82 { y: -76.4; cel: 0; }
        frame 83 { y: -10000; cel: -10000; }
    }
    Track {
        source-name: "Cactus_flower";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 11.7; y: 0.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CACTUS_FLOWER; }
        frame 6 { x: 10.3; y: 0.2; skew-y: -2.7; scale-x: 0.819; scale-y: 0.809; cel: -10000; image: none; }
        frame 7 { x: 8.9; y: 0.1; skew-y: -5.8; scale-x: 0.837; scale-y: 0.819; }
        frame 8 { x: 9.4; y: -0.6; skew-y: -4.7; scale-x: 0.83; scale-y: 0.825; }
        frame 9 { x: 10; y: -1.4; skew-y: -3.4; scale-x: 0.822; scale-y: 0.832; }
        frame 10 { x: 10.5; y: -2.2; skew-y: -2.2; scale-x: 0.815; scale-y: 0.838; }
        frame 11 { x: 11.2; y: -3; skew-y: -0.9; scale-x: 0.807; scale-y: 0.845; }
        frame 12 { x: 11.7; y: -3.8; skew-y: 0; scale-x: 0.8; scale-y: 0.851; }
        frame 13 { x: 12.1; y: -4.4; skew-y: -10000; scale-x: 0.781; scale-y: 0.886; }
        frame 14 { x: 12.5; y: -5.2; scale-x: 0.763; scale-y: 0.921; }
        frame 15 { x: 12.3; y: -4.1; scale-x: 0.77; scale-y: 0.896; }
        frame 16 { x: 12.2; y: -2.9; scale-x: 0.778; scale-y: 0.872; }
        frame 17 { x: 12; y: -1.8; scale-x: 0.785; scale-y: 0.848; }
        frame 18 { x: 11.9; y: -0.7; scale-x: 0.793; scale-y: 0.824; }
        frame 19 { x: 11.7; y: 0.3; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 12.9; y: 0.1; skew-y: 3; scale-y: 0.802; }
        frame 22 { x: 14; y: 0; skew-y: 6.1; scale-y: 0.804; }
        frame 23 { x: 12; y: -10000; skew-y: 4.3; scale-y: -10000; }
        frame 24 { x: 10; skew-y: 2.6; scale-y: 0.803; }
        frame 25 { x: 8; y: 0.1; skew-y: 1; scale-y: -10000; }
        frame 26 { x: 6; y: -10000; skew-y: -0.4; }
        frame 27 { x: 4.1; y: 0.2; skew-y: -2; scale-y: 0.802; }
        frame 28 { x: 2; y: 0.3; skew-y: -3.8; scale-y: -10000; }
        frame 29 { x: 11.3; y: -10000; skew-y: -6.8; scale-y: 0.806; }
        frame 30 { x: 24.8; y: -0.9; skew-x: 3; skew-y: 6; scale-y: 0.812; }
        frame 31 { x: 38.1; y: -1.8; skew-x: 6.3; skew-y: 19; scale-y: 0.819; }
        frame 32 { x: 33.8; y: -1.5; skew-x: 5.3; skew-y: 15.8; scale-x: 0.799; scale-y: 0.816; }
        frame 33 { x: 29.2; y: -1.2; skew-x: 4.1; skew-y: 12.5; scale-x: 0.8; scale-y: 0.812; }
        frame 34 { x: 24.8; y: -0.9; skew-x: 3; skew-y: 9.3; scale-x: -10000; scale-y: 0.809; }
        frame 35 { x: 20.5; y: -0.5; skew-x: 2; skew-y: 6.3; scale-y: 0.806; }
        frame 36 { x: 16; y: -0.1; skew-x: 1; skew-y: 3; scale-y: 0.803; }
        frame 37 { x: 11.7; y: 0.3; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 39 { x: 12.8; y: -0.2; scale-x: 0.751; scale-y: 0.875; }
        frame 40 { x: 12.7; y: 1.6; scale-x: 0.757; scale-y: 0.84; }
        frame 41 { x: -10000; y: 3.6; skew-y: 0.2; scale-x: 0.763; scale-y: 0.805; }
        frame 42 { x: 12.4; y: -2.9; skew-y: 0; scale-x: 0.772; scale-y: 0.808; }
        frame 43 { x: 12.2; y: -9.5; skew-y: -10000; scale-x: 0.781; scale-y: 0.811; }
        frame 44 { x: 11.9; y: -16.2; scale-x: 0.791; scale-y: 0.813; }
        frame 45 { x: 11.7; y: -22.9; scale-x: 0.8; scale-y: 0.816; }
        frame 46 { x: 12.9; y: -40.2; scale-x: 0.744; scale-y: 0.872; }
        frame 47 { x: 12.3; y: -55.2; scale-x: 0.772; scale-y: 0.836; }
        frame 48 { x: 11.7; y: -70.3; scale-x: 0.8; scale-y: 0.8; }
        frame 49 { x: 13; y: -74.7; skew-y: 2.3; scale-x: 0.765; scale-y: 0.9; }
        frame 50 { x: 14.5; y: -79.1; skew-y: 4.7; scale-x: 0.73; scale-y: 1; }
        frame 51 { x: 13; y: -74.7; skew-y: 2.3; scale-x: 0.765; scale-y: 0.9; }
        frame 52 { x: 11.7; y: -70.3; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 10.3; y: -71; skew-y: -2.7; scale-x: 0.819; scale-y: 0.809; }
        frame 55 { x: 8.9; y: -71.7; skew-y: -5.8; scale-x: 0.837; scale-y: 0.819; }
        frame 56 { x: 9.4; y: -72.3; skew-y: -4.7; scale-x: 0.83; scale-y: 0.825; }
        frame 57 { x: 10; y: -73; skew-y: -3.4; scale-x: 0.822; scale-y: 0.832; }
        frame 58 { x: 10.6; y: -73.7; skew-y: -2.2; scale-x: 0.815; scale-y: 0.838; }
        frame 59 { x: 11.2; y: -74.2; skew-y: -0.9; scale-x: 0.807; scale-y: 0.845; }
        frame 60 { x: 11.7; y: -74.9; skew-y: 0; scale-x: 0.8; scale-y: 0.851; }
        frame 61 { x: 12.1; y: -74.5; skew-y: -10000; scale-x: 0.781; scale-y: 0.886; }
        frame 62 { x: 12.5; y: -74.2; scale-x: 0.763; scale-y: 0.921; }
        frame 63 { x: 12.3; y: -73.4; scale-x: 0.77; scale-y: 0.896; }
        frame 64 { x: 12.2; y: -72.6; scale-x: 0.778; scale-y: 0.872; }
        frame 65 { x: 12; y: -71.7; scale-x: 0.785; scale-y: 0.848; }
        frame 66 { x: 11.9; y: -70.9; scale-x: 0.793; scale-y: 0.824; }
        frame 67 { x: 11.7; y: -70; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: -10000; y: -70.3; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 7.3; y: -70.5; skew-y: -0.7; }
        frame 70 { x: 2.8; y: -70.8; skew-y: -1.7; scale-y: 0.801; }
        frame 71 { x: -1.5; y: -71; skew-y: -2.7; scale-y: -10000; }
        frame 72 { x: -6; y: -71.1; skew-y: -3.8; scale-y: 0.802; }
        frame 73 { x: 7.8; y: -10000; skew-y: -10.2; scale-y: 0.813; }
        frame 74 { x: 38.1; y: -72.7; skew-x: 3; skew-y: 4.3; scale-y: 0.816; }
        frame 75 { x: 68.3; y: -73.5; skew-x: 6.3; skew-y: 19; scale-y: 0.819; }
        frame 76 { x: 58.9; y: -73; skew-x: 5.3; skew-y: 15.8; scale-x: 0.799; scale-y: 0.816; }
        frame 77 { x: 49.4; y: -72.4; skew-x: 4.1; skew-y: 12.5; scale-x: 0.8; scale-y: 0.812; }
        frame 78 { x: 40; y: -71.8; skew-x: 3; skew-y: 9.3; scale-x: -10000; scale-y: 0.809; }
        frame 79 { x: 30.5; y: -71.2; skew-x: 2; skew-y: 6.3; scale-y: 0.806; }
        frame 80 { x: 21; y: -70.5; skew-x: 1; skew-y: 3; scale-y: 0.803; }
        frame 81 { x: 11.7; y: -69.7; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 82 { x: -10000; y: -70; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 83 { x: 11.6; y: -71.5; scale-x: 0.801; scale-y: 0.826; }
        frame 84 { x: -10000; y: -72.7; scale-x: 0.802; scale-y: 0.852; }
        frame 85 { x: 11.7; y: -47.7; scale-x: 0.801; scale-y: 0.834; }
        frame 86 { x: -10000; y: -22.9; scale-x: 0.8; scale-y: 0.816; }
        frame 87 { x: 11.9; y: -16.3; scale-x: 0.791; scale-y: 0.813; }
        frame 88 { x: 12.2; y: -9.6; scale-x: 0.781; scale-y: 0.811; }
        frame 89 { x: 12.4; y: -2.9; scale-x: 0.772; scale-y: 0.808; }
        frame 90 { x: 12.7; y: 3.6; skew-y: 0.2; scale-x: 0.763; scale-y: 0.805; }
        frame 91 { x: 12.4; y: 2.8; skew-y: 0; scale-x: 0.772; scale-y: 0.804; }
        frame 92 { x: 12.2; y: 2; skew-y: -10000; scale-x: 0.781; scale-y: 0.803; }
        frame 93 { x: 11.9; y: 1.1; scale-x: 0.791; scale-y: 0.801; }
        frame 94 { x: 11.7; y: 0.3; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cactus_floer_top";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 20.7; y: -3.9; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CACTUS_FLOWER_TOP; }
        frame 6 { x: 20.3; y: -3.7; skew-x: -3; skew-y: -3; scale-x: 0.799; scale-y: 0.807; cel: -10000; image: none; }
        frame 7 { x: 19.7; y: -3.4; skew-x: -6.4; skew-y: -6.4; scale-x: -10000; scale-y: 0.814; }
        frame 8 { x: 19.9; y: -4.4; skew-x: -5; skew-y: -5; scale-y: 0.821; }
        frame 9 { x: 20.1; y: -5.4; skew-x: -3.7; skew-y: -3.7; scale-y: 0.829; }
        frame 10 { x: 20.3; y: -6.5; skew-x: -2.4; skew-y: -2.4; scale-x: 0.8; scale-y: 0.836; }
        frame 11 { x: 20.6; y: -7.3; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: 0.844; }
        frame 12 { x: 20.7; y: -8.5; skew-x: 0; skew-y: 0; scale-y: 0.851; }
        frame 13 { x: 21.5; y: -9.1; skew-x: 4.5; skew-y: 4.5; scale-y: 0.844; }
        frame 14 { x: 22.2; y: -9.9; skew-x: 9; skew-y: 9; scale-y: 0.836; }
        frame 15 { x: 21.9; y: -8.7; skew-x: 7.1; skew-y: 7.1; scale-x: 0.799; scale-y: 0.829; }
        frame 16 { x: 21.6; y: -7.4; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: 0.822; }
        frame 17 { x: 21.3; y: -6.3; skew-x: 3.5; skew-y: 3.5; scale-x: 0.8; scale-y: 0.814; }
        frame 18 { x: 21; y: -5; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: 0.807; }
        frame 19 { x: 20.7; y: -3.9; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 22; y: -4.1; skew-x: 1.8; skew-y: 1.8; }
        frame 22 { x: 23.2; y: -4.2; skew-x: 3.8; skew-y: 3.8; }
        frame 23 { x: 24.5; y: -4.3; skew-x: 5.8; skew-y: 5.8; }
        frame 24 { x: 22; y: -4.2; skew-x: 4.5; skew-y: 3.8; }
        frame 25 { x: 19.5; y: -10000; skew-x: 3.3; skew-y: 1.8; }
        frame 26 { x: 17; y: -4.1; skew-x: 2.3; skew-y: 0; scale-y: 0.801; }
        frame 27 { x: 14.5; y: -4; skew-x: 1; skew-y: -1.7; scale-y: -10000; }
        frame 28 { x: 11.9; y: -3.9; skew-x: 0; skew-y: -3.8; scale-y: 0.802; }
        frame 29 { x: 19.1; y: -4.1; skew-x: -16.1; skew-y: -18.7; scale-x: 0.799; scale-y: 0.8; }
        frame 30 { x: 43.4; y: -3.7; skew-x: 4.3; skew-y: 3; scale-x: -10000; scale-y: 0.799; }
        frame 31 { x: 68.5; y: -3.1; skew-x: 25.1; skew-y: 25.1; scale-y: -10000; }
        frame 32 { x: 60.5; y: -3.3; skew-x: 20.8; skew-y: 20.8; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 52.4; y: -3.4; skew-x: 16.6; skew-y: 16.6; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 44.5; y: -3.6; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 36.6; y: -3.7; skew-x: 8.3; skew-y: 8.3; }
        frame 36 { x: 28.6; y: -3.8; skew-x: 4; skew-y: 4; scale-x: 0.8; scale-y: 0.8; }
        frame 37 { x: 20.7; y: -3.9; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 39 { x: 21.1; y: -4.7; scale-y: 0.782; }
        frame 40 { x: 21.4; y: -2.8; scale-y: 0.764; }
        frame 41 { x: 21.7; y: -0.9; skew-y: 0.2; scale-y: 0.746; }
        frame 42 { x: 21.5; y: -7.5; skew-y: 0; scale-y: 0.763; }
        frame 43 { x: 21.2; y: -14.1; skew-y: -10000; scale-y: 0.781; }
        frame 44 { x: 21; y: -20.8; scale-y: 0.798; }
        frame 45 { x: 20.7; y: -27.3; scale-y: 0.816; }
        frame 46 { x: -10000; y: -43.3; scale-y: 0.811; }
        frame 47 { y: -58.6; scale-y: 0.805; }
        frame 48 { y: -73.9; scale-y: 0.8; }
        frame 49 { x: 21.5; y: -78.5; skew-y: 0.3; scale-y: 0.828; }
        frame 50 { x: 22.2; y: -83.1; skew-y: 0.9; scale-y: 0.855; }
        frame 51 { x: 21.6; y: -78.5; skew-y: 0.3; scale-y: 0.828; }
        frame 52 { x: 20.7; y: -73.9; skew-y: 0; scale-y: 0.8; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { x: 20.3; y: -74.7; skew-x: -3; skew-y: -3; scale-x: 0.799; scale-y: 0.807; }
        frame 55 { x: 19.7; y: -75.4; skew-x: -6.4; skew-y: -6.4; scale-x: -10000; scale-y: 0.814; }
        frame 56 { x: 20; y: -76.2; skew-x: -5; skew-y: -5; scale-y: 0.821; }
        frame 57 { x: 20.1; y: -77.1; skew-x: -3.7; skew-y: -3.7; scale-y: 0.829; }
        frame 58 { x: 20.3; y: -78; skew-x: -2.4; skew-y: -2.4; scale-x: 0.8; scale-y: 0.836; }
        frame 59 { x: 20.6; y: -78.7; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: 0.844; }
        frame 60 { x: 20.7; y: -79.6; skew-x: 0; skew-y: 0; scale-y: 0.851; }
        frame 61 { x: 21.5; y: -79.2; skew-x: 4.5; skew-y: 4.5; scale-y: 0.844; }
        frame 62 { x: 22.2; y: -78.9; skew-x: 9; skew-y: 9; scale-y: 0.836; }
        frame 63 { x: 21.8; y: -78; skew-x: 7.1; skew-y: 7.1; scale-x: 0.799; scale-y: 0.829; }
        frame 64 { x: 21.5; y: -77; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: 0.822; }
        frame 65 { x: 21.3; y: -76.2; skew-x: 3.5; skew-y: 3.5; scale-x: 0.8; scale-y: 0.814; }
        frame 66 { x: 21; y: -75.3; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: 0.807; }
        frame 67 { x: 20.7; y: -74.4; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 68 { x: -10000; y: -73.9; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 69 { x: 16.5; y: -74.3; skew-y: -0.7; }
        frame 70 { x: 12.3; y: -74.7; skew-y: -1.7; scale-y: 0.801; }
        frame 71 { x: 8.1; y: -75.2; skew-y: -2.7; scale-y: -10000; }
        frame 72 { x: 3.8; y: -75.5; skew-y: -3.8; scale-y: 0.802; }
        frame 73 { x: 14.1; y: -75.7; skew-x: -16.4; skew-y: -21.7; scale-x: 0.786; scale-y: 0.816; }
        frame 74 { x: 55.5; y: -76.6; skew-x: 4.3; skew-y: 1.5; scale-x: 0.792; scale-y: 0.807; }
        frame 75 { x: 97.5; y: -77.2; skew-x: 25.1; skew-y: 25.1; scale-x: 0.799; scale-y: 0.799; }
        frame 76 { x: 84.7; y: -76.7; skew-x: 20.8; skew-y: 20.8; scale-x: 0.798; scale-y: 0.798; }
        frame 77 { x: 71.8; y: -76.2; skew-x: 16.6; skew-y: 16.6; scale-x: 0.799; scale-y: 0.799; }
        frame 78 { x: 59; y: -75.8; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 46.3; y: -75.2; skew-x: 8.3; skew-y: 8.3; }
        frame 80 { x: 33.5; y: -74.6; skew-x: 4; skew-y: 4; scale-x: 0.8; scale-y: 0.8; }
        frame 81 { x: 20.7; y: -74.1; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: -10000; y: -74.4; skew-x: -10000; skew-y: -10000; }
        frame 83 { y: -75.4; scale-y: 0.817; }
        frame 84 { y: -76.5; scale-y: 0.835; }
        frame 85 { y: -51.9; scale-y: 0.825; }
        frame 86 { y: -27.3; scale-y: 0.816; }
        frame 87 { x: 21; y: -20.8; scale-y: 0.798; }
        frame 88 { x: 21.2; y: -14.1; scale-y: 0.781; }
        frame 89 { x: 21.5; y: -7.5; scale-y: 0.763; }
        frame 90 { x: 21.7; y: -0.9; skew-y: 0.2; scale-y: 0.746; }
        frame 91 { x: 21.5; y: -1.7; skew-y: 0; scale-y: 0.759; }
        frame 92 { x: 21.2; y: -2.4; skew-y: -10000; scale-y: 0.773; }
        frame 93 { x: 21; y: -3.2; scale-y: 0.786; }
        frame 94 { x: 20.7; y: -3.9; scale-y: 0.8; }
    }
    Track {
        source-name: "Cactus_floer_top2";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 15.4; y: 0.7; scale-x: 0.5; scale-y: 0.5; cel: 0; image: IMAGE_REANIM_CACTUS_FLOWER_TOP; }
        frame 6 { x: 15.2; y: 1.2; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: 0.504; cel: -10000; image: none; }
        frame 7 { x: 15; y: 1.8; skew-x: -6.4; skew-y: -6.4; scale-x: 0.499; scale-y: 0.509; }
        frame 8 { x: 15.1; y: 0.7; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: 0.513; }
        frame 9 { x: -10000; y: -0.2; skew-x: -3.7; skew-y: -3.7; scale-x: 0.5; scale-y: 0.518; }
        frame 10 { x: 15.3; y: -1.3; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: 0.523; }
        frame 11 { x: 15.4; y: -2.3; skew-x: -1.2; skew-y: -1.2; scale-y: 0.527; }
        frame 12 { x: -10000; y: -3.5; skew-x: 0; skew-y: 0; scale-y: 0.532; }
        frame 13 { x: 15.8; y: -4.7; skew-x: 4.5; skew-y: 4.5; scale-y: 0.527; }
        frame 14 { x: 16.3; y: -5.8; skew-x: 9; skew-y: 9; scale-y: 0.523; }
        frame 15 { x: 16; y: -4.5; skew-x: 7.1; skew-y: 7.1; scale-y: 0.518; }
        frame 16 { x: 15.9; y: -3.1; skew-x: 5.3; skew-y: 5.3; scale-y: 0.513; }
        frame 17 { x: 15.7; y: -1.8; skew-x: 3.5; skew-y: 3.5; scale-y: 0.509; }
        frame 18 { x: 15.5; y: -0.4; skew-x: 1.8; skew-y: 1.8; scale-y: 0.504; }
        frame 19 { x: 15.4; y: 0.7; skew-x: 0; skew-y: 0; scale-y: 0.5; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 16.5; y: 0.3; skew-x: 1.8; skew-y: 1.8; }
        frame 22 { x: 17.6; y: 0; skew-x: 3.8; skew-y: 3.8; }
        frame 23 { x: 18.8; y: -0.2; skew-x: 5.8; skew-y: 5.8; }
        frame 24 { x: 16.4; y: 0; skew-x: 4.5; skew-y: 3.8; }
        frame 25 { x: 14.1; y: 0.1; skew-x: 3.3; skew-y: 1.8; }
        frame 26 { x: 11.7; y: 0.3; skew-x: 2.3; skew-y: 0; scale-y: 0.501; }
        frame 27 { x: 9.4; y: 0.6; skew-x: 1; skew-y: -1.7; scale-y: -10000; }
        frame 28 { x: 6.9; y: 0.7; skew-x: 0; skew-y: -3.8; }
        frame 29 { x: 15.6; y: 1.7; skew-x: -16.1; skew-y: -18.7; scale-x: 0.499; scale-y: 0.5; }
        frame 30 { x: 37.9; y: 0.5; skew-x: 4.3; skew-y: 3; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 61.8; y: -1.1; skew-x: 25.1; skew-y: 25.1; scale-y: 0.499; }
        frame 32 { x: 53.9; y: -0.8; skew-x: 20.8; skew-y: 20.8; scale-y: -10000; }
        frame 33 { x: 46; y: -0.4; skew-x: 16.6; skew-y: 16.6; }
        frame 34 { x: 38.3; y: -0.1; skew-x: 12.5; skew-y: 12.5; }
        frame 35 { x: 30.7; y: 0.1; skew-x: 8.3; skew-y: 8.3; scale-x: 0.5; scale-y: 0.5; }
        frame 36 { x: 23; y: 0.3; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 15.4; y: 0.7; skew-x: 0; skew-y: 0; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 39 { x: 15.8; y: -0.1; scale-y: 0.489; }
        frame 40 { x: 16.1; y: 1.5; scale-y: 0.477; }
        frame 41 { x: 16.4; y: 3.4; skew-y: 0.2; scale-y: 0.466; }
        frame 42 { x: 16.2; y: -3.1; skew-y: 0; scale-y: 0.477; }
        frame 43 { x: 15.9; y: -9.5; skew-y: -10000; scale-y: 0.488; }
        frame 44 { x: 15.7; y: -16.1; scale-y: 0.499; }
        frame 45 { x: 15.4; y: -22.6; scale-y: 0.51; }
        frame 46 { x: -10000; y: -38.5; scale-y: 0.507; }
        frame 47 { y: -53.8; scale-y: 0.503; }
        frame 48 { y: -69.2; scale-y: 0.5; }
        frame 49 { x: 16.1; y: -73.6; skew-y: 0.3; scale-y: 0.517; }
        frame 50 { x: 16.9; y: -78.1; skew-y: 0.9; scale-y: 0.535; }
        frame 51 { x: 16.2; y: -73.6; skew-y: 0.3; scale-y: 0.517; }
        frame 52 { x: 15.4; y: -69.2; skew-y: 0; scale-y: 0.5; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { x: 15.2; y: -69.7; skew-x: -3; skew-y: -3; scale-y: 0.504; }
        frame 55 { x: 15; y: -70.1; skew-x: -6.4; skew-y: -6.4; scale-x: 0.499; scale-y: 0.509; }
        frame 56 { x: 15.1; y: -71; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: 0.513; }
        frame 57 { x: -10000; y: -71.9; skew-x: -3.7; skew-y: -3.7; scale-x: 0.5; scale-y: 0.518; }
        frame 58 { x: 15.2; y: -72.8; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: 0.523; }
        frame 59 { x: 15.4; y: -73.6; skew-x: -1.2; skew-y: -1.2; scale-y: 0.527; }
        frame 60 { x: -10000; y: -74.6; skew-x: 0; skew-y: 0; scale-y: 0.532; }
        frame 61 { x: 15.8; y: -74.7; skew-x: 4.5; skew-y: 4.5; scale-y: 0.527; }
        frame 62 { x: 16.3; y: -74.8; skew-x: 9; skew-y: 9; scale-y: 0.523; }
        frame 63 { x: 16; y: -73.8; skew-x: 7.1; skew-y: 7.1; scale-y: 0.518; }
        frame 64 { x: 15.8; y: -72.7; skew-x: 5.3; skew-y: 5.3; scale-y: 0.513; }
        frame 65 { x: 15.7; y: -71.7; skew-x: 3.5; skew-y: 3.5; scale-y: 0.509; }
        frame 66 { x: 15.5; y: -70.7; skew-x: 1.8; skew-y: 1.8; scale-y: 0.504; }
        frame 67 { x: 15.4; y: -69.7; skew-x: 0; skew-y: 0; scale-y: 0.5; }
        frame 68 { x: -10000; y: -69.2; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 69 { x: 11.3; y: -69.6; skew-y: -0.7; }
        frame 70 { x: 7.2; y: -70; skew-y: -1.7; scale-y: 0.501; }
        frame 71 { x: 3; y: -70.5; skew-y: -2.7; scale-y: -10000; }
        frame 72 { x: -1.1; y: -70.8; skew-y: -3.8; }
        frame 73 { x: 10.9; y: -69.8; skew-x: -16.4; skew-y: -21.7; scale-x: 0.491; scale-y: 0.51; }
        frame 74 { x: 50.1; y: -72.3; skew-x: 4.3; skew-y: 1.5; scale-x: 0.495; scale-y: 0.505; }
        frame 75 { x: 90.8; y: -75.2; skew-x: 25.1; skew-y: 25.1; scale-x: 0.499; scale-y: 0.499; }
        frame 76 { x: 78.1; y: -74.2; skew-x: 20.8; skew-y: 20.8; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 65.4; y: -73.2; skew-x: 16.6; skew-y: 16.6; }
        frame 78 { x: 52.8; y: -72.3; skew-x: 12.5; skew-y: 12.5; }
        frame 79 { x: 40.4; y: -71.3; skew-x: 8.3; skew-y: 8.3; scale-x: 0.5; scale-y: 0.5; }
        frame 80 { x: 27.8; y: -70.3; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 15.4; y: -69.4; skew-x: 0; skew-y: 0; }
        frame 82 { x: -10000; y: -69.7; skew-x: -10000; skew-y: -10000; }
        frame 83 { y: -70.6; scale-y: 0.511; }
        frame 84 { y: -71.6; scale-y: 0.522; }
        frame 85 { y: -47; scale-y: 0.516; }
        frame 86 { y: -22.6; scale-y: 0.51; }
        frame 87 { x: 15.7; y: -16.1; scale-y: 0.499; }
        frame 88 { x: 15.9; y: -9.5; scale-y: 0.488; }
        frame 89 { x: 16.2; y: -3.1; scale-y: 0.477; }
        frame 90 { x: 16.4; y: 3.4; skew-y: 0.2; scale-y: 0.466; }
        frame 91 { x: 16.2; y: 2.7; skew-y: 0; scale-y: 0.475; }
        frame 92 { x: 15.9; y: 2; skew-y: -10000; scale-y: 0.483; }
        frame 93 { x: 15.7; y: 1.3; scale-y: 0.492; }
        frame 94 { x: 15.4; y: 0.7; scale-y: 0.5; }
    }
    Track {
        source-name: "Cactus_floer_top3";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 16.2; y: -4.2; scale-x: 0.55; scale-y: 0.55; cel: 0; image: IMAGE_REANIM_CACTUS_FLOWER_TOP; }
        frame 6 { x: 15.7; y: -3.8; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: 0.555; cel: -10000; image: none; }
        frame 7 { x: 15.3; y: -3.2; skew-x: -6.4; skew-y: -6.4; scale-x: 0.549; scale-y: 0.559; }
        frame 8 { x: 15.4; y: -4.3; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: 0.564; }
        frame 9 { x: 15.6; y: -5.3; skew-x: -3.7; skew-y: -3.7; scale-y: 0.57; }
        frame 10 { x: 15.8; y: -6.5; skew-x: -2.4; skew-y: -2.4; scale-x: 0.55; scale-y: 0.575; }
        frame 11 { x: 16.1; y: -7.5; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: 0.58; }
        frame 12 { x: 16.2; y: -8.7; skew-x: 0; skew-y: 0; scale-y: 0.585; }
        frame 13 { x: 17; y: -9.8; skew-x: 4.5; skew-y: 4.5; scale-y: 0.58; }
        frame 14 { x: 17.9; y: -10.8; skew-x: 9; skew-y: 9; scale-y: 0.575; }
        frame 15 { x: 17.5; y: -9.5; skew-x: 7.1; skew-y: 7.1; scale-y: 0.57; }
        frame 16 { x: 17.2; y: -8.1; skew-x: 5.3; skew-y: 5.3; scale-y: 0.565; }
        frame 17 { x: 16.8; y: -6.8; skew-x: 3.5; skew-y: 3.5; scale-y: 0.56; }
        frame 18 { x: 16.5; y: -5.4; skew-x: 1.8; skew-y: 1.8; scale-y: 0.555; }
        frame 19 { x: 16.2; y: -4.2; skew-x: 0; skew-y: 0; scale-y: 0.55; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 17.5; y: -4.5; skew-x: 1.8; skew-y: 1.8; }
        frame 22 { x: 18.7; y: -4.8; skew-x: 3.8; skew-y: 3.8; }
        frame 23 { x: 20.1; y: -5; skew-x: 5.8; skew-y: 5.8; }
        frame 24 { x: 17.5; y: -4.8; skew-x: 4.5; skew-y: 3.8; }
        frame 25 { x: 15; y: -4.7; skew-x: 3.3; skew-y: 1.8; }
        frame 26 { x: 12.5; y: -4.5; skew-x: 2.3; skew-y: 0; scale-y: 0.551; }
        frame 27 { x: 10; y: -4.3; skew-x: 1; skew-y: -1.7; scale-y: -10000; }
        frame 28 { x: 7.4; y: -4.2; skew-x: 0; skew-y: -3.8; }
        frame 29 { x: 14.7; y: -3.1; skew-x: -16.1; skew-y: -18.7; scale-x: 0.549; scale-y: 0.55; }
        frame 30 { x: 39; y: -4.3; skew-x: 4.3; skew-y: 3; scale-x: -10000; scale-y: 0.549; }
        frame 31 { x: 64.5; y: -5.2; skew-x: 25.1; skew-y: 25.1; scale-y: -10000; }
        frame 32 { x: 56.4; y: -10000; skew-x: 20.8; skew-y: 20.8; }
        frame 33 { x: 48.2; y: -5; skew-x: 16.6; skew-y: 16.6; }
        frame 34 { x: 40.2; y: -4.8; skew-x: 12.5; skew-y: 12.5; }
        frame 35 { x: 32.1; y: -4.6; skew-x: 8.3; skew-y: 8.3; }
        frame 36 { x: 24.1; y: -4.4; skew-x: 4; skew-y: 4; scale-x: 0.55; scale-y: 0.55; }
        frame 37 { x: 16.2; y: -4.2; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 39 { x: 16.6; y: -5; scale-y: 0.538; }
        frame 40 { x: 16.9; y: -3.1; scale-y: 0.525; }
        frame 41 { x: 17.2; y: -1.2; skew-y: 0.2; scale-y: 0.513; }
        frame 42 { x: 17; y: -7.8; skew-y: 0; scale-y: 0.525; }
        frame 43 { x: 16.7; y: -14.4; skew-y: -10000; scale-y: 0.537; }
        frame 44 { x: 16.5; y: -21; scale-y: 0.549; }
        frame 45 { x: 16.2; y: -27.6; scale-y: 0.561; }
        frame 46 { x: -10000; y: -43.5; scale-y: 0.557; }
        frame 47 { y: -58.8; scale-y: 0.554; }
        frame 48 { y: -74.2; scale-y: 0.55; }
        frame 49 { x: 17; y: -78.7; skew-y: 0.3; scale-y: 0.569; }
        frame 50 { x: 17.8; y: -83.4; skew-y: 0.9; scale-y: 0.588; }
        frame 51 { x: 17.1; y: -78.7; skew-y: 0.3; scale-y: 0.569; }
        frame 52 { x: 16.2; y: -74.2; skew-y: 0; scale-y: 0.55; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { x: 15.7; y: -74.8; skew-x: -3; skew-y: -3; scale-y: 0.555; }
        frame 55 { x: 15.3; y: -75.2; skew-x: -6.4; skew-y: -6.4; scale-x: 0.549; scale-y: 0.559; }
        frame 56 { x: 15.5; y: -76.1; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: 0.564; }
        frame 57 { x: 15.6; y: -77; skew-x: -3.7; skew-y: -3.7; scale-y: 0.57; }
        frame 58 { x: 15.8; y: -78; skew-x: -2.4; skew-y: -2.4; scale-x: 0.55; scale-y: 0.575; }
        frame 59 { x: 16.1; y: -78.9; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: 0.58; }
        frame 60 { x: 16.2; y: -79.8; skew-x: 0; skew-y: 0; scale-y: 0.585; }
        frame 61 { x: 17; y: -10000; skew-x: 4.5; skew-y: 4.5; scale-y: 0.58; }
        frame 62 { x: 17.9; skew-x: 9; skew-y: 9; scale-y: 0.575; }
        frame 63 { x: 17.4; y: -78.8; skew-x: 7.1; skew-y: 7.1; scale-y: 0.57; }
        frame 64 { x: 17.1; y: -77.7; skew-x: 5.3; skew-y: 5.3; scale-y: 0.565; }
        frame 65 { x: 16.8; y: -76.7; skew-x: 3.5; skew-y: 3.5; scale-y: 0.56; }
        frame 66 { x: 16.5; y: -75.7; skew-x: 1.8; skew-y: 1.8; scale-y: 0.555; }
        frame 67 { x: 16.2; y: -74.7; skew-x: 0; skew-y: 0; scale-y: 0.55; }
        frame 68 { x: -10000; y: -74.2; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 69 { x: 12; y: -74.6; skew-y: -0.7; }
        frame 70 { x: 7.8; y: -75; skew-y: -1.7; scale-y: 0.551; }
        frame 71 { x: 3.5; y: -75.4; skew-y: -2.7; scale-y: -10000; }
        frame 72 { x: -0.6; y: -75.8; skew-y: -3.8; }
        frame 73 { x: 9.7; y: -74.7; skew-x: -16.4; skew-y: -21.7; scale-x: 0.54; scale-y: 0.561; }
        frame 74 { x: 51; y: -77.2; skew-x: 4.3; skew-y: 1.5; scale-x: 0.545; scale-y: 0.555; }
        frame 75 { x: 93.5; y: -79.3; skew-x: 25.1; skew-y: 25.1; scale-x: 0.549; scale-y: 0.549; }
        frame 76 { x: 80.6; y: -78.6; skew-x: 20.8; skew-y: 20.8; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 67.6; y: -77.7; skew-x: 16.6; skew-y: 16.6; }
        frame 78 { x: 54.6; y: -77; skew-x: 12.5; skew-y: 12.5; }
        frame 79 { x: 41.8; y: -76.1; skew-x: 8.3; skew-y: 8.3; }
        frame 80 { x: 29; y: -75.2; skew-x: 4; skew-y: 4; scale-x: 0.55; scale-y: 0.55; }
        frame 81 { x: 16.2; y: -74.4; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: -10000; y: -74.7; skew-x: -10000; skew-y: -10000; }
        frame 83 { y: -75.7; scale-y: 0.562; }
        frame 84 { y: -76.7; scale-y: 0.574; }
        frame 85 { y: -52.1; scale-y: 0.567; }
        frame 86 { y: -27.6; scale-y: 0.561; }
        frame 87 { x: 16.5; y: -21; scale-y: 0.549; }
        frame 88 { x: 16.7; y: -14.4; scale-y: 0.537; }
        frame 89 { x: 17; y: -7.8; scale-y: 0.525; }
        frame 90 { x: 17.2; y: -1.2; skew-y: 0.2; scale-y: 0.513; }
        frame 91 { x: 17; y: -1.9; skew-y: 0; scale-y: 0.522; }
        frame 92 { x: 16.7; y: -2.7; skew-y: -10000; scale-y: 0.531; }
        frame 93 { x: 16.5; y: -3.4; scale-y: 0.541; }
        frame 94 { x: 16.2; y: -4.2; scale-y: 0.55; }
    }
    Track {
        source-name: "Cactus_arm2_2";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 52; y: 44.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CACTUS_ARM2_2; }
        frame 6 { x: -10000; y: 44; skew-x: 3.8; scale-x: 0.803; scale-y: 0.807; cel: -10000; image: none; }
        frame 7 { y: 43.6; skew-x: 7.7; scale-x: 0.807; scale-y: 0.815; }
        frame 8 { x: 52; y: 43.5; skew-x: 6; scale-x: 0.806; scale-y: 0.822; }
        frame 9 { y: 43.4; skew-x: 4.5; scale-x: 0.804; scale-y: 0.829; }
        frame 10 { x: -10000; y: 43.3; skew-x: 3; scale-x: 0.803; scale-y: 0.837; }
        frame 11 { y: 43; skew-x: 1.5; scale-x: 0.801; scale-y: 0.844; }
        frame 12 { y: 42.9; skew-x: 0; scale-x: 0.8; scale-y: 0.851; }
        frame 13 { y: 43.1; skew-x: -2.7; scale-x: 0.802; scale-y: 0.844; }
        frame 14 { y: 43.4; skew-x: -5.9; scale-x: 0.804; scale-y: 0.837; }
        frame 15 { y: 43.5; skew-x: -4.7; scale-x: 0.803; scale-y: 0.829; }
        frame 16 { x: 52; y: 43.8; skew-x: -3.4; scale-x: 0.802; scale-y: 0.822; }
        frame 17 { x: -10000; y: 43.9; skew-x: -2.2; scale-x: -10000; scale-y: 0.815; }
        frame 18 { x: 52; y: 44.1; skew-x: -0.9; scale-x: 0.801; scale-y: 0.807; }
        frame 19 { x: -10000; y: 44.3; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 51.5; skew-y: -0.4; }
        frame 24 { x: 50.8; skew-y: -1.2; scale-y: 0.801; }
        frame 25 { x: 50.3; y: 44.4; skew-y: -1.7; scale-y: -10000; }
        frame 26 { x: 49.5; y: 44.3; skew-y: -2.4; }
        frame 27 { x: 49; y: -10000; skew-y: -3; }
        frame 28 { x: 48.3; skew-y: -3.8; scale-y: 0.802; }
        frame 29 { x: 51.4; skew-y: 0; scale-x: 0.613; scale-y: 0.8; }
        frame 30 { x: 53.4; skew-y: -10000; scale-x: 0.707; scale-y: -10000; }
        frame 31 { x: 55.4; scale-x: 0.8; }
        frame 32 { x: 55.3; scale-x: -10000; }
        frame 33 { x: 55; }
        frame 34 { x: 54.3; }
        frame 35 { x: 53.5; }
        frame 36 { x: 52.8; }
        frame 37 { x: 52; }
        frame 38 { x: -10000; }
        frame 39 { y: 43.8; scale-y: 0.782; }
        frame 40 { x: 52.3; y: 44.8; scale-y: 0.764; }
        frame 41 { x: 52.5; y: 45.8; skew-y: 0.2; scale-y: 0.746; }
        frame 42 { x: 52.4; y: 40; skew-y: 0; scale-y: 0.759; }
        frame 43 { x: 52.3; y: 34; skew-y: -10000; scale-y: 0.773; }
        frame 44 { x: 52.1; y: 28.3; scale-y: 0.786; }
        frame 45 { x: 52; y: 22.3; scale-y: 0.8; }
        frame 46 { x: -10000; y: 7.1; skew-x: -5.6; scale-x: 0.804; scale-y: -10000; }
        frame 47 { y: -9.1; skew-x: -2.7; scale-x: 0.802; }
        frame 48 { y: -25.5; skew-x: 0; scale-x: 0.8; }
        frame 49 { x: 52.3; y: -26.7; skew-x: -2.9; skew-y: 0.3; scale-x: 0.803; scale-y: 0.828; }
        frame 50 { x: 52.5; y: -28; skew-x: -6; skew-y: 0.9; scale-x: 0.806; scale-y: 0.855; }
        frame 51 { x: 52.3; y: -26.8; skew-x: -2.9; skew-y: 0.3; scale-x: 0.803; scale-y: 0.828; }
        frame 52 { x: 52; y: -25.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 54 { y: -26.8; skew-x: 3.8; scale-x: 0.803; scale-y: 0.807; }
        frame 55 { y: -28.2; skew-x: 7.7; scale-x: 0.807; scale-y: 0.815; }
        frame 56 { x: 52; y: -28.1; skew-x: 6; scale-x: 0.806; scale-y: 0.822; }
        frame 57 { y: -10000; skew-x: 4.5; scale-x: 0.804; scale-y: 0.829; }
        frame 58 { x: -10000; skew-x: 3; scale-x: 0.803; scale-y: 0.837; }
        frame 59 { skew-x: 1.5; scale-x: 0.801; scale-y: 0.844; }
        frame 60 { y: -28; skew-x: 0; scale-x: 0.8; scale-y: 0.851; }
        frame 61 { y: -26.7; skew-x: -2.7; scale-x: 0.802; scale-y: 0.844; }
        frame 62 { y: -25.5; skew-x: -5.9; scale-x: 0.804; scale-y: 0.837; }
        frame 63 { y: -10000; skew-x: -4.7; scale-x: 0.803; scale-y: 0.829; }
        frame 64 { x: 52; y: -25.7; skew-x: -3.4; scale-x: 0.802; scale-y: 0.822; }
        frame 65 { x: -10000; y: -25.8; skew-x: -2.2; scale-x: -10000; scale-y: 0.815; }
        frame 66 { x: 52; y: -25.9; skew-x: -0.9; scale-x: 0.801; scale-y: 0.807; }
        frame 67 { x: -10000; y: -26; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { y: -25.5; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 49.1; y: -25.9; skew-y: -0.7; }
        frame 70 { x: 46.1; y: -26.3; skew-y: -1.7; scale-y: 0.801; }
        frame 71 { x: 43.1; y: -26.7; skew-y: -2.7; scale-y: -10000; }
        frame 72 { x: 40.2; y: -27.1; skew-y: -3.8; scale-y: 0.802; }
        frame 73 { x: 54.6; y: -27.5; skew-y: 0; scale-x: 0.613; scale-y: 0.8; }
        frame 74 { x: 70.1; y: -27.4; skew-y: -10000; scale-x: 0.707; scale-y: -10000; }
        frame 75 { x: 85.6; y: -27.2; scale-x: 0.8; }
        frame 76 { x: 78.5; y: -26.9; scale-x: -10000; }
        frame 77 { x: 71.3; y: -26.6; }
        frame 78 { x: 66.5; y: -26.4; }
        frame 79 { x: 61.7; y: -26.2; }
        frame 80 { x: 56.9; y: -25.9; }
        frame 81 { x: 52; y: -25.7; }
        frame 82 { x: -10000; y: -26; }
        frame 83 { y: -25.9; scale-y: 0.817; }
        frame 84 { y: -26; scale-y: 0.835; }
        frame 85 { y: -1.7; scale-y: 0.817; }
        frame 86 { y: 22.3; scale-y: 0.8; }
        frame 87 { x: 52.1; y: 28.2; scale-y: 0.786; }
        frame 88 { x: 52.3; y: 34; scale-y: 0.773; }
        frame 89 { x: 52.4; y: 40; scale-y: 0.759; }
        frame 90 { x: 52.5; y: 45.8; skew-y: 0.2; scale-y: 0.746; }
        frame 91 { x: 52.4; y: 45.5; skew-y: 0; scale-y: 0.759; }
        frame 92 { x: 52.3; y: 45; skew-y: -10000; scale-y: 0.773; }
        frame 93 { x: 52.1; y: 44.8; scale-y: 0.786; }
        frame 94 { x: 52; y: 44.3; scale-y: 0.8; }
    }
    Track {
        source-name: "Cactus_body3";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 45 { x: 11.1; y: 50; scale-x: 0.8; scale-y: 0.394; cel: 0; image: IMAGE_REANIM_CACTUS_BODY3; }
        frame 46 { x: 11.2; y: 37.1; scale-x: -10000; scale-y: 0.689; cel: -10000; image: none; }
        frame 47 { x: 11.3; y: 24.3; scale-y: 0.985; }
        frame 48 { x: 11.4; y: 11.5; scale-y: 1.281; }
        frame 49 { x: -10000; y: -10000; scale-y: 1.265; }
        frame 50 { x: 11.2; skew-y: -0.2; scale-y: 1.248; }
        frame 51 { x: -10000; y: 14; skew-y: 0; scale-y: 1.201; }
        frame 52 { x: 11.4; y: 16.8; skew-y: -10000; scale-y: 1.153; }
        frame 53 { x: -10000; y: -10000; scale-y: -10000; }
        frame 54 { y: 16.4; scale-y: 1.162; }
        frame 55 { y: 16; scale-y: 1.171; }
        frame 56 { y: 15.7; scale-y: 1.179; }
        frame 57 { y: 15.3; scale-y: 1.188; }
        frame 58 { y: 14.9; scale-y: 1.196; }
        frame 59 { y: 14.5; skew-y: -0; scale-y: 1.205; }
        frame 60 { x: 11.3; y: 14; skew-y: -0.1; scale-y: 1.214; }
        frame 61 { x: 11.4; y: 14.4; skew-y: -0; scale-y: 1.205; }
        frame 62 { x: -10000; y: 14.8; skew-y: 0; scale-y: 1.196; }
        frame 63 { y: 15.1; skew-y: -10000; scale-y: 1.188; }
        frame 64 { y: 15.5; scale-y: 1.179; }
        frame 65 { y: 15.9; scale-y: 1.171; }
        frame 66 { y: 16.3; scale-y: 1.162; }
        frame 67 { y: 16.8; scale-y: 1.153; }
        frame 68 { y: -10000; scale-y: -10000; }
        frame 69 { x: 10.6; skew-y: -0.6; }
        frame 70 { x: 8.5; y: 16.6; skew-y: -3.5; scale-y: 1.155; }
        frame 71 { x: 6.2; y: -10000; skew-y: -6.5; scale-y: 1.158; }
        frame 72 { x: 3.9; y: 16.5; skew-y: -9.6; scale-y: 1.16; }
        frame 73 { x: 12.3; y: 17.9; skew-y: 1; scale-y: 1.104; }
        frame 74 { x: 22.7; y: 15.7; skew-y: 10.3; scale-y: 1.209; }
        frame 75 { x: 33.1; y: 13.4; skew-y: 19.9; scale-y: 1.315; }
        frame 76 { x: 26.7; y: 14; skew-y: 14.6; scale-y: 1.23; }
        frame 77 { x: 21.6; y: 16.2; skew-y: 9.5; scale-y: 1.146; }
        frame 78 { x: 19.1; y: 16.3; skew-y: 7; scale-y: 1.147; }
        frame 79 { x: 16.5; y: 16.4; skew-y: 4.6; scale-y: 1.149; }
        frame 80 { x: 13.9; y: 16.6; skew-y: 2.3; scale-y: 1.151; }
        frame 81 { x: 11.4; y: 16.8; skew-y: 0; scale-y: 1.153; }
        frame 82 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 83 { y: 17.7; scale-y: 1.135; }
        frame 84 { x: 11.3; y: 18.4; skew-y: -0; scale-y: 1.117; }
        frame 85 { x: 11.1; y: 43.8; skew-y: 0; scale-y: 0.465; }
        frame 86 { x: 11.3; y: 57.5; skew-y: -10000; scale-y: 0.049; }
        frame 87 { x: -10000; y: -10000; scale-y: -10000; cel: -1; }
        frame 88 { cel: -10000; }
    }
    Track {
        source-name: "Cactus_body2";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 10; y: 54.9; scale-x: 0.848; scale-y: 0.4; cel: 0; image: IMAGE_REANIM_CACTUS_BODY2; }
        frame 41 { x: 10.2; y: 51.9; scale-x: 0.84; scale-y: 0.508; cel: -10000; image: none; }
        frame 42 { x: 10.4; y: 49; scale-x: 0.832; scale-y: 0.617; }
        frame 43 { x: 10.6; y: 46.2; scale-x: 0.824; scale-y: 0.725; }
        frame 44 { x: 10.8; y: 43.3; scale-x: 0.816; scale-y: 0.834; }
        frame 45 { x: 10.9; y: 40.6; scale-x: 0.808; scale-y: 0.942; }
        frame 46 { x: -10000; y: 25.1; scale-x: 0.805; scale-y: 0.924; }
        frame 47 { x: 11; y: 9.7; scale-x: 0.803; scale-y: 0.906; }
        frame 48 { x: 11.2; y: -5.7; scale-x: 0.8; scale-y: 0.888; }
        frame 49 { x: 10.9; y: -6.8; skew-y: -0.2; scale-x: -10000; scale-y: 0.91; }
        frame 50 { x: 10.7; y: -7.9; skew-y: -0.4; scale-y: 0.931; }
        frame 51 { x: 11; y: -6.8; skew-y: -0.2; scale-y: 0.95; }
        frame 52 { x: 11.2; y: -5.7; skew-y: 0; scale-y: 0.969; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { y: -5.9; scale-y: 0.966; }
        frame 55 { y: -6.1; scale-y: 0.963; }
        frame 56 { y: -6.3; scale-y: 0.96; }
        frame 57 { y: -6.5; scale-y: 0.956; }
        frame 58 { y: -6.8; scale-y: 0.953; }
        frame 59 { y: -7; scale-y: 0.95; }
        frame 60 { y: -7.2; scale-y: 0.946; }
        frame 61 { y: -5.3; scale-y: 0.89; }
        frame 62 { y: -3.5; scale-y: 0.834; }
        frame 63 { y: -3.9; scale-y: 0.861; }
        frame 64 { y: -4.4; scale-y: 0.888; }
        frame 65 { y: -4.8; scale-y: 0.915; }
        frame 66 { y: -5.2; scale-y: 0.942; }
        frame 67 { y: -5.7; scale-y: 0.969; }
        frame 68 { y: -10000; scale-y: -10000; }
        frame 69 { x: 8.4; skew-y: -4.6; scale-y: 0.973; }
        frame 70 { x: 5.8; y: -6; skew-y: -5.5; scale-y: 0.965; }
        frame 71 { x: 3.2; y: -6.2; skew-y: -6.5; scale-y: 0.957; }
        frame 72 { x: 0.5; y: -6.6; skew-y: -7.6; scale-y: 0.95; }
        frame 73 { x: 12.6; y: -8.7; skew-y: 0.8; scale-y: 0.955; }
        frame 74 { x: 26.6; y: -8.6; skew-y: 10.3; scale-y: 0.986; }
        frame 75 { x: 40.8; y: -7.8; skew-y: 19.7; scale-y: 1.019; }
        frame 76 { x: 33.9; y: -10000; skew-y: 16.1; scale-y: 0.969; }
        frame 77 { x: 27; y: -7.5; skew-y: 12.7; scale-y: 0.922; }
        frame 78 { x: 23; y: -7.1; skew-y: 9.5; scale-y: 0.913; }
        frame 79 { x: 19; y: -6.7; skew-y: 6.3; scale-y: 0.905; }
        frame 80 { x: 15; y: -6.2; skew-y: 3; scale-y: 0.896; }
        frame 81 { x: 11.2; y: -5.7; skew-y: 0; scale-y: 0.888; }
        frame 82 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 83 { y: -5.5; scale-y: 0.907; }
        frame 84 { y: -5.3; scale-y: 0.926; }
        frame 85 { y: 18.9; skew-y: 0.3; scale-y: 0.919; }
        frame 86 { y: 43; skew-y: -0.5; scale-y: 0.733; }
        frame 87 { x: 11.3; y: 48.5; skew-y: 0.4; scale-y: 0.582; }
        frame 88 { x: 11.2; y: 53.9; skew-y: 0.1; scale-y: 0.4; }
        frame 89 { x: 11.1; y: 59.3; skew-y: 0; scale-y: 0.218; }
        frame 90 { x: 11.2; y: 64.6; skew-y: -10000; scale-y: 0.035; }
        frame 91 { x: -10000; y: -10000; scale-y: -10000; cel: -1; }
        frame 92 { cel: -10000; }
    }
    Track {
        source-name: "Cactus_arm2_1";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 54.7; y: 32.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CACTUS_ARM2_1; }
        frame 6 { x: 55.5; y: 31.9; skew-x: 3; skew-y: 3; scale-x: -10000; scale-y: 0.807; cel: -10000; image: none; }
        frame 7 { x: 56.5; y: 31.5; skew-x: 6.3; skew-y: 6.3; scale-y: 0.814; }
        frame 8 { x: 56; y: 31.2; skew-x: 5; skew-y: 5; scale-x: 0.799; scale-y: 0.822; }
        frame 9 { x: 55.7; y: 30.9; skew-x: 3.8; skew-y: 3.8; scale-x: 0.8; scale-y: 0.829; }
        frame 10 { x: 55.4; y: 30.6; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: 0.836; }
        frame 11 { x: 55; y: 30.3; skew-x: 1.3; skew-y: 1.3; scale-y: 0.844; }
        frame 12 { x: 54.7; y: 29.9; skew-x: 0; skew-y: 0; scale-y: 0.851; }
        frame 13 { x: 54; y: 30.2; skew-x: -1.7; skew-y: -1.7; scale-y: 0.844; }
        frame 14 { x: 53.3; y: 30.5; skew-x: -3.7; skew-y: -3.7; scale-y: 0.837; }
        frame 15 { x: 53.6; y: 30.9; skew-x: -2.9; skew-y: -2.9; scale-y: 0.829; }
        frame 16 { x: 53.9; y: 31.1; skew-x: -2.2; skew-y: -2.2; scale-y: 0.822; }
        frame 17 { x: 54.1; y: 31.5; skew-x: -1.4; skew-y: -1.4; scale-y: 0.815; }
        frame 18 { x: 54.4; y: 31.8; skew-x: -0.7; skew-y: -0.7; scale-y: 0.807; }
        frame 19 { x: 54.7; y: 32.1; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 55; y: 32; skew-x: 0.8; skew-y: 0.8; }
        frame 22 { x: 55.3; y: 31.9; skew-x: 1.8; skew-y: 1.8; }
        frame 23 { x: 53.7; y: 32; skew-x: 0.5; skew-y: 0; }
        frame 24 { x: 52.3; y: 32.1; skew-x: -0.2; skew-y: -1.4; }
        frame 25 { x: 51; y: 32.5; skew-x: -1.4; skew-y: -3.2; scale-y: 0.801; }
        frame 26 { x: 49.4; y: 32.6; skew-x: -2.4; skew-y: -4.9; scale-y: -10000; }
        frame 27 { x: 48; y: 32.8; skew-x: -3.5; skew-y: -6.7; }
        frame 28 { x: 46.5; y: 33.1; skew-x: -4.7; skew-y: -8.6; scale-y: 0.802; }
        frame 29 { x: 45.5; y: 33.8; skew-x: -8.7; skew-y: -8.7; scale-y: 0.8; }
        frame 30 { x: 55; y: 31.2; skew-x: 7.8; skew-y: 5; scale-x: 0.801; scale-y: 0.799; }
        frame 31 { x: 65.3; y: 29.6; skew-x: 24.8; skew-y: 19.1; scale-x: 0.803; scale-y: -10000; }
        frame 32 { x: 66.5; y: 29.9; skew-x: 27.8; skew-y: 22.8; scale-x: 0.801; scale-y: 0.798; }
        frame 33 { x: 67.5; y: 30.3; skew-x: 31.2; skew-y: 26.5; scale-x: -10000; scale-y: 0.799; }
        frame 34 { x: 64.1; y: 30.4; skew-x: 23.3; skew-y: 19.8; scale-x: 0.8; scale-y: 0.798; }
        frame 35 { x: 60.8; y: 30.8; skew-x: 15.5; skew-y: 13.1; scale-x: -10000; scale-y: 0.799; }
        frame 36 { x: 57.8; y: 31.4; skew-x: 7.8; skew-y: 6.5; scale-y: -10000; }
        frame 37 { x: 54.7; y: 32.1; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 39 { y: 31.9; scale-y: 0.782; }
        frame 40 { x: 55; y: 33.1; scale-y: 0.764; }
        frame 41 { x: 55.2; y: 34.5; skew-y: 0.2; scale-y: 0.746; }
        frame 42 { x: 55.1; y: 28.4; skew-y: 0; scale-y: 0.759; }
        frame 43 { x: 55; y: 22.3; skew-y: -10000; scale-y: 0.773; }
        frame 44 { x: 54.8; y: 16.3; scale-y: 0.786; }
        frame 45 { x: 54.7; y: 10.1; scale-y: 0.8; }
        frame 46 { x: -10000; y: -6.5; scale-y: -10000; }
        frame 47 { y: -22.1; }
        frame 48 { y: -37.7; }
        frame 49 { x: 54.9; y: -40.3; skew-x: 0.5; skew-y: 0.8; scale-y: 0.828; }
        frame 50 { x: 55.1; y: -43; skew-x: 1.1; skew-y: 1.9; scale-y: 0.855; }
        frame 51 { x: 54.9; y: -40.3; skew-x: 0.5; skew-y: 0.8; scale-y: 0.828; }
        frame 52 { x: 54.7; y: -37.7; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { x: 55.5; y: -39; skew-x: 3; skew-y: 3; scale-y: 0.807; }
        frame 55 { x: 56.5; y: -40.3; skew-x: 6.3; skew-y: 6.3; scale-y: 0.814; }
        frame 56 { x: 56.1; y: -40.5; skew-x: 5; skew-y: 5; scale-x: 0.799; scale-y: 0.822; }
        frame 57 { x: 55.8; y: -40.6; skew-x: 3.8; skew-y: 3.8; scale-x: 0.8; scale-y: 0.829; }
        frame 58 { x: 55.4; y: -40.7; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: 0.836; }
        frame 59 { x: 55; y: -40.8; skew-x: 1.3; skew-y: 1.3; scale-y: 0.844; }
        frame 60 { x: 54.7; y: -41; skew-x: 0; skew-y: 0; scale-y: 0.851; }
        frame 61 { x: 54; y: -39.7; skew-x: -1.7; skew-y: -1.7; scale-y: 0.844; }
        frame 62 { x: 53.3; y: -38.4; skew-x: -3.7; skew-y: -3.7; scale-y: 0.837; }
        frame 63 { x: 53.6; y: -38.3; skew-x: -2.9; skew-y: -2.9; scale-y: 0.829; }
        frame 64 { x: 53.9; y: -10000; skew-x: -2.2; skew-y: -2.2; scale-y: 0.822; }
        frame 65 { x: 54.1; skew-x: -1.4; skew-y: -1.4; scale-y: 0.815; }
        frame 66 { x: 54.4; skew-x: -0.7; skew-y: -0.7; scale-y: 0.807; }
        frame 67 { x: 54.7; y: -38.2; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 68 { x: -10000; y: -37.7; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 69 { x: 50.6; y: -38.1; skew-x: -1; skew-y: -1.9; }
        frame 70 { x: 46.5; y: -38.4; skew-x: -2.2; skew-y: -4.2; scale-y: 0.801; }
        frame 71 { x: 42.5; y: -38.6; skew-x: -3.4; skew-y: -6.4; scale-y: -10000; }
        frame 72 { x: 38.5; y: -38.9; skew-x: -4.7; skew-y: -8.6; scale-y: 0.802; }
        frame 73 { x: 48.6; y: -38.6; skew-x: -8.7; skew-y: -8.7; scale-y: 0.8; }
        frame 74 { x: 71.4; y: -40.8; skew-x: 7.8; skew-y: 5; scale-x: 0.801; scale-y: 0.799; }
        frame 75 { x: 95; y: -42; skew-x: 24.8; skew-y: 19.1; scale-x: 0.803; scale-y: -10000; }
        frame 76 { x: 89.4; y: -41.4; skew-x: 27.8; skew-y: 22.8; scale-x: 0.801; scale-y: 0.798; }
        frame 77 { x: 83.8; y: -40.9; skew-x: 31.2; skew-y: 26.5; scale-x: -10000; scale-y: 0.799; }
        frame 78 { x: 76.3; y: -40.5; skew-x: 23.3; skew-y: 19.8; scale-x: 0.8; scale-y: 0.798; }
        frame 79 { x: 68.9; y: -39.9; skew-x: 15.5; skew-y: 13.1; scale-x: -10000; scale-y: 0.799; }
        frame 80 { x: 61.8; y: -39; skew-x: 7.8; skew-y: 6.5; scale-y: -10000; }
        frame 81 { x: 54.7; y: -37.9; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 82 { x: -10000; y: -38.2; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 83 { y: -38.5; scale-y: 0.817; }
        frame 84 { y: -38.7; scale-y: 0.835; }
        frame 85 { y: -14.2; scale-y: 0.817; }
        frame 86 { y: 10.1; scale-y: 0.8; }
        frame 87 { x: 54.8; y: 16.3; scale-y: 0.786; }
        frame 88 { x: 55; y: 22.3; scale-y: 0.773; }
        frame 89 { y: 28.4; scale-y: 0.759; }
        frame 90 { x: 55.2; y: 34.5; skew-y: 0.2; scale-y: 0.746; }
        frame 91 { x: 55.1; y: 33.9; skew-y: 0; scale-y: 0.759; }
        frame 92 { x: 55; y: 33.3; skew-y: -10000; scale-y: 0.773; }
        frame 93 { x: 54.8; y: 32.8; scale-y: 0.786; }
        frame 94 { x: 54.7; y: 32.1; scale-y: 0.8; }
    }
    Track {
        source-name: "body_overlay";
        frame-count: 95;
        frame 0 { x: 17.4; y: 64.5; scale-x: 0.8; scale-y: 0.643; image: IMAGE_REANIM_CACTUS_BODY_OVERLAY; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 39 { x: 17.2; scale-x: 0.818; }
        frame 40 { x: 16.9; scale-x: 0.835; }
        frame 41 { x: 16.6; scale-x: 0.853; }
        frame 42 { x: 16.8; y: 64.4; scale-x: 0.839; }
        frame 43 { x: 17; y: 64.3; scale-x: 0.824; }
        frame 44 { x: 17.2; y: -10000; scale-x: 0.81; }
        frame 45 { x: 17.4; y: 64.2; scale-x: 0.796; image: IMAGE_REANIM_CACTUS_BODY_OVERLAY2; }
        frame 46 { x: 17.9; y: 58.7; scale-x: -10000; scale-y: 1.067; image: none; }
        frame 47 { x: -10000; y: -10000; scale-y: -10000; }
        frame 74 { x: 20.5; y: 58.6; skew-y: 10.3; scale-y: 1.102; }
        frame 75 { x: 23; y: 58.7; skew-y: 20.5; scale-y: 1.139; }
        frame 76 { x: 21.9; y: 58.6; skew-y: 16.3; scale-y: 1.114; }
        frame 77 { x: 20.9; y: 58.7; skew-y: 12.4; scale-y: 1.092; }
        frame 78 { x: 20.1; y: -10000; skew-y: 9.3; scale-y: 1.085; }
        frame 79 { x: 19.3; skew-y: 6; scale-y: 1.079; }
        frame 80 { x: 18.5; y: 58.6; skew-y: 3; scale-y: 1.073; }
        frame 81 { x: 17.9; y: 58.7; skew-y: 0; scale-y: 1.067; }
        frame 82 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 87 { x: 17.4; y: 64.5; scale-x: 0.8; scale-y: 0.643; image: IMAGE_REANIM_CACTUS_BODY_OVERLAY; }
        frame 88 { x: 17.2; y: -10000; scale-x: 0.817; scale-y: -10000; image: none; }
        frame 89 { x: 16.9; scale-x: 0.835; }
        frame 90 { x: 16.7; scale-x: 0.852; }
        frame 91 { x: 16.9; scale-x: 0.839; }
        frame 92 { x: 17; scale-x: 0.826; }
        frame 93 { x: 17.3; scale-x: 0.813; }
        frame 94 { x: 17.4; scale-x: 0.8; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 9.5; y: 7.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CACTUS_BODY1; }
        frame 6 { x: -10000; y: 7; scale-x: -10000; scale-y: 0.807; cel: -10000; image: none; }
        frame 7 { y: 6.4; scale-y: 0.815; }
        frame 8 { y: 5.9; scale-y: 0.822; }
        frame 9 { y: 5.3; scale-y: 0.829; }
        frame 10 { y: 4.8; scale-y: 0.837; }
        frame 11 { y: 4.2; scale-y: 0.844; }
        frame 12 { y: 3.7; scale-y: 0.851; }
        frame 13 { y: 4.3; scale-y: 0.844; }
        frame 14 { y: 4.8; scale-y: 0.837; }
        frame 15 { y: 5.3; scale-y: 0.829; }
        frame 16 { y: 5.9; scale-y: 0.822; }
        frame 17 { y: 6.5; scale-y: 0.815; }
        frame 18 { y: 7; scale-y: 0.807; }
        frame 19 { y: 7.5; scale-y: 0.8; }
        frame 20 { y: -10000; scale-y: -10000; }
        frame 21 { x: 8.4; skew-y: -1; scale-y: 0.801; }
        frame 22 { x: 7.1; y: 7.4; skew-y: -2.2; scale-y: 0.803; }
        frame 23 { x: 5.8; y: 7.5; skew-y: -3.5; scale-y: 0.804; }
        frame 24 { x: 4.5; y: 7.4; skew-y: -4.7; scale-y: 0.806; }
        frame 25 { x: 3.3; y: -10000; skew-y: -6; scale-y: 0.807; }
        frame 26 { x: 1.9; y: 7.3; skew-y: -7.2; scale-y: 0.809; }
        frame 27 { x: 0.7; y: 7.5; skew-y: -8.5; scale-y: 0.81; }
        frame 28 { x: -0.5; y: -10000; skew-y: -9.9; scale-y: 0.812; }
        frame 29 { x: 9.8; y: 6.5; skew-y: 0.3; scale-y: 0.827; }
        frame 30 { x: 20.5; y: -10000; skew-y: 10.5; scale-y: 0.841; }
        frame 31 { x: 31.2; y: 7.5; skew-y: 20.9; scale-y: 0.856; }
        frame 32 { x: 27.5; y: 7.2; skew-y: 17.3; scale-y: 0.846; }
        frame 33 { x: 23.9; y: 7; skew-y: 13.8; scale-y: 0.837; }
        frame 34 { x: 20.2; y: -10000; skew-y: 10.3; scale-y: 0.828; }
        frame 35 { x: 16.6; y: 7.1; skew-y: 6.8; scale-y: 0.818; }
        frame 36 { x: 13; y: 7.2; skew-y: 3.3; scale-y: 0.809; }
        frame 37 { x: 9.5; y: 7.5; skew-y: 0; scale-y: 0.8; }
        frame 38 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 39 { x: 9.1; y: 9.3; scale-x: 0.816; scale-y: 0.773; }
        frame 40 { x: 8.6; y: 11; scale-x: 0.832; scale-y: 0.746; }
        frame 41 { x: 8.3; y: 12.7; skew-y: 0.2; scale-x: 0.848; scale-y: 0.718; }
        frame 42 { x: 8.6; y: 5.7; skew-y: 0; scale-x: 0.836; scale-y: 0.743; }
        frame 43 { x: 8.9; y: -1.3; skew-y: -10000; scale-x: 0.824; scale-y: 0.767; }
        frame 44 { x: 9.3; y: -8.4; scale-x: 0.812; scale-y: 0.791; }
        frame 45 { x: 9.5; y: -15.5; scale-x: 0.8; scale-y: 0.816; }
        frame 46 { x: -10000; y: -31.1; scale-x: -10000; scale-y: 0.811; }
        frame 47 { y: -46.7; scale-y: 0.805; }
        frame 48 { y: -62.3; scale-y: 0.8; }
        frame 49 { y: -65.4; scale-y: 0.828; }
        frame 50 { x: 9.4; y: -68.4; skew-y: 0.2; scale-y: 0.856; }
        frame 51 { x: -10000; y: -65.3; skew-y: 0; scale-y: 0.828; }
        frame 52 { x: 9.5; y: -62.3; skew-y: -10000; scale-y: 0.8; }
        frame 53 { x: -10000; y: -10000; scale-y: -10000; }
        frame 54 { y: -63.3; }
        frame 55 { y: -64.3; }
        frame 56 { y: -64.9; scale-y: 0.81; }
        frame 57 { y: -65.5; scale-y: 0.821; }
        frame 58 { y: -66.1; scale-y: 0.831; }
        frame 59 { y: -66.6; scale-y: 0.841; }
        frame 60 { y: -67.2; scale-y: 0.851; }
        frame 61 { y: -66.2; scale-y: -10000; }
        frame 62 { y: -65.1; }
        frame 63 { y: -64.6; scale-y: 0.841; }
        frame 64 { y: -64.2; scale-y: 0.831; }
        frame 65 { y: -63.8; scale-y: 0.821; }
        frame 66 { y: -63.3; scale-y: 0.81; }
        frame 67 { y: -62.8; scale-y: 0.8; }
        frame 68 { y: -62.3; scale-y: -10000; }
        frame 69 { x: 4.5; y: -62.8; skew-y: -2.2; scale-y: 0.803; }
        frame 70 { x: -0.6; y: -63.3; skew-y: -4.7; scale-y: 0.806; }
        frame 71 { x: -5.7; y: -63.6; skew-y: -7.2; scale-y: 0.809; }
        frame 72 { x: -11; y: -63.9; skew-y: -9.9; scale-y: 0.812; }
        frame 73 { x: 11.2; y: -65; skew-y: 0.3; scale-y: 0.827; }
        frame 74 { x: 35.9; y: -65.1; skew-y: 10.5; scale-y: 0.841; }
        frame 75 { x: 60.8; y: -64.2; skew-y: 20.9; scale-y: 0.856; }
        frame 76 { x: 50; y: -64.1; skew-y: 17.3; scale-y: 0.846; }
        frame 77 { x: 39.4; y: -64; skew-y: 13.8; scale-y: 0.837; }
        frame 78 { x: 31.9; y: -63.9; skew-y: 10.3; scale-y: 0.827; }
        frame 79 { x: 24.4; y: -63.4; skew-y: 6.8; scale-y: 0.818; }
        frame 80 { x: 16.9; y: -63; skew-y: 3.3; scale-y: 0.809; }
        frame 81 { x: 9.5; y: -62.5; skew-y: 0; scale-y: 0.8; }
        frame 82 { x: -10000; y: -62.8; skew-y: -10000; scale-y: -10000; }
        frame 83 { y: -63.6; scale-y: 0.817; }
        frame 84 { y: -64.4; scale-y: 0.835; }
        frame 85 { y: -39.9; scale-y: 0.825; }
        frame 86 { y: -15.5; scale-y: 0.816; }
        frame 87 { x: 9.2; y: -8.4; scale-x: 0.812; scale-y: 0.791; }
        frame 88 { x: 8.8; y: -1.3; scale-x: 0.824; scale-y: 0.767; }
        frame 89 { x: 8.4; y: 5.6; scale-x: 0.836; scale-y: 0.743; }
        frame 90 { x: 8.3; y: 12.7; skew-y: 0.2; scale-x: 0.848; scale-y: 0.718; }
        frame 91 { x: 8.6; y: 11.4; skew-y: 0; scale-x: 0.836; scale-y: 0.739; }
        frame 92 { x: 8.9; y: 10.1; skew-y: -10000; scale-x: 0.824; scale-y: 0.759; }
        frame 93 { x: 9.3; y: 8.8; scale-x: 0.812; scale-y: 0.78; }
        frame 94 { x: 9.5; y: 7.5; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cactus_arm1_2";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 2.7; y: 41.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CACTUS_ARM1_2; }
        frame 6 { x: -10000; y: 41.8; skew-x: -1.7; scale-x: 0.801; scale-y: 0.807; cel: -10000; image: none; }
        frame 7 { y: 42.1; skew-x: -3.8; scale-x: 0.802; scale-y: 0.815; }
        frame 8 { x: 2.6; y: 41.6; skew-x: -2.9; scale-x: 0.801; scale-y: 0.822; }
        frame 9 { x: 2.7; y: 41; skew-x: -2.2; scale-x: -10000; scale-y: 0.829; }
        frame 10 { x: -10000; y: 40.5; skew-x: -1.4; scale-y: 0.837; }
        frame 11 { y: 40; skew-x: -0.7; scale-x: 0.8; scale-y: 0.844; }
        frame 12 { y: 39.6; skew-x: 0; scale-x: -10000; scale-y: 0.851; }
        frame 13 { x: 2.6; y: 38.7; skew-x: 2.8; scale-x: 0.802; scale-y: 0.844; }
        frame 14 { x: 2.7; y: 37.6; skew-x: 5.9; scale-x: 0.804; scale-y: 0.837; }
        frame 15 { x: -10000; y: 38.3; skew-x: 4.5; scale-x: 0.803; scale-y: 0.829; }
        frame 16 { y: 39; skew-x: 3.5; scale-x: 0.802; scale-y: 0.822; }
        frame 17 { x: 2.6; y: 39.8; skew-x: 2.3; scale-x: -10000; scale-y: 0.815; }
        frame 18 { x: 2.7; y: 40.6; skew-x: 1; scale-x: 0.801; scale-y: 0.807; }
        frame 19 { x: -10000; y: 41.3; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 2.3; skew-y: -0.2; }
        frame 22 { x: 2; y: 41.2; skew-y: -0.7; }
        frame 23 { x: 1.5; y: -10000; skew-y: -1.2; scale-y: 0.801; }
        frame 24 { x: 1.1; y: 41.3; skew-y: -1.7; scale-y: -10000; }
        frame 25 { x: 0.7; y: -10000; skew-y: -2.2; }
        frame 26 { x: 0.2; y: 41.2; skew-y: -2.7; }
        frame 27 { x: -0; y: 41.3; skew-y: -3.2; }
        frame 28 { x: -0.4; y: -10000; skew-y: -3.8; scale-y: 0.802; }
        frame 29 { x: 3.9; skew-y: 0; scale-y: 0.8; }
        frame 30 { x: 9.8; y: 41.1; skew-x: 0.5; skew-y: 0.5; scale-x: 0.671; scale-y: -10000; }
        frame 31 { x: 15.7; y: 40.9; skew-x: 1.3; skew-y: 1.3; scale-x: 0.542; }
        frame 32 { x: 13.6; y: -10000; skew-x: 1; skew-y: 1; scale-x: 0.585; }
        frame 33 { x: 11.4; skew-x: 0.8; skew-y: 0.8; scale-x: 0.628; }
        frame 34 { x: 9.2; y: 41; skew-x: 0.5; skew-y: 0.5; scale-x: 0.671; }
        frame 35 { x: 7; skew-x: 0.3; skew-y: 0.3; scale-x: 0.714; }
        frame 36 { x: 4.8; y: 41.1; skew-x: 0; skew-y: 0; scale-x: 0.757; }
        frame 37 { x: 2.7; y: 41.3; skew-x: -10000; skew-y: -10000; scale-x: 0.8; }
        frame 38 { x: -10000; y: -10000; scale-x: -10000; }
        frame 39 { y: 40.9; skew-x: 0.8; scale-y: 0.782; }
        frame 40 { x: 2.5; y: 41.5; skew-x: 1.8; scale-y: 0.764; }
        frame 41 { x: 2.4; y: 42; skew-x: 2.9; skew-y: 0.2; scale-x: 0.801; scale-y: 0.746; }
        frame 42 { x: 2.5; y: 36.4; skew-x: 2; skew-y: 0; scale-x: -10000; scale-y: 0.759; }
        frame 43 { x: -10000; y: 30.7; skew-x: 1.3; skew-y: -10000; scale-x: 0.8; scale-y: 0.773; }
        frame 44 { x: 2.6; y: 25.1; skew-x: 0.6; scale-x: -10000; scale-y: 0.786; }
        frame 45 { x: 2.7; y: 19.3; skew-x: 0; scale-y: 0.8; }
        frame 46 { x: -10000; y: 2.6; skew-x: 4.1; scale-x: 0.802; scale-y: -10000; }
        frame 47 { y: -12.9; skew-x: 2; scale-x: 0.801; }
        frame 48 { y: -28.6; skew-x: 0; scale-x: 0.8; }
        frame 49 { x: 3; y: -30.4; skew-x: -10000; skew-y: 0.3; scale-x: -10000; scale-y: 0.828; }
        frame 50 { x: 3.4; y: -32.1; skew-y: 0.9; scale-y: 0.855; }
        frame 51 { x: 3; y: -30.3; skew-y: 0.3; scale-y: 0.828; }
        frame 52 { x: 2.7; y: -28.6; skew-y: 0; scale-y: 0.8; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { y: -29.1; skew-x: -1.7; scale-x: 0.801; scale-y: 0.807; }
        frame 55 { y: -29.7; skew-x: -3.8; scale-x: 0.802; scale-y: 0.815; }
        frame 56 { x: 2.6; y: -30; skew-x: -2.9; scale-x: 0.801; scale-y: 0.822; }
        frame 57 { x: 2.7; y: -30.4; skew-x: -2.2; scale-x: -10000; scale-y: 0.829; }
        frame 58 { x: -10000; y: -30.7; skew-x: -1.4; scale-y: 0.837; }
        frame 59 { y: -31.1; skew-x: -0.7; scale-x: 0.8; scale-y: 0.844; }
        frame 60 { y: -31.3; skew-x: 0; scale-x: -10000; scale-y: 0.851; }
        frame 61 { x: 2.6; y: -31.2; skew-x: 2.8; scale-x: 0.802; scale-y: 0.844; }
        frame 62 { x: 2.7; y: -10000; skew-x: 5.9; scale-x: 0.804; scale-y: 0.837; }
        frame 63 { x: -10000; y: -30.7; skew-x: 4.5; scale-x: 0.803; scale-y: 0.829; }
        frame 64 { y: -30.4; skew-x: 3.5; scale-x: 0.802; scale-y: 0.822; }
        frame 65 { x: 2.6; y: -29.9; skew-x: 2.3; scale-x: -10000; scale-y: 0.815; }
        frame 66 { x: 2.7; y: -29.4; skew-x: 1; scale-x: 0.801; scale-y: 0.807; }
        frame 67 { x: -10000; y: -29.1; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { y: -28.6; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: -0; y: -29; skew-y: -0.7; }
        frame 70 { x: -2.8; y: -29.4; skew-y: -1.7; scale-y: 0.801; }
        frame 71 { x: -5.7; y: -29.8; skew-y: -2.7; scale-y: -10000; }
        frame 72 { x: -8.5; y: -30.2; skew-y: -3.8; scale-y: 0.802; }
        frame 73 { x: 3.9; y: -10000; skew-y: 0; scale-y: 0.8; }
        frame 74 { x: 24.6; y: -30.4; skew-x: 0.5; skew-y: 0.5; scale-x: 0.671; scale-y: -10000; }
        frame 75 { x: 45.3; y: -30.7; skew-x: 1.3; skew-y: 1.3; scale-x: 0.542; }
        frame 76 { x: 34.8; y: -30.4; skew-x: 1; skew-y: 1; scale-x: 0.585; }
        frame 77 { x: 24.3; y: -30.2; skew-x: 0.8; skew-y: 0.8; scale-x: 0.628; }
        frame 78 { x: 18.9; y: -29.8; skew-x: 0.5; skew-y: 0.5; scale-x: 0.671; }
        frame 79 { x: 13.5; y: -29.5; skew-x: 0.3; skew-y: 0.3; scale-x: 0.714; }
        frame 80 { x: 8.2; y: -29.1; skew-x: 0; skew-y: 0; scale-x: 0.757; }
        frame 81 { x: 2.7; y: -28.8; skew-x: -10000; skew-y: -10000; scale-x: 0.8; }
        frame 82 { x: -10000; y: -29.1; scale-x: -10000; }
        frame 83 { y: -10000; scale-y: 0.817; }
        frame 84 { y: -29.2; scale-y: 0.835; }
        frame 85 { y: -4.9; scale-y: 0.817; }
        frame 86 { y: 19.3; scale-y: 0.8; }
        frame 87 { x: 2.6; y: 25; skew-x: 0.6; scale-y: 0.786; }
        frame 88 { x: 2.5; y: 30.7; skew-x: 1.3; scale-y: 0.773; }
        frame 89 { x: -10000; y: 36.3; skew-x: 2; scale-x: 0.801; scale-y: 0.759; }
        frame 90 { x: 2.4; y: 42; skew-x: 2.9; skew-y: 0.2; scale-x: -10000; scale-y: 0.746; }
        frame 91 { x: 2.5; y: 41.9; skew-x: 2; skew-y: 0; scale-y: 0.759; }
        frame 92 { x: -10000; y: 41.7; skew-x: 1.3; skew-y: -10000; scale-x: 0.8; scale-y: 0.773; }
        frame 93 { x: 2.6; y: 41.5; skew-x: 0.6; scale-x: -10000; scale-y: 0.786; }
        frame 94 { x: 2.7; y: 41.3; skew-x: 0; scale-y: 0.8; }
    }
    Track {
        source-name: "Cactus_arm1_1";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -10.1; y: 17.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CACTUS_ARM1_1; }
        frame 6 { x: -11.1; y: 18.1; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: 0.807; cel: -10000; image: none; }
        frame 7 { x: -12.1; y: 18.9; skew-x: -5; skew-y: -5; scale-y: 0.814; }
        frame 8 { x: -11.7; y: 17.9; skew-x: -3.9; skew-y: -3.9; scale-y: 0.822; }
        frame 9 { x: -11.3; y: 17; skew-x: -2.9; skew-y: -2.9; scale-y: 0.829; }
        frame 10 { x: -10.9; y: 16; skew-x: -1.9; skew-y: -1.9; scale-y: 0.837; }
        frame 11 { x: -10.5; y: 15; skew-x: -0.9; skew-y: -0.9; scale-y: 0.844; }
        frame 12 { x: -10.1; y: 14.1; skew-x: 0; skew-y: 0; scale-y: 0.851; }
        frame 13 { x: -8.4; y: 12.9; skew-x: 2.3; skew-y: 2.3; scale-y: 0.844; }
        frame 14 { x: -6.8; y: 11.7; skew-x: 4.6; skew-y: 4.6; scale-y: 0.837; }
        frame 15 { x: -7.6; y: 12.9; skew-x: 3.5; skew-y: 3.5; scale-y: 0.829; }
        frame 16 { x: -8.1; y: 13.9; skew-x: 2.8; skew-y: 2.8; scale-y: 0.822; }
        frame 17 { x: -8.8; y: 15; skew-x: 1.8; skew-y: 1.8; scale-y: 0.815; }
        frame 18 { x: -9.5; y: 16.2; skew-x: 0.8; skew-y: 0.8; scale-y: 0.807; }
        frame 19 { x: -10.1; y: 17.3; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: -8.4; y: 16.7; skew-x: 1.8; skew-y: 1.8; }
        frame 22 { x: -6.6; y: 16.2; skew-x: 3.8; skew-y: 3.8; }
        frame 23 { x: -8.1; y: 16.4; skew-x: 3; skew-y: 2.5; }
        frame 24 { x: -9.4; y: 16.5; skew-x: 2.5; skew-y: 1.3; }
        frame 25 { x: -10.8; y: 16.7; skew-x: 1.8; skew-y: 0; scale-y: 0.801; }
        frame 26 { x: -12.1; y: 16.9; skew-x: 1.3; skew-y: -1.2; scale-y: -10000; }
        frame 27 { x: -13.5; y: 17.2; skew-x: 0.5; skew-y: -2.4; }
        frame 28 { x: -14.8; y: 17.3; skew-x: 0; skew-y: -3.8; scale-y: 0.802; }
        frame 29 { x: -10000; y: 20.8; skew-x: -11; skew-y: -11; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: 1.2; y: 16.6; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 18.3; y: 14.5; skew-x: 23.1; skew-y: 23.1; }
        frame 32 { x: 16.3; y: -10000; skew-x: 21.8; skew-y: 21.8; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 14.4; y: 14.6; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 8.1; y: 15.1; skew-x: 15.3; skew-y: 15.3; }
        frame 35 { x: 1.9; y: 15.6; skew-x: 10.3; skew-y: 10.3; scale-x: 0.799; scale-y: 0.799; }
        frame 36 { x: -4; y: 16.4; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: -10.1; y: 17.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { y: 17; }
        frame 40 { x: -10.3; y: 17.7; }
        frame 41 { x: -10.5; y: 18.3; }
        frame 42 { x: -10.4; y: 12.5; }
        frame 43 { x: -10.3; y: 6.8; }
        frame 44 { x: -10.2; y: 1; }
        frame 45 { x: -10.1; y: -4.6; }
        frame 46 { x: -9.9; y: -21; }
        frame 47 { x: -10; y: -36.8; }
        frame 48 { x: -10.1; y: -52.6; }
        frame 49 { x: -9; y: -56; skew-x: 1.3; skew-y: 1.5; scale-y: 0.828; }
        frame 50 { x: -7.7; y: -59.6; skew-x: 2.7; skew-y: 3.3; scale-x: 0.799; scale-y: 0.855; }
        frame 51 { x: -8.9; y: -56; skew-x: 1.3; skew-y: 1.5; scale-x: 0.8; scale-y: 0.828; }
        frame 52 { x: -10.1; y: -52.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.8; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { x: -11.1; y: -52.8; skew-x: -2.4; skew-y: -2.4; scale-y: 0.807; }
        frame 55 { x: -12.1; y: -53; skew-x: -5; skew-y: -5; scale-y: 0.814; }
        frame 56 { x: -11.7; y: -53.8; skew-x: -3.9; skew-y: -3.9; scale-y: 0.822; }
        frame 57 { x: -11.3; y: -54.5; skew-x: -2.9; skew-y: -2.9; scale-y: 0.829; }
        frame 58 { x: -10.9; y: -55.3; skew-x: -1.9; skew-y: -1.9; scale-y: 0.837; }
        frame 59 { x: -10.5; y: -56.1; skew-x: -0.9; skew-y: -0.9; scale-y: 0.844; }
        frame 60 { x: -10.1; y: -56.8; skew-x: 0; skew-y: 0; scale-y: 0.851; }
        frame 61 { x: -8.4; y: -57; skew-x: 2.3; skew-y: 2.3; scale-y: 0.844; }
        frame 62 { x: -6.8; y: -57.1; skew-x: 4.6; skew-y: 4.6; scale-y: 0.837; }
        frame 63 { x: -7.5; y: -56.3; skew-x: 3.5; skew-y: 3.5; scale-y: 0.829; }
        frame 64 { x: -8.2; y: -55.5; skew-x: 2.8; skew-y: 2.8; scale-y: 0.822; }
        frame 65 { x: -8.9; y: -54.7; skew-x: 1.8; skew-y: 1.8; scale-y: 0.815; }
        frame 66 { x: -9.5; y: -53.8; skew-x: 0.8; skew-y: 0.8; scale-y: 0.807; }
        frame 67 { x: -10.1; y: -53.1; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 68 { x: -10000; y: -52.6; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 69 { x: -13.2; y: -53; skew-y: -0.7; }
        frame 70 { x: -16.4; y: -53.4; skew-y: -1.7; scale-y: 0.801; }
        frame 71 { x: -19.6; y: -53.8; skew-y: -2.7; scale-y: -10000; }
        frame 72 { x: -22.9; y: -54.2; skew-y: -3.8; scale-y: 0.802; }
        frame 73 { x: -14.8; y: -50.6; skew-x: -11; skew-y: -11; scale-x: 0.799; scale-y: 0.799; }
        frame 74 { x: 16; y: -54.9; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 47.9; y: -57.1; skew-x: 23.1; skew-y: 23.1; }
        frame 76 { x: 37.5; y: -56.8; skew-x: 21.8; skew-y: 21.8; scale-x: 0.798; scale-y: 0.798; }
        frame 77 { x: 27.3; y: -56.5; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 17.9; y: -55.8; skew-x: 15.3; skew-y: 15.3; }
        frame 79 { x: 8.4; y: -55.1; skew-x: 10.3; skew-y: 10.3; scale-x: 0.799; scale-y: 0.799; }
        frame 80 { x: -0.8; y: -53.9; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -10.1; y: -52.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 82 { x: -10000; y: -53.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 83 { y: -54.1; scale-y: 0.817; }
        frame 84 { y: -55.1; scale-y: 0.835; }
        frame 85 { y: -29.8; scale-y: 0.817; }
        frame 86 { y: -4.6; scale-y: 0.8; }
        frame 87 { x: -10.2; y: 1; scale-y: -10000; }
        frame 88 { x: -10.3; y: 6.8; }
        frame 89 { x: -10.4; y: 12.5; }
        frame 90 { x: -10.5; y: 18.3; }
        frame 91 { x: -10.4; y: 18; }
        frame 92 { x: -10.3; y: 17.8; }
        frame 93 { x: -10.2; y: 17.5; }
        frame 94 { x: -10.1; y: 17.3; }
    }
    Track {
        source-name: "Cactus_mouth";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 48.5; y: 25; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CACTUS_MOUTH; }
        frame 6 { x: -10000; y: 24.8; skew-x: 2.1; scale-x: 0.801; scale-y: 0.815; cel: -10000; image: none; }
        frame 7 { y: 24.5; skew-x: 4.4; scale-x: 0.802; scale-y: 0.829; }
        frame 8 { y: 24; skew-x: 3.5; scale-x: -10000; scale-y: 0.834; }
        frame 9 { y: 23.6; skew-x: 2.5; scale-x: 0.801; scale-y: 0.838; }
        frame 10 { y: 23.2; skew-x: 1.8; scale-x: -10000; scale-y: 0.843; }
        frame 11 { x: 48.4; y: 22.7; skew-x: 0.8; scale-x: 0.8; scale-y: 0.847; }
        frame 12 { x: 48.5; y: 22.4; skew-x: 0; scale-x: -10000; scale-y: 0.851; }
        frame 13 { x: -10000; y: 22.6; skew-x: -2.2; scale-x: 0.801; scale-y: 0.844; }
        frame 14 { x: 48.6; y: 22.8; skew-x: -4.9; scale-x: 0.803; scale-y: 0.837; }
        frame 15 { x: -10000; y: 23.3; skew-x: -3.7; scale-x: 0.802; scale-y: 0.829; }
        frame 16 { x: 48.5; y: 23.8; skew-x: -2.7; scale-x: -10000; scale-y: 0.822; }
        frame 17 { x: -10000; y: 24.2; skew-x: -1.7; scale-x: 0.801; scale-y: 0.815; }
        frame 18 { y: 24.6; skew-x: -0.7; scale-x: -10000; scale-y: 0.807; }
        frame 19 { y: 25; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 47.6; scale-x: 1.128; }
        frame 22 { x: 46.9; scale-x: 1.457; }
        frame 23 { x: 46.7; scale-x: 1.333; }
        frame 24 { x: 45.3; skew-y: -0.7; scale-x: 1.227; }
        frame 25 { x: 43.8; y: 25; skew-y: -1.4; scale-x: 1.12; scale-y: 0.801; }
        frame 26 { x: 42.4; skew-y: -2.2; scale-x: 1.013; scale-y: -10000; }
        frame 27 { x: 40.9; y: -10000; skew-y: -2.9; scale-x: 0.907; }
        frame 28 { x: 39.5; skew-y: -3.8; scale-x: 0.8; scale-y: 0.802; }
        frame 29 { x: 46.9; y: 25.1; skew-y: -2.4; scale-x: 2.065; scale-y: 0.782; }
        frame 30 { x: 54.2; y: -10000; skew-y: -1.2; scale-x: 3.33; scale-y: 0.762; }
        frame 31 { x: 61.5; y: 25.2; skew-y: 0; scale-x: 4.595; scale-y: 0.743; }
        frame 32 { x: 59.5; y: -10000; skew-y: -10000; scale-x: 4.171; scale-y: 0.752; }
        frame 33 { x: 57.5; y: 25.1; scale-x: 3.746; scale-y: 0.762; }
        frame 34 { x: 55.3; y: -10000; scale-x: 3.01; scale-y: 0.771; }
        frame 35 { x: 53; scale-x: 2.273; scale-y: 0.781; }
        frame 36 { x: 50.7; scale-x: 1.537; scale-y: 0.79; }
        frame 37 { x: 48.5; y: 25; scale-x: 0.8; scale-y: 0.8; }
        frame 38 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 48.7; y: 26.5; scale-y: 0.773; }
        frame 41 { x: 49; y: 27.8; skew-y: 0.2; scale-y: 0.746; }
        frame 42 { x: 48.9; y: 21.5; skew-y: 0; scale-y: 0.759; }
        frame 43 { x: 48.7; y: 15.2; skew-y: -10000; scale-y: 0.773; }
        frame 44 { x: 48.6; y: 8.9; scale-y: 0.786; }
        frame 45 { x: 48.5; y: 2.6; scale-y: 0.8; }
        frame 46 { x: -10000; y: -12.9; scale-y: -10000; }
        frame 47 { y: -28.9; }
        frame 48 { y: -44.8; }
        frame 49 { x: 48.2; y: -47.1; skew-y: 0.3; scale-x: 1.078; scale-y: 0.828; }
        frame 50 { x: 48; y: -49.5; skew-y: 0.9; scale-x: 1.356; scale-y: 0.855; }
        frame 51 { x: 48.1; y: -47.2; skew-y: 0.3; scale-x: 1.078; scale-y: 0.828; }
        frame 52 { x: 48.5; y: -44.8; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 54 { y: -46.1; skew-x: 2.1; scale-x: 0.801; scale-y: 0.815; }
        frame 55 { y: -47.4; skew-x: 4.4; scale-x: 0.802; scale-y: 0.829; }
        frame 56 { y: -47.6; skew-x: 3.5; scale-x: -10000; scale-y: 0.834; }
        frame 57 { y: -47.8; skew-x: 2.5; scale-x: 0.801; scale-y: 0.838; }
        frame 58 { y: -48; skew-x: 1.8; scale-x: -10000; scale-y: 0.843; }
        frame 59 { x: 48.4; y: -48.3; skew-x: 0.8; scale-x: 0.8; scale-y: 0.847; }
        frame 60 { x: 48.5; y: -48.6; skew-x: 0; scale-x: -10000; scale-y: 0.851; }
        frame 61 { x: -10000; y: -47.4; skew-x: -2.2; scale-x: 0.801; scale-y: 0.844; }
        frame 62 { x: 48.6; y: -46; skew-x: -4.9; scale-x: 0.803; scale-y: 0.837; }
        frame 63 { x: -10000; y: -45.9; skew-x: -3.7; scale-x: 0.802; scale-y: 0.829; }
        frame 64 { x: 48.5; y: -45.7; skew-x: -2.7; scale-x: -10000; scale-y: 0.822; }
        frame 65 { x: -10000; y: -45.5; skew-x: -1.7; scale-x: 0.801; scale-y: 0.815; }
        frame 66 { y: -10000; skew-x: -0.7; scale-x: -10000; scale-y: 0.807; }
        frame 67 { y: -45.3; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { y: -44.8; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 44.1; y: -45.2; skew-y: -0.7; }
        frame 70 { x: 40; y: -45.6; skew-y: -1.7; scale-y: 0.801; }
        frame 71 { x: 35.6; y: -46; skew-y: -2.7; scale-y: -10000; }
        frame 72 { x: 31.4; y: -46.4; skew-y: -3.8; scale-y: 0.802; }
        frame 73 { x: 49.9; y: -10000; skew-y: -2.4; scale-x: 2.873; scale-y: 0.782; }
        frame 74 { x: 70.7; y: -46.3; skew-y: -1.2; scale-x: 3.734; scale-y: 0.762; }
        frame 75 { x: 91.2; y: -10000; skew-y: 0; scale-x: 4.595; scale-y: 0.743; }
        frame 76 { x: 80.8; y: -46.1; skew-y: -10000; scale-x: 4.171; scale-y: 0.752; }
        frame 77 { x: 70.3; y: -46; scale-x: 3.746; scale-y: 0.762; }
        frame 78 { x: 65; y: -45.8; scale-x: 3.01; scale-y: 0.771; }
        frame 79 { x: 59.5; y: -45.5; scale-x: 2.273; scale-y: 0.781; }
        frame 80 { x: 54; y: -45.3; scale-x: 1.537; scale-y: 0.79; }
        frame 81 { x: 48.5; y: -45; scale-x: 0.8; scale-y: 0.8; }
        frame 82 { x: -10000; y: -45.3; scale-x: -10000; scale-y: -10000; }
        frame 83 { y: -45.8; skew-x: 4.8; scale-x: 0.806; scale-y: 0.817; }
        frame 84 { y: -46.3; skew-x: 9.9; scale-x: 0.812; scale-y: 0.835; }
        frame 85 { y: -21.8; skew-x: 4.8; scale-x: 0.806; scale-y: 0.817; }
        frame 86 { y: 2.6; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: 48.6; y: 8.9; skew-x: -10000; scale-x: -10000; scale-y: 0.786; }
        frame 88 { x: 48.7; y: 15.3; scale-y: 0.773; }
        frame 89 { x: 48.9; y: 21.5; scale-y: 0.759; }
        frame 90 { x: 49; y: 27.8; skew-y: 0.2; scale-y: 0.746; }
        frame 91 { x: 48.9; y: 27.1; skew-y: 0; scale-y: 0.759; }
        frame 92 { x: 48.7; y: 26.4; skew-y: -10000; scale-y: 0.773; }
        frame 93 { x: 48.6; y: 25.7; scale-y: 0.786; }
        frame 94 { x: 48.5; y: 25; scale-y: 0.8; }
    }
    Track {
        source-name: "Cactus_lips";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 50.4; y: 19.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CACTUS_LIPS; }
        frame 6 { x: 50.8; y: 19.6; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: 0.807; cel: -10000; image: none; }
        frame 7 { x: 51.3; y: 19.5; skew-x: 4.6; skew-y: 4.6; scale-y: 0.814; }
        frame 8 { x: 51.1; y: 18.8; skew-x: 3.5; skew-y: 3.5; scale-y: 0.822; }
        frame 9 { x: 50.9; y: 18.3; skew-x: 2.8; skew-y: 2.8; scale-y: 0.829; }
        frame 10 { x: 50.8; y: 17.6; skew-x: 1.8; skew-y: 1.8; scale-y: 0.837; }
        frame 11 { x: 50.5; y: 17.1; skew-x: 0.8; skew-y: 0.8; scale-y: 0.844; }
        frame 12 { x: 50.4; y: 16.5; skew-x: 0; skew-y: 0; scale-y: 0.851; }
        frame 13 { x: 49.9; y: 16.2; skew-x: -2.2; skew-y: -2.2; scale-y: 0.844; }
        frame 14 { x: 49.5; y: 15.9; skew-x: -4.4; skew-y: -4.4; scale-y: 0.837; }
        frame 15 { x: 49.6; y: 16.6; skew-x: -3.4; skew-y: -3.4; scale-y: 0.829; }
        frame 16 { x: 49.9; y: 17.3; skew-x: -2.5; skew-y: -2.5; scale-y: 0.822; }
        frame 17 { x: 50; y: 18; skew-x: -1.7; skew-y: -1.7; scale-y: 0.815; }
        frame 18 { x: 50.2; y: 18.7; skew-x: -0.7; skew-y: -0.7; scale-y: 0.807; }
        frame 19 { x: 50.4; y: 19.5; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 50.5; y: 19.4; scale-x: 0.786; scale-y: 0.805; }
        frame 22 { x: -10000; y: -10000; scale-x: 0.773; scale-y: 0.81; }
        frame 23 { x: 50.6; y: 19.3; scale-x: 0.759; scale-y: 0.815; }
        frame 24 { x: 48.5; y: 19.1; skew-y: -0.7; scale-x: 0.734; scale-y: 0.824; }
        frame 25 { x: 46.4; y: 19; skew-y: -1.4; scale-x: 0.709; scale-y: 0.833; }
        frame 26 { x: 44.3; y: 18.9; skew-y: -2.2; scale-x: 0.685; scale-y: 0.843; }
        frame 27 { x: 42.3; y: 18.8; skew-y: -2.9; scale-x: 0.66; scale-y: 0.852; }
        frame 28 { x: 40.1; y: 18.7; skew-y: -3.8; scale-x: 0.635; scale-y: 0.861; }
        frame 29 { x: 51.5; y: 19.5; skew-y: -2.4; scale-x: -10000; scale-y: 0.801; }
        frame 30 { x: 62.9; y: 20.3; skew-y: -1.2; scale-y: 0.74; }
        frame 31 { x: 74.2; y: 21.1; skew-y: 0; scale-y: 0.68; }
        frame 32 { x: 70.8; y: 20.8; skew-y: -10000; scale-x: 0.663; scale-y: 0.7; }
        frame 33 { x: 67.3; y: 20.6; scale-x: 0.69; scale-y: 0.72; }
        frame 34 { x: 63; y: 20.3; scale-x: 0.718; scale-y: 0.74; }
        frame 35 { x: 58.8; y: 20.1; scale-x: 0.745; scale-y: 0.76; }
        frame 36 { x: 54.5; y: 19.8; scale-x: 0.773; scale-y: 0.78; }
        frame 37 { x: 50.4; y: 19.5; scale-x: 0.8; scale-y: 0.8; }
        frame 38 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { y: 18.7; }
        frame 40 { x: 50.7; y: 20.7; scale-y: 0.773; }
        frame 41 { x: 51.1; y: 22.7; skew-y: 0.2; scale-y: 0.746; }
        frame 42 { x: 50.9; y: 16.4; skew-y: 0; scale-y: 0.759; }
        frame 43 { x: 50.7; y: 10.1; skew-y: -10000; scale-y: 0.773; }
        frame 44 { x: 50.5; y: 3.8; scale-y: 0.786; }
        frame 45 { x: 50.4; y: -2.4; scale-y: 0.8; }
        frame 46 { x: -10000; y: -19.7; scale-y: -10000; }
        frame 47 { y: -35.1; }
        frame 48 { y: -50.6; }
        frame 49 { x: 50.5; y: -53.9; skew-y: 0.3; scale-y: 0.828; }
        frame 50 { x: -10000; y: -57.2; skew-y: 0.9; scale-y: 0.855; }
        frame 51 { y: -53.9; skew-y: 0.3; scale-y: 0.828; }
        frame 52 { x: 50.4; y: -50.6; skew-y: 0; scale-y: 0.8; }
        frame 53 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 54 { x: 50.8; y: -51.4; skew-x: 2.3; skew-y: 2.3; scale-y: 0.807; }
        frame 55 { x: 51.3; y: -52.4; skew-x: 4.6; skew-y: 4.6; scale-y: 0.814; }
        frame 56 { x: 51; y: -52.8; skew-x: 3.5; skew-y: 3.5; scale-y: 0.822; }
        frame 57 { x: 50.9; y: -53.2; skew-x: 2.8; skew-y: 2.8; scale-y: 0.829; }
        frame 58 { x: 50.8; y: -53.7; skew-x: 1.8; skew-y: 1.8; scale-y: 0.837; }
        frame 59 { x: 50.5; y: -54.1; skew-x: 0.8; skew-y: 0.8; scale-y: 0.844; }
        frame 60 { x: 50.4; y: -54.5; skew-x: 0; skew-y: 0; scale-y: 0.851; }
        frame 61 { x: 49.9; y: -53.7; skew-x: -2.2; skew-y: -2.2; scale-y: 0.844; }
        frame 62 { x: 49.5; y: -53; skew-x: -4.4; skew-y: -4.4; scale-y: 0.837; }
        frame 63 { x: 49.7; y: -52.6; skew-x: -3.4; skew-y: -3.4; scale-y: 0.829; }
        frame 64 { x: 49.9; y: -52.2; skew-x: -2.5; skew-y: -2.5; scale-y: 0.822; }
        frame 65 { x: 50; y: -51.7; skew-x: -1.7; skew-y: -1.7; scale-y: 0.815; }
        frame 66 { x: 50.2; y: -51.3; skew-x: -0.7; skew-y: -0.7; scale-y: 0.807; }
        frame 67 { x: 50.4; y: -50.9; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 68 { x: -10000; y: -50.6; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 69 { x: 45.8; y: -51.1; skew-y: -0.7; scale-x: 0.759; scale-y: 0.815; }
        frame 70 { x: 41.3; y: -51.6; skew-y: -1.7; scale-x: 0.718; scale-y: 0.831; }
        frame 71 { x: 36.7; y: -52.2; skew-y: -2.7; scale-x: 0.676; scale-y: 0.846; }
        frame 72 { x: 32; y: -52.8; skew-y: -3.8; scale-x: 0.635; scale-y: 0.861; }
        frame 73 { x: 56; y: -52; skew-y: -2.4; scale-x: -10000; scale-y: 0.801; }
        frame 74 { x: 79.8; y: -51.2; skew-y: -1.2; scale-y: 0.74; }
        frame 75 { x: 103.8; y: -50.4; skew-y: 0; scale-y: 0.68; }
        frame 76 { x: 92; y: -50.5; skew-y: -10000; scale-x: 0.663; scale-y: 0.7; }
        frame 77 { x: 80.2; y: -50.6; scale-x: 0.69; scale-y: 0.72; }
        frame 78 { x: 72.7; y: -50.5; scale-x: 0.718; scale-y: 0.74; }
        frame 79 { x: 65.3; y: -50.6; scale-x: 0.745; scale-y: 0.76; }
        frame 80 { x: 57.8; y: -50.5; scale-x: 0.773; scale-y: 0.78; }
        frame 81 { x: 50.4; y: -50.6; scale-x: 0.8; scale-y: 0.8; }
        frame 82 { x: -10000; y: -50.9; scale-x: -10000; scale-y: -10000; }
        frame 83 { y: -51.9; scale-y: 0.817; }
        frame 84 { y: -53; scale-y: 0.835; }
        frame 85 { y: -27.7; scale-y: 0.817; }
        frame 86 { y: -2.4; scale-y: 0.8; }
        frame 87 { x: 50.5; y: 3.8; scale-y: 0.786; }
        frame 88 { x: 50.7; y: 10.1; scale-y: 0.773; }
        frame 89 { x: 50.9; y: 16.4; scale-y: 0.759; }
        frame 90 { x: 51.1; y: 22.7; skew-y: 0.2; scale-y: 0.746; }
        frame 91 { x: 50.9; y: 22.6; skew-y: 0; scale-y: 0.759; }
        frame 92 { x: 50.7; y: 22.3; skew-y: -10000; scale-y: 0.773; }
        frame 93 { x: 50.5; y: 20.9; scale-y: 0.786; }
        frame 94 { x: 50.4; y: 19.5; scale-y: 0.8; }
    }
    Track {
        source-name: "Cactus_blink";
        frame-count: 95;
        frame 0 { cel: -1; }
        frame 1 { x: 24; y: 18; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CACTUS_BLINK1; }
        frame 2 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_CACTUS_BLINK2; }
        frame 3 { image: IMAGE_REANIM_CACTUS_BLINK1; }
        frame 4 { cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 30 { x: 34.3; y: 17; skew-x: 0.8; skew-y: 22.6; scale-y: 0.862; cel: 0; }
        frame 31 { x: 41.6; y: 18; skew-x: 0; skew-y: 24.2; scale-y: 0.877; cel: -10000; image: IMAGE_REANIM_CACTUS_BLINK2; }
        frame 32 { x: 38.3; y: 17; skew-x: 0.8; skew-y: 12.3; scale-y: 0.817; image: IMAGE_REANIM_CACTUS_BLINK1; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 34 { cel: -10000; }
        frame 74 { x: 45.9; y: -54.8; skew-y: 16.3; scale-y: 0.83; cel: 0; }
        frame 75 { x: 71.3; y: -54.1; skew-x: 0; skew-y: 24.2; scale-y: 0.877; cel: -10000; image: IMAGE_REANIM_CACTUS_BLINK2; }
        frame 76 { x: 58.5; y: -54.4; skew-x: 0.8; skew-y: 14.3; scale-y: 0.823; image: IMAGE_REANIM_CACTUS_BLINK1; }
        frame 77 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 78 { cel: -10000; }
    }
}
