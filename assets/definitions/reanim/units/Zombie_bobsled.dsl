export component Zombie_bobsled {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 176;
        frame 15 { cel: -1; }
        frame 16 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 176;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 15 { cel: 0; }
        frame 16 { cel: -10000; }
        frame 54 { cel: -1; }
        frame 55 { cel: -10000; }
    }
    Track {
        source-name: "anim_push";
        frame-count: 176;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 54 { cel: 0; }
        frame 55 { cel: -10000; }
        frame 78 { cel: -1; }
        frame 79 { cel: -10000; }
    }
    Track {
        source-name: "anim_jump";
        frame-count: 176;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 78 { cel: 0; }
        frame 79 { cel: -10000; }
        frame 102 { cel: -1; }
        frame 103 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 176;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 102 { cel: 0; }
        frame 103 { cel: -10000; }
        frame 134 { cel: -1; }
        frame 135 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 176;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 134 { cel: 0; }
        frame 135 { cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 176;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 15 { x: -59.8; y: 110.1; cel: 0; }
        frame 16 { x: -58.7; y: -10000; cel: -10000; }
        frame 17 { x: -57.6; }
        frame 18 { x: -56.6; }
        frame 19 { x: -55.5; }
        frame 20 { x: -52.7; }
        frame 21 { x: -49.9; }
        frame 22 { x: -47.2; }
        frame 23 { x: -45.9; }
        frame 24 { x: -44.6; }
        frame 25 { x: -43.3; }
        frame 26 { x: -42.1; }
        frame 27 { x: -40.9; }
        frame 28 { x: -39.7; }
        frame 29 { x: -38.5; }
        frame 30 { x: -37.3; }
        frame 31 { x: -36.1; }
        frame 32 { x: -35; }
        frame 33 { x: -33.8; }
        frame 34 { x: -32.6; }
        frame 35 { x: -31.2; }
        frame 36 { x: -29.8; }
        frame 37 { x: -28.4; }
        frame 38 { x: -27; }
        frame 39 { x: -25.6; }
        frame 40 { x: -23.6; }
        frame 41 { x: -21.5; }
        frame 42 { x: -19.5; }
        frame 43 { x: -17.4; }
        frame 44 { x: -15.4; }
        frame 45 { x: -13.3; }
        frame 46 { x: -11.3; }
        frame 47 { x: -9.2; }
        frame 48 { x: -7.4; }
        frame 49 { x: -5.6; }
        frame 50 { x: -3.8; }
        frame 51 { x: -2; }
        frame 52 { x: -0.2; }
        frame 53 { x: 1.5; }
        frame 54 { x: -56.2; }
        frame 55 { x: -52.4; }
        frame 56 { x: -48.9; }
        frame 57 { x: -45.5; }
        frame 58 { x: -42.1; }
        frame 59 { x: -40.5; }
        frame 60 { x: -38.9; }
        frame 61 { x: -37.3; }
        frame 62 { x: -35.8; }
        frame 63 { x: -34.2; }
        frame 64 { x: -32.6; }
        frame 65 { x: -30.9; }
        frame 66 { x: -29.1; }
        frame 67 { x: -27.4; }
        frame 68 { x: -25.6; }
        frame 69 { x: -22.9; }
        frame 70 { x: -20.2; }
        frame 71 { x: -17.4; }
        frame 72 { x: -14.7; }
        frame 73 { x: -12; }
        frame 74 { x: -9.2; }
        frame 75 { x: -5.6; }
        frame 76 { x: -2; }
        frame 77 { x: 1.5; }
        frame 78 { x: -10000; cel: -1; }
        frame 79 { cel: -10000; }
        frame 102 { cel: 0; }
        frame 103 { cel: -10000; }
        frame 134 { cel: -1; }
        frame 135 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_dolphinrider_innerarm_lower";
        frame-count: 176;
        frame 0 { x: 23.1; y: 71.6; scale-x: 0.8; scale-y: 0.876; image: IMAGE_REANIM_ZOMBIE_BOBSLED_INNERARM_LOWER; }
        frame 1 { x: 22.8; y: 72.2; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 22.4; y: 72.9; skew-x: -0.7; skew-y: -0.7; }
        frame 3 { x: 22; y: 73.5; skew-x: -1.2; skew-y: -1.2; }
        frame 4 { x: 21.7; y: 74.2; skew-x: -1.7; skew-y: -1.7; }
        frame 5 { x: 21.3; y: 74.8; skew-x: -2.2; skew-y: -2.2; }
        frame 6 { x: 20.9; y: 75.4; skew-x: -2.7; skew-y: -2.7; }
        frame 7 { x: 20.6; y: 76.3; skew-x: -3.4; skew-y: -3.4; }
        frame 8 { x: 21; y: 75.7; skew-x: -2.7; skew-y: -2.7; }
        frame 9 { x: 21.4; y: 75; skew-x: -2.2; skew-y: -2.2; }
        frame 10 { x: 21.7; y: 74.3; skew-x: -1.7; skew-y: -1.7; }
        frame 11 { x: 22; y: 73.7; skew-x: -1.2; skew-y: -1.2; }
        frame 12 { x: 22.4; y: 73.1; skew-x: -0.7; skew-y: -0.7; }
        frame 13 { x: 22.8; y: 72.3; skew-x: -0.2; skew-y: -0.2; }
        frame 14 { x: 23.1; y: 71.6; skew-x: 0; skew-y: 0; }
        frame 15 { x: 27.5; y: 71.8; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.875; }
        frame 16 { x: 27.4; y: 71.2; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 27.1; y: 70.4; skew-x: -10000; skew-y: -10000; }
        frame 18 { x: 27; y: 69.6; skew-x: 1; skew-y: 1; }
        frame 19 { x: 26.8; y: 68.9; skew-x: 1.1; skew-y: 1.1; }
        frame 20 { x: 26.4; y: 67.7; skew-x: 1; skew-y: 1; scale-x: 0.798; scale-y: 0.874; }
        frame 21 { x: 26; y: 66.6; skew-x: 1.3; skew-y: 1.3; scale-x: 0.797; scale-y: 0.873; }
        frame 22 { x: 25.6; y: 65.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 25.3; y: 64.3; skew-x: 1.5; skew-y: 1.5; scale-x: 0.796; scale-y: 0.872; }
        frame 24 { x: 26.1; y: 62.5; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: 0.871; }
        frame 25 { x: 26.8; y: 61; skew-x: 17.1; skew-y: 17.1; scale-x: 0.795; scale-y: -10000; }
        frame 26 { x: 27.5; y: 59.5; skew-x: 25; skew-y: 25; scale-x: 0.796; }
        frame 27 { x: 24.7; y: 64.1; skew-x: 24.5; skew-y: 24.5; scale-x: 0.794; scale-y: 0.869; }
        frame 28 { x: 21.9; y: 68.8; skew-x: 24; skew-y: 24; scale-x: 0.793; scale-y: -10000; }
        frame 29 { x: 19.3; y: 73.5; skew-x: 23.5; skew-y: 23.5; scale-x: 0.794; }
        frame 30 { x: 17.9; y: 78.4; skew-x: 17.6; skew-y: 17.6; scale-x: 0.793; }
        frame 31 { x: 18.5; y: 78.8; skew-x: 8.5; skew-y: 8.5; scale-x: 0.794; }
        frame 32 { x: 19.5; y: 78.7; skew-x: -0.3; skew-y: -0.3; scale-x: 0.795; scale-y: 0.87; }
        frame 33 { x: 20.8; y: 78.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 22; y: 78; skew-x: 0.6; skew-y: 0.6; }
        frame 35 { x: 24; y: 76.3; skew-x: -0.9; skew-y: -0.9; scale-x: 0.794; }
        frame 36 { x: 26.1; y: 74.6; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: 0.869; }
        frame 37 { x: 28.2; y: 72.9; skew-x: -3.9; skew-y: -3.9; scale-y: -10000; }
        frame 38 { x: 30.3; y: 71.2; skew-x: -5.4; skew-y: -5.4; scale-x: 0.793; }
        frame 39 { x: 32.3; y: 69.5; skew-x: -7.1; skew-y: -7.1; scale-x: -10000; }
        frame 40 { x: 34.4; y: 68.7; skew-x: -7.9; skew-y: -7.9; scale-x: 0.792; scale-y: 0.867; }
        frame 41 { x: 36.4; y: 67.8; skew-x: -8.9; skew-y: -8.9; scale-x: 0.791; scale-y: 0.866; }
        frame 42 { x: 38.3; y: 66.8; skew-x: -9.7; skew-y: -9.7; scale-x: 0.79; scale-y: 0.865; }
        frame 43 { x: 40.2; y: 65.9; skew-x: -10.7; skew-y: -10.7; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 35.7; y: 69.8; skew-x: -12.2; skew-y: -12.2; scale-x: 0.789; scale-y: 0.881; }
        frame 45 { x: 31.1; y: 73.6; skew-x: -13.7; skew-y: -13.7; scale-x: 0.79; scale-y: 0.898; }
        frame 46 { x: 26.5; y: 77.6; skew-x: -15.5; skew-y: -15.5; scale-x: 0.791; scale-y: 0.916; }
        frame 47 { x: 21; y: 81.5; skew-x: -12.7; skew-y: -12.7; scale-x: -10000; scale-y: 0.891; }
        frame 48 { x: 21.1; y: 81; skew-x: -1.6; skew-y: -1.6; scale-x: 0.792; scale-y: 0.868; }
        frame 49 { x: 22.4; y: 79.2; skew-x: -0.9; skew-y: -0.9; scale-x: 0.794; scale-y: 0.869; }
        frame 50 { x: 23.6; y: 77.3; skew-x: -0.2; skew-y: -0.2; scale-x: 0.795; scale-y: 0.871; }
        frame 51 { x: 24.8; y: 75.5; skew-x: 0.1; skew-y: 0.1; scale-x: 0.796; scale-y: 0.872; }
        frame 52 { x: 26.1; y: 73.7; skew-x: 0.8; skew-y: 0.8; scale-x: 0.798; scale-y: 0.874; }
        frame 53 { x: 27.5; y: 71.8; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.875; }
        frame 54 { x: 15.4; y: 77.9; skew-x: 46.9; skew-y: 46.9; scale-x: 0.797; scale-y: 0.873; }
        frame 55 { x: 15.6; y: 77.1; skew-x: 45.6; skew-y: 45.6; scale-x: 0.796; scale-y: 0.9; }
        frame 56 { x: 15.7; y: 76.3; skew-x: 44.4; skew-y: 44.4; scale-x: 0.795; scale-y: 0.929; }
        frame 57 { x: 15.9; y: 75.6; skew-x: 43.1; skew-y: 43.1; scale-x: -10000; scale-y: 0.958; }
        frame 58 { x: 16.1; y: 74.8; skew-x: 41.9; skew-y: 41.9; scale-y: 0.987; }
        frame 59 { x: 16.2; y: 74; skew-x: 40.6; skew-y: 40.6; scale-y: 1.015; }
        frame 60 { x: 16.4; y: 73.2; skew-x: 39.4; skew-y: 39.4; scale-x: 0.796; scale-y: 1.046; }
        frame 61 { x: 19.2; y: 78.7; skew-x: 56.7; skew-y: 56.7; scale-x: 0.793; scale-y: 0.983; }
        frame 62 { x: 21; y: 84.7; skew-x: 74; skew-y: 74; scale-x: -10000; scale-y: 0.923; }
        frame 63 { x: 20.7; y: 83.5; skew-x: 70.7; skew-y: 70.7; scale-y: 0.935; }
        frame 64 { x: 20.4; y: 82.3; skew-x: 67.2; skew-y: 67.2; scale-y: 0.947; }
        frame 65 { x: 20; y: 81.1; skew-x: 63.7; skew-y: 63.7; scale-y: 0.959; }
        frame 66 { x: 19.6; y: 79.9; skew-x: 60.2; skew-y: 60.2; scale-y: 0.971; }
        frame 67 { x: 19.1; y: 78.8; skew-x: 56.7; skew-y: 56.7; scale-y: 0.983; }
        frame 68 { x: 18.6; y: 77.6; skew-x: 53.2; skew-y: 53.2; scale-y: 0.995; }
        frame 69 { x: 18.1; y: 76.6; skew-x: 49.9; skew-y: 49.9; scale-x: 0.794; scale-y: 1.008; }
        frame 70 { x: 17.5; y: 75.4; skew-x: 46.4; skew-y: 46.4; scale-x: -10000; scale-y: 1.02; }
        frame 71 { x: 16.8; y: 74.3; skew-x: 42.9; skew-y: 42.9; scale-y: 1.032; }
        frame 72 { x: 16.4; y: 73.2; skew-x: 39.4; skew-y: 39.4; scale-x: 0.796; scale-y: 1.046; }
        frame 73 { x: 19.2; y: 78.7; skew-x: 56.7; skew-y: 56.7; scale-x: 0.793; scale-y: 0.983; }
        frame 74 { x: 21; y: 84.7; skew-x: 74; skew-y: 74; scale-x: -10000; scale-y: 0.923; }
        frame 75 { x: 19.3; y: 82.3; skew-x: 65; skew-y: 65; scale-y: 0.905; }
        frame 76 { x: 17.3; y: 80; skew-x: 55.9; skew-y: 55.9; scale-x: 0.795; scale-y: 0.889; }
        frame 77 { x: 15.4; y: 77.9; skew-x: 46.9; skew-y: 46.9; scale-x: 0.797; scale-y: 0.873; }
        frame 78 { x: 33.7; y: 55.4; skew-x: -6.3; skew-y: 3; scale-x: 0.809; scale-y: 0.874; }
        frame 79 { x: 30.1; y: 47.6; skew-x: -16; skew-y: -6.7; scale-x: 0.807; scale-y: 0.872; }
        frame 80 { x: 26.8; y: 40.1; skew-x: -25.9; skew-y: -16.5; scale-x: 0.806; scale-y: 0.871; }
        frame 81 { x: 23.6; y: 32.8; skew-x: -35.8; skew-y: -26.4; scale-x: -10000; scale-y: 0.87; }
        frame 82 { x: 26.6; y: 18; skew-x: -47.3; skew-y: -38; scale-x: 0.803; scale-y: 0.868; }
        frame 83 { x: 30; y: 3.5; skew-x: -58.8; skew-y: -49.5; scale-x: 0.802; scale-y: 0.867; }
        frame 84 { x: 33.9; y: -10.6; skew-x: -70.4; skew-y: -61; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 34.1; y: -12.8; skew-x: -74.9; skew-y: -65.6; scale-x: 0.801; scale-y: 0.865; }
        frame 86 { x: 34.5; y: -15; skew-x: -79.4; skew-y: -70; scale-x: 0.802; scale-y: 0.866; }
        frame 87 { x: 34.8; y: -14.5; skew-x: -79.1; skew-y: -69.8; scale-x: 0.801; scale-y: 0.865; }
        frame 88 { x: 35; y: -14; skew-x: -78.9; skew-y: -69.6; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 35.3; y: -13.6; skew-x: -78.6; skew-y: -69.3; scale-x: 0.8; scale-y: 0.864; }
        frame 90 { x: -10000; y: -13.2; skew-x: -78.4; skew-y: -69; scale-x: -10000; scale-y: 0.865; }
        frame 91 { y: 13.9; skew-x: -91.4; skew-y: -82.1; scale-x: 0.799; scale-y: 0.863; }
        frame 92 { x: 35.9; y: 41; skew-x: -104.4; skew-y: -94.9; scale-x: 0.797; scale-y: 0.861; }
        frame 93 { x: 36.9; y: 68.1; skew-x: -117.5; skew-y: -108.1; scale-x: 0.796; scale-y: 0.86; }
        frame 94 { x: 58.2; y: 95.5; skew-x: 56.9; skew-y: 66.3; scale-x: 0.794; scale-y: 0.857; }
        frame 95 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 96 { cel: -10000; }
        frame 102 { x: 27.5; y: 71.8; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.875; cel: 0; }
        frame 103 { x: 30.5; y: 70.9; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 104 { x: 33.5; y: 70; skew-x: 5.5; skew-y: 5.5; scale-x: 0.798; scale-y: 0.874; }
        frame 105 { x: 36.5; y: 69; skew-x: 7.6; skew-y: 7.6; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 37.5; y: 73.6; skew-x: 3.8; skew-y: 3.8; scale-x: 0.797; scale-y: 0.873; }
        frame 107 { x: 38.5; y: 78.2; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 39.6; y: 82.9; skew-x: -3.1; skew-y: -3.1; scale-x: 0.796; scale-y: 0.872; }
        frame 109 { x: 37.1; y: 89.6; skew-x: -7.2; skew-y: -7.9; scale-x: 0.805; scale-y: 0.864; }
        frame 110 { x: 34.7; y: 96.3; skew-x: -11.4; skew-y: -12.9; scale-x: 0.815; scale-y: 0.855; }
        frame 111 { x: 32.5; y: 103.3; skew-x: -15.6; skew-y: -18; scale-x: 0.824; scale-y: 0.848; }
        frame 112 { x: 32.8; y: 101.8; skew-x: -16.2; skew-y: -17.2; scale-x: 0.809; scale-y: 0.858; }
        frame 113 { x: 33.1; y: 100.5; skew-x: -16.7; skew-y: -16.7; scale-x: 0.795; scale-y: 0.87; }
        frame 114 { x: 33.6; y: 99.1; skew-x: -5.7; skew-y: -5.7; scale-x: 0.794; scale-y: -10000; }
        frame 115 { x: 34.3; y: 98.1; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: 0.869; }
        frame 116 { x: 40.6; y: 96.7; skew-x: 7.5; skew-y: 7.5; scale-x: 0.793; scale-y: -10000; }
        frame 117 { x: 47; y: 95.1; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: 0.868; }
        frame 118 { x: 53.3; y: 93.6; skew-x: 12.6; skew-y: 12.6; scale-x: 0.792; scale-y: 0.867; }
        frame 119 { x: 59.6; y: 92.2; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 66.5; y: 90.8; skew-x: 33.3; skew-y: 33.3; scale-x: 0.79; scale-y: 0.865; }
        frame 121 { x: 72.8; y: 90.5; skew-x: 51.2; skew-y: 51.2; scale-x: 0.789; scale-y: 0.864; }
        frame 122 { x: 78.7; y: 91.1; skew-x: 69.2; skew-y: 69.2; scale-x: 0.79; scale-y: 0.865; }
        frame 123 { x: 85; y: 95.1; skew-x: 78.9; skew-y: 78.9; scale-x: 0.789; scale-y: 0.864; }
        frame 124 { x: 90.8; y: 99.3; skew-x: 88.5; skew-y: 88.5; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: 96.5; y: 103.7; skew-x: 97.8; skew-y: 97.8; }
        frame 126 { x: 101.8; y: 108.1; skew-x: 107.5; skew-y: 107.5; scale-x: 0.788; scale-y: 0.863; }
        frame 127 { x: 106.8; y: 112.5; skew-x: 117.1; skew-y: 117.1; scale-x: 0.789; scale-y: 0.864; }
        frame 128 { x: 105.6; y: 118.6; skew-x: 104.5; skew-y: 104.3; scale-x: 0.757; scale-y: 0.882; }
        frame 129 { x: 103.7; y: 124.5; skew-x: 92; skew-y: 91.6; scale-x: 0.726; scale-y: 0.901; }
        frame 130 { x: -10000; y: -10000; skew-x: -10000; skew-y: 91.5; scale-x: -10000; scale-y: -10000; }
        frame 131 { skew-y: 91.6; }
        frame 132 { skew-y: 91.5; }
        frame 133 { skew-y: 91.6; }
        frame 134 { x: 36.3; y: 66.6; skew-x: 71.1; skew-y: 61.8; scale-x: 0.779; scale-y: 0.935; }
        frame 135 { x: 36.9; y: 66.1; skew-x: 71.2; skew-y: 61.9; scale-x: 0.778; scale-y: 0.934; }
        frame 136 { x: 37.6; y: 65.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.933; }
        frame 137 { x: 38.2; y: 64.9; scale-x: 0.777; scale-y: -10000; }
        frame 138 { x: 38.9; y: 64.3; scale-x: -10000; }
        frame 139 { x: 39.5; y: 63.6; skew-x: 71.4; skew-y: 62; scale-y: 0.932; }
        frame 140 { x: 40.2; y: 63.1; skew-x: 71.3; skew-y: -10000; scale-y: 0.933; }
        frame 141 { x: 41.4; y: 62.5; skew-x: 70.2; skew-y: 60.9; scale-x: 0.776; scale-y: 0.932; }
        frame 142 { x: 42.5; y: 62; skew-x: 68.9; skew-y: 59.6; scale-x: -10000; scale-y: 0.931; }
        frame 143 { x: 43.5; y: 61.4; skew-x: 67.7; skew-y: 58.4; scale-y: -10000; }
        frame 144 { x: 44.5; y: 60.8; skew-x: 66.4; skew-y: 57.1; scale-x: 0.775; }
        frame 145 { x: 45.5; y: 60.1; skew-x: 65.1; skew-y: 55.8; scale-x: 0.776; scale-y: 0.932; }
        frame 146 { x: 44.7; y: 59.8; skew-x: 63.5; skew-y: 54.2; scale-x: 0.774; scale-y: 0.93; }
        frame 147 { x: 43.9; y: 59.4; skew-x: 61.9; skew-y: 52.7; scale-x: -10000; scale-y: 0.929; }
        frame 148 { x: 43.1; y: 59; skew-x: 60.4; skew-y: 51.1; scale-x: 0.773; scale-y: -10000; }
        frame 149 { x: 42.2; y: 58.6; skew-x: 58.8; skew-y: 49.5; scale-x: 0.774; }
        frame 150 { x: 41.6; y: 59.3; skew-x: 58.9; skew-y: 49.6; scale-x: 0.773; scale-y: 0.928; }
        frame 151 { x: 41.1; y: 59.7; skew-x: 58.8; skew-y: 49.5; scale-x: 0.774; scale-y: 0.929; }
        frame 152 { x: 40.6; y: 60.5; skew-x: 61.7; skew-y: 52.4; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 40.1; y: 61.5; skew-x: 64.7; skew-y: 55.2; scale-y: 0.93; }
        frame 154 { x: 39.6; y: 62.3; skew-x: 67.4; skew-y: 58.2; scale-x: 0.775; scale-y: -10000; }
        frame 155 { x: 39.1; y: 63.3; skew-x: 70.4; skew-y: 61; scale-x: 0.776; scale-y: 0.931; }
        frame 156 { x: 38.5; y: 64.3; skew-x: 73.2; skew-y: 63.9; scale-x: 0.777; scale-y: 0.932; }
        frame 157 { x: 38; y: 65.2; skew-x: 76.2; skew-y: 66.7; scale-x: -10000; scale-y: 0.933; }
        frame 158 { x: 37.5; y: 66.2; skew-x: 78.9; skew-y: 69.6; scale-x: 0.779; scale-y: 0.935; }
        frame 159 { x: 37.4; y: 65.7; skew-x: 85.7; skew-y: 76.4; scale-x: 0.778; scale-y: 0.934; }
        frame 160 { x: 36.9; y: 65.1; skew-x: 92.3; skew-y: 83.2; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 36.4; y: 64.8; skew-x: 99; skew-y: 89.9; scale-x: 0.777; }
        frame 162 { x: 35.7; y: 64.3; skew-x: 105.8; skew-y: 96.5; scale-x: -10000; scale-y: 0.933; }
        frame 163 { x: 34.8; y: 63.9; skew-x: 112.5; skew-y: 103.3; scale-x: 0.776; scale-y: 0.932; }
        frame 164 { x: 33.8; y: 63.6; skew-x: 119.3; skew-y: 109.8; scale-x: -10000; scale-y: -10000; }
        frame 165 { x: 32.5; y: 63.2; skew-x: 126; skew-y: 116.7; }
        frame 166 { x: 30.8; y: 65.8; skew-x: 125.1; skew-y: 115.8; scale-x: 0.775; scale-y: 0.931; }
        frame 167 { x: 28.9; y: 68.3; skew-x: 124.1; skew-y: 114.8; scale-x: 0.774; scale-y: 0.93; }
        frame 168 { x: 27.1; y: 71; skew-x: 123.1; skew-y: 113.8; scale-x: -10000; scale-y: 0.929; }
        frame 169 { x: 25.4; y: 73.6; skew-x: 122.3; skew-y: 113; scale-y: 0.93; }
        frame 170 { x: 26.8; y: 73.2; skew-x: 124.3; skew-y: 115; scale-x: 0.773; scale-y: 0.929; }
        frame 171 { x: 28.2; y: 72.8; skew-x: 126.3; skew-y: 117; scale-x: 0.774; scale-y: 0.93; }
        frame 172 { x: 31.3; y: 71; skew-x: 112.5; skew-y: 103.1; scale-x: -10000; scale-y: -10000; }
        frame 173 { x: 33.8; y: 69.2; skew-x: 98.6; skew-y: 89.5; scale-x: 0.776; scale-y: 0.933; }
        frame 174 { x: 35.4; y: 67.7; skew-x: 85; skew-y: 75.7; scale-x: 0.778; scale-y: -10000; }
        frame 175 { x: 36.3; y: 66.6; skew-x: 71.1; skew-y: 61.8; scale-x: 0.779; scale-y: 0.935; }
    }
    Track {
        source-name: "Zombie_dolphinrider_innerarm_hand";
        frame-count: 176;
        frame 0 { x: 16.5; y: 86.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BOBSLED_INNERARM_HAND; }
        frame 1 { x: -10000; y: 87.5; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 16.4; y: 88; skew-x: 0.5; skew-y: 0.5; }
        frame 3 { x: -10000; y: 88.7; skew-x: 0.8; skew-y: 0.8; }
        frame 4 { y: 89.3; skew-x: 1.3; skew-y: 1.3; }
        frame 5 { y: 89.9; skew-x: 1.5; skew-y: 1.5; }
        frame 6 { x: 16.3; y: 90.5; skew-x: 1.8; skew-y: 1.8; }
        frame 7 { x: -10000; y: 91.1; skew-x: 2.3; skew-y: 2.3; }
        frame 8 { y: 90.4; skew-x: 1.8; skew-y: 1.8; }
        frame 9 { y: 89.8; skew-x: 1.5; skew-y: 1.5; }
        frame 10 { y: 89.3; skew-x: 1.3; skew-y: 1.3; }
        frame 11 { y: 88.6; skew-x: 0.8; skew-y: 0.8; }
        frame 12 { x: 16.4; y: 88; skew-x: 0.5; skew-y: 0.5; }
        frame 13 { x: -10000; y: 87.3; skew-x: 0.3; skew-y: 0.3; }
        frame 14 { x: 16.5; y: 86.8; skew-x: 0; skew-y: 0; }
        frame 15 { x: 19.8; y: 88.8; skew-x: -9.2; skew-y: -9.2; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 19.7; y: 88.3; skew-x: -10.4; skew-y: -10.4; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { x: 19.5; y: 88; skew-x: -11.7; skew-y: -11.7; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 19.3; y: 87.5; skew-x: -13; skew-y: -13; }
        frame 19 { x: 19.2; y: 87.1; skew-x: -14.4; skew-y: -14.4; }
        frame 20 { x: 18.8; y: 86.2; skew-x: -15.7; skew-y: -15.7; scale-x: 0.797; scale-y: 0.797; }
        frame 21 { x: 18.6; y: 85.3; skew-x: -17; skew-y: -17; scale-x: 0.796; scale-y: 0.796; }
        frame 22 { x: 18.2; y: 84.5; skew-x: -18.4; skew-y: -18.4; scale-x: 0.795; scale-y: 0.795; }
        frame 23 { x: 18; y: 83.6; skew-x: -19.7; skew-y: -19.7; scale-x: 0.796; scale-y: 0.796; }
        frame 24 { x: 16.5; y: 79.2; skew-x: -6.9; skew-y: -6.9; scale-x: 0.795; scale-y: 0.795; }
        frame 25 { x: 15.4; y: 75.2; skew-x: 5.8; skew-y: 5.8; scale-x: 0.794; scale-y: 0.794; }
        frame 26 { x: 14.6; y: 71.8; skew-x: 18.7; skew-y: 18.7; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 12.5; y: 75.7; skew-x: 24; skew-y: 24; scale-x: 0.792; scale-y: 0.792; }
        frame 28 { x: 10.3; y: 79.9; skew-x: 29.3; skew-y: 29.3; scale-x: 0.79; scale-y: 0.79; }
        frame 29 { x: 8.4; y: 84; skew-x: 34.8; skew-y: 34.8; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 7.8; y: 90; skew-x: 23.8; skew-y: 23.8; }
        frame 31 { x: 10.3; y: 92.6; skew-x: 9.5; skew-y: 9.5; scale-x: 0.791; scale-y: 0.791; }
        frame 32 { x: 13.1; y: 95.3; skew-x: -4.4; skew-y: -4.4; scale-x: 0.792; scale-y: 0.792; }
        frame 33 { x: 14.1; y: -10000; skew-x: -6.4; skew-y: -6.4; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 15.1; skew-x: -8.5; skew-y: -8.5; }
        frame 35 { x: 17.6; y: 93.8; skew-x: -10.9; skew-y: -10.9; scale-x: 0.791; scale-y: 0.791; }
        frame 36 { x: 20.2; y: 92.4; skew-x: -13.5; skew-y: -13.5; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 22.7; y: 91.1; skew-x: -16.2; skew-y: -16.2; scale-x: 0.79; scale-y: 0.79; }
        frame 38 { x: 25.3; y: 89.8; skew-x: -18.7; skew-y: -18.7; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 28; y: 88.6; skew-x: -21.3; skew-y: -21.3; }
        frame 40 { x: 30.3; y: 87.3; skew-x: -21; skew-y: -21; scale-x: 0.788; scale-y: 0.788; }
        frame 41 { x: 32.5; y: 86; skew-x: -20.7; skew-y: -20.7; scale-x: 0.787; scale-y: 0.787; }
        frame 42 { x: 34.7; y: 84.7; skew-x: -20.4; skew-y: -20.4; scale-x: 0.786; scale-y: 0.786; }
        frame 43 { x: 36.9; y: 83.3; skew-x: -20.2; skew-y: -20.2; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 32.8; y: 87.7; skew-x: -23; skew-y: -23; scale-x: 0.785; scale-y: 0.785; }
        frame 45 { x: 28.8; y: 92.3; skew-x: -26; skew-y: -26; scale-x: 0.786; scale-y: 0.786; }
        frame 46 { x: 24.9; y: 96.8; skew-x: -29.1; skew-y: -29.1; scale-x: 0.787; scale-y: 0.787; }
        frame 47 { x: 18.4; y: 100; skew-x: -24.4; skew-y: -24.4; scale-x: 0.788; scale-y: 0.788; }
        frame 48 { x: 14.9; y: 98; skew-x: -11.6; skew-y: -11.6; scale-x: 0.79; scale-y: 0.79; }
        frame 49 { x: 16; y: 96.2; skew-x: -11; skew-y: -11; scale-x: 0.791; scale-y: 0.791; }
        frame 50 { x: 17; y: 94.4; skew-x: -10.5; skew-y: -10.5; scale-x: 0.793; scale-y: 0.793; }
        frame 51 { x: 18; y: 92.7; skew-x: -10; skew-y: -10; scale-x: 0.795; scale-y: 0.795; }
        frame 52 { x: 19.1; y: 90.9; skew-x: -9.7; skew-y: -9.7; scale-x: 0.796; scale-y: 0.796; }
        frame 53 { x: 19.8; y: 88.8; skew-x: -9.2; skew-y: -9.2; scale-x: 0.799; scale-y: 0.799; }
        frame 54 { x: -18.5; y: 89.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BOBSLED_INNERARM_HAND2; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 78 { x: 28.2; y: 66.8; skew-x: 23.1; skew-y: 23.1; scale-x: 0.798; scale-y: 0.798; image: IMAGE_REANIM_ZOMBIE_BOBSLED_INNERARM_HAND; }
        frame 79 { x: 26.7; y: 59.5; skew-x: 13.3; skew-y: 13.3; scale-x: 0.796; scale-y: 0.796; image: none; }
        frame 80 { x: 25.4; y: 52.5; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 24.4; y: 45.8; skew-x: -6.1; skew-y: -6.1; scale-x: 0.795; scale-y: 0.795; }
        frame 82 { x: 29.3; y: 33.1; skew-x: -13.2; skew-y: -13.2; scale-x: 0.793; scale-y: 0.793; }
        frame 83 { x: 34.4; y: 20.6; skew-x: -20.4; skew-y: -20.4; scale-x: 0.791; scale-y: 0.791; }
        frame 84 { x: 39.7; y: 8.3; skew-x: -27.7; skew-y: -27.7; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 37.5; y: 3.3; skew-x: -32.2; skew-y: -32.2; scale-x: 0.79; scale-y: 0.79; }
        frame 86 { x: 35.4; y: -1.5; skew-x: -36.7; skew-y: -36.7; scale-x: 0.791; scale-y: 0.791; }
        frame 87 { x: 38.6; y: -2.3; skew-x: -36.5; skew-y: -36.5; scale-x: 0.789; scale-y: 0.789; }
        frame 88 { x: 41.6; y: -3.2; skew-x: -36.2; skew-y: -36.2; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 44.8; y: -4.1; skew-x: -36; skew-y: -36; }
        frame 90 { x: 47.9; y: -5.1; skew-x: -35.7; skew-y: -35.7; scale-x: 0.79; scale-y: 0.79; }
        frame 91 { x: 28.7; y: 27.8; skew-x: -56.3; skew-y: -56.3; scale-x: 0.787; scale-y: 0.787; }
        frame 92 { x: 49.1; y: 44.4; skew-x: -76.9; skew-y: -76.9; scale-x: 0.785; scale-y: 0.785; }
        frame 93 { x: 50.6; y: 69; skew-x: -97.4; skew-y: -97.4; scale-x: 0.784; scale-y: 0.784; }
        frame 94 { x: 43.9; y: 96.5; skew-x: 81; skew-y: 81; scale-x: 0.782; scale-y: 0.782; }
        frame 95 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 96 { cel: -10000; }
        frame 102 { x: 19.8; y: 88.8; skew-x: -9.2; skew-y: -9.2; scale-x: 0.799; scale-y: 0.799; cel: 0; }
        frame 103 { x: 22.6; y: 87.7; skew-x: -8.4; skew-y: -8.4; scale-x: 0.798; scale-y: 0.798; cel: -10000; }
        frame 104 { x: 25.3; y: 86.6; skew-x: -7.7; skew-y: -7.7; scale-x: 0.797; scale-y: 0.797; }
        frame 105 { x: 27.9; y: 85.6; skew-x: -7.1; skew-y: -7.1; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 30; y: 89.9; skew-x: -8.4; skew-y: -8.4; scale-x: 0.796; scale-y: 0.796; }
        frame 107 { x: 32.1; y: 94.2; skew-x: -9.7; skew-y: -9.7; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 34.1; y: 98.5; skew-x: -11.1; skew-y: -11.1; }
        frame 109 { x: 33.6; y: 103.1; skew-x: -8.9; skew-y: -9.2; scale-x: 0.807; scale-y: 0.787; }
        frame 110 { x: 33; y: 107.7; skew-x: -6.7; skew-y: -7.4; scale-x: 0.818; scale-y: 0.778; }
        frame 111 { x: 32.6; y: 112.3; skew-x: -4.8; skew-y: -5.6; scale-x: 0.829; scale-y: 0.77; }
        frame 112 { x: 33; y: 111.3; skew-x: -4.9; skew-y: -5.2; scale-x: 0.812; scale-y: 0.782; }
        frame 113 { x: 33.3; y: 110.1; skew-x: -5.2; skew-y: -10000; scale-x: 0.795; scale-y: 0.795; }
        frame 114 { x: 32; y: 108.3; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 30.9; y: 107; skew-x: 16.5; skew-y: 16.5; scale-x: 0.794; scale-y: 0.794; }
        frame 116 { x: 34.7; y: 108; skew-x: 11.6; skew-y: 11.6; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 38.6; y: 109.1; skew-x: 6.8; skew-y: 6.8; }
        frame 118 { x: 42.5; y: 110.2; skew-x: 2; skew-y: 2; }
        frame 119 { x: 46.6; y: 111.3; skew-x: -2.7; skew-y: -2.7; }
        frame 120 { x: 50.1; y: 103.3; skew-x: 16.5; skew-y: 16.5; scale-x: 0.792; scale-y: 0.792; }
        frame 121 { x: 54.4; y: 96.7; skew-x: 36.1; skew-y: 36.1; scale-x: 0.791; scale-y: 0.791; }
        frame 122 { x: 58.4; y: 91.4; skew-x: 55.4; skew-y: 55.4; scale-x: -10000; scale-y: -10000; }
        frame 123 { x: 67.1; y: 92.2; skew-x: 70.7; skew-y: 70.7; scale-x: 0.79; scale-y: 0.79; }
        frame 124 { x: 75.3; y: 93.6; skew-x: 86; skew-y: 86; scale-x: 0.791; scale-y: 0.791; }
        frame 125 { x: 83; y: 95.5; skew-x: 101; skew-y: 101; scale-x: 0.79; scale-y: 0.79; }
        frame 126 { x: 89.8; y: 98.1; skew-x: 116.3; skew-y: 116.3; scale-x: 0.789; scale-y: 0.789; }
        frame 127 { x: 95.8; y: 100.8; skew-x: 131.7; skew-y: 131.7; scale-x: 0.79; scale-y: 0.79; }
        frame 128 { x: 92.2; y: 110; skew-x: 120.1; skew-y: 118.1; scale-x: 0.761; scale-y: 0.802; }
        frame 129 { x: 88.1; y: 119.2; skew-x: 108.4; skew-y: 104.5; scale-x: 0.735; scale-y: 0.816; }
        frame 130 { x: 88; y: -10000; skew-x: 108.3; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: 88.1; skew-x: 108.4; }
        frame 132 { x: 88; skew-x: 108.3; }
        frame 133 { x: 88.1; skew-x: 108.4; }
        frame 134 { x: 21.1; y: 68.7; skew-x: 77.1; skew-y: 77.1; scale-x: 0.769; scale-y: 0.769; }
        frame 135 { x: 21.9; y: 68.3; skew-x: 78.7; skew-y: 78.7; scale-x: 0.768; scale-y: 0.768; }
        frame 136 { x: 22.9; y: 67.8; skew-x: 80; skew-y: 80; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 23.7; y: 67.3; skew-x: 81.5; skew-y: 81.5; }
        frame 138 { x: 24.6; y: 66.9; skew-x: 82.9; skew-y: 82.9; scale-x: 0.767; scale-y: 0.767; }
        frame 139 { x: 25.5; y: 66.5; skew-x: 84.2; skew-y: 84.2; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 26.3; y: 65.8; skew-x: 85.6; skew-y: 85.6; }
        frame 141 { x: 27.5; y: 65.7; skew-x: 84.5; skew-y: 84.5; }
        frame 142 { x: 28.6; y: 65.3; skew-x: 83.2; skew-y: 83.2; scale-x: 0.766; scale-y: 0.766; }
        frame 143 { x: 29.7; y: 65; skew-x: 82; skew-y: 82; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 30.9; y: 64.7; skew-x: 80.7; skew-y: 80.7; }
        frame 145 { x: 32; y: 64.3; skew-x: 79.3; skew-y: 79.3; }
        frame 146 { x: 31.3; y: -10000; skew-x: 77.9; skew-y: 77.9; scale-x: 0.765; scale-y: 0.765; }
        frame 147 { x: 30.6; skew-x: 76.2; skew-y: 76.2; scale-x: 0.764; scale-y: 0.764; }
        frame 148 { x: 29.9; skew-x: 74.7; skew-y: 74.7; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 29.3; skew-x: 73.1; skew-y: 73.1; }
        frame 150 { x: -10000; y: 65.1; skew-x: 77.2; skew-y: 77.2; scale-x: 0.763; scale-y: 0.763; }
        frame 151 { x: 29.4; y: 66; skew-x: 81.1; skew-y: 81.1; scale-x: 0.764; scale-y: 0.764; }
        frame 152 { x: 28; y: -10000; skew-x: 78.9; skew-y: 78.9; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 26.4; skew-x: 76.5; skew-y: 76.5; }
        frame 154 { x: 24.9; y: 66; skew-x: 74.2; skew-y: 74.2; scale-x: 0.765; scale-y: 0.765; }
        frame 155 { x: 23.3; y: -10000; skew-x: 71.7; skew-y: 71.7; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 21.8; y: 66.1; skew-x: 69.4; skew-y: 69.4; scale-x: 0.766; scale-y: 0.766; }
        frame 157 { x: 20.2; y: 66.2; skew-x: 67; skew-y: 67; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 18.8; y: 66.3; skew-x: 64.6; skew-y: 64.6; scale-x: 0.768; scale-y: 0.768; }
        frame 159 { x: 19.8; y: 63.5; skew-x: 73.7; skew-y: 73.7; scale-x: 0.767; scale-y: 0.767; }
        frame 160 { x: 20.5; y: 61; skew-x: 82.9; skew-y: 82.9; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 21.1; y: 58.6; skew-x: 91.8; skew-y: 91.8; }
        frame 162 { x: 21.4; y: 56.5; skew-x: 100.8; skew-y: 100.8; scale-x: 0.766; scale-y: 0.766; }
        frame 163 { x: 21.5; y: 54.5; skew-x: 110; skew-y: 110; scale-x: 0.765; scale-y: 0.765; }
        frame 164 { x: 21.2; y: 52.6; skew-x: 119.1; skew-y: 119.1; scale-x: 0.764; scale-y: 0.764; }
        frame 165 { x: 20.7; y: 50.9; skew-x: 128.3; skew-y: 128.3; scale-x: 0.765; scale-y: 0.765; }
        frame 166 { x: 18.7; y: 53.8; skew-x: 127.3; skew-y: 127.3; scale-x: 0.763; scale-y: 0.763; }
        frame 167 { x: 16.8; y: 56.5; skew-x: 126.3; skew-y: 126.3; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 14.8; y: 59.3; skew-x: 125.4; skew-y: 125.4; scale-x: 0.762; scale-y: 0.762; }
        frame 169 { x: 12.8; y: 62.1; skew-x: 124.5; skew-y: 124.5; scale-x: 0.763; scale-y: 0.763; }
        frame 170 { x: 11.9; y: 59.3; skew-x: 106.3; skew-y: 106.3; scale-x: 0.762; scale-y: 0.762; }
        frame 171 { x: 9.9; y: 57; skew-x: 88.4; skew-y: 88.4; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 12.7; y: 60; skew-x: 85.7; skew-y: 85.7; scale-x: 0.764; scale-y: 0.764; }
        frame 173 { x: 15.6; y: 63; skew-x: 82.9; skew-y: 82.9; scale-x: 0.765; scale-y: 0.765; }
        frame 174 { x: 18.3; y: 66; skew-x: 80; skew-y: 80; scale-x: 0.767; scale-y: 0.767; }
        frame 175 { x: 21.1; y: 68.7; skew-x: 77.1; skew-y: 77.1; scale-x: 0.769; scale-y: 0.769; }
    }
    Track {
        source-name: "Zombie_dolphinrider_innerarm_upper";
        frame-count: 176;
        frame 0 { x: 22.8; y: 57; scale-x: 0.8; scale-y: 0.876; image: IMAGE_REANIM_ZOMBIE_BOBSLED_INNERARM_UPPER; }
        frame 1 { x: 22.4; y: 57.7; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 21.9; y: 58.4; skew-x: -0.7; skew-y: -0.7; }
        frame 3 { x: 21.4; y: 59; skew-x: -1.2; skew-y: -1.2; }
        frame 4 { x: 20.9; y: 59.7; skew-x: -1.7; skew-y: -1.7; }
        frame 5 { x: 20.4; y: 60.4; skew-x: -2.2; skew-y: -2.2; }
        frame 6 { x: 19.9; y: 61; skew-x: -2.7; skew-y: -2.7; }
        frame 7 { x: 19.5; y: 61.7; skew-x: -3.4; skew-y: -3.4; }
        frame 8 { x: 20.1; y: 61; skew-x: -2.7; skew-y: -2.7; }
        frame 9 { x: 20.5; y: 60.4; skew-x: -2.2; skew-y: -2.2; }
        frame 10 { x: 21; y: 59.7; skew-x: -1.7; skew-y: -1.7; }
        frame 11 { x: 21.5; y: 59; skew-x: -1.2; skew-y: -1.2; }
        frame 12 { x: 22; y: 58.3; skew-x: -0.7; skew-y: -0.7; }
        frame 13 { x: 22.5; y: 57.7; skew-x: -0.2; skew-y: -0.2; }
        frame 14 { x: 22.8; y: 57; skew-x: 0; skew-y: 0; }
        frame 15 { x: 25.1; y: 58.2; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; }
        frame 16 { x: 25.3; y: 57.4; skew-x: -4.2; skew-y: -4.2; scale-x: -10000; scale-y: 0.875; }
        frame 17 { x: 25.7; y: 56.6; skew-x: -2.9; skew-y: -2.9; scale-y: -10000; }
        frame 18 { x: 25.9; y: 55.9; skew-x: -1.7; skew-y: -1.7; }
        frame 19 { x: 26.2; y: 55; skew-x: -0.4; skew-y: -0.4; }
        frame 20 { x: 27; y: 53.5; skew-x: 3.5; skew-y: 3.5; }
        frame 21 { x: 27.7; y: 52.1; skew-x: 7.5; skew-y: 7.5; scale-x: 0.798; scale-y: 0.874; }
        frame 22 { x: 28.6; y: 50.6; skew-x: 11.5; skew-y: 11.5; scale-x: 0.797; scale-y: 0.873; }
        frame 23 { x: 29.4; y: 49.4; skew-x: 15.6; skew-y: 15.6; scale-x: 0.798; scale-y: -10000; }
        frame 24 { x: 30.6; y: 48.4; skew-x: 18.6; skew-y: 18.6; scale-x: 0.797; }
        frame 25 { x: 31.8; y: 47.3; skew-x: 21.8; skew-y: 21.8; scale-x: -10000; scale-y: 0.872; }
        frame 26 { x: 32.9; y: 46.3; skew-x: 25; skew-y: 25; scale-y: 0.873; }
        frame 27 { x: 28.9; y: 50.5; skew-x: 20.8; skew-y: 20.8; scale-x: 0.796; scale-y: 0.872; }
        frame 28 { x: 25.1; y: 54.9; skew-x: 16.8; skew-y: 16.8; scale-x: 0.795; scale-y: 0.871; }
        frame 29 { x: 21.1; y: 59.4; skew-x: 12.7; skew-y: 12.7; scale-x: 0.796; scale-y: -10000; }
        frame 30 { x: 19.3; y: 64.5; skew-x: 10.3; skew-y: 10.3; scale-x: 0.795; }
        frame 31 { x: 18.6; y: 65; skew-x: 4.7; skew-y: 4.7; scale-x: 0.796; scale-y: 0.872; }
        frame 32 { x: 18.5; y: 64; skew-x: -0.8; skew-y: -0.8; scale-x: 0.797; scale-y: 0.873; }
        frame 33 { x: 19.4; y: 63.8; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: 0.872; }
        frame 34 { x: 20.3; y: 63.6; skew-x: -3.6; skew-y: -3.6; scale-y: -10000; }
        frame 35 { x: 21.5; y: 62.3; skew-x: -7; skew-y: -7; scale-x: 0.796; }
        frame 36 { x: 22.6; y: 61; skew-x: -10.7; skew-y: -10.7; scale-x: -10000; }
        frame 37 { x: 23.9; y: 59.6; skew-x: -14.2; skew-y: -14.2; scale-y: 0.871; }
        frame 38 { x: 25; y: 58.4; skew-x: -17.7; skew-y: -17.7; scale-x: 0.795; scale-y: -10000; }
        frame 39 { x: 26.3; y: 57.3; skew-x: -21.4; skew-y: -21.4; scale-x: 0.796; scale-y: 0.872; }
        frame 40 { x: 28.1; y: 56.1; skew-x: -21.7; skew-y: -21.7; scale-x: 0.794; scale-y: 0.869; }
        frame 41 { x: 29.8; y: 55.1; skew-x: -22.2; skew-y: -22.2; scale-x: 0.793; scale-y: 0.868; }
        frame 42 { x: 31.5; y: 54; skew-x: -22.7; skew-y: -22.7; scale-x: 0.792; scale-y: 0.867; }
        frame 43 { x: 33.1; y: 52.8; skew-x: -23.2; skew-y: -23.2; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 30.1; y: 56.2; skew-x: -17.5; skew-y: -17.5; scale-x: 0.791; }
        frame 45 { x: 27.1; y: 59.5; skew-x: -11.9; skew-y: -11.9; scale-x: 0.792; }
        frame 46 { x: 24.1; y: 63.1; skew-x: -6.4; skew-y: -6.4; scale-x: 0.793; scale-y: 0.868; }
        frame 47 { x: 18.2; y: 67.4; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 19.6; y: 67.1; skew-x: -3.3; skew-y: -3.3; scale-x: 0.794; scale-y: 0.869; }
        frame 49 { x: 20.7; y: 65.3; skew-x: -3.7; skew-y: -3.7; scale-x: 0.795; scale-y: 0.87; }
        frame 50 { x: 21.8; y: 63.6; skew-x: -4.2; skew-y: -4.2; scale-x: 0.796; scale-y: 0.872; }
        frame 51 { x: 22.9; y: 61.8; skew-x: -4.7; skew-y: -4.7; scale-x: 0.797; scale-y: 0.873; }
        frame 52 { x: 24; y: 60; skew-x: -5.2; skew-y: -5.2; scale-x: 0.798; scale-y: 0.874; }
        frame 53 { x: 25.1; y: 58.2; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.876; }
        frame 54 { x: 20.1; y: 66.3; skew-x: 30.3; skew-y: 30.3; scale-x: 0.797; scale-y: 0.873; }
        frame 55 { x: 20.8; y: 65.4; skew-x: 31.1; skew-y: 31.1; scale-x: 0.796; scale-y: 0.885; }
        frame 56 { x: 21.4; y: 64.5; skew-x: 31.8; skew-y: 31.8; scale-x: -10000; scale-y: 0.897; }
        frame 57 { x: 22.1; y: 63.6; skew-x: 32.6; skew-y: 32.6; scale-y: 0.91; }
        frame 58 { x: 22.8; y: 62.8; skew-x: 33.3; skew-y: 33.3; scale-x: 0.795; scale-y: 0.923; }
        frame 59 { x: 23.4; y: 61.9; skew-x: 34.1; skew-y: 34.1; scale-x: -10000; scale-y: 0.936; }
        frame 60 { x: 24.1; y: 61; skew-x: 34.9; skew-y: 34.9; scale-x: 0.796; scale-y: 0.95; }
        frame 61 { x: 18; y: 65.8; skew-x: 14.8; skew-y: 14.8; scale-x: 0.794; scale-y: 0.908; }
        frame 62 { x: 12.3; y: 71.8; skew-x: -4.9; skew-y: -4.9; scale-x: 0.793; scale-y: 0.868; }
        frame 63 { x: 13.3; y: 70.6; skew-x: -0.9; skew-y: -0.9; scale-x: 0.794; scale-y: 0.876; }
        frame 64 { x: 14.4; y: 69.3; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: 0.884; }
        frame 65 { x: 15.5; y: 68.1; skew-x: 6.8; skew-y: 6.8; scale-y: 0.892; }
        frame 66 { x: 16.7; y: 67; skew-x: 10.8; skew-y: 10.8; scale-y: 0.9; }
        frame 67 { x: 17.9; y: 65.8; skew-x: 14.8; skew-y: 14.8; scale-y: 0.908; }
        frame 68 { x: 19; y: 64.8; skew-x: 18.8; skew-y: 18.8; scale-y: 0.916; }
        frame 69 { x: 20.3; y: 63.7; skew-x: 22.8; skew-y: 22.8; scale-y: 0.924; }
        frame 70 { x: 21.5; y: 62.8; skew-x: 26.8; skew-y: 26.8; scale-y: 0.932; }
        frame 71 { x: 22.7; y: 61.9; skew-x: 30.8; skew-y: 30.8; scale-x: 0.795; scale-y: 0.94; }
        frame 72 { x: 24.1; y: 61; skew-x: 34.9; skew-y: 34.9; scale-x: 0.796; scale-y: 0.95; }
        frame 73 { x: 18; y: 65.8; skew-x: 14.8; skew-y: 14.8; scale-x: 0.794; scale-y: 0.908; }
        frame 74 { x: 12.3; y: 71.8; skew-x: -4.9; skew-y: -4.9; scale-x: 0.793; scale-y: 0.868; }
        frame 75 { x: 14.6; y: 69.7; skew-x: 6.8; skew-y: 6.8; scale-x: 0.794; scale-y: 0.869; }
        frame 76 { x: 17.4; y: 67.8; skew-x: 18.5; skew-y: 18.5; scale-x: 0.795; scale-y: 0.871; }
        frame 77 { x: 20.1; y: 66.3; skew-x: 30.3; skew-y: 30.3; scale-x: 0.797; scale-y: 0.873; }
        frame 78 { x: 24.5; y: 71.7; skew-x: -94.9; skew-y: -119.2; scale-x: 0.876; scale-y: 0.874; }
        frame 79 { x: 18.1; y: 56.4; skew-x: -72.6; skew-y: -96.7; scale-x: 0.874; scale-y: 0.873; }
        frame 80 { x: 13.3; y: 40.5; skew-x: -50; skew-y: -74.3; scale-x: 0.873; scale-y: 0.872; }
        frame 81 { x: 10.1; y: 24.5; skew-x: -27.5; skew-y: -51.8; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 12.8; y: 16.4; skew-x: -49; skew-y: -73.3; scale-x: 0.871; scale-y: 0.87; }
        frame 83 { x: 17; y: 8.2; skew-x: -70.4; skew-y: -94.7; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 22.6; y: -0.3; skew-x: -91.8; skew-y: -116.1; scale-y: 0.869; }
        frame 85 { x: 23.8; y: -1.6; skew-x: -96.2; skew-y: -120.7; scale-x: 0.87; scale-y: 0.868; }
        frame 86 { x: 25; y: -3; skew-x: -100.9; skew-y: -125.2; scale-x: -10000; scale-y: 0.869; }
        frame 87 { x: 26; y: -1.8; skew-x: -104; skew-y: -128.5; scale-y: 0.867; }
        frame 88 { x: 27; y: -0.6; skew-x: -107.2; skew-y: -131.7; scale-x: 0.869; scale-y: -10000; }
        frame 89 { x: 28.1; y: 0.5; skew-x: -110.7; skew-y: -135; scale-x: -10000; }
        frame 90 { x: 29.2; y: 1.6; skew-x: -113.9; skew-y: -138.2; scale-x: 0.87; scale-y: 0.868; }
        frame 91 { x: 31.2; y: 29.1; skew-x: -121.2; skew-y: -145.6; scale-x: 0.867; scale-y: 0.865; }
        frame 92 { x: 33.2; y: 56.4; skew-x: -128.5; skew-y: -152.8; scale-x: 0.866; scale-y: 0.864; }
        frame 93 { x: 35.1; y: 83.3; skew-x: -135.7; skew-y: -160; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 25.2; y: 88.4; skew-x: -72.8; skew-y: -96.9; scale-x: 0.864; scale-y: 0.862; }
        frame 95 { x: 26.5; y: 88; skew-x: -9.6; skew-y: -33.9; scale-x: 0.863; scale-y: 0.861; }
        frame 96 { x: 28.1; y: 86.3; skew-x: -9.7; skew-y: -24.9; scale-x: 0.826; scale-y: 0.86; }
        frame 97 { x: 29.7; y: 85.1; skew-x: -10000; skew-y: -15.9; scale-x: 0.79; scale-y: -10000; }
        frame 98 { x: 29.2; y: 84.5; skew-x: -12.7; skew-y: -19; scale-x: 0.789; scale-y: 0.859; }
        frame 99 { x: 28.8; y: 83.8; skew-x: -15.9; skew-y: -22; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 28.4; y: 83.3; skew-x: -19; skew-y: -25.2; scale-x: 0.788; scale-y: 0.858; }
        frame 101 { x: 28.1; y: 82.7; skew-x: -22.2; skew-y: -28.4; scale-x: 0.789; scale-y: 0.859; }
        frame 102 { x: 25.1; y: 58.2; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.876; }
        frame 103 { x: 28.6; y: 57.2; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; scale-y: 0.875; }
        frame 104 { x: 32; y: 56.2; skew-x: -1.7; skew-y: -1.7; scale-y: -10000; }
        frame 105 { x: 35.5; y: 55.1; skew-x: 0.3; skew-y: 0.3; scale-x: 0.798; scale-y: 0.874; }
        frame 106 { x: 35.7; y: 59.9; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: 0.873; }
        frame 107 { x: 35.9; y: 64.6; skew-x: -6.7; skew-y: -6.7; scale-x: 0.797; scale-y: -10000; }
        frame 108 { x: 36.1; y: 69.5; skew-x: -10.5; skew-y: -10.5; scale-x: -10000; scale-y: 0.872; }
        frame 109 { x: 32.6; y: 76.8; skew-x: -14.4; skew-y: -15.4; scale-x: 0.804; scale-y: 0.866; }
        frame 110 { x: 29.2; y: 84.1; skew-x: -18.4; skew-y: -20.5; scale-x: 0.811; scale-y: 0.859; }
        frame 111 { x: 25.7; y: 91.4; skew-x: -22.5; skew-y: -25.7; scale-x: 0.82; scale-y: 0.854; }
        frame 112 { x: 26.2; y: 90.6; skew-x: -23.2; skew-y: -24.7; scale-x: 0.807; scale-y: 0.861; }
        frame 113 { x: 26.6; y: 89.7; skew-x: -24.1; skew-y: -24.1; scale-x: 0.795; scale-y: 0.871; }
        frame 114 { x: 29.6; y: 86.8; skew-x: -13.2; skew-y: -13.2; scale-x: 0.794; scale-y: 0.87; }
        frame 115 { x: 32.8; y: 84.3; skew-x: -2.3; skew-y: -2.3; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 39.7; y: 82.8; skew-x: 0.1; skew-y: 0.1; scale-y: 0.869; }
        frame 117 { x: 46.7; y: 81.3; skew-x: 2.8; skew-y: 2.8; scale-x: 0.793; scale-y: -10000; }
        frame 118 { x: 53.6; y: 79.8; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: 0.868; }
        frame 119 { x: 60.5; y: 78.4; skew-x: 8; skew-y: 7.9; scale-x: 0.792; scale-y: -10000; }
        frame 120 { x: 69.7; y: 79.3; skew-x: 25.1; skew-y: 25.1; scale-x: 0.791; scale-y: 0.866; }
        frame 121 { x: 78.8; y: 81; skew-x: 42.6; skew-y: 42.6; scale-x: 0.79; scale-y: 0.865; }
        frame 122 { x: 87.6; y: 83.6; skew-x: 59.8; skew-y: 59.8; scale-x: -10000; scale-y: 0.866; }
        frame 123 { x: 94.5; y: 89.2; skew-x: 68.7; skew-y: 68.7; scale-x: 0.789; scale-y: 0.864; }
        frame 124 { x: 101.2; y: 94.9; skew-x: 77.5; skew-y: 77.5; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: 107.7; y: 100.7; skew-x: 86.5; skew-y: 86.5; }
        frame 126 { x: 114; y: 106.7; skew-x: 95; skew-y: 95; }
        frame 127 { x: 120.1; y: 112.8; skew-x: 104; skew-y: 104; }
        frame 128 { x: 118.3; y: 116.2; skew-x: 90.5; skew-y: 91.8; scale-x: 0.759; scale-y: 0.88; }
        frame 129 { x: 116.2; y: 119.6; skew-x: 77.2; skew-y: 80; scale-x: 0.73; scale-y: 0.897; }
        frame 130 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.896; }
        frame 131 { scale-y: 0.897; }
        frame 132 { scale-y: 0.896; }
        frame 133 { scale-y: 0.897; }
        frame 134 { x: 23; y: 54.4; skew-x: -17.2; skew-y: -23.4; scale-x: 0.777; scale-y: 1.012; }
        frame 135 { x: 23.6; y: 53.7; skew-x: -16.5; skew-y: -22.7; scale-x: 0.776; scale-y: 1.01; }
        frame 136 { x: 24.3; y: 53; skew-x: -15.7; skew-y: -22; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 25; y: 52.3; skew-x: -15.2; skew-y: -21.4; scale-x: 0.775; }
        frame 138 { x: 25.7; y: 51.5; skew-x: -14.5; skew-y: -20.7; scale-x: -10000; scale-y: 1.009; }
        frame 139 { x: 26.4; y: 50.9; skew-x: -13.7; skew-y: -20; scale-y: -10000; }
        frame 140 { x: 27; y: 50; skew-x: -13.2; skew-y: -19.4; scale-y: 1.01; }
        frame 141 { x: 28.1; y: 49.5; skew-x: -12.7; skew-y: -18.9; scale-y: 1.009; }
        frame 142 { x: 29.2; y: 49.1; skew-x: -12.2; skew-y: -18.5; scale-x: 0.774; scale-y: 1.008; }
        frame 143 { x: 30.3; y: 48.7; skew-x: -11.7; skew-y: -18; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 31.5; y: 48.4; skew-x: -11.4; skew-y: -17.5; }
        frame 145 { x: 32.6; y: 47.9; skew-x: -11; skew-y: -17.2; scale-y: 1.009; }
        frame 146 { x: 31; y: 48; skew-x: -17.9; skew-y: -24.2; scale-x: 0.773; scale-y: 1.007; }
        frame 147 { x: 29.4; y: 48.4; skew-x: -25; skew-y: -31.2; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 28; y: 48.7; skew-x: -32; skew-y: -38.2; scale-x: 0.772; scale-y: 1.006; }
        frame 149 { x: 26.6; y: 49.3; skew-x: -39.1; skew-y: -45.3; scale-x: 0.773; scale-y: 1.007; }
        frame 150 { x: 25.6; y: 49.9; skew-x: -39; skew-y: -10000; scale-x: 0.772; scale-y: 1.006; }
        frame 151 { x: 24.6; y: 50.3; skew-x: -39.1; scale-x: 0.773; scale-y: 1.007; }
        frame 152 { x: 24.3; y: 50.9; skew-x: -36; skew-y: -42; scale-x: -10000; scale-y: 1.006; }
        frame 153 { x: 24; y: 51.4; skew-x: -32.7; skew-y: -39; scale-y: 1.007; }
        frame 154 { x: 23.8; y: 52; skew-x: -29.7; skew-y: -35.8; scale-x: 0.774; scale-y: 1.008; }
        frame 155 { x: 23.4; y: 52.5; skew-x: -26.5; skew-y: -32.7; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 23.3; y: 53.1; skew-x: -23.4; skew-y: -29.7; scale-x: 0.775; scale-y: 1.009; }
        frame 157 { x: 23.1; y: 53.8; skew-x: -20.2; skew-y: -26.5; scale-x: 0.776; scale-y: 1.01; }
        frame 158 { x: 23; y: 54.4; skew-x: -17.2; skew-y: -23.4; scale-x: 0.777; scale-y: 1.012; }
        frame 159 { x: 24.5; y: 52.6; skew-x: -9; skew-y: -15.2; scale-x: 0.776; scale-y: 1.011; }
        frame 160 { x: 26; y: 51.1; skew-x: -0.9; skew-y: -7.2; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 27.6; y: 49.8; skew-x: 6.8; skew-y: 0.8; }
        frame 162 { x: 29.3; y: 48.6; skew-x: 15; skew-y: 8.8; scale-x: 0.775; scale-y: 1.01; }
        frame 163 { x: 31; y: 47.9; skew-x: 23.1; skew-y: 16.8; scale-x: -10000; scale-y: 1.009; }
        frame 164 { x: 32.7; y: 47.3; skew-x: 31.3; skew-y: 25.1; scale-x: 0.774; scale-y: -10000; }
        frame 165 { x: 34.5; y: 46.9; skew-x: 39.4; skew-y: 33.2; scale-x: 0.775; scale-y: 1.01; }
        frame 166 { x: 30.8; y: 49; skew-x: 33.8; skew-y: 27.6; scale-x: 0.774; scale-y: 1.008; }
        frame 167 { x: 27; y: 51; skew-x: 28.3; skew-y: 22.1; scale-x: 0.773; scale-y: -10000; }
        frame 168 { x: 23.2; y: 53.3; skew-x: 22.8; skew-y: 16.5; scale-x: -10000; scale-y: 1.007; }
        frame 169 { x: 19.5; y: 55.6; skew-x: 17.3; skew-y: 11.1; scale-x: 0.774; scale-y: 1.008; }
        frame 170 { x: 19.4; y: 55.8; skew-x: 12.6; skew-y: 6.3; scale-x: 0.773; scale-y: 1.007; }
        frame 171 { x: 19.3; y: 56; skew-x: 8.1; skew-y: 1.9; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 20.1; y: 55.4; skew-x: 1.6; skew-y: -4.2; scale-x: 0.774; scale-y: 1.008; }
        frame 173 { x: 21.1; y: 54.9; skew-x: -4.4; skew-y: -10.7; scale-x: 0.775; scale-y: 1.009; }
        frame 174 { x: 22; y: 54.5; skew-x: -10.7; skew-y: -17; scale-x: -10000; scale-y: 1.01; }
        frame 175 { x: 23; y: 54.4; skew-x: -17.2; skew-y: -23.4; scale-x: 0.777; scale-y: 1.012; }
    }
    Track {
        source-name: "Zombie_dolphinrider_innerleg_lower";
        frame-count: 176;
        frame 0 { x: 35.4; y: 99.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BOBSLED_INNERLEG_LOWER; }
        frame 1 { x: 35.5; y: -10000; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 35.6; y: 99; skew-x: 0.8; skew-y: 0.8; }
        frame 3 { x: 35.8; y: 98.9; skew-x: 1; skew-y: 1; }
        frame 4 { x: 36; y: 98.8; skew-x: 1.5; skew-y: 1.5; }
        frame 5 { x: 36.1; y: -10000; skew-x: 1.8; skew-y: 1.8; }
        frame 6 { x: 36.3; skew-x: 2.3; skew-y: 2.3; }
        frame 7 { x: 36.5; y: 98.7; skew-x: 2.8; skew-y: 2.8; }
        frame 8 { x: 36.3; y: -10000; skew-x: 2.3; skew-y: 2.3; }
        frame 9 { x: 36.1; y: 98.8; skew-x: 1.8; skew-y: 1.8; }
        frame 10 { x: 36; y: -10000; skew-x: 1.5; skew-y: 1.5; }
        frame 11 { x: 35.9; skew-x: 1; skew-y: 1; }
        frame 12 { x: 35.7; skew-x: 0.8; skew-y: 0.8; }
        frame 13 { x: 35.5; y: 98.9; skew-x: 0.3; skew-y: 0.3; }
        frame 14 { x: 35.4; y: 99.1; skew-x: 0; skew-y: 0; }
        frame 15 { x: 36.5; y: 99.2; skew-x: -1; skew-y: -1; }
        frame 16 { x: 37.6; y: 98.7; skew-x: -1.4; skew-y: -1.4; scale-y: 0.818; }
        frame 17 { x: 38.6; y: 98.3; skew-x: -2.2; skew-y: -2.2; scale-y: 0.837; }
        frame 18 { x: 39.6; y: 97.8; skew-x: -2.7; skew-y: -2.7; scale-x: 0.799; scale-y: 0.856; }
        frame 19 { x: 40.6; y: 97.3; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: 0.874; }
        frame 20 { x: 41.5; y: 97.6; skew-x: -7.4; skew-y: -7.4; scale-y: -10000; }
        frame 21 { x: 42.3; y: 97.8; skew-x: -11.5; skew-y: -11.5; scale-x: 0.798; scale-y: 0.873; }
        frame 22 { x: 43.2; y: 98.2; skew-x: -15.7; skew-y: -15.7; scale-x: 0.799; scale-y: 0.874; }
        frame 23 { x: 43.9; y: -10000; skew-x: -17; skew-y: -17; scale-x: 0.798; scale-y: 0.891; }
        frame 24 { x: 44.6; y: 98.3; skew-x: -18.5; skew-y: -18.5; scale-x: -10000; scale-y: 0.91; }
        frame 25 { x: 45.1; y: -10000; skew-x: -19.9; skew-y: -19.9; scale-y: 0.929; }
        frame 26 { x: 45.9; skew-x: -21.3; skew-y: -21.3; scale-x: 0.799; scale-y: 0.949; }
        frame 27 { x: 44.3; y: 101.3; skew-x: -31.5; skew-y: -30; scale-x: 0.796; scale-y: 0.947; }
        frame 28 { x: 42.9; y: 104.3; skew-x: -41.8; skew-y: -38.6; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 40.6; y: 107.9; skew-x: -52; skew-y: -50.3; scale-x: 0.795; scale-y: 0.945; }
        frame 30 { x: 39; y: 112; skew-x: -62.2; skew-y: -62.2; scale-x: 0.797; scale-y: 0.946; }
        frame 31 { x: 38.4; y: 112.6; skew-x: -64.6; skew-y: -64.6; scale-x: 0.796; scale-y: 0.945; }
        frame 32 { x: 37.6; y: 113.3; skew-x: -67.1; skew-y: -67.1; scale-x: 0.795; scale-y: -10000; }
        frame 33 { x: 37.1; y: 113.8; skew-x: -69.4; skew-y: -69.4; scale-x: -10000; }
        frame 34 { x: 36.5; y: 114.5; skew-x: -71.7; skew-y: -71.7; scale-x: 0.796; }
        frame 35 { x: 35.2; y: 114; skew-x: -71.1; skew-y: -71.1; scale-x: 0.795; scale-y: 0.944; }
        frame 36 { x: 34; y: 113.7; skew-x: -70.6; skew-y: -70.6; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 32.8; y: 113.1; skew-x: -69.8; skew-y: -69.8; }
        frame 38 { x: 31.5; y: 112.7; skew-x: -69.1; skew-y: -69.1; }
        frame 39 { x: 30.1; y: 112.2; skew-x: -68.5; skew-y: -68.5; scale-y: 0.945; }
        frame 40 { x: 28; y: 109.2; skew-x: -60.8; skew-y: -59.6; scale-x: 0.794; scale-y: 0.944; }
        frame 41 { x: 26.2; y: 106.4; skew-x: -53; skew-y: -50.5; scale-x: 0.793; scale-y: -10000; }
        frame 42 { x: 24.7; y: 103.5; skew-x: -45.1; skew-y: -41.5; scale-x: -10000; }
        frame 43 { x: 23.6; y: 101.1; skew-x: -37.4; skew-y: -32.6; scale-x: 0.794; scale-y: 0.946; }
        frame 44 { x: 25.5; y: 98.1; skew-x: -17.2; skew-y: -14.7; scale-x: 0.791; scale-y: 0.942; }
        frame 45 { x: 28.4; y: 96; skew-x: 2.7; skew-y: 2.7; scale-x: 0.79; scale-y: 0.939; }
        frame 46 { x: 32.7; y: 96.5; skew-x: 15.3; skew-y: 15.3; scale-x: 0.788; scale-y: 0.936; }
        frame 47 { x: 37.3; y: 97.7; skew-x: 27.8; skew-y: 27.8; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 36.9; y: -10000; skew-x: 22.8; skew-y: 22.8; scale-x: 0.789; scale-y: 0.912; }
        frame 49 { x: 36.8; y: 97.8; skew-x: 18.1; skew-y: 18.1; scale-x: 0.791; scale-y: 0.89; }
        frame 50 { x: 36.6; y: 98.1; skew-x: 13.3; skew-y: 13.3; scale-x: 0.793; scale-y: 0.867; }
        frame 51 { x: 36.5; y: 98.3; skew-x: 8.5; skew-y: 8.5; scale-x: 0.795; scale-y: 0.845; }
        frame 52 { x: 36.6; y: 98.8; skew-x: 3.6; skew-y: 3.6; scale-x: 0.798; scale-y: 0.822; }
        frame 53 { x: 36.5; y: 99.2; skew-x: -1; skew-y: -1; scale-x: 0.8; scale-y: 0.8; }
        frame 54 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 40.6; y: 97.3; skew-x: -3.4; skew-y: -3.4; scale-x: 0.799; scale-y: 0.874; }
        frame 56 { x: 41.9; y: 97.8; skew-x: -9.4; skew-y: -9.4; scale-x: -10000; scale-y: 0.873; }
        frame 57 { x: 43.2; y: 98.2; skew-x: -15.7; skew-y: -15.7; scale-y: 0.874; }
        frame 58 { x: 44.1; y: -10000; skew-x: -17.5; skew-y: -17.5; scale-x: 0.798; scale-y: 0.898; }
        frame 59 { x: 45; y: 98.3; skew-x: -19.4; skew-y: -19.4; scale-x: -10000; scale-y: 0.923; }
        frame 60 { x: 45.9; y: -10000; skew-x: -21.3; skew-y: -21.3; scale-x: 0.799; scale-y: 0.949; }
        frame 61 { x: 42.9; y: 104.3; skew-x: -41.8; skew-y: -38.6; scale-x: 0.796; scale-y: 0.947; }
        frame 62 { x: 39; y: 112; skew-x: -62.2; skew-y: -62.2; scale-x: 0.797; scale-y: 0.946; }
        frame 63 { x: 38.1; y: 112.7; skew-x: -65.4; skew-y: -65.4; scale-x: 0.796; scale-y: 0.945; }
        frame 64 { x: 37.3; y: 113.7; skew-x: -68.6; skew-y: -68.6; scale-x: 0.795; scale-y: -10000; }
        frame 65 { x: 36.5; y: 114.5; skew-x: -71.7; skew-y: -71.7; scale-x: 0.796; }
        frame 66 { x: 35; y: 113.8; skew-x: -71.1; skew-y: -71.1; scale-x: 0.795; scale-y: 0.944; }
        frame 67 { x: 33.4; y: 113.3; skew-x: -70.1; skew-y: -70.1; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 31.8; y: 112.7; skew-x: -69.3; skew-y: -69.3; }
        frame 69 { x: 30.1; y: 112.2; skew-x: -68.5; skew-y: -68.5; scale-y: 0.945; }
        frame 70 { x: 27.3; y: 108.2; skew-x: -58.1; skew-y: -56.6; scale-x: 0.794; scale-y: 0.944; }
        frame 71 { x: 25.2; y: 104.4; skew-x: -47.8; skew-y: -44.5; scale-x: 0.793; scale-y: -10000; }
        frame 72 { x: 23.6; y: 101.1; skew-x: -37.4; skew-y: -32.6; scale-x: 0.794; scale-y: 0.946; }
        frame 73 { x: 28.4; y: 96; skew-x: 2.7; skew-y: 2.7; scale-x: 0.79; scale-y: 0.939; }
        frame 74 { x: 37.3; y: 97.7; skew-x: 27.8; skew-y: 27.8; scale-x: 0.788; scale-y: 0.936; }
        frame 75 { x: 36.8; y: 97.8; skew-x: 18.1; skew-y: 18.1; scale-x: 0.791; scale-y: 0.89; }
        frame 76 { x: 36.5; y: 98.3; skew-x: 8.5; skew-y: 8.5; scale-x: 0.795; scale-y: 0.845; }
        frame 77 { x: -10000; y: 99.2; skew-x: -1; skew-y: -1; scale-x: 0.8; scale-y: 0.8; }
        frame 78 { x: 26.5; y: 123.1; skew-x: -99.4; skew-y: -99.4; scale-x: 0.797; scale-y: 0.797; }
        frame 79 { x: 24.4; y: 110.2; skew-x: -84.9; skew-y: -84.9; scale-x: 0.796; scale-y: 0.837; }
        frame 80 { x: 23.2; y: 96.5; skew-x: -70.3; skew-y: -70.3; scale-x: 0.795; scale-y: 0.878; }
        frame 81 { x: 22.9; y: 82.2; skew-x: -55.6; skew-y: -55.6; scale-x: -10000; scale-y: 0.92; }
        frame 82 { x: 18.7; y: 62.5; skew-x: -48.5; skew-y: -48.5; scale-x: 0.793; scale-y: 0.918; }
        frame 83 { x: 14.8; y: 43; skew-x: -41.5; skew-y: -41.5; scale-x: -10000; scale-y: 0.917; }
        frame 84 { x: 11.1; y: 23.4; skew-x: -34.5; skew-y: -34.5; scale-x: 0.794; scale-y: 0.919; }
        frame 85 { x: 11.3; y: 18.8; skew-x: -30.8; skew-y: -30.8; scale-x: 0.792; scale-y: 0.917; }
        frame 86 { x: 11.4; y: 14.5; skew-x: -27.2; skew-y: -27.2; scale-x: 0.793; scale-y: 0.918; }
        frame 87 { x: 11.6; y: 13.9; skew-x: -28.5; skew-y: -28.5; scale-x: 0.792; scale-y: 0.916; }
        frame 88 { x: 11.7; y: 13.3; skew-x: -29.8; skew-y: -29.8; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 11.8; y: 12.7; skew-x: -31.2; skew-y: -31.2; scale-x: 0.791; }
        frame 90 { x: 12; y: 12; skew-x: -32.6; skew-y: -32.6; scale-x: 0.792; }
        frame 91 { x: 13.8; y: 46; skew-x: -32.2; skew-y: -32.2; scale-x: 0.788; scale-y: 0.912; }
        frame 92 { x: 15.5; y: 79.9; skew-x: -31.8; skew-y: -31.8; scale-x: 0.787; scale-y: 0.91; }
        frame 93 { x: 25; y: 122.1; skew-x: -100.9; skew-y: -100.9; scale-x: 0.784; scale-y: 0.907; }
        frame 94 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 95 { cel: -10000; }
        frame 102 { x: 36.5; y: 99.2; skew-x: -1; skew-y: -1; scale-x: 0.8; scale-y: 0.8; cel: 0; }
        frame 103 { x: 33.5; y: 100.6; skew-x: -9.4; skew-y: -9.4; scale-x: 0.799; scale-y: 0.799; cel: -10000; }
        frame 104 { x: 30.6; y: 101.9; skew-x: -17.7; skew-y: -17.7; scale-x: 0.798; scale-y: 0.798; }
        frame 105 { x: 27.9; y: 103.6; skew-x: -26.3; skew-y: -26.3; scale-x: 0.799; scale-y: 0.799; }
        frame 106 { x: 24.1; y: 108.2; skew-x: -42.5; skew-y: -42.5; scale-x: 0.797; scale-y: 0.797; }
        frame 107 { x: 21.5; y: 113.2; skew-x: -59; skew-y: -59; scale-x: 0.796; scale-y: 0.796; }
        frame 108 { x: 19.8; y: 118; skew-x: -75.2; skew-y: -75.2; scale-x: 0.797; scale-y: 0.797; }
        frame 109 { x: 22.9; y: 125.8; skew-x: -102; skew-y: -100.9; scale-x: 0.771; scale-y: 0.791; }
        frame 110 { x: 27.7; y: 131.7; skew-x: -129; skew-y: -126.7; scale-x: 0.745; scale-y: 0.784; }
        frame 111 { x: 32.9; y: 135.2; skew-x: -155.8; skew-y: -152.5; scale-x: 0.721; scale-y: 0.78; }
        frame 112 { x: 32.5; y: 134.8; skew-x: -150.6; skew-y: -149; scale-x: 0.709; scale-y: 0.785; }
        frame 113 { x: 32; y: 134.4; skew-x: -145.4; skew-y: -145.4; scale-x: 0.7; scale-y: 0.793; }
        frame 114 { x: 32.8; y: 134.7; skew-x: -149.8; skew-y: -149.8; scale-x: 0.699; scale-y: 0.792; }
        frame 115 { x: 33.5; y: 134.9; skew-x: -154.2; skew-y: -154.2; scale-x: 0.7; scale-y: 0.794; }
        frame 116 { x: 32.8; y: 134.2; skew-x: -147.8; skew-y: -147.8; scale-x: 0.699; scale-y: 0.792; }
        frame 117 { x: 32; y: 133.4; skew-x: -141.6; skew-y: -141.6; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: 31.3; y: 132.5; skew-x: -135.3; skew-y: -135.3; scale-x: 0.698; scale-y: 0.791; }
        frame 119 { x: 30.5; y: 131.3; skew-x: -128.9; skew-y: -128.9; scale-x: 0.699; scale-y: 0.792; }
        frame 120 { x: 26.7; y: 123.6; skew-x: -99.2; skew-y: -99.2; scale-x: 0.698; scale-y: 0.791; }
        frame 121 { x: 25.6; y: 113.8; skew-x: -69.6; skew-y: -69.6; scale-x: 0.697; scale-y: 0.79; }
        frame 122 { x: 27.7; y: 103.3; skew-x: -40; skew-y: -40; scale-x: -10000; scale-y: -10000; }
        frame 123 { x: 33.8; y: 100.3; skew-x: -24.2; skew-y: -24.2; scale-x: 0.696; scale-y: 0.788; }
        frame 124 { x: 40.5; y: 98; skew-x: -8.7; skew-y: -8.7; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: 47.9; y: 96.4; skew-x: 6.8; skew-y: 6.8; scale-x: 0.695; }
        frame 126 { x: 55.7; y: 95.6; skew-x: 22.5; skew-y: 22.5; scale-x: 0.694; scale-y: 0.787; }
        frame 127 { x: 63.6; y: 95.8; skew-x: 38.2; skew-y: 38.2; scale-x: 0.695; scale-y: 0.788; }
        frame 128 { x: 60.5; y: 97.9; skew-x: 28.1; skew-y: 30.6; scale-x: 0.704; scale-y: 0.761; }
        frame 129 { x: 57.4; y: 100.3; skew-x: 18.2; skew-y: 22.8; scale-x: 0.715; scale-y: 0.738; }
        frame 130 { x: 60.5; y: 98; skew-x: 28.1; skew-y: 30.6; scale-x: 0.704; scale-y: 0.761; }
        frame 131 { x: 63.6; y: 95.8; skew-x: 38.2; skew-y: 38.2; scale-x: 0.695; scale-y: 0.788; }
        frame 132 { x: 63.5; y: -10000; skew-x: 38.1; skew-y: 38.1; scale-x: 0.694; scale-y: 0.786; }
        frame 133 { x: 63.6; skew-x: 38.2; skew-y: 38.2; scale-x: 0.695; scale-y: 0.788; }
        frame 134 { x: 36.5; y: 99.2; skew-x: -1; skew-y: -1; scale-x: 0.8; scale-y: 0.8; }
        frame 135 { x: -10000; y: -10000; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 136 { y: 99.1; skew-x: -1.4; skew-y: -1.4; }
        frame 137 { x: 36.4; y: -10000; skew-x: -1.7; skew-y: -1.7; }
        frame 138 { x: 36.5; y: 99; skew-x: -10000; skew-y: -10000; }
        frame 139 { x: 36.4; skew-x: -2; skew-y: -2; }
        frame 140 { x: -10000; y: -10000; skew-x: -2.2; skew-y: -2.2; }
        frame 141 { x: 36.3; skew-x: -2.4; skew-y: -2.4; }
        frame 142 { x: 36.2; y: 98.9; skew-x: -2.7; skew-y: -2.7; }
        frame 143 { x: 36.1; y: -10000; skew-x: -2.9; skew-y: -2.9; }
        frame 144 { x: -10000; y: 98.8; skew-x: -3.2; skew-y: -3.2; }
        frame 145 { x: 36; y: -10000; skew-x: -3.5; skew-y: -3.5; }
        frame 146 { x: 33.5; y: 99.9; skew-x: -10.7; skew-y: -10.7; scale-x: 0.799; scale-y: 0.799; }
        frame 147 { x: 31; y: 101.2; skew-x: -17.7; skew-y: -17.7; scale-x: 0.798; scale-y: 0.798; }
        frame 148 { x: 28.6; y: 102.6; skew-x: -25; skew-y: -25; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 26.5; y: 104.2; skew-x: -32.3; skew-y: -32.3; }
        frame 150 { x: 26.2; y: 105.3; skew-x: -35.8; skew-y: -35.8; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: 25.8; y: 106.3; skew-x: -39.4; skew-y: -39.4; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: 26.5; y: 105.7; skew-x: -36.8; skew-y: -36.8; scale-x: 0.797; scale-y: 0.797; }
        frame 153 { x: 26.9; y: 105; skew-x: -34.2; skew-y: -34.2; scale-x: -10000; scale-y: -10000; }
        frame 154 { x: 27.6; y: 104.4; skew-x: -31.7; skew-y: -31.7; }
        frame 155 { x: 28.4; y: 103.9; skew-x: -29; skew-y: -29; scale-x: 0.798; scale-y: 0.798; }
        frame 156 { x: 29.1; y: 103.3; skew-x: -26.5; skew-y: -26.5; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 29.7; y: 102.8; skew-x: -24; skew-y: -24; }
        frame 158 { x: 30.4; y: 102.2; skew-x: -21.4; skew-y: -21.4; }
        frame 159 { x: 31.2; y: 101.6; skew-x: -18.7; skew-y: -18.7; }
        frame 160 { x: 32; y: 101.2; skew-x: -16.2; skew-y: -16.2; }
        frame 161 { x: 32.7; y: 100.7; skew-x: -13.7; skew-y: -13.7; scale-x: 0.799; scale-y: 0.799; }
        frame 162 { x: 33.5; y: 100.2; skew-x: -11.2; skew-y: -11.2; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 34.5; y: 99.7; skew-x: -8.5; skew-y: -8.5; }
        frame 164 { x: 35.3; y: 99.2; skew-x: -5.9; skew-y: -5.9; }
        frame 165 { x: 36; y: 98.8; skew-x: -3.5; skew-y: -3.5; scale-x: 0.8; scale-y: 0.8; }
        frame 166 { x: 33.5; y: 99.9; skew-x: -10.7; skew-y: -10.7; scale-x: 0.799; scale-y: 0.799; }
        frame 167 { x: 31; y: 101.2; skew-x: -17.7; skew-y: -17.7; scale-x: 0.798; scale-y: 0.798; }
        frame 168 { x: 28.6; y: 102.6; skew-x: -25; skew-y: -25; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 26.5; y: 104.2; skew-x: -32.3; skew-y: -32.3; }
        frame 170 { x: 26.2; y: 105.3; skew-x: -35.8; skew-y: -35.8; scale-x: 0.797; scale-y: 0.797; }
        frame 171 { x: 25.8; y: 106.3; skew-x: -39.4; skew-y: -39.4; scale-x: 0.798; scale-y: 0.798; }
        frame 172 { x: 28.1; y: 104.2; skew-x: -29.7; skew-y: -29.7; scale-x: 0.797; scale-y: 0.797; }
        frame 173 { x: 30.6; y: 102.3; skew-x: -20.2; skew-y: -20.2; scale-x: 0.798; scale-y: 0.798; }
        frame 174 { x: 33.5; y: 100.6; skew-x: -10.4; skew-y: -10.4; scale-x: 0.799; scale-y: 0.799; }
        frame 175 { x: 36.5; y: 99.2; skew-x: -1; skew-y: -1; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_dolphinrider_innerleg_foot";
        frame-count: 176;
        frame 0 { x: 27.6; y: 118.7; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BOBSLED_INNERLEG_FOOT; }
        frame 1 { x: 27.7; y: 118.5; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 27.8; y: 118.3; skew-x: 1.3; skew-y: 1.3; }
        frame 3 { x: 28; y: 118; skew-x: 1.8; skew-y: 1.8; }
        frame 4 { x: -10000; y: 117.8; skew-x: 2.5; skew-y: 2.5; }
        frame 5 { x: 28.1; y: 117.6; skew-x: 3.1; skew-y: 3.1; }
        frame 6 { x: 28.2; y: 117.4; skew-x: 3.8; skew-y: 3.8; }
        frame 7 { x: 28.4; y: 117.1; skew-x: 4.5; skew-y: 4.5; }
        frame 8 { x: 28.2; y: 117.4; skew-x: 3.8; skew-y: 3.8; }
        frame 9 { x: 28.1; y: 117.6; skew-x: 3.1; skew-y: 3.1; }
        frame 10 { x: 28; y: 117.8; skew-x: 2.5; skew-y: 2.5; }
        frame 11 { x: 27.9; y: 118.1; skew-x: 1.8; skew-y: 1.8; }
        frame 12 { x: 27.7; y: 118.3; skew-x: 1.3; skew-y: 1.3; }
        frame 13 { x: -10000; y: 118.5; skew-x: 0.5; skew-y: 0.5; }
        frame 14 { x: 27.6; y: 118.7; skew-x: 0; skew-y: 0; }
        frame 15 { x: 29.1; y: 118.9; skew-x: -1; skew-y: -1; }
        frame 16 { x: 30.3; y: 118.8; skew-x: -0.7; skew-y: -0.7; }
        frame 17 { x: 31.4; y: -10000; skew-x: -0.4; skew-y: -0.4; }
        frame 18 { x: 32.5; y: 118.7; skew-x: -0.2; skew-y: -0.2; }
        frame 19 { x: 33.5; y: -10000; skew-x: 0; skew-y: 0; }
        frame 20 { x: 36.3; skew-x: -10000; skew-y: -10000; }
        frame 21 { x: 39; }
        frame 22 { x: 41.8; }
        frame 23 { x: 43; }
        frame 24 { x: 44.2; y: 118.6; skew-x: -0; skew-y: -0; }
        frame 25 { x: 45.5; y: 118.7; skew-x: -0.2; skew-y: -0.2; }
        frame 26 { x: 46.7; y: 118.6; skew-x: -0.4; skew-y: -0.4; }
        frame 27 { x: 47.6; y: 119.2; skew-x: -3.4; skew-y: -3.4; scale-x: 0.799; scale-y: 0.799; }
        frame 28 { x: 48.6; y: 119.8; skew-x: -6.5; skew-y: -6.5; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 49.6; y: 120.7; skew-x: -9.7; skew-y: -9.7; }
        frame 30 { x: 50.6; y: 121.4; skew-x: -12.9; skew-y: -12.9; }
        frame 31 { x: 50.2; y: 122.1; skew-x: -18.4; skew-y: -18.4; scale-x: 0.798; scale-y: 0.798; }
        frame 32 { x: 49.9; y: 122.8; skew-x: -24; skew-y: -24; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 49.8; y: 123.5; skew-x: -29.5; skew-y: -29.5; scale-x: 0.797; scale-y: 0.797; }
        frame 34 { x: 49.9; y: 124.3; skew-x: -35.2; skew-y: -35.2; scale-x: 0.798; scale-y: 0.798; }
        frame 35 { x: 48.8; y: 124.2; skew-x: -37; skew-y: -37; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: 47.7; y: -10000; skew-x: -38.8; skew-y: -38.8; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 46.7; skew-x: -40.8; skew-y: -40.8; }
        frame 38 { x: 45.7; skew-x: -42.5; skew-y: -42.5; scale-x: 0.796; scale-y: 0.796; }
        frame 39 { x: 44.6; y: 124.1; skew-x: -44.4; skew-y: -44.4; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 40.1; y: 123.5; skew-x: -38.3; skew-y: -38.3; scale-x: 0.796; scale-y: 0.796; }
        frame 41 { x: 35.8; y: 122.8; skew-x: -32; skew-y: -32; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 31.7; y: 122.2; skew-x: -26; skew-y: -26; }
        frame 43 { x: 27.7; y: 121.5; skew-x: -19.8; skew-y: -19.8; scale-x: 0.797; scale-y: 0.797; }
        frame 44 { x: 23.2; y: 121; skew-x: -15.2; skew-y: -15.2; scale-x: 0.795; scale-y: 0.795; }
        frame 45 { x: 18.8; y: 120.3; skew-x: -10.9; skew-y: -10.9; scale-x: 0.796; scale-y: 0.796; }
        frame 46 { x: 18.6; y: 119.7; skew-x: -6.5; skew-y: -6.5; scale-x: 0.795; scale-y: 0.795; }
        frame 47 { x: 18.5; y: 119.2; skew-x: -2.3; skew-y: -2.3; scale-x: 0.796; scale-y: 0.796; }
        frame 48 { x: 20.3; y: 119.1; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 22.1; y: 119; skew-x: -1.7; skew-y: -1.7; scale-x: 0.797; scale-y: 0.797; }
        frame 50 { x: 23.9; skew-x: -1.5; skew-y: -1.5; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { x: 25.6; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 27.5; y: 118.9; skew-x: -1.2; skew-y: -1.2; scale-x: 0.799; scale-y: 0.799; }
        frame 53 { x: 29.1; y: -10000; skew-x: -1; skew-y: -1; scale-x: 0.8; scale-y: 0.8; }
        frame 54 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 33.5; y: 118.7; skew-x: 0; skew-y: 0; }
        frame 56 { x: 37.6; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 57 { x: 41.8; }
        frame 58 { x: 43.4; }
        frame 59 { x: 45; y: 118.6; skew-x: -0.2; skew-y: -0.2; }
        frame 60 { x: 46.7; y: -10000; skew-x: -0.4; skew-y: -0.4; }
        frame 61 { x: 48.6; y: 119.8; skew-x: -6.5; skew-y: -6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 62 { x: 50.6; y: 121.4; skew-x: -12.9; skew-y: -12.9; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 50; y: 122.3; skew-x: -20.2; skew-y: -20.2; scale-x: 0.798; scale-y: 0.798; }
        frame 64 { x: 49.8; y: 123.3; skew-x: -27.7; skew-y: -27.7; scale-x: 0.797; scale-y: 0.797; }
        frame 65 { x: 49.9; y: 124.3; skew-x: -35.2; skew-y: -35.2; scale-x: 0.798; scale-y: 0.798; }
        frame 66 { x: 48.5; y: 124.2; skew-x: -37.5; skew-y: -37.5; scale-x: 0.797; scale-y: 0.797; }
        frame 67 { x: 47.2; y: -10000; skew-x: -39.8; skew-y: -39.8; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 46; skew-x: -42; skew-y: -42; scale-x: 0.796; scale-y: 0.796; }
        frame 69 { x: 44.6; y: 124.1; skew-x: -44.4; skew-y: -44.4; scale-x: 0.798; scale-y: 0.798; }
        frame 70 { x: 38.6; y: 123.3; skew-x: -36.2; skew-y: -36.2; scale-x: 0.796; scale-y: 0.796; }
        frame 71 { x: 33; y: 122.4; skew-x: -28; skew-y: -28; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 27.7; y: 121.5; skew-x: -19.8; skew-y: -19.8; scale-x: 0.797; scale-y: 0.797; }
        frame 73 { x: 18.8; y: 120.3; skew-x: -10.9; skew-y: -10.9; scale-x: 0.796; scale-y: 0.796; }
        frame 74 { x: 18.5; y: 119.2; skew-x: -2.3; skew-y: -2.3; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 22.1; y: 119; skew-x: -1.7; skew-y: -1.7; scale-x: 0.797; scale-y: 0.797; }
        frame 76 { x: 25.6; y: -10000; skew-x: -1.4; skew-y: -1.4; scale-x: 0.798; scale-y: 0.798; }
        frame 77 { x: 29.1; y: 118.9; skew-x: -1; skew-y: -1; scale-x: 0.8; scale-y: 0.8; }
        frame 78 { x: 34.8; y: 121; skew-x: -30.7; skew-y: -30.7; scale-x: 0.799; scale-y: 0.799; }
        frame 79 { x: 32.7; y: 109.3; skew-x: -13.9; skew-y: -13.9; scale-x: 0.798; scale-y: 0.798; }
        frame 80 { x: 32; y: 98; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 32.7; y: 87.2; skew-x: 19.4; skew-y: 19.4; scale-x: 0.797; scale-y: 0.797; }
        frame 82 { x: 26.9; y: 71.3; skew-x: 11.8; skew-y: 11.8; scale-x: 0.796; scale-y: 0.796; }
        frame 83 { x: 21.4; y: 55.5; skew-x: 4.3; skew-y: 4.3; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 16; y: 39.9; skew-x: -3.1; skew-y: -3.1; scale-x: 0.795; scale-y: 0.795; }
        frame 85 { x: 15.1; y: 35.8; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 14.2; y: 31.6; skew-x: 4.1; skew-y: 4.1; }
        frame 87 { x: 14.8; y: 30.8; skew-x: 2.6; skew-y: 2.6; scale-x: 0.794; scale-y: 0.794; }
        frame 88 { x: 15.3; y: 30.2; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 15.8; y: 29.5; skew-x: 0; skew-y: 0; }
        frame 90 { x: 16.4; y: 28.7; skew-x: -1.2; skew-y: -1.2; scale-x: 0.793; scale-y: 0.793; }
        frame 91 { x: 18.2; y: 62.7; skew-x: -0.7; skew-y: -0.7; scale-x: 0.791; scale-y: 0.791; }
        frame 92 { x: 19.9; y: 96.8; skew-x: -0.4; skew-y: -0.4; scale-x: 0.789; scale-y: 0.789; }
        frame 93 { x: 29.1; y: 108.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: -10000; y: -10000; cel: -1; }
        frame 95 { cel: -10000; }
        frame 102 { y: 118.9; skew-x: -1; skew-y: -1; scale-x: 0.8; scale-y: 0.8; cel: 0; }
        frame 103 { y: 118.8; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 104 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 105 { y: 118.9; skew-x: -1; skew-y: -1; }
        frame 106 { x: 28.8; y: 119.7; skew-x: -5.9; skew-y: -5.9; scale-x: 0.799; scale-y: 0.799; }
        frame 107 { x: 28.6; y: 120.6; skew-x: -10.9; skew-y: -10.9; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 28.4; y: 121.5; skew-x: -16; skew-y: -16; }
        frame 109 { x: 28.1; y: 121.7; skew-x: -15.7; skew-y: -16.4; scale-x: 0.809; scale-y: 0.792; }
        frame 110 { x: 27.8; y: 121.9; skew-x: -15.2; skew-y: -16.7; scale-x: 0.819; scale-y: 0.785; }
        frame 111 { x: 27.6; y: 122.2; skew-x: -14.9; skew-y: -17.2; scale-x: 0.829; scale-y: 0.778; }
        frame 112 { x: 28.1; y: 121.8; skew-x: -15.4; skew-y: -16.5; scale-x: 0.814; scale-y: 0.788; }
        frame 113 { x: 28.4; y: 121.5; skew-x: -16; skew-y: -16; scale-x: 0.799; scale-y: 0.799; }
        frame 114 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 29.4; y: 119.9; skew-x: -11.2; skew-y: -11.2; }
        frame 121 { x: 30.5; y: 118.3; skew-x: -6.2; skew-y: -6.2; scale-x: 0.798; scale-y: 0.798; }
        frame 122 { x: 31.8; y: 116.8; skew-x: -1.5; skew-y: -1.5; scale-x: 0.799; scale-y: 0.799; }
        frame 123 { x: 34.1; y: 113.1; skew-x: 10.1; skew-y: 10.1; scale-x: 0.798; scale-y: 0.798; }
        frame 124 { x: 37.1; y: 109.7; skew-x: 21.8; skew-y: 21.8; scale-x: 0.797; scale-y: 0.797; }
        frame 125 { x: 40.6; y: 106.8; skew-x: 33.8; skew-y: 33.8; scale-x: 0.796; scale-y: 0.796; }
        frame 126 { x: 44.5; y: 104.6; skew-x: 45.6; skew-y: 45.6; scale-x: 0.795; scale-y: 0.795; }
        frame 127 { x: 48.8; y: 103; skew-x: 57.3; skew-y: 57.3; scale-x: 0.796; scale-y: 0.796; }
        frame 128 { x: 48; y: 106.3; skew-x: 55.7; skew-y: 58.9; scale-x: 0.779; scale-y: 0.799; }
        frame 129 { x: 47.4; y: 109.6; skew-x: 54; skew-y: 60.5; scale-x: 0.764; scale-y: 0.804; }
        frame 130 { x: 48; y: 106.3; skew-x: 55.7; skew-y: 58.9; scale-x: 0.779; scale-y: 0.799; }
        frame 131 { x: 48.8; y: 103; skew-x: 57.3; skew-y: 57.3; scale-x: 0.796; scale-y: 0.796; }
        frame 132 { x: -10000; y: -10000; skew-x: 57.4; skew-y: 57.4; scale-x: 0.795; scale-y: 0.795; }
        frame 133 { skew-x: 57.3; skew-y: 57.3; scale-x: 0.796; scale-y: 0.796; }
        frame 134 { x: 29.1; y: 118.9; skew-x: -1; skew-y: -1; scale-x: 0.8; scale-y: 0.8; }
        frame 135 { x: 29.2; y: 118.7; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 136 { x: 29.3; y: 118.6; skew-x: -0.2; skew-y: -0.2; }
        frame 137 { x: -10000; y: 118.5; skew-x: 0; skew-y: 0; }
        frame 138 { x: 29.4; y: 118.4; skew-x: 0.3; skew-y: 0.3; }
        frame 139 { x: -10000; y: 118.2; skew-x: 0.8; skew-y: 0.8; }
        frame 140 { x: 29.5; y: -10000; skew-x: 1; skew-y: 1; }
        frame 141 { x: -10000; y: 118; skew-x: 1.5; skew-y: 1.5; }
        frame 142 { x: 29.6; y: 117.9; skew-x: 1.8; skew-y: 1.8; }
        frame 143 { x: -10000; y: 117.7; skew-x: 2.3; skew-y: 2.3; }
        frame 144 { x: 29.8; y: -10000; skew-x: 2.5; skew-y: 2.5; }
        frame 145 { x: 29.9; y: 117.5; skew-x: 3; skew-y: 3; }
        frame 146 { x: 29.7; y: 117.8; skew-x: 1.8; skew-y: 1.8; }
        frame 147 { x: 29.5; y: 118; skew-x: 0.6; skew-y: 0.6; }
        frame 148 { x: -10000; y: 118.2; skew-x: -0.2; skew-y: -0.2; }
        frame 149 { x: 29.3; y: 118.4; skew-x: -1.4; skew-y: -1.4; }
        frame 150 { x: -10000; y: 118.3; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 151 { y: 118.4; scale-x: 0.8; scale-y: 0.8; }
        frame 152 { x: 29.4; y: 118.3; skew-x: -0.9; skew-y: -0.9; scale-x: 0.799; scale-y: 0.799; }
        frame 153 { x: -10000; y: 118.2; skew-x: -0.7; skew-y: -0.7; scale-x: 0.8; scale-y: 0.8; }
        frame 154 { y: 118.1; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 155 { x: 29.5; y: -10000; skew-x: -0; skew-y: -0; }
        frame 156 { x: -10000; skew-x: 0; skew-y: 0; }
        frame 157 { skew-x: 0.3; skew-y: 0.3; }
        frame 158 { x: 29.6; y: 118; skew-x: 0.6; skew-y: 0.6; }
        frame 159 { x: -10000; y: 117.8; skew-x: 1; skew-y: 1; }
        frame 160 { y: -10000; skew-x: 1.3; skew-y: 1.3; }
        frame 161 { skew-x: 1.6; skew-y: 1.6; }
        frame 162 { x: 29.7; y: 117.7; skew-x: 2; skew-y: 2; }
        frame 163 { x: 29.8; y: 117.6; skew-x: 2.3; skew-y: 2.3; }
        frame 164 { x: -10000; y: -10000; skew-x: 2.5; skew-y: 2.5; }
        frame 165 { x: 29.9; y: 117.5; skew-x: 3; skew-y: 3; }
        frame 166 { x: 29.7; y: 117.8; skew-x: 1.8; skew-y: 1.8; }
        frame 167 { x: 29.5; y: 118; skew-x: 0.6; skew-y: 0.6; }
        frame 168 { x: -10000; y: 118.2; skew-x: -0.2; skew-y: -0.2; }
        frame 169 { x: 29.3; y: 118.4; skew-x: -1.4; skew-y: -1.4; }
        frame 170 { x: -10000; y: 118.3; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 171 { y: 118.4; scale-x: 0.8; scale-y: 0.8; }
        frame 172 { y: 118.5; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 173 { y: 118.6; skew-x: -10000; skew-y: -10000; }
        frame 174 { x: 29.2; y: 118.7; skew-x: -0.9; skew-y: -0.9; }
        frame 175 { x: 29.1; y: 118.9; skew-x: -1; skew-y: -1; }
    }
    Track {
        source-name: "Zombie_dolphinrider_innerleg_upper";
        frame-count: 176;
        frame 0 { x: 38.6; y: 70.5; skew-x: 0.8; skew-y: 0.8; scale-x: 0.72; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BOBSLED_INNERLEG_UPPER; }
        frame 1 { x: 38.2; y: 70.8; skew-x: 0; skew-y: 0; scale-x: 0.719; scale-y: -10000; image: none; }
        frame 2 { x: 37.9; y: 71.2; skew-x: -0.6; skew-y: -0.6; scale-x: -10000; }
        frame 3 { x: 37.5; y: 71.6; skew-x: -1.4; skew-y: -1.4; }
        frame 4 { x: 37.1; y: 72; skew-x: -2.4; skew-y: -2.4; }
        frame 5 { x: 36.7; y: 72.4; skew-x: -3.1; skew-y: -3.1; }
        frame 6 { x: 36.4; y: 72.8; skew-x: -3.9; skew-y: -3.9; scale-y: 0.799; }
        frame 7 { x: 36; y: 73.2; skew-x: -4.9; skew-y: -4.9; scale-y: 0.8; }
        frame 8 { x: 36.5; y: 72.8; skew-x: -3.9; skew-y: -3.9; scale-y: 0.799; }
        frame 9 { x: 36.8; y: 72.4; skew-x: -3.1; skew-y: -3.1; scale-y: 0.8; }
        frame 10 { x: 37.1; y: 72; skew-x: -2.4; skew-y: -2.4; scale-y: -10000; }
        frame 11 { x: 37.5; y: 71.7; skew-x: -1.4; skew-y: -1.4; }
        frame 12 { x: 37.9; y: 71.3; skew-x: -0.6; skew-y: -0.6; }
        frame 13 { x: 38.3; y: 70.8; skew-x: 0; skew-y: 0; }
        frame 14 { x: 38.6; y: 70.5; skew-x: 0.8; skew-y: 0.8; scale-x: 0.72; }
        frame 15 { x: 41.1; y: 70; skew-x: 4.8; skew-y: 4.8; scale-x: 0.719; scale-y: 0.799; }
        frame 16 { x: 40.4; y: 70.2; skew-x: 1.1; skew-y: 1.1; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 39.7; y: 70.3; skew-x: -2.4; skew-y: -2.4; scale-x: 0.718; }
        frame 18 { x: 39; y: 70.6; skew-x: -6.1; skew-y: -6.1; scale-x: -10000; scale-y: 0.798; }
        frame 19 { x: 38.3; y: 70.8; skew-x: -9.9; skew-y: -9.9; scale-y: 0.799; }
        frame 20 { x: 38; y: 71; skew-x: -12.7; skew-y: -12.7; scale-y: 0.798; }
        frame 21 { x: 37.5; y: 71.3; skew-x: -15.6; skew-y: -15.6; scale-y: -10000; }
        frame 22 { x: 37.3; y: 71.7; skew-x: -18.6; skew-y: -18.6; }
        frame 23 { x: 36.4; y: 72; skew-x: -19.4; skew-y: -21.4; }
        frame 24 { x: 35.6; y: 72.4; skew-x: -20.1; skew-y: -23.9; scale-x: 0.719; scale-y: 0.799; }
        frame 25 { x: 34.6; y: 72.9; skew-x: -20.9; skew-y: -26.7; scale-x: 0.72; scale-y: 0.8; }
        frame 26 { x: 33.9; y: 73.7; skew-x: -21.6; skew-y: -29.5; scale-x: 0.721; scale-y: 0.802; }
        frame 27 { x: 32.6; y: 75.2; skew-x: -21.4; skew-y: -28.4; scale-x: 0.72; scale-y: 0.799; }
        frame 28 { x: 31.5; y: 76.6; skew-x: -21.2; skew-y: -27.2; scale-x: 0.719; scale-y: 0.798; }
        frame 29 { x: 30.3; y: 78.1; skew-x: -20.9; skew-y: -26.2; scale-x: -10000; scale-y: 0.796; }
        frame 30 { x: 29; y: 79.6; skew-x: -10000; skew-y: -25; scale-y: -10000; }
        frame 31 { x: 30.1; y: 78.3; skew-x: -15.6; skew-y: -19.7; scale-x: 0.718; scale-y: 0.795; }
        frame 32 { x: 31.2; y: 77.1; skew-x: -10.4; skew-y: -14.4; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 32.3; y: 76.1; skew-x: -5.1; skew-y: -9.4; }
        frame 34 { x: 33.5; y: 75.2; skew-x: -0; skew-y: -4.2; }
        frame 35 { x: 35.5; y: 74.3; skew-x: 4.8; skew-y: 0.8; }
        frame 36 { x: 37.5; y: 73.6; skew-x: 9.8; skew-y: 5.6; scale-x: 0.717; scale-y: 0.794; }
        frame 37 { x: 39.5; y: 73.1; skew-x: 14.8; skew-y: 10.6; scale-x: -10000; scale-y: 0.793; }
        frame 38 { x: 41.6; y: 72.6; skew-x: 19.8; skew-y: 15.6; scale-x: 0.716; scale-y: -10000; }
        frame 39 { x: 43.7; y: 72.3; skew-x: 24.8; skew-y: 20.6; scale-x: 0.717; }
        frame 40 { x: 45.6; y: 71.2; skew-x: 31.1; skew-y: 26.9; scale-x: 0.715; scale-y: 0.805; }
        frame 41 { x: 47.7; y: 70.5; skew-x: 37.4; skew-y: 33.1; scale-x: -10000; scale-y: 0.818; }
        frame 42 { x: 49.6; y: 69.8; skew-x: 43.7; skew-y: 39.4; scale-y: 0.831; }
        frame 43 { x: 51.5; y: 69.7; skew-x: 50; skew-y: 45.8; scale-y: 0.846; }
        frame 44 { x: 47.1; y: 69.5; skew-x: 37.9; skew-y: 33.6; scale-x: 0.713; scale-y: 0.844; }
        frame 45 { x: 42.6; y: 70.1; skew-x: 25.9; skew-y: 21.6; scale-x: 0.714; scale-y: -10000; }
        frame 46 { x: 38; y: 71.7; skew-x: 13.7; skew-y: 9.5; scale-x: 0.713; scale-y: 0.831; }
        frame 47 { x: 33.5; y: 74; skew-x: 1.8; skew-y: -2.3; scale-x: 0.714; scale-y: 0.818; }
        frame 48 { x: 34.8; y: 73.3; skew-x: 2.1; skew-y: -0.9; scale-x: -10000; scale-y: 0.815; }
        frame 49 { x: 36; y: 72.6; skew-x: 2.6; skew-y: 0; scale-x: 0.715; scale-y: 0.812; }
        frame 50 { x: 37.3; y: 72; skew-x: 3.1; skew-y: 1.1; scale-x: 0.716; scale-y: 0.809; }
        frame 51 { x: 38.5; y: 71.3; skew-x: 3.6; skew-y: 2.3; scale-x: 0.717; scale-y: 0.805; }
        frame 52 { x: 39.6; y: 70.7; skew-x: 4.1; skew-y: 3.6; scale-x: 0.718; scale-y: 0.802; }
        frame 53 { x: 41.1; y: 70; skew-x: 4.8; skew-y: 4.8; scale-x: 0.719; scale-y: 0.799; }
        frame 54 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 38.3; y: 70.8; skew-x: -9.9; skew-y: -9.9; scale-x: 0.718; }
        frame 56 { x: 37.8; y: 71.2; skew-x: -14.2; skew-y: -14.2; scale-x: -10000; scale-y: 0.798; }
        frame 57 { x: 37.3; y: 71.7; skew-x: -18.6; skew-y: -18.6; scale-y: -10000; }
        frame 58 { x: 36.1; y: 72.2; skew-x: -19.6; skew-y: -22.2; scale-y: 0.799; }
        frame 59 { x: 35; y: 72.8; skew-x: -20.6; skew-y: -25.9; scale-x: 0.719; scale-y: 0.8; }
        frame 60 { x: 33.9; y: 73.7; skew-x: -21.6; skew-y: -29.5; scale-x: 0.721; scale-y: 0.802; }
        frame 61 { x: 31.5; y: 76.6; skew-x: -21.2; skew-y: -27.2; scale-x: 0.719; scale-y: 0.798; }
        frame 62 { x: 29; y: 79.6; skew-x: -20.9; skew-y: -25; scale-x: -10000; scale-y: 0.796; }
        frame 63 { x: 30.5; y: 77.8; skew-x: -13.9; skew-y: -17.9; scale-x: 0.718; scale-y: 0.795; }
        frame 64 { x: 32; y: 76.4; skew-x: -6.9; skew-y: -11.1; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 33.5; y: 75.2; skew-x: -0; skew-y: -4.2; }
        frame 66 { x: 35.7; y: 74.1; skew-x: 6.8; skew-y: 2.6; scale-y: 0.794; }
        frame 67 { x: 38; y: 73.3; skew-x: 13.8; skew-y: 9.8; scale-x: 0.717; scale-y: -10000; }
        frame 68 { x: 40.5; y: 72.7; skew-x: 20.9; skew-y: 16.8; scale-x: 0.716; scale-y: 0.793; }
        frame 69 { x: 42.8; y: 72.3; skew-x: 28; skew-y: 23.9; scale-x: 0.717; scale-y: -10000; }
        frame 70 { x: 45.7; y: 71; skew-x: 35.4; skew-y: 31.1; scale-x: 0.715; scale-y: 0.809; }
        frame 71 { x: 48.6; y: 70.1; skew-x: 42.7; skew-y: 38.4; scale-x: -10000; scale-y: 0.827; }
        frame 72 { x: 51.5; y: 69.7; skew-x: 50; skew-y: 45.8; scale-y: 0.846; }
        frame 73 { x: 43.5; y: 70.2; skew-x: 29.9; skew-y: 25.7; scale-x: 0.713; scale-y: 0.814; }
        frame 74 { x: 34.1; y: 74; skew-x: 1.8; skew-y: -0.2; scale-x: -10000; scale-y: 0.817; }
        frame 75 { x: 36.4; y: 72.7; skew-x: 2.6; skew-y: 1.3; scale-x: 0.715; scale-y: 0.811; }
        frame 76 { x: 38.5; y: 71.3; skew-x: 3.6; skew-y: 3.1; scale-x: 0.717; scale-y: 0.805; }
        frame 77 { x: 41.1; y: 70; skew-x: 4.8; skew-y: 4.8; scale-x: 0.719; scale-y: 0.799; }
        frame 78 { x: 51; y: 83.5; skew-x: 59.3; skew-y: 59.3; scale-x: 0.717; scale-y: 0.798; }
        frame 79 { x: 40.6; y: 67.3; skew-x: 36.2; skew-y: 36.2; scale-x: 0.716; scale-y: 0.796; }
        frame 80 { x: 29.3; y: 53.8; skew-x: 13.1; skew-y: 13.1; scale-x: -10000; scale-y: 0.797; }
        frame 81 { x: 18.9; y: 47.9; skew-x: -14.6; skew-y: -14.6; scale-x: 0.717; scale-y: -10000; }
        frame 82 { x: 34.6; y: 28.2; skew-x: 24.9; skew-y: 24.9; scale-x: 0.714; scale-y: 0.794; }
        frame 83 { x: 49.6; y: 17.1; skew-x: 64.5; skew-y: 64.5; scale-x: -10000; scale-y: 0.793; }
        frame 84 { x: 55.9; y: 13.6; skew-x: 96.9; skew-y: 96.9; scale-y: 0.794; }
        frame 85 { x: 56; y: 11.2; skew-x: 99.1; skew-y: 99.1; scale-x: 0.713; scale-y: 0.793; }
        frame 86 { x: 56.3; y: 9; skew-x: 101.6; skew-y: 101.6; scale-x: 0.714; scale-y: -10000; }
        frame 87 { x: 56.9; y: 10.6; skew-x: 104.9; skew-y: 104.9; scale-x: 0.713; }
        frame 88 { x: 57.5; y: 12.2; skew-x: 108.3; skew-y: 108.3; scale-x: -10000; scale-y: 0.792; }
        frame 89 { x: 58; y: 13.8; skew-x: 111.6; skew-y: 111.6; scale-x: 0.712; scale-y: -10000; }
        frame 90 { x: 58.5; y: 15.5; skew-x: 115.2; skew-y: 115.2; scale-x: 0.713; scale-y: 0.793; }
        frame 91 { x: 57.5; y: 37.9; skew-x: 95.1; skew-y: 95.1; scale-x: 0.711; scale-y: 0.791; }
        frame 92 { x: 54.6; y: 60.9; skew-x: 75; skew-y: 75; scale-x: 0.71; scale-y: 0.789; }
        frame 93 { x: -10000; y: 88.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { y: -10000; cel: -1; }
        frame 95 { cel: -10000; }
        frame 102 { x: 41.1; y: 70; skew-x: 4.8; skew-y: 4.8; scale-x: 0.719; scale-y: 0.799; cel: 0; }
        frame 103 { x: 45; skew-x: 16.4; skew-y: 16.4; scale-x: 0.718; scale-y: 0.798; cel: -10000; }
        frame 104 { x: 48.9; y: 70.9; skew-x: 28.1; skew-y: 28.1; scale-x: 0.717; scale-y: 0.797; }
        frame 105 { x: 52.8; y: 72.4; skew-x: 40; skew-y: 40; scale-x: -10000; scale-y: 0.798; }
        frame 106 { x: 54.8; y: 78.2; skew-x: 53.2; skew-y: 53.2; scale-x: 0.716; scale-y: 0.796; }
        frame 107 { x: 56.4; y: 84.8; skew-x: 66.7; skew-y: 66.7; scale-x: 0.715; scale-y: 0.795; }
        frame 108 { x: 57.2; y: 92; skew-x: 79.9; skew-y: 79.9; scale-x: 0.716; scale-y: 0.796; }
        frame 109 { x: 55.7; y: 96.3; skew-x: 76.5; skew-y: 77.5; scale-x: 0.709; scale-y: 0.804; }
        frame 110 { x: 54.2; y: 100.4; skew-x: 73.1; skew-y: 75; scale-x: 0.703; scale-y: 0.813; }
        frame 111 { x: 52.7; y: 104.7; skew-x: 69.7; skew-y: 72.3; scale-x: 0.697; scale-y: 0.823; }
        frame 112 { x: 52.4; y: 102.4; skew-x: 68.8; skew-y: 70.2; scale-x: 0.705; scale-y: 0.808; }
        frame 113 { x: 51.9; y: 100.1; skew-x: 67.8; skew-y: 67.8; scale-x: 0.714; scale-y: 0.794; }
        frame 114 { x: 52.3; y: 101.7; skew-x: 69.5; skew-y: 69.5; scale-x: -10000; scale-y: 0.793; }
        frame 115 { x: 52.5; y: 103.4; skew-x: 71; skew-y: 71; scale-x: 0.715; scale-y: 0.794; }
        frame 116 { x: 52.3; y: 101.7; skew-x: 68.8; skew-y: 68.8; scale-x: 0.714; scale-y: 0.793; }
        frame 117 { x: 52; y: 99.8; skew-x: 66.5; skew-y: 66.5; scale-x: 0.713; scale-y: -10000; }
        frame 118 { x: 51.8; y: 97.9; skew-x: 64.3; skew-y: 64.3; scale-x: -10000; }
        frame 119 { x: 51.4; y: 96.2; skew-x: 62; skew-y: 62; scale-x: 0.714; scale-y: 0.794; }
        frame 120 { x: 60; y: 98; skew-x: 81; skew-y: 81; scale-x: 0.713; scale-y: 0.793; }
        frame 121 { x: 66.9; y: 100.7; skew-x: 99.9; skew-y: 99.9; scale-x: 0.712; scale-y: 0.792; }
        frame 122 { x: 72; y: 103.8; skew-x: 119; skew-y: 119; scale-x: -10000; scale-y: 0.791; }
        frame 123 { x: 77.3; y: 107.5; skew-x: 124.1; skew-y: 124.1; scale-x: 0.711; scale-y: 0.79; }
        frame 124 { x: 82.5; y: 111.2; skew-x: 129.4; skew-y: 129.4; scale-x: 0.71; scale-y: -10000; }
        frame 125 { x: 87.4; y: 114.8; skew-x: 134.7; skew-y: 134.7; scale-x: -10000; }
        frame 126 { x: 92.3; y: 118.3; skew-x: 139.9; skew-y: 139.9; scale-y: 0.789; }
        frame 127 { x: 97.2; y: 121.8; skew-x: 145; skew-y: 145; scale-x: 0.711; scale-y: 0.79; }
        frame 128 { x: 97.1; y: 122.7; skew-x: 146.7; skew-y: 143.4; scale-x: 0.712; scale-y: 0.775; }
        frame 129 { x: -10000; y: 123.5; skew-x: 148.3; skew-y: 141.6; scale-x: 0.715; scale-y: 0.762; }
        frame 130 { y: 122.7; skew-x: 146.7; skew-y: 143.4; scale-x: 0.712; scale-y: 0.775; }
        frame 131 { x: 97.2; y: 121.8; skew-x: 145; skew-y: 145; scale-x: 0.711; scale-y: 0.79; }
        frame 132 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.71; scale-y: 0.789; }
        frame 133 { scale-x: 0.711; scale-y: 0.79; }
        frame 134 { x: 41.1; y: 70; skew-x: 4.8; skew-y: 4.8; scale-x: 0.719; scale-y: 0.799; }
        frame 135 { x: 41.2; y: 69.9; skew-x: 5.1; skew-y: 5.1; scale-x: -10000; scale-y: -10000; }
        frame 136 { x: 41.4; y: 69.7; skew-x: 5.6; skew-y: 5.6; }
        frame 137 { x: 41.5; y: 69.6; skew-x: 6.1; skew-y: 6.1; }
        frame 138 { x: -10000; y: 69.5; skew-x: 6.4; skew-y: 6.4; scale-x: 0.718; }
        frame 139 { x: 41.8; y: 69.3; skew-x: 6.8; skew-y: 6.8; scale-x: -10000; }
        frame 140 { x: 41.9; y: -10000; skew-x: 7.3; skew-y: 7.3; }
        frame 141 { x: 42; y: 69.2; skew-x: 7.8; skew-y: 7.8; }
        frame 142 { x: 42.2; y: 69; skew-x: 8.1; skew-y: 8.1; }
        frame 143 { x: 42.4; y: 68.8; skew-x: 8.6; skew-y: 8.6; }
        frame 144 { x: -10000; y: 68.7; skew-x: 9.1; skew-y: 9.1; }
        frame 145 { x: 42.7; y: 68.6; skew-x: 9.6; skew-y: 9.6; scale-x: 0.719; }
        frame 146 { x: 43; y: 68.8; skew-x: 13.6; skew-y: 13.6; scale-x: 0.718; scale-y: 0.798; }
        frame 147 { y: 69.2; skew-x: 17.4; skew-y: 17.4; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 43.3; y: 69.6; skew-x: 21.4; skew-y: 21.4; scale-x: 0.717; scale-y: 0.797; }
        frame 149 { x: 43.4; y: 70.2; skew-x: 25.5; skew-y: 25.5; scale-x: 0.718; scale-y: 0.798; }
        frame 150 { x: 43.5; y: 70.5; skew-x: 26.6; skew-y: 26.6; scale-x: 0.717; scale-y: 0.797; }
        frame 151 { x: -10000; y: 70.8; skew-x: 28; skew-y: 28; scale-x: 0.718; scale-y: 0.798; }
        frame 152 { y: 70.6; skew-x: 26.6; skew-y: 26.6; scale-x: 0.717; scale-y: 0.797; }
        frame 153 { x: 43.4; y: 70.3; skew-x: 25.4; skew-y: 25.4; scale-x: -10000; scale-y: -10000; }
        frame 154 { x: -10000; y: 70.2; skew-x: 24.1; skew-y: 24.1; }
        frame 155 { x: 43.3; y: 70; skew-x: 22.6; skew-y: 22.6; }
        frame 156 { x: -10000; y: 69.8; skew-x: 21.4; skew-y: 21.4; }
        frame 157 { x: 43.1; y: 69.6; skew-x: 20.1; skew-y: 20.1; scale-y: 0.798; }
        frame 158 { x: 43; y: 69.5; skew-x: 18.8; skew-y: 18.8; scale-x: 0.718; scale-y: -10000; }
        frame 159 { x: -10000; y: 69.3; skew-x: 17.4; skew-y: 17.4; scale-x: -10000; }
        frame 160 { x: 42.9; y: 69.2; skew-x: 16.1; skew-y: 16.1; }
        frame 161 { x: 42.8; y: 69; skew-x: 14.8; skew-y: 14.8; }
        frame 162 { x: 42.7; y: -10000; skew-x: 13.4; skew-y: 13.4; }
        frame 163 { x: -10000; y: 68.8; skew-x: 12.1; skew-y: 12.1; }
        frame 164 { y: 68.7; skew-x: 10.8; skew-y: 10.8; }
        frame 165 { y: 68.6; skew-x: 9.6; skew-y: 9.6; scale-x: 0.719; scale-y: 0.799; }
        frame 166 { x: 43; y: 68.8; skew-x: 13.6; skew-y: 13.6; scale-x: 0.718; scale-y: 0.798; }
        frame 167 { y: 69.2; skew-x: 17.4; skew-y: 17.4; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 43.3; y: 69.6; skew-x: 21.4; skew-y: 21.4; scale-x: 0.717; scale-y: 0.797; }
        frame 169 { x: 43.4; y: 70.2; skew-x: 25.5; skew-y: 25.5; scale-x: 0.718; scale-y: 0.798; }
        frame 170 { x: 43.5; y: 70.5; skew-x: 26.6; skew-y: 26.6; scale-x: 0.717; scale-y: 0.797; }
        frame 171 { x: -10000; y: 70.8; skew-x: 28; skew-y: 28; scale-x: 0.718; scale-y: 0.798; }
        frame 172 { x: 42.9; y: 70.3; skew-x: 22.1; skew-y: 22.1; scale-x: 0.717; scale-y: 0.797; }
        frame 173 { x: 42.3; y: 70; skew-x: 16.3; skew-y: 16.3; scale-x: 0.718; scale-y: 0.798; }
        frame 174 { x: 41.7; y: 69.9; skew-x: 10.6; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 41.1; y: 70; skew-x: 4.8; skew-y: 4.8; scale-x: 0.719; scale-y: 0.799; }
    }
    Track {
        source-name: "Zombie_dolphinrider_body2";
        frame-count: 176;
        frame 0 { x: 40.6; y: 68.2; scale-x: 0.8; scale-y: 0.889; image: IMAGE_REANIM_ZOMBIE_BOBSLED_BODY2; }
        frame 1 { x: 40.2; y: 68.7; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 39.7; y: 69.2; skew-x: -1.4; skew-y: -1.4; }
        frame 3 { x: 39.3; y: 69.6; skew-x: -2.2; skew-y: -2.2; }
        frame 4 { x: 38.9; y: 70.1; skew-x: -3.2; skew-y: -3.2; }
        frame 5 { x: 38.5; y: 70.5; skew-x: -3.9; skew-y: -3.9; scale-y: 0.888; }
        frame 6 { x: 38; y: 71; skew-x: -4.7; skew-y: -4.7; scale-y: -10000; }
        frame 7 { x: 37.6; y: 71.6; skew-x: -5.7; skew-y: -5.7; scale-y: 0.889; }
        frame 8 { x: 38; y: 71.2; skew-x: -4.7; skew-y: -4.7; scale-y: 0.888; }
        frame 9 { x: 38.4; y: 70.8; skew-x: -3.9; skew-y: -3.9; scale-y: -10000; }
        frame 10 { x: 38.8; y: 70.5; skew-x: -3.2; skew-y: -3.2; scale-y: 0.889; }
        frame 11 { x: 39.3; y: 70; skew-x: -2.2; skew-y: -2.2; scale-y: -10000; }
        frame 12 { x: 39.6; y: 69.7; skew-x: -1.4; skew-y: -1.4; }
        frame 13 { x: 40; y: 69.3; skew-x: -0.7; skew-y: -0.7; }
        frame 14 { x: 40.4; y: 69; skew-x: 0; skew-y: 0; }
        frame 15 { x: 41.6; y: 68.7; skew-x: 2; skew-y: 2; }
        frame 16 { x: 41.9; y: 68.3; skew-x: 2.8; skew-y: 2.8; }
        frame 17 { x: 42.2; y: 68; skew-x: 3.8; skew-y: 3.8; scale-y: 0.888; }
        frame 18 { x: 42.5; y: 67.6; skew-x: 4.8; skew-y: 4.8; scale-y: -10000; }
        frame 19 { x: 42.9; y: 67.3; skew-x: 5.9; skew-y: 5.9; scale-y: 0.889; }
        frame 20 { x: 43.2; y: 66.8; skew-x: 7.5; skew-y: 7.5; scale-x: 0.799; scale-y: 0.888; }
        frame 21 { x: 43.6; y: 66.2; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 44; y: 65.6; skew-x: 11.2; skew-y: 11.2; }
        frame 23 { x: 44.1; y: 65.4; skew-x: 11; skew-y: 11.1; scale-x: 0.81; }
        frame 24 { x: 44.4; y: 65.3; skew-x: 10.8; skew-y: 11.3; scale-x: 0.821; }
        frame 25 { x: -10000; y: 65.2; skew-x: 10.5; skew-y: -10000; scale-x: 0.833; }
        frame 26 { x: 44.9; y: 65.1; skew-x: -10000; skew-y: 11.4; scale-x: 0.844; }
        frame 27 { x: 42; y: 68.2; skew-x: 5.6; skew-y: 7.3; scale-x: -10000; }
        frame 28 { x: 39.3; y: 71.3; skew-x: 0.8; skew-y: 3.3; scale-y: 0.887; }
        frame 29 { x: 36.6; y: 74.4; skew-x: -3.5; skew-y: -0.7; scale-y: -10000; }
        frame 30 { x: 34; y: 77.7; skew-x: -8.4; skew-y: -4.8; scale-x: 0.845; }
        frame 31 { x: 34.6; y: 76.2; skew-x: -6.2; skew-y: -3.7; scale-x: 0.833; }
        frame 32 { x: 35.4; y: 74.9; skew-x: -4.2; skew-y: -2.5; scale-x: 0.822; }
        frame 33 { x: 36; y: 73.5; skew-x: -2.2; skew-y: -1.4; scale-x: 0.811; scale-y: 0.888; }
        frame 34 { x: 36.4; y: 72.3; skew-x: -0.4; skew-y: -0.4; scale-x: 0.799; scale-y: -10000; }
        frame 35 { x: 37.5; y: 71.8; skew-x: -0.9; skew-y: 0.8; scale-x: 0.801; }
        frame 36 { x: 38.8; y: 71.5; skew-x: -1.4; skew-y: 2; scale-x: 0.804; }
        frame 37 { x: 39.9; y: 71.1; skew-x: -1.9; skew-y: 3.3; scale-x: 0.806; }
        frame 38 { x: 41; y: 70.8; skew-x: -2.4; skew-y: 4.5; scale-x: 0.808; }
        frame 39 { x: 42.3; y: 70.3; skew-x: -3.1; skew-y: 5.9; scale-x: 0.81; scale-y: 0.889; }
        frame 40 { x: 42.8; y: 69.7; skew-x: -0.2; skew-y: 7.3; scale-x: 0.819; scale-y: 0.888; }
        frame 41 { x: 43.1; y: 69.2; skew-x: 2.3; skew-y: 8.5; scale-x: 0.828; scale-y: -10000; }
        frame 42 { x: 43.7; y: 68.6; skew-x: 5; skew-y: 10; scale-x: 0.837; }
        frame 43 { x: 44.5; y: 67.8; skew-x: 7.9; skew-y: 11.4; scale-x: 0.846; }
        frame 44 { x: 41.7; y: 70.2; skew-x: 3.8; skew-y: 7.3; scale-x: 0.845; }
        frame 45 { x: 39.1; y: 72.7; skew-x: -0.2; skew-y: 3.3; scale-x: -10000; scale-y: 0.887; }
        frame 46 { x: 36.5; y: 75.2; skew-x: -4.2; skew-y: -0.7; scale-y: -10000; }
        frame 47 { x: 34; y: 77.7; skew-x: -8.4; skew-y: -4.8; }
        frame 48 { x: 35.3; y: 76.1; skew-x: -6.5; skew-y: -3.7; scale-x: 0.837; }
        frame 49 { x: 36.6; y: 74.6; skew-x: -4.7; skew-y: -2.4; scale-x: 0.829; }
        frame 50 { x: 38; y: 73.1; skew-x: -3; skew-y: -1.2; scale-x: 0.822; scale-y: 0.888; }
        frame 51 { x: 39.3; y: 71.6; skew-x: -1.2; skew-y: -0.2; scale-x: 0.815; scale-y: -10000; }
        frame 52 { x: 40.5; y: 70.1; skew-x: 0.3; skew-y: 0.8; scale-x: 0.807; }
        frame 53 { x: 41.6; y: 68.7; skew-x: 2; skew-y: 2; scale-x: 0.8; scale-y: 0.889; }
        frame 54 { x: 39.6; y: 65.5; skew-x: 8.2; skew-y: -4.1; scale-x: 0.817; scale-y: 0.887; }
        frame 55 { x: 40.2; y: 65.6; skew-x: 8.5; skew-y: -2.4; scale-x: 0.814; scale-y: 0.886; }
        frame 56 { x: 40.6; y: -10000; skew-x: 9; skew-y: -0.7; scale-x: 0.811; scale-y: -10000; }
        frame 57 { x: 41.1; skew-x: 9.5; skew-y: 0.8; scale-x: 0.809; }
        frame 58 { x: 41.6; skew-x: 9.8; skew-y: 2.3; scale-x: 0.806; }
        frame 59 { x: 42.2; y: 65.8; skew-x: 10.3; skew-y: 4; scale-x: 0.803; }
        frame 60 { x: 42.6; y: -10000; skew-x: 10.8; skew-y: 5.7; scale-x: 0.801; }
        frame 61 { x: 39.5; y: 69.5; skew-x: 10.3; skew-y: 4.8; scale-x: 0.8; scale-y: 0.884; }
        frame 62 { x: 36.4; y: 73; skew-x: 10.1; skew-y: 4.1; scale-x: 0.801; scale-y: 0.883; }
        frame 63 { x: 37; y: 72.3; skew-x: -10000; skew-y: -10000; scale-x: 0.8; scale-y: -10000; }
        frame 64 { x: 37.5; y: 71.6; skew-x: 10.3; skew-y: 4.3; scale-x: -10000; scale-y: 0.884; }
        frame 65 { x: 38.1; y: 70.8; skew-x: -10000; skew-y: 4.5; scale-y: -10000; }
        frame 66 { x: 38.8; y: 70.1; skew-y: 4.6; }
        frame 67 { x: 39.5; y: 69.3; skew-y: 4.8; }
        frame 68 { x: 40.1; y: 68.7; skew-x: 10.5; skew-y: 5; scale-x: 0.801; scale-y: 0.885; }
        frame 69 { x: 40.7; y: 67.9; skew-x: -10000; skew-y: 5.1; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 41.4; y: 67.2; skew-y: 5.3; }
        frame 71 { x: 42; y: 66.5; skew-x: 10.6; skew-y: 5.5; }
        frame 72 { x: 42.6; y: 65.8; skew-x: 10.8; skew-y: 5.7; scale-y: 0.886; }
        frame 73 { x: 39.5; y: 69.5; skew-x: 10.3; skew-y: 4.8; scale-x: 0.8; scale-y: 0.884; }
        frame 74 { x: 36.4; y: 73; skew-x: 10.1; skew-y: 4.1; scale-x: 0.801; scale-y: 0.883; }
        frame 75 { x: 37.5; y: 70.5; skew-x: 9.3; skew-y: 1.3; scale-x: 0.806; scale-y: 0.884; }
        frame 76 { x: 38.5; y: 68; skew-x: 8.8; skew-y: -1.2; scale-x: 0.811; scale-y: 0.885; }
        frame 77 { x: 39.6; y: 65.5; skew-x: 8.2; skew-y: -4.1; scale-x: 0.817; scale-y: 0.887; }
        frame 78 { x: 39.1; y: 80.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.889; }
        frame 79 { x: 33.9; y: 67.2; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 28.7; y: 53.9; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.888; }
        frame 81 { x: 23.6; y: 40.6; skew-x: 8.8; skew-y: 8.8; scale-x: 0.8; scale-y: -10000; }
        frame 82 { x: 31.2; y: 27.6; skew-x: 17.8; skew-y: 17.8; scale-x: 0.798; scale-y: 0.887; }
        frame 83 { x: 39; y: 14.8; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: 0.886; }
        frame 84 { x: 47; y: 2.5; skew-x: 36.2; skew-y: 36.2; scale-y: 0.887; }
        frame 85 { x: 47.6; y: 0.7; skew-x: 36.1; skew-y: 36.1; scale-x: 0.797; scale-y: 0.886; }
        frame 86 { x: 48.1; y: -0.9; skew-x: 36.2; skew-y: 36.2; scale-x: 0.798; scale-y: 0.887; }
        frame 87 { x: 48.4; y: -0; skew-x: 36.1; skew-y: 36.1; scale-x: 0.797; scale-y: 0.886; }
        frame 88 { x: 48.6; y: 0.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 48.9; y: 1.7; }
        frame 90 { x: 49.1; y: 2.5; skew-x: 36.2; skew-y: 36.2; scale-x: 0.798; scale-y: 0.887; }
        frame 91 { x: 49.4; y: 28.7; skew-x: 34.6; skew-y: 34.6; scale-x: 0.795; scale-y: 0.884; }
        frame 92 { x: 49.5; y: 55; skew-x: 33.3; skew-y: 33.3; scale-x: -10000; scale-y: 0.883; }
        frame 93 { x: -10000; y: 83; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 94 { y: -10000; cel: -1; }
        frame 95 { cel: -10000; }
        frame 102 { x: 41.6; y: 68.7; skew-x: 2; skew-y: 2; scale-x: 0.8; scale-y: 0.889; cel: 0; }
        frame 103 { x: 43.8; y: 69.2; skew-x: 7.5; skew-y: 7.5; scale-x: 0.799; scale-y: 0.888; cel: -10000; }
        frame 104 { x: 46; y: 69.8; skew-x: 13.3; skew-y: 13.3; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 48.3; y: 70.3; skew-x: 18.9; skew-y: 18.9; }
        frame 106 { x: 48; y: 74.7; skew-x: 20.8; skew-y: 20.8; scale-x: 0.798; scale-y: 0.887; }
        frame 107 { x: 47.8; y: 79; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; scale-y: 0.886; }
        frame 108 { x: 47.5; y: 83.4; skew-x: 24.9; skew-y: 24.9; scale-y: 0.887; }
        frame 109 { x: 45.2; y: 89.5; skew-x: 20; skew-y: 20.6; scale-x: 0.808; scale-y: 0.877; }
        frame 110 { x: 42.9; y: 95.7; skew-x: 15.3; skew-y: 16.3; scale-x: 0.818; scale-y: 0.868; }
        frame 111 { x: 40.5; y: 101.8; skew-x: 10.5; skew-y: 12.1; scale-x: 0.829; scale-y: 0.859; }
        frame 112 { x: 40.6; y: 100.7; skew-x: 10.8; skew-y: 11.6; scale-x: 0.812; scale-y: 0.872; }
        frame 113 { x: 40.8; y: 99.3; skew-x: 11.3; skew-y: 11.3; scale-x: 0.797; scale-y: 0.885; }
        frame 114 { x: -10000; y: 100; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: -10000; }
        frame 115 { y: 100.6; scale-x: 0.797; }
        frame 116 { x: 43; y: 98.1; skew-x: 21; skew-y: 16.8; scale-x: 0.804; scale-y: 0.884; }
        frame 117 { x: 45.6; y: 96; skew-x: 30.8; skew-y: 22.6; scale-x: 0.812; scale-y: -10000; }
        frame 118 { x: 48.5; y: 94; skew-x: 40.6; skew-y: 28.3; scale-x: 0.82; scale-y: 0.883; }
        frame 119 { x: 51.5; y: 92.3; skew-x: 50.5; skew-y: 34.1; scale-x: 0.829; scale-y: 0.884; }
        frame 120 { x: 60.9; y: 92.1; skew-x: 67.5; skew-y: 52.1; scale-x: 0.836; scale-y: 0.87; }
        frame 121 { x: 69.7; y: 93.1; skew-x: 84.5; skew-y: 70.2; scale-x: 0.844; scale-y: 0.857; }
        frame 122 { x: 77.5; y: 95.6; skew-x: 101.4; skew-y: 88.1; scale-x: 0.852; scale-y: 0.845; }
        frame 123 { x: 83.3; y: 99.7; skew-x: 106.5; skew-y: 93.3; scale-x: 0.851; scale-y: -10000; }
        frame 124 { x: 89.1; y: 103.9; skew-x: 111.8; skew-y: 98.3; scale-x: -10000; scale-y: 0.844; }
        frame 125 { x: 94.7; y: 108.1; skew-x: 117; skew-y: 103.6; scale-x: 0.85; scale-y: -10000; }
        frame 126 { x: 100.3; y: 112.5; skew-x: 122.1; skew-y: 108.8; scale-x: -10000; scale-y: 0.843; }
        frame 127 { x: 105.7; y: 116.8; skew-x: 127.5; skew-y: 114.1; scale-x: 0.851; scale-y: 0.844; }
        frame 128 { x: 105.8; y: 117.8; skew-x: 129.1; skew-y: 112.8; scale-x: 0.836; scale-y: 0.853; }
        frame 129 { x: 106; y: 118.8; skew-x: 130.9; skew-y: 111.6; scale-x: 0.824; scale-y: 0.865; }
        frame 130 { x: 105.8; y: 117.8; skew-x: 129.1; skew-y: 112.8; scale-x: 0.836; scale-y: 0.853; }
        frame 131 { x: 105.7; y: 116.8; skew-x: 127.5; skew-y: 114.1; scale-x: 0.851; scale-y: 0.844; }
        frame 132 { x: -10000; y: -10000; skew-x: 127.4; skew-y: -10000; scale-x: 0.85; scale-y: 0.843; }
        frame 133 { skew-x: 127.5; scale-x: 0.851; scale-y: 0.844; }
        frame 134 { x: 41.8; y: 67.3; skew-x: 0.8; skew-y: 0.8; scale-x: 0.821; scale-y: 0.935; }
        frame 135 { x: 42; y: 67; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 136 { x: 42.1; y: 66.8; skew-x: 1.8; skew-y: 1.8; }
        frame 137 { x: 42.4; y: 66.5; skew-x: 2.3; skew-y: 2.3; }
        frame 138 { x: 42.5; y: 66.3; skew-x: 2.8; skew-y: 2.8; }
        frame 139 { x: 42.8; y: 66.2; skew-x: 3.3; skew-y: 3.3; }
        frame 140 { x: 43.2; y: 65.8; skew-x: 4; skew-y: 4; }
        frame 141 { x: 43.5; y: 65.7; skew-x: 4.6; skew-y: 4.6; }
        frame 142 { x: 43.8; y: 65.3; skew-x: 5.3; skew-y: 5.3; }
        frame 143 { x: 44.1; y: 65.2; skew-x: 6; skew-y: 6; }
        frame 144 { x: 44.5; y: 65; skew-x: 6.5; skew-y: 6.5; }
        frame 145 { x: 44.9; y: 64.7; skew-x: 7.3; skew-y: 7.3; }
        frame 146 { x: 42.5; y: 66.1; skew-x: 2.5; skew-y: 2.5; }
        frame 147 { x: 40.4; y: 67.6; skew-x: -1.9; skew-y: -1.9; scale-x: 0.82; scale-y: 0.934; }
        frame 148 { x: 38.1; y: 69.2; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 36; y: 70.7; skew-x: -11.4; skew-y: -11.4; }
        frame 150 { x: -10000; y: 71.2; skew-x: -10000; skew-y: -10000; scale-x: 0.819; scale-y: 0.933; }
        frame 151 { y: 71.6; scale-x: 0.82; scale-y: 0.934; }
        frame 152 { x: 36.6; y: 71.1; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: 0.933; }
        frame 153 { x: 37.1; y: 70.5; skew-x: -8.7; skew-y: -8.7; scale-y: 0.934; }
        frame 154 { x: 37.9; y: 70; skew-x: -7.2; skew-y: -7.2; scale-y: -10000; }
        frame 155 { x: 38.5; y: 69.5; skew-x: -5.9; skew-y: -5.9; }
        frame 156 { x: 39; y: 69; skew-x: -4.7; skew-y: -4.7; }
        frame 157 { x: 39.7; y: 68.4; skew-x: -3.2; skew-y: -3.2; }
        frame 158 { x: 40.3; y: 68; skew-x: -1.9; skew-y: -1.9; }
        frame 159 { x: 40.9; y: 67.4; skew-x: -0.5; skew-y: -0.5; }
        frame 160 { x: 41.5; y: 67; skew-x: 0.5; skew-y: 0.5; scale-y: 0.935; }
        frame 161 { x: 42.1; y: 66.5; skew-x: 1.8; skew-y: 1.8; scale-x: 0.821; scale-y: -10000; }
        frame 162 { x: 42.8; y: 66; skew-x: 3.3; skew-y: 3.3; scale-x: 0.82; }
        frame 163 { x: 43.5; y: 65.6; skew-x: 4.5; skew-y: 4.5; scale-x: 0.821; }
        frame 164 { x: 44.1; y: 65.2; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; }
        frame 165 { x: 44.9; y: 64.7; skew-x: 7.3; skew-y: 7.3; }
        frame 166 { x: 42.5; y: 66.1; skew-x: 2.5; skew-y: 2.5; }
        frame 167 { x: 40.4; y: 67.6; skew-x: -1.9; skew-y: -1.9; scale-x: 0.82; scale-y: 0.934; }
        frame 168 { x: 38.1; y: 69.2; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 36; y: 70.7; skew-x: -11.4; skew-y: -11.4; }
        frame 170 { x: -10000; y: 71.2; skew-x: -10000; skew-y: -10000; scale-x: 0.819; scale-y: 0.933; }
        frame 171 { y: 71.6; scale-x: 0.82; scale-y: 0.934; }
        frame 172 { x: 37.5; y: 70.5; skew-x: -8.2; skew-y: -8.2; scale-x: -10000; scale-y: -10000; }
        frame 173 { x: 38.9; y: 69.3; skew-x: -5.2; skew-y: -5.2; }
        frame 174 { x: 40.3; y: 68.2; skew-x: -2.2; skew-y: -2.2; scale-x: 0.821; scale-y: 0.935; }
        frame 175 { x: 41.8; y: 67.3; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_dolphinrider_body1";
        frame-count: 176;
        frame 0 { x: 23.6; y: 43; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BOBSLED_BODY1; }
        frame 1 { x: 22.8; y: 43.5; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 22.1; y: 44.2; skew-x: -1.4; skew-y: -1.4; }
        frame 3 { x: 21.3; y: 44.8; skew-x: -2.2; skew-y: -2.2; }
        frame 4 { x: 20.5; y: 45.5; skew-x: -3.2; skew-y: -3.2; }
        frame 5 { x: 19.8; y: 46.1; skew-x: -3.9; skew-y: -3.9; }
        frame 6 { x: 19; y: 46.8; skew-x: -4.7; skew-y: -4.7; }
        frame 7 { x: 18.2; y: 47.4; skew-x: -5.7; skew-y: -5.7; }
        frame 8 { x: 19; y: 46.7; skew-x: -4.7; skew-y: -4.7; }
        frame 9 { x: 19.8; y: 46.1; skew-x: -3.9; skew-y: -3.9; }
        frame 10 { x: 20.5; y: 45.5; skew-x: -3.2; skew-y: -3.2; }
        frame 11 { x: 21.3; y: 44.8; skew-x: -2.2; skew-y: -2.2; }
        frame 12 { x: 22; y: 44.2; skew-x: -1.4; skew-y: -1.4; }
        frame 13 { x: 22.8; y: 43.6; skew-x: -0.7; skew-y: -0.7; }
        frame 14 { x: 23.6; y: 43; skew-x: 0; skew-y: 0; }
        frame 15 { x: 25.8; y: 42.1; skew-x: 2; skew-y: 2; }
        frame 16 { x: 26.5; y: 41.6; skew-x: 2.8; skew-y: 2.8; }
        frame 17 { x: 27.3; y: 40.9; skew-x: 3.8; skew-y: 3.8; }
        frame 18 { x: 28; y: 40.4; skew-x: 4.8; skew-y: 4.8; }
        frame 19 { x: 28.8; y: 39.8; skew-x: 5.9; skew-y: 5.9; }
        frame 20 { x: 30.4; y: 38.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 21 { x: 32; y: 37.4; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 33.7; y: 36; skew-x: 13.4; skew-y: 13.4; }
        frame 23 { x: 34.7; y: 35.6; skew-x: 14.8; skew-y: 14.8; }
        frame 24 { x: 35.9; y: 35.2; skew-x: 16; skew-y: 16; }
        frame 25 { x: 36.9; y: 34.7; skew-x: 17.3; skew-y: 17.3; scale-x: 0.798; scale-y: 0.798; }
        frame 26 { x: 38.1; y: 34.3; skew-x: 18.7; skew-y: 18.7; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: 32.4; y: 38.3; skew-x: 13; skew-y: 13; scale-x: 0.798; scale-y: 0.798; }
        frame 28 { x: 26.7; y: 42.5; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 21.2; y: 46.9; skew-x: 1.5; skew-y: 1.5; }
        frame 30 { x: 15.8; y: 51.4; skew-x: -4; skew-y: -4; }
        frame 31 { x: 16.7; y: 50.2; skew-x: -3; skew-y: -3; }
        frame 32 { x: 17.6; y: 49; skew-x: -2.2; skew-y: -2.2; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 18.4; y: 47.8; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 19.3; y: 46.5; skew-x: -0.4; skew-y: -0.4; }
        frame 35 { x: 21.2; y: 45.1; skew-x: 0.8; skew-y: 0.8; }
        frame 36 { x: 23.1; y: 43.8; skew-x: 2; skew-y: 2; }
        frame 37 { x: 24.9; y: 42.4; skew-x: 3.3; skew-y: 3.3; }
        frame 38 { x: 26.9; y: 41; skew-x: 4.5; skew-y: 4.5; }
        frame 39 { x: 28.8; y: 39.8; skew-x: 5.9; skew-y: 5.9; scale-x: 0.8; scale-y: 0.8; }
        frame 40 { x: 30.8; y: 38.5; skew-x: 8.5; skew-y: 8.5; scale-x: 0.799; scale-y: 0.799; }
        frame 41 { x: 32.8; y: 37.3; skew-x: 11.3; skew-y: 11.3; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 34.8; y: 35.9; skew-x: 14.1; skew-y: 14.1; }
        frame 43 { x: 37; y: 34.7; skew-x: 17; skew-y: 17; }
        frame 44 { x: 31.5; y: 38.7; skew-x: 11.6; skew-y: 11.6; scale-x: 0.798; scale-y: 0.798; }
        frame 45 { x: 26.1; y: 42.8; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 20.8; y: 47; skew-x: 1; skew-y: 1; }
        frame 47 { x: 15.8; y: 51.4; skew-x: -4; skew-y: -4; }
        frame 48 { x: 17.5; y: 49.9; skew-x: -2.9; skew-y: -2.9; }
        frame 49 { x: 19.2; y: 48.3; skew-x: -1.9; skew-y: -1.9; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: 20.8; y: 46.9; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 22.4; y: 45.3; skew-x: 0; skew-y: 0; }
        frame 52 { x: 24.1; y: 43.8; skew-x: 1; skew-y: 1; scale-x: 0.8; scale-y: 0.8; }
        frame 53 { x: 25.8; y: 42.1; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 9.2; y: 52; skew-x: -16.3; skew-y: -22.9; scale-x: 0.804; scale-y: 0.799; }
        frame 55 { x: 10.7; y: 50.5; skew-x: -13.7; skew-y: -20.4; scale-x: 0.803; scale-y: 0.798; }
        frame 56 { x: 12.1; y: 49; skew-x: -11.2; skew-y: -17.9; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 13.8; y: 47.5; skew-x: -8.7; skew-y: -15.2; scale-y: 0.797; }
        frame 58 { x: 15.3; y: 46; skew-x: -6.2; skew-y: -12.7; scale-y: -10000; }
        frame 59 { x: 17; y: 44.6; skew-x: -3.5; skew-y: -10.2; }
        frame 60 { x: 18.6; y: 43.1; skew-x: -1.1; skew-y: -7.8; }
        frame 61 { x: 11.6; y: 52; skew-x: -10.2; skew-y: -15.7; scale-x: 0.802; scale-y: 0.812; }
        frame 62 { x: 4.8; y: 61; skew-x: -19.7; skew-y: -23.9; scale-x: 0.801; scale-y: 0.829; }
        frame 63 { x: 6.2; y: 59.1; skew-x: -17.7; skew-y: -22.2; scale-x: -10000; scale-y: 0.824; }
        frame 64 { x: 7.5; y: 57.4; skew-x: -15.9; skew-y: -20.7; scale-y: 0.821; }
        frame 65 { x: 8.9; y: 55.5; skew-x: -14; skew-y: -19; scale-y: 0.818; }
        frame 66 { x: 10.2; y: 53.8; skew-x: -12.2; skew-y: -17.4; scale-y: 0.815; }
        frame 67 { x: 11.5; y: 52; skew-x: -10.2; skew-y: -15.7; scale-x: 0.802; scale-y: 0.812; }
        frame 68 { x: 12.9; y: 50.1; skew-x: -8.4; skew-y: -14.2; scale-x: -10000; scale-y: 0.809; }
        frame 69 { x: 14.3; y: 48.5; skew-x: -6.7; skew-y: -12.7; scale-y: 0.806; }
        frame 70 { x: 15.7; y: 46.6; skew-x: -4.7; skew-y: -10.9; scale-y: 0.803; }
        frame 71 { x: 17.2; y: 44.9; skew-x: -2.9; skew-y: -9.4; scale-x: 0.803; scale-y: 0.8; }
        frame 72 { x: 18.6; y: 43.1; skew-x: -1.1; skew-y: -7.8; scale-x: -10000; scale-y: 0.797; }
        frame 73 { x: 11.6; y: 52; skew-x: -10.2; skew-y: -15.7; scale-x: 0.802; scale-y: 0.812; }
        frame 74 { x: 4.8; y: 61; skew-x: -19.7; skew-y: -23.9; scale-x: 0.801; scale-y: 0.829; }
        frame 75 { x: 6.3; y: 58; skew-x: -18.5; skew-y: -23.5; scale-x: 0.802; scale-y: 0.818; }
        frame 76 { x: 7.7; y: 55; skew-x: -17.4; skew-y: -23.2; scale-x: 0.803; scale-y: 0.808; }
        frame 77 { x: 9.2; y: 52; skew-x: -16.3; skew-y: -22.9; scale-x: 0.804; scale-y: 0.799; }
        frame 78 { x: 12.9; y: 63.5; skew-x: -17.2; skew-y: -17.2; scale-x: 0.799; scale-y: -10000; }
        frame 79 { x: 12.6; y: 45.3; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; }
        frame 80 { x: 13.2; y: 27.6; skew-x: 5; skew-y: 5; scale-x: 0.798; scale-y: 0.798; }
        frame 81 { x: 14.4; y: 10.7; skew-x: 16.3; skew-y: 16.3; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 15.5; y: 2.4; skew-x: 7.5; skew-y: 7.5; scale-x: 0.797; scale-y: 0.797; }
        frame 83 { x: 17; y: -5.4; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 19; y: -12.9; skew-x: -9.5; skew-y: -9.5; }
        frame 85 { x: 19.6; y: -14.7; skew-x: -9.4; skew-y: -9.4; }
        frame 86 { x: 20.1; y: -16.5; skew-x: -9.5; skew-y: -9.5; }
        frame 87 { x: 20.3; y: -15.7; skew-x: -9.4; skew-y: -9.4; }
        frame 88 { x: 20.6; y: -14.8; skew-x: -10000; skew-y: -10000; }
        frame 89 { x: 20.9; y: -13.9; }
        frame 90 { x: 21.1; y: -12.9; skew-x: -9.5; skew-y: -9.5; }
        frame 91 { x: 21.4; y: 13.7; skew-x: -8.7; skew-y: -8.7; scale-x: 0.796; scale-y: 0.796; }
        frame 92 { x: 21.7; y: 40.4; skew-x: -8; skew-y: -8; scale-x: 0.795; scale-y: 0.795; }
        frame 93 { x: 21.8; y: 67.2; skew-x: -7.4; skew-y: -7.4; scale-x: 0.794; scale-y: 0.794; }
        frame 94 { x: 23.1; y: 72.6; skew-x: -12.9; skew-y: -12.9; scale-x: 0.793; scale-y: 0.793; }
        frame 95 { x: 24.6; y: 78.2; skew-x: -18.5; skew-y: -18.5; scale-x: 0.794; scale-y: 0.794; }
        frame 96 { x: 25.4; y: 75.4; skew-x: -15.2; skew-y: -15.2; scale-x: 0.793; scale-y: 0.793; }
        frame 97 { x: 26.1; y: 72.8; skew-x: -12; skew-y: -12; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 26.8; y: 71.7; skew-x: -10; skew-y: -10; }
        frame 99 { x: 27.5; y: 70.8; skew-x: -8.2; skew-y: -8.2; }
        frame 100 { x: 28.2; y: 69.8; skew-x: -6.4; skew-y: -6.4; }
        frame 101 { x: 28.9; y: 68.8; skew-x: -4.6; skew-y: -4.6; }
        frame 102 { x: 25.8; y: 42.1; skew-x: 2; skew-y: 2; scale-x: 0.8; scale-y: 0.8; }
        frame 103 { x: 30.6; y: 41.5; skew-x: 7.5; skew-y: 7.5; scale-x: 0.799; scale-y: 0.799; }
        frame 104 { x: 35.6; y: 40.7; skew-x: 13.3; skew-y: 13.3; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 40.9; y: 40.3; skew-x: 18.9; skew-y: 18.9; }
        frame 106 { x: 41.6; y: 44.5; skew-x: 20.8; skew-y: 20.8; scale-x: 0.798; scale-y: 0.798; }
        frame 107 { x: 42.4; y: 48.8; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 43.4; y: 52.9; skew-x: 24.9; skew-y: 24.9; }
        frame 109 { x: 38.4; y: 59.8; skew-x: 20; skew-y: 20.6; scale-x: 0.808; scale-y: 0.789; }
        frame 110 { x: 33.5; y: 67; skew-x: 15.3; skew-y: 16.3; scale-x: 0.818; scale-y: 0.781; }
        frame 111 { x: 28.9; y: 74.2; skew-x: 10.5; skew-y: 12.1; scale-x: 0.829; scale-y: 0.773; }
        frame 112 { x: 29.2; y: 72.2; skew-x: 10.8; skew-y: 11.6; scale-x: 0.812; scale-y: 0.785; }
        frame 113 { x: 29.7; y: 70.2; skew-x: 11.3; skew-y: 11.3; scale-x: 0.797; scale-y: 0.797; }
        frame 114 { x: 35.8; y: 68.5; skew-x: 20.3; skew-y: 20.3; scale-x: 0.795; scale-y: 0.795; }
        frame 115 { x: 42; y: 67.1; skew-x: 29.6; skew-y: 29.6; scale-x: 0.796; scale-y: 0.796; }
        frame 116 { x: 50; y: 66.5; skew-x: 39.3; skew-y: 39.3; scale-x: 0.794; scale-y: 0.794; }
        frame 117 { x: 58; y: 66.7; skew-x: 49.1; skew-y: 49.1; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: 65.9; y: 67.5; skew-x: 58.7; skew-y: 58.7; scale-x: 0.793; scale-y: 0.793; }
        frame 119 { x: 73.8; y: 69.2; skew-x: 68.5; skew-y: 68.5; scale-x: 0.794; scale-y: 0.794; }
        frame 120 { x: 84.3; y: 73.6; skew-x: 77.7; skew-y: 77.7; scale-x: 0.793; scale-y: 0.793; }
        frame 121 { x: 94.3; y: 78.8; skew-x: 87.2; skew-y: 87.2; scale-x: -10000; scale-y: -10000; }
        frame 122 { x: 103.9; y: 84.3; skew-x: 96.3; skew-y: 96.3; }
        frame 123 { x: 110.3; y: 90.8; skew-x: 101.5; skew-y: 101.5; scale-x: 0.792; scale-y: 0.792; }
        frame 124 { x: 116.6; y: 97.5; skew-x: 106.6; skew-y: 106.6; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: 122.7; y: 104.3; skew-x: 111.8; skew-y: 111.8; scale-x: 0.791; scale-y: 0.791; }
        frame 126 { x: 128.7; y: 111.3; skew-x: 117.1; skew-y: 117.1; scale-x: -10000; scale-y: -10000; }
        frame 127 { x: 134.4; y: 118.2; skew-x: 122.4; skew-y: 122.4; scale-x: 0.792; scale-y: 0.792; }
        frame 128 { x: 135.2; y: 119.3; skew-x: 124.1; skew-y: 120.8; scale-x: 0.774; scale-y: 0.795; }
        frame 129 { x: 136; y: 120.2; skew-x: 125.7; skew-y: 119.2; scale-x: 0.759; scale-y: 0.8; }
        frame 130 { x: 134.8; y: 116.3; skew-x: 120.8; skew-y: 117.5; scale-x: 0.774; scale-y: 0.795; }
        frame 131 { x: 133.5; y: 112.5; skew-x: 115.8; skew-y: 115.8; scale-x: 0.792; scale-y: 0.792; }
        frame 132 { x: 134; y: 115.3; skew-x: 119.1; skew-y: 119.1; scale-x: 0.791; scale-y: 0.791; }
        frame 133 { x: 134.4; y: 118.2; skew-x: 122.4; skew-y: 122.4; scale-x: 0.792; scale-y: 0.792; }
        frame 134 { x: 28.8; y: 42.1; skew-x: 3; skew-y: 2; scale-x: 0.8; scale-y: 0.8; }
        frame 135 { x: 29.3; y: 41.6; skew-x: 3.6; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 136 { x: 29.8; y: 40.9; skew-x: 4.3; skew-y: 3.8; }
        frame 137 { x: 30.3; y: 40.2; skew-x: 5; skew-y: 4.8; }
        frame 138 { x: 30.9; y: 39.6; skew-x: 5.9; skew-y: 5.9; }
        frame 139 { x: 32.7; y: 38.4; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 140 { x: 34.5; y: 37; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: 36.4; y: 35.5; skew-x: 13.4; skew-y: 13.4; }
        frame 142 { x: 37.4; y: 35.1; skew-x: 14.8; skew-y: 14.8; }
        frame 143 { x: 38.3; y: 34.6; skew-x: 16; skew-y: 16; }
        frame 144 { x: 39.3; y: 34.1; skew-x: 17.3; skew-y: 17.3; scale-x: 0.798; scale-y: 0.798; }
        frame 145 { x: 40.4; y: 33.9; skew-x: 18.7; skew-y: 18.7; scale-x: 0.799; scale-y: 0.799; }
        frame 146 { x: 34.5; y: 36.4; skew-x: 13; skew-y: 13; scale-x: 0.798; scale-y: 0.798; }
        frame 147 { x: 28.8; y: 39.1; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 23.2; y: 42; skew-x: 1.5; skew-y: 1.5; }
        frame 149 { x: 17.8; y: 45.1; skew-x: -4; skew-y: -4; }
        frame 150 { x: 17.5; y: 45.8; skew-x: -4.4; skew-y: -4.4; }
        frame 151 { x: 17.2; y: 46.4; skew-x: -5; skew-y: -5; }
        frame 152 { x: 17.8; y: 46; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 153 { x: 18.4; y: 45.5; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 154 { x: 20; y: 44.6; skew-x: -4.4; skew-y: -4.4; }
        frame 155 { x: 21.4; y: 44; skew-x: -2.7; skew-y: -2.7; }
        frame 156 { x: 22.8; y: 43.4; skew-x: -1.2; skew-y: -1.2; scale-x: 0.8; scale-y: 0.8; }
        frame 157 { x: 24.3; y: 42.8; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 25.8; y: 42.1; skew-x: 2; skew-y: 2; }
        frame 159 { x: 27.3; y: 41; skew-x: 4; skew-y: 4; }
        frame 160 { x: 28.9; y: 39.8; skew-x: 6.3; skew-y: 6.3; scale-x: 0.799; scale-y: 0.799; }
        frame 161 { x: 30.4; y: 38.8; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 32.1; y: 37.7; skew-x: 10.5; skew-y: 10.5; }
        frame 163 { x: 33.7; y: 36.6; skew-x: 12.6; skew-y: 12.6; }
        frame 164 { x: 35.4; y: 35.6; skew-x: 14.8; skew-y: 14.8; }
        frame 165 { x: 37; y: 34.7; skew-x: 17; skew-y: 17; }
        frame 166 { x: 32; y: 37.1; skew-x: 11.6; skew-y: 11.6; scale-x: 0.798; scale-y: 0.798; }
        frame 167 { x: 27.1; y: 39.6; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 22.3; y: 42.4; skew-x: 1; skew-y: 1; }
        frame 169 { x: 17.8; y: 45.1; skew-x: -4; skew-y: -4; }
        frame 170 { x: 19.1; y: 44.6; skew-x: -2.9; skew-y: -2.9; }
        frame 171 { x: 20.5; y: 44.1; skew-x: -1.9; skew-y: -1.9; scale-x: 0.799; scale-y: 0.799; }
        frame 172 { x: 21.8; y: 43.6; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 173 { x: 23.1; y: 43.1; skew-x: 0; skew-y: 0; }
        frame 174 { x: 24.4; y: 42.6; skew-x: 1; skew-y: 1; scale-x: 0.8; scale-y: 0.8; }
        frame 175 { x: 25.8; y: 42.1; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_dolphinrider_outerleg_foot2";
        frame-count: 176;
        frame 0 { x: 41.8; y: 125.1; skew-x: 4.5; skew-y: 4.5; scale-x: 0.8; scale-y: 0.739; image: IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERLEG_FOOT2; }
        frame 1 { x: 41.7; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 41.6; }
        frame 3 { x: 41.5; }
        frame 4 { x: -10000; }
        frame 5 { x: 41.4; }
        frame 6 { x: 41.3; y: 125; }
        frame 7 { x: -10000; y: -10000; skew-x: 4.6; skew-y: 4.6; }
        frame 8 { y: 125.1; skew-x: 4.5; skew-y: 4.5; }
        frame 9 { x: 41.4; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 10 { x: 41.5; }
        frame 11 { x: -10000; }
        frame 12 { x: 41.6; }
        frame 13 { x: 41.7; }
        frame 14 { x: 41.8; }
        frame 15 { x: 45; y: 125.9; skew-x: -1.7; skew-y: -1.7; scale-x: 0.799; }
        frame 16 { x: 42.8; y: -10000; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; }
        frame 17 { x: 40.6; y: 126; skew-x: -5.7; skew-y: -5.7; }
        frame 18 { x: 38.6; y: -10000; skew-x: -7.9; skew-y: -7.9; scale-y: 0.738; }
        frame 19 { x: 36.4; y: 126; skew-x: -10; skew-y: -10; scale-y: 0.739; }
        frame 20 { x: 35.1; y: 126.3; skew-x: -16.4; skew-y: -16.4; scale-x: 0.798; scale-y: 0.738; }
        frame 21 { x: 34.1; y: 126.5; skew-x: -22.9; skew-y: -22.9; scale-x: 0.797; scale-y: 0.737; }
        frame 22 { x: 33.1; y: 126.9; skew-x: -29.5; skew-y: -29.5; scale-x: 0.798; scale-y: 0.738; }
        frame 23 { x: 31.1; y: 124.8; skew-x: -22.7; skew-y: -22.7; scale-x: 0.797; scale-y: 0.737; }
        frame 24 { x: 29.1; y: 122.8; skew-x: -15.9; skew-y: -15.9; scale-x: -10000; scale-y: 0.736; }
        frame 25 { x: 27.1; y: 120.7; skew-x: -9.2; skew-y: -9.2; scale-x: 0.796; scale-y: -10000; }
        frame 26 { x: 25.2; y: 118.7; skew-x: -2.6; skew-y: -2.6; scale-x: 0.797; }
        frame 27 { x: 26.5; y: 119.9; skew-x: -0.4; skew-y: -0.4; scale-x: 0.796; }
        frame 28 { x: 27.8; y: 121.1; skew-x: 1.7; skew-y: 1.7; scale-x: 0.797; scale-y: 0.737; }
        frame 29 { x: 29.1; y: 122.2; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 30.4; y: 123.5; skew-x: 6.1; skew-y: 6.1; }
        frame 31 { x: 31.5; y: -10000; skew-x: 6; skew-y: 6; }
        frame 32 { x: 32.5; skew-x: -10000; skew-y: -10000; }
        frame 33 { x: 33.5; }
        frame 34 { x: 34.6; skew-x: 6.1; skew-y: 6.1; }
        frame 35 { x: 36.4; y: 123.7; skew-x: 6; skew-y: 6; }
        frame 36 { x: 38.2; y: 123.8; skew-x: -10000; skew-y: -10000; }
        frame 37 { x: 40; y: 124; }
        frame 38 { x: 41.8; y: 124.1; }
        frame 39 { x: 43.6; y: 124.2; skew-x: 6.1; skew-y: 6.1; }
        frame 40 { x: 45.8; y: -10000; skew-x: 6; skew-y: 6; }
        frame 41 { x: 47.9; skew-x: -10000; skew-y: -10000; }
        frame 42 { x: 50; }
        frame 43 { x: 52; skew-x: 6.1; skew-y: 6.1; }
        frame 44 { x: 53.6; y: 124.6; skew-x: 2.7; skew-y: 2.7; }
        frame 45 { x: 55.3; y: 124.8; skew-x: -0.7; skew-y: -0.7; scale-x: 0.796; scale-y: 0.736; }
        frame 46 { x: 56.9; y: 125.1; skew-x: -4.1; skew-y: -4.1; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 58.6; y: 125.3; skew-x: -7.6; skew-y: -7.6; }
        frame 48 { x: 56.4; y: 125.4; skew-x: -6.4; skew-y: -6.4; }
        frame 49 { x: 54; y: 125.5; skew-x: -5.4; skew-y: -5.4; scale-x: 0.797; scale-y: 0.737; }
        frame 50 { x: 51.8; y: 125.6; skew-x: -4.6; skew-y: -4.6; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 49.5; y: -10000; skew-x: -3.6; skew-y: -3.6; scale-x: 0.798; scale-y: 0.738; }
        frame 52 { x: 47.2; y: 125.7; skew-x: -2.6; skew-y: -2.6; scale-x: 0.799; scale-y: -10000; }
        frame 53 { x: 45; y: 125.9; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: 0.739; }
        frame 54 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 55 { x: 36.4; y: 126; skew-x: -10; skew-y: -10; }
        frame 56 { x: 34.6; y: 126.4; skew-x: -19.7; skew-y: -19.7; scale-x: 0.798; scale-y: 0.737; }
        frame 57 { x: 33.1; y: 126.9; skew-x: -29.5; skew-y: -29.5; scale-x: -10000; scale-y: 0.738; }
        frame 58 { x: 30.4; y: 124.1; skew-x: -20.4; skew-y: -20.4; scale-x: 0.797; scale-y: 0.737; }
        frame 59 { x: 27.7; y: 121.3; skew-x: -11.4; skew-y: -11.4; scale-x: 0.796; scale-y: 0.736; }
        frame 60 { x: 25.2; y: 118.7; skew-x: -2.6; skew-y: -2.6; scale-x: 0.797; scale-y: -10000; }
        frame 61 { x: 27.8; y: 121.1; skew-x: 1.7; skew-y: 1.7; scale-x: -10000; scale-y: 0.737; }
        frame 62 { x: 30.4; y: 123.5; skew-x: 6.1; skew-y: 6.1; scale-y: -10000; }
        frame 63 { x: 31.8; y: -10000; skew-x: 6; skew-y: 6; }
        frame 64 { x: 33.2; skew-x: -10000; skew-y: -10000; }
        frame 65 { x: 34.6; skew-x: 6.1; skew-y: 6.1; }
        frame 66 { x: 36.9; y: 123.8; skew-x: 6; skew-y: 6; }
        frame 67 { x: 39.1; y: 123.9; skew-x: -10000; skew-y: -10000; }
        frame 68 { x: 41.4; y: 124.1; }
        frame 69 { x: 43.6; y: 124.2; skew-x: 6.1; skew-y: 6.1; }
        frame 70 { x: 46.5; y: -10000; skew-x: 6; skew-y: 6; }
        frame 71 { x: 49.3; skew-x: -10000; skew-y: -10000; }
        frame 72 { x: 52; skew-x: 6.1; skew-y: 6.1; }
        frame 73 { x: 55.3; y: 124.8; skew-x: -0.7; skew-y: -0.7; scale-x: 0.796; scale-y: 0.736; }
        frame 74 { x: 58.6; y: 125.3; skew-x: -7.6; skew-y: -7.6; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 54; y: 125.5; skew-x: -5.4; skew-y: -5.4; scale-x: 0.797; scale-y: 0.737; }
        frame 76 { x: 49.5; y: 125.6; skew-x: -3.6; skew-y: -3.6; scale-x: 0.798; scale-y: 0.738; }
        frame 77 { x: 45; y: 125.9; skew-x: -1.7; skew-y: -1.7; scale-x: 0.799; scale-y: 0.739; }
        frame 78 { x: 39.9; y: 126.1; skew-x: -16.6; skew-y: -16.6; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 42; y: 123.5; skew-x: -38.3; skew-y: -38.3; scale-x: 0.796; scale-y: 0.736; }
        frame 80 { x: 45.4; y: 121.3; skew-x: -60.1; skew-y: -60.1; scale-x: 0.795; scale-y: 0.735; }
        frame 81 { x: 49.8; y: 118.8; skew-x: -81.9; skew-y: -81.9; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 31; y: 93.7; skew-x: -40.5; skew-y: -40.5; scale-x: 0.793; scale-y: 0.733; }
        frame 83 { x: 21.9; y: 64.5; skew-x: 0.7; skew-y: 0.7; scale-x: 0.792; scale-y: 0.732; }
        frame 84 { x: 20.7; y: 38.5; skew-x: 41.9; skew-y: 41.9; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 21.5; y: 33.4; skew-x: 53.1; skew-y: 53.1; scale-x: 0.79; scale-y: 0.73; }
        frame 86 { x: 22.2; y: 28.3; skew-x: 64.2; skew-y: 64.2; scale-x: 0.791; scale-y: 0.731; }
        frame 87 { x: 22.6; y: 25.7; skew-x: 61.9; skew-y: 61.9; scale-x: 0.789; scale-y: 0.729; }
        frame 88 { x: 23; y: 23.2; skew-x: 59.7; skew-y: 59.7; scale-x: 0.788; scale-y: 0.728; }
        frame 89 { x: 23.5; y: 20.6; skew-x: 57.2; skew-y: 57.2; scale-x: 0.787; scale-y: -10000; }
        frame 90 { x: -10000; y: 17.8; skew-x: 54.9; skew-y: 54.9; scale-x: -10000; }
        frame 91 { x: 24.1; y: 56; skew-x: 39.4; skew-y: 39.4; scale-x: 0.784; scale-y: 0.725; }
        frame 92 { x: 24.7; y: 94.8; skew-x: 23.8; skew-y: 23.8; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 37.1; y: 106.2; skew-x: -10000; skew-y: -10000; }
        frame 94 { x: -10000; y: -10000; cel: -1; }
        frame 95 { cel: -10000; }
        frame 102 { x: 45; y: 125.9; skew-x: -1.7; skew-y: -1.7; scale-x: 0.799; scale-y: 0.739; cel: 0; }
        frame 103 { x: -10000; y: -10000; skew-x: -1.6; skew-y: -1.6; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 104 { skew-x: -10000; skew-y: -10000; }
        frame 105 { skew-x: -1.7; skew-y: -1.7; }
        frame 106 { x: 45; y: 126.1; skew-x: -3.2; skew-y: -3.2; }
        frame 107 { x: -10000; y: 126.3; skew-x: -4.7; skew-y: -4.7; }
        frame 108 { x: 45.3; y: 126.4; skew-x: -6.5; skew-y: -6.5; }
        frame 109 { x: 45; y: 126.8; skew-x: -9.8; skew-y: -6.6; scale-x: 0.809; scale-y: 0.734; }
        frame 110 { x: 44.8; y: 127.3; skew-x: -13.2; skew-y: -6.7; scale-x: 0.82; scale-y: 0.731; }
        frame 111 { x: 44.5; y: 127.7; skew-x: -16.7; skew-y: -7; scale-x: 0.832; scale-y: 0.727; }
        frame 112 { x: -10000; y: 127.3; skew-x: -17.2; skew-y: -6.8; scale-x: 0.817; scale-y: 0.738; }
        frame 113 { x: 44.7; y: 127.2; skew-x: -18; skew-y: -6.5; scale-x: 0.803; scale-y: 0.751; }
        frame 114 { x: -10000; y: -10000; skew-x: -17.8; skew-y: -10000; scale-x: 0.802; scale-y: 0.75; }
        frame 115 { skew-x: -18; scale-x: 0.803; scale-y: 0.751; }
        frame 116 { skew-x: -17.8; scale-x: 0.802; scale-y: 0.75; }
        frame 117 { skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 119 { skew-x: -18; scale-x: 0.803; scale-y: 0.751; }
        frame 120 { skew-x: -17.8; scale-x: 0.802; scale-y: 0.75; }
        frame 121 { skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 122 { skew-x: -18; scale-x: 0.803; scale-y: 0.751; }
        frame 123 { x: 44.5; y: 126.8; skew-x: -14.8; skew-y: -3.5; scale-x: 0.802; scale-y: 0.75; }
        frame 124 { x: -10000; y: 126.3; skew-x: -11.8; skew-y: -0.5; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: 44.4; y: 125.8; skew-x: -8.8; skew-y: 2.4; }
        frame 126 { x: 44.1; y: 125.4; skew-x: -5.8; skew-y: 5.3; }
        frame 127 { x: -10000; y: 124.9; skew-x: -2.9; skew-y: 8.4; }
        frame 128 { x: 42.9; y: 125.6; skew-x: -2.7; skew-y: 8.8; scale-x: 0.819; scale-y: 0.721; }
        frame 129 { x: 41.7; y: 126.3; skew-x: -2.6; skew-y: 9.5; scale-x: 0.837; scale-y: 0.694; }
        frame 130 { x: 42.9; y: 125.6; skew-x: -2.7; skew-y: 8.8; scale-x: 0.819; scale-y: 0.721; }
        frame 131 { x: 44.1; y: 124.9; skew-x: -2.9; skew-y: 8.4; scale-x: 0.802; scale-y: 0.75; }
        frame 132 { x: 44; y: 125; skew-x: -2.8; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 44.1; y: 124.9; skew-x: -2.9; skew-y: 8.4; }
        frame 134 { x: 45; y: 125.9; skew-x: -1.7; skew-y: -1.7; scale-x: 0.799; scale-y: 0.739; }
        frame 135 { x: -10000; y: -10000; skew-x: -1.6; skew-y: -1.6; scale-x: -10000; scale-y: -10000; }
        frame 136 { skew-x: -10000; skew-y: -10000; }
        frame 145 { skew-x: -1.7; skew-y: -1.7; }
        frame 146 { x: 44.8; y: 126.2; skew-x: -3.7; skew-y: -3.7; }
        frame 147 { x: -10000; y: 126.4; skew-x: -5.9; skew-y: -5.9; }
        frame 148 { x: 44.6; y: 126.7; skew-x: -8.2; skew-y: -8.2; scale-y: 0.738; }
        frame 149 { x: 44.5; y: 126.8; skew-x: -10.4; skew-y: -10.4; scale-y: 0.739; }
        frame 150 { x: 44.4; y: 126.9; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.738; }
        frame 151 { x: 44.5; y: 126.8; scale-x: 0.799; scale-y: 0.739; }
        frame 152 { x: 44.4; y: -10000; skew-x: -9.7; skew-y: -9.7; scale-x: 0.798; scale-y: 0.738; }
        frame 153 { x: 44.5; y: 126.7; skew-x: -9.1; skew-y: -9.1; scale-x: 0.799; scale-y: -10000; }
        frame 154 { x: -10000; y: 126.6; skew-x: -8.4; skew-y: -8.4; scale-x: -10000; }
        frame 155 { x: 44.6; y: -10000; skew-x: -7.9; skew-y: -7.9; }
        frame 156 { x: -10000; y: 126.5; skew-x: -7.2; skew-y: -7.2; }
        frame 157 { y: -10000; skew-x: -6.6; skew-y: -6.6; }
        frame 158 { y: 126.3; skew-x: -5.9; skew-y: -5.9; scale-y: 0.739; }
        frame 159 { x: 44.7; y: -10000; skew-x: -5.4; skew-y: -5.4; scale-y: -10000; }
        frame 160 { x: 44.6; skew-x: -4.7; skew-y: -4.7; }
        frame 161 { x: 44.8; y: 126.2; skew-x: -4.1; skew-y: -4.1; }
        frame 162 { x: -10000; y: 126.1; skew-x: -3.4; skew-y: -3.4; }
        frame 163 { y: 126; skew-x: -2.9; skew-y: -2.9; }
        frame 164 { x: 44.9; y: 125.9; skew-x: -2.2; skew-y: -2.2; }
        frame 165 { x: 45; y: -10000; skew-x: -1.7; skew-y: -1.7; }
        frame 166 { x: 44.8; y: 126.2; skew-x: -3.7; skew-y: -3.7; }
        frame 167 { x: -10000; y: 126.4; skew-x: -5.9; skew-y: -5.9; }
        frame 168 { x: 44.6; y: 126.7; skew-x: -8.2; skew-y: -8.2; scale-y: 0.738; }
        frame 169 { x: 44.5; y: 126.8; skew-x: -10.4; skew-y: -10.4; scale-y: 0.739; }
        frame 170 { x: 44.4; y: 126.9; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.738; }
        frame 171 { x: 44.5; y: 126.8; scale-x: 0.799; scale-y: 0.739; }
        frame 172 { x: 44.6; y: 126.6; skew-x: -8.2; skew-y: -8.2; scale-x: -10000; scale-y: 0.738; }
        frame 173 { x: -10000; y: 126.3; skew-x: -5.9; skew-y: -5.9; scale-y: 0.739; }
        frame 174 { x: 44.7; y: 126.1; skew-x: -3.7; skew-y: -3.7; scale-y: -10000; }
        frame 175 { x: 45; y: 125.9; skew-x: -1.7; skew-y: -1.7; }
    }
    Track {
        source-name: "Zombie_dolphinrider_outerleg_foot1";
        frame-count: 176;
        frame 0 { x: 52.6; y: 126.6; skew-x: 354.2; skew-y: 354.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERLEG_FOOT1; }
        frame 1 { x: 52.4; y: 126.7; skew-x: 353; skew-y: 353; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 52.1; y: 126.9; skew-x: 351.7; skew-y: 351.7; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 52; y: 127; skew-x: 350.5; skew-y: 350.5; }
        frame 4 { x: 51.8; y: 127.2; skew-x: 349.2; skew-y: 349.2; }
        frame 5 { x: 51.5; y: 127.3; skew-x: 348; skew-y: 348; }
        frame 6 { x: 51.4; y: 127.5; skew-x: 346.7; skew-y: 346.7; }
        frame 7 { x: 51.1; y: 127.6; skew-x: 345.4; skew-y: 345.4; }
        frame 8 { x: 51.4; y: -10000; skew-x: 346.7; skew-y: 346.7; }
        frame 9 { x: 51.6; y: 127.3; skew-x: 348; skew-y: 348; }
        frame 10 { x: 51.8; y: 127.2; skew-x: 349.2; skew-y: 349.2; }
        frame 11 { x: 52; y: 127; skew-x: 350.5; skew-y: 350.5; }
        frame 12 { x: 52.3; y: 126.9; skew-x: 351.7; skew-y: 351.7; }
        frame 13 { x: 52.5; y: 126.8; skew-x: 353; skew-y: 353; }
        frame 14 { x: 52.6; y: 126.6; skew-x: 354.2; skew-y: 354.2; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 55.1; y: 127.9; skew-x: 335.6; skew-y: 335.6; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 52.5; y: 127.1; skew-x: 335.4; skew-y: 335.4; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { x: 50; y: 126.2; skew-x: 334.9; skew-y: 334.9; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 47.4; y: 125.3; skew-x: 334.7; skew-y: 334.7; }
        frame 19 { x: 44.8; y: 124.5; skew-x: 334.2; skew-y: 334.2; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { x: 44; y: 123.7; skew-x: 331.4; skew-y: 331.4; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 43.4; y: 123; skew-x: 328.7; skew-y: 328.7; scale-x: 0.797; scale-y: 0.797; }
        frame 22 { x: 42.6; y: 122.3; skew-x: 325.9; skew-y: 325.9; scale-x: 0.798; scale-y: 0.798; }
        frame 23 { x: 40.9; y: 121.3; skew-x: 331.7; skew-y: 331.7; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: 39.2; y: 120.5; skew-x: 337.4; skew-y: 337.4; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 37.6; y: 119.7; skew-x: 343.2; skew-y: 343.2; }
        frame 26 { x: 36; y: 118.8; skew-x: 348.7; skew-y: 348.7; }
        frame 27 { x: 37.3; y: 120.3; skew-x: 351.7; skew-y: 351.7; }
        frame 28 { x: 38.5; y: 121.8; skew-x: 354.9; skew-y: 354.9; }
        frame 29 { x: 39.9; y: 123.3; skew-x: 357.9; skew-y: 357.9; }
        frame 30 { x: 41.1; y: 124.9; skew-x: 360.8; skew-y: 360.8; }
        frame 31 { x: 42.3; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: 43.4; }
        frame 33 { x: 44.5; }
        frame 34 { x: 45.5; }
        frame 35 { x: 47; y: 125.3; skew-x: 358.7; skew-y: 358.7; }
        frame 36 { x: 48.3; y: 125.7; skew-x: 356.5; skew-y: 356.5; }
        frame 37 { x: 49.6; y: 126; skew-x: 354.2; skew-y: 354.2; scale-x: 0.796; scale-y: 0.796; }
        frame 38 { x: 51; y: 126.5; skew-x: 352; skew-y: 352; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 52.4; y: 126.8; skew-x: 349.8; skew-y: 349.8; }
        frame 40 { x: 54.2; y: 127.3; skew-x: 345.2; skew-y: 345.2; }
        frame 41 { x: 56; y: 128; skew-x: 340.7; skew-y: 340.7; scale-x: 0.795; scale-y: 0.795; }
        frame 42 { x: 58; y: 128.6; skew-x: 336.2; skew-y: 336.2; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 60; y: 129.3; skew-x: 331.7; skew-y: 331.7; scale-x: 0.796; scale-y: 0.796; }
        frame 44 { x: 61.7; y: 129.5; skew-x: 324.7; skew-y: 324.7; scale-x: 0.794; scale-y: 0.794; }
        frame 45 { x: 63.5; y: 129.6; skew-x: 317.6; skew-y: 317.6; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 65.6; y: 129.8; skew-x: 310.6; skew-y: 310.6; scale-x: 0.793; scale-y: 0.793; }
        frame 47 { x: 67.7; y: 130; skew-x: 303.6; skew-y: 303.6; scale-x: 0.794; scale-y: 0.794; }
        frame 48 { x: 65.4; y: 129.7; skew-x: 308.9; skew-y: 308.9; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 63.1; y: 129.4; skew-x: 314.4; skew-y: 314.4; }
        frame 50 { x: 60.9; y: 129; skew-x: 319.6; skew-y: 319.6; scale-x: 0.795; scale-y: 0.795; }
        frame 51 { x: 58.8; y: 128.7; skew-x: 324.9; skew-y: 324.9; scale-x: 0.796; scale-y: 0.796; }
        frame 52 { x: 56.9; y: 128.5; skew-x: 330.4; skew-y: 330.4; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 55.1; y: 127.9; skew-x: 335.6; skew-y: 335.6; scale-x: 0.799; scale-y: 0.799; }
        frame 54 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 44.8; y: 124.5; skew-x: 334.2; skew-y: 334.2; }
        frame 56 { x: 43.7; y: 123.4; skew-x: 330.1; skew-y: 330.1; scale-x: 0.798; scale-y: 0.798; }
        frame 57 { x: 42.6; y: 122.3; skew-x: 325.9; skew-y: 325.9; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 40.3; y: 121; skew-x: 333.7; skew-y: 333.7; scale-x: 0.797; scale-y: 0.797; }
        frame 59 { x: 38.1; y: 120; skew-x: 341.2; skew-y: 341.2; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 36; y: 118.8; skew-x: 348.7; skew-y: 348.7; }
        frame 61 { x: 38.5; y: 121.8; skew-x: 354.9; skew-y: 354.9; }
        frame 62 { x: 41.1; y: 124.9; skew-x: 360.8; skew-y: 360.8; }
        frame 63 { x: 42.6; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 64 { x: 44.1; }
        frame 65 { x: 45.5; }
        frame 66 { x: 47.3; y: 125.5; skew-x: 358.2; skew-y: 358.2; }
        frame 67 { x: 49; y: 125.8; skew-x: 355.4; skew-y: 355.4; scale-x: 0.796; scale-y: 0.796; }
        frame 68 { x: 50.6; y: 126.3; skew-x: 352.7; skew-y: 352.7; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 52.4; y: 126.8; skew-x: 349.8; skew-y: 349.8; }
        frame 70 { x: 54.8; y: 127.6; skew-x: 343.7; skew-y: 343.7; scale-x: 0.795; scale-y: 0.795; }
        frame 71 { x: 57.3; y: 128.4; skew-x: 337.7; skew-y: 337.7; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 60; y: 129.3; skew-x: 331.7; skew-y: 331.7; scale-x: 0.796; scale-y: 0.796; }
        frame 73 { x: 63.6; y: 130; skew-x: 315.9; skew-y: 315.9; scale-x: 0.793; scale-y: 0.793; }
        frame 74 { x: 68; y: 130.6; skew-x: 300.1; skew-y: 300.1; scale-x: 0.794; scale-y: 0.794; }
        frame 75 { x: 63.2; y: 129.8; skew-x: 311.9; skew-y: 311.9; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 58.8; y: 128.9; skew-x: 323.9; skew-y: 323.9; scale-x: 0.796; scale-y: 0.796; }
        frame 77 { x: 55.1; y: 127.9; skew-x: 335.6; skew-y: 335.6; scale-x: 0.799; scale-y: 0.799; }
        frame 78 { x: 50.8; y: 127.6; skew-x: 309.6; skew-y: 309.6; scale-x: 0.798; scale-y: 0.798; }
        frame 79 { x: 50.6; y: 121.3; skew-x: 300.3; skew-y: 300.3; scale-x: 0.796; scale-y: 0.796; }
        frame 80 { x: 50.8; y: 115; skew-x: 291; skew-y: 291; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 51.1; y: 108.4; skew-x: 281.8; skew-y: 281.8; }
        frame 82 { x: 39.1; y: 87.5; skew-x: 317.1; skew-y: 317.1; scale-x: 0.794; scale-y: 0.794; }
        frame 83 { x: 31.3; y: 65.9; skew-x: 352.7; skew-y: 352.7; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 27.1; y: 46.6; skew-x: 388; skew-y: 388; scale-x: 0.793; scale-y: 0.793; }
        frame 85 { x: 25.6; y: 42.1; skew-x: 392.1; skew-y: 392.1; scale-x: 0.792; scale-y: 0.792; }
        frame 86 { x: 24.1; y: 37.6; skew-x: 396.3; skew-y: 396.3; scale-x: 0.793; scale-y: 0.793; }
        frame 87 { x: 25.2; y: 35; skew-x: -10000; skew-y: -10000; scale-x: 0.792; scale-y: 0.792; }
        frame 88 { x: 26.3; y: 32.4; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 27.3; y: 29.7; }
        frame 90 { x: 28.4; y: 27; scale-x: 0.793; scale-y: 0.793; }
        frame 91 { x: 29.3; y: 62.3; skew-x: 377.8; skew-y: 377.8; scale-x: 0.791; scale-y: 0.791; }
        frame 92 { x: 30.9; y: 98.5; skew-x: 359.2; skew-y: 359.2; scale-x: 0.79; scale-y: 0.79; }
        frame 93 { x: 39.7; y: 111; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: -10000; y: -10000; cel: -1; }
        frame 95 { cel: -10000; }
        frame 102 { x: 55.1; y: 127.9; skew-x: 335.6; skew-y: 335.6; scale-x: 0.799; scale-y: 0.799; cel: 0; }
        frame 103 { x: 54.8; y: 127.8; skew-x: 331.2; skew-y: 334.7; scale-x: 0.8; scale-y: 0.835; cel: -10000; }
        frame 104 { x: 54.4; y: 127.7; skew-x: 326.7; skew-y: 333.7; scale-x: 0.802; scale-y: 0.873; }
        frame 105 { x: 54; y: 127.5; skew-x: 322.1; skew-y: 332.5; scale-x: 0.806; scale-y: 0.912; }
        frame 106 { x: -10000; y: 128; skew-x: 318.1; skew-y: 328.4; scale-x: 0.805; scale-y: 0.91; }
        frame 107 { x: 54.3; y: 128.6; skew-x: 314.1; skew-y: 324.4; scale-x: 0.804; scale-y: -10000; }
        frame 108 { x: 54.5; y: 129; skew-x: 310; skew-y: 320.4; scale-x: 0.805; scale-y: 0.911; }
        frame 109 { x: 54.1; y: 129.7; skew-x: 305.4; skew-y: 314.6; scale-x: 0.799; scale-y: 0.915; }
        frame 110 { x: 53.8; y: 130.3; skew-x: 300.8; skew-y: 308.8; scale-x: 0.794; scale-y: 0.921; }
        frame 111 { x: 53.5; y: 131; skew-x: 296.2; skew-y: 302.9; scale-x: 0.79; scale-y: 0.928; }
        frame 112 { x: 53.4; y: 130.6; skew-x: 298.3; skew-y: 306.8; scale-x: 0.796; scale-y: 0.917; }
        frame 113 { x: 53.3; y: 130.2; skew-x: 300.3; skew-y: 310.8; scale-x: 0.805; scale-y: 0.91; }
        frame 114 { x: -10000; y: 130.5; skew-x: 297.3; skew-y: 307.8; scale-x: 0.804; scale-y: 0.909; }
        frame 115 { y: 130.6; skew-x: 294.5; skew-y: 304.9; scale-x: 0.805; scale-y: 0.91; }
        frame 116 { x: 53.4; y: -10000; skew-x: 294.3; skew-y: -10000; scale-x: 0.804; scale-y: 0.909; }
        frame 117 { x: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 53.3; skew-x: 294.5; scale-x: 0.805; scale-y: 0.91; }
        frame 120 { x: -10000; y: 130.4; skew-x: 297.8; skew-y: 308.3; scale-x: 0.803; scale-y: 0.908; }
        frame 121 { x: 53.1; y: 130.3; skew-x: 301.1; skew-y: 311.6; scale-x: -10000; scale-y: -10000; }
        frame 122 { x: 53.2; y: 130.1; skew-x: 304.6; skew-y: 315; scale-x: 0.804; scale-y: 0.909; }
        frame 123 { x: 53.3; y: 129.5; skew-x: 309.6; skew-y: 320.1; scale-x: 0.802; scale-y: 0.907; }
        frame 124 { x: 53.5; y: 129; skew-x: 314.6; skew-y: 325.1; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: 53.7; y: 128.4; skew-x: 319.7; skew-y: 330.2; }
        frame 126 { x: 54; y: 127.8; skew-x: 324.9; skew-y: 335.2; }
        frame 127 { x: 54.5; y: 127.3; skew-x: 329.9; skew-y: 340.3; scale-x: 0.803; scale-y: 0.908; }
        frame 128 { x: 53.7; y: 128.3; skew-x: 331.4; skew-y: 339.2; scale-x: 0.807; scale-y: 0.878; }
        frame 129 { x: 52.8; y: 129.2; skew-x: 332.9; skew-y: 337.9; scale-x: 0.814; scale-y: 0.85; }
        frame 130 { x: 53.6; y: 128.2; skew-x: 331.4; skew-y: 339.2; scale-x: 0.807; scale-y: 0.878; }
        frame 131 { x: 54.5; y: 127.3; skew-x: 329.9; skew-y: 340.3; scale-x: 0.803; scale-y: 0.908; }
        frame 132 { x: -10000; y: -10000; skew-x: -10000; skew-y: 340.4; scale-x: 0.802; scale-y: 0.907; }
        frame 133 { skew-y: 340.3; scale-x: 0.803; scale-y: 0.908; }
        frame 134 { x: 55.1; y: 127.9; skew-x: 335.6; skew-y: 335.6; scale-x: 0.799; scale-y: 0.799; }
        frame 135 { x: -10000; y: 127.8; skew-x: 335.9; skew-y: 335.9; scale-x: 0.798; scale-y: 0.798; }
        frame 136 { y: -10000; skew-x: 336.2; skew-y: 336.2; scale-x: -10000; scale-y: -10000; }
        frame 137 { skew-x: 336.7; skew-y: 336.7; }
        frame 138 { x: 55.2; skew-x: 336.9; skew-y: 336.9; }
        frame 139 { x: -10000; skew-x: 337.2; skew-y: 337.2; }
        frame 140 { y: 127.7; skew-x: 337.4; skew-y: 337.4; }
        frame 141 { y: -10000; skew-x: 337.7; skew-y: 337.7; }
        frame 142 { x: 55.3; y: 127.6; skew-x: 338.2; skew-y: 338.2; }
        frame 143 { x: 55.2; y: -10000; skew-x: 338.4; skew-y: 338.4; }
        frame 144 { x: 55.3; skew-x: 338.7; skew-y: 338.7; }
        frame 145 { x: -10000; skew-x: 338.9; skew-y: 338.9; scale-x: 0.799; scale-y: 0.799; }
        frame 146 { x: 55.1; skew-x: 334.2; skew-y: 334.2; scale-x: 0.798; scale-y: 0.798; }
        frame 147 { x: 54.9; y: 127.7; skew-x: 329.6; skew-y: 329.6; scale-x: 0.797; scale-y: 0.797; }
        frame 148 { x: 54.8; y: 127.8; skew-x: 324.9; skew-y: 324.9; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 54.7; y: 128; skew-x: 320.1; skew-y: 320.1; scale-x: 0.798; scale-y: 0.798; }
        frame 150 { x: 54.8; y: 128.3; skew-x: 318.9; skew-y: 318.9; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: -10000; y: 128.4; skew-x: 317.8; skew-y: 317.8; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { y: 128.3; skew-x: 319.4; skew-y: 319.4; scale-x: 0.797; scale-y: 0.797; }
        frame 153 { y: -10000; skew-x: 320.9; skew-y: 320.9; scale-x: -10000; scale-y: -10000; }
        frame 154 { y: 128.2; skew-x: 322.4; skew-y: 322.4; }
        frame 155 { x: 54.9; y: 128.1; skew-x: 323.9; skew-y: 323.9; }
        frame 156 { x: 54.8; y: -10000; skew-x: 325.4; skew-y: 325.4; }
        frame 157 { x: 54.9; skew-x: 326.9; skew-y: 326.9; }
        frame 158 { x: -10000; y: 128; skew-x: 328.4; skew-y: 328.4; }
        frame 159 { skew-x: 329.9; skew-y: 329.9; }
        frame 160 { x: 55; y: 127.8; skew-x: 331.4; skew-y: 331.4; }
        frame 161 { y: -10000; skew-x: 332.9; skew-y: 332.9; }
        frame 162 { x: 55.1; skew-x: 334.4; skew-y: 334.4; scale-x: 0.798; scale-y: 0.798; }
        frame 163 { x: 55.2; y: 127.7; skew-x: 335.9; skew-y: 335.9; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 55.3; y: -10000; skew-x: 337.4; skew-y: 337.4; }
        frame 165 { x: -10000; y: 127.6; skew-x: 338.9; skew-y: 338.9; scale-x: 0.799; scale-y: 0.799; }
        frame 166 { x: 55.1; y: -10000; skew-x: 334.2; skew-y: 334.2; scale-x: 0.798; scale-y: 0.798; }
        frame 167 { x: 54.9; y: 127.7; skew-x: 329.6; skew-y: 329.6; scale-x: 0.797; scale-y: 0.797; }
        frame 168 { x: 54.8; y: 127.8; skew-x: 324.9; skew-y: 324.9; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 54.7; y: 128; skew-x: 320.1; skew-y: 320.1; scale-x: 0.798; scale-y: 0.798; }
        frame 170 { x: 54.8; y: 128.3; skew-x: 318.9; skew-y: 318.9; scale-x: 0.797; scale-y: 0.797; }
        frame 171 { x: -10000; y: 128.4; skew-x: 317.8; skew-y: 317.8; scale-x: 0.798; scale-y: 0.798; }
        frame 172 { x: 54.9; y: 128.3; skew-x: 322.4; skew-y: 322.4; scale-x: 0.797; scale-y: 0.797; }
        frame 173 { x: 54.8; y: 128.2; skew-x: 326.7; skew-y: 326.7; scale-x: -10000; scale-y: -10000; }
        frame 174 { x: 55; y: 128; skew-x: 331.2; skew-y: 331.2; }
        frame 175 { x: 55.1; y: 127.9; skew-x: 335.6; skew-y: 335.6; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "Zombie_dolphinrider_outerleg_lower";
        frame-count: 176;
        frame 0 { x: 49.8; y: 106.3; skew-x: 4.4; skew-y: 355.4; scale-x: 0.806; scale-y: 0.761; image: IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERLEG_LOWER; }
        frame 1 { x: 49.4; y: 106.4; skew-x: 2.5; skew-y: 355; scale-x: 0.805; scale-y: 0.766; image: none; }
        frame 2 { x: 49; y: 106.6; skew-x: 0.8; skew-y: 354.5; scale-x: 0.804; scale-y: 0.772; }
        frame 3 { x: 48.5; y: 106.7; skew-x: -0.7; skew-y: 354; scale-x: 0.803; scale-y: 0.777; }
        frame 4 { x: 48.1; y: 106.8; skew-x: -2.5; skew-y: 353.5; scale-x: 0.802; scale-y: 0.783; }
        frame 5 { x: 47.8; y: 106.9; skew-x: -4.2; skew-y: 353; scale-x: 0.801; scale-y: 0.788; }
        frame 6 { x: 47.4; y: 107.1; skew-x: -6.2; skew-y: 352.5; scale-x: 0.8; scale-y: 0.794; }
        frame 7 { x: 47; y: 107.3; skew-x: -7.9; skew-y: 352; scale-x: -10000; scale-y: 0.8; }
        frame 8 { x: 47.4; y: 107.2; skew-x: -6.2; skew-y: 352.5; scale-y: 0.794; }
        frame 9 { x: 47.8; y: 106.9; skew-x: -4.2; skew-y: 353; scale-x: 0.801; scale-y: 0.788; }
        frame 10 { x: 48.2; y: 106.8; skew-x: -2.5; skew-y: 353.5; scale-x: 0.802; scale-y: 0.783; }
        frame 11 { x: 48.5; y: 106.7; skew-x: -0.7; skew-y: 354; scale-x: 0.803; scale-y: 0.777; }
        frame 12 { x: 49; y: 106.6; skew-x: 0.8; skew-y: 354.5; scale-x: 0.804; scale-y: 0.772; }
        frame 13 { x: 49.4; y: 106.5; skew-x: 2.5; skew-y: 355; scale-x: 0.805; scale-y: 0.766; }
        frame 14 { x: 49.8; y: 106.3; skew-x: 4.4; skew-y: 355.4; scale-x: 0.806; scale-y: 0.761; }
        frame 15 { x: 46.1; y: 109.3; skew-x: -20; skew-y: 339.9; scale-x: 0.798; scale-y: 0.798; }
        frame 16 { x: 44.4; y: 108.3; skew-x: -18.7; skew-y: 341.2; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 42.5; y: 107.5; skew-x: -17.5; skew-y: 342.4; }
        frame 18 { x: 40.7; y: 106.6; skew-x: -16.2; skew-y: 343.7; }
        frame 19 { x: 39; y: 105.4; skew-x: -15.2; skew-y: 344.7; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { x: 38; y: 104.4; skew-x: -16.2; skew-y: 343.7; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 37; y: 103.6; skew-x: -17.2; skew-y: 342.7; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 35.9; y: 102.6; skew-x: -18.3; skew-y: 341.6; }
        frame 23 { x: 35.4; y: 101.5; skew-x: -13.7; skew-y: 346.2; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: 35.1; y: 100.6; skew-x: -9.2; skew-y: 350.7; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 34.9; y: 99.5; skew-x: -4.7; skew-y: 355.2; }
        frame 26 { x: 34.6; y: 98.6; skew-x: -0.2; skew-y: 359.7; }
        frame 27 { x: 33.6; y: 101.7; skew-x: -5.9; skew-y: 354; scale-x: 0.796; scale-y: 0.806; }
        frame 28 { x: 32.8; y: 104.8; skew-x: -11.7; skew-y: 348.2; scale-x: -10000; scale-y: 0.815; }
        frame 29 { x: 31.9; y: 108.1; skew-x: -17.4; skew-y: 342.5; scale-x: 0.795; scale-y: 0.824; }
        frame 30 { x: 31.1; y: 111.7; skew-x: -23.3; skew-y: 336.6; scale-x: -10000; scale-y: 0.835; }
        frame 31 { x: 32.9; y: 111.5; skew-x: -22.2; skew-y: 337.7; scale-x: 0.794; scale-y: 0.833; }
        frame 32 { x: 34.6; y: 111.2; skew-x: -21; skew-y: 338.9; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 36.6; y: 111; skew-x: -20; skew-y: 339.9; }
        frame 34 { x: 38.4; y: 110.8; skew-x: -19; skew-y: 340.9; }
        frame 35 { x: 40.1; y: 110.2; skew-x: -17.4; skew-y: 342.5; scale-x: 0.793; }
        frame 36 { x: 42; y: 109.7; skew-x: -16; skew-y: 343.9; scale-x: -10000; }
        frame 37 { x: 43.7; y: 109; skew-x: -14.5; skew-y: 345.4; }
        frame 38 { x: 45.5; y: 108.3; skew-x: -13.2; skew-y: 346.7; }
        frame 39 { x: 47.3; y: 107.8; skew-x: -11.7; skew-y: 348.2; scale-x: 0.794; }
        frame 40 { x: 48.8; y: 108.1; skew-x: -13.7; skew-y: 346.2; scale-x: 0.793; scale-y: 0.836; }
        frame 41 { x: 50.3; y: 108.5; skew-x: -15.9; skew-y: 344; scale-x: -10000; scale-y: 0.839; }
        frame 42 { x: 51.8; y: 108.7; skew-x: -18; skew-y: 341.9; scale-y: 0.842; }
        frame 43 { x: 53.1; y: 109; skew-x: -20.2; skew-y: 339.7; scale-y: 0.846; }
        frame 44 { x: 53; y: 109.8; skew-x: -25; skew-y: 334.9; scale-x: 0.792; scale-y: 0.841; }
        frame 45 { y: 110.7; skew-x: -30; skew-y: 329.9; scale-x: -10000; scale-y: 0.838; }
        frame 46 { y: 111.5; skew-x: -35; skew-y: 324.9; scale-x: 0.791; scale-y: 0.834; }
        frame 47 { x: 53.1; y: 112.3; skew-x: -40; skew-y: 319.9; scale-x: 0.793; scale-y: 0.832; }
        frame 48 { x: 52; y: 111.8; skew-x: -36.7; skew-y: 323.2; scale-x: 0.792; scale-y: 0.825; }
        frame 49 { x: 50.9; y: 111.3; skew-x: -33.3; skew-y: 326.6; scale-x: 0.793; scale-y: 0.819; }
        frame 50 { x: 49.6; y: 110.8; skew-x: -30; skew-y: 329.9; scale-x: 0.794; scale-y: 0.814; }
        frame 51 { x: 48.5; y: 110.3; skew-x: -26.7; skew-y: 333.2; scale-x: 0.795; scale-y: 0.809; }
        frame 52 { x: 47.5; y: 109.8; skew-x: -23.2; skew-y: 336.7; scale-x: 0.797; scale-y: 0.803; }
        frame 53 { x: 46.1; y: 109.3; skew-x: -20; skew-y: 339.9; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 39; y: 105.4; skew-x: -15.2; skew-y: 344.7; scale-x: 0.799; scale-y: 0.799; }
        frame 56 { x: 37.5; y: 104; skew-x: -16.7; skew-y: 343.2; scale-x: 0.798; scale-y: 0.798; }
        frame 57 { x: 35.9; y: 102.6; skew-x: -18.3; skew-y: 341.6; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 35.3; y: 101.2; skew-x: -12.2; skew-y: 347.7; scale-x: 0.797; scale-y: 0.797; }
        frame 59 { x: 34.9; y: 99.8; skew-x: -6.2; skew-y: 353.7; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 34.6; y: 98.6; skew-x: -0.2; skew-y: 359.7; }
        frame 61 { x: 32.8; y: 104.8; skew-x: -11.7; skew-y: 348.2; scale-x: 0.796; scale-y: 0.815; }
        frame 62 { x: 31.1; y: 111.7; skew-x: -23.3; skew-y: 336.6; scale-x: 0.795; scale-y: 0.835; }
        frame 63 { x: 33.5; y: 111.5; skew-x: -21.7; skew-y: 338.2; scale-x: 0.794; scale-y: 0.833; }
        frame 64 { x: 36; y: 111.1; skew-x: -20.4; skew-y: 339.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 38.4; y: 110.8; skew-x: -19; skew-y: 340.9; }
        frame 66 { x: 40.6; y: 110.1; skew-x: -17.2; skew-y: 342.7; scale-x: 0.793; }
        frame 67 { x: 42.8; y: 109.3; skew-x: -15.2; skew-y: 344.7; scale-x: -10000; }
        frame 68 { x: 45; y: 108.5; skew-x: -13.4; skew-y: 346.5; }
        frame 69 { x: 47.3; y: 107.8; skew-x: -11.7; skew-y: 348.2; scale-x: 0.794; }
        frame 70 { x: 49.3; y: 108.2; skew-x: -14.4; skew-y: 345.5; scale-x: 0.793; scale-y: 0.837; }
        frame 71 { x: 51.2; y: 108.5; skew-x: -17.2; skew-y: 342.7; scale-x: -10000; scale-y: 0.841; }
        frame 72 { x: 53.1; y: 109; skew-x: -20.2; skew-y: 339.7; scale-y: 0.846; }
        frame 73 { x: 53; y: 110.7; skew-x: -30; skew-y: 329.9; scale-x: 0.792; scale-y: 0.838; }
        frame 74 { x: 53.1; y: 112.3; skew-x: -40; skew-y: 319.9; scale-x: 0.793; scale-y: 0.832; }
        frame 75 { x: 50.9; y: 111.3; skew-x: -33.3; skew-y: 326.6; scale-x: -10000; scale-y: 0.819; }
        frame 76 { x: 48.5; y: 110.3; skew-x: -26.7; skew-y: 333.2; scale-x: 0.795; scale-y: 0.809; }
        frame 77 { x: 46.1; y: 109.3; skew-x: -20; skew-y: 339.9; scale-x: 0.798; scale-y: 0.798; }
        frame 78 { x: 33.7; y: 113.2; skew-x: -46.8; skew-y: 313.1; scale-x: -10000; scale-y: 0.863; }
        frame 79 { x: 35.5; y: 102.1; skew-x: -38; skew-y: 324.6; scale-x: 0.799; scale-y: 0.84; }
        frame 80 { x: 37.7; y: 91.1; skew-x: -29; skew-y: 336.2; scale-x: 0.801; scale-y: 0.818; }
        frame 81 { x: 40.1; y: 80.5; skew-x: -20.1; skew-y: 347.7; scale-x: 0.805; scale-y: 0.797; }
        frame 82 { x: 36.8; y: 64.1; skew-x: -9.2; skew-y: 358.7; scale-x: 0.804; scale-y: -10000; }
        frame 83 { x: 33.5; y: 48; skew-x: 1.5; skew-y: 369.3; scale-x: -10000; scale-y: 0.796; }
        frame 84 { x: 30.6; y: 32.2; skew-x: 12.4; skew-y: 380.2; scale-x: 0.803; scale-y: -10000; }
        frame 85 { x: -10000; y: 27.9; skew-x: 16.8; skew-y: 384.6; scale-x: 0.802; scale-y: 0.794; }
        frame 86 { y: 23.6; skew-x: 21.4; skew-y: 389.2; scale-x: 0.803; scale-y: 0.795; }
        frame 87 { x: 29.7; y: 21.3; skew-x: 16.1; skew-y: 383.8; scale-x: 0.801; scale-y: 0.794; }
        frame 88 { x: 28.9; y: 19; skew-x: 10.8; skew-y: 378.6; scale-x: -10000; scale-y: 0.793; }
        frame 89 { x: 28; y: 16.7; skew-x: 5.5; skew-y: 373.3; scale-x: 0.8; scale-y: -10000; }
        frame 90 { x: 27.2; y: 14.7; skew-x: 0.4; skew-y: 368.2; scale-x: -10000; scale-y: 0.792; }
        frame 91 { x: 28.5; y: 48.6; skew-x: -3; skew-y: 364.5; scale-x: 0.798; scale-y: 0.79; }
        frame 92 { x: 29.7; y: 82.4; skew-x: -6.7; skew-y: 361; scale-x: 0.796; scale-y: 0.789; }
        frame 93 { x: 32.8; y: 113.3; skew-x: -58.6; skew-y: 309.1; scale-x: 0.794; scale-y: 0.787; }
        frame 94 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 95 { cel: -10000; }
        frame 102 { x: 46.1; y: 109.3; skew-x: -20; skew-y: 339.9; scale-x: 0.798; scale-y: 0.798; cel: 0; }
        frame 103 { x: 44.8; y: 110; skew-x: -23.2; skew-y: 336.7; scale-x: 0.797; scale-y: 0.797; cel: -10000; }
        frame 104 { x: 43.4; y: 110.7; skew-x: -26.5; skew-y: 333.4; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 42; y: 111.5; skew-x: -29.8; skew-y: 330.1; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 40; y: 114.2; skew-x: -38.5; skew-y: 321.4; scale-x: 0.796; scale-y: 0.832; }
        frame 107 { x: 38.1; y: 117.1; skew-x: -47.3; skew-y: 312.6; scale-x: -10000; scale-y: 0.867; }
        frame 108 { x: 36.4; y: 120; skew-x: -56.1; skew-y: 303.8; scale-x: 0.797; scale-y: 0.904; }
        frame 109 { x: 35.4; y: 125; skew-x: -67.6; skew-y: 292.3; scale-x: 0.787; scale-y: 0.915; }
        frame 110 { x: 34.8; y: 130; skew-x: -78.9; skew-y: 281; scale-x: 0.778; scale-y: 0.928; }
        frame 111 { x: 34.6; y: 134.7; skew-x: -90.2; skew-y: 269.7; scale-x: 0.77; scale-y: 0.942; }
        frame 112 { x: -10000; y: 133; skew-x: -87.3; skew-y: 272.8; scale-x: 0.766; scale-y: 0.955; }
        frame 113 { x: 34.7; y: 131.3; skew-x: -84.1; skew-y: 275.8; scale-x: 0.762; scale-y: 0.969; }
        frame 114 { x: 35; y: 133; skew-x: -87.3; skew-y: 272.6; scale-x: 0.778; scale-y: 0.935; }
        frame 115 { x: 35.2; y: 134.4; skew-x: -90.2; skew-y: 269.7; scale-x: 0.796; scale-y: 0.902; }
        frame 116 { x: 34.9; y: 133.5; skew-x: -87.6; skew-y: 272.3; scale-x: 0.795; scale-y: -10000; }
        frame 117 { x: 34.5; y: 132.7; skew-x: -84.8; skew-y: 275.1; scale-x: -10000; }
        frame 118 { x: 34; y: 131.7; skew-x: -81.9; skew-y: 278; }
        frame 119 { x: 33.6; y: 130.7; skew-x: -79.1; skew-y: 280.8; }
        frame 120 { x: 34.4; y: 125.1; skew-x: -76.1; skew-y: 292.6; scale-x: 0.794; scale-y: 0.954; }
        frame 121 { x: 35.4; y: 119.4; skew-x: -72.8; skew-y: 304.4; scale-x: 0.793; scale-y: 1.006; }
        frame 122 { x: 37.1; y: 113.8; skew-x: -69.6; skew-y: 316.4; scale-x: -10000; scale-y: 1.06; }
        frame 123 { x: 39.8; y: 110.2; skew-x: -61.1; skew-y: 324.9; scale-x: 0.791; scale-y: 1.057; }
        frame 124 { x: 42.5; y: 106.8; skew-x: -52.5; skew-y: 333.5; scale-x: 0.79; scale-y: 1.058; }
        frame 125 { x: 48.9; y: 103.5; skew-x: -35; skew-y: 351.2; scale-x: 0.789; scale-y: 1.057; }
        frame 126 { x: 56; y: 100.8; skew-x: -17.4; skew-y: 368.5; scale-x: 0.79; scale-y: -10000; }
        frame 127 { x: 63.6; y: 99.2; skew-x: 0; skew-y: 386.1; scale-x: 0.791; scale-y: 1.058; }
        frame 128 { x: 62.9; y: 101.3; skew-x: -10000; skew-y: 387.5; scale-x: 0.808; scale-y: 1.028; }
        frame 129 { x: 62.1; y: 103.3; skew-y: 389; scale-x: 0.826; scale-y: 1.002; }
        frame 130 { x: 62.9; y: 101.3; skew-y: 387.5; scale-x: 0.808; scale-y: 1.028; }
        frame 131 { x: 63.6; y: 99.2; skew-y: 386.1; scale-x: 0.791; scale-y: 1.058; }
        frame 132 { x: -10000; y: 99.3; skew-y: -10000; scale-x: -10000; scale-y: 1.057; }
        frame 133 { y: 99.2; scale-y: 1.058; }
        frame 134 { x: 46.1; y: 109.3; skew-x: -20; skew-y: 339.9; scale-x: 0.798; scale-y: 0.798; }
        frame 135 { x: 46.2; y: -10000; skew-x: -19.5; skew-y: 340.4; scale-x: -10000; scale-y: 0.801; }
        frame 136 { x: 46.5; y: 109.1; skew-x: -19; skew-y: 340.9; scale-y: 0.804; }
        frame 137 { x: 46.6; y: 108.9; skew-x: -18.5; skew-y: 341.4; scale-y: 0.807; }
        frame 138 { x: 46.7; y: 108.8; skew-x: -18; skew-y: 341.9; scale-y: 0.81; }
        frame 139 { x: 46.9; y: 108.7; skew-x: -17.5; skew-y: 342.4; scale-y: 0.814; }
        frame 140 { x: 47; y: 108.6; skew-x: -17; skew-y: 342.9; scale-y: 0.817; }
        frame 141 { x: 47.2; y: 108.3; skew-x: -16.5; skew-y: 343.4; scale-y: 0.82; }
        frame 142 { x: 47.4; y: -10000; skew-x: -16.2; skew-y: 343.7; scale-y: 0.823; }
        frame 143 { x: 47.5; y: 108.2; skew-x: -15.7; skew-y: 344.2; scale-y: 0.826; }
        frame 144 { x: 47.6; y: 108; skew-x: -15.2; skew-y: 344.7; scale-y: 0.83; }
        frame 145 { x: 47.7; y: 107.9; skew-x: -14.7; skew-y: 345.2; scale-y: 0.834; }
        frame 146 { x: 45.9; y: 107.6; skew-x: -18.4; skew-y: 341.5; scale-x: 0.797; scale-y: 0.859; }
        frame 147 { x: 44.1; y: 107.5; skew-x: -22.2; skew-y: 337.7; scale-x: -10000; scale-y: 0.885; }
        frame 148 { x: 42.4; y: 107.1; skew-x: -25.7; skew-y: 334.2; scale-y: 0.912; }
        frame 149 { x: 40.5; y: 106.9; skew-x: -29.6; skew-y: 330.3; scale-x: 0.798; scale-y: 0.939; }
        frame 150 { x: 40.3; y: 107.8; skew-x: -32; skew-y: 327.9; scale-x: 0.796; scale-y: 0.938; }
        frame 151 { x: 40; y: 108.8; skew-x: -34.6; skew-y: 325.3; scale-x: 0.797; scale-y: 0.939; }
        frame 152 { x: 40.6; y: 108.7; skew-x: -33.2; skew-y: 326.7; scale-x: 0.796; scale-y: 0.93; }
        frame 153 { x: 41.1; y: 108.5; skew-x: -31.7; skew-y: 328.2; scale-x: -10000; scale-y: 0.923; }
        frame 154 { x: 41.6; y: 108.4; skew-x: -30.3; skew-y: 329.6; scale-y: 0.915; }
        frame 155 { x: 42.2; y: -10000; skew-x: -29; skew-y: 330.9; scale-x: 0.797; scale-y: 0.908; }
        frame 156 { x: 42.7; y: 108.3; skew-x: -27.5; skew-y: 332.4; scale-x: -10000; scale-y: 0.9; }
        frame 157 { x: 43.2; y: 108.2; skew-x: -26; skew-y: 333.9; scale-y: 0.893; }
        frame 158 { x: 43.9; y: 108.3; skew-x: -24.7; skew-y: 335.2; scale-y: 0.885; }
        frame 159 { x: 44.3; y: 108.1; skew-x: -23.2; skew-y: 336.7; scale-y: 0.878; }
        frame 160 { x: 44.9; y: 108; skew-x: -21.7; skew-y: 338.2; scale-y: 0.87; }
        frame 161 { x: 45.4; y: -10000; skew-x: -20.4; skew-y: 339.5; scale-y: 0.863; }
        frame 162 { x: 46; y: 107.9; skew-x: -18.9; skew-y: 341; scale-y: 0.855; }
        frame 163 { x: 46.5; y: 107.8; skew-x: -17.5; skew-y: 342.4; scale-y: 0.848; }
        frame 164 { x: 47.1; y: -10000; skew-x: -16.2; skew-y: 343.7; scale-y: 0.84; }
        frame 165 { x: 47.7; y: 107.9; skew-x: -14.7; skew-y: 345.2; scale-x: 0.798; scale-y: 0.834; }
        frame 166 { x: 45.9; y: 107.6; skew-x: -18.4; skew-y: 341.5; scale-x: 0.797; scale-y: 0.859; }
        frame 167 { x: 44.1; y: 107.5; skew-x: -22.2; skew-y: 337.7; scale-x: -10000; scale-y: 0.885; }
        frame 168 { x: 42.4; y: 107.1; skew-x: -25.7; skew-y: 334.2; scale-y: 0.912; }
        frame 169 { x: 40.5; y: 106.9; skew-x: -29.6; skew-y: 330.3; scale-x: 0.798; scale-y: 0.939; }
        frame 170 { x: 40.3; y: 107.8; skew-x: -32; skew-y: 327.9; scale-x: 0.796; scale-y: 0.938; }
        frame 171 { x: 40; y: 108.8; skew-x: -34.6; skew-y: 325.3; scale-x: 0.797; scale-y: 0.939; }
        frame 172 { x: 41.5; y: -10000; skew-x: -31; skew-y: 328.9; scale-x: 0.796; scale-y: 0.903; }
        frame 173 { x: 43.1; y: 109; skew-x: -27.2; skew-y: 332.7; scale-x: 0.797; scale-y: 0.868; }
        frame 174 { x: 44.6; y: 109.1; skew-x: -23.7; skew-y: 336.2; scale-x: -10000; scale-y: 0.833; }
        frame 175 { x: 46.1; y: 109.3; skew-x: -20; skew-y: 339.9; scale-x: 0.798; scale-y: 0.798; }
    }
    Track {
        source-name: "Zombie_dolphinrider_outerleg_upper";
        frame-count: 176;
        frame 0 { x: 49.1; y: 79.2; scale-x: 0.8; scale-y: 0.827; image: IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERLEG_UPPER; }
        frame 1 { x: 48.9; y: 79.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 48.8; y: -10000; skew-x: 0.3; skew-y: 0.3; }
        frame 3 { x: 48.5; y: 79.5; skew-x: -10000; skew-y: -10000; }
        frame 4 { x: 48.4; y: 79.6; skew-x: 0.5; skew-y: 0.5; }
        frame 5 { x: 48.1; y: 79.7; skew-x: 0.6; skew-y: 0.6; }
        frame 6 { x: 48; y: 79.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.799; }
        frame 7 { x: 47.8; y: 80; skew-x: 1; skew-y: 1; scale-x: -10000; }
        frame 8 { x: 48; y: 79.8; skew-x: 0.8; skew-y: 0.8; }
        frame 9 { y: 79.7; skew-x: 0.6; skew-y: 0.6; scale-x: 0.8; }
        frame 10 { x: 48.3; y: 79.6; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; }
        frame 11 { x: 48.5; y: 79.5; skew-x: 0.3; skew-y: 0.3; }
        frame 12 { x: 48.7; y: 79.4; skew-x: -10000; skew-y: -10000; }
        frame 13 { x: 48.8; y: 79.3; skew-x: 0; skew-y: 0; }
        frame 14 { x: 49.1; y: 79.2; skew-x: -10000; skew-y: -10000; }
        frame 15 { x: 50.1; y: 78.7; skew-x: 7.3; skew-y: 7.4; scale-x: 0.799; scale-y: 0.826; }
        frame 16 { x: 50.5; y: 78.2; skew-x: 11.5; skew-y: 11.5; scale-x: 0.798; scale-y: -10000; }
        frame 17 { x: 50.8; y: 77.7; skew-x: 15.6; skew-y: 15.6; scale-x: -10000; }
        frame 18 { x: 51; y: 77.5; skew-x: 19.8; skew-y: 19.8; scale-y: 0.825; }
        frame 19 { x: 51.4; y: 77.3; skew-x: 24; skew-y: 24; scale-x: 0.799; scale-y: 0.826; }
        frame 20 { x: 51.6; y: 76.8; skew-x: 26.8; skew-y: 26.8; scale-x: 0.798; scale-y: 0.825; }
        frame 21 { x: 52; y: 76.2; skew-x: 29.8; skew-y: 29.8; scale-x: 0.797; scale-y: -10000; }
        frame 22 { x: 52.4; y: 75.6; skew-x: 32.7; skew-y: 32.8; scale-x: 0.798; scale-y: 0.826; }
        frame 23 { x: 52.8; y: 75.5; skew-x: 34.6; skew-y: 34.6; scale-x: 0.797; scale-y: 0.824; }
        frame 24 { x: 53.3; y: -10000; skew-x: 36.6; skew-y: 36.6; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 53.5; y: 75.3; skew-x: 38.6; skew-y: 38.6; }
        frame 26 { x: 54; y: 75.2; skew-x: 40.6; skew-y: 40.6; scale-x: 0.798; scale-y: 0.825; }
        frame 27 { x: 51.9; y: 77.3; skew-x: 37.4; skew-y: 37.4; scale-x: 0.796; scale-y: 0.824; }
        frame 28 { x: 50; y: 79.4; skew-x: 34.3; skew-y: 34.3; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 47.8; y: 81.7; skew-x: 31.1; skew-y: 31.1; scale-y: 0.823; }
        frame 30 { x: 45.9; y: 84; skew-x: 28; skew-y: 28; scale-x: 0.797; scale-y: 0.824; }
        frame 31 { x: 46.1; y: 83.4; skew-x: 24.5; skew-y: 24.5; scale-x: 0.796; scale-y: 0.823; }
        frame 32 { x: 46.3; y: 83; skew-x: 21; skew-y: 21; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 46.4; y: 82.6; skew-x: 17.5; skew-y: 17.5; }
        frame 34 { x: 46.5; y: 82.3; skew-x: 14; skew-y: 14; }
        frame 35 { x: 47.2; y: 81.6; skew-x: 12; skew-y: 12; }
        frame 36 { x: 47.9; y: 81; skew-x: 10; skew-y: 10; }
        frame 37 { x: 48.6; y: 80.3; skew-x: 8; skew-y: 8; }
        frame 38 { x: 49.3; y: 79.7; skew-x: 6; skew-y: 6; }
        frame 39 { x: 50; y: 79.1; skew-x: 4.2; skew-y: 4.2; }
        frame 40 { x: 50.8; y: 79.3; skew-x: 2; skew-y: 3; scale-x: 0.795; }
        frame 41 { x: 51.5; y: 79.5; skew-x: 0; skew-y: 1.8; scale-x: -10000; }
        frame 42 { x: 52.1; y: 79.7; skew-x: -1.9; skew-y: 0.6; scale-y: 0.824; }
        frame 43 { x: 52.9; y: 80; skew-x: -4.2; skew-y: -0.3; scale-y: -10000; }
        frame 44 { x: 51; y: 81.4; skew-x: -7.2; skew-y: -4.4; scale-x: 0.794; scale-y: 0.815; }
        frame 45 { x: 49.2; y: 83; skew-x: -10.5; skew-y: -8.7; scale-x: 0.793; scale-y: 0.807; }
        frame 46 { x: 47.4; y: 84.7; skew-x: -13.7; skew-y: -12.7; scale-x: -10000; scale-y: 0.798; }
        frame 47 { x: 45.4; y: 86.3; skew-x: -17; skew-y: -17; scale-y: 0.79; }
        frame 48 { x: 46.1; y: 84.8; skew-x: -12.9; skew-y: -12.9; scale-x: 0.794; scale-y: 0.796; }
        frame 49 { x: 46.9; y: 83.3; skew-x: -8.7; skew-y: -8.7; scale-x: 0.795; scale-y: 0.802; }
        frame 50 { x: 47.5; y: 82.1; skew-x: -4.7; skew-y: -4.7; scale-x: 0.796; scale-y: 0.808; }
        frame 51 { x: 48.4; y: 80.8; skew-x: -0.7; skew-y: -0.7; scale-x: 0.797; scale-y: 0.814; }
        frame 52 { x: 49.3; y: 79.7; skew-x: 3.3; skew-y: 3.3; scale-x: 0.798; scale-y: 0.82; }
        frame 53 { x: 50.1; y: 78.7; skew-x: 7.3; skew-y: 7.4; scale-x: 0.799; scale-y: 0.826; }
        frame 54 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 51.4; y: 77.3; skew-x: 24; skew-y: 24; }
        frame 56 { x: 51.9; y: 76.4; skew-x: 28.3; skew-y: 28.3; scale-x: 0.798; scale-y: 0.825; }
        frame 57 { x: 52.4; y: 75.6; skew-x: 32.7; skew-y: 32.8; scale-x: -10000; scale-y: 0.826; }
        frame 58 { x: 52.5; y: 75.9; skew-x: 33.1; skew-y: 35.1; scale-x: 0.799; scale-y: 0.806; }
        frame 59 { x: -10000; y: 76.3; skew-x: 33.4; skew-y: 37.6; scale-x: 0.8; scale-y: 0.788; }
        frame 60 { x: 52.6; y: 76.5; skew-x: 33.8; skew-y: 40; scale-x: 0.803; scale-y: 0.772; }
        frame 61 { x: 49.4; y: 80.2; skew-x: 30.8; skew-y: 34.1; scale-x: 0.799; scale-y: 0.797; }
        frame 62 { x: 45.9; y: 84; skew-x: 28; skew-y: 28; scale-x: 0.797; scale-y: 0.824; }
        frame 63 { x: 46; y: 83.3; skew-x: 23.3; skew-y: 23.3; scale-x: 0.796; scale-y: 0.823; }
        frame 64 { x: 46.3; y: 82.7; skew-x: 18.6; skew-y: 18.6; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 46.5; y: 82.3; skew-x: 14; skew-y: 14; }
        frame 66 { x: 46.9; y: 81.5; skew-x: 10.6; skew-y: 10.6; scale-x: 0.795; }
        frame 67 { x: 47.3; y: 80.7; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; }
        frame 68 { x: 47.7; y: 80.1; skew-x: 4; skew-y: 4; }
        frame 69 { x: 48.1; y: 79.5; skew-x: 0.7; skew-y: 0.7; }
        frame 70 { x: 49.3; y: 79.7; skew-x: -1.7; skew-y: -0.4; }
        frame 71 { x: 50.3; y: 80; skew-x: -4.4; skew-y: -1.9; }
        frame 72 { x: 51.4; y: 80.3; skew-x: -7.2; skew-y: -3.4; scale-y: 0.824; }
        frame 73 { x: 48; y: 83.6; skew-x: -14.5; skew-y: -10.4; scale-x: 0.793; scale-y: 0.808; }
        frame 74 { x: 44.5; y: 86.8; skew-x: -22.1; skew-y: -17.4; scale-x: -10000; scale-y: 0.793; }
        frame 75 { x: 46.1; y: 83.8; skew-x: -12.2; skew-y: -9; scale-x: 0.794; scale-y: 0.803; }
        frame 76 { x: 48; y: 81; skew-x: -2.2; skew-y: -0.7; scale-x: 0.797; scale-y: 0.815; }
        frame 77 { x: 50.1; y: 78.7; skew-x: 7.3; skew-y: 7.4; scale-x: 0.799; scale-y: 0.826; }
        frame 78 { x: 50.5; y: 85.5; skew-x: 34.4; skew-y: 34.4; scale-x: 0.798; scale-y: 0.825; }
        frame 79 { x: 43.1; y: 73.8; skew-x: 15.5; skew-y: 15.5; scale-x: 0.797; scale-y: 0.824; }
        frame 80 { x: 36; y: 63.8; skew-x: -3; skew-y: -3; scale-x: 0.796; scale-y: -10000; }
        frame 81 { x: 29.7; y: 55.5; skew-x: -21.9; skew-y: -21.9; scale-x: -10000; scale-y: 0.823; }
        frame 82 { x: 36.6; y: 38; skew-x: 1.5; skew-y: 1.5; scale-x: 0.795; scale-y: -10000; }
        frame 83 { x: 44.6; y: 23.2; skew-x: 25.3; skew-y: 25.3; scale-x: 0.794; scale-y: 0.821; }
        frame 84 { x: 52.5; y: 11.3; skew-x: 49; skew-y: 49; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 54; y: 8.7; skew-x: 53.4; skew-y: 53.4; scale-x: 0.793; scale-y: 0.82; }
        frame 86 { x: 55.5; y: 6.3; skew-x: 58; skew-y: 58; scale-x: 0.794; scale-y: 0.821; }
        frame 87 { x: 57.1; y: 8.2; skew-x: 67.2; skew-y: 67.2; scale-x: 0.792; scale-y: 0.82; }
        frame 88 { x: 58.4; y: 10.3; skew-x: 76.4; skew-y: 76.4; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 59.3; y: 12.6; skew-x: 85.5; skew-y: 85.5; }
        frame 90 { x: 59.9; y: 15.1; skew-x: 94.6; skew-y: 94.6; scale-y: 0.819; }
        frame 91 { x: 58; y: 40.4; skew-x: 76; skew-y: 76; scale-x: 0.79; scale-y: 0.817; }
        frame 92 { x: 54.6; y: 66.9; skew-x: 57.4; skew-y: 57.4; scale-x: 0.788; scale-y: 0.815; }
        frame 93 { x: -10000; y: 91.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { y: -10000; cel: -1; }
        frame 95 { cel: -10000; }
        frame 102 { x: 50.1; y: 78.7; skew-x: 7.3; skew-y: 7.4; scale-x: 0.799; scale-y: 0.826; cel: 0; }
        frame 103 { x: 51.6; y: 79.6; skew-x: 15.8; skew-y: 15; scale-x: 0.798; scale-y: -10000; cel: -10000; }
        frame 104 { x: 53.4; y: 80.7; skew-x: 24.3; skew-y: 22.8; scale-x: 0.797; scale-y: 0.825; }
        frame 105 { x: 55; y: 82.3; skew-x: 32.7; skew-y: 30.6; scale-x: 0.798; scale-y: 0.826; }
        frame 106 { x: 54.4; y: 86.8; skew-x: 37.1; skew-y: 34.8; scale-x: 0.796; scale-y: 0.781; }
        frame 107 { x: 53.6; y: 91.3; skew-x: 41.3; skew-y: 39.1; scale-x: -10000; scale-y: 0.737; }
        frame 108 { x: 52.7; y: 95.8; skew-x: 45.6; skew-y: 43.4; scale-x: 0.797; scale-y: 0.694; }
        frame 109 { x: 52.5; y: 101.1; skew-x: 46.9; skew-y: 46.1; scale-x: 0.795; scale-y: 0.696; }
        frame 110 { x: 52.4; y: 106.3; skew-x: 48.1; skew-y: 48.7; scale-x: 0.794; scale-y: 0.698; }
        frame 111 { x: 52; y: 111.7; skew-x: 49.4; skew-y: 51.4; scale-x: 0.795; scale-y: 0.702; }
        frame 112 { x: 51.5; y: 109.7; skew-x: 48.9; skew-y: 48.7; scale-x: 0.794; scale-y: 0.697; }
        frame 113 { x: 51.1; y: 107.8; skew-x: 48.2; skew-y: 46.1; scale-x: 0.796; scale-y: 0.693; }
        frame 114 { x: 51.5; y: 109.2; skew-x: 49.9; skew-y: 47.6; scale-x: 0.795; scale-y: 0.692; }
        frame 115 { x: 51.9; y: 110.6; skew-x: 51.5; skew-y: 49.3; scale-x: 0.797; scale-y: 0.694; }
        frame 116 { x: 52.3; y: 110.3; skew-x: 52.6; skew-y: 52.1; scale-x: 0.795; scale-y: 0.693; }
        frame 117 { x: 52.5; y: 110; skew-x: 53.6; skew-y: 54.9; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: 52.8; y: 109.7; skew-x: 54.6; skew-y: 57.6; }
        frame 119 { x: 53; y: 109.3; skew-x: 55.5; skew-y: 60.3; scale-x: 0.796; scale-y: 0.695; }
        frame 120 { x: 57.5; y: 107.6; skew-x: 69.2; skew-y: 70.7; scale-x: 0.795; scale-y: 0.713; }
        frame 121 { x: 61.8; y: 106.5; skew-x: 82.7; skew-y: 81; scale-x: -10000; scale-y: 0.733; }
        frame 122 { x: 65.7; y: 105.9; skew-x: 96.3; skew-y: 91.1; scale-y: 0.753; }
        frame 123 { x: 72.2; y: 109.3; skew-x: 106.5; skew-y: 101.3; scale-x: 0.793; scale-y: 0.814; }
        frame 124 { x: 77.8; y: 113.5; skew-x: 116.8; skew-y: 111.8; scale-x: -10000; scale-y: 0.876; }
        frame 125 { x: 82.5; y: 117.2; skew-x: 127.1; skew-y: 122.1; scale-x: 0.791; scale-y: 0.866; }
        frame 126 { x: 86.7; y: 120.7; skew-x: 137.6; skew-y: 132.4; scale-x: -10000; scale-y: 0.856; }
        frame 127 { x: 90.5; y: 124; skew-x: 147.9; skew-y: 142.7; scale-x: 0.792; scale-y: 0.849; }
        frame 128 { x: 90.6; y: 124.3; skew-x: 147.4; skew-y: 138.6; scale-x: -10000; scale-y: 0.838; }
        frame 129 { x: 90.5; y: 124.7; skew-x: 146.7; skew-y: 134.6; scale-x: 0.794; scale-y: 0.83; }
        frame 130 { x: 90.6; y: 124.3; skew-x: 147.4; skew-y: 138.6; scale-x: 0.792; scale-y: 0.838; }
        frame 131 { x: 90.5; y: 124; skew-x: 147.9; skew-y: 142.7; scale-x: -10000; scale-y: 0.849; }
        frame 132 { x: 90.6; y: 123.9; skew-x: -10000; skew-y: -10000; scale-x: 0.791; scale-y: 0.847; }
        frame 133 { x: 90.5; y: 124; scale-x: 0.792; scale-y: 0.849; }
        frame 134 { x: 51.9; y: 78.5; skew-x: 11.4; skew-y: 11.4; scale-x: 0.799; scale-y: 0.826; }
        frame 135 { x: 52; y: 78.3; skew-x: 11.6; skew-y: 11.6; scale-x: 0.798; scale-y: -10000; }
        frame 136 { x: 52.2; y: 78.2; skew-x: 12; skew-y: 12; scale-x: -10000; }
        frame 137 { x: 52.4; y: 78; skew-x: 12.3; skew-y: 12.3; }
        frame 138 { x: 52.5; y: 77.7; skew-x: 12.5; skew-y: 12.5; }
        frame 139 { x: 52.7; y: 77.6; skew-x: 12.8; skew-y: 12.8; }
        frame 140 { x: 52.9; y: 77.5; skew-x: 13.1; skew-y: 13.1; }
        frame 141 { x: 53; y: 77.3; skew-x: 13.3; skew-y: 13.3; }
        frame 142 { x: 53.2; y: 77.2; skew-x: 13.8; skew-y: 13.8; scale-y: 0.825; }
        frame 143 { x: 53.4; y: 77; skew-x: 14; skew-y: 14; scale-y: -10000; }
        frame 144 { x: 53.5; y: 76.8; skew-x: 14.3; skew-y: 14.3; }
        frame 145 { x: 53.8; y: 76.6; skew-x: 14.7; skew-y: 14.7; scale-x: 0.799; scale-y: 0.826; }
        frame 146 { x: 52.5; y: -10000; skew-x: 14.8; skew-y: 15; scale-x: 0.798; scale-y: 0.825; }
        frame 147 { x: 51.4; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 50.1; y: 76.5; skew-x: 15.6; skew-y: 15.6; }
        frame 149 { x: 48.9; y: 76.6; skew-x: 16; skew-y: 16; scale-x: 0.799; scale-y: 0.826; }
        frame 150 { x: 48.5; y: 76.8; skew-x: 15.3; skew-y: 15.3; scale-x: 0.798; scale-y: 0.825; }
        frame 151 { x: 48.1; y: 77.2; skew-x: 14.7; skew-y: 14.7; scale-x: -10000; scale-y: 0.826; }
        frame 152 { x: 48.5; y: -10000; skew-x: 14.6; skew-y: 14.6; scale-y: 0.825; }
        frame 153 { x: 48.9; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 154 { x: 49.3; y: 77.1; }
        frame 155 { x: 49.6; y: -10000; }
        frame 156 { x: 50; }
        frame 157 { x: 50.5; y: 77; }
        frame 158 { x: 50.9; }
        frame 159 { x: 51.3; y: 76.9; }
        frame 160 { x: 51.6; y: 76.8; }
        frame 161 { x: 52; y: -10000; }
        frame 162 { x: 52.5; }
        frame 163 { x: 52.9; y: 76.7; }
        frame 164 { x: 53.3; y: -10000; }
        frame 165 { x: 53.8; y: 76.6; skew-x: 14.7; skew-y: 14.7; scale-x: 0.799; scale-y: 0.826; }
        frame 166 { x: 52.5; y: -10000; skew-x: 14.8; skew-y: 15; scale-x: 0.798; scale-y: 0.825; }
        frame 167 { x: 51.4; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 50.1; y: 76.5; skew-x: 15.6; skew-y: 15.6; }
        frame 169 { x: 48.9; y: 76.6; skew-x: 16; skew-y: 16; scale-x: 0.799; scale-y: 0.826; }
        frame 170 { x: 48.5; y: 76.8; skew-x: 15.3; skew-y: 15.3; scale-x: 0.798; scale-y: 0.825; }
        frame 171 { x: 48.1; y: 77.2; skew-x: 14.7; skew-y: 14.7; scale-x: -10000; scale-y: 0.826; }
        frame 172 { x: 49; y: 77.5; skew-x: 13.8; skew-y: 13.8; scale-y: 0.825; }
        frame 173 { x: 50; y: 77.8; skew-x: 13; skew-y: 13; scale-y: -10000; }
        frame 174 { x: 50.9; y: 78.2; skew-x: 12.1; skew-y: 12.1; scale-y: 0.826; }
        frame 175 { x: 51.9; y: 78.5; skew-x: 11.4; skew-y: 11.4; scale-x: 0.799; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_outerarm_lowereating";
        frame-count: 176;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 134 { x: 58.7; y: 66.2; skew-x: 47; skew-y: 47; scale-x: 0.769; scale-y: 0.818; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_LOWER; }
        frame 135 { x: 59.1; y: 66.5; skew-x: 48.9; skew-y: 48.9; scale-x: 0.767; scale-y: 0.816; cel: -10000; image: none; }
        frame 136 { x: 59.5; y: 66.7; skew-x: 50.7; skew-y: 50.7; scale-x: -10000; scale-y: 0.815; }
        frame 137 { x: 59.9; y: 67.1; skew-x: 52.6; skew-y: 52.6; scale-x: 0.766; scale-y: -10000; }
        frame 138 { x: 60.2; y: 67.5; skew-x: 54.4; skew-y: 54.4; scale-x: -10000; }
        frame 139 { x: 60.5; y: 67.7; skew-x: 56.4; skew-y: 56.4; scale-y: 0.814; }
        frame 140 { x: 60.9; y: 68; skew-x: 58.1; skew-y: 58.1; scale-x: 0.767; scale-y: 0.815; }
        frame 141 { x: 61.5; y: 68.2; skew-x: 62.2; skew-y: 62.2; scale-x: 0.766; scale-y: 0.814; }
        frame 142 { x: 62.1; y: 68.3; skew-x: 66.2; skew-y: 66.2; scale-x: -10000; scale-y: 0.815; }
        frame 143 { x: 62.7; y: 68.6; skew-x: 70.2; skew-y: 70.2; scale-y: -10000; }
        frame 144 { x: 63.2; y: 68.8; skew-x: 74.2; skew-y: 74.2; scale-x: 0.767; }
        frame 145 { x: 63.8; y: 69.1; skew-x: 78.2; skew-y: 78.2; scale-x: -10000; scale-y: 0.816; }
        frame 146 { x: 58.1; y: 69.8; skew-x: 88.5; skew-y: 86.7; scale-x: 0.766; scale-y: 0.817; }
        frame 147 { x: 52.2; y: 70.4; skew-x: 98.6; skew-y: 94.8; scale-x: 0.765; scale-y: -10000; }
        frame 148 { x: 46; y: 71.3; skew-x: 109; skew-y: 103.3; scale-x: 0.763; }
        frame 149 { x: 39.4; y: 72.5; skew-x: 119.3; skew-y: 111.8; scale-x: -10000; scale-y: 0.819; }
        frame 150 { x: 39.1; y: 73.3; skew-x: 121.8; skew-y: 112.5; scale-x: 0.762; scale-y: 0.822; }
        frame 151 { x: 38.8; y: 74.1; skew-x: 124.4; skew-y: 113.3; scale-x: 0.763; scale-y: 0.826; }
        frame 152 { x: 42.4; y: 73.1; skew-x: 110.3; skew-y: 102; scale-x: -10000; scale-y: 0.823; }
        frame 153 { x: 45.3; y: 72.2; skew-x: 96.3; skew-y: 90.8; scale-x: 0.764; scale-y: 0.82; }
        frame 154 { x: 47.8; y: 71.6; skew-x: 82.5; skew-y: 79.7; scale-x: 0.765; scale-y: 0.817; }
        frame 155 { x: 49.7; y: 71.5; skew-x: 68.5; skew-y: 68.5; scale-x: 0.766; scale-y: 0.814; }
        frame 156 { x: 52.9; y: 69.6; skew-x: 61.4; skew-y: 61.4; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 55.8; y: 67.9; skew-x: 54.2; skew-y: 54.2; scale-y: 0.815; }
        frame 158 { x: 58.7; y: 66.2; skew-x: 47; skew-y: 47; scale-x: 0.769; scale-y: 0.818; }
        frame 159 { x: 59.9; y: 66; skew-x: 45.9; skew-y: 45.9; scale-x: 0.767; scale-y: 0.816; }
        frame 160 { x: 60.8; y: 65.8; skew-x: 44.9; skew-y: 44.9; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 61.9; y: 65.6; skew-x: 43.9; skew-y: 43.9; }
        frame 162 { x: 63; y: 65.3; skew-x: 42.6; skew-y: 42.6; }
        frame 163 { x: 64; y: 65.2; skew-x: 41.6; skew-y: 41.6; }
        frame 164 { x: 65.1; y: 65; skew-x: 40.6; skew-y: 40.6; }
        frame 165 { x: 66.1; y: 64.8; skew-x: 39.5; skew-y: 39.5; scale-x: 0.768; scale-y: 0.817; }
        frame 166 { x: 64.5; y: 64.3; skew-x: 38.8; skew-y: 38.8; scale-x: 0.767; scale-y: 0.815; }
        frame 167 { x: 63.1; y: 63.6; skew-x: 38.1; skew-y: 38.1; scale-x: 0.766; scale-y: -10000; }
        frame 168 { x: 61.5; y: 63.2; skew-x: 37.4; skew-y: 37.4; scale-x: -10000; }
        frame 169 { x: 60.1; y: 62.5; skew-x: 36.7; skew-y: 36.7; scale-x: 0.767; }
        frame 170 { x: 59.9; y: 63.1; skew-x: 38.4; skew-y: 38.4; scale-x: 0.766; scale-y: 0.814; }
        frame 171 { x: 59.6; y: 63.7; skew-x: 40.1; skew-y: 40.1; scale-x: -10000; scale-y: 0.815; }
        frame 172 { x: 59.4; y: 64.3; skew-x: 41.9; skew-y: 41.9; scale-y: -10000; }
        frame 173 { x: 59.1; y: 65; skew-x: 43.6; skew-y: 43.6; scale-x: 0.767; }
        frame 174 { x: 59; y: 65.6; skew-x: 45.4; skew-y: 45.4; scale-x: -10000; scale-y: 0.816; }
        frame 175 { x: 58.7; y: 66.2; skew-x: 47; skew-y: 47; scale-x: 0.769; scale-y: 0.818; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 176;
        frame 0 { x: -2.9; y: 17; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BOBSLED_NEWHEAD; }
        frame 1 { x: -3; y: 16.7; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -2.9; y: 16.4; skew-x: 1.8; skew-y: 1.8; }
        frame 3 { x: -4.5; y: 18.2; skew-x: 0.3; skew-y: 0.3; }
        frame 4 { x: -6; y: 20; skew-x: -1; skew-y: -1; }
        frame 5 { x: -7.6; y: 21.9; skew-x: -2.7; skew-y: -2.7; }
        frame 6 { x: -9.2; y: 23.8; skew-x: -4.2; skew-y: -4.2; }
        frame 7 { x: -10.7; y: 25.7; skew-x: -5.7; skew-y: -5.7; }
        frame 8 { x: -10.3; y: 25.6; skew-x: -5.9; skew-y: -5.9; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: -9.9; y: 25.5; skew-x: -6.4; skew-y: -6.4; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: -8.5; y: 23.7; skew-x: -5; skew-y: -5; }
        frame 11 { x: -7.1; y: 21.9; skew-x: -3.7; skew-y: -3.7; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: -5.8; y: 20.4; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -4.2; y: 18.7; skew-x: -1.2; skew-y: -1.2; }
        frame 14 { x: -2.9; y: 17; skew-x: 0; skew-y: 0; }
        frame 15 { x: 3.3; y: 12.9; skew-x: 7.1; skew-y: 7.1; }
        frame 16 { x: 5.6; y: 11.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: 8; y: 9.8; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 10.4; y: 8.2; skew-x: 14.3; skew-y: 14.3; }
        frame 19 { x: 12.9; y: 6.8; skew-x: 16.7; skew-y: 16.7; }
        frame 20 { x: 17.2; y: 4.1; skew-x: 20.8; skew-y: 20.8; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 21.6; y: 1.4; skew-x: 24.8; skew-y: 24.8; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 26.2; y: -1; skew-x: 29.1; skew-y: 29.1; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 27.8; y: -1.4; skew-x: 29.6; skew-y: 29.6; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: 29.4; y: -1.8; skew-x: 30.1; skew-y: 30.1; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 31; y: -2.3; skew-x: 30.6; skew-y: 30.6; }
        frame 26 { x: 32.4; y: -3; skew-x: 31.2; skew-y: 31.2; scale-x: 0.798; scale-y: 0.798; }
        frame 27 { x: 23.3; y: 1.5; skew-x: 26.1; skew-y: 26.1; scale-x: 0.796; scale-y: 0.796; }
        frame 28 { x: 14.3; y: 6.5; skew-x: 21.1; skew-y: 21.1; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 1.7; y: 15.3; skew-x: 9.5; skew-y: 9.5; }
        frame 30 { x: -10; y: 25.1; skew-x: -1.9; skew-y: -1.9; }
        frame 31 { x: -9.1; y: 23.8; skew-x: -1.4; skew-y: -1.4; scale-x: 0.797; scale-y: 0.797; }
        frame 32 { x: -8.3; y: 22.4; skew-x: -1; skew-y: -1; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: -7.5; y: 21.1; skew-x: -0.7; skew-y: -0.7; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: -6.7; y: 19.9; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: -3; y: 17.1; skew-x: 2.8; skew-y: 2.8; }
        frame 36 { x: 0.9; y: 14.4; skew-x: 6.3; skew-y: 6.3; }
        frame 37 { x: 4.8; y: 11.7; skew-x: 9.8; skew-y: 9.8; }
        frame 38 { x: 8.9; y: 9.2; skew-x: 13.3; skew-y: 13.3; }
        frame 39 { x: 12.9; y: 6.8; skew-x: 16.7; skew-y: 16.7; }
        frame 40 { x: 17.1; y: 4.4; skew-x: 19.8; skew-y: 19.8; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 21.5; y: 2; skew-x: 23; skew-y: 23; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 25.8; y: -0.1; skew-x: 26.1; skew-y: 26.1; scale-x: 0.797; scale-y: 0.797; }
        frame 43 { x: 30.1; y: -2.4; skew-x: 29.4; skew-y: 29.4; scale-x: 0.798; scale-y: 0.798; }
        frame 44 { x: 23.1; y: 1.8; skew-x: 25.3; skew-y: 25.3; scale-x: 0.796; scale-y: 0.796; }
        frame 45 { x: 16.1; y: 6; skew-x: 21.1; skew-y: 21.1; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 2.1; y: 15.1; skew-x: 7.8; skew-y: 7.8; scale-x: 0.797; scale-y: 0.797; }
        frame 47 { x: -10.6; y: 25.2; skew-x: -5.5; skew-y: -5.5; scale-x: 0.798; scale-y: 0.798; }
        frame 48 { x: -8.9; y: 23.7; skew-x: -4.9; skew-y: -4.9; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: -7.3; y: 22.2; skew-x: -4.4; skew-y: -4.4; }
        frame 50 { x: -4.7; y: 19.8; skew-x: -1.4; skew-y: -1.4; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: -2.1; y: 17.4; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 0.5; y: 15.2; skew-x: 4; skew-y: 4; }
        frame 53 { x: 3.3; y: 12.9; skew-x: 7.1; skew-y: 7.1; scale-x: 0.8; scale-y: 0.8; }
        frame 54 { x: -7.8; y: 18.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: -7.6; y: -10000; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 56 { x: -7.2; y: 18.2; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: -6.8; y: 18; skew-x: 5.5; skew-y: 5.5; }
        frame 58 { x: -6.5; y: 17.9; skew-x: 5; skew-y: 5; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: -6; y: 17.8; skew-x: 4.5; skew-y: 4.5; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: -5.7; y: 17.6; skew-x: 4; skew-y: 4; }
        frame 61 { x: -9.8; y: 23.4; skew-x: -10000; skew-y: -10000; }
        frame 62 { x: -13.9; y: 29.1; skew-x: 4.3; skew-y: 4.3; }
        frame 63 { x: -13; y: 27.9; skew-x: -10000; skew-y: -10000; }
        frame 64 { x: -12.3; y: 26.8; }
        frame 65 { x: -11.5; y: 25.7; skew-x: 4.1; skew-y: 4.1; }
        frame 66 { x: -10.7; y: 24.5; skew-x: 4; skew-y: 4; }
        frame 67 { x: -9.9; y: 23.4; skew-x: -10000; skew-y: -10000; }
        frame 68 { x: -9; y: 22.2; }
        frame 69 { x: -8.2; y: 21; }
        frame 70 { x: -7.3; y: 19.9; }
        frame 71 { x: -6.5; y: 18.7; }
        frame 72 { x: -5.7; y: 17.6; }
        frame 73 { x: -9.8; y: 23.4; }
        frame 74 { x: -13.9; y: 29.1; skew-x: 4.3; skew-y: 4.3; }
        frame 75 { x: -12; y: 25.7; skew-x: 5.1; skew-y: 5.1; }
        frame 76 { x: -10; y: 22; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 77 { x: -7.8; y: 18.4; skew-x: 7.1; skew-y: 7.1; scale-x: 0.8; scale-y: 0.8; }
        frame 78 { x: -16.2; y: 41.8; skew-x: -6.7; skew-y: -6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 79 { x: -5.5; y: 15.6; skew-x: 12.5; skew-y: 12.5; scale-x: 0.797; scale-y: 0.797; }
        frame 80 { x: 6.6; y: -7.3; skew-x: 31.8; skew-y: 31.8; scale-x: 0.796; scale-y: 0.796; }
        frame 81 { x: 19.5; y: -26.8; skew-x: 51.1; skew-y: 51.1; scale-x: 0.797; scale-y: 0.797; }
        frame 82 { x: 13.5; y: -34.5; skew-x: 39.1; skew-y: 39.1; scale-x: 0.795; scale-y: 0.795; }
        frame 83 { x: 7.5; y: -40.8; skew-x: 27.1; skew-y: 27.1; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 2; y: -45.9; skew-x: 15.2; skew-y: 15.2; }
        frame 85 { x: -5.5; y: -41.3; skew-x: 0.3; skew-y: 0.3; }
        frame 86 { x: -11.7; y: -35.3; skew-x: -14.3; skew-y: -14.3; scale-x: 0.794; scale-y: 0.794; }
        frame 87 { x: -11.5; y: -34.4; skew-x: -14.2; skew-y: -14.2; scale-x: 0.793; scale-y: 0.793; }
        frame 88 { x: -11.2; y: -33.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -10.9; y: -32.6; }
        frame 90 { x: -10.7; y: -31.7; skew-x: -14.3; skew-y: -14.3; scale-x: 0.794; scale-y: 0.794; }
        frame 91 { x: -8.5; y: -7.9; skew-x: -9.7; skew-y: -9.7; scale-x: 0.792; scale-y: 0.792; }
        frame 92 { x: -6.3; y: 15.8; skew-x: -5.2; skew-y: -5.2; scale-x: 0.791; scale-y: 0.791; }
        frame 93 { x: -4.1; y: 40.1; skew-x: -0.8; skew-y: -0.8; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: -7; y: 51.9; skew-x: -10.9; skew-y: -10.9; scale-x: 0.79; scale-y: 0.79; }
        frame 95 { x: -9.1; y: 64.1; skew-x: -21.3; skew-y: -21.3; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: -7.7; y: 60.4; skew-x: -18.7; skew-y: -18.7; scale-x: 0.789; scale-y: 0.789; }
        frame 97 { x: -6.2; y: 56.5; skew-x: -16.4; skew-y: -16.4; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: -3.7; y: 52.3; skew-x: -11.7; skew-y: -11.7; scale-x: 0.788; scale-y: 0.788; }
        frame 99 { x: -1.1; y: 48.4; skew-x: -6.9; skew-y: -6.9; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 1.7; y: 44.4; skew-x: -2.2; skew-y: -2.2; }
        frame 101 { x: 4.6; y: 40.8; skew-x: 2.4; skew-y: 2.4; }
        frame 102 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 103 { cel: -10000; }
        frame 134 { x: 3.3; y: 12.9; skew-x: 7.1; skew-y: 7.1; scale-x: 0.8; scale-y: 0.8; cel: 0; }
        frame 135 { x: 5.6; y: 11.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.799; scale-y: 0.799; cel: -10000; }
        frame 136 { x: 8; y: 9.8; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 10.4; y: 8.2; skew-x: 14.3; skew-y: 14.3; }
        frame 138 { x: 12.9; y: 6.8; skew-x: 16.7; skew-y: 16.7; }
        frame 139 { x: 17.2; y: 4.1; skew-x: 20.8; skew-y: 20.8; scale-x: 0.798; scale-y: 0.798; }
        frame 140 { x: 21.6; y: 1.4; skew-x: 24.8; skew-y: 24.8; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: 26.2; y: -1; skew-x: 29.1; skew-y: 29.1; scale-x: 0.799; scale-y: 0.799; }
        frame 142 { x: 27.8; y: -1.4; skew-x: 29.6; skew-y: 29.6; scale-x: 0.797; scale-y: 0.797; }
        frame 143 { x: 29.4; y: -1.8; skew-x: 30.1; skew-y: 30.1; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 31; y: -2.3; skew-x: 30.6; skew-y: 30.6; }
        frame 145 { x: 32.4; y: -3; skew-x: 31.2; skew-y: 31.2; scale-x: 0.798; scale-y: 0.798; }
        frame 146 { x: 23.3; y: 1.5; skew-x: 26.1; skew-y: 26.1; scale-x: 0.796; scale-y: 0.796; }
        frame 147 { x: 14.3; y: 6.5; skew-x: 21.1; skew-y: 21.1; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 2.7; y: 12.2; skew-x: 9.5; skew-y: 9.5; }
        frame 149 { x: -8; y: 18.8; skew-x: -1.9; skew-y: -1.9; }
        frame 150 { x: -8.1; y: 20; skew-x: -1.4; skew-y: -1.4; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: -8.3; y: 21.2; skew-x: -1; skew-y: -1; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: -6.7; y: 20; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: -5; y: 18.7; skew-x: 1.3; skew-y: 1.3; }
        frame 154 { x: -3.4; y: 17.6; skew-x: 2.3; skew-y: 2.3; scale-x: 0.799; scale-y: 0.799; }
        frame 155 { x: -1.6; y: 16.4; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: -0; y: 15.1; skew-x: 4.8; skew-y: 4.8; }
        frame 157 { x: 1.6; y: 14.1; skew-x: 5.8; skew-y: 5.8; }
        frame 158 { x: 3.3; y: 12.9; skew-x: 7.1; skew-y: 7.1; scale-x: 0.8; scale-y: 0.8; }
        frame 159 { x: 7.1; y: 10.5; skew-x: 10.3; skew-y: 10.3; scale-x: 0.799; scale-y: 0.799; }
        frame 160 { x: 10.7; y: 8.1; skew-x: 13.3; skew-y: 13.3; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 14.6; y: 5.8; skew-x: 16.6; skew-y: 16.6; scale-x: 0.798; scale-y: 0.798; }
        frame 162 { x: 18.4; y: 3.5; skew-x: 19.8; skew-y: 19.8; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 22.3; y: 1.4; skew-x: 23; skew-y: 23; scale-x: 0.797; scale-y: 0.797; }
        frame 164 { x: 26; y: -0.5; skew-x: 26.1; skew-y: 26.1; scale-x: -10000; scale-y: -10000; }
        frame 165 { x: 30.1; y: -2.4; skew-x: 29.4; skew-y: 29.4; scale-x: 0.798; scale-y: 0.798; }
        frame 166 { x: 23.1; y: 1; skew-x: 25.3; skew-y: 25.3; scale-x: 0.796; scale-y: 0.796; }
        frame 167 { x: 16.1; y: 4.5; skew-x: 21.1; skew-y: 21.1; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 2.7; y: 11.7; skew-x: 9.5; skew-y: 9.5; }
        frame 169 { x: -9.8; y: 19.8; skew-x: -1.9; skew-y: -1.9; }
        frame 170 { x: -8.2; y: 19.9; skew-x: -1.7; skew-y: -1.7; }
        frame 171 { x: -6.5; y: -10000; skew-x: -1.9; skew-y: -1.9; }
        frame 172 { x: -4; y: 18.1; skew-x: 0.3; skew-y: 0.3; scale-x: 0.797; scale-y: 0.797; }
        frame 173 { x: -1.6; y: 16.3; skew-x: 2.5; skew-y: 2.5; scale-x: 0.798; scale-y: 0.798; }
        frame 174 { x: 0.7; y: 14.6; skew-x: 4.8; skew-y: 4.8; scale-x: 0.799; scale-y: 0.799; }
        frame 175 { x: 3.3; y: 12.9; skew-x: 7.1; skew-y: 7.1; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 176;
        frame 0 { x: 5.9; y: 51.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_JAW; }
        frame 1 { x: 5.2; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 4.6; y: 51.2; skew-x: 0.3; skew-y: 0.3; }
        frame 3 { x: 3.8; y: 53.3; skew-x: -1.7; skew-y: -1.7; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 2.9; y: 55.4; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 2.1; y: 57.6; skew-x: -6; skew-y: -6; }
        frame 6 { x: 1.3; y: 59.6; skew-x: -8.2; skew-y: -8.2; }
        frame 7 { x: 0.4; y: 61.8; skew-x: -10.5; skew-y: -10.5; scale-x: 0.8; scale-y: 0.8; }
        frame 8 { x: 1.1; y: 61.9; skew-x: -12.2; skew-y: -12.2; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 1.6; y: 62.1; skew-x: -14; skew-y: -14; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 2.4; y: 59.9; skew-x: -11; skew-y: -11; }
        frame 11 { x: 3.1; y: 57.7; skew-x: -8.2; skew-y: -8.2; }
        frame 12 { x: 4.1; y: 55.6; skew-x: -5.4; skew-y: -5.4; }
        frame 13 { x: 4.8; y: 53.5; skew-x: -2.7; skew-y: -2.7; scale-x: 0.8; scale-y: 0.8; }
        frame 14 { x: 5.9; y: 51.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 6.6; y: 51; skew-x: 1; skew-y: 1; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 7.3; y: 49.3; skew-x: 4.1; skew-y: 4.1; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 8.3; y: 47.4; skew-x: 7.5; skew-y: 7.5; }
        frame 18 { x: 9; y: 46.4; skew-x: 8.8; skew-y: 8.8; }
        frame 19 { x: 9.6; y: 45.3; skew-x: 10.1; skew-y: 10.1; }
        frame 20 { x: 11; y: 42.7; skew-x: 13; skew-y: 13; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 12.4; y: 40.2; skew-x: 15.8; skew-y: 15.8; scale-x: 0.797; scale-y: 0.797; }
        frame 22 { x: 14; y: 37.5; skew-x: 18.9; skew-y: 18.9; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 15.1; y: 37; skew-x: 18.3; skew-y: 18.3; scale-x: 0.796; scale-y: 0.796; }
        frame 24 { x: 16.2; y: 36.4; skew-x: 17.8; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 17.2; y: 35.8; skew-x: 17.1; skew-y: 17.1; }
        frame 26 { x: 18.4; y: 35.2; skew-x: 16.7; skew-y: 16.7; scale-x: 0.797; scale-y: 0.797; }
        frame 27 { x: 12.5; y: 40; skew-x: 12.6; skew-y: 12.6; scale-x: 0.795; scale-y: 0.795; }
        frame 28 { x: 6.8; y: 44.6; skew-x: 8.6; skew-y: 8.6; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 2.8; y: 53.5; skew-x: -0.4; skew-y: -0.4; }
        frame 30 { x: -0.7; y: 62.5; skew-x: -9.8; skew-y: -9.8; }
        frame 31 { x: -0.5; y: 61.8; skew-x: -10.7; skew-y: -10.7; }
        frame 32 { x: -0.3; y: 61.1; skew-x: -11.9; skew-y: -11.9; scale-x: 0.797; scale-y: 0.797; }
        frame 33 { x: 0.3; y: 58.9; skew-x: -8.4; skew-y: -8.4; scale-x: 0.798; scale-y: 0.798; }
        frame 34 { x: 1.1; y: 57; skew-x: -5.2; skew-y: -5.2; scale-x: 0.799; scale-y: 0.799; }
        frame 35 { x: 2.7; y: 54.6; skew-x: -2; skew-y: -2; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 4.3; y: 52.4; skew-x: 0.8; skew-y: 0.8; }
        frame 37 { x: 6.1; y: 50; skew-x: 3.8; skew-y: 3.8; }
        frame 38 { x: 7.8; y: 47.7; skew-x: 7; skew-y: 7; }
        frame 39 { x: 9.6; y: 45.3; skew-x: 10.1; skew-y: 10.1; }
        frame 40 { x: 11.6; y: 42.8; skew-x: 12.8; skew-y: 12.8; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 13.6; y: 40.2; skew-x: 15.3; skew-y: 15.3; scale-x: 0.797; scale-y: 0.797; }
        frame 42 { x: 15.6; y: 37.6; skew-x: 18; skew-y: 18; scale-x: 0.796; scale-y: 0.796; }
        frame 43 { x: 17.9; y: 35.2; skew-x: 20.7; skew-y: 20.7; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 13.2; y: 39.6; skew-x: 14.6; skew-y: 14.6; scale-x: 0.795; scale-y: 0.795; }
        frame 45 { x: 8.6; y: 44.1; skew-x: 8.6; skew-y: 8.6; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 4.3; y: 53.9; skew-x: -4; skew-y: -4; scale-x: 0.796; scale-y: 0.796; }
        frame 47 { x: 0.5; y: 63.8; skew-x: -17; skew-y: -17; scale-x: 0.797; scale-y: 0.797; }
        frame 48 { x: 2; y: 61.8; skew-x: -13.5; skew-y: -10.9; scale-x: 0.798; scale-y: 0.796; }
        frame 49 { x: 3.6; y: 60; skew-x: -10.3; skew-y: -5.1; scale-x: 0.8; scale-y: 0.797; }
        frame 50 { x: 4.3; y: 57.8; skew-x: -7.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 5.1; y: 55.5; skew-x: -4.5; skew-y: -1.9; scale-y: 0.798; }
        frame 52 { x: 5.8; y: 53.1; skew-x: -1.7; skew-y: -0.4; scale-y: 0.799; }
        frame 53 { x: 6.6; y: 51; skew-x: 1; skew-y: 1; scale-x: 0.799; scale-y: -10000; }
        frame 54 { x: -5.4; y: 55.5; skew-x: 5; skew-y: 5; scale-x: 0.797; scale-y: 0.797; }
        frame 55 { x: -4; y: 55.2; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: -2.8; y: 54.8; skew-x: 2.3; skew-y: 2.3; }
        frame 57 { x: -1.5; y: 54.5; skew-x: 0.8; skew-y: 0.8; }
        frame 58 { x: -0.3; y: 54; skew-x: -0.2; skew-y: -0.2; }
        frame 59 { x: 1; y: 53.7; skew-x: -1.4; skew-y: -1.4; }
        frame 60 { x: 2.3; y: 53.4; skew-x: -2.9; skew-y: -2.9; scale-x: 0.796; scale-y: 0.796; }
        frame 61 { x: -2.8; y: 60.6; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: -7.9; y: 68; skew-x: -2.4; skew-y: -2.4; scale-x: 0.797; scale-y: 0.797; }
        frame 63 { x: -6.9; y: 66.5; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 64 { x: -6; y: 64.9; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -5; y: 63.4; }
        frame 66 { x: -4; y: 61.9; skew-x: -2.5; skew-y: -2.5; }
        frame 67 { x: -3; y: 60.4; skew-x: -2.7; skew-y: -2.7; }
        frame 68 { x: -2; y: 58.9; skew-x: -10000; skew-y: -10000; }
        frame 69 { x: -1.1; y: 57.4; }
        frame 70 { x: -0.1; y: 55.9; }
        frame 71 { x: 0.8; y: 54.4; }
        frame 72 { x: 1.8; y: 52.9; skew-x: -2.9; skew-y: -2.9; }
        frame 73 { x: -3; y: 60.5; skew-x: -2.7; skew-y: -2.7; }
        frame 74 { x: -7.9; y: 68.2; skew-x: -2.4; skew-y: -2.4; scale-x: 0.797; scale-y: 0.797; }
        frame 75 { x: -7.1; y: 64; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: -6.3; y: 59.8; skew-x: 2.3; skew-y: 2.3; }
        frame 77 { x: -5.4; y: 55.5; skew-x: 5; skew-y: 5; }
        frame 78 { x: -3.3; y: 74.8; skew-x: -6.7; skew-y: -6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 79 { x: -3.8; y: 49.5; skew-x: 12.5; skew-y: 12.5; scale-x: 0.797; scale-y: 0.797; }
        frame 80 { x: -3; y: 24.8; skew-x: 31.8; skew-y: 31.8; scale-x: 0.796; scale-y: 0.796; }
        frame 81 { x: -1.4; y: 1.4; skew-x: 51.1; skew-y: 51.1; scale-x: 0.797; scale-y: 0.797; }
        frame 82 { x: -10000; y: -1.8; skew-x: 36.4; skew-y: 36.4; scale-x: 0.795; scale-y: 0.795; }
        frame 83 { x: -0.9; y: -4.5; skew-x: 21.6; skew-y: 21.6; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 0.1; y: -6.5; skew-x: 7; skew-y: 7; }
        frame 85 { x: 1.5; y: -3.3; skew-x: -7.7; skew-y: -7.7; scale-x: 0.794; scale-y: 0.811; }
        frame 86 { x: 3.8; y: -0; skew-x: -22.6; skew-y: -22.6; scale-x: -10000; scale-y: 0.828; }
        frame 87 { x: 4; y: 0.8; skew-x: -22.5; skew-y: -22.5; scale-x: 0.793; scale-y: 0.827; }
        frame 88 { x: 4.3; y: 1.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 4.6; y: 2.5; }
        frame 90 { x: 4.8; y: 3.5; skew-x: -22.6; skew-y: -22.6; scale-x: 0.794; scale-y: 0.828; }
        frame 91 { x: -10000; y: 27.4; skew-x: -18; skew-y: -18; scale-x: 0.792; scale-y: 0.826; }
        frame 92 { y: 51.3; skew-x: -13.5; skew-y: -13.5; scale-x: 0.791; scale-y: 0.825; }
        frame 93 { x: 5; y: 75.3; skew-x: -9.1; skew-y: -9; scale-x: 0.79; scale-y: 0.824; }
        frame 94 { x: 7.3; y: 85.8; skew-x: -19.2; skew-y: -19.2; scale-x: 0.789; scale-y: 0.823; }
        frame 95 { x: 10.2; y: 96.4; skew-x: -29.6; skew-y: -29.6; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 10.3; y: 93.8; skew-x: -27.2; skew-y: -27.2; scale-x: 0.788; scale-y: 0.822; }
        frame 97 { x: -10000; y: 91; skew-x: -24.7; skew-y: -24.7; scale-x: 0.789; scale-y: 0.823; }
        frame 98 { x: 10.2; y: 87.1; skew-x: -17.9; skew-y: -17.9; scale-x: 0.788; scale-y: 0.822; }
        frame 99 { x: -10000; y: 83.1; skew-x: -11.2; skew-y: -11.2; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 10.5; y: 79.1; skew-x: -4.4; skew-y: -4.4; }
        frame 101 { x: 10.9; y: 75.2; skew-x: 2.2; skew-y: 2.2; scale-y: 0.821; }
        frame 102 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 103 { cel: -10000; }
        frame 134 { x: 6.6; y: 51; skew-x: 1; skew-y: 1; scale-x: 0.799; scale-y: 0.799; cel: 0; }
        frame 135 { x: 7.3; y: 49.5; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 136 { x: 8; y: 48.2; skew-x: 5.5; skew-y: 5.5; }
        frame 137 { x: 8.8; y: 46.8; skew-x: 7.8; skew-y: 7.8; }
        frame 138 { x: 9.6; y: 45.3; skew-x: 10.1; skew-y: 10.1; }
        frame 139 { x: 11.3; y: 42.3; skew-x: 11.5; skew-y: 11.8; scale-x: 0.798; scale-y: 0.808; }
        frame 140 { x: 12.9; y: 39.5; skew-x: 13; skew-y: 13.6; scale-x: 0.797; scale-y: 0.817; }
        frame 141 { x: 14.5; y: 36.6; skew-x: 14.5; skew-y: 15.5; scale-x: -10000; scale-y: 0.827; }
        frame 142 { x: 15.5; y: 36; skew-x: 16; skew-y: 17.3; scale-y: 0.836; }
        frame 143 { x: 16.8; y: 35.5; skew-x: 17.5; skew-y: 19.3; scale-y: 0.845; }
        frame 144 { x: 17.9; y: 35; skew-x: 19; skew-y: 21.1; scale-x: 0.796; scale-y: 0.855; }
        frame 145 { x: 19; y: 34.4; skew-x: 20.5; skew-y: 23; scale-x: 0.797; scale-y: 0.866; }
        frame 146 { x: 14; y: 38.1; skew-x: 14.8; skew-y: 14.5; scale-x: 0.822; scale-y: 0.847; }
        frame 147 { x: 9.1; y: 42.3; skew-x: 9.1; skew-y: 6.3; scale-x: 0.848; scale-y: 0.83; }
        frame 148 { x: 4.2; y: 46.5; skew-x: 3.5; skew-y: -1.9; scale-x: 0.874; scale-y: 0.812; }
        frame 149 { x: -0.4; y: 51.3; skew-x: -2; skew-y: -10.2; scale-x: 0.899; scale-y: 0.794; }
        frame 150 { x: 0.8; y: 52.1; skew-x: -1.4; skew-y: -5.5; scale-x: 0.881; scale-y: 0.795; }
        frame 151 { x: 2; y: 53; skew-x: -1; skew-y: -1; scale-x: 0.863; scale-y: 0.796; }
        frame 152 { x: 2.8; y: 52.6; skew-x: -0.7; skew-y: -0.7; scale-x: 0.854; scale-y: -10000; }
        frame 153 { x: 3.3; y: 52.3; skew-x: -0.2; skew-y: -0.2; scale-x: 0.845; scale-y: 0.797; }
        frame 154 { x: 4.1; y: 52; skew-x: 0; skew-y: 0; scale-x: 0.836; scale-y: -10000; }
        frame 155 { x: 4.7; y: 51.7; skew-x: -10000; skew-y: -10000; scale-x: 0.827; scale-y: 0.798; }
        frame 156 { x: 5.3; y: 51.5; skew-x: 0.3; skew-y: 0.3; scale-x: 0.818; scale-y: -10000; }
        frame 157 { x: 6; y: 51.1; skew-x: 0.5; skew-y: 0.5; scale-x: 0.808; scale-y: 0.799; }
        frame 158 { x: 6.6; y: 51; skew-x: 1; skew-y: 1; scale-x: 0.799; scale-y: -10000; }
        frame 159 { x: 8.1; y: 48.8; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; }
        frame 160 { x: 9.6; y: 46.6; skew-x: 6.3; skew-y: 6.3; scale-x: 0.798; scale-y: 0.798; }
        frame 161 { x: 11; y: 44.5; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 12.7; y: 42.2; skew-x: 11.8; skew-y: 11.8; scale-x: 0.797; scale-y: 0.797; }
        frame 163 { x: 14.2; y: 40.1; skew-x: 14.5; skew-y: 14.5; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 15.8; y: 38; skew-x: 17.3; skew-y: 17.3; scale-x: 0.796; scale-y: 0.796; }
        frame 165 { x: 17.7; y: 35.8; skew-x: 20; skew-y: 20; scale-x: -10000; scale-y: -10000; }
        frame 166 { x: 14; y: 39.5; skew-x: 14.3; skew-y: 14.3; scale-x: 0.795; scale-y: 0.795; }
        frame 167 { x: 10.6; y: 43.4; skew-x: 8.6; skew-y: 8.6; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 3.6; y: 47.6; skew-x: 4.8; skew-y: 0.8; scale-x: 0.825; }
        frame 169 { x: -3; y: 51.9; skew-x: 1.1; skew-y: -7; scale-x: 0.854; scale-y: 0.794; }
        frame 170 { x: -0; y: 51.8; skew-x: -0.2; skew-y: -4.4; scale-x: 0.872; scale-y: -10000; }
        frame 171 { x: 3; y: 51.6; skew-x: -1.8; skew-y: -1.8; scale-x: 0.891; scale-y: 0.795; }
        frame 172 { x: 4; y: 51.4; skew-x: -1; skew-y: -1; scale-x: 0.868; scale-y: 0.796; }
        frame 173 { x: 4.8; y: 51.3; skew-x: -0.2; skew-y: -0.2; scale-x: 0.845; scale-y: 0.797; }
        frame 174 { x: 5.7; y: 51.1; skew-x: 0.1; skew-y: 0.1; scale-x: 0.822; scale-y: 0.798; }
        frame 175 { x: 6.6; y: 51; skew-x: 1; skew-y: 1; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "Zombie_outerarm_handeating";
        frame-count: 176;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 134 { x: 45.5; y: 73; skew-x: 68.6; skew-y: 68.6; scale-x: 0.764; scale-y: 0.764; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_HAND; }
        frame 135 { x: 45; y: 72.8; skew-x: 66.2; skew-y: 66.2; scale-x: 0.763; scale-y: 0.763; cel: -10000; image: none; }
        frame 136 { x: 44.5; y: 72.6; skew-x: 63.7; skew-y: 63.7; scale-x: 0.762; scale-y: 0.762; }
        frame 137 { x: 43.9; y: 72.5; skew-x: 61.4; skew-y: 61.4; scale-x: -10000; scale-y: -10000; }
        frame 138 { x: 43.4; y: 72.3; skew-x: 58.9; skew-y: 58.9; scale-x: 0.761; scale-y: 0.761; }
        frame 139 { x: 42.9; y: -10000; skew-x: 56.6; skew-y: 56.6; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 42.3; y: 72.1; skew-x: 54.1; skew-y: 54.1; }
        frame 141 { x: 43; y: 70.9; skew-x: 58.7; skew-y: 58.7; scale-x: 0.76; scale-y: 0.76; }
        frame 142 { x: 43.7; y: 69.8; skew-x: 63.2; skew-y: 63.2; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 44.3; y: 68.7; skew-x: 67.7; skew-y: 67.7; scale-x: 0.761; scale-y: 0.761; }
        frame 144 { x: 45; y: 67.7; skew-x: 72.4; skew-y: 72.4; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 45.6; y: 66.7; skew-x: 76.8; skew-y: 76.8; scale-x: 0.762; scale-y: 0.762; }
        frame 146 { x: 40.9; y: 64.6; skew-x: 85.2; skew-y: 85.2; scale-x: 0.761; scale-y: 0.761; }
        frame 147 { x: 36; y: 62.7; skew-x: 93.3; skew-y: 93.3; scale-x: 0.76; scale-y: 0.76; }
        frame 148 { x: 30.7; y: 61; skew-x: 101.6; skew-y: 101.6; scale-x: 0.759; scale-y: 0.759; }
        frame 149 { x: 25.3; y: 59.5; skew-x: 110; skew-y: 110; scale-x: 0.758; scale-y: 0.758; }
        frame 150 { x: 22.7; y: 57.8; skew-x: 99.3; skew-y: 99.3; scale-x: 0.757; scale-y: 0.757; }
        frame 151 { x: 19.8; y: 56.4; skew-x: 88.9; skew-y: 88.9; scale-x: -10000; scale-y: -10000; }
        frame 152 { x: 23.1; y: 60.4; skew-x: 86.7; skew-y: 86.7; scale-x: 0.758; scale-y: 0.758; }
        frame 153 { x: 26.6; y: 64.3; skew-x: 84.5; skew-y: 84.5; scale-x: 0.759; scale-y: 0.759; }
        frame 154 { x: 29.9; y: 68.3; skew-x: 82.2; skew-y: 82.2; scale-x: 0.76; scale-y: 0.76; }
        frame 155 { x: 33.4; y: 72.3; skew-x: 80; skew-y: 80; scale-x: 0.761; scale-y: 0.761; }
        frame 156 { x: 37.5; y: 72.5; skew-x: 76.2; skew-y: 76.2; scale-x: 0.762; scale-y: 0.762; }
        frame 157 { x: 41.4; y: 72.7; skew-x: 72.5; skew-y: 72.5; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 45.5; y: 73; skew-x: 68.6; skew-y: 68.6; scale-x: 0.764; scale-y: 0.764; }
        frame 159 { x: 46.3; y: 72.9; skew-x: 65.4; skew-y: 65.4; scale-x: 0.763; scale-y: 0.763; }
        frame 160 { x: 47; y: 72.8; skew-x: 62.2; skew-y: 62.2; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 47.8; y: 72.9; skew-x: 59.2; skew-y: 59.2; }
        frame 162 { x: 48.6; y: 73; skew-x: 55.9; skew-y: 55.9; scale-x: 0.762; scale-y: 0.762; }
        frame 163 { x: 49.5; y: 73.1; skew-x: 52.9; skew-y: 52.9; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 50.1; y: 73.2; skew-x: 49.6; skew-y: 49.6; }
        frame 165 { x: 50.8; y: 73.4; skew-x: 46.5; skew-y: 46.5; scale-x: 0.763; scale-y: 0.763; }
        frame 166 { x: 49; y: 73.2; skew-x: 42.4; skew-y: 42.4; scale-x: 0.761; scale-y: 0.761; }
        frame 167 { x: 47.2; y: 73.1; skew-x: 38.4; skew-y: 38.4; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 45.5; y: 73; skew-x: 34.4; skew-y: 34.4; scale-x: 0.76; scale-y: 0.76; }
        frame 169 { x: 43.5; y: 72.8; skew-x: 30.4; skew-y: 30.4; scale-x: 0.761; scale-y: 0.761; }
        frame 170 { x: 44; y: 72.4; skew-x: 36.8; skew-y: 36.8; scale-x: 0.76; scale-y: 0.76; }
        frame 171 { x: 44.3; y: 72.2; skew-x: 43.1; skew-y: 43.1; scale-x: 0.761; scale-y: 0.761; }
        frame 172 { x: 44.6; y: 72.1; skew-x: 49.4; skew-y: 49.4; scale-x: -10000; scale-y: -10000; }
        frame 173 { x: 45; y: 72.3; skew-x: 55.9; skew-y: 55.9; scale-x: 0.762; scale-y: 0.762; }
        frame 174 { x: 45.3; y: 72.5; skew-x: 62.2; skew-y: 62.2; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 45.5; y: 73; skew-x: 68.6; skew-y: 68.6; scale-x: 0.764; scale-y: 0.764; }
    }
    Track {
        source-name: "Zombie_outerarm_lower";
        frame-count: 176;
        frame 0 { x: 57.1; y: 62.8; skew-y: 356.8; scale-x: 0.8; scale-y: 0.852; image: IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_LOWER; }
        frame 1 { x: -10000; y: 62.7; skew-x: -0.7; skew-y: 357.7; scale-x: -10000; scale-y: 0.851; image: none; }
        frame 2 { x: 57; y: 62.6; skew-x: -1.4; skew-y: 358.5; scale-y: -10000; }
        frame 3 { x: 56.3; y: 63.2; skew-x: -2.2; skew-y: 357.7; }
        frame 4 { x: 55.5; y: 63.9; skew-x: -3; skew-y: 356.9; scale-y: 0.85; }
        frame 5 { x: 54.8; y: 64.5; skew-x: -3.9; skew-y: 356; scale-y: -10000; }
        frame 6 { x: 54.1; y: 65.2; skew-x: -4.7; skew-y: 355.2; }
        frame 7 { x: 53.3; y: 66; skew-x: -5.7; skew-y: 354.2; scale-y: 0.851; }
        frame 8 { x: 52.9; y: 66.3; skew-x: -5.4; skew-y: 354.5; scale-x: 0.799; scale-y: 0.85; }
        frame 9 { x: 52.3; y: 66.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 53.4; y: 66; skew-x: -4.2; skew-y: 355.7; }
        frame 11 { x: 54.6; y: 65.3; skew-x: -3.2; skew-y: 356.7; }
        frame 12 { x: 55.6; y: 64.6; skew-x: -2; skew-y: 357.9; scale-x: 0.8; }
        frame 13 { x: 56.8; y: 63.9; skew-x: -0.9; skew-y: 359; scale-x: -10000; scale-y: 0.851; }
        frame 14 { x: 57.9; y: 63.3; skew-x: 0; skew-y: 360; scale-y: -10000; }
        frame 15 { x: 47.4; y: 73.8; skew-x: 2.2; skew-y: 362.2; scale-x: 0.799; scale-y: 0.849; }
        frame 16 { x: 48.6; y: 73.1; skew-x: 0.5; skew-y: 360.5; scale-x: 0.798; scale-y: -10000; }
        frame 17 { x: 49.9; y: 72.3; skew-x: -0.9; skew-y: 359; scale-x: -10000; }
        frame 18 { x: 51; y: 71.6; skew-x: -2.4; skew-y: 357.5; }
        frame 19 { x: 52.3; y: 71.1; skew-x: -4.2; skew-y: 355.7; }
        frame 20 { x: 53.1; y: 70.8; skew-x: -6.2; skew-y: 353.7; scale-y: 0.848; }
        frame 21 { x: 54; y: 70.7; skew-x: -8.4; skew-y: 351.5; scale-y: -10000; }
        frame 22 { x: 55; y: 70.5; skew-x: -10.7; skew-y: 349.2; scale-x: 0.797; }
        frame 23 { x: 55.9; y: -10000; skew-x: -13; skew-y: 346.9; scale-x: 0.798; }
        frame 24 { x: 56.1; y: 70.4; skew-x: -16.7; skew-y: 343.2; scale-x: 0.796; scale-y: 0.866; }
        frame 25 { x: 56.3; y: -10000; skew-x: -20.5; skew-y: 339.4; scale-x: -10000; scale-y: 0.885; }
        frame 26 { x: 56.4; skew-x: -24.3; skew-y: 335.6; scale-y: 0.904; }
        frame 27 { x: 53.9; y: 72.8; skew-x: -29.5; skew-y: 330.4; scale-x: 0.795; scale-y: 0.874; }
        frame 28 { x: 51.3; y: 75.3; skew-x: -34.6; skew-y: 325.3; scale-x: -10000; scale-y: 0.846; }
        frame 29 { x: 47.5; y: 78.1; skew-x: -29.5; skew-y: 330.4; scale-x: 0.793; scale-y: 0.844; }
        frame 30 { x: 43.8; y: 81.1; skew-x: -24.5; skew-y: 335.4; scale-x: 0.794; scale-y: -10000; }
        frame 31 { x: 42.8; y: 80.3; skew-x: -15.2; skew-y: 344.7; scale-x: 0.793; scale-y: 0.843; }
        frame 32 { x: 42; y: 79.6; skew-x: -6; skew-y: 353.9; scale-x: 0.794; scale-y: 0.844; }
        frame 33 { x: 41.9; y: 78.7; skew-x: -4.4; skew-y: 355.5; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 41.8; y: 77.8; skew-x: -2.8; skew-y: 357.1; }
        frame 35 { x: 42.5; y: 76.8; skew-x: -2; skew-y: 357.9; scale-x: 0.793; }
        frame 36 { x: 43; y: 75.8; skew-x: -1.4; skew-y: 358.5; scale-x: -10000; }
        frame 37 { x: 43.9; y: 74.6; skew-x: -0.7; skew-y: 359.2; scale-y: 0.843; }
        frame 38 { x: 44.5; y: 73.5; skew-x: 0; skew-y: 360; scale-y: -10000; }
        frame 39 { x: 45.1; y: 72.6; skew-x: 0.6; skew-y: 360.6; }
        frame 40 { x: 44.4; y: 72; skew-x: 2.3; skew-y: 362.3; scale-x: 0.792; }
        frame 41 { x: 43.6; y: 71.3; skew-x: 4.3; skew-y: 364.3; scale-x: -10000; scale-y: 0.842; }
        frame 42 { x: 43; y: 70.8; skew-x: 6.3; skew-y: 366.3; scale-x: 0.791; scale-y: -10000; }
        frame 43 { x: 42.1; y: 70.2; skew-x: 8.2; skew-y: 368.2; scale-x: -10000; }
        frame 44 { x: 40; y: 72.7; skew-x: 6; skew-y: 366; scale-y: 0.841; }
        frame 45 { x: 37.9; y: 75.5; skew-x: 3.8; skew-y: 363.8; scale-x: 0.79; scale-y: -10000; }
        frame 46 { x: 35.8; y: 78.1; skew-x: 1.8; skew-y: 361.8; scale-x: -10000; scale-y: 0.84; }
        frame 47 { x: 33; y: 82; skew-x: -0; skew-y: 359.9; scale-y: -10000; }
        frame 48 { x: 36.4; y: 81; skew-x: -2.1; skew-y: 357.8; }
        frame 49 { x: 38.5; y: 79.6; skew-x: -1.2; skew-y: 358.7; scale-x: 0.791; scale-y: 0.842; }
        frame 50 { x: 40.8; y: 78.2; skew-x: -0.2; skew-y: 359.7; scale-x: 0.793; scale-y: 0.844; }
        frame 51 { x: 42.8; y: 76.8; skew-x: 0.3; skew-y: 360.3; scale-x: 0.795; scale-y: 0.846; }
        frame 52 { x: 45; y: 75.5; skew-x: 1.3; skew-y: 361.3; scale-x: 0.797; scale-y: 0.847; }
        frame 53 { x: 47.4; y: 73.8; skew-x: 2.2; skew-y: 362.2; scale-x: 0.799; scale-y: 0.849; }
        frame 54 { x: 31.7; y: 74.2; skew-x: 59.6; skew-y: 400.6; scale-x: 0.842; scale-y: 0.954; }
        frame 55 { x: -10000; y: 73.7; skew-x: 58.9; skew-y: 399.9; scale-x: 0.84; scale-y: 0.972; }
        frame 56 { x: 31.8; y: 73.1; skew-x: 58.4; skew-y: 399.4; scale-x: -10000; scale-y: 0.99; }
        frame 57 { x: -10000; y: 72.6; skew-x: 57.7; skew-y: 398.6; scale-y: 1.009; }
        frame 58 { x: 31.9; y: 72; skew-x: 57.2; skew-y: 398.1; scale-y: 1.028; }
        frame 59 { x: -10000; y: 71.4; skew-x: 56.4; skew-y: 397.4; scale-x: 0.839; scale-y: 1.047; }
        frame 60 { y: 70.8; skew-x: 55.9; skew-y: 396.8; scale-x: 0.84; scale-y: 1.067; }
        frame 61 { x: 37; y: 77.3; skew-x: 71.7; skew-y: 412.6; scale-x: 0.838; scale-y: 1.012; }
        frame 62 { x: 40.9; y: 84.5; skew-x: 87.3; skew-y: 428.3; scale-x: -10000; scale-y: 0.96; }
        frame 63 { x: 40.3; y: 83; skew-x: 84.2; skew-y: 425.2; scale-y: 0.97; }
        frame 64 { x: 39.5; y: 81.6; skew-x: 81.2; skew-y: 421.9; scale-y: 0.98; }
        frame 65 { x: 38.6; y: 80.1; skew-x: 78; skew-y: 418.9; scale-y: 0.991; }
        frame 66 { x: 37.8; y: 78.6; skew-x: 74.7; skew-y: 415.7; scale-y: 1.001; }
        frame 67 { x: 37; y: 77.3; skew-x: 71.7; skew-y: 412.6; scale-y: 1.012; }
        frame 68 { x: 36; y: 75.8; skew-x: 68.5; skew-y: 409.4; scale-y: 1.023; }
        frame 69 { x: 35; y: 74.6; skew-x: 65.4; skew-y: 406.2; scale-x: 0.839; scale-y: 1.033; }
        frame 70 { x: 34; y: 73.3; skew-x: 62.2; skew-y: 403.1; scale-x: -10000; scale-y: 1.044; }
        frame 71 { x: 33; y: 72; skew-x: 58.9; skew-y: 399.9; scale-y: 1.055; }
        frame 72 { x: 31.9; y: 70.8; skew-x: 55.9; skew-y: 396.8; scale-x: 0.84; scale-y: 1.067; }
        frame 73 { x: 37; y: 77.3; skew-x: 71.7; skew-y: 412.6; scale-x: 0.838; scale-y: 1.012; }
        frame 74 { x: 40.9; y: 84.5; skew-x: 87.3; skew-y: 428.3; scale-x: -10000; scale-y: 0.96; }
        frame 75 { x: 38.1; y: 80.7; skew-x: 78.2; skew-y: 419.1; scale-x: 0.839; scale-y: 0.957; }
        frame 76 { x: 35; y: 77.3; skew-x: 68.9; skew-y: 409.9; scale-x: 0.84; scale-y: 0.955; }
        frame 77 { x: 31.7; y: 74.2; skew-x: 59.6; skew-y: 400.6; scale-x: 0.842; scale-y: 0.954; }
        frame 78 { x: 50; y: 57; skew-x: -25.8; skew-y: 339.9; scale-x: 0.801; scale-y: 0.848; }
        frame 79 { x: 47.8; skew-x: -16; skew-y: 346.7; scale-x: 0.797; scale-y: 0.846; }
        frame 80 { x: 45.7; y: 57.1; skew-x: -6.4; skew-y: 353.5; scale-x: 0.795; scale-y: 0.845; }
        frame 81 { x: 33.3; y: 50; skew-x: -17; skew-y: 342.9; scale-x: 0.793; scale-y: 0.843; }
        frame 82 { x: 42.5; y: 31.5; skew-x: -5.4; skew-y: 354.5; scale-x: 0.792; scale-y: -10000; }
        frame 83 { x: 51.9; y: 13.5; skew-x: 5.8; skew-y: 365.8; scale-x: -10000; scale-y: 0.842; }
        frame 84 { x: 61.5; y: -3.9; skew-x: 17.3; skew-y: 377.3; scale-y: -10000; }
        frame 85 { x: 62.7; y: -8.1; skew-x: 20.8; skew-y: 380.8; scale-x: 0.791; scale-y: 0.841; }
        frame 86 { x: 64; y: -12.4; skew-x: 24.6; skew-y: 384.6; scale-x: -10000; scale-y: 0.842; }
        frame 87 { x: 63.8; y: -12.8; skew-x: 23.3; skew-y: 383.3; scale-x: 0.79; scale-y: 0.841; }
        frame 88 { x: 63.5; y: -13.2; skew-x: 21.8; skew-y: 381.8; scale-x: -10000; scale-y: 0.84; }
        frame 89 { x: 63.3; y: -13.6; skew-x: 20.6; skew-y: 380.6; scale-y: -10000; }
        frame 90 { x: 63.1; y: -14; skew-x: 19.3; skew-y: 379.3; scale-x: 0.791; scale-y: 0.841; }
        frame 91 { x: 61.2; y: 11.5; skew-x: 4.8; skew-y: 364.8; scale-x: 0.789; scale-y: 0.839; }
        frame 92 { x: 59.5; y: 38; skew-x: -9.4; skew-y: 350.5; scale-x: 0.787; scale-y: 0.837; }
        frame 93 { x: 58.3; y: 65.3; skew-x: -24; skew-y: 335.9; scale-x: 0.786; scale-y: 0.836; }
        frame 94 { x: 63.4; y: 76.1; skew-x: 33.8; skew-y: 393.8; scale-x: 0.782; scale-y: 0.832; }
        frame 95 { x: 63.9; y: 92.1; skew-x: 42.9; skew-y: 402.9; scale-x: 0.783; scale-y: -10000; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; cel: -1; }
        frame 97 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_outerarm_hand";
        frame-count: 176;
        frame 0 { x: 50; y: 82.6; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_HAND; }
        frame 1 { x: 50.1; y: 82.3; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 50.2; y: 82.1; skew-x: -1.4; skew-y: -1.4; }
        frame 3 { x: 49.8; y: 82.8; skew-x: -2.2; skew-y: -2.2; }
        frame 4 { x: 49.4; y: 83.4; skew-x: -3; skew-y: -3; }
        frame 5 { x: 48.9; y: 84.2; skew-x: -3.9; skew-y: -3.9; }
        frame 6 { x: 48.5; y: 85; skew-x: -4.7; skew-y: -4.7; }
        frame 7 { x: 48; y: 85.7; skew-x: -5.7; skew-y: -5.7; }
        frame 8 { x: 47.6; y: 86.3; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 47.1; y: 86.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 47.9; y: 86; skew-x: -4.2; skew-y: -4.2; }
        frame 11 { x: 48.4; y: 85.1; skew-x: -3.2; skew-y: -3.2; }
        frame 12 { x: 49.1; y: 84.3; skew-x: -2; skew-y: -2; scale-x: 0.8; scale-y: 0.8; }
        frame 13 { x: 49.8; y: 83.4; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 50.5; y: 82.6; skew-x: 0; skew-y: 0; }
        frame 15 { x: 38; y: 93; skew-x: -4.2; skew-y: -4.2; }
        frame 16 { x: 40.1; y: 92.2; skew-x: -1.9; skew-y: -1.9; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: 42.1; y: 91.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 44.1; y: 90.4; skew-x: 2.3; skew-y: 2.3; }
        frame 19 { x: 46.3; y: 89.5; skew-x: 4.5; skew-y: 4.5; }
        frame 20 { x: 48.6; y: 88.3; skew-x: 7; skew-y: 7; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 50.8; y: 87.2; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 53.1; y: 86.1; skew-x: 12.1; skew-y: 12.1; scale-x: 0.797; scale-y: 0.797; }
        frame 23 { x: 55.3; y: 85; skew-x: 14.8; skew-y: 14.8; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 56; y: 86.1; skew-x: 7; skew-y: 7; scale-x: 0.797; scale-y: 0.797; }
        frame 25 { x: 57; y: 87.4; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 58; y: 88.9; skew-x: -7.9; skew-y: -7.9; scale-x: 0.796; scale-y: 0.796; }
        frame 27 { x: 56.9; y: 92.2; skew-x: -23.2; skew-y: -23.2; scale-x: 0.794; scale-y: 0.794; }
        frame 28 { x: 56.4; y: 95.8; skew-x: -38.8; skew-y: -38.8; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 50.8; y: 99.4; skew-x: -37.7; skew-y: -37.7; scale-x: 0.791; scale-y: 0.791; }
        frame 30 { x: 45.1; y: 103; skew-x: -36.6; skew-y: -36.6; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 40.8; y: 99.8; skew-x: -15.2; skew-y: -15.2; }
        frame 32 { x: 38; y: 97.8; skew-x: 5.9; skew-y: 5.9; scale-x: 0.792; scale-y: 0.792; }
        frame 33 { x: 37; y: 96.5; skew-x: 8.6; skew-y: 8.6; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 36.1; y: 95.3; skew-x: 11.5; skew-y: 11.5; }
        frame 35 { x: 36.5; y: 94.1; skew-x: 12; skew-y: 12; scale-x: 0.791; scale-y: 0.791; }
        frame 36 { x: 37; y: 93; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 37.5; y: 91.8; skew-x: 13.5; skew-y: 13.5; }
        frame 38 { x: 38; y: 90.7; skew-x: 14.3; skew-y: 14.3; }
        frame 39 { x: 38.4; y: 89.6; skew-x: 15; skew-y: 15; }
        frame 40 { x: 36.9; y: 89; skew-x: 13.8; skew-y: 13.8; scale-x: 0.79; scale-y: 0.79; }
        frame 41 { x: 35.4; y: 88.4; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 34; y: 87.8; skew-x: 11.8; skew-y: 11.8; scale-x: 0.789; scale-y: 0.789; }
        frame 43 { x: 32.5; y: 87.2; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 31.2; y: 90.1; skew-x: 9; skew-y: 9; scale-x: 0.788; scale-y: 0.788; }
        frame 45 { x: 29.7; y: 93.1; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 28.4; y: 96; skew-x: 5.8; skew-y: 5.8; }
        frame 47 { x: 26.2; y: 100.2; skew-x: 3.5; skew-y: 3.5; scale-x: 0.787; scale-y: 0.787; }
        frame 48 { x: 30.4; y: 99.7; skew-x: 1.9; skew-y: 1.9; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 31.8; y: 98.3; skew-x: 0.5; skew-y: 0.5; scale-x: 0.79; scale-y: 0.79; }
        frame 50 { x: 33.4; y: 97.1; skew-x: -0.4; skew-y: -0.4; scale-x: 0.792; scale-y: 0.792; }
        frame 51 { x: 34.9; y: 95.7; skew-x: -1.7; skew-y: -1.7; scale-x: 0.795; scale-y: 0.795; }
        frame 52 { x: 36.4; y: 94.3; skew-x: -2.9; skew-y: -2.9; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 38; y: 93; skew-x: -4.2; skew-y: -4.2; scale-x: 0.8; scale-y: 0.8; }
        frame 54 { x: -6.3; y: 91.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_HAND2; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; image: none; }
        frame 78 { x: 51.4; y: 82.7; skew-x: -50.3; skew-y: -50.3; scale-x: 0.798; scale-y: 0.798; image: IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_HAND; }
        frame 79 { x: 45; y: 77.8; skew-x: -22.9; skew-y: -22.9; scale-x: 0.795; scale-y: 0.795; image: none; }
        frame 80 { x: 41.4; y: 74.6; skew-x: 4.3; skew-y: 4.3; scale-x: 0.794; scale-y: 0.794; }
        frame 81 { x: 31.5; y: 68.2; skew-x: -10.9; skew-y: -10.9; scale-x: 0.792; scale-y: 0.792; }
        frame 82 { x: 36.6; y: 52.6; skew-x: -21; skew-y: -21; scale-x: 0.791; scale-y: 0.791; }
        frame 83 { x: 42.1; y: 37.1; skew-x: -31; skew-y: -31; scale-x: 0.79; scale-y: 0.79; }
        frame 84 { x: 48; y: 22.1; skew-x: -41.3; skew-y: -41.3; scale-x: 0.791; scale-y: 0.791; }
        frame 85 { x: 48.2; y: 17.8; skew-x: -10000; skew-y: -10000; scale-x: 0.79; scale-y: 0.79; }
        frame 86 { x: 48.3; y: 13.7; scale-x: 0.791; scale-y: 0.791; }
        frame 87 { x: 48.8; y: 14.1; skew-x: -44.3; skew-y: -44.3; scale-x: 0.789; scale-y: 0.789; }
        frame 88 { x: 49.1; y: 14.4; skew-x: -47.3; skew-y: -47.3; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 49.8; y: 14.5; skew-x: -50.1; skew-y: -50.1; }
        frame 90 { x: 50.3; y: 14.8; skew-x: -53.1; skew-y: -53.1; scale-x: 0.79; scale-y: 0.79; }
        frame 91 { x: 55.8; y: 41.8; skew-x: -67.6; skew-y: -67.6; scale-x: 0.788; scale-y: 0.788; }
        frame 92 { x: 62; y: 68.6; skew-x: -82.1; skew-y: -82.1; scale-x: 0.787; scale-y: 0.787; }
        frame 93 { x: 68.8; y: 95; skew-x: -96.4; skew-y: -96.4; scale-x: 0.786; scale-y: 0.786; }
        frame 94 { x: 49.9; y: 87.9; skew-x: 50.1; skew-y: 50.1; scale-x: 0.782; scale-y: 0.782; }
        frame 95 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 96 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_dolphinrider_outerarm_upper";
        frame-count: 176;
        frame 0 { x: 42.1; y: 48.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_UPPER; }
        frame 1 { x: 41.4; y: 49.3; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 40.5; y: 49.8; skew-x: -2.2; skew-y: -2.2; }
        frame 3 { x: 40; y: 49.9; skew-x: -1.4; skew-y: -1.4; }
        frame 4 { x: 39.5; y: 50; skew-x: -0.7; skew-y: -0.7; }
        frame 5 { x: 39; y: 50.1; skew-x: 0; skew-y: 0; }
        frame 6 { x: 38.6; y: 50.3; skew-x: 0.5; skew-y: 0.5; scale-x: 0.799; scale-y: 0.799; }
        frame 7 { x: 38.1; y: 50.4; skew-x: 1.2; skew-y: 1.2; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 38.3; y: 50.3; skew-x: 3; skew-y: 3; }
        frame 9 { x: 38.6; y: 50.1; skew-x: 4.8; skew-y: 4.8; }
        frame 10 { x: 39.4; y: 49.9; skew-x: 3.8; skew-y: 3.8; }
        frame 11 { x: 40; y: 49.6; skew-x: 2.8; skew-y: 2.8; }
        frame 12 { x: 40.8; y: 49.3; skew-x: 1.8; skew-y: 1.8; }
        frame 13 { x: 41.4; y: 49; skew-x: 0.8; skew-y: 0.8; scale-x: 0.8; scale-y: 0.8; }
        frame 14 { x: 42.1; y: 48.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 49.8; y: 50.5; skew-x: 42.1; skew-y: 42.1; scale-x: 0.797; scale-y: 0.797; }
        frame 16 { x: 49.6; y: 50; skew-x: 38.9; skew-y: 38.9; scale-x: 0.796; scale-y: 0.796; }
        frame 17 { x: 49.5; y: 49.6; skew-x: 35.8; skew-y: 35.8; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 49.4; y: 49.2; skew-x: 32.6; skew-y: 32.6; }
        frame 19 { x: 49.5; y: 48.8; skew-x: 29.6; skew-y: 29.6; scale-x: 0.797; scale-y: 0.797; }
        frame 20 { x: 50.3; y: 48.3; skew-x: 29.3; skew-y: 29.3; scale-x: 0.796; scale-y: 0.796; }
        frame 21 { x: 51.1; y: 47.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 52; y: 47.3; skew-x: 29.1; skew-y: 29.1; }
        frame 23 { x: 53; y: 46.8; skew-x: 29; skew-y: 29; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: 53.8; y: -10000; skew-x: 29.3; skew-y: 29.3; scale-x: 0.796; scale-y: 0.796; }
        frame 25 { x: 54.5; skew-x: 29.6; skew-y: 29.6; scale-x: 0.795; scale-y: 0.795; }
        frame 26 { x: 55.2; y: 46.6; skew-x: 30; skew-y: 30; scale-x: 0.796; scale-y: 0.796; }
        frame 27 { x: 50.8; y: 49; skew-x: 26.1; skew-y: 26.1; scale-x: 0.795; scale-y: 0.795; }
        frame 28 { x: 46.5; y: 51.4; skew-x: 22.2; skew-y: 22.2; scale-x: 0.796; scale-y: 0.796; }
        frame 29 { x: 43; y: 54.8; skew-x: 22.8; skew-y: 22.8; scale-x: 0.794; scale-y: 0.794; }
        frame 30 { x: 39.5; y: 58; skew-x: 23.5; skew-y: 23.5; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 40.5; y: 57.1; skew-x: 28.8; skew-y: 28.8; }
        frame 32 { x: 41.2; y: 56.4; skew-x: 34.3; skew-y: 34.3; scale-x: 0.796; scale-y: 0.796; }
        frame 33 { x: 42.4; y: 55.5; skew-x: 37.1; skew-y: 37.1; scale-x: 0.794; scale-y: 0.794; }
        frame 34 { x: 43.4; y: 54.4; skew-x: 39.8; skew-y: 39.8; scale-x: 0.795; scale-y: 0.795; }
        frame 35 { x: 45; y: 53.4; skew-x: 41.9; skew-y: 41.9; scale-x: 0.794; scale-y: 0.794; }
        frame 36 { x: 46.6; y: 52.4; skew-x: 44.1; skew-y: 44.1; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 48.4; y: 51.4; skew-x: 46.4; skew-y: 46.4; }
        frame 38 { x: 50; y: 50.4; skew-x: 48.6; skew-y: 48.6; }
        frame 39 { x: 51.7; y: 49.4; skew-x: 50.8; skew-y: 50.8; scale-x: 0.795; scale-y: 0.795; }
        frame 40 { x: 53.4; y: 49.5; skew-x: 55.7; skew-y: 55.7; scale-x: 0.793; scale-y: 0.793; }
        frame 41 { x: 55.1; y: -10000; skew-x: 60.7; skew-y: 60.7; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 56.8; y: 49.8; skew-x: 65.7; skew-y: 65.7; }
        frame 43 { x: 58.5; y: 50; skew-x: 70.5; skew-y: 70.5; scale-x: 0.794; scale-y: 0.794; }
        frame 44 { x: 54.3; y: 51.7; skew-x: 66.2; skew-y: 66.2; scale-x: 0.792; scale-y: 0.792; }
        frame 45 { x: 50; y: 53.6; skew-x: 61.9; skew-y: 61.9; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 45.9; y: 55.6; skew-x: 57.7; skew-y: 57.7; }
        frame 47 { x: 41.1; y: 58.9; skew-x: 53.4; skew-y: 53.4; scale-x: 0.791; scale-y: 0.791; }
        frame 48 { x: 42.2; y: 57.3; skew-x: 49; skew-y: 49; scale-x: 0.793; scale-y: 0.793; }
        frame 49 { x: 43.6; y: 55.9; skew-x: 47.6; skew-y: 47.6; scale-x: 0.792; scale-y: 0.792; }
        frame 50 { x: 45.1; y: 54.5; skew-x: 46.1; skew-y: 46.1; scale-x: 0.793; scale-y: 0.793; }
        frame 51 { x: 46.6; y: 53.1; skew-x: 44.9; skew-y: 44.9; scale-x: 0.794; scale-y: 0.794; }
        frame 52 { x: 48.1; y: 51.7; skew-x: 43.4; skew-y: 43.4; scale-x: 0.795; scale-y: 0.795; }
        frame 53 { x: 49.8; y: 50.5; skew-x: 42.1; skew-y: 42.1; scale-x: 0.797; scale-y: 0.797; }
        frame 54 { x: 43.7; y: 54.2; skew-x: 80.1; skew-y: 72.9; scale-x: 0.94; scale-y: 0.801; }
        frame 55 { x: 44.5; y: 54; skew-x: 81.5; skew-y: 74.2; scale-x: 0.939; scale-y: 0.8; }
        frame 56 { x: 45.2; skew-x: 82.9; skew-y: 75.7; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 45.9; y: 53.9; skew-x: 84.2; skew-y: 77; }
        frame 58 { x: 46.6; y: 53.8; skew-x: 85.7; skew-y: 78.4; scale-y: 0.799; }
        frame 59 { x: 47.4; y: 53.6; skew-x: 87; skew-y: 79.7; scale-y: -10000; }
        frame 60 { x: 48; y: 53.5; skew-x: 88.2; skew-y: 81; scale-y: 0.8; }
        frame 61 { x: 41.5; y: 56.6; skew-x: 70.9; skew-y: 65.2; scale-x: 0.912; scale-y: 0.795; }
        frame 62 { x: 34.8; y: 61.3; skew-x: 53.4; skew-y: 49.5; scale-x: 0.887; scale-y: 0.793; }
        frame 63 { x: 36.1; y: 60.4; skew-x: 56.9; skew-y: 52.7; scale-x: 0.891; scale-y: -10000; }
        frame 64 { x: 37.4; y: 59.4; skew-x: 60.4; skew-y: 55.9; scale-x: 0.896; }
        frame 65 { x: 38.8; y: 58.5; skew-x: 63.9; skew-y: 58.9; scale-x: 0.902; scale-y: 0.794; }
        frame 66 { x: 40.1; y: 57.5; skew-x: 67.4; skew-y: 62.2; scale-x: 0.907; scale-y: 0.795; }
        frame 67 { x: 41.5; y: 56.8; skew-x: 70.9; skew-y: 65.2; scale-x: 0.912; scale-y: -10000; }
        frame 68 { x: 42.8; y: 56; skew-x: 74.4; skew-y: 68.4; scale-x: 0.918; scale-y: 0.796; }
        frame 69 { x: 44.1; y: 55.4; skew-x: 77.9; skew-y: 71.7; scale-x: 0.923; scale-y: 0.797; }
        frame 70 { x: 45.4; y: 54.8; skew-x: 81.2; skew-y: 74.7; scale-x: 0.928; scale-y: 0.798; }
        frame 71 { x: 46.8; y: 54.3; skew-x: 84.7; skew-y: 77.9; scale-x: 0.934; scale-y: -10000; }
        frame 72 { x: 48; y: 53.5; skew-x: 88.2; skew-y: 81; scale-x: 0.939; scale-y: 0.8; }
        frame 73 { x: 41.5; y: 56.6; skew-x: 70.9; skew-y: 65.2; scale-x: 0.912; scale-y: 0.795; }
        frame 74 { x: 34.8; y: 61.3; skew-x: 53.4; skew-y: 49.5; scale-x: 0.887; scale-y: 0.793; }
        frame 75 { x: 37.8; y: 58.6; skew-x: 62.4; skew-y: 57.4; scale-x: 0.904; scale-y: 0.795; }
        frame 76 { x: 40.7; y: 56.3; skew-x: 71.2; skew-y: 65.2; scale-x: 0.921; scale-y: 0.797; }
        frame 77 { x: 43.7; y: 54.2; skew-x: 80.1; skew-y: 72.9; scale-x: 0.94; scale-y: 0.801; }
        frame 78 { x: 30.1; y: 65.4; skew-x: -55.4; skew-y: -55.4; scale-x: 0.798; scale-y: 0.798; }
        frame 79 { x: 29; y: 53.2; skew-x: -27.2; skew-y: -27.2; scale-x: 0.796; scale-y: 0.796; }
        frame 80 { x: 31.3; y: 42; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 33; y: 24.6; skew-x: 33.3; skew-y: 33.3; scale-x: 0.795; scale-y: 0.795; }
        frame 82 { x: 34.5; y: 12.1; skew-x: 17; skew-y: 17; scale-x: 0.804; scale-y: 0.794; }
        frame 83 { x: 36.6; y: 0.8; skew-x: 0.6; skew-y: 0.6; scale-x: 0.814; scale-y: 0.793; }
        frame 84 { x: 39.7; y: -9.4; skew-x: -15.4; skew-y: -15.4; scale-x: 0.823; scale-y: -10000; }
        frame 85 { x: 39.8; y: -11; skew-x: -19.2; skew-y: -19.2; scale-x: 0.846; scale-y: 0.792; }
        frame 86 { x: -10000; y: -12.6; skew-x: -23; skew-y: -23; scale-x: 0.87; scale-y: -10000; }
        frame 87 { x: 39.5; y: -11.5; skew-x: -27.2; skew-y: -27.2; scale-x: 0.849; scale-y: 0.791; }
        frame 88 { x: 39.4; y: -10.6; skew-x: -31.2; skew-y: -31.2; scale-x: 0.83; scale-y: -10000; }
        frame 89 { x: 39.3; y: -9.7; skew-x: -35.5; skew-y: -35.5; scale-x: 0.81; }
        frame 90 { x: 39.2; y: -8.8; skew-x: -39.6; skew-y: -39.6; scale-x: 0.792; scale-y: 0.792; }
        frame 91 { x: 38.9; y: 18.1; skew-x: -43.3; skew-y: -43.3; scale-x: 0.789; scale-y: 0.789; }
        frame 92 { x: 38.7; y: 45; skew-x: -47; skew-y: -47; scale-x: 0.788; scale-y: 0.788; }
        frame 93 { x: 38.5; y: 71.9; skew-x: -50.6; skew-y: -50.6; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 41.1; y: 73.7; skew-x: -19.4; skew-y: -19.4; scale-x: 0.787; scale-y: 0.787; }
        frame 95 { x: 47.9; y: 77.3; skew-x: 11.5; skew-y: 11.5; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 48.8; y: 75.7; skew-x: 18.8; skew-y: 18.8; scale-x: 0.786; scale-y: 0.786; }
        frame 97 { x: 49.7; y: 74.3; skew-x: 26; skew-y: 26; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 50.1; y: 74.1; skew-x: 27.1; skew-y: 27.1; scale-x: 0.784; scale-y: 0.784; }
        frame 99 { x: 50.6; y: 73.8; skew-x: 28.3; skew-y: 28.3; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 51; y: 73.6; skew-x: 29.6; skew-y: 29.6; scale-x: 0.783; scale-y: 0.783; }
        frame 101 { x: 51.4; y: 73.3; skew-x: 30.7; skew-y: 30.7; scale-x: 0.784; scale-y: 0.784; }
        frame 102 { x: 49.8; y: 50.5; skew-x: 42.1; skew-y: 42.1; scale-x: 0.797; scale-y: 0.797; }
        frame 103 { x: 53.6; y: 52; skew-x: 47.7; skew-y: 47.7; scale-x: 0.796; scale-y: 0.796; }
        frame 104 { x: 57.5; y: 53.6; skew-x: 53.4; skew-y: 53.4; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 61.3; y: 55.3; skew-x: 58.9; skew-y: 58.9; scale-x: 0.797; scale-y: 0.797; }
        frame 106 { x: 60.9; y: 59.9; skew-x: 56.2; skew-y: 56.2; scale-x: 0.795; scale-y: 0.795; }
        frame 107 { x: 60.6; y: 64.5; skew-x: 53.6; skew-y: 53.6; scale-x: 0.794; scale-y: 0.794; }
        frame 108 { x: 60.4; y: 69; skew-x: 50.9; skew-y: 50.9; scale-x: 0.795; scale-y: 0.795; }
        frame 109 { x: 57; y: 74.2; skew-x: 49.4; skew-y: -10000; scale-x: 0.794; scale-y: 0.796; }
        frame 110 { x: 53.8; y: 79.5; skew-x: 48.1; scale-x: 0.793; scale-y: 0.799; }
        frame 111 { x: 50.5; y: 84.8; skew-x: 46.7; scale-x: 0.794; scale-y: 0.802; }
        frame 112 { x: -10000; y: 82.9; skew-x: 47.7; skew-y: 49.9; scale-x: 0.792; scale-y: 0.796; }
        frame 113 { y: 81.1; skew-x: 48.8; skew-y: 48.8; scale-x: 0.793; scale-y: 0.793; }
        frame 114 { x: 54.5; y: 82.3; skew-x: 57.9; skew-y: 57.9; scale-x: 0.792; scale-y: 0.792; }
        frame 115 { x: 58.5; y: 84; skew-x: 67.1; skew-y: 67.1; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 63.1; skew-x: 72.9; skew-y: 72.9; scale-x: 0.791; scale-y: 0.791; }
        frame 117 { x: 67.8; y: 84.2; skew-x: 78.7; skew-y: 78.7; scale-x: 0.79; scale-y: 0.79; }
        frame 118 { x: 72.3; y: 84.5; skew-x: 84.2; skew-y: 84.2; scale-x: 0.789; scale-y: 0.789; }
        frame 119 { x: 76.9; y: 85.1; skew-x: 89.9; skew-y: 89.9; scale-x: 0.788; scale-y: 0.788; }
        frame 120 { x: 85.8; y: 90; skew-x: 107.3; skew-y: 107.3; scale-x: 0.787; scale-y: 0.787; }
        frame 121 { x: 93.3; y: 95.6; skew-x: 124.6; skew-y: 124.6; scale-x: 0.786; scale-y: 0.786; }
        frame 122 { x: 99.6; y: 101.6; skew-x: 142; skew-y: 142; scale-x: -10000; scale-y: -10000; }
        frame 123 { x: 104.4; y: 107.5; skew-x: 145.4; skew-y: 145.4; scale-x: 0.784; scale-y: 0.784; }
        frame 124 { x: 109.4; y: 113.5; skew-x: 148.7; skew-y: 148.7; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: 114.1; y: 119.4; skew-x: 152.2; skew-y: 152.2; }
        frame 126 { x: 119; y: 125.3; skew-x: 155.5; skew-y: 155.5; scale-x: 0.783; scale-y: 0.783; }
        frame 127 { x: 123.7; y: 131.3; skew-x: 158.8; skew-y: 158.8; scale-x: 0.784; scale-y: 0.784; }
        frame 128 { x: 124.4; y: 131.4; skew-x: 143.9; skew-y: 140.6; scale-x: 0.769; scale-y: -10000; }
        frame 129 { x: 123.8; y: 131; skew-x: 128.9; skew-y: 122.2; scale-x: 0.755; scale-y: 0.786; }
        frame 130 { x: 123.7; y: 128.1; skew-x: 124.1; skew-y: 117.3; scale-x: 0.754; scale-y: 0.785; }
        frame 131 { x: 123.6; y: 125.2; skew-x: 119.3; skew-y: 112.6; scale-x: 0.755; scale-y: 0.786; }
        frame 132 { x: 123.7; y: 127.1; skew-x: 123.6; skew-y: 116.8; scale-x: 0.753; scale-y: 0.784; }
        frame 133 { x: 123.8; y: 129.1; skew-x: 128.1; skew-y: 121.4; scale-x: 0.754; scale-y: 0.785; }
        frame 134 { x: 46.4; y: 49.2; skew-x: 20.5; skew-y: 20.5; scale-x: 0.775; scale-y: 0.775; }
        frame 135 { x: 47.3; y: 49.1; skew-x: 22.3; skew-y: 22.3; scale-x: 0.774; scale-y: 0.774; }
        frame 136 { x: 48.1; y: 49; skew-x: 24.1; skew-y: 24.1; scale-x: 0.773; scale-y: 0.773; }
        frame 137 { x: 49.1; y: 48.9; skew-x: 26.1; skew-y: 26.1; scale-x: -10000; scale-y: -10000; }
        frame 138 { x: 50.1; y: 48.8; skew-x: 27.8; skew-y: 27.8; }
        frame 139 { x: 51; y: 48.6; skew-x: 29.8; skew-y: 29.8; }
        frame 140 { x: 51.9; y: -10000; skew-x: 31.6; skew-y: 31.6; }
        frame 141 { x: 52.9; y: 48.5; skew-x: 33.6; skew-y: 33.6; scale-x: 0.772; scale-y: 0.772; }
        frame 142 { x: 53.8; y: -10000; skew-x: 35.4; skew-y: 35.4; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 54.7; skew-x: 37.3; skew-y: 37.3; scale-x: 0.773; scale-y: 0.773; }
        frame 144 { x: 55.6; skew-x: 39.1; skew-y: 39.1; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 56.6; skew-x: 41.1; skew-y: 41.1; scale-x: 0.774; scale-y: 0.774; }
        frame 146 { x: 54; y: 49.1; skew-x: 50.9; skew-y: 50.9; scale-x: 0.772; scale-y: 0.772; }
        frame 147 { x: 51.5; y: 50.2; skew-x: 60.7; skew-y: 60.7; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 49; y: 51.5; skew-x: 70.4; skew-y: 70.4; scale-x: 0.771; scale-y: 0.771; }
        frame 149 { x: 46.1; y: 53.2; skew-x: 80; skew-y: 80; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 45.4; y: 53.6; skew-x: 79.7; skew-y: 79.7; }
        frame 151 { x: 44.7; y: 54; skew-x: 79.3; skew-y: 79.3; }
        frame 152 { x: 45.4; y: 52.9; skew-x: 71.5; skew-y: 71.5; scale-x: 0.77; scale-y: 0.77; }
        frame 153 { x: 45.9; y: 52.1; skew-x: 63.5; skew-y: 63.5; scale-x: 0.771; scale-y: 0.771; }
        frame 154 { x: 46.4; y: 51.5; skew-x: 55.6; skew-y: 55.6; scale-x: -10000; scale-y: -10000; }
        frame 155 { x: 46.9; y: 51.1; skew-x: 47.7; skew-y: 47.7; scale-x: 0.772; scale-y: 0.772; }
        frame 156 { x: 46.6; y: 50.1; skew-x: 38.6; skew-y: 38.6; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 46.5; y: 49.5; skew-x: 29.6; skew-y: 29.6; scale-x: 0.773; scale-y: 0.773; }
        frame 158 { x: 46.4; y: 49.2; skew-x: 20.5; skew-y: 20.5; scale-x: 0.775; scale-y: 0.775; }
        frame 159 { x: 47.5; y: 49; skew-x: 20.3; skew-y: 20.3; scale-x: 0.774; scale-y: 0.774; }
        frame 160 { x: 48.6; y: 48.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 49.8; y: 48.5; }
        frame 162 { x: 51; y: 48.4; }
        frame 163 { x: 52.1; y: 48.1; }
        frame 164 { x: 53.4; y: 47.9; }
        frame 165 { x: 54.5; y: 47.6; skew-x: 20.5; skew-y: 20.5; scale-x: 0.775; scale-y: 0.775; }
        frame 166 { x: 50.9; y: 48.6; skew-x: 15.3; skew-y: 15.3; scale-x: 0.774; scale-y: 0.774; }
        frame 167 { x: 47.4; y: 49.7; skew-x: 10.1; skew-y: 10.1; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 44; y: 50.9; skew-x: 5; skew-y: 5; }
        frame 169 { x: 40.5; y: 52.1; skew-x: 0; skew-y: 0; }
        frame 170 { x: 41.5; y: 51.5; skew-x: 3.3; skew-y: 3.3; }
        frame 171 { x: 42.3; y: 50.9; skew-x: 6.8; skew-y: 6.8; }
        frame 172 { x: 43.3; y: 50.5; skew-x: 10.1; skew-y: 10.1; }
        frame 173 { x: 44.3; y: 50; skew-x: 13.5; skew-y: 13.5; }
        frame 174 { x: 45.3; y: 49.5; skew-x: 17; skew-y: 17; }
        frame 175 { x: 46.4; y: 49.2; skew-x: 20.5; skew-y: 20.5; scale-x: 0.775; scale-y: 0.775; }
    }
}
