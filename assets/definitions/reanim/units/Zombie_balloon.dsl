export component Zombie_balloon {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 155;
        frame 13 { cel: -1; }
        frame 14 { cel: -10000; }
    }
    Track {
        source-name: "anim_swing";
        frame-count: 155;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { cel: 0; }
        frame 14 { cel: -10000; }
        frame 31 { cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "anim_pop";
        frame-count: 155;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 31 { cel: 0; }
        frame 32 { cel: -10000; }
        frame 59 { cel: -1; }
        frame 60 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 155;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 59 { cel: 0; }
        frame 60 { cel: -10000; }
        frame 84 { cel: -1; }
        frame 85 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 155;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 84 { cel: 0; }
        frame 85 { cel: -10000; }
        frame 125 { cel: -1; }
        frame 126 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 155;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 125 { cel: 0; }
        frame 126 { cel: -10000; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 155;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 84 { x: -9.8; y: 40; cel: 0; }
        frame 85 { x: -8.3; y: -10000; cel: -10000; }
        frame 86 { x: -6.8; }
        frame 87 { x: -5.4; }
        frame 88 { x: -3.9; }
        frame 89 { x: -2.6; }
        frame 90 { x: -1.4; }
        frame 91 { x: -0.1; }
        frame 92 { x: 1; }
        frame 93 { x: 2; }
        frame 94 { x: 3.2; }
        frame 95 { x: 4.3; }
        frame 96 { x: 5.4; }
        frame 97 { x: 7.3; }
        frame 98 { x: 9.2; }
        frame 99 { x: 11.1; }
        frame 100 { x: 13; }
        frame 101 { x: -10000; }
        frame 102 { x: 13.1; }
        frame 103 { x: -10000; }
        frame 105 { x: 14.8; }
        frame 106 { x: 16.5; }
        frame 107 { x: 18.2; }
        frame 108 { x: 20; }
        frame 109 { x: 21.7; }
        frame 110 { x: 23.4; }
        frame 111 { x: 25.1; }
        frame 112 { x: 26.8; }
        frame 113 { x: 27.7; }
        frame 114 { x: 28.5; }
        frame 115 { x: 29.3; }
        frame 116 { x: 30.1; }
        frame 117 { x: 32.6; }
        frame 118 { x: 35.1; }
        frame 119 { x: 37.5; }
        frame 120 { x: 40; }
        frame 121 { x: -10000; }
        frame 122 { x: 40.1; }
        frame 123 { x: -10000; }
        frame 125 { cel: -1; }
        frame 126 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_innerleg_lower";
        frame-count: 155;
        frame 0 { x: 36.5; y: 73.7; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_INNERLEG_LOWER; }
        frame 1 { x: 37.2; y: 74.8; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 37.9; y: 76.1; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: 38.5; y: 77.3; skew-x: -8.6; skew-y: -8.6; scale-x: 0.8; scale-y: 0.8; }
        frame 4 { x: 37.8; y: 79.1; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 5 { x: 37.1; y: 80.6; skew-x: -2.7; skew-y: -2.7; scale-x: 0.8; scale-y: 0.8; }
        frame 6 { x: 36.5; y: 82.2; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 36.3; y: 81.6; skew-x: 0.3; skew-y: 0.3; }
        frame 8 { x: 36; y: 80.9; skew-x: 0.8; skew-y: 0.8; }
        frame 9 { x: 35.8; y: 80.3; skew-x: 1.3; skew-y: 1.3; }
        frame 10 { x: 36; y: 78.1; skew-x: 0.8; skew-y: 0.8; }
        frame 11 { x: 36.3; y: 75.9; skew-x: 0.3; skew-y: 0.3; }
        frame 12 { x: 36.5; y: 73.7; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: 36.6; y: 73.9; skew-x: -1.4; skew-y: -1.4; }
        frame 15 { x: -10000; y: 74.2; skew-x: -2.9; skew-y: -2.9; }
        frame 16 { x: 36.8; y: 74.3; skew-x: -4.4; skew-y: -4.4; }
        frame 17 { x: -10000; y: 74.7; skew-x: -5.9; skew-y: -5.9; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 37; y: 74.8; skew-x: -7.4; skew-y: -7.4; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 75.1; skew-x: -8.9; skew-y: -8.9; }
        frame 20 { x: 37.1; y: 75.3; skew-x: -10.5; skew-y: -10.5; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: 27.6; y: 73.6; skew-x: -1.7; skew-y: -1.7; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 18.1; y: 72.4; skew-x: 6.6; skew-y: 6.6; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 9; y: 71.2; skew-x: 15.3; skew-y: 15.3; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 0; y: 70.6; skew-x: 24; skew-y: 24; scale-x: 0.799; scale-y: 0.799; }
        frame 25 { x: 6.3; y: 71.1; skew-x: 11.3; skew-y: 11.3; scale-x: 0.786; scale-y: -10000; }
        frame 26 { x: 13; y: 72; skew-x: -0.9; skew-y: -0.9; scale-x: 0.774; }
        frame 27 { x: 20.3; y: 73.5; skew-x: -13.5; skew-y: -13.5; scale-x: 0.762; }
        frame 28 { x: 17.1; y: -10000; skew-x: -8.9; skew-y: -8.9; scale-x: 0.774; }
        frame 29 { x: 14.1; y: 73.6; skew-x: -4.4; skew-y: -4.4; scale-x: 0.787; scale-y: 0.8; }
        frame 30 { x: 11; y: 73.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: -10000; }
        frame 31 { x: 36.5; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 32 { x: -10000; }
        frame 33 { x: 36.3; y: 82.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 36.1; y: 90.6; skew-x: 14.9; skew-y: 14.9; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 35.4; y: 94.6; skew-x: 12.1; skew-y: 12.1; scale-x: 0.78; scale-y: 0.86; }
        frame 36 { x: 34.5; y: 98.7; skew-x: 9.6; skew-y: 9.6; scale-x: 0.762; scale-y: 0.922; }
        frame 37 { x: 29.8; y: 102.8; skew-x: -6.9; skew-y: -6.9; scale-x: 0.761; scale-y: 0.921; }
        frame 38 { x: 29.9; y: 102.5; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 30.1; y: 102.1; skew-x: -5.4; skew-y: -5.4; }
        frame 40 { x: -10000; y: 101.8; skew-x: -4.7; skew-y: -4.7; }
        frame 41 { x: 30.2; y: 101.4; skew-x: -3.9; skew-y: -3.9; }
        frame 42 { x: 30.3; y: 101.2; skew-x: -3.2; skew-y: -3.2; }
        frame 43 { x: 30.4; y: 100.8; skew-x: -2.5; skew-y: -2.5; }
        frame 44 { x: 30.5; y: 100.6; skew-x: -1.7; skew-y: -1.7; }
        frame 45 { x: 30.6; y: 100.2; skew-x: -1.2; skew-y: -1.2; }
        frame 46 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 47 { x: 31.8; y: 97.6; skew-x: 3; skew-y: 3; scale-x: 0.76; scale-y: 0.958; }
        frame 48 { x: 33.4; y: 94.9; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: 0.995; }
        frame 49 { x: 33.3; y: 95.3; skew-x: 7.3; skew-y: 7.3; scale-y: 0.983; }
        frame 50 { x: 33.4; y: 96; skew-x: 6.8; skew-y: 6.8; scale-y: 0.97; }
        frame 51 { x: -10000; y: 96.5; skew-x: 6.5; skew-y: 6.5; scale-y: 0.958; }
        frame 52 { y: 96.8; skew-x: 6.3; skew-y: 6.3; scale-x: 0.761; scale-y: 0.946; }
        frame 53 { y: 97.5; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: 0.934; }
        frame 54 { x: 33.3; y: 98.2; skew-x: 5.8; skew-y: 5.8; scale-y: 0.922; }
        frame 55 { x: 32.6; y: 98.6; skew-x: 3.8; skew-y: 3.8; scale-y: -10000; }
        frame 56 { x: 32; y: 98.8; skew-x: 1.7; skew-y: 1.7; }
        frame 57 { x: 32.6; y: 98.6; skew-x: 3.8; skew-y: 3.8; }
        frame 58 { x: 33.3; y: 98.2; skew-x: 5.8; skew-y: 5.8; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 63 { x: 32.9; y: 98.5; skew-x: 4.3; skew-y: 4.3; }
        frame 64 { x: 32.4; y: 98.8; skew-x: 2.8; skew-y: 2.8; }
        frame 65 { x: 32; y: 98.9; skew-x: 1.5; skew-y: 1.5; }
        frame 66 { x: 31.2; y: 99.5; skew-x: -1.2; skew-y: -1.2; }
        frame 67 { x: 30.4; y: 100; skew-x: -3.9; skew-y: -3.9; scale-y: 0.921; }
        frame 68 { x: 29.7; y: 100.6; skew-x: -6.9; skew-y: -6.9; scale-y: -10000; }
        frame 69 { x: 30.9; y: 99.8; skew-x: -2.5; skew-y: -2.5; }
        frame 70 { x: 32; y: 99; skew-x: 1.5; skew-y: 1.5; scale-y: 0.922; }
        frame 71 { x: 33.3; y: 98.2; skew-x: 5.8; skew-y: 5.8; scale-y: -10000; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 75 { x: 32.9; y: 98.5; skew-x: 4.3; skew-y: 4.3; }
        frame 76 { x: 32.4; y: 98.8; skew-x: 2.8; skew-y: 2.8; }
        frame 77 { x: 32; y: 98.9; skew-x: 1.5; skew-y: 1.5; }
        frame 78 { x: 31.2; y: 99.5; skew-x: -1.2; skew-y: -1.2; }
        frame 79 { x: 30.4; y: 100; skew-x: -3.9; skew-y: -3.9; scale-y: 0.921; }
        frame 80 { x: 29.7; y: 100.6; skew-x: -6.9; skew-y: -6.9; scale-y: -10000; }
        frame 81 { x: 30.9; y: 99.8; skew-x: -2.5; skew-y: -2.5; }
        frame 82 { x: 32; y: 99; skew-x: 1.5; skew-y: 1.5; scale-y: 0.922; }
        frame 83 { x: 33.3; y: 98.2; skew-x: 5.8; skew-y: 5.8; scale-y: -10000; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 85 { x: 33.9; y: 98.5; skew-x: 2.8; skew-y: 2.8; }
        frame 86 { x: 34.6; y: 98.8; skew-x: -0; skew-y: -0; }
        frame 87 { x: 35.4; y: 99.1; skew-x: -3; skew-y: -3; scale-y: 0.921; }
        frame 88 { x: 36; y: 99.6; skew-x: -6.2; skew-y: -6.2; scale-y: -10000; }
        frame 89 { x: 37.8; y: -10000; skew-x: -4.4; skew-y: -4.4; scale-x: 0.76; scale-y: 0.92; }
        frame 90 { x: 39.6; y: 99.5; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 41.4; y: 99.4; skew-x: -1.4; skew-y: -1.4; scale-x: 0.759; scale-y: 0.919; }
        frame 92 { x: 43.1; y: 99.3; skew-x: 0.1; skew-y: 0.1; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 44.4; y: 99.1; skew-x: 0.8; skew-y: 0.8; scale-x: 0.758; scale-y: 0.918; }
        frame 94 { x: 45.8; y: 98.8; skew-x: 1.8; skew-y: 1.8; scale-x: 0.757; scale-y: 0.917; }
        frame 95 { x: 47; y: -10000; skew-x: 2.5; skew-y: 2.5; scale-x: 0.756; scale-y: 0.916; }
        frame 96 { x: 48.5; y: 98.6; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: 0.915; }
        frame 97 { x: -10000; y: 98.8; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 98 { x: 48.8; y: 99; skew-x: -3.7; skew-y: -3.7; }
        frame 99 { x: 48.9; y: 99.4; skew-x: -7.4; skew-y: -7.4; scale-x: 0.755; }
        frame 100 { x: 49.2; y: 99.7; skew-x: -11.1; skew-y: -11.1; scale-x: 0.756; }
        frame 101 { x: 48; y: 101.2; skew-x: -18; skew-y: -18; scale-x: 0.755; scale-y: 0.944; }
        frame 102 { x: 46.8; y: 102.8; skew-x: -25; skew-y: -25; scale-x: -10000; scale-y: 0.973; }
        frame 103 { x: 45.8; y: 104.7; skew-x: -32; skew-y: -32; scale-y: 1.003; }
        frame 104 { x: 44.9; y: 106.6; skew-x: -39.1; skew-y: -39.1; scale-x: 0.756; scale-y: 1.034; }
        frame 105 { x: 43.9; y: 104.6; skew-x: -35; skew-y: -35.3; scale-x: 0.755; scale-y: 1.033; }
        frame 106 { x: 43.1; y: 102.6; skew-x: -31; skew-y: -31.5; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 42.2; y: 100.7; skew-x: -27.2; skew-y: -27.9; }
        frame 108 { x: 41.4; y: 98.7; skew-x: -23.2; skew-y: -24.2; scale-x: 0.756; scale-y: 1.034; }
        frame 109 { x: 39.8; y: 98.4; skew-x: -22.4; skew-y: -23.4; scale-x: 0.754; scale-y: 1.032; }
        frame 110 { x: 38.3; y: 98.3; skew-x: -21.7; skew-y: -22.7; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 36.6; y: 98.1; skew-x: -20.9; skew-y: -22; scale-x: 0.753; scale-y: 1.031; }
        frame 112 { x: 34.9; y: 97.8; skew-x: -20.2; skew-y: -21.3; scale-x: 0.754; scale-y: -10000; }
        frame 113 { x: 35.1; y: 96.3; skew-x: -13.9; skew-y: -14.9; scale-x: 0.753; }
        frame 114 { x: 35.5; y: 94.8; skew-x: -7.5; skew-y: -8.5; scale-x: -10000; }
        frame 115 { x: 36.2; y: 93.6; skew-x: -1.2; skew-y: -2.2; scale-x: 0.754; }
        frame 116 { x: 37; y: 92.8; skew-x: 4.9; skew-y: 3.9; scale-x: -10000; }
        frame 117 { x: 36.7; y: 94.2; skew-x: 5.8; skew-y: 4.8; scale-x: 0.753; scale-y: 1.03; }
        frame 118 { x: 36.4; y: 95.6; skew-x: 6.8; skew-y: 5.8; scale-x: 0.752; scale-y: 1.029; }
        frame 119 { x: 36; y: 97; skew-x: 7.8; skew-y: 6.8; scale-x: 0.751; scale-y: 1.028; }
        frame 120 { x: 35.9; y: 98.4; skew-x: 8.8; skew-y: 7.8; scale-x: -10000; scale-y: 1.027; }
        frame 121 { x: 35.2; y: 98.3; skew-x: 8; skew-y: 7.3; scale-x: 0.753; scale-y: 1.001; }
        frame 122 { x: 34.6; y: -10000; skew-x: 7.3; skew-y: 6.8; scale-x: 0.756; scale-y: 0.974; }
        frame 123 { x: 34; y: 98.2; skew-x: 6.5; skew-y: 6.3; scale-x: 0.758; scale-y: 0.948; }
        frame 124 { x: 33.3; y: -10000; skew-x: 5.8; skew-y: 5.8; scale-x: 0.761; scale-y: 0.922; }
        frame 125 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 32.7; y: 98.8; skew-x: 4; skew-y: 4; }
        frame 127 { x: 32.1; y: 99.5; skew-x: 2.3; skew-y: 2.3; }
        frame 128 { x: 31.7; y: 100.1; skew-x: 0.8; skew-y: 0.8; }
        frame 129 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 132 { x: 36; y: 98.2; skew-x: 11.3; skew-y: 11.3; scale-x: 0.76; scale-y: 0.921; }
        frame 133 { x: 40.7; y: 96.6; skew-x: 22; skew-y: 22; scale-x: 0.759; scale-y: 0.92; }
        frame 134 { x: 45.6; y: 95.5; skew-x: 32.7; skew-y: 32.7; scale-x: 0.76; scale-y: -10000; }
        frame 135 { x: 48.6; y: 94.8; skew-x: 37.8; skew-y: 37.9; scale-x: 0.758; scale-y: 0.918; }
        frame 136 { x: 51.8; y: 94.1; skew-x: 43.1; skew-y: 43.1; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 54.8; y: 93.6; skew-x: 48.2; skew-y: 48.2; scale-x: 0.759; scale-y: 0.919; }
        frame 138 { x: 61.4; y: 93.8; skew-x: 59.9; skew-y: 59.9; scale-x: 0.758; scale-y: 0.917; }
        frame 139 { x: 67.8; y: 94.6; skew-x: 71.5; skew-y: 71.5; scale-x: 0.757; scale-y: -10000; }
        frame 140 { x: 74.1; y: 96; skew-x: 83.1; skew-y: 83.1; scale-x: 0.758; scale-y: 0.918; }
        frame 141 { x: 80.1; y: 97.3; skew-x: 100.3; skew-y: 100.3; scale-x: -10000; scale-y: 0.916; }
        frame 142 { x: 84.8; y: 99.3; skew-x: 117.4; skew-y: 117.6; scale-y: 0.913; }
        frame 143 { x: 88.2; y: 101.7; skew-x: 134.7; skew-y: 134.9; scale-x: 0.759; scale-y: -10000; }
        frame 144 { x: 90.2; y: 104.4; skew-x: 120.6; skew-y: 120.9; scale-x: 0.757; scale-y: 0.911; }
        frame 145 { x: 91.1; y: 107.3; skew-x: 106.6; skew-y: 107; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 91.3; y: 110.5; skew-x: 92.8; skew-y: 93.1; }
        frame 147 { x: 90.3; y: 113; skew-x: 93.2; skew-y: 92.6; scale-x: 0.679; scale-y: 0.953; }
        frame 148 { x: 90.7; y: 112.1; skew-x: 93; skew-y: 92.8; scale-x: 0.705; scale-y: 0.939; }
        frame 149 { x: 91; y: 111.3; skew-x: 92.8; skew-y: -10000; scale-x: 0.731; scale-y: 0.925; }
        frame 150 { x: 91.3; y: 110.5; skew-x: -10000; skew-y: 93.1; scale-x: 0.757; scale-y: 0.911; }
        frame 151 { x: 91.5; y: -10000; skew-y: 93; scale-x: -10000; scale-y: -10000; }
        frame 152 { x: 91.3; skew-y: 93.1; }
        frame 153 { x: -10000; skew-y: -10000; cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_innerleg_foot";
        frame-count: 155;
        frame 0 { x: 38.4; y: 88.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_INNERLEG_FOOT; }
        frame 1 { x: 39.9; y: 88.5; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 41.3; y: 89; skew-x: 1.3; skew-y: 1.3; }
        frame 3 { x: 42.9; y: 89.2; skew-x: 1.9; skew-y: 1.9; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 41.4; y: 91.7; skew-x: 1.3; skew-y: 1.3; scale-x: 0.8; scale-y: 0.8; }
        frame 5 { x: 39.9; y: 94.2; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 38.4; y: 96.8; skew-x: 0; skew-y: 0; }
        frame 7 { x: 37.5; y: 96.7; skew-x: -1.9; skew-y: -1.9; }
        frame 8 { x: 36.6; y: 96.8; skew-x: -4.2; skew-y: -4.2; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 35.6; y: 96.7; skew-x: -6.4; skew-y: -6.4; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 36.4; y: 93.8; skew-x: -4.2; skew-y: -4.2; }
        frame 11 { x: 37.4; y: 91; skew-x: -1.9; skew-y: -1.9; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: 38.4; y: 88.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: 38.8; y: 88.5; skew-x: -1.4; skew-y: -1.4; }
        frame 15 { x: 39.2; y: 88.7; skew-x: -2.9; skew-y: -2.9; }
        frame 16 { x: 39.5; y: 89; skew-x: -4.7; skew-y: -4.7; }
        frame 17 { x: 40; y: 89.3; skew-x: -6.2; skew-y: -6.2; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 40.3; y: 89.5; skew-x: -7.7; skew-y: -7.7; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 40.8; y: 89.8; skew-x: -9.4; skew-y: -9.4; }
        frame 20 { x: 41.1; y: 90.2; skew-x: -11; skew-y: -11; }
        frame 21 { x: 29.9; y: 87.6; skew-x: 2; skew-y: 2; }
        frame 22 { x: 19; y: 85.6; skew-x: 15; skew-y: 15; scale-x: 0.798; scale-y: 0.798; }
        frame 23 { x: 8.3; y: 84.2; skew-x: 28.3; skew-y: 28.3; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: -1.8; y: 83.7; skew-x: 41.4; skew-y: 41.4; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: 6.4; y: 83.8; skew-x: 21; skew-y: 21; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 15.4; y: 85.7; skew-x: 0.8; skew-y: 0.8; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: 25.5; y: 89.2; skew-x: -19.3; skew-y: -19.3; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 21.1; y: 88.8; skew-x: -12.7; skew-y: -12.7; }
        frame 29 { x: 17; y: 88.5; skew-x: -6.2; skew-y: -6.2; }
        frame 30 { x: 12.9; y: 88.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 31 { x: 38.4; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -10000; }
        frame 33 { x: 36.3; y: 96.7; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 34.3; y: 105.2; skew-x: 14.9; skew-y: 14.9; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 37.4; y: 107.2; skew-x: 32.3; skew-y: 32.3; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: 40.6; y: 110.3; skew-x: 49.7; skew-y: 49.7; scale-x: 0.798; scale-y: 0.798; }
        frame 37 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 38 { y: 110.2; skew-x: 49.6; skew-y: 49.6; scale-x: 0.796; scale-y: 0.796; }
        frame 39 { x: 40.5; y: -10000; skew-x: 49.4; skew-y: 49.4; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -10000; y: 110.1; skew-x: -10000; skew-y: -10000; scale-x: 0.795; scale-y: 0.795; }
        frame 41 { y: -10000; skew-x: 49.1; skew-y: 49.1; scale-x: -10000; scale-y: -10000; }
        frame 42 { skew-x: -10000; skew-y: -10000; }
        frame 43 { x: 40.4; skew-x: 48.9; skew-y: 48.9; scale-x: 0.794; scale-y: 0.794; }
        frame 44 { x: -10000; y: 110; skew-x: 48.7; skew-y: 48.7; scale-x: -10000; scale-y: -10000; }
        frame 45 { y: -10000; skew-x: 48.6; skew-y: 48.6; scale-x: 0.795; scale-y: 0.795; }
        frame 46 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 39; y: 109.7; skew-x: 44.1; skew-y: 44.1; scale-x: 0.793; scale-y: 0.793; }
        frame 48 { x: 37.7; y: 109.5; skew-x: 39.8; skew-y: 39.8; scale-x: 0.794; scale-y: 0.794; }
        frame 49 { x: 38.1; y: -10000; skew-x: 41.1; skew-y: 41.1; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 38.5; skew-x: 42.1; skew-y: 42.1; }
        frame 51 { x: 38.9; y: 109.6; skew-x: 43.4; skew-y: 43.4; scale-x: 0.795; scale-y: 0.795; }
        frame 52 { x: 39.2; y: -10000; skew-x: 44.6; skew-y: 44.6; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 39.5; y: 109.7; skew-x: 45.7; skew-y: 45.7; scale-x: 0.796; scale-y: 0.796; }
        frame 54 { x: 40; y: -10000; skew-x: 46.9; skew-y: 46.9; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { x: -10000; y: 109.8; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 56 { y: 109.7; scale-x: -10000; scale-y: -10000; }
        frame 57 { y: -10000; }
        frame 58 { scale-x: 0.798; scale-y: 0.798; }
        frame 59 { scale-x: -10000; scale-y: -10000; }
        frame 60 { scale-x: 0.796; scale-y: 0.796; }
        frame 61 { scale-x: -10000; scale-y: -10000; }
        frame 62 { scale-x: 0.798; scale-y: 0.798; }
        frame 63 { scale-x: 0.796; scale-y: 0.796; }
        frame 64 { scale-x: -10000; scale-y: -10000; }
        frame 65 { scale-x: 0.798; scale-y: 0.798; }
        frame 66 { x: 39.6; y: 109.3; skew-x: 45.4; skew-y: 45.4; scale-x: 0.796; scale-y: 0.796; }
        frame 67 { x: 39.3; y: 109.1; skew-x: 44.1; skew-y: 44.1; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 39; y: 108.8; skew-x: 42.6; skew-y: 42.6; scale-x: 0.797; scale-y: 0.797; }
        frame 69 { x: 39.3; y: 109.1; skew-x: 44.1; skew-y: 44.1; scale-x: 0.796; scale-y: 0.796; }
        frame 70 { x: 39.5; y: 109.4; skew-x: 45.4; skew-y: 45.4; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 40; y: 109.7; skew-x: 46.9; skew-y: 46.9; scale-x: 0.798; scale-y: 0.798; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 73 { scale-x: -10000; scale-y: -10000; }
        frame 74 { scale-x: 0.798; scale-y: 0.798; }
        frame 75 { scale-x: 0.796; scale-y: 0.796; }
        frame 76 { scale-x: -10000; scale-y: -10000; }
        frame 77 { scale-x: 0.798; scale-y: 0.798; }
        frame 78 { x: 39.6; y: 109.3; skew-x: 45.4; skew-y: 45.4; scale-x: 0.796; scale-y: 0.796; }
        frame 79 { x: 39.3; y: 109.1; skew-x: 44.1; skew-y: 44.1; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 39; y: 108.8; skew-x: 42.6; skew-y: 42.6; scale-x: 0.797; scale-y: 0.797; }
        frame 81 { x: 39.3; y: 109.1; skew-x: 44.1; skew-y: 44.1; scale-x: 0.796; scale-y: 0.796; }
        frame 82 { x: 39.5; y: 109.4; skew-x: 45.4; skew-y: 45.4; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 40; y: 109.7; skew-x: 46.9; skew-y: 46.9; scale-x: 0.798; scale-y: 0.798; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 41.8; y: 109.5; skew-x: 46.7; skew-y: 46.7; scale-x: 0.796; scale-y: 0.796; }
        frame 86 { x: 43.8; y: -10000; skew-x: 46.6; skew-y: 46.6; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 45.6; y: 109.3; skew-x: 46.4; skew-y: 46.4; scale-x: 0.795; scale-y: 0.795; }
        frame 88 { x: 47.5; y: -10000; skew-x: 46.2; skew-y: 46.2; scale-x: 0.796; scale-y: 0.796; }
        frame 89 { x: 48.8; y: 109.2; skew-x: 48.4; skew-y: 48.4; scale-x: 0.794; scale-y: 0.794; }
        frame 90 { x: 50; y: -10000; skew-x: 50.9; skew-y: 50.9; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 51.4; skew-x: 53.2; skew-y: 53.2; scale-x: 0.793; scale-y: 0.793; }
        frame 92 { x: 52.9; skew-x: 55.5; skew-y: 55.5; scale-x: 0.794; scale-y: 0.794; }
        frame 93 { x: 53.8; y: 109.3; skew-x: 54.2; skew-y: 54.2; scale-x: 0.79; scale-y: 0.797; }
        frame 94 { x: 54.7; y: 109.4; skew-x: 52.9; skew-y: 52.9; scale-x: 0.787; scale-y: 0.801; }
        frame 95 { x: 55.5; y: 109.5; skew-x: 51.4; skew-y: 51.4; scale-x: 0.784; scale-y: 0.806; }
        frame 96 { x: 56.3; y: 109.6; skew-x: 50.1; skew-y: 50.1; scale-x: 0.783; scale-y: 0.812; }
        frame 97 { x: 57.5; y: 109.1; skew-x: 48.4; skew-y: 48.4; scale-x: 0.784; scale-y: 0.805; }
        frame 98 { x: 58.6; y: 108.7; skew-x: 46.6; skew-y: 46.6; scale-x: 0.786; scale-y: 0.8; }
        frame 99 { x: 59.7; y: 108.2; skew-x: 44.9; skew-y: 44.9; scale-x: 0.788; scale-y: 0.795; }
        frame 100 { x: 61; y: 107.6; skew-x: 43.1; skew-y: 43.1; scale-x: 0.791; scale-y: 0.791; }
        frame 101 { x: 59.9; y: 107.9; skew-x: 31.8; skew-y: 31.8; scale-x: 0.79; scale-y: 0.79; }
        frame 102 { x: 58.7; y: 108.8; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 57.9; y: 110.2; skew-x: 9.3; skew-y: 9.3; scale-x: 0.791; scale-y: 0.791; }
        frame 104 { x: 57; y: 112.1; skew-x: -1.6; skew-y: -1.6; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 55.3; y: -10000; skew-x: -3.7; skew-y: -3.7; }
        frame 106 { x: 53.6; skew-x: -5.7; skew-y: -5.7; }
        frame 107 { x: 52; skew-x: -7.7; skew-y: -7.7; }
        frame 108 { x: 50.5; skew-x: -10; skew-y: -10; }
        frame 109 { x: 48.8; y: 111; skew-x: -2.7; skew-y: -2.7; }
        frame 110 { x: 47.2; y: 110.2; skew-x: 4.1; skew-y: 4.1; scale-x: 0.79; scale-y: 0.79; }
        frame 111 { x: 45.8; y: 109.5; skew-x: 11.3; skew-y: 11.3; scale-x: 0.789; scale-y: 0.789; }
        frame 112 { x: 44.4; y: 109; skew-x: 18.5; skew-y: 18.5; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 44; y: 108.2; skew-x: 25; skew-y: 25; scale-x: 0.788; scale-y: 0.788; }
        frame 114 { x: 43.5; y: 107.6; skew-x: 31.4; skew-y: 31.4; scale-x: 0.787; scale-y: 0.787; }
        frame 115 { x: 43.3; y: 107; skew-x: 37.9; skew-y: 37.9; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 43; y: 106.7; skew-x: 44.5; skew-y: 44.5; scale-x: 0.788; scale-y: 0.788; }
        frame 117 { y: 107.8; skew-x: 48.1; skew-y: 48.1; scale-x: 0.786; scale-y: 0.786; }
        frame 118 { x: 42.9; y: 109.1; skew-x: 51.7; skew-y: 51.7; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: -10000; y: 110.3; skew-x: 55.2; skew-y: 55.2; scale-x: 0.785; scale-y: 0.785; }
        frame 120 { x: 43; y: 111.6; skew-x: 58.8; skew-y: 58.8; scale-x: 0.786; scale-y: 0.786; }
        frame 121 { x: 42.3; y: 111.1; skew-x: 55.9; skew-y: 55.9; scale-x: 0.788; scale-y: 0.788; }
        frame 122 { x: 41.5; y: 110.6; skew-x: 52.9; skew-y: 52.9; scale-x: 0.79; scale-y: 0.79; }
        frame 123 { x: 40.9; y: 110; skew-x: 49.9; skew-y: 49.9; scale-x: 0.793; scale-y: 0.793; }
        frame 124 { x: 40; y: 109.7; skew-x: 46.9; skew-y: 46.9; scale-x: 0.798; scale-y: 0.798; }
        frame 125 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 126 { scale-x: 0.796; scale-y: 0.796; }
        frame 127 { scale-x: -10000; scale-y: -10000; }
        frame 128 { scale-x: 0.798; scale-y: 0.798; }
        frame 129 { scale-x: 0.796; scale-y: 0.796; }
        frame 130 { scale-x: -10000; scale-y: -10000; }
        frame 131 { scale-x: 0.798; scale-y: 0.798; }
        frame 132 { x: 44.1; y: 108.9; skew-x: 61.4; skew-y: 61.4; scale-x: 0.796; scale-y: 0.796; }
        frame 133 { x: 47.8; y: 109; skew-x: 75.7; skew-y: 75.7; scale-x: 0.795; scale-y: 0.795; }
        frame 134 { x: 51; y: 109.8; skew-x: 90; skew-y: 90; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 52.8; y: 109.3; skew-x: 95.1; skew-y: 95.1; }
        frame 136 { x: 54.5; y: 109.1; skew-x: 100.3; skew-y: 100.3; scale-x: 0.794; scale-y: 0.794; }
        frame 137 { x: 56.1; y: 108.8; skew-x: 105.6; skew-y: 105.6; scale-x: 0.795; scale-y: 0.795; }
        frame 138 { x: 58.1; y: 107.7; skew-x: 108; skew-y: 108; scale-x: 0.794; scale-y: 0.794; }
        frame 139 { x: 60.1; y: 106.5; skew-x: 110.3; skew-y: 110.3; scale-x: 0.793; scale-y: 0.793; }
        frame 140 { x: 62; y: 105.4; skew-x: 112.9; skew-y: 112.9; scale-x: 0.794; scale-y: 0.794; }
        frame 141 { x: 67.8; y: 102.9; skew-x: 130.4; skew-y: 130.6; scale-x: 0.792; scale-y: 0.792; }
        frame 142 { x: 72.2; y: 100.3; skew-x: 147.9; skew-y: 148.2; scale-x: 0.791; scale-y: -10000; }
        frame 143 { x: 75.3; y: 97.4; skew-x: 165.3; skew-y: 165.8; scale-x: 0.792; scale-y: 0.793; }
        frame 144 { x: 77.3; y: 103.8; skew-x: 151.4; skew-y: 151.9; scale-x: 0.79; scale-y: 0.791; }
        frame 145 { x: 78.6; y: 109.8; skew-x: 137.4; skew-y: 137.9; scale-x: -10000; scale-y: 0.79; }
        frame 146 { x: 78.9; y: 115.9; skew-x: 123.4; skew-y: 123.9; scale-y: 0.791; }
        frame 147 { x: 77.3; y: 117.8; skew-x: 127.6; skew-y: 119.9; scale-x: 0.746; scale-y: 0.792; }
        frame 148 { x: 77.8; y: 117.2; skew-x: 126.1; skew-y: 121.1; scale-x: 0.759; scale-y: 0.791; }
        frame 149 { x: 78.3; y: 116.6; skew-x: 124.8; skew-y: 122.6; scale-x: 0.774; scale-y: 0.79; }
        frame 150 { x: 78.9; y: 115.9; skew-x: 123.4; skew-y: 123.9; scale-x: 0.79; scale-y: 0.791; }
        frame 151 { x: -10000; y: 115.8; skew-x: -10000; skew-y: 123.8; scale-x: 0.789; scale-y: 0.79; }
        frame 152 { y: 115.9; skew-y: 123.9; scale-x: 0.79; scale-y: 0.791; }
        frame 153 { y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_innerleg_upper";
        frame-count: 155;
        frame 0 { x: 35.4; y: 59.7; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_OUTERLEG_UPPER; }
        frame 1 { x: 36.2; y: 60.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 37; y: 61.8; }
        frame 3 { x: 37.9; y: 62.8; skew-x: -0; skew-y: -0; }
        frame 4 { x: 37; y: 64.6; skew-x: 0; skew-y: 0; }
        frame 5 { x: 36.2; y: 66.3; skew-x: -10000; skew-y: -10000; }
        frame 6 { x: 35.4; y: 68.2; }
        frame 7 { x: 35.2; y: 66.7; skew-x: 0.3; skew-y: 0.3; }
        frame 8 { x: 35; y: 65.1; skew-x: 0.8; skew-y: 0.8; }
        frame 9 { y: 63.5; skew-x: 1.3; skew-y: 1.3; }
        frame 10 { y: 62.3; skew-x: 0.8; skew-y: 0.8; }
        frame 11 { x: 35.2; y: 61; skew-x: 0.3; skew-y: 0.3; }
        frame 12 { x: 35.4; y: 59.7; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: 35.2; y: 59.9; skew-x: -1.2; skew-y: -1.2; }
        frame 15 { x: 35; y: 60; skew-x: -2.4; skew-y: -2.4; }
        frame 16 { x: 34.9; y: 60.4; skew-x: -3.9; skew-y: -3.9; }
        frame 17 { x: -10000; y: 60.5; skew-x: -5.2; skew-y: -5.2; }
        frame 18 { x: 34.6; y: 60.7; skew-x: -6.5; skew-y: -6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: 34.5; y: 60.9; skew-x: -7.9; skew-y: -7.9; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 34.4; y: 61.2; skew-x: -9.3; skew-y: -9.3; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: 26.3; y: 60; skew-x: -2.9; skew-y: -2.9; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 18.2; y: 59.1; skew-x: 3; skew-y: 3; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 10.1; y: 58.2; skew-x: 9.1; skew-y: 9.1; }
        frame 24 { x: 2.2; y: 57.4; skew-x: 15.4; skew-y: 15.4; }
        frame 25 { x: 6.2; y: 58.2; skew-x: 5.3; skew-y: 5.3; }
        frame 26 { x: 10.5; y: 59.3; skew-x: -4.4; skew-y: -4.4; }
        frame 27 { x: 14.9; y: 60.8; skew-x: -14.5; skew-y: -14.5; }
        frame 28 { x: 13.2; y: 60.3; skew-x: -9.7; skew-y: -9.7; }
        frame 29 { x: 11.5; y: 59.9; skew-x: -4.7; skew-y: -4.7; scale-x: 0.8; scale-y: 0.8; }
        frame 30 { x: 9.9; y: 59.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 35.4; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: -10000; }
        frame 33 { x: 36.9; y: 68.2; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 38.7; y: 76.9; skew-x: 14.9; skew-y: 14.9; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 40.2; y: 79.7; skew-x: 20.5; skew-y: 20.5; scale-x: 0.798; scale-y: 0.871; }
        frame 36 { x: 42; y: 82.8; skew-x: 26.2; skew-y: 26.2; scale-x: 0.799; scale-y: 0.945; }
        frame 37 { x: 42.1; y: 85.7; skew-x: 32.7; skew-y: 32.7; scale-x: 0.798; scale-y: 0.944; }
        frame 38 { x: 42; y: 85.5; skew-x: 32.3; skew-y: 32.3; scale-x: 0.797; scale-y: 0.943; }
        frame 39 { x: 41.9; y: 85.3; skew-x: 32.1; skew-y: 32.1; scale-x: -10000; scale-y: 0.942; }
        frame 40 { x: 41.8; y: 85.1; skew-x: 31.6; skew-y: 31.6; scale-y: -10000; }
        frame 41 { x: 41.6; y: 84.9; skew-x: 31.3; skew-y: 31.3; scale-x: 0.796; }
        frame 42 { x: 41.5; y: 84.7; skew-x: 30.8; skew-y: 30.8; scale-x: -10000; }
        frame 43 { x: 41.4; y: 84.5; skew-x: 30.6; skew-y: 30.6; scale-y: 0.941; }
        frame 44 { x: 41.3; y: 84.3; skew-x: 30.1; skew-y: 30.1; scale-y: -10000; }
        frame 45 { x: 41.1; y: 84.2; skew-x: 29.8; skew-y: 29.8; scale-x: 0.797; scale-y: 0.942; }
        frame 46 { x: 40.3; y: 83.5; skew-x: 25.2; skew-y: 25.2; scale-x: 0.796; scale-y: -10000; }
        frame 47 { x: 44.5; y: 82.7; skew-x: 34.4; skew-y: 34.4; scale-x: 0.795; scale-y: 0.955; }
        frame 48 { x: 48.8; y: 82.1; skew-x: 43.6; skew-y: 43.6; scale-x: 0.796; scale-y: 0.97; }
        frame 49 { x: 47.6; y: 82.3; skew-x: 40.6; skew-y: 40.6; scale-x: 0.795; scale-y: 0.964; }
        frame 50 { x: 46.5; y: -10000; skew-x: 37.8; skew-y: 37.8; scale-x: -10000; scale-y: 0.96; }
        frame 51 { x: 45.4; skew-x: 34.9; skew-y: 34.9; scale-x: 0.796; scale-y: 0.956; }
        frame 52 { x: 44.3; y: 82.5; skew-x: 32.1; skew-y: 32.1; scale-x: 0.797; scale-y: 0.952; }
        frame 53 { x: 43.1; y: 82.6; skew-x: 29.1; skew-y: 29.1; scale-x: -10000; scale-y: 0.948; }
        frame 54 { x: 42; y: 82.8; skew-x: 26.2; skew-y: 26.2; scale-x: 0.799; scale-y: 0.945; }
        frame 55 { x: 42.3; y: 82.9; skew-x: 28.3; skew-y: 28.3; scale-x: 0.797; scale-y: 0.943; }
        frame 56 { x: 42.7; y: -10000; skew-x: 30.6; skew-y: 30.6; scale-x: 0.798; scale-y: -10000; }
        frame 57 { x: 42.4; y: 83; skew-x: 28.3; skew-y: 28.3; scale-x: 0.797; }
        frame 58 { x: 42; y: 82.8; skew-x: 26.2; skew-y: 26.2; scale-x: 0.799; scale-y: 0.945; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 42.2; y: 83; skew-x: 26.6; skew-y: 26.6; scale-x: 0.798; scale-y: 0.943; }
        frame 61 { x: 42.4; skew-x: 27.1; skew-y: 27.1; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 42.6; y: 83.1; skew-x: 27.5; skew-y: 27.5; scale-x: 0.799; scale-y: 0.945; }
        frame 63 { x: 42.7; y: 82.9; skew-x: 28.3; skew-y: 28.3; scale-x: 0.798; scale-y: 0.954; }
        frame 64 { x: 42.8; y: 82.8; skew-x: 29.1; skew-y: 29.1; scale-x: -10000; scale-y: 0.966; }
        frame 65 { x: 42.9; y: 82.4; skew-x: 29.8; skew-y: 29.8; scale-x: 0.799; scale-y: 0.978; }
        frame 66 { x: 42.2; y: 82.8; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.977; }
        frame 67 { x: 41.5; y: 83.2; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 40.8; y: 83.6; skew-x: 29.9; skew-y: 29.9; scale-x: 0.798; scale-y: 0.978; }
        frame 69 { x: 41.2; y: 83.3; skew-x: 28.6; skew-y: 28.6; scale-x: 0.797; scale-y: 0.965; }
        frame 70 { x: 41.5; y: 83.1; skew-x: 27.3; skew-y: 27.3; scale-x: 0.798; scale-y: 0.954; }
        frame 71 { x: 42; y: 82.8; skew-x: 26.2; skew-y: 26.2; scale-x: 0.799; scale-y: 0.945; }
        frame 72 { x: 42.2; y: 83; skew-x: 26.6; skew-y: 26.6; scale-x: 0.798; scale-y: 0.943; }
        frame 73 { x: 42.4; skew-x: 27.1; skew-y: 27.1; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 42.6; y: 83.1; skew-x: 27.5; skew-y: 27.5; scale-x: 0.799; scale-y: 0.945; }
        frame 75 { x: 42.7; y: 82.9; skew-x: 28.3; skew-y: 28.3; scale-x: 0.798; scale-y: 0.954; }
        frame 76 { x: 42.8; y: 82.8; skew-x: 29.1; skew-y: 29.1; scale-x: -10000; scale-y: 0.966; }
        frame 77 { x: 42.9; y: 82.4; skew-x: 29.8; skew-y: 29.8; scale-x: 0.799; scale-y: 0.978; }
        frame 78 { x: 42.2; y: 82.8; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.977; }
        frame 79 { x: 41.5; y: 83.2; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 40.8; y: 83.6; skew-x: 29.9; skew-y: 29.9; scale-x: 0.798; scale-y: 0.978; }
        frame 81 { x: 41.2; y: 83.3; skew-x: 28.6; skew-y: 28.6; scale-x: 0.797; scale-y: 0.965; }
        frame 82 { x: 41.5; y: 83.1; skew-x: 27.3; skew-y: 27.3; scale-x: 0.798; scale-y: 0.954; }
        frame 83 { x: 42; y: 82.8; skew-x: 26.2; skew-y: 26.2; scale-x: 0.799; scale-y: 0.945; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 42; skew-x: 23.8; skew-y: 23.8; scale-x: 0.798; scale-y: 0.943; }
        frame 86 { x: 42.1; skew-x: 21.6; skew-y: 21.6; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 42.3; skew-x: 19.3; skew-y: 19.3; }
        frame 88 { x: 42.4; y: 82.7; skew-x: 17.2; skew-y: 17.2; scale-y: 0.944; }
        frame 89 { x: 41.8; y: 82.9; skew-x: 11.8; skew-y: 11.8; scale-x: 0.797; scale-y: 0.92; }
        frame 90 { x: 41.3; y: 83.3; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: 0.897; }
        frame 91 { x: 41; y: 83.8; skew-x: 1; skew-y: 1; scale-y: 0.874; }
        frame 92 { x: 40.8; y: 84.5; skew-x: -4.2; skew-y: -4.2; scale-y: 0.85; }
        frame 93 { x: 41.4; y: 84.1; skew-x: -5.2; skew-y: -5.2; scale-y: 0.873; }
        frame 94 { x: 41.9; y: 83.7; skew-x: -6.2; skew-y: -6.2; scale-y: 0.896; }
        frame 95 { x: 42.4; y: 83.4; skew-x: -7.2; skew-y: -7.2; scale-y: 0.919; }
        frame 96 { x: 43; y: 83; skew-x: -8.3; skew-y: -8.3; scale-y: 0.943; }
        frame 97 { x: 43.5; skew-x: -8.7; skew-y: -8.7; scale-y: 0.942; }
        frame 98 { x: 44; y: 82.9; skew-x: -9.4; skew-y: -9.4; scale-y: -10000; }
        frame 99 { x: 44.5; y: 82.8; skew-x: -9.9; skew-y: -9.9; scale-x: 0.796; }
        frame 100 { x: 44.9; y: 82.7; skew-x: -10.6; skew-y: -10.6; scale-x: 0.797; }
        frame 101 { x: 44.1; y: 84.3; skew-x: -11.7; skew-y: -11.7; scale-x: 0.796; }
        frame 102 { x: 43.3; y: 85.8; skew-x: -12.9; skew-y: -12.9; scale-x: -10000; scale-y: 0.941; }
        frame 103 { x: 42.4; y: 87.4; skew-x: -14.2; skew-y: -14.2; scale-y: -10000; }
        frame 104 { x: 41.5; y: 88.8; skew-x: -15.4; skew-y: -15.4; scale-y: 0.942; }
        frame 105 { x: 41; y: 87.6; skew-x: -12.9; skew-y: -12.9; scale-y: 0.941; }
        frame 106 { x: 40.4; y: 86.3; skew-x: -10.7; skew-y: -10.7; scale-y: -10000; }
        frame 107 { x: 39.9; y: 85.1; skew-x: -8.2; skew-y: -8.2; }
        frame 108 { x: 39.4; y: 84; skew-x: -6.1; skew-y: -6.1; }
        frame 109 { x: 39.5; y: 83.3; skew-x: -2.2; skew-y: -2.2; }
        frame 110 { x: 39.7; y: 82.6; skew-x: 1.3; skew-y: 1.3; }
        frame 111 { x: 39.9; y: 81.9; skew-x: 5.3; skew-y: 5.3; scale-x: 0.795; scale-y: 0.94; }
        frame 112 { x: 40; y: 81.4; skew-x: 9.2; skew-y: 9.1; scale-x: -10000; scale-y: 0.941; }
        frame 113 { x: 40.5; y: 80.3; skew-x: 11.3; skew-y: 11.3; scale-y: 0.94; }
        frame 114 { x: 41; y: 79.2; skew-x: 13.5; skew-y: 13.5; scale-y: -10000; }
        frame 115 { x: 41.5; y: 78.1; skew-x: 15.8; skew-y: 15.8; scale-x: 0.794; scale-y: 0.939; }
        frame 116 { x: 42.1; y: 77.1; skew-x: 18; skew-y: 18; scale-x: 0.795; scale-y: 0.94; }
        frame 117 { x: 42.5; y: 78.3; skew-x: 19.8; skew-y: 19.8; scale-x: 0.794; scale-y: 0.957; }
        frame 118 { x: 43.1; y: 79.4; skew-x: 21.6; skew-y: 21.6; scale-x: 0.793; scale-y: 0.974; }
        frame 119 { x: 43.6; y: 80.7; skew-x: 23.3; skew-y: 23.3; scale-x: -10000; scale-y: 0.991; }
        frame 120 { x: 44.2; y: 81.7; skew-x: 25.3; skew-y: 25.3; scale-y: 1.01; }
        frame 121 { x: 43.6; y: 82.1; skew-x: 25.5; skew-y: 25.5; scale-x: 0.794; scale-y: 0.992; }
        frame 122 { x: 43.1; y: 82.4; skew-x: 25.8; skew-y: 25.8; scale-x: 0.795; scale-y: 0.976; }
        frame 123 { x: 42.5; y: 82.6; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.96; }
        frame 124 { x: 42; y: 82.8; skew-x: 26.2; skew-y: 26.2; scale-x: 0.799; scale-y: 0.945; }
        frame 125 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 42.8; y: 83.6; skew-x: 28.8; skew-y: 28.8; scale-x: 0.798; scale-y: 0.943; }
        frame 127 { x: 43.6; y: 84.3; skew-x: 31.6; skew-y: 31.6; scale-x: 0.797; scale-y: -10000; }
        frame 128 { x: 44.6; y: 84.9; skew-x: 34.3; skew-y: 34.3; scale-x: 0.798; scale-y: 0.944; }
        frame 129 { x: 45.6; y: 85.2; skew-x: 36.1; skew-y: 36.1; scale-x: 0.797; scale-y: 0.943; }
        frame 130 { x: 46.8; y: 85.5; skew-x: 38.1; skew-y: 38.1; scale-x: -10000; scale-y: 0.942; }
        frame 131 { x: 48; y: 85.8; skew-x: 40.1; skew-y: 40.1; scale-x: 0.798; scale-y: 0.944; }
        frame 132 { x: 53.6; y: 86.3; skew-x: 48.4; skew-y: 48.4; scale-x: 0.796; scale-y: 0.942; }
        frame 133 { x: 59; y: 86.9; skew-x: 56.4; skew-y: 56.4; scale-x: -10000; scale-y: 0.941; }
        frame 134 { x: 64.4; y: 88; skew-x: 64.7; skew-y: 64.7; scale-x: 0.797; scale-y: 0.943; }
        frame 135 { x: 68; y: 89.1; skew-x: 69.9; skew-y: 69.9; scale-x: 0.796; scale-y: 0.941; }
        frame 136 { x: 71.5; y: 90.2; skew-x: 75.2; skew-y: 75.2; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 74.8; y: 91.4; skew-x: 80.3; skew-y: 80.3; scale-y: 0.942; }
        frame 138 { x: 80.7; y: 93; skew-x: 85.5; skew-y: 85.5; scale-y: 0.941; }
        frame 139 { x: 86.5; y: 94.8; skew-x: 90.5; skew-y: 90.5; scale-y: -10000; }
        frame 140 { x: 92.2; y: 96.5; skew-x: 95.8; skew-y: 95.8; }
        frame 141 { x: 96.2; y: 100.6; skew-x: 105.8; skew-y: 105.8; scale-x: 0.795; scale-y: 0.939; }
        frame 142 { x: 99.6; y: 105; skew-x: 115.8; skew-y: 116.1; scale-x: -10000; scale-y: 0.938; }
        frame 143 { x: 102.7; y: 109.4; skew-x: 125.9; skew-y: 126.4; scale-x: 0.797; scale-y: 0.939; }
        frame 144 { x: 105.1; y: 108.3; skew-x: 111.8; skew-y: 112.3; scale-x: 0.795; scale-y: 0.937; }
        frame 145 { x: 106.5; y: 107.3; skew-x: 98; skew-y: 98.3; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 107.3; y: 106.6; skew-x: 84.1; skew-y: 84.5; scale-y: 0.936; }
        frame 147 { x: 107; y: 109.5; skew-x: 83.1; skew-y: 85.3; scale-x: 0.714; scale-y: 0.978; }
        frame 148 { x: 107.1; y: 108.6; skew-x: 83.5; skew-y: 85.2; scale-x: 0.741; scale-y: 0.964; }
        frame 149 { x: 107.2; y: 107.6; skew-x: 83.7; skew-y: 84.7; scale-x: 0.768; scale-y: 0.95; }
        frame 150 { x: 107.3; y: 106.6; skew-x: 84.1; skew-y: 84.5; scale-x: 0.795; scale-y: 0.936; }
        frame 151 { x: -10000; y: -10000; skew-x: 84.2; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 152 { skew-x: 84.1; }
        frame 153 { skew-x: -10000; cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_innerarm_hand";
        frame-count: 155;
        frame 0 { x: 10; y: 95.1; scale-x: 0.656; scale-y: 0.7; image: IMAGE_REANIM_ZOMBIE_INNERARM_HAND; }
        frame 1 { x: 8.5; y: 94.3; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 7.1; y: 93.5; skew-x: 5.8; skew-y: 5.8; scale-y: 0.699; }
        frame 3 { x: 5.7; y: 92.8; skew-x: 8.6; skew-y: 8.6; scale-y: 0.7; }
        frame 4 { x: 7.1; y: 96.7; skew-x: 5.8; skew-y: 5.8; scale-y: 0.699; }
        frame 5 { x: 8.6; y: 100.6; skew-x: 2.8; skew-y: 2.8; scale-y: 0.7; }
        frame 6 { x: 10; y: 104.3; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 7 { x: 10.3; y: 104.9; skew-x: -0; skew-y: -0; }
        frame 8 { x: 10.5; y: 105.6; skew-x: -0.2; skew-y: -0.2; }
        frame 9 { x: 10.8; y: 106.2; skew-x: -0.6; skew-y: -0.6; }
        frame 10 { x: 10.6; y: 102.5; skew-x: -0.2; skew-y: -0.2; }
        frame 11 { x: 10.3; y: 98.7; skew-x: -0; skew-y: -0; }
        frame 12 { x: 10; y: 95.1; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: 10.8; y: 95.7; skew-x: -1.2; skew-y: -1.2; }
        frame 15 { x: 11.5; y: 96.2; skew-x: -2.4; skew-y: -2.4; }
        frame 16 { x: 12.3; y: 96.8; skew-x: -3.7; skew-y: -3.7; }
        frame 17 { x: 13; y: 97.5; skew-x: -4.9; skew-y: -4.9; }
        frame 18 { x: 13.8; y: 98; skew-x: -6.2; skew-y: -6.2; scale-y: 0.699; }
        frame 19 { x: 14.5; y: 98.6; skew-x: -7.4; skew-y: -7.4; scale-y: -10000; }
        frame 20 { x: 15.3; y: 99.2; skew-x: -8.8; skew-y: -8.8; scale-y: 0.7; }
        frame 21 { x: 3.3; y: 95.3; skew-x: 2.3; skew-y: 2.3; scale-y: 0.699; }
        frame 22 { x: -8.3; y: 91.7; skew-x: 13.3; skew-y: 13.3; scale-x: 0.655; scale-y: -10000; }
        frame 23 { x: -19.8; y: 88.5; skew-x: 24.5; skew-y: 24.5; scale-x: 0.654; scale-y: 0.698; }
        frame 24 { x: -31.3; y: 85.8; skew-x: 35.7; skew-y: 35.7; scale-x: 0.655; scale-y: 0.699; }
        frame 25 { x: -22.4; y: 89.9; skew-x: 15.5; skew-y: 15.5; scale-x: 0.654; scale-y: 0.698; }
        frame 26 { x: -12.8; y: 95.3; skew-x: -4.4; skew-y: -4.4; scale-x: 0.655; scale-y: 0.699; }
        frame 27 { x: -2.4; y: 101.5; skew-x: -24.6; skew-y: -24.6; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -6.9; y: 99.9; skew-x: -16.2; skew-y: -16.2; }
        frame 29 { x: -11.3; y: 98.5; skew-x: -8; skew-y: -8; scale-x: 0.656; }
        frame 30 { x: -15.6; y: 97.1; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.7; }
        frame 31 { x: 9.7; y: 94.8; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 32 { x: -10000; y: -10000; }
        frame 33 { x: 4.6; y: 90.8; skew-x: 19.3; skew-y: 19.3; scale-x: 0.655; scale-y: 0.699; }
        frame 34 { x: 0.1; y: 87.9; skew-x: 38.7; skew-y: 38.7; scale-x: -10000; scale-y: 0.698; }
        frame 35 { x: 2.5; y: 75.1; skew-x: 76.7; skew-y: 76.7; scale-x: 0.653; scale-y: 0.697; }
        frame 36 { x: 2; y: 65.8; skew-x: 114.5; skew-y: 114.5; scale-x: 0.652; scale-y: 0.696; }
        frame 37 { y: 65.7; skew-x: 135.3; skew-y: 135.1; scale-x: 0.647; scale-y: 0.693; }
        frame 38 { x: -2.8; y: 89.2; skew-x: 142.7; skew-y: 142.2; scale-x: 0.642; scale-y: 0.69; }
        frame 39 { x: -9.3; y: 118.5; skew-x: 86.2; skew-y: 85.5; scale-x: 0.641; scale-y: 0.692; }
        frame 40 { x: -10.3; y: 119.9; skew-x: 82; skew-y: 81; scale-x: 0.635; scale-y: 0.739; }
        frame 41 { x: -7.4; y: 116.8; skew-x: 34.6; skew-y: 32.8; scale-x: 0.591; scale-y: 0.72; }
        frame 42 { x: -0.1; y: 112.3; skew-x: 20.3; skew-y: 18; scale-x: 0.603; scale-y: 0.711; }
        frame 43 { x: 7.3; y: 108.7; skew-x: 6; skew-y: 3.3; scale-x: 0.617; scale-y: 0.704; }
        frame 44 { x: 10.4; y: 104.1; skew-x: -0.9; skew-y: -4.2; scale-x: 0.614; scale-y: 0.696; }
        frame 45 { x: 13.2; y: 99.7; skew-x: -8.2; skew-y: -11.7; scale-x: 0.61; scale-y: 0.689; }
        frame 46 { x: 13.4; y: 90.7; skew-x: -18.2; skew-y: -21.7; scale-x: 0.609; scale-y: 0.688; }
        frame 47 { x: 17.1; y: 64.5; skew-x: 53.9; skew-y: 50.4; scale-x: 0.607; scale-y: 0.685; }
        frame 48 { x: 37.5; y: 45; skew-x: 147; skew-y: 143.5; scale-x: 0.606; scale-y: 0.684; }
        frame 49 { x: 36.9; y: 48; skew-x: 169.2; skew-y: 165.7; scale-x: 0.605; scale-y: 0.683; }
        frame 50 { x: 35.3; y: 50; skew-x: 191.4; skew-y: 187.9; scale-x: 0.604; scale-y: 0.684; }
        frame 51 { x: 29.6; y: 57.8; skew-x: 168.9; skew-y: 165.2; scale-x: 0.605; scale-y: 0.686; }
        frame 52 { x: 22.6; y: 64.6; skew-x: 146.2; skew-y: 142.4; scale-x: 0.606; scale-y: 0.689; }
        frame 53 { x: 14.1; y: 70.8; skew-x: 123.6; skew-y: 119.6; scale-x: 0.607; scale-y: 0.692; }
        frame 54 { x: 3.9; y: 77.4; skew-x: 101.1; skew-y: 97; scale-x: 0.609; scale-y: 0.696; }
        frame 55 { x: 3.1; y: 81.1; skew-x: 90.8; skew-y: 87; scale-x: 0.608; scale-y: 0.695; }
        frame 56 { x: 2.4; y: 84.9; skew-x: 80.6; skew-y: 76.6; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 4.3; y: 81; skew-x: 90.8; skew-y: 87; scale-y: 0.696; }
        frame 58 { x: 5.6; y: 77.4; skew-x: 101.1; skew-y: 97; scale-x: 0.609; scale-y: -10000; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 60 { x: 5.5; y: 76.7; skew-x: 101.6; skew-y: 97.5; scale-x: 0.608; }
        frame 61 { x: 5.4; y: 76; skew-x: 102.4; skew-y: 98.3; scale-x: 0.609; }
        frame 62 { x: 5; y: 74.1; skew-x: 104.3; skew-y: 100.3; scale-x: 0.608; }
        frame 63 { x: 4.5; y: 72; skew-x: 106.3; skew-y: 102.1; scale-x: -10000; scale-y: 0.695; }
        frame 64 { x: 3.9; y: 70; skew-x: 108.2; skew-y: 104.2; scale-x: 0.609; scale-y: 0.696; }
        frame 65 { x: 3; y: 71.8; skew-x: 105.8; skew-y: 101.8; scale-x: 0.608; scale-y: 0.695; }
        frame 66 { x: 2.3; y: 73.7; skew-x: 103.6; skew-y: 99.5; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 1.6; y: 75.6; skew-x: 101.5; skew-y: 97.4; scale-y: 0.696; }
        frame 68 { x: 3.5; y: 76.8; skew-x: 110.6; skew-y: 106.5; scale-y: 0.695; }
        frame 69 { x: 5.3; y: 78.1; skew-x: 119.8; skew-y: 115.6; scale-x: 0.607; scale-y: 0.694; }
        frame 70 { x: 6.8; y: 79.5; skew-x: 128.9; skew-y: 124.9; scale-x: 0.608; scale-y: 0.695; }
        frame 71 { x: 9.3; y: 78.7; skew-x: 134.9; skew-y: 130.8; scale-x: 0.607; scale-y: 0.694; }
        frame 72 { x: 11.5; y: 78; skew-x: 140.9; skew-y: 136.9; scale-x: 0.606; scale-y: 0.693; }
        frame 73 { x: 13.5; y: 77.5; skew-x: 146.8; skew-y: 142.7; scale-x: 0.607; scale-y: 0.694; }
        frame 74 { x: 13; y: 75.7; skew-x: 140.4; skew-y: 136.2; scale-x: 0.606; scale-y: 0.693; }
        frame 75 { x: 12.3; y: 73.8; skew-x: 133.8; skew-y: 129.6; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 11.7; y: 71.8; skew-x: 127.3; skew-y: 123.2; scale-x: 0.607; scale-y: 0.694; }
        frame 77 { x: 10.8; y: 72.3; skew-x: 123.1; skew-y: 119.1; scale-x: 0.606; scale-y: 0.693; }
        frame 78 { x: 9.6; y: 72.6; skew-x: 119.1; skew-y: 115.1; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 8.6; y: 73.3; skew-x: 115; skew-y: 111; scale-x: 0.607; scale-y: 0.694; }
        frame 80 { x: 6.8; y: 74.4; skew-x: 110.3; skew-y: 106.3; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 5.1; y: 75.6; skew-x: 105.6; skew-y: 101.6; scale-x: 0.608; scale-y: 0.695; }
        frame 82 { x: 3.4; y: 76.7; skew-x: 101.1; skew-y: 97; scale-x: 0.609; scale-y: 0.696; }
        frame 83 { x: 5.6; y: 77.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: -10000; y: -10000; }
        frame 85 { x: 6.8; y: 75.3; skew-x: 106.5; skew-y: 102.5; scale-x: 0.608; scale-y: 0.695; }
        frame 86 { x: 7.8; y: 73.1; skew-x: 112.1; skew-y: 108; scale-x: 0.607; scale-y: -10000; }
        frame 87 { x: 8.9; y: 70.8; skew-x: 117.6; skew-y: 113.6; scale-x: -10000; scale-y: 0.694; }
        frame 88 { x: 9.9; y: 68.8; skew-x: 123.2; skew-y: 119.2; scale-y: -10000; }
        frame 89 { x: 10.1; y: 68; skew-x: 119.3; skew-y: 115.3; scale-x: 0.606; scale-y: 0.693; }
        frame 90 { x: 10.2; y: 67.4; skew-x: 115.3; skew-y: 111.3; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -10000; y: 66.6; skew-x: 111.3; skew-y: 107.3; }
        frame 92 { y: 65.9; skew-x: 107.6; skew-y: 103.5; }
        frame 93 { x: 10; y: 65.6; skew-x: 111.8; skew-y: 107.6; scale-x: 0.605; scale-y: 0.692; }
        frame 94 { x: 9.8; y: 65.5; skew-x: 115.8; skew-y: 111.8; scale-x: 0.604; scale-y: 0.691; }
        frame 95 { x: 9.6; y: 65.2; skew-x: 120.1; skew-y: 116.1; scale-x: -10000; scale-y: 0.69; }
        frame 96 { x: 9.1; y: 64.9; skew-x: 124.3; skew-y: 120.2; scale-y: -10000; }
        frame 97 { x: 8.9; y: 63.2; skew-x: 127.6; skew-y: 123.6; scale-x: 0.602; scale-y: 0.689; }
        frame 98 { x: 8.6; y: 61.6; skew-x: 131.1; skew-y: 127.1; scale-x: 0.601; scale-y: -10000; }
        frame 99 { x: 8.3; y: 60; skew-x: 134.6; skew-y: 130.6; scale-x: 0.6; scale-y: 0.688; }
        frame 100 { x: 7.9; y: 58.4; skew-x: 138; skew-y: 134; scale-x: -10000; scale-y: 0.689; }
        frame 101 { x: 7.7; y: 64; skew-x: 120.1; skew-y: 116; scale-x: 0.599; scale-y: 0.688; }
        frame 102 { x: 6.2; y: 69.6; skew-x: 102; skew-y: 98; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 4.1; y: 75.7; skew-x: 84.2; skew-y: 80.2; scale-x: 0.598; scale-y: 0.687; }
        frame 104 { x: 1.1; y: 82.4; skew-x: 66.2; skew-y: 62.2; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 3.4; y: 79.8; skew-x: 69.5; skew-y: 65.5; scale-x: 0.597; scale-y: 0.686; }
        frame 106 { x: 5.7; y: 77.3; skew-x: 72.9; skew-y: 68.9; scale-x: -10000; scale-y: 0.685; }
        frame 107 { x: 7.9; y: 74.8; skew-x: 76.2; skew-y: 72.2; scale-y: -10000; }
        frame 108 { x: 10.3; y: 72.3; skew-x: 79.4; skew-y: 75.3; }
        frame 109 { x: 10.8; y: 74.3; skew-x: 77.7; skew-y: 73.7; scale-x: 0.596; }
        frame 110 { x: 11.2; y: 76.3; skew-x: 75.7; skew-y: 71.7; scale-x: -10000; scale-y: 0.684; }
        frame 111 { x: 11.7; y: 78.3; skew-x: 74; skew-y: 70; scale-y: -10000; }
        frame 112 { x: 12.2; y: 80.2; skew-x: 72.1; skew-y: 68.1; }
        frame 113 { x: 13.2; y: 79.1; skew-x: 70.2; skew-y: 66.2; scale-x: 0.595; scale-y: 0.683; }
        frame 114 { x: 14.2; y: 78.1; skew-x: 68.4; skew-y: 64.4; scale-x: 0.594; scale-y: -10000; }
        frame 115 { x: 15.2; y: 76.9; skew-x: 66.4; skew-y: 62.4; scale-x: -10000; scale-y: 0.682; }
        frame 116 { x: 15.9; y: 75.8; skew-x: 64.5; skew-y: 60.4; scale-x: 0.595; scale-y: 0.683; }
        frame 117 { x: 14.5; y: 76.7; skew-x: 70; skew-y: 66; scale-x: 0.593; scale-y: 0.681; }
        frame 118 { x: 12.7; y: 77.3; skew-x: 75.5; skew-y: 71.5; scale-x: 0.592; scale-y: 0.68; }
        frame 119 { x: 11; y: 78.3; skew-x: 81; skew-y: 77; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 9.2; y: 79.2; skew-x: 86.5; skew-y: 82.5; scale-x: 0.591; scale-y: 0.679; }
        frame 121 { x: 8.3; y: 78.7; skew-x: 90; skew-y: 86.2; scale-x: 0.596; scale-y: 0.683; }
        frame 122 { x: 7.4; y: 78.2; skew-x: 93.8; skew-y: 89.7; scale-x: 0.6; scale-y: 0.688; }
        frame 123 { x: 6.5; y: 77.8; skew-x: 97.3; skew-y: 93.3; scale-x: 0.604; scale-y: 0.692; }
        frame 124 { x: 5.6; y: 77.4; skew-x: 101.1; skew-y: 97; scale-x: 0.609; scale-y: 0.696; }
        frame 125 { x: 4.6; y: 76.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 5.2; y: 83.2; skew-x: 81.7; skew-y: 77.7; scale-x: 0.608; scale-y: 0.695; }
        frame 127 { x: 5; y: 90.3; skew-x: 62.4; skew-y: 58.4; scale-x: 0.607; scale-y: 0.693; }
        frame 128 { x: 4.4; y: 98.5; skew-x: 43.1; skew-y: 39.1; scale-x: -10000; scale-y: 0.694; }
        frame 129 { x: 10.6; y: 104.2; skew-x: 52.9; skew-y: 48.7; scale-x: 0.605; scale-y: 0.692; }
        frame 130 { x: 16.8; y: 110.2; skew-x: 62.4; skew-y: 58.4; scale-x: 0.604; scale-y: 0.691; }
        frame 131 { x: 22.7; y: 116.5; skew-x: 72; skew-y: 68; scale-x: -10000; scale-y: -10000; }
        frame 132 { x: 24.3; y: 114; skew-x: 62.7; skew-y: 58.7; scale-x: 0.603; scale-y: 0.689; }
        frame 133 { x: 25.7; y: 111.6; skew-x: 53.2; skew-y: 49.1; scale-x: 0.602; scale-y: 0.688; }
        frame 134 { x: 27.2; y: 109.3; skew-x: 43.7; skew-y: 39.7; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 31.2; y: 105; skew-x: 46.1; skew-y: 42.1; scale-x: 0.6; scale-y: 0.686; }
        frame 136 { x: 35.2; y: 100.6; skew-x: 48.4; skew-y: 44.4; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 39.4; y: 96.1; skew-x: 50.7; skew-y: 46.7; }
        frame 138 { x: 47.9; y: 88.6; skew-x: 64.9; skew-y: 60.7; scale-x: 0.599; scale-y: 0.685; }
        frame 139 { x: 56.1; y: 81.6; skew-x: 78.9; skew-y: 74.9; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 64.1; y: 75; skew-x: 92.8; skew-y: 88.8; }
        frame 141 { x: 71.6; y: 75.8; skew-x: 101; skew-y: 96.8; scale-x: 0.598; scale-y: 0.684; }
        frame 142 { x: 78.8; y: 76.8; skew-x: 109.1; skew-y: 105.1; scale-x: -10000; scale-y: 0.683; }
        frame 143 { x: 86; y: 77.9; skew-x: 117.4; skew-y: 113.4; scale-y: 0.684; }
        frame 144 { x: 113.3; y: 71.1; skew-x: 166; skew-y: 162; scale-x: 0.597; scale-y: 0.683; }
        frame 145 { x: 149.1; y: 85.2; skew-x: 227.5; skew-y: 223.5; scale-x: 0.596; scale-y: 0.681; }
        frame 146 { x: 160.3; y: 128.4; skew-x: 285.1; skew-y: 281.1; scale-x: 0.595; scale-y: 0.68; }
        frame 147 { x: 162.5; y: 129; skew-x: 287.5; skew-y: 279.5; scale-x: 0.54; scale-y: 0.708; }
        frame 148 { x: 161.6; y: 127.2; skew-x: 290.6; skew-y: 283.8; scale-x: 0.557; scale-y: 0.698; }
        frame 149 { x: 160.7; y: 125.3; skew-x: 293.8; skew-y: 288.3; scale-x: 0.575; scale-y: 0.688; }
        frame 150 { x: 159.8; y: 123.5; skew-x: 297; skew-y: 292.9; scale-x: 0.594; scale-y: 0.679; }
        frame 151 { x: 160; y: 126; skew-x: 291; skew-y: 287; scale-x: -10000; scale-y: -10000; }
        frame 152 { x: 160.3; y: 128.4; skew-x: 285.1; skew-y: 281.1; scale-x: 0.595; scale-y: 0.68; }
        frame 153 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_innerarm_upper";
        frame-count: 155;
        frame 0 { x: 15.1; y: 67.1; scale-x: 0.7; scale-y: 0.7; image: IMAGE_REANIM_ZOMBIE_BALLOON_INNERARM_UPPER; }
        frame 1 { x: 14.4; y: 66.8; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 13.8; y: -10000; skew-x: 8.1; skew-y: 8.1; scale-x: 0.699; scale-y: 0.699; }
        frame 3 { x: 13.3; y: 66.6; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 13.8; y: 69.9; skew-x: 8.1; skew-y: 8.1; }
        frame 5 { x: 14.5; y: 73.2; skew-x: 4; skew-y: 4; scale-x: 0.7; scale-y: 0.7; }
        frame 6 { x: 15.1; y: 76.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 15.2; y: 77.3; skew-x: -0; skew-y: -0; }
        frame 8 { x: 15.4; y: 78.1; skew-x: -0.2; skew-y: -0.2; }
        frame 9 { x: 15.5; y: 78.8; skew-x: -0.6; skew-y: -0.6; }
        frame 10 { x: 15.4; y: 74.8; skew-x: -0.2; skew-y: -0.2; }
        frame 11 { x: 15.2; y: 70.8; skew-x: -0; skew-y: -0; }
        frame 12 { x: 15.1; y: 67.1; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: 15.2; y: 67.6; skew-x: -1.2; skew-y: -1.2; }
        frame 15 { x: -10000; y: 68; skew-x: -2.4; skew-y: -2.4; }
        frame 16 { x: 15.3; y: 68.6; skew-x: -3.7; skew-y: -3.7; }
        frame 17 { x: 15.4; y: 69.2; skew-x: -4.9; skew-y: -4.9; }
        frame 18 { x: 15.6; y: 69.8; skew-x: -6.2; skew-y: -6.2; scale-x: 0.699; scale-y: 0.699; }
        frame 19 { x: -10000; y: 70.2; skew-x: -7.4; skew-y: -7.4; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 15.7; y: 70.8; skew-x: -8.8; skew-y: -8.8; scale-x: 0.7; scale-y: 0.7; }
        frame 21 { x: 6.8; y: 68.5; skew-x: -2.4; skew-y: -2.4; scale-x: 0.699; scale-y: 0.699; }
        frame 22 { x: -1.8; y: 66.5; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -10.5; y: 64.4; skew-x: 10.3; skew-y: 10.3; }
        frame 24 { x: -19.2; y: 62.7; skew-x: 16.7; skew-y: 16.7; }
        frame 25 { x: -14.4; y: 65.3; skew-x: 6.5; skew-y: 6.5; }
        frame 26 { x: -9.4; y: 68.3; skew-x: -3.2; skew-y: -3.2; }
        frame 27 { x: -4.5; y: 71.6; skew-x: -13.3; skew-y: -13.3; }
        frame 28 { x: -6.5; y: 70.6; skew-x: -8.7; skew-y: -8.7; }
        frame 29 { x: -8.5; y: 69.8; skew-x: -4.2; skew-y: -4.2; scale-x: 0.7; scale-y: 0.7; }
        frame 30 { x: -10.3; y: 68.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 15.1; y: 66.8; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: -10000; y: -10000; }
        frame 33 { x: 16.5; y: 67.2; skew-x: 12.3; skew-y: 12.3; scale-x: 0.696; scale-y: 0.696; }
        frame 34 { x: 18.3; y: 68.1; skew-x: 24.9; skew-y: 24.9; scale-x: 0.693; scale-y: 0.693; }
        frame 35 { x: 20.4; y: 67.7; skew-x: 45.7; skew-y: 45.7; scale-x: 0.691; scale-y: 0.691; }
        frame 36 { x: 22.1; y: 68.5; skew-x: 66.6; skew-y: 66.6; scale-x: 0.692; scale-y: 0.692; }
        frame 37 { x: 20.2; y: 77.6; skew-x: 96.2; skew-y: 96.2; scale-x: 0.688; scale-y: 0.688; }
        frame 38 { x: 13.9; y: 92.7; skew-x: 75.5; skew-y: 75.5; scale-x: 0.687; scale-y: 0.687; }
        frame 39 { x: 11.4; y: 113; skew-x: 50.7; skew-y: 50.7; scale-x: 0.688; scale-y: 0.688; }
        frame 40 { x: 8.8; y: 111; skew-x: 39; skew-y: 44.1; scale-x: 0.686; scale-y: 0.681; }
        frame 41 { x: 11; y: 99.2; skew-x: 27.6; skew-y: 27.6; scale-x: 0.688; scale-y: 0.688; }
        frame 42 { x: 13.4; y: 90.2; skew-x: 19.8; skew-y: 19.8; scale-x: 0.687; scale-y: 0.687; }
        frame 43 { x: 15.6; y: 81.3; skew-x: 12; skew-y: 12; scale-x: 0.688; scale-y: 0.688; }
        frame 44 { x: 17.9; y: 76.7; skew-x: 7.8; skew-y: 7.8; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 20.1; y: 72.1; skew-x: 3.8; skew-y: 3.8; }
        frame 46 { x: 27; y: 61.4; skew-x: 28.9; skew-y: 28.9; scale-x: 0.687; scale-y: 0.687; }
        frame 47 { x: 44; y: 57.3; skew-x: 69.7; skew-y: 69.7; scale-x: 0.685; scale-y: 0.685; }
        frame 48 { x: 57.4; y: 57.1; skew-x: 110.4; skew-y: 110.4; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 54.8; y: 57.3; skew-x: 107.8; skew-y: 107.8; }
        frame 50 { x: 52.3; y: 57.4; skew-x: 105.4; skew-y: 105.4; scale-x: 0.687; scale-y: 0.687; }
        frame 51 { x: 45; y: 60.9; skew-x: 90.8; skew-y: 90.8; scale-x: 0.688; scale-y: 0.688; }
        frame 52 { x: 37; y: 64.7; skew-x: 76.2; skew-y: 76.2; scale-x: 0.689; scale-y: 0.689; }
        frame 53 { x: 28.4; y: 69; skew-x: 61.4; skew-y: 61.4; scale-x: 0.69; scale-y: 0.69; }
        frame 54 { x: 19.4; y: 73.7; skew-x: 46.8; skew-y: 46.8; scale-x: 0.692; scale-y: 0.692; }
        frame 55 { x: 19.2; y: 75.6; skew-x: 42.1; skew-y: 42.1; scale-x: 0.69; scale-y: 0.69; }
        frame 56 { x: 19.1; y: 77.3; skew-x: 37.5; skew-y: 37.5; scale-x: 0.691; scale-y: 0.691; }
        frame 57 { x: 20; y: 75.4; skew-x: 42.1; skew-y: 42.1; scale-x: 0.69; scale-y: 0.69; }
        frame 58 { x: 20.9; y: 73.7; skew-x: 46.8; skew-y: 46.8; scale-x: 0.692; scale-y: 0.692; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 21.5; y: 72.9; skew-x: 47.4; skew-y: 47.4; scale-x: 0.691; scale-y: 0.691; }
        frame 61 { x: 22.1; y: 72.2; skew-x: 48.1; skew-y: 48.1; scale-x: 0.692; scale-y: 0.692; }
        frame 62 { x: 21.9; y: 71; skew-x: 50.1; skew-y: 50.1; scale-x: 0.691; scale-y: 0.691; }
        frame 63 { x: 21.6; y: 69.7; skew-x: 52.1; skew-y: 52.1; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 21.2; y: 68.4; skew-x: 54; skew-y: 54; scale-x: 0.692; scale-y: 0.692; }
        frame 65 { x: 20.2; y: 69.6; skew-x: 51.7; skew-y: 51.7; scale-x: 0.691; scale-y: 0.691; }
        frame 66 { x: 19.2; y: 70.6; skew-x: 49.4; skew-y: 49.4; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 18.1; y: 71.7; skew-x: 47.2; skew-y: 47.2; scale-x: 0.692; scale-y: 0.692; }
        frame 68 { x: 18.8; y: 72.4; skew-x: 47.1; skew-y: 47.1; scale-x: 0.691; scale-y: 0.691; }
        frame 69 { x: 19.5; y: 73; skew-x: 46.9; skew-y: 46.9; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 20.2; y: 73.7; skew-x: 46.8; skew-y: 46.8; scale-x: 0.692; scale-y: 0.692; }
        frame 71 { x: 20.6; y: 72.6; skew-x: 43.9; skew-y: 43.9; scale-x: 0.691; scale-y: 0.691; }
        frame 72 { x: 21; y: 71.6; skew-x: 41.1; skew-y: 41.1; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 21.4; y: 70.7; skew-x: 38.3; skew-y: 38.3; scale-x: 0.692; scale-y: 0.692; }
        frame 74 { x: 22.5; y: -10000; skew-x: 43.3; skew-y: 43.3; scale-x: 0.691; scale-y: 0.691; }
        frame 75 { x: 23.4; y: 71.1; skew-x: 48.2; skew-y: 48.2; scale-x: 0.69; scale-y: 0.69; }
        frame 76 { x: 24.4; y: 71.2; skew-x: 53.2; skew-y: 53.2; scale-x: 0.691; scale-y: 0.691; }
        frame 77 { x: 22.3; y: 71.1; skew-x: 49.7; skew-y: 49.7; scale-x: 0.69; scale-y: 0.69; }
        frame 78 { x: 20.2; y: 71.2; skew-x: 46.1; skew-y: 46.1; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 18; y: 71.3; skew-x: 42.7; skew-y: 42.7; scale-x: 0.691; scale-y: 0.691; }
        frame 80 { x: 18.3; y: 71.7; skew-x: 42.4; skew-y: 42.4; scale-x: 0.69; scale-y: 0.69; }
        frame 81 { x: 18.5; y: 72.1; skew-x: 42.1; skew-y: 42.1; scale-x: 0.691; scale-y: 0.691; }
        frame 82 { x: 18.7; y: 72.4; skew-x: 41.7; skew-y: 41.7; scale-x: 0.692; scale-y: 0.692; }
        frame 83 { x: 20.9; y: 73.7; skew-x: 46.8; skew-y: 46.8; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 85 { x: 21.6; y: 72.2; skew-x: 48.9; skew-y: 48.9; scale-x: 0.691; scale-y: 0.691; }
        frame 86 { x: 22.2; y: 70.8; skew-x: 50.9; skew-y: 50.9; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 23; y: 69.3; skew-x: 53.1; skew-y: 53.1; }
        frame 88 { x: 23.7; y: 67.8; skew-x: 55.1; skew-y: 55.1; scale-x: 0.692; scale-y: 0.692; }
        frame 89 { x: 24.3; y: 67; skew-x: 54.7; skew-y: 54.7; scale-x: 0.691; scale-y: 0.691; }
        frame 90 { x: 24.9; y: 66.3; skew-x: 54.2; skew-y: 54.2; scale-x: 0.69; scale-y: 0.69; }
        frame 91 { x: 25.5; y: 65.6; skew-x: 53.9; skew-y: 53.9; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 26.1; y: 64.8; skew-x: 53.3; skew-y: 53.3; scale-x: 0.691; scale-y: 0.691; }
        frame 93 { x: 26.5; y: 64.3; skew-x: 55.9; skew-y: 55.9; scale-x: 0.69; scale-y: 0.69; }
        frame 94 { x: 27; y: 64; skew-x: 58.6; skew-y: 58.6; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 27.5; y: 63.5; skew-x: 61.2; skew-y: 61.2; }
        frame 96 { x: 27.7; y: 63; skew-x: 63.7; skew-y: 63.7; }
        frame 97 { x: 28.3; y: 62; skew-x: 68.7; skew-y: 68.7; scale-y: 0.689; }
        frame 98 { x: 28.7; y: 61; skew-x: 73.5; skew-y: 73.7; scale-y: -10000; }
        frame 99 { x: 29.2; y: 60; skew-x: 78.4; skew-y: 78.5; }
        frame 100 { x: 29.3; y: 59.1; skew-x: 83.1; skew-y: 83.3; }
        frame 101 { x: 28.2; y: 62.3; skew-x: 74.4; skew-y: 74.5; scale-y: 0.688; }
        frame 102 { x: 26.9; y: 65.7; skew-x: 65.4; skew-y: 65.7; scale-x: 0.689; scale-y: 0.687; }
        frame 103 { x: 25.5; y: 69.2; skew-x: 56.6; skew-y: 56.9; scale-x: 0.688; scale-y: -10000; }
        frame 104 { x: 24; y: 72.8; skew-x: 47.7; skew-y: 47.9; scale-x: 0.689; }
        frame 105 { x: 25.8; y: 70.2; skew-x: 46.9; skew-y: 47.1; scale-x: 0.688; scale-y: 0.686; }
        frame 106 { x: 27.6; y: 67.6; skew-x: 45.9; skew-y: 46.1; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 29.2; y: 65; skew-x: 45.1; skew-y: 45.4; }
        frame 108 { x: 30.9; y: 62.3; skew-x: 44.2; skew-y: 44.4; scale-x: 0.689; scale-y: 0.687; }
        frame 109 { x: 30.2; y: 63.3; skew-x: 40.4; skew-y: 40.6; scale-x: 0.687; scale-y: 0.685; }
        frame 110 { x: 29.5; y: 64.1; skew-x: 36.6; skew-y: 36.8; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 28.8; y: 65.1; skew-x: 32.8; skew-y: 33.1; }
        frame 112 { x: 28.1; y: 66.3; skew-x: 29.1; skew-y: 29.3; scale-x: 0.688; scale-y: 0.686; }
        frame 113 { x: 28.8; y: 65.3; skew-x: 27.6; skew-y: 27.8; scale-x: 0.687; scale-y: 0.685; }
        frame 114 { x: 29.6; y: 64.5; skew-x: 26.1; skew-y: 26.3; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 30.3; y: 63.6; skew-x: 24.8; skew-y: 24.8; scale-x: 0.686; }
        frame 116 { x: 31.2; y: 62.5; skew-x: 23.3; skew-y: 23.5; scale-x: 0.687; }
        frame 117 { x: 30.4; y: 64.8; skew-x: 28.1; skew-y: 28.3; scale-x: 0.686; scale-y: 0.684; }
        frame 118 { x: 29.7; y: 67; skew-x: 32.8; skew-y: 33.1; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 28.8; y: 69.3; skew-x: 37.6; skew-y: 37.8; scale-x: 0.685; scale-y: 0.683; }
        frame 120 { x: 28.1; y: 71.5; skew-x: 42.4; skew-y: 42.6; scale-x: 0.686; scale-y: 0.684; }
        frame 121 { x: 26.3; y: 72.2; skew-x: 43.4; skew-y: 43.6; scale-x: -10000; scale-y: 0.685; }
        frame 122 { x: 24.5; y: 72.8; skew-x: 44.6; skew-y: 44.6; scale-x: 0.688; scale-y: 0.687; }
        frame 123 { x: 22.8; y: 73.4; skew-x: 45.6; skew-y: 45.7; scale-x: 0.69; scale-y: 0.689; }
        frame 124 { x: 20.9; y: 73.7; skew-x: 46.8; skew-y: 46.8; scale-x: 0.692; scale-y: 0.692; }
        frame 125 { x: 20.7; y: 72.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 20.8; y: 76.3; skew-x: 39.1; skew-y: 39.1; scale-x: 0.691; scale-y: 0.691; }
        frame 127 { x: 21; y: 80; skew-x: 31.3; skew-y: 31.3; scale-x: 0.69; scale-y: 0.69; }
        frame 128 { x: 21.1; y: 83.7; skew-x: 23.7; skew-y: 23.7; scale-x: 0.691; scale-y: 0.691; }
        frame 129 { x: 22.6; y: 89.1; skew-x: 16.3; skew-y: 16.3; scale-x: 0.69; scale-y: 0.69; }
        frame 130 { x: 24.2; y: 94.5; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: 25.9; y: 100.1; skew-x: 1.7; skew-y: 1.7; }
        frame 132 { x: 29.9; y: 96.7; skew-x: 5.5; skew-y: 5.5; }
        frame 133 { x: 34; y: 93.5; skew-x: 9.5; skew-y: 9.5; scale-x: 0.689; scale-y: 0.689; }
        frame 134 { x: 37.9; y: 90.2; skew-x: 13.5; skew-y: 13.5; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 43.9; y: 86.5; skew-x: 20.1; skew-y: 20.1; scale-x: 0.688; scale-y: 0.688; }
        frame 136 { x: 50; y: 83; skew-x: 26.8; skew-y: 26.8; scale-x: 0.687; scale-y: 0.687; }
        frame 137 { x: 56; y: 79.6; skew-x: 33.5; skew-y: 33.5; scale-x: -10000; scale-y: -10000; }
        frame 138 { x: 66.8; y: 77.2; skew-x: 47.6; skew-y: 47.6; scale-x: 0.686; scale-y: 0.686; }
        frame 139 { x: 77.4; y: 75.3; skew-x: 61.7; skew-y: 61.7; scale-x: 0.685; scale-y: 0.685; }
        frame 140 { x: 87.4; y: 74; skew-x: 75.6; skew-y: 75.6; scale-x: 0.686; scale-y: 0.686; }
        frame 141 { x: 94.4; y: 78.1; skew-x: 84; skew-y: 84; scale-x: 0.685; scale-y: 0.685; }
        frame 142 { x: 101.2; y: 82.3; skew-x: 91.8; skew-y: 91.8; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 107.8; y: 86.6; skew-x: 100.2; skew-y: 100.2; }
        frame 144 { x: 121.1; y: 93; skew-x: 148.8; skew-y: 148.8; scale-x: 0.684; scale-y: 0.684; }
        frame 145 { x: 133.5; y: 102.5; skew-x: 210.3; skew-y: 210.3; scale-x: 0.682; scale-y: 0.682; }
        frame 146 { x: 137.4; y: 114.8; skew-x: 288.7; skew-y: 288.7; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 138.6; y: 116.8; skew-x: 291.6; skew-y: 286.2; scale-x: 0.623; scale-y: 0.704; }
        frame 148 { x: 138.1; y: 115.8; skew-x: 287.3; skew-y: 283.8; scale-x: 0.642; scale-y: 0.696; }
        frame 149 { x: 137.6; y: 114.9; skew-x: 283; skew-y: 281.3; scale-x: 0.662; scale-y: 0.689; }
        frame 150 { x: 137.1; y: 113.9; skew-x: 278.9; skew-y: 278.9; scale-x: 0.682; scale-y: 0.682; }
        frame 151 { x: 137.2; y: 114.5; skew-x: 283.8; skew-y: 283.8; scale-x: -10000; scale-y: -10000; }
        frame 152 { x: 137.4; y: 114.8; skew-x: 288.7; skew-y: 288.7; }
        frame 153 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_innerarm_lower";
        frame-count: 155;
        frame 0 { x: 12.1; y: 82.4; scale-x: 0.7; scale-y: 0.7; image: IMAGE_REANIM_ZOMBIE_BALLOON_INNERARM_LOWER; }
        frame 1 { x: 10; y: 83; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 8; y: 83.7; skew-x: -5.2; skew-y: -5.2; scale-x: 0.699; scale-y: 0.699; }
        frame 3 { x: 6; y: 84.5; skew-x: -7.9; skew-y: -7.9; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 8.1; y: 87.4; skew-x: -5.2; skew-y: -5.2; }
        frame 5 { x: 10; y: 90.3; skew-x: -2.4; skew-y: -2.4; scale-x: 0.7; scale-y: 0.7; }
        frame 6 { x: 12.1; y: 93.2; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 12.3; y: 94; skew-x: -0; skew-y: -0; }
        frame 8 { x: 12.6; y: 94.9; skew-x: -0.2; skew-y: -0.2; }
        frame 9 { x: 12.8; y: 95.8; skew-x: -0.6; skew-y: -0.6; }
        frame 10 { x: 12.6; y: 91.3; skew-x: -0.2; skew-y: -0.2; }
        frame 11 { x: 12.3; y: 86.9; skew-x: -0; skew-y: -0; }
        frame 12 { x: 12.1; y: 82.4; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: 12.6; y: 83.2; skew-x: -1.2; skew-y: -1.2; }
        frame 15 { x: 13.1; y: 83.8; skew-x: -2.4; skew-y: -2.4; }
        frame 16 { x: 13.6; y: 84.6; skew-x: -3.7; skew-y: -3.7; }
        frame 17 { x: 14.1; y: 85.3; skew-x: -4.9; skew-y: -4.9; }
        frame 18 { x: 14.7; y: 86.1; skew-x: -6.2; skew-y: -6.2; scale-x: 0.699; scale-y: 0.699; }
        frame 19 { x: 15.2; y: 86.8; skew-x: -7.4; skew-y: -7.4; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 15.7; y: 87.6; skew-x: -8.8; skew-y: -8.8; scale-x: 0.7; scale-y: 0.7; }
        frame 21 { x: 4.8; y: 85.1; skew-x: -2.4; skew-y: -2.4; scale-x: 0.699; scale-y: 0.699; }
        frame 22 { x: -5.9; y: 82.8; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -16.7; y: 80.5; skew-x: 9.8; skew-y: 9.8; }
        frame 24 { x: -27.4; y: 78.2; skew-x: 16.2; skew-y: 16.2; }
        frame 25 { x: -19.4; y: 81.6; skew-x: 6.3; skew-y: 6.3; }
        frame 26 { x: -11.5; y: 85.3; skew-x: -3.4; skew-y: -3.4; }
        frame 27 { x: -3.1; y: 89.1; skew-x: -13.3; skew-y: -13.3; }
        frame 28 { x: -6.6; y: 88; skew-x: -8.7; skew-y: -8.7; }
        frame 29 { x: -9.9; y: 86.8; skew-x: -4.2; skew-y: -4.2; scale-x: 0.7; scale-y: 0.7; }
        frame 30 { x: -13.3; y: 85.9; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 12.1; y: 83.2; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: -10000; y: -10000; }
        frame 33 { x: 10.7; y: 81.5; skew-x: 19.3; skew-y: 19.3; scale-x: 0.696; scale-y: 0.696; }
        frame 34 { x: 9.4; y: 80.8; skew-x: 38.7; skew-y: 38.7; scale-x: 0.693; scale-y: 0.693; }
        frame 35 { x: 12.1; y: 75.7; skew-x: 76.7; skew-y: 76.7; scale-x: 0.691; scale-y: 0.691; }
        frame 36 { x: -10000; y: 73.2; skew-x: 114.5; skew-y: 114.5; scale-x: 0.69; scale-y: 0.69; }
        frame 37 { x: 7.9; y: 75.4; skew-x: 134.6; skew-y: 134.9; scale-x: 0.671; scale-y: 0.669; }
        frame 38 { x: 3; y: 96.1; skew-x: 124.9; skew-y: 125.2; scale-x: 0.653; scale-y: 0.65; }
        frame 39 { x: 1.5; y: 120.5; skew-x: 84.5; skew-y: 84.9; scale-x: 0.637; scale-y: 0.633; }
        frame 40 { x: -0.7; y: 119.8; skew-x: 71; skew-y: 74.4; scale-x: 0.612; scale-y: 0.65; }
        frame 41 { x: 3.1; y: 111.5; skew-x: 51.9; skew-y: 52.9; scale-x: 0.644; scale-y: 0.625; }
        frame 42 { x: 6; y: 104.8; skew-x: 25; skew-y: 26.3; scale-x: 0.647; scale-y: 0.62; }
        frame 43 { x: 9.2; y: 99.8; skew-x: -1.7; skew-y: -0.2; scale-x: 0.651; scale-y: 0.617; }
        frame 44 { x: 12.8; y: 94.2; skew-x: 0.1; skew-y: 1.5; scale-x: 0.65; scale-y: 0.616; }
        frame 45 { x: 16.4; y: 88.6; skew-x: 2.2; skew-y: 3.7; scale-x: 0.649; scale-y: -10000; }
        frame 46 { x: 16.1; y: 78.5; skew-x: -0.9; skew-y: 0.5; scale-x: -10000; scale-y: 0.615; }
        frame 47 { x: 27.6; y: 60.5; skew-x: 57.4; skew-y: 58.9; scale-x: 0.646; scale-y: 0.613; }
        frame 48 { x: 42.9; y: 48.9; skew-x: 115.6; skew-y: 117.1; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 41.1; y: 51; skew-x: 127.8; skew-y: 129.3; scale-y: 0.611; }
        frame 50 { x: 39.1; y: 53; skew-x: 140; skew-y: 141.5; scale-x: 0.648; scale-y: 0.612; }
        frame 51 { x: 33; y: 60.5; skew-x: 131.6; skew-y: 133.1; scale-x: 0.65; scale-y: -10000; }
        frame 52 { x: 26.6; y: 68.1; skew-x: 123.1; skew-y: 124.8; scale-x: 0.653; scale-y: 0.613; }
        frame 53 { x: 20; y: 75.6; skew-x: 114.8; skew-y: 116.5; scale-x: 0.656; scale-y: 0.614; }
        frame 54 { x: 13.3; y: 83.2; skew-x: 106.4; skew-y: 108.2; scale-x: 0.66; scale-y: 0.616; }
        frame 55 { x: 13; y: 84.8; skew-x: 96; skew-y: 97.8; scale-x: 0.659; scale-y: 0.615; }
        frame 56 { x: 12.3; y: 86.8; skew-x: 85.9; skew-y: 87.7; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 13.4; y: 84.7; skew-x: 96; skew-y: 97.8; }
        frame 58 { x: 14.5; y: 82.9; skew-x: 106.4; skew-y: 108.2; scale-x: 0.66; scale-y: 0.616; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 14.8; y: 82.3; skew-x: 107; skew-y: 108.8; scale-x: 0.659; }
        frame 61 { x: 15; y: 81.8; skew-x: 107.7; skew-y: 109.5; scale-x: 0.66; }
        frame 62 { x: 14.3; y: 80.2; skew-x: 109.6; skew-y: 111.3; scale-x: 0.659; }
        frame 63 { x: 13.8; y: 78.5; skew-x: 111.6; skew-y: 113.3; scale-x: -10000; scale-y: 0.615; }
        frame 64 { x: 13.2; y: 77; skew-x: 113.6; skew-y: 115.3; scale-x: 0.66; scale-y: 0.616; }
        frame 65 { x: 12.5; y: 78.3; skew-x: 111.3; skew-y: 113.1; scale-x: 0.659; scale-y: 0.615; }
        frame 66 { x: 11.9; y: 79.8; skew-x: 109; skew-y: 110.8; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 11.2; y: 81.3; skew-x: 106.8; skew-y: 108.6; scale-x: 0.66; scale-y: 0.616; }
        frame 68 { x: 11.9; y: 82.1; skew-x: 106.6; skew-y: 108.3; scale-x: 0.659; scale-y: 0.615; }
        frame 69 { x: 12.5; y: 82.7; skew-x: 106.5; skew-y: -10000; scale-x: -10000; scale-y: 0.616; }
        frame 70 { x: 13.3; y: 83.4; skew-x: 106.4; skew-y: 108.2; scale-x: 0.66; scale-y: -10000; }
        frame 71 { x: 15.2; y: 82.7; skew-x: 110.3; skew-y: 112; scale-x: 0.659; }
        frame 72 { x: 17.1; y: 82.2; skew-x: 114.1; skew-y: 115.8; scale-x: -10000; scale-y: 0.615; }
        frame 73 { x: 18.9; y: 81.4; skew-x: 118.1; skew-y: 119.8; scale-x: 0.66; scale-y: 0.616; }
        frame 74 { x: 18.8; y: 82; skew-x: 125.1; skew-y: 126.8; scale-x: 0.658; scale-y: 0.615; }
        frame 75 { x: 18.6; y: 82.4; skew-x: 131.9; skew-y: 133.6; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 18.2; y: 82.9; skew-x: 138.9; skew-y: 140.7; scale-x: 0.659; }
        frame 77 { x: 17.2; y: 82.8; skew-x: 135.9; skew-y: 137.7; scale-x: 0.658; scale-y: 0.614; }
        frame 78 { x: 16.1; y: 82.7; skew-x: 133.1; skew-y: 134.8; scale-x: 0.657; scale-y: -10000; }
        frame 79 { x: 15.2; y: 82.6; skew-x: 130.1; skew-y: 131.8; scale-x: 0.658; scale-y: 0.615; }
        frame 80 { x: 14.7; y: -10000; skew-x: 122.1; skew-y: 123.9; scale-x: -10000; scale-y: 0.614; }
        frame 81 { x: 14.1; skew-x: 114.3; skew-y: 116; scale-x: 0.659; scale-y: 0.615; }
        frame 82 { x: 13.3; y: 82.4; skew-x: 106.4; skew-y: 108.2; scale-x: 0.66; scale-y: 0.616; }
        frame 83 { x: 14.5; y: 82.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: -10000; y: -10000; }
        frame 85 { x: 15.2; y: 81.3; skew-x: 111.1; skew-y: 112.8; scale-x: 0.659; scale-y: 0.615; }
        frame 86 { x: 15.7; y: 79.8; skew-x: 115.8; skew-y: 117.6; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 16.3; y: 78.2; skew-x: 120.6; skew-y: 122.3; }
        frame 88 { x: 16.9; y: 76.7; skew-x: 125.3; skew-y: 127.1; scale-y: 0.616; }
        frame 89 { x: 17.4; y: 75.9; skew-x: 123.6; skew-y: 125.4; scale-x: 0.658; scale-y: 0.615; }
        frame 90 { x: 18; y: 75; skew-x: 122.1; skew-y: 123.8; scale-x: -10000; scale-y: 0.614; }
        frame 91 { x: 18.5; y: 74.2; skew-x: 120.6; skew-y: 122.3; scale-y: -10000; }
        frame 92 { x: 18.9; y: 73.4; skew-x: 119; skew-y: 120.7; scale-x: 0.659; scale-y: 0.615; }
        frame 93 { x: 18.3; y: 72.2; skew-x: 115.1; skew-y: 116.8; scale-x: 0.657; scale-y: 0.614; }
        frame 94 { x: 17.6; y: 70.9; skew-x: 111.3; skew-y: 113.1; scale-x: -10000; scale-y: 0.613; }
        frame 95 { x: 16.9; y: 69.7; skew-x: 107.5; skew-y: 109.3; scale-y: -10000; }
        frame 96 { x: 16.1; y: 68.5; skew-x: 103.8; skew-y: 105.6; }
        frame 97 { x: 15.4; y: 66.1; skew-x: 101.3; skew-y: 103; scale-x: 0.656; }
        frame 98 { x: 14.9; y: 63.5; skew-x: 98.8; skew-y: 100.6; scale-x: 0.655; }
        frame 99 { x: 14; y: 61.1; skew-x: 96.3; skew-y: 98.3; scale-x: -10000; }
        frame 100 { x: 13.3; y: 58.7; skew-x: 93.9; skew-y: 95.8; scale-x: 0.654; }
        frame 101 { x: 13.1; y: 64.4; skew-x: 89; skew-y: 90.8; scale-x: -10000; scale-y: 0.612; }
        frame 102 { x: 12.9; y: 70.2; skew-x: 84.2; skew-y: 86.2; scale-x: 0.653; scale-y: -10000; }
        frame 103 { x: 12.6; y: 76; skew-x: 79.2; skew-y: 81.2; scale-x: 0.652; scale-y: 0.611; }
        frame 104 { x: 12.1; y: 81.7; skew-x: 74.3; skew-y: 76.2; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 14.2; y: 79.3; skew-x: 74.5; skew-y: 76.5; }
        frame 106 { x: 16.4; y: 76.8; skew-x: 74.7; skew-y: 76.7; scale-x: 0.651; scale-y: 0.61; }
        frame 107 { x: 18.5; y: 74.5; skew-x: 75; skew-y: 76.9; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 20.5; y: 72; skew-x: 75.1; skew-y: 77; scale-x: 0.652; }
        frame 109 { x: 20.7; y: 73.5; skew-x: 72.2; skew-y: 74.2; scale-x: 0.651; }
        frame 110 { x: 20.9; y: 75; skew-x: 69.2; skew-y: 71.2; scale-x: 0.65; scale-y: 0.609; }
        frame 111 { x: 21.2; y: 76.6; skew-x: 66.2; skew-y: 68.2; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 21.4; y: 78; skew-x: 63.2; skew-y: 65.1; scale-x: 0.651; scale-y: 0.61; }
        frame 113 { x: 22.8; y: 77.1; skew-x: 64.5; skew-y: 66.4; scale-x: 0.65; scale-y: 0.609; }
        frame 114 { x: 24.3; y: 76.1; skew-x: 65.7; skew-y: 67.7; scale-x: 0.649; scale-y: 0.608; }
        frame 115 { x: 25.5; y: 75.1; skew-x: 67; skew-y: 69; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 26.9; y: 74.1; skew-x: 68.3; skew-y: 70.2; scale-x: 0.65; scale-y: 0.609; }
        frame 117 { x: 25.4; y: 75.8; skew-x: 73.4; skew-y: 75.2; scale-x: 0.649; scale-y: 0.608; }
        frame 118 { x: 23.5; y: 77.6; skew-x: 78.4; skew-y: 80.2; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 21.8; y: 79.5; skew-x: 83.4; skew-y: 85.2; scale-x: 0.648; scale-y: 0.607; }
        frame 120 { x: 19.9; y: 81.3; skew-x: 88.3; skew-y: 90.2; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 18.5; y: 81.6; skew-x: 92.8; skew-y: 94.5; scale-x: 0.651; scale-y: 0.609; }
        frame 122 { x: 17.1; y: 82; skew-x: 97.3; skew-y: 99; scale-x: 0.654; scale-y: 0.611; }
        frame 123 { x: 15.7; y: 82.2; skew-x: 101.8; skew-y: 103.6; scale-x: 0.657; scale-y: 0.614; }
        frame 124 { x: 14.5; y: 82.9; skew-x: 106.4; skew-y: 108.2; scale-x: 0.66; scale-y: 0.616; }
        frame 125 { x: 14; y: 82.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 15.1; y: 86.5; skew-x: 92.1; skew-y: 93.8; scale-x: 0.659; }
        frame 127 { x: 15.8; y: 90.8; skew-x: 78.2; skew-y: 79.9; scale-x: 0.658; scale-y: 0.615; }
        frame 128 { x: 16.1; y: 95.7; skew-x: 63.8; skew-y: 65.5; scale-x: -10000; scale-y: -10000; }
        frame 129 { x: 19.3; y: 100.8; skew-x: 54.2; skew-y: 55.9; scale-x: 0.657; scale-y: 0.613; }
        frame 130 { x: 22.4; y: 106.4; skew-x: 44.6; skew-y: 46.4; scale-x: 0.656; scale-y: 0.612; }
        frame 131 { x: 25.4; y: 112.1; skew-x: 35; skew-y: 36.8; scale-x: -10000; scale-y: 0.613; }
        frame 132 { x: 27.9; y: 109.3; skew-x: 32.8; skew-y: 34.6; scale-x: 0.655; scale-y: 0.611; }
        frame 133 { x: 30.4; y: 106.5; skew-x: 30.6; skew-y: 32.4; scale-x: 0.654; scale-y: -10000; }
        frame 134 { x: 33; y: 103.7; skew-x: 28.6; skew-y: 30.3; scale-x: -10000; }
        frame 135 { x: 37.3; y: 99.6; skew-x: 30.8; skew-y: 32.6; scale-x: 0.653; scale-y: 0.61; }
        frame 136 { x: 41.5; y: 95.5; skew-x: 33.1; skew-y: 34.9; scale-x: 0.652; scale-y: 0.609; }
        frame 137 { x: 45.8; y: 91.2; skew-x: 35.6; skew-y: 37.3; scale-x: 0.653; scale-y: -10000; }
        frame 138 { x: 54.7; y: 85.6; skew-x: 49.6; skew-y: 51.4; scale-x: 0.651; scale-y: 0.608; }
        frame 139 { x: 63.5; y: 80.5; skew-x: 63.7; skew-y: 65.4; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 72.1; y: 75.8; skew-x: 77.7; skew-y: 79.4; }
        frame 141 { x: 79.3; y: 77.7; skew-x: 86; skew-y: 87.7; }
        frame 142 { x: 86.1; y: 79.8; skew-x: 94; skew-y: 95.8; scale-x: 0.65; scale-y: 0.607; }
        frame 143 { x: 93; y: 82; skew-x: 102.2; skew-y: 104; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 114.8; y: 79; skew-x: 150.9; skew-y: 152.6; scale-x: 0.649; scale-y: 0.606; }
        frame 145 { x: 142.8; y: 90.3; skew-x: 212.4; skew-y: 214.1; scale-x: 0.648; scale-y: 0.605; }
        frame 146 { x: 151.4; y: 121.6; skew-x: 290.8; skew-y: 292.5; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 153.1; y: 123; skew-x: 293.9; skew-y: 289.5; scale-x: 0.593; scale-y: 0.62; }
        frame 148 { x: 152.6; y: 121.3; skew-x: 292.8; skew-y: 290.3; scale-x: 0.61; scale-y: 0.614; }
        frame 149 { x: 152.4; y: 119.7; skew-x: 291.6; skew-y: 291.3; scale-x: 0.628; scale-y: 0.609; }
        frame 150 { x: 151.9; y: 118; skew-x: 290.5; skew-y: 292.3; scale-x: 0.647; scale-y: 0.604; }
        frame 151 { x: 151.6; y: 119.8; skew-x: 290.6; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 152 { x: 151.4; y: 121.6; skew-x: 290.8; skew-y: 292.5; scale-x: 0.648; scale-y: 0.605; }
        frame 153 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_string";
        frame-count: 155;
        frame 0 { x: 38.8; y: 26.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_STRING; }
        frame 1 { x: -10000; y: 27.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 28.5; }
        frame 3 { y: 29.6; }
        frame 4 { y: 30.7; }
        frame 5 { y: 31.7; }
        frame 6 { y: 32.8; }
        frame 7 { y: 31.7; }
        frame 8 { y: 30.7; }
        frame 9 { y: 29.6; }
        frame 10 { y: 28.5; }
        frame 11 { y: 27.4; }
        frame 12 { y: 26.3; }
        frame 13 { y: -10000; }
        frame 14 { x: 36.5; y: 26.9; skew-x: -8.2; skew-y: -8.2; scale-x: 0.799; scale-y: 0.824; }
        frame 15 { x: 34.5; y: 27.7; skew-x: -16.4; skew-y: -16.4; scale-x: -10000; scale-y: 0.848; }
        frame 16 { x: 32.4; y: 28.5; skew-x: -24.7; skew-y: -24.7; scale-x: 0.798; scale-y: 0.871; }
        frame 17 { x: 30.4; y: 29.7; skew-x: -33; skew-y: -33; scale-x: 0.797; scale-y: 0.895; }
        frame 18 { x: 28.5; y: 30.8; skew-x: -41.5; skew-y: -41.5; scale-x: -10000; scale-y: 0.919; }
        frame 19 { x: 26.7; y: 32.1; skew-x: -49.8; skew-y: -49.8; scale-y: 0.944; }
        frame 20 { x: 25; y: 33.5; skew-x: -58.1; skew-y: -58.1; scale-x: 0.798; scale-y: 0.969; }
        frame 21 { x: 20.6; y: 30.3; skew-x: -39.3; skew-y: -39.3; scale-x: 0.797; scale-y: 0.925; }
        frame 22 { x: 16.9; y: 27.7; skew-x: -20.5; skew-y: -20.5; scale-x: 0.798; scale-y: 0.883; }
        frame 23 { x: 13.6; y: 25.8; skew-x: -1.7; skew-y: -1.7; scale-x: 0.799; scale-y: 0.842; }
        frame 24 { x: 10.5; y: 24.9; skew-x: 16.9; skew-y: 16.9; scale-x: -10000; scale-y: 0.799; }
        frame 25 { x: 11.8; y: 25.1; skew-x: 9.8; skew-y: 9.8; scale-y: -10000; }
        frame 26 { x: 13.2; y: 25.5; skew-x: 2.8; skew-y: 2.8; }
        frame 27 { x: 14.5; y: 26; skew-x: -4.2; skew-y: -4.2; scale-x: 0.8; scale-y: 0.8; }
        frame 28 { x: 14.1; y: 26.2; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 13.7; y: -10000; skew-x: -1.2; skew-y: -1.2; }
        frame 30 { x: 13.3; y: 26.3; skew-x: 0; skew-y: 0; }
        frame 31 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_bottom";
        frame-count: 155;
        frame 0 { x: 35.9; y: 28.9; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_BOTTOM; }
        frame 1 { x: 36.3; y: 29.5; scale-x: 0.751; scale-y: 1.01; image: none; }
        frame 2 { x: 36.7; y: 30.1; scale-x: 0.702; scale-y: 1.219; }
        frame 3 { x: 37.1; y: 30.7; scale-x: 0.653; scale-y: 1.429; }
        frame 4 { x: 36.7; y: 33.6; scale-x: 0.702; scale-y: 1.219; }
        frame 5 { x: 36.3; y: 36.6; scale-x: 0.751; scale-y: 1.01; }
        frame 6 { x: 35.9; y: 39.6; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { x: 35.6; y: 38.1; scale-x: 0.825; scale-y: 0.779; }
        frame 8 { x: -10000; y: 36.5; scale-x: 0.85; scale-y: 0.759; }
        frame 9 { x: 35.5; y: 35; skew-x: -0.1; scale-x: 0.875; scale-y: 0.738; }
        frame 10 { x: 35.6; y: 33; skew-x: 0; scale-x: 0.85; scale-y: 0.759; }
        frame 11 { x: 35.8; y: 30.9; skew-x: -10000; scale-x: 0.825; scale-y: 0.779; }
        frame 12 { x: 35.9; y: 28.9; scale-x: 0.8; scale-y: 0.8; }
        frame 13 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 33.9; y: 28.5; skew-x: -1.4; skew-y: -3.7; scale-x: 0.774; scale-y: 0.897; }
        frame 15 { x: 31.8; y: 28.1; skew-x: -3; skew-y: -7.5; scale-x: 0.749; scale-y: 0.994; }
        frame 16 { x: 29.8; y: 27.7; skew-x: -4.7; skew-y: -11.4; scale-x: 0.723; scale-y: 1.091; }
        frame 17 { x: 27.7; y: 27.3; skew-x: -6.2; skew-y: -15.2; scale-x: 0.697; scale-y: 1.188; }
        frame 18 { x: 25.5; y: 27; skew-x: -7.9; skew-y: -19; scale-x: 0.672; scale-y: 1.284; }
        frame 19 { x: 23.4; y: 26.6; skew-x: -9.5; skew-y: -23; scale-x: 0.646; scale-y: 1.381; }
        frame 20 { x: 21.3; y: 26.2; skew-x: -11.3; skew-y: -26.8; scale-x: 0.621; scale-y: 1.48; }
        frame 21 { x: 18.2; y: 26.7; skew-x: -7.2; skew-y: -18.7; scale-x: 0.615; scale-y: 1.394; }
        frame 22 { x: 15; y: 27.6; skew-x: -2.9; skew-y: -10.7; scale-x: 0.61; scale-y: 1.309; }
        frame 23 { x: 11.9; y: 28.5; skew-x: 0.8; skew-y: -2.7; scale-x: 0.605; scale-y: 1.225; }
        frame 24 { x: 8.4; y: 29.3; skew-x: 5; skew-y: 5; scale-x: 0.6; scale-y: 1.14; }
        frame 25 { x: 9.8; y: -10000; skew-x: 2.5; skew-y: 2.5; scale-x: 0.597; scale-y: 1.071; }
        frame 26 { x: 11.4; y: 29.2; skew-x: 0; skew-y: 0; scale-x: 0.594; scale-y: 1.002; }
        frame 27 { x: 13.1; y: 29.3; skew-x: -2.2; skew-y: -2.2; scale-x: 0.591; scale-y: 0.932; }
        frame 28 { x: 12.3; y: 29.1; skew-x: -1.4; skew-y: -1.4; scale-x: 0.661; scale-y: 0.888; }
        frame 29 { x: 11.3; y: 29; skew-x: -0.7; skew-y: -0.7; scale-x: 0.73; scale-y: 0.844; }
        frame 30 { x: 10.4; y: 28.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 31 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_top";
        frame-count: 155;
        frame 0 { x: 24.4; y: -12.5; scale-x: 0.6; scale-y: 0.6; image: IMAGE_REANIM_ZOMBIE_BALLOON_TOP; }
        frame 1 { x: 24.7; y: -12.8; scale-x: 0.59; scale-y: 0.609; image: none; }
        frame 2 { x: 25; y: -13; scale-x: 0.58; scale-y: 0.618; }
        frame 3 { x: 25.4; y: -13.2; scale-x: 0.571; scale-y: 0.627; }
        frame 4 { x: 25.1; y: -10.3; scale-x: 0.58; scale-y: 0.618; }
        frame 5 { x: 24.7; y: -7.4; scale-x: 0.59; scale-y: 0.609; }
        frame 6 { x: 24.4; y: -4.5; scale-x: 0.6; scale-y: 0.6; }
        frame 7 { x: 23.9; y: -10000; scale-x: 0.619; scale-y: 0.585; }
        frame 8 { x: 23.4; y: -4.3; scale-x: 0.638; scale-y: 0.569; }
        frame 9 { x: 22.9; y: -4.2; skew-x: -0.1; scale-x: 0.656; scale-y: 0.554; }
        frame 10 { x: 23.4; y: -7; skew-x: 0; scale-x: 0.638; scale-y: 0.569; }
        frame 11 { x: 23.9; y: -9.7; skew-x: -10000; scale-x: 0.619; scale-y: 0.585; }
        frame 12 { x: 24.4; y: -12.5; scale-x: 0.6; scale-y: 0.6; }
        frame 13 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 20.2; y: -12.6; skew-x: -0.9; skew-y: -1.9; scale-x: 0.606; scale-y: 0.603; }
        frame 15 { x: 16; y: -12.9; skew-x: -1.9; skew-y: -3.9; scale-x: 0.612; scale-y: 0.606; }
        frame 16 { x: 11.7; y: -10000; skew-x: -2.9; skew-y: -6.2; scale-x: 0.618; scale-y: 0.608; }
        frame 17 { x: 7.5; skew-x: -3.9; skew-y: -8.2; scale-x: 0.624; scale-y: 0.611; }
        frame 18 { x: 3.3; skew-x: -5; skew-y: -10.2; scale-x: 0.63; scale-y: 0.614; }
        frame 19 { x: -0.9; skew-x: -6; skew-y: -12.4; scale-x: 0.636; scale-y: 0.617; }
        frame 20 { x: -5.1; y: -12.7; skew-x: -7.2; skew-y: -14.5; scale-x: 0.642; scale-y: 0.62; }
        frame 21 { x: -3.8; y: -13.6; skew-x: -4; skew-y: -9.5; scale-x: 0.631; scale-y: 0.621; }
        frame 22 { x: -2.5; y: -14.1; skew-x: -0.9; skew-y: -4.7; scale-x: 0.621; scale-y: 0.623; }
        frame 23 { x: -1.1; y: -14.5; skew-x: 1.8; skew-y: 0; scale-x: 0.61; scale-y: 0.625; }
        frame 24 { x: 0.3; y: -14.6; skew-x: 5; skew-y: 5; scale-x: 0.6; scale-y: 0.626; }
        frame 25 { x: -0.4; y: -14.1; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: 0.623; }
        frame 26 { x: -1.2; y: -13.5; skew-x: 0; skew-y: 0; scale-y: 0.619; }
        frame 27 { x: -1.9; y: -12.9; skew-x: -2.2; skew-y: -2.2; scale-y: 0.616; }
        frame 28 { x: -1.6; y: -10000; skew-x: -1.4; skew-y: -1.4; scale-y: 0.61; }
        frame 29 { x: -1.4; skew-x: -0.7; skew-y: -0.7; scale-y: 0.605; }
        frame 30 { x: -0.9; y: -13; skew-x: 0; skew-y: 0; scale-y: 0.6; }
        frame 31 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_body2";
        frame-count: 155;
        frame 0 { x: 38.5; y: 43.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_BODY2; }
        frame 1 { x: -10000; y: 44.4; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 38.6; y: 45.5; skew-x: -3; skew-y: -3; }
        frame 3 { x: -10000; y: 46.6; skew-x: -4.8; skew-y: -4.8; }
        frame 4 { y: 48.3; skew-x: -3; skew-y: -3; }
        frame 5 { x: 38.5; y: 50; skew-x: -1.4; skew-y: -1.4; }
        frame 6 { x: -10000; y: 51.8; skew-x: 0; skew-y: 0; }
        frame 7 { x: 39; y: 50.6; skew-x: 2; skew-y: 2; }
        frame 8 { x: 39.5; y: 49.7; skew-x: 4.1; skew-y: 4.1; }
        frame 9 { x: 40.1; y: 48.5; skew-x: 6.4; skew-y: 6.4; }
        frame 10 { x: 39.5; y: 46.8; skew-x: 4.1; skew-y: 4.1; }
        frame 11 { x: 39; y: 45; skew-x: 2; skew-y: 2; }
        frame 12 { x: 38.5; y: 43.3; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: 38.4; y: 43.2; skew-x: -0.2; skew-y: -0.2; }
        frame 15 { x: 38.2; y: 43.1; skew-x: -0.4; skew-y: -0.4; }
        frame 16 { x: 38; y: -10000; skew-x: -0.7; skew-y: -0.7; }
        frame 17 { x: 37.9; y: 43; skew-x: -1.2; skew-y: -1.2; }
        frame 18 { x: 37.6; y: -10000; skew-x: -1.4; skew-y: -1.4; }
        frame 19 { x: 37.5; skew-x: -1.7; skew-y: -1.7; }
        frame 20 { x: 37.4; y: 43; skew-x: -2.2; skew-y: -2.2; }
        frame 21 { x: 30.1; y: 42.3; skew-x: 2.5; skew-y: 2.5; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 22.9; y: 41.8; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 15.8; y: 41.3; skew-x: 12; skew-y: 12; }
        frame 24 { x: 8.8; y: 41; skew-x: 16.9; skew-y: 16.9; }
        frame 25 { x: 11; y: 41.4; skew-x: 8.5; skew-y: 8.5; }
        frame 26 { x: 13.4; y: 42.1; skew-x: 0.3; skew-y: 0.3; }
        frame 27 { x: 16.2; y: 43; skew-x: -7.8; skew-y: -7.8; scale-x: 0.8; scale-y: 0.8; }
        frame 28 { x: 15.2; y: -10000; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 14.1; skew-x: -2.4; skew-y: -2.4; }
        frame 30 { x: 13; y: 43.3; skew-x: 0; skew-y: 0; }
        frame 31 { x: 38.5; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: -10000; }
        frame 33 { x: 40.9; y: 53.1; skew-x: 4; skew-y: 4; }
        frame 34 { x: 43.2; y: 63.2; skew-x: 8.1; skew-y: 8.1; }
        frame 35 { x: 44.4; y: 66.3; skew-x: 12.8; skew-y: 12.8; scale-x: 0.799; scale-y: 0.799; }
        frame 36 { x: 45.6; y: 69.5; skew-x: 17.9; skew-y: 17.9; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: -10000; y: 71.2; skew-x: -10000; skew-y: -10000; }
        frame 38 { x: 41.5; y: 74.3; skew-x: 7; skew-y: 5.8; scale-x: 0.832; scale-y: 0.797; }
        frame 39 { x: 37.7; y: 78.1; skew-x: -3.7; skew-y: -5.8; scale-x: 0.866; scale-y: 0.796; }
        frame 40 { x: 40; y: 75.5; skew-x: 2.6; skew-y: 1.5; scale-x: 0.832; scale-y: -10000; }
        frame 41 { x: 42.5; y: 73.1; skew-x: 9.3; skew-y: 9.3; scale-x: 0.797; scale-y: 0.797; }
        frame 42 { x: 43.3; y: 72.5; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 44; y: 71.9; skew-x: 14.3; skew-y: 14.3; scale-x: 0.798; scale-y: 0.798; }
        frame 44 { x: 46; y: 70.3; skew-x: 21.1; skew-y: 21.1; scale-x: 0.797; scale-y: 0.797; }
        frame 45 { x: 48; y: 68.8; skew-x: 28.1; skew-y: 28.1; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 53.5; y: 68.7; skew-x: 42.4; skew-y: 42.4; }
        frame 47 { x: 59.5; y: 69.7; skew-x: 51.4; skew-y: 51.4; scale-x: 0.795; scale-y: 0.795; }
        frame 48 { x: 65.6; y: 71.1; skew-x: 60.3; skew-y: 60.3; scale-x: 0.796; scale-y: 0.796; }
        frame 49 { x: 62.3; y: 70.2; skew-x: 53.2; skew-y: 53.2; scale-x: 0.795; scale-y: 0.795; }
        frame 50 { x: 59; y: 69.5; skew-x: 46.1; skew-y: 46.1; scale-x: 0.796; scale-y: 0.796; }
        frame 51 { x: 55.5; y: 69.2; skew-x: 39.1; skew-y: 39.1; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 52.2; y: 69.1; skew-x: 32.1; skew-y: 32.1; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 48.9; y: 69.2; skew-x: 24.8; skew-y: 24.8; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: 45.6; y: 69.5; skew-x: 17.9; skew-y: 17.9; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: -10000; y: 70; skew-x: 17.8; skew-y: 17.8; scale-x: 0.798; scale-y: 0.798; }
        frame 56 { y: 70.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 45.5; y: 70; }
        frame 58 { x: 45.6; y: 69.5; skew-x: 17.9; skew-y: 17.9; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 46; y: 69.6; skew-x: 18.3; skew-y: 18.3; scale-x: 0.798; scale-y: 0.798; }
        frame 61 { x: 46.3; y: -10000; skew-x: 18.6; skew-y: 18.6; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 46.6; y: 69.8; skew-x: 19.2; skew-y: 19.2; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: 46.8; y: 69.6; skew-x: 19.8; skew-y: 19.8; scale-x: 0.798; scale-y: 0.798; }
        frame 64 { x: 47; y: 69.3; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 65 { y: 69.2; skew-x: 21.5; skew-y: 21.5; scale-x: 0.799; scale-y: 0.799; }
        frame 66 { x: 46.1; y: 69.5; skew-x: 20.3; skew-y: 20.3; scale-x: 0.798; scale-y: 0.798; }
        frame 67 { x: 45.2; y: 69.8; skew-x: 19.3; skew-y: 19.3; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 44.3; y: 70.1; skew-x: 18.2; skew-y: 18.2; scale-x: 0.799; scale-y: 0.799; }
        frame 69 { x: 44.7; y: -10000; skew-x: 18; skew-y: 18; scale-x: 0.798; scale-y: 0.798; }
        frame 70 { x: 45.2; y: 69.8; skew-x: 17.8; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 45.6; y: 69.5; skew-x: 17.9; skew-y: 17.9; scale-x: 0.799; scale-y: 0.799; }
        frame 72 { x: 46; y: 69.6; skew-x: 18.3; skew-y: 18.3; scale-x: 0.798; scale-y: 0.798; }
        frame 73 { x: 46.3; y: -10000; skew-x: 18.6; skew-y: 18.6; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 46.6; y: 69.8; skew-x: 19.2; skew-y: 19.2; scale-x: 0.799; scale-y: 0.799; }
        frame 75 { x: 46.8; y: 69.6; skew-x: 19.8; skew-y: 19.8; scale-x: 0.798; scale-y: 0.798; }
        frame 76 { x: 47; y: 69.3; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 77 { y: 69.2; skew-x: 21.5; skew-y: 21.5; scale-x: 0.799; scale-y: 0.799; }
        frame 78 { x: 46.1; y: 69.5; skew-x: 20.3; skew-y: 20.3; scale-x: 0.798; scale-y: 0.798; }
        frame 79 { x: 45.2; y: 69.8; skew-x: 19.3; skew-y: 19.3; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 44.3; y: 70.1; skew-x: 18.2; skew-y: 18.2; scale-x: 0.799; scale-y: 0.799; }
        frame 81 { x: 44.7; y: -10000; skew-x: 18; skew-y: 18; scale-x: 0.798; scale-y: 0.798; }
        frame 82 { x: 45.2; y: 69.8; skew-x: 17.8; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 45.6; y: 69.5; skew-x: 17.9; skew-y: 17.9; scale-x: 0.799; scale-y: 0.799; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 46.1; y: 68.8; skew-x: 19.6; skew-y: 18.5; scale-y: 0.798; }
        frame 86 { x: 46.6; y: 68.1; skew-x: 21.5; skew-y: 19.3; scale-y: -10000; }
        frame 87 { x: 47.2; y: 67.3; skew-x: 23.3; skew-y: 20.1; scale-x: 0.8; }
        frame 88 { x: 47.7; y: 66.6; skew-x: 25.1; skew-y: 20.9; scale-x: 0.801; scale-y: 0.799; }
        frame 89 { x: 48.9; y: 66.1; skew-x: 28.3; skew-y: 24.1; scale-x: 0.8; scale-y: 0.798; }
        frame 90 { x: 50; y: 65.5; skew-x: 31.6; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 51.1; y: 65.1; skew-x: 34.8; skew-y: 30.6; scale-y: 0.797; }
        frame 92 { x: 52.4; y: 64.8; skew-x: 38; skew-y: 33.7; scale-x: 0.801; scale-y: 0.798; }
        frame 93 { x: 52.6; y: 64.6; skew-x: 38.6; skew-y: 34.3; scale-x: 0.799; scale-y: 0.797; }
        frame 94 { x: 53; y: 64.3; skew-x: 39.1; skew-y: 34.9; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 53.3; y: 63.9; skew-x: 39.9; skew-y: 35.6; }
        frame 96 { x: 53.5; y: 63.6; skew-x: 40.5; skew-y: 36.3; scale-x: 0.8; scale-y: 0.798; }
        frame 97 { x: 53.9; y: 63.5; skew-x: 41.4; skew-y: 37.1; scale-x: 0.799; scale-y: 0.797; }
        frame 98 { x: 54.3; y: 63.4; skew-x: 42.1; skew-y: 37.9; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 54.6; y: 63.2; skew-x: 42.9; skew-y: 38.6; }
        frame 100 { x: 55; y: 63.1; skew-x: 43.8; skew-y: 39.5; scale-x: 0.8; scale-y: 0.798; }
        frame 101 { x: 54.1; y: 64.3; skew-x: 42.1; skew-y: 37.8; scale-x: 0.799; scale-y: 0.797; }
        frame 102 { x: 53.4; y: 65.6; skew-x: 40.3; skew-y: 36.1; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 52.6; y: 66.8; skew-x: 38.6; skew-y: 34.3; }
        frame 104 { x: 51.8; y: 68.1; skew-x: 36.7; skew-y: 32.5; scale-x: 0.8; scale-y: 0.798; }
        frame 105 { x: 52; y: 67.8; skew-x: 38.3; skew-y: 34.1; scale-x: 0.799; scale-y: 0.797; }
        frame 106 { x: 52.1; y: 67.3; skew-x: 39.9; skew-y: 35.6; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 52.3; y: 66.9; skew-x: 41.4; skew-y: 37.1; }
        frame 108 { x: 52.5; y: 66.3; skew-x: 43; skew-y: 38.8; scale-x: 0.8; scale-y: 0.798; }
        frame 109 { x: -10000; y: 66.5; skew-x: 43.6; skew-y: 39.4; scale-x: 0.799; scale-y: 0.797; }
        frame 110 { x: 52.8; y: 66.8; skew-x: 44.1; skew-y: 39.9; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 52.9; y: -10000; skew-x: 44.8; skew-y: 40.4; scale-y: 0.796; }
        frame 112 { x: 53; y: 67.1; skew-x: 45.3; skew-y: 41.1; scale-x: 0.8; scale-y: 0.798; }
        frame 113 { x: 53.3; y: 66.8; skew-x: 45.6; skew-y: 41.4; scale-x: 0.799; scale-y: 0.796; }
        frame 114 { x: 53.5; y: 66.4; skew-x: 46.1; skew-y: 41.9; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 53.8; y: 66.1; skew-x: 46.4; skew-y: 42.1; }
        frame 116 { x: 54; y: 65.7; skew-x: 46.8; skew-y: 42.6; scale-x: 0.8; scale-y: 0.798; }
        frame 117 { x: 53.5; y: 66.2; skew-x: 44.4; skew-y: 40.1; scale-x: 0.799; scale-y: 0.796; }
        frame 118 { x: 52.9; y: 66.8; skew-x: 41.8; skew-y: 37.6; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 52.4; y: 67.5; skew-x: 39.3; skew-y: 35.1; scale-y: 0.797; }
        frame 120 { x: 51.8; y: 68.1; skew-x: 36.7; skew-y: 32.5; scale-x: 0.8; scale-y: 0.798; }
        frame 121 { x: 50.3; y: 68.3; skew-x: 32.1; skew-y: 28.8; scale-x: 0.799; scale-y: 0.797; }
        frame 122 { x: 48.6; y: 68.7; skew-x: 27.3; skew-y: 25.1; scale-x: -10000; scale-y: -10000; }
        frame 123 { x: 47.1; y: 69.1; skew-x: 22.5; skew-y: 21.5; scale-x: 0.798; scale-y: 0.798; }
        frame 124 { x: 45.6; y: 69.5; skew-x: 17.9; skew-y: 17.9; scale-x: 0.799; scale-y: 0.799; }
        frame 125 { x: 46.1; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 46.5; y: 70.2; skew-x: 17.3; skew-y: 17.3; scale-x: 0.798; scale-y: 0.798; }
        frame 127 { x: 47; y: 70.8; skew-x: 17; skew-y: 17; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 47.4; y: 71.5; skew-x: 16.6; skew-y: 16.6; scale-x: 0.799; scale-y: 0.799; }
        frame 129 { x: 48.5; y: 72.6; skew-x: 15.6; skew-y: 15.6; scale-x: 0.798; scale-y: 0.798; }
        frame 130 { x: 49.7; y: 73.7; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: 50.8; y: 74.8; skew-x: 13.9; skew-y: 13.9; }
        frame 132 { x: 57.6; y: 75.3; skew-x: 22; skew-y: 22; scale-x: 0.797; scale-y: 0.797; }
        frame 133 { x: 64.6; y: 76.1; skew-x: 30.3; skew-y: 30.3; scale-x: 0.796; scale-y: 0.796; }
        frame 134 { x: 71.7; y: 77.2; skew-x: 38.5; skew-y: 38.5; scale-x: 0.797; scale-y: 0.797; }
        frame 135 { x: 76.1; y: 79; skew-x: 43.6; skew-y: 43.6; scale-x: 0.795; scale-y: 0.795; }
        frame 136 { x: 80.4; y: 80.8; skew-x: 48.9; skew-y: 48.9; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 84.8; y: 83; skew-x: 54; skew-y: 54; scale-x: 0.796; scale-y: 0.796; }
        frame 138 { x: 91.2; y: 85.5; skew-x: 59.2; skew-y: 59.2; scale-x: 0.795; scale-y: 0.795; }
        frame 139 { x: 97.7; y: 88.2; skew-x: 64.4; skew-y: 64.4; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 104.1; y: 91; skew-x: 69.6; skew-y: 69.6; scale-x: 0.796; scale-y: 0.796; }
        frame 141 { x: 108.3; y: 96.7; skew-x: 77.9; skew-y: 77.9; scale-x: 0.795; scale-y: 0.795; }
        frame 142 { x: 112.1; y: 102.7; skew-x: 86; skew-y: 86; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 115.7; y: 109.1; skew-x: 94.1; skew-y: 94.1; scale-x: 0.794; scale-y: 0.794; }
        frame 144 { x: 118.3; y: 111.6; skew-x: 102.8; skew-y: 102.8; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 120.5; y: 114.2; skew-x: 111.3; skew-y: 111.3; scale-x: 0.793; scale-y: 0.793; }
        frame 146 { x: 122.5; y: 117; skew-x: 120; skew-y: 120; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 122.9; y: 118.8; skew-x: 124; skew-y: 116.3; scale-x: 0.742; scale-y: 0.802; }
        frame 148 { x: 122.7; y: 118.3; skew-x: 122.6; skew-y: 117.5; scale-x: 0.758; scale-y: 0.798; }
        frame 149 { x: 122.6; y: 117.7; skew-x: 121.3; skew-y: 118.6; scale-x: 0.775; scale-y: 0.795; }
        frame 150 { x: 122.5; y: 117; skew-x: 120; skew-y: 120; scale-x: 0.793; scale-y: 0.793; }
        frame 151 { x: -10000; y: -10000; skew-x: 119.9; skew-y: 119.9; scale-x: 0.792; scale-y: 0.792; }
        frame 152 { skew-x: 120; skew-y: 120; scale-x: 0.793; scale-y: 0.793; }
        frame 153 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_body1";
        frame-count: 155;
        frame 0 { x: 16.8; y: 36.6; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_BODY1; }
        frame 1 { x: 16.9; y: 37.1; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 17.1; y: 37.5; skew-x: 3; skew-y: 3; }
        frame 3 { x: 17.2; y: 38; skew-x: 4.6; skew-y: 4.6; }
        frame 4 { x: 17; y: 40.4; skew-x: 3; skew-y: 3; }
        frame 5 { x: 16.9; y: 42.8; skew-x: 1.5; skew-y: 1.5; }
        frame 6 { x: 16.8; y: 45.1; skew-x: 0; skew-y: 0; }
        frame 7 { x: 16.9; y: 44.7; skew-x: -0; skew-y: -0; }
        frame 8 { x: -10000; y: 44.3; skew-x: -0.2; skew-y: -0.2; }
        frame 9 { x: 17; y: 44; skew-x: -0.6; skew-y: -0.6; }
        frame 10 { y: 41.5; skew-x: -0.2; skew-y: -0.2; }
        frame 11 { y: 39; skew-x: -0; skew-y: -0; }
        frame 12 { x: 16.8; y: 36.6; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: 16.5; y: 36.8; skew-x: -0.5; skew-y: -0.5; }
        frame 15 { x: 16.2; y: 37; skew-x: -1.2; skew-y: -1.2; }
        frame 16 { x: 15.9; y: 37.3; skew-x: -1.9; skew-y: -1.9; }
        frame 17 { x: 15.5; y: 37.5; skew-x: -2.7; skew-y: -2.7; }
        frame 18 { x: 15.1; y: 37.6; skew-x: -3.4; skew-y: -3.4; }
        frame 19 { x: 14.9; y: 38; skew-x: -4.2; skew-y: -4.2; }
        frame 20 { x: 14.6; y: 38.1; skew-x: -5; skew-y: -5; }
        frame 21 { x: 7.1; y: 36.7; skew-x: -1.7; skew-y: -1.7; }
        frame 22 { x: -0.1; y: 35.3; skew-x: 1.3; skew-y: 1.3; }
        frame 23 { x: -7.5; y: 34.1; skew-x: 4.3; skew-y: 4.3; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { x: -14.8; y: 33; skew-x: 7.6; skew-y: 7.6; scale-x: 0.8; scale-y: 0.8; }
        frame 25 { x: -12.3; y: 34.9; skew-x: 3.1; skew-y: 3.1; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: -9.4; y: 36.9; skew-x: -0.9; skew-y: -0.9; }
        frame 27 { x: -6.7; y: 39; skew-x: -5.5; skew-y: -5.5; }
        frame 28 { x: -7.3; y: 38; skew-x: -3.5; skew-y: -3.5; }
        frame 29 { x: -8; y: 37.3; skew-x: -1.7; skew-y: -1.7; }
        frame 30 { x: -8.6; y: 36.6; skew-x: 0; skew-y: 0; }
        frame 31 { x: 16.8; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: -10000; }
        frame 33 { x: 23.4; y: 39; skew-x: 11.3; skew-y: 11.3; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 30.5; y: 42.1; skew-x: 22.6; skew-y: 22.6; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 34.9; y: 43.3; skew-x: 30.6; skew-y: 30.6; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: 39.4; y: 44.6; skew-x: 38.4; skew-y: 38.4; scale-x: 0.798; scale-y: 0.798; }
        frame 37 { x: 38; y: 47.9; skew-x: 34.9; skew-y: 34.9; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 25.3; y: 61.6; skew-x: 15.8; skew-y: 15.8; scale-x: 0.796; scale-y: 0.796; }
        frame 39 { x: 13.8; y: 78; skew-x: -2.9; skew-y: -2.9; scale-x: 0.794; scale-y: 0.794; }
        frame 40 { x: 14.2; y: 76.2; skew-x: 0.6; skew-y: 0.9; scale-x: 0.825; scale-y: 0.755; }
        frame 41 { x: 22.6; y: 64.1; skew-x: 12.5; skew-y: 12.5; scale-x: 0.795; scale-y: 0.795; }
        frame 42 { x: 27.5; y: 57.8; skew-x: 20.3; skew-y: 20.3; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 32.4; y: 51.8; skew-x: 28.1; skew-y: 28.1; scale-x: 0.796; scale-y: 0.796; }
        frame 44 { x: 39; y: 47.6; skew-x: 38.3; skew-y: 38.3; scale-x: 0.794; scale-y: 0.794; }
        frame 45 { x: 45.6; y: 44.3; skew-x: 48.6; skew-y: 48.6; scale-x: 0.795; scale-y: 0.795; }
        frame 46 { x: 62.5; y: 45.5; skew-x: 73.7; skew-y: 73.7; scale-x: 0.794; scale-y: 0.794; }
        frame 47 { x: 76.4; y: 51.1; skew-x: 92.3; skew-y: 92.3; scale-x: 0.793; scale-y: 0.793; }
        frame 48 { x: 88; y: 58.8; skew-x: 111.1; skew-y: 111.1; scale-x: 0.792; scale-y: 0.792; }
        frame 49 { x: 86.1; y: 58.9; skew-x: 110.8; skew-y: 110.8; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 84.3; y: -10000; skew-x: 110.5; skew-y: 110.5; scale-x: 0.793; scale-y: 0.793; }
        frame 51 { x: 75.5; y: 53; skew-x: 92.3; skew-y: 92.3; scale-x: 0.794; scale-y: 0.794; }
        frame 52 { x: 64.7; y: 48.9; skew-x: 74.5; skew-y: 74.5; scale-x: 0.795; scale-y: 0.795; }
        frame 53 { x: 52.4; y: 46.9; skew-x: 56.4; skew-y: 56.4; scale-x: 0.796; scale-y: 0.796; }
        frame 54 { x: 39.9; y: 47.4; skew-x: 38.4; skew-y: 38.4; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { x: 38; y: 48.9; skew-x: 35.3; skew-y: 35.3; scale-x: 0.796; scale-y: 0.796; }
        frame 56 { x: 36.3; y: 50.3; skew-x: 32.3; skew-y: 32.3; scale-x: 0.797; scale-y: 0.797; }
        frame 57 { x: 38.9; y: 48.9; skew-x: 35.3; skew-y: 35.3; scale-x: 0.796; scale-y: 0.796; }
        frame 58 { x: 41.4; y: 47.4; skew-x: 38.4; skew-y: 38.4; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 42.6; y: 47.5; skew-x: 40.6; skew-y: 40.6; scale-x: 0.797; scale-y: 0.797; }
        frame 61 { x: 44; y: -10000; skew-x: 42.9; skew-y: 42.9; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 45.4; skew-x: 45.1; skew-y: 45.1; scale-x: 0.798; scale-y: 0.798; }
        frame 63 { x: 46.3; y: 47; skew-x: 47.1; skew-y: 47.1; scale-x: 0.797; scale-y: 0.797; }
        frame 64 { x: 47; y: 46.5; skew-x: 48.9; skew-y: 48.9; scale-x: 0.796; scale-y: 0.796; }
        frame 65 { x: 48; y: 45.9; skew-x: 50.9; skew-y: 50.9; scale-x: 0.798; scale-y: 0.798; }
        frame 66 { x: 45.5; y: 46.4; skew-x: 48.6; skew-y: 48.6; scale-x: 0.796; scale-y: 0.796; }
        frame 67 { x: 43.1; y: 46.7; skew-x: 46.4; skew-y: 46.4; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 40.8; y: 47.1; skew-x: 44.1; skew-y: 44.1; scale-x: 0.797; scale-y: 0.797; }
        frame 69 { x: 40.4; y: 47.5; skew-x: 42.1; skew-y: 42.1; scale-x: 0.796; scale-y: 0.796; }
        frame 70 { x: 40.1; y: 47.8; skew-x: 40.3; skew-y: 40.3; scale-x: 0.797; scale-y: 0.797; }
        frame 71 { x: 39.6; y: 48.1; skew-x: 38.4; skew-y: 38.4; scale-x: 0.798; scale-y: 0.798; }
        frame 72 { x: 41.5; y: 47.7; skew-x: 40.6; skew-y: 40.6; scale-x: 0.797; scale-y: 0.797; }
        frame 73 { x: 43.5; y: 47; skew-x: 42.9; skew-y: 42.9; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 45.4; y: 46.5; skew-x: 45.1; skew-y: 45.1; scale-x: 0.798; scale-y: 0.798; }
        frame 75 { x: 46.4; y: -10000; skew-x: 47.1; skew-y: 47.1; scale-x: 0.797; scale-y: 0.797; }
        frame 76 { x: 47.2; skew-x: 48.9; skew-y: 48.9; scale-x: 0.796; scale-y: 0.796; }
        frame 77 { x: 48.2; y: 46.4; skew-x: 50.9; skew-y: 50.9; scale-x: 0.798; scale-y: 0.798; }
        frame 78 { x: 45.6; y: 46.7; skew-x: 48.6; skew-y: 48.6; scale-x: 0.796; scale-y: 0.796; }
        frame 79 { x: 43; y: 46.9; skew-x: 46.4; skew-y: 46.4; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 40.5; y: 47.1; skew-x: 44.1; skew-y: 44.1; scale-x: 0.797; scale-y: 0.797; }
        frame 81 { x: 40.8; y: 47.3; skew-x: 42.1; skew-y: 42.1; scale-x: 0.796; scale-y: 0.796; }
        frame 82 { x: 41.1; y: -10000; skew-x: 40.3; skew-y: 40.3; scale-x: 0.797; scale-y: 0.797; }
        frame 83 { x: 41.4; y: 47.4; skew-x: 38.4; skew-y: 38.4; scale-x: 0.798; scale-y: 0.798; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 42.1; y: 46.6; skew-x: 39.8; skew-y: 39.8; scale-x: 0.797; scale-y: 0.797; }
        frame 86 { x: 43; y: 45.8; skew-x: 41.1; skew-y: 41.1; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 43.8; y: 45; skew-x: 42.4; skew-y: 42.4; }
        frame 88 { x: 44.6; y: 44.1; skew-x: 43.7; skew-y: 43.7; scale-x: 0.798; scale-y: 0.798; }
        frame 89 { x: 45.7; y: 43.8; skew-x: 45.6; skew-y: 45.6; scale-x: 0.797; scale-y: 0.797; }
        frame 90 { x: 46.9; y: 43.4; skew-x: 47.4; skew-y: 47.4; scale-x: 0.796; scale-y: 0.796; }
        frame 91 { x: 48; y: 43.1; skew-x: 49.4; skew-y: 49.4; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 49.1; y: 42.8; skew-x: 51.2; skew-y: 51.2; scale-x: 0.797; scale-y: 0.797; }
        frame 93 { x: 49.5; y: 42.1; skew-x: 51.7; skew-y: 51.7; scale-x: 0.796; scale-y: 0.796; }
        frame 94 { x: 49.9; y: 41.5; skew-x: 52.1; skew-y: 52.1; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 50.1; y: 40.9; skew-x: 52.4; skew-y: 52.4; }
        frame 96 { x: 50.5; y: 40.1; skew-x: 52.9; skew-y: 52.9; scale-x: 0.797; scale-y: 0.797; }
        frame 97 { x: 51.3; y: 40.4; skew-x: 54.1; skew-y: 54.1; scale-x: 0.796; scale-y: 0.795; }
        frame 98 { x: 52; y: 40.6; skew-x: 55.2; skew-y: 55.2; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 52.6; y: 40.8; skew-x: 56.4; skew-y: 56.4; scale-x: 0.797; scale-y: 0.794; }
        frame 100 { x: 53.4; y: 41.1; skew-x: 57.5; skew-y: 57.6; scale-x: 0.798; scale-y: 0.795; }
        frame 101 { x: 51.2; y: 42.9; skew-x: 54.9; skew-y: 55.1; scale-x: 0.797; scale-y: 0.794; }
        frame 102 { x: 49; y: 44.5; skew-x: 52.4; skew-y: 52.6; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 46.8; y: 46.1; skew-x: 49.9; skew-y: 49.9; scale-y: 0.793; }
        frame 104 { x: 44.5; y: 47.8; skew-x: 47.3; skew-y: 47.5; scale-x: 0.798; scale-y: 0.795; }
        frame 105 { x: 46.3; y: 46.9; skew-x: 50.4; skew-y: 50.4; scale-x: 0.796; scale-y: 0.793; }
        frame 106 { x: 48; y: 46; skew-x: 53.2; skew-y: 53.4; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 49.6; y: 45; skew-x: 56.2; skew-y: 56.4; }
        frame 108 { x: 51.3; y: 44.1; skew-x: 59.2; skew-y: 59.3; scale-x: 0.798; scale-y: 0.795; }
        frame 109 { x: 51.9; y: 44.3; skew-x: 59.9; skew-y: 60.1; scale-x: 0.796; scale-y: 0.793; }
        frame 110 { x: 52.4; y: -10000; skew-x: 60.7; skew-y: 60.7; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 53; y: 44.4; skew-x: 61.4; skew-y: 61.4; }
        frame 112 { x: 53.5; y: 44.5; skew-x: 62; skew-y: 62.1; scale-x: 0.797; scale-y: 0.794; }
        frame 113 { x: 54.5; y: 44; skew-x: 63.2; skew-y: 63.2; scale-x: 0.796; scale-y: 0.793; }
        frame 114 { x: 55.3; y: 43.5; skew-x: 64.2; skew-y: 64.2; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 56.3; y: 43; skew-x: 65.2; skew-y: 65.2; }
        frame 116 { x: 57; y: 42.5; skew-x: 66.1; skew-y: 66.2; scale-x: 0.797; scale-y: 0.794; }
        frame 117 { x: 53.6; y: 43.3; skew-x: 60.9; skew-y: 61; scale-x: 0.796; scale-y: 0.793; }
        frame 118 { x: 50.4; y: 44.3; skew-x: 55.7; skew-y: 55.9; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 46.9; y: 45.5; skew-x: 50.4; skew-y: 50.6; }
        frame 120 { x: 43.4; y: 46.9; skew-x: 45.3; skew-y: 45.4; scale-x: 0.797; scale-y: 0.794; }
        frame 121 { x: 43; y: 47.1; skew-x: 43.6; skew-y: 43.6; scale-x: 0.796; scale-y: -10000; }
        frame 122 { x: 42.5; y: -10000; skew-x: 41.9; skew-y: 41.9; scale-x: 0.797; scale-y: 0.795; }
        frame 123 { x: 42; y: 47.4; skew-x: 40.1; skew-y: 40.1; scale-x: -10000; scale-y: 0.796; }
        frame 124 { x: 41.4; y: -10000; skew-x: 38.4; skew-y: 38.4; scale-x: 0.798; scale-y: 0.798; }
        frame 125 { x: 41.1; y: 46.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 38.6; y: 48.8; skew-x: 34.1; skew-y: 34.1; scale-x: 0.797; scale-y: 0.797; }
        frame 127 { x: 36; y: 51.1; skew-x: 29.6; skew-y: 29.6; scale-x: 0.796; scale-y: 0.796; }
        frame 128 { x: 33.5; y: 53.5; skew-x: 25.4; skew-y: 25.4; scale-x: 0.797; scale-y: 0.797; }
        frame 129 { x: 32.1; y: 57.7; skew-x: 19.8; skew-y: 19.8; scale-x: 0.796; scale-y: 0.796; }
        frame 130 { x: 31; y: 62; skew-x: 14.5; skew-y: 14.5; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: 29.8; y: 66.8; skew-x: 9.1; skew-y: 9.1; }
        frame 132 { x: 38.3; y: 64.3; skew-x: 17.3; skew-y: 17.3; scale-x: 0.795; scale-y: 0.795; }
        frame 133 { x: 47.1; y: 62.5; skew-x: 25.5; skew-y: 25.5; scale-x: 0.794; scale-y: 0.794; }
        frame 134 { x: 56; y: 61.1; skew-x: 33.7; skew-y: 33.7; scale-x: 0.795; scale-y: 0.795; }
        frame 135 { x: 65.8; y: 60.6; skew-x: 43.1; skew-y: 43.1; scale-x: 0.793; scale-y: 0.793; }
        frame 136 { x: 75.6; y: 60.7; skew-x: 52.6; skew-y: 52.6; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 85.3; y: 61.5; skew-x: 62.1; skew-y: 62.1; scale-x: 0.794; scale-y: 0.794; }
        frame 138 { x: 97.6; y: 65.1; skew-x: 73.2; skew-y: 73.2; scale-x: 0.792; scale-y: 0.792; }
        frame 139 { x: 109.5; y: 69.6; skew-x: 84.4; skew-y: 84.4; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 120.6; y: 74.8; skew-x: 95.4; skew-y: 95.4; }
        frame 141 { x: 126.6; y: 83.4; skew-x: 103.5; skew-y: 103.5; scale-x: 0.791; scale-y: 0.791; }
        frame 142 { x: 132.3; y: 92.3; skew-x: 111.8; skew-y: 111.8; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 137.5; y: 101.3; skew-x: 119.9; skew-y: 119.9; }
        frame 144 { x: 141.8; y: 116.7; skew-x: 145.9; skew-y: 145.9; scale-x: 0.789; scale-y: 0.789; }
        frame 145 { x: 141; y: 130.8; skew-x: 171.7; skew-y: 171.7; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 136.2; y: 141.5; skew-x: 197.4; skew-y: 197.4; }
        frame 147 { x: 137.3; y: 140.7; skew-x: 195; skew-y: 200.1; scale-x: 0.816; scale-y: 0.718; }
        frame 148 { x: 137.4; y: 140.5; skew-x: 194.6; skew-y: 198; scale-x: 0.806; scale-y: 0.741; }
        frame 149 { x: 137.5; y: 140.4; skew-x: 194.3; skew-y: 195.8; scale-x: 0.797; scale-y: 0.765; }
        frame 150 { x: 137.7; y: 140.2; skew-x: 193.9; skew-y: 193.9; scale-x: 0.789; scale-y: 0.789; }
        frame 151 { x: 137; y: 140.9; skew-x: 195.6; skew-y: 195.6; scale-x: 0.788; scale-y: 0.788; }
        frame 152 { x: 136.2; y: 141.5; skew-x: 197.4; skew-y: 197.4; scale-x: 0.789; scale-y: 0.789; }
        frame 153 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_outerleg_foot";
        frame-count: 155;
        frame 0 { x: 48.8; y: 86.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_OUTERLEG_FOOT; }
        frame 1 { x: 51.3; y: 86.5; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 53.8; y: -10000; skew-x: -3; skew-y: -3; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: 56.2; y: 86.7; skew-x: -4.8; skew-y: -4.8; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 53.8; y: 89.3; skew-x: -3; skew-y: -3; }
        frame 5 { x: 51.2; y: 92.1; skew-x: -1.4; skew-y: -1.4; scale-x: 0.8; scale-y: 0.8; }
        frame 6 { x: 48.8; y: 94.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 48; y: -10000; skew-x: -0.9; skew-y: -0.9; }
        frame 8 { x: 47.3; y: 95; skew-x: -1.9; skew-y: -1.9; }
        frame 9 { x: 46.6; y: -10000; skew-x: -2.9; skew-y: -2.9; }
        frame 10 { x: 47.4; y: 92.1; skew-x: -1.9; skew-y: -1.9; }
        frame 11 { x: 48; y: 89.2; skew-x: -0.9; skew-y: -0.9; }
        frame 12 { x: 48.8; y: 86.3; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: 49.3; skew-x: -1.2; skew-y: -1.2; }
        frame 15 { x: 49.7; y: 86.4; skew-x: -2.5; skew-y: -2.5; }
        frame 16 { x: 50.1; y: 86.5; skew-x: -3.9; skew-y: -3.9; }
        frame 17 { x: 50.8; y: 86.7; skew-x: -5.2; skew-y: -5.2; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 51.2; y: -10000; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 51.7; y: 86.8; skew-x: -8; skew-y: -8; }
        frame 20 { x: 52.2; y: 86.9; skew-x: -9.5; skew-y: -9.5; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: 41; y: 85; skew-x: 2.8; skew-y: 2.8; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 30.1; y: 83.8; skew-x: 15.1; skew-y: 15.1; scale-x: 0.798; scale-y: 0.798; }
        frame 23 { x: 19.8; y: 83.1; skew-x: 27.6; skew-y: 27.6; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: 9.7; y: 83.3; skew-x: 40; skew-y: 40; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: 16.7; y: 82.3; skew-x: 17.8; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 24.8; y: 83.8; skew-x: -3.9; skew-y: -3.9; }
        frame 27 { x: 34.8; y: 87; skew-x: -26.1; skew-y: -26.1; scale-x: 0.799; scale-y: 0.799; }
        frame 28 { x: 30.6; y: 86.5; skew-x: -17.2; skew-y: -17.2; scale-x: 0.798; scale-y: 0.798; }
        frame 29 { x: 26.9; y: 86.3; skew-x: -8.5; skew-y: -8.5; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: 23.3; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 31 { x: 48.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -10000; }
        frame 33 { x: 46.6; y: 96.2; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 44.8; y: 105.9; skew-x: 14.9; skew-y: 14.9; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 47.7; y: 108.4; skew-x: 27.5; skew-y: 27.5; scale-x: 0.798; scale-y: 0.798; }
        frame 36 { x: 50.8; y: 111.7; skew-x: 40.2; skew-y: 40.2; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 38 { x: 50.6; y: 111.6; skew-x: 39.4; skew-y: 39.4; scale-x: 0.797; scale-y: 0.797; }
        frame 39 { x: 50.4; y: -10000; skew-x: 38.6; skew-y: 38.6; scale-x: 0.796; scale-y: 0.796; }
        frame 40 { x: 50.2; skew-x: 37.8; skew-y: 37.8; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 49.9; y: 111.7; skew-x: 36.9; skew-y: 36.9; }
        frame 42 { x: 49.8; y: 111.5; skew-x: 36.1; skew-y: 36.1; }
        frame 43 { x: 49.5; y: 111.6; skew-x: 35.4; skew-y: 35.4; scale-x: 0.795; scale-y: 0.795; }
        frame 44 { x: 49.3; y: -10000; skew-x: 34.6; skew-y: 34.6; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 49; y: 111.4; skew-x: 33.8; skew-y: 33.8; scale-x: 0.796; scale-y: 0.796; }
        frame 46 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 48.8; y: 111.2; skew-x: 31.6; skew-y: 31.6; scale-x: 0.795; scale-y: 0.795; }
        frame 48 { x: 48.4; y: 110.9; skew-x: 29.3; skew-y: 29.3; scale-x: 0.796; scale-y: 0.796; }
        frame 49 { x: 48.8; y: 111; skew-x: 31.1; skew-y: 31.1; scale-x: 0.795; scale-y: 0.795; }
        frame 50 { x: 49.1; y: 111.1; skew-x: 32.8; skew-y: 32.8; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 49.5; y: 111.2; skew-x: 34.6; skew-y: 34.6; scale-x: 0.796; scale-y: 0.796; }
        frame 52 { x: 50; y: 111.3; skew-x: 36.6; skew-y: 36.6; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 50.4; y: 111.4; skew-x: 38.3; skew-y: 38.3; scale-x: 0.797; scale-y: 0.797; }
        frame 54 { x: 50.8; y: 111.7; skew-x: 40.2; skew-y: 40.2; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { x: -10000; y: -10000; skew-x: 40.1; skew-y: 40.1; scale-x: 0.796; scale-y: 0.796; }
        frame 56 { skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 57 { scale-x: 0.796; scale-y: 0.796; }
        frame 58 { skew-x: 40.2; skew-y: 40.2; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { skew-x: 40.1; skew-y: 40.1; scale-x: 0.797; scale-y: 0.797; }
        frame 61 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { skew-x: 40.2; skew-y: 40.2; scale-x: 0.798; scale-y: 0.798; }
        frame 63 { skew-x: 40.1; skew-y: 40.1; scale-x: 0.797; scale-y: 0.797; }
        frame 64 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 65 { skew-x: 40.2; skew-y: 40.2; scale-x: 0.798; scale-y: 0.798; }
        frame 66 { x: 50.5; y: 111.6; skew-x: 39.4; skew-y: 39.4; scale-x: 0.797; scale-y: 0.797; }
        frame 67 { x: -10000; y: -10000; skew-x: 38.8; skew-y: 38.8; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 50.2; y: 111.3; skew-x: 38.2; skew-y: 38.2; scale-x: 0.798; scale-y: 0.798; }
        frame 69 { x: 50.4; y: 111.4; skew-x: 38.8; skew-y: 38.8; scale-x: 0.797; scale-y: 0.797; }
        frame 70 { x: 50.5; y: 111.5; skew-x: 39.4; skew-y: 39.4; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 50.8; y: 111.7; skew-x: 40.2; skew-y: 40.2; scale-x: 0.798; scale-y: 0.798; }
        frame 72 { x: -10000; y: -10000; skew-x: 40.1; skew-y: 40.1; scale-x: 0.797; scale-y: 0.797; }
        frame 73 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 74 { skew-x: 40.2; skew-y: 40.2; scale-x: 0.798; scale-y: 0.798; }
        frame 75 { skew-x: 40.1; skew-y: 40.1; scale-x: 0.797; scale-y: 0.797; }
        frame 76 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 77 { skew-x: 40.2; skew-y: 40.2; scale-x: 0.798; scale-y: 0.798; }
        frame 78 { x: 50.5; y: 111.6; skew-x: 39.4; skew-y: 39.4; scale-x: 0.797; scale-y: 0.797; }
        frame 79 { x: -10000; y: -10000; skew-x: 38.8; skew-y: 38.8; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 50.2; y: 111.3; skew-x: 38.2; skew-y: 38.2; scale-x: 0.798; scale-y: 0.798; }
        frame 81 { x: 50.4; y: 111.4; skew-x: 38.8; skew-y: 38.8; scale-x: 0.797; scale-y: 0.797; }
        frame 82 { x: 50.5; y: 111.5; skew-x: 39.4; skew-y: 39.4; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 50.8; y: 111.7; skew-x: 40.2; skew-y: 40.2; scale-x: 0.798; scale-y: 0.798; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 50.5; skew-x: 39.1; skew-y: 39.1; scale-x: 0.796; scale-y: 0.796; }
        frame 86 { x: 50; y: 111.6; skew-x: 38.1; skew-y: 38.1; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 49.7; y: 111.5; skew-x: 37.1; skew-y: 37.1; }
        frame 88 { x: 49.4; y: 111.3; skew-x: 36.2; skew-y: 36.2; }
        frame 89 { x: 47.6; y: -10000; skew-x: 32.8; skew-y: 32.8; scale-x: 0.795; scale-y: 0.795; }
        frame 90 { x: 45.9; y: 111.2; skew-x: 29.5; skew-y: 29.5; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 44.2; y: 111.1; skew-x: 26.1; skew-y: 26.1; scale-x: 0.794; scale-y: 0.794; }
        frame 92 { x: 42.7; y: 111.3; skew-x: 22.8; skew-y: 22.8; scale-x: 0.795; scale-y: 0.795; }
        frame 93 { x: 41.3; y: -10000; skew-x: 21.8; skew-y: 21.8; scale-x: 0.794; scale-y: 0.794; }
        frame 94 { x: 39.9; y: 111.4; skew-x: 21; skew-y: 21; scale-x: 0.793; scale-y: 0.793; }
        frame 95 { x: 38.4; y: 111.3; skew-x: 20; skew-y: 20; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 36.8; y: 111.5; skew-x: 19.2; skew-y: 19.2; }
        frame 97 { x: 35.4; y: 111.7; skew-x: 17.8; skew-y: 17.8; scale-x: 0.792; scale-y: 0.792; }
        frame 98 { x: 34; y: 111.8; skew-x: 16.3; skew-y: 16.3; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 32.6; y: 112.2; skew-x: 15; skew-y: 15; }
        frame 100 { x: 31.3; y: -10000; skew-x: 13.6; skew-y: 13.6; }
        frame 101 { x: 33.4; y: 111.8; skew-x: 19.8; skew-y: 19.8; scale-x: 0.791; scale-y: 0.791; }
        frame 102 { x: 35.6; y: 111.5; skew-x: 26.1; skew-y: 26.1; scale-x: 0.79; scale-y: 0.79; }
        frame 103 { x: 37.9; y: -10000; skew-x: 32.3; skew-y: 32.3; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 40.4; y: 111.8; skew-x: 38.6; skew-y: 38.6; scale-x: 0.791; scale-y: 0.791; }
        frame 105 { x: 41.4; y: -10000; skew-x: 36.6; skew-y: 36.6; scale-x: 0.79; scale-y: 0.79; }
        frame 106 { x: 42.4; skew-x: 34.6; skew-y: 34.6; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 43.3; skew-x: 32.6; skew-y: 32.6; }
        frame 108 { x: 44.4; y: 111.7; skew-x: 30.5; skew-y: 30.5; scale-x: 0.791; scale-y: 0.791; }
        frame 109 { x: 45.8; y: -10000; skew-x: 30.1; skew-y: 30.1; scale-x: 0.789; scale-y: 0.789; }
        frame 110 { x: 47.3; y: 111.6; skew-x: 29.8; skew-y: 29.8; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 48.6; y: 111.5; skew-x: 29.3; skew-y: 29.3; }
        frame 112 { x: 50.2; y: 111.6; skew-x: 29; skew-y: 29; scale-x: 0.79; scale-y: 0.79; }
        frame 113 { x: 50.5; y: 111.5; skew-x: 27.8; skew-y: 27.8; scale-x: 0.788; scale-y: 0.788; }
        frame 114 { x: 50.9; y: -10000; skew-x: 26.6; skew-y: 26.6; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 51.3; skew-x: 25.3; skew-y: 25.3; }
        frame 116 { x: 51.6; y: 111.3; skew-x: 24.2; skew-y: 24.2; scale-x: 0.789; scale-y: 0.789; }
        frame 117 { x: 52; y: 111.7; skew-x: 19.1; skew-y: 19.1; scale-x: 0.787; scale-y: 0.787; }
        frame 118 { x: 52.3; y: 112.2; skew-x: 14.3; skew-y: 14.3; scale-x: 0.785; scale-y: 0.785; }
        frame 119 { x: 52.9; y: 112.7; skew-x: 9.3; skew-y: 9.3; scale-x: 0.784; scale-y: 0.784; }
        frame 120 { x: 53.4; y: 113.2; skew-x: 4.4; skew-y: 4.4; scale-x: 0.783; scale-y: 0.783; }
        frame 121 { x: 52.5; y: 112.3; skew-x: 13.3; skew-y: 13.3; scale-x: 0.786; scale-y: 0.786; }
        frame 122 { x: 52; y: 111.9; skew-x: 22.3; skew-y: 22.3; scale-x: 0.789; scale-y: 0.789; }
        frame 123 { x: 51.5; y: 111.7; skew-x: 31.1; skew-y: 31.1; scale-x: 0.793; scale-y: 0.793; }
        frame 124 { x: 50.8; y: -10000; skew-x: 40.2; skew-y: 40.2; scale-x: 0.798; scale-y: 0.798; }
        frame 125 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 126 { skew-x: 40.1; skew-y: 40.1; scale-x: 0.797; scale-y: 0.797; }
        frame 127 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 128 { skew-x: 40.2; skew-y: 40.2; scale-x: 0.798; scale-y: 0.798; }
        frame 129 { skew-x: 40.1; skew-y: 40.1; scale-x: 0.797; scale-y: 0.797; }
        frame 130 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 131 { skew-x: 40.2; skew-y: 40.2; scale-x: 0.798; scale-y: 0.798; }
        frame 132 { x: 52.5; y: 111; skew-x: 46.1; skew-y: 46.1; scale-x: 0.797; scale-y: 0.797; }
        frame 133 { x: 54.4; y: 110.6; skew-x: 52.2; skew-y: 52.2; scale-x: 0.796; scale-y: 0.796; }
        frame 134 { x: 56; y: 110.3; skew-x: 58.2; skew-y: 58.2; scale-x: 0.797; scale-y: 0.797; }
        frame 135 { x: 57.6; y: -10000; skew-x: 63.4; skew-y: 63.4; scale-x: 0.796; scale-y: 0.796; }
        frame 136 { x: 59.3; y: 110.5; skew-x: 68.7; skew-y: 68.7; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 60.8; y: 110.7; skew-x: 73.8; skew-y: 73.8; scale-x: 0.797; scale-y: 0.797; }
        frame 138 { x: 62.8; y: 110.8; skew-x: 79; skew-y: 79; scale-x: 0.796; scale-y: 0.796; }
        frame 139 { x: 64.8; y: 111; skew-x: 84.2; skew-y: 84.2; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 66.5; y: 111.2; skew-x: 89.4; skew-y: 89.4; }
        frame 141 { x: 69.8; y: 110; skew-x: 103.8; skew-y: 103.8; scale-y: 0.794; }
        frame 142 { x: 72.3; y: 109.1; skew-x: 118.1; skew-y: 118.3; scale-y: 0.793; }
        frame 143 { x: 73.7; y: 108.6; skew-x: 132.6; skew-y: 132.9; scale-x: 0.797; scale-y: -10000; }
        frame 144 { x: 75.1; y: 111.8; skew-x: 130.6; skew-y: 131.1; scale-x: 0.796; scale-y: 0.791; }
        frame 145 { x: 76.5; y: 115.2; skew-x: 128.6; skew-y: 129.1; scale-x: 0.795; scale-y: -10000; }
        frame 146 { x: 78; y: 118.4; skew-x: 126.8; skew-y: 127.2; scale-x: 0.796; scale-y: 0.792; }
        frame 147 { x: 76.3; y: 120.1; skew-x: 131.2; skew-y: 123; scale-x: 0.758; scale-y: 0.787; }
        frame 148 { x: 76.8; y: 119.1; skew-x: 130.1; skew-y: 124.6; scale-x: 0.77; scale-y: -10000; }
        frame 149 { x: 77.4; y: 118.2; skew-x: 128.9; skew-y: 126.4; scale-x: 0.782; scale-y: 0.789; }
        frame 150 { x: 78; y: 117.3; skew-x: 127.8; skew-y: 128.2; scale-x: 0.796; scale-y: 0.791; }
        frame 151 { x: -10000; y: 117.9; skew-x: 127.3; skew-y: 127.6; scale-x: 0.795; scale-y: 0.79; }
        frame 152 { y: 118.4; skew-x: 126.8; skew-y: 127.2; scale-x: 0.796; scale-y: 0.792; }
        frame 153 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_outerleg_lower";
        frame-count: 155;
        frame 0 { x: 51.2; y: 79.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_OUTERLEG_LOWER; }
        frame 1 { x: 53; y: 79.8; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 54.7; y: 80.3; skew-x: -6.7; skew-y: -6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: 56.5; y: 81; skew-x: -10.3; skew-y: -10.3; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 54.8; y: 83.2; skew-x: -6.7; skew-y: -6.7; }
        frame 5 { x: 53; y: 85.4; skew-x: -3.2; skew-y: -3.2; scale-x: 0.8; scale-y: 0.8; }
        frame 6 { x: 51.2; y: 87.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 51.3; y: 86.6; skew-x: 1.6; skew-y: 1.6; scale-y: 0.826; }
        frame 8 { x: 51.4; y: 85.3; skew-x: 3.3; skew-y: 3.3; scale-y: 0.851; }
        frame 9 { x: 51.5; y: 84.1; skew-x: 5.1; skew-y: 5.1; scale-y: 0.877; }
        frame 10 { x: 51.3; y: 82.5; skew-x: 3.3; skew-y: 3.3; scale-y: 0.851; }
        frame 11 { x: 51.1; y: 80.8; skew-x: 1.6; skew-y: 1.6; scale-y: 0.826; }
        frame 12 { x: 51.2; y: 79.2; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 14 { x: 51.5; y: 79.1; skew-x: -1.2; skew-y: -1.2; }
        frame 15 { x: -10000; y: 79; skew-x: -2.7; skew-y: -2.7; }
        frame 16 { x: 51.8; y: 78.8; skew-x: -4; skew-y: -4; }
        frame 17 { x: 52; y: -10000; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 52.2; y: 78.7; skew-x: -6.9; skew-y: -6.9; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 52.4; y: 78.6; skew-x: -8.2; skew-y: -8.2; }
        frame 20 { x: 52.5; y: 78.5; skew-x: -9.8; skew-y: -9.8; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: 42.1; y: 77.7; skew-x: 0.8; skew-y: -0.2; scale-x: -10000; scale-y: 0.799; }
        frame 22 { x: 32.1; y: 77; skew-x: 11.5; skew-y: 9.3; scale-y: -10000; }
        frame 23 { x: 22.3; y: 76.8; skew-x: 22.3; skew-y: 18.8; scale-y: 0.798; }
        frame 24 { x: 13.1; y: 77.1; skew-x: 33; skew-y: 28.4; scale-x: 0.801; scale-y: 0.799; }
        frame 25 { x: 19.8; y: 76.2; skew-x: 16.5; skew-y: 13.3; scale-x: 0.8; scale-y: 0.798; }
        frame 26 { x: 27.5; y: -10000; skew-x: 0; skew-y: -1.2; scale-x: -10000; scale-y: 0.799; }
        frame 27 { x: 35.8; y: 76.8; skew-x: -16.3; skew-y: -16.3; scale-x: 0.799; scale-y: -10000; }
        frame 28 { x: 32.3; y: 77.6; skew-x: -10.7; skew-y: -10.7; scale-x: -10000; }
        frame 29 { x: 29.1; y: 78.4; skew-x: -5.2; skew-y: -5.2; }
        frame 30 { x: 25.7; y: 79.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 31 { x: 51.2; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -10000; }
        frame 33 { x: 50; y: 89.5; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 48.9; y: 99.7; skew-x: 14.9; skew-y: 14.9; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 48.3; y: 104.1; skew-x: 9.8; skew-y: 9.8; }
        frame 36 { x: 47.9; y: 108.5; skew-x: 5.1; skew-y: 5.1; }
        frame 37 { x: 44.7; y: 110; skew-x: -3.6; skew-y: -3.6; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: -10000; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 44.8; y: 109.8; skew-x: -10000; skew-y: -10000; }
        frame 40 { x: -10000; y: -10000; skew-x: -3.9; skew-y: -3.9; }
        frame 41 { y: 109.7; skew-x: -4; skew-y: -4; }
        frame 42 { x: 44.6; y: 109.6; skew-x: -4.2; skew-y: -4.2; }
        frame 43 { x: 44.7; y: 109.5; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 44.8; y: 109.4; skew-x: -4.4; skew-y: -4.4; }
        frame 45 { x: -10000; y: -10000; skew-x: -4.7; skew-y: -4.7; }
        frame 46 { skew-x: -10000; skew-y: -10000; }
        frame 47 { x: 44; y: 109.7; skew-x: -7.7; skew-y: -7.7; scale-x: 0.797; scale-y: 0.797; }
        frame 48 { x: 43; y: 110; skew-x: -10.9; skew-y: -10.9; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 43.9; y: 109.7; skew-x: -8.2; skew-y: -8.2; }
        frame 50 { x: 44.6; y: 109.3; skew-x: -5.4; skew-y: -5.4; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { x: 45.4; y: 109.2; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 46.1; y: 109; skew-x: -0.2; skew-y: -0.2; }
        frame 53 { x: 47; y: 108.7; skew-x: 2.3; skew-y: 2.3; scale-x: 0.799; scale-y: 0.799; }
        frame 54 { x: 47.9; y: 108.5; skew-x: 5.1; skew-y: 5.1; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 47.2; y: 108.8; skew-x: 2.8; skew-y: 2.8; scale-x: 0.798; scale-y: 0.798; }
        frame 56 { x: 46.6; y: 109.3; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 47.3; y: 108.9; skew-x: 2.8; skew-y: 2.8; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 47.9; y: 108.5; skew-x: 5.1; skew-y: 5.1; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 60 { skew-x: 5; skew-y: 5; }
        frame 61 { skew-x: -10000; skew-y: -10000; }
        frame 62 { skew-x: 5.1; skew-y: 5.1; }
        frame 63 { x: 47.3; y: 108.7; skew-x: 3.3; skew-y: 3.3; }
        frame 64 { x: 46.9; y: 109.1; skew-x: 1.5; skew-y: 1.5; }
        frame 65 { x: 46.4; y: 109.5; skew-x: -0.1; skew-y: -0.1; }
        frame 66 { x: 45.7; y: -10000; skew-x: -2.5; skew-y: -2.5; scale-x: 0.798; scale-y: 0.811; }
        frame 67 { x: 45.1; y: 109.6; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: 0.824; }
        frame 68 { x: 44.6; y: 109.8; skew-x: -7.6; skew-y: -7.6; scale-y: 0.836; }
        frame 69 { x: 45.6; y: 109.3; skew-x: -3.2; skew-y: -3.2; scale-y: 0.824; }
        frame 70 { x: 46.8; y: 108.9; skew-x: 0.8; skew-y: 0.8; scale-x: 0.799; scale-y: 0.811; }
        frame 71 { x: 47.9; y: 108.5; skew-x: 5.1; skew-y: 5.1; scale-x: -10000; scale-y: 0.799; }
        frame 72 { x: -10000; y: -10000; skew-x: 5; skew-y: 5; scale-y: -10000; }
        frame 73 { skew-x: -10000; skew-y: -10000; }
        frame 74 { skew-x: 5.1; skew-y: 5.1; }
        frame 75 { x: 47.3; y: 108.7; skew-x: 3.3; skew-y: 3.3; }
        frame 76 { x: 46.9; y: 109.1; skew-x: 1.5; skew-y: 1.5; }
        frame 77 { x: 46.4; y: 109.5; skew-x: -0.1; skew-y: -0.1; }
        frame 78 { x: 45.7; y: -10000; skew-x: -2.5; skew-y: -2.5; scale-x: 0.798; scale-y: 0.811; }
        frame 79 { x: 45.1; y: 109.6; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: 0.824; }
        frame 80 { x: 44.6; y: 109.8; skew-x: -7.6; skew-y: -7.6; scale-y: 0.836; }
        frame 81 { x: 45.6; y: 109.3; skew-x: -3.2; skew-y: -3.2; scale-y: 0.824; }
        frame 82 { x: 46.8; y: 108.9; skew-x: 0.8; skew-y: 0.8; scale-x: 0.799; scale-y: 0.811; }
        frame 83 { x: 47.9; y: 108.5; skew-x: 5.1; skew-y: 5.1; scale-x: -10000; scale-y: 0.799; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 85 { x: 47; y: 108.4; skew-x: 3.5; skew-y: 3.5; scale-x: 0.798; scale-y: 0.798; }
        frame 86 { x: 46; y: 108.3; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 45.1; y: 108.2; skew-x: 0.5; skew-y: 0.5; }
        frame 88 { x: 44.2; y: 108.1; skew-x: -0.9; skew-y: -0.9; scale-x: 0.797; scale-y: 0.797; }
        frame 89 { x: 44; y: 107.3; skew-x: 3; skew-y: 3; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 43.9; y: 106.8; skew-x: 7; skew-y: 7; scale-x: 0.796; scale-y: 0.796; }
        frame 91 { x: -10000; y: 106; skew-x: 11.3; skew-y: 11.3; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 43.8; y: 105.5; skew-x: 15.4; skew-y: 15.4; }
        frame 93 { x: 43; y: 105.2; skew-x: 15.8; skew-y: 15.8; scale-x: 0.795; scale-y: 0.795; }
        frame 94 { x: 42.2; y: 104.9; skew-x: 16.1; skew-y: 16.1; scale-x: 0.794; scale-y: 0.794; }
        frame 95 { x: 41.3; y: 104.6; skew-x: 16.5; skew-y: 16.5; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 40.5; y: 104.3; skew-x: 16.9; skew-y: 16.9; scale-x: 0.795; scale-y: 0.795; }
        frame 97 { x: -10000; y: 104; skew-x: 19; skew-y: 19; scale-x: 0.794; scale-y: 0.794; }
        frame 98 { x: 40.6; y: 103.6; skew-x: 21.3; skew-y: 21.3; scale-x: 0.793; scale-y: 0.793; }
        frame 99 { x: -10000; y: 103.3; skew-x: 23.3; skew-y: 23.3; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 40.7; y: 102.7; skew-x: 25.7; skew-y: 25.7; }
        frame 101 { x: 39.5; y: 103.3; skew-x: 20.1; skew-y: 20.1; scale-x: 0.792; scale-y: 0.841; }
        frame 102 { x: 38.4; y: 103.9; skew-x: 14.8; skew-y: 14.8; scale-x: 0.793; scale-y: 0.89; }
        frame 103 { x: 37.1; y: 104.7; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: 0.939; }
        frame 104 { x: 35.7; y: 105.6; skew-x: 3.9; skew-y: 3.9; scale-y: 0.989; }
        frame 105 { x: 36.4; y: 106; skew-x: 1.8; skew-y: 1.8; scale-y: 0.988; }
        frame 106 { x: 37.1; y: 106.3; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 107 { x: 37.9; y: 106.7; skew-x: -1.9; skew-y: -1.9; }
        frame 108 { x: 38.6; y: 107; skew-x: -4; skew-y: -4; }
        frame 109 { x: 39.7; y: 107.3; skew-x: -6.2; skew-y: -6.2; scale-x: 0.792; scale-y: 0.987; }
        frame 110 { x: 40.6; y: 107.6; skew-x: -8.4; skew-y: -8.4; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 41.7; y: 108.1; skew-x: -10.7; skew-y: -10.7; }
        frame 112 { x: 42.8; y: 108.5; skew-x: -13; skew-y: -13; }
        frame 113 { x: 43.4; y: 108.1; skew-x: -12.7; skew-y: -12.7; scale-x: 0.791; scale-y: 0.986; }
        frame 114 { x: 44; y: 107.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.985; }
        frame 115 { x: 44.6; y: 107.2; skew-x: -12.5; skew-y: -12.5; scale-x: 0.79; scale-y: -10000; }
        frame 116 { x: 45.1; y: 106.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 117 { x: 45.7; y: 107; skew-x: -14.5; skew-y: -14.5; scale-x: 0.788; scale-y: 0.983; }
        frame 118 { x: 46.2; y: 107.2; skew-x: -16.5; skew-y: -16.5; scale-x: 0.787; scale-y: 0.981; }
        frame 119 { x: 46.7; y: 107.5; skew-x: -18.7; skew-y: -18.7; scale-x: 0.785; scale-y: 0.979; }
        frame 120 { x: 47.3; y: 107.9; skew-x: -20.8; skew-y: -20.8; scale-x: -10000; scale-y: 0.978; }
        frame 121 { x: 47.5; y: 107.8; skew-x: -14.2; skew-y: -14.2; scale-x: 0.788; scale-y: 0.933; }
        frame 122 { x: 47.6; y: 108; skew-x: -7.7; skew-y: -7.7; scale-x: 0.791; scale-y: 0.888; }
        frame 123 { x: 47.8; y: 108.2; skew-x: -1.2; skew-y: -1.2; scale-x: 0.795; scale-y: 0.844; }
        frame 124 { x: 47.9; y: 108.5; skew-x: 5.1; skew-y: 5.1; scale-x: 0.799; scale-y: 0.799; }
        frame 125 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 47.5; y: 108.9; skew-x: 2.8; skew-y: 2.8; }
        frame 127 { x: 47; y: 109.3; skew-x: 0.3; skew-y: 0.3; }
        frame 128 { x: 46.8; y: 109.7; skew-x: -1.8; skew-y: -1.8; }
        frame 129 { x: -10000; y: -10000; skew-x: -1.7; skew-y: -1.7; scale-x: 0.798; scale-y: 0.798; }
        frame 130 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 131 { skew-x: -1.8; skew-y: -1.8; scale-x: 0.799; scale-y: 0.799; }
        frame 132 { x: 48.6; y: 108.8; skew-x: 4; skew-y: 4; scale-x: 0.798; scale-y: 0.798; }
        frame 133 { x: 50.8; y: 107.9; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 134 { x: 52.8; y: 107.2; skew-x: 16.2; skew-y: 16.2; }
        frame 135 { x: 54.6; y: 106.9; skew-x: 21.3; skew-y: 21.3; scale-x: 0.797; scale-y: 0.797; }
        frame 136 { x: 56.6; y: 106.8; skew-x: 26.5; skew-y: 26.5; scale-x: 0.796; scale-y: 0.796; }
        frame 137 { x: 58.5; y: -10000; skew-x: 31.7; skew-y: 31.7; scale-x: 0.797; scale-y: 0.797; }
        frame 138 { x: 64; y: 106.7; skew-x: 46.6; skew-y: 46.6; scale-x: 0.795; scale-y: 0.795; }
        frame 139 { x: 69.3; y: 107.4; skew-x: 61.5; skew-y: 61.5; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 74.5; y: 109.2; skew-x: 76.4; skew-y: 76.4; }
        frame 141 { x: 77.8; y: 109.8; skew-x: 90.8; skew-y: 90.8; scale-x: 0.796; scale-y: 0.821; }
        frame 142 { x: 80.3; y: 111.3; skew-x: 105.1; skew-y: 105.3; scale-x: -10000; scale-y: 0.847; }
        frame 143 { x: 82.1; y: 113.3; skew-x: 119.7; skew-y: 119.9; scale-x: 0.797; scale-y: 0.874; }
        frame 144 { x: 83.4; y: 115.5; skew-x: 116.6; skew-y: 116.8; scale-x: 0.796; scale-y: 0.908; }
        frame 145 { x: 84.6; y: 117.8; skew-x: 113.8; skew-y: 114; scale-x: -10000; scale-y: 0.944; }
        frame 146 { x: 85.8; y: 120; skew-x: 110.9; skew-y: 111.1; scale-y: 0.981; }
        frame 147 { x: 84.5; y: 121.5; skew-x: 114; skew-y: 108.3; scale-x: 0.73; scale-y: 1.009; }
        frame 148 { x: 84.8; y: 120.7; skew-x: 113.3; skew-y: 109.5; scale-x: 0.751; scale-y: 0.998; }
        frame 149 { x: 85.3; y: 119.8; skew-x: 112.6; skew-y: 110.8; scale-x: 0.773; scale-y: 0.989; }
        frame 150 { x: 85.7; y: 119; skew-x: 111.9; skew-y: 112.1; scale-x: 0.796; scale-y: 0.981; }
        frame 151 { x: -10000; y: 119.5; skew-x: 111.3; skew-y: 111.5; scale-x: 0.795; scale-y: 0.98; }
        frame 152 { x: 85.8; y: 120; skew-x: 110.9; skew-y: 111.1; scale-x: 0.796; scale-y: 0.981; }
        frame 153 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_balloon_outerleg_upper";
        frame-count: 155;
        frame 0 { x: 50; y: 54.4; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_INNERLEG_UPPER; }
        frame 1 { x: 50.5; y: 55; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 51; y: 55.7; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: 51.5; y: 56.5; skew-x: -8.3; skew-y: -8.3; scale-x: 0.8; scale-y: 0.8; }
        frame 4 { x: 51; y: 58.6; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 5 { x: 50.4; y: 60.8; skew-x: -2.7; skew-y: -2.7; scale-x: 0.8; scale-y: 0.8; }
        frame 6 { x: 50; y: 62.9; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 50.1; y: 61.7; skew-x: 0.3; skew-y: 0.3; scale-y: 0.813; }
        frame 8 { x: 50.3; y: 60.6; skew-x: 0.5; skew-y: 0.5; scale-y: 0.826; }
        frame 9 { x: 50.5; y: 59.5; skew-x: 0.8; skew-y: 0.8; scale-y: 0.838; }
        frame 10 { x: 50.3; y: 57.9; skew-x: 0.5; skew-y: 0.5; scale-y: 0.826; }
        frame 11 { x: 50; y: 56.3; skew-x: 0.3; skew-y: 0.3; scale-y: 0.813; }
        frame 12 { y: 54.4; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 14 { x: 49.8; y: 54.2; skew-x: -0.7; skew-y: -0.7; }
        frame 15 { x: 49.6; y: 54; skew-x: -1.7; skew-y: -1.7; }
        frame 16 { x: 49.5; y: 53.9; skew-x: -2.7; skew-y: -2.7; }
        frame 17 { x: 49.3; y: 53.7; skew-x: -3.7; skew-y: -3.7; }
        frame 18 { x: 49.1; y: 53.5; skew-x: -4.5; skew-y: -4.5; }
        frame 19 { x: 49; y: 53.4; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { x: 48.9; y: 53.3; skew-x: -6.5; skew-y: -6.5; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: 40.5; y: 53.2; skew-x: 0; skew-y: -1.4; scale-x: 0.801; scale-y: -10000; }
        frame 22 { x: 32.4; y: 53.4; skew-x: 6.5; skew-y: 3.5; scale-x: 0.802; scale-y: 0.799; }
        frame 23 { x: 24.3; y: 53.5; skew-x: 13.1; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 16.3; y: 54; skew-x: 19.8; skew-y: 13.6; scale-x: 0.804; }
        frame 25 { x: 20.5; y: 53.3; skew-x: 9.1; skew-y: 5; scale-x: 0.802; }
        frame 26 { x: 24.8; y: 52.8; skew-x: -1.2; skew-y: -3.4; scale-x: 0.801; }
        frame 27 { x: 29.3; y: 52.5; skew-x: -12; skew-y: -12; scale-x: 0.799; }
        frame 28 { x: 27.7; y: 53.1; skew-x: -7.9; skew-y: -7.9; scale-x: -10000; }
        frame 29 { x: 26.1; y: 53.8; skew-x: -3.9; skew-y: -3.9; scale-x: 0.8; scale-y: 0.8; }
        frame 30 { x: 24.5; y: 54.4; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 50; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: -10000; }
        frame 33 { x: 52; y: 64.8; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 54; y: 75.5; skew-x: 14.9; skew-y: 14.9; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: -10000; y: 78.7; skew-x: 14.8; skew-y: 14.8; }
        frame 36 { y: 82; skew-x: 14.9; skew-y: 14.9; }
        frame 37 { x: 53.5; y: 86.1; skew-x: 21.4; skew-y: 21.4; scale-y: 0.692; }
        frame 38 { x: -10000; y: 85.9; skew-x: 21; skew-y: 21; scale-x: 0.798; scale-y: 0.702; }
        frame 39 { x: 53.4; y: 85.7; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: 0.713; }
        frame 40 { x: 53.3; y: 85.3; skew-x: 20.1; skew-y: 20.1; scale-y: 0.723; }
        frame 41 { x: -10000; y: 85.2; skew-x: 19.8; skew-y: 19.8; scale-y: 0.734; }
        frame 42 { x: 53.2; y: 84.9; skew-x: 19.3; skew-y: 19.3; scale-x: 0.797; scale-y: 0.745; }
        frame 43 { x: 53.1; y: 84.6; skew-x: 19; skew-y: 19; scale-x: -10000; scale-y: 0.756; }
        frame 44 { x: -10000; y: 84.3; skew-x: 18.6; skew-y: 18.6; scale-y: 0.767; }
        frame 45 { x: 53; y: 84.1; skew-x: 18.3; skew-y: 18.3; scale-x: 0.798; scale-y: 0.778; }
        frame 46 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 56.7; y: 84.6; skew-x: 27.6; skew-y: 27.6; scale-x: 0.796; scale-y: 0.777; }
        frame 48 { x: 60.4; y: 85.5; skew-x: 36.9; skew-y: 36.9; scale-x: 0.797; scale-y: -10000; }
        frame 49 { x: 59.4; y: 84.8; skew-x: 33.1; skew-y: 33.3; scale-x: 0.796; scale-y: 0.78; }
        frame 50 { x: 58.4; y: 84.1; skew-x: 29.6; skew-y: 29.6; scale-x: 0.797; scale-y: 0.784; }
        frame 51 { x: 57.4; y: 83.5; skew-x: 25.8; skew-y: 25.8; scale-x: -10000; scale-y: 0.787; }
        frame 52 { x: 56.3; y: 83; skew-x: 22.1; skew-y: 22.1; scale-x: 0.798; scale-y: 0.791; }
        frame 53 { x: 55.3; y: 82.4; skew-x: 18.5; skew-y: 18.5; scale-x: -10000; scale-y: 0.795; }
        frame 54 { x: 54; y: 82; skew-x: 14.9; skew-y: 14.9; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { y: 81.9; skew-x: 16.3; skew-y: 16.3; scale-x: 0.798; scale-y: 0.798; }
        frame 56 { x: 53.9; y: 81.8; skew-x: 17.8; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 54; y: 81.9; skew-x: 16.3; skew-y: 16.3; }
        frame 58 { y: 82; skew-x: 14.9; skew-y: 14.9; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 54.3; y: 82.2; skew-x: 15.3; skew-y: 15.3; }
        frame 61 { x: 54.5; y: 82.3; skew-x: 15.8; skew-y: 15.8; }
        frame 62 { x: 54.7; y: 82.5; skew-x: 16.2; skew-y: 16.2; }
        frame 63 { x: 54.5; y: -10000; skew-x: 16.8; skew-y: 16.8; scale-x: 0.798; scale-y: 0.798; }
        frame 64 { x: 54.4; y: 82.7; skew-x: 17.6; skew-y: 17.6; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -10000; y: -10000; skew-x: 18.5; skew-y: 18.5; scale-x: 0.799; scale-y: 0.799; }
        frame 66 { x: 53.8; y: 82.6; skew-x: 18.6; skew-y: 18.6; scale-x: 0.798; scale-y: 0.798; }
        frame 67 { x: 53.1; y: 82.5; skew-x: 18.8; skew-y: 18.8; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 52.8; y: 82.3; skew-x: 19; skew-y: 19; scale-x: 0.799; scale-y: 0.799; }
        frame 69 { x: 53.2; y: 82.2; skew-x: 17.6; skew-y: 17.6; scale-x: 0.798; scale-y: 0.798; }
        frame 70 { x: 53.7; y: 82.1; skew-x: 16.3; skew-y: 16.3; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 54; y: 82; skew-x: 14.9; skew-y: 14.9; scale-x: 0.799; scale-y: 0.799; }
        frame 72 { x: 54.3; y: 82.2; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 54.5; y: 82.3; skew-x: 15.8; skew-y: 15.8; }
        frame 74 { x: 54.7; y: 82.5; skew-x: 16.2; skew-y: 16.2; }
        frame 75 { x: 54.5; y: -10000; skew-x: 16.8; skew-y: 16.8; scale-x: 0.798; scale-y: 0.798; }
        frame 76 { x: 54.4; y: 82.7; skew-x: 17.6; skew-y: 17.6; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -10000; y: -10000; skew-x: 18.5; skew-y: 18.5; scale-x: 0.799; scale-y: 0.799; }
        frame 78 { x: 53.8; y: 82.6; skew-x: 18.6; skew-y: 18.6; scale-x: 0.798; scale-y: 0.798; }
        frame 79 { x: 53.1; y: 82.5; skew-x: 18.8; skew-y: 18.8; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 52.8; y: 82.3; skew-x: 19; skew-y: 19; scale-x: 0.799; scale-y: 0.799; }
        frame 81 { x: 53.2; y: 82.2; skew-x: 17.6; skew-y: 17.6; scale-x: 0.798; scale-y: 0.798; }
        frame 82 { x: 53.7; y: 82.1; skew-x: 16.3; skew-y: 16.3; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 54; y: 82; skew-x: 14.9; skew-y: 14.9; scale-x: 0.799; scale-y: 0.799; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 85 { y: 81.9; skew-x: 16.5; skew-y: 16.5; scale-x: 0.798; scale-y: 0.798; }
        frame 86 { x: 54.1; y: 81.8; skew-x: 18.3; skew-y: 18.3; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 54; y: -10000; skew-x: 19.8; skew-y: 19.8; }
        frame 88 { x: 54.1; skew-x: 21.6; skew-y: 21.6; scale-x: 0.799; scale-y: 0.799; }
        frame 89 { x: 54.5; y: 81.6; skew-x: 23.1; skew-y: 23.1; scale-x: 0.797; scale-y: 0.797; }
        frame 90 { x: 54.8; y: 81.3; skew-x: 24.6; skew-y: 24.6; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 55.1; y: 81.2; skew-x: 26.1; skew-y: 26.1; }
        frame 92 { x: 55.6; y: 80.8; skew-x: 27.7; skew-y: 27.7; scale-x: 0.798; scale-y: 0.798; }
        frame 93 { x: 55.4; y: -10000; skew-x: 28.5; skew-y: 28.5; scale-x: 0.796; scale-y: 0.796; }
        frame 94 { x: 55.3; skew-x: 29.3; skew-y: 29.3; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 55; skew-x: 30.1; skew-y: 30.1; }
        frame 96 { x: 54.9; y: 80.7; skew-x: 31; skew-y: 31; scale-x: 0.797; scale-y: 0.797; }
        frame 97 { x: 55; y: 80.6; skew-x: 31.9; skew-y: 31.9; scale-x: 0.796; scale-y: 0.796; }
        frame 98 { x: 55.1; y: -10000; skew-x: 32.8; skew-y: 32.8; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 55.5; skew-x: 33.8; skew-y: 33.8; }
        frame 100 { x: -10000; y: 80.5; skew-x: 34.8; skew-y: 34.8; scale-x: 0.797; scale-y: 0.797; }
        frame 101 { y: 81.7; skew-x: 36.8; skew-y: 36.8; scale-x: 0.795; scale-y: 0.795; }
        frame 102 { y: 82.8; skew-x: 38.9; skew-y: 38.9; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 55.4; y: 84; skew-x: 40.9; skew-y: 40.9; }
        frame 104 { x: 55.5; y: 85; skew-x: 43; skew-y: 43; scale-x: 0.796; scale-y: 0.796; }
        frame 105 { x: 54.6; y: 84.5; skew-x: 38.9; skew-y: 38.9; scale-x: 0.795; scale-y: 0.795; }
        frame 106 { x: 53.9; y: 84.2; skew-x: 34.8; skew-y: 34.8; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 53.1; y: 83.8; skew-x: 30.8; skew-y: 30.8; }
        frame 108 { x: 52.3; y: 83.7; skew-x: 26.7; skew-y: 26.7; scale-x: 0.796; scale-y: 0.796; }
        frame 109 { x: -10000; y: 83.6; skew-x: 24.8; skew-y: 24.8; scale-x: 0.794; scale-y: 0.794; }
        frame 110 { x: 52.1; y: 83.5; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: -10000; y: 83.3; skew-x: 20.8; skew-y: 20.8; }
        frame 112 { y: -10000; skew-x: 18.9; skew-y: 18.9; scale-x: 0.795; scale-y: 0.795; }
        frame 113 { x: 52.3; y: 82.8; skew-x: 18.1; skew-y: 18.1; scale-x: 0.794; scale-y: 0.794; }
        frame 114 { x: 52.6; y: 82.2; skew-x: 17.5; skew-y: 17.5; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 52.8; y: 81.6; skew-x: 16.8; skew-y: 16.8; }
        frame 116 { x: 53.1; y: 81.1; skew-x: 16.2; skew-y: 16.2; scale-x: 0.795; scale-y: 0.795; }
        frame 117 { x: 53.3; y: 81.8; skew-x: 14.3; skew-y: 14.3; scale-x: 0.793; scale-y: 0.793; }
        frame 118 { x: -10000; y: 82.6; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 53.5; y: 83.3; skew-x: 10.3; skew-y: 10.3; }
        frame 120 { x: -10000; y: 84; skew-x: 8.6; skew-y: 8.6; }
        frame 121 { x: 53.6; y: 83.5; skew-x: 10; skew-y: 10; scale-x: 0.794; scale-y: 0.794; }
        frame 122 { x: 53.7; y: 82.9; skew-x: 11.6; skew-y: 11.6; scale-x: 0.795; scale-y: 0.795; }
        frame 123 { x: 53.9; y: 82.3; skew-x: 13.3; skew-y: 13.3; scale-x: 0.797; scale-y: 0.797; }
        frame 124 { x: 54; y: 82; skew-x: 14.9; skew-y: 14.9; scale-x: 0.799; scale-y: 0.799; }
        frame 125 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 54.8; y: 82.8; skew-x: 16.3; skew-y: 16.3; }
        frame 127 { x: 55.6; y: 83.5; skew-x: 18; skew-y: 18; scale-x: 0.798; scale-y: 0.798; }
        frame 128 { x: 56.4; y: 84.2; skew-x: 19.7; skew-y: 19.7; scale-x: 0.799; scale-y: 0.799; }
        frame 129 { x: 57.5; y: 84.9; skew-x: 21.6; skew-y: 21.6; scale-x: 0.798; scale-y: 0.798; }
        frame 130 { x: 58.7; y: 85.6; skew-x: 23.5; skew-y: 23.5; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: 59.9; y: 86.3; skew-x: 25.5; skew-y: 25.5; scale-x: 0.799; scale-y: 0.799; }
        frame 132 { x: 65.1; y: 87.7; skew-x: 33.6; skew-y: 33.6; scale-x: 0.797; scale-y: 0.797; }
        frame 133 { x: 70.2; y: 89.3; skew-x: 41.9; skew-y: 41.9; scale-x: -10000; scale-y: -10000; }
        frame 134 { x: 75.2; y: 91.3; skew-x: 50.1; skew-y: 50.1; scale-x: 0.798; scale-y: 0.798; }
        frame 135 { x: 78.3; y: 93.3; skew-x: 55.4; skew-y: 55.4; scale-x: 0.796; scale-y: 0.796; }
        frame 136 { x: 81.3; y: 95.3; skew-x: 60.4; skew-y: 60.4; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 84.3; y: 97.5; skew-x: 65.6; skew-y: 65.6; scale-x: 0.797; scale-y: 0.797; }
        frame 138 { x: 89.6; y: 99.9; skew-x: 70.9; skew-y: 70.9; scale-x: 0.796; scale-y: 0.796; }
        frame 139 { x: 94.8; y: 102.3; skew-x: 76.2; skew-y: 76.2; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 99.8; y: 104.8; skew-x: 81.2; skew-y: 81.2; }
        frame 141 { x: 101.9; y: 109.9; skew-x: 91.3; skew-y: 91.3; scale-x: 0.797; scale-y: 0.795; }
        frame 142 { x: 103.7; y: 115.1; skew-x: 101.3; skew-y: 101.3; scale-x: -10000; scale-y: 0.794; }
        frame 143 { x: 105; y: 120.5; skew-x: 111.4; skew-y: 111.7; scale-x: 0.799; scale-y: 0.793; }
        frame 144 { x: 105.8; y: 120.1; skew-x: 105.6; skew-y: 105.8; scale-x: 0.798; scale-y: 0.792; }
        frame 145 { x: 106.4; y: 119.8; skew-x: 100; skew-y: 100.3; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 106.9; y: 119.5; skew-x: 94.4; skew-y: 94.6; }
        frame 147 { x: 106.6; y: 121; skew-x: 95.1; skew-y: 94; scale-x: 0.716; scale-y: 0.828; }
        frame 148 { x: -10000; y: 120.9; skew-x: 96.3; skew-y: 95.5; scale-x: 0.743; scale-y: 0.816; }
        frame 149 { x: 106.7; y: 120.8; skew-x: 97.3; skew-y: 97.3; scale-x: 0.77; scale-y: 0.804; }
        frame 150 { x: 106.9; y: 120.6; skew-x: 98.7; skew-y: 98.9; scale-x: 0.798; scale-y: 0.792; }
        frame 151 { x: -10000; y: 120.1; skew-x: 96.5; skew-y: 96.8; scale-x: -10000; scale-y: -10000; }
        frame 152 { y: 119.5; skew-x: 94.4; skew-y: 94.6; }
        frame 153 { y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 155;
        frame 0 { x: -6.3; y: 32.4; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_HEAD; }
        frame 1 { x: -4.7; y: 31.1; skew-x: 3.6; skew-y: 3.6; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -3; y: 30; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: -1.2; y: 28.9; skew-x: 11.1; skew-y: 11.1; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: -3.1; y: 32.9; skew-x: 7.3; skew-y: 7.3; }
        frame 5 { x: -4.8; y: 36.8; skew-x: 3.6; skew-y: 3.6; scale-x: 0.8; scale-y: 0.8; }
        frame 6 { x: -6.3; y: 40.9; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: -7; y: 42.2; skew-x: -1.9; skew-y: -1.9; }
        frame 8 { x: -7.7; y: 43.5; skew-x: -3.9; skew-y: -3.9; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: -8.4; y: 44.9; skew-x: -6.1; skew-y: -6.1; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: -7.8; y: 40.7; skew-x: -3.9; skew-y: -3.9; }
        frame 11 { x: -7.1; y: 36.5; skew-x: -1.9; skew-y: -1.9; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: -6.3; y: 32.4; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: -6.8; y: 33.4; skew-x: -1.2; skew-y: -1.2; }
        frame 15 { x: -7.3; y: 34.3; skew-x: -2.4; skew-y: -2.4; }
        frame 16 { x: -7.8; y: 35.3; skew-x: -3.7; skew-y: -3.7; }
        frame 17 { x: -8.2; y: 36.1; skew-x: -4.9; skew-y: -4.9; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: -8.6; y: 37.1; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -9.1; y: 38.1; skew-x: -7.4; skew-y: -7.4; }
        frame 20 { x: -9.6; y: 39.1; skew-x: -8.7; skew-y: -8.7; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: -16.7; y: 35.5; skew-x: -4.7; skew-y: -4.4; scale-x: 0.806; scale-y: 0.799; }
        frame 22 { x: -23.6; y: 32.2; skew-x: -0.5; skew-y: -0.2; scale-x: 0.813; scale-y: 0.8; }
        frame 23 { x: -30.6; y: 29; skew-x: 3.3; skew-y: 3.5; scale-x: 0.819; scale-y: -10000; }
        frame 24 { x: -37.3; y: 25.8; skew-x: 7.4; skew-y: 7.9; scale-x: 0.826; }
        frame 25 { x: -35.4; y: 30.1; skew-x: 1.8; skew-y: 2; scale-x: 0.817; }
        frame 26 { x: -33.3; y: 34.6; skew-x: -3.7; skew-y: -3.4; scale-x: 0.808; }
        frame 27 { x: -31.2; y: 39.4; skew-x: -9.3; skew-y: -9.3; scale-x: 0.8; }
        frame 28 { x: -31.5; y: 37; skew-x: -6.2; skew-y: -6.2; scale-x: 0.799; scale-y: 0.799; }
        frame 29 { x: -31.7; y: 34.6; skew-x: -2.9; skew-y: -2.9; scale-x: 0.8; scale-y: 0.8; }
        frame 30 { x: -31.8; y: 32.4; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: -6.3; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: -10000; }
        frame 33 { x: 1.8; y: 30.4; skew-x: 11.3; skew-y: 11.3; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 10.6; y: 29.3; skew-x: 22.6; skew-y: 22.6; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 8.1; y: 30.3; skew-x: 16.3; skew-y: 16.3; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: 5.7; y: 31.6; skew-x: 10.1; skew-y: 10.1; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: -2.3; y: 40.8; skew-x: -2; skew-y: -2; scale-x: 0.796; scale-y: 0.796; }
        frame 38 { x: -13.2; y: 75.4; skew-x: -26.7; skew-y: -26.7; scale-x: 0.793; scale-y: 0.793; }
        frame 39 { x: -19.2; y: 111.9; skew-x: -51.5; skew-y: -51.5; scale-x: 0.792; scale-y: 0.792; }
        frame 40 { x: -22.4; y: 103.3; skew-x: -42.5; skew-y: -47.6; scale-x: 0.789; scale-y: 0.786; }
        frame 41 { x: -17.9; y: 78.8; skew-x: -28.2; skew-y: -28.2; scale-x: 0.793; scale-y: 0.793; }
        frame 42 { x: -11.9; y: 64; skew-x: -16.7; skew-y: -16.7; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: -4.9; y: 49.6; skew-x: -5.2; skew-y: -5.2; scale-x: 0.795; scale-y: 0.795; }
        frame 44 { x: 2.1; y: 38.3; skew-x: 5; skew-y: 5; scale-x: 0.794; scale-y: 0.794; }
        frame 45 { x: 9.9; y: 27.7; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 37.5; y: 15.7; skew-x: 42.5; skew-y: 42.5; scale-x: 0.793; scale-y: 0.793; }
        frame 47 { x: 62.5; y: 16.5; skew-x: 61.2; skew-y: 61.2; scale-x: 0.791; scale-y: 0.791; }
        frame 48 { x: 86.3; y: 20.2; skew-x: 79.9; skew-y: 79.9; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 83.4; y: 20.3; skew-x: 79.7; skew-y: 79.7; }
        frame 50 { x: 80.5; y: 20.7; skew-x: 79.6; skew-y: 79.6; }
        frame 51 { x: 49.9; y: 16; skew-x: 50.1; skew-y: 50.1; scale-x: 0.792; scale-y: 0.792; }
        frame 52 { x: 35.1; y: 20.8; skew-x: 36.8; skew-y: 36.8; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 20.4; y: 27.1; skew-x: 23.3; skew-y: 23.3; scale-x: 0.794; scale-y: 0.794; }
        frame 54 { x: 6.2; y: 34.4; skew-x: 10.1; skew-y: 10.1; scale-x: 0.797; scale-y: 0.797; }
        frame 55 { x: 2; y: 39.3; skew-x: 3.8; skew-y: 3.8; scale-x: 0.796; scale-y: 0.796; }
        frame 56 { x: -1.8; y: 44.5; skew-x: -2.5; skew-y: -2.5; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 2.8; y: 39.4; skew-x: 3.8; skew-y: 3.8; }
        frame 58 { x: 7.7; y: 34.4; skew-x: 10.1; skew-y: 10.1; scale-x: 0.797; scale-y: 0.797; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 10.3; y: 32.7; skew-x: 13; skew-y: 13; scale-x: 0.796; scale-y: 0.796; }
        frame 61 { x: 12.9; y: 31; skew-x: 16.1; skew-y: 16.1; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 15.4; y: 29.4; skew-x: 19.2; skew-y: 19.2; scale-x: 0.797; scale-y: 0.797; }
        frame 63 { x: 18; y: 27.5; skew-x: 22.5; skew-y: 22.5; scale-x: 0.79; scale-y: 0.803; }
        frame 64 { x: 20.7; y: 25.7; skew-x: 25.8; skew-y: 25.8; scale-x: 0.783; scale-y: 0.81; }
        frame 65 { x: 23.4; y: 24.3; skew-x: 29.1; skew-y: 29.1; scale-x: 0.778; scale-y: 0.818; }
        frame 66 { x: 18.4; y: 26.5; skew-x: 24.1; skew-y: 24.5; scale-x: 0.781; scale-y: 0.815; }
        frame 67 { x: 13.7; y: 28.8; skew-x: 19.1; skew-y: 20; scale-x: 0.786; scale-y: 0.813; }
        frame 68 { x: 8.9; y: 31.2; skew-x: 14.2; skew-y: 15.5; scale-x: 0.79; scale-y: -10000; }
        frame 69 { x: 3.6; y: 35.4; skew-x: 7.4; skew-y: 8.8; scale-x: 0.791; scale-y: 0.79; }
        frame 70 { x: 4.7; y: 35.3; skew-x: 8.8; skew-y: 9.3; scale-x: 0.794; scale-y: 0.793; }
        frame 71 { x: 5.9; y: 35.1; skew-x: 10.1; skew-y: 10.1; scale-x: 0.797; scale-y: 0.797; }
        frame 72 { x: 9; y: 32.8; skew-x: 13; skew-y: 13; scale-x: 0.796; scale-y: 0.796; }
        frame 73 { x: 12.2; y: 30.6; skew-x: 16.1; skew-y: 16.1; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 15.4; y: 28.4; skew-x: 19.2; skew-y: 19.2; scale-x: 0.797; scale-y: 0.797; }
        frame 75 { x: 18.1; y: 27; skew-x: 22.5; skew-y: 22.5; scale-x: 0.79; scale-y: 0.803; }
        frame 76 { x: 20.9; y: 25.8; skew-x: 25.8; skew-y: 25.8; scale-x: 0.783; scale-y: 0.81; }
        frame 77 { x: 23.6; y: 24.8; skew-x: 29.1; skew-y: 29.1; scale-x: 0.778; scale-y: 0.818; }
        frame 78 { x: 18.6; y: 26.8; skew-x: 24.1; skew-y: 24.5; scale-x: 0.781; scale-y: 0.815; }
        frame 79 { x: 13.6; y: 28.9; skew-x: 19.1; skew-y: 20; scale-x: 0.786; scale-y: 0.813; }
        frame 80 { x: 8.6; y: 31.2; skew-x: 14.2; skew-y: 15.5; scale-x: 0.79; scale-y: -10000; }
        frame 81 { x: 4; y: 35.4; skew-x: 8.2; skew-y: 9.6; scale-x: 0.791; scale-y: 0.79; }
        frame 82 { x: 6.5; y: 33.5; skew-x: 11.3; skew-y: 11.8; scale-x: 0.794; scale-y: 0.802; }
        frame 83 { x: 7.7; y: 34.4; skew-x: 10.1; skew-y: 10.1; scale-x: 0.797; scale-y: 0.797; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 7.3; y: 33.5; skew-x: 9.6; skew-y: 9.6; scale-x: 0.796; scale-y: 0.796; }
        frame 86 { x: 6.7; y: 32.5; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 9.2; y: 30.4; skew-x: 11.3; skew-y: 11.3; scale-x: 0.795; scale-y: 0.795; }
        frame 88 { x: 11.9; y: 28.2; skew-x: 13.7; skew-y: 13.7; scale-x: 0.796; scale-y: 0.796; }
        frame 89 { x: 13.2; y: 27.1; skew-x: 15.3; skew-y: 15.3; scale-x: 0.795; scale-y: 0.795; }
        frame 90 { x: 14.5; y: 26.1; skew-x: 17; skew-y: 17; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 15.9; y: 25; skew-x: 18.8; skew-y: 18.8; }
        frame 92 { x: 17.2; y: 24.1; skew-x: 20.5; skew-y: 20.5; }
        frame 93 { x: 17.9; y: 23.2; skew-x: 21.3; skew-y: 21.3; scale-x: 0.794; scale-y: 0.794; }
        frame 94 { x: 18.9; y: 22.3; skew-x: 22.3; skew-y: 22.3; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 19.8; y: 21.5; skew-x: 23.3; skew-y: 23.3; }
        frame 96 { x: 20.7; y: 20.6; skew-x: 24.3; skew-y: 24.3; scale-x: 0.795; scale-y: 0.795; }
        frame 97 { x: 23.1; y: 19.5; skew-x: 26.6; skew-y: 26.6; scale-x: 0.794; scale-y: 0.793; }
        frame 98 { x: 25.5; y: 18.4; skew-x: 29.1; skew-y: 29.1; scale-x: 0.795; scale-y: -10000; }
        frame 99 { x: 27.9; y: 17.4; skew-x: 31.6; skew-y: 31.6; scale-x: -10000; scale-y: 0.792; }
        frame 100 { x: 30.2; y: 16.4; skew-x: 34; skew-y: 33.9; scale-x: 0.797; scale-y: 0.793; }
        frame 101 { x: 28.5; y: 18.8; skew-x: 33.1; skew-y: 33.1; scale-x: 0.795; scale-y: 0.791; }
        frame 102 { x: 26.7; y: 21; skew-x: 32.4; skew-y: 32.4; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 17.6; y: 26.9; skew-x: 22.1; skew-y: 22.1; scale-x: 0.794; }
        frame 104 { x: 8.9; y: 33.2; skew-x: 11.9; skew-y: 11.8; scale-x: 0.796; scale-y: 0.792; }
        frame 105 { x: 10.3; y: 32.1; skew-x: 12.3; skew-y: 12.3; scale-x: 0.795; scale-y: 0.791; }
        frame 106 { x: 11.5; y: 30.9; skew-x: 13; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 15.4; y: 26.6; skew-x: 18.3; skew-y: 18.3; scale-x: 0.794; }
        frame 108 { x: 19.4; y: 22.5; skew-x: 23.7; skew-y: 23.7; scale-x: 0.795; scale-y: 0.792; }
        frame 109 { x: 20.2; y: 22; skew-x: 24.3; skew-y: 24.3; scale-x: 0.794; scale-y: 0.791; }
        frame 110 { x: 21; y: 21.5; skew-x: 25.1; skew-y: 25.1; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 21.8; y: 21; skew-x: 25.8; skew-y: 25.8; }
        frame 112 { x: 22.6; y: 20.5; skew-x: 26.6; skew-y: 26.5; scale-x: 0.795; }
        frame 113 { x: 22.1; y: 19.9; skew-x: 25.8; skew-y: 25.6; scale-x: 0.794; scale-y: 0.79; }
        frame 114 { x: 21.8; y: 19.3; skew-x: 24.8; skew-y: 24.8; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 21.4; y: 18.7; skew-x: 24.1; skew-y: 24.1; }
        frame 116 { x: 21; y: 18; skew-x: 23.3; skew-y: 23.3; scale-y: 0.791; }
        frame 117 { x: 23.9; y: 18.7; skew-x: 26.8; skew-y: 26.8; scale-x: 0.793; scale-y: 0.79; }
        frame 118 { x: 26.6; y: 19.5; skew-x: 30.3; skew-y: 30.3; scale-x: 0.794; scale-y: -10000; }
        frame 119 { x: 17.7; y: 25.5; skew-x: 21.3; skew-y: 21.3; scale-x: -10000; }
        frame 120 { x: 9.2; y: 32; skew-x: 12.3; skew-y: 12.3; scale-x: 0.795; scale-y: 0.792; }
        frame 121 { x: 7; y: 33.3; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 122 { x: 5; y: 34.4; skew-x: 6.5; skew-y: 6.5; scale-x: 0.796; scale-y: 0.794; }
        frame 123 { x: 6.3; y: -10000; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: 0.795; }
        frame 124 { x: 7.7; skew-x: 10.1; skew-y: 10.1; scale-x: 0.797; scale-y: 0.797; }
        frame 125 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 126 { cel: -10000; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 155;
        frame 0 { x: 4.2; y: 68; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_JAW; }
        frame 1 { x: 3.6; y: 66.4; skew-x: 3.6; skew-y: 3.6; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 3; y: 64.9; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: 2.5; y: 63.3; skew-x: 11.1; skew-y: 11.1; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 2.9; y: 67.7; skew-x: 7.3; skew-y: 7.3; }
        frame 5 { x: 3.5; y: 72; skew-x: 3.6; skew-y: 3.6; scale-x: 0.8; scale-y: 0.8; }
        frame 6 { x: 4.2; y: 76.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 4.8; y: 78.5; skew-x: -3.7; skew-y: -1.9; scale-x: 0.801; }
        frame 8 { x: 5.3; y: 80.6; skew-x: -7.4; skew-y: -3.9; scale-x: -10000; scale-y: 0.799; }
        frame 9 { x: 6; y: 82.8; skew-x: -11.2; skew-y: -6.1; scale-x: 0.803; scale-y: -10000; }
        frame 10 { x: 5.3; y: 77.8; skew-x: -7.4; skew-y: -3.9; scale-x: 0.801; }
        frame 11 { x: 4.7; y: 72.9; skew-x: -3.7; skew-y: -1.9; scale-x: -10000; scale-y: 0.8; }
        frame 12 { x: 4.2; y: 68; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: -10000; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 14 { x: 4.5; y: 68.8; skew-x: -1.2; skew-y: -1.2; }
        frame 15 { x: 4.8; y: 69.6; skew-x: -2.4; skew-y: -2.4; }
        frame 16 { x: 5.1; y: 70.5; skew-x: -3.7; skew-y: -3.7; }
        frame 17 { x: 5.5; y: 71.4; skew-x: -4.9; skew-y: -4.9; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 5.8; y: 72.3; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 6.2; y: 73.1; skew-x: -7.4; skew-y: -7.4; }
        frame 20 { x: 6.5; y: 74.1; skew-x: -8.7; skew-y: -8.7; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: -3.8; y: 70.9; skew-x: -3.9; skew-y: -3.9; scale-x: 0.806; scale-y: 0.799; }
        frame 22 { x: -14.1; y: 67.7; skew-x: 0.5; skew-y: 0.8; scale-x: 0.813; scale-y: 0.8; }
        frame 23 { x: -24.3; y: 64.6; skew-x: 5.1; skew-y: 5.5; scale-x: 0.819; scale-y: -10000; }
        frame 24 { x: -34.4; y: 61.5; skew-x: 9.9; skew-y: 10.4; scale-x: 0.826; }
        frame 25 { x: -27.8; y: 65.7; skew-x: 3.3; skew-y: 3.8; scale-x: 0.817; }
        frame 26 { x: -21.3; y: 70; skew-x: -2.7; skew-y: -2.7; scale-x: 0.808; }
        frame 27 { x: -14.4; y: 74.3; skew-x: -9.3; skew-y: -9.3; scale-x: 0.8; }
        frame 28 { x: -16.7; y: 72.2; skew-x: -6.2; skew-y: -6.2; scale-x: 0.799; scale-y: 0.799; }
        frame 29 { x: -18.9; y: 70; skew-x: -2.9; skew-y: -2.9; scale-x: 0.8; scale-y: 0.8; }
        frame 30 { x: -21.2; y: 68; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 4.2; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: -10000; }
        frame 33 { x: 5.5; y: 67.3; skew-x: 10; skew-y: 10; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 7; y: 66.9; skew-x: 20.1; skew-y: 20.1; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 8.6; y: 68; skew-x: 13.8; skew-y: 13.8; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: 10.3; y: 69; skew-x: 7.6; skew-y: 7.6; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 8.8; y: 78.8; skew-x: -4; skew-y: -4; }
        frame 38 { x: 7.8; y: 104.3; skew-x: -28.7; skew-y: -28.7; scale-x: 0.793; scale-y: 0.793; }
        frame 39 { x: 9.2; y: 129.9; skew-x: -53.3; skew-y: -53.3; scale-x: 0.792; scale-y: 0.792; }
        frame 40 { x: 6.2; y: 123.9; skew-x: -44.5; skew-y: -49.6; scale-x: 0.786; scale-y: 0.788; }
        frame 41 { x: 5.7; y: 109.7; skew-x: -30.5; skew-y: -30.5; scale-x: 0.793; scale-y: 0.793; }
        frame 42 { x: 6.6; y: 98.5; skew-x: -18.9; skew-y: -18.9; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 7.8; y: 87.1; skew-x: -7.4; skew-y: -7.4; scale-x: 0.795; scale-y: 0.795; }
        frame 44 { x: 8.1; y: 77.1; skew-x: 2.6; skew-y: 2.6; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 8.9; y: 67.2; skew-x: 13; skew-y: 13; scale-x: 0.794; scale-y: 0.794; }
        frame 46 { x: 20.5; y: 51; skew-x: 35.1; skew-y: 40.2; scale-x: 0.796; scale-y: 0.793; }
        frame 47 { x: 36; y: 43.8; skew-x: 53.9; skew-y: 58.9; scale-x: 0.794; scale-y: 0.791; }
        frame 48 { x: 51.4; y: 37.8; skew-x: 72.5; skew-y: 77.6; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 50.5; y: 37.4; skew-x: 73.2; skew-y: 77.5; scale-x: 0.793; }
        frame 50 { x: 49.5; y: 36.8; skew-x: 73.6; skew-y: 77.3; scale-x: -10000; }
        frame 51 { x: 30.2; y: 46; skew-x: 45.1; skew-y: 47.6; scale-y: 0.792; }
        frame 52 { x: 23.6; y: 54; skew-x: 32.6; skew-y: 34.3; scale-y: -10000; }
        frame 53 { x: 17.1; y: 62.6; skew-x: 20; skew-y: 20.8; scale-x: 0.795; scale-y: 0.795; }
        frame 54 { x: 10.8; y: 71.7; skew-x: 7.6; skew-y: 7.6; scale-x: 0.797; scale-y: 0.797; }
        frame 55 { x: 10.6; y: 75.7; skew-x: 1.1; skew-y: 1.1; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 10.7; y: 79.8; skew-x: -5; skew-y: -5; scale-x: 0.796; scale-y: 0.796; }
        frame 57 { x: 11.4; y: 75.8; skew-x: 1.1; skew-y: 1.1; scale-x: 0.797; scale-y: 0.797; }
        frame 58 { x: 12.3; y: 71.7; skew-x: 7.6; skew-y: 7.6; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 60 { y: 70.7; skew-x: 7.8; skew-y: 7.8; scale-x: 0.807; scale-y: 0.796; }
        frame 61 { y: 69.7; skew-x: 8; skew-y: 8; scale-x: 0.817; scale-y: -10000; }
        frame 62 { x: 12.4; y: 68.8; skew-x: 8.4; skew-y: 8.4; scale-x: 0.828; }
        frame 63 { x: 12.1; y: 67.3; skew-x: 10.8; skew-y: 10.8; scale-x: 0.827; }
        frame 64 { x: 11.9; y: 65.8; skew-x: 13.5; skew-y: 13.5; scale-x: -10000; scale-y: 0.795; }
        frame 65 { x: 11.7; y: 64.3; skew-x: 16.2; skew-y: 16.2; scale-x: 0.828; scale-y: 0.796; }
        frame 66 { x: 9.5; y: 65; skew-x: 15.3; skew-y: 15.6; scale-x: 0.847; scale-y: 0.792; }
        frame 67 { x: 7.4; y: 65.6; skew-x: 14.6; skew-y: 15; scale-x: 0.867; scale-y: 0.789; }
        frame 68 { x: 5.3; y: 66.2; skew-x: 14; skew-y: 14.6; scale-x: 0.888; scale-y: 0.787; }
        frame 69 { x: 6; y: 69; skew-x: 6.5; skew-y: 7.3; scale-x: 0.856; scale-y: 0.773; }
        frame 70 { x: 8.2; y: 70.8; skew-x: 7; skew-y: -10000; scale-x: 0.826; scale-y: 0.785; }
        frame 71 { x: 10.5; y: 72.5; skew-x: 7.6; skew-y: 7.6; scale-x: 0.797; scale-y: 0.797; }
        frame 72 { x: 11.1; y: 70.9; skew-x: 7.8; skew-y: 7.8; scale-x: 0.807; scale-y: 0.796; }
        frame 73 { x: 11.7; y: 69.3; skew-x: 8; skew-y: 8; scale-x: 0.817; scale-y: -10000; }
        frame 74 { x: 12.4; y: 67.8; skew-x: 8.4; skew-y: 8.4; scale-x: 0.828; }
        frame 75 { x: 12.2; y: 66.8; skew-x: 10.8; skew-y: 10.8; scale-x: 0.827; }
        frame 76 { x: 12.1; y: 65.8; skew-x: 13.5; skew-y: 13.5; scale-x: -10000; scale-y: 0.795; }
        frame 77 { x: 11.9; y: 64.8; skew-x: 16.2; skew-y: 16.2; scale-x: 0.828; scale-y: 0.796; }
        frame 78 { x: 9.5; y: 65; skew-x: 15.3; skew-y: 15.6; scale-x: 0.854; scale-y: 0.792; }
        frame 79 { x: 6.8; y: 65.1; skew-x: 14.6; skew-y: 15; scale-x: 0.881; scale-y: 0.789; }
        frame 80 { x: 4.4; y: 65.3; skew-x: 14; skew-y: 14.6; scale-x: 0.908; scale-y: 0.787; }
        frame 81 { x: 5.8; y: 69.1; skew-x: 7.3; skew-y: 8; scale-x: 0.856; scale-y: 0.773; }
        frame 82 { x: 8.2; y: 70; skew-x: 9.6; skew-y: 9.8; scale-x: 0.834; scale-y: 0.793; }
        frame 83 { x: 12.3; y: 71.7; skew-x: 7.6; skew-y: 7.6; scale-x: 0.797; scale-y: 0.797; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 11.8; y: 71.8; skew-x: 5.5; skew-y: 5.5; scale-x: 0.796; scale-y: 0.796; }
        frame 86 { x: 11.5; y: -10000; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 12.9; y: 69.4; skew-x: 7.3; skew-y: 7.3; }
        frame 88 { x: 14.2; y: 66.8; skew-x: 11.1; skew-y: 11.1; }
        frame 89 { x: 14.4; y: 65.8; skew-x: 12.8; skew-y: 12.8; }
        frame 90 { x: 14.6; y: 64.7; skew-x: 14.5; skew-y: 14.5; scale-x: 0.795; scale-y: 0.795; }
        frame 91 { x: 14.7; y: 63.6; skew-x: 16.1; skew-y: 16.1; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 14.9; y: 62.6; skew-x: 17.9; skew-y: 17.9; scale-x: 0.796; scale-y: 0.796; }
        frame 93 { x: 15.1; y: 61.6; skew-x: 18.8; skew-y: 18.8; scale-x: 0.795; scale-y: 0.795; }
        frame 94 { x: 15.3; y: 60.7; skew-x: 19.8; skew-y: 19.8; scale-x: 0.794; scale-y: 0.794; }
        frame 95 { x: 15.6; y: 59.8; skew-x: 20.8; skew-y: 20.8; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 16; y: 58.6; skew-x: 21.8; skew-y: 21.8; scale-x: 0.795; scale-y: 0.795; }
        frame 97 { x: 16.3; y: 57.5; skew-x: 22.3; skew-y: 22.3; scale-x: 0.794; scale-y: 0.793; }
        frame 98 { x: 16.6; y: 56.4; skew-x: 22.8; skew-y: 22.8; scale-x: 0.795; scale-y: -10000; }
        frame 99 { x: 17; y: 55.2; skew-x: 23.5; skew-y: 23.3; scale-x: -10000; scale-y: 0.792; }
        frame 100 { x: 17.4; y: 54.3; skew-x: 24.1; skew-y: 24.1; scale-x: 0.796; scale-y: 0.793; }
        frame 101 { x: 17.3; y: 55; skew-x: 24.3; skew-y: 24.3; scale-x: 0.795; scale-y: 0.791; }
        frame 102 { x: 17.2; y: 55.6; skew-x: 24.8; skew-y: 24.6; scale-x: -10000; scale-y: 0.792; }
        frame 103 { x: 14.4; y: 63.8; skew-x: 15.6; skew-y: 15.5; scale-y: 0.791; }
        frame 104 { x: 11.8; y: 72.1; skew-x: 6.6; skew-y: 6.5; scale-y: 0.792; }
        frame 105 { x: 12.3; y: 71.8; skew-x: 4.8; skew-y: 4.8; scale-y: 0.791; }
        frame 106 { x: 12.8; y: -10000; skew-x: 3.2; skew-y: 3.2; scale-y: -10000; }
        frame 107 { x: 13.2; y: 67.1; skew-x: 8.5; skew-y: 8.3; }
        frame 108 { x: 13.6; y: 62.4; skew-x: 13.9; skew-y: 13.8; scale-y: 0.792; }
        frame 109 { x: 14; y: 61.8; skew-x: 14.5; skew-y: 14.5; scale-x: 0.794; scale-y: 0.791; }
        frame 110 { x: 14.2; y: 61.2; skew-x: 15.3; skew-y: 15.1; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 14.5; y: 60.6; skew-x: 15.8; skew-y: 15.8; }
        frame 112 { x: 14.8; y: 60; skew-x: 16.7; skew-y: 16.6; scale-x: 0.795; }
        frame 113 { x: 15; y: 59.5; skew-x: 15.8; skew-y: 15.8; scale-x: 0.794; scale-y: 0.79; }
        frame 114 { x: 15.2; y: 59; skew-x: 15; skew-y: 15; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 15.3; y: 58.4; skew-x: 14.3; skew-y: 14.1; }
        frame 116 { x: 15.5; y: 57.6; skew-x: 13.5; skew-y: 13.4; scale-y: 0.791; }
        frame 117 { x: 17; y: 55.8; skew-x: 20.3; skew-y: 20.3; scale-x: 0.793; scale-y: 0.79; }
        frame 118 { x: 18.3; y: 54; skew-x: 27.1; skew-y: 27.1; scale-x: 0.794; scale-y: -10000; }
        frame 119 { x: 14.9; y: 62.2; skew-x: 17; skew-y: 17; scale-x: -10000; }
        frame 120 { x: 11.7; y: 71; skew-x: 7; skew-y: 7; scale-x: 0.795; scale-y: 0.792; }
        frame 121 { x: -10000; y: 72.3; skew-x: 4.8; skew-y: 4.8; scale-x: -10000; scale-y: 0.793; }
        frame 122 { x: 11.5; y: 73.5; skew-x: 2.7; skew-y: 2.7; scale-x: 0.796; scale-y: 0.794; }
        frame 123 { x: 11.9; y: 72.5; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: 0.795; }
        frame 124 { x: 12.3; y: 71.7; skew-x: 7.6; skew-y: 7.6; scale-x: 0.797; scale-y: 0.797; }
        frame 125 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 126 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_outerarm_hand";
        frame-count: 155;
        frame 0 { x: 23.6; y: 96.1; scale-x: 0.7; scale-y: 0.7; image: IMAGE_REANIM_ZOMBIE_OUTERARM_HAND; }
        frame 1 { x: 22.4; y: 96.8; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 21.4; y: 97.5; skew-x: -5.4; skew-y: -5.4; scale-x: 0.699; scale-y: 0.699; }
        frame 3 { x: 20.3; y: 98.2; skew-x: -8.4; skew-y: -8.4; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 21.4; y: 100.6; skew-x: -5.4; skew-y: -5.4; }
        frame 5 { x: 22.4; y: 102.9; skew-x: -2.7; skew-y: -2.7; scale-x: 0.7; scale-y: 0.7; }
        frame 6 { x: 23.6; y: 105.1; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 23.9; y: 105.9; skew-x: -0; skew-y: -0; }
        frame 8 { x: 24.2; y: 106.6; skew-x: -0.2; skew-y: -0.2; }
        frame 9 { x: 24.4; y: 107.5; skew-x: -0.6; skew-y: -0.6; }
        frame 10 { x: 24.2; y: 103.6; skew-x: -0.2; skew-y: -0.2; }
        frame 11 { x: 23.9; y: 99.9; skew-x: -0; skew-y: -0; }
        frame 12 { x: 23.6; y: 96.1; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: 24.3; y: 96.7; skew-x: -0.9; skew-y: -0.9; }
        frame 15 { x: 25.1; y: 97.3; skew-x: -1.9; skew-y: -1.9; }
        frame 16 { x: 25.8; y: 98; skew-x: -3.2; skew-y: -3.2; }
        frame 17 { x: 26.6; y: 98.5; skew-x: -4.2; skew-y: -4.2; }
        frame 18 { x: 27.3; y: 99.2; skew-x: -5.2; skew-y: -5.2; }
        frame 19 { x: 28; y: 99.7; skew-x: -6.4; skew-y: -6.4; scale-x: 0.699; scale-y: 0.699; }
        frame 20 { x: 28.9; y: 100.4; skew-x: -7.5; skew-y: -7.5; scale-x: 0.7; scale-y: 0.7; }
        frame 21 { x: 15.9; y: 97.6; skew-x: 3.5; skew-y: 3.5; scale-x: 0.699; scale-y: 0.699; }
        frame 22 { x: 3.3; y: 94.8; skew-x: 14.6; skew-y: 14.6; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -9; y: 92.8; skew-x: 25.8; skew-y: 25.8; scale-x: 0.698; scale-y: 0.698; }
        frame 24 { x: -21.2; y: 91; skew-x: 37; skew-y: 37; scale-x: 0.699; scale-y: 0.699; }
        frame 25 { x: -13.7; y: 94.6; skew-x: 23.6; skew-y: 23.6; scale-x: 0.698; scale-y: 0.698; }
        frame 26 { x: -2.5; y: 97.1; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 9.7; y: 100.7; skew-x: -20.3; skew-y: -20.3; scale-x: 0.699; scale-y: 0.699; }
        frame 28 { x: 5.7; y: 99.6; skew-x: -13.4; skew-y: -13.4; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 1.6; y: 98.6; skew-x: -6.7; skew-y: -6.7; }
        frame 30 { x: -2; y: 97.8; skew-x: 0; skew-y: 0; scale-x: 0.7; scale-y: 0.7; }
        frame 31 { x: 23.6; y: 95.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -10000; y: -10000; }
        frame 33 { x: 16.2; y: 92.9; skew-x: 28.8; skew-y: 28.8; scale-x: 0.698; scale-y: 0.698; }
        frame 34 { x: 9.3; y: 93; skew-x: 57.5; skew-y: 57.5; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 8.9; y: 80.2; skew-x: 105.8; skew-y: 105.8; scale-x: 0.695; scale-y: 0.695; }
        frame 36 { x: 9.2; y: 71.7; skew-x: 154.2; skew-y: 154.2; scale-x: 0.693; scale-y: 0.693; }
        frame 37 { x: 11.2; y: 72; skew-x: 154.1; skew-y: 154.1; scale-x: 0.689; scale-y: 0.689; }
        frame 38 { x: 10.5; y: 85.4; skew-x: 155.7; skew-y: 155.7; scale-x: 0.687; scale-y: 0.687; }
        frame 39 { x: 5.3; y: 123.3; skew-x: 82.8; skew-y: 82.8; scale-x: 0.688; scale-y: 0.688; }
        frame 40 { x: 1.3; y: 121.1; skew-x: 44.3; skew-y: 47.8; scale-x: 0.66; scale-y: 0.705; }
        frame 41 { x: 7.1; y: 119.1; skew-x: 23; skew-y: 23; scale-x: 0.686; scale-y: 0.686; }
        frame 42 { x: 13.5; y: 113.8; skew-x: 4.5; skew-y: 4.5; scale-x: 0.687; scale-y: 0.687; }
        frame 43 { x: 20.8; y: 109.7; skew-x: -13.9; skew-y: -13.9; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 24; y: 106.8; skew-x: -18.2; skew-y: -18.2; scale-x: 0.686; scale-y: 0.686; }
        frame 45 { x: 27.3; y: 104; skew-x: -22.8; skew-y: -22.8; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 25.5; y: 95.7; skew-x: -16.4; skew-y: -16.4; scale-x: 0.685; scale-y: 0.685; }
        frame 47 { x: 23.7; y: 78.2; skew-x: 26.6; skew-y: 26.6; scale-x: 0.682; scale-y: 0.678; }
        frame 48 { x: 33.4; y: 59; skew-x: 88.6; skew-y: 88.6; scale-x: 0.681; scale-y: 0.681; }
        frame 49 { x: 36; y: 55.1; skew-x: 118.1; skew-y: 118.1; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 35.5; y: 52.2; skew-x: 147.5; skew-y: 147.5; scale-x: 0.682; scale-y: 0.682; }
        frame 51 { x: 31.1; y: 58.5; skew-x: 128.1; skew-y: 128.1; scale-x: 0.684; scale-y: 0.684; }
        frame 52 { x: 25.3; y: 65.1; skew-x: 108.8; skew-y: 108.8; scale-x: 0.687; scale-y: 0.687; }
        frame 53 { x: 18.1; y: 72.2; skew-x: 89.7; skew-y: 89.7; scale-x: 0.691; scale-y: 0.691; }
        frame 54 { x: 9.6; y: 80.6; skew-x: 70.5; skew-y: 70.5; scale-x: 0.694; scale-y: 0.694; }
        frame 55 { x: 8.1; y: 85.4; skew-x: 63.9; skew-y: 63.9; scale-x: 0.692; scale-y: 0.692; }
        frame 56 { x: 6.3; y: 90.3; skew-x: 57.1; skew-y: 57.1; scale-x: 0.693; scale-y: 0.693; }
        frame 57 { x: 7.9; y: 86.4; skew-x: 63.9; skew-y: 63.9; scale-x: 0.692; scale-y: 0.692; }
        frame 58 { x: 9.4; y: 82.8; skew-x: 70.5; skew-y: 70.5; scale-x: 0.694; scale-y: 0.694; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 13.3; y: 81.7; skew-x: 84.5; skew-y: 84.5; scale-x: 0.693; scale-y: 0.693; }
        frame 61 { x: 16.6; y: 80.8; skew-x: 98.3; skew-y: 98.3; scale-x: 0.692; scale-y: 0.692; }
        frame 62 { x: 19.4; y: 80.7; skew-x: 112.4; skew-y: 112.4; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 19.5; y: 78.3; skew-x: 117.8; skew-y: 117.8; scale-x: 0.691; scale-y: 0.691; }
        frame 64 { x: 19.6; y: 76; skew-x: 123.1; skew-y: 123.1; scale-x: 0.69; scale-y: 0.69; }
        frame 65 { x: -10000; y: 73.7; skew-x: 128.6; skew-y: 128.6; scale-x: 0.691; scale-y: 0.691; }
        frame 66 { x: 19.4; y: 73.3; skew-x: 116.8; skew-y: 116.8; scale-x: 0.689; scale-y: 0.689; }
        frame 67 { x: 18.6; y: 72.8; skew-x: 104.8; skew-y: 104.8; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 17.5; y: 73; skew-x: 93.1; skew-y: 93.1; }
        frame 69 { x: 15.4; y: 76.8; skew-x: 73.2; skew-y: 73.2; }
        frame 70 { x: 12.2; y: 81.9; skew-x: 53.4; skew-y: 53.4; scale-x: 0.69; scale-y: 0.69; }
        frame 71 { x: 8.7; y: 88.3; skew-x: 33.3; skew-y: 33.3; scale-x: 0.692; scale-y: 0.692; }
        frame 72 { x: 10.2; y: 89; skew-x: 30.1; skew-y: 30.1; scale-x: 0.691; scale-y: 0.691; }
        frame 73 { x: 11.9; y: 90; skew-x: 26.8; skew-y: 26.8; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 13.5; y: 90.8; skew-x: 23.5; skew-y: 23.5; scale-x: 0.692; scale-y: 0.692; }
        frame 75 { x: 13.7; y: 90.5; skew-x: 25.3; skew-y: 25.3; scale-x: 0.691; scale-y: 0.691; }
        frame 76 { x: 13.8; y: 90.2; skew-x: 27.1; skew-y: 27.1; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 14; y: 89.8; skew-x: 29.1; skew-y: 29.1; scale-x: 0.692; scale-y: 0.692; }
        frame 78 { x: 12.1; y: 93.4; skew-x: 19.6; skew-y: 19.6; scale-x: 0.691; scale-y: 0.691; }
        frame 79 { x: 10.4; y: 97; skew-x: 10.3; skew-y: 10.3; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 9; y: 101.1; skew-x: 0.9; skew-y: 0.9; }
        frame 81 { x: 8.7; y: 93; skew-x: 24.1; skew-y: 24.1; }
        frame 82 { x: 9.1; y: 87; skew-x: 47.4; skew-y: 47.4; scale-x: 0.692; scale-y: 0.692; }
        frame 83 { x: 9.4; y: 82.8; skew-x: 70.5; skew-y: 70.5; scale-x: 0.694; scale-y: 0.694; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 9.7; y: 81.3; skew-x: 69.2; skew-y: 69.2; scale-x: 0.693; scale-y: 0.693; }
        frame 86 { x: 9.9; y: 80.1; skew-x: 67.9; skew-y: 67.9; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 10.2; y: 78.7; skew-x: 66.7; skew-y: 66.7; scale-x: 0.692; scale-y: 0.692; }
        frame 88 { x: 10.6; y: 77.3; skew-x: 65.2; skew-y: 65.2; scale-x: 0.693; scale-y: 0.693; }
        frame 89 { x: 11.2; y: 77.6; skew-x: 62.5; skew-y: 62.5; scale-x: 0.692; scale-y: 0.692; }
        frame 90 { x: 11.9; y: 77.7; skew-x: 59.9; skew-y: 59.9; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 12.5; y: 78; skew-x: 57.1; skew-y: 57.1; scale-x: 0.691; scale-y: 0.691; }
        frame 92 { x: 12.9; y: 78.3; skew-x: 54.3; skew-y: 54.3; scale-x: 0.692; scale-y: 0.692; }
        frame 93 { x: 14.8; y: 77.8; skew-x: 50.6; skew-y: 50.1; scale-x: 0.691; scale-y: 0.691; }
        frame 94 { x: 16.5; y: 77.5; skew-x: 46.9; skew-y: 45.9; scale-x: 0.69; scale-y: 0.69; }
        frame 95 { x: 18.2; y: 77.2; skew-x: 43.3; skew-y: 41.8; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 20.1; y: 76.8; skew-x: 39.6; skew-y: 37.6; scale-x: 0.691; }
        frame 97 { x: 21.5; y: 75.7; skew-x: 41.1; skew-y: 39.6; scale-x: 0.689; scale-y: 0.689; }
        frame 98 { x: 22.9; y: 74.7; skew-x: 42.9; skew-y: 41.9; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 24.2; y: 73.5; skew-x: 44.4; skew-y: 44.1; }
        frame 100 { x: 25.4; y: 72.4; skew-x: 46.1; skew-y: 46.1; scale-x: 0.69; scale-y: 0.69; }
        frame 101 { x: 23.8; y: 76.1; skew-x: 42.4; skew-y: 42.4; scale-x: 0.689; scale-y: 0.689; }
        frame 102 { x: 22.2; y: 79.8; skew-x: 38.6; skew-y: 38.6; scale-x: 0.688; scale-y: 0.688; }
        frame 103 { x: 20.6; y: 83.7; skew-x: 34.6; skew-y: 34.6; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 19.1; y: 87.7; skew-x: 30.9; skew-y: 30.9; scale-x: 0.689; scale-y: 0.689; }
        frame 105 { x: 17.8; y: 84.6; skew-x: 34.6; skew-y: 34.6; scale-x: 0.687; scale-y: 0.687; }
        frame 106 { x: 16.7; y: 81.3; skew-x: 38.6; skew-y: 38.6; scale-x: 0.688; scale-y: 0.688; }
        frame 107 { x: 17.6; y: 76.8; skew-x: 50.4; skew-y: 50.4; scale-x: 0.687; scale-y: 0.687; }
        frame 108 { x: 18.1; y: 72.8; skew-x: 62.1; skew-y: 62.1; scale-x: 0.688; scale-y: 0.688; }
        frame 109 { x: 18.7; y: 71.8; skew-x: 68.2; skew-y: 68.2; scale-x: 0.687; scale-y: 0.687; }
        frame 110 { x: 19.4; y: 70.8; skew-x: 74.2; skew-y: 74.2; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 19.8; y: 69.8; skew-x: 80.2; skew-y: 80.2; }
        frame 112 { x: 20.1; y: 69; skew-x: 86.3; skew-y: 86.3; }
        frame 113 { x: 19.6; y: 66.8; skew-x: 87; skew-y: 87; }
        frame 114 { x: 19; y: 64.8; skew-x: 87.5; skew-y: 87.5; scale-x: 0.686; scale-y: 0.686; }
        frame 115 { x: 18.4; y: 62.6; skew-x: 88.2; skew-y: 88.2; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 17.9; y: 60.4; skew-x: 88.6; skew-y: 88.6; }
        frame 117 { x: 15; y: 63.4; skew-x: 87.5; skew-y: 87.5; scale-x: 0.685; scale-y: 0.685; }
        frame 118 { x: 12.2; y: 66.5; skew-x: 86.2; skew-y: 86.2; scale-x: 0.684; scale-y: 0.684; }
        frame 119 { x: 9.4; y: 69.5; skew-x: 85.2; skew-y: 85.2; scale-x: 0.683; scale-y: 0.683; }
        frame 120 { x: 6.4; y: 72.6; skew-x: 83.9; skew-y: 83.9; scale-x: 0.682; scale-y: 0.682; }
        frame 121 { x: 5.3; y: 75.5; skew-x: 74.7; skew-y: 74.7; scale-x: 0.684; scale-y: 0.684; }
        frame 122 { x: 4.2; y: 78.5; skew-x: 65.6; skew-y: 65.6; scale-x: 0.687; scale-y: 0.687; }
        frame 123 { x: 6.6; y: 80.8; skew-x: 68.2; skew-y: 68.2; scale-x: 0.69; scale-y: 0.69; }
        frame 124 { x: 9.4; y: 82.8; skew-x: 70.5; skew-y: 70.5; scale-x: 0.694; scale-y: 0.694; }
        frame 125 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 126 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_outerarm_upper";
        frame-count: 155;
        frame 0 { x: 26.5; y: 59.4; scale-x: 0.6; scale-y: 0.6; image: IMAGE_REANIM_ZOMBIE_BALLOON_OUTERARM_UPPER; }
        frame 1 { x: 26.3; y: 60; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 26; y: 60.8; skew-x: -3.7; skew-y: -3.7; scale-x: 0.599; scale-y: 0.599; }
        frame 3 { x: 25.8; y: 61.5; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 26.1; y: 63.5; skew-x: -3.7; skew-y: -3.7; }
        frame 5 { x: 26.3; y: 65.5; skew-x: -1.7; skew-y: -1.7; scale-x: 0.6; scale-y: 0.6; }
        frame 6 { x: 26.5; y: 67.4; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 26.6; y: 68.1; skew-x: -0; skew-y: -0; }
        frame 8 { x: 26.8; y: 68.6; skew-x: -0.2; skew-y: -0.2; }
        frame 9 { x: 26.9; y: 69.2; skew-x: -0.6; skew-y: -0.6; }
        frame 10 { x: 26.7; y: 65.8; skew-x: -0.2; skew-y: -0.2; }
        frame 11 { x: 26.6; y: 62.5; skew-x: -0; skew-y: -0; }
        frame 12 { x: 26.5; y: 59.4; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { y: 59.5; skew-x: -0.9; skew-y: -0.9; }
        frame 15 { y: 59.8; skew-x: -1.9; skew-y: -1.9; scale-y: 0.601; }
        frame 16 { y: 60; skew-x: -3.2; skew-y: -3.2; scale-y: -10000; }
        frame 17 { x: 26.6; y: 60.2; skew-x: -4.2; skew-y: -4.2; }
        frame 18 { x: -10000; y: 60.5; skew-x: -5.2; skew-y: -5.2; scale-y: 0.602; }
        frame 19 { x: 26.5; y: 60.7; skew-x: -6.4; skew-y: -6.4; scale-y: -10000; }
        frame 20 { x: 26.6; y: 61.1; skew-x: -7.5; skew-y: -7.5; }
        frame 21 { x: 17.8; y: 60; skew-x: -2; skew-y: -2; }
        frame 22 { x: 8.9; y: 58.9; skew-x: 3; skew-y: 3; scale-y: 0.601; }
        frame 23 { x: 0.1; y: 58; skew-x: 8.5; skew-y: 8.5; scale-x: 0.599; scale-y: 0.6; }
        frame 24 { x: -8.5; y: 57; skew-x: 13.9; skew-y: 13.9; scale-x: -10000; scale-y: 0.599; }
        frame 25 { x: -2.9; y: 58.2; skew-x: 11.3; skew-y: 11.3; scale-y: -10000; }
        frame 26 { x: 1; y: 59.8; skew-x: 0; skew-y: 0; }
        frame 27 { x: 5.2; y: 61.6; skew-x: -11; skew-y: -11; scale-x: 0.6; scale-y: 0.6; }
        frame 28 { x: 3.9; y: 60.9; skew-x: -7.2; skew-y: -7.2; scale-x: 0.599; scale-y: 0.599; }
        frame 29 { x: 2.4; y: 60.3; skew-x: -3.5; skew-y: -3.5; scale-x: 0.6; scale-y: 0.6; }
        frame 30 { x: 1; y: 59.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 26.5; y: 59.9; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: -10000; y: -10000; }
        frame 33 { x: 28.8; y: 63.3; skew-x: 16.3; skew-y: 16.3; scale-x: 0.599; scale-y: 0.599; }
        frame 34 { x: 31.3; y: 67.8; skew-x: 32.9; skew-y: 32.9; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 34.3; y: 66.7; skew-x: 51.6; skew-y: 51.6; scale-x: 0.597; scale-y: 0.597; }
        frame 36 { x: 36.5; y: 66.9; skew-x: 70.1; skew-y: 70.1; scale-x: 0.598; scale-y: 0.598; }
        frame 37 { x: 35.7; y: 72.9; skew-x: 77.5; skew-y: 77.5; scale-x: 0.595; scale-y: 0.558; }
        frame 38 { x: 32.8; y: 87.8; skew-x: 82.7; skew-y: 82.7; scale-x: 0.593; scale-y: 0.519; }
        frame 39 { x: 24.5; y: 105; skew-x: 31.6; skew-y: 31.6; scale-x: 0.594; scale-y: 0.516; }
        frame 40 { x: 23.9; y: 102.1; skew-x: 26.6; skew-y: 31; scale-x: 0.603; scale-y: 0.499; }
        frame 41 { x: 27.1; y: 92.2; skew-x: 26.8; skew-y: 26.8; scale-x: 0.594; scale-y: 0.509; }
        frame 42 { x: 28.2; y: 83.5; skew-x: 16.6; skew-y: 16.5; scale-x: -10000; scale-y: 0.506; }
        frame 43 { x: 29.5; y: 75; skew-x: 6.5; skew-y: 6.5; scale-y: 0.503; }
        frame 44 { x: 31.4; y: 71.3; skew-x: 5.5; skew-y: 5.5; scale-x: 0.593; scale-y: 0.502; }
        frame 45 { x: 33.3; y: 67.5; skew-x: 4.7; skew-y: 4.7; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 41.5; y: 61.3; skew-x: 29.8; skew-y: 29.8; scale-x: 0.592; scale-y: 0.501; }
        frame 47 { x: 52.9; y: 58.7; skew-x: 51.4; skew-y: 51.4; scale-x: 0.59; scale-y: 0.5; }
        frame 48 { x: 63.7; y: 57.6; skew-x: 73; skew-y: 73; scale-x: 0.591; scale-y: -10000; }
        frame 49 { x: 62; y: 58.8; skew-x: 84.7; skew-y: 84.7; scale-x: 0.59; scale-y: 0.499; }
        frame 50 { x: 60; y: 60.1; skew-x: 96.1; skew-y: 96.1; scale-x: 0.591; scale-y: -10000; }
        frame 51 { x: 54.3; y: 62.5; skew-x: 84.2; skew-y: 84.2; scale-x: 0.592; }
        frame 52 { x: 48.3; y: 65.2; skew-x: 72.4; skew-y: 72.4; scale-x: 0.594; }
        frame 53 { x: 41.8; y: 68.1; skew-x: 60.4; skew-y: 60.4; scale-x: 0.595; scale-y: 0.5; }
        frame 54 { x: 34.9; y: 71.3; skew-x: 48.5; skew-y: 48.5; scale-x: 0.598; scale-y: 0.501; }
        frame 55 { x: 33.3; y: 73.2; skew-x: 44.8; skew-y: 44.8; scale-x: 0.596; scale-y: 0.5; }
        frame 56 { x: 31.5; y: 75.2; skew-x: 41.1; skew-y: 41.1; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 32.6; y: 73.8; skew-x: 44.8; skew-y: 44.9; }
        frame 58 { x: 33.9; y: 72.5; skew-x: 48.5; skew-y: 48.5; scale-x: 0.598; scale-y: 0.501; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 34.5; y: 71.8; skew-x: 46.9; skew-y: 46.9; scale-x: 0.596; scale-y: 0.5; }
        frame 61 { x: 35.3; y: 71.1; skew-x: 45.1; skew-y: 45.1; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 36; y: 70.3; skew-x: 43.5; skew-y: 43.5; scale-x: 0.597; scale-y: 0.501; }
        frame 63 { x: 36.5; y: 69.4; skew-x: 49.7; skew-y: 46.8; scale-x: 0.598; scale-y: 0.5; }
        frame 64 { x: 37.1; y: 68.5; skew-x: 55.9; skew-y: 49.9; scale-x: 0.601; scale-y: -10000; }
        frame 65 { x: 37.6; y: 67.6; skew-x: 62; skew-y: 53.2; scale-x: 0.604; }
        frame 66 { x: 36.1; y: 68.3; skew-x: 56.9; skew-y: 49.9; scale-x: 0.601; scale-y: 0.499; }
        frame 67 { x: 34.6; y: 69.3; skew-x: 51.7; skew-y: 46.6; scale-x: 0.598; scale-y: -10000; }
        frame 68 { x: 33; y: 70.1; skew-x: 46.5; skew-y: 43.3; scale-x: 0.597; scale-y: 0.5; }
        frame 69 { x: 33.5; y: 70; skew-x: 44.4; skew-y: 42.1; scale-x: -10000; scale-y: 0.498; }
        frame 70 { x: 34.2; skew-x: 42.1; skew-y: 40.9; scale-x: 0.599; scale-y: -10000; }
        frame 71 { x: 35; y: 70.1; skew-x: 39.8; skew-y: 39.8; scale-x: 0.601; }
        frame 72 { x: 35.7; y: 69.4; skew-x: 37.1; skew-y: 37.1; scale-x: 0.6; scale-y: 0.497; }
        frame 73 { x: 36.5; y: 68.7; skew-x: 34.4; skew-y: 34.4; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 37.3; y: 68; skew-x: 31.8; skew-y: 31.8; scale-x: 0.601; scale-y: 0.498; }
        frame 75 { x: -10000; y: 68.3; skew-x: -10000; skew-y: -10000; scale-x: 0.6; scale-y: 0.497; }
        frame 76 { y: 68.6; scale-x: -10000; scale-y: -10000; }
        frame 77 { y: 68.8; scale-x: 0.601; scale-y: 0.498; }
        frame 78 { x: 35; y: 69.7; skew-x: 30.3; skew-y: 30.3; scale-x: 0.6; scale-y: 0.497; }
        frame 79 { x: 32.9; y: 70.6; skew-x: 28.8; skew-y: 28.8; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 30.7; y: 71.6; skew-x: 27.5; skew-y: 27.4; scale-x: 0.601; scale-y: 0.498; }
        frame 81 { x: 31.8; y: 71.7; skew-x: 34.4; skew-y: 34.4; scale-x: 0.599; scale-y: -10000; }
        frame 82 { x: 33; y: 72; skew-x: 41.4; skew-y: 41.4; scale-x: 0.598; scale-y: 0.499; }
        frame 83 { x: 33.9; y: 72.5; skew-x: 48.5; skew-y: 48.5; scale-x: -10000; scale-y: 0.501; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 85 { x: 34.1; y: 71; skew-x: 47.6; skew-y: 47.6; scale-x: 0.597; scale-y: 0.5; }
        frame 86 { x: 34.4; y: 69.5; skew-x: 46.7; skew-y: 46.7; scale-x: 0.596; scale-y: -10000; }
        frame 87 { x: 34.6; y: 68.1; skew-x: 45.9; skew-y: 45.9; scale-x: -10000; }
        frame 88 { x: 34.9; y: 66.6; skew-x: 45; skew-y: 45; scale-x: 0.597; scale-y: 0.501; }
        frame 89 { x: 35.8; y: 65.5; skew-x: 46.4; skew-y: 43.4; scale-x: 0.599; scale-y: 0.5; }
        frame 90 { x: 36.8; y: 64.5; skew-x: 47.6; skew-y: 41.8; scale-x: 0.602; scale-y: -10000; }
        frame 91 { x: 37.6; y: 63.5; skew-x: 48.9; skew-y: 40.1; scale-x: 0.605; scale-y: 0.499; }
        frame 92 { x: 38.5; y: 62.5; skew-x: 50.3; skew-y: 38.7; scale-x: 0.609; scale-y: 0.5; }
        frame 93 { x: 38.8; y: 61.3; skew-x: 46.6; skew-y: 34.6; scale-x: -10000; scale-y: 0.499; }
        frame 94 { x: 39.3; y: 60.1; skew-x: 43.1; skew-y: 30.3; scale-x: 0.61; scale-y: -10000; }
        frame 95 { x: 39.6; y: 59.1; skew-x: 39.6; skew-y: 26.3; scale-x: 0.611; }
        frame 96 { x: 40; y: 58.1; skew-x: 35.9; skew-y: 22.2; scale-x: 0.613; }
        frame 97 { x: 40.5; y: 57.8; skew-x: 32.8; skew-y: 20.8; scale-x: 0.609; scale-y: 0.498; }
        frame 98 { x: 40.9; y: 57.5; skew-x: 29.8; skew-y: 19.5; scale-x: 0.606; scale-y: -10000; }
        frame 99 { x: 41.5; y: 57; skew-x: 26.8; skew-y: 18.3; scale-x: 0.603; }
        frame 100 { x: 42.1; y: 56.9; skew-x: 23.8; skew-y: 17; scale-x: 0.6; }
        frame 101 { x: 40.3; y: 59.9; skew-x: 22.6; skew-y: 15.8; scale-x: 0.599; scale-y: 0.497; }
        frame 102 { x: 38.5; y: 62.8; skew-x: 21.6; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 36.9; y: 65.7; skew-x: 20.5; skew-y: 13.8; }
        frame 104 { x: 35.1; y: 68.7; skew-x: 19.4; skew-y: 12.7; scale-x: 0.6; }
        frame 105 { x: 36.9; y: 67.1; skew-x: 26.3; skew-y: 19.3; scale-x: 0.598; scale-y: 0.496; }
        frame 106 { x: 38.5; y: 65.5; skew-x: 33.1; skew-y: 26.3; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 39.5; y: 64.1; skew-x: 38.6; skew-y: 31.8; }
        frame 108 { x: 40.2; y: 62.6; skew-x: 44.1; skew-y: 37.4; scale-x: 0.599; scale-y: 0.497; }
        frame 109 { x: 40.6; y: 62.2; skew-x: 46.1; skew-y: 39.4; scale-x: 0.598; scale-y: 0.496; }
        frame 110 { x: 41; y: 61.8; skew-x: 48.4; skew-y: 41.6; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 41.5; y: 61.3; skew-x: 50.4; skew-y: 43.6; }
        frame 112 { x: 41.9; y: 60.9; skew-x: 52.4; skew-y: 45.7; scale-x: 0.599; }
        frame 113 { x: 42.5; y: 59.5; skew-x: 55.9; skew-y: 49.2; scale-x: 0.598; }
        frame 114 { x: 43.1; y: 58.4; skew-x: 59.4; skew-y: 52.7; scale-x: 0.597; scale-y: 0.495; }
        frame 115 { x: 43.7; y: 57.2; skew-x: 63; skew-y: 56.2; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 44.1; y: 56.1; skew-x: 66.5; skew-y: 59.7; scale-x: 0.598; scale-y: 0.496; }
        frame 117 { x: 42.5; y: 59.6; skew-x: 70.4; skew-y: 63.7; scale-x: 0.597; scale-y: 0.495; }
        frame 118 { x: 40.9; y: 63.4; skew-x: 74.4; skew-y: 67.7; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 39; y: 66.9; skew-x: 78.2; skew-y: 71.5; scale-x: 0.598; }
        frame 120 { x: 37.4; y: 70.6; skew-x: 82.1; skew-y: 75.3; scale-x: -10000; scale-y: 0.496; }
        frame 121 { x: 36.2; y: 70.3; skew-x: 72.7; skew-y: 67.5; scale-x: 0.597; scale-y: -10000; }
        frame 122 { x: 35; y: 70.2; skew-x: 63.1; skew-y: 59.6; scale-x: -10000; scale-y: 0.498; }
        frame 123 { x: 34.4; y: 71.3; skew-x: 55.9; skew-y: 54.1; scale-x: 0.596; scale-y: 0.499; }
        frame 124 { x: 33.9; y: 72.5; skew-x: 48.5; skew-y: 48.5; scale-x: 0.598; scale-y: 0.501; }
        frame 125 { x: 33.6; y: 71.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_BALLOON_OUTERARM_UPPER2; }
        frame 126 { x: 33.1; y: 74.5; skew-x: 40.6; skew-y: 40.6; scale-x: 0.596; scale-y: 0.5; image: none; }
        frame 127 { x: 32.5; y: 77.4; skew-x: 32.8; skew-y: 32.8; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 31.9; y: 80.6; skew-x: 25.1; skew-y: 25.1; scale-x: 0.597; }
        frame 129 { x: 32.9; y: 83.5; skew-x: 18.8; skew-y: 18.8; scale-x: 0.596; scale-y: 0.499; }
        frame 130 { x: 33.8; y: 86.6; skew-x: 12.8; skew-y: 12.8; scale-x: 0.595; scale-y: -10000; }
        frame 131 { x: 34.9; y: 89.6; skew-x: 6.6; skew-y: 6.6; scale-x: 0.596; }
        frame 132 { x: 39.9; y: 87.9; skew-x: 9.8; skew-y: 9.8; scale-x: 0.595; }
        frame 133 { x: 44.8; y: 86.2; skew-x: 13; skew-y: 13; scale-x: 0.594; scale-y: 0.498; }
        frame 134 { x: 50; y: 84.6; skew-x: 16.4; skew-y: 16.4; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 56.5; y: 82.4; skew-x: 23.6; skew-y: 23.6; scale-x: 0.593; scale-y: 0.497; }
        frame 136 { x: 63.2; y: 80.5; skew-x: 30.8; skew-y: 30.8; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 70; y: 78.8; skew-x: 38; skew-y: 38; }
        frame 138 { x: 79.6; y: 79; skew-x: 49.1; skew-y: 49.1; scale-x: 0.592; scale-y: 0.496; }
        frame 139 { x: 89; y: 79.7; skew-x: 60.2; skew-y: 60.2; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 98.3; y: 80.9; skew-x: 71.3; skew-y: 71.3; }
        frame 141 { x: 103.9; y: 86.3; skew-x: 79.5; skew-y: 79.5; scale-x: 0.591; }
        frame 142 { x: 109.4; y: 91.8; skew-x: 87.7; skew-y: 87.7; scale-x: -10000; }
        frame 143 { x: 114.6; y: 97.4; skew-x: 95.9; skew-y: 95.9; }
        frame 144 { x: 122.1; y: 102.8; skew-x: 133.5; skew-y: 133.5; scale-x: 0.59; scale-y: 0.495; }
        frame 145 { x: 128.4; y: 112.8; skew-x: 212.2; skew-y: 212.2; scale-x: -10000; scale-y: 0.494; }
        frame 146 { x: 122.1; y: 115.3; skew-x: 296.9; skew-y: 296.9; scale-x: 0.589; scale-y: 0.493; }
        frame 147 { x: 122.6; y: 117.3; skew-x: 300.7; skew-y: 293.5; scale-x: 0.547; scale-y: 0.502; }
        frame 148 { x: 122.5; y: 117.2; skew-x: 293.8; skew-y: 289.1; scale-x: 0.56; scale-y: 0.498; }
        frame 149 { x: 122.4; y: 117.1; skew-x: 287.3; skew-y: 284.8; scale-x: 0.574; scale-y: 0.496; }
        frame 150 { x: 122.6; y: 116.8; skew-x: 280.6; skew-y: 280.6; scale-x: 0.588; scale-y: 0.493; }
        frame 151 { x: 122.2; y: 116.1; skew-x: 288.8; skew-y: 288.8; scale-x: -10000; scale-y: -10000; }
        frame 152 { x: 122.1; y: 115.3; skew-x: 296.9; skew-y: 296.9; scale-x: 0.589; }
        frame 153 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; cel: -1; }
        frame 154 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_outerarm_lower";
        frame-count: 155;
        frame 0 { x: 29; y: 82; scale-x: 0.6; scale-y: 0.6; image: IMAGE_REANIM_ZOMBIE_BALLOON_OUTERARM_LOWER; }
        frame 1 { x: 29.4; y: 82.3; skew-x: 4.3; skew-y: 4.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 30; y: 82.7; skew-x: 8.5; skew-y: 8.5; scale-x: 0.599; scale-y: 0.599; }
        frame 3 { x: 30.5; y: 82.9; skew-x: 13; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 29.9; y: 85.6; skew-x: 8.6; skew-y: 8.6; }
        frame 5 { x: 29.5; y: 88.3; skew-x: 4.3; skew-y: 4.3; scale-x: 0.6; scale-y: 0.6; }
        frame 6 { x: 29; y: 91.2; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 29.3; y: 92.1; skew-x: -0; skew-y: -0; }
        frame 8 { x: 29.5; y: 93; skew-x: -0.2; skew-y: -0.2; }
        frame 9 { x: 29.7; y: 93.9; skew-x: -0.6; skew-y: -0.6; }
        frame 10 { x: 29.4; y: 89.9; skew-x: -0.2; skew-y: -0.2; }
        frame 11 { x: 29.2; y: 85.8; skew-x: -0; skew-y: -0; }
        frame 12 { x: 29; y: 82; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: 29.5; y: 82.5; skew-x: -0.9; skew-y: -0.9; }
        frame 15 { x: 30; y: 83.1; skew-x: -1.9; skew-y: -1.9; scale-y: 0.601; }
        frame 16 { x: 30.4; y: 83.6; skew-x: -3.2; skew-y: -3.2; scale-y: -10000; }
        frame 17 { x: 30.9; y: 84.2; skew-x: -4.2; skew-y: -4.2; }
        frame 18 { x: 31.4; y: 84.6; skew-x: -5.2; skew-y: -5.2; scale-y: 0.602; }
        frame 19 { x: 31.9; y: 85.3; skew-x: -6.4; skew-y: -6.4; scale-y: -10000; }
        frame 20 { x: 32.3; y: 85.8; skew-x: -7.5; skew-y: -7.5; }
        frame 21 { x: 21; y: 84.5; skew-x: -0.2; skew-y: -0.2; }
        frame 22 { x: 9.6; y: 83.3; skew-x: 6.5; skew-y: 6.5; scale-x: 0.599; scale-y: 0.601; }
        frame 23 { x: -1.4; y: 82.3; skew-x: 13.8; skew-y: 13.8; scale-x: -10000; scale-y: 0.6; }
        frame 24 { x: -12.5; y: 81.4; skew-x: 21; skew-y: 21; scale-y: 0.599; }
        frame 25 { x: -5.5; y: 83.2; skew-x: 16.1; skew-y: 16.1; scale-y: -10000; }
        frame 26 { x: 3.2; y: 84; skew-x: 2.3; skew-y: 2.3; }
        frame 27 { x: 12.3; y: 85.1; skew-x: -11; skew-y: -11; scale-x: 0.6; scale-y: 0.6; }
        frame 28 { x: 9.3; y: 84.5; skew-x: -7.2; skew-y: -7.2; scale-x: 0.599; scale-y: 0.599; }
        frame 29 { x: 6.2; y: 84.1; skew-x: -3.5; skew-y: -3.5; scale-x: 0.6; scale-y: 0.6; }
        frame 30 { x: 3.1; y: 83.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 29; y: 82.5; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: -10000; y: -10000; }
        frame 33 { x: 25.5; y: 84.1; skew-x: 21.8; skew-y: 21.8; scale-x: 0.599; scale-y: 0.599; }
        frame 34 { x: 22.1; y: 87; skew-x: 43.7; skew-y: 43.7; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 21.1; y: 81.7; skew-x: 79.2; skew-y: 79.2; scale-x: 0.597; scale-y: 0.597; }
        frame 36 { x: 17.2; y: 78.4; skew-x: 114.4; skew-y: 114.4; scale-x: 0.596; scale-y: 0.596; }
        frame 37 { x: 16.6; y: 81.3; skew-x: 125.3; skew-y: 127.6; scale-x: 0.592; scale-y: 0.562; }
        frame 38 { x: 14.9; y: 94.2; skew-x: 125.8; skew-y: 130.6; scale-x: 0.589; scale-y: 0.53; }
        frame 39 { x: 16.3; y: 123.8; skew-x: 61.1; skew-y: 66.1; scale-x: 0.582; scale-y: 0.52; }
        frame 40 { x: 17.2; y: 120.2; skew-x: 56.6; skew-y: 66.2; scale-x: 0.562; scale-y: 0.527; }
        frame 41 { x: 20.1; y: 111.9; skew-x: 31.3; skew-y: 37.1; scale-x: 0.57; scale-y: 0.503; }
        frame 42 { x: 24.7; y: 104; skew-x: 18.1; skew-y: 24.3; scale-x: 0.563; scale-y: 0.493; }
        frame 43 { x: 29.4; y: 96.3; skew-x: 5; skew-y: 11.6; scale-x: 0.557; scale-y: 0.485; }
        frame 44 { x: 31.7; y: 92.7; skew-x: 0.5; skew-y: 7; scale-x: 0.556; scale-y: 0.484; }
        frame 45 { x: 34; y: 89; skew-x: -3.7; skew-y: 2.7; scale-x: 0.555; scale-y: 0.483; }
        frame 46 { x: 32.1; y: 82.3; skew-x: -2.6; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 37.8; y: 73.8; skew-x: 42.6; skew-y: 49.1; scale-x: 0.553; scale-y: 0.482; }
        frame 48 { x: 45.5; y: 66.1; skew-x: 89.6; skew-y: 96.1; scale-x: 0.554; scale-y: -10000; }
        frame 49 { x: 43.1; y: 63.3; skew-x: 104; skew-y: 110.5; scale-x: 0.553; scale-y: 0.48; }
        frame 50 { x: 40.1; y: 60.5; skew-x: 118.4; skew-y: 124.9; scale-x: 0.552; scale-y: -10000; }
        frame 51 { x: 36.4; y: 67; skew-x: 109.1; skew-y: 115.8; scale-x: -10000; scale-y: 0.479; }
        frame 52 { x: 32.4; y: 73.5; skew-x: 99.8; skew-y: 106.8; scale-x: 0.553; scale-y: 0.478; }
        frame 53 { x: 28.1; y: 80.1; skew-x: 90.8; skew-y: 97.6; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 23.5; y: 86.7; skew-x: 81.6; skew-y: 88.6; scale-y: 0.477; }
        frame 55 { x: 22.4; y: 89.5; skew-x: 74.2; skew-y: 81.2; scale-y: -10000; }
        frame 56 { x: 21.1; y: 92.3; skew-x: 66.8; skew-y: 73.9; }
        frame 57 { x: 21.9; y: 90.2; skew-x: 74.2; skew-y: 81.2; }
        frame 58 { x: 22.5; y: 88.2; skew-x: 81.6; skew-y: 88.6; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 60 { x: 24.2; y: 87.6; skew-x: 84.4; skew-y: 91.3; }
        frame 61 { x: 25.7; y: 87.1; skew-x: 87; skew-y: 94; scale-y: 0.476; }
        frame 62 { x: 27.4; y: 86.5; skew-x: 89.7; skew-y: 96.7; scale-x: 0.552; scale-y: -10000; }
        frame 63 { x: 27.1; y: 85.5; skew-x: 97.1; skew-y: 104.3; scale-x: -10000; }
        frame 64 { x: 26.7; y: 84.5; skew-x: 104.8; skew-y: 111.8; scale-y: 0.475; }
        frame 65 { x: 26.2; y: 83.5; skew-x: 112.3; skew-y: 119.4; scale-y: 0.476; }
        frame 66 { x: 26.4; y: 85; skew-x: 116.1; skew-y: 123.3; scale-x: 0.551; scale-y: 0.475; }
        frame 67 { x: 26.5; y: 86.3; skew-x: 120.1; skew-y: 127.1; scale-x: -10000; scale-y: 0.474; }
        frame 68 { x: 26.7; y: 87.8; skew-x: 124; skew-y: 131; scale-y: 0.475; }
        frame 69 { x: 27.2; y: 87.2; skew-x: 101.8; skew-y: 109; scale-x: 0.552; scale-y: 0.474; }
        frame 70 { x: 26.8; y: 86.8; skew-x: 79.9; skew-y: 87.2; scale-x: 0.554; scale-y: -10000; }
        frame 71 { x: 25.1; y: 87; skew-x: 57.7; skew-y: 65.1; scale-x: 0.555; }
        frame 72 { x: 26.6; y: 86.8; skew-x: 54.4; skew-y: 61.9; scale-x: -10000; }
        frame 73 { x: 28.1; y: 86.6; skew-x: 51.1; skew-y: 58.7; scale-x: 0.554; }
        frame 74 { x: 29.5; y: 86.3; skew-x: 47.9; skew-y: 55.3; scale-x: 0.555; }
        frame 75 { x: 29.8; y: 86.7; skew-x: 49.7; skew-y: 57.2; scale-x: 0.554; scale-y: 0.473; }
        frame 76 { x: 30; y: 86.9; skew-x: 51.6; skew-y: 59.1; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 30.1; y: 87.3; skew-x: 53.4; skew-y: 60.9; scale-x: 0.555; scale-y: 0.474; }
        frame 78 { x: 27.8; y: 88.3; skew-x: 45.4; skew-y: 52.9; scale-x: 0.554; scale-y: 0.473; }
        frame 79 { x: 25.6; y: 89.5; skew-x: 37.3; skew-y: 44.8; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 23.2; y: 90.8; skew-x: 29.3; skew-y: 36.7; scale-x: 0.555; scale-y: 0.474; }
        frame 81 { x: 23.3; y: 89.2; skew-x: 46.6; skew-y: 54.1; scale-x: 0.553; scale-y: -10000; }
        frame 82 { x: 23.2; y: 88.4; skew-x: 64.2; skew-y: 71.4; scale-x: -10000; scale-y: 0.475; }
        frame 83 { x: 22.5; y: 88.2; skew-x: 81.6; skew-y: 88.6; scale-y: 0.477; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 85 { x: 23.1; y: 86.8; skew-x: 81.2; skew-y: 88.2; }
        frame 86 { x: 23.5; y: 85.3; skew-x: 80.5; skew-y: 87.5; }
        frame 87 { x: 24; y: 83.9; skew-x: 80; skew-y: 87; }
        frame 88 { x: 24.4; y: 82.3; skew-x: 79.3; skew-y: 86.4; scale-y: 0.476; }
        frame 89 { x: 25.5; y: 81.9; skew-x: 77.2; skew-y: 84.2; scale-x: 0.552; scale-y: -10000; }
        frame 90 { x: 26.5; y: 81.6; skew-x: 74.9; skew-y: 81.9; scale-x: -10000; }
        frame 91 { x: 27.5; y: 81.3; skew-x: 72.5; skew-y: 79.7; }
        frame 92 { x: 28.6; y: 80.8; skew-x: 70.2; skew-y: 77.3; }
        frame 93 { x: 30.6; y: 80.3; skew-x: 69.7; skew-y: 76.7; scale-x: 0.551; scale-y: 0.475; }
        frame 94 { x: 32.7; y: 79.6; skew-x: 69.2; skew-y: 76.2; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 34.9; y: 79; skew-x: 68.7; skew-y: 75.7; }
        frame 96 { x: 37; y: 78.3; skew-x: 68; skew-y: 75; }
        frame 97 { x: 38.3; y: 77.8; skew-x: 70.9; skew-y: 78; }
        frame 98 { x: 39.5; y: 77.5; skew-x: 73.7; skew-y: 80.7; }
        frame 99 { x: 40.9; y: 77; skew-x: 76.5; skew-y: 83.7; }
        frame 100 { x: 42.1; y: 76.6; skew-x: 79.3; skew-y: 86.4; }
        frame 101 { x: 40.9; y: 79.7; skew-x: 77; skew-y: 84; }
        frame 102 { x: 39.5; y: 82.8; skew-x: 74.7; skew-y: 81.7; scale-x: 0.55; }
        frame 103 { x: 38.3; y: 85.8; skew-x: 72.2; skew-y: 79.4; scale-x: -10000; scale-y: 0.474; }
        frame 104 { x: 36.8; y: 88.7; skew-x: 69.9; skew-y: 76.9; scale-y: -10000; }
        frame 105 { x: 36; y: 86.8; skew-x: 75; skew-y: 82; }
        frame 106 { x: 35; y: 84.8; skew-x: 79.9; skew-y: 87; scale-y: 0.475; }
        frame 107 { x: 34.4; y: 82.8; skew-x: 87.4; skew-y: 94.3; scale-y: 0.474; }
        frame 108 { x: 33.5; y: 80.8; skew-x: 94.6; skew-y: 101.6; scale-y: -10000; }
        frame 109 { x: 33.2; y: 79.9; skew-x: 94.5; skew-y: 101.5; }
        frame 110 { x: 32.9; y: 79; skew-x: -10000; skew-y: -10000; }
        frame 111 { x: 32.5; y: 78; scale-x: 0.549; scale-y: 0.473; }
        frame 112 { x: 32.1; y: 77.2; skew-y: 101.6; scale-x: -10000; scale-y: 0.474; }
        frame 113 { x: 31.5; y: 75.2; skew-x: 95; skew-y: 102.1; scale-y: 0.473; }
        frame 114 { x: 30.9; y: 73.2; skew-x: 95.5; skew-y: 102.6; scale-y: -10000; }
        frame 115 { x: 30.3; y: 71.2; skew-x: 96.3; skew-y: 103.3; }
        frame 116 { x: 29.6; y: 69.3; skew-x: 96.8; skew-y: 103.9; }
        frame 117 { x: 26.7; y: 71.5; skew-x: 93.8; skew-y: 100.8; scale-x: 0.548; scale-y: 0.472; }
        frame 118 { x: 23.8; y: 73.8; skew-x: 90.8; skew-y: 97.8; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 20.7; y: 76.1; skew-x: 88; skew-y: 94.8; }
        frame 120 { x: 17.7; y: 78.3; skew-x: 84.8; skew-y: 91.9; }
        frame 121 { x: 18.5; y: 80.9; skew-x: 81.7; skew-y: 88.9; scale-x: 0.549; scale-y: 0.473; }
        frame 122 { x: 19.1; y: 83.4; skew-x: 78.6; skew-y: 85.6; scale-x: 0.55; scale-y: 0.474; }
        frame 123 { x: 20.7; y: 85.7; skew-x: 80.2; skew-y: 87.2; scale-x: 0.551; scale-y: 0.476; }
        frame 124 { x: 22.5; y: 88.2; skew-x: 81.6; skew-y: 88.6; scale-x: 0.553; scale-y: 0.477; }
        frame 125 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 126 { cel: -10000; }
    }
    Track {
        source-name: "hat";
        frame-count: 155;
        frame 0 { x: -1.4; y: 34.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BALLOON_HAT; }
        frame 1 { x: -0.3; y: 33.6; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 0.7; y: 33; skew-x: 5.5; skew-y: 5.5; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: 1.9; y: 32.5; skew-x: 8.3; skew-y: 8.3; scale-x: 0.8; scale-y: 0.8; }
        frame 4 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: -0.5; y: 38.5; skew-x: 1.8; skew-y: 1.8; scale-x: 0.799; scale-y: 0.799; }
        frame 6 { x: -3; y: 44.4; skew-x: -4.6; skew-y: -4.6; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: -3.5; y: 45.3; skew-x: -6.7; skew-y: -6.7; scale-x: 0.798; scale-y: 0.798; }
        frame 8 { x: -3.9; y: 46.3; skew-x: -8.7; skew-y: -8.7; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: -4.4; y: 47.4; skew-x: -10.9; skew-y: -10.9; }
        frame 10 { x: -3.4; y: 42.9; skew-x: -7.2; skew-y: -7.2; }
        frame 11 { x: -2.5; y: 38.5; skew-x: -3.4; skew-y: -3.4; scale-x: 0.799; scale-y: 0.799; }
        frame 12 { x: -1.4; y: 34.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: -1.8; y: 35; skew-x: -1.2; skew-y: -1.2; }
        frame 15 { x: -2.1; y: 35.5; skew-x: -2.4; skew-y: -2.4; }
        frame 16 { x: -2.5; y: 36.3; skew-x: -3.7; skew-y: -3.7; }
        frame 17 { x: -2.8; y: 37; skew-x: -4.9; skew-y: -4.9; }
        frame 18 { x: -3.2; y: 37.6; skew-x: -6.2; skew-y: -6.2; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: -3.6; y: 38.4; skew-x: -7.7; skew-y: -7.7; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: -3.9; y: 39.2; skew-x: -8.9; skew-y: -8.9; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: -10.3; y: 36; skew-x: -4.2; skew-y: -4.2; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: -16.6; y: 33; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -22.8; y: 29.9; skew-x: 5.3; skew-y: 5.3; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: -29; y: 27; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -32.1; y: 28.9; skew-x: 0.2; skew-y: 0.2; }
        frame 26 { x: -30; y: 35.7; skew-x: -8.4; skew-y: -8.4; scale-x: 0.797; scale-y: 0.797; }
        frame 27 { x: -27.7; y: 42.8; skew-x: -17.4; skew-y: -17.4; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -27.2; y: 39.7; skew-x: -11.4; skew-y: -11.4; scale-x: 0.798; scale-y: 0.798; }
        frame 29 { x: -26.7; y: 36.6; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: -26.4; y: 33.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 31 { x: -1.4; y: 34.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -10000; y: -10000; }
        frame 35 { y: 36.5; }
        frame 36 { y: 38.9; }
        frame 37 { y: 41.3; }
        frame 38 { y: 43.6; }
        frame 39 { y: 46; }
        frame 40 { y: 48.4; }
        frame 41 { y: 50.7; }
        frame 42 { x: -0.9; y: 50.9; skew-x: -2.9; skew-y: -2.9; }
        frame 43 { x: -0.5; y: 51; skew-x: -6.2; skew-y: -6.2; }
        frame 44 { x: 3.1; y: 43.5; skew-x: -4.7; skew-y: -4.7; scale-x: 0.822; scale-y: 0.746; }
        frame 45 { x: 7; y: 36; skew-x: -3.4; skew-y: -3.4; scale-x: 0.846; scale-y: 0.693; }
        frame 46 { x: 7.1; y: 31.7; skew-x: -3.2; skew-y: -3.2; scale-x: 0.836; scale-y: 0.714; }
        frame 47 { x: 7.3; y: 27.4; skew-x: -10000; skew-y: -10000; scale-x: 0.827; scale-y: 0.736; }
        frame 48 { x: -10000; y: 23.2; skew-x: -3.4; scale-x: 0.818; scale-y: 0.757; }
        frame 49 { x: 7.5; y: 18.8; skew-x: -10000; scale-x: 0.809; scale-y: 0.778; }
        frame 50 { x: 7.6; y: 14.5; skew-y: -3.4; scale-x: 0.8; scale-y: 0.8; }
        frame 51 { x: 7.3; y: 18.6; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 7; y: 22.7; skew-y: -10000; }
        frame 53 { x: 6.6; y: 26.8; }
        frame 54 { x: 6.2; y: 31; }
        frame 55 { x: 5.8; y: 35; }
        frame 56 { x: 5.5; y: 39.1; }
        frame 57 { x: 5.1; y: 43.2; skew-y: -3.4; }
        frame 58 { x: 7.5; y: 40.8; skew-y: -10000; scale-x: 0.856; scale-y: 0.756; }
        frame 59 { x: 8; y: 40; scale-x: 0.8; scale-y: 0.8; }
        frame 60 { x: 11; y: 37.6; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 14.1; y: 35.4; skew-x: 8.8; skew-y: 8.8; scale-x: 0.799; scale-y: 0.799; }
        frame 62 { x: 17.3; y: 33.1; skew-x: 15.1; skew-y: 15.1; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 19.1; y: 32; skew-x: 16.5; skew-y: 16.5; scale-x: 0.798; scale-y: 0.798; }
        frame 64 { x: 20.7; y: 30.9; skew-x: 18; skew-y: 18; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 22.4; y: 29.8; skew-x: 19.6; skew-y: 19.6; scale-x: 0.799; scale-y: 0.799; }
        frame 66 { x: 18.7; y: 31.5; skew-x: 16.8; skew-y: 16.8; scale-x: 0.798; scale-y: 0.798; }
        frame 67 { x: 15; y: 33; skew-x: 13.8; skew-y: 13.8; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 11.4; y: 34.7; skew-x: 11; skew-y: 11; scale-x: 0.799; scale-y: 0.799; }
        frame 69 { x: 7.5; y: 37.4; skew-x: 5.8; skew-y: 5.8; scale-x: 0.798; scale-y: 0.798; }
        frame 70 { x: 8.1; y: 38; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 8.7; y: 38.4; }
        frame 72 { x: 11.5; y: 36.5; skew-x: 8.3; skew-y: 8.3; }
        frame 73 { x: 14.3; y: 34.5; skew-x: 11; skew-y: 11; }
        frame 74 { x: 17.2; y: 32.5; skew-x: 13.8; skew-y: 13.8; }
        frame 75 { x: 19.5; y: 31.6; skew-x: 16.6; skew-y: 16.6; scale-x: 0.797; scale-y: 0.797; }
        frame 76 { x: 21.8; y: 30.4; skew-x: 19.3; skew-y: 19.3; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 24.1; y: 29.3; skew-x: 22.3; skew-y: 22.3; scale-x: 0.798; scale-y: 0.798; }
        frame 78 { x: 19.7; y: 31.3; skew-x: 17.3; skew-y: 17.3; scale-x: 0.797; scale-y: 0.797; }
        frame 79 { x: 15.5; y: 33.4; skew-x: 12.3; skew-y: 12.3; scale-x: 0.796; scale-y: 0.796; }
        frame 80 { x: 11.3; y: 35.4; skew-x: 7.6; skew-y: 7.6; scale-x: 0.797; scale-y: 0.797; }
        frame 81 { x: 6.6; y: 39.1; skew-x: 1.3; skew-y: 1.3; scale-x: 0.796; scale-y: 0.796; }
        frame 82 { x: 7.2; y: 39.5; skew-x: -0.9; skew-y: -0.9; scale-x: 0.798; scale-y: 0.798; }
        frame 83 { x: 8; y: 40; skew-x: -3.4; skew-y: -3.4; scale-x: 0.8; scale-y: 0.8; }
        frame 84 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 7.1; y: 39.8; skew-x: -2.2; skew-y: -2.2; scale-x: 0.899; scale-y: 0.699; }
        frame 86 { x: 9.2; y: 36.4; skew-x: -0.9; skew-y: -0.9; scale-x: 0.799; scale-y: 0.799; }
        frame 87 { x: 11.2; y: 34.6; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 13.2; y: 32.9; skew-x: 4.3; skew-y: 4.3; }
        frame 89 { x: 15.3; y: 31; skew-x: 7.1; skew-y: 7.1; }
        frame 90 { x: 16.2; y: 30.1; skew-x: 8.5; skew-y: 8.5; }
        frame 91 { x: 17.1; y: 29.2; skew-x: 10; skew-y: 10; }
        frame 92 { x: 18.1; y: 28.2; skew-x: 11.6; skew-y: 11.6; }
        frame 93 { x: 19.1; y: 27.4; skew-x: 13.3; skew-y: 13.3; scale-x: 0.798; scale-y: 0.798; }
        frame 94 { x: 20.2; y: 26.4; skew-x: 15.1; skew-y: 15.1; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 21.3; y: 25.6; skew-x: 16.8; skew-y: 16.8; }
        frame 96 { x: 22.4; y: 24.6; skew-x: 18.7; skew-y: 18.7; scale-x: 0.799; scale-y: 0.799; }
        frame 97 { x: 23.9; y: 23.7; skew-x: 19.8; skew-y: 19.8; scale-x: 0.798; scale-y: 0.798; }
        frame 98 { x: 25.6; y: 22.9; skew-x: 20.8; skew-y: 20.8; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 27.2; y: 21.9; skew-x: 22.1; skew-y: 22.1; scale-x: 0.797; scale-y: 0.797; }
        frame 100 { x: 28.9; y: 21; skew-x: 23.3; skew-y: 23.3; scale-x: 0.798; scale-y: 0.798; }
        frame 101 { x: 26.9; y: 22.3; skew-x: 20.1; skew-y: 20.1; scale-x: 0.797; scale-y: 0.797; }
        frame 102 { x: 25; y: 23.6; skew-x: 16.8; skew-y: 16.8; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 23.1; y: 24.9; skew-x: 13.8; skew-y: 13.8; }
        frame 104 { x: 21.2; y: 26.3; skew-x: 10.7; skew-y: 10.7; scale-x: 0.798; scale-y: 0.798; }
        frame 105 { x: 20.7; y: 27.2; skew-x: 12.6; skew-y: 12.6; scale-x: 0.797; scale-y: 0.797; }
        frame 106 { x: 20.2; y: 28; skew-x: 14.6; skew-y: 14.6; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 19.8; y: 28.9; skew-x: 16.8; skew-y: 16.8; }
        frame 108 { x: 20.1; y: 27.3; skew-x: -10000; skew-y: -10000; scale-x: 0.827; scale-y: 0.722; }
        frame 109 { x: 20.9; y: 26.7; scale-x: 0.819; scale-y: 0.74; }
        frame 110 { x: 21.7; y: 26.2; skew-x: 17; skew-y: 17; scale-x: 0.811; scale-y: 0.759; }
        frame 111 { x: 22.4; y: 25.5; skew-x: 17.1; skew-y: 17.1; scale-x: 0.804; scale-y: 0.778; }
        frame 112 { x: 23.2; y: 24.9; skew-x: 17.3; skew-y: 17.3; scale-x: 0.797; scale-y: 0.797; }
        frame 113 { x: 23.3; y: 24.1; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 114 { x: 23.4; y: 23.3; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 23.5; y: 22.5; }
        frame 116 { x: -10000; y: 21.6; scale-x: 0.797; scale-y: 0.797; }
        frame 117 { x: 21.7; y: 22.9; skew-x: 13.1; skew-y: 13.1; scale-x: 0.796; scale-y: 0.796; }
        frame 118 { x: 19.9; y: 24.3; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 18.1; y: 25.7; skew-x: 5; skew-y: 5; }
        frame 120 { x: 16.4; y: 27; skew-x: 1; skew-y: 1; }
        frame 121 { x: 14.3; y: 30.2; skew-x: 0; skew-y: 0; scale-x: 0.797; scale-y: 0.797; }
        frame 122 { x: 12.2; y: 33.5; skew-x: -1.2; skew-y: -1.2; scale-x: 0.798; scale-y: 0.798; }
        frame 123 { x: 10.2; y: 36.8; skew-x: -2.2; skew-y: -2.2; scale-x: 0.799; scale-y: 0.799; }
        frame 124 { x: 8; y: 40; skew-x: -3.4; skew-y: -3.4; scale-x: 0.8; scale-y: 0.8; }
        frame 125 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 126 { cel: -10000; }
    }
    Track {
        source-name: "balloon_pop";
        frame-count: 155;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 31 { x: -3.7; y: -42; skew-x: -6.9; skew-y: -6.9; scale-x: 0.654; scale-y: 0.719; cel: 0; image: IMAGE_REANIM_ZOMBIE_BALLOON_POP1; }
        frame 32 { x: 10.7; y: -35.9; skew-x: 0; skew-y: 0; scale-x: 0.552; scale-y: 0.552; cel: -10000; image: IMAGE_REANIM_ZOMBIE_BALLOON_POP2; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 34 { cel: -10000; }
    }
    Track {
        source-name: "propeller";
        frame-count: 155;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 153 { x: -2.6; y: 28.7; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_BALLOON_PROPELLER; }
        frame 154 { x: -2.5; y: 28.6; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_ZOMBIE_BALLOON_PROPELLER2; }
    }
}
