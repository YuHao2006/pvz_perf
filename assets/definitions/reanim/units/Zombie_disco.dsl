export component Zombie_disco {
    fps: 24;
    Track {
        source-name: "anim_moonwalk";
        frame-count: 164;
        frame 0 { y: -16.9; }
        frame 1 { y: -10000; }
        frame 27 { cel: -1; }
        frame 28 { cel: -10000; }
    }
    Track {
        source-name: "anim_point";
        frame-count: 164;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 27 { y: -17.9; cel: 0; }
        frame 28 { y: -10000; cel: -10000; }
        frame 36 { cel: -1; }
        frame 37 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 164;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 46 { y: -16.9; cel: 0; }
        frame 47 { y: -10000; cel: -10000; }
        frame 67 { cel: -1; }
        frame 68 { cel: -10000; }
    }
    Track {
        source-name: "anim_armraise";
        frame-count: 164;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 67 { y: -16.9; cel: 0; }
        frame 68 { y: -10000; cel: -10000; }
        frame 89 { cel: -1; }
        frame 90 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 164;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 89 { x: -0.4; y: -13.9; skew-x: 3.3; skew-y: 3.3; cel: 0; }
        frame 90 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -10000; }
        frame 120 { cel: -1; }
        frame 121 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 164;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 120 { x: 200.5; y: 59.4; skew-x: 99.1; skew-y: 99.1; scale-x: 0.999; scale-y: 0.999; cel: 0; }
        frame 121 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 164;
        frame 0 { x: -9.8; y: 40; }
        frame 1 { x: -10000; y: -10000; }
        frame 3 { x: -13.3; }
        frame 4 { x: -16.7; }
        frame 5 { x: -20.1; }
        frame 6 { x: -23.6; }
        frame 7 { x: -27; }
        frame 8 { x: -30.4; }
        frame 9 { x: -33.9; }
        frame 10 { x: -37.3; }
        frame 11 { x: -40.8; }
        frame 12 { x: -44.2; }
        frame 13 { x: -47.6; }
        frame 14 { x: -51.1; }
        frame 15 { x: -10000; }
        frame 17 { x: -53.8; }
        frame 18 { x: -56.6; }
        frame 19 { x: -59.3; }
        frame 20 { x: -62.1; }
        frame 21 { x: -64.8; }
        frame 22 { x: -67.6; }
        frame 23 { x: -70.4; }
        frame 24 { x: -73.1; }
        frame 25 { x: -75.9; }
        frame 26 { x: -78.6; }
        frame 27 { x: -10000; cel: -1; }
        frame 28 { cel: -10000; }
        frame 46 { x: -9.8; cel: 0; }
        frame 47 { x: -7.3; cel: -10000; }
        frame 48 { x: -4.8; }
        frame 49 { x: -2.3; }
        frame 50 { x: 0; }
        frame 51 { x: -10000; }
        frame 57 { x: 1.3; }
        frame 58 { x: 2.5; }
        frame 59 { x: 3.8; }
        frame 60 { x: 5; }
        frame 61 { x: -10000; }
        frame 67 { cel: -1; }
        frame 68 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_innerarm_lowercuff";
        frame-count: 164;
        frame 0 { x: 31.7; y: 33.5; skew-x: 75; skew-y: 75; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_INNERARM_LOWERCUFF; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 30.6; y: 33.1; skew-x: 75.2; skew-y: 75.2; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 29.4; y: 32.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 28.3; y: 32.5; }
        frame 6 { x: 27.2; y: 32.1; }
        frame 7 { x: 26; y: 31.9; }
        frame 8 { x: 24.8; y: 31.5; }
        frame 9 { x: 23.3; y: 31.7; }
        frame 10 { x: 21.7; y: -10000; }
        frame 11 { x: 20.1; y: 31.8; }
        frame 12 { x: 18.6; y: 31.9; }
        frame 13 { x: 17; y: 32; }
        frame 14 { x: 15.4; skew-x: 75; skew-y: 75; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 17.3; y: 32; skew-x: 75.2; skew-y: 75.2; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 19.2; y: 31.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 21.1; y: 31.7; }
        frame 20 { x: 23; y: -10000; }
        frame 21 { x: 24.8; y: 31.5; }
        frame 22 { x: 26.3; y: 32; }
        frame 23 { x: 27.6; y: 32.3; }
        frame 24 { x: 29; y: 32.7; }
        frame 25 { x: 30.3; y: 33.1; }
        frame 26 { x: 31.7; y: 33.5; skew-x: 75; skew-y: 75; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: 16; y: 61.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 12.5; y: 52.2; skew-x: 21.3; skew-y: 21.3; scale-x: 0.799; scale-y: 0.799; }
        frame 29 { x: 9.5; y: 43.4; skew-x: 42.9; skew-y: 42.9; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: 7.1; y: 35.6; skew-x: 64.4; skew-y: 64.4; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 14.8; y: 17.4; skew-x: 107.1; skew-y: 107.1; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 28.8; y: 6.5; skew-x: 150; skew-y: 150; scale-x: 0.8; scale-y: 0.8; }
        frame 33 { x: 23.1; y: -3.5; skew-x: 138.4; skew-y: 138.4; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 20.1; y: -13.6; skew-x: 126.8; skew-y: 126.8; scale-x: 0.8; scale-y: 0.8; }
        frame 35 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 23.1; y: -3.5; skew-x: 138.4; skew-y: 138.4; scale-x: 0.799; scale-y: 0.799; }
        frame 38 { x: 28.8; y: 6.5; skew-x: 150; skew-y: 150; scale-x: 0.8; scale-y: 0.8; }
        frame 39 { x: 24.6; y: 12.8; skew-x: 128.6; skew-y: 128.6; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 19.3; y: 19.6; skew-x: 107.1; skew-y: 107.1; scale-x: 0.799; scale-y: 0.799; }
        frame 41 { x: 13.4; y: 27.1; skew-x: 86; skew-y: 86; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 7.1; y: 35.6; skew-x: 64.4; skew-y: 64.4; }
        frame 43 { x: 9.6; y: 43.5; skew-x: 42.9; skew-y: 42.9; scale-x: 0.798; scale-y: 0.798; }
        frame 44 { x: 12.4; y: 52.2; skew-x: 21.3; skew-y: 21.3; scale-x: 0.799; scale-y: 0.799; }
        frame 45 { x: 16; y: 61.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 46 { x: 6.8; y: 22.1; skew-x: 86.7; skew-y: 86.7; scale-x: 0.793; scale-y: 0.793; }
        frame 47 { x: 9.2; y: 22.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 11.6; y: 23.1; }
        frame 49 { x: 13.9; y: 24.8; }
        frame 50 { x: 16.4; y: 26.4; }
        frame 51 { x: 18.8; y: 28; }
        frame 52 { x: 21.2; y: 29.7; }
        frame 53 { x: -10000; y: -10000; }
        frame 57 { x: 19.1; y: 28.2; }
        frame 58 { x: 17.1; y: 26.8; }
        frame 59 { x: 15.1; y: 25.3; }
        frame 60 { x: 13; y: 23.8; }
        frame 61 { x: 11; y: 23.2; }
        frame 62 { x: 8.9; y: 22.6; }
        frame 63 { x: 6.8; y: 22.1; }
        frame 64 { x: -10000; y: -10000; }
        frame 67 { x: 16; y: 61.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: 8.9; y: 44; skew-x: 48.9; skew-y: 48.9; scale-x: 0.798; scale-y: 0.798; }
        frame 69 { x: 11.7; y: 24.7; skew-x: 98.5; skew-y: 98.5; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 29.1; y: 12.6; skew-x: 148.2; skew-y: 148.2; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 30.5; y: 6.6; skew-x: 147.2; skew-y: 147.2; scale-x: 0.797; scale-y: 0.797; }
        frame 74 { x: 31.8; y: 0.6; skew-x: 146.2; skew-y: 146.2; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 33.1; y: -5.3; skew-x: 145.1; skew-y: 145.1; scale-x: 0.799; scale-y: 0.799; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 33; y: 0.9; skew-x: 149.7; skew-y: 149.7; scale-x: 0.797; scale-y: 0.797; }
        frame 81 { x: 32.9; y: 7.2; skew-x: 154.4; skew-y: 154.4; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 32.6; y: 13.4; skew-x: 159; skew-y: 159; }
        frame 83 { x: 24.2; y: 17.4; skew-x: 132.4; skew-y: 132.4; scale-x: 0.796; scale-y: 0.796; }
        frame 84 { x: 14.4; y: 22.1; skew-x: 105.8; skew-y: 105.8; scale-x: 0.797; scale-y: 0.797; }
        frame 85 { x: 11; y: 31.7; skew-x: 79.5; skew-y: 79.5; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 7.1; y: 43; skew-x: 52.9; skew-y: 52.9; scale-x: 0.798; scale-y: 0.798; }
        frame 87 { x: 11; y: 51.7; skew-x: 26.3; skew-y: 26.3; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 16; y: 61.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 16.9; }
        frame 91 { x: 17.7; }
        frame 92 { x: 18.5; }
        frame 93 { x: 19.4; }
        frame 94 { x: 20.2; }
        frame 95 { x: 21; }
        frame 96 { x: 19.4; y: 63.4; }
        frame 97 { x: 17.7; y: 65.1; }
        frame 98 { x: 16; y: 66.7; }
        frame 99 { x: -10000; y: 65.5; }
        frame 100 { y: 64.2; }
        frame 101 { y: 63; }
        frame 102 { y: 61.7; }
        frame 103 { y: -10000; }
        frame 105 { x: 12.2; y: 55; skew-x: 22.6; skew-y: 22.6; scale-x: 0.799; scale-y: 0.799; }
        frame 106 { x: 9.2; y: 49; skew-x: 45.4; skew-y: 45.4; scale-x: 0.798; scale-y: 0.798; }
        frame 107 { x: 6.6; y: 44.1; skew-x: 68.2; skew-y: 68.2; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 9.3; y: 39; skew-x: 85.4; skew-y: 85.4; }
        frame 109 { x: 11.7; y: 34.5; skew-x: 102.3; skew-y: 102.3; }
        frame 110 { x: 13.7; y: 30.4; skew-x: 119.3; skew-y: 119.3; scale-x: 0.799; scale-y: 0.799; }
        frame 111 { x: 12.1; y: 32.1; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; }
        frame 112 { x: 10.4; y: 33.8; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 8.7; y: 35.4; scale-x: 0.799; scale-y: 0.799; }
        frame 114 { x: 7.6; y: 39.1; skew-x: 99.3; skew-y: 99.3; scale-x: 0.798; scale-y: 0.798; }
        frame 115 { x: 6; y: 43.5; skew-x: 79.7; skew-y: 79.7; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 4; y: 48.9; skew-x: 59.7; skew-y: 59.7; }
        frame 117 { x: 7.6; y: 52.4; skew-x: 39.8; skew-y: 39.8; }
        frame 118 { x: 11.5; y: 56.8; skew-x: 19.8; skew-y: 19.8; scale-x: 0.799; scale-y: 0.799; }
        frame 119 { x: 16; y: 61.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 120 { x: 35.6; y: 56.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 36.5; y: -10000; }
        frame 122 { x: 37.4; }
        frame 123 { x: 38.1; }
        frame 124 { x: 38.8; }
        frame 125 { x: 39.3; }
        frame 126 { x: 39.7; }
        frame 127 { x: 40; }
        frame 128 { x: 40.1; }
        frame 129 { x: 40.2; }
        frame 130 { x: 39; }
        frame 131 { x: 38; }
        frame 132 { x: 37.1; }
        frame 133 { x: 36.4; }
        frame 134 { x: 35.7; }
        frame 135 { x: 35.1; }
        frame 136 { x: 34.8; }
        frame 137 { x: 34.5; }
        frame 138 { x: 34.3; }
        frame 139 { x: 34.2; }
        frame 140 { x: 34.6; y: 56.6; skew-x: 0.5; skew-y: 0.5; }
        frame 141 { x: 35.8; y: 55.9; skew-x: 2; skew-y: 2; }
        frame 142 { x: 37.9; y: 54.7; skew-x: 4.5; skew-y: 4.5; }
        frame 143 { x: 40.8; y: 53; skew-x: 8; skew-y: 8; scale-x: 0.799; scale-y: 0.799; }
        frame 144 { x: 44.6; y: 50.8; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 49.2; y: 48.1; skew-x: 18.1; skew-y: 18.1; }
        frame 146 { x: 54.7; y: 45.1; skew-x: 24.6; skew-y: 24.6; scale-x: 0.798; scale-y: 0.798; }
        frame 147 { x: 61.2; y: 41.5; skew-x: 32.3; skew-y: 32.3; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 68.8; y: 38; skew-x: 40.9; skew-y: 40.9; scale-x: 0.797; scale-y: 0.797; }
        frame 149 { x: 77; y: 34; skew-x: 50.4; skew-y: 50.4; scale-x: 0.798; scale-y: 0.798; }
        frame 150 { x: 106.9; y: 39; skew-x: 71.5; skew-y: 71.5; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: 136.8; y: 45.1; skew-x: 92.5; skew-y: 92.5; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: 157.1; y: 58.5; skew-x: 113.6; skew-y: 113.6; scale-x: 0.797; scale-y: 0.797; }
        frame 153 { x: 177.3; y: 72.6; skew-x: 134.8; skew-y: 134.8; scale-x: 0.798; scale-y: 0.798; }
        frame 154 { x: 172.7; y: 79.4; skew-x: 121.6; skew-y: 121.6; scale-x: 0.796; scale-y: 0.796; }
        frame 155 { x: 167.8; y: 86.5; skew-x: 108.3; skew-y: 108.3; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 162.7; y: 93.9; skew-x: 95.3; skew-y: 95.3; }
        frame 157 { x: 157.3; y: 101.7; skew-x: 82.1; skew-y: 82.1; }
        frame 158 { x: 157.4; y: 101.4; skew-x: 82.2; skew-y: 82.2; }
        frame 159 { x: -10000; y: 101.1; skew-x: -10000; skew-y: -10000; }
        frame 160 { x: 157.3; y: 100.7; skew-x: 82.1; skew-y: 82.1; }
        frame 161 { x: -10000; y: 101.1; skew-x: 82.2; skew-y: 82.2; }
        frame 162 { y: 101.3; skew-x: -10000; skew-y: -10000; }
        frame 163 { y: 101.7; skew-x: 82.1; skew-y: 82.1; }
    }
    Track {
        source-name: "Zombie_disco_innerhand";
        frame-count: 164;
        frame 0 { x: 29.3; y: 29; skew-x: 60; skew-y: 60; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_INNERHAND; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 28.3; y: 28.6; skew-x: 61.4; skew-y: 61.4; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 27.3; y: 28.1; skew-x: 62.7; skew-y: 62.7; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 26.3; y: 27.6; skew-x: 63.9; skew-y: 63.9; scale-x: 0.798; scale-y: 0.798; }
        frame 6 { x: 25.3; y: 27.1; skew-x: 65.2; skew-y: 65.2; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 24.3; y: 26.7; skew-x: 66.4; skew-y: 66.4; }
        frame 8 { x: 23.4; y: 26.2; skew-x: 67.7; skew-y: 67.7; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 22.3; y: 26.1; skew-x: 70.2; skew-y: 70.2; scale-x: 0.798; scale-y: 0.798; }
        frame 10 { x: 21.1; y: -10000; skew-x: 72.7; skew-y: 72.7; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 19.9; skew-x: 75.2; skew-y: 75.2; scale-x: 0.799; scale-y: 0.799; }
        frame 12 { x: 18.7; skew-x: 77.7; skew-y: 77.7; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 17.7; skew-x: 80.2; skew-y: 80.2; }
        frame 14 { x: 16.5; y: 26.2; skew-x: 82.5; skew-y: 82.5; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 17.8; y: 26; skew-x: 79.7; skew-y: 79.7; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 19.2; y: 26.2; skew-x: 76.7; skew-y: 76.7; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 20.6; y: 26.1; skew-x: 73.7; skew-y: 73.7; }
        frame 20 { x: 21.9; y: -10000; skew-x: 70.7; skew-y: 70.7; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 23.4; y: 26.2; skew-x: 67.7; skew-y: 67.7; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 24.6; y: 26.8; skew-x: 66.2; skew-y: 66.2; scale-x: 0.798; scale-y: 0.798; }
        frame 23 { x: 25.8; y: 27.4; skew-x: 64.7; skew-y: 64.7; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 27; y: 27.9; skew-x: 63.2; skew-y: 63.2; scale-x: 0.799; scale-y: 0.799; }
        frame 25 { x: 28.1; y: 28.5; skew-x: 61.7; skew-y: 61.7; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 29.3; y: 29; skew-x: 60; skew-y: 60; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: 11.4; y: 59; skew-x: 7.7; skew-y: 7.7; scale-x: 0.798; scale-y: 0.798; image: IMAGE_REANIM_ZOMBIE_DISCO_INNERHAND_POINT; }
        frame 28 { x: 8.9; y: 48; skew-x: 25.8; skew-y: 25.8; scale-x: 0.796; scale-y: 0.796; image: none; }
        frame 29 { x: 7.2; y: 37.9; skew-x: 44.1; skew-y: 44.1; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 6.2; y: 28.9; skew-x: 62.3; skew-y: 62.3; }
        frame 31 { x: 19; y: 13.2; skew-x: 110.5; skew-y: 110.5; }
        frame 32 { x: 34.1; y: 4.5; skew-x: 145.4; skew-y: 145.4; scale-x: 0.795; scale-y: 0.795; }
        frame 33 { x: 28; y: -6; skew-x: 141; skew-y: 141; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 25.3; y: -17.7; skew-x: 126.8; skew-y: 126.8; scale-x: 0.8; scale-y: 0.8; }
        frame 35 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 28; y: -6; skew-x: 141; skew-y: 141; scale-x: 0.799; scale-y: 0.799; }
        frame 38 { x: 34.1; y: 4.5; skew-x: 145.4; skew-y: 145.4; scale-x: 0.795; scale-y: 0.795; }
        frame 39 { x: 26.2; y: 7.3; skew-x: 125.3; skew-y: 125.4; scale-x: 0.794; scale-y: 0.794; }
        frame 40 { x: 20.5; y: 13.1; skew-x: 105.3; skew-y: 105.3; scale-x: 0.793; scale-y: 0.793; }
        frame 41 { x: 14; y: 20; skew-x: 85.5; skew-y: 85.5; scale-x: 0.794; scale-y: 0.794; }
        frame 42 { x: 7.2; y: 28.3; skew-x: 65.4; skew-y: 65.4; scale-x: 0.795; scale-y: 0.795; }
        frame 43 { x: 7.6; y: 40; skew-x: 45.9; skew-y: 45.9; scale-x: 0.793; scale-y: 0.793; }
        frame 44 { x: 8.9; y: 49; skew-x: 26.3; skew-y: 26.3; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 12; y: 58.3; skew-x: 7; skew-y: 7; scale-x: 0.795; scale-y: 0.795; }
        frame 46 { x: 6.2; y: 16.7; skew-x: 91.3; skew-y: 91.3; scale-x: 0.8; scale-y: 0.8; }
        frame 47 { x: 8.7; y: 15.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 11.2; y: 14.9; }
        frame 49 { x: 13.7; y: 17; }
        frame 50 { x: 16.2; y: 19.1; }
        frame 51 { x: 18.7; y: 21.1; }
        frame 52 { x: 21.2; y: 23.2; }
        frame 53 { x: -10000; y: -10000; }
        frame 57 { x: 19; y: 21.3; }
        frame 58 { x: 16.9; y: 19.4; }
        frame 59 { x: 14.8; y: 17.5; }
        frame 60 { x: 12.6; y: 15.5; }
        frame 61 { x: 10.5; y: 15.9; }
        frame 62 { x: 8.3; y: 16.3; }
        frame 63 { x: 6.2; y: 16.7; }
        frame 64 { x: -10000; y: -10000; }
        frame 67 { x: 11.2; y: 58.6; skew-x: 0; skew-y: 0; image: IMAGE_REANIM_ZOMBIE_DISCO_INNERHAND; }
        frame 68 { x: 5.8; y: 39.1; skew-x: 49.9; skew-y: 49.9; scale-x: 0.798; scale-y: 0.798; image: none; }
        frame 69 { x: 16.6; y: 19.7; skew-x: 99.5; skew-y: 99.5; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 34.9; y: 7.8; skew-x: 149.4; skew-y: 149.4; scale-x: 0.799; scale-y: 0.799; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 36.7; y: 3.5; skew-x: 152.2; skew-y: 152.2; scale-x: 0.797; scale-y: 0.797; }
        frame 74 { x: 38.5; y: -0.8; skew-x: 154.9; skew-y: 154.9; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 40.2; y: -5.1; skew-x: 157.4; skew-y: 157.4; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 39.4; y: -0; skew-x: 159.7; skew-y: 159.7; }
        frame 81 { x: 38.5; y: 5; skew-x: 161.9; skew-y: 161.9; }
        frame 82 { x: 37.9; y: 10.2; skew-x: 163.9; skew-y: 163.9; scale-x: 0.798; scale-y: 0.798; }
        frame 83 { x: 29.3; y: 14; skew-x: 136.6; skew-y: 136.6; scale-x: 0.797; scale-y: 0.797; }
        frame 84 { x: 18.3; y: 19.1; skew-x: 109.3; skew-y: 109.3; scale-x: 0.798; scale-y: 0.798; }
        frame 85 { x: 12.4; y: 26.8; skew-x: 82; skew-y: 82; scale-x: 0.797; scale-y: 0.797; }
        frame 86 { x: 6.1; y: 37.2; skew-x: 54.7; skew-y: 54.7; scale-x: 0.798; scale-y: 0.798; }
        frame 87 { x: 7.7; y: 47; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 11.2; y: 58.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 12.1; }
        frame 91 { x: 12.9; }
        frame 92 { x: 13.7; }
        frame 93 { x: 14.6; }
        frame 94 { x: 15.4; }
        frame 95 { x: 16.2; }
        frame 96 { x: 14.6; y: 60.3; }
        frame 97 { x: 12.9; y: 62; }
        frame 98 { x: 11.2; y: 63.6; }
        frame 99 { x: -10000; y: 62.4; }
        frame 100 { y: 61.1; }
        frame 101 { y: 59.9; }
        frame 102 { y: 58.6; }
        frame 103 { y: -10000; }
        frame 105 { x: 8.5; y: 50.6; skew-x: 25.1; skew-y: 25.1; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 7.7; y: 44; skew-x: 50.4; skew-y: 50.4; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 7.6; y: 39.4; skew-x: 75.7; skew-y: 75.7; }
        frame 108 { x: 12.3; y: 35; skew-x: 94.5; skew-y: 94.5; }
        frame 109 { x: 16.6; y: 32; skew-x: 113.3; skew-y: 113.3; scale-x: 0.797; scale-y: 0.797; }
        frame 110 { x: 20.1; y: 30; skew-x: 132.4; skew-y: 132.4; scale-x: 0.798; scale-y: 0.798; }
        frame 111 { x: 18.4; y: 31.7; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 112 { x: 16.7; y: 33.4; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 15.1; y: 35; scale-x: 0.798; scale-y: 0.798; }
        frame 114 { x: 12.2; y: 36.4; skew-x: 110.3; skew-y: 110.3; scale-x: 0.797; scale-y: 0.797; }
        frame 115 { x: 8.3; y: 39.2; skew-x: 88.4; skew-y: 88.4; scale-x: 0.798; scale-y: 0.798; }
        frame 116 { x: 4; y: 43.8; skew-x: 66.2; skew-y: 66.2; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 5.3; y: 47.5; skew-x: 44.1; skew-y: 44.1; scale-x: 0.797; scale-y: 0.797; }
        frame 118 { x: 7.7; y: 52.5; skew-x: 22; skew-y: 22; scale-x: 0.798; scale-y: 0.798; }
        frame 119 { x: 11.2; y: 58.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 120 { x: 30.8; y: 53.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 31.8; y: -10000; }
        frame 122 { x: 32.6; }
        frame 123 { x: 33.4; }
        frame 124 { x: 34; }
        frame 125 { x: 34.5; }
        frame 126 { x: 34.9; }
        frame 127 { x: 35.1; }
        frame 128 { x: 35.4; }
        frame 129 { x: -10000; }
        frame 130 { x: 34.3; }
        frame 131 { x: 33.3; }
        frame 132 { x: 32.4; }
        frame 133 { x: 31.6; }
        frame 134 { x: 30.9; }
        frame 135 { x: 30.4; }
        frame 136 { x: 30; }
        frame 137 { x: 29.7; }
        frame 138 { x: 29.5; }
        frame 139 { x: 29.4; }
        frame 140 { x: 29.8; y: 53.6; skew-x: 0.5; skew-y: 0.5; }
        frame 141 { x: 31.2; y: 52.8; skew-x: 2; skew-y: 2; }
        frame 142 { x: 33.2; y: 51.4; skew-x: 4.5; skew-y: 4.5; }
        frame 143 { x: 36.2; y: 49.5; skew-x: 8; skew-y: 8; scale-x: 0.799; scale-y: 0.799; }
        frame 144 { x: 40.2; y: 47.1; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 45.1; y: 44.1; skew-x: 18.1; skew-y: 18.1; }
        frame 146 { x: 51; y: 40.9; skew-x: 24.6; skew-y: 24.6; scale-x: 0.798; scale-y: 0.798; }
        frame 147 { x: 58.1; y: 37.2; skew-x: 32.3; skew-y: 32.3; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 66.2; y: 33.1; skew-x: 40.9; skew-y: 40.9; scale-x: 0.797; scale-y: 0.797; }
        frame 149 { x: 75.4; y: 28.8; skew-x: 50.4; skew-y: 50.4; scale-x: 0.798; scale-y: 0.798; }
        frame 150 { x: 107.1; y: 34; skew-x: 71.5; skew-y: 71.5; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: 138.7; y: 40.6; skew-x: 92.5; skew-y: 92.5; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: 161.1; y: 55.4; skew-x: 113.6; skew-y: 113.6; scale-x: 0.797; scale-y: 0.797; }
        frame 153 { x: 182.6; y: 71.3; skew-x: 134.8; skew-y: 134.8; scale-x: 0.798; scale-y: 0.798; }
        frame 154 { x: 177.6; y: 77.3; skew-x: 123.4; skew-y: 123.4; scale-x: 0.796; scale-y: 0.796; }
        frame 155 { x: 172.3; y: 83.5; skew-x: 112.1; skew-y: 112.1; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 166.7; y: 90; skew-x: 100.8; skew-y: 100.8; }
        frame 157 { x: 161; y: 97; skew-x: 89.4; skew-y: 89.4; }
        frame 158 { x: 160.5; y: 96.5; skew-x: 87; skew-y: 87; }
        frame 159 { x: 160.1; y: 96.2; skew-x: 84.7; skew-y: 84.7; }
        frame 160 { x: 159.6; y: 95.7; skew-x: 82.1; skew-y: 82.1; }
        frame 161 { x: 160.2; y: 96.2; skew-x: 84.7; skew-y: 84.7; }
        frame 162 { x: 160.5; y: 96.5; skew-x: 87; skew-y: 87; }
        frame 163 { x: 161; y: 97; skew-x: 89.4; skew-y: 89.4; }
    }
    Track {
        source-name: "Zombie_disco_innerarm_upper";
        frame-count: 164;
        frame 0 { x: 29.1; y: 22.4; skew-x: 315; skew-y: 315; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_INNERARM_UPPER; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 29.5; y: 20.9; skew-x: 320.6; skew-y: 320.6; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 29.9; y: 19.4; skew-x: 326.2; skew-y: 326.2; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { x: 30.5; y: 18; skew-x: 331.7; skew-y: 331.7; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 31.1; y: 16.5; skew-x: 337.4; skew-y: 337.4; }
        frame 7 { x: 31.8; y: 14.9; skew-x: 343; skew-y: 343; }
        frame 8 { x: 32.5; y: 13.5; skew-x: 348.5; skew-y: 348.5; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 33; y: 12.7; skew-x: 354.2; skew-y: 354.2; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 33.5; y: 12; skew-x: 359.7; skew-y: 359.7; }
        frame 11 { x: 34.1; y: 11.4; skew-x: 365; skew-y: 365; }
        frame 12 { x: 34.9; y: 10.8; skew-x: 370.6; skew-y: 370.6; }
        frame 13 { x: 35.6; y: 10.1; skew-x: 376.3; skew-y: 376.3; scale-x: 0.798; scale-y: 0.798; }
        frame 14 { x: 36.5; y: 9.5; skew-x: 381.8; skew-y: 381.8; scale-x: 0.799; scale-y: 0.799; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 35.5; y: 10.3; skew-x: 375.1; skew-y: 375; scale-x: 0.798; scale-y: 0.798; }
        frame 18 { x: 34.5; y: 11; skew-x: 368.3; skew-y: 368.3; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: 33.8; y: 11.8; skew-x: 361.8; skew-y: 361.8; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 33.1; y: 12.6; skew-x: 355.2; skew-y: 355.2; }
        frame 21 { x: 32.5; y: 13.5; skew-x: 348.5; skew-y: 348.5; }
        frame 22 { x: 31.6; y: 15.3; skew-x: 341.9; skew-y: 341.9; scale-x: 0.798; scale-y: 0.798; }
        frame 23 { x: 30.8; y: 17.1; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 30.2; y: 18.9; skew-x: 328.4; skew-y: 328.4; }
        frame 25 { x: 29.6; y: 20.6; skew-x: 321.7; skew-y: 321.7; scale-x: 0.799; scale-y: 0.799; }
        frame 26 { x: 29.1; y: 22.4; skew-x: 315; skew-y: 315; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: 20.2; y: 17.8; skew-x: 360; skew-y: 360; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 22.9; y: 16.2; skew-x: 367.6; skew-y: 367.6; scale-x: 0.799; scale-y: 0.799; }
        frame 29 { x: 25.9; y: 14.6; skew-x: 375.3; skew-y: 375.3; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: 29; y: 13.2; skew-x: 383.1; skew-y: 383.1; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 35.5; y: 10.6; skew-x: 398.6; skew-y: 398.6; scale-x: 0.798; scale-y: 0.798; }
        frame 32 { x: 42.5; y: 8.6; skew-x: 414; skew-y: 414; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 47.8; y: 7.7; skew-x: 444.2; skew-y: 444.2; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 51.9; y: 9.4; skew-x: 474; skew-y: 474; }
        frame 35 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 37 { x: 47.8; y: 7.7; skew-x: 444.2; skew-y: 444.2; }
        frame 38 { x: 42.5; y: 8.6; skew-x: 414; skew-y: 414; }
        frame 39 { x: 39; y: 9.6; skew-x: 406.4; skew-y: 406.4; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 35.5; y: 10.6; skew-x: 398.6; skew-y: 398.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 32.1; y: 11.9; skew-x: 390.8; skew-y: 390.8; }
        frame 42 { x: 29; y: 13.2; skew-x: 383.1; skew-y: 383.1; scale-x: 0.799; scale-y: 0.799; }
        frame 43 { x: 26; y: 14.7; skew-x: 375.3; skew-y: 375.3; scale-x: 0.798; scale-y: 0.798; }
        frame 44 { x: 23; y: 16.2; skew-x: 367.6; skew-y: 367.6; scale-x: 0.799; scale-y: 0.799; }
        frame 45 { x: 20.2; y: 17.8; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 46 { x: 37.4; y: 8.7; skew-x: 404.6; skew-y: 404.6; scale-x: 0.794; scale-y: 0.794; }
        frame 47 { x: 36.4; y: 7.8; skew-x: 396.6; skew-y: 396.6; scale-x: 0.792; scale-y: 0.792; }
        frame 48 { x: 35.4; y: 7; skew-x: 388.6; skew-y: 388.6; scale-x: 0.793; scale-y: 0.793; }
        frame 49 { x: 34.6; y: 8.9; skew-x: 380.6; skew-y: 380.6; scale-x: 0.792; scale-y: 0.792; }
        frame 50 { x: 34; y: 11; skew-x: 372.6; skew-y: 372.6; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 33.7; y: 13; skew-x: 364.6; skew-y: 364.6; }
        frame 52 { x: 33.4; y: 15.2; skew-x: 356.8; skew-y: 356.8; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 57 { x: 33.6; y: 13.2; skew-x: 363.5; skew-y: 363.5; }
        frame 58 { x: 33.9; y: 11.2; skew-x: 370.3; skew-y: 370.3; }
        frame 59 { x: 34.4; y: 9.4; skew-x: 377.1; skew-y: 377.1; }
        frame 60 { x: 35; y: 7.6; skew-x: 384.1; skew-y: 384.1; }
        frame 61 { x: 35.7; y: 7.8; skew-x: 390.8; skew-y: 390.8; }
        frame 62 { x: 36.5; y: 8.2; skew-x: 397.8; skew-y: 397.8; }
        frame 63 { x: 37.4; y: 8.7; skew-x: 404.6; skew-y: 404.6; scale-x: 0.794; scale-y: 0.794; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 20.2; y: 17.8; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: 26.4; y: 16; skew-x: 373.8; skew-y: 373.8; scale-x: 0.799; scale-y: 0.799; }
        frame 69 { x: 33; y: 14.4; skew-x: 387.8; skew-y: 387.8; scale-x: 0.798; scale-y: 0.798; }
        frame 70 { x: 40; y: 13.2; skew-x: 401.6; skew-y: 401.6; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 41.6; y: 11.3; skew-x: 415.2; skew-y: 415.2; scale-x: 0.796; scale-y: 0.69; }
        frame 74 { x: 43.5; y: 9.8; skew-x: 428.7; skew-y: 428.7; scale-x: -10000; scale-y: 0.583; }
        frame 75 { x: 45.5; y: 8.8; skew-x: 442; skew-y: 442; scale-y: 0.477; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 80 { x: 43.5; y: 9.9; skew-x: 428.7; skew-y: 428.7; scale-y: 0.583; }
        frame 81 { x: 41.8; y: 11.4; skew-x: 415.2; skew-y: 415.2; scale-y: 0.69; }
        frame 82 { x: 40; y: 13.2; skew-x: 401.6; skew-y: 401.6; scale-x: 0.798; scale-y: 0.798; }
        frame 83 { x: 36.4; y: 13.7; skew-x: 394.6; skew-y: 394.6; scale-x: 0.797; scale-y: 0.797; }
        frame 84 { x: 33; y: 14.4; skew-x: 387.8; skew-y: 387.8; scale-x: 0.798; scale-y: 0.798; }
        frame 85 { x: 29.6; y: 15.2; skew-x: 380.8; skew-y: 380.8; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 26.3; y: 16; skew-x: 373.8; skew-y: 373.8; scale-x: 0.799; scale-y: 0.799; }
        frame 87 { x: 23.2; y: 16.9; skew-x: 366.8; skew-y: 366.8; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 20.2; y: 17.8; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 21.1; }
        frame 91 { x: 21.9; }
        frame 92 { x: 22.7; }
        frame 93 { x: 23.6; }
        frame 94 { x: 24.4; }
        frame 95 { x: 25.2; }
        frame 96 { x: 23.6; y: 19.4; }
        frame 97 { x: 21.9; y: 21.1; }
        frame 98 { x: 20.2; y: 22.8; }
        frame 99 { x: -10000; y: 21.5; }
        frame 100 { y: 20.3; }
        frame 101 { y: 19; }
        frame 102 { y: 17.8; }
        frame 103 { y: -10000; }
        frame 105 { x: 20.6; y: 18.8; skew-x: 361.3; skew-y: 361.3; }
        frame 106 { x: 20.8; y: 19.9; skew-x: 362.5; skew-y: 362.5; }
        frame 107 { x: 21.3; y: 20.9; skew-x: 364; skew-y: 364; }
        frame 108 { x: 21.5; y: 21.7; skew-x: 365; skew-y: 365; scale-x: 0.799; scale-y: 0.799; }
        frame 109 { x: 21.9; y: 22.6; skew-x: 366.1; skew-y: 366.1; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 22; y: 23.2; skew-x: 367.3; skew-y: 367.3; scale-x: 0.8; scale-y: 0.8; }
        frame 111 { x: 20.4; y: 24.9; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 112 { x: 18.7; y: 26.6; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 17; y: 28.2; scale-x: 0.8; scale-y: 0.8; }
        frame 114 { x: 17.6; y: 26.5; skew-x: 366; skew-y: 366; scale-x: 0.799; scale-y: 0.799; }
        frame 115 { x: 18.1; y: 24.8; skew-x: 364.8; skew-y: 364.8; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 18.6; y: 23; skew-x: 363.5; skew-y: 363.5; scale-x: 0.8; scale-y: 0.8; }
        frame 117 { x: 19.2; y: 21.3; skew-x: 362.3; skew-y: 362.3; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: 19.7; y: 19.6; skew-x: 361; skew-y: 361; }
        frame 119 { x: 20.2; y: 17.8; skew-x: 360; skew-y: 360; }
        frame 120 { x: 39.8; y: 13; skew-x: -10000; skew-y: -10000; }
        frame 121 { x: 41.9; y: 12.8; skew-x: 361.3; skew-y: 361.3; }
        frame 122 { x: 43.6; y: 12.6; skew-x: 362.5; skew-y: 362.5; }
        frame 123 { x: 45.2; y: 12.5; skew-x: 363.5; skew-y: 363.5; }
        frame 124 { x: 46.5; y: 12.3; skew-x: 364.3; skew-y: 364.3; }
        frame 125 { x: 47.6; y: 12.2; skew-x: 365.1; skew-y: 365.1; }
        frame 126 { x: 48.5; y: 12.1; skew-x: 365.8; skew-y: 365.8; scale-x: 0.799; scale-y: 0.799; }
        frame 127 { x: 49.1; y: -10000; skew-x: 366; skew-y: 366; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 49.5; y: 12; skew-x: 366.3; skew-y: 366.3; }
        frame 129 { x: 49.6; y: 11.9; skew-x: 366.5; skew-y: 366.5; scale-x: 0.8; scale-y: 0.8; }
        frame 130 { x: 47.8; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 131 { x: 46.1; scale-x: -10000; scale-y: -10000; }
        frame 132 { x: 44.7; }
        frame 133 { x: 43.5; }
        frame 134 { x: 42.5; }
        frame 135 { x: 41.5; }
        frame 136 { x: 40.9; }
        frame 137 { x: 40.5; }
        frame 138 { x: 40.1; }
        frame 139 { x: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 140 { x: 40.9; skew-x: 367; skew-y: 367; scale-x: 0.799; scale-y: 0.799; }
        frame 141 { x: 42.9; skew-x: 368.5; skew-y: 368.5; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 46.5; y: 12; skew-x: 371.3; skew-y: 371.3; }
        frame 143 { x: 51.5; y: 12.1; skew-x: 374.8; skew-y: 374.8; }
        frame 144 { x: 58; y: 12.3; skew-x: 379.6; skew-y: 379.6; scale-x: 0.798; scale-y: 0.798; }
        frame 145 { x: 66.1; y: 12.4; skew-x: 385.5; skew-y: 385.5; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 75.7; y: 12.8; skew-x: 392.3; skew-y: 392.3; scale-x: 0.797; scale-y: 0.797; }
        frame 147 { x: 86.8; y: 13.3; skew-x: 400.4; skew-y: 400.4; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 99.7; y: 14; skew-x: 409.4; skew-y: 409.4; }
        frame 149 { x: 114.1; y: 15.1; skew-x: 419.4; skew-y: 419.4; scale-x: 0.798; scale-y: 0.798; }
        frame 150 { x: 141.7; y: 32; skew-x: 434.7; skew-y: 434.7; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: 169.3; y: 49.3; skew-x: 449.7; skew-y: 449.7; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: 187.9; y: 73.8; skew-x: 464.6; skew-y: 464.6; scale-x: 0.797; scale-y: 0.797; }
        frame 153 { x: 206.3; y: 98.9; skew-x: 479.7; skew-y: 479.7; scale-x: 0.798; scale-y: 0.798; }
        frame 154 { x: 204.8; y: 97.9; skew-x: 468.3; skew-y: 468.3; scale-x: 0.797; scale-y: 0.797; }
        frame 155 { x: 203.1; y: 97.2; skew-x: 456.8; skew-y: 456.8; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 201.3; y: 96.7; skew-x: 445.5; skew-y: 445.5; }
        frame 157 { x: 199.5; y: -10000; skew-x: 434.1; skew-y: 434.1; }
        frame 158 { x: 199.9; y: 96.6; skew-x: 436.2; skew-y: 436.2; scale-x: 0.796; scale-y: 0.796; }
        frame 159 { x: 200.2; y: 96.7; skew-x: 438.4; skew-y: 438.4; scale-x: -10000; scale-y: -10000; }
        frame 160 { x: 200.5; y: -10000; skew-x: 440.4; skew-y: 440.4; }
        frame 161 { x: 200.2; skew-x: 438.4; skew-y: 438.4; }
        frame 162 { x: 199.8; skew-x: 436.2; skew-y: 436.2; }
        frame 163 { x: 199.5; skew-x: 434.1; skew-y: 434.1; scale-x: 0.797; scale-y: 0.797; }
    }
    Track {
        source-name: "Zombie_disco_innerarm_lower";
        frame-count: 164;
        frame 0 { x: 45; y: 21.3; skew-x: 60; skew-y: 60; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_INNERARM_LOWER; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 43.9; y: 20.9; skew-x: 60.1; skew-y: 60.1; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 42.8; y: 20.6; skew-x: 60.2; skew-y: 60.2; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { x: 41.6; y: 20.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 40.5; y: 20; }
        frame 7 { x: 39.4; y: 19.7; }
        frame 8 { x: 38.1; y: 19.3; skew-x: 60.1; skew-y: 60.1; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 36.6; y: 19.4; skew-x: 60.2; skew-y: 60.2; scale-x: 0.798; scale-y: 0.798; }
        frame 10 { x: 35; y: 19.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 33.5; y: 19.6; }
        frame 12 { x: 31.9; y: 19.7; }
        frame 13 { x: 30.3; y: -10000; skew-x: 60.1; skew-y: 60.1; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 28.7; y: 19.8; skew-x: 60; skew-y: 60; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 30.6; y: 19.7; skew-x: 60.1; skew-y: 60.1; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 32.5; y: -10000; skew-x: 60.2; skew-y: 60.2; scale-x: 0.798; scale-y: 0.798; }
        frame 19 { x: 34.4; y: 19.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 36.2; y: 19.5; }
        frame 21 { x: 38.1; y: 19.3; skew-x: 60.1; skew-y: 60.1; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 39.5; y: 19.7; skew-x: 60.2; skew-y: 60.2; scale-x: 0.798; scale-y: 0.798; }
        frame 23 { x: 40.9; y: 20.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 42.3; y: 20.5; }
        frame 25 { x: 43.6; y: 20.9; skew-x: 60.1; skew-y: 60.1; scale-x: 0.799; scale-y: 0.799; }
        frame 26 { x: 45; y: 21.3; skew-x: 60; skew-y: 60; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: 12.9; y: 41.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 15.2; y: 34.6; skew-x: 21.3; skew-y: 21.3; scale-x: 0.799; scale-y: 0.799; }
        frame 29 { x: 18.9; y: 28.5; skew-x: 42.9; skew-y: 42.9; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: 23.8; y: 23.8; skew-x: 64.4; skew-y: 64.4; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 34.4; y: 19.7; skew-x: 107.1; skew-y: 107.1; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 42; y: 21.9; skew-x: 150; skew-y: 150; scale-x: 0.8; scale-y: 0.8; }
        frame 33 { x: 38.4; y: 8.5; skew-x: 138.4; skew-y: 138.4; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 38.1; y: -4.6; skew-x: 126.8; skew-y: 126.8; scale-x: 0.8; scale-y: 0.8; }
        frame 35 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 38.4; y: 8.5; skew-x: 138.4; skew-y: 138.4; scale-x: 0.799; scale-y: 0.799; }
        frame 38 { x: 42; y: 21.9; skew-x: 150; skew-y: 150; scale-x: 0.8; scale-y: 0.8; }
        frame 39 { x: 38.9; y: 20.2; skew-x: 128.6; skew-y: 128.6; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 34.4; y: 19.8; skew-x: 107.1; skew-y: 107.1; scale-x: 0.799; scale-y: 0.799; }
        frame 41 { x: 29.3; y: 20.9; skew-x: 86; skew-y: 86; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 23.8; y: 23.8; skew-x: 64.4; skew-y: 64.4; }
        frame 43 { x: 18.9; y: 28.5; skew-x: 42.9; skew-y: 42.9; scale-x: 0.798; scale-y: 0.798; }
        frame 44 { x: 15.1; y: 34.6; skew-x: 21.3; skew-y: 21.3; scale-x: 0.799; scale-y: 0.799; }
        frame 45 { x: 12.9; y: 41.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 46 { x: 23.9; y: 15.2; skew-x: 77.2; skew-y: 77.2; scale-x: 0.79; scale-y: 0.79; }
        frame 47 { x: 26.4; y: 14.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 28.9; y: 13.9; }
        frame 49 { x: 31.4; y: 16; scale-x: 0.789; scale-y: 0.789; }
        frame 50 { x: 33.9; y: 18; scale-x: 0.79; scale-y: 0.79; }
        frame 51 { x: 36.3; y: 20; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 38.7; y: 21.9; }
        frame 53 { x: -10000; y: -10000; }
        frame 57 { x: 36.6; y: 20.1; }
        frame 58 { x: 34.5; y: 18.3; }
        frame 59 { x: 32.4; y: 16.5; scale-x: 0.789; scale-y: 0.789; }
        frame 60 { x: 30.2; y: 14.6; scale-x: 0.79; scale-y: 0.79; }
        frame 61 { x: 28.1; y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 26; y: 15; }
        frame 63 { x: 23.9; y: 15.2; }
        frame 64 { x: -10000; y: -10000; }
        frame 67 { x: 12.9; y: 41.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: 20.5; y: 28.8; skew-x: 49.1; skew-y: 49.1; scale-x: 0.798; scale-y: 0.798; }
        frame 69 { x: 32.8; y: 23.7; skew-x: 98.1; skew-y: 98.1; scale-x: 0.797; scale-y: 0.797; }
        frame 70 { x: 42.4; y: 27.1; skew-x: 147.3; skew-y: 147.3; scale-x: 0.798; scale-y: 0.798; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 43.9; y: 21.5; skew-x: 147.2; skew-y: 147.2; scale-x: 0.796; scale-y: 0.796; }
        frame 74 { x: 45.5; y: 15.7; skew-x: 147.1; skew-y: 147.1; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 47; y: 10; skew-x: 146.9; skew-y: 146.9; scale-x: 0.798; scale-y: 0.798; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 45.8; y: 16.5; skew-x: 150.9; skew-y: 150.9; scale-x: 0.796; scale-y: 0.796; }
        frame 81 { x: 44.5; y: 23.1; skew-x: 155.2; skew-y: 155.2; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 43.1; y: 29.7; skew-x: 159.1; skew-y: 159.1; scale-x: 0.797; scale-y: 0.797; }
        frame 83 { x: 39.9; y: 26.2; skew-x: 132.6; skew-y: 132.6; scale-x: 0.796; scale-y: 0.796; }
        frame 84 { x: 34.5; y: 24.3; skew-x: 106; skew-y: 106; scale-x: 0.797; scale-y: 0.797; }
        frame 85 { x: 27.9; y: 25; skew-x: 79.7; skew-y: 79.7; scale-x: 0.798; scale-y: 0.798; }
        frame 86 { x: 21.4; y: 28.4; skew-x: 53.1; skew-y: 53.1; scale-x: 0.797; scale-y: 0.797; }
        frame 87 { x: 16; y: 34.1; skew-x: 26.5; skew-y: 26.5; scale-x: 0.798; scale-y: 0.798; }
        frame 88 { x: 12.9; y: 41.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 13.7; }
        frame 91 { x: 14.5; }
        frame 92 { x: 15.4; }
        frame 93 { x: 16.2; }
        frame 94 { x: 17; }
        frame 95 { x: 17.9; }
        frame 96 { x: 16.2; y: 43.4; }
        frame 97 { x: 14.5; y: 45; }
        frame 98 { x: 12.9; y: 46.7; }
        frame 99 { x: -10000; y: 45.5; }
        frame 100 { y: 44.2; }
        frame 101 { y: 43; }
        frame 102 { y: 41.7; }
        frame 103 { y: -10000; }
        frame 105 { x: 14.5; y: 37.4; skew-x: 20.8; skew-y: 20.8; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 17.7; y: 34; skew-x: 41.8; skew-y: 41.8; scale-x: 0.797; scale-y: 0.797; }
        frame 107 { x: 21.9; y: 31.8; skew-x: 62.7; skew-y: 62.7; scale-x: 0.798; scale-y: 0.798; }
        frame 108 { x: 25.4; y: 31.3; skew-x: 78.5; skew-y: 78.5; scale-x: 0.797; scale-y: 0.797; }
        frame 109 { x: 29; y: 31.9; skew-x: 94; skew-y: 94; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 32.3; y: 33.3; skew-x: 109.8; skew-y: 109.8; scale-x: 0.798; scale-y: 0.798; }
        frame 111 { x: 30.6; y: 34.9; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 112 { x: 28.9; y: 36.6; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 27.3; y: 38.3; scale-x: 0.798; scale-y: 0.798; }
        frame 114 { x: 24.2; y: 35.9; skew-x: 91.3; skew-y: 91.3; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 20.9; y: 34.8; skew-x: 73.2; skew-y: 73.2; scale-x: 0.797; scale-y: 0.797; }
        frame 116 { x: 17.7; y: 35; skew-x: 54.9; skew-y: 54.9; scale-x: 0.798; scale-y: 0.798; }
        frame 117 { x: 15.2; y: 36.4; skew-x: 36.6; skew-y: 36.6; scale-x: 0.797; scale-y: 0.797; }
        frame 118 { x: 13.5; y: 38.8; skew-x: 18.3; skew-y: 18.3; scale-x: 0.798; scale-y: 0.798; }
        frame 119 { x: 12.9; y: 41.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 120 { x: 32.5; y: 36.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 33.7; y: -10000; }
        frame 122 { x: 34.8; }
        frame 123 { x: 35.8; }
        frame 124 { x: 36.6; }
        frame 125 { x: 37.3; }
        frame 126 { x: 37.8; }
        frame 127 { x: 38.1; }
        frame 128 { x: 38.4; }
        frame 129 { x: 38.5; }
        frame 130 { x: 36.5; y: 37.2; skew-x: -1.2; skew-y: -1.2; }
        frame 131 { x: 35; y: 37.5; skew-x: -2.4; skew-y: -2.4; }
        frame 132 { x: 33.5; y: 37.7; skew-x: -3.5; skew-y: -3.5; }
        frame 133 { x: 32.3; y: 38; skew-x: -4.4; skew-y: -4.4; }
        frame 134 { x: 31.3; y: 38.1; skew-x: -5.2; skew-y: -5.2; scale-x: 0.799; scale-y: 0.799; }
        frame 135 { x: 30.4; y: 38.3; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; scale-y: -10000; }
        frame 136 { x: 29.7; y: 38.4; skew-x: -6.4; skew-y: -6.4; }
        frame 137 { x: 29.2; y: -10000; skew-x: -6.9; skew-y: -6.9; }
        frame 138 { x: 28.9; y: 38.5; skew-x: -7; skew-y: -7; }
        frame 139 { x: 28.8; y: 38.6; skew-x: -7.2; skew-y: -7.2; scale-x: 0.8; scale-y: 0.8; }
        frame 140 { x: 29.3; y: 38.4; skew-x: -6.4; skew-y: -6.4; scale-x: 0.799; scale-y: 0.799; }
        frame 141 { x: 30.9; y: 37.8; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 33.7; y: 36.7; skew-x: -1.5; skew-y: -1.5; }
        frame 143 { x: 37.8; y: 35.3; skew-x: 2.5; skew-y: 2.5; }
        frame 144 { x: 43; y: 33.5; skew-x: 8; skew-y: 8; }
        frame 145 { x: 49.5; y: 31.3; skew-x: 14.8; skew-y: 14.8; scale-x: 0.798; scale-y: 0.798; }
        frame 146 { x: 57.6; y: 28.7; skew-x: 23; skew-y: 23; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 67.2; y: 26; skew-x: 32.3; skew-y: 32.3; scale-x: 0.797; scale-y: 0.797; }
        frame 148 { x: 78.3; y: 23.2; skew-x: 42.9; skew-y: 42.9; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 91; y: 20.6; skew-x: 54.7; skew-y: 54.7; }
        frame 150 { x: 121.7; y: 31; skew-x: 74.4; skew-y: 74.4; }
        frame 151 { x: 152.3; y: 43; skew-x: 94; skew-y: 94; }
        frame 152 { x: 174; y: 62.9; skew-x: 113.8; skew-y: 113.8; scale-x: 0.796; scale-y: 0.796; }
        frame 153 { x: 194.8; y: 84.2; skew-x: 133.7; skew-y: 133.7; scale-x: 0.797; scale-y: 0.797; }
        frame 154 { x: 190.9; y: 86; skew-x: 119.8; skew-y: 119.8; scale-x: 0.796; scale-y: 0.796; }
        frame 155 { x: 186.7; y: 88.3; skew-x: 106; skew-y: 106; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 182.1; y: 91.5; skew-x: 92.3; skew-y: 92.3; }
        frame 157 { x: 177.2; y: 95.1; skew-x: 78.5; skew-y: 78.5; }
        frame 158 { x: 177.3; y: 94.8; skew-x: 79.4; skew-y: 79.4; }
        frame 159 { x: 177.5; y: 94.5; skew-x: 80.2; skew-y: 80.2; }
        frame 160 { x: 177.7; y: 94.1; skew-x: 80.8; skew-y: 80.8; }
        frame 161 { x: 177.5; y: 94.4; skew-x: 80.2; skew-y: 80.2; }
        frame 162 { x: 177.3; y: 94.7; skew-x: 79.4; skew-y: 79.4; }
        frame 163 { x: 177.2; y: 95.1; skew-x: 78.5; skew-y: 78.5; }
    }
    Track {
        source-name: "Zombie_disco_innerfoot";
        frame-count: 164;
        frame 0 { x: 11.6; y: 93.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_INNERFOOT; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 13.4; y: 89.7; skew-x: 1.1; skew-y: 1.1; }
        frame 4 { x: 15.3; y: 85.7; skew-x: 2.3; skew-y: 2.3; }
        frame 5 { x: 17.1; y: 81.6; skew-x: 3.6; skew-y: 3.6; }
        frame 6 { x: 18.9; y: 77.6; skew-x: 4.8; skew-y: 4.8; }
        frame 7 { x: 20.8; y: 73.5; skew-x: 6.1; skew-y: 6.1; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 22.6; y: 69.3; skew-x: 7.4; skew-y: 7.4; scale-x: 0.8; scale-y: 0.8; }
        frame 9 { x: 25.3; y: 73; skew-x: 6.1; skew-y: 6.1; scale-x: 0.799; scale-y: 0.799; }
        frame 10 { x: 28; y: 76.7; skew-x: 4.8; skew-y: 4.8; scale-x: 0.8; scale-y: 0.8; }
        frame 11 { x: 30.8; y: 80.3; skew-x: 3.6; skew-y: 3.6; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 33.5; y: 84; skew-x: 2.3; skew-y: 2.3; }
        frame 13 { x: 36.2; y: 87.7; skew-x: 1.1; skew-y: 1.1; }
        frame 14 { x: 39; y: 91.3; skew-x: 0; skew-y: 0; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 17 { x: 36.3; y: 91.6; }
        frame 18 { x: 33.5; y: 91.8; }
        frame 19 { x: 30.8; y: 92.1; }
        frame 20 { x: 28.1; y: 92.3; }
        frame 21 { x: 25.3; y: 92.6; }
        frame 22 { x: 22.6; y: 92.8; }
        frame 23 { x: 19.8; y: 93.1; }
        frame 24 { x: 17.1; y: 93.3; }
        frame 25 { x: 14.3; y: 93.6; }
        frame 26 { x: 11.6; y: 93.8; }
        frame 27 { x: 27.3; y: -10000; }
        frame 28 { x: 27.8; y: 95.8; skew-x: -4.7; scale-x: 0.745; scale-y: 0.769; }
        frame 29 { x: 28.3; y: 97.7; skew-x: -9.4; scale-x: 0.69; scale-y: 0.739; }
        frame 30 { x: 55.9; y: 91.3; skew-x: -179.9; skew-y: -3.3; scale-x: 0.75; scale-y: 0.801; }
        frame 31 { x: 57.1; y: -10000; skew-x: -10000; skew-y: -2.2; scale-x: 0.778; scale-y: -10000; }
        frame 32 { x: 58.4; skew-y: -0.9; scale-x: 0.805; scale-y: 0.8; }
        frame 33 { x: 59.7; skew-y: 0; scale-x: 0.833; scale-y: -10000; }
        frame 34 { x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 39 { x: 58.4; skew-y: -0.9; scale-x: 0.805; }
        frame 40 { x: 57.2; skew-y: -2.2; scale-x: 0.778; scale-y: 0.801; }
        frame 41 { x: 55.9; skew-y: -3.3; scale-x: 0.75; scale-y: -10000; }
        frame 42 { x: 28.3; y: 97.7; skew-x: -9.4; skew-y: 0; scale-x: 0.69; scale-y: 0.739; }
        frame 43 { x: 28; y: 96.4; skew-x: -6.2; skew-y: -10000; scale-x: 0.726; scale-y: 0.759; }
        frame 44 { x: 27.5; y: 95.2; skew-x: -2.9; scale-x: 0.763; scale-y: 0.78; }
        frame 45 { x: 27.3; y: 93.8; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 46 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 26; y: 86.8; skew-x: 3.5; skew-y: 3.5; }
        frame 48 { x: 24.6; y: 79.7; skew-x: 7.3; skew-y: 7.3; }
        frame 49 { x: 24.1; y: 83.3; skew-x: 5.3; skew-y: 5.3; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: 23.5; y: 86.8; skew-x: 3.5; skew-y: 3.5; scale-x: 0.8; scale-y: 0.8; }
        frame 51 { x: 22.9; y: 90.3; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 22.3; y: 93.8; skew-x: 0; skew-y: 0; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 57 { x: 23.6; }
        frame 58 { x: 24.8; }
        frame 59 { x: 26.1; }
        frame 60 { x: 27.3; }
        frame 61 { x: -10000; }
        frame 140 { x: 27.7; y: 93.6; skew-x: 0.3; skew-y: 0.3; }
        frame 141 { x: 28.8; y: 93.1; skew-x: 1.3; skew-y: 1.3; }
        frame 142 { x: 30.7; y: 92.1; skew-x: 3; skew-y: 3; }
        frame 143 { x: 33.4; y: 90.6; skew-x: 5.3; skew-y: 5.3; }
        frame 144 { x: 36.6; y: 88.9; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 145 { x: 41; y: 86.6; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 46; y: 84.1; skew-x: 16.3; skew-y: 16.3; }
        frame 147 { x: 51.9; y: 81.2; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 148 { x: 58.6; y: 77.8; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 66.3; y: 74.3; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 150 { x: 79.4; y: 74.2; skew-x: 46.6; skew-y: 46.6; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: 92.6; y: 74.6; skew-x: 59.7; skew-y: 59.7; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: 106.3; y: 75.7; skew-x: 72.9; skew-y: 72.9; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 119.9; y: 77.3; skew-x: 85.9; skew-y: 85.9; scale-x: 0.799; scale-y: 0.799; }
        frame 154 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_innerleg_lower";
        frame-count: 164;
        frame 0 { x: 7.7; y: 70.4; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_INNERLEG_LOWER; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 10.8; y: 66.7; skew-x: 5; skew-y: 4.8; scale-x: 0.808; scale-y: 0.762; }
        frame 4 { x: 14.1; y: 63; skew-x: 9.8; skew-y: 9.8; scale-x: 0.816; scale-y: 0.725; }
        frame 5 { x: 17.6; y: 59.5; skew-x: 14.8; skew-y: 14.8; scale-x: 0.825; scale-y: 0.687; }
        frame 6 { x: 21.2; y: 55.8; skew-x: 20; skew-y: 19.8; scale-x: 0.833; scale-y: 0.649; }
        frame 7 { x: 24.8; y: 52.4; skew-x: 24.8; skew-y: 24.8; scale-x: 0.841; scale-y: 0.612; }
        frame 8 { x: 28.9; y: 48.8; skew-x: 30; skew-y: 29.9; scale-x: 0.851; scale-y: 0.575; }
        frame 9 { x: 29.2; y: 52.4; skew-x: 24.8; skew-y: 24.8; scale-x: 0.841; scale-y: 0.612; }
        frame 10 { x: 29.6; y: 55.8; skew-x: 20; skew-y: 19.8; scale-x: 0.833; scale-y: 0.649; }
        frame 11 { x: 30.2; y: 59.5; skew-x: 14.8; skew-y: 14.8; scale-x: 0.825; scale-y: 0.687; }
        frame 12 { x: 30.8; y: 63; skew-x: 9.8; skew-y: 9.8; scale-x: 0.816; scale-y: 0.725; }
        frame 13 { x: 31.8; y: 66.7; skew-x: 5; skew-y: 4.8; scale-x: 0.808; scale-y: 0.762; }
        frame 14 { x: 32.7; y: 70.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 30.2; }
        frame 18 { x: 27.7; }
        frame 19 { x: 25.2; }
        frame 20 { x: 22.7; }
        frame 21 { x: 20.2; }
        frame 22 { x: 17.7; }
        frame 23 { x: 15.2; }
        frame 24 { x: 12.7; }
        frame 25 { x: 10.2; }
        frame 26 { x: 7.7; }
        frame 27 { x: 22.8; y: 72.9; }
        frame 28 { x: 19.3; y: 72.7; skew-y: -10.2; scale-x: 0.752; scale-y: 0.827; }
        frame 29 { x: 15.8; y: 72.9; skew-y: -20.5; scale-x: 0.705; scale-y: 0.855; }
        frame 30 { x: 74.5; y: 66.5; skew-x: 180; skew-y: 22.3; scale-x: 0.781; scale-y: 1.007; }
        frame 31 { x: 71.5; y: 64.3; skew-x: 176.9; skew-y: 15.8; scale-x: 0.783; scale-y: 0.995; }
        frame 32 { x: 68.3; y: 62.2; skew-x: 173.7; skew-y: 9.3; scale-x: 0.785; scale-y: 0.984; }
        frame 33 { x: 65.3; y: 60.3; skew-x: 170.3; skew-y: 2.9; scale-x: 0.787; scale-y: 0.973; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 68.5; y: 62.3; skew-x: 173.7; skew-y: 9.3; scale-x: 0.785; scale-y: 0.984; }
        frame 40 { x: 71.6; y: 64.4; skew-x: 176.9; skew-y: 15.8; scale-x: 0.783; scale-y: 0.995; }
        frame 41 { x: 74.5; y: 66.5; skew-x: 180; skew-y: 22.3; scale-x: 0.781; scale-y: 1.007; }
        frame 42 { x: 15.8; y: 72.9; skew-x: 0; skew-y: -20.5; scale-x: 0.705; scale-y: 0.855; }
        frame 43 { x: 18.2; y: 72.7; skew-x: -10000; skew-y: -13.5; scale-x: 0.736; scale-y: 0.836; }
        frame 44 { x: 20.5; y: 72.8; skew-y: -6.7; scale-x: 0.768; scale-y: 0.818; }
        frame 45 { x: 22.8; y: 72.9; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 46 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 21; y: 68.3; skew-x: 5.8; skew-y: -1.2; scale-x: 0.812; scale-y: 0.713; }
        frame 48 { x: 19.6; y: 63.6; skew-x: 11.5; skew-y: -2.4; scale-x: 0.824; scale-y: 0.626; }
        frame 49 { x: 18.3; y: 65.8; skew-x: 8.5; skew-y: -2.9; scale-x: 0.817; scale-y: 0.67; }
        frame 50 { x: 17.1; y: 67.8; skew-x: 5.8; skew-y: -3.7; scale-x: 0.812; scale-y: 0.714; }
        frame 51 { x: 16; y: 69.9; skew-x: 2.8; skew-y: -4.2; scale-x: 0.806; scale-y: 0.759; }
        frame 52 { x: 14.8; y: 71.9; skew-x: 0; skew-y: -4.9; scale-x: 0.8; scale-y: 0.803; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 16.8; y: 72.2; skew-y: -3.7; scale-y: 0.802; }
        frame 58 { x: 18.8; y: 72.4; skew-y: -2.4; scale-y: 0.801; }
        frame 59 { x: 20.8; y: 72.7; skew-y: -1.2; scale-y: -10000; }
        frame 60 { x: 22.8; y: 72.9; skew-y: 0; scale-y: 0.8; }
        frame 61 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 73 { x: 21.2; y: 72.8; skew-y: -4.7; scale-x: 0.783; scale-y: 0.809; }
        frame 74 { x: 19.6; y: -10000; skew-y: -9.7; scale-x: 0.766; scale-y: 0.818; }
        frame 75 { x: 17.9; y: 72.9; skew-y: -14.6; scale-x: 0.75; scale-y: 0.827; }
        frame 76 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 18.7; y: 72.8; skew-y: -12.2; scale-x: 0.758; scale-y: 0.822; }
        frame 84 { x: 19.6; y: -10000; skew-y: -9.7; scale-x: 0.766; scale-y: 0.818; }
        frame 85 { x: 20.3; skew-y: -7.2; scale-x: 0.775; scale-y: 0.813; }
        frame 86 { x: 21.2; skew-y: -4.7; scale-x: 0.783; scale-y: 0.809; }
        frame 87 { x: 22; skew-y: -2.2; scale-x: 0.792; scale-y: 0.804; }
        frame 88 { x: 22.8; y: 72.9; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 89 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 23.3; y: 72.7; skew-x: 0.3; skew-y: 0.3; }
        frame 141 { x: 24.6; y: 72.1; skew-x: 1.3; skew-y: 1.3; }
        frame 142 { x: 26.9; y: 71; skew-x: 3; skew-y: 3; }
        frame 143 { x: 30.1; y: 69.5; skew-x: 5.3; skew-y: 5.3; }
        frame 144 { x: 34.4; y: 67.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 145 { x: 39.8; y: 65.2; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 46.1; y: 62.6; skew-x: 16.3; skew-y: 16.3; }
        frame 147 { x: 53.9; y: 59.7; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 148 { x: 62.7; y: 56.6; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 72.8; y: 53.5; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 150 { x: 91.2; y: 54.5; skew-x: 45.1; skew-y: 45.1; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: 110.2; y: 57; skew-x: 56.9; skew-y: 56.9; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: 125.3; y: 61.7; skew-x: 68.7; skew-y: 68.7; scale-x: 0.797; scale-y: 0.797; }
        frame 153 { x: 140.4; y: 68; skew-x: 80.4; skew-y: 80.4; scale-x: 0.799; scale-y: 0.799; }
        frame 154 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_innerleg_upper";
        frame-count: 164;
        frame 0 { x: 44; y: 44.8; skew-x: 30; skew-y: 30; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_INNERLEG_UPPER; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 43.4; y: 45.5; skew-x: 24.8; skew-y: 24.8; scale-x: 0.799; scale-y: 0.759; }
        frame 4 { x: 42.8; y: 46.2; skew-x: 20; skew-y: 19.8; scale-x: -10000; scale-y: 0.718; }
        frame 5 { x: 42.2; y: 47.2; skew-x: 14.8; skew-y: 14.8; scale-y: 0.678; }
        frame 6 { x: 41.9; y: 48; skew-x: 9.8; skew-y: 9.8; scale-x: 0.8; scale-y: 0.638; }
        frame 7 { x: 41.5; y: 49; skew-x: 5; skew-y: 4.8; scale-x: -10000; scale-y: 0.598; }
        frame 8 { x: 41.3; y: 49.9; skew-x: 0; skew-y: 0; scale-y: 0.558; }
        frame 9 { x: 41.6; y: 50; skew-x: -2.2; skew-y: -2.2; scale-y: 0.598; }
        frame 10 { x: 42; y: 50.3; skew-x: -4.5; skew-y: -4.5; scale-x: 0.799; scale-y: 0.638; }
        frame 11 { x: 42.4; y: 50.5; skew-x: -6.9; skew-y: -6.9; scale-x: -10000; scale-y: 0.678; }
        frame 12 { x: 42.6; y: 50.8; skew-x: -9.2; skew-y: -9.2; scale-x: 0.798; scale-y: 0.718; }
        frame 13 { x: 43; y: 51.1; skew-x: -11.7; skew-y: -11.7; scale-x: -10000; scale-y: 0.758; }
        frame 14 { x: 43.4; y: 51.4; skew-x: -14.1; skew-y: -14.1; scale-y: 0.798; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 17 { x: 43.2; y: 50.6; skew-x: -9.5; skew-y: -9.5; }
        frame 18 { x: 43.1; y: 49.9; skew-x: -5.2; skew-y: -5.2; }
        frame 19 { x: 43; y: 49.1; skew-x: -0.7; skew-y: -0.7; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { x: -10000; y: 48.5; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 47.8; skew-x: 7.8; skew-y: 7.8; }
        frame 22 { x: 43.1; y: 47.1; skew-x: 12.3; skew-y: 12.3; }
        frame 23 { x: 43.3; y: 46.5; skew-x: 16.8; skew-y: 16.8; }
        frame 24 { x: 43.5; y: 46; skew-x: 21.1; skew-y: 21.1; }
        frame 25 { x: 43.6; y: 45.3; skew-x: 25.6; skew-y: 25.6; }
        frame 26 { x: 44; y: 44.8; skew-x: 30; skew-y: 30; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: 41.4; y: 49; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 41.9; y: 47.8; skew-x: 7.3; skew-y: 8.3; }
        frame 29 { x: 42.4; y: 46.6; skew-x: 15; skew-y: 16.7; }
        frame 30 { x: 61.2; y: 51.2; skew-x: 190.9; skew-y: 10.9; scale-x: 0.895; scale-y: 0.732; }
        frame 31 { x: 61.1; y: 52.3; skew-x: 197.3; skew-y: 14.8; scale-x: 0.894; scale-y: 0.756; }
        frame 32 { x: 60.9; y: 53.4; skew-x: 203.6; skew-y: 18.8; scale-x: -10000; scale-y: 0.781; }
        frame 33 { x: 60.5; y: 54.4; skew-x: 210; skew-y: 22.9; scale-x: 0.896; scale-y: 0.806; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 61; y: 53.3; skew-x: 203.6; skew-y: 18.8; scale-x: 0.894; scale-y: 0.781; }
        frame 40 { x: 61.1; y: 52.2; skew-x: 197.3; skew-y: 14.8; scale-x: -10000; scale-y: 0.756; }
        frame 41 { x: 61.2; y: 51.2; skew-x: 190.9; skew-y: 10.9; scale-x: 0.895; scale-y: 0.732; }
        frame 42 { x: 42.4; y: 46.6; skew-x: 15; skew-y: 16.7; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: 41.9; y: 47.4; skew-x: 9.8; skew-y: 11; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 41.6; y: 48.3; skew-x: 4.8; skew-y: 5.5; }
        frame 45 { x: 41.4; y: 49; skew-x: 0; skew-y: 0; }
        frame 46 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 47 { x: 41.6; y: 48.5; skew-x: 3.8; skew-y: 3.8; scale-x: 0.799; scale-y: 0.732; }
        frame 48 { x: 41.8; y: 48.2; skew-x: 7.8; skew-y: 7.8; scale-x: -10000; scale-y: 0.664; }
        frame 49 { x: -10000; y: 47.8; skew-x: 9.6; skew-y: 9.6; scale-y: 0.698; }
        frame 50 { x: 42; y: 47.4; skew-x: 11.5; skew-y: 11.5; scale-y: 0.731; }
        frame 51 { x: 42.2; y: 47; skew-x: 13.5; skew-y: 13.5; scale-y: 0.765; }
        frame 52 { x: 42.5; y: 46.6; skew-x: 15.5; skew-y: 15.5; scale-y: 0.799; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 57 { x: 42.2; y: 47.2; skew-x: 11.5; skew-y: 11.5; }
        frame 58 { x: 41.9; y: 47.7; skew-x: 7.8; skew-y: 7.8; }
        frame 59 { x: 41.6; y: 48.4; skew-x: 3.8; skew-y: 3.8; scale-x: 0.8; scale-y: 0.8; }
        frame 60 { x: 41.4; y: 49; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 68 { x: 42; y: 48.8; skew-x: 1; skew-y: 1; }
        frame 69 { x: 42.9; y: 48.6; skew-x: 2.3; skew-y: 2.3; }
        frame 70 { x: 43.5; y: 48.4; skew-x: 3.5; skew-y: 3.5; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 40; y: 49; skew-x: 0; skew-y: 0; }
        frame 74 { x: 36.6; y: 49.5; skew-x: -3.2; skew-y: -3.2; scale-x: 0.799; scale-y: 0.799; }
        frame 75 { x: 33.1; y: 50.1; skew-x: -6.9; skew-y: -6.9; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 83 { x: 34.5; y: 49.9; skew-x: -5.7; skew-y: -5.7; }
        frame 84 { x: 35.8; y: 49.8; skew-x: -4.4; skew-y: -4.4; }
        frame 85 { x: 37.2; y: 49.5; skew-x: -3.4; skew-y: -3.4; }
        frame 86 { x: 38.6; y: 49.3; skew-x: -2.2; skew-y: -2.2; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: 40; y: 49.1; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 41.4; y: 49; skew-x: 0; skew-y: 0; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 90 { x: 41.8; y: 48.9; skew-x: 0.5; skew-y: 0.5; }
        frame 91 { x: 42.2; y: 48.8; skew-x: 1.3; skew-y: 1.3; }
        frame 92 { x: 42.5; y: 48.6; skew-x: 1.8; skew-y: 1.8; }
        frame 93 { x: 43; y: 48.5; skew-x: 2.5; skew-y: 2.5; }
        frame 94 { x: 43.5; y: 48.4; skew-x: 3; skew-y: 3; }
        frame 95 { x: 43.9; y: -10000; skew-x: 3.8; skew-y: 3.8; }
        frame 96 { x: 42.9; y: 48.5; skew-x: 2.5; skew-y: 2.5; }
        frame 97 { x: 41.9; y: 48.8; skew-x: 1.3; skew-y: 1.3; }
        frame 98 { x: 41; y: 48.9; skew-x: 0.2; skew-y: 0.2; }
        frame 99 { y: -10000; skew-x: 0; skew-y: 0; }
        frame 100 { x: 41.2; skew-x: -10000; skew-y: -10000; }
        frame 101 { x: 41.3; y: 49; }
        frame 102 { x: 41.4; y: -10000; }
        frame 103 { x: -10000; }
        frame 105 { x: 41.8; y: 48.9; skew-x: 0.5; skew-y: 0.5; }
        frame 106 { x: 42.2; y: 48.8; skew-x: 1.3; skew-y: 1.3; }
        frame 107 { x: 42.5; y: 48.6; skew-x: 1.8; skew-y: 1.8; }
        frame 108 { x: 43; y: 48.5; skew-x: 2.5; skew-y: 2.5; }
        frame 109 { x: 43.5; y: 48.4; skew-x: 3; skew-y: 3; }
        frame 110 { x: 43.9; y: -10000; skew-x: 3.8; skew-y: 3.8; }
        frame 111 { x: 42.9; y: 48.5; skew-x: 2.5; skew-y: 2.5; }
        frame 112 { x: 41.9; y: 48.8; skew-x: 1.3; skew-y: 1.3; }
        frame 113 { x: 41; y: 48.9; skew-x: 0.2; skew-y: 0.2; }
        frame 114 { y: -10000; skew-x: 0; skew-y: 0; }
        frame 115 { x: 41.2; skew-x: -10000; skew-y: -10000; }
        frame 116 { x: 41.3; y: 49; }
        frame 117 { x: 41.4; y: -10000; }
        frame 118 { x: -10000; }
        frame 121 { x: 42.8; y: 48.6; skew-x: 2.3; skew-y: 2.3; }
        frame 122 { x: 43.9; y: 48.3; skew-x: 4.3; skew-y: 4.3; }
        frame 123 { x: 45; y: 48; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 124 { x: 46; y: 47.8; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: 46.7; y: 47.6; skew-x: 8.5; skew-y: 8.5; }
        frame 126 { x: 47.3; y: 47.5; skew-x: 9.5; skew-y: 9.5; }
        frame 127 { x: 47.7; y: 47.4; skew-x: 10.3; skew-y: 10.3; }
        frame 128 { x: 48; y: 47.3; skew-x: 10.6; skew-y: 10.6; }
        frame 129 { x: -10000; y: -10000; skew-x: 10.8; skew-y: 10.8; }
        frame 130 { x: 46; y: 47.7; skew-x: 7.8; skew-y: 7.8; }
        frame 131 { x: 44.1; y: 48.1; skew-x: 5.1; skew-y: 5.1; }
        frame 132 { x: 42.6; y: 48.5; skew-x: 2.8; skew-y: 2.8; }
        frame 133 { x: 41.3; y: 48.9; skew-x: 0.8; skew-y: 0.8; }
        frame 134 { x: 40.1; y: 49; skew-x: -0.7; skew-y: -0.7; }
        frame 135 { x: 39.1; y: 49.3; skew-x: -2; skew-y: -2; }
        frame 136 { x: 38.5; y: 49.4; skew-x: -3.2; skew-y: -3.2; }
        frame 137 { x: 38; y: 49.6; skew-x: -3.9; skew-y: -3.9; }
        frame 138 { x: 37.7; y: 49.7; skew-x: -4.4; skew-y: -4.4; }
        frame 139 { x: 37.6; y: 49.8; skew-x: -4.6; skew-y: -4.6; }
        frame 140 { x: 38.2; y: -10000; skew-x: -4.2; skew-y: -4.2; }
        frame 141 { x: 39.9; y: 49.5; skew-x: -3.2; skew-y: -3.2; }
        frame 142 { x: 42.7; y: 49.1; skew-x: -1.5; skew-y: -1.5; }
        frame 143 { x: 46.7; y: 48.6; skew-x: 0.5; skew-y: 0.5; }
        frame 144 { x: 51.9; y: 48; skew-x: 3.5; skew-y: 3.5; }
        frame 145 { x: 58.2; y: 47.2; skew-x: 7.3; skew-y: 7.3; scale-x: 0.798; scale-y: 0.798; }
        frame 146 { x: 65.7; y: 46.3; skew-x: 11.5; skew-y: 11.5; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 74.6; y: 45.4; skew-x: 16.5; skew-y: 16.5; }
        frame 148 { x: 84.6; y: 44.3; skew-x: 22.3; skew-y: 22.3; scale-x: 0.797; scale-y: 0.797; }
        frame 149 { x: 95.8; y: 43.1; skew-x: 28.6; skew-y: 28.6; scale-x: 0.798; scale-y: 0.798; }
        frame 150 { x: 117.1; y: 51.5; skew-x: 44.1; skew-y: 44.1; scale-x: 0.796; scale-y: 0.796; }
        frame 151 { x: 138.6; y: 60.5; skew-x: 59.6; skew-y: 59.6; scale-x: 0.797; scale-y: 0.797; }
        frame 152 { x: 153; y: 73.4; skew-x: 75.2; skew-y: 75.2; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 167.2; y: 87; skew-x: 90.5; skew-y: 90.5; scale-x: 0.799; scale-y: 0.799; }
        frame 154 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_lowerbody";
        frame-count: 164;
        frame 0 { x: 40.8; y: 34.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_LOWERBODY; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 41.5; y: 32.9; skew-x: 2.3; skew-y: 2.3; }
        frame 4 { x: 42.4; y: 31.8; skew-x: 4.8; skew-y: 4.8; }
        frame 5 { x: 43.3; y: 30.5; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 6 { x: 44.2; y: 29.4; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 45.1; y: 28.2; skew-x: 12.3; skew-y: 12.3; }
        frame 8 { x: 46.1; y: 27.1; skew-x: 14.8; skew-y: 14.8; }
        frame 9 { x: 47.1; y: 27; skew-x: 17.3; skew-y: 17.3; }
        frame 10 { x: 48.1; y: 26.8; skew-x: 19.8; skew-y: 19.8; }
        frame 11 { x: 49.2; y: 26.6; skew-x: 22.3; skew-y: 22.3; }
        frame 12 { x: 50.1; y: 26.5; skew-x: 24.8; skew-y: 24.8; }
        frame 13 { x: 51.3; y: 26.4; skew-x: 27.3; skew-y: 27.3; }
        frame 14 { x: 52.4; y: 26.3; skew-x: 30; skew-y: 30; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 51; y: 26.4; skew-x: 26.8; skew-y: 26.8; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 49.8; y: 26.5; skew-x: 23.8; skew-y: 23.8; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 48.5; y: 26.7; skew-x: 20.8; skew-y: 20.8; }
        frame 20 { x: 47.3; y: 27; skew-x: 17.8; skew-y: 17.8; }
        frame 21 { x: 46.1; y: 27.2; skew-x: 14.8; skew-y: 14.8; }
        frame 22 { x: 45; y: 28.5; skew-x: 11.8; skew-y: 11.8; }
        frame 23 { x: 43.9; y: 29.9; skew-x: 8.8; skew-y: 8.8; }
        frame 24 { x: 42.8; y: 31.3; skew-x: 5.8; skew-y: 5.8; }
        frame 25 { x: 41.8; y: 32.7; skew-x: 2.8; skew-y: 2.8; scale-x: 0.8; scale-y: 0.8; }
        frame 26 { x: 40.8; y: 34.1; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 28 { x: 42; y: 33; skew-x: 1; skew-y: 1.3; scale-x: 0.799; scale-y: 0.801; }
        frame 29 { x: 43.1; y: 31.8; skew-x: 2.3; skew-y: 2.5; scale-x: 0.798; scale-y: 0.802; }
        frame 30 { x: 44.3; y: 30.6; skew-x: 3.3; skew-y: 3.8; scale-x: 0.796; scale-y: 0.803; }
        frame 31 { x: 45.5; y: 29.4; skew-x: 4.5; skew-y: 5; scale-x: 0.795; scale-y: 0.805; }
        frame 32 { x: 46.8; y: 28.3; skew-x: 5.6; skew-y: 6.3; scale-x: 0.794; scale-y: 0.806; }
        frame 33 { x: 48; y: 27.1; skew-x: 6.9; skew-y: 7.7; scale-x: 0.793; scale-y: 0.807; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 47; y: 28.1; skew-x: 5.8; skew-y: 6.5; scale-x: 0.794; scale-y: 0.806; }
        frame 40 { x: 45.9; y: 29.1; skew-x: 4.8; skew-y: 5.3; scale-x: 0.795; scale-y: 0.805; }
        frame 41 { x: 44.8; y: 30.2; skew-x: 3.8; skew-y: 4.3; scale-x: 0.796; scale-y: 0.804; }
        frame 42 { x: 43.9; y: 31.1; skew-x: 2.8; skew-y: 3.3; scale-x: 0.797; scale-y: 0.803; }
        frame 43 { x: 42.8; y: 32.1; skew-x: 1.8; skew-y: 2.1; scale-x: 0.798; scale-y: 0.802; }
        frame 44 { x: 41.8; y: 33.1; skew-x: 0.8; skew-y: 1; scale-x: 0.799; scale-y: 0.801; }
        frame 45 { x: 40.8; y: 34.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 46 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { y: 33; skew-x: 3.5; scale-x: 0.807; }
        frame 48 { x: 40.9; y: 31.9; skew-x: 7.3; scale-x: 0.813; }
        frame 49 { x: 41; y: 30.8; skew-x: 11; scale-x: 0.82; }
        frame 50 { x: 41.3; y: 29.7; skew-x: 14.8; scale-x: 0.828; }
        frame 51 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 57 { x: 41.1; y: 30.8; skew-x: 11; scale-x: 0.82; }
        frame 58 { x: 40.9; y: 31.9; skew-x: 7.3; scale-x: 0.813; }
        frame 59 { x: 40.8; y: 33; skew-x: 3.5; scale-x: 0.807; }
        frame 60 { x: -10000; y: 34.1; skew-x: 0; scale-x: 0.8; }
        frame 61 { y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 68 { x: 41.4; }
        frame 69 { x: 42.1; }
        frame 70 { x: 42.8; }
        frame 71 { x: -10000; }
        frame 73 { x: 39.4; }
        frame 74 { x: 36.1; }
        frame 75 { x: 32.8; }
        frame 76 { x: -10000; }
        frame 83 { x: 34.1; }
        frame 84 { x: 35.4; }
        frame 85 { x: 36.8; }
        frame 86 { x: 38.1; }
        frame 87 { x: 39.4; }
        frame 88 { x: 40.8; }
        frame 89 { x: -10000; }
        frame 90 { x: 41.1; }
        frame 91 { x: 41.5; }
        frame 92 { x: 41.9; }
        frame 93 { x: 42.3; }
        frame 94 { x: 42.6; }
        frame 95 { x: 43; }
        frame 96 { x: 42; y: 34.5; }
        frame 97 { x: 40.9; y: 35; }
        frame 98 { x: 39.9; y: 35.5; }
        frame 99 { x: 40.1; y: 35.1; }
        frame 100 { x: 40.3; y: 34.8; }
        frame 101 { x: 40.5; y: 34.5; }
        frame 102 { x: 40.8; y: 34.1; }
        frame 103 { x: -10000; y: -10000; }
        frame 105 { x: 41.1; }
        frame 106 { x: 41.5; }
        frame 107 { x: 41.9; }
        frame 108 { x: 42.3; }
        frame 109 { x: 42.6; }
        frame 110 { x: 43; }
        frame 111 { x: 42; y: 34.5; }
        frame 112 { x: 40.9; y: 35; }
        frame 113 { x: 39.9; y: 35.5; }
        frame 114 { x: 40.1; y: 35.1; }
        frame 115 { x: 40.3; y: 34.8; }
        frame 116 { x: 40.5; y: 34.5; }
        frame 117 { x: 40.8; y: 34.1; }
        frame 118 { x: -10000; y: -10000; }
        frame 121 { x: 42; }
        frame 122 { x: 43.1; }
        frame 123 { x: 44.1; }
        frame 124 { x: 44.9; }
        frame 125 { x: 45.5; }
        frame 126 { x: 46.1; }
        frame 127 { x: 46.5; }
        frame 128 { x: 46.7; }
        frame 129 { x: 46.8; }
        frame 130 { x: 45; }
        frame 131 { x: 43.4; }
        frame 132 { x: 41.9; }
        frame 133 { x: 40.6; }
        frame 134 { x: 39.6; }
        frame 135 { x: 38.8; }
        frame 136 { x: 38.1; }
        frame 137 { x: 37.6; }
        frame 138 { x: 37.4; }
        frame 139 { x: 37.3; }
        frame 140 { x: 37.9; y: 34; skew-x: 0.3; skew-y: 0.3; }
        frame 141 { x: 39.8; y: 33.6; skew-x: 1.3; skew-y: 1.3; }
        frame 142 { x: 43; y: 33; skew-x: 3; skew-y: 3; }
        frame 143 { x: 47.5; y: 32.2; skew-x: 5.3; skew-y: 5.3; }
        frame 144 { x: 53.4; y: 31.1; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 145 { x: 60.6; y: 29.9; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 69.1; y: 28.7; skew-x: 16.3; skew-y: 16.3; }
        frame 147 { x: 79.2; y: 27.3; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 148 { x: 90.6; y: 25.9; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 103.3; y: 24.6; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 150 { x: 128.6; y: 35.1; skew-x: 50.6; skew-y: 50.6; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: 153.7; y: 47.4; skew-x: 67.9; skew-y: 67.9; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: 169.3; y: 68.2; skew-x: 85.2; skew-y: 85.2; scale-x: 0.799; scale-y: 0.799; }
        frame 153 { x: 183.7; y: 90.3; skew-x: 102.2; skew-y: 102.2; scale-x: 0.8; scale-y: 0.8; }
        frame 154 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerfoot_lower";
        frame-count: 164;
        frame 0 { x: 47; y: 109.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_OUTERFOOT_LOWER; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 43.5; }
        frame 4 { x: 40.1; }
        frame 5 { x: 36.6; }
        frame 6 { x: 33.1; }
        frame 7 { x: 29.7; }
        frame 8 { x: 26.3; }
        frame 9 { x: 22.8; }
        frame 10 { x: 19.4; }
        frame 11 { x: 15.9; }
        frame 12 { x: 12.4; }
        frame 13 { x: 9; }
        frame 14 { x: 5.5; }
        frame 15 { x: -10000; }
        frame 17 { x: 8.3; y: 105.9; skew-y: -0.9; scale-y: 0.801; }
        frame 18 { x: 11.1; y: 102.5; skew-y: -1.9; scale-y: -10000; }
        frame 19 { x: 13.9; y: 99.1; skew-y: -2.9; scale-y: 0.802; }
        frame 20 { x: 16.8; y: 95.6; skew-y: -4; scale-y: 0.803; }
        frame 21 { x: 19.5; y: 92.2; skew-y: -5.2; scale-y: -10000; }
        frame 22 { x: 25.1; y: 95.6; skew-y: -4; }
        frame 23 { x: 30.5; y: 99.1; skew-y: -2.9; scale-y: 0.802; }
        frame 24 { x: 36; y: 102.5; skew-y: -1.9; scale-y: 0.801; }
        frame 25 { x: 41.5; y: 105.8; skew-y: -0.9; scale-y: -10000; }
        frame 26 { x: 47; y: 109.3; skew-y: 0; scale-y: 0.8; }
        frame 27 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 28 { x: 47.4; }
        frame 29 { x: 47.9; }
        frame 30 { x: 48.3; }
        frame 31 { x: 48.6; }
        frame 32 { x: 49.1; }
        frame 33 { x: 49.5; }
        frame 34 { x: -10000; }
        frame 39 { x: 49.1; }
        frame 40 { x: 48.8; }
        frame 41 { x: 48.5; }
        frame 42 { x: 48; }
        frame 43 { x: 47.7; }
        frame 44 { x: 47.4; }
        frame 45 { x: 47; }
        frame 46 { x: -10000; }
        frame 47 { x: 49.5; }
        frame 48 { x: 52; }
        frame 49 { x: 54.5; }
        frame 50 { x: 57; }
        frame 51 { x: -10000; }
        frame 57 { x: 53.4; y: 107.3; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 50.1; y: 105.5; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: 46.9; y: 103.7; skew-x: -17.7; skew-y: -17.7; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: 46.7; y: 105.5; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 61 { x: 46.8; y: 107.4; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 62 { x: 47; y: 109.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 63 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 47.1; y: 109.2; skew-x: 0.3; skew-y: 0.3; }
        frame 141 { x: 47.6; y: 108.7; skew-x: 1.3; skew-y: 1.3; }
        frame 142 { x: 48.5; y: 107.7; skew-x: 3; skew-y: 3; }
        frame 143 { x: 49.5; y: 106.5; skew-x: 5.3; skew-y: 5.3; }
        frame 144 { x: 51; y: 105; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 145 { x: 52.9; y: 103.1; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 55.1; y: 101; skew-x: 16.3; skew-y: 16.3; }
        frame 147 { x: 57.9; y: 98.7; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 148 { x: 61.3; y: 96.2; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 65; y: 93.7; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 150 { x: 75.9; y: 88.3; skew-x: 50.6; skew-y: 50.6; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: 87.2; y: 84.8; skew-x: 67.9; skew-y: 67.9; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: 98.3; y: 83.6; skew-x: 85.2; skew-y: 85.2; scale-x: 0.799; scale-y: 0.799; }
        frame 153 { x: 108.1; y: 84; skew-x: 102.2; skew-y: 102.2; scale-x: 0.8; scale-y: 0.8; }
        frame 154 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_fish";
        frame-count: 164;
        frame 0 { x: 55.9; y: 121.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_FISH; }
        frame 1 { x: 56.8; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 57.5; }
        frame 3 { x: 58.4; }
        frame 4 { x: 53.4; }
        frame 5 { x: 49.9; }
        frame 6 { x: 46.3; }
        frame 7 { x: 42.8; }
        frame 8 { x: 39.3; }
        frame 9 { x: 35.7; }
        frame 10 { x: 32.1; }
        frame 11 { x: 28.6; }
        frame 12 { x: 25.1; }
        frame 13 { x: 21.6; }
        frame 14 { x: 18; }
        frame 15 { x: 14.5; }
        frame 16 { x: 10.9; }
        frame 17 { x: 11.9; y: 118; }
        frame 18 { x: 16.4; y: 114.5; skew-y: -1.2; scale-y: 0.801; }
        frame 19 { x: 20.9; y: 111; skew-y: -2.4; scale-y: 0.802; }
        frame 20 { x: 25.3; y: 107.5; skew-y: -3.7; scale-y: -10000; }
        frame 21 { x: 29.8; y: 104; skew-y: -5.2; scale-y: 0.803; }
        frame 22 { x: 35; y: 107.5; skew-y: -4; scale-y: -10000; }
        frame 23 { x: 40.2; y: 110.8; skew-y: -2.9; scale-y: 0.802; }
        frame 24 { x: 45.5; y: 114.3; skew-y: -1.9; scale-y: 0.801; }
        frame 25 { x: 50.7; y: 117.7; skew-y: -0.9; scale-y: -10000; }
        frame 26 { x: 55.9; y: 121.2; skew-y: 0; scale-y: 0.8; }
        frame 27 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 28 { x: 56.3; }
        frame 29 { x: 56.8; }
        frame 30 { x: 57.1; }
        frame 31 { x: 57.5; }
        frame 32 { x: 58; }
        frame 33 { x: 58.4; }
        frame 34 { x: -10000; }
        frame 39 { x: 58; }
        frame 40 { x: 57.7; }
        frame 41 { x: 57.4; }
        frame 42 { x: 57; }
        frame 43 { x: 56.6; }
        frame 44 { x: 56.3; }
        frame 45 { x: 55.9; }
        frame 46 { x: -10000; }
        frame 49 { x: 60.8; }
        frame 50 { x: 65.6; }
        frame 51 { x: 70.4; }
        frame 52 { x: 69.5; }
        frame 53 { x: 68.6; }
        frame 54 { x: 67.7; }
        frame 55 { x: 66.8; }
        frame 56 { x: 65.9; }
        frame 57 { x: 64.5; y: 118.2; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 63; y: 115.1; skew-x: -11.7; skew-y: -11.7; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 61.6; y: 112.1; skew-x: -17.7; skew-y: -17.7; }
        frame 60 { x: 57.7; y: 115.2; skew-x: -11.7; skew-y: -11.7; }
        frame 61 { x: 53.6; y: 118.2; skew-x: -5.7; skew-y: -5.7; }
        frame 62 { x: 49.9; y: 121.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 63 { x: 51.4; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 52.9; }
        frame 65 { x: 54.4; }
        frame 66 { x: 55.9; }
        frame 67 { x: -10000; }
        frame 140 { x: 56; y: 121.1; skew-x: 0.3; skew-y: 0.3; }
        frame 141 { x: 56.4; y: 120.7; skew-x: 1.3; skew-y: 1.3; }
        frame 142 { x: 56.9; y: 120; skew-x: 3; skew-y: 3; }
        frame 143 { x: 57.6; y: 119.1; skew-x: 5.3; skew-y: 5.3; }
        frame 144 { x: 58.6; y: 117.9; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 145 { x: 59.9; y: 116.4; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 61.5; y: 114.8; skew-x: 16.3; skew-y: 16.3; }
        frame 147 { x: 63.2; y: 112.9; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 148 { x: 65.3; y: 110.8; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 67.7; y: 108.6; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 150 { x: 74.4; y: 103; skew-x: 50.6; skew-y: 50.6; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: 81.3; y: 98.1; skew-x: 67.9; skew-y: 67.9; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: 88.1; y: 91.3; skew-x: 85.2; skew-y: 85.2; scale-x: 0.799; scale-y: 0.799; }
        frame 153 { x: 94.6; y: 85.2; skew-x: 102.2; skew-y: 102.2; scale-x: 0.8; scale-y: 0.8; }
        frame 154 { x: -10000; y: 86.7; skew-x: 102.1; skew-y: 102.1; scale-x: 0.799; scale-y: 0.799; }
        frame 155 { y: 88.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 156 { y: 89.9; skew-x: 102.2; skew-y: 102.2; scale-x: 0.8; scale-y: 0.8; }
        frame 157 { y: 88.8; skew-x: 102.1; skew-y: 102.1; scale-x: 0.799; scale-y: 0.799; }
        frame 158 { y: 88; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 159 { y: 87.3; }
        frame 160 { y: 86.8; }
        frame 161 { y: 86.4; }
        frame 162 { y: 86.2; }
        frame 163 { y: -10000; skew-x: 102.2; skew-y: 102.2; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_disco_outerfoot_lower_overlay";
        frame-count: 164;
        frame 0 { x: 45.9; y: 110; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_OUTERFOOT_LOWER_OVERLAY; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 42.5; }
        frame 4 { x: 39; }
        frame 5 { x: 35.6; }
        frame 6 { x: 32.3; }
        frame 7 { x: 28.8; }
        frame 8 { x: 25.4; }
        frame 9 { x: 22; }
        frame 10 { x: 18.6; }
        frame 11 { x: 15.2; }
        frame 12 { x: 11.8; }
        frame 13 { x: 8.3; }
        frame 14 { x: 5; }
        frame 15 { x: -10000; }
        frame 17 { x: 7.7; y: 106.5; skew-y: -0.9; scale-y: 0.801; }
        frame 18 { x: 10.5; y: 103.1; skew-y: -1.9; scale-y: -10000; }
        frame 19 { x: 13.2; y: 99.7; skew-y: -2.9; scale-y: 0.802; }
        frame 20 { x: 16; y: 96.2; skew-y: -4; scale-y: 0.803; }
        frame 21 { x: 18.7; y: 92.8; skew-y: -5.2; scale-y: -10000; }
        frame 22 { x: 24.1; y: 96.2; skew-y: -4; }
        frame 23 { x: 29.6; y: 99.7; skew-y: -2.9; scale-y: 0.802; }
        frame 24 { x: 35; y: 103.1; skew-y: -1.9; scale-y: 0.801; }
        frame 25 { x: 40.5; y: 106.5; skew-y: -0.9; scale-y: -10000; }
        frame 26 { x: 45.9; y: 110; skew-y: 0; scale-y: 0.8; }
        frame 27 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 28 { x: 46.3; }
        frame 29 { x: 46.8; }
        frame 30 { x: 47.1; }
        frame 31 { x: 47.5; }
        frame 32 { x: 48; }
        frame 33 { x: 48.4; }
        frame 34 { x: -10000; }
        frame 39 { x: 48; }
        frame 40 { x: 47.7; }
        frame 41 { x: 47.4; }
        frame 42 { x: 47; }
        frame 43 { x: 46.6; }
        frame 44 { x: 46.3; }
        frame 45 { x: 45.9; }
        frame 46 { x: -10000; }
        frame 47 { x: 48.4; }
        frame 48 { x: 50.9; }
        frame 49 { x: 53.4; }
        frame 50 { x: 55.9; }
        frame 51 { x: -10000; }
        frame 57 { x: 52.5; y: 108; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 49.2; y: 106.2; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: 46; y: 104.6; skew-x: -17.7; skew-y: -17.7; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: 45.8; y: 106.2; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 61 { x: 45.6; y: 108.1; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 62 { x: 45.9; y: 110; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 63 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 46.1; y: 109.8; skew-x: 0.3; skew-y: 0.3; }
        frame 141 { x: 46.5; y: 109.2; skew-x: 1.3; skew-y: 1.3; }
        frame 142 { x: 47.3; y: 108.3; skew-x: 3; skew-y: 3; }
        frame 143 { x: 48.4; y: 107.1; skew-x: 5.3; skew-y: 5.3; }
        frame 144 { x: 49.9; y: 105.3; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 145 { x: 51.9; y: 103.4; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 54; y: 101.2; skew-x: 16.3; skew-y: 16.3; }
        frame 147 { x: 56.9; y: 98.7; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 148 { x: 60.2; y: 96.1; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 64; y: 93.5; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 150 { x: 75.1; y: 87.8; skew-x: 50.6; skew-y: 50.6; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: 86.6; y: 84.1; skew-x: 67.9; skew-y: 67.9; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: 97.7; y: 82.6; skew-x: 85.2; skew-y: 85.2; scale-x: 0.799; scale-y: 0.799; }
        frame 153 { x: 107.8; y: 82.8; skew-x: 102.2; skew-y: 102.2; scale-x: 0.8; scale-y: 0.8; }
        frame 154 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerfoot_upper";
        frame-count: 164;
        frame 0 { x: 44.8; y: 96.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_OUTERFOOT_UPPER; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 41.9; skew-y: 1.3; scale-y: 0.803; }
        frame 4 { x: 39; skew-y: 2.8; scale-y: 0.807; }
        frame 5 { x: 36.1; skew-y: 4.3; scale-y: 0.81; }
        frame 6 { x: 33.2; skew-y: 5.8; scale-y: 0.813; }
        frame 7 { x: 30.4; skew-y: 7.3; scale-y: 0.816; }
        frame 8 { x: 27.5; skew-y: 8.8; scale-y: 0.82; }
        frame 9 { x: 24.7; skew-y: 10.3; scale-y: 0.823; }
        frame 10 { x: 21.8; skew-y: 11.8; scale-y: 0.826; }
        frame 11 { x: 18.9; skew-y: 13.3; scale-y: 0.829; }
        frame 12 { x: 16; skew-y: 14.8; scale-y: 0.833; }
        frame 13 { x: 13.1; skew-y: 16.3; scale-y: 0.836; }
        frame 14 { x: 10.3; skew-y: 17.7; scale-y: 0.84; }
        frame 15 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 17 { x: 12.1; y: 92.7; skew-y: 14.8; scale-y: 0.834; }
        frame 18 { x: 14; y: 89.3; skew-y: 12; scale-y: 0.828; }
        frame 19 { x: 15.8; y: 85.8; skew-y: 9.1; scale-y: 0.822; }
        frame 20 { x: 17.7; y: 82.4; skew-y: 6.3; scale-y: 0.817; }
        frame 21 { x: 19.5; y: 79; skew-y: 3.5; scale-y: 0.811; }
        frame 22 { x: 24.6; y: 82.4; skew-y: 2.8; scale-y: 0.809; }
        frame 23 { x: 29.6; y: 85.8; skew-y: 2; scale-y: 0.807; }
        frame 24 { x: 34.7; y: 89.3; skew-y: 1.3; scale-y: 0.805; }
        frame 25 { x: 39.7; y: 92.7; skew-y: 0.6; scale-y: 0.802; }
        frame 26 { x: 44.8; y: 96.2; skew-y: 0; scale-y: 0.8; }
        frame 27 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 28 { x: 45.2; }
        frame 29 { x: 45.6; }
        frame 30 { x: 46; }
        frame 31 { x: 46.5; }
        frame 32 { x: 46.9; }
        frame 33 { x: 47.3; }
        frame 34 { x: -10000; }
        frame 39 { x: 47; }
        frame 40 { x: 46.6; }
        frame 41 { x: 46.3; }
        frame 42 { x: 45.9; }
        frame 43 { x: 45.5; }
        frame 44 { x: 45.1; }
        frame 45 { x: 44.8; }
        frame 46 { x: -10000; }
        frame 47 { x: 47.3; }
        frame 48 { x: 49.8; }
        frame 49 { x: 52.3; }
        frame 50 { x: 54.8; }
        frame 51 { x: -10000; }
        frame 57 { x: 49.8; y: 94.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 45.1; y: 93.2; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: 40.8; y: 91.8; skew-x: -17.7; skew-y: -17.7; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: 41.7; y: 93.2; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 61 { x: 43.1; y: 94.7; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 62 { x: 44.8; y: 96.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 63 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 45; y: 96.1; skew-x: 0.3; skew-y: 0.3; }
        frame 141 { x: 45.7; y: 95.6; skew-x: 1.3; skew-y: 1.3; }
        frame 142 { x: 46.9; y: 94.7; skew-x: 3; skew-y: 3; }
        frame 143 { x: 48.5; y: 93.5; skew-x: 5.3; skew-y: 5.3; }
        frame 144 { x: 50.8; y: 92.1; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 145 { x: 53.5; y: 90.2; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 57; y: 88.1; skew-x: 16.3; skew-y: 16.3; }
        frame 147 { x: 61.3; y: 85.8; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 148 { x: 66.2; y: 83.3; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 72.1; y: 80.7; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 150 { x: 84.8; y: 78.5; skew-x: 50.6; skew-y: 50.6; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: 99.1; y: 78.4; skew-x: 67.9; skew-y: 67.9; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: 110.3; y: 80.1; skew-x: 85.2; skew-y: 85.2; scale-x: 0.799; scale-y: 0.799; }
        frame 153 { x: 121.4; y: 84.7; skew-x: 102.2; skew-y: 102.2; scale-x: 0.8; scale-y: 0.8; }
        frame 154 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerleg_lower";
        frame-count: 164;
        frame 0 { x: 57.8; y: 80.4; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_OUTERLEG_LOWER; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 56.5; y: 79.6; skew-y: 2.3; scale-x: 0.792; scale-y: 0.823; }
        frame 4 { x: 55.3; y: 78.8; skew-y: 4.8; scale-x: 0.783; scale-y: 0.846; }
        frame 5 { x: 54; y: 77.8; skew-y: 7.3; scale-x: 0.775; scale-y: 0.869; }
        frame 6 { x: 52.8; y: 76.9; skew-x: -0; skew-y: 9.8; scale-x: 0.767; scale-y: 0.893; }
        frame 7 { x: 51.5; y: 76.2; skew-x: -0.2; skew-y: 12.3; scale-x: 0.759; scale-y: 0.916; }
        frame 8 { x: 50.3; y: 75.3; skew-x: -10000; skew-y: 14.8; scale-x: 0.75; scale-y: 0.939; }
        frame 9 { x: 49; y: 74.4; skew-y: 17.3; scale-x: 0.742; scale-y: 0.962; }
        frame 10 { x: 47.7; y: 73.6; skew-y: 19.8; scale-x: 0.734; scale-y: 0.985; }
        frame 11 { x: 46.5; y: 72.8; skew-y: 22.3; scale-x: 0.726; scale-y: 1.008; }
        frame 12 { x: 45.3; y: 72; skew-x: -0.4; skew-y: 24.8; scale-x: 0.717; scale-y: 1.031; }
        frame 13 { x: 44.1; y: 71.2; skew-x: -10000; skew-y: 27.3; scale-x: 0.709; scale-y: 1.055; }
        frame 14 { x: 42.8; y: 70.6; skew-x: -0.5; skew-y: 29.9; scale-x: 0.701; scale-y: 1.079; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 41; y: 68.1; skew-x: -1; skew-y: 23.8; scale-x: 0.706; scale-y: 1.05; }
        frame 18 { x: 39.2; y: 65.5; skew-x: -1.7; skew-y: 17.8; scale-x: 0.711; scale-y: 1.022; }
        frame 19 { x: 37.4; y: 63.1; skew-x: -2.2; skew-y: 11.8; scale-x: 0.716; scale-y: 0.994; }
        frame 20 { x: 35.6; y: 60.6; skew-x: -2.9; skew-y: 5.8; scale-x: 0.721; scale-y: 0.967; }
        frame 21 { x: 34; y: 58.4; skew-x: -3.5; skew-y: -0.1; scale-x: 0.726; scale-y: 0.939; }
        frame 22 { x: 36.9; y: 64.3; skew-x: -2.7; skew-y: -2.7; scale-x: 0.741; scale-y: 0.876; }
        frame 23 { x: 39.7; y: 70.3; skew-x: -1.9; skew-y: -5.3; scale-x: 0.755; scale-y: 0.814; }
        frame 24 { x: 45.8; y: 73.8; skew-x: -1.2; skew-y: -3.4; scale-x: 0.77; scale-y: 0.809; }
        frame 25 { x: 51.8; y: 77.3; skew-x: -0.4; skew-y: -1.7; scale-x: 0.785; scale-y: 0.804; }
        frame 26 { x: 57.8; y: 80.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 58.7; y: 79.8; skew-y: 1.3; scale-y: 0.817; }
        frame 29 { x: 59.6; y: 79; skew-y: 2.8; scale-y: 0.835; }
        frame 30 { x: 60.5; y: 78.3; skew-y: 4.1; scale-y: 0.853; }
        frame 31 { x: 61.5; y: 77.5; skew-y: 5.5; scale-y: 0.87; }
        frame 32 { x: 62.4; y: 76.8; skew-y: 7; scale-y: 0.888; }
        frame 33 { x: 63.3; y: 76.1; skew-y: 8.5; scale-y: 0.905; }
        frame 34 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 39 { x: 62.5; y: 76.7; skew-y: 7.3; scale-y: 0.89; }
        frame 40 { x: 61.7; y: 77.3; skew-y: 6; scale-y: 0.875; }
        frame 41 { x: 60.9; y: 77.9; skew-y: 4.8; scale-y: 0.86; }
        frame 42 { x: 60; y: 78.5; skew-y: 3.5; scale-y: 0.845; }
        frame 43 { x: 59.3; y: 79.1; skew-y: 2.3; scale-y: 0.83; }
        frame 44 { x: 58.5; y: 79.8; skew-y: 1.1; scale-y: 0.815; }
        frame 45 { x: 57.8; y: 80.4; skew-y: 0; scale-y: 0.8; }
        frame 46 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 47 { x: 59.1; y: 80.3; skew-y: -1.4; scale-y: 0.801; }
        frame 48 { x: 60.5; y: 80.2; skew-y: -3.2; scale-y: 0.802; }
        frame 49 { x: 61.8; y: 80.1; skew-y: -4.7; scale-y: 0.804; }
        frame 50 { x: 63; y: 79.9; skew-y: -6.5; scale-y: 0.805; }
        frame 51 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 57 { x: 57.8; y: 78.3; skew-x: -7.4; skew-y: -10.9; scale-x: 0.782; scale-y: 0.803; }
        frame 58 { x: 52.6; y: 76.6; skew-x: -14.9; skew-y: -15.7; scale-x: 0.765; scale-y: 0.8; }
        frame 59 { x: 47.6; y: 74.8; skew-x: -22.5; skew-y: -20.3; scale-x: 0.748; scale-y: 0.799; }
        frame 60 { x: 51; y: 76.7; skew-x: -14.9; skew-y: -13.4; scale-x: 0.765; scale-y: 0.798; }
        frame 61 { x: 54.3; y: 78.6; skew-x: -7.4; skew-y: -6.7; scale-x: 0.782; scale-y: 0.799; }
        frame 62 { x: 57.8; y: 80.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 63 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 58.2; y: 80.3; skew-x: 0.3; skew-y: 0.3; }
        frame 141 { x: 59.2; y: -10000; skew-x: 1.3; skew-y: 1.3; }
        frame 142 { x: 61; y: 79.9; skew-x: 3; skew-y: 3; }
        frame 143 { x: 63.5; y: 79.7; skew-x: 5.3; skew-y: 5.3; }
        frame 144 { x: 66.8; y: 79.2; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 145 { x: 70.8; y: 78.7; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 146 { x: 75.6; y: 78.1; skew-x: 16.3; skew-y: 16.3; }
        frame 147 { x: 81.2; y: 77.5; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 148 { x: 87.7; y: 76.9; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 94.8; y: 76.2; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 150 { x: 106.5; y: 80.5; skew-x: 50.6; skew-y: 50.6; scale-x: 0.797; scale-y: 0.797; }
        frame 151 { x: 118.6; y: 85.6; skew-x: 67.9; skew-y: 67.9; scale-x: 0.798; scale-y: 0.798; }
        frame 152 { x: 126.4; y: 92.8; skew-x: 85.2; skew-y: 85.2; scale-x: 0.799; scale-y: 0.799; }
        frame 153 { x: 134.1; y: 100.7; skew-x: 102.2; skew-y: 102.2; scale-x: 0.8; scale-y: 0.8; }
        frame 154 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerleg_upper";
        frame-count: 164;
        frame 0 { x: 58.1; y: 50.6; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_OUTERLEG_UPPER; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 58.3; y: 49.7; skew-x: 3; skew-y: 2.8; scale-y: 0.806; }
        frame 4 { x: 58.6; y: 48.8; skew-x: 6.3; skew-y: 5.8; scale-x: 0.799; scale-y: 0.812; }
        frame 5 { x: 58.9; y: 47.9; skew-x: 9.3; skew-y: 8.5; scale-x: -10000; scale-y: 0.818; }
        frame 6 { x: 59.2; y: 46.8; skew-x: 12.5; skew-y: 11.5; scale-x: 0.798; scale-y: 0.823; }
        frame 7 { x: 59.5; y: 45.9; skew-x: 15.6; skew-y: 14.3; scale-x: -10000; scale-y: 0.829; }
        frame 8 { x: 59.9; y: 45; skew-x: 18.8; skew-y: 17.3; scale-x: 0.799; scale-y: 0.836; }
        frame 9 { x: 60.3; y: 45.1; skew-x: 21.8; skew-y: 20.6; scale-x: 0.798; scale-y: 0.829; }
        frame 10 { x: 60.6; y: -10000; skew-x: 25; skew-y: 24.1; scale-x: -10000; scale-y: 0.822; }
        frame 11 { x: 61; y: 45.3; skew-x: 28.1; skew-y: 27.3; scale-y: 0.816; }
        frame 12 { x: 61.5; y: 45.5; skew-x: 31.3; skew-y: 30.8; scale-y: 0.81; }
        frame 13 { x: 61.9; y: -10000; skew-x: 34.4; skew-y: 34.1; scale-x: 0.797; scale-y: 0.804; }
        frame 14 { x: 62.5; y: 45.6; skew-x: 37.6; skew-y: 37.6; scale-x: 0.799; scale-y: 0.799; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 62.7; y: 45.7; skew-x: 38.6; skew-y: 42.9; scale-x: 0.809; scale-y: 0.783; }
        frame 18 { x: 63; y: 45.8; skew-x: 39.6; skew-y: 48.1; scale-x: 0.82; scale-y: 0.768; }
        frame 19 { x: 63.1; y: 45.9; skew-x: 40.6; skew-y: 53.4; scale-x: 0.832; scale-y: 0.753; }
        frame 20 { x: 63.3; y: 46; skew-x: 41.6; skew-y: 58.6; scale-x: 0.843; scale-y: 0.738; }
        frame 21 { x: 63.4; y: -10000; skew-x: 42.7; skew-y: 63.8; scale-x: 0.856; scale-y: 0.724; }
        frame 22 { x: 62.1; y: 46.5; skew-x: 34.1; skew-y: 51.1; scale-x: 0.844; scale-y: 0.738; }
        frame 23 { x: 60.9; y: 47.4; skew-x: 25.6; skew-y: 38.3; scale-x: 0.833; scale-y: 0.754; }
        frame 24 { x: 59.9; y: 48.2; skew-x: 17; skew-y: 25.5; scale-x: 0.822; scale-y: 0.769; }
        frame 25 { x: 58.8; y: 49.4; skew-x: 8.5; skew-y: 12.8; scale-x: 0.811; scale-y: 0.784; }
        frame 26 { x: 58.1; y: 50.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 59; y: 49.8; }
        frame 29 { x: 59.8; y: 49; }
        frame 30 { x: 60.6; y: 48.1; }
        frame 31 { x: 61.5; y: 47.3; }
        frame 32 { x: 62.3; y: 46.5; }
        frame 33 { x: 63.1; y: 45.6; }
        frame 34 { x: -10000; y: -10000; }
        frame 39 { x: 62.4; y: 46.4; }
        frame 40 { x: 61.6; y: 47.1; }
        frame 41 { x: 61; y: 47.8; }
        frame 42 { x: 60.3; y: 48.5; }
        frame 43 { x: 59.5; y: 49.2; }
        frame 44 { x: 58.8; y: 50; }
        frame 45 { x: 58.1; y: 50.6; }
        frame 46 { x: -10000; y: -10000; }
        frame 47 { x: 57.9; y: 51.1; skew-x: -2.9; skew-y: -2.9; }
        frame 48 { x: 57.8; y: 51.6; skew-x: -5.9; skew-y: -5.9; scale-x: 0.799; scale-y: 0.799; }
        frame 49 { x: 57.6; y: 52.3; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 57.5; y: 52.7; skew-x: -11.9; skew-y: -11.9; }
        frame 51 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 57 { x: 58; y: 51.9; skew-x: -5.9; skew-y: -1.2; scale-x: 0.809; scale-y: 0.749; }
        frame 58 { x: 58.5; y: 51.2; skew-x: -0.2; skew-y: 9.3; scale-x: 0.819; scale-y: 0.699; }
        frame 59 { x: 58.9; y: 50.6; skew-x: 5.6; skew-y: 20; scale-x: 0.829; scale-y: 0.65; }
        frame 60 { x: 58.7; y: 50.8; skew-x: 3.6; skew-y: 13.3; scale-x: 0.819; scale-y: 0.699; }
        frame 61 { x: 58.4; y: 50.7; skew-x: 1.8; skew-y: 6.5; scale-x: 0.81; scale-y: 0.75; }
        frame 62 { x: 58.1; y: 50.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 63 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 58.8; y: 50.5; skew-x: 0.8; skew-y: 0.8; }
        frame 69 { x: 59.5; y: 50.4; skew-x: 1.8; skew-y: 1.8; }
        frame 70 { x: 60.3; y: 50.1; skew-x: 2.8; skew-y: 2.8; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 56.5; y: 51.1; skew-x: -3; skew-y: -3; scale-x: 0.799; scale-y: 0.799; }
        frame 74 { x: 53; y: 52.1; skew-x: -9; skew-y: -9; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 49.4; y: 53.3; skew-x: -15.2; skew-y: -15.2; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 83 { x: 50.9; y: 52.8; skew-x: -12.5; skew-y: -12.5; }
        frame 84 { x: 52.3; y: 52.4; skew-x: -10; skew-y: -10; }
        frame 85 { x: 53.7; y: 52; skew-x: -7.4; skew-y: -7.4; }
        frame 86 { x: 55.1; y: 51.5; skew-x: -4.9; skew-y: -4.9; }
        frame 87 { x: 56.5; y: 51; skew-x: -2.4; skew-y: -2.4; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: 58.1; y: 50.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 90 { x: 58.5; y: 50.5; skew-x: 0.5; skew-y: 0.5; }
        frame 91 { x: 58.9; y: -10000; skew-x: 1; skew-y: 1; }
        frame 92 { x: 59.4; y: 50.4; skew-x: 1.5; skew-y: 1.5; }
        frame 93 { x: 59.8; y: -10000; skew-x: 2; skew-y: 2; }
        frame 94 { x: 60.3; y: 50.2; skew-x: 2.6; skew-y: 2.6; }
        frame 95 { x: 60.6; y: -10000; skew-x: 3.3; skew-y: 3.3; }
        frame 96 { x: 59.5; y: 50.5; skew-x: 2; skew-y: 2; }
        frame 97 { x: 58.5; y: 50.6; skew-x: 0.8; skew-y: 0.8; }
        frame 98 { x: 57.6; y: 50.8; skew-x: -0.4; skew-y: -0.4; }
        frame 99 { x: -10000; y: -10000; skew-x: -0.2; skew-y: -0.2; }
        frame 100 { x: 57.9; y: 50.7; skew-x: -0; skew-y: -0; }
        frame 101 { x: -10000; y: -10000; skew-x: 0; skew-y: 0; }
        frame 102 { x: 58.1; y: 50.6; skew-x: -10000; skew-y: -10000; }
        frame 103 { x: -10000; y: -10000; }
        frame 105 { x: 58.5; y: 50.5; skew-x: 0.5; skew-y: 0.5; }
        frame 106 { x: 58.9; y: -10000; skew-x: 1; skew-y: 1; }
        frame 107 { x: 59.4; y: 50.4; skew-x: 1.5; skew-y: 1.5; }
        frame 108 { x: 59.8; y: -10000; skew-x: 2; skew-y: 2; }
        frame 109 { x: 60.3; y: 50.2; skew-x: 2.6; skew-y: 2.6; }
        frame 110 { x: 60.6; y: -10000; skew-x: 3.3; skew-y: 3.3; }
        frame 111 { x: 59.5; y: 50.5; skew-x: 2; skew-y: 2; }
        frame 112 { x: 58.5; y: 50.6; skew-x: 0.8; skew-y: 0.8; }
        frame 113 { x: 57.6; y: 50.8; skew-x: -0.4; skew-y: -0.4; }
        frame 114 { x: -10000; y: -10000; skew-x: -0.2; skew-y: -0.2; }
        frame 115 { x: 57.9; y: 50.7; skew-x: -0; skew-y: -0; }
        frame 116 { x: -10000; y: -10000; skew-x: 0; skew-y: 0; }
        frame 117 { x: 58.1; y: 50.6; skew-x: -10000; skew-y: -10000; }
        frame 118 { x: -10000; y: -10000; }
        frame 121 { x: 59.5; y: 50.3; skew-x: 2; skew-y: 2; scale-y: 0.802; }
        frame 122 { x: 60.9; y: 49.9; skew-x: 4; skew-y: 4; scale-y: 0.805; }
        frame 123 { x: 61.9; y: 49.8; skew-x: 5.6; skew-y: 5.6; scale-x: 0.799; scale-y: 0.807; }
        frame 124 { x: 63; y: 49.5; skew-x: 7; skew-y: 7; scale-x: -10000; scale-y: 0.808; }
        frame 125 { x: 63.6; y: 49.3; skew-x: 8.1; skew-y: 8.1; scale-y: 0.809; }
        frame 126 { x: 64.2; y: 49.2; skew-x: 9; skew-y: 9; scale-y: 0.81; }
        frame 127 { x: 64.7; y: 49; skew-x: 9.6; skew-y: 9.6; scale-y: 0.811; }
        frame 128 { x: 64.9; skew-x: 10; skew-y: 10; scale-y: 0.812; }
        frame 129 { x: 65; y: 48.9; skew-x: 10.3; skew-y: 10.3; scale-y: -10000; }
        frame 130 { x: 63; y: 49.4; skew-x: 7; skew-y: 7; scale-y: 0.809; }
        frame 131 { x: 61; y: 49.9; skew-x: 4.1; skew-y: 4.1; scale-y: 0.807; }
        frame 132 { x: 59.5; y: 50.4; skew-x: 1.5; skew-y: 1.5; scale-y: 0.806; }
        frame 133 { x: 58; y: 50.6; skew-x: -0.2; skew-y: -0.2; scale-y: 0.804; }
        frame 134 { x: 56.9; y: 51; skew-x: -2.2; skew-y: -2.2; scale-y: 0.802; }
        frame 135 { x: 56; y: 51.3; skew-x: -3.7; skew-y: -3.7; scale-y: 0.801; }
        frame 136 { x: 55.3; y: 51.5; skew-x: -4.9; skew-y: -4.9; scale-y: 0.8; }
        frame 137 { x: 54.8; y: 51.6; skew-x: -5.7; skew-y: -5.7; scale-y: -10000; }
        frame 138 { x: 54.5; y: 51.8; skew-x: -6.2; skew-y: -6.2; scale-y: 0.799; }
        frame 139 { x: 54.4; y: -10000; skew-x: -6.4; skew-y: -6.4; scale-y: -10000; }
        frame 140 { x: 54.9; y: 51.7; skew-x: -6; skew-y: -6; }
        frame 141 { x: 56.4; y: -10000; skew-x: -5.2; skew-y: -5.2; }
        frame 142 { x: 59; y: 51.5; skew-x: -3.7; skew-y: -3.7; }
        frame 143 { x: 62.5; y: 51.2; skew-x: -1.4; skew-y: -1.4; }
        frame 144 { x: 67.1; y: 50.9; skew-x: 1; skew-y: 1; }
        frame 145 { x: 73; y: 50.5; skew-x: 4.5; skew-y: 4.5; }
        frame 146 { x: 79.7; y: 50; skew-x: 8.5; skew-y: 8.5; scale-x: 0.798; scale-y: 0.798; }
        frame 147 { x: 87.7; y: 49.5; skew-x: 13.1; skew-y: 13.1; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 96.6; y: 49; skew-x: 18.3; skew-y: 18.3; }
        frame 149 { x: 106.8; y: 48.5; skew-x: 24.3; skew-y: 24.3; }
        frame 150 { x: 124.2; y: 59.3; skew-x: 42.1; skew-y: 42.1; scale-x: 0.796; scale-y: 0.796; }
        frame 151 { x: 142; y: 70.8; skew-x: 60; skew-y: 60; scale-x: 0.797; scale-y: 0.797; }
        frame 152 { x: 152.6; y: 86.6; skew-x: 77.9; skew-y: 77.9; scale-x: 0.798; scale-y: 0.798; }
        frame 153 { x: 162.8; y: 103.3; skew-x: 95.7; skew-y: 95.7; scale-x: 0.799; scale-y: 0.799; }
        frame 154 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_upperbody";
        frame-count: 164;
        frame 0 { x: 14.8; y: 6.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_UPPERBODY; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 16; y: 5.3; skew-x: 1.1; skew-y: 1.1; }
        frame 4 { x: 17.2; y: 3.9; skew-x: 2.3; skew-y: 2.3; }
        frame 5 { x: 18.5; y: 2.6; skew-x: 3.5; skew-y: 3.5; }
        frame 6 { x: 19.8; y: 1.3; skew-x: 4.8; skew-y: 4.8; }
        frame 7 { x: 21.2; y: 0.1; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 22.6; y: -1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 9 { x: 23.9; y: -1.4; skew-x: 8.5; skew-y: 8.5; scale-x: 0.799; scale-y: 0.799; }
        frame 10 { x: 25.4; y: -1.7; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 26.7; y: -2.1; skew-x: 11; skew-y: 11; }
        frame 12 { x: 28.2; y: -2.5; skew-x: 12.3; skew-y: 12.3; }
        frame 13 { x: 29.7; y: -2.7; skew-x: 13.6; skew-y: 13.6; }
        frame 14 { x: 31.1; y: -3.1; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 29.2; y: -2.7; skew-x: 13.3; skew-y: 13.3; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 27.5; y: -2.3; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 25.7; y: -1.8; skew-x: 10.1; skew-y: 10.3; }
        frame 20 { x: 24.1; y: -1.3; skew-x: 8.5; skew-y: 8.8; }
        frame 21 { x: 22.6; y: -0.8; skew-x: 7; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 20.9; y: 0.5; skew-x: 5.5; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 19.3; y: 2; skew-x: 4.1; skew-y: 4.3; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: 17.8; y: 3.4; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 16.2; y: 5; skew-x: 1.3; skew-y: 1.3; }
        frame 26 { x: 14.8; y: 6.5; skew-x: 0; skew-y: 0; }
        frame 27 { x: 17.5; y: 4; skew-x: 2; skew-y: 2; }
        frame 28 { x: 20.4; y: 1.3; skew-x: 4.3; skew-y: 4.3; }
        frame 29 { x: 23.1; y: -1; skew-x: 6.3; skew-y: 6.3; }
        frame 30 { x: 26.1; y: -3.5; skew-x: 8.5; skew-y: 8.5; }
        frame 31 { x: 29.1; y: -5.8; skew-x: 10.6; skew-y: 10.6; }
        frame 32 { x: 32.1; y: -8.1; skew-x: 12.8; skew-y: 12.8; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 35.2; y: -10.5; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 32.1; y: -8.1; skew-x: 12.8; skew-y: 12.8; scale-x: 0.799; scale-y: 0.799; }
        frame 40 { x: 29.1; y: -5.8; skew-x: 10.5; skew-y: 10.5; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 25.9; y: -3.4; skew-x: 8.3; skew-y: 8.3; }
        frame 42 { x: 23.1; y: -1; skew-x: 6.3; skew-y: 6.3; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: 20.2; y: 1.4; skew-x: 4.1; skew-y: 4.1; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 17.4; y: 4; skew-x: 2; skew-y: 2; }
        frame 45 { x: 14.8; y: 6.5; skew-x: 0; skew-y: 0; }
        frame 46 { x: 39.2; y: -10.4; skew-x: 26.1; skew-y: 26.1; scale-x: 0.799; scale-y: 0.799; }
        frame 47 { x: 39.3; y: -12.8; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 48 { x: 39.2; y: -15.3; scale-x: 0.798; scale-y: 0.798; }
        frame 49 { x: 39.3; y: -12.8; skew-x: 26; skew-y: 26; scale-x: 0.797; scale-y: 0.797; }
        frame 50 { x: 39.2; y: -10.4; skew-x: 26.1; skew-y: 26.1; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 39.3; y: -12.8; scale-x: 0.797; scale-y: 0.797; }
        frame 58 { x: 39.2; y: -15.3; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: -10000; y: -14.1; scale-x: 0.797; scale-y: 0.797; }
        frame 60 { x: 39.3; y: -12.8; skew-x: 26; skew-y: 26; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -10000; y: -11.6; skew-x: 26.1; skew-y: 26.1; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: 39.2; y: -10.4; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 14.8; y: 6.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: 21.9; y: 1.1; skew-x: 6.8; skew-y: 6.8; scale-x: 0.799; scale-y: 0.799; }
        frame 69 { x: 29.6; y: -3.7; skew-x: 13.8; skew-y: 13.8; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 37.7; y: -7.9; skew-x: 20.7; skew-y: 20.7; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 41.4; y: -10.2; skew-x: 28.1; skew-y: 28.1; scale-x: 0.798; scale-y: 0.798; }
        frame 74 { x: 45.5; y: -11.5; skew-x: 35.6; skew-y: 35.6; scale-x: 0.797; scale-y: 0.797; }
        frame 75 { x: 49.8; y: -12.1; skew-x: 43.2; skew-y: 43.2; scale-x: 0.798; scale-y: 0.798; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 43.3; y: -11; skew-x: 36.1; skew-y: 36.1; scale-x: 0.797; scale-y: 0.797; }
        frame 84 { x: 36.6; y: -9.2; skew-x: 28.8; skew-y: 28.8; scale-x: 0.798; scale-y: 0.798; }
        frame 85 { x: 30.5; y: -6.4; skew-x: 21.6; skew-y: 21.6; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 24.7; y: -2.9; skew-x: 14.3; skew-y: 14.3; scale-x: 0.799; scale-y: 0.799; }
        frame 87 { x: 19.3; y: 1.5; skew-x: 7.1; skew-y: 7.1; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 14.8; y: 6.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 16.7; y: 5.1; skew-x: 1.5; skew-y: 1.5; }
        frame 91 { x: 18.6; y: 3.6; skew-x: 3.3; skew-y: 3.3; }
        frame 92 { x: 20.6; y: 2.1; skew-x: 5; skew-y: 5; }
        frame 93 { x: 22.5; y: 0.8; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 94 { x: 24.6; y: -0.4; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 26.7; y: -1.8; skew-x: 10.1; skew-y: 10.1; scale-x: 0.8; scale-y: 0.8; }
        frame 96 { x: 23.2; y: 1.7; skew-x: 7; skew-y: 7; scale-x: 0.799; scale-y: 0.799; }
        frame 97 { x: 19.9; y: 5.3; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 16.8; y: 9; skew-x: 1; skew-y: 1; }
        frame 99 { x: 16.3; y: 8.4; skew-x: 0.8; skew-y: 0.8; }
        frame 100 { x: 15.9; y: 7.8; skew-x: 0.5; skew-y: 0.5; scale-x: 0.8; scale-y: 0.8; }
        frame 101 { x: 15.3; y: 7.2; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 14.8; y: 6.5; skew-x: 0; skew-y: 0; }
        frame 103 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 105 { x: 16.7; y: 5.1; skew-x: 1.5; skew-y: 1.5; }
        frame 106 { x: 18.6; y: 3.6; skew-x: 3.3; skew-y: 3.3; }
        frame 107 { x: 20.6; y: 2.1; skew-x: 5; skew-y: 5; }
        frame 108 { x: 22.5; y: 0.8; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 109 { x: 24.6; y: -0.4; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 26.7; y: -1.8; skew-x: 10.1; skew-y: 10.1; scale-x: 0.8; scale-y: 0.8; }
        frame 111 { x: 23.2; y: 1.7; skew-x: 7; skew-y: 7; scale-x: 0.799; scale-y: 0.799; }
        frame 112 { x: 19.9; y: 5.3; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 16.8; y: 9; skew-x: 1; skew-y: 1; }
        frame 114 { x: 16.3; y: 8.4; skew-x: 0.8; skew-y: 0.8; }
        frame 115 { x: 15.9; y: 7.8; skew-x: 0.5; skew-y: 0.5; scale-x: 0.8; scale-y: 0.8; }
        frame 116 { x: 15.3; y: 7.2; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 14.8; y: 6.5; skew-x: 0; skew-y: 0; }
        frame 118 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 120 { x: 37.9; y: -9.7; skew-x: 23; skew-y: 23; scale-x: 0.799; scale-y: 0.799; }
        frame 121 { x: 41; y: -9.9; skew-x: 24.6; skew-y: 24.6; scale-x: 0.798; scale-y: 0.798; }
        frame 122 { x: 43.9; y: -10.2; skew-x: 26; skew-y: 26; scale-x: -10000; scale-y: -10000; }
        frame 123 { x: 46.1; y: -10.3; skew-x: 27.1; skew-y: 27.1; }
        frame 124 { x: 48.4; y: -10.6; skew-x: 28.3; skew-y: 28.3; }
        frame 125 { x: 50; y: -10000; skew-x: 29.1; skew-y: 29.1; }
        frame 126 { x: 51.4; y: -10.7; skew-x: 29.8; skew-y: 29.8; }
        frame 127 { x: 52.1; y: -10.6; skew-x: 30.1; skew-y: 30.1; }
        frame 128 { x: 52.9; y: -10.8; skew-x: 30.6; skew-y: 30.6; }
        frame 129 { x: 53; y: -10.9; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 130 { x: 49.1; y: -10.3; skew-x: 28.6; skew-y: 28.6; scale-x: 0.797; scale-y: 0.797; }
        frame 131 { x: 45.6; y: -9.9; skew-x: 26.8; skew-y: 26.8; scale-x: -10000; scale-y: -10000; }
        frame 132 { x: 42.6; y: -9.5; skew-x: 25.3; skew-y: 25.3; }
        frame 133 { x: 40.1; y: -9.2; skew-x: 24.1; skew-y: 24.1; }
        frame 134 { x: 38; y: -8.8; skew-x: 23.1; skew-y: 23.1; }
        frame 135 { x: 36.1; y: -8.5; skew-x: 22.1; skew-y: 22.1; }
        frame 136 { x: 34.7; y: -8.1; skew-x: 21.3; skew-y: 21.3; }
        frame 137 { x: 33.7; y: -8; skew-x: 20.8; skew-y: 20.8; }
        frame 138 { x: 33.1; y: -10000; skew-x: 20.6; skew-y: 20.6; }
        frame 139 { x: 33; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; }
        frame 140 { x: 33.8; skew-x: 20.8; skew-y: 20.8; scale-x: 0.797; scale-y: 0.797; }
        frame 141 { x: 36.4; y: -8.4; skew-x: 21.8; skew-y: 21.8; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 40.6; y: -9.1; skew-x: 23.6; skew-y: 23.6; }
        frame 143 { x: 46.7; y: -10; skew-x: 25.8; skew-y: 25.8; }
        frame 144 { x: 54.5; y: -10.9; skew-x: 28.8; skew-y: 28.8; }
        frame 145 { x: 64.2; y: -11.9; skew-x: 32.6; skew-y: 32.6; }
        frame 146 { x: 75.6; y: -12.8; skew-x: 36.9; skew-y: 36.9; scale-x: 0.796; scale-y: 0.796; }
        frame 147 { x: 88.8; y: -13.4; skew-x: 41.9; skew-y: 41.9; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 104; y: -13.5; skew-x: 47.6; skew-y: 47.6; }
        frame 149 { x: 120.8; y: -13; skew-x: 53.9; skew-y: 53.9; scale-x: 0.797; scale-y: 0.797; }
        frame 150 { x: 156; y: 4.5; skew-x: 71.2; skew-y: 71.2; scale-x: 0.796; scale-y: 0.796; }
        frame 151 { x: 189.1; y: 26.9; skew-x: 88.5; skew-y: 88.5; scale-x: 0.797; scale-y: 0.797; }
        frame 152 { x: 209.6; y: 59.6; skew-x: 105.5; skew-y: 105.5; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 225.9; y: 95.2; skew-x: 122.8; skew-y: 122.8; scale-x: 0.798; scale-y: 0.798; }
        frame 154 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_chops";
        frame-count: 164;
        frame 0 { x: 0.7; y: 1.9; image: IMAGE_REANIM_ZOMBIE_DISCO_CHOPS; }
        frame 1 { x: -10000; y: -10000; image: none; }
        frame 3 { x: 2.1; y: 0.8; }
        frame 4 { x: 3.5; y: -0.1; }
        frame 5 { x: 5.1; y: -1.1; }
        frame 6 { x: 6.5; y: -2.1; }
        frame 7 { x: 8; y: -3.2; }
        frame 8 { x: 9.4; y: -4.2; }
        frame 9 { x: 10.9; y: -4.4; }
        frame 10 { x: 12.3; y: -4.6; }
        frame 11 { x: 13.8; y: -4.8; }
        frame 12 { x: 15.3; y: -5.1; }
        frame 13 { x: 16.7; y: -5.3; }
        frame 14 { x: 18.2; y: -5.5; }
        frame 15 { x: -10000; y: -10000; }
        frame 17 { x: 16.4; y: -5.2; }
        frame 18 { x: 14.7; y: -5; }
        frame 19 { x: 12.9; y: -4.7; }
        frame 20 { x: 11.2; y: -4.5; }
        frame 21 { x: 9.4; y: -4.2; }
        frame 22 { x: 7.7; y: -3; }
        frame 23 { x: 5.9; y: -1.7; }
        frame 24 { x: 4.2; y: -0.5; }
        frame 25 { x: 2.4; y: 0.7; }
        frame 26 { x: 0.7; y: 1.9; }
        frame 27 { x: -10000; y: -10000; }
        frame 28 { x: 5.6; y: -2.1; skew-x: 2.5; skew-y: 2.5; }
        frame 29 { x: 10.5; y: -6.2; skew-x: 4.8; skew-y: 4.8; }
        frame 30 { x: 15.5; y: -10.4; skew-x: 7.3; skew-y: 7.3; }
        frame 31 { x: 20.4; y: -14.4; skew-x: 9.8; skew-y: 9.8; scale-x: 0.999; scale-y: 0.999; }
        frame 32 { x: 25.5; y: -18.6; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 30.6; y: -22.7; skew-x: 15; skew-y: 15; scale-x: 1; scale-y: 1; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 26.3; y: -19.1; skew-x: 12.8; skew-y: 12.8; scale-x: 0.999; scale-y: 0.999; }
        frame 40 { x: 22; y: -15.6; skew-x: 10.6; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 17.7; y: -12.1; skew-x: 8.5; skew-y: 8.5; scale-x: 1; scale-y: 1; }
        frame 42 { x: 13.4; y: -8.5; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 9.2; y: -5; skew-x: 4.3; skew-y: 4.3; }
        frame 44 { x: 4.8; y: -1.5; skew-x: 2; skew-y: 2; }
        frame 45 { x: 0.7; y: 1.9; skew-x: 0; skew-y: 0; }
        frame 46 { x: 33; y: -22.1; skew-x: 20.3; skew-y: 20.3; scale-x: 0.999; scale-y: 0.999; }
        frame 47 { x: -10000; y: -23; skew-x: -10000; skew-y: -10000; scale-x: 0.998; scale-y: 0.998; }
        frame 48 { y: -24; scale-x: -10000; scale-y: -10000; }
        frame 49 { y: -25.1; scale-x: 0.999; scale-y: 0.999; }
        frame 50 { y: -24; scale-x: 0.998; scale-y: 0.998; }
        frame 51 { y: -23; scale-x: -10000; scale-y: -10000; }
        frame 52 { y: -22.1; scale-x: 0.999; scale-y: 0.999; }
        frame 53 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { y: -22.8; scale-x: 0.998; scale-y: 0.998; }
        frame 58 { y: -23.5; scale-x: -10000; scale-y: -10000; }
        frame 59 { y: -24.3; }
        frame 60 { y: -25.1; scale-x: 0.999; scale-y: 0.999; }
        frame 61 { y: -24.3; scale-x: 0.998; scale-y: 0.998; }
        frame 62 { y: -23.5; scale-x: -10000; scale-y: -10000; }
        frame 63 { y: -22.8; }
        frame 64 { y: -22.1; scale-x: 0.999; scale-y: 0.999; }
        frame 65 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 0.7; y: 1.9; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 68 { x: 9.3; y: -2.9; skew-x: 1.5; skew-y: 1.5; scale-x: 0.999; scale-y: 0.999; }
        frame 69 { x: 18.1; y: -7.9; skew-x: 3.3; skew-y: 3.3; scale-x: 0.998; scale-y: 0.998; }
        frame 70 { x: 26.8; y: -12.8; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 28.4; y: -12.7; }
        frame 74 { x: 30.1; y: -10000; }
        frame 75 { x: 31.8; y: -12.8; }
        frame 76 { x: -10000; y: -10000; }
        frame 83 { x: 26.5; y: -10.2; skew-x: 4.1; skew-y: 4.1; }
        frame 84 { x: 21.4; y: -7.7; skew-x: 3.3; skew-y: 3.3; }
        frame 85 { x: 16.3; y: -5.2; skew-x: 2.5; skew-y: 2.5; scale-x: 0.999; scale-y: 0.999; }
        frame 86 { x: 11.1; y: -2.8; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 5.8; y: -0.4; skew-x: 0.8; skew-y: 0.8; scale-x: 1; scale-y: 1; }
        frame 88 { x: 0.7; y: 1.9; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 90 { x: 1.9; y: 0.8; skew-x: 0.5; skew-y: 0.5; }
        frame 91 { x: 3.1; y: -0; skew-x: 1; skew-y: 1; }
        frame 92 { x: 4.3; y: -1; skew-x: 1.5; skew-y: 1.5; }
        frame 93 { x: 5.6; y: -2; skew-x: 2; skew-y: 2; }
        frame 94 { x: 6.8; y: -3; skew-x: 2.6; skew-y: 2.6; }
        frame 95 { x: 8.1; y: -4; skew-x: 3.3; skew-y: 3.3; }
        frame 96 { x: 4.8; y: -0.1; skew-x: -10000; skew-y: -10000; }
        frame 97 { x: 1.5; y: 3.6; }
        frame 98 { x: -1.6; y: 7.6; }
        frame 99 { x: -1.1; y: 6.2; skew-x: 2.3; skew-y: 2.3; }
        frame 100 { x: -0.4; y: 4.8; skew-x: 1.5; skew-y: 1.5; }
        frame 101 { x: 0.1; y: 3.4; skew-x: 0.8; skew-y: 0.8; }
        frame 102 { x: 0.7; y: 1.9; skew-x: 0; skew-y: 0; }
        frame 103 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 105 { x: 1.9; y: 0.8; skew-x: 0.5; skew-y: 0.5; }
        frame 106 { x: 3.1; y: -0; skew-x: 1; skew-y: 1; }
        frame 107 { x: 4.3; y: -1; skew-x: 1.5; skew-y: 1.5; }
        frame 108 { x: 5.6; y: -2; skew-x: 2; skew-y: 2; }
        frame 109 { x: 6.8; y: -3; skew-x: 2.6; skew-y: 2.6; }
        frame 110 { x: 8.1; y: -4; skew-x: 3.3; skew-y: 3.3; }
        frame 111 { x: 4.8; y: -0.1; skew-x: -10000; skew-y: -10000; }
        frame 112 { x: 1.5; y: 3.6; }
        frame 113 { x: -1.6; y: 7.6; }
        frame 114 { x: -1.1; y: 6.2; skew-x: 2.3; skew-y: 2.3; }
        frame 115 { x: -0.4; y: 4.8; skew-x: 1.5; skew-y: 1.5; }
        frame 116 { x: 0.1; y: 3.4; skew-x: 0.8; skew-y: 0.8; }
        frame 117 { x: 0.7; y: 1.9; skew-x: 0; skew-y: 0; }
        frame 118 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 120 { cel: -1; }
        frame 121 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_medalion";
        frame-count: 164;
        frame 0 { x: 21; y: 23; image: IMAGE_REANIM_ZOMBIE_DISCO_MEDALION; }
        frame 1 { x: -10000; y: -10000; image: none; }
        frame 3 { x: 21.8; y: 22.3; skew-x: -1; skew-y: -1; }
        frame 4 { x: 22.7; y: 21.6; skew-x: -2.2; skew-y: -2.2; }
        frame 5 { x: 23.4; y: 21; skew-x: -3.4; skew-y: -3.4; }
        frame 6 { x: 24.2; y: 20.4; skew-x: -4.7; skew-y: -4.7; scale-x: 0.999; scale-y: 0.999; }
        frame 7 { x: 25.1; y: 19.7; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 26; y: 19.1; skew-x: -7.2; skew-y: -7.2; scale-x: 1; scale-y: 1; }
        frame 9 { x: 26.8; y: 19.2; skew-x: -8.4; skew-y: -8.4; scale-x: 0.999; scale-y: 0.999; }
        frame 10 { x: 27.7; y: 19.4; skew-x: -9.7; skew-y: -9.7; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 28.6; y: 19.6; skew-x: -10.9; skew-y: -10.9; }
        frame 12 { x: 29.4; y: 19.7; skew-x: -12.2; skew-y: -12.2; }
        frame 13 { x: 30.3; y: 20; skew-x: -13.5; skew-y: -13.5; }
        frame 14 { x: 31.1; y: 20.2; skew-x: -14.9; skew-y: -14.9; scale-x: 1; scale-y: 1; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 30; y: 19.8; skew-x: -13.2; skew-y: -13.2; scale-x: 0.999; scale-y: 0.999; }
        frame 18 { x: 29.1; y: 19.7; skew-x: -11.7; skew-y: -11.7; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 27.9; y: 19.4; skew-x: -10.2; skew-y: -10.2; }
        frame 20 { x: 27; y: 19.2; skew-x: -8.7; skew-y: -8.7; }
        frame 21 { x: 26; y: 19.1; skew-x: -7.2; skew-y: -7.2; scale-x: 1; scale-y: 1; }
        frame 22 { x: 25; y: 19.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.999; scale-y: 0.999; }
        frame 23 { x: 24; y: 20.6; skew-x: -4.2; skew-y: -4.2; scale-x: 1; scale-y: 1; }
        frame 24 { x: 23; y: 21.4; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 22; y: 22.2; skew-x: -1.2; skew-y: -1.2; }
        frame 26 { x: 21; y: 23; skew-x: 0; skew-y: 0; }
        frame 27 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 28 { x: 23.3; y: 21; skew-x: -2.2; skew-y: -2.4; }
        frame 29 { x: 25.6; y: 19; skew-x: -4.7; skew-y: -4.7; }
        frame 30 { x: 27.9; y: 17; skew-x: -7.2; skew-y: -7.2; }
        frame 31 { x: 30.2; y: 14.9; skew-x: -9.7; skew-y: -9.7; scale-x: 0.999; scale-y: 0.999; }
        frame 32 { x: 32.5; y: 13; skew-x: -12.2; skew-y: -12.2; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 34.9; y: 11.1; skew-x: -14.9; skew-y: -14.9; scale-x: 1; scale-y: 1; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 32.8; y: 12.8; skew-x: -12.7; skew-y: -12.7; scale-x: 0.999; scale-y: 0.999; }
        frame 40 { x: 30.8; y: 14.5; skew-x: -10.5; skew-y: -10.5; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 28.8; y: 16.3; skew-x: -8.4; skew-y: -8.4; scale-x: 1; scale-y: 1; }
        frame 42 { x: 26.9; y: 17.9; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 24.9; y: 19.7; skew-x: -4.2; skew-y: -4.2; }
        frame 44 { x: 22.9; y: 21.3; skew-x: -1.9; skew-y: -1.9; }
        frame 45 { x: 21; y: 23; skew-x: 0; skew-y: 0; }
        frame 46 { x: 32.6; y: 14.8; skew-x: -14.2; skew-y: -14.2; scale-x: 0.999; scale-y: 0.999; }
        frame 47 { x: 32.5; y: 11.6; skew-x: -9.7; skew-y: -9.7; scale-x: 0.998; scale-y: 0.998; }
        frame 48 { x: 32.4; y: 8.4; skew-x: -5.4; skew-y: -5.4; scale-x: 0.999; scale-y: 0.999; }
        frame 49 { x: 32.5; y: 11.6; skew-x: -9.7; skew-y: -9.7; scale-x: 0.998; scale-y: 0.998; }
        frame 50 { x: 32.6; y: 14.8; skew-x: -14.2; skew-y: -14.2; scale-x: 0.999; scale-y: 0.999; }
        frame 51 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 32.5; y: 11.6; skew-x: -9.7; skew-y: -9.7; scale-x: 0.998; scale-y: 0.998; }
        frame 58 { x: 32.4; y: 8.4; skew-x: -5.4; skew-y: -5.4; scale-x: 0.999; scale-y: 0.999; }
        frame 59 { x: -10000; y: 10; skew-x: -7.5; skew-y: -7.5; scale-x: 0.998; scale-y: 0.998; }
        frame 60 { x: 32.5; y: 11.6; skew-x: -9.7; skew-y: -9.7; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -10000; y: 13.2; skew-x: -11.9; skew-y: -11.9; }
        frame 62 { x: 32.6; y: 14.8; skew-x: -14.2; skew-y: -14.2; scale-x: 0.999; scale-y: 0.999; }
        frame 63 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 21; y: 23; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 68 { x: 25.5; y: 21; skew-x: -4.4; skew-y: -4.4; scale-x: 0.999; scale-y: 0.999; }
        frame 69 { x: 30; y: 18.9; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 34.6; y: 16.8; skew-x: -13.4; skew-y: -13.4; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 34.9; y: 14.6; skew-x: -6.9; skew-y: -6.9; scale-x: 0.998; scale-y: 0.998; }
        frame 74 { x: 35.3; y: 12.5; skew-x: -0.5; skew-y: -0.5; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 35.8; y: 10.2; skew-x: 5.7; skew-y: 5.7; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 83 { x: 33.4; y: 12.3; skew-x: 4.8; skew-y: 4.8; }
        frame 84 { x: 30.8; y: 14.5; skew-x: 3.8; skew-y: 3.8; }
        frame 85 { x: 28.4; y: 16.6; skew-x: 2.8; skew-y: 2.8; scale-x: 0.999; scale-y: 0.999; }
        frame 86 { x: 25.9; y: 18.7; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 23.4; y: 20.9; skew-x: 0.8; skew-y: 0.8; scale-x: 1; scale-y: 1; }
        frame 88 { x: 21; y: 23; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 90 { x: 21.9; y: 22.8; skew-x: -1.2; skew-y: -1.2; }
        frame 91 { x: 22.8; y: 22.5; skew-x: -2.4; skew-y: -2.4; scale-x: 0.999; scale-y: 0.999; }
        frame 92 { x: 23.8; y: 22.2; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 24.7; y: 22; skew-x: -5; skew-y: -5; }
        frame 94 { x: 25.7; y: 21.7; skew-x: -6.4; skew-y: -6.4; scale-x: 0.998; scale-y: 0.998; }
        frame 95 { x: 26.5; y: 21.4; skew-x: -7.7; skew-y: -7.7; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 24.5; y: 22.9; skew-x: -6.4; skew-y: -6.4; }
        frame 97 { x: 22.4; y: 24.3; skew-x: -5.2; skew-y: -5.2; }
        frame 98 { x: 20.4; y: 25.9; skew-x: -4.2; skew-y: -4.2; scale-x: 0.999; scale-y: 0.999; }
        frame 99 { x: 20.5; y: 25.1; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 20.6; y: 24.4; skew-x: -1.9; skew-y: -1.9; }
        frame 101 { x: 20.7; y: 23.7; skew-x: -0.9; skew-y: -0.9; scale-x: 1; scale-y: 1; }
        frame 102 { x: 21; y: 23; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 105 { x: 21.9; y: 22.8; skew-x: -1.2; skew-y: -1.2; }
        frame 106 { x: 22.8; y: 22.5; skew-x: -2.4; skew-y: -2.4; scale-x: 0.999; scale-y: 0.999; }
        frame 107 { x: 23.8; y: 22.2; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 24.7; y: 22; skew-x: -5; skew-y: -5; }
        frame 109 { x: 25.7; y: 21.7; skew-x: -6.4; skew-y: -6.4; scale-x: 0.998; scale-y: 0.998; }
        frame 110 { x: 26.5; y: 21.4; skew-x: -7.7; skew-y: -7.7; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 24.5; y: 22.9; skew-x: -6.4; skew-y: -6.4; }
        frame 112 { x: 22.4; y: 24.3; skew-x: -5.2; skew-y: -5.2; }
        frame 113 { x: 20.4; y: 25.9; skew-x: -4.2; skew-y: -4.2; scale-x: 0.999; scale-y: 0.999; }
        frame 114 { x: 20.5; y: 25.1; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 20.6; y: 24.4; skew-x: -1.9; skew-y: -1.9; }
        frame 116 { x: 20.7; y: 23.7; skew-x: -0.9; skew-y: -0.9; scale-x: 1; scale-y: 1; }
        frame 117 { x: 21; y: 23; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 120 { x: 34.4; y: 14.6; skew-x: -12.9; skew-y: -12.9; scale-x: 0.999; scale-y: 0.999; }
        frame 121 { x: 36.9; y: 14.2; skew-x: -11.2; skew-y: -11.2; scale-x: -10000; scale-y: -10000; }
        frame 122 { x: 39.1; y: 13.8; skew-x: -9.9; skew-y: -9.9; }
        frame 123 { x: 41; y: 13.5; skew-x: -8.7; skew-y: -8.7; }
        frame 124 { x: 42.6; y: 13.3; skew-x: -7.7; skew-y: -7.7; }
        frame 125 { x: 44; y: 13; skew-x: -6.7; skew-y: -6.7; }
        frame 126 { x: 45; y: -10000; skew-x: -6.2; skew-y: -6.2; }
        frame 127 { x: 45.8; y: 12.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.998; scale-y: 0.998; }
        frame 128 { x: 46.3; y: 12.7; skew-x: -5.4; skew-y: -5.4; scale-x: -10000; scale-y: -10000; }
        frame 129 { x: 46.5; y: -10000; skew-x: -5.3; skew-y: -5.3; scale-x: 0.999; scale-y: 0.999; }
        frame 130 { x: 43.5; y: 13.3; skew-x: -7.2; skew-y: -7.2; scale-x: 0.998; scale-y: 0.998; }
        frame 131 { x: 40.8; y: 14; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 132 { x: 38.4; y: 14.6; skew-x: -10.4; skew-y: -10.4; }
        frame 133 { x: 36.4; y: 15; skew-x: -11.7; skew-y: -11.7; }
        frame 134 { x: 34.5; y: 15.4; skew-x: -12.7; skew-y: -12.7; }
        frame 135 { x: 33.3; y: 15.7; skew-x: -13.7; skew-y: -13.7; }
        frame 136 { x: 32; y: 16; skew-x: -14.4; skew-y: -14.4; }
        frame 137 { x: 31.3; y: 16.2; skew-x: -14.9; skew-y: -14.9; scale-x: 0.997; scale-y: 0.997; }
        frame 138 { x: 30.8; y: 16.3; skew-x: -15.2; skew-y: -15.2; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 30.6; y: 16.4; skew-x: -15.4; skew-y: -15.4; scale-x: 0.998; scale-y: 0.998; }
        frame 140 { x: 31.3; y: 16.2; skew-x: -14.7; skew-y: -14.7; scale-x: 0.997; scale-y: 0.997; }
        frame 141 { x: 33.5; y: 15.8; skew-x: -13.4; skew-y: -13.4; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 37; y: 15.1; skew-x: -10.9; skew-y: -10.9; scale-x: 0.998; scale-y: 0.998; }
        frame 143 { x: 42.2; y: 14.1; skew-x: -7.5; skew-y: -7.5; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 48.8; y: 12.9; skew-x: -3.2; skew-y: -3.2; }
        frame 145 { x: 57; y: 11.3; skew-x: 1.8; skew-y: 1.8; }
        frame 146 { x: 66.9; y: 9.6; skew-x: 8.1; skew-y: 8.1; scale-x: 0.997; scale-y: 0.997; }
        frame 147 { x: 78.3; y: 7.6; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 91.7; y: 5.3; skew-x: 23.6; skew-y: 23.6; scale-x: 0.996; scale-y: 0.996; }
        frame 149 { x: 106.7; y: 2.9; skew-x: 32.8; skew-y: 32.8; scale-x: 0.997; scale-y: 0.997; }
        frame 150 { x: 136; y: 18.3; skew-x: 47.9; skew-y: 51.9; scale-x: 0.995; scale-y: 0.987; }
        frame 151 { x: 165.9; y: 34.1; skew-x: 62.9; skew-y: 71.2; scale-x: 0.996; scale-y: 0.98; }
        frame 152 { x: 184.9; y: 60.6; skew-x: 78; skew-y: 90.1; scale-x: -10000; scale-y: 0.972; }
        frame 153 { x: 203.7; y: 87.9; skew-x: 93; skew-y: 109.3; scale-x: 0.998; scale-y: 0.965; }
        frame 154 { x: 203.2; y: 87.8; skew-x: 90; skew-y: 103; scale-x: -10000; scale-y: 0.954; }
        frame 155 { x: 202.5; y: -10000; skew-x: 86.7; skew-y: 97; scale-x: 0.997; scale-y: 0.944; }
        frame 156 { x: 201.8; skew-x: 83.5; skew-y: 90.9; scale-x: -10000; scale-y: 0.934; }
        frame 157 { x: 202; y: 87.9; skew-x: 84.2; skew-y: 93.8; scale-y: 0.94; }
        frame 158 { x: 202.1; y: 87.8; skew-x: 84.8; skew-y: 96.7; scale-y: 0.946; }
        frame 159 { x: 201.9; y: -10000; skew-x: 84.2; skew-y: 93.8; scale-y: 0.94; }
        frame 160 { x: 201.8; skew-x: 83.5; skew-y: 90.9; scale-y: 0.934; }
        frame 161 { x: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 164;
        frame 0 { x: -1.9; y: -18.6; image: IMAGE_REANIM_ZOMBIE_DANCER__HEAD; }
        frame 1 { x: -10000; y: -10000; image: none; }
        frame 3 { x: -0.4; y: -19.7; }
        frame 4 { x: 0.9; y: -20.7; }
        frame 5 { x: 2.4; y: -21.7; }
        frame 6 { x: 3.8; y: -22.8; }
        frame 7 { x: 5.3; y: -23.8; }
        frame 8 { x: 6.7; y: -24.9; }
        frame 9 { x: 8.2; y: -25.1; }
        frame 10 { x: 9.6; y: -25.3; }
        frame 11 { x: 11.1; y: -25.5; }
        frame 12 { x: 12.6; y: -25.7; }
        frame 13 { x: 14; y: -25.9; }
        frame 14 { x: 15.5; y: -26.1; }
        frame 15 { x: -10000; y: -10000; }
        frame 17 { x: 13.7; y: -25.9; }
        frame 18 { x: 12; y: -25.6; }
        frame 19 { x: 10.2; y: -25.4; }
        frame 20 { x: 8.5; y: -25.1; }
        frame 21 { x: 6.7; y: -24.9; }
        frame 22 { x: 5; y: -23.6; }
        frame 23 { x: 3.2; y: -22.4; }
        frame 24 { x: 1.5; y: -21.1; }
        frame 25 { x: -0.1; y: -19.9; }
        frame 26 { x: -1.9; y: -18.6; }
        frame 27 { x: -10000; y: -10000; }
        frame 28 { x: 3.7; y: -23; skew-x: 2.5; skew-y: 2.5; }
        frame 29 { x: 9.4; y: -27.1; skew-x: 4.8; skew-y: 4.8; }
        frame 30 { x: 15.3; y: -31.2; skew-x: 7.3; skew-y: 7.3; }
        frame 31 { x: 21.2; y: -35.3; skew-x: 9.8; skew-y: 9.8; scale-x: 0.999; scale-y: 0.999; }
        frame 32 { x: 27.2; y: -39.3; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 33.3; y: -43.3; skew-x: 15; skew-y: 15; scale-x: 1; scale-y: 1; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 28.1; y: -39.9; skew-x: 12.8; skew-y: 12.8; scale-x: 0.999; scale-y: 0.999; }
        frame 40 { x: 22.8; y: -36.4; skew-x: 10.6; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 17.8; y: -32.9; skew-x: 8.5; skew-y: 8.5; scale-x: 1; scale-y: 1; }
        frame 42 { x: 12.7; y: -29.5; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 7.8; y: -25.9; skew-x: 4.3; skew-y: 4.3; }
        frame 44 { x: 2.8; y: -22.2; skew-x: 2; skew-y: 2; }
        frame 45 { x: -1.9; y: -18.6; skew-x: 0; skew-y: 0; }
        frame 46 { x: 37.6; y: -42.3; skew-x: 20.3; skew-y: 20.3; scale-x: 0.999; scale-y: 0.999; }
        frame 47 { x: -10000; y: -43.2; skew-x: -10000; skew-y: -10000; scale-x: 0.998; scale-y: 0.998; }
        frame 48 { y: -44.2; scale-x: -10000; scale-y: -10000; }
        frame 49 { y: -45.3; scale-x: 0.999; scale-y: 0.999; }
        frame 50 { y: -44.2; scale-x: 0.998; scale-y: 0.998; }
        frame 51 { y: -43.2; scale-x: -10000; scale-y: -10000; }
        frame 52 { y: -42.3; scale-x: 0.999; scale-y: 0.999; }
        frame 53 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { y: -43; scale-x: 0.998; scale-y: 0.998; }
        frame 58 { y: -43.7; scale-x: -10000; scale-y: -10000; }
        frame 59 { y: -44.5; }
        frame 60 { y: -45.3; scale-x: 0.999; scale-y: 0.999; }
        frame 61 { y: -44.5; scale-x: 0.998; scale-y: 0.998; }
        frame 62 { y: -43.7; scale-x: -10000; scale-y: -10000; }
        frame 63 { y: -43; }
        frame 64 { y: -42.3; scale-x: 0.999; scale-y: 0.999; }
        frame 65 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: -1.9; y: -18.6; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 68 { x: 7.1; y: -23.6; skew-x: 1.5; skew-y: 1.5; scale-x: 0.999; scale-y: 0.999; }
        frame 69 { x: 16.5; y: -28.5; skew-x: 3.3; skew-y: 3.3; scale-x: 0.998; scale-y: 0.998; }
        frame 70 { x: 25.9; y: -33.6; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 27.5; }
        frame 74 { x: 29.2; }
        frame 75 { x: 30.9; }
        frame 76 { x: -10000; }
        frame 83 { x: 25.2; y: -31; skew-x: 4.1; skew-y: 4.1; }
        frame 84 { x: 19.8; y: -28.5; skew-x: 3.3; skew-y: 3.3; }
        frame 85 { x: 14.3; y: -26.1; skew-x: 2.5; skew-y: 2.5; scale-x: 0.999; scale-y: 0.999; }
        frame 86 { x: 8.8; y: -23.6; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 3.3; y: -21.1; skew-x: 0.8; skew-y: 0.8; scale-x: 1; scale-y: 1; }
        frame 88 { x: -1.9; y: -18.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 90 { x: -0.5; y: -19.7; skew-x: 0.5; skew-y: 0.5; }
        frame 91 { x: 0.8; y: -20.7; skew-x: 1; skew-y: 1; }
        frame 92 { x: 2.3; y: -21.7; skew-x: 1.5; skew-y: 1.5; }
        frame 93 { x: 3.6; y: -22.7; skew-x: 2; skew-y: 2; }
        frame 94 { x: 5.1; y: -23.7; skew-x: 2.6; skew-y: 2.6; }
        frame 95 { x: 6.6; y: -24.8; skew-x: 3.3; skew-y: 3.3; }
        frame 96 { x: 3.3; y: -20.9; skew-x: -10000; skew-y: -10000; }
        frame 97 { x: 0; y: -17; }
        frame 98 { x: -3.2; y: -13.1; }
        frame 99 { x: -3; y: -14.4; skew-x: 2.3; skew-y: 2.3; }
        frame 100 { x: -2.6; y: -15.9; skew-x: 1.5; skew-y: 1.5; }
        frame 101 { x: -2.3; y: -17.2; skew-x: 0.8; skew-y: 0.8; }
        frame 102 { x: -1.9; y: -18.6; skew-x: 0; skew-y: 0; }
        frame 103 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 105 { x: -0.5; y: -19.7; skew-x: 0.5; skew-y: 0.5; }
        frame 106 { x: 0.8; y: -20.7; skew-x: 1; skew-y: 1; }
        frame 107 { x: 2.3; y: -21.7; skew-x: 1.5; skew-y: 1.5; }
        frame 108 { x: 3.6; y: -22.7; skew-x: 2; skew-y: 2; }
        frame 109 { x: 5.1; y: -23.7; skew-x: 2.6; skew-y: 2.6; }
        frame 110 { x: 6.6; y: -24.8; skew-x: 3.3; skew-y: 3.3; }
        frame 111 { x: 3.3; y: -20.9; skew-x: -10000; skew-y: -10000; }
        frame 112 { x: 0; y: -17; }
        frame 113 { x: -3.2; y: -13.1; }
        frame 114 { x: -3; y: -14.4; skew-x: 2.3; skew-y: 2.3; }
        frame 115 { x: -2.6; y: -15.9; skew-x: 1.5; skew-y: 1.5; }
        frame 116 { x: -2.3; y: -17.2; skew-x: 0.8; skew-y: 0.8; }
        frame 117 { x: -1.9; y: -18.6; skew-x: 0; skew-y: 0; }
        frame 118 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 120 { cel: -1; }
        frame 121 { cel: -10000; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 164;
        frame 0 { x: 5.8; y: 18.2; image: IMAGE_REANIM_ZOMBIE_JAW; }
        frame 1 { x: -10000; y: -10000; image: none; }
        frame 3 { x: 7.3; y: 17.1; scale-y: 1.047; }
        frame 4 { x: 8.8; y: 15.9; scale-y: 1.094; }
        frame 5 { x: 10.3; y: 14.8; scale-y: 1.142; }
        frame 6 { x: 11.7; y: 13.6; scale-y: 1.189; }
        frame 7 { x: 13.2; y: 12.5; scale-y: 1.236; }
        frame 8 { x: 14.6; y: 11.3; scale-y: 1.283; }
        frame 9 { x: 16.1; y: 11.2; scale-y: 1.236; }
        frame 10 { x: 17.5; y: 11.1; scale-y: 1.189; }
        frame 11 { x: 19; y: 11; scale-y: 1.142; }
        frame 12 { x: 20.5; y: 10.9; scale-y: 1.094; }
        frame 13 { x: 21.9; y: 10.8; scale-y: 1.047; }
        frame 14 { x: 23.4; y: 10.7; scale-y: 1; }
        frame 15 { x: -10000; y: -10000; scale-y: -10000; }
        frame 17 { x: 21.6; y: 10.8; scale-y: 1.057; }
        frame 18 { x: 19.9; y: 10.9; scale-y: 1.113; }
        frame 19 { x: 18.1; y: 11.1; scale-y: 1.17; }
        frame 20 { x: 16.4; y: 11.2; scale-y: 1.227; }
        frame 21 { x: 14.6; y: 11.3; scale-y: 1.283; }
        frame 22 { x: 12.9; y: 12.7; scale-y: 1.227; }
        frame 23 { x: 11.1; y: 14; scale-y: 1.17; }
        frame 24 { x: 9.4; y: 15.4; scale-y: 1.113; }
        frame 25 { x: 7.6; y: 16.8; scale-y: 1.057; }
        frame 26 { x: 5.8; y: 18.2; scale-y: 1; }
        frame 27 { x: -10000; y: -10000; scale-y: -10000; }
        frame 28 { x: 10.1; y: 13.5; skew-x: 2.5; skew-y: 2.5; }
        frame 29 { x: 14.3; y: 9; skew-x: 4.8; skew-y: 4.8; }
        frame 30 { x: 18.5; y: 4.3; skew-x: 7.3; skew-y: 7.3; }
        frame 31 { x: 22.9; y: -0.2; skew-x: 9.8; skew-y: 9.8; scale-x: 0.999; scale-y: 0.999; }
        frame 32 { x: 27.1; y: -4.8; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 31.4; y: -9.5; skew-x: 15; skew-y: 15; scale-x: 1; scale-y: 1; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 27.7; y: -5.6; skew-x: 12.8; skew-y: 12.8; scale-x: 0.999; scale-y: 0.999; }
        frame 40 { x: 24; y: -1.6; skew-x: 10.6; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 20.4; y: 2.1; skew-x: 8.5; skew-y: 8.5; scale-x: 1; scale-y: 1; }
        frame 42 { x: 16.7; y: 6.2; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 13.1; y: 10.1; skew-x: 4.3; skew-y: 4.3; }
        frame 44 { x: 9.5; y: 14.2; skew-x: 2; skew-y: 2; }
        frame 45 { x: 5.8; y: 18.2; skew-x: 0; skew-y: 0; }
        frame 46 { x: 32.2; y: -5; skew-x: 20.3; skew-y: 20.3; scale-x: 0.999; scale-y: 0.999; }
        frame 47 { x: 32.1; y: -5.9; skew-x: -10000; skew-y: -10000; scale-x: 0.998; scale-y: 0.943; }
        frame 48 { x: 32.2; y: -6.8; scale-x: -10000; scale-y: 0.887; }
        frame 49 { x: 32.1; y: -7.7; scale-x: 0.999; scale-y: 0.833; }
        frame 50 { x: -10000; y: -6.8; scale-x: 0.998; scale-y: 0.887; }
        frame 51 { y: -6; scale-x: -10000; scale-y: 0.943; }
        frame 52 { x: 32.2; y: -5; scale-x: 0.999; scale-y: 0.999; }
        frame 53 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 32.1; y: -5.7; scale-x: 0.998; scale-y: 0.956; }
        frame 58 { x: 32.2; y: -6.4; scale-x: -10000; scale-y: 0.915; }
        frame 59 { x: -10000; y: -7.1; scale-y: 0.874; }
        frame 60 { x: 32.1; y: -7.7; scale-x: 0.999; scale-y: 0.833; }
        frame 61 { x: -10000; y: -7; scale-x: 0.998; scale-y: 0.874; }
        frame 62 { y: -6.4; scale-x: -10000; scale-y: 0.915; }
        frame 63 { y: -5.7; scale-y: 0.956; }
        frame 64 { x: 32.2; y: -5; scale-x: 0.999; scale-y: 0.999; }
        frame 65 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 5.8; y: 18.2; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 68 { x: 14.3; y: 12.4; skew-x: 1.5; skew-y: 1.5; scale-x: 0.999; scale-y: 1.005; }
        frame 69 { x: 22.8; y: 6.7; skew-x: 3.3; skew-y: 3.3; scale-x: 0.998; scale-y: 1.01; }
        frame 70 { x: 31.1; y: 0.9; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: 1.016; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 73 { x: 32.8; y: 1.3; scale-y: 1.071; }
        frame 74 { x: 34.4; y: 1.7; scale-y: 1.126; }
        frame 75 { x: 36; y: 2; scale-y: 1.182; }
        frame 76 { x: -10000; y: -10000; scale-y: -10000; }
        frame 83 { x: 31.1; y: 4.8; skew-x: 4.1; skew-y: 4.1; scale-y: 1.151; }
        frame 84 { x: 26; y: 7.5; skew-x: 3.3; skew-y: 3.3; scale-y: 1.121; }
        frame 85 { x: 20.9; y: 10.1; skew-x: 2.5; skew-y: 2.5; scale-x: 0.999; scale-y: 1.091; }
        frame 86 { x: 15.9; y: 12.8; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: 1.06; }
        frame 87 { x: 10.8; y: 15.5; skew-x: 0.8; skew-y: 0.8; scale-x: 1; scale-y: 1.03; }
        frame 88 { x: 5.8; y: 18.2; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 1; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 90 { x: 7.1; y: 17.7; scale-y: 1.012; }
        frame 91 { x: 8.3; y: 17.2; scale-y: 1.025; }
        frame 92 { x: 9.6; y: 16.8; scale-y: 1.037; }
        frame 93 { x: 10.8; y: 16.3; scale-y: 1.049; }
        frame 94 { x: 12; y: 15.8; scale-y: 1.061; }
        frame 95 { x: 13.2; y: 15.3; scale-y: 1.074; }
        frame 96 { x: 9.9; y: 17.1; scale-y: -10000; }
        frame 97 { x: 6.6; y: 18.9; }
        frame 98 { x: 3.3; y: 20.7; }
        frame 99 { x: 4; y: 20.1; scale-y: 1.055; }
        frame 100 { x: 4.6; y: 19.4; scale-y: 1.037; }
        frame 101 { x: 5.2; y: 18.8; scale-y: 1.018; }
        frame 102 { x: 5.8; y: 18.2; scale-y: 1; }
        frame 103 { x: -10000; y: -10000; scale-y: -10000; }
        frame 105 { x: 7.1; y: 17.7; scale-y: 1.012; }
        frame 106 { x: 8.3; y: 17.2; scale-y: 1.025; }
        frame 107 { x: 9.6; y: 16.8; scale-y: 1.037; }
        frame 108 { x: 10.8; y: 16.3; scale-y: 1.049; }
        frame 109 { x: 12; y: 15.8; scale-y: 1.061; }
        frame 110 { x: 13.2; y: 15.3; scale-y: 1.074; }
        frame 111 { x: 9.9; y: 17.1; scale-y: -10000; }
        frame 112 { x: 6.6; y: 18.9; }
        frame 113 { x: 3.3; y: 20.7; }
        frame 114 { x: 4; y: 20.1; scale-y: 1.055; }
        frame 115 { x: 4.6; y: 19.4; scale-y: 1.037; }
        frame 116 { x: 5.2; y: 18.8; scale-y: 1.018; }
        frame 117 { x: 5.8; y: 18.2; scale-y: 1; }
        frame 118 { x: -10000; y: -10000; scale-y: -10000; }
        frame 120 { cel: -1; }
        frame 121 { cel: -10000; }
    }
    Track {
        source-name: "anim_hair";
        frame-count: 164;
        frame 0 { x: -10.3; y: -36.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_HAIR; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: -9.6; y: -37.6; skew-y: -0.4; scale-x: 0.805; scale-y: 0.795; }
        frame 4 { x: -9; y: -38.3; skew-y: -1.2; scale-x: 0.811; scale-y: 0.79; }
        frame 5 { x: -8.4; y: -39; skew-y: -1.9; scale-x: 0.816; scale-y: 0.785; }
        frame 6 { x: -7.7; y: -39.7; skew-y: -2.4; scale-x: 0.821; scale-y: 0.781; }
        frame 7 { x: -7.1; y: -40.3; skew-y: -3.2; scale-x: 0.827; scale-y: 0.776; }
        frame 8 { x: -6.5; y: -41.1; skew-y: -3.9; scale-x: 0.832; scale-y: 0.771; }
        frame 9 { x: -5.2; y: -41.4; skew-x: -0.2; skew-y: -4.4; scale-x: 0.826; scale-y: 0.777; }
        frame 10 { x: -4; y: -41.6; skew-x: -0.7; skew-y: -4.9; scale-x: 0.821; scale-y: 0.782; }
        frame 11 { x: -2.7; y: -41.9; skew-x: -0.9; skew-y: -5.4; scale-x: 0.815; scale-y: 0.788; }
        frame 12 { x: -1.6; y: -42.1; skew-x: -1.4; skew-y: -5.9; scale-x: 0.81; scale-y: 0.793; }
        frame 13 { x: -0.3; y: -42.5; skew-x: -1.7; skew-y: -6.4; scale-x: 0.804; scale-y: 0.799; }
        frame 14 { x: 0.6; y: -42.7; skew-x: -2.2; skew-y: -7.1; scale-x: 0.798; scale-y: 0.804; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: -0.7; y: -42.5; skew-x: -1.7; skew-y: -6.4; scale-x: 0.805; scale-y: 0.797; }
        frame 18 { x: -2.1; y: -42.1; skew-x: -1.2; skew-y: -5.7; scale-x: 0.812; scale-y: 0.791; }
        frame 19 { x: -3.6; y: -41.9; skew-x: -0.7; skew-y: -5.2; scale-x: 0.818; scale-y: 0.784; }
        frame 20 { x: -4.9; y: -41.6; skew-x: -0.2; skew-y: -4.4; scale-x: 0.825; scale-y: 0.778; }
        frame 21 { x: -6.5; y: -41.1; skew-x: 0; skew-y: -3.9; scale-x: 0.832; scale-y: 0.771; }
        frame 22 { x: -7.1; y: -40.3; skew-x: -10000; skew-y: -3; scale-x: 0.826; scale-y: 0.777; }
        frame 23 { x: -7.9; y: -39.4; skew-y: -2.2; scale-x: 0.819; scale-y: 0.783; }
        frame 24 { x: -8.7; y: -38.5; skew-y: -1.4; scale-x: 0.813; scale-y: 0.788; }
        frame 25 { x: -9.4; y: -37.7; skew-y: -0.7; scale-x: 0.806; scale-y: 0.794; }
        frame 26 { x: -10.3; y: -36.8; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -6; y: -40.8; skew-x: 2.3; skew-y: -0.5; scale-x: 0.789; scale-y: 0.792; }
        frame 29 { x: -1.7; y: -44.8; skew-x: 4.8; skew-y: -1.2; scale-x: 0.778; scale-y: 0.785; }
        frame 30 { x: 2.3; y: -49; skew-x: 7.3; skew-y: -2.1; scale-x: 0.768; scale-y: 0.777; }
        frame 31 { x: 11.2; y: -54.2; skew-x: 9.8; skew-y: 3.5; scale-x: 0.778; scale-y: 0.784; }
        frame 32 { x: 20.6; y: -58.8; skew-x: 12.3; skew-y: 9.3; scale-x: 0.789; scale-y: 0.792; }
        frame 33 { x: 29.9; y: -63; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 24.8; y: -59.2; skew-x: 12.8; skew-y: 13.8; scale-x: 0.799; }
        frame 40 { x: 20.1; y: -55.5; skew-x: 10.5; skew-y: 12.8; scale-x: -10000; }
        frame 41 { x: 15.2; y: -51.6; skew-x: 8.3; skew-y: 11.8; scale-y: 0.801; }
        frame 42 { x: 10.4; y: -48; skew-x: 6.3; skew-y: 10.7; scale-x: 0.8; scale-y: 0.802; }
        frame 43 { x: 3.4; y: -44.5; skew-x: 4.1; skew-y: 7; scale-x: -10000; scale-y: 0.801; }
        frame 44 { x: -3.3; y: -40.8; skew-x: 2; skew-y: 3.5; scale-y: 0.8; }
        frame 45 { x: -10.3; y: -36.8; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 46 { x: 36.1; y: -62.3; skew-x: 20.3; skew-y: 20.3; scale-x: 0.799; scale-y: 0.799; }
        frame 47 { x: 36.8; y: -63.7; skew-x: -10000; skew-y: -10000; scale-x: 0.785; scale-y: 0.802; }
        frame 48 { x: 37.5; y: -65.4; scale-x: 0.772; scale-y: 0.807; }
        frame 49 { x: 37; y: -64.2; scale-x: 0.78; scale-y: 0.804; }
        frame 50 { x: 36.6; y: -63.3; scale-x: 0.789; scale-y: 0.801; }
        frame 51 { x: 36.1; y: -62.3; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 36.8; y: -63.7; scale-x: 0.785; scale-y: 0.802; }
        frame 58 { x: 37.5; y: -65.4; scale-x: 0.772; scale-y: 0.807; }
        frame 59 { x: 37.2; y: -64.8; scale-x: 0.777; scale-y: 0.805; }
        frame 60 { x: 36.9; y: -64; scale-x: 0.782; scale-y: 0.803; }
        frame 61 { x: 36.8; y: -63.5; scale-x: 0.787; scale-y: 0.802; }
        frame 62 { x: 36.5; y: -62.8; scale-x: 0.793; scale-y: 0.8; }
        frame 63 { x: 36.1; y: -62.3; scale-x: 0.799; scale-y: 0.799; }
        frame 64 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: -10.3; y: -36.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: -1; y: -42.6; skew-x: 1.3; skew-y: 0.8; scale-x: 0.792; scale-y: 0.81; }
        frame 69 { x: 8.5; y: -48.4; skew-x: 2.8; skew-y: 1.8; scale-x: 0.785; scale-y: 0.82; }
        frame 70 { x: 18.2; y: -53.9; skew-x: 4.3; skew-y: 3; scale-x: 0.778; scale-y: 0.83; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 20.2; y: -53.3; skew-x: 4.5; skew-y: 3.5; scale-x: 0.784; scale-y: 0.819; }
        frame 74 { x: 22; y: -52.8; skew-x: 4.8; skew-y: 4.3; scale-x: 0.791; scale-y: 0.809; }
        frame 75 { x: 24.1; y: -52.4; skew-x: 5; skew-y: 5; scale-x: 0.798; scale-y: 0.798; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 18.2; y: -49.7; skew-x: 4.1; skew-y: 4.1; }
        frame 84 { x: 12.5; y: -47.1; skew-x: 3.3; skew-y: 3.3; scale-x: 0.799; scale-y: 0.799; }
        frame 85 { x: 6.8; y: -44.6; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 1.1; y: -42; skew-x: 1.5; skew-y: 1.5; }
        frame 87 { x: -4.7; y: -39.4; skew-x: 0.8; skew-y: 0.8; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -10.3; y: -36.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 90 { x: -8.5; y: -37.7; skew-y: 0.5; scale-x: 0.797; scale-y: 0.802; }
        frame 91 { x: -6.8; y: -38.9; skew-x: 0.3; skew-y: 1; scale-x: 0.794; scale-y: 0.804; }
        frame 92 { x: -5; y: -39.9; skew-x: 0.5; skew-y: 1.5; scale-x: 0.791; scale-y: 0.807; }
        frame 93 { x: -3.4; y: -40.8; skew-x: 0.6; skew-y: 2; scale-x: 0.787; scale-y: 0.809; }
        frame 94 { x: -1.5; y: -41.8; skew-x: 0.8; skew-y: 2.6; scale-x: 0.784; scale-y: 0.811; }
        frame 95 { x: 0.2; y: -42.9; skew-x: 1.1; skew-y: 3.3; scale-x: 0.781; scale-y: 0.814; }
        frame 96 { x: -4.8; y: -37.9; skew-x: 1; skew-y: 1.8; scale-x: 0.79; scale-y: 0.797; }
        frame 97 { x: -9.9; y: -33; skew-x: -10000; skew-y: 0.3; scale-x: 0.799; scale-y: 0.781; }
        frame 98 { x: -14.9; y: -28.1; skew-x: 1.1; skew-y: -1; scale-x: 0.809; scale-y: 0.765; }
        frame 99 { x: -13.7; y: -30.3; skew-x: 0.8; skew-y: -0.7; scale-x: 0.806; scale-y: 0.774; }
        frame 100 { x: -12.6; y: -32.5; skew-x: 0.5; skew-y: -0.4; scale-x: 0.804; scale-y: 0.782; }
        frame 101 { x: -11.5; y: -34.7; skew-x: 0.3; skew-y: -0.2; scale-x: 0.802; scale-y: 0.791; }
        frame 102 { x: -10.3; y: -36.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 103 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: -8.5; y: -37.7; skew-y: 0.5; scale-x: 0.797; scale-y: 0.802; }
        frame 106 { x: -6.8; y: -38.9; skew-x: 0.3; skew-y: 1; scale-x: 0.794; scale-y: 0.804; }
        frame 107 { x: -5; y: -39.9; skew-x: 0.5; skew-y: 1.5; scale-x: 0.791; scale-y: 0.807; }
        frame 108 { x: -3.4; y: -40.8; skew-x: 0.6; skew-y: 2; scale-x: 0.787; scale-y: 0.809; }
        frame 109 { x: -1.5; y: -41.8; skew-x: 0.8; skew-y: 2.6; scale-x: 0.784; scale-y: 0.811; }
        frame 110 { x: 0.2; y: -42.9; skew-x: 1.1; skew-y: 3.3; scale-x: 0.781; scale-y: 0.814; }
        frame 111 { x: -4.8; y: -37.9; skew-x: 1; skew-y: 1.8; scale-x: 0.79; scale-y: 0.797; }
        frame 112 { x: -9.9; y: -33; skew-x: -10000; skew-y: 0.3; scale-x: 0.799; scale-y: 0.781; }
        frame 113 { x: -14.9; y: -28.1; skew-x: 1.1; skew-y: -1; scale-x: 0.809; scale-y: 0.765; }
        frame 114 { x: -13.7; y: -30.3; skew-x: 0.8; skew-y: -0.7; scale-x: 0.806; scale-y: 0.774; }
        frame 115 { x: -12.6; y: -32.5; skew-x: 0.5; skew-y: -0.4; scale-x: 0.804; scale-y: 0.782; }
        frame 116 { x: -11.5; y: -34.7; skew-x: 0.3; skew-y: -0.2; scale-x: 0.802; scale-y: 0.791; }
        frame 117 { x: -10.3; y: -36.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 118 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 120 { cel: -1; }
        frame 121 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerhand";
        frame-count: 164;
        frame 0 { x: 17.4; y: 40; skew-x: 90; skew-y: 90; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_OUTERHAND; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 19.7; y: 38.9; skew-x: 86.2; skew-y: 86.2; }
        frame 4 { x: 22.1; y: 37.7; skew-x: 82.5; skew-y: 82.5; }
        frame 5 { x: 24.4; y: 36.8; skew-x: 78.7; skew-y: 78.7; scale-x: 0.799; scale-y: 0.799; }
        frame 6 { x: 26.6; y: 35.8; skew-x: 75; skew-y: 75; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 29; y: 34.9; skew-x: 71.2; skew-y: 71.2; }
        frame 8 { x: 31.2; y: 34; skew-x: 67.5; skew-y: 67.5; scale-x: 0.8; scale-y: 0.8; }
        frame 9 { x: 32.8; y: 33.5; skew-x: 63.7; skew-y: 63.7; scale-x: 0.799; scale-y: 0.799; }
        frame 10 { x: 34.3; y: 33; skew-x: 60; skew-y: 60; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 35.9; y: 32.5; skew-x: 56.2; skew-y: 56.2; }
        frame 12 { x: 37.4; y: 32.1; skew-x: 52.4; skew-y: 52.4; }
        frame 13 { x: 39; y: 31.8; skew-x: 48.7; skew-y: 48.7; }
        frame 14 { x: 40.5; y: 31.6; skew-x: 45; skew-y: 45; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 38.5; y: 31.9; skew-x: 49.4; skew-y: 49.4; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 36.8; y: 32.3; skew-x: 53.9; skew-y: 53.9; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 34.9; y: 32.8; skew-x: 58.4; skew-y: 58.4; }
        frame 20 { x: 33; y: 33.4; skew-x: 63; skew-y: 63; }
        frame 21 { x: 31.2; y: 34; skew-x: 67.5; skew-y: 67.5; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 28.5; y: 35.1; skew-x: 72; skew-y: 72; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 25.7; y: 36.1; skew-x: 76.5; skew-y: 76.5; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 23; y: 37.3; skew-x: 81; skew-y: 81; scale-x: 0.8; scale-y: 0.8; }
        frame 25 { x: 20.2; y: 38.5; skew-x: 85.5; skew-y: 85.5; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 17.4; y: 40; skew-x: 90; skew-y: 90; }
        frame 27 { x: 25.1; y: 62; skew-x: 0; skew-y: 0; }
        frame 28 { x: 32.3; y: 58.3; skew-x: -10000; skew-y: -10000; }
        frame 29 { x: 39.5; y: 54.5; }
        frame 30 { x: 46.6; y: 50.7; }
        frame 31 { x: 51.6; y: 45.6; }
        frame 32 { x: 56.7; y: 40.5; }
        frame 33 { x: 61.7; y: 35.4; }
        frame 34 { x: -10000; y: -10000; }
        frame 39 { x: 57.8; y: 39.9; }
        frame 40 { x: 53.8; y: 44.3; }
        frame 41 { x: 49.8; y: 48.7; }
        frame 42 { x: 45.8; y: 53.1; }
        frame 43 { x: 38.9; y: 56; }
        frame 44 { x: 32; y: 59; }
        frame 45 { x: 25.1; y: 62; }
        frame 46 { x: -10000; y: -10000; cel: -1; }
        frame 47 { cel: -10000; }
        frame 89 { cel: 0; }
        frame 90 { x: 19.9; y: 47.7; skew-x: 38.1; skew-y: 38.1; scale-x: 0.797; scale-y: 0.797; cel: -10000; }
        frame 91 { x: 17.7; y: 39.3; skew-x: 76.2; skew-y: 76.2; scale-x: 0.796; scale-y: 0.796; }
        frame 92 { x: 23.1; y: 36.5; skew-x: 85.5; skew-y: 85.5; scale-x: 0.797; scale-y: 0.797; }
        frame 93 { x: 28.4; y: 34; skew-x: 94.5; skew-y: 94.5; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 33.4; y: 31.8; skew-x: 103.6; skew-y: 103.6; }
        frame 95 { x: 38.3; y: 30.2; skew-x: 112.8; skew-y: 112.8; }
        frame 96 { x: 35.1; y: 32.5; skew-x: 116.3; skew-y: 116.3; scale-x: 0.796; scale-y: 0.796; }
        frame 97 { x: 31.8; y: 35; skew-x: 119.8; skew-y: 119.8; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 28.4; y: 37.4; skew-x: 123.4; skew-y: 123.4; scale-x: 0.797; scale-y: 0.797; }
        frame 99 { x: 28.7; y: 37; skew-x: 102.8; skew-y: 102.8; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 27.9; y: 38.2; skew-x: 82.4; skew-y: 82.4; scale-x: 0.798; scale-y: 0.798; }
        frame 101 { x: 26.4; y: 41.4; skew-x: 61.7; skew-y: 61.7; scale-x: 0.797; scale-y: 0.797; }
        frame 102 { x: 25; y: 46.5; skew-x: 41.1; skew-y: 41.1; scale-x: 0.798; scale-y: 0.798; }
        frame 103 { x: 24.3; y: 53.5; skew-x: 20.5; skew-y: 20.5; scale-x: 0.799; scale-y: 0.799; }
        frame 104 { x: 25.1; y: 62; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 105 { x: 26; y: 61.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 27; y: 61.1; }
        frame 107 { x: 27.9; y: 60.8; }
        frame 108 { x: 28.8; y: 60.4; }
        frame 109 { x: 29.7; y: 59.9; }
        frame 110 { x: 30.6; y: 59.5; }
        frame 111 { x: 27.8; y: 62.5; }
        frame 112 { x: 25; y: 65.5; }
        frame 113 { x: 22.1; y: 68.5; }
        frame 114 { x: 22.9; y: 66.9; }
        frame 115 { x: 23.6; y: 65.3; }
        frame 116 { x: 24.4; y: 63.6; }
        frame 117 { x: 25.1; y: 62; }
        frame 118 { x: -10000; y: -10000; }
        frame 120 { cel: -1; }
        frame 121 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerhand_point";
        frame-count: 164;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 46 { x: 47.9; y: 25.1; skew-x: 86.5; skew-y: 86.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_DISCO_OUTERHAND_POINT; }
        frame 47 { x: 44.8; y: 22.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 48 { x: 41.7; y: 20.1; }
        frame 49 { x: 38.6; y: 21.3; }
        frame 50 { x: 35.5; y: 22.6; }
        frame 51 { x: 32.5; y: 23.8; }
        frame 52 { x: 29.4; y: 25.1; }
        frame 53 { x: -10000; y: -10000; }
        frame 57 { x: 32; y: 23.9; }
        frame 58 { x: 34.6; y: 22.6; }
        frame 59 { x: 37.3; y: 21.4; }
        frame 60 { x: 39.9; y: 20.1; }
        frame 61 { x: 42.5; y: 21.7; }
        frame 62 { x: 45.2; y: 23.4; }
        frame 63 { x: 47.9; y: 25.1; }
        frame 64 { x: -10000; y: -10000; }
        frame 67 { x: 22.5; y: 63.6; skew-x: 0; skew-y: 0; }
        frame 68 { x: 15; y: 50; skew-x: 28.4; skew-y: 28.4; scale-x: 0.793; scale-y: 0.793; }
        frame 69 { x: 16.8; y: 29; skew-x: 59.4; skew-y: 59.4; scale-x: 0.792; scale-y: 0.792; }
        frame 70 { x: 20.3; y: 11.4; skew-x: 90.3; skew-y: 90.3; scale-x: 0.794; scale-y: 0.794; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 31.2; y: 14.9; }
        frame 74 { x: 42.2; y: 18.4; }
        frame 75 { x: 53.3; y: 21.9; }
        frame 76 { x: -10000; y: -10000; }
        frame 83 { x: 47; y: 27.7; skew-x: 75.4; skew-y: 75.4; }
        frame 84 { x: 40.9; y: 34.4; skew-x: 60.2; skew-y: 60.2; }
        frame 85 { x: 35; y: 41.9; skew-x: 45.1; skew-y: 45.1; scale-x: 0.796; scale-y: 0.796; }
        frame 86 { x: 30.5; y: 49.3; skew-x: 30.1; skew-y: 30.1; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 26.5; y: 57.3; skew-x: 15; skew-y: 15; scale-x: 0.798; scale-y: 0.798; }
        frame 88 { x: 22.5; y: 63.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 90 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerarm_upper";
        frame-count: 164;
        frame 0 { x: 38.2; y: 23; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_OUTERARM_UPPER; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 38.4; y: 22.9; skew-x: 8.8; skew-y: 8.6; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 38.5; y: 22.8; skew-x: 2.5; skew-y: 2.3; scale-x: 0.8; scale-y: 0.8; }
        frame 5 { x: 39; y: -10000; skew-x: -3.4; skew-y: -3.7; scale-x: 0.799; scale-y: 0.799; }
        frame 6 { x: 39.4; skew-x: -9.7; skew-y: -9.9; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 40; y: 22.9; skew-x: -15.9; skew-y: -16.2; }
        frame 8 { x: 40.6; y: 23.1; skew-x: -22.2; skew-y: -22.4; }
        frame 9 { x: 41.5; y: 24; skew-x: -28.5; skew-y: -28.7; scale-x: 0.798; scale-y: 0.798; }
        frame 10 { x: 42.5; y: 25; skew-x: -34.7; skew-y: -35; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 43.5; y: 25.9; skew-x: -41; skew-y: -41.2; }
        frame 12 { x: 44.8; y: 26.8; skew-x: -47.3; skew-y: -47.5; }
        frame 13 { x: 46.1; y: 27.6; skew-x: -53.6; skew-y: -53.8; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 47.5; y: 28.5; skew-x: -59.9; skew-y: -59.9; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 45.8; y: 27.5; skew-x: -52.3; skew-y: -52.5; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 44.3; y: 26.4; skew-x: -44.8; skew-y: -45; scale-x: 0.798; scale-y: 0.798; }
        frame 19 { x: 42.9; y: 25.4; skew-x: -37.3; skew-y: -37.5; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 41.7; y: 24.2; skew-x: -29.7; skew-y: -30; }
        frame 21 { x: 40.6; y: 23.1; skew-x: -22.2; skew-y: -22.4; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 39.9; y: 22.9; skew-x: -14.7; skew-y: -14.9; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 39.3; y: -10000; skew-x: -7.2; skew-y: -7.4; }
        frame 24 { x: 38.8; y: 22.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 25 { x: 38.5; y: -10000; skew-x: 7.5; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 26 { x: 38.2; y: 23; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: 38.5; y: 19.4; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 40.4; y: 20.7; skew-x: -14.9; skew-y: -14.9; scale-x: 0.799; scale-y: 0.799; }
        frame 29 { x: 42.9; y: 22; skew-x: -29.8; skew-y: -29.8; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 46; y: 23.3; skew-x: -44.9; skew-y: -44.9; scale-x: 0.8; scale-y: 0.8; }
        frame 31 { x: 50; y: 24.5; skew-x: -60; skew-y: -60; scale-x: 0.799; scale-y: 0.799; }
        frame 32 { x: 54.5; y: 25.2; skew-x: -74.9; skew-y: -74.9; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 59.7; y: 25.4; skew-x: -89.9; skew-y: -89.9; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 55.3; y: 25.3; skew-x: -77.1; skew-y: -77.1; scale-x: 0.799; scale-y: 0.799; }
        frame 40 { x: 51.3; y: 24.8; skew-x: -64.3; skew-y: -64.3; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 47.6; y: 23.9; skew-x: -51.3; skew-y: -51.3; }
        frame 42 { x: 44.5; y: 22.9; skew-x: -38.5; skew-y: -38.5; }
        frame 43 { x: 42; y: 21.6; skew-x: -25.5; skew-y: -25.5; }
        frame 44 { x: 40; y: 20.4; skew-x: -12.7; skew-y: -12.7; }
        frame 45 { x: 38.5; y: 19.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 46 { x: 49.5; y: 18.1; skew-x: -29.5; skew-y: -29.5; scale-x: 0.796; scale-y: 0.963; }
        frame 47 { x: 49.7; y: 14.2; skew-x: -21.7; skew-y: -21.7; scale-x: 0.795; scale-y: 0.962; }
        frame 48 { x: 50; y: 10.2; skew-x: -14.2; skew-y: -14.2; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 50.6; y: 10.1; skew-x: -6.5; skew-y: -6.5; scale-y: 0.961; }
        frame 50 { x: 51.3; y: 10; skew-x: 0.8; skew-y: 0.8; scale-y: -10000; }
        frame 51 { x: 52.2; y: -10000; skew-x: 8.3; skew-y: 8.3; scale-x: 0.794; }
        frame 52 { x: 53.4; y: 10.1; skew-x: 16.1; skew-y: 16.1; scale-x: -10000; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 57 { x: 52.4; y: 9.8; skew-x: 9.5; skew-y: 9.5; }
        frame 58 { x: 51.8; y: 9.6; skew-x: 3; skew-y: 3; scale-x: 0.795; }
        frame 59 { x: 51; y: 9.3; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; }
        frame 60 { x: 50.4; y: -10000; skew-x: -9.9; skew-y: -9.9; scale-y: 0.962; }
        frame 61 { x: 50; y: 12.1; skew-x: -16.4; skew-y: -16.4; scale-y: -10000; }
        frame 62 { x: 49.6; y: 15; skew-x: -22.9; skew-y: -22.9; }
        frame 63 { x: 49.5; y: 18.1; skew-x: -29.5; skew-y: -29.5; scale-x: 0.796; scale-y: 0.963; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 38.5; y: 19.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: 46.4; y: 14.4; skew-x: 24.3; skew-y: 24.3; scale-x: 0.797; scale-y: 0.797; }
        frame 69 { x: 55.4; y: 12.1; skew-x: 48.9; skew-y: 48.9; scale-x: 0.795; scale-y: 0.795; }
        frame 70 { x: 65.1; y: 12; skew-x: 73.4; skew-y: 73.4; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 60; y: 12.8; skew-x: 51.4; skew-y: 51.4; scale-x: 0.793; scale-y: 0.613; }
        frame 74 { x: 53.4; y: 19.6; skew-x: -4.4; skew-y: 0.4; scale-x: 0.794; scale-y: 0.55; }
        frame 75 { x: 54.3; y: 29.2; skew-x: -60.3; skew-y: -60.3; scale-x: 0.795; scale-y: 0.727; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 50.9; y: 27.7; skew-x: -50.3; skew-y: -50.3; scale-y: 0.738; }
        frame 84 { x: 47.8; y: 26.2; skew-x: -40.2; skew-y: -40.2; scale-y: 0.75; }
        frame 85 { x: 45; y: 24.5; skew-x: -30; skew-y: -30; scale-x: 0.796; scale-y: 0.763; }
        frame 86 { x: 42.5; y: 22.8; skew-x: -20; skew-y: -20; scale-x: 0.798; scale-y: 0.775; }
        frame 87 { x: 40.5; y: 21.2; skew-x: -9.9; skew-y: -9.9; scale-x: 0.799; scale-y: 0.787; }
        frame 88 { x: 38.5; y: 19.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 40.5; y: 17.6; skew-x: 15.1; skew-y: 15.1; scale-x: 0.798; scale-y: 0.798; }
        frame 91 { x: 43.2; y: 16.4; skew-x: 30.3; skew-y: 30.3; scale-x: 0.797; scale-y: 0.797; }
        frame 92 { x: 42.8; y: 16.2; skew-x: 19.8; skew-y: 19.8; scale-x: 0.796; scale-y: 0.796; }
        frame 93 { x: 42.5; y: 15.9; skew-x: 9.5; skew-y: 9.5; scale-x: 0.797; scale-y: 0.797; }
        frame 94 { x: -10000; y: 16.1; skew-x: -0.7; skew-y: -0.7; scale-x: 0.798; scale-y: 0.798; }
        frame 95 { x: 42.7; y: 16.4; skew-x: -11.2; skew-y: -11.2; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 41.9; y: 17.8; skew-x: -0.2; skew-y: -0.2; scale-x: 0.797; scale-y: 0.797; }
        frame 97 { x: 41.3; y: 19.4; skew-x: 10.3; skew-y: 10.3; scale-x: 0.796; scale-y: 0.796; }
        frame 98 { x: 41.1; y: 21.2; skew-x: 21.3; skew-y: 21.3; scale-x: 0.797; scale-y: 0.797; }
        frame 99 { x: 40.5; y: 20.9; skew-x: 17.8; skew-y: 17.8; scale-x: 0.796; scale-y: 0.796; }
        frame 100 { x: 40.1; y: 20.6; skew-x: 14.1; skew-y: 14.1; scale-x: 0.797; scale-y: 0.797; }
        frame 101 { x: 39.7; y: 20.2; skew-x: 10.5; skew-y: 10.5; scale-x: 0.798; scale-y: 0.798; }
        frame 102 { x: 39.4; y: 19.9; skew-x: 7; skew-y: 7; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 39; y: 19.7; skew-x: 3.5; skew-y: 3.5; scale-x: 0.799; scale-y: 0.799; }
        frame 104 { x: 38.5; y: 19.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 105 { x: 39.5; y: 19; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 40.4; y: 18.5; }
        frame 107 { x: 41.3; y: 18.1; }
        frame 108 { x: 42.2; y: 17.7; }
        frame 109 { x: 43.1; y: 17.3; }
        frame 110 { x: 44; y: 16.9; }
        frame 111 { x: 41.2; y: 19.9; }
        frame 112 { x: 38.4; y: 22.9; }
        frame 113 { x: 35.5; y: 25.9; }
        frame 114 { x: 36.3; y: 24.3; }
        frame 115 { x: 37; y: 22.6; }
        frame 116 { x: 37.8; y: 21; }
        frame 117 { x: 38.5; y: 19.4; }
        frame 118 { x: -10000; y: -10000; }
        frame 120 { cel: -1; }
        frame 121 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerarm_upper_bone";
        frame-count: 164;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 120 { x: 50.8; y: 17.5; skew-x: -9.7; skew-y: -9.7; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_DISCO_OUTERARM_UPPER_BONE; }
        frame 121 { x: 53; y: 17.1; skew-x: -7.9; skew-y: -7.9; scale-x: 0.799; scale-y: 0.799; cel: -10000; image: none; }
        frame 122 { x: 55; y: 16.8; skew-x: -6.5; skew-y: -6.5; scale-x: -10000; scale-y: -10000; }
        frame 123 { x: 56.7; y: 16.7; skew-x: -5.2; skew-y: -5.2; }
        frame 124 { x: 58.1; y: 16.5; skew-x: -4.2; skew-y: -4.2; }
        frame 125 { x: 59.3; y: 16.3; skew-x: -3.4; skew-y: -3.4; }
        frame 126 { x: 60.3; y: -10000; skew-x: -2.7; skew-y: -2.7; }
        frame 127 { x: 60.9; y: 16.2; skew-x: -2.2; skew-y: -2.2; }
        frame 128 { x: 61.3; y: 16; skew-x: -1.9; skew-y: -1.9; }
        frame 129 { x: 61.4; y: 16.1; skew-x: -10000; skew-y: -10000; }
        frame 130 { x: 58.3; y: 16.6; skew-x: -5.4; skew-y: -5.4; }
        frame 131 { x: 55.5; y: 17.4; skew-x: -8.7; skew-y: -8.7; }
        frame 132 { x: 53.1; y: 17.9; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 133 { x: 51; y: 18.3; skew-x: -14; skew-y: -14; scale-x: -10000; scale-y: -10000; }
        frame 134 { x: 49.4; y: 18.7; skew-x: -16.2; skew-y: -16.2; }
        frame 135 { x: 48; y: 19.1; skew-x: -17.9; skew-y: -17.9; }
        frame 136 { x: 47; y: 19.3; skew-x: -19.2; skew-y: -19.2; }
        frame 137 { x: 46.1; y: 19.5; skew-x: -20.2; skew-y: -20.2; }
        frame 138 { x: 45.8; y: 19.6; skew-x: -20.7; skew-y: -20.7; }
        frame 139 { x: 45.5; y: -10000; skew-x: -21; skew-y: -21; }
        frame 140 { x: 46.2; y: 19.5; skew-x: -20.2; skew-y: -20.2; }
        frame 141 { x: 48.3; y: 19.2; skew-x: -18.4; skew-y: -18.4; }
        frame 142 { x: 51.7; y: 18.8; skew-x: -15.2; skew-y: -15.2; }
        frame 143 { x: 56.6; y: 18.3; skew-x: -10.7; skew-y: -10.7; }
        frame 144 { x: 63; y: 17.7; skew-x: -5.2; skew-y: -5.2; }
        frame 145 { x: 70.8; y: 16.9; skew-x: 1.6; skew-y: 1.6; }
        frame 146 { x: 80.5; y: 16.1; skew-x: 9.8; skew-y: 9.8; }
        frame 147 { x: 91.6; y: 15.3; skew-x: 19.3; skew-y: 19.3; scale-x: 0.797; scale-y: 0.797; }
        frame 148 { x: 104.6; y: 14.6; skew-x: 30.1; skew-y: 30.1; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 119.5; y: 14.3; skew-x: 42.3; skew-y: 42.3; scale-x: 0.798; scale-y: 0.798; }
        frame 150 { x: 146.6; y: 31.3; skew-x: 60.2; skew-y: 60.2; scale-x: 0.796; scale-y: 0.796; }
        frame 151 { x: 173.6; y: 49.5; skew-x: 78; skew-y: 78; scale-x: -10000; scale-y: -10000; }
        frame 152 { x: 187.7; y: 76.7; skew-x: 95.6; skew-y: 95.6; }
        frame 153 { x: 201.2; y: 104.8; skew-x: 113.4; skew-y: 113.4; }
        frame 154 { x: 199.3; y: 103.1; skew-x: 99.5; skew-y: 99.5; scale-x: 0.795; scale-y: 0.795; }
        frame 155 { x: 197.1; y: 102.1; skew-x: 85.9; skew-y: 85.9; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 194.6; y: 101.5; skew-x: 72; skew-y: 72; scale-x: 0.794; scale-y: 0.794; }
        frame 157 { x: 192; y: -10000; skew-x: 58.1; skew-y: 58.1; scale-x: 0.795; scale-y: 0.795; }
        frame 158 { x: 192.7; y: 101.4; skew-x: 62.2; skew-y: 62.2; scale-x: 0.793; scale-y: 0.793; }
        frame 159 { x: 193.4; y: -10000; skew-x: 66.2; skew-y: 66.2; scale-x: 0.792; scale-y: 0.792; }
        frame 160 { x: 194.2; y: 101.5; skew-x: 70.1; skew-y: 70.1; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 193.5; y: -10000; skew-x: 66.2; skew-y: 66.2; }
        frame 162 { x: 192.8; y: 101.6; skew-x: 62.2; skew-y: 62.2; scale-x: 0.793; scale-y: 0.793; }
        frame 163 { x: 192; y: 101.5; skew-x: 58.1; skew-y: 58.1; scale-x: 0.795; scale-y: 0.795; }
    }
    Track {
        source-name: "Zombie_disco_outerarm_lower";
        frame-count: 164;
        frame 0 { x: 32.2; y: 32.3; skew-x: 60; skew-y: 60; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_OUTERARM_LOWER; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 35; y: 31.4; skew-x: 57.2; skew-y: 59.4; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 37.9; y: 30.7; skew-x: 54.2; skew-y: 58.9; scale-x: -10000; scale-y: 0.8; }
        frame 5 { x: 40.8; y: 29.8; skew-x: 51.3; skew-y: 58.3; scale-x: 0.801; scale-y: 0.801; }
        frame 6 { x: 43.1; y: 28.5; skew-x: 51.7; skew-y: 56.4; scale-x: 0.799; scale-y: 0.799; }
        frame 7 { x: 45.6; y: 27.1; skew-x: 52.2; skew-y: 54.4; scale-x: 0.798; scale-y: 0.798; }
        frame 8 { x: 48; y: 25.7; skew-x: 52.6; skew-y: 52.4; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 49.9; y: 24.8; skew-x: 46.4; skew-y: 51.6; scale-x: 0.806; scale-y: 0.797; }
        frame 10 { x: 51.8; y: 24; skew-x: 40.4; skew-y: 50.7; scale-x: 0.816; scale-y: 0.798; }
        frame 11 { x: 53.5; y: 22.8; skew-x: 37.9; skew-y: 48.9; scale-x: -10000; scale-y: 0.796; }
        frame 12 { x: 55.2; y: 21.7; skew-x: 35.6; skew-y: 46.9; scale-x: 0.818; scale-y: 0.795; }
        frame 13 { x: 56.9; y: 20.7; skew-x: 33.1; skew-y: 44.9; scale-x: 0.821; scale-y: 0.794; }
        frame 14 { x: 58.5; y: 19.7; skew-x: 30.7; skew-y: 43; scale-x: 0.824; scale-y: 0.795; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 56.3; y: 20.9; skew-x: 33.8; skew-y: 44.9; scale-x: 0.818; scale-y: 0.794; }
        frame 18 { x: 54.2; y: 22; skew-x: 37.1; skew-y: 46.9; scale-x: 0.814; scale-y: 0.795; }
        frame 19 { x: 52; y: 23.2; skew-x: 40.3; skew-y: 48.6; scale-x: 0.81; scale-y: 0.796; }
        frame 20 { x: 50; y: 24.4; skew-x: 43.4; skew-y: 50.6; scale-x: 0.806; scale-y: 0.797; }
        frame 21 { x: 48; y: 25.7; skew-x: 46.6; skew-y: 52.4; scale-x: 0.803; scale-y: 0.799; }
        frame 22 { x: 45; y: 27.4; skew-x: 48.9; skew-y: 54.9; scale-x: 0.801; scale-y: 0.798; }
        frame 23 { x: 42.1; y: 29; skew-x: 51.4; skew-y: 57.2; scale-x: 0.8; scale-y: 0.799; }
        frame 24 { x: 39.1; y: 30.6; skew-x: 53.6; skew-y: 59.4; scale-x: 0.801; scale-y: 0.8; }
        frame 25 { x: 35.8; y: 31.4; skew-x: 56.9; skew-y: 59.7; scale-x: 0.799; scale-y: 0.799; }
        frame 26 { x: 32.2; y: 32.3; skew-x: 60; skew-y: 60; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: 29.1; y: 43.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 36.5; y: 39.2; skew-x: -10000; skew-y: -10000; }
        frame 29 { x: 44; y: 35; }
        frame 30 { x: 51.4; y: 30.7; }
        frame 31 { x: 56.1; y: 25.6; skew-x: -2.2; scale-x: 0.802; }
        frame 32 { x: 61; y: 20.6; skew-x: -4.4; scale-x: 0.804; }
        frame 33 { x: 65.7; y: 15.4; skew-x: -6.9; scale-x: 0.806; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 39 { x: 61.8; y: 20; skew-x: -5; scale-x: 0.804; }
        frame 40 { x: 57.7; y: 24.6; skew-x: -3.2; scale-x: 0.803; }
        frame 41 { x: 53.8; y: 29.2; skew-x: -1.5; scale-x: 0.801; }
        frame 42 { x: 49.8; y: 34; skew-x: 0; scale-x: 0.8; }
        frame 43 { x: 42.9; y: 37.1; skew-x: -10000; scale-x: -10000; }
        frame 44 { x: 36; y: 40.3; }
        frame 45 { x: 29.1; y: 43.5; }
        frame 46 { x: 68.3; y: 22.1; skew-x: 69.9; skew-y: 69.9; scale-x: 0.799; scale-y: 0.799; }
        frame 47 { x: 65.4; y: 19.8; skew-x: 68.5; skew-y: 70.4; scale-x: -10000; scale-y: 0.798; }
        frame 48 { x: 62.4; y: 17.4; skew-x: 67; skew-y: 70.8; scale-x: 0.8; scale-y: -10000; }
        frame 49 { x: 59.4; y: 18.8; skew-x: 67.7; skew-y: 71.2; scale-x: 0.799; }
        frame 50 { x: 56.4; y: 20.3; skew-x: 68.5; skew-y: 71.5; scale-x: -10000; }
        frame 51 { x: 53.4; y: 21.7; skew-x: 69.2; skew-y: 71.7; scale-x: 0.798; scale-y: 0.799; }
        frame 52 { x: 50.3; y: 23.1; skew-x: 69.9; skew-y: 72; scale-x: 0.799; scale-y: 0.8; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 50.2; y: 22.9; skew-y: 71.7; }
        frame 57 { x: 52.9; y: 21.6; skew-x: 69.7; skew-y: 71.9; scale-x: 0.798; scale-y: 0.799; }
        frame 58 { x: 55.6; y: 20.4; skew-x: 69.4; skew-y: 72; scale-x: -10000; scale-y: 0.798; }
        frame 59 { x: 58.1; y: 19.1; skew-x: 69; skew-y: -10000; scale-y: -10000; }
        frame 60 { x: 60.9; y: 18; skew-x: 68.7; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: 63.4; y: 19; skew-x: 67.7; skew-y: 70.4; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: 65.8; y: 19.9; skew-x: 66.7; skew-y: 68.7; scale-x: -10000; scale-y: 0.799; }
        frame 63 { x: 67.9; y: 20.7; skew-x: 65.6; skew-y: 67; scale-y: 0.8; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 67 { x: 29.1; y: 43.5; skew-x: 0; skew-y: 0; scale-x: 0.8; }
        frame 68 { x: 27.1; y: 34; skew-x: 18.3; skew-y: 18.3; scale-x: 0.798; scale-y: 0.798; }
        frame 69 { x: 32.5; y: 20.9; skew-x: 44.8; skew-y: 44.8; scale-x: 0.796; scale-y: 0.796; }
        frame 70 { x: 40.1; y: 10.5; skew-x: 71.2; skew-y: 71.2; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 50; y: 12.3; skew-x: 67.7; skew-y: 69.5; scale-x: 0.799; scale-y: 0.792; }
        frame 74 { x: 59.9; y: 14.1; skew-x: 63.9; skew-y: 67.7; scale-x: 0.804; scale-y: 0.789; }
        frame 75 { x: 69.8; y: 15.9; skew-x: 60.3; skew-y: 65.8; scale-x: 0.809; scale-y: 0.787; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 69.9; y: 16.1; skew-y: 66.4; scale-y: 0.788; }
        frame 83 { x: 62.8; y: 20; skew-x: 51.1; skew-y: 55.7; scale-x: 0.805; scale-y: 0.789; }
        frame 84 { x: 55.8; y: 24.1; skew-x: 41.8; skew-y: 44.9; scale-x: 0.802; scale-y: 0.791; }
        frame 85 { x: 49; y: 28.7; skew-x: 32.6; skew-y: 34.1; scale-x: 0.799; scale-y: 0.794; }
        frame 86 { x: 42.7; y: 33.6; skew-x: 23.3; skew-y: 23.3; scale-x: 0.798; scale-y: 0.798; }
        frame 87 { x: 35.6; y: 38.4; skew-x: 11.5; skew-y: 11.5; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 29.1; y: 43.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 27.2; y: 35.2; skew-x: 23; skew-y: 22.1; scale-x: 0.797; scale-y: 0.812; }
        frame 91 { x: 27.6; y: 28.1; skew-x: 46.1; skew-y: 44.3; scale-x: -10000; scale-y: 0.826; }
        frame 92 { x: 33.4; y: 26.7; skew-x: 48.6; skew-y: 50.6; scale-y: 0.819; }
        frame 93 { x: 39; y: 25.2; skew-x: 50.9; skew-y: 56.8; scale-x: 0.8; scale-y: 0.814; }
        frame 94 { x: 44; y: 23; skew-x: 53.2; skew-y: 60.9; scale-x: 0.801; scale-y: 0.806; }
        frame 95 { x: 49; y: 20.8; skew-x: 55.5; skew-y: 65; scale-x: 0.805; scale-y: 0.799; }
        frame 96 { x: 45.9; y: 23.1; skew-x: 62.2; skew-y: 67.7; scale-x: 0.801; scale-y: 0.798; }
        frame 97 { x: 42.8; y: 25.5; skew-x: 68.9; skew-y: 70.2; scale-x: 0.798; scale-y: 0.797; }
        frame 98 { x: 39.6; y: 28.1; skew-x: 75.6; skew-y: 72.7; scale-x: 0.796; scale-y: -10000; }
        frame 99 { x: 36.7; y: 29.1; skew-x: 63; skew-y: 60.7; scale-x: -10000; scale-y: 0.796; }
        frame 100 { x: 34.1; y: 30.8; skew-x: 50.4; skew-y: 48.4; scale-y: 0.797; }
        frame 101 { x: 31.9; y: 33.1; skew-x: 37.8; skew-y: 36.3; scale-x: 0.797; scale-y: -10000; }
        frame 102 { x: 30.3; y: 36.1; skew-x: 25.1; skew-y: 24.1; scale-x: 0.798; scale-y: 0.798; }
        frame 103 { x: 29.3; y: 39.6; skew-x: 12.5; skew-y: 12; scale-x: 0.799; scale-y: 0.799; }
        frame 104 { x: 29.1; y: 43.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 105 { x: 30; y: 43; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 31; y: 42.6; }
        frame 107 { x: 31.9; y: 42.2; }
        frame 108 { x: 32.8; y: 41.8; }
        frame 109 { x: 33.7; y: 41.4; }
        frame 110 { x: 34.6; y: 41; }
        frame 111 { x: 31.8; y: 44; }
        frame 112 { x: 29; y: 47; }
        frame 113 { x: 26.1; y: 50; }
        frame 114 { x: 26.9; y: 48.4; }
        frame 115 { x: 27.6; y: 46.7; }
        frame 116 { x: 28.4; y: 45.1; }
        frame 117 { x: 29.1; y: 43.5; }
        frame 118 { x: -10000; y: -10000; }
        frame 120 { cel: -1; }
        frame 121 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_collar_overlay";
        frame-count: 164;
        frame 0 { x: 31.2; y: 15.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_COLLAR_OVERLAY; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 32.3; y: 14.5; skew-x: 1.1; skew-y: 1.1; }
        frame 4 { x: 33.4; y: 13.5; skew-x: 2.3; skew-y: 2.3; }
        frame 5 { x: 34.5; y: 12.6; skew-x: 3.5; skew-y: 3.5; }
        frame 6 { x: 35.7; y: 11.8; skew-x: 4.8; skew-y: 4.8; }
        frame 7 { x: 36.8; y: 10.8; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 37.9; y: 10; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 9 { x: 39; y: 9.9; skew-x: 8.5; skew-y: 8.5; scale-x: 0.799; scale-y: 0.799; }
        frame 10 { x: 40.1; y: 9.8; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 41.3; y: -10000; skew-x: 11; skew-y: 11; }
        frame 12 { x: 42.4; skew-x: 12.3; skew-y: 12.3; }
        frame 13 { x: 43.5; y: 9.7; skew-x: 13.6; skew-y: 13.6; }
        frame 14 { x: 44.8; y: 9.6; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 43.4; y: 9.7; skew-x: 13.3; skew-y: 13.3; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 42; y: 9.8; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 40.6; y: -10000; skew-x: 10.3; skew-y: 10.3; }
        frame 20 { x: 39.3; skew-x: 8.8; skew-y: 8.8; }
        frame 21 { x: 37.9; y: 10; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 36.6; y: 11; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 35.2; y: 12.2; skew-x: 4.3; skew-y: 4.3; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: 33.9; y: 13.2; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 32.5; y: 14.2; skew-x: 1.3; skew-y: 1.3; }
        frame 26 { x: 31.2; y: 15.3; skew-x: 0; skew-y: 0; }
        frame 27 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 28 { x: 34.1; y: 13.1; skew-x: 2.5; skew-y: 2.5; }
        frame 29 { x: 37; y: 11; skew-x: 4.8; skew-y: 4.8; }
        frame 30 { x: 40; y: 8.9; skew-x: 7.3; skew-y: 7.3; }
        frame 31 { x: 42.9; y: 6.6; skew-x: 9.8; skew-y: 9.8; }
        frame 32 { x: 45.9; y: 4.6; skew-x: 12.3; skew-y: 12.3; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 49; y: 2.4; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 46.5; y: 4.2; skew-x: 12.8; skew-y: 12.8; scale-x: 0.799; scale-y: 0.799; }
        frame 40 { x: 43.9; y: 6; skew-x: 10.6; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 41.4; y: 7.9; skew-x: 8.5; skew-y: 8.5; scale-x: 0.8; scale-y: 0.8; }
        frame 42 { x: 38.8; y: 9.7; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 36.3; y: 11.6; skew-x: 4.3; skew-y: 4.3; }
        frame 44 { x: 33.8; y: 13.5; skew-x: 2; skew-y: 2; }
        frame 45 { x: 31.2; y: 15.3; skew-x: 0; skew-y: 0; }
        frame 46 { x: 50; y: 4.7; skew-x: 26.1; skew-y: 26.1; scale-x: 0.799; scale-y: 0.799; }
        frame 47 { x: -10000; y: 2.2; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 48 { x: 50.1; y: -0.2; scale-x: 0.798; scale-y: 0.798; }
        frame 49 { x: -10000; y: 2.3; skew-x: 26; skew-y: 26; scale-x: 0.797; scale-y: 0.797; }
        frame 50 { x: 50; y: 4.7; skew-x: 26.1; skew-y: 26.1; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { y: 2.2; scale-x: 0.797; scale-y: 0.797; }
        frame 58 { x: 50.1; y: -0.2; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: -10000; y: 1; scale-x: 0.797; scale-y: 0.797; }
        frame 60 { y: 2.3; skew-x: 26; skew-y: 26; scale-x: -10000; scale-y: -10000; }
        frame 61 { y: 3.5; skew-x: 26.1; skew-y: 26.1; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: 50; y: 4.7; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 31.2; y: 15.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: 37.4; y: 11.7; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 69 { x: 43.8; y: 8.2; skew-x: 12.3; skew-y: 12.3; scale-x: 0.798; scale-y: 0.798; }
        frame 70 { x: 50.1; y: 4.8; skew-x: 18.5; skew-y: 18.5; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 51.6; y: 5.5; skew-x: 24.6; skew-y: 24.6; scale-x: 0.797; scale-y: 0.797; }
        frame 74 { x: 53.3; y: 6.3; skew-x: 30.8; skew-y: 30.8; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 54.9; y: 7.3; skew-x: 37.1; skew-y: 37.1; scale-x: 0.798; scale-y: 0.798; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 50.9; y: 8.5; skew-x: 30.8; skew-y: 30.8; }
        frame 84 { x: 46.8; y: 9.7; skew-x: 24.6; skew-y: 24.6; }
        frame 85 { x: 42.9; y: 11.1; skew-x: 18.5; skew-y: 18.5; }
        frame 86 { x: 39; y: 12.4; skew-x: 12.3; skew-y: 12.3; scale-x: 0.799; scale-y: 0.799; }
        frame 87 { x: 35; y: 13.8; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 31.2; y: 15.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 32.9; y: 14.4; skew-x: 1.5; skew-y: 1.5; }
        frame 91 { x: 34.5; y: 13.4; skew-x: 3.3; skew-y: 3.3; }
        frame 92 { x: 36.2; y: 12.5; skew-x: 5; skew-y: 5; }
        frame 93 { x: 37.9; y: 11.6; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 94 { x: 39.5; y: 10.6; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 41.3; y: 9.7; skew-x: 10.1; skew-y: 10.1; scale-x: 0.8; scale-y: 0.8; }
        frame 96 { x: 38.5; y: 12.5; skew-x: 7; skew-y: 7; scale-x: 0.799; scale-y: 0.799; }
        frame 97 { x: 35.6; y: 15.3; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 33; y: 18.2; skew-x: 1; skew-y: 1; }
        frame 99 { x: 32.5; y: 17.5; skew-x: 0.8; skew-y: 0.8; }
        frame 100 { x: 32.1; y: 16.7; skew-x: 0.5; skew-y: 0.5; scale-x: 0.8; scale-y: 0.8; }
        frame 101 { x: 31.6; y: 16.1; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 31.2; y: 15.3; skew-x: 0; skew-y: 0; }
        frame 103 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 105 { x: 32.9; y: 14.4; skew-x: 1.5; skew-y: 1.5; }
        frame 106 { x: 34.5; y: 13.4; skew-x: 3.3; skew-y: 3.3; }
        frame 107 { x: 36.2; y: 12.5; skew-x: 5; skew-y: 5; }
        frame 108 { x: 37.9; y: 11.6; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 109 { x: 39.5; y: 10.6; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 41.3; y: 9.7; skew-x: 10.1; skew-y: 10.1; scale-x: 0.8; scale-y: 0.8; }
        frame 111 { x: 38.5; y: 12.5; skew-x: 7; skew-y: 7; scale-x: 0.799; scale-y: 0.799; }
        frame 112 { x: 35.6; y: 15.3; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 33; y: 18.2; skew-x: 1; skew-y: 1; }
        frame 114 { x: 32.5; y: 17.5; skew-x: 0.8; skew-y: 0.8; }
        frame 115 { x: 32.1; y: 16.7; skew-x: 0.5; skew-y: 0.5; scale-x: 0.8; scale-y: 0.8; }
        frame 116 { x: 31.6; y: 16.1; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 31.2; y: 15.3; skew-x: 0; skew-y: 0; }
        frame 118 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 120 { x: 49.5; y: 4.8; skew-x: 23; skew-y: 23; scale-x: 0.799; scale-y: 0.799; }
        frame 121 { x: 52.2; y: -10000; skew-x: 24.6; skew-y: 24.6; scale-x: 0.798; scale-y: 0.798; }
        frame 122 { x: 54.6; y: 4.9; skew-x: 26; skew-y: 26; scale-x: -10000; scale-y: -10000; }
        frame 123 { x: 56.8; y: -10000; skew-x: 27.1; skew-y: 27.1; }
        frame 124 { x: 58.5; skew-x: 28.3; skew-y: 28.3; }
        frame 125 { x: 60; y: 5; skew-x: 29.1; skew-y: 29.1; }
        frame 126 { x: 61.1; skew-x: 29.8; skew-y: 29.8; }
        frame 127 { x: 62; skew-x: 30.1; skew-y: 30.1; }
        frame 128 { x: 62.5; skew-x: 30.6; skew-y: 30.6; }
        frame 129 { x: 62.6; y: 4.9; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 130 { x: 59.3; y: 5.2; skew-x: 28.6; skew-y: 28.6; scale-x: 0.797; scale-y: 0.797; }
        frame 131 { x: 56.3; y: 5.3; skew-x: 26.8; skew-y: 26.8; scale-x: -10000; scale-y: -10000; }
        frame 132 { x: 53.7; y: 5.5; skew-x: 25.3; skew-y: 25.3; }
        frame 133 { x: 51.4; y: -10000; skew-x: 24.1; skew-y: 24.1; }
        frame 134 { x: 49.6; y: 5.8; skew-x: 23.1; skew-y: 23.1; }
        frame 135 { x: 48; y: -10000; skew-x: 22.1; skew-y: 22.1; }
        frame 136 { x: 46.8; skew-x: 21.3; skew-y: 21.3; }
        frame 137 { x: 45.9; y: 5.9; skew-x: 20.8; skew-y: 20.8; }
        frame 138 { x: 45.3; y: -10000; skew-x: 20.6; skew-y: 20.6; }
        frame 139 { x: 45.1; y: 5.8; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; }
        frame 140 { x: 46; y: -10000; skew-x: 20.8; skew-y: 20.8; scale-x: 0.797; scale-y: 0.797; }
        frame 141 { x: 48.3; skew-x: 21.8; skew-y: 21.8; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 52.2; skew-x: 23.6; skew-y: 23.6; }
        frame 143 { x: 57.6; y: 5.6; skew-x: 25.8; skew-y: 25.8; }
        frame 144 { x: 64.7; y: 5.5; skew-x: 28.8; skew-y: 28.8; }
        frame 145 { x: 73.3; y: 5.3; skew-x: 32.6; skew-y: 32.6; }
        frame 146 { x: 83.4; y: 5.2; skew-x: 36.9; skew-y: 36.9; scale-x: 0.796; scale-y: 0.796; }
        frame 147 { x: 95.2; y: -10000; skew-x: 41.9; skew-y: 41.9; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 108.5; skew-x: 47.6; skew-y: 47.6; }
        frame 149 { x: 123.3; y: 5.3; skew-x: 53.9; skew-y: 53.9; scale-x: 0.797; scale-y: 0.797; }
        frame 150 { x: 152; y: 24; skew-x: 71.2; skew-y: 71.2; scale-x: 0.796; scale-y: 0.796; }
        frame 151 { x: 180.5; y: 43.3; skew-x: 88.5; skew-y: 88.5; scale-x: 0.797; scale-y: 0.797; }
        frame 152 { x: 195.4; y: 73.6; skew-x: 105.5; skew-y: 105.5; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 209.6; y: 104.2; skew-x: 122.8; skew-y: 122.8; scale-x: 0.798; scale-y: 0.798; }
        frame 154 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_chops";
        frame-count: 164;
        frame 0 { x: 30.6; y: 2.1; image: IMAGE_REANIM_ZOMBIE_DISCO_CHOPS; }
        frame 1 { x: -10000; y: -10000; image: none; }
        frame 3 { x: 32; y: 1.1; }
        frame 4 { x: 33.5; y: 0.1; }
        frame 5 { x: 35; y: -0.8; }
        frame 6 { x: 36.4; y: -1.8; }
        frame 7 { x: 37.9; y: -2.9; }
        frame 8 { x: 39.3; y: -3.9; }
        frame 9 { x: 40.8; y: -4.1; }
        frame 10 { x: 42.2; y: -4.3; }
        frame 11 { x: 43.7; y: -4.5; }
        frame 12 { x: 45.1; y: -4.8; }
        frame 13 { x: 46.6; y: -5; }
        frame 14 { x: 48; y: -5.2; }
        frame 15 { x: -10000; y: -10000; }
        frame 17 { x: 46.3; y: -4.9; }
        frame 18 { x: 44.5; y: -4.7; }
        frame 19 { x: 42.8; y: -4.4; }
        frame 20 { x: 41; y: -4.2; }
        frame 21 { x: 39.3; y: -3.9; }
        frame 22 { x: 37.5; y: -2.7; }
        frame 23 { x: 35.8; y: -1.4; }
        frame 24 { x: 34; y: -0.2; }
        frame 25 { x: 32.3; y: 0.9; }
        frame 26 { x: 30.6; y: 2.1; }
        frame 27 { x: -10000; y: -10000; }
        frame 28 { x: 35.3; y: -0.5; skew-x: 2.5; skew-y: 2.5; }
        frame 29 { x: 40; y: -3.3; skew-x: 4.8; skew-y: 4.8; }
        frame 30 { x: 44.8; y: -6.1; skew-x: 7.3; skew-y: 7.3; }
        frame 31 { x: 49.6; y: -9; skew-x: 9.8; skew-y: 9.8; scale-x: 0.999; scale-y: 0.999; }
        frame 32 { x: 54.5; y: -11.8; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 59.4; y: -14.7; skew-x: 15; skew-y: 15; scale-x: 1; scale-y: 1; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 55.1; y: -12.2; skew-x: 12.8; skew-y: 12.8; scale-x: 0.999; scale-y: 0.999; }
        frame 40 { x: 51; y: -9.7; skew-x: 10.6; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 46.9; y: -7.4; skew-x: 8.5; skew-y: 8.5; scale-x: 1; scale-y: 1; }
        frame 42 { x: 42.8; y: -5; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 38.7; y: -2.5; skew-x: 4.3; skew-y: 4.3; }
        frame 44 { x: 34.6; y: -0.1; skew-x: 2; skew-y: 2; }
        frame 45 { x: 30.6; y: 2.1; skew-x: 0; skew-y: 0; }
        frame 46 { x: 61; y: -11.4; skew-x: 20.3; skew-y: 20.3; scale-x: 0.999; scale-y: 0.999; }
        frame 47 { x: -10000; y: -12.4; skew-x: -10000; skew-y: -10000; scale-x: 0.998; scale-y: 0.998; }
        frame 48 { y: -13.4; scale-x: -10000; scale-y: -10000; }
        frame 49 { y: -14.4; scale-x: 0.999; scale-y: 0.999; }
        frame 50 { y: -13.4; scale-x: 0.998; scale-y: 0.998; }
        frame 51 { y: -12.4; scale-x: -10000; scale-y: -10000; }
        frame 52 { y: -11.4; scale-x: 0.999; scale-y: 0.999; }
        frame 53 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { y: -12.1; scale-x: 0.998; scale-y: 0.998; }
        frame 58 { y: -12.9; scale-x: -10000; scale-y: -10000; }
        frame 59 { y: -13.6; }
        frame 60 { y: -14.4; scale-x: 0.999; scale-y: 0.999; }
        frame 61 { y: -13.7; scale-x: 0.998; scale-y: 0.998; }
        frame 62 { y: -12.9; scale-x: -10000; scale-y: -10000; }
        frame 63 { y: -12.2; }
        frame 64 { y: -11.4; scale-x: 0.999; scale-y: 0.999; }
        frame 65 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 30.6; y: 2.1; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 68 { x: 39.1; y: -1.7; skew-x: 1.5; skew-y: 1.5; scale-x: 0.999; scale-y: 0.999; }
        frame 69 { x: 47.8; y: -5.9; skew-x: 3.3; skew-y: 3.3; scale-x: 0.998; scale-y: 0.998; }
        frame 70 { x: 56.4; y: -9.9; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 58.1; }
        frame 74 { x: 59.8; }
        frame 75 { x: 61.4; }
        frame 76 { x: -10000; }
        frame 83 { x: 56.2; y: -7.8; skew-x: 4.1; skew-y: 4.1; }
        frame 84 { x: 51.1; y: -5.7; skew-x: 3.3; skew-y: 3.3; }
        frame 85 { x: 45.9; y: -3.7; skew-x: 2.5; skew-y: 2.5; scale-x: 0.999; scale-y: 0.999; }
        frame 86 { x: 40.8; y: -1.7; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 35.6; y: 0.2; skew-x: 0.8; skew-y: 0.8; scale-x: 1; scale-y: 1; }
        frame 88 { x: 30.6; y: 2.1; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 90 { x: 31.8; y: 1.4; skew-x: 0.5; skew-y: 0.5; }
        frame 91 { x: 33; y: 0.7; skew-x: 1; skew-y: 1; }
        frame 92 { x: 34.2; y: 0.1; skew-x: 1.5; skew-y: 1.5; }
        frame 93 { x: 35.4; y: -0.5; skew-x: 2; skew-y: 2; }
        frame 94 { x: 36.6; y: -1.3; skew-x: 2.6; skew-y: 2.6; }
        frame 95 { x: 37.9; y: -2; skew-x: 3.3; skew-y: 3.3; }
        frame 96 { x: 34.5; y: 1.7; skew-x: -10000; skew-y: -10000; }
        frame 97 { x: 31.3; y: 5.6; }
        frame 98 { x: 28; y: 9.5; }
        frame 99 { x: 28.7; y: 7.7; skew-x: 2.3; skew-y: 2.3; }
        frame 100 { x: 29.3; y: 5.8; skew-x: 1.5; skew-y: 1.5; }
        frame 101 { x: 30; y: 4; skew-x: 0.8; skew-y: 0.8; }
        frame 102 { x: 30.6; y: 2.1; skew-x: 0; skew-y: 0; }
        frame 103 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 105 { x: 31.8; y: 1.4; skew-x: 0.5; skew-y: 0.5; }
        frame 106 { x: 33; y: 0.7; skew-x: 1; skew-y: 1; }
        frame 107 { x: 34.2; y: 0.1; skew-x: 1.5; skew-y: 1.5; }
        frame 108 { x: 35.4; y: -0.5; skew-x: 2; skew-y: 2; }
        frame 109 { x: 36.6; y: -1.3; skew-x: 2.6; skew-y: 2.6; }
        frame 110 { x: 37.9; y: -2; skew-x: 3.3; skew-y: 3.3; }
        frame 111 { x: 34.5; y: 1.7; skew-x: -10000; skew-y: -10000; }
        frame 112 { x: 31.3; y: 5.6; }
        frame 113 { x: 28; y: 9.5; }
        frame 114 { x: 28.7; y: 7.7; skew-x: 2.3; skew-y: 2.3; }
        frame 115 { x: 29.3; y: 5.8; skew-x: 1.5; skew-y: 1.5; }
        frame 116 { x: 30; y: 4; skew-x: 0.8; skew-y: 0.8; }
        frame 117 { x: 30.6; y: 2.1; skew-x: 0; skew-y: 0; }
        frame 118 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 120 { cel: -1; }
        frame 121 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_glasses";
        frame-count: 164;
        frame 0 { x: -4.4; y: -4; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DISCO_GLASSES; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: -3; y: -5.2; }
        frame 4 { x: -1.5; y: -6.4; }
        frame 5 { x: -0; y: -7.6; }
        frame 6 { x: 1.3; y: -8.8; }
        frame 7 { x: 2.7; y: -10; }
        frame 8 { x: 4.2; y: -11.2; }
        frame 9 { x: 5.6; y: -11.3; }
        frame 10 { x: 7.1; y: -10000; }
        frame 11 { x: 8.6; }
        frame 12 { x: 10; y: -11.4; }
        frame 13 { x: 11.5; y: -10000; }
        frame 14 { x: 12.9; y: -11.5; }
        frame 15 { x: -10000; y: -10000; }
        frame 17 { x: 11.2; y: -11.4; }
        frame 18 { x: 9.4; y: -10000; }
        frame 19 { x: 7.7; y: -11.3; }
        frame 20 { x: 5.9; y: -10000; }
        frame 21 { x: 4.2; y: -11.2; }
        frame 22 { x: 2.4; y: -9.8; }
        frame 23 { x: 0.7; y: -8.3; }
        frame 24 { x: -0.9; y: -6.9; }
        frame 25 { x: -2.7; y: -5.4; }
        frame 26 { x: -4.4; y: -4; }
        frame 27 { x: -10000; y: -10000; }
        frame 28 { x: 0.6; y: -8.4; skew-x: 2.5; skew-y: 2.5; }
        frame 29 { x: 5.7; y: -12.6; skew-x: 4.8; skew-y: 4.8; }
        frame 30 { x: 11; y: -16.9; skew-x: 7.3; skew-y: 7.3; }
        frame 31 { x: 16.3; y: -21.3; skew-x: 9.8; skew-y: 9.8; }
        frame 32 { x: 21.6; y: -25.5; skew-x: 12.3; skew-y: 12.3; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 27; y: -29.8; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 22.3; y: -26.1; skew-x: 12.8; skew-y: 12.8; scale-x: 0.799; scale-y: 0.799; }
        frame 40 { x: 17.7; y: -22.5; skew-x: 10.6; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 13.1; y: -18.8; skew-x: 8.5; skew-y: 8.5; scale-x: 0.8; scale-y: 0.8; }
        frame 42 { x: 8.6; y: -15.1; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 4.2; y: -11.3; skew-x: 4.3; skew-y: 4.3; }
        frame 44 { x: -0.1; y: -7.6; skew-x: 2; skew-y: 2; }
        frame 45 { x: -4.4; y: -4; skew-x: 0; skew-y: 0; }
        frame 46 { x: 30.2; y: -29.5; skew-x: 20.3; skew-y: 20.3; scale-x: 0.799; scale-y: 0.799; }
        frame 47 { x: 30.3; y: -30.8; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; }
        frame 48 { x: -10000; y: -32.1; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 30.2; y: -33.5; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: -10000; y: -32.1; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { y: -30.8; scale-x: -10000; scale-y: -10000; }
        frame 52 { y: -29.5; scale-x: 0.799; scale-y: 0.799; }
        frame 53 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 30.3; y: -30.4; scale-x: 0.798; scale-y: 0.798; }
        frame 58 { x: -10000; y: -31.4; scale-x: -10000; scale-y: -10000; }
        frame 59 { y: -32.4; }
        frame 60 { x: 30.2; y: -33.5; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: -10000; y: -32.5; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { y: -31.5; scale-x: -10000; scale-y: -10000; }
        frame 63 { y: -30.5; }
        frame 64 { y: -29.5; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: -4.4; y: -4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: 4.2; y: -9; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.799; }
        frame 69 { x: 13.1; y: -14.2; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 22.1; y: -19.2; skew-x: 5; skew-y: 5; scale-x: 0.798; scale-y: 0.798; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 24.7; y: -25; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 27.6; y: -30.9; skew-x: 11.8; skew-y: 11.8; }
        frame 75 { x: 30.6; y: -36.7; skew-x: 15.3; skew-y: 15.3; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 29.6; y: -30.9; skew-x: 11.8; skew-y: 11.8; }
        frame 81 { x: 28.7; y: -24.9; skew-x: 8.3; skew-y: 8.3; }
        frame 82 { x: 28.1; y: -19.2; skew-x: 5; skew-y: 5; }
        frame 83 { x: 22.6; y: -16.6; skew-x: 4.1; skew-y: 4.1; }
        frame 84 { x: 17.2; y: -14.1; skew-x: 3.3; skew-y: 3.3; scale-x: 0.799; scale-y: 0.799; }
        frame 85 { x: 11.7; y: -11.6; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 6.3; y: -9; skew-x: 1.5; skew-y: 1.5; }
        frame 87 { x: 0.9; y: -6.5; skew-x: 0.8; skew-y: 0.8; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -4.4; y: -4; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 90 { x: -3.1; y: -5; skew-x: 0.5; skew-y: 0.5; }
        frame 91 { x: -1.9; y: -6.1; skew-x: 1; skew-y: 1; }
        frame 92 { x: -0.6; y: -7.1; skew-x: 1.5; skew-y: 1.5; }
        frame 93 { x: 0.6; y: -8.1; skew-x: 2; skew-y: 2; }
        frame 94 { x: 1.8; y: -9.2; skew-x: 2.6; skew-y: 2.6; }
        frame 95 { x: 3.2; y: -10.3; skew-x: 3.3; skew-y: 3.3; }
        frame 96 { x: -0.1; y: -8.2; skew-x: -10000; skew-y: -10000; }
        frame 97 { x: -3.5; y: -6.1; }
        frame 98 { x: -6.8; y: -4; }
        frame 99 { x: -6.3; y: -2.8; }
        frame 100 { x: -5.8; y: -1.6; }
        frame 101 { x: -5.4; y: -3.2; skew-x: 1.5; skew-y: 1.5; }
        frame 102 { x: -4.9; y: -5; skew-x: 0; skew-y: 0; }
        frame 103 { x: -4.4; y: -4; skew-x: -10000; skew-y: -10000; }
        frame 104 { x: -10000; y: -10000; }
        frame 105 { x: -3.1; y: -5; skew-x: 0.5; skew-y: 0.5; }
        frame 106 { x: -1.9; y: -6.1; skew-x: 1; skew-y: 1; }
        frame 107 { x: -0.6; y: -7.1; skew-x: 1.5; skew-y: 1.5; }
        frame 108 { x: 0.6; y: -8.1; skew-x: 2; skew-y: 2; }
        frame 109 { x: 1.8; y: -9.2; skew-x: 2.6; skew-y: 2.6; }
        frame 110 { x: 3.2; y: -10.3; skew-x: 3.3; skew-y: 3.3; }
        frame 111 { x: -0.1; y: -8.2; skew-x: -10000; skew-y: -10000; }
        frame 112 { x: -3.5; y: -6.1; }
        frame 113 { x: -6.8; y: -4; }
        frame 114 { x: -6.3; y: -2.8; }
        frame 115 { x: -5.8; y: -1.6; }
        frame 116 { x: -5.4; y: -3.2; skew-x: 1.5; skew-y: 1.5; }
        frame 117 { x: -4.9; y: -5; skew-x: 0; skew-y: 0; }
        frame 118 { x: -4.7; y: -4.5; skew-x: -10000; skew-y: -10000; }
        frame 119 { x: -4.4; y: -4; }
        frame 120 { x: -10000; y: -10000; cel: -1; }
        frame 121 { cel: -10000; }
    }
}
