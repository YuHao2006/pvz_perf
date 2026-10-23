export component Zombie_gargantuar {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 197;
        frame 22 { cel: -1; }
        frame 23 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 22 { cel: 0; }
        frame 23 { cel: -10000; }
        frame 71 { cel: -1; }
        frame 72 { cel: -10000; }
    }
    Track {
        source-name: "anim_smash";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 71 { cel: 0; }
        frame 72 { cel: -10000; }
        frame 104 { cel: -1; }
        frame 105 { cel: -10000; }
    }
    Track {
        source-name: "anim_throw";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 104 { x: 6.2; y: -36.8; skew-x: 20.7; skew-y: 20.7; scale-x: 0.993; scale-y: 0.993; cel: 0; }
        frame 105 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 138 { cel: -1; }
        frame 139 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 138 { x: 0.4; y: -3.9; cel: 0; }
        frame 139 { x: -10000; y: -10000; cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 22 { x: -79.8; y: 80.1; cel: 0; }
        frame 23 { x: -75.3; y: -10000; cel: -10000; }
        frame 24 { x: -70.8; }
        frame 25 { x: -66.3; }
        frame 26 { x: -61.9; }
        frame 27 { x: -57.4; }
        frame 28 { x: -54.5; }
        frame 29 { x: -51.5; }
        frame 30 { x: -48.5; }
        frame 31 { x: -45.6; }
        frame 32 { x: -42.6; }
        frame 33 { x: -38.2; }
        frame 34 { x: -33.8; }
        frame 35 { x: -29.4; }
        frame 36 { x: -25; }
        frame 37 { x: -24.6; }
        frame 38 { x: -24.1; }
        frame 39 { x: -23.7; }
        frame 40 { x: -23.2; }
        frame 41 { x: -22.8; }
        frame 42 { x: -21.1; }
        frame 43 { x: -19.4; }
        frame 44 { x: -17.7; }
        frame 45 { x: -16; }
        frame 46 { x: -14.3; }
        frame 47 { x: -11.9; }
        frame 48 { x: -9.5; }
        frame 49 { x: -7.1; }
        frame 50 { x: -4.7; }
        frame 51 { x: -2.3; }
        frame 52 { x: 3; }
        frame 53 { x: 8.4; }
        frame 54 { x: 13.8; }
        frame 55 { x: 19.2; }
        frame 56 { x: 24.6; }
        frame 57 { x: 29.1; }
        frame 58 { x: 33.5; }
        frame 59 { x: 38; }
        frame 60 { x: 42.5; }
        frame 61 { x: -10000; }
        frame 66 { x: 42.9; }
        frame 67 { x: 43.3; }
        frame 68 { x: 43.5; }
        frame 69 { x: 43.9; }
        frame 70 { x: 44.3; }
        frame 71 { x: -10000; cel: -1; }
        frame 72 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_gargantuar_innerarm_upper";
        frame-count: 197;
        frame 0 { x: -20; y: -11.6; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_INNERARM_UPPER; }
        frame 1 { x: -19.8; y: -10000; skew-x: 0.3; skew-y: 0.3; image: none; }
        frame 2 { x: -19.6; y: -11.7; skew-x: 0.5; skew-y: 0.5; }
        frame 3 { x: -19.3; y: -11.8; skew-x: 1; skew-y: 1; }
        frame 4 { x: -20.3; y: -10.3; skew-x: 0.3; skew-y: 0.3; }
        frame 5 { x: -21.2; y: -8.9; skew-x: -0.2; skew-y: -0.2; }
        frame 6 { x: -22.3; y: -7.5; skew-x: -0.9; skew-y: -0.9; }
        frame 7 { x: -23.1; y: -6.1; skew-x: -1.5; skew-y: -1.5; }
        frame 8 { x: -24.1; y: -4.6; skew-x: -2.2; skew-y: -2.2; }
        frame 9 { x: -25.1; y: -3.1; skew-x: -2.9; skew-y: -2.9; }
        frame 10 { x: -26.1; y: -1.6; skew-x: -3.7; skew-y: -3.7; }
        frame 11 { x: -25.5; y: -2.7; skew-x: -3.2; skew-y: -3.2; }
        frame 12 { x: -24.8; y: -3.7; skew-x: -2.7; skew-y: -2.7; }
        frame 13 { x: -24.2; y: -4.6; skew-x: -2.4; skew-y: -2.4; }
        frame 14 { x: -23.6; y: -5.6; skew-x: -2; skew-y: -2; }
        frame 15 { x: -23.2; y: -6.4; skew-x: -1.7; skew-y: -1.7; }
        frame 16 { x: -22.6; y: -7.3; skew-x: -1.4; skew-y: -1.4; }
        frame 17 { x: -22.1; y: -8.2; skew-x: -1.2; skew-y: -1.2; }
        frame 18 { x: -21.5; y: -9.1; skew-x: -0.7; skew-y: -0.7; }
        frame 19 { x: -21; y: -9.9; skew-x: -0.4; skew-y: -0.4; }
        frame 20 { x: -20.5; y: -10.7; skew-x: -0.2; skew-y: -0.2; }
        frame 21 { x: -20; y: -11.6; skew-x: 0; skew-y: 0; }
        frame 22 { x: -17.3; y: -15.9; skew-x: 1.8; skew-y: 1.8; }
        frame 23 { x: -16; y: -17.5; skew-x: 3.3; skew-y: 3.3; }
        frame 24 { x: -14.4; y: -19; skew-x: 4.8; skew-y: 4.8; scale-x: 0.999; scale-y: 0.999; }
        frame 25 { x: -13; y: -20.6; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: -11.5; y: -22.1; skew-x: 8; skew-y: 8; }
        frame 27 { x: -9.9; y: -23.7; skew-x: 9.7; skew-y: 9.7; }
        frame 28 { x: -9.2; y: -24.6; skew-x: 10.1; skew-y: 10.1; }
        frame 29 { x: -8.5; y: -25.6; skew-x: 10.6; skew-y: 10.6; }
        frame 30 { x: -7.8; y: -26.6; skew-x: 11.1; skew-y: 11.1; }
        frame 31 { x: -7; y: -27.4; skew-x: 11.6; skew-y: 11.6; }
        frame 32 { x: -6.2; y: -28.4; skew-x: 12.2; skew-y: 12.2; }
        frame 33 { x: -12.3; y: -20.2; skew-x: 7.8; skew-y: 7.8; }
        frame 34 { x: -18.2; y: -11.8; skew-x: 3.3; skew-y: 3.3; }
        frame 35 { x: -24; y: -3.2; skew-x: -0.9; skew-y: -0.9; scale-x: 0.998; scale-y: 0.998; }
        frame 36 { x: -29.5; y: 5.2; skew-x: -5.4; skew-y: -5.4; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: -28.7; y: 4.6; skew-x: -5.7; skew-y: -5.7; }
        frame 38 { x: -27.8; y: 4; skew-x: -6; skew-y: -6; }
        frame 39 { x: -27; y: 3.4; skew-x: -6.4; skew-y: -6.4; }
        frame 40 { x: -26.1; y: 2.8; skew-x: -6.7; skew-y: -6.7; }
        frame 41 { x: -25.3; y: 2.4; skew-x: -7.1; skew-y: -7.1; }
        frame 42 { x: -23.1; y: 1.8; skew-x: -7.4; skew-y: -7.4; scale-x: 0.997; scale-y: 0.997; }
        frame 43 { x: -20.9; y: 1.2; skew-x: -7.7; skew-y: -7.7; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: -18.7; y: 0.6; skew-x: -8.2; skew-y: -8.2; }
        frame 45 { x: -16.5; y: 0; skew-x: -8.4; skew-y: -8.4; }
        frame 46 { x: -14.3; y: -0.4; skew-x: -8.9; skew-y: -8.9; }
        frame 47 { x: -12.9; y: -0.8; skew-x: -9.7; skew-y: -9.7; }
        frame 48 { x: -11.5; y: -1.4; skew-x: -10.4; skew-y: -10.4; }
        frame 49 { x: -10; y: -1.9; skew-x: -11.2; skew-y: -11.2; scale-x: 0.996; scale-y: 0.996; }
        frame 50 { x: -8.7; y: -2.4; skew-x: -12; skew-y: -12; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: -7.3; y: -2.8; skew-x: -12.9; skew-y: -12.9; scale-x: 0.997; scale-y: 0.997; }
        frame 52 { x: -7.5; y: -2.7; skew-x: -14.2; skew-y: -14.2; scale-x: 0.996; scale-y: 0.996; }
        frame 53 { x: -7.8; y: -10000; skew-x: -15.7; skew-y: -15.7; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: -7.9; y: -2.5; skew-x: -17.2; skew-y: -17.2; }
        frame 55 { x: -8.1; y: -10000; skew-x: -18.7; skew-y: -18.7; scale-x: 0.995; scale-y: 0.995; }
        frame 56 { x: -8.2; y: -2.3; skew-x: -20.1; skew-y: -20.1; scale-x: 0.996; scale-y: 0.996; }
        frame 57 { x: -14.8; y: 2.8; skew-x: -22.2; skew-y: -22.2; scale-x: 0.995; scale-y: 0.995; }
        frame 58 { x: -21.2; y: 7.9; skew-x: -24.2; skew-y: -24.2; scale-x: 0.994; scale-y: 0.994; }
        frame 59 { x: -27.8; y: 13.2; skew-x: -26.5; skew-y: -26.5; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: -34.4; y: 18.6; skew-x: -28.6; skew-y: -28.6; }
        frame 61 { x: -32; y: 12.9; skew-x: -24.2; skew-y: -24.2; }
        frame 62 { x: -29.6; y: 7.5; skew-x: -19.9; skew-y: -19.9; }
        frame 63 { x: -26.9; y: 1.9; skew-x: -15.5; skew-y: -15.5; scale-x: 0.995; scale-y: 0.995; }
        frame 64 { x: -24; y: -3.2; skew-x: -11.2; skew-y: -11.2; scale-x: 0.996; scale-y: 0.996; }
        frame 65 { x: -21.1; y: -8.4; skew-x: -6.9; skew-y: -6.9; scale-x: 0.997; scale-y: 0.997; }
        frame 66 { x: -20.3; y: -10; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: -19.6; y: -11.5; skew-x: -3.2; skew-y: -3.2; scale-x: 0.998; scale-y: 0.998; }
        frame 68 { x: -18.9; y: -13.1; skew-x: -1.5; skew-y: -1.5; scale-x: 0.999; scale-y: 0.999; }
        frame 69 { x: -18.2; y: -14.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: -17.3; y: -15.9; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -12.7; y: -17.9; skew-x: 4; skew-y: 4; scale-x: 0.999; scale-y: 0.999; }
        frame 73 { x: -7.8; y: -19.8; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -3.1; y: -21.7; skew-x: 8.8; skew-y: 8.8; scale-x: 0.998; scale-y: 0.998; }
        frame 75 { x: 1.7; y: -23.5; skew-x: 11.3; skew-y: 11.3; scale-x: 0.999; scale-y: 0.999; }
        frame 76 { x: 6.6; y: -25.2; skew-x: 13.8; skew-y: 13.8; scale-x: 0.998; scale-y: 0.998; }
        frame 77 { x: 11.6; y: -26.9; skew-x: 16.3; skew-y: 16.3; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 16.5; y: -28.5; skew-x: 18.6; skew-y: 18.6; }
        frame 79 { x: 21.5; y: -30.3; skew-x: 21.2; skew-y: 21.2; scale-x: 0.999; scale-y: 0.999; }
        frame 80 { x: 23.9; y: -30.8; skew-x: 22.6; skew-y: 22.6; scale-x: 0.998; scale-y: 0.998; }
        frame 81 { x: 26.6; y: -31.2; skew-x: 24.3; skew-y: 24.3; scale-x: 0.997; scale-y: 0.997; }
        frame 82 { x: 29.1; y: -31.7; skew-x: 25.8; skew-y: 25.8; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 31.6; y: -32.2; skew-x: 27.3; skew-y: 27.3; }
        frame 84 { x: 34; y: -32.6; skew-x: 28.8; skew-y: 28.8; }
        frame 85 { x: 36.8; y: -33; skew-x: 30.5; skew-y: 30.5; scale-x: 0.998; scale-y: 0.998; }
        frame 86 { x: 29.7; y: -33.7; skew-x: 26.8; skew-y: 26.8; scale-x: 0.997; scale-y: 0.997; }
        frame 87 { x: 22.6; y: -34.1; skew-x: 23.1; skew-y: 23.1; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 15.6; y: -34.5; skew-x: 19.3; skew-y: 19.3; }
        frame 89 { x: 8.7; y: -34.8; skew-x: 15.7; skew-y: 15.7; }
        frame 90 { x: -23.6; y: -8.4; skew-x: -6.4; skew-y: -6.4; scale-x: 0.996; scale-y: 0.996; }
        frame 91 { x: -51.9; y: 21.6; skew-x: -28.7; skew-y: -28.7; scale-x: 0.995; scale-y: 0.995; }
        frame 92 { x: -53.7; y: 38; skew-x: -40; skew-y: -40; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -53.6; y: 39.3; skew-x: -10000; skew-y: -10000; scale-x: 0.993; scale-y: 0.993; }
        frame 94 { x: -53.7; y: 40.5; scale-x: 0.995; scale-y: 0.995; }
        frame 95 { x: -53.6; y: 39.3; scale-x: 0.993; scale-y: 0.993; }
        frame 96 { x: -53.7; y: 38; scale-x: 0.995; scale-y: 0.995; }
        frame 97 { x: -49.6; y: 29.8; skew-x: -34; skew-y: -34; scale-x: 0.994; scale-y: 0.994; }
        frame 98 { x: -45.1; y: 21.6; skew-x: -28; skew-y: -28; scale-x: 0.995; scale-y: 0.995; }
        frame 99 { x: -40.2; y: 13.6; skew-x: -22; skew-y: -22; scale-x: 0.996; scale-y: 0.996; }
        frame 100 { x: -35; y: 5.8; skew-x: -16; skew-y: -16; scale-x: 0.997; scale-y: 0.997; }
        frame 101 { x: -29.3; y: -1.6; skew-x: -9.9; skew-y: -9.9; scale-x: 0.998; scale-y: 0.998; }
        frame 102 { x: -23.4; y: -9; skew-x: -3.9; skew-y: -3.9; scale-x: 0.999; scale-y: 0.999; }
        frame 103 { x: -17.3; y: -15.9; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: -12.7; y: -17.9; skew-x: 4; skew-y: 4; scale-x: 0.999; scale-y: 0.999; }
        frame 106 { x: -7.8; y: -19.8; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: -3.1; y: -21.7; skew-x: 8.8; skew-y: 8.8; scale-x: 0.998; scale-y: 0.998; }
        frame 108 { x: 1.7; y: -23.5; skew-x: 11.3; skew-y: 11.3; scale-x: 0.999; scale-y: 0.999; }
        frame 109 { x: 6.7; y: -27.7; skew-x: 27.3; skew-y: 24.8; scale-x: 1; scale-y: 0.997; }
        frame 110 { x: 12.8; y: -29.5; skew-x: 43.4; skew-y: 38.6; scale-x: 1.002; scale-y: 0.995; }
        frame 111 { x: 19.5; y: -28.9; skew-x: 59.6; skew-y: 52.4; scale-x: 1.005; scale-y: 0.994; }
        frame 112 { x: 25.9; y: -25.8; skew-x: 75.6; skew-y: 66; scale-x: 1.009; scale-y: 0.995; }
        frame 113 { x: 34.6; y: -21.4; skew-x: 90.6; skew-y: 81.2; scale-x: 1.008; scale-y: 0.994; }
        frame 114 { x: 41.8; y: -15; skew-x: 105.8; skew-y: 96.3; scale-x: 1.007; scale-y: 0.993; }
        frame 115 { x: 46.4; y: -7.1; skew-x: 121.1; skew-y: 111.3; scale-x: 1.005; scale-y: 0.992; }
        frame 116 { x: 48.1; y: 1.6; skew-x: 136.1; skew-y: 126.6; scale-x: 1.004; scale-y: 0.99; }
        frame 117 { x: 47.2; y: 10.2; skew-x: 151.3; skew-y: 141.7; scale-x: 1.005; scale-y: 0.991; }
        frame 118 { x: 45; y: 14.9; skew-x: 156.7; skew-y: 147.2; scale-x: 1.004; scale-y: 0.989; }
        frame 119 { x: 42.4; y: 19.4; skew-x: 162.2; skew-y: 152.7; scale-x: 1.003; scale-y: -10000; }
        frame 120 { x: 39.5; y: 23.8; skew-x: 167.7; skew-y: 158.2; scale-x: -10000; }
        frame 121 { x: 36.3; y: 27.9; skew-x: 173.1; skew-y: 163.5; }
        frame 122 { x: 36.2; y: 28; skew-x: 173.2; skew-y: 163.7; }
        frame 123 { x: 36.3; y: 27.9; skew-x: 173.1; skew-y: 163.5; }
        frame 124 { x: 38.8; y: 20.2; skew-x: 165; skew-y: 155.4; scale-x: 1.002; scale-y: 0.988; }
        frame 125 { x: 40.6; y: 12.1; skew-x: 156.7; skew-y: 147.1; scale-x: 1.001; scale-y: 0.987; }
        frame 126 { x: 41.7; y: 3.7; skew-x: 148.4; skew-y: 138.9; scale-x: 1; scale-y: 0.986; }
        frame 127 { x: 41.9; y: -4.7; skew-x: 140.1; skew-y: 130.6; scale-x: 0.999; scale-y: 0.985; }
        frame 128 { x: 41.5; y: -13.4; skew-x: 131.9; skew-y: 122.3; scale-x: 1; scale-y: 0.986; }
        frame 129 { x: 31.6; y: -17.3; skew-x: 116.1; skew-y: 106.5; scale-x: 0.998; scale-y: 0.984; }
        frame 130 { x: 19.1; y: -20.2; skew-x: 100.3; skew-y: 90.7; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: 22; y: -21.5; skew-x: 99.5; skew-y: 90; scale-x: 0.997; }
        frame 132 { x: 24.8; y: -22.8; skew-x: 98.6; skew-y: 89.2; scale-x: -10000; scale-y: 0.983; }
        frame 133 { x: 27.8; y: -24.1; skew-x: 97.9; skew-y: 88.3; scale-y: -10000; }
        frame 134 { x: 17.8; y: -30.8; skew-x: 74; skew-y: 66.7; scale-x: 0.996; scale-y: 0.985; }
        frame 135 { x: 5.2; y: -31.8; skew-x: 49.9; skew-y: 45.1; scale-x: 0.997; scale-y: 0.99; }
        frame 136 { x: -7.3; y: -26.7; skew-x: 25.8; skew-y: 23.3; scale-x: -10000; scale-y: 0.994; }
        frame 137 { x: -17.3; y: -15.9; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: -15.8; y: -13.9; skew-x: 2.8; skew-y: 2.8; scale-x: 0.999; scale-y: 0.999; }
        frame 140 { x: -14.2; y: -11.8; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: -12.7; y: -9.9; skew-x: 5.1; skew-y: 5.1; scale-x: 0.998; scale-y: 0.998; }
        frame 142 { x: -7.3; y: -8.1; skew-x: 8; skew-y: 8; scale-x: 0.997; scale-y: 0.997; }
        frame 143 { x: -1.8; y: -6.3; skew-x: 11; skew-y: 11; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 3.6; y: -4.2; skew-x: 14.2; skew-y: 14.2; }
        frame 145 { x: 16.1; y: -9.4; skew-x: 18.8; skew-y: 18.8; scale-x: 0.995; scale-y: 0.995; }
        frame 146 { x: 28.6; y: -14.4; skew-x: 23.5; skew-y: 23.5; scale-x: 0.994; scale-y: 0.994; }
        frame 147 { x: 41.3; y: -19.2; skew-x: 28.2; skew-y: 28.2; scale-x: 0.995; scale-y: 0.995; }
        frame 148 { x: 33.4; y: -18.3; skew-x: 20.5; skew-y: 20.5; scale-x: 0.993; scale-y: 0.993; }
        frame 149 { x: 25.9; y: -16.7; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 18.6; y: -14.7; skew-x: 5.1; skew-y: 5.1; }
        frame 151 { x: 7.8; y: -12.3; skew-x: 2; skew-y: 2; }
        frame 152 { x: -2.5; y: -10.1; skew-x: -0.5; skew-y: -0.5; scale-x: 0.992; scale-y: 0.992; }
        frame 153 { x: -13.2; y: -7.7; skew-x: -3.6; skew-y: -3.6; scale-x: -10000; scale-y: -10000; }
        frame 154 { x: -25.3; y: 3.3; skew-x: -13.7; skew-y: -13.7; scale-x: 0.99; scale-y: 0.99; }
        frame 155 { x: -36.4; y: 15.1; skew-x: -24; skew-y: -24; scale-x: 0.989; scale-y: 0.989; }
        frame 156 { x: -46.5; y: 27.5; skew-x: -34.3; skew-y: -34.3; scale-x: 0.99; scale-y: 0.99; }
        frame 157 { x: -47.9; y: 33.6; skew-x: -37.5; skew-y: -37.5; scale-x: 0.988; scale-y: 0.988; }
        frame 158 { x: -49.1; y: 39.9; skew-x: -40.8; skew-y: -40.8; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: -50.4; y: 46; skew-x: -44; skew-y: -44; scale-x: 0.989; scale-y: 0.989; }
        frame 160 { x: -49.4; y: 28.9; skew-x: -24.7; skew-y: -24.7; scale-x: 0.987; scale-y: 0.987; }
        frame 161 { x: -44.6; y: 13.5; skew-x: -5.5; skew-y: -5.5; scale-x: 0.986; scale-y: 0.986; }
        frame 162 { x: -36.9; y: 0.8; skew-x: 13.5; skew-y: 13.5; scale-x: 0.985; scale-y: 0.985; }
        frame 163 { x: -31.9; y: -4.4; skew-x: 18.8; skew-y: 18.8; scale-x: 0.984; scale-y: 0.984; }
        frame 164 { x: -26.7; y: -9.6; skew-x: 24.3; skew-y: 24.3; scale-x: -10000; scale-y: -10000; }
        frame 165 { x: -21.4; y: -14.4; skew-x: 29.6; skew-y: 29.6; scale-x: 0.983; scale-y: 0.983; }
        frame 166 { x: -16.1; y: -18.9; skew-x: 35.1; skew-y: 35.1; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: -10.8; y: -23.2; skew-x: 40.4; skew-y: 40.4; scale-x: 0.984; scale-y: 0.984; }
        frame 168 { x: -6.6; y: -23.5; skew-x: 37.6; skew-y: 37.6; scale-x: 0.983; scale-y: 0.983; }
        frame 169 { x: -2.5; y: -23.9; skew-x: 34.6; skew-y: 34.6; scale-x: -10000; scale-y: -10000; }
        frame 170 { x: 1.6; y: -24.2; skew-x: 31.9; skew-y: 31.9; scale-x: 0.986; scale-y: 0.986; }
        frame 171 { x: 5.5; y: -21.6; skew-x: 29.1; skew-y: 29.1; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 9.4; y: -19.1; skew-x: 26.3; skew-y: 26.3; scale-x: 0.987; scale-y: 0.987; }
        frame 173 { x: 13.4; y: -16.5; skew-x: 23.6; skew-y: 23.6; scale-x: 0.99; scale-y: 0.99; }
        frame 174 { x: 18.2; y: -16.4; skew-x: 22.3; skew-y: 22.3; scale-x: 0.991; scale-y: 0.991; }
        frame 175 { x: 22.8; y: -16.3; skew-x: 21.1; skew-y: 21.1; scale-x: 0.992; scale-y: 0.992; }
        frame 176 { x: 27.9; y: -10000; skew-x: 19.9; skew-y: 19.9; scale-x: 0.995; scale-y: 0.995; }
        frame 177 { x: 23; y: -15.8; skew-x: 12.5; skew-y: 12.5; scale-x: 0.993; scale-y: 0.993; }
        frame 178 { x: 18.6; y: -14.7; skew-x: 5.1; skew-y: 5.1; scale-x: -10000; scale-y: -10000; }
        frame 179 { x: 7.8; y: -12.3; skew-x: 2; skew-y: 2; }
        frame 180 { x: -2.5; y: -10.1; skew-x: -0.5; skew-y: -0.5; scale-x: 0.992; scale-y: 0.992; }
        frame 181 { x: -13.2; y: -7.7; skew-x: -3.6; skew-y: -3.6; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: -28.6; y: 3.3; skew-x: -13.7; skew-y: -13.7; scale-x: 0.99; scale-y: 0.99; }
        frame 183 { x: -43.1; y: 15.1; skew-x: -24; skew-y: -24; scale-x: 0.989; scale-y: 0.989; }
        frame 184 { x: -56.5; y: 27.5; skew-x: -34.3; skew-y: -34.3; scale-x: 0.99; scale-y: 0.99; }
        frame 185 { x: -70.6; y: 37; skew-x: -36.8; skew-y: -36.8; scale-x: 0.987; scale-y: 0.987; }
        frame 186 { x: -85; y: 46.8; skew-x: -39.5; skew-y: -39.5; scale-x: 0.988; scale-y: 0.988; }
        frame 187 { x: -100.3; y: 83; skew-x: -53.8; skew-y: -53.8; scale-x: 0.986; scale-y: 0.986; }
        frame 188 { x: -113.5; y: 119.1; skew-x: -68.1; skew-y: -68.1; scale-x: 0.987; scale-y: 0.987; }
        frame 189 { x: -108.6; y: 128.1; skew-x: -74.4; skew-y: -74.4; scale-x: 0.986; scale-y: 0.986; }
        frame 190 { x: -103.6; y: 136.9; skew-x: -80.4; skew-y: -80.4; scale-x: -10000; scale-y: -10000; }
        frame 191 { x: -104.9; y: 137.3; skew-x: -80.1; skew-y: -80.9; scale-x: 0.965; scale-y: 0.998; }
        frame 192 { x: -106.1; y: 137.6; skew-x: -79.7; skew-y: -81.1; scale-x: 0.944; scale-y: 1.011; }
        frame 193 { x: -107.3; y: 132.9; skew-x: -77.1; skew-y: -77.8; scale-x: 0.965; scale-y: 0.998; }
        frame 194 { x: -108.6; y: 128.1; skew-x: -74.4; skew-y: -74.4; scale-x: 0.986; scale-y: 0.986; }
        frame 195 { x: -106.1; y: 132.5; skew-x: -77.4; skew-y: -77.4; scale-x: 0.985; scale-y: 0.985; }
        frame 196 { x: -103.6; y: 136.9; skew-x: -80.4; skew-y: -80.4; scale-x: 0.986; scale-y: 0.986; }
    }
    Track {
        source-name: "Zombie_gargantuar_innerarm_lower";
        frame-count: 197;
        frame 0 { x: -15.6; y: 25.9; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_INNERARM_LOWER; }
        frame 1 { x: -15.7; y: 25.4; skew-x: 1.5; skew-y: 1.5; image: none; }
        frame 2 { x: -10000; y: 24.9; skew-x: 3; skew-y: 3; }
        frame 3 { x: -15.6; y: 24.4; skew-x: 4.8; skew-y: 4.8; scale-x: 0.999; scale-y: 0.999; }
        frame 4 { x: -16.2; y: 25.9; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: -16.7; y: 27.6; skew-x: 2.3; skew-y: 2.3; }
        frame 6 { x: -17.2; y: 29.1; skew-x: 1; skew-y: 1; scale-x: 1; scale-y: 1; }
        frame 7 { x: -17.7; y: 30.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: -18.2; y: 32.2; skew-x: -1.2; skew-y: -1.2; }
        frame 9 { x: -18.7; y: 33.9; skew-x: -2.4; skew-y: -2.4; }
        frame 10 { x: -19.2; y: 35.5; skew-x: -3.7; skew-y: -3.7; }
        frame 11 { x: -18.5; y: 34.6; skew-x: -3.2; skew-y: -3.2; scale-y: 1.038; }
        frame 12 { x: -17.7; y: 33.8; skew-x: -2.7; skew-y: -2.7; scale-y: 1.077; }
        frame 13 { x: -16.9; y: 33.1; skew-x: -2.4; skew-y: -2.4; scale-y: 1.116; }
        frame 14 { x: -16.7; y: 32.2; skew-x: -2; skew-y: -2; scale-y: 1.101; }
        frame 15 { x: -16.5; y: 31.4; skew-x: -1.7; skew-y: -1.7; scale-y: 1.087; }
        frame 16 { x: -16.4; y: 30.5; skew-x: -1.4; skew-y: -1.4; scale-y: 1.072; }
        frame 17 { x: -16.3; y: 29.6; skew-x: -1.2; skew-y: -1.2; scale-y: 1.058; }
        frame 18 { x: -16; y: 28.7; skew-x: -0.7; skew-y: -0.7; scale-y: 1.043; }
        frame 19 { x: -15.9; y: 27.8; skew-x: -0.4; skew-y: -0.4; scale-y: 1.029; }
        frame 20 { x: -15.8; y: 26.9; skew-x: -0.2; skew-y: -0.2; scale-y: 1.014; }
        frame 21 { x: -15.6; y: 25.9; skew-x: 0; skew-y: 0; scale-y: 1; }
        frame 22 { x: -14; y: 22.4; skew-x: 4.1; skew-y: 4.1; scale-y: -10000; }
        frame 23 { x: -13.4; y: 20.4; skew-x: 6.8; skew-y: 6.8; scale-x: 0.999; scale-y: 0.999; }
        frame 24 { x: -12.6; y: 18.4; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -11.9; y: 16.6; skew-x: 12.3; skew-y: 12.3; }
        frame 26 { x: -11.1; y: 14.7; skew-x: 15; skew-y: 15; scale-x: 0.998; scale-y: 0.998; }
        frame 27 { x: -10.3; y: 12.9; skew-x: 17.7; skew-y: 17.7; scale-x: 0.999; scale-y: 0.999; }
        frame 28 { x: -9.7; y: 11.7; skew-x: 19.5; skew-y: 19.5; scale-x: 0.998; scale-y: 0.998; }
        frame 29 { x: -9; y: 10.5; skew-x: 21.3; skew-y: 21.3; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -8.4; y: 9.2; skew-x: 23.1; skew-y: 23.1; scale-x: 0.997; scale-y: 0.997; }
        frame 31 { x: -7.7; y: 8.1; skew-x: 24.8; skew-y: 24.8; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -7; y: 6.8; skew-x: 26.8; skew-y: 26.8; scale-x: 0.998; scale-y: 0.998; }
        frame 33 { x: -10.2; y: 14.7; skew-x: 22.3; skew-y: 22.3; scale-x: 0.997; scale-y: 0.997; }
        frame 34 { x: -13.4; y: 22.7; skew-x: 17.8; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: -16.4; y: 30.9; skew-x: 13.5; skew-y: 13.5; }
        frame 36 { x: -19.5; y: 39.2; skew-x: 9.1; skew-y: 9.1; }
        frame 37 { x: -18.1; y: 38.7; skew-x: 8; skew-y: 8; }
        frame 38 { x: -16.8; y: 38.3; skew-x: 7; skew-y: 7; }
        frame 39 { x: -15.6; y: 38; skew-x: 5.8; skew-y: 5.8; }
        frame 40 { x: -14.3; y: 37.5; skew-x: 4.8; skew-y: 4.8; }
        frame 41 { x: -13; y: 37; skew-x: 3.9; skew-y: 3.9; }
        frame 42 { x: -9.1; y: 35.9; skew-x: 5.3; skew-y: 5.3; scale-x: 0.996; scale-y: 0.996; }
        frame 43 { x: -5.3; y: 34.9; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: -1.4; y: 33.6; skew-x: 8; skew-y: 8; }
        frame 45 { x: 2.3; y: 32.6; skew-x: 9.3; skew-y: 9.3; }
        frame 46 { x: 6.2; y: 31.5; skew-x: 10.9; skew-y: 10.9; }
        frame 47 { x: 8; y: 30.6; skew-x: 10; skew-y: 10; scale-x: 0.995; scale-y: 0.995; }
        frame 48 { x: 9.9; y: 29.9; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 11.7; y: 29.2; skew-x: 8.5; skew-y: 8.5; }
        frame 50 { x: 13.4; y: 28.4; skew-x: 7.6; skew-y: 7.6; }
        frame 51 { x: 15.3; y: 27.5; skew-x: 6.9; skew-y: 6.9; }
        frame 52 { x: 16.4; y: 26.7; skew-x: 7.8; skew-y: 7.8; }
        frame 53 { x: 17.4; y: 25.7; skew-x: 8.5; skew-y: 8.5; }
        frame 54 { x: 18.4; y: 24.7; skew-x: 9.5; skew-y: 9.5; scale-x: 0.994; scale-y: 0.994; }
        frame 55 { x: 19.5; y: 23.8; skew-x: 10.3; skew-y: 10.3; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 20.6; y: 22.8; skew-x: 11.2; skew-y: 11.2; scale-x: 0.995; scale-y: 0.995; }
        frame 57 { x: 14.8; y: 26.8; skew-x: 9; skew-y: 9; scale-x: 0.994; scale-y: 0.994; }
        frame 58 { x: 9.1; y: 31; skew-x: 7; skew-y: 7; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 3.4; y: 35; skew-x: 4.8; skew-y: 4.8; scale-x: 0.993; scale-y: 0.993; }
        frame 60 { x: -2; y: 39.2; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -3; y: 36.3; skew-x: 3.5; skew-y: 3.5; scale-x: 0.994; scale-y: 0.994; }
        frame 62 { x: -4.1; y: 33.4; skew-x: 4.3; skew-y: 4.3; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: -5; y: 30.4; skew-x: 5.1; skew-y: 5.1; scale-x: 0.995; scale-y: 0.995; }
        frame 64 { x: -5.9; y: 27.5; skew-x: 6; skew-y: 6; scale-x: 0.996; scale-y: 0.996; }
        frame 65 { x: -7; y: 24.5; skew-x: 6.8; skew-y: 6.8; scale-x: 0.997; scale-y: 0.997; }
        frame 66 { x: -8.4; y: 24.1; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: -9.8; y: 23.8; skew-x: 5.6; skew-y: 5.6; scale-x: 0.998; scale-y: 0.998; }
        frame 68 { x: -11.1; y: 23.3; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: -12.6; y: 22.9; skew-x: 4.5; skew-y: 4.5; scale-x: 0.999; scale-y: 0.999; }
        frame 70 { x: -14; y: 22.4; skew-x: 4.1; skew-y: 4.1; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -11.2; y: 17.6; skew-x: 11.8; skew-y: 11.8; scale-x: 0.998; scale-y: 1.011; }
        frame 73 { x: -8; y: 13.5; skew-x: 19.3; skew-y: 19.3; scale-x: 0.997; scale-y: 1.023; }
        frame 74 { x: -4.4; y: 9.8; skew-x: 27.1; skew-y: 27.1; scale-x: 0.996; scale-y: 1.035; }
        frame 75 { x: -0.5; y: 6.7; skew-x: 34.9; skew-y: 34.9; scale-x: 0.997; scale-y: 1.049; }
        frame 76 { x: 3.9; y: 3.6; skew-x: 42.6; skew-y: 42.6; scale-x: 0.995; scale-y: 1.034; }
        frame 77 { x: 8.6; y: 1.2; skew-x: 50.4; skew-y: 50.4; scale-x: -10000; scale-y: 1.021; }
        frame 78 { x: 12.9; y: -0.7; skew-x: 58.2; skew-y: 58.2; scale-y: 1.008; }
        frame 79 { x: 17.1; y: -2.3; skew-x: 65.9; skew-y: 65.9; scale-x: 0.997; scale-y: 0.997; }
        frame 80 { x: 22.9; y: -6.3; skew-x: 72.2; skew-y: 72.7; scale-x: 0.995; scale-y: 1.038; }
        frame 81 { x: 28.4; y: -9.7; skew-x: 78.4; skew-y: 79.5; scale-x: -10000; scale-y: 1.08; }
        frame 82 { x: 33.8; y: -12.5; skew-x: 84.5; skew-y: 86.2; scale-y: 1.122; }
        frame 83 { x: 38.7; y: -14.9; skew-x: 90.5; skew-y: 92.8; scale-y: 1.164; }
        frame 84 { x: 43.4; y: -16.8; skew-x: 96.8; skew-y: 99.5; scale-x: 0.994; scale-y: 1.206; }
        frame 85 { x: 47.9; y: -18.1; skew-x: 103; skew-y: 106.3; scale-x: 0.995; scale-y: 1.248; }
        frame 86 { x: 41.9; y: -19.5; skew-x: 99.3; skew-y: 102.5; scale-x: 0.994; scale-y: 1.247; }
        frame 87 { x: 35.7; y: -20.9; skew-x: 95.5; skew-y: 98.8; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 29.5; y: -22.1; skew-x: 91.8; skew-y: 95.1; }
        frame 89 { x: 23.2; y: -23.2; skew-x: 88.3; skew-y: 91.5; }
        frame 90 { x: -2.8; y: -4.4; skew-x: 56.7; skew-y: 59.9; scale-x: 0.99; scale-y: 1.243; }
        frame 91 { x: -32.2; y: 23.6; skew-x: 25.1; skew-y: 28.3; scale-x: -10000; scale-y: 1.242; }
        frame 92 { x: -34; y: 36.2; skew-x: 13.8; skew-y: 17; scale-x: 0.989; scale-y: -10000; }
        frame 93 { x: -10000; y: 37.4; skew-x: -10000; skew-y: -10000; scale-x: 0.988; scale-y: 1.241; }
        frame 94 { y: 38.6; scale-x: 0.989; scale-y: 1.242; }
        frame 95 { y: 37.4; scale-x: 0.988; scale-y: 1.241; }
        frame 96 { y: 36.2; scale-x: 0.989; scale-y: 1.242; }
        frame 97 { x: -31.4; y: 34.1; skew-x: 12.3; skew-y: 15.1; scale-x: 0.99; scale-y: 1.206; }
        frame 98 { x: -28.5; y: 32; skew-x: 11; skew-y: 13.3; scale-x: 0.991; scale-y: 1.172; }
        frame 99 { x: -25.8; y: 30.1; skew-x: 9.5; skew-y: 11.3; scale-x: 0.993; scale-y: 1.137; }
        frame 100 { x: -22.9; y: 28.1; skew-x: 8.1; skew-y: 9.5; scale-x: 0.995; scale-y: 1.103; }
        frame 101 { x: -19.9; y: 26.1; skew-x: 6.8; skew-y: 7.8; scale-x: 0.996; scale-y: 1.068; }
        frame 102 { x: -17; y: 24.1; skew-x: 5.3; skew-y: 5.8; scale-x: 0.998; scale-y: 1.034; }
        frame 103 { x: -14; y: 22.4; skew-x: 4.1; skew-y: 4.1; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: -11.2; y: 17.6; skew-x: 11.8; skew-y: 11.8; scale-x: 0.998; scale-y: 1.011; }
        frame 106 { x: -8; y: 13.5; skew-x: 19.3; skew-y: 19.3; scale-x: 0.997; scale-y: 1.023; }
        frame 107 { x: -4.4; y: 9.8; skew-x: 27.1; skew-y: 27.1; scale-x: 0.996; scale-y: 1.035; }
        frame 108 { x: -0.5; y: 6.7; skew-x: 34.9; skew-y: 34.9; scale-x: 0.997; scale-y: 1.049; }
        frame 109 { x: 1; y: 2.7; skew-x: 50.1; skew-y: 54.2; scale-x: 1.005; scale-y: 1.033; }
        frame 110 { x: 1.6; y: 1.3; skew-x: 65.2; skew-y: 73.7; scale-x: 1.015; scale-y: 1.02; }
        frame 111 { x: 0.4; y: 1.6; skew-x: 80.5; skew-y: 92.8; scale-x: 1.026; scale-y: 1.007; }
        frame 112 { x: -2.8; y: 2.9; skew-x: 95.6; skew-y: 112.2; scale-x: 1.036; scale-y: 0.993; }
        frame 113 { x: 0.2; y: -4.7; skew-x: 105; skew-y: 121.8; scale-x: 1.034; scale-y: 0.99; }
        frame 114 { x: 6.4; y: -6; skew-x: 121.6; skew-y: 138.4; scale-x: 1.032; scale-y: 0.988; }
        frame 115 { x: 10.4; y: -6.8; skew-x: 138.1; skew-y: 154.9; scale-x: 1.031; scale-y: -10000; }
        frame 116 { x: 12.4; y: -8.1; skew-x: 154.7; skew-y: 171.5; scale-x: -10000; scale-y: 0.989; }
        frame 117 { x: 12.2; y: -10.3; skew-x: 171.3; skew-y: 187.9; scale-x: 1.032; scale-y: -10000; }
        frame 118 { x: 11.9; y: -7.1; skew-x: 178; skew-y: 192; scale-x: 1.023; scale-y: 0.988; }
        frame 119 { x: 11.2; y: -4.1; skew-x: 184.5; skew-y: 196.3; scale-x: 1.013; scale-y: 0.987; }
        frame 120 { x: 10.4; y: -1.1; skew-x: 191.3; skew-y: 200.3; scale-x: 1.003; scale-y: -10000; }
        frame 121 { x: 9.2; y: 1.4; skew-x: 198.1; skew-y: 204.7; scale-x: 0.994; scale-y: 0.988; }
        frame 122 { x: 8.3; y: 1.9; skew-x: 200.8; skew-y: 207.3; scale-x: 0.993; scale-y: 0.986; }
        frame 123 { x: 7.4; y: 2.4; skew-x: 203.6; skew-y: 210.2; scale-x: 0.994; scale-y: 0.987; }
        frame 124 { x: 10.2; y: -1.2; skew-x: 187.8; skew-y: 194.3; scale-x: 0.992; scale-y: 0.986; }
        frame 125 { x: 11.6; y: -6.7; skew-x: 172.2; skew-y: 178.7; scale-x: -10000; scale-y: 0.985; }
        frame 126 { x: 11.2; y: -13.4; skew-x: 156.4; skew-y: 163.2; scale-x: 0.99; scale-y: 0.984; }
        frame 127 { x: 8.9; y: -21.1; skew-x: 140.7; skew-y: 147.4; scale-x: 0.989; scale-y: 0.982; }
        frame 128 { x: 4.5; y: -29.3; skew-x: 124.9; skew-y: 131.5; scale-x: -10000; scale-y: 0.983; }
        frame 129 { x: -4.9; y: -23.6; skew-x: 99.5; skew-y: 106.1; scale-x: 0.988; scale-y: 1.177; }
        frame 130 { x: -18.5; y: -18.4; skew-x: 74.2; skew-y: 80.8; scale-x: 0.987; scale-y: 1.373; }
        frame 131 { x: -15.5; y: -19.2; skew-x: 73.4; skew-y: 80; scale-x: 0.986; scale-y: 1.372; }
        frame 132 { x: -12.5; y: -19.9; skew-x: 72.7; skew-y: 79.2; scale-x: 0.985; scale-y: 1.371; }
        frame 133 { x: -9.6; y: -20.8; skew-x: 71.7; skew-y: 78.3; scale-x: 0.986; scale-y: -10000; }
        frame 134 { x: -12.9; y: -12.9; skew-x: 58.7; skew-y: 63.7; scale-x: 0.987; scale-y: 1.275; }
        frame 135 { x: -16.8; y: -2.3; skew-x: 45.6; skew-y: 48.9; scale-x: 0.991; scale-y: 1.183; }
        frame 136 { x: -16.6; y: 7.6; skew-x: 24.8; skew-y: 26.3; scale-x: 0.994; scale-y: 1.09; }
        frame 137 { x: -14; y: 22.4; skew-x: 4.1; skew-y: 4.1; scale-x: 1; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: -14.5; y: 24.8; skew-x: 0; skew-y: 0; scale-x: 0.999; scale-y: 0.999; }
        frame 140 { x: -15; y: 27.4; skew-x: -4.2; skew-y: -4.2; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: -15.2; y: 29.9; skew-x: -8.3; skew-y: -8.3; }
        frame 142 { x: -12.7; y: 32.5; skew-x: -10.2; skew-y: -10.2; scale-x: 0.998; scale-y: 0.998; }
        frame 143 { x: -10.1; y: 35.2; skew-x: -12.2; skew-y: -12.2; scale-x: 0.997; scale-y: 0.997; }
        frame 144 { x: -7.6; y: 37.8; skew-x: -14.1; skew-y: -14.1; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 1.3; y: 31.3; skew-x: -9.4; skew-y: -9.4; scale-x: 0.996; scale-y: 0.996; }
        frame 146 { x: 10.5; y: 24.9; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 20; y: 18.7; skew-x: -0; skew-y: -0; }
        frame 148 { x: 17.5; y: 21.6; skew-x: -7.7; skew-y: -7.7; scale-x: 0.995; scale-y: 0.995; }
        frame 149 { x: 15.5; y: 24.8; skew-x: -15.4; skew-y: -15.4; scale-x: 0.994; scale-y: 0.994; }
        frame 150 { x: 14; y: 28.4; skew-x: -23.2; skew-y: -23.2; scale-x: -10000; scale-y: -10000; }
        frame 151 { x: 5.5; y: 30.7; skew-x: -26; skew-y: -26; scale-x: 0.992; scale-y: 0.992; }
        frame 152 { x: -2.8; y: 33; skew-x: -29; skew-y: -29; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: -11.2; y: 35.5; skew-x: -31.9; skew-y: -31.9; scale-x: 0.993; scale-y: 0.993; }
        frame 154 { x: -15.9; y: 44.9; skew-x: -42.2; skew-y: -42.2; scale-x: 0.99; scale-y: 0.99; }
        frame 155 { x: -19.7; y: 54.3; skew-x: -52.3; skew-y: -52.3; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: -22.6; y: 63.5; skew-x: -62.6; skew-y: -62.6; scale-x: 0.991; scale-y: 0.991; }
        frame 157 { x: -22; y: 68.2; skew-x: -65.9; skew-y: -65.9; scale-x: 0.989; scale-y: 0.989; }
        frame 158 { x: -21.4; y: 72.9; skew-x: -69.1; skew-y: -69.1; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: -20.7; y: 77.5; skew-x: -72.4; skew-y: -72.4; scale-x: 0.99; scale-y: 0.99; }
        frame 160 { x: -33; y: 65.9; skew-x: -53.3; skew-y: -53.3; scale-x: 0.987; scale-y: 0.987; }
        frame 161 { x: -42.1; y: 53.9; skew-x: -34; skew-y: -34; scale-x: 0.986; scale-y: 0.986; }
        frame 162 { x: -47.7; y: 42.5; skew-x: -14.8; skew-y: -14.8; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: -46.4; y: 35.3; skew-x: -9.2; skew-y: -9.2; scale-x: 0.985; scale-y: 0.985; }
        frame 164 { x: -44.9; y: 28.4; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 165 { x: -43.2; y: 21.7; skew-x: 1.3; skew-y: 1.3; }
        frame 166 { x: -41.4; y: 15.2; skew-x: 6.5; skew-y: 6.5; }
        frame 167 { x: -39.3; y: 8.9; skew-x: 12; skew-y: 12; }
        frame 168 { x: -33.5; y: 9.8; skew-x: 9.1; skew-y: 9.1; }
        frame 169 { x: -27.6; y: 10.5; skew-x: 6.3; skew-y: 6.3; scale-x: 0.987; scale-y: 0.987; }
        frame 170 { x: -21.7; y: 11.4; skew-x: 3.6; skew-y: 3.6; scale-x: 0.988; scale-y: 0.988; }
        frame 171 { x: -16; y: 14.9; skew-x: 0.8; skew-y: 0.8; scale-x: 0.989; scale-y: 0.989; }
        frame 172 { x: -10.2; y: 18.6; skew-x: -1.7; skew-y: -1.7; scale-x: 0.991; scale-y: 0.991; }
        frame 173 { x: -4.5; y: 22.2; skew-x: -4.5; skew-y: -4.5; scale-x: 0.992; scale-y: 0.992; }
        frame 174 { x: 1; y: 22.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.993; scale-y: 0.993; }
        frame 175 { x: 6.6; y: 23.5; skew-x: -6.9; skew-y: -6.9; scale-x: 0.994; scale-y: 0.994; }
        frame 176 { x: 12.3; y: 24.2; skew-x: -8.3; skew-y: -8.3; scale-x: 0.996; scale-y: 0.996; }
        frame 177 { x: 13; y: 26.3; skew-x: -15.7; skew-y: -15.7; scale-x: 0.994; scale-y: 0.994; }
        frame 178 { x: 14; y: 28.4; skew-x: -23.2; skew-y: -23.2; scale-x: -10000; scale-y: -10000; }
        frame 179 { x: 5.5; y: 30.7; skew-x: -26; skew-y: -26; scale-x: 0.992; scale-y: 0.992; }
        frame 180 { x: -2.8; y: 33; skew-x: -29; skew-y: -29; scale-x: -10000; scale-y: -10000; }
        frame 181 { x: -11.2; y: 35.5; skew-x: -31.9; skew-y: -31.9; scale-x: 0.993; scale-y: 0.993; }
        frame 182 { x: -19.3; y: 44.9; skew-x: -42.2; skew-y: -42.2; scale-x: 0.99; scale-y: 0.99; }
        frame 183 { x: -26.4; y: 54.3; skew-x: -52.3; skew-y: -52.3; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: -32.6; y: 63.5; skew-x: -62.6; skew-y: -62.6; scale-x: 0.991; scale-y: 0.991; }
        frame 185 { x: -40.8; y: 79.2; skew-x: -73.4; skew-y: -73.4; scale-x: 0.989; scale-y: 0.989; }
        frame 186 { x: -47.9; y: 94.1; skew-x: -84; skew-y: -84; scale-x: 0.99; scale-y: 0.99; }
        frame 187 { x: -56.5; y: 116.7; skew-x: -94.7; skew-y: -94.7; scale-x: 0.989; scale-y: 0.989; }
        frame 188 { x: -64.3; y: 138.5; skew-x: -105.6; skew-y: -105.6; scale-x: 0.988; scale-y: 0.988; }
        frame 189 { x: -64.4; y: -10000; skew-x: -105.5; skew-y: -105.5; scale-x: -10000; scale-y: -10000; }
        frame 190 { x: -64.3; skew-x: -105.6; skew-y: -105.6; }
        frame 191 { x: -65; y: 138.8; skew-x: -106; skew-y: -105; scale-x: 0.968; scale-y: 0.998; }
        frame 192 { x: -65.7; y: 139.1; skew-x: -106.7; skew-y: -104.5; scale-x: 0.95; scale-y: 1.01; }
        frame 193 { x: -65.1; y: 138.8; skew-x: -106; skew-y: -104.9; scale-x: 0.968; scale-y: 0.998; }
        frame 194 { x: -64.4; y: 138.5; skew-x: -105.5; skew-y: -105.5; scale-x: 0.988; scale-y: 0.988; }
        frame 195 { x: -10000; y: -10000; skew-x: -105.4; skew-y: -105.4; scale-x: 0.987; scale-y: 0.987; }
        frame 196 { x: -64.3; skew-x: -105.6; skew-y: -105.6; scale-x: 0.988; scale-y: 0.988; }
    }
    Track {
        source-name: "Zombie_gargantuar_innerarm_hand";
        frame-count: 197;
        frame 0 { x: -22.8; y: 56; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_INNERARM_HAND; }
        frame 1 { x: -23.6; y: 55.1; skew-x: 1.8; skew-y: 1.8; image: none; }
        frame 2 { x: -24.2; y: 54.1; skew-x: 3.8; skew-y: 3.8; scale-x: 0.999; scale-y: 0.999; }
        frame 3 { x: -24.7; y: 53; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: -24.9; y: 55.3; skew-x: 3.5; skew-y: 3.5; }
        frame 5 { x: -25; y: 57.6; skew-x: 1.3; skew-y: 1.3; }
        frame 6 { x: -10000; y: 59.8; skew-x: -0.7; skew-y: -0.7; }
        frame 7 { y: 62.1; skew-x: -2.9; skew-y: -2.9; }
        frame 8 { y: 64.3; skew-x: -4.9; skew-y: -4.9; }
        frame 9 { x: -24.9; y: 66.8; skew-x: -7.2; skew-y: -7.2; }
        frame 10 { x: -25; y: 69.3; skew-x: -9.5; skew-y: -9.5; }
        frame 11 { x: -24.4; y: 70.1; skew-x: -10; skew-y: -10; }
        frame 12 { x: -23.9; y: 71; skew-x: -10.7; skew-y: -10.7; scale-x: 0.998; scale-y: 0.998; }
        frame 13 { x: -23.4; y: 71.9; skew-x: -11.5; skew-y: -11.5; scale-x: 0.999; scale-y: 0.999; }
        frame 14 { x: -23.3; y: 69.8; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: -10000; y: 67.8; skew-x: -8.5; skew-y: -8.5; }
        frame 16 { y: 65.9; skew-x: -7.2; skew-y: -7.2; }
        frame 17 { x: -23.2; y: 63.9; skew-x: -5.7; skew-y: -5.7; }
        frame 18 { x: -23.1; y: 61.9; skew-x: -4.2; skew-y: -4.2; }
        frame 19 { x: -23; y: 59.9; skew-x: -2.7; skew-y: -2.7; scale-x: 1; scale-y: 1; }
        frame 20 { x: -22.8; y: 57.9; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -10000; y: 56; skew-x: 0; skew-y: 0; }
        frame 22 { x: -24.4; y: 53.9; skew-x: -2.1; skew-y: -2.1; }
        frame 23 { x: -25.1; y: 52; skew-x: -1.2; skew-y: -1.2; scale-x: 0.999; scale-y: 0.999; }
        frame 24 { x: -25.9; y: 50.4; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -26.7; y: 48.9; skew-x: 0; skew-y: 0; }
        frame 26 { x: -27.5; y: 47.1; skew-x: 0.8; skew-y: 0.8; scale-x: 0.998; scale-y: 0.998; }
        frame 27 { x: -28.4; y: 45.4; skew-x: 1.6; skew-y: 1.6; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -28.1; y: 43.5; skew-x: 3.5; skew-y: 3.5; }
        frame 29 { x: -27.9; y: 41.9; skew-x: 5.3; skew-y: 5.3; }
        frame 30 { x: -27.5; y: 40.1; skew-x: 7.3; skew-y: 7.3; }
        frame 31 { x: -27.1; y: 38.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.997; scale-y: 0.997; }
        frame 32 { x: -26.8; y: 36.6; skew-x: 11.2; skew-y: 11.2; scale-x: 0.998; scale-y: 0.998; }
        frame 33 { x: -27; y: 44.3; skew-x: 10.5; skew-y: 10.5; scale-x: 0.997; scale-y: 0.997; }
        frame 34 { x: -27.2; y: 52.3; skew-x: 9.8; skew-y: 9.8; scale-x: 0.996; scale-y: 0.996; }
        frame 35 { x: -27.4; y: 60; skew-x: 9.1; skew-y: 9.1; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -10000; y: 67.7; skew-x: 8.6; skew-y: 8.6; }
        frame 37 { x: -25.5; y: 66.7; skew-x: 8.5; skew-y: 8.5; scale-x: 0.995; scale-y: 0.995; }
        frame 38 { x: -23.5; y: 65.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: -21.6; y: 64.7; skew-x: 8.3; skew-y: 8.3; }
        frame 40 { x: -19.7; y: 63.5; skew-x: -10000; skew-y: -10000; }
        frame 41 { x: -17.8; y: 62.3; skew-x: 8.4; skew-y: 8.4; }
        frame 42 { x: -14.6; y: 61; skew-x: 9.8; skew-y: 9.8; scale-x: 0.994; scale-y: 0.994; }
        frame 43 { x: -11.3; y: 59.8; skew-x: 11.1; skew-y: 11.1; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: -8.1; y: 58.5; skew-x: 12.5; skew-y: 12.5; }
        frame 45 { x: -4.8; y: 57.2; skew-x: 14; skew-y: 14; scale-x: 0.993; scale-y: 0.993; }
        frame 46 { x: -1.6; y: 56; skew-x: 15.4; skew-y: 15.4; scale-x: 0.994; scale-y: 0.994; }
        frame 47 { x: -1; y: 56.9; skew-x: 9.6; skew-y: 9.6; scale-x: 0.993; scale-y: 0.993; }
        frame 48 { x: -0; y: 57.9; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 1; y: 59; skew-x: -1.4; skew-y: -1.4; }
        frame 50 { x: 2.2; y: 60.6; skew-x: -7.2; skew-y: -7.2; scale-x: 0.992; scale-y: 0.992; }
        frame 51 { x: 3.8; y: 62.3; skew-x: -13; skew-y: -13; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 4; y: 62.8; skew-x: -15.5; skew-y: -15.5; scale-x: 0.991; scale-y: 0.991; }
        frame 53 { x: 4.2; y: 63.3; skew-x: -18; skew-y: -18; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 4.4; y: 63.6; skew-x: -20.5; skew-y: -20.5; scale-x: 0.99; scale-y: 0.99; }
        frame 55 { x: 4.8; y: 64.3; skew-x: -23.2; skew-y: -23.2; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 5.1; y: 64.8; skew-x: -25.7; skew-y: -25.7; scale-x: 0.991; scale-y: 0.991; }
        frame 57 { x: 0.8; y: 68; skew-x: -24.5; skew-y: -24.5; scale-x: 0.989; scale-y: 0.989; }
        frame 58 { x: -3.4; y: 71.3; skew-x: -23.2; skew-y: -23.2; scale-x: 0.988; scale-y: 0.988; }
        frame 59 { x: -7.8; y: 74.4; skew-x: -22; skew-y: -22; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: -12.1; y: 77.8; skew-x: -20.9; skew-y: -20.9; }
        frame 61 { x: -13.7; y: 73.7; skew-x: -17.9; skew-y: -17.9; }
        frame 62 { x: -15.2; y: 69.6; skew-x: -14.9; skew-y: -14.9; scale-x: 0.99; scale-y: 0.99; }
        frame 63 { x: -16.8; y: 65.7; skew-x: -12; skew-y: -12; scale-x: 0.991; scale-y: 0.991; }
        frame 64 { x: -18.2; y: 61.6; skew-x: -9; skew-y: -9; scale-x: 0.993; scale-y: 0.993; }
        frame 65 { x: -19.6; y: 57.9; skew-x: -6.2; skew-y: -6.2; scale-x: 0.994; scale-y: 0.994; }
        frame 66 { x: -20.5; y: 57; skew-x: -5.2; skew-y: -5.2; scale-x: 0.995; scale-y: 0.995; }
        frame 67 { x: -21.6; y: 56.3; skew-x: -4.4; skew-y: -4.4; scale-x: 0.996; scale-y: 0.996; }
        frame 68 { x: -22.5; y: 55.5; skew-x: -3.7; skew-y: -3.7; scale-x: 0.997; scale-y: 0.997; }
        frame 69 { x: -23.6; y: 54.7; skew-x: -2.9; skew-y: -2.9; scale-x: 0.998; scale-y: 0.998; }
        frame 70 { x: -24.4; y: 53.9; skew-x: -2.1; skew-y: -2.1; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -24.2; y: 44.9; skew-x: 10.3; skew-y: 10.3; scale-x: 0.998; scale-y: 0.998; }
        frame 73 { x: -23; y: 36.9; skew-x: 23.1; skew-y: 23.1; scale-x: 0.997; scale-y: 0.997; }
        frame 74 { x: -21.3; y: 30.3; skew-x: 35.6; skew-y: 35.6; scale-x: 0.996; scale-y: 0.996; }
        frame 75 { x: -19.3; y: 25.1; skew-x: 48.4; skew-y: 48.4; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: -12.6; y: 18; skew-x: 61.2; skew-y: 61.2; scale-x: 0.995; scale-y: 0.995; }
        frame 77 { x: -6.4; y: 12.3; skew-x: 73.7; skew-y: 73.7; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: -0.8; y: 8; skew-x: 86.5; skew-y: 86.5; scale-x: 0.996; scale-y: 0.996; }
        frame 79 { x: 3.8; y: 4.8; skew-x: 99.1; skew-y: 99.1; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 7.8; y: -0.7; skew-x: 105.3; skew-y: 105.6; scale-y: 0.993; }
        frame 81 { x: 11.6; y: -6; skew-x: 111.6; skew-y: 112.3; scale-x: 0.997; scale-y: 0.991; }
        frame 82 { x: 15; y: -11.3; skew-x: 117.8; skew-y: 118.8; scale-x: 0.998; scale-y: 0.989; }
        frame 83 { x: 18; y: -16.3; skew-x: 124.1; skew-y: 125.6; scale-x: 0.999; scale-y: 0.987; }
        frame 84 { x: 20.8; y: -21.5; skew-x: 130.6; skew-y: 132.1; scale-x: 1; scale-y: 0.985; }
        frame 85 { x: 23.1; y: -26.5; skew-x: 136.8; skew-y: 138.8; scale-x: 1.003; scale-y: -10000; }
        frame 86 { x: 16.7; y: -26.1; skew-x: 133.1; skew-y: 135.1; scale-x: 1.001; scale-y: 0.983; }
        frame 87 { x: 10.3; y: -25.7; skew-x: 129.4; skew-y: 131.4; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 3.6; y: -25.4; skew-x: 125.6; skew-y: 127.6; }
        frame 89 { x: -2.8; y: -24.9; skew-x: 122; skew-y: 124; scale-x: 1.002; scale-y: 0.984; }
        frame 90 { x: -26.5; y: 4.8; skew-x: 68.7; skew-y: 70.5; scale-x: 0.998; scale-y: 0.98; }
        frame 91 { x: -58.9; y: 57.1; skew-x: 15.1; skew-y: 16.9; scale-x: 0.996; scale-y: 0.978; }
        frame 92 { x: -54.9; y: 81.8; skew-x: -14.4; skew-y: -12.6; scale-x: 0.994; scale-y: 0.977; }
        frame 93 { x: -54.8; y: 84.1; skew-x: -10000; skew-y: -12.5; scale-x: 0.993; scale-y: 0.976; }
        frame 94 { x: -54.9; y: 86.2; skew-y: -12.6; scale-x: 0.994; scale-y: 0.977; }
        frame 95 { x: -54.8; y: 84.1; skew-y: -12.5; scale-x: 0.993; scale-y: 0.976; }
        frame 96 { x: -54.9; y: 81.8; skew-y: -12.6; scale-x: 0.994; scale-y: 0.977; }
        frame 97 { x: -50.5; y: 77.8; skew-x: -12.7; skew-y: -11; scale-x: -10000; scale-y: 0.979; }
        frame 98 { x: -46.2; y: 73.8; skew-x: -10.9; skew-y: -9.5; scale-x: 0.995; scale-y: 0.983; }
        frame 99 { x: -41.8; y: 69.8; skew-x: -9; skew-y: -8; scale-x: 0.996; scale-y: 0.986; }
        frame 100 { x: -37.5; y: 65.8; skew-x: -7.2; skew-y: -6.5; scale-x: 0.997; scale-y: 0.989; }
        frame 101 { x: -33.2; y: 61.9; skew-x: -5.5; skew-y: -5; scale-x: 0.998; scale-y: 0.993; }
        frame 102 { x: -28.7; y: 57.9; skew-x: -3.7; skew-y: -3.5; scale-x: 0.999; scale-y: 0.996; }
        frame 103 { x: -24.4; y: 53.9; skew-x: -2.1; skew-y: -2.1; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: -24.2; y: 44.9; skew-x: 10.3; skew-y: 10.3; scale-x: 0.998; scale-y: 0.998; }
        frame 106 { x: -23; y: 36.9; skew-x: 23.1; skew-y: 23.1; scale-x: 0.997; scale-y: 0.997; }
        frame 107 { x: -21.3; y: 30.3; skew-x: 35.6; skew-y: 35.6; scale-x: 0.996; scale-y: 0.996; }
        frame 108 { x: -19.3; y: 25.1; skew-x: 48.4; skew-y: 48.4; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: -12.9; y: 13.1; skew-x: 71.4; skew-y: 71.4; scale-x: 0.994; scale-y: 0.994; }
        frame 110 { x: -8.5; y: 5.3; skew-x: 94; skew-y: 94; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: -7.5; y: 0.9; skew-x: 117; skew-y: 117; scale-x: 0.992; scale-y: 0.992; }
        frame 112 { x: -11; y: -1.6; skew-x: 139.9; skew-y: 139.9; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: -6.5; y: -5.1; skew-x: 159.7; skew-y: 159.7; scale-x: 0.99; scale-y: 0.99; }
        frame 114 { x: -0.8; y: -2.6; skew-x: 179.2; skew-y: 179.2; scale-x: 0.989; scale-y: 0.989; }
        frame 115 { x: 2.3; y: -2.3; skew-x: 198.8; skew-y: 198.8; scale-x: 0.988; scale-y: 0.988; }
        frame 116 { x: 3.8; y: -5.3; skew-x: 218.4; skew-y: 218.4; scale-x: 0.986; scale-y: 0.986; }
        frame 117 { x: 4.8; y: -11.4; skew-x: 237.9; skew-y: 237.9; scale-x: 0.987; scale-y: 0.987; }
        frame 118 { x: 8; y: -10000; skew-x: 236.7; skew-y: 236.7; scale-x: 0.986; scale-y: 0.986; }
        frame 119 { x: 10.9; y: -11.3; skew-x: 235.6; skew-y: 235.6; scale-x: 0.985; scale-y: 0.985; }
        frame 120 { x: 14.1; y: -11.2; skew-x: 234.4; skew-y: 234.4; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 17; y: -11.1; skew-x: 233.1; skew-y: 233.1; scale-x: 0.987; scale-y: 0.987; }
        frame 122 { x: 15.1; y: -10; skew-x: 236.9; skew-y: 236.9; scale-x: 0.985; scale-y: 0.985; }
        frame 123 { x: 13.2; y: -8.9; skew-x: 240.4; skew-y: 240.4; scale-x: 0.986; scale-y: 0.986; }
        frame 124 { x: 11.1; y: -10.9; skew-x: 224.4; skew-y: 224.4; scale-x: 0.984; scale-y: 0.984; }
        frame 125 { x: 8.7; y: -15.3; skew-x: 208.3; skew-y: 208.3; scale-x: 0.983; scale-y: 0.983; }
        frame 126 { x: 5.6; y: -21.9; skew-x: 192.1; skew-y: 192.1; scale-x: -10000; scale-y: -10000; }
        frame 127 { x: 1.1; y: -30.3; skew-x: 176.2; skew-y: 176.2; }
        frame 128 { x: -5; y: -40.4; skew-x: 160; skew-y: 160; scale-x: 0.982; scale-y: 0.982; }
        frame 129 { x: -25.7; y: -28.7; skew-x: 129.9; skew-y: 129.9; scale-x: 0.98; scale-y: 0.98; }
        frame 130 { x: -54.4; y: -15.8; skew-x: 100; skew-y: 100; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: -56.1; y: -17.6; skew-x: 86.5; skew-y: 86.5; scale-x: 0.979; scale-y: 0.979; }
        frame 132 { x: -58.8; y: -18.2; skew-x: 73; skew-y: 73; scale-x: 0.977; scale-y: 0.977; }
        frame 133 { x: -62.2; y: -17.3; skew-x: 59.4; skew-y: 59.4; scale-x: -10000; scale-y: -10000; }
        frame 134 { x: -53.7; y: -3.6; skew-x: 61.2; skew-y: 61.2; scale-x: 0.981; scale-y: 0.981; }
        frame 135 { x: -45.3; y: 9.6; skew-x: 63; skew-y: 63; scale-x: 0.987; scale-y: 0.987; }
        frame 136 { x: -37.2; y: 30.8; skew-x: 30.3; skew-y: 30.3; scale-x: 0.992; scale-y: 0.992; }
        frame 137 { x: -24.4; y: 53.9; skew-x: -2.1; skew-y: -2.1; scale-x: 1; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: -22.1; y: 57; skew-x: -6.2; skew-y: -6.2; scale-x: 0.999; scale-y: 0.999; }
        frame 140 { x: -19.7; y: 60.3; skew-x: -10.2; skew-y: -10.2; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: -17.3; y: 63.6; skew-x: -14.4; skew-y: -14.4; }
        frame 142 { x: -14.6; y: 67.6; skew-x: -20.2; skew-y: -20.2; scale-x: 0.998; scale-y: 0.998; }
        frame 143 { x: -11.6; y: 71.7; skew-x: -26.2; skew-y: -26.2; scale-x: 0.997; scale-y: 0.997; }
        frame 144 { x: -8.3; y: 75.9; skew-x: -32.3; skew-y: -32.3; scale-x: 0.998; scale-y: 0.998; }
        frame 145 { x: -2.9; y: 71.1; skew-x: -30.2; skew-y: -30.2; scale-x: 0.996; scale-y: 0.996; }
        frame 146 { x: 2.2; y: 66.5; skew-x: -28.4; skew-y: -28.4; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 7.7; y: 61.8; skew-x: -26.5; skew-y: -26.5; scale-x: 0.997; scale-y: 0.997; }
        frame 148 { x: 11.3; y: 63.1; skew-x: -31.5; skew-y: -31.5; scale-x: 0.994; scale-y: 0.994; }
        frame 149 { x: 15.1; y: 64.4; skew-x: -36.3; skew-y: -36.3; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 19.1; y: 65.8; skew-x: -41.3; skew-y: -41.3; scale-x: 0.995; scale-y: 0.995; }
        frame 151 { x: 13.8; y: 68.5; skew-x: -47.3; skew-y: -47.3; scale-x: 0.993; scale-y: 0.993; }
        frame 152 { x: 8.7; y: 71.2; skew-x: -53.1; skew-y: -53.1; scale-x: 0.992; scale-y: 0.992; }
        frame 153 { x: 3.9; y: 73.8; skew-x: -58.9; skew-y: -58.9; scale-x: 0.994; scale-y: 0.994; }
        frame 154 { x: 5.1; y: 79.3; skew-x: -69.1; skew-y: -69.1; scale-x: 0.992; scale-y: 0.992; }
        frame 155 { x: 7; y: 84.3; skew-x: -79.4; skew-y: -79.4; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 9.7; y: 88.7; skew-x: -89.6; skew-y: -89.6; }
        frame 157 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 160 { x: -12.7; y: 87.3; skew-x: -70.4; skew-y: -70.4; scale-x: 0.989; scale-y: 0.989; }
        frame 161 { x: -32.2; y: 84.6; skew-x: -51.3; skew-y: -51.3; scale-x: 0.988; scale-y: 0.988; }
        frame 162 { x: -48.7; y: 81.1; skew-x: -32; skew-y: -32; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: -51.6; y: 70.3; skew-x: -21.7; skew-y: -21.7; scale-x: 0.986; scale-y: 0.986; }
        frame 164 { x: -53.7; y: 60; skew-x: -11.4; skew-y: -11.4; scale-x: -10000; scale-y: -10000; }
        frame 165 { x: -54.9; y: 50; skew-x: -1.2; skew-y: -1.2; }
        frame 166 { x: -55.5; y: 40.9; skew-x: 8.8; skew-y: 8.8; scale-x: 0.985; scale-y: 0.985; }
        frame 167 { x: -55.4; y: 32.4; skew-x: 19; skew-y: 19; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: -48.6; y: 34.5; skew-x: 12.8; skew-y: 12.8; }
        frame 169 { x: -41.6; y: 37; skew-x: 6.5; skew-y: 6.5; scale-x: 0.987; scale-y: 0.987; }
        frame 170 { x: -34.2; y: 39.6; skew-x: 0.5; skew-y: 0.5; scale-x: 0.988; scale-y: 0.988; }
        frame 171 { x: -26.8; y: 45.2; skew-x: -5.2; skew-y: -5.2; scale-x: 0.989; scale-y: 0.989; }
        frame 172 { x: -19.3; y: 51; skew-x: -11.4; skew-y: -11.4; scale-x: 0.99; scale-y: 0.99; }
        frame 173 { x: -11.5; y: 56.9; skew-x: -17.5; skew-y: -17.5; scale-x: 0.992; scale-y: 0.992; }
        frame 174 { x: -5.2; y: 58.5; skew-x: -20.4; skew-y: -20.4; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 1.2; y: 60; skew-x: -23.5; skew-y: -23.5; scale-x: 0.994; scale-y: 0.994; }
        frame 176 { x: 7.7; y: 61.8; skew-x: -26.5; skew-y: -26.5; scale-x: 0.997; scale-y: 0.997; }
        frame 177 { x: 13.1; y: 63.8; skew-x: -33.8; skew-y: -33.8; scale-x: 0.994; scale-y: 0.994; }
        frame 178 { x: 19.1; y: 65.8; skew-x: -41.3; skew-y: -41.3; scale-x: 0.995; scale-y: 0.995; }
        frame 179 { x: 13.8; y: 68.5; skew-x: -47.3; skew-y: -47.3; scale-x: 0.993; scale-y: 0.993; }
        frame 180 { x: 8.7; y: 71.2; skew-x: -53.1; skew-y: -53.1; scale-x: 0.992; scale-y: 0.992; }
        frame 181 { x: 3.9; y: 73.8; skew-x: -58.9; skew-y: -58.9; scale-x: 0.994; scale-y: 0.994; }
        frame 182 { x: 1.8; y: 79.3; skew-x: -69.1; skew-y: -69.1; scale-x: 0.992; scale-y: 0.992; }
        frame 183 { x: 0.3; y: 84.3; skew-x: -79.4; skew-y: -79.4; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: -0.1; y: 88.7; skew-x: -89.6; skew-y: -89.6; }
        frame 185 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 187 { x: -11.3; y: 102.7; skew-x: -100.2; skew-y: -100.2; scale-x: 0.991; scale-y: 0.991; }
        frame 188 { x: -22; y: 115.8; skew-x: -111.2; skew-y: -111.2; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.99; scale-y: 0.99; }
        frame 190 { scale-x: 0.991; scale-y: 0.991; }
        frame 191 { x: -22.1; y: 116.7; skew-x: -111.9; skew-y: -110.5; scale-x: 0.972; scale-y: 0.998; }
        frame 192 { x: -22.3; y: 117.5; skew-x: -112.6; skew-y: -109.8; scale-x: 0.956; scale-y: 1.008; }
        frame 193 { x: -22.2; y: 116.7; skew-x: -111.9; skew-y: -110.5; scale-x: 0.972; scale-y: 0.998; }
        frame 194 { x: -22; y: 115.8; skew-x: -111.2; skew-y: -111.2; scale-x: 0.99; scale-y: 0.99; }
        frame 195 { x: -21.9; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.989; scale-y: 0.989; }
        frame 196 { x: -22; scale-x: 0.991; scale-y: 0.991; }
    }
    Track {
        source-name: "Zombie_gargantua_innerleg_foot";
        frame-count: 197;
        frame 0 { x: 2.1; y: 106.6; scale-x: 0.897; scale-y: 0.877; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_FOOT; }
        frame 1 { x: 2; y: 106.7; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 1.9; y: -10000; skew-x: -0.9; skew-y: -0.9; }
        frame 3 { x: 1.7; y: 106.8; skew-x: -1.5; skew-y: -1.5; }
        frame 4 { x: 1.6; y: 106.9; skew-x: -2.2; skew-y: -2.2; }
        frame 5 { x: 1.5; y: 107; skew-x: -2.7; skew-y: -2.7; }
        frame 6 { x: 1.4; y: 107.1; skew-x: -3.2; skew-y: -3.2; }
        frame 7 { x: 1.3; y: 107.3; skew-x: -3.9; skew-y: -3.9; }
        frame 8 { x: 1.2; y: -10000; skew-x: -4.4; skew-y: -4.4; }
        frame 9 { x: 1.1; skew-x: -5; skew-y: -5; }
        frame 10 { x: 0.9; y: 107.6; skew-x: -5.7; skew-y: -5.7; }
        frame 11 { x: 1; y: 107.5; skew-x: -5.2; skew-y: -5.2; }
        frame 12 { x: 1.1; y: 107.3; skew-x: -4.7; skew-y: -4.7; }
        frame 13 { x: 1.2; y: -10000; skew-x: -4; skew-y: -4; }
        frame 14 { x: 1.3; y: 107.1; skew-x: -3.5; skew-y: -3.5; }
        frame 15 { x: 1.5; y: 107; skew-x: -2.9; skew-y: -2.9; }
        frame 16 { x: -10000; y: -10000; skew-x: -2.4; skew-y: -2.4; }
        frame 17 { x: 1.7; y: 106.8; skew-x: -1.9; skew-y: -1.9; }
        frame 18 { x: 1.8; y: -10000; skew-x: -1.4; skew-y: -1.4; }
        frame 19 { x: 1.9; skew-x: -0.9; skew-y: -0.9; }
        frame 20 { x: 2; y: 106.6; skew-x: -0.4; skew-y: -0.4; }
        frame 21 { x: 2.1; y: -10000; skew-x: 0; skew-y: 0; }
        frame 22 { x: 10.2; skew-x: -10000; skew-y: -10000; }
        frame 23 { x: 14.9; y: 106; skew-x: 1.3; skew-y: 1.3; }
        frame 24 { x: 19.7; y: 105.1; skew-x: 2.8; skew-y: 2.8; }
        frame 25 { x: 24.5; y: 104.5; skew-x: 4.1; skew-y: 4.1; }
        frame 26 { x: 29.3; y: 103.7; skew-x: 5.5; skew-y: 5.5; scale-x: 0.896; scale-y: 0.876; }
        frame 27 { x: 34.1; y: 102.9; skew-x: 7.1; skew-y: 7.1; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 35.7; y: 104.6; skew-x: 2.5; skew-y: 2.5; }
        frame 29 { x: 37.4; y: 106.2; skew-x: -1.7; skew-y: -1.7; }
        frame 30 { x: 39.3; y: 107.9; skew-x: -5.9; skew-y: -5.9; }
        frame 31 { x: 41.3; y: 109.8; skew-x: -10.4; skew-y: -10.4; }
        frame 32 { x: 43.5; y: 111.7; skew-x: -14.9; skew-y: -14.9; }
        frame 33 { x: 47.1; y: 112.8; skew-x: -18.7; skew-y: -18.7; scale-x: 0.895; scale-y: 0.875; }
        frame 34 { x: 50.8; y: 114; skew-x: -22.4; skew-y: -22.4; scale-x: 0.894; scale-y: 0.874; }
        frame 35 { x: 54.5; y: 115.1; skew-x: -26.2; skew-y: -26.2; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 58.4; y: 116.3; skew-x: -30; skew-y: -30; scale-x: 0.895; scale-y: 0.875; }
        frame 37 { x: 58; y: -10000; skew-x: -31.2; skew-y: -31.2; scale-x: 0.893; scale-y: 0.873; }
        frame 38 { x: 57.6; y: 116.5; skew-x: -32.5; skew-y: -32.5; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 57.4; y: 116.6; skew-x: -33.7; skew-y: -33.7; }
        frame 40 { x: 57; y: 116.7; skew-x: -35; skew-y: -35; }
        frame 41 { x: 56.7; y: 116.8; skew-x: -36.3; skew-y: -36.3; scale-x: 0.894; scale-y: 0.874; }
        frame 42 { x: 52.3; y: 117.6; skew-x: -10000; skew-y: -10000; scale-x: 0.893; scale-y: 0.873; }
        frame 43 { x: 47.8; y: 118.5; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 43.3; y: 119.2; scale-x: 0.892; scale-y: 0.872; }
        frame 45 { x: 38.8; y: 120.1; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 34.3; y: 121; scale-x: 0.894; scale-y: 0.874; }
        frame 47 { x: 29.8; y: 119.8; skew-x: -35; skew-y: -35; scale-x: 0.892; scale-y: 0.872; }
        frame 48 { x: 25.3; y: 118.7; skew-x: -33.5; skew-y: -33.5; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 20.8; y: 117.6; skew-x: -32.2; skew-y: -32.2; }
        frame 50 { x: 16.3; y: 116.5; skew-x: -30.8; skew-y: -30.8; }
        frame 51 { x: 11.7; y: 115.5; skew-x: -29.5; skew-y: -29.5; scale-x: 0.893; scale-y: 0.873; }
        frame 52 { x: 9.8; y: 112.5; skew-x: -21.9; skew-y: -21.9; scale-x: 0.892; scale-y: 0.872; }
        frame 53 { x: 8.2; y: 109.3; skew-x: -14.2; skew-y: -14.2; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 7.2; y: 106.5; skew-x: -6.5; skew-y: -6.5; }
        frame 55 { x: 6.7; y: 103.8; skew-x: 0.8; skew-y: 0.8; }
        frame 56 { x: -10000; y: 101.1; skew-x: 8.5; skew-y: 8.5; scale-x: 0.891; scale-y: 0.871; }
        frame 57 { x: 7.1; y: 102.9; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 7.5; y: 104.8; skew-x: 3; skew-y: 3; }
        frame 59 { x: 8.1; y: 106.6; skew-x: 0.3; skew-y: 0.3; }
        frame 60 { x: 8.6; y: 108.4; skew-x: -2.2; skew-y: -2.2; }
        frame 61 { x: 8.3; y: 108.1; skew-x: -1.7; skew-y: -1.7; }
        frame 62 { x: 7.8; y: 107.8; skew-x: -1.4; skew-y: -1.4; scale-x: 0.892; scale-y: 0.872; }
        frame 63 { x: 7.3; y: 107.7; skew-x: -1.2; skew-y: -1.2; scale-x: 0.893; scale-y: 0.873; }
        frame 64 { x: 6.9; y: 107.5; skew-x: -0.9; skew-y: -0.9; scale-x: 0.894; scale-y: 0.874; }
        frame 65 { x: 6.5; y: 107.2; skew-x: -0.7; skew-y: -0.7; scale-x: 0.895; scale-y: 0.875; }
        frame 66 { x: 7.2; y: 107; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 7.9; y: 106.9; skew-x: -0.2; skew-y: -0.2; scale-x: 0.896; scale-y: 0.876; }
        frame 68 { x: 8.6; y: 106.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 9.3; y: 106.6; skew-x: 0; skew-y: 0; scale-x: 0.897; scale-y: 0.877; }
        frame 70 { x: 10.2; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -10000; }
        frame 72 { x: 7.3; y: 101.9; skew-x: 5.3; skew-y: 5.3; }
        frame 73 { x: 4.8; y: 97.3; skew-x: 10.8; skew-y: 10.8; scale-x: 0.896; scale-y: 0.876; }
        frame 74 { x: 2.6; y: 92.8; skew-x: 16.3; skew-y: 16.3; scale-x: 0.895; scale-y: 0.875; }
        frame 75 { x: 0.6; y: 88.6; skew-x: 21.8; skew-y: 21.8; scale-x: 0.894; scale-y: 0.874; }
        frame 76 { x: -1.2; y: 84.6; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -2.8; y: 80.7; skew-x: 32.8; skew-y: 32.8; scale-x: 0.893; scale-y: 0.873; }
        frame 78 { x: -4.4; y: 77.1; skew-x: 38.4; skew-y: 38.4; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: -5.8; y: 73.8; skew-x: 43.9; skew-y: 43.9; }
        frame 80 { x: -6; y: 71.6; skew-x: 47.6; skew-y: 47.6; scale-x: 0.892; scale-y: 0.872; }
        frame 81 { x: -6.1; y: 69.4; skew-x: 51.2; skew-y: 51.2; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: -10000; y: 67.3; skew-x: 54.9; skew-y: 54.9; }
        frame 83 { y: 65.4; skew-x: 58.7; skew-y: 58.7; scale-x: 0.891; scale-y: 0.871; }
        frame 84 { x: -6.2; y: 63.5; skew-x: 62.4; skew-y: 62.4; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: -6.3; y: 61.8; skew-x: 65.9; skew-y: 65.9; scale-x: 0.892; scale-y: 0.872; }
        frame 86 { x: -7.6; y: 62.3; skew-x: 58.2; skew-y: 58.2; scale-x: 0.89; scale-y: 0.87; }
        frame 87 { x: -9; y: 63.3; skew-x: 50.4; skew-y: 50.4; scale-x: 0.889; scale-y: 0.869; }
        frame 88 { x: -10.1; y: 64.8; skew-x: 42.6; skew-y: 42.6; scale-x: 0.888; scale-y: 0.868; }
        frame 89 { x: -11; y: 66.9; skew-x: 34.8; skew-y: 34.8; scale-x: -10000; scale-y: 0.869; }
        frame 90 { x: -18.7; y: 80.4; skew-x: 29.6; skew-y: 29.6; scale-x: 0.886; scale-y: 0.867; }
        frame 91 { x: -26.6; y: 94; skew-x: 24.4; skew-y: 24.4; scale-x: 0.887; scale-y: -10000; }
        frame 92 { x: -35.7; y: 109.3; skew-x: 2; skew-y: 2; scale-x: 0.888; scale-y: 0.868; }
        frame 93 { x: -36.1; y: 109.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: -36.6; y: 109.8; skew-x: -1.9; skew-y: -1.9; scale-x: 0.887; }
        frame 95 { x: -36.1; y: 109.6; skew-x: 0; skew-y: 0; scale-x: 0.888; }
        frame 96 { x: -35.7; y: 109.3; skew-x: 2; skew-y: 2; scale-x: -10000; }
        frame 97 { x: -29.1; y: 109; skew-x: 1.6; skew-y: 1.6; scale-x: 0.889; scale-y: 0.869; }
        frame 98 { x: -22.6; y: 108.7; skew-x: 1.3; skew-y: 1.3; scale-x: 0.89; scale-y: 0.87; }
        frame 99 { x: -15.9; y: 108.3; skew-x: 1; skew-y: 1; scale-x: 0.892; scale-y: 0.872; }
        frame 100 { x: -9.3; y: 107.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.893; scale-y: 0.873; }
        frame 101 { x: -2.7; y: 107.5; skew-x: 0.5; skew-y: 0.5; scale-x: 0.895; scale-y: 0.875; }
        frame 102 { x: 3.6; y: 107.1; skew-x: 0.3; skew-y: 0.3; scale-x: 0.896; scale-y: 0.876; }
        frame 103 { x: 10.2; y: 106.6; skew-x: 0; skew-y: 0; scale-x: 0.897; scale-y: 0.877; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 10.1; y: 106.7; skew-x: -0.4; skew-y: -0.4; }
        frame 106 { x: 9.9; y: -10000; skew-x: -0.9; skew-y: -0.9; }
        frame 107 { x: 9.8; skew-x: -1.4; skew-y: -1.4; }
        frame 108 { x: -10000; y: 106.8; skew-x: -1.9; skew-y: -1.9; }
        frame 109 { x: 9.6; y: -10000; skew-x: -2.4; skew-y: -2.4; }
        frame 110 { x: 9.5; skew-x: -2.9; skew-y: -2.9; }
        frame 111 { x: -10000; skew-x: -3.4; skew-y: -3.4; }
        frame 112 { x: 9.3; y: 107; skew-x: -4; skew-y: -4; }
        frame 113 { x: 9.1; skew-x: -4.9; skew-y: -4.9; }
        frame 114 { x: 8.9; y: 107.2; skew-x: -6.2; skew-y: -6.2; }
        frame 115 { x: 8.7; y: 107.3; skew-x: -7.2; skew-y: -7.2; }
        frame 116 { x: 8.5; y: 107.4; skew-x: -8.2; skew-y: -8.2; }
        frame 117 { x: 8.3; y: 107.6; skew-x: -9.5; skew-y: -9.5; }
        frame 118 { x: -10000; y: -10000; skew-x: -9.4; skew-y: -9.4; scale-y: 0.876; }
        frame 119 { skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 121 { skew-x: -9.5; skew-y: -9.5; scale-y: 0.877; }
        frame 122 { skew-x: -9.4; skew-y: -9.4; scale-y: 0.876; }
        frame 123 { skew-x: -9.5; skew-y: -9.5; scale-y: 0.877; }
        frame 124 { x: 7.6; y: 107.3; skew-x: -8.4; skew-y: -8.4; scale-y: 0.876; }
        frame 125 { x: 6.8; y: 107; skew-x: -7.4; skew-y: -7.4; scale-y: -10000; }
        frame 126 { x: 6.1; y: 106.7; skew-x: -6.5; skew-y: -6.5; }
        frame 127 { x: 5.3; y: 106.3; skew-x: -5.5; skew-y: -5.5; }
        frame 128 { x: 4.6; y: 106.1; skew-x: -4.7; skew-y: -4.7; scale-y: 0.877; }
        frame 129 { x: -3.1; y: 97.7; skew-x: 5; skew-y: 5; scale-x: 0.896; scale-y: 0.876; }
        frame 130 { x: -10.2; y: 89.7; skew-x: 15; skew-y: 15; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: -12; y: 86; skew-x: 21.6; skew-y: 21.6; scale-x: 0.894; scale-y: 0.874; }
        frame 132 { x: -13.5; y: 82.3; skew-x: 28.3; skew-y: 28.3; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: -14.8; y: 79.3; skew-x: 34.9; skew-y: 34.9; scale-x: 0.895; scale-y: 0.875; }
        frame 134 { x: -9.3; y: 85.5; skew-x: 26.1; skew-y: 26.1; scale-x: 0.894; scale-y: 0.874; }
        frame 135 { x: -3.3; y: 92.1; skew-x: 17.3; skew-y: 17.3; scale-x: 0.895; scale-y: 0.875; }
        frame 136 { x: 3; y: 99.3; skew-x: 8.5; skew-y: 8.5; scale-x: 0.896; scale-y: 0.876; }
        frame 137 { x: 10.2; y: 106.6; skew-x: 0; skew-y: 0; scale-x: 0.897; scale-y: 0.877; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 9.2; y: 108.2; skew-x: -4.2; skew-y: -4.2; }
        frame 183 { x: 8.5; y: 109.7; skew-x: -8.4; skew-y: -8.4; }
        frame 184 { x: 7.9; y: 111.3; skew-x: -12.7; skew-y: -12.7; }
        frame 185 { x: 9.9; y: 118.1; skew-x: -35; skew-y: -35; scale-x: 0.894; scale-y: 0.874; }
        frame 186 { x: 16.7; y: 124.2; skew-x: -57.5; skew-y: -57.5; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 28.8; y: 128.4; skew-x: -84.8; skew-y: -84.8; scale-x: 0.893; scale-y: 0.873; }
        frame 188 { x: 44; y: 126.2; skew-x: -111.8; skew-y: -111.8; scale-x: 0.892; scale-y: 0.872; }
        frame 189 { x: 48.1; y: 133.3; skew-x: -115.7; skew-y: -115.5; scale-x: 0.89; scale-y: 0.871; }
        frame 190 { x: 52.2; y: 140.5; skew-x: -119.8; skew-y: -119.2; scale-x: 0.891; scale-y: -10000; }
        frame 191 { x: 53; y: 140.7; skew-x: -120.7; skew-y: -118.2; scale-x: 0.878; scale-y: 0.875; }
        frame 192 { x: 54; y: 141; skew-x: -121.6; skew-y: -117.5; scale-x: 0.868; scale-y: 0.88; }
        frame 193 { x: 51; y: 137.2; skew-x: -118.7; skew-y: -116.5; scale-x: 0.878; scale-y: 0.874; }
        frame 194 { x: 48.1; y: 133.3; skew-x: -115.7; skew-y: -115.5; scale-x: 0.89; scale-y: 0.871; }
        frame 195 { x: 50.1; y: 136.8; skew-x: -117.7; skew-y: -117.2; scale-x: -10000; scale-y: 0.87; }
        frame 196 { x: 52.2; y: 140.5; skew-x: -119.8; skew-y: -119.2; scale-x: 0.891; scale-y: 0.871; }
    }
    Track {
        source-name: "Zombie_gargantua_innerleg_lower";
        frame-count: 197;
        frame 0 { x: 15.4; y: 78.9; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_INNERLEG_LOWER; }
        frame 1 { x: 14.9; y: 78.8; skew-x: -0.7; skew-y: -0.7; image: none; }
        frame 2 { x: 14.3; y: 78.7; skew-x: -1.4; skew-y: -1.4; }
        frame 3 { x: 13.7; y: 78.5; skew-x: -2.2; skew-y: -2.2; }
        frame 4 { x: 13.1; y: 78.4; skew-x: -2.9; skew-y: -2.9; }
        frame 5 { x: 12.6; y: 78.3; skew-x: -3.7; skew-y: -3.7; }
        frame 6 { x: 12.1; y: -10000; skew-x: -4.4; skew-y: -4.4; scale-x: 0.999; scale-y: 0.999; }
        frame 7 { x: 11.6; y: 78.2; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 11; y: 78.1; skew-x: -5.9; skew-y: -5.9; }
        frame 9 { x: 10.5; y: 78; skew-x: -6.7; skew-y: -6.7; }
        frame 10 { x: 10; y: -10000; skew-x: -7.5; skew-y: -7.5; scale-x: 1; scale-y: 1; }
        frame 11 { x: 10.6; y: 78; skew-x: -6.7; skew-y: -6.7; scale-x: 0.999; scale-y: 0.999; }
        frame 12 { x: 11; y: 78.1; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 11.6; y: 78.2; skew-x: -5.2; skew-y: -5.2; }
        frame 14 { x: 12; y: 78.3; skew-x: -4.7; skew-y: -4.7; }
        frame 15 { x: 12.5; y: -10000; skew-x: -3.9; skew-y: -3.9; scale-x: 1; scale-y: 1; }
        frame 16 { x: 13; y: 78.5; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 13.5; y: -10000; skew-x: -2.5; skew-y: -2.5; }
        frame 18 { x: 13.9; y: 78.6; skew-x: -1.9; skew-y: -1.9; }
        frame 19 { x: 14.5; y: 78.8; skew-x: -1.2; skew-y: -1.2; }
        frame 20 { x: 15; y: -10000; skew-x: -0.4; skew-y: -0.4; }
        frame 21 { x: 15.4; y: 78.9; skew-x: 0; skew-y: 0; }
        frame 22 { x: 23.5; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 23 { x: 25.5; y: 79.2; skew-x: -1.2; skew-y: -1.2; }
        frame 24 { x: 27.6; y: 79.5; skew-x: -2.4; skew-y: -2.4; }
        frame 25 { x: 29.6; y: 79.8; skew-x: -3.7; skew-y: -3.7; }
        frame 26 { x: 31.7; y: 80.2; skew-x: -4.9; skew-y: -4.9; scale-x: 0.999; scale-y: 0.999; }
        frame 27 { x: 33.8; y: 80.6; skew-x: -6.2; skew-y: -6.2; scale-x: 1; scale-y: 1; }
        frame 28 { x: 35.5; y: 81.7; skew-x: -8.7; skew-y: -8.7; scale-x: 0.999; scale-y: 0.999; }
        frame 29 { x: 37.1; y: 82.8; skew-x: -11.5; skew-y: -11.5; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 38.9; y: 84.2; skew-x: -14.2; skew-y: -14.2; scale-x: 0.998; scale-y: 0.998; }
        frame 31 { x: 40.7; y: 85.5; skew-x: -16.9; skew-y: -16.9; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 42.5; y: 86.8; skew-x: -19.7; skew-y: -19.7; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: 44; y: 87.3; skew-x: -24; skew-y: -24; scale-x: 0.997; scale-y: 0.997; }
        frame 34 { x: 45.8; y: 88.1; skew-x: -28.5; skew-y: -28.5; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 47.6; y: 88.8; skew-x: -33; skew-y: -33; }
        frame 36 { x: 49.7; y: 89.5; skew-x: -37.3; skew-y: -37.3; scale-x: 0.998; scale-y: 0.998; }
        frame 37 { x: 49.1; y: 90.1; skew-x: -38.5; skew-y: -38.5; scale-x: 0.996; scale-y: 0.996; }
        frame 38 { x: 48.5; y: 90.8; skew-x: -39.8; skew-y: -39.8; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 47.9; y: 91.6; skew-x: -41; skew-y: -41; }
        frame 40 { x: 47.3; y: 92.3; skew-x: -42.3; skew-y: -42.3; }
        frame 41 { x: 46.7; y: 93.1; skew-x: -43.7; skew-y: -43.7; scale-x: 0.997; scale-y: 0.997; }
        frame 42 { x: 41.9; y: 92.3; skew-x: -42.3; skew-y: -42.3; scale-x: 0.996; scale-y: 1.011; }
        frame 43 { x: 36.9; y: 91.5; skew-x: -40.8; skew-y: -40.8; scale-x: 0.995; scale-y: 1.027; }
        frame 44 { x: 31.9; y: 90.6; skew-x: -39.5; skew-y: -39.5; scale-x: -10000; scale-y: 1.043; }
        frame 45 { x: 27.1; y: 89.8; skew-x: -38; skew-y: -38; scale-y: 1.059; }
        frame 46 { x: 22.2; y: 89; skew-x: -36.6; skew-y: -36.6; scale-x: 0.996; scale-y: 1.076; }
        frame 47 { x: 20.9; y: 86.8; skew-x: -33.5; skew-y: -33.5; scale-x: 0.994; scale-y: -10000; }
        frame 48 { x: 19.6; y: 84.7; skew-x: -30.5; skew-y: -30.5; scale-x: -10000; scale-y: 1.079; }
        frame 49 { x: 18.4; y: 82.5; skew-x: -27.5; skew-y: -27.5; scale-y: 1.081; }
        frame 50 { x: 17.3; y: 80.5; skew-x: -24.7; skew-y: -24.7; scale-y: 1.083; }
        frame 51 { x: 16.3; y: 78.3; skew-x: -21.7; skew-y: -21.7; scale-x: 0.995; scale-y: 1.086; }
        frame 52 { x: 16; y: 77.2; skew-x: -17.2; skew-y: -17.2; scale-x: 0.994; scale-y: 1.085; }
        frame 53 { x: 15.7; y: 76.2; skew-x: -12.7; skew-y: -12.7; scale-x: 0.993; scale-y: -10000; }
        frame 54 { x: 15.6; y: 75.3; skew-x: -8.4; skew-y: -8.4; scale-x: -10000; }
        frame 55 { x: 15.7; y: 74.5; skew-x: -3.9; skew-y: -3.9; }
        frame 56 { x: 15.9; y: 73.7; skew-x: 0.3; skew-y: 0.3; }
        frame 57 { x: 14.2; y: 75.3; skew-x: -3; skew-y: -4.2; scale-x: 0.994; scale-y: 1.084; }
        frame 58 { x: 12.7; y: 77.3; skew-x: -6.5; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 11.3; y: 79.3; skew-x: -10; skew-y: -13.7; scale-y: 1.083; }
        frame 60 { x: 10; y: 81.7; skew-x: -13.6; skew-y: -18.4; scale-x: 0.995; scale-y: -10000; }
        frame 61 { x: 11.1; y: 81.5; skew-x: -12.2; skew-y: -15.9; scale-x: -10000; scale-y: 1.072; }
        frame 62 { x: 12.2; y: 81.1; skew-x: -10.7; skew-y: -13.5; scale-y: 1.062; }
        frame 63 { x: 13.2; y: 80.8; skew-x: -9.2; skew-y: -11.2; scale-x: 0.996; scale-y: 1.053; }
        frame 64 { x: 14.3; y: 80.5; skew-x: -7.7; skew-y: -8.7; scale-x: -10000; scale-y: 1.043; }
        frame 65 { x: 15.3; y: 80.4; skew-x: -6.4; skew-y: -6.4; scale-x: 0.997; scale-y: 1.033; }
        frame 66 { x: 17; y: 80.1; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: 1.026; }
        frame 67 { x: 18.6; y: 79.7; skew-x: -3.7; skew-y: -3.7; scale-x: 0.998; scale-y: 1.02; }
        frame 68 { x: 20.3; y: 79.4; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: 1.013; }
        frame 69 { x: 21.9; y: 79.1; skew-x: -1.2; skew-y: -1.2; scale-x: 0.999; scale-y: 1.007; }
        frame 70 { x: 23.5; y: 78.9; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 22.1; y: 76.5; skew-x: 3.8; skew-y: 3.8; scale-x: 0.999; scale-y: 0.999; }
        frame 73 { x: 21; y: 74.1; skew-x: 7.8; skew-y: 7.8; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 19.9; y: 71.8; skew-x: 11.8; skew-y: 11.8; scale-x: 0.998; scale-y: 0.998; }
        frame 75 { x: 19; y: 69.6; skew-x: 15.8; skew-y: 15.8; scale-x: 0.997; scale-y: 0.997; }
        frame 76 { x: 18.2; y: 67.6; skew-x: 19.8; skew-y: 19.8; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 17.3; y: 65.7; skew-x: 23.6; skew-y: 23.6; scale-x: 0.996; scale-y: 0.996; }
        frame 78 { x: 16.7; y: 64; skew-x: 27.6; skew-y: 27.6; scale-x: 0.995; scale-y: 0.995; }
        frame 79 { x: 16.1; y: 62.3; skew-x: 31.6; skew-y: 31.6; scale-x: 0.996; scale-y: 0.996; }
        frame 80 { x: 16.2; y: 61; skew-x: 35.1; skew-y: 35.1; scale-x: 0.994; scale-y: 0.994; }
        frame 81 { x: 16.4; y: 59.7; skew-x: 38.8; skew-y: 38.8; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 16.5; y: 58.6; skew-x: 42.4; skew-y: 42.4; }
        frame 83 { x: 16.6; y: 57.7; skew-x: 45.9; skew-y: 45.9; }
        frame 84 { x: 16.9; y: 56.9; skew-x: 49.6; skew-y: 49.6; }
        frame 85 { x: 17; y: 56.1; skew-x: 53.1; skew-y: 53.1; scale-x: 0.995; scale-y: 0.995; }
        frame 86 { x: 15.8; y: 53.1; skew-x: 46.7; skew-y: 46.7; scale-x: 0.993; scale-y: 1.023; }
        frame 87 { x: 14.6; y: 50.4; skew-x: 40.3; skew-y: 40.3; scale-x: 0.992; scale-y: 1.053; }
        frame 88 { x: 13.3; y: 48; skew-x: 33.8; skew-y: 33.8; scale-x: 0.991; scale-y: 1.084; }
        frame 89 { x: 12; y: 45.6; skew-x: 27.5; skew-y: 27.5; scale-x: 0.992; scale-y: 1.115; }
        frame 90 { x: 0.8; y: 59.2; skew-x: 22.3; skew-y: 22.3; scale-x: 0.99; scale-y: 1.114; }
        frame 91 { x: -10.1; y: 73; skew-x: 17.1; skew-y: 17.1; scale-x: 0.991; scale-y: -10000; }
        frame 92 { x: -26.5; y: 78.2; skew-x: 0.3; skew-y: -4.3; scale-x: 0.994; }
        frame 93 { x: -27.4; y: 77.5; skew-x: -1; skew-y: -5.7; scale-x: -10000; }
        frame 94 { x: -28.4; y: 77; skew-x: -2.6; skew-y: -7.3; }
        frame 95 { x: -27.4; y: 77.6; skew-x: -1; skew-y: -5.7; }
        frame 96 { x: -26.5; y: 78.2; skew-x: 0.3; skew-y: -4.3; }
        frame 97 { x: -19.2; y: 78.3; skew-x: 0.1; skew-y: -3.7; scale-x: 0.995; scale-y: 1.098; }
        frame 98 { x: -12.1; y: 78.5; skew-x: -10000; skew-y: -2.9; scale-x: 0.996; scale-y: 1.081; }
        frame 99 { x: -4.9; y: -10000; skew-x: 0; skew-y: -2.4; scale-x: 0.997; scale-y: 1.065; }
        frame 100 { x: 2; skew-x: -10000; skew-y: -1.7; scale-x: -10000; scale-y: 1.049; }
        frame 101 { x: 9.1; y: 78.7; skew-y: -1.2; scale-x: 0.998; scale-y: 1.033; }
        frame 102 { x: 16.3; y: -10000; skew-y: -0.4; scale-x: 0.999; scale-y: 1.016; }
        frame 103 { x: 23.5; y: 78.9; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 22.6; y: 78; skew-x: -1.7; skew-y: -1.9; scale-y: 1.041; }
        frame 106 { x: 21.7; y: 77; skew-x: -3.5; skew-y: -3.9; scale-y: 1.082; }
        frame 107 { x: 20.7; y: 76.1; skew-x: -5.4; skew-y: -6; scale-y: 1.123; }
        frame 108 { x: 19.7; y: 75.3; skew-x: -7.2; skew-y: -8.2; scale-y: 1.164; }
        frame 109 { x: 18.7; y: 74.3; skew-x: -9; skew-y: -10.2; scale-y: 1.205; }
        frame 110 { x: 17.7; y: 73.6; skew-x: -10.9; skew-y: -12.2; scale-y: 1.246; }
        frame 111 { x: 16.6; y: 72.8; skew-x: -12.7; skew-y: -14.4; scale-x: 0.999; scale-y: 1.287; }
        frame 112 { x: 15.4; y: 72.2; skew-x: -14.7; skew-y: -16.5; scale-x: 1; scale-y: 1.329; }
        frame 113 { x: 14.2; y: -10000; skew-x: -16.2; skew-y: -17.9; scale-x: 0.999; scale-y: 1.335; }
        frame 114 { x: 12.9; y: 72.3; skew-x: -17.5; skew-y: -19.4; scale-x: -10000; scale-y: 1.343; }
        frame 115 { x: 11.6; y: -10000; skew-x: -19; skew-y: -20.9; scale-y: 1.351; }
        frame 116 { x: 10.5; y: 72.5; skew-x: -20.5; skew-y: -22.2; scale-y: 1.359; }
        frame 117 { x: 9.1; y: 72.7; skew-x: -22; skew-y: -23.8; scale-x: 1; scale-y: 1.368; }
        frame 118 { x: 8.1; y: 73.6; skew-x: -23.2; skew-y: -25; scale-x: 0.998; scale-y: 1.366; }
        frame 119 { x: 7.2; y: 74.5; skew-x: -24.5; skew-y: -26.2; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 6.2; y: 75.5; skew-x: -25.7; skew-y: -27.5; }
        frame 121 { x: 5.2; y: 76.4; skew-x: -27; skew-y: -28.9; scale-x: 0.999; scale-y: 1.368; }
        frame 122 { x: 5.3; y: -10000; skew-x: -10000; skew-y: -28.7; scale-x: 0.998; scale-y: 1.366; }
        frame 123 { x: 5.2; skew-y: -28.9; scale-x: 0.999; scale-y: 1.368; }
        frame 124 { x: 7.3; y: 74.5; skew-x: -21.9; skew-y: -23.7; scale-x: 0.998; scale-y: 1.366; }
        frame 125 { x: 9.6; y: 72.6; skew-x: -16.7; skew-y: -18.7; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 12.2; y: 71; skew-x: -11.7; skew-y: -13.7; scale-y: 1.365; }
        frame 127 { x: 15.1; y: 69.4; skew-x: -6.7; skew-y: -8.5; scale-y: -10000; }
        frame 128 { x: 18.3; y: 68.3; skew-x: -1.7; skew-y: -3.5; }
        frame 129 { x: 19.1; y: 62.5; skew-x: 13.1; skew-y: 11.3; scale-x: 0.996; scale-y: 1.364; }
        frame 130 { x: 21.5; y: 58.9; skew-x: 28.3; skew-y: 26.5; scale-x: -10000; scale-y: 1.363; }
        frame 131 { x: 22.2; y: 58.3; skew-x: 33.1; skew-y: 31.3; scale-x: 0.994; scale-y: 1.361; }
        frame 132 { x: 22.7; y: 57.8; skew-x: 38.1; skew-y: 36.1; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 23.4; y: 57.5; skew-x: 42.9; skew-y: 41; scale-x: 0.995; scale-y: 1.362; }
        frame 134 { x: 21.8; y: 61; skew-x: 32.1; skew-y: 30.8; scale-x: -10000; scale-y: 1.269; }
        frame 135 { x: 21; y: 65.8; skew-x: 21.3; skew-y: 20.5; scale-x: 0.997; scale-y: 1.18; }
        frame 136 { x: 21.5; y: 71.8; skew-x: 10.5; skew-y: 10.3; scale-x: 0.998; scale-y: 1.089; }
        frame 137 { x: 23.5; y: 78.9; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 22.6; y: 79.8; skew-x: -3; skew-y: -3; }
        frame 140 { x: 21.7; y: 81.1; skew-x: -6.2; skew-y: -6.2; scale-x: 0.999; scale-y: 0.999; }
        frame 141 { x: 21; y: 82.3; skew-x: -9.5; skew-y: -9.5; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 16.6; y: 83.2; skew-x: -17.5; skew-y: -17.5; scale-x: 0.998; scale-y: 1.086; }
        frame 143 { x: 12.2; y: 84.6; skew-x: -25.7; skew-y: -25.7; scale-x: 0.997; scale-y: 1.172; }
        frame 144 { x: 8.2; y: 86.5; skew-x: -33.9; skew-y: -33.9; scale-x: 0.998; scale-y: 1.261; }
        frame 145 { x: 10; y: 82.2; skew-x: -26.7; skew-y: -26.7; scale-x: 0.996; scale-y: 1.281; }
        frame 146 { x: 12.6; y: 78; skew-x: -19.5; skew-y: -19.5; scale-x: -10000; scale-y: 1.303; }
        frame 147 { x: 15.7; y: 73.9; skew-x: -12.3; skew-y: -12.3; scale-x: 0.997; scale-y: 1.326; }
        frame 148 { x: 15.8; y: 73.5; skew-x: -12.2; skew-y: -12.2; scale-x: 0.996; scale-y: 1.345; }
        frame 149 { x: -10000; y: 73; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.365; }
        frame 150 { y: 72.7; skew-x: -12.3; skew-y: -12.3; scale-x: 0.997; scale-y: 1.385; }
        frame 151 { x: 12; y: 75.8; skew-x: -16.7; skew-y: -16.7; scale-x: 0.996; scale-y: 1.338; }
        frame 152 { x: 8.4; y: 78.8; skew-x: -21; skew-y: -21; scale-x: 0.995; scale-y: 1.292; }
        frame 153 { x: 5.1; y: 82.1; skew-x: -25.4; skew-y: -25.4; scale-x: 0.996; scale-y: 1.247; }
        frame 154 { x: 2.5; y: 84.8; skew-x: -30; skew-y: -30; scale-x: 0.994; scale-y: 1.245; }
        frame 155 { x: 0; y: 87.6; skew-x: -34.5; skew-y: -34.5; scale-x: -10000; scale-y: 1.244; }
        frame 156 { x: -2.1; y: 90.6; skew-x: -39.2; skew-y: -39.2; scale-x: 0.995; scale-y: 1.246; }
        frame 157 { x: -5.1; y: 92.4; skew-x: -41.5; skew-y: -41.5; scale-x: 0.993; scale-y: 1.244; }
        frame 158 { x: -8.1; y: 94.2; skew-x: -43.8; skew-y: -43.8; scale-x: -10000; scale-y: 1.243; }
        frame 159 { x: -11.2; y: 96; skew-x: -46.2; skew-y: -46.2; scale-x: 0.994; scale-y: 1.245; }
        frame 160 { x: -10000; skew-x: -46.3; skew-y: -46.3; scale-x: 0.993; scale-y: 1.243; }
        frame 161 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 162 { y: 96; skew-x: -46.2; skew-y: -46.2; scale-x: 0.994; scale-y: 1.245; }
        frame 163 { x: -10.8; y: 93.7; skew-x: -43.8; skew-y: -43.8; scale-x: 0.993; scale-y: 1.269; }
        frame 164 { x: -10.4; y: 91.4; skew-x: -41.2; skew-y: -41.2; scale-x: 0.992; scale-y: 1.296; }
        frame 165 { x: -9.8; y: 89.1; skew-x: -38.7; skew-y: -38.7; scale-x: -10000; scale-y: 1.323; }
        frame 166 { x: -9.2; y: 86.7; skew-x: -36.2; skew-y: -36.2; scale-y: 1.35; }
        frame 167 { x: -8.5; y: 84.3; skew-x: -33.7; skew-y: -33.7; scale-x: 0.994; scale-y: 1.379; }
        frame 168 { x: -5.1; y: 81.8; skew-x: -28.4; skew-y: -28.4; scale-x: 0.992; scale-y: 1.354; }
        frame 169 { x: -1.4; y: 79; skew-x: -23; skew-y: -23; scale-x: -10000; scale-y: 1.331; }
        frame 170 { x: 2.2; y: 76.8; skew-x: -17.9; skew-y: -17.9; scale-y: 1.31; }
        frame 171 { x: 3.9; y: 76.5; skew-x: -16; skew-y: -16; scale-y: 1.287; }
        frame 172 { x: 5.5; y: 76.3; skew-x: -14.2; skew-y: -14.2; scale-x: 0.993; scale-y: 1.265; }
        frame 173 { x: 7.3; y: 76.1; skew-x: -12.7; skew-y: -12.7; scale-x: 0.994; scale-y: 1.244; }
        frame 174 { x: 10.3; y: 75.6; skew-x: -12.4; skew-y: -12.4; scale-x: -10000; scale-y: 1.258; }
        frame 175 { x: 13.1; y: 75.2; skew-x: -10000; skew-y: -10000; scale-x: 0.995; scale-y: 1.273; }
        frame 176 { x: 15.9; y: 74.6; skew-x: -12.3; skew-y: -12.3; scale-x: 0.997; scale-y: 1.289; }
        frame 177 { x: 15.8; y: 74; skew-x: -12.2; skew-y: -12.2; scale-x: 0.996; scale-y: 1.328; }
        frame 178 { x: 15.5; y: 73.4; skew-x: -12.3; skew-y: -12.3; scale-x: 0.997; scale-y: 1.37; }
        frame 179 { x: 11.8; y: 76.2; skew-x: -16.7; skew-y: -16.7; scale-x: 0.996; scale-y: 1.328; }
        frame 180 { x: 8.4; y: 79; skew-x: -21; skew-y: -21; scale-x: 0.995; scale-y: 1.286; }
        frame 181 { x: 5.1; y: 82.1; skew-x: -25.4; skew-y: -25.4; scale-x: 0.996; scale-y: 1.247; }
        frame 182 { x: 0.6; y: 83.7; skew-x: -30; skew-y: -32; scale-x: -10000; scale-y: 1.328; }
        frame 183 { x: -3.9; y: 85.8; skew-x: -34.7; skew-y: -38.5; scale-x: 0.997; scale-y: 1.411; }
        frame 184 { x: -8.5; y: 88.6; skew-x: -39.3; skew-y: -45.2; scale-x: 1; scale-y: 1.497; }
        frame 185 { x: -18.2; y: 113.3; skew-x: -68.9; skew-y: -74.1; scale-x: 0.998; scale-y: 1.699; }
        frame 186 { x: -18.3; y: 137.2; skew-x: -98.3; skew-y: -103.1; scale-x: 0.997; scale-y: 1.905; }
        frame 187 { x: -10.6; y: 142.4; skew-x: -109.2; skew-y: -114; scale-x: 0.996; scale-y: 1.901; }
        frame 188 { x: -2.1; y: 146.3; skew-x: -120.2; skew-y: -125; scale-x: -10000; scale-y: 1.902; }
        frame 189 { x: -10.6; y: 145.6; skew-x: -107.9; skew-y: -112.7; scale-x: 0.994; scale-y: 1.899; }
        frame 190 { x: -18; y: 143.1; skew-x: -95.6; skew-y: -100.4; scale-x: 0.995; scale-y: 1.9; }
        frame 191 { x: -18.1; y: 143.3; skew-x: -95.7; skew-y: -99.9; scale-x: 0.972; scale-y: 1.922; }
        frame 192 { x: -18.2; y: 143.6; skew-x: -96; skew-y: -99.7; scale-x: 0.951; scale-y: 1.946; }
        frame 193 { x: -14.6; y: 144.8; skew-x: -101.9; skew-y: -106.2; scale-x: 0.972; scale-y: 1.921; }
        frame 194 { x: -10.6; y: 145.6; skew-x: -107.9; skew-y: -112.7; scale-x: 0.994; scale-y: 1.899; }
        frame 195 { x: -14.4; y: 144.6; skew-x: -101.7; skew-y: -106.4; scale-x: -10000; scale-y: 1.897; }
        frame 196 { x: -18; y: 143.1; skew-x: -95.6; skew-y: -100.4; scale-x: 0.995; scale-y: 1.9; }
    }
    Track {
        source-name: "Zombie_gargantua_innerleg_upper";
        frame-count: 197;
        frame 0 { x: 16; y: 54; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_INNERLEG_UPPER; }
        frame 1 { x: 16.5; y: 53.8; skew-x: 1.5; skew-y: 1.5; image: none; }
        frame 2 { x: 17; y: 53.6; skew-x: 3; skew-y: 3; }
        frame 3 { x: 17.5; y: 53.4; skew-x: 4.5; skew-y: 4.5; scale-x: 0.999; scale-y: 0.999; }
        frame 4 { x: 18; y: -10000; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 18.5; y: 53.3; skew-x: 7.6; skew-y: 7.6; }
        frame 6 { x: 19.1; y: 53; skew-x: 9.1; skew-y: 9.1; }
        frame 7 { x: 19.8; y: 52.9; skew-x: 10.8; skew-y: 10.8; }
        frame 8 { x: 20.3; y: 52.8; skew-x: 12.3; skew-y: 12.3; }
        frame 9 { x: 21; y: -10000; skew-x: 13.8; skew-y: 13.8; scale-x: 0.998; scale-y: 0.998; }
        frame 10 { x: 21.6; skew-x: 15.4; skew-y: 15.4; scale-x: 0.999; scale-y: 0.999; }
        frame 11 { x: 21; y: 52.9; skew-x: 13.8; skew-y: 13.8; scale-x: 0.998; scale-y: 0.998; }
        frame 12 { x: 20.4; y: -10000; skew-x: 12.5; skew-y: 12.5; scale-x: 0.999; scale-y: 0.999; }
        frame 13 { x: 19.9; y: 53; skew-x: 11.1; skew-y: 11.1; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 19.4; y: 53.1; skew-x: 9.8; skew-y: 9.8; }
        frame 15 { x: 18.9; y: 53.3; skew-x: 8.3; skew-y: 8.3; }
        frame 16 { x: 18.3; y: 53.4; skew-x: 6.8; skew-y: 6.8; }
        frame 17 { x: 17.8; y: 53.5; skew-x: 5.5; skew-y: 5.5; }
        frame 18 { x: 17.3; y: 53.6; skew-x: 4.1; skew-y: 4.1; scale-x: 1; scale-y: 1; }
        frame 19 { x: 16.9; y: 53.8; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 16.4; y: 54; skew-x: 1.3; skew-y: 1.3; }
        frame 21 { x: 16; skew-x: 0; skew-y: 0; }
        frame 22 { x: 14.3; y: 57.3; skew-x: -12; skew-y: -17.3; scale-x: 0.999; scale-y: 1.004; }
        frame 23 { x: 14.9; y: 58; skew-x: -14.7; skew-y: -19.9; scale-x: 0.998; scale-y: 1.002; }
        frame 24 { x: 15.7; y: 58.8; skew-x: -17.2; skew-y: -22.7; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 16.5; y: 59.5; skew-x: -20; skew-y: -25.2; }
        frame 26 { x: 17.3; y: 60.4; skew-x: -22.7; skew-y: -28; }
        frame 27 { x: 18.2; y: 61.3; skew-x: -25.3; skew-y: -30.7; scale-x: 0.999; scale-y: 1.003; }
        frame 28 { x: 19.2; y: 61.5; skew-x: -26.5; skew-y: -32.3; scale-x: 0.998; scale-y: 1.001; }
        frame 29 { x: 20; y: 61.8; skew-x: -27.7; skew-y: -34; scale-x: 0.999; scale-y: -10000; }
        frame 30 { x: 20.8; y: 62.1; skew-x: -29; skew-y: -35.7; scale-x: 1; }
        frame 31 { x: 21.7; y: 62.5; skew-x: -30.2; skew-y: -37.5; scale-x: 1.001; }
        frame 32 { x: 22.6; y: 62.7; skew-x: -31.4; skew-y: -39.2; scale-x: 1.003; scale-y: 1.002; }
        frame 33 { x: 22.3; y: 63; skew-x: -32.2; skew-y: -40; scale-x: 1.001; scale-y: 1.001; }
        frame 34 { x: 22; y: 63.3; skew-x: -33; skew-y: -40.8; scale-x: -10000; scale-y: 1; }
        frame 35 { x: 21.8; y: 63.5; skew-x: -33.8; skew-y: -41.5; scale-y: -10000; }
        frame 36 { x: 21.4; y: 64; skew-x: -34.6; skew-y: -42.4; scale-x: 1.002; scale-y: 1.002; }
        frame 37 { x: 20; y: 63.9; skew-x: -34.5; skew-y: -42.5; scale-x: 1.001; scale-y: 1; }
        frame 38 { x: 18.5; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 17.1; }
        frame 40 { x: 15.7; }
        frame 41 { x: 14.2; y: 64; skew-x: -34.6; skew-y: -42.4; scale-x: 1.002; scale-y: 1.002; }
        frame 42 { x: 13.3; y: 63.1; skew-x: -31.5; skew-y: -39.3; scale-x: 1.001; scale-y: 1; }
        frame 43 { x: 12.5; y: 62.4; skew-x: -28.5; skew-y: -36.3; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 11.8; y: 61.7; skew-x: -25.5; skew-y: -33.2; scale-x: 1; }
        frame 45 { x: 11.2; y: 61; skew-x: -22.5; skew-y: -30.2; scale-x: -10000; }
        frame 46 { x: 10.6; y: 60.4; skew-x: -19.5; skew-y: -27.2; scale-x: 1.001; scale-y: 1.001; }
        frame 47 { x: 10.7; y: 57.4; skew-x: -15.4; skew-y: -23.2; scale-x: 1; scale-y: 1.021; }
        frame 48 { x: 11; y: 54.2; skew-x: -11.2; skew-y: -19.2; scale-x: -10000; scale-y: 1.043; }
        frame 49 { x: 11.5; y: 51.2; skew-x: -7.2; skew-y: -15; scale-y: 1.065; }
        frame 50 { x: 12.2; y: 48.3; skew-x: -3.2; skew-y: -11; scale-y: 1.087; }
        frame 51 { x: 13.2; y: 45.5; skew-x: 0.6; skew-y: -7.1; scale-y: 1.11; }
        frame 52 { x: 15; y: 44.8; skew-x: 3.8; skew-y: -3.7; scale-y: 1.109; }
        frame 53 { x: 17; y: 44.1; skew-x: 7.3; skew-y: -0.2; scale-x: 0.999; scale-y: -10000; }
        frame 54 { x: 18.9; y: 43.6; skew-x: 10.6; skew-y: 2.8; scale-x: -10000; }
        frame 55 { x: 21; y: 43.1; skew-x: 14; skew-y: 6.3; }
        frame 56 { x: 23.2; y: 42.8; skew-x: 17.4; skew-y: 9.7; }
        frame 57 { x: 19.9; y: 45.1; skew-x: 11.8; skew-y: 5.8; scale-x: 0.996; scale-y: 1.108; }
        frame 58 { x: 16.8; y: 47.5; skew-x: 6.3; skew-y: 1.8; scale-x: 0.993; scale-y: -10000; }
        frame 59 { x: 14.1; y: 50; skew-x: 1; skew-y: -1.7; scale-x: 0.991; scale-y: 1.107; }
        frame 60 { x: 11.3; y: 52.8; skew-x: -4.4; skew-y: -5.6; scale-x: 0.988; scale-y: -10000; }
        frame 61 { x: 11.9; y: 53.1; skew-x: -3.7; skew-y: -5.4; scale-x: 0.99; scale-y: 1.094; }
        frame 62 { x: 12.5; y: 53.5; skew-x: -3.2; skew-y: -10000; scale-x: 0.991; scale-y: 1.082; }
        frame 63 { x: 12.9; y: 54; skew-x: -2.7; scale-x: 0.992; scale-y: 1.069; }
        frame 64 { x: 13.5; y: 54.3; skew-x: -2.2; scale-x: 0.994; scale-y: 1.057; }
        frame 65 { x: 14; y: 54.8; skew-x: -1.9; scale-x: 0.995; scale-y: 1.045; }
        frame 66 { x: 14.1; y: 55.3; skew-x: -3.9; skew-y: -7.7; scale-x: 0.996; scale-y: 1.036; }
        frame 67 { x: 14; y: 55.7; skew-x: -5.9; skew-y: -10.2; scale-x: 0.997; scale-y: 1.028; }
        frame 68 { x: 14.2; y: 56.3; skew-x: -7.9; skew-y: -12.5; scale-x: -10000; scale-y: 1.019; }
        frame 69 { x: -10000; y: 56.9; skew-x: -9.9; skew-y: -14.9; scale-x: 0.998; scale-y: 1.011; }
        frame 70 { x: 14.3; y: 57.3; skew-x: -12; skew-y: -17.3; scale-x: 0.999; scale-y: 1.004; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 15.4; y: 54.3; skew-x: -5.4; skew-y: -10.7; scale-y: 1.003; }
        frame 73 { x: 17; y: 51.4; skew-x: 1; skew-y: -4.2; scale-y: -10000; }
        frame 74 { x: 18.8; y: 48.9; skew-x: 7.5; skew-y: 2.3; scale-x: 0.998; scale-y: 1.002; }
        frame 75 { x: 21; y: 46.6; skew-x: 14.1; skew-y: 8.8; scale-x: 0.997; scale-y: -10000; }
        frame 76 { x: 23.5; y: 44.8; skew-x: 20.8; skew-y: 15.3; scale-x: -10000; scale-y: 1.001; }
        frame 77 { x: 26.1; y: 43.2; skew-x: 27.3; skew-y: 22; scale-x: 0.996; scale-y: 1; }
        frame 78 { x: 29.1; y: 42.1; skew-x: 33.9; skew-y: 28.6; scale-x: 0.995; scale-y: -10000; }
        frame 79 { x: 32.1; y: 41.4; skew-x: 40.6; skew-y: 35.2; scale-x: 0.997; scale-y: 1.001; }
        frame 80 { x: 32.8; y: 40.9; skew-x: 42.4; skew-y: 37.1; scale-x: 0.995; scale-y: 0.999; }
        frame 81 { x: 33.3; y: 40.5; skew-x: 44.1; skew-y: 38.9; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 33.9; y: 40; skew-x: 46.1; skew-y: 40.6; }
        frame 83 { x: 34.5; y: 39.6; skew-x: 47.9; skew-y: 42.6; }
        frame 84 { x: 35.1; y: 39.4; skew-x: 49.7; skew-y: 44.4; }
        frame 85 { x: 35.6; y: 38.9; skew-x: 51.6; skew-y: 46.2; scale-x: 0.996; scale-y: 1; }
        frame 86 { x: 35.9; y: 36.9; skew-x: 52.2; skew-y: 46.9; scale-x: 0.994; scale-y: 0.998; }
        frame 87 { x: -10000; y: 34.9; skew-x: 52.7; skew-y: 47.4; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 36; y: 32.6; skew-x: 53.4; skew-y: 47.9; scale-x: 0.993; scale-y: 0.997; }
        frame 89 { x: 36.2; y: 30.7; skew-x: 53.9; skew-y: 48.6; scale-x: 0.994; scale-y: 0.999; }
        frame 90 { x: 22; y: 39.4; skew-x: 45.1; skew-y: 39.8; scale-x: 0.992; scale-y: 0.996; }
        frame 91 { x: 7.7; y: 48.7; skew-x: 36.4; skew-y: 31.1; scale-x: -10000; scale-y: 0.997; }
        frame 92 { x: -5; y: 54.6; skew-x: 37.4; skew-y: 32.1; scale-x: 0.993; scale-y: -10000; }
        frame 93 { x: -4.5; y: 54.8; skew-x: 39.6; skew-y: 34.3; scale-x: 0.991; scale-y: 0.995; }
        frame 94 { x: -4; y: 54.9; skew-x: 41.9; skew-y: 36.6; scale-x: 0.993; scale-y: 0.997; }
        frame 95 { x: -4.5; y: 54.8; skew-x: 39.6; skew-y: 34.3; scale-x: 0.991; scale-y: 0.995; }
        frame 96 { x: -5; y: 54.6; skew-x: 37.4; skew-y: 32.1; scale-x: 0.993; scale-y: 0.997; }
        frame 97 { x: -3.2; y: 53.8; skew-x: 30.3; skew-y: 24.8; scale-x: 0.992; scale-y: -10000; }
        frame 98 { x: -1; y: 53.3; skew-x: 23.3; skew-y: 17.8; scale-x: 0.993; scale-y: 0.998; }
        frame 99 { x: 1.2; y: 53.4; skew-x: 16.1; skew-y: 10.8; scale-x: 0.995; scale-y: 0.999; }
        frame 100 { x: 3.9; y: 53.8; skew-x: 9; skew-y: 3.8; scale-x: 0.996; scale-y: 1.001; }
        frame 101 { x: 7; y: 54.5; skew-x: 2; skew-y: -3.2; scale-x: 0.997; scale-y: 1.002; }
        frame 102 { x: 10.5; y: 55.7; skew-x: -4.9; skew-y: -10.2; scale-x: 0.998; scale-y: -10000; }
        frame 103 { x: 14.3; y: 57.3; skew-x: -12; skew-y: -17.3; scale-x: 0.999; scale-y: 1.004; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 15.9; y: 55.8; skew-x: -8.4; skew-y: -13.2; scale-x: 0.998; scale-y: 1.003; }
        frame 106 { x: 17.5; y: 54.3; skew-x: -5; skew-y: -8.9; scale-x: 0.997; scale-y: -10000; }
        frame 107 { x: 19.3; y: 53; skew-x: -1.5; skew-y: -4.7; scale-x: -10000; }
        frame 108 { x: 21.2; y: 51.8; skew-x: 1.6; skew-y: -0.5; scale-x: 0.996; scale-y: 1.002; }
        frame 109 { x: 23; y: 50.6; skew-x: 5; skew-y: 3.3; scale-x: 0.995; scale-y: -10000; }
        frame 110 { x: 25.1; y: 49.5; skew-x: 8.5; skew-y: 7.5; scale-x: 0.994; }
        frame 111 { x: 27.3; y: 48.7; skew-x: 12; skew-y: 11.8; scale-x: 0.993; scale-y: 1.001; }
        frame 112 { x: 29.3; y: 47.9; skew-x: 15.5; skew-y: 16; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 29.1; y: 47.6; skew-x: 16.5; skew-y: 16.8; scale-x: 0.992; scale-y: 1; }
        frame 114 { x: 28.9; y: 47.4; skew-x: 17.3; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 28.7; y: 47.3; skew-x: 18.3; skew-y: 18.8; }
        frame 116 { x: 28.5; y: 47; skew-x: 19.3; skew-y: 19.8; }
        frame 117 { x: 28.4; y: 46.9; skew-x: 20.3; skew-y: 20.8; scale-x: 0.993; scale-y: 1.001; }
        frame 118 { x: 29.3; y: 47; skew-x: 22.8; skew-y: 23.3; scale-x: 0.991; scale-y: 1; }
        frame 119 { x: 30.1; y: 47.1; skew-x: 25.3; skew-y: 25.8; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 31.1; y: 47.4; skew-x: 27.8; skew-y: 28.3; scale-y: 0.999; }
        frame 121 { x: 31.9; y: 47.7; skew-x: 30.4; skew-y: 30.8; scale-x: 0.992; scale-y: 1.001; }
        frame 122 { x: 31.8; y: 47.8; skew-x: 30.3; skew-y: -10000; scale-x: 0.991; scale-y: 0.999; }
        frame 123 { x: 31.9; y: 47.7; skew-x: 30.4; scale-x: 0.992; scale-y: 1.001; }
        frame 124 { x: 30.3; y: 47.2; skew-x: 27.1; skew-y: 27.6; scale-x: 0.99; scale-y: 0.999; }
        frame 125 { x: 28.7; y: 46.6; skew-x: 23.8; skew-y: 24.3; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 27.2; y: 46.1; skew-x: 20.6; skew-y: 21.1; }
        frame 127 { x: 25.8; y: 45.9; skew-x: 17.3; skew-y: 17.8; }
        frame 128 { x: 24.4; y: 45.5; skew-x: 14.3; skew-y: 14.7; scale-x: 0.991; scale-y: 1; }
        frame 129 { x: 23.3; y: 45.8; skew-x: 11.2; skew-y: 11.5; scale-x: 0.99; scale-y: 0.998; }
        frame 130 { x: 31.9; y: 45.2; skew-x: 30.4; skew-y: 30.8; scale-x: 0.992; scale-y: 1.001; }
        frame 131 { x: 32.3; y: 44.5; skew-x: 31.9; skew-y: 32.3; scale-x: 0.99; scale-y: 0.999; }
        frame 132 { x: 32.9; y: 43.6; skew-x: 33.6; skew-y: 33.9; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 33.4; y: 42.9; skew-x: 35.1; skew-y: 35.5; scale-x: 0.992; scale-y: 1; }
        frame 134 { x: 27.6; y: 44.5; skew-x: 23.3; skew-y: 22.3; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 22.1; y: 47.6; skew-x: 11.5; skew-y: 9; scale-x: 0.995; scale-y: 1.001; }
        frame 136 { x: 17.7; y: 52; skew-x: -0.2; skew-y: -4; scale-x: 0.997; scale-y: 1.002; }
        frame 137 { x: 14.3; y: 57.3; skew-x: -12; skew-y: -17.3; scale-x: 0.999; scale-y: 1.004; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 14.8; y: 56; skew-x: -8.9; skew-y: -14.2; scale-y: 1.003; }
        frame 140 { x: 15.2; y: 54.8; skew-x: -5.7; skew-y: -11.2; scale-y: -10000; }
        frame 141 { x: 15.8; y: 53.6; skew-x: -2.7; skew-y: -8.1; }
        frame 142 { x: 17.4; y: 53.8; skew-x: 2; skew-y: -2.5; scale-x: 0.998; }
        frame 143 { x: 19; y: 54; skew-x: 6.8; skew-y: 2.6; scale-x: 0.996; scale-y: 1.002; }
        frame 144 { x: 21.2; y: 54.5; skew-x: 11.8; skew-y: 8.2; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 21.9; y: 51.9; skew-x: 9.3; skew-y: 8; scale-x: 0.995; }
        frame 146 { x: 22.7; y: 49.4; skew-x: 6.8; skew-y: -10000; scale-x: -10000; }
        frame 147 { x: 23.5; y: 46.9; skew-x: 4.4; skew-y: 8.2; scale-x: 0.996; }
        frame 148 { x: 22.1; y: 48; skew-x: 1.6; skew-y: 5.3; scale-x: 0.995; }
        frame 149 { x: 20.7; y: 49; skew-x: -0.7; skew-y: 2.8; scale-x: -10000; }
        frame 150 { x: 19.5; y: 50.3; skew-x: -3.6; skew-y: 0.1; }
        frame 151 { x: 11.5; y: 52.5; skew-x: -10.7; skew-y: -6.9; scale-x: 0.994; scale-y: 1.001; }
        frame 152 { x: 3.9; y: 55; skew-x: -18; skew-y: -14.2; scale-x: 0.993; scale-y: 1; }
        frame 153 { x: -3.2; y: 57.9; skew-x: -25.4; skew-y: -21.6; scale-x: 0.994; scale-y: -10000; }
        frame 154 { x: -6.9; y: 59.8; skew-x: -26.2; skew-y: -22.4; scale-x: 0.992; scale-y: 0.999; }
        frame 155 { x: -10.8; y: 61.6; skew-x: -27; skew-y: -23.2; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: -14.6; y: 63.6; skew-x: -28; skew-y: -24.2; scale-x: 0.993; scale-y: 1; }
        frame 157 { x: -13.7; y: 63.1; skew-x: -22.2; skew-y: -18.4; scale-x: 0.992; scale-y: 0.998; }
        frame 158 { x: -12.5; y: 62.8; skew-x: -16.4; skew-y: -12.7; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: -11; y: 62.4; skew-x: -10.7; skew-y: -6.9; scale-y: 0.999; }
        frame 160 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: 0.998; }
        frame 161 { scale-y: -10000; }
        frame 162 { scale-y: 0.999; }
        frame 163 { x: -12.1; y: 61.6; skew-x: -13.9; skew-y: -10.2; scale-x: 0.991; scale-y: 0.998; }
        frame 164 { x: -13.2; y: 60.9; skew-x: -17.2; skew-y: -13.4; scale-x: -10000; scale-y: 0.997; }
        frame 165 { x: -14.1; y: 60.1; skew-x: -20.5; skew-y: -16.7; scale-x: 0.99; scale-y: -10000; }
        frame 166 { x: -15; y: 59.6; skew-x: -23.9; skew-y: -20.2; scale-x: -10000; }
        frame 167 { x: -15.8; y: 59; skew-x: -27.3; skew-y: -23.5; scale-x: 0.991; }
        frame 168 { x: -10.3; y: 56.3; skew-x: -23.2; skew-y: -17.5; scale-x: 0.994; }
        frame 169 { x: -4.7; y: 53.6; skew-x: -19; skew-y: -11.5; scale-x: 0.998; }
        frame 170 { x: 0.8; y: 51.3; skew-x: -15; skew-y: -5.7; scale-x: 1.003; scale-y: 0.998; }
        frame 171 { x: 4.8; y: 50.4; skew-x: -7; skew-y: 0; scale-x: 1; scale-y: 0.999; }
        frame 172 { x: 9.6; y: 50; skew-x: 0.5; skew-y: 6; scale-x: 0.997; scale-y: -10000; }
        frame 173 { x: 14.9; y: 49.5; skew-x: 8.5; skew-y: 12; scale-x: 0.994; scale-y: 1; }
        frame 174 { x: 17.8; y: 48.7; skew-x: 7; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 20.6; y: 47.7; skew-x: 5.8; skew-y: 9.3; scale-x: 0.995; scale-y: 1.001; }
        frame 176 { x: 23.5; y: 46.9; skew-x: 4.4; skew-y: 8.2; scale-x: 0.996; scale-y: 1.002; }
        frame 177 { x: 21.4; y: 48.5; skew-x: 0.3; skew-y: 4; scale-x: 0.995; scale-y: -10000; }
        frame 178 { x: 19.5; y: 50.3; skew-x: -3.6; skew-y: 0.1; scale-x: -10000; }
        frame 179 { x: 11.5; y: 52.5; skew-x: -10.7; skew-y: -6.9; scale-x: 0.994; scale-y: 1.001; }
        frame 180 { x: 3.9; y: 55; skew-x: -18; skew-y: -14.2; scale-x: 0.993; scale-y: 1; }
        frame 181 { x: -3.2; y: 57.9; skew-x: -25.4; skew-y: -21.6; scale-x: 0.994; scale-y: -10000; }
        frame 182 { x: -8.2; y: 61; skew-x: -28.5; skew-y: -24.7; scale-x: 0.992; scale-y: 0.999; }
        frame 183 { x: -13.1; y: 64.2; skew-x: -31.7; skew-y: -28; scale-x: -10000; scale-y: 0.998; }
        frame 184 { x: -18; y: 67.5; skew-x: -35; skew-y: -31.2; scale-x: 0.993; scale-y: 0.999; }
        frame 185 { x: -23.3; y: 84.8; skew-x: -38; skew-y: -34; scale-x: 0.99; scale-y: 0.997; }
        frame 186 { x: -28.8; y: 102.4; skew-x: -40.8; skew-y: -37; scale-x: 0.991; scale-y: -10000; }
        frame 187 { x: -27.2; y: 110.4; skew-x: -51.8; skew-y: -48; scale-x: 0.988; scale-y: 0.995; }
        frame 188 { x: -24.8; y: 118.1; skew-x: -62.7; skew-y: -59; scale-x: 0.989; scale-y: 0.996; }
        frame 189 { x: -24.7; y: -10000; skew-x: -62.8; skew-y: -59.1; scale-x: 0.988; scale-y: 0.994; }
        frame 190 { x: -24.8; skew-x: -62.7; skew-y: -59; scale-x: 0.989; scale-y: 0.996; }
        frame 191 { x: -24.9; y: 118.8; skew-x: -61.9; skew-y: -59.8; scale-x: 0.974; scale-y: 0.999; }
        frame 192 { x: -25.1; y: 119.6; skew-x: -61; skew-y: -60.7; scale-x: 0.961; scale-y: 1.004; }
        frame 193 { x: -24.8; y: 118.9; skew-x: -62.1; skew-y: -59.9; scale-x: 0.973; scale-y: 0.998; }
        frame 194 { x: -24.7; y: 118.1; skew-x: -62.8; skew-y: -59.1; scale-x: 0.988; scale-y: 0.994; }
        frame 195 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.987; scale-y: -10000; }
        frame 196 { x: -24.8; skew-x: -62.7; skew-y: -59; scale-x: 0.989; scale-y: 0.996; }
    }
    Track {
        source-name: "Zombie_gargantua_body2";
        frame-count: 197;
        frame 0 { x: 20.3; y: 48.1; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_BODY2; }
        frame 1 { x: 20.2; y: 47.7; image: none; }
        frame 2 { x: 20.1; y: 47.3; }
        frame 3 { x: 20; y: 47; }
        frame 4 { x: 19.6; y: 47.8; skew-x: -0.4; skew-y: -0.4; }
        frame 5 { x: 19.1; y: 48.8; skew-x: -1.2; skew-y: -1.2; }
        frame 6 { x: 18.7; y: 49.8; skew-x: -1.9; skew-y: -1.9; }
        frame 7 { x: 18.2; y: 50.6; skew-x: -2.5; skew-y: -2.5; }
        frame 8 { x: 17.7; y: 51.6; skew-x: -3.2; skew-y: -3.2; }
        frame 9 { x: 17.3; y: 52.6; skew-x: -3.9; skew-y: -3.9; scale-x: 0.999; scale-y: 0.999; }
        frame 10 { x: 16.7; y: 53.6; skew-x: -4.7; skew-y: -4.7; scale-x: 1; scale-y: 1; }
        frame 11 { x: 17; y: -10000; skew-x: -4.2; skew-y: -4.2; scale-x: 0.999; scale-y: 0.999; }
        frame 12 { x: 17.4; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 17.8; y: 53.8; skew-x: -3.2; skew-y: -3.2; scale-x: 1; scale-y: 1; }
        frame 14 { x: 18.1; y: 53; skew-x: -2.7; skew-y: -2.7; scale-x: 0.999; scale-y: 0.999; }
        frame 15 { x: 18.5; y: 52.2; skew-x: -2.2; skew-y: -2.2; scale-x: 1; scale-y: 1; }
        frame 16 { x: 18.8; y: 51.6; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 19.2; y: 51; skew-x: -1.4; skew-y: -1.4; }
        frame 18 { x: 19.5; y: 50.1; skew-x: -1; skew-y: -1; }
        frame 19 { x: 19.7; y: 49.5; skew-x: -0.7; skew-y: -0.7; }
        frame 20 { x: 20.1; y: 48.9; skew-x: -0.2; skew-y: -0.2; }
        frame 21 { x: 20.3; y: 48.1; skew-x: 0; skew-y: 0; }
        frame 22 { x: -10000; y: 47; skew-x: -10000; skew-y: -10000; }
        frame 23 { x: 20.5; y: 46; skew-x: 0.8; skew-y: 0.8; }
        frame 24 { x: 20.7; y: 45; skew-x: 1.8; skew-y: 1.8; }
        frame 25 { x: 20.8; y: 43.9; skew-x: 2.6; skew-y: 2.6; }
        frame 26 { x: 21.1; y: 42.9; skew-x: 3.5; skew-y: 3.5; }
        frame 27 { x: 21.4; y: 41.6; skew-x: 4.6; skew-y: 4.6; }
        frame 28 { x: 21.6; y: 41; skew-x: 5; skew-y: 5; scale-x: 0.999; scale-y: 0.999; }
        frame 29 { x: 21.7; y: 40.4; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 21.9; y: 39.6; skew-x: 6; skew-y: 6; }
        frame 31 { x: 22.1; y: 39; skew-x: 6.5; skew-y: 6.5; }
        frame 32 { x: 22.3; y: 38.2; skew-x: 7.1; skew-y: 7.1; scale-x: 1; scale-y: 1; }
        frame 33 { x: 19.9; y: 43.6; skew-x: 3.3; skew-y: 3.3; scale-x: 0.999; scale-y: 0.999; }
        frame 34 { x: 17.6; y: 48.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 15.6; y: 54; skew-x: -3.5; skew-y: -3.5; }
        frame 36 { x: 13.7; y: 59.6; skew-x: -7.2; skew-y: -7.2; }
        frame 37 { x: 13.8; y: 59; skew-x: -6.7; skew-y: -6.7; scale-x: 0.998; scale-y: 0.998; }
        frame 38 { x: 13.9; y: 58.5; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 14; y: 57.9; skew-x: -5.7; skew-y: -5.7; }
        frame 40 { y: 57.4; skew-x: -5.2; skew-y: -5.2; }
        frame 41 { x: 14.2; y: 56.9; skew-x: -4.7; skew-y: -4.7; scale-x: 0.999; scale-y: 0.999; }
        frame 42 { x: 15; y: 56.1; skew-x: -4; skew-y: -4; scale-x: 0.998; scale-y: 0.998; }
        frame 43 { x: 15.7; y: 55.5; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 16.6; y: 54.9; skew-x: -2.9; skew-y: -2.9; }
        frame 45 { x: 17.4; y: 54.3; skew-x: -2.4; skew-y: -2.4; }
        frame 46 { x: 18.2; y: 53.6; skew-x: -1.9; skew-y: -1.9; }
        frame 47 { x: 18.7; y: 52.6; skew-x: -0.9; skew-y: -0.9; scale-x: 0.991; }
        frame 48 { x: 19.1; y: 51.6; skew-x: -0.2; skew-y: -0.2; scale-x: 0.984; }
        frame 49 { x: 19.6; y: 50.9; skew-x: 0.3; skew-y: 0.3; scale-x: 0.977; }
        frame 50 { x: 20.1; y: 49.8; skew-x: 1.3; skew-y: 1.3; scale-x: 0.969; }
        frame 51 { x: 20.6; y: 49; skew-x: 2.1; skew-y: 2.1; scale-x: 0.962; }
        frame 52 { x: 20.9; y: 48; skew-x: 3.3; skew-y: 3.3; scale-x: 0.969; }
        frame 53 { x: 21.2; y: 46.8; skew-x: 4.5; skew-y: 4.5; scale-x: 0.976; }
        frame 54 { x: 21.5; y: 45.7; skew-x: 5.6; skew-y: 5.6; scale-x: 0.983; }
        frame 55 { x: 21.9; y: 44.5; skew-x: 6.8; skew-y: 6.8; scale-x: 0.99; }
        frame 56 { x: 22.3; y: 43.1; skew-x: 8.1; skew-y: 8.1; scale-x: 0.998; }
        frame 57 { x: 20.8; y: 47.1; skew-x: 3; skew-y: 3; scale-x: 0.997; scale-y: 0.997; }
        frame 58 { x: 19.6; y: 51.3; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 18.7; y: 55.4; skew-x: -7; skew-y: -7; }
        frame 60 { x: 18.2; y: 59.9; skew-x: -12.2; skew-y: -12.2; }
        frame 61 { x: 18.6; y: 57.6; skew-x: -9.9; skew-y: -9.9; scale-x: 0.996; scale-y: 0.996; }
        frame 62 { x: 18.8; y: 55.5; skew-x: -7.9; skew-y: -7.9; scale-x: 0.997; scale-y: 0.997; }
        frame 63 { x: 19.2; y: 53.3; skew-x: -5.7; skew-y: -5.7; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 19.7; y: 51; skew-x: -3.4; skew-y: -3.4; scale-x: 0.998; scale-y: 0.998; }
        frame 65 { x: 20.1; y: 49; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 20.2; y: 48.5; skew-x: -0.9; skew-y: -0.9; scale-x: 0.999; scale-y: 0.999; }
        frame 67 { x: 20.3; y: 48.1; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: -10000; y: 47.8; skew-x: -0.4; skew-y: -0.4; }
        frame 69 { y: 47.4; skew-x: -0.2; skew-y: -0.2; scale-x: 1; scale-y: 1; }
        frame 70 { y: 47; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 71 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 72 { x: 21.9; y: 45; skew-x: 2.8; skew-y: 2.8; }
        frame 73 { x: 23.5; y: 43; skew-x: 5.5; skew-y: 5.5; scale-x: 0.999; scale-y: 0.999; }
        frame 74 { x: 25.2; y: 41.1; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 27.2; y: 39; skew-x: 11.3; skew-y: 11.3; }
        frame 76 { x: 29.1; y: 37.2; skew-x: 14; skew-y: 14; scale-x: 0.998; scale-y: 0.998; }
        frame 77 { x: 31.1; y: 35.4; skew-x: 16.8; skew-y: 16.8; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 33.1; y: 33.8; skew-x: 19.6; skew-y: 19.6; }
        frame 79 { x: 35.4; y: 31.9; skew-x: 22.6; skew-y: 22.6; scale-x: 0.999; scale-y: 0.999; }
        frame 80 { x: 36.3; y: 32.9; skew-x: 23.3; skew-y: 23.3; scale-x: 0.997; scale-y: 0.997; }
        frame 81 { x: 37.3; y: 33.6; skew-x: 24.3; skew-y: 24.3; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 38.4; y: 34.4; skew-x: 25.3; skew-y: 25.3; }
        frame 83 { x: 39.4; y: 35.2; skew-x: 26.3; skew-y: 26.3; }
        frame 84 { x: 40.3; y: 36; skew-x: 27.1; skew-y: 27.1; }
        frame 85 { x: 41.3; y: 36.8; skew-x: 28.1; skew-y: 28.1; scale-x: 0.998; scale-y: 0.998; }
        frame 86 { x: 38.5; y: 35.4; skew-x: 24.3; skew-y: 24.3; scale-x: 0.997; scale-y: 0.997; }
        frame 87 { x: 35.8; y: 34; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 33.3; y: 32.6; skew-x: 17; skew-y: 17; }
        frame 89 { x: 30.8; y: 31.5; skew-x: 13.3; skew-y: 13.3; scale-x: 0.998; scale-y: 0.998; }
        frame 90 { x: 17.3; y: 43.7; skew-x: 2; skew-y: 2; scale-x: 0.997; scale-y: 0.997; }
        frame 91 { x: 5.3; y: 56.6; skew-x: -9.2; skew-y: -9.2; scale-x: 0.996; scale-y: 0.996; }
        frame 92 { x: -4.8; y: 70; skew-x: -20.7; skew-y: -20.7; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -4.9; y: 70.2; skew-x: -19.5; skew-y: -19.5; scale-x: 0.995; scale-y: 0.995; }
        frame 94 { x: -5.1; y: 70.6; skew-x: -18.4; skew-y: -18.4; scale-x: 0.996; scale-y: 0.996; }
        frame 95 { x: -4.9; y: 70.1; skew-x: -19.5; skew-y: -19.5; scale-x: 0.995; scale-y: 0.995; }
        frame 96 { x: -4.8; y: 70; skew-x: -20.7; skew-y: -20.7; scale-x: 0.996; scale-y: 0.996; }
        frame 97 { x: -1.4; y: 66.6; skew-x: -17.7; skew-y: -17.7; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 1.8; y: 63.3; skew-x: -14.7; skew-y: -14.7; scale-x: 0.997; scale-y: 0.997; }
        frame 99 { x: 5.2; y: 59.9; skew-x: -11.7; skew-y: -11.7; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 8.8; y: 56.6; skew-x: -8.7; skew-y: -8.7; scale-x: 0.998; scale-y: 0.998; }
        frame 101 { x: 12.6; y: 53.3; skew-x: -5.7; skew-y: -5.7; scale-x: 0.999; scale-y: 0.999; }
        frame 102 { x: 16.4; y: 50; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 20.3; y: 47; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 20.7; y: 47.3; skew-x: -0.4; skew-y: -0.4; }
        frame 106 { x: 21.1; y: 47.6; skew-x: -1.2; skew-y: -1.2; scale-x: 0.999; scale-y: 0.999; }
        frame 107 { x: 21.4; y: 47.9; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 21.8; y: 48.3; skew-x: -2.4; skew-y: -2.4; scale-x: 0.998; scale-y: 0.998; }
        frame 109 { x: 22.3; y: 48.5; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 22.7; y: 48.9; skew-x: -3.7; skew-y: -3.7; }
        frame 111 { x: 23; y: 49.1; skew-x: -4.2; skew-y: -4.2; scale-x: 0.997; scale-y: 0.997; }
        frame 112 { x: 23.3; y: 49.5; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 23.1; y: 50.6; skew-x: -6.5; skew-y: -6.5; }
        frame 114 { x: 22.9; y: 52; skew-x: -8.2; skew-y: -8.2; }
        frame 115 { x: 22.7; y: 53.3; skew-x: -9.7; skew-y: -9.7; scale-x: 0.996; scale-y: 0.996; }
        frame 116 { x: 22.6; y: 54.5; skew-x: -11.4; skew-y: -11.4; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 22.3; y: 55.8; skew-x: -13.1; skew-y: -13.1; scale-x: 0.997; scale-y: 0.997; }
        frame 118 { x: 21.6; y: 55.7; skew-x: -11.9; skew-y: -11.9; scale-x: 0.996; scale-y: 0.996; }
        frame 119 { x: 20.8; y: 55.8; skew-x: -10.9; skew-y: -10.9; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 20.1; y: 55.6; skew-x: -9.7; skew-y: -9.7; }
        frame 121 { x: 19.4; y: 55.8; skew-x: -8.8; skew-y: -8.8; }
        frame 122 { x: 19.5; y: 55.7; skew-x: -8.7; skew-y: -8.7; }
        frame 123 { x: 19.4; y: 55.8; skew-x: -8.8; skew-y: -8.8; }
        frame 124 { x: 19; y: 54.4; skew-x: -7.7; skew-y: -7.7; }
        frame 125 { x: 18.7; y: 53; skew-x: -6.4; skew-y: -6.4; }
        frame 126 { x: 18.4; y: 51.6; skew-x: -5.2; skew-y: -5.2; }
        frame 127 { x: 18; y: 50.4; skew-x: -4.2; skew-y: -4.2; }
        frame 128 { x: 17.7; y: 49; skew-x: -3; skew-y: -3; }
        frame 129 { x: 22.8; y: 49.5; skew-x: -1; skew-y: -1; }
        frame 130 { x: 27.8; y: 50.3; skew-x: 0.7; skew-y: 0.7; }
        frame 131 { x: 30.1; y: 45.1; skew-x: 5; skew-y: 5; scale-x: 0.995; scale-y: 0.995; }
        frame 132 { x: 32.5; y: 40.3; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 35.3; y: 35.4; skew-x: 13.8; skew-y: 13.8; }
        frame 134 { x: 31.3; y: 38.3; skew-x: 10.3; skew-y: 10.3; }
        frame 135 { x: 27.5; y: 41; skew-x: 6.8; skew-y: 6.8; scale-x: 0.997; scale-y: 0.997; }
        frame 136 { x: 23.8; y: 44; skew-x: 3.3; skew-y: 3.3; scale-x: 0.998; scale-y: 0.998; }
        frame 137 { x: 20.3; y: 47; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 20.7; y: 47.4; skew-x: 1.8; skew-y: 1.8; }
        frame 140 { x: 21.3; y: 47.5; skew-x: 3.8; skew-y: 3.8; }
        frame 141 { x: 21.8; y: 47.8; skew-x: 5.8; skew-y: 5.8; }
        frame 142 { x: 22.7; y: 48.6; skew-x: 7.8; skew-y: 7.8; scale-x: 0.999; scale-y: 0.999; }
        frame 143 { x: 23.7; y: 49.4; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 24.7; y: 50; skew-x: 12.1; skew-y: 12.1; }
        frame 145 { x: 28; y: 45.6; skew-x: 17; skew-y: 17; scale-x: 0.998; scale-y: 0.998; }
        frame 146 { x: 31.3; y: 41.5; skew-x: 21.8; skew-y: 21.8; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 35; y: 37.5; skew-x: 26.8; skew-y: 26.8; }
        frame 148 { x: 30.7; y: 37.6; skew-x: 23.1; skew-y: 23.1; scale-x: 0.997; scale-y: 0.997; }
        frame 149 { x: 26.6; y: 38; skew-x: 19.6; skew-y: 19.6; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 22.4; y: 38.2; skew-x: 16.2; skew-y: 16.2; scale-x: 0.998; scale-y: 0.998; }
        frame 151 { x: 14.5; y: 41.5; skew-x: 9.8; skew-y: 9.8; scale-x: 0.997; scale-y: 0.997; }
        frame 152 { x: 7.2; y: 44.9; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 0.2; y: 48.6; skew-x: -2.6; skew-y: -2.6; }
        frame 154 { x: -3.3; y: 50.6; skew-x: -5.4; skew-y: -5.4; }
        frame 155 { x: -6.8; y: 52.9; skew-x: -8.4; skew-y: -8.4; scale-x: 0.996; scale-y: 0.996; }
        frame 156 { x: -10.3; y: 55; skew-x: -11.5; skew-y: -11.5; scale-x: 0.997; scale-y: 0.997; }
        frame 157 { x: -10.4; y: 56.5; skew-x: -11.4; skew-y: -11.4; scale-x: 0.996; scale-y: 0.996; }
        frame 158 { x: -10000; y: 58.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: -10.3; y: 59.8; skew-x: -11.5; skew-y: -11.5; scale-x: 0.997; scale-y: 0.997; }
        frame 160 { x: -10.8; y: 58; skew-x: -10; skew-y: -10; scale-x: 0.996; scale-y: 0.996; }
        frame 161 { x: -11.2; y: 56.3; skew-x: -8.7; skew-y: -8.7; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: -11.6; y: 54.6; skew-x: -7.4; skew-y: -7.4; }
        frame 163 { x: -11.3; y: 53.4; skew-x: -6.9; skew-y: -6.9; }
        frame 164 { x: -11; y: 52.1; skew-x: -6.5; skew-y: -6.5; scale-x: 0.995; scale-y: 0.995; }
        frame 165 { x: -10.7; y: 51.1; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 166 { x: -10.5; y: 49.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.994; scale-y: 0.994; }
        frame 167 { x: -10.1; y: 48.7; skew-x: -5.4; skew-y: -5.4; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: -5.8; y: 46.6; skew-x: -2.7; skew-y: -2.7; }
        frame 169 { x: -1.4; y: 44.5; skew-x: 0; skew-y: 0; scale-x: 0.995; scale-y: 0.995; }
        frame 170 { x: 2.9; y: 42.5; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 7.3; y: 44.4; skew-x: 5; skew-y: 5; }
        frame 172 { x: 12.1; y: 46; skew-x: 7.8; skew-y: 7.8; scale-x: 0.996; scale-y: 0.996; }
        frame 173 { x: 16.7; y: 47.9; skew-x: 10.5; skew-y: 10.5; scale-x: 0.997; scale-y: 0.997; }
        frame 174 { x: 21; y: 45.3; skew-x: 13.6; skew-y: 13.6; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 25.5; y: 42.5; skew-x: 16.8; skew-y: 16.8; }
        frame 176 { x: 30; y: 40; skew-x: 20; skew-y: 20; scale-x: 0.999; scale-y: 0.999; }
        frame 177 { x: 26.2; y: 39.1; skew-x: 18; skew-y: 18; scale-x: 0.998; scale-y: 0.998; }
        frame 178 { x: 22.4; y: 38.2; skew-x: 16.2; skew-y: 16.2; scale-x: -10000; scale-y: -10000; }
        frame 179 { x: 14.5; y: 41.5; skew-x: 9.8; skew-y: 9.8; scale-x: 0.997; scale-y: 0.997; }
        frame 180 { x: 7.2; y: 44.9; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 181 { x: 0.2; y: 48.6; skew-x: -2.6; skew-y: -2.6; }
        frame 182 { x: -6; y: 52.9; skew-x: -8.4; skew-y: -8.4; scale-x: 0.996; scale-y: 0.996; }
        frame 183 { x: -11.9; y: 57.4; skew-x: -14.4; skew-y: -14.4; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: -17.3; y: 61.9; skew-x: -20.3; skew-y: -20.3; }
        frame 185 { x: -27.8; y: 72.5; skew-x: -27.7; skew-y: -31; scale-x: 0.997; scale-y: 0.994; }
        frame 186 { x: -37.5; y: 83.3; skew-x: -35.1; skew-y: -41.7; scale-x: 1.001; scale-y: 0.995; }
        frame 187 { x: -42.2; y: 109; skew-x: -53.8; skew-y: -57; scale-x: 0.996; scale-y: 0.992; }
        frame 188 { x: -43.7; y: 131.5; skew-x: -72.3; skew-y: -72.3; scale-x: 0.993; scale-y: 0.993; }
        frame 189 { x: -43.6; y: -10000; skew-x: -72.4; skew-y: -72.4; scale-x: 0.992; scale-y: 0.992; }
        frame 190 { x: -43.7; skew-x: -72.3; skew-y: -72.3; scale-x: 0.993; scale-y: 0.993; }
        frame 191 { x: -44; y: 132; skew-x: -71.8; skew-y: -72.9; scale-x: 0.973; scale-y: 1.002; }
        frame 192 { x: -44.5; y: 132.5; skew-x: -71; skew-y: -73.4; scale-x: 0.956; scale-y: 1.013; }
        frame 193 { x: -44; y: 132; skew-x: -71.8; skew-y: -72.9; scale-x: 0.973; scale-y: 1.002; }
        frame 194 { x: -43.6; y: 131.5; skew-x: -72.4; skew-y: -72.4; scale-x: 0.992; scale-y: 0.992; }
        frame 195 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 196 { x: -43.7; skew-x: -72.3; skew-y: -72.3; scale-x: 0.993; scale-y: 0.993; }
    }
    Track {
        source-name: "Zombie_gargantuar_outerleg_foot";
        frame-count: 197;
        frame 0 { x: 34.1; y: 113.7; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_FOOT; }
        frame 1 { x: 34; y: 113.8; skew-x: -0.2; skew-y: -0.2; image: none; }
        frame 2 { x: 33.9; y: -10000; skew-x: -0.7; skew-y: -0.7; }
        frame 3 { x: -10000; skew-x: -1; skew-y: -1; }
        frame 4 { x: 33.8; y: 114; skew-x: -1.4; skew-y: -1.4; }
        frame 5 { x: 33.6; y: 114.2; skew-x: -1.9; skew-y: -1.9; }
        frame 6 { x: 33.5; y: 114.3; skew-x: -2.2; skew-y: -2.2; }
        frame 7 { x: -10000; y: -10000; skew-x: -2.7; skew-y: -2.7; }
        frame 8 { x: 33.3; y: 114.6; skew-x: -3.2; skew-y: -3.2; }
        frame 9 { x: 33.2; y: -10000; skew-x: -3.4; skew-y: -3.4; }
        frame 10 { x: 33.1; y: 114.8; skew-x: -4; skew-y: -4; }
        frame 11 { x: 33.3; y: 114.6; skew-x: -3.5; skew-y: -3.5; }
        frame 12 { x: 33.4; y: 114.5; skew-x: -3.2; skew-y: -3.2; }
        frame 13 { x: 33.5; y: 114.4; skew-x: -2.7; skew-y: -2.7; }
        frame 14 { x: -10000; y: 114.3; skew-x: -2.4; skew-y: -2.4; }
        frame 15 { x: 33.6; y: 114.2; skew-x: -2; skew-y: -2; }
        frame 16 { x: 33.7; y: 114.1; skew-x: -1.7; skew-y: -1.7; }
        frame 17 { x: 33.8; y: 114; skew-x: -1.2; skew-y: -1.2; }
        frame 18 { x: 33.9; y: 113.8; skew-x: -0.9; skew-y: -0.9; }
        frame 19 { x: 34; y: -10000; skew-x: -0.5; skew-y: -0.5; }
        frame 20 { x: 34.1; y: 113.7; skew-x: -0.2; skew-y: -0.2; }
        frame 21 { x: -10000; y: -10000; skew-x: 0; skew-y: 0; }
        frame 22 { x: 25.5; y: 116.8; skew-x: -7.4; skew-y: -7.4; scale-x: 0.999; scale-y: 0.999; }
        frame 23 { x: 23.1; y: 114.4; skew-x: -5.2; skew-y: -5.2; scale-x: 0.998; scale-y: 0.998; }
        frame 24 { x: 20.9; y: 112.2; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 18.5; y: 110.1; skew-x: -1.2; skew-y: -1.2; }
        frame 26 { x: 16.3; y: 108; skew-x: 0.5; skew-y: 0.5; scale-x: 0.997; scale-y: 0.997; }
        frame 27 { x: 14.1; y: 105.8; skew-x: 2.6; skew-y: 2.6; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 12.6; y: 103.5; skew-x: 5.8; skew-y: 5.8; scale-x: 0.996; scale-y: 0.996; }
        frame 29 { x: 11.2; y: 100.9; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 9.8; y: 98.5; skew-x: 12.6; skew-y: 12.6; scale-x: 0.995; scale-y: 0.995; }
        frame 31 { x: 8.7; y: 96.2; skew-x: 16; skew-y: 16; scale-x: 0.994; scale-y: 0.994; }
        frame 32 { x: 7.6; y: 93.8; skew-x: 19.5; skew-y: 19.5; scale-x: 0.995; scale-y: 0.995; }
        frame 33 { x: 8; y: 98.2; skew-x: 15.5; skew-y: 15.5; scale-x: 0.994; scale-y: 0.994; }
        frame 34 { x: 8.6; y: 102.6; skew-x: 11.6; skew-y: 11.6; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 9.4; y: 107; skew-x: 7.8; skew-y: 7.8; }
        frame 36 { x: 10.2; y: 111.5; skew-x: 3.9; skew-y: 3.9; }
        frame 37 { x: 10.6; y: 111.6; skew-x: 3.8; skew-y: 3.8; }
        frame 38 { x: 11; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 39 { x: 11.4; }
        frame 40 { x: 11.9; }
        frame 41 { x: 12.3; y: 111.5; skew-x: 3.9; skew-y: 3.9; }
        frame 42 { x: 14; y: 111.7; skew-x: 3.8; skew-y: 3.8; }
        frame 43 { x: 15.6; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 17.3; y: 111.8; }
        frame 45 { x: 19; y: -10000; }
        frame 46 { x: 20.7; y: 111.9; skew-x: 3.9; skew-y: 3.9; }
        frame 47 { x: 22.8; y: 112.2; skew-x: 3.3; skew-y: 3.3; }
        frame 48 { x: 24.9; y: 112.3; skew-x: 3; skew-y: 3; }
        frame 49 { x: 27; y: 112.4; skew-x: 2.5; skew-y: 2.5; }
        frame 50 { x: 29.1; y: 112.6; skew-x: 2.1; skew-y: 2.1; }
        frame 51 { x: 31.3; y: -10000; skew-x: 1.8; skew-y: 1.8; }
        frame 52 { x: 35.9; y: 113.6; skew-x: -0.5; skew-y: -0.5; }
        frame 53 { x: 40.3; y: 114.8; skew-x: -3.2; skew-y: -3.2; }
        frame 54 { x: 45; y: 115.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.993; scale-y: 0.993; }
        frame 55 { x: 49.7; y: 117; skew-x: -8.2; skew-y: -8.2; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 54.5; y: 118.1; skew-x: -10.9; skew-y: -10.9; }
        frame 57 { x: 56.5; y: 120.6; skew-x: -18.2; skew-y: -18.2; scale-x: 0.992; scale-y: 0.992; }
        frame 58 { x: 59; y: 123.3; skew-x: -25.7; skew-y: -25.7; scale-x: 0.991; scale-y: 0.991; }
        frame 59 { x: 62.1; y: 125.9; skew-x: -33.2; skew-y: -33.2; scale-x: 0.99; scale-y: 0.99; }
        frame 60 { x: 65.7; y: 128.6; skew-x: -40.7; skew-y: -40.7; scale-x: 0.991; scale-y: 0.991; }
        frame 61 { x: 60.5; y: 127.2; skew-x: -36.7; skew-y: -36.7; scale-x: 0.99; scale-y: 0.99; }
        frame 62 { x: 55.1; y: 125.7; skew-x: -32.7; skew-y: -32.7; scale-x: 0.991; scale-y: 0.991; }
        frame 63 { x: 50; y: 124.3; skew-x: -28.7; skew-y: -28.7; scale-x: 0.992; scale-y: 0.992; }
        frame 64 { x: 45.1; y: 122.8; skew-x: -24.7; skew-y: -24.7; scale-x: 0.993; scale-y: 0.993; }
        frame 65 { x: 40.3; y: 121.3; skew-x: -20.7; skew-y: -20.7; scale-x: 0.995; scale-y: 0.995; }
        frame 66 { x: 37.3; y: 120.3; skew-x: -18; skew-y: -18; scale-x: 0.994; scale-y: 0.994; }
        frame 67 { x: 34.3; y: 119.3; skew-x: -15.2; skew-y: -15.2; scale-x: 0.995; scale-y: 0.995; }
        frame 68 { x: 31.3; y: 118.5; skew-x: -12.7; skew-y: -12.7; scale-x: 0.996; scale-y: 0.996; }
        frame 69 { x: 28.5; y: 117.5; skew-x: -10; skew-y: -10; scale-x: 0.997; scale-y: 0.997; }
        frame 70 { x: 25.5; y: 116.8; skew-x: -7.4; skew-y: -7.4; scale-x: 0.999; scale-y: 0.999; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { y: 116.7; scale-x: 0.998; scale-y: 0.998; }
        frame 73 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { y: 116.8; scale-x: 0.999; scale-y: 0.999; }
        frame 80 { x: 25.4; y: 117; skew-x: -8.4; skew-y: -8.4; scale-x: 0.998; scale-y: 0.998; }
        frame 81 { x: 25.3; y: 117.3; skew-x: -9.4; skew-y: -9.4; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 25.2; y: 117.6; skew-x: -10.4; skew-y: -10.4; }
        frame 83 { x: 25; y: 117.8; skew-x: -11.5; skew-y: -11.5; }
        frame 84 { x: 24.9; y: 118.3; skew-x: -12.7; skew-y: -12.7; }
        frame 85 { x: -10000; y: 118.5; skew-x: -13.7; skew-y: -13.7; }
        frame 86 { x: 24.8; y: 118.9; skew-x: -15.2; skew-y: -15.2; scale-x: 0.997; scale-y: 0.997; }
        frame 87 { x: 24.6; y: 119.3; skew-x: -16.7; skew-y: -16.7; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 24.5; y: 119.8; skew-x: -18.4; skew-y: -18.4; }
        frame 89 { x: 24.3; y: 120.3; skew-x: -20.1; skew-y: -20.1; scale-x: 0.998; scale-y: 0.998; }
        frame 90 { x: 24.6; y: 120.5; skew-x: -17.7; skew-y: -17.7; scale-x: 0.996; scale-y: 0.996; }
        frame 91 { x: 24.7; y: 120.8; skew-x: -15.4; skew-y: -15.4; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 24.8; y: 117.3; skew-x: -7.2; skew-y: -7.2; }
        frame 93 { x: 24.4; y: 117.7; skew-x: -9.2; skew-y: -9.2; scale-x: 0.995; scale-y: 0.995; }
        frame 94 { x: 24.1; y: 118.2; skew-x: -11.2; skew-y: -11.2; scale-x: 0.996; scale-y: 0.996; }
        frame 95 { x: 24.5; y: 117.8; skew-x: -9.2; skew-y: -9.2; scale-x: 0.995; scale-y: 0.995; }
        frame 96 { x: 24.8; y: 117.3; skew-x: -7.2; skew-y: -7.2; scale-x: 0.996; scale-y: 0.996; }
        frame 97 { x: 24.9; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 25; y: 117.1; }
        frame 99 { x: -10000; y: 117; scale-x: 0.997; scale-y: 0.997; }
        frame 100 { x: 25.3; y: 116.9; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: -10000; y: 116.8; scale-x: 0.998; scale-y: 0.998; }
        frame 102 { x: 25.4; y: 116.7; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 25.5; y: 116.8; skew-x: -7.4; skew-y: -7.4; scale-x: 0.999; scale-y: 0.999; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 25.1; y: 115.3; skew-x: -5.9; skew-y: -5.9; scale-x: 0.998; scale-y: 0.998; }
        frame 106 { x: 24.7; y: 113.8; skew-x: -4.4; skew-y: -4.4; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 24.3; y: 112.3; skew-x: -3; skew-y: -3; }
        frame 108 { x: 23.9; y: 111; skew-x: -1.7; skew-y: -1.7; }
        frame 109 { x: 23.5; y: 109.5; skew-x: -0.2; skew-y: -0.2; }
        frame 110 { x: 23.2; y: 108.2; skew-x: 1; skew-y: 1; }
        frame 111 { x: 22.9; y: 106.8; skew-x: 2.5; skew-y: 2.5; }
        frame 112 { x: 22.6; y: 105.3; skew-x: 4; skew-y: 4; }
        frame 113 { x: 22.2; y: 106.3; skew-x: 1.3; skew-y: 1.3; }
        frame 114 { x: 22.1; y: 107.1; skew-x: -0.9; skew-y: -0.9; }
        frame 115 { x: 22; y: 108.1; skew-x: -3.4; skew-y: -3.4; scale-x: 0.997; scale-y: 0.997; }
        frame 116 { x: 21.9; y: 109.1; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 21.8; y: 110.1; skew-x: -8.5; skew-y: -8.5; }
        frame 118 { x: 22.2; y: 110.5; skew-x: -10.9; skew-y: -10.9; }
        frame 119 { x: 22.7; y: 111.1; skew-x: -13.4; skew-y: -13.4; scale-x: 0.996; scale-y: 0.996; }
        frame 120 { x: 23.2; y: 111.6; skew-x: -15.9; skew-y: -15.9; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 23.7; y: 112.1; skew-x: -18.5; skew-y: -18.5; scale-x: 0.997; scale-y: 0.997; }
        frame 122 { x: -10000; y: -10000; skew-x: -18.4; skew-y: -18.4; scale-x: 0.996; scale-y: 0.996; }
        frame 123 { skew-x: -18.5; skew-y: -18.5; scale-x: 0.997; scale-y: 0.997; }
        frame 124 { x: 24.3; y: 112.5; skew-x: -15.2; skew-y: -15.2; scale-x: 0.996; scale-y: 0.996; }
        frame 125 { x: 25.1; y: 112.8; skew-x: -11.7; skew-y: -11.7; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 26; y: 113.3; skew-x: -8.4; skew-y: -8.4; }
        frame 127 { x: 27; y: 113.6; skew-x: -4.9; skew-y: -4.9; }
        frame 128 { x: 28; y: 114.2; skew-x: -1.7; skew-y: -1.7; }
        frame 129 { x: 26.8; y: 115.3; skew-x: -4.4; skew-y: -4.4; scale-x: 0.997; scale-y: 0.997; }
        frame 130 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 154 { y: 116.1; skew-x: -6.7; skew-y: -6.7; }
        frame 155 { x: 26.9; y: 116.9; skew-x: -9; skew-y: -9; scale-x: 0.996; scale-y: 0.996; }
        frame 156 { x: 27; y: 117.8; skew-x: -11.5; skew-y: -11.5; scale-x: 0.997; scale-y: 0.997; }
        frame 157 { x: 25.9; y: 119.2; skew-x: -15.9; skew-y: -15.9; scale-x: 0.996; scale-y: 0.996; }
        frame 158 { x: 25.1; y: 120.6; skew-x: -20.4; skew-y: -20.4; scale-x: 0.995; scale-y: 0.995; }
        frame 159 { x: 24.3; y: 122.1; skew-x: -25; skew-y: -25; scale-x: 0.996; scale-y: 0.996; }
        frame 160 { x: 24.5; y: 121.1; skew-x: -21.7; skew-y: -21.7; scale-x: 0.995; scale-y: 0.995; }
        frame 161 { x: 24.7; y: 120.1; skew-x: -18.2; skew-y: -18.2; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 25; y: 119.2; skew-x: -15; skew-y: -15; scale-x: 0.996; scale-y: 0.996; }
        frame 163 { x: 25.3; y: 118.3; skew-x: -12.7; skew-y: -12.7; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 25.6; y: 117.5; skew-x: -10.7; skew-y: -10.7; }
        frame 165 { x: 26; y: 116.8; skew-x: -8.7; skew-y: -8.7; }
        frame 166 { x: 26.3; y: 116; skew-x: -6.4; skew-y: -6.4; scale-x: 0.997; scale-y: 0.997; }
        frame 167 { x: 26.8; y: 115.3; skew-x: -4.4; skew-y: -4.4; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 182 { x: 35.2; y: 120.7; skew-x: -25.9; skew-y: -25.9; scale-x: 0.995; scale-y: 0.995; }
        frame 183 { x: 48.5; y: 126; skew-x: -47.5; skew-y: -47.5; scale-x: 0.993; scale-y: 0.993; }
        frame 184 { x: 66.3; y: 129.4; skew-x: -68.9; skew-y: -68.9; scale-x: 0.994; scale-y: 0.994; }
        frame 185 { x: 67.9; y: 121.8; skew-x: -79.4; skew-y: -79.4; scale-x: 0.992; scale-y: 0.992; }
        frame 186 { x: 70.2; y: 113.1; skew-x: -89.7; skew-y: -89.7; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 74.8; y: 104.3; skew-x: -120; skew-y: -120; scale-x: 0.989; scale-y: 0.989; }
        frame 188 { x: 78.7; y: 85.9; skew-x: -150.5; skew-y: -150.5; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 70.3; y: 120.6; skew-x: -130.7; skew-y: -130.7; scale-x: 0.986; scale-y: 0.986; }
        frame 190 { x: 60.8; y: 151.3; skew-x: -110.9; skew-y: -110.9; scale-x: -10000; scale-y: -10000; }
        frame 191 { x: 61.8; y: -10000; skew-x: -111.5; skew-y: -110.2; scale-x: 0.967; scale-y: 0.994; }
        frame 192 { x: 62.8; skew-x: -112.3; skew-y: -109.5; scale-x: 0.951; scale-y: 1.003; }
        frame 193 { x: 66.5; y: 136.5; skew-x: -121.5; skew-y: -120; scale-x: 0.967; scale-y: 0.993; }
        frame 194 { x: 70.3; y: 120.6; skew-x: -130.7; skew-y: -130.7; scale-x: 0.986; scale-y: 0.986; }
        frame 195 { x: 65.6; y: 136.4; skew-x: -120.7; skew-y: -120.7; scale-x: 0.984; scale-y: 0.984; }
        frame 196 { x: 60.8; y: 151.3; skew-x: -110.9; skew-y: -110.9; scale-x: 0.986; scale-y: 0.986; }
    }
    Track {
        source-name: "Zombie_gargantuar_outerleg_lower";
        frame-count: 197;
        frame 0 { x: 48.1; y: 85.8; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_OUTERLEG_LOWER; }
        frame 1 { x: 47.4; y: 86; skew-x: -0.9; skew-y: -0.9; image: none; }
        frame 2 { x: 46.6; y: 86.2; skew-x: -1.9; skew-y: -1.9; }
        frame 3 { x: 45.9; y: 86.3; skew-x: -2.9; skew-y: -2.9; }
        frame 4 { x: 45.1; y: 86.7; skew-x: -4; skew-y: -4; }
        frame 5 { x: 44.3; y: 87; skew-x: -5.2; skew-y: -5.2; scale-x: 0.999; scale-y: 0.999; }
        frame 6 { x: 43.7; y: 87.2; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 42.9; y: 87.5; skew-x: -7.2; skew-y: -7.2; }
        frame 8 { x: 42.3; y: 87.7; skew-x: -8.2; skew-y: -8.2; }
        frame 9 { x: 41.5; y: 88; skew-x: -9.4; skew-y: -9.4; }
        frame 10 { x: 40.8; y: 88.3; skew-x: -10.5; skew-y: -10.5; }
        frame 11 { x: 41.5; y: 88; skew-x: -9.4; skew-y: -9.4; }
        frame 12 { x: 42.1; y: 87.7; skew-x: -8.4; skew-y: -8.4; }
        frame 13 { x: 42.8; y: 87.5; skew-x: -7.5; skew-y: -7.5; }
        frame 14 { x: 43.4; y: 87.2; skew-x: -6.5; skew-y: -6.5; }
        frame 15 { x: 44.1; y: 87.1; skew-x: -5.7; skew-y: -5.7; }
        frame 16 { x: 44.7; y: 86.8; skew-x: -4.7; skew-y: -4.7; }
        frame 17 { x: 45.4; y: 86.6; skew-x: -3.7; skew-y: -3.7; scale-x: 1; scale-y: 1; }
        frame 18 { x: 46; y: 86.3; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 46.8; y: 86.1; skew-x: -1.7; skew-y: -1.7; }
        frame 20 { x: 47.5; y: 85.9; skew-x: -0.7; skew-y: -0.7; }
        frame 21 { x: 48.1; y: 85.8; skew-x: 0; skew-y: 0; }
        frame 22 { x: 44.6; y: 83; skew-x: 1.8; skew-y: 1.8; scale-x: 0.999; scale-y: 0.999; }
        frame 23 { x: 42.5; y: 82.1; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 40.3; y: 81.4; skew-x: 2.8; skew-y: 2.8; }
        frame 25 { x: 38.1; y: 80.5; skew-x: 3.3; skew-y: 3.3; scale-x: 0.998; scale-y: 0.998; }
        frame 26 { x: 35.9; y: 79.8; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 33.7; y: 79; skew-x: 4.4; skew-y: 4.4; }
        frame 28 { x: 33; y: 77.3; skew-x: 8; skew-y: 7.5; scale-x: 0.997; scale-y: 0.997; }
        frame 29 { x: 32.5; y: 75.5; skew-x: 11.8; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 32; y: 74.1; skew-x: 15.3; skew-y: 13.8; scale-y: 0.996; }
        frame 31 { x: 31.7; y: 72.7; skew-x: 19.1; skew-y: 16.8; scale-x: 0.996; scale-y: -10000; }
        frame 32 { x: 31.5; y: 71.2; skew-x: 22.8; skew-y: 20.1; scale-x: 0.997; }
        frame 33 { x: 27; y: 74.7; skew-x: 15.6; skew-y: 12.8; scale-x: 0.996; scale-y: 0.995; }
        frame 34 { x: 23; y: 78.6; skew-x: 8.3; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 19.4; y: 82.8; skew-x: 1.3; skew-y: -1.2; }
        frame 36 { x: 16.3; y: 87.3; skew-x: -5.8; skew-y: -8.5; }
        frame 37 { x: 18.1; y: -10000; skew-x: -5.7; skew-y: -8.4; scale-x: 0.995; scale-y: 0.994; }
        frame 38 { x: 19.8; y: 87.2; skew-x: -5.5; skew-y: -8.2; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 21.6; y: 87.1; skew-x: -5.4; skew-y: -10000; }
        frame 40 { x: 23.3; y: -10000; skew-x: -10000; }
        frame 41 { x: 25; }
        frame 42 { x: 26.2; y: 87.6; skew-x: -5.7; skew-y: -9.2; scale-x: 0.996; }
        frame 43 { x: 27.5; y: 88.3; skew-x: -6.2; skew-y: -10.4; scale-x: 0.997; scale-y: 0.993; }
        frame 44 { x: 28.6; y: 89; skew-x: -6.7; skew-y: -11.7; scale-x: 0.998; scale-y: -10000; }
        frame 45 { x: 29.9; y: 89.4; skew-x: -7; skew-y: -12.7; scale-x: 0.999; }
        frame 46 { x: 31.2; y: 90.2; skew-x: -7.5; skew-y: -14; scale-x: 1; scale-y: 0.994; }
        frame 47 { x: 32; y: 89.8; skew-x: -8; skew-y: -15.2; scale-x: 1.001; scale-y: 1.012; }
        frame 48 { x: 32.9; y: 89.6; skew-x: -8.7; skew-y: -16.4; scale-x: 1.003; scale-y: 1.031; }
        frame 49 { x: 33.8; y: 89.2; skew-x: -9.2; skew-y: -17.5; scale-x: 1.004; scale-y: 1.05; }
        frame 50 { x: 34.6; y: 88.9; skew-x: -9.9; skew-y: -18.7; scale-x: 1.005; scale-y: 1.069; }
        frame 51 { x: 35.3; y: 88.6; skew-x: -10.7; skew-y: -20.1; scale-x: 1.007; scale-y: 1.089; }
        frame 52 { x: 38.6; y: 90.5; skew-x: -13.2; skew-y: -22; scale-x: 1.005; scale-y: 1.069; }
        frame 53 { x: 42; y: 92.3; skew-x: -15.7; skew-y: -24; scale-x: 1.003; scale-y: 1.049; }
        frame 54 { x: 45.4; y: 94; skew-x: -18.2; skew-y: -26; scale-x: 1.001; scale-y: 1.03; }
        frame 55 { x: 49; y: 95.8; skew-x: -20.7; skew-y: -28; scale-x: 1; scale-y: 1.011; }
        frame 56 { x: 52.6; y: 97.6; skew-x: -23.4; skew-y: -29.9; scale-x: 0.999; scale-y: 0.993; }
        frame 57 { x: 53; y: 98.7; skew-x: -27.7; skew-y: -34.2; scale-x: 0.998; scale-y: 0.991; }
        frame 58 { x: 53.4; y: 99.8; skew-x: -32; skew-y: -38.5; scale-x: 0.997; scale-y: 0.99; }
        frame 59 { x: 54; y: 100.8; skew-x: -36.5; skew-y: -43; scale-x: 0.996; scale-y: -10000; }
        frame 60 { x: 54.6; y: 102.1; skew-x: -40.8; skew-y: -47.3; scale-x: 0.997; scale-y: 0.991; }
        frame 61 { x: 52.4; y: 99.6; skew-x: -35.7; skew-y: -41.5; scale-x: 0.996; scale-y: 0.99; }
        frame 62 { x: 50.4; y: 97; skew-x: -30.5; skew-y: -35.5; scale-x: -10000; scale-y: 0.991; }
        frame 63 { x: 48.8; y: 94.6; skew-x: -25.4; skew-y: -29.5; scale-y: 0.992; }
        frame 64 { x: 47.5; y: 92.1; skew-x: -20.2; skew-y: -23.5; scale-x: 0.997; scale-y: 0.993; }
        frame 65 { x: 46.3; y: 89.8; skew-x: -15.2; skew-y: -17.7; scale-x: 0.998; scale-y: 0.995; }
        frame 66 { x: 45.8; y: 88.3; skew-x: -11.7; skew-y: -13.7; scale-x: 0.997; scale-y: -10000; }
        frame 67 { x: 45.4; y: 86.9; skew-x: -8.2; skew-y: -9.7; scale-x: 0.998; scale-y: 0.996; }
        frame 68 { x: 45; y: 85.7; skew-x: -4.9; skew-y: -5.9; scale-x: -10000; scale-y: 0.997; }
        frame 69 { x: 44.8; y: 84.3; skew-x: -1.4; skew-y: -1.9; scale-x: 0.999; scale-y: 0.998; }
        frame 70 { x: 44.6; y: 83; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: 0.999; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 72 { x: 43.8; y: 81.8; skew-x: 0.5; skew-y: 0.5; scale-y: 1.043; }
        frame 73 { x: 43; y: 80.6; skew-x: -0.5; skew-y: -0.5; scale-y: 1.087; }
        frame 74 { x: 42; y: 79.3; skew-x: -1.7; skew-y: -1.7; scale-x: 0.998; scale-y: 1.132; }
        frame 75 { x: 41.1; y: 78.2; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: 1.176; }
        frame 76 { x: 40; y: 77.1; skew-x: -4.2; skew-y: -4.4; scale-y: 1.22; }
        frame 77 { x: 39.1; y: 76.1; skew-x: -5.6; skew-y: -5.7; scale-x: 0.997; scale-y: 1.264; }
        frame 78 { x: 38.1; y: 75.1; skew-x: -6.9; skew-y: -6.9; scale-x: -10000; scale-y: 1.308; }
        frame 79 { x: 37; y: 74; skew-x: -8.2; skew-y: -8.2; scale-y: 1.352; }
        frame 80 { x: 35.6; y: 74.4; skew-x: -9.9; skew-y: -9.9; scale-y: -10000; }
        frame 81 { x: 34.4; y: 75.1; skew-x: -11.9; skew-y: -11.9; scale-x: 0.996; scale-y: 1.351; }
        frame 82 { x: 33.1; y: 75.6; skew-x: -13.7; skew-y: -13.7; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 31.8; y: 76.1; skew-x: -15.7; skew-y: -15.7; }
        frame 84 { x: 30.7; y: 76.6; skew-x: -17.5; skew-y: -17.5; scale-y: 1.35; }
        frame 85 { x: 29.5; y: 77.3; skew-x: -19.4; skew-y: -19.4; scale-x: 0.997; scale-y: 1.352; }
        frame 86 { x: 31.5; y: 75; skew-x: -16.9; skew-y: -15.5; scale-x: -10000; scale-y: 1.382; }
        frame 87 { x: 33.5; y: 72.8; skew-x: -14.4; skew-y: -11.7; scale-x: 0.998; scale-y: 1.413; }
        frame 88 { x: 35.6; y: 70.8; skew-x: -11.9; skew-y: -7.7; scale-x: 0.999; scale-y: 1.445; }
        frame 89 { x: 37.8; y: 68.8; skew-x: -9.5; skew-y: -4.1; scale-x: 1; scale-y: 1.477; }
        frame 90 { x: 27.6; y: 77.8; skew-x: -19; skew-y: -16.2; scale-x: 0.996; scale-y: 1.412; }
        frame 91 { x: 18.7; y: 87.8; skew-x: -28.7; skew-y: -28.7; scale-x: 0.994; scale-y: 1.348; }
        frame 92 { x: 16.6; y: 82.2; skew-x: -11.9; skew-y: -25.5; scale-x: 1.023; scale-y: 1.349; }
        frame 93 { x: 15.4; y: 84.8; skew-x: -14.4; skew-y: -28; scale-x: 1.022; scale-y: 1.347; }
        frame 94 { x: 14.1; y: 87.5; skew-x: -17.2; skew-y: -30.7; scale-x: 1.023; scale-y: 1.349; }
        frame 95 { x: 15.3; y: 84.7; skew-x: -14.4; skew-y: -28; scale-x: 1.022; scale-y: 1.347; }
        frame 96 { x: 16.6; y: 82.2; skew-x: -11.9; skew-y: -25.5; scale-x: 1.023; scale-y: 1.349; }
        frame 97 { x: 20.8; y: 81.9; skew-x: -9.9; skew-y: -21.5; scale-x: 1.019; scale-y: 1.298; }
        frame 98 { x: 25.1; y: 81.8; skew-x: -7.9; skew-y: -17.7; scale-x: 1.016; scale-y: 1.248; }
        frame 99 { x: 29.1; y: -10000; skew-x: -5.9; skew-y: -13.7; scale-x: 1.013; scale-y: 1.198; }
        frame 100 { x: 33.1; skew-x: -3.9; skew-y: -9.7; scale-x: 1.009; scale-y: 1.149; }
        frame 101 { x: 37; y: 82.2; skew-x: -1.9; skew-y: -5.9; scale-x: 1.006; scale-y: 1.099; }
        frame 102 { x: 41; y: 82.5; skew-x: -0; skew-y: -1.9; scale-x: 1.003; scale-y: 1.049; }
        frame 103 { x: 44.6; y: 83; skew-x: 1.8; skew-y: 1.8; scale-x: 0.999; scale-y: 0.999; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 44.1; y: 80.8; skew-x: 2; skew-y: 2; scale-y: 1.043; }
        frame 106 { x: 43.5; y: 78.5; skew-x: 2.5; skew-y: 2.5; scale-x: 0.998; scale-y: 1.087; }
        frame 107 { x: 43; y: 76.3; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: 1.131; }
        frame 108 { x: 42.4; y: 74; skew-x: 3.3; skew-y: 3.3; scale-y: 1.175; }
        frame 109 { x: 41.9; y: 71.8; skew-x: 3.8; skew-y: 3.8; scale-x: 0.997; scale-y: 1.219; }
        frame 110 { x: 41.3; y: 69.6; skew-x: 4.1; skew-y: 4.1; scale-x: -10000; scale-y: 1.263; }
        frame 111 { x: 40.8; y: 67.3; skew-x: 4.5; skew-y: 4.5; scale-y: 1.307; }
        frame 112 { x: 40.4; y: 65.1; skew-x: 5.1; skew-y: 5.1; scale-x: 0.996; scale-y: 1.351; }
        frame 113 { x: 39.9; y: 64.8; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 114 { x: 39.5; y: 64.6; skew-x: 1.6; skew-y: 1.6; }
        frame 115 { x: 39.3; y: 64.3; skew-x: 0; skew-y: 0; }
        frame 116 { x: 39; y: 64; skew-x: -1.4; skew-y: -1.4; }
        frame 117 { x: 38.5; y: 63.8; skew-x: -3.1; skew-y: -3.1; }
        frame 118 { x: 37.4; y: 64.3; skew-x: -5.4; skew-y: -5.4; scale-y: 1.35; }
        frame 119 { x: 36.1; y: 64.8; skew-x: -7.7; skew-y: -7.7; scale-x: 0.995; scale-y: -10000; }
        frame 120 { x: 35; y: 65.3; skew-x: -10; skew-y: -10; scale-x: -10000; scale-y: 1.349; }
        frame 121 { x: 33.9; y: 66; skew-x: -12.5; skew-y: -12.5; scale-y: 1.35; }
        frame 122 { x: -10000; y: -10000; skew-x: -12.4; skew-y: -12.4; scale-y: 1.349; }
        frame 123 { skew-x: -12.5; skew-y: -12.5; scale-y: 1.35; }
        frame 124 { x: 35.1; y: 67.9; skew-x: -10.9; skew-y: -10.9; scale-y: 1.349; }
        frame 125 { x: 36.5; y: 69.8; skew-x: -9.4; skew-y: -9.4; scale-y: -10000; }
        frame 126 { x: 37.8; y: 71.8; skew-x: -7.9; skew-y: -7.9; }
        frame 127 { x: 39.3; y: 73.8; skew-x: -6.4; skew-y: -6.4; }
        frame 128 { x: 40.6; y: 75.9; skew-x: -5; skew-y: -5; }
        frame 129 { x: 44.3; y: 74.7; skew-x: 0; skew-y: 0; }
        frame 130 { x: 48; y: 73.7; skew-x: 4.7; skew-y: 4.7; }
        frame 131 { x: 44.8; y: 74.6; skew-x: 0.8; skew-y: 0.8; scale-x: 0.994; scale-y: 1.348; }
        frame 132 { x: 41.9; y: 75.6; skew-x: -2.7; skew-y: -2.7; scale-x: 0.993; scale-y: 1.347; }
        frame 133 { x: 38.9; y: 76.8; skew-x: -6.5; skew-y: -6.5; scale-x: 0.992; scale-y: 1.346; }
        frame 134 { x: 40.5; y: 78.4; skew-x: -4.4; skew-y: -4.4; scale-x: 0.994; scale-y: 1.259; }
        frame 135 { x: 42; y: 79.8; skew-x: -2.2; skew-y: -2.2; scale-x: 0.996; scale-y: 1.172; }
        frame 136 { x: 43.3; y: 81.5; skew-x: -0.2; skew-y: -0.2; scale-x: 0.998; scale-y: 1.086; }
        frame 137 { x: 44.6; y: 83; skew-x: 1.8; skew-y: 1.8; scale-x: 0.999; scale-y: 0.999; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 42.9; y: 84.4; skew-x: -1.2; skew-y: -1.2; }
        frame 140 { x: 41.1; y: 86.1; skew-x: -4.7; skew-y: -4.7; }
        frame 141 { x: 39.4; y: 87.9; skew-x: -7.9; skew-y: -7.9; }
        frame 142 { x: 37.9; y: 88.2; skew-x: -8.7; skew-y: -10.5; scale-x: 1; scale-y: 0.998; }
        frame 143 { x: 36.4; y: 88.5; skew-x: -9.5; skew-y: -13.2; scale-x: 1.001; scale-y: -10000; }
        frame 144 { x: 34.8; y: 88.9; skew-x: -10.5; skew-y: -15.9; scale-x: 1.003; }
        frame 145 { x: 36; y: 86.5; skew-x: -6.4; skew-y: -11.9; scale-x: 1.002; scale-y: 0.997; }
        frame 146 { x: 37.5; y: 84.4; skew-x: -2.5; skew-y: -7.9; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 39; y: 82.5; skew-x: 1.2; skew-y: -4.1; scale-y: 0.998; }
        frame 148 { x: -10000; y: 82.6; skew-x: 1; skew-y: -4; scale-y: 0.997; }
        frame 149 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 150 { y: 82.5; skew-x: 1.2; skew-y: -4.1; scale-y: 0.998; }
        frame 151 { x: 37.5; y: 86.2; skew-x: -6; skew-y: -8.2; scale-x: 1.001; scale-y: 1.019; }
        frame 152 { x: 36.4; y: 90.1; skew-x: -13.4; skew-y: -12.4; scale-x: 1; scale-y: 1.041; }
        frame 153 { x: 35.6; y: 93.8; skew-x: -21; skew-y: -16.7; scale-x: -10000; scale-y: 1.065; }
        frame 154 { x: 32.5; y: 94.1; skew-x: -22.2; skew-y: -22.7; scale-x: 1.003; scale-y: 1.063; }
        frame 155 { x: 29.4; y: 94.6; skew-x: -23.5; skew-y: -29; scale-x: 1.007; scale-y: 1.062; }
        frame 156 { x: 26.4; y: 95.4; skew-x: -24.8; skew-y: -35; scale-x: 1.012; scale-y: 1.063; }
        frame 157 { x: 24.1; y: 96.5; skew-x: -28.2; skew-y: -38; scale-x: 1.009; scale-y: 1.062; }
        frame 158 { x: 21.7; y: 97.5; skew-x: -31.7; skew-y: -41.3; scale-x: 1.008; scale-y: 1.061; }
        frame 159 { x: 19.4; y: 98.3; skew-x: -35.1; skew-y: -44.3; scale-x: -10000; scale-y: 1.063; }
        frame 160 { x: 19.5; y: 97.4; skew-x: -33.5; skew-y: -41.8; scale-x: 1.004; scale-y: 1.096; }
        frame 161 { x: 19.7; y: 96.2; skew-x: -31.7; skew-y: -39; scale-x: 1.002; scale-y: 1.13; }
        frame 162 { x: 20; y: 95.2; skew-x: -30.2; skew-y: -36.5; scale-x: 1.001; scale-y: 1.167; }
        frame 163 { x: 20.5; y: 93.5; skew-x: -27.8; skew-y: -34.2; scale-x: 0.999; scale-y: 1.168; }
        frame 164 { x: 21; y: 91.8; skew-x: -25.5; skew-y: -32; scale-x: -10000; scale-y: 1.171; }
        frame 165 { x: 21.6; y: 90.3; skew-x: -23.2; skew-y: -29.5; scale-y: 1.174; }
        frame 166 { x: 22.3; y: 88.7; skew-x: -20.9; skew-y: -27.2; scale-y: 1.177; }
        frame 167 { x: 23; y: 87.2; skew-x: -18.6; skew-y: -25; scale-x: 1; scale-y: 1.182; }
        frame 168 { x: 25.3; y: 85.2; skew-x: -14.7; skew-y: -21; scale-x: 0.999; scale-y: 1.153; }
        frame 169 { x: 27.6; y: 83.6; skew-x: -11; skew-y: -17.2; scale-x: -10000; scale-y: 1.125; }
        frame 170 { x: 29.9; y: 82.1; skew-x: -7.4; skew-y: -13.4; scale-y: 1.099; }
        frame 171 { x: 29.4; y: 82.2; skew-x: -8.4; skew-y: -14.4; scale-y: 1.116; }
        frame 172 { x: 29; y: 82.3; skew-x: -9.7; skew-y: -15.5; scale-y: 1.135; }
        frame 173 { x: 28.4; y: 82.5; skew-x: -10.9; skew-y: -16.6; scale-x: 1; scale-y: 1.155; }
        frame 174 { x: 31.1; y: 83.3; skew-x: -6.7; skew-y: -14.2; scale-x: -10000; scale-y: 1.084; }
        frame 175 { x: 33.8; y: 84.3; skew-x: -2.7; skew-y: -11.7; scale-x: 1.001; scale-y: 1.015; }
        frame 176 { x: 36.7; y: 85.2; skew-x: 1.2; skew-y: -9.2; scale-x: 1.002; scale-y: 0.946; }
        frame 177 { x: 37.9; y: 83.9; skew-x: 1; skew-y: -6.7; scale-x: -10000; scale-y: 0.972; }
        frame 178 { x: 39; y: 82.5; skew-x: 1.2; skew-y: -4.1; scale-y: 0.998; }
        frame 179 { x: 37.5; y: 86.2; skew-x: -6; skew-y: -8.2; scale-x: 1.001; scale-y: 1.019; }
        frame 180 { x: 36.4; y: 90.1; skew-x: -13.4; skew-y: -12.4; scale-x: 1; scale-y: 1.041; }
        frame 181 { x: 35.6; y: 93.8; skew-x: -21; skew-y: -16.7; scale-x: -10000; scale-y: 1.065; }
        frame 182 { x: 36.4; y: 95.2; skew-x: -35; skew-y: -32.5; scale-x: 0.996; scale-y: 1.062; }
        frame 183 { x: 39.4; y: 96.8; skew-x: -49; skew-y: -48.3; scale-x: 0.994; scale-y: 1.061; }
        frame 184 { x: 44.4; y: 98.3; skew-x: -63.1; skew-y: -64.1; scale-x: -10000; scale-y: 1.062; }
        frame 185 { x: 39.6; y: 97.6; skew-x: -77.6; skew-y: -78.6; scale-x: 0.993; scale-y: 1.132; }
        frame 186 { x: 36.5; y: 96.3; skew-x: -92.1; skew-y: -93.2; scale-x: 0.992; scale-y: 1.203; }
        frame 187 { x: 33.3; y: 102.2; skew-x: -112.7; skew-y: -113.7; scale-x: 0.99; scale-y: 1.2; }
        frame 188 { x: 31.6; y: 103.8; skew-x: -133.3; skew-y: -134.3; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 14.4; y: 118.8; skew-x: -108.2; skew-y: -103.7; scale-x: 0.996; scale-y: 1.261; }
        frame 190 { x: 1.5; y: 126; skew-x: -83.1; skew-y: -73.2; scale-x: 1.003; scale-y: 1.324; }
        frame 191 { x: 1.8; y: 126.7; skew-x: -82.9; skew-y: -73.8; scale-x: 0.981; scale-y: 1.337; }
        frame 192 { x: 1.9; y: 127.2; skew-x: -82.6; skew-y: -74.3; scale-x: 0.959; scale-y: 1.352; }
        frame 193 { x: 7.1; y: 124; skew-x: -95.2; skew-y: -89.1; scale-x: 0.977; scale-y: 1.307; }
        frame 194 { x: 14.4; y: 118.8; skew-x: -108.2; skew-y: -103.7; scale-x: 0.996; scale-y: 1.261; }
        frame 195 { x: 7.1; y: 123.3; skew-x: -95.5; skew-y: -88.6; scale-x: 0.999; scale-y: 1.293; }
        frame 196 { x: 1.5; y: 126; skew-x: -83.1; skew-y: -73.2; scale-x: 1.003; scale-y: 1.324; }
    }
    Track {
        source-name: "Zombie_gargantuar_outerleg_upper";
        frame-count: 197;
        frame 0 { x: 47.5; y: 61.2; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_OUTERLEG_UPPER; }
        frame 1 { x: 47.4; y: -10000; skew-x: 0.1; skew-y: 0.5; image: none; }
        frame 2 { x: 47.1; y: 61; skew-x: 0.3; skew-y: 1.3; }
        frame 3 { x: 46.9; y: -10000; skew-x: 0.6; skew-y: 1.8; scale-x: 1.001; }
        frame 4 { x: 46.8; y: 60.9; skew-x: 0.8; skew-y: 2.5; scale-x: -10000; }
        frame 5 { x: 46.5; y: -10000; skew-x: 1; skew-y: 3; }
        frame 6 { x: 46.4; y: 60.8; skew-x: 1.3; skew-y: 3.8; scale-y: 0.999; }
        frame 7 { x: 46.1; y: 60.7; skew-x: 1.5; skew-y: 4.3; scale-y: -10000; }
        frame 8 { x: 46; y: 60.6; skew-x: 1.8; skew-y: 5; }
        frame 9 { x: 45.8; y: 60.5; skew-x: 2; skew-y: 5.6; scale-x: 1.002; }
        frame 10 { x: 45.6; y: -10000; skew-x: 2.4; skew-y: 6.3; scale-x: -10000; }
        frame 11 { x: 45.8; y: 60.6; skew-x: 2; skew-y: 5.8; }
        frame 12 { x: 46; y: -10000; skew-x: 1.8; skew-y: 5; scale-x: 1.001; }
        frame 13 { x: 46.2; y: 60.7; skew-x: 1.6; skew-y: 4.5; scale-x: -10000; }
        frame 14 { x: 46.4; y: -10000; skew-x: 1.5; skew-y: 4; }
        frame 15 { x: 46.5; y: 60.8; skew-x: 1.3; skew-y: 3.3; }
        frame 16 { x: 46.7; y: 60.9; skew-x: 1; skew-y: 2.8; scale-y: 1; }
        frame 17 { x: 46.9; y: 61; skew-x: 0.8; skew-y: 2.3; scale-y: -10000; }
        frame 18 { x: 47; y: 61.1; skew-x: 0.5; skew-y: 1.6; scale-x: 1; }
        frame 19 { x: 47.1; y: -10000; skew-x: 0.3; skew-y: 1; scale-x: -10000; }
        frame 20 { x: 47.4; y: 61.3; skew-x: 0.1; skew-y: 0.5; }
        frame 21 { x: 47.5; y: 61.2; skew-x: 0; skew-y: 0; }
        frame 22 { x: 49; y: 54.6; skew-x: 7; skew-y: 7; }
        frame 23 { x: 48.5; y: 53.5; skew-x: 9.8; skew-y: 9.8; scale-x: 0.999; scale-y: 0.999; }
        frame 24 { x: 48.1; y: 52.3; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 48; y: 51.1; skew-x: 15.3; skew-y: 15.3; scale-x: 0.998; scale-y: 0.998; }
        frame 26 { x: 47.7; y: 50; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 47.5; y: 49; skew-x: 20.9; skew-y: 20.9; scale-x: 0.999; scale-y: 0.999; }
        frame 28 { x: 47.2; y: 49.4; skew-x: 22; skew-y: 23; scale-x: 0.998; scale-y: 0.997; }
        frame 29 { x: 46.9; y: 49.6; skew-x: 23.1; skew-y: 25.1; scale-x: 0.999; scale-y: -10000; }
        frame 30 { x: 46.5; y: 50; skew-x: 24.3; skew-y: 27.3; scale-x: -10000; }
        frame 31 { x: 46.2; y: 50.3; skew-x: 25.3; skew-y: 29.3; scale-x: 1; }
        frame 32 { x: 45.9; y: 50.6; skew-x: 26.5; skew-y: 31.6; scale-x: 1.002; scale-y: 0.998; }
        frame 33 { x: 43; y: 51.8; skew-x: 24.1; skew-y: 28.6; scale-x: 1; scale-y: 1.05; }
        frame 34 { x: 40.1; y: 53; skew-x: 21.8; skew-y: 25.8; scale-x: 0.999; scale-y: 1.104; }
        frame 35 { x: 37.2; y: 54.1; skew-x: 19.5; skew-y: 23.1; scale-x: 0.998; scale-y: 1.158; }
        frame 36 { x: 34.1; y: 55.5; skew-x: 17.2; skew-y: 20.3; scale-x: -10000; scale-y: 1.213; }
        frame 37 { x: 35.5; y: 55.6; skew-x: 17.3; skew-y: -10000; scale-x: 0.997; scale-y: 1.212; }
        frame 38 { x: 36.6; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 37.9; }
        frame 40 { x: 39.1; y: 55.7; }
        frame 41 { x: 40.4; y: 55.8; skew-x: 17.5; skew-y: 20.5; scale-x: 0.998; scale-y: 1.213; }
        frame 42 { x: 39.6; y: 55.6; skew-x: 15.6; skew-y: 17.8; scale-x: 0.997; scale-y: 1.212; }
        frame 43 { x: 39; y: 55.4; skew-x: 13.8; skew-y: 15.1; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 38.3; y: 55.3; skew-x: 12.1; skew-y: 12.5; }
        frame 45 { x: 37.6; y: 55.1; skew-x: 10.3; skew-y: 9.8; scale-x: 0.996; }
        frame 46 { x: 37; y: 55; skew-x: 8.7; skew-y: 7.2; scale-x: 0.997; }
        frame 47 { x: 38.5; y: 54.9; skew-x: 8.8; skew-y: 7.3; scale-x: 0.996; scale-y: 1.211; }
        frame 48 { x: 40.3; y: 54.7; skew-x: 9.1; skew-y: 7.5; scale-x: 0.995; scale-y: -10000; }
        frame 49 { x: 41.9; y: 54.5; skew-x: 9.3; skew-y: 7.8; scale-x: -10000; scale-y: 1.21; }
        frame 50 { x: 43.5; y: -10000; skew-x: 9.6; skew-y: 8; scale-x: 0.994; scale-y: -10000; }
        frame 51 { x: 45.3; y: 54.1; skew-x: 9.9; skew-y: 8.4; scale-x: 0.995; }
        frame 52 { x: 45.4; y: 55.8; skew-x: 5.3; skew-y: 3.8; scale-x: 0.994; }
        frame 53 { x: 45.8; y: 57.5; skew-x: 0.8; skew-y: -0.4; scale-x: 0.995; }
        frame 54 { x: 46.3; y: 59.3; skew-x: -3.4; skew-y: -4.9; scale-x: -10000; }
        frame 55 { x: 47; y: 61.3; skew-x: -7.9; skew-y: -9.4; }
        frame 56 { x: 47.8; y: 63.4; skew-x: -12.6; skew-y: -14.1; scale-y: 1.211; }
        frame 57 { x: 47.6; y: 64.2; skew-x: -13.7; skew-y: -15.2; scale-x: 0.994; scale-y: 1.209; }
        frame 58 { x: 47.5; y: 65.1; skew-x: -14.9; skew-y: -16.4; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 47.4; y: 66; skew-x: -16.2; skew-y: -17.7; }
        frame 60 { x: 47.1; y: 66.8; skew-x: -17.4; skew-y: -18.9; scale-y: 1.21; }
        frame 61 { x: 47.3; y: 65.2; skew-x: -14.4; skew-y: -15.7; scale-y: 1.183; }
        frame 62 { x: 47.4; y: 63.6; skew-x: -11.4; skew-y: -12.5; scale-x: 0.995; scale-y: 1.158; }
        frame 63 { x: 47.5; y: 62; skew-x: -8.4; skew-y: -9.4; scale-x: 0.996; scale-y: 1.133; }
        frame 64 { x: 47.8; y: 60.5; skew-x: -5.5; skew-y: -6.2; scale-x: -10000; scale-y: 1.108; }
        frame 65 { x: 48; y: 59.2; skew-x: -2.7; skew-y: -3.2; scale-x: 0.997; scale-y: 1.083; }
        frame 66 { x: 48.3; y: 58.3; skew-x: -0.7; skew-y: -1; scale-x: 0.998; scale-y: 1.067; }
        frame 67 { x: -10000; y: 57.5; skew-x: 1; skew-y: 0.8; scale-x: -10000; scale-y: 1.05; }
        frame 68 { x: 48.5; y: 56.5; skew-x: 3; skew-y: 2.8; scale-x: 0.999; scale-y: 1.033; }
        frame 69 { x: 48.7; y: 55.6; skew-x: 5; skew-y: 4.8; scale-x: -10000; scale-y: 1.016; }
        frame 70 { x: 49; y: 54.6; skew-x: 7; skew-y: 7; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 50.2; y: 53; skew-x: 10.3; skew-y: 10.3; scale-x: 0.999; scale-y: 1.042; }
        frame 73 { x: 51.5; y: 51.6; skew-x: 13.3; skew-y: 13.3; scale-x: 0.998; scale-y: 1.084; }
        frame 74 { x: 53.1; y: 50.3; skew-x: 16.6; skew-y: 16.6; scale-x: -10000; scale-y: 1.127; }
        frame 75 { x: 54.8; y: 49; skew-x: 19.8; skew-y: 19.8; scale-y: 1.17; }
        frame 76 { x: 56.5; y: 47.7; skew-x: 23.1; skew-y: 23.1; scale-y: 1.212; }
        frame 77 { x: 58.6; y: 46.7; skew-x: 26.3; skew-y: 26.3; scale-x: 0.997; scale-y: 1.255; }
        frame 78 { x: 60.6; y: 45.8; skew-x: 29.6; skew-y: 29.6; scale-x: -10000; scale-y: 1.298; }
        frame 79 { x: 62.8; y: 45; skew-x: 32.8; skew-y: 32.8; scale-x: 0.998; scale-y: 1.342; }
        frame 80 { x: 63.9; y: 45.8; skew-x: 34.9; skew-y: 34.9; scale-x: 0.997; scale-y: 1.34; }
        frame 81 { x: 65.3; y: 46.5; skew-x: 37.1; skew-y: 37.1; scale-x: 0.996; scale-y: -10000; }
        frame 82 { x: 66.5; y: 47.4; skew-x: 39.1; skew-y: 39.1; scale-x: -10000; }
        frame 83 { x: 67.8; y: 48.1; skew-x: 41.4; skew-y: 41.4; }
        frame 84 { x: 69.2; y: 49.1; skew-x: 43.6; skew-y: 43.6; scale-y: 1.339; }
        frame 85 { x: 70.5; y: 50; skew-x: 45.7; skew-y: 45.7; scale-x: 0.998; scale-y: 1.341; }
        frame 86 { x: 68.2; y: 46.6; skew-x: 41.9; skew-y: 41.9; scale-x: 0.996; scale-y: 1.339; }
        frame 87 { x: 66; y: 43.3; skew-x: 38.1; skew-y: 38.1; scale-x: 0.995; scale-y: 1.338; }
        frame 88 { x: 63.6; y: 40; skew-x: 34.1; skew-y: 34.1; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 61.4; y: 37; skew-x: 30.4; skew-y: 30.4; scale-x: 0.996; scale-y: 1.34; }
        frame 90 { x: 48.4; y: 41.9; skew-x: 20.8; skew-y: 20.8; scale-x: 0.995; scale-y: 1.337; }
        frame 91 { x: 35.8; y: 47.5; skew-x: 11.5; skew-y: 11.5; scale-x: -10000; scale-y: 1.338; }
        frame 92 { x: 24.9; y: 53; skew-x: 0.9; skew-y: 0.9; scale-y: 1.339; }
        frame 93 { x: 25.3; y: 53.3; skew-x: 2.3; skew-y: 2.3; scale-y: 1.338; }
        frame 94 { x: 25.9; y: -10000; skew-x: 4; skew-y: 4; scale-y: -10000; }
        frame 95 { x: 25.3; y: 53.1; skew-x: 2.3; skew-y: 2.3; }
        frame 96 { x: 24.9; y: 53; skew-x: 0.9; skew-y: 0.9; scale-y: 1.339; }
        frame 97 { x: 28.4; y: 53.3; skew-x: 1.8; skew-y: 1.8; scale-x: 0.996; scale-y: 1.29; }
        frame 98 { x: 31.8; y: 53.5; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: 1.241; }
        frame 99 { x: 35.4; y: 53.8; skew-x: 3.5; skew-y: 3.5; scale-x: 0.997; scale-y: 1.193; }
        frame 100 { x: 38.8; y: 54; skew-x: 4.3; skew-y: 4.3; scale-x: 0.998; scale-y: 1.145; }
        frame 101 { x: 42.3; y: 54.3; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: 1.096; }
        frame 102 { x: 45.5; y: 54.5; skew-x: 6; skew-y: 6; scale-x: 0.999; scale-y: 1.048; }
        frame 103 { x: 49; y: 54.6; skew-x: 7; skew-y: 7; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 50.2; y: 53; skew-x: 10.3; skew-y: 10.3; scale-x: 0.999; scale-y: 1.042; }
        frame 106 { x: 51.5; y: 51.6; skew-x: 13.3; skew-y: 13.3; scale-x: 0.998; scale-y: 1.084; }
        frame 107 { x: 53.1; y: 50.3; skew-x: 16.6; skew-y: 16.6; scale-x: -10000; scale-y: 1.127; }
        frame 108 { x: 54.8; y: 49; skew-x: 19.8; skew-y: 19.8; scale-y: 1.17; }
        frame 109 { x: 56.5; y: 47.7; skew-x: 23.1; skew-y: 23.1; scale-y: 1.212; }
        frame 110 { x: 58.6; y: 46.7; skew-x: 26.3; skew-y: 26.3; scale-x: 0.997; scale-y: 1.255; }
        frame 111 { x: 60.6; y: 45.8; skew-x: 29.6; skew-y: 29.6; scale-x: -10000; scale-y: 1.298; }
        frame 112 { x: 62.8; y: 45; skew-x: 32.8; skew-y: 32.8; scale-x: 0.998; scale-y: 1.342; }
        frame 113 { x: 61.8; y: 44.4; skew-x: 31.1; skew-y: 31.1; scale-x: 0.997; scale-y: 1.34; }
        frame 114 { x: 60.8; y: 43.8; skew-x: 29.6; skew-y: 29.6; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 59.8; y: 43.2; skew-x: 27.8; skew-y: 27.8; }
        frame 116 { x: 58.9; y: 42.6; skew-x: 26.3; skew-y: 26.3; }
        frame 117 { x: 58; y: 42; skew-x: 24.8; skew-y: 24.8; scale-x: 0.998; scale-y: 1.342; }
        frame 118 { x: 58.6; y: 40; skew-x: 26.1; skew-y: 26.1; scale-x: 0.996; scale-y: 1.34; }
        frame 119 { x: 59.1; y: 38.1; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 59.7; y: 36.3; skew-x: 28.6; skew-y: 28.6; }
        frame 121 { x: 60.3; y: 34.3; skew-x: 30; skew-y: 30; scale-x: 0.998; scale-y: 1.341; }
        frame 122 { x: -10000; y: -10000; skew-x: 30.1; skew-y: 30.1; scale-x: 0.996; scale-y: 1.34; }
        frame 123 { skew-x: 30; skew-y: 30; scale-x: 0.998; scale-y: 1.341; }
        frame 124 { x: 59.3; y: 34.5; skew-x: 28.6; skew-y: 28.6; scale-x: 0.996; scale-y: 1.339; }
        frame 125 { x: 58.2; y: 34.8; skew-x: 27.1; skew-y: 27.1; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 57.4; y: 34.9; skew-x: 25.8; skew-y: 25.8; }
        frame 127 { x: 56.4; y: 35.1; skew-x: 24.3; skew-y: 24.3; scale-x: 0.995; }
        frame 128 { x: 55.5; y: 35.3; skew-x: 23; skew-y: 23; scale-x: 0.996; scale-y: 1.34; }
        frame 129 { x: 60.5; y: 36; skew-x: 23.8; skew-y: 23.8; scale-x: 0.995; scale-y: 1.338; }
        frame 130 { x: 65.6; y: 37; skew-x: 24.7; skew-y: 24.7; scale-x: 0.996; scale-y: 1.339; }
        frame 131 { x: 67.3; y: 36.9; skew-x: 27.3; skew-y: 27.3; scale-x: 0.994; scale-y: 1.337; }
        frame 132 { x: 69.1; y: 36.7; skew-x: 30.1; skew-y: 30.1; scale-x: -10000; scale-y: 1.336; }
        frame 133 { x: 70.8; y: 36.8; skew-x: 32.8; skew-y: 32.8; scale-x: 0.995; scale-y: 1.338; }
        frame 134 { x: 64.6; y: 40.5; skew-x: 26.3; skew-y: 26.3; scale-x: 0.994; scale-y: 1.251; }
        frame 135 { x: 58.8; y: 44.8; skew-x: 19.8; skew-y: 19.8; scale-x: 0.996; scale-y: 1.167; }
        frame 136 { x: 53.6; y: 49.6; skew-x: 13.3; skew-y: 13.3; scale-x: 0.997; scale-y: 1.083; }
        frame 137 { x: 49; y: 54.6; skew-x: 7; skew-y: 7; scale-x: 1; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 49.3; y: 54.8; skew-x: 9.5; skew-y: 9.5; scale-x: 0.999; scale-y: 0.999; }
        frame 140 { x: 49.5; y: 55; skew-x: 12.1; skew-y: 12.1; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: 50.1; y: -10000; skew-x: 14.8; skew-y: 14.8; }
        frame 142 { x: 50.3; y: 58.1; skew-x: 17.6; skew-y: 17.6; scale-x: 0.998; scale-y: 0.998; }
        frame 143 { x: 50.5; y: 61; skew-x: 20.5; skew-y: 20.5; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 50.6; y: 64.1; skew-x: 23.3; skew-y: 23.3; scale-x: 0.999; scale-y: 0.999; }
        frame 145 { x: 49.4; y: 62; skew-x: 20.6; skew-y: 20.6; scale-x: 0.997; scale-y: 0.997; }
        frame 146 { x: 48.3; y: 60; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 47.2; y: 58; skew-x: 15.5; skew-y: 15.5; scale-x: 0.998; scale-y: 0.998; }
        frame 148 { x: 46.3; y: -10000; skew-x: 12.8; skew-y: 12.8; scale-x: 0.997; scale-y: 0.997; }
        frame 149 { x: 45.4; y: 58.1; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 44.4; y: -10000; skew-x: 7.5; skew-y: 7.5; scale-x: 0.998; scale-y: 0.998; }
        frame 151 { x: 37.5; y: 62.4; skew-x: -2.5; skew-y: -2.5; scale-x: 0.997; scale-y: 0.997; }
        frame 152 { x: 31.5; y: 67.3; skew-x: -12.7; skew-y: -12.7; scale-x: 0.995; scale-y: 0.995; }
        frame 153 { x: 26.1; y: 72.7; skew-x: -23; skew-y: -23; scale-x: -10000; scale-y: -10000; }
        frame 154 { x: 23.6; y: 71.7; skew-x: -22; skew-y: -22; scale-x: 0.994; scale-y: 0.994; }
        frame 155 { x: 21.1; y: 70.7; skew-x: -21; skew-y: -21; scale-x: 0.993; scale-y: 0.993; }
        frame 156 { x: 18.6; y: 69.8; skew-x: -20.1; skew-y: -20.1; scale-x: 0.994; scale-y: 0.994; }
        frame 157 { x: 17.8; y: 69.1; skew-x: -17.5; skew-y: -17.5; scale-x: 0.993; scale-y: 0.993; }
        frame 158 { x: 17; y: 68.6; skew-x: -15.2; skew-y: -15.2; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: 16.3; y: 68.2; skew-x: -12.8; skew-y: -12.8; scale-x: 0.994; scale-y: 0.994; }
        frame 160 { x: -10000; y: 68.1; skew-x: -12.7; skew-y: -12.7; scale-x: 0.993; scale-y: 0.993; }
        frame 161 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 162 { y: 68.2; skew-x: -12.8; skew-y: -12.8; scale-x: 0.994; scale-y: 0.994; }
        frame 163 { x: 16.9; y: 67.2; skew-x: -12.7; skew-y: -12.7; scale-x: 0.993; scale-y: 0.993; }
        frame 164 { x: 17.6; y: 66.2; skew-x: -10000; skew-y: -10000; scale-x: 0.992; scale-y: 0.992; }
        frame 165 { x: 18.2; y: 65.1; skew-x: -12.5; skew-y: -12.5; scale-x: -10000; scale-y: -10000; }
        frame 166 { x: 18.8; y: 64.2; skew-x: -12.4; skew-y: -12.4; scale-x: 0.991; scale-y: 0.991; }
        frame 167 { x: 19.4; y: 63.4; skew-x: -12.5; skew-y: -12.5; scale-x: 0.992; scale-y: 0.992; }
        frame 168 { x: 23.2; y: 61.6; skew-x: -8.7; skew-y: -8.7; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 27.1; y: 59.8; skew-x: -5; skew-y: -5; scale-x: 0.993; scale-y: 0.993; }
        frame 170 { x: 31.1; y: 58.3; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 32.8; y: 57.5; skew-x: 3.3; skew-y: 3.3; scale-x: 0.994; scale-y: 0.994; }
        frame 172 { x: 34.8; y: 56.8; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 173 { x: 37; y: 56; skew-x: 13.3; skew-y: 13.3; scale-x: 0.995; scale-y: 0.995; }
        frame 174 { x: 40.4; y: 56.7; skew-x: 14; skew-y: 14; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 43.8; y: 57.4; skew-x: 14.8; skew-y: 14.8; scale-x: 0.996; scale-y: 0.996; }
        frame 176 { x: 47.2; y: 58; skew-x: 15.5; skew-y: 15.5; scale-x: 0.998; scale-y: 0.998; }
        frame 177 { x: 45.8; y: -10000; skew-x: 11.5; skew-y: 11.5; scale-x: 0.997; scale-y: 0.997; }
        frame 178 { x: 44.4; y: 58.1; skew-x: 7.5; skew-y: 7.5; scale-x: 0.998; scale-y: 0.998; }
        frame 179 { x: 37.5; y: 62.4; skew-x: -2.5; skew-y: -2.5; scale-x: 0.997; scale-y: 0.997; }
        frame 180 { x: 31.5; y: 67.3; skew-x: -12.7; skew-y: -12.7; scale-x: 0.995; scale-y: 0.995; }
        frame 181 { x: 26.1; y: 72.7; skew-x: -23; skew-y: -23; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 22.8; y: 71.4; skew-x: -30.8; skew-y: -30.8; scale-x: 0.993; scale-y: 1.069; }
        frame 183 { x: 19.7; y: 70.8; skew-x: -38.8; skew-y: -38.7; scale-x: 0.992; scale-y: 1.144; }
        frame 184 { x: 16.8; y: 70.2; skew-x: -46.6; skew-y: -46.6; scale-x: 0.993; scale-y: 1.221; }
        frame 185 { x: 10.1; y: 78.2; skew-x: -61.8; skew-y: -61.8; scale-x: 0.991; scale-y: 1.218; }
        frame 186 { x: 5.5; y: 85.5; skew-x: -77; skew-y: -77; scale-x: -10000; scale-y: 1.219; }
        frame 187 { x: -1.3; y: 100.1; skew-x: -92.4; skew-y: -92.4; scale-x: 0.99; scale-y: 1.217; }
        frame 188 { x: -6.7; y: 112.8; skew-x: -107.9; skew-y: -107.9; scale-x: -10000; scale-y: 1.216; }
        frame 189 { x: -17; y: 112.7; skew-x: -89.1; skew-y: -89.1; scale-x: 0.989; scale-y: 1.215; }
        frame 190 { x: -25; y: 109.9; skew-x: -70; skew-y: -70; scale-x: 0.988; scale-y: 1.214; }
        frame 191 { x: -25.1; y: 110.8; skew-x: -69.4; skew-y: -70.6; scale-x: 0.969; scale-y: 1.224; }
        frame 192 { x: -25.3; y: 111.8; skew-x: -68.6; skew-y: -71.3; scale-x: 0.952; scale-y: 1.237; }
        frame 193 { x: -21.6; y: 112.6; skew-x: -78.9; skew-y: -80.3; scale-x: 0.97; scale-y: 1.225; }
        frame 194 { x: -17; y: 112.7; skew-x: -89.1; skew-y: -89.1; scale-x: 0.989; scale-y: 1.215; }
        frame 195 { x: -21.3; y: 111.7; skew-x: -79.6; skew-y: -79.6; scale-x: 0.988; scale-y: 1.214; }
        frame 196 { x: -25; y: 109.9; skew-x: -70; skew-y: -70; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_gargantuar_trashcan2";
        frame-count: 197;
        frame 0 { x: 76.2; y: -34.3; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_TRASHCAN2; }
        frame 1 { x: 74.9; y: -34.4; skew-x: -0.4; skew-y: -0.4; image: none; }
        frame 2 { x: 73.6; y: -34.6; skew-x: -1; skew-y: -1; }
        frame 3 { x: 72.3; y: -10000; skew-x: -1.7; skew-y: -1.7; }
        frame 4 { x: 70.9; y: -34.7; skew-x: -2.2; skew-y: -2.2; }
        frame 5 { x: 69.6; y: -34.9; skew-x: -2.9; skew-y: -2.9; }
        frame 6 { x: 68.3; y: -35; skew-x: -3.4; skew-y: -3.4; }
        frame 7 { x: 67; y: -35.1; skew-x: -4; skew-y: -4; }
        frame 8 { x: 65.8; y: -35.2; skew-x: -4.7; skew-y: -4.7; scale-x: 0.999; scale-y: 0.999; }
        frame 9 { x: 64.4; y: -35.3; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 63; y: -10000; skew-x: -5.9; skew-y: -5.9; scale-x: 1; scale-y: 1; }
        frame 11 { x: 64.3; y: -35.4; skew-x: -5.2; skew-y: -5.2; scale-x: 0.999; scale-y: 0.999; }
        frame 12 { x: 65.3; y: -35.2; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 66.7; y: -35.1; skew-x: -4.2; skew-y: -4.2; }
        frame 14 { x: 67.8; y: -34.9; skew-x: -3.7; skew-y: -3.7; scale-x: 1; scale-y: 1; }
        frame 15 { x: 69; y: -10000; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 70.3; y: -34.8; skew-x: -2.5; skew-y: -2.5; }
        frame 17 { x: 71.3; y: -34.7; skew-x: -2; skew-y: -2; }
        frame 18 { x: 72.6; y: -34.6; skew-x: -1.4; skew-y: -1.4; }
        frame 19 { x: 73.8; y: -34.5; skew-x: -0.9; skew-y: -0.9; }
        frame 20 { x: 75; y: -34.3; skew-x: -0.4; skew-y: -0.4; }
        frame 21 { x: 76.2; y: -10000; skew-x: 0; skew-y: 0; }
        frame 22 { x: 79.6; y: -35.5; skew-x: 1.8; skew-y: 1.8; }
        frame 23 { x: 82.8; y: -35.8; skew-x: 4.5; skew-y: 4.5; scale-x: 0.999; scale-y: 0.999; }
        frame 24 { x: 86.1; y: -36; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 89.3; y: -36.2; skew-x: 10; skew-y: 10; }
        frame 26 { x: 92.6; y: -36.4; skew-x: 12.8; skew-y: 12.8; }
        frame 27 { x: 96; y: -36.5; skew-x: 15.5; skew-y: 15.5; }
        frame 28 { x: 97.4; y: -36.6; skew-x: 16.5; skew-y: 16.5; scale-x: 0.998; scale-y: 0.998; }
        frame 29 { x: 98.8; y: -36.7; skew-x: 17.6; skew-y: 17.6; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 100.2; y: -36.8; skew-x: 18.6; skew-y: 18.6; }
        frame 31 { x: 101.6; y: -36.9; skew-x: 19.8; skew-y: 19.8; }
        frame 32 { x: 103; y: -37; skew-x: 20.8; skew-y: 20.8; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: 95.7; y: -10000; skew-x: 18.3; skew-y: 18.3; scale-x: 0.997; scale-y: 0.997; }
        frame 34 { x: 88.3; y: -37.2; skew-x: 16.1; skew-y: 16.1; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 73.6; y: -35.4; skew-x: 1.1; skew-y: 1.1; }
        frame 36 { x: 60.4; y: -32.9; skew-x: -13.6; skew-y: -13.6; }
        frame 37 { x: 58.8; y: -33.2; skew-x: -14.4; skew-y: -14.4; scale-x: 0.995; scale-y: 0.995; }
        frame 38 { x: 57.3; y: -33.5; skew-x: -15.5; skew-y: -15.5; scale-x: 0.996; scale-y: 0.996; }
        frame 39 { x: 60.8; y: -34; skew-x: -12.4; skew-y: -12.4; scale-x: 0.995; scale-y: 0.995; }
        frame 40 { x: 64.3; y: -34.2; skew-x: -9.5; skew-y: -9.5; scale-x: 0.996; scale-y: 0.996; }
        frame 41 { x: 67.9; y: -34.6; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 70.2; y: -34.8; skew-x: -5.2; skew-y: -5.2; }
        frame 43 { x: 72.3; y: -35.2; skew-x: -3.7; skew-y: -3.7; }
        frame 44 { x: 74.5; y: -35.4; skew-x: -2.2; skew-y: -2.2; }
        frame 45 { x: 76.7; y: -35.7; skew-x: -0.7; skew-y: -0.7; }
        frame 46 { x: 79; y: -36; skew-x: 0.6; skew-y: 0.6; }
        frame 47 { x: 81.3; y: -35.9; skew-x: 2; skew-y: 2; }
        frame 48 { x: 83.6; y: -35.8; skew-x: 3.5; skew-y: 3.5; }
        frame 49 { x: 85.8; y: -10000; skew-x: 4.8; skew-y: 4.8; scale-x: 0.995; scale-y: 0.995; }
        frame 50 { x: 88.1; y: -35.7; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 90.5; y: -35.8; skew-x: 7.9; skew-y: 7.9; scale-x: 0.996; scale-y: 0.996; }
        frame 52 { x: 93.5; y: -35.2; skew-x: 10.1; skew-y: 10.1; scale-x: 0.995; scale-y: 0.995; }
        frame 53 { x: 96.6; y: -34.8; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 99.7; y: -34.2; skew-x: 14.6; skew-y: 14.6; scale-x: 0.994; scale-y: 0.994; }
        frame 55 { x: 102.8; y: -33.7; skew-x: 16.8; skew-y: 16.8; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 106.1; y: -33.3; skew-x: 19.3; skew-y: 19.3; scale-x: 0.995; scale-y: 0.995; }
        frame 57 { x: 96.9; y: -33.6; skew-x: 14.8; skew-y: 14.8; scale-x: 0.994; scale-y: 0.994; }
        frame 58 { x: 87.8; y: -33.7; skew-x: 10.3; skew-y: 10.3; scale-x: 0.995; scale-y: 0.995; }
        frame 59 { x: 73.7; y: -33.6; skew-x: -1.4; skew-y: -1.4; scale-x: 0.996; scale-y: 0.996; }
        frame 60 { x: 60.4; y: -32.9; skew-x: -13.6; skew-y: -13.6; scale-x: 0.997; scale-y: 0.997; }
        frame 61 { x: 58.8; y: -33.2; skew-x: -14.4; skew-y: -14.4; scale-x: 0.995; scale-y: 0.995; }
        frame 62 { x: 57.3; y: -33.5; skew-x: -15.5; skew-y: -15.5; scale-x: 0.996; scale-y: 0.996; }
        frame 63 { x: 61.6; y: -33.9; skew-x: -12.4; skew-y: -12.4; scale-x: 0.995; scale-y: 0.995; }
        frame 64 { x: 65.9; y: -34.2; skew-x: -9.2; skew-y: -9.2; scale-x: 0.996; scale-y: 0.996; }
        frame 65 { x: 70.3; y: -34.4; skew-x: -6.4; skew-y: -6.4; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 72.1; y: -34.6; skew-x: -4.7; skew-y: -4.7; scale-x: 0.997; scale-y: 0.997; }
        frame 67 { x: 74; y: -34.8; skew-x: -2.9; skew-y: -2.9; scale-x: 0.998; scale-y: 0.998; }
        frame 68 { x: 75.8; y: -34.9; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 77.6; y: -35; skew-x: 0; skew-y: 0; scale-x: 0.999; scale-y: 0.999; }
        frame 70 { x: 79.6; y: -35.5; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 85.6; y: -32.9; skew-x: 6.8; skew-y: 6.8; scale-x: 0.999; scale-y: 0.999; }
        frame 73 { x: 91.8; y: -30.2; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 98.2; y: -27.4; skew-x: 17.1; skew-y: 17.1; scale-x: 0.998; scale-y: 0.998; }
        frame 75 { x: 104.6; y: -24.6; skew-x: 22.3; skew-y: 22.3; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 111.2; y: -21.5; skew-x: 27.3; skew-y: 27.3; scale-x: 0.997; scale-y: 0.997; }
        frame 77 { x: 117.8; y: -18.3; skew-x: 32.6; skew-y: 32.6; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 124.3; y: -15; skew-x: 37.6; skew-y: 37.6; scale-x: 0.996; scale-y: 0.996; }
        frame 79 { x: 131.2; y: -11.7; skew-x: 42.8; skew-y: 42.8; scale-x: 0.998; scale-y: 0.998; }
        frame 80 { x: 134.1; y: -7.9; skew-x: 46.1; skew-y: 46.1; scale-x: 0.996; scale-y: 0.996; }
        frame 81 { x: 137; y: -4.1; skew-x: 49.6; skew-y: 49.6; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 139.8; y: -0.2; skew-x: 52.9; skew-y: 52.9; scale-x: 0.995; scale-y: 0.995; }
        frame 83 { x: 142.7; y: 3.5; skew-x: 56.2; skew-y: 56.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 145.6; y: 7.6; skew-x: 59.7; skew-y: 59.7; }
        frame 85 { x: 148.6; y: 11.5; skew-x: 63; skew-y: 63; scale-x: 0.996; scale-y: 0.996; }
        frame 86 { x: 141.4; y: 1.4; skew-x: 55.6; skew-y: 55.6; scale-x: 0.993; scale-y: 0.993; }
        frame 87 { x: 134.1; y: -8.3; skew-x: 48.1; skew-y: 48.1; scale-x: 0.994; scale-y: 0.994; }
        frame 88 { x: 123.5; y: -18.7; skew-x: 36.3; skew-y: 36.3; scale-x: 0.992; scale-y: 0.992; }
        frame 89 { x: 113.2; y: -28.4; skew-x: 24.6; skew-y: 24.6; scale-x: 0.994; scale-y: 0.994; }
        frame 90 { x: 71.5; y: -36.6; skew-x: -9.9; skew-y: -9.9; scale-x: 0.993; scale-y: 0.993; }
        frame 91 { x: 36; y: -32; skew-x: -32; skew-y: -32; scale-x: 0.992; scale-y: 0.992; }
        frame 92 { x: 16.1; y: -24.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -10000; y: -23.8; scale-x: 0.99; scale-y: 0.99; }
        frame 94 { y: -22.8; scale-x: 0.992; scale-y: 0.992; }
        frame 95 { y: -23.8; scale-x: 0.99; scale-y: 0.99; }
        frame 96 { y: -24.8; scale-x: 0.992; scale-y: 0.992; }
        frame 97 { x: 24.8; y: -26.3; skew-x: -27.2; skew-y: -27.2; scale-x: 0.991; scale-y: 0.991; }
        frame 98 { x: 33.5; y: -28; skew-x: -22.2; skew-y: -22.2; scale-x: 0.993; scale-y: 0.993; }
        frame 99 { x: 42.5; y: -29.6; skew-x: -17.4; skew-y: -17.4; scale-x: 0.994; scale-y: 0.994; }
        frame 100 { x: 51.6; y: -31.1; skew-x: -12.5; skew-y: -12.5; scale-x: 0.996; scale-y: 0.996; }
        frame 101 { x: 60.8; y: -32.7; skew-x: -7.7; skew-y: -7.7; scale-x: 0.997; scale-y: 0.997; }
        frame 102 { x: 70.1; y: -34.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.999; scale-y: 0.999; }
        frame 103 { x: 79.6; y: -35.5; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 78.2; y: -35.4; skew-x: 0.1; skew-y: 0.1; scale-x: 0.999; scale-y: 0.999; }
        frame 106 { x: 77; y: -35.5; skew-x: -1.2; skew-y: -1.2; scale-x: 0.998; scale-y: 0.998; }
        frame 107 { x: 75.8; y: -35.4; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 74.5; y: -10000; skew-x: -4.2; skew-y: -4.2; scale-x: 0.997; scale-y: 0.997; }
        frame 109 { x: 73.3; skew-x: -5.7; skew-y: -5.7; scale-x: 0.996; scale-y: 0.996; }
        frame 110 { x: 72.1; y: -35.2; skew-x: -7.4; skew-y: -7.4; scale-x: 0.995; scale-y: 0.995; }
        frame 111 { x: 70.9; y: -10000; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 69.6; skew-x: -10.6; skew-y: -10.6; }
        frame 113 { x: 65.3; y: -34.9; skew-x: -13.7; skew-y: -13.7; scale-x: 0.994; scale-y: 0.994; }
        frame 114 { x: 61; y: -34.7; skew-x: -16.9; skew-y: -16.9; scale-x: 0.993; scale-y: 0.993; }
        frame 115 { x: 56.8; y: -34.4; skew-x: -20; skew-y: -20; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 52.8; y: -34.1; skew-x: -23.2; skew-y: -23.2; }
        frame 117 { x: 48.5; y: -33.7; skew-x: -26.4; skew-y: -26.4; scale-x: 0.994; scale-y: 0.994; }
        frame 118 { x: 45.9; y: -33; skew-x: -29; skew-y: -29; scale-x: 0.992; scale-y: 0.992; }
        frame 119 { x: 43; y: -32.2; skew-x: -31.7; skew-y: -31.7; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 40.4; y: -31.4; skew-x: -34.5; skew-y: -34.5; }
        frame 121 { x: 37.8; y: -30.7; skew-x: -37.1; skew-y: -37.1; scale-x: 0.993; scale-y: 0.993; }
        frame 122 { x: -10000; y: -30.6; skew-x: -37; skew-y: -37; scale-x: 0.991; scale-y: 0.991; }
        frame 123 { y: -30.7; skew-x: -37.1; skew-y: -37.1; scale-x: 0.993; scale-y: 0.993; }
        frame 124 { x: 39.9; y: -32; skew-x: -35; skew-y: -35; scale-x: 0.991; scale-y: 0.991; }
        frame 125 { x: 42.1; y: -33.3; skew-x: -33; skew-y: -33; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 44.3; y: -34.6; skew-x: -31; skew-y: -31; }
        frame 127 { x: 46.5; y: -35.8; skew-x: -29; skew-y: -29; }
        frame 128 { x: 48.9; y: -37.1; skew-x: -27.1; skew-y: -27.1; scale-x: 0.992; scale-y: 0.992; }
        frame 129 { x: 57.3; y: -36.5; skew-x: -24; skew-y: -24; scale-x: 0.991; scale-y: 0.991; }
        frame 130 { x: 65.8; y: -36; skew-x: -20.8; skew-y: -20.8; scale-x: 0.992; scale-y: 0.992; }
        frame 131 { x: 72.2; y: -35.1; skew-x: -17; skew-y: -17; scale-x: 0.991; scale-y: 0.991; }
        frame 132 { x: 78.6; y: -34.1; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 85.2; y: -33.2; skew-x: -9.5; skew-y: -9.5; }
        frame 134 { x: 89.3; y: -34.8; skew-x: -3.9; skew-y: -3.9; scale-x: 0.993; scale-y: 0.993; }
        frame 135 { x: 93.7; y: -36.2; skew-x: 1.2; skew-y: 1.2; scale-x: 0.995; scale-y: 0.995; }
        frame 136 { x: 86.7; y: -35.8; skew-x: 1.5; skew-y: 1.5; scale-x: 0.997; scale-y: 0.997; }
        frame 137 { x: 79.6; y: -35.5; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 82.3; y: -33.9; skew-x: 3.3; skew-y: 3.3; }
        frame 140 { x: 85; y: -32.2; skew-x: 5; skew-y: 5; scale-x: 0.999; scale-y: 0.999; }
        frame 141 { x: 87.7; y: -30.7; skew-x: 6.9; skew-y: 6.9; scale-x: 1; scale-y: 1; }
        frame 142 { x: 93.5; y: -26.8; skew-x: 9.8; skew-y: 9.8; scale-x: 0.999; scale-y: 0.999; }
        frame 143 { x: 99.3; y: -23; skew-x: 13; skew-y: 13; scale-x: 0.998; scale-y: 0.998; }
        frame 144 { x: 105.2; y: -19.1; skew-x: 16.2; skew-y: 16.2; scale-x: 0.999; scale-y: 0.999; }
        frame 145 { x: 115.4; y: -12.2; skew-x: 24.1; skew-y: 24.1; scale-x: 0.997; scale-y: 0.997; }
        frame 146 { x: 126.1; y: -5; skew-x: 32.3; skew-y: 32.3; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 136.9; y: 2.4; skew-x: 40.3; skew-y: 40.3; scale-x: 0.998; scale-y: 0.998; }
        frame 148 { x: 131.1; y: -1.4; skew-x: 37.9; skew-y: 37.9; scale-x: 0.996; scale-y: 0.996; }
        frame 149 { x: 125.4; y: -5.4; skew-x: 35.6; skew-y: 35.6; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 119.7; y: -9.3; skew-x: 33.2; skew-y: 33.2; scale-x: 0.997; scale-y: 0.997; }
        frame 151 { x: 108.8; y: -12.2; skew-x: 30.3; skew-y: 30.3; scale-x: 0.995; scale-y: 0.995; }
        frame 152 { x: 98; y: -15; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 87.2; y: -17.9; skew-x: 24.5; skew-y: 24.5; scale-x: 0.996; scale-y: 0.996; }
        frame 154 { x: 69.1; y: -23.1; skew-x: 14.1; skew-y: 14.1; scale-x: 0.994; scale-y: 0.994; }
        frame 155 { x: 51.5; y: -28; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 34.5; y: -32.5; skew-x: -6.1; skew-y: -6.1; }
        frame 157 { x: 29.3; y: -30.7; skew-x: -9.2; skew-y: -9.2; scale-x: 0.993; scale-y: 0.993; }
        frame 158 { x: 24.2; y: -28.7; skew-x: -12.5; skew-y: -12.5; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: 19.2; y: -26.8; skew-x: -15.9; skew-y: -15.9; }
        frame 160 { x: 20.8; y: -27.7; skew-x: -14.5; skew-y: -14.5; scale-x: 0.992; scale-y: 0.992; }
        frame 161 { x: 22.4; y: -28.8; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 23.9; y: -29.7; skew-x: -11.9; skew-y: -11.9; scale-x: 0.993; scale-y: 0.993; }
        frame 163 { x: 29.4; y: -31; skew-x: -8.2; skew-y: -8.2; scale-x: 0.992; scale-y: 0.992; }
        frame 164 { x: 34.8; y: -32.5; skew-x: -4.4; skew-y: -4.4; scale-x: -10000; scale-y: -10000; }
        frame 165 { x: 40.3; y: -33.8; skew-x: -0.7; skew-y: -0.7; }
        frame 166 { x: 45.8; y: -35.2; skew-x: 2.8; skew-y: 2.8; }
        frame 167 { x: 51.4; y: -36.5; skew-x: 6.6; skew-y: 6.6; }
        frame 168 { x: 59.3; y: -35; skew-x: 8.8; skew-y: 8.8; }
        frame 169 { x: 67.3; y: -33.7; skew-x: 11; skew-y: 11; }
        frame 170 { x: 75.3; y: -32.3; skew-x: 13.3; skew-y: 13.3; scale-x: 0.993; scale-y: 0.993; }
        frame 171 { x: 83; y: -28.2; skew-x: 15.5; skew-y: 15.5; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 90.8; y: -24.2; skew-x: 17.8; skew-y: 17.8; }
        frame 173 { x: 98.7; y: -20.2; skew-x: 20.3; skew-y: 20.3; scale-x: 0.995; scale-y: 0.995; }
        frame 174 { x: 107.5; y: -16.4; skew-x: 24.1; skew-y: 24.1; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 116.5; y: -12.5; skew-x: 28.1; skew-y: 28.1; scale-x: 0.996; scale-y: 0.996; }
        frame 176 { x: 125.6; y: -8.6; skew-x: 32; skew-y: 32; scale-x: 0.998; scale-y: 0.998; }
        frame 177 { x: 122.7; y: -8.9; skew-x: 32.6; skew-y: 32.6; scale-x: 0.996; scale-y: 0.996; }
        frame 178 { x: 119.7; y: -9.3; skew-x: 33.2; skew-y: 33.2; scale-x: 0.997; scale-y: 0.997; }
        frame 179 { x: 108.8; y: -12.2; skew-x: 30.3; skew-y: 30.3; scale-x: 0.995; scale-y: 0.995; }
        frame 180 { x: 98; y: -15; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 181 { x: 87.2; y: -17.9; skew-x: 24.5; skew-y: 24.5; scale-x: 0.996; scale-y: 0.996; }
        frame 182 { x: 65.7; y: -23.1; skew-x: 14.1; skew-y: 14.1; scale-x: 0.994; scale-y: 0.994; }
        frame 183 { x: 44.8; y: -28; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: 24.5; y: -32.5; skew-x: -6.1; skew-y: -6.1; }
        frame 185 { x: 7.3; y: -26.4; skew-x: -8.7; skew-y: -8.7; scale-x: 0.992; scale-y: 0.992; }
        frame 186 { x: -9.9; y: -20.3; skew-x: -11.4; skew-y: -11.4; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: -45.4; y: 1.8; skew-x: -25.7; skew-y: -25.7; scale-x: 0.99; scale-y: 0.99; }
        frame 188 { x: -79.8; y: 24.2; skew-x: -40; skew-y: -40; scale-x: 0.991; scale-y: 0.991; }
        frame 189 { x: -85.9; y: 30.7; skew-x: -45.2; skew-y: -45.2; scale-x: 0.989; scale-y: 0.989; }
        frame 190 { x: -92; y: 37.1; skew-x: -50.3; skew-y: -50.3; scale-x: 0.99; scale-y: 0.99; }
        frame 191 { x: -94; y: 41.5; skew-x: -49.3; skew-y: -53.8; scale-x: 0.993; scale-y: 0.999; }
        frame 192 { x: -96.2; y: 46; skew-x: -48.2; skew-y: -57.4; scale-x: 0.999; scale-y: 1.01; }
        frame 193 { x: -89.5; y: 36.6; skew-x: -45.8; skew-y: -50.3; scale-x: 0.993; scale-y: 0.998; }
        frame 194 { x: -82.7; y: 27.6; skew-x: -43.3; skew-y: -43.3; scale-x: 0.989; scale-y: 0.989; }
        frame 195 { x: -84.1; y: 31.3; skew-x: -45; skew-y: -45; scale-x: 0.988; scale-y: 0.988; }
        frame 196 { x: -85.7; y: 35; skew-x: -46.8; skew-y: -46.8; scale-x: 0.991; scale-y: 0.991; }
    }
    Track {
        source-name: "Zombie_imp_innerarm_upper";
        frame-count: 197;
        frame 0 { x: 69.9; y: -32.5; image: IMAGE_REANIM_ZOMBIE_IMP_ARM1; }
        frame 1 { x: 68.6; y: -10000; skew-x: -0.4; skew-y: -0.4; image: none; }
        frame 2 { x: 67.3; y: -32.6; skew-x: -1; skew-y: -1; }
        frame 3 { x: 66; y: -10000; skew-x: -1.7; skew-y: -1.7; }
        frame 4 { x: 64.7; y: -32.7; skew-x: -2.2; skew-y: -2.2; }
        frame 5 { x: 63.5; y: -10000; skew-x: -2.9; skew-y: -2.9; }
        frame 6 { x: 62.1; skew-x: -3.4; skew-y: -3.4; }
        frame 7 { x: 60.9; y: -32.8; skew-x: -4; skew-y: -4; }
        frame 8 { x: 59.5; y: -32.7; skew-x: -4.7; skew-y: -4.7; scale-x: 0.999; scale-y: 0.999; }
        frame 9 { x: 58.3; y: -32.9; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 57; y: -32.8; skew-x: -5.9; skew-y: -5.9; scale-x: 1; scale-y: 1; }
        frame 11 { x: 58.1; y: -10000; skew-x: -5.2; skew-y: -5.2; scale-x: 0.999; scale-y: 0.999; }
        frame 12 { x: 59.3; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 60.5; y: -32.7; skew-x: -4.2; skew-y: -4.2; }
        frame 14 { x: 61.7; y: -10000; skew-x: -3.7; skew-y: -3.7; scale-x: 1; scale-y: 1; }
        frame 15 { x: 62.9; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 64.1; skew-x: -2.5; skew-y: -2.5; }
        frame 17 { x: 65.2; y: -32.6; skew-x: -2; skew-y: -2; }
        frame 18 { x: 66.5; y: -10000; skew-x: -1.4; skew-y: -1.4; }
        frame 19 { x: 67.6; y: -32.5; skew-x: -0.9; skew-y: -0.9; }
        frame 20 { x: 68.8; y: -10000; skew-x: -0.4; skew-y: -0.4; }
        frame 21 { x: 69.9; skew-x: 0; skew-y: 0; }
        frame 22 { x: 73.2; y: -33.9; skew-x: 1.8; skew-y: 1.8; }
        frame 23 { x: 76.3; y: -34.5; skew-x: 4.5; skew-y: 4.5; scale-x: 0.999; scale-y: 0.999; }
        frame 24 { x: 79.6; y: -35; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 82.8; y: -35.5; skew-x: 10; skew-y: 10; }
        frame 26 { x: 86; y: -36; skew-x: 12.8; skew-y: 12.8; }
        frame 27 { x: 89.4; y: -36.5; skew-x: 15.5; skew-y: 15.5; }
        frame 28 { x: 90.8; y: -36.7; skew-x: 16.5; skew-y: 16.5; scale-x: 0.998; scale-y: 0.998; }
        frame 29 { x: 92.2; y: -36.9; skew-x: 17.6; skew-y: 17.6; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 93.6; y: -37.1; skew-x: 18.6; skew-y: 18.6; }
        frame 31 { x: 95; y: -37.3; skew-x: 19.8; skew-y: 19.8; }
        frame 32 { x: 96.5; y: -37.6; skew-x: 20.8; skew-y: 20.8; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: 92.1; y: -37.2; skew-x: 31.9; skew-y: 31.9; scale-x: 0.995; scale-y: 0.995; }
        frame 34 { x: 87.8; y: -36.8; skew-x: 43.2; skew-y: 43.2; scale-x: 0.994; scale-y: 0.994; }
        frame 35 { x: 71.3; y: -35.1; skew-x: 17.6; skew-y: 17.6; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 55.8; y: -32.1; skew-x: -7.6; skew-y: -7.6; scale-x: 0.995; scale-y: 0.995; }
        frame 37 { x: 54.1; y: -32.8; skew-x: -7.7; skew-y: -7.7; scale-x: 0.994; scale-y: 0.994; }
        frame 38 { x: 52.3; y: -33.3; skew-x: -8.2; skew-y: -8.2; scale-x: 0.995; scale-y: 0.995; }
        frame 39 { x: 55.7; y: -34.3; skew-x: -4.5; skew-y: -4.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 59.1; y: -35.4; skew-x: -0.9; skew-y: -0.9; }
        frame 41 { x: 62.5; y: -36.6; skew-x: 2.5; skew-y: 2.5; scale-x: 0.996; scale-y: 0.996; }
        frame 42 { x: 64.8; y: -37; skew-x: 4; skew-y: 4; scale-x: 0.995; scale-y: 0.995; }
        frame 43 { x: 67.1; y: -37.5; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 69.4; y: -37.9; skew-x: 7.5; skew-y: 7.5; }
        frame 45 { x: 71.8; y: -38.4; skew-x: 9.3; skew-y: 9.3; }
        frame 46 { x: 74.1; y: -38.8; skew-x: 11.1; skew-y: 11.1; }
        frame 47 { x: 77; y: -39.1; skew-x: 16.6; skew-y: 16.6; scale-x: 0.994; scale-y: 0.994; }
        frame 48 { x: 80; y: -39.4; skew-x: 22.3; skew-y: 22.3; scale-x: 0.993; scale-y: 0.993; }
        frame 49 { x: 82.8; y: -39.7; skew-x: 27.8; skew-y: 27.8; scale-x: 0.992; scale-y: 0.992; }
        frame 50 { x: 85.8; y: -39.8; skew-x: 33.4; skew-y: 33.4; scale-x: 0.991; scale-y: 0.991; }
        frame 51 { x: 88.9; y: -39.9; skew-x: 39.1; skew-y: 39.1; scale-x: 0.992; scale-y: 0.992; }
        frame 52 { x: 92; y: -39.5; skew-x: 41.4; skew-y: 41.4; scale-x: 0.99; scale-y: 0.99; }
        frame 53 { x: 95; y: -39; skew-x: 43.6; skew-y: 43.6; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 98.1; y: -38.6; skew-x: 45.9; skew-y: 45.9; }
        frame 55 { x: 101.1; y: -38.1; skew-x: 48.1; skew-y: 48.1; }
        frame 56 { x: 104.2; y: -37.7; skew-x: 50.4; skew-y: 50.4; scale-x: 0.991; scale-y: 0.991; }
        frame 57 { x: 94.4; y: -37.1; skew-x: 39.6; skew-y: 39.6; scale-x: 0.99; scale-y: 0.99; }
        frame 58 { x: 84.7; y: -36.1; skew-x: 28.8; skew-y: 28.8; scale-x: 0.991; scale-y: 0.991; }
        frame 59 { x: 69.8; y: -34.4; skew-x: 10.5; skew-y: 10.5; scale-x: 0.992; scale-y: 0.992; }
        frame 60 { x: 55.8; y: -32.1; skew-x: -7.6; skew-y: -7.6; scale-x: 0.995; scale-y: 0.995; }
        frame 61 { x: 54.1; y: -32.8; skew-x: -7.7; skew-y: -7.7; scale-x: 0.994; scale-y: 0.994; }
        frame 62 { x: 52.3; y: -33.3; skew-x: -8.2; skew-y: -8.2; scale-x: 0.995; scale-y: 0.995; }
        frame 63 { x: 56.5; y: -33.5; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 60.7; y: -33.8; skew-x: -3.7; skew-y: -3.7; }
        frame 65 { x: 65; y: -34.1; skew-x: -1.4; skew-y: -1.4; scale-x: 0.996; scale-y: 0.996; }
        frame 66 { x: 66.7; y: -34; skew-x: -0.7; skew-y: -0.7; scale-x: 0.997; scale-y: 0.997; }
        frame 67 { x: 68.3; y: -10000; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 69.9; y: -33.9; skew-x: 0.3; skew-y: 0.3; scale-x: 0.998; scale-y: 0.998; }
        frame 69 { x: 71.6; y: -10000; skew-x: 1; skew-y: 1; scale-x: 0.999; scale-y: 0.999; }
        frame 70 { x: 73.2; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 79.6; y: -31.7; skew-x: 6.8; skew-y: 6.8; scale-x: 0.999; scale-y: 0.999; }
        frame 73 { x: 86; y: -29.4; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 92.5; y: -27.2; skew-x: 17.1; skew-y: 17.1; scale-x: 0.998; scale-y: 0.998; }
        frame 75 { x: 98.9; y: -24.7; skew-x: 22.3; skew-y: 22.3; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 105.5; y: -22.3; skew-x: 27.3; skew-y: 27.3; scale-x: 0.997; scale-y: 0.997; }
        frame 77 { x: 112.2; y: -19.8; skew-x: 32.6; skew-y: 32.6; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 118.8; y: -17.2; skew-x: 37.6; skew-y: 37.6; scale-x: 0.996; scale-y: 0.996; }
        frame 79 { x: 125.5; y: -14.7; skew-x: 42.8; skew-y: 42.8; scale-x: 0.998; scale-y: 0.998; }
        frame 80 { x: 128.6; y: -11.1; skew-x: 46.1; skew-y: 46.1; scale-x: 0.996; scale-y: 0.996; }
        frame 81 { x: 131.7; y: -7.6; skew-x: 49.6; skew-y: 49.6; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 134.9; y: -4; skew-x: 52.9; skew-y: 52.9; scale-x: 0.995; scale-y: 0.995; }
        frame 83 { x: 138; y: -0.4; skew-x: 56.2; skew-y: 56.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 141.2; y: 3.1; skew-x: 59.7; skew-y: 59.7; }
        frame 85 { x: 144.3; y: 6.7; skew-x: 63; skew-y: 63; scale-x: 0.996; scale-y: 0.996; }
        frame 86 { x: 136.2; y: -2.8; skew-x: 55.6; skew-y: 55.6; scale-x: 0.993; scale-y: 0.993; }
        frame 87 { x: 128; y: -12.4; skew-x: 48.1; skew-y: 48.1; scale-x: 0.994; scale-y: 0.994; }
        frame 88 { x: 117.3; y: -21.2; skew-x: 36.3; skew-y: 36.3; scale-x: 0.992; scale-y: 0.992; }
        frame 89 { x: 106.8; y: -29.5; skew-x: 24.6; skew-y: 24.6; scale-x: 0.994; scale-y: 0.994; }
        frame 90 { x: 65.3; y: -36.5; skew-x: -9.2; skew-y: -9.2; scale-x: 0.993; scale-y: 0.993; }
        frame 91 { x: 30.3; y: -29.6; skew-x: -31.3; skew-y: -31.3; scale-x: 0.991; scale-y: 0.991; }
        frame 92 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 30.4; y: -28.7; skew-x: -31.2; skew-y: -31.2; scale-x: 0.99; scale-y: 0.99; }
        frame 94 { x: 30.3; y: -27.6; skew-x: -31.3; skew-y: -31.3; scale-x: 0.991; scale-y: 0.991; }
        frame 95 { x: -10000; y: -28.6; skew-x: -31.2; skew-y: -31.2; scale-x: 0.99; scale-y: 0.99; }
        frame 96 { y: -29.6; skew-x: -31.3; skew-y: -31.3; scale-x: 0.991; scale-y: 0.991; }
        frame 97 { x: 36.3; y: -30.3; skew-x: -26.5; skew-y: -26.5; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 42.2; y: -30.9; skew-x: -21.7; skew-y: -21.7; scale-x: 0.993; scale-y: 0.993; }
        frame 99 { x: 48.4; y: -31.6; skew-x: -17; skew-y: -17; scale-x: 0.994; scale-y: 0.994; }
        frame 100 { x: 54.5; y: -32.3; skew-x: -12.2; skew-y: -12.2; scale-x: 0.996; scale-y: 0.996; }
        frame 101 { x: 60.6; y: -32.9; skew-x: -7.4; skew-y: -7.4; scale-x: 0.997; scale-y: 0.997; }
        frame 102 { x: 66.8; y: -33.5; skew-x: -2.7; skew-y: -2.7; scale-x: 0.998; scale-y: 0.998; }
        frame 103 { x: 73.2; y: -33.9; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 71.9; y: -33.7; skew-x: 0.1; skew-y: 0.1; scale-x: 0.999; scale-y: 0.999; }
        frame 106 { x: 70.8; y: -33.5; skew-x: -1.2; skew-y: -1.2; scale-x: 0.998; scale-y: 0.998; }
        frame 107 { x: 69.6; y: -33.3; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 68.5; y: -33.1; skew-x: -4.2; skew-y: -4.2; scale-x: 0.997; scale-y: 0.997; }
        frame 109 { x: 67.3; y: -32.9; skew-x: -5.7; skew-y: -5.7; scale-x: 0.996; scale-y: 0.996; }
        frame 110 { x: 66.1; y: -32.8; skew-x: -7.4; skew-y: -7.4; scale-x: 0.995; scale-y: 0.995; }
        frame 111 { x: 65; y: -32.5; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 64; y: -32.3; skew-x: -10.6; skew-y: -10.6; }
        frame 113 { x: 62.5; y: -32.4; skew-x: -12; skew-y: -12; scale-x: 0.994; scale-y: 0.994; }
        frame 114 { x: 61; y: -10000; skew-x: -13.7; skew-y: -13.7; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 59.5; y: -32.5; skew-x: -15.2; skew-y: -15.2; scale-x: 0.993; scale-y: 0.993; }
        frame 116 { x: 58; y: -10000; skew-x: -16.7; skew-y: -16.7; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 56.6; y: -32.6; skew-x: -18.4; skew-y: -18.4; scale-x: 0.994; scale-y: 0.994; }
        frame 118 { x: 48.5; y: -31; skew-x: -26; skew-y: -26; scale-x: 0.992; scale-y: 0.992; }
        frame 119 { x: 40.6; y: -29.4; skew-x: -34; skew-y: -34; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 32.9; y: -27.8; skew-x: -41.7; skew-y: -41.7; scale-x: 0.991; scale-y: 0.991; }
        frame 121 { x: 25.3; y: -26.1; skew-x: -49.5; skew-y: -49.5; scale-x: 0.992; scale-y: 0.992; }
        frame 122 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.991; scale-y: 0.991; }
        frame 123 { scale-x: 0.992; scale-y: 0.992; }
        frame 124 { x: 16.9; y: -28.1; skew-x: -66.6; skew-y: -66.6; scale-x: 0.99; scale-y: 0.99; }
        frame 125 { x: 9.1; y: -30.5; skew-x: -83.9; skew-y: -83.9; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 1.8; y: -33.5; skew-x: -100.7; skew-y: -100.7; scale-x: 0.989; scale-y: 0.989; }
        frame 127 { x: -5; y: -37.3; skew-x: -118; skew-y: -118; scale-x: 0.987; scale-y: 0.987; }
        frame 128 { x: -12; y: -41.7; skew-x: -135.2; skew-y: -135.2; scale-x: 0.988; scale-y: 0.988; }
        frame 129 { x: -67.7; y: -43.9; skew-x: -135.3; skew-y: -135.3; scale-x: 0.986; scale-y: 0.986; }
        frame 130 { x: -123.6; y: -46; skew-x: -135.4; skew-y: -135.4; scale-x: 0.987; scale-y: 0.987; }
        frame 131 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_innerleg_foot";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 124 { x: 56.3; y: -15.9; skew-x: -67.1; skew-y: -67.1; scale-x: 0.999; scale-y: 0.999; cel: 0; image: IMAGE_REANIM_ZOMBIE_IMP_INNERLEG_FOOT; }
        frame 125 { x: 45.1; y: -23.6; skew-x: -72.1; skew-y: -72.1; scale-x: 0.997; scale-y: 0.997; cel: -10000; image: none; }
        frame 126 { x: 34; y: -31.5; skew-x: -76.9; skew-y: -76.9; scale-x: -10000; scale-y: -10000; }
        frame 127 { x: 23; y: -39.2; skew-x: -81.9; skew-y: -81.9; }
        frame 128 { x: 11.9; y: -47.1; skew-x: -86.6; skew-y: -86.6; }
        frame 129 { x: -43.7; y: -49.2; skew-x: -86.8; skew-y: -86.8; }
        frame 130 { x: -99.6; y: -51.5; skew-x: -10000; skew-y: -10000; scale-x: 0.996; scale-y: 0.996; }
        frame 131 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_innerleg_lower";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 124 { x: 53.5; y: -16.7; skew-x: -88.7; skew-y: -88.7; scale-x: 0.996; scale-y: 0.996; cel: 0; image: IMAGE_REANIM_ZOMBIE_IMP_INNERLEG_LOWER; }
        frame 125 { x: 42.3; y: -24.2; skew-x: -93.4; skew-y: -93.4; scale-x: 0.995; scale-y: 0.995; cel: -10000; image: none; }
        frame 126 { x: 31.3; y: -31.7; skew-x: -98.4; skew-y: -98.4; scale-x: -10000; scale-y: -10000; }
        frame 127 { x: 20.2; y: -39.3; skew-x: -103.2; skew-y: -103.2; scale-x: 0.994; scale-y: 0.994; }
        frame 128 { x: 9.1; y: -46.9; skew-x: -108.2; skew-y: -108.2; scale-x: -10000; scale-y: -10000; }
        frame 129 { x: -46.5; y: -49.2; skew-x: -10000; skew-y: -10000; scale-x: 0.993; scale-y: 0.993; }
        frame 130 { x: -102.3; y: -51.3; skew-x: -108.4; skew-y: -108.4; scale-x: 0.994; scale-y: 0.994; }
        frame 131 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_innerleg_upper";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 124 { x: 43.5; y: -26; skew-x: -51.3; skew-y: -51.3; scale-x: 0.997; scale-y: 0.997; cel: 0; image: IMAGE_REANIM_ZOMBIE_IMP_INNERLEG_UPPER; }
        frame 125 { x: 31.8; y: -32.5; skew-x: -56.3; skew-y: -56.3; scale-x: 0.995; scale-y: 0.995; cel: -10000; image: none; }
        frame 126 { x: 20.1; y: -39.1; skew-x: -61.1; skew-y: -61.1; scale-x: -10000; scale-y: -10000; }
        frame 127 { x: 8.3; y: -45.8; skew-x: -66.1; skew-y: -66.1; }
        frame 128 { x: -3.2; y: -52.4; skew-x: -70.8; skew-y: -70.8; }
        frame 129 { x: -59; y: -54.5; skew-x: -70.9; skew-y: -70.9; scale-x: 0.994; scale-y: 0.994; }
        frame 130 { x: -114.9; y: -56.7; skew-x: -71; skew-y: -71; scale-x: 0.995; scale-y: 0.995; }
        frame 131 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_outerleg_foot";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 124 { x: 66.2; y: -18.6; skew-x: -90.2; skew-y: -90.2; scale-x: 0.999; scale-y: 0.999; cel: 0; image: IMAGE_REANIM_ZOMBIE_IMP_OUTERLEG_FOOT; }
        frame 125 { x: 54.8; y: -27; skew-x: -94.9; skew-y: -94.9; scale-x: 0.998; scale-y: 0.998; cel: -10000; image: none; }
        frame 126 { x: 43.4; y: -35.6; skew-x: -99.9; skew-y: -99.9; scale-x: 0.997; scale-y: 0.997; }
        frame 127 { x: 31.9; y: -44.2; skew-x: -104.7; skew-y: -104.7; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 20.6; y: -52.8; skew-x: -109.6; skew-y: -109.6; }
        frame 129 { x: -35.1; y: -55; skew-x: -109.7; skew-y: -109.7; scale-x: 0.996; scale-y: 0.996; }
        frame 130 { x: -90.9; y: -57.3; skew-x: -109.9; skew-y: -109.9; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_outerleg_lower";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 124 { x: 58.5; y: -26.3; skew-x: -66.9; skew-y: -66.9; scale-x: 0.996; scale-y: 0.996; cel: 0; image: IMAGE_REANIM_ZOMBIE_IMP_OUTERLEG_LOWER; }
        frame 125 { x: 46.4; y: -34; skew-x: -71.8; skew-y: -71.8; scale-x: 0.995; scale-y: 0.995; cel: -10000; image: none; }
        frame 126 { x: 34.4; y: -41.9; skew-x: -76.6; skew-y: -76.6; scale-x: -10000; scale-y: -10000; }
        frame 127 { x: 22.6; y: -49.7; skew-x: -81.6; skew-y: -81.6; }
        frame 128 { x: 10.7; y: -57.5; skew-x: -86.3; skew-y: -86.3; }
        frame 129 { x: -45; y: -59.6; skew-x: -86.6; skew-y: -86.6; scale-x: 0.994; scale-y: 0.994; }
        frame 130 { x: -100.8; y: -61.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: -10000; y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_outerleg_upper";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 124 { x: 50.3; y: -35.1; skew-x: -39; skew-y: -39; scale-x: 0.998; scale-y: 0.998; cel: 0; image: IMAGE_REANIM_ZOMBIE_IMP_OUTERLEG_UPPER; }
        frame 125 { x: 37.5; y: -42.1; skew-x: -43.8; skew-y: -43.8; scale-x: 0.996; scale-y: 0.996; cel: -10000; image: none; }
        frame 126 { x: 25; y: -49.1; skew-x: -48.8; skew-y: -48.8; scale-x: 0.995; scale-y: 0.995; }
        frame 127 { x: 12.5; y: -56.1; skew-x: -53.6; skew-y: -53.6; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -0; y: -63.2; skew-x: -58.5; skew-y: -58.5; scale-x: 0.996; scale-y: 0.996; }
        frame 129 { x: -55.8; y: -65.4; skew-x: -58.6; skew-y: -58.6; scale-x: 0.994; scale-y: 0.994; }
        frame 130 { x: -111.7; y: -67.5; skew-x: -58.7; skew-y: -58.7; scale-x: 0.995; scale-y: 0.995; }
        frame 131 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_body2";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 124 { x: 37.2; y: -30.2; skew-x: -50.8; skew-y: -50.8; scale-x: 0.997; scale-y: 0.997; cel: 0; image: IMAGE_REANIM_ZOMBIE_IMP_BODY2; }
        frame 125 { x: 25.1; y: -36.1; skew-x: -55.8; skew-y: -55.8; scale-x: 0.995; scale-y: 0.995; cel: -10000; image: none; }
        frame 126 { x: 13.1; y: -42; skew-x: -60.6; skew-y: -60.6; scale-x: -10000; scale-y: -10000; }
        frame 127 { x: 1.2; y: -48; skew-x: -65.6; skew-y: -65.6; scale-x: 0.994; scale-y: 0.994; }
        frame 128 { x: -10.5; y: -54.3; skew-x: -70.3; skew-y: -70.3; scale-x: 0.995; scale-y: 0.995; }
        frame 129 { x: -66.3; y: -56.4; skew-x: -70.6; skew-y: -70.6; scale-x: 0.994; scale-y: 0.994; }
        frame 130 { x: -122.2; y: -58.6; skew-x: -70.5; skew-y: -70.5; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_body1";
        frame-count: 197;
        frame 0 { x: 77.3; y: -45.6; skew-x: 14.8; skew-y: 14.4; scale-x: 0.973; scale-y: 0.998; image: IMAGE_REANIM_ZOMBIE_IMP_BODY1; }
        frame 1 { x: 75.8; y: -46; skew-x: 14.5; skew-y: 13.5; scale-x: 0.975; scale-y: -10000; image: none; }
        frame 2 { x: 74.3; y: -46.3; skew-x: 14.3; skew-y: 12.8; scale-x: 0.979; }
        frame 3 { x: 72.9; y: -46.6; skew-x: 14.1; skew-y: 12; scale-x: 0.982; }
        frame 4 { x: 71.3; y: -47; skew-x: 14; skew-y: 11.3; scale-x: 0.985; }
        frame 5 { x: 69.9; y: -47.4; skew-x: 13.8; skew-y: 10.5; scale-x: 0.988; }
        frame 6 { x: 68.5; y: -47.7; skew-x: 13.5; skew-y: 9.6; scale-x: 0.991; }
        frame 7 { x: 67; y: -48; skew-x: 13.3; skew-y: 8.8; scale-x: 0.995; }
        frame 8 { x: 65.6; y: -48.4; skew-x: -10000; skew-y: 8; scale-x: 0.998; }
        frame 9 { x: 64.1; y: -48.7; skew-x: 13; skew-y: 7.3; scale-x: 1.001; }
        frame 10 { x: 62.5; y: -49.1; skew-x: 12.9; skew-y: 6.6; scale-x: 1.005; scale-y: 0.999; }
        frame 11 { x: 63.8; y: -48.8; skew-x: 13; skew-y: 7.3; scale-x: 1.001; scale-y: 0.998; }
        frame 12 { x: 65.1; y: -48.4; skew-x: 13.1; skew-y: 8; scale-x: 0.998; scale-y: -10000; }
        frame 13 { x: 66.5; y: -48.2; skew-x: 13.3; skew-y: 8.6; scale-x: 0.995; }
        frame 14 { x: 67.8; y: -47.9; skew-x: 13.5; skew-y: 9.3; scale-x: 0.993; }
        frame 15 { x: 69.1; y: -47.5; skew-x: 13.6; skew-y: 10; scale-x: 0.99; }
        frame 16 { x: 70.5; y: -47.3; skew-x: 13.8; skew-y: 10.8; scale-x: 0.987; }
        frame 17 { x: 71.8; y: -47; skew-x: 14; skew-y: 11.5; scale-x: 0.984; }
        frame 18 { x: 73.1; y: -46.6; skew-x: 14.3; skew-y: 12.3; scale-x: 0.981; }
        frame 19 { x: 74.5; y: -46.3; skew-x: -10000; skew-y: 13; scale-x: 0.978; }
        frame 20 { x: 75.7; y: -46; skew-x: 14.5; skew-y: 13.6; scale-x: 0.975; scale-y: 0.997; }
        frame 21 { x: 77.3; y: -45.6; skew-x: 14.8; skew-y: 14.4; scale-x: 0.973; scale-y: 0.998; }
        frame 22 { x: 81.6; y: -47.6; skew-x: 18.4; skew-y: 18.4; scale-x: 0.999; scale-y: 0.999; }
        frame 23 { x: 86.3; y: -47.9; skew-x: 23.1; skew-y: 22.3; scale-x: 0.998; scale-y: 0.998; }
        frame 24 { x: 91; y: -48.3; skew-x: 27.8; skew-y: 26.5; scale-x: -10000; scale-y: 0.997; }
        frame 25 { x: 95.8; y: -48.6; skew-x: 32.4; skew-y: 30.6; scale-y: -10000; }
        frame 26 { x: 100.7; y: -48.7; skew-x: 37.1; skew-y: 34.6; scale-y: 0.996; }
        frame 27 { x: 105.8; y: -48.8; skew-x: 41.9; skew-y: 38.7; scale-x: 0.999; scale-y: 0.998; }
        frame 28 { x: 107.4; y: -48.4; skew-x: 42.4; skew-y: 39.8; scale-x: 0.991; scale-y: 0.996; }
        frame 29 { x: 109; y: -48.1; skew-x: 42.9; skew-y: 40.9; scale-x: 0.984; scale-y: -10000; }
        frame 30 { x: 110.6; y: -47.7; skew-x: 43.4; skew-y: 42.1; scale-x: 0.977; }
        frame 31 { x: 112.2; y: -47.4; skew-x: 43.9; skew-y: 43.1; scale-x: 0.971; }
        frame 32 { x: 113.7; y: -47; skew-x: 44.3; skew-y: 44.3; scale-x: 0.966; scale-y: 0.997; }
        frame 33 { x: 106.4; y: -47.7; skew-x: 43.1; skew-y: 40.9; scale-x: 0.96; scale-y: 0.995; }
        frame 34 { x: 98.7; y: -48.4; skew-x: 41.8; skew-y: 37.5; scale-x: 0.957; scale-y: -10000; }
        frame 35 { x: 78; y: -47.5; skew-x: 22.5; skew-y: 20.3; scale-x: 0.975; scale-y: 0.994; }
        frame 36 { x: 58.8; y: -44.8; skew-x: 3.3; skew-y: 3.3; scale-x: 0.996; scale-y: 0.996; }
        frame 37 { x: 56.8; y: -45.9; skew-x: 3.8; skew-y: 1.3; scale-x: 0.997; scale-y: 0.995; }
        frame 38 { x: 54.8; y: -47.2; skew-x: 4.4; skew-y: -0.6; scale-x: 0.999; scale-y: -10000; }
        frame 39 { x: 59.5; y: -47.6; skew-x: 7.3; skew-y: 3; scale-x: 0.998; }
        frame 40 { x: 64.3; y: -47.9; skew-x: 10.3; skew-y: 6.8; scale-x: 0.997; }
        frame 41 { x: 69.1; y: -48.3; skew-x: 13.3; skew-y: 10.6; scale-x: 0.996; }
        frame 42 { x: 71.8; y: -48.6; skew-x: 14.8; skew-y: 11.5; scale-x: -10000; }
        frame 43 { x: 74.4; y: -48.9; skew-x: 16.3; skew-y: 12.5; scale-x: 0.997; }
        frame 44 { x: 77.1; y: -49.2; skew-x: 18; skew-y: 13.6; scale-x: -10000; scale-y: 0.994; }
        frame 45 { x: 79.7; y: -49.6; skew-x: 19.6; skew-y: 14.6; scale-x: 0.998; scale-y: -10000; }
        frame 46 { x: 82.6; y: -50; skew-x: 21.2; skew-y: 15.7; scale-x: 1; scale-y: 0.995; }
        frame 47 { x: 86.3; y: -50.1; skew-x: 24.6; skew-y: 20; scale-x: 0.997; scale-y: 0.994; }
        frame 48 { x: 90; y: -10000; skew-x: 28.1; skew-y: 24.3; scale-x: 0.996; scale-y: 0.993; }
        frame 49 { x: 93.7; y: -50; skew-x: 31.6; skew-y: 28.6; scale-x: 0.995; scale-y: -10000; }
        frame 50 { x: 97.6; y: -49.9; skew-x: 35.1; skew-y: 33.1; scale-x: 0.994; }
        frame 51 { x: 101; y: -49.6; skew-x: 38.6; skew-y: 37.4; scale-x: -10000; scale-y: 0.994; }
        frame 52 { x: 105.5; y: -49.3; skew-x: 43.6; skew-y: 39.9; scale-x: 0.998; scale-y: 0.992; }
        frame 53 { x: 110.1; y: -49.2; skew-x: 48.9; skew-y: 42.4; scale-x: 1.004; scale-y: -10000; }
        frame 54 { x: 114.7; y: -48.7; skew-x: 53.9; skew-y: 45.1; scale-x: 1.011; }
        frame 55 { x: 119.5; y: -48.3; skew-x: 59.2; skew-y: 47.6; scale-x: 1.017; }
        frame 56 { x: 124.2; y: -47.8; skew-x: 64.3; skew-y: 50.1; scale-x: 1.024; scale-y: 0.993; }
        frame 57 { x: 112; y: -10000; skew-x: 54.1; skew-y: 45.1; scale-x: 1.008; scale-y: 0.991; }
        frame 58 { x: 100.1; y: -47.2; skew-x: 43.9; skew-y: 40.2; scale-x: 0.995; scale-y: 0.993; }
        frame 59 { x: 79.3; y: -48.3; skew-x: 27; skew-y: 22.1; scale-x: 0.997; scale-y: -10000; }
        frame 60 { x: 59.8; y: -47.6; skew-x: 10.1; skew-y: 4.1; scale-x: 1.001; scale-y: 0.996; }
        frame 61 { x: 57.7; y: -50; skew-x: 12.8; skew-y: 3.5; scale-x: 1.009; scale-y: 0.995; }
        frame 62 { x: 55.9; y: -52.5; skew-x: 15.7; skew-y: 3.3; scale-x: 1.019; scale-y: -10000; }
        frame 63 { x: 60.8; y: -52.6; skew-x: 17.8; skew-y: 4.3; scale-x: 1.024; }
        frame 64 { x: 65.8; y: -52.8; skew-x: 20; skew-y: 5.3; scale-x: 1.029; }
        frame 65 { x: 70.7; y: -52.9; skew-x: 22.3; skew-y: 6.3; scale-x: 1.036; scale-y: 0.996; }
        frame 66 { x: 72.8; y: -52; skew-x: 21.3; skew-y: 8.6; scale-x: 1.027; scale-y: -10000; }
        frame 67 { x: 74.9; y: -50.8; skew-x: 20.6; skew-y: 11; scale-x: 1.02; scale-y: 0.997; }
        frame 68 { x: 77.2; y: -49.8; skew-x: 19.8; skew-y: 13.5; scale-x: 1.013; scale-y: -10000; }
        frame 69 { x: 79.2; y: -48.5; skew-x: 19.1; skew-y: 15.8; scale-x: 1.005; scale-y: 0.998; }
        frame 70 { x: 81.6; y: -47.6; skew-x: 18.4; skew-y: 18.4; scale-x: 0.999; scale-y: 0.999; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 88.7; y: -44.6; skew-x: 23.5; skew-y: 23.5; scale-x: 0.997; scale-y: 0.997; }
        frame 73 { x: 95.9; y: -41.4; skew-x: 28.6; skew-y: 28.6; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 103.3; y: -38.1; skew-x: 33.8; skew-y: 33.8; }
        frame 75 { x: 110.7; y: -34.6; skew-x: 38.9; skew-y: 38.9; scale-x: 0.996; scale-y: 0.996; }
        frame 76 { x: 118.2; y: -31.1; skew-x: 44.1; skew-y: 44.1; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 125.6; y: -27.3; skew-x: 49.1; skew-y: 49.1; }
        frame 78 { x: 133.2; y: -23.4; skew-x: 54.4; skew-y: 54.4; scale-x: 0.995; scale-y: 0.995; }
        frame 79 { x: 140.7; y: -19.4; skew-x: 59.4; skew-y: 59.4; scale-x: 0.997; scale-y: 0.997; }
        frame 80 { x: 144; y: -15.1; skew-x: 62.9; skew-y: 62.9; scale-x: 0.995; scale-y: 0.995; }
        frame 81 { x: 147.2; y: -10.7; skew-x: 66.2; skew-y: 66.2; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 150.4; y: -6.1; skew-x: 69.5; skew-y: 69.5; }
        frame 83 { x: 153.7; y: -1.6; skew-x: 72.9; skew-y: 72.9; }
        frame 84 { x: 156.8; y: 2.8; skew-x: 76.2; skew-y: 76.2; }
        frame 85 { x: 160.1; y: 7.5; skew-x: 79.6; skew-y: 79.6; }
        frame 86 { x: 152.2; y: -3.8; skew-x: 72.2; skew-y: 72.2; scale-x: 0.993; scale-y: 0.993; }
        frame 87 { x: 144.1; y: -14.9; skew-x: 64.7; skew-y: 64.7; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 132; y: -27.1; skew-x: 52.9; skew-y: 52.9; scale-x: 0.992; scale-y: 0.992; }
        frame 89 { x: 119.8; y: -38.7; skew-x: 41.2; skew-y: 41.2; scale-x: 0.993; scale-y: 0.993; }
        frame 90 { x: 70.9; y: -51.3; skew-x: 7.3; skew-y: 7.3; scale-x: 0.992; scale-y: 0.992; }
        frame 91 { x: 30; y: -45.4; skew-x: -14.7; skew-y: -14.7; scale-x: 0.99; scale-y: 0.99; }
        frame 92 { x: 10; y: -38.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 93 { y: -37.2; }
        frame 94 { y: -36.2; }
        frame 95 { x: -10000; y: -37.2; }
        frame 96 { y: -38.2; }
        frame 97 { x: 19.9; y: -39.8; skew-x: -9.9; skew-y: -9.9; scale-x: 0.991; scale-y: 0.991; }
        frame 98 { x: 29.8; y: -41.3; skew-x: -5.2; skew-y: -5.2; scale-x: 0.993; scale-y: 0.993; }
        frame 99 { x: 40; y: -42.8; skew-x: -0.4; skew-y: -0.4; scale-x: 0.994; scale-y: 0.994; }
        frame 100 { x: 50; y: -44.1; skew-x: 4; skew-y: 4; scale-x: 0.995; scale-y: 0.995; }
        frame 101 { x: 60.5; y: -45.5; skew-x: 8.8; skew-y: 8.8; scale-x: 0.996; scale-y: 0.996; }
        frame 102 { x: 70.9; y: -46.6; skew-x: 13.5; skew-y: 13.5; scale-x: 0.997; scale-y: 0.997; }
        frame 103 { x: 81.6; y: -47.6; skew-x: 18.4; skew-y: 18.4; scale-x: 0.999; scale-y: 0.999; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 80; y: -47.5; skew-x: 16.8; skew-y: 16.8; scale-x: 0.997; scale-y: 0.997; }
        frame 106 { x: 78.3; y: -47.6; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 76.8; y: -47.5; skew-x: 13.6; skew-y: 13.6; scale-x: 0.996; scale-y: 0.996; }
        frame 108 { x: 75.3; y: -47.4; skew-x: 12.1; skew-y: 12.1; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: 73.7; y: -10000; skew-x: 10.5; skew-y: 10.5; scale-x: 0.995; scale-y: 0.995; }
        frame 110 { x: 72.1; skew-x: 9; skew-y: 9; scale-x: 0.994; scale-y: 0.994; }
        frame 111 { x: 70.6; y: -47.2; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 69; y: -47.4; skew-x: 5.9; skew-y: 5.9; }
        frame 113 { x: 64; y: -47; skew-x: 2.8; skew-y: 2.8; scale-x: 0.993; scale-y: 0.993; }
        frame 114 { x: 59.1; y: -46.7; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 54.3; y: -46.2; skew-x: -3.4; skew-y: -3.4; }
        frame 116 { x: 49.5; y: -45.7; skew-x: -6.7; skew-y: -6.7; }
        frame 117 { x: 44.7; y: -45.2; skew-x: -9.8; skew-y: -9.8; }
        frame 118 { x: 39.1; y: -45.3; skew-x: -12.7; skew-y: -12.7; scale-x: 0.992; scale-y: 0.992; }
        frame 119 { x: 33.6; y: -45.4; skew-x: -15.5; skew-y: -15.5; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 28.1; y: -45.3; skew-x: -18.4; skew-y: -18.4; scale-x: 0.991; scale-y: 0.991; }
        frame 121 { x: 22.7; y: -10000; skew-x: -21.4; skew-y: -21.4; scale-x: 0.992; scale-y: 0.992; }
        frame 122 { x: -10000; y: -45.4; skew-x: -21.2; skew-y: -21.2; scale-x: 0.991; scale-y: 0.991; }
        frame 123 { y: -45.3; skew-x: -21.4; skew-y: -21.4; scale-x: 0.992; scale-y: 0.992; }
        frame 124 { x: 9.5; y: -47.3; skew-x: -30.2; skew-y: -30.2; scale-x: 0.99; scale-y: 0.99; }
        frame 125 { x: -3.2; y: -49.4; skew-x: -39; skew-y: -39; scale-x: 0.989; scale-y: 0.989; }
        frame 126 { x: -15.3; y: -51.4; skew-x: -48; skew-y: -48; scale-x: 0.988; scale-y: 0.988; }
        frame 127 { x: -27.2; y: -53.7; skew-x: -56.8; skew-y: -56.8; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -38.5; y: -56.1; skew-x: -65.7; skew-y: -65.7; }
        frame 129 { x: -94.2; y: -58.2; skew-x: -65.8; skew-y: -65.8; scale-x: 0.987; scale-y: 0.987; }
        frame 130 { x: -150.1; y: -60.3; skew-x: -65.9; skew-y: -65.9; scale-x: 0.988; scale-y: 0.988; }
        frame 131 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
        frame 138 { x: 77.3; y: -45.6; skew-x: 14.8; skew-y: 14.4; scale-x: 0.973; scale-y: 0.998; cel: 0; }
        frame 139 { x: 81; y: -40.4; skew-x: 16.6; skew-y: 16.3; scale-x: 0.972; scale-y: 0.997; cel: -10000; }
        frame 140 { x: 84.6; y: -35.2; skew-x: 18.6; skew-y: 18.3; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: 88.4; y: -30.1; skew-x: 20.6; skew-y: 20.2; scale-x: 0.973; scale-y: 0.998; }
        frame 142 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 143 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_head";
        frame-count: 197;
        frame 0 { x: 66.6; y: -60.8; image: IMAGE_REANIM_ZOMBIE_IMP_HEAD; }
        frame 1 { x: 65.6; y: -61.6; skew-x: 1.5; skew-y: 1.5; image: none; }
        frame 2 { x: 64.7; y: -62.4; skew-x: 3; skew-y: 3; scale-x: 0.999; scale-y: 0.999; }
        frame 3 { x: 63.8; y: -63.3; skew-x: 4.7; skew-y: 4.7; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 62; y: -10000; skew-x: 3.5; skew-y: 3.5; }
        frame 5 { x: 60.3; y: -63.2; skew-x: 2.3; skew-y: 2.3; }
        frame 6 { x: 58.6; y: -10000; skew-x: 1.3; skew-y: 1.3; }
        frame 7 { x: 57; y: -63.1; skew-x: 0; skew-y: 0; }
        frame 8 { x: 55.4; y: -10000; skew-x: -0.7; skew-y: -0.7; }
        frame 9 { x: 53.6; y: -63; skew-x: -1.9; skew-y: -1.9; }
        frame 10 { x: 52; y: -62.9; skew-x: -3.1; skew-y: -3.1; }
        frame 11 { x: 52.6; y: -61.5; skew-x: -4.7; skew-y: -4.7; }
        frame 12 { x: 53; y: -60.2; skew-x: -6.4; skew-y: -6.4; }
        frame 13 { x: 53.5; y: -58.8; skew-x: -8.2; skew-y: -8.2; }
        frame 14 { x: 55; y: -59; skew-x: -7.2; skew-y: -7.2; }
        frame 15 { x: 56.8; y: -59.4; skew-x: -6; skew-y: -6; }
        frame 16 { x: 58.4; y: -59.6; skew-x: -4.9; skew-y: -4.9; }
        frame 17 { x: 60; y: -59.9; skew-x: -3.9; skew-y: -3.9; }
        frame 18 { x: 61.7; y: -60.1; skew-x: -2.9; skew-y: -2.9; }
        frame 19 { x: 63.3; y: -60.4; skew-x: -1.9; skew-y: -1.9; scale-x: 1; scale-y: 1; }
        frame 20 { x: 65; y: -60.6; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 66.6; y: -60.8; skew-x: 0; skew-y: 0; }
        frame 22 { x: 73; y: -62.7; skew-x: 3.8; skew-y: 3.8; }
        frame 23 { x: 78.6; y: -63.6; skew-x: 8; skew-y: 8; scale-x: 0.999; scale-y: 0.999; }
        frame 24 { x: 84.3; y: -64.3; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 90; y: -64.8; skew-x: 16.5; skew-y: 16.5; scale-x: 0.998; scale-y: 0.998; }
        frame 26 { x: 95.8; y: -65.3; skew-x: 20.8; skew-y: 20.8; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 101.8; y: -65.6; skew-x: 25.1; skew-y: 25.1; scale-x: 0.999; scale-y: 0.999; }
        frame 28 { x: 104.3; y: -65.7; skew-x: 27.1; skew-y: 27.1; scale-x: 0.997; scale-y: 0.997; }
        frame 29 { x: 107; y: -65.8; skew-x: 29.1; skew-y: 29.1; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 109.6; y: -10000; skew-x: 31.1; skew-y: 31.1; }
        frame 31 { x: 112.2; skew-x: 33.1; skew-y: 33.1; }
        frame 32 { x: 114.7; y: -65.9; skew-x: 35; skew-y: 35; scale-x: 0.998; scale-y: 0.998; }
        frame 33 { x: 106.8; y: -65.7; skew-x: 34.1; skew-y: 34.1; scale-x: 0.995; scale-y: 0.995; }
        frame 34 { x: 99.1; y: -10000; skew-x: 33.2; skew-y: 33.2; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 72.4; y: -63.7; skew-x: 12.3; skew-y: 12.3; scale-x: 0.994; scale-y: 0.994; }
        frame 36 { x: 47.5; y: -58.9; skew-x: -8.5; skew-y: -8.5; scale-x: 0.995; scale-y: 0.995; }
        frame 37 { x: 44; y: -57; skew-x: -12.9; skew-y: -12.9; scale-x: 0.994; scale-y: 0.994; }
        frame 38 { x: 40.5; y: -54.8; skew-x: -17.5; skew-y: -17.5; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 46.9; y: -58; skew-x: -10.7; skew-y: -10.7; }
        frame 40 { x: 53.7; y: -61; skew-x: -3.7; skew-y: -3.7; }
        frame 41 { x: 60.8; y: -63.8; skew-x: 2.8; skew-y: 2.8; scale-x: 0.995; scale-y: 0.995; }
        frame 42 { x: 64; y: -64.2; skew-x: 4.3; skew-y: 4.3; scale-x: 0.994; scale-y: 0.994; }
        frame 43 { x: 67.1; y: -64.6; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 70.4; y: -65; skew-x: 7.3; skew-y: 7.3; }
        frame 45 { x: 73.6; y: -65.5; skew-x: 8.8; skew-y: 8.8; }
        frame 46 { x: 76.8; y: -65.7; skew-x: 10.2; skew-y: 10.2; }
        frame 47 { x: 81.8; y: -66.5; skew-x: 15.3; skew-y: 15.3; scale-x: 0.993; scale-y: 0.993; }
        frame 48 { x: 87.2; y: -67.2; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 92.5; y: -67.7; skew-x: 25.8; skew-y: 25.8; scale-x: 0.992; scale-y: 0.992; }
        frame 50 { x: 97.9; y: -67.9; skew-x: 31.1; skew-y: 31.1; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 103.3; y: -68.1; skew-x: 36.3; skew-y: 36.3; scale-x: 0.993; scale-y: 0.993; }
        frame 52 { x: 108.6; y: -67; skew-x: 39.6; skew-y: 39.6; scale-x: 0.991; scale-y: 0.991; }
        frame 53 { x: 114; y: -66; skew-x: 43.1; skew-y: 43.1; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 119.2; y: -64.7; skew-x: 46.4; skew-y: 46.4; }
        frame 55 { x: 124.6; y: -63.5; skew-x: 49.7; skew-y: 49.7; scale-x: 0.99; scale-y: 0.99; }
        frame 56 { x: 129.8; y: -62.1; skew-x: 53; skew-y: 53; scale-x: 0.992; scale-y: 0.992; }
        frame 57 { x: 117.3; y: -63.7; skew-x: 46.6; skew-y: 46.6; scale-x: 0.99; scale-y: 0.99; }
        frame 58 { x: 104.8; y: -65.4; skew-x: 40.4; skew-y: 40.4; scale-x: 0.991; scale-y: 0.991; }
        frame 59 { x: 75.1; y: -64.2; skew-x: 15.8; skew-y: 15.8; scale-x: 0.993; scale-y: 0.993; }
        frame 60 { x: 47.5; y: -58.9; skew-x: -8.5; skew-y: -8.5; scale-x: 0.995; scale-y: 0.995; }
        frame 61 { x: 44; y: -57; skew-x: -12.9; skew-y: -12.9; scale-x: 0.994; scale-y: 0.994; }
        frame 62 { x: 40.5; y: -54.8; skew-x: -17.5; skew-y: -17.5; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 46.3; y: -56.1; skew-x: -13.9; skew-y: -13.9; }
        frame 64 { x: 52.1; y: -57.4; skew-x: -10.4; skew-y: -10.4; }
        frame 65 { x: 58.1; y: -58.8; skew-x: -6.9; skew-y: -6.9; scale-x: 0.995; scale-y: 0.995; }
        frame 66 { x: 61; y: -59.6; skew-x: -4.7; skew-y: -4.7; scale-x: 0.996; scale-y: 0.996; }
        frame 67 { x: 64; y: -60.6; skew-x: -2.4; skew-y: -2.4; scale-x: 0.997; scale-y: 0.997; }
        frame 68 { x: 67; y: -61.3; skew-x: -0.4; skew-y: -0.4; scale-x: 0.998; scale-y: 0.998; }
        frame 69 { x: 70; y: -62.2; skew-x: 1.5; skew-y: 1.5; scale-x: 0.999; scale-y: 0.999; }
        frame 70 { x: 73; y: -62.7; skew-x: 3.8; skew-y: 3.8; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 82.4; y: -60.4; skew-x: 10.3; skew-y: 10.3; scale-x: 0.999; scale-y: 0.999; }
        frame 73 { x: 92.2; y: -57.8; skew-x: 17; skew-y: 17; scale-x: 0.998; scale-y: 0.998; }
        frame 74 { x: 101.9; y: -54.9; skew-x: 23.6; skew-y: 23.6; scale-x: 0.997; scale-y: 0.997; }
        frame 75 { x: 111.8; y: -51.6; skew-x: 30.1; skew-y: 30.1; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 121.9; y: -48; skew-x: 36.8; skew-y: 36.8; scale-x: 0.996; scale-y: 0.996; }
        frame 77 { x: 131.9; y: -44.2; skew-x: 43.4; skew-y: 43.4; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 142; y: -39.8; skew-x: 50.1; skew-y: 50.1; scale-x: 0.995; scale-y: 0.995; }
        frame 79 { x: 152.1; y: -35.2; skew-x: 56.7; skew-y: 56.7; scale-x: 0.997; scale-y: 0.997; }
        frame 80 { x: 157.9; y: -29.4; skew-x: 62.9; skew-y: 62.9; scale-x: 0.995; scale-y: 0.995; }
        frame 81 { x: 163.6; y: -23.3; skew-x: 69; skew-y: 69; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 169.1; y: -16.9; skew-x: 75.2; skew-y: 75.2; }
        frame 83 { x: 174.6; y: -10.3; skew-x: 81.4; skew-y: 81.4; }
        frame 84 { x: 179.8; y: -3.5; skew-x: 87.5; skew-y: 87.5; }
        frame 85 { x: 184.8; y: 3.3; skew-x: 93.6; skew-y: 93.6; }
        frame 86 { x: 176.3; y: -10.2; skew-x: 87.7; skew-y: 87.7; scale-x: 0.993; scale-y: 0.993; }
        frame 87 { x: 167.4; y: -23.6; skew-x: 81.5; skew-y: 81.5; scale-x: 0.992; scale-y: 0.992; }
        frame 88 { x: 149.5; y: -41.7; skew-x: 64.7; skew-y: 64.7; scale-x: 0.991; scale-y: 0.991; }
        frame 89 { x: 130.8; y: -57.8; skew-x: 47.7; skew-y: 47.7; scale-x: 0.992; scale-y: 0.992; }
        frame 90 { x: 61.2; y: -66.2; skew-x: 0.6; skew-y: 0.6; scale-x: 0.99; scale-y: 0.99; }
        frame 91 { x: 15.7; y: -50.5; skew-x: -26.9; skew-y: -26.9; scale-x: 0.987; scale-y: 0.987; }
        frame 92 { x: -4.6; y: -41.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -10000; y: -39.7; scale-x: 0.986; scale-y: 0.986; }
        frame 94 { y: -38.1; scale-x: 0.987; scale-y: 0.987; }
        frame 95 { x: -4.5; y: -39.7; scale-x: 0.986; scale-y: 0.986; }
        frame 96 { x: -4.6; y: -41.3; scale-x: 0.987; scale-y: 0.987; }
        frame 97 { x: 6; y: -44.6; skew-x: -22.5; skew-y: -22.5; scale-x: 0.988; scale-y: 0.988; }
        frame 98 { x: 16.9; y: -48; skew-x: -18; skew-y: -18; scale-x: 0.99; scale-y: 0.99; }
        frame 99 { x: 27.7; y: -51.1; skew-x: -13.7; skew-y: -13.7; scale-x: 0.992; scale-y: 0.992; }
        frame 100 { x: 39; y: -54.2; skew-x: -9.2; skew-y: -9.2; scale-x: 0.994; scale-y: 0.994; }
        frame 101 { x: 50.1; y: -57.2; skew-x: -4.9; skew-y: -4.9; scale-x: 0.996; scale-y: 0.996; }
        frame 102 { x: 61.5; y: -60.2; skew-x: -0.4; skew-y: -0.4; scale-x: 0.998; scale-y: 0.998; }
        frame 103 { x: 73; y: -62.7; skew-x: 3.8; skew-y: 3.8; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 71.8; y: -63; skew-x: 3.6; skew-y: 3.6; scale-x: 0.999; scale-y: 0.999; }
        frame 106 { x: 70.5; y: -63.5; skew-x: 3.5; skew-y: 3.5; scale-x: 0.998; scale-y: 0.998; }
        frame 107 { x: 69.3; y: -63.8; skew-x: -10000; skew-y: -10000; scale-x: 0.997; scale-y: 0.997; }
        frame 108 { x: 68; y: -64.2; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: 66.8; y: -64.6; skew-x: -10000; skew-y: -10000; scale-x: 0.996; scale-y: 0.996; }
        frame 110 { x: 65.5; y: -65; scale-x: 0.995; scale-y: 0.995; }
        frame 111 { x: 64.3; y: -65.4; scale-x: 0.994; scale-y: 0.994; }
        frame 112 { x: 63.2; y: -65.7; skew-x: 3.2; skew-y: 3.2; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 57.2; y: -65.4; skew-x: 1; skew-y: 1; scale-x: 0.993; scale-y: 0.993; }
        frame 114 { x: 51.4; y: -65.1; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 45.6; y: -64.8; skew-x: -3.2; skew-y: -3.2; scale-x: 0.992; scale-y: 0.992; }
        frame 116 { x: 39.9; y: -64.4; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 34; y: -63.9; skew-x: -7.5; skew-y: -7.5; scale-x: 0.991; scale-y: 0.991; }
        frame 118 { x: 27.6; y: -63.3; skew-x: -10.4; skew-y: -10.4; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 21.2; y: -62.7; skew-x: -13.2; skew-y: -13.2; scale-x: 0.99; scale-y: 0.99; }
        frame 120 { x: 14.7; y: -62.1; skew-x: -16.2; skew-y: -16.2; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 8.4; y: -61.5; skew-x: -19.1; skew-y: -19.1; scale-x: 0.991; scale-y: 0.991; }
        frame 122 { x: 9.7; y: -63.6; skew-x: -15.2; skew-y: -15.2; scale-x: 0.99; scale-y: 0.99; }
        frame 123 { x: 11.1; y: -65.7; skew-x: -11.3; skew-y: -11.3; scale-x: -10000; scale-y: -10000; }
        frame 124 { x: -4.2; y: -65.6; skew-x: -19.2; skew-y: -19.2; scale-x: 0.989; scale-y: 0.989; }
        frame 125 { x: -19.5; y: -65.3; skew-x: -27.2; skew-y: -27.2; scale-x: 0.988; scale-y: 0.988; }
        frame 126 { x: -34.2; y: -64.9; skew-x: -35.3; skew-y: -35.3; scale-x: 0.987; scale-y: 0.987; }
        frame 127 { x: -48.4; y: -64.3; skew-x: -43.3; skew-y: -43.3; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -62.3; y: -63.9; skew-x: -51.4; skew-y: -51.4; scale-x: 0.988; scale-y: 0.988; }
        frame 129 { x: -118.1; y: -65.9; skew-x: -51.5; skew-y: -51.5; scale-x: 0.986; scale-y: 0.986; }
        frame 130 { x: -173.9; y: -68; skew-x: -51.6; skew-y: -51.6; scale-x: 0.987; scale-y: 0.987; }
        frame 131 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
        frame 138 { x: 66.6; y: -60.8; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: 0; }
        frame 139 { x: 71; y: -55.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 140 { x: 75.3; y: -50.7; }
        frame 141 { x: 79.8; y: -45.6; }
        frame 142 { x: 85.9; y: -31.6; }
        frame 143 { x: 92; y: -17.6; }
        frame 144 { x: 98.2; y: -3.6; }
        frame 145 { x: -10000; y: -10000; cel: -1; }
        frame 146 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_jaw";
        frame-count: 197;
        frame 0 { x: 73.1; y: -39.1; image: IMAGE_REANIM_ZOMBIE_IMP_JAW; }
        frame 1 { x: 71.5; y: -40.1; skew-x: 1.3; skew-y: 1.3; image: none; }
        frame 2 { x: 70; y: -41; skew-x: 2.5; skew-y: 2.5; scale-x: 0.999; scale-y: 0.999; }
        frame 3 { x: 68.3; y: -41.9; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 67; y: -41.6; skew-x: 2.3; skew-y: 2.3; }
        frame 5 { x: 65.8; y: -41.2; skew-x: 0.8; skew-y: 0.8; }
        frame 6 { x: 64.6; y: -41.1; skew-x: -0.2; skew-y: -0.2; scale-x: 1; scale-y: 1; }
        frame 7 { x: 63.3; y: -40.7; skew-x: -1.7; skew-y: -1.7; scale-x: 0.999; scale-y: 0.999; }
        frame 8 { x: 62; y: -40.4; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 60.8; y: -40.1; skew-x: -4.4; skew-y: -4.4; }
        frame 10 { x: 59.4; y: -39.8; skew-x: -5.9; skew-y: -5.9; scale-x: 1; scale-y: 1; }
        frame 11 { x: 60.5; y: -38.1; skew-x: -7.9; skew-y: -7.9; scale-x: 0.999; scale-y: 0.999; }
        frame 12 { x: 61.5; y: -36.5; skew-x: -10.2; skew-y: -10.2; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 62.5; y: -34.9; skew-x: -12.3; skew-y: -12.3; }
        frame 14 { x: 63.9; y: -35.5; skew-x: -10.7; skew-y: -10.7; scale-x: 0.998; scale-y: 0.998; }
        frame 15 { x: 65.1; y: -36; skew-x: -9.2; skew-y: -9.2; scale-x: 0.999; scale-y: 0.999; }
        frame 16 { x: 66.5; y: -36.6; skew-x: -7.5; skew-y: -7.5; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 67.8; y: -37.1; skew-x: -5.9; skew-y: -5.9; }
        frame 18 { x: 69.1; y: -37.6; skew-x: -4.4; skew-y: -4.4; }
        frame 19 { x: 70.3; y: -38.1; skew-x: -2.9; skew-y: -2.9; scale-x: 1; scale-y: 1; }
        frame 20 { x: 71.7; y: -38.6; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 73.1; y: -39.1; skew-x: 0; skew-y: 0; }
        frame 22 { x: 78; y: -10000; skew-x: 0.6; skew-y: 3.8; scale-x: 1.001; }
        frame 23 { x: 81.3; y: -38.9; skew-x: 3.1; skew-y: 6.6; scale-x: -10000; scale-y: 0.999; }
        frame 24 { x: 84.7; y: -38.8; skew-x: 5.8; skew-y: 9.5; scale-y: -10000; }
        frame 25 { x: 88.2; y: -38.5; skew-x: 8.3; skew-y: 12.5; scale-y: 0.998; }
        frame 26 { x: 91.6; y: -38.4; skew-x: 11; skew-y: 15.3; scale-y: -10000; }
        frame 27 { x: 95.1; y: -38.2; skew-x: 13.7; skew-y: 18.3; scale-x: 1.002; }
        frame 28 { x: 96.7; y: -10000; skew-x: 14.8; skew-y: 19.3; scale-x: 1.001; scale-y: 0.997; }
        frame 29 { x: 98.2; skew-x: 15.8; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 99.8; skew-x: 17; skew-y: 21.8; scale-x: 1; }
        frame 31 { x: 101.3; skew-x: 18.3; skew-y: 22.8; scale-x: -10000; }
        frame 32 { x: 102.9; y: -38.1; skew-x: 19.4; skew-y: 24.1; scale-x: 1.001; scale-y: 0.998; }
        frame 33 { x: 95.6; y: -39.9; skew-x: 21; skew-y: 25.5; scale-x: 0.999; scale-y: 0.995; }
        frame 34 { x: 88.2; y: -41.9; skew-x: 22.6; skew-y: 26.9; scale-x: 0.998; scale-y: -10000; }
        frame 35 { x: 71.6; y: -38.6; skew-x: 1.3; skew-y: 5.8; scale-x: -10000; scale-y: 0.994; }
        frame 36 { x: 56.8; y: -34; skew-x: -19.7; skew-y: -15.1; scale-y: 0.995; }
        frame 37 { x: 55; y: -32.7; skew-x: -23.2; skew-y: -18.7; scale-x: 0.996; scale-y: 0.993; }
        frame 38 { x: 53.4; y: -31.5; skew-x: -26.8; skew-y: -22.2; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 57.1; y: -34.4; skew-x: -19; skew-y: -14.4; }
        frame 40 { x: 61; y: -37.1; skew-x: -11.4; skew-y: -6.7; }
        frame 41 { x: 65.1; y: -39.8; skew-x: -3.8; skew-y: 0.7; scale-x: 0.997; scale-y: 0.994; }
        frame 42 { x: 67.6; y: -40.2; skew-x: -2.2; skew-y: 2.1; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 70.2; y: -40.5; skew-x: -0.7; skew-y: 3.5; }
        frame 44 { x: 72.8; y: -40.8; skew-x: 0.5; skew-y: 5; scale-y: 0.993; }
        frame 45 { x: 75.5; y: -41.2; skew-x: 2; skew-y: 6.5; scale-y: -10000; }
        frame 46 { x: 78.1; y: -41.5; skew-x: 3.5; skew-y: 8.1; scale-y: 0.994; }
        frame 47 { x: 80.7; y: -41.7; skew-x: 6.8; skew-y: 11.5; scale-x: 0.996; scale-y: 0.993; }
        frame 48 { x: 83.3; y: -41.8; skew-x: 10.1; skew-y: 14.8; scale-x: 0.995; scale-y: 0.992; }
        frame 49 { x: 85.9; y: -42; skew-x: 13.5; skew-y: 18.1; scale-x: -10000; scale-y: 0.991; }
        frame 50 { x: 88.6; y: -42.1; skew-x: 16.8; skew-y: 21.6; scale-x: 0.994; scale-y: -10000; }
        frame 51 { x: 91.3; y: -10000; skew-x: 20.3; skew-y: 25; scale-x: 0.995; }
        frame 52 { x: 94.9; y: -41.5; skew-x: 22.3; skew-y: 27; scale-x: 0.993; scale-y: 0.99; }
        frame 53 { x: 98.5; y: -40.7; skew-x: 24.3; skew-y: 29.1; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 102; y: -40.1; skew-x: 26.3; skew-y: 31.1; scale-y: 0.989; }
        frame 55 { x: 105.6; y: -39.4; skew-x: 28.3; skew-y: 33.1; scale-x: 0.992; scale-y: -10000; }
        frame 56 { x: 109.2; y: -38.7; skew-x: 30.5; skew-y: 35.1; scale-x: 0.993; scale-y: 0.99; }
        frame 57 { x: 100.3; y: -39.8; skew-x: 27; skew-y: 31.6; scale-x: -10000; scale-y: 0.989; }
        frame 58 { x: 91.1; y: -40.9; skew-x: 23.5; skew-y: 28.1; scale-x: 0.994; scale-y: 0.991; }
        frame 59 { x: 73; y: -37.9; skew-x: 1.8; skew-y: 6.3; scale-x: 0.996; scale-y: 0.993; }
        frame 60 { x: 56.8; y: -34; skew-x: -19.7; skew-y: -15.1; scale-x: 0.998; scale-y: 0.995; }
        frame 61 { x: 55; y: -32.7; skew-x: -23.2; skew-y: -18.7; scale-x: 0.996; scale-y: 0.993; }
        frame 62 { x: 53.4; y: -31.5; skew-x: -26.8; skew-y: -22.2; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 57.9; y: -32.5; skew-x: -22.5; skew-y: -18.2; scale-x: 0.995; }
        frame 64 { x: 62.4; y: -33.7; skew-x: -18.2; skew-y: -14.2; scale-x: 0.996; }
        frame 65 { x: 67; y: -34.7; skew-x: -14.2; skew-y: -10.1; scale-x: 0.997; scale-y: 0.994; }
        frame 66 { x: 69.1; y: -35.6; skew-x: -11.2; skew-y: -7.2; scale-x: -10000; scale-y: 0.995; }
        frame 67 { x: 71.2; y: -36.6; skew-x: -8.2; skew-y: -4.4; scale-x: 0.998; scale-y: 0.996; }
        frame 68 { x: 73.5; y: -37.4; skew-x: -5.2; skew-y: -1.7; scale-x: 0.999; scale-y: 0.998; }
        frame 69 { x: 75.7; y: -38.4; skew-x: -2.2; skew-y: 0.8; scale-x: 1; scale-y: 0.999; }
        frame 70 { x: 78; y: -39.1; skew-x: 0.6; skew-y: 3.8; scale-x: 1.001; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 84.5; y: -36.6; skew-x: 5.8; skew-y: 9; scale-y: 0.999; }
        frame 73 { x: 91; y: -34.2; skew-x: 11.3; skew-y: 14.3; scale-x: 1; scale-y: 0.998; }
        frame 74 { x: 97.8; y: -31.6; skew-x: 16.5; skew-y: 19.8; scale-x: 0.999; scale-y: 0.997; }
        frame 75 { x: 104.5; y: -28.8; skew-x: 21.8; skew-y: 25.1; scale-x: 0.998; scale-y: -10000; }
        frame 76 { x: 111.4; y: -26; skew-x: 27.1; skew-y: 30.3; scale-x: -10000; scale-y: 0.996; }
        frame 77 { x: 118.3; y: -23; skew-x: 32.6; skew-y: 35.6; scale-x: 0.997; scale-y: 0.995; }
        frame 78 { x: 125.3; y: -19.9; skew-x: 37.9; skew-y: 41.1; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 132.2; y: -16.8; skew-x: 43.2; skew-y: 46.4; scale-x: 0.998; scale-y: 0.996; }
        frame 80 { x: 136; y: -13.1; skew-x: 48.1; skew-y: 51.2; scale-x: 0.996; scale-y: 0.994; }
        frame 81 { x: 139.7; y: -9.2; skew-x: 52.9; skew-y: 56.1; scale-x: 0.995; scale-y: -10000; }
        frame 82 { x: 143.5; y: -5.3; skew-x: 57.7; skew-y: 60.9; scale-x: -10000; scale-y: 0.993; }
        frame 83 { x: 147.3; y: -1.3; skew-x: 62.6; skew-y: 65.7; scale-y: -10000; }
        frame 84 { x: 151; y: 2.6; skew-x: 67.4; skew-y: 70.5; scale-x: 0.994; }
        frame 85 { x: 154.7; y: 7; skew-x: 72.1; skew-y: 75.3; scale-x: 0.995; scale-y: 0.994; }
        frame 86 { x: 146.6; y: -3.5; skew-x: 64.9; skew-y: 68; scale-x: 0.992; scale-y: 0.991; }
        frame 87 { x: 138.5; y: -14.1; skew-x: 57.4; skew-y: 60.7; scale-x: -10000; scale-y: 0.99; }
        frame 88 { x: 126.4; y: -25.4; skew-x: 45.9; skew-y: 49.1; scale-x: 0.99; scale-y: 0.989; }
        frame 89 { x: 114.4; y: -36.2; skew-x: 34.3; skew-y: 37.4; scale-x: 0.992; scale-y: 0.991; }
        frame 90 { x: 65.4; y: -42.2; skew-x: -6.8; skew-y: -3.6; scale-x: 0.989; scale-y: 0.988; }
        frame 91 { x: 31.1; y: -32.2; skew-x: -28.8; skew-y: -25.7; scale-x: 0.987; scale-y: 0.985; }
        frame 92 { x: 11.1; y: -25; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -10000; y: -24; skew-x: -28.7; scale-x: 0.985; scale-y: 0.984; }
        frame 94 { y: -23; skew-x: -28.8; scale-x: 0.987; scale-y: 0.985; }
        frame 95 { y: -24; skew-x: -28.7; scale-x: 0.985; scale-y: 0.984; }
        frame 96 { y: -25; skew-x: -28.8; scale-x: 0.987; scale-y: 0.985; }
        frame 97 { x: 20.4; y: -27.1; skew-x: -24.5; skew-y: -21.4; scale-x: 0.988; scale-y: 0.986; }
        frame 98 { x: 29.7; y: -29.2; skew-x: -20.2; skew-y: -17.2; scale-x: 0.99; scale-y: 0.988; }
        frame 99 { x: 39.2; y: -31.1; skew-x: -16.2; skew-y: -12.9; scale-x: 0.992; scale-y: 0.991; }
        frame 100 { x: 48.8; y: -33.2; skew-x: -11.9; skew-y: -8.7; scale-x: 0.994; scale-y: 0.993; }
        frame 101 { x: 58.4; y: -35.2; skew-x: -7.7; skew-y: -4.4; scale-x: 0.997; scale-y: 0.995; }
        frame 102 { x: 68.1; y: -37.2; skew-x: -3.4; skew-y: -0.2; scale-x: 0.999; scale-y: 0.998; }
        frame 103 { x: 78; y: -39.1; skew-x: 0.6; skew-y: 3.8; scale-x: 1.001; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 76.4; y: -39.2; skew-x: -0.5; skew-y: 2.3; scale-x: 1; scale-y: 0.999; }
        frame 106 { x: 75; y: -39.1; skew-x: -1.9; skew-y: 1; scale-x: -10000; scale-y: 0.998; }
        frame 107 { x: 73.5; y: -39.2; skew-x: -3.2; skew-y: -0.2; scale-x: 0.999; scale-y: 0.997; }
        frame 108 { x: 72.1; y: -39.1; skew-x: -4.7; skew-y: -1.4; scale-x: 0.998; scale-y: 0.996; }
        frame 109 { x: 70.5; y: -39.2; skew-x: -5.9; skew-y: -2.9; scale-x: 0.997; scale-y: 0.995; }
        frame 110 { x: 69.1; y: -39.1; skew-x: -7.4; skew-y: -4.2; scale-x: 0.996; scale-y: -10000; }
        frame 111 { x: 67.7; y: -10000; skew-x: -8.7; skew-y: -5.5; scale-x: 0.995; scale-y: 0.994; }
        frame 112 { x: 66.1; y: -38.9; skew-x: -10.2; skew-y: -7; scale-x: -10000; scale-y: 0.993; }
        frame 113 { x: 61.4; y: -39.2; skew-x: -10000; skew-y: -6.9; scale-x: 0.994; scale-y: 0.992; }
        frame 114 { x: 56.5; y: -39.6; skew-y: -7; scale-x: 0.993; scale-y: -10000; }
        frame 115 { x: 51.7; y: -39.9; skew-y: -7.2; scale-x: -10000; }
        frame 116 { x: 46.9; y: -40.2; skew-x: -10.4; skew-y: -10000; scale-y: 0.991; }
        frame 117 { x: 42.1; y: -40.6; skew-x: -10.5; skew-y: -7.4; scale-y: -10000; }
        frame 118 { x: 36.5; y: -41.2; skew-x: -12.2; skew-y: -9.2; scale-x: 0.992; }
        frame 119 { x: 31; y: -41.7; skew-x: -14; skew-y: -10.9; scale-x: -10000; scale-y: 0.99; }
        frame 120 { x: 25.4; y: -42.2; skew-x: -15.9; skew-y: -12.7; scale-x: 0.991; scale-y: -10000; }
        frame 121 { x: 19.8; y: -42.8; skew-x: -17.8; skew-y: -14.6; scale-x: 0.992; scale-y: 0.991; }
        frame 122 { x: -10000; y: -10000; skew-x: -17.7; skew-y: -14.5; scale-x: 0.991; scale-y: 0.99; }
        frame 123 { skew-x: -17.8; skew-y: -14.6; scale-x: 0.992; scale-y: 0.991; }
        frame 124 { x: 6.8; y: -45; skew-x: -24.2; skew-y: -21; scale-x: 0.99; scale-y: 0.989; }
        frame 125 { x: -5.7; y: -47.3; skew-x: -30.7; skew-y: -27.5; scale-x: 0.989; scale-y: 0.988; }
        frame 126 { x: -18.2; y: -49.5; skew-x: -37; skew-y: -34; scale-x: -10000; scale-y: 0.987; }
        frame 127 { x: -30.5; y: -51.7; skew-x: -43.5; skew-y: -40.5; scale-x: 0.988; scale-y: -10000; }
        frame 128 { x: -42.7; y: -54; skew-x: -50.1; skew-y: -46.9; scale-x: 0.989; scale-y: 0.988; }
        frame 129 { x: -94.1; y: -52.9; skew-x: -62.8; skew-y: -59.6; scale-x: 0.987; scale-y: 0.985; }
        frame 130 { x: -144.9; y: -52.3; skew-x: -75.6; skew-y: -72.4; scale-x: -10000; scale-y: 0.986; }
        frame 131 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
        frame 138 { x: 73.1; y: -39.1; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: 0; }
        frame 139 { x: 76.8; y: -30.6; skew-x: -9.4; skew-y: -9.4; scale-x: 0.999; scale-y: 0.999; cel: -10000; }
        frame 140 { x: 81; y: -22; skew-x: -18.9; skew-y: -18.9; scale-x: 0.998; scale-y: 0.998; }
        frame 141 { x: 85.6; y: -13.2; skew-x: -28.5; skew-y: -28.5; scale-x: 0.999; scale-y: 0.999; }
        frame 142 { x: 91.5; y: -2.8; skew-x: -18.9; skew-y: -18.9; scale-x: 0.998; scale-y: 0.998; }
        frame 143 { x: 97.8; y: 7.3; skew-x: -9.4; skew-y: -9.4; scale-x: 0.999; scale-y: 0.999; }
        frame 144 { x: 104.7; y: 17.9; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 145 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 146 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_gargantuar_trashcan";
        frame-count: 197;
        frame 0 { x: 75.2; y: -28.5; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_TRASHCAN1; }
        frame 1 { x: 73.8; y: -29; skew-x: -0.4; skew-y: -0.4; image: none; }
        frame 2 { x: 72.4; y: -29.5; skew-x: -1.2; skew-y: -1.2; }
        frame 3 { x: 71; y: -29.9; skew-x: -1.9; skew-y: -1.9; }
        frame 4 { x: 69.8; y: -10000; skew-x: -2.4; skew-y: -2.4; }
        frame 5 { x: 68.7; skew-x: -2.9; skew-y: -2.9; }
        frame 6 { x: 67.6; skew-x: -3.5; skew-y: -3.5; }
        frame 7 { x: 66.3; y: -29.7; skew-x: -4.2; skew-y: -4.2; scale-x: 0.999; scale-y: 0.999; }
        frame 8 { x: 65.1; y: -10000; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 63.9; skew-x: -5.2; skew-y: -5.2; }
        frame 10 { x: 62.6; y: -29.4; skew-x: -5.9; skew-y: -5.9; scale-x: 1; scale-y: 1; }
        frame 11 { x: 64; y: -28.9; skew-x: -5.2; skew-y: -5.2; scale-x: 0.999; scale-y: 0.999; }
        frame 12 { x: 65.3; y: -28.4; skew-x: -4.5; skew-y: -4.5; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 66.5; y: -27.8; skew-x: -4; skew-y: -4; }
        frame 14 { x: 67.7; y: -27.9; skew-x: -3.4; skew-y: -3.4; }
        frame 15 { x: 68.8; y: -28; skew-x: -2.9; skew-y: -2.9; }
        frame 16 { x: 69.8; y: -28.1; skew-x: -2.4; skew-y: -2.4; scale-x: 1; scale-y: 1; }
        frame 17 { x: 70.9; y: -28.2; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 72; y: -28.3; skew-x: -1.4; skew-y: -1.4; }
        frame 19 { x: 73.1; y: -10000; skew-x: -0.9; skew-y: -0.9; }
        frame 20 { x: 74.2; skew-x: -0.4; skew-y: -0.4; }
        frame 21 { x: 75.2; y: -28.5; skew-x: 0; skew-y: 0; }
        frame 22 { x: 78.3; y: -29.8; skew-x: 1.8; skew-y: 1.8; }
        frame 23 { x: 81.3; y: -30.2; skew-x: 4.5; skew-y: 4.5; scale-x: 0.999; scale-y: 0.999; }
        frame 24 { x: 84.3; y: -30.6; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 87.3; y: -30.8; skew-x: 10; skew-y: 10; }
        frame 26 { x: 90.3; y: -31.1; skew-x: 12.8; skew-y: 12.8; }
        frame 27 { x: 93.4; y: -31.3; skew-x: 15.5; skew-y: 15.5; }
        frame 28 { x: 94.7; y: -31.4; skew-x: 16.5; skew-y: 16.5; scale-x: 0.998; scale-y: 0.998; }
        frame 29 { x: 96; y: -31.6; skew-x: 17.6; skew-y: 17.6; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 97.3; y: -10000; skew-x: 18.6; skew-y: 18.6; }
        frame 31 { x: 98.7; y: -31.8; skew-x: 19.8; skew-y: 19.8; }
        frame 32 { x: 100; y: -32; skew-x: 20.8; skew-y: 20.8; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: 92.8; y: -32.3; skew-x: 18.3; skew-y: 18.3; scale-x: 0.997; scale-y: 0.997; }
        frame 34 { x: 85.9; y: -32.7; skew-x: 16.1; skew-y: 16.1; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 72.6; y: -30.6; skew-x: 1.1; skew-y: 1.1; }
        frame 36 { x: 60.8; y: -27.2; skew-x: -13.6; skew-y: -13.6; }
        frame 37 { x: 59.4; y: -27.4; skew-x: -14.4; skew-y: -14.4; scale-x: 0.995; scale-y: 0.995; }
        frame 38 { x: 57.8; y: -27.7; skew-x: -15.5; skew-y: -15.5; scale-x: 0.996; scale-y: 0.996; }
        frame 39 { x: 61; y: -28.2; skew-x: -12.4; skew-y: -12.4; scale-x: 0.995; scale-y: 0.995; }
        frame 40 { x: 64.3; y: -28.6; skew-x: -9.5; skew-y: -9.5; scale-x: 0.996; scale-y: 0.996; }
        frame 41 { x: 67.6; y: -28.9; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 70; y: -29.2; skew-x: -5.2; skew-y: -5.2; }
        frame 43 { x: 72.3; y: -29.5; skew-x: -3.7; skew-y: -3.7; }
        frame 44 { x: 74.6; y: -29.8; skew-x: -2.2; skew-y: -2.2; }
        frame 45 { x: 76.8; y: -30.1; skew-x: -0.7; skew-y: -0.7; }
        frame 46 { x: 79.1; y: -30.3; skew-x: 0.6; skew-y: 0.6; }
        frame 47 { x: 81; y: -30.7; skew-x: 3.1; skew-y: 3.1; }
        frame 48 { x: 83.1; y: -31.2; skew-x: 5.8; skew-y: 5.8; scale-x: 0.995; scale-y: 0.995; }
        frame 49 { x: 85.1; y: -31.5; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 87.2; y: -31.8; skew-x: 11; skew-y: 11; }
        frame 51 { x: 89.3; y: -32; skew-x: 13.8; skew-y: 13.8; }
        frame 52 { x: 92.2; y: -31.7; skew-x: 16; skew-y: 16; scale-x: 0.994; scale-y: 0.994; }
        frame 53 { x: 95.2; y: -31.3; skew-x: 18.3; skew-y: 18.3; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 98.2; y: -30.9; skew-x: 20.5; skew-y: 20.5; }
        frame 55 { x: 101.2; y: -30.4; skew-x: 22.8; skew-y: 22.8; scale-x: 0.993; scale-y: 0.993; }
        frame 56 { x: 104.2; y: -29.8; skew-x: 25.1; skew-y: 25.1; scale-x: 0.994; scale-y: 0.994; }
        frame 57 { x: 95.2; y: -30; skew-x: 19; skew-y: 19; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 86.2; y: -30.1; skew-x: 13.1; skew-y: 13.1; scale-x: 0.995; scale-y: 0.995; }
        frame 59 { x: 72.9; y: -29.3; skew-x: -0.2; skew-y: -0.2; scale-x: 0.996; scale-y: 0.996; }
        frame 60 { x: 60.8; y: -27.2; skew-x: -13.6; skew-y: -13.6; scale-x: 0.997; scale-y: 0.997; }
        frame 61 { x: 59.4; y: -27.4; skew-x: -14.4; skew-y: -14.4; scale-x: 0.995; scale-y: 0.995; }
        frame 62 { x: 57.8; y: -27.7; skew-x: -15.5; skew-y: -15.5; scale-x: 0.996; scale-y: 0.996; }
        frame 63 { x: 61.8; y: -28.2; skew-x: -12.4; skew-y: -12.4; scale-x: 0.995; scale-y: 0.995; }
        frame 64 { x: 65.8; y: -28.6; skew-x: -9.2; skew-y: -9.2; scale-x: 0.996; scale-y: 0.996; }
        frame 65 { x: 69.8; y: -28.9; skew-x: -6.4; skew-y: -6.4; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 71.4; y: -29.1; skew-x: -4.7; skew-y: -4.7; scale-x: 0.997; scale-y: 0.997; }
        frame 67 { x: 73.2; y: -29.4; skew-x: -2.9; skew-y: -2.9; scale-x: 0.998; scale-y: 0.998; }
        frame 68 { x: 74.8; y: -10000; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 76.5; y: -29.6; skew-x: 0; skew-y: 0; scale-x: 0.999; scale-y: 0.999; }
        frame 70 { x: 78.3; y: -29.8; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 84.1; y: -27.8; skew-x: 6.8; skew-y: 6.8; scale-x: 0.999; scale-y: 0.999; }
        frame 73 { x: 89.8; y: -25.8; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 95.8; y: -23.4; skew-x: 17.1; skew-y: 17.1; scale-x: 0.998; scale-y: 0.998; }
        frame 75 { x: 101.9; y: -20.8; skew-x: 22.3; skew-y: 22.3; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 108.1; y: -18; skew-x: 27.3; skew-y: 27.3; scale-x: 0.997; scale-y: 0.997; }
        frame 77 { x: 114.2; y: -14.9; skew-x: 32.6; skew-y: 32.6; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 120.3; y: -11.6; skew-x: 37.6; skew-y: 37.6; scale-x: 0.996; scale-y: 0.996; }
        frame 79 { x: 126.6; y: -8.1; skew-x: 42.8; skew-y: 42.8; scale-x: 0.998; scale-y: 0.998; }
        frame 80 { x: 129.4; y: -4.7; skew-x: 46.1; skew-y: 46.1; scale-x: 0.996; scale-y: 0.996; }
        frame 81 { x: 132.2; y: -1.3; skew-x: 49.6; skew-y: 49.6; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 135; y: 2.1; skew-x: 52.9; skew-y: 52.9; scale-x: 0.995; scale-y: 0.995; }
        frame 83 { x: 137.6; y: 5.7; skew-x: 56.2; skew-y: 56.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 140.4; y: 9.5; skew-x: 59.7; skew-y: 59.7; }
        frame 85 { x: 143; y: 13.2; skew-x: 63; skew-y: 63; scale-x: 0.996; scale-y: 0.996; }
        frame 86 { x: 136.7; y: 3.3; skew-x: 55.6; skew-y: 55.6; scale-x: 0.993; scale-y: 0.993; }
        frame 87 { x: 130; y: -6.1; skew-x: 48.1; skew-y: 48.1; scale-x: 0.994; scale-y: 0.994; }
        frame 88 { x: 119.8; y: -15.4; skew-x: 36.3; skew-y: 36.3; scale-x: 0.992; scale-y: 0.992; }
        frame 89 { x: 109.8; y: -23.6; skew-x: 24.6; skew-y: 24.6; scale-x: 0.994; scale-y: 0.994; }
        frame 90 { x: 71.1; y: -33.3; skew-x: -9.2; skew-y: -9.2; scale-x: 0.993; scale-y: 0.993; }
        frame 91 { x: 36.9; y: -28.8; skew-x: -31.3; skew-y: -31.3; scale-x: 0.991; scale-y: 0.991; }
        frame 92 { x: 16.9; y: -21.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -10000; y: -20.6; skew-x: -31.2; skew-y: -31.2; scale-x: 0.99; scale-y: 0.99; }
        frame 94 { y: -19.6; skew-x: -31.3; skew-y: -31.3; scale-x: 0.991; scale-y: 0.991; }
        frame 95 { y: -20.7; skew-x: -31.2; skew-y: -31.2; scale-x: 0.99; scale-y: 0.99; }
        frame 96 { y: -21.6; skew-x: -31.3; skew-y: -31.3; scale-x: 0.991; scale-y: 0.991; }
        frame 97 { x: 25.1; y: -23.1; skew-x: -26.5; skew-y: -26.5; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 33.5; y: -24.6; skew-x: -21.7; skew-y: -21.7; scale-x: 0.993; scale-y: 0.993; }
        frame 99 { x: 42.1; y: -25.8; skew-x: -17; skew-y: -17; scale-x: 0.994; scale-y: 0.994; }
        frame 100 { x: 50.9; y: -27.1; skew-x: -12.2; skew-y: -12.2; scale-x: 0.996; scale-y: 0.996; }
        frame 101 { x: 59.8; y: -28.2; skew-x: -7.4; skew-y: -7.4; scale-x: 0.997; scale-y: 0.997; }
        frame 102 { x: 68.9; y: -29.2; skew-x: -2.7; skew-y: -2.7; scale-x: 0.998; scale-y: 0.998; }
        frame 103 { x: 78.3; y: -29.8; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 77.2; y: -29.7; skew-x: 0.1; skew-y: 0.1; scale-x: 0.999; scale-y: 0.999; }
        frame 106 { x: 76.2; y: -29.8; skew-x: -1.2; skew-y: -1.2; scale-x: 0.998; scale-y: 0.998; }
        frame 107 { x: 75.1; y: -29.7; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 74.1; y: -10000; skew-x: -4.2; skew-y: -4.2; scale-x: 0.997; scale-y: 0.997; }
        frame 109 { x: 73; y: -29.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.996; scale-y: 0.996; }
        frame 110 { x: 71.9; y: -29.5; skew-x: -7.4; skew-y: -7.4; scale-x: 0.995; scale-y: 0.995; }
        frame 111 { x: 70.8; y: -29.4; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 69.8; y: -29.3; skew-x: -10.6; skew-y: -10.6; }
        frame 113 { x: 65.8; y: -29.2; skew-x: -13.7; skew-y: -13.7; scale-x: 0.994; scale-y: 0.994; }
        frame 114 { x: 61.8; y: -29; skew-x: -16.9; skew-y: -16.9; scale-x: 0.993; scale-y: 0.993; }
        frame 115 { x: 57.9; y: -28.8; skew-x: -20; skew-y: -20; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 54.1; y: -28.5; skew-x: -23.2; skew-y: -23.2; }
        frame 117 { x: 50.3; y: -28.1; skew-x: -26.4; skew-y: -26.4; scale-x: 0.994; scale-y: 0.994; }
        frame 118 { x: 47.8; y: -27.6; skew-x: -29; skew-y: -29; scale-x: 0.992; scale-y: 0.992; }
        frame 119 { x: 45.4; y: -26.9; skew-x: -31.7; skew-y: -31.7; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 42.9; y: -26.2; skew-x: -34.5; skew-y: -34.5; }
        frame 121 { x: 40.4; y: -25.6; skew-x: -37.1; skew-y: -37.1; scale-x: 0.993; scale-y: 0.993; }
        frame 122 { x: 40.5; y: -10000; skew-x: -37; skew-y: -37; scale-x: 0.991; scale-y: 0.991; }
        frame 123 { x: 40.4; skew-x: -37.1; skew-y: -37.1; scale-x: 0.993; scale-y: 0.993; }
        frame 124 { x: 42.4; y: -26.8; skew-x: -35; skew-y: -35; scale-x: 0.991; scale-y: 0.991; }
        frame 125 { x: 44.5; y: -28.1; skew-x: -33; skew-y: -33; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 46.5; y: -29.3; skew-x: -31; skew-y: -31; }
        frame 127 { x: 48.5; y: -30.5; skew-x: -29; skew-y: -29; }
        frame 128 { x: 50.5; y: -31.6; skew-x: -27.1; skew-y: -27.1; scale-x: 0.992; scale-y: 0.992; }
        frame 129 { x: 58.8; y: -31; skew-x: -24; skew-y: -24; scale-x: 0.991; scale-y: 0.991; }
        frame 130 { x: 66.9; y: -30.3; skew-x: -20.8; skew-y: -20.8; scale-x: 0.992; scale-y: 0.992; }
        frame 131 { x: 72.8; y: -29.5; skew-x: -17; skew-y: -17; scale-x: 0.991; scale-y: 0.991; }
        frame 132 { x: 79.1; y: -28.5; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 85.1; y: -27.5; skew-x: -9.5; skew-y: -9.5; }
        frame 134 { x: 88.8; y: -29.2; skew-x: -3.9; skew-y: -3.9; scale-x: 0.993; scale-y: 0.993; }
        frame 135 { x: 92.5; y: -30.7; skew-x: 1.2; skew-y: 1.2; scale-x: 0.995; scale-y: 0.995; }
        frame 136 { x: 85.3; y: -30.3; skew-x: 1.5; skew-y: 1.5; scale-x: 0.997; scale-y: 0.997; }
        frame 137 { x: 78.3; y: -29.8; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 80.9; y: -28.2; skew-x: 3.3; skew-y: 3.3; }
        frame 140 { x: 83.5; y: -26.7; skew-x: 5; skew-y: 5; scale-x: 0.999; scale-y: 0.999; }
        frame 141 { x: 86; y: -25.1; skew-x: 6.9; skew-y: 6.9; scale-x: 1; scale-y: 1; }
        frame 142 { x: 91.3; y: -21.3; skew-x: 9.8; skew-y: 9.8; scale-x: 0.999; scale-y: 0.999; }
        frame 143 { x: 97; y: -17.6; skew-x: 13; skew-y: 13; scale-x: 0.998; scale-y: 0.998; }
        frame 144 { x: 102.6; y: -13.8; skew-x: 16.2; skew-y: 16.2; scale-x: 0.999; scale-y: 0.999; }
        frame 145 { x: 112.3; y: -7.7; skew-x: 24.1; skew-y: 24.1; scale-x: 0.997; scale-y: 0.997; }
        frame 146 { x: 122.3; y: -1; skew-x: 32.3; skew-y: 32.3; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 132.4; y: 6.2; skew-x: 40.3; skew-y: 40.3; scale-x: 0.998; scale-y: 0.998; }
        frame 148 { x: 126.8; y: 2.4; skew-x: 37.9; skew-y: 37.9; scale-x: 0.996; scale-y: 0.996; }
        frame 149 { x: 121.3; y: -1.3; skew-x: 35.6; skew-y: 35.6; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 115.8; y: -5; skew-x: 33.2; skew-y: 33.2; scale-x: 0.997; scale-y: 0.997; }
        frame 151 { x: 105.2; y: -7.7; skew-x: 30.3; skew-y: 30.3; scale-x: 0.995; scale-y: 0.995; }
        frame 152 { x: 94.6; y: -10.3; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 84; y: -13; skew-x: 24.5; skew-y: 24.5; scale-x: 0.996; scale-y: 0.996; }
        frame 154 { x: 66.8; y: -18.3; skew-x: 14.1; skew-y: 14.1; scale-x: 0.994; scale-y: 0.994; }
        frame 155 { x: 50.1; y: -22.8; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 34.3; y: -26.7; skew-x: -6.1; skew-y: -6.1; }
        frame 157 { x: 29.5; y: -24.9; skew-x: -9.2; skew-y: -9.2; scale-x: 0.993; scale-y: 0.993; }
        frame 158 { x: 24.7; y: -23.1; skew-x: -12.5; skew-y: -12.5; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: 20; y: -21.1; skew-x: -15.9; skew-y: -15.9; }
        frame 160 { x: 21.5; y: -22.1; skew-x: -14.5; skew-y: -14.5; scale-x: 0.992; scale-y: 0.992; }
        frame 161 { x: 22.8; y: -23; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 24.3; y: -23.9; skew-x: -11.9; skew-y: -11.9; scale-x: 0.993; scale-y: 0.993; }
        frame 163 { x: 29.3; y: -25.4; skew-x: -8.2; skew-y: -8.2; scale-x: 0.992; scale-y: 0.992; }
        frame 164 { x: 34.4; y: -27; skew-x: -4.4; skew-y: -4.4; scale-x: -10000; scale-y: -10000; }
        frame 165 { x: 39.4; y: -28.4; skew-x: -0.7; skew-y: -0.7; }
        frame 166 { x: 44.6; y: -29.7; skew-x: 2.8; skew-y: 2.8; }
        frame 167 { x: 49.9; y: -30.9; skew-x: 6.6; skew-y: 6.6; }
        frame 168 { x: 57.6; y: -29.7; skew-x: 8.8; skew-y: 8.8; }
        frame 169 { x: 65.4; y: -28.6; skew-x: 11; skew-y: 11; }
        frame 170 { x: 73.2; y: -27.5; skew-x: 13.3; skew-y: 13.3; scale-x: 0.993; scale-y: 0.993; }
        frame 171 { x: 80.7; y: -23.6; skew-x: 15.5; skew-y: 15.5; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 88.2; y: -19.7; skew-x: 17.8; skew-y: 17.8; }
        frame 173 { x: 95.9; y: -15.7; skew-x: 20.3; skew-y: 20.3; scale-x: 0.995; scale-y: 0.995; }
        frame 174 { x: 104.4; y: -11.9; skew-x: 24.1; skew-y: 24.1; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 113.1; y: -8.1; skew-x: 28.1; skew-y: 28.1; scale-x: 0.996; scale-y: 0.996; }
        frame 176 { x: 121.8; y: -4.2; skew-x: 32; skew-y: 32; scale-x: 0.998; scale-y: 0.998; }
        frame 177 { x: 118.8; y: -4.6; skew-x: 32.6; skew-y: 32.6; scale-x: 0.996; scale-y: 0.996; }
        frame 178 { x: 115.8; y: -5; skew-x: 33.2; skew-y: 33.2; scale-x: 0.997; scale-y: 0.997; }
        frame 179 { x: 105.2; y: -7.7; skew-x: 30.3; skew-y: 30.3; scale-x: 0.995; scale-y: 0.995; }
        frame 180 { x: 94.6; y: -10.3; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 181 { x: 84; y: -13; skew-x: 24.5; skew-y: 24.5; scale-x: 0.996; scale-y: 0.996; }
        frame 182 { x: 63.5; y: -18.3; skew-x: 14.1; skew-y: 14.1; scale-x: 0.994; scale-y: 0.994; }
        frame 183 { x: 43.5; y: -22.8; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: 24.3; y: -26.7; skew-x: -6.1; skew-y: -6.1; }
        frame 185 { x: 7.3; y: -20.7; skew-x: -8.7; skew-y: -8.7; scale-x: 0.992; scale-y: 0.992; }
        frame 186 { x: -9.5; y: -14.6; skew-x: -11.4; skew-y: -11.4; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: -44; y: 6.8; skew-x: -25.7; skew-y: -25.7; scale-x: 0.99; scale-y: 0.99; }
        frame 188 { x: -76.7; y: 29; skew-x: -40; skew-y: -40; scale-x: 0.991; scale-y: 0.991; }
        frame 189 { x: -82.5; y: 35.2; skew-x: -45.2; skew-y: -45.2; scale-x: 0.989; scale-y: 0.989; }
        frame 190 { x: -88.2; y: 41.3; skew-x: -50.3; skew-y: -50.3; scale-x: 0.99; scale-y: 0.99; }
        frame 191 { x: -89.9; y: 45.4; skew-x: -49.3; skew-y: -53.8; scale-x: 0.993; scale-y: 0.999; }
        frame 192 { x: -91.7; y: 49.6; skew-x: -48.2; skew-y: -57.4; scale-x: 0.999; scale-y: 1.01; }
        frame 193 { x: -85.6; y: 40.8; skew-x: -45.8; skew-y: -50.3; scale-x: 0.993; scale-y: 0.998; }
        frame 194 { x: -79.4; y: 32.1; skew-x: -43.3; skew-y: -43.3; scale-x: 0.989; scale-y: 0.989; }
        frame 195 { x: -80.7; y: 35.8; skew-x: -45; skew-y: -45; scale-x: 0.988; scale-y: 0.988; }
        frame 196 { x: -82.1; y: 39.5; skew-x: -46.8; skew-y: -46.8; scale-x: 0.991; scale-y: 0.991; }
    }
    Track {
        source-name: "Zombie_gargantua_body1";
        frame-count: 197;
        frame 0 { x: -15.6; y: -34.2; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_BODY1; }
        frame 1 { x: -15.1; y: -35.6; skew-x: 0.5; skew-y: 0.5; scale-y: 1.002; image: none; }
        frame 2 { x: -14.4; y: -37.2; skew-x: 1.3; skew-y: 1.3; scale-y: 1.004; }
        frame 3 { x: -13.7; y: -38.9; skew-x: 2.1; skew-y: 2.1; scale-y: 1.006; }
        frame 4 { x: -15.5; y: -37; skew-x: 1.1; skew-y: 1.1; scale-y: 1.005; }
        frame 5 { x: -17; y: -35.4; skew-x: 0.3; skew-y: 0.3; scale-y: -10000; }
        frame 6 { x: -18.3; y: -34; skew-x: -0.2; skew-y: -0.2; scale-y: 1.004; }
        frame 7 { x: -20; y: -32.2; skew-x: -1.2; skew-y: -1.2; scale-y: 1.003; }
        frame 8 { x: -21.4; y: -30.5; skew-x: -1.9; skew-y: -1.9; scale-y: 1.002; }
        frame 9 { x: -22.9; y: -28.9; skew-x: -2.7; skew-y: -2.7; scale-y: 1.001; }
        frame 10 { x: -24.4; y: -26.9; skew-x: -3.7; skew-y: -3.7; scale-y: 1; }
        frame 11 { x: -24.1; y: -25.9; skew-x: -4.2; skew-y: -10000; scale-y: 1.001; }
        frame 12 { x: -23.8; y: -25; skew-x: -4.7; scale-y: 1.003; }
        frame 13 { x: -23.7; y: -24; skew-x: -5.2; scale-y: 1.005; }
        frame 14 { x: -22.6; y: -25.3; skew-x: -4.4; skew-y: -3.2; scale-y: -10000; }
        frame 15 { x: -21.6; y: -26.7; skew-x: -3.7; skew-y: -2.7; scale-y: 1.004; }
        frame 16 { x: -20.6; y: -27.9; skew-x: -3.2; skew-y: -2.2; scale-y: 1.003; }
        frame 17 { x: -19.6; y: -29.2; skew-x: -2.4; skew-y: -1.7; scale-y: -10000; }
        frame 18 { x: -18.5; y: -30.6; skew-x: -1.7; skew-y: -1.2; scale-y: 1.002; }
        frame 19 { x: -17.6; y: -31.7; skew-x: -1.2; skew-y: -0.7; scale-y: 1.001; }
        frame 20 { x: -16.5; y: -33; skew-x: -0.4; skew-y: -0.2; scale-y: -10000; }
        frame 21 { x: -15.6; y: -34.2; skew-x: 0; skew-y: 0; scale-y: 1; }
        frame 22 { x: -12.2; y: -38.4; skew-x: 1.8; skew-y: 1.8; scale-y: -10000; }
        frame 23 { x: -10.7; y: -39.6; skew-x: 2.5; skew-y: 2.5; }
        frame 24 { x: -9.2; y: -40.8; skew-x: 3.3; skew-y: 3.3; }
        frame 25 { x: -7.6; y: -41.9; skew-x: 4.1; skew-y: 4.1; }
        frame 26 { x: -5.8; y: -43.3; skew-x: 5; skew-y: 5; scale-x: 0.999; scale-y: 0.999; }
        frame 27 { x: -4.1; y: -44.6; skew-x: 5.9; skew-y: 5.9; scale-x: 1; scale-y: 1; }
        frame 28 { x: -3.4; y: -45.5; skew-x: 6.3; skew-y: 6.3; scale-x: 0.999; scale-y: 0.999; }
        frame 29 { x: -2.4; y: -46.3; skew-x: 6.8; skew-y: 6.8; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -1.5; y: -47.2; skew-x: 7.3; skew-y: 7.3; }
        frame 31 { x: -0.5; y: -48.1; skew-x: 7.8; skew-y: 7.8; }
        frame 32 { x: 0.3; y: -49.1; skew-x: 8.4; skew-y: 8.4; scale-x: 1; scale-y: 1; }
        frame 33 { x: -7.7; y: -42.9; skew-x: 4.8; skew-y: 4.8; scale-x: 0.999; scale-y: 0.999; }
        frame 34 { x: -15.7; y: -36.5; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: -23.1; y: -30.2; skew-x: -2.2; skew-y: -2.2; }
        frame 36 { x: -30.7; y: -23.3; skew-x: -5.9; skew-y: -5.9; }
        frame 37 { x: -30.1; y: -23.5; skew-x: -5.7; skew-y: -5.7; scale-x: 0.998; scale-y: 1.008; }
        frame 38 { x: -29.8; y: -23.4; skew-x: -5.8; skew-y: -5.8; scale-x: -10000; scale-y: 1.017; }
        frame 39 { x: -28.7; y: -25; skew-x: -4.9; skew-y: -4.9; scale-y: 1.011; }
        frame 40 { x: -27.6; y: -26.4; skew-x: -4.2; skew-y: -4.2; scale-y: 1.005; }
        frame 41 { x: -26.5; y: -28; skew-x: -3.4; skew-y: -3.4; scale-x: 0.999; scale-y: 0.999; }
        frame 42 { x: -24.7; y: -29.1; skew-x: -2.7; skew-y: -2.7; scale-x: 0.998; scale-y: 0.998; }
        frame 43 { x: -23.1; y: -30.1; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: -21.5; y: -31.1; skew-x: -1.7; skew-y: -1.7; }
        frame 45 { x: -19.7; y: -32.2; skew-x: -1; skew-y: -1; }
        frame 46 { x: -18.3; y: -33.1; skew-x: -0.6; skew-y: -0.6; }
        frame 47 { x: -17; y: -34.4; skew-x: 0; skew-y: 0; }
        frame 48 { x: -15.5; y: -35.9; skew-x: 0.8; skew-y: 0.8; }
        frame 49 { x: -14; y: -37.4; skew-x: 1.8; skew-y: 1.8; }
        frame 50 { x: -12.5; y: -38.8; skew-x: 2.5; skew-y: 2.5; }
        frame 51 { x: -11; y: -40.1; skew-x: 3.4; skew-y: 3.4; }
        frame 52 { x: -8.6; y: -41.8; skew-x: 4.5; skew-y: 4.5; }
        frame 53 { x: -6.1; y: -43.6; skew-x: 5.8; skew-y: 5.8; }
        frame 54 { x: -3.4; y: -45.3; skew-x: 7; skew-y: 7; }
        frame 55 { x: -1.1; y: -46.8; skew-x: 8.1; skew-y: 8.1; scale-x: 0.997; scale-y: 0.997; }
        frame 56 { x: 1.5; y: -48.6; skew-x: 9.4; skew-y: 9.4; scale-x: 0.998; scale-y: 0.998; }
        frame 57 { x: -6.9; y: -42.5; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: -15.1; y: -36.2; skew-x: 1.6; skew-y: 1.6; }
        frame 59 { x: -22.9; y: -30; skew-x: -1.9; skew-y: -1.9; }
        frame 60 { x: -30.7; y: -23.3; skew-x: -5.9; skew-y: -5.9; scale-x: 0.999; scale-y: 0.999; }
        frame 61 { x: -30.1; y: -23.5; skew-x: -5.7; skew-y: -5.7; scale-x: 0.998; scale-y: 1.008; }
        frame 62 { x: -29.8; y: -23.4; skew-x: -5.8; skew-y: -5.8; scale-x: -10000; scale-y: 1.017; }
        frame 63 { x: -26; y: -27.1; skew-x: -3.7; skew-y: -3.7; scale-y: 1.015; }
        frame 64 { x: -22.2; y: -30.6; skew-x: -1.7; skew-y: -1.7; scale-y: 1.013; }
        frame 65 { x: -18.5; y: -34; skew-x: 0; skew-y: 0; scale-y: 1.011; }
        frame 66 { x: -17.4; y: -34.7; skew-x: 0.3; skew-y: 0.3; scale-x: 0.999; scale-y: 1.009; }
        frame 67 { x: -16.2; y: -35.6; skew-x: 0.6; skew-y: 0.6; scale-x: -10000; scale-y: 1.007; }
        frame 68 { x: -14.9; y: -36.6; skew-x: 1; skew-y: 1; scale-y: 1.004; }
        frame 69 { x: -13.7; y: -37.4; skew-x: 1.3; skew-y: 1.3; scale-x: 1; scale-y: 1.002; }
        frame 70 { x: -12.2; y: -38.4; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 72 { x: -7; y: -40; skew-x: 4.1; skew-y: 4.1; scale-x: 0.999; scale-y: 0.999; }
        frame 73 { x: -1.3; y: -41.7; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 4.2; y: -43.4; skew-x: 9; skew-y: 9; }
        frame 75 { x: 9.8; y: -44.7; skew-x: 11.3; skew-y: 11.3; }
        frame 76 { x: 15.6; y: -46.1; skew-x: 13.8; skew-y: 13.8; scale-x: 0.998; scale-y: 0.998; }
        frame 77 { x: 21.6; y: -47.4; skew-x: 16.3; skew-y: 16.3; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 27.7; y: -48.5; skew-x: 18.8; skew-y: 18.8; }
        frame 79 { x: 33.8; y: -49.7; skew-x: 21.2; skew-y: 21.2; scale-x: 0.999; scale-y: 0.999; }
        frame 80 { x: 36.6; y: -49.6; skew-x: 22.6; skew-y: 22.6; scale-x: 0.998; scale-y: 0.998; }
        frame 81 { x: 39.9; y: -49.9; skew-x: 24.3; skew-y: 24.3; scale-x: 0.997; scale-y: 0.997; }
        frame 82 { x: 43; y: -50; skew-x: 25.8; skew-y: 25.8; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 46; y: -50.1; skew-x: 27.3; skew-y: 27.3; }
        frame 84 { x: 49.1; y: -50; skew-x: 28.8; skew-y: 28.8; }
        frame 85 { x: 52.4; y: -50.1; skew-x: 30.5; skew-y: 30.5; scale-x: 0.998; scale-y: 0.998; }
        frame 86 { x: 44.1; y: -51.8; skew-x: 26.8; skew-y: 26.8; scale-x: 0.996; scale-y: 1.006; }
        frame 87 { x: 35.9; y: -53.3; skew-x: 23.1; skew-y: 23.1; scale-x: 0.997; scale-y: 1.017; }
        frame 88 { x: 27.5; y: -54.3; skew-x: 19.3; skew-y: 19.3; scale-x: 0.996; scale-y: 1.006; }
        frame 89 { x: 19.4; y: -55.2; skew-x: 15.7; skew-y: 15.7; scale-x: 0.997; scale-y: 0.997; }
        frame 90 { x: -8; y: -41.5; skew-x: 7; skew-y: 7; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -34.1; y: -26.8; skew-x: -1.4; skew-y: -1.4; }
        frame 92 { x: -59; y: -10.8; skew-x: -10; skew-y: -10; scale-x: 0.996; scale-y: 0.996; }
        frame 93 { x: -58.9; y: -10.5; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: 1.007; }
        frame 94 { x: -59; y: -10; skew-x: -10; skew-y: -10; scale-y: 1.019; }
        frame 95 { x: -58.8; y: -10.5; skew-x: -9.9; skew-y: -9.9; scale-y: 1.007; }
        frame 96 { x: -59; y: -10.8; skew-x: -10; skew-y: -10; scale-y: 0.996; }
        frame 97 { x: -52.3; y: -15; skew-x: -8.2; skew-y: -8.2; scale-y: -10000; }
        frame 98 { x: -45.8; y: -19.1; skew-x: -6.5; skew-y: -6.5; scale-x: 0.997; scale-y: 0.997; }
        frame 99 { x: -39.2; y: -23; skew-x: -4.9; skew-y: -4.9; scale-x: 0.998; scale-y: 0.998; }
        frame 100 { x: -32.6; y: -26.9; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: -25.8; y: -30.8; skew-x: -1.4; skew-y: -1.4; scale-x: 0.999; scale-y: 0.999; }
        frame 102 { x: -19.1; y: -34.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: -12.2; y: -38.4; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: -12.7; y: -37.1; skew-x: 1; skew-y: 1; }
        frame 106 { x: -13.1; y: -35.7; skew-x: 0.3; skew-y: 0.3; scale-x: 0.999; scale-y: 0.999; }
        frame 107 { x: -13.4; y: -34.6; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: -13.8; y: -33.2; skew-x: -0.9; skew-y: -0.9; }
        frame 109 { x: -14.2; y: -31.8; skew-x: -1.7; skew-y: -1.7; scale-x: 0.998; scale-y: 0.998; }
        frame 110 { x: -14.7; y: -30.4; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: -14.8; y: -29.3; skew-x: -3; skew-y: -3; scale-x: 0.997; scale-y: 0.997; }
        frame 112 { x: -15.3; y: -27.9; skew-x: -3.8; skew-y: -3.8; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: -17.6; y: -25.5; skew-x: -5.4; skew-y: -5.4; }
        frame 114 { x: -19.9; y: -23.1; skew-x: -6.9; skew-y: -6.9; }
        frame 115 { x: -22.3; y: -20.6; skew-x: -8.7; skew-y: -8.7; }
        frame 116 { x: -24.5; y: -18.1; skew-x: -10.2; skew-y: -10.2; scale-x: 0.996; scale-y: 0.996; }
        frame 117 { x: -26.7; y: -15.4; skew-x: -11.9; skew-y: -11.9; scale-x: 0.997; scale-y: 0.997; }
        frame 118 { x: -28; y: -13.4; skew-x: -13; skew-y: -13; scale-x: 0.996; scale-y: 0.996; }
        frame 119 { x: -29.4; y: -11.3; skew-x: -14.2; skew-y: -14.2; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: -30.7; y: -9.1; skew-x: -15.4; skew-y: -15.4; }
        frame 121 { x: -32.2; y: -6.9; skew-x: -16.7; skew-y: -16.7; scale-x: 0.997; scale-y: 0.997; }
        frame 122 { x: -32.1; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.996; scale-y: 0.996; }
        frame 123 { x: -32.2; scale-x: 0.997; scale-y: 0.997; }
        frame 124 { x: -30.7; y: -10.8; skew-x: -14.7; skew-y: -14.7; scale-x: 0.996; scale-y: 0.996; }
        frame 125 { x: -29.1; y: -14.6; skew-x: -12.7; skew-y: -12.7; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: -27.5; y: -18.4; skew-x: -10.7; skew-y: -10.7; }
        frame 127 { x: -25.7; y: -22.1; skew-x: -8.7; skew-y: -8.7; }
        frame 128 { x: -24.1; y: -25.7; skew-x: -6.8; skew-y: -6.8; }
        frame 129 { x: -15.9; y: -29.4; skew-x: -3.5; skew-y: -3.5; }
        frame 130 { x: -7.9; y: -32.6; skew-x: -0.5; skew-y: -0.5; }
        frame 131 { x: -1.6; y: -36.6; skew-x: 3.1; skew-y: 3.1; scale-x: 0.995; scale-y: 0.995; }
        frame 132 { x: 4.8; y: -40.6; skew-x: 6.8; skew-y: 6.8; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 12.1; y: -44.4; skew-x: 10.8; skew-y: 10.8; }
        frame 134 { x: 5.8; y: -43; skew-x: 8.5; skew-y: 8.5; scale-x: 1.007; scale-y: 0.996; }
        frame 135 { x: -0.1; y: -41.5; skew-x: 6.3; skew-y: 6.3; scale-x: 1.02; scale-y: 0.997; }
        frame 136 { x: -6.2; y: -39.8; skew-x: 4; skew-y: 4; scale-x: 1.01; scale-y: 0.998; }
        frame 137 { x: -12.2; y: -38.4; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: -9.5; y: -39.4; skew-x: 3.3; skew-y: 3.3; }
        frame 140 { x: -6.5; y: -40.5; skew-x: 5; skew-y: 5.1; scale-x: 0.999; scale-y: 0.999; }
        frame 141 { x: -3.4; y: -41.7; skew-x: 6.9; skew-y: 6.9; scale-x: 1; scale-y: 1; }
        frame 142 { x: 2.9; y: -42.7; skew-x: 9.8; skew-y: 9.8; scale-x: 0.999; scale-y: 0.999; }
        frame 143 { x: 9.9; y: -43.8; skew-x: 13; skew-y: 13; scale-x: 0.998; scale-y: 0.998; }
        frame 144 { x: 16.8; y: -44.7; skew-x: 16.2; skew-y: 16.2; scale-x: 0.999; scale-y: 0.999; }
        frame 145 { x: 32.6; y: -50; skew-x: 24.1; skew-y: 24.1; scale-x: 0.997; scale-y: 0.997; }
        frame 146 { x: 49.4; y: -54.1; skew-x: 32.1; skew-y: 32.1; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 66.8; y: -56.8; skew-x: 40.3; skew-y: 40.3; scale-x: 0.998; scale-y: 0.998; }
        frame 148 { x: 58.8; y: -57.7; skew-x: 37.9; skew-y: 37.9; scale-x: 0.996; scale-y: 0.996; }
        frame 149 { x: 50.9; y: -58.7; skew-x: 35.6; skew-y: 35.6; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 42.9; y: -59.6; skew-x: 33.2; skew-y: 33.2; scale-x: 0.997; scale-y: 0.997; }
        frame 151 { x: 29.8; y: -58.4; skew-x: 30.3; skew-y: 30.3; scale-x: 0.995; scale-y: 0.995; }
        frame 152 { x: 16.7; y: -57.1; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 3.8; y: -55.7; skew-x: 24.4; skew-y: 24.4; scale-x: 0.996; scale-y: 0.996; }
        frame 154 { x: -17.9; y: -46.4; skew-x: 14.1; skew-y: 14.1; scale-x: 0.994; scale-y: 0.994; }
        frame 155 { x: -38.1; y: -35.2; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: -56.1; y: -22.5; skew-x: -6.2; skew-y: -6.2; }
        frame 157 { x: -60.4; y: -15.6; skew-x: -9.4; skew-y: -9.4; scale-x: 0.993; scale-y: 0.993; }
        frame 158 { x: -64.5; y: -8.7; skew-x: -12.7; skew-y: -12.7; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: -68.4; y: -1.6; skew-x: -15.9; skew-y: -15.9; }
        frame 160 { x: -67.1; y: -4.7; skew-x: -14.5; skew-y: -14.5; scale-x: 0.992; scale-y: 0.992; }
        frame 161 { x: -65.9; y: -7.7; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: -64.8; y: -10.6; skew-x: -11.9; skew-y: -11.9; scale-x: 0.993; scale-y: 0.993; }
        frame 163 { x: -60.1; y: -18.3; skew-x: -8.2; skew-y: -8.2; scale-x: 0.992; scale-y: 0.992; }
        frame 164 { x: -55.1; y: -25.7; skew-x: -4.4; skew-y: -4.4; scale-x: -10000; scale-y: -10000; }
        frame 165 { x: -49.8; y: -33.1; skew-x: -0.7; skew-y: -0.7; }
        frame 166 { x: -44.5; y: -39.9; skew-x: 2.8; skew-y: 2.8; }
        frame 167 { x: -38.6; y: -46.8; skew-x: 6.6; skew-y: 6.6; }
        frame 168 { x: -29.9; y: -49.2; skew-x: 8.8; skew-y: 8.8; }
        frame 169 { x: -21.1; y: -51.6; skew-x: 11; skew-y: 11; }
        frame 170 { x: -12; y: -54; skew-x: 13.3; skew-y: 13.3; scale-x: 0.993; scale-y: 0.993; }
        frame 171 { x: -3.3; y: -53.6; skew-x: 15.5; skew-y: 15.5; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 5.5; y: -53.1; skew-x: 17.8; skew-y: 17.8; }
        frame 173 { x: 14.4; y: -52.7; skew-x: 20.3; skew-y: 20.3; scale-x: 0.995; scale-y: 0.995; }
        frame 174 { x: 25.2; y: -54.4; skew-x: 24.1; skew-y: 24.1; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 36.4; y: -56; skew-x: 28.1; skew-y: 28.1; scale-x: 0.996; scale-y: 0.996; }
        frame 176 { x: 47.6; y: -57.3; skew-x: 32; skew-y: 32; scale-x: 0.998; scale-y: 0.998; }
        frame 177 { x: 45.3; y: -58.3; skew-x: 32.6; skew-y: 32.6; scale-x: 0.996; scale-y: 0.996; }
        frame 178 { x: 42.9; y: -59.6; skew-x: 33.2; skew-y: 33.2; scale-x: 0.997; scale-y: 0.997; }
        frame 179 { x: 29.8; y: -58.4; skew-x: 30.3; skew-y: 30.3; scale-x: 0.995; scale-y: 0.995; }
        frame 180 { x: 16.7; y: -57.1; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 181 { x: 3.8; y: -55.7; skew-x: 24.4; skew-y: 24.4; scale-x: 0.996; scale-y: 0.996; }
        frame 182 { x: -21.2; y: -46.4; skew-x: 14.1; skew-y: 14.1; scale-x: 0.994; scale-y: 0.994; }
        frame 183 { x: -44.7; y: -35.2; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: -66.1; y: -22.5; skew-x: -6.2; skew-y: -6.2; }
        frame 185 { x: -82.7; y: -12.4; skew-x: -8.7; skew-y: -8.7; scale-x: 0.992; scale-y: 0.992; }
        frame 186 { x: -99.1; y: -2.1; skew-x: -11.4; skew-y: -11.4; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: -126.5; y: 39.6; skew-x: -25.7; skew-y: -25.7; scale-x: 0.99; scale-y: 0.99; }
        frame 188 { x: -149.3; y: 82.8; skew-x: -40; skew-y: -40; scale-x: 0.991; scale-y: 0.991; }
        frame 189 { x: -148.1; y: 96; skew-x: -46.3; skew-y: -46.3; scale-x: 0.989; scale-y: 0.989; }
        frame 190 { x: -146.3; y: 109.1; skew-x: -52.3; skew-y: -52.3; scale-x: 0.99; scale-y: 0.99; }
        frame 191 { x: -148; y: 110.1; skew-x: -51.3; skew-y: -53.3; scale-x: 0.98; scale-y: 0.989; }
        frame 192 { x: -149.9; y: 111.1; skew-x: -50.3; skew-y: -54.3; scale-x: 0.973; scale-y: 0.991; }
        frame 193 { x: -149; y: 103.5; skew-x: -48.3; skew-y: -50.3; scale-x: 0.979; scale-y: 0.988; }
        frame 194 { x: -148.1; y: 96; skew-x: -46.3; skew-y: -46.3; scale-x: 0.989; scale-y: 0.989; }
        frame 195 { x: -147.2; y: 102.6; skew-x: -49.3; skew-y: -49.3; scale-x: 0.988; scale-y: 0.988; }
        frame 196 { x: -146.3; y: 109.1; skew-x: -52.3; skew-y: -52.3; scale-x: 0.99; scale-y: 0.99; }
    }
    Track {
        source-name: "Zombie_gargantuar_whiterope";
        frame-count: 197;
        frame 0 { x: 23.4; y: -30.4; skew-x: 357.2; skew-y: 357.2; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_WHITEROPE; }
        frame 1 { x: 24; y: -31.6; skew-x: 358; skew-y: 358; scale-x: 0.946; scale-y: 0.999; image: none; }
        frame 2 { x: 24.4; y: -32.7; skew-x: 358.7; skew-y: 358.7; scale-x: 0.892; scale-y: -10000; }
        frame 3 { x: 24.9; y: -33.9; skew-x: 359.3; skew-y: 359.3; scale-x: 0.839; scale-y: 0.998; }
        frame 4 { x: 23.5; y: -32.9; skew-x: 358.2; skew-y: 358.2; scale-x: 0.862; scale-y: -10000; }
        frame 5 { x: 22; y: -31.9; skew-x: 357; skew-y: 357; scale-x: 0.884; scale-y: 0.999; }
        frame 6 { x: 20.5; y: -30.8; skew-x: 355.9; skew-y: 355.9; scale-x: 0.907; scale-y: -10000; }
        frame 7 { x: 19.1; y: -29.7; skew-x: 354.7; skew-y: 354.7; scale-x: 0.93; }
        frame 8 { x: 17.6; y: -28.6; skew-x: 353.5; skew-y: 353.5; scale-x: 0.953; }
        frame 9 { x: 16.2; y: -27.5; skew-x: 352.5; skew-y: 352.5; scale-x: 0.976; }
        frame 10 { x: 14.7; y: -26.2; skew-x: 351.2; skew-y: 351.2; scale-x: 0.999; }
        frame 11 { x: 14.5; y: -25.9; skew-x: 352.5; skew-y: 349.5; scale-x: 1.021; scale-y: 1.003; }
        frame 12 { x: 14.2; y: -25.6; skew-x: 353.7; skew-y: 347.7; scale-x: 1.044; scale-y: 1.006; }
        frame 13 { x: 14; y: -25.2; skew-x: 354.7; skew-y: 345.9; scale-x: 1.066; scale-y: 1.011; }
        frame 14 { x: 15.2; y: -25.9; skew-x: 355.2; skew-y: 347.4; scale-x: 1.058; scale-y: 1.009; }
        frame 15 { x: 16.4; y: -26.5; skew-x: 355.5; skew-y: 348.7; scale-x: 1.049; scale-y: 1.007; }
        frame 16 { x: 17.6; y: -27.1; skew-x: 355.7; skew-y: 350.2; scale-x: 1.041; scale-y: 1.006; }
        frame 17 { x: 18.8; y: -27.8; skew-x: 356; skew-y: 351.7; scale-x: 1.033; scale-y: 1.005; }
        frame 18 { x: 19.9; y: -28.5; skew-x: 356.4; skew-y: 353; scale-x: 1.025; scale-y: 1.004; }
        frame 19 { x: 21.2; y: -29; skew-x: 356.7; skew-y: 354.5; scale-x: 1.016; scale-y: 1.002; }
        frame 20 { x: 22.3; y: -29.7; skew-x: 357; skew-y: 356; scale-x: 1.008; scale-y: 1.001; }
        frame 21 { x: 23.4; y: -30.4; skew-x: 357.2; skew-y: 357.2; scale-x: 1; scale-y: 1; }
        frame 22 { x: 26.7; y: -33.3; skew-x: 359; skew-y: 359; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 28.2; y: -34; skew-x: 360; skew-y: 360; scale-x: 1.018; }
        frame 24 { x: 29.8; y: -34.6; skew-x: 360.5; skew-y: 360.5; scale-x: 1.035; }
        frame 25 { x: 31.3; y: -35.2; skew-x: 361.3; skew-y: 361.3; scale-x: 1.053; }
        frame 26 { x: 32.9; y: -36; skew-x: 362.3; skew-y: 362.3; scale-x: 1.071; scale-y: 0.999; }
        frame 27 { x: 34.5; y: -36.8; skew-x: 363.1; skew-y: 363.1; scale-x: 1.089; scale-y: 1; }
        frame 28 { x: 35.3; y: -37.3; skew-x: 363.5; skew-y: 363.5; scale-x: 1.104; scale-y: 0.999; }
        frame 29 { x: 36; y: -37.9; skew-x: 364; skew-y: 364; scale-x: 1.119; scale-y: -10000; }
        frame 30 { x: 36.8; y: -38.5; skew-x: 364.5; skew-y: 364.5; scale-x: 1.134; }
        frame 31 { x: 37.6; y: -39.1; skew-x: 365; skew-y: 365; scale-x: 1.15; }
        frame 32 { x: 38.4; y: -39.7; skew-x: 365.6; skew-y: 365.6; scale-x: 1.165; }
        frame 33 { x: 30.7; y: -35.6; skew-x: 362; skew-y: 362; scale-x: 1.116; }
        frame 34 { x: 23.1; y: -31.6; skew-x: 358.7; skew-y: 358.5; scale-x: 1.067; }
        frame 35 { x: 15.7; y: -27.7; skew-x: 355.2; skew-y: 355; scale-x: 1.018; scale-y: 0.998; }
        frame 36 { x: 8.3; y: -23.8; skew-x: 351.6; skew-y: 351.2; scale-x: 0.969; scale-y: 0.999; }
        frame 37 { x: -10000; y: -23.6; skew-x: 351.7; skew-y: -10000; scale-x: 0.933; scale-y: 0.998; }
        frame 38 { y: -23.2; skew-x: -10000; skew-y: 351.3; scale-x: 0.898; scale-y: -10000; }
        frame 39 { x: 9.7; y: -24.3; skew-x: 352.7; skew-y: 352.2; scale-x: 0.938; scale-y: 0.997; }
        frame 40 { x: 11.1; y: -25.5; skew-x: 353.5; skew-y: 353; scale-x: 0.978; scale-y: 0.998; }
        frame 41 { x: 12.5; y: -26.7; skew-x: 354.1; skew-y: 353.8; scale-x: 1.018; scale-y: -10000; }
        frame 42 { x: 14.1; y: -27.4; skew-x: 354.7; skew-y: 354.5; scale-x: -10000; }
        frame 43 { x: 15.7; y: -28; skew-x: 355.2; skew-y: 355; }
        frame 44 { x: 17.3; y: -28.6; skew-x: 355.9; skew-y: 355.5; }
        frame 45 { x: 18.9; y: -29.3; skew-x: 356.5; skew-y: 356; }
        frame 46 { x: 20.5; y: -29.9; skew-x: 356.9; skew-y: 356.5; }
        frame 47 { x: 22; y: -30.7; skew-x: 357.7; skew-y: 357.5; scale-x: 1.047; }
        frame 48 { x: 23.4; y: -31.7; skew-x: 358.7; skew-y: 358.2; scale-x: 1.077; }
        frame 49 { x: 24.9; y: -32.4; skew-x: 359.5; skew-y: 359; scale-x: 1.106; }
        frame 50 { x: 26.3; y: -33.3; skew-x: 360; skew-y: 360; scale-x: 1.136; }
        frame 51 { x: 27.7; y: -34.3; skew-x: 361; skew-y: 360.6; scale-x: 1.166; }
        frame 52 { x: 30.1; y: -35.1; skew-x: 362.1; skew-y: 361.8; scale-x: 1.175; }
        frame 53 { x: 32.5; y: -36; skew-x: 363.3; skew-y: 363; scale-x: 1.185; }
        frame 54 { x: 34.9; y: -36.9; skew-x: 364.5; skew-y: 364.3; scale-x: 1.195; }
        frame 55 { x: 37.3; y: -37.8; skew-x: 365.8; skew-y: 365.3; scale-x: 1.205; scale-y: 0.997; }
        frame 56 { x: 39.6; y: -38.7; skew-x: 367; skew-y: 366.7; scale-x: 1.216; scale-y: 0.998; }
        frame 57 { x: 31.5; y: -34.7; skew-x: 363.1; skew-y: 362.8; scale-x: 1.154; scale-y: -10000; }
        frame 58 { x: 23.6; y: -31; skew-x: 359.5; skew-y: 359; scale-x: 1.093; }
        frame 59 { x: 15.8; y: -27.5; skew-x: 355.7; skew-y: 355.2; scale-x: 1.031; }
        frame 60 { x: 8.3; y: -23.8; skew-x: 351.6; skew-y: 351.2; scale-x: 0.969; scale-y: 0.999; }
        frame 61 { x: -10000; y: -23.6; skew-x: 351.7; skew-y: -10000; scale-x: 0.933; scale-y: 0.998; }
        frame 62 { y: -23.2; skew-x: -10000; skew-y: 351.3; scale-x: 0.898; scale-y: -10000; }
        frame 63 { x: 12.1; y: -25.3; skew-x: 353.7; skew-y: 353.4; scale-x: 0.909; scale-y: 0.997; }
        frame 64 { x: 16.1; y: -27.6; skew-x: 355.7; skew-y: 355.4; scale-x: 0.92; scale-y: -10000; }
        frame 65 { x: 19.8; y: -29.7; skew-x: 357.5; skew-y: 357.3; scale-x: 0.931; scale-y: 0.998; }
        frame 66 { x: 21.2; y: -30.4; skew-x: 358; skew-y: 357.7; scale-x: 0.945; scale-y: -10000; }
        frame 67 { x: 22.5; y: -31.1; skew-x: 358.2; skew-y: 358; scale-x: 0.959; }
        frame 68 { x: 23.9; y: -31.7; skew-x: 358.5; skew-y: 358.5; scale-x: 0.972; scale-y: 0.999; }
        frame 69 { x: 25.2; y: -32.4; skew-x: 358.7; skew-y: 358.7; scale-x: 0.986; scale-y: -10000; }
        frame 70 { x: 26.7; y: -33.3; skew-x: 359; skew-y: 359; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 31.8; y: -33; skew-x: 361.5; skew-y: 361.5; scale-x: 1.013; scale-y: 0.999; }
        frame 73 { x: 37; y: -32.7; skew-x: 364; skew-y: 364; scale-x: 1.026; scale-y: -10000; }
        frame 74 { x: 42.1; y: -32.5; skew-x: 366.5; skew-y: 366.5; scale-x: 1.039; }
        frame 75 { x: 47.5; y: -32.2; skew-x: 369; skew-y: 369; scale-x: 1.052; }
        frame 76 { x: 52.7; y: -32.1; skew-x: 371.5; skew-y: 371.5; scale-x: 1.065; scale-y: 0.998; }
        frame 77 { x: 58.1; y: -31.9; skew-x: 374.1; skew-y: 374.1; scale-x: 1.078; scale-y: -10000; }
        frame 78 { x: 63.5; y: -31.6; skew-x: 376.6; skew-y: 376.6; scale-x: 1.091; }
        frame 79 { x: 69.1; y: -10000; skew-x: 379.2; skew-y: 379.2; scale-x: 1.105; scale-y: 0.999; }
        frame 80 { x: 71.5; y: -30.7; skew-x: 380.8; skew-y: 380.8; scale-x: 1.134; scale-y: 0.997; }
        frame 81 { x: 74; y: -29.8; skew-x: 382.3; skew-y: 382.3; scale-x: 1.164; scale-y: -10000; }
        frame 82 { x: 76.5; y: -29; skew-x: 383.8; skew-y: 383.8; scale-x: 1.194; }
        frame 83 { x: 79; y: -28.2; skew-x: 385.3; skew-y: 385.3; scale-x: 1.224; }
        frame 84 { x: 81.6; y: -27.5; skew-x: 387; skew-y: 387; scale-x: 1.254; }
        frame 85 { x: 84.3; y: -26.7; skew-x: 388.6; skew-y: 388.6; scale-x: 1.286; scale-y: 0.998; }
        frame 86 { x: 80.7; y: -31.9; skew-x: 389.6; skew-y: 389.6; scale-x: 1.229; scale-y: 0.996; }
        frame 87 { x: 77; y: -37.2; skew-x: 390.6; skew-y: 390.6; scale-x: 1.176; scale-y: -10000; }
        frame 88 { x: 66.8; y: -38.7; skew-x: 384.1; skew-y: 384.1; scale-x: 1.122; scale-y: 0.995; }
        frame 89 { x: 57; y: -40.4; skew-x: 377.5; skew-y: 377.5; scale-x: 1.07; scale-y: 0.997; }
        frame 90 { x: 29.3; y: -35.4; skew-x: 365.3; skew-y: 365.3; scale-x: 0.837; scale-y: 0.993; }
        frame 91 { x: 5.5; y: -24.3; skew-x: 357.9; skew-y: 360.7; scale-x: 0.592; scale-y: 0.807; }
        frame 92 { x: -18.9; y: -13.1; skew-x: 350.1; skew-y: 353; scale-x: 0.69; scale-y: 0.806; }
        frame 93 { x: -10000; y: -10000; skew-x: 350.2; skew-y: -10000; scale-x: 0.689; scale-y: -10000; }
        frame 94 { skew-x: 350.1; scale-x: 0.69; }
        frame 95 { skew-x: 350.2; scale-x: 0.689; }
        frame 96 { skew-x: 350.1; scale-x: 0.69; }
        frame 97 { x: -12.3; y: -15.9; skew-x: 351.5; skew-y: 354; scale-x: 0.734; scale-y: 0.834; }
        frame 98 { x: -5.8; y: -18.8; skew-x: 352.7; skew-y: 354.7; scale-x: 0.778; scale-y: 0.861; }
        frame 99 { x: 0.6; y: -21.6; skew-x: 354; skew-y: 355.7; scale-x: 0.822; scale-y: 0.889; }
        frame 100 { x: 7.1; y: -24.6; skew-x: 355.2; skew-y: 356.5; scale-x: 0.867; scale-y: 0.917; }
        frame 101 { x: 13.7; y: -27.6; skew-x: 356.5; skew-y: 357.4; scale-x: 0.911; scale-y: 0.944; }
        frame 102 { x: 20.2; y: -30.7; skew-x: 357.9; skew-y: 358.2; scale-x: 0.955; scale-y: 0.972; }
        frame 103 { x: 26.7; y: -33.3; skew-x: 359; skew-y: 359; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 26.4; y: -32.5; skew-x: 358.7; skew-y: 358.7; scale-x: 0.986; scale-y: 0.999; }
        frame 106 { x: 26.1; y: -31.6; skew-x: 358.2; skew-y: 358.2; scale-x: 0.972; scale-y: -10000; }
        frame 107 { x: 25.8; y: -30.7; skew-x: 357.7; skew-y: 357.7; scale-x: 0.958; }
        frame 108 { x: 25.5; y: -30; skew-x: 357.2; skew-y: 357.2; scale-x: 0.944; scale-y: 0.998; }
        frame 109 { x: 25.2; y: -29.2; skew-x: 356.9; skew-y: 356.9; scale-x: 0.93; scale-y: -10000; }
        frame 110 { x: 24.9; y: -28.4; skew-x: 356.5; skew-y: 356.5; scale-x: 0.917; }
        frame 111 { x: 24.6; y: -27.5; skew-x: 356; skew-y: 356; scale-x: 0.903; scale-y: 0.997; }
        frame 112 { x: 24.3; y: -26.8; skew-x: 355.4; skew-y: 355.4; scale-x: 0.889; scale-y: -10000; }
        frame 113 { x: 22; y: -25.3; skew-x: 353.9; skew-y: 353.9; scale-x: 0.86; }
        frame 114 { x: 19.6; y: -23.8; skew-x: 352.2; skew-y: 352.2; scale-x: 0.831; scale-y: 0.996; }
        frame 115 { x: 17.3; y: -22.4; skew-x: 350.7; skew-y: 350.7; scale-x: 0.803; scale-y: -10000; }
        frame 116 { x: 14.9; y: -21; skew-x: 349; skew-y: 349; scale-x: 0.774; }
        frame 117 { x: 12.6; y: -19.9; skew-x: 347.3; skew-y: 347.3; scale-x: 0.746; scale-y: 0.997; }
        frame 118 { x: 10.9; y: -18.8; skew-x: 347; skew-y: 345.5; scale-x: 0.71; scale-y: 0.996; }
        frame 119 { x: 9.1; y: -17.7; skew-x: 346.5; skew-y: 343.7; scale-x: 0.675; scale-y: 0.995; }
        frame 120 { x: 7.3; y: -16.6; skew-x: 346.2; skew-y: 341.7; scale-x: 0.64; scale-y: -10000; }
        frame 121 { x: 5.6; y: -15.3; skew-x: 345.6; skew-y: 339.8; scale-x: 0.606; scale-y: 0.996; }
        frame 122 { x: -10000; y: -15.4; skew-x: 345.7; skew-y: 339.9; scale-x: 0.605; scale-y: 0.995; }
        frame 123 { y: -15.3; skew-x: 345.6; skew-y: 339.8; scale-x: 0.606; scale-y: 0.996; }
        frame 124 { x: 5.7; y: -18.3; skew-x: 338.6; skew-y: 332.9; scale-x: 0.428; scale-y: 0.995; }
        frame 125 { x: 8.4; y: -20.4; skew-x: 342.9; skew-y: 337.2; scale-x: 0.337; scale-y: 0.878; }
        frame 126 { x: 11.1; y: -22.2; skew-x: 347.2; skew-y: 341.4; scale-x: 0.246; scale-y: 0.763; }
        frame 127 { x: 13.9; y: -23.5; skew-x: 351.4; skew-y: 345.5; scale-x: 0.156; scale-y: 0.647; }
        frame 128 { x: 16.5; y: -24.6; skew-x: 355.5; skew-y: 349.7; scale-x: 0.065; scale-y: 0.532; }
        frame 129 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 130 { cel: -10000; }
        frame 138 { x: 23.4; y: -30.4; skew-x: 357.2; skew-y: 357.2; scale-x: 1; scale-y: 1; cel: 0; }
        frame 139 { x: 26.3; y: -28.7; skew-x: -10000; skew-y: -10000; scale-x: 0.78; scale-y: 0.85; cel: -10000; }
        frame 140 { x: 29.2; y: -27.1; scale-x: 0.559; scale-y: 0.7; }
        frame 141 { x: 32; y: -25.5; scale-x: 0.339; scale-y: 0.551; }
        frame 142 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 143 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_innerarm_lower";
        frame-count: 197;
        frame 0 { x: 62.3; y: -36.7; skew-x: 30; skew-y: 30; image: IMAGE_REANIM_ZOMBIE_IMP_ARM2; }
        frame 1 { x: 61.3; y: -37.7; skew-x: 31.6; skew-y: 31.6; scale-x: 0.998; scale-y: 0.998; image: none; }
        frame 2 { x: 60.2; y: -38.6; skew-x: 33.3; skew-y: 33.3; scale-x: 0.997; scale-y: 0.997; }
        frame 3 { x: 59.2; y: -39.5; skew-x: 34.9; skew-y: 34.9; scale-x: 0.998; scale-y: 0.998; }
        frame 4 { x: 57.7; y: -39; skew-x: 33.3; skew-y: 33.3; scale-x: 0.997; scale-y: 0.997; }
        frame 5 { x: 56.2; y: -38.6; skew-x: 31.8; skew-y: 31.8; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 54.8; y: -38.1; skew-x: 30.1; skew-y: 30.1; }
        frame 7 { x: 53.3; y: -37.6; skew-x: 28.6; skew-y: 28.6; scale-x: 0.998; scale-y: 0.998; }
        frame 8 { x: 51.9; y: -37.1; skew-x: 27.1; skew-y: 27.1; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 50.4; y: -36.6; skew-x: 25.5; skew-y: 25.5; }
        frame 10 { x: 49; y: -36.2; skew-x: 24; skew-y: 24; scale-x: 1; scale-y: 1; }
        frame 11 { x: 49.5; y: -35.2; skew-x: 20.5; skew-y: 20.5; scale-x: 0.998; scale-y: 0.998; }
        frame 12 { x: 50; y: -34.2; skew-x: 17.1; skew-y: 17.1; scale-x: -10000; scale-y: 0.997; }
        frame 13 { x: 50.5; y: -33.3; skew-x: 13.8; skew-y: 13.8; scale-y: 0.998; }
        frame 14 { x: 52; y: -33.7; skew-x: 15.8; skew-y: 15.8; scale-x: 0.997; scale-y: 0.997; }
        frame 15 { x: 53.4; y: -34.2; skew-x: 17.8; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 54.8; y: -34.6; skew-x: 19.8; skew-y: 19.8; scale-x: 0.998; scale-y: 0.998; }
        frame 17 { x: 56.3; y: -35; skew-x: 21.8; skew-y: 21.8; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 57.8; y: -35.5; skew-x: 23.8; skew-y: 23.8; }
        frame 19 { x: 59.3; y: -35.8; skew-x: 25.8; skew-y: 25.8; }
        frame 20 { x: 60.6; y: -36.3; skew-x: 27.8; skew-y: 27.8; }
        frame 21 { x: 62.3; y: -36.7; skew-x: 30; skew-y: 30; scale-x: 1; scale-y: 1; }
        frame 22 { x: 67.1; y: -39; skew-x: 33.8; skew-y: 33.8; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 69.3; y: -10000; skew-x: 31.1; skew-y: 31.1; scale-x: 1.032; scale-y: 0.998; }
        frame 24 { x: 71.5; y: -38.9; skew-x: 28.6; skew-y: 28.6; scale-x: 1.066; scale-y: 0.997; }
        frame 25 { x: 73.8; y: -39; skew-x: 26.1; skew-y: 26.1; scale-x: 1.1; scale-y: -10000; }
        frame 26 { x: 76; y: -10000; skew-x: 23.3; skew-y: 23.3; scale-x: 1.134; }
        frame 27 { x: 78.1; skew-x: 20.9; skew-y: 20.9; scale-x: 1.169; }
        frame 28 { x: 79.1; y: -39.3; skew-x: 20; skew-y: 20; scale-x: 1.2; scale-y: 0.996; }
        frame 29 { x: 80; y: -39.5; skew-x: 19.3; skew-y: 19.3; scale-x: 1.233; scale-y: -10000; }
        frame 30 { x: 80.8; y: -39.8; skew-x: 18.5; skew-y: 18.5; scale-x: 1.266; }
        frame 31 { x: 81.8; y: -40; skew-x: 17.6; skew-y: 17.6; scale-x: 1.299; }
        frame 32 { x: 82.7; y: -40.4; skew-x: 16.9; skew-y: 16.9; scale-x: 1.333; scale-y: 0.997; }
        frame 33 { x: 75.9; y: -39.6; skew-x: 20.3; skew-y: 20.3; scale-x: 1.284; scale-y: 0.994; }
        frame 34 { x: 69.1; y: -38.9; skew-x: 23.6; skew-y: 23.6; scale-x: 1.238; scale-y: 0.993; }
        frame 35 { x: 57; y: -36.4; skew-x: 21.5; skew-y: 21.5; scale-x: 1.191; scale-y: 0.992; }
        frame 36 { x: 44.9; y: -33.7; skew-x: 19.5; skew-y: 19.5; scale-x: 1.146; scale-y: 0.993; }
        frame 37 { x: 43.1; y: -33.1; skew-x: 18.3; skew-y: 18.3; scale-x: 1.144; scale-y: 0.991; }
        frame 38 { x: 41.3; y: -32.4; skew-x: 17; skew-y: 17; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 43.8; y: -33.1; skew-x: 13.5; skew-y: 13.5; }
        frame 40 { x: 46.3; y: -33.8; skew-x: 10; skew-y: 10; scale-x: 1.145; scale-y: 0.992; }
        frame 41 { x: 48.9; y: -34.5; skew-x: 6.5; skew-y: 6.5; scale-x: 1.146; scale-y: 0.993; }
        frame 42 { x: 51.2; y: -35; skew-x: 7.1; skew-y: 7.1; scale-x: 1.145; scale-y: 0.992; }
        frame 43 { x: 53.6; y: -35.4; skew-x: 7.8; skew-y: 7.8; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 56; y: -35.9; skew-x: 8.5; skew-y: 8.5; }
        frame 45 { x: 58.4; y: -36.4; skew-x: 9.3; skew-y: 9.3; }
        frame 46 { x: 60.9; y: -37; skew-x: 9.9; skew-y: 9.9; }
        frame 47 { x: 62.9; y: -37.3; skew-x: 10.3; skew-y: 10.3; scale-x: 1.144; scale-y: 0.991; }
        frame 48 { x: 64.9; y: -37.7; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 67.1; y: -38.1; skew-x: 11.3; skew-y: 11.3; scale-x: 1.143; scale-y: 0.99; }
        frame 50 { x: 69.1; y: -38.5; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 71.2; y: -38.8; skew-x: 12.3; skew-y: 12.3; scale-y: 0.991; }
        frame 52 { x: 74.3; y: -39.1; skew-x: 14.5; skew-y: 14.5; scale-x: 1.142; scale-y: 0.99; }
        frame 53 { x: 77.4; y: -39.3; skew-x: 16.8; skew-y: 16.8; scale-x: -10000; scale-y: 0.989; }
        frame 54 { x: 80.4; y: -39.6; skew-x: 19; skew-y: 19; scale-y: -10000; }
        frame 55 { x: 83.6; y: -39.7; skew-x: 21.3; skew-y: 21.3; }
        frame 56 { x: 86.6; y: -39.9; skew-x: 23.6; skew-y: 23.6; scale-x: 1.143; scale-y: 0.99; }
        frame 57 { x: 78; y: -38.4; skew-x: 21.5; skew-y: 21.5; scale-x: 1.141; scale-y: 0.988; }
        frame 58 { x: 69.3; y: -36.8; skew-x: 19.5; skew-y: 19.5; scale-x: 1.142; scale-y: 0.989; }
        frame 59 { x: 57.1; y: -35.3; skew-x: -10000; skew-y: -10000; scale-x: 1.143; scale-y: 0.99; }
        frame 60 { x: 44.9; y: -33.7; scale-x: 1.146; scale-y: 0.993; }
        frame 61 { x: 43.1; y: -33.1; skew-x: 18.3; skew-y: 18.3; scale-x: 1.144; scale-y: 0.991; }
        frame 62 { x: 41.3; y: -32.4; skew-x: 17; skew-y: 17; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 45.9; y: -33.5; skew-x: 19.8; skew-y: 19.8; scale-x: 1.127; }
        frame 64 { x: 50.7; y: -34.6; skew-x: 22.8; skew-y: 22.8; scale-x: 1.11; }
        frame 65 { x: 55.5; y: -35.8; skew-x: 25.9; skew-y: 25.9; scale-x: 1.095; scale-y: 0.993; }
        frame 66 { x: 57.9; y: -36.5; skew-x: 27.3; skew-y: 27.3; scale-x: 1.074; scale-y: -10000; }
        frame 67 { x: 60.1; y: -37.1; skew-x: 29.1; skew-y: 29.1; scale-x: 1.055; scale-y: 0.994; }
        frame 68 { x: 62.5; y: -37.8; skew-x: 30.6; skew-y: 30.6; scale-x: 1.036; scale-y: 0.996; }
        frame 69 { x: 64.8; y: -38.4; skew-x: 32.1; skew-y: 32.1; scale-x: 1.017; scale-y: 0.997; }
        frame 70 { x: 67.1; y: -39; skew-x: 33.8; skew-y: 33.8; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 73.4; y: -36.8; skew-x: 36.6; skew-y: 36.6; scale-x: 0.998; scale-y: 0.998; }
        frame 73 { x: 79.7; y: -34.6; skew-x: 39.6; skew-y: 39.6; scale-x: 0.997; scale-y: 0.997; }
        frame 74 { x: 85.8; y: -32.4; skew-x: 42.4; skew-y: 42.4; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 92.2; y: -30.1; skew-x: 45.4; skew-y: 45.4; scale-x: 0.996; }
        frame 76 { x: 98.4; y: -27.8; skew-x: 48.1; skew-y: 48.1; scale-x: -10000; scale-y: 0.996; }
        frame 77 { x: 104.8; y: -25.5; skew-x: 51.1; skew-y: 51.1; scale-y: -10000; }
        frame 78 { x: 111.1; y: -23.2; skew-x: 53.9; skew-y: 53.9; scale-x: 0.995; scale-y: 0.995; }
        frame 79 { x: 117.2; y: -20.9; skew-x: 56.8; skew-y: 56.8; scale-x: 0.996; scale-y: 0.997; }
        frame 80 { x: 120.6; y: -17.9; skew-x: 60.2; skew-y: 60.2; scale-x: 0.995; scale-y: 0.995; }
        frame 81 { x: 123.9; y: -14.9; skew-x: 63.5; skew-y: 63.5; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 127.3; y: -11.9; skew-x: 66.9; skew-y: 66.9; }
        frame 83 { x: 130.6; y: -8.8; skew-x: 70.2; skew-y: 70.2; }
        frame 84 { x: 133.9; y: -5.8; skew-x: 73.7; skew-y: 73.7; }
        frame 85 { x: 137.1; y: -2.7; skew-x: 76.9; skew-y: 76.9; }
        frame 86 { x: 128; y: -11; skew-x: 69.5; skew-y: 69.5; scale-x: 0.993; scale-y: 0.993; }
        frame 87 { x: 118.9; y: -19.4; skew-x: 62; skew-y: 62; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 107.3; y: -26.2; skew-x: 50.4; skew-y: 50.4; scale-x: 0.991; scale-y: 0.991; }
        frame 89 { x: 95.3; y: -32.5; skew-x: 38.5; skew-y: 38.5; scale-x: 0.993; scale-y: 0.993; }
        frame 90 { x: 55.1; y: -36.8; skew-x: 19.2; skew-y: 19.2; scale-x: 0.991; scale-y: 0.991; }
        frame 91 { x: 22.8; y: -30.8; skew-x: 15; skew-y: 15; scale-x: 0.989; scale-y: 0.989; }
        frame 92 { x: 2.8; y: -23.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 3; y: -23.2; skew-x: 16.5; skew-y: 16.5; scale-x: 0.988; scale-y: 0.988; }
        frame 94 { x: 3.2; y: -22.8; skew-x: 18.2; skew-y: 18.2; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 3; y: -23.2; skew-x: 16.5; skew-y: 16.5; }
        frame 96 { x: 2.8; y: -23.6; skew-x: 15; skew-y: 15; scale-x: 0.989; scale-y: 0.989; }
        frame 97 { x: 12; y: -25.9; skew-x: 17.6; skew-y: 17.6; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 21.1; y: -28; skew-x: 20.3; skew-y: 20.3; scale-x: 0.991; scale-y: 0.991; }
        frame 99 { x: 30.3; y: -30.2; skew-x: 23; skew-y: 23; scale-x: 0.992; scale-y: 0.992; }
        frame 100 { x: 39.4; y: -32.4; skew-x: 25.6; skew-y: 25.6; scale-x: 0.994; scale-y: 0.994; }
        frame 101 { x: 48.5; y: -34.5; skew-x: 28.3; skew-y: 28.3; scale-x: 0.995; scale-y: 0.995; }
        frame 102 { x: 57.8; y: -36.7; skew-x: 31.1; skew-y: 31.1; scale-x: 0.997; scale-y: 0.997; }
        frame 103 { x: 67.1; y: -39; skew-x: 33.8; skew-y: 33.8; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 66.1; y: -38.3; skew-x: 31.6; skew-y: 31.6; scale-x: 0.997; scale-y: 0.997; }
        frame 106 { x: 65.1; y: -37.7; skew-x: 29.6; skew-y: 29.6; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 64.1; y: -37.1; skew-x: 27.5; skew-y: 27.5; scale-x: 0.996; scale-y: 0.996; }
        frame 108 { x: 63; y: -36.4; skew-x: 25.3; skew-y: 25.3; scale-x: 0.995; scale-y: 0.995; }
        frame 109 { x: 62; y: -35.7; skew-x: 23.3; skew-y: 23.3; scale-x: 0.994; scale-y: 0.994; }
        frame 110 { x: 61.1; y: -35.1; skew-x: 21.1; skew-y: 21.1; scale-x: 0.993; scale-y: 0.993; }
        frame 111 { x: 60.1; y: -34.4; skew-x: 19.1; skew-y: 19.1; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 59.1; y: -33.7; skew-x: 17.1; skew-y: 17.1; }
        frame 113 { x: 55.4; y: -33.3; skew-x: 15.5; skew-y: 15.5; scale-x: 0.992; scale-y: 0.992; }
        frame 114 { x: 51.6; y: -33; skew-x: 14; skew-y: 14; scale-x: 0.991; scale-y: 0.991; }
        frame 115 { x: 47.9; y: -32.6; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 44; y: -32.3; skew-x: 11.1; skew-y: 11.1; }
        frame 117 { x: 40.4; y: -32; skew-x: 9.7; skew-y: 9.7; }
        frame 118 { x: 35.5; y: -29.6; skew-x: 0.5; skew-y: 0.5; scale-x: 0.962; scale-y: 0.99; }
        frame 119 { x: 30.7; y: -27.3; skew-x: -8.4; skew-y: -8.4; scale-x: 0.932; scale-y: 0.989; }
        frame 120 { x: 26.3; y: -24.9; skew-x: -17.7; skew-y: -17.7; scale-x: 0.902; scale-y: 0.988; }
        frame 121 { x: 22.1; y: -22.6; skew-x: -26.8; skew-y: -26.8; scale-x: 0.873; scale-y: -10000; }
        frame 122 { x: -10000; y: -10000; skew-x: -26.7; skew-y: -26.7; scale-x: 0.872; scale-y: 0.986; }
        frame 123 { skew-x: -26.8; skew-y: -26.8; scale-x: 0.873; scale-y: 0.988; }
        frame 124 { x: 14.9; y: -24.2; skew-x: -53.1; skew-y: -53.1; scale-x: 0.87; scale-y: 0.985; }
        frame 125 { x: 9.7; y: -26.4; skew-x: -79.4; skew-y: -79.4; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 5.7; y: -29.8; skew-x: -105.5; skew-y: -105.5; scale-x: 0.869; scale-y: 0.983; }
        frame 127 { x: 2.4; y: -35; skew-x: -131.8; skew-y: -131.8; scale-x: 0.867; scale-y: 0.981; }
        frame 128 { x: -0.9; y: -41.9; skew-x: -158.2; skew-y: -158.2; scale-x: 0.868; scale-y: 0.982; }
        frame 129 { x: -56.7; y: -44.1; skew-x: -158.3; skew-y: -158.3; scale-x: 0.866; scale-y: 0.98; }
        frame 130 { x: -112.5; y: -46.3; skew-x: -158.4; skew-y: -158.4; scale-x: 0.867; scale-y: 0.981; }
        frame 131 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_outerarm_upper";
        frame-count: 197;
        frame 0 { x: 87.1; y: -31.4; skew-x: 31.9; skew-y: 31.9; scale-x: 0.998; scale-y: 0.998; image: IMAGE_REANIM_ZOMBIE_IMP_ARM1; }
        frame 1 { x: 85.1; y: -31; skew-x: 25.3; skew-y: 25.3; scale-x: 0.996; scale-y: 0.996; image: none; }
        frame 2 { x: 83.1; y: -30.5; skew-x: 18.8; skew-y: 18.8; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 81.1; y: -29.9; skew-x: 12.3; skew-y: 12.3; scale-x: 0.997; scale-y: 0.997; }
        frame 4 { x: 79.7; y: -29.8; skew-x: 10.5; skew-y: 10.5; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 78.2; y: -29.7; skew-x: 8.8; skew-y: 8.8; }
        frame 6 { x: 76.8; y: -10000; skew-x: 7.3; skew-y: 7.3; }
        frame 7 { x: 75.3; y: -29.6; skew-x: 5.6; skew-y: 5.6; scale-x: 0.998; scale-y: 0.998; }
        frame 8 { x: 74; y: -10000; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 72.6; y: -29.5; skew-x: 2.3; skew-y: 2.3; scale-x: 0.999; scale-y: 0.999; }
        frame 10 { x: 71.3; y: -29.4; skew-x: 0.7; skew-y: 0.7; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 73.4; y: -30; skew-x: 5.8; skew-y: 5.8; }
        frame 12 { x: 75.7; y: -30.5; skew-x: 10.8; skew-y: 10.8; scale-x: 0.998; scale-y: 0.998; }
        frame 13 { x: 77.8; y: -31; skew-x: 15.8; skew-y: 15.8; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 79; y: -10000; skew-x: 17.8; skew-y: 17.8; scale-x: 0.997; scale-y: 0.997; }
        frame 15 { x: 80.2; y: -31.1; skew-x: 19.8; skew-y: 19.8; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 81.3; y: -31.2; skew-x: 21.8; skew-y: 21.8; }
        frame 17 { x: 82.4; y: -10000; skew-x: 23.8; skew-y: 23.8; }
        frame 18 { x: 83.6; skew-x: 25.8; skew-y: 25.8; }
        frame 19 { x: 84.8; skew-x: 27.8; skew-y: 27.8; }
        frame 20 { x: 86; skew-x: 29.8; skew-y: 29.8; }
        frame 21 { x: 87.1; y: -31.4; skew-x: 31.9; skew-y: 31.9; scale-x: 0.998; scale-y: 0.998; }
        frame 22 { x: 90.8; y: -31.5; skew-x: 30.9; skew-y: 30.9; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 93.8; y: -31.3; skew-x: 32.1; skew-y: 32.1; scale-x: 1.023; scale-y: 0.996; }
        frame 24 { x: 96.8; y: -31.1; skew-x: 33.1; skew-y: 33.1; scale-x: 1.048; scale-y: 0.995; }
        frame 25 { x: 99.8; y: -30.9; skew-x: 34.3; skew-y: 34.3; scale-x: 1.074; scale-y: 0.994; }
        frame 26 { x: 102.8; y: -30.7; skew-x: 35.4; skew-y: 35.4; scale-x: 1.1; scale-y: 0.993; }
        frame 27 { x: 106; y: -30.2; skew-x: 36.5; skew-y: 36.5; scale-x: 1.127; scale-y: 0.994; }
        frame 28 { x: 106.8; y: -30.1; skew-x: 36.6; skew-y: 36.6; scale-x: 1.132; scale-y: 0.981; }
        frame 29 { x: 107.8; y: -29.9; skew-x: 36.9; skew-y: 36.9; scale-x: 1.139; scale-y: 0.97; }
        frame 30 { x: 108.7; y: -29.8; skew-x: 37.1; skew-y: 37.1; scale-x: 1.145; scale-y: 0.958; }
        frame 31 { x: 109.6; y: -29.6; skew-x: 37.4; skew-y: 37.4; scale-x: 1.152; scale-y: 0.947; }
        frame 32 { x: 110.5; y: -29.8; skew-x: 37.6; skew-y: 37.6; scale-x: 1.16; scale-y: 0.937; }
        frame 33 { x: 103.3; y: -30.1; skew-x: 35.1; skew-y: 35.8; scale-x: 1.171; scale-y: 0.964; }
        frame 34 { x: 96.1; y: -30.2; skew-x: 32.6; skew-y: 34; scale-x: 1.186; scale-y: 0.994; }
        frame 35 { x: 81.7; y: -30; skew-x: 12.5; skew-y: 13.3; scale-x: 1.166; scale-y: -10000; }
        frame 36 { x: 68.2; y: -29.2; skew-x: -7.3; skew-y: -7.3; scale-x: 1.147; scale-y: 0.995; }
        frame 37 { x: 67.2; y: -27.9; skew-x: -13.9; skew-y: -13.9; scale-x: 1.146; scale-y: 0.974; }
        frame 38 { x: 66.2; y: -26.5; skew-x: -20.5; skew-y: -20.5; scale-x: -10000; scale-y: 0.954; }
        frame 39 { x: 69.1; y: -27.7; skew-x: -13.7; skew-y: -13.7; scale-x: 1.145; scale-y: 0.967; }
        frame 40 { x: 72.1; y: -28.8; skew-x: -7; skew-y: -7; scale-x: 1.146; scale-y: 0.981; }
        frame 41 { x: 75.2; y: -29.9; skew-x: -0.5; skew-y: -0.5; scale-x: 1.147; scale-y: 0.995; }
        frame 42 { x: 77.8; y: -30.4; skew-x: 3.5; skew-y: 3.5; scale-x: 1.146; scale-y: 0.994; }
        frame 43 { x: 80.3; y: -30.7; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 82.8; y: -31.1; skew-x: 11.6; skew-y: 11.6; scale-x: 1.145; }
        frame 45 { x: 85.6; y: -31.4; skew-x: 15.8; skew-y: 15.8; scale-x: -10000; scale-y: 0.993; }
        frame 46 { x: 88.1; y: -31.8; skew-x: 19.9; skew-y: 19.9; scale-x: 1.146; scale-y: 0.994; }
        frame 47 { x: 90.6; y: -10000; skew-x: 21.8; skew-y: 21.8; scale-x: 1.144; scale-y: 0.992; }
        frame 48 { x: 93.1; y: -31.7; skew-x: 23.8; skew-y: 23.8; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 95.7; y: -10000; skew-x: 25.8; skew-y: 25.8; }
        frame 50 { x: 98.3; y: -31.6; skew-x: 28; skew-y: 28; scale-x: 1.143; }
        frame 51 { x: 100.6; y: -31.5; skew-x: 30; skew-y: 30; scale-x: 1.145; scale-y: 0.993; }
        frame 52 { x: 103.1; y: -30.6; skew-x: 32.4; skew-y: 32.4; scale-x: 1.143; scale-y: 0.991; }
        frame 53 { x: 105.7; y: -29.9; skew-x: 34.9; skew-y: 34.9; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 108.2; y: -29.2; skew-x: 37.4; skew-y: 37.4; scale-x: 1.142; }
        frame 55 { x: 110.8; y: -28.3; skew-x: 39.9; skew-y: 39.9; scale-x: -10000; }
        frame 56 { x: 113.3; y: -27.5; skew-x: 42.4; skew-y: 42.4; scale-x: 1.144; scale-y: 0.992; }
        frame 57 { x: 103.7; y: -28; skew-x: 34.8; skew-y: 34.8; scale-x: 1.142; scale-y: 0.991; }
        frame 58 { x: 94.3; y: -28.5; skew-x: 27.2; skew-y: 27.4; scale-x: 1.144; scale-y: 0.992; }
        frame 59 { x: 81.2; y: -29.5; skew-x: 13.3; skew-y: 13.3; scale-x: 1.145; scale-y: 0.993; }
        frame 60 { x: 68.8; y: -30.2; skew-x: -0.5; skew-y: -0.5; scale-x: 1.147; scale-y: 0.995; }
        frame 61 { x: 66.8; y: -28.3; skew-x: -11.4; skew-y: -11.4; scale-x: 1.146; scale-y: 0.974; }
        frame 62 { x: 65.1; y: -26.5; skew-x: -22.5; skew-y: -22.5; scale-x: -10000; scale-y: 0.954; }
        frame 63 { x: 69.8; y: -27.6; skew-x: -13.9; skew-y: -13.9; scale-x: 1.128; scale-y: 0.958; }
        frame 64 { x: 74.6; y: -28.8; skew-x: -5.2; skew-y: -5.2; scale-x: 1.112; scale-y: 0.963; }
        frame 65 { x: 79.7; y: -29.7; skew-x: 3.2; skew-y: 3.2; scale-x: 1.095; scale-y: 0.968; }
        frame 66 { x: 81.8; y: -30.3; skew-x: 8.6; skew-y: 8.6; scale-x: 1.075; scale-y: 0.974; }
        frame 67 { x: 84.1; y: -30.7; skew-x: 14.3; skew-y: 14.3; scale-x: 1.056; scale-y: 0.979; }
        frame 68 { x: 86.3; y: -31.1; skew-x: 19.8; skew-y: 19.8; scale-x: 1.036; scale-y: 0.985; }
        frame 69 { x: 88.7; y: -31.4; skew-x: 25.3; skew-y: 25.3; scale-x: 1.016; scale-y: 0.991; }
        frame 70 { x: 90.8; y: -31.5; skew-x: 30.9; skew-y: 30.9; scale-x: 0.998; scale-y: 0.998; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 96.6; y: -28; skew-x: 36.1; skew-y: 36.1; scale-x: 0.996; scale-y: 0.996; }
        frame 73 { x: 102.3; y: -24.4; skew-x: 41.1; skew-y: 41.1; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 108.2; y: -20.8; skew-x: 46.4; skew-y: 46.4; }
        frame 75 { x: 113.8; y: -16.9; skew-x: 51.4; skew-y: 51.4; scale-x: 0.995; scale-y: 0.995; }
        frame 76 { x: 119.6; y: -13.1; skew-x: 56.6; skew-y: 56.6; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 125.5; y: -9.2; skew-x: 61.7; skew-y: 61.7; }
        frame 78 { x: 131.3; y: -5.3; skew-x: 66.9; skew-y: 66.9; }
        frame 79 { x: 137.1; y: -1.3; skew-x: 71.9; skew-y: 71.9; scale-x: 0.996; scale-y: 0.996; }
        frame 80 { x: 139.2; y: 2.1; skew-x: 75.4; skew-y: 75.4; scale-x: 0.995; scale-y: 0.995; }
        frame 81 { x: 141.2; y: 5.8; skew-x: 78.7; skew-y: 78.7; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 143.2; y: 9.5; skew-x: 82.2; skew-y: 82.2; }
        frame 83 { x: 145.2; y: 13.2; skew-x: 85.5; skew-y: 85.5; }
        frame 84 { x: 147.2; y: 16.9; skew-x: 88.7; skew-y: 88.7; }
        frame 85 { x: 149.2; y: 20.6; skew-x: 92.1; skew-y: 92.1; }
        frame 86 { x: 142.3; y: 9.6; skew-x: 79.5; skew-y: 79.5; scale-x: 0.993; scale-y: 0.993; }
        frame 87 { x: 135.1; y: -0.8; skew-x: 66.7; skew-y: 66.7; scale-x: 0.992; scale-y: 0.992; }
        frame 88 { x: 126.3; y: -10.4; skew-x: 49.9; skew-y: 49.9; scale-x: 0.99; scale-y: 0.99; }
        frame 89 { x: 117.3; y: -19.2; skew-x: 32.9; skew-y: 32.9; scale-x: 0.992; scale-y: 0.992; }
        frame 90 { x: 78.6; y: -32.1; skew-x: -0.9; skew-y: -0.9; scale-x: 0.99; scale-y: 0.99; }
        frame 91 { x: 44.5; y: -26.8; skew-x: -33.7; skew-y: -33.7; scale-x: 0.987; scale-y: 0.987; }
        frame 92 { x: 23.7; y: -18; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 23.8; y: -17; scale-x: 0.986; scale-y: 0.986; }
        frame 94 { x: 23.7; y: -16; scale-x: 0.987; scale-y: 0.987; }
        frame 95 { x: -10000; y: -17; scale-x: 0.986; scale-y: 0.986; }
        frame 96 { y: -18; scale-x: 0.987; scale-y: 0.987; }
        frame 97 { x: 32.7; y: -20.2; skew-x: -24.5; skew-y: -24.5; scale-x: 0.988; scale-y: 0.988; }
        frame 98 { x: 41.8; y: -22.3; skew-x: -15.2; skew-y: -15.2; scale-x: 0.99; scale-y: 0.99; }
        frame 99 { x: 51.1; y: -24.5; skew-x: -5.9; skew-y: -5.9; scale-x: 0.992; scale-y: 0.992; }
        frame 100 { x: 60.8; y: -26.5; skew-x: 3; skew-y: 3; scale-x: 0.993; scale-y: 0.993; }
        frame 101 { x: 70.6; y: -28.4; skew-x: 12.3; skew-y: 12.3; scale-x: 0.994; scale-y: 0.994; }
        frame 102 { x: 80.5; y: -30; skew-x: 21.6; skew-y: 21.6; scale-x: 0.996; scale-y: 0.996; }
        frame 103 { x: 90.8; y: -31.5; skew-x: 30.9; skew-y: 30.9; scale-x: 0.998; scale-y: 0.998; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 89.3; y: -31.4; skew-x: 27.1; skew-y: 27.1; scale-x: 0.996; scale-y: 0.996; }
        frame 106 { x: 87.8; y: -31.3; skew-x: 23.1; skew-y: 23.1; scale-x: 0.995; scale-y: 0.995; }
        frame 107 { x: 86.5; y: -31.2; skew-x: 19.3; skew-y: 19.3; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 85; y: -31; skew-x: 15.5; skew-y: 15.5; scale-x: 0.994; scale-y: 0.994; }
        frame 109 { x: 83.6; y: -30.8; skew-x: 11.6; skew-y: 11.6; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 82.3; y: -30.5; skew-x: 7.8; skew-y: 7.8; scale-x: 0.993; scale-y: 0.993; }
        frame 111 { x: 81; y: -30.3; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 79.4; y: -30.1; skew-x: 0.2; skew-y: 0.2; scale-x: 0.992; scale-y: 0.992; }
        frame 113 { x: 75.3; y: -30.3; skew-x: -4.2; skew-y: -4.2; scale-x: 0.991; scale-y: 0.991; }
        frame 114 { x: 71.2; y: -10000; skew-x: -8.7; skew-y: -8.7; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 67.1; y: -30.5; skew-x: -13.2; skew-y: -13.2; scale-x: 0.99; scale-y: 0.99; }
        frame 116 { x: 63.1; y: -10000; skew-x: -17.5; skew-y: -17.5; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 59.2; skew-x: -22.1; skew-y: -22.1; scale-x: 0.991; scale-y: 0.991; }
        frame 118 { x: 54.4; y: -30; skew-x: -29.4; skew-y: -29.4; scale-x: 0.989; scale-y: 0.989; }
        frame 119 { x: 49.6; y: -29.3; skew-x: -36.7; skew-y: -36.7; scale-x: 0.988; scale-y: 0.988; }
        frame 120 { x: 45.1; y: -28.8; skew-x: -44; skew-y: -44; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 40.5; y: -28.2; skew-x: -51.2; skew-y: -51.2; scale-x: 0.989; scale-y: 0.989; }
        frame 122 { x: 40.6; y: -10000; skew-x: -51.3; skew-y: -51.3; scale-x: 0.987; scale-y: 0.987; }
        frame 123 { x: 40.5; skew-x: -51.2; skew-y: -51.2; scale-x: 0.989; scale-y: 0.989; }
        frame 124 { x: 31; y: -32.7; skew-x: -69.8; skew-y: -69.8; scale-x: 0.987; scale-y: 0.987; }
        frame 125 { x: 22.2; y: -37.8; skew-x: -88.4; skew-y: -88.4; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 13.7; y: -43.7; skew-x: -106.7; skew-y: -106.7; scale-x: 0.985; scale-y: 0.985; }
        frame 127 { x: 5.7; y: -50.5; skew-x: -125.3; skew-y: -125.3; scale-x: 0.983; scale-y: 0.983; }
        frame 128 { x: -2.3; y: -58.2; skew-x: -143.9; skew-y: -143.9; scale-x: 0.984; scale-y: 0.984; }
        frame 129 { x: -58.2; y: -60.4; skew-x: -144.1; skew-y: -144.1; scale-x: 0.982; scale-y: 0.982; }
        frame 130 { x: -114; y: -62.5; skew-x: -10000; skew-y: -10000; scale-x: 0.983; scale-y: 0.983; }
        frame 131 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_outerarm_lower";
        frame-count: 197;
        frame 0 { x: 73.1; y: -29.3; skew-x: 15; skew-y: 15; image: IMAGE_REANIM_ZOMBIE_IMP_ARM2; }
        frame 1 { x: 72.3; y: -30; skew-x: 19.1; skew-y: 19.1; scale-x: 0.998; scale-y: 0.998; image: none; }
        frame 2 { x: 71.6; y: -30.5; skew-x: 23.3; skew-y: 23.3; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 71; y: -31.1; skew-x: 27.4; skew-y: 27.4; }
        frame 4 { x: 69.8; y: -10000; skew-x: 27.6; skew-y: 27.6; scale-x: 0.997; scale-y: 0.997; }
        frame 5 { x: 68.7; skew-x: 27.8; skew-y: 27.8; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 67.6; skew-x: 27.9; skew-y: 27.9; }
        frame 7 { x: 66.4; y: -31.2; skew-x: 28.1; skew-y: 28.1; }
        frame 8 { x: 65.3; y: -10000; skew-x: 28.3; skew-y: 28.3; }
        frame 9 { x: 64.2; skew-x: 28.6; skew-y: 28.6; }
        frame 10 { x: 62.9; skew-x: 28.8; skew-y: 28.8; scale-x: 0.999; scale-y: 0.999; }
        frame 11 { x: 63.1; y: -29.8; skew-x: 20.8; skew-y: 20.8; scale-x: 0.997; scale-y: 0.997; }
        frame 12 { x: 63.5; y: -28.3; skew-x: 13; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 64.1; y: -26.4; skew-x: 5.3; skew-y: 5.3; scale-x: 0.998; scale-y: 0.998; }
        frame 14 { x: 65.2; y: -26.8; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 66.3; y: -27.2; skew-x: 7.6; skew-y: 7.6; }
        frame 16 { x: 67.5; y: -27.5; skew-x: 8.8; skew-y: 8.8; }
        frame 17 { x: 68.5; y: -27.8; skew-x: 10; skew-y: 10; }
        frame 18 { x: 69.7; y: -28.1; skew-x: 11.3; skew-y: 11.3; scale-x: 0.999; scale-y: 0.999; }
        frame 19 { x: 70.8; y: -28.5; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 71.9; y: -28.9; skew-x: 13.8; skew-y: 13.8; }
        frame 21 { x: 73.1; y: -29.3; skew-x: 15; skew-y: 15; scale-x: 1; scale-y: 1; }
        frame 22 { x: 78.7; y: -31.1; skew-x: 22.9; skew-y: 22.9; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 80.8; y: -31.4; skew-x: 23.6; skew-y: 23.6; scale-x: 1.038; scale-y: 0.998; }
        frame 24 { x: 83; y: -31.7; skew-x: 24.3; skew-y: 24.3; scale-x: 1.078; scale-y: 0.997; }
        frame 25 { x: 85; y: -31.9; skew-x: 25.1; skew-y: 25.1; scale-x: 1.118; scale-y: -10000; }
        frame 26 { x: 87.2; y: -32.2; skew-x: 25.8; skew-y: 25.8; scale-x: 1.158; scale-y: 0.996; }
        frame 27 { x: 89.3; y: -32.5; skew-x: 26.6; skew-y: 26.6; scale-x: 1.199; scale-y: 0.997; }
        frame 28 { x: 89.9; y: -10000; skew-x: 25.8; skew-y: 25.8; scale-x: 1.221; scale-y: 0.996; }
        frame 29 { x: 90.6; y: -32.6; skew-x: 25.1; skew-y: 25.1; scale-x: 1.245; scale-y: -10000; }
        frame 30 { x: 91.1; y: -32.7; skew-x: 24.3; skew-y: 24.3; scale-x: 1.269; }
        frame 31 { x: 91.7; y: -32.6; skew-x: 23.6; skew-y: 23.6; scale-x: 1.293; }
        frame 32 { x: 92.2; y: -32.7; skew-x: 23; skew-y: 23; scale-x: 1.318; scale-y: 0.997; }
        frame 33 { x: 84.8; y: -32; skew-x: 22; skew-y: 22; scale-x: 1.315; scale-y: 0.994; }
        frame 34 { x: 77.4; y: -31.5; skew-x: 21.1; skew-y: 21.1; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 65.5; y: -29.8; skew-x: 13.6; skew-y: 13.6; scale-x: 1.314; scale-y: 0.993; }
        frame 36 { x: 53.8; y: -27.7; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: 0.994; }
        frame 37 { x: 53.6; y: -28; skew-x: 10.5; skew-y: 10.5; scale-x: 1.312; scale-y: 0.992; }
        frame 38 { x: 53.4; y: -28.2; skew-x: 14.8; skew-y: 14.8; scale-x: 1.311; scale-y: 0.991; }
        frame 39 { x: 55.5; y: -28.4; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 57.8; y: -28.5; skew-x: 10.3; skew-y: 10.3; scale-x: 1.312; scale-y: 0.992; }
        frame 41 { x: 60; y: -28.6; skew-x: 8.4; skew-y: 8.3; scale-x: 1.314; scale-y: 0.993; }
        frame 42 { x: 62.2; y: -28.9; skew-x: 9; skew-y: 9; scale-x: 1.313; scale-y: -10000; }
        frame 43 { x: 64.5; y: -29.2; skew-x: 9.8; skew-y: 9.8; scale-x: 1.312; scale-y: 0.992; }
        frame 44 { x: 66.7; y: -29.5; skew-x: 10.6; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 68.9; y: -29.8; skew-x: 11.3; skew-y: 11.3; }
        frame 46 { x: 71.1; y: -30.1; skew-x: 12.2; skew-y: 12.2; scale-x: 1.313; scale-y: 0.993; }
        frame 47 { x: 72.9; y: -30.2; skew-x: 12.6; skew-y: 12.5; scale-x: 1.328; scale-y: 0.992; }
        frame 48 { x: 74.7; y: -30.5; skew-x: 13; skew-y: 13; scale-x: 1.345; scale-y: 0.991; }
        frame 49 { x: 76.6; y: -30.8; skew-x: 13.5; skew-y: 13.5; scale-x: 1.361; scale-y: -10000; }
        frame 50 { x: 78.3; y: -31; skew-x: 13.8; skew-y: 13.8; scale-x: 1.378; }
        frame 51 { x: 80.2; y: -31.2; skew-x: 14.4; skew-y: 14.4; scale-x: 1.396; }
        frame 52 { x: 82.8; y: -31.1; skew-x: 16.6; skew-y: 16.6; scale-x: 1.377; scale-y: 0.99; }
        frame 53 { x: 85.6; y: -10000; skew-x: 18.8; skew-y: 18.8; scale-x: 1.36; scale-y: -10000; }
        frame 54 { x: 88.2; y: -30.9; skew-x: 21.1; skew-y: 21.1; scale-x: 1.343; }
        frame 55 { x: 90.9; y: -30.8; skew-x: 23.3; skew-y: 23.3; scale-x: 1.326; scale-y: 0.989; }
        frame 56 { x: 93.6; y: -30.7; skew-x: 25.7; skew-y: 25.7; scale-x: 1.31; scale-y: 0.991; }
        frame 57 { x: 85.3; y: -30.1; skew-x: 22.6; skew-y: 22.6; scale-x: 1.309; scale-y: 0.989; }
        frame 58 { x: 76.9; y: -29.6; skew-x: 19.8; skew-y: 19.8; scale-x: 1.31; scale-y: 0.991; }
        frame 59 { x: 65.3; y: -28.7; skew-x: 13; skew-y: 13; scale-x: 1.311; scale-y: 0.992; }
        frame 60 { x: 53.8; y: -27.7; skew-x: 6.3; skew-y: 6.3; scale-x: 1.314; scale-y: 0.994; }
        frame 61 { x: 53.6; y: -28.3; skew-x: 10.5; skew-y: 10.5; scale-x: 1.312; scale-y: 0.992; }
        frame 62 { x: 53.5; y: -28.8; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 57.8; y: -29.1; skew-x: 15.1; skew-y: 15.1; scale-x: 1.276; }
        frame 64 { x: 62; y: -29.4; skew-x: 15.6; skew-y: 15.6; scale-x: 1.241; }
        frame 65 { x: 66.3; y: -29.7; skew-x: 16.1; skew-y: 16.1; scale-x: 1.207; scale-y: 0.994; }
        frame 66 { x: 68.7; y: -30.1; skew-x: 17.3; skew-y: 17.3; scale-x: 1.164; scale-y: -10000; }
        frame 67 { x: 71.2; y: -30.2; skew-x: 18.8; skew-y: 18.8; scale-x: 1.123; scale-y: 0.995; }
        frame 68 { x: 73.7; y: -30.5; skew-x: 20.1; skew-y: 20.1; scale-x: 1.081; scale-y: 0.996; }
        frame 69 { x: 76.3; y: -30.8; skew-x: 21.5; skew-y: 21.5; scale-x: 1.04; scale-y: 0.997; }
        frame 70 { x: 78.7; y: -31.1; skew-x: 22.9; skew-y: 22.9; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 83.9; y: -28.6; skew-x: 26.1; skew-y: 26.1; scale-x: 1.019; scale-y: 0.998; }
        frame 73 { x: 89.3; y: -26.1; skew-x: 29.6; skew-y: 29.6; scale-x: 1.04; scale-y: 0.997; }
        frame 74 { x: 94.6; y: -23.7; skew-x: 32.9; skew-y: 32.9; scale-x: 1.06; scale-y: -10000; }
        frame 75 { x: 99.9; y: -21.1; skew-x: 36.3; skew-y: 36.3; scale-x: 1.081; scale-y: 0.996; }
        frame 76 { x: 105.3; y: -18.6; skew-x: 39.6; skew-y: 39.6; scale-x: 1.101; scale-y: -10000; }
        frame 77 { x: 110.7; y: -16; skew-x: 43.1; skew-y: 43.1; scale-x: 1.122; }
        frame 78 { x: 116.1; y: -13.3; skew-x: 46.4; skew-y: 46.4; scale-x: 1.143; scale-y: 0.995; }
        frame 79 { x: 121.7; y: -10.6; skew-x: 49.9; skew-y: 49.9; scale-x: 1.165; scale-y: 0.996; }
        frame 80 { x: 124.3; y: -7.8; skew-x: 53.2; skew-y: 53.2; scale-x: 1.163; scale-y: 0.995; }
        frame 81 { x: 127.2; y: -5; skew-x: 56.6; skew-y: 56.6; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 129.9; y: -2; skew-x: 59.9; skew-y: 59.9; scale-y: 0.994; }
        frame 83 { x: 132.6; y: 0.7; skew-x: 63.4; skew-y: 63.4; scale-y: -10000; }
        frame 84 { x: 135.3; y: 3.6; skew-x: 66.7; skew-y: 66.7; }
        frame 85 { x: 138; y: 6.5; skew-x: 70; skew-y: 70; scale-x: 1.164; scale-y: 0.995; }
        frame 86 { x: 127.7; y: -2.4; skew-x: 58.4; skew-y: 58.4; scale-x: 1.16; scale-y: 0.992; }
        frame 87 { x: 117.3; y: -10.9; skew-x: 46.6; skew-y: 46.6; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 111.3; y: -17.9; skew-x: -10000; skew-y: -10000; scale-x: 1.158; scale-y: 0.99; }
        frame 89 { x: 105.3; y: -24.8; skew-x: 46.4; skew-y: 46.4; scale-x: 1.161; scale-y: 0.992; }
        frame 90 { x: 64.3; y: -30.1; skew-x: 13.1; skew-y: 13.1; scale-x: 1.156; scale-y: 0.988; }
        frame 91 { x: 33.9; y: -25.9; skew-x: 8.3; skew-y: 8.3; scale-x: 1.153; scale-y: 0.986; }
        frame 92 { x: 13.9; y: -18.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 14.2; y: -18.6; skew-x: 10.8; skew-y: 10.8; scale-x: 1.152; scale-y: 0.985; }
        frame 94 { x: 14.5; y: -10000; skew-x: 13.6; skew-y: 13.6; scale-x: 1.153; scale-y: 0.986; }
        frame 95 { x: 14.2; skew-x: 10.8; skew-y: 10.8; scale-x: 1.152; scale-y: 0.985; }
        frame 96 { x: 13.9; y: -18.7; skew-x: 8.3; skew-y: 8.3; scale-x: 1.153; scale-y: 0.986; }
        frame 97 { x: 23.2; y: -20.5; skew-x: 10.3; skew-y: 10.3; scale-x: 1.131; scale-y: 0.987; }
        frame 98 { x: 32.4; y: -22.2; skew-x: 12.3; skew-y: 12.3; scale-x: 1.109; scale-y: 0.989; }
        frame 99 { x: 41.7; y: -24.1; skew-x: 14.5; skew-y: 14.5; scale-x: 1.087; scale-y: 0.991; }
        frame 100 { x: 51; y: -25.8; skew-x: 16.5; skew-y: 16.5; scale-x: 1.064; scale-y: 0.993; }
        frame 101 { x: 60.3; y: -27.5; skew-x: 18.6; skew-y: 18.6; scale-x: 1.042; scale-y: 0.995; }
        frame 102 { x: 69.6; y: -29.3; skew-x: 20.8; skew-y: 20.8; scale-x: 1.02; scale-y: 0.997; }
        frame 103 { x: 78.7; y: -31.1; skew-x: 22.9; skew-y: 22.9; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 77.2; y: -30.9; skew-x: 22.3; skew-y: 22.3; scale-x: 1.018; scale-y: 0.997; }
        frame 106 { x: 75.8; y: -30.7; skew-x: 21.8; skew-y: 21.8; scale-x: 1.039; scale-y: -10000; }
        frame 107 { x: 74.3; y: -30.6; skew-x: 21.3; skew-y: 21.3; scale-x: 1.059; scale-y: 0.996; }
        frame 108 { x: 72.8; y: -30.3; skew-x: 20.8; skew-y: 20.8; scale-x: 1.079; scale-y: 0.995; }
        frame 109 { x: 71.3; y: -30; skew-x: 20.1; skew-y: 20.1; scale-x: 1.099; scale-y: 0.994; }
        frame 110 { x: 69.8; y: -29.8; skew-x: 19.6; skew-y: 19.6; scale-x: 1.119; scale-y: 0.993; }
        frame 111 { x: 68.4; y: -29.6; skew-x: 19.1; skew-y: 19.1; scale-x: 1.139; scale-y: 0.992; }
        frame 112 { x: 67.2; y: -29.4; skew-x: 18.7; skew-y: 18.7; scale-x: 1.16; scale-y: -10000; }
        frame 113 { x: 63; y: -28.6; skew-x: 14.8; skew-y: 14.8; scale-x: 1.159; scale-y: 0.991; }
        frame 114 { x: 59; y: -27.9; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 55.1; y: -27.2; skew-x: 7; skew-y: 7; }
        frame 116 { x: 51.1; y: -26.4; skew-x: 3; skew-y: 3; }
        frame 117 { x: 47; y: -25.7; skew-x: -0.6; skew-y: -0.6; }
        frame 118 { x: 42.9; y: -23.6; skew-x: -8.9; skew-y: -8.9; scale-x: 1.158; scale-y: 0.99; }
        frame 119 { x: 39.1; y: -21.5; skew-x: -17.4; skew-y: -17.4; scale-x: 1.157; scale-y: 0.989; }
        frame 120 { x: 35.5; y: -19.3; skew-x: -25.7; skew-y: -25.7; scale-x: 1.156; scale-y: 0.988; }
        frame 121 { x: 32.3; y: -17.2; skew-x: -34.3; skew-y: -34.3; scale-x: 1.157; scale-y: 0.989; }
        frame 122 { x: -10000; y: -10000; skew-x: -34.2; skew-y: -34.2; scale-x: 1.155; scale-y: 0.988; }
        frame 123 { skew-x: -34.3; skew-y: -34.3; scale-x: 1.157; scale-y: 0.989; }
        frame 124 { x: 27.1; y: -22.2; skew-x: -60.3; skew-y: -60.3; scale-x: 1.154; scale-y: 0.986; }
        frame 125 { x: 23.9; y: -28.5; skew-x: -86.4; skew-y: -86.4; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 21.8; y: -36.6; skew-x: -112.2; skew-y: -112.2; scale-x: 1.151; scale-y: 0.984; }
        frame 127 { x: 20.1; y: -47.2; skew-x: -138.3; skew-y: -138.3; scale-x: 1.149; scale-y: 0.982; }
        frame 128 { x: 17.3; y: -59.5; skew-x: -164.3; skew-y: -164.3; scale-x: -10000; scale-y: -10000; }
        frame 129 { x: -38.4; y: -61.8; skew-x: -164.6; skew-y: -164.6; scale-x: 1.148; scale-y: 0.981; }
        frame 130 { x: -94.2; y: -64; skew-x: -164.5; skew-y: -164.5; scale-x: -10000; scale-y: 0.982; }
        frame 131 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 132 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_gargantuar_rope";
        frame-count: 197;
        frame 0 { x: 41.3; y: -13.4; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_ROPE; }
        frame 1 { x: 40.8; y: -13.9; skew-x: -0.4; skew-y: -0.2; scale-x: 0.996; image: none; }
        frame 2 { x: 40.1; y: -14.4; skew-x: -1; skew-y: -0.7; scale-x: 0.993; }
        frame 3 { x: 39.3; y: -14.9; skew-x: -1.7; skew-y: -1.2; scale-x: 0.99; }
        frame 4 { x: 38.1; y: -14.2; skew-x: -2.4; skew-y: -1.9; scale-x: 0.991; }
        frame 5 { x: 36.9; y: -13.4; skew-x: -3.2; skew-y: -2.7; scale-x: 0.992; scale-y: 0.999; }
        frame 6 { x: 35.5; y: -12.6; skew-x: -3.9; skew-y: -3.7; scale-x: 0.994; scale-y: -10000; }
        frame 7 { x: 34.3; y: -11.8; skew-x: -4.7; skew-y: -4.4; scale-x: 0.995; }
        frame 8 { x: 33.1; y: -11; skew-x: -5.4; skew-y: -5.2; scale-x: 0.996; }
        frame 9 { x: 31.9; y: -10.3; skew-x: -6.2; skew-y: -6.2; scale-x: 0.998; }
        frame 10 { x: 30.8; y: -9.2; skew-x: -7; skew-y: -7; scale-x: 1; scale-y: 1; }
        frame 11 { x: 31.1; y: -8.9; skew-x: -6.9; skew-y: -6.9; scale-x: 1.008; scale-y: 0.999; }
        frame 12 { x: 31.3; y: -8.6; skew-x: -6.7; skew-y: -10000; scale-x: 1.017; scale-y: -10000; }
        frame 13 { x: 31.4; y: -8.1; skew-x: -6.8; skew-y: -7; scale-x: 1.026; }
        frame 14 { x: 32.7; y: -8.8; skew-x: -5.9; skew-y: -6; scale-x: 1.022; }
        frame 15 { x: 33.9; y: -9.5; skew-x: -5; skew-y: -5.2; scale-x: 1.019; }
        frame 16 { x: 35; y: -10.1; skew-x: -4.2; skew-y: -4.2; scale-x: 1.016; }
        frame 17 { x: 36.3; y: -10.9; skew-x: -3.2; skew-y: -3.4; scale-x: 1.013; }
        frame 18 { x: 37.6; y: -11.5; skew-x: -2.4; skew-y: -2.4; scale-x: 1.01; scale-y: 1; }
        frame 19 { x: 38.8; y: -12.2; skew-x: -1.5; skew-y: -1.7; scale-x: 1.006; scale-y: -10000; }
        frame 20 { x: 40; y: -12.7; skew-x: -0.7; skew-y: -0.7; scale-x: 1.003; }
        frame 21 { x: 41.3; y: -13.4; skew-x: 0; skew-y: 0; scale-x: 1; }
        frame 22 { x: 44; y: -15.7; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; }
        frame 23 { x: 44.7; y: -16.2; skew-x: 2.8; skew-y: 2.5; scale-x: 1.021; }
        frame 24 { x: 45.4; y: -16.7; skew-x: 4; skew-y: 3.3; scale-x: 1.042; }
        frame 25 { x: 46.1; y: -17.2; skew-x: 5.1; skew-y: 4.1; scale-x: 1.063; }
        frame 26 { x: 47; y: -17.9; skew-x: 6.3; skew-y: 5; scale-x: 1.084; scale-y: 0.999; }
        frame 27 { x: 47.8; y: -18.4; skew-x: 7.5; skew-y: 5.9; scale-x: 1.106; scale-y: 1; }
        frame 28 { x: 48.3; y: -18.6; skew-x: 8; skew-y: 6; scale-x: 1.113; scale-y: 0.999; }
        frame 29 { x: 48.8; y: -18.8; skew-x: 8.5; skew-y: 6.3; scale-x: 1.121; scale-y: -10000; }
        frame 30 { x: 49.4; y: -19.1; skew-x: 9; skew-y: 6.8; scale-x: 1.129; }
        frame 31 { x: 49.9; y: -19.3; skew-x: 9.5; skew-y: 7; scale-x: 1.137; }
        frame 32 { x: 50.4; y: -19.8; skew-x: 10.1; skew-y: 7.4; scale-x: 1.146; }
        frame 33 { x: 42.5; y: -16.7; skew-x: 5; skew-y: 2.3; scale-x: 1.145; }
        frame 34 { x: 34.9; y: -13.6; skew-x: 0; skew-y: -2.7; scale-x: -10000; }
        frame 35 { x: 27.7; y: -10; skew-x: -4.9; skew-y: -7.7; scale-y: 0.998; }
        frame 36 { x: 20.9; y: -6.5; skew-x: -10.1; skew-y: -12.8; scale-y: -10000; }
        frame 37 { x: 20.1; y: -5.7; skew-x: -11.4; skew-y: -14.2; scale-x: 1.143; scale-y: 0.997; }
        frame 38 { x: 19.3; y: -4.8; skew-x: -12.8; skew-y: -15.5; scale-x: 1.144; scale-y: -10000; }
        frame 39 { x: 21.4; y: -6.5; skew-x: -10.2; skew-y: -12.9; scale-x: 1.143; }
        frame 40 { x: 23.7; y: -8.2; skew-x: -7.7; skew-y: -10.4; scale-x: 1.144; }
        frame 41 { x: 25.9; y: -9.6; skew-x: -5.2; skew-y: -7.9; scale-x: -10000; scale-y: 0.998; }
        frame 42 { x: 27.7; y: -10.4; skew-x: -4.2; skew-y: -6.9; scale-y: -10000; }
        frame 43 { x: 29.4; y: -11; skew-x: -3.4; skew-y: -6; }
        frame 44 { x: 31.1; y: -11.7; skew-x: -2.4; skew-y: -5.2; scale-y: 0.997; }
        frame 45 { x: 32.8; y: -12.3; skew-x: -1.4; skew-y: -4.2; scale-y: 0.998; }
        frame 46 { x: 34.5; y: -12.8; skew-x: -0.7; skew-y: -3.4; scale-y: -10000; }
        frame 47 { x: 35.7; y: -13.3; skew-x: 0.5; skew-y: -2; scale-y: 0.997; }
        frame 48 { x: 36.7; y: -13.8; skew-x: 1.8; skew-y: -0.7; scale-y: -10000; }
        frame 49 { x: 37.8; y: -14.3; skew-x: 3; skew-y: 0.3; }
        frame 50 { x: 38.9; y: -14.8; skew-x: 4.3; skew-y: 1.5; }
        frame 51 { x: 40; y: -15.6; skew-x: 5.7; skew-y: 2.9; scale-x: 1.145; }
        frame 52 { x: 42.1; y: -16; skew-x: 6.8; skew-y: 4.8; scale-x: 1.142; }
        frame 53 { x: 44.1; y: -16.7; skew-x: 8.3; skew-y: 6.5; scale-x: 1.14; scale-y: 0.996; }
        frame 54 { x: 46.3; y: -17.2; skew-x: 9.5; skew-y: 8.3; scale-x: 1.138; scale-y: -10000; }
        frame 55 { x: 48.4; y: -17.6; skew-x: 10.8; skew-y: 10.3; scale-x: 1.135; scale-y: 0.995; }
        frame 56 { x: 50.5; y: -18.1; skew-x: 12.3; skew-y: 12.2; scale-x: 1.134; scale-y: -10000; }
        frame 57 { x: 46.3; y: -15.8; skew-x: 7.5; skew-y: 8.3; scale-x: 1.116; }
        frame 58 { x: 42.5; y: -13.4; skew-x: 2.9; skew-y: 4.7; scale-x: 1.098; scale-y: 0.996; }
        frame 59 { x: 31.5; y: -10.6; skew-x: -3.4; skew-y: -3.9; scale-x: 1.121; scale-y: 0.997; }
        frame 60 { x: 20.9; y: -6.5; skew-x: -10.1; skew-y: -12.8; scale-x: 1.145; scale-y: 0.998; }
        frame 61 { x: 20.1; y: -5.7; skew-x: -11.4; skew-y: -14.2; scale-x: 1.143; scale-y: 0.997; }
        frame 62 { x: 19.3; y: -4.8; skew-x: -12.8; skew-y: -15.5; scale-x: 1.144; scale-y: -10000; }
        frame 63 { x: 23.3; y: -7.3; skew-x: -10; skew-y: -12.4; scale-x: 1.127; }
        frame 64 { x: 27.5; y: -9.6; skew-x: -7.2; skew-y: -9.2; scale-x: 1.111; }
        frame 65 { x: 31.6; y: -11.6; skew-x: -4.6; skew-y: -6.4; scale-x: 1.095; }
        frame 66 { x: 34.1; y: -12.7; skew-x: -3.2; skew-y: -4.7; scale-x: 1.076; scale-y: 0.998; }
        frame 67 { x: 36.7; y: -13.6; skew-x: -1.9; skew-y: -2.9; scale-x: 1.057; scale-y: -10000; }
        frame 68 { x: 39.1; y: -14.4; skew-x: -0.7; skew-y: -1.4; scale-x: 1.038; scale-y: 0.999; }
        frame 69 { x: 41.6; y: -15.1; skew-x: 0.3; skew-y: 0; scale-x: 1.019; scale-y: -10000; }
        frame 70 { x: 44; y: -15.7; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 48.9; y: -14.9; skew-x: 5.3; skew-y: 5.8; scale-y: 0.999; }
        frame 73 { x: 54.1; y: -13.8; skew-x: 8.6; skew-y: 10; scale-x: 0.999; scale-y: 0.998; }
        frame 74 { x: 59.3; y: -12.6; skew-x: 12.1; skew-y: 14.3; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 64.6; y: -11.5; skew-x: 15.7; skew-y: 18.4; scale-x: 1; }
        frame 76 { x: 69.6; y: -10.3; skew-x: 18.8; skew-y: 21.1; scale-x: 0.999; scale-y: 0.996; }
        frame 77 { x: 74.6; y: -9.2; skew-x: 22.1; skew-y: 23.8; scale-x: 1; scale-y: 0.997; }
        frame 78 { x: 80.5; y: -10.9; skew-x: 28.3; skew-y: 26.6; scale-x: -10000; scale-y: 0.996; }
        frame 79 { x: 86.8; y: -12.2; skew-x: 34.5; skew-y: 29.5; scale-x: 1.002; scale-y: 0.998; }
        frame 80 { x: 88.3; y: -8.6; skew-x: 35.4; skew-y: 31.6; scale-x: 0.999; scale-y: 0.996; }
        frame 81 { x: 90; y: -5.1; skew-x: 36.4; skew-y: 33.9; scale-x: 0.997; scale-y: 0.995; }
        frame 82 { x: 91.6; y: -1.5; skew-x: 37.3; skew-y: 36.1; scale-x: 0.996; scale-y: 0.996; }
        frame 83 { x: 93.6; y: -0.3; skew-x: 40.1; skew-y: 37.8; scale-x: -10000; scale-y: 0.995; }
        frame 84 { x: 95.6; y: 0.8; skew-x: 42.9; skew-y: 39.6; scale-x: 0.997; scale-y: -10000; }
        frame 85 { x: 97.7; y: 1.9; skew-x: 45.6; skew-y: 41.3; scale-x: 1; scale-y: 0.997; }
        frame 86 { x: 91.1; y: -2.9; skew-x: 39.9; skew-y: 36.6; scale-x: 0.997; scale-y: 0.995; }
        frame 87 { x: 84.6; y: -7.4; skew-x: 34.1; skew-y: 31.9; scale-x: -10000; scale-y: 0.996; }
        frame 88 { x: 76.6; y: -14.1; skew-x: 27.1; skew-y: 23.8; scale-x: 1.023; scale-y: 0.995; }
        frame 89 { x: 68.6; y: -19.8; skew-x: 20; skew-y: 15.7; scale-x: 1.051; scale-y: 0.997; }
        frame 90 { x: 40.6; y: -14.7; skew-x: -7.7; skew-y: 0.8; scale-x: 1.007; scale-y: 0.996; }
        frame 91 { x: 18.1; y: 6.2; skew-x: -35.2; skew-y: -21.8; scale-x: 1.023; scale-y: 0.995; }
        frame 92 { x: -9.7; y: 3.5; skew-x: -22.8; skew-y: -23.9; scale-x: 1.067; scale-y: -10000; }
        frame 93 { x: -9.6; y: 4.7; skew-x: -23.5; skew-y: -23.7; scale-x: 1.066; scale-y: 0.994; }
        frame 94 { x: -10000; y: 6; skew-x: -24.4; skew-y: -23.9; scale-x: 1.067; scale-y: 0.995; }
        frame 95 { y: 4.6; skew-x: -23.5; skew-y: -23.7; scale-x: 1.066; scale-y: 0.994; }
        frame 96 { x: -9.7; y: 3.5; skew-x: -22.8; skew-y: -23.9; scale-x: 1.067; scale-y: 0.995; }
        frame 97 { x: -2.5; y: 0.3; skew-x: -19.2; skew-y: -20.2; scale-x: 1.056; scale-y: -10000; }
        frame 98 { x: 4.8; y: -2.8; skew-x: -15.7; skew-y: -16.4; scale-x: 1.047; scale-y: 0.996; }
        frame 99 { x: 12.3; y: -5.6; skew-x: -12.2; skew-y: -12.7; scale-x: 1.038; scale-y: 0.997; }
        frame 100 { x: 20.1; y: -8.4; skew-x: -8.7; skew-y: -9; scale-x: 1.028; scale-y: -10000; }
        frame 101 { x: 27.9; y: -10.9; skew-x: -5.2; skew-y: -5.4; scale-x: 1.019; scale-y: 0.998; }
        frame 102 { x: 36; y: -13.6; skew-x: -1.5; skew-y: -1.7; scale-x: 1.009; scale-y: 0.999; }
        frame 103 { x: 44; y: -15.7; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 43.5; y: -15; skew-x: 0.3; skew-y: 0.8; scale-y: 0.999; }
        frame 106 { x: 42.9; y: -14.4; skew-x: -0.7; skew-y: -0.2; scale-x: 0.999; scale-y: -10000; }
        frame 107 { x: 42.3; y: -13.8; skew-x: -1.9; skew-y: -1.2; scale-x: -10000; scale-y: 0.998; }
        frame 108 { x: 41.8; y: -12.9; skew-x: -3.4; skew-y: -2.2; scale-x: 0.998; scale-y: -10000; }
        frame 109 { x: 41.3; y: -12.3; skew-x: -4.7; skew-y: -3.2; scale-x: -10000; scale-y: 0.997; }
        frame 110 { x: 40.8; y: -11.7; skew-x: -5.9; skew-y: -4.2; scale-x: 0.997; scale-y: -10000; }
        frame 111 { x: 40.3; y: -11; skew-x: -7.2; skew-y: -5.2; scale-x: -10000; scale-y: 0.996; }
        frame 112 { x: 39.8; y: -10.2; skew-x: -8.7; skew-y: -6.3; scale-y: -10000; }
        frame 113 { x: 37; y: -9.2; skew-x: -11.4; skew-y: -8.9; scale-x: 0.996; }
        frame 114 { x: 34.4; y: -8; skew-x: -14.2; skew-y: -11.7; scale-x: -10000; scale-y: 0.995; }
        frame 115 { x: 31.8; y: -6.8; skew-x: -17; skew-y: -14.5; scale-y: -10000; }
        frame 116 { x: 29.4; y: -5.5; skew-x: -19.7; skew-y: -17.2; scale-x: 0.995; }
        frame 117 { x: 26.8; y: -4.3; skew-x: -22.6; skew-y: -20.2; scale-x: 0.996; }
        frame 118 { x: 23.4; y: -2.2; skew-x: -24.7; skew-y: -24.4; scale-x: 1.024; scale-y: 0.994; }
        frame 119 { x: 19.8; y: -0; skew-x: -26.7; skew-y: -28.7; scale-x: 1.054; scale-y: -10000; }
        frame 120 { x: 16.5; y: 2.3; skew-x: -28.7; skew-y: -33; scale-x: 1.083; scale-y: 0.993; }
        frame 121 { x: 13.5; y: 4.8; skew-x: -30.9; skew-y: -37.2; scale-x: 1.114; scale-y: 0.995; }
        frame 122 { x: -10000; y: -10000; skew-x: -30.8; skew-y: -10000; scale-x: 1.112; scale-y: 0.993; }
        frame 123 { skew-x: -30.9; scale-x: 1.114; scale-y: 0.995; }
        frame 124 { x: 15.1; y: 2.1; skew-x: -28.7; skew-y: -34.3; scale-x: 1.107; scale-y: 0.993; }
        frame 125 { x: 16.6; y: -0.4; skew-x: -26.7; skew-y: -31.5; scale-x: 1.102; scale-y: -10000; }
        frame 126 { x: 18.2; y: -3; skew-x: -24.7; skew-y: -28.7; scale-x: 1.097; }
        frame 127 { x: 19.9; y: -5.7; skew-x: -22.7; skew-y: -25.7; scale-x: 1.092; }
        frame 128 { x: 21.6; y: -7.9; skew-x: -20.9; skew-y: -23; scale-x: 1.088; scale-y: 0.994; }
        frame 129 { x: 31; y: -9.7; skew-x: -17.7; skew-y: -15.9; scale-x: 1.051; scale-y: 0.993; }
        frame 130 { x: 40.4; y: -10.6; skew-x: -14.7; skew-y: -8.9; scale-x: 1.016; scale-y: 0.994; }
        frame 131 { x: 45.1; y: -11.6; skew-x: -11.9; skew-y: -7.2; scale-x: 1.008; scale-y: 0.993; }
        frame 132 { x: 50.4; y: -10.2; skew-x: -9.2; skew-y: -5.7; scale-x: 1; scale-y: -10000; }
        frame 133 { x: 55.9; y: -8.9; skew-x: -6.6; skew-y: -4.2; scale-x: 0.994; }
        frame 134 { x: 53.1; y: -14.6; skew-x: -1.4; skew-y: 0.3; scale-x: 1.048; scale-y: 0.995; }
        frame 135 { x: 53; y: -14.8; skew-x: 3.5; skew-y: 4.8; scale-x: 1.101; scale-y: 0.996; }
        frame 136 { x: 48.5; y: -15.3; skew-x: 2.5; skew-y: 3.3; scale-x: 1.05; scale-y: 0.998; }
        frame 137 { x: 44; y: -15.7; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 46; y: -15.1; skew-x: 3.3; skew-y: 3.3; }
        frame 140 { x: 48.3; y: -14.6; skew-x: 5; skew-y: 5; scale-x: 0.999; scale-y: 0.999; }
        frame 141 { x: 50.5; y: -14.1; skew-x: 6.9; skew-y: 6.9; scale-x: 1; scale-y: 1; }
        frame 142 { x: 55.5; y: -12.3; skew-x: 9.8; skew-y: 9.8; scale-x: 0.999; scale-y: 0.999; }
        frame 143 { x: 60.6; y: -10.6; skew-x: 13; skew-y: 13; scale-x: 0.998; scale-y: 0.998; }
        frame 144 { x: 65.8; y: -8.8; skew-x: 16.2; skew-y: 16.2; scale-x: 0.999; scale-y: 0.999; }
        frame 145 { x: 75.8; y: -8.1; skew-x: 24.1; skew-y: 24.1; scale-x: 0.997; scale-y: 0.997; }
        frame 146 { x: 86.3; y: -6.6; skew-x: 32.3; skew-y: 32.3; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 96.8; y: -4.2; skew-x: 40.3; skew-y: 40.3; scale-x: 0.998; scale-y: 0.998; }
        frame 148 { x: 90.8; y: -6.5; skew-x: 37.9; skew-y: 37.9; scale-x: 0.996; scale-y: 0.996; }
        frame 149 { x: 85.2; y: -8.8; skew-x: 35.6; skew-y: 35.6; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 79.2; y: -11; skew-x: 33.2; skew-y: 33.2; scale-x: 0.997; scale-y: 0.997; }
        frame 151 { x: 68.4; y: -11.8; skew-x: 30.3; skew-y: 30.3; scale-x: 0.995; scale-y: 0.995; }
        frame 152 { x: 57.6; y: -12.6; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 47; y: -13.4; skew-x: 24.5; skew-y: 24.5; scale-x: 0.996; scale-y: 0.996; }
        frame 154 { x: 31.1; y: -12.7; skew-x: 14.1; skew-y: 14.1; scale-x: 0.994; scale-y: 0.994; }
        frame 155 { x: 16.1; y: -10.9; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 2.3; y: -8.1; skew-x: -6.1; skew-y: -6.1; }
        frame 157 { x: -1.1; y: -4.7; skew-x: -9.2; skew-y: -9.2; scale-x: 0.993; scale-y: 0.993; }
        frame 158 { x: -4.7; y: -1.2; skew-x: -12.5; skew-y: -12.5; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: -8.2; y: 2.5; skew-x: -15.9; skew-y: -15.9; }
        frame 160 { x: -7.2; y: 0.8; skew-x: -14.5; skew-y: -14.5; scale-x: 0.992; scale-y: 0.992; }
        frame 161 { x: -6.3; y: -0.6; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: -5.5; y: -2.2; skew-x: -11.9; skew-y: -11.9; scale-x: 0.993; scale-y: 0.993; }
        frame 163 { x: -1.7; y: -6; skew-x: -8.2; skew-y: -8.2; scale-x: 0.992; scale-y: 0.992; }
        frame 164 { x: 2; y: -9.8; skew-x: -4.4; skew-y: -4.4; scale-x: -10000; scale-y: -10000; }
        frame 165 { x: 6.1; y: -13.3; skew-x: -0.7; skew-y: -0.7; }
        frame 166 { x: 10.3; y: -16.6; skew-x: 2.8; skew-y: 2.8; }
        frame 167 { x: 14.7; y: -20; skew-x: 6.6; skew-y: 6.6; }
        frame 168 { x: 22.2; y: -20.4; skew-x: 8.8; skew-y: 8.8; }
        frame 169 { x: 29.7; y: -20.8; skew-x: 11; skew-y: 11; }
        frame 170 { x: 37.3; y: -21.2; skew-x: 13.3; skew-y: 13.3; scale-x: 0.993; scale-y: 0.993; }
        frame 171 { x: 44.7; y: -18.8; skew-x: 15.5; skew-y: 15.5; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 52.1; y: -16.4; skew-x: 17.8; skew-y: 17.8; }
        frame 173 { x: 59.6; y: -14; skew-x: 20.3; skew-y: 20.3; scale-x: 0.995; scale-y: 0.995; }
        frame 174 { x: 67.9; y: -12.6; skew-x: 24.1; skew-y: 24.1; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 76.4; y: -11.2; skew-x: 28.1; skew-y: 28.1; scale-x: 0.996; scale-y: 0.996; }
        frame 176 { x: 85; y: -9.5; skew-x: 32; skew-y: 32; scale-x: 0.998; scale-y: 0.998; }
        frame 177 { x: 82.2; y: -10.2; skew-x: 32.6; skew-y: 32.6; scale-x: 0.996; scale-y: 0.996; }
        frame 178 { x: 79.2; y: -11; skew-x: 33.2; skew-y: 33.2; scale-x: 0.997; scale-y: 0.997; }
        frame 179 { x: 68.4; y: -11.8; skew-x: 30.3; skew-y: 30.3; scale-x: 0.995; scale-y: 0.995; }
        frame 180 { x: 57.6; y: -12.6; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 181 { x: 47; y: -13.4; skew-x: 24.5; skew-y: 24.5; scale-x: 0.996; scale-y: 0.996; }
        frame 182 { x: 27.7; y: -12.7; skew-x: 14.1; skew-y: 14.1; scale-x: 0.994; scale-y: 0.994; }
        frame 183 { x: 9.5; y: -10.9; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: -7.5; y: -8.1; skew-x: -6.1; skew-y: -6.1; }
        frame 185 { x: -23.6; y: -0.7; skew-x: -8.7; skew-y: -8.7; scale-x: 0.992; scale-y: 0.992; }
        frame 186 { x: -39.6; y: 6.6; skew-x: -11.4; skew-y: -11.4; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: -67.6; y: 34; skew-x: -25.7; skew-y: -25.7; scale-x: 0.99; scale-y: 0.99; }
        frame 188 { x: -92.9; y: 62.1; skew-x: -40; skew-y: -40; scale-x: 0.991; scale-y: 0.991; }
        frame 189 { x: -94.4; y: 69.7; skew-x: -46.2; skew-y: -46.2; scale-x: 0.989; scale-y: 0.989; }
        frame 190 { x: -95.6; y: 76.9; skew-x: -52.3; skew-y: -52.3; scale-x: 0.99; scale-y: 0.99; }
        frame 191 { x: -96.6; y: 78.6; skew-x: -51.3; skew-y: -53.3; scale-x: 0.98; scale-y: 0.989; }
        frame 192 { x: -97.9; y: 80.3; skew-x: -50.3; skew-y: -54.3; scale-x: 0.973; scale-y: 0.991; }
        frame 193 { x: -96.6; y: 75.8; skew-x: -48.3; skew-y: -50.3; scale-x: 1.023; scale-y: 0.988; }
        frame 194 { x: -95.4; y: 71.2; skew-x: -46.3; skew-y: -46.2; scale-x: 1.076; scale-y: 0.989; }
        frame 195 { x: -94.9; y: 74.2; skew-x: -47.1; skew-y: -47.1; scale-x: 1.066; scale-y: 0.988; }
        frame 196 { x: -94.6; y: 77.1; skew-x: -48; skew-y: -48; scale-x: 1.059; scale-y: 0.99; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 197;
        frame 0 { x: -32.6; y: -37.4; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_HEAD; }
        frame 1 { x: -30.6; y: -40.4; skew-x: 2.6; skew-y: 2.6; image: none; }
        frame 2 { x: -28.6; y: -43.5; skew-x: 5.3; skew-y: 5.3; scale-x: 0.999; scale-y: 0.999; }
        frame 3 { x: -26.2; y: -46.6; skew-x: 8.2; skew-y: 8.2; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: -28.5; y: -43.8; skew-x: 6.3; skew-y: 6.3; }
        frame 5 { x: -30.7; y: -41; skew-x: 4.6; skew-y: 4.6; }
        frame 6 { x: -32.7; y: -38.2; skew-x: 3; skew-y: 3; }
        frame 7 { x: -34.8; y: -35.3; skew-x: 1.3; skew-y: 1.3; }
        frame 8 { x: -36.8; y: -32.5; skew-x: -0.2; skew-y: -0.2; scale-x: 1; scale-y: 1; }
        frame 9 { x: -38.9; y: -29.7; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: -41.1; y: -26.6; skew-x: -3.7; skew-y: -3.7; }
        frame 11 { x: -41.3; y: -25.8; skew-x: -4.4; skew-y: -4.4; scale-x: 0.999; scale-y: 0.999; }
        frame 12 { x: -41.5; y: -24.9; skew-x: -5.4; skew-y: -5.4; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -41.8; y: -24.2; skew-x: -6.3; skew-y: -6.3; }
        frame 14 { x: -40.6; y: -25.8; skew-x: -5.4; skew-y: -5.4; }
        frame 15 { x: -39.5; y: -27.6; skew-x: -4.7; skew-y: -4.7; }
        frame 16 { x: -38.3; y: -29.3; skew-x: -3.7; skew-y: -3.7; }
        frame 17 { x: -37.1; y: -30.9; skew-x: -3; skew-y: -3; scale-x: 1; scale-y: 1; }
        frame 18 { x: -35.9; y: -32.6; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -34.8; y: -34.2; skew-x: -1.4; skew-y: -1.4; }
        frame 20 { x: -33.6; y: -35.8; skew-x: -0.7; skew-y: -0.7; }
        frame 21 { x: -32.6; y: -37.4; skew-x: 0; skew-y: 0; }
        frame 22 { x: -29.1; y: -42.1; skew-x: 1.8; skew-y: 1.8; }
        frame 23 { x: -25.7; y: -45; skew-x: 4.3; skew-y: 4.3; scale-x: 0.999; scale-y: 0.999; }
        frame 24 { x: -22.3; y: -47.9; skew-x: 7; skew-y: 7; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -18.8; y: -50.7; skew-x: 9.8; skew-y: 9.8; }
        frame 26 { x: -15.3; y: -53.4; skew-x: 12.3; skew-y: 12.3; }
        frame 27 { x: -11.8; y: -56.3; skew-x: 15.1; skew-y: 15.1; }
        frame 28 { x: -10; y: -57.6; skew-x: 16.3; skew-y: 16.3; scale-x: 0.998; scale-y: 0.998; }
        frame 29 { x: -8.1; y: -59.1; skew-x: 17.8; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -6.3; y: -60.4; skew-x: 19.1; skew-y: 19.1; }
        frame 31 { x: -4.4; y: -61.8; skew-x: 20.5; skew-y: 20.5; }
        frame 32 { x: -2.6; y: -63.2; skew-x: 21.9; skew-y: 21.9; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: -8.9; y: -59; skew-x: 21.6; skew-y: 21.6; scale-x: 0.997; scale-y: 0.997; }
        frame 34 { x: -14.8; y: -55; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: -29; y: -43; skew-x: 11; skew-y: 11; }
        frame 36 { x: -42.8; y: -29.7; skew-x: 0.7; skew-y: 0.7; }
        frame 37 { x: -43.6; y: -28.7; skew-x: -0.9; skew-y: -0.9; }
        frame 38 { x: -44.4; y: -27.5; skew-x: -2.9; skew-y: -2.9; }
        frame 39 { x: -41.5; y: -31.2; skew-x: 0.3; skew-y: 0.3; }
        frame 40 { x: -38.5; y: -34.9; skew-x: 3.5; skew-y: 3.5; }
        frame 41 { x: -35.3; y: -38.5; skew-x: 7; skew-y: 7; }
        frame 42 { x: -33.6; y: -39.5; skew-x: 7.5; skew-y: 7.5; }
        frame 43 { x: -31.9; y: -40.6; skew-x: 8; skew-y: 8; }
        frame 44 { x: -30.2; y: -41.7; skew-x: 8.6; skew-y: 8.6; }
        frame 45 { x: -28.5; y: -42.8; skew-x: 9.1; skew-y: 9.1; scale-x: 0.996; scale-y: 0.996; }
        frame 46 { x: -26.6; y: -44; skew-x: 9.8; skew-y: 9.8; scale-x: 0.997; scale-y: 0.997; }
        frame 47 { x: -24.5; y: -46; skew-x: 11.3; skew-y: 11.3; scale-x: 0.996; scale-y: 0.996; }
        frame 48 { x: -22.4; y: -48.1; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: -20.2; y: -50.2; skew-x: 14.5; skew-y: 14.5; }
        frame 50 { x: -18; y: -52.3; skew-x: 16; skew-y: 16; }
        frame 51 { x: -15.6; y: -54.3; skew-x: 17.7; skew-y: 17.7; }
        frame 52 { x: -12; y: -56.6; skew-x: 19.6; skew-y: 19.6; scale-x: 0.995; scale-y: 0.995; }
        frame 53 { x: -8.3; y: -59; skew-x: 21.8; skew-y: 21.8; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: -4.7; y: -61.2; skew-x: 23.8; skew-y: 23.8; }
        frame 55 { x: -1; y: -63.4; skew-x: 25.8; skew-y: 25.8; }
        frame 56 { x: 2.6; y: -65.7; skew-x: 28; skew-y: 28; scale-x: 0.996; scale-y: 0.996; }
        frame 57 { x: -4.7; y: -60.8; skew-x: 26.1; skew-y: 26.1; scale-x: 0.993; scale-y: 0.993; }
        frame 58 { x: -12.3; y: -55.9; skew-x: 24.2; skew-y: 24.2; scale-x: 0.994; scale-y: 0.994; }
        frame 59 { x: -27.4; y: -44.2; skew-x: 13.3; skew-y: 13.3; scale-x: 0.993; scale-y: 0.993; }
        frame 60 { x: -41.7; y: -31.2; skew-x: 2.7; skew-y: 2.7; scale-x: 0.994; scale-y: 0.994; }
        frame 61 { x: -42.9; y: -29.4; skew-x: 0; skew-y: 0; scale-x: 0.996; scale-y: 0.996; }
        frame 62 { x: -44.4; y: -27.5; skew-x: -2.9; skew-y: -2.9; scale-x: 0.997; scale-y: 0.997; }
        frame 63 { x: -40.8; y: -31.3; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: -37.2; y: -34.9; skew-x: 0.3; skew-y: 0.3; }
        frame 65 { x: -33.5; y: -38.7; skew-x: 2; skew-y: 2; scale-x: 0.998; scale-y: 0.998; }
        frame 66 { x: -32.7; y: -39.3; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: -31.8; y: -40; skew-x: -10000; skew-y: -10000; }
        frame 68 { x: -30.9; y: -40.7; scale-x: 0.999; scale-y: 0.999; }
        frame 69 { x: -30; y: -41.3; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: -29.1; y: -42.1; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -21.1; y: -45.1; skew-x: 5.8; skew-y: 5.8; scale-x: 0.999; scale-y: 0.999; }
        frame 73 { x: -13.1; y: -47.9; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -4.9; y: -50.5; skew-x: 13.8; skew-y: 13.8; scale-x: 0.998; scale-y: 0.998; }
        frame 75 { x: 3.3; y: -53.1; skew-x: 18; skew-y: 18; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 11.5; y: -55.3; skew-x: 22; skew-y: 22; }
        frame 77 { x: 19.9; y: -57.3; skew-x: 26.1; skew-y: 26.1; scale-x: 0.997; scale-y: 0.997; }
        frame 78 { x: 28.3; y: -59.2; skew-x: 30.1; skew-y: 30.1; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 36.8; y: -61; skew-x: 34.2; skew-y: 34.2; scale-x: 0.998; scale-y: 0.998; }
        frame 80 { x: 40.1; y: -10000; skew-x: 35.8; skew-y: 35.8; scale-x: 0.996; scale-y: 0.996; }
        frame 81 { x: 43.5; skew-x: 37.3; skew-y: 37.3; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 46.9; skew-x: 38.9; skew-y: 38.9; }
        frame 83 { x: 50.3; y: -60.9; skew-x: 40.4; skew-y: 40.4; }
        frame 84 { x: 53.7; y: -10000; skew-x: 42.1; skew-y: 42.1; }
        frame 85 { x: 57.1; y: -60.8; skew-x: 43.6; skew-y: 43.6; scale-x: 0.997; scale-y: 0.997; }
        frame 86 { x: 53.6; y: -62.3; skew-x: 45.1; skew-y: 45.1; scale-x: 0.995; scale-y: 0.995; }
        frame 87 { x: 49.9; y: -64.1; skew-x: 46.5; skew-y: 46.5; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 35.5; y: -65.9; skew-x: 37.6; skew-y: 37.6; scale-x: 0.994; scale-y: 0.994; }
        frame 89 { x: 21.2; y: -66.7; skew-x: 28.8; skew-y: 28.8; scale-x: 0.997; scale-y: 0.997; }
        frame 90 { x: -10.4; y: -49.1; skew-x: 16.5; skew-y: 16.5; scale-x: 0.995; scale-y: 0.995; }
        frame 91 { x: -41.4; y: -30; skew-x: 4.5; skew-y: 4.5; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: -71.3; y: -7.1; skew-x: -7.5; skew-y: -7.5; }
        frame 93 { x: -72.5; y: -4.4; skew-x: -9.4; skew-y: -9.4; scale-x: 0.994; scale-y: 0.994; }
        frame 94 { x: -73.7; y: -1.7; skew-x: -11.6; skew-y: -11.6; scale-x: 0.995; scale-y: 0.995; }
        frame 95 { x: -72.5; y: -4.4; skew-x: -9.4; skew-y: -9.4; scale-x: 0.994; scale-y: 0.994; }
        frame 96 { x: -71.3; y: -7.1; skew-x: -7.5; skew-y: -7.5; scale-x: 0.995; scale-y: 0.995; }
        frame 97 { x: -65.3; y: -12.1; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: -59.2; y: -17.3; skew-x: -4.7; skew-y: -4.7; scale-x: 0.996; scale-y: 0.996; }
        frame 99 { x: -53.2; y: -22.2; skew-x: -3.4; skew-y: -3.4; scale-x: 0.997; scale-y: 0.997; }
        frame 100 { x: -47.1; y: -27.3; skew-x: -2; skew-y: -2; scale-x: 0.998; scale-y: 0.998; }
        frame 101 { x: -41.1; y: -32.2; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: -35.2; y: -37.1; skew-x: 0.3; skew-y: 0.3; scale-x: 0.999; scale-y: 0.999; }
        frame 103 { x: -29.1; y: -42.1; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: -28.4; y: -41.6; skew-x: 2.6; skew-y: 2.6; scale-x: 0.999; scale-y: 0.999; }
        frame 106 { x: -27.5; y: -41.2; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: -26.7; y: -40.8; skew-x: 4.5; skew-y: 4.5; scale-x: 0.998; scale-y: 0.998; }
        frame 108 { x: -26; y: -40.3; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: -25.2; y: -39.9; skew-x: 6.3; skew-y: 6.3; scale-x: 0.997; scale-y: 0.997; }
        frame 110 { x: -24.4; y: -39.5; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: -23.7; y: -39; skew-x: 8; skew-y: 8; }
        frame 112 { x: -22.8; y: -38.6; skew-x: 9.1; skew-y: 9.1; }
        frame 113 { x: -25.5; y: -35.8; skew-x: 7.3; skew-y: 7.3; scale-x: 0.996; scale-y: 0.996; }
        frame 114 { x: -28.1; y: -33.1; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: -30.7; y: -30.4; skew-x: 4.1; skew-y: 4.1; }
        frame 116 { x: -33.3; y: -27.6; skew-x: 2.5; skew-y: 2.5; }
        frame 117 { x: -35.7; y: -24.9; skew-x: 1; skew-y: 1; }
        frame 118 { x: -36.4; y: -23.3; skew-x: -10000; skew-y: -10000; }
        frame 119 { x: -37.1; y: -21.6; }
        frame 120 { x: -37.8; y: -19.9; }
        frame 121 { x: -38.5; y: -18.1; }
        frame 122 { x: -10000; y: -18.2; }
        frame 123 { y: -18.1; }
        frame 124 { x: -35; y: -24; skew-x: 5; skew-y: 5; }
        frame 125 { x: -31.4; y: -29.7; skew-x: 9; skew-y: 9; scale-x: 0.995; scale-y: 0.995; }
        frame 126 { x: -27.7; y: -35.1; skew-x: 13; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 127 { x: -23.8; y: -40.5; skew-x: 17.1; skew-y: 17.1; scale-x: 0.994; scale-y: 0.994; }
        frame 128 { x: -19.8; y: -45.7; skew-x: 21.2; skew-y: 21.2; scale-x: 0.995; scale-y: 0.995; }
        frame 129 { x: -10.7; y: -48.9; skew-x: 24.3; skew-y: 24.3; scale-x: 0.994; scale-y: 0.994; }
        frame 130 { x: -1.4; y: -52.1; skew-x: 27.5; skew-y: 27.5; scale-x: 0.995; scale-y: 0.995; }
        frame 131 { x: 6.3; y: -55.6; skew-x: 31.3; skew-y: 31.3; scale-x: 0.993; scale-y: 0.993; }
        frame 132 { x: 14.3; y: -59; skew-x: 35.1; skew-y: 35.1; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 22.3; y: -62.2; skew-x: 38.8; skew-y: 38.8; scale-x: 0.994; scale-y: 0.994; }
        frame 134 { x: 12.7; y: -58.9; skew-x: 31.9; skew-y: 31.9; scale-x: 0.993; scale-y: 0.993; }
        frame 135 { x: 3.2; y: -55.2; skew-x: 25.1; skew-y: 25.1; scale-x: 0.996; scale-y: 0.996; }
        frame 136 { x: -13.3; y: -49.4; skew-x: 13.3; skew-y: 13.3; scale-x: 0.997; scale-y: 0.997; }
        frame 137 { x: -29.1; y: -42.1; skew-x: 1.8; skew-y: 1.8; scale-x: 1; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: -29; y: -40; skew-x: -1.7; skew-y: -1.7; scale-x: 0.999; scale-y: 0.999; }
        frame 140 { x: -28.9; y: -37.7; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: -28.8; y: -35.2; skew-x: -8.8; skew-y: -8.8; }
        frame 142 { x: -24; y: -34.9; skew-x: -8.7; skew-y: -8.7; scale-x: 0.998; scale-y: 0.998; }
        frame 143 { x: -19.1; y: -34.6; skew-x: -8.5; skew-y: -8.5; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: -14.5; y: -34.3; skew-x: -10000; skew-y: -10000; }
        frame 145 { x: 9.2; y: -50.1; skew-x: 8.1; skew-y: 8.1; scale-x: 0.996; scale-y: 0.996; }
        frame 146 { x: 34.8; y: -62.7; skew-x: 25; skew-y: 25; scale-x: 0.995; scale-y: 0.995; }
        frame 147 { x: 61.4; y: -71.8; skew-x: 41.9; skew-y: 41.9; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 56; y: -73; skew-x: 42.1; skew-y: 42.1; scale-x: 0.993; scale-y: 0.993; }
        frame 149 { x: 50.3; y: -74.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 45; y: -75.7; skew-x: 42.4; skew-y: 42.4; scale-x: 0.994; scale-y: 0.994; }
        frame 151 { x: 31.1; y: -74.5; skew-x: 39.4; skew-y: 39.4; scale-x: 0.992; scale-y: 0.992; }
        frame 152 { x: 17.2; y: -73.2; skew-x: 36.4; skew-y: 36.4; scale-x: 0.991; scale-y: 0.991; }
        frame 153 { x: 3.4; y: -71.8; skew-x: 33.6; skew-y: 33.6; scale-x: 0.992; scale-y: 0.992; }
        frame 154 { x: -25.9; y: -56.9; skew-x: 16.8; skew-y: 16.8; scale-x: 0.991; scale-y: 0.991; }
        frame 155 { x: -53.8; y: -38.7; skew-x: 0.1; skew-y: 0.1; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: -79.6; y: -17.8; skew-x: -16.3; skew-y: -16.3; scale-x: 0.99; scale-y: 0.99; }
        frame 157 { x: -83.3; y: -9.6; skew-x: -19.5; skew-y: -19.5; scale-x: 0.988; scale-y: 0.988; }
        frame 158 { x: -87; y: -1.3; skew-x: -22.7; skew-y: -22.7; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: -90.7; y: 6.8; skew-x: -26.1; skew-y: -26.1; scale-x: 0.989; scale-y: 0.989; }
        frame 160 { x: -89.8; y: 6.2; skew-x: -28; skew-y: -28; scale-x: 0.987; scale-y: 0.987; }
        frame 161 { x: -89; y: 5.5; skew-x: -29.7; skew-y: -29.7; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: -88.2; y: 4.8; skew-x: -31.6; skew-y: -31.6; scale-x: 0.988; scale-y: 0.988; }
        frame 163 { x: -83; y: -5.8; skew-x: -25.9; skew-y: -25.9; scale-x: 0.987; scale-y: 0.987; }
        frame 164 { x: -77.5; y: -16.5; skew-x: -20.2; skew-y: -20.2; scale-x: -10000; scale-y: -10000; }
        frame 165 { x: -71.6; y: -27; skew-x: -14.5; skew-y: -14.5; }
        frame 166 { x: -65.5; y: -37.2; skew-x: -8.7; skew-y: -8.7; scale-x: 0.986; scale-y: 0.986; }
        frame 167 { x: -59.1; y: -46.9; skew-x: -3.2; skew-y: -3.2; scale-x: 0.987; scale-y: 0.987; }
        frame 168 { x: -49.1; y: -50.8; skew-x: 0.1; skew-y: 0.1; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: -38.6; y: -54.9; skew-x: 3.8; skew-y: 3.8; scale-x: 0.988; scale-y: 0.988; }
        frame 170 { x: -28.3; y: -58.8; skew-x: 7.3; skew-y: 7.3; scale-x: 0.989; scale-y: 0.989; }
        frame 171 { x: -18.1; y: -59.8; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: -7.8; y: -60.7; skew-x: 14.3; skew-y: 14.3; scale-x: 0.99; scale-y: 0.99; }
        frame 173 { x: 2.5; y: -61.6; skew-x: 18.1; skew-y: 18.1; scale-x: 0.991; scale-y: 0.991; }
        frame 174 { x: 14.9; y: -65; skew-x: 23.1; skew-y: 23.1; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 27.5; y: -68.2; skew-x: 28.3; skew-y: 28.3; scale-x: 0.993; scale-y: 0.993; }
        frame 176 { x: 40.1; y: -71.3; skew-x: 33.6; skew-y: 33.6; scale-x: 0.995; scale-y: 0.995; }
        frame 177 { x: 42.5; y: -73.6; skew-x: 37.9; skew-y: 37.9; scale-x: 0.993; scale-y: 0.993; }
        frame 178 { x: 45; y: -75.7; skew-x: 42.4; skew-y: 42.4; scale-x: 0.994; scale-y: 0.994; }
        frame 179 { x: 31.1; y: -74.5; skew-x: 39.4; skew-y: 39.4; scale-x: 0.992; scale-y: 0.992; }
        frame 180 { x: 17.2; y: -73.2; skew-x: 36.4; skew-y: 36.4; scale-x: 0.991; scale-y: 0.991; }
        frame 181 { x: 3.4; y: -71.8; skew-x: 33.6; skew-y: 33.6; scale-x: 0.992; scale-y: 0.992; }
        frame 182 { x: -20.8; y: -62.2; skew-x: 26.8; skew-y: 26.8; scale-x: 0.99; scale-y: 0.99; }
        frame 183 { x: -45.1; y: -52.1; skew-x: 19.8; skew-y: 19.8; scale-x: 0.988; scale-y: 0.988; }
        frame 184 { x: -69.1; y: -41.5; skew-x: 13.2; skew-y: 13.2; scale-x: -10000; scale-y: -10000; }
        frame 185 { x: -81.5; y: -33.6; skew-x: 15.6; skew-y: 15.6; scale-x: 0.986; scale-y: 0.986; }
        frame 186 { x: -93.8; y: -25.9; skew-x: 18.3; skew-y: 18.3; scale-x: 0.985; scale-y: 0.985; }
        frame 187 { x: -113.3; y: 8; skew-x: 19.5; skew-y: 19.5; scale-x: 0.983; scale-y: 0.983; }
        frame 188 { x: -133.2; y: 42.1; skew-x: 20.8; skew-y: 20.8; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: -138; y: 59.8; skew-x: 12.1; skew-y: 12.3; scale-x: 0.982; scale-y: 0.982; }
        frame 190 { x: -142.4; y: 78.1; skew-x: 3.7; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 191 { x: -145.3; y: 81.8; skew-x: 3.5; skew-y: -10000; scale-x: 1.033; scale-y: 0.949; }
        frame 192 { x: -147.9; y: 85.7; skew-x: 3.4; skew-y: 4.1; scale-x: 1.084; scale-y: 0.916; }
        frame 193 { x: -143.1; y: 72.7; skew-x: 7.6; skew-y: 8; scale-x: 1.032; scale-y: 0.948; }
        frame 194 { x: -138; y: 59.8; skew-x: 12.1; skew-y: 12.3; scale-x: 0.982; scale-y: 0.982; }
        frame 195 { x: -140.3; y: 68.9; skew-x: 7.8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 196 { x: -142.4; y: 78.1; skew-x: 3.7; skew-y: 3.8; }
    }
    Track {
        source-name: "Zombie_gargantua_jaw";
        frame-count: 197;
        frame 0 { x: -24.3; y: 16.7; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_JAW; }
        frame 1 { x: -25; y: 14; skew-x: 2.1; skew-y: 2.1; image: none; }
        frame 2 { x: -25.6; y: 11.4; skew-x: 4.3; skew-y: 4.3; scale-x: 0.999; scale-y: 0.999; }
        frame 3 { x: -26.3; y: 8.7; skew-x: 6.6; skew-y: 6.6; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: -26.9; y: 12.2; skew-x: 4.3; skew-y: 4.3; }
        frame 5 { x: -27.5; y: 15.5; skew-x: 2.3; skew-y: 2.3; }
        frame 6 { x: -28.1; y: 19; skew-x: 0; skew-y: 0; }
        frame 7 { x: -28.6; y: 22.5; skew-x: -1.9; skew-y: -1.9; }
        frame 8 { x: -29.1; y: 26; skew-x: -4.2; skew-y: -4.2; }
        frame 9 { x: -29.6; y: 29.4; skew-x: -6.2; skew-y: -6.2; }
        frame 10 { x: -30.1; y: 32.9; skew-x: -8.5; skew-y: -8.5; scale-x: 1; scale-y: 1; }
        frame 11 { x: -29.3; y: 33.6; skew-x: -9.9; skew-y: -9.9; scale-x: 0.999; scale-y: 0.999; }
        frame 12 { x: -28.8; y: 34.5; skew-x: -11.2; skew-y: -11.2; scale-x: 0.998; scale-y: 0.998; }
        frame 13 { x: -28; y: 35.3; skew-x: -12.8; skew-y: -12.8; scale-x: 0.999; scale-y: 0.999; }
        frame 14 { x: -27.5; y: 33; skew-x: -11.2; skew-y: -11.2; scale-x: 0.998; scale-y: 0.998; }
        frame 15 { x: -27.1; y: 30.6; skew-x: -9.4; skew-y: -9.4; scale-x: 0.999; scale-y: 0.999; }
        frame 16 { x: -26.6; y: 28.3; skew-x: -7.9; skew-y: -7.9; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: -26.1; y: 25.8; skew-x: -6.2; skew-y: -6.2; }
        frame 18 { x: -25.6; y: 23.5; skew-x: -4.7; skew-y: -4.7; }
        frame 19 { x: -25.1; y: 21.2; skew-x: -3; skew-y: -3; scale-x: 1; scale-y: 1; }
        frame 20 { x: -24.5; y: 18.9; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -24.3; y: 16.7; skew-x: 0; skew-y: 0; }
        frame 22 { x: -23; y: 15.7; skew-x: -0.7; skew-y: 1.6; scale-x: 1.001; }
        frame 23 { x: -22.5; y: 14; skew-x: -0.2; skew-y: 3.1; scale-x: 1.003; }
        frame 24 { x: -21.9; y: 12.3; skew-x: 0; skew-y: 4.8; scale-x: 1.004; scale-y: 0.999; }
        frame 25 { x: -21.3; y: 10.6; skew-x: 0.5; skew-y: 6.5; scale-x: 1.006; scale-y: -10000; }
        frame 26 { x: -20.7; y: 8.9; skew-x: 1; skew-y: 8.3; scale-x: 1.008; }
        frame 27 { x: -20.1; y: 7.2; skew-x: 1.6; skew-y: 10; scale-x: 1.01; }
        frame 28 { x: -19.9; y: 6.3; skew-x: 1.3; skew-y: 10.5; scale-x: 1.012; scale-y: 0.998; }
        frame 29 { x: -19.8; y: 5.3; skew-x: -10000; skew-y: 11; scale-x: 1.014; scale-y: -10000; }
        frame 30 { x: -19.6; y: 4.5; skew-x: 1; skew-y: 11.5; scale-x: 1.016; }
        frame 31 { x: -19.4; y: 3.6; skew-x: 0.8; skew-y: 12.1; scale-x: 1.018; }
        frame 32 { x: -19.1; y: 2.5; skew-x: -10000; skew-y: 12.7; scale-x: 1.02; }
        frame 33 { x: -24; y: 4.5; skew-x: 3.3; skew-y: 15; scale-x: 1.018; scale-y: 0.996; }
        frame 34 { x: -28.9; y: 6.4; skew-x: 5.9; skew-y: 17.4; scale-x: 1.017; scale-y: -10000; }
        frame 35 { x: -31.8; y: 20.6; skew-x: -5.2; skew-y: 4.3; scale-x: 1.012; }
        frame 36 { x: -33.9; y: 35.4; skew-x: -16.7; skew-y: -8.3; scale-x: 1.008; scale-y: 0.997; }
        frame 37 { x: -32.6; y: 36.5; skew-x: -18.4; skew-y: -9.9; scale-x: 1.006; scale-y: 0.996; }
        frame 38 { x: -31.4; y: 37.8; skew-x: -20.2; skew-y: -11.8; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: -32.3; y: 33.9; skew-x: -16.9; skew-y: -8.4; }
        frame 40 { x: -33; y: 29.9; skew-x: -13.7; skew-y: -5.2; }
        frame 41 { x: -33.6; y: 26; skew-x: -10.4; skew-y: -2; scale-x: 1.007; scale-y: 0.997; }
        frame 42 { x: -32.5; y: 23.9; skew-x: -8.2; skew-y: 0; scale-x: -10000; scale-y: 0.996; }
        frame 43 { x: -31.4; y: 21.8; skew-x: -6.2; skew-y: 1.8; scale-y: -10000; }
        frame 44 { x: -30.3; y: 19.6; skew-x: -4.2; skew-y: 3.8; }
        frame 45 { x: -29.2; y: 17.6; skew-x: -2.2; skew-y: 5.8; }
        frame 46 { x: -28; y: 15.6; skew-x: -0.4; skew-y: 7.9; }
        frame 47 { x: -27.6; y: 14.5; skew-x: -0.2; skew-y: 8; }
        frame 48 { x: -27.2; y: 13.5; skew-x: -0; skew-y: -10000; scale-y: 0.995; }
        frame 49 { x: -26.8; y: 12.6; skew-x: 0; skew-y: 8.3; scale-y: -10000; }
        frame 50 { x: -26.4; y: 11.6; skew-x: -10000; skew-y: -10000; }
        frame 51 { x: -26; y: 10.5; skew-x: 0.1; skew-y: 8.5; scale-y: 0.996; }
        frame 52 { x: -24.7; y: 7.8; skew-x: 2.1; skew-y: 10.5; scale-x: 1.006; scale-y: 0.995; }
        frame 53 { x: -23.3; y: 5; skew-x: 4.3; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: -22; y: 2.2; skew-x: 6.3; skew-y: 14.6; }
        frame 55 { x: -20.5; y: -0.3; skew-x: 8.3; skew-y: 16.8; scale-y: 0.994; }
        frame 56 { x: -19.1; y: -3; skew-x: 10.5; skew-y: 18.9; scale-y: 0.995; }
        frame 57 { x: -24.3; y: 0.6; skew-x: 10; skew-y: 18.3; scale-x: 1.005; scale-y: 0.993; }
        frame 58 { x: -29.5; y: 4.2; skew-x: 9.6; skew-y: 17.7; scale-x: 1.004; scale-y: -10000; }
        frame 59 { x: -32.5; y: 19.6; skew-x: -2.4; skew-y: 5.5; scale-x: -10000; }
        frame 60 { x: -34.7; y: 35.4; skew-x: -14.7; skew-y: -6.3; scale-y: 0.994; }
        frame 61 { x: -33; y: 36.6; skew-x: -17.4; skew-y: -8.9; scale-x: 1.005; scale-y: -10000; }
        frame 62 { x: -31.4; y: 37.8; skew-x: -20.2; skew-y: -11.8; scale-x: 1.006; scale-y: 0.996; }
        frame 63 { x: -29.9; y: 33.4; skew-x: -16.9; skew-y: -9; scale-x: 1.005; scale-y: -10000; }
        frame 64 { x: -28.3; y: 29; skew-x: -13.7; skew-y: -6.4; scale-x: 1.004; }
        frame 65 { x: -26.6; y: 24.7; skew-x: -10.4; skew-y: -3.9; scale-x: -10000; scale-y: 0.997; }
        frame 66 { x: -25.8; y: 23; skew-x: -8.4; skew-y: -2.7; scale-x: 1.003; scale-y: -10000; }
        frame 67 { x: -25.2; y: 21.2; skew-x: -6.4; skew-y: -1.7; scale-x: 1.002; scale-y: 0.998; }
        frame 68 { x: -24.5; y: 19.4; skew-x: -4.5; skew-y: -0.4; scale-x: -10000; scale-y: 0.999; }
        frame 69 { x: -23.8; y: 17.7; skew-x: -2.7; skew-y: 0.3; scale-x: 1.001; scale-y: -10000; }
        frame 70 { x: -23; y: 15.7; skew-x: -0.7; skew-y: 1.6; scale-x: -10000; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 72 { x: -19.5; y: 13.4; skew-x: 1.5; skew-y: 3.8; }
        frame 73 { x: -16; y: 11.1; skew-x: 4; skew-y: 6.3; scale-x: 1; scale-y: 0.999; }
        frame 74 { x: -12.4; y: 8.9; skew-x: 6.3; skew-y: 8.8; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -8.9; y: 6.6; skew-x: 8.8; skew-y: 11.1; }
        frame 76 { x: -5.3; y: 4.3; skew-x: 11.3; skew-y: 13.6; scale-x: 0.999; scale-y: 0.998; }
        frame 77 { x: -1.7; y: 2.1; skew-x: 13.6; skew-y: 16; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 1.9; y: 0.1; skew-x: 16; skew-y: 18.5; }
        frame 79 { x: 5.6; y: -2.1; skew-x: 18.6; skew-y: 20.9; scale-x: 1; scale-y: 0.999; }
        frame 80 { x: 7.5; y: -2.7; skew-x: 19.1; skew-y: 22.6; scale-x: 0.999; scale-y: 1; }
        frame 81 { x: 9.5; y: -3.3; skew-x: 19.8; skew-y: 24.3; scale-x: 0.998; scale-y: 1.001; }
        frame 82 { x: 11.4; y: -3.9; skew-x: 20.3; skew-y: 26.3; scale-x: -10000; scale-y: 1.003; }
        frame 83 { x: 13.2; y: -4.6; skew-x: 21; skew-y: 28.1; scale-y: 1.005; }
        frame 84 { x: 15.2; y: -5.1; skew-x: 21.6; skew-y: 29.8; scale-y: 1.007; }
        frame 85 { x: 17.1; y: -5.8; skew-x: 22.3; skew-y: 31.6; scale-x: 0.999; scale-y: 1.01; }
        frame 86 { x: 13.6; y: -9.6; skew-x: 25.8; skew-y: 33.3; scale-x: 0.997; scale-y: 1.004; }
        frame 87 { x: 10.4; y: -13.7; skew-x: 29.2; skew-y: 35.2; scale-x: -10000; scale-y: 1.002; }
        frame 88 { x: 3.1; y: -8.1; skew-x: 18.3; skew-y: 22.5; scale-x: 0.996; scale-y: 0.998; }
        frame 89 { x: -3.4; y: -1.9; skew-x: 7.6; skew-y: 9.9; scale-x: 0.998; scale-y: 0.997; }
        frame 90 { x: -21; y: 13.6; skew-x: 0.8; skew-y: 3.1; scale-x: 0.997; scale-y: 0.996; }
        frame 91 { x: -38.4; y: 29.4; skew-x: -5.7; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: -56.2; y: 44.1; skew-x: -7.7; skew-y: -10.2; scale-x: 0.996; scale-y: 0.995; }
        frame 93 { x: -55.4; y: 48.6; skew-x: -11.4; skew-y: -12.2; scale-x: 0.995; scale-y: -10000; }
        frame 94 { x: -54.5; y: 53.1; skew-x: -15.4; skew-y: -14.3; scale-x: -10000; }
        frame 95 { x: -55.3; y: 48.6; skew-x: -11.4; skew-y: -12.2; }
        frame 96 { x: -56.2; y: 44.1; skew-x: -7.7; skew-y: -10.2; scale-x: 0.996; }
        frame 97 { x: -51.4; y: 40.1; skew-x: -6.7; skew-y: -8.4; scale-x: 0.997; scale-y: 0.996; }
        frame 98 { x: -46.7; y: 36; skew-x: -5.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: -41.9; y: 31.9; skew-x: -4.7; skew-y: -5; scale-x: 0.998; scale-y: 0.997; }
        frame 100 { x: -37.2; y: 27.8; skew-x: -3.7; skew-y: -3.4; scale-x: 0.999; scale-y: 0.998; }
        frame 101 { x: -32.5; y: 23.8; skew-x: -2.7; skew-y: -1.7; scale-x: -10000; scale-y: 0.999; }
        frame 102 { x: -27.7; y: 19.7; skew-x: -1.7; skew-y: 0; scale-x: 1; scale-y: -10000; }
        frame 103 { x: -23; y: 15.7; skew-x: -0.7; skew-y: 1.6; scale-x: 1.001; scale-y: 1; }
        frame 104 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: -23.2; y: 16.8; skew-x: -1; skew-y: 1; scale-x: 1; }
        frame 106 { x: -23.4; y: 17.9; skew-x: -1.4; skew-y: 0.8; scale-x: -10000; scale-y: 0.999; }
        frame 107 { x: -23.6; y: 19; skew-x: -1.9; skew-y: 0.3; scale-y: -10000; }
        frame 108 { x: -23.8; y: 19.9; skew-x: -2.2; skew-y: 0; scale-x: 0.999; }
        frame 109 { x: -24; y: 21.1; skew-x: -2.7; skew-y: -0.2; scale-x: -10000; scale-y: 0.998; }
        frame 110 { x: -24.2; y: 22; skew-x: -3; skew-y: -0.7; scale-y: -10000; }
        frame 111 { x: -24.4; y: 23.1; skew-x: -3.4; skew-y: -1; scale-x: 0.998; }
        frame 112 { x: -24.5; y: 24.1; skew-x: -3.9; skew-y: -1.5; scale-x: -10000; scale-y: 0.997; }
        frame 113 { x: -25.3; y: 26.7; skew-x: -5.4; skew-y: -3.2; scale-y: -10000; }
        frame 114 { x: -26.1; y: 29.4; skew-x: -7.2; skew-y: -4.7; }
        frame 115 { x: -27; y: 32; skew-x: -8.7; skew-y: -6.2; scale-x: 0.997; }
        frame 116 { x: -27.8; y: 34.6; skew-x: -10.2; skew-y: -7.9; scale-x: -10000; scale-y: 0.996; }
        frame 117 { x: -28.6; y: 37.4; skew-x: -12; skew-y: -9.6; scale-x: 0.998; scale-y: 0.997; }
        frame 118 { x: -29.3; y: 39; skew-x: -11.9; skew-y: -9.5; scale-x: 0.997; scale-y: 0.996; }
        frame 119 { x: -30; y: 40.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: -30.7; y: 42.4; }
        frame 121 { x: -31.4; y: 44.1; skew-x: -12; skew-y: -9.6; scale-x: 0.998; scale-y: 0.997; }
        frame 122 { x: -31.3; y: -10000; skew-x: -11.9; skew-y: -9.5; scale-x: 0.997; scale-y: 0.996; }
        frame 123 { x: -31.4; skew-x: -12; skew-y: -9.6; scale-x: 0.998; scale-y: 0.997; }
        frame 124 { x: -32.1; y: 38.6; skew-x: -8.2; skew-y: -5.9; scale-x: 0.997; scale-y: 0.996; }
        frame 125 { x: -32.7; y: 33.4; skew-x: -4.7; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: -33.3; y: 28.1; skew-x: -1.2; skew-y: 1; }
        frame 127 { x: -33.7; y: 22.8; skew-x: 2.3; skew-y: 4.8; }
        frame 128 { x: -34.1; y: 17.6; skew-x: 6; skew-y: 8.4; }
        frame 129 { x: -30.1; y: 14.5; skew-x: 7; skew-y: 9.3; scale-x: 0.996; scale-y: 0.995; }
        frame 130 { x: -26.1; y: 11.4; skew-x: 8.2; skew-y: 10.6; scale-x: -10000; scale-y: 0.996; }
        frame 131 { x: -22.3; y: 5.8; skew-x: 12; skew-y: 14.3; scale-y: 0.995; }
        frame 132 { x: -18.3; y: 0.6; skew-x: 15.8; skew-y: 18.1; scale-x: 0.995; scale-y: 0.994; }
        frame 133 { x: -14.2; y: -4.7; skew-x: 19.6; skew-y: 22; scale-x: 0.996; scale-y: 0.995; }
        frame 134 { x: -15.4; y: -0.9; skew-x: 16.8; skew-y: 19.3; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: -16.5; y: 2.8; skew-x: 14.1; skew-y: 16.6; scale-x: 0.997; scale-y: 0.996; }
        frame 136 { x: -19.9; y: 9.2; skew-x: 6.5; skew-y: 9; scale-x: 0.999; scale-y: 0.998; }
        frame 137 { x: -23; y: 15.7; skew-x: -0.7; skew-y: 1.6; scale-x: 1.001; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: -19.3; y: 19.4; skew-x: -8.7; skew-y: -6.2; scale-x: 1; scale-y: 0.999; }
        frame 140 { x: -15.3; y: 23.2; skew-x: -16.5; skew-y: -14.2; scale-x: 0.999; scale-y: 0.998; }
        frame 141 { x: -10.9; y: 27; skew-x: -24.5; skew-y: -22.1; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: -6.5; y: 27.4; skew-x: -23.5; skew-y: -20.2; scale-y: 0.997; }
        frame 143 { x: -2.2; y: 27.9; skew-x: -22.5; skew-y: -18.5; scale-y: -10000; }
        frame 144 { x: 2; y: 28.4; skew-x: -21.7; skew-y: -16.8; scale-x: 1.001; scale-y: 0.998; }
        frame 145 { x: 8.7; y: 13.9; skew-x: -8.4; skew-y: -3.4; scale-x: 1; scale-y: 0.997; }
        frame 146 { x: 16.3; y: 0; skew-x: 4.5; skew-y: 9.5; scale-x: -10000; scale-y: 0.996; }
        frame 147 { x: 24.6; y: -13.4; skew-x: 17.8; skew-y: 22.8; scale-x: 0.999; scale-y: -10000; }
        frame 148 { x: 18.3; y: -14.6; skew-x: 16.6; skew-y: 21.6; scale-x: 0.998; scale-y: 0.994; }
        frame 149 { x: 12.1; y: -15.9; skew-x: 15.5; skew-y: 20.5; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 6; y: -17.2; skew-x: 14.5; skew-y: 19.5; }
        frame 151 { x: -4.7; y: -14.3; skew-x: 11.5; skew-y: 16.5; scale-x: 0.997; scale-y: 0.993; }
        frame 152 { x: -15.4; y: -11.2; skew-x: 8.6; skew-y: 13.5; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: -26; y: -8.3; skew-x: 5.8; skew-y: 10.7; scale-x: 0.996; }
        frame 154 { x: -35.6; y: 8.9; skew-x: -10.7; skew-y: -5.7; scale-x: 0.995; scale-y: 0.992; }
        frame 155 { x: -43.6; y: 27; skew-x: -27.5; skew-y: -22.5; scale-x: 0.993; scale-y: 0.99; }
        frame 156 { x: -49.9; y: 45.4; skew-x: -44.1; skew-y: -39.2; scale-x: 0.994; scale-y: -10000; }
        frame 157 { x: -50.2; y: 51.6; skew-x: -47.5; skew-y: -42.5; scale-x: 0.992; scale-y: 0.988; }
        frame 158 { x: -50.5; y: 58; skew-x: -50.8; skew-y: -45.8; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: -50.7; y: 64.2; skew-x: -53.9; skew-y: -49; scale-x: 0.993; scale-y: 0.989; }
        frame 160 { x: -48.1; y: 62.1; skew-x: -55.8; skew-y: -50.8; scale-x: 0.991; scale-y: 0.988; }
        frame 161 { x: -45.5; y: 60; skew-x: -57.6; skew-y: -52.8; scale-x: -10000; scale-y: 0.987; }
        frame 162 { x: -42.9; y: 58; skew-x: -59.4; skew-y: -54.5; scale-x: 0.992; scale-y: 0.989; }
        frame 163 { x: -44.2; y: 49.6; skew-x: -51.8; skew-y: -46.8; scale-x: 0.99; scale-y: 0.987; }
        frame 164 { x: -45.2; y: 41.2; skew-x: -44.3; skew-y: -39.3; scale-x: -10000; scale-y: 0.986; }
        frame 165 { x: -45.9; y: 32.6; skew-x: -36.5; skew-y: -31.7; scale-y: -10000; }
        frame 166 { x: -46.1; y: 24.1; skew-x: -29; skew-y: -24; scale-x: 0.989; }
        frame 167 { x: -10000; y: 15.7; skew-x: -21.5; skew-y: -16.5; scale-x: 0.99; scale-y: 0.987; }
        frame 168 { x: -39.7; y: 12.2; skew-x: -18.4; skew-y: -13.5; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: -33.2; y: 8.8; skew-x: -15.4; skew-y: -10.5; scale-x: 0.991; scale-y: 0.988; }
        frame 170 { x: -26.8; y: 5.3; skew-x: -12.5; skew-y: -7.7; scale-x: 0.993; scale-y: 0.989; }
        frame 171 { x: -20.6; y: 4.6; skew-x: -9.4; skew-y: -4.7; scale-x: -10000; scale-y: 0.99; }
        frame 172 { x: -14.3; y: 3.8; skew-x: -6.5; skew-y: -1.7; scale-x: 0.995; scale-y: 0.991; }
        frame 173 { x: -7.9; y: 3; skew-x: -3.7; skew-y: 1; scale-x: 0.996; scale-y: 0.993; }
        frame 174 { x: -1.3; y: -0.5; skew-x: 0.5; skew-y: 5.3; scale-x: 0.997; scale-y: -10000; }
        frame 175 { x: 5.3; y: -4.4; skew-x: 5; skew-y: 9.8; scale-x: 0.998; scale-y: 0.994; }
        frame 176 { x: 12.2; y: -8.2; skew-x: 9.5; skew-y: 14.5; scale-x: 1; scale-y: 0.996; }
        frame 177 { x: 9.1; y: -12.7; skew-x: 12; skew-y: 16.8; scale-x: 0.998; scale-y: 0.994; }
        frame 178 { x: 6; y: -17.2; skew-x: 14.5; skew-y: 19.5; scale-x: -10000; scale-y: -10000; }
        frame 179 { x: -4.7; y: -14.3; skew-x: 11.5; skew-y: 16.5; scale-x: 0.997; scale-y: 0.993; }
        frame 180 { x: -15.4; y: -11.2; skew-x: 8.6; skew-y: 13.5; scale-x: -10000; scale-y: -10000; }
        frame 181 { x: -26; y: -8.3; skew-x: 5.8; skew-y: 10.7; scale-x: 0.996; }
        frame 182 { x: -42.4; y: 3.4; skew-x: -0.9; skew-y: 3.8; scale-x: 0.995; scale-y: 0.991; }
        frame 183 { x: -58.6; y: 15.6; skew-x: -7.7; skew-y: -2.7; scale-x: 0.993; scale-y: 0.99; }
        frame 184 { x: -74.6; y: 27.9; skew-x: -14.5; skew-y: -9.6; scale-x: 0.992; scale-y: 0.988; }
        frame 185 { x: -90.6; y: 32; skew-x: -6.7; skew-y: -1.7; scale-x: 0.99; scale-y: 0.987; }
        frame 186 { x: -106.4; y: 36.4; skew-x: 0.9; skew-y: 5.8; scale-x: 0.989; scale-y: 0.986; }
        frame 187 { x: -125.4; y: 67.4; skew-x: 5.5; skew-y: 10.5; scale-x: 0.988; scale-y: 0.984; }
        frame 188 { x: -144.6; y: 98.5; skew-x: 10.4; skew-y: 15.3; scale-x: 0.987; scale-y: 0.983; }
        frame 189 { x: -142.1; y: 114.8; skew-x: 5; skew-y: 9.8; scale-x: 1.043; scale-y: 0.982; }
        frame 190 { x: -139.4; y: 131.5; skew-x: -0.3; skew-y: 4.5; scale-x: 1.1; scale-y: -10000; }
        frame 191 { x: -141.8; y: 133.4; skew-x: -0.2; skew-y: 4.6; scale-x: 1.148; scale-y: 0.96; }
        frame 192 { x: -144; y: 135.3; skew-x: -0.3; skew-y: 4.9; scale-x: 1.196; scale-y: 0.939; }
        frame 193 { x: -143.6; y: 129.3; skew-x: -2.4; skew-y: 4.8; scale-x: 1.125; scale-y: 0.96; }
        frame 194 { x: -143.2; y: 123.3; skew-x: -4.9; skew-y: -10000; scale-x: 1.054; scale-y: 0.982; }
        frame 195 { x: -141.4; y: 127.3; skew-x: -2.4; skew-y: 4.5; scale-x: 1.077; scale-y: -10000; }
        frame 196 { x: -139.4; y: 131.5; skew-x: -0.3; skew-y: -10000; scale-x: 1.1; }
    }
    Track {
        source-name: "Zombie_gargantuar_telephonepole";
        frame-count: 197;
        frame 0 { x: -43.9; y: 84.1; skew-x: 335.5; skew-y: 335.5; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_TELEPHONEPOLE; }
        frame 1 { x: -44.2; y: 81.9; skew-x: 336.7; skew-y: 336.7; scale-x: 0.997; scale-y: 0.997; image: none; }
        frame 2 { x: -44.6; y: 79.7; skew-x: 338; skew-y: 338; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -45; y: 77.3; skew-x: 339.2; skew-y: 339.2; }
        frame 4 { x: -45.1; y: 80.6; skew-x: 337.9; skew-y: 337.9; scale-x: 0.996; scale-y: 0.996; }
        frame 5 { x: -45.3; y: 84.1; skew-x: 336.4; skew-y: 336.4; scale-x: 0.997; scale-y: 0.997; }
        frame 6 { x: -45.4; y: 87.8; skew-x: 335; skew-y: 335; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: -45.5; y: 91; skew-x: 333.7; skew-y: 333.7; }
        frame 8 { x: -45.4; y: 94.7; skew-x: 332.2; skew-y: 332.2; }
        frame 9 { x: -45.5; y: 98; skew-x: 330.9; skew-y: 330.9; }
        frame 10 { x: -45.6; y: 101.7; skew-x: 329.4; skew-y: 329.4; scale-x: 0.999; scale-y: 0.999; }
        frame 11 { x: -44.8; y: 104.3; skew-x: 328.7; skew-y: 328.7; scale-x: 0.997; scale-y: 0.997; }
        frame 12 { x: -44.2; y: 107.5; skew-x: 327.7; skew-y: 327.7; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -43.6; y: 110.3; skew-x: 326.9; skew-y: 326.9; scale-x: 0.998; scale-y: 0.998; }
        frame 14 { x: -43.7; y: 106.8; skew-x: 328.1; skew-y: 328.1; scale-x: 0.996; scale-y: 0.996; }
        frame 15 { x: -43.8; y: 103.6; skew-x: 329.2; skew-y: 329.2; scale-x: 0.997; scale-y: 0.997; }
        frame 16 { x: -43.9; y: 100.3; skew-x: 330.2; skew-y: 330.2; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: -10000; y: 97.2; skew-x: 331.2; skew-y: 331.2; }
        frame 18 { x: -44; y: 93.6; skew-x: 332.4; skew-y: 332.4; }
        frame 19 { x: -10000; y: 90.5; skew-x: 333.4; skew-y: 333.4; }
        frame 20 { y: 87.3; skew-x: 334.5; skew-y: 334.5; scale-x: 0.998; scale-y: 0.998; }
        frame 21 { x: -43.9; y: 84.1; skew-x: 335.5; skew-y: 335.5; scale-x: 0.999; scale-y: 0.999; }
        frame 22 { x: -10000; y: 82.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -41.4; y: 81.7; skew-x: 335.7; skew-y: 335.7; scale-x: 0.997; scale-y: 0.997; }
        frame 24 { x: -38.9; y: 81.1; skew-x: 335.9; skew-y: 335.9; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -36.5; y: 80.9; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: -34; y: 80.3; skew-x: 336.2; skew-y: 336.2; scale-x: 0.996; scale-y: 0.996; }
        frame 27 { x: -31.6; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.997; scale-y: 0.997; }
        frame 28 { x: -30.3; y: 83; skew-x: 335; skew-y: 335; scale-x: 0.996; scale-y: 0.996; }
        frame 29 { x: -29; y: 85.6; skew-x: 333.7; skew-y: 333.7; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -27.8; y: 88; skew-x: 332.7; skew-y: 332.7; }
        frame 31 { x: -26.5; y: 90.7; skew-x: 331.4; skew-y: 331.4; }
        frame 32 { x: -25.2; y: 93.5; skew-x: 330.1; skew-y: 330.1; scale-x: 0.997; scale-y: 0.997; }
        frame 33 { x: -24.1; y: 96.4; skew-x: 328.4; skew-y: 328.4; scale-x: 0.995; scale-y: 0.995; }
        frame 34 { x: -23.2; y: 99.1; skew-x: 326.9; skew-y: 326.9; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: -22.1; y: 101.9; skew-x: 325.2; skew-y: 325.2; }
        frame 36 { x: -21; y: 104.8; skew-x: 323.5; skew-y: 323.5; scale-x: 0.996; scale-y: 0.996; }
        frame 37 { x: -24.5; y: 103.5; skew-x: 323.6; skew-y: 323.6; scale-x: 0.994; scale-y: 0.994; }
        frame 38 { x: -28.4; y: 102.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: -31.4; y: 96.1; skew-x: 326.7; skew-y: 326.7; scale-x: 0.993; scale-y: 0.993; }
        frame 40 { x: -34.3; y: 89.7; skew-x: 329.9; skew-y: 329.9; scale-x: 0.994; scale-y: 0.994; }
        frame 41 { x: -36.8; y: 83.6; skew-x: 332.8; skew-y: 332.8; scale-x: 0.996; scale-y: 0.996; }
        frame 42 { x: -38.6; y: 79; skew-x: 334.9; skew-y: 334.9; scale-x: 0.994; scale-y: 0.994; }
        frame 43 { x: -40.4; y: 74.5; skew-x: 336.9; skew-y: 336.9; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: -42.2; y: 70.1; skew-x: 338.9; skew-y: 338.9; }
        frame 45 { x: -43.7; y: 65.6; skew-x: 340.9; skew-y: 340.9; }
        frame 46 { x: -45.3; y: 61.4; skew-x: 342.8; skew-y: 342.8; scale-x: 0.995; scale-y: 0.995; }
        frame 47 { x: -47.2; y: 56; skew-x: 345.2; skew-y: 345.2; scale-x: 0.994; scale-y: 0.994; }
        frame 48 { x: -49.2; y: 50.8; skew-x: 347.4; skew-y: 347.4; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: -51; y: 45.7; skew-x: 349.7; skew-y: 349.7; }
        frame 50 { x: -52.8; y: 40.6; skew-x: 352; skew-y: 352; }
        frame 51 { x: -54.5; y: 35.8; skew-x: 354.1; skew-y: 354.1; }
        frame 52 { x: -54.7; y: 31.7; skew-x: 356; skew-y: 356; }
        frame 53 { x: -54.8; y: 27.6; skew-x: 358; skew-y: 358; }
        frame 54 { x: -54.9; y: 23.7; skew-x: 359.7; skew-y: 359.7; }
        frame 55 { x: -10000; y: 19.9; skew-x: 361.5; skew-y: 361.5; scale-x: 0.993; scale-y: 0.993; }
        frame 56 { y: 16.1; skew-x: 363.4; skew-y: 363.4; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: -58.5; y: 28.8; skew-x: 358; skew-y: 358; scale-x: 0.992; scale-y: 0.992; }
        frame 58 { x: -61.2; y: 42; skew-x: 352.5; skew-y: 352.5; scale-x: 0.991; scale-y: 0.991; }
        frame 59 { x: -63.1; y: 55.5; skew-x: 347; skew-y: 347; scale-x: 0.99; scale-y: 0.99; }
        frame 60 { x: -64.3; y: 69.2; skew-x: 341.5; skew-y: 341.5; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -62.7; y: 76.6; skew-x: 338; skew-y: 338; }
        frame 62 { x: -61.3; y: 84.2; skew-x: 334.4; skew-y: 334.4; scale-x: 0.993; scale-y: 0.993; }
        frame 63 { x: -58.2; y: 83.8; skew-x: 334.7; skew-y: 334.7; scale-x: 0.992; scale-y: 0.992; }
        frame 64 { x: -55.3; y: 83.5; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -52.5; y: 83.2; skew-x: 335.5; skew-y: 335.5; scale-x: 0.993; scale-y: 0.993; }
        frame 66 { x: -50.7; y: 82.8; skew-x: 335.7; skew-y: 335.7; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: -49; y: 82.6; skew-x: -10000; skew-y: -10000; scale-x: 0.994; scale-y: 0.994; }
        frame 68 { x: -47.3; y: 82.4; scale-x: 0.996; scale-y: 0.996; }
        frame 69 { x: -45.6; y: 82.2; scale-x: 0.997; scale-y: 0.997; }
        frame 70 { x: -43.9; y: 82.1; skew-x: 335.5; skew-y: 335.5; scale-x: 0.999; scale-y: 0.999; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -48.3; y: 47.1; skew-x: 352.2; skew-y: 352.2; scale-x: 0.997; scale-y: 0.997; }
        frame 73 { x: -45.1; y: 15.1; skew-x: 368.8; skew-y: 368.8; scale-x: 0.996; scale-y: 0.996; }
        frame 74 { x: -36.8; y: -23.5; skew-x: 385.3; skew-y: 385.3; scale-x: 0.993; scale-y: 0.993; }
        frame 75 { x: -10.9; y: -51.3; skew-x: 402.2; skew-y: 402.2; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 13.9; y: -67.9; skew-x: 416.7; skew-y: 416.7; scale-x: 0.991; scale-y: 0.991; }
        frame 77 { x: 39.5; y: -79; skew-x: 431; skew-y: 431; scale-x: 0.992; scale-y: 0.992; }
        frame 78 { x: 69.3; y: -81.6; skew-x: 444.7; skew-y: 444.7; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 96.9; y: -79.3; skew-x: 458.3; skew-y: 458.3; scale-x: 0.993; scale-y: 0.993; }
        frame 80 { x: 117.4; y: -76.8; skew-x: 468.8; skew-y: 468.8; scale-x: 0.991; scale-y: 0.991; }
        frame 81 { x: 135.7; y: -72; skew-x: 479.3; skew-y: 479.3; scale-x: 0.989; scale-y: 0.989; }
        frame 82 { x: 151.5; y: -65.5; skew-x: 489.8; skew-y: 489.8; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 172; y: -56.1; skew-x: 500.4; skew-y: 500.4; scale-x: 0.988; scale-y: 0.988; }
        frame 84 { x: 188.4; y: -40.3; skew-x: 510.9; skew-y: 510.9; scale-x: 0.987; scale-y: 0.987; }
        frame 85 { x: 201.7; y: -24.5; skew-x: 521.3; skew-y: 521.3; scale-x: 0.989; scale-y: 0.989; }
        frame 86 { x: 195.3; y: -29.5; skew-x: 519.2; skew-y: 519.2; scale-x: 0.986; scale-y: 0.986; }
        frame 87 { x: 188.8; y: -34.9; skew-x: 516.8; skew-y: 516.8; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 173.6; y: -54.7; skew-x: 507.2; skew-y: 507.2; scale-x: 0.984; scale-y: 0.984; }
        frame 89 { x: 156; y: -74.4; skew-x: 497.5; skew-y: 497.5; scale-x: 0.986; scale-y: 0.986; }
        frame 90 { x: 28.5; y: -98.9; skew-x: 439.1; skew-y: 439.1; scale-x: 0.984; scale-y: 0.984; }
        frame 91 { x: -64; y: -44.2; skew-x: 397.6; skew-y: 397.6; scale-x: 0.982; scale-y: 0.982; }
        frame 92 { x: -118.3; y: 112.8; skew-x: 328.9; skew-y: 328.9; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -118.9; y: 113; skew-x: 329.7; skew-y: 329.7; scale-x: 0.981; scale-y: 0.981; }
        frame 94 { x: -120; y: 113.3; skew-x: 330.4; skew-y: 330.4; scale-x: 0.982; scale-y: 0.982; }
        frame 95 { x: -121.7; y: 113.8; skew-x: 329.7; skew-y: 329.7; scale-x: 0.981; scale-y: 0.981; }
        frame 96 { x: -123.8; y: 114.3; skew-x: 328.9; skew-y: 328.9; scale-x: 0.982; scale-y: 0.982; }
        frame 97 { x: -115.1; y: 108.3; skew-x: 330.2; skew-y: 330.2; scale-x: 0.983; scale-y: 0.983; }
        frame 98 { x: -106.5; y: 102.3; skew-x: 331.4; skew-y: 331.4; scale-x: 0.984; scale-y: 0.984; }
        frame 99 { x: -97.9; y: 96.2; skew-x: 332.7; skew-y: 332.7; scale-x: 0.988; scale-y: 0.988; }
        frame 100 { x: -84.7; y: 93.2; skew-x: 333.4; skew-y: 333.4; scale-x: 0.989; scale-y: 0.989; }
        frame 101 { x: -71.6; y: 90; skew-x: 334.2; skew-y: 334.2; scale-x: 0.992; scale-y: 0.992; }
        frame 102 { x: -58.5; y: 86.8; skew-x: 334.9; skew-y: 334.9; scale-x: 0.995; scale-y: 0.995; }
        frame 103 { x: -45.9; y: 83.6; skew-x: 335.5; skew-y: 335.5; scale-x: 0.999; scale-y: 0.999; }
        frame 104 { x: -46.4; y: -10000; skew-x: 335.4; skew-y: 335.4; scale-x: 0.997; scale-y: 0.997; }
        frame 105 { x: -47.1; y: 83.8; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: -47.7; y: 84; skew-x: 334.9; skew-y: 334.9; }
        frame 107 { x: -48.3; y: 84.2; skew-x: 334.7; skew-y: 334.7; scale-x: 0.996; scale-y: 0.996; }
        frame 108 { x: -49; y: 84.3; skew-x: 334.4; skew-y: 334.4; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: -49.6; y: 84.6; skew-x: 334.2; skew-y: 334.2; }
        frame 110 { x: -50.2; y: 84.8; skew-x: 333.9; skew-y: 333.9; scale-x: 0.995; scale-y: 0.995; }
        frame 111 { x: -50.8; y: 85.3; skew-x: 333.5; skew-y: 333.5; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: -51.6; y: -10000; skew-x: 333.2; skew-y: 333.2; scale-x: 0.996; scale-y: 0.996; }
        frame 113 { x: -52.9; y: 88.6; skew-x: 331.4; skew-y: 331.4; scale-x: 0.994; scale-y: 0.994; }
        frame 114 { x: -54.2; y: 92.1; skew-x: 329.4; skew-y: 329.4; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: -55.5; y: 95.7; skew-x: 327.4; skew-y: 327.4; }
        frame 116 { x: -56.5; y: 99.3; skew-x: 325.4; skew-y: 325.4; }
        frame 117 { x: -57.7; y: 102.9; skew-x: 323.4; skew-y: 323.4; scale-x: 0.995; scale-y: 0.995; }
        frame 118 { x: -59.7; y: 95.8; skew-x: 326.6; skew-y: 326.6; scale-x: 0.994; scale-y: 0.994; }
        frame 119 { x: -61.7; y: 88.6; skew-x: 329.9; skew-y: 329.9; scale-x: 0.993; scale-y: 0.993; }
        frame 120 { x: -63.3; y: 81.8; skew-x: 333; skew-y: 333; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: -64.8; y: 74.8; skew-x: 336.2; skew-y: 336.2; scale-x: 0.995; scale-y: 0.995; }
        frame 122 { x: -64.7; y: 74.6; skew-x: -10000; skew-y: -10000; scale-x: 0.993; scale-y: 0.993; }
        frame 123 { x: -64.8; y: 74.8; scale-x: 0.995; scale-y: 0.995; }
        frame 124 { x: -65.9; y: 66.6; skew-x: 339.7; skew-y: 339.7; scale-x: 0.993; scale-y: 0.993; }
        frame 125 { x: -66.7; y: 59; skew-x: 343; skew-y: 343; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: -67.2; y: 51; skew-x: 346.5; skew-y: 346.5; }
        frame 127 { x: -67.4; y: 43.1; skew-x: 350; skew-y: 350; }
        frame 128 { x: -10000; y: 35.6; skew-x: 353.2; skew-y: 353.2; scale-x: 0.994; scale-y: 0.994; }
        frame 129 { x: -55.8; y: 5.7; skew-x: 366.1; skew-y: 366.1; scale-x: 0.992; scale-y: 0.992; }
        frame 130 { x: -39.6; y: -22; skew-x: 379.2; skew-y: 379.2; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: -26.8; y: -41; skew-x: 389.6; skew-y: 389.6; scale-x: 0.99; scale-y: 0.99; }
        frame 132 { x: -12.4; y: -57.5; skew-x: 399.9; skew-y: 399.9; scale-x: 0.989; scale-y: 0.989; }
        frame 133 { x: 3.3; y: -71.5; skew-x: 410.4; skew-y: 410.4; scale-x: 0.99; scale-y: 0.99; }
        frame 134 { x: -25.7; y: -33.8; skew-x: 386.8; skew-y: 386.8; scale-x: 0.991; scale-y: 0.991; }
        frame 135 { x: -45.5; y: 16.3; skew-x: 363.2; skew-y: 363.2; scale-x: 0.993; scale-y: 0.993; }
        frame 136 { x: -49.4; y: 48.9; skew-x: 349.5; skew-y: 349.5; scale-x: 0.996; scale-y: 0.996; }
        frame 137 { x: -47.9; y: 83.1; skew-x: 335.5; skew-y: 335.5; scale-x: 0.999; scale-y: 0.999; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: -44; y: 86.1; skew-x: 335; skew-y: 335; scale-x: 0.998; scale-y: 0.998; }
        frame 140 { x: -40.2; y: 89.1; skew-x: 334.4; skew-y: 334.4; scale-x: 0.997; scale-y: 0.997; }
        frame 141 { x: -36.5; y: 92.2; skew-x: 333.8; skew-y: 333.8; scale-x: 0.998; scale-y: 0.998; }
        frame 142 { x: -30.9; y: 98.8; skew-x: 332.2; skew-y: 332.2; scale-x: 0.997; scale-y: 0.997; }
        frame 143 { x: -25.2; y: 105.2; skew-x: 330.7; skew-y: 330.7; scale-x: 0.996; scale-y: 0.996; }
        frame 144 { x: -19.7; y: 111.8; skew-x: 329; skew-y: 329; scale-x: 0.998; scale-y: 0.998; }
        frame 145 { x: -19.1; y: 104.8; skew-x: 336.5; skew-y: 336.5; scale-x: 0.996; scale-y: 0.996; }
        frame 146 { x: -17.1; y: 97.6; skew-x: 344; skew-y: 344; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: -13.7; y: 91; skew-x: 351.3; skew-y: 351.3; }
        frame 148 { x: -10000; y: 95.5; skew-x: 350.8; skew-y: 350.8; scale-x: 1.018; scale-y: 0.958; }
        frame 149 { x: -16.1; y: 93.7; skew-x: 348.1; skew-y: 348.1; scale-x: 0.996; scale-y: 0.996; }
        frame 150 { x: -14.8; y: 92.3; skew-x: 349.7; skew-y: 349.7; scale-x: -10000; scale-y: -10000; }
        frame 151 { x: -13.7; y: 91; skew-x: 351.3; skew-y: 351.3; }
        frame 152 { x: -13.6; y: 90.8; skew-x: 351.5; skew-y: 351.5; }
        frame 153 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 196 { x: -13.7; y: 91; skew-x: 351.3; skew-y: 351.3; }
    }
    Track {
        source-name: "Zombie_gargantuar_outerarm_upper";
        frame-count: 197;
        frame 0 { x: 51.2; y: -5.8; skew-x: 352.4; skew-y: 352.4; scale-x: 0.944; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_OUTERARM_UPPER; }
        frame 1 { x: 51.5; y: -6.6; skew-x: 353.5; skew-y: 353.5; scale-x: -10000; scale-y: 0.999; image: none; }
        frame 2 { x: 51.8; y: -7.4; skew-x: 354.5; skew-y: 354.5; scale-x: 0.943; scale-y: -10000; }
        frame 3 { x: 52.1; y: -8.3; skew-x: 355.3; skew-y: 355.3; scale-x: -10000; }
        frame 4 { x: 51.1; y: -7.7; skew-x: 354.7; skew-y: 354.7; }
        frame 5 { x: 50.2; y: -7.3; skew-x: 354.2; skew-y: 354.2; }
        frame 6 { x: 49; y: -6.6; skew-x: 353.5; skew-y: 353.5; }
        frame 7 { x: 48; y: -6; skew-x: 352.7; skew-y: 352.7; }
        frame 8 { x: 47; y: -5.5; skew-x: 352.2; skew-y: 352.2; }
        frame 9 { x: 46; y: -5; skew-x: 351.5; skew-y: 351.5; }
        frame 10 { x: 44.9; y: -4.2; skew-x: 350.8; skew-y: 350.8; scale-x: 0.944; }
        frame 11 { x: 45.1; y: -3.9; skew-x: 351.2; skew-y: 351.2; scale-x: 0.943; }
        frame 12 { x: 45.5; y: -3.6; skew-x: 351.7; skew-y: 351.7; scale-x: -10000; scale-y: 0.998; }
        frame 13 { x: 45.8; y: -3.3; skew-x: 352; skew-y: 352; scale-y: 0.999; }
        frame 14 { x: 46.5; y: -3.7; skew-x: 352.2; skew-y: 352.2; scale-y: 0.998; }
        frame 15 { x: 47.1; y: -3.9; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 16 { x: 47.8; y: -4.3; scale-y: 0.999; }
        frame 17 { x: 48.5; y: -4.6; scale-y: -10000; }
        frame 18 { x: 49.1; y: -5; skew-x: 352.4; skew-y: 352.4; scale-x: 0.944; }
        frame 19 { x: 49.9; y: -5.2; skew-x: 352.5; skew-y: 352.5; scale-x: -10000; }
        frame 20 { x: 50.5; y: -5.5; skew-x: -10000; skew-y: -10000; }
        frame 21 { x: 51.2; y: -5.8; skew-x: 352.4; skew-y: 352.4; scale-y: 1; }
        frame 22 { x: 53; y: -7.8; skew-x: 352.5; skew-y: 350.2; scale-x: 0.945; scale-y: 0.999; }
        frame 23 { x: 53.3; y: -8.4; skew-x: 353; skew-y: 348.2; scale-x: 0.949; scale-y: 1.007; }
        frame 24 { x: 53.4; y: -9; skew-x: 353.2; skew-y: 346.2; scale-x: 0.954; scale-y: 1.016; }
        frame 25 { x: 53.6; y: -9.5; skew-x: 353.5; skew-y: 344.4; scale-x: 0.959; scale-y: 1.025; }
        frame 26 { x: 53.8; y: -10.1; skew-x: 353.7; skew-y: 342.4; scale-x: 0.963; scale-y: 1.033; }
        frame 27 { x: 53.7; y: -10.5; skew-x: 354; skew-y: 340.4; scale-x: 0.968; scale-y: 1.043; }
        frame 28 { x: 54.4; y: -10.9; skew-x: 355.2; skew-y: 340.5; scale-x: 0.974; scale-y: 1.042; }
        frame 29 { x: 55.1; y: -11.3; skew-x: 356.5; skew-y: 340.7; scale-x: 0.979; scale-y: -10000; }
        frame 30 { x: 55.8; y: -11.6; skew-x: 357.5; skew-y: -10000; scale-x: 0.985; }
        frame 31 { x: 56.5; y: -11.9; skew-x: 358.7; scale-x: 0.99; }
        frame 32 { x: 57.1; y: -12.3; skew-x: 359.8; skew-y: 340.8; scale-x: 0.996; scale-y: 1.043; }
        frame 33 { x: 51; y: -10.1; skew-x: 357; skew-y: 336.2; scale-x: 1.005; scale-y: 1.034; }
        frame 34 { x: 45; y: -7.9; skew-x: 354.2; skew-y: 331.7; scale-x: 1.015; scale-y: 1.025; }
        frame 35 { x: 39.3; y: -5.4; skew-x: 351.2; skew-y: 326.9; scale-x: 1.025; scale-y: 1.017; }
        frame 36 { x: 33.7; y: -3.2; skew-x: 348.4; skew-y: 322.3; scale-x: 1.036; scale-y: 1.011; }
        frame 37 { x: 33.9; y: -3.7; skew-x: 348.7; skew-y: 322.9; scale-x: 1.033; scale-y: 1.017; }
        frame 38 { x: 34; y: -4.2; skew-x: 348.9; skew-y: 323.2; scale-x: 1.031; scale-y: 1.025; }
        frame 39 { x: 34.1; y: -4.7; skew-x: 349.2; skew-y: 323.7; scale-x: 1.029; scale-y: 1.033; }
        frame 40 { x: 34.4; y: -5.3; skew-x: 349.4; skew-y: 324.2; scale-x: 1.027; scale-y: 1.041; }
        frame 41 { x: 34.8; y: -5.6; skew-x: 349.5; skew-y: 324.6; scale-x: 1.025; scale-y: 1.051; }
        frame 42 { x: 36.8; y: -6.2; skew-x: 350.7; skew-y: 326.7; scale-x: 1.018; scale-y: 1.049; }
        frame 43 { x: 38.8; y: -6.7; skew-x: 351.7; skew-y: 328.7; scale-x: 1.011; scale-y: -10000; }
        frame 44 { x: 40.8; y: -7.1; skew-x: 352.9; skew-y: 330.7; scale-x: 1.004; }
        frame 45 { x: 42.8; y: -7.6; skew-x: 354; skew-y: 332.7; scale-x: 0.998; }
        frame 46 { x: 44.8; y: -8; skew-x: 355; skew-y: 334.8; scale-x: 0.991; scale-y: 1.05; }
        frame 47 { x: 46.8; y: -9.4; skew-x: 356.7; skew-y: 337.9; scale-x: 0.983; scale-y: 1.049; }
        frame 48 { x: 48.6; y: -10.8; skew-x: 358.5; skew-y: 341.2; scale-x: 0.976; scale-y: -10000; }
        frame 49 { x: 50.4; y: -12; skew-x: 360; skew-y: 344.2; scale-x: 0.968; scale-y: 1.048; }
        frame 50 { x: 52.4; y: -13.1; skew-x: 361.8; skew-y: 347.4; scale-x: 0.961; scale-y: -10000; }
        frame 51 { x: 54.3; y: -14.2; skew-x: 363.5; skew-y: 350.5; scale-x: 0.953; scale-y: 1.049; }
        frame 52 { x: 56.4; y: -14.6; skew-x: 365.3; skew-y: 353.2; scale-x: 0.951; scale-y: 1.048; }
        frame 53 { x: 58.3; y: -15.1; skew-x: 367.3; skew-y: 355.7; scale-x: 0.948; scale-y: -10000; }
        frame 54 { x: 60.4; y: -15.5; skew-x: 369.1; skew-y: 358.4; scale-x: 0.946; }
        frame 55 { x: 62.2; y: -15.9; skew-x: 371; skew-y: 360.8; scale-x: 0.943; }
        frame 56 { x: 64.5; y: -16.2; skew-x: 373.1; skew-y: 363.5; scale-x: 0.941; }
        frame 57 { x: 58.3; y: -14.7; skew-x: 369.5; skew-y: 360; scale-x: -10000; scale-y: 1.047; }
        frame 58 { x: 52; y: -13.1; skew-x: 366.1; skew-y: 356.2; scale-y: -10000; }
        frame 59 { x: 45.8; y: -11.5; skew-x: 362.8; skew-y: 352.5; scale-x: 0.942; scale-y: 1.046; }
        frame 60 { x: 39.8; y: -9.6; skew-x: 359.3; skew-y: 348.6; scale-x: -10000; scale-y: 1.045; }
        frame 61 { x: 40.1; y: -8.4; skew-x: 357.7; skew-y: 348.5; scale-x: 0.93; scale-y: 1.035; }
        frame 62 { x: 40.5; y: -7.3; skew-x: 356.1; skew-y: 348.1; scale-x: 0.919; scale-y: 1.026; }
        frame 63 { x: 43.5; y: -7.9; skew-x: 356.9; skew-y: 349.5; scale-x: 0.928; scale-y: 1.023; }
        frame 64 { x: 46.5; y: -8.4; skew-x: 357.7; skew-y: 351; scale-x: 0.937; scale-y: 1.02; }
        frame 65 { x: 49.5; y: -8.9; skew-x: 358.3; skew-y: 352.3; scale-x: 0.946; scale-y: 1.017; }
        frame 66 { x: 50.2; y: -8.7; skew-x: 357.2; skew-y: 352; scale-x: -10000; scale-y: 1.013; }
        frame 67 { x: 50.9; y: -8.5; skew-x: 356; skew-y: 351.5; scale-x: 0.945; scale-y: 1.009; }
        frame 68 { x: 51.8; y: -8.3; skew-x: 355; skew-y: 351.2; scale-x: -10000; scale-y: 1.006; }
        frame 69 { x: 52.4; y: -8.2; skew-x: 353.7; skew-y: 350.7; scale-y: 1.002; }
        frame 70 { x: 53; y: -7.8; skew-x: 352.5; skew-y: 350.2; scale-y: 0.999; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 72 { x: 57.7; y: -8.1; skew-x: 356.9; skew-y: 355.5; scale-x: 0.943; scale-y: 1.002; }
        frame 73 { x: 62.5; y: -10000; skew-x: 361; skew-y: 360.8; scale-x: 0.941; scale-y: 1.005; }
        frame 74 { x: 67.6; y: -8; skew-x: 365.3; skew-y: 366; scale-x: 0.939; scale-y: 1.007; }
        frame 75 { x: 72.9; y: -7.8; skew-x: 369.8; skew-y: 371.5; scale-x: 0.937; scale-y: 1.011; }
        frame 76 { x: 78.3; y: -7.3; skew-x: 374.5; skew-y: 377.8; scale-x: 0.936; scale-y: 1.012; }
        frame 77 { x: 84; y: -6.6; skew-x: 379.3; skew-y: 384.3; scale-x: -10000; scale-y: 1.016; }
        frame 78 { x: 89.6; y: -5.3; skew-x: 383.8; skew-y: 390.8; scale-x: 0.935; scale-y: 1.018; }
        frame 79 { x: 95.1; y: -3.8; skew-x: 388.7; skew-y: 397.4; scale-x: 0.937; scale-y: 1.024; }
        frame 80 { x: 98; y: -3.5; skew-x: 393.3; skew-y: 401.1; scale-x: 0.936; scale-y: 1.017; }
        frame 81 { x: 100.8; y: -3.1; skew-x: 397.9; skew-y: 404.6; scale-x: -10000; scale-y: 1.011; }
        frame 82 { x: 104; y: -2.6; skew-x: 402.6; skew-y: 408.2; scale-x: 0.938; scale-y: 1.008; }
        frame 83 { x: 107.2; y: -1.9; skew-x: 407.1; skew-y: 413.4; scale-x: 0.937; scale-y: 1.004; }
        frame 84 { x: 110.3; y: -1; skew-x: 411.7; skew-y: 418.4; scale-x: 0.939; scale-y: 1.002; }
        frame 85 { x: 113.6; y: 0; skew-x: 416.3; skew-y: 423.5; scale-x: 0.941; scale-y: -10000; }
        frame 86 { x: 106.3; y: -6; skew-x: 408.1; skew-y: 414.4; scale-x: 0.938; scale-y: 1.051; }
        frame 87 { x: 98.6; y: -11.8; skew-x: 399.8; skew-y: 405.2; scale-x: -10000; scale-y: 1.102; }
        frame 88 { x: 95.8; y: -18.5; skew-x: 403.4; skew-y: 407.6; scale-y: 1.047; }
        frame 89 { x: 93.1; y: -25.3; skew-x: 407.1; skew-y: 409.8; scale-x: 0.94; scale-y: 0.994; }
        frame 90 { x: 53.9; y: -9.5; skew-x: 366; skew-y: 372.7; scale-x: 0.927; scale-y: 1.07; }
        frame 91 { x: 30.3; y: -2.8; skew-x: 353.5; skew-y: 360.4; scale-x: 0.904; scale-y: 1.154; }
        frame 92 { x: 13.7; y: -8.4; skew-x: 363; skew-y: 352.6; scale-x: 0.878; scale-y: 1.24; }
        frame 93 { x: 13.3; y: -7.1; skew-x: 362; skew-y: 352.4; scale-x: 0.885; scale-y: 1.251; }
        frame 94 { x: 12.5; y: -5.9; skew-x: 361.1; skew-y: 352; scale-x: 0.893; scale-y: 1.263; }
        frame 95 { x: 13.1; y: -7.3; skew-x: 362; skew-y: 352.4; scale-x: 0.885; scale-y: 1.251; }
        frame 96 { x: 13.7; y: -8.4; skew-x: 363; skew-y: 352.6; scale-x: 0.878; scale-y: 1.24; }
        frame 97 { x: 19.6; y: -8.7; skew-x: 362; skew-y: 352.9; scale-x: 0.887; scale-y: 1.205; }
        frame 98 { x: 25.5; y: -8.9; skew-x: 361; skew-y: 353.2; scale-x: 0.897; scale-y: 1.17; }
        frame 99 { x: 31.3; y: -9.2; skew-x: 360.2; skew-y: -10000; scale-x: 0.906; scale-y: 1.136; }
        frame 100 { x: 36.6; y: -9; skew-x: 358.4; skew-y: 352.5; scale-x: 0.916; scale-y: 1.101; }
        frame 101 { x: 42; y: -8.5; skew-x: 356.5; skew-y: 351.7; scale-x: 0.925; scale-y: 1.067; }
        frame 102 { x: 47.6; y: -8.1; skew-x: 354.5; skew-y: 351; scale-x: 0.935; scale-y: 1.033; }
        frame 103 { x: 53; y: -7.8; skew-x: 352.5; skew-y: 350.2; scale-x: 0.945; scale-y: 0.999; }
        frame 104 { x: 53.3; y: -7.6; skew-x: 353; skew-y: 350.7; scale-x: 0.944; scale-y: 0.998; }
        frame 105 { x: 53.5; y: -10000; skew-x: 353.5; skew-y: 351; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 53.8; y: -7.5; skew-x: 353.9; skew-y: 351.5; scale-x: 0.943; }
        frame 107 { x: 54; y: -7.4; skew-x: 354.2; skew-y: 351.9; scale-x: -10000; scale-y: 0.997; }
        frame 108 { x: 54.3; y: -7.3; skew-x: 354.7; skew-y: 352.2; scale-y: -10000; }
        frame 109 { x: 54.5; y: -7.2; skew-x: 355; skew-y: 352.7; }
        frame 110 { x: 54.8; y: -7; skew-x: 355.5; skew-y: 353.2; scale-x: 0.942; scale-y: 0.996; }
        frame 111 { x: 54.9; y: -6.9; skew-x: 355.9; skew-y: 353.5; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 55.2; y: -6.8; skew-x: 356.2; skew-y: 353.8; }
        frame 113 { x: 53; y: -10000; skew-x: 354.7; skew-y: 352.2; scale-x: 0.941; }
        frame 114 { x: 50.9; y: -6.7; skew-x: 353; skew-y: 350.7; scale-x: -10000; scale-y: 0.995; }
        frame 115 { x: 48.6; y: -6.5; skew-x: 351.5; skew-y: 349; scale-y: -10000; }
        frame 116 { x: 46.5; y: -6.4; skew-x: 349.7; skew-y: 347.5; }
        frame 117 { x: 44.3; y: -6.2; skew-x: 348.1; skew-y: 345.7; scale-y: 0.996; }
        frame 118 { x: 42.6; y: -5.2; skew-x: 346.7; skew-y: 342.4; scale-y: 0.998; }
        frame 119 { x: 40.9; y: -4.2; skew-x: 345.2; skew-y: 339; scale-x: 0.94; scale-y: 1; }
        frame 120 { x: 39.3; y: -3.1; skew-x: 343.7; skew-y: 335.7; scale-x: -10000; scale-y: 1.003; }
        frame 121 { x: 37.5; y: -2; skew-x: 342.2; skew-y: 332.2; scale-x: 0.941; scale-y: 1.007; }
        frame 122 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.94; scale-y: 1.006; }
        frame 123 { scale-x: 0.941; scale-y: 1.007; }
        frame 124 { x: 38.9; y: -3.4; skew-x: 343.7; skew-y: 334.9; scale-x: 0.94; scale-y: 1.003; }
        frame 125 { x: 40.3; y: -4.7; skew-x: 345.2; skew-y: 337.7; scale-x: -10000; scale-y: 1.001; }
        frame 126 { x: 41.7; y: -6; skew-x: 346.7; skew-y: 340.4; scale-y: 0.998; }
        frame 127 { x: 43.1; y: -7.1; skew-x: 348; skew-y: 343; scale-x: 0.939; scale-y: 0.995; }
        frame 128 { x: 44.5; y: -8.3; skew-x: 349.4; skew-y: 345.6; scale-x: 0.94; scale-y: 0.993; }
        frame 129 { x: 52.1; y: -9.1; skew-x: 352.7; skew-y: 349; scale-x: 0.939; scale-y: 0.992; }
        frame 130 { x: 59.8; y: -9.9; skew-x: 356; skew-y: 352.2; scale-x: 0.938; scale-y: -10000; }
        frame 131 { x: 66.2; y: -10.8; skew-x: 361.8; skew-y: 360.3; scale-x: 0.911; scale-y: 0.991; }
        frame 132 { x: 73; y: -11; skew-x: 367.8; skew-y: 368.5; scale-x: 0.884; scale-y: -10000; }
        frame 133 { x: 80; y: -10.6; skew-x: 373.7; skew-y: 376.8; scale-x: 0.857; }
        frame 134 { x: 73.8; y: -9.1; skew-x: 368.3; skew-y: 370.3; scale-x: 0.878; scale-y: 0.992; }
        frame 135 { x: 67.8; y: -7.5; skew-x: 363.3; skew-y: 363.8; scale-x: 0.9; scale-y: 0.994; }
        frame 136 { x: 60.3; y: -8; skew-x: 358; skew-y: 357; scale-x: 0.922; scale-y: 0.997; }
        frame 137 { x: 53; y: -7.8; skew-x: 352.5; skew-y: 350.2; scale-x: 0.945; scale-y: 0.999; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 55; y: -7; skew-x: 354.2; skew-y: 352; scale-x: 0.944; }
        frame 140 { x: 56.9; y: -6.3; skew-x: 356; skew-y: 353.7; scale-x: -10000; }
        frame 141 { x: 58.9; y: -5.4; skew-x: 357.6; skew-y: 355.2; }
        frame 142 { x: 62.3; y: -2.7; skew-x: 360.1; skew-y: 355.5; scale-x: 0.949; scale-y: 0.998; }
        frame 143 { x: 65.5; y: -0.2; skew-x: 362.8; skew-y: -10000; scale-x: 0.953; scale-y: -10000; }
        frame 144 { x: 68.9; y: 2.1; skew-x: 365.5; scale-x: 0.957; }
        frame 145 { x: 77.3; y: 3.1; skew-x: 373.5; skew-y: 363.5; scale-x: 0.956; scale-y: 0.997; }
        frame 146 { x: 86.1; y: 4.8; skew-x: 381.5; skew-y: 371.5; scale-x: 0.955; scale-y: 0.996; }
        frame 147 { x: 95.1; y: 7.1; skew-x: 389.6; skew-y: 379.6; scale-x: 0.956; scale-y: 0.997; }
        frame 148 { x: 89.3; y: 4.2; skew-x: 387.8; skew-y: 376; scale-x: 0.964; scale-y: 0.992; }
        frame 149 { x: 83.6; y: 1.1; skew-x: 386.1; skew-y: 372.3; scale-x: 0.974; scale-y: 0.989; }
        frame 150 { x: 78.1; y: -1.3; skew-x: 384.4; skew-y: 368.8; scale-x: 0.985; scale-y: 0.987; }
        frame 151 { x: 67.8; y: -2; skew-x: 381.3; skew-y: 365.8; scale-x: 0.983; scale-y: 0.986; }
        frame 152 { x: 57.6; y: -2.8; skew-x: 378.5; skew-y: 362.8; scale-x: -10000; scale-y: 0.985; }
        frame 153 { x: 47.4; y: -3.7; skew-x: 375.6; skew-y: 360; scale-y: -10000; }
        frame 154 { x: 33.2; y: -3.2; skew-x: 365.3; skew-y: 349.9; scale-x: 0.982; scale-y: 0.984; }
        frame 155 { x: 20; y: -1.9; skew-x: 355.2; skew-y: 339.7; scale-x: -10000; scale-y: 0.983; }
        frame 156 { x: 7.7; y: -0; skew-x: 344.9; skew-y: 329.4; scale-y: -10000; }
        frame 157 { x: 6.7; y: -1.6; skew-x: 349.7; skew-y: 334.2; scale-x: 0.98; scale-y: 0.981; }
        frame 158 { x: 6.1; y: -3.1; skew-x: 354.5; skew-y: 338.9; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: 5.6; y: -4.4; skew-x: 359.2; skew-y: 343.6; scale-y: 0.982; }
        frame 160 { x: 6.7; y: -5.7; skew-x: 360.5; skew-y: 345; scale-y: 0.981; }
        frame 161 { x: 7.8; y: -6.9; skew-x: 361.8; skew-y: 346.4; scale-y: -10000; }
        frame 162 { x: 8.8; y: -8.3; skew-x: 363.2; skew-y: 347.7; }
        frame 163 { x: 13.2; y: -10.5; skew-x: 366; skew-y: 352.7; scale-x: 0.972; }
        frame 164 { x: 17.8; y: -12.5; skew-x: 368.8; skew-y: 358; scale-x: 0.965; }
        frame 165 { x: 22.3; y: -14.3; skew-x: 371.8; skew-y: 362.8; scale-x: 0.958; scale-y: 0.98; }
        frame 166 { x: 26.9; y: -15.8; skew-x: 374.6; skew-y: 367.8; scale-x: 0.951; scale-y: -10000; }
        frame 167 { x: 31.7; y: -17.3; skew-x: 377.6; skew-y: 373; scale-x: 0.945; }
        frame 168 { x: 37.6; y: -16.5; skew-x: 377.3; skew-y: 372.3; scale-x: -10000; scale-y: 0.981; }
        frame 169 { x: 43.5; y: -15.7; skew-x: 377.1; skew-y: 371.5; scale-x: 0.946; scale-y: 0.982; }
        frame 170 { x: 49.5; y: -15; skew-x: -10000; skew-y: 370.8; scale-x: 0.948; scale-y: 0.985; }
        frame 171 { x: 55; y: -11.6; skew-x: 376.8; skew-y: 370; scale-x: -10000; scale-y: 0.986; }
        frame 172 { x: 60.8; y: -8.2; skew-x: -10000; skew-y: 369.3; scale-x: 0.949; scale-y: 0.988; }
        frame 173 { x: 66.5; y: -4.8; skew-y: 368.8; scale-x: 0.952; scale-y: 0.991; }
        frame 174 { x: 72.7; y: -2.5; skew-x: 378.3; skew-y: 369.5; scale-x: -10000; scale-y: 0.992; }
        frame 175 { x: 78.8; y: -0.3; skew-x: 379.8; skew-y: 370.3; scale-x: 0.954; scale-y: 0.994; }
        frame 176 { x: 85; y: 1.9; skew-x: 381.3; skew-y: 371.3; scale-x: 0.956; scale-y: 0.997; }
        frame 177 { x: 81.5; y: 0.1; skew-x: 382.8; skew-y: 370; scale-x: 0.969; scale-y: 0.991; }
        frame 178 { x: 78.1; y: -1.3; skew-x: 384.4; skew-y: 368.8; scale-x: 0.985; scale-y: 0.987; }
        frame 179 { x: 67.8; y: -2; skew-x: 381.3; skew-y: 365.8; scale-x: 0.983; scale-y: 0.986; }
        frame 180 { x: 57.6; y: -2.8; skew-x: 378.5; skew-y: 362.8; scale-x: -10000; scale-y: 0.985; }
        frame 181 { x: 47.4; y: -3.7; skew-x: 375.6; skew-y: 360; scale-y: -10000; }
        frame 182 { x: 29.9; y: -3.2; skew-x: 365.3; skew-y: 349.9; scale-x: 0.982; scale-y: 0.984; }
        frame 183 { x: 13.3; y: -1.9; skew-x: 355.2; skew-y: 339.7; scale-x: -10000; scale-y: 0.983; }
        frame 184 { x: -2.2; y: -0; skew-x: 344.9; skew-y: 329.4; scale-y: -10000; }
        frame 185 { x: -17.9; y: 7; skew-x: 342.4; skew-y: 326.7; scale-x: 0.98; scale-y: 0.981; }
        frame 186 { x: -33.5; y: 14.3; skew-x: 339.7; skew-y: 324.1; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: -59.9; y: 40; skew-x: 325.4; skew-y: 309.8; scale-x: 0.978; scale-y: 0.979; }
        frame 188 { x: -83.8; y: 65.9; skew-x: 311; skew-y: 295.5; scale-x: 0.979; scale-y: 0.98; }
        frame 189 { x: -85.3; y: 64.1; skew-x: 320.1; skew-y: 305.1; scale-x: 0.973; scale-y: 0.978; }
        frame 190 { x: -85.9; y: 62.1; skew-x: 329.1; skew-y: 314.8; scale-x: 0.97; scale-y: -10000; }
        frame 191 { x: -86.9; y: 65.2; skew-x: 329.9; skew-y: 313.7; scale-x: 0.973; scale-y: 0.972; }
        frame 192 { x: -87.9; y: 68.2; skew-x: 330.8; skew-y: 312.7; scale-x: 0.978; scale-y: 0.97; }
        frame 193 { x: -87.1; y: 62.6; skew-x: 332.4; skew-y: 314.2; scale-x: 0.977; scale-y: 0.968; }
        frame 194 { x: -86.4; y: 57.1; skew-x: 333.9; skew-y: 315.8; scale-x: 0.978; scale-y: 0.97; }
        frame 195 { x: -86; y: 59.6; skew-x: 331.4; skew-y: 315.3; scale-x: 0.973; scale-y: 0.972; }
        frame 196 { x: -85.9; y: 62.1; skew-x: 329.1; skew-y: 314.8; scale-x: 0.97; scale-y: 0.978; }
    }
    Track {
        source-name: "Zombie_gargantuar_outerarm_lower";
        frame-count: 197;
        frame 0 { x: 52.3; y: 15.9; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_OUTERARM_LOWER; }
        frame 1 { x: 52; y: 15.5; skew-x: 0.3; skew-y: 0.3; image: none; }
        frame 2 { x: 51.9; y: 15.1; skew-x: 0.6; skew-y: 0.6; }
        frame 3 { x: 51.7; y: 14.6; skew-x: 1; skew-y: 1; }
        frame 4 { x: 50.9; y: 15.2; skew-x: 0.3; skew-y: 0.3; scale-y: 1.009; }
        frame 5 { x: 50.1; y: 15.6; skew-x: -0.2; skew-y: -0.2; scale-y: 1.018; }
        frame 6 { x: 49.2; y: 16.2; skew-x: -0.9; skew-y: -0.9; scale-y: 1.027; }
        frame 7 { x: 48.4; y: 16.7; skew-x: -1.5; skew-y: -1.5; scale-y: 1.036; }
        frame 8 { x: 47.5; y: 17.3; skew-x: -2.2; skew-y: -2.2; scale-y: 1.045; }
        frame 9 { x: 46.5; y: 17.9; skew-x: -2.9; skew-y: -2.9; scale-y: 1.054; }
        frame 10 { x: 45.8; y: 18.5; skew-x: -3.7; skew-y: -3.7; scale-y: 1.064; }
        frame 11 { x: 46; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 1.001; scale-y: 1.074; }
        frame 12 { x: 46.2; skew-x: -3.9; skew-y: -3.9; scale-x: 1.003; scale-y: 1.085; }
        frame 13 { x: -10000; y: 18.8; skew-x: -4.2; skew-y: -4.2; scale-x: 1.005; scale-y: 1.096; }
        frame 14 { x: 47; y: 18.5; skew-x: -3.7; skew-y: -3.7; scale-x: 1.004; scale-y: 1.083; }
        frame 15 { x: 47.7; y: 18.1; skew-x: -3.2; skew-y: -3.2; scale-x: 1.003; scale-y: 1.071; }
        frame 16 { x: 48.6; y: 17.7; skew-x: -2.5; skew-y: -2.5; scale-x: -10000; scale-y: 1.06; }
        frame 17 { x: 49.3; y: 17.3; skew-x: -1.9; skew-y: -1.9; scale-x: 1.002; scale-y: 1.048; }
        frame 18 { x: 50.1; y: 17; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: 1.036; }
        frame 19 { x: 50.7; y: 16.7; skew-x: -0.9; skew-y: -0.9; scale-x: 1.001; scale-y: 1.024; }
        frame 20 { x: 51.5; y: 16.4; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: 1.012; }
        frame 21 { x: 52.3; y: 15.9; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 22 { x: 55.8; y: 13.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 58.1; y: 13.5; skew-x: 0.1; scale-x: 0.999; scale-y: 0.999; }
        frame 24 { x: 60.6; y: 13.1; skew-x: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 63.1; y: 12.6; skew-x: 0.5; }
        frame 26 { x: 65.7; y: 12.3; skew-x: 0.6; skew-y: 0.1; scale-y: 0.998; }
        frame 27 { x: 68.3; y: 11.8; skew-x: 0.9; skew-y: 0.3; scale-x: 0.998; scale-y: -10000; }
        frame 28 { x: 68.8; y: 12.1; skew-x: 0.8; skew-y: 0; scale-x: -10000; }
        frame 29 { x: 69.4; y: 12.3; skew-x: 0.5; skew-y: -10000; }
        frame 30 { x: 70.1; y: 12.4; skew-x: -10000; }
        frame 31 { x: 70.8; y: 12.6; skew-x: 0.3; scale-x: 0.997; scale-y: 0.997; }
        frame 32 { x: 71.3; y: 12.8; skew-x: 0.4; skew-y: -0.2; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 68.1; y: 13.3; skew-x: -1.9; skew-y: -2.7; }
        frame 34 { x: 65.2; y: 13.7; skew-x: -4.4; skew-y: -5; scale-x: 0.996; scale-y: 0.996; }
        frame 35 { x: 62.1; y: 14.3; skew-x: -6.9; skew-y: -7.5; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 59; y: 14.8; skew-x: -9.5; skew-y: -10.1; }
        frame 37 { x: 59.7; y: 13.7; skew-x: -7.4; skew-y: -8; scale-x: 0.995; scale-y: 0.995; }
        frame 38 { x: 60.2; y: 12.6; skew-x: -5.4; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 60.8; y: 11.5; skew-x: -3.4; skew-y: -4.2; }
        frame 40 { x: 61.4; y: 10.5; skew-x: -1.4; skew-y: -2.2; }
        frame 41 { x: 62; y: 9.6; skew-x: 0.3; skew-y: -0.3; }
        frame 42 { x: 63; y: 9; skew-x: 2.8; skew-y: 2; }
        frame 43 { x: 64.2; y: 8.4; skew-x: 5.3; skew-y: 4.6; scale-x: 0.994; scale-y: 0.994; }
        frame 44 { x: 65.6; y: 7.9; skew-x: 7.8; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 66.7; y: 7.5; skew-x: 10.3; skew-y: 9.8; }
        frame 46 { x: 68.1; y: 7.1; skew-x: 13; skew-y: 12.3; }
        frame 47 { x: 68.3; y: 6.6; skew-x: 15.5; skew-y: 14.8; scale-x: 0.993; scale-y: 0.993; }
        frame 48 { x: 68.7; y: 6.1; skew-x: 18; skew-y: 17.3; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 69; y: 6; skew-x: 20.5; skew-y: 19.8; }
        frame 50 { x: 69.3; y: 5.7; skew-x: 23.1; skew-y: 22.3; scale-y: 0.992; }
        frame 51 { x: 69.8; y: 5.4; skew-x: 25.6; skew-y: 25; scale-x: 0.994; scale-y: 0.993; }
        frame 52 { x: 70.2; y: 5.7; skew-x: 27.1; skew-y: 26.6; scale-x: 0.992; scale-y: 0.992; }
        frame 53 { x: 70.7; y: 5.8; skew-x: 28.8; skew-y: 28.1; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 71.2; y: 6.2; skew-x: 30.4; skew-y: 29.8; scale-x: 0.991; scale-y: 0.991; }
        frame 55 { x: 71.7; y: 6.4; skew-x: 32.1; skew-y: 31.4; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 72.3; y: 6.7; skew-x: 33.7; skew-y: 33.1; scale-x: 0.992; scale-y: 0.992; }
        frame 57 { x: 66; y: 7.4; skew-x: 28.6; skew-y: 27.8; scale-x: 0.99; scale-y: 0.99; }
        frame 58 { x: 60; y: 8.6; skew-x: 23.3; skew-y: 22.8; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 54; y: 9.9; skew-x: 18.3; skew-y: 17.6; scale-x: 0.989; scale-y: 0.989; }
        frame 60 { x: 48.3; y: 11.5; skew-x: 13.3; skew-y: 12.6; scale-x: 0.99; scale-y: 0.99; }
        frame 61 { x: 47.4; y: 12.3; skew-x: 9.8; skew-y: 9.1; scale-x: 0.991; scale-y: 0.991; }
        frame 62 { x: 46.6; y: 13.2; skew-x: 6.2; skew-y: 5.8; scale-x: 0.993; scale-y: 0.993; }
        frame 63 { x: 48.9; y: 13.5; skew-x: 5.8; skew-y: 5.3; scale-x: 0.994; scale-y: 0.994; }
        frame 64 { x: 51.1; y: 13.6; skew-x: 5.3; skew-y: 4.8; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 53.5; y: 13.9; skew-x: 4.8; skew-y: 4.6; scale-x: 0.995; scale-y: 0.995; }
        frame 66 { x: 53.8; y: 14; skew-x: 3.8; skew-y: 3.5; scale-x: 0.996; scale-y: 0.996; }
        frame 67 { x: 54.2; y: -10000; skew-x: 2.8; skew-y: 2.8; scale-x: 0.997; scale-y: 0.997; }
        frame 68 { x: 54.6; skew-x: 1.8; skew-y: 1.8; scale-x: 0.998; scale-y: 0.998; }
        frame 69 { x: 54.9; y: 14.1; skew-x: 0.8; skew-y: 0.8; scale-x: 0.999; scale-y: 0.999; }
        frame 70 { x: 55.8; y: 13.8; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 59.9; y: 10.8; skew-x: 8.8; skew-y: 11.5; scale-x: 1.002; scale-y: 1.04; }
        frame 73 { x: 64.8; y: 9.1; skew-x: 17.8; skew-y: 23; scale-x: 1.005; scale-y: 1.083; }
        frame 74 { x: 72; y: 6.5; skew-x: 26.6; skew-y: 34.6; scale-x: 1.008; scale-y: 1.124; }
        frame 75 { x: 79.2; y: 5.1; skew-x: 35.6; skew-y: 46.1; scale-x: 1.013; scale-y: 1.168; }
        frame 76 { x: 86.1; y: 3.1; skew-x: 47.4; skew-y: 55.4; scale-x: 1.006; scale-y: 1.208; }
        frame 77 { x: 93; y: 2.7; skew-x: 59.2; skew-y: 64.7; scale-x: 1.003; scale-y: 1.252; }
        frame 78 { x: 101.3; y: 4.5; skew-x: 71.2; skew-y: 73.9; scale-x: 0.998; scale-y: 1.249; }
        frame 79 { x: 108.7; y: 7.6; skew-x: 82.9; skew-y: 82.9; scale-x: 0.995; scale-y: 1.248; }
        frame 80 { x: 116; y: 10.6; skew-x: 94.8; skew-y: 94.8; scale-x: 0.994; scale-y: 1.295; }
        frame 81 { x: 121.7; y: 15; skew-x: 106.6; skew-y: 106.6; scale-x: 0.992; scale-y: 1.342; }
        frame 82 { x: 125.1; y: 20.9; skew-x: 118.6; skew-y: 118.6; scale-x: -10000; scale-y: 1.391; }
        frame 83 { x: 126.9; y: 28.1; skew-x: 130.6; skew-y: 131.6; scale-x: 0.99; scale-y: 1.388; }
        frame 84 { x: 126.5; y: 34.5; skew-x: 142.6; skew-y: 144.6; scale-x: -10000; scale-y: 1.387; }
        frame 85 { x: 124.1; y: 40.4; skew-x: 154.5; skew-y: 157.5; scale-x: 0.991; scale-y: 1.388; }
        frame 86 { x: 123.7; y: 33.8; skew-x: 149.2; skew-y: 150.7; scale-x: 0.988; scale-y: 1.36; }
        frame 87 { x: 123; y: 26.8; skew-x: 144; skew-y: 144; scale-x: -10000; scale-y: 1.336; }
        frame 88 { x: 117.8; y: 13.6; skew-x: 134.4; skew-y: 134.4; scale-x: 0.987; scale-y: 1.31; }
        frame 89 { x: 111.3; y: 0.5; skew-x: 124.9; skew-y: 124.9; scale-x: 0.989; scale-y: 1.287; }
        frame 90 { x: 83.5; y: -3.9; skew-x: 81.2; skew-y: 81.2; scale-x: 0.987; scale-y: 1.359; }
        frame 91 { x: 57.2; y: -0.2; skew-x: 55.8; skew-y: 55.8; scale-x: 0.986; scale-y: 1.432; }
        frame 92 { x: 26.3; y: 19.3; skew-x: 13.7; skew-y: 30.9; scale-x: 1.033; scale-y: 1.508; }
        frame 93 { x: 25; y: 23.8; skew-x: 10.8; skew-y: 33.1; scale-x: 1.07; scale-y: 1.505; }
        frame 94 { x: 23.9; y: 28; skew-x: 7.9; skew-y: 35.2; scale-x: 1.11; scale-y: 1.507; }
        frame 95 { x: 25.1; y: 23.5; skew-x: 10.8; skew-y: 33.1; scale-x: 1.07; scale-y: 1.505; }
        frame 96 { x: 26.3; y: 19.3; skew-x: 13.7; skew-y: 30.9; scale-x: 1.033; scale-y: 1.508; }
        frame 97 { x: 30.5; y: 16.8; skew-x: 13; skew-y: 27.8; scale-x: 1.027; scale-y: 1.433; }
        frame 98 { x: 35; y: 14.4; skew-x: 12.5; skew-y: 24.8; scale-x: 1.022; scale-y: 1.36; }
        frame 99 { x: 39.5; y: 12.3; skew-x: 12.1; skew-y: 21.9; scale-x: 1.018; scale-y: 1.288; }
        frame 100 { x: 43; y: 12.2; skew-x: 9; skew-y: 16.3; scale-x: 1.013; scale-y: 1.215; }
        frame 101 { x: 46.8; y: 12.5; skew-x: 6; skew-y: 10.8; scale-x: 1.008; scale-y: 1.143; }
        frame 102 { x: 51; y: 13.1; skew-x: 3; skew-y: 5.3; scale-x: 1.004; scale-y: 1.072; }
        frame 103 { x: 55.8; y: 13.8; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 104 { x: 55.6; y: -10000; skew-x: 0.3; skew-y: 0.3; scale-x: 0.999; scale-y: 0.999; }
        frame 105 { x: -10000; y: 13.7; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 55.5; y: 13.5; skew-x: 0.8; skew-y: 0.8; }
        frame 107 { x: 55.4; y: 13.4; skew-x: 1; skew-y: 1; scale-x: 0.998; scale-y: 0.998; }
        frame 108 { x: -10000; y: 13.3; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: 55.2; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 110 { x: 55.1; y: 13.1; skew-x: 1.6; skew-y: 1.6; scale-x: 0.997; scale-y: 0.997; }
        frame 111 { x: 55; y: -10000; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 55.1; y: 12.8; skew-x: 2.2; skew-y: 2.2; }
        frame 113 { x: 54.3; y: 12.4; skew-x: 2.5; skew-y: 2.5; scale-x: 0.996; scale-y: 0.996; }
        frame 114 { x: 53.3; y: 11.9; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 52.5; y: 11.5; skew-x: 3; skew-y: 3; }
        frame 116 { x: 51.5; y: 11.2; skew-x: 3.3; skew-y: 3.3; }
        frame 117 { x: 50.5; y: 10.7; skew-x: 3.7; skew-y: 3.7; }
        frame 118 { x: 51; y: 10.1; skew-x: 4.5; skew-y: 5.5; scale-x: 0.995; scale-y: 1.006; }
        frame 119 { x: 51.6; y: 9.6; skew-x: 5.5; skew-y: 7.3; scale-x: -10000; scale-y: 1.017; }
        frame 120 { x: 52.3; y: 9.1; skew-x: 6.3; skew-y: 9.3; scale-x: 0.994; scale-y: 1.027; }
        frame 121 { x: 52.9; y: 8.4; skew-x: 7.4; skew-y: 11.1; scale-x: -10000; scale-y: 1.038; }
        frame 122 { x: -10000; y: 8.5; skew-x: 7.3; skew-y: 11; scale-y: -10000; }
        frame 123 { y: 8.4; skew-x: 7.4; skew-y: 11.1; }
        frame 124 { x: 53.4; y: 7.6; skew-x: 9.1; skew-y: 12.8; scale-x: 0.993; scale-y: 1.037; }
        frame 125 { x: 53.9; y: 6.7; skew-x: 11; skew-y: 14.6; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 54.5; y: 5.9; skew-x: 12.8; skew-y: 16.5; scale-y: 1.036; }
        frame 127 { x: 55.1; y: 5.1; skew-x: 14.5; skew-y: 18.3; scale-x: 0.992; scale-y: -10000; }
        frame 128 { x: 55.5; y: 4.3; skew-x: 16.4; skew-y: 20.1; scale-x: 0.993; scale-y: 1.037; }
        frame 129 { x: 64.8; y: 2.1; skew-x: 23; skew-y: 26.6; scale-x: 0.991; scale-y: 1.035; }
        frame 130 { x: 74.5; y: 0.4; skew-x: 29.7; skew-y: 33.4; scale-x: 0.992; scale-y: 1.036; }
        frame 131 { x: 78.6; y: 0.5; skew-x: 38.3; skew-y: 41.9; scale-x: 0.99; scale-y: 1.033; }
        frame 132 { x: 82.7; y: 1.6; skew-x: 46.9; skew-y: 50.6; scale-x: 0.989; scale-y: -10000; }
        frame 133 { x: 86.5; y: 3.5; skew-x: 55.5; skew-y: 59.2; scale-x: 0.991; scale-y: 1.034; }
        frame 134 { x: 78.3; y: -10000; skew-x: 39.1; skew-y: 41.9; scale-x: 0.99; scale-y: 1.023; }
        frame 135 { x: 70; y: 6.8; skew-x: 22.8; skew-y: 24.6; scale-x: 0.993; scale-y: 1.015; }
        frame 136 { x: 62.4; y: 9.6; skew-x: 11.3; skew-y: 12.3; scale-x: 0.996; scale-y: 1.007; }
        frame 137 { x: 55.8; y: 13.8; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 57.3; y: 15.8; skew-x: -0.4; skew-y: -0.4; scale-x: 0.999; scale-y: 0.999; }
        frame 140 { x: 58.8; y: 17.8; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: 60.4; y: 19.8; skew-x: -1.6; skew-y: -1.6; }
        frame 142 { x: 61.7; y: 24; skew-x: -4.9; skew-y: -4.9; scale-x: 0.998; scale-y: 0.998; }
        frame 143 { x: 63.4; y: 28.3; skew-x: -8.2; skew-y: -8.2; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 64.9; y: 32.8; skew-x: -11.8; skew-y: -11.8; }
        frame 145 { x: 68.5; y: 35.4; skew-x: -9.2; skew-y: -9.2; scale-x: 0.996; scale-y: 0.996; }
        frame 146 { x: 72; y: 38.3; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 75.5; y: 41; skew-x: -4.2; skew-y: -4.2; scale-x: 0.995; scale-y: 0.995; }
        frame 148 { x: 71.3; y: 43.5; skew-x: -12.9; skew-y: -12.9; scale-x: 0.994; scale-y: 0.994; }
        frame 149 { x: 67.8; y: 46.7; skew-x: -21.7; skew-y: -21.7; scale-x: 0.993; scale-y: 0.993; }
        frame 150 { x: 65.1; y: 50.3; skew-x: -30.7; skew-y: -30.7; scale-x: 0.994; scale-y: 0.994; }
        frame 151 { x: 57.5; y: 49.9; skew-x: -33.5; skew-y: -33.5; scale-x: 0.992; scale-y: 0.992; }
        frame 152 { x: 50; y: 49.6; skew-x: -36.5; skew-y: -36.5; scale-x: 0.991; scale-y: 0.991; }
        frame 153 { x: 42.4; y: 49.2; skew-x: -39.5; skew-y: -39.5; scale-x: 0.992; scale-y: 0.992; }
        frame 154 { x: 37.2; y: 49; skew-x: -49.8; skew-y: -49.8; scale-x: 0.99; scale-y: 0.99; }
        frame 155 { x: 33.1; y: 48.6; skew-x: -60; skew-y: -60; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 30.4; y: 47.9; skew-x: -70.1; skew-y: -70.1; scale-x: 0.991; scale-y: 0.991; }
        frame 157 { x: 22.9; y: 44.7; skew-x: -60.3; skew-y: -60.3; scale-x: 0.988; scale-y: 0.988; }
        frame 158 { x: 16.4; y: 41.3; skew-x: -50.3; skew-y: -50.3; scale-x: 0.987; scale-y: 0.987; }
        frame 159 { x: 11.2; y: 37.8; skew-x: -40.3; skew-y: -40.3; scale-x: 0.988; scale-y: 0.988; }
        frame 160 { x: 9.4; y: 34.1; skew-x: -35.2; skew-y: -35.2; scale-x: 0.986; scale-y: 0.986; }
        frame 161 { x: 7.8; y: 30.3; skew-x: -30; skew-y: -30; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 6.5; y: 26.7; skew-x: -24.8; skew-y: -24.8; scale-x: 0.987; scale-y: 0.987; }
        frame 163 { x: 8.8; y: 20.5; skew-x: -15.2; skew-y: -15.2; scale-x: 0.986; scale-y: 0.986; }
        frame 164 { x: 12; y: 14.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.985; scale-y: 0.985; }
        frame 165 { x: 15.9; y: 10; skew-x: 3.6; skew-y: 3.6; scale-x: -10000; scale-y: -10000; }
        frame 166 { x: 20.6; y: 6.1; skew-x: 13.3; skew-y: 13.3; scale-x: 0.984; scale-y: 0.984; }
        frame 167 { x: 25.6; y: 3.2; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 30.1; y: 5.4; skew-x: 17.3; skew-y: 17.3; }
        frame 169 { x: 34.6; y: 7.9; skew-x: 11.8; skew-y: 11.8; scale-x: 0.985; scale-y: 0.985; }
        frame 170 { x: 39.4; y: 10.7; skew-x: 6.3; skew-y: 6.3; scale-x: 0.987; scale-y: 0.987; }
        frame 171 { x: 44; y: 16.4; skew-x: 0.8; skew-y: 0.8; scale-x: 0.989; scale-y: 0.989; }
        frame 172 { x: 49; y: 22.5; skew-x: -4.4; skew-y: -4.4; scale-x: 0.99; scale-y: 0.99; }
        frame 173 { x: 54.2; y: 28.7; skew-x: -10; skew-y: -10; scale-x: 0.992; scale-y: 0.992; }
        frame 174 { x: 59.6; y: 31.9; skew-x: -10.7; skew-y: -10.7; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 65; y: 35.1; skew-x: -11.7; skew-y: -11.7; scale-x: 0.994; scale-y: 0.994; }
        frame 176 { x: 70.4; y: 38.3; skew-x: -12.5; skew-y: -12.5; scale-x: 0.996; scale-y: 0.996; }
        frame 177 { x: 67.3; y: 44; skew-x: -21.5; skew-y: -21.5; scale-x: 0.994; scale-y: 0.994; }
        frame 178 { x: 65.1; y: 50.3; skew-x: -30.7; skew-y: -30.7; scale-x: -10000; scale-y: -10000; }
        frame 179 { x: 57.5; y: 49.9; skew-x: -33.5; skew-y: -33.5; scale-x: 0.992; scale-y: 0.992; }
        frame 180 { x: 50; y: 49.6; skew-x: -36.5; skew-y: -36.5; scale-x: 0.991; scale-y: 0.991; }
        frame 181 { x: 42.4; y: 49.2; skew-x: -39.5; skew-y: -39.5; scale-x: 0.992; scale-y: 0.992; }
        frame 182 { x: 33.6; y: 48.5; skew-x: -52; skew-y: -52; scale-x: 0.99; scale-y: 0.99; }
        frame 183 { x: 26.7; y: 47.6; skew-x: -64.6; skew-y: -64.6; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: 21.5; y: 46.2; skew-x: -76.9; skew-y: -76.9; }
        frame 185 { x: 7.9; y: 52.2; skew-x: -79.6; skew-y: -79.6; scale-x: 0.989; scale-y: 0.989; }
        frame 186 { x: -5.6; y: 58.1; skew-x: -82.1; skew-y: -82.1; scale-x: 0.988; scale-y: 0.988; }
        frame 187 { x: -19.5; y: 74.6; skew-x: -102.2; skew-y: -102.2; scale-x: 0.987; scale-y: 0.987; }
        frame 188 { x: -30.4; y: 87.2; skew-x: -122.3; skew-y: -122.3; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: -56.6; y: 91.2; skew-x: -85.4; skew-y: -75.9; scale-x: 1.012; scale-y: 1.034; }
        frame 190 { x: -62.7; y: 87.3; skew-x: -48.3; skew-y: -29.3; scale-x: 1.038; scale-y: 1.084; }
        frame 191 { x: -63.3; y: 90.3; skew-x: -47.3; skew-y: -30.2; scale-x: 1.03; scale-y: 1.068; }
        frame 192 { x: -64; y: 93.3; skew-x: -46.2; skew-y: -31.1; scale-x: 1.025; scale-y: 1.055; }
        frame 193 { x: -62.1; y: 91.3; skew-x: -48.8; skew-y: -33.7; scale-x: 1.024; scale-y: 1.053; }
        frame 194 { x: -60.3; y: 89.5; skew-x: -51.5; skew-y: -36.3; scale-x: 1.025; scale-y: 1.054; }
        frame 195 { x: -61.5; y: 88.3; skew-x: -49.8; skew-y: -32.7; scale-x: 1.03; scale-y: 1.067; }
        frame 196 { x: -62.7; y: 87.3; skew-x: -48.3; skew-y: -29.3; scale-x: 1.038; scale-y: 1.084; }
    }
    Track {
        source-name: "Zombie_gargantuar_outerarm_hand";
        frame-count: 197;
        frame 0 { x: 42; y: 77.6; skew-x: 335.5; skew-y: 335.5; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_OUTERARM_HAND; }
        frame 1 { x: 41.6; y: 76.6; skew-x: 337.2; skew-y: 337.2; scale-x: 0.998; scale-y: 0.998; image: none; }
        frame 2 { x: 41.1; y: 75.7; skew-x: 338.7; skew-y: 338.7; scale-x: 0.997; scale-y: 0.997; }
        frame 3 { x: 40.8; y: 74.7; skew-x: 340.1; skew-y: 340.1; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 40.6; y: 76.1; skew-x: 338.5; skew-y: 338.5; scale-x: 0.996; scale-y: 0.996; }
        frame 5 { x: 40.5; y: 77.6; skew-x: 336.9; skew-y: 336.9; scale-x: 0.997; scale-y: 0.997; }
        frame 6 { x: 40.4; y: 79; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 40.3; y: 80.5; skew-x: 333.4; skew-y: 333.4; }
        frame 8 { x: -10000; y: 81.9; skew-x: 331.9; skew-y: 331.9; }
        frame 9 { x: 40.2; y: 83.4; skew-x: 330.2; skew-y: 330.2; }
        frame 10 { x: 40.1; y: 85; skew-x: 328.4; skew-y: 328.4; scale-x: 0.999; scale-y: 0.999; }
        frame 11 { x: 40.7; y: 84.3; skew-x: 330.7; skew-y: 330.7; scale-x: 0.997; scale-y: 1.007; }
        frame 12 { x: 41.1; y: 83.8; skew-x: 332.7; skew-y: 332.7; scale-x: 0.996; scale-y: 1.016; }
        frame 13 { x: 41.6; y: 83.2; skew-x: 334.9; skew-y: 334.9; scale-x: 0.997; scale-y: 1.026; }
        frame 14 { x: 41.7; y: 82.5; skew-x: 335; skew-y: 335; scale-x: 0.996; scale-y: 1.021; }
        frame 15 { x: 41.9; y: 81.7; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; scale-y: 1.018; }
        frame 16 { x: -10000; y: 81.1; skew-x: -10000; skew-y: -10000; scale-x: 0.997; scale-y: 1.015; }
        frame 17 { y: 80.5; scale-x: -10000; scale-y: 1.012; }
        frame 18 { x: 42; y: 79.6; skew-x: 335.4; skew-y: 335.4; scale-y: 1.008; }
        frame 19 { x: -10000; y: 79; skew-x: -10000; skew-y: -10000; scale-x: 0.998; scale-y: 1.005; }
        frame 20 { y: 78.3; scale-x: -10000; scale-y: 1.002; }
        frame 21 { y: 77.6; skew-x: 335.5; skew-y: 335.5; scale-x: 0.999; scale-y: 0.999; }
        frame 22 { x: 45.4; y: 75.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 47.7; y: 75; skew-x: 335.9; skew-y: 335.7; scale-x: 0.997; scale-y: 0.998; }
        frame 24 { x: 50.2; y: 74.7; skew-x: 336; skew-y: 335.9; scale-x: 0.996; scale-y: 0.999; }
        frame 25 { x: 52.5; y: 74.3; skew-x: 336.2; skew-y: 336; scale-x: 0.994; scale-y: -10000; }
        frame 26 { x: 55; y: 73.8; skew-x: 336.5; skew-y: 336.2; scale-x: 0.993; scale-y: 1; }
        frame 27 { x: 57.1; y: 73.7; skew-x: 336.7; skew-y: 336.3; scale-x: -10000; scale-y: 1.001; }
        frame 28 { x: 58.2; y: 74.2; skew-x: 335.7; skew-y: 335.4; scale-x: 0.992; scale-y: 1; }
        frame 29 { x: 59.3; y: 74.6; skew-x: 334.9; skew-y: 334.4; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 60.4; y: 75.2; skew-x: 333.9; skew-y: 333.4; }
        frame 31 { x: 61.5; y: 75.7; skew-x: 332.9; skew-y: 332.4; scale-x: 0.991; }
        frame 32 { x: 62.5; y: 76.2; skew-x: 331.8; skew-y: 331.4; scale-x: 0.993; scale-y: 1.001; }
        frame 33 { x: -10000; y: 76.8; skew-x: 328.2; skew-y: 327.7; scale-x: 0.991; scale-y: 0.999; }
        frame 34 { y: 77.7; skew-x: 324.4; skew-y: 323.9; scale-x: 0.99; scale-y: 0.998; }
        frame 35 { x: 62.8; y: 78.4; skew-x: 320.6; skew-y: 320.2; scale-x: 0.989; scale-y: -10000; }
        frame 36 { x: 63.1; y: 79.3; skew-x: 316.9; skew-y: 316.5; scale-x: 0.99; scale-y: 0.999; }
        frame 37 { x: 61.4; y: 77.8; skew-x: 319.7; skew-y: 319.4; scale-x: 0.989; scale-y: 0.997; }
        frame 38 { x: 59.4; y: 76.2; skew-x: 322.6; skew-y: 322.1; scale-x: 0.988; scale-y: -10000; }
        frame 39 { x: 57.8; y: 74.6; skew-x: 325.4; skew-y: 324.9; scale-x: -10000; }
        frame 40 { x: 56.1; y: 73.1; skew-x: 328.2; skew-y: 327.9; scale-y: 0.996; }
        frame 41 { x: 54.5; y: 71.6; skew-x: 331; skew-y: 330.6; scale-x: 0.99; scale-y: 0.998; }
        frame 42 { x: 53; y: 70.2; skew-x: 333.7; skew-y: 333.2; scale-x: 0.988; scale-y: 0.996; }
        frame 43 { x: 51.4; y: 68.8; skew-x: 336.2; skew-y: 335.7; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 50; y: 67.6; skew-x: 338.7; skew-y: 338.2; }
        frame 45 { x: 48.6; y: 66.3; skew-x: 341.2; skew-y: 340.9; }
        frame 46 { x: 47.2; y: 65.1; skew-x: 343.7; skew-y: 343.3; scale-x: 0.989; scale-y: 0.997; }
        frame 47 { x: 45.1; y: 63.6; skew-x: 346; skew-y: 345.7; scale-x: 0.988; scale-y: 0.996; }
        frame 48 { x: 43.1; y: 62.3; skew-x: 348.4; skew-y: 348; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 41.1; y: 61; skew-x: 350.7; skew-y: 350.2; }
        frame 50 { x: 39.2; y: 59.6; skew-x: 352.9; skew-y: 352.5; }
        frame 51 { x: 37.1; y: 58.5; skew-x: 355.1; skew-y: 354.7; }
        frame 52 { x: 35.7; y: 57.4; skew-x: 357.2; skew-y: 357; }
        frame 53 { x: 34.3; y: 56; skew-x: 359.5; skew-y: 359; }
        frame 54 { x: 32.9; y: 54.9; skew-x: 361.5; skew-y: 361; scale-x: 0.987; }
        frame 55 { x: 31.5; y: 53.9; skew-x: 363.6; skew-y: 363.3; scale-x: -10000; scale-y: 0.995; }
        frame 56 { x: 30.4; y: 52.6; skew-x: 365.9; skew-y: 365.5; scale-y: -10000; }
        frame 57 { x: 28.4; y: 57; skew-x: 358.7; skew-y: 358.2; scale-x: 0.986; scale-y: 0.994; }
        frame 58 { x: 26.7; y: 61.8; skew-x: 351.2; skew-y: 351; scale-x: 0.985; scale-y: 0.993; }
        frame 59 { x: 25.5; y: 66.7; skew-x: 344; skew-y: 343.7; scale-x: 0.984; scale-y: 0.992; }
        frame 60 { x: 24.6; y: 72; skew-x: 336.6; skew-y: 336.2; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 27; y: 73; skew-x: 336.2; skew-y: 335.9; scale-x: 0.985; }
        frame 62 { x: 29.3; y: 74.1; skew-x: 335.7; skew-y: 335.4; scale-x: 0.989; scale-y: 0.994; }
        frame 63 { x: 32.1; y: 74.3; skew-x: 336; skew-y: 335.7; scale-x: 0.988; scale-y: 0.993; }
        frame 64 { x: 34.8; y: 74.6; skew-x: 336.2; skew-y: 336; scale-x: 0.989; scale-y: -10000; }
        frame 65 { x: 37.6; y: 74.8; skew-x: 336.5; skew-y: 336.3; scale-x: 0.991; scale-y: 0.994; }
        frame 66 { x: 39.1; y: 75; skew-x: 336.4; skew-y: 336.2; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 40.6; y: 75.2; skew-x: 336.2; skew-y: 336; scale-x: 0.993; scale-y: 0.995; }
        frame 68 { x: 42.3; y: 75.3; skew-x: 335.9; skew-y: 335.9; scale-x: 0.995; scale-y: 0.996; }
        frame 69 { x: 43.7; y: 75.5; skew-x: 335.7; skew-y: 335.7; scale-x: 0.996; scale-y: 0.997; }
        frame 70 { x: 45.4; y: 75.4; skew-x: 335.5; skew-y: 335.5; scale-x: 0.999; scale-y: 0.999; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 36.6; y: 65.1; skew-x: 353.4; skew-y: 353.4; scale-x: 0.997; scale-y: 0.997; }
        frame 73 { x: 30.1; y: 56.5; skew-x: 371.1; skew-y: 371.1; scale-x: 0.996; scale-y: 0.996; }
        frame 74 { x: 28.3; y: 43.1; skew-x: 388.8; skew-y: 388.8; scale-x: 0.994; scale-y: 0.994; }
        frame 75 { x: 32.1; y: 30.9; skew-x: 406.8; skew-y: 406.8; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 35.6; y: 22.5; skew-x: 419.9; skew-y: 419.9; scale-x: 0.992; scale-y: 0.992; }
        frame 77 { x: 38.6; y: 15.3; skew-x: 432.7; skew-y: 432.7; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 44.7; y: 9.6; skew-x: 445.5; skew-y: 445.5; }
        frame 79 { x: 49.8; y: 5.2; skew-x: 458.3; skew-y: 458.3; scale-x: 0.993; scale-y: 0.993; }
        frame 80 { x: 58.9; y: -3.5; skew-x: 469.8; skew-y: 469.8; scale-x: 0.991; scale-y: 0.991; }
        frame 81 { x: 67; y: -11.9; skew-x: 481.3; skew-y: 481.3; scale-x: 0.989; scale-y: 0.989; }
        frame 82 { x: 73.8; y: -19.8; skew-x: 492.9; skew-y: 492.9; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 86.4; y: -23.6; skew-x: 504.4; skew-y: 504.4; scale-x: 0.987; scale-y: 0.987; }
        frame 84 { x: 98.4; y: -23.9; skew-x: 516; skew-y: 516; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 109.1; y: -25; skew-x: 527.6; skew-y: 527.6; scale-x: 0.989; scale-y: 0.989; }
        frame 86 { x: 102.2; y: -26.4; skew-x: 525.4; skew-y: 525.4; scale-x: 0.986; scale-y: 0.986; }
        frame 87 { x: 95.5; y: -27.8; skew-x: 523.1; skew-y: 523.1; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 82.8; y: -32.7; skew-x: 513.4; skew-y: 513.4; scale-x: 0.984; scale-y: 0.984; }
        frame 89 { x: 69.3; y: -37.9; skew-x: 503.8; skew-y: 503.8; scale-x: 0.986; scale-y: 0.986; }
        frame 90 { x: 13.8; y: -4.6; skew-x: 448; skew-y: 448; scale-x: 0.983; scale-y: 0.983; }
        frame 91 { x: -11.6; y: 35.2; skew-x: 405.8; skew-y: 405.8; scale-x: 0.981; scale-y: 0.981; }
        frame 92 { x: -26.7; y: 92.3; skew-x: 351.3; skew-y: 351.3; scale-x: 0.982; scale-y: 0.982; }
        frame 93 { x: -29; y: 94; skew-x: 347.5; skew-y: 347.5; scale-x: 0.981; scale-y: 0.981; }
        frame 94 { x: -31; y: 95.8; skew-x: 343.7; skew-y: 343.7; scale-x: 0.982; scale-y: 0.982; }
        frame 95 { x: -28.9; y: 94.1; skew-x: 347.5; skew-y: 347.5; scale-x: 0.981; scale-y: 0.981; }
        frame 96 { x: -26.7; y: 92.3; skew-x: 351.3; skew-y: 351.3; scale-x: 0.982; scale-y: 0.982; }
        frame 97 { x: -17.6; y: 88.5; skew-x: 349.5; skew-y: 349.5; scale-x: 0.983; scale-y: 0.983; }
        frame 98 { x: -8.6; y: 84.7; skew-x: 347.7; skew-y: 347.7; scale-x: 0.985; scale-y: 0.985; }
        frame 99 { x: 0.4; y: 80.8; skew-x: 345.7; skew-y: 345.7; scale-x: 0.988; scale-y: 0.988; }
        frame 100 { x: 11.7; y: 79.5; skew-x: 343.2; skew-y: 343.2; scale-x: 0.99; scale-y: 0.99; }
        frame 101 { x: 23; y: 78.1; skew-x: 340.7; skew-y: 340.7; scale-x: 0.993; scale-y: 0.993; }
        frame 102 { x: 34.3; y: 76.8; skew-x: 338.2; skew-y: 338.2; scale-x: 0.995; scale-y: 0.995; }
        frame 103 { x: 45.4; y: 75.4; skew-x: 335.5; skew-y: 335.5; scale-x: 0.999; scale-y: 0.999; }
        frame 104 { x: 44.9; y: 75.2; skew-x: 335.4; skew-y: 335.4; scale-x: 0.997; scale-y: 0.997; }
        frame 105 { x: 44.4; y: 75; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 43.7; y: 74.7; skew-x: 334.9; skew-y: 334.9; }
        frame 107 { x: 43.1; y: 74.5; skew-x: 334.7; skew-y: 334.7; scale-x: 0.996; scale-y: 0.996; }
        frame 108 { x: 42.6; y: 74.3; skew-x: 334.4; skew-y: 334.4; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: 42.1; y: 74; skew-x: 334.2; skew-y: 334.2; }
        frame 110 { x: 41.5; y: 73.8; skew-x: 333.9; skew-y: 333.9; scale-x: 0.995; scale-y: 0.995; }
        frame 111 { x: 41; y: 73.6; skew-x: 333.5; skew-y: 333.5; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 40.4; y: 73.4; skew-x: 333.2; skew-y: 333.2; scale-x: 0.996; scale-y: 0.996; }
        frame 113 { x: 39; y: -10000; skew-x: 332.7; skew-y: 332.7; scale-x: 0.994; scale-y: 0.994; }
        frame 114 { x: 37.5; y: 73.3; skew-x: 332.2; skew-y: 332.2; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 36; y: -10000; skew-x: 331.7; skew-y: 331.7; }
        frame 116 { x: 34.6; y: 73.2; skew-x: 331.1; skew-y: 331.1; }
        frame 117 { x: 33.2; y: 73.3; skew-x: 330.4; skew-y: 330.4; scale-x: 0.996; scale-y: 0.996; }
        frame 118 { x: 32.6; y: 71.2; skew-x: 335.2; skew-y: 335.2; scale-x: 0.994; scale-y: 0.994; }
        frame 119 { x: 32.2; y: 69.2; skew-x: 340; skew-y: 340; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 31.9; y: 67.2; skew-x: 344.7; skew-y: 344.7; }
        frame 121 { x: 31.8; y: 65.3; skew-x: 349.5; skew-y: 349.5; scale-x: 0.995; scale-y: 0.995; }
        frame 122 { x: 31.9; y: 65.2; skew-x: 349.7; skew-y: 349.7; scale-x: 0.994; scale-y: 0.994; }
        frame 123 { x: 31.8; y: 65.3; skew-x: 349.5; skew-y: 349.5; scale-x: 0.995; scale-y: 0.995; }
        frame 124 { x: 30.5; y: 63.4; skew-x: 351.9; skew-y: 351.9; scale-x: 0.994; scale-y: 0.994; }
        frame 125 { x: 29.2; y: 61.4; skew-x: 354.2; skew-y: 354.2; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 27.9; y: 59.5; skew-x: 356.4; skew-y: 356.4; }
        frame 127 { x: 26.7; y: 57.6; skew-x: 358.7; skew-y: 358.7; }
        frame 128 { x: 25.5; y: 56; skew-x: 360.8; skew-y: 360.8; }
        frame 129 { x: 28.7; y: 45.8; skew-x: 375.1; skew-y: 375.1; scale-x: 0.992; scale-y: 0.992; }
        frame 130 { x: 33; y: 37; skew-x: 389.6; skew-y: 389.6; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: 34.2; y: 30.4; skew-x: 399.6; skew-y: 399.6; scale-x: 0.99; scale-y: 0.99; }
        frame 132 { x: 35.4; y: 24.7; skew-x: 409.7; skew-y: 409.7; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 36.5; y: 19.8; skew-x: 419.8; skew-y: 419.8; scale-x: 0.991; scale-y: 0.991; }
        frame 134 { x: 36.1; y: 32.4; skew-x: 392.8; skew-y: 392.8; scale-x: 0.99; scale-y: 0.99; }
        frame 135 { x: 37.4; y: 51.2; skew-x: 366; skew-y: 366; scale-x: 0.993; scale-y: 0.993; }
        frame 136 { x: 40.5; y: 62.7; skew-x: 350.9; skew-y: 350.9; scale-x: 0.996; scale-y: 0.996; }
        frame 137 { x: 45.4; y: 75.4; skew-x: 335.5; skew-y: 335.5; scale-x: 0.999; scale-y: 0.999; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 47.6; y: 77.5; skew-x: 335; skew-y: 335; scale-x: 0.998; scale-y: 0.998; }
        frame 140 { x: 49.8; y: 79.6; skew-x: 334.4; skew-y: 334.4; scale-x: 0.997; scale-y: 0.997; }
        frame 141 { x: 51.9; y: 81.7; skew-x: 333.8; skew-y: 333.8; scale-x: 0.998; scale-y: 0.998; }
        frame 142 { x: 56.3; y: 86.7; skew-x: 328.7; skew-y: 328.7; scale-x: 0.997; scale-y: 0.997; }
        frame 143 { x: 61; y: 91.6; skew-x: 323.6; skew-y: 323.6; scale-x: 0.996; scale-y: 0.996; }
        frame 144 { x: 65.8; y: 96.5; skew-x: 318.5; skew-y: 318.5; scale-x: 0.998; scale-y: 0.998; }
        frame 145 { x: 66.5; y: 99.4; skew-x: 321.9; skew-y: 321.9; scale-x: 0.995; scale-y: 0.995; }
        frame 146 { x: 67.2; y: 102.3; skew-x: 325.4; skew-y: 325.4; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 67.6; y: 105.3; skew-x: 328.8; skew-y: 328.8; }
        frame 148 { x: 72.7; y: 107.7; skew-x: 319.1; skew-y: 319.1; scale-x: 0.993; scale-y: 0.993; }
        frame 149 { x: 78.6; y: 110; skew-x: 309.4; skew-y: 309.4; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 85.3; y: 112.2; skew-x: 299.7; skew-y: 299.7; scale-x: 0.994; scale-y: 0.994; }
        frame 151 { x: 80.8; y: 110.5; skew-x: 296.8; skew-y: 296.8; scale-x: 0.992; scale-y: 0.992; }
        frame 152 { x: 76.3; y: 108.8; skew-x: 293.8; skew-y: 293.8; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 71.8; y: 107.3; skew-x: 290.9; skew-y: 290.9; }
        frame 154 { x: 75.6; y: 99.8; skew-x: 280.6; skew-y: 280.6; scale-x: 0.991; scale-y: 0.991; }
        frame 155 { x: 80.1; y: 91.7; skew-x: 270.3; skew-y: 270.3; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 85.1; y: 82.8; skew-x: 260.2; skew-y: 260.2; }
        frame 157 { x: 67.5; y: 86.1; skew-x: 275; skew-y: 275; scale-x: 0.989; scale-y: 0.989; }
        frame 158 { x: 51.5; y: 87.9; skew-x: 289.8; skew-y: 289.8; scale-x: 0.987; scale-y: 0.987; }
        frame 159 { x: 37.3; y: 88.9; skew-x: 304.8; skew-y: 304.8; scale-x: -10000; scale-y: -10000; }
        frame 160 { x: 30.1; y: 85.7; skew-x: 312.1; skew-y: 312.1; scale-x: 0.985; scale-y: 0.985; }
        frame 161 { x: 23.5; y: 82.5; skew-x: 319.4; skew-y: 319.4; scale-x: 0.984; scale-y: 0.984; }
        frame 162 { x: 17.3; y: 79.2; skew-x: 326.8; skew-y: 326.8; scale-x: 0.985; scale-y: 0.985; }
        frame 163 { x: 10.8; y: 70.6; skew-x: 338.5; skew-y: 338.5; scale-x: 0.983; scale-y: 0.983; }
        frame 164 { x: 5.5; y: 62.3; skew-x: 350.2; skew-y: 350.2; scale-x: -10000; scale-y: -10000; }
        frame 165 { x: 1.2; y: 54.8; skew-x: 361.6; skew-y: 361.6; scale-x: 0.982; scale-y: 0.982; }
        frame 166 { x: -1.9; y: 48.1; skew-x: 373.3; skew-y: 373.3; scale-x: 0.981; scale-y: 0.981; }
        frame 167 { x: -4.4; y: 42.5; skew-x: 385; skew-y: 385; scale-x: 0.98; scale-y: 0.98; }
        frame 168 { x: 3.6; y: 47.8; skew-x: 375.5; skew-y: 375.5; scale-x: 0.981; scale-y: 0.981; }
        frame 169 { x: 12.2; y: 53.8; skew-x: 366; skew-y: 366; scale-x: 0.983; scale-y: 0.983; }
        frame 170 { x: 21.4; y: 60.4; skew-x: 356.7; skew-y: 356.7; scale-x: 0.985; scale-y: 0.985; }
        frame 171 { x: 30.9; y: 70.2; skew-x: 347.2; skew-y: 347.2; scale-x: 0.986; scale-y: 0.986; }
        frame 172 { x: 41.1; y: 80.5; skew-x: 337.7; skew-y: 337.7; scale-x: 0.987; scale-y: 0.987; }
        frame 173 { x: 52; y: 91.1; skew-x: 328.2; skew-y: 328.2; scale-x: 0.99; scale-y: 0.99; }
        frame 174 { x: 58.6; y: 95.1; skew-x: 325.7; skew-y: 325.7; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 65.2; y: 99.2; skew-x: 323.1; skew-y: 323.1; scale-x: 0.992; scale-y: 0.992; }
        frame 176 { x: 71.9; y: 103.2; skew-x: 320.5; skew-y: 320.5; scale-x: 0.996; scale-y: 0.996; }
        frame 177 { x: 78.2; y: 107.7; skew-x: 310.1; skew-y: 310.1; scale-x: 0.993; scale-y: 0.993; }
        frame 178 { x: 85.3; y: 112.2; skew-x: 299.7; skew-y: 299.7; scale-x: 0.994; scale-y: 0.994; }
        frame 179 { x: 80.8; y: 110.5; skew-x: 296.8; skew-y: 296.8; scale-x: 0.992; scale-y: 0.992; }
        frame 180 { x: 76.3; y: 108.8; skew-x: 293.8; skew-y: 293.8; scale-x: -10000; scale-y: -10000; }
        frame 181 { x: 71.8; y: 107.3; skew-x: 290.9; skew-y: 290.9; }
        frame 182 { x: 74.1; y: 95.9; skew-x: 278.3; skew-y: 278.3; scale-x: 0.991; scale-y: 0.991; }
        frame 183 { x: 77.3; y: 83.5; skew-x: 266; skew-y: 266; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: 81.6; y: 70; skew-x: 253.5; skew-y: 253.5; scale-x: 0.99; scale-y: 0.99; }
        frame 185 { x: 68.8; y: 73.2; skew-x: 250.9; skew-y: 250.9; scale-x: 0.988; scale-y: 0.988; }
        frame 186 { x: 56.1; y: 76.3; skew-x: 248.2; skew-y: 248.2; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 42.3; y: 70.6; skew-x: 228.1; skew-y: 228.1; scale-x: 0.986; scale-y: 0.986; }
        frame 188 { x: 28.4; y: 61.3; skew-x: 208.1; skew-y: 208.1; scale-x: 0.987; scale-y: 0.987; }
        frame 189 { x: -7.7; y: 113; skew-x: 251.2; skew-y: 249.7; scale-x: 0.983; scale-y: 0.982; }
        frame 190 { x: -38.1; y: 149.3; skew-x: 294.4; skew-y: 291.3; scale-x: 0.982; scale-y: 0.98; }
        frame 191 { x: -38.6; y: 149.7; skew-x: 294.3; skew-y: 289.8; scale-x: 0.956; scale-y: 1.011; }
        frame 192 { x: -39.2; y: 150; skew-x: 294.4; skew-y: 288.5; scale-x: 0.932; scale-y: 1.043; }
        frame 193 { x: -40.5; y: 141.9; skew-x: 302.8; skew-y: 296.8; scale-x: 0.939; scale-y: 1.018; }
        frame 194 { x: -41.4; y: 133.8; skew-x: 311.1; skew-y: 305; scale-x: 0.949; scale-y: 0.996; }
        frame 195 { x: -40.5; y: 142; skew-x: 302.8; skew-y: 296.8; scale-x: 0.939; scale-y: 1.018; }
        frame 196 { x: -39.2; y: 150; skew-x: 294.4; skew-y: 288.5; scale-x: 0.932; scale-y: 1.043; }
    }
    Track {
        source-name: "Zombie_gargantuar_innerarm_thumb";
        frame-count: 197;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 117 { x: 4.2; y: -11.4; skew-x: -121.1; skew-y: -121.1; scale-x: 0.995; scale-y: 0.995; cel: 0; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_INNERARM_THUMB; }
        frame 118 { x: 6.7; y: -11.5; skew-x: -121; skew-y: -121; scale-x: 0.993; scale-y: 0.993; cel: -10000; image: none; }
        frame 119 { x: 9.3; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 11.9; scale-x: 0.994; scale-y: 0.994; }
        frame 121 { x: 16.2; y: -11.4; skew-x: -121.1; skew-y: -121.1; scale-x: 0.995; scale-y: 0.995; }
        frame 122 { x: 15.2; y: -10; skew-x: -119.5; skew-y: -119.5; scale-x: 0.994; scale-y: 0.994; }
        frame 123 { x: 14.1; y: -8.6; skew-x: -117.8; skew-y: -117.8; scale-x: 0.995; scale-y: 0.995; }
        frame 124 { x: 11; y: -10.6; skew-x: -133; skew-y: -133; scale-x: 0.993; scale-y: 0.993; }
        frame 125 { x: 8.1; y: -14.7; skew-x: -148.3; skew-y: -148.3; scale-x: 0.992; scale-y: 0.992; }
        frame 126 { x: 4.4; y: -20.9; skew-x: -163.8; skew-y: -163.8; scale-x: 0.991; scale-y: 0.991; }
        frame 127 { x: -0.1; y: -28.7; skew-x: -179.1; skew-y: -179.1; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -6.4; y: -38; skew-x: -194.2; skew-y: -194.2; scale-x: 0.99; scale-y: 0.99; }
        frame 129 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; alpha: 0; }
        frame 130 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 131 { cel: -10000; }
    }
}
