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
        frame 0 { x: 59.725449; y: -7.73200988; skew-x: -67.232938; skew-y: -67.2164111; scale-x: 0.998439959; scale-y: 0.998757396; cel: -1; alpha: 1; }
        frame 1 { x: 59.8986212; y: -7.733494; skew-x: -67.361412; skew-y: -67.3139891; scale-x: 0.998304834; scale-y: 0.997592001; cel: -1; alpha: 1; }
        frame 2 { x: 59.9233336; y: -7.68950404; skew-x: -67.2740367; skew-y: -67.3255919; scale-x: 0.998506942; scale-y: 0.99817979; cel: -1; alpha: 1; }
        frame 3 { x: 60.1244905; y: -7.63183846; skew-x: -67.2937561; skew-y: -67.3312233; scale-x: 0.998405595; scale-y: 0.998015889; cel: -1; alpha: 1; }
        frame 4 { x: 60.0573224; y: -7.69852184; skew-x: -67.2135902; skew-y: -67.2368835; scale-x: 0.998298047; scale-y: 0.997855088; cel: -1; alpha: 1; }
        frame 5 { x: 60.2583941; y: -7.74763952; skew-x: -67.2335328; skew-y: -67.2425768; scale-x: 0.998184291; scale-y: 0.99769738; cel: -1; alpha: 1; }
        frame 6 { x: 60.5294878; y: -7.68758073; skew-x: -67.3535779; skew-y: -67.3483077; scale-x: 0.99806432; scale-y: 0.997542754; cel: -1; alpha: 1; }
        frame 7 { x: 60.6313857; y: -7.64911732; skew-x: -67.3600849; skew-y: -67.3631886; scale-x: 0.997977156; scale-y: 0.998355566; cel: -1; alpha: 1; }
        frame 8 { x: 60.8337856; y: -7.71196871; skew-x: -67.3712996; skew-y: -67.1775925; scale-x: 0.996976803; scale-y: 0.998755571; cel: -1; alpha: 1; }
        frame 9 { x: 60.8661599; y: -7.69165378; skew-x: -67.2992098; skew-y: -67.2751458; scale-x: 0.99771182; scale-y: 0.998049557; cel: -1; alpha: 1; }
        frame 10 { x: 60.7949175; y: -7.7260594; skew-x: -67.2189957; skew-y: -67.1811442; scale-x: 0.998569155; scale-y: 0.998895265; cel: -1; alpha: 1; }
        frame 11 { x: 60.6596573; y: -7.76775806; skew-x: -67.2348667; skew-y: -67.252478; scale-x: 0.997937794; scale-y: 0.997620756; cel: -1; alpha: 1; }
        frame 12 { x: 60.5224929; y: -7.66873509; skew-x: -67.2502541; skew-y: -67.3241832; scale-x: 0.998279259; scale-y: 0.997343715; cel: -1; alpha: 1; }
        frame 13 { x: 60.5556079; y: -7.75937914; skew-x: -67.3570925; skew-y: -67.3042306; scale-x: 0.997757739; scale-y: 0.997625684; cel: -1; alpha: 1; }
        frame 14 { x: 60.417946; y: -7.76404839; skew-x: -67.3549812; skew-y: -67.2889133; scale-x: 0.997727504; scale-y: 0.998589471; cel: -1; alpha: 1; }
        frame 15 { x: 60.2800863; y: -7.66971847; skew-x: -67.3700891; skew-y: -67.360868; scale-x: 0.998049856; scale-y: 0.9983193; cel: -1; alpha: 1; }
        frame 16 { x: 60.1731829; y: -7.79401762; skew-x: -67.2846517; skew-y: -67.3332163; scale-x: 0.998345582; scale-y: 0.998052642; cel: -1; alpha: 1; }
        frame 17 { x: 60.0372938; y: -7.80981833; skew-x: -67.2957209; skew-y: -67.3088679; scale-x: 0.998279691; scale-y: 0.998049795; cel: -1; alpha: 1; }
        frame 18 { x: 59.8344121; y: -7.75264856; skew-x: -67.2067428; skew-y: -67.184399; scale-x: 0.998229026; scale-y: 0.998041993; cel: -1; alpha: 1; }
        frame 19 { x: 59.7958834; y: -7.75967648; skew-x: -67.2226598; skew-y: -67.3549058; scale-x: 0.998779474; scale-y: 0.997528868; cel: -1; alpha: 1; }
        frame 20 { x: 59.6415549; y: -7.80955; skew-x: -67.321864; skew-y: -67.3409372; scale-x: 0.997467303; scale-y: 0.997746069; cel: -1; alpha: 1; }
        frame 21 { x: 59.725449; y: -7.73200988; skew-x: -67.232938; skew-y: -67.2164111; scale-x: 0.998439959; scale-y: 0.998757396; cel: -1; alpha: 1; }
        frame 22 { x: 60.1343809; y: -7.76431267; skew-x: -67.2033347; skew-y: -67.2033349; scale-x: 0.998740584; scale-y: 0.998740561; cel: -1; alpha: 1; }
        frame 23 { x: 59.7889326; y: -7.42009721; skew-x: -67.3571361; skew-y: -67.194707; scale-x: 0.997955627; scale-y: 0.99764605; cel: -1; alpha: 1; }
        frame 24 { x: 59.1135012; y: -7.4235212; skew-x: -67.2119971; skew-y: -67.1841338; scale-x: 0.997234164; scale-y: 0.997548689; cel: -1; alpha: 1; }
        frame 25 { x: 58.4943558; y: -7.39778983; skew-x: -67.1675366; skew-y: -67.273885; scale-x: 0.997175861; scale-y: 0.997835965; cel: -1; alpha: 1; }
        frame 26 { x: 58.0220113; y: -7.3501891; skew-x: -67.2294354; skew-y: -67.2551771; scale-x: 0.996531872; scale-y: 0.997609968; cel: -1; alpha: 1; }
        frame 27 { x: 57.4986728; y: -7.40660978; skew-x: -67.1626712; skew-y: -67.1706158; scale-x: 0.998906222; scale-y: 0.998341797; cel: -1; alpha: 1; }
        frame 28 { x: 57.424178; y: -7.49578604; skew-x: -67.1996701; skew-y: -67.1547983; scale-x: 0.997221318; scale-y: 0.996820686; cel: -1; alpha: 1; }
        frame 29 { x: 57.2670633; y: -7.60106182; skew-x: -67.2204304; skew-y: -67.158027; scale-x: 0.997464549; scale-y: 0.996383608; cel: -1; alpha: 1; }
        frame 30 { x: 57.0299592; y: -7.69019927; skew-x: -67.1514219; skew-y: -67.1506632; scale-x: 0.997185605; scale-y: 0.99651993; cel: -1; alpha: 1; }
        frame 31 { x: 56.9593045; y: -7.74141731; skew-x: -67.2769863; skew-y: -67.1474902; scale-x: 0.99812483; scale-y: 0.996394781; cel: -1; alpha: 1; }
        frame 32 { x: 56.5494108; y: -7.80370968; skew-x: -67.2425573; skew-y: -67.2054794; scale-x: 0.998379673; scale-y: 0.999060131; cel: -1; alpha: 1; }
        frame 33 { x: 56.9981217; y: -7.64229004; skew-x: -67.2120015; skew-y: -67.1584472; scale-x: 0.997631982; scale-y: 0.997056101; cel: -1; alpha: 1; }
        frame 34 { x: 56.9569682; y: -7.45014471; skew-x: -67.2128351; skew-y: -67.1787872; scale-x: 0.998493936; scale-y: 0.998612358; cel: -1; alpha: 1; }
        frame 35 { x: 59.3924883; y: -7.72108233; skew-x: -67.2858706; skew-y: -67.2241513; scale-x: 0.997062228; scale-y: 0.997297019; cel: -1; alpha: 1; }
        frame 36 { x: 61.6100178; y: -8.93064198; skew-x: -67.1636863; skew-y: -67.1636902; scale-x: 0.998869133; scale-y: 0.99886919; cel: -1; alpha: 1; }
        frame 37 { x: 61.8711175; y: -8.73802633; skew-x: -67.1743571; skew-y: -67.2192786; scale-x: 0.99855687; scale-y: 0.997910865; cel: -1; alpha: 1; }
        frame 38 { x: 62.0677775; y: -8.72106622; skew-x: -67.0858565; skew-y: -67.1740205; scale-x: 0.999314554; scale-y: 0.997977622; cel: -1; alpha: 1; }
        frame 39 { x: 61.9723661; y: -8.38725376; skew-x: -67.2655563; skew-y: -67.2688659; scale-x: 0.998502656; scale-y: 0.998449247; cel: -1; alpha: 1; }
        frame 40 { x: 61.7891222; y: -8.03688727; skew-x: -67.2584982; skew-y: -67.2504633; scale-x: 0.998378995; scale-y: 0.998392782; cel: -1; alpha: 1; }
        frame 41 { x: 61.5578593; y: -7.88608509; skew-x: -67.2517479; skew-y: -67.2316826; scale-x: 0.99828243; scale-y: 0.99831489; cel: -1; alpha: 1; }
        frame 42 { x: 61.5157609; y: -7.55909623; skew-x: -67.370665; skew-y: -67.3087295; scale-x: 0.998224791; scale-y: 0.99773424; cel: -1; alpha: 1; }
        frame 43 { x: 61.2854413; y: -7.24918197; skew-x: -67.380492; skew-y: -67.3918323; scale-x: 0.998518996; scale-y: 0.997910308; cel: -1; alpha: 1; }
        frame 44 { x: 61.0827382; y: -7.02368247; skew-x: -67.2886104; skew-y: -67.2763133; scale-x: 0.997488932; scale-y: 0.997296603; cel: -1; alpha: 1; }
        frame 45 { x: 60.8242745; y: -6.84467679; skew-x: -67.2976485; skew-y: -67.2595557; scale-x: 0.997476487; scale-y: 0.997658584; cel: -1; alpha: 1; }
        frame 46 { x: 60.7476192; y: -6.65660139; skew-x: -67.2078807; skew-y: -67.241301; scale-x: 0.998698968; scale-y: 0.99894627; cel: -1; alpha: 1; }
        frame 47 { x: 60.3201061; y: -6.76118264; skew-x: -67.2512239; skew-y: -67.3109322; scale-x: 0.997930313; scale-y: 0.997136796; cel: -1; alpha: 1; }
        frame 48 { x: 59.8548621; y: -6.9243324; skew-x: -67.2883866; skew-y: -67.2772011; scale-x: 0.997130921; scale-y: 0.99722597; cel: -1; alpha: 1; }
        frame 49 { x: 59.3473523; y: -7.0754457; skew-x: -67.3260223; skew-y: -67.2474883; scale-x: 0.997520724; scale-y: 0.99716633; cel: -1; alpha: 1; }
        frame 50 { x: 58.8572336; y: -7.47017677; skew-x: -67.1671233; skew-y: -67.2141359; scale-x: 0.997476847; scale-y: 0.997704326; cel: -1; alpha: 1; }
        frame 51 { x: 57.9856388; y: -7.66604391; skew-x: -67.2008647; skew-y: -67.1879511; scale-x: 0.998962895; scale-y: 0.998581993; cel: -1; alpha: 1; }
        frame 52 { x: 57.4449634; y: -7.39048587; skew-x: -67.2495567; skew-y: -67.322072; scale-x: 0.996618435; scale-y: 0.997123173; cel: -1; alpha: 1; }
        frame 53 { x: 56.8339872; y: -7.39562918; skew-x: -67.2613833; skew-y: -67.19396; scale-x: 0.997759249; scale-y: 0.995769885; cel: -1; alpha: 1; }
        frame 54 { x: 55.8821685; y: -7.29089519; skew-x: -67.171032; skew-y: -67.2599002; scale-x: 0.996396784; scale-y: 0.998954372; cel: -1; alpha: 1; }
        frame 55 { x: 55.2673091; y: -7.3055703; skew-x: -67.1681298; skew-y: -67.1457982; scale-x: 0.997681425; scale-y: 0.997204818; cel: -1; alpha: 1; }
        frame 56 { x: 54.3594628; y: -7.31466936; skew-x: -67.2034523; skew-y: -67.1947508; scale-x: 0.998799251; scale-y: 0.998144499; cel: -1; alpha: 1; }
        frame 57 { x: 56.0323566; y: -7.39695346; skew-x: -67.2711464; skew-y: -67.2030097; scale-x: 0.997100389; scale-y: 0.996233416; cel: -1; alpha: 1; }
        frame 58 { x: 57.2943689; y: -7.40610202; skew-x: -67.2368523; skew-y: -67.2228552; scale-x: 0.998635757; scale-y: 0.998325225; cel: -1; alpha: 1; }
        frame 59 { x: 59.2653094; y: -7.33749651; skew-x: -67.2530808; skew-y: -67.22629; scale-x: 0.997207543; scale-y: 0.997339628; cel: -1; alpha: 1; }
        frame 60 { x: 61.4611147; y: -8.03610068; skew-x: -67.1813768; skew-y: -67.2231673; scale-x: 0.999239922; scale-y: 0.998088674; cel: -1; alpha: 1; }
        frame 61 { x: 61.4682609; y: -7.7698637; skew-x: -67.3898864; skew-y: -67.3284487; scale-x: 0.998007351; scale-y: 0.997740975; cel: -1; alpha: 1; }
        frame 62 { x: 61.4406162; y: -7.55008425; skew-x: -67.1914997; skew-y: -67.2293442; scale-x: 0.998956703; scale-y: 0.998725777; cel: -1; alpha: 1; }
        frame 63 { x: 61.3247157; y: -7.3207353; skew-x: -67.2139478; skew-y: -67.3066483; scale-x: 0.998943162; scale-y: 0.998034777; cel: -1; alpha: 1; }
        frame 64 { x: 61.2776829; y: -7.1866018; skew-x: -67.232677; skew-y: -67.288202; scale-x: 0.998363027; scale-y: 0.997508622; cel: -1; alpha: 1; }
        frame 65 { x: 61.0933894; y: -6.92570088; skew-x: -67.2358856; skew-y: -67.1706973; scale-x: 0.99829972; scale-y: 0.998878458; cel: -1; alpha: 1; }
        frame 66 { x: 60.9229222; y: -7.18164866; skew-x: -67.3638119; skew-y: -67.395721; scale-x: 0.99825959; scale-y: 0.997276657; cel: -1; alpha: 1; }
        frame 67 { x: 60.6614631; y: -7.15798784; skew-x: -67.3747344; skew-y: -67.3221386; scale-x: 0.998334853; scale-y: 0.997676653; cel: -1; alpha: 1; }
        frame 68 { x: 60.5273742; y: -7.42034506; skew-x: -67.2775406; skew-y: -67.3498649; scale-x: 0.998109284; scale-y: 0.997940939; cel: -1; alpha: 1; }
        frame 69 { x: 60.2496569; y: -7.33983168; skew-x: -67.3961965; skew-y: -67.2741961; scale-x: 0.998081389; scale-y: 0.997507022; cel: -1; alpha: 1; }
        frame 70 { x: 60.1343809; y: -7.76431267; skew-x: -67.2033347; skew-y: -67.2033349; scale-x: 0.998740584; scale-y: 0.998740561; cel: -1; alpha: 1; }
        frame 71 { x: 60.0813263; y: -7.76431771; skew-x: -67.2033347; skew-y: -67.2033349; scale-x: 0.998740584; scale-y: 0.998740561; cel: -1; alpha: 1; }
        frame 72 { x: 59.1249986; y: -7.64490211; skew-x: -67.2308655; skew-y: -67.2308663; scale-x: 0.997034269; scale-y: 0.997034252; cel: -1; alpha: 1; }
        frame 73 { x: 58.1186434; y: -7.45417725; skew-x: -67.2583965; skew-y: -67.2583976; scale-x: 0.997327607; scale-y: 0.997327597; cel: -1; alpha: 1; }
        frame 74 { x: 57.1709985; y: -7.46037445; skew-x: -67.1859276; skew-y: -67.1859287; scale-x: 0.997621118; scale-y: 0.997621115; cel: -1; alpha: 1; }
        frame 75 { x: 56.2696779; y: -7.45069162; skew-x: -67.2134588; skew-y: -67.2134598; scale-x: 0.996913884; scale-y: 0.996913887; cel: -1; alpha: 1; }
        frame 76 { x: 55.3340976; y: -7.74704248; skew-x: -67.1409901; skew-y: -67.1409908; scale-x: 0.997207448; scale-y: 0.997207454; cel: -1; alpha: 1; }
        frame 77 { x: 54.353712; y: -7.75372624; skew-x: -67.2685215; skew-y: -67.2685217; scale-x: 0.997501186; scale-y: 0.997501192; cel: -1; alpha: 1; }
        frame 78 { x: 53.5535122; y: -8.29397012; skew-x: -67.0960529; skew-y: -67.0960525; scale-x: 0.996793296; scale-y: 0.996793299; cel: -1; alpha: 1; }
        frame 79 { x: 52.5072191; y: -8.51969876; skew-x: -67.2235843; skew-y: -67.2235834; scale-x: 0.999091284; scale-y: 0.999091279; cel: -1; alpha: 1; }
        frame 80 { x: 52.3104745; y: -8.86649084; skew-x: -67.0804713; skew-y: -67.0804715; scale-x: 0.997277956; scale-y: 0.997277939; cel: -1; alpha: 1; }
        frame 81 { x: 51.8894591; y: -8.87658343; skew-x: -67.1373582; skew-y: -67.1373597; scale-x: 0.997468894; scale-y: 0.997468869; cel: -1; alpha: 1; }
        frame 82 { x: 51.4891403; y: -8.7775523; skew-x: -67.1942452; skew-y: -67.1942479; scale-x: 0.997659903; scale-y: 0.997659874; cel: -1; alpha: 1; }
        frame 83 { x: 51.2276791; y: -9.04639814; skew-x: -67.1511321; skew-y: -67.1511361; scale-x: 0.997850982; scale-y: 0.997850955; cel: -1; alpha: 1; }
        frame 84 { x: 50.7927683; y: -9.32941766; skew-x: -67.2080191; skew-y: -67.2080242; scale-x: 0.998042133; scale-y: 0.998042111; cel: -1; alpha: 1; }
        frame 85 { x: 50.6239582; y: -9.58786983; skew-x: -67.164906; skew-y: -67.1649124; scale-x: 0.998233355; scale-y: 0.998233343; cel: -1; alpha: 1; }
        frame 86 { x: 51.3441086; y: -9.34615408; skew-x: -67.1328203; skew-y: -67.132824; scale-x: 0.997580178; scale-y: 0.99758015; cel: -1; alpha: 1; }
        frame 87 { x: 51.8519198; y: -9.19497919; skew-x: -67.2007289; skew-y: -67.2007297; scale-x: 0.998937171; scale-y: 0.99893715; cel: -1; alpha: 1; }
        frame 88 { x: 53.7539639; y: -8.16390631; skew-x: -67.2449665; skew-y: -67.2449666; scale-x: 0.997601509; scale-y: 0.99760151; cel: -1; alpha: 1; }
        frame 89 { x: 55.4484845; y: -7.86755487; skew-x: -67.1892038; skew-y: -67.1892038; scale-x: 0.998277356; scale-y: 0.998277382; cel: -1; alpha: 1; }
        frame 90 { x: 60.7226402; y: -8.58880982; skew-x: -67.2575098; skew-y: -67.2575112; scale-x: 0.999082802; scale-y: 0.999082864; cel: -1; alpha: 1; }
        frame 91 { x: 63.4760585; y: -10.6878118; skew-x: -67.1393246; skew-y: -67.1393264; scale-x: 0.998312856; scale-y: 0.998312929; cel: -1; alpha: 1; }
        frame 92 { x: 63.4772556; y: -10.6608621; skew-x: -67.1393167; skew-y: -67.1393185; scale-x: 0.998312857; scale-y: 0.998312929; cel: -1; alpha: 1; }
        frame 93 { x: 63.4783733; y: -10.5696164; skew-x: -67.1393167; skew-y: -67.1393185; scale-x: 0.998312857; scale-y: 0.998312929; cel: -1; alpha: 1; }
        frame 94 { x: 63.4794748; y: -10.4783658; skew-x: -67.1393167; skew-y: -67.1393185; scale-x: 0.998312857; scale-y: 0.998312929; cel: -1; alpha: 1; }
        frame 95 { x: 63.4786181; y: -10.7715617; skew-x: -67.1393167; skew-y: -67.1393185; scale-x: 0.998312857; scale-y: 0.998312929; cel: -1; alpha: 1; }
        frame 96 { x: 63.4772717; y: -10.6608691; skew-x: -67.1393167; skew-y: -67.1393185; scale-x: 0.998312857; scale-y: 0.998312929; cel: -1; alpha: 1; }
        frame 97 { x: 63.0916882; y: -10.1050786; skew-x: -67.077029; skew-y: -67.0770302; scale-x: 0.998086655; scale-y: 0.998086719; cel: -1; alpha: 1; }
        frame 98 { x: 62.6202373; y: -9.59734435; skew-x: -67.1147469; skew-y: -67.1147474; scale-x: 0.998866919; scale-y: 0.998866972; cel: -1; alpha: 1; }
        frame 99 { x: 62.1878634; y: -9.181404; skew-x: -67.0524646; skew-y: -67.0524647; scale-x: 0.998640593; scale-y: 0.998640633; cel: -1; alpha: 1; }
        frame 100 { x: 61.6469968; y: -8.79716064; skew-x: -67.3901823; skew-y: -67.3901821; scale-x: 0.998414824; scale-y: 0.998414849; cel: -1; alpha: 1; }
        frame 101 { x: 61.2270241; y: -8.52045385; skew-x: -67.3278998; skew-y: -67.3278996; scale-x: 0.998189612; scale-y: 0.998189621; cel: -1; alpha: 1; }
        frame 102 { x: 60.641693; y: -8.10115357; skew-x: -67.3656173; skew-y: -67.3656172; scale-x: 0.997964952; scale-y: 0.997964945; cel: -1; alpha: 1; }
        frame 103 { x: 60.0813263; y: -7.76431771; skew-x: -67.2033347; skew-y: -67.2033349; scale-x: 0.998740584; scale-y: 0.998740561; cel: -1; alpha: 1; }
        frame 104 { x: 60.0813263; y: -7.76431771; skew-x: -67.2033347; skew-y: -67.2033349; scale-x: 0.998740584; scale-y: 0.998740561; cel: -1; alpha: 1; }
        frame 105 { x: 60.3747144; y: -7.77896961; skew-x: -67.2456812; skew-y: -67.2456813; scale-x: 0.997405738; scale-y: 0.997405724; cel: -1; alpha: 1; }
        frame 106 { x: 60.4457112; y: -7.96572276; skew-x: -67.1880277; skew-y: -67.1880278; scale-x: 0.99807126; scale-y: 0.998071254; cel: -1; alpha: 1; }
        frame 107 { x: 60.8604678; y: -7.95038831; skew-x: -67.3303741; skew-y: -67.3303742; scale-x: 0.997735928; scale-y: 0.99773593; cel: -1; alpha: 1; }
        frame 108 { x: 61.1081801; y: -7.97110632; skew-x: -67.2727206; skew-y: -67.2727207; scale-x: 0.998402559; scale-y: 0.998402571; cel: -1; alpha: 1; }
        frame 109 { x: 61.3256822; y: -8.12309165; skew-x: -67.315067; skew-y: -67.3150672; scale-x: 0.998067; scale-y: 0.99806702; cel: -1; alpha: 1; }
        frame 110 { x: 61.45919; y: -8.31261; skew-x: -67.2574134; skew-y: -67.2574137; scale-x: 0.997730992; scale-y: 0.99773102; cel: -1; alpha: 1; }
        frame 111 { x: 61.8041052; y: -8.24447573; skew-x: -67.3997598; skew-y: -67.3997603; scale-x: 0.99839896; scale-y: 0.998398995; cel: -1; alpha: 1; }
        frame 112 { x: 61.8323232; y: -8.63806911; skew-x: -67.2421054; skew-y: -67.2421061; scale-x: 0.999067822; scale-y: 0.999067865; cel: -1; alpha: 1; }
        frame 113 { x: 62.1976121; y: -8.86989095; skew-x: -67.1667664; skew-y: -67.1667673; scale-x: 0.998246671; scale-y: 0.99824672; cel: -1; alpha: 1; }
        frame 114 { x: 62.5285346; y: -9.20524815; skew-x: -66.9914274; skew-y: -66.9914285; scale-x: 0.998430685; scale-y: 0.998430741; cel: -1; alpha: 1; }
        frame 115 { x: 63.0254368; y: -9.39782321; skew-x: -67.0160883; skew-y: -67.0160897; scale-x: 0.998614768; scale-y: 0.99861483; cel: -1; alpha: 1; }
        frame 116 { x: 63.5148692; y: -9.67459288; skew-x: -67.1407492; skew-y: -67.1407509; scale-x: 0.998798919; scale-y: 0.998798986; cel: -1; alpha: 1; }
        frame 117 { x: 63.8051059; y: -9.95821187; skew-x: -67.0654076; skew-y: -67.0654096; scale-x: 0.998983138; scale-y: 0.99898321; cel: -1; alpha: 1; }
        frame 118 { x: 63.0519055; y: -10.8133127; skew-x: -62.8810434; skew-y: -62.8810462; scale-x: 0.998142043; scale-y: 0.998142121; cel: -1; alpha: 1; }
        frame 119 { x: 62.1490571; y: -10.9168922; skew-x: -58.5966792; skew-y: -58.5966828; scale-x: 0.99830703; scale-y: 0.998307109; cel: -1; alpha: 1; }
        frame 120 { x: 59.9081446; y: -9.98531681; skew-x: -54.4123149; skew-y: -54.4123194; scale-x: 0.997465549; scale-y: 0.997465626; cel: -1; alpha: 1; }
        frame 121 { x: 57.2186867; y: -8.62989109; skew-x: -50.3279544; skew-y: -50.3279597; scale-x: 0.998637172; scale-y: 0.998637245; cel: -1; alpha: 1; }
        frame 122 { x: 57.055806; y: -8.64670887; skew-x: -50.1279544; skew-y: -50.1279597; scale-x: 0.997630482; scale-y: 0.997630554; cel: -1; alpha: 1; }
        frame 123 { x: 57.2186842; y: -8.62987889; skew-x: -50.3279249; skew-y: -50.3279301; scale-x: 0.998637173; scale-y: 0.998637246; cel: -1; alpha: 1; }
        frame 124 { x: 47.8163924; y: -7.85037942; skew-x: -40.6639637; skew-y: -40.6639703; scale-x: 0.997347865; scale-y: 0.997347912; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_INNERLEG_FOOT; }
        frame 125 { x: 39.65737; y: -16.6139457; skew-x: -48.7703542; skew-y: -48.7703608; scale-x: 0.996676363; scale-y: 0.996676409; cel: 0; alpha: 1; }
        frame 126 { x: 31.0467367; y: -26.0802369; skew-x: -57.0767447; skew-y: -57.0767514; scale-x: 0.99600467; scale-y: 0.996004715; cel: 0; alpha: 1; }
        frame 127 { x: 21.7055063; y: -34.6268416; skew-x: -65.1831353; skew-y: -65.1831419; scale-x: 0.996341228; scale-y: 0.996341271; cel: 0; alpha: 1; }
        frame 128 { x: 13.1303606; y: -42.0258357; skew-x: -73.389531; skew-y: -73.3895376; scale-x: 0.996678276; scale-y: 0.996678318; cel: 0; alpha: 1; }
        frame 129 { x: -43.2846557; y: -44.7317619; skew-x: -75.2890987; skew-y: -75.2891049; scale-x: 0.995687996; scale-y: 0.995688063; cel: 0; alpha: 1; }
        frame 130 { x: -99.8059733; y: -47.3447904; skew-x: -77.1886642; skew-y: -77.1886697; scale-x: 0.996715336; scale-y: 0.996715427; cel: 0; alpha: 1; }
        frame 131 { x: -99.8059733; y: -47.3447904; skew-x: -77.1886642; skew-y: -77.1886697; scale-x: 0.996715336; scale-y: 0.996715427; cel: -1; alpha: 1; }
        frame 132 { x: -99.8059733; y: -47.3447904; skew-x: -77.1886642; skew-y: -77.1886697; scale-x: 0.996715336; scale-y: 0.996715427; cel: -1; alpha: 1; }
        frame 133 { x: -99.8059733; y: -47.3447904; skew-x: -77.1886642; skew-y: -77.1886697; scale-x: 0.996715336; scale-y: 0.996715427; cel: -1; alpha: 1; }
        frame 134 { x: -99.8059733; y: -47.3447904; skew-x: -77.1886642; skew-y: -77.1886697; scale-x: 0.996715336; scale-y: 0.996715427; cel: -1; alpha: 1; }
        frame 135 { x: -99.8059733; y: -47.3447904; skew-x: -77.1886642; skew-y: -77.1886697; scale-x: 0.996715336; scale-y: 0.996715427; cel: -1; alpha: 1; }
        frame 136 { x: -99.8059733; y: -47.3447904; skew-x: -77.1886642; skew-y: -77.1886697; scale-x: 0.996715336; scale-y: 0.996715427; cel: -1; alpha: 1; }
        frame 137 { x: -99.8059733; y: -47.3447904; skew-x: -77.1886642; skew-y: -77.1886697; scale-x: 0.996715336; scale-y: 0.996715427; cel: -1; alpha: 1; }
        frame 138 { x: 58.8348332; y: -4.40436673; skew-x: -71.3109236; skew-y: -70.6934086; scale-x: 0.997076505; scale-y: 0.973371721; cel: -1; alpha: 1; }
        frame 139 { x: 57.975145; y: -7.01515871; skew-x: -69.8751764; skew-y: -69.5413003; scale-x: 0.996730726; scale-y: 0.979193316; cel: -1; alpha: 1; }
        frame 140 { x: 57.2501917; y: -9.85378475; skew-x: -68.3450266; skew-y: -68.1817177; scale-x: 0.997205489; scale-y: 0.986286494; cel: -1; alpha: 1; }
        frame 141 { x: 57.0645671; y: -12.9764072; skew-x: -66.9210177; skew-y: -66.8140556; scale-x: 0.998547057; scale-y: 0.994634227; cel: -1; alpha: 1; }
        frame 142 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 143 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 144 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 145 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 146 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 147 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 148 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 149 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 150 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 151 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 152 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 153 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 154 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 155 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 156 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 157 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 158 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 159 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 160 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 161 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 162 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 163 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 164 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 165 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 166 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 167 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 168 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 169 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 170 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 171 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 172 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 173 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 174 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 175 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 176 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 177 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 178 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 179 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 180 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 181 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 182 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 183 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 184 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 185 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 186 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 187 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 188 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 189 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 190 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 191 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 192 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 193 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 194 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 195 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
        frame 196 { x: 55.0767515; y: -17.337187; skew-x: -67.2100225; skew-y: -67.1891437; scale-x: 0.998791828; scale-y: 0.99905504; cel: -1; alpha: 1; }
    }
    Track {
        source-name: "Zombie_imp_innerleg_lower";
        frame-count: 197;
        frame 0 { x: 57.3351957; y: -10.3310386; skew-x: -88.8209787; skew-y: -88.7964621; scale-x: 0.995743702; scale-y: 0.995777898; cel: -1; alpha: 1; }
        frame 1 { x: 57.5065913; y: -10.3271258; skew-x: -88.9250555; skew-y: -88.9184529; scale-x: 0.995653372; scale-y: 0.994571596; cel: -1; alpha: 1; }
        frame 2 { x: 57.5314941; y: -10.282675; skew-x: -88.8586371; skew-y: -88.9090675; scale-x: 0.995318881; scale-y: 0.995693581; cel: -1; alpha: 1; }
        frame 3 { x: 57.7324915; y: -10.224573; skew-x: -88.8752208; skew-y: -88.9178418; scale-x: 0.995293134; scale-y: 0.995454793; cel: -1; alpha: 1; }
        frame 4 { x: 57.6696759; y: -10.2949862; skew-x: -88.7920907; skew-y: -88.8264726; scale-x: 0.995262946; scale-y: 0.995217378; cel: -1; alpha: 1; }
        frame 5 { x: 57.8705552; y: -10.3436575; skew-x: -88.8092419; skew-y: -88.8349627; scale-x: 0.995228245; scale-y: 0.99498139; cel: -1; alpha: 1; }
        frame 6 { x: 58.136914; y: -10.2789749; skew-x: -88.9266698; skew-y: -88.9433149; scale-x: 0.995188962; scale-y: 0.994746882; cel: -1; alpha: 1; }
        frame 7 { x: 58.2358769; y: -10.2406942; skew-x: -88.9519837; skew-y: -88.9393864; scale-x: 0.995173736; scale-y: 0.995485702; cel: -1; alpha: 1; }
        frame 8 { x: 58.4402583; y: -10.3123881; skew-x: -88.9640425; skew-y: -88.7526637; scale-x: 0.995535403; scale-y: 0.99452487; cel: -1; alpha: 1; }
        frame 9 { x: 58.4747493; y: -10.2864374; skew-x: -88.8866334; skew-y: -88.8558114; scale-x: 0.995065085; scale-y: 0.995024616; cel: -1; alpha: 1; }
        frame 10 { x: 58.4054245; y: -10.3271184; skew-x: -88.8043193; skew-y: -88.763904; scale-x: 0.996000524; scale-y: 0.995787391; cel: -1; alpha: 1; }
        frame 11 { x: 58.2716591; y: -10.3628483; skew-x: -88.8150693; skew-y: -88.8403668; scale-x: 0.994954485; scale-y: 0.994932967; cel: -1; alpha: 1; }
        frame 12 { x: 58.1335951; y: -10.2603983; skew-x: -88.8259242; skew-y: -88.9165634; scale-x: 0.994877169; scale-y: 0.99507434; cel: -1; alpha: 1; }
        frame 13 { x: 58.1634806; y: -10.3527702; skew-x: -88.9313961; skew-y: -88.8980123; scale-x: 0.995218467; scale-y: 0.994494508; cel: -1; alpha: 1; }
        frame 14 { x: 58.0233244; y: -10.3593644; skew-x: -88.9470083; skew-y: -88.864945; scale-x: 0.995401258; scale-y: 0.995242309; cel: -1; alpha: 1; }
        frame 15 { x: 57.8845393; y: -10.261568; skew-x: -88.958179; skew-y: -88.9408715; scale-x: 0.995304769; scale-y: 0.995390995; cel: -1; alpha: 1; }
        frame 16 { x: 57.7812129; y: -10.3865232; skew-x: -88.8695184; skew-y: -88.9164278; scale-x: 0.995180403; scale-y: 0.995544374; cel: -1; alpha: 1; }
        frame 17 { x: 57.6455593; y: -10.4035978; skew-x: -88.877033; skew-y: -88.8956483; scale-x: 0.995333649; scale-y: 0.99532256; cel: -1; alpha: 1; }
        frame 18 { x: 57.4474725; y: -10.3518923; skew-x: -88.7840955; skew-y: -88.7751405; scale-x: 0.995499792; scale-y: 0.995098161; cel: -1; alpha: 1; }
        frame 19 { x: 57.4067072; y: -10.3503903; skew-x: -88.8000337; skew-y: -88.9454947; scale-x: 0.994987042; scale-y: 0.995647814; cel: -1; alpha: 1; }
        frame 20 { x: 57.2489487; y: -10.4004516; skew-x: -88.9139711; skew-y: -88.916926; scale-x: 0.99455704; scale-y: 0.994986267; cel: -1; alpha: 1; }
        frame 21 { x: 57.3351957; y: -10.3310386; skew-x: -88.8209787; skew-y: -88.7964621; scale-x: 0.995743702; scale-y: 0.995777898; cel: -1; alpha: 1; }
        frame 22 { x: 57.7453334; y: -10.3641097; skew-x: -88.7873815; skew-y: -88.787382; scale-x: 0.995902364; scale-y: 0.995902245; cel: -1; alpha: 1; }
        frame 23 { x: 57.3992156; y: -10.0194395; skew-x: -88.9131555; skew-y: -88.8066913; scale-x: 0.996042701; scale-y: 0.993888922; cel: -1; alpha: 1; }
        frame 24 { x: 56.7273366; y: -10.0208652; skew-x: -88.7984536; skew-y: -88.7657651; scale-x: 0.994608145; scale-y: 0.994505818; cel: -1; alpha: 1; }
        frame 25 { x: 56.1064085; y: -9.99034093; skew-x: -88.7789741; skew-y: -88.8305315; scale-x: 0.993799527; scale-y: 0.995543436; cel: -1; alpha: 1; }
        frame 26 { x: 55.6333135; y: -9.94316342; skew-x: -88.8381735; skew-y: -88.8145599; scale-x: 0.993692623; scale-y: 0.994782178; cel: -1; alpha: 1; }
        frame 27 { x: 55.1125742; y: -10.0074192; skew-x: -88.7367173; skew-y: -88.7646658; scale-x: 0.995944169; scale-y: 0.995627922; cel: -1; alpha: 1; }
        frame 28 { x: 55.0410899; y: -10.0935949; skew-x: -88.7697765; skew-y: -88.7527877; scale-x: 0.994599673; scale-y: 0.993775698; cel: -1; alpha: 1; }
        frame 29 { x: 54.8848469; y: -10.1986958; skew-x: -88.7748093; skew-y: -88.7717735; scale-x: 0.994854392; scale-y: 0.993327846; cel: -1; alpha: 1; }
        frame 30 { x: 54.6489721; y: -10.2873172; skew-x: -88.7222819; skew-y: -88.7479037; scale-x: 0.994266509; scale-y: 0.99377317; cel: -1; alpha: 1; }
        frame 31 { x: 54.5763161; y: -10.3410683; skew-x: -88.8095962; skew-y: -88.7830491; scale-x: 0.995823461; scale-y: 0.993029244; cel: -1; alpha: 1; }
        frame 32 { x: 54.1582353; y: -10.4036938; skew-x: -88.834939; skew-y: -88.7811804; scale-x: 0.995854844; scale-y: 0.995908427; cel: -1; alpha: 1; }
        frame 33 { x: 54.6141997; y: -10.2408848; skew-x: -88.7774966; skew-y: -88.7610528; scale-x: 0.995037146; scale-y: 0.993982535; cel: -1; alpha: 1; }
        frame 34 { x: 54.5684676; y: -10.0508094; skew-x: -88.7945993; skew-y: -88.7651103; scale-x: 0.995874818; scale-y: 0.995556027; cel: -1; alpha: 1; }
        frame 35 { x: 57.0043564; y: -10.3165483; skew-x: -88.8661805; skew-y: -88.8119127; scale-x: 0.994626907; scale-y: 0.994064741; cel: -1; alpha: 1; }
        frame 36 { x: 59.2224624; y: -11.5324264; skew-x: -88.7477352; skew-y: -88.7477352; scale-x: 0.996030537; scale-y: 0.996030518; cel: -1; alpha: 1; }
        frame 37 { x: 59.4847625; y: -11.33543; skew-x: -88.7517976; skew-y: -88.8099156; scale-x: 0.995365138; scale-y: 0.995428836; cel: -1; alpha: 1; }
        frame 38 { x: 59.6847317; y: -11.3210345; skew-x: -88.6555878; skew-y: -88.7723197; scale-x: 0.995770528; scale-y: 0.995845204; cel: -1; alpha: 1; }
        frame 39 { x: 59.5811532; y: -10.9835989; skew-x: -88.849003; skew-y: -88.853513; scale-x: 0.995638237; scale-y: 0.995638633; cel: -1; alpha: 1; }
        frame 40 { x: 59.3985717; y: -10.6338747; skew-x: -88.8417288; skew-y: -88.8353263; scale-x: 0.995591425; scale-y: 0.995505833; cel: -1; alpha: 1; }
        frame 41 { x: 59.1680511; y: -10.4837474; skew-x: -88.8337173; skew-y: -88.8178051; scale-x: 0.995569151; scale-y: 0.995354155; cel: -1; alpha: 1; }
        frame 42 { x: 59.1231576; y: -10.1531588; skew-x: -88.9367089; skew-y: -88.9107805; scale-x: 0.99568978; scale-y: 0.99459728; cel: -1; alpha: 1; }
        frame 43 { x: 58.8904602; y: -9.83966629; skew-x: -88.9541239; skew-y: -88.9862959; scale-x: 0.995531919; scale-y: 0.995223769; cel: -1; alpha: 1; }
        frame 44 { x: 58.6936586; y: -9.61706319; skew-x: -88.8672151; skew-y: -88.8658035; scale-x: 0.994701335; scale-y: 0.994415335; cel: -1; alpha: 1; }
        frame 45 { x: 58.4342628; y: -9.43944461; skew-x: -88.8801183; skew-y: -88.8451708; scale-x: 0.994892683; scale-y: 0.994572537; cel: -1; alpha: 1; }
        frame 46 { x: 58.3570069; y: -9.25468209; skew-x: -88.8013065; skew-y: -88.815969; scale-x: 0.995695504; scale-y: 0.996272799; cel: -1; alpha: 1; }
        frame 47 { x: 57.9318869; y: -9.35280854; skew-x: -88.8277567; skew-y: -88.9024646; scale-x: 0.994632888; scale-y: 0.994764391; cel: -1; alpha: 1; }
        frame 48 { x: 57.4657745; y: -9.51709099; skew-x: -88.8727882; skew-y: -88.8608925; scale-x: 0.994376512; scale-y: 0.99431272; cel: -1; alpha: 1; }
        frame 49 { x: 56.9584123; y: -9.6705661; skew-x: -88.89249; skew-y: -88.8491025; scale-x: 0.995104411; scale-y: 0.993914371; cel: -1; alpha: 1; }
        frame 50 { x: 56.4711558; y: -10.0660506; skew-x: -88.7620064; skew-y: -88.7873429; scale-x: 0.9943937; scale-y: 0.995117592; cel: -1; alpha: 1; }
        frame 51 { x: 55.5975804; y: -10.2667152; skew-x: -88.7756922; skew-y: -88.7812212; scale-x: 0.996149431; scale-y: 0.99571875; cel: -1; alpha: 1; }
        frame 52 { x: 55.0558358; y: -9.97972186; skew-x: -88.8533553; skew-y: -88.8863654; scale-x: 0.993423955; scale-y: 0.994652059; cel: -1; alpha: 1; }
        frame 53 { x: 54.4520091; y: -9.99145434; skew-x: -88.7972535; skew-y: -88.8262838; scale-x: 0.99505542; scale-y: 0.992808688; cel: -1; alpha: 1; }
        frame 54 { x: 53.4906825; y: -9.88453411; skew-x: -88.8174557; skew-y: -88.7817368; scale-x: 0.993382434; scale-y: 0.996298741; cel: -1; alpha: 1; }
        frame 55 { x: 52.8842877; y: -9.9046331; skew-x: -88.7397945; skew-y: -88.7422335; scale-x: 0.994914504; scale-y: 0.994302614; cel: -1; alpha: 1; }
        frame 56 { x: 51.9723983; y: -9.91424807; skew-x: -88.7734743; skew-y: -88.7928312; scale-x: 0.995924253; scale-y: 0.995344465; cel: -1; alpha: 1; }
        frame 57 { x: 53.6482034; y: -9.99209158; skew-x: -88.8289473; skew-y: -88.8133211; scale-x: 0.994554059; scale-y: 0.993115328; cel: -1; alpha: 1; }
        frame 58 { x: 54.9052754; y: -10.004565; skew-x: -88.8129118; skew-y: -88.8148921; scale-x: 0.995839135; scale-y: 0.995446803; cel: -1; alpha: 1; }
        frame 59 { x: 56.8778642; y: -9.93277724; skew-x: -88.8360983; skew-y: -88.8113619; scale-x: 0.994550577; scale-y: 0.994328403; cel: -1; alpha: 1; }
        frame 60 { x: 59.0743727; y: -10.6345221; skew-x: -88.7484853; skew-y: -88.8241416; scale-x: 0.995996665; scale-y: 0.995655525; cel: -1; alpha: 1; }
        frame 61 { x: 59.0746336; y: -10.3628104; skew-x: -88.9603951; skew-y: -88.9260262; scale-x: 0.995500232; scale-y: 0.994576678; cel: -1; alpha: 1; }
        frame 62 { x: 59.0514512; y: -10.1486955; skew-x: -88.7761365; skew-y: -88.8127917; scale-x: 0.9958617; scale-y: 0.996143678; cel: -1; alpha: 1; }
        frame 63 { x: 58.9353837; y: -9.91470192; skew-x: -88.7927024; skew-y: -88.8959227; scale-x: 0.995431008; scale-y: 0.995871667; cel: -1; alpha: 1; }
        frame 64 { x: 58.8895376; y: -9.78026545; skew-x: -88.8074545; skew-y: -88.8814932; scale-x: 0.99508087; scale-y: 0.995118634; cel: -1; alpha: 1; }
        frame 65 { x: 58.7036187; y: -9.52708087; skew-x: -88.8224671; skew-y: -88.7521784; scale-x: 0.995928503; scale-y: 0.995573947; cel: -1; alpha: 1; }
        frame 66 { x: 58.5299851; y: -9.77063209; skew-x: -88.9328698; skew-y: -88.9947517; scale-x: 0.995100691; scale-y: 0.994764334; cel: -1; alpha: 1; }
        frame 67 { x: 58.2687076; y: -9.75147629; skew-x: -88.9387516; skew-y: -88.9262258; scale-x: 0.995721424; scale-y: 0.99461792; cel: -1; alpha: 1; }
        frame 68 { x: 58.1354092; y: -10.0114613; skew-x: -88.8680707; skew-y: -88.9274006; scale-x: 0.994820471; scale-y: 0.995557411; cel: -1; alpha: 1; }
        frame 69 { x: 57.8577822; y: -9.93545402; skew-x: -88.9524828; skew-y: -88.8859764; scale-x: 0.995892152; scale-y: 0.994025894; cel: -1; alpha: 1; }
        frame 70 { x: 57.7453334; y: -10.3641097; skew-x: -88.7873815; skew-y: -88.787382; scale-x: 0.995902364; scale-y: 0.995902245; cel: -1; alpha: 1; }
        frame 71 { x: 57.6922789; y: -10.3641148; skew-x: -88.7873815; skew-y: -88.787382; scale-x: 0.995902364; scale-y: 0.995902245; cel: -1; alpha: 1; }
        frame 72 { x: 56.7387859; y: -10.2391112; skew-x: -88.8149126; skew-y: -88.8149132; scale-x: 0.994200896; scale-y: 0.994200787; cel: -1; alpha: 1; }
        frame 73 { x: 55.730482; y: -10.0480023; skew-x: -88.8424437; skew-y: -88.8424443; scale-x: 0.9944934; scale-y: 0.994493299; cel: -1; alpha: 1; }
        frame 74 { x: 54.7854179; y: -10.0579823; skew-x: -88.769975; skew-y: -88.7699753; scale-x: 0.994786077; scale-y: 0.994785982; cel: -1; alpha: 1; }
        frame 75 { x: 53.8845415; y: -10.0453122; skew-x: -88.7975063; skew-y: -88.7975063; scale-x: 0.994080854; scale-y: 0.994080763; cel: -1; alpha: 1; }
        frame 76 { x: 52.9515434; y: -10.3454427; skew-x: -88.7250376; skew-y: -88.7250372; scale-x: 0.994373586; scale-y: 0.994373493; cel: -1; alpha: 1; }
        frame 77 { x: 51.9646765; y: -10.3475807; skew-x: -88.8525689; skew-y: -88.8525682; scale-x: 0.994666492; scale-y: 0.994666393; cel: -1; alpha: 1; }
        frame 78 { x: 51.1739854; y: -10.8931583; skew-x: -88.6801001; skew-y: -88.6800992; scale-x: 0.993960617; scale-y: 0.993960509; cel: -1; alpha: 1; }
        frame 79 { x: 50.1164138; y: -11.119564; skew-x: -88.8076313; skew-y: -88.8076303; scale-x: 0.996252077; scale-y: 0.996251957; cel: -1; alpha: 1; }
        frame 80 { x: 49.930498; y: -11.4675901; skew-x: -88.6645182; skew-y: -88.6645185; scale-x: 0.994443893; scale-y: 0.994443778; cel: -1; alpha: 1; }
        frame 81 { x: 49.5064451; y: -11.4758159; skew-x: -88.7214052; skew-y: -88.7214066; scale-x: 0.99463428; scale-y: 0.994634174; cel: -1; alpha: 1; }
        frame 82 { x: 49.1030899; y: -11.3749147; skew-x: -88.7782922; skew-y: -88.7782947; scale-x: 0.994824738; scale-y: 0.994824644; cel: -1; alpha: 1; }
        frame 83 { x: 48.8431271; y: -11.646053; skew-x: -88.7351794; skew-y: -88.7351827; scale-x: 0.995015268; scale-y: 0.995015189; cel: -1; alpha: 1; }
        frame 84 { x: 48.4051791; y: -11.9272011; skew-x: -88.7920666; skew-y: -88.7920707; scale-x: 0.995205869; scale-y: 0.995205809; cel: -1; alpha: 1; }
        frame 85 { x: 48.2378673; y: -12.1879472; skew-x: -88.7489539; skew-y: -88.7489584; scale-x: 0.995396541; scale-y: 0.995396502; cel: -1; alpha: 1; }
        frame 86 { x: 48.9610345; y: -11.9458652; skew-x: -88.7168675; skew-y: -88.7168707; scale-x: 0.994745235; scale-y: 0.994745152; cel: -1; alpha: 1; }
        frame 87 { x: 49.4625203; y: -11.7953966; skew-x: -88.7847758; skew-y: -88.7847767; scale-x: 0.99609839; scale-y: 0.996098278; cel: -1; alpha: 1; }
        frame 88 { x: 51.3657549; y: -10.7590037; skew-x: -88.8290138; skew-y: -88.8290132; scale-x: 0.99476653; scale-y: 0.994766426; cel: -1; alpha: 1; }
        frame 89 { x: 53.061186; y: -10.466735; skew-x: -88.7732516; skew-y: -88.77325; scale-x: 0.995440461; scale-y: 0.995440373; cel: -1; alpha: 1; }
        frame 90 { x: 58.3303159; y: -11.1872369; skew-x: -88.8415585; skew-y: -88.8415565; scale-x: 0.996243614; scale-y: 0.996243571; cel: -1; alpha: 1; }
        frame 91 { x: 61.0909386; y: -13.2891617; skew-x: -88.7233735; skew-y: -88.7233714; scale-x: 0.995475855; scale-y: 0.995475824; cel: -1; alpha: 1; }
        frame 92 { x: 61.0921361; y: -13.2622123; skew-x: -88.7233656; skew-y: -88.7233635; scale-x: 0.995475855; scale-y: 0.995475824; cel: -1; alpha: 1; }
        frame 93 { x: 61.0932537; y: -13.1709667; skew-x: -88.7233656; skew-y: -88.7233635; scale-x: 0.995475855; scale-y: 0.995475824; cel: -1; alpha: 1; }
        frame 94 { x: 61.0943553; y: -13.079716; skew-x: -88.7233656; skew-y: -88.7233635; scale-x: 0.995475855; scale-y: 0.995475824; cel: -1; alpha: 1; }
        frame 95 { x: 61.0934985; y: -13.372912; skew-x: -88.7233656; skew-y: -88.7233635; scale-x: 0.995475855; scale-y: 0.995475824; cel: -1; alpha: 1; }
        frame 96 { x: 61.0921522; y: -13.2622194; skew-x: -88.7233656; skew-y: -88.7233635; scale-x: 0.995475855; scale-y: 0.995475824; cel: -1; alpha: 1; }
        frame 97 { x: 60.7099379; y: -12.7084303; skew-x: -88.6610777; skew-y: -88.6610754; scale-x: 0.995250299; scale-y: 0.995250254; cel: -1; alpha: 1; }
        frame 98 { x: 60.2349104; y: -12.2011615; skew-x: -88.6987952; skew-y: -88.698793; scale-x: 0.996028348; scale-y: 0.996028288; cel: -1; alpha: 1; }
        frame 99 { x: 59.8059082; y: -11.787222; skew-x: -88.6365127; skew-y: -88.6365106; scale-x: 0.995802666; scale-y: 0.995802591; cel: -1; alpha: 1; }
        frame 100 { x: 59.2502657; y: -11.3883076; skew-x: -88.97423; skew-y: -88.9742283; scale-x: 0.995577539; scale-y: 0.99557745; cel: -1; alpha: 1; }
        frame 101 { x: 58.8336512; y: -11.1136195; skew-x: -88.9119473; skew-y: -88.9119462; scale-x: 0.995352964; scale-y: 0.995352863; cel: -1; alpha: 1; }
        frame 102 { x: 58.2471526; y: -10.6921598; skew-x: -88.9496644; skew-y: -88.949664; scale-x: 0.995128941; scale-y: 0.995128829; cel: -1; alpha: 1; }
        frame 103 { x: 57.6922789; y: -10.3641148; skew-x: -88.7873815; skew-y: -88.787382; scale-x: 0.995902364; scale-y: 0.995902245; cel: -1; alpha: 1; }
        frame 104 { x: 57.6922789; y: -10.3641148; skew-x: -88.7873815; skew-y: -88.787382; scale-x: 0.995902364; scale-y: 0.995902245; cel: -1; alpha: 1; }
        frame 105 { x: 57.9869417; y: -10.3735279; skew-x: -88.8297282; skew-y: -88.8297283; scale-x: 0.994571313; scale-y: 0.994571199; cel: -1; alpha: 1; }
        frame 106 { x: 58.0589589; y: -10.5644153; skew-x: -88.7720748; skew-y: -88.7720745; scale-x: 0.995234945; scale-y: 0.995234837; cel: -1; alpha: 1; }
        frame 107 { x: 58.4680707; y: -10.542272; skew-x: -88.9144215; skew-y: -88.9144208; scale-x: 0.994900567; scale-y: 0.994900465; cel: -1; alpha: 1; }
        frame 108 { x: 58.7167956; y: -10.5671294; skew-x: -88.8567681; skew-y: -88.8567671; scale-x: 0.995565305; scale-y: 0.995565209; cel: -1; alpha: 1; }
        frame 109 { x: 58.933184; y: -10.7164747; skew-x: -88.8991147; skew-y: -88.8991135; scale-x: 0.9952307; scale-y: 0.995230611; cel: -1; alpha: 1; }
        frame 110 { x: 59.0701072; y: -10.9075253; skew-x: -88.8414612; skew-y: -88.8414598; scale-x: 0.994895647; scale-y: 0.994895566; cel: -1; alpha: 1; }
        frame 111 { x: 59.406979; y: -10.8351808; skew-x: -88.9838078; skew-y: -88.9838062; scale-x: 0.995561717; scale-y: 0.995561643; cel: -1; alpha: 1; }
        frame 112 { x: 59.4407335; y: -11.2371003; skew-x: -88.8261536; skew-y: -88.8261518; scale-x: 0.996228679; scale-y: 0.996228613; cel: -1; alpha: 1; }
        frame 113 { x: 59.8114048; y: -11.4699259; skew-x: -88.7508147; skew-y: -88.7508129; scale-x: 0.99540986; scale-y: 0.995409801; cel: -1; alpha: 1; }
        frame 114 { x: 60.1498568; y: -11.8130539; skew-x: -88.5754759; skew-y: -88.5754739; scale-x: 0.995593351; scale-y: 0.9955933; cel: -1; alpha: 1; }
        frame 115 { x: 60.645198; y: -12.0050855; skew-x: -88.600137; skew-y: -88.600135; scale-x: 0.99577691; scale-y: 0.995776866; cel: -1; alpha: 1; }
        frame 116 { x: 61.1285233; y: -12.27715; skew-x: -88.724798; skew-y: -88.7247961; scale-x: 0.995960537; scale-y: 0.9959605; cel: -1; alpha: 1; }
        frame 117 { x: 61.4217448; y: -12.5643853; skew-x: -88.6494565; skew-y: -88.6494547; scale-x: 0.996144231; scale-y: 0.996144201; cel: -1; alpha: 1; }
        frame 118 { x: 60.8669008; y: -13.5841087; skew-x: -84.4650926; skew-y: -84.465091; scale-x: 0.995305522; scale-y: 0.995305506; cel: -1; alpha: 1; }
        frame 119 { x: 60.1768289; y: -13.8436633; skew-x: -80.1807285; skew-y: -80.1807275; scale-x: 0.995470035; scale-y: 0.995470031; cel: -1; alpha: 1; }
        frame 120 { x: 58.1562064; y: -13.0456103; skew-x: -75.9963643; skew-y: -75.996364; scale-x: 0.99463094; scale-y: 0.994630945; cel: -1; alpha: 1; }
        frame 121 { x: 55.6873714; y: -11.8109264; skew-x: -71.9120038; skew-y: -71.9120043; scale-x: 0.995799229; scale-y: 0.995799239; cel: -1; alpha: 1; }
        frame 122 { x: 55.5371364; y: -11.829858; skew-x: -71.7120038; skew-y: -71.7120043; scale-x: 0.994795399; scale-y: 0.994795409; cel: -1; alpha: 1; }
        frame 123 { x: 55.6873706; y: -11.810915; skew-x: -71.9119742; skew-y: -71.9119747; scale-x: 0.99579923; scale-y: 0.99579924; cel: -1; alpha: 1; }
        frame 124 { x: 46.8420672; y: -11.2389541; skew-x: -62.2480128; skew-y: -62.2480151; scale-x: 0.994513575; scale-y: 0.994513582; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_INNERLEG_LOWER; }
        frame 125 { x: 38.2744846; y: -19.7963962; skew-x: -70.3539455; skew-y: -70.3539479; scale-x: 0.993835255; scale-y: 0.993835261; cel: 0; alpha: 1; }
        frame 126 { x: 29.2352622; y: -29.0011715; skew-x: -78.6598782; skew-y: -78.6598807; scale-x: 0.993156749; scale-y: 0.993156754; cel: 0; alpha: 1; }
        frame 127 { x: 19.4891878; y: -37.2636328; skew-x: -86.765811; skew-y: -86.7658135; scale-x: 0.993483607; scale-y: 0.993483612; cel: 0; alpha: 1; }
        frame 128 { x: 10.5635499; y: -44.399624; skew-x: -94.9717289; skew-y: -94.9717315; scale-x: 0.993810941; scale-y: 0.993810946; cel: 0; alpha: 1; }
        frame 129 { x: -46.956808; y: -48.5832382; skew-x: -87.2716641; skew-y: -87.2716664; scale-x: 0.992822499; scale-y: 0.992822511; cel: 0; alpha: 1; }
        frame 130 { x: -104.537985; y: -52.7188609; skew-x: -79.5716091; skew-y: -79.5716117; scale-x: 0.993845865; scale-y: 0.99384589; cel: 0; alpha: 1; }
        frame 131 { x: -104.537985; y: -52.7188609; skew-x: -79.5716091; skew-y: -79.5716117; scale-x: 0.993845865; scale-y: 0.99384589; cel: -1; alpha: 1; }
        frame 132 { x: -104.537985; y: -52.7188609; skew-x: -79.5716091; skew-y: -79.5716117; scale-x: 0.993845865; scale-y: 0.99384589; cel: -1; alpha: 1; }
        frame 133 { x: -104.537985; y: -52.7188609; skew-x: -79.5716091; skew-y: -79.5716117; scale-x: 0.993845865; scale-y: 0.99384589; cel: -1; alpha: 1; }
        frame 134 { x: -104.537985; y: -52.7188609; skew-x: -79.5716091; skew-y: -79.5716117; scale-x: 0.993845865; scale-y: 0.99384589; cel: -1; alpha: 1; }
        frame 135 { x: -104.537985; y: -52.7188609; skew-x: -79.5716091; skew-y: -79.5716117; scale-x: 0.993845865; scale-y: 0.99384589; cel: -1; alpha: 1; }
        frame 136 { x: -104.537985; y: -52.7188609; skew-x: -79.5716091; skew-y: -79.5716117; scale-x: 0.993845865; scale-y: 0.99384589; cel: -1; alpha: 1; }
        frame 137 { x: -104.537985; y: -52.7188609; skew-x: -79.5716091; skew-y: -79.5716117; scale-x: 0.993845865; scale-y: 0.99384589; cel: -1; alpha: 1; }
        frame 138 { x: 56.3529499; y: -6.82985097; skew-x: -92.3476579; skew-y: -92.8382823; scale-x: 0.994668155; scale-y: 0.970190644; cel: -1; alpha: 1; }
        frame 139 { x: 55.5317802; y: -9.49358715; skew-x: -91.0698311; skew-y: -91.5215215; scale-x: 0.993500985; scale-y: 0.976800951; cel: -1; alpha: 1; }
        frame 140 { x: 54.8495172; y: -12.3969897; skew-x: -89.6924916; skew-y: -90.0048032; scale-x: 0.993865588; scale-y: 0.983984327; cel: -1; alpha: 1; }
        frame 141 { x: 54.702727; y: -15.5879988; skew-x: -88.4138568; skew-y: -88.4896772; scale-x: 0.995816014; scale-y: 0.991701382; cel: -1; alpha: 1; }
        frame 142 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 143 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 144 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 145 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 146 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 147 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 148 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 149 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 150 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 151 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 152 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 153 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 154 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 155 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 156 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 157 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 158 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 159 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 160 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 161 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 162 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 163 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 164 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 165 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 166 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 167 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 168 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 169 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 170 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 171 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 172 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 173 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 174 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 175 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 176 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 177 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 178 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 179 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 180 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 181 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 182 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 183 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 184 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 185 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 186 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 187 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 188 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 189 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 190 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 191 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 192 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 193 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 194 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 195 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
        frame 196 { x: 52.6869513; y: -19.938245; skew-x: -88.7964082; skew-y: -88.7708485; scale-x: 0.996113166; scale-y: 0.99605611; cel: -1; alpha: 1; }
    }
    Track {
        source-name: "Zombie_imp_innerleg_upper";
        frame-count: 197;
        frame 0 { x: 45.9121873; y: -17.8235271; skew-x: -47.8235064; skew-y: -47.8220372; scale-x: 0.996645699; scale-y: 0.997072854; cel: -1; alpha: 1; }
        frame 1 { x: 46.083931; y: -17.7943116; skew-x: -47.9671047; skew-y: -47.904509; scale-x: 0.996229163; scale-y: 0.996190988; cel: -1; alpha: 1; }
        frame 2 { x: 46.1041804; y: -17.7494048; skew-x: -47.883704; skew-y: -47.9121246; scale-x: 0.997012611; scale-y: 0.99619633; cel: -1; alpha: 1; }
        frame 3 { x: 46.3058196; y: -17.6893323; skew-x: -47.9029954; skew-y: -47.9181789; scale-x: 0.996827746; scale-y: 0.996116356; cel: -1; alpha: 1; }
        frame 4 { x: 46.2566361; y: -17.7777037; skew-x: -47.8222252; skew-y: -47.8244408; scale-x: 0.996637274; scale-y: 0.996038898; cel: -1; alpha: 1; }
        frame 5 { x: 46.4580496; y: -17.8243982; skew-x: -47.8413883; skew-y: -47.8309134; scale-x: 0.996441243; scale-y: 0.995963895; cel: -1; alpha: 1; }
        frame 6 { x: 46.7118549; y: -17.7378053; skew-x: -47.9604797; skew-y: -47.9376001; scale-x: 0.996239704; scale-y: 0.995891281; cel: -1; alpha: 1; }
        frame 7 { x: 46.799043; y: -17.7004246; skew-x: -47.9517217; skew-y: -47.9677472; scale-x: 0.996297442; scale-y: 0.996557945; cel: -1; alpha: 1; }
        frame 8 { x: 47.0137941; y: -17.8122406; skew-x: -47.9159101; skew-y: -47.8291579; scale-x: 0.994380456; scale-y: 0.997877927; cel: -1; alpha: 1; }
        frame 9 { x: 47.0518459; y: -17.7619895; skew-x: -47.8885763; skew-y: -47.8819738; scale-x: 0.995880067; scale-y: 0.996405031; cel: -1; alpha: 1; }
        frame 10 { x: 46.9845909; y: -17.8280112; skew-x: -47.8070536; skew-y: -47.7892828; scale-x: 0.996659336; scale-y: 0.997325882; cel: -1; alpha: 1; }
        frame 11 { x: 46.858916; y: -17.8405092; skew-x: -47.8406132; skew-y: -47.842926; scale-x: 0.996260538; scale-y: 0.995822068; cel: -1; alpha: 1; }
        frame 12 { x: 46.7175108; y: -17.7221788; skew-x: -47.8733221; skew-y: -47.8972957; scale-x: 0.996839959; scale-y: 0.995307305; cel: -1; alpha: 1; }
        frame 13 { x: 46.7409317; y: -17.8209111; skew-x: -47.9517357; skew-y: -47.9057986; scale-x: 0.995717362; scale-y: 0.99619045; cel: -1; alpha: 1; }
        frame 14 { x: 46.5902552; y: -17.8357153; skew-x: -47.9302693; skew-y: -47.9098076; scale-x: 0.995724489; scale-y: 0.997115497; cel: -1; alpha: 1; }
        frame 15 { x: 46.4480342; y: -17.7219466; skew-x: -47.9623253; skew-y: -47.9648269; scale-x: 0.996290841; scale-y: 0.996600942; cel: -1; alpha: 1; }
        frame 16 { x: 46.3542096; y: -17.8507527; skew-x: -47.8933753; skew-y: -47.9206927; scale-x: 0.996838967; scale-y: 0.996081949; cel: -1; alpha: 1; }
        frame 17 { x: 46.2202888; y: -17.873108; skew-x: -47.8994062; skew-y: -47.9013781; scale-x: 0.996587152; scale-y: 0.996265036; cel: -1; alpha: 1; }
        frame 18 { x: 46.0370846; y: -17.846645; skew-x: -47.8057422; skew-y: -47.7815996; scale-x: 0.996347925; scale-y: 0.99644588; cel: -1; alpha: 1; }
        frame 19 { x: 45.9871159; y: -17.8071865; skew-x: -47.8577931; skew-y: -47.915957; scale-x: 0.997622355; scale-y: 0.995209783; cel: -1; alpha: 1; }
        frame 20 { x: 45.8227261; y: -17.8600282; skew-x: -47.9170533; skew-y: -47.9419472; scale-x: 0.995864467; scale-y: 0.995873519; cel: -1; alpha: 1; }
        frame 21 { x: 45.9121873; y: -17.8235271; skew-x: -47.8235064; skew-y: -47.8220372; scale-x: 0.996645699; scale-y: 0.997072854; cel: -1; alpha: 1; }
        frame 22 { x: 46.3251951; y: -17.8595291; skew-x: -47.8014359; skew-y: -47.8014304; scale-x: 0.997000931; scale-y: 0.997000897; cel: -1; alpha: 1; }
        frame 23 { x: 45.986476; y: -17.5118126; skew-x: -47.9428757; skew-y: -47.8052948; scale-x: 0.995298635; scale-y: 0.996827562; cel: -1; alpha: 1; }
        frame 24 { x: 45.321919; y: -17.5109087; skew-x: -47.801359; skew-y: -47.7909671; scale-x: 0.995380061; scale-y: 0.995928227; cel: -1; alpha: 1; }
        frame 25 { x: 44.6909917; y: -17.4616273; skew-x: -47.765497; skew-y: -47.8721911; scale-x: 0.99609096; scale-y: 0.995445846; cel: -1; alpha: 1; }
        frame 26 { x: 44.2193222; y: -17.4168689; skew-x: -47.8109626; skew-y: -47.8698442; scale-x: 0.995055062; scale-y: 0.995613065; cel: -1; alpha: 1; }
        frame 27 { x: 43.7021384; y: -17.5075242; skew-x: -47.7717923; skew-y: -47.7576856; scale-x: 0.997147423; scale-y: 0.996621676; cel: -1; alpha: 1; }
        frame 28 { x: 43.647838; y: -17.5859327; skew-x: -47.8000342; skew-y: -47.7506444; scale-x: 0.995196; scale-y: 0.995372645; cel: -1; alpha: 1; }
        frame 29 { x: 43.496121; y: -17.6889633; skew-x: -47.8311129; skew-y: -47.743568; scale-x: 0.995268636; scale-y: 0.995106248; cel: -1; alpha: 1; }
        frame 30 { x: 43.2617185; y: -17.778082; skew-x: -47.7614241; skew-y: -47.7368517; scale-x: 0.995371226; scale-y: 0.994861524; cel: -1; alpha: 1; }
        frame 31 { x: 43.1867598; y: -17.8361381; skew-x: -47.8919536; skew-y: -47.7288372; scale-x: 0.995491331; scale-y: 0.995553374; cel: -1; alpha: 1; }
        frame 32 { x: 42.7320214; y: -17.9001464; skew-x: -47.824326; skew-y: -47.8198969; scale-x: 0.996513429; scale-y: 0.997447234; cel: -1; alpha: 1; }
        frame 33 { x: 43.2176003; y: -17.7348145; skew-x: -47.8145605; skew-y: -47.7521047; scale-x: 0.99553933; scale-y: 0.995674224; cel: -1; alpha: 1; }
        frame 34 { x: 43.1515297; y: -17.5504596; skew-x: -47.8050481; skew-y: -47.7827742; scale-x: 0.996582153; scale-y: 0.997045528; cel: -1; alpha: 1; }
        frame 35 { x: 45.5953078; y: -17.797488; skew-x: -47.872928; skew-y: -47.8333004; scale-x: 0.995015363; scale-y: 0.995870175; cel: -1; alpha: 1; }
        frame 36 { x: 47.806043; y: -19.036712; skew-x: -47.7617865; skew-y: -47.7617867; scale-x: 0.997129285; scale-y: 0.997129273; cel: -1; alpha: 1; }
        frame 37 { x: 48.0744421; y: -18.8221756; skew-x: -47.789023; skew-y: -47.8008007; scale-x: 0.996991134; scale-y: 0.995999192; cel: -1; alpha: 1; }
        frame 38 { x: 48.2819518; y: -18.8181507; skew-x: -47.7176797; skew-y: -47.7383559; scale-x: 0.997907121; scale-y: 0.995906625; cel: -1; alpha: 1; }
        frame 39 { x: 48.1559668; y: -18.4638364; skew-x: -47.8649825; skew-y: -47.8656364; scale-x: 0.996775576; scale-y: 0.996697934; cel: -1; alpha: 1; }
        frame 40 { x: 47.975916; y: -18.1173943; skew-x: -47.8554644; skew-y: -47.8496941; scale-x: 0.9965977; scale-y: 0.996695999; cel: -1; alpha: 1; }
        frame 41 { x: 47.7482405; y: -17.9705857; skew-x: -47.8470504; skew-y: -47.8325783; scale-x: 0.9964378; scale-y: 0.996681757; cel: -1; alpha: 1; }
        frame 42 { x: 47.6987575; y: -17.6221907; skew-x: -47.9707575; skew-y: -47.9048587; scale-x: 0.996094655; scale-y: 0.996387672; cel: -1; alpha: 1; }
        frame 43 { x: 47.4562744; y: -17.2924835; skew-x: -47.9907872; skew-y: -47.9777266; scale-x: 0.996774478; scale-y: 0.996177338; cel: -1; alpha: 1; }
        frame 44 { x: 47.2802005; y: -17.087762; skew-x: -47.8888161; skew-y: -47.8723054; scale-x: 0.995663326; scale-y: 0.995647579; cel: -1; alpha: 1; }
        frame 45 { x: 47.0174551; y: -16.9157671; skew-x: -47.8882661; skew-y: -47.8651378; scale-x: 0.995551642; scale-y: 0.996108269; cel: -1; alpha: 1; }
        frame 46 { x: 46.9306474; y: -16.742947; skew-x: -47.8052252; skew-y: -47.8401605; scale-x: 0.997168884; scale-y: 0.996996744; cel: -1; alpha: 1; }
        frame 47 { x: 46.5191954; y: -16.8155919; skew-x: -47.8701785; skew-y: -47.8881621; scale-x: 0.996429745; scale-y: 0.995162499; cel: -1; alpha: 1; }
        frame 48 { x: 46.0527774; y: -16.9864057; skew-x: -47.8835415; skew-y: -47.8782429; scale-x: 0.995343653; scale-y: 0.995539371; cel: -1; alpha: 1; }
        frame 49 { x: 45.5477022; y: -17.1475137; skew-x: -47.9218368; skew-y: -47.8479061; scale-x: 0.99531665; scale-y: 0.995896007; cel: -1; alpha: 1; }
        frame 50 { x: 45.0631088; y: -17.5502328; skew-x: -47.7663188; skew-y: -47.8111501; scale-x: 0.996020512; scale-y: 0.995685366; cel: -1; alpha: 1; }
        frame 51 { x: 44.1811185; y: -17.7651009; skew-x: -47.8043868; skew-y: -47.7806263; scale-x: 0.997110505; scale-y: 0.996954926; cel: -1; alpha: 1; }
        frame 52 { x: 43.6411089; y: -17.4369921; skew-x: -47.8465722; skew-y: -47.9212865; scale-x: 0.99533281; scale-y: 0.994935971; cel: -1; alpha: 1; }
        frame 53 { x: 43.0662784; y: -17.4721394; skew-x: -47.8878693; skew-y: -47.7636873; scale-x: 0.99543577; scale-y: 0.994620108; cel: -1; alpha: 1; }
        frame 54 { x: 42.0617739; y: -17.3629254; skew-x: -47.7329119; skew-y: -47.8942483; scale-x: 0.995427788; scale-y: 0.996446386; cel: -1; alpha: 1; }
        frame 55 { x: 41.488799; y: -17.4014424; skew-x: -47.7723446; skew-y: -47.7377832; scale-x: 0.995769552; scale-y: 0.995641841; cel: -1; alpha: 1; }
        frame 56 { x: 40.5604814; y: -17.408552; skew-x: -47.8123633; skew-y: -47.7820331; scale-x: 0.996939973; scale-y: 0.996525332; cel: -1; alpha: 1; }
        frame 57 { x: 42.254882; y: -17.4718937; skew-x: -47.877348; skew-y: -47.7930374; scale-x: 0.994897536; scale-y: 0.994963989; cel: -1; alpha: 1; }
        frame 58 { x: 43.4870733; y: -17.4939252; skew-x: -47.8389918; skew-y: -47.8169136; scale-x: 0.996785799; scale-y: 0.99669675; cel: -1; alpha: 1; }
        frame 59 { x: 45.4695486; y: -17.4132596; skew-x: -47.8458462; skew-y: -47.8297227; scale-x: 0.995339253; scale-y: 0.995733747; cel: -1; alpha: 1; }
        frame 60 { x: 47.6618738; y: -18.123038; skew-x: -47.8047648; skew-y: -47.7959461; scale-x: 0.997600378; scale-y: 0.996249293; cel: -1; alpha: 1; }
        frame 61 { x: 47.6473921; y: -17.8274371; skew-x: -47.9860001; skew-y: -47.9285533; scale-x: 0.995904998; scale-y: 0.996367066; cel: -1; alpha: 1; }
        frame 62 { x: 47.6298139; y: -17.638714; skew-x: -47.7979242; skew-y: -47.8191183; scale-x: 0.99739758; scale-y: 0.996805308; cel: -1; alpha: 1; }
        frame 63 { x: 47.5143929; y: -17.384772; skew-x: -47.8385832; skew-y: -47.8782018; scale-x: 0.997608262; scale-y: 0.99589177; cel: -1; alpha: 1; }
        frame 64 { x: 47.4754451; y: -17.2505692; skew-x: -47.8522591; skew-y: -47.8648009; scale-x: 0.996832342; scale-y: 0.995563016; cel: -1; alpha: 1; }
        frame 65 { x: 47.2830036; y: -17.0298112; skew-x: -47.816376; skew-y: -47.7864022; scale-x: 0.996269168; scale-y: 0.997430476; cel: -1; alpha: 1; }
        frame 66 { x: 47.1037342; y: -17.2184595; skew-x: -47.9831058; skew-y: -47.9726023; scale-x: 0.996586285; scale-y: 0.995474102; cel: -1; alpha: 1; }
        frame 67 { x: 46.8437556; y: -17.2176319; skew-x: -47.9788731; skew-y: -47.914216; scale-x: 0.996236949; scale-y: 0.996297692; cel: -1; alpha: 1; }
        frame 68 { x: 46.7083416; y: -17.4708538; skew-x: -47.8866449; skew-y: -47.9369745; scale-x: 0.996746218; scale-y: 0.995827386; cel: -1; alpha: 1; }
        frame 69 { x: 46.4381434; y: -17.4108711; skew-x: -47.9911708; skew-y: -47.8755048; scale-x: 0.995615266; scale-y: 0.996497239; cel: -1; alpha: 1; }
        frame 70 { x: 46.3251951; y: -17.8595291; skew-x: -47.8014359; skew-y: -47.8014304; scale-x: 0.997000931; scale-y: 0.997000897; cel: -1; alpha: 1; }
        frame 71 { x: 46.2721405; y: -17.8595341; skew-x: -47.8014359; skew-y: -47.8014304; scale-x: 0.997000931; scale-y: 0.997000897; cel: -1; alpha: 1; }
        frame 72 { x: 45.3345643; y: -17.7162459; skew-x: -47.8289667; skew-y: -47.8289619; scale-x: 0.995297593; scale-y: 0.995297557; cel: -1; alpha: 1; }
        frame 73 { x: 44.3193125; y: -17.5218546; skew-x: -47.8564976; skew-y: -47.8564932; scale-x: 0.995590422; scale-y: 0.995590389; cel: -1; alpha: 1; }
        frame 74 { x: 43.380355; y: -17.5484655; skew-x: -47.7840286; skew-y: -47.7840245; scale-x: 0.995883422; scale-y: 0.995883394; cel: -1; alpha: 1; }
        frame 75 { x: 42.4839684; y: -17.525008; skew-x: -47.8115597; skew-y: -47.8115557; scale-x: 0.995177421; scale-y: 0.995177398; cel: -1; alpha: 1; }
        frame 76 { x: 41.5570855; y: -17.8417591; skew-x: -47.7390909; skew-y: -47.7390868; scale-x: 0.995470471; scale-y: 0.995470455; cel: -1; alpha: 1; }
        frame 77 { x: 40.5502; y: -17.820717; skew-x: -47.8666222; skew-y: -47.8666177; scale-x: 0.995763695; scale-y: 0.995763684; cel: -1; alpha: 1; }
        frame 78 { x: 39.7901403; y: -18.3952923; skew-x: -47.6941536; skew-y: -47.6941486; scale-x: 0.995057035; scale-y: 0.995057027; cel: -1; alpha: 1; }
        frame 79 { x: 38.689616; y: -18.6135776; skew-x: -47.8216851; skew-y: -47.8216793; scale-x: 0.997351017; scale-y: 0.997351009; cel: -1; alpha: 1; }
        frame 80 { x: 38.5431597; y: -18.9764686; skew-x: -47.6785724; skew-y: -47.6785671; scale-x: 0.995540852; scale-y: 0.995540822; cel: -1; alpha: 1; }
        frame 81 { x: 38.1094755; y: -18.9748198; skew-x: -47.7354596; skew-y: -47.735455; scale-x: 0.995731463; scale-y: 0.995731414; cel: -1; alpha: 1; }
        frame 82 { x: 37.6964965; y: -18.8640328; skew-x: -47.7923468; skew-y: -47.792343; scale-x: 0.995922145; scale-y: 0.99592208; cel: -1; alpha: 1; }
        frame 83 { x: 37.4399885; y: -19.1451877; skew-x: -47.7492338; skew-y: -47.7492311; scale-x: 0.996112899; scale-y: 0.996112821; cel: -1; alpha: 1; }
        frame 84 { x: 36.9924145; y: -19.4164446; skew-x: -47.8061208; skew-y: -47.8061192; scale-x: 0.996303724; scale-y: 0.996303637; cel: -1; alpha: 1; }
        frame 85 { x: 36.8285554; y: -19.6872126; skew-x: -47.7630078; skew-y: -47.7630074; scale-x: 0.99649462; scale-y: 0.996494528; cel: -1; alpha: 1; }
        frame 86 { x: 37.5633873; y: -19.4466079; skew-x: -47.730922; skew-y: -47.730919; scale-x: 0.995842565; scale-y: 0.995842489; cel: -1; alpha: 1; }
        frame 87 { x: 38.040475; y: -19.2928107; skew-x: -47.7988302; skew-y: -47.7988252; scale-x: 0.99719718; scale-y: 0.99719714; cel: -1; alpha: 1; }
        frame 88 { x: 39.953204; y: -18.237584; skew-x: -47.8430673; skew-y: -47.8430626; scale-x: 0.995863842; scale-y: 0.995863828; cel: -1; alpha: 1; }
        frame 89 { x: 41.648192; y: -17.9614933; skew-x: -47.7873042; skew-y: -47.7873002; scale-x: 0.996538515; scale-y: 0.996538521; cel: -1; alpha: 1; }
        frame 90 { x: 46.8991788; y: -18.6744195; skew-x: -47.8556096; skew-y: -47.8556082; scale-x: 0.997342569; scale-y: 0.997342588; cel: -1; alpha: 1; }
        frame 91 { x: 49.6840672; y: -20.7941195; skew-x: -47.7374243; skew-y: -47.7374235; scale-x: 0.996573968; scale-y: 0.99657399; cel: -1; alpha: 1; }
        frame 92 { x: 49.6852657; y: -20.7671717; skew-x: -47.7374164; skew-y: -47.7374156; scale-x: 0.996573968; scale-y: 0.996573991; cel: -1; alpha: 1; }
        frame 93 { x: 49.6863833; y: -20.675926; skew-x: -47.7374164; skew-y: -47.7374156; scale-x: 0.996573968; scale-y: 0.996573991; cel: -1; alpha: 1; }
        frame 94 { x: 49.6874849; y: -20.5846754; skew-x: -47.7374164; skew-y: -47.7374156; scale-x: 0.996573968; scale-y: 0.996573991; cel: -1; alpha: 1; }
        frame 95 { x: 49.6866281; y: -20.8778713; skew-x: -47.7374164; skew-y: -47.7374156; scale-x: 0.996573968; scale-y: 0.996573991; cel: -1; alpha: 1; }
        frame 96 { x: 49.6852818; y: -20.7671787; skew-x: -47.7374164; skew-y: -47.7374156; scale-x: 0.996573968; scale-y: 0.996573991; cel: -1; alpha: 1; }
        frame 97 { x: 49.313816; y: -20.2240827; skew-x: -47.6751288; skew-y: -47.6751272; scale-x: 0.996348156; scale-y: 0.996348179; cel: -1; alpha: 1; }
        frame 98 { x: 48.8249307; y: -19.7151798; skew-x: -47.7128468; skew-y: -47.7128443; scale-x: 0.997127057; scale-y: 0.997127078; cel: -1; alpha: 1; }
        frame 99 { x: 48.4066869; y: -19.3119335; skew-x: -47.6505647; skew-y: -47.6505614; scale-x: 0.996901121; scale-y: 0.996901136; cel: -1; alpha: 1; }
        frame 100 { x: 47.8094771; y: -18.8440126; skew-x: -47.9882826; skew-y: -47.9882786; scale-x: 0.996675743; scale-y: 0.99667575; cel: -1; alpha: 1; }
        frame 101 { x: 47.403553; y: -18.580072; skew-x: -47.9260005; skew-y: -47.9259958; scale-x: 0.99645092; scale-y: 0.996450916; cel: -1; alpha: 1; }
        frame 102 { x: 46.8147156; y: -18.1494074; skew-x: -47.9637182; skew-y: -47.9637131; scale-x: 0.996226651; scale-y: 0.996226633; cel: -1; alpha: 1; }
        frame 103 { x: 46.2721405; y: -17.8595341; skew-x: -47.8014359; skew-y: -47.8014304; scale-x: 0.997000931; scale-y: 0.997000897; cel: -1; alpha: 1; }
        frame 104 { x: 46.2721405; y: -17.8595341; skew-x: -47.8014359; skew-y: -47.8014304; scale-x: 0.997000931; scale-y: 0.997000897; cel: -1; alpha: 1; }
        frame 105 { x: 46.5765374; y: -17.8504983; skew-x: -47.8437823; skew-y: -47.843777; scale-x: 0.995668411; scale-y: 0.995668385; cel: -1; alpha: 1; }
        frame 106 { x: 46.6484754; y: -18.0578602; skew-x: -47.7861286; skew-y: -47.7861236; scale-x: 0.996332774; scale-y: 0.996332755; cel: -1; alpha: 1; }
        frame 107 { x: 47.0428454; y: -18.0048374; skew-x: -47.9284749; skew-y: -47.9284702; scale-x: 0.995998027; scale-y: 0.995998014; cel: -1; alpha: 1; }
        frame 108 { x: 47.2914564; y: -18.0461814; skew-x: -47.8708212; skew-y: -47.8708169; scale-x: 0.996663499; scale-y: 0.996663492; cel: -1; alpha: 1; }
        frame 109 { x: 47.5061621; y: -18.1845695; skew-x: -47.9131675; skew-y: -47.9131635; scale-x: 0.996328526; scale-y: 0.996328525; cel: -1; alpha: 1; }
        frame 110 { x: 47.6544501; y: -18.3845967; skew-x: -47.8555137; skew-y: -47.8555102; scale-x: 0.995993104; scale-y: 0.995993108; cel: -1; alpha: 1; }
        frame 111 { x: 47.9651259; y: -18.2888548; skew-x: -47.99786; skew-y: -47.9978568; scale-x: 0.99665991; scale-y: 0.996659918; cel: -1; alpha: 1; }
        frame 112 { x: 48.0117815; y: -18.7272438; skew-x: -47.8402055; skew-y: -47.8402028; scale-x: 0.99732761; scale-y: 0.997327622; cel: -1; alpha: 1; }
        frame 113 { x: 48.4016971; y: -18.9689223; skew-x: -47.7648664; skew-y: -47.764864; scale-x: 0.99650789; scale-y: 0.996507905; cel: -1; alpha: 1; }
        frame 114 { x: 48.7610521; y: -19.3483204; skew-x: -47.5895273; skew-y: -47.5895253; scale-x: 0.996691586; scale-y: 0.996691604; cel: -1; alpha: 1; }
        frame 115 { x: 49.2510506; y: -19.5368378; skew-x: -47.6141882; skew-y: -47.6141866; scale-x: 0.99687535; scale-y: 0.996875369; cel: -1; alpha: 1; }
        frame 116 { x: 49.7159114; y: -19.7854781; skew-x: -47.738849; skew-y: -47.7388479; scale-x: 0.997059183; scale-y: 0.997059203; cel: -1; alpha: 1; }
        frame 117 { x: 50.0169127; y: -20.0891015; skew-x: -47.6635074; skew-y: -47.6635067; scale-x: 0.997243084; scale-y: 0.997243103; cel: -1; alpha: 1; }
        frame 118 { x: 50.0506321; y: -21.9139132; skew-x: -43.4791431; skew-y: -43.4791433; scale-x: 0.996403458; scale-y: 0.996403474; cel: -1; alpha: 1; }
        frame 119 { x: 50.0113969; y: -22.9597437; skew-x: -39.194779; skew-y: -39.1947798; scale-x: 0.996568162; scale-y: 0.996568171; cel: -1; alpha: 1; }
        frame 120 { x: 48.6910202; y: -22.8708335; skew-x: -35.0104148; skew-y: -35.0104163; scale-x: 0.995728151; scale-y: 0.995728149; cel: -1; alpha: 1; }
        frame 121 { x: 46.9357599; y: -22.2976587; skew-x: -30.9260545; skew-y: -30.9260564; scale-x: 0.996897738; scale-y: 0.996897723; cel: -1; alpha: 1; }
        frame 122 { x: 46.830969; y: -22.3364732; skew-x: -30.7260545; skew-y: -30.7260564; scale-x: 0.995892801; scale-y: 0.995892786; cel: -1; alpha: 1; }
        frame 123 { x: 46.9357645; y: -22.2976518; skew-x: -30.9260249; skew-y: -30.9260268; scale-x: 0.996897739; scale-y: 0.996897724; cel: -1; alpha: 1; }
        frame 124 { x: 39.9839203; y: -23.0307586; skew-x: -21.2620644; skew-y: -21.2620664; scale-x: 0.995610681; scale-y: 0.995610632; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_INNERLEG_UPPER; }
        frame 125 { x: 29.8288626; y: -30.5512468; skew-x: -29.3682222; skew-y: -29.3682242; scale-x: 0.994943478; scale-y: 0.994943428; cel: 0; alpha: 1; }
        frame 126 { x: 19.2637599; y: -38.4658082; skew-x: -37.6743801; skew-y: -37.674382; scale-x: 0.994276082; scale-y: 0.994276031; cel: 0; alpha: 1; }
        frame 127 { x: 8.16407927; y: -45.3054485; skew-x: -45.7805379; skew-y: -45.7805398; scale-x: 0.994615189; scale-y: 0.994615137; cel: 0; alpha: 1; }
        frame 128 { x: -1.91407419; y: -50.9320716; skew-x: -53.986701; skew-y: -53.9867028; scale-x: 0.99495479; scale-y: 0.994954737; cel: 0; alpha: 1; }
        frame 129 { x: -58.6647968; y: -53.9700125; skew-x: -55.8865734; skew-y: -55.8865758; scale-x: 0.993950349; scale-y: 0.99395032; cel: 0; alpha: 1; }
        frame 130 { x: -115.588946; y: -56.9203313; skew-x: -57.7864435; skew-y: -57.7864463; scale-x: 0.994959994; scale-y: 0.99495999; cel: 0; alpha: 1; }
        frame 131 { x: -115.588946; y: -56.9203313; skew-x: -57.7864435; skew-y: -57.7864463; scale-x: 0.994959994; scale-y: 0.99495999; cel: -1; alpha: 1; }
        frame 132 { x: -115.588946; y: -56.9203313; skew-x: -57.7864435; skew-y: -57.7864463; scale-x: 0.994959994; scale-y: 0.99495999; cel: -1; alpha: 1; }
        frame 133 { x: -115.588946; y: -56.9203313; skew-x: -57.7864435; skew-y: -57.7864463; scale-x: 0.994959994; scale-y: 0.99495999; cel: -1; alpha: 1; }
        frame 134 { x: -115.588946; y: -56.9203313; skew-x: -57.7864435; skew-y: -57.7864463; scale-x: 0.994959994; scale-y: 0.99495999; cel: -1; alpha: 1; }
        frame 135 { x: -115.588946; y: -56.9203313; skew-x: -57.7864435; skew-y: -57.7864463; scale-x: 0.994959994; scale-y: 0.99495999; cel: -1; alpha: 1; }
        frame 136 { x: -115.588946; y: -56.9203313; skew-x: -57.7864435; skew-y: -57.7864463; scale-x: 0.994959994; scale-y: 0.99495999; cel: -1; alpha: 1; }
        frame 137 { x: -115.588946; y: -56.9203313; skew-x: -57.7864435; skew-y: -57.7864463; scale-x: 0.994959994; scale-y: 0.99495999; cel: -1; alpha: 1; }
        frame 138 { x: 44.7923379; y: -13.5084036; skew-x: -52.2714434; skew-y: -50.9284714; scale-x: 0.989466815; scale-y: 0.977443587; cel: -1; alpha: 1; }
        frame 139 { x: 44.046181; y: -16.42541; skew-x: -50.7539981; skew-y: -49.8570757; scale-x: 0.991289809; scale-y: 0.981140884; cel: -1; alpha: 1; }
        frame 140 { x: 43.4505182; y: -19.633156; skew-x: -49.1222483; skew-y: -48.5998176; scale-x: 0.993391242; scale-y: 0.986627343; cel: -1; alpha: 1; }
        frame 141 { x: 43.3800672; y: -23.1404804; skew-x: -47.5777675; skew-y: -47.3535006; scale-x: 0.995796447; scale-y: 0.993910071; cel: -1; alpha: 1; }
        frame 142 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 143 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 144 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 145 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 146 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 147 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 148 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 149 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 150 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 151 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 152 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 153 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 154 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 155 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 156 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 157 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 158 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 159 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 160 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 161 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 162 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 163 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 164 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 165 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 166 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 167 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 168 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 169 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 170 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 171 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 172 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 173 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 174 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 175 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 176 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 177 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 178 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 179 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 180 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 181 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 182 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 183 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 184 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 185 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 186 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 187 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 188 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 189 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 190 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 191 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 192 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 193 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 194 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 195 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
        frame 196 { x: 41.2639849; y: -27.4386012; skew-x: -47.8010871; skew-y: -47.7942746; scale-x: 0.996967219; scale-y: 0.997399725; cel: -1; alpha: 1; }
    }
    Track {
        source-name: "Zombie_imp_outerleg_foot";
        frame-count: 197;
        frame 0 { x: 69.0969613; y: -9.3002788; skew-x: -90.2913501; skew-y: -90.2667644; scale-x: 0.998531493; scale-y: 0.998543824; cel: -1; alpha: 1; }
        frame 1 { x: 69.2560118; y: -9.32175582; skew-x: -90.3937914; skew-y: -90.3903926; scale-x: 0.998432163; scale-y: 0.99734291; cel: -1; alpha: 1; }
        frame 2 { x: 69.293251; y: -9.27540584; skew-x: -90.3295607; skew-y: -90.3788169; scale-x: 0.998072209; scale-y: 0.99849256; cel: -1; alpha: 1; }
        frame 3 { x: 69.4916839; y: -9.21917657; skew-x: -90.3458247; skew-y: -90.3879111; scale-x: 0.998049746; scale-y: 0.998249745; cel: -1; alpha: 1; }
        frame 4 { x: 69.4245539; y: -9.27091763; skew-x: -90.2623832; skew-y: -90.2968535; scale-x: 0.998023022; scale-y: 0.998008116; cel: -1; alpha: 1; }
        frame 5 { x: 69.6229115; y: -9.3214124; skew-x: -90.2792314; skew-y: -90.3056469; scale-x: 0.997991964; scale-y: 0.997767728; cel: -1; alpha: 1; }
        frame 6 { x: 69.8885325; y: -9.27903626; skew-x: -90.396365; skew-y: -90.4142937; scale-x: 0.997956499; scale-y: 0.997528639; cel: -1; alpha: 1; }
        frame 7 { x: 69.9965654; y: -9.23979263; skew-x: -90.4227732; skew-y: -90.4092709; scale-x: 0.997954791; scale-y: 0.998255959; cel: -1; alpha: 1; }
        frame 8 { x: 70.1890489; y: -9.27307208; skew-x: -90.4327489; skew-y: -90.2246133; scale-x: 0.998405342; scale-y: 0.997204679; cel: -1; alpha: 1; }
        frame 9 { x: 70.2287637; y: -9.26857158; skew-x: -90.3568905; skew-y: -90.3262279; scale-x: 0.997853742; scale-y: 0.997785684; cel: -1; alpha: 1; }
        frame 10 { x: 70.1669298; y: -9.28946614; skew-x: -90.2743153; skew-y: -90.2345812; scale-x: 0.998795976; scale-y: 0.998546405; cel: -1; alpha: 1; }
        frame 11 { x: 70.0235492; y: -9.34193857; skew-x: -90.2853913; skew-y: -90.3107184; scale-x: 0.997717779; scale-y: 0.997718834; cel: -1; alpha: 1; }
        frame 12 { x: 69.8876269; y: -9.25516475; skew-x: -90.2966123; skew-y: -90.3865456; scale-x: 0.9976112; scale-y: 0.997889658; cel: -1; alpha: 1; }
        frame 13 { x: 69.9120044; y: -9.34356134; skew-x: -90.4006422; skew-y: -90.3694405; scale-x: 0.998008238; scale-y: 0.997253423; cel: -1; alpha: 1; }
        frame 14 { x: 69.7807814; y: -9.34304346; skew-x: -90.4170567; skew-y: -90.3355676; scale-x: 0.998213673; scale-y: 0.997981171; cel: -1; alpha: 1; }
        frame 15 { x: 69.6441963; y: -9.26088777; skew-x: -90.428632; skew-y: -90.4110923; scale-x: 0.998088144; scale-y: 0.998159034; cel: -1; alpha: 1; }
        frame 16 { x: 69.5413839; y: -9.38090632; skew-x: -90.3404239; skew-y: -90.3861955; scale-x: 0.997934915; scale-y: 0.998341366; cel: -1; alpha: 1; }
        frame 17 { x: 69.403122; y: -9.39363831; skew-x: -90.347366; skew-y: -90.365989; scale-x: 0.998100988; scale-y: 0.998106525; cel: -1; alpha: 1; }
        frame 18 { x: 69.2006044; y: -9.31712391; skew-x: -90.2538338; skew-y: -90.2460764; scale-x: 0.998279656; scale-y: 0.997869441; cel: -1; alpha: 1; }
        frame 19 { x: 69.1673009; y: -9.35089568; skew-x: -90.2714427; skew-y: -90.414751; scale-x: 0.997697158; scale-y: 0.998488991; cel: -1; alpha: 1; }
        frame 20 { x: 69.0031329; y: -9.3955407; skew-x: -90.3849445; skew-y: -90.3866268; scale-x: 0.997329503; scale-y: 0.997762006; cel: -1; alpha: 1; }
        frame 21 { x: 69.0969613; y: -9.3002788; skew-x: -90.2913501; skew-y: -90.2667644; scale-x: 0.998531493; scale-y: 0.998543824; cel: -1; alpha: 1; }
        frame 22 { x: 69.5080674; y: -9.33133705; skew-x: -90.2577185; skew-y: -90.257719; scale-x: 0.998679615; scale-y: 0.998679501; cel: -1; alpha: 1; }
        frame 23 { x: 69.1399577; y: -8.99098729; skew-x: -90.3802448; skew-y: -90.2802782; scale-x: 0.998866427; scale-y: 0.996614582; cel: -1; alpha: 1; }
        frame 24 { x: 68.4736339; y: -8.98501908; skew-x: -90.268618; skew-y: -90.2362742; scale-x: 0.997396313; scale-y: 0.997264655; cel: -1; alpha: 1; }
        frame 25 { x: 67.865008; y: -8.96818253; skew-x: -90.2519243; skew-y: -90.2982588; scale-x: 0.996549023; scale-y: 0.998341621; cel: -1; alpha: 1; }
        frame 26 { x: 67.3836471; y: -8.91797629; skew-x: -90.3101065; skew-y: -90.2833022; scale-x: 0.996474977; scale-y: 0.997545033; cel: -1; alpha: 1; }
        frame 27 { x: 66.8712717; y: -8.97002837; skew-x: -90.2066061; skew-y: -90.2354507; scale-x: 0.998708835; scale-y: 0.99841711; cel: -1; alpha: 1; }
        frame 28 { x: 66.778301; y: -9.05528754; skew-x: -90.2388849; skew-y: -90.2243542; scale-x: 0.997380327; scale-y: 0.996539995; cel: -1; alpha: 1; }
        frame 29 { x: 66.616909; y: -9.1641951; skew-x: -90.2428893; skew-y: -90.2443709; scale-x: 0.997629068; scale-y: 0.996097578; cel: -1; alpha: 1; }
        frame 30 { x: 66.3854894; y: -9.24828485; skew-x: -90.1919066; skew-y: -90.218953; scale-x: 0.997027441; scale-y: 0.99655624; cel: -1; alpha: 1; }
        frame 31 { x: 66.3053564; y: -9.30818232; skew-x: -90.275792; skew-y: -90.2575386; scale-x: 0.998610485; scale-y: 0.995788524; cel: -1; alpha: 1; }
        frame 32 { x: 65.9216716; y: -9.36966839; skew-x: -90.3053198; skew-y: -90.2514722; scale-x: 0.998656033; scale-y: 0.998661628; cel: -1; alpha: 1; }
        frame 33 { x: 66.353992; y: -9.20387375; skew-x: -90.2462652; skew-y: -90.2329596; scale-x: 0.997818626; scale-y: 0.996747803; cel: -1; alpha: 1; }
        frame 34 { x: 66.3271095; y: -9.01356575; skew-x: -90.2644465; skew-y: -90.2359367; scale-x: 0.998664961; scale-y: 0.998319352; cel: -1; alpha: 1; }
        frame 35 { x: 68.7465649; y: -9.29025082; skew-x: -90.3356512; skew-y: -90.2831151; scale-x: 0.997424448; scale-y: 0.99681304; cel: -1; alpha: 1; }
        frame 36 { x: 70.9859939; y: -10.4913805; skew-x: -90.2180723; skew-y: -90.218072; scale-x: 0.998808145; scale-y: 0.998808133; cel: -1; alpha: 1; }
        frame 37 { x: 71.2415229; y: -10.3078392; skew-x: -90.222267; skew-y: -90.2801186; scale-x: 0.998114961; scale-y: 0.998230705; cel: -1; alpha: 1; }
        frame 38 { x: 71.44495; y: -10.2853231; skew-x: -90.126112; skew-y: -90.2424634; scale-x: 0.998495272; scale-y: 0.998674447; cel: -1; alpha: 1; }
        frame 39 { x: 71.3418959; y: -9.96467489; skew-x: -90.3193437; skew-y: -90.3238463; scale-x: 0.998412736; scale-y: 0.99841717; cel: -1; alpha: 1; }
        frame 40 { x: 71.1575696; y: -9.61128345; skew-x: -90.3119354; skew-y: -90.3057936; scale-x: 0.998370614; scale-y: 0.99827918; cel: -1; alpha: 1; }
        frame 41 { x: 70.9250724; y: -9.45761216; skew-x: -90.3037266; skew-y: -90.2884698; scale-x: 0.998352441; scale-y: 0.998122916; cel: -1; alpha: 1; }
        frame 42 { x: 70.8730119; y: -9.14617606; skew-x: -90.4054164; skew-y: -90.3827485; scale-x: 0.998477295; scale-y: 0.997360052; cel: -1; alpha: 1; }
        frame 43 { x: 70.6482506; y: -8.84817777; skew-x: -90.4240273; skew-y: -90.4570661; scale-x: 0.998293559; scale-y: 0.998013707; cel: -1; alpha: 1; }
        frame 44 { x: 70.4402458; y: -8.60168392; skew-x: -90.3371287; skew-y: -90.3365639; scale-x: 0.997475679; scale-y: 0.997188003; cel: -1; alpha: 1; }
        frame 45 { x: 70.1828003; y: -8.41963821; skew-x: -90.3499594; skew-y: -90.3160031; scale-x: 0.997682511; scale-y: 0.997330697; cel: -1; alpha: 1; }
        frame 46 { x: 70.1244409; y: -8.22785473; skew-x: -90.2725054; skew-y: -90.2854445; scale-x: 0.998466001; scale-y: 0.999057269; cel: -1; alpha: 1; }
        frame 47 { x: 69.6822217; y: -8.34494075; skew-x: -90.2983374; skew-y: -90.3725554; scale-x: 0.997373322; scale-y: 0.997571757; cel: -1; alpha: 1; }
        frame 48 { x: 69.2112093; y: -8.50098172; skew-x: -90.3430232; skew-y: -90.3313313; scale-x: 0.997154776; scale-y: 0.997080276; cel: -1; alpha: 1; }
        frame 49 { x: 68.6993482; y: -8.65155348; skew-x: -90.361041; skew-y: -90.3212268; scale-x: 0.997898011; scale-y: 0.996667532; cel: -1; alpha: 1; }
        frame 50 { x: 68.2242888; y: -9.03466056; skew-x: -90.2334301; skew-y: -90.2565937; scale-x: 0.997155902; scale-y: 0.997903509; cel: -1; alpha: 1; }
        frame 51 { x: 67.3579533; y: -9.2325311; skew-x: -90.2453975; skew-y: -90.25219; scale-x: 0.998924616; scale-y: 0.998498249; cel: -1; alpha: 1; }
        frame 52 { x: 66.8051386; y: -8.96951787; skew-x: -90.3255311; skew-y: -90.3548653; scale-x: 0.996180366; scale-y: 0.997439775; cel: -1; alpha: 1; }
        frame 53 { x: 66.1784698; y: -8.9680925; skew-x: -90.2642912; skew-y: -90.2999269; scale-x: 0.997815889; scale-y: 0.995591706; cel: -1; alpha: 1; }
        frame 54 { x: 65.258536; y: -8.85247482; skew-x: -90.2920838; skew-y: -90.2477944; scale-x: 0.996170563; scale-y: 0.999059146; cel: -1; alpha: 1; }
        frame 55 { x: 64.6272682; y: -8.86378505; skew-x: -90.2092293; skew-y: -90.2134731; scale-x: 0.997687507; scale-y: 0.997076901; cel: -1; alpha: 1; }
        frame 56 { x: 63.7283688; y: -8.88272153; skew-x: -90.2429685; skew-y: -90.2640112; scale-x: 0.998692532; scale-y: 0.998129194; cel: -1; alpha: 1; }
        frame 57 { x: 65.3786761; y: -8.96638335; skew-x: -90.2971481; skew-y: -90.2857972; scale-x: 0.997333568; scale-y: 0.995878804; cel: -1; alpha: 1; }
        frame 58 { x: 66.6630909; y: -8.97760195; skew-x: -90.2826712; skew-y: -90.2858069; scale-x: 0.998615066; scale-y: 0.998223933; cel: -1; alpha: 1; }
        frame 59 { x: 68.6227752; y: -8.90637038; skew-x: -90.3060908; skew-y: -90.2820431; scale-x: 0.997334954; scale-y: 0.997090378; cel: -1; alpha: 1; }
        frame 60 { x: 70.8338229; y: -9.6093037; skew-x: -90.2183688; skew-y: -90.2949296; scale-x: 0.998740136; scale-y: 0.998466126; cel: -1; alpha: 1; }
        frame 61 { x: 70.8246308; y: -9.35910577; skew-x: -90.4293462; skew-y: -90.3977498; scale-x: 0.998291098; scale-y: 0.997335516; cel: -1; alpha: 1; }
        frame 62 { x: 70.8169996; y: -9.12112278; skew-x: -90.2469139; skew-y: -90.2826877; scale-x: 0.998622631; scale-y: 0.998937819; cel: -1; alpha: 1; }
        frame 63 { x: 70.6983069; y: -8.90462019; skew-x: -90.2637581; skew-y: -90.3655365; scale-x: 0.998161087; scale-y: 0.998694718; cel: -1; alpha: 1; }
        frame 64 { x: 70.6436943; y: -8.76766247; skew-x: -90.2778962; skew-y: -90.351723; scale-x: 0.997822779; scale-y: 0.997926759; cel: -1; alpha: 1; }
        frame 65 { x: 70.4628025; y: -8.48712462; skew-x: -90.2922347; skew-y: -90.2230827; scale-x: 0.998737009; scale-y: 0.998319119; cel: -1; alpha: 1; }
        frame 66 { x: 70.2820925; y: -8.78132079; skew-x: -90.4027509; skew-y: -90.4655429; scale-x: 0.997847848; scale-y: 0.997566266; cel: -1; alpha: 1; }
        frame 67 { x: 70.0188925; y: -8.74763491; skew-x: -90.4074517; skew-y: -90.3982013; scale-x: 0.998503035; scale-y: 0.997386735; cel: -1; alpha: 1; }
        frame 68 { x: 69.895765; y: -9.00838023; skew-x: -90.3395357; skew-y: -90.396609; scale-x: 0.997568674; scale-y: 0.998359757; cel: -1; alpha: 1; }
        frame 69 { x: 69.6009997; y: -8.92334644; skew-x: -90.4200221; skew-y: -90.3591145; scale-x: 0.998697823; scale-y: 0.996769524; cel: -1; alpha: 1; }
        frame 70 { x: 69.5080674; y: -9.33133705; skew-x: -90.2577185; skew-y: -90.257719; scale-x: 0.998679615; scale-y: 0.998679501; cel: -1; alpha: 1; }
        frame 71 { x: 69.4550129; y: -9.33134209; skew-x: -90.2577185; skew-y: -90.257719; scale-x: 0.998679615; scale-y: 0.998679501; cel: -1; alpha: 1; }
        frame 72 { x: 68.4819178; y: -9.21374555; skew-x: -90.2852495; skew-y: -90.2852502; scale-x: 0.996973402; scale-y: 0.996973299; cel: -1; alpha: 1; }
        frame 73 { x: 67.4775605; y: -9.02797948; skew-x: -90.3127807; skew-y: -90.3127813; scale-x: 0.997266721; scale-y: 0.997266627; cel: -1; alpha: 1; }
        frame 74 { x: 66.5346536; y: -9.02279774; skew-x: -90.2403119; skew-y: -90.2403123; scale-x: 0.997560214; scale-y: 0.997560126; cel: -1; alpha: 1; }
        frame 75 { x: 65.6259437; y: -9.0165032; skew-x: -90.2678432; skew-y: -90.2678432; scale-x: 0.996853026; scale-y: 0.99685294; cel: -1; alpha: 1; }
        frame 76 { x: 64.6950921; y: -9.30147639; skew-x: -90.1953745; skew-y: -90.1953742; scale-x: 0.997146574; scale-y: 0.997146486; cel: -1; alpha: 1; }
        frame 77 { x: 63.7139797; y: -9.32945633; skew-x: -90.3229058; skew-y: -90.3229051; scale-x: 0.997440297; scale-y: 0.997440203; cel: -1; alpha: 1; }
        frame 78 { x: 62.9118347; y: -9.84041905; skew-x: -90.1504371; skew-y: -90.1504361; scale-x: 0.996732453; scale-y: 0.996732351; cel: -1; alpha: 1; }
        frame 79 { x: 61.8836427; y: -10.0905871; skew-x: -90.2779683; skew-y: -90.2779672; scale-x: 0.999030304; scale-y: 0.999030188; cel: -1; alpha: 1; }
        frame 80 { x: 61.6737675; y: -10.4111455; skew-x: -90.1348552; skew-y: -90.1348554; scale-x: 0.997217077; scale-y: 0.997216968; cel: -1; alpha: 1; }
        frame 81 { x: 61.2530062; y: -10.4308315; skew-x: -90.1917422; skew-y: -90.1917436; scale-x: 0.997407994; scale-y: 0.997407895; cel: -1; alpha: 1; }
        frame 82 { x: 60.8529324; y: -10.341396; skew-x: -90.2486292; skew-y: -90.2486317; scale-x: 0.997598983; scale-y: 0.997598897; cel: -1; alpha: 1; }
        frame 83 { x: 60.594439; y: -10.6034938; skew-x: -90.2055164; skew-y: -90.2055197; scale-x: 0.997790043; scale-y: 0.997789974; cel: -1; alpha: 1; }
        frame 84 { x: 60.1597718; y: -10.8961126; skew-x: -90.2624036; skew-y: -90.2624075; scale-x: 0.997981175; scale-y: 0.997981125; cel: -1; alpha: 1; }
        frame 85 { x: 59.993933; y: -11.147815; skew-x: -90.219291; skew-y: -90.2192953; scale-x: 0.99817238; scale-y: 0.998172351; cel: -1; alpha: 1; }
        frame 86 { x: 60.7088235; y: -10.8998342; skew-x: -90.1872045; skew-y: -90.1872076; scale-x: 0.997519257; scale-y: 0.997519183; cel: -1; alpha: 1; }
        frame 87 { x: 61.2275227; y: -10.7618857; skew-x: -90.2551128; skew-y: -90.2551136; scale-x: 0.998876187; scale-y: 0.998876081; cel: -1; alpha: 1; }
        frame 88 { x: 63.11582; y: -9.73594624; skew-x: -90.2993507; skew-y: -90.2993502; scale-x: 0.997540613; scale-y: 0.997540515; cel: -1; alpha: 1; }
        frame 89 { x: 64.8182098; y: -9.43154145; skew-x: -90.2435886; skew-y: -90.2435869; scale-x: 0.998216424; scale-y: 0.998216341; cel: -1; alpha: 1; }
        frame 90 { x: 70.098053; y: -10.1652365; skew-x: -90.3118955; skew-y: -90.3118934; scale-x: 0.999021817; scale-y: 0.999021778; cel: -1; alpha: 1; }
        frame 91 { x: 72.8474755; y: -12.2436963; skew-x: -90.1937106; skew-y: -90.1937083; scale-x: 0.998251918; scale-y: 0.99825189; cel: -1; alpha: 1; }
        frame 92 { x: 72.8486728; y: -12.2167453; skew-x: -90.1937027; skew-y: -90.1937004; scale-x: 0.998251918; scale-y: 0.998251891; cel: -1; alpha: 1; }
        frame 93 { x: 72.8497905; y: -12.1254997; skew-x: -90.1937027; skew-y: -90.1937004; scale-x: 0.998251918; scale-y: 0.998251891; cel: -1; alpha: 1; }
        frame 94 { x: 72.850892; y: -12.034249; skew-x: -90.1937027; skew-y: -90.1937004; scale-x: 0.998251918; scale-y: 0.998251891; cel: -1; alpha: 1; }
        frame 95 { x: 72.8500353; y: -12.327445; skew-x: -90.1937027; skew-y: -90.1937004; scale-x: 0.998251918; scale-y: 0.998251891; cel: -1; alpha: 1; }
        frame 96 { x: 72.8486889; y: -12.2167524; skew-x: -90.1937027; skew-y: -90.1937004; scale-x: 0.998251918; scale-y: 0.998251891; cel: -1; alpha: 1; }
        frame 97 { x: 72.4626674; y: -11.6504228; skew-x: -90.1314148; skew-y: -90.1314123; scale-x: 0.998025733; scale-y: 0.998025691; cel: -1; alpha: 1; }
        frame 98 { x: 71.9975221; y: -11.1500699; skew-x: -90.1691323; skew-y: -90.1691299; scale-x: 0.998805952; scale-y: 0.998805895; cel: -1; alpha: 1; }
        frame 99 { x: 71.5647053; y: -10.7235857; skew-x: -90.1068497; skew-y: -90.1068475; scale-x: 0.99857964; scale-y: 0.998579568; cel: -1; alpha: 1; }
        frame 100 { x: 71.0124679; y: -10.3942239; skew-x: -90.444567; skew-y: -90.4445653; scale-x: 0.998353885; scale-y: 0.9983538; cel: -1; alpha: 1; }
        frame 101 { x: 70.5921127; y: -10.1069777; skew-x: -90.3822842; skew-y: -90.3822831; scale-x: 0.998128684; scale-y: 0.998128587; cel: -1; alpha: 1; }
        frame 102 { x: 70.0036274; y: -9.69348367; skew-x: -90.4200014; skew-y: -90.420001; scale-x: 0.997904035; scale-y: 0.997903928; cel: -1; alpha: 1; }
        frame 103 { x: 69.4550129; y: -9.33134209; skew-x: -90.2577185; skew-y: -90.257719; scale-x: 0.998679615; scale-y: 0.998679501; cel: -1; alpha: 1; }
        frame 104 { x: 69.4550129; y: -9.33134209; skew-x: -90.2577185; skew-y: -90.257719; scale-x: 0.998679615; scale-y: 0.998679501; cel: -1; alpha: 1; }
        frame 105 { x: 69.6107618; y: -9.350738; skew-x: -90.3000651; skew-y: -90.3000652; scale-x: 0.997344852; scale-y: 0.997344744; cel: -1; alpha: 1; }
        frame 106 { x: 69.5654648; y: -9.52928409; skew-x: -90.2424118; skew-y: -90.2424115; scale-x: 0.998010335; scale-y: 0.998010232; cel: -1; alpha: 1; }
        frame 107 { x: 69.8492534; y: -9.53580592; skew-x: -90.3847584; skew-y: -90.3847578; scale-x: 0.997675024; scale-y: 0.997674927; cel: -1; alpha: 1; }
        frame 108 { x: 69.9804878; y: -9.54839295; skew-x: -90.327105; skew-y: -90.3271041; scale-x: 0.998341616; scale-y: 0.998341526; cel: -1; alpha: 1; }
        frame 109 { x: 70.0698065; y: -9.70617279; skew-x: -90.3694516; skew-y: -90.3694504; scale-x: 0.998006079; scale-y: 0.998005994; cel: -1; alpha: 1; }
        frame 110 { x: 70.0779663; y: -9.88625634; skew-x: -90.3117982; skew-y: -90.3117968; scale-x: 0.997670091; scale-y: 0.997670015; cel: -1; alpha: 1; }
        frame 111 { x: 70.3006382; y: -9.84018408; skew-x: -90.4541448; skew-y: -90.4541431; scale-x: 0.998338019; scale-y: 0.998337949; cel: -1; alpha: 1; }
        frame 112 { x: 70.2147515; y: -10.2113736; skew-x: -90.2964906; skew-y: -90.2964888; scale-x: 0.99900684; scale-y: 0.999006778; cel: -1; alpha: 1; }
        frame 113 { x: 70.46533; y: -10.4309684; skew-x: -90.2211518; skew-y: -90.2211498; scale-x: 0.998185738; scale-y: 0.998185684; cel: -1; alpha: 1; }
        frame 114 { x: 70.6926159; y: -10.7417171; skew-x: -90.0458129; skew-y: -90.0458108; scale-x: 0.998369741; scale-y: 0.998369694; cel: -1; alpha: 1; }
        frame 115 { x: 71.0804407; y: -10.9384596; skew-x: -90.070474; skew-y: -90.0704718; scale-x: 0.998553812; scale-y: 0.998553772; cel: -1; alpha: 1; }
        frame 116 { x: 71.4580454; y: -11.2331691; skew-x: -90.1951351; skew-y: -90.1951329; scale-x: 0.998737951; scale-y: 0.998737918; cel: -1; alpha: 1; }
        frame 117 { x: 71.6418291; y: -11.5069025; skew-x: -90.1197936; skew-y: -90.1197915; scale-x: 0.998922157; scale-y: 0.998922132; cel: -1; alpha: 1; }
        frame 118 { x: 71.2220166; y: -11.7664774; skew-x: -85.9354297; skew-y: -85.9354278; scale-x: 0.99808111; scale-y: 0.998081098; cel: -1; alpha: 1; }
        frame 119 { x: 70.6148004; y: -11.219847; skew-x: -81.6510656; skew-y: -81.6510643; scale-x: 0.998246081; scale-y: 0.998246082; cel: -1; alpha: 1; }
        frame 120 { x: 68.6086117; y: -9.61498049; skew-x: -77.4667015; skew-y: -77.4667008; scale-x: 0.997404646; scale-y: 0.997404656; cel: -1; alpha: 1; }
        frame 121 { x: 66.1189059; y: -7.56739913; skew-x: -73.3823409; skew-y: -73.382341; scale-x: 0.998576192; scale-y: 0.998576208; cel: -1; alpha: 1; }
        frame 122 { x: 66.1808642; y: -7.48125912; skew-x: -73.1823409; skew-y: -73.182341; scale-x: 0.997569563; scale-y: 0.997569579; cel: -1; alpha: 1; }
        frame 123 { x: 66.5950299; y: -7.42289774; skew-x: -73.3823114; skew-y: -73.3823115; scale-x: 0.998576193; scale-y: 0.998576209; cel: -1; alpha: 1; }
        frame 124 { x: 56.8898474; y: -5.06788643; skew-x: -63.7183499; skew-y: -63.7183519; scale-x: 0.997286952; scale-y: 0.997286967; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_OUTERLEG_FOOT; }
        frame 125 { x: 48.8788963; y: -15.1724546; skew-x: -71.8253469; skew-y: -71.825349; scale-x: 0.996604036; scale-y: 0.99660405; cel: 0; alpha: 1; }
        frame 126 { x: 40.2670107; y: -26.1030521; skew-x: -80.132344; skew-y: -80.1323461; scale-x: 0.995920936; scale-y: 0.995920949; cel: 0; alpha: 1; }
        frame 127 { x: 30.7958184; y: -36.0981242; skew-x: -88.239341; skew-y: -88.2393432; scale-x: 0.996245997; scale-y: 0.99624601; cel: 0; alpha: 1; }
        frame 128 { x: 22.0333846; y: -44.8302212; skew-x: -96.4463257; skew-y: -96.446328; scale-x: 0.996571531; scale-y: 0.996571543; cel: 0; alpha: 1; }
        frame 129 { x: -34.8651897; y: -48.1661707; skew-x: -89.9466237; skew-y: -89.9466256; scale-x: 0.995581319; scale-y: 0.99558134; cel: 0; alpha: 1; }
        frame 130 { x: -91.7597788; y: -51.5506275; skew-x: -83.44693; skew-y: -83.4469319; scale-x: 0.996608508; scale-y: 0.996608542; cel: 0; alpha: 1; }
        frame 131 { x: -91.7597788; y: -51.5506275; skew-x: -83.44693; skew-y: -83.4469319; scale-x: 0.996608508; scale-y: 0.996608542; cel: -1; alpha: 1; }
        frame 132 { x: -91.7597788; y: -51.5506275; skew-x: -83.44693; skew-y: -83.4469319; scale-x: 0.996608508; scale-y: 0.996608542; cel: -1; alpha: 1; }
        frame 133 { x: -91.7597788; y: -51.5506275; skew-x: -83.44693; skew-y: -83.4469319; scale-x: 0.996608508; scale-y: 0.996608542; cel: -1; alpha: 1; }
        frame 134 { x: -91.7597788; y: -51.5506275; skew-x: -83.44693; skew-y: -83.4469319; scale-x: 0.996608508; scale-y: 0.996608542; cel: -1; alpha: 1; }
        frame 135 { x: -91.7597788; y: -51.5506275; skew-x: -83.44693; skew-y: -83.4469319; scale-x: 0.996608508; scale-y: 0.996608542; cel: -1; alpha: 1; }
        frame 136 { x: -91.7597788; y: -51.5506275; skew-x: -83.44693; skew-y: -83.4469319; scale-x: 0.996608508; scale-y: 0.996608542; cel: -1; alpha: 1; }
        frame 137 { x: -91.7597788; y: -51.5506275; skew-x: -83.44693; skew-y: -83.4469319; scale-x: 0.996608508; scale-y: 0.996608542; cel: -1; alpha: 1; }
        frame 138 { x: 67.8491258; y: -6.6162348; skew-x: -93.7821346; skew-y: -94.3452483; scale-x: 0.997212297; scale-y: 0.973120266; cel: -1; alpha: 1; }
        frame 139 { x: 67.0986395; y: -9.0188505; skew-x: -92.5157511; skew-y: -93.0165844; scale-x: 0.996062521; scale-y: 0.979730488; cel: -1; alpha: 1; }
        frame 140 { x: 66.4864548; y: -11.6159681; skew-x: -91.1484182; skew-y: -91.4896448; scale-x: 0.996492701; scale-y: 0.986871391; cel: -1; alpha: 1; }
        frame 141 { x: 66.4092308; y: -14.4955276; skew-x: -89.8781708; skew-y: -89.9660589; scale-x: 0.998556557; scale-y: 0.994503242; cel: -1; alpha: 1; }
        frame 142 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 143 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 144 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 145 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 146 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 147 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 148 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 149 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 150 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 151 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 152 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 153 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 154 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 155 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 156 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 157 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 158 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 159 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 160 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 161 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 162 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 163 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 164 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 165 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 166 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 167 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 168 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 169 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 170 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 171 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 172 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 173 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 174 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 175 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 176 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 177 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 178 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 179 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 180 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 181 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 182 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 183 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 184 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 185 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 186 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 187 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 188 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 189 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 190 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 191 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 192 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 193 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 194 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 195 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
        frame 196 { x: 64.4515539; y: -18.9018657; skew-x: -90.2666443; skew-y: -90.241286; scale-x: 0.998902397; scale-y: 0.998822404; cel: -1; alpha: 1; }
    }
    Track {
        source-name: "Zombie_imp_outerleg_lower";
        frame-count: 197;
        frame 0 { x: 61.9295746; y: -19.0692594; skew-x: -56.1878342; skew-y: -56.1793659; scale-x: 0.99617035; scale-y: 0.996571847; cel: -1; alpha: 1; }
        frame 1 { x: 62.0797549; y: -19.0743573; skew-x: -56.3262918; skew-y: -56.2669677; scale-x: 0.995897; scale-y: 0.995547467; cel: -1; alpha: 1; }
        frame 2 { x: 62.119795; y: -19.0259252; skew-x: -56.2383815; skew-y: -56.2791036; scale-x: 0.996436079; scale-y: 0.995796696; cel: -1; alpha: 1; }
        frame 3 { x: 62.3171871; y: -18.9683411; skew-x: -56.2582597; skew-y: -56.2845723; scale-x: 0.996286617; scale-y: 0.995681478; cel: -1; alpha: 1; }
        frame 4 { x: 62.2659819; y: -19.0312127; skew-x: -56.1781493; skew-y: -56.1901745; scale-x: 0.996131044; scale-y: 0.995569278; cel: -1; alpha: 1; }
        frame 5 { x: 62.4631797; y: -19.0803064; skew-x: -56.1980446; skew-y: -56.1959143; scale-x: 0.995969387; scale-y: 0.995460052; cel: -1; alpha: 1; }
        frame 6 { x: 62.7105643; y: -19.0239903; skew-x: -56.3179397; skew-y: -56.3017955; scale-x: 0.99580167; scale-y: 0.995353761; cel: -1; alpha: 1; }
        frame 7 { x: 62.8088936; y: -18.9852839; skew-x: -56.3150421; skew-y: -56.3260822; scale-x: 0.995774985; scale-y: 0.996104485; cel: -1; alpha: 1; }
        frame 8 { x: 63.006958; y: -19.0459349; skew-x: -56.303879; skew-y: -56.1628982; scale-x: 0.994184788; scale-y: 0.997097021; cel: -1; alpha: 1; }
        frame 9 { x: 63.0556476; y: -19.0234796; skew-x: -56.2536077; skew-y: -56.2385993; scale-x: 0.995419994; scale-y: 0.995889441; cel: -1; alpha: 1; }
        frame 10 { x: 63.002408; y: -19.0650553; skew-x: -56.173016; skew-y: -56.1449773; scale-x: 0.996229844; scale-y: 0.996778857; cel: -1; alpha: 1; }
        frame 11 { x: 62.8631296; y: -19.0975081; skew-x: -56.1978605; skew-y: -56.2073352; scale-x: 0.995757628; scale-y: 0.995349421; cel: -1; alpha: 1; }
        frame 12 { x: 62.7241262; y: -19.0002583; skew-x: -56.2219801; skew-y: -56.2703071; scale-x: 0.996259561; scale-y: 0.994911989; cel: -1; alpha: 1; }
        frame 13 { x: 62.7352242; y: -19.094597; skew-x: -56.3155061; skew-y: -56.2636783; scale-x: 0.995354607; scale-y: 0.995577698; cel: -1; alpha: 1; }
        frame 14 { x: 62.5959606; y: -19.1002477; skew-x: -56.3021762; skew-y: -56.2595679; scale-x: 0.995317504; scale-y: 0.996546456; cel: -1; alpha: 1; }
        frame 15 { x: 62.4562053; y: -19.0074594; skew-x: -56.32577; skew-y: -56.3230381; scale-x: 0.995803258; scale-y: 0.996112579; cel: -1; alpha: 1; }
        frame 16 { x: 62.3671624; y: -19.1291578; skew-x: -56.2485185; skew-y: -56.2872057; scale-x: 0.996266538; scale-y: 0.995678361; cel: -1; alpha: 1; }
        frame 17 { x: 62.2293631; y: -19.1460333; skew-x: -56.2576098; skew-y: -56.2648304; scale-x: 0.99608739; scale-y: 0.995788868; cel: -1; alpha: 1; }
        frame 18 { x: 62.0444429; y: -19.0862535; skew-x: -56.1668682; skew-y: -56.1421272; scale-x: 0.99592246; scale-y: 0.995895445; cel: -1; alpha: 1; }
        frame 19 { x: 62.0038373; y: -19.0933219; skew-x: -56.199909; skew-y: -56.2955227; scale-x: 0.996937621; scale-y: 0.994918164; cel: -1; alpha: 1; }
        frame 20 { x: 61.8254717; y: -19.1377753; skew-x: -56.2784808; skew-y: -56.3021733; scale-x: 0.995314771; scale-y: 0.99544784; cel: -1; alpha: 1; }
        frame 21 { x: 61.9295746; y: -19.0692594; skew-x: -56.1878342; skew-y: -56.1793659; scale-x: 0.99617035; scale-y: 0.996571847; cel: -1; alpha: 1; }
        frame 22 { x: 62.3454562; y: -19.1029186; skew-x: -56.1622617; skew-y: -56.1622598; scale-x: 0.996512717; scale-y: 0.996512623; cel: -1; alpha: 1; }
        frame 23 { x: 61.9710905; y: -18.7615551; skew-x: -56.3134468; skew-y: -56.1563345; scale-x: 0.995187747; scale-y: 0.995962444; cel: -1; alpha: 1; }
        frame 24 { x: 61.3192891; y: -18.7467003; skew-x: -56.1665045; skew-y: -56.1474784; scale-x: 0.994930187; scale-y: 0.995402911; cel: -1; alpha: 1; }
        frame 25 { x: 60.7059107; y: -18.7138292; skew-x: -56.1232384; skew-y: -56.236075; scale-x: 0.995323003; scale-y: 0.995238418; cel: -1; alpha: 1; }
        frame 26 { x: 60.2202899; y: -18.664733; skew-x: -56.1776575; skew-y: -56.2248013; scale-x: 0.994432462; scale-y: 0.995260903; cel: -1; alpha: 1; }
        frame 27 { x: 59.7192626; y: -18.7447065; skew-x: -56.1279745; skew-y: -56.1231607; scale-x: 0.996683299; scale-y: 0.996109438; cel: -1; alpha: 1; }
        frame 28 { x: 59.6341981; y: -18.8183335; skew-x: -56.1612789; skew-y: -56.1110484; scale-x: 0.994835765; scale-y: 0.994758066; cel: -1; alpha: 1; }
        frame 29 { x: 59.4752754; y: -18.9272118; skew-x: -56.1887442; skew-y: -56.1075747; scale-x: 0.994996455; scale-y: 0.994403796; cel: -1; alpha: 1; }
        frame 30 { x: 59.249307; y: -19.008566; skew-x: -56.1175104; skew-y: -56.1024222; scale-x: 0.994934378; scale-y: 0.994323756; cel: -1; alpha: 1; }
        frame 31 { x: 59.1602622; y: -19.0791858; skew-x: -56.2498457; skew-y: -56.0925353; scale-x: 0.995412697; scale-y: 0.99465711; cel: -1; alpha: 1; }
        frame 32 { x: 58.7510376; y: -19.141755; skew-x: -56.1927821; skew-y: -56.1731024; scale-x: 0.99605627; scale-y: 0.996927896; cel: -1; alpha: 1; }
        frame 33 { x: 59.2071325; y: -18.970144; skew-x: -56.1751829; skew-y: -56.1131275; scale-x: 0.995210731; scale-y: 0.995027703; cel: -1; alpha: 1; }
        frame 34 { x: 59.1659024; y: -18.787715; skew-x: -56.1692354; skew-y: -56.1402417; scale-x: 0.996159658; scale-y: 0.996491691; cel: -1; alpha: 1; }
        frame 35 { x: 61.5840071; y: -19.0463524; skew-x: -56.2399961; skew-y: -56.1878866; scale-x: 0.994645218; scale-y: 0.99526527; cel: -1; alpha: 1; }
        frame 36 { x: 63.8292243; y: -20.2691742; skew-x: -56.1226126; skew-y: -56.1226157; scale-x: 0.996640994; scale-y: 0.99664095; cel: -1; alpha: 1; }
        frame 37 { x: 64.0882076; y: -20.0711358; skew-x: -56.1418967; skew-y: -56.1695887; scale-x: 0.996452519; scale-y: 0.995561766; cel: -1; alpha: 1; }
        frame 38 { x: 64.3048745; y: -20.0570659; skew-x: -56.0624167; skew-y: -56.1153013; scale-x: 0.997324535; scale-y: 0.995512634; cel: -1; alpha: 1; }
        frame 39 { x: 64.1706665; y: -19.7253783; skew-x: -56.2251805; skew-y: -56.2270935; scale-x: 0.996284182; scale-y: 0.996213097; cel: -1; alpha: 1; }
        frame 40 { x: 63.9885809; y: -19.3738279; skew-x: -56.2169815; skew-y: -56.209832; scale-x: 0.99612618; scale-y: 0.996191375; cel: -1; alpha: 1; }
        frame 41 { x: 63.7585913; y: -19.2221428; skew-x: -56.2095885; skew-y: -56.191695; scale-x: 0.995991203; scale-y: 0.996152289; cel: -1; alpha: 1; }
        frame 42 { x: 63.6946342; y: -18.9001543; skew-x: -56.3326145; skew-y: -56.2646454; scale-x: 0.995777847; scale-y: 0.995728714; cel: -1; alpha: 1; }
        frame 43 { x: 63.4621104; y: -18.5910712; skew-x: -56.3463995; skew-y: -56.3437724; scale-x: 0.996306398; scale-y: 0.995669456; cel: -1; alpha: 1; }
        frame 44 { x: 63.2747987; y: -18.3516431; skew-x: -56.2491628; skew-y: -56.2336131; scale-x: 0.995216675; scale-y: 0.99511906; cel: -1; alpha: 1; }
        frame 45 { x: 63.0141152; y: -18.1741597; skew-x: -56.2532113; skew-y: -56.2218478; scale-x: 0.995133707; scale-y: 0.995550828; cel: -1; alpha: 1; }
        frame 46 { x: 62.956633; y: -17.9938695; skew-x: -56.1653669; skew-y: -56.2016707; scale-x: 0.996589525; scale-y: 0.996599526; cel: -1; alpha: 1; }
        frame 47 { x: 62.5206955; y: -18.0894492; skew-x: -56.2209008; skew-y: -56.259105; scale-x: 0.995870118; scale-y: 0.99474673; cel: -1; alpha: 1; }
        frame 48 { x: 62.0455377; y: -18.2484384; skew-x: -56.2458764; skew-y: -56.2375633; scale-x: 0.994873611; scale-y: 0.995034448; cel: -1; alpha: 1; }
        frame 49 { x: 61.5334856; y: -18.4075571; skew-x: -56.2858962; skew-y: -56.2054877; scale-x: 0.995026269; scale-y: 0.99521119; cel: -1; alpha: 1; }
        frame 50 { x: 61.0714244; y: -18.7914668; skew-x: -56.1253188; skew-y: -56.1738001; scale-x: 0.995413658; scale-y: 0.995316829; cel: -1; alpha: 1; }
        frame 51 { x: 60.1987288; y: -19.0072196; skew-x: -56.1634247; skew-y: -56.1432427; scale-x: 0.996678384; scale-y: 0.996410538; cel: -1; alpha: 1; }
        frame 52 { x: 59.6399639; y: -18.7044916; skew-x: -56.2056908; skew-y: -56.2838084; scale-x: 0.994650458; scale-y: 0.994643622; cel: -1; alpha: 1; }
        frame 53 { x: 59.0368067; y: -18.7260613; skew-x: -56.2393207; skew-y: -56.1338675; scale-x: 0.995241058; scale-y: 0.993840588; cel: -1; alpha: 1; }
        frame 54 { x: 58.0874566; y: -18.6006193; skew-x: -56.1055918; skew-y: -56.2431829; scale-x: 0.994558422; scale-y: 0.996340842; cel: -1; alpha: 1; }
        frame 55 { x: 57.48439; y: -18.631201; skew-x: -56.1313831; skew-y: -56.1003974; scale-x: 0.995365587; scale-y: 0.995070604; cel: -1; alpha: 1; }
        frame 56 { x: 56.5722065; y: -18.6536772; skew-x: -56.1691205; skew-y: -56.1469312; scale-x: 0.996518868; scale-y: 0.995970244; cel: -1; alpha: 1; }
        frame 57 { x: 58.2293664; y: -18.7213298; skew-x: -56.2369423; skew-y: -56.1550806; scale-x: 0.994622265; scale-y: 0.994264829; cel: -1; alpha: 1; }
        frame 58 { x: 59.4994771; y: -18.7450562; skew-x: -56.1986149; skew-y: -56.1789446; scale-x: 0.99635102; scale-y: 0.996155302; cel: -1; alpha: 1; }
        frame 59 { x: 61.4632985; y: -18.661745; skew-x: -56.2095981; skew-y: -56.187626; scale-x: 0.994900468; scale-y: 0.99519746; cel: -1; alpha: 1; }
        frame 60 { x: 63.6794792; y: -19.376892; skew-x: -56.1542414; skew-y: -56.1681399; scale-x: 0.997105373; scale-y: 0.995767875; cel: -1; alpha: 1; }
        frame 61 { x: 63.6423602; y: -19.1093663; skew-x: -56.3494351; skew-y: -56.286765; scale-x: 0.995570719; scale-y: 0.995725656; cel: -1; alpha: 1; }
        frame 62 { x: 63.6544116; y: -18.8890418; skew-x: -56.1543033; skew-y: -56.184395; scale-x: 0.996843625; scale-y: 0.996382641; cel: -1; alpha: 1; }
        frame 63 { x: 63.5346389; y: -18.6577107; skew-x: -56.1860614; skew-y: -56.2523926; scale-x: 0.99698447; scale-y: 0.995539104; cel: -1; alpha: 1; }
        frame 64 { x: 63.4830931; y: -18.5191704; skew-x: -56.2028536; skew-y: -56.2358725; scale-x: 0.996286053; scale-y: 0.995133532; cel: -1; alpha: 1; }
        frame 65 { x: 63.2968281; y: -18.2635545; skew-x: -56.1861749; skew-y: -56.1382641; scale-x: 0.995880882; scale-y: 0.996842315; cel: -1; alpha: 1; }
        frame 66 { x: 63.1028167; y: -18.5188386; skew-x: -56.3345114; skew-y: -56.3428623; scale-x: 0.996101011; scale-y: 0.994983841; cel: -1; alpha: 1; }
        frame 67 { x: 62.8399881; y: -18.4999447; skew-x: -56.3388349; skew-y: -56.275899; scale-x: 0.995912043; scale-y: 0.995646844; cel: -1; alpha: 1; }
        frame 68 { x: 62.7215932; y: -18.7517432; skew-x: -56.240935; skew-y: -56.3043363; scale-x: 0.996112922; scale-y: 0.995484779; cel: -1; alpha: 1; }
        frame 69 { x: 62.4242942; y: -18.6824303; skew-x: -56.3568496; skew-y: -56.2314467; scale-x: 0.99543562; scale-y: 0.995701143; cel: -1; alpha: 1; }
        frame 70 { x: 62.3454562; y: -19.1029186; skew-x: -56.1622617; skew-y: -56.1622598; scale-x: 0.996512717; scale-y: 0.996512623; cel: -1; alpha: 1; }
        frame 71 { x: 62.2924017; y: -19.1029236; skew-x: -56.1622617; skew-y: -56.1622598; scale-x: 0.996512717; scale-y: 0.996512623; cel: -1; alpha: 1; }
        frame 72 { x: 61.3268572; y: -18.9651957; skew-x: -56.1897925; skew-y: -56.1897912; scale-x: 0.99481021; scale-y: 0.994810119; cel: -1; alpha: 1; }
        frame 73 { x: 60.3157085; y: -18.7788584; skew-x: -56.2173234; skew-y: -56.2173225; scale-x: 0.995102895; scale-y: 0.995102808; cel: -1; alpha: 1; }
        frame 74 { x: 59.3830363; y: -18.7855996; skew-x: -56.1448545; skew-y: -56.1448538; scale-x: 0.995395751; scale-y: 0.99539567; cel: -1; alpha: 1; }
        frame 75 { x: 58.4747093; y: -18.768949; skew-x: -56.1723856; skew-y: -56.1723849; scale-x: 0.994690095; scale-y: 0.99469002; cel: -1; alpha: 1; }
        frame 76 { x: 57.5540962; y: -19.0658339; skew-x: -56.0999168; skew-y: -56.0999159; scale-x: 0.994983003; scale-y: 0.994982933; cel: -1; alpha: 1; }
        frame 77 { x: 56.5491578; y: -19.0807665; skew-x: -56.2274482; skew-y: -56.2274468; scale-x: 0.995276084; scale-y: 0.995276018; cel: -1; alpha: 1; }
        frame 78 { x: 55.7814619; y: -19.6063169; skew-x: -56.0549796; skew-y: -56.0549777; scale-x: 0.994569771; scale-y: 0.994569706; cel: -1; alpha: 1; }
        frame 79 { x: 54.715062; y: -19.8630672; skew-x: -56.1825111; skew-y: -56.1825084; scale-x: 0.996862631; scale-y: 0.996862562; cel: -1; alpha: 1; }
        frame 80 { x: 54.5425853; y: -20.1837312; skew-x: -56.0393982; skew-y: -56.0393964; scale-x: 0.995053351; scale-y: 0.995053264; cel: -1; alpha: 1; }
        frame 81 { x: 54.1107575; y: -20.1982016; skew-x: -56.0962853; skew-y: -56.0962845; scale-x: 0.995243867; scale-y: 0.995243764; cel: -1; alpha: 1; }
        frame 82 { x: 53.69962; y: -20.1035387; skew-x: -56.1531723; skew-y: -56.1531726; scale-x: 0.995434454; scale-y: 0.995434339; cel: -1; alpha: 1; }
        frame 83 { x: 53.4471055; y: -20.3728869; skew-x: -56.1100593; skew-y: -56.1100607; scale-x: 0.995625111; scale-y: 0.995624989; cel: -1; alpha: 1; }
        frame 84 { x: 53.001371; y: -20.6602745; skew-x: -56.1669463; skew-y: -56.1669489; scale-x: 0.99581584; scale-y: 0.995815715; cel: -1; alpha: 1; }
        frame 85 { x: 52.841511; y: -20.9192322; skew-x: -56.1238332; skew-y: -56.1238371; scale-x: 0.996006639; scale-y: 0.996006516; cel: -1; alpha: 1; }
        frame 86 { x: 53.5665516; y: -20.6688593; skew-x: -56.0917475; skew-y: -56.0917486; scale-x: 0.99535491; scale-y: 0.995354789; cel: -1; alpha: 1; }
        frame 87 { x: 54.0639461; y: -20.5357163; skew-x: -56.1596559; skew-y: -56.1596545; scale-x: 0.996708867; scale-y: 0.996708771; cel: -1; alpha: 1; }
        frame 88 { x: 55.9542875; y: -19.4911822; skew-x: -56.2038932; skew-y: -56.2038917; scale-x: 0.995376183; scale-y: 0.995376112; cel: -1; alpha: 1; }
        frame 89 { x: 57.6613293; y: -19.2003564; skew-x: -56.1481303; skew-y: -56.1481292; scale-x: 0.996050523; scale-y: 0.996050476; cel: -1; alpha: 1; }
        frame 90 { x: 62.9237473; y: -19.9333872; skew-x: -56.2164359; skew-y: -56.216437; scale-x: 0.996854178; scale-y: 0.996854156; cel: -1; alpha: 1; }
        frame 91 { x: 65.6988473; y: -22.0190855; skew-x: -56.0982506; skew-y: -56.0982522; scale-x: 0.996085951; scale-y: 0.996085936; cel: -1; alpha: 1; }
        frame 92 { x: 65.7000459; y: -21.9921355; skew-x: -56.0982427; skew-y: -56.0982443; scale-x: 0.996085952; scale-y: 0.996085936; cel: -1; alpha: 1; }
        frame 93 { x: 65.7011636; y: -21.9008899; skew-x: -56.0982427; skew-y: -56.0982443; scale-x: 0.996085952; scale-y: 0.996085936; cel: -1; alpha: 1; }
        frame 94 { x: 65.7022652; y: -21.8096392; skew-x: -56.0982427; skew-y: -56.0982443; scale-x: 0.996085952; scale-y: 0.996085936; cel: -1; alpha: 1; }
        frame 95 { x: 65.7014084; y: -22.1028352; skew-x: -56.0982427; skew-y: -56.0982443; scale-x: 0.996085952; scale-y: 0.996085936; cel: -1; alpha: 1; }
        frame 96 { x: 65.700062; y: -21.9921426; skew-x: -56.0982427; skew-y: -56.0982443; scale-x: 0.996085952; scale-y: 0.996085936; cel: -1; alpha: 1; }
        frame 97 { x: 65.3262893; y: -21.431362; skew-x: -56.0359552; skew-y: -56.0359559; scale-x: 0.995860252; scale-y: 0.995860233; cel: -1; alpha: 1; }
        frame 98 { x: 64.8491229; y: -20.9339519; skew-x: -56.0736731; skew-y: -56.0736731; scale-x: 0.996638774; scale-y: 0.996638748; cel: -1; alpha: 1; }
        frame 99 { x: 64.4285631; y: -20.5130139; skew-x: -56.011391; skew-y: -56.0113903; scale-x: 0.99641295; scale-y: 0.996412915; cel: -1; alpha: 1; }
        frame 100 { x: 63.8203748; y: -20.1392162; skew-x: -56.3491088; skew-y: -56.3491075; scale-x: 0.996187684; scale-y: 0.996187637; cel: -1; alpha: 1; }
        frame 101 { x: 63.4122371; y: -19.8575823; skew-x: -56.2868265; skew-y: -56.2868248; scale-x: 0.995962973; scale-y: 0.995962912; cel: -1; alpha: 1; }
        frame 102 { x: 62.8189522; y: -19.4371661; skew-x: -56.3245442; skew-y: -56.3245422; scale-x: 0.995738815; scale-y: 0.995738738; cel: -1; alpha: 1; }
        frame 103 { x: 62.2924017; y: -19.1029236; skew-x: -56.1622617; skew-y: -56.1622598; scale-x: 0.996512717; scale-y: 0.996512623; cel: -1; alpha: 1; }
        frame 104 { x: 62.2924017; y: -19.1029236; skew-x: -56.1622617; skew-y: -56.1622598; scale-x: 0.996512717; scale-y: 0.996512623; cel: -1; alpha: 1; }
        frame 105 { x: 62.4505132; y: -19.1039702; skew-x: -56.2046081; skew-y: -56.2046063; scale-x: 0.995180848; scale-y: 0.995180764; cel: -1; alpha: 1; }
        frame 106 { x: 62.4102627; y: -19.296229; skew-x: -56.1469545; skew-y: -56.1469528; scale-x: 0.995844886; scale-y: 0.995844809; cel: -1; alpha: 1; }
        frame 107 { x: 62.6722204; y: -19.2816687; skew-x: -56.2893009; skew-y: -56.2892994; scale-x: 0.995510302; scale-y: 0.995510233; cel: -1; alpha: 1; }
        frame 108 { x: 62.8084763; y: -19.3079892; skew-x: -56.2316472; skew-y: -56.2316459; scale-x: 0.996175447; scale-y: 0.996175386; cel: -1; alpha: 1; }
        frame 109 { x: 62.8929965; y: -19.4571873; skew-x: -56.2739936; skew-y: -56.2739925; scale-x: 0.995840637; scale-y: 0.995840583; cel: -1; alpha: 1; }
        frame 110 { x: 62.9133846; y: -19.6412023; skew-x: -56.2163399; skew-y: -56.2163391; scale-x: 0.995505379; scale-y: 0.995505331; cel: -1; alpha: 1; }
        frame 111 { x: 63.1070305; y: -19.5838191; skew-x: -56.3586862; skew-y: -56.3586857; scale-x: 0.996171857; scale-y: 0.996171816; cel: -1; alpha: 1; }
        frame 112 { x: 63.0431801; y: -19.9813064; skew-x: -56.2010317; skew-y: -56.2010316; scale-x: 0.996839229; scale-y: 0.996839193; cel: -1; alpha: 1; }
        frame 113 { x: 63.3124952; y: -20.2022849; skew-x: -56.1256927; skew-y: -56.1256929; scale-x: 0.99601991; scale-y: 0.996019879; cel: -1; alpha: 1; }
        frame 114 { x: 63.5684041; y: -20.5366825; skew-x: -55.9503536; skew-y: -55.9503541; scale-x: 0.996203515; scale-y: 0.996203489; cel: -1; alpha: 1; }
        frame 115 { x: 63.9506992; y: -20.732163; skew-x: -55.9750145; skew-y: -55.9750154; scale-x: 0.996387188; scale-y: 0.996387165; cel: -1; alpha: 1; }
        frame 116 { x: 64.3056935; y: -21.01314; skew-x: -56.0996754; skew-y: -56.0996767; scale-x: 0.99657093; scale-y: 0.99657091; cel: -1; alpha: 1; }
        frame 117 { x: 64.5010267; y: -21.2980755; skew-x: -56.0243337; skew-y: -56.0243354; scale-x: 0.996754739; scale-y: 0.996754721; cel: -1; alpha: 1; }
        frame 118 { x: 64.8200662; y: -22.0439268; skew-x: -51.8399695; skew-y: -51.8399721; scale-x: 0.995915523; scale-y: 0.995915505; cel: -1; alpha: 1; }
        frame 119 { x: 64.9976047; y: -21.9486176; skew-x: -47.5556052; skew-y: -47.5556087; scale-x: 0.996080144; scale-y: 0.996080123; cel: -1; alpha: 1; }
        frame 120 { x: 63.7932871; y: -20.7156523; skew-x: -43.371241; skew-y: -43.3712452; scale-x: 0.995240543; scale-y: 0.995240515; cel: -1; alpha: 1; }
        frame 121 { x: 62.1017452; y: -18.996259; skew-x: -39.2868806; skew-y: -39.2868854; scale-x: 0.996409556; scale-y: 0.996409517; cel: -1; alpha: 1; }
        frame 122 { x: 62.2076315; y: -18.9125368; skew-x: -39.0868806; skew-y: -39.0868854; scale-x: 0.995405111; scale-y: 0.995405072; cel: -1; alpha: 1; }
        frame 123 { x: 62.5778751; y: -18.8517597; skew-x: -39.286851; skew-y: -39.2868558; scale-x: 0.996409557; scale-y: 0.996409518; cel: -1; alpha: 1; }
        frame 124 { x: 54.8508905; y: -16.9935044; skew-x: -29.6228902; skew-y: -29.6228956; scale-x: 0.995123128; scale-y: 0.995123058; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_OUTERLEG_LOWER; }
        frame 125 { x: 45.2240397; y: -26.6549494; skew-x: -37.7292235; skew-y: -37.729229; scale-x: 0.994440834; scale-y: 0.994440763; cel: 0; alpha: 1; }
        frame 126 { x: 34.9729848; y: -36.9059262; skew-x: -46.0355568; skew-y: -46.0355623; scale-x: 0.993758357; scale-y: 0.993758285; cel: 0; alpha: 1; }
        frame 127 { x: 23.966834; y: -46.0607807; skew-x: -54.1418901; skew-y: -54.1418956; scale-x: 0.994081852; scale-y: 0.994081778; cel: 0; alpha: 1; }
        frame 128 { x: 13.804556; y: -53.846352; skew-x: -62.3482349; skew-y: -62.3482403; scale-x: 0.994405817; scale-y: 0.994405742; cel: 0; alpha: 1; }
        frame 129 { x: -41.0737969; y: -56.5710777; skew-x: -67.2481675; skew-y: -67.2481728; scale-x: 0.993409349; scale-y: 0.993409306; cel: 0; alpha: 1; }
        frame 130 { x: -96.0368538; y: -59.343313; skew-x: -72.1480941; skew-y: -72.1480989; scale-x: 0.994425878; scale-y: 0.994425865; cel: 0; alpha: 1; }
        frame 131 { x: -96.0368538; y: -59.343313; skew-x: -72.1480941; skew-y: -72.1480989; scale-x: 0.994425878; scale-y: 0.994425865; cel: -1; alpha: 1; }
        frame 132 { x: -96.0368538; y: -59.343313; skew-x: -72.1480941; skew-y: -72.1480989; scale-x: 0.994425878; scale-y: 0.994425865; cel: -1; alpha: 1; }
        frame 133 { x: -96.0368538; y: -59.343313; skew-x: -72.1480941; skew-y: -72.1480989; scale-x: 0.994425878; scale-y: 0.994425865; cel: -1; alpha: 1; }
        frame 134 { x: -96.0368538; y: -59.343313; skew-x: -72.1480941; skew-y: -72.1480989; scale-x: 0.994425878; scale-y: 0.994425865; cel: -1; alpha: 1; }
        frame 135 { x: -96.0368538; y: -59.343313; skew-x: -72.1480941; skew-y: -72.1480989; scale-x: 0.994425878; scale-y: 0.994425865; cel: -1; alpha: 1; }
        frame 136 { x: -96.0368538; y: -59.343313; skew-x: -72.1480941; skew-y: -72.1480989; scale-x: 0.994425878; scale-y: 0.994425865; cel: -1; alpha: 1; }
        frame 137 { x: -96.0368538; y: -59.343313; skew-x: -72.1480941; skew-y: -72.1480989; scale-x: 0.994425878; scale-y: 0.994425865; cel: -1; alpha: 1; }
        frame 138 { x: 60.2866008; y: -15.8586405; skew-x: -60.50445; skew-y: -59.4152387; scale-x: 0.992025595; scale-y: 0.973967788; cel: -1; alpha: 1; }
        frame 139 { x: 59.6953362; y: -18.4199138; skew-x: -59.0118716; skew-y: -58.3204941; scale-x: 0.992800172; scale-y: 0.978688999; cel: -1; alpha: 1; }
        frame 140 { x: 59.2582309; y: -21.2133633; skew-x: -57.416058; skew-y: -57.0276644; scale-x: 0.994056129; scale-y: 0.985001978; cel: -1; alpha: 1; }
        frame 141 { x: 59.3412494; y: -24.302197; skew-x: -55.9182572; skew-y: -55.7346083; scale-x: 0.995828408; scale-y: 0.992904979; cel: -1; alpha: 1; }
        frame 142 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 143 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 144 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 145 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 146 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 147 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 148 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 149 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 150 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 151 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 152 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 153 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 154 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 155 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 156 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 157 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 158 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 159 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 160 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 161 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 162 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 163 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 164 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 165 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 166 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 167 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 168 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 169 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 170 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 171 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 172 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 173 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 174 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 175 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 176 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 177 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 178 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 179 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 180 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 181 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 182 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 183 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 184 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 185 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 186 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 187 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 188 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 189 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 190 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 191 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 192 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 193 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 194 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 195 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
        frame 196 { x: 57.2863771; y: -28.6776645; skew-x: -56.165345; skew-y: -56.151673; scale-x: 0.996505202; scale-y: 0.996885064; cel: -1; alpha: 1; }
    }
    Track {
        source-name: "Zombie_imp_outerleg_upper";
        frame-count: 197;
        frame 0 { x: 53.1695916; y: -24.7160966; skew-x: -43.9323874; skew-y: -43.9342749; scale-x: 0.997378554; scale-y: 0.997805111; cel: -1; alpha: 1; }
        frame 1 { x: 53.3202163; y: -24.7018004; skew-x: -44.0775149; skew-y: -44.0152228; scale-x: 0.996887592; scale-y: 0.99699672; cel: -1; alpha: 1; }
        frame 2 { x: 53.3565761; y: -24.6530537; skew-x: -43.9975589; skew-y: -44.0193872; scale-x: 0.997775209; scale-y: 0.996898495; cel: -1; alpha: 1; }
        frame 3 { x: 53.5544885; y: -24.5939608; skew-x: -44.0163821; skew-y: -44.0259099; scale-x: 0.997575103; scale-y: 0.996833554; cel: -1; alpha: 1; }
        frame 4 { x: 53.5135935; y: -24.6706067; skew-x: -43.9351131; skew-y: -43.932671; scale-x: 0.997369741; scale-y: 0.996770778; cel: -1; alpha: 1; }
        frame 5 { x: 53.7112302; y: -24.7181875; skew-x: -43.9537474; skew-y: -43.9396732; scale-x: 0.997159183; scale-y: 0.996710096; cel: -1; alpha: 1; }
        frame 6 { x: 53.9491902; y: -24.6450729; skew-x: -44.0722803; skew-y: -44.0469193; scale-x: 0.996943487; scale-y: 0.996651434; cel: -1; alpha: 1; }
        frame 7 { x: 54.0385349; y: -24.6070572; skew-x: -44.0613313; skew-y: -44.0792572; scale-x: 0.997049882; scale-y: 0.997269979; cel: -1; alpha: 1; }
        frame 8 { x: 54.2445695; y: -24.6984338; skew-x: -44.0124199; skew-y: -43.9537234; scale-x: 0.995025218; scale-y: 0.998697514; cel: -1; alpha: 1; }
        frame 9 { x: 54.2958583; y: -24.657396; skew-x: -43.9970516; skew-y: -43.9946169; scale-x: 0.996606764; scale-y: 0.997142395; cel: -1; alpha: 1; }
        frame 10 { x: 54.2440635; y: -24.7183114; skew-x: -43.9149282; skew-y: -43.9025261; scale-x: 0.997374086; scale-y: 0.998076452; cel: -1; alpha: 1; }
        frame 11 { x: 54.1110084; y: -24.7330547; skew-x: -43.9528801; skew-y: -43.9517779; scale-x: 0.996993578; scale-y: 0.996552938; cel: -1; alpha: 1; }
        frame 12 { x: 53.969462; y: -24.6236367; skew-x: -43.9899435; skew-y: -44.0017848; scale-x: 0.997593874; scale-y: 0.996017382; cel: -1; alpha: 1; }
        frame 13 { x: 53.9757826; y: -24.7228148; skew-x: -44.0602315; skew-y: -44.0184235; scale-x: 0.996397386; scale-y: 0.996974236; cel: -1; alpha: 1; }
        frame 14 { x: 53.8284794; y: -24.7347417; skew-x: -44.0353078; skew-y: -44.0258811; scale-x: 0.996438724; scale-y: 0.997865754; cel: -1; alpha: 1; }
        frame 15 { x: 53.686109; y: -24.6297166; skew-x: -44.0716796; skew-y: -44.0765917; scale-x: 0.997027574; scale-y: 0.997328712; cel: -1; alpha: 1; }
        frame 16 { x: 53.6042003; y: -24.7543826; skew-x: -44.0069951; skew-y: -44.0281907; scale-x: 0.997600408; scale-y: 0.996785057; cel: -1; alpha: 1; }
        frame 17 { x: 53.4677421; y: -24.7752915; skew-x: -44.0112182; skew-y: -44.0106852; scale-x: 0.997320567; scale-y: 0.996996097; cel: -1; alpha: 1; }
        frame 18 { x: 53.2940737; y: -24.7348518; skew-x: -43.9157996; skew-y: -43.8926624; scale-x: 0.99705234; scale-y: 0.997205901; cel: -1; alpha: 1; }
        frame 19 { x: 53.24644; y: -24.712869; skew-x: -43.9779863; skew-y: -44.0168623; scale-x: 0.998413019; scale-y: 0.995883722; cel: -1; alpha: 1; }
        frame 20 { x: 53.063185; y: -24.7594923; skew-x: -44.0276823; skew-y: -44.0524384; scale-x: 0.996625857; scale-y: 0.996575787; cel: -1; alpha: 1; }
        frame 21 { x: 53.1695916; y: -24.7160966; skew-x: -43.9323874; skew-y: -43.9342749; scale-x: 0.997378554; scale-y: 0.997805111; cel: -1; alpha: 1; }
        frame 22 { x: 53.5876161; y: -24.7519885; skew-x: -43.9119857; skew-y: -43.9120001; scale-x: 0.997733805; scale-y: 0.997733345; cel: -1; alpha: 1; }
        frame 23 { x: 53.219137; y: -24.4082714; skew-x: -44.0468339; skew-y: -43.9224652; scale-x: 0.995875202; scale-y: 0.9977152; cel: -1; alpha: 1; }
        frame 24 { x: 52.5727569; y: -24.3917751; skew-x: -43.9097255; skew-y: -43.903719; scale-x: 0.996102041; scale-y: 0.996669593; cel: -1; alpha: 1; }
        frame 25 { x: 51.9516807; y: -24.3446029; skew-x: -43.8790482; skew-y: -43.9797699; scale-x: 0.996945743; scale-y: 0.996054667; cel: -1; alpha: 1; }
        frame 26 { x: 51.4672536; y: -24.2973699; skew-x: -43.9196091; skew-y: -43.9823206; scale-x: 0.995858376; scale-y: 0.996272587; cel: -1; alpha: 1; }
        frame 27 { x: 50.968775; y: -24.3973667; skew-x: -43.8843215; skew-y: -43.8662751; scale-x: 0.997861372; scale-y: 0.997372866; cel: -1; alpha: 1; }
        frame 28 { x: 50.8969445; y: -24.4651692; skew-x: -43.9096683; skew-y: -43.8621323; scale-x: 0.995870257; scale-y: 0.9961612; cel: -1; alpha: 1; }
        frame 29 { x: 50.7414999; y: -24.572435; skew-x: -43.9418925; skew-y: -43.853917; scale-x: 0.995896521; scale-y: 0.995941012; cel: -1; alpha: 1; }
        frame 30 { x: 50.5165721; y: -24.6542301; skew-x: -43.8738464; skew-y: -43.8455489; scale-x: 0.996071666; scale-y: 0.99562362; cel: -1; alpha: 1; }
        frame 31 { x: 50.4259072; y: -24.7279948; skew-x: -44.0015109; skew-y: -43.8404303; scale-x: 0.996031437; scale-y: 0.996476465; cel: -1; alpha: 1; }
        frame 32 { x: 49.9886205; y: -24.7916201; skew-x: -43.9312218; skew-y: -43.9341172; scale-x: 0.997245031; scale-y: 0.998180923; cel: -1; alpha: 1; }
        frame 33 { x: 50.4673246; y: -24.6181571; skew-x: -43.9242973; skew-y: -43.8634917; scale-x: 0.996198252; scale-y: 0.996478589; cel: -1; alpha: 1; }
        frame 34 { x: 50.4105284; y: -24.4400311; skew-x: -43.9136923; skew-y: -43.8952491; scale-x: 0.997290609; scale-y: 0.997802129; cel: -1; alpha: 1; }
        frame 35 { x: 52.8348062; y: -24.6844432; skew-x: -43.9799639; skew-y: -43.9473823; scale-x: 0.995704074; scale-y: 0.996644533; cel: -1; alpha: 1; }
        frame 36 { x: 55.0741677; y: -25.9250308; skew-x: -43.8723362; skew-y: -43.8723565; scale-x: 0.99786226; scale-y: 0.997861808; cel: -1; alpha: 1; }
        frame 37 { x: 55.3378353; y: -25.7136096; skew-x: -43.9034847; skew-y: -43.9074547; scale-x: 0.997733308; scale-y: 0.996721605; cel: -1; alpha: 1; }
        frame 38 { x: 55.5601187; y: -25.7074547; skew-x: -43.8360974; skew-y: -43.841042; scale-x: 0.998655805; scale-y: 0.996623154; cel: -1; alpha: 1; }
        frame 39 { x: 55.4090616; y: -25.3628321; skew-x: -43.9758372; skew-y: -43.9759011; scale-x: 0.997508703; scale-y: 0.997429739; cel: -1; alpha: 1; }
        frame 40 { x: 55.2289041; y: -25.0138029; skew-x: -43.965605; skew-y: -43.9606729; scale-x: 0.997323938; scale-y: 0.997434562; cel: -1; alpha: 1; }
        frame 41 { x: 55.0010821; y: -24.8646647; skew-x: -43.9565841; skew-y: -43.9441641; scale-x: 0.99715434; scale-y: 0.997429894; cel: -1; alpha: 1; }
        frame 42 { x: 54.9337815; y: -24.5290089; skew-x: -44.0798631; skew-y: -44.0168769; scale-x: 0.996750606; scale-y: 0.997195954; cel: -1; alpha: 1; }
        frame 43 { x: 54.693785; y: -24.2075089; skew-x: -44.1035997; skew-y: -44.0860325; scale-x: 0.997489064; scale-y: 0.99692729; cel: -1; alpha: 1; }
        frame 44 { x: 54.5222187; y: -23.9818749; skew-x: -43.9993511; skew-y: -43.9828902; scale-x: 0.996375719; scale-y: 0.996398529; cel: -1; alpha: 1; }
        frame 45 { x: 54.2589886; y: -23.8086839; skew-x: -43.9965413; skew-y: -43.9779813; scale-x: 0.996258788; scale-y: 0.996864737; cel: -1; alpha: 1; }
        frame 46 { x: 54.1940473; y: -23.6374739; skew-x: -43.9166049; skew-y: -43.9499014; scale-x: 0.997942265; scale-y: 0.997688812; cel: -1; alpha: 1; }
        frame 47 { x: 53.7686362; y: -23.7136203; skew-x: -43.9857421; skew-y: -43.9937117; scale-x: 0.997177528; scale-y: 0.995878285; cel: -1; alpha: 1; }
        frame 48 { x: 53.2933212; y: -23.8776406; skew-x: -43.9933044; skew-y: -43.9895994; scale-x: 0.996069981; scale-y: 0.996276073; cel: -1; alpha: 1; }
        frame 49 { x: 52.7830547; y: -24.0425394; skew-x: -44.0297888; skew-y: -43.9610778; scale-x: 0.995963932; scale-y: 0.996712053; cel: -1; alpha: 1; }
        frame 50 { x: 52.3228146; y: -24.4320701; skew-x: -43.8783794; skew-y: -43.9202107; scale-x: 0.996803892; scale-y: 0.99636564; cel: -1; alpha: 1; }
        frame 51 { x: 51.443687; y: -24.65854; skew-x: -43.9154322; skew-y: -43.8907011; scale-x: 0.997814749; scale-y: 0.997716046; cel: -1; alpha: 1; }
        frame 52 { x: 50.8863901; y: -24.3245534; skew-x: -43.9590114; skew-y: -44.0299723; scale-x: 0.996150504; scale-y: 0.995580896; cel: -1; alpha: 1; }
        frame 53 { x: 50.3053653; y: -24.3639172; skew-x: -44.0010257; skew-y: -43.8716677; scale-x: 0.996017748; scale-y: 0.99550045; cel: -1; alpha: 1; }
        frame 54 { x: 49.3229488; y: -24.2368798; skew-x: -43.8402375; skew-y: -44.0080715; scale-x: 0.99635423; scale-y: 0.99698354; cel: -1; alpha: 1; }
        frame 55 { x: 48.7453697; y: -24.2814352; skew-x: -43.8832326; skew-y: -43.8480161; scale-x: 0.996460265; scale-y: 0.996414542; cel: -1; alpha: 1; }
        frame 56 { x: 47.820646; y: -24.3018903; skew-x: -43.9243862; skew-y: -43.8911303; scale-x: 0.997635174; scale-y: 0.997295045; cel: -1; alpha: 1; }
        frame 57 { x: 49.4921603; y: -24.3585567; skew-x: -43.9872507; skew-y: -43.9042624; scale-x: 0.995530021; scale-y: 0.995793799; cel: -1; alpha: 1; }
        frame 58 { x: 50.7431652; y: -24.3894859; skew-x: -43.9497863; skew-y: -43.9272391; scale-x: 0.9974921; scale-y: 0.997455386; cel: -1; alpha: 1; }
        frame 59 { x: 52.7146086; y: -24.2994935; skew-x: -43.9547848; skew-y: -43.9419032; scale-x: 0.996053752; scale-y: 0.996482424; cel: -1; alpha: 1; }
        frame 60 { x: 54.9274297; y: -25.0206613; skew-x: -43.9205255; skew-y: -43.9012982; scale-x: 0.998317098; scale-y: 0.996997761; cel: -1; alpha: 1; }
        frame 61 { x: 54.8793697; y: -24.7348613; skew-x: -44.0944862; skew-y: -44.0411892; scale-x: 0.996571544; scale-y: 0.997164604; cel: -1; alpha: 1; }
        frame 62 { x: 54.8954031; y: -24.5339753; skew-x: -43.9108738; skew-y: -43.9272872; scale-x: 0.998152997; scale-y: 0.997515373; cel: -1; alpha: 1; }
        frame 63 { x: 54.7761553; y: -24.2873915; skew-x: -43.9559862; skew-y: -43.9819074; scale-x: 0.99838033; scale-y: 0.996584722; cel: -1; alpha: 1; }
        frame 64 { x: 54.7299242; y: -24.1490641; skew-x: -43.9678038; skew-y: -43.9703693; scale-x: 0.997574017; scale-y: 0.996285493; cel: -1; alpha: 1; }
        frame 65 { x: 54.5386822; y: -23.9182259; skew-x: -43.9222676; skew-y: -43.9016252; scale-x: 0.996971523; scale-y: 0.998193256; cel: -1; alpha: 1; }
        frame 66 { x: 54.3405395; y: -24.1314937; skew-x: -44.0979345; skew-y: -44.0788886; scale-x: 0.997301383; scale-y: 0.996222879; cel: -1; alpha: 1; }
        frame 67 { x: 54.0787157; y: -24.1265909; skew-x: -44.0888888; skew-y: -44.0253246; scale-x: 0.996893404; scale-y: 0.99710549; cel: -1; alpha: 1; }
        frame 68 { x: 53.9585801; y: -24.3732948; skew-x: -44.0010002; skew-y: -44.0437376; scale-x: 0.997533925; scale-y: 0.996504004; cel: -1; alpha: 1; }
        frame 69 { x: 53.6671185; y: -24.31616; skew-x: -44.0977524; skew-y: -43.9900535; scale-x: 0.996214949; scale-y: 0.997361622; cel: -1; alpha: 1; }
        frame 70 { x: 53.5876161; y: -24.7519885; skew-x: -43.9119857; skew-y: -43.9120001; scale-x: 0.997733805; scale-y: 0.997733345; cel: -1; alpha: 1; }
        frame 71 { x: 53.5345616; y: -24.7519935; skew-x: -43.9119857; skew-y: -43.9120001; scale-x: 0.997733805; scale-y: 0.997733345; cel: -1; alpha: 1; }
        frame 72 { x: 52.5812707; y: -24.6004126; skew-x: -43.9395165; skew-y: -43.9395316; scale-x: 0.996029215; scale-y: 0.996028752; cel: -1; alpha: 1; }
        frame 73 { x: 51.5648413; y: -24.4115291; skew-x: -43.9670474; skew-y: -43.9670629; scale-x: 0.99632226; scale-y: 0.996321798; cel: -1; alpha: 1; }
        frame 74 { x: 50.6367271; y: -24.430995; skew-x: -43.8945784; skew-y: -43.8945942; scale-x: 0.996615476; scale-y: 0.996615018; cel: -1; alpha: 1; }
        frame 75 { x: 49.7318908; y: -24.4061419; skew-x: -43.9221094; skew-y: -43.9221254; scale-x: 0.995908956; scale-y: 0.995908504; cel: -1; alpha: 1; }
        frame 76 { x: 48.8158423; y: -24.7157438; skew-x: -43.8496406; skew-y: -43.8496565; scale-x: 0.996202222; scale-y: 0.996201776; cel: -1; alpha: 1; }
        frame 77 { x: 47.7957721; y: -24.712871; skew-x: -43.9771719; skew-y: -43.9771875; scale-x: 0.99649566; scale-y: 0.996495221; cel: -1; alpha: 1; }
        frame 78 { x: 47.0512693; y: -25.2607292; skew-x: -43.8047033; skew-y: -43.8047184; scale-x: 0.99578848; scale-y: 0.995788046; cel: -1; alpha: 1; }
        frame 79 { x: 45.9521499; y: -25.5110243; skew-x: -43.9322348; skew-y: -43.9322491; scale-x: 0.998084147; scale-y: 0.998083713; cel: -1; alpha: 1; }
        frame 80 { x: 45.8096868; y: -25.8432678; skew-x: -43.7891222; skew-y: -43.7891368; scale-x: 0.996272652; scale-y: 0.996272197; cel: -1; alpha: 1; }
        frame 81 { x: 45.3705711; y: -25.8501465; skew-x: -43.8460095; skew-y: -43.8460247; scale-x: 0.996463404; scale-y: 0.996462928; cel: -1; alpha: 1; }
        frame 82 { x: 44.9521515; y: -25.7478834; skew-x: -43.9028967; skew-y: -43.9029126; scale-x: 0.996654228; scale-y: 0.996653733; cel: -1; alpha: 1; }
        frame 83 { x: 44.7022119; y: -26.0248943; skew-x: -43.8597838; skew-y: -43.8598006; scale-x: 0.996845123; scale-y: 0.996844613; cel: -1; alpha: 1; }
        frame 84 { x: 44.2491937; y: -26.3046775; skew-x: -43.9166708; skew-y: -43.9166887; scale-x: 0.99703609; scale-y: 0.997035567; cel: -1; alpha: 1; }
        frame 85 { x: 44.0919072; y: -26.5713019; skew-x: -43.8735578; skew-y: -43.8735769; scale-x: 0.997227128; scale-y: 0.997226597; cel: -1; alpha: 1; }
        frame 86 { x: 44.8258376; y: -26.3221267; skew-x: -43.841472; skew-y: -43.8414886; scale-x: 0.996574589; scale-y: 0.996574083; cel: -1; alpha: 1; }
        frame 87 { x: 45.3046391; y: -26.1862965; skew-x: -43.90938; skew-y: -43.9093948; scale-x: 0.997930198; scale-y: 0.997929731; cel: -1; alpha: 1; }
        frame 88 { x: 47.2023379; y: -25.1274516; skew-x: -43.953617; skew-y: -43.9536323; scale-x: 0.996595881; scale-y: 0.996595439; cel: -1; alpha: 1; }
        frame 89 { x: 48.9089437; y: -24.8489653; skew-x: -43.8978538; skew-y: -43.8978701; scale-x: 0.99727105; scale-y: 0.997270627; cel: -1; alpha: 1; }
        frame 90 { x: 54.1575662; y: -25.5761067; skew-x: -43.9661592; skew-y: -43.9661781; scale-x: 0.998075699; scale-y: 0.998075282; cel: -1; alpha: 1; }
        frame 91 { x: 56.9510707; y: -27.6755127; skew-x: -43.8479739; skew-y: -43.8479934; scale-x: 0.997306533; scale-y: 0.997306118; cel: -1; alpha: 1; }
        frame 92 { x: 56.9522701; y: -27.6485639; skew-x: -43.847966; skew-y: -43.8479855; scale-x: 0.997306534; scale-y: 0.997306119; cel: -1; alpha: 1; }
        frame 93 { x: 56.9533878; y: -27.5573183; skew-x: -43.847966; skew-y: -43.8479855; scale-x: 0.997306534; scale-y: 0.997306119; cel: -1; alpha: 1; }
        frame 94 { x: 56.9544894; y: -27.4660676; skew-x: -43.847966; skew-y: -43.8479855; scale-x: 0.997306534; scale-y: 0.997306119; cel: -1; alpha: 1; }
        frame 95 { x: 56.9536326; y: -27.7592636; skew-x: -43.847966; skew-y: -43.8479855; scale-x: 0.997306534; scale-y: 0.997306119; cel: -1; alpha: 1; }
        frame 96 { x: 56.9522862; y: -27.648571; skew-x: -43.847966; skew-y: -43.8479855; scale-x: 0.997306534; scale-y: 0.997306119; cel: -1; alpha: 1; }
        frame 97 { x: 56.5866488; y: -27.0960132; skew-x: -43.7856784; skew-y: -43.7856971; scale-x: 0.997080554; scale-y: 0.997080142; cel: -1; alpha: 1; }
        frame 98 { x: 56.0989201; y: -26.5972726; skew-x: -43.8233964; skew-y: -43.8234142; scale-x: 0.997860027; scale-y: 0.997859614; cel: -1; alpha: 1; }
        frame 99 { x: 55.6865031; y: -26.1845576; skew-x: -43.7611143; skew-y: -43.7611313; scale-x: 0.997633924; scale-y: 0.997633508; cel: -1; alpha: 1; }
        frame 100 { x: 55.0470212; y: -25.7578629; skew-x: -44.0988323; skew-y: -44.0988484; scale-x: 0.997408379; scale-y: 0.997407956; cel: -1; alpha: 1; }
        frame 101 { x: 54.6469741; y: -25.484493; skew-x: -44.0365501; skew-y: -44.0365656; scale-x: 0.99718339; scale-y: 0.997182958; cel: -1; alpha: 1; }
        frame 102 { x: 54.0519607; y: -25.0570402; skew-x: -44.074268; skew-y: -44.0742828; scale-x: 0.996958956; scale-y: 0.99695851; cel: -1; alpha: 1; }
        frame 103 { x: 53.5345616; y: -24.7519935; skew-x: -43.9119857; skew-y: -43.9120001; scale-x: 0.997733805; scale-y: 0.997733345; cel: -1; alpha: 1; }
        frame 104 { x: 53.5345616; y: -24.7519935; skew-x: -43.9119857; skew-y: -43.9120001; scale-x: 0.997733805; scale-y: 0.997733345; cel: -1; alpha: 1; }
        frame 105 { x: 53.8241627; y: -24.7391042; skew-x: -43.954332; skew-y: -43.9543468; scale-x: 0.996400306; scale-y: 0.996399853; cel: -1; alpha: 1; }
        frame 106 { x: 53.9078693; y: -24.9437613; skew-x: -43.8966783; skew-y: -43.8966934; scale-x: 0.997065158; scale-y: 0.997064711; cel: -1; alpha: 1; }
        frame 107 { x: 54.2826763; y: -24.906433; skew-x: -44.0390246; skew-y: -44.03904; scale-x: 0.996730165; scale-y: 0.996729724; cel: -1; alpha: 1; }
        frame 108 { x: 54.5430702; y: -24.9450948; skew-x: -43.9813709; skew-y: -43.9813867; scale-x: 0.997396126; scale-y: 0.99739569; cel: -1; alpha: 1; }
        frame 109 { x: 54.7502396; y: -25.0865201; skew-x: -44.0237171; skew-y: -44.0237333; scale-x: 0.997060907; scale-y: 0.997060476; cel: -1; alpha: 1; }
        frame 110 { x: 54.9030279; y: -25.2769333; skew-x: -43.9660634; skew-y: -43.96608; scale-x: 0.99672524; scale-y: 0.996724813; cel: -1; alpha: 1; }
        frame 111 { x: 55.2013994; y: -25.2038049; skew-x: -44.1084096; skew-y: -44.1084267; scale-x: 0.997392536; scale-y: 0.997392112; cel: -1; alpha: 1; }
        frame 112 { x: 55.2719152; y: -25.6268758; skew-x: -43.9507551; skew-y: -43.9507726; scale-x: 0.998060727; scale-y: 0.998060305; cel: -1; alpha: 1; }
        frame 113 { x: 55.6649222; y: -25.8533388; skew-x: -43.875416; skew-y: -43.8754339; scale-x: 0.997240405; scale-y: 0.997239986; cel: -1; alpha: 1; }
        frame 114 { x: 56.046654; y: -26.2117424; skew-x: -43.7000769; skew-y: -43.7000952; scale-x: 0.997424237; scale-y: 0.997423819; cel: -1; alpha: 1; }
        frame 115 { x: 56.5350404; y: -26.404661; skew-x: -43.7247378; skew-y: -43.7247565; scale-x: 0.997608137; scale-y: 0.99760772; cel: -1; alpha: 1; }
        frame 116 { x: 56.9862819; y: -26.6704025; skew-x: -43.8493986; skew-y: -43.8494178; scale-x: 0.997792105; scale-y: 0.997791687; cel: -1; alpha: 1; }
        frame 117 { x: 57.297673; y: -26.9657279; skew-x: -43.774057; skew-y: -43.7740766; scale-x: 0.997976141; scale-y: 0.997975722; cel: -1; alpha: 1; }
        frame 118 { x: 57.8072089; y: -28.2356342; skew-x: -39.5896928; skew-y: -39.5897131; scale-x: 0.9971359; scale-y: 0.997135475; cel: -1; alpha: 1; }
        frame 119 { x: 58.2199293; y: -28.6852779; skew-x: -35.3053286; skew-y: -35.3053497; scale-x: 0.997300726; scale-y: 0.997300292; cel: -1; alpha: 1; }
        frame 120 { x: 57.288189; y: -27.9778534; skew-x: -31.1209645; skew-y: -31.1209861; scale-x: 0.996460098; scale-y: 0.996459653; cel: -1; alpha: 1; }
        frame 121 { x: 55.8853424; y: -26.7846376; skew-x: -27.0366043; skew-y: -27.0366261; scale-x: 0.997630545; scale-y: 0.997630085; cel: -1; alpha: 1; }
        frame 122 { x: 55.787122; y: -26.7876932; skew-x: -26.8366043; skew-y: -26.8366261; scale-x: 0.996624869; scale-y: 0.99662441; cel: -1; alpha: 1; }
        frame 123 { x: 55.8853493; y: -26.7846261; skew-x: -27.0365747; skew-y: -27.0365966; scale-x: 0.997630546; scale-y: 0.997630086; cel: -1; alpha: 1; }
        frame 124 { x: 47.5404863; y: -25.9165423; skew-x: -19.9138414; skew-y: -19.9138632; scale-x: 0.996137818; scale-y: 0.99613733; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_OUTERLEG_UPPER; }
        frame 125 { x: 37.3008589; y: -34.5897429; skew-x: -27.3852491; skew-y: -27.3852709; scale-x: 0.995514017; scale-y: 0.995513527; cel: 0; alpha: 1; }
        frame 126 { x: 26.5088548; y: -43.744271; skew-x: -35.0566568; skew-y: -35.0566785; scale-x: 0.994889998; scale-y: 0.994889507; cel: 0; alpha: 1; }
        frame 127 { x: 15.0797239; y: -51.798608; skew-x: -42.5280645; skew-y: -42.5280861; scale-x: 0.995273123; scale-y: 0.995272629; cel: 0; alpha: 1; }
        frame 128 { x: 4.56917553; y: -58.5110632; skew-x: -50.0994824; skew-y: -50.0995039; scale-x: 0.995656805; scale-y: 0.995656309; cel: 0; alpha: 1; }
        frame 129 { x: -51.2504527; y: -60.728011; skew-x: -53.7991397; skew-y: -53.7991619; scale-x: 0.99467478; scale-y: 0.994674312; cel: 0; alpha: 1; }
        frame 130 { x: -107.160525; y: -62.9395034; skew-x: -57.4987924; skew-y: -57.498815; scale-x: 0.995708326; scale-y: 0.995707886; cel: 0; alpha: 1; }
        frame 131 { x: -107.160525; y: -62.9395034; skew-x: -57.4987924; skew-y: -57.498815; scale-x: 0.995708326; scale-y: 0.995707886; cel: -1; alpha: 1; }
        frame 132 { x: -107.160525; y: -62.9395034; skew-x: -57.4987924; skew-y: -57.498815; scale-x: 0.995708326; scale-y: 0.995707886; cel: -1; alpha: 1; }
        frame 133 { x: -107.160525; y: -62.9395034; skew-x: -57.4987924; skew-y: -57.498815; scale-x: 0.995708326; scale-y: 0.995707886; cel: -1; alpha: 1; }
        frame 134 { x: -107.160525; y: -62.9395034; skew-x: -57.4987924; skew-y: -57.498815; scale-x: 0.995708326; scale-y: 0.995707886; cel: -1; alpha: 1; }
        frame 135 { x: -107.160525; y: -62.9395034; skew-x: -57.4987924; skew-y: -57.498815; scale-x: 0.995708326; scale-y: 0.995707886; cel: -1; alpha: 1; }
        frame 136 { x: -107.160525; y: -62.9395034; skew-x: -57.4987924; skew-y: -57.498815; scale-x: 0.995708326; scale-y: 0.995707886; cel: -1; alpha: 1; }
        frame 137 { x: -107.160525; y: -62.9395034; skew-x: -57.4987924; skew-y: -57.498815; scale-x: 0.995708326; scale-y: 0.995707886; cel: -1; alpha: 1; }
        frame 138 { x: 51.4271223; y: -20.8816031; skew-x: -48.423071; skew-y: -46.9998194; scale-x: 0.988587145; scale-y: 0.979751725; cel: -1; alpha: 1; }
        frame 139 { x: 50.8911932; y: -23.6371072; skew-x: -46.9002003; skew-y: -45.9327045; scale-x: 0.990931675; scale-y: 0.982938541; cel: -1; alpha: 1; }
        frame 140 { x: 50.5181418; y: -26.6638442; skew-x: -45.2568276; skew-y: -44.6865651; scale-x: 0.993481126; scale-y: 0.987988555; cel: -1; alpha: 1; }
        frame 141 { x: 50.6575094; y: -29.9950403; skew-x: -43.6946343; skew-y: -43.4578063; scale-x: 0.996256286; scale-y: 0.994911955; cel: -1; alpha: 1; }
        frame 142 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 143 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 144 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 145 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 146 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 147 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 148 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 149 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 150 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 151 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 152 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 153 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 154 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 155 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 156 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 157 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 158 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 159 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 160 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 161 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 162 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 163 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 164 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 165 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 166 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 167 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 168 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 169 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 170 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 171 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 172 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 173 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 174 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 175 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 176 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 177 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 178 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 179 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 180 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 181 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 182 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 183 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 184 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 185 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 186 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 187 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 188 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 189 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 190 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 191 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 192 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 193 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 194 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 195 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
        frame 196 { x: 48.5263836; y: -34.3304986; skew-x: -43.9099233; skew-y: -43.9065572; scale-x: 0.997694035; scale-y: 0.998138501; cel: -1; alpha: 1; }
    }
    Track {
        source-name: "Zombie_imp_body2";
        frame-count: 197;
        frame 0 { x: 40.0984637; y: -21.2244122; skew-x: -50.9321301; skew-y: -50.9280169; scale-x: 0.996511097; scale-y: 0.99693295; cel: -1; alpha: 1; }
        frame 1 { x: 40.2711241; y: -21.1823599; skew-x: -51.0741008; skew-y: -51.012112; scale-x: 0.996150767; scale-y: 0.995995064; cel: -1; alpha: 1; }
        frame 2 { x: 40.2885396; y: -21.1373671; skew-x: -50.9885472; skew-y: -51.0218853; scale-x: 0.996846179; scale-y: 0.996088303; cel: -1; alpha: 1; }
        frame 3 { x: 40.4906228; y: -21.0763014; skew-x: -51.0081256; skew-y: -51.0276528; scale-x: 0.996674105; scale-y: 0.995995587; cel: -1; alpha: 1; }
        frame 4 { x: 40.4477776; y: -21.1738238; skew-x: -50.9276686; skew-y: -50.9336013; scale-x: 0.996496192; scale-y: 0.995905616; cel: -1; alpha: 1; }
        frame 5 { x: 40.6495846; y: -21.2195253; skew-x: -50.9471708; skew-y: -50.9397344; scale-x: 0.996312483; scale-y: 0.995818335; cel: -1; alpha: 1; }
        frame 6 { x: 40.897844; y: -21.1217968; skew-x: -51.0666268; skew-y: -51.0460558; scale-x: 0.996123017; scale-y: 0.995733688; cel: -1; alpha: 1; }
        frame 7 { x: 40.9792277; y: -21.0848765; skew-x: -51.0598785; skew-y: -51.0741932; scale-x: 0.99614593; scale-y: 0.996435076; cel: -1; alpha: 1; }
        frame 8 { x: 41.1993317; y: -21.2169338; skew-x: -51.0338599; skew-y: -50.9258383; scale-x: 0.994335588; scale-y: 0.997648176; cel: -1; alpha: 1; }
        frame 9 { x: 41.2386473; y: -21.1545352; skew-x: -50.9974905; skew-y: -50.9876631; scale-x: 0.995750688; scale-y: 0.996260098; cel: -1; alpha: 1; }
        frame 10 { x: 41.171852; y: -21.2330651; skew-x: -50.9163742; skew-y: -50.8945659; scale-x: 0.996540793; scale-y: 0.997169871; cel: -1; alpha: 1; }
        frame 11 { x: 41.050374; y: -21.2341821; skew-x: -50.9465539; skew-y: -50.9515886; scale-x: 0.996119887; scale-y: 0.995688438; cel: -1; alpha: 1; }
        frame 12 { x: 40.9073484; y: -21.1078111; skew-x: -50.975923; skew-y: -51.009304; scale-x: 0.996675654; scale-y: 0.995197281; cel: -1; alpha: 1; }
        frame 13 { x: 40.9282297; y: -21.2096216; skew-x: -51.0603729; skew-y: -51.0117627; scale-x: 0.995624864; scale-y: 0.996008674; cel: -1; alpha: 1; }
        frame 14 { x: 40.7723161; y: -21.2285216; skew-x: -51.0418402; skew-y: -51.0128448; scale-x: 0.995610736; scale-y: 0.996954834; cel: -1; alpha: 1; }
        frame 15 { x: 40.628429; y: -21.1066734; skew-x: -51.0705968; skew-y: -51.0711585; scale-x: 0.996152205; scale-y: 0.996465187; cel: -1; alpha: 1; }
        frame 16 { x: 40.5388049; y: -21.2374994; skew-x: -50.9983992; skew-y: -51.0302725; scale-x: 0.996673775; scale-y: 0.995972726; cel: -1; alpha: 1; }
        frame 17 { x: 40.4058169; y: -21.2624748; skew-x: -51.0057085; skew-y: -51.009679; scale-x: 0.996447117; scale-y: 0.996130684; cel: -1; alpha: 1; }
        frame 18 { x: 40.2295151; y: -21.2487859; skew-x: -50.913275; skew-y: -50.8886691; scale-x: 0.996233735; scale-y: 0.99628569; cel: -1; alpha: 1; }
        frame 19 { x: 40.1749866; y: -21.1902446; skew-x: -50.9577623; skew-y: -51.0306039; scale-x: 0.997423224; scale-y: 0.995134385; cel: -1; alpha: 1; }
        frame 20 { x: 40.0080386; y: -21.2446588; skew-x: -51.0244535; skew-y: -51.0491492; scale-x: 0.995703944; scale-y: 0.995759811; cel: -1; alpha: 1; }
        frame 21 { x: 40.0984637; y: -21.2244122; skew-x: -50.9321301; skew-y: -50.9280169; scale-x: 0.996511097; scale-y: 0.99693295; cel: -1; alpha: 1; }
        frame 22 { x: 40.5126901; y: -21.2618439; skew-x: -50.9087347; skew-y: -50.9087345; scale-x: 0.996863647; scale-y: 0.996863638; cel: -1; alpha: 1; }
        frame 23 { x: 40.1786234; y: -20.912504; skew-x: -51.054533; skew-y: -50.9082273; scale-x: 0.995295615; scale-y: 0.996556109; cel: -1; alpha: 1; }
        frame 24 { x: 39.516985; y: -20.9110186; skew-x: -50.9103352; skew-y: -50.8965945; scale-x: 0.995254381; scale-y: 0.995779728; cel: -1; alpha: 1; }
        frame 25 { x: 38.8808449; y: -20.8525379; skew-x: -50.8711005; skew-y: -50.9811802; scale-x: 0.995851581; scale-y: 0.995410965; cel: -1; alpha: 1; }
        frame 26 { x: 38.4103203; y: -20.809044; skew-x: -50.9201737; skew-y: -50.9752339; scale-x: 0.994864307; scale-y: 0.995529768; cel: -1; alpha: 1; }
        frame 27 { x: 37.8942041; y: -20.912211; skew-x: -50.8774146; skew-y: -50.8666668; scale-x: 0.997021848; scale-y: 0.996472745; cel: -1; alpha: 1; }
        frame 28 { x: 37.8488834; y: -20.9872165; skew-x: -50.9077383; skew-y: -50.8575407; scale-x: 0.995105913; scale-y: 0.995188655; cel: -1; alpha: 1; }
        frame 29 { x: 37.6995001; y: -21.0890899; skew-x: -50.9376486; skew-y: -50.8516281; scale-x: 0.995213393; scale-y: 0.994887465; cel: -1; alpha: 1; }
        frame 30 { x: 37.4654785; y: -21.1787098; skew-x: -50.8670628; skew-y: -50.8458162; scale-x: 0.995255754; scale-y: 0.994702982; cel: -1; alpha: 1; }
        frame 31 { x: 37.3899554; y: -21.2383042; skew-x: -50.9989665; skew-y: -50.836402; scale-x: 0.995507819; scale-y: 0.995262763; cel: -1; alpha: 1; }
        frame 32 { x: 36.9167668; y: -21.3029987; skew-x: -50.9345179; skew-y: -50.9243105; scale-x: 0.996383124; scale-y: 0.997302994; cel: -1; alpha: 1; }
        frame 33 { x: 37.4169954; y: -21.1367273; skew-x: -50.922096; skew-y: -50.8591683; scale-x: 0.995461375; scale-y: 0.995478014; cel: -1; alpha: 1; }
        frame 34 { x: 37.3407026; y: -20.9549347; skew-x: -50.9137234; skew-y: -50.8887018; scale-x: 0.996467259; scale-y: 0.99688592; cel: -1; alpha: 1; }
        frame 35 { x: 39.7890088; y: -21.1929538; skew-x: -50.9827745; skew-y: -50.9380571; scale-x: 0.994918135; scale-y: 0.995693256; cel: -1; alpha: 1; }
        frame 36 { x: 41.9951453; y: -22.4434864; skew-x: -50.8690853; skew-y: -50.8690907; scale-x: 0.996991977; scale-y: 0.996992002; cel: -1; alpha: 1; }
        frame 37 { x: 42.2666787; y: -22.2203072; skew-x: -50.8932709; skew-y: -50.9111584; scale-x: 0.996839852; scale-y: 0.995876055; cel: -1; alpha: 1; }
        frame 38 { x: 42.4773338; y: -22.2214027; skew-x: -50.818822; skew-y: -50.8518279; scale-x: 0.997744385; scale-y: 0.995794793; cel: -1; alpha: 1; }
        frame 39 { x: 42.3413361; y: -21.8585344; skew-x: -50.9720417; skew-y: -50.97318; scale-x: 0.996637473; scale-y: 0.996561565; cel: -1; alpha: 1; }
        frame 40 { x: 42.1625203; y: -21.5137805; skew-x: -50.9630522; skew-y: -50.9567091; scale-x: 0.996466187; scale-y: 0.996553066; cel: -1; alpha: 1; }
        frame 41 { x: 41.9362339; y: -21.3686688; skew-x: -50.955066; skew-y: -50.9391655; scale-x: 0.996314929; scale-y: 0.996530203; cel: -1; alpha: 1; }
        frame 42 { x: 41.8851489; y: -21.0111608; skew-x: -51.0787749; skew-y: -51.0114401; scale-x: 0.996020371; scale-y: 0.996187607; cel: -1; alpha: 1; }
        frame 43 { x: 41.6378174; y: -20.6732752; skew-x: -51.0961898; skew-y: -51.0869278; scale-x: 0.996647755; scale-y: 0.996029668; cel: -1; alpha: 1; }
        frame 44 { x: 41.4716673; y: -20.4779926; skew-x: -50.9960174; skew-y: -50.9797066; scale-x: 0.995541701; scale-y: 0.995495031; cel: -1; alpha: 1; }
        frame 45 { x: 41.2073096; y: -20.3087758; skew-x: -50.9972309; skew-y: -50.9707762; scale-x: 0.995437948; scale-y: 0.995947729; cel: -1; alpha: 1; }
        frame 46 { x: 41.1150813; y: -20.1417082; skew-x: -50.9120913; skew-y: -50.947896; scale-x: 0.996998166; scale-y: 0.996892891; cel: -1; alpha: 1; }
        frame 47 { x: 40.7107724; y: -20.2018334; skew-x: -50.973586; skew-y: -50.9993618; scale-x: 0.996271908; scale-y: 0.995046097; cel: -1; alpha: 1; }
        frame 48 { x: 40.2445205; y: -20.3760648; skew-x: -50.9914346; skew-y: -50.9849527; scale-x: 0.995212149; scale-y: 0.99539676; cel: -1; alpha: 1; }
        frame 49 { x: 39.7407415; y: -20.5407518; skew-x: -51.0307233; skew-y: -50.9536177; scale-x: 0.995250839; scale-y: 0.995687622; cel: -1; alpha: 1; }
        frame 50 { x: 39.2565819; y: -20.9474571; skew-x: -50.8727058; skew-y: -50.9193642; scale-x: 0.99584021; scale-y: 0.995591428; cel: -1; alpha: 1; }
        frame 51 { x: 38.3703967; y: -21.168824; skew-x: -50.911132; skew-y: -50.8884835; scale-x: 0.996995117; scale-y: 0.996795765; cel: -1; alpha: 1; }
        frame 52 { x: 37.831843; y: -20.820922; skew-x: -50.952854; skew-y: -51.0296024; scale-x: 0.99512437; scale-y: 0.994870358; cel: -1; alpha: 1; }
        frame 53 { x: 37.2713372; y: -20.8673106; skew-x: -50.9922627; skew-y: -50.8738854; scale-x: 0.995412966; scale-y: 0.994369018; cel: -1; alpha: 1; }
        frame 54 { x: 36.2450466; y: -20.7576116; skew-x: -50.8438592; skew-y: -50.9978845; scale-x: 0.99514186; scale-y: 0.996458238; cel: -1; alpha: 1; }
        frame 55 { x: 35.6884921; y: -20.8048745; skew-x: -50.8791442; skew-y: -50.8455854; scale-x: 0.99566456; scale-y: 0.995472652; cel: -1; alpha: 1; }
        frame 56 { x: 34.7520557; y: -20.8102931; skew-x: -50.9182833; skew-y: -50.8907158; scale-x: 0.996830023; scale-y: 0.996360825; cel: -1; alpha: 1; }
        frame 57 { x: 36.4563122; y: -20.8668163; skew-x: -50.9846063; skew-y: -50.9003752; scale-x: 0.994839966; scale-y: 0.994747586; cel: -1; alpha: 1; }
        frame 58 { x: 37.6757342; y: -20.8931826; skew-x: -50.9459488; skew-y: -50.924559; scale-x: 0.996669062; scale-y: 0.996539017; cel: -1; alpha: 1; }
        frame 59 { x: 39.6634093; y: -20.8085283; skew-x: -50.9543268; skew-y: -50.9358451; scale-x: 0.995218516; scale-y: 0.995580338; cel: -1; alpha: 1; }
        frame 60 { x: 41.8529741; y: -21.5218118; skew-x: -50.9078377; skew-y: -50.9074817; scale-x: 0.997467338; scale-y: 0.996107817; cel: -1; alpha: 1; }
        frame 61 { x: 41.8325091; y: -21.2142428; skew-x: -51.0945689; skew-y: -51.0345845; scale-x: 0.995823281; scale-y: 0.996174454; cel: -1; alpha: 1; }
        frame 62 { x: 41.8164675; y: -21.0383023; skew-x: -50.9034437; skew-y: -50.9282021; scale-x: 0.99723854; scale-y: 0.996689763; cel: -1; alpha: 1; }
        frame 63 { x: 41.7014966; y: -20.7743957; skew-x: -50.940662; skew-y: -50.9907326; scale-x: 0.997428582; scale-y: 0.995796904; cel: -1; alpha: 1; }
        frame 64 { x: 41.6661621; y: -20.6404526; skew-x: -50.9556457; skew-y: -50.9760217; scale-x: 0.996679555; scale-y: 0.995441461; cel: -1; alpha: 1; }
        frame 65 { x: 41.4705052; y: -20.4358257; skew-x: -50.9272015; skew-y: -50.8901824; scale-x: 0.996163632; scale-y: 0.997261474; cel: -1; alpha: 1; }
        frame 66 { x: 41.2891622; y: -20.5968943; skew-x: -51.0869129; skew-y: -51.0834018; scale-x: 0.996455663; scale-y: 0.995330455; cel: -1; alpha: 1; }
        frame 67 { x: 41.0298807; y: -20.605127; skew-x: -51.0861711; skew-y: -51.0215169; scale-x: 0.996160789; scale-y: 0.996099511; cel: -1; alpha: 1; }
        frame 68 { x: 40.8928969; y: -20.8552896; skew-x: -50.9912326; skew-y: -51.0469893; scale-x: 0.996558924; scale-y: 0.995740289; cel: -1; alpha: 1; }
        frame 69 { x: 40.6270651; y: -20.8030014; skew-x: -51.1008765; skew-y: -50.9803906; scale-x: 0.995589629; scale-y: 0.996248506; cel: -1; alpha: 1; }
        frame 70 { x: 40.5126901; y: -21.2618439; skew-x: -50.9087347; skew-y: -50.9087345; scale-x: 0.996863647; scale-y: 0.996863638; cel: -1; alpha: 1; }
        frame 71 { x: 40.4596355; y: -21.2618489; skew-x: -50.9087347; skew-y: -50.9087345; scale-x: 0.996863647; scale-y: 0.996863638; cel: -1; alpha: 1; }
        frame 72 { x: 39.5303583; y: -21.1099593; skew-x: -50.9362655; skew-y: -50.9362659; scale-x: 0.995160542; scale-y: 0.995160533; cel: -1; alpha: 1; }
        frame 73 { x: 38.5117683; y: -20.9137763; skew-x: -50.9637964; skew-y: -50.9637973; scale-x: 0.99545333; scale-y: 0.995453325; cel: -1; alpha: 1; }
        frame 74 { x: 37.5753976; y: -20.9487304; skew-x: -50.8913274; skew-y: -50.8913286; scale-x: 0.99574629; scale-y: 0.99574629; cel: -1; alpha: 1; }
        frame 75 { x: 36.6814943; y: -20.9200747; skew-x: -50.9188585; skew-y: -50.9188597; scale-x: 0.995040385; scale-y: 0.995040391; cel: -1; alpha: 1; }
        frame 76 { x: 35.7572027; y: -21.2451641; skew-x: -50.8463897; skew-y: -50.8463908; scale-x: 0.995333396; scale-y: 0.995333408; cel: -1; alpha: 1; }
        frame 77 { x: 34.7410456; y: -21.2122027; skew-x: -50.973921; skew-y: -50.9739217; scale-x: 0.995626579; scale-y: 0.995626596; cel: -1; alpha: 1; }
        frame 78 { x: 33.9953363; y: -21.8018298; skew-x: -50.8014524; skew-y: -50.8014525; scale-x: 0.994920018; scale-y: 0.994920036; cel: -1; alpha: 1; }
        frame 79 { x: 32.8738673; y: -22.0150321; skew-x: -50.9289839; skew-y: -50.9289833; scale-x: 0.997213684; scale-y: 0.997213701; cel: -1; alpha: 1; }
        frame 80 { x: 32.7464654; y: -22.3862389; skew-x: -50.7858712; skew-y: -50.7858712; scale-x: 0.995403768; scale-y: 0.995403764; cel: -1; alpha: 1; }
        frame 81 { x: 32.308288; y: -22.3794846; skew-x: -50.8427583; skew-y: -50.8427591; scale-x: 0.995594352; scale-y: 0.995594331; cel: -1; alpha: 1; }
        frame 82 { x: 31.89082; y: -22.2635869; skew-x: -50.8996454; skew-y: -50.8996472; scale-x: 0.995785007; scale-y: 0.995784971; cel: -1; alpha: 1; }
        frame 83 { x: 31.6357601; y: -22.5497613; skew-x: -50.8565324; skew-y: -50.8565353; scale-x: 0.995975734; scale-y: 0.995975687; cel: -1; alpha: 1; }
        frame 84 { x: 31.1836961; y: -22.8159046; skew-x: -50.9134194; skew-y: -50.9134235; scale-x: 0.996166532; scale-y: 0.996166478; cel: -1; alpha: 1; }
        frame 85 { x: 31.0212841; y: -23.0916945; skew-x: -50.8703063; skew-y: -50.8703117; scale-x: 0.9963574; scale-y: 0.996357344; cel: -1; alpha: 1; }
        frame 86 { x: 31.7618222; y: -22.8521119; skew-x: -50.8382206; skew-y: -50.8382232; scale-x: 0.995705437; scale-y: 0.995705392; cel: -1; alpha: 1; }
        frame 87 { x: 32.2269806; y: -22.6960595; skew-x: -50.9061289; skew-y: -50.9061292; scale-x: 0.997059867; scale-y: 0.997059855; cel: -1; alpha: 1; }
        frame 88 { x: 34.1448602; y: -21.631799; skew-x: -50.9503661; skew-y: -50.9503666; scale-x: 0.995726713; scale-y: 0.995726726; cel: -1; alpha: 1; }
        frame 89 { x: 35.8392214; y: -21.3636629; skew-x: -50.894603; skew-y: -50.8946041; scale-x: 0.996401292; scale-y: 0.996401327; cel: -1; alpha: 1; }
        frame 90 { x: 41.081466; y: -22.0724009; skew-x: -50.9629085; skew-y: -50.962912; scale-x: 0.997205234; scale-y: 0.997205286; cel: -1; alpha: 1; }
        frame 91 { x: 43.8778538; y: -24.201466; skew-x: -50.8447232; skew-y: -50.8447273; scale-x: 0.996436738; scale-y: 0.996436794; cel: -1; alpha: 1; }
        frame 92 { x: 43.8790527; y: -24.174519; skew-x: -50.8447153; skew-y: -50.8447194; scale-x: 0.996436738; scale-y: 0.996436795; cel: -1; alpha: 1; }
        frame 93 { x: 43.8801704; y: -24.0832734; skew-x: -50.8447153; skew-y: -50.8447194; scale-x: 0.996436738; scale-y: 0.996436795; cel: -1; alpha: 1; }
        frame 94 { x: 43.881272; y: -23.9920227; skew-x: -50.8447153; skew-y: -50.8447194; scale-x: 0.996436738; scale-y: 0.996436795; cel: -1; alpha: 1; }
        frame 95 { x: 43.8804152; y: -24.2852186; skew-x: -50.8447153; skew-y: -50.8447194; scale-x: 0.996436738; scale-y: 0.996436795; cel: -1; alpha: 1; }
        frame 96 { x: 43.8790688; y: -24.1745261; skew-x: -50.8447153; skew-y: -50.8447194; scale-x: 0.996436738; scale-y: 0.996436795; cel: -1; alpha: 1; }
        frame 97 { x: 43.5126256; y: -23.6369666; skew-x: -50.7824277; skew-y: -50.782431; scale-x: 0.996210957; scale-y: 0.996211013; cel: -1; alpha: 1; }
        frame 98 { x: 43.016958; y: -23.1269092; skew-x: -50.8201457; skew-y: -50.8201482; scale-x: 0.996989752; scale-y: 0.996989804; cel: -1; alpha: 1; }
        frame 99 { x: 42.6037415; y: -22.7291999; skew-x: -50.7578636; skew-y: -50.7578653; scale-x: 0.996763848; scale-y: 0.996763893; cel: -1; alpha: 1; }
        frame 100 { x: 41.9878069; y: -22.2262507; skew-x: -51.0955815; skew-y: -51.0955825; scale-x: 0.996538501; scale-y: 0.996538537; cel: -1; alpha: 1; }
        frame 101 { x: 41.5868753; y: -21.9678721; skew-x: -51.0332993; skew-y: -51.0332997; scale-x: 0.99631371; scale-y: 0.996313733; cel: -1; alpha: 1; }
        frame 102 { x: 40.9971187; y: -21.532616; skew-x: -51.071017; skew-y: -51.0710171; scale-x: 0.996089472; scale-y: 0.99608948; cel: -1; alpha: 1; }
        frame 103 { x: 40.4596355; y: -21.2618489; skew-x: -50.9087347; skew-y: -50.9087345; scale-x: 0.996863647; scale-y: 0.996863638; cel: -1; alpha: 1; }
        frame 104 { x: 40.4596355; y: -21.2618489; skew-x: -50.9087347; skew-y: -50.9087345; scale-x: 0.996863647; scale-y: 0.996863638; cel: -1; alpha: 1; }
        frame 105 { x: 40.7692912; y: -21.2439747; skew-x: -50.951081; skew-y: -50.9510811; scale-x: 0.99553131; scale-y: 0.995531309; cel: -1; alpha: 1; }
        frame 106 { x: 40.8407741; y: -21.4594466; skew-x: -50.8934274; skew-y: -50.8934276; scale-x: 0.996195581; scale-y: 0.996195589; cel: -1; alpha: 1; }
        frame 107 { x: 41.2286652; y: -21.3908466; skew-x: -51.0357737; skew-y: -51.0357742; scale-x: 0.99586088; scale-y: 0.995860894; cel: -1; alpha: 1; }
        frame 108 { x: 41.4768038; y: -21.4403056; skew-x: -50.97812; skew-y: -50.9781208; scale-x: 0.996526259; scale-y: 0.996526281; cel: -1; alpha: 1; }
        frame 109 { x: 41.6909576; y: -21.573256; skew-x: -51.0204663; skew-y: -51.0204675; scale-x: 0.996191332; scale-y: 0.996191359; cel: -1; alpha: 1; }
        frame 110 { x: 41.8446149; y: -21.7779902; skew-x: -50.9628126; skew-y: -50.9628141; scale-x: 0.995855957; scale-y: 0.99585599; cel: -1; alpha: 1; }
        frame 111 { x: 42.1429828; y: -21.6700659; skew-x: -51.1051589; skew-y: -51.1051608; scale-x: 0.99652267; scale-y: 0.996522708; cel: -1; alpha: 1; }
        frame 112 { x: 42.1950699; y: -22.1267382; skew-x: -50.9475044; skew-y: -50.9475067; scale-x: 0.997190278; scale-y: 0.99719032; cel: -1; alpha: 1; }
        frame 113 { x: 42.5942376; y: -22.3732619; skew-x: -50.8721653; skew-y: -50.8721679; scale-x: 0.99637067; scale-y: 0.996370717; cel: -1; alpha: 1; }
        frame 114 { x: 42.9629692; y: -22.7710471; skew-x: -50.6968262; skew-y: -50.6968292; scale-x: 0.996554341; scale-y: 0.99655439; cel: -1; alpha: 1; }
        frame 115 { x: 43.4504258; y: -22.9576991; skew-x: -50.7214871; skew-y: -50.7214905; scale-x: 0.996738079; scale-y: 0.996738131; cel: -1; alpha: 1; }
        frame 116 { x: 43.9067864; y: -23.1943391; skew-x: -50.8461479; skew-y: -50.8461518; scale-x: 0.996921886; scale-y: 0.996921939; cel: -1; alpha: 1; }
        frame 117 { x: 44.2112046; y: -23.5062285; skew-x: -50.7708063; skew-y: -50.7708105; scale-x: 0.997105761; scale-y: 0.997105815; cel: -1; alpha: 1; }
        frame 118 { x: 44.5143987; y: -25.742325; skew-x: -46.586442; skew-y: -46.5864472; scale-x: 0.996266251; scale-y: 0.996266302; cel: -1; alpha: 1; }
        frame 119 { x: 44.7757765; y: -27.1917497; skew-x: -42.3020778; skew-y: -42.3020837; scale-x: 0.996430931; scale-y: 0.996430977; cel: -1; alpha: 1; }
        frame 120 { x: 48.3032284; y: -15.5589206; skew-x: -38.1177137; skew-y: -38.1177203; scale-x: 0.995591035; scale-y: 0.995591072; cel: -1; alpha: 1; }
        frame 121 { x: 46.0270946; y: -15.0234025; skew-x: -34.0333533; skew-y: -34.0333604; scale-x: 0.996760461; scale-y: 0.996760485; cel: -1; alpha: 1; }
        frame 122 { x: 45.8978589; y: -15.0727628; skew-x: -33.8333533; skew-y: -33.8333604; scale-x: 0.995755662; scale-y: 0.995755686; cel: -1; alpha: 1; }
        frame 123 { x: 46.0270869; y: -15.0234128; skew-x: -34.0333238; skew-y: -34.0333308; scale-x: 0.996760461; scale-y: 0.996760486; cel: -1; alpha: 1; }
        frame 124 { x: 33.9841834; y: -27.5273; skew-x: -24.3693631; skew-y: -24.3693705; scale-x: 0.995473581; scale-y: 0.995473572; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_BODY2; }
        frame 125 { x: 23.0151386; y: -33.3570701; skew-x: -32.4759406; skew-y: -32.4759479; scale-x: 0.994798802; scale-y: 0.994798792; cel: 0; alpha: 1; }
        frame 126 { x: 13.5413204; y: -39.73927; skew-x: -40.782518; skew-y: -40.7825253; scale-x: 0.994123836; scale-y: 0.994123825; cel: 0; alpha: 1; }
        frame 127 { x: 2.69826799; y: -46.5636089; skew-x: -48.8890955; skew-y: -48.8891028; scale-x: 0.994455215; scale-y: 0.994455203; cel: 0; alpha: 1; }
        frame 128 { x: -8.03847318; y: -53.6094663; skew-x: -57.0956794; skew-y: -57.0956866; scale-x: 0.994787077; scale-y: 0.994787063; cel: 0; alpha: 1; }
        frame 129 { x: -63.6490442; y: -55.9562; skew-x: -59.5956646; skew-y: -59.5956722; scale-x: 0.993782763; scale-y: 0.993782776; cel: 0; alpha: 1; }
        frame 130 { x: -119.40402; y: -58.2944897; skew-x: -62.0956468; skew-y: -62.0956545; scale-x: 0.994792195; scale-y: 0.994792235; cel: 0; alpha: 1; }
        frame 131 { x: -119.40402; y: -58.2944897; skew-x: -62.0956468; skew-y: -62.0956545; scale-x: 0.994792195; scale-y: 0.994792235; cel: -1; alpha: 1; }
        frame 132 { x: -119.40402; y: -58.2944897; skew-x: -62.0956468; skew-y: -62.0956545; scale-x: 0.994792195; scale-y: 0.994792235; cel: -1; alpha: 1; }
        frame 133 { x: -119.40402; y: -58.2944897; skew-x: -62.0956468; skew-y: -62.0956545; scale-x: 0.994792195; scale-y: 0.994792235; cel: -1; alpha: 1; }
        frame 134 { x: -119.40402; y: -58.2944897; skew-x: -62.0956468; skew-y: -62.0956545; scale-x: 0.994792195; scale-y: 0.994792235; cel: -1; alpha: 1; }
        frame 135 { x: -119.40402; y: -58.2944897; skew-x: -62.0956468; skew-y: -62.0956545; scale-x: 0.994792195; scale-y: 0.994792235; cel: -1; alpha: 1; }
        frame 136 { x: -119.40402; y: -58.2944897; skew-x: -62.0956468; skew-y: -62.0956545; scale-x: 0.994792195; scale-y: 0.994792235; cel: -1; alpha: 1; }
        frame 137 { x: -119.40402; y: -58.2944897; skew-x: -62.0956468; skew-y: -62.0956545; scale-x: 0.994792195; scale-y: 0.994792235; cel: -1; alpha: 1; }
        frame 138 { x: 38.9337104; y: -16.4963287; skew-x: -55.3372105; skew-y: -54.0762417; scale-x: 0.990535622; scale-y: 0.976120057; cel: -1; alpha: 1; }
        frame 139 { x: 38.2166042; y: -19.5422575; skew-x: -53.8269656; skew-y: -52.9983812; scale-x: 0.991954948; scale-y: 0.980213019; cel: -1; alpha: 1; }
        frame 140 { x: 37.6551907; y: -22.9044615; skew-x: -52.2069173; skew-y: -51.7296788; scale-x: 0.993721533; scale-y: 0.986027831; cel: -1; alpha: 1; }
        frame 141 { x: 37.6144502; y: -26.5718951; skew-x: -50.6785353; skew-y: -50.4673044; scale-x: 0.99586433; scale-y: 0.993568665; cel: -1; alpha: 1; }
        frame 142 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 143 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 144 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 145 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 146 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 147 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 148 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 149 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 150 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 151 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 152 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 153 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 154 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 155 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 156 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 157 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 158 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 159 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 160 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 161 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 162 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 163 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 164 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 165 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 166 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 167 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 168 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 169 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 170 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 171 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 172 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 173 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 174 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 175 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 176 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 177 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 178 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 179 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 180 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 181 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 182 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 183 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 184 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 185 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 186 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 187 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 188 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 189 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 190 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 191 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 192 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 193 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 194 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 195 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
        frame 196 { x: 35.4501049; y: -30.8433375; skew-x: -50.9097113; skew-y: -50.9002537; scale-x: 0.996837622; scale-y: 0.997254724; cel: -1; alpha: 1; }
    }
    Track {
        source-name: "Zombie_imp_body1";
        frame-count: 197;
        frame 0 { x: 77.3; y: -45.6; skew-x: 14.8; skew-y: 14.4; scale-x: 0.973; scale-y: 0.998; image: IMAGE_REANIM_ZOMBIE_IMP_HD_BODY1; }
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
        frame 0 { x: 15.3977617; y: -30.309689; skew-x: 1.00948224; skew-y: -24.935534; scale-x: 1.10357208; scale-y: 0.847786661; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_WHITEROPE; }
        frame 1 { x: 16.0903625; y: -31.6498757; skew-x: 1.43579656; skew-y: -24.3357725; scale-x: 1.06131822; scale-y: 0.874305647; cel: 0; alpha: 1; }
        frame 2 { x: 16.9330873; y: -33.0209405; skew-x: 2.19974787; skew-y: -23.5976656; scale-x: 1.0196306; scale-y: 0.899628624; cel: 0; alpha: 1; }
        frame 3 { x: 17.7454475; y: -34.4872553; skew-x: 3.00733168; skew-y: -23.0072374; scale-x: 0.978526032; scale-y: 0.923753353; cel: 0; alpha: 1; }
        frame 4 { x: 16.0356099; y: -32.8606735; skew-x: 1.4474719; skew-y: -24.2114051; scale-x: 0.982583087; scale-y: 0.906472601; cel: 0; alpha: 1; }
        frame 5 { x: 14.6033037; y: -31.4212929; skew-x: 0.0887602531; skew-y: -25.2348247; scale-x: 0.987095845; scale-y: 0.889843909; cel: 0; alpha: 1; }
        frame 6 { x: 13.3434383; y: -30.0204034; skew-x: -0.967717995; skew-y: -26.0237784; scale-x: 0.992067167; scale-y: 0.872110531; cel: 0; alpha: 1; }
        frame 7 { x: 11.7107406; y: -28.4962931; skew-x: -2.52044341; skew-y: -27.3584653; scale-x: 0.997499381; scale-y: 0.854206963; cel: 0; alpha: 1; }
        frame 8 { x: 10.3509127; y: -26.9068574; skew-x: -3.76827681; skew-y: -28.4411413; scale-x: 1.00339374; scale-y: 0.836166166; cel: 0; alpha: 1; }
        frame 9 { x: 8.89039253; y: -25.4732998; skew-x: -5.11008162; skew-y: -29.6741403; scale-x: 1.00975093; scale-y: 0.818022131; cel: 0; alpha: 1; }
        frame 10 { x: 7.4338568; y: -23.7513013; skew-x: -6.64477128; skew-y: -31.1598435; scale-x: 1.01657083; scale-y: 0.799808443; cel: 0; alpha: 1; }
        frame 11 { x: 7.07254473; y: -23.654745; skew-x: -5.59074574; skew-y: -32.1887641; scale-x: 1.04217884; scale-y: 0.838960182; cel: 0; alpha: 1; }
        frame 12 { x: 6.63039697; y: -23.629623; skew-x: -4.59627185; skew-y: -33.4544148; scale-x: 1.07013572; scale-y: 0.875640526; cel: 0; alpha: 1; }
        frame 13 { x: 5.91085192; y: -23.4699132; skew-x: -3.67444766; skew-y: -34.9402575; scale-x: 1.100369; scale-y: 0.908075056; cel: 0; alpha: 1; }
        frame 14 { x: 7.20077805; y: -24.2763297; skew-x: -2.92304995; skew-y: -33.7496348; scale-x: 1.1004302; scale-y: 0.900020351; cel: 0; alpha: 1; }
        frame 15 { x: 8.38170451; y: -25.2353156; skew-x: -2.27723798; skew-y: -32.5721503; scale-x: 1.10055565; scale-y: 0.89138632; cel: 0; alpha: 1; }
        frame 16 { x: 9.55272429; y: -26.0971313; skew-x: -1.83554216; skew-y: -31.4015153; scale-x: 1.10070341; scale-y: 0.883095176; cel: 0; alpha: 1; }
        frame 17 { x: 10.7287561; y: -26.8965454; skew-x: -1.09683909; skew-y: -30.0961515; scale-x: 1.10110284; scale-y: 0.875955184; cel: 0; alpha: 1; }
        frame 18 { x: 11.9974219; y: -27.84979; skew-x: -0.463831022; skew-y: -28.7968615; scale-x: 1.10156697; scale-y: 0.868252153; cel: 0; alpha: 1; }
        frame 19 { x: 13.0596239; y: -28.6078784; skew-x: -0.035162524; skew-y: -27.4950284; scale-x: 1.10206167; scale-y: 0.860888642; cel: 0; alpha: 1; }
        frame 20 { x: 14.3211281; y: -29.4001139; skew-x: 0.690003139; skew-y: -26.0660077; scale-x: 1.1027838; scale-y: 0.854615211; cel: 0; alpha: 1; }
        frame 21 { x: 15.3977617; y: -30.309689; skew-x: 1.00948224; skew-y: -24.935534; scale-x: 1.10357208; scale-y: 0.847786661; cel: 0; alpha: 1; }
        frame 22 { x: 18.6873628; y: -33.5977712; skew-x: 2.19177303; skew-y: -22.3257478; scale-x: 1.10711532; scale-y: 0.868361963; cel: 0; alpha: 1; }
        frame 23 { x: 19.9172882; y: -33.8963887; skew-x: 2.64445431; skew-y: -22.8551235; scale-x: 1.13170041; scale-y: 0.819497575; cel: 0; alpha: 1; }
        frame 24 { x: 21.1278686; y: -34.1263357; skew-x: 3.15836993; skew-y: -23.3862213; scale-x: 1.15637736; scale-y: 0.769552676; cel: 0; alpha: 1; }
        frame 25 { x: 22.4280357; y: -34.2416574; skew-x: 3.63590491; skew-y: -24.0353728; scale-x: 1.18113776; scale-y: 0.718513022; cel: 0; alpha: 1; }
        frame 26 { x: 23.8735562; y: -34.599423; skew-x: 4.17927314; skew-y: -24.7240125; scale-x: 1.20476839; scale-y: 0.665702662; cel: 0; alpha: 1; }
        frame 27 { x: 25.2656801; y: -34.8267086; skew-x: 4.69049269; skew-y: -25.58086; scale-x: 1.23088112; scale-y: 0.613114772; cel: 0; alpha: 1; }
        frame 28 { x: 26.4955072; y: -35.9872041; skew-x: 5.17366701; skew-y: -18.959299; scale-x: 1.23179231; scale-y: 0.662873745; cel: 0; alpha: 1; }
        frame 29 { x: 28.0345132; y: -36.9859044; skew-x: 5.75310825; skew-y: -12.6354765; scale-x: 1.2340186; scale-y: 0.714367887; cel: 0; alpha: 1; }
        frame 30 { x: 29.4703979; y: -38.0837748; skew-x: 6.32873274; skew-y: -6.80969912; scale-x: 1.23632807; scale-y: 0.766954746; cel: 0; alpha: 1; }
        frame 31 { x: 31.0032023; y: -39.1808634; skew-x: 6.90053189; skew-y: -1.52753742; scale-x: 1.23872001; scale-y: 0.820605386; cel: 0; alpha: 1; }
        frame 32 { x: 32.3497658; y: -40.3125265; skew-x: 7.56843459; skew-y: 3.30946868; scale-x: 1.24243575; scale-y: 0.876171761; cel: 0; alpha: 1; }
        frame 33 { x: 25.2932346; y: -36.1337848; skew-x: 4.21364094; skew-y: 2.17602339; scale-x: 1.22709592; scale-y: 0.87223459; cel: 0; alpha: 1; }
        frame 34 { x: 18.1164868; y: -31.8915258; skew-x: 0.426569149; skew-y: 0.742698514; scale-x: 1.21574732; scale-y: 0.867449244; cel: 0; alpha: 1; }
        frame 35 { x: 10.5632418; y: -27.1995176; skew-x: -2.03726696; skew-y: -10.026943; scale-x: 1.12961301; scale-y: 0.826230426; cel: 0; alpha: 1; }
        frame 36 { x: 2.58600943; y: -22.2140886; skew-x: -5.65580185; skew-y: -22.2964514; scale-x: 1.047155; scale-y: 0.802429527; cel: 0; alpha: 1; }
        frame 37 { x: 2.50188118; y: -21.7090547; skew-x: -5.8062126; skew-y: -28.9300308; scale-x: 1.01816076; scale-y: 0.767992766; cel: 0; alpha: 1; }
        frame 38 { x: 2.12977497; y: -21.069441; skew-x: -6.27498914; skew-y: -35.9923301; scale-x: 0.990954731; scale-y: 0.734000293; cel: 0; alpha: 1; }
        frame 39 { x: 3.34716878; y: -22.6692331; skew-x: -5.0616119; skew-y: -31.068405; scale-x: 1.02461923; scale-y: 0.769485601; cel: 0; alpha: 1; }
        frame 40 { x: 4.57056278; y: -24.1775655; skew-x: -4.12884248; skew-y: -26.4720161; scale-x: 1.0588928; scale-y: 0.806964806; cel: 0; alpha: 1; }
        frame 41 { x: 5.82026793; y: -25.8291316; skew-x: -3.17103337; skew-y: -21.9614847; scale-x: 1.09482907; scale-y: 0.846274318; cel: 0; alpha: 1; }
        frame 42 { x: 7.63427685; y: -26.6028289; skew-x: -2.54192613; skew-y: -20.0028343; scale-x: 1.10614641; scale-y: 0.853299059; cel: 0; alpha: 1; }
        frame 43 { x: 9.28428217; y: -27.3874096; skew-x: -2.12771842; skew-y: -18.2561261; scale-x: 1.11861381; scale-y: 0.861613756; cel: 0; alpha: 1; }
        frame 44 { x: 10.930164; y: -28.1723772; skew-x: -1.72797437; skew-y: -16.5249001; scale-x: 1.13113164; scale-y: 0.870351871; cel: 0; alpha: 1; }
        frame 45 { x: 12.7607507; y: -28.9444334; skew-x: -1.14223513; skew-y: -14.612516; scale-x: 1.14369635; scale-y: 0.879493987; cel: 0; alpha: 1; }
        frame 46 { x: 14.2036382; y: -29.6868761; skew-x: -0.870084692; skew-y: -13.0221028; scale-x: 1.15630466; scale-y: 0.889023422; cel: 0; alpha: 1; }
        frame 47 { x: 15.4845508; y: -30.6742955; skew-x: -0.339788679; skew-y: -11.6320358; scale-x: 1.16895368; scale-y: 0.893232001; cel: 0; alpha: 1; }
        frame 48 { x: 16.9450327; y: -31.7488905; skew-x: 0.364974575; skew-y: -10.0538583; scale-x: 1.18170683; scale-y: 0.897978774; cel: 0; alpha: 1; }
        frame 49 { x: 18.3806425; y: -32.7111979; skew-x: 1.24489122; skew-y: -8.28986672; scale-x: 1.19455324; scale-y: 0.903240696; cel: 0; alpha: 1; }
        frame 50 { x: 19.831125; y: -33.7440949; skew-x: 1.80064699; skew-y: -6.84228827; scale-x: 1.20748264; scale-y: 0.908994702; cel: 0; alpha: 1; }
        frame 51 { x: 21.2551918; y: -34.5652232; skew-x: 2.53292245; skew-y: -5.21319668; scale-x: 1.22048525; scale-y: 0.91521819; cel: 0; alpha: 1; }
        frame 52 { x: 23.6564938; y: -35.6490125; skew-x: 3.53868874; skew-y: -3.19945675; scale-x: 1.22374098; scale-y: 0.91789602; cel: 0; alpha: 1; }
        frame 53 { x: 26.1231304; y: -36.7261072; skew-x: 4.72432923; skew-y: -0.956488096; scale-x: 1.22743549; scale-y: 0.921728806; cel: 0; alpha: 1; }
        frame 54 { x: 28.7875982; y: -37.7652251; skew-x: 5.78943536; skew-y: 1.20897318; scale-x: 1.23155014; scale-y: 0.926670203; cel: 0; alpha: 1; }
        frame 55 { x: 31.0212548; y: -38.6741752; skew-x: 6.73362492; skew-y: 3.29006146; scale-x: 1.23482728; scale-y: 0.931734822; cel: 0; alpha: 1; }
        frame 56 { x: 33.5780993; y: -39.7600872; skew-x: 7.85663717; skew-y: 5.5799421; scale-x: 1.24096399; scale-y: 0.939676266; cel: 0; alpha: 1; }
        frame 57 { x: 26.3440222; y: -35.6258327; skew-x: 4.87345927; skew-y: 4.86729564; scale-x: 1.22191438; scale-y: 0.90434702; cel: 0; alpha: 1; }
        frame 58 { x: 19.1299488; y: -31.340574; skew-x: 1.61398465; skew-y: 4.1076761; scale-x: 1.20451919; scale-y: 0.868183134; cel: 0; alpha: 1; }
        frame 59 { x: 10.9617712; y: -26.871937; skew-x: -1.40642909; skew-y: -8.30975525; scale-x: 1.12312911; scale-y: 0.823555412; cel: 0; alpha: 1; }
        frame 60 { x: 2.58601104; y: -22.2140861; skew-x: -5.65580083; skew-y: -22.2964585; scale-x: 1.04715498; scale-y: 0.802429221; cel: 0; alpha: 1; }
        frame 61 { x: 2.50215108; y: -21.4820646; skew-x: -6.09464559; skew-y: -29.5736909; scale-x: 1.01868764; scale-y: 0.750698348; cel: 0; alpha: 1; }
        frame 62 { x: 2.13177036; y: -20.6153485; skew-x: -6.8671855; skew-y: -37.5579708; scale-x: 0.992087368; scale-y: 0.700453834; cel: 0; alpha: 1; }
        frame 63 { x: 5.82671456; y: -23.4309822; skew-x: -4.34413236; skew-y: -33.9910905; scale-x: 1.0029691; scale-y: 0.717482436; cel: 0; alpha: 1; }
        frame 64 { x: 9.48331719; y: -26.1040136; skew-x: -2.03037301; skew-y: -30.6114428; scale-x: 1.01504889; scale-y: 0.736806621; cel: 0; alpha: 1; }
        frame 65 { x: 13.0238632; y: -28.84515; skew-x: -0.126789858; skew-y: -27.6352966; scale-x: 1.02818589; scale-y: 0.758276004; cel: 0; alpha: 1; }
        frame 66 { x: 13.7693626; y: -29.6678803; skew-x: 0.319882934; skew-y: -27.726617; scale-x: 1.05018404; scale-y: 0.78186157; cel: 0; alpha: 1; }
        frame 67 { x: 14.582279; y: -30.6931915; skew-x: 0.754352773; skew-y: -27.785639; scale-x: 1.07123323; scale-y: 0.805382732; cel: 0; alpha: 1; }
        frame 68 { x: 15.4859767; y: -31.7723114; skew-x: 1.27710141; skew-y: -27.760649; scale-x: 1.09235655; scale-y: 0.828017272; cel: 0; alpha: 1; }
        frame 69 { x: 16.3275414; y: -32.7024801; skew-x: 1.68871039; skew-y: -27.8286507; scale-x: 1.11466184; scale-y: 0.851394137; cel: 0; alpha: 1; }
        frame 70 { x: 17.4217886; y: -33.7322648; skew-x: 2.29020963; skew-y: -27.6654819; scale-x: 1.13593409; scale-y: 0.874713392; cel: 0; alpha: 1; }
        frame 71 { x: 18.2133387; y: -33.7318857; skew-x: 2.28761015; skew-y: -23.382814; scale-x: 1.13723988; scale-y: 0.877976229; cel: 0; alpha: 1; }
        frame 72 { x: 23.7148271; y: -34.0484861; skew-x: 5.09314418; skew-y: -18.0228263; scale-x: 1.14190652; scale-y: 0.862784603; cel: 0; alpha: 1; }
        frame 73 { x: 29.650136; y: -34.4129738; skew-x: 7.87442272; skew-y: -12.3043604; scale-x: 1.15012874; scale-y: 0.855837214; cel: 0; alpha: 1; }
        frame 74 { x: 35.2816678; y: -34.732969; skew-x: 10.6236774; skew-y: -6.320776; scale-x: 1.16053475; scale-y: 0.855783717; cel: 0; alpha: 1; }
        frame 75 { x: 40.9546585; y: -34.7754724; skew-x: 13.0356941; skew-y: -0.486070733; scale-x: 1.17289448; scale-y: 0.862095915; cel: 0; alpha: 1; }
        frame 76 { x: 46.6733272; y: -34.8389253; skew-x: 15.5074958; skew-y: 5.47720315; scale-x: 1.18579834; scale-y: 0.873335996; cel: 0; alpha: 1; }
        frame 77 { x: 52.5307002; y: -34.8153495; skew-x: 17.8380902; skew-y: 11.2525503; scale-x: 1.20139751; scale-y: 0.89065973; cel: 0; alpha: 1; }
        frame 78 { x: 58.3963785; y: -34.6194242; skew-x: 20.0281449; skew-y: 16.7423106; scale-x: 1.21832336; scale-y: 0.912635394; cel: 0; alpha: 1; }
        frame 79 { x: 64.2282653; y: -34.5937663; skew-x: 21.9796798; skew-y: 21.7756352; scale-x: 1.23763636; scale-y: 0.939654356; cel: 0; alpha: 1; }
        frame 80 { x: 66.9136305; y: -33.5499543; skew-x: 23.6675309; skew-y: 26.2794472; scale-x: 1.2525588; scale-y: 0.924942522; cel: 0; alpha: 1; }
        frame 81 { x: 69.9775736; y: -32.7658884; skew-x: 25.5803746; skew-y: 31.1324335; scale-x: 1.26875066; scale-y: 0.913562503; cel: 0; alpha: 1; }
        frame 82 { x: 72.8927782; y: -31.8886795; skew-x: 27.2184161; skew-y: 35.77745; scale-x: 1.28740975; scale-y: 0.906229229; cel: 0; alpha: 1; }
        frame 83 { x: 75.6731226; y: -31.0300702; skew-x: 28.7824363; skew-y: 40.3573295; scale-x: 1.30719524; scale-y: 0.901822941; cel: 0; alpha: 1; }
        frame 84 { x: 78.5190785; y: -29.9913249; skew-x: 30.2737057; skew-y: 44.818983; scale-x: 1.3280254; scale-y: 0.900150743; cel: 0; alpha: 1; }
        frame 85 { x: 81.4870963; y: -29.0510574; skew-x: 31.8938677; skew-y: 49.3169437; scale-x: 1.35117657; scale-y: 0.901923067; cel: 0; alpha: 1; }
        frame 86 { x: 74.4071802; y: -33.64029; skew-x: 29.7507697; skew-y: 39.1455324; scale-x: 1.29240674; scale-y: 0.97210285; cel: 0; alpha: 1; }
        frame 87 { x: 67.2099282; y: -38.1354647; skew-x: 27.2668471; skew-y: 29.2307028; scale-x: 1.24351274; scale-y: 1.05235468; cel: 0; alpha: 1; }
        frame 88 { x: 58.531307; y: -40.0128146; skew-x: 23.132498; skew-y: 19.085838; scale-x: 1.18673539; scale-y: 0.880085246; cel: 0; alpha: 1; }
        frame 89 { x: 50.0804643; y: -41.6544629; skew-x: 18.6543605; skew-y: 5.66716174; scale-x: 1.13589588; scale-y: 0.726002701; cel: 0; alpha: 1; }
        frame 90 { x: 20.2733036; y: -32.9919865; skew-x: 4.40251671; skew-y: -31.1005068; scale-x: 0.867661755; scale-y: 0.815953977; cel: 0; alpha: 1; }
        frame 91 { x: -4.53205391; y: -21.1823881; skew-x: -3.26908292; skew-y: -40.8263702; scale-x: 0.73883344; scale-y: 0.661683768; cel: 0; alpha: 1; }
        frame 92 { x: -30.2305702; y: -12.7816028; skew-x: -7.79138488; skew-y: -39.7333524; scale-x: 0.820262203; scale-y: 0.914661865; cel: 0; alpha: 1; }
        frame 93 { x: -29.6429509; y: -12.1098546; skew-x: -8.55164876; skew-y: -38.2981846; scale-x: 0.81187858; scale-y: 0.907492934; cel: 0; alpha: 1; }
        frame 94 { x: -29.2714617; y: -11.328224; skew-x: -9.53670731; skew-y: -37.0195336; scale-x: 0.804016575; scale-y: 0.899461131; cel: 0; alpha: 1; }
        frame 95 { x: -29.0231661; y: -11.5389085; skew-x: -9.59954574; skew-y: -37.9340256; scale-x: 0.802942456; scale-y: 0.862747563; cel: 0; alpha: 1; }
        frame 96 { x: -29.2763281; y: -11.6506182; skew-x: -9.67607881; skew-y: -39.5618375; scale-x: 0.803488665; scale-y: 0.825082775; cel: 0; alpha: 1; }
        frame 97 { x: -22.1309489; y: -15.1546449; skew-x: -7.03297761; skew-y: -35.7693687; scale-x: 0.842457044; scale-y: 0.824836359; cel: 0; alpha: 1; }
        frame 98 { x: -15.1894663; y: -18.5847606; skew-x: -4.77695943; skew-y: -32.0236076; scale-x: 0.883434181; scale-y: 0.831283686; cel: 0; alpha: 1; }
        frame 99 { x: -8.17923522; y: -21.8432777; skew-x: -2.8749664; skew-y: -28.3586619; scale-x: 0.925342715; scale-y: 0.842889768; cel: 0; alpha: 1; }
        frame 100 { x: -1.4515715; y: -24.9600251; skew-x: -1.17920833; skew-y: -25.7550812; scale-x: 0.971922472; scale-y: 0.853578225; cel: 0; alpha: 1; }
        frame 101 { x: 5.14261909; y: -27.8998508; skew-x: 0.284768947; skew-y: -24.8015387; scale-x: 1.02722934; scale-y: 0.86059619; cel: 0; alpha: 1; }
        frame 102 { x: 11.5925711; y: -30.9357777; skew-x: 1.16493692; skew-y: -24.2778519; scale-x: 1.08166623; scale-y: 0.868192853; cel: 0; alpha: 1; }
        frame 103 { x: 18.2133387; y: -33.7318857; skew-x: 2.28761015; skew-y: -23.382814; scale-x: 1.13723988; scale-y: 0.877976229; cel: 0; alpha: 1; }
        frame 104 { x: 18.2133402; y: -33.7318945; skew-x: 2.28761585; skew-y: -23.3828051; scale-x: 1.13723982; scale-y: 0.877976335; cel: 0; alpha: 1; }
        frame 105 { x: 18.4254834; y: -32.6853371; skew-x: 1.61288351; skew-y: -22.0849405; scale-x: 1.11222633; scale-y: 0.85943741; cel: 0; alpha: 1; }
        frame 106 { x: 18.6954921; y: -31.490454; skew-x: 1.00572429; skew-y: -20.5578979; scale-x: 1.08614558; scale-y: 0.839399679; cel: 0; alpha: 1; }
        frame 107 { x: 19.0802546; y: -30.4783092; skew-x: 0.563831197; skew-y: -18.6869653; scale-x: 1.06120815; scale-y: 0.81950461; cel: 0; alpha: 1; }
        frame 108 { x: 19.377742; y: -29.2777657; skew-x: -0.115251297; skew-y: -16.8558631; scale-x: 1.03631428; scale-y: 0.798831988; cel: 0; alpha: 1; }
        frame 109 { x: 19.6456162; y: -28.140719; skew-x: -0.934216457; skew-y: -14.9469365; scale-x: 1.01046502; scale-y: 0.776533917; cel: 0; alpha: 1; }
        frame 110 { x: 19.8377749; y: -26.9426643; skew-x: -1.69601131; skew-y: -12.7413545; scale-x: 0.985725416; scale-y: 0.754110012; cel: 0; alpha: 1; }
        frame 111 { x: 20.3867843; y: -25.9872923; skew-x: -2.40382193; skew-y: -10.2193913; scale-x: 0.960111807; scale-y: 0.729943859; cel: 0; alpha: 1; }
        frame 112 { x: 20.4968573; y: -24.828193; skew-x: -3.37288666; skew-y: -7.70497189; scale-x: 0.936470472; scale-y: 0.704596297; cel: 0; alpha: 1; }
        frame 113 { x: 17.7602266; y: -23.4784524; skew-x: -4.91065219; skew-y: -11.5954843; scale-x: 0.918257139; scale-y: 0.717914562; cel: 0; alpha: 1; }
        frame 114 { x: 14.9754389; y: -22.0417264; skew-x: -6.47198925; skew-y: -15.3384606; scale-x: 0.900807047; scale-y: 0.733266964; cel: 0; alpha: 1; }
        frame 115 { x: 12.0492028; y: -20.6586482; skew-x: -8.4621725; skew-y: -19.3057284; scale-x: 0.884217983; scale-y: 0.750864733; cel: 0; alpha: 1; }
        frame 116 { x: 9.24387921; y: -19.0639351; skew-x: -10.2858255; skew-y: -22.873996; scale-x: 0.867728302; scale-y: 0.770148774; cel: 0; alpha: 1; }
        frame 117 { x: 6.46095899; y: -17.3572826; skew-x: -12.4466631; skew-y: -26.5250882; scale-x: 0.854073131; scale-y: 0.793653756; cel: 0; alpha: 1; }
        frame 118 { x: 4.24913695; y: -16.0248421; skew-x: -12.2230944; skew-y: -33.0836861; scale-x: 0.804705888; scale-y: 0.798066204; cel: 0; alpha: 1; }
        frame 119 { x: 1.95309389; y: -14.6045191; skew-x: -12.1977408; skew-y: -39.1373963; scale-x: 0.758317744; scale-y: 0.801005903; cel: 0; alpha: 1; }
        frame 120 { x: -0.33176368; y: -13.000189; skew-x: -12.7762227; skew-y: -43.9266217; scale-x: 0.737817573; scale-y: 0.809700404; cel: 0; alpha: 1; }
        frame 121 { x: -2.82512254; y: -11.3966167; skew-x: -13.7623091; skew-y: -48.1912334; scale-x: 0.725891988; scale-y: 0.822839893; cel: 0; alpha: 1; }
        frame 122 { x: -2.75458581; y: -11.3921066; skew-x: -13.7623091; skew-y: -48.1912334; scale-x: 0.725163912; scale-y: 0.822014577; cel: 0; alpha: 1; }
        frame 123 { x: -2.70395534; y: -11.7303583; skew-x: -14.0308629; skew-y: -46.9403102; scale-x: 0.72564029; scale-y: 0.870941947; cel: 0; alpha: 1; }
        frame 124 { x: 6.34252654; y: -11.8315128; skew-x: -4.1303749; skew-y: -33.3840395; scale-x: 0.122589762; scale-y: 0.400378875; cel: 0; alpha: 1; }
        frame 125 { x: 8.4; y: -20.4; skew-x: -17.1; skew-y: -22.8; scale-x: 0.337; scale-y: 0.878; cel: -1; alpha: 1; }
        frame 126 { x: 11.1; y: -22.2; skew-x: -12.8; skew-y: -18.6; scale-x: 0.246; scale-y: 0.763; cel: -1; alpha: 1; }
        frame 127 { x: 13.9; y: -23.5; skew-x: -8.6; skew-y: -14.5; scale-x: 0.156; scale-y: 0.647; cel: -1; alpha: 1; }
        frame 128 { x: 16.5; y: -24.6; skew-x: -4.5; skew-y: -10.3; scale-x: 0.065; scale-y: 0.532; cel: -1; alpha: 1; }
        frame 129 { x: 16.5; y: -24.6; skew-x: -4.5; skew-y: -10.3; scale-x: 0.065; scale-y: 0.532; cel: -1; alpha: 1; }
        frame 130 { x: 16.5; y: -24.6; skew-x: -4.5; skew-y: -10.3; scale-x: 0.065; scale-y: 0.532; cel: -1; alpha: 1; }
        frame 131 { x: 16.5; y: -24.6; skew-x: -4.5; skew-y: -10.3; scale-x: 0.065; scale-y: 0.532; cel: -1; alpha: 1; }
        frame 132 { x: 16.5; y: -24.6; skew-x: -4.5; skew-y: -10.3; scale-x: 0.065; scale-y: 0.532; cel: -1; alpha: 1; }
        frame 133 { x: 16.5; y: -24.6; skew-x: -4.5; skew-y: -10.3; scale-x: 0.065; scale-y: 0.532; cel: -1; alpha: 1; }
        frame 134 { x: 16.5; y: -24.6; skew-x: -4.5; skew-y: -10.3; scale-x: 0.065; scale-y: 0.532; cel: -1; alpha: 1; }
        frame 135 { x: 16.5; y: -24.6; skew-x: -4.5; skew-y: -10.3; scale-x: 0.065; scale-y: 0.532; cel: -1; alpha: 1; }
        frame 136 { x: 16.5; y: -24.6; skew-x: -4.5; skew-y: -10.3; scale-x: 0.065; scale-y: 0.532; cel: -1; alpha: 1; }
        frame 137 { x: 16.5; y: -24.6; skew-x: -4.5; skew-y: -10.3; scale-x: 0.065; scale-y: 0.532; cel: -1; alpha: 1; }
        frame 138 { x: 18.2133387; y: -33.7318857; skew-x: 2.28761015; skew-y: -23.382814; scale-x: 1.13723988; scale-y: 0.877976229; cel: 0; alpha: 1; }
        frame 139 { x: 22.7945617; y: -31.8313222; skew-x: 3.13749678; skew-y: -17.247683; scale-x: 0.820941332; scale-y: 0.705140759; cel: 0; alpha: 1; }
        frame 140 { x: 27.5752069; y: -30.0672238; skew-x: 5.51356407; skew-y: -5.81994579; scale-x: 0.504342283; scale-y: 0.536309422; cel: 0; alpha: 1; }
        frame 141 { x: 32.4716171; y: -28.3867402; skew-x: 15.948299; skew-y: 16.688946; scale-x: 0.192129957; scale-y: 0.38774533; cel: 0; alpha: 1; }
        frame 142 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 143 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 144 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 145 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 146 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 147 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 148 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 149 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 150 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 151 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 152 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 153 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 154 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 155 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 156 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 157 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 158 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 159 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 160 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 161 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 162 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 163 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 164 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 165 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 166 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 167 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 168 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 169 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 170 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 171 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 172 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 173 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 174 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 175 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 176 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 177 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 178 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 179 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 180 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 181 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 182 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 183 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 184 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 185 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 186 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 187 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 188 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 189 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 190 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 191 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 192 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 193 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 194 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 195 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
        frame 196 { x: 32; y: -25.5; skew-x: -2.8; skew-y: -2.8; scale-x: 0.339; scale-y: 0.551; cel: -1; alpha: 1; }
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
        frame 0 { x: 37.643028; y: -13.7390957; skew-x: 0.0154661532; skew-y: -0.200723632; scale-x: 1.01356385; scale-y: 1.00067003; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_ROPE; }
        frame 1 { x: 36.9951889; y: -14.2674148; skew-x: -0.580022457; skew-y: -0.902906518; scale-x: 1.0069767; scale-y: 1.00048075; cel: 0; alpha: 1; }
        frame 2 { x: 36.4280525; y: -14.7299424; skew-x: -0.878084075; skew-y: -1.30435677; scale-x: 1.00035933; scale-y: 1.00032366; cel: 0; alpha: 1; }
        frame 3 { x: 35.8481805; y: -15.3059999; skew-x: -1.17882529; skew-y: -1.70505532; scale-x: 0.993711718; scale-y: 1.00019893; cel: 0; alpha: 1; }
        frame 4 { x: 34.4947265; y: -14.4241661; skew-x: -2.16643041; skew-y: -2.61631922; scale-x: 0.994911125; scale-y: 1.00162597; cel: 0; alpha: 1; }
        frame 5 { x: 33.3511248; y: -13.6534266; skew-x: -2.95662573; skew-y: -3.31947247; scale-x: 0.996206218; scale-y: 1.00405691; cel: 0; alpha: 1; }
        frame 6 { x: 32.289806; y: -12.8444316; skew-x: -3.44281311; skew-y: -3.72177744; scale-x: 0.997590265; scale-y: 1.00549997; cel: 0; alpha: 1; }
        frame 7 { x: 31.0054762; y: -12.082038; skew-x: -4.42808421; skew-y: -4.61956075; scale-x: 0.999066438; scale-y: 1.00694696; cel: 0; alpha: 1; }
        frame 8 { x: 29.9057443; y: -11.1585222; skew-x: -5.11231018; skew-y: -5.21281061; scale-x: 1.00063431; scale-y: 1.00839566; cel: 0; alpha: 1; }
        frame 9 { x: 28.7329544; y: -10.4290653; skew-x: -5.89535438; skew-y: -5.9015263; scale-x: 1.00229369; scale-y: 1.00984448; cel: 0; alpha: 1; }
        frame 10 { x: 27.6129558; y: -9.48598179; skew-x: -6.8770753; skew-y: -6.78571316; scale-x: 1.00404407; scale-y: 1.01129122; cel: 0; alpha: 1; }
        frame 11 { x: 28.0050162; y: -8.77621666; skew-x: -6.83239421; skew-y: -6.58753922; scale-x: 1.01288135; scale-y: 1.00291765; cel: 0; alpha: 1; }
        frame 12 { x: 28.3932868; y: -8.14494609; skew-x: -6.79149707; skew-y: -6.38406677; scale-x: 1.02171022; scale-y: 0.995543408; cel: 0; alpha: 1; }
        frame 13 { x: 28.576413; y: -7.41286988; skew-x: -6.75116774; skew-y: -6.17833587; scale-x: 1.03052758; scale-y: 0.988161173; cel: 0; alpha: 1; }
        frame 14 { x: 29.7952842; y: -8.09603313; skew-x: -5.7549006; skew-y: -5.39300555; scale-x: 1.02806379; scale-y: 0.990401738; cel: 0; alpha: 1; }
        frame 15 { x: 30.9040392; y: -8.98449193; skew-x: -4.85721709; skew-y: -4.60970494; scale-x: 1.02573421; scale-y: 0.991572232; cel: 0; alpha: 1; }
        frame 16 { x: 32.002136; y: -9.84906582; skew-x: -4.15983054; skew-y: -3.82599602; scale-x: 1.02355119; scale-y: 0.992632703; cel: 0; alpha: 1; }
        frame 17 { x: 33.1157187; y: -10.5174121; skew-x: -3.16391592; skew-y: -3.04038659; scale-x: 1.02135892; scale-y: 0.99487024; cel: 0; alpha: 1; }
        frame 18 { x: 34.3224273; y: -11.3922705; skew-x: -2.26768604; skew-y: -2.25602844; scale-x: 1.01928225; scale-y: 0.996063694; cel: 0; alpha: 1; }
        frame 19 { x: 35.3243772; y: -12.1462196; skew-x: -1.57227174; skew-y: -1.47132806; scale-x: 1.01731426; scale-y: 0.997213854; cel: 0; alpha: 1; }
        frame 20 { x: 36.5315511; y: -12.79954; skew-x: -0.578037468; skew-y: -0.685781534; scale-x: 1.01539095; scale-y: 0.999450397; cel: 0; alpha: 1; }
        frame 21 { x: 37.643028; y: -13.7390957; skew-x: 0.0154661532; skew-y: -0.200723632; scale-x: 1.01356385; scale-y: 1.00067003; cel: 0; alpha: 1; }
        frame 22 { x: 40.3817079; y: -16.2964753; skew-x: 1.81869031; skew-y: 1.57902973; scale-x: 1.01394094; scale-y: 1.00137844; cel: 0; alpha: 1; }
        frame 23 { x: 41.4171241; y: -16.8084832; skew-x: 2.8707097; skew-y: 2.47025219; scale-x: 1.02712134; scale-y: 0.998445257; cel: 0; alpha: 1; }
        frame 24 { x: 42.4038518; y: -17.2459143; skew-x: 4.01134003; skew-y: 3.45427782; scale-x: 1.04039416; scale-y: 0.995585534; cel: 0; alpha: 1; }
        frame 25 { x: 43.4805606; y: -17.6009913; skew-x: 5.14068825; skew-y: 4.43061704; scale-x: 1.05375626; scale-y: 0.992803588; cel: 0; alpha: 1; }
        frame 26 { x: 44.6531833; y: -18.2111733; skew-x: 6.35889497; skew-y: 5.4987651; scale-x: 1.06613737; scale-y: 0.989114805; cel: 0; alpha: 1; }
        frame 27 { x: 45.8145665; y: -18.6917245; skew-x: 7.56607277; skew-y: 6.55822975; scale-x: 1.08073599; scale-y: 0.987493564; cel: 0; alpha: 1; }
        frame 28 { x: 46.1223831; y: -19.2450197; skew-x: 8.0501435; skew-y: 6.76756739; scale-x: 1.08635152; scale-y: 0.9877652; cel: 0; alpha: 1; }
        frame 29 { x: 46.7319571; y: -19.5915676; skew-x: 8.63040767; skew-y: 7.07444697; scale-x: 1.09309533; scale-y: 0.989003719; cel: 0; alpha: 1; }
        frame 30 { x: 47.2385342; y: -20.0443706; skew-x: 9.20686409; skew-y: 7.37887021; scale-x: 1.0998857; scale-y: 0.990221619; cel: 0; alpha: 1; }
        frame 31 { x: 47.8421773; y: -20.5034873; skew-x: 9.77957193; skew-y: 7.68083611; scale-x: 1.10672191; scale-y: 0.991419747; cel: 0; alpha: 1; }
        frame 32 { x: 48.2418824; y: -20.9571847; skew-x: 10.4485225; skew-y: 8.08034261; scale-x: 1.11471771; scale-y: 0.993591955; cel: 0; alpha: 1; }
        frame 33 { x: 41.1836191; y: -16.9819935; skew-x: 5.7069905; skew-y: 3.90302217; scale-x: 1.10853684; scale-y: 0.974623441; cel: 0; alpha: 1; }
        frame 34 { x: 34.2829408; y: -12.9944574; skew-x: 0.716595534; skew-y: -0.526106249; scale-x: 1.10570499; scale-y: 0.95687639; cel: 0; alpha: 1; }
        frame 35 { x: 26.4180615; y: -10.2528171; skew-x: -4.20882001; skew-y: -5.50735337; scale-x: 1.12083865; scale-y: 0.985315909; cel: 0; alpha: 1; }
        frame 36 { x: 18.2639846; y: -6.99683058; skew-x: -9.73465587; skew-y: -11.1321528; scale-x: 1.13820168; scale-y: 1.01187319; cel: 0; alpha: 1; }
        frame 37 { x: 17.7321768; y: -6.15736165; skew-x: -11.0406123; skew-y: -12.1854786; scale-x: 1.13146475; scale-y: 1.0144345; cel: 0; alpha: 1; }
        frame 38 { x: 17.0575533; y: -5.26469279; skew-x: -12.6578807; skew-y: -13.5327499; scale-x: 1.12617178; scale-y: 1.01710989; cel: 0; alpha: 1; }
        frame 39 { x: 19.0137376; y: -7.01204003; skew-x: -10.0469737; skew-y: -11.1278004; scale-x: 1.12791465; scale-y: 1.01660899; cel: 0; alpha: 1; }
        frame 40 { x: 21.0946409; y: -8.69206828; skew-x: -7.65887726; skew-y: -8.91648117; scale-x: 1.13036074; scale-y: 1.01641028; cel: 0; alpha: 1; }
        frame 41 { x: 23.2529057; y: -10.4548883; skew-x: -5.19477035; skew-y: -6.60373481; scale-x: 1.13460922; scale-y: 1.01652815; cel: 0; alpha: 1; }
        frame 42 { x: 25.1086123; y: -11.0478489; skew-x: -4.17419272; skew-y: -5.50099221; scale-x: 1.13318339; scale-y: 1.01446767; cel: 0; alpha: 1; }
        frame 43 { x: 26.876706; y: -11.6927254; skew-x: -3.35600771; skew-y: -4.59789289; scale-x: 1.13295964; scale-y: 1.01348721; cel: 0; alpha: 1; }
        frame 44 { x: 28.6457722; y: -12.3336613; skew-x: -2.54034101; skew-y: -3.69458329; scale-x: 1.1328013; scale-y: 1.01256982; cel: 0; alpha: 1; }
        frame 45 { x: 30.5485886; y: -12.8951267; skew-x: -1.52730948; skew-y: -2.59121535; scale-x: 1.13270734; scale-y: 1.01171582; cel: 0; alpha: 1; }
        frame 46 { x: 32.1521813; y: -13.5155882; skew-x: -0.817026375; skew-y: -1.78792649; scale-x: 1.13267671; scale-y: 1.01092589; cel: 0; alpha: 1; }
        frame 47 { x: 33.5068566; y: -14.3061243; skew-x: 0.305240095; skew-y: -0.674105543; scale-x: 1.12722749; scale-y: 1.01154033; cel: 0; alpha: 1; }
        frame 48 { x: 34.9884619; y: -15.1084161; skew-x: 1.63193748; skew-y: 0.628354655; scale-x: 1.12197574; scale-y: 1.01218613; cel: 0; alpha: 1; }
        frame 49 { x: 36.3890361; y: -15.722923; skew-x: 3.16256387; skew-y: 2.11912799; scale-x: 1.11692612; scale-y: 1.01286056; cel: 0; alpha: 1; }
        frame 50 { x: 37.8951819; y: -16.4900614; skew-x: 4.39664473; skew-y: 3.29791553; scale-x: 1.11208282; scale-y: 1.01356187; cel: 0; alpha: 1; }
        frame 51 { x: 39.3163738; y: -16.9703089; skew-x: 5.83367641; skew-y: 4.66443677; scale-x: 1.10744948; scale-y: 1.01428758; cel: 0; alpha: 1; }
        frame 52 { x: 41.6672889; y: -17.5522959; skew-x: 7.10243783; skew-y: 6.49216224; scale-x: 1.1025341; scale-y: 1.01168771; cel: 0; alpha: 1; }
        frame 53 { x: 44.014735; y: -18.0512137; skew-x: 8.57252448; skew-y: 8.52558516; scale-x: 1.09783998; scale-y: 1.00938044; cel: 0; alpha: 1; }
        frame 54 { x: 46.5853398; y: -18.5306561; skew-x: 9.9433603; skew-y: 10.4632909; scale-x: 1.09336856; scale-y: 1.00737016; cel: 0; alpha: 1; }
        frame 55 { x: 48.734952; y: -18.9185655; skew-x: 11.2143848; skew-y: 12.3037923; scale-x: 1.08802958; scale-y: 1.00465393; cel: 0; alpha: 1; }
        frame 56 { x: 51.1666532; y: -19.3706204; skew-x: 12.6850457; skew-y: 14.3455944; scale-x: 1.08509751; scale-y: 1.00425812; cel: 0; alpha: 1; }
        frame 57 { x: 44.937435; y: -16.4053564; skew-x: 7.95303457; skew-y: 9.3221573; scale-x: 1.08561019; scale-y: 0.991007321; cel: 0; alpha: 1; }
        frame 58 { x: 38.7994043; y: -13.4333697; skew-x: 3.28860123; skew-y: 4.1932701; scale-x: 1.08858595; scale-y: 0.982203533; cel: 0; alpha: 1; }
        frame 59 { x: 28.448297; y: -10.6019312; skew-x: -2.90880669; skew-y: -3.19997379; scale-x: 1.11072855; scale-y: 0.997350468; cel: 0; alpha: 1; }
        frame 60 { x: 18.2639881; y: -6.99682456; skew-x: -9.73465934; skew-y: -11.1321499; scale-x: 1.13820168; scale-y: 1.01187311; cel: 0; alpha: 1; }
        frame 61 { x: 17.7321775; y: -6.1573616; skew-x: -11.0406123; skew-y: -12.1854777; scale-x: 1.13146476; scale-y: 1.0144345; cel: 0; alpha: 1; }
        frame 62 { x: 17.0575563; y: -5.26469348; skew-x: -12.6578802; skew-y: -13.5327454; scale-x: 1.12617176; scale-y: 1.01710992; cel: 0; alpha: 1; }
        frame 63 { x: 20.9719684; y: -7.65591599; skew-x: -9.82131927; skew-y: -10.6397982; scale-x: 1.11192865; scale-y: 1.01531311; cel: 0; alpha: 1; }
        frame 64 { x: 24.9359888; y: -9.88156841; skew-x: -7.07849053; skew-y: -7.82505235; scale-x: 1.09846646; scale-y: 1.01362277; cel: 0; alpha: 1; }
        frame 65 { x: 28.9279635; y: -12.2059078; skew-x: -4.63307866; skew-y: -5.28976862; scale-x: 1.08578839; scale-y: 1.01207401; cel: 0; alpha: 1; }
        frame 66 { x: 31.0817476; y: -12.9809118; skew-x: -3.4058164; skew-y: -3.99032676; scale-x: 1.0717277; scale-y: 1.01039006; cel: 0; alpha: 1; }
        frame 67 { x: 33.3029945; y: -13.9134723; skew-x: -2.1794551; skew-y: -2.68063251; scale-x: 1.05676058; scale-y: 1.00857172; cel: 0; alpha: 1; }
        frame 68 { x: 35.6002771; y: -14.8358087; skew-x: -0.847854824; skew-y: -1.2680958; scale-x: 1.04196903; scale-y: 1.00562773; cel: 0; alpha: 1; }
        frame 69 { x: 37.8994663; y: -15.5792378; skew-x: 0.38499283; skew-y: 0.0516608685; scale-x: 1.0283863; scale-y: 1.00356246; cel: 0; alpha: 1; }
        frame 70 { x: 40.3817079; y: -16.2964753; skew-x: 1.81869031; skew-y: 1.57902973; scale-x: 1.01394094; scale-y: 1.00137844; cel: 0; alpha: 1; }
        frame 71 { x: 40.3867503; y: -16.2815483; skew-x: 1.81484244; skew-y: 1.58894475; scale-x: 1.01391551; scale-y: 1.00090978; cel: 0; alpha: 1; }
        frame 72 { x: 45.3215597; y: -15.7430695; skew-x: 5.23283151; skew-y: 5.08731094; scale-x: 1.00350642; scale-y: 0.998350873; cel: 0; alpha: 1; }
        frame 73 { x: 50.7247287; y: -15.1329309; skew-x: 8.7686915; skew-y: 8.67711646; scale-x: 0.99548574; scale-y: 0.996889745; cel: 0; alpha: 1; }
        frame 74 { x: 55.8238269; y: -14.3776541; skew-x: 12.412783; skew-y: 12.3550734; scale-x: 0.988859831; scale-y: 0.995535717; cel: 0; alpha: 1; }
        frame 75 { x: 61.0630824; y: -13.3511525; skew-x: 15.8550824; skew-y: 15.8178538; scale-x: 0.983632718; scale-y: 0.994292267; cel: 0; alpha: 1; }
        frame 76 { x: 65.7856318; y: -12.3234643; skew-x: 19.1678267; skew-y: 18.4902802; scale-x: 0.982409102; scale-y: 0.986688148; cel: 0; alpha: 1; }
        frame 77 { x: 70.6864497; y: -11.1866059; skew-x: 22.4462948; skew-y: 21.1673737; scale-x: 0.983167845; scale-y: 0.979908083; cel: 0; alpha: 1; }
        frame 78 { x: 76.2611215; y: -11.162191; skew-x: 27.9111721; skew-y: 24.1664921; scale-x: 0.983393336; scale-y: 0.995296899; cel: 0; alpha: 1; }
        frame 79 { x: 82.1012855; y: -11.1914769; skew-x: 33.2355095; skew-y: 27.0190025; scale-x: 0.986196409; scale-y: 1.01007954; cel: 0; alpha: 1; }
        frame 80 { x: 84.0175407; y: -8.99437414; skew-x: 34.3391655; skew-y: 28.7596889; scale-x: 0.985814913; scale-y: 0.9912923; cel: 0; alpha: 1; }
        frame 81 { x: 86.1607033; y: -6.97217989; skew-x: 35.7219752; skew-y: 30.8466426; scale-x: 0.985633866; scale-y: 0.972484929; cel: 0; alpha: 1; }
        frame 82 { x: 88.2352948; y: -4.89376847; skew-x: 36.8833559; skew-y: 32.7820194; scale-x: 0.986637886; scale-y: 0.95462672; cel: 0; alpha: 1; }
        frame 83 { x: 90.470289; y: -3.67118309; skew-x: 39.4131477; skew-y: 34.6182444; scale-x: 0.989306146; scale-y: 0.951679452; cel: 0; alpha: 1; }
        frame 84 { x: 92.8028042; y: -2.24913928; skew-x: 41.9162538; skew-y: 36.4565108; scale-x: 0.992578323; scale-y: 0.948935638; cel: 0; alpha: 1; }
        frame 85 { x: 95.2034543; y: -0.828576616; skew-x: 44.5896732; skew-y: 38.4955124; scale-x: 0.997419069; scale-y: 0.947372221; cel: 0; alpha: 1; }
        frame 86 { x: 88.8328144; y: -5.70135681; skew-x: 39.132025; skew-y: 34.1318879; scale-x: 0.991452749; scale-y: 0.964562093; cel: 0; alpha: 1; }
        frame 87 { x: 82.6543289; y: -10.2325227; skew-x: 33.567189; skew-y: 29.8774861; scale-x: 0.991484029; scale-y: 0.985051054; cel: 0; alpha: 1; }
        frame 88 { x: 73.9126705; y: -16.2949864; skew-x: 26.6256671; skew-y: 22.5119732; scale-x: 1.01658935; scale-y: 0.985109409; cel: 0; alpha: 1; }
        frame 89 { x: 65.0431123; y: -21.4875531; skew-x: 19.813298; skew-y: 15.1624037; scale-x: 1.04802012; scale-y: 0.98748155; cel: 0; alpha: 1; }
        frame 90 { x: 36.8196942; y: -14.3887752; skew-x: -8.0657923; skew-y: 0.423425268; scale-x: 1.02988219; scale-y: 1.00956215; cel: 0; alpha: 1; }
        frame 91 { x: 8.94173126; y: -8.74918613; skew-x: -17.2932804; skew-y: -15.5141419; scale-x: 1.06466473; scale-y: 1.11935556; cel: 0; alpha: 1; }
        frame 92 { x: -13.8289619; y: 3.4799374; skew-x: -23.1069578; skew-y: -22.8494495; scale-x: 1.07209954; scale-y: 1.04301199; cel: 0; alpha: 1; }
        frame 93 { x: -13.5535915; y: 4.76165987; skew-x: -23.5307862; skew-y: -22.6780463; scale-x: 1.07105607; scale-y: 1.04053386; cel: 0; alpha: 1; }
        frame 94 { x: -13.4167029; y: 6.10703127; skew-x: -24.169404; skew-y: -22.6929705; scale-x: 1.07007656; scale-y: 1.03888687; cel: 0; alpha: 1; }
        frame 95 { x: -13.4180712; y: 4.9072111; skew-x: -23.6153569; skew-y: -22.6919232; scale-x: 1.07067807; scale-y: 1.03758939; cel: 0; alpha: 1; }
        frame 96 { x: -13.8289632; y: 3.4799375; skew-x: -23.1069562; skew-y: -22.8494505; scale-x: 1.07209956; scale-y: 1.04301194; cel: 0; alpha: 1; }
        frame 97 { x: -6.33497818; y: 0.189939924; skew-x: -19.4089546; skew-y: -19.375288; scale-x: 1.05881185; scale-y: 1.03525426; cel: 0; alpha: 1; }
        frame 98 { x: 1.11491934; y: -2.97606319; skew-x: -15.801483; skew-y: -15.9517034; scale-x: 1.04808008; scale-y: 1.02876072; cel: 0; alpha: 1; }
        frame 99 { x: 8.7711943; y: -5.93006481; skew-x: -12.2947419; skew-y: -12.5814799; scale-x: 1.0388262; scale-y: 1.02258649; cel: 0; alpha: 1; }
        frame 100 { x: 16.4173952; y: -8.71835802; skew-x: -8.69921005; skew-y: -9.06799011; scale-x: 1.0299985; scale-y: 1.01581207; cel: 0; alpha: 1; }
        frame 101 { x: 24.3347349; y: -11.2944039; skew-x: -5.02548063; skew-y: -5.41524528; scale-x: 1.02363171; scale-y: 1.01056946; cel: 0; alpha: 1; }
        frame 102 { x: 32.2874098; y: -14.0330181; skew-x: -1.78408808; skew-y: -2.12785981; scale-x: 1.01761297; scale-y: 1.00490707; cel: 0; alpha: 1; }
        frame 103 { x: 40.3867503; y: -16.2815483; skew-x: 1.81484244; skew-y: 1.58894475; scale-x: 1.01391551; scale-y: 1.00090978; cel: 0; alpha: 1; }
        frame 104 { x: 40.3867497; y: -16.2815455; skew-x: 1.81484383; skew-y: 1.58894448; scale-x: 1.01391552; scale-y: 1.0009098; cel: 0; alpha: 1; }
        frame 105 { x: 39.823116; y: -15.6545923; skew-x: 0.445906145; skew-y: 0.456217628; scale-x: 1.01228967; scale-y: 1.00204505; cel: 0; alpha: 1; }
        frame 106 { x: 39.2718406; y: -14.8541883; skew-x: -0.83049629; skew-y: -0.573452184; scale-x: 1.00981712; scale-y: 1.00222119; cel: 0; alpha: 1; }
        frame 107 { x: 38.8054626; y: -14.1476383; skew-x: -1.91397973; skew-y: -1.39990706; scale-x: 1.0085257; scale-y: 1.00343848; cel: 0; alpha: 1; }
        frame 108 { x: 38.3157423; y: -13.3215899; skew-x: -3.20410109; skew-y: -2.42300376; scale-x: 1.00740795; scale-y: 1.00469097; cel: 0; alpha: 1; }
        frame 109 { x: 37.8112233; y: -12.603605; skew-x: -4.60041801; skew-y: -3.54260107; scale-x: 1.00546079; scale-y: 1.00496693; cel: 0; alpha: 1; }
        frame 110 { x: 37.2281253; y: -11.7729736; skew-x: -5.90249688; skew-y: -4.55856223; scale-x: 1.00470425; scale-y: 1.00627415; cel: 0; alpha: 1; }
        frame 111 { x: 36.9654496; y: -11.1683985; skew-x: -7.10984413; skew-y: -5.47075531; scale-x: 1.00312771; scale-y: 1.00659289; cel: 0; alpha: 1; }
        frame 112 { x: 36.4220026; y: -10.424421; skew-x: -8.5219782; skew-y: -6.57904568; scale-x: 1.00274748; scale-y: 1.00793617; cel: 0; alpha: 1; }
        frame 113 { x: 33.7288568; y: -9.16665047; skew-x: -11.2047904; skew-y: -9.317074; scale-x: 1.00159896; scale-y: 1.00851185; cel: 0; alpha: 1; }
        frame 114 { x: 31.0238446; y: -7.80248669; skew-x: -13.8089968; skew-y: -11.9454; scale-x: 1.00117582; scale-y: 1.00967274; cel: 0; alpha: 1; }
        frame 115 { x: 28.3130807; y: -6.58871088; skew-x: -16.7305223; skew-y: -14.8607436; scale-x: 1.00150662; scale-y: 1.01140018; cel: 0; alpha: 1; }
        frame 116 { x: 25.694322; y: -5.10852398; skew-x: -19.3651437; skew-y: -17.4599831; scale-x: 1.00160968; scale-y: 1.01265307; cel: 0; alpha: 1; }
        frame 117 { x: 23.2412023; y: -3.56574227; skew-x: -22.2084548; skew-y: -20.2401759; scale-x: 1.00452018; scale-y: 1.01645393; cel: 0; alpha: 1; }
        frame 118 { x: 20.1134862; y: -1.64705154; skew-x: -24.2122804; skew-y: -23.6525276; scale-x: 1.0260951; scale-y: 1.01798319; cel: 0; alpha: 1; }
        frame 119 { x: 17.0313211; y: 0.437632919; skew-x: -26.3188227; skew-y: -27.1476015; scale-x: 1.04915735; scale-y: 1.02008756; cel: 0; alpha: 1; }
        frame 120 { x: 14.1341516; y: 2.75769758; skew-x: -28.4259995; skew-y: -30.6227455; scale-x: 1.07269444; scale-y: 1.02173647; cel: 0; alpha: 1; }
        frame 121 { x: 11.1964191; y: 5.14314389; skew-x: -30.6319342; skew-y: -34.17556; scale-x: 1.09780086; scale-y: 1.02394113; cel: 0; alpha: 1; }
        frame 122 { x: 11.2528921; y: 5.13106451; skew-x: -30.6319342; skew-y: -34.17556; scale-x: 1.09669976; scale-y: 1.02291411; cel: 0; alpha: 1; }
        frame 123 { x: 11.1964213; y: 5.14313714; skew-x: -30.631931; skew-y: -34.175553; scale-x: 1.09780079; scale-y: 1.02394118; cel: 0; alpha: 1; }
        frame 124 { x: 12.5480885; y: 2.518721; skew-x: -28.6358475; skew-y: -31.7156557; scale-x: 1.09208222; scale-y: 1.02228563; cel: 0; alpha: 1; }
        frame 125 { x: 14.0250345; y: 0.00222092077; skew-x: -26.6427701; skew-y: -29.2387238; scale-x: 1.08782825; scale-y: 1.02177607; cel: 0; alpha: 1; }
        frame 126 { x: 15.4831225; y: -2.51859298; skew-x: -24.6540657; skew-y: -26.745927; scale-x: 1.08393376; scale-y: 1.02140142; cel: 0; alpha: 1; }
        frame 127 { x: 17.1217098; y: -4.94383164; skew-x: -22.6711362; skew-y: -24.2386064; scale-x: 1.08039401; scale-y: 1.02117469; cel: 0; alpha: 1; }
        frame 128 { x: 18.5722414; y: -7.34825177; skew-x: -20.7953211; skew-y: -21.8181381; scale-x: 1.07720232; scale-y: 1.02110842; cel: 0; alpha: 1; }
        frame 129 { x: 27.8951957; y: -9.28493116; skew-x: -17.5185204; skew-y: -15.506675; scale-x: 1.04482858; scale-y: 1.02163312; cel: 0; alpha: 1; }
        frame 130 { x: 37.1336935; y: -10.7040372; skew-x: -14.5319858; skew-y: -9.49310137; scale-x: 1.01350886; scale-y: 1.02152737; cel: 0; alpha: 1; }
        frame 131 { x: 41.5092457; y: -11.4148802; skew-x: -11.6484499; skew-y: -7.43950916; scale-x: 1.01476949; scale-y: 1.01099235; cel: 0; alpha: 1; }
        frame 132 { x: 45.767343; y: -11.9888383; skew-x: -7.95009081; skew-y: -5.55049658; scale-x: 1.02015787; scale-y: 1.02763509; cel: 0; alpha: 1; }
        frame 133 { x: 50.5966647; y: -12.3637777; skew-x: -4.01851627; skew-y: -3.40529031; scale-x: 1.02811883; scale-y: 1.04288863; cel: 0; alpha: 1; }
        frame 134 { x: 49.555762; y: -14.7793467; skew-x: -1.51599705; skew-y: 1.15101339; scale-x: 1.06046658; scale-y: 1.01382737; cel: 0; alpha: 1; }
        frame 135 { x: 49.2238424; y: -16.8217611; skew-x: 2.87351956; skew-y: 4.31490189; scale-x: 1.10665902; scale-y: 1.04807147; cel: 0; alpha: 1; }
        frame 136 { x: 44.8147912; y: -16.4191885; skew-x: 2.28908328; skew-y: 2.92969228; scale-x: 1.06037743; scale-y: 1.02391092; cel: 0; alpha: 1; }
        frame 137 { x: 40.3867503; y: -16.2815483; skew-x: 1.81484244; skew-y: 1.58894475; scale-x: 1.01391551; scale-y: 1.00090978; cel: 0; alpha: 1; }
        frame 138 { x: 40.3867503; y: -16.2815483; skew-x: 1.81484244; skew-y: 1.58894475; scale-x: 1.01391551; scale-y: 1.00090978; cel: 0; alpha: 1; }
        frame 139 { x: 42.4622772; y: -15.9042766; skew-x: 3.32143216; skew-y: 3.07376478; scale-x: 1.01358886; scale-y: 1.00067623; cel: 0; alpha: 1; }
        frame 140 { x: 44.6447558; y: -15.4977372; skew-x: 5.02618092; skew-y: 4.86604837; scale-x: 1.01255265; scale-y: 0.999641023; cel: 0; alpha: 1; }
        frame 141 { x: 46.9792733; y: -14.9858738; skew-x: 6.9280648; skew-y: 6.66512063; scale-x: 1.01384746; scale-y: 1.00081475; cel: 0; alpha: 1; }
        frame 142 { x: 51.7707055; y: -13.494578; skew-x: 9.84255049; skew-y: 9.57845426; scale-x: 1.01158079; scale-y: 0.999238862; cel: 0; alpha: 1; }
        frame 143 { x: 57.0306854; y: -11.9440601; skew-x: 13.0526954; skew-y: 12.8172105; scale-x: 1.01033699; scale-y: 0.998324979; cel: 0; alpha: 1; }
        frame 144 { x: 62.1952063; y: -10.2340305; skew-x: 16.2523145; skew-y: 16.0771089; scale-x: 1.01212481; scale-y: 1.00011686; cel: 0; alpha: 1; }
        frame 145 { x: 72.3613225; y: -9.75394129; skew-x: 24.1839519; skew-y: 23.7927316; scale-x: 1.00330528; scale-y: 0.99372762; cel: 0; alpha: 1; }
        frame 146 { x: 83.1621969; y: -8.68222716; skew-x: 32.211744; skew-y: 31.8066689; scale-x: 1.00335249; scale-y: 0.993287708; cel: 0; alpha: 1; }
        frame 147 { x: 94.1288716; y: -6.86874535; skew-x: 40.3296019; skew-y: 40.1483224; scale-x: 1.01097362; scale-y: 0.998585714; cel: 0; alpha: 1; }
        frame 148 { x: 88.1114838; y: -9.05757721; skew-x: 37.9306521; skew-y: 37.7360281; scale-x: 1.0085564; scale-y: 0.99596607; cel: 0; alpha: 1; }
        frame 149 { x: 82.1462948; y: -11.2673189; skew-x: 35.625809; skew-y: 35.4351058; scale-x: 1.00874588; scale-y: 0.995735987; cel: 0; alpha: 1; }
        frame 150 { x: 76.1766271; y: -13.4566514; skew-x: 33.2177672; skew-y: 33.0473843; scale-x: 1.01053682; scale-y: 0.996876505; cel: 0; alpha: 1; }
        frame 151 { x: 65.2463736; y: -14.1049313; skew-x: 30.3307408; skew-y: 30.1337884; scale-x: 1.00747696; scale-y: 0.99480923; cel: 0; alpha: 1; }
        frame 152 { x: 54.4165435; y: -14.7320024; skew-x: 27.3312653; skew-y: 27.1418892; scale-x: 1.00732515; scale-y: 0.995338707; cel: 0; alpha: 1; }
        frame 153 { x: 43.7038167; y: -15.2598529; skew-x: 24.424448; skew-y: 24.2751181; scale-x: 1.00908598; scale-y: 0.997427257; cel: 0; alpha: 1; }
        frame 154 { x: 27.8905571; y: -13.71415; skew-x: 14.2541839; skew-y: 13.7410353; scale-x: 0.996398152; scale-y: 0.988189318; cel: 0; alpha: 1; }
        frame 155 { x: 12.7793465; y: -11.3075759; skew-x: 3.87354134; skew-y: 3.38968819; scale-x: 0.996279316; scale-y: 0.988896015; cel: 0; alpha: 1; }
        frame 156 { x: -1.2695249; y: -8.0632203; skew-x: -6.19722776; skew-y: -6.32975062; scale-x: 1.0073572; scale-y: 0.995968947; cel: 0; alpha: 1; }
        frame 157 { x: -4.956588; y: -4.22662531; skew-x: -9.38380898; skew-y: -9.55234334; scale-x: 1.0052813; scale-y: 0.994348752; cel: 0; alpha: 1; }
        frame 158 { x: -8.492528; y: -0.540483417; skew-x: -12.6840197; skew-y: -12.8507945; scale-x: 1.00531128; scale-y: 0.994480656; cel: 0; alpha: 1; }
        frame 159 { x: -11.970163; y: 3.3821149; skew-x: -15.8908012; skew-y: -16.0202967; scale-x: 1.00645457; scale-y: 0.995311445; cel: 0; alpha: 1; }
        frame 160 { x: -10.937591; y: 1.65920745; skew-x: -14.5072786; skew-y: -14.6184418; scale-x: 1.00386642; scale-y: 0.994268572; cel: 0; alpha: 1; }
        frame 161 { x: -9.95957299; y: -0.0663567104; skew-x: -13.2214941; skew-y: -13.3121898; scale-x: 1.0024659; scale-y: 0.994353774; cel: 0; alpha: 1; }
        frame 162 { x: -9.04535437; y: -1.69271204; skew-x: -11.9339067; skew-y: -12.0018903; scale-x: 1.00224984; scale-y: 0.995570901; cel: 0; alpha: 1; }
        frame 163 { x: -5.24159261; y: -5.75170383; skew-x: -8.21576066; skew-y: -8.37575441; scale-x: 0.998311248; scale-y: 0.99264312; cel: 0; alpha: 1; }
        frame 164 { x: -1.26718494; y: -9.4989998; skew-x: -4.39390827; skew-y: -4.60403102; scale-x: 0.996846497; scale-y: 0.991542506; cel: 0; alpha: 1; }
        frame 165 { x: 2.87829971; y: -13.4434544; skew-x: -0.6791254; skew-y: -0.893188481; scale-x: 0.99683637; scale-y: 0.99135771; cel: 0; alpha: 1; }
        frame 166 { x: 6.95966204; y: -17.0783022; skew-x: 2.81796275; skew-y: 2.64954967; scale-x: 0.998253146; scale-y: 0.992168149; cel: 0; alpha: 1; }
        frame 167 { x: 11.3900751; y: -20.661324; skew-x: 6.58709265; skew-y: 6.51638841; scale-x: 1.00105091; scale-y: 0.994039241; cel: 0; alpha: 1; }
        frame 168 { x: 18.9062823; y: -21.1168922; skew-x: 8.81279153; skew-y: 8.64446194; scale-x: 0.998694561; scale-y: 0.992102398; cel: 0; alpha: 1; }
        frame 169 { x: 26.4791834; y: -21.6205456; skew-x: 11.0428557; skew-y: 10.792594; scale-x: 0.99689678; scale-y: 0.99043298; cel: 0; alpha: 1; }
        frame 170 { x: 34.3016581; y: -22.0609464; skew-x: 13.374817; skew-y: 13.0595754; scale-x: 0.996662454; scale-y: 0.990051195; cel: 0; alpha: 1; }
        frame 171 { x: 41.6769845; y: -19.8731841; skew-x: 15.6074496; skew-y: 15.2212374; scale-x: 0.995753873; scale-y: 0.98877324; cel: 0; alpha: 1; }
        frame 172 { x: 49.0555744; y: -17.5626647; skew-x: 17.9367272; skew-y: 17.500601; scale-x: 0.995436474; scale-y: 0.987825691; cel: 0; alpha: 1; }
        frame 173 { x: 56.4494898; y: -15.189728; skew-x: 20.4599246; skew-y: 19.996055; scale-x: 0.997707262; scale-y: 0.989218489; cel: 0; alpha: 1; }
        frame 174 { x: 64.7851686; y: -14.1678742; skew-x: 24.2528758; skew-y: 23.827467; scale-x: 0.999846124; scale-y: 0.990158724; cel: 0; alpha: 1; }
        frame 175 { x: 73.3221552; y: -13.047241; skew-x: 28.2071573; skew-y: 27.8818478; scale-x: 1.0044505; scale-y: 0.993213453; cel: 0; alpha: 1; }
        frame 176 { x: 81.875376; y: -11.8335729; skew-x: 32.0124512; skew-y: 31.8500288; scale-x: 1.0114444; scale-y: 0.99843822; cel: 0; alpha: 1; }
        frame 177 { x: 79.0257258; y: -12.5616504; skew-x: 32.6152146; skew-y: 32.4479958; scale-x: 1.00944941; scale-y: 0.996144996; cel: 0; alpha: 1; }
        frame 178 { x: 76.1766375; y: -13.4566549; skew-x: 33.2177731; skew-y: 33.0473892; scale-x: 1.01053681; scale-y: 0.996876614; cel: 0; alpha: 1; }
        frame 179 { x: 65.2463779; y: -14.1049297; skew-x: 30.3307398; skew-y: 30.1337922; scale-x: 1.00747698; scale-y: 0.99480924; cel: 0; alpha: 1; }
        frame 180 { x: 54.4165441; y: -14.7320024; skew-x: 27.3312655; skew-y: 27.1418895; scale-x: 1.00732515; scale-y: 0.995338709; cel: 0; alpha: 1; }
        frame 181 { x: 43.7038165; y: -15.2598476; skew-x: 24.4244431; skew-y: 24.2751165; scale-x: 1.00908596; scale-y: 0.997427177; cel: 0; alpha: 1; }
        frame 182 { x: 24.5905596; y: -13.7141455; skew-x: 14.2541843; skew-y: 13.7410353; scale-x: 0.9963981; scale-y: 0.988189304; cel: 0; alpha: 1; }
        frame 183 { x: 6.17934769; y: -11.3075801; skew-x: 3.87354059; skew-y: 3.38968818; scale-x: 0.9962793; scale-y: 0.988895999; cel: 0; alpha: 1; }
        frame 184 { x: -11.2695208; y: -8.06322023; skew-x: -6.19722373; skew-y: -6.32975125; scale-x: 1.00735715; scale-y: 0.995968947; cel: 0; alpha: 1; }
        frame 185 { x: -27.4024585; y: -0.388050012; skew-x: -8.68916519; skew-y: -8.83228174; scale-x: 1.0053555; scale-y: 0.994046689; cel: 0; alpha: 1; }
        frame 186 { x: -43.2623481; y: 7.27691768; skew-x: -11.3874649; skew-y: -11.5175226; scale-x: 1.00608532; scale-y: 0.994603672; cel: 0; alpha: 1; }
        frame 187 { x: -70.5932863; y: 35.3531243; skew-x: -25.5696267; skew-y: -26.0615476; scale-x: 0.993630266; scale-y: 0.985551476; cel: 0; alpha: 1; }
        frame 188 { x: -95.8074724; y: 64.3426069; skew-x: -39.9442888; skew-y: -40.1063184; scale-x: 1.00527916; scale-y: 0.993458942; cel: 0; alpha: 1; }
        frame 189 { x: -97.1708198; y: 72.1424229; skew-x: -46.1775745; skew-y: -46.8381793; scale-x: 0.996998607; scale-y: 0.987548871; cel: 0; alpha: 1; }
        frame 190 { x: -98.1580142; y: 80.0864405; skew-x: -52.1861617; skew-y: -53.1775231; scale-x: 0.995676951; scale-y: 0.989015745; cel: 0; alpha: 1; }
        frame 191 { x: -99.372043; y: 82.1609519; skew-x: -51.0187696; skew-y: -54.5965503; scale-x: 0.987812574; scale-y: 0.981746285; cel: 0; alpha: 1; }
        frame 192 { x: -100.6436; y: 84.1665624; skew-x: -49.8620401; skew-y: -56.0343203; scale-x: 0.983249086; scale-y: 0.975362637; cel: 0; alpha: 1; }
        frame 193 { x: -99.1055407; y: 78.7319795; skew-x: -47.7854608; skew-y: -51.1953946; scale-x: 1.02160692; scale-y: 0.974918472; cel: 0; alpha: 1; }
        frame 194 { x: -97.5069378; y: 73.2430537; skew-x: -45.8081727; skew-y: -46.3642033; scale-x: 1.06474162; scale-y: 0.979089286; cel: 0; alpha: 1; }
        frame 195 { x: -97.4426874; y: 76.2351963; skew-x: -46.6143325; skew-y: -47.848249; scale-x: 1.0515367; scale-y: 0.981913408; cel: 0; alpha: 1; }
        frame 196 { x: -97.4414834; y: 79.0679673; skew-x: -47.4212138; skew-y: -49.3061454; scale-x: 1.04140382; scale-y: 0.987781998; cel: 0; alpha: 1; }
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
        frame 0 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 1 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 2 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 3 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 4 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 5 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 6 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 7 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 8 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 9 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 10 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 11 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 12 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 13 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 14 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 15 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 16 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 17 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 18 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 19 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 20 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 21 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 22 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 23 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 24 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 25 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 26 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 27 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 28 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 29 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 30 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 31 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 32 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 33 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 34 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 35 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 36 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 37 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 38 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 39 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 40 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 41 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 42 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 43 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 44 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 45 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 46 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 47 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 48 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 49 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 50 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 51 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 52 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 53 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 54 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 55 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 56 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 57 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 58 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 59 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 60 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 61 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 62 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 63 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 64 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 65 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 66 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 67 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 68 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 69 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 70 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 71 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 72 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 73 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 74 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 75 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 76 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 77 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 78 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 79 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 80 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 81 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 82 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 83 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 84 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 85 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 86 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 87 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 88 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 89 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 90 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 91 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 92 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 93 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 94 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 95 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 96 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 97 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 98 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 99 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 100 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 101 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 102 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 103 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 104 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 105 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 106 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 107 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 108 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 109 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 110 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 111 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 112 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 113 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 114 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 115 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 116 { x: 0; y: 0; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; cel: -1; alpha: 1; }
        frame 117 { x: -0.0285335762; y: -19.8460541; skew-x: -121.243158; skew-y: -121.206189; scale-x: 1.0367654; scale-y: 1.01511171; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_GARGANTUAR_INNERARM_THUMB; }
        frame 118 { x: 2.44503816; y: -19.780221; skew-x: -121.240684; skew-y: -121.151938; scale-x: 1.03526079; scale-y: 1.01368492; cel: 0; alpha: 1; }
        frame 119 { x: 4.63201786; y: -19.6123854; skew-x: -121.138163; skew-y: -120.997768; scale-x: 1.03373704; scale-y: 1.0122779; cel: 0; alpha: 1; }
        frame 120 { x: 7.09640875; y: -19.4302313; skew-x: -121.135485; skew-y: -120.943728; scale-x: 1.03324377; scale-y: 1.01191801; cel: 0; alpha: 1; }
        frame 121 { x: 9.10609994; y: -18.7902793; skew-x: -121.361467; skew-y: -121.124125; scale-x: 1.03685081; scale-y: 1.01559345; cel: 0; alpha: 1; }
        frame 122 { x: 8.39855501; y: -18.0916128; skew-x: -119.524292; skew-y: -119.370489; scale-x: 1.03495997; scale-y: 1.0135041; cel: 0; alpha: 1; }
        frame 123 { x: 7.61436274; y: -17.2781137; skew-x: -117.986777; skew-y: -117.917234; scale-x: 1.03616944; scale-y: 1.01455242; cel: 0; alpha: 1; }
        frame 124 { x: 3.17154962; y: -17.6475154; skew-x: -133.201424; skew-y: -133.098116; scale-x: 1.03400367; scale-y: 1.01247418; cel: 0; alpha: 1; }
        frame 125 { x: -1.06819926; y: -19.6743467; skew-x: -148.516054; skew-y: -148.379021; scale-x: 1.03288051; scale-y: 1.01143263; cel: 0; alpha: 1; }
        frame 126 { x: -5.16269186; y: -23.494682; skew-x: -163.930633; skew-y: -163.759964; scale-x: 1.03279981; scale-y: 1.01142776; cel: 0; alpha: 1; }
        frame 127 { x: -9.72769127; y: -28.9514658; skew-x: -179.045141; skew-y: -178.841002; scale-x: 1.03271104; scale-y: 1.01143156; cel: 0; alpha: 1; }
        frame 128 { x: -15.0880581; y: -35.9894356; skew-x: -194.459537; skew-y: -194.222136; scale-x: 1.03156301; scale-y: 1.01041453; cel: 0; alpha: 1; }
        frame 129 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 130 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 131 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 132 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 133 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 134 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 135 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 136 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 137 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 138 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 139 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 140 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 141 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 142 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 143 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 144 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 145 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 146 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 147 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 148 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 149 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 150 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 151 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 152 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 153 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 154 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 155 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 156 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 157 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 158 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 159 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 160 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 161 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 162 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 163 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 164 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 165 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 166 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 167 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 168 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 169 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 170 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 171 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 172 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 173 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 174 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 175 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 176 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 177 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 178 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 179 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 180 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 181 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 182 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 183 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 184 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 185 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 186 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 187 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 188 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 189 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 190 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 191 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 192 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 193 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 194 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 195 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
        frame 196 { x: -25.4; y: -28.7; skew-x: -230.1; skew-y: -230.1; scale-x: 0.988; scale-y: 0.988; cel: -1; alpha: 0; }
    }
}
