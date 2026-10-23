export component Zombie_polevaulter {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 193;
        frame 13 { cel: -1; }
        frame 14 { cel: -10000; }
    }
    Track {
        source-name: "anim_run";
        frame-count: 193;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 6.1; y: 27.1; skew-x: 5; skew-y: 5.2; scale-x: 0.993; scale-y: 0.995; cel: 0; }
        frame 14 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 50 { cel: -1; }
        frame 51 { cel: -10000; }
    }
    Track {
        source-name: "anim_jump";
        frame-count: 193;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 50 { x: 6.1; y: 27.1; skew-x: 5; skew-y: 5.2; scale-x: 0.993; scale-y: 0.995; cel: 0; }
        frame 51 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 93 { cel: -1; }
        frame 94 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 193;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 93 { x: 6.1; y: 27.1; skew-x: 5; skew-y: 5.2; scale-x: 0.993; scale-y: 0.995; cel: 0; }
        frame 94 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 138 { cel: -1; }
        frame 139 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 193;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 138 { x: 6.1; y: 27.1; skew-x: 5; skew-y: 5.2; scale-x: 0.993; scale-y: 0.995; cel: 0; }
        frame 139 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 165 { cel: -1; }
        frame 166 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 193;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 165 { x: 6.1; y: 27.1; skew-x: 5; skew-y: 5.2; scale-x: 0.993; scale-y: 0.995; cel: 0; }
        frame 166 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 193;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: -59.8; y: 70.1; cel: 0; }
        frame 14 { x: -59; y: -10000; cel: -10000; }
        frame 15 { x: -58.2; }
        frame 16 { x: -57.3; }
        frame 17 { x: -56.5; }
        frame 18 { x: -55.7; }
        frame 19 { x: -54.8; }
        frame 20 { x: -54; }
        frame 21 { x: -53.2; }
        frame 22 { x: -52.3; }
        frame 23 { x: -51.5; }
        frame 24 { x: -50.7; }
        frame 25 { x: -49.8; }
        frame 26 { x: -49; }
        frame 27 { x: -48.2; }
        frame 28 { x: -47.3; }
        frame 29 { x: -46.5; }
        frame 30 { x: -45.7; }
        frame 31 { x: -44.8; }
        frame 32 { x: -44; }
        frame 33 { x: -43.2; }
        frame 34 { x: -42.3; }
        frame 35 { x: -41.5; }
        frame 36 { x: -40.7; }
        frame 37 { x: -39.8; }
        frame 38 { x: -39; }
        frame 39 { x: -38.2; }
        frame 40 { x: -37.3; }
        frame 41 { x: -36.5; }
        frame 42 { x: -35.7; }
        frame 43 { x: -34.8; }
        frame 44 { x: -34; }
        frame 45 { x: -33.2; }
        frame 46 { x: -32.3; }
        frame 47 { x: -31.5; }
        frame 48 { x: -30.7; }
        frame 49 { x: -29.8; }
        frame 50 { x: -10000; cel: -1; }
        frame 51 { cel: -10000; }
        frame 93 { x: -59.8; cel: 0; }
        frame 94 { x: -59.1; cel: -10000; }
        frame 95 { x: -58.3; }
        frame 96 { x: -57.6; }
        frame 97 { x: -56.9; }
        frame 98 { x: -55; }
        frame 99 { x: -53; }
        frame 100 { x: -51.1; }
        frame 101 { x: -49.2; }
        frame 102 { x: -47.2; }
        frame 103 { x: -45.1; }
        frame 104 { x: -43.1; }
        frame 105 { x: -41.1; }
        frame 106 { x: -39; }
        frame 107 { x: -37; }
        frame 108 { x: -35; }
        frame 109 { x: -32.9; }
        frame 110 { x: -30.9; }
        frame 111 { x: -28.9; }
        frame 112 { x: -27; }
        frame 113 { x: -25; }
        frame 114 { x: -23; }
        frame 115 { x: -21; }
        frame 116 { x: -19; }
        frame 117 { x: -17; }
        frame 118 { x: -14.7; }
        frame 119 { x: -12.3; }
        frame 120 { x: -10; }
        frame 121 { x: -7.7; }
        frame 122 { x: -5.8; }
        frame 123 { x: -3.9; }
        frame 124 { x: -2; }
        frame 125 { x: -0.1; }
        frame 126 { x: 1.6; }
        frame 127 { x: 3.5; }
        frame 128 { x: 5.4; }
        frame 129 { x: 7.3; }
        frame 130 { x: 7.5; }
        frame 131 { x: 7.8; }
        frame 132 { x: 8; }
        frame 133 { x: 8.2; }
        frame 134 { x: -10000; }
        frame 135 { x: 8.1; }
        frame 136 { x: 8; }
        frame 138 { x: -10000; cel: -1; }
        frame 139 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_polevaulter_pole2";
        frame-count: 193;
        frame 0 { x: -82.7; y: 16.4; scale-x: 1.117; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_POLE2; }
        frame 1 { x: -10000; y: 17.2; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 18; skew-x: 0.5; skew-y: 0.5; }
        frame 3 { x: -83.4; y: 20.3; skew-x: 0; skew-y: 0; }
        frame 4 { x: -84; y: 22.2; skew-x: -0.2; skew-y: -0.2; }
        frame 5 { x: -84.7; y: 24.4; skew-x: -0.7; skew-y: -0.7; }
        frame 6 { x: -85.2; y: 26.7; skew-x: -1.2; skew-y: -1.2; }
        frame 7 { x: -84.6; y: 27.4; skew-x: -2.2; skew-y: -2.2; }
        frame 8 { x: -84.3; y: 28.7; skew-x: -3.5; skew-y: -3.5; }
        frame 9 { x: -83.9; y: 25.4; skew-x: -2.4; skew-y: -2.4; }
        frame 10 { x: -83.5; y: 22.4; skew-x: -1.7; skew-y: -1.7; }
        frame 11 { x: -83.2; y: 19.2; skew-x: -0.7; skew-y: -0.7; }
        frame 12 { x: -82.7; y: 16.4; skew-x: 0; skew-y: 0; }
        frame 13 { x: -81.2; y: 8.5; skew-x: 0.8; skew-y: 0.8; }
        frame 14 { x: -10000; y: 4.9; skew-x: 1.8; skew-y: 1.8; }
        frame 15 { y: 1.3; skew-x: 2.8; skew-y: 2.8; }
        frame 16 { x: -81; y: -2.6; skew-x: 4; skew-y: 4; }
        frame 17 { x: -80; y: -5.7; skew-x: -10000; skew-y: -10000; }
        frame 18 { x: -79; y: -8.8; }
        frame 19 { x: -78; y: -11.9; }
        frame 20 { x: -79.1; y: -11.3; skew-x: 2.8; skew-y: 2.8; }
        frame 21 { x: -80.1; y: -11.1; skew-x: 1.8; skew-y: 1.8; }
        frame 22 { x: -81.2; y: -10.8; skew-x: 0.7; skew-y: 0.7; }
        frame 23 { x: -82.4; y: -11.8; skew-x: 2.9; skew-y: 2.9; scale-x: 1.116; scale-y: 0.799; }
        frame 24 { x: -81.9; y: -3; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -81.2; y: 5.3; skew-x: 0.7; skew-y: 0.7; scale-x: 1.117; scale-y: 0.8; }
        frame 26 { x: -84.6; y: 18.9; skew-x: -2.7; skew-y: -2.2; scale-x: 1.116; scale-y: 0.799; }
        frame 27 { x: -87.8; y: 32.5; skew-x: -6.2; skew-y: -5.2; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -90.4; y: 46.3; skew-x: -9.7; skew-y: -8.3; }
        frame 29 { x: -88.2; y: 52.2; skew-x: -11.5; skew-y: -10.1; scale-x: 1.115; }
        frame 30 { x: -88.4; y: 35.9; skew-x: -6.7; skew-y: -5.2; scale-x: -10000; }
        frame 31 { x: -88; y: 19.8; skew-x: -1.9; skew-y: -0.4; }
        frame 32 { x: -85.8; y: 16.5; skew-x: -1.5; skew-y: -0.2; }
        frame 33 { x: -83.5; y: 13.5; skew-x: -1.2; skew-y: 0; }
        frame 34 { x: -81.1; y: 10.7; skew-x: -1.1; skew-y: 0.2; }
        frame 35 { x: -79.6; y: 7.1; skew-x: 0; skew-y: 1.3; }
        frame 36 { x: -78.1; y: 3.5; skew-x: 1.3; skew-y: 2.3; }
        frame 37 { x: -76.4; y: -0; skew-x: 2.5; skew-y: 3.3; }
        frame 38 { x: -10000; y: -2.7; skew-x: 1.8; skew-y: 2.5; }
        frame 39 { y: -5.2; skew-x: 1; skew-y: 1.8; }
        frame 40 { x: -76.3; y: -8.2; skew-x: 0.5; skew-y: 1.2; scale-x: 1.116; }
        frame 41 { x: -81; y: -12; skew-x: 4.1; skew-y: 4.8; scale-x: 1.115; }
        frame 42 { x: -83.4; y: -6.7; skew-x: 3.5; skew-y: 4; scale-x: -10000; }
        frame 43 { x: -85.9; y: -1.5; skew-x: 3; skew-y: 3.5; scale-x: 1.116; }
        frame 44 { x: -86.1; y: 5.8; skew-x: 2.5; skew-y: 2.8; scale-x: -10000; }
        frame 45 { x: -86.5; y: 13.4; skew-x: 2; skew-y: 2.3; }
        frame 46 { x: -86.7; y: 20.8; skew-x: 1.5; skew-y: 1.8; }
        frame 47 { x: -87.9; y: 24.5; skew-x: -2.8; skew-y: -2.8; }
        frame 48 { x: -84.6; y: 16.4; skew-x: -0.9; skew-y: -0.9; scale-x: 1.117; scale-y: 0.8; }
        frame 49 { x: -81.2; y: 8.5; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 51 { x: -71.4; y: -12.3; skew-x: 7.8; skew-y: 7.8; scale-x: 1.116; scale-y: 0.799; }
        frame 52 { x: -59.7; y: -33.2; skew-x: 15; skew-y: 15; scale-x: 1.115; scale-y: -10000; }
        frame 53 { x: -46.3; y: -53.7; skew-x: 22.3; skew-y: 22.3; scale-x: 1.114; scale-y: 0.798; }
        frame 54 { x: -31.5; y: -73.4; skew-x: 29.4; skew-y: 29.4; scale-x: 1.115; scale-y: 0.799; }
        frame 55 { x: -80.5; y: -9.9; skew-x: -5.2; skew-y: -5.2; scale-x: 1.113; scale-y: 0.797; }
        frame 56 { x: -86.5; y: 69.6; skew-x: -40; skew-y: -40; scale-x: 1.11; scale-y: 0.795; }
        frame 57 { x: -50.8; y: 118.5; skew-x: -74.8; skew-y: -74.8; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: -29.4; y: 128.4; skew-x: -87.2; skew-y: -88.7; scale-x: 1.108; scale-y: 0.794; }
        frame 59 { x: -11; y: 133.7; skew-x: -96.5; skew-y: -99.1; scale-x: -10000; scale-y: 0.795; }
        frame 60 { x: -11.4; y: 133.5; skew-x: -95.4; skew-y: -98.2; scale-y: 0.794; }
        frame 61 { x: -11.8; y: 133.3; skew-x: -94.5; skew-y: -97.2; scale-x: 1.109; scale-y: -10000; }
        frame 62 { x: -11.9; y: 133.1; skew-x: -93.7; skew-y: -96.4; scale-x: -10000; }
        frame 63 { x: -11.7; y: 133; skew-x: -92.9; skew-y: -95.7; }
        frame 64 { x: -11.5; y: 132.9; skew-x: -92.2; skew-y: -94.7; scale-x: 1.11; }
        frame 65 { x: -11.3; y: -10000; skew-x: -91.4; skew-y: -94.1; scale-x: -10000; }
        frame 66 { x: -11.9; y: 133.4; skew-x: -91.6; skew-y: -94.2; scale-x: 1.148; }
        frame 67 { x: -11.2; y: 133.6; skew-x: -89.4; skew-y: -91.9; scale-x: 1.187; }
        frame 68 { x: -10000; y: 133.8; skew-x: -87; skew-y: -89.7; scale-x: 1.226; }
        frame 69 { x: -11.6; y: 134.4; skew-x: -90.9; skew-y: -93.7; scale-x: -10000; }
        frame 70 { x: -11.7; y: -10000; skew-x: -94.9; skew-y: -97.7; scale-x: 1.225; scale-y: 0.793; }
        frame 71 { x: -11.5; y: 133.8; skew-x: -99.1; skew-y: -101.7; scale-x: -10000; scale-y: 0.794; }
        frame 72 { x: -10.8; y: 134.7; skew-x: -109.7; skew-y: -112.2; scale-x: 1.223; scale-y: 0.792; }
        frame 73 { x: -10; y: 135.1; skew-x: -120.5; skew-y: -123; scale-x: 1.222; scale-y: -10000; }
        frame 74 { x: -9.5; y: 134.8; skew-x: -131.1; skew-y: -133.8; scale-x: 1.224; }
        frame 75 { x: -8.5; y: 134.7; skew-x: -143; skew-y: -145.6; scale-x: 1.221; scale-y: 0.791; }
        frame 76 { x: -7.6; y: 134.4; skew-x: -154.8; skew-y: -157.4; scale-x: 1.22; scale-y: 0.79; }
        frame 77 { x: -7.9; y: 133.6; skew-x: -166.5; skew-y: -169.1; scale-x: 1.222; scale-y: 0.791; }
        frame 78 { x: -6.8; y: 133.5; skew-x: -173.3; skew-y: -175.9; scale-x: 1.221; scale-y: -10000; }
        frame 79 { x: -7.5; y: 133.9; skew-x: -179.9; skew-y: -182.5; scale-x: -10000; }
        frame 80 { x: -7.6; y: 128.1; skew-x: -178.8; skew-y: -181.5; }
        frame 81 { x: -7.5; y: 129.9; skew-x: -180.9; skew-y: -183.5; }
        frame 82 { x: -10000; y: 133.9; skew-x: -179.9; skew-y: -182.5; }
        frame 83 { y: -10000; skew-x: -10000; skew-y: -182.4; alpha: 0.67; }
        frame 84 { skew-y: -10000; alpha: 0.33; }
        frame 85 { skew-y: -182.5; alpha: 0; }
        frame 86 { skew-y: -10000; cel: -1; alpha: -10000; }
        frame 87 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_polevaulter_pole";
        frame-count: 193;
        frame 0 { x: -56.5; y: 16; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_POLE; }
        frame 1 { x: -56.7; y: 18.6; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -57; y: 21.3; skew-x: -2; skew-y: -2; }
        frame 3 { x: -58; y: 21.8; skew-x: -1.4; skew-y: -1.4; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: -58.8; y: 22.3; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: -59.7; y: 22.9; skew-x: -0.4; skew-y: -0.4; }
        frame 6 { x: -60.5; y: 23.5; skew-x: 0; skew-y: 0; }
        frame 7 { x: -59.4; y: 21.6; skew-x: 0.8; skew-y: 0.8; }
        frame 8 { x: -58.5; y: 19.6; skew-x: 1.5; skew-y: 1.5; scale-x: 0.8; scale-y: 0.8; }
        frame 9 { x: -58.3; y: 18.7; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: -58.1; y: 17.7; skew-x: 0.8; skew-y: 0.8; }
        frame 11 { x: -57.9; y: 16.8; skew-x: 0.3; skew-y: 0.3; }
        frame 12 { x: -57.7; y: 15.7; skew-x: 0; skew-y: 0; }
        frame 13 { x: -51.7; y: 9.3; skew-x: 0.6; skew-y: 0.6; }
        frame 14 { x: -51.6; y: 5.2; skew-x: 2.3; skew-y: 2.3; scale-x: 0.799; scale-y: 0.799; }
        frame 15 { x: -51.4; y: 1.2; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: -51.3; y: -2.8; skew-x: 5.8; skew-y: 5.8; scale-x: 0.8; scale-y: 0.8; }
        frame 17 { x: -50.4; y: -4.7; skew-x: 4.8; skew-y: 4.8; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: -49.3; y: -6.6; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -48.4; y: -8.7; skew-x: 2.9; skew-y: 2.9; }
        frame 20 { x: -49.8; y: -8.6; skew-x: 1.5; skew-y: 1.5; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: -51.2; y: -8.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: -52.4; y: -10000; skew-x: -1.3; skew-y: -1.3; }
        frame 23 { x: -52.1; y: -3.5; skew-x: -3; skew-y: -3; }
        frame 24 { x: -53.6; y: 1.6; skew-x: -2; skew-y: -2; }
        frame 25 { x: -55.1; y: 7.3; skew-x: -1.3; skew-y: -1.3; }
        frame 26 { x: -59; y: 17.6; skew-x: -3.2; skew-y: -3.2; }
        frame 27 { x: -62.7; y: 28.4; skew-x: -5.4; skew-y: -5.4; }
        frame 28 { x: -66.4; y: 39.1; skew-x: -7.6; skew-y: -7.6; }
        frame 29 { x: -64.3; y: 35.5; skew-x: -2.2; skew-y: -2.4; scale-x: 0.797; scale-y: 0.797; }
        frame 30 { x: -60.9; y: 26.3; skew-x: -1.4; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: -57.6; y: 17.6; skew-x: -0.9; skew-y: -1.1; scale-y: 0.798; }
        frame 32 { x: -55.3; y: 14.3; skew-x: -0.4; skew-y: -0.7; scale-y: 0.797; }
        frame 33 { x: -53; y: 11.1; skew-x: 0; skew-y: -0.2; scale-y: 0.798; }
        frame 34 { x: -50.7; y: 8.1; skew-x: 0.3; skew-y: 0.1; scale-y: -10000; }
        frame 35 { x: -49.2; y: 5.7; skew-x: 1; skew-y: 0.8; scale-y: 0.797; }
        frame 36 { x: -47.8; y: 3.1; skew-x: 1.8; skew-y: 1.8; scale-x: 0.796; scale-y: -10000; }
        frame 37 { x: -46.3; y: 0.4; skew-x: 2.7; skew-y: 2.6; scale-x: -10000; }
        frame 38 { x: -46.1; y: -1.9; skew-x: 1.8; skew-y: 1.5; scale-y: 0.796; }
        frame 39 { x: -45.8; y: -4.3; skew-x: 0.8; skew-y: 0.6; scale-y: -10000; }
        frame 40 { x: -45.4; y: -7.1; skew-x: 0; skew-y: -0.1; }
        frame 41 { x: -47.8; y: -1.8; skew-x: -2.4; skew-y: -2.6; }
        frame 42 { x: -52.6; y: -1.3; skew-x: 0.3; skew-y: 0; }
        frame 43 { x: -57.1; y: -1; skew-x: 3.3; skew-y: 3.1; scale-y: 0.797; }
        frame 44 { x: -58.9; y: 6.5; skew-x: 2.6; skew-y: 2.5; scale-y: 0.796; }
        frame 45 { x: -60.8; y: 13.9; skew-x: 2; skew-y: 1.8; scale-y: -10000; }
        frame 46 { x: -62.5; y: 21.2; skew-x: 1.5; skew-y: 1.4; }
        frame 47 { x: -61.4; y: 16.2; skew-x: 2.8; skew-y: 2.8; scale-x: 0.797; scale-y: 0.797; }
        frame 48 { x: -56.6; y: 12.9; skew-x: 1.6; skew-y: 1.5; scale-x: 0.798; scale-y: 0.798; }
        frame 49 { x: -51.7; y: 9.3; skew-x: 0.6; skew-y: 0.6; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: -42.1; y: -7.8; skew-x: 7.6; skew-y: 7.6; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: -31.2; y: -25.2; skew-x: 14.8; skew-y: 14.8; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: -19.2; y: -42.1; skew-x: 22; skew-y: 22; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: -6; y: -58.5; skew-x: 29.2; skew-y: 29.2; }
        frame 55 { x: -50.2; y: -12.4; skew-x: -5.4; skew-y: -5.4; scale-x: 0.797; scale-y: 0.797; }
        frame 56 { x: -62.9; y: 50.4; skew-x: -40.2; skew-y: -40.2; scale-x: 0.794; scale-y: 0.794; }
        frame 57 { x: -42.7; y: 90.3; skew-x: -75; skew-y: -75; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: -30.3; y: 98.8; skew-x: -84.4; skew-y: -84.4; scale-x: 0.793; scale-y: 0.793; }
        frame 59 { x: -20.1; y: 105.2; skew-x: -90.4; skew-y: -90.4; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: -19.6; y: 105; skew-x: -89.9; skew-y: -89.9; }
        frame 61 { x: -19.1; y: 104.9; skew-x: -89.6; skew-y: -89.6; scale-x: 0.792; scale-y: 0.792; }
        frame 62 { x: -18.6; y: 104.6; skew-x: -89.3; skew-y: -89.3; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: -20.3; y: 104.9; skew-x: -86.4; skew-y: -86.4; scale-y: 0.791; }
        frame 64 { x: -22.1; y: 105; skew-x: -83.4; skew-y: -83.4; scale-y: -10000; }
        frame 65 { x: -23.8; y: 104.9; skew-x: -80.4; skew-y: -80.4; scale-x: 0.793; scale-y: 0.792; }
        frame 66 { x: -28.4; y: 100.9; skew-x: -73.3; skew-y: -73.3; scale-x: 0.791; scale-y: 0.79; }
        frame 67 { x: -29.3; y: 97.8; skew-x: -69.1; skew-y: -69.1; scale-x: 0.792; scale-y: -10000; }
        frame 68 { x: -30.2; y: 94.3; skew-x: -65; skew-y: -64.8; scale-x: 0.794; scale-y: 0.792; }
        frame 69 { x: -34.2; y: 97.8; skew-x: -69.1; skew-y: -68.8; scale-x: 0.793; scale-y: 0.791; }
        frame 70 { x: -38.3; y: 101; skew-x: -73.1; skew-y: -72.8; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -42.4; y: 103.8; skew-x: -76.9; skew-y: -76.7; scale-y: 0.792; }
        frame 72 { x: -39.2; y: 110.4; skew-x: -94.4; skew-y: -94.2; scale-x: 0.792; scale-y: 0.79; }
        frame 73 { x: -34.8; y: 112.8; skew-x: -112.1; skew-y: -111.8; scale-x: 0.791; scale-y: 0.789; }
        frame 74 { x: -10000; y: 115.5; skew-x: -125.7; skew-y: -125.6; scale-x: -10000; scale-y: 0.79; }
        frame 75 { x: -36.2; y: 119.7; skew-x: -139.1; skew-y: -139; scale-x: 0.79; scale-y: 0.788; }
        frame 76 { x: -36.6; y: 123.6; skew-x: -152.6; skew-y: -152.3; scale-x: 0.789; scale-y: 0.787; }
        frame 77 { x: -37.6; y: 127.2; skew-x: -165.9; skew-y: -165.7; scale-x: 0.79; scale-y: 0.788; }
        frame 78 { x: -37.3; y: 130.6; skew-x: -172.9; skew-y: -172.6; scale-x: 0.789; scale-y: -10000; }
        frame 79 { x: -38; y: 133.7; skew-x: -179.8; skew-y: -179.6; scale-x: -10000; }
        frame 80 { x: -38.3; y: 124.2; skew-x: -181.6; skew-y: -181.4; scale-y: 0.787; }
        frame 81 { x: -38.1; y: 133.4; skew-x: -178.6; skew-y: -178.4; scale-y: -10000; }
        frame 82 { x: -44; y: 134.1; skew-x: -179.8; skew-y: -179.6; scale-y: 0.788; }
        frame 83 { x: -10000; y: 134; skew-x: -179.9; skew-y: -10000; scale-y: 0.787; alpha: 0.67; }
        frame 84 { y: -10000; skew-x: -10000; scale-y: -10000; alpha: 0.33; }
        frame 85 { y: 134.1; skew-x: -179.8; scale-y: 0.788; alpha: 0; }
        frame 86 { y: -10000; skew-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 87 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_polevaulter_innerhand";
        frame-count: 193;
        frame 0 { x: 1.2; y: 11.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_INNERHAND; }
        frame 1 { x: 0.5; y: 12.1; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -0; y: 13.3; skew-x: 2; skew-y: 2; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: -0.3; y: 14.8; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: -0.7; y: 16.2; skew-x: 3; skew-y: 3; }
        frame 5 { x: -1; y: 17.7; skew-x: 3.5; skew-y: 3.5; }
        frame 6 { x: -1.4; y: 19.1; skew-x: 4.2; skew-y: 4.2; }
        frame 7 { x: -0.8; y: 17.6; skew-x: 3; skew-y: 3; }
        frame 8 { x: -0.1; y: 16.1; skew-x: 2; skew-y: 2; }
        frame 9 { x: 0.1; y: 14.8; skew-x: 1.5; skew-y: 1.5; }
        frame 10 { x: 0.5; y: 13.6; skew-x: 1; skew-y: 1; scale-x: 0.8; scale-y: 0.8; }
        frame 11 { x: 0.8; y: 12.3; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 1.2; y: 11.1; skew-x: 0; skew-y: 0; }
        frame 13 { x: 5.8; y: 5.7; skew-x: -0.4; skew-y: -0.4; }
        frame 14 { x: 5.2; y: 3.1; skew-x: 1; skew-y: 1; }
        frame 15 { x: 4.5; y: 0.4; skew-x: 2.6; skew-y: 2.6; }
        frame 16 { x: 3.9; y: -2.1; skew-x: 4.3; skew-y: 4.3; }
        frame 17 { x: 5.3; y: -5.3; skew-x: 3; skew-y: 3; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 6.9; y: -8.5; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 8.3; y: -11.6; skew-x: 0.9; skew-y: 0.9; }
        frame 20 { x: 6; y: -12.9; skew-x: -0.4; skew-y: -0.4; }
        frame 21 { x: 3.6; y: -14.2; skew-x: -1.7; skew-y: -1.7; }
        frame 22 { x: 1.3; y: -15.4; skew-x: -3.3; skew-y: -3.3; }
        frame 23 { x: -10000; y: -12.2; skew-x: -3.2; skew-y: -3.2; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { y: -5.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { y: 0.2; skew-x: -3.3; skew-y: -3.3; scale-x: 0.799; scale-y: 0.799; }
        frame 26 { x: -3; y: 8.8; skew-x: -6.7; skew-y: -6.7; scale-x: 0.798; scale-y: 0.798; }
        frame 27 { x: -7.3; y: 17.4; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -11.6; y: 26.1; skew-x: -13.4; skew-y: -13.4; }
        frame 29 { x: -8; y: 27.9; skew-x: -11.7; skew-y: -11.7; scale-x: 0.797; }
        frame 30 { x: -5.9; y: 20.5; skew-x: -10; skew-y: -10.2; scale-x: -10000; }
        frame 31 { x: -3.9; y: 13.1; skew-x: -8.5; skew-y: -8.7; }
        frame 32 { x: -1.6; y: 9.9; skew-x: -6.2; skew-y: -6.4; }
        frame 33 { x: 0.5; y: 6.7; skew-x: -3.9; skew-y: -4; }
        frame 34 { x: 2.7; y: 3.7; skew-x: -1.7; skew-y: -1.9; }
        frame 35 { x: 4.6; y: 2; skew-x: 0; skew-y: 0; }
        frame 36 { x: 6.4; y: 0.2; skew-x: 1.8; skew-y: 1.6; }
        frame 37 { x: 8.4; y: -1.4; skew-x: 3.7; skew-y: 3.6; }
        frame 38 { x: 8.6; y: -5.4; skew-x: 3.6; skew-y: 3.5; }
        frame 39 { x: 8.8; y: -9.4; skew-x: -10000; skew-y: -10000; }
        frame 40 { x: 9.1; y: -13.4; skew-x: 3.7; skew-y: 3.6; }
        frame 41 { x: 4.7; y: -9.7; skew-x: 0.8; skew-y: 0.6; }
        frame 42 { x: 0.5; y: -6; skew-x: -1.9; skew-y: -1.9; scale-x: 0.796; scale-y: 0.797; }
        frame 43 { x: -3.7; y: -2.3; skew-x: -4.8; skew-y: -4.9; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: -4.4; y: 4.5; skew-x: -6.2; skew-y: -6.4; }
        frame 45 { x: -5.1; y: 11.6; skew-x: -7.9; skew-y: -8; }
        frame 46 { x: -5.9; y: 18.6; skew-x: -9.5; skew-y: -9.7; }
        frame 47 { x: -2; y: 14.3; skew-x: -6.4; skew-y: -6.4; scale-x: 0.797; scale-y: 0.798; }
        frame 48 { x: 1.7; y: 10; skew-x: -3.4; skew-y: -3.4; scale-x: 0.798; scale-y: 0.799; }
        frame 49 { x: 5.8; y: 5.7; skew-x: -0.4; skew-y: -0.4; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 15.7; y: -4.4; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 25.8; y: -14.5; skew-x: 13.8; skew-y: 13.8; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: 36; y: -24.3; skew-x: 20.8; skew-y: 20.8; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 46; y: -34; skew-x: 28.1; skew-y: 28.1; }
        frame 55 { x: 8.4; y: -23.9; skew-x: -5.7; skew-y: -5.7; scale-x: 0.797; scale-y: 0.815; }
        frame 56 { x: -20.8; y: 9.1; skew-x: -40; skew-y: -40; scale-x: 0.794; scale-y: 0.83; }
        frame 57 { x: -35.4; y: 39.6; skew-x: -74.1; skew-y: -74.1; scale-x: -10000; scale-y: 0.848; }
        frame 58 { x: -31.8; y: 41.3; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 59 { x: -28.2; y: 42.8; }
        frame 60 { x: -10000; y: 43.1; skew-x: -72.8; skew-y: -72.8; scale-x: 0.793; scale-y: 0.847; }
        frame 61 { y: 43.5; skew-x: -71.4; skew-y: -71.4; scale-x: -10000; scale-y: 0.846; }
        frame 62 { x: -28.1; y: 43.7; skew-x: -69.9; skew-y: -69.9; scale-y: 0.847; }
        frame 63 { x: -26.3; y: 43.6; skew-x: -68.6; skew-y: -68.6; scale-x: 0.792; scale-y: 0.846; }
        frame 64 { x: -24.5; y: 43.3; skew-x: -67.1; skew-y: -67.1; scale-x: 0.793; scale-y: -10000; }
        frame 65 { x: -22.8; y: 43.1; skew-x: -65.6; skew-y: -65.6; scale-x: 0.794; scale-y: 0.847; }
        frame 66 { x: -19.9; y: 40; skew-x: -58.5; skew-y: -58.3; scale-x: 0.792; scale-y: 0.845; }
        frame 67 { x: -16.7; y: 36.9; skew-x: -51.3; skew-y: -51.1; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: -13.2; y: 34; skew-x: -44.1; skew-y: -43.9; scale-x: 0.793; scale-y: 0.846; }
        frame 69 { x: -20.7; y: 31.7; skew-x: -43.8; skew-y: -43.5; scale-x: 0.792; scale-y: 0.844; }
        frame 70 { x: -28.3; y: 29.6; skew-x: -43.3; skew-y: -43; scale-x: 0.791; scale-y: -10000; }
        frame 71 { x: -36.1; y: 27.4; skew-x: -43; skew-y: -42.8; scale-x: 0.792; }
        frame 72 { x: -17.7; y: 2.6; skew-x: -1.4; skew-y: -1.2; scale-x: 0.79; scale-y: 0.842; }
        frame 73 { x: 5; y: -17.4; skew-x: 39.9; skew-y: 40.1; scale-x: 0.788; scale-y: 0.84; }
        frame 74 { x: 19.9; y: -27; skew-x: 81.5; skew-y: 81.7; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 26.3; y: -19.5; skew-x: 99; skew-y: 99.1; scale-x: 0.786; scale-y: 0.839; }
        frame 76 { x: 31.7; y: -11.3; skew-x: 116.6; skew-y: 116.8; scale-x: 0.785; scale-y: 0.837; }
        frame 77 { x: 36; y: -2.7; skew-x: 134.1; skew-y: 134.4; scale-x: 0.783; scale-y: 0.836; }
        frame 78 { x: 38.9; y: 5.5; skew-x: 151.6; skew-y: 151.9; scale-x: 0.784; scale-y: -10000; }
        frame 79 { x: 13.3; y: -17; skew-x: 120.8; skew-y: 120.9; scale-x: 0.781; scale-y: 0.833; }
        frame 80 { x: -16; y: -38.9; skew-x: 89.9; skew-y: 90.1; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -50.9; y: -40.4; skew-x: 60.9; skew-y: 61.2; scale-x: 0.778; scale-y: 0.83; }
        frame 82 { x: -86.8; y: -39.1; skew-x: 31.9; skew-y: 32.2; scale-x: 0.777; scale-y: 0.829; }
        frame 83 { x: -110.5; y: -18.3; skew-x: 3.8; skew-y: 4; scale-x: 0.78; scale-y: 0.821; }
        frame 84 { x: -132.2; y: 4.8; skew-x: -24.2; skew-y: -24; scale-x: 0.782; scale-y: 0.813; }
        frame 85 { x: -140.3; y: 69.9; skew-x: -77.6; skew-y: -77.6; scale-x: 0.79; scale-y: 0.805; }
        frame 86 { x: -121.2; y: 83.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_INNERARM_HAND; }
        frame 87 { x: -120.3; y: 93.8; skew-x: -6.4; skew-y: -6.4; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 88 { x: -119.3; y: 103.9; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -119.8; y: 99.6; skew-x: -9.7; skew-y: -9.7; }
        frame 90 { x: -120.3; y: 95.2; skew-x: -6.4; skew-y: -6.4; }
        frame 91 { x: -120.7; y: 89.5; skew-x: -3.2; skew-y: -3.2; scale-x: 0.8; scale-y: 0.8; }
        frame 92 { x: -121.2; y: 83.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 29.7; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 94 { x: 28.8; y: 82.2; skew-x: 2.8; skew-y: 2.8; }
        frame 95 { x: 27.8; y: 80.7; skew-x: 5.5; skew-y: 5.5; scale-x: 0.799; scale-y: 0.799; }
        frame 96 { x: 27; y: 79.3; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 26.1; y: 77.8; skew-x: 11.1; skew-y: 11.1; }
        frame 98 { x: 25.3; y: 77; skew-x: 7.8; skew-y: 7.8; }
        frame 99 { x: 24.7; y: 76; skew-x: 4.6; skew-y: 4.6; scale-x: 0.798; scale-y: 0.798; }
        frame 100 { x: 23.9; y: 75.1; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 23.3; y: 74.1; skew-x: -1.6; skew-y: -1.6; }
        frame 102 { x: 22.7; y: 70.9; skew-x: 1.8; skew-y: 1.8; }
        frame 103 { x: 22.3; y: 67.8; skew-x: 5.3; skew-y: 5.3; }
        frame 104 { x: 21.7; y: 64.6; skew-x: 9; skew-y: 9; }
        frame 105 { x: 21.3; y: 61.6; skew-x: 12.6; skew-y: 12.6; }
        frame 106 { x: 21.5; y: 60.4; skew-x: 13.8; skew-y: 13.8; }
        frame 107 { x: 21.7; y: 59.1; skew-x: 15.1; skew-y: 15.1; scale-x: 0.797; scale-y: 0.797; }
        frame 108 { x: 22; y: 57.9; skew-x: 16.5; skew-y: 16.5; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: 22.2; y: 56.6; skew-x: 17.9; skew-y: 17.9; scale-x: 0.798; scale-y: 0.798; }
        frame 110 { x: 21.9; y: 64.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.797; scale-y: 0.797; }
        frame 111 { x: 22; y: 72.7; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 22.1; y: 81.1; skew-x: -10.2; skew-y: -10.2; scale-x: 0.796; scale-y: 0.796; }
        frame 113 { x: 22.5; y: 89.8; skew-x: -19.7; skew-y: -19.7; scale-x: -10000; scale-y: -10000; }
        frame 114 { x: 28.5; y: 92.7; skew-x: -20.9; skew-y: -20.9; scale-x: 0.794; scale-y: 0.794; }
        frame 115 { x: 34.3; y: 95.6; skew-x: -22.2; skew-y: -22.2; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 38.9; y: 96.5; skew-x: -35.8; skew-y: -35.8; }
        frame 117 { x: 44.1; y: 97.4; skew-x: -49.6; skew-y: -49.6; scale-x: 0.796; scale-y: 0.796; }
        frame 118 { x: 47.1; y: 97.8; skew-x: -53; skew-y: -53; scale-x: 0.794; scale-y: 0.794; }
        frame 119 { x: 50.1; y: 98.2; skew-x: -56.5; skew-y: -56.5; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 53.3; y: 98.4; skew-x: -59.8; skew-y: -59.8; scale-x: 0.793; scale-y: 0.793; }
        frame 121 { x: 56.4; y: 98.7; skew-x: -63.3; skew-y: -63.3; scale-x: 0.794; scale-y: 0.794; }
        frame 122 { x: 59.6; y: 98.9; skew-x: -66.8; skew-y: -66.8; scale-x: 0.793; scale-y: 0.793; }
        frame 123 { x: 62.8; y: 99.2; skew-x: -70.1; skew-y: -70.1; scale-x: -10000; scale-y: -10000; }
        frame 124 { x: 66.1; y: 99.4; skew-x: -73.6; skew-y: -73.6; scale-x: 0.794; scale-y: 0.794; }
        frame 125 { x: 69.2; y: 99.7; skew-x: -76.9; skew-y: -76.9; scale-x: -10000; scale-y: -10000; }
        frame 126 { x: 70.5; y: 98.4; skew-x: -10000; skew-y: -10000; }
        frame 127 { x: 71.7; y: 97.1; skew-x: -76.8; skew-y: -76.8; scale-x: 0.793; scale-y: 0.793; }
        frame 128 { x: 73; y: 95.8; skew-x: -76.6; skew-y: -76.6; scale-x: -10000; scale-y: -10000; }
        frame 129 { x: 74.3; y: 94.6; skew-x: -10000; skew-y: -10000; }
        frame 130 { x: 65.9; y: 94.1; skew-x: -65.6; skew-y: -65.6; }
        frame 131 { x: 57.9; y: 93.4; skew-x: -54.3; skew-y: -54.3; }
        frame 132 { x: 50.4; y: 92.7; skew-x: -43; skew-y: -43; }
        frame 133 { x: 43.3; y: 92.2; skew-x: -32; skew-y: -32; scale-x: 0.795; scale-y: 0.795; }
        frame 134 { x: 39.9; y: 91.1; skew-x: -22.4; skew-y: -22.4; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 36.6; y: 90.3; skew-x: -12.9; skew-y: -12.9; scale-x: 0.796; scale-y: 0.796; }
        frame 136 { x: 33.1; y: 86.9; skew-x: -6.2; skew-y: -6.2; scale-x: 0.798; scale-y: 0.798; }
        frame 137 { x: 29.7; y: 83.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 26.7; y: 80.7; skew-x: 1.3; skew-y: 1.3; scale-x: 0.799; scale-y: 0.799; }
        frame 140 { x: 23.8; y: 77.6; skew-x: 2.8; skew-y: 2.8; scale-x: 0.798; scale-y: 0.798; }
        frame 141 { x: 20.8; y: 74.8; skew-x: 4.2; skew-y: 4.2; scale-x: 0.797; scale-y: 0.797; }
        frame 142 { x: 20.2; y: 75.4; skew-x: -0.5; skew-y: -0.5; scale-x: 0.796; scale-y: 0.796; }
        frame 143 { x: 19.6; y: 76.1; skew-x: -5.4; skew-y: -5.4; scale-x: 0.795; scale-y: 0.795; }
        frame 144 { x: 19.2; y: 76.8; skew-x: -10.3; skew-y: -10.3; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 15.8; y: 80.1; skew-x: -18.7; skew-y: -18.7; scale-x: 0.793; scale-y: 0.793; }
        frame 146 { x: 12.6; y: 83.5; skew-x: -27; skew-y: -27; scale-x: 0.792; scale-y: 0.792; }
        frame 147 { x: 9.5; y: 87; skew-x: -35.6; skew-y: -35.6; scale-x: 0.793; scale-y: 0.793; }
        frame 148 { x: 8.6; y: 89.3; skew-x: -52.1; skew-y: -52.1; scale-x: 0.791; scale-y: 0.791; }
        frame 149 { x: 8.8; y: 91.5; skew-x: -68.6; skew-y: -68.6; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 9.9; y: 93.3; skew-x: -85.2; skew-y: -85.2; }
        frame 151 { x: 8.2; y: 94.3; skew-x: -95.2; skew-y: -95.2; scale-x: 0.79; scale-y: 0.79; }
        frame 152 { x: 6.9; y: 94.9; skew-x: -105.2; skew-y: -105.2; scale-x: 0.789; scale-y: 0.789; }
        frame 153 { x: 5.6; y: 95.2; skew-x: -115.3; skew-y: -115.3; scale-x: 0.79; scale-y: 0.79; }
        frame 154 { x: -10000; y: 99.4; skew-x: -115.2; skew-y: -115.2; scale-x: 0.789; scale-y: 0.789; }
        frame 155 { y: 103.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 156 { y: 107.7; skew-x: -115.3; skew-y: -115.3; scale-x: 0.79; scale-y: 0.79; }
        frame 157 { x: 4.6; y: 121.8; skew-x: -115.5; skew-y: -113.2; scale-x: 0.769; scale-y: 0.799; }
        frame 158 { x: 3.8; y: 135.9; skew-x: -115.7; skew-y: -111.1; scale-x: 0.751; scale-y: 0.809; }
        frame 159 { x: 3.7; y: 135.4; skew-x: -114.9; skew-y: -111.7; scale-x: 0.761; scale-y: 0.8; }
        frame 160 { x: -10000; y: 135; skew-x: -114; skew-y: -112.5; scale-x: 0.773; scale-y: 0.792; }
        frame 161 { x: 3.6; y: 134.6; skew-x: -113.3; skew-y: -113.3; scale-x: 0.785; scale-y: 0.785; }
        frame 162 { x: -10000; y: 135; skew-x: -114; skew-y: -112.5; scale-x: 0.773; scale-y: 0.792; }
        frame 163 { y: 135.4; skew-x: -114.9; skew-y: -111.7; scale-x: 0.761; scale-y: 0.8; }
        frame 164 { x: 3.8; y: 135.9; skew-x: -115.7; skew-y: -111.1; scale-x: 0.751; scale-y: 0.809; }
        frame 165 { x: 29.7; y: 83.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 166 { x: 31.3; y: 83.1; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 32.8; y: 82.6; skew-x: -1.9; skew-y: -1.9; scale-x: 0.799; scale-y: 0.799; }
        frame 168 { x: 34.5; y: 82.2; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 34.8; y: 81.3; skew-x: -1.2; skew-y: -1.2; }
        frame 170 { x: 35.1; y: 80.3; skew-x: 0.3; skew-y: 0.3; }
        frame 171 { x: 35.3; y: 79.4; skew-x: 2.3; skew-y: 2.3; }
        frame 172 { x: -10000; y: 78.2; skew-x: 4.3; skew-y: 4.3; }
        frame 173 { y: 77; skew-x: 6.3; skew-y: 6.3; scale-x: 0.798; scale-y: 0.798; }
        frame 174 { x: 35.1; y: 75.8; skew-x: 8.4; skew-y: 8.4; scale-x: 0.799; scale-y: 0.799; }
        frame 175 { x: 34.5; y: 79.9; skew-x: 3.5; skew-y: 3.5; scale-x: 0.798; scale-y: 0.798; }
        frame 176 { x: 33.9; y: 84.1; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 177 { x: 33.3; y: 88.2; skew-x: -6.1; skew-y: -6.1; }
        frame 178 { x: 29; y: 74.5; skew-x: 27.8; skew-y: 27.8; scale-x: 0.796; scale-y: 0.796; }
        frame 179 { x: 25.7; y: 65; skew-x: 61.9; skew-y: 61.9; scale-x: 0.795; scale-y: 0.795; }
        frame 180 { x: 20.7; y: 59.2; skew-x: 96; skew-y: 96; scale-x: 0.796; scale-y: 0.796; }
        frame 181 { x: 22.3; y: 51; skew-x: 120.8; skew-y: 120.8; scale-x: 0.793; scale-y: 0.793; }
        frame 182 { x: 29.7; y: 45.4; skew-x: 145.9; skew-y: 145.9; scale-x: 0.792; scale-y: 0.792; }
        frame 183 { x: 35; y: 39.1; skew-x: 170.9; skew-y: 170.9; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: 37.6; y: 36.1; skew-x: 167; skew-y: 167; scale-x: 0.791; scale-y: 0.791; }
        frame 185 { x: 40.2; y: 33; skew-x: 162.9; skew-y: 162.9; scale-x: 0.79; scale-y: 0.79; }
        frame 186 { x: 42.8; y: 30.1; skew-x: 158.8; skew-y: 158.8; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 38.9; y: 33.6; skew-x: 136.1; skew-y: 136.1; scale-x: 0.788; scale-y: 0.788; }
        frame 188 { x: 33.1; y: 37; skew-x: 113.3; skew-y: 113.3; scale-x: 0.787; scale-y: 0.787; }
        frame 189 { x: 25.8; y: 41; skew-x: 90.7; skew-y: 90.7; scale-x: -10000; scale-y: -10000; }
        frame 190 { x: 15.8; y: 54.9; skew-x: 60.4; skew-y: 60.4; scale-x: 0.79; scale-y: 0.79; }
        frame 191 { x: 22.5; y: 67.7; skew-x: 30.1; skew-y: 30.1; scale-x: 0.794; scale-y: 0.794; }
        frame 192 { x: 29.7; y: 83.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_polevaulter_innerleg_upper";
        frame-count: 193;
        frame 0 { x: 57.5; y: 90.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_INNERLEG_UPPER; }
        frame 1 { x: -10000; y: 91; skew-x: -1; skew-y: -1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 91.2; skew-x: -2.2; skew-y: -2.2; }
        frame 3 { y: 91.4; skew-x: -3.4; skew-y: -3.4; }
        frame 4 { y: 91.7; skew-x: -4.7; skew-y: -4.7; }
        frame 5 { y: 92; skew-x: -5.9; skew-y: -5.9; scale-x: 0.799; scale-y: 0.799; }
        frame 6 { y: 92.1; skew-x: -7.2; skew-y: -7.2; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { y: 91.9; skew-x: -5.9; skew-y: -5.9; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { y: 91.6; skew-x: -4.7; skew-y: -4.7; scale-x: 0.8; scale-y: 0.8; }
        frame 9 { y: 91.3; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 10 { y: 91.1; skew-x: -2.2; skew-y: -2.2; }
        frame 11 { y: 90.9; skew-x: -1; skew-y: -1; }
        frame 12 { y: 90.8; skew-x: 0; skew-y: 0; }
        frame 13 { x: 56.8; y: 88.1; skew-x: 8; skew-y: 8; }
        frame 14 { x: 56.6; y: -10000; skew-x: -2.7; skew-y: -2.7; scale-x: 0.799; scale-y: 0.799; }
        frame 15 { x: 56.8; y: 88.4; skew-x: -13.9; skew-y: -13.9; scale-x: 0.798; scale-y: 0.798; }
        frame 16 { x: 57.1; y: 88.9; skew-x: -25; skew-y: -25; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 59.7; y: 87.4; skew-x: -22.7; skew-y: -22.7; scale-x: 0.797; scale-y: 0.894; }
        frame 18 { x: 62.3; y: 86; skew-x: -20.4; skew-y: -20.4; scale-x: 0.796; scale-y: 0.991; }
        frame 19 { x: 64.9; y: 84.5; skew-x: -18.2; skew-y: -18.2; scale-x: -10000; scale-y: 1.089; }
        frame 20 { x: 65.3; y: 83.1; skew-x: -19.2; skew-y: -19.2; scale-y: 1.088; }
        frame 21 { x: 65.7; y: 81.7; skew-x: -20.2; skew-y: -20.2; scale-x: 0.795; scale-y: 1.087; }
        frame 22 { x: 66; y: 80.4; skew-x: -21.2; skew-y: -21.2; scale-x: 0.796; scale-y: 1.089; }
        frame 23 { x: 65.6; y: 84.1; skew-x: -24.5; skew-y: -24.5; scale-x: 0.795; scale-y: 1.087; }
        frame 24 { x: 65.2; y: 87.9; skew-x: -28; skew-y: -28; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 64.7; y: 91.7; skew-x: -31.4; skew-y: -31.4; scale-x: 0.796; scale-y: 1.088; }
        frame 26 { x: 66.8; y: 92.2; skew-x: -3.4; skew-y: -3.4; scale-x: 0.793; scale-y: 1.084; }
        frame 27 { x: 65.8; y: 94.2; skew-x: 4.3; skew-y: 4.3; scale-x: 0.792; scale-y: 1.083; }
        frame 28 { x: 64.8; y: 96.3; skew-x: 12.2; skew-y: 12.2; scale-x: -10000; scale-y: 1.082; }
        frame 29 { x: 61.8; y: 95.2; skew-x: 9.6; skew-y: 9.6; scale-x: 0.791; scale-y: -10000; }
        frame 30 { x: 58.7; y: 94.2; skew-x: 7.1; skew-y: 7.1; scale-x: -10000; }
        frame 31 { x: 56.1; y: 93.1; skew-x: 4.7; skew-y: 4.7; scale-x: 0.792; }
        frame 32 { x: 55.6; y: 91.8; skew-x: 13.8; skew-y: 13.8; scale-x: 0.791; scale-y: 1.081; }
        frame 33 { x: 55.1; y: 90.8; skew-x: 22.8; skew-y: 22.8; scale-x: 0.79; scale-y: 1.08; }
        frame 34 { x: 54.6; y: 90; skew-x: 32.1; skew-y: 32.1; scale-x: 0.791; scale-y: 1.081; }
        frame 35 { x: 54.5; y: 89.7; skew-x: 37.9; skew-y: 37.9; scale-x: 0.789; scale-y: 1.138; }
        frame 36 { x: 54.6; y: 89.6; skew-x: 43.8; skew-y: 43.8; scale-x: -10000; scale-y: 1.198; }
        frame 37 { x: 54.8; y: 89.7; skew-x: 49.6; skew-y: 49.6; scale-x: 0.79; scale-y: 1.259; }
        frame 38 { x: 54.1; y: 86.7; skew-x: 47.9; skew-y: 47.4; scale-x: 0.788; scale-y: 1.234; }
        frame 39 { x: 53.6; y: 83.9; skew-x: 46.1; skew-y: 45.1; scale-x: -10000; scale-y: 1.211; }
        frame 40 { x: 52.9; y: 80.8; skew-x: 44.3; skew-y: 43; scale-x: 0.789; scale-y: 1.19; }
        frame 41 { x: 53.6; y: 82.6; skew-x: 48.4; skew-y: 47.1; scale-x: 0.786; scale-y: 1.186; }
        frame 42 { x: 54.3; y: 84.4; skew-x: 52.4; skew-y: 51.1; scale-x: 0.785; scale-y: 1.185; }
        frame 43 { x: 55; y: 86.3; skew-x: 56.4; skew-y: 55; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 54.4; y: 86.9; skew-x: 50.6; skew-y: 49.4; scale-x: 0.782; scale-y: 1.096; }
        frame 45 { x: 54; y: 87.7; skew-x: 44.9; skew-y: 43.6; scale-x: 0.781; scale-y: 1.008; }
        frame 46 { x: 53.5; y: 88.5; skew-x: 39.2; skew-y: 37.8; scale-x: 0.78; scale-y: 0.922; }
        frame 47 { x: 54.5; y: 88.1; skew-x: 28.8; skew-y: 27.8; scale-x: 0.786; scale-y: 0.88; }
        frame 48 { x: 55.6; y: 87.8; skew-x: 18.3; skew-y: 17.8; scale-x: 0.792; scale-y: 0.84; }
        frame 49 { x: 56.8; y: 88.1; skew-x: 8; skew-y: 8; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 56.7; y: 86.1; skew-x: 20.8; skew-y: 20.8; scale-x: 0.798; scale-y: 0.798; }
        frame 52 { x: 56.8; y: 84.5; skew-x: 33.6; skew-y: 33.6; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 56.9; y: 83.3; skew-x: 46.2; skew-y: 46.2; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 56.6; y: 82.6; skew-x: 59; skew-y: 59; }
        frame 55 { x: 51.8; y: 81; skew-x: 37.9; skew-y: 37.9; scale-x: 0.795; scale-y: 1.049; }
        frame 56 { x: 45.3; y: 79.8; skew-x: 16.8; skew-y: 16.8; scale-x: 0.794; scale-y: 1.302; }
        frame 57 { x: 37.1; y: 79.9; skew-x: -4.1; skew-y: -4.1; scale-x: -10000; scale-y: 1.556; }
        frame 58 { x: 32; y: 80; skew-x: -13.9; skew-y: -13.9; scale-x: 0.793; scale-y: 1.554; }
        frame 59 { x: 27; y: 80.4; skew-x: -23.7; skew-y: -23.7; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 24.9; y: 79.7; skew-x: -21; skew-y: -21; scale-x: 0.792; scale-y: 1.552; }
        frame 61 { x: 22.8; y: 79; skew-x: -18.5; skew-y: -18.5; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 20.8; y: 78.3; skew-x: -16; skew-y: -15.9; scale-x: 0.793; scale-y: 1.554; }
        frame 63 { x: 23.4; y: 85.7; skew-x: -11.2; skew-y: -11.2; scale-x: 0.789; scale-y: 0.991; }
        frame 64 { x: 21.3; y: 80.3; skew-x: 26.1; skew-y: 26.3; scale-x: 0.787; scale-y: 1.108; }
        frame 65 { x: 5.8; y: 71.9; skew-x: 89.6; skew-y: 89.8; scale-x: -10000; scale-y: 1.226; }
        frame 66 { x: 4.3; y: 68.3; skew-x: 101.3; skew-y: 101.3; scale-y: 1.329; }
        frame 67 { x: 2.3; y: 65.2; skew-x: 112.8; skew-y: 113; scale-y: 1.433; }
        frame 68 { x: -1.2; y: 62.2; skew-x: 124.6; skew-y: 124.7; scale-x: 0.788; scale-y: 1.539; }
        frame 69 { x: -10; y: 59; skew-x: 134.6; skew-y: 134.9; scale-x: 0.786; scale-y: 1.535; }
        frame 70 { x: -19.3; y: 55.6; skew-x: 144.9; skew-y: 144.9; scale-x: 0.785; scale-y: 1.534; }
        frame 71 { x: -28.9; y: 52.1; skew-x: 154.9; skew-y: 155.1; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -36.2; y: 42.5; skew-x: 146.7; skew-y: 146.9; scale-x: 0.784; scale-y: 1.531; }
        frame 73 { x: -43.5; y: 32.8; skew-x: 138.6; skew-y: 138.7; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -51.2; y: 23; skew-x: 130.4; skew-y: 130.5; scale-y: 1.532; }
        frame 75 { x: -53.8; y: 18; skew-x: 115.8; skew-y: 115.8; scale-x: 0.783; scale-y: 1.529; }
        frame 76 { x: -57.3; y: 12.9; skew-x: 101; skew-y: 101.3; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -61.7; y: 7.8; skew-x: 86.7; skew-y: 86.7; scale-x: 0.782; scale-y: 1.528; }
        frame 78 { x: -67.1; y: 3.1; skew-x: 71.9; skew-y: 72.1; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: -78.8; y: 16.6; skew-x: 44.9; skew-y: 45.1; scale-x: 0.78; scale-y: 1.523; }
        frame 80 { x: -91.9; y: 32.9; skew-x: 18; skew-y: 18.1; scale-x: -10000; scale-y: 1.524; }
        frame 81 { x: -94.2; y: 41.5; skew-x: 14.1; skew-y: 14.3; scale-x: 0.779; scale-y: 1.522; }
        frame 82 { x: -96.4; y: 50; skew-x: 10.4; skew-y: 10.6; scale-x: 0.78; scale-y: 1.523; }
        frame 83 { x: -95.3; y: 58.1; skew-x: 8.3; skew-y: 8.3; scale-x: 0.783; scale-y: 1.378; }
        frame 84 { x: -93.9; y: 66.3; skew-x: 6.3; skew-y: 6.3; scale-x: 0.788; scale-y: 1.233; }
        frame 85 { x: -91.7; y: 78.6; skew-x: 3; skew-y: 3; scale-x: 0.794; scale-y: 1.017; }
        frame 86 { x: -89.4; y: 90.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -90; y: 91.2; skew-x: -11.2; skew-y: -11.2; scale-x: 0.799; scale-y: 0.883; }
        frame 88 { x: -90.8; y: 91.9; skew-x: -22.4; skew-y: -22.4; scale-x: -10000; scale-y: 0.966; }
        frame 89 { x: -90.4; y: 91.3; skew-x: -16.7; skew-y: -16.7; scale-y: 0.924; }
        frame 90 { x: -90; y: 91.1; skew-x: -11.2; skew-y: -11.2; scale-y: 0.883; }
        frame 91 { x: -89.7; y: 90.8; skew-x: -5.4; skew-y: -5.4; scale-y: 0.841; }
        frame 92 { x: -89.4; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 93 { x: 59.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 60.7; }
        frame 95 { x: 61.5; }
        frame 96 { x: 62.3; }
        frame 97 { x: 63.1; }
        frame 98 { x: 62.6; y: 90.5; skew-x: -2.7; skew-y: -2.7; }
        frame 99 { x: 62.1; y: -10000; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 100 { x: 61.6; y: 90.2; skew-x: -8.7; skew-y: -8.7; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 61.2; y: 90.1; skew-x: -11.7; skew-y: -11.7; }
        frame 102 { x: 61; y: 89.8; skew-x: -10.4; skew-y: -10.4; scale-y: 0.83; }
        frame 103 { x: 60.9; y: 89.5; skew-x: -9.2; skew-y: -9.2; scale-x: 0.798; scale-y: 0.862; }
        frame 104 { x: 60.6; y: 89.1; skew-x: -8; skew-y: -8; scale-x: -10000; scale-y: 0.893; }
        frame 105 { x: 60.5; y: 88.9; skew-x: -6.9; skew-y: -6.9; scale-y: 0.925; }
        frame 106 { x: 60.3; y: 89; skew-x: -11.7; skew-y: -11.7; scale-x: 0.797; scale-y: 0.958; }
        frame 107 { x: 60; y: 89.3; skew-x: -16.7; skew-y: -16.7; scale-x: -10000; scale-y: 0.992; }
        frame 108 { x: 59.7; y: 89.5; skew-x: -21.5; skew-y: -21.5; scale-x: 0.796; scale-y: 1.025; }
        frame 109 { x: 59.5; y: 90; skew-x: -26.4; skew-y: -26.4; scale-x: 0.797; scale-y: 1.06; }
        frame 110 { x: 59.4; y: 91.6; skew-x: -24.5; skew-y: -24.5; scale-x: 0.796; scale-y: 1.059; }
        frame 111 { x: 59.2; y: 93.1; skew-x: -22.7; skew-y: -22.7; scale-x: -10000; scale-y: 1.058; }
        frame 112 { x: 59.1; y: 94.6; skew-x: -21; skew-y: -21; scale-x: 0.795; scale-y: -10000; }
        frame 113 { x: 58.9; y: 96.2; skew-x: -19.2; skew-y: -19.2; scale-x: 0.796; scale-y: 1.059; }
        frame 114 { x: -10000; y: 93.9; skew-x: -13.9; skew-y: -13.9; scale-x: 0.795; scale-y: 1.058; }
        frame 115 { y: 91.8; skew-x: -8.7; skew-y: -8.7; scale-x: -10000; scale-y: -10000; }
        frame 116 { y: 89.7; skew-x: -3.5; skew-y: -3.5; }
        frame 117 { x: 59.1; y: 87.7; skew-x: 1.5; skew-y: 1.5; scale-y: 1.057; }
        frame 118 { x: 58.5; y: 87.3; skew-x: 6.8; skew-y: 6.8; scale-y: -10000; }
        frame 119 { x: 58.1; y: 87.1; skew-x: 12.3; skew-y: 12.3; scale-x: 0.794; scale-y: 1.056; }
        frame 120 { x: 57.6; y: 86.9; skew-x: 17.8; skew-y: 17.8; scale-x: -10000; scale-y: 1.055; }
        frame 121 { x: 57.1; y: -10000; skew-x: 23.3; skew-y: 23.3; scale-y: 1.056; }
        frame 122 { x: 56.5; y: 87; skew-x: 26.8; skew-y: 26.8; scale-x: 0.793; scale-y: 1.055; }
        frame 123 { x: 56; y: 87.2; skew-x: 30.3; skew-y: 30.3; scale-x: -10000; scale-y: 1.054; }
        frame 124 { x: 55.5; y: 87.4; skew-x: 34.1; skew-y: 34.1; scale-x: 0.792; scale-y: -10000; }
        frame 125 { x: 55; y: 87.6; skew-x: 37.6; skew-y: 37.6; scale-x: 0.793; scale-y: 1.055; }
        frame 126 { x: 54.9; y: 86.9; skew-x: 40.9; skew-y: 40.9; scale-x: 0.792; scale-y: 1.053; }
        frame 127 { x: -10000; y: 86.4; skew-x: 44.4; skew-y: 44.4; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 55; y: 85.8; skew-x: 47.7; skew-y: 47.7; }
        frame 129 { x: -10000; y: 85.3; skew-x: 51.1; skew-y: 51.1; scale-x: 0.793; scale-y: 1.055; }
        frame 130 { x: 54.8; y: 86.4; skew-x: 32.9; skew-y: 32.9; scale-x: 0.791; scale-y: 1.052; }
        frame 131 { x: 54.5; y: 88.6; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 132 { x: 54.4; y: 91.8; skew-x: -3.2; skew-y: -3.2; }
        frame 133 { x: 54.7; y: 95.9; skew-x: -21.4; skew-y: -21.4; }
        frame 134 { x: 56.1; y: 94.5; skew-x: -16; skew-y: -16; scale-x: 0.792; scale-y: 0.988; }
        frame 135 { x: 57.5; y: 93.2; skew-x: -10.7; skew-y: -10.7; scale-x: 0.795; scale-y: 0.925; }
        frame 136 { x: 58.8; y: 91.9; skew-x: -5.2; skew-y: -5.2; scale-x: 0.797; scale-y: 0.863; }
        frame 137 { x: 59.9; y: 90.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 57.4; y: 89.3; skew-x: -0.4; skew-y: -0.4; scale-x: 0.799; scale-y: 0.799; }
        frame 140 { x: 54.9; y: 87.8; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: 52.4; y: 86.2; skew-x: -1.9; skew-y: -1.9; scale-x: 0.798; scale-y: 0.798; }
        frame 142 { x: 50.8; y: 85.8; skew-x: -0.7; skew-y: -0.7; scale-x: 0.797; scale-y: 0.797; }
        frame 143 { x: 49.1; y: 85.4; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 47.7; y: 85.1; skew-x: 1.7; skew-y: 1.7; scale-x: 0.796; scale-y: 0.796; }
        frame 145 { x: 43.6; y: 85.4; skew-x: 3.1; skew-y: 3.1; scale-x: 0.795; scale-y: 0.795; }
        frame 146 { x: 39.6; y: 85.7; skew-x: 4.6; skew-y: 4.6; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 35.5; y: 85.9; skew-x: 6.2; skew-y: 6.2; scale-x: 0.794; scale-y: 0.794; }
        frame 148 { x: 29.8; y: 89.3; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 24.2; y: 93; skew-x: -10.2; skew-y: -10.2; scale-x: 0.793; scale-y: 0.793; }
        frame 150 { x: 18.7; y: 96.7; skew-x: -18.5; skew-y: -18.5; scale-x: -10000; scale-y: -10000; }
        frame 151 { x: 16.6; y: 102.6; skew-x: -30.5; skew-y: -30.5; scale-x: 0.792; scale-y: 0.792; }
        frame 152 { x: 14.9; y: 108.6; skew-x: -42.8; skew-y: -42.8; scale-x: 0.791; scale-y: 0.791; }
        frame 153 { x: 13.6; y: 114.8; skew-x: -54.8; skew-y: -54.8; scale-x: 0.792; scale-y: 0.792; }
        frame 154 { x: -10000; y: 119.9; skew-x: -63.6; skew-y: -63.6; scale-x: 0.79; scale-y: 0.79; }
        frame 155 { x: 13.8; y: 124.8; skew-x: -72.4; skew-y: -72.4; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 14.2; y: 129.9; skew-x: -81.2; skew-y: -81.2; scale-x: 0.791; scale-y: 0.791; }
        frame 157 { x: 14.6; y: 130; skew-x: -80.9; skew-y: -81.8; scale-x: 0.767; scale-y: 0.808; }
        frame 158 { x: 14.9; y: 129.9; skew-x: -80.4; skew-y: -82.2; scale-x: 0.744; scale-y: 0.826; }
        frame 159 { x: 14.7; y: 129.5; skew-x: -80.8; skew-y: -82.1; scale-x: 0.759; scale-y: 0.814; }
        frame 160 { x: 14.5; y: 128.8; skew-x: -81.1; skew-y: -81.6; scale-x: 0.774; scale-y: 0.802; }
        frame 161 { x: 14.3; y: 128.3; skew-x: -81.3; skew-y: -81.3; scale-x: 0.79; scale-y: 0.79; }
        frame 162 { x: 14.5; y: 128.9; skew-x: -81.1; skew-y: -81.6; scale-x: 0.774; scale-y: 0.802; }
        frame 163 { x: 14.7; y: 129.4; skew-x: -80.8; skew-y: -82.1; scale-x: 0.759; scale-y: 0.814; }
        frame 164 { x: 14.9; y: 129.9; skew-x: -80.4; skew-y: -82.2; scale-x: 0.744; scale-y: 0.826; }
        frame 165 { x: 59.9; y: 90.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 166 { x: -10000; y: 90.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 167 { y: 91.1; }
        frame 168 { y: 91.3; }
        frame 169 { x: 60.1; y: -10000; skew-x: -0.7; skew-y: -0.7; }
        frame 170 { x: -10000; y: 91.6; skew-x: -1.7; skew-y: -1.7; }
        frame 171 { x: 60.3; y: 91.7; skew-x: -2.6; skew-y: -2.6; }
        frame 172 { x: -10000; y: 91.8; skew-x: -2.5; skew-y: -2.5; }
        frame 173 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 174 { y: 91.7; skew-x: -2.6; skew-y: -2.6; }
        frame 175 { x: 59.6; y: 90.9; skew-x: -2.5; skew-y: -2.5; }
        frame 176 { x: 59; y: 89.9; skew-x: -10000; skew-y: -10000; }
        frame 177 { x: 58.3; y: 89; skew-x: -2.6; skew-y: -2.6; }
        frame 178 { x: 58.9; y: 89.8; skew-x: -1.7; skew-y: -1.7; }
        frame 179 { x: 59.4; y: 90.5; skew-x: -0.7; skew-y: -0.7; }
        frame 180 { x: 59.9; y: 91.3; skew-x: 0; skew-y: 0; }
        frame 181 { x: 60.1; y: -10000; skew-x: -0.7; skew-y: -0.7; }
        frame 182 { x: -10000; y: 91.6; skew-x: -1.7; skew-y: -1.7; }
        frame 183 { x: 60.3; y: 91.7; skew-x: -2.6; skew-y: -2.6; }
        frame 184 { x: -10000; y: 91.8; skew-x: -2.5; skew-y: -2.5; }
        frame 185 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 186 { y: 91.7; skew-x: -2.6; skew-y: -2.6; }
        frame 187 { x: 59.6; y: 90.9; skew-x: -2.5; skew-y: -2.5; }
        frame 188 { x: 59; y: 89.9; skew-x: -10000; skew-y: -10000; }
        frame 189 { x: 58.3; y: 89; skew-x: -2.6; skew-y: -2.6; }
        frame 190 { x: 58.9; y: 89.6; skew-x: -1.7; skew-y: -1.7; }
        frame 191 { x: 59.4; y: 90.1; skew-x: -0.7; skew-y: -0.7; }
        frame 192 { x: 59.9; y: 90.8; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_polevaulter_innerleg_foot";
        frame-count: 193;
        frame 0 { x: 41.5; y: 115.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_INNERLEG_FOOT; }
        frame 1 { x: 41.8; y: 114.6; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: 0.809; image: none; }
        frame 2 { x: 41.9; y: 114.4; skew-x: 2.5; skew-y: 2.5; scale-y: 0.819; }
        frame 3 { x: 42.1; y: 113.9; skew-x: 3.8; skew-y: 3.8; scale-y: 0.828; }
        frame 4 { x: 42.4; y: 113.6; skew-x: 5.1; skew-y: 5.1; scale-y: 0.837; }
        frame 5 { x: 42.6; y: 113.2; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.847; }
        frame 6 { x: 42.9; y: 112.7; skew-x: 7.8; skew-y: 7.8; scale-x: 0.8; scale-y: 0.856; }
        frame 7 { x: 42.6; y: 113.1; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.847; }
        frame 8 { x: 42.3; y: 113.4; skew-x: 5.1; skew-y: 5.1; scale-x: -10000; scale-y: 0.837; }
        frame 9 { x: 42; y: 113.9; skew-x: 3.8; skew-y: 3.8; scale-x: 0.8; scale-y: 0.828; }
        frame 10 { x: 41.9; y: 114.2; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: 0.819; }
        frame 11 { x: 41.6; y: 114.6; skew-x: 1.3; skew-y: 1.3; scale-y: 0.809; }
        frame 12 { x: 41.5; y: 115.1; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 13 { x: 39.4; y: 116.7; skew-x: -8.4; skew-y: -8.4; scale-x: 0.797; scale-y: 0.797; }
        frame 14 { x: 42; y: 114.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 44.9; y: 113.1; skew-x: 8.8; skew-y: 8.8; }
        frame 16 { x: 48.1; y: 111.5; skew-x: 17.4; skew-y: 17.4; }
        frame 17 { x: 53.4; y: 112.6; skew-x: 14; skew-y: 14; }
        frame 18 { x: 58.6; y: 113.7; skew-x: 10.8; skew-y: 10.8; }
        frame 19 { x: 63.9; y: 114.8; skew-x: 7.5; skew-y: 7.5; }
        frame 20 { x: 66.4; y: 112.7; skew-x: 4.5; skew-y: 4.5; scale-x: 0.796; scale-y: 0.796; }
        frame 21 { x: 68.9; y: 110.6; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 71.5; y: 108.4; skew-x: -1.3; skew-y: -1.3; }
        frame 23 { x: 72.9; y: 112.4; skew-x: -5.7; skew-y: -5.7; scale-x: 0.795; scale-y: 0.795; }
        frame 24 { x: 74.3; y: 116.5; skew-x: -10.4; skew-y: -10.4; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 75.8; y: 120.5; skew-x: -15; skew-y: -15; }
        frame 26 { x: 74.7; y: 123.1; skew-x: -22.2; skew-y: -22.2; scale-x: 0.794; scale-y: 0.794; }
        frame 27 { x: 73.8; y: 125.8; skew-x: -29.5; skew-y: -29.5; scale-x: 0.793; scale-y: 0.793; }
        frame 28 { x: 73; y: 128.4; skew-x: -36.8; skew-y: -36.8; scale-x: 0.794; scale-y: 0.794; }
        frame 29 { x: 68.3; y: 128.2; skew-x: -36; skew-y: -36; scale-x: 0.792; scale-y: 0.792; }
        frame 30 { x: 63.5; y: 128.1; skew-x: -35.5; skew-y: -35.5; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 58.8; y: 128; skew-x: -34.8; skew-y: -34.8; }
        frame 32 { x: 55.5; y: -10000; skew-x: -34.7; skew-y: -34.7; scale-x: 0.791; scale-y: 0.791; }
        frame 33 { x: 52.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 49; skew-x: -34.8; skew-y: -34.8; scale-x: 0.792; scale-y: 0.792; }
        frame 35 { x: 46.6; y: 127.9; skew-x: -36.7; skew-y: -36.7; scale-x: 0.791; scale-y: 0.791; }
        frame 36 { x: 44.4; y: -10000; skew-x: -38.8; skew-y: -38.8; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 42; y: 127.7; skew-x: -40.8; skew-y: -40.8; scale-x: 0.792; scale-y: 0.792; }
        frame 38 { x: 36.2; y: 121; skew-x: -25.5; skew-y: -25.5; scale-x: 0.79; scale-y: 0.79; }
        frame 39 { x: 31.3; y: 114.3; skew-x: -10.2; skew-y: -10.2; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 27.3; y: 108; skew-x: 4.8; skew-y: 4.8; }
        frame 41 { x: 26.7; y: 108.9; skew-x: 9.1; skew-y: 9.1; scale-x: 0.789; scale-y: 0.789; }
        frame 42 { x: 26.1; y: 109.8; skew-x: 13.5; skew-y: 13.5; scale-x: 0.788; scale-y: 0.788; }
        frame 43 { x: 25.8; y: 110.9; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 30.2; y: 112.6; skew-x: 12.3; skew-y: 12.3; scale-x: 0.787; scale-y: 0.787; }
        frame 45 { x: 34.8; y: 114.5; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 39.4; y: 116.6; skew-x: 0.7; skew-y: 0.7; }
        frame 47 { x: 39.3; y: -10000; skew-x: -2.2; skew-y: -2.2; scale-x: 0.79; scale-y: 0.79; }
        frame 48 { x: 39.4; skew-x: -5.2; skew-y: -5.2; scale-x: 0.793; scale-y: 0.793; }
        frame 49 { x: -10000; y: 116.7; skew-x: -8.4; skew-y: -8.4; scale-x: 0.797; scale-y: 0.797; }
        frame 50 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 40.1; y: 116.3; skew-x: -12.9; skew-y: -12.9; scale-x: 0.796; scale-y: 0.796; }
        frame 52 { x: 40.7; y: 115.9; skew-x: -17.5; skew-y: -17.5; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 41.5; y: 115.6; skew-x: -22.2; skew-y: -22.2; scale-x: 0.795; scale-y: 0.795; }
        frame 54 { x: 42.4; y: 115.2; skew-x: -26.9; skew-y: -26.9; scale-x: 0.796; scale-y: 0.796; }
        frame 55 { x: 35.6; y: 115.6; skew-x: -21.9; skew-y: -21.9; scale-x: 0.795; scale-y: 0.795; }
        frame 56 { x: 28.9; y: 116.1; skew-x: -17; skew-y: -17; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 22.2; y: 116.5; skew-x: -12.1; skew-y: -12.1; }
        frame 58 { x: -10000; y: -10000; skew-x: -12; skew-y: -12; }
        frame 59 { skew-x: -12.1; skew-y: -12.1; }
        frame 60 { skew-x: -12; skew-y: -12; }
        frame 61 { skew-x: -10000; skew-y: -10000; }
        frame 62 { skew-x: -12.1; skew-y: -12.1; }
        frame 63 { x: 22.1; y: 115.5; skew-x: -9.7; skew-y: -9.7; scale-x: 0.792; scale-y: 0.792; }
        frame 64 { x: -1.3; y: 106.9; skew-x: 12.5; skew-y: 12.8; scale-x: 0.79; scale-y: 0.789; }
        frame 65 { x: -26.2; y: 64.6; skew-x: 78.5; skew-y: 78.7; scale-x: 0.791; scale-y: 0.79; }
        frame 66 { x: -23.7; y: 52; skew-x: 93; skew-y: 93; scale-x: -10000; scale-y: 0.789; }
        frame 67 { x: -21.8; y: 40.2; skew-x: 107.5; skew-y: 107.6; scale-y: 0.788; }
        frame 68 { x: -20.3; y: 28.7; skew-x: 122; skew-y: 122.1; scale-x: 0.792; scale-y: 0.789; }
        frame 69 { x: -26.4; y: 21.5; skew-x: 127.6; skew-y: 127.6; scale-x: 0.79; scale-y: 0.787; }
        frame 70 { x: -32.7; y: 14.5; skew-x: 133.1; skew-y: 133.4; scale-x: 0.789; scale-y: 0.786; }
        frame 71 { x: -39; y: 7.4; skew-x: 138.8; skew-y: 139; scale-x: 0.79; scale-y: 0.787; }
        frame 72 { x: -52.1; y: 0.3; skew-x: 130.6; skew-y: 130.8; scale-x: 0.788; scale-y: 0.785; }
        frame 73 { x: -65.5; y: -6.5; skew-x: 122.4; skew-y: 122.6; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -79; y: -13.3; skew-x: 114.3; skew-y: 114.4; scale-x: 0.789; scale-y: 0.786; }
        frame 75 { x: -87.1; y: -9.9; skew-x: 89.5; skew-y: 89.5; scale-x: 0.787; scale-y: 0.785; }
        frame 76 { x: -96.5; y: -4.2; skew-x: 64.4; skew-y: 64.5; scale-x: 0.785; scale-y: 0.783; }
        frame 77 { x: -106; y: 3.8; skew-x: 39.4; skew-y: 39.6; scale-x: 0.784; scale-y: 0.781; }
        frame 78 { x: -114.6; y: 14.4; skew-x: 14.4; skew-y: 14.6; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: -114.1; y: 45.6; skew-x: -12.4; skew-y: -12.2; scale-x: 0.783; scale-y: 0.78; }
        frame 80 { x: -110.7; y: 77.8; skew-x: -39.4; skew-y: -39.3; scale-x: 0.782; scale-y: -10000; }
        frame 81 { x: -110; y: 87.5; skew-x: -43.2; skew-y: -43; scale-x: 0.781; scale-y: 0.778; }
        frame 82 { x: -109.2; y: 97; skew-x: -46.9; skew-y: -46.8; scale-x: 0.782; scale-y: 0.779; }
        frame 83 { x: -10000; y: 100.6; skew-x: -37.5; skew-y: -37.3; scale-x: 0.784; scale-y: 0.782; }
        frame 84 { x: -108.9; y: 104.2; skew-x: -28; skew-y: -28; scale-x: 0.788; scale-y: 0.786; }
        frame 85 { x: -107.6; y: 109.6; skew-x: -13.9; skew-y: -13.9; scale-x: 0.793; scale-y: 0.793; }
        frame 86 { x: -105.3; y: 115.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -104.7; y: 113.5; skew-x: 6.3; skew-y: 6.3; scale-x: 0.799; scale-y: 0.799; }
        frame 88 { x: -103.8; y: 111.9; skew-x: 12.6; skew-y: 12.6; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -104.3; y: 112.7; skew-x: 9.3; skew-y: 9.3; }
        frame 90 { x: -104.6; y: 113.5; skew-x: 6.3; skew-y: 6.3; }
        frame 91 { x: -105.1; y: 114.2; skew-x: 3; skew-y: 3; scale-x: 0.8; scale-y: 0.8; }
        frame 92 { x: -105.3; y: 115.1; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 44; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 94 { x: 44.8; }
        frame 95 { x: 45.6; }
        frame 96 { x: 46.3; }
        frame 97 { x: 47.1; }
        frame 98 { x: 49.1; }
        frame 99 { x: 51.1; }
        frame 100 { x: 53.1; }
        frame 101 { x: 55.1; }
        frame 102 { x: 57.6; y: 114.9; skew-x: 0.6; skew-y: 0.6; }
        frame 103 { x: 60.1; y: 114.7; skew-x: 1.3; skew-y: 1.3; }
        frame 104 { x: 62.6; y: 114.5; skew-x: 2; skew-y: 2; scale-x: 0.799; scale-y: 0.799; }
        frame 105 { x: 65.1; y: 114.2; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 66.3; y: 114.9; skew-x: 0; skew-y: 0; }
        frame 107 { x: 67.6; y: 115.5; skew-x: -2.4; skew-y: -2.4; }
        frame 108 { x: 68.8; y: 116.1; skew-x: -5.2; skew-y: -5.2; }
        frame 109 { x: 70.1; y: 116.8; skew-x: -8.1; skew-y: -8.1; }
        frame 110 { x: 70.7; y: -10000; skew-x: -7.4; skew-y: -7.4; scale-x: 0.798; scale-y: 0.798; }
        frame 111 { x: 71.4; y: 116.9; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 72; y: 117; skew-x: -6.2; skew-y: -6.2; }
        frame 113 { x: 72.6; y: 117.1; skew-x: -5.6; skew-y: -5.6; }
        frame 114 { x: 70.8; y: 117.4; skew-x: -7.9; skew-y: -7.9; scale-x: 0.797; scale-y: 0.797; }
        frame 115 { x: 69; y: 117.9; skew-x: -10.2; skew-y: -10.2; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 67.2; y: 118.2; skew-x: -12.5; skew-y: -12.5; }
        frame 117 { x: 65.4; y: 118.7; skew-x: -15; skew-y: -15; }
        frame 118 { x: 63.6; y: -10000; skew-x: -16.7; skew-y: -16.7; scale-x: 0.796; scale-y: 0.796; }
        frame 119 { x: 61.8; skew-x: -18.5; skew-y: -18.5; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 59.9; y: 118.8; skew-x: -20.2; skew-y: -20.2; }
        frame 121 { x: 58.1; y: -10000; skew-x: -22.2; skew-y: -22.2; scale-x: 0.797; scale-y: 0.797; }
        frame 122 { x: 54.9; y: 119; skew-x: -22.7; skew-y: -22.7; scale-x: 0.796; scale-y: 0.796; }
        frame 123 { x: 51.7; y: 119.2; skew-x: -23.5; skew-y: -23.5; scale-x: -10000; scale-y: -10000; }
        frame 124 { x: 48.4; y: 119.4; skew-x: -24.2; skew-y: -24.2; scale-x: 0.795; scale-y: 0.795; }
        frame 125 { x: 45.1; y: 119.7; skew-x: -24.9; skew-y: -24.9; scale-x: 0.796; scale-y: 0.796; }
        frame 126 { x: 41.9; y: 117.9; skew-x: -17.2; skew-y: -17.2; scale-x: 0.795; scale-y: 0.795; }
        frame 127 { x: 38.6; y: 116.1; skew-x: -9.4; skew-y: -9.4; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 35.6; y: 114.4; skew-x: -1.7; skew-y: -1.7; }
        frame 129 { x: 33; y: 112.9; skew-x: 5.8; skew-y: 5.8; }
        frame 130 { x: 35.7; y: 113.4; skew-x: -10000; skew-y: -10000; }
        frame 131 { x: 38.5; y: 113.9; }
        frame 132 { x: 41.1; y: 114.4; }
        frame 133 { x: 43.9; y: 114.9; }
        frame 134 { x: -10000; y: -10000; skew-x: 4.3; skew-y: 4.3; scale-x: 0.796; scale-y: 0.796; }
        frame 135 { y: 115.1; skew-x: 2.8; skew-y: 2.8; scale-x: 0.797; scale-y: 0.797; }
        frame 136 { y: 115.2; skew-x: 1.3; skew-y: 1.3; scale-x: 0.799; scale-y: 0.799; }
        frame 137 { x: 44; y: 115.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 43.6; y: 115.7; skew-x: -3.9; skew-y: -3.9; }
        frame 143 { x: 43.4; y: 116.3; skew-x: -7.9; skew-y: -7.9; scale-x: 0.799; scale-y: 0.799; }
        frame 144 { x: 43; y: 117; skew-x: -12; skew-y: -12; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 42.7; y: 117.4; skew-x: -21; skew-y: -21; scale-x: 0.798; scale-y: 0.798; }
        frame 146 { x: 42.9; y: 117.9; skew-x: -30.2; skew-y: -30.2; scale-x: 0.797; scale-y: 0.797; }
        frame 147 { x: 43.2; y: 118.5; skew-x: -39.3; skew-y: -39.3; scale-x: 0.798; scale-y: 0.798; }
        frame 148 { x: 42.4; y: 118.8; skew-x: -56.3; skew-y: -56.3; scale-x: 0.796; scale-y: 0.796; }
        frame 149 { x: 42.8; y: 118.6; skew-x: -73.6; skew-y: -73.6; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 44; y: 117.6; skew-x: -90.5; skew-y: -90.5; }
        frame 151 { x: 44.6; y: 117.9; skew-x: -102.5; skew-y: -102.5; scale-x: 0.795; scale-y: 0.795; }
        frame 152 { x: 45.5; y: 117.5; skew-x: -114.7; skew-y: -114.7; scale-x: 0.794; scale-y: 0.794; }
        frame 153 { x: 46.3; y: 116.6; skew-x: -126.9; skew-y: -126.9; scale-x: 0.795; scale-y: 0.795; }
        frame 154 { x: -10000; y: 123.7; skew-x: -118.2; skew-y: -118.2; scale-x: 0.793; scale-y: 0.793; }
        frame 155 { y: 130.5; skew-x: -109.7; skew-y: -109.7; scale-x: -10000; scale-y: -10000; }
        frame 156 { y: 136.9; skew-x: -101.1; skew-y: -101.1; }
        frame 157 { x: 47.3; y: 136.7; skew-x: -101.5; skew-y: -100.4; scale-x: 0.77; scale-y: 0.81; }
        frame 158 { x: 48.5; y: 136.5; skew-x: -102.2; skew-y: -99.8; scale-x: 0.747; scale-y: 0.828; }
        frame 159 { x: 47.7; y: 136.1; skew-x: -101.7; skew-y: -100.2; scale-x: 0.762; scale-y: 0.816; }
        frame 160 { x: 46.9; y: 135.7; skew-x: -101.2; skew-y: -100.5; scale-x: 0.777; scale-y: 0.804; }
        frame 161 { x: 46.3; y: 135.3; skew-x: -101; skew-y: -101; scale-x: 0.793; scale-y: 0.793; }
        frame 162 { x: 46.9; y: 135.7; skew-x: -101.2; skew-y: -100.5; scale-x: 0.777; scale-y: 0.804; }
        frame 163 { x: 47.7; y: 136; skew-x: -101.7; skew-y: -100.2; scale-x: 0.762; scale-y: 0.816; }
        frame 164 { x: 48.5; y: 136.5; skew-x: -102.2; skew-y: -99.8; scale-x: 0.747; scale-y: 0.828; }
        frame 165 { x: 44; y: 115.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 166 { y: 115; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 44.1; y: 114.9; skew-x: 0.8; skew-y: 0.8; }
        frame 168 { x: -10000; y: 114.8; skew-x: 1.3; skew-y: 1.3; }
        frame 169 { x: 44.3; y: 114.6; skew-x: 2; skew-y: 2; }
        frame 170 { x: 44.4; y: 114.5; skew-x: 2.8; skew-y: 2.8; }
        frame 171 { x: 44.7; y: 114.3; skew-x: 3.8; skew-y: 3.8; }
        frame 172 { x: 44.6; y: 114.4; skew-x: -10000; skew-y: -10000; }
        frame 173 { x: -10000; y: -10000; }
        frame 174 { x: 44.7; y: 114.3; }
        frame 175 { x: 44.6; y: 114.4; }
        frame 176 { x: -10000; y: -10000; }
        frame 177 { x: 44.7; y: 114.3; }
        frame 178 { x: 44.5; y: 114.5; skew-x: 2.8; skew-y: 2.8; }
        frame 179 { x: 44.3; y: 114.7; skew-x: 2; skew-y: 2; }
        frame 180 { x: 44.1; y: 114.8; skew-x: 1.3; skew-y: 1.3; }
        frame 181 { x: 44.3; y: 114.6; skew-x: 2; skew-y: 2; }
        frame 182 { x: 44.4; y: 114.5; skew-x: 2.8; skew-y: 2.8; }
        frame 183 { x: 44.7; y: 114.3; skew-x: 3.8; skew-y: 3.8; }
        frame 184 { x: 44.6; y: 114.4; skew-x: -10000; skew-y: -10000; }
        frame 185 { x: -10000; y: -10000; }
        frame 186 { x: 44.7; y: 114.3; }
        frame 187 { x: 44.6; y: 114.4; }
        frame 188 { x: -10000; y: -10000; }
        frame 189 { x: 44.7; y: 114.3; }
        frame 190 { x: 44.4; y: 114.6; skew-x: 2.5; skew-y: 2.5; }
        frame 191 { x: 44.1; y: 114.9; skew-x: 1.3; skew-y: 1.3; }
        frame 192 { x: 44; y: 115.1; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_polevaulter_innerleg_toe";
        frame-count: 193;
        frame 0 { x: 48.9; y: 117.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_INNERLEG_TOE; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 13 { x: 48.3; skew-x: -1.2; skew-y: -1.2; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 50.3; y: 117.2; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 52.4; y: 117.1; skew-x: 0.1; skew-y: 0.1; }
        frame 16 { x: 54.5; y: 116.9; skew-x: 1; skew-y: 1; }
        frame 17 { x: 59.9; y: 118; skew-x: -6.2; skew-y: -6.2; }
        frame 18 { x: 65.5; y: 119.2; skew-x: -13.7; skew-y: -13.7; scale-x: 0.798; scale-y: 0.798; }
        frame 19 { x: 71.3; y: 120.5; skew-x: -21.1; skew-y: -21.1; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 73.5; y: 117.9; skew-x: -22.9; skew-y: -22.9; scale-x: 0.797; scale-y: 0.797; }
        frame 21 { x: 75.8; y: 115.3; skew-x: -24.7; skew-y: -24.7; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 77.9; y: 112.8; skew-x: -26.7; skew-y: -26.7; scale-x: 0.798; scale-y: 0.798; }
        frame 23 { x: 79.7; y: 116.3; skew-x: -31.2; skew-y: -31.2; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: 81.3; y: 119.7; skew-x: -36; skew-y: -36; scale-x: 0.796; scale-y: 0.796; }
        frame 25 { x: 83; y: 123.2; skew-x: -40.5; skew-y: -40.5; scale-x: 0.797; scale-y: 0.797; }
        frame 26 { x: 82.1; y: 124.9; skew-x: -47.8; skew-y: -47.8; scale-x: 0.796; scale-y: 0.796; }
        frame 27 { x: 81.4; y: 126.6; skew-x: -55.1; skew-y: -55.1; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 80.7; y: 128.2; skew-x: -62.3; skew-y: -62.3; }
        frame 29 { x: 75.6; y: 128.7; skew-x: -64.1; skew-y: -64.1; scale-x: 0.795; scale-y: 0.795; }
        frame 30 { x: 70.6; y: 129.2; skew-x: -66.1; skew-y: -66.1; scale-x: 0.794; scale-y: 0.794; }
        frame 31 { x: 65.4; y: 129.7; skew-x: -67.8; skew-y: -67.8; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 62.1; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.793; scale-y: 0.793; }
        frame 33 { x: 58.9; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 55.6; scale-x: 0.794; scale-y: 0.794; }
        frame 35 { x: 53.5; y: 129.4; skew-x: -69.3; skew-y: -69.3; scale-x: 0.793; scale-y: 0.793; }
        frame 36 { x: 51.3; y: 129; skew-x: -70.6; skew-y: -70.6; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 49.1; y: 128.6; skew-x: -72; skew-y: -72; scale-x: 0.794; scale-y: 0.794; }
        frame 38 { x: 41.6; y: 123; skew-x: -44.3; skew-y: -44.3; scale-x: 0.792; scale-y: 0.792; }
        frame 39 { x: 37.3; y: 116.5; skew-x: -16.2; skew-y: -16.2; scale-x: 0.791; scale-y: 0.791; }
        frame 40 { x: 36.1; y: 110.9; skew-x: 11.3; skew-y: 11.3; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 35.3; y: 112.6; skew-x: 15.1; skew-y: 15.1; scale-x: 0.789; scale-y: 0.789; }
        frame 42 { x: 34.4; y: 114.2; skew-x: 18.8; skew-y: 18.8; scale-x: 0.788; scale-y: 0.788; }
        frame 43 { x: 33.6; y: 115.9; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 38.3; y: 116.5; skew-x: 14.3; skew-y: 14.3; }
        frame 45 { x: 43.1; y: 117.5; skew-x: 6; skew-y: 6; }
        frame 46 { x: 48.3; y: 118.4; skew-x: -2.1; skew-y: -2.1; scale-x: 0.789; scale-y: 0.789; }
        frame 47 { x: 48.4; y: 118; skew-x: -1.7; skew-y: -1.7; scale-x: 0.792; scale-y: 0.792; }
        frame 48 { x: -10000; y: 117.6; skew-x: -1.4; skew-y: -1.4; scale-x: 0.796; scale-y: 0.796; }
        frame 49 { x: 48.3; y: 117.3; skew-x: -1.2; skew-y: -1.2; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 48.8; y: 116.2; skew-x: -5.7; skew-y: -5.7; }
        frame 52 { x: 49.5; y: 115.1; skew-x: -10.4; skew-y: -10.4; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: 50.2; y: 114; skew-x: -15; skew-y: -15; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 51; y: 112.9; skew-x: -19.7; skew-y: -19.7; }
        frame 55 { x: 44.3; y: 114.1; skew-x: -14.7; skew-y: -14.7; }
        frame 56 { x: 37.6; y: 115.3; skew-x: -9.7; skew-y: -9.7; }
        frame 57 { x: 31.1; y: 116.5; skew-x: -4.9; skew-y: -4.9; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 63 { x: 29.5; y: 117.4; skew-x: -24.1; skew-y: -24.1; scale-x: 0.794; scale-y: 0.793; }
        frame 64 { x: 5.4; y: 110.3; skew-x: 0.5; skew-y: 0.5; scale-x: 0.792; scale-y: 0.791; }
        frame 65 { x: -25.7; y: 69.4; skew-x: 85.8; skew-y: 85.8; scale-x: 0.794; scale-y: 0.792; }
        frame 66 { x: -25.4; y: 57.3; skew-x: 100.1; skew-y: 100.3; scale-x: 0.793; scale-y: -10000; }
        frame 67 { x: -25.6; y: 46; skew-x: 114.6; skew-y: 114.8; scale-x: -10000; scale-y: 0.791; }
        frame 68 { x: -26.4; y: 35.1; skew-x: 129.1; skew-y: 129.3; scale-x: 0.794; scale-y: 0.792; }
        frame 69 { x: -33.1; y: 27.4; skew-x: 134.8; skew-y: 134.9; scale-x: 0.792; scale-y: 0.79; }
        frame 70 { x: -39.8; y: 19.6; skew-x: 140.4; skew-y: 140.6; scale-x: 0.791; scale-y: 0.789; }
        frame 71 { x: -46.7; y: 11.8; skew-x: 146; skew-y: 146.1; scale-x: 0.792; scale-y: -10000; }
        frame 72 { x: -58.9; y: 5.8; skew-x: 137.9; skew-y: 137.9; scale-x: 0.79; scale-y: 0.788; }
        frame 73 { x: -71.5; y: -0.2; skew-x: 129.6; skew-y: 129.8; scale-x: -10000; scale-y: 0.787; }
        frame 74 { x: -84.1; y: -6; skew-x: 121.4; skew-y: 121.6; scale-x: 0.791; scale-y: 0.788; }
        frame 75 { x: -88.5; y: -3.4; skew-x: 96.3; skew-y: 96.5; scale-x: 0.789; scale-y: 0.787; }
        frame 76 { x: -94.3; y: 1.2; skew-x: 71.7; skew-y: 71.7; scale-x: 0.788; scale-y: 0.786; }
        frame 77 { x: -100.8; y: 8.4; skew-x: 46.6; skew-y: 46.7; scale-x: 0.786; scale-y: 0.784; }
        frame 78 { x: -106.7; y: 18.3; skew-x: 21.6; skew-y: 21.7; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: -106.2; y: 45.4; skew-x: -5.2; skew-y: -5; scale-x: 0.785; scale-y: 0.783; }
        frame 80 { x: -102.9; y: 73.7; skew-x: -32.2; skew-y: -32.1; scale-x: -10000; scale-y: 0.782; }
        frame 81 { x: -102.4; y: 82.9; skew-x: -36; skew-y: -35.8; scale-x: 0.783; scale-y: 0.781; }
        frame 82 { x: -102; y: 91.9; skew-x: -39.8; skew-y: -39.6; scale-x: 0.784; scale-y: 0.782; }
        frame 83 { x: -101.6; y: 96.9; skew-x: -31.7; skew-y: -31.7; scale-x: 0.786; scale-y: 0.784; }
        frame 84 { x: -101.1; y: 101.9; skew-x: -23.7; skew-y: -23.7; scale-x: 0.79; scale-y: 0.788; }
        frame 85 { x: -99.7; y: 109.5; skew-x: -11.7; skew-y: -11.7; scale-x: 0.794; scale-y: 0.794; }
        frame 86 { x: -97.9; y: 117.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 51.4; }
        frame 94 { x: 52.1; }
        frame 95 { x: 53; }
        frame 96 { x: 53.7; }
        frame 97 { x: 54.5; }
        frame 98 { x: 56.5; }
        frame 99 { x: 58.6; }
        frame 100 { x: 60.6; }
        frame 101 { x: 62.6; }
        frame 102 { x: 64.8; y: 117.6; skew-x: -3.2; skew-y: -3.2; }
        frame 103 { x: 67.1; y: 118; skew-x: -6.7; skew-y: -6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 104 { x: 69.4; y: 118.4; skew-x: -10.2; skew-y: -10.2; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 71.7; y: 118.8; skew-x: -13.7; skew-y: -13.7; }
        frame 106 { x: 73.2; y: 119.2; skew-x: -16.4; skew-y: -16.4; }
        frame 107 { x: 74.5; y: 119.4; skew-x: -19.2; skew-y: -19.2; scale-x: 0.798; scale-y: 0.798; }
        frame 108 { x: 76.1; y: 119.7; skew-x: -21.9; skew-y: -21.9; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: 77.6; y: 120; skew-x: -24.7; skew-y: -24.7; scale-x: 0.799; scale-y: 0.799; }
        frame 110 { x: 78.2; y: 121.2; skew-x: -32.5; skew-y: -32.5; scale-x: 0.797; scale-y: 0.797; }
        frame 111 { x: 79.1; y: 122.5; skew-x: -40; skew-y: -40; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 80.3; y: 123.7; skew-x: -47.8; skew-y: -47.8; }
        frame 113 { x: 81.7; y: 124.8; skew-x: -55.5; skew-y: -55.5; scale-x: 0.798; scale-y: 0.798; }
        frame 114 { x: 80.2; y: -10000; skew-x: -57.8; skew-y: -57.8; scale-x: 0.796; scale-y: 0.796; }
        frame 115 { x: 78.7; y: 124.9; skew-x: -60.3; skew-y: -60.3; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 77.1; y: 124.8; skew-x: -62.6; skew-y: -62.6; }
        frame 117 { x: 75.6; y: -10000; skew-x: -64.9; skew-y: -64.9; scale-x: 0.797; scale-y: 0.797; }
        frame 118 { x: 74; y: 124.6; skew-x: -66.8; skew-y: -66.8; scale-x: 0.796; scale-y: 0.796; }
        frame 119 { x: 72.3; y: 124.3; skew-x: -68.6; skew-y: -68.6; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 70.6; y: 124; skew-x: -70.4; skew-y: -70.4; }
        frame 121 { x: 69; y: 123.6; skew-x: -72.1; skew-y: -72.1; scale-x: 0.797; scale-y: 0.797; }
        frame 122 { x: 65.8; y: 123.7; skew-x: -72.9; skew-y: -72.9; scale-x: 0.796; scale-y: 0.796; }
        frame 123 { x: 62.6; y: 123.8; skew-x: -73.6; skew-y: -73.6; scale-x: -10000; scale-y: -10000; }
        frame 124 { x: 59.4; y: 123.9; skew-x: -74.3; skew-y: -74.3; }
        frame 125 { x: 56.1; y: 124; skew-x: -74.8; skew-y: -74.8; }
        frame 126 { x: 51.2; y: 123.3; skew-x: -62.8; skew-y: -62.8; scale-x: 0.795; scale-y: 0.795; }
        frame 127 { x: 46.9; y: 122.2; skew-x: -50.5; skew-y: -50.5; scale-x: 0.794; scale-y: 0.794; }
        frame 128 { x: 43; y: 120.8; skew-x: -38.3; skew-y: -38.3; scale-x: 0.793; scale-y: 0.793; }
        frame 129 { x: 39.9; y: 119.4; skew-x: -26.2; skew-y: -26.2; scale-x: 0.794; scale-y: 0.794; }
        frame 130 { x: 42.6; y: 119.2; skew-x: -20.7; skew-y: -20.7; scale-x: 0.793; scale-y: 0.793; }
        frame 131 { x: 45.6; y: 119; skew-x: -15.2; skew-y: -15.2; scale-x: -10000; scale-y: -10000; }
        frame 132 { x: 48.6; y: 118.8; skew-x: -9.9; skew-y: -9.9; }
        frame 133 { x: 51.8; y: -10000; skew-x: -4.6; skew-y: -4.6; }
        frame 134 { x: 51.7; y: 118.4; skew-x: -3.4; skew-y: -3.4; scale-x: 0.794; scale-y: 0.794; }
        frame 135 { x: 51.6; y: 118.1; skew-x: -2.2; skew-y: -2.2; scale-x: 0.796; scale-y: 0.796; }
        frame 136 { x: -10000; y: 117.8; skew-x: -0.9; skew-y: -0.9; scale-x: 0.798; scale-y: 0.798; }
        frame 137 { x: 51.4; y: 117.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 51; skew-x: -4.9; skew-y: -4.9; }
        frame 143 { x: 50.7; y: 117.2; skew-x: -10.2; skew-y: -10.2; scale-x: 0.799; scale-y: 0.799; }
        frame 144 { x: 50.5; y: 117.3; skew-x: -15.3; skew-y: -15.3; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 50; y: 116.6; skew-x: -24.2; skew-y: -24.2; scale-x: 0.798; scale-y: 0.798; }
        frame 146 { x: 49.8; y: 116; skew-x: -33.5; skew-y: -33.5; scale-x: 0.797; scale-y: 0.797; }
        frame 147 { x: 50; y: 115.3; skew-x: -42.6; skew-y: -42.6; scale-x: 0.798; scale-y: 0.798; }
        frame 148 { x: 47.6; y: 114.4; skew-x: -59.8; skew-y: -59.8; scale-x: 0.796; scale-y: 0.796; }
        frame 149 { x: 46.3; y: 112.8; skew-x: -76.9; skew-y: -76.9; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 45.7; y: 110.4; skew-x: -93.8; skew-y: -93.8; }
        frame 151 { x: 44.8; y: 110.9; skew-x: -105.9; skew-y: -105.9; scale-x: 0.795; scale-y: 0.795; }
        frame 152 { x: 44.1; y: 110.5; skew-x: -118; skew-y: -118; scale-x: 0.794; scale-y: 0.794; }
        frame 153 { x: 43.4; y: 109.8; skew-x: -130.2; skew-y: -130.2; scale-x: -10000; scale-y: -10000; }
        frame 154 { x: 44.4; y: 116.7; skew-x: -121.5; skew-y: -121.5; scale-x: 0.793; scale-y: 0.793; }
        frame 155 { x: 45.5; y: 123.3; skew-x: -112.9; skew-y: -112.9; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 46.6; y: 129.5; skew-x: -104.4; skew-y: -104.4; }
        frame 157 { x: 47.8; y: -10000; skew-x: -105; skew-y: -103.5; scale-x: 0.771; scale-y: 0.809; }
        frame 158 { x: 48.8; y: 129.6; skew-x: -105.8; skew-y: -102.8; scale-x: 0.749; scale-y: 0.825; }
        frame 159 { x: 48; y: 129; skew-x: -105.2; skew-y: -103.2; scale-x: 0.763; scale-y: 0.814; }
        frame 160 { x: 47.2; y: 128.4; skew-x: -104.7; skew-y: -103.7; scale-x: 0.777; scale-y: 0.803; }
        frame 161 { x: 46.6; y: 127.9; skew-x: -104.2; skew-y: -104.2; scale-x: 0.793; scale-y: 0.793; }
        frame 162 { x: 47.3; y: 128.4; skew-x: -104.7; skew-y: -103.7; scale-x: 0.777; scale-y: 0.803; }
        frame 163 { x: 48.1; y: 129; skew-x: -105.2; skew-y: -103.2; scale-x: 0.763; scale-y: 0.814; }
        frame 164 { x: 48.8; y: 129.6; skew-x: -105.8; skew-y: -102.8; scale-x: 0.749; scale-y: 0.825; }
        frame 165 { x: 51.4; y: 117.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 166 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_polevaulter_innerleg_lower";
        frame-count: 193;
        frame 0 { x: 46.6; y: 96.7; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_INNERLEG_LOWER; }
        frame 1 { x: 47.1; y: 96.6; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 47.6; y: 96.4; skew-x: 1.5; skew-y: 1.5; }
        frame 3 { x: 48.1; y: 96.3; skew-x: 2.5; skew-y: 2.5; }
        frame 4 { x: 48.6; y: 96.1; skew-x: 3.3; skew-y: 3.3; }
        frame 5 { x: 49; y: 96; skew-x: 4; skew-y: 4; }
        frame 6 { x: 49.5; y: 95.8; skew-x: 5; skew-y: 5; }
        frame 7 { x: 49; y: 96; skew-x: 4; skew-y: 4; }
        frame 8 { x: 48.5; y: 96.1; skew-x: 3.3; skew-y: 3.3; }
        frame 9 { x: 48.1; y: 96.3; skew-x: 2.5; skew-y: 2.5; }
        frame 10 { x: 47.6; y: 96.4; skew-x: 1.5; skew-y: 1.5; }
        frame 11 { x: 47.1; y: 96.6; skew-x: 0.8; skew-y: 0.8; }
        frame 12 { x: 46.6; y: 96.7; skew-x: 0; skew-y: 0; }
        frame 13 { x: 43.5; y: 96.1; skew-x: -6.2; skew-y: -6.2; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 45.7; y: 96; skew-x: -6; skew-y: -6; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 48; skew-x: -5.9; skew-y: -5.9; }
        frame 16 { x: 50.1; skew-x: -10000; skew-y: -10000; }
        frame 17 { x: 52.5; y: 97.3; skew-x: -14; skew-y: -14; scale-x: 0.798; scale-y: 0.826; }
        frame 18 { x: 54.9; y: 98.8; skew-x: -22.2; skew-y: -22.2; scale-x: 0.797; scale-y: 0.853; }
        frame 19 { x: 57.4; y: 100.6; skew-x: -30.5; skew-y: -30.5; scale-x: -10000; scale-y: 0.881; }
        frame 20 { x: 58.5; y: 99.4; skew-x: -34.2; skew-y: -34.2; scale-x: 0.796; scale-y: 0.88; }
        frame 21 { x: 59.6; y: 98.3; skew-x: -38; skew-y: -38; scale-x: -10000; scale-y: 0.879; }
        frame 22 { x: 60.7; y: 97.1; skew-x: -41.6; skew-y: -41.6; scale-x: 0.797; scale-y: 0.881; }
        frame 23 { x: 61.1; y: 101.4; skew-x: -46.3; skew-y: -46.3; scale-x: 0.795; scale-y: 0.912; }
        frame 24 { x: 61.6; y: 105.7; skew-x: -50.8; skew-y: -50.8; scale-x: -10000; scale-y: 0.945; }
        frame 25 { x: 61.9; y: 110; skew-x: -55.4; skew-y: -55.4; scale-x: 0.796; scale-y: 0.979; }
        frame 26 { x: 60.6; y: 113.5; skew-x: -59.1; skew-y: -59.1; scale-x: 0.794; scale-y: 0.944; }
        frame 27 { x: 59.5; y: 116.8; skew-x: -62.6; skew-y: -62.6; scale-x: 0.793; scale-y: 0.91; }
        frame 28 { x: 58.5; y: 120.3; skew-x: -66.2; skew-y: -66.2; scale-x: 0.794; scale-y: 0.877; }
        frame 29 { x: 54.3; y: 117.7; skew-x: -60.6; skew-y: -60.6; scale-x: 0.793; scale-y: 0.876; }
        frame 30 { x: 50.2; y: 115.2; skew-x: -54.8; skew-y: -55; scale-x: -10000; scale-y: 0.877; }
        frame 31 { x: 46.3; y: 112.5; skew-x: -49.3; skew-y: -49.3; scale-x: 0.795; scale-y: 0.878; }
        frame 32 { x: 43; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.793; scale-y: 0.877; }
        frame 33 { x: 39.8; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 36.5; scale-x: 0.795; scale-y: 0.878; }
        frame 35 { x: 35.3; y: 110.4; skew-x: -45; skew-y: -45; scale-x: 0.793; scale-y: 0.876; }
        frame 36 { x: 34; y: 108.5; skew-x: -40.7; skew-y: -40.7; scale-x: 0.792; scale-y: -10000; }
        frame 37 { x: 33; y: 106.5; skew-x: -36.4; skew-y: -36.4; scale-x: 0.793; scale-y: 0.877; }
        frame 38 { x: 31.9; y: 100.3; skew-x: -25.2; skew-y: -25.2; scale-x: 0.792; scale-y: 0.875; }
        frame 39 { x: 31.3; y: 94.5; skew-x: -14.2; skew-y: -14.2; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -10000; y: 89; skew-x: -3.1; skew-y: -3.1; }
        frame 41 { x: 31.2; y: 90.5; skew-x: -1.7; skew-y: -1.7; scale-x: 0.791; scale-y: 0.874; }
        frame 42 { x: 31.1; y: 92.1; skew-x: -0.4; skew-y: -0.4; scale-x: 0.79; scale-y: 0.873; }
        frame 43 { x: 30.9; y: 93.6; skew-x: 0.7; skew-y: 0.7; scale-x: 0.789; scale-y: 0.872; }
        frame 44 { x: 32.1; y: 96; skew-x: -7.4; skew-y: -7.2; scale-x: 0.785; scale-y: 0.841; }
        frame 45 { x: 33.9; y: 98.8; skew-x: -15.7; skew-y: -15.2; scale-x: 0.782; scale-y: 0.81; }
        frame 46 { x: 36.1; y: 101.9; skew-x: -24.1; skew-y: -23.4; scale-x: 0.78; scale-y: 0.781; }
        frame 47 { x: 38.4; y: 99.9; skew-x: -18; skew-y: -17.7; scale-x: 0.786; scale-y: 0.786; }
        frame 48 { x: 40.8; y: 98.1; skew-x: -12; skew-y: -11.9; scale-x: 0.792; scale-y: 0.793; }
        frame 49 { x: 43.5; y: 96.1; skew-x: -6.2; skew-y: -6.2; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 40.1; y: 97.3; skew-x: -16.7; skew-y: -16.7; scale-x: 0.798; scale-y: 0.798; }
        frame 52 { x: 37.4; y: 98.8; skew-x: -27; skew-y: -27; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 34.9; y: 100.5; skew-x: -37.5; skew-y: -37.5; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 33.1; y: 102.3; skew-x: -48.1; skew-y: -48.1; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { x: 30.6; y: 98.8; skew-x: -30; skew-y: -29.5; scale-x: 0.796; scale-y: 0.796; }
        frame 56 { x: 29.6; y: 96; skew-x: -11.9; skew-y: -10.9; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 29.7; y: 94.1; skew-x: 6; skew-y: 7.4; }
        frame 58 { x: 27.9; y: 94.8; skew-x: 1.5; skew-y: 3; }
        frame 59 { x: 26.3; y: 95.5; skew-x: -2.7; skew-y: -1.3; }
        frame 60 { x: 22.6; y: 97.2; skew-x: -12.9; skew-y: -11.5; scale-x: 0.795; scale-y: 0.795; }
        frame 61 { x: 19.3; y: 99.3; skew-x: -23.2; skew-y: -21.7; scale-x: 0.794; scale-y: 0.794; }
        frame 62 { x: 16.4; y: 101.5; skew-x: -33.5; skew-y: -32.2; scale-x: -10000; scale-y: 0.795; }
        frame 63 { x: 15.5; y: 102.9; skew-x: -39.4; skew-y: -37.9; scale-x: 0.792; scale-y: 0.792; }
        frame 64 { x: 4.3; y: 91.6; skew-x: -1.7; skew-y: -0.2; scale-x: -10000; scale-y: 0.791; }
        frame 65 { x: -10.4; y: 61.1; skew-x: 65.3; skew-y: 66.8; scale-y: 0.792; }
        frame 66 { x: -6.5; y: 55; skew-x: 87.5; skew-y: 89; scale-y: 0.791; }
        frame 67 { x: -4.4; y: 50.6; skew-x: 109.3; skew-y: 110.8; scale-x: 0.791; scale-y: 0.789; }
        frame 68 { x: -4.6; y: 47.1; skew-x: 131.4; skew-y: 133; scale-x: 0.792; scale-y: 0.79; }
        frame 69 { x: -12.7; y: 41.3; skew-x: 137.1; skew-y: 138.6; scale-x: 0.79; scale-y: 0.788; }
        frame 70 { x: -21; y: 35.5; skew-x: 142.7; skew-y: 144.2; scale-x: 0.789; scale-y: 0.787; }
        frame 71 { x: -29.3; y: 29.5; skew-x: 148.3; skew-y: 149.8; scale-x: -10000; scale-y: 0.788; }
        frame 72 { x: -39.5; y: 20.6; skew-x: 140.1; skew-y: 141.6; scale-x: 0.788; scale-y: 0.786; }
        frame 73 { x: -50.1; y: 11.6; skew-x: 131.9; skew-y: 133.4; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -60.9; y: 2.6; skew-x: 123.7; skew-y: 125.3; scale-y: 0.787; }
        frame 75 { x: -66.9; y: 0.7; skew-x: 103.8; skew-y: 105.3; scale-x: 0.787; scale-y: 0.785; }
        frame 76 { x: -74.6; y: -0.4; skew-x: 83.9; skew-y: 85.5; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -83.5; y: -0.3; skew-x: 63.9; skew-y: 65.4; scale-x: 0.785; scale-y: 0.783; }
        frame 78 { x: -93.2; y: 1.4; skew-x: 43.9; skew-y: 45.5; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: -101.6; y: 25.6; skew-x: 16.8; skew-y: 18.5; scale-x: 0.783; scale-y: 0.782; }
        frame 80 { x: -108.7; y: 52.9; skew-x: -9.9; skew-y: -8.4; scale-x: -10000; scale-y: 0.781; }
        frame 81 { x: -109.5; y: 62.5; skew-x: -13.7; skew-y: -12; scale-x: 0.782; scale-y: -10000; }
        frame 82 { x: -110.5; y: 72.1; skew-x: -17.5; skew-y: -15.9; scale-x: 0.783; }
        frame 83 { x: -108.4; y: 76.9; skew-x: -13.9; skew-y: -12.7; scale-x: 0.785; scale-y: 0.784; }
        frame 84 { x: -106.4; y: 81.8; skew-x: -10.4; skew-y: -9.4; scale-x: 0.789; scale-y: 0.788; }
        frame 85 { x: -103.2; y: 89.2; skew-x: -5.2; skew-y: -4.7; scale-x: 0.794; scale-y: 0.794; }
        frame 86 { x: -100.2; y: 96.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -96.9; y: 95.4; skew-x: 8; skew-y: 8; scale-x: 0.799; scale-y: 0.799; }
        frame 88 { x: -93.6; y: 94.4; skew-x: 16.1; skew-y: 16.1; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -95.4; y: 94.8; skew-x: 12; skew-y: 12; }
        frame 90 { x: -97; y: 95.4; skew-x: 8; skew-y: 8; }
        frame 91 { x: -98.6; y: 96.1; skew-x: 4; skew-y: 4; scale-x: 0.8; scale-y: 0.8; }
        frame 92 { x: -100.2; y: 96.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 49.1; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 94 { x: 49.9; }
        frame 95 { x: 50.7; }
        frame 96 { x: 51.5; }
        frame 97 { x: 52.3; }
        frame 98 { x: 51.9; y: 97.5; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 99 { x: 51.6; y: 98.4; skew-x: -11.4; skew-y: -11.4; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 51.4; y: 99.3; skew-x: -17.2; skew-y: -17.2; }
        frame 101 { x: -10000; y: 100.4; skew-x: -23.2; skew-y: -23.2; }
        frame 102 { x: 51.8; y: 102.3; skew-x: -30.7; skew-y: -30.7; scale-x: 0.798; scale-y: 0.798; }
        frame 103 { x: 52.4; y: 104.2; skew-x: -38.2; skew-y: -38.2; scale-x: 0.797; scale-y: 0.797; }
        frame 104 { x: 53.3; y: 106.2; skew-x: -45.8; skew-y: -45.8; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 54.5; y: 108.3; skew-x: -53.3; skew-y: -53.3; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 55.7; y: 109.1; skew-x: -55.1; skew-y: -55.1; scale-x: 0.796; scale-y: 0.796; }
        frame 107 { x: 57; y: 109.9; skew-x: -56.8; skew-y: -56.8; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 58.3; y: 110.6; skew-x: -58.6; skew-y: -58.6; }
        frame 109 { x: 59.5; y: 111.4; skew-x: -60.3; skew-y: -60.3; scale-x: 0.797; scale-y: 0.797; }
        frame 110 { x: 59.6; y: 112.9; skew-x: -63.6; skew-y: -63.6; scale-x: 0.796; scale-y: 0.796; }
        frame 111 { x: 59.8; y: 114.3; skew-x: -66.6; skew-y: -66.6; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 60; y: 115.7; skew-x: -69.6; skew-y: -69.6; }
        frame 113 { x: 60.2; y: 117.2; skew-x: -72.6; skew-y: -72.6; }
        frame 114 { x: 58.2; y: 116.4; skew-x: -71.3; skew-y: -71.3; scale-x: 0.795; scale-y: 0.795; }
        frame 115 { x: 56.1; y: 115.6; skew-x: -69.8; skew-y: -69.8; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 54.1; y: 114.9; skew-x: -68.4; skew-y: -68.4; scale-x: 0.794; scale-y: 0.794; }
        frame 117 { x: 52.1; y: 114; skew-x: -66.9; skew-y: -66.9; scale-x: 0.795; scale-y: 0.795; }
        frame 118 { x: 50.6; y: -10000; skew-x: -66.8; skew-y: -66.8; scale-x: 0.794; scale-y: 0.794; }
        frame 119 { x: 49; y: 113.9; skew-x: -66.6; skew-y: -66.6; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 47.3; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 121 { x: 45.6; skew-x: -66.3; skew-y: -66.3; }
        frame 122 { x: 42.8; y: 113.2; skew-x: -64.6; skew-y: -64.6; scale-x: 0.793; scale-y: 0.793; }
        frame 123 { x: 39.8; y: 112.6; skew-x: -62.8; skew-y: -62.8; scale-x: -10000; scale-y: -10000; }
        frame 124 { x: 36.9; y: 111.8; skew-x: -61.1; skew-y: -61.1; }
        frame 125 { x: 34; y: 111.1; skew-x: -59.3; skew-y: -59.3; }
        frame 126 { x: 32.4; y: 107.9; skew-x: -49.5; skew-y: -49.5; scale-x: 0.792; scale-y: 0.792; }
        frame 127 { x: 31.2; y: 104.8; skew-x: -39.5; skew-y: -39.5; scale-x: 0.791; scale-y: 0.791; }
        frame 128 { x: 30.4; y: 101.7; skew-x: -29.7; skew-y: -29.7; scale-x: -10000; scale-y: -10000; }
        frame 129 { x: 30.1; y: 98.8; skew-x: -19.9; skew-y: -19.9; scale-x: 0.792; scale-y: 0.792; }
        frame 130 { x: 35.7; y: 97.9; skew-x: -10.7; skew-y: -10.7; scale-x: 0.791; scale-y: 0.791; }
        frame 131 { x: 41.6; y: 97.3; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 132 { x: 47.7; y: 97.1; skew-x: 7; skew-y: 7; scale-x: 0.79; scale-y: 0.79; }
        frame 133 { x: 54.1; y: 97.4; skew-x: 16.2; skew-y: 16.2; scale-x: 0.789; scale-y: 0.789; }
        frame 134 { x: 52.9; y: 97.2; skew-x: 12.1; skew-y: 12.1; scale-x: 0.792; scale-y: 0.792; }
        frame 135 { x: 51.6; y: 97; skew-x: 8; skew-y: 8; scale-x: 0.794; scale-y: 0.794; }
        frame 136 { x: 50.5; y: 96.9; skew-x: 4; skew-y: 4; scale-x: 0.797; scale-y: 0.797; }
        frame 137 { x: 49.1; y: 96.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 46.2; y: 97.4; skew-x: -7.4; skew-y: -7.4; scale-x: 0.799; scale-y: 0.799; }
        frame 140 { x: 43.5; y: 98.2; skew-x: -14.9; skew-y: -14.9; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: 40.8; y: 99.2; skew-x: -22.5; skew-y: -22.5; }
        frame 142 { x: 39.5; y: 99.9; skew-x: -25.7; skew-y: -25.7; scale-x: 0.798; scale-y: 0.798; }
        frame 143 { x: 38.1; y: 100.6; skew-x: -29; skew-y: -29; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 36.8; y: 101.4; skew-x: -32.3; skew-y: -32.3; }
        frame 145 { x: 34; y: 104.2; skew-x: -43.5; skew-y: -43.5; scale-x: 0.797; scale-y: 0.797; }
        frame 146 { x: 31.8; y: 107; skew-x: -54.6; skew-y: -54.6; scale-x: 0.796; scale-y: 0.796; }
        frame 147 { x: 30.2; y: 109.7; skew-x: -65.6; skew-y: -65.6; scale-x: 0.797; scale-y: 0.797; }
        frame 148 { x: 28.3; y: 113.4; skew-x: -78.9; skew-y: -78.9; scale-x: 0.796; scale-y: 0.796; }
        frame 149 { x: 27.3; y: 116.6; skew-x: -91.9; skew-y: -91.9; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 26.9; y: 119.3; skew-x: -105; skew-y: -105; scale-x: 0.795; scale-y: 0.795; }
        frame 151 { x: 28.9; y: 122.9; skew-x: -117; skew-y: -117; scale-x: 0.794; scale-y: 0.794; }
        frame 152 { x: 31.2; y: 125.9; skew-x: -129.3; skew-y: -129.3; scale-x: 0.793; scale-y: 0.793; }
        frame 153 { x: 33.5; y: 128.2; skew-x: -141.4; skew-y: -141.4; scale-x: 0.794; scale-y: 0.794; }
        frame 154 { x: 32.2; y: 133; skew-x: -132.8; skew-y: -132.8; scale-x: 0.792; scale-y: 0.792; }
        frame 155 { x: 31; y: 137.6; skew-x: -124.2; skew-y: -124.2; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: 29.8; y: 141.8; skew-x: -115.6; skew-y: -115.6; scale-x: 0.793; scale-y: 0.793; }
        frame 157 { x: 30.5; y: 141.4; skew-x: -116.7; skew-y: -114.2; scale-x: 0.775; scale-y: 0.802; }
        frame 158 { x: 31.2; y: 141; skew-x: -118; skew-y: -113.1; scale-x: 0.76; scale-y: 0.814; }
        frame 159 { x: 30.7; y: 140.6; skew-x: -117.2; skew-y: -113.7; scale-x: 0.769; scale-y: 0.806; }
        frame 160 { x: 30.2; y: 140.4; skew-x: -116.2; skew-y: -114.7; scale-x: 0.78; scale-y: 0.798; }
        frame 161 { x: 29.8; y: 140.1; skew-x: -115.5; skew-y: -115.5; scale-x: 0.792; scale-y: 0.792; }
        frame 162 { x: 30.2; y: 140.4; skew-x: -116.2; skew-y: -114.7; scale-x: 0.78; scale-y: 0.798; }
        frame 163 { x: 30.7; y: 140.7; skew-x: -117.2; skew-y: -113.7; scale-x: 0.769; scale-y: 0.806; }
        frame 164 { x: 31.2; y: 141; skew-x: -118; skew-y: -113.1; scale-x: 0.76; scale-y: 0.814; }
        frame 165 { x: 49.1; y: 96.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 166 { x: 49.3; y: 96.6; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 49.4; y: 96.5; skew-x: 0.6; skew-y: 0.6; }
        frame 168 { x: 49.6; y: 96.3; skew-x: 1.1; skew-y: 1.1; }
        frame 169 { x: 49.9; y: -10000; skew-x: 1.3; skew-y: 1.3; }
        frame 170 { x: 50.3; y: 96.2; skew-x: 1.8; skew-y: 1.8; }
        frame 171 { x: 50.6; y: 96.1; skew-x: 2.3; skew-y: 2.3; }
        frame 172 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 175 { x: 49.8; y: 96.4; skew-x: 0; skew-y: 0; }
        frame 176 { x: 49.2; y: 96.6; skew-x: -2; skew-y: -2; }
        frame 177 { x: 48.4; y: 96.9; skew-x: -4.4; skew-y: -4.4; }
        frame 178 { x: 48.6; y: 96.7; skew-x: -2.4; skew-y: -2.4; }
        frame 179 { x: 49.1; y: 96.5; skew-x: -0.7; skew-y: -0.7; }
        frame 180 { x: 49.6; y: 96.3; skew-x: 1.1; skew-y: 1.1; }
        frame 181 { x: 49.9; y: -10000; skew-x: 1.3; skew-y: 1.3; }
        frame 182 { x: 50.3; y: 96.2; skew-x: 1.8; skew-y: 1.8; }
        frame 183 { x: 50.6; y: 96.1; skew-x: 2.3; skew-y: 2.3; }
        frame 184 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 187 { x: 49.8; y: 96.4; skew-x: 0; skew-y: 0; }
        frame 188 { x: 49.2; y: 96.6; skew-x: -2; skew-y: -2; }
        frame 189 { x: 48.4; y: 96.9; skew-x: -4.4; skew-y: -4.4; }
        frame 190 { x: 48.6; y: 96.8; skew-x: -2.7; skew-y: -2.7; }
        frame 191 { x: 48.8; y: -10000; skew-x: -1.2; skew-y: -1.2; }
        frame 192 { x: 49.1; y: 96.7; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_polevaulter_outerleg_upper";
        frame-count: 193;
        frame 0 { x: 67.9; y: 89.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_OUTERLEG_UPPER; }
        frame 1 { x: 67.8; y: 88.9; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: 0.852; image: none; }
        frame 2 { x: 67.7; y: 88.6; skew-x: 3.8; skew-y: 3.8; scale-y: 0.904; }
        frame 3 { x: 67.6; y: 88.3; skew-x: 5.6; skew-y: 5.6; scale-y: 0.955; }
        frame 4 { x: -10000; y: 87.9; skew-x: 7.5; skew-y: 7.5; scale-y: 1.007; }
        frame 5 { y: 87.6; skew-x: 9.5; skew-y: 9.5; scale-x: 0.799; scale-y: 1.059; }
        frame 6 { x: 67.7; y: 87.2; skew-x: 11.4; skew-y: 11.4; scale-x: 0.8; scale-y: 1.112; }
        frame 7 { x: 67.6; y: 87.5; skew-x: 9.5; skew-y: 9.5; scale-x: 0.799; scale-y: 1.059; }
        frame 8 { x: -10000; y: 87.8; skew-x: 7.5; skew-y: 7.5; scale-x: 0.8; scale-y: 1.007; }
        frame 9 { x: 67.7; y: 88.2; skew-x: 5.6; skew-y: 5.6; scale-x: -10000; scale-y: 0.955; }
        frame 10 { x: -10000; y: 88.4; skew-x: 3.8; skew-y: 3.8; scale-y: 0.904; }
        frame 11 { x: 67.8; y: 88.9; skew-x: 1.8; skew-y: 1.8; scale-y: 0.852; }
        frame 12 { x: 67.9; y: 89.3; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 13 { x: 68; y: 83; skew-x: 23.1; skew-y: 23.1; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 66.3; y: 82.9; skew-x: 20.1; skew-y: 20.1; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 64.5; y: 82.7; skew-x: 17.3; skew-y: 17.3; scale-x: 0.797; scale-y: 0.797; }
        frame 16 { x: 63; y: 82.5; skew-x: 14.5; skew-y: 14.5; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 63.3; y: 81; skew-x: 24.5; skew-y: 24.5; scale-x: 0.796; scale-y: 0.834; }
        frame 18 { x: 63.8; y: 79.7; skew-x: 34.6; skew-y: 34.6; scale-x: -10000; scale-y: 0.871; }
        frame 19 { x: 64.1; y: 79; skew-x: 44.6; skew-y: 44.6; scale-x: 0.797; scale-y: 0.91; }
        frame 20 { x: 62.1; y: 77.3; skew-x: 41.6; skew-y: 41.6; scale-x: 0.796; scale-y: 0.871; }
        frame 21 { x: 60.2; y: 75.7; skew-x: 38.6; skew-y: 38.6; scale-x: -10000; scale-y: 0.833; }
        frame 22 { x: 58.5; y: 74.1; skew-x: 35.8; skew-y: 35.8; scale-x: 0.797; scale-y: 0.797; }
        frame 23 { x: 58.6; y: 79; skew-x: 39.6; skew-y: 39.6; scale-x: 0.795; scale-y: 0.795; }
        frame 24 { x: -10000; y: 84; skew-x: 43.6; skew-y: 43.6; scale-x: -10000; scale-y: -10000; }
        frame 25 { y: 89.1; skew-x: 47.6; skew-y: 47.6; scale-x: 0.796; scale-y: 0.796; }
        frame 26 { x: 60; y: 90.4; skew-x: 53.2; skew-y: 53.2; scale-x: 0.795; scale-y: 0.962; }
        frame 27 { x: 61.5; y: 92; skew-x: 58.7; skew-y: 58.7; scale-x: -10000; scale-y: 1.129; }
        frame 28 { x: 63; y: 94; skew-x: 64.2; skew-y: 64.2; scale-y: 1.298; }
        frame 29 { x: 63.2; y: 91.6; skew-x: 54.4; skew-y: 54.4; scale-x: 0.794; scale-y: 1.296; }
        frame 30 { x: 63.3; y: 89.4; skew-x: 44.6; skew-y: 44.6; scale-x: 0.793; scale-y: 1.295; }
        frame 31 { x: -10000; y: 87.5; skew-x: 34.8; skew-y: 34.8; scale-x: 0.794; scale-y: 1.296; }
        frame 32 { x: 63.7; y: 87; skew-x: 31.3; skew-y: 31.3; scale-x: 0.793; scale-y: 1.294; }
        frame 33 { x: 64.1; y: 86.7; skew-x: 27.8; skew-y: 27.8; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 64.5; y: 86.3; skew-x: 24.3; skew-y: 24.3; scale-x: 0.794; scale-y: 1.296; }
        frame 35 { x: -10000; y: 86.5; skew-x: 15.1; skew-y: 15.1; scale-x: 0.793; scale-y: 1.294; }
        frame 36 { y: 87; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 64.6; y: 87.7; skew-x: -2.9; skew-y: -2.9; }
        frame 38 { x: -10000; y: 83.7; skew-x: -7.4; skew-y: -7.4; scale-x: 0.792; scale-y: 1.293; }
        frame 39 { x: 64.5; y: 79.7; skew-x: -11.9; skew-y: -11.9; scale-x: 0.791; scale-y: 1.292; }
        frame 40 { x: 64.6; y: 75.9; skew-x: -16.4; skew-y: -16.4; scale-x: 0.792; scale-y: -10000; }
        frame 41 { x: 63.8; y: 79.8; skew-x: -18.5; skew-y: -18.5; scale-x: 0.79; scale-y: 1.29; }
        frame 42 { x: 63; y: 83.6; skew-x: -20.5; skew-y: -20.5; scale-x: -10000; scale-y: 1.289; }
        frame 43 { x: 62.1; y: 87.6; skew-x: -22.7; skew-y: -22.7; scale-y: 1.29; }
        frame 44 { x: 63.3; y: 87.4; skew-x: -15; skew-y: -15; scale-x: 0.789; scale-y: 1.288; }
        frame 45 { x: 64.7; y: -10000; skew-x: -7.4; skew-y: -7.2; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 66.2; y: 87.7; skew-x: 0.2; skew-y: 0.2; }
        frame 47 { x: 67.1; y: 86.2; skew-x: 7.8; skew-y: 7.8; scale-x: 0.792; scale-y: 1.125; }
        frame 48 { x: 67.8; y: 84.7; skew-x: 15.3; skew-y: 15.3; scale-x: 0.795; scale-y: 0.961; }
        frame 49 { x: 68; y: 83; skew-x: 23.1; skew-y: 23.1; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: 67.4; y: 85.2; skew-x: -1.6; skew-y: -1.6; scale-x: 0.798; scale-y: 1.052; }
        frame 51 { x: 67.5; y: 85.5; skew-x: 2.6; skew-y: 2.6; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 67.4; y: 85.8; skew-x: 7; skew-y: 7; scale-x: 0.797; scale-y: 1.051; }
        frame 53 { x: 67.5; y: 86; skew-x: 11.5; skew-y: 11.5; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 67.6; y: 86.4; skew-x: 16.1; skew-y: 16.1; }
        frame 55 { x: 60.4; y: 84.9; skew-x: 4.8; skew-y: 4.8; scale-y: 1.05; }
        frame 56 { x: 53.4; y: 83.6; skew-x: -6.2; skew-y: -6.2; scale-x: 0.796; scale-y: -10000; }
        frame 57 { x: 46.7; y: 82.6; skew-x: -17.6; skew-y: -17.6; scale-x: -10000; }
        frame 58 { x: 47; y: 81.5; skew-x: -0.7; skew-y: -0.7; scale-x: 0.795; scale-y: 1.049; }
        frame 59 { x: 47.6; y: 81.1; skew-x: 15.8; skew-y: 15.8; scale-x: -10000; scale-y: 1.048; }
        frame 60 { x: 41.5; y: 78.1; skew-x: 26.3; skew-y: 26.3; scale-x: 0.792; scale-y: 1.044; }
        frame 61 { x: 37.1; y: 78.9; skew-x: 33.8; skew-y: 33.8; scale-x: 0.791; scale-y: 1.042; }
        frame 62 { x: 32.9; y: 79.7; skew-x: 41.4; skew-y: 41.4; scale-x: 0.792; scale-y: 1.044; }
        frame 63 { x: 27.5; y: 79; skew-x: 60.4; skew-y: 60.4; scale-x: 0.791; scale-y: 1.042; }
        frame 64 { x: 21.5; y: 79.3; skew-x: 79.5; skew-y: 79.7; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 14.7; y: 80.4; skew-x: 98.6; skew-y: 98.6; }
        frame 66 { x: 8.6; y: 77.2; skew-x: 112.3; skew-y: 112.3; scale-x: 0.79; scale-y: 1.04; }
        frame 67 { x: 2; y: 74; skew-x: 125.9; skew-y: 126.1; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: -5; y: 70.7; skew-x: 139.7; skew-y: 139.9; scale-x: 0.791; scale-y: 1.041; }
        frame 69 { x: -15.4; y: 64.5; skew-x: 145.4; skew-y: 145.6; scale-x: 0.789; scale-y: 1.038; }
        frame 70 { x: -25.9; y: 58.1; skew-x: 150.9; skew-y: 151.2; scale-x: 0.788; scale-y: -10000; }
        frame 71 { x: -36.4; y: 52; skew-x: 156.5; skew-y: 156.8; scale-x: 0.789; }
        frame 72 { x: -43.5; y: 43.4; skew-x: 148.4; skew-y: 148.7; scale-x: 0.787; scale-y: 1.036; }
        frame 73 { x: -50.7; y: 34.8; skew-x: 140.2; skew-y: 140.4; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -58.1; y: 26.1; skew-x: 132; skew-y: 132.2; scale-x: 0.788; scale-y: 1.037; }
        frame 75 { x: -59.4; y: 22; skew-x: 118; skew-y: 118.1; scale-x: 0.786; scale-y: 1.035; }
        frame 76 { x: -61.5; y: 17.9; skew-x: 104; skew-y: 104.1; scale-x: -10000; scale-y: 1.034; }
        frame 77 { x: -64; y: 13.9; skew-x: 90; skew-y: 90.1; scale-y: -10000; }
        frame 78 { x: -67.2; y: 10.3; skew-x: 76.1; skew-y: 76.3; scale-x: 0.785; }
        frame 79 { x: -76.3; y: 22.8; skew-x: 49.1; skew-y: 49.4; scale-x: 0.783; scale-y: 1.031; }
        frame 80 { x: -86.1; y: 37.1; skew-x: 22.1; skew-y: 22.3; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -88.1; y: 45.4; skew-x: 18.3; skew-y: 18.5; scale-y: 1.03; }
        frame 82 { x: -90.2; y: 53.5; skew-x: 14.6; skew-y: 14.8; scale-y: 1.031; }
        frame 83 { x: -88; y: 60.6; skew-x: 11.5; skew-y: 11.8; scale-x: 0.786; scale-y: 0.984; }
        frame 84 { x: -85.8; y: 67.8; skew-x: 8.6; skew-y: 8.8; scale-x: 0.789; scale-y: 0.938; }
        frame 85 { x: -82.3; y: 78.5; skew-x: 4.3; skew-y: 4.3; scale-x: 0.795; scale-y: 0.869; }
        frame 86 { x: -78.9; y: 89.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -79.5; y: 88.9; skew-x: 8; skew-y: 8; scale-x: 0.799; scale-y: 0.799; }
        frame 88 { x: -80; y: 88.4; skew-x: 16; skew-y: 16; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -79.7; y: 88.6; skew-x: 12; skew-y: 12; }
        frame 90 { x: -79.5; y: 88.8; skew-x: 8; skew-y: 8; }
        frame 91 { x: -79.2; y: 89; skew-x: 4; skew-y: 4; scale-x: 0.8; scale-y: 0.8; }
        frame 92 { x: -78.9; y: 89.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 70.4; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 94 { x: 70.3; y: 88.9; skew-x: 3.8; skew-y: 3.8; }
        frame 95 { x: -10000; y: 88.7; skew-x: 7.8; skew-y: 7.8; scale-x: 0.799; scale-y: 0.799; }
        frame 96 { x: 70.4; y: 88.4; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 70.3; y: 88.1; skew-x: 15.8; skew-y: 15.8; }
        frame 98 { x: 68.5; y: 87.3; skew-x: 20.3; skew-y: 20.3; scale-x: 0.798; scale-y: 0.857; }
        frame 99 { x: 66.8; y: 86.4; skew-x: 24.8; skew-y: 24.8; scale-x: -10000; scale-y: 0.916; }
        frame 100 { x: 65.2; y: 85.8; skew-x: 29.6; skew-y: 29.6; scale-x: 0.797; scale-y: 0.975; }
        frame 101 { x: 63.6; y: 85.1; skew-x: 34.1; skew-y: 34.1; scale-x: 0.798; scale-y: 1.035; }
        frame 102 { x: 63.8; y: 84.7; skew-x: 36.1; skew-y: 36.1; scale-x: 0.796; scale-y: 1.033; }
        frame 103 { x: 64; y: 84.2; skew-x: 38.1; skew-y: 38.1; scale-x: -10000; scale-y: 1.032; }
        frame 104 { x: 64.3; y: 83.8; skew-x: 40.3; skew-y: 40.3; scale-x: 0.795; scale-y: 1.031; }
        frame 105 { x: 64.4; y: 83.3; skew-x: 42.4; skew-y: 42.4; scale-x: 0.796; scale-y: 1.032; }
        frame 106 { x: 64.1; y: 83.4; skew-x: 43.9; skew-y: 43.9; scale-x: 0.794; scale-y: 1.03; }
        frame 107 { x: 63.8; y: 83.6; skew-x: 45.6; skew-y: 45.6; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 63.4; y: -10000; skew-x: 47.1; skew-y: 47.1; }
        frame 109 { x: 63; skew-x: 48.7; skew-y: 48.7; scale-x: 0.795; scale-y: 1.031; }
        frame 110 { x: 61.7; y: 85.2; skew-x: 46.6; skew-y: 46.6; scale-x: 0.793; scale-y: 1.073; }
        frame 111 { x: 60.4; y: 86.7; skew-x: 44.4; skew-y: 44.4; scale-x: -10000; scale-y: 1.116; }
        frame 112 { x: 59.1; y: 88.2; skew-x: 42.3; skew-y: 42.3; scale-y: 1.159; }
        frame 113 { x: 57.6; y: 89.7; skew-x: 40.1; skew-y: 40.1; scale-x: 0.794; scale-y: 1.204; }
        frame 114 { x: 59.1; y: 88.2; skew-x: 36.6; skew-y: 36.6; scale-x: 0.792; scale-y: 1.253; }
        frame 115 { x: 60.8; y: 86.6; skew-x: 33.3; skew-y: 33.3; scale-x: -10000; scale-y: 1.303; }
        frame 116 { x: 62.3; y: 85; skew-x: 29.8; skew-y: 29.8; scale-y: 1.354; }
        frame 117 { x: 63.8; y: 83.5; skew-x: 26.5; skew-y: 26.5; scale-y: 1.406; }
        frame 118 { x: 62.6; y: -10000; skew-x: 19.3; skew-y: 19.3; scale-x: 0.791; scale-y: 1.404; }
        frame 119 { x: 61.6; y: 83.8; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: 1.403; }
        frame 120 { x: 60.5; y: 84.2; skew-x: 4.8; skew-y: 4.8; scale-x: 0.79; scale-y: -10000; }
        frame 121 { x: 59.5; y: 84.8; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: 1.402; }
        frame 122 { x: 59.4; y: 85.2; skew-x: -5.7; skew-y: -5.7; scale-y: -10000; }
        frame 123 { x: 59.3; y: 85.6; skew-x: -9.2; skew-y: -9.2; scale-x: 0.789; scale-y: 1.401; }
        frame 124 { x: 59.1; y: 86.1; skew-x: -12.9; skew-y: -12.9; scale-x: -10000; scale-y: 1.4; }
        frame 125 { x: -10000; y: 86.6; skew-x: -16.5; skew-y: -16.5; scale-y: 1.401; }
        frame 126 { x: 59.2; y: 86.9; skew-x: -18.7; skew-y: -18.7; scale-y: 1.4; }
        frame 127 { x: 59.3; y: 87.2; skew-x: -20.9; skew-y: -20.9; scale-x: 0.788; scale-y: 1.399; }
        frame 128 { x: 59.5; y: 87.6; skew-x: -23; skew-y: -23; scale-x: -10000; scale-y: -10000; }
        frame 129 { x: 59.7; y: 88; skew-x: -25.3; skew-y: -25.3; scale-x: 0.789; scale-y: 1.4; }
        frame 130 { x: 60; y: 87.7; skew-x: -22; skew-y: -22; scale-x: 0.788; scale-y: 1.399; }
        frame 131 { x: 60.3; y: 87.5; skew-x: -18.9; skew-y: -18.9; scale-x: -10000; scale-y: -10000; }
        frame 132 { x: 60.8; y: 87.4; skew-x: -15.7; skew-y: -15.7; }
        frame 133 { x: 61.1; y: 87.2; skew-x: -12.5; skew-y: -12.5; scale-x: 0.789; }
        frame 134 { x: 63.6; y: 87.7; skew-x: -9.2; skew-y: -9.2; scale-x: 0.791; scale-y: 1.249; }
        frame 135 { x: 66; y: 88.2; skew-x: -6.2; skew-y: -6.2; scale-x: 0.794; scale-y: 1.099; }
        frame 136 { x: 68.2; y: 88.7; skew-x: -2.9; skew-y: -2.9; scale-x: 0.797; scale-y: 0.95; }
        frame 137 { x: 70.4; y: 89.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 67; y: 87.5; skew-x: -2.9; skew-y: -2.9; scale-x: 0.799; scale-y: 0.799; }
        frame 140 { x: 63.7; y: 85.7; skew-x: -5.9; skew-y: -5.9; scale-x: 0.798; scale-y: 0.798; }
        frame 141 { x: 60.3; y: 83.8; skew-x: -9; skew-y: -9; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 58.5; y: 82.8; skew-x: -16.2; skew-y: -16.2; scale-x: 0.797; scale-y: 0.797; }
        frame 143 { x: 56.9; y: 81.8; skew-x: -23.5; skew-y: -23.5; scale-x: 0.796; scale-y: 0.796; }
        frame 144 { x: 55.4; y: 80.9; skew-x: -30.8; skew-y: -30.8; scale-x: 0.797; scale-y: 0.797; }
        frame 145 { x: 49.8; y: 81.4; skew-x: -42; skew-y: -42; scale-x: 0.795; scale-y: 0.795; }
        frame 146 { x: 44.6; y: 82.1; skew-x: -53.3; skew-y: -53.3; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 39.7; y: 82.6; skew-x: -64.4; skew-y: -64.4; }
        frame 148 { x: 32.4; y: 85.3; skew-x: -80.1; skew-y: -80.1; scale-x: 0.794; scale-y: 0.943; }
        frame 149 { x: 25.7; y: 88.4; skew-x: -95.7; skew-y: -95.7; scale-x: -10000; scale-y: 1.091; }
        frame 150 { x: 19.6; y: 91.6; skew-x: -111.3; skew-y: -111.3; scale-y: 1.239; }
        frame 151 { x: 16.3; y: 97.3; skew-x: -120; skew-y: -120; scale-x: 0.792; scale-y: 1.371; }
        frame 152 { x: 13.4; y: 103.1; skew-x: -128.7; skew-y: -128.7; scale-x: -10000; scale-y: 1.504; }
        frame 153 { x: 10.8; y: 109; skew-x: -137.4; skew-y: -137.4; scale-y: 1.641; }
        frame 154 { x: 5.3; y: 113.9; skew-x: -108.9; skew-y: -108.9; scale-x: 0.791; scale-y: 1.638; }
        frame 155 { x: 2.6; y: 116.6; skew-x: -80.6; skew-y: -80.6; scale-x: -10000; scale-y: 1.639; }
        frame 156 { x: 3.5; y: 118.6; skew-x: -52.2; skew-y: -52.2; scale-y: -10000; }
        frame 157 { x: 3.6; y: 119; skew-x: -50.8; skew-y: -53.8; scale-x: 0.782; scale-y: 1.642; }
        frame 158 { x: -10000; y: 119.4; skew-x: -49.2; skew-y: -55.3; scale-x: 0.775; scale-y: 1.65; }
        frame 159 { y: 118.7; skew-x: -50.3; skew-y: -54.3; scale-x: 0.779; scale-y: 1.643; }
        frame 160 { y: 117.9; skew-x: -51.3; skew-y: -53.3; scale-x: 0.784; scale-y: 1.638; }
        frame 161 { x: 3.5; y: 117.1; skew-x: -52.3; skew-y: -52.3; scale-x: 0.79; scale-y: 1.636; }
        frame 162 { x: 3.6; y: 117.9; skew-x: -51.3; skew-y: -53.3; scale-x: 0.784; scale-y: 1.638; }
        frame 163 { x: -10000; y: 118.7; skew-x: -50.3; skew-y: -54.3; scale-x: 0.779; scale-y: 1.643; }
        frame 164 { y: 119.4; skew-x: -49.2; skew-y: -55.3; scale-x: 0.775; scale-y: 1.65; }
        frame 165 { x: 70.4; y: 89.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 166 { x: 70.6; y: 89.2; skew-x: 3; skew-y: 3; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 71.1; y: 89; skew-x: 6.3; skew-y: 6.3; scale-x: 0.799; scale-y: 0.799; }
        frame 168 { x: 71.4; y: 88.9; skew-x: 9.5; skew-y: 9.5; scale-x: 0.8; scale-y: 0.8; }
        frame 169 { x: 71.6; y: 89.1; skew-x: 11.6; skew-y: 11.6; scale-x: 0.799; scale-y: 0.799; }
        frame 170 { x: 71.8; y: 89.2; skew-x: 13.8; skew-y: 13.8; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 72.1; y: 89.4; skew-x: 16.1; skew-y: 16.1; }
        frame 172 { x: -10000; y: -10000; skew-x: 16; skew-y: 16; }
        frame 173 { skew-x: -10000; skew-y: -10000; }
        frame 174 { skew-x: 16.1; skew-y: 16.1; }
        frame 175 { x: 71.1; y: 89.1; skew-x: 11.3; skew-y: 11.3; }
        frame 176 { x: 70.2; y: 88.9; skew-x: 6.5; skew-y: 6.5; }
        frame 177 { x: 69.2; y: 88.6; skew-x: 1.8; skew-y: 1.8; }
        frame 178 { x: 69.9; y: 88.8; skew-x: 4.3; skew-y: 4.3; }
        frame 179 { x: 70.5; y: -10000; skew-x: 6.8; skew-y: 6.8; }
        frame 180 { x: 71.4; y: 88.9; skew-x: 9.5; skew-y: 9.5; scale-x: 0.8; scale-y: 0.8; }
        frame 181 { x: 71.6; y: 89.1; skew-x: 11.6; skew-y: 11.6; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: 71.8; y: 89.2; skew-x: 13.8; skew-y: 13.8; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 72.1; y: 89.4; skew-x: 16.1; skew-y: 16.1; }
        frame 184 { x: -10000; y: -10000; skew-x: 16; skew-y: 16; }
        frame 185 { skew-x: -10000; skew-y: -10000; }
        frame 186 { skew-x: 16.1; skew-y: 16.1; }
        frame 187 { x: 71.1; y: 89.1; skew-x: 11.3; skew-y: 11.3; }
        frame 188 { x: 70.2; y: 88.9; skew-x: 6.5; skew-y: 6.5; }
        frame 189 { x: 69.2; y: 88.6; skew-x: 1.8; skew-y: 1.8; }
        frame 190 { x: 69.5; y: 88.9; skew-x: 1.1; skew-y: 1.1; }
        frame 191 { x: 69.9; y: 89.1; skew-x: 0.5; skew-y: 0.5; scale-x: 0.8; scale-y: 0.8; }
        frame 192 { x: 70.4; y: 89.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_polevaulter_outerleg_foot";
        frame-count: 193;
        frame 0 { x: 64.1; y: 121; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_OUTERLEG_FOOT; }
        frame 1 { x: -10000; y: 121.1; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 64; y: -10000; skew-x: -2.2; skew-y: -2.2; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: 64.1; y: 121.3; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: -10000; y: 121.4; skew-x: -4.7; skew-y: -4.7; }
        frame 5 { y: 121.5; skew-x: -5.7; skew-y: -5.7; }
        frame 6 { x: 64; y: 121.7; skew-x: -7.1; skew-y: -7.1; }
        frame 7 { x: 64.1; y: 121.6; skew-x: -5.7; skew-y: -5.7; }
        frame 8 { x: 64; y: 121.4; skew-x: -4.7; skew-y: -4.7; }
        frame 9 { y: -10000; skew-x: -3.4; skew-y: -3.4; }
        frame 10 { x: -10000; y: 121.2; skew-x: -2.2; skew-y: -2.2; }
        frame 11 { y: 121.1; skew-x: -0.9; skew-y: -0.9; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: 64.1; y: 121; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 66.8; y: 113.6; skew-x: -15.7; skew-y: -15.7; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 64.2; y: 113.8; skew-x: -12.7; skew-y: -12.7; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 61.4; y: 114.2; skew-x: -9.7; skew-y: -9.7; scale-x: 0.797; scale-y: 0.797; }
        frame 16 { x: 58.7; y: 114.5; skew-x: -6.8; skew-y: -6.8; scale-x: 0.796; scale-y: 0.796; }
        frame 17 { x: 53.4; y: 112.6; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 48.4; y: 110.8; skew-x: 6; skew-y: 6; }
        frame 19 { x: 43.5; y: 108.9; skew-x: 12.6; skew-y: 12.6; }
        frame 20 { x: 41.1; y: 107.8; skew-x: 11.3; skew-y: 11.3; }
        frame 21 { x: 39.1; y: 106.7; skew-x: 10.3; skew-y: 10.3; }
        frame 22 { x: 37; y: 105.7; skew-x: 9.3; skew-y: 9.3; }
        frame 23 { x: 35.8; y: 108; skew-x: 16.3; skew-y: 16.1; scale-x: 0.798; scale-y: 0.795; }
        frame 24 { x: 34.6; y: 110.5; skew-x: 23.1; skew-y: 23.1; scale-x: 0.8; scale-y: -10000; }
        frame 25 { x: 33.8; y: 113.1; skew-x: 30.1; skew-y: 30.1; scale-x: 0.804; scale-y: 0.796; }
        frame 26 { x: 34.2; y: 115.4; skew-x: 24.5; skew-y: 24.5; scale-x: 0.802; scale-y: 0.794; }
        frame 27 { x: 34.6; y: 117.8; skew-x: 18.8; skew-y: 18.8; scale-x: 0.801; scale-y: 0.793; }
        frame 28 { x: 35.1; y: 120.4; skew-x: 13.3; skew-y: 13.3; scale-x: 0.802; scale-y: -10000; }
        frame 29 { x: 38.9; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.801; }
        frame 30 { x: 42.6; scale-x: -10000; }
        frame 31 { x: 46.4; scale-x: 0.802; }
        frame 32 { x: 48.6; y: 120.7; skew-x: 10.3; skew-y: 10.3; scale-x: 0.801; }
        frame 33 { x: 51; y: 121.1; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; }
        frame 34 { x: 53.5; y: 121.4; skew-x: 4.8; skew-y: 4.8; }
        frame 35 { x: 57.9; y: 122.8; skew-x: -5.4; skew-y: -5.4; scale-x: 0.8; scale-y: 0.792; }
        frame 36 { x: 62.9; y: 124.4; skew-x: -15.9; skew-y: -15.9; scale-x: 0.799; scale-y: 0.791; }
        frame 37 { x: 68.3; y: 126.1; skew-x: -26.5; skew-y: -26.5; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 71.9; y: 122.1; skew-x: -29.5; skew-y: -29.5; scale-x: 0.798; scale-y: 0.79; }
        frame 39 { x: 75.4; y: 118.2; skew-x: -32.5; skew-y: -32.5; scale-x: 0.797; scale-y: 0.789; }
        frame 40 { x: 79; y: 114.3; skew-x: -35.7; skew-y: -35.7; scale-x: 0.798; scale-y: 0.79; }
        frame 41 { x: 81.2; y: 116.6; skew-x: -43.2; skew-y: -43.2; scale-x: 0.797; scale-y: 0.789; }
        frame 42 { x: 83.7; y: 118.9; skew-x: -50.6; skew-y: -50.6; scale-x: 0.796; scale-y: 0.788; }
        frame 43 { x: 86.5; y: 121.1; skew-x: -58; skew-y: -58; scale-x: 0.797; scale-y: 0.789; }
        frame 44 { x: 84.3; y: 121.4; skew-x: -56.8; skew-y: -56.8; scale-x: 0.796; scale-y: 0.788; }
        frame 45 { x: 82; y: 121.7; skew-x: -55.6; skew-y: -55.6; scale-x: 0.795; scale-y: 0.787; }
        frame 46 { x: 79.8; y: 122.1; skew-x: -54.4; skew-y: -54.4; scale-x: 0.796; scale-y: 0.788; }
        frame 47 { x: 74.7; y: 119.5; skew-x: -41.5; skew-y: -41.5; scale-x: -10000; scale-y: 0.79; }
        frame 48 { x: 70.4; y: 116.6; skew-x: -28.5; skew-y: -28.5; scale-x: 0.797; scale-y: 0.794; }
        frame 49 { x: 66.8; y: 113.6; skew-x: -15.7; skew-y: -15.7; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: 66.6; y: 120.5; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 66.2; y: 121; skew-x: -4.4; skew-y: -4.4; scale-x: 0.798; scale-y: 0.798; }
        frame 52 { x: 66; y: 121.4; skew-x: -7.7; skew-y: -7.7; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 65.8; y: 122.1; skew-x: -11; skew-y: -11; }
        frame 54 { x: 65.6; y: 122.6; skew-x: -14.4; skew-y: -14.4; }
        frame 55 { x: 64.5; y: 119; skew-x: -25.7; skew-y: -25.7; scale-x: 0.797; scale-y: 0.797; }
        frame 56 { x: 64.1; y: 115.4; skew-x: -37.3; skew-y: -37.3; scale-x: 0.796; scale-y: 0.796; }
        frame 57 { x: 64.3; y: 111.7; skew-x: -48.8; skew-y: -48.8; scale-x: 0.797; scale-y: 0.797; }
        frame 58 { x: 61.5; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.795; scale-y: 0.795; }
        frame 59 { x: 58.6; scale-x: 0.797; scale-y: 0.797; }
        frame 60 { x: 38.4; y: 111.1; skew-x: -20.7; skew-y: -20.5; scale-x: 0.795; scale-y: 0.795; }
        frame 61 { x: 23.5; y: 106.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.793; scale-y: 0.793; }
        frame 62 { x: 11.6; y: 103.4; skew-x: 35.5; skew-y: 35.5; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: -0.3; y: 87.4; skew-x: 53.1; skew-y: 53.2; scale-x: 0.791; scale-y: 0.791; }
        frame 64 { x: -12.1; y: 72.9; skew-x: 70.7; skew-y: 70.9; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -24; y: 60.1; skew-x: 88.3; skew-y: 88.5; }
        frame 66 { x: -21.8; y: 52.4; skew-x: 109.8; skew-y: 109.8; scale-x: 0.79; scale-y: 0.79; }
        frame 67 { x: -21.5; y: 46.1; skew-x: 131.1; skew-y: 131.4; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: -23.3; y: 40.8; skew-x: 152.7; skew-y: 152.9; scale-x: 0.791; scale-y: 0.791; }
        frame 69 { x: -30.5; y: 33.2; skew-x: 158.4; skew-y: 158.7; scale-x: 0.79; scale-y: 0.79; }
        frame 70 { x: -37.9; y: 25.8; skew-x: 164; skew-y: 164.2; scale-x: 0.789; scale-y: 0.789; }
        frame 71 { x: -45.3; y: 18.1; skew-x: 169.6; skew-y: 169.8; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -56.7; y: 11.8; skew-x: 161.4; skew-y: 161.7; scale-x: 0.788; scale-y: 0.788; }
        frame 73 { x: -68.3; y: 5.4; skew-x: 153.2; skew-y: 153.4; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -80.3; y: -0.9; skew-x: 145; skew-y: 145.2; }
        frame 75 { x: -83.4; y: 2.9; skew-x: 124.6; skew-y: 124.6; scale-x: 0.786; scale-y: 0.786; }
        frame 76 { x: -88.3; y: 7.9; skew-x: 104; skew-y: 104.1; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -94.5; y: 14.4; skew-x: 83.7; skew-y: 83.7; scale-x: 0.785; scale-y: 0.785; }
        frame 78 { x: -101.5; y: 22.9; skew-x: 63; skew-y: 63.2; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: -97.7; y: 42.5; skew-x: 47.7; skew-y: 47.9; scale-x: 0.782; scale-y: 0.782; }
        frame 80 { x: -93.5; y: 63.1; skew-x: 32.4; skew-y: 32.6; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -93.7; y: 71.7; skew-x: 28.6; skew-y: 28.8; scale-x: 0.781; scale-y: 0.78; }
        frame 82 { x: -94.1; y: 80.2; skew-x: 24.9; skew-y: 25.1; scale-x: -10000; scale-y: 0.781; }
        frame 83 { x: -91.9; y: 88.6; skew-x: 19.8; skew-y: 20; scale-x: 0.784; scale-y: 0.784; }
        frame 84 { x: -89.7; y: 97; skew-x: 14.8; skew-y: 15; scale-x: 0.788; scale-y: 0.788; }
        frame 85 { x: -86.1; y: 109.9; skew-x: 7.3; skew-y: 7.5; scale-x: 0.794; scale-y: 0.794; }
        frame 86 { x: -82.6; y: 121; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -82.9; y: 121.3; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: -83.3; y: 121.6; skew-x: -7.2; skew-y: -7.2; }
        frame 89 { x: -83.2; y: 121.5; skew-x: -5.2; skew-y: -5.2; scale-x: 0.799; scale-y: 0.799; }
        frame 90 { x: -82.9; y: 121.2; skew-x: -3.4; skew-y: -3.4; scale-x: 0.8; scale-y: 0.8; }
        frame 91 { x: -82.8; y: 121.1; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: -82.6; y: 121; skew-x: 0; skew-y: 0; }
        frame 93 { x: 66.6; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 94 { x: 66; y: 121.4; skew-x: -2.7; skew-y: -2.7; }
        frame 95 { x: 65.3; y: 121.9; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 96 { x: 64.7; y: 122.3; skew-x: -8.4; skew-y: -8.4; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 64.1; y: 122.8; skew-x: -11.4; skew-y: -11.4; }
        frame 98 { x: 61.9; y: 123.2; skew-x: -14.9; skew-y: -14.9; scale-x: 0.798; scale-y: 0.798; }
        frame 99 { x: 59.8; y: 123.4; skew-x: -18.4; skew-y: -18.4; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 57.6; y: 123.8; skew-x: -21.9; skew-y: -21.9; scale-x: 0.797; scale-y: 0.797; }
        frame 101 { x: 55.6; y: 124.1; skew-x: -25.5; skew-y: -25.5; scale-x: 0.798; scale-y: 0.798; }
        frame 102 { x: 53.5; y: 124; skew-x: -24.2; skew-y: -24.2; scale-x: 0.797; scale-y: 0.797; }
        frame 103 { x: 51.3; y: -10000; skew-x: -23; skew-y: -23; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 49; y: 124.1; skew-x: -21.9; skew-y: -21.9; }
        frame 105 { x: 46.8; y: 124; skew-x: -20.7; skew-y: -20.7; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 43.5; y: 123.4; skew-x: -17.2; skew-y: -17.2; scale-x: 0.797; scale-y: 0.797; }
        frame 107 { x: 40.3; y: 122.8; skew-x: -13.5; skew-y: -13.5; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 37; y: 122.3; skew-x: -9.9; skew-y: -9.9; }
        frame 109 { x: 33.9; y: 121.7; skew-x: -6.5; skew-y: -6.5; }
        frame 110 { x: 37; y: 120.8; skew-x: -1.9; skew-y: -1.9; scale-x: 0.796; scale-y: 0.796; }
        frame 111 { x: 40.2; y: 120; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 43.5; y: 119.2; skew-x: 6.8; skew-y: 6.8; }
        frame 113 { x: 46.9; y: 118.4; skew-x: 11.3; skew-y: 11.3; }
        frame 114 { x: 48.6; y: 118.7; skew-x: 9; skew-y: 9; scale-x: 0.795; scale-y: 0.795; }
        frame 115 { x: 50.2; y: 119.2; skew-x: 6.6; skew-y: 6.6; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: 51.9; y: 119.6; skew-x: 4.3; skew-y: 4.3; }
        frame 117 { x: 53.6; y: 119.8; skew-x: 2; skew-y: 2; }
        frame 118 { x: 55.9; y: 120.3; skew-x: 0.5; skew-y: 0.5; }
        frame 119 { x: 58.1; y: 120.6; skew-x: -0.7; skew-y: -0.7; }
        frame 120 { x: 60.5; y: 121.1; skew-x: -2.2; skew-y: -2.2; }
        frame 121 { x: 62.7; y: 121.5; skew-x: -3.7; skew-y: -3.7; }
        frame 122 { x: 64.6; y: 121.9; skew-x: -6.5; skew-y: -6.5; }
        frame 123 { x: 66.4; y: 122.5; skew-x: -9.4; skew-y: -9.4; scale-x: 0.794; scale-y: 0.794; }
        frame 124 { x: 68.2; y: 123; skew-x: -12.4; skew-y: -12.4; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: 70.2; y: 123.6; skew-x: -15.4; skew-y: -15.4; scale-x: 0.795; scale-y: 0.795; }
        frame 126 { x: 71.8; y: 123.8; skew-x: -18; skew-y: -18; scale-x: 0.794; scale-y: 0.794; }
        frame 127 { x: 73.4; y: 124; skew-x: -20.7; skew-y: -20.7; scale-x: 0.793; scale-y: 0.793; }
        frame 128 { x: 75.1; y: 124.2; skew-x: -23.5; skew-y: -23.5; scale-x: -10000; scale-y: -10000; }
        frame 129 { x: 76.8; y: 124.4; skew-x: -26.2; skew-y: -26.2; scale-x: 0.794; scale-y: 0.794; }
        frame 130 { x: 76.6; y: 125.8; skew-x: -31.5; skew-y: -31.5; scale-x: 0.793; scale-y: 0.793; }
        frame 131 { x: -10000; y: 127.1; skew-x: -37; skew-y: -37; scale-x: 0.792; scale-y: 0.792; }
        frame 132 { x: 76.8; y: 128.5; skew-x: -42.5; skew-y: -42.5; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 77.1; y: 129.7; skew-x: -47.8; skew-y: -47.8; scale-x: 0.793; scale-y: 0.793; }
        frame 134 { x: 73.3; y: 127.5; skew-x: -35.8; skew-y: -35.8; scale-x: 0.794; scale-y: 0.794; }
        frame 135 { x: 70.3; y: 125.3; skew-x: -23.7; skew-y: -23.7; scale-x: 0.796; scale-y: 0.796; }
        frame 136 { x: 68.2; y: 123; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 137 { x: 66.6; y: 121; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 66.7; y: 118.9; skew-x: -9.7; skew-y: -9.7; scale-x: 0.799; scale-y: 0.799; }
        frame 140 { x: 67.1; y: 117; skew-x: -19.4; skew-y: -19.4; scale-x: 0.798; scale-y: 0.798; }
        frame 141 { x: 67.9; y: 115.2; skew-x: -29.3; skew-y: -29.3; scale-x: 0.799; scale-y: 0.799; }
        frame 142 { x: 72.3; y: 113.2; skew-x: -46.3; skew-y: -46.3; scale-x: 0.797; scale-y: 0.797; }
        frame 143 { x: 78.2; y: 110.7; skew-x: -63.3; skew-y: -63.3; scale-x: 0.796; scale-y: 0.796; }
        frame 144 { x: 85.2; y: 107.3; skew-x: -80.1; skew-y: -80.1; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 83.9; y: 100.1; skew-x: -98.9; skew-y: -98.9; scale-x: 0.795; scale-y: 0.795; }
        frame 146 { x: 83.3; y: 90.9; skew-x: -117.7; skew-y: -117.7; scale-x: 0.794; scale-y: 0.794; }
        frame 147 { x: 82.7; y: 80.1; skew-x: -136.6; skew-y: -136.6; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 75.8; y: 75.1; skew-x: -148.1; skew-y: -148.1; scale-x: 0.792; scale-y: 0.792; }
        frame 149 { x: 68.7; y: 69.5; skew-x: -159.6; skew-y: -159.6; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 61; y: 63.4; skew-x: -171; skew-y: -171; scale-x: 0.793; scale-y: 0.793; }
        frame 151 { x: 56.6; y: 62.9; skew-x: -179.1; skew-y: -179.1; scale-x: 0.792; scale-y: 0.792; }
        frame 152 { x: 52; y: 62.4; skew-x: -186.9; skew-y: -186.9; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 47.1; y: 61.6; skew-x: -195.1; skew-y: -195.1; }
        frame 154 { x: 53.5; y: 92; skew-x: -172.6; skew-y: -172.6; scale-x: 0.791; scale-y: 0.791; }
        frame 155 { x: 57.9; y: 120.8; skew-x: -150.1; skew-y: -150.1; scale-x: 0.789; scale-y: 0.789; }
        frame 156 { x: 61; y: 147.2; skew-x: -127.6; skew-y: -127.6; scale-x: 0.79; scale-y: 0.79; }
        frame 157 { x: 62.5; y: 146.6; skew-x: -129; skew-y: -126; scale-x: 0.78; scale-y: 0.791; }
        frame 158 { x: 64; y: 146.1; skew-x: -130.6; skew-y: -124.5; scale-x: 0.773; scale-y: 0.795; }
        frame 159 { x: 63.5; y: 144.5; skew-x: -131.8; skew-y: -127.7; scale-x: 0.777; scale-y: 0.791; }
        frame 160 { x: 63.1; y: 142.7; skew-x: -133; skew-y: -130.8; scale-x: 0.782; scale-y: 0.789; }
        frame 161 { x: 62.7; y: 141; skew-x: -134.1; skew-y: -134.1; scale-x: 0.788; scale-y: 0.788; }
        frame 162 { x: 63.1; y: 142.8; skew-x: -133; skew-y: -130.8; scale-x: 0.782; scale-y: 0.789; }
        frame 163 { x: 63.5; y: 144.5; skew-x: -131.8; skew-y: -127.7; scale-x: 0.777; scale-y: 0.791; }
        frame 164 { x: 64; y: 146.1; skew-x: -130.6; skew-y: -124.5; scale-x: 0.773; scale-y: 0.795; }
        frame 165 { x: 66.6; y: 121; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 166 { x: 66.5; y: 121.1; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 66.3; y: 121.3; skew-x: -1.4; skew-y: -1.4; }
        frame 168 { x: -10000; y: 121.4; skew-x: -2.2; skew-y: -2.2; }
        frame 169 { x: 66.2; y: 121.5; skew-x: -2.9; skew-y: -2.9; }
        frame 170 { x: 66.1; y: 121.7; skew-x: -3.7; skew-y: -3.7; }
        frame 171 { x: 65.9; y: 122.1; skew-x: -4.7; skew-y: -4.7; }
        frame 172 { x: 65.8; y: 122; skew-x: -10000; skew-y: -10000; }
        frame 173 { x: -10000; y: -10000; }
        frame 174 { x: 65.9; y: 122.1; }
        frame 175 { x: 65.8; y: 122; }
        frame 176 { x: -10000; y: -10000; }
        frame 177 { x: 65.9; y: 122.1; }
        frame 178 { x: 66; y: 121.8; skew-x: -3.7; skew-y: -3.7; }
        frame 179 { x: 66.1; y: 121.6; skew-x: -2.9; skew-y: -2.9; }
        frame 180 { x: 66.3; y: 121.4; skew-x: -2.2; skew-y: -2.2; }
        frame 181 { x: 66.2; y: 121.5; skew-x: -2.9; skew-y: -2.9; }
        frame 182 { x: 66.1; y: 121.7; skew-x: -3.7; skew-y: -3.7; }
        frame 183 { x: 65.9; y: 122.1; skew-x: -4.7; skew-y: -4.7; }
        frame 184 { x: 65.8; y: 122; skew-x: -10000; skew-y: -10000; }
        frame 185 { x: -10000; y: -10000; }
        frame 186 { x: 65.9; y: 122.1; }
        frame 187 { x: 65.8; y: 122; }
        frame 188 { x: -10000; y: -10000; }
        frame 189 { x: 65.9; y: 122.1; }
        frame 190 { x: 66.1; y: 121.6; skew-x: -3; skew-y: -3; }
        frame 191 { x: 66.3; y: 121.3; skew-x: -1.4; skew-y: -1.4; }
        frame 192 { x: 66.6; y: 121; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_polevaulter_outerleg_toe";
        frame-count: 193;
        frame 0 { x: 56.1; y: 122; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_OUTERLEG_TOE; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 13 { x: 56.9; y: 117.2; skew-x: -11.5; skew-y: -11.5; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 54.1; y: 116.1; skew-x: -6.7; skew-y: -6.7; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 51.1; y: 115.1; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 48.5; y: 114.1; skew-x: 2.5; skew-y: 2.5; scale-x: 0.797; scale-y: 0.797; }
        frame 17 { x: 43.5; y: 110.9; skew-x: 9; skew-y: 9; scale-x: 0.796; scale-y: 0.796; }
        frame 18 { x: 38.6; y: 108; skew-x: 15.5; skew-y: 15.5; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 33.9; y: 105.1; skew-x: 22; skew-y: 22; scale-x: 0.797; scale-y: 0.797; }
        frame 20 { x: 31.7; y: 104.2; skew-x: 20.8; skew-y: 20.8; scale-x: 0.796; scale-y: 0.796; }
        frame 21 { x: 29.5; y: 103.3; skew-x: 19.8; skew-y: 19.8; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 27.3; y: 102.3; skew-x: 18.7; skew-y: 18.7; scale-x: 0.797; scale-y: 0.797; }
        frame 23 { x: 28.1; y: 103.5; skew-x: 28.3; skew-y: 28.3; scale-x: 0.795; scale-y: 0.795; }
        frame 24 { x: 29.4; y: 105.1; skew-x: 37.8; skew-y: 37.8; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 30.7; y: 106.9; skew-x: 47.3; skew-y: 47.3; scale-x: 0.796; scale-y: 0.796; }
        frame 26 { x: 28.3; y: 111.3; skew-x: 33.8; skew-y: 33.8; scale-x: 0.793; scale-y: 0.793; }
        frame 27 { x: 26.3; y: 116.4; skew-x: 20.3; skew-y: 20.3; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 25; y: 122.1; skew-x: 7; skew-y: 7; }
        frame 29 { x: 28.8; y: -10000; skew-x: 6.8; skew-y: 6.8; scale-x: 0.792; scale-y: 0.792; }
        frame 30 { x: 32.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 36.3; skew-x: 7; skew-y: 7; scale-x: 0.793; scale-y: 0.793; }
        frame 32 { x: 38.7; skew-x: 6.8; skew-y: 6.8; scale-x: 0.792; scale-y: 0.792; }
        frame 33 { x: 41.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 43.8; skew-x: 7; skew-y: 7; scale-x: 0.793; scale-y: 0.793; }
        frame 35 { x: 49; y: 122.5; skew-x: 4; skew-y: 4; scale-x: 0.792; scale-y: 0.792; }
        frame 36 { x: 54.3; y: 122.9; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 59.6; y: 123.4; skew-x: -1.5; skew-y: -1.5; scale-x: 0.791; scale-y: 0.791; }
        frame 38 { x: 63.4; y: 122.1; skew-x: -11.7; skew-y: -11.7; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 67.5; y: 120.8; skew-x: -22; skew-y: -22; scale-x: 0.79; scale-y: 0.79; }
        frame 40 { x: 72.2; y: 119.8; skew-x: -32.3; skew-y: -32.3; scale-x: 0.791; scale-y: 0.791; }
        frame 41 { x: 75.9; y: 123.7; skew-x: -43; skew-y: -43; scale-x: 0.789; scale-y: 0.789; }
        frame 42 { x: 80; y: 127.4; skew-x: -53.6; skew-y: -53.6; scale-x: 0.788; scale-y: 0.788; }
        frame 43 { x: 84.7; y: 130.8; skew-x: -64.2; skew-y: -64.2; scale-x: 0.789; scale-y: 0.789; }
        frame 44 { x: 81.4; y: 130.4; skew-x: -59.6; skew-y: -59.6; scale-x: 0.787; scale-y: 0.787; }
        frame 45 { x: 78.1; y: 129.9; skew-x: -55.1; skew-y: -55.1; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 74.9; y: 129.3; skew-x: -50.5; skew-y: -50.5; }
        frame 47 { x: 68.1; y: 125.3; skew-x: -37.5; skew-y: -37.5; scale-x: 0.79; scale-y: 0.79; }
        frame 48 { x: 62.1; y: 121.2; skew-x: -24.5; skew-y: -24.5; scale-x: 0.794; scale-y: 0.794; }
        frame 49 { x: 56.9; y: 117.2; skew-x: -11.5; skew-y: -11.5; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: 57.9; y: 121.2; skew-x: 3; skew-y: 3; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: -10000; y: 121.3; skew-x: 2.8; skew-y: 2.8; }
        frame 52 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 54 { y: 121.2; skew-x: 3; skew-y: 3; }
        frame 55 { x: 57.1; y: 118.9; skew-x: -8.2; skew-y: -8.2; scale-x: 0.798; scale-y: 0.798; }
        frame 56 { x: 56.9; y: 116.8; skew-x: -19.7; skew-y: -19.7; scale-x: 0.797; scale-y: 0.797; }
        frame 57 { x: 57.1; y: 114.9; skew-x: -31.3; skew-y: -31.3; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 54.3; y: -10000; skew-x: -31.2; skew-y: -31.2; scale-x: 0.796; scale-y: 0.796; }
        frame 59 { x: 51.5; skew-x: -31.3; skew-y: -31.3; scale-x: 0.797; scale-y: 0.797; }
        frame 60 { x: 32.8; y: 108.5; skew-x: -3.2; skew-y: -3.2; scale-x: 0.796; scale-y: 0.796; }
        frame 61 { x: 21.3; y: 102.2; skew-x: 24.8; skew-y: 24.8; scale-x: 0.794; scale-y: 0.794; }
        frame 62 { x: 11.8; y: 98.6; skew-x: 52.9; skew-y: 52.9; scale-x: 0.793; scale-y: -10000; }
        frame 63 { x: 1.6; y: 84.3; skew-x: 70.7; skew-y: 70.7; scale-x: 0.792; scale-y: 0.793; }
        frame 64 { x: -8.6; y: 71.3; skew-x: 88.5; skew-y: 88.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -19.8; y: 59.6; skew-x: 106.1; skew-y: 106.1; scale-y: 0.792; }
        frame 66 { x: -16.5; y: 52.6; skew-x: 127.4; skew-y: 127.6; scale-x: 0.79; scale-y: 0.791; }
        frame 67 { x: -15.1; y: 46.6; skew-x: 148.9; skew-y: 148.9; scale-x: -10000; scale-y: 0.792; }
        frame 68 { x: -15.5; y: 40.4; skew-x: 170.2; skew-y: 170.4; scale-x: 0.791; scale-y: 0.793; }
        frame 69 { x: -22.8; y: 33.7; skew-x: 176; skew-y: 176.2; scale-x: 0.79; scale-y: 0.792; }
        frame 70 { x: -30.2; y: 26.8; skew-x: 181.3; skew-y: 181.5; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -37.8; y: 20; skew-x: 187.1; skew-y: 187.3; scale-x: 0.789; scale-y: 0.791; }
        frame 72 { x: -49.2; y: 12.7; skew-x: 179; skew-y: 179.2; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: -60.8; y: 5.2; skew-x: 170.7; skew-y: 171; scale-x: 0.788; scale-y: 0.79; }
        frame 74 { x: -72.6; y: -2.3; skew-x: 162.5; skew-y: 162.7; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -77.5; y: 0.9; skew-x: 142.1; skew-y: 142.2; scale-x: 0.786; scale-y: 0.788; }
        frame 76 { x: -84.1; y: 4.6; skew-x: 121.6; skew-y: 121.6; scale-x: 0.785; scale-y: 0.787; }
        frame 77 { x: -92.4; y: 9.2; skew-x: 101; skew-y: 101.1; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: -101.7; y: 15.2; skew-x: 80.6; skew-y: 80.8; scale-y: 0.786; }
        frame 79 { x: -99.6; y: 35.4; skew-x: 65.4; skew-y: 65.5; scale-x: 0.782; scale-y: 0.784; }
        frame 80 { x: -97.6; y: 56.6; skew-x: 49.9; skew-y: 50.1; scale-x: -10000; scale-y: 0.783; }
        frame 81 { x: -98.3; y: 65.3; skew-x: 46.1; skew-y: 46.4; scale-x: 0.78; scale-y: 0.782; }
        frame 82 { x: -99; y: 74.2; skew-x: 42.4; skew-y: 42.6; scale-x: 0.781; scale-y: 0.783; }
        frame 83 { x: -97.6; y: 83.3; skew-x: 33.8; skew-y: 34.1; scale-x: 0.783; scale-y: 0.785; }
        frame 84 { x: -96.2; y: 92.5; skew-x: 25.3; skew-y: 25.5; scale-x: 0.788; scale-y: 0.789; }
        frame 85 { x: -93.7; y: 107.1; skew-x: 12.6; skew-y: 12.8; scale-x: 0.793; scale-y: 0.794; }
        frame 86 { x: -90.8; y: 122; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 58.5; }
        frame 94 { x: 58.1; }
        frame 95 { x: 57.8; }
        frame 96 { x: 57.5; }
        frame 97 { x: 57.1; }
        frame 98 { x: 54.9; y: 122.6; skew-x: -3.4; skew-y: -3.4; }
        frame 99 { x: 52.9; y: 123.4; skew-x: -6.9; skew-y: -6.9; scale-x: 0.799; scale-y: 0.799; }
        frame 100 { x: 50.7; y: 124.2; skew-x: -10.4; skew-y: -10.4; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 48.7; y: 124.9; skew-x: -14; skew-y: -14; }
        frame 102 { x: 46.8; y: -10000; skew-x: -13.9; skew-y: -13.9; }
        frame 103 { x: 44.9; skew-x: -10000; skew-y: -10000; }
        frame 104 { x: 43; }
        frame 105 { x: 41; skew-x: -14; skew-y: -14; }
        frame 106 { x: 37.8; y: 123.7; skew-x: -9.7; skew-y: -9.7; }
        frame 107 { x: 34.6; y: 122.6; skew-x: -5.4; skew-y: -5.4; scale-x: 0.798; scale-y: 0.798; }
        frame 108 { x: 31.5; y: 121.4; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: 28.5; y: 120.4; skew-x: 3; skew-y: 3; }
        frame 110 { x: 30.8; y: 120.5; skew-x: -10000; skew-y: -10000; }
        frame 111 { x: 33; y: -10000; skew-x: 3.3; skew-y: 3.3; }
        frame 112 { x: 35.1; y: 120.6; skew-x: 3.5; skew-y: 3.5; scale-x: 0.797; scale-y: 0.797; }
        frame 113 { x: 37.4; y: 120.7; skew-x: 3.7; skew-y: 3.7; scale-x: -10000; scale-y: -10000; }
        frame 114 { x: 39.1; y: -10000; skew-x: 3.6; skew-y: 3.6; }
        frame 115 { x: 41; skew-x: -10000; skew-y: -10000; }
        frame 116 { x: 42.8; }
        frame 117 { x: 44.6; skew-x: 3.7; skew-y: 3.7; }
        frame 118 { x: 47.1; y: 120.8; skew-x: 3.5; skew-y: 3.5; }
        frame 119 { x: 49.5; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 120 { x: 51.9; y: 120.7; }
        frame 121 { x: 54.2; y: -10000; skew-x: 3.6; skew-y: 3.6; }
        frame 122 { x: 56.1; skew-x: 3.5; skew-y: 3.5; }
        frame 123 { x: 58; skew-x: -10000; skew-y: -10000; }
        frame 124 { x: 59.9; }
        frame 125 { x: 61.8; skew-x: 3.6; skew-y: 3.6; }
        frame 126 { x: 63.8; skew-x: 3.5; skew-y: 3.5; }
        frame 127 { x: 65.7; skew-x: -10000; skew-y: -10000; }
        frame 128 { x: 67.6; }
        frame 129 { x: 69.4; skew-x: 3.6; skew-y: 3.6; }
        frame 130 { x: 69.3; y: 121.1; skew-x: 1.5; skew-y: 1.5; }
        frame 131 { x: 69.1; y: 121.5; skew-x: -0.2; skew-y: -0.2; }
        frame 132 { x: 69; y: 122; skew-x: -2.2; skew-y: -2.2; }
        frame 133 { x: 68.9; y: 122.4; skew-x: -4.2; skew-y: -4.2; }
        frame 134 { x: 66.3; y: 122.2; skew-x: -3; skew-y: -3; }
        frame 135 { x: 63.8; y: -10000; skew-x: -1.9; skew-y: -1.9; scale-x: 0.798; scale-y: 0.798; }
        frame 136 { x: 61.1; skew-x: -0.9; skew-y: -0.9; scale-x: 0.799; scale-y: 0.799; }
        frame 137 { x: 58.5; y: 122; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 59; y: 121.2; skew-x: -9.7; skew-y: -9.7; scale-x: 0.799; scale-y: 0.799; }
        frame 140 { x: 60; y: 120.6; skew-x: -19.4; skew-y: -19.4; scale-x: 0.798; scale-y: 0.798; }
        frame 141 { x: 61.4; y: 120; skew-x: -29.3; skew-y: -29.3; scale-x: 0.799; scale-y: 0.799; }
        frame 142 { x: 68.5; y: 119.8; skew-x: -49.5; skew-y: -49.5; scale-x: 0.797; scale-y: 0.797; }
        frame 143 { x: 77.4; y: 118.9; skew-x: -69.8; skew-y: -69.8; scale-x: 0.796; scale-y: 0.796; }
        frame 144 { x: 87.5; y: 116.9; skew-x: -89.9; skew-y: -89.9; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 88.8; y: 107; skew-x: -109.2; skew-y: -109.2; scale-x: 0.794; scale-y: 0.794; }
        frame 146 { x: 90.5; y: 95.6; skew-x: -128.5; skew-y: -128.5; scale-x: 0.793; scale-y: 0.793; }
        frame 147 { x: 91.9; y: 82.6; skew-x: -147.7; skew-y: -147.7; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 84.9; y: 75.6; skew-x: -159.1; skew-y: -159.1; scale-x: 0.791; scale-y: 0.791; }
        frame 149 { x: 77.7; y: 68.1; skew-x: -170.6; skew-y: -170.6; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 69.9; y: 60.1; skew-x: -182; skew-y: -182; }
        frame 151 { x: 64.8; y: 58.6; skew-x: -189.9; skew-y: -189.9; }
        frame 152 { x: 59.6; y: 56.8; skew-x: -198; skew-y: -198; scale-x: 0.79; scale-y: 0.79; }
        frame 153 { x: 54; y: 55; skew-x: -206.1; skew-y: -206.1; scale-x: -10000; scale-y: -10000; }
        frame 154 { x: 61; y: 88; skew-x: -184; skew-y: -184; scale-x: 0.789; scale-y: 0.789; }
        frame 155 { x: 66; y: 119.9; skew-x: -162.3; skew-y: -162.3; scale-x: 0.788; scale-y: 0.788; }
        frame 156 { x: 69.6; y: 150.3; skew-x: -140.2; skew-y: -140.2; scale-x: 0.787; scale-y: 0.787; }
        frame 157 { x: 71.2; y: 149.8; skew-x: -141.8; skew-y: -138.8; scale-x: -10000; scale-y: 0.779; }
        frame 158 { x: 72.9; y: 149.2; skew-x: -143.3; skew-y: -137.1; scale-x: 0.79; scale-y: 0.774; }
        frame 159 { x: 72.5; y: 147.1; skew-x: -144.5; skew-y: -140.3; scale-x: 0.787; scale-y: 0.776; }
        frame 160 { x: 72; y: 145.2; skew-x: -145.8; skew-y: -143.6; scale-x: 0.786; scale-y: 0.78; }
        frame 161 { x: 71.6; y: 143.2; skew-x: -146.8; skew-y: -146.8; scale-x: -10000; scale-y: 0.786; }
        frame 162 { x: 72; y: 145.1; skew-x: -145.8; skew-y: -143.6; scale-y: 0.78; }
        frame 163 { x: 72.5; y: 147.2; skew-x: -144.5; skew-y: -140.3; scale-x: 0.787; scale-y: 0.776; }
        frame 164 { x: 72.9; y: 149.2; skew-x: -143.3; skew-y: -137.1; scale-x: 0.79; scale-y: 0.774; }
        frame 165 { x: 58.5; y: 122; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 166 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_polevaulter_outerleg_lower";
        frame-count: 193;
        frame 0 { x: 68.7; y: 99.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_OUTERLEG_LOWER; }
        frame 1 { x: 68.1; y: 99.8; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 67.5; y: 100.1; skew-x: -2.9; skew-y: -2.9; }
        frame 3 { x: 66.9; y: 100.4; skew-x: -4.5; skew-y: -4.5; }
        frame 4 { x: 66.3; y: 100.7; skew-x: -6.2; skew-y: -6.2; }
        frame 5 { x: 65.7; y: 101; skew-x: -7.7; skew-y: -7.7; scale-x: 0.799; scale-y: 0.799; }
        frame 6 { x: 65.2; y: 101.3; skew-x: -9.3; skew-y: -9.3; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { x: 65.8; y: 101; skew-x: -7.7; skew-y: -7.7; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 66.3; y: 100.6; skew-x: -6.2; skew-y: -6.2; scale-x: 0.8; scale-y: 0.8; }
        frame 9 { x: 67; y: 100.2; skew-x: -4.5; skew-y: -4.5; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 67.6; y: 100; skew-x: -2.9; skew-y: -2.9; }
        frame 11 { x: 68.2; y: 99.7; skew-x: -1.4; skew-y: -1.4; }
        frame 12 { x: 68.7; y: 99.5; skew-x: 0; skew-y: 0; }
        frame 13 { x: 63.6; y: 94.7; skew-x: -22.7; skew-y: -22.7; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 62.7; y: 94; skew-x: -17.4; skew-y: -17.4; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 61.9; y: 93.5; skew-x: -12.2; skew-y: -12.2; scale-x: 0.797; scale-y: 0.797; }
        frame 16 { x: 61.1; y: 93; skew-x: -7.1; skew-y: -7.1; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 58.6; y: 91.3; skew-x: 0.6; skew-y: 0.6; }
        frame 18 { x: 56.3; y: 89.9; skew-x: 8.5; skew-y: 8.5; scale-x: 0.796; scale-y: 0.796; }
        frame 19 { x: 54.1; y: 88.9; skew-x: 16.6; skew-y: 16.6; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 53.6; y: 87.1; skew-x: 19.1; skew-y: 19.1; }
        frame 21 { x: 53.1; y: 85.4; skew-x: 21.8; skew-y: 21.8; scale-x: 0.795; scale-y: 0.795; }
        frame 22 { x: 52.5; y: 83.5; skew-x: 24.6; skew-y: 24.6; scale-x: 0.796; scale-y: 0.796; }
        frame 23 { x: 52; y: 87.8; skew-x: 28.3; skew-y: 28.3; scale-x: 0.795; scale-y: 0.795; }
        frame 24 { x: 51.6; y: 92; skew-x: 31.9; skew-y: 31.9; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 51.2; y: 96.4; skew-x: 35.6; skew-y: 35.6; scale-x: 0.796; scale-y: 0.796; }
        frame 26 { x: 48.2; y: 98.4; skew-x: 25.8; skew-y: 25.8; scale-x: 0.794; scale-y: 0.794; }
        frame 27 { x: 45.4; y: 100.7; skew-x: 16.3; skew-y: 16.3; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 42.8; y: 103.5; skew-x: 6.6; skew-y: 6.6; }
        frame 29 { x: 46.4; y: 103; skew-x: 6.8; skew-y: 6.8; scale-x: 0.793; scale-y: 0.793; }
        frame 30 { x: 49.7; y: 102.5; skew-x: 7; skew-y: 7; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 53.3; y: 102; skew-x: 7.3; skew-y: 7.3; }
        frame 32 { x: 54.3; y: 102.4; skew-x: 3.3; skew-y: 3.3; }
        frame 33 { x: 55.2; y: 102.8; skew-x: -0.4; skew-y: -0.4; }
        frame 34 { x: 56.3; y: 103.4; skew-x: -4.4; skew-y: -4.4; }
        frame 35 { x: 59.1; y: 103.6; skew-x: -10.9; skew-y: -10.9; scale-x: 0.792; scale-y: 0.792; }
        frame 36 { x: 62.1; y: 103.8; skew-x: -17.5; skew-y: -17.5; scale-x: 0.791; scale-y: 0.791; }
        frame 37 { x: 65.2; y: 104.2; skew-x: -24.2; skew-y: -24.2; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 67.1; y: 100.3; skew-x: -26.5; skew-y: -26.5; scale-x: 0.79; scale-y: 0.79; }
        frame 39 { x: 68.8; y: 96.2; skew-x: -29; skew-y: -29; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 70.6; y: 92.3; skew-x: -31.6; skew-y: -31.6; }
        frame 41 { x: 70.2; y: 96.9; skew-x: -40.2; skew-y: -40.2; scale-x: 0.789; scale-y: 0.789; }
        frame 42 { x: 70.1; y: 101.6; skew-x: -48.8; skew-y: -48.8; scale-x: 0.788; scale-y: 0.788; }
        frame 43 { x: 70.3; y: 106.3; skew-x: -57.4; skew-y: -57.4; scale-x: 0.789; scale-y: 0.789; }
        frame 44 { x: 68.8; y: 107.2; skew-x: -58.3; skew-y: -58.3; scale-x: 0.787; scale-y: 0.787; }
        frame 45 { x: 67.3; y: 108.1; skew-x: -59.3; skew-y: -59.3; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 66; y: 108.9; skew-x: -60.3; skew-y: -60.3; }
        frame 47 { x: 64.5; y: 104.2; skew-x: -47.8; skew-y: -47.8; scale-x: 0.79; scale-y: 0.79; }
        frame 48 { x: 63.6; y: 99.6; skew-x: -35.2; skew-y: -35.2; scale-x: 0.794; scale-y: 0.794; }
        frame 49 { x: -10000; y: 94.7; skew-x: -22.7; skew-y: -22.7; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: 68.8; y: 100.6; skew-x: -6.7; skew-y: -6.7; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { x: 67.3; y: 101.1; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 65.9; y: 101.6; skew-x: -13.2; skew-y: -13.2; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 64.5; y: 102.1; skew-x: -16.5; skew-y: -16.5; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 63; y: 102.7; skew-x: -19.9; skew-y: -19.9; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { x: 58.5; y: 100.6; skew-x: -31.5; skew-y: -31.5; scale-x: 0.796; scale-y: 0.796; }
        frame 56 { x: 54.6; y: 98.7; skew-x: -43; skew-y: -42.8; scale-x: 0.795; scale-y: -10000; }
        frame 57 { x: 51.3; y: 96.8; skew-x: -54.4; skew-y: -54.3; scale-x: -10000; scale-y: 0.797; }
        frame 58 { x: 47.5; y: -10000; skew-x: -54.3; skew-y: -10000; scale-x: 0.794; scale-y: 0.796; }
        frame 59 { x: 43.8; skew-x: -54.4; scale-x: 0.795; scale-y: 0.797; }
        frame 60 { x: 34.2; y: 92.5; skew-x: -26.2; skew-y: -26.2; scale-x: 0.793; scale-y: 0.795; }
        frame 61 { x: 28.1; y: 90; skew-x: 1.5; skew-y: 1.6; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 24.2; y: 90.3; skew-x: 29.6; skew-y: 29.8; scale-x: 0.792; scale-y: 0.793; }
        frame 63 { x: 18.4; y: 83.3; skew-x: 60.2; skew-y: 60.4; scale-x: 0.789; scale-y: 0.791; }
        frame 64 { x: 11.1; y: 80.3; skew-x: 90.5; skew-y: 90.8; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 0.5; y: 80.2; skew-x: 121.1; skew-y: 121.4; scale-x: 0.788; scale-y: 0.79; }
        frame 66 { x: -4.3; y: 73.5; skew-x: 129.8; skew-y: 130.1; scale-x: -10000; scale-y: 0.789; }
        frame 67 { x: -9.5; y: 66.8; skew-x: 138.4; skew-y: 138.7; scale-y: 0.79; }
        frame 68 { x: -15.1; y: 60.2; skew-x: 147.1; skew-y: 147.4; scale-x: 0.79; scale-y: 0.792; }
        frame 69 { x: -24.3; y: 53.2; skew-x: 152.7; skew-y: 153; scale-x: 0.789; scale-y: 0.79; }
        frame 70 { x: -33.7; y: 46.1; skew-x: 158.4; skew-y: 158.7; scale-x: 0.788; scale-y: 0.789; }
        frame 71 { x: -43.1; y: 38.9; skew-x: 164; skew-y: 164.2; scale-x: -10000; scale-y: 0.79; }
        frame 72 { x: -51.6; y: 31.7; skew-x: 155.9; skew-y: 156.2; scale-x: 0.787; scale-y: 0.788; }
        frame 73 { x: -60.5; y: 24.5; skew-x: 147.7; skew-y: 147.9; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -69.6; y: 16.9; skew-x: 139.4; skew-y: 139.7; scale-y: 0.789; }
        frame 75 { x: -70.2; y: 15.2; skew-x: 118.8; skew-y: 119.1; scale-x: 0.785; scale-y: 0.787; }
        frame 76 { x: -72.7; y: 13.9; skew-x: 98.3; skew-y: 98.6; scale-x: -10000; scale-y: 0.786; }
        frame 77 { x: -76.8; y: 13.6; skew-x: 78; skew-y: 78.2; scale-x: 0.784; scale-y: 0.785; }
        frame 78 { x: -82.2; y: 15; skew-x: 57.4; skew-y: 57.7; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: -87; y: 31.8; skew-x: 30.3; skew-y: 30.6; scale-x: 0.782; scale-y: 0.783; }
        frame 80 { x: -91.3; y: 52; skew-x: 3.5; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -92.4; y: 60.5; skew-x: -0.2; skew-y: 0; }
        frame 82 { x: -93.3; y: 68.9; skew-x: -4; skew-y: -3.7; }
        frame 83 { x: -90.4; y: 74.9; skew-x: -2.9; skew-y: -2.9; scale-x: 0.785; scale-y: 0.786; }
        frame 84 { x: -87.4; y: 81; skew-x: -2.2; skew-y: -2.2; scale-x: 0.789; scale-y: 0.79; }
        frame 85 { x: -82.8; y: 90.1; skew-x: -0.9; skew-y: -0.9; scale-x: 0.794; scale-y: 0.795; }
        frame 86 { x: -78.1; y: 99.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -80.3; y: 100.5; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 88 { x: -82.4; y: 101.7; skew-x: -11.2; skew-y: -11.2; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -81.3; y: 101.1; skew-x: -8.2; skew-y: -8.2; }
        frame 90 { x: -80.3; y: 100.6; skew-x: -5.4; skew-y: -5.4; }
        frame 91 { x: -79.1; y: 100; skew-x: -2.7; skew-y: -2.7; scale-x: 0.8; scale-y: 0.8; }
        frame 92 { x: -78.1; y: 99.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 71.2; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 94 { x: 70.1; y: 99.8; skew-x: -1.7; skew-y: -1.7; }
        frame 95 { x: 69.1; y: 100.1; skew-x: -3.4; skew-y: -3.4; }
        frame 96 { x: 68; y: 100.5; skew-x: -5.2; skew-y: -5.2; scale-x: 0.799; scale-y: 0.799; }
        frame 97 { x: 67; y: 100.8; skew-x: -7; skew-y: -7; scale-x: 0.8; scale-y: 0.8; }
        frame 98 { x: 63.9; y: 100; skew-x: -8.2; skew-y: -8.2; scale-x: 0.799; scale-y: 0.799; }
        frame 99 { x: 60.8; y: 99.3; skew-x: -9.7; skew-y: -9.7; scale-x: 0.798; scale-y: 0.798; }
        frame 100 { x: 57.9; y: 98.5; skew-x: -11; skew-y: -11; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 54.8; y: 97.9; skew-x: -12.4; skew-y: -12.4; }
        frame 102 { x: 54.6; y: 97; skew-x: -8.2; skew-y: -8.2; scale-x: 0.797; scale-y: 0.797; }
        frame 103 { x: 54.5; y: 96.1; skew-x: -4.2; skew-y: -4.2; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 54.3; y: 95.3; skew-x: 0; skew-y: 0; }
        frame 105 { x: 54.2; y: 94.6; skew-x: 4; skew-y: 4; }
        frame 106 { x: 53.4; y: 94.2; skew-x: 9.3; skew-y: 9.3; scale-x: 0.796; scale-y: 0.796; }
        frame 107 { x: 52.8; y: 94; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 52.1; y: 93.7; skew-x: 20.3; skew-y: 20.3; scale-x: 0.795; scale-y: 0.795; }
        frame 109 { x: 51.6; y: 93.6; skew-x: 25.9; skew-y: 25.9; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 49.9; y: 95.6; skew-x: 16.5; skew-y: 16.5; scale-x: 0.794; scale-y: 0.794; }
        frame 111 { x: 48.4; y: 98.1; skew-x: 7; skew-y: 7; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 47.1; y: 100.8; skew-x: -1.9; skew-y: -1.9; }
        frame 113 { x: 46; y: 103.9; skew-x: -11.4; skew-y: -11.4; scale-x: 0.793; scale-y: 0.793; }
        frame 114 { x: 47.9; y: 103.7; skew-x: -12; skew-y: -12; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 49.6; y: 103.6; skew-x: -12.7; skew-y: -12.7; scale-x: 0.792; scale-y: 0.792; }
        frame 116 { x: 51.4; y: 103.4; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 53.1; y: 103.3; skew-x: -14.1; skew-y: -14.1; }
        frame 118 { x: 55; y: 104.1; skew-x: -16; skew-y: -16; scale-x: 0.791; scale-y: 0.791; }
        frame 119 { x: 56.8; y: 104.8; skew-x: -18; skew-y: -18; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 58.6; y: 105.7; skew-x: -20.2; skew-y: -20.2; }
        frame 121 { x: 60.4; y: 106.5; skew-x: -22.2; skew-y: -22.2; }
        frame 122 { x: 61.9; y: 106.6; skew-x: -23.2; skew-y: -23.2; scale-x: 0.79; scale-y: 0.79; }
        frame 123 { x: 63.3; y: 106.7; skew-x: -24; skew-y: -24; scale-x: -10000; scale-y: -10000; }
        frame 124 { x: 64.8; y: 106.8; skew-x: -25; skew-y: -25; }
        frame 125 { x: 66.3; y: 106.9; skew-x: -25.9; skew-y: -25.9; }
        frame 126 { x: 67.2; y: 107.1; skew-x: -28.7; skew-y: -28.7; scale-x: 0.789; scale-y: 0.789; }
        frame 127 { x: 68; y: 107.3; skew-x: -31.5; skew-y: -31.5; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 68.9; y: 107.5; skew-x: -34.2; skew-y: -34.2; }
        frame 129 { x: 69.9; y: 107.8; skew-x: -37; skew-y: -37; scale-x: 0.79; scale-y: 0.79; }
        frame 130 { x: 68.8; y: 107.7; skew-x: -37.5; skew-y: -37.5; scale-x: 0.788; scale-y: 0.788; }
        frame 131 { x: 67.8; y: -10000; skew-x: -38.2; skew-y: -38.2; scale-x: -10000; scale-y: -10000; }
        frame 132 { x: 66.8; skew-x: -38.8; skew-y: -38.8; scale-x: 0.787; scale-y: 0.787; }
        frame 133 { x: 65.8; y: 107.6; skew-x: -39.5; skew-y: -39.5; scale-x: 0.788; scale-y: 0.788; }
        frame 134 { x: 66.6; y: 105.3; skew-x: -29.5; skew-y: -29.5; scale-x: 0.79; scale-y: 0.79; }
        frame 135 { x: 67.7; y: 103; skew-x: -19.7; skew-y: -19.7; scale-x: 0.793; scale-y: 0.793; }
        frame 136 { x: 69.3; y: 101; skew-x: -9.7; skew-y: -9.7; scale-x: 0.797; scale-y: 0.797; }
        frame 137 { x: 71.2; y: 99.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 67.8; y: 97; skew-x: -8.7; skew-y: -8.7; scale-x: 0.799; scale-y: 0.799; }
        frame 140 { x: 64.9; y: 94.8; skew-x: -17.4; skew-y: -17.4; scale-x: 0.798; scale-y: 0.798; }
        frame 141 { x: 62.3; y: 92.9; skew-x: -26.3; skew-y: -26.3; scale-x: 0.799; scale-y: 0.799; }
        frame 142 { x: 61.6; y: 92; skew-x: -38.5; skew-y: -38.5; scale-x: 0.797; scale-y: 0.797; }
        frame 143 { x: 61.5; y: 91.2; skew-x: -50.5; skew-y: -50.5; scale-x: 0.796; scale-y: 0.796; }
        frame 144 { x: 62.1; y: 90.4; skew-x: -62.6; skew-y: -62.6; scale-x: 0.797; scale-y: 0.797; }
        frame 145 { x: 57.8; y: 90; skew-x: -77.4; skew-y: -77.4; scale-x: 0.796; scale-y: 0.796; }
        frame 146 { x: 54.3; y: 89; skew-x: -91.9; skew-y: -91.9; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 51.6; y: 87.4; skew-x: -106.8; skew-y: -106.8; scale-x: 0.795; scale-y: 0.795; }
        frame 148 { x: 45.6; y: 87.3; skew-x: -115; skew-y: -115; scale-x: 0.794; scale-y: 0.794; }
        frame 149 { x: 39.8; y: 86.9; skew-x: -123.3; skew-y: -123.3; scale-x: 0.793; scale-y: 0.793; }
        frame 150 { x: 34; y: 86.2; skew-x: -131.7; skew-y: -131.7; scale-x: 0.794; scale-y: 0.794; }
        frame 151 { x: 31.6; y: 88.1; skew-x: -138.8; skew-y: -137; scale-x: 0.802; scale-y: 0.793; }
        frame 152 { x: 29.1; y: 90; skew-x: -145.8; skew-y: -142.3; scale-x: 0.81; scale-y: 0.792; }
        frame 153 { x: 26.6; y: 91.8; skew-x: -152.9; skew-y: -147.5; scale-x: 0.82; scale-y: 0.793; }
        frame 154 { x: 23.4; y: 108.6; skew-x: -124.5; skew-y: -119; scale-x: 0.819; scale-y: 0.792; }
        frame 155 { x: 21.4; y: 122.1; skew-x: -96; skew-y: -90.7; scale-x: -10000; scale-y: 0.793; }
        frame 156 { x: 22; y: 132.8; skew-x: -67.7; skew-y: -62.3; scale-y: 0.792; }
        frame 157 { x: 22.7; y: -10000; skew-x: -66.6; skew-y: -63.6; scale-x: 0.799; scale-y: 0.801; }
        frame 158 { x: 23.1; skew-x: -65.5; skew-y: -64.8; scale-x: 0.781; scale-y: 0.811; }
        frame 159 { x: 22.8; y: 132.3; skew-x: -68.6; skew-y: -66.3; scale-x: 0.792; scale-y: 0.804; }
        frame 160 { x: 22.6; y: 131.9; skew-x: -71.6; skew-y: -67.6; scale-x: 0.805; scale-y: 0.797; }
        frame 161 { x: 22.4; y: 131.3; skew-x: -74.3; skew-y: -68.9; scale-x: 0.818; scale-y: 0.791; }
        frame 162 { x: 22.7; y: 131.8; skew-x: -71.6; skew-y: -67.6; scale-x: 0.805; scale-y: 0.797; }
        frame 163 { x: 22.9; y: 132.3; skew-x: -68.6; skew-y: -66.3; scale-x: 0.793; scale-y: 0.804; }
        frame 164 { x: 23.1; y: 132.8; skew-x: -65.5; skew-y: -64.8; scale-x: 0.781; scale-y: 0.811; }
        frame 165 { x: 71.2; y: 99.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 166 { x: 70.7; y: 99.8; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 70.4; y: 100.1; skew-x: -2.4; skew-y: -2.4; }
        frame 168 { x: 69.9; y: 100.4; skew-x: -3.7; skew-y: -3.7; }
        frame 169 { x: 69.6; y: 100.5; skew-x: -4.7; skew-y: -4.2; scale-x: 0.799; scale-y: 0.799; }
        frame 170 { x: 69.2; y: -10000; skew-x: -5.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 68.8; y: 100.7; skew-x: -6.7; skew-y: -5.5; scale-y: 0.8; }
        frame 172 { x: -10000; y: 100.6; skew-x: -10000; skew-y: -5.4; scale-y: 0.799; }
        frame 173 { y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 174 { y: 100.7; skew-y: -5.5; scale-y: 0.8; }
        frame 175 { x: 69; y: 100.3; skew-x: -5.7; skew-y: -4.4; scale-y: 0.799; }
        frame 176 { x: 69.2; y: 99.9; skew-x: -4.7; skew-y: -3.5; scale-y: -10000; }
        frame 177 { x: 69.3; y: 99.6; skew-x: -3.9; skew-y: -2.7; }
        frame 178 { x: 69.5; y: 99.8; skew-x: -3.7; skew-y: -2.9; }
        frame 179 { x: 69.8; y: 100.1; skew-x: -10000; skew-y: -3.2; }
        frame 180 { x: 69.9; y: 100.4; skew-y: -3.7; scale-x: 0.8; scale-y: 0.8; }
        frame 181 { x: 69.6; y: 100.5; skew-x: -4.7; skew-y: -4.2; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: 69.2; y: -10000; skew-x: -5.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 68.8; y: 100.7; skew-x: -6.7; skew-y: -5.5; scale-y: 0.8; }
        frame 184 { x: -10000; y: 100.6; skew-x: -10000; skew-y: -5.4; scale-y: 0.799; }
        frame 185 { y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 186 { y: 100.7; skew-y: -5.5; scale-y: 0.8; }
        frame 187 { x: 69; y: 100.3; skew-x: -5.7; skew-y: -4.4; scale-y: 0.799; }
        frame 188 { x: 69.2; y: 99.9; skew-x: -4.7; skew-y: -3.5; scale-y: -10000; }
        frame 189 { x: 69.3; y: 99.6; skew-x: -3.9; skew-y: -2.7; }
        frame 190 { x: 70; y: 99.5; skew-x: -2.4; skew-y: -1.7; scale-y: 0.8; }
        frame 191 { x: 70.5; y: 99.4; skew-x: -1.2; skew-y: -0.7; scale-x: 0.8; scale-y: -10000; }
        frame 192 { x: 71.2; y: 99.5; skew-x: 0; skew-y: 0; scale-x: -10000; }
    }
    Track {
        source-name: "Zombie_polevaulter_innerarm_upper";
        frame-count: 193;
        frame 0 { x: 15.1; y: 45; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_INNERARM_UPPER; }
        frame 1 { x: 15.2; y: 46.1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -10000; y: 47.1; skew-x: 0.2; skew-y: 0.2; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: 15.1; y: 48.5; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 14.9; y: 49.8; skew-x: -4.2; skew-y: -4.2; }
        frame 5 { x: 14.8; y: 51.1; skew-x: -6.4; skew-y: -6.4; }
        frame 6 { x: 14.6; y: 52.6; skew-x: -8.7; skew-y: -8.7; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { x: -10000; y: 51.5; skew-x: -8.4; skew-y: -8.4; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { y: 50.4; skew-x: -8.2; skew-y: -8.2; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 14.8; y: 49.1; skew-x: -6; skew-y: -6; }
        frame 10 { x: 14.9; y: 47.7; skew-x: -3.9; skew-y: -3.9; scale-x: 0.8; scale-y: 0.8; }
        frame 11 { x: 15; y: 46.4; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 15.1; y: 45; skew-x: 0; skew-y: 0; }
        frame 13 { x: 20.1; y: 39.4; skew-x: -0.4; skew-y: -0.4; }
        frame 14 { x: 18.7; y: 37.1; skew-x: 2.8; skew-y: 2.8; scale-x: 0.799; scale-y: 0.799; }
        frame 15 { x: 17.3; y: 34.8; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 15.8; y: 32.4; skew-x: 9.9; skew-y: 9.9; scale-x: 0.8; scale-y: 0.8; }
        frame 17 { x: 16.2; y: 29.5; skew-x: 13.8; skew-y: 13.8; scale-x: 0.858; scale-y: 0.799; }
        frame 18 { x: 16.6; y: 26.5; skew-x: 18; skew-y: 18; scale-x: 0.917; scale-y: 0.798; }
        frame 19 { x: 17.2; y: 23.2; skew-x: 22.2; skew-y: 22.2; scale-x: 0.977; scale-y: 0.799; }
        frame 20 { x: 16.1; y: 21.7; skew-x: 24; skew-y: 24; scale-x: 0.975; scale-y: 0.798; }
        frame 21 { x: 15.1; y: 20.3; skew-x: 25.8; skew-y: 25.8; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 14.2; y: 18.8; skew-x: 27.7; skew-y: 27.7; scale-x: 0.976; }
        frame 23 { x: 14.9; y: 21.6; skew-x: 32.4; skew-y: 32.4; scale-x: 0.975; scale-y: 0.797; }
        frame 24 { x: 13.8; y: 27.9; skew-x: 25.1; skew-y: 25.1; scale-x: 0.974; scale-y: -10000; }
        frame 25 { x: 12.7; y: 34.3; skew-x: 17.9; skew-y: 17.9; scale-x: 0.977; scale-y: 0.799; }
        frame 26 { x: 9.7; y: 42.1; skew-x: 8.8; skew-y: 8.8; scale-x: 0.975; scale-y: 0.798; }
        frame 27 { x: 7; y: 50; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 4.5; y: 58; skew-x: -9.1; skew-y: -9.1; scale-x: 0.974; scale-y: 0.797; }
        frame 29 { x: 7.2; y: 59.5; skew-x: -20; skew-y: -20; scale-x: 0.973; scale-y: 0.796; }
        frame 30 { x: 8.4; y: 52.9; skew-x: -11.9; skew-y: -12; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 9.6; y: 46.2; skew-x: -4.2; skew-y: -4.3; scale-x: 0.974; scale-y: 0.797; }
        frame 32 { x: 10.7; y: 43.1; skew-x: 0.1; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 11.8; y: 39.9; skew-x: 4.8; skew-y: 4.5; scale-x: 0.973; }
        frame 34 { x: 13; y: 36.9; skew-x: 9.3; skew-y: 9.1; scale-x: -10000; }
        frame 35 { x: 13.5; y: 35.8; skew-x: 8.8; skew-y: 8.6; scale-y: 0.796; }
        frame 36 { x: 14; y: 34.8; skew-x: 8.3; skew-y: 8.3; scale-y: -10000; }
        frame 37 { x: 14.7; y: 33.5; skew-x: 8; skew-y: 7.9; scale-y: 0.797; }
        frame 38 { x: 15.3; y: 29.5; skew-x: 13.3; skew-y: 13.3; scale-x: 0.972; scale-y: 0.796; }
        frame 39 { x: 15.9; y: 25.6; skew-x: 18.8; skew-y: 18.8; scale-x: 0.971; scale-y: 0.795; }
        frame 40 { x: 16.6; y: 21.7; skew-x: 24.4; skew-y: 24.2; scale-x: 0.972; scale-y: 0.796; }
        frame 41 { x: 14.3; y: 25.1; skew-x: 27.6; skew-y: 27.6; scale-x: 1.016; scale-y: 0.794; }
        frame 42 { x: 12; y: 28.3; skew-x: 31.1; skew-y: 30.8; scale-x: 1.062; scale-y: -10000; }
        frame 43 { x: 9.7; y: 31.5; skew-x: 34.4; skew-y: 34.3; scale-x: 1.109; scale-y: 0.795; }
        frame 44 { x: 8.7; y: 37.6; skew-x: 22.5; skew-y: 22.3; scale-x: 1.061; scale-y: 0.794; }
        frame 45 { x: 8.1; y: 43.9; skew-x: 10.5; skew-y: 10.3; scale-x: 1.016; scale-y: -10000; }
        frame 46 { x: -10000; y: 50.3; skew-x: -1.1; skew-y: -1.3; scale-x: 0.971; scale-y: 0.795; }
        frame 47 { x: 12.1; y: 46.5; skew-x: -0.7; skew-y: -0.9; scale-x: 0.914; scale-y: 0.796; }
        frame 48 { x: 16.1; y: 42.8; skew-x: -0.5; skew-y: -0.7; scale-x: 0.857; scale-y: 0.798; }
        frame 49 { x: 20.1; y: 39.4; skew-x: -0.4; skew-y: -0.4; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 24.9; y: 30.1; skew-x: 18.3; skew-y: 18.3; scale-x: 0.86; scale-y: 0.798; }
        frame 52 { x: 30.6; y: 21.1; skew-x: 37.1; skew-y: 37.1; scale-x: 0.921; scale-y: 0.797; }
        frame 53 { x: 36.9; y: 12.8; skew-x: 55.9; skew-y: 55.9; scale-x: 0.983; scale-y: 0.796; }
        frame 54 { x: 43.7; y: 5.2; skew-x: 74.6; skew-y: 74.6; scale-x: 1.046; scale-y: -10000; }
        frame 55 { x: 25.3; y: 9.9; skew-x: 44.8; skew-y: 44.8; scale-x: 0.96; scale-y: 0.794; }
        frame 56 { x: 12.4; y: 26.1; skew-x: 19.3; skew-y: 19.3; scale-x: 0.877; scale-y: -10000; }
        frame 57 { x: 5; y: 42.2; skew-x: -5.8; skew-y: -5.8; scale-x: 0.795; scale-y: 0.795; }
        frame 58 { x: 4.8; y: 43.8; skew-x: -19.9; skew-y: -19.9; scale-x: 0.794; scale-y: 0.794; }
        frame 59 { x: 5.1; y: 45.4; skew-x: -34.2; skew-y: -34.2; scale-x: 0.796; scale-y: 0.796; }
        frame 60 { x: 6.3; y: 45.1; skew-x: -31; skew-y: -31; scale-x: 0.794; scale-y: 0.794; }
        frame 61 { x: 7.5; y: 44.8; skew-x: -27.8; skew-y: -28; scale-x: 0.793; scale-y: 0.793; }
        frame 62 { x: 8.7; y: 44.6; skew-x: -24.8; skew-y: -25; scale-x: 0.794; scale-y: -10000; }
        frame 63 { x: 8.3; y: 46.9; skew-x: -29; skew-y: -29.2; scale-x: 0.792; scale-y: 0.792; }
        frame 64 { x: 8; y: 49.1; skew-x: -33.2; skew-y: -33.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 7.5; y: 51.5; skew-x: -37.5; skew-y: -37.7; scale-x: 0.793; scale-y: 0.793; }
        frame 66 { x: 10.4; y: 51.4; skew-x: -31.8; skew-y: -32; scale-x: -10000; scale-y: 0.792; }
        frame 67 { x: 13.3; y: 51.3; skew-x: -26.2; skew-y: -26.5; scale-y: -10000; }
        frame 68 { x: 16.4; y: 51.2; skew-x: -20.7; skew-y: -20.9; scale-x: 0.795; scale-y: 0.794; }
        frame 69 { x: 8.7; y: 50; skew-x: -20.4; skew-y: -20.5; scale-x: 0.794; scale-y: 0.792; }
        frame 70 { x: 1; y: 48.8; skew-x: -20.2; skew-y: -20.2; scale-x: 0.793; scale-y: -10000; }
        frame 71 { x: -6.5; y: 47.6; skew-x: -19.9; skew-y: -20.1; scale-x: 0.794; }
        frame 72 { x: -8.1; y: 30.2; skew-x: 13.5; skew-y: 13.3; scale-x: 0.793; }
        frame 73 { x: -7.5; y: 15; skew-x: 47.1; skew-y: 46.9; scale-x: 0.792; scale-y: 0.791; }
        frame 74 { x: -6; y: 2.8; skew-x: 80.5; skew-y: 80.3; scale-x: 0.793; scale-y: 0.792; }
        frame 75 { x: -3.8; y: 1.1; skew-x: 97.5; skew-y: 97.3; scale-x: 0.792; scale-y: 0.791; }
        frame 76 { x: -2; y: 0; skew-x: 114.6; skew-y: 114.5; scale-x: 0.791; scale-y: 0.789; }
        frame 77 { x: -1; y: -0.3; skew-x: 131.9; skew-y: 131.6; scale-x: 0.79; scale-y: 0.788; }
        frame 78 { x: -0.7; y: -0.6; skew-x: 148.9; skew-y: 148.7; scale-x: -10000; scale-y: 0.789; }
        frame 79 { x: -21.7; y: -5.7; skew-x: 128.9; skew-y: 128.8; scale-x: 0.788; scale-y: 0.787; }
        frame 80 { x: -43.8; y: -10.3; skew-x: 109; skew-y: 108.8; scale-x: 0.789; scale-y: -10000; }
        frame 81 { x: -62.4; y: -7.3; skew-x: 74.9; skew-y: 74.7; scale-x: 0.787; scale-y: 0.785; }
        frame 82 { x: -81.9; y: -1.3; skew-x: 40.6; skew-y: 40.4; scale-x: 0.786; scale-y: -10000; }
        frame 83 { x: -90.9; y: 11; skew-x: 17.5; skew-y: 17.3; scale-x: 0.788; scale-y: 0.787; }
        frame 84 { x: -98.9; y: 24.5; skew-x: -5.5; skew-y: -5.7; scale-x: 0.791; scale-y: 0.79; }
        frame 85 { x: -107.2; y: 51.4; skew-x: -70.4; skew-y: -70.6; scale-x: 0.792; scale-y: 0.791; }
        frame 86 { x: -114.1; y: 67; skew-x: -75.1; skew-y: -75.1; scale-x: 0.798; scale-y: 0.798; }
        frame 87 { x: -115.1; y: 75.8; skew-x: -81.9; skew-y: -81.9; scale-x: 0.797; scale-y: 0.797; }
        frame 88 { x: -116.2; y: 84.3; skew-x: -88.4; skew-y: -88.4; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -115.1; y: 80.4; skew-x: -85.1; skew-y: -85.1; }
        frame 90 { x: -114.1; y: 76.4; skew-x: -81.9; skew-y: -81.9; }
        frame 91 { x: -114; y: 71.8; skew-x: -78.6; skew-y: -78.6; }
        frame 92 { x: -114.1; y: 67; skew-x: -75.1; skew-y: -75.1; scale-x: 0.798; scale-y: 0.798; }
        frame 93 { x: 36.2; y: 66.5; skew-x: -70.3; skew-y: -70.3; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 36.6; y: 65.6; skew-x: -69.6; skew-y: -69.6; scale-x: 0.797; scale-y: 0.797; }
        frame 95 { x: 37.1; y: 64.7; skew-x: -68.6; skew-y: -68.6; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 37.6; y: 63.7; skew-x: -67.6; skew-y: -67.6; }
        frame 97 { x: 38.1; y: 62.6; skew-x: -66.7; skew-y: -66.7; scale-x: 0.798; scale-y: 0.798; }
        frame 98 { x: 38.7; y: 60.8; skew-x: -62.1; skew-y: -62.1; scale-x: 0.796; scale-y: 0.796; }
        frame 99 { x: 39.4; y: 59.1; skew-x: -57.3; skew-y: -57.3; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 40.1; y: 57.1; skew-x: -52.6; skew-y: -52.6; }
        frame 101 { x: 40.8; y: 55.4; skew-x: -47.9; skew-y: -47.9; scale-x: 0.797; scale-y: 0.797; }
        frame 102 { x: 41.6; y: 53.8; skew-x: -46.5; skew-y: -46.5; scale-x: 0.795; scale-y: 0.795; }
        frame 103 { x: 42.5; y: 52.1; skew-x: -45.3; skew-y: -45.3; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 43.2; y: 50.5; skew-x: -44; skew-y: -44; }
        frame 105 { x: 44.1; y: 48.8; skew-x: -42.6; skew-y: -42.6; scale-x: 0.796; scale-y: 0.796; }
        frame 106 { x: 44.6; y: 48.1; skew-x: -41.3; skew-y: -41.3; scale-x: 0.795; scale-y: 0.795; }
        frame 107 { x: 45.1; y: 47.5; skew-x: -40; skew-y: -40; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 45.6; y: 46.8; skew-x: -38.5; skew-y: -38.5; }
        frame 109 { x: 46.1; y: 46.1; skew-x: -37.3; skew-y: -37.3; scale-x: 0.796; scale-y: 0.796; }
        frame 110 { x: 43; y: 51.4; skew-x: -46.8; skew-y: -46.8; scale-x: 0.794; scale-y: 0.794; }
        frame 111 { x: 40.1; y: 56.8; skew-x: -56.3; skew-y: -56.3; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 37.4; y: 61.9; skew-x: -65.6; skew-y: -65.6; }
        frame 113 { x: 34.8; y: 66.8; skew-x: -75; skew-y: -75; }
        frame 114 { x: 36.9; y: 68.2; skew-x: -82.6; skew-y: -82.6; }
        frame 115 { x: 39.1; y: 69.4; skew-x: -89.9; skew-y: -89.9; }
        frame 116 { x: 41.3; y: 70.5; skew-x: -97.4; skew-y: -97.2; scale-x: 0.793; }
        frame 117 { x: 43.8; y: 71.4; skew-x: -105; skew-y: -104.9; scale-x: -10000; }
        frame 118 { x: 46; y: 70.6; skew-x: -105.2; skew-y: -105; scale-x: 0.792; scale-y: 0.793; }
        frame 119 { x: 48.3; y: 69.9; skew-x: -105.5; skew-y: -105.2; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 50.6; y: 69.2; skew-x: -105.7; skew-y: -105.7; }
        frame 121 { x: 52.9; y: 68.4; skew-x: -106.2; skew-y: -105.9; }
        frame 122 { x: 55.1; y: 67.7; skew-x: -106.4; skew-y: -106.2; scale-y: 0.792; }
        frame 123 { x: 57.5; y: 66.9; skew-x: -106.7; skew-y: -106.4; scale-y: -10000; }
        frame 124 { x: 59.7; y: 66.1; skew-x: -106.9; skew-y: -106.7; }
        frame 125 { x: 62; y: 65.3; skew-x: -107.3; skew-y: -107.1; scale-y: 0.793; }
        frame 126 { x: 63.6; y: 65.1; skew-x: -107.2; skew-y: -106.9; scale-x: 0.791; scale-y: 0.792; }
        frame 127 { x: 65; y: 64.8; skew-x: -107; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 66.6; y: 64.5; skew-x: -106.9; skew-y: -106.7; }
        frame 129 { x: 68.1; y: 64.2; skew-x: -10000; skew-y: -106.8; }
        frame 130 { x: 63.1; y: 65.5; skew-x: -102.9; skew-y: -102.7; }
        frame 131 { x: 58.3; y: 66.8; skew-x: -99; skew-y: -98.9; scale-x: 0.792; }
        frame 132 { x: 53.4; y: 68; skew-x: -95.2; skew-y: -95.2; scale-x: 0.793; scale-y: 0.793; }
        frame 133 { x: 48.5; y: 69.1; skew-x: -91.3; skew-y: -91.3; scale-x: -10000; scale-y: -10000; }
        frame 134 { x: 45.4; y: 68.5; skew-x: -86.1; skew-y: -86.1; scale-x: 0.794; scale-y: 0.794; }
        frame 135 { x: 42.2; y: 67.8; skew-x: -80.9; skew-y: -80.9; scale-x: 0.795; scale-y: 0.795; }
        frame 136 { x: 39.2; y: 67.2; skew-x: -75.6; skew-y: -75.6; scale-x: 0.796; scale-y: 0.796; }
        frame 137 { x: 36.2; y: 66.5; skew-x: -70.3; skew-y: -70.3; scale-x: 0.798; scale-y: 0.798; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 33.6; y: 63.8; skew-x: -69.1; skew-y: -69.1; scale-x: 0.796; scale-y: 0.796; }
        frame 140 { x: 31.2; y: 61; skew-x: -67.6; skew-y: -67.6; scale-x: 0.795; scale-y: 0.795; }
        frame 141 { x: 28.6; y: 58.2; skew-x: -66.2; skew-y: -66.2; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 26.5; y: 58.5; skew-x: -71.1; skew-y: -71.1; scale-x: 0.793; scale-y: 0.793; }
        frame 143 { x: 24.5; y: 58.6; skew-x: -75.9; skew-y: -75.9; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 22.6; y: 58.8; skew-x: -80.7; skew-y: -80.7; }
        frame 145 { x: 17.1; y: 60.6; skew-x: -85.1; skew-y: -85.1; scale-x: 0.791; scale-y: 0.791; }
        frame 146 { x: 11.6; y: 62.3; skew-x: -89.4; skew-y: -89.4; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 6.1; y: 63.8; skew-x: -93.7; skew-y: -93.7; scale-x: 0.79; scale-y: 0.79; }
        frame 148 { x: -0.4; y: 69; skew-x: -106.7; skew-y: -106.7; scale-x: 0.788; scale-y: 0.788; }
        frame 149 { x: -6.9; y: 73.9; skew-x: -119.9; skew-y: -119.9; scale-x: 0.787; scale-y: 0.787; }
        frame 150 { x: -13.4; y: 78.2; skew-x: -133; skew-y: -133; scale-x: 0.788; scale-y: 0.788; }
        frame 151 { x: -16.1; y: 83.6; skew-x: -143.1; skew-y: -143.1; scale-x: 0.786; scale-y: 0.786; }
        frame 152 { x: -19; y: 88.9; skew-x: -153.1; skew-y: -153.1; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: -22.1; y: 93.9; skew-x: -163.1; skew-y: -163.1; }
        frame 154 { x: -10000; y: 98; skew-x: -10000; skew-y: -10000; }
        frame 155 { y: 102.2; }
        frame 156 { y: 106.4; }
        frame 157 { x: -23.6; y: 120.1; skew-y: -161.3; scale-x: 0.798; scale-y: 0.764; }
        frame 158 { x: -25.2; y: 133.8; skew-y: -159.2; scale-x: 0.811; scale-y: 0.743; }
        frame 159 { x: -25.6; y: 132.3; skew-x: -159.4; skew-y: -156.8; scale-x: 0.8; scale-y: 0.755; }
        frame 160 { x: -25.9; y: 130.9; skew-x: -155.6; skew-y: -154.4; scale-x: 0.79; scale-y: 0.768; }
        frame 161 { x: -26.3; y: 129.4; skew-x: -151.9; skew-y: -151.9; scale-x: 0.781; scale-y: 0.781; }
        frame 162 { x: -25.9; y: 130.9; skew-x: -155.6; skew-y: -154.4; scale-x: 0.79; scale-y: 0.768; }
        frame 163 { x: -25.5; y: 132.4; skew-x: -159.4; skew-y: -156.8; scale-x: 0.8; scale-y: 0.755; }
        frame 164 { x: -25.2; y: 133.8; skew-x: -163.1; skew-y: -159.2; scale-x: 0.811; scale-y: 0.743; }
        frame 165 { x: 36.2; y: 66.5; skew-x: -70.3; skew-y: -70.3; scale-x: 0.798; scale-y: 0.798; }
        frame 166 { x: 37.5; y: 65.9; skew-x: -71.6; skew-y: -71.6; scale-x: 0.797; scale-y: 0.797; }
        frame 167 { x: 38.6; y: 65.3; skew-x: -72.6; skew-y: -72.6; scale-x: 0.796; scale-y: 0.796; }
        frame 168 { x: 39.9; y: 64.6; skew-x: -73.6; skew-y: -73.6; scale-x: 0.797; scale-y: 0.797; }
        frame 169 { x: 40.7; y: 63.9; skew-x: -71.8; skew-y: -71.8; scale-x: 0.796; scale-y: 0.796; }
        frame 170 { x: 41.5; y: 63.1; skew-x: -69.9; skew-y: -69.9; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 42.4; y: 62.5; skew-x: -68; skew-y: -68; scale-x: 0.797; scale-y: 0.797; }
        frame 172 { x: 42.9; y: 61.6; skew-x: -66.1; skew-y: -66.1; scale-x: 0.796; scale-y: 0.796; }
        frame 173 { x: 43.5; y: 60.6; skew-x: -64.1; skew-y: -64.1; scale-x: 0.795; scale-y: 0.795; }
        frame 174 { x: 44; y: 59.6; skew-x: -61.9; skew-y: -61.9; scale-x: 0.796; scale-y: 0.796; }
        frame 175 { x: 41.4; y: 62.7; skew-x: -67.6; skew-y: -67.6; scale-x: 0.795; scale-y: 0.795; }
        frame 176 { x: 38.7; y: 65.8; skew-x: -73.1; skew-y: -73.1; scale-x: -10000; scale-y: -10000; }
        frame 177 { x: 36.2; y: 68.9; skew-x: -78.5; skew-y: -78.5; scale-x: 0.796; scale-y: 0.796; }
        frame 178 { x: 35.7; y: 66.5; skew-x: -66.1; skew-y: -66.1; scale-x: 0.795; scale-y: 0.795; }
        frame 179 { x: 35.5; y: 63.6; skew-x: -53.3; skew-y: -53.3; scale-x: 0.794; scale-y: 0.794; }
        frame 180 { x: 35.8; y: 60.6; skew-x: -40.8; skew-y: -40.8; scale-x: 0.796; scale-y: 0.796; }
        frame 181 { x: 36.4; y: 58.1; skew-x: -33.3; skew-y: -33.3; scale-x: 0.794; scale-y: 0.794; }
        frame 182 { x: 37.3; y: 55.6; skew-x: -25.7; skew-y: -25.7; scale-x: 0.793; scale-y: 0.793; }
        frame 183 { x: 38.3; y: 53.1; skew-x: -18.5; skew-y: -18.5; scale-x: 0.795; scale-y: 0.795; }
        frame 184 { x: 38.8; y: 51.6; skew-x: -12.4; skew-y: -12.4; scale-x: 0.794; scale-y: 0.794; }
        frame 185 { x: 39.3; y: 50.3; skew-x: -6.5; skew-y: -6.5; scale-x: -10000; scale-y: -10000; }
        frame 186 { x: 40; y: 48.8; skew-x: -0.7; skew-y: -0.7; }
        frame 187 { x: 37.9; y: 52.3; skew-x: -10; skew-y: -10; scale-x: 0.793; scale-y: 0.793; }
        frame 188 { x: 36; y: 55.9; skew-x: -19.5; skew-y: -19.5; scale-x: 0.792; scale-y: 0.792; }
        frame 189 { x: 34.3; y: 59.6; skew-x: -29; skew-y: -29; scale-x: 0.793; scale-y: 0.793; }
        frame 190 { x: 34.4; y: 62; skew-x: -42.8; skew-y: -42.8; scale-x: -10000; scale-y: -10000; }
        frame 191 { x: 35.1; y: 64.2; skew-x: -56.6; skew-y: -56.6; scale-x: 0.794; scale-y: 0.794; }
        frame 192 { x: 36.2; y: 66.5; skew-x: -70.3; skew-y: -70.3; scale-x: 0.798; scale-y: 0.798; }
    }
    Track {
        source-name: "Zombie_polevaulter_innerarm_lower";
        frame-count: 193;
        frame 0 { x: 2.4; y: 26; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_INNERARM_LOWER; }
        frame 1 { x: 1.6; y: 27.4; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 0.9; y: 28.8; skew-x: -4.2; skew-y: -4.2; }
        frame 3 { x: 0.5; y: 30.6; skew-x: -5.2; skew-y: -5.2; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 0; y: 32.3; skew-x: -6.4; skew-y: -6.4; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: -0.2; y: 34; skew-x: -7.5; skew-y: -7.5; }
        frame 6 { x: -0.7; y: 35.7; skew-x: -8.7; skew-y: -8.7; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { x: -0.2; y: 34.2; skew-x: -7.5; skew-y: -7.5; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 0.2; y: 32.9; skew-x: -6.5; skew-y: -6.5; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 0.8; y: 31.1; skew-x: -4.7; skew-y: -4.7; }
        frame 10 { x: 1.3; y: 29.4; skew-x: -3.2; skew-y: -3.2; scale-x: 0.8; scale-y: 0.8; }
        frame 11 { x: 1.9; y: 27.6; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 2.4; y: 26; skew-x: 0; skew-y: 0; }
        frame 13 { x: 7.2; y: 20.6; skew-x: -0.4; skew-y: -0.4; }
        frame 14 { x: 6.1; y: 18; skew-x: 1; skew-y: 1; }
        frame 15 { x: 5; y: 15.4; skew-x: 2.6; skew-y: 2.6; }
        frame 16 { x: 4; y: 12.7; skew-x: 4.3; skew-y: 4.3; }
        frame 17 { x: 6.1; y: 8.9; skew-x: 7.5; skew-y: 7.5; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 8; y: 5.2; skew-x: 10.6; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 10.1; y: 1.4; skew-x: 13.9; skew-y: 13.9; }
        frame 20 { x: 8.2; y: 0; skew-x: 12.3; skew-y: 12.3; }
        frame 21 { x: 6.4; y: -1.3; skew-x: 11; skew-y: 11; }
        frame 22 { x: 4.5; y: -2.7; skew-x: 9.6; skew-y: 9.6; }
        frame 23 { x: 4.3; y: 0; skew-x: 9.5; skew-y: 9.5; }
        frame 24 { x: 4.1; y: 6.5; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: 4; y: 13.1; skew-x: 9.6; skew-y: 9.6; scale-x: 0.799; scale-y: 0.799; }
        frame 26 { x: 0.4; y: 21.6; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -3.1; y: 30.3; skew-x: 2.8; skew-y: 2.8; }
        frame 28 { x: -6.6; y: 38.9; skew-x: -0.4; skew-y: -0.4; }
        frame 29 { x: -3.8; y: 40.4; skew-x: -1.9; skew-y: -1.9; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: -1.9; y: 33.3; skew-x: 1.1; skew-y: 1; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 0; y: 26.3; skew-x: 4.4; skew-y: 4.3; }
        frame 32 { x: 1.6; y: 23; skew-x: 6.6; skew-y: 6.5; }
        frame 33 { x: 3.4; y: 19.6; skew-x: 8.8; skew-y: 8.8; }
        frame 34 { x: 5.1; y: 16.2; skew-x: 11.2; skew-y: 11.1; }
        frame 35 { x: 6.6; y: 14.8; skew-x: 13; skew-y: 12.8; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: 8; y: 13.4; skew-x: 14.8; skew-y: 14.6; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 9.5; y: 12; skew-x: 16.8; skew-y: 16.6; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 9.8; y: 7.9; skew-x: -10000; skew-y: 16.5; scale-x: 0.797; scale-y: 0.797; }
        frame 39 { x: 10; y: 3.6; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 10.2; y: -0.3; skew-y: 16.6; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 6.4; y: 3.1; skew-x: 13.8; skew-y: 13.6; scale-x: 0.797; scale-y: 0.797; }
        frame 42 { x: 2.8; y: 6.9; skew-x: 11; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: -0.7; y: 10.5; skew-x: 8.2; skew-y: 8; }
        frame 44 { x: -1.1; y: 17.4; skew-x: 6.5; skew-y: 6.3; }
        frame 45 { x: -1.4; y: 24.3; skew-x: 5; skew-y: 4.8; }
        frame 46 { x: -1.8; y: 31.1; skew-x: 3.4; skew-y: 3.3; }
        frame 47 { x: 1; y: 27.5; skew-x: 2; skew-y: 2; scale-x: 0.798; scale-y: 0.798; }
        frame 48 { x: 4; y: 23.9; skew-x: 0.8; skew-y: 0.8; scale-x: 0.799; scale-y: 0.799; }
        frame 49 { x: 7.2; y: 20.6; skew-x: -0.4; skew-y: -0.4; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 15.4; y: 10.1; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 23.6; y: -0.2; skew-x: 13.8; skew-y: 13.8; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: 31.8; y: -10.3; skew-x: 20.8; skew-y: 20.8; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 40.1; y: -20.3; skew-x: 28.1; skew-y: 28.1; }
        frame 55 { x: 11.2; y: -8.1; skew-x: -4.2; skew-y: -4.2; scale-x: 0.797; scale-y: 0.797; }
        frame 56 { x: -12.4; y: 17.7; skew-x: -36.5; skew-y: -36.5; scale-x: 0.794; scale-y: 0.794; }
        frame 57 { x: -20.2; y: 44.1; skew-x: -66.8; skew-y: -66.8; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: -17.8; y: 45.4; skew-x: -65.3; skew-y: -65.3; scale-x: 0.793; scale-y: 0.793; }
        frame 59 { x: -15.4; y: 46.6; skew-x: -63.5; skew-y: -63.5; scale-x: 0.794; scale-y: 0.794; }
        frame 60 { x: -15; y: 47.2; skew-x: -63.1; skew-y: -63.1; scale-x: 0.792; scale-y: 0.792; }
        frame 61 { x: -14.4; y: 47.8; skew-x: -62.4; skew-y: -62.4; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: -14; y: 48.4; skew-x: -61.8; skew-y: -61.8; scale-x: 0.793; scale-y: 0.793; }
        frame 63 { x: -13.2; y: 48; skew-x: -56.8; skew-y: -56.8; scale-x: 0.791; scale-y: 0.791; }
        frame 64 { x: -12.1; y: 47.6; skew-x: -52; skew-y: -52; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -10.9; y: 47.3; skew-x: -47; skew-y: -47; scale-x: 0.792; scale-y: 0.793; }
        frame 66 { x: -8.6; y: 46.4; skew-x: -42.5; skew-y: -42.5; scale-x: 0.791; scale-y: 0.791; }
        frame 67 { x: -6.1; y: 45.4; skew-x: -38.2; skew-y: -38; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: -3.8; y: 44.5; skew-x: -33.9; skew-y: -33.6; scale-x: 0.793; scale-y: 0.793; }
        frame 69 { x: -11.4; y: 41.7; skew-x: -31; skew-y: -30.7; scale-x: 0.791; scale-y: 0.791; }
        frame 70 { x: -18.9; y: 39; skew-x: -28; skew-y: -27.9; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -26.4; y: 36.2; skew-x: -25.3; skew-y: -25.1; scale-y: 0.792; }
        frame 72 { x: -19.2; y: 14.5; skew-x: -1.2; skew-y: -0.9; scale-y: 0.791; }
        frame 73 { x: -10.7; y: -4.5; skew-x: 22.5; skew-y: 22.8; scale-x: 0.789; scale-y: 0.79; }
        frame 74 { x: -2; y: -21; skew-x: 46.6; skew-y: 46.8; scale-x: 0.79; scale-y: -10000; }
        frame 75 { x: 4.8; y: -19.9; skew-x: 59.4; skew-y: 59.7; scale-x: 0.788; scale-y: 0.788; }
        frame 76 { x: 11.4; y: -18; skew-x: 72.4; skew-y: 72.5; scale-x: 0.787; scale-y: 0.787; }
        frame 77 { x: 17.5; y: -15.6; skew-x: 85.2; skew-y: 85.5; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 22.7; y: -12.7; skew-x: 97.9; skew-y: 98.2; scale-x: 0.786; scale-y: 0.786; }
        frame 79 { x: -6.2; y: -24.8; skew-x: 74.2; skew-y: 74.4; scale-x: 0.785; scale-y: 0.785; }
        frame 80 { x: -37.3; y: -35.1; skew-x: 50.2; skew-y: 50.4; scale-x: 0.784; scale-y: 0.784; }
        frame 81 { x: -66; y: -29.5; skew-x: 26.6; skew-y: 26.8; scale-x: 0.782; scale-y: 0.782; }
        frame 82 { x: -94.7; y: -21.2; skew-x: 3.1; skew-y: 3.3; scale-x: 0.781; scale-y: 0.781; }
        frame 83 { x: -109.9; y: -1.6; skew-x: -19.7; skew-y: -19.4; scale-x: 0.783; scale-y: 0.783; }
        frame 84 { x: -123.3; y: 19.8; skew-x: -42.5; skew-y: -42.3; scale-x: 0.787; scale-y: 0.787; }
        frame 85 { x: -120.1; y: 70.9; skew-x: -111.5; skew-y: -111.5; scale-x: 0.79; scale-y: 0.79; }
        frame 86 { x: -124.2; y: 66.5; skew-x: -14.7; skew-y: -14.7; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_OUTERARM_LOWER; }
        frame 87 { x: -125.2; y: 77.1; skew-x: -21.2; skew-y: -21.2; scale-x: 0.798; scale-y: 0.798; image: none; }
        frame 88 { x: -126.1; y: 87.9; skew-x: -27.9; skew-y: -27.9; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -125.7; y: 82.8; skew-x: -24.5; skew-y: -24.5; scale-x: 0.797; scale-y: 0.797; }
        frame 90 { x: -125.2; y: 77.8; skew-x: -21.2; skew-y: -21.2; scale-x: 0.798; scale-y: 0.798; }
        frame 91 { x: -124.7; y: 72.1; skew-x: -17.9; skew-y: -17.9; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: -124.2; y: 66.5; skew-x: -14.7; skew-y: -14.7; scale-x: 0.799; scale-y: 0.799; }
        frame 93 { x: 27; y: 65.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.838; }
        frame 94 { y: 64.3; skew-x: -10.9; skew-y: -10.9; scale-y: 0.828; }
        frame 95 { x: 27.1; y: 62.7; skew-x: -7.2; skew-y: -7.2; scale-y: 0.818; }
        frame 96 { x: 27.3; y: 61.2; skew-x: -3.4; skew-y: -3.4; scale-y: 0.808; }
        frame 97 { x: 27.4; y: 59.6; skew-x: 0.1; skew-y: 0.1; scale-y: 0.799; }
        frame 98 { x: 28.1; y: 58.1; skew-x: 2; skew-y: 2; scale-x: 0.798; scale-y: 0.798; }
        frame 99 { x: 28.6; y: 56.5; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 29.2; y: 55; skew-x: 5.8; skew-y: 5.8; }
        frame 101 { x: 30; y: 53.4; skew-x: 7.9; skew-y: 7.9; }
        frame 102 { x: 30.8; y: 50.9; skew-x: 12.3; skew-y: 12.3; }
        frame 103 { x: 31.7; y: 48.5; skew-x: 16.6; skew-y: 16.6; scale-x: 0.797; scale-y: 0.797; }
        frame 104 { x: 32.6; y: 46.1; skew-x: 21; skew-y: 21; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 33.5; y: 43.8; skew-x: 25.5; skew-y: 25.5; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 34.2; y: 42.8; skew-x: 26.8; skew-y: 26.8; scale-x: 0.796; scale-y: 0.796; }
        frame 107 { x: 34.8; y: 42; skew-x: 28.1; skew-y: 28.1; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 35.4; y: 41.1; skew-x: 29.3; skew-y: 29.3; }
        frame 109 { x: 36.1; y: 40.1; skew-x: 30.8; skew-y: 30.8; scale-x: 0.797; scale-y: 0.797; }
        frame 110 { x: 32.6; y: 46.6; skew-x: 21.3; skew-y: 21.3; scale-x: 0.796; scale-y: 0.796; }
        frame 111 { x: 29.3; y: 53.4; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 26.2; y: 60.6; skew-x: 2.5; skew-y: 2.5; }
        frame 113 { x: 23.3; y: 68.3; skew-x: -6.8; skew-y: -6.8; scale-x: 0.795; scale-y: 0.795; }
        frame 114 { x: 25.7; y: 72.3; skew-x: -15.2; skew-y: -15.4; scale-x: 0.794; scale-y: 0.794; }
        frame 115 { x: 28.3; y: 76.3; skew-x: -24; skew-y: -24.2; scale-x: -10000; scale-y: 0.795; }
        frame 116 { x: 31.3; y: 77.3; skew-x: -30.2; skew-y: -30.5; scale-x: 0.793; scale-y: 0.794; }
        frame 117 { x: 34.5; y: 78.3; skew-x: -36.7; skew-y: -36.8; scale-x: 0.794; scale-y: 0.796; }
        frame 118 { x: 36.9; y: 77.6; skew-x: -37; skew-y: -37; scale-x: 0.793; scale-y: 0.794; }
        frame 119 { x: 39.1; y: 76.9; skew-x: -37.2; skew-y: -37.5; scale-x: 0.792; scale-y: 0.793; }
        frame 120 { x: 41.5; y: 76.2; skew-x: -37.5; skew-y: -37.7; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 43.8; y: 75.5; skew-x: -37.8; skew-y: -38; scale-x: 0.793; scale-y: 0.794; }
        frame 122 { x: 46.1; y: 74.7; skew-x: -38; skew-y: -38.3; scale-x: 0.791; scale-y: 0.793; }
        frame 123 { x: 48.4; y: 74; skew-x: -38.3; skew-y: -38.5; scale-x: 0.792; scale-y: -10000; }
        frame 124 { x: 50.7; y: 73.3; skew-x: -38.5; skew-y: -38.8; scale-x: -10000; }
        frame 125 { x: 52.9; y: 72.6; skew-x: -38.9; skew-y: -39.1; scale-x: 0.793; scale-y: 0.795; }
        frame 126 { x: 54.4; y: 72.3; skew-x: -38.8; skew-y: -39; scale-x: 0.792; scale-y: 0.793; }
        frame 127 { x: 55.9; y: 72; skew-x: -38.7; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 57.4; y: 71.7; skew-x: -10000; skew-y: -38.8; scale-x: 0.791; }
        frame 129 { x: 59; y: 71.3; skew-x: -38.6; skew-y: -38.7; scale-x: 0.792; scale-y: 0.794; }
        frame 130 { x: 53.6; y: 71.8; skew-x: -34.7; skew-y: -34.8; scale-x: -10000; scale-y: 0.793; }
        frame 131 { x: 48.4; y: 72.3; skew-x: -30.7; skew-y: -31; scale-y: -10000; }
        frame 132 { x: 43.1; y: 72.9; skew-x: -27; skew-y: -27; scale-x: 0.793; }
        frame 133 { x: 37.9; y: 73.7; skew-x: -23.1; skew-y: -23.1; scale-x: 0.794; scale-y: 0.794; }
        frame 134 { x: 34.5; y: 73; skew-x: -22.5; skew-y: -22.5; scale-x: -10000; scale-y: 0.804; }
        frame 135 { x: 31.2; y: 72.2; skew-x: -22; skew-y: -22; scale-x: 0.796; scale-y: 0.815; }
        frame 136 { x: 29.1; y: 68.9; skew-x: -18.2; skew-y: -18.2; scale-x: 0.797; scale-y: 0.826; }
        frame 137 { x: 27; y: 65.9; skew-x: -14.7; skew-y: -14.7; scale-x: 0.799; scale-y: 0.838; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 24.6; y: 62.9; skew-x: -13.2; skew-y: -13.2; scale-x: 0.798; scale-y: 0.836; }
        frame 140 { x: 22; y: 60; skew-x: -11.7; skew-y: -11.7; scale-x: 0.797; scale-y: 0.835; }
        frame 141 { x: 19.5; y: 56.8; skew-x: -10.5; skew-y: -10.5; scale-x: 0.796; scale-y: -10000; }
        frame 142 { x: 17.4; y: 57.7; skew-x: -15.2; skew-y: -15.2; scale-x: 0.795; scale-y: 0.833; }
        frame 143 { x: 15.4; y: 58.7; skew-x: -20.2; skew-y: -20.2; scale-x: 0.794; scale-y: 0.832; }
        frame 144 { x: 13.4; y: 59.7; skew-x: -25.1; skew-y: -25.1; scale-x: -10000; scale-y: 0.833; }
        frame 145 { x: 7.6; y: 64.3; skew-x: -33.5; skew-y: -33.5; scale-x: 0.792; scale-y: 0.831; }
        frame 146 { x: 2; y: 69.2; skew-x: -42; skew-y: -42; scale-x: -10000; scale-y: 0.83; }
        frame 147 { x: -2.8; y: 74.1; skew-x: -50.3; skew-y: -50.3; scale-y: 0.831; }
        frame 148 { x: -7.3; y: 80.3; skew-x: -63.6; skew-y: -63.6; scale-x: 0.79; scale-y: 0.829; }
        frame 149 { x: -11; y: 86.3; skew-x: -76.6; skew-y: -76.6; scale-x: -10000; scale-y: 0.828; }
        frame 150 { x: -13.9; y: 91.8; skew-x: -89.7; skew-y: -89.7; scale-y: -10000; }
        frame 151 { x: -14.8; y: 97; skew-x: -99.7; skew-y: -99.7; scale-x: 0.789; scale-y: 0.827; }
        frame 152 { x: -15.3; y: 101.6; skew-x: -109.7; skew-y: -109.7; scale-x: 0.788; scale-y: 0.826; }
        frame 153 { x: -15.7; y: 105.9; skew-x: -119.8; skew-y: -119.8; scale-x: -10000; scale-y: 0.827; }
        frame 154 { x: -10000; y: 110; skew-x: -119.7; skew-y: -119.7; scale-x: 0.787; scale-y: 0.825; }
        frame 155 { y: 114.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 156 { y: 118.4; skew-x: -119.8; skew-y: -119.8; scale-x: 0.788; scale-y: 0.827; }
        frame 157 { x: -17.2; y: 131.7; skew-x: -120; skew-y: -117.5; scale-x: 0.771; scale-y: 0.833; }
        frame 158 { x: -18.9; y: 145.2; skew-x: -120.5; skew-y: -115.3; scale-x: 0.755; scale-y: 0.842; }
        frame 159 { x: -20.1; y: 144.2; skew-x: -116.5; skew-y: -113; scale-x: 0.763; scale-y: 0.834; }
        frame 160 { x: -21.2; y: 143.3; skew-x: -112.5; skew-y: -110.7; scale-x: 0.773; scale-y: 0.827; }
        frame 161 { x: -22.3; y: 142.3; skew-x: -108.5; skew-y: -108.5; scale-x: 0.783; scale-y: 0.821; }
        frame 162 { x: -21.2; y: 143.3; skew-x: -112.5; skew-y: -110.7; scale-x: 0.773; scale-y: 0.827; }
        frame 163 { x: -20; y: 144.2; skew-x: -116.5; skew-y: -113; scale-x: 0.763; scale-y: 0.834; }
        frame 164 { x: -18.9; y: 145.2; skew-x: -120.5; skew-y: -115.3; scale-x: 0.755; scale-y: 0.842; }
        frame 165 { x: 27; y: 65.9; skew-x: -14.7; skew-y: -14.7; scale-x: 0.799; scale-y: 0.838; }
        frame 166 { x: 28.2; y: 65.5; skew-x: -15.7; skew-y: -15.7; scale-x: 0.798; scale-y: 0.837; }
        frame 167 { x: 29.5; y: 65; skew-x: -16.7; skew-y: -16.7; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 30.7; y: 64.6; skew-x: -17.9; skew-y: -17.9; scale-x: 0.799; }
        frame 169 { x: 31.6; y: 63.6; skew-x: -16; skew-y: -16; scale-x: 0.798; scale-y: 0.836; }
        frame 170 { x: 32.4; y: 62.6; skew-x: -14.2; skew-y: -14.2; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 33.3; y: 61.6; skew-x: -12.4; skew-y: -12.4; scale-y: 0.837; }
        frame 172 { x: 33.9; y: 60.3; skew-x: -10.2; skew-y: -10.2; scale-y: 0.836; }
        frame 173 { x: 34.5; y: 59.1; skew-x: -8.2; skew-y: -8.2; scale-y: -10000; }
        frame 174 { x: 35.1; y: 57.9; skew-x: -6.3; skew-y: -6.3; scale-y: 0.837; }
        frame 175 { x: 32.3; y: 61.6; skew-x: -11.7; skew-y: -11.7; scale-x: 0.797; scale-y: 0.836; }
        frame 176 { x: 29.7; y: 65.7; skew-x: -17.2; skew-y: -17.2; scale-x: -10000; scale-y: 0.835; }
        frame 177 { x: 27.2; y: 69.6; skew-x: -22.9; skew-y: -22.9; scale-y: 0.836; }
        frame 178 { x: 27; y: 60.1; skew-x: 1.3; skew-y: 1.3; scale-y: 0.835; }
        frame 179 { x: 28.6; y: 52.8; skew-x: 25.8; skew-y: 25.8; scale-x: 0.795; scale-y: 0.834; }
        frame 180 { x: 30.7; y: 48.5; skew-x: 50.1; skew-y: 50.1; scale-x: 0.796; scale-y: 0.835; }
        frame 181 { x: 36.4; y: 45; skew-x: 71.5; skew-y: 71.5; scale-x: 0.794; scale-y: 0.833; }
        frame 182 { x: 43.7; y: 43.3; skew-x: 92.6; skew-y: 92.6; scale-x: -10000; scale-y: 0.832; }
        frame 183 { x: 49.2; y: 42.9; skew-x: 114; skew-y: 114; scale-x: 0.793; scale-y: -10000; }
        frame 184 { x: 51.1; y: 43.4; skew-x: 122.3; skew-y: 122.3; scale-x: 0.792; scale-y: 0.83; }
        frame 185 { x: 52.6; y: 43.8; skew-x: 130.6; skew-y: 130.6; scale-x: 0.791; scale-y: -10000; }
        frame 186 { x: 53.9; y: 44.4; skew-x: 138.9; skew-y: 138.9; scale-x: 0.792; scale-y: 0.831; }
        frame 187 { x: 50.8; y: 44.7; skew-x: 125.3; skew-y: 125.3; scale-x: 0.791; scale-y: 0.774; }
        frame 188 { x: 46.6; y: 45.3; skew-x: 111.6; skew-y: 111.6; scale-x: 0.79; scale-y: 0.719; }
        frame 189 { x: 41.7; y: 46.8; skew-x: 98; skew-y: 98; scale-x: 0.791; scale-y: 0.664; }
        frame 190 { x: 31.8; y: 48.7; skew-x: 60.4; skew-y: 60.4; scale-x: 0.792; scale-y: 0.721; }
        frame 191 { x: 29; y: 54.2; skew-x: 22.8; skew-y: 22.8; scale-x: 0.795; scale-y: 0.779; }
        frame 192 { x: 27; y: 65.9; skew-x: -14.7; skew-y: -14.7; scale-x: 0.799; scale-y: 0.838; }
    }
    Track {
        source-name: "Zombie_polevaulter_body2";
        frame-count: 193;
        frame 0 { x: 53.5; y: 69.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_BODY2; }
        frame 1 { x: -10000; y: 69.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 69.7; }
        frame 3 { y: 70.1; }
        frame 4 { y: 70.4; }
        frame 5 { y: 70.7; }
        frame 6 { y: 71.1; }
        frame 7 { y: 70.7; }
        frame 8 { y: 70.4; }
        frame 9 { y: 70.1; }
        frame 10 { y: 69.7; }
        frame 11 { y: 69.4; }
        frame 12 { y: 69.1; }
        frame 13 { x: 55.5; y: 63.5; skew-x: 7.8; skew-y: 7.8; }
        frame 14 { x: 54.5; y: 63.4; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 15 { x: 53.5; y: 63.1; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 52.5; y: 63; skew-x: 2; skew-y: 2; }
        frame 17 { x: 52.7; y: 61.4; skew-x: 7; skew-y: 7; scale-y: 0.811; }
        frame 18 { x: 53.1; y: 60; skew-x: 12; skew-y: 12; scale-x: 0.798; scale-y: 0.823; }
        frame 19 { x: 53.6; y: 58.6; skew-x: 17.1; skew-y: 17.1; scale-x: 0.799; scale-y: 0.835; }
        frame 20 { x: 52.6; y: 58; skew-x: 14; skew-y: 14; scale-x: 0.798; scale-y: 0.834; }
        frame 21 { x: 51.8; y: 57.5; skew-x: 11; skew-y: 11; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 51; y: 57; skew-x: 8; skew-y: 8; scale-y: 0.835; }
        frame 23 { x: 50.9; y: 60.6; skew-x: 7.8; skew-y: 7.8; scale-y: 0.834; }
        frame 24 { x: -10000; y: 64.3; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: 51; y: 68; skew-x: 8; skew-y: 8; scale-y: 0.835; }
        frame 26 { x: 51.1; y: 69.1; skew-x: 12.5; skew-y: 12.5; scale-x: 0.797; scale-y: 0.834; }
        frame 27 { x: 51.3; y: 70.4; skew-x: 17.1; skew-y: 17.1; scale-x: -10000; scale-y: 0.833; }
        frame 28 { x: 51.6; y: 71.7; skew-x: 21.8; skew-y: 21.8; scale-y: -10000; }
        frame 29 { x: 51.4; y: 70.9; skew-x: 15.3; skew-y: 15.3; }
        frame 30 { x: 51.3; y: 70.2; skew-x: 8.8; skew-y: 8.8; scale-y: 0.834; }
        frame 31 { x: -10000; y: 69.7; skew-x: 2.5; skew-y: 2.5; scale-x: 0.798; scale-y: -10000; }
        frame 32 { x: 51.4; y: 69.3; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; }
        frame 33 { x: 51.3; y: 68.8; skew-x: 4.3; skew-y: 4.3; }
        frame 34 { x: 51.4; y: 68.1; skew-x: 5.5; skew-y: 5.5; }
        frame 35 { x: 51; y: 67.6; skew-x: 6.5; skew-y: 6.5; scale-x: 0.797; }
        frame 36 { x: 50.8; y: 67.2; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; }
        frame 37 { x: 50.5; y: 66.7; skew-x: 8.5; skew-y: 8.5; scale-x: 0.798; }
        frame 38 { x: -10000; y: 64.2; skew-x: -10000; skew-y: -10000; scale-x: 0.797; }
        frame 39 { y: 61.7; scale-x: -10000; }
        frame 40 { y: 59.2; scale-x: 0.798; }
        frame 41 { x: 49.6; y: 62.5; skew-x: 6.8; skew-y: 6.8; scale-x: 0.797; }
        frame 42 { x: 48.8; y: 65.8; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; }
        frame 43 { x: 48; y: 69; skew-x: 3.7; skew-y: 3.7; }
        frame 44 { x: 49.6; y: 68.6; skew-x: 7; skew-y: 7; scale-x: 0.796; scale-y: 0.874; }
        frame 45 { x: 51.3; y: 68.4; skew-x: 10.5; skew-y: 10.5; scale-x: -10000; scale-y: 0.915; }
        frame 46 { x: 53.2; y: 68.1; skew-x: 14; skew-y: 14; scale-y: 0.957; }
        frame 47 { x: 53.9; y: 66.6; skew-x: 11.8; skew-y: 11.8; scale-y: 0.904; }
        frame 48 { x: 54.7; y: 65.1; skew-x: 9.8; skew-y: 9.8; scale-x: 0.798; scale-y: 0.852; }
        frame 49 { x: 55.5; y: 63.5; skew-x: 7.8; skew-y: 7.8; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 56.5; y: 63.1; skew-x: 12.5; skew-y: 12.5; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 57.7; y: 62.9; skew-x: 17.3; skew-y: 17.3; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: 58.9; y: 62.8; skew-x: 22.1; skew-y: 22.1; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 60.3; y: 62.7; skew-x: 27; skew-y: 27; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 51.8; y: 62; skew-x: 21.1; skew-y: 21; scale-x: 0.798; scale-y: 0.798; }
        frame 56 { x: 43.6; y: 61.2; skew-x: 15.3; skew-y: 15.1; scale-x: -10000; scale-y: 0.797; }
        frame 57 { x: 35.4; y: 60.8; skew-x: 9.4; skew-y: 9.3; scale-y: 0.798; }
        frame 58 { x: 33; y: 60.4; skew-x: 11; skew-y: 10.8; scale-y: 0.797; }
        frame 59 { x: 30.6; y: 60.1; skew-x: 12.7; skew-y: 12.5; scale-y: -10000; }
        frame 60 { x: 29.5; y: 58.8; skew-x: 20; skew-y: 19.8; scale-x: 0.797; scale-y: 0.796; }
        frame 61 { x: 28.5; y: 57.9; skew-x: 27.3; skew-y: 27.3; scale-x: 0.796; scale-y: 0.794; }
        frame 62 { x: 27.7; y: 57.1; skew-x: 34.8; skew-y: 34.6; scale-x: -10000; scale-y: 0.795; }
        frame 63 { x: 26.3; y: -10000; skew-x: 46.2; skew-y: 46.1; scale-x: 0.794; scale-y: 0.793; }
        frame 64 { x: 25; y: 57.9; skew-x: 57.7; skew-y: 57.4; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 23.6; y: 59.5; skew-x: 69; skew-y: 68.8; scale-x: 0.796; }
        frame 66 { x: 22.5; y: 60.2; skew-x: 87.2; skew-y: 87; scale-x: 0.795; }
        frame 67 { x: 20.1; y: 62.6; skew-x: 105.1; skew-y: 105; scale-x: -10000; scale-y: 0.792; }
        frame 68 { x: 16.3; y: 66; skew-x: 123.3; skew-y: 123.2; scale-y: -10000; }
        frame 69 { x: 6.1; y: 61.9; skew-x: 128.9; skew-y: 128.9; scale-x: 0.793; scale-y: 0.79; }
        frame 70 { x: -4.1; y: 57.9; skew-x: 134.4; skew-y: 134.4; scale-x: -10000; scale-y: 0.789; }
        frame 71 { x: -14.7; y: 53.6; skew-x: 140.1; skew-y: 140.1; scale-y: 0.79; }
        frame 72 { x: -22; y: 41.8; skew-x: 131.9; skew-y: 131.9; scale-x: 0.792; scale-y: 0.788; }
        frame 73 { x: -29.7; y: 30.1; skew-x: 123.6; skew-y: 123.6; scale-x: 0.791; scale-y: -10000; }
        frame 74 { x: -37.7; y: 18.5; skew-x: 115.6; skew-y: 115.5; scale-x: 0.792; scale-y: 0.789; }
        frame 75 { x: -41.3; y: 12.1; skew-x: 106.1; skew-y: 106.1; scale-x: 0.791; scale-y: 0.788; }
        frame 76 { x: -45.3; y: 6.4; skew-x: 96.8; skew-y: 96.8; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -49.7; y: 0.9; skew-x: 87.7; skew-y: 87.7; }
        frame 78 { x: -54.5; y: -4; skew-x: 78.2; skew-y: 78.2; scale-y: 0.787; }
        frame 79 { x: -72.5; y: 4.9; skew-x: 51.2; skew-y: 51.2; scale-x: 0.788; scale-y: 0.785; }
        frame 80 { x: -90.4; y: 18.5; skew-x: 24.3; skew-y: 24.2; scale-x: 0.789; scale-y: -10000; }
        frame 81 { x: -93.6; y: 27; skew-x: 20.3; skew-y: 20.3; scale-x: 0.788; scale-y: 0.784; }
        frame 82 { x: -96.9; y: 35.5; skew-x: 16.7; skew-y: 16.7; scale-x: -10000; scale-y: 0.785; }
        frame 83 { x: -96.4; y: 42.3; skew-x: 13.3; skew-y: 13.3; scale-x: 0.79; scale-y: 0.787; }
        frame 84 { x: -95.7; y: 48.9; skew-x: 10; skew-y: 10; scale-x: 0.793; scale-y: 0.791; }
        frame 85 { x: -94.7; y: 59.1; skew-x: 5; skew-y: 5; scale-x: 0.796; scale-y: 0.795; }
        frame 86 { x: -93.4; y: 69.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -10000; y: 71; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 88 { y: 72.9; }
        frame 89 { y: 72; }
        frame 90 { y: 71; }
        frame 91 { y: 70; }
        frame 92 { y: 69.1; }
        frame 93 { x: 55.9; y: -10000; }
        frame 94 { x: 56.4; y: 68.5; skew-x: 2; skew-y: 2; }
        frame 95 { x: 56.9; y: 67.8; skew-x: 4.3; skew-y: 4.3; }
        frame 96 { x: 57.5; y: 67.4; skew-x: 6.3; skew-y: 6.3; scale-x: 0.799; scale-y: 0.799; }
        frame 97 { x: 58.1; y: 66.8; skew-x: 8.6; skew-y: 8.6; scale-x: 0.8; scale-y: 0.8; }
        frame 98 { x: 59.4; y: 65.4; skew-x: 12.8; skew-y: 12.8; scale-x: 0.799; scale-y: 0.799; }
        frame 99 { x: 60.8; y: 64.2; skew-x: 17.3; skew-y: 17.3; scale-x: 0.798; scale-y: 0.798; }
        frame 100 { x: 62.2; y: 63; skew-x: 21.6; skew-y: 21.6; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 63.6; y: 61.9; skew-x: 26; skew-y: 26; scale-x: 0.799; scale-y: 0.799; }
        frame 102 { x: -10000; y: 61.5; skew-x: 26.3; skew-y: 26.3; scale-x: 0.798; scale-y: 0.798; }
        frame 103 { y: 61.2; skew-x: 26.8; skew-y: 26.8; scale-x: -10000; scale-y: -10000; }
        frame 104 { y: 60.8; skew-x: 27.3; skew-y: 27.3; }
        frame 105 { y: 60.4; skew-x: 28; skew-y: 28; scale-x: 0.799; scale-y: 0.799; }
        frame 106 { x: 64.1; y: 60.1; skew-x: 29.6; skew-y: 29.6; scale-x: 0.798; scale-y: 0.798; }
        frame 107 { x: 64.7; y: 60; skew-x: 31.3; skew-y: 31.3; scale-x: 0.797; scale-y: 0.797; }
        frame 108 { x: 65.1; y: 59.8; skew-x: 33.1; skew-y: 33.1; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: 65.6; y: 59.6; skew-x: 34.7; skew-y: 34.7; scale-x: 0.798; scale-y: 0.798; }
        frame 110 { x: 62.5; y: 61.8; skew-x: 30.6; skew-y: 30.6; scale-x: 0.797; scale-y: 0.797; }
        frame 111 { x: 59.5; y: 64; skew-x: 26.6; skew-y: 26.6; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 56.4; y: 66.2; skew-x: 22.6; skew-y: 22.6; }
        frame 113 { x: 53.5; y: 68.6; skew-x: 18.7; skew-y: 18.7; scale-x: 0.798; scale-y: 0.798; }
        frame 114 { x: 54.5; y: 68.2; skew-x: 20.3; skew-y: 20.3; scale-x: 0.797; scale-y: 0.797; }
        frame 115 { x: 55.6; y: 67.7; skew-x: 22; skew-y: 22; scale-x: 0.798; scale-y: 0.796; }
        frame 116 { x: 56.6; y: 67.3; skew-x: 23.6; skew-y: 23.6; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 57.6; y: 66.7; skew-x: 25.4; skew-y: 25.3; scale-x: 0.799; scale-y: 0.797; }
        frame 118 { x: 57.8; y: 66.4; skew-x: 26.1; skew-y: 26; scale-x: 0.798; scale-y: 0.795; }
        frame 119 { x: -10000; y: 66.1; skew-x: 26.6; skew-y: 26.6; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 58; y: 65.8; skew-x: 27.3; skew-y: 27.3; scale-x: 0.797; }
        frame 121 { x: 58.2; y: 65.5; skew-x: 28.1; skew-y: 28; scale-x: 0.798; scale-y: 0.796; }
        frame 122 { x: 58.3; y: 65.2; skew-x: 28.6; skew-y: 28.6; scale-x: 0.797; scale-y: 0.795; }
        frame 123 { x: 58.5; y: 65; skew-x: 29.3; skew-y: 29.3; scale-x: -10000; scale-y: -10000; }
        frame 124 { x: 58.6; y: 64.7; skew-x: 30.1; skew-y: 30; scale-x: 0.798; }
        frame 125 { x: 58.8; y: 64.3; skew-x: 30.7; skew-y: 30.7; scale-x: 0.799; scale-y: 0.796; }
        frame 126 { x: 59; y: 63.8; skew-x: 31.9; skew-y: 31.8; scale-x: 0.798; scale-y: 0.795; }
        frame 127 { x: 59.1; y: 63.2; skew-x: 33.1; skew-y: 33.1; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 59.4; y: 62.6; skew-x: 34.6; skew-y: 34.4; }
        frame 129 { x: 59.6; y: 62.1; skew-x: 35.8; skew-y: 35.7; scale-x: 0.799; scale-y: 0.796; }
        frame 130 { x: 58.1; y: 63.6; skew-x: 31.4; skew-y: 31.3; scale-x: 0.797; scale-y: 0.795; }
        frame 131 { x: 56.5; y: 65.2; skew-x: 27.1; skew-y: 27.1; scale-x: -10000; scale-y: 0.796; }
        frame 132 { x: 55; y: 66.8; skew-x: 22.8; skew-y: 22.8; scale-y: -10000; }
        frame 133 { x: 53.5; y: 68.6; skew-x: 18.7; skew-y: 18.7; scale-x: 0.798; scale-y: 0.798; }
        frame 134 { x: 54; y: -10000; skew-x: 14; skew-y: 14; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 54.6; y: 68.7; skew-x: 9.3; skew-y: 9.3; }
        frame 136 { x: 55.2; y: 68.9; skew-x: 4.5; skew-y: 4.5; scale-x: 0.799; scale-y: 0.799; }
        frame 137 { x: 55.9; y: 69.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 52.3; y: 67.9; scale-x: 0.799; scale-y: 0.799; }
        frame 140 { x: 48.6; y: 66.7; skew-x: -0.2; skew-y: -0.2; scale-x: 0.798; scale-y: 0.798; }
        frame 141 { x: 44.8; y: 65.6; skew-x: -0.5; skew-y: -0.5; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 41.5; y: 66.3; skew-x: -5.4; skew-y: -5.4; scale-x: 0.797; scale-y: 0.797; }
        frame 143 { x: 38.3; y: 67.3; skew-x: -10.7; skew-y: -10.7; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 35.2; y: 68.3; skew-x: -15.8; skew-y: -15.8; }
        frame 145 { x: 28.1; y: 71.9; skew-x: -24; skew-y: -24; scale-x: 0.796; scale-y: 0.796; }
        frame 146 { x: 21.2; y: 75.8; skew-x: -32.5; skew-y: -32.5; scale-x: 0.795; scale-y: 0.795; }
        frame 147 { x: 14.9; y: 79.7; skew-x: -40.8; skew-y: -40.8; scale-x: 0.796; scale-y: 0.796; }
        frame 148 { x: 8.5; y: 86.6; skew-x: -49.3; skew-y: -49.3; scale-x: 0.794; scale-y: 0.794; }
        frame 149 { x: 2.6; y: 93.4; skew-x: -58; skew-y: -58; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: -2.6; y: 100.1; skew-x: -66.5; skew-y: -66.5; scale-x: 0.795; scale-y: 0.795; }
        frame 151 { x: -4.9; y: 106.9; skew-x: -70.6; skew-y: -70.6; scale-x: 0.794; scale-y: 0.794; }
        frame 152 { x: -7.2; y: 113.7; skew-x: -74.6; skew-y: -74.6; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: -9.3; y: 120.5; skew-x: -78.7; skew-y: -78.7; }
        frame 154 { x: -9.2; y: 124.7; skew-x: -78.9; skew-y: -78.9; }
        frame 155 { x: -10000; y: 128.9; skew-x: -10000; skew-y: -10000; }
        frame 156 { x: -9.3; y: 133; skew-x: -78.7; skew-y: -78.7; }
        frame 157 { x: -9.4; y: -10000; skew-x: -78.3; skew-y: -79.4; scale-x: 0.771; scale-y: 0.811; }
        frame 158 { x: -9.7; y: 132.9; skew-x: -77.6; skew-y: -80; scale-x: 0.748; scale-y: 0.829; }
        frame 159 { x: -9.5; y: 132.3; skew-x: -78.1; skew-y: -79.6; scale-x: 0.763; scale-y: 0.816; }
        frame 160 { x: -9.3; y: 131.9; skew-x: -78.6; skew-y: -79.4; scale-x: 0.778; scale-y: 0.805; }
        frame 161 { x: -10000; y: 131.4; skew-x: -78.9; skew-y: -78.9; scale-x: 0.794; scale-y: 0.794; }
        frame 162 { x: -9.5; y: 131.9; skew-x: -78.6; skew-y: -79.4; scale-x: 0.778; scale-y: 0.805; }
        frame 163 { x: -9.6; y: 132.4; skew-x: -78.1; skew-y: -79.6; scale-x: 0.763; scale-y: 0.816; }
        frame 164 { x: -9.7; y: 132.9; skew-x: -77.6; skew-y: -80; scale-x: 0.748; scale-y: 0.829; }
        frame 165 { x: 55.9; y: 69.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 166 { x: 56.8; y: 68.9; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 57.6; y: 68.7; skew-x: 3; skew-y: 3; }
        frame 168 { x: 58.5; y: 68.5; skew-x: 4.8; skew-y: 4.8; }
        frame 169 { x: 58.9; y: -10000; skew-x: 5.3; skew-y: 5.3; scale-x: 0.799; scale-y: 0.799; }
        frame 170 { x: 59.4; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 59.9; skew-x: 6.8; skew-y: 6.8; scale-x: 0.8; scale-y: 0.8; }
        frame 172 { x: 60; skew-x: 7.8; skew-y: 7.8; scale-x: 0.799; scale-y: 0.799; }
        frame 173 { x: 60.3; skew-x: 8.8; skew-y: 8.8; scale-x: -10000; scale-y: -10000; }
        frame 174 { x: 60.4; skew-x: 9.9; skew-y: 9.9; scale-x: 0.8; scale-y: 0.8; }
        frame 175 { x: 59.1; y: 69.3; skew-x: 8; skew-y: 8; scale-x: 0.799; scale-y: 0.799; }
        frame 176 { x: 57.6; y: 70.2; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 177 { x: 56.3; y: 71; skew-x: 4.5; skew-y: 4.5; }
        frame 178 { x: 57; y: 70.2; skew-x: -10000; skew-y: -10000; }
        frame 179 { x: 57.8; y: 69.4; }
        frame 180 { x: 58.5; y: 68.5; skew-x: 4.8; skew-y: 4.8; scale-x: 0.8; scale-y: 0.8; }
        frame 181 { x: 58.9; y: -10000; skew-x: 5.3; skew-y: 5.3; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: 59.4; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 59.9; skew-x: 6.8; skew-y: 6.8; scale-x: 0.8; scale-y: 0.8; }
        frame 184 { x: 60; skew-x: 7.8; skew-y: 7.8; scale-x: 0.799; scale-y: 0.799; }
        frame 185 { x: 60.3; skew-x: 8.8; skew-y: 8.8; scale-x: -10000; scale-y: -10000; }
        frame 186 { x: 60.4; skew-x: 9.9; skew-y: 9.9; scale-x: 0.8; scale-y: 0.8; }
        frame 187 { x: 59.1; y: 69.3; skew-x: 8; skew-y: 8; scale-x: 0.799; scale-y: 0.799; }
        frame 188 { x: 57.6; y: 70.2; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 56.3; y: 71; skew-x: 4.5; skew-y: 4.5; }
        frame 190 { x: 56.1; y: 70.4; skew-x: 3; skew-y: 3; }
        frame 191 { x: 56; y: 69.8; skew-x: 1.5; skew-y: 1.5; scale-x: 0.8; scale-y: 0.8; }
        frame 192 { x: 55.9; y: 69.1; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_polevaulter_body1";
        frame-count: 193;
        frame 0 { x: 37.6; y: 39; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_BODY1; }
        frame 1 { x: 37.4; y: 39.9; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 37.1; y: 40.6; skew-x: -0.9; skew-y: -0.9; }
        frame 3 { x: 36.8; y: 41.6; skew-x: -1.4; skew-y: -1.4; }
        frame 4 { x: 36.4; y: 42.3; skew-x: -1.9; skew-y: -1.9; }
        frame 5 { x: 36; y: 43.1; skew-x: -2.5; skew-y: -2.5; }
        frame 6 { x: 35.7; y: 44; skew-x: -3.2; skew-y: -3.2; }
        frame 7 { x: 36.1; y: 43.1; skew-x: -2.5; skew-y: -2.5; }
        frame 8 { x: 36.4; y: 42.3; skew-x: -1.9; skew-y: -1.9; }
        frame 9 { x: 36.8; y: 41.5; skew-x: -1.4; skew-y: -1.4; }
        frame 10 { x: 37.1; y: 40.6; skew-x: -0.9; skew-y: -0.9; }
        frame 11 { x: 37.4; y: 39.9; skew-x: -0.4; skew-y: -0.4; }
        frame 12 { x: 37.6; y: 39; skew-x: 0; skew-y: 0; }
        frame 13 { x: 42; y: 32.4; skew-x: 4.3; skew-y: 4.3; }
        frame 14 { x: 40.6; y: 31.7; skew-x: -10000; skew-y: -10000; }
        frame 15 { x: 39.4; y: 31; }
        frame 16 { x: 38.2; y: 30.4; }
        frame 17 { x: 39.1; y: 29.2; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 40.2; y: 28; skew-x: 7.6; skew-y: 7.6; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 41.3; y: 26.7; skew-x: 9.4; skew-y: 9.4; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { x: 39.8; y: 26.3; skew-x: 7.8; skew-y: 7.8; scale-x: 0.799; scale-y: 0.799; }
        frame 21 { x: 38.4; y: 25.6; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 37; y: 25.1; skew-x: 5.1; skew-y: 5.1; }
        frame 23 { y: 28.8; skew-x: 5; skew-y: 5; }
        frame 24 { x: -10000; y: 32.5; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 37; y: 36.1; skew-x: 5.1; skew-y: 5.1; }
        frame 26 { x: 34.5; y: 40.6; skew-x: 1.6; skew-y: 1.6; }
        frame 27 { x: 32.1; y: 45.1; skew-x: -1.4; skew-y: -1.4; }
        frame 28 { x: 29.6; y: 49.8; skew-x: -4.9; skew-y: -4.9; }
        frame 29 { x: 31.6; y: 46.5; skew-x: -3.2; skew-y: -3.2; }
        frame 30 { x: 33.5; y: 43.3; skew-x: -1.5; skew-y: -1.7; }
        frame 31 { x: 35.3; y: 40.3; skew-x: -0; skew-y: -0.2; scale-x: 0.798; }
        frame 32 { x: 36.3; y: 38.9; skew-x: 2; skew-y: 2; scale-x: -10000; }
        frame 33 { x: 37.3; y: 37.6; skew-x: 4.3; skew-y: 4.3; scale-y: 0.798; }
        frame 34 { x: 38.5; y: 36.3; skew-x: 6.7; skew-y: 6.5; scale-y: -10000; }
        frame 35 { x: 39.4; y: 35.1; skew-x: 8.5; skew-y: 8.3; }
        frame 36 { x: 40; y: 34.2; skew-x: 10.3; skew-y: 10.1; }
        frame 37 { x: 41; y: 33.2; skew-x: 12.2; skew-y: 12.1; }
        frame 38 { x: 40.9; y: 30.9; skew-x: 12.1; skew-y: 12; scale-x: 0.797; }
        frame 39 { x: -10000; y: 28.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 40 { x: 41; y: 26; skew-x: 12.2; skew-y: 12.1; scale-x: 0.798; }
        frame 41 { x: 38.4; y: 30.1; skew-x: 9.3; skew-y: 9.1; scale-x: 0.797; }
        frame 42 { x: 36; y: 34.1; skew-x: 6.5; skew-y: 6.3; scale-x: -10000; }
        frame 43 { x: 33.5; y: 38.4; skew-x: 3.7; skew-y: 3.5; scale-x: 0.798; }
        frame 44 { x: 33.7; y: 40.5; skew-x: 2; skew-y: 1.8; scale-x: 0.797; }
        frame 45 { x: 33.9; y: 42.6; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; }
        frame 46 { x: 34.1; y: 44.6; skew-x: -1; skew-y: -1.2; }
        frame 47 { x: 36.7; y: 40.6; skew-x: 0.5; skew-y: 0.5; scale-x: 0.798; }
        frame 48 { x: 39.1; y: 36.5; skew-x: 2.5; skew-y: 2.3; scale-x: 0.799; scale-y: 0.799; }
        frame 49 { x: 42; y: 32.4; skew-x: 4.3; skew-y: 4.3; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 45; y: 31.5; skew-x: 9; skew-y: 9; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 48.2; y: 30.7; skew-x: 13.8; skew-y: 13.8; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 51.4; y: 30.2; skew-x: 18.6; skew-y: 18.6; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: 54.8; y: 29.8; skew-x: 23.4; skew-y: 23.4; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 43.4; y: -10000; skew-x: 18; skew-y: 17.8; scale-x: 0.798; scale-y: 0.798; }
        frame 56 { x: 32.1; y: 30; skew-x: 12.5; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 21.2; y: 30.4; skew-x: 7.2; skew-y: 7; }
        frame 58 { x: 18.3; y: 30.5; skew-x: 7; skew-y: -10000; }
        frame 59 { x: 15.5; y: 30.4; skew-x: 7.2; }
        frame 60 { x: 16.6; y: 30.2; skew-x: 10.6; skew-y: 10.5; scale-x: 0.797; scale-y: 0.797; }
        frame 61 { x: 17.7; y: 29.9; skew-x: 14.3; skew-y: 14; scale-x: -10000; scale-y: 0.796; }
        frame 62 { x: 19; y: 29.8; skew-x: 17.8; skew-y: 17.6; scale-y: -10000; }
        frame 63 { x: 21.3; y: 30.2; skew-x: 25.3; skew-y: 25.1; scale-x: 0.796; scale-y: 0.795; }
        frame 64 { x: 23.9; y: 31.2; skew-x: 32.8; skew-y: 32.6; scale-x: 0.795; scale-y: -10000; }
        frame 65 { x: 26.5; y: 32.6; skew-x: 40.4; skew-y: 40.2; scale-x: 0.796; }
        frame 66 { x: 31; y: 34.5; skew-x: 50.9; skew-y: 50.7; scale-x: 0.795; scale-y: 0.794; }
        frame 67 { x: 35.4; y: 37.3; skew-x: 61.4; skew-y: 61.2; scale-x: 0.796; scale-y: -10000; }
        frame 68 { x: 39.4; y: 41.1; skew-x: 72; skew-y: 71.6; scale-x: 0.797; scale-y: 0.795; }
        frame 69 { x: 31.2; y: 39.4; skew-x: 77.7; skew-y: 77.4; scale-x: 0.796; scale-y: 0.794; }
        frame 70 { x: 22.9; y: 38; skew-x: 83.2; skew-y: 83; scale-x: 0.795; scale-y: -10000; }
        frame 71 { x: 14.4; y: 36.6; skew-x: 88.9; skew-y: 88.5; scale-x: -10000; scale-y: 0.793; }
        frame 72 { x: 10.6; y: 29.3; skew-x: 93.3; skew-y: 92.8; scale-x: 0.794; scale-y: -10000; }
        frame 73 { x: 6.7; y: 22.2; skew-x: 97.6; skew-y: 97.3; scale-x: -10000; scale-y: 0.792; }
        frame 74 { x: 2.6; y: 15.2; skew-x: 102.2; skew-y: 101.8; scale-y: 0.793; }
        frame 75 { x: -0.2; y: 13.1; skew-x: 105.5; skew-y: 105.3; scale-x: 0.793; scale-y: 0.792; }
        frame 76 { x: -3.3; y: 11.1; skew-x: 109; skew-y: 108.6; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -6.4; y: 9.2; skew-x: 112.3; skew-y: 112.1; scale-y: 0.791; }
        frame 78 { x: -9.6; y: 7.4; skew-x: 115.9; skew-y: 115.6; scale-y: 0.792; }
        frame 79 { x: -25; y: 2.1; skew-x: 104.8; skew-y: 104.5; scale-x: 0.792; scale-y: 0.791; }
        frame 80 { x: -41.4; y: -2.5; skew-x: 93.8; skew-y: 93.5; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -50.9; y: -1.8; skew-x: 81.4; skew-y: 81; scale-y: 0.79; }
        frame 82 { x: -61.4; y: -0; skew-x: 68.7; skew-y: 68.4; scale-x: 0.791; scale-y: -10000; }
        frame 83 { x: -71; y: 4.3; skew-x: 54.9; skew-y: 54.7; scale-x: -10000; }
        frame 84 { x: -81; y: 10.3; skew-x: 41.1; skew-y: 41.1; scale-x: 0.794; scale-y: 0.793; }
        frame 85 { x: -95.9; y: 22.8; skew-x: 20.5; skew-y: 20.5; scale-x: 0.796; scale-y: 0.795; }
        frame 86 { x: -109.2; y: 39; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -114.3; y: 47.1; skew-x: -6.4; skew-y: -6.4; scale-x: 0.825; scale-y: 0.778; }
        frame 88 { x: -118.9; y: 55.8; skew-x: -13.2; skew-y: -13.2; scale-x: 0.85; scale-y: 0.756; }
        frame 89 { x: -116.6; y: 51.4; skew-x: -9.7; skew-y: -9.7; scale-x: 0.837; scale-y: 0.767; }
        frame 90 { x: -114.1; y: 47.2; skew-x: -6.4; skew-y: -6.4; scale-x: 0.825; scale-y: 0.778; }
        frame 91 { x: -111.7; y: 43; skew-x: -3.2; skew-y: -3.2; scale-x: 0.812; scale-y: 0.789; }
        frame 92 { x: -109.2; y: 39; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 93 { x: 40.1; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 41.4; y: 38.1; skew-x: 1.8; skew-y: 1.8; }
        frame 95 { x: 42.5; y: 37.4; skew-x: 3.5; skew-y: 3.5; }
        frame 96 { x: 43.7; y: 36.5; skew-x: 5.3; skew-y: 5.3; }
        frame 97 { x: 45; y: 35.7; skew-x: 7.1; skew-y: 7.1; }
        frame 98 { x: 46.5; y: 34.7; skew-x: 8.6; skew-y: 8.6; scale-x: 0.799; scale-y: 0.799; }
        frame 99 { x: 48.1; y: 33.6; skew-x: 10.3; skew-y: 10.3; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 49.6; y: 32.5; skew-x: 11.8; skew-y: 11.8; }
        frame 101 { x: 51.2; y: 31.5; skew-x: 13.6; skew-y: 13.6; }
        frame 102 { x: 52.9; y: 30.1; skew-x: 15.5; skew-y: 15.5; }
        frame 103 { x: 54.6; y: 28.8; skew-x: 17.3; skew-y: 17.3; scale-x: 0.798; scale-y: 0.798; }
        frame 104 { x: 56.4; y: 27.6; skew-x: 19.3; skew-y: 19.3; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 58.2; y: 26.4; skew-x: 21.2; skew-y: 21.2; scale-x: 0.799; scale-y: 0.799; }
        frame 106 { x: 59.1; y: 26.1; skew-x: 22.5; skew-y: 22.5; scale-x: 0.798; scale-y: 0.798; }
        frame 107 { x: 60.1; y: 25.7; skew-x: 23.8; skew-y: 23.8; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 61.1; y: 25.4; skew-x: 25.1; skew-y: 25.1; }
        frame 109 { x: 62.2; y: 25; skew-x: 26.5; skew-y: 26.5; scale-x: 0.799; scale-y: 0.799; }
        frame 110 { x: 56.5; y: 28.2; skew-x: 21.8; skew-y: 21.8; scale-x: 0.798; scale-y: 0.798; }
        frame 111 { x: 50.9; y: 31.5; skew-x: 17.3; skew-y: 17.3; scale-x: 0.797; scale-y: 0.797; }
        frame 112 { x: 45.4; y: 35.1; skew-x: 12.6; skew-y: 12.6; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 40; y: 38.6; skew-x: 8.1; skew-y: 8.1; scale-x: 0.798; scale-y: 0.798; }
        frame 114 { x: 40.6; y: -10000; skew-x: 8.6; skew-y: 8.6; scale-x: 0.797; scale-y: 0.797; }
        frame 115 { x: 41.5; y: 38.4; skew-x: 9.3; skew-y: 9.3; scale-x: 0.798; scale-y: -10000; }
        frame 116 { x: 42.2; y: 38.3; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; }
        frame 117 { x: 43; y: 38.1; skew-x: 10.6; skew-y: 10.5; scale-x: 0.799; }
        frame 118 { x: 44.1; y: 37.1; skew-x: 11.8; skew-y: 11.6; scale-x: 0.798; scale-y: 0.796; }
        frame 119 { x: 45.1; y: 36.3; skew-x: 13.1; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 46.3; y: 35.4; skew-x: 14.3; skew-y: 14.3; }
        frame 121 { x: 47.5; y: 34.4; skew-x: 15.8; skew-y: 15.6; }
        frame 122 { x: 48.6; y: 33.5; skew-x: 17; skew-y: 16.8; scale-y: 0.795; }
        frame 123 { x: 49.9; y: 32.6; skew-x: 18.3; skew-y: 18.3; scale-y: -10000; }
        frame 124 { x: 51; y: 31.8; skew-x: 19.8; skew-y: 19.6; scale-y: 0.796; }
        frame 125 { x: 52.2; y: 31; skew-x: 21.1; skew-y: 21; scale-x: 0.799; scale-y: -10000; }
        frame 126 { x: 54.1; y: 29.9; skew-x: 23.8; skew-y: 23.6; scale-x: 0.798; scale-y: 0.795; }
        frame 127 { x: 56.2; y: 29.1; skew-x: 26.3; skew-y: 26.3; scale-x: 0.797; scale-y: -10000; }
        frame 128 { x: 58.1; y: 28.1; skew-x: 29.1; skew-y: 28.9; scale-x: -10000; }
        frame 129 { x: 60.1; y: 27.2; skew-x: 31.7; skew-y: 31.6; scale-x: 0.798; scale-y: 0.796; }
        frame 130 { x: 55.6; y: 29.6; skew-x: 26.3; skew-y: 26.1; scale-x: 0.797; scale-y: 0.795; }
        frame 131 { x: 51.1; y: 32.3; skew-x: 20.8; skew-y: 20.8; scale-x: -10000; scale-y: 0.796; }
        frame 132 { x: 46.6; y: 35.3; skew-x: 15.3; skew-y: 15.3; scale-y: -10000; }
        frame 133 { x: 42.4; y: 38.6; skew-x: 9.9; skew-y: 9.9; scale-y: 0.797; }
        frame 134 { x: 41.8; y: 38.7; skew-x: 7.3; skew-y: 7.3; scale-x: 0.798; scale-y: 0.798; }
        frame 135 { x: 41.1; y: 38.8; skew-x: 4.8; skew-y: 4.8; scale-x: -10000; scale-y: -10000; }
        frame 136 { x: 40.6; y: 38.9; skew-x: 2.3; skew-y: 2.3; scale-x: 0.799; scale-y: 0.799; }
        frame 137 { x: 40.1; y: 39; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 38.6; y: 36.5; skew-x: 3.3; skew-y: 3.3; scale-x: 0.799; scale-y: 0.799; }
        frame 140 { x: 37.4; y: 34; skew-x: 6.8; skew-y: 6.8; scale-x: 0.798; scale-y: 0.798; }
        frame 141 { x: 36.1; y: 31.6; skew-x: 10.2; skew-y: 10.2; scale-x: 0.797; scale-y: 0.797; }
        frame 142 { x: 32.8; y: 30.2; skew-x: 11.6; skew-y: 11.6; scale-x: 0.796; scale-y: 0.796; }
        frame 143 { x: 29.7; y: 28.9; skew-x: 13.1; skew-y: 13.1; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 26.5; y: 27.5; skew-x: 14.7; skew-y: 14.7; }
        frame 145 { x: 19; y: 28.9; skew-x: 14.1; skew-y: 14.1; scale-x: 0.795; scale-y: 0.795; }
        frame 146 { x: 11.5; y: 30.3; skew-x: 13.5; skew-y: 13.5; scale-x: 0.794; scale-y: 0.794; }
        frame 147 { x: 4; y: 31.7; skew-x: 13; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: -7.2; y: 39.2; skew-x: 8.1; skew-y: 8.1; scale-x: 0.793; scale-y: 0.793; }
        frame 149 { x: -18.3; y: 46.8; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: -29.2; y: 54.6; skew-x: -1.4; skew-y: -1.4; scale-x: 0.792; scale-y: 0.792; }
        frame 151 { x: -34.7; y: 63.7; skew-x: -5.7; skew-y: -5.7; scale-x: -10000; scale-y: -10000; }
        frame 152 { x: -40; y: 73; skew-x: -10; skew-y: -10; }
        frame 153 { x: -45.2; y: 82.5; skew-x: -14.5; skew-y: -14.5; }
        frame 154 { x: -45.3; y: 86.6; skew-x: -14.4; skew-y: -14.4; scale-x: 0.791; scale-y: 0.791; }
        frame 155 { x: -10000; y: 90.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 156 { x: -45.2; y: 95; skew-x: -14.5; skew-y: -14.5; scale-x: 0.792; scale-y: 0.792; }
        frame 157 { x: -52.7; y: 113.2; skew-x: -42; skew-y: -44; scale-x: 0.769; scale-y: 0.804; }
        frame 158 { x: -53.1; y: 132.6; skew-x: -69.6; skew-y: -73.4; scale-x: 0.749; scale-y: 0.818; }
        frame 159 { x: -52.8; y: 129.7; skew-x: -67.3; skew-y: -69.8; scale-x: 0.761; scale-y: 0.808; }
        frame 160 { x: -52.7; y: 126.7; skew-x: -64.8; skew-y: -66.1; scale-x: 0.774; scale-y: 0.797; }
        frame 161 { x: -52.3; y: 123.8; skew-x: -62.3; skew-y: -62.3; scale-x: 0.788; scale-y: 0.788; }
        frame 162 { x: -52.6; y: 126.6; skew-x: -64.8; skew-y: -66.1; scale-x: 0.774; scale-y: 0.797; }
        frame 163 { x: -52.7; y: 129.7; skew-x: -67.3; skew-y: -69.8; scale-x: 0.761; scale-y: 0.808; }
        frame 164 { x: -53.1; y: 132.6; skew-x: -69.6; skew-y: -73.4; scale-x: 0.749; scale-y: 0.818; }
        frame 165 { x: 40.1; y: 39; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 166 { x: 42.3; y: 38; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 44.6; y: 37.1; skew-x: 4.5; skew-y: 4.5; }
        frame 168 { x: 46.9; y: 36.3; skew-x: 6.8; skew-y: 6.8; }
        frame 169 { x: 48.6; y: 35.9; skew-x: 8.5; skew-y: 8.5; scale-x: 0.799; scale-y: 0.799; }
        frame 170 { x: 50.5; y: 35.4; skew-x: 10.5; skew-y: 10.5; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 52.1; y: 35; skew-x: 12.4; skew-y: 12.4; }
        frame 172 { x: 53.6; y: 34.4; skew-x: 14.3; skew-y: 14.3; }
        frame 173 { x: 55.1; y: 34; skew-x: 16.3; skew-y: 16.3; scale-x: 0.798; scale-y: 0.798; }
        frame 174 { x: 56.5; y: 33.4; skew-x: 18.5; skew-y: 18.5; scale-x: 0.799; scale-y: 0.799; }
        frame 175 { x: 51; y: 35.4; skew-x: 12.8; skew-y: 12.8; scale-x: 0.798; scale-y: 0.798; }
        frame 176 { x: 45.8; y: 37.6; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 177 { x: 40.7; y: 40; skew-x: 1.9; skew-y: 1.9; }
        frame 178 { x: 42.8; y: 38.8; skew-x: 3.5; skew-y: 3.5; scale-x: 0.799; scale-y: 0.799; }
        frame 179 { x: 44.6; y: 37.5; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 46.9; y: 36.3; skew-x: 6.8; skew-y: 6.8; scale-x: 0.8; scale-y: 0.8; }
        frame 181 { x: 48.6; y: 35.9; skew-x: 8.5; skew-y: 8.5; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: 50.5; y: 35.4; skew-x: 10.5; skew-y: 10.5; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 52.1; y: 35; skew-x: 12.4; skew-y: 12.4; }
        frame 184 { x: 53.6; y: 34.4; skew-x: 14.3; skew-y: 14.3; }
        frame 185 { x: 55.1; y: 34; skew-x: 16.3; skew-y: 16.3; scale-x: 0.798; scale-y: 0.798; }
        frame 186 { x: 56.5; y: 33.4; skew-x: 18.5; skew-y: 18.5; scale-x: 0.799; scale-y: 0.799; }
        frame 187 { x: 51; y: 35.4; skew-x: 12.8; skew-y: 12.8; scale-x: 0.798; scale-y: 0.798; }
        frame 188 { x: 45.8; y: 37.6; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 40.7; y: 40; skew-x: 1.9; skew-y: 1.9; }
        frame 190 { x: 40.4; y: 39.6; skew-x: 1.3; skew-y: 1.3; scale-x: 0.799; scale-y: 0.799; }
        frame 191 { x: 40.2; y: 39.4; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 192 { x: 40.1; y: 39; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 193;
        frame 0 { x: 18; y: 11.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_HEAD; }
        frame 1 { x: 17.2; y: 12.3; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 16.3; y: 13.3; skew-x: -1.4; skew-y: -1.4; }
        frame 3 { x: 15.9; y: 14.2; skew-x: -1.7; skew-y: -1.7; }
        frame 4 { x: 15.5; y: 15.4; skew-x: -2.2; skew-y: -2.2; }
        frame 5 { x: 15; y: 16.4; skew-x: -2.7; skew-y: -2.7; }
        frame 6 { x: 14.5; y: 17.5; skew-x: -3.2; skew-y: -3.2; }
        frame 7 { x: 14.6; y: 16.4; skew-x: -3.4; skew-y: -3.4; }
        frame 8 { x: 14.8; y: 15.3; skew-x: -3.7; skew-y: -3.7; }
        frame 9 { x: 15.6; y: 14.3; skew-x: -2.7; skew-y: -2.7; }
        frame 10 { x: 16.4; y: 13.3; skew-x: -1.7; skew-y: -1.7; }
        frame 11 { x: 17.2; y: 12.3; skew-x: -0.7; skew-y: -0.7; }
        frame 12 { x: 18; y: 11.3; skew-x: 0; skew-y: 0; }
        frame 13 { x: 24.5; y: 3.3; skew-x: 4.3; skew-y: 4.3; }
        frame 14 { x: 23.2; y: 2.6; skew-x: -10000; skew-y: -10000; }
        frame 15 { x: 22; y: 1.9; }
        frame 16 { x: 20.7; y: 1.3; }
        frame 17 { x: 23.8; y: -1.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 26.9; y: -3.6; skew-x: 10.3; skew-y: 10.3; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 30.2; y: -6.1; skew-x: 13.4; skew-y: 13.4; }
        frame 20 { x: 27.8; y: -6.3; skew-x: 11.8; skew-y: 11.8; }
        frame 21 { x: 25.7; y: -6.6; skew-x: 10.5; skew-y: 10.5; }
        frame 22 { x: 23.4; y: -6.9; skew-x: 9.1; skew-y: 9.1; }
        frame 23 { x: -10000; y: -3.2; skew-x: 9; skew-y: 9; }
        frame 24 { y: 0.3; skew-x: -10000; skew-y: -10000; }
        frame 25 { y: 4; skew-x: 9.1; skew-y: 9.1; }
        frame 26 { x: 18.3; y: 10.1; skew-x: 4.5; skew-y: 4.5; }
        frame 27 { x: 13.3; y: 16.3; skew-x: 0; skew-y: 0; }
        frame 28 { x: 8.6; y: 22.6; skew-x: -4.4; skew-y: -4.4; }
        frame 29 { x: 11.3; y: 18.8; skew-x: -2.7; skew-y: -2.7; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: 13.9; y: 15; skew-x: -1; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 16.6; y: 11.4; skew-x: 0.4; skew-y: 0.2; }
        frame 32 { x: 18.9; y: 9.4; skew-x: 2.5; skew-y: 2.5; }
        frame 33 { x: 21.1; y: 7.4; skew-x: 4.8; skew-y: 4.8; }
        frame 34 { x: 23.4; y: 5.4; skew-x: 7.2; skew-y: 7; }
        frame 35 { x: 25.2; y: 4; skew-x: 9; skew-y: 8.8; scale-x: 0.797; }
        frame 36 { x: 27; y: 2.5; skew-x: 10.8; skew-y: 10.6; scale-x: -10000; scale-y: 0.797; }
        frame 37 { x: 28.9; y: 1.1; skew-x: 12.7; skew-y: 12.6; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 28.8; y: -1; skew-x: 12.6; skew-y: 12.5; scale-x: 0.797; scale-y: 0.797; }
        frame 39 { x: -10000; y: -3.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 28.9; y: -6; skew-x: 12.7; skew-y: 12.6; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 24.8; y: -1.1; skew-x: 9.8; skew-y: 9.6; scale-x: 0.797; scale-y: 0.797; }
        frame 42 { x: 20.8; y: 3.6; skew-x: 7; skew-y: 6.8; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 16.8; y: 8.5; skew-x: 4.2; skew-y: 4; }
        frame 44 { x: 15.1; y: 12; skew-x: 1; skew-y: 0.8; }
        frame 45 { x: 13.6; y: 15.4; skew-x: -1.7; skew-y: -1.9; }
        frame 46 { x: 12.3; y: 19.1; skew-x: -4.9; skew-y: -5; }
        frame 47 { x: 16.3; y: 13.8; skew-x: -1.7; skew-y: -1.7; scale-x: 0.798; scale-y: 0.798; }
        frame 48 { x: 20.2; y: 8.6; skew-x: 1.1; skew-y: 1; scale-x: 0.799; scale-y: 0.799; }
        frame 49 { x: 24.5; y: 3.3; skew-x: 4.3; skew-y: 4.3; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 30.1; y: 1.4; skew-x: 9; skew-y: 9; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 35.9; y: -0.2; skew-x: 13.8; skew-y: 13.8; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 41.8; y: -1.7; skew-x: 18.6; skew-y: 18.6; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: 47.9; y: -3.1; skew-x: 23.4; skew-y: 23.4; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 33.5; y: -2.1; skew-x: 18; skew-y: 17.8; scale-x: 0.798; scale-y: 0.798; }
        frame 56 { x: 19.2; y: -0.7; skew-x: 12.5; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 5.2; y: 0.6; skew-x: 7.2; skew-y: 7; }
        frame 58 { x: 2.4; y: 0.7; skew-x: 7; skew-y: -10000; }
        frame 59 { x: -0.3; y: 0.6; skew-x: 7.2; }
        frame 60 { x: 2.5; y: 0.4; skew-x: 10.3; skew-y: 10; scale-x: 0.797; scale-y: 0.797; }
        frame 61 { x: 5.5; y: 0.2; skew-x: 13.3; skew-y: 13.1; scale-x: 0.796; scale-y: 0.796; }
        frame 62 { x: 8.7; y: 0.1; skew-x: 16.5; skew-y: 16.3; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 15; y: 0.6; skew-x: 23.6; skew-y: 23.3; scale-x: 0.795; scale-y: 0.794; }
        frame 64 { x: 21.6; y: 1.3; skew-x: 30.8; skew-y: 30.6; scale-x: 0.794; scale-y: -10000; }
        frame 65 { x: 28.2; y: 2.5; skew-x: 37.9; skew-y: 37.7; scale-x: 0.795; }
        frame 66 { x: 38; y: 5.8; skew-x: 47.6; skew-y: 47.4; scale-x: 0.794; scale-y: 0.793; }
        frame 67 { x: 47.8; y: 9.8; skew-x: 57.4; skew-y: 56.9; scale-x: 0.793; scale-y: 0.792; }
        frame 68 { x: 57.4; y: 14.3; skew-x: 67; skew-y: 66.7; scale-x: 0.794; scale-y: 0.793; }
        frame 69 { x: 58.5; y: 21.3; skew-x: 86.4; skew-y: 86; scale-x: 0.793; scale-y: 0.792; }
        frame 70 { x: 57.5; y: 30.7; skew-x: 105.5; skew-y: 105.1; scale-x: 0.791; scale-y: 0.79; }
        frame 71 { x: 53.6; y: 42; skew-x: 124.8; skew-y: 124.4; scale-x: 0.79; scale-y: 0.789; }
        frame 72 { x: 49.1; y: 37.8; skew-x: 129.1; skew-y: 128.8; scale-x: 0.789; scale-y: 0.788; }
        frame 73 { x: 44.4; y: 33.5; skew-x: 133.6; skew-y: 133.3; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 39.6; y: 29.4; skew-x: 138.1; skew-y: 137.7; scale-x: 0.79; scale-y: 0.789; }
        frame 75 { x: 35.5; y: 29.6; skew-x: 141.6; skew-y: 141.2; scale-x: 0.788; scale-y: 0.787; }
        frame 76 { x: 31.3; y: 29.7; skew-x: 144.9; skew-y: 144.6; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 27.1; y: 29.9; skew-x: 148.4; skew-y: 148.1; }
        frame 78 { x: 22.8; y: 30; skew-x: 151.8; skew-y: 151.5; scale-x: 0.789; scale-y: 0.788; }
        frame 79 { x: 10.5; y: 18.1; skew-x: 140.9; skew-y: 140.4; scale-x: 0.787; scale-y: 0.786; }
        frame 80 { x: -2.7; y: 6; skew-x: 129.7; skew-y: 129.4; scale-x: 0.788; scale-y: 0.787; }
        frame 81 { x: -15.9; y: -9.1; skew-x: 103.5; skew-y: 103; scale-x: 0.787; scale-y: 0.786; }
        frame 82 { x: -34; y: -21; skew-x: 77.3; skew-y: 76.9; scale-x: 0.786; scale-y: 0.785; }
        frame 83 { x: -51.9; y: -22; skew-x: 61.9; skew-y: 61.7; scale-x: 0.787; scale-y: 0.786; }
        frame 84 { x: -70.5; y: -21.3; skew-x: 46.4; skew-y: 46.1; scale-x: 0.79; scale-y: 0.79; }
        frame 85 { x: -100.7; y: -7.1; skew-x: 23.1; skew-y: 23; scale-x: 0.794; scale-y: 0.794; }
        frame 86 { x: -128.8; y: 11.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -139.4; y: 24.6; skew-x: -11.2; skew-y: -13.2; scale-x: 0.815; scale-y: 0.79; }
        frame 88 { x: -149; y: 38.8; skew-x: -22.5; skew-y: -26.6; scale-x: 0.832; scale-y: 0.782; }
        frame 89 { x: -145.9; y: 33.9; skew-x: -20.7; skew-y: -22.7; scale-x: 0.814; scale-y: 0.789; }
        frame 90 { x: -142.7; y: 29.1; skew-x: -18.8; skew-y: -18.8; scale-x: 0.798; scale-y: 0.798; }
        frame 91 { x: -135.9; y: 19.9; skew-x: -9.2; skew-y: -9.2; scale-x: 0.799; scale-y: 0.799; }
        frame 92 { x: -128.8; y: 11.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 93 { x: 20.5; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 23.3; y: 9.3; skew-x: 2.8; skew-y: 2.8; }
        frame 95 { x: 26.2; y: 7.3; skew-x: 5.5; skew-y: 5.5; scale-x: 0.799; scale-y: 0.799; }
        frame 96 { x: 29.2; y: 5.3; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 32.1; y: 3.5; skew-x: 11.4; skew-y: 11.4; }
        frame 98 { x: 35.7; y: 1.5; skew-x: 14.3; skew-y: 14.3; }
        frame 99 { x: 39.4; y: -0.4; skew-x: 17.5; skew-y: 17.5; scale-x: 0.798; scale-y: 0.798; }
        frame 100 { x: 42.9; y: -2.3; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 46.6; y: -4.1; skew-x: 23.7; skew-y: 23.7; scale-x: 0.799; scale-y: 0.799; }
        frame 102 { x: 50.1; y: -5.8; skew-x: 26.5; skew-y: 26.5; scale-x: 0.798; scale-y: 0.798; }
        frame 103 { x: 53.6; y: -7.5; skew-x: 29.3; skew-y: 29.3; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 57.1; y: -9; skew-x: 32.1; skew-y: 32.1; scale-x: 0.797; scale-y: 0.797; }
        frame 105 { x: 60.6; y: -10.6; skew-x: 34.9; skew-y: 34.9; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 63.5; y: -11; skew-x: 37.4; skew-y: 37.4; scale-x: 0.797; scale-y: 0.797; }
        frame 107 { x: 66.4; y: -11.5; skew-x: 39.9; skew-y: 39.9; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 69.2; y: -11.8; skew-x: 42.4; skew-y: 42.4; }
        frame 109 { x: 72.1; y: -12.1; skew-x: 44.9; skew-y: 44.9; scale-x: 0.798; scale-y: 0.798; }
        frame 110 { x: 56.7; y: -7.2; skew-x: 31.3; skew-y: 31.3; scale-x: 0.796; scale-y: 0.796; }
        frame 111 { x: 42; y: -0.7; skew-x: 17.8; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 28; y: 7; skew-x: 4.3; skew-y: 4.3; }
        frame 113 { x: 15.2; y: 15.8; skew-x: -8.9; skew-y: -8.9; scale-x: 0.795; scale-y: 0.795; }
        frame 114 { x: 16.1; y: 16; skew-x: -8.5; skew-y: -8.5; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 16.8; y: 16.3; skew-x: -8.3; skew-y: -8.3; scale-x: 0.796; }
        frame 116 { x: 21.9; y: 11.3; skew-x: -0.2; skew-y: -0.2; scale-x: 0.797; }
        frame 117 { x: 27.2; y: 6.7; skew-x: 7.4; skew-y: 7.4; scale-x: 0.798; }
        frame 118 { x: 29.9; y: 5; skew-x: 9.8; skew-y: 9.8; scale-x: 0.797; scale-y: 0.794; }
        frame 119 { x: 32.5; y: 3.4; skew-x: 12; skew-y: 12; scale-x: 0.796; scale-y: -10000; }
        frame 120 { x: 35.3; y: 1.7; skew-x: 14.3; skew-y: 14.3; scale-x: -10000; scale-y: 0.793; }
        frame 121 { x: 38.1; y: 0.1; skew-x: 16.8; skew-y: 16.8; scale-y: 0.794; }
        frame 122 { x: 40.9; y: -1.3; skew-x: 19.1; skew-y: 19.1; scale-y: 0.793; }
        frame 123 { x: 43.9; y: -2.8; skew-x: 21.5; skew-y: 21.5; scale-y: -10000; }
        frame 124 { x: 46.6; y: -4.3; skew-x: 23.8; skew-y: 23.8; }
        frame 125 { x: 49.5; y: -5.8; skew-x: 26.3; skew-y: 26.3; scale-x: 0.797; scale-y: 0.794; }
        frame 126 { x: 53.9; y: -6.6; skew-x: 29.6; skew-y: 29.6; scale-x: 0.795; scale-y: 0.793; }
        frame 127 { x: 58.4; y: -7.4; skew-x: 32.9; skew-y: 32.9; scale-x: -10000; scale-y: 0.792; }
        frame 128 { x: 62.9; y: -8.1; skew-x: 36.3; skew-y: 36.3; scale-y: -10000; }
        frame 129 { x: 67.3; y: -8.7; skew-x: 39.7; skew-y: 39.7; scale-x: 0.796; scale-y: 0.793; }
        frame 130 { x: 50.4; y: -3.1; skew-x: 25.3; skew-y: 25.3; scale-x: 0.795; scale-y: -10000; }
        frame 131 { x: 34.3; y: 3.9; skew-x: 11; skew-y: 11; scale-x: -10000; scale-y: 0.794; }
        frame 132 { x: 24.1; y: 11.2; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 133 { x: 14.6; y: 19.2; skew-x: -11; skew-y: -11; scale-y: 0.795; }
        frame 134 { x: 14.2; y: 19.4; skew-x: -11.7; skew-y: -11.7; scale-y: -10000; }
        frame 135 { x: 13.6; y: 19.7; skew-x: -12.7; skew-y: -12.7; scale-x: 0.797; scale-y: 0.797; }
        frame 136 { x: 16.9; y: 15.5; skew-x: -6.2; skew-y: -6.2; scale-x: 0.798; scale-y: 0.798; }
        frame 137 { x: 20.5; y: 11.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 139 { cel: -10000; }
        frame 165 { cel: 0; }
        frame 166 { x: 25; y: 8.9; skew-x: 3.8; skew-y: 3.8; cel: -10000; }
        frame 167 { x: 29.7; y: 6.7; skew-x: 7.6; skew-y: 7.6; scale-x: 0.799; scale-y: 0.799; }
        frame 168 { x: 34.6; y: 4.3; skew-x: 11.6; skew-y: 11.6; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 38.6; y: 3; skew-x: 14.8; skew-y: 14.8; }
        frame 170 { x: 42.9; y: 1.8; skew-x: 18.3; skew-y: 18.3; scale-x: 0.798; scale-y: 0.798; }
        frame 171 { x: 47.1; y: 0.5; skew-x: 21.7; skew-y: 21.7; scale-x: 0.799; scale-y: 0.799; }
        frame 172 { x: 50.1; y: -0.5; skew-x: 23.6; skew-y: 23.6; scale-x: 0.789; scale-y: 0.819; }
        frame 173 { x: 53.3; y: -1.6; skew-x: 25.6; skew-y: 25.6; scale-x: 0.779; scale-y: 0.839; }
        frame 174 { x: 56.6; y: -2.7; skew-x: 27.8; skew-y: 27.8; scale-x: 0.77; scale-y: 0.861; }
        frame 175 { x: 43.6; y: 1.8; skew-x: 15.8; skew-y: 15.8; scale-x: 0.769; scale-y: 0.86; }
        frame 176 { x: 31.2; y: 7.6; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: 0.859; }
        frame 177 { x: 19.7; y: 14.2; skew-x: -8; skew-y: -8; scale-y: -10000; }
        frame 178 { x: 19; y: 15.9; skew-x: -10.7; skew-y: -10.7; scale-x: 0.779; scale-y: 0.839; }
        frame 179 { x: 26.5; y: 9.7; skew-x: 0.3; skew-y: 0.3; scale-x: 0.789; scale-y: 0.819; }
        frame 180 { x: 34.6; y: 4.3; skew-x: 11.6; skew-y: 11.6; scale-x: 0.799; scale-y: 0.799; }
        frame 181 { x: 38.6; y: 3; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 42.9; y: 1.8; skew-x: 18.3; skew-y: 18.3; scale-x: 0.798; scale-y: 0.798; }
        frame 183 { x: 47.1; y: 0.5; skew-x: 21.7; skew-y: 21.7; scale-x: 0.799; scale-y: 0.799; }
        frame 184 { x: 50.1; y: -0.5; skew-x: 23.6; skew-y: 23.6; scale-x: 0.789; scale-y: 0.819; }
        frame 185 { x: 53.3; y: -1.6; skew-x: 25.6; skew-y: 25.6; scale-x: 0.779; scale-y: 0.839; }
        frame 186 { x: 56.6; y: -2.7; skew-x: 27.8; skew-y: 27.8; scale-x: 0.77; scale-y: 0.861; }
        frame 187 { x: 43; y: 1.5; skew-x: 15.8; skew-y: 15.8; scale-x: 0.769; scale-y: 0.86; }
        frame 188 { x: 29.9; y: 6.9; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: 0.859; }
        frame 189 { x: 17.7; y: 13.2; skew-x: -8; skew-y: -8; scale-y: -10000; }
        frame 190 { x: 14.3; y: 17.1; skew-x: -12.5; skew-y: -12.5; scale-x: 0.779; scale-y: 0.839; }
        frame 191 { x: 17.4; y: 14; skew-x: -6.2; skew-y: -6.2; scale-x: 0.789; scale-y: 0.819; }
        frame 192 { x: 20.5; y: 11.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 193;
        frame 0 { x: 23.1; y: 43.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_JAW; }
        frame 1 { x: 22.6; y: 43.6; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 22.2; y: 44; skew-x: -1.4; skew-y: -1.4; }
        frame 3 { x: 22; y: 45.4; skew-x: -1.7; skew-y: -1.7; }
        frame 4 { x: 21.8; y: 46.9; skew-x: -2.2; skew-y: -2.2; }
        frame 5 { x: 21.6; y: 48.4; skew-x: -2.7; skew-y: -2.7; }
        frame 6 { x: 21.3; y: 49.8; skew-x: -3.2; skew-y: -3.2; }
        frame 7 { x: 21.8; y: 49.4; skew-x: -5.9; skew-y: -5.9; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 22.4; y: 49.1; skew-x: -9; skew-y: -9; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 22.5; y: 47.7; skew-x: -6.7; skew-y: -6.7; }
        frame 10 { x: 22.7; y: 46.2; skew-x: -4.4; skew-y: -4.4; scale-x: 0.8; scale-y: 0.8; }
        frame 11 { x: 22.8; y: 44.7; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 23.1; y: 43.3; skew-x: 0; skew-y: 0; }
        frame 13 { x: 27.1; y: 35.4; skew-x: 4.3; skew-y: 4.3; }
        frame 14 { x: 25.8; y: 34.8; skew-x: -10000; skew-y: -10000; }
        frame 15 { x: 24.6; y: 34.1; }
        frame 16 { x: 23.3; y: 33.4; }
        frame 17 { x: 24.7; y: 31.6; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 26.2; y: 29.9; skew-x: 10.3; skew-y: 10.3; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 27.7; y: 28.1; skew-x: 13.4; skew-y: 13.4; }
        frame 20 { x: 26.3; y: 27.5; skew-x: 11.8; skew-y: 11.8; }
        frame 21 { x: 24.8; y: 26.9; skew-x: 10.5; skew-y: 10.5; }
        frame 22 { x: 23.5; y: 26.2; skew-x: 9.1; skew-y: 9.1; }
        frame 23 { x: -10000; y: 27.1; skew-x: 9; skew-y: 9; }
        frame 24 { y: 31.3; skew-x: -10000; skew-y: -10000; }
        frame 25 { y: 35.5; skew-x: 9.1; skew-y: 9.1; }
        frame 26 { x: 21.1; y: 42.4; skew-x: 4.5; skew-y: 4.5; }
        frame 27 { x: 18.7; y: 49.5; skew-x: 0; skew-y: 0; }
        frame 28 { x: 16.4; y: 56.5; skew-x: -4.4; skew-y: -4.4; }
        frame 29 { x: 18.2; y: 52.1; skew-x: -2.7; skew-y: -2.7; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: 19.8; y: 47.8; skew-x: -1; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 21.5; y: 43.5; skew-x: 0.4; skew-y: 0.2; }
        frame 32 { x: 22.5; y: 41.3; skew-x: 2.5; skew-y: 2.5; }
        frame 33 { x: 23.3; y: 39.1; skew-x: 4.8; skew-y: 4.8; }
        frame 34 { x: 24.3; y: 36.9; skew-x: 7.2; skew-y: 7; }
        frame 35 { x: 25; y: 36.6; skew-x: 9; skew-y: 8.8; scale-x: 0.797; }
        frame 36 { x: 25.7; y: 36.1; skew-x: 10.8; skew-y: 10.6; scale-x: -10000; scale-y: 0.797; }
        frame 37 { x: 26.4; y: 35.7; skew-x: 12.7; skew-y: 12.6; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: -10000; y: 33.4; skew-x: 12.6; skew-y: 12.5; scale-x: 0.797; scale-y: 0.797; }
        frame 39 { y: 30.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { y: 28.5; skew-x: 12.7; skew-y: 12.6; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 24; y: 31.3; skew-x: 9.8; skew-y: 9.6; scale-x: 0.797; scale-y: 0.797; }
        frame 42 { x: 21.7; y: 36.7; skew-x: 6.8; skew-y: 6.8; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 19.5; y: 42; skew-x: 4.2; skew-y: 4; }
        frame 44 { x: 19.6; y: 45.4; skew-x: 1.3; skew-y: 1; }
        frame 45 { x: 20; y: 48.6; skew-x: -1.4; skew-y: -1.5; }
        frame 46 { x: 20.3; y: 52.1; skew-x: -4.3; skew-y: -4.5; }
        frame 47 { x: 21.4; y: 47.8; skew-x: -2.7; skew-y: -2.9; scale-x: 0.798; scale-y: 0.798; }
        frame 48 { x: 24.3; y: 41.6; skew-x: 0.8; skew-y: 0.5; scale-x: 0.799; scale-y: 0.799; }
        frame 49 { x: 27.1; y: 35.4; skew-x: 4.3; skew-y: 4.3; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 30.1; y: 34.3; skew-x: 8; skew-y: 8; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 33.1; y: 33.1; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 36.3; y: 32.1; skew-x: 15.5; skew-y: 15.5; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: 39.4; y: 31; skew-x: 19.4; skew-y: 19.4; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 28.6; y: 31.6; skew-x: 15.3; skew-y: 15.3; scale-x: 0.798; scale-y: 0.798; }
        frame 56 { x: 17.8; y: 32.2; skew-x: 11.1; skew-y: 11.1; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 7; y: 32.8; skew-x: 7.2; skew-y: 7.2; }
        frame 58 { x: 4.1; y: 31.6; skew-x: 7; skew-y: 7; }
        frame 59 { x: 1.3; y: 30.3; skew-x: 7.2; skew-y: 7.2; }
        frame 60 { x: 2.7; y: 30.6; skew-x: 10.3; skew-y: 10.3; scale-x: 0.797; scale-y: 0.797; }
        frame 61 { x: 4.2; y: 31.1; skew-x: 13.3; skew-y: 13.3; scale-x: 0.796; scale-y: 0.796; }
        frame 62 { x: 5.7; y: 31.4; skew-x: 16.5; skew-y: 16.5; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 7.9; y: 31.6; skew-x: 19.6; skew-y: 19.6; scale-x: 0.795; scale-y: 0.795; }
        frame 64 { x: 10.2; y: 31.8; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 12.4; y: 32; skew-x: 26.1; skew-y: 26.1; scale-x: 0.796; }
        frame 66 { x: 18.2; y: 31.3; skew-x: 39.6; skew-y: 39.6; scale-x: 0.794; scale-y: 0.793; }
        frame 67 { x: 24.4; y: -10000; skew-x: 53.4; skew-y: 53.2; scale-x: 0.793; scale-y: -10000; }
        frame 68 { x: 30.9; y: 32.2; skew-x: 67; skew-y: 66.8; scale-x: 0.794; }
        frame 69 { x: 28.8; y: 30.4; skew-x: 86.2; skew-y: 85.9; scale-x: 0.792; scale-y: 0.792; }
        frame 70 { x: 26; y: 30; skew-x: 104.8; skew-y: 104.8; scale-x: 0.791; scale-y: 0.79; }
        frame 71 { x: 22.5; y: 30.8; skew-x: 124; skew-y: 123.8; scale-x: 0.79; scale-y: -10000; }
        frame 72 { x: 19; y: 24.2; skew-x: 128.4; skew-y: 128.1; scale-x: 0.789; scale-y: 0.788; }
        frame 73 { x: 15.5; y: 17.8; skew-x: 132.9; skew-y: 132.6; scale-x: 0.788; scale-y: -10000; }
        frame 74 { x: 11.8; y: 11.3; skew-x: 137.3; skew-y: 137.1; scale-x: 0.79; scale-y: 0.789; }
        frame 75 { x: 8.9; y: 10; skew-x: 140.7; skew-y: 140.6; scale-x: 0.788; scale-y: 0.788; }
        frame 76 { x: 6; y: 8.6; skew-x: 144.2; skew-y: 143.9; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 3.1; y: 7.2; skew-x: 147.7; skew-y: 147.4; scale-y: 0.787; }
        frame 78 { x: 0.1; y: 5.8; skew-x: 151.1; skew-y: 150.8; scale-x: 0.789; scale-y: 0.788; }
        frame 79 { x: -16.1; y: -0.9; skew-x: 139.9; skew-y: 139.9; scale-x: 0.787; scale-y: 0.787; }
        frame 80 { x: -32.8; y: -7.7; skew-x: 128.9; skew-y: 128.7; scale-x: 0.788; scale-y: -10000; }
        frame 81 { x: -47.2; y: -10000; skew-x: 102.6; skew-y: 102.3; scale-x: 0.786; scale-y: 0.786; }
        frame 82 { x: -63.2; y: -5.6; skew-x: 76.5; skew-y: 76.3; scale-x: -10000; scale-y: 0.785; }
        frame 83 { x: -74.7; y: -1.3; skew-x: 61.2; skew-y: 61.2; scale-x: 0.787; scale-y: 0.787; }
        frame 84 { x: -86.3; y: 3.6; skew-x: 45.9; skew-y: 45.8; scale-x: 0.79; scale-y: 0.79; }
        frame 85 { x: -105.6; y: 22.4; skew-x: 22.8; skew-y: 22.8; scale-x: 0.794; scale-y: 0.794; }
        frame 86 { x: -123.8; y: 43.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -127.1; y: 54.4; skew-x: -11.2; skew-y: -10.2; scale-x: 0.815; scale-y: 0.79; }
        frame 88 { x: -129.8; y: 65.7; skew-x: -22.5; skew-y: -20.5; scale-x: 0.832; scale-y: 0.781; }
        frame 89 { x: -128.6; y: 63.4; skew-x: -24; skew-y: -21; scale-x: 0.814; scale-y: 0.79; }
        frame 90 { x: -127.5; y: 61; skew-x: -25.6; skew-y: -21.8; scale-x: 0.798; scale-y: 0.801; }
        frame 91 { x: -125.9; y: 52.1; skew-x: -12.7; skew-y: -10.7; scale-x: -10000; scale-y: 0.8; }
        frame 92 { x: -123.8; y: 43.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: -10000; }
        frame 93 { x: 25.5; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 94 { x: 26.8; y: 41.4; skew-x: 2.8; skew-y: 2.8; }
        frame 95 { x: 28.1; y: 39.5; skew-x: 5.5; skew-y: 5.5; scale-x: 0.799; scale-y: 0.799; }
        frame 96 { x: 29.6; y: 37.6; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 30.9; y: 35.7; skew-x: 11.4; skew-y: 11.4; }
        frame 98 { x: 32.8; y: 34; skew-x: 14.3; skew-y: 14.3; }
        frame 99 { x: 34.6; y: 32.3; skew-x: 17.5; skew-y: 17.5; scale-x: 0.798; scale-y: 0.798; }
        frame 100 { x: 36.5; y: 30.6; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 38.5; y: 29; skew-x: 23.7; skew-y: 23.7; scale-x: 0.799; scale-y: 0.799; }
        frame 102 { x: 40.5; y: 27; skew-x: 26.5; skew-y: 26.5; scale-x: 0.798; scale-y: 0.798; }
        frame 103 { x: 42.5; y: 25; skew-x: 29.3; skew-y: 29.3; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 44.3; y: 23.1; skew-x: 32.1; skew-y: 32.1; scale-x: 0.797; scale-y: 0.797; }
        frame 105 { x: 46.2; y: 21.1; skew-x: 34.9; skew-y: 34.9; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 48.1; y: 20.2; skew-x: 37.4; skew-y: 37.4; scale-x: 0.797; scale-y: 0.797; }
        frame 107 { x: 49.9; y: 19.2; skew-x: 39.9; skew-y: 39.9; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 51.7; y: 18.3; skew-x: 42.4; skew-y: 42.4; }
        frame 109 { x: 53.5; y: 17.4; skew-x: 44.9; skew-y: 44.9; scale-x: 0.798; scale-y: 0.798; }
        frame 110 { x: 45.1; y: 24.2; skew-x: 30.1; skew-y: 30.1; scale-x: 0.796; scale-y: 0.796; }
        frame 111 { x: 37.3; y: 31.5; skew-x: 15.5; skew-y: 15.5; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 32; y: 39.7; skew-x: 3.3; skew-y: 3.3; scale-x: 0.795; scale-y: 0.795; }
        frame 113 { x: 27.3; y: 48.3; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 114 { x: 27.8; y: 49; skew-x: -10; skew-y: -10; scale-y: 0.794; }
        frame 115 { x: 28.3; y: 49.6; skew-x: -11.3; skew-y: -11.3; scale-x: 0.796; scale-y: -10000; }
        frame 116 { x: 28.7; y: 44; skew-x: -1.7; skew-y: -1.7; scale-x: 0.797; scale-y: 0.795; }
        frame 117 { x: 29.6; y: 38.9; skew-x: 7.4; skew-y: 7.4; scale-x: 0.798; scale-y: -10000; }
        frame 118 { x: 30.9; y: 37.7; skew-x: 9.8; skew-y: 9.8; scale-x: 0.797; scale-y: 0.794; }
        frame 119 { x: 32.1; y: 36.6; skew-x: 12; skew-y: 12; scale-x: 0.796; scale-y: -10000; }
        frame 120 { x: 33.5; y: 35.6; skew-x: 14.3; skew-y: 14.3; scale-x: -10000; scale-y: 0.793; }
        frame 121 { x: 34.7; y: 34.5; skew-x: 16.8; skew-y: 16.8; scale-y: 0.794; }
        frame 122 { x: 36.1; y: 32.6; skew-x: 19.1; skew-y: 19.1; scale-y: 0.793; }
        frame 123 { x: 37.4; y: 30.8; skew-x: 21.5; skew-y: 21.5; scale-y: -10000; }
        frame 124 { x: 38.8; y: 29; skew-x: 23.8; skew-y: 23.8; }
        frame 125 { x: 40.3; y: 27.1; skew-x: 26.3; skew-y: 26.3; scale-x: 0.797; scale-y: 0.794; }
        frame 126 { x: 42.8; y: 25.7; skew-x: 29.6; skew-y: 29.6; scale-x: 0.795; scale-y: 0.793; }
        frame 127 { x: 45.4; y: 24.3; skew-x: 32.9; skew-y: 32.9; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 48.1; y: 22.9; skew-x: 36.3; skew-y: 36.3; scale-y: 0.792; }
        frame 129 { x: 50.8; y: 21.5; skew-x: 39.7; skew-y: 39.7; scale-x: 0.796; scale-y: 0.793; }
        frame 130 { x: 42.8; y: 28.4; skew-x: 25.3; skew-y: 25.3; scale-x: 0.795; scale-y: -10000; }
        frame 131 { x: 35.3; y: 35.9; skew-x: 11; skew-y: 11; scale-x: -10000; scale-y: 0.794; }
        frame 132 { x: 31.4; y: 43.5; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 133 { x: 27.9; y: 51.2; skew-x: -11; skew-y: -11; scale-y: 0.795; }
        frame 134 { x: 27.3; y: 51.4; skew-x: -11.7; skew-y: -11.7; scale-y: -10000; }
        frame 135 { x: 26.9; y: 51.6; skew-x: -12.7; skew-y: -12.7; scale-x: 0.797; scale-y: 0.797; }
        frame 136 { x: 26.1; y: 47.5; skew-x: -6.2; skew-y: -6.2; scale-x: 0.798; scale-y: 0.798; }
        frame 137 { x: 25.5; y: 43.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 139 { cel: -10000; }
        frame 165 { cel: 0; }
        frame 166 { x: 28; y: 41.5; skew-x: 3.3; skew-y: 3.3; cel: -10000; }
        frame 167 { x: 30.6; y: 39.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 168 { x: 33.4; y: 38; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 35.4; y: 37; skew-x: 11.5; skew-y: 11.5; }
        frame 170 { x: 37.4; y: 36.1; skew-x: 13.3; skew-y: 13.3; scale-x: 0.798; scale-y: 0.798; }
        frame 171 { x: 39.3; y: 35.1; skew-x: 15.1; skew-y: 15.1; scale-x: 0.799; scale-y: 0.799; }
        frame 172 { x: 40.9; y: 34.6; skew-x: 17.1; skew-y: 17.1; scale-x: 0.798; scale-y: 0.798; }
        frame 173 { x: 42.3; y: 34.1; skew-x: 19.1; skew-y: 19.1; scale-x: -10000; scale-y: -10000; }
        frame 174 { x: 43.9; y: 33.6; skew-x: 21.2; skew-y: 21.2; }
        frame 175 { x: 38; y: 37.4; skew-x: 12.3; skew-y: 12.3; scale-x: 0.797; scale-y: 0.797; }
        frame 176 { x: 32.3; y: 41.1; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 177 { x: 26.9; y: 45.1; skew-x: -5.5; skew-y: -5.5; scale-x: 0.796; scale-y: 0.796; }
        frame 178 { x: 31.1; y: 43.9; skew-x: -9.5; skew-y: -9.5; scale-x: 0.797; scale-y: 0.797; }
        frame 179 { x: 32.5; y: 40.8; skew-x: 0; skew-y: 0; scale-x: 0.798; scale-y: 0.798; }
        frame 180 { x: 34.4; y: 38; skew-x: 9.8; skew-y: 9.8; scale-x: 0.799; scale-y: 0.799; }
        frame 181 { x: 36.1; y: 37.1; skew-x: 11.5; skew-y: 11.5; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 37.8; y: 36.1; skew-x: 13.3; skew-y: 13.3; scale-x: 0.798; scale-y: 0.798; }
        frame 183 { x: 39.3; y: 35.1; skew-x: 15.1; skew-y: 15.1; scale-x: 0.799; scale-y: 0.799; }
        frame 184 { x: 40.9; y: 34.6; skew-x: 17.1; skew-y: 17.1; scale-x: 0.798; scale-y: 0.798; }
        frame 185 { x: 42.3; y: 34.1; skew-x: 19.1; skew-y: 19.1; scale-x: -10000; scale-y: -10000; }
        frame 186 { x: 43.9; y: 33.6; skew-x: 21.2; skew-y: 21.2; }
        frame 187 { x: 37.8; y: 36.6; skew-x: 12.3; skew-y: 12.3; scale-x: 0.797; scale-y: 0.797; }
        frame 188 { x: 31.9; y: 39.6; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 26.4; y: 42.8; skew-x: -5.5; skew-y: -5.5; scale-x: 0.796; scale-y: 0.796; }
        frame 190 { x: 27.3; y: 44.6; skew-x: -11.3; skew-y: -11.3; scale-x: 0.797; scale-y: 0.797; }
        frame 191 { x: 26.4; y: 44; skew-x: -5.5; skew-y: -5.5; scale-x: 0.798; scale-y: 0.798; }
        frame 192 { x: 25.5; y: 43.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_hair";
        frame-count: 193;
        frame 0 { x: 10.5; y: 6.7; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_HAIR; }
        frame 1 { x: 9.6; y: 8.1; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 8.6; y: 9.6; skew-x: -1.4; skew-y: -1.4; }
        frame 3 { x: 8.1; y: 11; skew-x: -1.7; skew-y: -1.7; }
        frame 4 { x: 7.6; y: 12.5; skew-x: -2.2; skew-y: -2.2; }
        frame 5 { x: 7.2; y: 14.1; skew-x: -2.7; skew-y: -2.7; }
        frame 6 { x: 6.8; y: 15.6; skew-x: -3.2; skew-y: -3.2; }
        frame 7 { x: 7.7; y: 13.8; skew-x: -2.2; skew-y: -2.2; }
        frame 8 { x: 8.6; y: 12.1; skew-x: -1.4; skew-y: -1.4; }
        frame 9 { x: 9.1; y: 10.6; skew-x: -0.9; skew-y: -0.9; }
        frame 10 { x: 9.5; y: 9.4; skew-x: -0.7; skew-y: -0.7; }
        frame 11 { x: 10; y: 8; skew-x: -0.2; skew-y: -0.2; }
        frame 12 { x: 10.5; y: 6.7; skew-x: 0; skew-y: 0; }
        frame 13 { x: 17.3; y: -1.7; skew-x: 4.3; skew-y: 4.3; }
        frame 14 { x: 16.1; y: -2.3; skew-x: -10000; skew-y: -10000; }
        frame 15 { x: 14.8; y: -3; }
        frame 16 { x: 13.6; y: -3.7; }
        frame 17 { x: 17.6; y: -7.3; skew-x: 8.8; skew-y: 8.8; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 21.9; y: -10.8; skew-x: 13.3; skew-y: 13.3; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 26.2; y: -14.1; skew-x: 17.7; skew-y: 17.7; }
        frame 20 { x: 23.7; y: -10000; skew-x: 16.3; skew-y: 16.3; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 21.2; y: -14.3; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 18.9; y: -14.5; skew-x: 13.4; skew-y: 13.4; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 18.8; y: -13.3; skew-x: 13.3; skew-y: 13.3; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 18.9; y: -8.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -10000; y: -3.5; skew-x: 13.4; skew-y: 13.4; scale-x: 0.799; scale-y: 0.799; }
        frame 26 { x: 13.1; y: 3.3; skew-x: 8.8; skew-y: 8.8; scale-x: 0.798; scale-y: 0.798; }
        frame 27 { x: 7.7; y: 10.3; skew-x: 4.3; skew-y: 4.3; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 2.4; y: 17.3; skew-x: -0.1; skew-y: -0.1; }
        frame 29 { x: 5.1; y: 15.2; skew-x: 1.3; skew-y: 1.3; }
        frame 30 { x: 7.9; y: 10.4; skew-x: 3; skew-y: 2.8; }
        frame 31 { x: 10.7; y: 5.6; skew-x: 4.7; skew-y: 4.5; }
        frame 32 { x: 13.2; y: 3.4; skew-x: 6.8; skew-y: 6.8; }
        frame 33 { x: 15.7; y: 1.2; skew-x: 9.1; skew-y: 9; scale-y: 0.797; }
        frame 34 { x: 18.3; y: -1; skew-x: 11.5; skew-y: 11.3; scale-y: 0.798; }
        frame 35 { x: 20.4; y: -2.5; skew-x: 13.3; skew-y: 13.1; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: 22.4; y: -4.1; skew-x: 15.1; skew-y: 15; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 24.5; y: -5.8; skew-x: 17; skew-y: 16.9; scale-x: 0.798; }
        frame 38 { x: -10000; y: -8.2; skew-x: -10000; skew-y: 16.8; scale-x: 0.797; }
        frame 39 { y: -10.6; skew-y: -10000; scale-x: -10000; }
        frame 40 { y: -13.1; skew-y: 16.9; scale-x: 0.798; }
        frame 41 { x: 20; y: -10.2; skew-x: 14.1; skew-y: 14; scale-x: 0.797; }
        frame 42 { x: 15.6; y: -4; skew-x: 11.3; skew-y: 11; scale-x: 0.796; scale-y: 0.796; }
        frame 43 { x: 11.4; y: 2.1; skew-x: 8.5; skew-y: 8.3; scale-x: 0.797; scale-y: 0.797; }
        frame 44 { x: 10.6; y: 5.3; skew-x: 6.8; skew-y: 6.6; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 9.9; y: 8.3; skew-x: 5.3; skew-y: 5; }
        frame 46 { x: 9; y: 11.5; skew-x: 3.7; skew-y: 3.5; }
        frame 47 { x: 10.6; y: 9.5; skew-x: 2.3; skew-y: 2.3; scale-x: 0.798; scale-y: 0.798; }
        frame 48 { x: 13.9; y: 3.9; skew-x: 3.3; skew-y: 3.3; scale-x: 0.799; scale-y: 0.799; }
        frame 49 { x: 17.3; y: -1.7; skew-x: 4.3; skew-y: 4.3; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 23.3; y: -4.1; skew-x: 9; skew-y: 9; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 29.7; y: -6.3; skew-x: 13.8; skew-y: 13.8; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 36.1; y: -8.4; skew-x: 18.6; skew-y: 18.6; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: 42.8; y: -10.4; skew-x: 23.4; skew-y: 23.4; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 27.8; y: -8.6; skew-x: 18; skew-y: 17.8; scale-x: 0.798; scale-y: 0.798; }
        frame 56 { x: 12.9; y: -6.7; skew-x: 12.5; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: -1.6; y: -4.8; skew-x: 7.2; skew-y: 7; }
        frame 58 { x: -4.4; y: -4.7; skew-x: 7; skew-y: -10000; }
        frame 59 { x: -7.3; y: -4.8; skew-x: 7.2; }
        frame 60 { x: -4; y: -5.2; skew-x: 10.3; skew-y: 10; scale-x: 0.797; scale-y: 0.797; }
        frame 61 { x: -0.6; y: -5.6; skew-x: 13.3; skew-y: 13.1; scale-x: 0.796; scale-y: 0.796; }
        frame 62 { x: 2.9; y: -6.1; skew-x: 16.5; skew-y: 16.3; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 9.9; y: -6.3; skew-x: 23.6; skew-y: 23.3; scale-x: 0.795; scale-y: 0.794; }
        frame 64 { x: 17.3; y: -6.1; skew-x: 30.8; skew-y: 30.6; scale-x: 0.794; scale-y: -10000; }
        frame 65 { x: 24.9; y: -5.5; skew-x: 37.9; skew-y: 37.7; scale-x: 0.795; }
        frame 66 { x: 36.1; y: -2.7; skew-x: 47.6; skew-y: 47.4; scale-x: 0.794; scale-y: 0.793; }
        frame 67 { x: 47.4; y: 1; skew-x: 57.4; skew-y: 56.9; scale-x: 0.793; scale-y: 0.792; }
        frame 68 { x: 58.6; y: 5.7; skew-x: 67; skew-y: 66.7; scale-x: 0.794; scale-y: 0.793; }
        frame 69 { x: 63.4; y: 15.5; skew-x: 90.3; skew-y: 90; scale-x: 0.793; scale-y: 0.792; }
        frame 70 { x: 65.5; y: 29.8; skew-x: 113.5; skew-y: 113.1; scale-x: 0.79; scale-y: 0.789; }
        frame 71 { x: 63.3; y: 47.4; skew-x: 136.8; skew-y: 136.5; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 58.3; y: 43.8; skew-x: 141.4; skew-y: 140.9; scale-x: 0.788; scale-y: 0.787; }
        frame 73 { x: 53; y: 40.4; skew-x: 145.7; skew-y: 145.4; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 47.7; y: 36.9; skew-x: 150.1; skew-y: 149.8; scale-x: 0.789; scale-y: 0.788; }
        frame 75 { x: 43.1; y: 37.5; skew-x: 153.7; skew-y: 153.2; scale-x: 0.788; scale-y: 0.787; }
        frame 76 { x: 38.5; y: 38.1; skew-x: 157.2; skew-y: 156.7; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 33.6; y: 38.6; skew-x: 160.5; skew-y: 160.2; }
        frame 78 { x: 28.8; y: 39.3; skew-x: 163.9; skew-y: 163.5; scale-x: 0.789; scale-y: 0.788; }
        frame 79 { x: 18.2; y: 25.9; skew-x: 152.9; skew-y: 152.5; scale-x: 0.787; scale-y: 0.786; }
        frame 80 { x: 6.2; y: 12.3; skew-x: 141.8; skew-y: 141.4; scale-x: 0.788; scale-y: 0.787; }
        frame 81 { x: -6; y: -7.8; skew-x: 115.6; skew-y: 115.1; scale-x: 0.786; scale-y: 0.785; }
        frame 82 { x: -23.5; y: -24.3; skew-x: 89.4; skew-y: 89; scale-x: 0.785; scale-y: 0.784; }
        frame 83 { x: -45.3; y: -27.5; skew-x: 71.7; skew-y: 71.2; scale-x: 0.787; scale-y: 0.786; }
        frame 84 { x: -68.1; y: -28; skew-x: 53.6; skew-y: 53.4; scale-x: 0.79; scale-y: 0.789; }
        frame 85 { x: -103.9; y: -13.5; skew-x: 26.8; skew-y: 26.6; scale-x: 0.794; scale-y: 0.794; }
        frame 86 { x: -136.4; y: 6.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -148.3; y: 23; skew-x: -11.2; skew-y: -13.2; scale-x: 0.815; scale-y: 0.79; }
        frame 88 { x: -159; y: 40.1; skew-x: -22.5; skew-y: -26.6; scale-x: 0.832; scale-y: 0.782; }
        frame 89 { x: -155.6; y: 35; skew-x: -20.7; skew-y: -22.7; scale-x: 0.814; scale-y: 0.789; }
        frame 90 { x: -151.9; y: 29.7; skew-x: -18.8; skew-y: -18.8; scale-x: 0.798; scale-y: 0.798; }
        frame 91 { x: -144.4; y: 18; skew-x: -9.2; skew-y: -9.2; scale-x: 0.799; scale-y: 0.799; }
        frame 92 { x: -136.4; y: 6.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 93 { x: 12.9; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 16; y: 4.5; skew-x: 2.8; skew-y: 2.8; }
        frame 95 { x: 19.1; y: 2.1; skew-x: 5.5; skew-y: 5.5; scale-x: 0.799; scale-y: 0.799; }
        frame 96 { x: 22.4; y: -0.2; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 25.7; y: -2.4; skew-x: 11.4; skew-y: 11.4; }
        frame 98 { x: 29.6; y: -4.7; skew-x: 14.3; skew-y: 14.3; }
        frame 99 { x: 33.5; y: -7.1; skew-x: 17.5; skew-y: 17.5; scale-x: 0.798; scale-y: 0.798; }
        frame 100 { x: 37.6; y: -9.3; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 41.6; y: -11.5; skew-x: 23.7; skew-y: 23.7; scale-x: 0.799; scale-y: 0.799; }
        frame 102 { x: 45.5; y: -13.3; skew-x: 26.5; skew-y: 26.5; scale-x: 0.798; scale-y: 0.798; }
        frame 103 { x: 49.4; y: -15.2; skew-x: 29.3; skew-y: 29.3; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 53.3; y: -16.9; skew-x: 32.1; skew-y: 32.1; scale-x: 0.797; scale-y: 0.797; }
        frame 105 { x: 57.1; y: -18.8; skew-x: 34.9; skew-y: 34.9; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 60.5; y: -19.6; skew-x: 37.4; skew-y: 37.4; scale-x: 0.797; scale-y: 0.797; }
        frame 107 { x: 63.9; y: -20.2; skew-x: 39.9; skew-y: 39.9; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 67.2; y: -21; skew-x: 42.4; skew-y: 42.4; }
        frame 109 { x: 70.5; y: -21.7; skew-x: 44.9; skew-y: 44.9; scale-x: 0.798; scale-y: 0.798; }
        frame 110 { x: 51.7; y: -14.3; skew-x: 30.1; skew-y: 30.1; scale-x: 0.796; scale-y: 0.796; }
        frame 111 { x: 34; y: -5.1; skew-x: 15.5; skew-y: 15.5; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 19.9; y: 3.1; skew-x: 3.3; skew-y: 3.3; scale-x: 0.795; scale-y: 0.795; }
        frame 113 { x: 6.9; y: 12.2; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 114 { x: 7.9; y: 12; skew-x: -7.9; skew-y: -7.9; }
        frame 115 { x: 9; y: 11.8; skew-x: -7; skew-y: -7; scale-x: 0.796; }
        frame 116 { x: 15; y: 6.4; skew-x: 0; skew-y: 0; scale-x: 0.797; }
        frame 117 { x: 21.5; y: 1.1; skew-x: 7.4; skew-y: 7.4; scale-x: 0.798; }
        frame 118 { x: 24.4; y: -0.7; skew-x: 9.8; skew-y: 9.8; scale-x: 0.797; scale-y: 0.794; }
        frame 119 { x: 27.3; y: -2.5; skew-x: 12; skew-y: 12; scale-x: 0.796; scale-y: -10000; }
        frame 120 { x: 30.1; y: -4.3; skew-x: 14.3; skew-y: 14.3; scale-x: -10000; scale-y: 0.793; }
        frame 121 { x: 33; y: -6.2; skew-x: 16.8; skew-y: 16.8; scale-y: 0.794; }
        frame 122 { x: 36.1; y: -8; skew-x: 19.1; skew-y: 19.1; scale-y: 0.793; }
        frame 123 { x: 39.2; y: -10; skew-x: 21.5; skew-y: 21.5; scale-y: -10000; }
        frame 124 { x: 42.1; y: -11.8; skew-x: 23.8; skew-y: 23.8; }
        frame 125 { x: 45.3; y: -13.6; skew-x: 26.3; skew-y: 26.3; scale-x: 0.797; scale-y: 0.794; }
        frame 126 { x: 50; y: -14.7; skew-x: 29.6; skew-y: 29.6; scale-x: 0.795; scale-y: 0.793; }
        frame 127 { x: 54.8; y: -15.8; skew-x: 32.9; skew-y: 32.9; scale-x: -10000; scale-y: 0.792; }
        frame 128 { x: 59.6; y: -16.8; skew-x: 36.3; skew-y: 36.3; scale-y: -10000; }
        frame 129 { x: 64.2; y: -17.7; skew-x: 39.7; skew-y: 39.7; scale-x: 0.796; scale-y: 0.793; }
        frame 130 { x: 45.6; y: -10.2; skew-x: 25.3; skew-y: 25.3; scale-x: 0.795; scale-y: -10000; }
        frame 131 { x: 28.3; y: -1.1; skew-x: 11; skew-y: 11; scale-x: -10000; scale-y: 0.794; }
        frame 132 { x: 17.3; y: 7.1; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 133 { x: 7.6; y: 16; skew-x: -11; skew-y: -11; scale-y: 0.795; }
        frame 134 { x: 6.8; y: 16.5; skew-x: -11.7; skew-y: -11.7; scale-y: -10000; }
        frame 135 { x: 6.1; y: 17.1; skew-x: -12.7; skew-y: -12.7; scale-x: 0.797; scale-y: 0.797; }
        frame 136 { x: 9.3; y: 11.6; skew-x: -6.2; skew-y: -6.2; scale-x: 0.798; scale-y: 0.798; }
        frame 137 { x: 12.9; y: 6.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 139 { cel: -10000; }
        frame 165 { cel: 0; }
        frame 166 { x: 17.9; y: 3.9; skew-x: 3.8; skew-y: 3.8; cel: -10000; }
        frame 167 { x: 22.9; y: 1.1; skew-x: 7.6; skew-y: 7.6; scale-x: 0.799; scale-y: 0.799; }
        frame 168 { x: 28.2; y: -1.5; skew-x: 11.6; skew-y: 11.6; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 32.6; y: -3.1; skew-x: 14.8; skew-y: 14.8; }
        frame 170 { x: 37.3; y: -4.8; skew-x: 18.3; skew-y: 18.3; scale-x: 0.798; scale-y: 0.798; }
        frame 171 { x: 42.1; y: -6.4; skew-x: 21.7; skew-y: 21.7; scale-x: 0.799; scale-y: 0.799; }
        frame 172 { x: 45; y: -7.1; skew-x: 23.6; skew-y: 23.6; scale-x: 0.798; scale-y: 0.798; }
        frame 173 { x: 48; y: -7.9; skew-x: 25.6; skew-y: 25.6; scale-x: -10000; scale-y: -10000; }
        frame 174 { x: 51; y: -8.8; skew-x: 27.8; skew-y: 27.8; scale-x: 0.799; scale-y: 0.799; }
        frame 175 { x: 36.6; y: -1.7; skew-x: 15.3; skew-y: 15.3; scale-x: 0.797; scale-y: 0.797; }
        frame 176 { x: 23.3; y: 6.2; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 177 { x: 11.4; y: 15.1; skew-x: -9.3; skew-y: -9.3; }
        frame 178 { x: 10; y: 16.5; skew-x: -11.5; skew-y: -11.5; }
        frame 179 { x: 18.5; y: 7.1; skew-x: 0; skew-y: 0; scale-x: 0.798; scale-y: 0.798; }
        frame 180 { x: 28.2; y: -1.5; skew-x: 11.6; skew-y: 11.6; scale-x: 0.799; scale-y: 0.799; }
        frame 181 { x: 32.6; y: -3.1; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 37.3; y: -4.8; skew-x: 18.3; skew-y: 18.3; scale-x: 0.798; scale-y: 0.798; }
        frame 183 { x: 42.1; y: -6.4; skew-x: 21.7; skew-y: 21.7; scale-x: 0.799; scale-y: 0.799; }
        frame 184 { x: 45; y: -7.1; skew-x: 23.6; skew-y: 23.6; scale-x: 0.798; scale-y: 0.798; }
        frame 185 { x: 48; y: -7.9; skew-x: 25.6; skew-y: 25.6; scale-x: -10000; scale-y: -10000; }
        frame 186 { x: 51; y: -8.8; skew-x: 27.8; skew-y: 27.8; scale-x: 0.799; scale-y: 0.799; }
        frame 187 { x: 36; y: -2.1; skew-x: 15.3; skew-y: 15.3; scale-x: 0.797; scale-y: 0.797; }
        frame 188 { x: 22; y: 5.6; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 9.4; y: 14.1; skew-x: -9.3; skew-y: -9.3; }
        frame 190 { x: 5.4; y: 17.9; skew-x: -13.3; skew-y: -13.3; }
        frame 191 { x: 9; y: 12.2; skew-x: -6.5; skew-y: -6.5; scale-x: 0.798; scale-y: 0.798; }
        frame 192 { x: 12.9; y: 6.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_outerarm_hand";
        frame-count: 193;
        frame 0 { x: 43.6; y: 87.4; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_OUTERARM_HAND; }
        frame 1 { x: 45.1; y: 88.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 46.6; y: 90; }
        frame 3 { x: 47.3; y: 90.9; }
        frame 4 { x: 48; y: 91.8; }
        frame 5 { x: 48.8; y: 92.7; }
        frame 6 { x: 49.5; y: 93.6; }
        frame 7 { x: 48; y: 92.7; }
        frame 8 { x: 46.6; y: 91.7; }
        frame 9 { x: 45.8; y: 90.6; }
        frame 10 { x: 45.1; y: 89.6; }
        frame 11 { x: 44.4; y: 88.5; }
        frame 12 { x: 43.6; y: 87.4; }
        frame 13 { x: 46; y: 76; skew-x: 31; skew-y: 31; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 46.1; y: 75.9; skew-x: 24.3; skew-y: 24.3; scale-x: 0.797; scale-y: 0.797; }
        frame 15 { x: -10000; y: 76.1; skew-x: 17.6; skew-y: 17.6; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 46.4; y: 76.4; skew-x: 11; skew-y: 11; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { x: 48.9; y: 78.2; skew-x: 3.5; skew-y: 3.5; scale-x: 0.797; scale-y: 0.797; }
        frame 18 { x: 51.6; y: 80; skew-x: -3.5; skew-y: -3.5; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 54.4; y: 82; skew-x: -11; skew-y: -11; scale-x: 0.796; scale-y: 0.796; }
        frame 20 { x: 60.3; y: 82.2; skew-x: -25.7; skew-y: -25.7; scale-x: 0.795; scale-y: 0.795; }
        frame 21 { x: 67.2; y: 82.9; skew-x: -40.8; skew-y: -40.8; scale-x: 0.794; scale-y: 0.794; }
        frame 22 { x: 75; y: 83.6; skew-x: -55.7; skew-y: -55.7; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 78.7; y: 86.3; skew-x: -62.6; skew-y: -62.6; scale-x: 0.793; scale-y: 0.793; }
        frame 24 { x: 82.6; y: 89; skew-x: -69.6; skew-y: -69.6; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 86.7; y: 91.6; skew-x: -76.5; skew-y: -76.5; }
        frame 26 { x: 75.2; y: 94.6; skew-x: -59.5; skew-y: -59.5; }
        frame 27 { x: 65; y: 97.3; skew-x: -42.3; skew-y: -42.3; scale-x: 0.794; scale-y: 0.794; }
        frame 28 { x: 56; y: 100; skew-x: -25.3; skew-y: -25.3; scale-x: 0.796; scale-y: 0.796; }
        frame 29 { x: 52.3; y: 97.1; skew-x: -22.4; skew-y: -22.4; scale-x: 0.794; scale-y: 0.794; }
        frame 30 { x: 48.6; y: 94.2; skew-x: -19.5; skew-y: -19.5; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 44.8; y: 91.4; skew-x: -16.7; skew-y: -16.7; scale-x: 0.795; scale-y: 0.795; }
        frame 32 { x: 41.9; y: 89.6; skew-x: -12.7; skew-y: -12.7; scale-x: 0.794; scale-y: 0.794; }
        frame 33 { x: 38.9; y: 87.8; skew-x: -8.7; skew-y: -8.7; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 36.1; y: 86.1; skew-x: -4.9; skew-y: -4.9; }
        frame 35 { x: 33.5; y: 82.9; skew-x: 0.5; skew-y: 0.5; scale-x: 0.793; scale-y: 0.793; }
        frame 36 { x: 31; y: 79.7; skew-x: 6.1; skew-y: 6.1; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 28.6; y: 76.7; skew-x: 11.8; skew-y: 11.8; }
        frame 38 { x: 28.8; y: 69.1; skew-x: 23.3; skew-y: 23.3; scale-x: 0.791; scale-y: 0.791; }
        frame 39 { x: 29.3; y: 61.9; skew-x: 35.1; skew-y: 35.1; scale-x: 0.79; scale-y: 0.79; }
        frame 40 { x: 29.8; y: 55.2; skew-x: 46.9; skew-y: 46.9; scale-x: 0.791; scale-y: 0.791; }
        frame 41 { x: 30.7; y: 61; skew-x: 49.2; skew-y: 49.2; scale-x: 0.789; scale-y: 0.789; }
        frame 42 { x: 31.7; y: 66.8; skew-x: 51.6; skew-y: 51.6; scale-x: 0.788; scale-y: 0.788; }
        frame 43 { x: 32.5; y: 72.6; skew-x: 53.8; skew-y: 53.8; scale-x: 0.789; scale-y: 0.789; }
        frame 44 { x: 33; y: 77; skew-x: 39.6; skew-y: 39.6; scale-x: 0.788; scale-y: 0.788; }
        frame 45 { x: 33.7; y: 82.1; skew-x: 25.3; skew-y: 25.3; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 34.6; y: 88.1; skew-x: 11; skew-y: 11; scale-x: 0.789; scale-y: 0.789; }
        frame 47 { x: 38.4; y: 83.9; skew-x: 17.6; skew-y: 17.6; scale-x: 0.791; scale-y: 0.791; }
        frame 48 { x: 42.1; y: 79.9; skew-x: 24.3; skew-y: 24.3; scale-x: 0.794; scale-y: 0.794; }
        frame 49 { x: 46; y: 76; skew-x: 31; skew-y: 31; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 45.8; y: 64.2; skew-x: 50.7; skew-y: 50.7; scale-x: 0.796; scale-y: 0.796; }
        frame 52 { x: 45.2; y: 54.1; skew-x: 70.4; skew-y: 70.4; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 43.9; y: 45.4; skew-x: 90; skew-y: 90; }
        frame 54 { x: 41.3; y: 37.8; skew-x: 109.5; skew-y: 109.5; scale-x: 0.795; scale-y: 0.795; }
        frame 55 { x: 31.1; y: 39.1; skew-x: 104; skew-y: 104; scale-x: 0.794; scale-y: 0.794; }
        frame 56 { x: 20.9; y: 40.3; skew-x: 98.5; skew-y: 98.5; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 10.4; y: 41.8; skew-x: 93.1; skew-y: 93.3; }
        frame 58 { x: 3.3; y: 41.9; skew-x: 93; skew-y: -10000; }
        frame 59 { x: -3.5; y: 41.8; skew-x: 93.1; }
        frame 60 { x: -2.8; y: 43; skew-x: 97.5; skew-y: 97.8; scale-x: 0.793; }
        frame 61 { x: -2.2; y: 44.1; skew-x: 102; skew-y: 102.3; scale-x: 0.792; scale-y: 0.793; }
        frame 62 { x: -1.7; y: 45.4; skew-x: 106.5; skew-y: 106.8; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: -2.1; y: 44.5; skew-x: 99.1; skew-y: 99.3; scale-x: 0.791; scale-y: 0.792; }
        frame 64 { x: -2.6; y: 43.8; skew-x: 91.8; skew-y: 92; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -3.1; y: 43.1; skew-x: 84.5; skew-y: 84.7; }
        frame 66 { x: 1.5; y: 42.7; skew-x: 97.1; skew-y: 97.3; scale-x: 0.79; scale-y: 0.791; }
        frame 67 { x: 5.7; y: -10000; skew-x: 109.8; skew-y: 110.1; scale-x: 0.789; scale-y: 0.79; }
        frame 68 { x: 9.2; y: 43.2; skew-x: 122.7; skew-y: 123; scale-x: -10000; scale-y: 0.791; }
        frame 69 { x: 1.5; y: 41; skew-x: 120.3; skew-y: 120.6; scale-x: 0.786; scale-y: 0.788; }
        frame 70 { x: -6.2; y: 39; skew-x: 117.8; skew-y: 118.3; scale-x: 0.784; scale-y: 0.786; }
        frame 71 { x: -14.1; y: 36.8; skew-x: 115.6; skew-y: 116; scale-x: 0.783; scale-y: 0.785; }
        frame 72 { x: -5.9; y: 26.9; skew-x: 154.5; skew-y: 154.9; scale-x: 0.781; scale-y: 0.783; }
        frame 73 { x: -3.7; y: 14.5; skew-x: 193.3; skew-y: 193.6; scale-x: 0.78; scale-y: 0.782; }
        frame 74 { x: -14.6; y: -0.5; skew-x: 232.2; skew-y: 232.5; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -13.9; y: 0.5; skew-x: 246.9; skew-y: 247.2; scale-x: 0.778; scale-y: 0.78; }
        frame 76 { x: -12.8; y: 1; skew-x: 261.7; skew-y: 262; scale-x: -10000; scale-y: 0.779; }
        frame 77 { x: -11; y: 0.7; skew-x: 276; skew-y: 276.5; scale-x: 0.777; scale-y: -10000; }
        frame 78 { x: -8.6; y: -0.1; skew-x: 290.8; skew-y: 291.2; scale-x: 0.776; scale-y: 0.778; }
        frame 79 { x: -30; y: -4.1; skew-x: 263.2; skew-y: 263.7; scale-x: 0.774; scale-y: 0.787; }
        frame 80 { x: -49.3; y: -10.5; skew-x: 235.6; skew-y: 235.9; scale-x: 0.773; scale-y: 0.796; }
        frame 81 { x: -67.9; y: 0.9; skew-x: 208.6; skew-y: 209; scale-x: 0.771; scale-y: 0.794; }
        frame 82 { x: -87.3; y: 9.5; skew-x: 181.7; skew-y: 182.1; scale-x: 0.77; scale-y: 0.793; }
        frame 83 { x: -94.9; y: 22.9; skew-x: 156.2; skew-y: 156.4; scale-x: 0.774; scale-y: 0.792; }
        frame 84 { x: -104.9; y: 35.1; skew-x: 130.6; skew-y: 130.7; scale-x: 0.78; scale-y: 0.793; }
        frame 85 { x: -100.9; y: 53.4; skew-x: 65.4; skew-y: 65.4; scale-x: 0.789; scale-y: 0.796; }
        frame 86 { x: -103.2; y: 87.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -101.1; y: 95; skew-x: -6.4; skew-y: -6.4; scale-x: 0.799; scale-y: 0.799; }
        frame 88 { x: -98.8; y: 102.7; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -99.9; y: 99.9; skew-x: -9.7; skew-y: -9.7; }
        frame 90 { x: -101; y: 97.2; skew-x: -6.4; skew-y: -6.4; }
        frame 91 { x: -102.1; y: 92.3; skew-x: -3.2; skew-y: -3.2; scale-x: 0.8; scale-y: 0.8; }
        frame 92 { x: -103.2; y: 87.4; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 46.1; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 94 { x: 46.9; y: 87.2; skew-x: -0.9; skew-y: -0.9; }
        frame 95 { x: 47.8; y: -10000; skew-x: -2; skew-y: -2; scale-x: 0.799; scale-y: 0.799; }
        frame 96 { x: 48.6; y: 87.1; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 49.4; y: -10000; skew-x: -4.4; skew-y: -4.4; }
        frame 98 { x: 52.5; y: 87.8; skew-x: -8.7; skew-y: -8.7; scale-x: 0.798; scale-y: 0.798; }
        frame 99 { x: 55.7; y: 88.5; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 59; y: 89.2; skew-x: -17.5; skew-y: -17.5; scale-x: 0.797; scale-y: 0.797; }
        frame 101 { x: 62.4; y: 90.1; skew-x: -21.9; skew-y: -21.9; scale-x: 0.798; scale-y: 0.798; }
        frame 102 { x: 63.9; y: 89.6; skew-x: -22.9; skew-y: -22.9; scale-x: 0.797; scale-y: 0.797; }
        frame 103 { x: 65.5; y: 89.2; skew-x: -23.9; skew-y: -23.9; scale-x: 0.796; scale-y: 0.796; }
        frame 104 { x: 67; y: 88.8; skew-x: -24.9; skew-y: -24.9; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 68.5; y: 88.3; skew-x: -26; skew-y: -26; scale-x: 0.797; scale-y: 0.797; }
        frame 106 { x: 71.1; y: 89.9; skew-x: -33; skew-y: -33; scale-x: 0.795; scale-y: 0.795; }
        frame 107 { x: 73.8; y: 91.6; skew-x: -40.3; skew-y: -40.3; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 76.8; y: 93.3; skew-x: -47.3; skew-y: -47.3; scale-x: 0.794; scale-y: 0.794; }
        frame 109 { x: 79.9; y: 95; skew-x: -54.5; skew-y: -54.5; scale-x: 0.795; scale-y: 0.795; }
        frame 110 { x: 74.1; y: 96.3; skew-x: -52.3; skew-y: -52.3; scale-x: 0.793; scale-y: 0.793; }
        frame 111 { x: 68.3; y: 97.6; skew-x: -50.1; skew-y: -50.1; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 62.6; y: 99.1; skew-x: -47.8; skew-y: -47.8; scale-x: 0.792; scale-y: 0.792; }
        frame 113 { x: 56.8; y: 100.3; skew-x: -45.6; skew-y: -45.6; scale-x: 0.793; scale-y: 0.793; }
        frame 114 { x: -10000; y: 99.1; skew-x: -38.3; skew-y: -38.3; scale-x: 0.79; scale-y: 0.79; }
        frame 115 { x: 56.9; y: 98; skew-x: -31; skew-y: -31; scale-x: 0.791; scale-y: 0.791; }
        frame 116 { x: 55.9; y: 98.3; skew-x: -36; skew-y: -36; scale-x: 0.79; scale-y: 0.79; }
        frame 117 { x: 54.8; y: 98.9; skew-x: -41; skew-y: -41; scale-x: 0.792; scale-y: 0.792; }
        frame 118 { x: 52.7; y: 97.1; skew-x: -36.3; skew-y: -36.3; scale-x: 0.791; scale-y: 0.791; }
        frame 119 { x: 50.6; y: 95.3; skew-x: -31.7; skew-y: -31.7; scale-x: 0.79; scale-y: 0.79; }
        frame 120 { x: 48.6; y: 93.5; skew-x: -27; skew-y: -27; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 46.8; y: 91.8; skew-x: -22.4; skew-y: -22.4; }
        frame 122 { x: 45.1; y: 90.1; skew-x: -17.7; skew-y: -17.7; }
        frame 123 { x: 43.3; y: 88.5; skew-x: -13.2; skew-y: -13.2; }
        frame 124 { x: 41.6; y: 86.8; skew-x: -8.4; skew-y: -8.4; }
        frame 125 { x: 40.1; y: 85.5; skew-x: -3.9; skew-y: -3.9; scale-x: 0.791; scale-y: 0.791; }
        frame 126 { x: 38.6; y: 82.9; skew-x: -2.9; skew-y: -2.9; scale-x: 0.79; scale-y: 0.79; }
        frame 127 { x: 37.3; y: 80.3; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 35.8; y: 77.9; skew-x: -1.2; skew-y: -1.2; scale-x: 0.789; scale-y: 0.789; }
        frame 129 { x: 34.5; y: 75.4; skew-x: -0.3; skew-y: -0.3; scale-x: -10000; scale-y: -10000; }
        frame 130 { x: 36.8; y: 81.3; skew-x: -7.4; skew-y: -7.4; }
        frame 131 { x: 39.4; y: 87.4; skew-x: -14.7; skew-y: -14.7; scale-x: 0.79; scale-y: 0.79; }
        frame 132 { x: 42; y: 93.6; skew-x: -22; skew-y: -22; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 44.9; y: 99.5; skew-x: -29.3; skew-y: -29.3; scale-x: 0.792; scale-y: 0.792; }
        frame 134 { x: 47.1; y: 98.4; skew-x: -23.7; skew-y: -23.7; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 49.5; y: 97.3; skew-x: -18.2; skew-y: -18.2; scale-x: 0.795; scale-y: 0.795; }
        frame 136 { x: 47.7; y: 92.2; skew-x: -8.9; skew-y: -8.9; scale-x: 0.797; scale-y: 0.797; }
        frame 137 { x: 46.1; y: 87.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 139 { cel: -10000; }
        frame 165 { cel: 0; }
        frame 166 { x: 44.6; y: 81.3; skew-x: 16.1; skew-y: 16.1; scale-x: 0.799; scale-y: 0.799; cel: -10000; }
        frame 167 { x: 43.6; y: 76.1; skew-x: 32.4; skew-y: 32.4; scale-x: 0.797; scale-y: 0.797; }
        frame 168 { x: 42.9; y: 72.1; skew-x: 48.7; skew-y: 48.7; scale-x: 0.798; scale-y: 0.798; }
        frame 169 { x: 44.5; y: 67.3; skew-x: 64.2; skew-y: 64.2; scale-x: 0.796; scale-y: 0.796; }
        frame 170 { x: 45.8; y: 63.3; skew-x: 79.5; skew-y: 79.5; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 46.3; y: 60.1; skew-x: 94.6; skew-y: 94.6; }
        frame 172 { x: 48.1; y: 52.9; skew-x: 97; skew-y: 97; scale-x: 0.794; scale-y: 0.794; }
        frame 173 { x: 50.1; y: 45.6; skew-x: 99.3; skew-y: 99.3; scale-x: 0.793; scale-y: 0.793; }
        frame 174 { x: 52; y: 38.5; skew-x: 101.7; skew-y: 101.7; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 46.9; y: 38.4; skew-x: 91.5; skew-y: 91.5; scale-x: 0.792; scale-y: 0.792; }
        frame 176 { x: 41.6; y: 38.7; skew-x: 81.5; skew-y: 81.5; scale-x: 0.79; scale-y: 0.79; }
        frame 177 { x: 35.9; y: 39.2; skew-x: 71.3; skew-y: 71.3; scale-x: -10000; scale-y: -10000; }
        frame 178 { x: 36.8; y: 48.4; skew-x: 63.9; skew-y: 63.9; scale-x: 0.791; scale-y: 0.791; }
        frame 179 { x: 39.8; y: 60.1; skew-x: 56.4; skew-y: 56.4; scale-x: 0.793; scale-y: 0.793; }
        frame 180 { x: 42.9; y: 72.1; skew-x: 48.7; skew-y: 48.7; scale-x: 0.798; scale-y: 0.798; }
        frame 181 { x: 46.4; y: 76.4; skew-x: 32.4; skew-y: 32.4; scale-x: 0.797; scale-y: 0.797; }
        frame 182 { x: 50; y: 81.6; skew-x: 16.1; skew-y: 16.1; scale-x: 0.799; scale-y: 0.799; }
        frame 183 { x: 54.3; y: 87.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 184 { x: 57.6; y: 90; skew-x: -6.9; skew-y: -6.9; scale-x: 0.799; scale-y: 0.799; }
        frame 185 { x: 60.9; y: 92.4; skew-x: -14; skew-y: -14; scale-x: -10000; scale-y: -10000; }
        frame 186 { x: 64.4; y: 94.8; skew-x: -21.2; skew-y: -21.2; }
        frame 187 { x: 62.9; y: 95.6; skew-x: -25.5; skew-y: -25.5; scale-x: 0.797; scale-y: 0.797; }
        frame 188 { x: 61.5; y: 96.4; skew-x: -29.7; skew-y: -29.7; scale-x: 0.796; scale-y: 0.796; }
        frame 189 { x: 60.1; y: 97.1; skew-x: -34; skew-y: -34; scale-x: 0.797; scale-y: 0.797; }
        frame 190 { x: 55; y: 93.5; skew-x: -22.5; skew-y: -22.5; scale-x: -10000; scale-y: -10000; }
        frame 191 { x: 50.4; y: 90.4; skew-x: -11.2; skew-y: -11.2; scale-x: 0.798; scale-y: 0.798; }
        frame 192 { x: 46.1; y: 87.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_polevaulter_outerarm_upper";
        frame-count: 193;
        frame 0 { x: 60.9; y: 50; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_OUTERARM_UPPER; }
        frame 1 { x: 60.6; y: 50.6; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 60.4; y: 51.1; skew-x: -0.9; skew-y: -0.9; }
        frame 3 { x: 60.2; y: 51.8; skew-x: -1.4; skew-y: -1.4; }
        frame 4 { x: 60; y: 52.4; skew-x: -1.9; skew-y: -1.9; }
        frame 5 { x: 59.7; y: 53; skew-x: -2.5; skew-y: -2.5; }
        frame 6 { x: 59.5; y: 53.6; skew-x: -3.2; skew-y: -3.2; }
        frame 7 { x: 59.7; y: 53; skew-x: -2.5; skew-y: -2.5; }
        frame 8 { x: 60; y: 52.3; skew-x: -1.9; skew-y: -1.9; }
        frame 9 { x: 60.1; y: 51.7; skew-x: -1.4; skew-y: -1.4; }
        frame 10 { x: 60.4; y: 51.1; skew-x: -0.9; skew-y: -0.9; }
        frame 11 { x: 60.6; y: 50.5; skew-x: -0.4; skew-y: -0.4; }
        frame 12 { x: 60.9; y: 50; skew-x: 0; skew-y: 0; }
        frame 13 { x: 64.3; y: 45; skew-x: 4.3; skew-y: 4.3; }
        frame 14 { x: 62.9; y: 44; skew-x: 0.3; skew-y: 0.3; }
        frame 15 { x: 61.6; y: 43.1; skew-x: -3.2; skew-y: -3.2; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 60.3; y: 42.1; skew-x: -7.1; skew-y: -7.1; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 60.8; y: -10000; skew-x: -9.2; skew-y: -9.2; }
        frame 18 { x: 61.3; y: 42; skew-x: -11.5; skew-y: -11.5; scale-x: 0.798; scale-y: 0.798; }
        frame 19 { x: 61.8; skew-x: -13.9; skew-y: -13.9; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 61; y: 41.6; skew-x: -22; skew-y: -22; scale-x: 0.797; scale-y: 0.797; }
        frame 21 { x: 60.1; y: 41.7; skew-x: -30.5; skew-y: -30.5; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 59.4; y: 41.8; skew-x: -38.7; skew-y: -38.7; }
        frame 23 { x: 59.5; y: 45.4; skew-x: -42; skew-y: -42; scale-x: 0.796; scale-y: 0.796; }
        frame 24 { x: 59.6; y: 48.9; skew-x: -45.5; skew-y: -45.5; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 59.8; y: 52.4; skew-x: -48.7; skew-y: -48.7; scale-x: 0.797; scale-y: 0.797; }
        frame 26 { x: 57.5; y: 54.6; skew-x: -42; skew-y: -42; scale-x: 0.796; scale-y: 0.796; }
        frame 27 { x: 55.4; y: 57; skew-x: -35; skew-y: -35; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 53.3; y: 59.3; skew-x: -28.2; skew-y: -28.2; scale-x: 0.798; scale-y: 0.798; }
        frame 29 { x: 54.7; y: 56.6; skew-x: -22.7; skew-y: -22.7; scale-x: 0.796; scale-y: 0.797; }
        frame 30 { x: 56.3; y: 53.9; skew-x: -17.4; skew-y: -17.4; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 57.9; y: 51.3; skew-x: -12.1; skew-y: -12.2; scale-y: 0.798; }
        frame 32 { x: 58.1; y: 51; skew-x: -8.9; skew-y: -9; scale-y: 0.797; }
        frame 33 { x: 58.3; y: 50.6; skew-x: -5.9; skew-y: -6; scale-y: -10000; }
        frame 34 { x: 58.5; y: 50.3; skew-x: -3; skew-y: -3.1; scale-y: 0.798; }
        frame 35 { x: 59; y: 49.7; skew-x: 2.3; skew-y: 2.3; scale-x: 0.795; scale-y: 0.797; }
        frame 36 { x: 59.6; y: 49.3; skew-x: 8; skew-y: 7.8; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 60.3; y: 48.9; skew-x: 13.7; skew-y: 13.6; }
        frame 38 { x: 61; y: 46.2; skew-x: 17.3; skew-y: 17.1; scale-x: 0.794; scale-y: 0.796; }
        frame 39 { x: 61.6; y: 43.5; skew-x: 20.8; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 62.4; y: 40.9; skew-x: 24.4; skew-y: 24.3; }
        frame 41 { x: 60.1; y: 44; skew-x: 19.8; skew-y: 19.6; scale-x: 0.793; scale-y: 0.795; }
        frame 42 { x: 58; y: 47.3; skew-x: 15.1; skew-y: 15; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 55.9; y: 50.6; skew-x: 10.6; skew-y: 10.5; scale-x: 0.794; scale-y: 0.796; }
        frame 44 { x: 56.5; y: 52; skew-x: 8.8; skew-y: 8.8; scale-x: 0.793; scale-y: 0.795; }
        frame 45 { x: 57; y: 53.4; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 57.4; y: 54.9; skew-x: 5.8; skew-y: 5.7; scale-x: 0.794; }
        frame 47 { x: 59.6; y: 51.6; skew-x: 5.3; skew-y: 5.1; scale-x: 0.795; scale-y: 0.797; }
        frame 48 { x: 61.9; y: 48.3; skew-x: 4.8; skew-y: 4.8; scale-x: 0.797; scale-y: 0.798; }
        frame 49 { x: 64.3; y: 45; skew-x: 4.3; skew-y: 4.3; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 68.4; y: 44.1; skew-x: 26.3; skew-y: 26.3; scale-x: 0.798; scale-y: 0.798; }
        frame 52 { x: 72.4; y: 44.6; skew-x: 48.4; skew-y: 48.4; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 75.7; y: 46.5; skew-x: 70.4; skew-y: 70.4; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 77.8; y: 49.6; skew-x: 92.4; skew-y: 92.4; }
        frame 55 { x: 68.2; y: 47.3; skew-x: 87; skew-y: 87; }
        frame 56 { x: 58.6; y: 45.1; skew-x: 81.5; skew-y: 81.7; scale-y: 0.796; }
        frame 57 { x: 48.8; y: 42.9; skew-x: 76; skew-y: 76.1; scale-y: -10000; }
        frame 58 { x: 46.6; y: 43.6; skew-x: 82; skew-y: 82.2; scale-y: 0.922; }
        frame 59 { x: 44.3; y: 44.7; skew-x: 88; skew-y: 88.1; scale-y: 1.048; }
        frame 60 { x: 43.8; y: 45.8; skew-x: 86.7; skew-y: 86.7; scale-x: 0.796; scale-y: 1.047; }
        frame 61 { x: 43.3; y: 47; skew-x: 85.2; skew-y: 85.5; scale-x: -10000; scale-y: 1.046; }
        frame 62 { x: 42.8; y: 48.1; skew-x: 83.7; skew-y: 83.9; scale-y: -10000; }
        frame 63 { x: 41.6; y: 51.1; skew-x: 82.7; skew-y: 82.9; scale-x: 0.795; scale-y: 1.045; }
        frame 64 { x: 40.4; y: 54; skew-x: 81.5; skew-y: 81.7; scale-x: -10000; scale-y: 1.044; }
        frame 65 { x: 39.4; y: 56.9; skew-x: 80.3; skew-y: 80.5; scale-y: -10000; }
        frame 66 { x: 38.7; y: 60.6; skew-x: 82.2; skew-y: 82.4; scale-x: 0.794; scale-y: 1.043; }
        frame 67 { x: 38.1; y: 64.1; skew-x: 84; skew-y: 84.2; scale-x: -10000; scale-y: 1.042; }
        frame 68 { x: 37.4; y: 67.8; skew-x: 85.8; skew-y: 85.8; scale-y: 1.041; }
        frame 69 { x: 26.5; y: 64.8; skew-x: 79.7; skew-y: 79.7; scale-x: 0.793; scale-y: 1.04; }
        frame 70 { x: 15.6; y: 61.6; skew-x: 73.7; skew-y: 73.7; scale-x: -10000; scale-y: 1.039; }
        frame 71 { x: 4.5; y: 58.6; skew-x: 67.5; skew-y: 67.5; scale-y: -10000; }
        frame 72 { x: 1.9; y: 52.3; skew-x: 98.8; skew-y: 98.8; scale-x: 0.792; scale-y: 1.038; }
        frame 73 { x: -4.4; y: 46.4; skew-x: 130.1; skew-y: 130.1; scale-x: 0.79; scale-y: 1.036; }
        frame 74 { x: -14.3; y: 39.1; skew-x: 161.5; skew-y: 161.6; scale-x: 0.791; scale-y: 1.037; }
        frame 75 { x: -19; y: 37.4; skew-x: 171.7; skew-y: 171.7; scale-x: 0.79; scale-y: 1.036; }
        frame 76 { x: -23.8; y: 35.3; skew-x: 181.5; skew-y: 181.5; scale-x: -10000; scale-y: 1.035; }
        frame 77 { x: -28.7; y: 32.9; skew-x: 191.5; skew-y: 191.5; scale-x: 0.789; scale-y: 1.034; }
        frame 78 { x: -33.7; y: 30; skew-x: 201.6; skew-y: 201.6; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: -43.4; y: 29.2; skew-x: 182; skew-y: 182; scale-x: 0.788; scale-y: 1.033; }
        frame 80 { x: -53.5; y: 26.7; skew-x: 162.4; skew-y: 162.4; scale-x: 0.787; scale-y: 1.032; }
        frame 81 { x: -54.9; y: 28.1; skew-x: 129.4; skew-y: 129.4; scale-x: 0.785; scale-y: 1.029; }
        frame 82 { x: -60.2; y: 28; skew-x: 96.5; skew-y: 96.5; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: -64.1; y: 29.9; skew-x: 77.2; skew-y: 77.2; scale-x: 0.787; scale-y: 0.982; }
        frame 84 { x: -69; y: 32.7; skew-x: 57.9; skew-y: 57.9; scale-x: 0.79; scale-y: 0.936; }
        frame 85 { x: -77.6; y: 39.7; skew-x: 28.8; skew-y: 28.8; scale-x: 0.794; scale-y: 0.867; }
        frame 86 { x: -86; y: 50; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -89.2; y: 54.8; skew-x: -1.2; skew-y: -1.2; scale-x: 0.799; scale-y: 0.799; }
        frame 88 { x: -92.5; y: 59.6; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -90.8; y: 57.6; skew-x: -1.9; skew-y: -1.9; }
        frame 90 { x: -89.2; y: 55.5; skew-x: -1.2; skew-y: -1.2; }
        frame 91 { x: -87.5; y: 52.7; skew-x: -0.4; skew-y: -0.4; scale-x: 0.8; scale-y: 0.8; }
        frame 92 { x: -86; y: 50; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 63.3; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 94 { x: 64; y: 49.7; skew-x: 0.3; skew-y: 0.3; }
        frame 95 { x: 64.6; y: 49.4; skew-x: 0.5; skew-y: 0.5; }
        frame 96 { x: 65.3; y: 49.1; skew-x: 0.8; skew-y: 0.8; scale-x: 0.799; scale-y: 0.799; }
        frame 97 { x: 65.9; y: 48.9; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 66.8; y: 48.6; skew-x: -0.9; skew-y: -0.9; }
        frame 99 { x: 67.8; y: 48.4; skew-x: -3; skew-y: -3; }
        frame 100 { x: 68.7; y: 48.1; skew-x: -5.2; skew-y: -5.2; scale-x: 0.798; scale-y: 0.798; }
        frame 101 { x: 69.8; y: 48; skew-x: -7.4; skew-y: -7.4; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 71; y: 47.3; skew-x: -7.2; skew-y: -7.2; }
        frame 103 { x: 72.1; y: 46.6; skew-x: -10000; skew-y: -10000; }
        frame 104 { x: 73.3; y: 46.1; }
        frame 105 { x: 74.4; y: 45.4; skew-x: -7.1; skew-y: -7.1; }
        frame 106 { x: 75.1; y: 45.6; skew-x: -8.2; skew-y: -8.2; scale-x: 0.797; scale-y: 0.797; }
        frame 107 { x: 75.8; y: 45.9; skew-x: -9.2; skew-y: -9.2; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 76.4; y: 46.1; skew-x: -10.4; skew-y: -10.4; }
        frame 109 { x: 77; y: 46.3; skew-x: -11.6; skew-y: -11.6; }
        frame 110 { x: 73.2; y: 47.6; skew-x: -9.2; skew-y: -9.2; scale-x: 0.796; scale-y: 0.796; }
        frame 111 { x: 69.2; y: 49.1; skew-x: -7.2; skew-y: -7.2; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 65.4; y: 50.6; skew-x: -4.9; skew-y: -4.9; scale-x: 0.795; scale-y: 0.795; }
        frame 113 { x: 61.6; y: 52; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 114 { x: 62.2; skew-x: -2.9; skew-y: -2.9; }
        frame 115 { x: 62.9; y: 51.9; skew-x: -3.2; skew-y: -3.2; }
        frame 116 { x: 63.6; y: 52; skew-x: -3.4; skew-y: -3.4; }
        frame 117 { x: 64; y: 52.1; skew-x: -3.7; skew-y: -3.8; scale-x: 0.796; }
        frame 118 { x: 65; y: 51.6; skew-x: 0; skew-y: 0; scale-x: 0.795; }
        frame 119 { x: 65.8; y: 51.1; skew-x: 3.8; skew-y: 3.5; scale-x: -10000; scale-y: 0.794; }
        frame 120 { x: 66.8; y: 50.8; skew-x: 7.5; skew-y: 7.3; scale-x: 0.794; scale-y: -10000; }
        frame 121 { x: 67.7; y: 50.3; skew-x: 11.3; skew-y: 11.1; scale-x: -10000; }
        frame 122 { x: 68.6; y: 50; skew-x: 15; skew-y: 14.8; scale-y: 0.793; }
        frame 123 { x: 69.6; y: 49.6; skew-x: 18.8; skew-y: 18.8; scale-x: 0.793; scale-y: -10000; }
        frame 124 { x: 70.5; y: 49.5; skew-x: 22.8; skew-y: 22.6; scale-x: -10000; }
        frame 125 { x: 71.4; y: 49.1; skew-x: 26.6; skew-y: 26.4; scale-x: 0.794; scale-y: 0.794; }
        frame 126 { x: 72.5; y: 48.8; skew-x: 31.1; skew-y: 30.8; scale-x: 0.793; scale-y: 0.792; }
        frame 127 { x: 73.5; y: 48.4; skew-x: 35.4; skew-y: 35.3; scale-x: 0.792; scale-y: -10000; }
        frame 128 { x: 74.6; y: 48.2; skew-x: 39.9; skew-y: 39.6; scale-x: -10000; }
        frame 129 { x: 75.5; y: 48; skew-x: 44.3; skew-y: 44.1; scale-x: 0.793; scale-y: 0.793; }
        frame 130 { x: 72.4; y: 48.8; skew-x: 36.6; skew-y: 36.4; scale-x: 0.792; scale-y: 0.792; }
        frame 131 { x: 69.2; y: 49.8; skew-x: 28.8; skew-y: 28.8; scale-x: -10000; scale-y: -10000; }
        frame 132 { x: 66; y: 51.1; skew-x: 21.1; skew-y: 21.1; scale-x: 0.793; }
        frame 133 { x: 63; y: 52.5; skew-x: 13.5; skew-y: 13.5; scale-x: -10000; scale-y: 0.793; }
        frame 134 { x: 63.1; y: 51.9; skew-x: 10; skew-y: 10; scale-x: 0.795; scale-y: 0.795; }
        frame 135 { x: -10000; y: 51.1; skew-x: 6.8; skew-y: 6.8; scale-x: 0.796; scale-y: 0.796; }
        frame 136 { x: 63.2; y: 50.6; skew-x: 3.3; skew-y: 3.3; scale-x: 0.798; scale-y: 0.798; }
        frame 137 { x: 63.3; y: 50; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_OUTERARM_UPPER2; }
        frame 139 { x: 61.1; y: 48.9; skew-x: 1; skew-y: 1; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 140 { x: 58.8; y: 47.7; skew-x: 2.3; skew-y: 2.3; scale-x: 0.798; scale-y: 0.798; }
        frame 141 { x: 56.5; y: 46.6; skew-x: 3.4; skew-y: 3.4; scale-x: 0.797; scale-y: 0.797; }
        frame 142 { x: 52.6; y: 46; skew-x: 0.5; skew-y: 0.5; scale-x: 0.796; scale-y: 0.796; }
        frame 143 { x: 48.9; y: 45.4; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 44.9; y: 44.9; skew-x: -5.2; skew-y: -5.2; scale-x: 0.795; scale-y: 0.795; }
        frame 145 { x: 37.4; y: 46.6; skew-x: -11; skew-y: -11; scale-x: 0.794; scale-y: 0.794; }
        frame 146 { x: 29.9; y: 48.3; skew-x: -16.9; skew-y: -16.9; scale-x: 0.793; scale-y: 0.793; }
        frame 147 { x: 22.6; y: 50.1; skew-x: -22.9; skew-y: -22.9; scale-x: 0.792; scale-y: 0.792; }
        frame 148 { x: 12.5; y: 56.5; skew-x: -42.8; skew-y: -42.8; scale-x: 0.79; scale-y: 0.79; }
        frame 149 { x: 3.6; y: 63.6; skew-x: -62.8; skew-y: -62.8; scale-x: 0.789; scale-y: 0.789; }
        frame 150 { x: -4; y: 70.7; skew-x: -82.6; skew-y: -82.6; scale-x: -10000; scale-y: -10000; }
        frame 151 { x: -8.1; y: 78.3; skew-x: -92.4; skew-y: -92.4; }
        frame 152 { x: -11.7; y: 85.7; skew-x: -102.4; skew-y: -102.4; scale-x: 0.788; scale-y: 0.788; }
        frame 153 { x: -15.2; y: 92.9; skew-x: -112.5; skew-y: -112.5; scale-x: -10000; scale-y: -10000; }
        frame 154 { x: -10000; y: 97.1; skew-x: -112.4; skew-y: -112.4; scale-x: 0.787; scale-y: 0.787; }
        frame 155 { y: 101.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 156 { y: 105.4; skew-x: -112.5; skew-y: -112.5; scale-x: 0.788; scale-y: 0.788; }
        frame 157 { x: -28.6; y: 107.3; skew-x: -62.4; skew-y: -63.8; scale-x: 0.802; scale-y: 0.764; }
        frame 158 { x: -35.2; y: 109.7; skew-x: -12.3; skew-y: -15.2; scale-x: 0.818; scale-y: 0.742; }
        frame 159 { x: -34.4; y: 107.7; skew-x: -14.2; skew-y: -16.2; scale-x: 0.806; scale-y: 0.755; }
        frame 160 { x: -33.4; y: 105.8; skew-x: -16.2; skew-y: -17.2; scale-x: 0.795; scale-y: 0.769; }
        frame 161 { x: -32.6; y: 103.8; skew-x: -18.2; skew-y: -18.2; scale-x: 0.784; scale-y: 0.784; }
        frame 162 { x: -33.4; y: 105.8; skew-x: -16.2; skew-y: -17.2; scale-x: 0.795; scale-y: 0.769; }
        frame 163 { x: -34.3; y: 107.6; skew-x: -14.2; skew-y: -16.2; scale-x: 0.806; scale-y: 0.755; }
        frame 164 { x: -35.2; y: 109.7; skew-x: -12.3; skew-y: -15.2; scale-x: 0.818; scale-y: 0.742; }
        frame 165 { x: 63.3; y: 50; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_OUTERARM_UPPER; }
        frame 166 { x: 65.5; y: 49.6; skew-x: 7.5; skew-y: 7.5; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 167 { x: 67.8; y: 49.4; skew-x: 15.1; skew-y: 15; scale-x: -10000; scale-y: 0.798; }
        frame 168 { x: 70.1; y: 49.1; skew-x: 22.9; skew-y: 22.5; scale-x: 0.8; scale-y: -10000; }
        frame 169 { x: 71.8; y: 49.3; skew-x: 28.8; skew-y: 28.6; scale-x: 0.798; scale-y: 0.797; }
        frame 170 { x: 73.6; y: 49.5; skew-x: 34.9; skew-y: 34.6; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 75.2; y: 49.9; skew-x: 41; skew-y: 40.6; scale-x: 0.799; scale-y: 0.798; }
        frame 172 { x: 77; y: -10000; skew-x: 47.9; skew-y: 47.6; scale-x: 0.797; scale-y: 0.796; }
        frame 173 { x: 78.7; y: 50; skew-x: 54.9; skew-y: 54.6; scale-x: -10000; scale-y: -10000; }
        frame 174 { x: 80.4; y: 50.2; skew-x: 61.8; skew-y: 61.5; scale-x: 0.798; scale-y: 0.797; }
        frame 175 { x: 76.8; y: 49.8; skew-x: 59.9; skew-y: 59.4; scale-x: 0.796; scale-y: 0.795; }
        frame 176 { x: 73.1; y: 49.5; skew-x: 57.9; skew-y: 57.4; scale-x: -10000; scale-y: -10000; }
        frame 177 { x: 69.5; y: 49.2; skew-x: 55.8; skew-y: 55.4; scale-x: 0.797; }
        frame 178 { x: 69.8; y: 48.8; skew-x: 44.9; skew-y: 44.4; scale-x: 0.796; }
        frame 179 { x: 70; y: 48.9; skew-x: 33.8; skew-y: 33.4; scale-x: 0.797; scale-y: 0.796; }
        frame 180 { x: 70.1; y: 49.1; skew-x: 22.9; skew-y: 22.5; scale-x: 0.8; scale-y: 0.798; }
        frame 181 { x: 70.6; y: 49.5; skew-x: 15.1; skew-y: 15; scale-x: 0.799; scale-y: -10000; }
        frame 182 { x: 71; y: 49.8; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: 0.799; }
        frame 183 { x: 71.6; y: 50.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 184 { x: 72.4; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 185 { x: 73.2; }
        frame 186 { x: 74.1; }
        frame 187 { x: 70.3; y: 51; skew-x: -6.7; skew-y: -6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 188 { x: 66.5; y: 51.8; skew-x: -13.4; skew-y: -13.4; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 62.8; y: 52.6; skew-x: -20.2; skew-y: -20.2; }
        frame 190 { x: 62.9; y: 51.6; skew-x: -13.4; skew-y: -13.4; }
        frame 191 { x: 63.1; y: 50.8; skew-x: -6.7; skew-y: -6.7; }
        frame 192 { x: 63.3; y: 50; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_polevaulter_outerarm_lower";
        frame-count: 193;
        frame 0 { x: 48.2; y: 67.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POLEVAULTER_OUTERARM_LOWER; }
        frame 1 { x: 48.1; y: 68.8; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 48; y: 70; skew-x: -4.7; skew-y: -4.7; }
        frame 3 { x: -10000; y: 71.4; skew-x: -7.2; skew-y: -7.2; }
        frame 4 { x: 47.9; y: 72.8; skew-x: -9.7; skew-y: -9.7; }
        frame 5 { x: -10000; y: 74.1; skew-x: -12.2; skew-y: -12.2; scale-x: 0.799; scale-y: 0.799; }
        frame 6 { y: 75.5; skew-x: -14.9; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { y: 74.1; skew-x: -12.2; skew-y: -12.2; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 48; y: 72.7; skew-x: -9.7; skew-y: -9.7; scale-x: 0.8; scale-y: 0.8; }
        frame 9 { x: -10000; y: 71.4; skew-x: -7.2; skew-y: -7.2; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 48.1; y: 70; skew-x: -4.7; skew-y: -4.7; }
        frame 11 { x: -10000; y: 68.7; skew-x: -2.4; skew-y: -2.4; }
        frame 12 { x: 48.2; y: 67.5; skew-x: 0; skew-y: 0; }
        frame 13 { x: 51.1; y: 60.5; skew-x: 11.8; skew-y: 11.8; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 50.6; y: 59.7; skew-x: 8.8; skew-y: 8.8; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 50.4; y: 58.9; skew-x: 6; skew-y: 6; }
        frame 16 { x: 50.1; y: 58.2; skew-x: 3.3; skew-y: 3.3; }
        frame 17 { x: 51.3; y: 59; skew-x: -0.7; skew-y: -0.7; scale-x: 0.798; scale-y: 0.798; }
        frame 18 { x: 52.6; y: 59.8; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 54; y: 60.7; skew-x: -9.4; skew-y: -9.4; }
        frame 20 { x: 55.9; y: 61.9; skew-x: -21.2; skew-y: -21.2; scale-x: 0.796; scale-y: 0.796; }
        frame 21 { x: 58.2; y: 63.3; skew-x: -33; skew-y: -33; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 61.4; y: 65; skew-x: -44.8; skew-y: -44.8; }
        frame 23 { x: 63.4; y: 68.9; skew-x: -51; skew-y: -51; scale-x: 0.795; scale-y: 0.795; }
        frame 24 { x: 65.8; y: 72.9; skew-x: -57.3; skew-y: -57.3; scale-x: 0.794; scale-y: 0.794; }
        frame 25 { x: 68.3; y: 76.6; skew-x: -63.3; skew-y: -63.3; scale-x: 0.795; scale-y: 0.795; }
        frame 26 { x: 61.6; y: 77.6; skew-x: -50.3; skew-y: -50.3; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 55.6; y: 78.5; skew-x: -37.3; skew-y: -37.3; }
        frame 28 { x: 50.3; y: 79.6; skew-x: -24.3; skew-y: -24.3; scale-x: 0.797; scale-y: 0.797; }
        frame 29 { x: 49.7; y: 75.3; skew-x: -15.2; skew-y: -15.2; scale-x: 0.796; scale-y: 0.796; }
        frame 30 { x: 49.4; y: 71.4; skew-x: -6.2; skew-y: -6.2; scale-x: 0.795; scale-y: 0.797; }
        frame 31 { x: -10000; y: 67.8; skew-x: 2.6; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 49; y: 66.3; skew-x: 7.5; skew-y: 7.3; scale-y: 0.796; }
        frame 33 { x: 48.6; y: 65.1; skew-x: 12.3; skew-y: 12.3; scale-x: 0.794; scale-y: -10000; }
        frame 34 { x: 48.3; y: 64; skew-x: 17.4; skew-y: 17.3; scale-x: -10000; }
        frame 35 { x: 47.8; y: 62.2; skew-x: 22.8; skew-y: 22.8; scale-x: 0.793; scale-y: 0.795; }
        frame 36 { x: 47.1; y: 60.6; skew-x: 28.6; skew-y: 28.3; scale-x: -10000; scale-y: 0.794; }
        frame 37 { x: 46.6; y: 59.1; skew-x: 34.2; skew-y: 34.1; scale-x: 0.794; scale-y: 0.795; }
        frame 38 { x: 47.5; y: 54.6; skew-x: 40.1; skew-y: 40.1; scale-x: 0.792; scale-y: 0.794; }
        frame 39 { x: 48.1; y: 50.3; skew-x: 46.1; skew-y: 46.1; scale-x: -10000; scale-y: 0.793; }
        frame 40 { x: 48.9; y: 46.1; skew-x: 52.2; skew-y: 52.1; scale-x: 0.793; scale-y: 0.794; }
        frame 41 { x: 47; y: 50.6; skew-x: 46.4; skew-y: 46.4; scale-x: 0.791; scale-y: 0.793; }
        frame 42 { x: 45.1; y: 55.1; skew-x: 40.6; skew-y: 40.6; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 43.1; y: 59.8; skew-x: 34.9; skew-y: 34.7; scale-x: 0.792; scale-y: 0.794; }
        frame 44 { x: 43.5; y: 62.7; skew-x: 27.9; skew-y: 27.8; scale-x: 0.791; scale-y: 0.792; }
        frame 45 { x: 43.8; y: 65.9; skew-x: 21.1; skew-y: 21; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 44.1; y: 69.3; skew-x: 14.3; skew-y: 14.1; scale-y: 0.793; }
        frame 47 { x: 46.4; y: 66.3; skew-x: 13.3; skew-y: 13.3; scale-x: 0.793; scale-y: 0.794; }
        frame 48 { x: 48.7; y: 63.4; skew-x: 12.5; skew-y: 12.5; scale-x: 0.796; scale-y: 0.797; }
        frame 49 { x: 51.1; y: 60.5; skew-x: 11.8; skew-y: 11.8; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 52.8; y: 52.1; skew-x: 29.6; skew-y: 29.6; scale-x: 0.797; scale-y: 0.797; }
        frame 52 { x: 54.7; y: 45.1; skew-x: 47.4; skew-y: 47.4; scale-x: 0.796; scale-y: 0.796; }
        frame 53 { x: 56.4; y: 39.8; skew-x: 65.2; skew-y: 65.2; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 57.4; y: 35.6; skew-x: 83; skew-y: 83; }
        frame 55 { x: 46.8; y: 35.4; skew-x: 77.7; skew-y: 77.7; scale-y: 0.795; }
        frame 56 { x: 36.1; y: 35.3; skew-x: 72.2; skew-y: 72.2; scale-x: 0.795; scale-y: 0.794; }
        frame 57 { x: 25.4; y: -10000; skew-x: 66.6; skew-y: 66.7; scale-x: 0.796; scale-y: 0.795; }
        frame 58 { x: 20.7; y: 34.7; skew-x: 66.7; skew-y: -10000; scale-x: 0.795; scale-y: 0.884; }
        frame 59 { x: 15.9; y: 34.1; skew-x: 66.6; scale-x: 0.796; scale-y: 0.976; }
        frame 60 { x: 16.1; y: 35.8; skew-x: 68.5; skew-y: 68.7; scale-x: 0.795; scale-y: 0.974; }
        frame 61 { x: 16.4; y: 37.4; skew-x: 70.4; skew-y: 70.7; scale-x: 0.794; scale-y: 0.973; }
        frame 62 { x: 16.5; y: 38.9; skew-x: 72.2; skew-y: 72.4; scale-x: 0.795; scale-y: 0.974; }
        frame 63 { x: 17.9; y: 41.7; skew-x: 77.5; skew-y: 77.7; scale-x: 0.794; scale-y: 0.972; }
        frame 64 { x: 19.1; y: 44.5; skew-x: 82.7; skew-y: 83; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 20.2; y: 47.4; skew-x: 87.8; skew-y: 88; }
        frame 66 { x: 22.5; y: 51.7; skew-x: 101.3; skew-y: 101.5; scale-x: 0.793; scale-y: 0.97; }
        frame 67 { x: 24; y: 56.4; skew-x: 114.8; skew-y: 115.1; scale-x: 0.792; scale-y: 0.968; }
        frame 68 { x: 24.7; y: 61.5; skew-x: 128.5; skew-y: 128.6; scale-x: 0.793; scale-y: -10000; }
        frame 69 { x: 15.9; y: 63.2; skew-x: 136.3; skew-y: 136.4; scale-x: 0.79; scale-y: 0.965; }
        frame 70 { x: 6.6; y: 64.8; skew-x: 144.1; skew-y: 144.2; scale-x: 0.789; scale-y: 0.964; }
        frame 71 { x: -2.7; y: 66.5; skew-x: 151.8; skew-y: 151.9; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -4.8; y: 50.4; skew-x: 161.7; skew-y: 161.7; scale-x: 0.787; scale-y: 0.962; }
        frame 73 { x: -7.3; y: 34; skew-x: 171.2; skew-y: 171.5; scale-x: 0.786; scale-y: 0.96; }
        frame 74 { x: -10.1; y: 17.3; skew-x: 180.9; skew-y: 181; scale-x: 0.785; scale-y: 0.959; }
        frame 75 { x: -11.5; y: 17.7; skew-x: 190.8; skew-y: 191; scale-x: 0.784; scale-y: 0.958; }
        frame 76 { x: -13; y: 17.6; skew-x: 200.8; skew-y: 201; scale-x: -10000; scale-y: 0.957; }
        frame 77 { x: -14.7; y: 17.1; skew-x: 210.8; skew-y: 211.1; scale-x: 0.783; scale-y: 0.956; }
        frame 78 { x: -16.5; y: 16.1; skew-x: 221; skew-y: 221.1; scale-x: 0.784; scale-y: 0.957; }
        frame 79 { x: -32.9; y: 12.5; skew-x: 205.1; skew-y: 205.3; scale-x: 0.782; scale-y: 0.955; }
        frame 80 { x: -49.5; y: 7.3; skew-x: 189.5; skew-y: 189.7; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -59.6; y: 15.1; skew-x: 162.7; skew-y: 162.7; scale-x: 0.78; scale-y: 0.952; }
        frame 82 { x: -72.8; y: 20.4; skew-x: 135.7; skew-y: 135.8; scale-x: 0.779; scale-y: 0.951; }
        frame 83 { x: -78.4; y: 25; skew-x: 108.5; skew-y: 108.6; scale-x: 0.782; scale-y: 0.92; }
        frame 84 { x: -87.8; y: 31.2; skew-x: 81.5; skew-y: 81.5; scale-x: 0.787; scale-y: 0.89; }
        frame 85 { x: -93.4; y: 44.8; skew-x: 40.6; skew-y: 40.6; scale-x: 0.792; scale-y: 0.844; }
        frame 86 { x: -98.6; y: 67.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -100.9; y: 76; skew-x: -12.7; skew-y: -12.7; scale-x: 0.799; scale-y: 0.799; }
        frame 88 { x: -102.8; y: 84.9; skew-x: -25.5; skew-y: -25.5; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -101.9; y: 80.9; skew-x: -19; skew-y: -19; scale-x: 0.798; scale-y: 0.798; }
        frame 90 { x: -101; y: 77; skew-x: -12.7; skew-y: -12.7; scale-x: 0.799; scale-y: 0.799; }
        frame 91 { x: -99.9; y: 72.1; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: -98.6; y: 67.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 93 { x: 50.6; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 51; y: 67.3; skew-x: -0.9; skew-y: -0.9; }
        frame 95 { x: 51.6; y: 67.2; skew-x: -2; skew-y: -2; scale-x: 0.799; scale-y: 0.799; }
        frame 96 { x: 52; y: 67; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 52.4; y: 66.8; skew-x: -4.4; skew-y: -4.4; }
        frame 98 { x: 54; y: 67.6; skew-x: -8.7; skew-y: -8.7; scale-x: 0.798; scale-y: 0.798; }
        frame 99 { x: 55.6; y: 68.3; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 57.4; y: 69.1; skew-x: -17.5; skew-y: -17.5; scale-x: 0.797; scale-y: 0.797; }
        frame 101 { x: 59.1; y: 69.9; skew-x: -21.9; skew-y: -21.9; scale-x: 0.798; scale-y: 0.798; }
        frame 102 { x: 60.2; y: 69.5; skew-x: -22.9; skew-y: -22.9; scale-x: 0.797; scale-y: 0.797; }
        frame 103 { x: 61.5; y: 69.2; skew-x: -23.9; skew-y: -23.9; scale-x: 0.796; scale-y: 0.796; }
        frame 104 { x: 62.6; y: 68.7; skew-x: -24.9; skew-y: -24.9; scale-x: -10000; scale-y: -10000; }
        frame 105 { x: 63.8; y: 68.4; skew-x: -26; skew-y: -26; scale-x: 0.797; scale-y: 0.797; }
        frame 106 { x: 65.3; y: 69.5; skew-x: -29; skew-y: -29; scale-x: 0.795; scale-y: 0.795; }
        frame 107 { x: 66.8; y: 70.5; skew-x: -32.3; skew-y: -32.3; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 68.4; y: 71.6; skew-x: -35.5; skew-y: -35.5; }
        frame 109 { x: 70; y: 72.7; skew-x: -38.7; skew-y: -38.7; scale-x: 0.796; scale-y: 0.796; }
        frame 110 { x: 65.1; y: 73.8; skew-x: -36.5; skew-y: -36.5; scale-x: 0.794; scale-y: 0.794; }
        frame 111 { x: 60.3; y: 74.8; skew-x: -34.2; skew-y: -34.2; scale-x: 0.793; scale-y: 0.793; }
        frame 112 { x: 55.4; y: 75.9; skew-x: -32; skew-y: -32; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 50.5; y: 76.9; skew-x: -29.8; skew-y: -29.8; }
        frame 114 { x: 51.1; y: 77; skew-x: -27.5; skew-y: -27.5; scale-x: 0.792; scale-y: 0.792; }
        frame 115 { x: 51.7; skew-x: -25.2; skew-y: -25.4; scale-x: -10000; scale-y: 0.793; }
        frame 116 { x: 52.5; y: 75.2; skew-x: -20.7; skew-y: -20.7; scale-x: 0.791; scale-y: -10000; }
        frame 117 { x: 53.2; y: 73.5; skew-x: -16.2; skew-y: -16.3; scale-x: 0.792; scale-y: 0.794; }
        frame 118 { x: 52.7; y: 72.2; skew-x: -12.9; skew-y: -13.2; scale-x: -10000; scale-y: 0.793; }
        frame 119 { x: 52.2; y: 71.2; skew-x: -9.7; skew-y: -9.9; scale-x: 0.791; scale-y: -10000; }
        frame 120 { x: 51.9; y: 70.1; skew-x: -6.5; skew-y: -6.7; scale-x: -10000; }
        frame 121 { x: 51.4; y: 69.1; skew-x: -3.4; skew-y: -3.7; }
        frame 122 { x: 51; y: 68.1; skew-x: -0.2; skew-y: -0.4; }
        frame 123 { x: 50.6; y: 67.2; skew-x: 2.8; skew-y: 2.5; scale-y: 0.792; }
        frame 124 { x: 50.3; y: 66.3; skew-x: 5.8; skew-y: 5.8; scale-x: 0.79; scale-y: -10000; }
        frame 125 { x: 50.1; y: 65.3; skew-x: 9.1; skew-y: 8.9; scale-x: -10000; }
        frame 126 { x: -10000; y: 63.1; skew-x: 13.3; skew-y: 13.3; scale-y: 0.791; }
        frame 127 { y: 61; skew-x: 17.8; skew-y: 17.6; scale-x: 0.789; scale-y: -10000; }
        frame 128 { y: 58.9; skew-x: 22.3; skew-y: 22.1; scale-x: -10000; scale-y: 0.79; }
        frame 129 { x: 50.3; y: 57; skew-x: 26.7; skew-y: 26.6; scale-y: 0.791; }
        frame 130 { x: 48.7; y: 60.8; skew-x: 16.5; skew-y: 16.5; scale-y: -10000; }
        frame 131 { x: 47.4; y: 65; skew-x: 6.5; skew-y: 6.3; scale-x: 0.791; }
        frame 132 { x: 46.2; y: 69.6; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: 0.792; }
        frame 133 { x: 45.5; y: 74.5; skew-x: -13.5; skew-y: -13.5; scale-x: 0.792; scale-y: -10000; }
        frame 134 { x: 46.7; y: 75.1; skew-x: -15.5; skew-y: -15.5; scale-x: 0.793; scale-y: 0.793; }
        frame 135 { x: 47.6; y: 75.8; skew-x: -17.8; skew-y: -17.8; scale-x: 0.796; scale-y: 0.796; }
        frame 136 { x: 49; y: 71.4; skew-x: -8.7; skew-y: -8.7; scale-x: 0.797; scale-y: 0.797; }
        frame 137 { x: 50.6; y: 67.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 138 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 139 { cel: -10000; }
        frame 165 { cel: 0; }
        frame 166 { x: 51.1; y: 64; skew-x: 10.3; skew-y: 10.3; scale-x: 0.799; scale-y: 0.799; cel: -10000; }
        frame 167 { x: 52; y: 61.1; skew-x: 20.6; skew-y: 20.5; scale-x: -10000; scale-y: 0.798; }
        frame 168 { x: 53.1; y: 58.5; skew-x: 31.1; skew-y: 30.8; scale-y: -10000; }
        frame 169 { x: 55.1; y: 56; skew-x: 41.1; skew-y: 40.8; scale-x: 0.797; scale-y: 0.796; }
        frame 170 { x: 56.9; y: 53.9; skew-x: 51.1; skew-y: 50.7; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 58.9; y: 52.1; skew-x: 61; skew-y: 60.7; scale-x: 0.798; scale-y: 0.797; }
        frame 172 { x: 63.1; y: 49.8; skew-x: 74.4; skew-y: 74; scale-x: 0.797; scale-y: 0.795; }
        frame 173 { x: 66.9; y: 48.2; skew-x: 87.5; skew-y: 87.2; scale-x: -10000; scale-y: -10000; }
        frame 174 { x: 70.1; y: 47.1; skew-x: 100.7; skew-y: 100.4; scale-x: 0.796; }
        frame 175 { x: 66.8; y: 47.8; skew-x: 101.6; skew-y: 101.3; scale-x: 0.795; scale-y: 0.794; }
        frame 176 { x: 63.5; y: 48.5; skew-x: 102.6; skew-y: 102.3; scale-x: 0.794; scale-y: 0.793; }
        frame 177 { x: 60.1; y: 49.1; skew-x: 103.7; skew-y: 103.4; scale-x: -10000; scale-y: -10000; }
        frame 178 { x: 57.6; y: 48.4; skew-x: 79.5; skew-y: 79.2; scale-x: 0.796; scale-y: 0.794; }
        frame 179 { x: 55.7; y: 52.2; skew-x: 55.4; skew-y: 55.1; scale-x: -10000; scale-y: 0.795; }
        frame 180 { x: 53.1; y: 58.5; skew-x: 31.1; skew-y: 30.8; scale-x: 0.799; scale-y: 0.798; }
        frame 181 { x: 54.9; y: 61.2; skew-x: 20.6; skew-y: 20.5; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 56.9; y: 64.5; skew-x: 10.3; skew-y: 10.3; scale-y: 0.799; }
        frame 183 { x: 58.9; y: 68; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 184 { x: 59.6; y: 70.1; skew-x: -6.9; skew-y: -6.9; scale-x: 0.799; scale-y: 0.799; }
        frame 185 { x: 60.4; y: 72.2; skew-x: -14; skew-y: -14; scale-x: -10000; scale-y: -10000; }
        frame 186 { x: 61.5; y: 74.6; skew-x: -21.2; skew-y: -21.2; }
        frame 187 { x: 60; y: 74.5; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; }
        frame 188 { x: 58.3; y: -10000; skew-x: -21.5; skew-y: -21.5; scale-x: 0.797; scale-y: 0.797; }
        frame 189 { x: 56.8; y: 74.4; skew-x: -21.7; skew-y: -21.7; scale-x: -10000; scale-y: -10000; }
        frame 190 { x: 54.6; y: 71.9; skew-x: -14.4; skew-y: -14.4; scale-x: 0.798; scale-y: 0.798; }
        frame 191 { x: 52.6; y: 69.5; skew-x: -7.2; skew-y: -7.2; scale-x: 0.799; scale-y: 0.799; }
        frame 192 { x: 50.6; y: 67.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
}
