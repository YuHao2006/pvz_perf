export component Zombie_backup {
    fps: 24;
    Track {
        source-name: "anim_walk";
        frame-count: 118;
        frame 0 { y: -16.9; }
        frame 1 { y: -10000; }
        frame 21 { cel: -1; }
        frame 22 { cel: -10000; }
    }
    Track {
        source-name: "anim_armraise";
        frame-count: 118;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { y: -16.9; cel: 0; }
        frame 22 { y: -10000; cel: -10000; }
        frame 43 { cel: -1; }
        frame 44 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 118;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 43 { x: -0.4; y: -13.9; skew-x: 3.3; skew-y: 3.3; cel: 0; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -10000; }
        frame 74 { cel: -1; }
        frame 75 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 118;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 74 { x: 200.5; y: 59.4; skew-x: 99.1; skew-y: 99.1; scale-x: 0.999; scale-y: 0.999; cel: 0; }
        frame 75 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 118;
        frame 0 { x: -9.8; y: 40; }
        frame 1 { x: -7.3; y: -10000; }
        frame 2 { x: -4.8; }
        frame 3 { x: -2.3; }
        frame 4 { x: 0; }
        frame 5 { x: -10000; }
        frame 11 { x: 1.3; }
        frame 12 { x: 2.5; }
        frame 13 { x: 3.8; }
        frame 14 { x: 5; }
        frame 15 { x: -10000; }
        frame 21 { cel: -1; }
        frame 22 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_innerarm_upper";
        frame-count: 118;
        frame 0 { x: 42.5; y: 7.1; skew-x: 78.7; skew-y: 78.7; scale-x: 0.793; scale-y: 0.793; image: IMAGE_REANIM_ZOMBIE_BACKUP_INNERARM_UPPER; }
        frame 1 { x: 42; y: 5.1; skew-x: 76; skew-y: 76; scale-x: 0.792; scale-y: 0.792; image: none; }
        frame 2 { x: 41.3; y: 2.9; skew-x: 73.2; skew-y: 73.2; scale-x: 0.791; scale-y: 0.791; }
        frame 3 { x: 40.7; y: 1.1; skew-x: 70.4; skew-y: 70.4; scale-x: 0.792; scale-y: 0.792; }
        frame 4 { x: 40.2; y: 2.4; skew-x: 64.9; skew-y: 64.9; scale-x: 0.791; scale-y: 0.791; }
        frame 5 { x: 39.9; y: 3.8; skew-x: 59.4; skew-y: 59.4; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 39.5; y: 5.3; skew-x: 53.7; skew-y: 53.7; scale-x: 0.792; scale-y: 0.792; }
        frame 7 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 40; y: 3.8; skew-x: 59.4; skew-y: 59.4; scale-x: 0.791; scale-y: 0.791; }
        frame 12 { x: 40.4; y: 2.3; skew-x: 64.9; skew-y: 64.9; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 40.7; y: 1.1; skew-x: 70.4; skew-y: 70.4; scale-x: 0.792; scale-y: 0.792; }
        frame 14 { x: 41.3; y: 3; skew-x: 73.2; skew-y: 73.2; scale-x: 0.791; scale-y: 0.791; }
        frame 15 { x: 41.9; y: 5; skew-x: 76; skew-y: 76; scale-x: 0.792; scale-y: 0.792; }
        frame 16 { x: 42.5; y: 7.1; skew-x: 78.7; skew-y: 78.7; scale-x: 0.793; scale-y: 0.793; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 20.2; y: 17.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 25.2; y: 14.3; skew-x: 13.8; skew-y: 13.8; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 30.6; y: 11.2; skew-x: 27.6; skew-y: 27.6; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 36.4; y: 8.3; skew-x: 41.4; skew-y: 41.4; scale-x: 0.799; scale-y: 0.799; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 40.5; y: 6.6; skew-x: 67.7; skew-y: 67.7; scale-x: 0.798; scale-y: 0.798; }
        frame 28 { x: 44.9; y: 6.8; skew-x: 94; skew-y: 94; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 48.9; y: 8.8; skew-x: 120.3; skew-y: 120.3; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 37 { x: 44; y: 7.7; skew-x: 100.3; skew-y: 100.3; }
        frame 38 { x: 38.5; y: 7.8; skew-x: 80.2; skew-y: 80.2; }
        frame 39 { x: 33; y: 8.9; skew-x: 60.2; skew-y: 60.2; }
        frame 40 { x: 28; y: 11; skew-x: 40.1; skew-y: 40.1; }
        frame 41 { x: 23.6; y: 14.1; skew-x: 20; skew-y: 20; scale-x: 0.799; scale-y: 0.799; }
        frame 42 { x: 20.2; y: 17.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 21.1; }
        frame 45 { x: 21.9; }
        frame 46 { x: 22.7; }
        frame 47 { x: 23.6; }
        frame 48 { x: 24.4; }
        frame 49 { x: 25.2; }
        frame 50 { x: 23.6; y: 19.4; }
        frame 51 { x: 21.9; y: 21.1; }
        frame 52 { x: 20.2; y: 22.8; }
        frame 53 { x: -10000; y: 21.5; }
        frame 54 { y: 20.3; }
        frame 55 { y: 19; }
        frame 56 { y: 17.8; }
        frame 57 { y: -10000; }
        frame 59 { x: 20.6; y: 18.2; skew-x: 1.3; skew-y: 1.3; }
        frame 60 { x: 20.8; y: 18.7; skew-x: 2.5; skew-y: 2.5; }
        frame 61 { x: 21.3; y: 19.1; skew-x: 4; skew-y: 4; }
        frame 62 { x: 21.9; y: 19.6; skew-x: 5; skew-y: 5; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: 22.5; y: 20.1; skew-x: 6.1; skew-y: 6.1; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 22.9; y: 20.5; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 65 { x: 21; y: 23.1; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 66 { x: 19; y: 25.7; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 17; y: 28.2; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: 17.6; y: 26.5; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 69 { x: 18.1; y: 24.8; skew-x: 4.8; skew-y: 4.8; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 18.6; y: 23; skew-x: 3.5; skew-y: 3.5; scale-x: 0.8; scale-y: 0.8; }
        frame 71 { x: 19.2; y: 21.3; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 19.7; y: 19.6; skew-x: 1; skew-y: 1; }
        frame 73 { x: 20.2; y: 17.8; skew-x: 0; skew-y: 0; }
        frame 74 { x: 39.8; y: 13; skew-x: -10000; skew-y: -10000; }
        frame 75 { x: 41.9; y: 12.8; skew-x: 1.3; skew-y: 1.3; }
        frame 76 { x: 43.6; y: 12.6; skew-x: 2.5; skew-y: 2.5; }
        frame 77 { x: 45.2; y: 12.5; skew-x: 3.5; skew-y: 3.5; }
        frame 78 { x: 46.5; y: 12.3; skew-x: 4.3; skew-y: 4.3; }
        frame 79 { x: 47.6; y: 12.2; skew-x: 5.1; skew-y: 5.1; }
        frame 80 { x: 48.5; y: 12.1; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 81 { x: 49.1; y: -10000; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 49.5; y: 12; skew-x: 6.3; skew-y: 6.3; }
        frame 83 { x: 49.6; y: 11.9; skew-x: 6.5; skew-y: 6.5; scale-x: 0.8; scale-y: 0.8; }
        frame 84 { x: 47.8; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 85 { x: 46.1; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 44.7; }
        frame 87 { x: 43.5; }
        frame 88 { x: 42.5; }
        frame 89 { x: 41.5; }
        frame 90 { x: 40.9; }
        frame 91 { x: 40.5; }
        frame 92 { x: 40.1; }
        frame 93 { x: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 94 { x: 40.9; skew-x: 7; skew-y: 7; scale-x: 0.799; scale-y: 0.799; }
        frame 95 { x: 42.9; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 46.5; y: 12; skew-x: 11.3; skew-y: 11.3; }
        frame 97 { x: 51.5; y: 12.1; skew-x: 14.8; skew-y: 14.8; }
        frame 98 { x: 58; y: 12.3; skew-x: 19.6; skew-y: 19.6; scale-x: 0.798; scale-y: 0.798; }
        frame 99 { x: 66.1; y: 12.4; skew-x: 25.5; skew-y: 25.5; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 75.7; y: 12.8; skew-x: 32.3; skew-y: 32.3; scale-x: 0.797; scale-y: 0.797; }
        frame 101 { x: 86.8; y: 13.3; skew-x: 40.4; skew-y: 40.4; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 99.7; y: 14; skew-x: 49.4; skew-y: 49.4; }
        frame 103 { x: 114.1; y: 15.1; skew-x: 59.4; skew-y: 59.4; scale-x: 0.798; scale-y: 0.798; }
        frame 104 { x: 141.7; y: 32; skew-x: 74.7; skew-y: 74.7; scale-x: 0.797; scale-y: 0.797; }
        frame 105 { x: 169.3; y: 49.3; skew-x: 89.7; skew-y: 89.7; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 187.9; y: 73.8; skew-x: 104.6; skew-y: 104.6; scale-x: 0.797; scale-y: 0.797; }
        frame 107 { x: 206.3; y: 98.9; skew-x: 119.7; skew-y: 119.7; scale-x: 0.798; scale-y: 0.798; }
        frame 108 { x: 204.8; y: 97.9; skew-x: 108.3; skew-y: 108.3; scale-x: 0.797; scale-y: 0.797; }
        frame 109 { x: 203.1; y: 97.2; skew-x: 96.8; skew-y: 96.8; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 201.3; y: 96.7; skew-x: 85.5; skew-y: 85.5; }
        frame 111 { x: 199.5; y: -10000; skew-x: 74.1; skew-y: 74.1; }
        frame 112 { x: 199.9; y: 96.6; skew-x: 76.2; skew-y: 76.2; scale-x: 0.796; scale-y: 0.796; }
        frame 113 { x: 200.2; y: 96.7; skew-x: 78.4; skew-y: 78.4; scale-x: -10000; scale-y: -10000; }
        frame 114 { x: 200.5; y: -10000; skew-x: 80.4; skew-y: 80.4; }
        frame 115 { x: 200.2; skew-x: 78.4; skew-y: 78.4; }
        frame 116 { x: 199.8; skew-x: 76.2; skew-y: 76.2; }
        frame 117 { x: 199.5; skew-x: 74.1; skew-y: 74.1; scale-x: 0.797; scale-y: 0.797; }
    }
    Track {
        source-name: "Zombie_disco_innerarm_lower";
        frame-count: 118;
        frame 0 { x: 30; y: 18.8; skew-x: 163.6; skew-y: 163.6; scale-x: 0.789; scale-y: 0.789; image: IMAGE_REANIM_ZOMBIE_BACKUP_INNERARM_LOWER; }
        frame 1 { x: 29.9; y: 18.1; skew-x: 164; skew-y: 164; scale-x: 0.788; scale-y: 0.788; image: none; }
        frame 2 { x: -10000; y: 17.3; skew-x: 164.2; skew-y: 164.2; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 30; y: 16.5; skew-x: 164.4; skew-y: 164.4; scale-x: 0.789; scale-y: 0.789; }
        frame 4 { x: 30.7; y: 20.4; skew-x: 164.9; skew-y: 164.9; scale-x: 0.788; scale-y: 0.788; }
        frame 5 { x: 31.4; y: 24.3; skew-x: 165.2; skew-y: 165.2; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 32.1; y: 28.2; skew-x: 165.6; skew-y: 165.6; scale-x: 0.789; scale-y: 0.789; }
        frame 7 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 31.4; y: 24.3; skew-x: 165.2; skew-y: 165.2; scale-x: 0.788; scale-y: 0.788; }
        frame 12 { x: 30.6; y: 20.5; skew-x: 164.9; skew-y: 164.9; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 30; y: 16.5; skew-x: 164.4; skew-y: 164.4; scale-x: 0.789; scale-y: 0.789; }
        frame 14 { x: 29.9; y: 17.2; skew-x: 164.2; skew-y: 164.2; scale-x: 0.788; scale-y: 0.788; }
        frame 15 { x: -10000; y: 18; skew-x: 164; skew-y: 164; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 30; y: 18.8; skew-x: 163.6; skew-y: 163.6; scale-x: 0.789; scale-y: 0.789; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 14.2; y: 41.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 19.3; y: 30.3; skew-x: 48.9; skew-y: 48.9; scale-x: 0.798; scale-y: 0.798; }
        frame 23 { x: 28.8; y: 26.4; skew-x: 97.5; skew-y: 97.5; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { x: 35.9; y: 31.1; skew-x: 146.4; skew-y: 146.4; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 27 { x: 32; y: 18.4; skew-x: 141.9; skew-y: 141.9; scale-x: 0.797; scale-y: 0.797; }
        frame 28 { x: 31.7; y: 5.8; skew-x: 137.1; skew-y: 137.1; scale-x: 0.796; scale-y: 0.796; }
        frame 29 { x: 31.3; y: -6.8; skew-x: 132.4; skew-y: 132.4; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 27; y: 1.1; skew-x: 122.3; skew-y: 122.3; scale-x: 0.797; scale-y: 0.797; }
        frame 38 { x: 22.6; y: 9.5; skew-x: 112.3; skew-y: 112.3; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 17.8; y: 18.3; skew-x: 102.3; skew-y: 102.3; scale-x: 0.799; scale-y: 0.799; }
        frame 40 { x: 14.9; y: 22.1; skew-x: 68.2; skew-y: 68.2; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 12.9; y: 30.4; skew-x: 34.1; skew-y: 34.1; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 14.2; y: 41.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 15.1; }
        frame 45 { x: 15.9; }
        frame 46 { x: 16.7; }
        frame 47 { x: 17.6; }
        frame 48 { x: 18.4; }
        frame 49 { x: 19.2; }
        frame 50 { x: 17.7; y: 43.4; }
        frame 51 { x: 16.2; y: 45; }
        frame 52 { x: 14.7; y: 46.7; }
        frame 53 { x: 14.6; y: 45.5; }
        frame 54 { x: 14.5; y: 44.2; }
        frame 55 { x: 14.3; y: 43; }
        frame 56 { x: 14.2; y: 41.7; }
        frame 57 { x: -10000; y: -10000; }
        frame 59 { x: 15.4; y: 38.6; skew-x: 20.8; skew-y: 20.8; scale-x: 0.798; scale-y: 0.798; }
        frame 60 { x: 18.2; y: 36.4; skew-x: 41.8; skew-y: 41.8; scale-x: 0.797; scale-y: 0.797; }
        frame 61 { x: 21.9; y: 35.4; skew-x: 62.7; skew-y: 62.7; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: 25.4; y: 35.9; skew-x: 78.5; skew-y: 78.5; scale-x: 0.797; scale-y: 0.797; }
        frame 63 { x: 28.9; y: 37.3; skew-x: 94; skew-y: 94; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 32.3; y: 39.5; skew-x: 109.8; skew-y: 109.8; scale-x: 0.798; scale-y: 0.798; }
        frame 65 { x: 30.8; y: 41.3; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 66 { x: 29.2; y: 43.1; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 27.8; y: 45; scale-x: 0.798; scale-y: 0.798; }
        frame 68 { x: 24.8; y: 41.4; skew-x: 91.5; skew-y: 91.5; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 21.6; y: 39.1; skew-x: 73.2; skew-y: 73.2; scale-x: 0.797; scale-y: 0.797; }
        frame 70 { x: 18.6; y: 38.2; skew-x: 54.9; skew-y: 54.9; scale-x: 0.798; scale-y: 0.798; }
        frame 71 { x: 16.2; y: 38.5; skew-x: 36.6; skew-y: 36.6; scale-x: 0.797; scale-y: 0.797; }
        frame 72 { x: 14.6; y: 39.9; skew-x: 18.3; skew-y: 18.3; scale-x: 0.798; scale-y: 0.798; }
        frame 73 { x: 14.2; y: 41.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 74 { x: 32.5; y: 36.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 33.7; y: -10000; }
        frame 76 { x: 34.8; }
        frame 77 { x: 35.8; }
        frame 78 { x: 36.6; }
        frame 79 { x: 37.3; }
        frame 80 { x: 37.8; }
        frame 81 { x: 38.1; }
        frame 82 { x: 38.4; }
        frame 83 { x: 38.5; }
        frame 84 { x: 36.5; y: 37.2; skew-x: -1.2; skew-y: -1.2; }
        frame 85 { x: 35; y: 37.5; skew-x: -2.4; skew-y: -2.4; }
        frame 86 { x: 33.5; y: 37.7; skew-x: -3.5; skew-y: -3.5; }
        frame 87 { x: 32.3; y: 38; skew-x: -4.4; skew-y: -4.4; }
        frame 88 { x: 31.3; y: 38.1; skew-x: -5.2; skew-y: -5.2; scale-x: 0.799; scale-y: 0.799; }
        frame 89 { x: 30.4; y: 38.3; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 29.7; y: 38.4; skew-x: -6.4; skew-y: -6.4; }
        frame 91 { x: 29.2; y: -10000; skew-x: -6.9; skew-y: -6.9; }
        frame 92 { x: 28.9; y: 38.5; skew-x: -7; skew-y: -7; }
        frame 93 { x: 28.8; y: 38.6; skew-x: -7.2; skew-y: -7.2; scale-x: 0.8; scale-y: 0.8; }
        frame 94 { x: 29.3; y: 38.4; skew-x: -6.4; skew-y: -6.4; scale-x: 0.799; scale-y: 0.799; }
        frame 95 { x: 30.9; y: 37.8; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 33.7; y: 36.7; skew-x: -1.5; skew-y: -1.5; }
        frame 97 { x: 37.8; y: 35.3; skew-x: 2.5; skew-y: 2.5; }
        frame 98 { x: 43; y: 33.5; skew-x: 8; skew-y: 8; }
        frame 99 { x: 49.5; y: 31.3; skew-x: 14.8; skew-y: 14.8; scale-x: 0.798; scale-y: 0.798; }
        frame 100 { x: 57.6; y: 28.7; skew-x: 23; skew-y: 23; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 67.2; y: 26; skew-x: 32.3; skew-y: 32.3; scale-x: 0.797; scale-y: 0.797; }
        frame 102 { x: 78.3; y: 23.2; skew-x: 42.9; skew-y: 42.9; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 91; y: 20.6; skew-x: 54.7; skew-y: 54.7; }
        frame 104 { x: 121.7; y: 31; skew-x: 74.4; skew-y: 74.4; }
        frame 105 { x: 152.3; y: 43; skew-x: 94; skew-y: 94; }
        frame 106 { x: 174; y: 62.9; skew-x: 113.8; skew-y: 113.8; scale-x: 0.796; scale-y: 0.796; }
        frame 107 { x: 194.8; y: 84.2; skew-x: 133.7; skew-y: 133.7; scale-x: 0.797; scale-y: 0.797; }
        frame 108 { x: 190.9; y: 86; skew-x: 119.8; skew-y: 119.8; scale-x: 0.796; scale-y: 0.796; }
        frame 109 { x: 186.7; y: 88.3; skew-x: 106; skew-y: 106; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 182.1; y: 91.5; skew-x: 92.3; skew-y: 92.3; }
        frame 111 { x: 177.2; y: 95.1; skew-x: 78.5; skew-y: 78.5; }
        frame 112 { x: 177.3; y: 94.8; skew-x: 79.4; skew-y: 79.4; }
        frame 113 { x: 177.5; y: 94.5; skew-x: 80.2; skew-y: 80.2; }
        frame 114 { x: 177.7; y: 94.1; skew-x: 80.8; skew-y: 80.8; }
        frame 115 { x: 177.5; y: 94.4; skew-x: 80.2; skew-y: 80.2; }
        frame 116 { x: 177.3; y: 94.7; skew-x: 79.4; skew-y: 79.4; }
        frame 117 { x: 177.2; y: 95.1; skew-x: 78.5; skew-y: 78.5; }
    }
    Track {
        source-name: "Zombie_disco_innerhand";
        frame-count: 118;
        frame 0 { x: 25.4; y: 6.3; skew-x: 171.5; skew-y: 171.5; scale-x: 0.798; scale-y: 0.798; image: IMAGE_REANIM_ZOMBIE_BACKUP_INNERHAND; }
        frame 1 { x: 25.5; y: 3.9; skew-x: 164.7; skew-y: 164.7; scale-x: 0.797; scale-y: 0.797; image: none; }
        frame 2 { x: 25.4; y: 1.8; skew-x: 157.7; skew-y: 157.7; scale-x: 0.796; scale-y: 0.796; }
        frame 3 { x: 25.3; y: -0.7; skew-x: 150.7; skew-y: 150.7; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 26.5; y: 4.8; skew-x: 160.7; skew-y: 160.7; scale-x: 0.795; scale-y: 0.795; }
        frame 5 { x: 27.4; y: 10.4; skew-x: 170.7; skew-y: 170.7; scale-x: 0.796; scale-y: 0.796; }
        frame 6 { x: 27.9; y: 16; skew-x: 180.4; skew-y: 180.4; scale-x: 0.797; scale-y: 0.797; }
        frame 7 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 27.4; y: 10.4; skew-x: 170.7; skew-y: 170.7; scale-x: 0.796; scale-y: 0.796; }
        frame 12 { x: 26.5; y: 4.8; skew-x: 160.7; skew-y: 160.7; scale-x: 0.795; scale-y: 0.795; }
        frame 13 { x: 25.3; y: -0.7; skew-x: 150.7; skew-y: 150.7; scale-x: 0.796; scale-y: 0.796; }
        frame 14 { x: 25.5; y: 1.7; skew-x: 157.7; skew-y: 157.7; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: -10000; y: 4; skew-x: 164.7; skew-y: 164.7; scale-x: 0.797; scale-y: 0.797; }
        frame 16 { x: 25.4; y: 6.3; skew-x: 171.5; skew-y: 171.5; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 13.6; y: 61.5; skew-x: -8; skew-y: -8; scale-x: 0.797; scale-y: 0.797; image: IMAGE_REANIM_ZOMBIE_BACKUP_INNERHAND_POINT; }
        frame 22 { x: 6.5; y: 39.5; skew-x: 43.4; skew-y: 43.4; scale-x: 0.796; scale-y: 0.796; image: none; }
        frame 23 { x: 12.1; y: 23.7; skew-x: 94.6; skew-y: 94.6; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: 26.7; y: 14.8; skew-x: 146.1; skew-y: 146.1; scale-x: 0.799; scale-y: 0.799; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 21.8; y: 2.7; skew-x: 140.4; skew-y: 140.4; scale-x: 0.797; scale-y: 0.797; }
        frame 28 { x: 19.9; y: -9.1; skew-x: 134.7; skew-y: 134.7; scale-x: 0.796; scale-y: 0.796; }
        frame 29 { x: 18; y: -20.9; skew-x: 129.1; skew-y: 129.1; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 12.4; y: -9.6; skew-x: 119.1; skew-y: 119.1; scale-x: 0.796; scale-y: 0.796; }
        frame 38 { x: 6.8; y: 1.7; skew-x: 109.3; skew-y: 109.3; scale-x: 0.795; scale-y: 0.795; }
        frame 39 { x: 1.1; y: 13.6; skew-x: 99.4; skew-y: 99.4; scale-x: 0.796; scale-y: 0.796; }
        frame 40 { x: -0.7; y: 27; skew-x: 63.7; skew-y: 63.7; scale-x: 0.795; scale-y: 0.795; }
        frame 41 { x: 1.7; y: 46.5; skew-x: 27.8; skew-y: 27.8; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 13.6; y: 61.5; skew-x: -8; skew-y: -8; scale-x: 0.797; scale-y: 0.797; }
        frame 43 { x: 13; y: 57.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BACKUP_INNERHAND; }
        frame 44 { x: 13.9; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 45 { x: 14.7; }
        frame 46 { x: 15.5; }
        frame 47 { x: 16.4; }
        frame 48 { x: 17.2; }
        frame 49 { x: 18; }
        frame 50 { x: 16.7; y: 59.4; }
        frame 51 { x: 15.3; y: 61.5; }
        frame 52 { x: 13.9; y: 63.6; }
        frame 53 { x: 13.7; y: 62; }
        frame 54 { x: 13.5; y: 60.5; }
        frame 55 { x: 13.3; y: 58.9; }
        frame 56 { x: 13; y: 57.3; }
        frame 57 { x: -10000; y: -10000; }
        frame 59 { x: 10.9; y: 50.4; skew-x: 25.1; skew-y: 25.1; scale-x: 0.798; scale-y: 0.798; }
        frame 60 { x: 10.6; y: 45; skew-x: 50.4; skew-y: 50.4; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 11.2; y: 41.6; skew-x: 75.7; skew-y: 75.7; }
        frame 62 { x: 15.1; y: 39.3; skew-x: 94.5; skew-y: 94.5; }
        frame 63 { x: 18.7; y: 38.1; skew-x: 113.3; skew-y: 113.3; scale-x: 0.797; scale-y: 0.797; }
        frame 64 { x: 21.5; y: 38; skew-x: 132.4; skew-y: 132.4; scale-x: 0.798; scale-y: 0.798; }
        frame 65 { x: 19.8; y: 39.9; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 66 { x: 18.1; y: 41.7; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 16.5; y: 43.5; scale-x: 0.798; scale-y: 0.798; }
        frame 68 { x: 14.8; y: 42.6; skew-x: 110.3; skew-y: 110.3; scale-x: 0.797; scale-y: 0.797; }
        frame 69 { x: 12.1; y: 43.3; skew-x: 88.4; skew-y: 88.4; scale-x: 0.798; scale-y: 0.798; }
        frame 70 { x: 9; y: 45.6; skew-x: 66.2; skew-y: 66.2; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 9.3; y: 48.2; skew-x: 44.1; skew-y: 44.1; scale-x: 0.797; scale-y: 0.797; }
        frame 72 { x: 10.5; y: 52.3; skew-x: 22; skew-y: 22; scale-x: 0.798; scale-y: 0.798; }
        frame 73 { x: 13; y: 57.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 74 { x: 30.8; y: 53.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 31.8; y: -10000; }
        frame 76 { x: 32.6; }
        frame 77 { x: 33.4; }
        frame 78 { x: 34; }
        frame 79 { x: 34.5; }
        frame 80 { x: 34.9; }
        frame 81 { x: 35.1; }
        frame 82 { x: 35.4; }
        frame 83 { x: -10000; }
        frame 84 { x: 34.3; }
        frame 85 { x: 33.3; }
        frame 86 { x: 32.4; }
        frame 87 { x: 31.6; }
        frame 88 { x: 30.9; }
        frame 89 { x: 30.4; }
        frame 90 { x: 30; }
        frame 91 { x: 29.7; }
        frame 92 { x: 29.5; }
        frame 93 { x: 29.4; }
        frame 94 { x: 29.8; y: 53.6; skew-x: 0.5; skew-y: 0.5; }
        frame 95 { x: 31.2; y: 52.8; skew-x: 2; skew-y: 2; }
        frame 96 { x: 33.2; y: 51.4; skew-x: 4.5; skew-y: 4.5; }
        frame 97 { x: 36.2; y: 49.5; skew-x: 8; skew-y: 8; scale-x: 0.799; scale-y: 0.799; }
        frame 98 { x: 40.2; y: 47.1; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 45.1; y: 44.1; skew-x: 18.1; skew-y: 18.1; }
        frame 100 { x: 51; y: 40.9; skew-x: 24.6; skew-y: 24.6; scale-x: 0.798; scale-y: 0.798; }
        frame 101 { x: 58.1; y: 37.2; skew-x: 32.3; skew-y: 32.3; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 66.2; y: 33.1; skew-x: 40.9; skew-y: 40.9; scale-x: 0.797; scale-y: 0.797; }
        frame 103 { x: 75.4; y: 28.8; skew-x: 50.4; skew-y: 50.4; scale-x: 0.798; scale-y: 0.798; }
        frame 104 { x: 107.1; y: 34; skew-x: 71.5; skew-y: 71.5; scale-x: 0.797; scale-y: 0.797; }
        frame 105 { x: 138.7; y: 40.6; skew-x: 92.5; skew-y: 92.5; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 161.1; y: 55.4; skew-x: 113.6; skew-y: 113.6; scale-x: 0.797; scale-y: 0.797; }
        frame 107 { x: 182.6; y: 71.3; skew-x: 134.8; skew-y: 134.8; scale-x: 0.798; scale-y: 0.798; }
        frame 108 { x: 177.6; y: 77.3; skew-x: 123.4; skew-y: 123.4; scale-x: 0.796; scale-y: 0.796; }
        frame 109 { x: 172.3; y: 83.5; skew-x: 112.1; skew-y: 112.1; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 166.7; y: 90; skew-x: 100.8; skew-y: 100.8; }
        frame 111 { x: 161; y: 97; skew-x: 89.4; skew-y: 89.4; }
        frame 112 { x: 160.5; y: 96.5; skew-x: 87; skew-y: 87; }
        frame 113 { x: 160.1; y: 96.2; skew-x: 84.7; skew-y: 84.7; }
        frame 114 { x: 159.6; y: 95.7; skew-x: 82.1; skew-y: 82.1; }
        frame 115 { x: 160.2; y: 96.2; skew-x: 84.7; skew-y: 84.7; }
        frame 116 { x: 160.5; y: 96.5; skew-x: 87; skew-y: 87; }
        frame 117 { x: 161; y: 97; skew-x: 89.4; skew-y: 89.4; }
    }
    Track {
        source-name: "Zombie_disco_innerfoot";
        frame-count: 118;
        frame 0 { x: 27.3; y: 93.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BACKUP_INNERFOOT; }
        frame 1 { x: 26; y: 86.8; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 24.6; y: 79.7; skew-x: 7.3; skew-y: 7.3; }
        frame 3 { x: 24.1; y: 83.3; skew-x: 5.3; skew-y: 5.3; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 23.5; y: 86.8; skew-x: 3.5; skew-y: 3.5; scale-x: 0.8; scale-y: 0.8; }
        frame 5 { x: 22.9; y: 90.3; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 22.3; y: 93.8; skew-x: 0; skew-y: 0; }
        frame 7 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 11 { x: 23.6; }
        frame 12 { x: 24.8; }
        frame 13 { x: 26.1; }
        frame 14 { x: 27.3; }
        frame 15 { x: -10000; }
        frame 94 { x: 27.7; y: 93.6; skew-x: 0.3; skew-y: 0.3; }
        frame 95 { x: 28.8; y: 93.1; skew-x: 1.3; skew-y: 1.3; }
        frame 96 { x: 30.7; y: 92.1; skew-x: 3; skew-y: 3; }
        frame 97 { x: 33.4; y: 90.6; skew-x: 5.3; skew-y: 5.3; }
        frame 98 { x: 36.6; y: 88.9; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 99 { x: 41; y: 86.6; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 46; y: 84.1; skew-x: 16.3; skew-y: 16.3; }
        frame 101 { x: 51.9; y: 81.2; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 102 { x: 58.6; y: 77.8; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 66.3; y: 74.3; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 104 { x: 79.4; y: 74.2; skew-x: 46.6; skew-y: 46.6; scale-x: 0.797; scale-y: 0.797; }
        frame 105 { x: 92.6; y: 74.6; skew-x: 59.7; skew-y: 59.7; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 106.3; y: 75.7; skew-x: 72.9; skew-y: 72.9; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 119.9; y: 77.3; skew-x: 85.9; skew-y: 85.9; scale-x: 0.799; scale-y: 0.799; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_innerleg_lower";
        frame-count: 118;
        frame 0 { x: 22.8; y: 72.9; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BACKUP_INNERLEG_LOWER; }
        frame 1 { x: 21; y: 68.3; skew-x: 5.8; skew-y: -1.2; scale-x: 0.812; scale-y: 0.713; image: none; }
        frame 2 { x: 19.6; y: 63.6; skew-x: 11.5; skew-y: -2.4; scale-x: 0.824; scale-y: 0.626; }
        frame 3 { x: 18.3; y: 65.8; skew-x: 8.5; skew-y: -2.9; scale-x: 0.817; scale-y: 0.67; }
        frame 4 { x: 17.1; y: 67.8; skew-x: 5.8; skew-y: -3.7; scale-x: 0.812; scale-y: 0.714; }
        frame 5 { x: 16; y: 69.9; skew-x: 2.8; skew-y: -4.2; scale-x: 0.806; scale-y: 0.759; }
        frame 6 { x: 14.8; y: 71.9; skew-x: 0; skew-y: -4.9; scale-x: 0.8; scale-y: 0.803; }
        frame 7 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 16.8; y: 72.2; skew-y: -3.7; scale-y: 0.802; }
        frame 12 { x: 18.8; y: 72.4; skew-y: -2.4; scale-y: 0.801; }
        frame 13 { x: 20.8; y: 72.7; skew-y: -1.2; scale-y: -10000; }
        frame 14 { x: 22.8; y: 72.9; skew-y: 0; scale-y: 0.8; }
        frame 15 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 27 { x: 21.2; y: 72.8; skew-y: -4.7; scale-x: 0.783; scale-y: 0.809; }
        frame 28 { x: 19.6; y: -10000; skew-y: -9.7; scale-x: 0.766; scale-y: 0.818; }
        frame 29 { x: 17.9; y: 72.9; skew-y: -14.6; scale-x: 0.75; scale-y: 0.827; }
        frame 30 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 18.7; y: 72.8; skew-y: -12.2; scale-x: 0.758; scale-y: 0.822; }
        frame 38 { x: 19.6; y: -10000; skew-y: -9.7; scale-x: 0.766; scale-y: 0.818; }
        frame 39 { x: 20.3; skew-y: -7.2; scale-x: 0.775; scale-y: 0.813; }
        frame 40 { x: 21.2; skew-y: -4.7; scale-x: 0.783; scale-y: 0.809; }
        frame 41 { x: 22; skew-y: -2.2; scale-x: 0.792; scale-y: 0.804; }
        frame 42 { x: 22.8; y: 72.9; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 23.3; y: 72.7; skew-x: 0.3; skew-y: 0.3; }
        frame 95 { x: 24.6; y: 72.1; skew-x: 1.3; skew-y: 1.3; }
        frame 96 { x: 26.9; y: 71; skew-x: 3; skew-y: 3; }
        frame 97 { x: 30.1; y: 69.5; skew-x: 5.3; skew-y: 5.3; }
        frame 98 { x: 34.4; y: 67.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 99 { x: 39.8; y: 65.2; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 46.1; y: 62.6; skew-x: 16.3; skew-y: 16.3; }
        frame 101 { x: 53.9; y: 59.7; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 102 { x: 62.7; y: 56.6; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 72.8; y: 53.5; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 104 { x: 91.2; y: 54.5; skew-x: 45.1; skew-y: 45.1; scale-x: 0.797; scale-y: 0.797; }
        frame 105 { x: 110.2; y: 57; skew-x: 56.9; skew-y: 56.9; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 125.3; y: 61.7; skew-x: 68.7; skew-y: 68.7; scale-x: 0.797; scale-y: 0.797; }
        frame 107 { x: 140.4; y: 68; skew-x: 80.4; skew-y: 80.4; scale-x: 0.799; scale-y: 0.799; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_innerleg_upper";
        frame-count: 118;
        frame 0 { x: 41.4; y: 49; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BACKUP_INNERLEG_UPPER; }
        frame 1 { x: 41.6; y: 48.5; skew-x: 3.8; skew-y: 3.8; scale-x: 0.799; scale-y: 0.732; image: none; }
        frame 2 { x: 41.8; y: 48.2; skew-x: 7.8; skew-y: 7.8; scale-x: -10000; scale-y: 0.664; }
        frame 3 { x: -10000; y: 47.8; skew-x: 9.6; skew-y: 9.6; scale-y: 0.698; }
        frame 4 { x: 42; y: 47.4; skew-x: 11.5; skew-y: 11.5; scale-y: 0.731; }
        frame 5 { x: 42.2; y: 47; skew-x: 13.5; skew-y: 13.5; scale-y: 0.765; }
        frame 6 { x: 42.5; y: 46.6; skew-x: 15.5; skew-y: 15.5; scale-y: 0.799; }
        frame 7 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 11 { x: 42.2; y: 47.2; skew-x: 11.5; skew-y: 11.5; }
        frame 12 { x: 41.9; y: 47.7; skew-x: 7.8; skew-y: 7.8; }
        frame 13 { x: 41.6; y: 48.4; skew-x: 3.8; skew-y: 3.8; scale-x: 0.8; scale-y: 0.8; }
        frame 14 { x: 41.4; y: 49; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 22 { x: 42; y: 48.8; skew-x: 1; skew-y: 1; }
        frame 23 { x: 42.9; y: 48.6; skew-x: 2.3; skew-y: 2.3; }
        frame 24 { x: 43.5; y: 48.4; skew-x: 3.5; skew-y: 3.5; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 27 { x: 40; y: 49; skew-x: 0; skew-y: 0; }
        frame 28 { x: 36.6; y: 49.5; skew-x: -3.2; skew-y: -3.2; scale-x: 0.799; scale-y: 0.799; }
        frame 29 { x: 33.1; y: 50.1; skew-x: -6.9; skew-y: -6.9; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 37 { x: 34.5; y: 49.9; skew-x: -5.7; skew-y: -5.7; }
        frame 38 { x: 35.8; y: 49.8; skew-x: -4.4; skew-y: -4.4; }
        frame 39 { x: 37.2; y: 49.5; skew-x: -3.4; skew-y: -3.4; }
        frame 40 { x: 38.6; y: 49.3; skew-x: -2.2; skew-y: -2.2; scale-x: 0.8; scale-y: 0.8; }
        frame 41 { x: 40; y: 49.1; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 41.4; y: 49; skew-x: 0; skew-y: 0; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 41.8; y: 48.9; skew-x: 0.5; skew-y: 0.5; }
        frame 45 { x: 42.2; y: 48.8; skew-x: 1.3; skew-y: 1.3; }
        frame 46 { x: 42.5; y: 48.6; skew-x: 1.8; skew-y: 1.8; }
        frame 47 { x: 43; y: 48.5; skew-x: 2.5; skew-y: 2.5; }
        frame 48 { x: 43.5; y: 48.4; skew-x: 3; skew-y: 3; }
        frame 49 { x: 43.9; y: -10000; skew-x: 3.8; skew-y: 3.8; }
        frame 50 { x: 42.9; y: 48.5; skew-x: 2.5; skew-y: 2.5; }
        frame 51 { x: 41.9; y: 48.8; skew-x: 1.3; skew-y: 1.3; }
        frame 52 { x: 41; y: 48.9; skew-x: 0.2; skew-y: 0.2; }
        frame 53 { y: -10000; skew-x: 0; skew-y: 0; }
        frame 54 { x: 41.2; skew-x: -10000; skew-y: -10000; }
        frame 55 { x: 41.3; y: 49; }
        frame 56 { x: 41.4; y: -10000; }
        frame 57 { x: -10000; }
        frame 59 { x: 41.8; y: 48.9; skew-x: 0.5; skew-y: 0.5; }
        frame 60 { x: 42.2; y: 48.8; skew-x: 1.3; skew-y: 1.3; }
        frame 61 { x: 42.5; y: 48.6; skew-x: 1.8; skew-y: 1.8; }
        frame 62 { x: 43; y: 48.5; skew-x: 2.5; skew-y: 2.5; }
        frame 63 { x: 43.5; y: 48.4; skew-x: 3; skew-y: 3; }
        frame 64 { x: 43.9; y: -10000; skew-x: 3.8; skew-y: 3.8; }
        frame 65 { x: 42.9; y: 48.5; skew-x: 2.5; skew-y: 2.5; }
        frame 66 { x: 41.9; y: 48.8; skew-x: 1.3; skew-y: 1.3; }
        frame 67 { x: 41; y: 48.9; skew-x: 0.2; skew-y: 0.2; }
        frame 68 { y: -10000; skew-x: 0; skew-y: 0; }
        frame 69 { x: 41.2; skew-x: -10000; skew-y: -10000; }
        frame 70 { x: 41.3; y: 49; }
        frame 71 { x: 41.4; y: -10000; }
        frame 72 { x: -10000; }
        frame 75 { x: 42.8; y: 48.6; skew-x: 2.3; skew-y: 2.3; }
        frame 76 { x: 43.9; y: 48.3; skew-x: 4.3; skew-y: 4.3; }
        frame 77 { x: 45; y: 48; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 78 { x: 46; y: 47.8; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 46.7; y: 47.6; skew-x: 8.5; skew-y: 8.5; }
        frame 80 { x: 47.3; y: 47.5; skew-x: 9.5; skew-y: 9.5; }
        frame 81 { x: 47.7; y: 47.4; skew-x: 10.3; skew-y: 10.3; }
        frame 82 { x: 48; y: 47.3; skew-x: 10.6; skew-y: 10.6; }
        frame 83 { x: -10000; y: -10000; skew-x: 10.8; skew-y: 10.8; }
        frame 84 { x: 46; y: 47.7; skew-x: 7.8; skew-y: 7.8; }
        frame 85 { x: 44.1; y: 48.1; skew-x: 5.1; skew-y: 5.1; }
        frame 86 { x: 42.6; y: 48.5; skew-x: 2.8; skew-y: 2.8; }
        frame 87 { x: 41.3; y: 48.9; skew-x: 0.8; skew-y: 0.8; }
        frame 88 { x: 40.1; y: 49; skew-x: -0.7; skew-y: -0.7; }
        frame 89 { x: 39.1; y: 49.3; skew-x: -2; skew-y: -2; }
        frame 90 { x: 38.5; y: 49.4; skew-x: -3.2; skew-y: -3.2; }
        frame 91 { x: 38; y: 49.6; skew-x: -3.9; skew-y: -3.9; }
        frame 92 { x: 37.7; y: 49.7; skew-x: -4.4; skew-y: -4.4; }
        frame 93 { x: 37.6; y: 49.8; skew-x: -4.6; skew-y: -4.6; }
        frame 94 { x: 38.2; y: -10000; skew-x: -4.2; skew-y: -4.2; }
        frame 95 { x: 39.9; y: 49.5; skew-x: -3.2; skew-y: -3.2; }
        frame 96 { x: 42.7; y: 49.1; skew-x: -1.5; skew-y: -1.5; }
        frame 97 { x: 46.7; y: 48.6; skew-x: 0.5; skew-y: 0.5; }
        frame 98 { x: 51.9; y: 48; skew-x: 3.5; skew-y: 3.5; }
        frame 99 { x: 58.2; y: 47.2; skew-x: 7.3; skew-y: 7.3; scale-x: 0.798; scale-y: 0.798; }
        frame 100 { x: 65.7; y: 46.3; skew-x: 11.5; skew-y: 11.5; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 74.6; y: 45.4; skew-x: 16.5; skew-y: 16.5; }
        frame 102 { x: 84.6; y: 44.3; skew-x: 22.3; skew-y: 22.3; scale-x: 0.797; scale-y: 0.797; }
        frame 103 { x: 95.8; y: 43.1; skew-x: 28.6; skew-y: 28.6; scale-x: 0.798; scale-y: 0.798; }
        frame 104 { x: 117.1; y: 51.5; skew-x: 44.1; skew-y: 44.1; scale-x: 0.796; scale-y: 0.796; }
        frame 105 { x: 138.6; y: 60.5; skew-x: 59.6; skew-y: 59.6; scale-x: 0.797; scale-y: 0.797; }
        frame 106 { x: 153; y: 73.4; skew-x: 75.2; skew-y: 75.2; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 167.2; y: 87; skew-x: 90.5; skew-y: 90.5; scale-x: 0.799; scale-y: 0.799; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_lowerbody";
        frame-count: 118;
        frame 0 { x: 40.8; y: 34.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BACKUP_LOWERBODY; }
        frame 1 { x: -10000; y: 33; skew-x: 3.5; scale-x: 0.807; scale-y: -10000; image: none; }
        frame 2 { x: 40.9; y: 31.9; skew-x: 7.3; scale-x: 0.813; }
        frame 3 { x: 41; y: 30.8; skew-x: 11; scale-x: 0.82; }
        frame 4 { x: 41.3; y: 29.7; skew-x: 14.8; scale-x: 0.828; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 11 { x: 41.1; y: 30.8; skew-x: 11; scale-x: 0.82; }
        frame 12 { x: 40.9; y: 31.9; skew-x: 7.3; scale-x: 0.813; }
        frame 13 { x: 40.8; y: 33; skew-x: 3.5; scale-x: 0.807; }
        frame 14 { x: -10000; y: 34.1; skew-x: 0; scale-x: 0.8; }
        frame 15 { y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 22 { x: 41.4; }
        frame 23 { x: 42.1; }
        frame 24 { x: 42.8; }
        frame 25 { x: -10000; }
        frame 27 { x: 39.4; }
        frame 28 { x: 36.1; }
        frame 29 { x: 32.8; }
        frame 30 { x: -10000; }
        frame 37 { x: 34.1; }
        frame 38 { x: 35.4; }
        frame 39 { x: 36.8; }
        frame 40 { x: 38.1; }
        frame 41 { x: 39.4; }
        frame 42 { x: 40.8; }
        frame 43 { x: -10000; }
        frame 44 { x: 41.1; }
        frame 45 { x: 41.5; }
        frame 46 { x: 41.9; }
        frame 47 { x: 42.3; }
        frame 48 { x: 42.6; }
        frame 49 { x: 43; }
        frame 50 { x: 42; y: 34.5; }
        frame 51 { x: 40.9; y: 35; }
        frame 52 { x: 39.9; y: 35.5; }
        frame 53 { x: 40.1; y: 35.1; }
        frame 54 { x: 40.3; y: 34.8; }
        frame 55 { x: 40.5; y: 34.5; }
        frame 56 { x: 40.8; y: 34.1; }
        frame 57 { x: -10000; y: -10000; }
        frame 59 { x: 41.1; }
        frame 60 { x: 41.5; }
        frame 61 { x: 41.9; }
        frame 62 { x: 42.3; }
        frame 63 { x: 42.6; }
        frame 64 { x: 43; }
        frame 65 { x: 42; y: 34.5; }
        frame 66 { x: 40.9; y: 35; }
        frame 67 { x: 39.9; y: 35.5; }
        frame 68 { x: 40.1; y: 35.1; }
        frame 69 { x: 40.3; y: 34.8; }
        frame 70 { x: 40.5; y: 34.5; }
        frame 71 { x: 40.8; y: 34.1; }
        frame 72 { x: -10000; y: -10000; }
        frame 75 { x: 42; }
        frame 76 { x: 43.1; }
        frame 77 { x: 44.1; }
        frame 78 { x: 44.9; }
        frame 79 { x: 45.5; }
        frame 80 { x: 46.1; }
        frame 81 { x: 46.5; }
        frame 82 { x: 46.7; }
        frame 83 { x: 46.8; }
        frame 84 { x: 45; }
        frame 85 { x: 43.4; }
        frame 86 { x: 41.9; }
        frame 87 { x: 40.6; }
        frame 88 { x: 39.6; }
        frame 89 { x: 38.8; }
        frame 90 { x: 38.1; }
        frame 91 { x: 37.6; }
        frame 92 { x: 37.4; }
        frame 93 { x: 37.3; }
        frame 94 { x: 37.9; y: 34; skew-x: 0.3; skew-y: 0.3; }
        frame 95 { x: 39.8; y: 33.6; skew-x: 1.3; skew-y: 1.3; }
        frame 96 { x: 43; y: 33; skew-x: 3; skew-y: 3; }
        frame 97 { x: 47.5; y: 32.2; skew-x: 5.3; skew-y: 5.3; }
        frame 98 { x: 53.4; y: 31.1; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 99 { x: 60.6; y: 29.9; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 69.1; y: 28.7; skew-x: 16.3; skew-y: 16.3; }
        frame 101 { x: 79.2; y: 27.3; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 102 { x: 90.6; y: 25.9; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 103.3; y: 24.6; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 104 { x: 128.6; y: 35.1; skew-x: 50.6; skew-y: 50.6; scale-x: 0.797; scale-y: 0.797; }
        frame 105 { x: 153.7; y: 47.4; skew-x: 67.9; skew-y: 67.9; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 169.3; y: 68.2; skew-x: 85.2; skew-y: 85.2; scale-x: 0.799; scale-y: 0.799; }
        frame 107 { x: 183.7; y: 90.3; skew-x: 102.2; skew-y: 102.2; scale-x: 0.8; scale-y: 0.8; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerfoot_lower";
        frame-count: 118;
        frame 0 { x: 47; y: 109.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BACKUP_OUTERFOOT_LOWER; }
        frame 1 { x: 49.5; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 52; }
        frame 3 { x: 54.5; }
        frame 4 { x: 57; }
        frame 5 { x: -10000; }
        frame 11 { x: 53.4; y: 107.3; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 12 { x: 50.1; y: 105.5; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 13 { x: 46.9; y: 103.7; skew-x: -17.7; skew-y: -17.7; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 46.7; y: 105.5; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 46.8; y: 107.4; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 47; y: 109.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 47.1; y: 109.2; skew-x: 0.3; skew-y: 0.3; }
        frame 95 { x: 47.6; y: 108.7; skew-x: 1.3; skew-y: 1.3; }
        frame 96 { x: 48.5; y: 107.7; skew-x: 3; skew-y: 3; }
        frame 97 { x: 49.5; y: 106.5; skew-x: 5.3; skew-y: 5.3; }
        frame 98 { x: 51; y: 105; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 99 { x: 52.9; y: 103.1; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 55.1; y: 101; skew-x: 16.3; skew-y: 16.3; }
        frame 101 { x: 57.9; y: 98.7; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 102 { x: 61.3; y: 96.2; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 65; y: 93.7; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 104 { x: 75.9; y: 88.3; skew-x: 50.6; skew-y: 50.6; scale-x: 0.797; scale-y: 0.797; }
        frame 105 { x: 87.2; y: 84.8; skew-x: 67.9; skew-y: 67.9; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 98.3; y: 83.6; skew-x: 85.2; skew-y: 85.2; scale-x: 0.799; scale-y: 0.799; }
        frame 107 { x: 108.1; y: 84; skew-x: 102.2; skew-y: 102.2; scale-x: 0.8; scale-y: 0.8; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerfoot_upper";
        frame-count: 118;
        frame 0 { x: 46; y: 98.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BACKUP_OUTERFOOT_UPPER; }
        frame 1 { x: 48.5; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 51; }
        frame 3 { x: 53.5; }
        frame 4 { x: 56; }
        frame 5 { x: -10000; }
        frame 11 { x: 51.1; y: 96.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 12 { x: 46.4; y: 95.2; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 13 { x: 42; y: 93.8; skew-x: -17.7; skew-y: -17.7; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 43; y: 95.2; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 44.4; y: 96.6; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 46; y: 98.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 46.3; y: 98.1; skew-x: 0.3; skew-y: 0.3; }
        frame 95 { x: 46.9; y: 97.6; skew-x: 1.3; skew-y: 1.3; }
        frame 96 { x: 48; y: 96.8; skew-x: 3; skew-y: 3; }
        frame 97 { x: 49.4; y: 95.7; skew-x: 5.3; skew-y: 5.3; }
        frame 98 { x: 51.5; y: 94.3; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 99 { x: 54; y: 92.6; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 57.1; y: 90.8; skew-x: 16.3; skew-y: 16.3; }
        frame 101 { x: 61; y: 88.6; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 102 { x: 65.7; y: 86.3; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 71.1; y: 83.9; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 104 { x: 83.6; y: 80.8; skew-x: 50.6; skew-y: 50.6; scale-x: 0.797; scale-y: 0.797; }
        frame 105 { x: 97.6; y: 79.9; skew-x: 67.9; skew-y: 67.9; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 108.6; y: 81.3; skew-x: 85.2; skew-y: 85.2; scale-x: 0.799; scale-y: 0.799; }
        frame 107 { x: 119.4; y: 85.4; skew-x: 102.2; skew-y: 102.2; scale-x: 0.8; scale-y: 0.8; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerleg_lower";
        frame-count: 118;
        frame 0 { x: 57.8; y: 80.4; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BACKUP_OUTERLEG_LOWER; }
        frame 1 { x: 59.1; y: 80.3; skew-y: -1.4; scale-x: -10000; scale-y: 0.801; image: none; }
        frame 2 { x: 60.5; y: 80.2; skew-y: -3.2; scale-y: 0.802; }
        frame 3 { x: 61.8; y: 80.1; skew-y: -4.7; scale-y: 0.804; }
        frame 4 { x: 63; y: 79.9; skew-y: -6.5; scale-y: 0.805; }
        frame 5 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 11 { x: 57.8; y: 78.3; skew-x: -7.4; skew-y: -10.9; scale-x: 0.782; scale-y: 0.803; }
        frame 12 { x: 52.6; y: 76.6; skew-x: -14.9; skew-y: -15.7; scale-x: 0.765; scale-y: 0.8; }
        frame 13 { x: 47.6; y: 74.8; skew-x: -22.5; skew-y: -20.3; scale-x: 0.748; scale-y: 0.799; }
        frame 14 { x: 51; y: 76.7; skew-x: -14.9; skew-y: -13.4; scale-x: 0.765; scale-y: 0.798; }
        frame 15 { x: 54.3; y: 78.6; skew-x: -7.4; skew-y: -6.7; scale-x: 0.782; scale-y: 0.799; }
        frame 16 { x: 57.8; y: 80.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 58.2; y: 80.3; skew-x: 0.3; skew-y: 0.3; }
        frame 95 { x: 59.2; y: -10000; skew-x: 1.3; skew-y: 1.3; }
        frame 96 { x: 61; y: 79.9; skew-x: 3; skew-y: 3; }
        frame 97 { x: 63.5; y: 79.7; skew-x: 5.3; skew-y: 5.3; }
        frame 98 { x: 66.8; y: 79.2; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 99 { x: 70.8; y: 78.7; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 75.6; y: 78.1; skew-x: 16.3; skew-y: 16.3; }
        frame 101 { x: 81.2; y: 77.5; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 102 { x: 87.7; y: 76.9; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 94.8; y: 76.2; skew-x: 33.3; skew-y: 33.3; scale-x: 0.799; scale-y: 0.799; }
        frame 104 { x: 106.5; y: 80.5; skew-x: 50.6; skew-y: 50.6; scale-x: 0.797; scale-y: 0.797; }
        frame 105 { x: 118.6; y: 85.6; skew-x: 67.9; skew-y: 67.9; scale-x: 0.798; scale-y: 0.798; }
        frame 106 { x: 126.4; y: 92.8; skew-x: 85.2; skew-y: 85.2; scale-x: 0.799; scale-y: 0.799; }
        frame 107 { x: 134.1; y: 100.7; skew-x: 102.2; skew-y: 102.2; scale-x: 0.8; scale-y: 0.8; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerleg_upper";
        frame-count: 118;
        frame 0 { x: 58.1; y: 50.6; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BACKUP_OUTERLEG_UPPER; }
        frame 1 { x: 57.9; y: 51.1; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 57.8; y: 51.6; skew-x: -5.9; skew-y: -5.9; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: 57.6; y: 52.3; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 57.5; y: 52.7; skew-x: -11.9; skew-y: -11.9; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 11 { x: 58; y: 51.9; skew-x: -5.9; skew-y: -1.2; scale-x: 0.809; scale-y: 0.749; }
        frame 12 { x: 58.5; y: 51.2; skew-x: -0.2; skew-y: 9.3; scale-x: 0.819; scale-y: 0.699; }
        frame 13 { x: 58.9; y: 50.6; skew-x: 5.6; skew-y: 20; scale-x: 0.829; scale-y: 0.65; }
        frame 14 { x: 58.7; y: 50.8; skew-x: 3.6; skew-y: 13.3; scale-x: 0.819; scale-y: 0.699; }
        frame 15 { x: 58.4; y: 50.7; skew-x: 1.8; skew-y: 6.5; scale-x: 0.81; scale-y: 0.75; }
        frame 16 { x: 58.1; y: 50.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 58.8; y: 50.5; skew-x: 0.8; skew-y: 0.8; }
        frame 23 { x: 59.5; y: 50.4; skew-x: 1.8; skew-y: 1.8; }
        frame 24 { x: 60.3; y: 50.1; skew-x: 2.8; skew-y: 2.8; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 27 { x: 56.5; y: 51.1; skew-x: -3; skew-y: -3; scale-x: 0.799; scale-y: 0.799; }
        frame 28 { x: 53; y: 52.1; skew-x: -9; skew-y: -9; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 49.4; y: 53.3; skew-x: -15.2; skew-y: -15.2; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 37 { x: 50.9; y: 52.8; skew-x: -12.5; skew-y: -12.5; }
        frame 38 { x: 52.3; y: 52.4; skew-x: -10; skew-y: -10; }
        frame 39 { x: 53.7; y: 52; skew-x: -7.4; skew-y: -7.4; }
        frame 40 { x: 55.1; y: 51.5; skew-x: -4.9; skew-y: -4.9; }
        frame 41 { x: 56.5; y: 51; skew-x: -2.4; skew-y: -2.4; scale-x: 0.8; scale-y: 0.8; }
        frame 42 { x: 58.1; y: 50.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 58.5; y: 50.5; skew-x: 0.5; skew-y: 0.5; }
        frame 45 { x: 58.9; y: -10000; skew-x: 1; skew-y: 1; }
        frame 46 { x: 59.4; y: 50.4; skew-x: 1.5; skew-y: 1.5; }
        frame 47 { x: 59.8; y: -10000; skew-x: 2; skew-y: 2; }
        frame 48 { x: 60.3; y: 50.2; skew-x: 2.6; skew-y: 2.6; }
        frame 49 { x: 60.6; y: -10000; skew-x: 3.3; skew-y: 3.3; }
        frame 50 { x: 59.5; y: 50.5; skew-x: 2; skew-y: 2; }
        frame 51 { x: 58.5; y: 50.6; skew-x: 0.8; skew-y: 0.8; }
        frame 52 { x: 57.6; y: 50.8; skew-x: -0.4; skew-y: -0.4; }
        frame 53 { x: -10000; y: -10000; skew-x: -0.2; skew-y: -0.2; }
        frame 54 { x: 57.9; y: 50.7; skew-x: -0; skew-y: -0; }
        frame 55 { x: -10000; y: -10000; skew-x: 0; skew-y: 0; }
        frame 56 { x: 58.1; y: 50.6; skew-x: -10000; skew-y: -10000; }
        frame 57 { x: -10000; y: -10000; }
        frame 59 { x: 58.5; y: 50.5; skew-x: 0.5; skew-y: 0.5; }
        frame 60 { x: 58.9; y: -10000; skew-x: 1; skew-y: 1; }
        frame 61 { x: 59.4; y: 50.4; skew-x: 1.5; skew-y: 1.5; }
        frame 62 { x: 59.8; y: -10000; skew-x: 2; skew-y: 2; }
        frame 63 { x: 60.3; y: 50.2; skew-x: 2.6; skew-y: 2.6; }
        frame 64 { x: 60.6; y: -10000; skew-x: 3.3; skew-y: 3.3; }
        frame 65 { x: 59.5; y: 50.5; skew-x: 2; skew-y: 2; }
        frame 66 { x: 58.5; y: 50.6; skew-x: 0.8; skew-y: 0.8; }
        frame 67 { x: 57.6; y: 50.8; skew-x: -0.4; skew-y: -0.4; }
        frame 68 { x: -10000; y: -10000; skew-x: -0.2; skew-y: -0.2; }
        frame 69 { x: 57.9; y: 50.7; skew-x: -0; skew-y: -0; }
        frame 70 { x: -10000; y: -10000; skew-x: 0; skew-y: 0; }
        frame 71 { x: 58.1; y: 50.6; skew-x: -10000; skew-y: -10000; }
        frame 72 { x: -10000; y: -10000; }
        frame 75 { x: 59.5; y: 50.3; skew-x: 2; skew-y: 2; scale-y: 0.802; }
        frame 76 { x: 60.9; y: 49.9; skew-x: 4; skew-y: 4; scale-y: 0.805; }
        frame 77 { x: 61.9; y: 49.8; skew-x: 5.6; skew-y: 5.6; scale-x: 0.799; scale-y: 0.807; }
        frame 78 { x: 63; y: 49.5; skew-x: 7; skew-y: 7; scale-x: -10000; scale-y: 0.808; }
        frame 79 { x: 63.6; y: 49.3; skew-x: 8.1; skew-y: 8.1; scale-y: 0.809; }
        frame 80 { x: 64.2; y: 49.2; skew-x: 9; skew-y: 9; scale-y: 0.81; }
        frame 81 { x: 64.7; y: 49; skew-x: 9.6; skew-y: 9.6; scale-y: 0.811; }
        frame 82 { x: 64.9; skew-x: 10; skew-y: 10; scale-y: 0.812; }
        frame 83 { x: 65; y: 48.9; skew-x: 10.3; skew-y: 10.3; scale-y: -10000; }
        frame 84 { x: 63; y: 49.4; skew-x: 7; skew-y: 7; scale-y: 0.809; }
        frame 85 { x: 61; y: 49.9; skew-x: 4.1; skew-y: 4.1; scale-y: 0.807; }
        frame 86 { x: 59.5; y: 50.4; skew-x: 1.5; skew-y: 1.5; scale-y: 0.806; }
        frame 87 { x: 58; y: 50.6; skew-x: -0.2; skew-y: -0.2; scale-y: 0.804; }
        frame 88 { x: 56.9; y: 51; skew-x: -2.2; skew-y: -2.2; scale-y: 0.802; }
        frame 89 { x: 56; y: 51.3; skew-x: -3.7; skew-y: -3.7; scale-y: 0.801; }
        frame 90 { x: 55.3; y: 51.5; skew-x: -4.9; skew-y: -4.9; scale-y: 0.8; }
        frame 91 { x: 54.8; y: 51.6; skew-x: -5.7; skew-y: -5.7; scale-y: -10000; }
        frame 92 { x: 54.5; y: 51.8; skew-x: -6.2; skew-y: -6.2; scale-y: 0.799; }
        frame 93 { x: 54.4; y: -10000; skew-x: -6.4; skew-y: -6.4; scale-y: -10000; }
        frame 94 { x: 54.9; y: 51.7; skew-x: -6; skew-y: -6; }
        frame 95 { x: 56.4; y: -10000; skew-x: -5.2; skew-y: -5.2; }
        frame 96 { x: 59; y: 51.5; skew-x: -3.7; skew-y: -3.7; }
        frame 97 { x: 62.5; y: 51.2; skew-x: -1.4; skew-y: -1.4; }
        frame 98 { x: 67.1; y: 50.9; skew-x: 1; skew-y: 1; }
        frame 99 { x: 73; y: 50.5; skew-x: 4.5; skew-y: 4.5; }
        frame 100 { x: 79.7; y: 50; skew-x: 8.5; skew-y: 8.5; scale-x: 0.798; scale-y: 0.798; }
        frame 101 { x: 87.7; y: 49.5; skew-x: 13.1; skew-y: 13.1; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 96.6; y: 49; skew-x: 18.3; skew-y: 18.3; }
        frame 103 { x: 106.8; y: 48.5; skew-x: 24.3; skew-y: 24.3; }
        frame 104 { x: 124.2; y: 59.3; skew-x: 42.1; skew-y: 42.1; scale-x: 0.796; scale-y: 0.796; }
        frame 105 { x: 142; y: 70.8; skew-x: 60; skew-y: 60; scale-x: 0.797; scale-y: 0.797; }
        frame 106 { x: 152.6; y: 86.6; skew-x: 77.9; skew-y: 77.9; scale-x: 0.798; scale-y: 0.798; }
        frame 107 { x: 162.8; y: 103.3; skew-x: 95.7; skew-y: 95.7; scale-x: 0.799; scale-y: 0.799; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_upperbody";
        frame-count: 118;
        frame 0 { x: 39.2; y: -10.4; skew-x: 26.1; skew-y: 26.1; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_BACKUP_UPPERBODY; }
        frame 1 { x: 39.3; y: -11.6; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; image: none; }
        frame 2 { x: 39.2; y: -13.1; scale-x: 0.798; scale-y: 0.798; }
        frame 3 { x: 39.3; y: -11.7; skew-x: 26; skew-y: 26; scale-x: 0.797; scale-y: 0.797; }
        frame 4 { x: 39.2; y: -10.4; skew-x: 26.1; skew-y: 26.1; scale-x: 0.799; scale-y: 0.799; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 39.3; y: -11.3; scale-x: 0.798; scale-y: 0.798; }
        frame 12 { x: 39.1; y: -12.4; scale-x: 0.797; scale-y: 0.797; }
        frame 13 { x: 39.2; y: -13.5; scale-x: 0.798; scale-y: 0.798; }
        frame 14 { x: -10000; y: -12.4; skew-x: 26; skew-y: 26; scale-x: 0.797; scale-y: 0.797; }
        frame 15 { x: 39.3; y: -11.3; skew-x: 26.1; skew-y: 26.1; scale-x: 0.798; scale-y: 0.798; }
        frame 16 { x: 39.2; y: -10.4; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 14.8; y: 6.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 21.9; y: 1.1; skew-x: 6.8; skew-y: 6.8; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 29.5; y: -3.6; skew-x: 13.6; skew-y: 13.6; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 37.7; y: -7.9; skew-x: 20.7; skew-y: 20.7; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 27 { x: 41.4; y: -10.2; skew-x: 28.1; skew-y: 28.1; scale-x: 0.798; scale-y: 0.798; }
        frame 28 { x: 45.5; y: -11.5; skew-x: 35.6; skew-y: 35.6; scale-x: 0.797; scale-y: 0.797; }
        frame 29 { x: 49.8; y: -12.1; skew-x: 43.2; skew-y: 43.2; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 43.3; y: -11; skew-x: 36.1; skew-y: 36.1; scale-x: 0.797; scale-y: 0.797; }
        frame 38 { x: 36.6; y: -9.2; skew-x: 28.8; skew-y: 28.8; scale-x: 0.798; scale-y: 0.798; }
        frame 39 { x: 30.5; y: -6.4; skew-x: 21.6; skew-y: 21.6; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 24.7; y: -2.9; skew-x: 14.3; skew-y: 14.3; scale-x: 0.799; scale-y: 0.799; }
        frame 41 { x: 19.3; y: 1.5; skew-x: 7.1; skew-y: 7.1; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 14.8; y: 6.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 16.7; y: 5.1; skew-x: 1.5; skew-y: 1.5; }
        frame 45 { x: 18.6; y: 3.6; skew-x: 3.3; skew-y: 3.3; }
        frame 46 { x: 20.6; y: 2.1; skew-x: 5; skew-y: 5; }
        frame 47 { x: 22.5; y: 0.8; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 48 { x: 24.6; y: -0.4; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 26.7; y: -1.8; skew-x: 10.1; skew-y: 10.1; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: 23.2; y: 1.7; skew-x: 7; skew-y: 7; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 19.9; y: 5.3; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 16.8; y: 9; skew-x: 1; skew-y: 1; }
        frame 53 { x: 16.3; y: 8.4; skew-x: 0.8; skew-y: 0.8; }
        frame 54 { x: 15.9; y: 7.8; skew-x: 0.5; skew-y: 0.5; scale-x: 0.8; scale-y: 0.8; }
        frame 55 { x: 15.3; y: 7.2; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 14.8; y: 6.5; skew-x: 0; skew-y: 0; }
        frame 57 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 59 { x: 16.7; y: 5.1; skew-x: 1.5; skew-y: 1.5; }
        frame 60 { x: 18.6; y: 3.6; skew-x: 3.3; skew-y: 3.3; }
        frame 61 { x: 20.6; y: 2.1; skew-x: 5; skew-y: 5; }
        frame 62 { x: 22.5; y: 0.8; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: 24.6; y: -0.4; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 26.7; y: -1.8; skew-x: 10.1; skew-y: 10.1; scale-x: 0.8; scale-y: 0.8; }
        frame 65 { x: 23.2; y: 1.7; skew-x: 7; skew-y: 7; scale-x: 0.799; scale-y: 0.799; }
        frame 66 { x: 19.9; y: 5.3; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 16.8; y: 9; skew-x: 1; skew-y: 1; }
        frame 68 { x: 16.3; y: 8.4; skew-x: 0.8; skew-y: 0.8; }
        frame 69 { x: 15.9; y: 7.8; skew-x: 0.5; skew-y: 0.5; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: 15.3; y: 7.2; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 14.8; y: 6.5; skew-x: 0; skew-y: 0; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 74 { x: 37.9; y: -9.7; skew-x: 23; skew-y: 23; scale-x: 0.799; scale-y: 0.799; }
        frame 75 { x: 41; y: -9.9; skew-x: 24.6; skew-y: 24.6; scale-x: 0.798; scale-y: 0.798; }
        frame 76 { x: 43.9; y: -10.2; skew-x: 26; skew-y: 26; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 46.1; y: -10.3; skew-x: 27.1; skew-y: 27.1; }
        frame 78 { x: 48.4; y: -10.6; skew-x: 28.3; skew-y: 28.3; }
        frame 79 { x: 50; y: -10000; skew-x: 29.1; skew-y: 29.1; }
        frame 80 { x: 51.4; y: -10.7; skew-x: 29.8; skew-y: 29.8; }
        frame 81 { x: 52.1; y: -10.6; skew-x: 30.1; skew-y: 30.1; }
        frame 82 { x: 52.9; y: -10.8; skew-x: 30.6; skew-y: 30.6; }
        frame 83 { x: 53; y: -10.9; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 84 { x: 49.1; y: -10.3; skew-x: 28.6; skew-y: 28.6; scale-x: 0.797; scale-y: 0.797; }
        frame 85 { x: 45.6; y: -9.9; skew-x: 26.8; skew-y: 26.8; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 42.6; y: -9.5; skew-x: 25.3; skew-y: 25.3; }
        frame 87 { x: 40.1; y: -9.2; skew-x: 24.1; skew-y: 24.1; }
        frame 88 { x: 38; y: -8.8; skew-x: 23.1; skew-y: 23.1; }
        frame 89 { x: 36.1; y: -8.5; skew-x: 22.1; skew-y: 22.1; }
        frame 90 { x: 34.7; y: -8.1; skew-x: 21.3; skew-y: 21.3; }
        frame 91 { x: 33.7; y: -8; skew-x: 20.8; skew-y: 20.8; }
        frame 92 { x: 33.1; y: -10000; skew-x: 20.6; skew-y: 20.6; }
        frame 93 { x: 33; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; }
        frame 94 { x: 33.8; skew-x: 20.8; skew-y: 20.8; scale-x: 0.797; scale-y: 0.797; }
        frame 95 { x: 36.4; y: -8.4; skew-x: 21.8; skew-y: 21.8; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 40.6; y: -9.1; skew-x: 23.6; skew-y: 23.6; }
        frame 97 { x: 46.7; y: -10; skew-x: 25.8; skew-y: 25.8; }
        frame 98 { x: 54.5; y: -10.9; skew-x: 28.8; skew-y: 28.8; }
        frame 99 { x: 64.2; y: -11.9; skew-x: 32.6; skew-y: 32.6; }
        frame 100 { x: 75.6; y: -12.8; skew-x: 36.9; skew-y: 36.9; scale-x: 0.796; scale-y: 0.796; }
        frame 101 { x: 88.8; y: -13.4; skew-x: 41.9; skew-y: 41.9; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 104; y: -13.5; skew-x: 47.6; skew-y: 47.6; }
        frame 103 { x: 120.8; y: -13; skew-x: 53.9; skew-y: 53.9; scale-x: 0.797; scale-y: 0.797; }
        frame 104 { x: 156; y: 4.5; skew-x: 71.2; skew-y: 71.2; scale-x: 0.796; scale-y: 0.796; }
        frame 105 { x: 189.1; y: 26.9; skew-x: 88.5; skew-y: 88.5; scale-x: 0.797; scale-y: 0.797; }
        frame 106 { x: 209.6; y: 59.6; skew-x: 105.5; skew-y: 105.5; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 225.9; y: 95.2; skew-x: 122.8; skew-y: 122.8; scale-x: 0.798; scale-y: 0.798; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_chops";
        frame-count: 118;
        frame 0 { x: 33.1; y: -17.2; skew-x: 20.3; skew-y: 20.3; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_BACKUP_CHOPS; }
        frame 1 { x: -10000; y: -17.5; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; image: none; }
        frame 2 { y: -17.9; scale-x: -10000; scale-y: -10000; }
        frame 3 { y: -18.4; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 33.2; y: -17.9; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { x: -10000; y: -17.5; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 33.1; y: -17.2; scale-x: 0.799; scale-y: 0.799; }
        frame 7 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { y: -17.4; scale-x: 0.798; scale-y: 0.798; }
        frame 12 { y: -17.7; scale-x: -10000; scale-y: -10000; }
        frame 13 { y: -18; }
        frame 14 { y: -18.4; scale-x: 0.799; scale-y: 0.799; }
        frame 15 { x: 33.2; y: -18; scale-x: 0.798; scale-y: 0.798; }
        frame 16 { x: -10000; y: -17.7; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: -17.4; }
        frame 18 { x: 33.1; y: -17.2; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 2.5; y: 6.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 11; y: 1.6; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 19.6; y: -3.2; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 28.2; y: -8.1; skew-x: 5; skew-y: 5; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 29.8; y: -8; }
        frame 28 { x: 31.5; y: -10000; }
        frame 29 { x: 33.1; y: -8.1; }
        frame 30 { x: -10000; y: -10000; }
        frame 37 { x: 28; y: -5.5; skew-x: 4.1; skew-y: 4.1; }
        frame 38 { x: 23; y: -3; skew-x: 3.3; skew-y: 3.3; scale-x: 0.799; scale-y: 0.799; }
        frame 39 { x: 17.9; y: -0.5; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 12.7; y: 1.8; skew-x: 1.5; skew-y: 1.5; }
        frame 41 { x: 7.6; y: 4.2; skew-x: 0.8; skew-y: 0.8; scale-x: 0.8; scale-y: 0.8; }
        frame 42 { x: 2.5; y: 6.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 3.6; y: 5.5; skew-x: 0.5; skew-y: 0.5; }
        frame 45 { x: 4.8; y: 4.6; skew-x: 1; skew-y: 1; }
        frame 46 { x: 6; y: 3.5; skew-x: 1.5; skew-y: 1.5; }
        frame 47 { x: 7.2; y: 2.5; skew-x: 2; skew-y: 2; }
        frame 48 { x: 8.4; y: 1.6; skew-x: 2.6; skew-y: 2.6; }
        frame 49 { x: 9.7; y: 0.6; skew-x: 3.3; skew-y: 3.3; }
        frame 50 { x: 6.3; y: 4.5; skew-x: -10000; skew-y: -10000; }
        frame 51 { x: 3; y: 8.4; }
        frame 52 { x: -0.1; y: 12.3; }
        frame 53 { x: 0.5; y: 10.8; skew-x: 2.3; skew-y: 2.3; }
        frame 54 { x: 1.2; y: 9.5; skew-x: 1.5; skew-y: 1.5; }
        frame 55 { x: 1.9; y: 8; skew-x: 0.8; skew-y: 0.8; }
        frame 56 { x: 2.5; y: 6.5; skew-x: 0; skew-y: 0; }
        frame 57 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 59 { x: 3.6; y: 5.5; skew-x: 0.5; skew-y: 0.5; }
        frame 60 { x: 4.8; y: 4.6; skew-x: 1; skew-y: 1; }
        frame 61 { x: 6; y: 3.5; skew-x: 1.5; skew-y: 1.5; }
        frame 62 { x: 7.2; y: 2.5; skew-x: 2; skew-y: 2; }
        frame 63 { x: 8.4; y: 1.6; skew-x: 2.6; skew-y: 2.6; }
        frame 64 { x: 9.7; y: 0.6; skew-x: 3.3; skew-y: 3.3; }
        frame 65 { x: 6.3; y: 4.5; skew-x: -10000; skew-y: -10000; }
        frame 66 { x: 3; y: 8.4; }
        frame 67 { x: -0.1; y: 12.3; }
        frame 68 { x: 0.5; y: 10.8; skew-x: 2.3; skew-y: 2.3; }
        frame 69 { x: 1.2; y: 9.5; skew-x: 1.5; skew-y: 1.5; }
        frame 70 { x: 1.9; y: 8; skew-x: 0.8; skew-y: 0.8; }
        frame 71 { x: 2.5; y: 6.5; skew-x: 0; skew-y: 0; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 74 { cel: -1; }
        frame 75 { cel: -10000; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 118;
        frame 0 { x: 35.7; y: -43.6; skew-x: 20.3; skew-y: 20.3; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZOMBIE_DANCER__HEAD; }
        frame 1 { x: 35.6; y: -43.9; skew-x: -10000; skew-y: -10000; scale-x: 0.998; scale-y: 0.998; image: none; }
        frame 2 { x: -10000; y: -44.3; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 35.7; y: -44.8; scale-x: 0.999; scale-y: 0.999; }
        frame 4 { x: 35.6; y: -44.3; scale-x: 0.998; scale-y: 0.998; }
        frame 5 { x: -10000; y: -43.9; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 35.7; y: -43.6; scale-x: 0.999; scale-y: 0.999; }
        frame 7 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 35.6; y: -43.8; scale-x: 0.998; scale-y: 0.998; }
        frame 12 { x: -10000; y: -44.1; scale-x: -10000; scale-y: -10000; }
        frame 13 { y: -44.4; }
        frame 14 { x: 35.7; y: -44.8; scale-x: 0.999; scale-y: 0.999; }
        frame 15 { x: 35.6; y: -44.4; scale-x: 0.998; scale-y: 0.998; }
        frame 16 { x: -10000; y: -44.1; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: -43.8; }
        frame 18 { x: 35.7; y: -43.6; scale-x: 0.999; scale-y: 0.999; }
        frame 19 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -4.1; y: -19.1; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 22 { x: 4.9; y: -24.1; skew-x: 1.5; skew-y: 1.5; scale-x: 0.999; scale-y: 0.999; }
        frame 23 { x: 14.2; y: -29.2; skew-x: 3.3; skew-y: 3.3; scale-x: 0.998; scale-y: 0.998; }
        frame 24 { x: 23.7; y: -34.3; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 27 { x: 25.3; }
        frame 28 { x: 27; }
        frame 29 { x: 28.7; }
        frame 30 { x: -10000; }
        frame 37 { x: 23; y: -31.7; skew-x: 4.1; skew-y: 4.1; }
        frame 38 { x: 17.6; y: -29.2; skew-x: 3.3; skew-y: 3.3; }
        frame 39 { x: 12.1; y: -26.7; skew-x: 2.5; skew-y: 2.5; scale-x: 0.999; scale-y: 0.999; }
        frame 40 { x: 6.6; y: -24.2; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 1.1; y: -21.6; skew-x: 0.8; skew-y: 0.8; scale-x: 1; scale-y: 1; }
        frame 42 { x: -4.1; y: -19.1; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: -2.7; y: -20.2; skew-x: 0.5; skew-y: 0.5; }
        frame 45 { x: -1.3; y: -21.2; skew-x: 1; skew-y: 1; }
        frame 46 { x: 0.1; y: -22.2; skew-x: 1.5; skew-y: 1.5; }
        frame 47 { x: 1.4; y: -23.3; skew-x: 2; skew-y: 2; }
        frame 48 { x: 2.9; y: -24.3; skew-x: 2.6; skew-y: 2.6; }
        frame 49 { x: 4.3; y: -25.4; skew-x: 3.3; skew-y: 3.3; }
        frame 50 { x: 1; y: -21.6; skew-x: -10000; skew-y: -10000; }
        frame 51 { x: -2.1; y: -17.7; }
        frame 52 { x: -5.4; y: -13.7; }
        frame 53 { x: -5.2; y: -15; skew-x: 2.3; skew-y: 2.3; }
        frame 54 { x: -4.8; y: -16.4; skew-x: 1.5; skew-y: 1.5; }
        frame 55 { x: -4.5; y: -17.8; skew-x: 0.8; skew-y: 0.8; }
        frame 56 { x: -4.1; y: -19.1; skew-x: 0; skew-y: 0; }
        frame 57 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 59 { x: -2.7; y: -20.2; skew-x: 0.5; skew-y: 0.5; }
        frame 60 { x: -1.3; y: -21.2; skew-x: 1; skew-y: 1; }
        frame 61 { x: 0.1; y: -22.2; skew-x: 1.5; skew-y: 1.5; }
        frame 62 { x: 1.4; y: -23.3; skew-x: 2; skew-y: 2; }
        frame 63 { x: 2.9; y: -24.3; skew-x: 2.6; skew-y: 2.6; }
        frame 64 { x: 4.3; y: -25.4; skew-x: 3.3; skew-y: 3.3; }
        frame 65 { x: 1; y: -21.6; skew-x: -10000; skew-y: -10000; }
        frame 66 { x: -2.1; y: -17.7; }
        frame 67 { x: -5.4; y: -13.7; }
        frame 68 { x: -5.2; y: -15; skew-x: 2.3; skew-y: 2.3; }
        frame 69 { x: -4.8; y: -16.4; skew-x: 1.5; skew-y: 1.5; }
        frame 70 { x: -4.5; y: -17.8; skew-x: 0.8; skew-y: 0.8; }
        frame 71 { x: -4.1; y: -19.1; skew-x: 0; skew-y: 0; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 74 { cel: -1; }
        frame 75 { cel: -10000; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 118;
        frame 0 { x: 31.7; y: -3.7; skew-x: 20.3; skew-y: 20.3; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZOMBIE_JAW; }
        frame 1 { x: -10000; y: -4; skew-x: -10000; skew-y: -10000; scale-x: 0.998; scale-y: 0.943; image: none; }
        frame 2 { x: 31.8; y: -4.4; scale-x: -10000; scale-y: 0.887; }
        frame 3 { x: 31.7; y: -4.8; scale-x: 0.999; scale-y: 0.833; }
        frame 4 { x: -10000; y: -4.4; scale-x: 0.998; scale-y: 0.887; }
        frame 5 { x: 31.6; y: -4; scale-x: -10000; scale-y: 0.943; }
        frame 6 { x: 31.7; y: -3.7; scale-x: 0.999; scale-y: 0.999; }
        frame 7 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { y: -3.9; scale-x: 0.998; scale-y: 0.956; }
        frame 12 { x: 31.8; y: -4.2; scale-x: -10000; scale-y: 0.915; }
        frame 13 { x: -10000; y: -4.6; scale-y: 0.874; }
        frame 14 { x: 31.7; y: -4.8; scale-x: 0.999; scale-y: 0.833; }
        frame 15 { x: -10000; y: -4.5; scale-x: 0.998; scale-y: 0.874; }
        frame 16 { x: 31.8; y: -4.2; scale-x: -10000; scale-y: 0.915; }
        frame 17 { x: 31.6; y: -3.9; scale-y: 0.956; }
        frame 18 { x: 31.7; y: -3.7; scale-x: 0.999; scale-y: 0.999; }
        frame 19 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 5.8; y: 19.6; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 22 { x: 14.2; y: 13.9; skew-x: 1.5; skew-y: 1.5; scale-x: 0.999; scale-y: 1.005; }
        frame 23 { x: 22.7; y: 8.2; skew-x: 3.3; skew-y: 3.3; scale-x: 0.998; scale-y: 1.01; }
        frame 24 { x: 30.9; y: 2.3; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: 1.016; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 27 { x: 32.6; y: 2.8; scale-y: 1.071; }
        frame 28 { x: 34.3; y: 3.3; scale-y: 1.126; }
        frame 29 { x: 35.9; y: 3.8; scale-y: 1.182; }
        frame 30 { x: -10000; y: -10000; scale-y: -10000; }
        frame 37 { x: 30.9; y: 6.5; skew-x: 4.1; skew-y: 4.1; scale-y: 1.151; }
        frame 38 { x: 25.9; y: 9.1; skew-x: 3.3; skew-y: 3.3; scale-y: 1.121; }
        frame 39 { x: 20.9; y: 11.7; skew-x: 2.5; skew-y: 2.5; scale-x: 0.999; scale-y: 1.091; }
        frame 40 { x: 15.8; y: 14.4; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: 1.06; }
        frame 41 { x: 10.8; y: 17; skew-x: 0.8; skew-y: 0.8; scale-x: 1; scale-y: 1.03; }
        frame 42 { x: 5.8; y: 19.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 1; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 44 { x: 7.1; y: 19.2; scale-y: 1.012; }
        frame 45 { x: 8.3; y: 18.7; scale-y: 1.025; }
        frame 46 { x: 9.6; y: 18.3; scale-y: 1.037; }
        frame 47 { x: 10.8; y: 17.8; scale-y: 1.049; }
        frame 48 { x: 12; y: 17.4; scale-y: 1.061; }
        frame 49 { x: 13.2; y: 16.9; scale-y: 1.074; }
        frame 50 { x: 9.9; y: 18.7; scale-y: -10000; }
        frame 51 { x: 6.6; y: 20.5; }
        frame 52 { x: 3.3; y: 22.3; }
        frame 53 { x: 4; y: 21.6; scale-y: 1.055; }
        frame 54 { x: 4.6; y: 20.9; scale-y: 1.037; }
        frame 55 { x: 5.2; y: 20.2; scale-y: 1.018; }
        frame 56 { x: 5.8; y: 19.6; scale-y: 1; }
        frame 57 { x: -10000; y: -10000; scale-y: -10000; }
        frame 59 { x: 7.1; y: 19.2; scale-y: 1.012; }
        frame 60 { x: 8.3; y: 18.7; scale-y: 1.025; }
        frame 61 { x: 9.6; y: 18.3; scale-y: 1.037; }
        frame 62 { x: 10.8; y: 17.8; scale-y: 1.049; }
        frame 63 { x: 12; y: 17.4; scale-y: 1.061; }
        frame 64 { x: 13.2; y: 16.9; scale-y: 1.074; }
        frame 65 { x: 9.9; y: 18.7; scale-y: -10000; }
        frame 66 { x: 6.6; y: 20.5; }
        frame 67 { x: 3.3; y: 22.3; }
        frame 68 { x: 4; y: 21.6; scale-y: 1.055; }
        frame 69 { x: 4.6; y: 20.9; scale-y: 1.037; }
        frame 70 { x: 5.2; y: 20.2; scale-y: 1.018; }
        frame 71 { x: 5.8; y: 19.6; scale-y: 1; }
        frame 72 { x: -10000; y: -10000; scale-y: -10000; }
        frame 74 { cel: -1; }
        frame 75 { cel: -10000; }
    }
    Track {
        source-name: "anim_hair";
        frame-count: 118;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
    }
    Track {
        source-name: "anim_earing";
        frame-count: 118;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_backup_stash";
        frame-count: 118;
        frame 0 { x: 30; y: -11.3; skew-x: 23.1; skew-y: 23.1; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_BACKUP_STASH; }
        frame 1 { x: -10000; y: -11.9; skew-x: 23; skew-y: 23; scale-x: 0.798; scale-y: 0.798; image: none; }
        frame 2 { x: 30.1; y: -12.5; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 3 { x: 30; y: -13.2; scale-x: 0.798; scale-y: 0.798; }
        frame 4 { x: 30.1; y: -12.6; scale-x: 0.797; scale-y: 0.797; }
        frame 5 { x: -10000; y: -11.9; scale-x: 0.798; scale-y: 0.798; }
        frame 6 { x: 30; y: -11.3; skew-x: 23.1; skew-y: 23.1; scale-x: 0.799; scale-y: 0.799; }
        frame 7 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { y: -11.7; skew-x: 23; skew-y: 23; scale-x: 0.798; scale-y: 0.798; }
        frame 12 { y: -12.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 30.1; y: -12.6; scale-x: 0.797; scale-y: 0.797; }
        frame 14 { x: 30; y: -13.2; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 30.1; y: -12.7; scale-x: 0.797; scale-y: 0.797; }
        frame 16 { x: -10000; y: -12.2; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { y: -11.8; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 30; y: -11.3; skew-x: 23.1; skew-y: 23.1; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 1.9; y: 13.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 9.8; y: 8.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 17.8; y: 4.1; }
        frame 24 { x: 25.8; y: -0.3; }
        frame 25 { x: -10000; y: -10000; }
        frame 27 { x: 27.3; }
        frame 28 { x: 28.8; }
        frame 29 { x: 30.3; }
        frame 30 { x: -10000; }
        frame 37 { x: 25.5; y: 1.8; }
        frame 38 { x: 20.8; y: 4.1; }
        frame 39 { x: 16.1; y: 6.3; }
        frame 40 { x: 11.3; y: 8.6; }
        frame 41 { x: 6.6; y: 10.9; }
        frame 42 { x: 1.9; y: 13.2; }
        frame 43 { x: -10000; y: -10000; }
        frame 44 { x: 3; y: 12.4; }
        frame 45 { x: 4; y: 11.5; }
        frame 46 { x: 5; y: 10.7; }
        frame 47 { x: 6.1; y: 9.9; }
        frame 48 { x: 7.1; y: 9.1; }
        frame 49 { x: 8.2; y: 8.2; }
        frame 50 { x: 4.7; y: 11.7; }
        frame 51 { x: 1.3; y: 15.1; }
        frame 52 { x: -2; y: 18.6; }
        frame 53 { x: -1; y: 17.2; }
        frame 54 { x: -0; y: 15.9; }
        frame 55 { x: 0.9; y: 14.5; }
        frame 56 { x: 1.9; y: 13.2; }
        frame 57 { x: -10000; y: -10000; }
        frame 59 { x: 3; y: 12.4; }
        frame 60 { x: 4; y: 11.5; }
        frame 61 { x: 5; y: 10.7; }
        frame 62 { x: 6.1; y: 9.9; }
        frame 63 { x: 7.1; y: 9.1; }
        frame 64 { x: 8.2; y: 8.2; }
        frame 65 { x: 4.7; y: 11.7; }
        frame 66 { x: 1.3; y: 15.1; }
        frame 67 { x: -2; y: 18.6; }
        frame 68 { x: -1; y: 17.2; }
        frame 69 { x: -0; y: 15.9; }
        frame 70 { x: 0.9; y: 14.5; }
        frame 71 { x: 1.9; y: 13.2; }
        frame 72 { x: -10000; y: -10000; }
        frame 74 { cel: -1; }
        frame 75 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerarm_upper";
        frame-count: 118;
        frame 0 { x: 54.9; y: 26.3; skew-x: 285.9; skew-y: 285.9; scale-x: 0.794; scale-y: 0.961; image: IMAGE_REANIM_ZOMBIE_BACKUP_OUTERARM_UPPER; }
        frame 1 { x: 54.7; y: 24.8; skew-x: 287.6; skew-y: 287.6; scale-x: 0.793; scale-y: 0.959; image: none; }
        frame 2 { x: 54.5; y: 23.1; skew-x: 289.3; skew-y: 289.3; scale-x: 0.792; scale-y: -10000; }
        frame 3 { x: 54.2; y: 21.6; skew-x: 291.3; skew-y: 291.3; scale-x: 0.793; }
        frame 4 { x: 54; y: 22.6; skew-x: 293.1; skew-y: 293.1; scale-x: 0.792; scale-y: 0.958; }
        frame 5 { x: 53.9; y: 23.6; skew-x: 295; skew-y: 295; scale-x: -10000; scale-y: 0.959; }
        frame 6 { x: 53.6; y: 24.6; skew-x: 296.9; skew-y: 296.9; scale-x: 0.794; scale-y: 0.96; }
        frame 7 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 53.8; y: 23.5; skew-x: 295; skew-y: 295; scale-x: 0.792; scale-y: 0.959; }
        frame 12 { x: 53.9; y: 22.5; skew-x: 293.1; skew-y: 293.1; scale-x: -10000; scale-y: 0.958; }
        frame 13 { x: 54.2; y: 21.6; skew-x: 291.3; skew-y: 291.3; scale-x: 0.793; scale-y: 0.959; }
        frame 14 { x: 54.5; y: 23.2; skew-x: 289.3; skew-y: 289.3; scale-x: 0.792; scale-y: -10000; }
        frame 15 { x: 54.7; y: 24.9; skew-x: 287.6; skew-y: 287.6; scale-x: 0.793; }
        frame 16 { x: 54.9; y: 26.3; skew-x: 285.9; skew-y: 285.9; scale-x: 0.794; scale-y: 0.961; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 37.2; y: 20.7; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 41.3; y: 22.5; skew-x: 335.4; skew-y: 335.4; scale-x: 0.797; scale-y: 0.853; }
        frame 23 { x: 47.3; y: 24.8; skew-x: 310.6; skew-y: 310.6; scale-x: 0.795; scale-y: 0.906; }
        frame 24 { x: 54.9; y: 26.3; skew-x: 285.9; skew-y: 285.9; scale-x: 0.794; scale-y: 0.961; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 54.2; y: 25.5; skew-x: 291.1; skew-y: 291.1; scale-x: 0.793; scale-y: 0.96; }
        frame 28 { x: 53.6; y: 24.5; skew-x: 296.6; skew-y: 296.6; scale-x: -10000; scale-y: 0.959; }
        frame 29 { x: 53; y: 23.7; skew-x: 301.9; skew-y: 301.9; scale-x: 0.794; scale-y: 0.96; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 49.8; y: 23.2; skew-x: 311.6; skew-y: 311.6; scale-x: 0.793; scale-y: 0.932; }
        frame 38 { x: 46.8; y: 22.6; skew-x: 321.4; skew-y: 321.4; scale-x: 0.794; scale-y: 0.905; }
        frame 39 { x: 44; y: 22.1; skew-x: 330.9; skew-y: 330.9; scale-x: 0.796; scale-y: 0.879; }
        frame 40 { x: 41.4; y: 21.5; skew-x: 340.7; skew-y: 340.7; scale-x: 0.797; scale-y: 0.852; }
        frame 41 { x: 39.2; y: 21; skew-x: 350.4; skew-y: 350.5; scale-x: 0.798; scale-y: 0.826; }
        frame 42 { x: 37.2; y: 20.7; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 39.8; y: 18.3; skew-x: 375.1; skew-y: 375.1; scale-x: 0.798; scale-y: 0.798; }
        frame 45 { x: 43.2; y: 16.4; skew-x: 390.3; skew-y: 390.3; scale-x: 0.797; scale-y: 0.797; }
        frame 46 { x: 42.8; y: 16.2; skew-x: 379.8; skew-y: 379.8; scale-x: 0.796; scale-y: 0.796; }
        frame 47 { x: 42.5; y: 15.9; skew-x: 369.5; skew-y: 369.5; scale-x: 0.797; scale-y: 0.797; }
        frame 48 { x: -10000; y: 16.1; skew-x: 359.2; skew-y: 359.2; scale-x: 0.798; scale-y: 0.798; }
        frame 49 { x: 42.7; y: 16.4; skew-x: 348.7; skew-y: 348.7; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 41.9; y: 17.8; skew-x: 359.7; skew-y: 359.7; scale-x: 0.797; scale-y: 0.797; }
        frame 51 { x: 41.3; y: 19.4; skew-x: 370.3; skew-y: 370.3; scale-x: 0.796; scale-y: 0.796; }
        frame 52 { x: 41.1; y: 21.2; skew-x: 381.3; skew-y: 381.3; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 40.4; y: 21.1; skew-x: 377.8; skew-y: 377.8; scale-x: 0.796; scale-y: 0.796; }
        frame 54 { x: 39.6; y: -10000; skew-x: 374.1; skew-y: 374.1; scale-x: 0.797; scale-y: 0.797; }
        frame 55 { x: 39; y: 20.9; skew-x: 370.5; skew-y: 370.5; scale-x: 0.798; scale-y: 0.798; }
        frame 56 { x: 38.5; y: 20.8; skew-x: 367; skew-y: 367; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 37.9; y: -10000; skew-x: 363.5; skew-y: 363.5; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 37.2; y: 20.7; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 59 { x: 38.4; y: 20.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 39.5; y: 19.4; }
        frame 61 { x: 40.6; y: 18.8; }
        frame 62 { x: 41.8; y: 18.2; }
        frame 63 { x: 42.9; y: 17.5; }
        frame 64 { x: 44; y: 16.9; }
        frame 65 { x: 42.1; y: 19.3; }
        frame 66 { x: 40.2; y: 21.7; }
        frame 67 { x: 38.3; y: 24.1; }
        frame 68 { x: 38; y: 23.2; }
        frame 69 { x: 37.8; y: 22.4; }
        frame 70 { x: 37.5; y: 21.6; }
        frame 71 { x: 37.2; y: 20.7; }
        frame 72 { x: -10000; y: -10000; }
        frame 74 { cel: -1; }
        frame 75 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerarm_upper";
        frame-count: 118;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 74 { x: 50.6; y: 16.7; skew-x: -9.7; skew-y: -9.7; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_BACKUP_OUTERARM_UPPER_BONE; }
        frame 75 { x: 52.9; y: 16.3; skew-x: -7.9; skew-y: -7.9; scale-x: 0.799; scale-y: 0.799; cel: -10000; image: none; }
        frame 76 { x: 54.9; y: 16; skew-x: -6.5; skew-y: -6.5; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 56.6; y: 15.9; skew-x: -5.2; skew-y: -5.2; }
        frame 78 { x: 58; y: 15.7; skew-x: -4.2; skew-y: -4.2; }
        frame 79 { x: 59.3; y: 15.5; skew-x: -3.4; skew-y: -3.4; }
        frame 80 { x: 60.2; y: -10000; skew-x: -2.7; skew-y: -2.7; }
        frame 81 { x: 60.9; y: 15.4; skew-x: -2.2; skew-y: -2.2; }
        frame 82 { x: 61.3; y: 15.2; skew-x: -1.9; skew-y: -1.9; }
        frame 83 { x: 61.4; y: 15.3; skew-x: -10000; skew-y: -10000; }
        frame 84 { x: 58.3; y: 15.9; skew-x: -5.4; skew-y: -5.4; }
        frame 85 { x: 55.4; y: 16.6; skew-x: -8.7; skew-y: -8.7; }
        frame 86 { x: 53; y: 17.1; skew-x: -11.7; skew-y: -11.7; scale-x: 0.798; scale-y: 0.798; }
        frame 87 { x: 50.8; y: 17.5; skew-x: -14; skew-y: -14; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 49.2; y: 18; skew-x: -16.2; skew-y: -16.2; }
        frame 89 { x: 47.8; y: 18.3; skew-x: -17.9; skew-y: -17.9; }
        frame 90 { x: 46.6; y: 18.5; skew-x: -19.2; skew-y: -19.2; }
        frame 91 { x: 45.9; y: 18.7; skew-x: -20.2; skew-y: -20.2; }
        frame 92 { x: 45.5; y: 18.8; skew-x: -20.7; skew-y: -20.7; }
        frame 93 { x: 45.3; y: -10000; skew-x: -21; skew-y: -21; }
        frame 94 { x: 46; y: 18.7; skew-x: -20.2; skew-y: -20.2; }
        frame 95 { x: 48; y: 18.5; skew-x: -18.4; skew-y: -18.4; }
        frame 96 { x: 51.5; y: 18; skew-x: -15.2; skew-y: -15.2; }
        frame 97 { x: 56.5; y: 17.5; skew-x: -10.7; skew-y: -10.7; }
        frame 98 { x: 63; y: 16.9; skew-x: -5.2; skew-y: -5.2; }
        frame 99 { x: 70.8; y: 16.1; skew-x: 1.6; skew-y: 1.6; }
        frame 100 { x: 80.6; y: 15.3; skew-x: 9.8; skew-y: 9.8; }
        frame 101 { x: 91.9; y: 14.6; skew-x: 19.3; skew-y: 19.3; scale-x: 0.797; scale-y: 0.797; }
        frame 102 { x: 105; y: 13.9; skew-x: 30.1; skew-y: 30.1; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 120; y: 13.7; skew-x: 42.3; skew-y: 42.3; scale-x: 0.798; scale-y: 0.798; }
        frame 104 { x: 147.2; y: 30.9; skew-x: 60.2; skew-y: 60.2; scale-x: 0.796; scale-y: 0.796; }
        frame 105 { x: 174.4; y: 49.3; skew-x: 78; skew-y: 78; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 188.5; y: 76.8; skew-x: 95.6; skew-y: 95.6; }
        frame 107 { x: 202; y: 105.1; skew-x: 113.4; skew-y: 113.4; }
        frame 108 { x: 200.1; y: 103.3; skew-x: 99.5; skew-y: 99.5; scale-x: 0.795; scale-y: 0.795; }
        frame 109 { x: 197.9; y: 102; skew-x: 85.9; skew-y: 85.9; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 195.4; y: 101.2; skew-x: 72; skew-y: 72; scale-x: 0.794; scale-y: 0.794; }
        frame 111 { x: 192.7; y: 101.1; skew-x: 58.1; skew-y: 58.1; scale-x: 0.795; scale-y: 0.795; }
        frame 112 { x: 193.4; y: 101; skew-x: 62.2; skew-y: 62.2; scale-x: 0.793; scale-y: 0.793; }
        frame 113 { x: 194.1; y: 101.1; skew-x: 66.2; skew-y: 66.2; scale-x: 0.792; scale-y: 0.792; }
        frame 114 { x: 195; y: 101.3; skew-x: 70.1; skew-y: 70.1; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 194.2; y: 101.2; skew-x: 66.2; skew-y: 66.2; }
        frame 116 { x: 193.5; y: -10000; skew-x: 62.2; skew-y: 62.2; scale-x: 0.793; scale-y: 0.793; }
        frame 117 { x: 192.7; y: 101.1; skew-x: 58.1; skew-y: 58.1; scale-x: 0.795; scale-y: 0.795; }
    }
    Track {
        source-name: "Zombie_disco_outerarm_lower";
        frame-count: 118;
        frame 0 { x: 69.1; y: 23.8; skew-x: 358; skew-y: 358; scale-x: 0.797; scale-y: 0.797; image: IMAGE_REANIM_ZOMBIE_BACKUP_OUTERARM_LOWER; }
        frame 1 { x: 68.5; y: -10000; skew-x: 355.7; skew-y: 355.7; scale-x: 0.796; scale-y: 0.796; image: none; }
        frame 2 { x: 67.8; y: 23.9; skew-x: 353.5; skew-y: 353.5; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 67.2; y: -10000; skew-x: 351.2; skew-y: 351.2; }
        frame 4 { x: -10000; y: 25.9; skew-x: 351.7; skew-y: 351.7; }
        frame 5 { x: 67.3; y: 27.8; skew-x: 352.2; skew-y: 352.2; }
        frame 6 { x: 67.2; y: 30; skew-x: 352.5; skew-y: 352.5; }
        frame 7 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 11 { x: 67.3; y: 27.9; skew-x: 352.2; skew-y: 352.2; }
        frame 12 { x: 67.2; y: 26; skew-x: 351.7; skew-y: 351.7; }
        frame 13 { x: -10000; y: 23.9; skew-x: 351.2; skew-y: 351.2; }
        frame 14 { x: 67.8; y: -10000; skew-x: 353.5; skew-y: 353.5; }
        frame 15 { x: 68.5; y: 23.7; skew-x: 355.7; skew-y: 355.7; }
        frame 16 { x: 69.1; y: 23.8; skew-x: 358; skew-y: 358; scale-x: 0.797; scale-y: 0.797; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 27.8; y: 43.9; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 41.5; y: 37; skew-x: 359.5; skew-y: 359.5; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 55.3; y: 30.4; skew-x: 358.7; skew-y: 358.7; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 69.1; y: 23.8; skew-x: 358; skew-y: 358; scale-x: 0.797; scale-y: 0.797; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 68.3; y: 24.2; skew-x: 362; skew-y: 362; scale-x: 0.796; scale-y: 0.796; }
        frame 28 { x: 67.5; y: 24.6; skew-x: 366; skew-y: 366; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 66.8; y: 25; skew-x: 370.1; skew-y: 370.1; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 37 { x: 60.3; y: 28.1; skew-x: 368.3; skew-y: 368.3; }
        frame 38 { x: 53.7; y: 31.3; skew-x: 366.6; skew-y: 366.6; scale-x: 0.797; scale-y: 0.797; }
        frame 39 { x: 47.2; y: 34.4; skew-x: 365; skew-y: 365; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 40.7; y: 37.6; skew-x: 363.3; skew-y: 363.3; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 34.1; y: 40.8; skew-x: 361.5; skew-y: 361.5; scale-x: 0.799; scale-y: 0.799; }
        frame 42 { x: 27.8; y: 43.9; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 26.5; y: 36; skew-x: 383; skew-y: 383; scale-x: 0.797; scale-y: 0.797; }
        frame 45 { x: 27.4; y: 29.5; skew-x: 406.1; skew-y: 406.1; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 32.6; y: 27.1; skew-x: 410.6; skew-y: 410.6; scale-x: 0.795; scale-y: 0.795; }
        frame 47 { x: 38; y: 24.8; skew-x: 414.9; skew-y: 414.9; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 43.3; y: 22.5; skew-x: 419.4; skew-y: 419.4; }
        frame 49 { x: 48.7; y: 20.3; skew-x: 423.8; skew-y: 423.8; scale-x: 0.797; scale-y: 0.797; }
        frame 50 { x: 45.8; y: 23.4; skew-x: 427.7; skew-y: 427.7; scale-x: 0.795; scale-y: 0.795; }
        frame 51 { x: 42.9; y: 26.3; skew-x: 431.7; skew-y: 431.7; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 40; y: 29.5; skew-x: 435.6; skew-y: 435.6; scale-x: 0.796; scale-y: 0.796; }
        frame 53 { x: 36.8; y: 30.4; skew-x: 423; skew-y: 423; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 33.9; y: 31.8; skew-x: 410.4; skew-y: 410.4; }
        frame 55 { x: 31.5; y: 34; skew-x: 397.8; skew-y: 397.8; scale-x: 0.797; scale-y: 0.797; }
        frame 56 { x: 29.5; y: 36.9; skew-x: 385.1; skew-y: 385.1; scale-x: 0.798; scale-y: 0.798; }
        frame 57 { x: 28.2; y: 40.3; skew-x: 372.5; skew-y: 372.5; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 27.8; y: 43.9; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 59 { x: 28.8; y: 43.7; skew-x: 358.5; skew-y: 358.5; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 30; y: 43.4; skew-x: 357; skew-y: 357; }
        frame 61 { x: 31.1; y: 43.1; skew-x: 355.5; skew-y: 355.5; }
        frame 62 { x: 32.1; y: 42.9; skew-x: 353.9; skew-y: 353.9; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: 33.3; y: 42.6; skew-x: 352.2; skew-y: 352.2; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 34.4; y: 42.4; skew-x: 350.7; skew-y: 350.7; scale-x: 0.8; scale-y: 0.8; }
        frame 65 { x: 32.5; y: 44.6; skew-x: 351.2; skew-y: 351.2; scale-x: 0.799; scale-y: 0.799; }
        frame 66 { x: 30.6; y: 47; skew-x: 351.5; skew-y: 351.5; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 28.6; y: 49.3; skew-x: 351.7; skew-y: 351.7; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: 28.4; y: 48; skew-x: 353.9; skew-y: 353.9; scale-x: 0.799; scale-y: 0.799; }
        frame 69 { x: 28.2; y: 46.6; skew-x: 356; skew-y: 356; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: 28; y: 45.3; skew-x: 358; skew-y: 358; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 27.8; y: 43.9; skew-x: 360; skew-y: 360; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 74 { cel: -1; }
        frame 75 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_outerhand";
        frame-count: 118;
        frame 0 { x: 76.2; y: 30.8; skew-x: 56.9; skew-y: 56.9; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_BACKUP_OUTERHAND; }
        frame 1 { x: -10000; y: 30.5; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; image: none; }
        frame 2 { y: 30.3; scale-x: -10000; scale-y: -10000; }
        frame 3 { y: 31.3; scale-x: 0.796; scale-y: 0.796; }
        frame 4 { x: 76.3; y: 32.2; scale-x: 0.797; scale-y: 0.797; }
        frame 5 { x: -10000; y: 33.1; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 76.2; y: 33.9; scale-x: 0.799; scale-y: 0.799; }
        frame 7 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 76.3; y: 32.1; scale-x: 0.797; scale-y: 0.797; }
        frame 12 { x: 76.2; y: 30.3; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -10000; y: 30.5; scale-x: 0.796; scale-y: 0.796; }
        frame 14 { x: 76.3; y: 30.6; scale-x: 0.797; scale-y: 0.797; }
        frame 15 { x: -10000; y: 30.8; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 76.2; y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 23.3; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 39.8; y: 50; skew-x: 18.8; skew-y: 18.8; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 57.6; y: 39.6; skew-x: 37.9; skew-y: 37.9; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 76.2; y: 30.8; skew-x: 56.9; skew-y: 56.9; scale-x: 0.799; scale-y: 0.799; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 73.7; y: 31.5; scale-x: 0.797; scale-y: 0.797; }
        frame 28 { x: 71.1; y: 32.2; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 68.5; y: 33; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 60.5; y: 36.9; skew-x: 47.4; skew-y: 47.4; scale-x: 0.797; scale-y: 0.797; }
        frame 38 { x: 52.5; y: 41.1; skew-x: 37.9; skew-y: 37.9; scale-x: 0.798; scale-y: 0.798; }
        frame 39 { x: 44.8; y: 45.8; skew-x: 28.3; skew-y: 28.3; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 37.3; y: 50.8; skew-x: 18.8; skew-y: 18.8; scale-x: 0.799; scale-y: 0.799; }
        frame 41 { x: 30.1; y: 56.1; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 23.3; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 19.7; y: 46.5; skew-x: 38.1; skew-y: 38.1; scale-x: 0.797; scale-y: 0.797; }
        frame 45 { x: 19; y: 37.5; skew-x: 76.2; skew-y: 76.2; scale-x: 0.796; scale-y: 0.796; }
        frame 46 { x: 25; y: 34.6; skew-x: 85.5; skew-y: 85.5; scale-x: 0.797; scale-y: 0.797; }
        frame 47 { x: 30.8; y: 32; skew-x: 94.5; skew-y: 94.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 36.5; y: 29.7; skew-x: 103.6; skew-y: 103.6; }
        frame 49 { x: 41.9; y: 27.9; skew-x: 112.8; skew-y: 112.8; }
        frame 50 { x: 37.5; y: 29.5; skew-x: 111; skew-y: 111; scale-x: 0.796; scale-y: 0.796; }
        frame 51 { x: 33.1; y: 31.1; skew-x: 109.1; skew-y: 109.1; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 28.6; y: 32.6; skew-x: 107.3; skew-y: 107.3; }
        frame 53 { x: 27.8; y: 33.9; skew-x: 89.5; skew-y: 89.5; scale-x: 0.797; scale-y: 0.797; }
        frame 54 { x: 26.4; y: 36.5; skew-x: 71.7; skew-y: 71.7; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 24.8; y: 40.8; skew-x: 53.7; skew-y: 53.7; }
        frame 56 { x: 23.4; y: 46.5; skew-x: 35.8; skew-y: 35.8; }
        frame 57 { x: 22.8; y: 53.5; skew-x: 17.8; skew-y: 17.8; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 23.3; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 59 { x: 24.9; y: 60.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 26.5; y: 60; }
        frame 61 { x: 28.1; y: 59.2; }
        frame 62 { x: 29.7; y: 58.4; }
        frame 63 { x: 31.3; y: 57.6; }
        frame 64 { x: 32.9; y: 56.8; }
        frame 65 { x: 30.8; y: 59.5; }
        frame 66 { x: 28.7; y: 62.2; }
        frame 67 { x: 26.6; y: 64.9; }
        frame 68 { x: 25.8; y: 64.1; }
        frame 69 { x: 25; y: 63.3; }
        frame 70 { x: 24.2; y: 62.4; }
        frame 71 { x: 23.3; y: 61.5; }
        frame 72 { x: -10000; y: -10000; }
        frame 74 { cel: -1; }
        frame 75 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_disco_collar_overlay";
        frame-count: 118;
        frame 0 { x: 50; y: 5.7; skew-x: 26.1; skew-y: 26.1; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_BACKUP_COLLAR_OVERLAY; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; image: none; }
        frame 2 { scale-x: -10000; scale-y: -10000; }
        frame 4 { scale-x: 0.799; scale-y: 0.799; }
        frame 5 { scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 50.1; y: 4.8; scale-x: 0.797; scale-y: 0.797; }
        frame 12 { x: -10000; y: 3.9; scale-x: 0.798; scale-y: 0.798; }
        frame 13 { y: 4.3; scale-x: 0.797; scale-y: 0.797; }
        frame 14 { y: 4.8; skew-x: 26; skew-y: 26; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 50; y: 5.3; skew-x: 26.1; skew-y: 26.1; scale-x: 0.798; scale-y: 0.798; }
        frame 16 { x: -10000; y: 5.7; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 31.2; y: 15.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 37.3; y: 12.6; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 43.5; y: 10; skew-x: 12.3; skew-y: 12.3; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 49.7; y: 7.5; skew-x: 18.5; skew-y: 18.5; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 27 { x: 51; skew-x: 24.6; skew-y: 24.6; scale-x: 0.797; scale-y: 0.797; }
        frame 28 { x: 52.5; y: 7.6; skew-x: 30.8; skew-y: 30.8; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 54; y: 7.8; skew-x: 37.1; skew-y: 37.1; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 50.1; y: 8.9; skew-x: 30.8; skew-y: 30.8; }
        frame 38 { x: 46.2; y: 10; skew-x: 24.6; skew-y: 24.6; }
        frame 39 { x: 42.5; y: 11.3; skew-x: 18.5; skew-y: 18.5; }
        frame 40 { x: 38.6; y: 12.5; skew-x: 12.3; skew-y: 12.3; scale-x: 0.799; scale-y: 0.799; }
        frame 41 { x: 34.9; y: 13.9; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 31.2; y: 15.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 32.9; y: 14.4; skew-x: 1.5; skew-y: 1.5; }
        frame 45 { x: 34.5; y: 13.4; skew-x: 3.3; skew-y: 3.3; }
        frame 46 { x: 36.2; y: 12.5; skew-x: 5; skew-y: 5; }
        frame 47 { x: 37.9; y: 11.6; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 48 { x: 39.5; y: 10.6; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 41.3; y: 9.7; skew-x: 10.1; skew-y: 10.1; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: 38.5; y: 12.5; skew-x: 7; skew-y: 7; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 35.6; y: 15.3; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 33; y: 18.2; skew-x: 1; skew-y: 1; }
        frame 53 { x: 32.5; y: 17.5; skew-x: 0.8; skew-y: 0.8; }
        frame 54 { x: 32.1; y: 16.7; skew-x: 0.5; skew-y: 0.5; scale-x: 0.8; scale-y: 0.8; }
        frame 55 { x: 31.6; y: 16.1; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 31.2; y: 15.3; skew-x: 0; skew-y: 0; }
        frame 57 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 59 { x: 32.9; y: 14.4; skew-x: 1.5; skew-y: 1.5; }
        frame 60 { x: 34.5; y: 13.4; skew-x: 3.3; skew-y: 3.3; }
        frame 61 { x: 36.2; y: 12.5; skew-x: 5; skew-y: 5; }
        frame 62 { x: 37.9; y: 11.6; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: 39.5; y: 10.6; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 41.3; y: 9.7; skew-x: 10.1; skew-y: 10.1; scale-x: 0.8; scale-y: 0.8; }
        frame 65 { x: 38.5; y: 12.5; skew-x: 7; skew-y: 7; scale-x: 0.799; scale-y: 0.799; }
        frame 66 { x: 35.6; y: 15.3; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 33; y: 18.2; skew-x: 1; skew-y: 1; }
        frame 68 { x: 32.5; y: 17.5; skew-x: 0.8; skew-y: 0.8; }
        frame 69 { x: 32.1; y: 16.7; skew-x: 0.5; skew-y: 0.5; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: 31.6; y: 16.1; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 31.2; y: 15.3; skew-x: 0; skew-y: 0; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 74 { x: 49.5; y: 4.8; skew-x: 23; skew-y: 23; scale-x: 0.799; scale-y: 0.799; }
        frame 75 { x: 52.2; y: -10000; skew-x: 24.6; skew-y: 24.6; scale-x: 0.798; scale-y: 0.798; }
        frame 76 { x: 54.6; y: 4.9; skew-x: 26; skew-y: 26; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 56.8; y: -10000; skew-x: 27.1; skew-y: 27.1; }
        frame 78 { x: 58.5; skew-x: 28.3; skew-y: 28.3; }
        frame 79 { x: 60; y: 5; skew-x: 29.1; skew-y: 29.1; }
        frame 80 { x: 61.1; skew-x: 29.8; skew-y: 29.8; }
        frame 81 { x: 62; skew-x: 30.1; skew-y: 30.1; }
        frame 82 { x: 62.5; skew-x: 30.6; skew-y: 30.6; }
        frame 83 { x: 62.6; y: 4.9; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 84 { x: 59.3; y: 5.2; skew-x: 28.6; skew-y: 28.6; scale-x: 0.797; scale-y: 0.797; }
        frame 85 { x: 56.3; y: 5.3; skew-x: 26.8; skew-y: 26.8; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 53.7; y: 5.5; skew-x: 25.3; skew-y: 25.3; }
        frame 87 { x: 51.4; y: -10000; skew-x: 24.1; skew-y: 24.1; }
        frame 88 { x: 49.6; y: 5.8; skew-x: 23.1; skew-y: 23.1; }
        frame 89 { x: 48; y: -10000; skew-x: 22.1; skew-y: 22.1; }
        frame 90 { x: 46.8; skew-x: 21.3; skew-y: 21.3; }
        frame 91 { x: 45.9; y: 5.9; skew-x: 20.8; skew-y: 20.8; }
        frame 92 { x: 45.3; y: -10000; skew-x: 20.6; skew-y: 20.6; }
        frame 93 { x: 45.1; y: 5.8; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; }
        frame 94 { x: 46; y: -10000; skew-x: 20.8; skew-y: 20.8; scale-x: 0.797; scale-y: 0.797; }
        frame 95 { x: 48.3; skew-x: 21.8; skew-y: 21.8; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 52.2; skew-x: 23.6; skew-y: 23.6; }
        frame 97 { x: 57.6; y: 5.6; skew-x: 25.8; skew-y: 25.8; }
        frame 98 { x: 64.7; y: 5.5; skew-x: 28.8; skew-y: 28.8; }
        frame 99 { x: 73.3; y: 5.3; skew-x: 32.6; skew-y: 32.6; }
        frame 100 { x: 83.4; y: 5.2; skew-x: 36.9; skew-y: 36.9; scale-x: 0.796; scale-y: 0.796; }
        frame 101 { x: 95.2; y: -10000; skew-x: 41.9; skew-y: 41.9; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 108.5; skew-x: 47.6; skew-y: 47.6; }
        frame 103 { x: 123.3; y: 5.3; skew-x: 53.9; skew-y: 53.9; scale-x: 0.797; scale-y: 0.797; }
        frame 104 { x: 152; y: 24; skew-x: 71.2; skew-y: 71.2; scale-x: 0.796; scale-y: 0.796; }
        frame 105 { x: 180.5; y: 43.3; skew-x: 88.5; skew-y: 88.5; scale-x: 0.797; scale-y: 0.797; }
        frame 106 { x: 195.4; y: 73.6; skew-x: 105.5; skew-y: 105.5; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 209.6; y: 104.2; skew-x: 122.8; skew-y: 122.8; scale-x: 0.798; scale-y: 0.798; }
        frame 108 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_disco_chops";
        frame-count: 118;
        frame 0 { x: 57.5; y: -6.5; skew-x: 20.3; skew-y: 20.3; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_BACKUP_CHOPS; }
        frame 1 { x: 57.6; y: -6.9; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; image: none; }
        frame 2 { x: -10000; y: -7.3; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 57.5; y: -7.7; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: -10000; y: -7.3; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { y: -6.9; scale-x: -10000; scale-y: -10000; }
        frame 6 { y: -6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 7 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 57.6; y: -6.8; scale-x: 0.798; scale-y: 0.798; }
        frame 12 { x: -10000; y: -7.1; scale-x: -10000; scale-y: -10000; }
        frame 13 { y: -7.4; }
        frame 14 { x: 57.5; y: -7.7; scale-x: 0.799; scale-y: 0.799; }
        frame 15 { x: -10000; y: -7.4; scale-x: 0.798; scale-y: 0.798; }
        frame 16 { y: -7.1; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: -6.8; }
        frame 18 { y: -6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 28.9; y: 6.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 37.3; y: 2.8; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 45.9; y: -1.2; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 54.3; y: -5.2; skew-x: 5; skew-y: 5; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 56; }
        frame 28 { x: 57.6; }
        frame 29 { x: 59.3; }
        frame 30 { x: -10000; }
        frame 37 { x: 54.1; y: -3.1; skew-x: 4.1; skew-y: 4.1; }
        frame 38 { x: 49.1; y: -1; skew-x: 3.3; skew-y: 3.3; scale-x: 0.799; scale-y: 0.799; }
        frame 39 { x: 44; y: 0.9; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 39; y: 2.9; skew-x: 1.5; skew-y: 1.5; }
        frame 41 { x: 33.9; y: 4.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.8; scale-y: 0.8; }
        frame 42 { x: 28.9; y: 6.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 30; y: 6.1; skew-x: 0.5; skew-y: 0.5; }
        frame 45 { x: 31.3; y: 5.3; skew-x: 1; skew-y: 1; }
        frame 46 { x: 32.4; y: 4.8; skew-x: 1.5; skew-y: 1.5; }
        frame 47 { x: 33.5; y: 4; skew-x: 2; skew-y: 2; }
        frame 48 { x: 34.8; y: 3.3; skew-x: 2.6; skew-y: 2.6; }
        frame 49 { x: 36; y: 2.5; skew-x: 3.3; skew-y: 3.3; }
        frame 50 { x: 32.6; y: 6.4; skew-x: -10000; skew-y: -10000; }
        frame 51 { x: 29.4; y: 10.3; }
        frame 52 { x: 26.1; y: 14.2; }
        frame 53 { x: 26.8; y: 12.3; skew-x: 2.3; skew-y: 2.3; }
        frame 54 { x: 27.4; y: 10.5; skew-x: 1.5; skew-y: 1.5; }
        frame 55 { x: 28.3; y: 8.7; skew-x: 0.8; skew-y: 0.8; }
        frame 56 { x: 28.9; y: 6.8; skew-x: 0; skew-y: 0; }
        frame 57 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 59 { x: 30; y: 6.1; skew-x: 0.5; skew-y: 0.5; }
        frame 60 { x: 31.3; y: 5.3; skew-x: 1; skew-y: 1; }
        frame 61 { x: 32.4; y: 4.8; skew-x: 1.5; skew-y: 1.5; }
        frame 62 { x: 33.5; y: 4; skew-x: 2; skew-y: 2; }
        frame 63 { x: 34.8; y: 3.3; skew-x: 2.6; skew-y: 2.6; }
        frame 64 { x: 36; y: 2.5; skew-x: 3.3; skew-y: 3.3; }
        frame 65 { x: 32.6; y: 6.4; skew-x: -10000; skew-y: -10000; }
        frame 66 { x: 29.4; y: 10.3; }
        frame 67 { x: 26.1; y: 14.2; }
        frame 68 { x: 26.8; y: 12.3; skew-x: 2.3; skew-y: 2.3; }
        frame 69 { x: 27.4; y: 10.5; skew-x: 1.5; skew-y: 1.5; }
        frame 70 { x: 28.3; y: 8.7; skew-x: 0.8; skew-y: 0.8; }
        frame 71 { x: 28.9; y: 6.8; skew-x: 0; skew-y: 0; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 74 { cel: -1; }
        frame 75 { cel: -10000; }
    }
}
