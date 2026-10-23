export component Zombie_digger {
    fps: 16;
    Track {
        source-name: "anim_idle";
        frame-count: 200;
        frame 18 { cel: -1; }
        frame 19 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 18 { cel: 0; }
        frame 19 { cel: -10000; }
        frame 55 { cel: -1; }
        frame 56 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 55 { cel: 0; }
        frame 56 { cel: -10000; }
        frame 88 { cel: -1; }
        frame 89 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 88 { cel: 0; }
        frame 89 { cel: -10000; }
        frame 128 { cel: -1; }
        frame 129 { cel: -10000; }
    }
    Track {
        source-name: "anim_dig";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 128 { cel: 0; }
        frame 129 { cel: -10000; }
        frame 146 { cel: -1; }
        frame 147 { cel: -10000; }
    }
    Track {
        source-name: "anim_drill";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 146 { x: 0.5; cel: 0; }
        frame 147 { x: -10000; cel: -10000; }
        frame 165 { cel: -1; }
        frame 166 { cel: -10000; }
    }
    Track {
        source-name: "anim_landing";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 165 { cel: 0; }
        frame 166 { cel: -10000; }
        frame 179 { cel: -1; }
        frame 180 { cel: -10000; }
    }
    Track {
        source-name: "anim_dizzy";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 179 { x: -0.9; y: 2.5; scale-x: 1.036; scale-y: 0.981; cel: 0; }
        frame 180 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 18 { x: -59.8; y: 90.1; cel: 0; }
        frame 19 { x: -58.1; y: -10000; cel: -10000; }
        frame 20 { x: -56.4; }
        frame 21 { x: -54.6; }
        frame 22 { x: -52.9; }
        frame 23 { x: -50; }
        frame 24 { x: -47.1; }
        frame 25 { x: -44.2; }
        frame 26 { x: -41.3; }
        frame 27 { x: -39.8; }
        frame 28 { x: -38.3; }
        frame 29 { x: -36.7; }
        frame 30 { x: -35.2; }
        frame 31 { x: -32.6; }
        frame 32 { x: -30; }
        frame 33 { x: -27.5; }
        frame 34 { x: -24.9; }
        frame 35 { x: -21.8; }
        frame 36 { x: -18.8; }
        frame 37 { x: -15.7; }
        frame 38 { x: -12.7; }
        frame 39 { x: -10.7; }
        frame 40 { x: -8.8; }
        frame 41 { x: -6.8; }
        frame 42 { x: -4.9; }
        frame 43 { x: -3.8; }
        frame 44 { x: -2.8; }
        frame 45 { x: -1.7; }
        frame 46 { x: -0.7; }
        frame 47 { x: 0.9; }
        frame 48 { x: 2.6; }
        frame 49 { x: 4.4; }
        frame 50 { x: 6.1; }
        frame 51 { x: 7.8; }
        frame 52 { x: 9.4; }
        frame 53 { x: 11; }
        frame 54 { x: 12.7; }
        frame 55 { x: -10000; cel: -1; }
        frame 56 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_digger_innerarm_lower";
        frame-count: 200;
        frame 0 { x: 16.1; y: 64.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_INNERARM_LOWER; }
        frame 1 { x: 15.9; y: 65.1; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 15.6; y: 65.6; skew-x: -1.9; skew-y: -1.9; }
        frame 3 { x: 15.5; y: 66.1; skew-x: -2.9; skew-y: -2.9; }
        frame 4 { x: 15.2; y: 66.6; skew-x: -3.9; skew-y: -3.9; }
        frame 5 { x: 15.1; y: 67.2; skew-x: -4.9; skew-y: -4.9; }
        frame 6 { x: 14.8; y: 67.8; skew-x: -6; skew-y: -6; scale-x: 0.799; scale-y: 0.799; }
        frame 7 { x: 14.7; y: 68.4; skew-x: -7; skew-y: -7; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 14.4; y: 68.9; skew-x: -8.2; skew-y: -8.2; }
        frame 9 { x: 14.2; y: 69.5; skew-x: -9.2; skew-y: -9.2; scale-x: 0.8; scale-y: 0.8; }
        frame 10 { x: 14.5; y: 68.8; skew-x: -7.9; skew-y: -7.9; scale-x: 0.799; scale-y: 0.799; }
        frame 11 { x: 14.7; y: 68.2; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 14.9; y: 67.6; skew-x: -5.7; skew-y: -5.7; }
        frame 13 { x: 15.1; y: 66.9; skew-x: -4.4; skew-y: -4.4; scale-x: 0.8; scale-y: 0.8; }
        frame 14 { x: 15.4; y: 66.3; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 15.5; y: 65.7; skew-x: -2.2; skew-y: -2.2; }
        frame 16 { x: 15.8; y: 65.1; skew-x: -0.9; skew-y: -0.9; }
        frame 17 { x: 16.1; y: 64.5; skew-x: 0; skew-y: 0; }
        frame 18 { x: 14; y: 60.8; skew-x: 17; skew-y: 17; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: 14.4; y: 59.6; skew-x: 17.5; skew-y: 17.5; scale-x: 0.798; scale-y: 0.798; }
        frame 20 { x: 14.7; y: 58.6; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 15.1; y: 57.5; skew-x: 18.6; skew-y: 18.6; }
        frame 22 { x: 15.4; y: 56.3; skew-x: 19.3; skew-y: 19.3; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 12.2; y: 60.1; skew-x: 15.3; skew-y: 15.3; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 9.1; y: 64.1; skew-x: 11.3; skew-y: 11.3; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 5.9; y: 67.9; skew-x: 7.3; skew-y: 7.3; }
        frame 26 { x: 2.8; y: 71.9; skew-x: 3.5; skew-y: 3.5; }
        frame 27 { x: 4; y: 70.9; skew-x: 2.5; skew-y: 2.5; scale-y: 0.833; }
        frame 28 { x: 5.1; y: 69.8; skew-x: 1.5; skew-y: 1.5; scale-y: 0.868; }
        frame 29 { x: 6.7; y: 68.5; skew-x: 0.5; skew-y: 0.5; scale-y: 0.833; }
        frame 30 { x: 8.3; y: 67.3; skew-x: -0.1; skew-y: -0.1; scale-y: 0.798; }
        frame 31 { x: 9.7; y: 65.6; skew-x: -0.2; skew-y: -0.2; scale-y: -10000; }
        frame 32 { x: 11.1; y: 64; skew-x: -0.4; skew-y: -0.4; scale-x: 0.797; scale-y: 0.797; }
        frame 33 { x: 12.4; y: 62.3; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 13.6; y: 60.6; skew-x: -1; skew-y: -1; }
        frame 35 { x: 14.2; y: -10000; skew-x: -3.9; skew-y: -3.9; scale-x: 0.796; scale-y: 0.796; }
        frame 36 { x: 14.9; y: 60.7; skew-x: -7; skew-y: -7; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 15.5; y: 60.9; skew-x: -10.2; skew-y: -10.2; scale-x: 0.795; scale-y: 0.795; }
        frame 38 { x: 16.3; y: 61; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 17.3; y: 60.5; skew-x: -15; skew-y: -15; }
        frame 40 { x: 18.2; y: 60.1; skew-x: -16.9; skew-y: -16.9; scale-x: 0.794; scale-y: 0.794; }
        frame 41 { x: 19.2; y: 59.7; skew-x: -18.7; skew-y: -18.7; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 20; y: 59.3; skew-x: -20.8; skew-y: -20.8; scale-x: 0.795; scale-y: 0.795; }
        frame 43 { x: 17.5; y: 64.6; skew-x: -23.2; skew-y: -23.2; scale-x: 0.793; scale-y: 0.793; }
        frame 44 { x: 15.2; y: 69.9; skew-x: -25.7; skew-y: -25.7; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 12.7; y: 75.3; skew-x: -28.5; skew-y: -28.5; }
        frame 46 { x: 10.4; y: 80.6; skew-x: -31; skew-y: -31; }
        frame 47 { x: 10.6; y: 78.7; skew-x: -26.5; skew-y: -26.5; }
        frame 48 { x: 10.7; y: 77; skew-x: -21.9; skew-y: -21.9; scale-x: 0.794; scale-y: 0.794; }
        frame 49 { x: 11; y: 75.2; skew-x: -17.4; skew-y: -17.4; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 11.4; y: 73.4; skew-x: -12.9; skew-y: -12.9; scale-x: 0.796; scale-y: 0.796; }
        frame 51 { x: 11.8; y: 69.9; skew-x: -5.4; skew-y: -5.4; scale-x: 0.797; scale-y: 0.797; }
        frame 52 { x: 12.4; y: 66.6; skew-x: 2; skew-y: 2; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: 13.2; y: 63.5; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 14; y: 60.8; skew-x: 17; skew-y: 17; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 16.1; y: 64.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: 16.8; y: 63.5; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 17.7; y: 62.4; skew-x: 2.8; skew-y: 2.8; }
        frame 58 { x: 18.4; y: 61.4; skew-x: 4; skew-y: 4; }
        frame 59 { x: 19.3; y: 60.3; skew-x: 5.6; skew-y: 5.6; }
        frame 60 { x: 19.6; y: 59.8; skew-x: 4.5; skew-y: 4.5; scale-x: 0.799; scale-y: 0.817; }
        frame 61 { x: 19.9; y: 59.4; skew-x: 3.6; skew-y: 3.6; scale-x: -10000; scale-y: 0.835; }
        frame 62 { x: 20.2; y: 58.8; skew-x: 2.8; skew-y: 2.8; scale-y: 0.853; }
        frame 63 { x: 20.3; y: 58.4; skew-x: 1.8; skew-y: 1.8; scale-y: 0.871; }
        frame 64 { x: 18.5; y: 62.4; skew-x: -8.9; skew-y: -8.9; scale-x: 0.798; scale-y: 0.87; }
        frame 65 { x: 17.3; y: 66.7; skew-x: -19.7; skew-y: -19.7; scale-x: 0.797; scale-y: 0.869; }
        frame 66 { x: 16.5; y: 71.6; skew-x: -30.7; skew-y: -30.7; scale-x: 0.798; scale-y: 0.87; }
        frame 67 { x: 16.6; y: 69.4; skew-x: -24.7; skew-y: -24.7; scale-x: 0.797; scale-y: 0.857; }
        frame 68 { x: 16.9; y: 67.3; skew-x: -18.5; skew-y: -18.5; scale-x: 0.798; scale-y: 0.845; }
        frame 69 { x: 17.3; y: 65.4; skew-x: -12.4; skew-y: -12.4; scale-x: -10000; scale-y: 0.834; }
        frame 70 { x: 17.8; y: 63.5; skew-x: -6.4; skew-y: -6.4; scale-x: 0.799; scale-y: 0.823; }
        frame 71 { x: 18.5; y: 61.9; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: 0.811; }
        frame 72 { x: 19.3; y: 60.3; skew-x: 5.6; skew-y: 5.6; scale-x: 0.8; scale-y: 0.8; }
        frame 73 { x: 19.5; y: 60; skew-x: 4.8; skew-y: 4.8; scale-x: 0.799; scale-y: 0.811; }
        frame 74 { x: 19.7; y: 59.6; skew-x: 4.3; skew-y: 4.3; scale-x: -10000; scale-y: 0.823; }
        frame 75 { x: 19.9; y: 59.4; skew-x: 3.6; skew-y: 3.6; scale-y: 0.835; }
        frame 76 { x: 20.1; y: 59; skew-x: 3; skew-y: 3; scale-y: 0.847; }
        frame 77 { x: 20.2; y: 58.6; skew-x: 2.3; skew-y: 2.3; scale-y: 0.859; }
        frame 78 { x: 20.3; y: 58.4; skew-x: 1.8; skew-y: 1.8; scale-y: 0.871; }
        frame 79 { x: 19.4; y: 62.4; skew-x: -8.9; skew-y: -8.9; scale-x: 0.798; scale-y: 0.87; }
        frame 80 { x: 19; y: 66.7; skew-x: -19.7; skew-y: -19.7; scale-x: 0.797; scale-y: 0.869; }
        frame 81 { x: 19.1; y: 71.6; skew-x: -30.7; skew-y: -30.7; scale-x: 0.798; scale-y: 0.87; }
        frame 82 { x: 18.5; y: 70.2; skew-x: -25.5; skew-y: -25.5; scale-x: 0.797; scale-y: 0.857; }
        frame 83 { x: 17.8; y: 68.8; skew-x: -20.4; skew-y: -20.4; scale-x: 0.798; scale-y: 0.845; }
        frame 84 { x: 17.2; y: 67.6; skew-x: -15.2; skew-y: -15.2; scale-x: -10000; scale-y: 0.834; }
        frame 85 { x: 16.7; y: 66.6; skew-x: -10.2; skew-y: -10.2; scale-x: 0.799; scale-y: 0.823; }
        frame 86 { x: 16.3; y: 65.5; skew-x: -4.9; skew-y: -4.9; scale-x: -10000; scale-y: 0.811; }
        frame 87 { x: 16.1; y: 64.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 17.8; y: 64; skew-x: 3.3; skew-y: 3.3; }
        frame 90 { x: 19.8; y: 63.6; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 91 { x: 21.6; y: 63.1; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 23.5; y: 62.6; skew-x: 13.3; skew-y: 13.3; }
        frame 93 { x: 19.2; y: 54.1; skew-x: 33.9; skew-y: 33.9; scale-x: 0.798; scale-y: 0.807; }
        frame 94 { x: 15.2; y: 47.9; skew-x: 54.7; skew-y: 54.7; scale-x: 0.797; scale-y: 0.816; }
        frame 95 { x: 10.7; y: 44; skew-x: 75.4; skew-y: 75.4; scale-x: 0.798; scale-y: 0.826; }
        frame 96 { x: 4.9; y: 42.1; skew-x: 96; skew-y: 96; scale-x: -10000; scale-y: 0.836; }
        frame 97 { x: 12.5; y: 45.1; skew-x: 112.6; skew-y: 117.8; scale-x: 0.806; scale-y: 0.833; }
        frame 98 { x: 18; y: 48.1; skew-x: 129.3; skew-y: 139.9; scale-x: 0.814; scale-y: 0.831; }
        frame 99 { x: 21.7; y: 50.5; skew-x: 146; skew-y: 161.7; scale-x: 0.824; scale-y: -10000; }
        frame 100 { x: 20.9; y: 51.1; skew-x: 142.4; skew-y: 156.2; scale-x: 0.832; scale-y: 0.83; }
        frame 101 { x: 19.9; y: 51.6; skew-x: 138.8; skew-y: 150.6; scale-x: 0.843; scale-y: -10000; }
        frame 102 { x: 18.9; y: 49.6; skew-x: 140.7; skew-y: 154.4; scale-x: 0.832; scale-y: 0.829; }
        frame 103 { x: 17.9; y: 47.6; skew-x: 142.5; skew-y: 158.2; scale-x: 0.824; scale-y: 0.831; }
        frame 104 { x: 9.7; y: 50.3; skew-x: 115.8; skew-y: 131.6; scale-x: 0.822; scale-y: 0.828; }
        frame 105 { x: 3; y: 54.3; skew-x: 89.3; skew-y: 105; scale-x: 0.821; scale-y: -10000; }
        frame 106 { x: -16.3; y: 66.1; skew-x: 44.5; skew-y: 60.1; scale-x: 0.82; scale-y: 0.827; }
        frame 107 { x: -21.4; y: 90.6; skew-x: 1.4; skew-y: 24.1; scale-x: 0.853; scale-y: 0.825; }
        frame 108 { x: -21.1; y: 92.4; skew-x: 1.8; skew-y: 25.1; scale-x: 0.863; scale-y: 0.817; }
        frame 109 { x: -20.7; y: 94.2; skew-x: 2.4; skew-y: 26.3; scale-x: 0.873; scale-y: 0.812; }
        frame 110 { x: -20.9; y: 93; skew-x: 2; skew-y: 25.5; scale-x: 0.866; scale-y: 0.815; }
        frame 111 { x: -21.2; y: 91.7; skew-x: 1.6; skew-y: 24.8; scale-x: 0.86; scale-y: 0.819; }
        frame 112 { x: -21.4; y: 90.6; skew-x: 1.4; skew-y: 24.1; scale-x: 0.853; scale-y: 0.825; }
        frame 113 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: -17.8; y: 93.2; skew-x: 8.3; skew-y: 30.9; scale-y: 0.823; }
        frame 117 { x: -14.1; y: 96.2; skew-x: 15.1; skew-y: 37.9; scale-x: 0.852; scale-y: -10000; }
        frame 118 { x: -10.3; y: 99.3; skew-x: 22.2; skew-y: 44.9; scale-x: -10000; scale-y: 0.824; }
        frame 119 { x: -8.3; y: 101.4; skew-x: 29.6; skew-y: 52.4; scale-x: 0.851; scale-y: 0.822; }
        frame 120 { x: -6.4; y: 103.8; skew-x: 37.1; skew-y: 59.7; scale-x: 0.85; scale-y: 0.821; }
        frame 121 { x: -4.5; y: 106.3; skew-x: 44.5; skew-y: 67.2; scale-x: 0.851; scale-y: 0.822; }
        frame 122 { x: -5; y: 107.1; skew-x: 43.1; skew-y: 68.2; scale-x: 0.847; scale-y: 0.831; }
        frame 123 { x: -5.5; y: 107.9; skew-x: 41.8; skew-y: 69; scale-x: 0.845; scale-y: 0.842; }
        frame 124 { x: -5; y: 107.2; skew-x: 43.1; skew-y: 68.2; scale-x: 0.847; scale-y: 0.831; }
        frame 125 { x: -4.5; y: 106.3; skew-x: 44.5; skew-y: 67.2; scale-x: 0.851; scale-y: 0.822; }
        frame 126 { x: -10000; y: 106.4; skew-x: 44.4; skew-y: -10000; scale-x: 0.849; scale-y: 0.821; }
        frame 127 { y: 106.3; skew-x: 44.5; scale-x: 0.851; scale-y: 0.822; }
        frame 128 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 129 { cel: -10000; }
        frame 146 { x: 24.4; y: 44.2; skew-x: 5.8; skew-y: 5.8; scale-x: 0.8; scale-y: 0.8; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 23.9; cel: 0; }
        frame 165 { x: 22.6; y: 47.6; skew-x: 4.8; skew-y: 4.8; cel: -10000; }
        frame 166 { x: 21.3; y: 51; skew-x: 3.8; skew-y: 3.8; }
        frame 167 { x: 19.9; y: 54.4; skew-x: 2.8; skew-y: 2.8; }
        frame 168 { x: 18.6; y: 57.8; skew-x: 1.8; skew-y: 1.8; }
        frame 169 { x: 17.3; y: 61.1; skew-x: 0.8; skew-y: 0.8; }
        frame 170 { x: 16.1; y: 64.5; skew-x: 0; skew-y: 0; }
        frame 171 { x: 15.8; y: 65.7; skew-x: -0.4; skew-y: -0.5; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { x: 15.5; y: 66.8; skew-x: -1.2; skew-y: -1.2; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: 15.2; y: 68; skew-x: -1.8; skew-y: -2.1; scale-x: 0.829; scale-y: 0.785; }
        frame 174 { x: 15.4; y: 67.1; skew-x: -1.2; skew-y: -1.4; scale-x: 0.821; scale-y: 0.789; }
        frame 175 { x: 15.7; y: 66.2; skew-x: -0.7; skew-y: -0.9; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: 15.8; y: 65.3; skew-x: -0.2; skew-y: -0.4; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: 16.1; y: 64.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 16.8; y: 63.6; skew-x: 3.1; skew-y: 3.1; }
        frame 181 { x: 17.6; y: 62.7; skew-x: 6.3; skew-y: 6.3; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: 18.5; y: 61.9; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 19.4; y: 61.1; skew-x: 12.8; skew-y: 12.8; }
        frame 184 { x: 20.2; y: 60.3; skew-x: 16.1; skew-y: 16.1; }
        frame 185 { x: 19.8; y: 61.1; skew-x: 14; skew-y: 14; scale-x: 0.798; scale-y: 0.798; }
        frame 186 { x: 19.3; y: 61.6; skew-x: 12.1; skew-y: 12.1; scale-x: 0.799; scale-y: 0.799; }
        frame 187 { x: 18.3; y: 62.3; skew-x: 8.3; skew-y: 8.3; scale-x: 0.798; scale-y: 0.798; }
        frame 188 { x: 17.4; y: 63; skew-x: 4.3; skew-y: 4.3; scale-x: 0.799; scale-y: 0.799; }
        frame 189 { x: 16.6; y: 63.8; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 190 { x: 15.9; y: 64.6; skew-x: -2.9; skew-y: -2.9; }
        frame 191 { x: 15.2; y: 65.5; skew-x: -6.7; skew-y: -6.7; }
        frame 192 { x: 14.5; y: 66.3; skew-x: -10.5; skew-y: -10.5; }
        frame 193 { x: 13.9; y: 67.4; skew-x: -14.4; skew-y: -14.4; scale-x: 0.798; scale-y: 0.798; }
        frame 194 { x: 13.4; y: 68.4; skew-x: -18.2; skew-y: -18.2; scale-x: 0.799; scale-y: 0.799; }
        frame 195 { x: 13.8; y: 67.6; skew-x: -16.7; skew-y: -16.7; scale-x: 0.798; scale-y: 0.798; }
        frame 196 { x: 14; y: 66.8; skew-x: -15.5; skew-y: -15.5; scale-x: 0.799; scale-y: 0.799; }
        frame 197 { x: 14.6; y: 65.9; skew-x: -10.2; skew-y: -10.2; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 15.3; y: 65.1; skew-x: -5; skew-y: -5; }
        frame 199 { x: 16.1; y: 64.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_digger_pickaxe";
        frame-count: 200;
        frame 0 { x: -10.4; y: 64.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_PICKAXE; }
        frame 1 { x: -8.8; y: 62.8; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -7.1; y: 60.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: -7.4; y: 61.7; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: -7.7; y: 62.8; skew-x: 6.5; skew-y: 6.5; }
        frame 5 { x: -7.9; y: 63.8; skew-x: 5.8; skew-y: 5.8; }
        frame 6 { x: -8.2; y: 65; skew-x: 5; skew-y: 5; }
        frame 7 { x: -8.5; y: 66.1; skew-x: 4; skew-y: 4; }
        frame 8 { x: -8.8; y: 67.2; skew-x: 3.3; skew-y: 3.3; }
        frame 9 { x: -8.9; y: 68.4; skew-x: 2.5; skew-y: 2.5; }
        frame 10 { x: -10.7; y: 70.3; skew-x: -2.2; skew-y: -2.2; }
        frame 11 { x: -12.4; y: 72.4; skew-x: -7; skew-y: -7; }
        frame 12 { x: -12; y: 71.1; skew-x: -5.7; skew-y: -5.7; }
        frame 13 { x: -11.7; y: 69.8; skew-x: -4.5; skew-y: -4.5; }
        frame 14 { x: -11.4; y: 68.6; skew-x: -3.4; skew-y: -3.4; }
        frame 15 { x: -11.1; y: 67.3; skew-x: -2.2; skew-y: -2.2; }
        frame 16 { x: -10.7; y: 66; skew-x: -0.9; skew-y: -0.9; scale-x: 0.8; scale-y: 0.8; }
        frame 17 { x: -10.4; y: 64.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -17.9; y: 58.3; skew-x: 5.5; skew-y: 5.5; scale-x: 0.798; scale-y: 0.798; }
        frame 19 { x: -18.5; y: 58.5; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: -18.9; y: 58.6; skew-x: 1.3; skew-y: 1.3; }
        frame 21 { x: -19.3; y: -10000; skew-x: -0.5; skew-y: -0.5; }
        frame 22 { x: -19.7; y: 58.8; skew-x: -2.7; skew-y: -2.7; }
        frame 23 { x: -23.6; y: 67.8; skew-x: -10.9; skew-y: -10.9; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: -27.1; y: 76.9; skew-x: -19; skew-y: -19; scale-x: 0.796; scale-y: 0.796; }
        frame 25 { x: -30.1; y: 86.5; skew-x: -27.2; skew-y: -27.2; scale-x: 0.795; scale-y: 0.795; }
        frame 26 { x: -32.7; y: 96.1; skew-x: -35.5; skew-y: -35.5; scale-x: 0.796; scale-y: 0.796; }
        frame 27 { x: -30.9; y: 97.8; skew-x: -39.3; skew-y: -39.3; scale-x: 0.794; scale-y: 0.794; }
        frame 28 { x: -29.1; y: 99.7; skew-x: -43; skew-y: -43; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: -27.2; y: 96.7; skew-x: -41; skew-y: -41; }
        frame 30 { x: -25.5; y: 93.7; skew-x: -39.3; skew-y: -39.3; scale-x: 0.796; scale-y: 0.796; }
        frame 31 { x: -24.3; y: 92.2; skew-x: -39.5; skew-y: -39.5; scale-x: 0.794; scale-y: 0.794; }
        frame 32 { x: -23.2; y: 90.7; skew-x: -39.7; skew-y: -39.7; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: -22; y: 89.2; skew-x: -40; skew-y: -40; }
        frame 34 { x: -21; y: 87.7; skew-x: -40.2; skew-y: -40.2; scale-x: 0.795; scale-y: 0.795; }
        frame 35 { x: -19.5; y: 86.9; skew-x: -38.7; skew-y: -38.7; scale-x: 0.794; scale-y: 0.794; }
        frame 36 { x: -17.8; y: 86.2; skew-x: -37; skew-y: -37; scale-x: 0.793; scale-y: 0.793; }
        frame 37 { x: -16.2; y: 85.4; skew-x: -35.5; skew-y: -35.5; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: -14.6; y: 84.8; skew-x: -34.1; skew-y: -34.1; scale-x: 0.795; scale-y: 0.795; }
        frame 39 { x: -12.8; y: 85.4; skew-x: -36; skew-y: -36; scale-x: 0.793; scale-y: 0.793; }
        frame 40 { x: -11.1; y: 85.9; skew-x: -37.8; skew-y: -37.8; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: -9.3; y: 86.5; skew-x: -39.8; skew-y: -39.8; }
        frame 42 { x: -7.5; y: 87; skew-x: -41.6; skew-y: -41.6; scale-x: 0.794; scale-y: 0.794; }
        frame 43 { x: -9.2; y: 91.1; skew-x: -41.8; skew-y: -41.8; scale-x: 0.792; scale-y: 0.792; }
        frame 44 { x: -11; y: 95.4; skew-x: -42; skew-y: -42; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: -12.8; y: 99.6; skew-x: -42.3; skew-y: -42.3; scale-x: 0.791; scale-y: 0.791; }
        frame 46 { x: -14.5; y: 103.9; skew-x: -42.6; skew-y: -42.6; scale-x: 0.792; scale-y: 0.792; }
        frame 47 { x: -15.1; y: 101.5; skew-x: -40.2; skew-y: -40.2; scale-x: 0.791; scale-y: 0.791; }
        frame 48 { x: -15.8; y: 98.8; skew-x: -37.8; skew-y: -37.8; scale-x: 0.792; scale-y: 0.792; }
        frame 49 { x: -10000; y: 90.8; skew-x: -28.2; skew-y: -28.2; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: -15.1; y: 83.1; skew-x: -19; skew-y: -19; scale-x: 0.795; scale-y: 0.795; }
        frame 51 { x: -16.1; y: 76.6; skew-x: -12.7; skew-y: -12.7; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: -16.9; y: 70.4; skew-x: -6.7; skew-y: -6.7; scale-x: 0.796; scale-y: 0.796; }
        frame 53 { x: -17.4; y: 64.2; skew-x: -0.4; skew-y: -0.4; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: -17.9; y: 58.3; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: -10.4; y: 64.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: -10.7; y: 64.5; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: -10.9; y: 64.2; skew-x: -1.9; skew-y: -1.9; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: -11.1; y: 63.8; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -11.4; y: 63.5; skew-x: -4.1; skew-y: -4.1; }
        frame 60 { x: -11.2; y: 63.9; skew-x: -5.2; skew-y: -5.2; }
        frame 61 { x: -11; y: 64.5; skew-x: -6.4; skew-y: -6.4; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: -10.8; y: 65; skew-x: -7.7; skew-y: -7.7; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: -10.7; y: 65.5; skew-x: -9; skew-y: -9; }
        frame 64 { x: -9.8; y: 74.7; skew-x: -19.7; skew-y: -19.7; scale-x: 0.797; scale-y: 0.797; }
        frame 65 { x: -8.1; y: 84.5; skew-x: -30.7; skew-y: -30.7; scale-x: 0.796; scale-y: 0.796; }
        frame 66 { x: -5.6; y: 94.3; skew-x: -41.7; skew-y: -41.7; scale-x: 0.797; scale-y: 0.797; }
        frame 67 { x: -7.2; y: 89; skew-x: -35.5; skew-y: -35.5; scale-x: 0.796; scale-y: 0.796; }
        frame 68 { x: -8.7; y: 83.7; skew-x: -29.2; skew-y: -29.2; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: -9.9; y: 78.5; skew-x: -22.9; skew-y: -22.9; scale-x: 0.797; scale-y: 0.797; }
        frame 70 { x: -10.6; y: 73.2; skew-x: -16.5; skew-y: -16.5; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -11.1; y: 68.3; skew-x: -10.2; skew-y: -10.2; scale-x: 0.798; scale-y: 0.798; }
        frame 72 { x: -11.4; y: 63.5; skew-x: -4.1; skew-y: -4.1; scale-x: 0.799; scale-y: 0.799; }
        frame 73 { x: -11.3; y: 63.8; skew-x: -4.9; skew-y: -4.9; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -11.2; y: 64.2; skew-x: -5.7; skew-y: -5.7; scale-x: 0.798; scale-y: 0.798; }
        frame 75 { x: -11; y: 64.5; skew-x: -6.4; skew-y: -6.4; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: -10.9; y: 64.8; skew-x: -7.2; skew-y: -7.2; }
        frame 77 { x: -10.7; y: 65.2; skew-x: -8.2; skew-y: -8.2; }
        frame 78 { x: -10000; y: 65.5; skew-x: -9; skew-y: -9; }
        frame 79 { x: -8.9; y: 74.7; skew-x: -19.7; skew-y: -19.7; scale-x: 0.797; scale-y: 0.797; }
        frame 80 { x: -6.4; y: 84.5; skew-x: -30.7; skew-y: -30.7; scale-x: 0.796; scale-y: 0.796; }
        frame 81 { x: -3; y: 94.3; skew-x: -41.7; skew-y: -41.7; scale-x: 0.797; scale-y: 0.797; }
        frame 82 { x: -5.1; y: 89.1; skew-x: -34.7; skew-y: -34.7; scale-x: 0.796; scale-y: 0.796; }
        frame 83 { x: -6.9; y: 83.9; skew-x: -27.7; skew-y: -27.7; scale-x: 0.797; scale-y: 0.797; }
        frame 84 { x: -8.3; y: 78.9; skew-x: -20.7; skew-y: -20.7; scale-x: 0.798; scale-y: 0.798; }
        frame 85 { x: -9.3; y: 73.9; skew-x: -13.7; skew-y: -13.7; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: -10.1; y: 69.3; skew-x: -6.7; skew-y: -6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 87 { x: -10.4; y: 64.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -8.5; y: 62.7; skew-x: 3.3; skew-y: 3.3; }
        frame 90 { x: -6.5; y: 60.8; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 91 { x: -4.4; y: 58.8; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: -2.3; y: 56.8; skew-x: 13.3; skew-y: 13.3; }
        frame 93 { x: -2.1; y: 42.1; skew-x: 32.3; skew-y: 32.3; scale-x: 0.798; scale-y: 0.798; }
        frame 94 { x: -1.2; y: 30.5; skew-x: 51.4; skew-y: 51.4; scale-x: 0.797; scale-y: 0.797; }
        frame 95 { x: -0.5; y: 21.7; skew-x: 70.7; skew-y: 70.7; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: -1.1; y: 15.7; skew-x: 89.7; skew-y: 89.7; }
        frame 97 { x: 18.7; y: 25.9; skew-x: 118.3; skew-y: 118.3; scale-x: 0.794; scale-y: 0.794; }
        frame 98 { x: 32.3; y: 38.1; skew-x: 147.2; skew-y: 147.2; scale-x: 0.792; scale-y: 0.792; }
        frame 99 { x: 39.5; y: 49; skew-x: 176; skew-y: 176; scale-x: 0.791; scale-y: 0.791; }
        frame 100 { x: 38.9; y: 48.3; skew-x: 171.9; skew-y: 170.9; scale-x: 0.812; scale-y: 0.785; }
        frame 101 { x: 38.2; y: 47.3; skew-x: 167.6; skew-y: 165.7; scale-x: 0.834; scale-y: 0.78; }
        frame 102 { x: 37; y: 46.3; skew-x: 170.2; skew-y: 169.2; scale-x: 0.812; scale-y: 0.785; }
        frame 103 { x: 35.5; y: 45.1; skew-x: 172.4; skew-y: 172.4; scale-x: 0.791; scale-y: 0.791; }
        frame 104 { x: 21.8; y: 35.4; skew-x: 134.1; skew-y: 134.1; scale-x: 0.788; scale-y: 0.788; }
        frame 105 { x: 0; y: 28.7; skew-x: 96; skew-y: 96; scale-x: 0.787; scale-y: 0.787; }
        frame 106 { x: -39.8; y: 49.2; skew-x: 45.6; skew-y: 45.6; scale-x: 0.785; scale-y: 0.785; }
        frame 107 { x: -58.9; y: 106.6; skew-x: -22.3; skew-y: -22.3; scale-x: 0.784; scale-y: 0.784; }
        frame 108 { x: -57.8; y: 106.2; skew-x: -19.7; skew-y: -19.7; scale-x: 0.783; scale-y: 0.783; }
        frame 109 { x: -56.9; y: 105.9; skew-x: -17.5; skew-y: -17.5; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: -57.6; y: 106.1; skew-x: -19; skew-y: -19; }
        frame 111 { x: -58.2; y: 106.4; skew-x: -20.7; skew-y: -20.7; }
        frame 112 { x: -58.9; y: 106.6; skew-x: -22.3; skew-y: -22.3; scale-x: 0.784; scale-y: 0.784; }
        frame 113 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 116 { x: -56; y: 104.6; skew-x: -15.9; skew-y: -15.9; scale-x: 0.783; scale-y: 0.783; }
        frame 117 { x: -52.9; y: 102.9; skew-x: -9.7; skew-y: -9.7; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: -49.5; y: 101.5; skew-x: -3.5; skew-y: -3.5; }
        frame 119 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 128 { cel: -1; }
        frame 129 { cel: -10000; }
        frame 131 { x: 29.5; y: 105.5; skew-x: 13.7; skew-y: 13.7; scale-x: 0.782; scale-y: 0.524; cel: 0; }
        frame 132 { x: 33.8; y: 99.3; skew-x: 25.3; skew-y: 25.3; scale-x: 0.78; scale-y: 0.558; cel: -10000; }
        frame 133 { x: 38.9; y: 94; skew-x: 36.9; skew-y: 36.9; scale-x: -10000; scale-y: 0.592; }
        frame 134 { x: 44.4; y: 89.9; skew-x: 48.4; skew-y: 48.4; scale-x: 0.779; scale-y: 0.627; }
        frame 135 { x: 50.3; y: 86.9; skew-x: 60.2; skew-y: 60.2; scale-x: -10000; scale-y: 0.662; }
        frame 136 { x: 56.1; y: 85.2; skew-x: 71.7; skew-y: 71.6; scale-x: 0.78; scale-y: 0.698; }
        frame 137 { x: 35.6; y: 88.1; skew-x: 39.6; skew-y: 39.6; scale-x: 0.777; scale-y: 0.695; }
        frame 138 { x: 16.3; y: 98.4; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 11.4; y: 113.2; skew-x: -19.6; skew-y: -19.6; scale-x: 0.776; scale-y: 0.483; }
        frame 140 { x: 12.4; y: 122.4; skew-x: -30.4; skew-y: -30.4; scale-x: 0.775; scale-y: 0.365; }
        frame 141 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 142 { cel: -10000; }
        frame 146 { x: 25.9; y: 25.9; skew-x: 51.4; skew-y: 51.4; scale-x: 0.798; scale-y: 0.798; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 25.4; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 17.8; y: 32.1; skew-x: 41.1; skew-y: 41.1; scale-x: 0.797; scale-y: 0.797; }
        frame 167 { x: 10.2; y: 39.1; skew-x: 30.8; skew-y: 30.8; scale-x: 0.798; scale-y: 0.798; }
        frame 168 { x: 2.8; y: 47; skew-x: 20.5; skew-y: 20.5; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: -4; y: 55.6; skew-x: 10.3; skew-y: 10.3; scale-x: 0.799; scale-y: 0.799; }
        frame 170 { x: -10.4; y: 64.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 171 { x: -11; y: 66.7; skew-x: -0.4; skew-y: -0.5; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { x: -11.6; y: 68.4; skew-x: -1.2; skew-y: -1.2; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: -12.3; y: 70.2; skew-x: -1.8; skew-y: -2.1; scale-x: 0.829; scale-y: 0.785; }
        frame 174 { x: -11.8; y: 68.8; skew-x: -1.2; skew-y: -1.4; scale-x: 0.821; scale-y: 0.789; }
        frame 175 { x: -11.4; y: 67.4; skew-x: -0.7; skew-y: -0.9; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: -10.9; y: 66.2; skew-x: -0.2; skew-y: -0.4; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: -10.4; y: 64.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: -9.6; y: 62.5; skew-x: 3.1; skew-y: 3.1; }
        frame 181 { x: -8.6; y: 60.1; skew-x: 6.3; skew-y: 6.3; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: -7.6; y: 57.8; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: -6.4; y: 55.5; skew-x: 12.8; skew-y: 12.8; }
        frame 184 { x: -5.3; y: 53.3; skew-x: 16.1; skew-y: 16.1; }
        frame 185 { x: -7.3; y: 55.5; skew-x: 11.8; skew-y: 11.8; scale-x: 0.798; scale-y: 0.798; }
        frame 186 { x: -9.3; y: 57.8; skew-x: 7.6; skew-y: 7.6; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: -10; y: 60.4; skew-x: 4.3; skew-y: 4.3; }
        frame 188 { x: -10.6; y: 63; skew-x: 1; skew-y: 1; }
        frame 189 { x: -11.1; y: 65.5; skew-x: -1.9; skew-y: -1.9; }
        frame 190 { x: -11.6; y: 68.2; skew-x: -5.2; skew-y: -5.2; scale-x: 0.799; scale-y: 0.799; }
        frame 191 { x: -11.7; y: 70.4; skew-x: -8.4; skew-y: -8.4; scale-x: 0.798; scale-y: 0.798; }
        frame 192 { x: -11.6; y: 72.6; skew-x: -11.7; skew-y: -11.7; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: -11.7; y: 74.8; skew-x: -14.9; skew-y: -14.9; }
        frame 194 { x: -11.5; y: 77.1; skew-x: -18.2; skew-y: -18.2; scale-x: 0.799; scale-y: 0.799; }
        frame 195 { x: -11.7; y: 76.8; skew-x: -18.5; skew-y: -18.5; scale-x: 0.798; scale-y: 0.798; }
        frame 196 { x: -11.8; y: 76.7; skew-x: -19; skew-y: -19; scale-x: 0.799; scale-y: 0.799; }
        frame 197 { x: -11.6; y: 72.6; skew-x: -12.7; skew-y: -12.7; scale-x: 0.798; scale-y: 0.798; }
        frame 198 { x: -11.1; y: 68.7; skew-x: -6.2; skew-y: -6.2; scale-x: 0.799; scale-y: 0.799; }
        frame 199 { x: -10.4; y: 64.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_digger_dirt";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 107 { x: -44.7; y: 132.5; scale-x: 0.406; scale-y: 0.4; cel: 0; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIRT; }
        frame 108 { x: -46; y: 131.9; scale-x: 0.511; scale-y: 0.5; cel: -10000; image: none; }
        frame 109 { x: -47.3; y: 131.4; scale-x: 0.615; scale-y: 0.6; }
        frame 110 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 128 { cel: -1; }
        frame 129 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_digger_innerarm_hand";
        frame-count: 200;
        frame 0 { x: 13; y: 82.4; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_INNERARM_HAND; }
        frame 1 { x: -10000; y: 82; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 13.2; y: 81.6; skew-x: 4.8; skew-y: 4.8; }
        frame 3 { x: -10000; y: 82.3; skew-x: 4.3; skew-y: 4.3; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 13.3; y: 83; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: -10000; y: 83.5; skew-x: 3.8; skew-y: 3.8; }
        frame 6 { x: 13.4; y: 84.2; skew-x: 3.3; skew-y: 3.3; }
        frame 7 { x: 13.5; y: 84.9; skew-x: 3; skew-y: 3; }
        frame 8 { x: -10000; y: 85.5; skew-x: 2.8; skew-y: 2.8; }
        frame 9 { x: 13.7; y: 86.1; skew-x: 2.5; skew-y: 2.5; }
        frame 10 { x: 13.4; y: 86.2; skew-x: 0.3; skew-y: 0.3; }
        frame 11 { x: 13.3; y: 86.6; skew-x: -1.7; skew-y: -1.7; }
        frame 12 { x: -10000; y: 85.8; skew-x: -1.2; skew-y: -1.2; }
        frame 13 { x: 13.2; y: 85.1; skew-x: -0.9; skew-y: -0.9; }
        frame 14 { x: -10000; y: 84.4; skew-x: -0.7; skew-y: -0.7; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { y: 83.8; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 13.1; y: 83; skew-x: -0.2; skew-y: -0.2; }
        frame 17 { x: 13; y: 82.4; skew-x: 0; skew-y: 0; }
        frame 18 { x: 3.8; y: 78; skew-x: 7; skew-y: 7; scale-x: 0.798; scale-y: 0.798; }
        frame 19 { x: 3.6; y: 77.4; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: -10000; y: 76.8; skew-x: 1; skew-y: 1; }
        frame 21 { y: 76.2; skew-x: -1.4; skew-y: -1.4; }
        frame 22 { y: 75.6; skew-x: -4.5; skew-y: -4.5; }
        frame 23 { x: 1.5; y: 80.7; skew-x: -10.7; skew-y: -10.7; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: -0.4; y: 85.9; skew-x: -17.2; skew-y: -17.2; scale-x: 0.796; scale-y: 0.796; }
        frame 25 { x: -2.2; y: 91.1; skew-x: -23.7; skew-y: -23.7; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: -4; y: 96.4; skew-x: -30; skew-y: -30; scale-x: 0.797; scale-y: 0.797; }
        frame 27 { x: -2.4; y: -10000; skew-x: -33.7; skew-y: -33.7; scale-x: 0.795; scale-y: 0.795; }
        frame 28 { x: -0.8; skew-x: -37.5; skew-y: -37.5; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 1.1; y: 94.2; skew-x: -35.5; skew-y: -35.5; scale-x: 0.794; scale-y: 0.794; }
        frame 30 { x: 3; y: 92.1; skew-x: -33.8; skew-y: -33.8; scale-x: 0.796; scale-y: 0.796; }
        frame 31 { x: 4.4; y: 90.8; skew-x: -36; skew-y: -36; scale-x: 0.795; scale-y: 0.795; }
        frame 32 { x: 5.8; y: 89.3; skew-x: -38.2; skew-y: -38.2; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 7.1; y: 87.9; skew-x: -40.3; skew-y: -40.3; }
        frame 34 { x: 8.5; y: 86.6; skew-x: -42.5; skew-y: -42.5; scale-x: 0.796; scale-y: 0.796; }
        frame 35 { x: 9.8; y: 86.9; skew-x: -45; skew-y: -45; scale-x: 0.794; scale-y: 0.794; }
        frame 36 { x: 11.2; y: 87.3; skew-x: -47.5; skew-y: -47.5; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 12.5; y: 87.8; skew-x: -49.8; skew-y: -49.8; }
        frame 38 { x: 13.9; y: 88.2; skew-x: -52.3; skew-y: -52.3; scale-x: 0.795; scale-y: 0.795; }
        frame 39 { x: 15.9; y: 88.8; skew-x: -55.1; skew-y: -55.1; scale-x: 0.794; scale-y: 0.794; }
        frame 40 { x: 17.8; y: 89.3; skew-x: -57.8; skew-y: -57.8; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 19.9; y: 89.8; skew-x: -60.6; skew-y: -60.6; }
        frame 42 { x: 21.9; y: 90.4; skew-x: -63.4; skew-y: -63.4; scale-x: 0.795; scale-y: 0.795; }
        frame 43 { x: 20.2; y: 94.5; skew-x: -63.6; skew-y: -63.6; scale-x: 0.793; scale-y: 0.793; }
        frame 44 { x: 18.5; y: 98.5; skew-x: -63.9; skew-y: -63.9; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 16.7; y: 102.6; skew-x: -64.1; skew-y: -64.1; }
        frame 46 { x: 14.8; y: 106.8; skew-x: -64.3; skew-y: -64.3; }
        frame 47 { x: 13.5; y: 104.8; skew-x: -59.1; skew-y: -59.1; scale-x: 0.792; scale-y: 0.792; }
        frame 48 { x: 12.2; y: 102.8; skew-x: -53.8; skew-y: -53.8; scale-x: 0.793; scale-y: 0.793; }
        frame 49 { x: 10.9; y: 98.7; skew-x: -41.5; skew-y: -41.5; scale-x: 0.792; scale-y: 0.792; }
        frame 50 { x: 10.3; y: 94.7; skew-x: -29.2; skew-y: -29.2; scale-x: 0.795; scale-y: 0.795; }
        frame 51 { x: 8.3; y: 90.3; skew-x: -20; skew-y: -20; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 6.7; y: 86.1; skew-x: -10.9; skew-y: -10.9; scale-x: 0.796; scale-y: 0.796; }
        frame 53 { x: 5.1; y: 82; skew-x: -1.9; skew-y: -1.9; scale-x: 0.797; scale-y: 0.797; }
        frame 54 { x: 3.8; y: 78; skew-x: 7; skew-y: 7; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { x: 13; y: 82.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: -10000; y: 81.6; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 13.1; y: 80.8; skew-x: -1.9; skew-y: -1.9; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: -10000; y: 80; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 59 { y: 79.2; skew-x: -4.1; skew-y: -4.1; }
        frame 60 { x: 13.3; y: 79.6; skew-x: -7.5; skew-y: -7.5; scale-x: 0.798; scale-y: 0.798; }
        frame 61 { x: 13.6; y: 80.1; skew-x: -11; skew-y: -11; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 13.8; y: 80.5; skew-x: -14.4; skew-y: -14.4; }
        frame 63 { x: 14.1; y: 81; skew-x: -18; skew-y: -18; }
        frame 64 { x: 16.8; y: 84.8; skew-x: -28.8; skew-y: -28.8; scale-x: 0.797; scale-y: 0.797; }
        frame 65 { x: 20; y: 88.7; skew-x: -39.8; skew-y: -39.8; scale-x: 0.796; scale-y: 0.796; }
        frame 66 { x: 23.5; y: 92.7; skew-x: -50.7; skew-y: -50.7; scale-x: 0.797; scale-y: 0.797; }
        frame 67 { x: 21.3; y: 90.4; skew-x: -43; skew-y: -43; scale-x: 0.796; scale-y: 0.796; }
        frame 68 { x: 19.2; y: 88; skew-x: -35.2; skew-y: -35.2; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 17.4; y: 85.7; skew-x: -27.4; skew-y: -27.4; scale-x: 0.797; scale-y: 0.797; }
        frame 70 { x: 15.8; y: 83.5; skew-x: -19.7; skew-y: -19.7; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 14.3; y: 81.3; skew-x: -11.9; skew-y: -11.9; scale-x: 0.798; scale-y: 0.798; }
        frame 72 { x: 13.1; y: 79.2; skew-x: -4.1; skew-y: -4.1; scale-x: 0.799; scale-y: 0.799; }
        frame 73 { x: 13.3; y: 79.5; skew-x: -6.4; skew-y: -6.4; scale-x: 0.798; scale-y: 0.798; }
        frame 74 { x: 13.4; y: 79.8; skew-x: -8.7; skew-y: -8.7; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 13.6; y: 80.1; skew-x: -11; skew-y: -11; }
        frame 76 { x: 13.7; y: 80.3; skew-x: -13.2; skew-y: -13.2; }
        frame 77 { x: 13.9; y: 80.8; skew-x: -15.7; skew-y: -15.7; }
        frame 78 { x: 14.1; y: 81; skew-x: -18; skew-y: -18; }
        frame 79 { x: 18; y: 84.8; skew-x: -28.8; skew-y: -28.8; scale-x: 0.797; scale-y: 0.797; }
        frame 80 { x: 22.2; y: 88.7; skew-x: -39.8; skew-y: -39.8; scale-x: 0.796; scale-y: 0.796; }
        frame 81 { x: 26.9; y: 92.7; skew-x: -50.7; skew-y: -50.7; scale-x: 0.797; scale-y: 0.797; }
        frame 82 { x: 24; y: 90.9; skew-x: -42.3; skew-y: -42.3; scale-x: 0.796; scale-y: 0.796; }
        frame 83 { x: 21.4; y: 89; skew-x: -33.7; skew-y: -33.7; scale-x: 0.797; scale-y: 0.797; }
        frame 84 { x: 18.9; y: 87.2; skew-x: -25.2; skew-y: -25.2; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 16.7; y: 85.4; skew-x: -16.7; skew-y: -16.7; scale-x: 0.798; scale-y: 0.798; }
        frame 86 { x: 14.8; y: 83.9; skew-x: -8.2; skew-y: -8.2; scale-x: 0.799; scale-y: 0.799; }
        frame 87 { x: 13; y: 82.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 13.7; y: 81.6; skew-x: 3.3; skew-y: 3.3; }
        frame 90 { x: 14.7; y: 80.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 91 { x: 15.5; y: 80.1; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 16.4; y: 79.2; skew-x: 13.3; skew-y: 13.3; }
        frame 93 { x: 7.6; y: 66.5; skew-x: 28.8; skew-y: 28.8; scale-x: 0.798; scale-y: 0.798; }
        frame 94 { x: -0.6; y: 54.6; skew-x: 44.4; skew-y: 44.4; scale-x: 0.797; scale-y: 0.797; }
        frame 95 { x: -9; y: 43.8; skew-x: 59.9; skew-y: 59.9; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: -17.5; y: 33.6; skew-x: 75.5; skew-y: 75.5; }
        frame 97 { x: -2; y: 32.6; skew-x: 104.1; skew-y: 104.1; scale-x: 0.795; scale-y: 0.795; }
        frame 98 { x: 10.7; y: 33.3; skew-x: 133.1; skew-y: 133.1; scale-x: 0.792; scale-y: 0.792; }
        frame 99 { x: 20.5; y: 33.9; skew-x: 161.8; skew-y: 161.8; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 18.3; y: 34.8; skew-x: 158; skew-y: 156.2; scale-x: 0.807; scale-y: 0.79; }
        frame 101 { x: 15.9; y: 35.7; skew-x: 154.2; skew-y: 150.7; scale-x: 0.825; scale-y: -10000; }
        frame 102 { x: -10000; y: 33.5; skew-x: 156.2; skew-y: 154.5; scale-x: 0.807; }
        frame 103 { x: 15.7; y: 31.2; skew-x: 158.2; skew-y: 158.2; scale-x: 0.792; scale-y: 0.792; }
        frame 104 { x: -0.9; y: 36.9; skew-x: 127.4; skew-y: 127.4; scale-x: 0.788; scale-y: 0.788; }
        frame 105 { x: -17.1; y: 43.4; skew-x: 81.7; skew-y: 81.7; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: -39; y: 73.1; skew-x: 31.4; skew-y: 31.4; scale-x: 0.786; scale-y: 0.786; }
        frame 107 { x: -36.3; y: 114.7; skew-x: -36.5; skew-y: -36.5; scale-x: 0.785; scale-y: 0.785; }
        frame 108 { x: -36.4; y: 115.6; skew-x: -33.5; skew-y: -34.7; scale-x: 0.787; scale-y: 0.779; }
        frame 109 { x: -10000; y: 116.3; skew-x: -30.6; skew-y: -32.9; scale-x: 0.792; scale-y: 0.776; }
        frame 110 { y: 115.8; skew-x: -32.5; skew-y: -34; scale-x: 0.788; scale-y: 0.778; }
        frame 111 { y: 115.3; skew-x: -34.5; skew-y: -35.2; scale-x: 0.786; scale-y: 0.78; }
        frame 112 { x: -36.3; y: 114.7; skew-x: -36.5; skew-y: -36.5; scale-x: 0.785; scale-y: 0.785; }
        frame 113 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.783; scale-y: 0.783; }
        frame 114 { scale-x: -10000; scale-y: -10000; }
        frame 115 { scale-x: 0.785; scale-y: 0.785; }
        frame 116 { x: -34.9; y: 115.2; skew-x: -30.2; skew-y: -30.2; scale-x: 0.783; scale-y: 0.783; }
        frame 117 { x: -33.3; y: 115.8; skew-x: -23.9; skew-y: -23.9; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: -31.7; y: 116.5; skew-x: -17.7; skew-y: -17.7; scale-x: 0.784; scale-y: 0.784; }
        frame 119 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.783; scale-y: 0.783; }
        frame 120 { scale-x: -10000; scale-y: -10000; }
        frame 121 { scale-x: 0.784; scale-y: 0.784; }
        frame 122 { x: -32.6; y: 117.1; skew-x: -16.9; skew-y: -18.4; scale-x: 0.795; scale-y: 0.765; }
        frame 123 { x: -33.7; y: 117.5; skew-x: -16.2; skew-y: -19.3; scale-x: 0.807; scale-y: 0.748; }
        frame 124 { x: -32.7; y: 117; skew-x: -16.9; skew-y: -18.4; scale-x: 0.795; scale-y: 0.765; }
        frame 125 { x: -31.7; y: 116.5; skew-x: -17.7; skew-y: -17.7; scale-x: 0.784; scale-y: 0.784; }
        frame 126 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.783; scale-y: 0.783; }
        frame 127 { scale-x: 0.784; scale-y: 0.784; }
        frame 128 { scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 129 { cel: -10000; }
        frame 146 { x: 26.9; y: 55.1; skew-x: 51.4; skew-y: 51.4; scale-x: 0.798; scale-y: 0.798; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 26.4; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 23.5; y: 59.9; skew-x: 41.1; skew-y: 41.1; scale-x: 0.797; scale-y: 0.797; }
        frame 167 { x: 20.7; y: 65; skew-x: 30.8; skew-y: 30.8; scale-x: 0.798; scale-y: 0.798; }
        frame 168 { x: 17.9; y: 70.4; skew-x: 20.5; skew-y: 20.5; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 15.3; y: 76.1; skew-x: 10.3; skew-y: 10.3; scale-x: 0.799; scale-y: 0.799; }
        frame 170 { x: 13; y: 82.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 171 { x: 12.8; y: 83.2; skew-x: -10000; skew-y: -10000; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { x: 12.6; y: 84; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: 12.4; y: 84.8; scale-x: 0.829; scale-y: 0.785; }
        frame 174 { x: 12.6; y: 84.2; scale-x: 0.822; scale-y: 0.789; }
        frame 175 { x: 12.8; y: 83.6; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: 12.9; y: 82.9; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: 13; y: 82.4; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 12.3; y: 81.6; skew-x: 1.3; skew-y: 1.3; }
        frame 181 { x: 11.6; y: 80.8; skew-x: 2.8; skew-y: 2.8; }
        frame 182 { x: 10.8; y: 80.1; skew-x: 4.3; skew-y: 4.3; }
        frame 183 { x: 10.2; y: 79.3; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 184 { x: 9.5; y: 78.4; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 185 { x: 10.2; y: 78.8; skew-x: 6.8; skew-y: 6.8; scale-x: 0.799; scale-y: 0.799; }
        frame 186 { x: 10.9; y: 79.3; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 11.5; y: 80.3; skew-x: 3.8; skew-y: 3.8; }
        frame 188 { x: 12; y: 81.3; skew-x: 1.5; skew-y: 1.5; }
        frame 189 { x: 12.7; y: 82.3; skew-x: -0.7; skew-y: -0.7; }
        frame 190 { x: 13.3; y: 83.3; skew-x: -3.2; skew-y: -3.2; }
        frame 191 { x: 15; y: 83.8; skew-x: -5.4; skew-y: -5.4; }
        frame 192 { x: 16.6; y: 84.5; skew-x: -7.9; skew-y: -7.9; }
        frame 193 { x: 18.3; y: 85; skew-x: -10.2; skew-y: -10.2; }
        frame 194 { x: 19.9; y: 85.6; skew-x: -12.7; skew-y: -12.7; }
        frame 195 { x: 19; y: 85.2; skew-x: -14.2; skew-y: -14.2; }
        frame 196 { x: 18; y: 84.8; skew-x: -15.8; skew-y: -15.8; }
        frame 197 { x: 16.2; y: 83.9; skew-x: -10.4; skew-y: -10.4; }
        frame 198 { x: 14.5; y: 83.1; skew-x: -5.2; skew-y: -5.2; }
        frame 199 { x: 13; y: 82.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_digger_innerarm_upper";
        frame-count: 200;
        frame 0 { x: 16.9; y: 53.9; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_INNERARM_UPPER; }
        frame 1 { x: 16.7; y: 54.4; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 16.5; y: 55; skew-x: -0.9; skew-y: -0.9; }
        frame 3 { x: 16.3; y: 55.5; skew-x: -1.4; skew-y: -1.4; }
        frame 4 { x: 16; y: 56; skew-x: -2; skew-y: -2; }
        frame 5 { x: 15.8; y: 56.6; skew-x: -2.7; skew-y: -2.7; }
        frame 6 { x: 15.6; y: 57.1; skew-x: -3.2; skew-y: -3.2; }
        frame 7 { x: 15.3; y: 57.6; skew-x: -3.7; skew-y: -3.7; }
        frame 8 { x: 15.2; y: 58.1; skew-x: -4.2; skew-y: -4.2; }
        frame 9 { x: 14.9; y: 58.8; skew-x: -4.9; skew-y: -4.9; }
        frame 10 { x: 15.1; y: 58.1; skew-x: -4.2; skew-y: -4.2; }
        frame 11 { x: 15.4; y: 57.6; skew-x: -3.7; skew-y: -3.7; }
        frame 12 { x: 15.7; y: 56.9; skew-x: -2.9; skew-y: -2.9; }
        frame 13 { x: 15.9; y: 56.4; skew-x: -2.4; skew-y: -2.4; }
        frame 14 { x: 16.2; y: 55.7; skew-x: -1.7; skew-y: -1.7; }
        frame 15 { x: 16.4; y: 55.1; skew-x: -1.2; skew-y: -1.2; }
        frame 16 { x: 16.6; y: 54.5; skew-x: -0.4; skew-y: -0.4; }
        frame 17 { x: 16.9; y: 53.9; skew-x: 0; skew-y: 0; }
        frame 18 { x: 21.9; y: 49.8; skew-x: 20.8; skew-y: 20.8; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: 22.4; y: 48.8; skew-x: 21.1; skew-y: 21.1; scale-x: 0.798; scale-y: 0.798; }
        frame 20 { x: 22.9; y: 47.8; skew-x: 21.6; skew-y: 21.6; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 23.3; y: 46.8; skew-x: 22.1; skew-y: 22.1; }
        frame 22 { x: 23.9; y: 45.7; skew-x: 22.5; skew-y: 22.5; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 20.9; y: 48.8; skew-x: 21.6; skew-y: 21.6; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 17.9; y: 51.8; skew-x: 20.8; skew-y: 20.8; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 15; y: 54.7; skew-x: 19.8; skew-y: 19.8; scale-x: 0.797; scale-y: 0.797; }
        frame 26 { x: 12; y: 57.8; skew-x: 19.1; skew-y: 19.1; scale-x: 0.798; scale-y: 0.798; }
        frame 27 { x: 13.2; y: 56.5; skew-x: 18.1; skew-y: 18.1; scale-x: 0.797; scale-y: 0.797; }
        frame 28 { x: 14.3; y: 55.3; skew-x: 17.1; skew-y: 17.1; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 15.5; y: 53.9; skew-x: 16.3; skew-y: 16.3; }
        frame 30 { x: 16.6; y: 52.5; skew-x: 15.3; skew-y: 15.3; }
        frame 31 { x: 17.9; y: 50.8; skew-x: 15; skew-y: 15; scale-x: 0.796; scale-y: 0.796; }
        frame 32 { x: 19.2; y: 49.1; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 20.3; y: 47.4; skew-x: 14.6; skew-y: 14.6; }
        frame 34 { x: 21.6; y: 45.8; skew-x: 14.4; skew-y: 14.4; scale-x: 0.797; scale-y: 0.797; }
        frame 35 { x: 22.2; y: 45.4; skew-x: 13.3; skew-y: 13.3; scale-x: 0.796; scale-y: 0.796; }
        frame 36 { x: 22.6; y: 45; skew-x: 12.1; skew-y: 12.1; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 23.2; y: 44.5; skew-x: 11; skew-y: 11; scale-x: 0.795; scale-y: 0.795; }
        frame 38 { x: 23.7; y: 44.1; skew-x: 10; skew-y: 10; scale-x: 0.796; scale-y: 0.796; }
        frame 39 { x: 24.1; y: 43.5; skew-x: 8; skew-y: 8; scale-x: 0.795; scale-y: 0.795; }
        frame 40 { x: 24.4; y: 42.9; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 24.8; y: 42.4; skew-x: 4.3; skew-y: 4.3; }
        frame 42 { x: 25.1; y: 41.7; skew-x: 2.4; skew-y: 2.4; }
        frame 43 { x: 21.8; y: 46.8; skew-x: 0; skew-y: 0; }
        frame 44 { x: 18.7; y: 52.1; skew-x: -2.5; skew-y: -2.5; scale-x: 0.794; scale-y: 0.794; }
        frame 45 { x: 15.5; y: 57.3; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 12.3; y: 62.4; skew-x: -7.7; skew-y: -7.7; }
        frame 47 { x: 13.4; y: 60.6; skew-x: -4.2; skew-y: -4.2; }
        frame 48 { x: 14.4; y: 59; skew-x: -0.7; skew-y: -0.7; scale-x: 0.795; scale-y: 0.795; }
        frame 49 { x: 15.5; y: 57.4; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 16.7; y: 55.8; skew-x: 6.3; skew-y: 6.3; scale-x: 0.796; scale-y: 0.796; }
        frame 51 { x: 17.9; y: 54.3; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 19.2; y: 52.8; skew-x: 13.5; skew-y: 13.5; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 20.4; y: 51.4; skew-x: 17.1; skew-y: 17.1; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: 21.9; y: 49.8; skew-x: 20.8; skew-y: 20.8; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 16.9; y: 53.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: 18.1; y: 52.8; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 19.3; y: 51.7; skew-x: 3.3; skew-y: 3.3; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 20.5; y: 50.8; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 21.7; y: 49.6; skew-x: 6.8; skew-y: 6.8; }
        frame 60 { x: 22.1; y: 49.5; skew-x: 6.1; skew-y: 6.1; }
        frame 61 { x: 22.5; y: 49.1; skew-x: 5.5; skew-y: 5.5; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: 22.8; y: 48.9; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 23.2; y: 48.5; skew-x: 4.5; skew-y: 4.5; }
        frame 64 { x: 19.5; y: 52.6; skew-x: -6.2; skew-y: -6.2; }
        frame 65 { x: 16.4; y: 57.1; skew-x: -17.2; skew-y: -17.2; scale-x: 0.797; scale-y: 0.797; }
        frame 66 { x: 13.6; y: 61.7; skew-x: -28.1; skew-y: -28.1; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 14.6; y: 59.6; skew-x: -22.2; skew-y: -22.2; scale-x: 0.796; scale-y: 0.796; }
        frame 68 { x: 15.7; y: 57.4; skew-x: -16.4; skew-y: -16.4; scale-x: 0.797; scale-y: 0.797; }
        frame 69 { x: 16.9; y: 55.3; skew-x: -10.5; skew-y: -10.5; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 18.4; y: 53.2; skew-x: -4.7; skew-y: -4.7; scale-x: 0.798; scale-y: 0.798; }
        frame 71 { x: 19.9; y: 51.3; skew-x: 0.8; skew-y: 0.8; scale-x: 0.799; scale-y: 0.799; }
        frame 72 { x: 21.7; y: 49.6; skew-x: 6.8; skew-y: 6.8; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 22; y: -10000; skew-x: 6.3; skew-y: 6.3; }
        frame 74 { x: 22.2; y: 49.3; skew-x: 5.8; skew-y: 5.8; scale-x: 0.798; scale-y: 0.798; }
        frame 75 { x: 22.5; y: 49.1; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 22.6; y: 49; skew-x: 5.1; skew-y: 5.1; }
        frame 77 { x: 23; y: 48.8; skew-x: 4.8; skew-y: 4.8; }
        frame 78 { x: 23.2; y: 48.5; skew-x: 4.5; skew-y: 4.5; }
        frame 79 { x: 20.4; y: 52.6; skew-x: -6.2; skew-y: -6.2; }
        frame 80 { x: 18.1; y: 57.1; skew-x: -17.2; skew-y: -17.2; scale-x: 0.797; scale-y: 0.797; }
        frame 81 { x: 16.2; y: 61.7; skew-x: -28.1; skew-y: -28.1; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 16.1; y: 60.2; skew-x: -23.2; skew-y: -23.2; scale-x: 0.796; scale-y: 0.796; }
        frame 83 { x: 16; y: 58.9; skew-x: -18.7; skew-y: -18.7; scale-x: 0.797; scale-y: 0.797; }
        frame 84 { x: 16.1; y: 57.5; skew-x: -13.9; skew-y: -13.9; scale-x: 0.798; scale-y: 0.798; }
        frame 85 { x: 16.2; y: 56.1; skew-x: -9.2; skew-y: -9.2; scale-x: 0.799; scale-y: 0.799; }
        frame 86 { x: 16.5; y: 54.9; skew-x: -4.5; skew-y: -4.5; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 16.9; y: 53.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 19.3; y: 53.5; skew-x: 3.3; skew-y: 3.3; }
        frame 90 { x: 21.7; y: 53.1; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 91 { x: 24.3; y: 52.8; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 26.8; y: 52.5; skew-x: 13.3; skew-y: 13.3; }
        frame 93 { x: 23.7; y: 47.8; skew-x: 30.9; skew-y: 30.9; scale-x: 0.798; scale-y: 0.798; }
        frame 94 { x: 21.1; y: 44.6; skew-x: 48.6; skew-y: 48.6; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 18.7; y: 42.8; skew-x: 66.4; skew-y: 66.4; }
        frame 96 { x: 15.9; y: 42.4; skew-x: 84; skew-y: 84; scale-x: 0.799; scale-y: 0.799; }
        frame 97 { x: 21.6; y: 46.7; skew-x: 99; skew-y: 99; scale-x: 0.797; scale-y: 0.827; }
        frame 98 { x: 26.5; y: 52; skew-x: 114.1; skew-y: 114.1; scale-x: 0.795; scale-y: 0.856; }
        frame 99 { x: 30.3; y: 57.9; skew-x: 129.3; skew-y: 129.3; scale-x: -10000; scale-y: 0.886; }
        frame 100 { x: -10000; y: 57.6; skew-x: 125.6; skew-y: 123.8; scale-x: 0.794; scale-y: 0.902; }
        frame 101 { x: 30.2; y: 57.4; skew-x: 121.9; skew-y: 118.2; scale-x: 0.796; scale-y: 0.921; }
        frame 102 { x: 28.7; y: 56; skew-x: 123.8; skew-y: 122.1; scale-x: 0.794; scale-y: 0.902; }
        frame 103 { x: 27; y: 54.6; skew-x: 125.8; skew-y: 125.8; scale-x: 0.795; scale-y: 0.886; }
        frame 104 { x: 22.3; y: 54.5; skew-x: 109.8; skew-y: 109.8; scale-x: 0.793; scale-y: 0.884; }
        frame 105 { x: 16.1; y: 55; skew-x: 93.8; skew-y: 93.8; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 1.9; y: 59; skew-x: 62.2; skew-y: 62.1; scale-x: 0.792; scale-y: 0.883; }
        frame 107 { x: -8.9; y: 74.1; skew-x: 35.5; skew-y: 35.5; scale-x: -10000; scale-y: 0.882; }
        frame 108 { x: -11.4; y: 76.4; skew-x: 27.6; skew-y: 28.6; scale-x: 0.797; scale-y: 0.886; }
        frame 109 { x: -13.7; y: 78.7; skew-x: 20; skew-y: 21.7; scale-x: 0.805; scale-y: 0.892; }
        frame 110 { x: -12.1; y: 77.2; skew-x: 25.1; skew-y: 26.3; scale-x: 0.799; scale-y: 0.888; }
        frame 111 { x: -10.6; y: 75.5; skew-x: 30.3; skew-y: 30.8; scale-x: 0.795; scale-y: 0.884; }
        frame 112 { x: -8.9; y: 74.1; skew-x: 35.5; skew-y: 35.5; scale-x: 0.792; scale-y: 0.882; }
        frame 113 { x: -9.5; y: -10000; skew-x: 34.3; skew-y: 34.3; scale-x: 0.79; scale-y: 0.881; }
        frame 114 { x: -10.1; y: 74; skew-x: 33.1; skew-y: 33.1; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: -10.5; y: 73.8; skew-x: 31.9; skew-y: 31.9; scale-x: 0.792; scale-y: 0.882; }
        frame 116 { x: -15.5; y: 78.3; skew-x: 13.5; skew-y: 13.5; scale-x: 0.79; scale-y: 0.916; }
        frame 117 { x: -19.5; y: 84.1; skew-x: -4.4; skew-y: -4.4; scale-x: -10000; scale-y: 0.95; }
        frame 118 { x: -22.8; y: 91; skew-x: -22.8; skew-y: -22.8; scale-x: 0.789; scale-y: 0.985; }
        frame 119 { x: -23; y: 104.9; skew-x: -46.5; skew-y: -46.5; scale-x: 0.787; scale-y: 0.982; }
        frame 120 { x: -20.3; y: 118.4; skew-x: -70.1; skew-y: -70.1; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: -15.2; y: 130.7; skew-x: -93.7; skew-y: -93.7; scale-y: 0.981; }
        frame 122 { x: -16; y: 130.9; skew-x: -10000; skew-y: -93.4; scale-x: 0.765; scale-y: 1; }
        frame 123 { x: -16.6; y: 131; skew-x: -94.1; skew-y: -10000; scale-x: 0.744; scale-y: 1.018; }
        frame 124 { x: -16; y: 130.8; skew-x: -93.7; scale-x: 0.765; scale-y: 1; }
        frame 125 { x: -15.2; y: 130.7; skew-x: -10000; skew-y: -93.7; scale-x: 0.787; scale-y: 0.981; }
        frame 126 { x: -15.3; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 127 { x: -15.2; }
        frame 128 { x: -10000; cel: -1; }
        frame 129 { cel: -10000; }
        frame 146 { x: 26.4; y: 33.6; skew-x: 5.8; skew-y: 5.8; scale-x: 0.8; scale-y: 0.8; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 25.9; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 24.1; y: 37.8; skew-x: 4.5; skew-y: 4.5; }
        frame 167 { x: 22.3; y: 41.7; skew-x: 3.3; skew-y: 3.3; }
        frame 168 { x: 20.5; y: 45.7; skew-x: 2.3; skew-y: 2.3; }
        frame 169 { x: 18.7; y: 49.7; skew-x: 1; skew-y: 1; }
        frame 170 { x: 16.9; y: 53.9; skew-x: 0; skew-y: 0; }
        frame 171 { x: 16.5; y: 55.1; skew-x: -0.4; skew-y: -0.5; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { x: 16.1; y: 56.1; skew-x: -1.2; skew-y: -1.2; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: 15.7; y: 57.5; skew-x: -1.8; skew-y: -2.1; scale-x: 0.829; scale-y: 0.785; }
        frame 174 { x: 15.9; y: 56.5; skew-x: -1.2; skew-y: -1.4; scale-x: 0.821; scale-y: 0.789; }
        frame 175 { x: 16.3; y: 55.6; skew-x: -0.7; skew-y: -0.9; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: 16.6; y: 54.7; skew-x: -0.2; skew-y: -0.4; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: 16.9; y: 53.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 18.3; y: 53.1; skew-x: 3.1; skew-y: 3.1; }
        frame 181 { x: 19.7; y: 52.3; skew-x: 6.3; skew-y: 6.3; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: 21; y: 51.6; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 22.5; y: 50.9; skew-x: 12.8; skew-y: 12.8; }
        frame 184 { x: 24; y: 50.4; skew-x: 16.1; skew-y: 16.1; }
        frame 185 { x: 23.2; y: 51.2; skew-x: 14; skew-y: 14; scale-x: 0.798; scale-y: 0.798; }
        frame 186 { x: 22.4; y: 52; skew-x: 12.1; skew-y: 12.1; scale-x: 0.799; scale-y: 0.799; }
        frame 187 { x: 20.7; y: 52.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.798; scale-y: 0.798; }
        frame 188 { x: 19.2; y: 53.2; skew-x: 4.3; skew-y: 4.3; scale-x: 0.799; scale-y: 0.799; }
        frame 189 { x: 17.6; y: 54; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 190 { x: 16.2; y: 54.7; skew-x: -2.9; skew-y: -2.9; }
        frame 191 { x: 14.8; y: 55.5; skew-x: -6.7; skew-y: -6.7; }
        frame 192 { x: 13.4; y: 56.3; skew-x: -10.5; skew-y: -10.5; }
        frame 193 { x: 12.2; y: 57.2; skew-x: -14.4; skew-y: -14.4; scale-x: 0.798; scale-y: 0.798; }
        frame 194 { x: 10.9; y: 58.1; skew-x: -18.2; skew-y: -18.2; scale-x: 0.799; scale-y: 0.799; }
        frame 195 { x: 11.5; y: 57.3; skew-x: -16.7; skew-y: -16.7; scale-x: 0.798; scale-y: 0.798; }
        frame 196 { x: 11.9; y: 56.6; skew-x: -15.5; skew-y: -15.5; scale-x: 0.799; scale-y: 0.799; }
        frame 197 { x: 13.5; y: 55.5; skew-x: -10.2; skew-y: -10.2; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 15.1; y: 54.6; skew-x: -5; skew-y: -5; }
        frame 199 { x: 16.9; y: 53.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_digger_innerleg_foot";
        frame-count: 200;
        frame 0 { x: 20.4; y: 108; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_INNERLEG_FOOT; }
        frame 1 { x: -10000; y: 107.8; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 20.5; y: 107.6; skew-x: 0.8; skew-y: 0.8; }
        frame 3 { x: 20.6; y: 107.4; skew-x: 1.3; skew-y: 1.3; }
        frame 4 { x: 20.7; y: 107.2; skew-x: 1.8; skew-y: 1.8; }
        frame 5 { x: 20.8; y: 106.9; skew-x: 2.3; skew-y: 2.3; }
        frame 6 { x: -10000; y: 106.8; skew-x: 2.6; skew-y: 2.6; }
        frame 7 { x: 20.9; y: 106.5; skew-x: 3; skew-y: 3; }
        frame 8 { x: 21.1; y: 106.3; skew-x: 3.5; skew-y: 3.5; }
        frame 9 { x: -10000; y: 106.1; skew-x: 4.1; skew-y: 4.1; }
        frame 10 { y: 106.3; skew-x: 3.5; skew-y: 3.5; }
        frame 11 { x: 21; y: 106.5; skew-x: 3; skew-y: 3; }
        frame 12 { x: 20.8; y: 106.8; skew-x: 2.5; skew-y: 2.5; }
        frame 13 { x: -10000; y: 107.1; skew-x: 2; skew-y: 2; }
        frame 14 { x: 20.6; y: 107.2; skew-x: 1.5; skew-y: 1.5; }
        frame 15 { x: 20.5; y: 107.4; skew-x: 1; skew-y: 1; }
        frame 16 { x: 20.4; y: 107.7; skew-x: 0.5; skew-y: 0.5; }
        frame 17 { x: -10000; y: 108; skew-x: 0; skew-y: 0; }
        frame 18 { x: 31.9; y: 108.9; skew-x: -9; skew-y: -9; }
        frame 19 { x: 33.9; y: -10000; skew-x: -8.9; skew-y: -8.9; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { x: 35.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 37.9; }
        frame 22 { x: 39.9; skew-x: -9; skew-y: -9; scale-x: 0.8; scale-y: 0.8; }
        frame 23 { x: 41.6; y: 109.9; skew-x: -13.9; skew-y: -13.9; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { x: 43.5; y: 110.8; skew-x: -18.9; skew-y: -18.9; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: 45.5; y: 111.7; skew-x: -24; skew-y: -24; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 47.5; y: 112.8; skew-x: -29; skew-y: -29; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: 46.5; y: 113; skew-x: -31.2; skew-y: -31.2; scale-x: 0.797; scale-y: 0.797; }
        frame 28 { x: 45.4; y: 113.1; skew-x: -33.5; skew-y: -33.5; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 44.4; y: 113.3; skew-x: -35.7; skew-y: -35.7; }
        frame 30 { x: 43.4; y: 113.6; skew-x: -38; skew-y: -38; scale-x: 0.798; scale-y: 0.798; }
        frame 31 { x: 40.6; y: 114.2; skew-x: -39.8; skew-y: -39.8; scale-x: 0.797; scale-y: 0.797; }
        frame 32 { x: 37.8; y: 114.8; skew-x: -41.7; skew-y: -41.7; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 35; y: 115.3; skew-x: -43.5; skew-y: -43.5; }
        frame 34 { x: 32.1; y: 116; skew-x: -45.3; skew-y: -45.3; scale-x: 0.798; scale-y: 0.798; }
        frame 35 { x: 29.3; y: 114.6; skew-x: -39.5; skew-y: -39.5; scale-x: 0.796; scale-y: 0.796; }
        frame 36 { x: 26.5; y: 113.2; skew-x: -34; skew-y: -34; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 24; y: 111.7; skew-x: -28.2; skew-y: -28.2; }
        frame 38 { x: 21.6; y: 110.3; skew-x: -22.5; skew-y: -22.5; scale-x: 0.797; scale-y: 0.797; }
        frame 39 { x: 20; y: 109.5; skew-x: -19.5; skew-y: -19.5; scale-x: 0.796; scale-y: 0.796; }
        frame 40 { x: 18.5; y: 108.9; skew-x: -16.7; skew-y: -16.7; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 17; y: 108; skew-x: -13.7; skew-y: -13.7; }
        frame 42 { x: 15.7; y: 107.4; skew-x: -10.9; skew-y: -10.9; }
        frame 43 { x: 16.6; y: 107.5; skew-x: -9.7; skew-y: -9.7; scale-x: 0.795; scale-y: 0.795; }
        frame 44 { x: 17.4; y: 107.6; skew-x: -8.4; skew-y: -8.4; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 18.3; y: 107.7; skew-x: -7; skew-y: -7; }
        frame 46 { x: 19.2; y: 107.9; skew-x: -5.9; skew-y: -5.9; scale-x: 0.796; scale-y: 0.796; }
        frame 47 { x: 20.7; y: 108; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 22.3; skew-x: -6.5; skew-y: -6.5; }
        frame 49 { x: 23.9; y: 108.2; skew-x: -6.9; skew-y: -6.9; scale-x: 0.797; scale-y: 0.797; }
        frame 50 { x: 25.5; y: 108.4; skew-x: -7.4; skew-y: -7.4; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 27.1; y: -10000; skew-x: -7.7; skew-y: -7.7; scale-x: 0.798; scale-y: 0.798; }
        frame 52 { x: 28.8; y: 108.7; skew-x: -8.2; skew-y: -8.2; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 30.3; y: -10000; skew-x: -8.4; skew-y: -8.4; scale-x: 0.799; scale-y: 0.799; }
        frame 54 { x: 31.9; y: 108.9; skew-x: -9; skew-y: -9; scale-x: 0.8; scale-y: 0.8; }
        frame 55 { x: 20.4; y: 108; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 20.6; y: 107.5; skew-x: 1.3; skew-y: 1.3; }
        frame 57 { x: 20.8; y: 107; skew-x: 2.5; skew-y: 2.5; }
        frame 58 { x: 21.1; y: 106.5; skew-x: 3.8; skew-y: 3.8; }
        frame 59 { x: 21.4; y: 106; skew-x: 5.1; skew-y: 5.1; }
        frame 60 { x: 21.6; y: 105.8; skew-x: 6.1; skew-y: 6.1; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: 21.9; y: 105.4; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 22.1; y: 105.2; skew-x: 8.3; skew-y: 8.3; }
        frame 63 { x: 22.4; y: 104.9; skew-x: 9.6; skew-y: 9.6; scale-x: 0.8; scale-y: 0.8; }
        frame 64 { x: 23.1; y: 103.9; skew-x: 12.5; skew-y: 12.5; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: 23.9; y: 102.7; skew-x: 15.5; skew-y: 15.5; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 24.8; y: 101.7; skew-x: 18.6; skew-y: 18.6; }
        frame 67 { x: 24.1; y: 102.4; skew-x: 16.3; skew-y: 16.3; }
        frame 68 { x: 23.6; y: 103.1; skew-x: 14; skew-y: 14; }
        frame 69 { x: 23; y: 103.8; skew-x: 11.8; skew-y: 11.8; }
        frame 70 { x: 22.5; y: 104.5; skew-x: 9.5; skew-y: 9.5; }
        frame 71 { x: 21.9; y: 105.3; skew-x: 7.3; skew-y: 7.3; }
        frame 72 { x: 21.4; y: 106; skew-x: 5.1; skew-y: 5.1; scale-x: 0.8; scale-y: 0.8; }
        frame 73 { x: 21.5; y: 105.8; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 74 { x: 21.7; y: 105.7; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 21.9; y: 105.4; skew-x: 7.3; skew-y: 7.3; }
        frame 76 { x: 22; y: 105.3; skew-x: 8; skew-y: 8; }
        frame 77 { x: 22.2; y: 105.1; skew-x: 8.8; skew-y: 8.8; }
        frame 78 { x: 22.4; y: 104.9; skew-x: 9.6; skew-y: 9.6; scale-x: 0.8; scale-y: 0.8; }
        frame 79 { x: 22.9; y: 104.1; skew-x: 11.8; skew-y: 11.8; scale-x: 0.799; scale-y: 0.799; }
        frame 80 { x: 23.6; y: 103.3; skew-x: 14.3; skew-y: 14.3; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 24.3; y: 102.3; skew-x: 16.6; skew-y: 16.6; }
        frame 82 { x: 23.5; y: 103.3; skew-x: 13.8; skew-y: 13.8; }
        frame 83 { x: 22.9; y: 104.2; skew-x: 11; skew-y: 11; }
        frame 84 { x: 22.3; y: 105.1; skew-x: 8.3; skew-y: 8.3; }
        frame 85 { x: 21.6; y: 106; skew-x: 5.5; skew-y: 5.5; }
        frame 86 { x: 21; y: 107.1; skew-x: 2.8; skew-y: 2.8; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: 20.4; y: 108; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 89 { x: 19.9; y: 108.4; skew-x: -2.7; skew-y: -2.7; }
        frame 90 { x: 19.6; y: 108.9; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 91 { x: 19.1; y: 109.4; skew-x: -8.4; skew-y: -8.4; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 18.9; y: 109.9; skew-x: -11.2; skew-y: -11.2; }
        frame 93 { x: 18.6; y: 110.3; skew-x: -13.2; skew-y: -13.2; }
        frame 94 { x: 18.4; y: 110.7; skew-x: -15.2; skew-y: -15.2; }
        frame 95 { x: 18.1; y: 111.1; skew-x: -17.4; skew-y: -17.4; scale-x: 0.798; scale-y: 0.798; }
        frame 96 { x: 18; y: 111.7; skew-x: -19.5; skew-y: -19.5; scale-x: 0.799; scale-y: 0.799; }
        frame 97 { x: 18.6; y: 114; skew-x: -31.5; skew-y: -31.5; scale-x: 0.797; scale-y: 0.797; }
        frame 98 { x: 19.9; y: 116.2; skew-x: -43.5; skew-y: -43.5; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 22; y: 118.5; skew-x: -55.6; skew-y: -55.6; scale-x: 0.798; scale-y: 0.798; }
        frame 100 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 101 { cel: -1; }
        frame 102 { cel: -10000; }
        frame 146 { x: 36.9; y: 89.5; skew-x: 42.6; skew-y: 42.6; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 36.4; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 32.7; y: 92.6; skew-x: 34.1; skew-y: 34.1; scale-x: 0.797; scale-y: 0.797; }
        frame 167 { x: 29.2; y: 95.8; skew-x: 25.5; skew-y: 25.5; scale-x: 0.798; scale-y: 0.798; }
        frame 168 { x: 26; y: 99.6; skew-x: 17; skew-y: 17; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 23; y: 103.7; skew-x: 8.5; skew-y: 8.5; scale-x: 0.799; scale-y: 0.799; }
        frame 170 { x: 20.4; y: 108; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 171 { x: 20.3; y: 108.1; skew-x: -10000; skew-y: -10000; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { x: 20.2; y: 108.3; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: 20.1; y: 108.4; scale-x: 0.829; scale-y: 0.785; }
        frame 174 { x: 20.2; y: 108.3; scale-x: 0.822; scale-y: 0.789; }
        frame 175 { x: -10000; y: 108.2; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: 20.3; y: 108; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: 20.4; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 20.5; y: 107.6; skew-x: 1; skew-y: 1; }
        frame 181 { x: 20.8; y: 107.2; skew-x: 2; skew-y: 2; }
        frame 182 { x: 20.9; y: 106.8; skew-x: 3; skew-y: 3; }
        frame 183 { x: 21.1; y: 106.5; skew-x: 4; skew-y: 4; }
        frame 184 { x: 21.3; y: 106.1; skew-x: 5; skew-y: 5; }
        frame 185 { x: 21.1; y: 106.5; skew-x: 3.5; skew-y: 3.5; }
        frame 186 { x: 20.7; y: 106.9; skew-x: 2; skew-y: 2; }
        frame 187 { x: 20.5; y: 107.2; skew-x: 0.5; skew-y: 0.5; }
        frame 188 { x: 20.2; y: 107.5; skew-x: -0.7; skew-y: -0.7; }
        frame 189 { x: 20; y: 107.9; skew-x: -2.2; skew-y: -2.2; }
        frame 190 { x: 19.7; y: 108.2; skew-x: -3.7; skew-y: -3.7; scale-x: 0.799; scale-y: 0.799; }
        frame 191 { x: 19.5; y: 108.7; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: -10000; }
        frame 192 { x: 19.3; y: 109.1; skew-x: -6.7; skew-y: -6.7; }
        frame 193 { x: 19; y: 109.5; skew-x: -8.2; skew-y: -8.2; }
        frame 194 { x: 18.8; y: 109.9; skew-x: -9.7; skew-y: -9.7; scale-x: 0.8; scale-y: 0.8; }
        frame 195 { x: 19.1; y: 109.5; skew-x: -7.7; skew-y: -7.7; scale-x: 0.799; scale-y: 0.799; }
        frame 196 { x: 19.4; y: 109.1; skew-x: -5.7; skew-y: -5.7; scale-x: -10000; scale-y: -10000; }
        frame 197 { x: 19.7; y: 108.7; skew-x: -3.7; skew-y: -3.7; scale-x: 0.8; scale-y: 0.8; }
        frame 198 { x: 20; y: 108.3; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 199 { x: 20.4; y: 108; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_digger_innerleg_lower";
        frame-count: 200;
        frame 0 { x: 20.3; y: 91.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_INNERLEG_LOWER; }
        frame 1 { x: 20.5; y: 91; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 20.6; y: 90.9; skew-x: 1; skew-y: 1; }
        frame 3 { x: 20.8; y: -10000; skew-x: 1.5; skew-y: 1.5; }
        frame 4 { x: 21; y: 90.7; skew-x: 2; skew-y: 2; }
        frame 5 { x: 21.2; y: -10000; skew-x: 2.5; skew-y: 2.5; }
        frame 6 { x: 21.3; y: 90.6; skew-x: 3; skew-y: 3; }
        frame 7 { x: 21.6; y: 90.5; skew-x: 3.5; skew-y: 3.5; }
        frame 8 { x: 21.8; y: -10000; skew-x: 4; skew-y: 4; }
        frame 9 { x: 21.9; y: 90.4; skew-x: 4.5; skew-y: 4.5; }
        frame 10 { x: 21.7; y: -10000; skew-x: 3.8; skew-y: 3.8; }
        frame 11 { x: 21.6; y: 90.5; skew-x: 3.3; skew-y: 3.3; }
        frame 12 { x: 21.3; y: 90.6; skew-x: 2.8; skew-y: 2.8; }
        frame 13 { x: 21.1; y: 90.7; skew-x: 2.3; skew-y: 2.3; }
        frame 14 { x: 20.8; y: 90.9; skew-x: 1.6; skew-y: 1.6; }
        frame 15 { x: 20.7; y: -10000; skew-x: 1; skew-y: 1; }
        frame 16 { x: 20.5; y: 91; skew-x: 0.5; skew-y: 0.5; }
        frame 17 { x: 20.3; y: 91.1; skew-x: 0; skew-y: 0; }
        frame 18 { x: 28; y: 94.2; skew-x: -13; skew-y: -13; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: 29.2; y: 95.4; skew-x: -17; skew-y: -17; scale-x: 0.798; scale-y: 0.798; }
        frame 20 { x: 30.4; y: 96.6; skew-x: -21.2; skew-y: -21.2; scale-x: 0.797; scale-y: 0.797; }
        frame 21 { x: 31.6; y: 97.8; skew-x: -25.2; skew-y: -25.2; scale-x: 0.796; scale-y: 0.796; }
        frame 22 { x: 33; y: 99; skew-x: -29.3; skew-y: -29.3; scale-x: 0.797; scale-y: 0.797; }
        frame 23 { x: 33.8; y: 99.3; skew-x: -30.5; skew-y: -30.5; scale-x: 0.795; scale-y: 0.795; }
        frame 24 { x: 34.6; y: 99.6; skew-x: -31.8; skew-y: -31.8; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 35.4; y: 100.1; skew-x: -33; skew-y: -33; }
        frame 26 { x: 36.1; y: 100.5; skew-x: -34.4; skew-y: -34.4; scale-x: 0.796; scale-y: 0.796; }
        frame 27 { x: 33.7; y: 100.9; skew-x: -35.5; skew-y: -35.5; scale-x: 0.795; scale-y: 0.795; }
        frame 28 { x: 31.1; y: 101.2; skew-x: -36.5; skew-y: -36.5; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 28.6; y: 101.5; skew-x: -37.5; skew-y: -37.5; }
        frame 30 { x: 26.1; y: 101.9; skew-x: -38.7; skew-y: -38.7; scale-x: 0.796; scale-y: 0.796; }
        frame 31 { x: 25.3; y: 101.2; skew-x: -36.5; skew-y: -36.5; scale-x: 0.795; scale-y: 0.795; }
        frame 32 { x: 24.5; y: 100.6; skew-x: -34.5; skew-y: -34.5; scale-x: 0.794; scale-y: 0.794; }
        frame 33 { x: 23.7; y: 100; skew-x: -32.5; skew-y: -32.5; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 22.8; y: 99.4; skew-x: -30.6; skew-y: -30.6; scale-x: 0.796; scale-y: 0.796; }
        frame 35 { x: 21.5; y: 97.8; skew-x: -27; skew-y: -27; scale-x: 0.794; scale-y: 0.794; }
        frame 36 { x: 20.4; y: 96.4; skew-x: -23.2; skew-y: -23.2; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 19.2; y: 95; skew-x: -19.5; skew-y: -19.5; }
        frame 38 { x: 18.2; y: 93.7; skew-x: -15.9; skew-y: -15.9; }
        frame 39 { x: 18; y: 92.5; skew-x: -11.7; skew-y: -11.7; scale-x: 0.793; scale-y: 0.793; }
        frame 40 { y: 91.2; skew-x: -7.5; skew-y: -7.5; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 17.8; y: 90.1; skew-x: -3.4; skew-y: -3.4; }
        frame 42 { x: 17.7; y: 89; skew-x: 0.6; skew-y: 0.6; }
        frame 43 { x: 15.9; y: 90.6; skew-x: -3.9; skew-y: -3.9; }
        frame 44 { x: 14.2; y: 92.2; skew-x: -8.7; skew-y: -8.7; }
        frame 45 { x: 12.5; y: 94.1; skew-x: -13.4; skew-y: -13.4; scale-x: 0.792; scale-y: 0.792; }
        frame 46 { x: 10.8; y: 95.9; skew-x: -18.1; skew-y: -18.1; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 13; y: 95.7; skew-x: -17.4; skew-y: -17.4; }
        frame 48 { x: 15.1; y: 95.4; skew-x: -16.7; skew-y: -16.7; scale-x: 0.793; scale-y: 0.793; }
        frame 49 { x: 17.2; y: 95.2; skew-x: -16; skew-y: -16; scale-x: 0.794; scale-y: 0.794; }
        frame 50 { x: 19.4; y: 95; skew-x: -15.5; skew-y: -15.5; scale-x: 0.795; scale-y: 0.795; }
        frame 51 { x: 21.6; y: 94.8; skew-x: -14.7; skew-y: -14.7; scale-x: 0.796; scale-y: 0.796; }
        frame 52 { x: 23.7; y: 94.6; skew-x: -14.2; skew-y: -14.2; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 25.9; y: 94.4; skew-x: -13.5; skew-y: -13.5; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: 28; y: 94.2; skew-x: -13; skew-y: -13; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 20.3; y: 91.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: 20.7; y: 90.6; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 21.1; y: 90.3; skew-x: 2; skew-y: 2; }
        frame 58 { x: 21.5; y: 90; skew-x: 3.1; skew-y: 3.1; }
        frame 59 { x: 21.9; y: 89.5; skew-x: 4.3; skew-y: 4.3; }
        frame 60 { x: 21.8; y: 89.6; skew-x: 3.8; skew-y: 3.8; }
        frame 61 { x: 21.7; y: 89.5; skew-x: 3.5; skew-y: 3.5; }
        frame 62 { x: -10000; y: 89.4; skew-x: 3.3; skew-y: 3.3; }
        frame 63 { x: 21.6; y: -10000; skew-x: 3; skew-y: 3; }
        frame 64 { x: 22; y: 88.9; skew-x: 4.5; skew-y: 4.5; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: 22.3; y: 88.2; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 22.7; y: 87.8; skew-x: 7.7; skew-y: 7.7; }
        frame 67 { x: 22.6; y: 88.1; skew-x: 7; skew-y: 7; }
        frame 68 { x: 22.5; y: 88.4; skew-x: 6.5; skew-y: 6.5; }
        frame 69 { x: 22.4; y: 88.8; skew-x: 5.8; skew-y: 5.8; }
        frame 70 { x: 22.3; y: 89; skew-x: 5.3; skew-y: 5.3; }
        frame 71 { x: 22.2; y: 89.3; skew-x: 4.8; skew-y: 4.8; }
        frame 72 { x: 21.9; y: 89.5; skew-x: 4.3; skew-y: 4.3; scale-x: 0.8; scale-y: 0.8; }
        frame 73 { x: 21.8; y: 89.6; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -10000; y: 89.5; skew-x: 3.8; skew-y: 3.8; }
        frame 75 { x: 21.7; y: -10000; skew-x: 3.5; skew-y: 3.5; }
        frame 76 { x: -10000; skew-x: 3.3; skew-y: 3.3; }
        frame 77 { x: 21.6; y: 89.4; skew-x: 3; skew-y: 3; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 79 { x: 23.3; y: 88.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 80 { x: 25; y: 88.1; skew-x: 10.3; skew-y: 10.3; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 26.8; y: 87.4; skew-x: 14.1; skew-y: 14.1; }
        frame 82 { x: 25.6; y: 87.9; skew-x: 11.6; skew-y: 11.6; }
        frame 83 { x: 24.5; y: 88.5; skew-x: 9.3; skew-y: 9.3; }
        frame 84 { x: 23.5; y: 89.1; skew-x: 7; skew-y: 7; }
        frame 85 { x: 22.4; y: 89.7; skew-x: 4.6; skew-y: 4.6; scale-x: 0.8; scale-y: 0.8; }
        frame 86 { x: 21.4; y: 90.4; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 20.3; y: 91.1; skew-x: 0; skew-y: 0; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 89 { x: 19.9; y: 91.6; skew-x: -2.2; skew-y: -2.2; }
        frame 90 { x: 19.2; y: 92.2; skew-x: -4.7; skew-y: -4.7; }
        frame 91 { x: 18.8; y: 92.7; skew-x: -6.9; skew-y: -6.9; scale-x: 0.799; scale-y: 0.799; }
        frame 92 { x: 18.3; y: 93.4; skew-x: -9.5; skew-y: -9.5; scale-x: 0.8; scale-y: 0.8; }
        frame 93 { x: 17; y: 93.8; skew-x: -12.9; skew-y: -12.9; scale-x: 0.799; scale-y: 0.799; }
        frame 94 { x: 15.8; y: 94.3; skew-x: -16.2; skew-y: -16.2; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 14.6; y: 94.7; skew-x: -19.7; skew-y: -19.7; scale-x: 0.798; scale-y: 0.798; }
        frame 96 { x: 13.5; y: 95.4; skew-x: -23.2; skew-y: -23.2; scale-x: 0.799; scale-y: 0.799; }
        frame 97 { x: 10.3; y: 105.7; skew-x: -43; skew-y: -43; scale-x: 0.797; scale-y: 0.797; }
        frame 98 { x: 9.2; y: 116.2; skew-x: -62.8; skew-y: -62.8; scale-x: 0.796; scale-y: 0.796; }
        frame 99 { x: 10.1; y: 126.1; skew-x: -82.5; skew-y: -82.5; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 10.2; y: 126.2; skew-x: -82.6; skew-y: -82.6; }
        frame 101 { x: 10.1; y: 126.1; skew-x: -82.5; skew-y: -82.5; }
        frame 102 { x: 9.6; y: 124.3; skew-x: -79.3; skew-y: -79.3; }
        frame 103 { x: 9; y: 122.4; skew-x: -75.9; skew-y: -75.9; }
        frame 104 { x: 9.4; y: 123.7; skew-x: -78.3; skew-y: -78.3; }
        frame 105 { x: 9.8; y: 124.9; skew-x: -80.4; skew-y: -80.4; }
        frame 106 { x: 10.2; y: 126.2; skew-x: -82.6; skew-y: -82.6; }
        frame 107 { x: 10.1; y: 126.1; skew-x: -82.5; skew-y: -82.5; }
        frame 108 { x: 10.2; y: 126.9; skew-x: -82.4; skew-y: -82.8; scale-x: 0.787; scale-y: 0.805; }
        frame 109 { x: 10.1; y: 127.6; skew-x: -82.3; skew-y: -82.9; scale-x: 0.779; scale-y: 0.814; }
        frame 110 { x: -10000; y: 127.2; skew-x: -82.4; skew-y: -10000; scale-x: 0.784; scale-y: 0.808; }
        frame 111 { y: 126.7; skew-x: -82.6; skew-y: -82.6; scale-x: 0.79; scale-y: 0.802; }
        frame 112 { y: 126.1; skew-x: -82.5; skew-y: -82.5; scale-x: 0.796; scale-y: 0.796; }
        frame 113 { x: 9.9; y: 125.6; skew-x: -81.1; skew-y: -81.1; scale-x: -10000; scale-y: -10000; }
        frame 114 { x: 9.7; y: 125; skew-x: -79.6; skew-y: -79.6; }
        frame 115 { x: 9.3; y: 124.3; skew-x: -78; skew-y: -78; }
        frame 116 { x: 9.9; y: 125.3; skew-x: -81.3; skew-y: -81.3; scale-y: 0.823; }
        frame 117 { x: 10.5; y: 126.3; skew-x: -84.4; skew-y: -84.4; scale-y: 0.85; }
        frame 118 { x: 11.2; y: 127.2; skew-x: -87.6; skew-y: -87.6; scale-y: 0.877; }
        frame 119 { x: 13; y: 129.4; skew-x: -91.7; skew-y: -91.7; scale-y: 0.85; }
        frame 120 { x: 14.8; y: 131.6; skew-x: -95.7; skew-y: -95.7; scale-x: 0.795; scale-y: 0.822; }
        frame 121 { x: 16.8; y: 133.8; skew-x: -100.1; skew-y: -100.1; scale-x: 0.796; scale-y: 0.796; }
        frame 122 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 128 { cel: -1; }
        frame 129 { cel: -10000; }
        frame 146 { x: 24.2; y: 74.8; skew-x: -6.9; skew-y: -6.9; scale-x: 0.799; scale-y: 0.872; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 23.7; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 23.1; y: 78; skew-x: -5.4; skew-y: -5.4; scale-y: 0.858; }
        frame 167 { x: 22.4; y: 81.3; skew-x: -4; skew-y: -4; scale-y: 0.843; }
        frame 168 { x: 21.7; y: 84.4; skew-x: -2.7; skew-y: -2.7; scale-x: 0.8; scale-y: 0.829; }
        frame 169 { x: 21; y: 87.8; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: 0.814; }
        frame 170 { x: 20.3; y: 91.1; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 171 { x: 19.8; y: 91.7; skew-x: -1.4; skew-y: -1.7; scale-x: 0.809; scale-y: 0.795; }
        frame 172 { x: 19.3; y: 92.3; skew-x: -2.9; skew-y: -3.4; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: 18.9; y: 93; skew-x: -4.7; skew-y: -5.2; scale-x: 0.828; scale-y: 0.785; }
        frame 174 { x: 19.3; y: 92.4; skew-x: -3.4; skew-y: -3.7; scale-x: 0.821; scale-y: 0.789; }
        frame 175 { x: 19.6; y: 92; skew-x: -2.2; skew-y: -2.4; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: 20; y: 91.5; skew-x: -0.9; skew-y: -1.2; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: 20.3; y: 91.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 20; y: 90.9; skew-x: -1; skew-y: -1; scale-x: 0.803; scale-y: 0.809; }
        frame 181 { x: 19.6; y: 90.8; skew-x: -2.2; skew-y: -2.2; scale-x: 0.806; scale-y: 0.818; }
        frame 182 { x: 19.2; y: -10000; skew-x: -3.4; skew-y: -3.4; scale-x: 0.809; scale-y: 0.827; }
        frame 183 { x: 18.9; y: 90.6; skew-x: -4.7; skew-y: -4.7; scale-x: 0.812; scale-y: 0.836; }
        frame 184 { x: 18.5; y: 90.5; skew-x: -5.9; skew-y: -5.9; scale-x: 0.816; scale-y: 0.845; }
        frame 185 { x: 18.6; y: -10000; skew-x: -5.7; skew-y: -5.7; scale-x: 0.814; scale-y: 0.84; }
        frame 186 { x: 18.7; y: 90.6; skew-x: -10000; skew-y: -10000; scale-x: 0.812; scale-y: 0.836; }
        frame 187 { x: 18.9; y: -10000; skew-x: -5.5; skew-y: -5.5; scale-x: 0.811; scale-y: 0.831; }
        frame 188 { x: 19; y: 90.8; skew-x: -5.4; skew-y: -5.4; scale-x: 0.809; scale-y: 0.827; }
        frame 189 { x: 19.1; y: 90.9; skew-x: -10000; skew-y: -10000; scale-x: 0.808; scale-y: 0.822; }
        frame 190 { x: 19.2; y: 90.8; skew-x: -5.2; skew-y: -5.2; scale-x: 0.806; scale-y: 0.818; }
        frame 191 { x: 19.4; y: 91; skew-x: -10000; skew-y: -10000; scale-x: 0.804; scale-y: 0.813; }
        frame 192 { x: 19.5; y: -10000; skew-x: -5; skew-y: -5; scale-x: 0.803; scale-y: 0.809; }
        frame 193 { x: 19.6; y: 91.1; skew-x: -4.9; skew-y: -4.9; scale-x: 0.801; scale-y: 0.804; }
        frame 194 { x: 19.7; y: 91.3; skew-x: -10000; skew-y: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 195 { x: 19.8; y: 91.2; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 196 { x: 19.9; y: -10000; skew-x: -2.9; skew-y: -2.9; }
        frame 197 { x: 20; skew-x: -1.9; skew-y: -1.9; }
        frame 198 { x: 20.2; y: 91.1; skew-x: -0.9; skew-y: -0.9; }
        frame 199 { x: 20.3; y: -10000; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_digger_innerleg_upper";
        frame-count: 200;
        frame 0 { x: 23; y: 77.9; skew-x: 6.5; skew-y: 358.9; scale-x: 0.852; scale-y: 0.92; image: IMAGE_REANIM_ZOMBIE_DIGGER_INNERLEG_UPPER; }
        frame 1 { y: 78.3; skew-x: 5.8; skew-y: 358.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 22.8; y: 78.5; skew-x: 5; skew-y: 357.5; }
        frame 3 { x: -10000; y: 78.7; skew-x: 4.3; skew-y: 356.7; }
        frame 4 { x: 22.7; y: 79; skew-x: 3.5; skew-y: 356; }
        frame 5 { x: 22.6; y: 79.3; skew-x: 2.8; skew-y: 355.2; }
        frame 6 { x: -10000; y: 79.6; skew-x: 2; skew-y: 354.5; }
        frame 7 { x: 22.5; y: 79.9; skew-x: 1.3; skew-y: 353.7; }
        frame 8 { x: 22.4; y: 80.2; skew-x: 0.5; skew-y: 353; scale-y: 0.919; }
        frame 9 { x: 22.3; y: 80.3; skew-x: -0.1; skew-y: 352.1; scale-y: 0.92; }
        frame 10 { x: 22.4; y: 79.9; skew-x: 0.5; skew-y: 353; scale-y: 0.919; }
        frame 11 { x: 22.5; y: 79.7; skew-x: 1.3; skew-y: 354; scale-y: 0.92; }
        frame 12 { x: 22.6; y: 79.3; skew-x: 2.3; skew-y: 354.7; scale-y: -10000; }
        frame 13 { x: 22.7; y: 79.1; skew-x: 3; skew-y: 355.7; }
        frame 14 { x: 22.8; y: 78.8; skew-x: 3.8; skew-y: 356.5; }
        frame 15 { x: 22.9; y: 78.4; skew-x: 4.8; skew-y: 357.2; }
        frame 16 { x: -10000; y: 78.2; skew-x: 5.5; skew-y: 358.2; }
        frame 17 { x: 23; y: 77.9; skew-x: 6.5; skew-y: 358.9; }
        frame 18 { x: 24.1; y: 81.5; skew-x: -15.3; skew-y: 336.9; scale-x: 0.851; scale-y: 0.997; }
        frame 19 { x: 24.5; y: 82.6; skew-x: -18; skew-y: 334.2; scale-x: 0.85; scale-y: 0.996; }
        frame 20 { x: 24.9; y: 83.7; skew-x: -20.7; skew-y: 331.4; scale-x: -10000; scale-y: 0.995; }
        frame 21 { x: 25.3; y: 84.8; skew-x: -23.5; skew-y: 328.7; scale-x: 0.849; scale-y: -10000; }
        frame 22 { x: 25.8; y: 86; skew-x: -26.3; skew-y: 325.9; scale-x: 0.85; scale-y: 0.996; }
        frame 23 { x: -10000; y: -10000; skew-x: -26.2; skew-y: -10000; scale-x: 0.849; scale-y: 0.995; }
        frame 24 { skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { skew-x: -26.3; scale-x: 0.85; scale-y: 0.996; }
        frame 27 { x: 24.2; skew-x: -26.2; scale-x: 0.849; scale-y: 1.011; }
        frame 28 { x: 22.5; skew-x: -10000; scale-x: -10000; scale-y: 1.027; }
        frame 29 { x: 20.8; scale-y: 1.043; }
        frame 30 { x: 19.1; y: 85.9; skew-x: -26.3; scale-x: 0.85; scale-y: 1.061; }
        frame 31 { x: 19.2; y: 84.9; skew-x: -23.4; skew-y: 328.9; scale-x: 0.849; scale-y: 1.06; }
        frame 32 { x: 19.1; y: 83.9; skew-x: -20.5; skew-y: 331.7; scale-x: -10000; scale-y: 1.059; }
        frame 33 { x: 19.3; y: 83.1; skew-x: -17.7; skew-y: 334.7; scale-y: -10000; }
        frame 34 { x: 19.4; y: 82.2; skew-x: -14.8; skew-y: 337.5; scale-x: 0.85; scale-y: 1.061; }
        frame 35 { x: -10000; y: 80.9; skew-x: -10.4; skew-y: 341.7; scale-x: 0.849; scale-y: 1.059; }
        frame 36 { x: 19.6; y: 79.5; skew-x: -6.2; skew-y: 346.2; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 19.8; y: 78.3; skew-x: -1.9; skew-y: 350.4; }
        frame 38 { x: 20; y: 77.3; skew-x: 2.2; skew-y: 354.6; scale-y: 1.06; }
        frame 39 { x: 20.2; y: 76.7; skew-x: 3.8; skew-y: 356.5; scale-y: 1.059; }
        frame 40 { x: 20.5; y: 76.2; skew-x: 5.6; skew-y: 358.2; scale-x: 0.848; scale-y: -10000; }
        frame 41 { x: 20.7; y: 75.7; skew-x: 7.3; skew-y: 360; scale-x: -10000; }
        frame 42 { x: 20.9; y: 75.2; skew-x: 9.3; skew-y: 361.6; scale-x: 0.849; }
        frame 43 { x: 20.4; y: 76.4; skew-x: 12.1; skew-y: 364.5; scale-x: 0.848; }
        frame 44 { x: 19.9; y: 77.5; skew-x: 15.1; skew-y: 367.5; scale-x: -10000; scale-y: 1.058; }
        frame 45 { x: 19.6; y: 78.6; skew-x: 18.1; skew-y: 370.3; scale-x: 0.847; scale-y: -10000; }
        frame 46 { x: 19.1; y: 79.9; skew-x: 21.1; skew-y: 373.4; scale-x: 0.848; }
        frame 47 { x: 19.5; y: -10000; skew-x: 16.5; skew-y: 368.8; scale-x: -10000; scale-y: 1.05; }
        frame 48 { x: 19.8; skew-x: 11.8; skew-y: 364.3; scale-y: 1.043; }
        frame 49 { x: 20.4; y: 80; skew-x: 7.3; skew-y: 359.9; scale-x: 0.849; scale-y: 1.035; }
        frame 50 { x: 20.8; y: 80.1; skew-x: 2.8; skew-y: 355.2; scale-x: -10000; scale-y: 1.027; }
        frame 51 { x: 21.4; y: 80.4; skew-x: -1.7; skew-y: 350.7; scale-x: 0.85; scale-y: 1.019; }
        frame 52 { x: 22.2; y: 80.7; skew-x: -6.2; skew-y: 346.2; scale-x: -10000; scale-y: 1.012; }
        frame 53 { x: 23; y: 81; skew-x: -10.7; skew-y: 341.7; scale-y: 1.004; }
        frame 54 { x: 24.1; y: 81.5; skew-x: -15.3; skew-y: 336.9; scale-x: 0.851; scale-y: 0.997; }
        frame 55 { x: 23; y: 77.9; skew-x: 6.5; skew-y: 358.9; scale-x: 0.852; scale-y: 0.92; }
        frame 56 { x: 22.6; y: 78.3; skew-x: 4; skew-y: 356.5; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 22.1; y: 78.5; skew-x: 1.6; skew-y: 354.2; }
        frame 58 { x: 21.6; y: 78.9; skew-x: -0.4; skew-y: 351.7; scale-y: 0.919; }
        frame 59 { x: 21.3; y: 79.2; skew-x: -3; skew-y: 349.3; scale-x: 0.851; scale-y: 0.92; }
        frame 60 { x: 21.2; y: -10000; skew-x: -3.7; skew-y: 348.7; scale-x: -10000; scale-y: 0.919; }
        frame 61 { x: 21.1; skew-x: -4.2; skew-y: 348; scale-y: -10000; }
        frame 62 { x: 21; skew-x: -4.9; skew-y: 347.2; }
        frame 63 { x: 20.8; y: 79.1; skew-x: -5.8; skew-y: 346.5; }
        frame 64 { x: 19.5; y: 79.9; skew-x: -8.2; skew-y: 344; }
        frame 65 { x: 18.4; y: 80.8; skew-x: -10.9; skew-y: 341.4; scale-y: 0.918; }
        frame 66 { x: 17.2; y: 81.8; skew-x: -13.6; skew-y: 338.6; scale-y: 0.919; }
        frame 67 { x: 17.8; y: 81.3; skew-x: -11.7; skew-y: 340.5; scale-x: 0.85; scale-y: 0.918; }
        frame 68 { x: 18.4; y: 81; skew-x: -9.9; skew-y: 342.2; scale-x: 0.851; scale-y: -10000; }
        frame 69 { x: 19.2; y: 80.4; skew-x: -8.2; skew-y: 344; scale-x: -10000; scale-y: 0.919; }
        frame 70 { x: 19.8; y: 80; skew-x: -6.4; skew-y: 345.7; scale-y: -10000; }
        frame 71 { x: 20.5; y: 79.6; skew-x: -4.7; skew-y: 347.7; }
        frame 72 { x: 21.3; y: 79.2; skew-x: -3; skew-y: 349.3; scale-y: 0.92; }
        frame 73 { x: 21.2; y: -10000; skew-x: -3.4; skew-y: 348.9; scale-y: 0.919; }
        frame 74 { x: -10000; skew-x: -3.7; skew-y: 348.5; scale-y: -10000; }
        frame 75 { x: 21.1; skew-x: -4.2; skew-y: 348; }
        frame 76 { x: 21; skew-x: -4.7; skew-y: 347.5; }
        frame 77 { x: 20.9; skew-x: -5.2; skew-y: 347; }
        frame 78 { x: 20.8; y: 79.1; skew-x: -5.8; skew-y: 346.5; }
        frame 79 { x: 20.7; y: 79.9; skew-x: -8.2; skew-y: 344; }
        frame 80 { x: 20.6; y: 80.8; skew-x: -10.9; skew-y: 341.4; scale-y: 0.918; }
        frame 81 { x: -10000; y: 81.8; skew-x: -13.6; skew-y: 338.6; scale-y: 0.919; }
        frame 82 { x: 20.9; y: 81.1; skew-x: -10.2; skew-y: 342.2; scale-y: 0.918; }
        frame 83 { x: 21.2; y: 80.4; skew-x: -6.7; skew-y: 345.5; scale-y: 0.919; }
        frame 84 { x: 21.6; y: 79.8; skew-x: -3.4; skew-y: 348.9; scale-y: -10000; }
        frame 85 { x: 22; y: 79.1; skew-x: -0; skew-y: 352.2; scale-x: 0.852; }
        frame 86 { x: 22.5; y: 78.5; skew-x: 3; skew-y: 355.7; scale-x: -10000; scale-y: 0.92; }
        frame 87 { x: 23; y: 77.9; skew-x: 6.5; skew-y: 358.9; scale-y: -10000; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 89 { x: 24.9; y: 76.9; skew-x: 15; skew-y: 365.8; scale-x: 0.834; scale-y: 0.93; }
        frame 90 { x: 27.1; y: 76.2; skew-x: 23.6; skew-y: 373; scale-x: 0.817; scale-y: 0.939; }
        frame 91 { x: 29.3; y: 75.7; skew-x: 32.1; skew-y: 380.1; scale-x: 0.8; scale-y: 0.949; }
        frame 92 { x: 32; y: -10000; skew-x: 40.7; skew-y: 387.2; scale-x: 0.784; scale-y: 0.96; }
        frame 93 { x: 24.6; y: 76.1; skew-x: 25.3; skew-y: 372; scale-x: 0.783; scale-y: 0.959; }
        frame 94 { x: 18; y: 77.7; skew-x: 10.1; skew-y: 356.9; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 12.1; y: 80.1; skew-x: -4.7; skew-y: 341.7; scale-y: 0.958; }
        frame 96 { x: 7.3; y: 83.3; skew-x: -20.1; skew-y: 326.3; scale-y: -10000; }
        frame 97 { x: 5.3; y: 90.2; skew-x: -24.2; skew-y: 327.4; scale-x: 0.774; scale-y: 1.001; }
        frame 98 { x: 3.3; y: 97.1; skew-x: -28.5; skew-y: 328.4; scale-x: 0.766; scale-y: 1.046; }
        frame 99 { x: 1.4; y: 103.7; skew-x: -32.6; skew-y: 329.5; scale-x: 0.76; scale-y: 1.092; }
        frame 100 { x: 0.8; y: 104; skew-x: -31.5; skew-y: 328.6; scale-x: 0.772; scale-y: -10000; }
        frame 101 { x: 0; y: 104.2; skew-x: -30.7; skew-y: 327.6; scale-x: 0.787; scale-y: 1.095; }
        frame 102 { x: 0.5; y: 103.1; skew-x: -33.3; skew-y: 326.9; scale-x: 0.772; scale-y: 1.092; }
        frame 103 { x: 0.9; y: 102.1; skew-x: -36.1; skew-y: 326; scale-x: 0.759; scale-y: -10000; }
        frame 104 { x: 0.2; y: 103.1; skew-x: -37.2; skew-y: 324.4; scale-x: 0.761; scale-y: 1.09; }
        frame 105 { x: -0.5; y: 104.1; skew-x: -38.2; skew-y: 322.9; scale-x: 0.765; scale-y: -10000; }
        frame 106 { x: -1.3; y: 105.1; skew-x: -39.3; skew-y: 321.3; scale-x: 0.769; scale-y: 1.091; }
        frame 107 { x: -1; y: 106.3; skew-x: -41.1; skew-y: 321; scale-x: 0.759; scale-y: 1.092; }
        frame 108 { x: -1.9; y: 109.2; skew-x: -45.3; skew-y: 315.6; scale-x: 0.756; scale-y: 1.091; }
        frame 109 { x: -2.6; y: 112.2; skew-x: -49.3; skew-y: 310.1; scale-x: 0.755; scale-y: 1.094; }
        frame 110 { x: -2.1; y: 110.2; skew-x: -46.5; skew-y: 313.6; scale-x: -10000; scale-y: 1.091; }
        frame 111 { x: -1.6; y: 108.2; skew-x: -43.8; skew-y: 317.4; scale-x: 0.756; scale-y: -10000; }
        frame 112 { x: -1; y: 106.3; skew-x: -41.1; skew-y: 321; scale-x: 0.759; scale-y: 1.092; }
        frame 113 { x: -1.1; y: 106.4; skew-x: -42.5; skew-y: 319.4; scale-x: 0.758; scale-y: 1.09; }
        frame 114 { x: -1.2; y: 106.6; skew-x: -44; skew-y: 317.9; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: -10000; y: 106.7; skew-x: -45.6; skew-y: 316.5; scale-x: 0.759; scale-y: 1.092; }
        frame 116 { x: -2.5; y: 111.4; skew-x: -56.8; skew-y: 305.3; scale-x: 0.757; scale-y: 1.089; }
        frame 117 { x: -3.1; y: 116.1; skew-x: -68.1; skew-y: 294.1; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: -10000; y: 120.5; skew-x: -79; skew-y: 283; scale-x: 0.758; scale-y: 1.09; }
        frame 119 { y: -10000; skew-x: -79.1; skew-y: -10000; scale-x: 0.757; scale-y: 1.089; }
        frame 120 { skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 121 { skew-x: -79; scale-x: 0.758; scale-y: 1.09; }
        frame 122 { x: -3.5; y: 120.9; skew-x: -78.6; skew-y: 282.3; scale-x: 0.738; scale-y: 1.107; }
        frame 123 { x: -4; y: 121.3; skew-x: -78; skew-y: 281.9; scale-x: 0.719; scale-y: 1.126; }
        frame 124 { x: -3.5; y: 120.9; skew-x: -78.6; skew-y: 282.3; scale-x: 0.738; scale-y: 1.107; }
        frame 125 { x: -3.1; y: 120.5; skew-x: -79; skew-y: 283; scale-x: 0.758; scale-y: 1.09; }
        frame 126 { x: -10000; y: -10000; skew-x: -79.1; skew-y: -10000; scale-x: 0.757; scale-y: 1.089; }
        frame 127 { skew-x: -79; scale-x: 0.758; scale-y: 1.09; }
        frame 128 { skew-x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 129 { cel: -10000; }
        frame 146 { x: 20.9; y: 62.6; skew-x: -0.4; skew-y: 339; scale-x: 0.851; scale-y: 0.972; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 20.4; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 20.9; y: 65.6; skew-x: 0.8; skew-y: 343.2; scale-y: 0.961; }
        frame 167 { x: 21.4; y: 68.6; skew-x: 2.3; skew-y: 347; scale-y: 0.951; }
        frame 168 { x: 21.9; y: 71.7; skew-x: 3.6; skew-y: 351; scale-y: 0.941; }
        frame 169 { x: 22.5; y: 74.8; skew-x: 5; skew-y: 355; scale-y: 0.93; }
        frame 170 { x: 23; y: 77.9; skew-x: 6.5; skew-y: 358.9; scale-x: 0.852; scale-y: 0.92; }
        frame 171 { x: 23.2; y: 78.2; skew-x: 8; skew-y: 360.5; scale-x: 0.861; scale-y: 0.914; }
        frame 172 { x: 23.4; y: 78.4; skew-x: 9.3; skew-y: 362.3; scale-x: 0.871; scale-y: 0.908; }
        frame 173 { x: 23.7; y: -10000; skew-x: 11; skew-y: 364.1; scale-x: 0.881; scale-y: 0.903; }
        frame 174 { x: 23.6; y: 78.2; skew-x: 9.8; skew-y: 362.8; scale-x: 0.873; scale-y: 0.907; }
        frame 175 { x: 23.3; y: 78.1; skew-x: 8.6; skew-y: 361.5; scale-x: 0.866; scale-y: 0.911; }
        frame 176 { x: 23.1; y: 78; skew-x: 7.5; skew-y: 360; scale-x: 0.859; scale-y: 0.916; }
        frame 177 { x: 23; y: 77.9; skew-x: 6.5; skew-y: 358.9; scale-x: 0.852; scale-y: 0.92; }
        frame 178 { x: 23.1; y: 78; skew-x: -10000; skew-y: 359; scale-x: -10000; scale-y: -10000; }
        frame 179 { x: 23; y: 77.9; skew-y: 358.9; }
        frame 180 { x: 23.3; y: 77.6; skew-x: 8.3; skew-y: 360.8; scale-x: 0.851; }
        frame 181 { x: 23.5; y: 77; skew-x: 10.3; skew-y: 362.5; scale-x: -10000; }
        frame 182 { x: 23.6; y: 76.7; skew-x: 12.3; skew-y: 364.5; }
        frame 183 { x: 24; y: 76.3; skew-x: 14.1; skew-y: 366.5; scale-y: 0.919; }
        frame 184 { x: 24.3; y: 75.8; skew-x: 16.1; skew-y: 368.4; scale-y: 0.92; }
        frame 185 { x: 22.8; y: 76.9; skew-x: 11.5; skew-y: 363.8; scale-y: 0.919; }
        frame 186 { x: 21.6; y: 78; skew-x: 6.8; skew-y: 359.5; scale-y: -10000; }
        frame 187 { x: 20.4; y: 79.1; skew-x: 2.3; skew-y: 354.9; }
        frame 188 { x: 19.3; y: 80.3; skew-x: -1.9; skew-y: 350.4; }
        frame 189 { x: 18.3; y: 81.7; skew-x: -6.4; skew-y: 345.7; scale-y: 0.918; }
        frame 190 { x: 17.3; y: 83; skew-x: -10.9; skew-y: 341.2; scale-x: 0.85; scale-y: -10000; }
        frame 191 { x: 16.4; y: 84.5; skew-x: -15.5; skew-y: 336.7; scale-x: -10000; }
        frame 192 { x: 15.7; y: 85.9; skew-x: -20; skew-y: 332.2; scale-y: 0.917; }
        frame 193 { x: 15.2; y: 87.5; skew-x: -24.7; skew-y: 327.7; scale-x: 0.849; scale-y: -10000; }
        frame 194 { x: 14.6; y: 88.9; skew-x: -29.2; skew-y: 323; scale-x: 0.85; scale-y: 0.918; }
        frame 195 { x: 15.8; y: 86.4; skew-x: -22; skew-y: 330.2; scale-x: -10000; scale-y: 0.917; }
        frame 196 { x: 17.2; y: 84.1; skew-x: -14.7; skew-y: 337.4; scale-y: 0.918; }
        frame 197 { x: 18.9; y: 81.9; skew-x: -7.7; skew-y: 344.7; scale-x: 0.851; scale-y: 0.919; }
        frame 198 { x: 20.8; y: 79.8; skew-x: -0.4; skew-y: 351.7; scale-x: 0.852; scale-y: -10000; }
        frame 199 { x: 23; y: 77.9; skew-x: 6.5; skew-y: 358.9; scale-x: -10000; scale-y: 0.92; }
    }
    Track {
        source-name: "Zombie_digger_body";
        frame-count: 200;
        frame 0 { x: 18.6; y: 31.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_BODY; }
        frame 1 { x: 18.1; y: 31.8; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 17.7; y: 32.2; skew-x: -0.9; skew-y: -0.9; }
        frame 3 { x: 17.3; y: 32.7; skew-x: -1.4; skew-y: -1.4; }
        frame 4 { x: 16.9; y: 33.2; skew-x: -1.9; skew-y: -1.9; }
        frame 5 { x: 16.5; y: 33.7; skew-x: -2.5; skew-y: -2.5; }
        frame 6 { x: 16; y: 34.3; skew-x: -3.2; skew-y: -3.2; }
        frame 7 { x: 15.5; y: 34.9; skew-x: -3.7; skew-y: -3.7; }
        frame 8 { x: 15.1; y: 35.4; skew-x: -4.2; skew-y: -4.2; }
        frame 9 { x: 14.5; y: 36; skew-x: -4.8; skew-y: -4.8; }
        frame 10 { x: 15.1; y: 34.9; skew-x: -3.7; skew-y: -3.7; scale-x: 0.806; scale-y: 0.809; }
        frame 11 { x: 15.6; y: 34; skew-x: -2.7; skew-y: -2.7; scale-x: 0.812; scale-y: 0.819; }
        frame 12 { x: 16.1; y: 33.4; skew-x: -2.2; skew-y: -2.2; scale-x: 0.81; scale-y: 0.816; }
        frame 13 { x: 16.7; y: 33; skew-x: -1.7; skew-y: -1.7; scale-x: 0.808; scale-y: 0.812; }
        frame 14 { x: 17.1; y: 32.5; skew-x: -1.2; skew-y: -1.2; scale-x: 0.806; scale-y: 0.809; }
        frame 15 { x: 17.6; y: 32; skew-x: -0.7; skew-y: -0.7; scale-x: 0.804; scale-y: 0.806; }
        frame 16 { x: 18.2; y: 31.6; skew-x: -0.2; skew-y: -0.2; scale-x: 0.802; scale-y: 0.803; }
        frame 17 { x: 18.6; y: 31.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { x: 25.3; y: 27.6; skew-x: 7.2; skew-y: 7.2; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 26.2; y: 27; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { x: 27; y: 26.4; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 27.9; y: 25.9; skew-x: 10.3; skew-y: 10.3; }
        frame 22 { x: 28.8; y: 25.3; skew-x: 11.5; skew-y: 11.5; }
        frame 23 { x: 24.2; y: 28.4; skew-x: 8.3; skew-y: 8.3; }
        frame 24 { x: 19.7; y: 31.5; skew-x: 5; skew-y: 5; }
        frame 25 { x: 15.4; y: 34.8; skew-x: 1.8; skew-y: 1.8; }
        frame 26 { x: 11.1; y: 38.1; skew-x: -1.2; skew-y: -1.2; }
        frame 27 { x: 12.3; y: 36.4; skew-x: -0.2; skew-y: -0.2; scale-y: 0.815; }
        frame 28 { x: 13.4; y: 34.8; skew-x: 0.6; skew-y: 0.6; scale-y: 0.831; }
        frame 29 { x: 14.6; y: 33.1; skew-x: 1.5; skew-y: 1.5; scale-y: 0.815; }
        frame 30 { x: 15.9; y: 31.3; skew-x: 2.7; skew-y: 2.7; scale-y: 0.799; }
        frame 31 { x: 17.8; y: 29.9; skew-x: 4.6; skew-y: 4.6; scale-x: 0.798; scale-y: 0.798; }
        frame 32 { x: 19.9; y: 28.4; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 22.1; y: 27.1; skew-x: 8.5; skew-y: 8.5; }
        frame 34 { x: 24.3; y: 25.6; skew-x: 10.6; skew-y: 10.6; }
        frame 35 { x: 25.5; y: 24.9; skew-x: 12; skew-y: 12; }
        frame 36 { x: 26.7; y: 24.2; skew-x: 13.5; skew-y: 13.5; }
        frame 37 { x: 27.9; y: 23.5; skew-x: 15.1; skew-y: 15.1; scale-x: 0.797; scale-y: 0.797; }
        frame 38 { x: 29.2; y: 22.6; skew-x: 16.7; skew-y: 16.7; scale-x: 0.798; scale-y: 0.798; }
        frame 39 { x: 30.2; y: 21.9; skew-x: 17.5; skew-y: 17.5; scale-x: 0.797; scale-y: 0.797; }
        frame 40 { x: 31.1; y: 21.3; skew-x: 18.3; skew-y: 18.3; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 32.2; y: 20.6; skew-x: 19.3; skew-y: 19.3; }
        frame 42 { x: 33.1; y: 19.9; skew-x: 20.2; skew-y: 20.2; scale-x: 0.798; scale-y: 0.798; }
        frame 43 { x: 27.3; y: 24.1; skew-x: 14.8; skew-y: 14.8; scale-x: 0.797; scale-y: 0.797; }
        frame 44 { x: 21.5; y: 28.6; skew-x: 9.3; skew-y: 9.3; scale-x: 0.798; scale-y: 0.798; }
        frame 45 { x: 16.2; y: 33.2; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 11.1; y: 38.1; skew-x: -1.2; skew-y: -1.2; scale-x: 0.799; scale-y: 0.799; }
        frame 47 { x: 12.4; y: 37.1; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: 0.805; }
        frame 48 { x: 13.5; y: 36.2; skew-x: -0.4; skew-y: -0.4; scale-y: 0.811; }
        frame 49 { x: 14.7; y: 35.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.805; }
        frame 50 { x: 15.7; y: 35.1; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: 0.8; }
        frame 51 { x: 18; y: 33.3; skew-x: 1.8; skew-y: 1.8; scale-y: -10000; }
        frame 52 { x: 20.3; y: 31.4; skew-x: 3.6; skew-y: 3.6; }
        frame 53 { x: 22.6; y: 29.6; skew-x: 5.3; skew-y: 5.3; scale-x: 0.799; scale-y: 0.799; }
        frame 54 { x: 25.3; y: 27.6; skew-x: 7.2; skew-y: 7.2; scale-x: 0.8; scale-y: 0.8; }
        frame 55 { x: 18.6; y: 31.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 20.5; y: 29.8; skew-x: 2.3; skew-y: 2.3; }
        frame 57 { x: 22.4; y: 28.4; skew-x: 4.5; skew-y: 4.5; }
        frame 58 { x: 24.4; y: 27; skew-x: 7; skew-y: 7; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { x: 26.4; y: 25.7; skew-x: 9.3; skew-y: 9.3; scale-x: 0.8; scale-y: 0.8; }
        frame 60 { x: 27.4; y: 24.9; skew-x: 10.5; skew-y: 10.5; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: 28.2; y: 24.1; skew-x: 11.6; skew-y: 11.6; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 29.3; y: 23.2; skew-x: 12.8; skew-y: 12.8; }
        frame 63 { x: 30.2; y: 22.2; skew-x: 14.1; skew-y: 14.1; }
        frame 64 { x: 24.1; y: 25.3; skew-x: 9.5; skew-y: 9.5; }
        frame 65 { x: 18.2; y: 28.6; skew-x: 5; skew-y: 5; }
        frame 66 { x: 12.4; y: 32; skew-x: 0.5; skew-y: 0.5; }
        frame 67 { x: 15.7; y: 30.6; skew-x: 1.8; skew-y: 2; scale-y: 0.813; }
        frame 68 { x: 19.2; y: 29.1; skew-x: 3.3; skew-y: 3.9; scale-y: 0.827; }
        frame 69 { x: 20.9; y: 28.1; skew-x: 4.8; skew-y: 5.1; scale-y: 0.82; }
        frame 70 { x: 22.8; y: 27.3; skew-x: 6.3; skew-y: 6.5; scale-y: 0.813; }
        frame 71 { x: 24.5; y: 26.4; skew-x: 7.8; skew-y: 7.8; scale-y: 0.806; }
        frame 72 { x: 26.4; y: 25.7; skew-x: 9.3; skew-y: 9.3; scale-x: 0.8; scale-y: 0.8; }
        frame 73 { x: 27; y: 25.2; skew-x: 10; skew-y: 10; scale-x: 0.799; scale-y: 0.799; }
        frame 74 { x: 27.6; y: 24.6; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 28.2; y: 24.1; skew-x: 11.6; skew-y: 11.6; }
        frame 76 { x: 29; y: 23.4; skew-x: 12.5; skew-y: 12.5; }
        frame 77 { x: 29.6; y: 22.8; skew-x: 13.3; skew-y: 13.3; }
        frame 78 { x: 30.2; y: 22.2; skew-x: 14.1; skew-y: 14.1; }
        frame 79 { x: 21.7; y: 26.8; skew-x: 6.8; skew-y: 6.8; }
        frame 80 { x: 13.9; y: 31.7; skew-x: 0; skew-y: 0; }
        frame 81 { x: 6.5; y: 37.2; skew-x: -7.2; skew-y: -7.2; scale-x: 0.798; scale-y: 0.798; }
        frame 82 { x: 8.6; y: 36.1; skew-x: -5.9; skew-y: -5.5; scale-x: -10000; scale-y: 0.808; }
        frame 83 { x: 10.5; y: 35.1; skew-x: -4.7; skew-y: -4.1; scale-x: 0.799; scale-y: 0.818; }
        frame 84 { x: 12.6; y: 34.1; skew-x: -3.4; skew-y: -2.9; scale-x: -10000; scale-y: 0.813; }
        frame 85 { x: 14.6; y: 33.1; skew-x: -2.2; skew-y: -1.9; scale-y: 0.809; }
        frame 86 { x: 16.5; y: 32.1; skew-x: -0.9; skew-y: -0.9; scale-x: 0.8; scale-y: 0.804; }
        frame 87 { x: 18.6; y: 31.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.8; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 89 { x: 22.1; y: 31; skew-x: 3.3; skew-y: 3.3; }
        frame 90 { x: 25.8; y: 30.9; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 91 { x: 29.6; y: -10000; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 33.6; skew-x: 13.3; skew-y: 13.3; }
        frame 93 { x: 26.8; y: 30.4; skew-x: 11.3; skew-y: 11.3; }
        frame 94 { x: 20.3; y: 29.7; skew-x: 9.5; skew-y: 9.5; }
        frame 95 { x: 13.8; y: 29.2; skew-x: 7.8; skew-y: 7.8; }
        frame 96 { x: 7.2; y: 28.7; skew-x: 6; skew-y: 6; }
        frame 97 { x: 12.2; y: 32.5; skew-x: 13.5; skew-y: 13.5; scale-x: 0.798; scale-y: 0.798; }
        frame 98 { x: 17.7; y: 37.1; skew-x: 21; skew-y: 21; scale-x: 0.796; scale-y: 0.796; }
        frame 99 { x: 23.4; y: 42.4; skew-x: 28.6; skew-y: 28.6; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: -10000; y: 43.2; skew-x: 27.6; skew-y: 29.4; scale-x: 0.812; scale-y: 0.795; }
        frame 101 { y: 43.9; skew-x: 26.8; skew-y: 30.4; scale-x: 0.829; scale-y: 0.797; }
        frame 102 { x: 21.2; y: 41.8; skew-x: 25.8; skew-y: 27.6; scale-x: 0.812; scale-y: 0.795; }
        frame 103 { x: 19.1; y: 39.4; skew-x: 25.1; skew-y: 25.1; scale-x: 0.796; scale-y: 0.796; }
        frame 104 { x: 11; y: 42.9; skew-x: 16.8; skew-y: 17.3; scale-x: 0.8; scale-y: 0.795; }
        frame 105 { x: 3.1; y: 47.3; skew-x: 8.5; skew-y: 9.3; scale-x: 0.804; scale-y: -10000; }
        frame 106 { x: -3.7; y: 52.5; skew-x: 0.2; skew-y: 1.7; scale-x: 0.808; }
        frame 107 { x: -14.3; y: 61.6; skew-x: -13.2; skew-y: -13.2; scale-x: 0.795; scale-y: 0.817; }
        frame 108 { x: -16.8; y: 64.6; skew-x: -15.2; skew-y: -15.9; scale-x: 0.801; scale-y: 0.809; }
        frame 109 { x: -19.3; y: 67.7; skew-x: -17.2; skew-y: -18.8; scale-x: 0.809; scale-y: 0.802; }
        frame 110 { x: -17.6; y: 65.7; skew-x: -15.7; skew-y: -16.9; scale-x: 0.804; scale-y: 0.799; }
        frame 111 { x: -15.8; y: 63.6; skew-x: -14.4; skew-y: -15; scale-x: 0.799; scale-y: 0.796; }
        frame 112 { x: -14.1; y: 61.9; skew-x: -13.2; skew-y: -13.2; scale-x: 0.795; scale-y: 0.795; }
        frame 113 { x: -14.8; y: 62; skew-x: -14.4; skew-y: -14.4; scale-x: 0.794; scale-y: 0.794; }
        frame 114 { x: -15.5; y: 61.8; skew-x: -15.5; skew-y: -15.5; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: -16.5; y: 61.9; skew-x: -16.8; skew-y: -16.8; scale-x: 0.795; scale-y: 0.795; }
        frame 116 { x: -21.5; y: 67.3; skew-x: -22; skew-y: -22; scale-x: 0.793; scale-y: 0.793; }
        frame 117 { x: -26.2; y: 73.2; skew-x: -27.2; skew-y: -27.2; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: -30.6; y: 79; skew-x: -32.6; skew-y: -32.6; scale-x: 0.794; scale-y: 0.794; }
        frame 119 { x: -34.3; y: 95.1; skew-x: -46.8; skew-y: -46.8; scale-x: 0.792; scale-y: 0.792; }
        frame 120 { x: -35.4; y: 110.8; skew-x: -60.8; skew-y: -60.8; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: -34.1; y: 125.7; skew-x: -74.9; skew-y: -74.9; }
        frame 122 { x: -35; y: 126; skew-x: -74.3; skew-y: -75.6; scale-x: 0.773; scale-y: 0.804; }
        frame 123 { x: -36.1; y: 126.3; skew-x: -73.5; skew-y: -76.2; scale-x: 0.754; scale-y: 0.818; }
        frame 124 { x: -35.8; y: 123.8; skew-x: -71.8; skew-y: -73.6; scale-x: 0.767; scale-y: 0.808; }
        frame 125 { x: -10000; y: 121; skew-x: -69.9; skew-y: -70.7; scale-x: 0.781; scale-y: 0.799; }
        frame 126 { x: -34.8; y: 123.4; skew-x: -72.6; skew-y: -72.9; scale-x: 0.786; scale-y: 0.795; }
        frame 127 { x: -34.1; y: 125.7; skew-x: -74.9; skew-y: -74.9; scale-x: 0.792; scale-y: 0.792; }
        frame 128 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 129 { cel: -10000; }
        frame 146 { x: 35.8; y: 7.1; skew-x: 20.3; skew-y: 20.3; scale-x: 0.799; scale-y: 0.799; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 35.3; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 31.8; y: 11.6; skew-x: 16.3; skew-y: 16.3; scale-x: 0.798; scale-y: 0.798; }
        frame 167 { x: 28.1; y: 16.4; skew-x: 12.1; skew-y: 12.1; scale-x: 0.799; scale-y: 0.799; }
        frame 168 { x: 24.9; y: 21.1; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 21.6; y: 26.1; skew-x: 4; skew-y: 4; scale-x: 0.8; scale-y: 0.8; }
        frame 170 { x: 18.6; y: 31.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 18; y: 32.5; skew-x: -0.4; skew-y: -0.5; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { x: 17.2; y: 33.9; skew-x: -1.2; skew-y: -1.2; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: 16.5; y: 35.3; skew-x: -1.8; skew-y: -2.1; scale-x: 0.829; scale-y: 0.785; }
        frame 174 { x: 17; y: 34.1; skew-x: -1.2; skew-y: -1.4; scale-x: 0.821; scale-y: 0.789; }
        frame 175 { x: 17.6; y: 33.2; skew-x: -0.7; skew-y: -0.9; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: 18; y: 32.1; skew-x: -0.2; skew-y: -0.4; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: 18.6; y: 31.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 20.5; y: 30.6; skew-x: 2; skew-y: 2; }
        frame 181 { x: 22.4; y: 30; skew-x: 4; skew-y: 4; }
        frame 182 { x: 24.3; y: 29.5; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 183 { x: 26.3; y: 29; skew-x: 8.1; skew-y: 8.1; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: 28.5; y: 28.5; skew-x: 10.3; skew-y: 10.3; }
        frame 185 { x: 26.3; y: 29.1; skew-x: 8.6; skew-y: 8.6; }
        frame 186 { x: 24.3; y: 29.6; skew-x: 7; skew-y: 7; }
        frame 187 { x: 22.5; y: 29.9; skew-x: 5.5; skew-y: 5.5; }
        frame 188 { x: 20.3; y: 30.6; skew-x: 3.8; skew-y: 3.8; }
        frame 189 { x: 18.4; y: 31; skew-x: 2.3; skew-y: 2.3; }
        frame 190 { x: 16.5; y: 31.5; skew-x: 0.8; skew-y: 0.8; scale-x: 0.8; scale-y: 0.8; }
        frame 191 { x: 14.7; y: 32.1; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; }
        frame 192 { x: 12.8; y: 32.6; skew-x: -2.2; skew-y: -2.2; }
        frame 193 { x: 11; y: 33.3; skew-x: -3.7; skew-y: -3.7; }
        frame 194 { x: 9; y: 34; skew-x: -5.4; skew-y: -5.4; }
        frame 195 { x: 11; y: 33.3; skew-x: -4.2; skew-y: -4.2; }
        frame 196 { x: 12.8; y: 32.8; skew-x: -3.2; skew-y: -3.2; }
        frame 197 { x: 14.9; y: 32.2; skew-x: -2; skew-y: -2; }
        frame 198 { x: 16.6; y: 31.7; skew-x: -0.9; skew-y: -0.9; }
        frame 199 { x: 18.6; y: 31.3; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 200;
        frame 0 { x: 2; y: 11.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_HEAD; }
        frame 1 { x: 2.1; y: 11.1; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 2.4; y: 10.8; skew-x: 1.3; skew-y: 1.3; }
        frame 3 { x: 1.8; y: 11.7; skew-x: 0.8; skew-y: 0.8; }
        frame 4 { x: 1.3; y: 12.4; skew-x: 0.5; skew-y: 0.5; }
        frame 5 { x: 0.7; y: 13.3; skew-x: 0.3; skew-y: 0.3; }
        frame 6 { x: 0.2; y: 14.1; skew-x: 0; skew-y: 0; }
        frame 7 { x: -0.2; y: 14.9; skew-x: -0.2; skew-y: -0.2; }
        frame 8 { x: -0.7; y: 15.8; skew-x: -0.4; skew-y: -0.4; }
        frame 9 { x: -1.3; y: 16.6; skew-x: -0.9; skew-y: -0.9; }
        frame 10 { x: -1.8; y: 17.5; skew-x: -2.2; skew-y: -2.2; scale-x: 0.799; scale-y: 0.799; }
        frame 11 { x: -2.4; y: 18.3; skew-x: -3.5; skew-y: -3.5; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: -1.6; y: 17; skew-x: -2.7; skew-y: -2.7; scale-x: 0.799; scale-y: 0.799; }
        frame 13 { x: -0.9; y: 16; skew-x: -2.2; skew-y: -2.2; scale-x: 0.8; scale-y: 0.8; }
        frame 14 { x: -0.2; y: 14.8; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 0.5; y: 13.7; skew-x: -0.9; skew-y: -0.9; }
        frame 16 { x: 1.3; y: 12.6; skew-x: -0.4; skew-y: -0.4; }
        frame 17 { x: 2; y: 11.5; skew-x: 0; skew-y: 0; }
        frame 18 { x: 18.1; y: 1.7; skew-x: 16.3; skew-y: 16.3; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: 19.9; y: 1; skew-x: 17.8; skew-y: 17.8; scale-x: 0.798; scale-y: 0.798; }
        frame 20 { x: 21.8; y: 0.2; skew-x: 19.5; skew-y: 19.5; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 23.5; y: -0.5; skew-x: 21.1; skew-y: 21.1; }
        frame 22 { x: 25.4; y: -1.2; skew-x: 22.8; skew-y: 22.8; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 16.6; y: 3.8; skew-x: 16.3; skew-y: 16.3; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 7.9; y: 9.5; skew-x: 9.6; skew-y: 9.6; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -0.4; y: 15.4; skew-x: 3.1; skew-y: 3.1; }
        frame 26 { x: -8.5; y: 21.5; skew-x: -3.2; skew-y: -3.2; }
        frame 27 { x: -7.4; y: 20.8; skew-x: -3.9; skew-y: -3.9; scale-x: 0.797; scale-y: 0.797; }
        frame 28 { x: -6.6; y: 20.3; skew-x: -5; skew-y: -5; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: -4.5; y: 16.8; skew-x: -1.9; skew-y: -1.9; }
        frame 30 { x: -2.5; y: 13.3; skew-x: 0.7; skew-y: 0.7; scale-x: 0.798; scale-y: 0.798; }
        frame 31 { x: 0.1; y: 11.3; skew-x: 2.6; skew-y: 2.6; scale-x: 0.797; scale-y: 0.797; }
        frame 32 { x: 2.8; y: 9.2; skew-x: 4.5; skew-y: 4.5; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 5.6; y: 7.2; skew-x: 6.5; skew-y: 6.5; }
        frame 34 { x: 8.4; y: 5.2; skew-x: 8.6; skew-y: 8.6; }
        frame 35 { x: 11.2; y: 3.8; skew-x: 11.3; skew-y: 11.3; }
        frame 36 { x: 14; y: 2.4; skew-x: 13.8; skew-y: 13.8; scale-x: 0.796; scale-y: 0.796; }
        frame 37 { x: 16.9; y: 1; skew-x: 16.5; skew-y: 16.5; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 19.8; y: -0.1; skew-x: 19.2; skew-y: 19.2; scale-x: 0.797; scale-y: 0.797; }
        frame 39 { x: 22.1; y: -1.3; skew-x: 20.8; skew-y: 20.8; scale-x: 0.796; scale-y: 0.796; }
        frame 40 { x: 24.5; y: -2.5; skew-x: 22.6; skew-y: 22.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 26.8; y: -3.6; skew-x: 24.3; skew-y: 24.3; scale-x: 0.795; scale-y: 0.795; }
        frame 42 { x: 29.2; y: -4.9; skew-x: 26.3; skew-y: 26.3; scale-x: 0.796; scale-y: 0.796; }
        frame 43 { x: 19.3; y: 0.9; skew-x: 18.8; skew-y: 18.8; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 9.5; y: 7.3; skew-x: 11.3; skew-y: 11.3; scale-x: 0.797; scale-y: 0.797; }
        frame 45 { x: 0.2; y: 14.1; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: -8.5; y: 21.5; skew-x: -3.2; skew-y: -3.2; scale-x: 0.798; scale-y: 0.798; }
        frame 47 { x: -8.3; y: 22.3; skew-x: -6.4; skew-y: -6.4; scale-x: 0.797; scale-y: 0.797; }
        frame 48 { x: -10000; y: 23.1; skew-x: -9.7; skew-y: -9.7; scale-x: 0.798; scale-y: 0.798; }
        frame 49 { x: -5.2; y: 19.5; skew-x: -5.7; skew-y: -5.7; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: -2.1; y: 16.1; skew-x: -2; skew-y: -2; }
        frame 51 { x: 2.6; y: 12.3; skew-x: 2.5; skew-y: 2.5; }
        frame 52 { x: 7.7; y: 8.6; skew-x: 7; skew-y: 7; }
        frame 53 { x: 12.8; y: 5.1; skew-x: 11.5; skew-y: 11.5; }
        frame 54 { x: 18.1; y: 1.7; skew-x: 16.3; skew-y: 16.3; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 2; y: 11.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: 5.4; y: 9.1; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 8.8; y: 6.8; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 12.4; y: 4.5; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 16; y: 2.4; skew-x: 13.4; skew-y: 13.4; }
        frame 60 { x: 18.3; y: 1; skew-x: 15.8; skew-y: 15.8; }
        frame 61 { x: 20.5; y: -0.1; skew-x: 18.1; skew-y: 18.1; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: 22.8; y: -1.4; skew-x: 20.5; skew-y: 20.5; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 25.2; y: -2.8; skew-x: 22.9; skew-y: 22.9; scale-x: 0.799; scale-y: 0.799; }
        frame 64 { x: 13.9; y: 3.1; skew-x: 15; skew-y: 15; scale-x: 0.798; scale-y: 0.798; }
        frame 65 { x: 2.9; y: 9.8; skew-x: 7.1; skew-y: 7.1; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: -7.5; y: 16.7; skew-x: -0.5; skew-y: -0.5; scale-x: 0.797; scale-y: 0.797; }
        frame 67 { x: -3.2; y: 15; skew-x: 1.6; skew-y: 1.6; scale-x: 0.798; scale-y: 0.798; }
        frame 68 { x: 1.2; y: 13.2; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 4.8; y: 10.6; skew-x: 6.3; skew-y: 6.3; }
        frame 70 { x: 8.5; y: 7.8; skew-x: 8.6; skew-y: 8.6; }
        frame 71 { x: 12.3; y: 5.1; skew-x: 11; skew-y: 11; }
        frame 72 { x: 16; y: 2.4; skew-x: 13.4; skew-y: 13.4; scale-x: 0.799; scale-y: 0.799; }
        frame 73 { x: 18.1; y: 1.3; skew-x: 15.5; skew-y: 15.5; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 20.2; y: 0.1; skew-x: 17.6; skew-y: 17.6; scale-x: 0.798; scale-y: 0.798; }
        frame 75 { x: 22.4; y: -0.8; skew-x: 19.8; skew-y: 19.8; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 24.5; y: -1.9; skew-x: 22; skew-y: 22; }
        frame 77 { x: 26.6; y: -2.9; skew-x: 24.1; skew-y: 24.1; }
        frame 78 { x: 29; y: -4.1; skew-x: 26.4; skew-y: 26.4; scale-x: 0.799; scale-y: 0.799; }
        frame 79 { x: 13.6; y: 4.3; skew-x: 15; skew-y: 15; scale-x: 0.797; scale-y: 0.797; }
        frame 80 { x: -1.1; y: 13.8; skew-x: 3.6; skew-y: 3.6; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -15; y: 24.5; skew-x: -7.6; skew-y: -7.6; }
        frame 82 { x: -12.5; y: 23; skew-x: -6.2; skew-y: -6.2; }
        frame 83 { x: -10.1; y: 21.3; skew-x: -4.9; skew-y: -4.9; scale-x: 0.798; scale-y: 0.798; }
        frame 84 { x: -7; y: 18.9; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: -4.1; y: 16.4; skew-x: -2.4; skew-y: -2.4; scale-x: 0.799; scale-y: 0.799; }
        frame 86 { x: -1; y: 14; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 2; y: 11.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 89 { cel: -10000; }
        frame 146 { x: 17.7; y: -11.4; skew-x: 5.8; skew-y: 5.8; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 17.2; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 14.1; y: -6.7; skew-x: 4.5; skew-y: 4.5; }
        frame 167 { x: 11; y: -2.2; skew-x: 3.3; skew-y: 3.3; }
        frame 168 { x: 8; y: 2.2; skew-x: 2.3; skew-y: 2.3; }
        frame 169 { x: 4.9; y: 7; skew-x: 1; skew-y: 1; }
        frame 170 { x: 2; y: 11.5; skew-x: 0; skew-y: 0; }
        frame 171 { x: 0.9; y: 13.1; skew-x: -0.4; skew-y: -0.5; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { x: -0.1; y: 14.7; skew-x: -1.2; skew-y: -1.2; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: -1.2; y: 16.5; skew-x: -1.8; skew-y: -2.1; scale-x: 0.829; scale-y: 0.785; image: IMAGE_REANIM_ZOMBIE_DIGGER_HEAD2; }
        frame 174 { x: -0.3; y: 15.2; skew-x: -1.2; skew-y: -1.4; scale-x: 0.821; scale-y: 0.789; image: none; }
        frame 175 { x: 0.3; y: 13.9; skew-x: -0.7; skew-y: -0.9; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: 1.2; y: 12.7; skew-x: -0.2; skew-y: -0.4; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: 2; y: 11.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 5.7; y: 9.9; skew-x: 3.3; skew-y: 3.3; }
        frame 181 { x: 9.5; y: 8.3; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: 13.4; y: 6.9; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 17.5; y: 5.6; skew-x: 13.3; skew-y: 13.3; }
        frame 184 { x: 21.4; y: 4.2; skew-x: 16.6; skew-y: 16.6; }
        frame 185 { x: 20.4; y: 4.1; skew-x: 17.1; skew-y: 17.1; scale-x: 0.798; scale-y: 0.798; }
        frame 186 { x: 19.7; y: 3.8; skew-x: 17.8; skew-y: 17.8; scale-x: 0.799; scale-y: 0.799; }
        frame 187 { x: 14.9; y: 5.7; skew-x: 13.3; skew-y: 13.3; scale-x: 0.798; scale-y: 0.798; }
        frame 188 { x: 10.3; y: 7.8; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 5.6; y: 10.1; skew-x: 4.5; skew-y: 4.5; scale-x: 0.799; scale-y: 0.799; }
        frame 190 { x: 1.3; y: 12.4; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 191 { x: -2.8; y: 14.8; skew-x: -3.9; skew-y: -3.9; }
        frame 192 { x: -7; y: 17.5; skew-x: -8.4; skew-y: -8.4; }
        frame 193 { x: -11; y: 20.2; skew-x: -12.7; skew-y: -12.7; }
        frame 194 { x: -15; y: 23.1; skew-x: -17.2; skew-y: -17.2; }
        frame 195 { x: -13.4; y: 22.5; skew-x: -16.7; skew-y: -16.7; scale-x: 0.798; scale-y: 0.798; }
        frame 196 { x: -11.8; y: 21.9; skew-x: -16.2; skew-y: -16.2; scale-x: 0.799; scale-y: 0.799; }
        frame 197 { x: -7.4; y: 18.2; skew-x: -10.7; skew-y: -10.7; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: -2.7; y: 14.6; skew-x: -5.2; skew-y: -5.2; }
        frame 199 { x: 2; y: 11.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_digger_head_eye";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 173 { x: -1.6; y: 16.1; skew-x: -1.8; skew-y: -2.1; scale-x: 0.829; scale-y: 0.785; cel: 0; image: IMAGE_REANIM_ZOMBIE_DIGGER_HEAD_EYE; }
        frame 174 { x: -0.8; y: 14.7; skew-x: -1.2; skew-y: -1.4; scale-x: 0.821; scale-y: 0.789; cel: -10000; image: none; }
        frame 175 { x: 0; y: 13.5; skew-x: -0.7; skew-y: -0.9; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: 0.7; y: 12.2; skew-x: -0.2; skew-y: -0.4; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: 1.6; y: 11.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 2.8; y: 9.1; }
        frame 181 { x: 4.1; y: 7.2; }
        frame 182 { x: 5; y: 8.6; }
        frame 183 { x: 5.8; y: 10.1; }
        frame 184 { x: 8.2; y: 12; }
        frame 185 { x: 7.8; y: 13.8; }
        frame 186 { x: 7.6; y: 14.7; }
        frame 187 { x: 7.3; y: 15.6; }
        frame 188 { x: 7.8; y: 15.2; }
        frame 189 { x: 6.8; y: 13.3; }
        frame 190 { x: 4.3; y: 12; }
        frame 191 { x: 1.8; y: 10.6; }
        frame 192 { x: -2.4; y: 10; }
        frame 193 { x: -6.8; y: 9.3; }
        frame 194 { x: -9.3; y: 10; }
        frame 195 { x: -11.8; y: 10.6; }
        frame 196 { x: -10.4; y: 12.1; }
        frame 197 { x: -9; y: 13.6; }
        frame 198 { x: -3.5; y: 12.2; }
        frame 199 { x: 1.8; y: 10.8; }
    }
    Track {
        source-name: "Zombie_digger_head_eye";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 173 { x: -17.9; y: 22.3; skew-x: -1.8; skew-y: -2.1; scale-x: 0.663; scale-y: 0.628; cel: 0; image: IMAGE_REANIM_ZOMBIE_DIGGER_HEAD_EYE; }
        frame 174 { x: -17; y: 20.9; skew-x: -1.2; skew-y: -1.4; scale-x: 0.657; scale-y: 0.631; cel: -10000; image: none; }
        frame 175 { x: -16; y: 19.5; skew-x: -0.7; skew-y: -0.9; scale-x: 0.651; scale-y: 0.634; }
        frame 176 { x: -15.1; y: 18.1; skew-x: -0.2; skew-y: -0.4; scale-x: 0.646; scale-y: 0.637; }
        frame 177 { x: -14.2; y: 16.9; skew-x: 0; skew-y: 0; scale-x: 0.64; scale-y: 0.64; }
        frame 178 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: -10; y: 16; }
        frame 181 { x: -5.7; y: 15.1; }
        frame 182 { x: -4; y: 12.8; }
        frame 183 { x: -2.2; y: 10.4; }
        frame 184 { x: -2.5; y: 8.9; }
        frame 185 { x: -4.2; y: 9.8; }
        frame 186 { x: -6; y: 10.6; }
        frame 187 { x: -8.3; y: 13.8; }
        frame 188 { x: -10.7; y: 16.9; }
        frame 189 { x: -12; y: 19.3; }
        frame 190 { x: -13.2; y: 21.6; }
        frame 191 { x: -14.3; y: 22.3; }
        frame 192 { x: -15.5; y: 22.9; }
        frame 193 { x: -18; y: 23.1; }
        frame 194 { x: -21.5; y: 23.9; }
        frame 195 { x: -21.3; y: 23.3; }
        frame 196 { x: -21.2; y: 22.6; }
        frame 197 { x: -20; y: 21.1; }
        frame 198 { x: -18.7; y: 19.6; }
        frame 199 { x: -14.2; y: 16.9; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 200;
        frame 0 { x: 8.7; y: 44.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_JAW; }
        frame 1 { x: 8.6; y: 43.6; skew-x: 0.3; skew-y: 0.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 8.5; y: 43.3; skew-x: 0.5; skew-y: 1.3; }
        frame 3 { x: 8.1; y: 44.5; skew-x: 0; skew-y: 0.8; }
        frame 4 { x: 7.7; y: 45.8; skew-x: -0.7; skew-y: 0.5; }
        frame 5 { x: 7.3; y: 47; skew-x: -1.2; skew-y: 0.3; }
        frame 6 { x: 6.9; y: 48.3; skew-x: -1.9; skew-y: 0; }
        frame 7 { x: 6.5; y: 49.6; skew-x: -2.7; skew-y: -0.2; }
        frame 8 { x: 6.2; y: 50.8; skew-x: -3.2; skew-y: -0.4; }
        frame 9 { x: 5.8; y: 52; skew-x: -4; skew-y: -0.9; scale-x: 0.801; }
        frame 10 { x: 6.1; y: 52.9; skew-x: -4.9; skew-y: -2.2; scale-x: 0.8; scale-y: 0.799; }
        frame 11 { x: 6.4; y: 53.6; skew-x: -5.9; skew-y: -3.5; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 6.8; y: 52; skew-x: -4.9; skew-y: -2.7; }
        frame 13 { x: 7.2; y: 50.4; skew-x: -3.9; skew-y: -2.2; scale-y: 0.8; }
        frame 14 { x: 7.5; y: 48.8; skew-x: -2.9; skew-y: -1.7; scale-y: -10000; }
        frame 15 { x: 7.9; y: 47.1; skew-x: -1.9; skew-y: -0.9; }
        frame 16 { x: 8.3; y: 45.6; skew-x: -0.9; skew-y: -0.4; }
        frame 17 { x: 8.7; y: 44.1; skew-x: 0; skew-y: 0; }
        frame 18 { x: 15.1; y: 38.6; skew-x: 11.6; skew-y: 16.3; scale-x: 0.802; scale-y: 0.799; }
        frame 19 { x: 15.9; y: 38.1; skew-x: 12.5; skew-y: 17.3; scale-x: 0.801; scale-y: 0.798; }
        frame 20 { x: 16.7; y: 37.4; skew-x: 13.6; skew-y: 18.3; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 17.4; y: 36.7; skew-x: 14.8; skew-y: 19.3; }
        frame 22 { x: 18.2; y: 36.1; skew-x: 15.8; skew-y: 20.5; scale-x: 0.802; scale-y: 0.799; }
        frame 23 { x: 13.5; y: 40.1; skew-x: 10.8; skew-y: 15.5; scale-x: 0.801; scale-y: 0.817; }
        frame 24 { x: 8.8; y: 44.1; skew-x: 5.8; skew-y: 10.3; scale-x: -10000; scale-y: 0.837; }
        frame 25 { x: 4.1; y: 48.1; skew-x: 0.8; skew-y: 5.3; scale-y: 0.856; }
        frame 26 { x: -0.5; y: 52.3; skew-x: -4.1; skew-y: 0.5; scale-x: 0.8; scale-y: 0.875; }
        frame 27 { x: 0.8; y: 52.9; skew-x: -6.2; skew-y: -0.4; scale-x: 0.802; scale-y: -10000; }
        frame 28 { x: 2.1; y: 53.6; skew-x: -8.5; skew-y: -1.4; scale-x: 0.804; }
        frame 29 { x: 2.7; y: 50.3; skew-x: -6.7; skew-y: 1.5; scale-x: 0.807; }
        frame 30 { x: 3.1; y: 47; skew-x: -5.3; skew-y: 4.5; scale-x: 0.809; }
        frame 31 { x: 4.8; y: 45.3; skew-x: -1.9; skew-y: 6.3; scale-x: 0.803; }
        frame 32 { x: 6.5; y: 43.6; skew-x: 1; skew-y: 8.3; scale-x: 0.798; }
        frame 33 { x: 8.3; y: 41.8; skew-x: 4.3; skew-y: 10.3; scale-x: 0.792; scale-y: 0.874; }
        frame 34 { x: 10.1; y: 40.1; skew-x: 7.7; skew-y: 12.4; scale-x: 0.786; scale-y: 0.875; }
        frame 35 { x: 11.4; y: 38.6; skew-x: 10.3; skew-y: 15; scale-x: 0.789; scale-y: 0.874; }
        frame 36 { x: 12.8; y: 37.4; skew-x: 12.8; skew-y: 17.6; scale-x: 0.792; scale-y: -10000; }
        frame 37 { x: 14.2; y: 36.1; skew-x: 15.5; skew-y: 20.3; scale-x: 0.795; scale-y: 0.873; }
        frame 38 { x: 15.5; y: 34.8; skew-x: 18.3; skew-y: 23; scale-x: 0.799; scale-y: 0.874; }
        frame 39 { x: 16.8; y: 33.4; skew-x: 20; skew-y: 24.6; scale-x: 0.798; scale-y: 0.873; }
        frame 40 { x: 18.1; y: 32; skew-x: 21.8; skew-y: 26.3; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 19.4; y: 30.7; skew-x: 23.5; skew-y: 28.3; }
        frame 42 { x: 20.6; y: 29.3; skew-x: 25.3; skew-y: 30; scale-x: 0.799; scale-y: 0.874; }
        frame 43 { x: 15.1; y: 34.8; skew-x: 17.8; skew-y: 22.6; scale-x: 0.798; scale-y: 0.873; }
        frame 44 { x: 9.7; y: 40.6; skew-x: 10.5; skew-y: 15.1; scale-x: 0.799; scale-y: 0.874; }
        frame 45 { x: 4.4; y: 46.4; skew-x: 3; skew-y: 7.8; scale-x: 0.8; scale-y: 0.875; }
        frame 46 { x: -0.5; y: 52.3; skew-x: -4.1; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 1.4; y: 53.6; skew-x: -7.2; skew-y: -2.9; scale-y: 0.866; }
        frame 48 { x: 3.4; y: 55.1; skew-x: -10.5; skew-y: -6.7; scale-x: 0.799; scale-y: 0.856; }
        frame 49 { x: 4.5; y: 52.9; skew-x: -8; skew-y: -4.9; scale-x: -10000; scale-y: 0.846; }
        frame 50 { x: 5.6; y: 50.5; skew-x: -5.8; skew-y: -3.3; scale-x: 0.8; scale-y: 0.837; }
        frame 51 { x: 7.9; y: 47.4; skew-x: -1.4; skew-y: 1.5; scale-x: -10000; scale-y: 0.828; }
        frame 52 { x: 10.1; y: 44.6; skew-x: 2.8; skew-y: 6.3; scale-x: 0.801; scale-y: 0.818; }
        frame 53 { x: 12.5; y: 41.6; skew-x: 7.1; skew-y: 11.3; scale-x: -10000; scale-y: 0.808; }
        frame 54 { x: 15.1; y: 38.6; skew-x: 11.6; skew-y: 16.3; scale-x: 0.802; scale-y: 0.799; }
        frame 55 { x: 8.7; y: 44.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: 10.2; y: 42.6; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 11.7; y: 41.1; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 13.3; y: 39.6; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 14.9; y: 38.2; skew-x: 13.4; skew-y: 13.4; }
        frame 60 { x: 15.5; y: 37.4; skew-x: 13.3; skew-y: 15; scale-x: 0.8; }
        frame 61 { x: 16.1; y: 36.6; skew-x: -10000; skew-y: 16.8; scale-x: 0.801; scale-y: 0.798; }
        frame 62 { x: 16.7; y: 35.7; skew-y: 18.3; scale-x: 0.803; scale-y: -10000; }
        frame 63 { x: 17.4; y: 34.8; skew-y: 20.2; scale-x: 0.805; scale-y: 0.799; }
        frame 64 { x: 10.4; y: 39.1; skew-x: 7.5; skew-y: 12.3; scale-x: 0.83; scale-y: 0.816; }
        frame 65 { x: 3.3; y: 43.6; skew-x: 1.6; skew-y: 4.3; scale-x: 0.855; scale-y: 0.834; }
        frame 66 { x: -3.5; y: 48.1; skew-x: -4; skew-y: -3.3; scale-x: 0.881; scale-y: 0.851; }
        frame 67 { x: -0.9; y: 46.1; skew-x: -1.2; skew-y: -2.4; scale-x: 0.888; scale-y: 0.843; }
        frame 68 { x: 1.8; y: 44.1; skew-x: 1.6; skew-y: -1.8; scale-x: 0.895; scale-y: 0.835; }
        frame 69 { x: 4.8; y: 41.6; skew-x: 4.3; skew-y: 1.8; scale-x: 0.888; scale-y: 0.826; }
        frame 70 { x: 7.8; y: 39.1; skew-x: 7.3; skew-y: 5.6; scale-x: 0.883; scale-y: 0.817; }
        frame 71 { x: 11.6; y: 37.3; skew-x: 10.3; skew-y: 9.3; scale-x: 0.871; scale-y: 0.808; }
        frame 72 { x: 15.2; y: 35.6; skew-x: 13.4; skew-y: 13.4; scale-x: 0.86; scale-y: 0.799; }
        frame 73 { x: 15.7; y: 35.3; skew-x: 13.3; skew-y: 14.5; scale-x: 0.85; scale-y: -10000; }
        frame 74 { x: 16.1; y: 35.1; skew-x: -10000; skew-y: 15.5; scale-x: 0.841; scale-y: 0.798; }
        frame 75 { x: 16.6; y: 34.6; skew-y: 16.8; scale-x: 0.832; scale-y: -10000; }
        frame 76 { x: 17.1; y: 34.4; skew-y: 17.8; scale-x: 0.822; }
        frame 77 { x: 17.6; y: 34; skew-y: 19; scale-x: 0.813; }
        frame 78 { x: 18.2; y: 33.6; skew-y: 20.2; scale-x: 0.805; scale-y: 0.799; }
        frame 79 { x: 9.5; y: 40.6; skew-x: 5; skew-y: 9.8; scale-x: 0.83; scale-y: 0.816; }
        frame 80 { x: 1; y: 47.7; skew-x: -2.7; skew-y: -0; scale-x: 0.855; scale-y: 0.834; }
        frame 81 { x: -7.1; y: 55.2; skew-x: -11; skew-y: -10.3; scale-x: 0.88; scale-y: 0.851; }
        frame 82 { x: -5.9; y: 53.5; skew-x: -9; skew-y: -8.4; scale-x: 0.916; scale-y: 0.842; }
        frame 83 { x: -4.7; y: 51.6; skew-x: -7.2; skew-y: -6.7; scale-x: 0.952; scale-y: 0.834; }
        frame 84 { x: -1.4; y: 49.4; skew-x: -5.2; skew-y: -4.9; scale-x: 0.914; scale-y: 0.825; }
        frame 85 { x: 1.6; y: 47.2; skew-x: -3.4; skew-y: -3.2; scale-x: 0.876; scale-y: 0.817; }
        frame 86 { x: 5.2; y: 45.6; skew-x: -1.7; skew-y: -1.4; scale-x: 0.838; scale-y: 0.808; }
        frame 87 { x: 8.7; y: 44.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 89 { cel: -10000; }
        frame 146 { x: 21.1; y: 21.6; skew-x: 5.8; skew-y: 5.8; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 20.6; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 18.2; y: 26.2; skew-x: 4.5; skew-y: 4.5; }
        frame 167 { x: 15.8; y: 30.7; skew-x: 3.3; skew-y: 3.3; }
        frame 168 { x: 13.4; y: 35.1; skew-x: 2.3; skew-y: 2.3; }
        frame 169 { x: 11; y: 39.6; skew-x: 1; skew-y: 1; }
        frame 170 { x: 8.7; y: 44.1; skew-x: 0; skew-y: 0; }
        frame 171 { x: 8; y: 45.3; skew-x: -0.4; skew-y: -0.5; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { x: 7.4; y: 46.8; skew-x: -1.2; skew-y: -1.2; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: 6.8; y: 48.1; skew-x: -1.8; skew-y: -2.1; scale-x: 0.829; scale-y: 0.785; }
        frame 174 { x: 7.3; y: 47.1; skew-x: -1.2; skew-y: -1.4; scale-x: 0.821; scale-y: 0.789; }
        frame 175 { x: 7.8; y: 46.1; skew-x: -0.7; skew-y: -0.9; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: 8.1; y: 45.1; skew-x: -0.2; skew-y: -0.4; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: 8.7; y: 44.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 10.6; y: 43.1; skew-x: 3.3; skew-y: 3.3; }
        frame 181 { x: 12.5; y: 42.1; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: 14.4; y: 41.1; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 16.5; y: 40.3; skew-x: 13.3; skew-y: 13.3; }
        frame 184 { x: 18.6; y: 39.4; skew-x: 16.6; skew-y: 16.6; }
        frame 185 { x: 17.3; y: 39.7; skew-x: 17.1; skew-y: 17.1; scale-x: 0.798; scale-y: 0.798; }
        frame 186 { x: 16; y: 40; skew-x: 17.8; skew-y: 17.8; scale-x: 0.799; scale-y: 0.799; }
        frame 187 { x: 13.9; y: 41.7; skew-x: 13.3; skew-y: 13.3; scale-x: 0.798; scale-y: 0.798; }
        frame 188 { x: 11.9; y: 43.4; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 9.9; y: 45.3; skew-x: 4.5; skew-y: 4.5; scale-x: 0.799; scale-y: 0.799; }
        frame 190 { x: 8; y: 47.1; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 191 { x: 6.2; y: 48.9; skew-x: -3.9; skew-y: -3.9; }
        frame 192 { x: 4.4; y: 50.8; skew-x: -8.4; skew-y: -8.4; }
        frame 193 { x: 2.6; y: 52.6; skew-x: -12.7; skew-y: -12.7; }
        frame 194 { x: 1; y: 54.6; skew-x: -17.2; skew-y: -17.2; }
        frame 195 { x: 1.6; y: 53.9; skew-x: -16.7; skew-y: -16.7; scale-x: 0.798; scale-y: 0.798; }
        frame 196 { x: 2; y: 53.3; skew-x: -16.2; skew-y: -16.2; scale-x: 0.799; scale-y: 0.799; }
        frame 197 { x: 4.2; y: 50.1; skew-x: -10.7; skew-y: -10.7; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 6.4; y: 47.1; skew-x: -5.2; skew-y: -5.2; }
        frame 199 { x: 8.7; y: 44.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_digger_outerleg_foot";
        frame-count: 200;
        frame 0 { x: 42.1; y: 117.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_OUTERLEG_FOOL; }
        frame 1 { x: -10000; y: -10000; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 42; y: 117.6; skew-x: -0.4; skew-y: -0.4; }
        frame 3 { x: -10000; y: -10000; skew-x: -0.7; skew-y: -0.7; }
        frame 4 { x: 42; y: 117.7; skew-x: -0.9; skew-y: -0.9; }
        frame 5 { x: -10000; y: -10000; skew-x: -1.2; skew-y: -1.2; }
        frame 6 { y: 117.8; skew-x: -1.4; skew-y: -1.4; }
        frame 7 { x: 41.9; y: -10000; skew-x: -1.7; skew-y: -1.7; }
        frame 8 { x: 41.8; y: 117.9; skew-x: -2.2; skew-y: -2.2; }
        frame 9 { x: -10000; y: -10000; skew-x: -2.4; skew-y: -2.4; }
        frame 10 { x: 41.9; skew-x: -2; skew-y: -2; }
        frame 11 { x: -10000; y: 117.8; skew-x: -1.7; skew-y: -1.7; }
        frame 12 { y: 117.7; skew-x: -1.4; skew-y: -1.4; }
        frame 13 { y: -10000; skew-x: -1.2; skew-y: -1.2; }
        frame 14 { x: 42; y: 117.6; skew-x: -0.7; skew-y: -0.7; }
        frame 15 { y: -10000; skew-x: -0.4; skew-y: -0.4; }
        frame 16 { x: -10000; y: 117.5; skew-x: -0.2; skew-y: -0.2; }
        frame 17 { x: 42.1; y: -10000; skew-x: 0; skew-y: 0; }
        frame 18 { x: 40.6; y: 121.1; skew-x: -21.1; skew-y: -21.1; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: 35.5; y: 118.9; skew-x: -13.2; skew-y: -13.2; scale-x: 0.798; scale-y: 0.798; }
        frame 20 { x: 30.8; y: 116.6; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 26.3; y: 114.6; skew-x: 2.5; skew-y: 2.5; }
        frame 22 { x: 22.2; y: 112.7; skew-x: 10.4; skew-y: 10.4; }
        frame 23 { x: 21.3; y: 114.1; skew-x: 6.8; skew-y: 6.8; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: 20.5; y: 115.4; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 19.7; y: 116.8; skew-x: 0; skew-y: 0; }
        frame 26 { x: 19; y: 118.2; skew-x: -3.5; skew-y: -3.5; }
        frame 27 { x: 20.7; y: 117.9; skew-x: -2.5; skew-y: -2.5; scale-x: 0.798; scale-y: 0.798; }
        frame 28 { x: 22.3; y: 117.8; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 24; y: 117.6; skew-x: -0.7; skew-y: -0.7; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: 25.5; y: 117.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 31 { x: 28.1; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 30.7; }
        frame 33 { x: 33.3; }
        frame 34 { x: 35.9; }
        frame 35 { x: 38.5; y: 118.4; skew-x: -3.2; skew-y: -3.2; }
        frame 36 { x: 40.9; y: 119.3; skew-x: -6.7; skew-y: -6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 37 { x: 43.5; y: 120.2; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 46.1; y: 121.2; skew-x: -13.4; skew-y: -13.4; }
        frame 39 { x: 47.6; y: 121.7; skew-x: -16.7; skew-y: -16.7; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 49.2; y: 122.2; skew-x: -20.2; skew-y: -20.2; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 50.8; y: 122.8; skew-x: -23.7; skew-y: -23.7; }
        frame 42 { x: 52.5; y: 123.3; skew-x: -27.2; skew-y: -27.2; }
        frame 43 { x: 53; y: 123.8; skew-x: -31.7; skew-y: -31.7; scale-x: 0.797; scale-y: 0.797; }
        frame 44 { x: 53.5; y: 124.3; skew-x: -36.2; skew-y: -36.2; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 54.1; y: 124.8; skew-x: -40.8; skew-y: -40.8; }
        frame 46 { x: 54.9; y: 125.3; skew-x: -45.3; skew-y: -45.3; scale-x: 0.798; scale-y: 0.798; }
        frame 47 { x: 53.1; y: 124.8; skew-x: -42.3; skew-y: -42.3; scale-x: 0.796; scale-y: 0.796; }
        frame 48 { x: 51.1; y: 124.3; skew-x: -39.2; skew-y: -39.2; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 49.3; y: 123.7; skew-x: -36.2; skew-y: -36.2; }
        frame 50 { x: 47.5; y: 123.3; skew-x: -33.2; skew-y: -33.2; scale-x: 0.797; scale-y: 0.797; }
        frame 51 { x: 45.7; y: 122.8; skew-x: -30.2; skew-y: -30.2; scale-x: 0.796; scale-y: 0.796; }
        frame 52 { x: 44; y: 122.2; skew-x: -27; skew-y: -27; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 42.3; y: 121.6; skew-x: -24; skew-y: -24; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: 40.6; y: 121.1; skew-x: -21.1; skew-y: -21.1; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 42.1; y: 117.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: 41.9; y: 117.8; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 41.8; y: 118; skew-x: -2.7; skew-y: -2.7; }
        frame 58 { x: 41.6; y: 118.4; skew-x: -4.2; skew-y: -4.2; }
        frame 59 { x: 41.5; y: 118.7; skew-x: -5.7; skew-y: -5.7; }
        frame 60 { x: 41.4; y: 118.9; skew-x: -6.7; skew-y: -6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: 41.3; y: 119; skew-x: -7.7; skew-y: -7.7; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 41.1; y: 119.3; skew-x: -8.9; skew-y: -8.9; }
        frame 63 { x: 41; y: 119.5; skew-x: -10; skew-y: -10; scale-x: 0.8; scale-y: 0.8; }
        frame 64 { x: 40.5; y: 119.9; skew-x: -12.2; skew-y: -12.2; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: 40.1; y: 120.3; skew-x: -14.2; skew-y: -14.2; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 39.6; y: 120.7; skew-x: -16.5; skew-y: -16.5; }
        frame 67 { x: 39.9; y: 120.3; skew-x: -14.7; skew-y: -14.7; }
        frame 68 { x: 40.2; y: 120; skew-x: -12.9; skew-y: -12.9; }
        frame 69 { x: 40.5; y: 119.6; skew-x: -11; skew-y: -11; }
        frame 70 { x: 40.8; y: 119.2; skew-x: -9.2; skew-y: -9.2; }
        frame 71 { x: 41.1; y: 119; skew-x: -7.4; skew-y: -7.4; }
        frame 72 { x: 41.5; y: 118.7; skew-x: -5.7; skew-y: -5.7; scale-x: 0.8; scale-y: 0.8; }
        frame 73 { x: 41.4; y: 118.9; skew-x: -6.4; skew-y: -6.4; scale-x: 0.799; scale-y: 0.799; }
        frame 74 { x: 41.3; y: -10000; skew-x: -7; skew-y: -7; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -10000; y: 119; skew-x: -7.7; skew-y: -7.7; }
        frame 76 { x: 41.2; y: 119.2; skew-x: -8.4; skew-y: -8.4; }
        frame 77 { x: 41.1; y: 119.3; skew-x: -9.2; skew-y: -9.2; }
        frame 78 { x: 41; y: 119.5; skew-x: -10; skew-y: -10; scale-x: 0.8; scale-y: 0.8; }
        frame 79 { x: 40.6; y: 119.8; skew-x: -11.7; skew-y: -11.7; scale-x: 0.799; scale-y: 0.799; }
        frame 80 { x: 40.2; y: 120.1; skew-x: -13.7; skew-y: -13.7; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 39.9; y: 120.4; skew-x: -15.5; skew-y: -15.5; }
        frame 82 { x: 40.1; y: 119.9; skew-x: -12.9; skew-y: -12.9; }
        frame 83 { x: 40.5; y: 119.4; skew-x: -10.2; skew-y: -10.2; }
        frame 84 { x: 40.9; y: 118.9; skew-x: -7.7; skew-y: -7.7; }
        frame 85 { x: 41.3; y: 118.4; skew-x: -5; skew-y: -5; }
        frame 86 { x: 41.7; y: 117.9; skew-x: -2.4; skew-y: -2.4; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: 42.1; y: 117.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 89 { x: 42; y: 117.7; skew-x: -1; skew-y: -1; }
        frame 90 { x: 41.8; y: 117.9; skew-x: -2.2; skew-y: -2.2; }
        frame 91 { x: 41.6; y: 118.1; skew-x: -3.4; skew-y: -3.4; }
        frame 92 { x: 41.5; y: 118.4; skew-x: -4.7; skew-y: -4.7; }
        frame 93 { x: 41.1; y: 119; skew-x: -8.7; skew-y: -8.7; scale-x: 0.799; scale-y: 0.799; }
        frame 94 { x: -10000; y: 119.5; skew-x: -12.5; skew-y: -12.5; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 40.9; y: 120.1; skew-x: -16.4; skew-y: -16.4; }
        frame 96 { x: 40.8; y: 120.8; skew-x: -20.5; skew-y: -20.5; }
        frame 97 { x: 41.8; y: 122.7; skew-x: -29.9; skew-y: -33.3; scale-x: 0.802; scale-y: 0.797; }
        frame 98 { x: 43.4; y: 124.8; skew-x: -39.3; skew-y: -46.3; scale-x: 0.805; scale-y: -10000; }
        frame 99 { x: 45.5; y: 127; skew-x: -48.7; skew-y: -59.1; scale-x: 0.811; }
        frame 100 { x: -10000; y: -10000; skew-x: -48.8; skew-y: -10000; scale-x: 0.809; scale-y: 0.796; }
        frame 101 { skew-x: -48.7; scale-x: 0.811; scale-y: 0.797; }
        frame 102 { x: 45.1; y: 126.4; skew-x: -47; skew-y: -57.3; scale-x: 0.809; scale-y: 0.796; }
        frame 103 { x: 44.6; y: 126; skew-x: -45.2; skew-y: -55.5; scale-x: 0.81; scale-y: 0.797; }
        frame 104 { x: 45.1; y: 126.4; skew-x: -46.5; skew-y: -56.8; scale-x: 0.809; scale-y: 0.796; }
        frame 105 { x: 45.3; y: 126.7; skew-x: -47.6; skew-y: -57.8; scale-x: 0.808; scale-y: -10000; }
        frame 106 { x: 45.5; y: 127; skew-x: -48.8; skew-y: -59.1; scale-x: 0.809; }
        frame 107 { x: -10000; y: -10000; skew-x: -48.7; skew-y: -10000; scale-x: 0.811; scale-y: 0.797; }
        frame 108 { x: 45.9; y: 127.2; skew-x: -48.1; skew-y: -59.6; scale-x: 0.808; scale-y: 0.8; }
        frame 109 { x: 46.3; y: 127.4; skew-x: -47.5; skew-y: -60.2; scale-x: -10000; scale-y: 0.806; }
        frame 110 { x: 45.9; y: 127.2; skew-x: -47.8; skew-y: -59.8; scale-x: 0.807; scale-y: 0.802; }
        frame 111 { x: 45.6; y: 127.1; skew-x: -48.3; skew-y: -59.6; scale-x: 0.808; scale-y: 0.799; }
        frame 112 { x: 45.5; y: 127; skew-x: -48.7; skew-y: -59.1; scale-x: 0.811; scale-y: 0.797; }
        frame 113 { x: -10000; y: -10000; skew-x: -48.8; skew-y: -10000; scale-x: 0.809; scale-y: 0.796; }
        frame 114 { skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 115 { skew-x: -48.7; scale-x: 0.811; scale-y: 0.797; }
        frame 116 { x: 45.2; y: 126.4; skew-x: -46.8; skew-y: -57.3; scale-x: 0.809; scale-y: 0.796; }
        frame 117 { x: 45.1; y: 125.9; skew-x: -45; skew-y: -55.3; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: 44.9; y: 125.4; skew-x: -43.2; skew-y: -53.5; scale-x: 0.81; scale-y: 0.797; }
        frame 119 { x: 44.8; y: 125.2; skew-x: -41.5; skew-y: -51.8; scale-x: 0.808; scale-y: 0.795; }
        frame 120 { x: 44.6; y: 124.9; skew-x: -39.7; skew-y: -50; scale-x: 0.809; scale-y: 0.796; }
        frame 121 { x: 45.5; y: 127; skew-x: -48.7; skew-y: -59.1; scale-x: 0.811; scale-y: 0.797; }
        frame 122 { x: 46; y: 127.3; skew-x: -47.5; skew-y: -60.3; scale-x: 0.804; scale-y: 0.802; }
        frame 123 { x: 46.4; y: 127.5; skew-x: -46.1; skew-y: -61.3; scale-x: 0.8; scale-y: 0.809; }
        frame 124 { x: 48; y: 127.9; skew-x: -57.3; skew-y: -70.1; scale-x: 0.803; scale-y: 0.802; }
        frame 125 { x: 50.1; y: -10000; skew-x: -68.4; skew-y: -78.7; scale-x: 0.81; scale-y: 0.797; }
        frame 126 { x: 49.1; y: 127.7; skew-x: -58.6; skew-y: -68.9; scale-x: 0.809; scale-y: 0.796; }
        frame 127 { x: 48.3; y: 127; skew-x: -48.7; skew-y: -59.1; scale-x: 0.811; scale-y: 0.797; }
        frame 128 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 129 { cel: -10000; }
        frame 146 { x: 34.8; y: 114.4; skew-x: -33.2; skew-y: -33.2; scale-x: 0.797; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 34.3; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 35.4; y: 114.9; skew-x: -26.5; skew-y: -26.5; }
        frame 167 { x: 36.7; y: 115.4; skew-x: -19.7; skew-y: -19.7; }
        frame 168 { x: 38.3; y: 116.1; skew-x: -13.2; skew-y: -13.2; scale-x: 0.798; scale-y: 0.798; }
        frame 169 { x: 40.1; y: 116.6; skew-x: -6.4; skew-y: -6.4; scale-x: 0.799; scale-y: 0.799; }
        frame 170 { x: 42.1; y: 117.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 171 { x: 42.3; y: 117.6; skew-x: -10000; skew-y: -10000; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { x: 42.4; y: 117.7; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: 42.6; y: 117.8; scale-x: 0.829; scale-y: 0.785; }
        frame 174 { x: 42.5; y: 117.7; scale-x: 0.822; scale-y: 0.789; }
        frame 175 { x: 42.3; y: -10000; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: 42.2; y: 117.6; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: 42.1; y: 117.5; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 42; y: 117.7; skew-x: -0.9; skew-y: -0.9; }
        frame 181 { x: 41.8; y: 117.9; skew-x: -2.2; skew-y: -2.2; }
        frame 182 { x: 41.7; y: 118.1; skew-x: -3.2; skew-y: -3.2; }
        frame 183 { x: 41.6; y: 118.3; skew-x: -4.4; skew-y: -4.4; }
        frame 184 { x: 41.4; y: 118.6; skew-x: -5.7; skew-y: -5.7; }
        frame 185 { x: -10000; y: -10000; skew-x: -6.2; skew-y: -6.2; scale-x: 0.799; scale-y: 0.799; }
        frame 186 { x: 41.3; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 41.1; y: 118.7; skew-x: -7.2; skew-y: -7.2; }
        frame 188 { x: -10000; y: 118.6; skew-x: -7.7; skew-y: -7.7; }
        frame 189 { y: -10000; skew-x: -8.2; skew-y: -8.2; }
        frame 190 { y: 118.7; skew-x: -8.7; skew-y: -8.7; }
        frame 191 { x: 41; y: -10000; skew-x: -9.2; skew-y: -9.2; }
        frame 192 { x: 40.9; skew-x: -9.9; skew-y: -9.9; }
        frame 193 { x: 41; y: 118.8; skew-x: -10.4; skew-y: -10.4; }
        frame 194 { x: -10000; y: 118.7; skew-x: -11; skew-y: -11; }
        frame 195 { x: 41.1; y: 118.4; skew-x: -8.7; skew-y: -8.7; }
        frame 196 { x: 41.3; y: 118.1; skew-x: -6.4; skew-y: -6.4; }
        frame 197 { x: 41.6; y: 117.9; skew-x: -4.2; skew-y: -4.2; scale-x: 0.8; scale-y: 0.8; }
        frame 198 { x: 41.8; y: 117.6; skew-x: -2; skew-y: -2; scale-x: -10000; scale-y: -10000; }
        frame 199 { x: 42.1; y: 117.5; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_digger_outerleg_lower";
        frame-count: 200;
        frame 0 { x: 48.6; y: 106.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_OUTERLEG_LOWER; }
        frame 1 { x: 48.3; y: 105.9; skew-x: -0.2; skew-y: -0.7; scale-x: -10000; scale-y: 0.816; image: none; }
        frame 2 { x: 48.1; y: 105.8; skew-x: -0.4; skew-y: -1.4; scale-y: 0.833; }
        frame 3 { x: 47.9; y: 105.4; skew-x: -0.7; skew-y: -2.2; scale-y: 0.849; }
        frame 4 { x: 47.6; y: -10000; skew-x: -1.2; skew-y: -2.9; scale-x: 0.801; scale-y: 0.865; }
        frame 5 { x: 47.4; y: 105.1; skew-x: -1.4; skew-y: -3.7; scale-x: -10000; scale-y: 0.881; }
        frame 6 { x: 47.1; y: 104.9; skew-x: -1.7; skew-y: -4.4; scale-y: 0.898; }
        frame 7 { x: 46.8; y: 104.7; skew-x: -2.2; skew-y: -5.2; scale-y: 0.914; }
        frame 8 { x: 46.6; y: 104.5; skew-x: -2.4; skew-y: -5.9; scale-y: 0.93; }
        frame 9 { x: 46.3; y: 104.2; skew-x: -2.9; skew-y: -6.7; scale-y: 0.947; }
        frame 10 { x: 46.6; y: 104.4; skew-x: -2.4; skew-y: -5.7; scale-y: 0.928; }
        frame 11 { x: 46.9; y: 104.7; skew-x: -2; skew-y: -4.9; scale-y: 0.91; }
        frame 12 { x: 47.3; y: 104.9; skew-x: -1.7; skew-y: -4; scale-y: 0.892; }
        frame 13 { x: 47.5; y: 105.1; skew-x: -1.2; skew-y: -3.2; scale-y: 0.873; }
        frame 14 { x: 47.8; y: 105.4; skew-x: -0.9; skew-y: -2.4; scale-x: 0.8; scale-y: 0.855; }
        frame 15 { x: 48.1; y: 105.6; skew-x: -0.5; skew-y: -1.4; scale-x: -10000; scale-y: 0.837; }
        frame 16 { x: 48.5; y: 105.9; skew-x: -0.2; skew-y: -0.7; scale-y: 0.818; }
        frame 17 { x: 48.6; y: 106.2; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 18 { x: 40.8; y: 102.8; skew-x: -9.3; skew-y: -14; scale-x: 0.827; scale-y: 0.902; }
        frame 19 { x: 38.9; y: 100.6; skew-x: -0.2; skew-y: -4.9; scale-x: -10000; scale-y: 0.923; }
        frame 20 { x: 37.3; y: 98.7; skew-x: 8.5; skew-y: 3.8; scale-x: 0.826; scale-y: 0.945; }
        frame 21 { x: 36.1; y: 97; skew-x: 17.6; skew-y: 12.8; scale-x: 0.825; scale-y: 0.967; }
        frame 22 { x: 35.4; y: 95.6; skew-x: 26.7; skew-y: 22; scale-x: -10000; scale-y: 0.99; }
        frame 23 { x: 33.1; y: 96.8; skew-x: 22.1; skew-y: 17.3; scale-x: 0.824; scale-y: 0.988; }
        frame 24 { x: 31; y: 98.1; skew-x: 17.6; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 28.9; y: 99.4; skew-x: 13.1; skew-y: 8.3; }
        frame 26 { x: 26.9; y: 100.8; skew-x: 8.7; skew-y: 3.9; scale-y: 0.989; }
        frame 27 { x: 28.1; y: 100.7; skew-x: 8.5; skew-y: 3.8; scale-y: 0.988; }
        frame 28 { x: 29.3; y: 100.5; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 29 { x: 30.5; y: 100.4; }
        frame 30 { x: 31.7; y: 100.2; skew-x: 8.7; skew-y: 3.9; scale-y: 0.989; }
        frame 31 { x: 33.5; y: 100.8; skew-x: 6; skew-y: 1.3; scale-y: 0.988; }
        frame 32 { x: 35.2; y: 101.3; skew-x: 3.5; skew-y: -0.9; scale-y: -10000; }
        frame 33 { x: 37; y: 101.9; skew-x: 0.8; skew-y: -3.5; scale-x: 0.823; scale-y: 0.987; }
        frame 34 { x: 38.9; y: 102.6; skew-x: -1.5; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 40.5; y: 103.3; skew-x: -4.2; skew-y: -8.9; scale-y: 0.986; }
        frame 36 { x: 42.1; y: 104; skew-x: -7; skew-y: -11.7; scale-x: 0.822; scale-y: -10000; }
        frame 37 { x: 43.8; y: 104.7; skew-x: -9.7; skew-y: -14.5; scale-x: -10000; }
        frame 38 { x: 45.5; y: 105.5; skew-x: -12.7; skew-y: -17.4; }
        frame 39 { x: 46.1; y: 106; skew-x: -15.7; skew-y: -20.2; scale-x: 0.821; scale-y: 1.001; }
        frame 40 { x: 46.9; y: 106.5; skew-x: -18.5; skew-y: -23.2; scale-x: -10000; scale-y: 1.016; }
        frame 41 { x: 47.5; y: 107.1; skew-x: -21.5; skew-y: -26.2; scale-y: 1.032; }
        frame 42 { x: 48.1; y: 107.5; skew-x: -24.5; skew-y: -29.2; scale-x: 0.822; scale-y: 1.049; }
        frame 43 { x: 47.3; y: -10000; skew-x: -29; skew-y: -32.2; scale-x: 0.82; scale-y: 1.095; }
        frame 44 { x: 46.5; skew-x: -33.5; skew-y: -35.2; scale-x: 0.819; scale-y: 1.143; }
        frame 45 { x: 45.6; skew-x: -38.2; skew-y: -38.3; scale-x: 0.818; scale-y: 1.191; }
        frame 46 { x: 44.8; y: 107.6; skew-x: -42.7; skew-y: -41.3; scale-x: 0.819; scale-y: 1.241; }
        frame 47 { x: 44.3; y: 106.9; skew-x: -38.5; skew-y: -37.8; scale-x: 0.818; scale-y: 1.196; }
        frame 48 { x: 43.7; y: 106.2; skew-x: -34.3; skew-y: -34.3; scale-x: 0.819; scale-y: 1.153; }
        frame 49 { x: 43.1; y: 105.5; skew-x: -30.2; skew-y: -31; scale-x: 0.82; scale-y: 1.111; }
        frame 50 { x: 42.6; y: 104.9; skew-x: -26; skew-y: -27.5; scale-x: 0.822; scale-y: 1.07; }
        frame 51 { x: 42.3; y: 104.3; skew-x: -21.7; skew-y: -24; scale-x: -10000; scale-y: 1.026; }
        frame 52 { x: 41.8; y: 103.7; skew-x: -17.5; skew-y: -20.7; scale-x: 0.824; scale-y: 0.985; }
        frame 53 { x: 41.5; y: 103.1; skew-x: -13.4; skew-y: -17.2; scale-x: 0.825; scale-y: 0.943; }
        frame 54 { x: 40.8; y: 102.8; skew-x: -9.3; skew-y: -14; scale-x: 0.827; scale-y: 0.902; }
        frame 55 { x: 48.6; y: 106.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: 48; y: 105.8; skew-x: -10000; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 47.3; y: 105.5; skew-y: -1.2; }
        frame 58 { x: 46.7; y: 105.2; skew-y: -1.9; scale-x: 0.801; }
        frame 59 { x: 46; y: 104.8; skew-x: -0; skew-y: -2.7; scale-x: -10000; }
        frame 60 { x: 46.1; y: 104.4; skew-x: 0; skew-y: -2.4; scale-y: 0.823; }
        frame 61 { x: -10000; y: 103.9; skew-x: 0.3; skew-y: -2; scale-y: 0.846; }
        frame 62 { y: 103.4; skew-x: 0.6; skew-y: -1.7; scale-y: 0.869; }
        frame 63 { y: 102.9; skew-x: 1; skew-y: -1.6; scale-y: 0.893; }
        frame 64 { x: 42.9; y: -10000; skew-x: -3.9; skew-y: -9.7; scale-x: 0.806; scale-y: 0.964; }
        frame 65 { x: 39.6; y: 103.1; skew-x: -8.9; skew-y: -18; scale-x: 0.811; scale-y: 1.036; }
        frame 66 { x: 36.4; y: 103.6; skew-x: -14.1; skew-y: -26.2; scale-x: 0.817; scale-y: 1.109; }
        frame 67 { x: 38.1; y: -10000; skew-x: -11.7; skew-y: -22.2; scale-x: 0.814; scale-y: 1.057; }
        frame 68 { x: 39.8; y: 103.7; skew-x: -9.2; skew-y: -18.2; scale-x: 0.811; scale-y: 1.005; }
        frame 69 { x: 41.4; y: 103.9; skew-x: -6.9; skew-y: -14.4; scale-x: 0.809; scale-y: 0.954; }
        frame 70 { x: 43; y: 104.1; skew-x: -4.7; skew-y: -10.4; scale-x: 0.806; scale-y: 0.903; }
        frame 71 { x: 44.6; y: 104.4; skew-x: -2.2; skew-y: -6.5; scale-x: 0.803; scale-y: 0.851; }
        frame 72 { x: 46; y: 104.8; skew-x: -0; skew-y: -2.7; scale-x: 0.801; scale-y: 0.8; }
        frame 73 { x: 46.1; y: 104.5; skew-x: 0; skew-y: -2.4; scale-x: -10000; scale-y: 0.815; }
        frame 74 { x: -10000; y: 104.2; skew-x: 0.3; skew-y: -2.2; scale-y: 0.831; }
        frame 75 { y: 103.9; skew-x: -10000; skew-y: -2; scale-y: 0.846; }
        frame 76 { x: 46; y: 103.6; skew-x: 0.5; skew-y: -1.9; scale-y: 0.862; }
        frame 77 { x: 46.1; y: 103.2; skew-x: 0.8; skew-y: -1.7; scale-y: 0.877; }
        frame 78 { x: -10000; y: 102.9; skew-x: 1; skew-y: -1.6; scale-y: 0.893; }
        frame 79 { x: 43; y: 103.2; skew-x: -3.4; skew-y: -9.4; scale-x: 0.806; scale-y: 0.941; }
        frame 80 { x: 40.1; y: 103.8; skew-x: -8.2; skew-y: -17.2; scale-x: 0.811; scale-y: 0.989; }
        frame 81 { x: 37; y: 104.5; skew-x: -12.8; skew-y: -25; scale-x: 0.817; scale-y: 1.039; }
        frame 82 { x: 39; y: 104.6; skew-x: -10.7; skew-y: -20.7; scale-x: 0.814; scale-y: 0.998; }
        frame 83 { x: 41; y: 104.7; skew-x: -8.4; skew-y: -16.5; scale-x: 0.811; scale-y: 0.958; }
        frame 84 { x: 43; y: 105; skew-x: -6.2; skew-y: -12.4; scale-x: 0.808; scale-y: 0.919; }
        frame 85 { x: 45; y: 105.3; skew-x: -4.2; skew-y: -8.2; scale-x: 0.805; scale-y: 0.879; }
        frame 86 { x: 46.9; y: 105.6; skew-x: -1.9; skew-y: -3.9; scale-x: 0.803; scale-y: 0.84; }
        frame 87 { x: 48.6; y: 106.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 47.5; y: 106; skew-x: -2.9; skew-y: -3.9; scale-y: 0.848; }
        frame 90 { x: 46.3; y: 105.9; skew-x: -6; skew-y: -7.9; scale-y: 0.896; }
        frame 91 { x: 45.1; y: 105.7; skew-x: -9.2; skew-y: -11.9; scale-y: 0.944; }
        frame 92 { x: 43.8; y: -10000; skew-x: -12.4; skew-y: -16; scale-x: 0.801; scale-y: 0.993; }
        frame 93 { x: 41.8; y: 106; skew-x: -15.5; skew-y: -20.2; scale-x: 0.814; scale-y: 0.992; }
        frame 94 { x: 39.9; y: 106.4; skew-x: -18.7; skew-y: -24.7; scale-x: 0.828; scale-y: 0.991; }
        frame 95 { x: 38.1; y: 106.8; skew-x: -22; skew-y: -29; scale-x: 0.842; scale-y: -10000; }
        frame 96 { x: 36.3; y: 107.3; skew-x: -25.3; skew-y: -33.5; scale-x: 0.858; scale-y: 0.992; }
        frame 97 { x: 34.2; y: 114.4; skew-x: -43.8; skew-y: -52.1; scale-x: 0.856; scale-y: 1.108; }
        frame 98 { x: 33.6; y: 121.9; skew-x: -62.3; skew-y: -70.6; scale-x: -10000; scale-y: 1.226; }
        frame 99 { x: 34.6; y: 129.3; skew-x: -80.9; skew-y: -89.1; scale-y: 1.345; }
        frame 100 { x: 34.3; y: 129.4; skew-x: -10000; skew-y: -10000; scale-y: 1.369; }
        frame 101 { x: 34; y: 129.3; scale-y: 1.392; }
        frame 102 { x: 33.5; y: 127.4; skew-x: -77.1; skew-y: -85.4; scale-x: 0.855; scale-y: 1.368; }
        frame 103 { x: 32.9; y: 125.5; skew-x: -73.1; skew-y: -81.4; scale-x: 0.856; scale-y: 1.345; }
        frame 104 { x: 33.4; y: 126; skew-x: -73.6; skew-y: -81.9; scale-x: 0.855; scale-y: 1.326; }
        frame 105 { x: 34; y: 126.4; skew-x: -74.1; skew-y: -82.4; scale-x: -10000; scale-y: 1.308; }
        frame 106 { x: 34.6; y: 126.8; skew-x: -74.6; skew-y: -82.9; scale-y: 1.291; }
        frame 107 { x: 36.7; y: 128.3; skew-x: -78.9; skew-y: -87.1; scale-x: 0.856; scale-y: 1.22; }
        frame 108 { x: 37.1; y: 128.5; skew-x: -81.4; skew-y: -86.8; scale-x: 0.846; scale-y: 1.266; }
        frame 109 { x: 37.5; y: 128.6; skew-x: -83.8; skew-y: -86.3; scale-x: 0.837; scale-y: 1.314; }
        frame 110 { x: 37.1; y: -10000; skew-x: -82.9; skew-y: -87.4; scale-x: 0.843; scale-y: 1.303; }
        frame 111 { x: 36.6; y: 128.7; skew-x: -81.9; skew-y: -88.3; scale-x: 0.849; scale-y: 1.293; }
        frame 112 { x: 36.1; y: 128.9; skew-x: -80.9; skew-y: -89.1; scale-x: 0.856; scale-y: 1.283; }
        frame 113 { x: 35.5; y: 128.1; skew-x: -78.4; skew-y: -86.6; scale-x: -10000; scale-y: -10000; }
        frame 114 { x: 34.9; y: 127.2; skew-x: -75.8; skew-y: -84.1; scale-x: 0.855; }
        frame 115 { x: 34.4; y: 126.3; skew-x: -73; skew-y: -81.3; scale-x: 0.856; }
        frame 116 { x: 34; y: 126.1; skew-x: -72.6; skew-y: -80.9; scale-x: 0.855; scale-y: 1.282; }
        frame 117 { x: 33.5; y: 125.9; skew-x: -72.2; skew-y: -80.5; scale-x: 0.856; scale-y: 1.283; }
        frame 118 { x: -10000; y: 125.2; skew-x: -67.3; skew-y: -78.9; scale-x: 0.866; scale-y: 1.243; }
        frame 119 { y: 124.5; skew-x: -62.4; skew-y: -77.4; scale-x: 0.878; scale-y: 1.203; }
        frame 120 { y: 123.7; skew-x: -57.4; skew-y: -75.7; scale-x: 0.89; scale-y: 1.165; }
        frame 121 { x: 33.3; y: 124.6; skew-x: -62.3; skew-y: -77.9; scale-x: 0.864; scale-y: 1.271; }
        frame 122 { x: 33; y: 125.4; skew-x: -67.3; skew-y: -80.1; scale-x: 0.839; scale-y: 1.378; }
        frame 123 { x: 32.7; y: 126.1; skew-x: -72.2; skew-y: -82.3; scale-x: 0.814; scale-y: 1.486; }
        frame 124 { x: 35.1; y: 126.9; skew-x: -78.1; skew-y: -87.4; scale-x: 0.834; scale-y: 1.383; }
        frame 125 { x: 37.5; y: 127.3; skew-x: -83.9; skew-y: -92.2; scale-x: 0.855; scale-y: 1.28; }
        frame 126 { x: 36; y: 127.1; skew-x: -79.6; skew-y: -87.9; scale-x: -10000; scale-y: 1.357; }
        frame 127 { x: 34.4; y: 126.6; skew-x: -75.3; skew-y: -83.6; scale-x: 0.856; scale-y: 1.433; }
        frame 128 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 129 { cel: -10000; }
        frame 146 { x: 44.5; y: 86.3; skew-x: 10.5; skew-y: 10.5; scale-x: 0.799; scale-y: 1.129; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 44; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 44.8; y: 90.2; skew-x: 8.3; skew-y: 8.3; scale-y: 1.063; }
        frame 167 { x: 45.6; y: 94.2; skew-x: 6.3; skew-y: 6.3; scale-y: 0.997; }
        frame 168 { x: 46.5; y: 98.2; skew-x: 4.1; skew-y: 4.1; scale-x: 0.8; scale-y: 0.931; }
        frame 169 { x: 47.5; y: 102.1; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: 0.866; }
        frame 170 { x: 48.6; y: 106.2; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 171 { x: 48; y: 106.4; skew-x: -2.4; skew-y: -2.2; scale-x: 0.809; scale-y: 0.823; }
        frame 172 { x: 47.4; y: 106.6; skew-x: -5; skew-y: -4.4; scale-x: 0.818; scale-y: 0.846; }
        frame 173 { x: 46.9; y: 107; skew-x: -7.8; skew-y: -6.8; scale-x: 0.828; scale-y: 0.869; }
        frame 174 { x: 47.4; y: 106.8; skew-x: -5.7; skew-y: -4.9; scale-x: 0.82; scale-y: 0.851; }
        frame 175 { x: 47.8; y: 106.5; skew-x: -3.7; skew-y: -3.2; scale-x: 0.814; scale-y: 0.834; }
        frame 176 { x: 48.3; y: 106.3; skew-x: -1.7; skew-y: -1.5; scale-x: 0.807; scale-y: 0.817; }
        frame 177 { x: 48.6; y: 106.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 47.9; y: 105.8; skew-x: -1.7; skew-y: -1.4; scale-y: 0.821; }
        frame 181 { x: 47.3; y: 105.5; skew-x: -3.4; skew-y: -3.2; scale-y: 0.842; }
        frame 182 { x: 46.5; y: 105.1; skew-x: -5.2; skew-y: -4.9; scale-y: 0.862; }
        frame 183 { x: 45.8; y: 104.8; skew-x: -6.9; skew-y: -6.7; scale-x: 0.799; scale-y: 0.883; }
        frame 184 { x: 45; y: 104.4; skew-x: -8.7; skew-y: -8.3; scale-x: 0.8; scale-y: 0.905; }
        frame 185 { x: 45.1; y: 104.7; skew-x: -8.9; skew-y: -8.7; scale-x: 0.799; scale-y: 0.894; }
        frame 186 { x: -10000; y: -10000; skew-x: -9.2; skew-y: -8.9; scale-x: -10000; scale-y: 0.883; }
        frame 187 { x: 45.2; y: 104.9; skew-x: -9.5; skew-y: -9.4; scale-y: 0.872; }
        frame 188 { x: 45.3; y: 105.1; skew-x: -9.9; skew-y: -9.7; scale-y: 0.862; }
        frame 189 { x: 45.4; y: 105.3; skew-x: -10.2; skew-y: -10; scale-y: 0.851; }
        frame 190 { x: 45.5; y: 105.4; skew-x: -10.5; skew-y: -10.4; scale-y: 0.841; }
        frame 191 { x: 45.6; y: 105.6; skew-x: -10.9; skew-y: -10.7; scale-x: 0.798; scale-y: 0.83; }
        frame 192 { x: 45.7; y: 105.7; skew-x: -11.2; skew-y: -11.2; scale-x: -10000; scale-y: 0.819; }
        frame 193 { x: 45.8; y: 105.9; skew-x: -11.5; skew-y: -11.5; scale-y: 0.809; }
        frame 194 { x: 46.1; y: 106; skew-x: -12; skew-y: -12; scale-x: 0.799; scale-y: 0.799; }
        frame 195 { x: 46.6; y: -10000; skew-x: -9.4; skew-y: -9.4; scale-x: -10000; scale-y: -10000; }
        frame 196 { x: 47.1; y: 105.9; skew-x: -7; skew-y: -7; }
        frame 197 { x: 47.6; y: 106; skew-x: -4.7; skew-y: -4.7; }
        frame 198 { x: 48.2; y: 106.1; skew-x: -2.2; skew-y: -2.2; scale-x: 0.8; scale-y: 0.8; }
        frame 199 { x: 48.6; y: 106.2; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_digger_outerleg_upper";
        frame-count: 200;
        frame 0 { x: 39.6; y: 80.6; image: IMAGE_REANIM_ZOMBIE_DIGGER_OUTERLEG_UPPER; }
        frame 1 { x: -10000; y: -10000; skew-x: 0.1; skew-y: 0.5; image: none; }
        frame 2 { x: 39.7; y: 80.4; skew-x: 0.3; skew-y: 1; }
        frame 3 { x: 39.8; y: 80.3; skew-x: 0.6; skew-y: 1.8; }
        frame 4 { x: -10000; y: 80.2; skew-x: 0.8; skew-y: 2.3; }
        frame 5 { y: -10000; skew-x: 1.1; skew-y: 2.8; scale-x: 1.001; }
        frame 6 { x: 39.9; y: 80; skew-x: 1.3; skew-y: 3.5; scale-x: -10000; }
        frame 7 { x: 40.1; y: 79.8; skew-x: 1.6; skew-y: 4; }
        frame 8 { x: -10000; y: 79.7; skew-x: 1.8; skew-y: 4.6; scale-y: 0.999; }
        frame 9 { x: 40.2; y: 79.5; skew-x: 2.2; skew-y: 5.3; scale-y: 1; }
        frame 10 { x: 40.1; y: 79.6; skew-x: 1.8; skew-y: 4.5; scale-y: 0.999; }
        frame 11 { x: -10000; y: 79.8; skew-x: 1.5; skew-y: 3.8; scale-y: 1; }
        frame 12 { x: 40; y: 79.9; skew-x: 1.3; skew-y: 3.3; scale-y: -10000; }
        frame 13 { x: 39.9; y: 80; skew-x: 1; skew-y: 2.5; }
        frame 14 { x: 39.8; y: 80.1; skew-x: 0.8; skew-y: 1.8; scale-x: 1; }
        frame 15 { x: -10000; y: 80.3; skew-x: 0.5; skew-y: 1.3; scale-x: -10000; }
        frame 16 { x: 39.7; y: 80.4; skew-x: 0.3; skew-y: 0.5; }
        frame 17 { x: 39.6; y: 80.6; skew-x: 0; skew-y: 0; }
        frame 18 { x: 40.9; y: 71.8; skew-x: 15.6; skew-y: 17; scale-x: 0.997; scale-y: 1.061; }
        frame 19 { x: 41.1; y: 72; skew-x: 17; skew-y: 20.3; scale-x: 0.998; scale-y: 1.059; }
        frame 20 { x: 41.3; y: 72.1; skew-x: 18.6; skew-y: 23.6; scale-x: 1.001; scale-y: -10000; }
        frame 21 { x: 41.4; y: 72.4; skew-x: 20.1; skew-y: 26.8; scale-x: 1.004; }
        frame 22 { x: -10000; y: 72.5; skew-x: 21.7; skew-y: 30.3; scale-x: 1.007; scale-y: 1.06; }
        frame 23 { x: 39.8; y: 74.5; skew-x: 23.1; skew-y: 32.3; scale-x: -10000; scale-y: 1.018; }
        frame 24 { x: 38.2; y: 76.4; skew-x: 24.5; skew-y: 34.1; scale-x: 1.009; scale-y: 0.977; }
        frame 25 { x: 36.6; y: 78.4; skew-x: 25.8; skew-y: 36.1; scale-x: 1.01; scale-y: 0.936; }
        frame 26 { x: 34.8; y: 80.2; skew-x: 27.4; skew-y: 38.1; scale-x: 1.013; scale-y: 0.897; }
        frame 27 { x: 35.6; y: 78.6; skew-x: 22.8; skew-y: 34.8; scale-x: 1.016; scale-y: 0.965; }
        frame 28 { x: 36.4; y: 77.1; skew-x: 18.5; skew-y: 31.6; scale-x: 1.021; scale-y: 1.034; }
        frame 29 { x: 37.1; y: 75.6; skew-x: 14.1; skew-y: 28.3; scale-x: 1.025; scale-y: 1.103; }
        frame 30 { x: 37.8; y: 74.1; skew-x: 9.8; skew-y: 25; scale-x: 1.031; scale-y: 1.173; }
        frame 31 { x: 37.5; y: 74.9; skew-x: 7.5; skew-y: 21.1; scale-x: 1.026; scale-y: 1.141; }
        frame 32 { x: 37.2; y: 75.7; skew-x: 5.1; skew-y: 17.3; scale-x: 1.022; scale-y: 1.11; }
        frame 33 { x: 37.1; y: 76.5; skew-x: 2.8; skew-y: 13.3; scale-x: 1.018; scale-y: 1.079; }
        frame 34 { x: 37; y: 77.4; skew-x: 0.7; skew-y: 9.6; scale-x: 1.014; scale-y: 1.048; }
        frame 35 { x: 37.4; y: 78.3; skew-x: -2.2; skew-y: 6.5; scale-x: 1.013; scale-y: -10000; }
        frame 36 { x: 37.8; y: 79.2; skew-x: -5.2; skew-y: 3.5; scale-x: -10000; }
        frame 37 { x: 38.1; y: 80.2; skew-x: -8.2; skew-y: 0.5; }
        frame 38 { x: 38.6; y: 81.2; skew-x: -11.3; skew-y: -2.4; }
        frame 39 { x: 38.5; y: 81.7; skew-x: -12.5; skew-y: -3.7; scale-x: 1.012; scale-y: 1.047; }
        frame 40 { x: 38.4; y: 82.3; skew-x: -13.9; skew-y: -4.9; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 38.3; y: 82.7; skew-x: -15.2; skew-y: -6.2; }
        frame 42 { x: -10000; y: 83.2; skew-x: -16.6; skew-y: -7.7; scale-x: 1.013; }
        frame 43 { x: 37.9; y: 83.5; skew-x: -15.4; skew-y: -6.4; scale-x: 1.012; scale-y: 1.028; }
        frame 44 { x: 37.5; y: 83.6; skew-x: -14.2; skew-y: -5.4; scale-x: 1.011; scale-y: 1.009; }
        frame 45 { x: 37.1; y: 83.9; skew-x: -13.2; skew-y: -4.2; scale-x: -10000; scale-y: 0.991; }
        frame 46 { x: 36.6; y: 84.1; skew-x: -12.1; skew-y: -3.2; scale-x: 1.012; scale-y: 0.972; }
        frame 47 { x: 36.8; y: 82.4; skew-x: -8.5; skew-y: -0.7; scale-x: 1.009; scale-y: 0.983; }
        frame 48 { x: 37.1; y: 80.9; skew-x: -5.2; skew-y: 1.8; scale-x: 1.008; scale-y: 0.994; }
        frame 49 { x: 37.5; y: 79.3; skew-x: -1.7; skew-y: 4.3; scale-x: 1.006; scale-y: 1.005; }
        frame 50 { x: 37.9; y: 77.7; skew-x: 1.6; skew-y: 6.8; scale-x: 1.004; scale-y: 1.016; }
        frame 51 { x: 38.4; y: 76.2; skew-x: 5; skew-y: 9.3; scale-x: 1.002; scale-y: 1.027; }
        frame 52 { x: 39.1; y: 74.7; skew-x: 8.5; skew-y: 11.8; scale-x: 1; scale-y: 1.038; }
        frame 53 { x: 39.8; y: 73.2; skew-x: 12; skew-y: 14.3; scale-x: 0.998; scale-y: 1.049; }
        frame 54 { x: 40.9; y: 71.8; skew-x: 15.6; skew-y: 17; scale-x: 0.997; scale-y: 1.061; }
        frame 55 { x: 39.6; y: 80.6; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 56 { x: -10000; y: 80.4; skew-x: 0.8; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 39.7; y: 80.1; skew-x: 1.8; skew-y: 2.5; }
        frame 58 { x: -10000; y: 79.7; skew-x: 2.8; skew-y: 3.8; }
        frame 59 { y: 79.4; skew-x: 3.8; skew-y: 5; }
        frame 60 { y: -10000; skew-x: 3; skew-y: -10000; scale-y: 0.999; }
        frame 61 { skew-x: 2.5; scale-x: 1.001; scale-y: -10000; }
        frame 62 { x: 39.8; y: 79.3; skew-x: 1.8; scale-x: -10000; }
        frame 63 { x: 39.6; y: 79.2; skew-x: 1.3; scale-x: 1.002; scale-y: 1; }
        frame 64 { x: 37.5; y: -10000; skew-x: 1.8; skew-y: 6.6; scale-x: 1.003; scale-y: 0.967; }
        frame 65 { x: 35.4; skew-x: 2.5; skew-y: 8.3; scale-x: 1.004; scale-y: 0.934; }
        frame 66 { x: 33; skew-x: 3.3; skew-y: 10.1; scale-x: 1.006; scale-y: 0.902; }
        frame 67 { x: 35.4; y: 79.8; skew-x: 4; skew-y: 9.8; scale-x: 1.005; scale-y: 0.895; }
        frame 68 { x: 37.6; y: 80.5; skew-x: 4.8; skew-y: -10000; scale-x: 1.004; scale-y: 0.89; }
        frame 69 { x: 38.1; y: 80.2; skew-x: 4.5; skew-y: 8.5; scale-x: 1.003; scale-y: 0.917; }
        frame 70 { x: 38.6; y: 79.9; skew-x: 4.3; skew-y: 7.3; scale-x: 1.002; scale-y: 0.944; }
        frame 71 { x: 39.1; y: 79.6; skew-x: 4; skew-y: 6.1; scale-x: 1.001; scale-y: 0.972; }
        frame 72 { x: 39.7; y: 79.4; skew-x: 3.8; skew-y: 5; scale-x: 1; scale-y: 1; }
        frame 73 { x: -10000; y: -10000; skew-x: 3.3; skew-y: -10000; scale-x: -10000; scale-y: 0.999; }
        frame 74 { skew-x: 2.8; scale-y: -10000; }
        frame 75 { skew-x: 2.5; scale-x: 1.001; }
        frame 76 { y: 79.3; skew-x: 2; scale-x: -10000; }
        frame 77 { x: 39.8; y: -10000; skew-x: 1.6; }
        frame 78 { x: 39.6; y: 79.2; skew-x: 1.3; scale-x: 1.002; scale-y: 1; }
        frame 79 { x: 37.8; y: 80; skew-x: -10000; skew-y: 6; scale-x: 1.003; scale-y: 0.957; }
        frame 80 { x: 35.9; y: 80.9; skew-y: 7.1; scale-x: 1.004; scale-y: 0.914; }
        frame 81 { x: 33.9; y: 81.5; skew-x: 1.5; skew-y: 8.3; scale-x: 1.006; scale-y: 0.871; }
        frame 82 { x: 34.8; y: 81.4; skew-x: 1.1; skew-y: 6.8; scale-x: 1.005; scale-y: 0.892; }
        frame 83 { x: 35.7; y: 81.3; skew-x: 0.8; skew-y: 5.5; scale-x: 1.004; scale-y: 0.914; }
        frame 84 { x: 36.6; y: 81.1; skew-x: 0.6; skew-y: 4; scale-x: 1.003; scale-y: 0.935; }
        frame 85 { x: 37.6; y: 80.9; skew-x: 0.3; skew-y: 2.8; scale-x: 1.002; scale-y: 0.957; }
        frame 86 { x: 38.5; y: 80.8; skew-x: 0.1; skew-y: 1.3; scale-x: 1.001; scale-y: 0.978; }
        frame 87 { x: 39.6; y: 80.6; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 40.9; y: 80.5; skew-x: 2; skew-y: 4.6; scale-x: 1.004; scale-y: 0.999; }
        frame 90 { x: 42.4; y: 80.4; skew-x: 4; skew-y: 9.3; scale-x: 1.008; scale-y: -10000; }
        frame 91 { x: 43.8; y: 80.3; skew-x: 6.3; skew-y: 14; scale-x: 1.011; scale-y: 0.998; }
        frame 92 { x: 45.1; y: 80.5; skew-x: 8.4; skew-y: 18.8; scale-x: 1.016; scale-y: 0.999; }
        frame 93 { x: 39.6; y: 82.5; skew-x: -0.2; skew-y: 10; scale-x: 1.015; scale-y: 0.998; }
        frame 94 { x: 34.5; y: 84.8; skew-x: -8.9; skew-y: 1.3; scale-x: 1.014; scale-y: -10000; }
        frame 95 { x: 29.8; y: 87.3; skew-x: -17.7; skew-y: -7.4; scale-x: 1.013; scale-y: 0.997; }
        frame 96 { x: 25.6; y: 90.1; skew-x: -26.6; skew-y: -16.2; scale-x: 1.014; scale-y: -10000; }
        frame 97 { x: 25.2; y: 93; skew-x: -16.7; skew-y: -5.4; scale-x: 0.965; scale-y: 0.996; }
        frame 98 { x: 25.4; y: 96.6; skew-x: -6.7; skew-y: 5; scale-x: 0.918; scale-y: -10000; }
        frame 99 { x: 26.1; y: 100.9; skew-x: 3.1; skew-y: 15.7; scale-x: 0.871; scale-y: 0.995; }
        frame 100 { x: 25.7; y: -10000; skew-x: 3; skew-y: 16.1; scale-x: 0.914; scale-y: 0.988; }
        frame 101 { x: 25.5; y: 101; skew-x: 2.9; skew-y: 16.8; scale-x: 0.957; scale-y: 0.983; }
        frame 102 { x: 25.3; y: 99.4; skew-x: 1.3; skew-y: 14.3; scale-x: 0.914; scale-y: 0.988; }
        frame 103 { x: 25.4; y: 97.7; skew-x: -0.3; skew-y: 12.1; scale-x: 0.871; scale-y: 0.995; }
        frame 104 { x: 24.4; y: 98.4; skew-x: -1.4; skew-y: 9.5; scale-x: 0.879; scale-y: 0.993; }
        frame 105 { x: 23.5; y: 99; skew-x: -2.7; skew-y: 6.8; scale-x: 0.886; scale-y: 0.991; }
        frame 106 { x: 22.5; y: 99.8; skew-x: -4; skew-y: 4.2; scale-x: 0.894; scale-y: 0.989; }
        frame 107 { x: 22.1; y: 101.8; skew-x: -6.1; skew-y: -0; scale-x: 0.855; scale-y: 0.994; }
        frame 108 { x: 21.6; y: 103; skew-x: -8.9; skew-y: -2.9; scale-x: 0.864; scale-y: 0.983; }
        frame 109 { x: 20.9; y: 104.1; skew-x: -11.9; skew-y: -6; scale-x: 0.875; scale-y: 0.972; }
        frame 110 { x: 21.3; y: 103.6; skew-x: -10.9; skew-y: -3.9; scale-x: 0.87; scale-y: 0.979; }
        frame 111 { x: 21.7; y: 103.1; skew-x: -10.2; skew-y: -1.9; scale-x: 0.865; scale-y: 0.987; }
        frame 112 { x: 22.1; y: 102.7; skew-x: -9.4; skew-y: -0; scale-x: 0.861; scale-y: 0.994; }
        frame 113 { x: 21.4; y: 102; skew-x: -10000; skew-y: -3.2; scale-x: 0.858; scale-y: 1.002; }
        frame 114 { x: 20.6; y: 101.1; skew-x: -9.2; skew-y: -6.7; scale-x: 0.855; scale-y: 1.01; }
        frame 115 { x: 19.7; y: 100.4; skew-x: -9.4; skew-y: -10.1; scale-x: 0.853; scale-y: 1.018; }
        frame 116 { x: 18.7; y: 102.1; skew-x: -18; skew-y: -14.4; scale-x: 0.857; scale-y: 1.009; }
        frame 117 { x: 18.1; y: 103.9; skew-x: -26.7; skew-y: -18.7; scale-x: 0.863; scale-y: 1; }
        frame 118 { x: 18; y: 105.6; skew-x: -35.6; skew-y: -23.1; scale-x: 0.869; scale-y: 0.993; }
        frame 119 { x: 17.6; y: 109.7; skew-x: -47; skew-y: -35.3; scale-x: 0.881; scale-y: 0.942; }
        frame 120 { x: 18.4; y: 113.7; skew-x: -58.3; skew-y: -47.6; scale-x: 0.895; scale-y: 0.895; }
        frame 121 { x: 18.1; y: 115.1; skew-x: -69.2; skew-y: -45.4; scale-x: 0.925; scale-y: 0.99; }
        frame 122 { x: 17.8; y: 115.3; skew-x: -68.3; skew-y: -46.8; scale-x: 0.904; scale-y: 0.985; }
        frame 123 { x: 17.6; y: 115.5; skew-x: -67.3; skew-y: -48; scale-x: 0.886; scale-y: 0.984; }
        frame 124 { x: 17.8; y: 115; skew-x: -67.1; skew-y: -45.5; scale-x: 0.904; scale-y: 0.985; }
        frame 125 { x: 17.9; y: 114.4; skew-x: -66.6; skew-y: -42.8; scale-x: 0.924; scale-y: 0.989; }
        frame 126 { x: 18; y: 114.9; skew-x: -67.9; skew-y: -44; scale-x: 0.923; scale-y: 0.988; }
        frame 127 { x: 18.1; y: 115.1; skew-x: -69.2; skew-y: -45.4; scale-x: 0.925; scale-y: 0.99; }
        frame 128 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 129 { cel: -10000; }
        frame 146 { x: 39.6; y: 62.1; skew-x: 10.5; skew-y: 10.5; scale-x: 0.999; scale-y: 0.999; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 39.1; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 39.2; y: 65.8; skew-x: 8.3; skew-y: 8.3; }
        frame 167 { x: 39.4; y: 69.5; skew-x: 6.3; skew-y: 6.3; }
        frame 168 { x: -10000; y: 73.2; skew-x: 4.1; skew-y: 4.1; }
        frame 169 { x: 39.5; y: 76.9; skew-x: 2; skew-y: 2; scale-x: 1; scale-y: 1; }
        frame 170 { x: 39.6; y: 80.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 39.5; y: -10000; skew-x: 1; skew-y: 1; scale-x: 1.012; scale-y: 0.994; }
        frame 172 { x: 39.6; skew-x: 2; skew-y: 2.3; scale-x: 1.024; scale-y: 0.987; }
        frame 173 { x: -10000; skew-x: 3.1; skew-y: 3.5; scale-x: 1.036; scale-y: 0.981; }
        frame 174 { y: 80.7; skew-x: 2.3; skew-y: 2.5; scale-x: 1.027; scale-y: 0.986; }
        frame 175 { y: -10000; skew-x: 1.5; skew-y: 1.6; scale-x: 1.018; scale-y: 0.99; }
        frame 176 { skew-x: 0.8; skew-y: 0.8; scale-x: 1.009; scale-y: 0.995; }
        frame 177 { y: 80.6; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 178 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 39.9; y: 79.8; skew-x: 1.8; skew-y: 1.8; }
        frame 181 { x: 40.2; y: 79; skew-x: 3.6; skew-y: 3.6; }
        frame 182 { x: 40.6; y: 78.1; skew-x: 5.5; skew-y: 5.5; scale-x: 0.999; scale-y: 0.999; }
        frame 183 { x: 41; y: 77.4; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: 41.5; y: 76.5; skew-x: 9.3; skew-y: 9.3; }
        frame 185 { x: 40.6; y: 77.2; skew-x: 6.8; skew-y: 7.1; }
        frame 186 { x: 39.6; y: 78; skew-x: 4.3; skew-y: 5; }
        frame 187 { x: 38.9; y: 78.8; skew-x: 2; skew-y: 3; scale-y: 1; }
        frame 188 { x: 38.1; y: 79.5; skew-x: -0.2; skew-y: 1; scale-y: -10000; }
        frame 189 { x: 37.4; y: 80.5; skew-x: -2.7; skew-y: -0.9; }
        frame 190 { x: 36.6; y: 81.2; skew-x: -4.9; skew-y: -2.9; }
        frame 191 { x: 36; y: 82.1; skew-x: -7.4; skew-y: -5; }
        frame 192 { x: 35.3; y: 83; skew-x: -9.7; skew-y: -7.2; }
        frame 193 { x: 34.7; y: 83.9; skew-x: -12.2; skew-y: -9.2; }
        frame 194 { x: 34; y: 84.9; skew-x: -14.7; skew-y: -11.3; scale-y: 1.001; }
        frame 195 { x: 35; y: 84; skew-x: -11.7; skew-y: -8.9; scale-y: 1; }
        frame 196 { x: 36; y: 83.2; skew-x: -8.7; skew-y: -6.7; scale-y: -10000; }
        frame 197 { x: 37.1; y: 82.3; skew-x: -5.7; skew-y: -4.4; }
        frame 198 { x: 38.3; y: 81.4; skew-x: -2.7; skew-y: -2.2; scale-x: 1; }
        frame 199 { x: 39.6; y: 80.6; skew-x: 0; skew-y: 0; scale-x: -10000; }
    }
    Track {
        source-name: "Zombie_outerarm_hand";
        frame-count: 200;
        frame 0 { x: 29.4; y: 85.9; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_OUTERARM_HAND; }
        frame 1 { x: 29.6; y: 84.5; skew-x: 6.8; skew-y: 6.8; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 29.8; y: 83.1; skew-x: 13.6; skew-y: 13.6; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 29.9; y: 83.4; skew-x: 14.8; skew-y: 14.8; scale-x: 0.798; scale-y: 0.798; }
        frame 4 { x: 30.3; y: 83.6; skew-x: 16.3; skew-y: 16.3; scale-x: 0.797; scale-y: 0.797; }
        frame 5 { x: 30.5; y: 83.8; skew-x: 17.6; skew-y: 17.6; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 30.8; y: 84; skew-x: 18.8; skew-y: 18.8; }
        frame 7 { x: 31.1; y: 84.3; skew-x: 20.3; skew-y: 20.3; scale-x: 0.796; scale-y: 0.796; }
        frame 8 { x: 31.4; y: 84.5; skew-x: 21.6; skew-y: 21.6; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 31.8; y: 84.9; skew-x: 23.1; skew-y: 23.1; scale-x: 0.797; scale-y: 0.797; }
        frame 10 { x: 31.5; y: 86.4; skew-x: 17.1; skew-y: 17.1; scale-x: 0.796; scale-y: 0.796; }
        frame 11 { x: 31.1; y: 87.8; skew-x: 11.3; skew-y: 11.3; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 30.9; y: 87.5; skew-x: 9.3; skew-y: 9.3; }
        frame 13 { x: 30.6; y: 87.2; skew-x: 7.5; skew-y: 7.5; scale-x: 0.797; scale-y: 0.797; }
        frame 14 { x: 30.3; y: 86.9; skew-x: 5.5; skew-y: 5.5; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 30.1; y: 86.6; skew-x: 3.8; skew-y: 3.8; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 29.8; y: 86.3; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 29.4; y: 85.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { x: 41.4; y: 87.7; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.808; }
        frame 19 { x: 43.4; y: 87.4; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 45.4; y: 87.2; skew-x: 5.5; skew-y: 5.5; scale-x: 0.797; }
        frame 21 { x: 47.3; y: 87.1; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: 0.807; }
        frame 22 { x: 49.3; y: 86.9; skew-x: 11.3; skew-y: 11.3; scale-y: -10000; }
        frame 23 { x: 49.1; y: 90.1; skew-x: -2.5; skew-y: -2.5; scale-x: 0.796; scale-y: 0.806; }
        frame 24 { x: 49.4; y: 93.6; skew-x: -16.5; skew-y: -16.5; scale-x: 0.795; scale-y: 0.805; }
        frame 25 { x: 50.5; y: 97.6; skew-x: -30.5; skew-y: -30.5; scale-x: 0.794; scale-y: 0.804; }
        frame 26 { x: 52.2; y: 101.6; skew-x: -44.6; skew-y: -44.6; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 52; y: 102.1; skew-x: -48; skew-y: -48; scale-x: 0.792; scale-y: 0.802; }
        frame 28 { x: 51.5; y: 102.6; skew-x: -51.2; skew-y: -51.2; scale-x: 0.793; scale-y: 0.803; }
        frame 29 { x: 50.6; y: 102.5; skew-x: -55; skew-y: -55; scale-x: 0.792; scale-y: -10000; }
        frame 30 { x: 49.7; y: 102.3; skew-x: -58.7; skew-y: -58.7; scale-x: 0.794; scale-y: 0.804; }
        frame 31 { x: 45.7; y: 102.1; skew-x: -56.6; skew-y: -56.6; scale-x: 0.793; scale-y: 0.803; }
        frame 32 { x: 41.6; y: 102; skew-x: -54.5; skew-y: -54.5; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 37.6; y: 101.7; skew-x: -52.3; skew-y: -52.3; scale-x: 0.792; }
        frame 34 { x: 33.6; y: 101.6; skew-x: -50.3; skew-y: -50.3; scale-x: 0.794; scale-y: 0.804; }
        frame 35 { x: 31.2; y: 99.9; skew-x: -45.3; skew-y: -45.3; scale-x: 0.792; scale-y: 0.802; }
        frame 36 { x: 28.6; y: 98.1; skew-x: -40.2; skew-y: -40.2; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 26.3; y: 96.5; skew-x: -35.2; skew-y: -35.2; }
        frame 38 { x: 23.9; y: 94.8; skew-x: -30.1; skew-y: -30.1; scale-x: 0.793; scale-y: 0.803; }
        frame 39 { x: 23; y: 93.8; skew-x: -30.2; skew-y: -30.2; scale-x: 0.791; scale-y: 0.802; }
        frame 40 { x: 22.1; y: 92.8; skew-x: -30.5; skew-y: -30.5; scale-x: -10000; scale-y: 0.801; }
        frame 41 { x: 21.1; y: 91.8; skew-x: -30.7; skew-y: -30.7; scale-y: -10000; }
        frame 42 { x: 20.2; y: 90.7; skew-x: -30.9; skew-y: -30.9; scale-x: 0.792; scale-y: 0.802; }
        frame 43 { x: 21.5; y: 94; skew-x: -32.5; skew-y: -32.5; scale-x: 0.79; scale-y: 0.8; }
        frame 44 { x: 22.8; y: 97.2; skew-x: -34.3; skew-y: -34.3; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 24.1; y: 100.5; skew-x: -36; skew-y: -36; scale-x: 0.789; }
        frame 46 { x: 25.4; y: 103.7; skew-x: -37.8; skew-y: -37.8; scale-x: 0.79; }
        frame 47 { x: 27.2; y: 103; skew-x: -35.5; skew-y: -35.5; scale-x: 0.789; scale-y: 0.798; }
        frame 48 { x: 28.8; y: 102.3; skew-x: -33.3; skew-y: -33.3; scale-x: 0.791; scale-y: -10000; }
        frame 49 { x: 30.6; y: 99.3; skew-x: -27.8; skew-y: -27.8; scale-x: -10000; }
        frame 50 { x: 32.5; y: 96.4; skew-x: -22.5; skew-y: -22.5; scale-x: 0.794; scale-y: 0.799; }
        frame 51 { x: 34.6; y: 94.1; skew-x: -16.7; skew-y: -16.7; scale-x: -10000; scale-y: 0.801; }
        frame 52 { x: 36.7; y: 91.9; skew-x: -11.2; skew-y: -11.2; scale-x: 0.796; scale-y: 0.803; }
        frame 53 { x: 39; y: 89.7; skew-x: -5.4; skew-y: -5.4; scale-x: 0.797; scale-y: 0.806; }
        frame 54 { x: 41.4; y: 87.7; skew-x: 0; skew-y: 0; scale-x: 0.798; scale-y: 0.808; }
        frame 55 { x: 29.4; y: 85.9; skew-x: -10000; skew-y: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: 27.2; y: 80; skew-x: 13.5; skew-y: 13.5; scale-x: 0.799; scale-y: 0.799; }
        frame 57 { x: 25.5; y: 74.5; skew-x: 27.3; skew-y: 27.3; scale-x: 0.798; scale-y: 0.798; }
        frame 58 { x: 24; y: 69.8; skew-x: 40.9; skew-y: 40.9; scale-x: 0.797; scale-y: 0.797; }
        frame 59 { x: 22.4; y: 65.8; skew-x: 54.6; skew-y: 54.6; scale-x: 0.798; scale-y: 0.798; }
        frame 60 { x: 24.3; y: 60.4; skew-x: 65.7; skew-y: 67.7; scale-x: -10000; scale-y: 0.796; }
        frame 61 { x: 25.8; y: 55.5; skew-x: 76.7; skew-y: 80.7; scale-x: 0.8; scale-y: -10000; }
        frame 62 { x: 27.1; y: 50.9; skew-x: 87.5; skew-y: 93.6; scale-x: 0.802; scale-y: 0.795; }
        frame 63 { x: 27.8; y: 46.8; skew-x: 98.5; skew-y: 106.7; scale-x: 0.803; scale-y: -10000; }
        frame 64 { x: 22.4; y: 46.1; skew-x: 86.2; skew-y: 94.3; scale-x: 0.802; scale-y: 0.793; }
        frame 65 { x: 16.6; y: 45.6; skew-x: 73.7; skew-y: 82; scale-x: 0.8; scale-y: 0.792; }
        frame 66 { x: 10.6; y: 46; skew-x: 61.1; skew-y: 69.4; scale-x: -10000; scale-y: 0.791; }
        frame 67 { x: 12.6; y: 49.3; skew-x: 60.2; skew-y: 67; scale-x: 0.798; scale-y: 0.792; }
        frame 68 { x: 14.6; y: 52.6; skew-x: 58.9; skew-y: 64.5; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 16.6; y: 56; skew-x: 57.9; skew-y: 62; scale-x: 0.797; scale-y: 0.793; }
        frame 70 { x: 18.5; y: 59.3; skew-x: 56.9; skew-y: 59.6; scale-x: -10000; scale-y: 0.794; }
        frame 71 { x: 20.5; y: 62.7; skew-x: 55.7; skew-y: 57.1; scale-y: 0.795; }
        frame 72 { x: 22.4; y: 65.8; skew-x: 54.6; skew-y: 54.6; scale-x: 0.798; scale-y: 0.798; }
        frame 73 { x: 23.3; y: 67.8; skew-x: 47.6; skew-y: 47.6; scale-x: 0.796; scale-y: 0.796; }
        frame 74 { x: 24.3; y: 69.9; skew-x: 40.6; skew-y: 40.6; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 25.1; y: 72.2; skew-x: 33.6; skew-y: 33.6; scale-x: 0.795; scale-y: 0.795; }
        frame 76 { x: 26.1; y: 74.7; skew-x: 26.8; skew-y: 26.8; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 27.2; y: 77.4; skew-x: 19.8; skew-y: 19.8; }
        frame 78 { x: 28.2; y: 80.2; skew-x: 12.9; skew-y: 12.9; scale-x: 0.796; scale-y: 0.796; }
        frame 79 { x: 33.6; y: 85.8; skew-x: -14.5; skew-y: -14.5; scale-x: 0.793; scale-y: 0.793; }
        frame 80 { x: 41.5; y: 92.6; skew-x: -42.2; skew-y: -42.2; scale-x: 0.791; scale-y: 0.791; }
        frame 81 { x: 52.3; y: 99.4; skew-x: -69.8; skew-y: -69.8; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 47.2; y: 97.3; skew-x: -58.1; skew-y: -58.1; }
        frame 83 { x: 42.6; y: 94.9; skew-x: -46.5; skew-y: -46.5; scale-x: 0.793; scale-y: 0.793; }
        frame 84 { x: 38.5; y: 92.5; skew-x: -34.8; skew-y: -34.8; scale-x: 0.794; scale-y: 0.794; }
        frame 85 { x: 34.9; y: 90.2; skew-x: -23.2; skew-y: -23.2; scale-x: 0.796; scale-y: 0.796; }
        frame 86 { x: 31.8; y: 88; skew-x: -11.4; skew-y: -11.4; scale-x: 0.798; scale-y: 0.798; }
        frame 87 { x: 29.4; y: 85.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 89 { cel: -10000; }
        frame 146 { x: 38.8; y: 73.2; skew-x: -7.9; skew-y: -7.9; scale-x: 0.799; scale-y: 0.799; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 38.3; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 36.6; y: 75.8; skew-x: -6.2; skew-y: -6.2; }
        frame 167 { x: 34.8; y: 78.2; skew-x: -4.7; skew-y: -4.7; }
        frame 168 { x: 32.9; y: 80.8; skew-x: -3; skew-y: -3; }
        frame 169 { x: 31.3; y: 83.4; skew-x: -1.4; skew-y: -1.4; scale-x: 0.8; scale-y: 0.8; }
        frame 170 { x: 29.4; y: 85.9; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: -10000; y: 86.7; skew-x: -10000; skew-y: -10000; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { y: 87.4; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { y: 88.2; scale-x: 0.829; scale-y: 0.785; }
        frame 174 { y: 87.6; scale-x: 0.822; scale-y: 0.789; }
        frame 175 { y: 87.1; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { y: 86.4; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { y: 85.9; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 28.7; y: 85.6; skew-x: 0.8; skew-y: 0.8; }
        frame 181 { x: 28.1; y: 85.3; skew-x: 1.8; skew-y: 1.8; }
        frame 182 { x: 27.4; y: 85; skew-x: 2.6; skew-y: 2.6; }
        frame 183 { x: 26.8; y: 84.7; skew-x: 3.5; skew-y: 3.5; }
        frame 184 { x: 26.1; y: 84.4; skew-x: 4.5; skew-y: 4.5; }
        frame 185 { x: 27.5; y: 83.2; skew-x: 10.8; skew-y: 10.8; scale-x: 0.799; scale-y: 0.799; }
        frame 186 { x: 29; y: 82.1; skew-x: 17.4; skew-y: 17.4; scale-x: 0.798; scale-y: 0.798; }
        frame 187 { x: 29.7; y: 83.2; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 188 { x: 30.7; y: 84.3; skew-x: 7.3; skew-y: 7.3; }
        frame 189 { x: 31.5; y: 85.5; skew-x: 2.3; skew-y: 2.3; }
        frame 190 { x: 32.5; y: 86.7; skew-x: -2.4; skew-y: -2.4; scale-x: 0.799; scale-y: 0.799; }
        frame 191 { x: 33.6; y: 88; skew-x: -7.4; skew-y: -7.4; scale-x: 0.798; scale-y: 0.798; }
        frame 192 { x: 34.8; y: 89.4; skew-x: -12.4; skew-y: -12.4; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 36.1; y: 90.8; skew-x: -17.4; skew-y: -17.4; }
        frame 194 { x: 37.4; y: 92.2; skew-x: -22.5; skew-y: -22.5; scale-x: 0.799; scale-y: 0.799; }
        frame 195 { x: 38.2; y: 92.8; skew-x: -25.7; skew-y: -25.7; scale-x: 0.797; scale-y: 0.797; }
        frame 196 { x: 39.1; y: 93.4; skew-x: -28.9; skew-y: -28.9; scale-x: 0.798; scale-y: 0.798; }
        frame 197 { x: 35.6; y: 90.7; skew-x: -19.2; skew-y: -19.2; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 32.4; y: 88.2; skew-x: -9.4; skew-y: -9.4; scale-x: 0.799; scale-y: 0.799; }
        frame 199 { x: 29.4; y: 85.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_outerarm_lower";
        frame-count: 200;
        frame 0 { x: 33.5; y: 66.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_OUTERARM_LOWER; }
        frame 1 { x: -10000; y: 66.6; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 33.8; y: 66.2; skew-x: 4.3; skew-y: 4.3; }
        frame 3 { x: -10000; y: 66.6; skew-x: -10000; skew-y: -10000; }
        frame 4 { y: 67; skew-x: 4; skew-y: 4; }
        frame 5 { x: 33.9; y: 67.3; skew-x: -10000; skew-y: -10000; }
        frame 6 { x: 34; y: 67.7; }
        frame 7 { x: -10000; y: 68.1; }
        frame 8 { x: 34; y: 68.6; skew-x: 3.8; skew-y: 3.8; }
        frame 9 { x: 34.1; y: 69.1; skew-x: 3.9; skew-y: 3.9; }
        frame 10 { x: 33.6; y: 69.4; skew-x: 1.3; skew-y: 1.3; scale-y: 0.814; }
        frame 11 { x: 33.2; y: 69.6; skew-x: -0.9; skew-y: -0.9; scale-x: 0.799; scale-y: 0.828; }
        frame 12 { x: 33.3; y: 69; skew-x: -0.7; skew-y: -0.7; scale-x: 0.8; scale-y: 0.823; }
        frame 13 { x: -10000; y: 68.7; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: 0.819; }
        frame 14 { x: 33.4; y: 68.2; skew-x: -0.2; skew-y: -0.2; scale-y: 0.814; }
        frame 15 { x: -10000; y: 67.8; skew-x: -10000; skew-y: -10000; scale-y: 0.809; }
        frame 16 { x: 33.5; y: 67.3; skew-x: 0; skew-y: 0; scale-y: 0.805; }
        frame 17 { x: -10000; y: 66.8; skew-x: -10000; skew-y: -10000; scale-y: 0.8; }
        frame 18 { x: 40.4; y: 71.4; skew-x: -15.9; skew-y: -15.7; scale-x: 0.799; scale-y: 0.809; }
        frame 19 { x: 41; y: 71.5; skew-x: -18.2; skew-y: -18; scale-x: 0.798; scale-y: 0.827; }
        frame 20 { x: 41.5; y: 71.8; skew-x: -20.7; skew-y: -20.4; scale-x: -10000; scale-y: 0.846; }
        frame 21 { x: 42.1; y: 72; skew-x: -23; skew-y: -22.7; scale-x: 0.797; scale-y: 0.865; }
        frame 22 { x: 42.7; y: 72.2; skew-x: -25.5; skew-y: -25.2; scale-x: 0.798; scale-y: 0.886; }
        frame 23 { x: 41.7; y: 75; skew-x: -31.5; skew-y: -31.2; scale-x: 0.797; scale-y: 0.884; }
        frame 24 { x: 40.8; y: 78; skew-x: -37.3; skew-y: -37.2; scale-x: 0.796; scale-y: -10000; }
        frame 25 { x: 40.3; y: 80.7; skew-x: -43.3; skew-y: -43; scale-x: -10000; scale-y: 0.883; }
        frame 26 { x: 39.9; y: 83.8; skew-x: -49.3; skew-y: -49.1; scale-x: 0.797; scale-y: 0.884; }
        frame 27 { x: 38.8; y: 82.2; skew-x: -48; skew-y: -47.8; scale-x: 0.795; scale-y: 0.901; }
        frame 28 { x: 37.9; y: 80.5; skew-x: -46.8; skew-y: -46.5; scale-x: -10000; scale-y: 0.919; }
        frame 29 { x: 36.9; y: 78.9; skew-x: -45.5; skew-y: -45.3; scale-y: 0.937; }
        frame 30 { x: 35.8; y: 77.3; skew-x: -44.3; skew-y: -44.1; scale-x: 0.796; scale-y: 0.956; }
        frame 31 { x: 35; y: 74.3; skew-x: -35.2; skew-y: -35; scale-x: 0.794; scale-y: 0.954; }
        frame 32 { x: 34.8; y: 71.4; skew-x: -26; skew-y: -25.9; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 35.1; y: 68.7; skew-x: -17; skew-y: -16.7; }
        frame 34 { x: 35.6; y: 66.4; skew-x: -8; skew-y: -7.7; }
        frame 35 { x: 35.1; y: 65.5; skew-x: -4.9; skew-y: -4.7; }
        frame 36 { x: 34.6; y: 64.6; skew-x: -1.9; skew-y: -1.7; }
        frame 37 { x: 34.1; y: 63.6; skew-x: 0.8; skew-y: 1; }
        frame 38 { x: 33.7; y: 63; skew-x: 3.8; skew-y: 4; }
        frame 39 { x: 33.9; y: 61.7; skew-x: 5.8; skew-y: 6; scale-x: 0.793; scale-y: 0.953; }
        frame 40 { x: 34.1; y: 60.5; skew-x: 8; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 34.3; y: 59.1; skew-x: 10.3; skew-y: 10.5; }
        frame 42 { x: 34.6; y: 57.9; skew-x: 12.5; skew-y: 12.8; }
        frame 43 { x: 32.3; y: 61.4; skew-x: 6.3; skew-y: 6.5; scale-y: 0.952; }
        frame 44 { x: 30.2; y: 65; skew-x: 0.3; skew-y: 0.5; scale-y: -10000; }
        frame 45 { x: 28.3; y: 68.8; skew-x: -5.7; skew-y: -5.4; scale-x: 0.792; }
        frame 46 { x: 26.6; y: 72.9; skew-x: -11.8; skew-y: -11.6; scale-x: -10000; }
        frame 47 { x: 28.4; y: 72.7; skew-x: -12.2; skew-y: -11.9; scale-y: 0.933; }
        frame 48 { x: 30; y: 72.5; skew-x: -12.7; skew-y: -12.4; scale-x: 0.793; scale-y: 0.915; }
        frame 49 { x: 31.7; y: 72.3; skew-x: -13.2; skew-y: -12.9; scale-x: 0.794; scale-y: 0.897; }
        frame 50 { x: 33.4; y: 72.1; skew-x: -13.7; skew-y: -13.5; scale-x: 0.795; scale-y: 0.879; }
        frame 51 { x: 35.1; y: 71.9; skew-x: -14.2; skew-y: -13.9; scale-x: -10000; scale-y: 0.861; }
        frame 52 { x: 36.8; y: 71.7; skew-x: -14.7; skew-y: -14.5; scale-x: 0.796; scale-y: 0.843; }
        frame 53 { x: 38.6; y: 71.5; skew-x: -15.2; skew-y: -15; scale-x: 0.797; scale-y: 0.826; }
        frame 54 { x: 40.4; y: 71.4; skew-x: -15.9; skew-y: -15.7; scale-x: 0.799; scale-y: 0.809; }
        frame 55 { x: 33.5; y: 66.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: 33.9; y: 63.4; skew-x: 9.8; skew-y: 10.8; scale-x: 0.817; scale-y: 0.799; }
        frame 57 { x: 34.8; y: 60.3; skew-x: 19.6; skew-y: 21.8; scale-x: 0.833; scale-y: 0.798; }
        frame 58 { x: 35.8; y: 57.6; skew-x: 29.3; skew-y: 32.6; scale-x: 0.85; scale-y: 0.797; }
        frame 59 { x: 36.9; y: 55.6; skew-x: 39.3; skew-y: 43.5; scale-x: 0.868; scale-y: 0.798; }
        frame 60 { x: 39; y: 52.5; skew-x: 48.1; skew-y: 53.7; scale-x: 0.866; scale-y: 0.81; }
        frame 61 { x: 41.1; y: 49.9; skew-x: 56.7; skew-y: 63.9; scale-x: -10000; scale-y: 0.824; }
        frame 62 { x: 42.9; y: 47.9; skew-x: 65.5; skew-y: 74; scale-y: 0.838; }
        frame 63 { x: 44.5; y: 46.5; skew-x: 74.2; skew-y: 84.1; scale-y: 0.852; }
        frame 64 { x: 41.9; y: 48; skew-x: 76; skew-y: 86; scale-x: 0.858; scale-y: 0.867; }
        frame 65 { x: 39.3; y: 49.4; skew-x: 77.7; skew-y: 87.7; scale-x: 0.851; scale-y: 0.882; }
        frame 66 { x: 36.7; y: 51; skew-x: 79.5; skew-y: 89.3; scale-x: 0.844; scale-y: 0.897; }
        frame 67 { x: 37.2; y: 50.9; skew-x: 72.9; skew-y: 81.7; scale-x: 0.847; scale-y: 0.88; }
        frame 68 { x: 37.5; y: 51.1; skew-x: 66.2; skew-y: 74.2; scale-x: 0.851; scale-y: 0.863; }
        frame 69 { x: -10000; y: 51.7; skew-x: 59.4; skew-y: 66.5; scale-x: 0.855; scale-y: 0.846; }
        frame 70 { x: 37.4; y: 52.6; skew-x: 52.7; skew-y: 58.9; scale-x: 0.859; scale-y: 0.83; }
        frame 71 { x: 37.2; y: 54; skew-x: 45.9; skew-y: 51.2; scale-x: 0.863; scale-y: 0.813; }
        frame 72 { x: 36.9; y: 55.6; skew-x: 39.3; skew-y: 43.5; scale-x: 0.868; scale-y: 0.798; }
        frame 73 { x: -10000; y: 56.6; skew-x: 34.6; skew-y: 38.9; scale-x: 0.867; scale-y: 0.797; }
        frame 74 { x: 37; y: 57.5; skew-x: 30.1; skew-y: 34.1; scale-x: 0.866; scale-y: 0.796; }
        frame 75 { x: 37.1; y: 58.7; skew-x: 25.3; skew-y: 29.6; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 37.2; y: 60.1; skew-x: 20.6; skew-y: 24.8; }
        frame 77 { x: 37.4; y: 61.4; skew-x: 16; skew-y: 20.3; }
        frame 78 { x: 37.8; y: 62.9; skew-x: 11.4; skew-y: 15.7; scale-x: 0.867; scale-y: 0.797; }
        frame 79 { x: 37.6; y: 66.1; skew-x: -6.2; skew-y: -1.9; scale-x: 0.865; scale-y: 0.795; }
        frame 80 { x: 38.9; y: 70.3; skew-x: -24; skew-y: -19.7; scale-x: 0.863; scale-y: 0.794; }
        frame 81 { x: 42; y: 75.4; skew-x: -41.9; skew-y: -37.6; scale-x: -10000; scale-y: 0.793; }
        frame 82 { x: 39.9; y: 73.7; skew-x: -34.8; skew-y: -31.2; scale-x: 0.851; scale-y: -10000; }
        frame 83 { x: 38; y: 72.1; skew-x: -27.7; skew-y: -25; scale-x: 0.841; scale-y: 0.794; }
        frame 84 { x: 36.4; y: 70.6; skew-x: -20.7; skew-y: -18.7; scale-x: 0.831; scale-y: 0.796; }
        frame 85 { x: 35.1; y: 69.2; skew-x: -13.7; skew-y: -12.4; scale-x: 0.82; scale-y: 0.797; }
        frame 86 { x: 34.1; y: 68; skew-x: -6.7; skew-y: -6.2; scale-x: 0.81; scale-y: 0.799; }
        frame 87 { x: 33.5; y: 66.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 89 { cel: -10000; }
        frame 146 { x: 40.1; y: 53.8; skew-x: -7.9; skew-y: -7.9; scale-x: 0.799; scale-y: 0.799; cel: 0; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 39.6; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 38.5; y: 56.3; skew-x: -6.2; skew-y: -6.2; }
        frame 167 { x: 37.1; y: 58.9; skew-x: -4.7; skew-y: -4.7; }
        frame 168 { x: 35.9; y: 61.5; skew-x: -3; skew-y: -3; }
        frame 169 { x: 34.7; y: 64.2; skew-x: -1.4; skew-y: -1.4; scale-x: 0.8; scale-y: 0.8; }
        frame 170 { x: 33.5; y: 66.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 33.4; y: 67.7; skew-x: -0.4; skew-y: -0.5; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { x: -10000; y: 68.8; skew-x: -1.2; skew-y: -1.2; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: 33.3; y: 69.6; skew-x: -1.8; skew-y: -2.1; scale-x: 0.829; scale-y: 0.785; }
        frame 174 { x: -10000; y: 68.9; skew-x: -1.2; skew-y: -1.4; scale-x: 0.821; scale-y: 0.789; }
        frame 175 { y: 68.2; skew-x: -0.7; skew-y: -0.9; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: 33.4; y: 67.5; skew-x: -0.2; skew-y: -0.4; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: 33.5; y: 66.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 33.9; y: 66.5; skew-x: 2.5; skew-y: 2.5; }
        frame 181 { x: 34.4; y: 66.1; skew-x: 5.3; skew-y: 5.3; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: 35; y: 65.8; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 35.6; y: 65.5; skew-x: 10.5; skew-y: 10.5; }
        frame 184 { x: 36.1; y: 65.3; skew-x: 13.3; skew-y: 13.3; }
        frame 185 { x: 36.3; y: 65.6; skew-x: 12.8; skew-y: 12.8; scale-x: 0.798; scale-y: 0.798; }
        frame 186 { x: 36.4; y: 65.8; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 35.7; y: 66.5; skew-x: 8; skew-y: 8; }
        frame 188 { x: 34.9; y: 67.3; skew-x: 3.8; skew-y: 3.8; }
        frame 189 { x: 34.4; y: 68; skew-x: -0.4; skew-y: -0.4; }
        frame 190 { x: 33.9; y: 68.8; skew-x: -4.7; skew-y: -4.7; }
        frame 191 { x: 33.4; y: 69.9; skew-x: -9.2; skew-y: -9.2; }
        frame 192 { x: 33.1; y: 70.9; skew-x: -13.4; skew-y: -13.4; }
        frame 193 { x: 32.9; y: 72; skew-x: -17.7; skew-y: -17.7; }
        frame 194 { x: 32.6; y: 73.2; skew-x: -22.2; skew-y: -22.2; scale-x: 0.799; scale-y: 0.799; }
        frame 195 { x: 33.9; y: -10000; skew-x: -22; skew-y: -22; scale-x: 0.798; scale-y: 0.798; }
        frame 196 { x: 34.9; y: 73.3; skew-x: -21.9; skew-y: -21.9; scale-x: -10000; scale-y: -10000; }
        frame 197 { x: 34.1; y: 70.9; skew-x: -14.5; skew-y: -14.5; }
        frame 198 { x: 33.6; y: 68.8; skew-x: -7.2; skew-y: -7.2; scale-x: 0.799; scale-y: 0.799; }
        frame 199 { x: 33.5; y: 66.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_digger_outerarm_upper";
        frame-count: 200;
        frame 0 { x: 36; y: 40.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_OUTERARM_UPPER; }
        frame 1 { x: 35.5; y: 40.6; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 34.9; y: 41.3; skew-x: -1.7; skew-y: -1.7; }
        frame 3 { x: 34.4; y: 41.8; skew-x: -2.4; skew-y: -2.4; }
        frame 4 { x: 33.8; y: 42.5; skew-x: -3.4; skew-y: -3.4; scale-x: 0.799; scale-y: 0.799; }
        frame 5 { x: 33.4; y: 43; skew-x: -4.2; skew-y: -4.2; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 32.8; y: 43.6; skew-x: -5.2; skew-y: -5.2; }
        frame 7 { x: 32.3; y: 44.1; skew-x: -6.2; skew-y: -6.2; }
        frame 8 { x: 31.8; y: 44.7; skew-x: -6.9; skew-y: -6.9; }
        frame 9 { x: 31.3; y: 45.3; skew-x: -8; skew-y: -8; }
        frame 10 { x: 31.9; y: 44.6; skew-x: -6.9; skew-y: -6.9; }
        frame 11 { x: 32.5; y: 44; skew-x: -5.9; skew-y: -5.9; }
        frame 12 { x: 33; y: 43.3; skew-x: -4.9; skew-y: -4.9; }
        frame 13 { x: 33.6; y: 42.8; skew-x: -3.9; skew-y: -3.9; }
        frame 14 { x: 34.1; y: 42.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 34.8; y: 41.4; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 35.4; y: 40.8; skew-x: -0.9; skew-y: -0.9; }
        frame 17 { x: 36; y: 40.1; skew-x: 0; skew-y: 0; }
        frame 18 { x: 39.1; y: 42.1; skew-x: -5.5; skew-y: -5.5; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: 39.8; y: 42.3; skew-x: -6; skew-y: -6; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 40.3; y: 42.5; skew-x: -6.7; skew-y: -6.7; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 40.9; y: 42.6; skew-x: -7.2; skew-y: -7.2; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 41.4; y: 42.7; skew-x: -7.8; skew-y: -7.8; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 37.4; y: 46.3; skew-x: -13.7; skew-y: -13.7; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 33.6; y: 49.8; skew-x: -19.7; skew-y: -19.7; scale-x: 0.797; scale-y: 0.797; }
        frame 25 { x: 30.1; y: 53.6; skew-x: -25.7; skew-y: -25.7; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 26.8; y: 57.5; skew-x: -31.7; skew-y: -31.7; }
        frame 27 { x: 27.2; y: 55; skew-x: -28.3; skew-y: -28.3; scale-x: 0.796; scale-y: 0.796; }
        frame 28 { x: 27.6; y: 52.6; skew-x: -25; skew-y: -25; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 28; y: 50.1; skew-x: -21.7; skew-y: -21.7; }
        frame 30 { x: 28.5; y: 47.8; skew-x: -18.6; skew-y: -18.6; scale-x: 0.797; scale-y: 0.797; }
        frame 31 { x: 30.5; y: 46.1; skew-x: -14.2; skew-y: -14.2; scale-x: 0.796; scale-y: 0.796; }
        frame 32 { x: 32.5; y: 44.6; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 34.6; y: 43.1; skew-x: -5.7; skew-y: -5.7; }
        frame 34 { x: 36.8; y: 41.8; skew-x: -1.4; skew-y: -1.4; }
        frame 35 { x: 38; y: 40.9; skew-x: 2; skew-y: 2; }
        frame 36 { x: 39.2; y: 40.1; skew-x: 5.5; skew-y: 5.5; scale-x: 0.795; scale-y: 0.795; }
        frame 37 { x: 40.5; y: 39.4; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 41.8; y: 38.6; skew-x: 12.6; skew-y: 12.6; }
        frame 39 { x: 43; y: 37.5; skew-x: 14.8; skew-y: 14.8; }
        frame 40 { x: 44; y: 36.4; skew-x: 16.8; skew-y: 16.8; scale-x: 0.794; scale-y: 0.794; }
        frame 41 { x: 45.1; y: 35.3; skew-x: 19.1; skew-y: 19.1; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 46.2; y: 34.1; skew-x: 21.3; skew-y: 21.3; scale-x: 0.795; scale-y: 0.795; }
        frame 43 { x: 41.9; y: 37.1; skew-x: 16; skew-y: 16; scale-x: 0.794; scale-y: 0.794; }
        frame 44 { x: 37.6; y: 40.6; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 33.4; y: 44; skew-x: 5.5; skew-y: 5.5; }
        frame 46 { x: 29.4; y: 47.6; skew-x: 0.4; skew-y: 0.4; }
        frame 47 { x: 30.5; y: 46.9; skew-x: -0.2; skew-y: -0.2; scale-x: 0.795; scale-y: 0.795; }
        frame 48 { x: 31.8; y: 46.1; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 33; y: 45.6; skew-x: -1.7; skew-y: -1.7; scale-x: 0.796; scale-y: 0.796; }
        frame 50 { x: 34.2; y: 44.9; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 35.5; y: 44.1; skew-x: -3.2; skew-y: -3.2; scale-x: 0.797; scale-y: 0.797; }
        frame 52 { x: 36.6; y: 43.5; skew-x: -3.9; skew-y: -3.9; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: 37.8; y: 42.9; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 39.1; y: 42.1; skew-x: -5.5; skew-y: -5.5; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 36; y: 40.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: 38.6; y: 38.4; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 57 { x: 41.6; y: 36.9; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 44.4; y: 35.5; skew-x: 18.3; skew-y: 18.3; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: 47.6; y: 34.3; skew-x: 24.7; skew-y: 24.7; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: 49.8; y: 33.1; skew-x: 30.1; skew-y: 29.6; scale-x: 0.798; scale-y: 0.797; }
        frame 61 { x: 52; y: 32; skew-x: 35.8; skew-y: 34.6; scale-x: 0.797; scale-y: -10000; }
        frame 62 { x: 54.4; y: 31.4; skew-x: 41.4; skew-y: 39.6; scale-x: -10000; }
        frame 63 { x: 56.6; y: 30.6; skew-x: 47; skew-y: 44.7; scale-x: 0.799; scale-y: 0.798; }
        frame 64 { x: 53.4; y: 31.6; skew-x: 48.4; skew-y: 45.1; scale-x: 0.798; scale-y: 0.796; }
        frame 65 { x: 50.1; y: 32.6; skew-x: 49.9; skew-y: 45.6; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 47; y: 33.4; skew-x: 51.3; skew-y: 46; scale-x: 0.8; scale-y: 0.797; }
        frame 67 { x: -10000; y: 33.3; skew-x: 46.9; skew-y: 42.4; scale-x: 0.799; scale-y: 0.796; }
        frame 68 { x: 47; y: 33.2; skew-x: 42.4; skew-y: 38.9; scale-x: 0.798; scale-y: -10000; }
        frame 69 { x: 47.1; y: 33.3; skew-x: 37.9; skew-y: 35.3; scale-x: -10000; }
        frame 70 { x: -10000; y: 33.4; skew-x: 33.6; skew-y: 31.8; scale-y: 0.797; }
        frame 71 { x: 47.4; y: 33.6; skew-x: 29.1; skew-y: 28.1; scale-y: -10000; }
        frame 72 { x: 47.6; y: 34.3; skew-x: 24.7; skew-y: 24.7; scale-x: 0.799; scale-y: 0.799; }
        frame 73 { x: 47; y: 34.7; skew-x: 21.8; skew-y: 21.8; scale-x: 0.798; scale-y: 0.798; }
        frame 74 { x: 46.4; y: 35.3; skew-x: 19.3; skew-y: 19.3; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 45.7; y: 35.8; skew-x: 16.5; skew-y: 16.5; }
        frame 76 { x: 45.1; y: 36.5; skew-x: 13.8; skew-y: 13.8; }
        frame 77 { x: 44.6; y: 37; skew-x: 11.3; skew-y: 11.3; }
        frame 78 { x: 44; y: 37.8; skew-x: 8.6; skew-y: 8.6; }
        frame 79 { x: 33.6; y: 45; skew-x: -13.7; skew-y: -13.7; scale-x: 0.797; scale-y: 0.797; }
        frame 80 { x: 26.4; y: 54.2; skew-x: -36.3; skew-y: -36.3; scale-x: 0.795; scale-y: 0.795; }
        frame 81 { x: 22.8; y: 63.9; skew-x: -58.8; skew-y: -58.8; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 23.3; y: 59.7; skew-x: -49; skew-y: -49; }
        frame 83 { x: 24.5; y: 55.4; skew-x: -39.2; skew-y: -39.2; }
        frame 84 { x: 26.3; y: 51.2; skew-x: -29.2; skew-y: -29.2; scale-x: 0.796; scale-y: 0.796; }
        frame 85 { x: 28.9; y: 47.1; skew-x: -19.5; skew-y: -19.5; scale-x: 0.798; scale-y: 0.798; }
        frame 86 { x: 32; y: 43.4; skew-x: -9.7; skew-y: -9.7; scale-x: 0.799; scale-y: 0.799; }
        frame 87 { x: 36; y: 40.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_DIGGER_OUTERARM_UPPER2; }
        frame 89 { x: 37.6; y: 42.2; skew-x: -1.4; skew-y: -1.4; image: none; }
        frame 90 { x: 39.3; y: 44.2; skew-x: -3.2; skew-y: -3.2; scale-x: 0.799; scale-y: 0.799; }
        frame 91 { x: 40.9; y: 46.4; skew-x: -4.9; skew-y: -4.9; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 42.5; y: 48.5; skew-x: -6.6; skew-y: -6.6; scale-x: 0.798; scale-y: 0.798; }
        frame 93 { x: 36; y: -10000; skew-x: -11.2; skew-y: -11.2; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 29.7; y: 48.7; skew-x: -16; skew-y: -16; scale-x: 0.797; scale-y: 0.797; }
        frame 95 { x: 23.4; y: 48.9; skew-x: -20.7; skew-y: -20.7; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 17.2; y: 49.3; skew-x: -25.5; skew-y: -25.5; scale-x: 0.798; scale-y: 0.798; }
        frame 97 { x: 19.4; y: 55.6; skew-x: -21; skew-y: -21; scale-x: 0.796; scale-y: 0.796; }
        frame 98 { x: 21.7; y: 61.9; skew-x: -16.7; skew-y: -16.7; scale-x: 0.795; scale-y: 0.795; }
        frame 99 { x: 24.1; y: 68.3; skew-x: -12.4; skew-y: -12.4; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 24.2; y: 68.9; skew-x: -11.9; skew-y: -12.7; scale-x: 0.816; scale-y: 0.788; }
        frame 101 { x: 24; y: 69.4; skew-x: -11.6; skew-y: -13.4; scale-x: 0.838; scale-y: 0.783; }
        frame 102 { x: 22.6; y: 67.3; skew-x: -13.7; skew-y: -14.7; scale-x: 0.816; scale-y: 0.788; }
        frame 103 { x: 21.4; y: 65.3; skew-x: -15.9; skew-y: -15.9; scale-x: 0.794; scale-y: 0.794; }
        frame 104 { x: 17; y: 67.7; skew-x: -20.9; skew-y: -21.2; scale-x: 0.798; scale-y: 0.791; }
        frame 105 { x: 12.8; y: 70.1; skew-x: -26; skew-y: -26.5; scale-x: 0.803; scale-y: 0.789; }
        frame 106 { x: 8.6; y: 72.6; skew-x: -31.1; skew-y: -31.8; scale-x: 0.809; scale-y: 0.787; }
        frame 107 { x: 2.8; y: 76.2; skew-x: -40.3; skew-y: -40.3; scale-x: 0.792; scale-y: 0.792; }
        frame 108 { x: 1; y: 76.8; skew-x: -37.8; skew-y: -39.2; scale-x: 0.793; scale-y: 0.788; }
        frame 109 { x: -0.7; y: 77.5; skew-x: -35.5; skew-y: -38; scale-x: 0.797; scale-y: 0.786; }
        frame 110 { x: 0.4; y: 77; skew-x: -37; skew-y: -38.8; scale-x: 0.794; scale-y: 0.787; }
        frame 111 { x: 1.6; y: 76.7; skew-x: -38.7; skew-y: -39.5; scale-x: 0.792; scale-y: 0.789; }
        frame 112 { x: 2.8; y: 76.2; skew-x: -40.3; skew-y: -40.3; scale-x: -10000; scale-y: 0.792; }
        frame 113 { x: 2.3; y: 75.8; skew-x: -41.5; skew-y: -41.5; scale-x: 0.791; scale-y: 0.791; }
        frame 114 { x: 1.8; y: 75.4; skew-x: -42.7; skew-y: -42.7; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 1.3; y: 75.1; skew-x: -43.9; skew-y: -43.9; scale-x: 0.792; scale-y: 0.792; }
        frame 116 { x: -2.7; y: 75.2; skew-x: -38; skew-y: -38; scale-x: 0.791; scale-y: 0.791; }
        frame 117 { x: -6.6; y: 75.3; skew-x: -32; skew-y: -32; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: -10.3; y: 75.5; skew-x: -26.3; skew-y: -26.3; scale-x: 0.792; scale-y: 0.792; }
        frame 119 { x: -13.9; y: 79.9; skew-x: -21.2; skew-y: -21.2; scale-x: 0.79; scale-y: 0.79; }
        frame 120 { x: -17.4; y: 84.3; skew-x: -16.2; skew-y: -16.2; scale-x: 0.789; scale-y: 0.789; }
        frame 121 { x: -20.7; y: 89; skew-x: -11.3; skew-y: -11.3; scale-x: -10000; scale-y: -10000; }
        frame 122 { x: -22.8; y: 92.8; skew-x: -17.7; skew-y: -18.7; scale-x: 0.802; scale-y: 0.768; }
        frame 123 { x: -24.6; y: 96.7; skew-x: -24.1; skew-y: -26.2; scale-x: 0.816; scale-y: 0.749; }
        frame 124 { x: -22.2; y: 90.9; skew-x: -15.2; skew-y: -16.5; scale-x: 0.805; scale-y: 0.762; }
        frame 125 { x: -19.5; y: 85.3; skew-x: -6.4; skew-y: -7; scale-x: 0.796; scale-y: 0.777; }
        frame 126 { x: -22.3; y: 90.8; skew-x: -15.2; skew-y: -16.5; scale-x: 0.805; scale-y: 0.762; }
        frame 127 { x: -24.6; y: 96.7; skew-x: -24.1; skew-y: -26.2; scale-x: 0.816; scale-y: 0.749; }
        frame 128 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 129 { cel: -10000; }
        frame 146 { x: 38.9; y: 27.1; skew-x: -7.9; skew-y: -7.9; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_ZOMBIE_DIGGER_OUTERARM_UPPER; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 148 { cel: -10000; }
        frame 152 { cel: 0; }
        frame 153 { cel: -1; }
        frame 154 { cel: -10000; }
        frame 158 { cel: 0; }
        frame 159 { cel: -1; }
        frame 160 { cel: -10000; }
        frame 164 { x: 38.4; cel: 0; }
        frame 165 { x: -10000; cel: -10000; }
        frame 166 { x: 38; y: 29.6; skew-x: -6.2; skew-y: -6.2; }
        frame 167 { x: 37.5; y: 32.3; skew-x: -4.7; skew-y: -4.7; }
        frame 168 { x: 37; y: 34.8; skew-x: -3; skew-y: -3; }
        frame 169 { x: 36.5; y: 37.5; skew-x: -1.4; skew-y: -1.4; scale-x: 0.8; scale-y: 0.8; }
        frame 170 { x: 36; y: 40.1; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 35.6; y: 41.1; skew-x: -0.4; skew-y: -0.5; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { x: 35.3; y: 42.3; skew-x: -1.2; skew-y: -1.2; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: 34.9; y: 43.3; skew-x: -1.8; skew-y: -2.1; scale-x: 0.829; scale-y: 0.785; }
        frame 174 { x: 35.1; y: 42.6; skew-x: -1.2; skew-y: -1.4; scale-x: 0.821; scale-y: 0.789; }
        frame 175 { x: 35.4; y: 41.7; skew-x: -0.7; skew-y: -0.9; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: 35.6; y: 40.9; skew-x: -0.2; skew-y: -0.4; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: 36; y: 40.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 37.6; y: 40; skew-x: 2.5; skew-y: 2.5; }
        frame 181 { x: 39.3; y: 39.9; skew-x: 5.3; skew-y: 5.3; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: 41; y: -10000; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 42.8; skew-x: 10.5; skew-y: 10.5; }
        frame 184 { x: 44.7; y: 40; skew-x: 13.3; skew-y: 13.3; }
        frame 185 { x: 43.1; y: 40.7; skew-x: 9.8; skew-y: 9.8; scale-x: 0.798; scale-y: 0.798; }
        frame 186 { x: 41.4; y: 41.4; skew-x: 6.3; skew-y: 6.3; scale-x: 0.799; scale-y: 0.799; }
        frame 187 { x: 39.1; y: 42; skew-x: 2.5; skew-y: 2.5; scale-x: 0.798; scale-y: 0.798; }
        frame 188 { x: 36.9; y: 42.6; skew-x: -0.7; skew-y: -0.7; scale-x: 0.799; scale-y: 0.799; }
        frame 189 { x: 34.8; y: 43.3; skew-x: -4.2; skew-y: -4.2; scale-x: 0.798; scale-y: 0.798; }
        frame 190 { x: 32.6; y: 44.1; skew-x: -7.9; skew-y: -7.9; scale-x: -10000; scale-y: -10000; }
        frame 191 { x: 30.6; y: 44.9; skew-x: -11.4; skew-y: -11.4; }
        frame 192 { x: 28.7; y: 45.8; skew-x: -15; skew-y: -15; }
        frame 193 { x: 26.8; y: 46.6; skew-x: -18.7; skew-y: -18.7; }
        frame 194 { x: 24.8; y: 47.6; skew-x: -22.2; skew-y: -22.2; scale-x: 0.799; scale-y: 0.799; }
        frame 195 { x: 27.1; y: 46.6; skew-x: -19.5; skew-y: -19.5; scale-x: 0.798; scale-y: 0.798; }
        frame 196 { x: 29.5; y: 45.8; skew-x: -16.9; skew-y: -16.9; scale-x: -10000; scale-y: -10000; }
        frame 197 { x: 31.5; y: 43.8; skew-x: -11.2; skew-y: -11.2; }
        frame 198 { x: 33.6; y: 41.9; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 199 { x: 36; y: 40.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_digger_rise";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 147 { x: -2; y: -16.6; scale-x: 0.738; scale-y: 0.752; cel: 0; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE2; }
        frame 148 { x: -1.9; y: -16.8; scale-x: 0.757; scale-y: 0.754; cel: -10000; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE3; }
        frame 149 { x: -2; y: -16.6; scale-x: 0.738; scale-y: 0.738; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE4; }
        frame 150 { x: -1.9; y: -16.1; scale-x: -10000; scale-y: 0.757; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE5; }
        frame 151 { x: -2.1; y: -16.4; scale-y: 0.738; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE6; }
        frame 152 { x: -10000; y: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 153 { x: -2; y: -16.6; scale-y: 0.752; cel: 0; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE2; }
        frame 154 { x: -1.9; y: -16.8; scale-x: 0.757; scale-y: 0.754; cel: -10000; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE3; }
        frame 155 { x: -2; y: -16.6; scale-x: 0.738; scale-y: 0.738; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE4; }
        frame 156 { x: -1.9; y: -16.1; scale-x: -10000; scale-y: 0.757; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE5; }
        frame 157 { x: -2.1; y: -16.4; scale-y: 0.738; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE6; }
        frame 158 { x: -10000; y: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 159 { x: -2; y: -16.6; scale-y: 0.752; cel: 0; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE2; }
        frame 160 { x: -1.9; y: -16.8; scale-x: 0.757; scale-y: 0.754; cel: -10000; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE3; }
        frame 161 { x: -2; y: -16.6; scale-x: 0.738; scale-y: 0.738; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE4; }
        frame 162 { x: -1.9; y: -16.1; scale-x: -10000; scale-y: 0.757; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE5; }
        frame 163 { x: -2.1; y: -16.4; scale-y: 0.738; image: IMAGE_REANIM_ZOMBIE_DIGGER_RISE6; }
        frame 164 { x: -10000; y: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 165 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_digger_hardhat";
        frame-count: 200;
        frame 0 { x: -18.5; y: 2.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_HARDHAT; }
        frame 1 { x: -17.8; y: 0.8; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -17.1; y: -0.8; skew-x: 2.9; skew-y: 2.9; }
        frame 3 { x: -17.7; y: 0; skew-x: 2.8; skew-y: 2.8; }
        frame 4 { x: -18.1; y: 0.6; skew-x: 3; skew-y: 3; scale-x: 0.799; scale-y: 0.799; }
        frame 5 { x: -18.6; y: 1.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: -19.1; y: 2; skew-x: 3.3; skew-y: 3.3; }
        frame 7 { x: -19.7; y: 2.7; skew-x: -10000; skew-y: -10000; }
        frame 8 { x: -20.1; y: 3.5; }
        frame 9 { x: -20.6; y: 4.1; skew-x: 3.6; skew-y: 3.6; }
        frame 10 { x: -21.6; y: 6.3; skew-x: 1.8; skew-y: 1.8; }
        frame 11 { x: -22.6; y: 8.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: -21.9; y: 7.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -21.3; y: 6.4; }
        frame 14 { x: -20.6; y: 5.4; }
        frame 15 { x: -19.9; y: 4.4; }
        frame 16 { x: -19.3; y: 3.3; }
        frame 17 { x: -18.5; y: 2.3; }
        frame 18 { x: 2; y: -14.2; skew-x: 18.1; skew-y: 18.1; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: 4.3; y: -15.3; skew-x: 19.6; skew-y: 19.6; scale-x: 0.798; scale-y: 0.798; }
        frame 20 { x: 6.7; y: -16.5; skew-x: 21.3; skew-y: 21.3; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 8.9; y: -17.7; skew-x: 22.8; skew-y: 22.8; }
        frame 22 { x: 11.3; y: -18.9; skew-x: 24.6; skew-y: 24.6; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: -0; y: -10.5; skew-x: 17.1; skew-y: 17.1; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: -11; y: -1.7; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -21.5; y: 7.4; skew-x: 2.3; skew-y: 2.3; }
        frame 26 { x: -31.5; y: 16.8; skew-x: -4.9; skew-y: -4.9; scale-x: 0.797; scale-y: 0.797; }
        frame 27 { x: -30.9; y: 17.3; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -30.4; y: 18.1; skew-x: -7.6; skew-y: -7.6; }
        frame 29 { x: -27.9; y: 12.5; skew-x: -4.2; skew-y: -4.2; }
        frame 30 { x: -25.1; y: 6.9; skew-x: -0.9; skew-y: -0.9; }
        frame 31 { x: -22.1; y: 4.1; skew-x: 1; skew-y: 1; }
        frame 32 { x: -19.1; y: 1.4; skew-x: 2.8; skew-y: 2.8; }
        frame 33 { x: -16.1; y: -1.3; skew-x: 4.8; skew-y: 4.8; }
        frame 34 { x: -13; y: -4.1; skew-x: 6.9; skew-y: 6.9; }
        frame 35 { x: -9.7; y: -6.4; skew-x: 9.5; skew-y: 9.5; scale-x: 0.796; scale-y: 0.796; }
        frame 36 { x: -6.4; y: -8.8; skew-x: 12.1; skew-y: 12.1; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: -2.9; y: -11; skew-x: 14.8; skew-y: 14.8; }
        frame 38 { x: 0.4; y: -13.3; skew-x: 17.5; skew-y: 17.5; }
        frame 39 { x: 3.5; y: -15.2; skew-x: 19.5; skew-y: 19.5; scale-x: 0.795; scale-y: 0.795; }
        frame 40 { x: 6.6; y: -17.2; skew-x: 21.6; skew-y: 21.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 9.9; y: -19; skew-x: 23.6; skew-y: 23.6; }
        frame 42 { x: 13; y: -21.1; skew-x: 25.8; skew-y: 25.8; scale-x: 0.796; scale-y: 0.796; }
        frame 43 { x: 1.1; y: -12.3; skew-x: 18; skew-y: 18; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: -10.3; y: -2.9; skew-x: 10.3; skew-y: 10.3; }
        frame 45 { x: -21.3; y: 6.7; skew-x: 2.5; skew-y: 2.5; scale-x: 0.797; scale-y: 0.797; }
        frame 46 { x: -31.5; y: 16.8; skew-x: -4.9; skew-y: -4.9; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: -31.9; y: 19.2; skew-x: -8.4; skew-y: -8.4; }
        frame 48 { x: -32.2; y: 21.8; skew-x: -12; skew-y: -12; }
        frame 49 { x: -28.3; y: 15.7; skew-x: -7.2; skew-y: -7.2; }
        frame 50 { x: -24.3; y: 9.7; skew-x: -2.6; skew-y: -2.6; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { x: -18; y: 3.4; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: -11.4; y: -2.4; skew-x: 7.6; skew-y: 7.6; }
        frame 53 { x: -4.6; y: -8.3; skew-x: 12.8; skew-y: 12.8; }
        frame 54 { x: 2; y: -14.2; skew-x: 18.1; skew-y: 18.1; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: -18.5; y: 2.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 56 { x: -14.5; y: -1; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: -10.3; y: -4.4; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: -6.1; y: -7.8; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -1.7; y: -11.2; skew-x: 13.4; skew-y: 13.4; }
        frame 60 { x: 1; y: -13.3; skew-x: 15.8; skew-y: 15.8; }
        frame 61 { x: 3.9; y: -15.3; skew-x: 18.1; skew-y: 18.1; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: 6.9; y: -17.3; skew-x: 20.5; skew-y: 20.5; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 9.9; y: -19.3; skew-x: 22.9; skew-y: 22.9; scale-x: 0.799; scale-y: 0.799; }
        frame 64 { x: -3.5; y: -10.3; skew-x: 15; skew-y: 15; scale-x: 0.798; scale-y: 0.798; }
        frame 65 { x: -16.6; y: -0.8; skew-x: 7.1; skew-y: 7.1; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: -29.2; y: 8.8; skew-x: -0.5; skew-y: -0.5; scale-x: 0.797; scale-y: 0.797; }
        frame 67 { x: -25.2; y: 7.7; skew-x: -0.2; skew-y: -0.2; scale-x: 0.798; scale-y: 0.798; }
        frame 68 { x: -21.3; y: 6.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: -16.7; y: 2; skew-x: 3.3; skew-y: 3.3; }
        frame 70 { x: -11.9; y: -2.3; skew-x: 6.5; skew-y: 6.5; }
        frame 71 { x: -7; y: -6.9; skew-x: 10; skew-y: 10; }
        frame 72 { x: -1.7; y: -11.2; skew-x: 13.4; skew-y: 13.4; scale-x: 0.799; scale-y: 0.799; }
        frame 73 { x: 0.8; y: -13; skew-x: 15.5; skew-y: 15.5; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 3.5; y: -14.7; skew-x: 17.6; skew-y: 17.6; scale-x: 0.798; scale-y: 0.798; }
        frame 75 { x: 6.2; y: -16.4; skew-x: 19.8; skew-y: 19.8; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 9; y: -18.2; skew-x: 22; skew-y: 22; }
        frame 77 { x: 11.8; y: -19.7; skew-x: 24.1; skew-y: 24.1; }
        frame 78 { x: 14.7; y: -21.5; skew-x: 26.4; skew-y: 26.4; scale-x: 0.799; scale-y: 0.799; }
        frame 79 { x: -3.6; y: -8.8; skew-x: 15; skew-y: 15; scale-x: 0.797; scale-y: 0.797; }
        frame 80 { x: -21.2; y: 4.9; skew-x: 3.6; skew-y: 3.6; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -37.6; y: 19.2; skew-x: -7.6; skew-y: -7.6; }
        frame 82 { x: -35.5; y: 18.6; skew-x: -7.4; skew-y: -7.4; }
        frame 83 { x: -33.5; y: 17.8; skew-x: -7.2; skew-y: -7.2; scale-x: 0.798; scale-y: 0.798; }
        frame 84 { x: -29.8; y: 13.8; skew-x: -5.4; skew-y: -5.4; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: -26.1; y: 9.8; skew-x: -3.4; skew-y: -3.4; scale-x: 0.799; scale-y: 0.799; }
        frame 86 { x: -22.4; y: 5.8; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -18.5; y: 2.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 89 { cel: -10000; }
        frame 128 { x: 17.8; y: 97; skew-x: 13.3; skew-y: 13.3; scale-x: 0.799; scale-y: 0.799; cel: 0; }
        frame 129 { x: -10000; y: 96.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 130 { y: 96.3; }
        frame 131 { x: 17.7; y: 95.8; }
        frame 132 { x: 17.8; y: 96.5; }
        frame 133 { x: -10000; y: 97.1; }
        frame 134 { y: 97; }
        frame 135 { y: 96.7; }
        frame 136 { y: 96.3; }
        frame 137 { x: 17.7; y: 95.8; }
        frame 138 { x: 17.8; y: 96.5; }
        frame 139 { x: -10000; y: 97.1; }
        frame 140 { y: 97; }
        frame 141 { y: 96.7; }
        frame 142 { y: 96.3; }
        frame 143 { x: 17.7; y: 95.8; }
        frame 144 { x: 17.8; y: 96.5; }
        frame 145 { x: -10000; y: 97.1; }
        frame 146 { x: -1.7; y: -22.6; skew-x: 5.8; skew-y: 5.8; scale-x: 0.8; scale-y: 0.8; }
        frame 147 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 148 { x: 96; skew-x: 174.2; skew-y: -5.7; cel: 0; }
        frame 149 { x: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 150 { cel: -10000; }
        frame 152 { x: -1.7; skew-x: 5.8; skew-y: 5.8; cel: 0; }
        frame 153 { x: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 154 { x: 97; y: -22.8; skew-x: 174.2; skew-y: -5.7; cel: 0; }
        frame 155 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 156 { cel: -10000; }
        frame 158 { x: -1.7; y: -22.6; skew-x: 5.8; skew-y: 5.8; cel: 0; }
        frame 159 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 160 { x: 94.3; skew-x: 174.2; skew-y: -5.7; cel: 0; }
        frame 161 { x: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 162 { cel: -10000; }
        frame 164 { x: -2.2; skew-x: 5.8; skew-y: 5.8; cel: 0; }
        frame 165 { x: -10000; skew-x: -10000; skew-y: -10000; cel: -10000; }
        frame 166 { x: -5.6; y: -17.5; skew-x: 4.5; skew-y: 4.5; }
        frame 167 { x: -8.9; y: -12.5; skew-x: 3.3; skew-y: 3.3; }
        frame 168 { x: -12.1; y: -7.5; skew-x: 2.3; skew-y: 2.3; }
        frame 169 { x: -15.3; y: -2.5; skew-x: 1; skew-y: 1; }
        frame 170 { x: -18.5; y: 2.3; skew-x: 0; skew-y: 0; }
        frame 171 { x: -19.6; y: 3.6; skew-x: -10000; skew-y: -10000; scale-x: 0.81; scale-y: 0.795; }
        frame 172 { x: -20.7; y: 4.8; scale-x: 0.819; scale-y: 0.79; }
        frame 173 { x: -21.8; y: 6; scale-x: 0.829; scale-y: 0.785; }
        frame 174 { x: -21; y: 5.1; scale-x: 0.822; scale-y: 0.789; }
        frame 175 { x: -20.1; y: 4.2; scale-x: 0.814; scale-y: 0.792; }
        frame 176 { x: -19.4; y: 3.3; scale-x: 0.807; scale-y: 0.796; }
        frame 177 { x: -18.5; y: 2.3; scale-x: 0.8; scale-y: 0.8; }
        frame 178 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: -14.2; y: -0.2; skew-x: 3.3; skew-y: 3.3; }
        frame 181 { x: -9.6; y: -2.8; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: -5; y: -5.4; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: -0.3; y: -7.9; skew-x: 13.3; skew-y: 13.3; }
        frame 184 { x: 4.3; y: -10.3; skew-x: 16.6; skew-y: 16.6; }
        frame 185 { x: 5.3; y: -11.8; skew-x: 19.8; skew-y: 19.8; scale-x: 0.798; scale-y: 0.798; }
        frame 186 { x: 6.4; y: -13.5; skew-x: 23.4; skew-y: 23.4; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 0.2; y: -9.8; skew-x: 18.3; skew-y: 18.3; }
        frame 188 { x: -5.7; y: -5.9; skew-x: 13.1; skew-y: 13.1; }
        frame 189 { x: -11.6; y: -1.9; skew-x: 8; skew-y: 8; }
        frame 190 { x: -17.2; y: 2.1; skew-x: 3; skew-y: 3; scale-x: 0.799; scale-y: 0.799; }
        frame 191 { x: -22.6; y: 6.5; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 192 { x: -27.7; y: 11.1; skew-x: -6.9; skew-y: -6.9; }
        frame 193 { x: -32.6; y: 15.7; skew-x: -12; skew-y: -12; }
        frame 194 { x: -37.4; y: 20.5; skew-x: -17.2; skew-y: -17.2; }
        frame 195 { x: -36.5; y: 21.4; skew-x: -18.2; skew-y: -18.2; scale-x: 0.798; scale-y: 0.798; }
        frame 196 { x: -35.5; y: 22.3; skew-x: -19.5; skew-y: -19.5; scale-x: -10000; scale-y: -10000; }
        frame 197 { x: -30.2; y: 15.5; skew-x: -12.9; skew-y: -12.9; }
        frame 198 { x: -24.5; y: 8.8; skew-x: -6.4; skew-y: -6.4; scale-x: 0.799; scale-y: 0.799; }
        frame 199 { x: -18.5; y: 2.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_digger_dig";
        frame-count: 200;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 128 { x: 13.6; y: 108.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG0; }
        frame 129 { x: 14; y: 109.3; skew-x: -0.6; skew-y: 1.5; scale-x: 0.808; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG1; }
        frame 130 { x: 15.4; y: 107.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.692; scale-y: 0.833; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG2; }
        frame 131 { x: 12.6; y: 108.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG3; }
        frame 132 { x: 13.9; y: 108.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG4; }
        frame 133 { x: 15.1; y: 109.8; scale-x: 0.824; scale-y: 0.753; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG5; }
        frame 134 { x: 13.6; y: 108.4; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG0; }
        frame 135 { x: 14; y: 109.3; skew-x: -0.6; skew-y: 1.5; scale-x: 0.808; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG1; }
        frame 136 { x: 15.4; y: 107.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.692; scale-y: 0.833; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG2; }
        frame 137 { x: 12.6; y: 108.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG3; }
        frame 138 { x: 13.9; y: 108.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG4; }
        frame 139 { x: 15.1; y: 109.8; scale-x: 0.824; scale-y: 0.753; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG5; }
        frame 140 { x: 13.6; y: 108.4; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG0; }
        frame 141 { x: 14; y: 109.3; skew-x: -0.6; skew-y: 1.5; scale-x: 0.808; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG1; }
        frame 142 { x: 15.4; y: 107.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.692; scale-y: 0.833; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG2; }
        frame 143 { x: 12.6; y: 108.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG3; }
        frame 144 { x: 13.9; y: 108.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG4; }
        frame 145 { x: 15.1; y: 109.8; scale-x: 0.824; scale-y: 0.753; image: IMAGE_REANIM_ZOMBIE_DIGGER_DIG5; }
        frame 146 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 147 { cel: -10000; }
    }
}
