export component Zombie_pogo {
    fps: 12;
    Track {
        source-name: "_ground";
        frame-count: 166;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 29 { x: -9.8; y: 40; cel: 0; }
        frame 30 { x: -8.4; y: -10000; cel: -10000; }
        frame 31 { x: -7; }
        frame 32 { x: -5.6; }
        frame 33 { x: -4.1; }
        frame 34 { x: -2.7; }
        frame 35 { x: -1.3; }
        frame 36 { x: 0; }
        frame 37 { x: 1.4; }
        frame 38 { x: 2.8; }
        frame 39 { x: 4.2; }
        frame 40 { x: 5.7; }
        frame 41 { x: 7.1; }
        frame 42 { x: 7.9; }
        frame 43 { x: 8.8; }
        frame 44 { x: 9.7; }
        frame 45 { x: 10.5; }
        frame 46 { x: 10.6; }
        frame 47 { x: 10.8; }
        frame 48 { x: 10.9; }
        frame 49 { x: 11; }
        frame 50 { x: -10000; }
        frame 51 { x: 11; }
        frame 52 { x: -10000; }
        frame 54 { x: 13.4; }
        frame 55 { x: 15.8; }
        frame 56 { x: 18.1; }
        frame 57 { x: 20.5; }
        frame 58 { x: 22.8; }
        frame 59 { x: 25.2; }
        frame 60 { x: 27.6; }
        frame 61 { x: 29.9; }
        frame 62 { x: 31.1; }
        frame 63 { x: 32.3; }
        frame 64 { x: 33.5; }
        frame 65 { x: 34.6; }
        frame 66 { x: 35.9; }
        frame 67 { x: 37; }
        frame 68 { x: 38.2; }
        frame 69 { x: 39.4; }
        frame 70 { x: 39.5; }
        frame 71 { x: 39.6; }
        frame 72 { x: 39.7; }
        frame 73 { x: 39.8; }
        frame 74 { x: 39.9; }
        frame 75 { x: 40; }
        frame 76 { x: -10000; cel: -1; }
        frame 77 { cel: -10000; }
    }
    Track {
        source-name: "anim_pogo";
        frame-count: 166;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 155 { cel: 0; }
        frame 156 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 166;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 116 { cel: 0; }
        frame 117 { cel: -10000; }
        frame 155 { cel: -1; }
        frame 156 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 166;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 29 { cel: 0; }
        frame 30 { cel: -10000; }
        frame 76 { cel: -1; }
        frame 77 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 166;
        frame 29 { cel: -1; }
        frame 30 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 166;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 76 { cel: 0; }
        frame 77 { cel: -10000; }
        frame 116 { cel: -1; }
        frame 117 { cel: -10000; }
    }
    Track {
        source-name: "anim_innerarm3";
        frame-count: 166;
        frame 0 { x: 24.7; y: 81.2; skew-x: 354.2; skew-y: 354.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_INNERARM_HAND; }
        frame 1 { x: -10000; y: 79.7; skew-x: 356.7; skew-y: 356.7; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { y: 78.2; skew-x: 359; skew-y: 359; scale-x: -10000; scale-y: -10000; }
        frame 3 { y: 76.7; skew-x: 361; skew-y: 361; }
        frame 4 { x: 24.6; y: 75.3; skew-x: 363.5; skew-y: 363.5; }
        frame 5 { x: 24.9; y: 76; skew-x: 361.3; skew-y: 361.3; }
        frame 6 { x: 25.2; y: 76.5; skew-x: 359.5; skew-y: 359.5; scale-x: 0.798; scale-y: 0.798; }
        frame 7 { x: 25.6; y: 77.1; skew-x: 357.5; skew-y: 357.5; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 26; y: 77.6; skew-x: 355.5; skew-y: 355.5; }
        frame 9 { x: 26.3; y: 78.1; skew-x: 353.4; skew-y: 353.4; }
        frame 10 { x: 26.7; y: 78.7; skew-x: 351.2; skew-y: 351.2; }
        frame 11 { x: 26.4; y: 78.5; skew-x: 353; skew-y: 353; }
        frame 12 { x: 25.8; y: 78.3; skew-x: 354.7; skew-y: 354.7; }
        frame 13 { x: 25.6; y: 77.5; skew-x: 357; skew-y: 357; }
        frame 14 { x: 25.4; y: 76.7; skew-x: 359.2; skew-y: 359.2; }
        frame 15 { x: 25.1; y: 76.1; skew-x: 361.3; skew-y: 361.3; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 24.9; y: 75.3; skew-x: 363.5; skew-y: 363.5; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 25.3; y: 76.8; skew-x: 361; skew-y: 361; }
        frame 18 { x: 25.6; y: 78.5; skew-x: 358.7; skew-y: 358.7; }
        frame 19 { x: 26.1; y: 80; skew-x: 356.2; skew-y: 356.2; }
        frame 20 { x: 26.5; y: 81.6; skew-x: 353.7; skew-y: 353.7; }
        frame 21 { x: 26.9; y: 83.1; skew-x: 351.2; skew-y: 351.2; }
        frame 22 { x: 27.4; y: 84.6; skew-x: 348.7; skew-y: 348.7; }
        frame 23 { x: 27; y: -10000; skew-x: 349.7; skew-y: 349.7; }
        frame 24 { x: 26.6; skew-x: 350.7; skew-y: 350.7; }
        frame 25 { x: 26.1; y: 83.7; skew-x: 351.7; skew-y: 351.7; }
        frame 26 { x: 25.5; y: 82.9; skew-x: 352.5; skew-y: 352.5; }
        frame 27 { x: 25; y: 82; skew-x: 353.4; skew-y: 353.4; }
        frame 28 { x: 24.4; y: 81.2; skew-x: 354.2; skew-y: 354.2; scale-x: 0.8; scale-y: 0.8; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 22.7; y: 79.7; skew-x: 359.4; skew-y: 359.4; scale-x: 0.816; scale-y: 0.799; }
        frame 31 { x: 21; y: 78.3; skew-x: 364.3; skew-y: 364.3; scale-x: 0.832; scale-y: 0.797; }
        frame 32 { x: 19.4; y: 76.8; skew-x: 369.5; skew-y: 369.5; scale-x: 0.848; scale-y: 0.796; }
        frame 33 { x: 17.7; y: 75.4; skew-x: 374.7; skew-y: 374.7; scale-x: 0.865; scale-y: 0.795; }
        frame 34 { x: 16.4; y: 76.5; skew-x: 370.1; skew-y: 370.1; scale-x: 0.847; scale-y: 0.794; }
        frame 35 { x: 15.3; y: 77.7; skew-x: 365.8; skew-y: 365.8; scale-x: 0.829; scale-y: -10000; }
        frame 36 { x: 14; y: 78.9; skew-x: 361.3; skew-y: 361.3; scale-x: 0.812; }
        frame 37 { x: 12.8; y: 80.1; skew-x: 356.9; skew-y: 356.9; scale-x: 0.794; }
        frame 38 { x: 12.7; y: 79; skew-x: 359; skew-y: 359; scale-x: -10000; }
        frame 39 { x: 12.6; y: 77.8; skew-x: 361; skew-y: 361; }
        frame 40 { x: 12.4; y: 76.8; skew-x: 363; skew-y: 363; scale-x: 0.793; scale-y: 0.793; }
        frame 41 { x: 12.3; y: 75.7; skew-x: 365.2; skew-y: 365.2; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 13.2; y: 77.5; skew-x: 361.8; skew-y: 361.8; }
        frame 43 { x: 14.3; y: 79.3; skew-x: 358.7; skew-y: 358.7; }
        frame 44 { x: 15.3; y: 81.2; skew-x: 355.5; skew-y: 355.5; }
        frame 45 { x: 16.5; y: 83; skew-x: 352.1; skew-y: 352.1; }
        frame 46 { x: 17.1; y: 84.8; skew-x: 350.7; skew-y: 350.7; scale-x: 0.792; scale-y: 0.792; }
        frame 47 { x: 17.8; y: 86.5; skew-x: 349.2; skew-y: 349.2; scale-x: 0.791; scale-y: 0.791; }
        frame 48 { x: 18.3; y: 88.2; skew-x: 347.5; skew-y: 347.5; scale-x: 0.79; scale-y: 0.79; }
        frame 49 { x: 19.1; y: 90; skew-x: 345.9; skew-y: 345.9; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 18; y: 89.1; skew-x: 345; skew-y: 345; scale-x: 0.789; scale-y: 0.789; }
        frame 51 { x: 17; y: 87.9; skew-x: 344.2; skew-y: 344.2; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 15.9; y: 87; skew-x: 343.2; skew-y: 343.2; }
        frame 53 { x: 14.8; y: 85.9; skew-x: 342.1; skew-y: 342.1; scale-x: 0.79; scale-y: 0.79; }
        frame 54 { x: 17.5; y: 85.5; skew-x: 338; skew-y: 338; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 20.3; y: 84.9; skew-x: 333.9; skew-y: 333.9; scale-x: 0.789; scale-y: 0.789; }
        frame 56 { x: 23.1; y: 84.6; skew-x: 329.7; skew-y: 329.7; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 26; y: 84.2; skew-x: 325.6; skew-y: 325.6; scale-x: 0.79; scale-y: 0.79; }
        frame 58 { x: 27.2; y: 84; skew-x: 325.1; skew-y: 325.1; scale-x: 0.789; scale-y: 0.789; }
        frame 59 { x: 28.4; y: 83.8; skew-x: 324.4; skew-y: 324.4; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 29.6; y: 83.6; skew-x: 323.9; skew-y: 323.9; }
        frame 61 { x: 30.8; y: 83.5; skew-x: 323.2; skew-y: 323.2; scale-x: 0.791; scale-y: 0.791; }
        frame 62 { x: 33.5; y: 82.5; skew-x: 323.7; skew-y: 323.7; scale-x: 0.789; scale-y: 0.789; }
        frame 63 { x: 36.1; y: 81.5; skew-x: 324.2; skew-y: 324.2; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 38.7; y: 80.6; skew-x: 324.7; skew-y: 324.7; scale-x: 0.788; scale-y: 0.788; }
        frame 65 { x: 41.3; y: 79.6; skew-x: 325.1; skew-y: 325.1; scale-x: 0.789; scale-y: 0.789; }
        frame 66 { x: 39.5; y: 79.8; skew-x: 327.7; skew-y: 327.7; scale-x: 0.788; scale-y: 0.788; }
        frame 67 { x: 37.9; y: 80; skew-x: 330.4; skew-y: 330.4; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 36.1; y: 80.2; skew-x: 333.2; skew-y: 333.2; }
        frame 69 { x: 34.4; y: 80.5; skew-x: 335.6; skew-y: 335.6; scale-x: 0.789; scale-y: 0.789; }
        frame 70 { x: 31.7; y: 80.6; skew-x: 338.9; skew-y: 338.9; scale-x: 0.79; scale-y: 0.79; }
        frame 71 { x: 29.1; y: -10000; skew-x: 341.9; skew-y: 341.9; scale-x: 0.791; scale-y: 0.791; }
        frame 72 { x: 26.6; y: 80.8; skew-x: 345; skew-y: 345; scale-x: 0.794; scale-y: 0.794; }
        frame 73 { x: 25.8; y: -10000; skew-x: 348.2; skew-y: 348.2; scale-x: 0.795; scale-y: 0.795; }
        frame 74 { x: 25.2; y: 81.1; skew-x: 351.2; skew-y: 351.2; scale-x: 0.797; scale-y: 0.797; }
        frame 75 { x: 24.4; y: 81.2; skew-x: 354.2; skew-y: 354.2; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: 7.2; y: 47.3; skew-x: 442.2; skew-y: 442.2; scale-x: 0.79; scale-y: 0.79; }
        frame 77 { x: 7.8; y: 50.1; skew-x: 435.9; skew-y: 435.9; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 8.4; y: 53; skew-x: 429.4; skew-y: 429.4; }
        frame 79 { x: 9; y: 56; skew-x: 422.9; skew-y: 422.9; scale-x: 0.791; scale-y: 0.791; }
        frame 80 { x: 9.4; y: 58.1; skew-x: 413.7; skew-y: 416.4; scale-x: 0.793; scale-y: -10000; }
        frame 81 { x: 9.8; y: 60.3; skew-x: 404.3; skew-y: 409.6; scale-x: 0.797; scale-y: 0.793; }
        frame 82 { x: 10.4; y: 60.9; skew-x: 405.4; skew-y: -10000; scale-x: 0.794; scale-y: 0.792; }
        frame 83 { x: 11; y: 61.4; skew-x: 406.6; skew-y: 409.7; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 11.5; y: 61.8; skew-x: 407.6; skew-y: 409.9; scale-x: 0.793; scale-y: 0.791; }
        frame 85 { x: 12.1; y: 62.4; skew-x: 408.9; skew-y: -10000; scale-x: 0.792; scale-y: -10000; }
        frame 86 { x: 12.7; y: 62.7; skew-x: 409.9; scale-x: -10000; scale-y: 0.792; }
        frame 87 { x: 11.2; y: 62.9; skew-x: 410.2; skew-y: 411.4; scale-x: 0.791; scale-y: -10000; }
        frame 88 { x: 9.8; y: 63; skew-x: 410.4; skew-y: 412.6; scale-x: -10000; scale-y: 0.793; }
        frame 89 { x: 8.3; y: 63.2; skew-x: 410.7; skew-y: 413.9; scale-y: 0.794; }
        frame 90 { x: 6.8; y: 63.4; skew-x: 410.9; skew-y: 415.4; scale-y: -10000; }
        frame 91 { x: 5.3; y: 63.6; skew-x: 411.2; skew-y: 416.7; scale-x: 0.793; scale-y: 0.796; }
        frame 92 { x: 6.3; y: 59.9; skew-x: 419.7; skew-y: 424; scale-x: 0.791; scale-y: 0.794; }
        frame 93 { x: 7.3; y: 56.4; skew-x: 428; skew-y: 431.2; scale-x: -10000; scale-y: 0.793; }
        frame 94 { x: 8.2; y: 53; skew-x: 436.4; skew-y: 438.5; scale-y: -10000; }
        frame 95 { x: 8.8; y: 49.8; skew-x: 444.7; skew-y: 445.7; scale-y: 0.792; }
        frame 96 { x: 9.4; y: 46.8; skew-x: 453; skew-y: 453; scale-y: 0.791; }
        frame 97 { x: 11.6; y: 45.7; skew-x: 460.3; skew-y: 464.1; scale-x: 0.799; scale-y: 0.79; }
        frame 98 { x: 13.3; y: 44.7; skew-x: 467.8; skew-y: 475.3; scale-x: 0.807; scale-y: 0.789; }
        frame 99 { x: 14.6; y: 43.6; skew-x: 475.3; skew-y: 486.6; scale-x: 0.816; scale-y: 0.788; }
        frame 100 { x: 15.7; y: 42.5; skew-x: 482.6; skew-y: 497.9; scale-x: 0.824; scale-y: -10000; }
        frame 101 { x: 16.6; y: 41.3; skew-x: 490.1; skew-y: 509.1; scale-x: 0.834; scale-y: 0.789; }
        frame 102 { x: 16; y: 40.5; skew-x: 480.6; skew-y: 496.9; scale-x: 0.823; scale-y: 0.786; }
        frame 103 { x: 15.1; y: 39.8; skew-x: 471; skew-y: 484.8; scale-x: 0.813; scale-y: -10000; }
        frame 104 { x: 13.7; y: 39; skew-x: 461.3; skew-y: 472.6; scale-x: 0.803; scale-y: 0.785; }
        frame 105 { x: 12; y: 38; skew-x: 451.9; skew-y: 460.5; scale-x: 0.794; scale-y: -10000; }
        frame 106 { x: 10.3; y: 39.4; skew-x: 443.7; skew-y: 452.1; scale-x: 0.802; scale-y: 0.776; }
        frame 107 { x: 8.4; y: 41; skew-x: 435.2; skew-y: 444; scale-x: 0.809; scale-y: 0.768; }
        frame 108 { x: 6.4; y: 42.7; skew-x: 426.7; skew-y: 435.7; scale-x: 0.817; scale-y: 0.76; }
        frame 109 { x: 4.3; y: 44.7; skew-x: 418.3; skew-y: 427.3; scale-x: 0.826; scale-y: 0.752; }
        frame 110 { x: 4.8; y: 45; skew-x: 422.4; skew-y: 429.9; scale-x: 0.819; scale-y: 0.758; }
        frame 111 { x: 5.3; y: 45.3; skew-x: 426.4; skew-y: 432.4; scale-x: 0.813; scale-y: 0.764; }
        frame 112 { x: 5.8; y: 45.6; skew-x: 430.4; skew-y: 434.9; scale-x: 0.808; scale-y: 0.771; }
        frame 113 { x: 6.3; y: 46; skew-x: 434.4; skew-y: 437.4; scale-x: 0.802; scale-y: 0.777; }
        frame 114 { x: 6.8; y: 46.5; skew-x: 438.2; skew-y: 439.7; scale-x: 0.796; scale-y: 0.784; }
        frame 115 { x: 7.2; y: 47.3; skew-x: 442.2; skew-y: 442.2; scale-x: 0.79; scale-y: 0.79; }
        frame 116 { x: 24.4; y: 81.2; skew-x: 354.2; skew-y: 354.2; scale-x: 0.8; scale-y: 0.8; }
        frame 117 { x: 20.8; y: 84.1; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 118 { x: 17.1; y: 87; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 13.4; y: 90; scale-x: 0.8; scale-y: 0.8; }
        frame 120 { x: 11; y: 92.7; scale-x: 0.799; scale-y: 0.799; }
        frame 121 { x: 8.7; y: 95.5; scale-x: -10000; scale-y: -10000; }
        frame 122 { x: 6.4; y: 98.2; scale-x: 0.8; scale-y: 0.8; }
        frame 123 { x: 6.3; y: 99.6; scale-x: 0.799; scale-y: 0.799; }
        frame 124 { x: 6.4; y: 101; scale-x: 0.8; scale-y: 0.8; }
        frame 125 { x: 6.3; y: 100.5; scale-x: 0.799; scale-y: 0.799; }
        frame 126 { x: -10000; y: 100; scale-x: -10000; scale-y: -10000; }
        frame 127 { y: 99.5; }
        frame 128 { y: 99; }
        frame 129 { y: 98.5; }
        frame 130 { x: 6.4; y: 98; scale-x: 0.8; scale-y: 0.8; }
        frame 131 { x: 6.3; y: 97.3; scale-x: 0.799; scale-y: 0.799; }
        frame 132 { x: -10000; y: 96.8; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 6.4; y: 96.2; scale-x: 0.8; scale-y: 0.8; }
        frame 134 { x: 7.3; y: 95.9; skew-x: 351.7; skew-y: 351.7; scale-x: 0.799; scale-y: 0.799; }
        frame 135 { x: 8.2; y: 95.6; skew-x: 349.2; skew-y: 349.2; scale-x: -10000; scale-y: -10000; }
        frame 136 { x: 9.3; y: 95.3; skew-x: 346.6; skew-y: 346.6; }
        frame 137 { x: -10000; y: 95.4; skew-x: 337.7; skew-y: 337.7; scale-x: 0.798; scale-y: 0.798; }
        frame 138 { x: 9.7; y: 95.8; skew-x: 328.9; skew-y: 328.9; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 10.3; y: 96.2; skew-x: 319.9; skew-y: 319.9; scale-x: 0.797; scale-y: 0.797; }
        frame 140 { x: 11.2; y: 96.6; skew-x: 310.9; skew-y: 310.9; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: 12.4; y: 97.1; skew-x: 302.1; skew-y: 302.1; }
        frame 142 { x: 13.8; y: 97.4; skew-x: 293.2; skew-y: 293.2; scale-x: 0.798; scale-y: 0.798; }
        frame 143 { x: 14.3; y: 97.1; skew-x: 286.3; skew-y: 286.3; scale-x: 0.796; scale-y: 0.796; }
        frame 144 { x: 14.9; y: 96.5; skew-x: 279.8; skew-y: 279.8; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 8.9; y: 92.2; skew-x: 253; skew-y: 253; scale-x: 0.795; scale-y: 0.795; }
        frame 146 { x: 4.3; y: 85.6; skew-x: 226.2; skew-y: 226.2; scale-x: 0.796; scale-y: 0.796; }
        frame 147 { x: 3; y: 98; skew-x: 238.9; skew-y: 238.9; scale-x: 0.794; scale-y: 0.794; }
        frame 148 { x: 1.9; y: 109.8; skew-x: 251.7; skew-y: 251.7; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 1.1; y: 121.2; skew-x: 264.5; skew-y: 264.5; }
        frame 150 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 151 { cel: -10000; }
    }
    Track {
        source-name: "anim_innerarm2";
        frame-count: 166;
        frame 0 { x: 26.5; y: 63; skew-x: 341.5; skew-y: 353.9; scale-x: 0.711; scale-y: 1.065; image: IMAGE_REANIM_ZOMBIE_POGO_INNERARM_LOWER; }
        frame 1 { x: 27.3; y: 61.5; skew-x: 344; skew-y: 356.4; scale-x: -10000; scale-y: 1.064; image: none; }
        frame 2 { x: 28; y: 60.2; skew-x: 346.3; skew-y: 358.6; scale-y: -10000; }
        frame 3 { x: 28.8; y: 58.9; skew-x: 348.4; skew-y: 360.7; scale-x: 0.71; }
        frame 4 { x: 29.6; y: 57.6; skew-x: 350.8; skew-y: 363.2; scale-x: -10000; }
        frame 5 { x: 30; y: 57.8; skew-x: 351.1; skew-y: 363.4; scale-y: 1.063; }
        frame 6 { x: 30.4; y: 58; skew-x: 351.3; skew-y: 363.7; scale-y: -10000; }
        frame 7 { x: 30.9; y: 58.3; skew-x: 351.6; skew-y: 364; }
        frame 8 { x: 31.3; y: 58.5; skew-x: 351.9; skew-y: 364.2; }
        frame 9 { x: 31.8; y: -10000; skew-x: 352.1; skew-y: 364.5; scale-x: 0.709; }
        frame 10 { x: 32.2; y: 58.8; skew-x: 352.6; skew-y: 364.9; scale-x: 0.71; }
        frame 11 { x: 31.7; y: 58.5; skew-x: 352.1; skew-y: 364.5; scale-x: 0.709; }
        frame 12 { x: 31.3; y: 58.4; skew-x: 351.9; skew-y: 364.2; scale-x: 0.71; }
        frame 13 { x: 30.8; y: 58.2; skew-x: 351.6; skew-y: 364; scale-x: -10000; }
        frame 14 { x: 30.3; y: 57.9; skew-x: 351.3; skew-y: 363.7; }
        frame 15 { x: 29.9; y: 57.8; skew-x: 351.1; skew-y: 363.4; }
        frame 16 { x: 29.6; y: 57.6; skew-x: 350.8; skew-y: 363.2; scale-y: 1.064; }
        frame 17 { x: 29.1; y: 59; skew-x: 348.3; skew-y: 360.7; scale-y: -10000; }
        frame 18 { x: 28.8; y: 60.4; skew-x: 346; skew-y: 358.4; }
        frame 19 { x: 28.4; y: 61.9; skew-x: 343.5; skew-y: 355.9; }
        frame 20 { x: 28.1; y: 63.3; skew-x: 341; skew-y: 353.4; }
        frame 21 { x: 27.7; y: 64.8; skew-x: 338.5; skew-y: 350.9; }
        frame 22 { x: 27.4; y: 66.3; skew-x: 336; skew-y: 348.3; scale-x: 0.711; scale-y: 1.065; }
        frame 23 { x: 27.3; y: 65.7; skew-x: 337; skew-y: 349.4; scale-x: 0.71; scale-y: 1.064; }
        frame 24 { x: 27.1; y: 65.2; skew-x: 338; skew-y: 350.4; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 27; y: 64.6; skew-x: 338.8; skew-y: 351.2; scale-x: 0.711; }
        frame 26 { x: 26.8; y: 64.1; skew-x: 339.8; skew-y: 352.1; scale-x: -10000; }
        frame 27 { x: -10000; y: 63.5; skew-x: 340.8; skew-y: 353.1; scale-y: 1.065; }
        frame 28 { x: 26.5; y: 63; skew-x: 341.5; skew-y: 353.9; scale-y: -10000; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 24.7; y: 62.3; skew-x: 342; skew-y: 354.4; scale-x: 0.71; scale-y: 1.064; }
        frame 31 { x: 23; y: 61.7; skew-x: 342.5; skew-y: 354.9; scale-x: -10000; scale-y: 1.063; }
        frame 32 { x: 21.1; y: 61; skew-x: 343; skew-y: 355.4; scale-x: 0.709; scale-y: 1.062; }
        frame 33 { x: 19.4; y: 60.5; skew-x: 343.4; skew-y: 355.8; scale-x: 0.708; scale-y: 1.061; }
        frame 34 { x: 19.2; y: -10000; skew-x: 343.9; skew-y: 358.4; scale-x: 0.716; scale-y: -10000; }
        frame 35 { x: 18.9; skew-x: 344.3; skew-y: 360.5; scale-x: 0.722; scale-y: 1.06; }
        frame 36 { x: 18.6; skew-x: 345; skew-y: 362.9; scale-x: 0.729; scale-y: -10000; }
        frame 37 { x: 18.3; y: 60.6; skew-x: 345.3; skew-y: 365.4; scale-x: 0.737; }
        frame 38 { x: -10000; y: 59.7; skew-x: 348; skew-y: 366.2; scale-x: 0.73; scale-y: 1.059; }
        frame 39 { x: 18.5; y: 58.9; skew-x: 350.7; skew-y: 367; scale-x: 0.722; scale-y: -10000; }
        frame 40 { x: -10000; y: 58; skew-x: 353.5; skew-y: 367.7; scale-x: 0.715; }
        frame 41 { x: 18.7; y: 57.1; skew-x: 356.3; skew-y: 368.7; scale-x: 0.708; scale-y: 1.06; }
        frame 42 { x: 19.1; y: 59; skew-x: 354.3; skew-y: 366.7; scale-x: 0.707; scale-y: 1.059; }
        frame 43 { x: 19.6; y: 60.5; skew-x: 352.3; skew-y: 364.7; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 20; y: 62.4; skew-x: 350.3; skew-y: 362.7; }
        frame 45 { x: 20.5; y: 64; skew-x: 348.3; skew-y: 360.7; scale-y: 1.06; }
        frame 46 { x: -10000; y: 65.4; skew-x: 346.8; skew-y: 359.1; scale-y: 1.059; }
        frame 47 { y: 66.9; skew-x: 345; skew-y: 357.4; scale-y: -10000; }
        frame 48 { x: 20.4; y: 68.5; skew-x: 343.3; skew-y: 355.7; }
        frame 49 { x: -10000; y: 69.8; skew-x: 341.6; skew-y: 353.9; }
        frame 50 { x: 19.5; y: 69; skew-x: 341.5; skew-y: -10000; }
        frame 51 { x: 18.6; y: 68.1; skew-x: -10000; scale-y: 1.058; }
        frame 52 { x: 17.5; y: 67.1; skew-x: 341.3; skew-y: 353.6; scale-y: -10000; }
        frame 53 { x: 16.5; y: 66.3; skew-x: 341.1; skew-y: 353.4; scale-y: 1.059; }
        frame 54 { x: 18.5; y: 65.6; skew-x: 339; skew-y: 351.4; scale-x: 0.706; scale-y: 1.058; }
        frame 55 { x: 20.4; y: 64.8; skew-x: 337; skew-y: 349.4; scale-x: -10000; scale-y: 1.057; }
        frame 56 { x: 22.3; y: 64.1; skew-x: 334.8; skew-y: 347.1; scale-y: -10000; }
        frame 57 { x: 24.2; y: 63.5; skew-x: 332.6; skew-y: 344.9; }
        frame 58 { x: 25.8; y: 63; skew-x: 333.3; skew-y: 345.6; scale-x: 0.705; scale-y: 1.056; }
        frame 59 { x: 27.3; y: 62.5; skew-x: 334; skew-y: 346.4; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 28.9; y: 62; skew-x: 334.5; skew-y: 346.9; }
        frame 61 { x: 30.4; y: 61.5; skew-x: 335.1; skew-y: 347.4; scale-x: 0.706; scale-y: 1.057; }
        frame 62 { x: 33.3; y: 61.3; skew-x: 334.7; skew-y: 347.1; scale-x: 0.705; scale-y: 1.056; }
        frame 63 { x: 36.1; y: 61.2; skew-x: 334.3; skew-y: 346.6; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 39; y: 61; skew-x: 333.8; skew-y: 346.1; }
        frame 65 { x: 41.6; y: 60.9; skew-x: 333.1; skew-y: 345.5; }
        frame 66 { x: 40.8; y: 61.2; skew-x: 335.8; skew-y: 348.1; scale-x: 0.704; scale-y: 1.055; }
        frame 67 { x: 39.9; y: 61.5; skew-x: 338.5; skew-y: 350.9; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 39.1; y: 61.8; skew-x: 341; skew-y: 353.4; }
        frame 69 { x: 38.2; y: 62.2; skew-x: 343.6; skew-y: 356; scale-x: 0.705; }
        frame 70 { x: 33.6; y: 62.5; skew-x: 338.8; skew-y: 351.1; scale-x: -10000; scale-y: 1.056; }
        frame 71 { x: 28.9; y: 63; skew-x: 334; skew-y: 346.4; scale-x: 0.706; scale-y: 1.057; }
        frame 72 { x: 24.2; y: 63.5; skew-x: 329; skew-y: 341.3; scale-x: 0.707; scale-y: 1.059; }
        frame 73 { x: 25; y: 63.3; skew-x: 333.3; skew-y: 345.6; scale-x: 0.708; scale-y: 1.06; }
        frame 74 { x: 25.6; y: 63; skew-x: 337.5; skew-y: 349.9; scale-x: 0.709; scale-y: 1.062; }
        frame 75 { x: 26.5; skew-x: 341.5; skew-y: 353.9; scale-x: 0.711; scale-y: 1.065; }
        frame 76 { x: 24.1; y: 50.8; skew-x: 419.5; skew-y: 449.4; scale-x: 0.799; scale-y: 1.057; }
        frame 77 { x: 25.2; y: 52; skew-x: 413.5; skew-y: 444.2; scale-x: 0.803; scale-y: -10000; }
        frame 78 { x: 26.2; y: 53.3; skew-x: 407.6; skew-y: 438.9; scale-x: 0.808; scale-y: 1.056; }
        frame 79 { x: 27.3; y: 54.6; skew-x: 401.7; skew-y: 433.6; scale-x: 0.815; scale-y: 1.057; }
        frame 80 { x: 26.3; y: 55.5; skew-x: 390.1; skew-y: 429.6; scale-x: 0.917; scale-y: 1.055; }
        frame 81 { x: 25.4; y: 56.8; skew-x: 378.4; skew-y: 425.5; scale-x: 1.02; scale-y: -10000; }
        frame 82 { x: 26; y: 56.4; skew-x: 380.8; skew-y: 423.1; scale-x: 0.967; scale-y: 1.049; }
        frame 83 { x: 26.7; y: 56.2; skew-x: 383.2; skew-y: 420.6; scale-x: 0.914; scale-y: 1.045; }
        frame 84 { x: 27.3; y: 56; skew-x: 385.5; skew-y: 418.3; scale-x: 0.86; scale-y: 1.04; }
        frame 85 { x: 28; y: 55.9; skew-x: 387.8; skew-y: 415.8; scale-x: 0.806; scale-y: 1.035; }
        frame 86 { x: 28.6; y: 55.8; skew-x: 390.2; skew-y: 413.3; scale-x: 0.753; scale-y: 1.032; }
        frame 87 { x: 27; y: 56.4; skew-x: 390.1; skew-y: 414.4; scale-x: 0.731; scale-y: 1.017; }
        frame 88 { x: 25.5; y: 57.1; skew-x: 390; skew-y: 415.6; scale-x: 0.712; scale-y: 1.004; }
        frame 89 { x: 23.9; y: 57.8; skew-x: 389.9; skew-y: 416.6; scale-x: 0.691; scale-y: 0.991; }
        frame 90 { x: 22.3; y: 58.5; skew-x: 389.8; skew-y: 417.8; scale-x: 0.671; scale-y: 0.977; }
        frame 91 { x: 20.9; y: 59.1; skew-x: -10000; skew-y: 418.9; scale-x: 0.652; scale-y: 0.966; }
        frame 92 { x: 22.1; y: 57.7; skew-x: 400.7; skew-y: 427.1; scale-x: 0.637; scale-y: 0.963; }
        frame 93 { x: 23.2; y: 56.5; skew-x: 411.8; skew-y: 435.4; scale-x: 0.623; scale-y: 0.962; }
        frame 94 { x: 24; y: 55.5; skew-x: 422.9; skew-y: 443.6; scale-x: 0.608; scale-y: 0.961; }
        frame 95 { x: 24.6; y: 54.5; skew-x: 434; skew-y: 451.5; scale-x: 0.593; scale-y: 0.959; }
        frame 96 { x: 25; y: 53.8; skew-x: 445; skew-y: 459.9; scale-x: 0.579; scale-y: 0.958; }
        frame 97 { x: 25.1; y: 53.5; skew-x: 449.3; skew-y: 465.5; scale-x: 0.611; scale-y: 0.938; }
        frame 98 { x: 25.2; y: 53; skew-x: 453.8; skew-y: 471; scale-x: 0.643; scale-y: 0.919; }
        frame 99 { x: 25; y: 52.5; skew-x: 458.1; skew-y: 476.7; scale-x: 0.675; scale-y: 0.9; }
        frame 100 { x: 24.9; y: 52; skew-x: 462.4; skew-y: 482.2; scale-x: 0.706; scale-y: 0.881; }
        frame 101 { x: 24.7; y: 51.4; skew-x: 466.7; skew-y: 487.8; scale-x: 0.739; scale-y: 0.863; }
        frame 102 { x: 24.8; y: 51.1; skew-x: 464.8; skew-y: 484.7; scale-x: 0.707; scale-y: 0.851; }
        frame 103 { x: 24.9; y: 50.9; skew-x: 462.9; skew-y: 481.7; scale-x: 0.676; scale-y: 0.841; }
        frame 104 { x: -10000; y: 50.6; skew-x: 461; skew-y: 478.7; scale-x: 0.645; scale-y: 0.83; }
        frame 105 { x: 25; y: 50.5; skew-x: 459.2; skew-y: 475.8; scale-x: 0.615; scale-y: 0.821; }
        frame 106 { x: 24.7; y: 50.1; skew-x: 452.4; skew-y: 470.7; scale-x: 0.659; scale-y: 0.835; }
        frame 107 { x: 24.3; y: 49.9; skew-x: 445.5; skew-y: 465.4; scale-x: 0.704; scale-y: 0.852; }
        frame 108 { x: 23.7; y: 49.5; skew-x: 438.7; skew-y: 460.4; scale-x: 0.749; scale-y: 0.868; }
        frame 109 { x: 22.9; y: 49.3; skew-x: 431.8; skew-y: 455.3; scale-x: 0.794; scale-y: 0.884; }
        frame 110 { x: 23.2; y: 49.6; skew-x: 429.8; skew-y: 454.2; scale-x: 0.793; scale-y: 0.913; }
        frame 111 { x: 23.4; y: 50; skew-x: 427.6; skew-y: 453.2; scale-x: 0.794; scale-y: 0.941; }
        frame 112 { x: 23.8; y: 50.1; skew-x: 425.6; skew-y: 452.2; scale-x: 0.795; scale-y: 0.97; }
        frame 113 { x: 24; y: 50.5; skew-x: 423.6; skew-y: 451.2; scale-x: -10000; scale-y: 0.999; }
        frame 114 { x: 24.4; y: 50.8; skew-x: 421.6; skew-y: 450.2; scale-x: 0.796; scale-y: 1.028; }
        frame 115 { x: 24.1; y: -10000; skew-x: 419.5; skew-y: 449.4; scale-x: 0.799; scale-y: 1.057; }
        frame 116 { x: 26.5; y: 63; skew-x: 341.5; skew-y: 353.9; scale-x: 0.711; scale-y: 1.065; }
        frame 117 { x: 22.9; y: 65.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: 19.2; y: 68.8; }
        frame 119 { x: 15.5; y: 71.7; }
        frame 120 { x: 13.2; y: 74.5; }
        frame 121 { x: 10.9; y: 77.2; }
        frame 122 { x: 8.5; y: 80; }
        frame 123 { x: -10000; y: 80.6; }
        frame 124 { y: 81.2; }
        frame 125 { x: 8.6; y: 80.9; }
        frame 126 { x: -10000; y: 80.7; }
        frame 127 { y: 80.4; }
        frame 128 { y: 80.2; }
        frame 129 { y: 79.9; }
        frame 130 { x: 8.5; y: 79.7; }
        frame 131 { x: 8.6; y: 79.1; }
        frame 132 { x: -10000; y: 78.6; }
        frame 133 { x: 8.5; y: 78; }
        frame 134 { x: 8.6; y: 77.6; skew-x: 339; skew-y: 351.4; scale-y: 1.064; }
        frame 135 { x: 8.8; y: 77.3; skew-x: 336.5; skew-y: 348.9; scale-x: 0.71; scale-y: -10000; }
        frame 136 { x: 8.9; y: 77; skew-x: 333.9; skew-y: 346.3; scale-x: 0.711; }
        frame 137 { x: 6.5; y: 78.1; skew-x: 325; skew-y: 337.4; scale-x: 0.71; scale-y: 1.063; }
        frame 138 { x: 4.2; y: 79.5; skew-x: 316.2; skew-y: 328.6; scale-x: 0.709; scale-y: 1.062; }
        frame 139 { x: 2.1; y: 81.1; skew-x: 307.2; skew-y: 319.6; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 0.5; y: 82.9; skew-x: 298.2; skew-y: 310.6; scale-y: 1.061; }
        frame 141 { x: -0.8; y: 84.8; skew-x: 289.4; skew-y: 301.7; scale-x: 0.708; scale-y: -10000; }
        frame 142 { x: -2; y: 86.8; skew-x: 280.5; skew-y: 292.8; scale-x: 0.709; scale-y: 1.062; }
        frame 143 { x: -1.8; y: 88.6; skew-x: 273.6; skew-y: 286; scale-x: 0.708; scale-y: 1.061; }
        frame 144 { x: -1.4; y: 90; skew-x: 267.1; skew-y: 279.5; scale-x: -10000; scale-y: 1.06; }
        frame 145 { x: -8.6; y: 94.9; skew-x: 249.3; skew-y: 252.7; scale-x: 0.7; scale-y: -10000; }
        frame 146 { x: -13.1; y: 98.5; skew-x: 231.5; skew-y: 225.9; scale-x: 0.693; scale-y: 1.061; }
        frame 147 { x: -14.8; y: 106.3; skew-x: 237.8; skew-y: 238.1; scale-x: 0.707; scale-y: 1.059; }
        frame 148 { x: -16.4; y: 113.8; skew-x: 244.1; skew-y: 250.3; scale-x: 0.723; scale-y: 1.058; }
        frame 149 { x: -17.3; y: 121; skew-x: 250.5; skew-y: 262.3; scale-x: 0.738; scale-y: -10000; }
        frame 150 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; cel: -1; }
        frame 151 { cel: -10000; }
        frame 155 { x: 33.6; y: 53; skew-x: 398.8; skew-y: 414.6; scale-x: 0.593; scale-y: 1.122; cel: 0; }
        frame 156 { x: 35; y: 54.8; skew-x: 404.8; skew-y: 420.7; scale-x: 0.592; scale-y: 1.12; cel: -10000; }
        frame 157 { x: 36.3; y: 56.8; skew-x: 411.1; skew-y: 426.9; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 37.4; y: 58.7; skew-x: 417.1; skew-y: 432.9; }
        frame 159 { x: 38.3; y: 60.8; skew-x: 423.1; skew-y: 439; }
        frame 160 { x: 39; y: 62.9; skew-x: 429.1; skew-y: 445; scale-y: 1.121; }
        frame 161 { x: 38.3; y: 60.8; skew-x: 423.1; skew-y: 439; scale-y: 1.12; }
        frame 162 { x: 37.2; y: 58.7; skew-x: 417.1; skew-y: 432.9; scale-y: -10000; }
        frame 163 { x: 36.1; y: 56.8; skew-x: 411.1; skew-y: 426.9; }
        frame 164 { x: 34.9; y: 54.9; skew-x: 404.8; skew-y: 420.7; }
        frame 165 { x: 33.6; y: 53; skew-x: 398.8; skew-y: 414.6; scale-x: 0.593; scale-y: 1.122; }
    }
    Track {
        source-name: "anim_innerarm1";
        frame-count: 166;
        frame 0 { x: 23.5; y: 46.5; skew-x: 354.2; skew-y: 349.3; scale-x: 0.933; scale-y: 1.003; image: IMAGE_REANIM_ZOMBIE_POGO_INNERARM_UPPER; }
        frame 1 { x: 25; y: 45; skew-x: 356.7; skew-y: 351.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 26.5; y: 43.6; skew-x: 359; skew-y: 354; scale-x: 0.932; }
        frame 3 { x: 27.8; y: 42.2; skew-x: 361; skew-y: 356.1; scale-x: -10000; scale-y: 1.002; }
        frame 4 { x: 29.3; y: 40.9; skew-x: 363.5; skew-y: 358.6; scale-y: -10000; }
        frame 5 { x: 29.8; y: 41; skew-x: 363.8; skew-y: 358.9; }
        frame 6 { x: 30.3; y: 41.3; skew-x: 364; skew-y: 359.1; scale-x: 0.931; }
        frame 7 { x: 30.9; y: 41.4; skew-x: 364.3; skew-y: 359.4; scale-x: -10000; scale-y: 1.001; }
        frame 8 { x: 31.4; y: 41.6; skew-x: 364.5; skew-y: 359.6; scale-y: -10000; }
        frame 9 { x: 31.9; y: 41.8; skew-x: 364.8; skew-y: 359.9; }
        frame 10 { x: 32.5; y: 42; skew-x: 365.3; skew-y: 360.4; }
        frame 11 { x: 32; y: 41.8; skew-x: 364.8; skew-y: 359.9; }
        frame 12 { x: 31.5; y: 41.6; skew-x: 364.5; skew-y: 359.6; }
        frame 13 { x: 31; y: 41.4; skew-x: 364.3; skew-y: 359.4; scale-y: 1.002; }
        frame 14 { x: 30.5; y: 41.3; skew-x: 364; skew-y: 359.1; scale-y: -10000; }
        frame 15 { x: 29.9; y: 41; skew-x: 363.8; skew-y: 358.9; scale-x: 0.932; }
        frame 16 { x: 29.3; y: 40.9; skew-x: 363.5; skew-y: 358.6; scale-x: -10000; }
        frame 17 { x: 28.5; y: 42.2; skew-x: 361.8; skew-y: 356.8; }
        frame 18 { x: 27.7; y: 43.5; skew-x: 360; skew-y: 355.1; }
        frame 19 { x: 27; y: 44.9; skew-x: 358.5; skew-y: 353.6; }
        frame 20 { x: 26.2; y: 46.2; skew-x: 356.7; skew-y: 351.8; }
        frame 21 { x: 25.5; y: 47.6; skew-x: 355; skew-y: 350.1; }
        frame 22 { x: 24.6; y: 49.2; skew-x: 353.2; skew-y: 348.3; scale-y: 1.003; }
        frame 23 { x: 24.4; y: 48.8; skew-x: 353.5; skew-y: 348.6; scale-y: 1.002; }
        frame 24 { x: 24.2; y: 48.3; skew-x: 353.7; skew-y: 348.8; scale-y: 1.003; }
        frame 25 { x: 24; y: 47.9; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { x: 23.9; y: 47.4; skew-x: 354; skew-y: 349.1; scale-x: 0.933; }
        frame 27 { x: 23.7; y: 47; skew-x: 354.2; skew-y: 349.3; scale-x: -10000; }
        frame 28 { x: 23.5; y: 46.5; skew-x: -10000; skew-y: -10000; }
        frame 29 { x: -10000; y: -10000; }
        frame 30 { x: 23.4; y: 45.2; skew-x: 357.7; skew-y: 352.8; scale-x: 0.932; scale-y: 1.002; }
        frame 31 { x: 23.2; y: 44.1; skew-x: 360.8; skew-y: 355.9; scale-x: 0.931; scale-y: 1.001; }
        frame 32 { x: 23.1; y: 43; skew-x: 364; skew-y: 359.1; scale-x: 0.93; scale-y: 1; }
        frame 33 { x: -10000; y: 41.6; skew-x: 367.5; skew-y: 362.6; scale-x: 0.929; scale-y: 0.999; }
        frame 34 { y: -10000; skew-x: 369.1; skew-y: 364.2; scale-x: -10000; scale-y: -10000; }
        frame 35 { y: 41.8; skew-x: 370.8; skew-y: 365.9; }
        frame 36 { x: 23.2; y: -10000; skew-x: 372.6; skew-y: 367.6; scale-x: 0.928; scale-y: 0.998; }
        frame 37 { x: 23.1; y: 42; skew-x: 374.4; skew-y: 369.5; scale-x: 0.929; scale-y: 0.999; }
        frame 38 { x: 23.4; y: 41.6; skew-x: 374.8; skew-y: 369.9; scale-x: 0.928; scale-y: 0.998; }
        frame 39 { x: 23.6; y: 41.2; skew-x: 375.3; skew-y: 370.4; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 23.8; y: 40.8; skew-x: 375.6; skew-y: 370.7; }
        frame 41 { x: 24.2; y: 40.5; skew-x: 376.2; skew-y: 371.3; scale-x: 0.929; scale-y: 0.999; }
        frame 42 { x: 23.8; y: 41.5; skew-x: 373.3; skew-y: 368.4; scale-x: 0.928; scale-y: 0.998; }
        frame 43 { x: 23.5; y: 42.8; skew-x: 370.5; skew-y: 365.6; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 23.1; y: 44; skew-x: 367.6; skew-y: 362.6; }
        frame 45 { x: 22.8; y: 45; skew-x: 364.9; skew-y: 360; }
        frame 46 { x: 21.8; y: 46.9; skew-x: 362.3; skew-y: 357.4; }
        frame 47 { x: 20.8; y: 48.5; skew-x: 360; skew-y: 355.1; }
        frame 48 { x: 19.8; y: 50.4; skew-x: 357.5; skew-y: 352.5; }
        frame 49 { x: 18.8; y: 52.3; skew-x: 354.8; skew-y: 349.9; }
        frame 50 { x: 17.8; y: 51; skew-x: 354.7; skew-y: 349.8; }
        frame 51 { x: 16.8; y: 49.8; skew-x: -10000; skew-y: -10000; }
        frame 52 { x: 15.7; y: 48.7; skew-x: 354.5; skew-y: 349.6; scale-x: 0.927; scale-y: 0.997; }
        frame 53 { x: 14.7; y: 47.5; skew-x: 354.3; skew-y: 349.4; scale-x: 0.928; scale-y: 0.998; }
        frame 54 { x: 15.9; y: 47.3; skew-x: 352.2; skew-y: 347.3; scale-x: 0.927; scale-y: 0.997; }
        frame 55 { x: 17.3; y: 46.9; skew-x: 350.2; skew-y: 345.3; scale-x: -10000; scale-y: 0.996; }
        frame 56 { x: 18.6; y: 46.6; skew-x: 348; skew-y: 343.1; scale-x: 0.926; scale-y: -10000; }
        frame 57 { x: 19.8; y: 46.5; skew-x: 345.8; skew-y: 340.9; scale-x: 0.927; scale-y: 0.997; }
        frame 58 { x: 21.3; y: 45.5; skew-x: 347.4; skew-y: 342.5; scale-x: 0.926; scale-y: 0.996; }
        frame 59 { x: 22.6; y: 44.7; skew-x: 348.7; skew-y: 343.8; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 24.2; y: 43.8; skew-x: 350.2; skew-y: 345.3; }
        frame 61 { x: 25.6; y: 42.9; skew-x: 351.6; skew-y: 346.7; }
        frame 62 { x: 25.4; y: 42.6; skew-x: 353; skew-y: 348; }
        frame 63 { x: 25.2; y: 42.5; skew-x: 354.2; skew-y: 349.3; }
        frame 64 { x: 25; y: 42.4; skew-x: 355.2; skew-y: 350.3; }
        frame 65 { x: 24.7; y: 42.2; skew-x: 356.4; skew-y: 351.5; }
        frame 66 { x: 24.8; y: 41.8; skew-x: 359.2; skew-y: 354.3; }
        frame 67 { x: -10000; y: 41.5; skew-x: 361.5; skew-y: 356.6; scale-y: 0.995; }
        frame 68 { x: 24.9; y: 41; skew-x: 364.3; skew-y: 359.4; scale-x: 0.925; scale-y: -10000; }
        frame 69 { x: 25; y: 40.8; skew-x: 366.9; skew-y: 362; scale-x: 0.926; }
        frame 70 { x: 24.6; y: 41.6; skew-x: 364.8; skew-y: 359.9; scale-x: 0.927; scale-y: 0.996; }
        frame 71 { x: 24.4; y: 42.6; skew-x: 362.5; skew-y: 357.6; scale-x: 0.928; scale-y: 0.998; }
        frame 72 { x: 24.1; y: 43.5; skew-x: 360.5; skew-y: 355.6; scale-x: 0.929; scale-y: 0.999; }
        frame 73 { x: 23.8; y: 44.4; skew-x: 358.5; skew-y: 353.6; scale-x: 0.93; scale-y: 1.001; }
        frame 74 { x: 23.6; y: 45.5; skew-x: 356.5; skew-y: 351.5; scale-x: 0.932; scale-y: 1.002; }
        frame 75 { x: 23.5; y: 46.5; skew-x: 354.2; skew-y: 349.3; scale-x: 0.933; scale-y: 1.003; }
        frame 76 { x: 38.1; y: 35.5; skew-x: 434.3; skew-y: 412; scale-x: 0.845; scale-y: 1.077; }
        frame 77 { x: 37.3; y: 35.6; skew-x: 427.5; skew-y: 406.5; scale-x: 0.864; scale-y: 1.063; }
        frame 78 { x: 36.3; y: 35.9; skew-x: 420.7; skew-y: 400.8; scale-x: 0.885; scale-y: 1.052; }
        frame 79 { x: 35.3; y: 36.3; skew-x: 413.9; skew-y: 395.2; scale-x: 0.906; scale-y: 1.04; }
        frame 80 { x: 34.2; y: 36.9; skew-x: 406.9; skew-y: 389.5; scale-x: 0.927; scale-y: 1.028; }
        frame 81 { x: 32.9; y: 37.9; skew-x: 400.2; skew-y: 384; scale-x: 0.949; scale-y: 1.018; }
        frame 82 { x: 32.8; y: 38.5; skew-x: 397.9; skew-y: -10000; scale-x: 0.944; scale-y: 1.013; }
        frame 83 { x: 32.7; y: 39; skew-x: 395.8; skew-y: 384.2; scale-x: 0.94; scale-y: 1.01; }
        frame 84 { x: 32.5; y: 39.5; skew-x: 393.6; skew-y: -10000; scale-x: 0.937; scale-y: 1.006; }
        frame 85 { x: -10000; y: 40; skew-x: 391.6; scale-x: 0.933; scale-y: 1.003; }
        frame 86 { y: 40.5; skew-x: 389.3; skew-y: 384.4; scale-x: 0.931; scale-y: 1.001; }
        frame 87 { x: 31.6; y: 41; skew-x: 386.3; skew-y: 384.5; scale-x: 0.905; scale-y: 0.995; }
        frame 88 { x: 30.9; y: 41.7; skew-x: 383.1; skew-y: 384.7; scale-x: 0.88; scale-y: 0.99; }
        frame 89 { x: 30.1; y: 42.3; skew-x: 380; skew-y: 384.8; scale-x: 0.855; scale-y: 0.986; }
        frame 90 { x: 29.4; y: 42.9; skew-x: 377; skew-y: 385.2; scale-x: 0.831; scale-y: 0.982; }
        frame 91 { x: 28.7; y: 43.4; skew-x: 373.9; skew-y: 385.4; scale-x: 0.807; scale-y: 0.98; }
        frame 92 { x: 30; y: 41.9; skew-x: 385.3; skew-y: 389.6; scale-x: 0.809; scale-y: 0.987; }
        frame 93 { x: 31.6; y: 40.6; skew-x: 396.8; skew-y: 393.8; scale-x: 0.813; scale-y: 0.996; }
        frame 94 { x: 33.2; y: 39.5; skew-x: 408.2; skew-y: 398.1; scale-x: 0.817; scale-y: 1.005; }
        frame 95 { x: 35; y: 38.8; skew-x: 419.7; skew-y: 402.5; scale-x: 0.821; scale-y: 1.014; }
        frame 96 { x: 37.1; y: 38.1; skew-x: 431; skew-y: 406.9; scale-x: 0.826; scale-y: 1.025; }
        frame 97 { x: 37.8; y: 38.4; skew-x: 433.5; skew-y: 409.4; scale-x: 0.825; scale-y: 1.023; }
        frame 98 { x: 38.4; y: 38.6; skew-x: 435.9; skew-y: 411.7; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 39; y: 38.9; skew-x: 438.4; skew-y: 414.2; }
        frame 100 { x: 39.5; y: 39.1; skew-x: 440.7; skew-y: 416.6; }
        frame 101 { x: 40; y: 39.4; skew-x: 443.1; skew-y: 418.9; scale-x: 0.826; scale-y: 1.024; }
        frame 102 { x: 40.4; y: 40.3; skew-x: 442.5; skew-y: 422.3; scale-x: 0.817; scale-y: 1.012; }
        frame 103 { x: 40.6; y: 41.4; skew-x: 441.7; skew-y: 425.8; scale-x: 0.809; scale-y: 1.002; }
        frame 104 { x: 40.9; y: 42.3; skew-x: 441; skew-y: 429; scale-x: 0.801; scale-y: 0.991; }
        frame 105 { x: 41.1; y: 43.1; skew-x: 440.2; skew-y: 432.4; scale-x: 0.793; scale-y: 0.982; }
        frame 106 { x: 39.4; y: 41.1; skew-x: 431.4; skew-y: 424.3; scale-x: 0.787; scale-y: 0.984; }
        frame 107 { x: 37.3; y: 39.5; skew-x: 422.4; skew-y: 416.2; scale-x: 0.782; scale-y: 0.988; }
        frame 108 { x: 35.1; y: 38.1; skew-x: 413.4; skew-y: 408.2; scale-x: 0.777; scale-y: 0.991; }
        frame 109 { x: 32.9; y: 37; skew-x: 404.6; skew-y: 400; scale-x: 0.774; scale-y: 0.997; }
        frame 110 { x: 33.7; y: 36.7; skew-x: 409.6; skew-y: 402; scale-x: 0.784; scale-y: 1.008; }
        frame 111 { x: 34.5; y: 36.4; skew-x: 414.4; skew-y: 404; scale-x: 0.796; scale-y: 1.021; }
        frame 112 { x: 35.4; y: 36.1; skew-x: 419.4; skew-y: 406.1; scale-x: 0.808; scale-y: 1.035; }
        frame 113 { x: 36.2; y: 35.9; skew-x: 424.4; skew-y: 408.1; scale-x: 0.82; scale-y: 1.048; }
        frame 114 { x: 37.2; y: 35.5; skew-x: 429.4; skew-y: 409.9; scale-x: 0.832; scale-y: 1.062; }
        frame 115 { x: 38.1; y: -10000; skew-x: 434.3; skew-y: 412; scale-x: 0.845; scale-y: 1.077; }
        frame 116 { x: 26.8; y: 45.5; skew-x: 361.2; skew-y: 356.3; scale-x: 0.932; scale-y: 1.003; }
        frame 117 { x: 23.1; y: 48.4; skew-x: 361.1; skew-y: 356.1; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: 19.4; y: 51.3; skew-x: -10000; skew-y: -10000; }
        frame 119 { x: 15.8; y: 54.2; skew-x: 361.2; skew-y: 356.3; }
        frame 120 { x: 13.4; y: 57; skew-x: 361.1; skew-y: 356.1; }
        frame 121 { x: 11.1; y: 59.7; skew-x: -10000; skew-y: -10000; }
        frame 122 { x: 8.8; y: 62.5; skew-x: 361.2; skew-y: 356.3; }
        frame 123 { x: -10000; y: -10000; skew-x: 361.1; skew-y: 356.1; }
        frame 124 { skew-x: 361.2; skew-y: 356.3; }
        frame 125 { skew-x: 361.1; skew-y: 356.1; }
        frame 126 { skew-x: -10000; skew-y: -10000; }
        frame 130 { skew-x: 361.2; skew-y: 356.3; }
        frame 131 { y: 61.2; skew-x: 361.1; skew-y: 356.1; }
        frame 132 { y: 60; skew-x: -10000; skew-y: -10000; }
        frame 133 { y: 58.7; skew-x: 361.2; skew-y: 356.3; }
        frame 134 { x: 8.6; y: 58.9; skew-x: 360; skew-y: 355.1; scale-y: 1.002; }
        frame 135 { x: 8.5; y: 59; skew-x: 358.7; skew-y: 353.8; scale-y: -10000; }
        frame 136 { x: 8.4; y: 59.2; skew-x: 357.2; skew-y: 352.3; }
        frame 137 { x: 3.5; y: 61.5; skew-x: 348.4; skew-y: 343.5; scale-x: 0.931; scale-y: 1.001; }
        frame 138 { x: -1; y: 64.3; skew-x: 339.4; skew-y: 334.5; scale-x: 0.93; scale-y: -10000; }
        frame 139 { x: -5.4; y: 67.2; skew-x: 330.4; skew-y: 325.5; scale-x: -10000; scale-y: 1; }
        frame 140 { x: -9.4; y: 70.3; skew-x: 321.6; skew-y: 316.7; scale-x: 0.929; scale-y: 0.999; }
        frame 141 { x: -13.2; y: 73.6; skew-x: 312.6; skew-y: 307.7; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: -16.4; y: 76.7; skew-x: 303.8; skew-y: 298.9; scale-x: 0.93; scale-y: 1; }
        frame 143 { x: -19; y: 81.1; skew-x: 297; skew-y: 292.1; scale-x: 0.928; scale-y: 0.998; }
        frame 144 { x: -21.4; y: 85.4; skew-x: 290.3; skew-y: 285.4; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: -26.9; y: 95.2; skew-x: 270.8; skew-y: 265.9; }
        frame 146 { x: -30.8; y: 104; skew-x: 251.4; skew-y: 246.4; }
        frame 147 { x: -32.2; y: 110.6; skew-x: 256.9; skew-y: 252; scale-y: 0.997; }
        frame 148 { x: -33.5; y: 117; skew-x: 262.2; skew-y: 257.3; scale-x: 0.927; scale-y: -10000; }
        frame 149 { x: -34.7; y: 123.3; skew-x: 267.6; skew-y: 262.7; scale-x: 0.928; scale-y: 0.998; }
        frame 150 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 151 { cel: -10000; }
        frame 155 { x: 29; y: 39.7; skew-x: 363.5; skew-y: 358; scale-x: 0.929; scale-y: 0.905; cel: 0; }
        frame 156 { x: 29.4; y: 41.5; skew-x: -10000; skew-y: 358.1; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 157 { x: 29.8; y: 43.1; skew-x: 363.8; skew-y: 358.3; }
        frame 158 { x: 30.2; y: 44.9; skew-x: -10000; skew-y: 358.4; }
        frame 159 { x: 30.6; y: 46.6; skew-x: 364; skew-y: 358.6; }
        frame 160 { x: 31; y: 48.3; skew-x: 364.3; skew-y: 358.8; }
        frame 161 { x: 30.6; y: 46.6; skew-x: 364; skew-y: 358.6; }
        frame 162 { x: 30.2; y: 45; skew-x: 363.8; skew-y: 358.4; }
        frame 163 { x: 29.8; y: 43.3; skew-x: -10000; skew-y: 358.3; }
        frame 164 { x: 29.4; y: 41.5; skew-x: 363.5; skew-y: 358.1; }
        frame 165 { x: 29; y: 39.7; skew-x: -10000; skew-y: 358; }
    }
    Track {
        source-name: "Zombie_innerleg_lower";
        frame-count: 166;
        frame 0 { x: 31.4; y: 91.3; scale-x: 0.8; scale-y: 0.773; image: IMAGE_REANIM_ZOMBIE_POGO_INNERLEG_LOWER; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 17 { x: 31.9; y: 91.1; skew-x: 1.6; skew-y: 1.6; }
        frame 18 { x: 32.4; y: 90.9; skew-x: 3.3; skew-y: 3.3; }
        frame 19 { x: 33; y: 90.8; skew-x: 5; skew-y: 5; }
        frame 20 { x: 33.6; y: 90.6; skew-x: 6.8; skew-y: 6.8; scale-x: 0.799; }
        frame 21 { x: 34.1; y: 90.5; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; }
        frame 22 { x: 34.8; y: 90.3; skew-x: 10.3; skew-y: 10.3; scale-x: 0.8; }
        frame 23 { x: 34.2; y: -10000; skew-x: 8.5; skew-y: 8.5; scale-x: 0.799; }
        frame 24 { x: 33.6; y: 90.6; skew-x: 6.8; skew-y: 6.8; scale-x: -10000; }
        frame 25 { x: 33; y: 90.7; skew-x: 5; skew-y: 5; scale-x: 0.8; }
        frame 26 { x: 32.4; y: 90.8; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; }
        frame 27 { x: 31.9; y: 91.1; skew-x: 1.6; skew-y: 1.6; }
        frame 28 { x: 31.4; y: 91.3; skew-x: 0; skew-y: 0; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 30.8; y: 92.3; skew-x: -6.2; skew-y: -6.2; scale-x: 0.799; }
        frame 31 { x: 30.4; y: 93.7; skew-x: -12.7; skew-y: -12.7; scale-x: -10000; scale-y: 0.772; }
        frame 32 { x: 30.1; y: 95; skew-x: -19; skew-y: -19; scale-x: 0.798; scale-y: -10000; }
        frame 33 { x: 30.2; y: 96.7; skew-x: -25.5; skew-y: -25.5; scale-x: 0.799; }
        frame 34 { x: 30.6; y: 97.7; skew-x: -29.7; skew-y: -29.7; scale-x: 0.797; scale-y: 0.771; }
        frame 35 { x: 31.1; y: 98.7; skew-x: -34; skew-y: -34; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 31.7; y: 99.8; skew-x: -38.3; skew-y: -38.3; scale-y: 0.77; }
        frame 37 { x: 32.3; y: 100.8; skew-x: -42.6; skew-y: -42.6; scale-x: 0.798; scale-y: 0.771; }
        frame 38 { x: 33; y: 101; skew-x: -43; skew-y: -43; scale-x: 0.796; scale-y: 0.77; }
        frame 39 { x: 33.7; y: -10000; skew-x: -43.3; skew-y: -43.3; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 34.4; y: 101.1; skew-x: -43.5; skew-y: -43.5; scale-y: 0.769; }
        frame 41 { x: 35; y: 101.2; skew-x: -43.8; skew-y: -43.8; scale-x: 0.797; scale-y: 0.771; }
        frame 42 { x: 36.6; y: 102.3; skew-x: -47; skew-y: -47; scale-x: 0.796; scale-y: 0.769; }
        frame 43 { x: 38.3; y: 103.6; skew-x: -50.3; skew-y: -50.3; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 40; y: 104.8; skew-x: -53.5; skew-y: -53.5; }
        frame 45 { x: 41.7; y: 106.1; skew-x: -56.6; skew-y: -56.6; scale-x: 0.797; scale-y: 0.77; }
        frame 46 { x: 41.5; y: 106.2; skew-x: -57.8; skew-y: -57.8; scale-x: 0.796; scale-y: 0.769; }
        frame 47 { x: -10000; y: 106.4; skew-x: -59; skew-y: -59; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 41.3; y: 106.5; skew-x: -60.1; skew-y: -60.1; }
        frame 49 { x: 41; y: 106.6; skew-x: -61.2; skew-y: -61.2; scale-x: 0.797; scale-y: 0.77; }
        frame 50 { x: 39.3; y: 106.5; skew-x: -61.3; skew-y: -61.3; scale-x: 0.796; scale-y: 0.769; }
        frame 51 { x: 37.5; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 35.9; }
        frame 53 { x: 34.1; y: 106.6; skew-x: -61.2; skew-y: -61.2; scale-x: 0.797; scale-y: 0.77; }
        frame 54 { x: 34; y: 106.8; skew-x: -61.3; skew-y: -61.3; scale-x: 0.796; scale-y: 0.769; }
        frame 55 { y: 107.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 33.9; y: 107.3; }
        frame 57 { x: 33.7; y: 107.6; skew-x: -61.2; skew-y: -61.2; scale-x: 0.797; scale-y: 0.77; }
        frame 58 { x: 33.1; y: 106.4; skew-x: -57.8; skew-y: -57.8; scale-x: 0.792; scale-y: 0.773; }
        frame 59 { x: 32.6; y: 105.3; skew-x: -54.6; skew-y: -54.6; scale-x: 0.789; scale-y: 0.777; }
        frame 60 { x: 32.1; y: 104.2; skew-x: -51.3; skew-y: -51.3; scale-x: 0.786; scale-y: 0.78; }
        frame 61 { x: 31.6; y: 103; skew-x: -47.9; skew-y: -47.9; scale-x: 0.784; scale-y: 0.785; }
        frame 62 { x: 30.6; y: 101.9; skew-x: -47.3; skew-y: -44.5; scale-x: 0.782; scale-y: 0.788; }
        frame 63 { x: 29.5; y: 100.8; skew-x: -46.5; skew-y: -41; scale-x: 0.781; scale-y: 0.791; }
        frame 64 { x: 28.5; y: 99.9; skew-x: -45.8; skew-y: -37.7; scale-x: -10000; scale-y: 0.795; }
        frame 65 { x: 27.5; y: 98.9; skew-x: -45.1; skew-y: -34.4; scale-x: 0.782; scale-y: 0.799; }
        frame 66 { x: 26.7; y: 99; skew-x: -42; skew-y: -33.3; scale-x: 0.777; scale-y: 0.798; }
        frame 67 { x: 25.8; skew-x: -38.8; skew-y: -32.2; scale-x: 0.774; scale-y: -10000; }
        frame 68 { x: 25.1; y: 99.1; skew-x: -35.5; skew-y: -31.2; scale-x: 0.77; }
        frame 69 { x: 24.2; y: -10000; skew-x: -32.5; skew-y: -30.1; scale-x: 0.768; scale-y: 0.799; }
        frame 70 { x: 25.3; y: 97.7; skew-x: -27; skew-y: -25; scale-x: 0.772; scale-y: 0.793; }
        frame 71 { x: 26.2; y: 96.1; skew-x: -21.5; skew-y: -20; scale-x: 0.778; scale-y: 0.789; }
        frame 72 { x: 27.3; y: 94.8; skew-x: -16.2; skew-y: -14.9; scale-x: 0.783; scale-y: 0.785; }
        frame 73 { x: 28.6; y: 93.6; skew-x: -10.7; skew-y: -9.9; scale-x: 0.789; scale-y: 0.781; }
        frame 74 { x: 29.9; y: 92.2; skew-x: -5.2; skew-y: -4.9; scale-x: 0.794; scale-y: 0.777; }
        frame 75 { x: 31.4; y: 91.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.773; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 31.8; y: 91.2; skew-x: 0.3; skew-y: 0.8; }
        frame 83 { x: 32; y: 91.1; skew-x: 0.8; skew-y: 1.5; }
        frame 84 { x: 32.4; y: 91; skew-x: 1.3; skew-y: 2.3; }
        frame 85 { x: 32.8; y: 90.9; skew-x: 1.5; skew-y: 3; }
        frame 86 { x: 33.1; y: 90.8; skew-x: 2; skew-y: 3.8; }
        frame 87 { x: 33.5; y: -10000; skew-x: 2.5; skew-y: 4.6; }
        frame 88 { x: 33.9; skew-x: 2.8; skew-y: 5.3; scale-x: 0.801; }
        frame 89 { x: 34.3; y: 90.6; skew-x: 3.4; skew-y: 6.3; scale-x: -10000; }
        frame 90 { x: 33.8; y: 90.8; skew-x: 2.8; skew-y: 5.1; scale-x: 0.8; }
        frame 91 { x: 33.3; y: -10000; skew-x: 2.3; skew-y: 4; scale-x: -10000; }
        frame 92 { x: 32.8; y: 90.9; skew-x: 1.5; skew-y: 3; }
        frame 93 { x: 32.4; y: 91.1; skew-x: 1; skew-y: 2; }
        frame 94 { x: 31.9; y: -10000; skew-x: 0.5; skew-y: 1; }
        frame 95 { x: 31.4; y: 91.3; skew-x: 0; skew-y: 0; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 102 { x: 31.8; y: 91.2; skew-x: 0.3; skew-y: 0.8; }
        frame 103 { x: 32; y: 91.1; skew-x: 0.8; skew-y: 1.5; }
        frame 104 { x: 32.4; y: 91; skew-x: 1.3; skew-y: 2.3; }
        frame 105 { x: 32.8; y: 90.9; skew-x: 1.5; skew-y: 3; }
        frame 106 { x: 33.1; y: 90.8; skew-x: 2; skew-y: 3.8; }
        frame 107 { x: 33.5; y: -10000; skew-x: 2.5; skew-y: 4.6; }
        frame 108 { x: 33.9; skew-x: 2.8; skew-y: 5.3; scale-x: 0.801; }
        frame 109 { x: 34.3; y: 90.6; skew-x: 3.4; skew-y: 6.3; scale-x: -10000; }
        frame 110 { x: 33.6; y: 90.8; skew-x: 2.5; skew-y: 4.8; scale-x: 0.8; }
        frame 111 { x: 33.1; y: 91; skew-x: 1.6; skew-y: 3.5; scale-x: -10000; }
        frame 112 { x: 32.6; y: 91.1; skew-x: 0.8; skew-y: 2.3; }
        frame 113 { x: 32.1; y: 91.2; skew-x: 0; skew-y: 1; }
        frame 114 { x: 31.6; y: 91.3; skew-x: -0.5; skew-y: -0; }
        frame 115 { x: 31.1; y: 91.6; skew-x: -1.4; skew-y: -1.4; }
        frame 116 { x: 31.4; y: 91.3; skew-x: 0; skew-y: 0; }
        frame 117 { x: 25.2; y: 101; skew-x: -34.2; skew-y: -31.5; scale-x: 0.769; scale-y: 0.771; }
        frame 118 { x: 24.4; y: 111.2; skew-x: -68.6; skew-y: -63.1; scale-x: 0.741; scale-y: -10000; }
        frame 119 { x: 23.4; y: 115.8; skew-x: -89.6; skew-y: -80.6; scale-x: 0.705; scale-y: 0.773; }
        frame 120 { x: 23.2; y: 122; skew-x: -100.2; skew-y: -94.2; scale-x: 0.736; scale-y: 0.772; }
        frame 121 { x: 23.9; y: 127.6; skew-x: -111; skew-y: -108; scale-x: 0.766; scale-y: 0.771; }
        frame 122 { x: 25.4; y: 132.5; skew-x: -121.8; skew-y: -121.8; scale-x: 0.798; scale-y: 0.772; }
        frame 123 { x: 27.3; y: 132.3; skew-x: -126; skew-y: -123.7; scale-x: 0.797; scale-y: -10000; }
        frame 124 { x: 29.2; y: 132; skew-x: -130.1; skew-y: -125.5; scale-x: 0.798; scale-y: 0.773; }
        frame 125 { x: 28.5; y: 132.1; skew-x: -128.2; skew-y: -126; scale-x: 0.796; scale-y: 0.771; }
        frame 126 { x: 27.9; y: 132.3; skew-x: -126.4; skew-y: -126.4; scale-x: 0.797; scale-y: -10000; }
        frame 127 { x: 28.2; y: 132.4; skew-x: -127.3; skew-y: -127.3; scale-x: 0.796; scale-y: 0.77; }
        frame 128 { x: 28.5; y: 132.5; skew-x: -128.3; skew-y: -128.3; scale-x: -10000; scale-y: -10000; }
        frame 129 { x: 28.7; y: 132.4; skew-x: -129.2; skew-y: -129.2; }
        frame 130 { x: 29; y: -10000; skew-x: -130.2; skew-y: -130.2; scale-x: 0.798; scale-y: 0.771; }
        frame 131 { x: -10000; y: 132.3; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.77; }
        frame 132 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 133 { y: 132.4; scale-x: 0.798; scale-y: 0.771; }
        frame 134 { x: 26.6; y: 131; skew-x: -125; skew-y: -125; scale-x: 0.796; scale-y: 0.77; }
        frame 135 { x: 24.1; y: 129.4; skew-x: -119.7; skew-y: -119.7; scale-x: -10000; scale-y: 0.769; }
        frame 136 { x: 21.9; y: 127.8; skew-x: -114.7; skew-y: -114.7; scale-x: 0.797; scale-y: 0.77; }
        frame 137 { x: 22; y: 127.2; skew-x: -115.2; skew-y: -115.2; scale-x: 0.796; scale-y: 0.769; }
        frame 138 { x: 22.2; y: 126.6; skew-x: -116; skew-y: -116; scale-x: -10000; scale-y: 0.77; }
        frame 139 { x: 22.3; y: 126.2; skew-x: -116.9; skew-y: -116.9; scale-x: 0.798; scale-y: 0.771; }
        frame 140 { x: 26.5; y: 126.8; skew-x: -127.8; skew-y: -125.3; scale-x: 0.783; scale-y: 0.757; }
        frame 141 { x: 30.6; y: 127.1; skew-x: -138.8; skew-y: -134; scale-x: 0.77; scale-y: 0.744; }
        frame 142 { x: 34.5; y: 126.8; skew-x: -149.7; skew-y: -142.4; scale-x: 0.758; scale-y: 0.732; }
        frame 143 { x: 36.3; y: 125.7; skew-x: -157.6; skew-y: -150.3; scale-x: 0.757; scale-y: 0.731; }
        frame 144 { x: 37.8; y: 124.4; skew-x: -165.3; skew-y: -158; scale-x: -10000; scale-y: 0.732; }
        frame 145 { x: -10000; y: 116.1; skew-x: -191; skew-y: -183.7; scale-x: 0.756; scale-y: 0.73; }
        frame 146 { x: 35.1; y: 105.8; skew-x: -217; skew-y: -209.7; scale-x: 0.755; scale-y: 0.729; }
        frame 147 { x: 34.5; y: 104.8; skew-x: -225.3; skew-y: -220.3; scale-x: 0.725; scale-y: 0.719; }
        frame 148 { x: 33.5; y: 103.6; skew-x: -233.5; skew-y: -231; scale-x: 0.697; scale-y: 0.71; }
        frame 149 { x: 32.1; y: 102.5; skew-x: -241.7; skew-y: -241.6; scale-x: 0.669; scale-y: 0.701; }
        frame 150 { x: 32.6; y: 102.4; skew-x: -235.1; skew-y: -231.5; scale-x: 0.711; scale-y: 0.714; }
        frame 151 { x: 32.7; y: 102.3; skew-x: -228.5; skew-y: -221.3; scale-x: 0.755; scale-y: 0.729; }
        frame 152 { x: 32.6; y: 100.8; skew-x: -234.1; skew-y: -226.8; scale-x: 0.753; scale-y: 0.728; }
        frame 153 { x: 32.4; y: 99.3; skew-x: -239.6; skew-y: -232.3; scale-x: -10000; scale-y: 0.727; }
        frame 154 { x: 32.1; y: 97.5; skew-x: -245.1; skew-y: -237.9; scale-x: 0.754; scale-y: 0.728; }
        frame 155 { x: 32.7; y: 79.5; skew-x: -346.4; skew-y: -346.4; scale-x: 0.72; scale-y: 0.797; image: IMAGE_REANIM_ZOMBIE_POGO_OUTERLEG_LOWER; }
        frame 156 { x: 32.8; y: 79.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.796; image: none; }
        frame 157 { x: 33; y: 80.2; skew-x: -346.3; skew-y: -346.3; scale-y: -10000; }
        frame 158 { x: 33.2; y: 80.4; skew-x: -346.1; skew-y: -346.1; }
        frame 159 { x: 33.4; y: 80.7; skew-x: -10000; skew-y: -10000; }
        frame 160 { x: 33.5; y: 81; skew-x: -345.8; skew-y: -345.8; scale-y: 0.797; }
        frame 161 { x: 33.3; y: 80.8; skew-x: -346.1; skew-y: -346.1; scale-y: 0.796; }
        frame 162 { x: 33.1; y: 80.5; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 163 { x: 32.9; y: 80.1; skew-x: -346.3; skew-y: -346.3; }
        frame 164 { x: 32.8; y: 79.8; skew-x: -346.4; skew-y: -346.4; }
        frame 165 { x: 32.7; y: 79.5; skew-x: -10000; skew-y: -10000; scale-y: 0.797; }
    }
    Track {
        source-name: "Zombie_innerleg_upper";
        frame-count: 166;
        frame 0 { x: 42.8; y: 76.6; skew-x: 353.5; skew-y: 353.5; scale-x: 0.8; scale-y: 0.84; image: IMAGE_REANIM_ZOMBIE_POGO_INNERLEG_UPPER; }
        frame 1 { x: 42.6; y: 76.3; skew-x: 354.8; skew-y: 353.2; scale-x: 0.798; scale-y: 0.842; image: none; }
        frame 2 { x: -10000; y: 76.2; skew-x: 356.2; skew-y: 353; scale-x: 0.797; scale-y: 0.845; }
        frame 3 { x: 42.5; y: 75.9; skew-x: 357.5; skew-y: 352.8; scale-x: 0.796; scale-y: 0.847; }
        frame 4 { x: 42.4; y: 75.7; skew-x: 359; skew-y: 352.5; scale-x: 0.794; scale-y: 0.85; }
        frame 5 { x: 42.5; y: 75.8; skew-x: 358.5; skew-y: 353.3; scale-x: 0.795; scale-y: 0.848; }
        frame 6 { x: -10000; y: -10000; skew-x: 358; skew-y: 353.8; scale-x: 0.796; scale-y: 0.847; }
        frame 7 { skew-x: 357.7; skew-y: 354.3; scale-x: -10000; scale-y: 0.845; }
        frame 8 { x: 42.6; y: 75.9; skew-x: 357.2; skew-y: 355; scale-x: 0.798; scale-y: 0.843; }
        frame 9 { x: 42.7; y: 76; skew-x: 356.8; skew-y: 355.8; scale-x: 0.799; scale-y: 0.841; }
        frame 10 { x: 42.8; skew-x: 356.5; skew-y: 356.5; scale-x: 0.8; scale-y: 0.84; }
        frame 11 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.839; }
        frame 12 { scale-x: -10000; scale-y: -10000; }
        frame 16 { scale-x: 0.8; scale-y: 0.84; }
        frame 17 { y: 76.3; skew-x: 354.5; skew-y: 355; scale-x: -10000; scale-y: 0.867; }
        frame 18 { y: 76.6; skew-x: 352.8; skew-y: 353.6; scale-y: 0.894; }
        frame 19 { y: 76.9; skew-x: 351; skew-y: 352.2; scale-y: 0.921; }
        frame 20 { x: 42.6; y: 77.3; skew-x: 349.1; skew-y: 350.7; scale-y: 0.948; }
        frame 21 { x: 42.5; y: 77.6; skew-x: 347.1; skew-y: 349.1; scale-y: 0.975; }
        frame 22 { x: 42.4; y: 78; skew-x: 345.2; skew-y: 347.5; scale-x: 0.801; scale-y: 1.002; }
        frame 23 { x: 42.5; y: 77.8; skew-x: 346.6; skew-y: 348.6; scale-x: 0.8; scale-y: 0.975; }
        frame 24 { x: 42.6; y: 77.5; skew-x: 348.1; skew-y: 349.7; scale-x: -10000; scale-y: 0.948; }
        frame 25 { x: 42.7; y: 77.3; skew-x: 349.3; skew-y: 350.6; scale-y: 0.921; }
        frame 26 { x: -10000; y: 77.1; skew-x: 350.8; skew-y: 351.6; scale-y: 0.894; }
        frame 27 { x: 42.8; y: 76.8; skew-x: 352.2; skew-y: 352.6; scale-y: 0.867; }
        frame 28 { x: -10000; y: 76.6; skew-x: 353.5; skew-y: 353.5; scale-y: 0.84; }
        frame 29 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 30 { x: 40.5; y: 76.3; skew-x: 342.6; skew-y: 347.8; scale-x: 0.82; scale-y: 0.871; }
        frame 31 { x: 38.4; y: 76.2; skew-x: 331.5; skew-y: 342; scale-x: 0.841; scale-y: 0.901; }
        frame 32 { x: 36.5; y: 76.1; skew-x: 320.5; skew-y: 336.3; scale-x: 0.863; scale-y: 0.932; }
        frame 33 { x: 34.5; y: -10000; skew-x: 309.7; skew-y: 330.5; scale-x: 0.886; scale-y: 0.963; }
        frame 34 { x: 34.1; y: 76.5; skew-x: 313.5; skew-y: 329.2; scale-x: 0.862; scale-y: 0.931; }
        frame 35 { x: 33.9; y: 76.7; skew-x: 317.5; skew-y: 328; scale-x: 0.84; scale-y: 0.9; }
        frame 36 { x: 33.5; y: 77.1; skew-x: 321.3; skew-y: 326.6; scale-x: 0.818; scale-y: 0.868; }
        frame 37 { x: 33.4; y: 77.3; skew-x: 325.3; skew-y: 325.3; scale-x: 0.798; scale-y: 0.838; }
        frame 38 { x: 33; y: 76.8; skew-x: 325.9; skew-y: 324.6; scale-x: 0.796; scale-y: 0.872; }
        frame 39 { x: 32.7; y: 76.2; skew-x: 326.6; skew-y: 323.7; scale-x: 0.795; scale-y: 0.908; }
        frame 40 { x: 32.3; y: 75.7; skew-x: 327.1; skew-y: 322.8; scale-x: 0.794; scale-y: 0.943; }
        frame 41 { x: 31.7; y: 75.2; skew-x: 327.6; skew-y: 321.9; scale-x: 0.793; scale-y: 0.98; }
        frame 42 { x: 33; y: 76.5; skew-x: 327.4; skew-y: 321.1; scale-x: 0.792; scale-y: 0.946; }
        frame 43 { x: 34.2; y: 77.8; skew-x: 327.2; skew-y: 320.2; scale-x: -10000; scale-y: 0.914; }
        frame 44 { x: 35.4; y: 79; skew-x: 326.9; skew-y: 319.4; scale-y: 0.882; }
        frame 45 { x: 36.5; y: 80.3; skew-x: 326.7; skew-y: 318.5; scale-x: 0.793; scale-y: 0.851; }
        frame 46 { x: 35.8; y: 80.4; skew-x: 325.2; skew-y: 317; scale-x: 0.791; scale-y: 0.85; }
        frame 47 { x: 35.1; y: 80.6; skew-x: 323.7; skew-y: 315.5; scale-x: -10000; scale-y: 0.849; }
        frame 48 { x: 34.3; y: 80.8; skew-x: 322.2; skew-y: 314; scale-y: -10000; }
        frame 49 { x: 33.5; y: -10000; skew-x: 320.7; skew-y: 312.5; scale-x: 0.792; scale-y: 0.851; }
        frame 50 { x: 32.1; y: 80.3; skew-x: 322; skew-y: 315.1; scale-x: -10000; scale-y: 0.901; }
        frame 51 { x: 30.9; y: 79.7; skew-x: 323.1; skew-y: 317.4; scale-y: 0.953; }
        frame 52 { x: 29.6; y: 79.1; skew-x: 324.2; skew-y: 319.9; scale-x: 0.794; scale-y: 1.005; }
        frame 53 { x: 28.4; y: 78.6; skew-x: 325.3; skew-y: 322.2; scale-x: 0.796; scale-y: 1.058; }
        frame 54 { x: 28.9; y: 77.8; skew-x: 327.6; skew-y: 324.4; scale-x: 0.794; scale-y: 1.075; }
        frame 55 { x: 29.5; y: 76.8; skew-x: 330; skew-y: 326.5; scale-x: 0.793; scale-y: 1.093; }
        frame 56 { x: 29.9; y: 76; skew-x: 332.3; skew-y: 328.7; scale-x: 0.792; scale-y: 1.111; }
        frame 57 { x: 30.4; y: 75.2; skew-x: 334.5; skew-y: 330.7; scale-x: -10000; scale-y: 1.131; }
        frame 58 { x: 32; y: 74.9; skew-x: 339.1; skew-y: 334.4; scale-x: 0.791; scale-y: 1.08; }
        frame 59 { x: 33.5; y: 74.7; skew-x: 343.6; skew-y: 337.9; scale-x: 0.79; scale-y: 1.031; }
        frame 60 { x: 35; y: -10000; skew-x: 348.2; skew-y: 341.2; scale-x: 0.789; scale-y: 0.982; }
        frame 61 { x: 36.5; y: 74.4; skew-x: 352.6; skew-y: 344.7; scale-x: 0.788; scale-y: 0.933; }
        frame 62 { x: 34.8; y: 74.3; skew-x: 351; skew-y: 343; scale-x: -10000; scale-y: 0.911; }
        frame 63 { x: 33.4; y: -10000; skew-x: 349.6; skew-y: 341.4; scale-y: 0.89; }
        frame 64 { x: 31.8; skew-x: 348; skew-y: 339.9; scale-x: 0.789; scale-y: 0.868; }
        frame 65 { x: 30.1; skew-x: 346.3; skew-y: 338.1; scale-x: -10000; scale-y: 0.847; }
        frame 66 { x: 30.5; y: 74.1; skew-x: 348.7; skew-y: 340.5; scale-y: 0.846; }
        frame 67 { x: 30.8; y: 74; skew-x: 350.9; skew-y: 342.8; scale-y: 0.847; }
        frame 68 { x: 31.3; y: -10000; skew-x: 353.2; skew-y: 345; scale-y: -10000; }
        frame 69 { x: 31.7; skew-x: 355.3; skew-y: 347.1; }
        frame 70 { x: 33.5; y: 74.5; skew-x: 354.8; skew-y: 348.3; scale-x: 0.791; scale-y: 0.845; }
        frame 71 { x: 35.3; y: 74.8; skew-x: 354.5; skew-y: 349.3; scale-x: 0.793; scale-y: 0.844; }
        frame 72 { x: 37.1; y: 75.3; skew-x: 354.3; skew-y: 350.3; scale-x: 0.795; scale-y: 0.843; }
        frame 73 { x: 38.9; y: 75.6; skew-x: 354; skew-y: 351.5; scale-x: 0.796; scale-y: 0.842; }
        frame 74 { x: 40.8; y: 76; skew-x: 353.7; skew-y: 352.5; scale-x: 0.798; scale-y: 0.841; }
        frame 75 { x: 42.8; y: 76.6; skew-x: 353.5; skew-y: 353.5; scale-x: 0.8; scale-y: 0.84; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 42.5; y: 77.1; skew-x: 352.2; skew-y: 352.2; }
        frame 83 { x: 42.1; y: 77.5; skew-x: 351; skew-y: 351; scale-x: 0.799; scale-y: 0.839; }
        frame 84 { x: 41.9; y: 78; skew-x: 349.7; skew-y: 349.7; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 41.7; y: 78.5; skew-x: 348.4; skew-y: 348.4; }
        frame 86 { x: 41.4; y: 79; skew-x: 347.2; skew-y: 347.2; }
        frame 87 { x: 41.1; y: 79.5; skew-x: 345.9; skew-y: 345.9; }
        frame 88 { x: 40.8; y: 80; skew-x: 344.5; skew-y: 344.5; }
        frame 89 { x: 40.6; y: 80.5; skew-x: 343.2; skew-y: 343.2; }
        frame 90 { x: 40.9; y: 79.8; skew-x: 345; skew-y: 345; }
        frame 91 { x: 41.3; y: 79.2; skew-x: 346.7; skew-y: 346.7; }
        frame 92 { x: 41.7; y: 78.5; skew-x: 348.4; skew-y: 348.4; }
        frame 93 { x: 42; y: 77.8; skew-x: 350.2; skew-y: 350.2; }
        frame 94 { x: 42.4; y: 77.2; skew-x: 351.9; skew-y: 351.9; scale-x: 0.8; scale-y: 0.84; }
        frame 95 { x: 42.8; y: 76.6; skew-x: 353.5; skew-y: 353.5; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: -10000; y: 76.5; skew-x: 353.4; skew-y: -10000; scale-y: 0.844; }
        frame 97 { y: 76.3; skew-x: -10000; scale-y: 0.849; }
        frame 98 { y: 76.2; skew-y: 353.6; scale-y: 0.854; }
        frame 99 { y: 76.1; skew-x: 353.3; skew-y: -10000; scale-y: 0.858; }
        frame 100 { y: 75.9; skew-x: -10000; skew-y: 353.7; scale-y: 0.863; }
        frame 101 { y: 75.8; skew-y: -10000; scale-y: 0.868; }
        frame 102 { x: 42.4; y: 75.9; skew-x: 352; skew-y: 351.7; scale-x: 0.799; scale-y: 0.873; }
        frame 103 { x: 42; y: 76; skew-x: 350.7; skew-y: 349.7; scale-x: 0.797; scale-y: 0.879; }
        frame 104 { x: 41.6; y: 76.2; skew-x: 349.3; skew-y: 347.8; scale-x: 0.796; scale-y: 0.884; }
        frame 105 { x: 41.2; y: 76.3; skew-x: 348; skew-y: 345.8; scale-x: 0.795; scale-y: 0.89; }
        frame 106 { x: 40.8; y: 76.5; skew-x: 346.7; skew-y: 343.8; scale-x: 0.793; scale-y: 0.896; }
        frame 107 { x: 40.5; y: 76.7; skew-x: 345.4; skew-y: 341.7; scale-x: 0.792; scale-y: 0.902; }
        frame 108 { x: 40.1; y: 76.9; skew-x: 344; skew-y: 339.7; scale-x: 0.791; scale-y: 0.907; }
        frame 109 { x: 39.8; y: 77.1; skew-x: 342.6; skew-y: 337.7; scale-x: 0.79; scale-y: 0.913; }
        frame 110 { x: 40.3; y: 76.8; skew-x: 344.5; skew-y: 340.4; scale-x: 0.791; scale-y: 0.9; }
        frame 111 { x: 40.8; y: -10000; skew-x: 346.3; skew-y: 343.1; scale-x: 0.793; scale-y: 0.888; }
        frame 112 { x: 41.3; y: 76.6; skew-x: 348.2; skew-y: 345.7; scale-x: 0.795; scale-y: 0.876; }
        frame 113 { x: 41.9; y: -10000; skew-x: 350; skew-y: 348.4; scale-x: 0.796; scale-y: 0.864; }
        frame 114 { x: 42.3; y: 76.5; skew-x: 351.8; skew-y: 351; scale-x: 0.798; scale-y: 0.852; }
        frame 115 { x: 42.8; y: 76.6; skew-x: 353.5; skew-y: 353.5; scale-x: 0.8; scale-y: 0.84; }
        frame 116 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 39; y: 78.2; skew-x: 367.7; skew-y: 367.7; scale-x: 0.798; scale-y: 0.838; }
        frame 118 { x: 35.6; y: 80.8; skew-x: 382; skew-y: 382; scale-x: 0.797; scale-y: 0.836; }
        frame 119 { x: 32.3; y: 83.9; skew-x: 396.4; skew-y: 396.4; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 27.5; y: 88.2; skew-x: 385.8; skew-y: 386.3; scale-x: 0.796; scale-y: 0.834; }
        frame 121 { x: 22.7; y: 93.1; skew-x: 375.3; skew-y: 376.3; scale-x: 0.797; scale-y: 0.833; }
        frame 122 { x: 17.8; y: 98.2; skew-x: 364.8; skew-y: 366.3; scale-x: 0.798; scale-y: -10000; }
        frame 123 { x: 19.9; y: 97; skew-x: 373.2; skew-y: 374.1; scale-x: 0.795; scale-y: 0.875; }
        frame 124 { x: 22.5; y: 96; skew-x: 381.6; skew-y: 382.1; scale-x: 0.794; scale-y: 0.918; }
        frame 125 { x: 23.1; y: 95.6; skew-x: 382.8; skew-y: 384; scale-x: -10000; scale-y: 0.931; }
        frame 126 { x: 23.6; y: 95.5; skew-x: 384.2; skew-y: 385.9; scale-x: 0.796; scale-y: 0.947; }
        frame 127 { x: 23; y: 95.7; skew-x: 383.2; skew-y: 384.4; scale-x: 0.795; scale-y: 0.918; }
        frame 128 { x: 22.4; y: 95.8; skew-x: 382.4; skew-y: 383.2; scale-x: -10000; scale-y: 0.891; }
        frame 129 { x: 21.8; y: 96.1; skew-x: 381.4; skew-y: 381.8; scale-y: 0.863; }
        frame 130 { x: 21.2; y: 96.4; skew-x: 380.6; skew-y: 380.6; scale-x: 0.796; scale-y: 0.836; }
        frame 131 { x: 20.7; y: 96.2; skew-x: 379.3; skew-y: 379.3; scale-x: 0.795; scale-y: 0.835; }
        frame 132 { x: 20.2; y: 95.8; skew-x: 377.8; skew-y: 377.8; scale-x: 0.794; scale-y: 0.834; }
        frame 133 { x: 19.6; y: 95.4; skew-x: 376.5; skew-y: 376.5; scale-x: 0.795; scale-y: 0.835; }
        frame 134 { x: 18.5; y: 94.8; skew-x: 373.8; skew-y: 373.8; scale-x: 0.794; scale-y: 0.834; }
        frame 135 { x: 17.4; y: 94.1; skew-x: 371; skew-y: 371; scale-x: -10000; scale-y: -10000; }
        frame 136 { x: 16.4; y: 93.5; skew-x: 368.5; skew-y: 368.5; scale-x: 0.795; scale-y: 0.835; }
        frame 137 { x: 13.1; y: 94.2; skew-x: 357.2; skew-y: 357.2; scale-x: 0.794; scale-y: 0.834; }
        frame 138 { x: 10; y: 95.2; skew-x: 346.2; skew-y: 346.2; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 7.3; y: 96.5; skew-x: 334.7; skew-y: 334.7; }
        frame 140 { x: 5.7; y: 100.2; skew-x: 324.7; skew-y: 325.5; scale-x: 0.793; scale-y: 0.886; }
        frame 141 { x: 4.1; y: 104.2; skew-x: 314.5; skew-y: 316.1; scale-x: -10000; scale-y: 0.939; }
        frame 142 { x: 3; y: 108.5; skew-x: 304.4; skew-y: 306.7; scale-x: 0.794; scale-y: 0.994; }
        frame 143 { x: 3.1; y: 112.5; skew-x: 300.2; skew-y: 301.4; scale-x: 0.792; scale-y: 0.911; }
        frame 144 { x: 3.3; y: 116.3; skew-x: 296.3; skew-y: 296.3; scale-x: -10000; scale-y: 0.831; }
        frame 145 { x: -0; y: 119.8; skew-x: 278.3; skew-y: 280.6; scale-y: 0.984; }
        frame 146 { x: -2.4; y: 123.7; skew-x: 260.5; skew-y: 264.7; scale-x: 0.794; scale-y: 1.139; }
        frame 147 { x: -0.2; y: 124.3; skew-x: 261; skew-y: -10000; scale-x: 0.757; scale-y: 1.035; }
        frame 148 { x: 2; y: 124.9; skew-x: 261.4; skew-y: 264.4; scale-x: 0.719; scale-y: 0.931; }
        frame 149 { x: 4.3; y: 125.5; skew-x: 261.9; skew-y: 263.9; scale-x: 0.682; scale-y: 0.827; }
        frame 150 { x: -10000; y: 124.7; skew-x: 262.5; skew-y: 263.6; scale-x: 0.736; scale-y: 0.828; }
        frame 151 { y: 124.2; skew-x: 263; skew-y: 263; scale-x: 0.789; scale-y: 0.829; }
        frame 152 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 155 { x: 43.5; y: 65; skew-x: 370.8; skew-y: 395.8; scale-x: 0.92; scale-y: 0.944; }
        frame 156 { x: 44.4; y: 65.7; skew-x: 372.2; skew-y: 397.1; scale-x: 0.916; scale-y: 0.945; }
        frame 157 { x: 45.1; y: 66.3; skew-x: 373.9; skew-y: 398.4; scale-x: 0.912; scale-y: 0.948; }
        frame 158 { x: 46; y: 66.9; skew-x: 375.4; skew-y: 399.9; scale-x: 0.908; scale-y: 0.951; }
        frame 159 { x: 46.6; y: 67.5; skew-x: 377; skew-y: 401.2; scale-x: 0.904; scale-y: 0.955; }
        frame 160 { x: 47.6; y: 68; skew-x: 378.7; skew-y: 402.5; scale-x: 0.901; scale-y: 0.96; }
        frame 161 { x: 46.7; y: 67.3; skew-x: 377; skew-y: 401.2; scale-x: 0.904; scale-y: 0.955; }
        frame 162 { x: 45.9; y: 66.8; skew-x: 375.4; skew-y: 399.9; scale-x: 0.908; scale-y: 0.951; }
        frame 163 { x: 45; y: 66.2; skew-x: 373.9; skew-y: 398.4; scale-x: 0.912; scale-y: 0.948; }
        frame 164 { x: 44.3; y: 65.6; skew-x: 372.2; skew-y: 397.1; scale-x: 0.916; scale-y: 0.945; }
        frame 165 { x: 43.5; y: 65; skew-x: 370.8; skew-y: 395.8; scale-x: 0.92; scale-y: 0.944; }
    }
    Track {
        source-name: "Zombie_innerleg_foot";
        frame-count: 166;
        frame 0 { x: 38.8; y: 105.6; skew-x: 6.5; scale-x: 0.805; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POGO_INNERLEG_FOOT; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 30 { x: 40.9; }
        frame 31 { x: 43; }
        frame 32 { x: 45.1; }
        frame 33 { x: 47.2; }
        frame 34 { x: 47.9; y: 105.8; skew-x: 2.2; skew-y: -4.2; scale-y: 0.799; }
        frame 35 { x: 48.6; y: -10000; skew-x: -2.1; skew-y: -8.7; scale-x: 0.804; scale-y: -10000; }
        frame 36 { x: 49.4; y: 106.1; skew-x: -6.6; skew-y: -13.2; scale-x: -10000; scale-y: 0.798; }
        frame 37 { x: 50.3; y: 106.2; skew-x: -11.1; skew-y: -17.7; scale-y: 0.799; }
        frame 38 { x: 50.7; y: 106.5; skew-x: -14.9; skew-y: -21.5; scale-x: 0.803; scale-y: 0.798; }
        frame 39 { x: 51.1; y: 106.8; skew-x: -18.7; skew-y: -25.2; scale-x: -10000; scale-y: 0.797; }
        frame 40 { x: 51.6; y: 107.3; skew-x: -22.6; skew-y: -29.2; scale-x: 0.802; scale-y: -10000; }
        frame 41 { x: 52.2; y: 107.6; skew-x: -26.4; skew-y: -33; scale-x: 0.803; scale-y: 0.798; }
        frame 42 { x: 54; y: 108.3; skew-x: -32; skew-y: -38.5; scale-x: 0.802; scale-y: 0.797; }
        frame 43 { x: 55.8; y: 109.1; skew-x: -37.7; skew-y: -44.2; scale-x: -10000; scale-y: 0.796; }
        frame 44 { x: 57.7; y: 109.8; skew-x: -43.2; skew-y: -49.8; scale-x: 0.801; scale-y: -10000; }
        frame 45 { x: 59.9; y: 110.8; skew-x: -48.8; skew-y: -55.3; scale-x: 0.802; scale-y: 0.797; }
        frame 46 { x: 59.6; y: 111; skew-x: -51.5; skew-y: -58.1; scale-x: 0.801; scale-y: 0.796; }
        frame 47 { x: 59.5; y: 111.2; skew-x: -54.3; skew-y: -60.8; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 59.3; y: 111.3; skew-x: -57.1; skew-y: -63.6; }
        frame 49 { x: 59; y: 111.6; skew-x: -59.8; skew-y: -66.4; scale-x: 0.802; scale-y: 0.797; }
        frame 50 { x: 57.9; y: 112.2; skew-x: -64.5; skew-y: -71.1; scale-x: 0.801; scale-y: 0.796; }
        frame 51 { x: 56.8; y: 112.7; skew-x: -69.1; skew-y: -75.6; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 55.6; y: 113.1; skew-x: -73.6; skew-y: -80.1; }
        frame 53 { x: 54.6; y: 113.6; skew-x: -78.1; skew-y: -84.7; }
        frame 54 { x: 54.3; y: 114.2; skew-x: -80.5; skew-y: -87.1; }
        frame 55 { x: 53.9; y: 114.8; skew-x: -82.8; skew-y: -89.3; }
        frame 56 { x: 53.5; y: 115.4; skew-x: -84.9; skew-y: -91.4; }
        frame 57 { x: 53; y: 116.1; skew-x: -87.1; skew-y: -93.7; scale-y: 0.795; }
        frame 58 { x: 51.9; y: 115.6; skew-x: -82.6; skew-y: -89.1; scale-x: 0.8; scale-y: -10000; }
        frame 59 { x: 50.9; y: 115.2; skew-x: -78.1; skew-y: -84.6; scale-x: -10000; }
        frame 60 { x: 49.8; y: 114.7; skew-x: -73.5; skew-y: -80.1; scale-x: 0.799; scale-y: 0.794; }
        frame 61 { x: 48.6; y: 114; skew-x: -68.8; skew-y: -75.4; scale-x: 0.8; scale-y: -10000; }
        frame 62 { x: 46.1; y: 112.7; skew-x: -60.3; skew-y: -66.8; scale-x: 0.798; scale-y: 0.793; }
        frame 63 { x: 43.9; y: 111.5; skew-x: -51.5; skew-y: -58.1; scale-x: -10000; scale-y: 0.792; }
        frame 64 { x: 41.8; y: 110.1; skew-x: -43; skew-y: -49.5; scale-x: 0.797; scale-y: -10000; }
        frame 65 { x: 39.9; y: 108.7; skew-x: -34.2; skew-y: -40.8; scale-x: 0.798; scale-y: 0.793; }
        frame 66 { x: 39; y: 107.6; skew-x: -22.2; skew-y: -28.7; scale-x: 0.796; scale-y: 0.791; }
        frame 67 { x: 38.5; y: 106.7; skew-x: -10.2; skew-y: -16.7; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 38.4; y: 105.9; skew-x: 1.8; skew-y: -4.7; }
        frame 69 { x: 38.5; y: 105.6; skew-x: 13.6; skew-y: 7.1; }
        frame 70 { x: -10000; y: 105.7; skew-x: 12.3; skew-y: 5.8; scale-x: 0.797; scale-y: 0.792; }
        frame 71 { y: -10000; skew-x: 11.1; skew-y: 4.6; scale-x: 0.799; scale-y: 0.794; }
        frame 72 { y: 105.6; skew-x: 10.1; skew-y: 3.5; scale-x: 0.8; scale-y: 0.795; }
        frame 73 { x: 38.6; y: 105.7; skew-x: 8.8; skew-y: 2.3; scale-x: 0.802; scale-y: 0.797; }
        frame 74 { x: -10000; y: 105.6; skew-x: 7.6; skew-y: 1; scale-x: 0.804; scale-y: 0.798; }
        frame 75 { x: 38.8; y: -10000; skew-x: 6.5; skew-y: 0; scale-x: 0.805; scale-y: 0.8; }
        frame 76 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 37; y: 105.7; skew-x: -2.6; skew-y: -9.2; scale-x: 0.804; scale-y: 0.799; }
        frame 118 { x: 35.4; y: 105.8; skew-x: -11.9; skew-y: -18.5; scale-x: -10000; scale-y: 0.798; }
        frame 119 { x: 34; y: 106.2; skew-x: -21.4; skew-y: -28; scale-y: 0.799; }
        frame 120 { x: 31.9; y: 108.3; skew-x: -33.2; skew-y: -39.8; scale-x: 0.803; scale-y: 0.797; }
        frame 121 { x: 30.1; y: 110.3; skew-x: -45; skew-y: -51.5; scale-x: 0.802; scale-y: -10000; }
        frame 122 { x: 28.8; y: 112.3; skew-x: -56.8; skew-y: -63.3; scale-x: 0.803; scale-y: 0.798; }
        frame 123 { x: 28.5; y: -10000; skew-x: -56.3; skew-y: -62.8; scale-x: -10000; scale-y: 0.797; }
        frame 124 { x: 28.2; y: 112.5; skew-x: -55.8; skew-y: -62.3; scale-x: 0.804; scale-y: 0.799; }
        frame 125 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.803; scale-y: 0.798; }
        frame 126 { scale-x: 0.804; scale-y: 0.799; }
        frame 127 { scale-x: 0.803; scale-y: 0.798; }
        frame 128 { scale-x: -10000; scale-y: -10000; }
        frame 130 { scale-x: 0.804; scale-y: 0.799; }
        frame 131 { scale-x: 0.803; scale-y: 0.798; }
        frame 132 { scale-x: -10000; scale-y: -10000; }
        frame 133 { scale-x: 0.804; scale-y: 0.799; }
        frame 134 { scale-x: 0.803; scale-y: 0.798; }
        frame 135 { scale-x: -10000; scale-y: -10000; }
        frame 136 { scale-x: 0.804; scale-y: 0.799; }
        frame 137 { x: 29; y: 113.1; skew-x: -59.8; skew-y: -66.4; scale-x: 0.803; scale-y: 0.798; }
        frame 138 { x: 29.7; y: 113.8; skew-x: -63.8; skew-y: -70.4; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 30.6; y: 114.3; skew-x: -67.8; skew-y: -74.4; scale-x: 0.804; }
        frame 140 { x: 30.8; y: 113.3; skew-x: -66; skew-y: -72.6; scale-x: 0.803; scale-y: 0.797; }
        frame 141 { x: 30.9; y: 112.3; skew-x: -64; skew-y: -70.6; scale-x: 0.802; scale-y: -10000; }
        frame 142 { x: 31.2; y: 111.2; skew-x: -62.1; skew-y: -68.6; scale-x: 0.803; scale-y: 0.798; }
        frame 143 { x: 32.3; y: 112.4; skew-x: -83.6; skew-y: -90.2; scale-x: 0.802; scale-y: 0.797; }
        frame 144 { x: 34.2; y: 112.6; skew-x: -105.2; skew-y: -111.8; scale-x: 0.801; scale-y: 0.796; }
        frame 145 { x: 29; y: 107.9; skew-x: -131; skew-y: -137.6; scale-x: 0.799; scale-y: 0.793; }
        frame 146 { x: 23.7; y: 101.1; skew-x: -156.9; skew-y: -163.5; scale-x: -10000; scale-y: 0.794; }
        frame 147 { x: 22.8; y: 101.4; skew-x: -177.4; skew-y: -186.7; scale-x: 0.781; scale-y: 0.778; }
        frame 148 { x: 20.7; y: 100.8; skew-x: -197.9; skew-y: -210.2; scale-x: 0.764; scale-y: 0.761; }
        frame 149 { x: 17.6; y: 100; skew-x: -218.7; skew-y: -233.6; scale-x: 0.747; scale-y: 0.747; }
        frame 150 { x: 19; y: 98.3; skew-x: -209.2; skew-y: -220; scale-x: 0.771; scale-y: 0.768; }
        frame 151 { x: 20.1; y: 96.3; skew-x: -199.8; skew-y: -206.4; scale-x: 0.797; scale-y: 0.792; }
        frame 152 { x: 19.4; y: 95.7; skew-x: -207.5; skew-y: -214; scale-x: 0.796; scale-y: 0.79; }
        frame 153 { x: 18.7; y: 95.1; skew-x: -215.2; skew-y: -221.8; scale-x: 0.795; scale-y: -10000; }
        frame 154 { x: 17.6; y: 94.6; skew-x: -222.9; skew-y: -229.4; scale-x: 0.796; scale-y: 0.791; }
        frame 155 { x: 12; y: 103.1; skew-x: -375.7; skew-y: -375.7; scale-x: 0.798; scale-y: 0.798; image: IMAGE_REANIM_ZOMBIE_POGO_OUTERLEG_FOOT; }
        frame 156 { x: 12.4; y: 102.5; skew-x: -373.4; skew-y: -373.4; scale-x: 0.797; scale-y: 0.797; image: none; }
        frame 157 { x: 12.6; y: 102; skew-x: -371.2; skew-y: -371.2; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 13; y: 101.5; skew-x: -369.2; skew-y: -369.2; }
        frame 159 { x: 13.4; y: 100.8; skew-x: -366.9; skew-y: -366.9; scale-x: 0.798; scale-y: 0.798; }
        frame 160 { x: 13.7; y: 100.3; skew-x: -364.9; skew-y: -364.9; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 13.4; y: 100.8; skew-x: -366.9; skew-y: -366.9; }
        frame 162 { x: 13; y: 101.4; skew-x: -369.2; skew-y: -369.2; scale-x: 0.797; scale-y: 0.797; }
        frame 163 { x: 12.6; y: 101.9; skew-x: -371.2; skew-y: -371.2; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 12.3; y: 102.6; skew-x: -373.4; skew-y: -373.4; }
        frame 165 { x: 12; y: 103.1; skew-x: -375.7; skew-y: -375.7; scale-x: 0.798; scale-y: 0.798; }
    }
    Track {
        source-name: "Zombie_pogo_stick3";
        frame-count: 166;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 155 { x: 31.9; y: 122.5; skew-x: -5.1; skew-y: -5.1; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_ZOMBIE_POGO_STICK3; }
        frame 156 { x: -10000; y: 120.7; skew-x: -4.9; skew-y: -4.9; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 157 { x: 31.7; y: 118.9; skew-x: -10000; skew-y: -10000; }
        frame 158 { x: 31.6; y: 117.2; skew-x: -5; skew-y: -5; }
        frame 159 { x: 31.7; y: 119; skew-x: -4.9; skew-y: -4.9; }
        frame 160 { x: 31.8; y: 120.8; skew-x: -10000; skew-y: -10000; }
        frame 161 { x: 31.9; y: 122.5; skew-x: -5.1; skew-y: -5.1; }
        frame 162 { x: -10000; y: -10000; skew-x: -5; skew-y: -5; }
        frame 163 { skew-x: -10000; skew-y: -10000; }
        frame 165 { skew-x: -5.1; skew-y: -5.1; }
    }
    Track {
        source-name: "Zombie_pogo_stick2";
        frame-count: 166;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 155 { x: 16.7; y: 91.2; skew-x: -4.9; skew-y: -4.9; scale-x: 0.8; scale-y: 0.882; cel: 0; image: IMAGE_REANIM_ZOMBIE_POGO_STICK2; }
        frame 156 { x: 16.8; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 157 { x: 17; y: 91.1; }
        frame 158 { x: 17.1; y: -10000; }
        frame 159 { x: 17.3; y: 91; }
        frame 160 { x: 17.4; y: 90.9; }
        frame 161 { x: 17.3; y: 91; }
        frame 162 { x: 17.1; }
        frame 163 { x: 17; y: 91.1; }
        frame 164 { x: 16.8; y: -10000; }
        frame 165 { x: 16.7; y: 91.2; }
    }
    Track {
        source-name: "Zombie_outerleg_lower";
        frame-count: 166;
        frame 0 { x: 58.5; y: 91.8; scale-x: 0.723; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POGO_OUTERLEG_LOWER; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 5 { x: 57.5; y: 92.1; skew-x: -1.4; skew-y: -2.2; }
        frame 6 { x: 56.6; y: 92.4; skew-x: -3.2; skew-y: -4.7; }
        frame 7 { x: 55.8; y: 92.7; skew-x: -4.7; skew-y: -6.9; scale-x: 0.724; scale-y: 0.799; }
        frame 8 { x: 54.9; y: 93.1; skew-x: -6.4; skew-y: -9.4; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 53.9; y: 93.4; skew-x: -7.9; skew-y: -11.7; }
        frame 10 { x: 53.1; y: 94; skew-x: -9.7; skew-y: -14.2; scale-x: 0.725; }
        frame 11 { x: 54; y: 93.5; skew-x: -7.9; skew-y: -11.7; scale-x: 0.724; }
        frame 12 { x: 54.9; y: 93.2; skew-x: -6.4; skew-y: -9.4; scale-x: -10000; }
        frame 13 { x: 55.8; y: 92.8; skew-x: -4.7; skew-y: -6.9; }
        frame 14 { x: 56.6; y: 92.6; skew-x: -3.2; skew-y: -4.7; scale-x: 0.723; scale-y: 0.8; }
        frame 15 { x: 57.6; y: 92.2; skew-x: -1.4; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 58.5; y: 91.8; skew-x: 0; skew-y: 0; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 55.8; y: 92.2; skew-x: -3.2; skew-y: -3.2; scale-x: 0.722; scale-y: 0.799; }
        frame 31 { x: 52.9; y: 92.6; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: 0.798; }
        frame 32 { x: 50.3; y: 93; skew-x: -10.2; skew-y: -10.2; scale-x: 0.721; scale-y: -10000; }
        frame 33 { x: 47.5; y: 93.5; skew-x: -13.7; skew-y: -13.7; scale-x: -10000; scale-y: 0.797; }
        frame 34 { x: 46.4; y: 93.2; skew-x: -12.2; skew-y: -12.2; scale-x: 0.72; scale-y: -10000; }
        frame 35 { x: 45.1; y: 93; skew-x: -10.5; skew-y: -10.5; scale-x: -10000; }
        frame 36 { x: 44; y: 92.7; skew-x: -9; skew-y: -9; }
        frame 37 { x: 42.8; y: 92.4; skew-x: -7.6; skew-y: -7.6; scale-x: 0.721; }
        frame 38 { x: 41.8; y: 91.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.72; scale-y: 0.823; }
        frame 39 { x: 40.9; y: 89.8; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: 0.849; }
        frame 40 { x: 40.2; y: 88.6; skew-x: 6.3; skew-y: 6.3; scale-y: 0.874; }
        frame 41 { x: 39.6; y: 87.5; skew-x: 11; skew-y: 11; scale-y: 0.9; }
        frame 42 { x: 40.7; y: 87.8; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 43 { x: 41.8; y: 88.1; }
        frame 44 { x: 42.8; y: 88.4; }
        frame 45 { x: 43.6; y: 88.7; }
        frame 46 { x: 43.3; y: 89; skew-x: 10.3; skew-y: 10.3; scale-x: 0.719; }
        frame 47 { x: 43; y: 89.3; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: 0.899; }
        frame 48 { x: 42.5; y: 89.7; skew-x: 9.1; skew-y: 9.1; scale-y: -10000; }
        frame 49 { x: 42.4; y: 89.9; skew-x: 8.6; skew-y: 8.6; }
        frame 50 { x: 42.3; y: 89.8; skew-x: 8.5; skew-y: 8.5; }
        frame 51 { x: 42.1; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 52 { x: 42; }
        frame 53 { x: 41.9; y: 89.9; skew-x: 8.6; skew-y: 8.6; }
        frame 54 { x: 43.4; y: 90.1; skew-x: 7.3; skew-y: 7.3; }
        frame 55 { x: 44.9; y: 90.3; skew-x: 6; skew-y: 6; }
        frame 56 { x: 46.4; y: 90.6; skew-x: 4.8; skew-y: 4.8; }
        frame 57 { x: 48; y: 90.8; skew-x: 3.5; skew-y: 3.5; }
        frame 58 { x: 50.4; y: 90.9; skew-x: 2.3; skew-y: 2.3; }
        frame 59 { x: 52.7; y: 91.1; skew-x: 1.1; skew-y: 1.1; }
        frame 60 { x: 55; y: 91.2; skew-x: 0; skew-y: 0; }
        frame 61 { x: 57.4; y: 91.3; skew-x: -1; skew-y: -1; }
        frame 62 { x: 57.8; y: 91.1; skew-x: -2.2; skew-y: -3.4; }
        frame 63 { x: 58.1; y: -10000; skew-x: -3.7; skew-y: -5.7; scale-x: 0.72; scale-y: 0.898; }
        frame 64 { x: 58.5; y: 91; skew-x: -4.9; skew-y: -8.2; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 58.9; y: -10000; skew-x: -6.4; skew-y: -10.8; scale-x: 0.721; }
        frame 66 { x: 59.1; y: 91.4; skew-x: -8.7; skew-y: -13.2; scale-x: 0.72; }
        frame 67 { x: 59.5; y: 91.8; skew-x: -11.2; skew-y: -15.5; scale-x: -10000; scale-y: 0.897; }
        frame 68 { x: 59.6; y: 92.3; skew-x: -13.4; skew-y: -17.9; scale-y: -10000; }
        frame 69 { x: 60; y: 92.7; skew-x: -15.9; skew-y: -20.3; scale-y: 0.898; }
        frame 70 { x: 59.5; y: 92.8; skew-x: -15.7; skew-y: -19.2; scale-y: 0.88; }
        frame 71 { x: 59; y: 92.7; skew-x: -15.5; skew-y: -18.4; scale-y: 0.864; }
        frame 72 { x: 58.5; y: 92.8; skew-x: -10000; skew-y: -17.5; scale-x: 0.721; scale-y: 0.848; }
        frame 73 { x: 58.4; y: 92.3; skew-x: -10.2; skew-y: -11.7; scale-x: -10000; scale-y: 0.832; }
        frame 74 { x: -10000; y: 92; skew-x: -5; skew-y: -5.7; scale-x: 0.722; scale-y: 0.816; }
        frame 75 { x: 58.5; y: 91.8; skew-x: 0; skew-y: 0; scale-x: 0.723; scale-y: 0.8; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 58; skew-x: -0.2; skew-y: -0.9; }
        frame 83 { x: 57.6; y: 92; skew-x: -0.7; skew-y: -2.2; scale-x: 0.724; }
        frame 84 { x: 57.2; y: 92.1; skew-x: -1.2; skew-y: -3.4; scale-x: -10000; }
        frame 85 { x: 56.8; y: 92.3; skew-x: -1.7; skew-y: -4.7; scale-x: 0.725; }
        frame 86 { x: 56.5; y: 92.4; skew-x: -2.2; skew-y: -5.7; scale-x: -10000; scale-y: 0.799; }
        frame 87 { x: 56; y: 92.5; skew-x: -2.5; skew-y: -6.9; scale-x: 0.726; scale-y: -10000; }
        frame 88 { x: 55.5; y: 92.7; skew-x: -2.9; skew-y: -8.2; scale-x: -10000; }
        frame 89 { x: 55.1; y: -10000; skew-x: -3.5; skew-y: -9.5; scale-x: 0.727; scale-y: 0.8; }
        frame 90 { x: 55.7; y: 92.6; skew-x: -2.9; skew-y: -7.7; scale-x: 0.726; scale-y: 0.799; }
        frame 91 { x: 56.3; y: 92.5; skew-x: -2.2; skew-y: -6.2; scale-x: 0.725; scale-y: -10000; }
        frame 92 { x: 56.8; y: 92.3; skew-x: -1.7; skew-y: -4.7; scale-x: -10000; scale-y: 0.8; }
        frame 93 { x: 57.3; y: 92.2; skew-x: -1; skew-y: -2.9; scale-x: 0.724; scale-y: -10000; }
        frame 94 { x: 57.9; y: 91.9; skew-x: -0.4; skew-y: -1.4; scale-x: -10000; }
        frame 95 { x: 58.5; y: 91.8; skew-x: 0; skew-y: 0; scale-x: 0.723; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 102 { x: 58; skew-x: -0.2; skew-y: -0.9; }
        frame 103 { x: 57.6; y: 92; skew-x: -0.7; skew-y: -2.2; scale-x: 0.724; }
        frame 104 { x: 57.2; y: 92.1; skew-x: -1.2; skew-y: -3.4; scale-x: -10000; }
        frame 105 { x: 56.8; y: 92.3; skew-x: -1.7; skew-y: -4.7; scale-x: 0.725; }
        frame 106 { x: 56.5; y: 92.4; skew-x: -2.2; skew-y: -5.7; scale-x: -10000; scale-y: 0.799; }
        frame 107 { x: 56; y: 92.5; skew-x: -2.5; skew-y: -6.9; scale-x: 0.726; scale-y: -10000; }
        frame 108 { x: 55.5; y: 92.7; skew-x: -2.9; skew-y: -8.2; scale-x: -10000; }
        frame 109 { x: 55.1; y: -10000; skew-x: -3.5; skew-y: -9.5; scale-x: 0.727; scale-y: 0.8; }
        frame 110 { x: 55.7; y: 92.6; skew-x: -2.9; skew-y: -7.7; scale-x: 0.726; scale-y: 0.799; }
        frame 111 { x: 56.3; y: 92.5; skew-x: -2.2; skew-y: -6.2; scale-x: 0.725; scale-y: -10000; }
        frame 112 { x: 56.8; y: 92.3; skew-x: -1.7; skew-y: -4.7; scale-x: -10000; scale-y: 0.8; }
        frame 113 { x: 57.3; y: 92.2; skew-x: -1; skew-y: -2.9; scale-x: 0.724; scale-y: -10000; }
        frame 114 { x: 57.9; y: 91.9; skew-x: -0.4; skew-y: -1.4; scale-x: -10000; }
        frame 115 { x: 58.5; y: 91.8; skew-x: 0; skew-y: 0; scale-x: 0.723; }
        frame 116 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 117 { x: 51; y: 97.1; skew-x: -18.4; skew-y: -18.4; scale-x: 0.722; scale-y: 0.799; }
        frame 118 { x: 45.2; y: 103.2; skew-x: -37; skew-y: -37; scale-x: 0.721; scale-y: 0.798; }
        frame 119 { x: 41; y: 109.8; skew-x: -55.5; skew-y: -55.5; scale-x: 0.722; scale-y: 0.799; }
        frame 120 { x: 37.7; y: 115.3; skew-x: -71.4; skew-y: -71.4; scale-x: 0.721; scale-y: 0.85; }
        frame 121 { x: 35.6; y: 120.8; skew-x: -87.1; skew-y: -87.1; scale-x: 0.722; scale-y: 0.903; }
        frame 122 { x: 34.8; y: 125.7; skew-x: -102.8; skew-y: -102.8; scale-x: 0.723; scale-y: 0.956; }
        frame 123 { x: 34; y: 125.8; skew-x: -100.7; skew-y: -102.7; scale-x: 0.724; scale-y: 0.967; }
        frame 124 { x: 33.2; y: 125.9; skew-x: -98.7; skew-y: -10000; scale-x: 0.726; scale-y: 0.979; }
        frame 125 { x: 32.5; y: 126; skew-x: -96.9; scale-x: 0.728; scale-y: 0.991; }
        frame 126 { x: 31.6; y: 126.2; skew-x: -94.9; scale-x: 0.73; scale-y: 1.002; }
        frame 127 { x: 30.9; y: 126.3; skew-x: -93.1; scale-x: 0.732; scale-y: 1.015; }
        frame 128 { x: 30.7; y: 126; skew-x: -92.9; skew-y: -101.7; scale-x: 0.731; scale-y: 1.014; }
        frame 129 { x: 30.6; y: 125.6; skew-x: -10000; skew-y: -100.9; scale-x: 0.73; scale-y: 1.015; }
        frame 130 { x: 30.4; y: 125.3; skew-y: -100.2; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: 30.2; y: 125.1; skew-y: -99.4; scale-x: 0.729; }
        frame 132 { x: 30; y: 124.8; skew-y: -98.5; scale-x: 0.728; }
        frame 133 { x: 29.9; y: 124.5; skew-y: -97.7; scale-x: 0.727; scale-y: 1.016; }
        frame 134 { x: 29.8; y: 124.2; skew-y: -96.9; scale-x: 0.726; scale-y: -10000; }
        frame 135 { x: 29.6; y: 124; skew-y: -96.2; scale-x: 0.725; }
        frame 136 { x: 29.5; y: 123.6; skew-y: -95.2; scale-x: 0.724; scale-y: 1.017; }
        frame 137 { x: 29.4; y: 123.3; skew-y: -94.4; scale-x: 0.723; scale-y: -10000; }
        frame 138 { x: 29.2; y: 123.1; skew-y: -93.7; scale-x: 0.722; }
        frame 139 { x: 29.1; y: 122.7; skew-x: -93; skew-y: -93; scale-x: -10000; scale-y: 1.018; }
        frame 140 { x: 31.9; y: 123.3; skew-x: -100.2; skew-y: -104; scale-x: 0.726; scale-y: 0.995; }
        frame 141 { x: 35.5; y: -10000; skew-x: -107.2; skew-y: -115.2; scale-x: 0.73; scale-y: 0.973; }
        frame 142 { x: 39.4; y: 122.9; skew-x: -114.6; skew-y: -126.3; scale-x: 0.736; scale-y: 0.953; }
        frame 143 { x: -10000; y: 122.5; skew-x: -118.7; skew-y: -130.3; scale-x: 0.734; scale-y: 0.951; }
        frame 144 { y: 121.8; skew-x: -122.9; skew-y: -134.3; scale-x: -10000; scale-y: 0.952; }
        frame 145 { x: 40.1; y: 115.9; skew-x: -144.6; skew-y: -156.1; scale-x: 0.732; scale-y: 0.994; }
        frame 146 { x: 41.2; y: 106.8; skew-x: -166.3; skew-y: -177.7; scale-x: -10000; scale-y: 1.038; }
        frame 147 { x: 34.8; y: 114.5; skew-x: -127.5; skew-y: -147.1; scale-x: 0.725; scale-y: 0.948; }
        frame 148 { x: 28.5; y: 119.3; skew-x: -95.1; skew-y: -112.2; scale-x: 0.681; scale-y: 0.946; }
        frame 149 { x: 25; y: 123.5; skew-x: -71.1; skew-y: -85.6; scale-x: 0.638; scale-y: 0.948; }
        frame 150 { x: 25.9; y: 121.7; skew-x: -74.9; skew-y: -87.9; scale-x: 0.684; scale-y: -10000; }
        frame 151 { x: 26.9; y: 119.9; skew-x: -78.6; skew-y: -90; scale-x: 0.731; }
        frame 152 { x: 26; y: 120.6; skew-x: -77.1; skew-y: -88.4; scale-x: -10000; }
        frame 153 { x: 25.1; y: 121.4; skew-x: -75.4; skew-y: -86.6; }
        frame 154 { x: 24.3; y: 122.2; skew-x: -73.6; skew-y: -84.9; scale-y: 0.949; }
        frame 155 { x: 50; y: 81.5; skew-x: 16.8; skew-y: 24.4; scale-x: 0.721; scale-y: 0.805; }
        frame 156 { x: 49.5; y: 81.8; skew-x: 14.5; skew-y: 22.1; scale-x: -10000; scale-y: 0.804; }
        frame 157 { x: 48.9; y: 82.3; skew-x: 12.3; skew-y: 19.8; scale-y: -10000; }
        frame 158 { x: 48.3; y: 82.7; skew-x: 9.8; skew-y: 17.5; }
        frame 159 { x: 47.7; y: 83.2; skew-x: 7.6; skew-y: 15.3; }
        frame 160 { x: 47.3; y: 83.6; skew-x: 5.4; skew-y: 13.1; scale-y: 0.805; }
        frame 161 { x: 47.7; y: 83.2; skew-x: 7.6; skew-y: 15.3; scale-y: 0.804; }
        frame 162 { x: 48.4; y: 82.7; skew-x: 9.8; skew-y: 17.5; scale-y: -10000; }
        frame 163 { x: 48.9; y: 82.3; skew-x: 12.3; skew-y: 19.8; }
        frame 164 { x: 49.5; y: 81.9; skew-x: 14.5; skew-y: 22.1; }
        frame 165 { x: 50; y: 81.5; skew-x: 16.8; skew-y: 24.4; scale-y: 0.805; }
    }
    Track {
        source-name: "Zombie_outerleg_upper";
        frame-count: 166;
        frame 0 { x: 54.8; y: 67.8; scale-x: 0.705; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POGO_OUTERLEG_UPPER; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 5 { y: 68; skew-x: 1.3; skew-y: 1.3; }
        frame 6 { skew-x: 2.8; skew-y: 2.8; }
        frame 7 { y: 68.2; skew-x: 4.3; skew-y: 4.3; scale-x: 0.704; }
        frame 8 { y: 68.3; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: 0.799; }
        frame 9 { y: 68.4; skew-x: 7.3; skew-y: 7.3; scale-y: -10000; }
        frame 10 { y: 68.5; skew-x: 8.8; skew-y: 8.8; scale-y: 0.8; }
        frame 11 { y: 68.3; skew-x: 7.3; skew-y: 7.3; scale-y: 0.799; }
        frame 12 { y: 68.2; skew-x: 5.8; skew-y: 5.8; scale-y: -10000; }
        frame 13 { y: 68.1; skew-x: 4.3; skew-y: 4.3; scale-y: 0.8; }
        frame 14 { y: 68; skew-x: 2.8; skew-y: 2.8; scale-y: -10000; }
        frame 15 { x: 54.7; skew-x: 1.3; skew-y: 1.3; scale-x: 0.705; }
        frame 16 { x: 54.8; y: 67.8; skew-x: 0; skew-y: 0; scale-x: -10000; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 53; y: 67.3; skew-x: 2.6; skew-y: 2.6; scale-x: 0.704; scale-y: 0.799; }
        frame 31 { x: 51.5; y: 66.7; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 49.8; y: 66.1; skew-x: 8.1; skew-y: 8.1; scale-x: 0.703; scale-y: 0.798; }
        frame 33 { x: 48.3; y: 65.5; skew-x: 11; skew-y: 11; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: -10000; y: 65.2; skew-x: 13.3; skew-y: 13.3; scale-x: 0.702; scale-y: 0.797; }
        frame 35 { x: 48.1; y: 64.9; skew-x: 15.8; skew-y: 15.8; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 48.2; y: 64.7; skew-x: 18.3; skew-y: 18.3; }
        frame 37 { x: 48.1; y: 64.3; skew-x: 20.7; skew-y: 20.7; }
        frame 38 { x: 47.5; y: 64.4; skew-x: 21.1; skew-y: 21.1; scale-x: 0.701; scale-y: 0.796; }
        frame 39 { x: 47; y: 64.3; skew-x: 21.5; skew-y: 21.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 46.5; y: -10000; skew-x: 22; skew-y: 22; }
        frame 41 { x: 45.9; skew-x: 22.5; skew-y: 22.5; }
        frame 42 { x: 46.3; y: 64.5; skew-x: 20.8; skew-y: 20.8; scale-x: 0.705; scale-y: 0.802; }
        frame 43 { x: 46.6; y: 64.6; skew-x: 19.3; skew-y: 19.3; scale-x: 0.709; scale-y: 0.809; }
        frame 44 { x: 47.1; y: 64.8; skew-x: 17.8; skew-y: 17.8; scale-x: 0.713; scale-y: 0.816; }
        frame 45 { x: 47.6; y: -10000; skew-x: 16.4; skew-y: 16.4; scale-x: 0.718; scale-y: 0.824; }
        frame 46 { x: 47.5; y: 65.3; skew-x: 17; skew-y: 17; scale-x: 0.717; scale-y: 0.823; }
        frame 47 { x: 47.4; y: 65.8; skew-x: 17.6; skew-y: 17.6; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 47.2; y: 66.3; skew-x: 18.3; skew-y: 18.3; }
        frame 49 { x: 47; y: 66.7; skew-x: 18.9; skew-y: 18.9; scale-x: 0.718; scale-y: 0.824; }
        frame 50 { x: 45.3; y: 66.8; skew-x: 16.6; skew-y: 16.6; scale-x: 0.717; scale-y: 0.823; }
        frame 51 { x: 43.6; y: 66.9; skew-x: 14.3; skew-y: 14.3; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 42.1; y: 67; skew-x: 12.1; skew-y: 12.1; scale-y: 0.822; }
        frame 53 { x: 40.5; skew-x: 9.9; skew-y: 9.9; scale-y: 0.823; }
        frame 54 { x: 41.5; y: 67.3; skew-x: 7.5; skew-y: 7.5; scale-x: 0.716; scale-y: 0.822; }
        frame 55 { x: 42.4; y: 67.6; skew-x: 5; skew-y: 5; scale-x: 0.717; scale-y: -10000; }
        frame 56 { x: 43.4; y: 67.8; skew-x: 2.6; skew-y: 2.6; scale-x: -10000; }
        frame 57 { x: 44.4; y: 68.2; skew-x: 0.4; skew-y: 0.4; }
        frame 58 { x: 44; y: 69.1; skew-x: -5.2; skew-y: -5.2; scale-x: 0.716; }
        frame 59 { x: 43.6; y: 70; skew-x: -11; skew-y: -11; scale-x: -10000; scale-y: 0.821; }
        frame 60 { x: 43.5; y: 71.1; skew-x: -16.7; skew-y: -16.7; scale-x: 0.715; scale-y: -10000; }
        frame 61 { x: 43.4; y: 72.3; skew-x: -22.6; skew-y: -22.6; scale-x: 0.716; }
        frame 62 { x: 43.5; y: 72.8; skew-x: -24.2; skew-y: -24.2; scale-x: 0.715; scale-y: 0.82; }
        frame 63 { x: 43.6; y: 73.5; skew-x: -26; skew-y: -26; scale-x: 0.714; scale-y: -10000; }
        frame 64 { x: -10000; y: 74; skew-x: -27.7; skew-y: -27.7; scale-x: -10000; }
        frame 65 { x: 43.8; y: 74.6; skew-x: -29.3; skew-y: -29.3; scale-x: 0.715; scale-y: 0.821; }
        frame 66 { x: 44.1; y: 74.5; skew-x: -29.2; skew-y: -29.2; scale-x: 0.714; scale-y: 0.82; }
        frame 67 { x: 44.4; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 44.7; }
        frame 69 { x: 45; y: 74.6; skew-x: -29.3; skew-y: -29.3; scale-x: 0.715; scale-y: 0.821; }
        frame 70 { x: 46.5; y: 73.2; skew-x: -24.2; skew-y: -24.2; scale-x: 0.712; scale-y: 0.816; }
        frame 71 { x: 47.9; y: 71.8; skew-x: -19.4; skew-y: -19.4; scale-x: 0.711; scale-y: 0.813; }
        frame 72 { x: 49.5; y: 70.8; skew-x: -14.5; skew-y: -14.5; scale-x: 0.709; scale-y: 0.81; }
        frame 73 { x: 51.3; y: 69.7; skew-x: -9.5; skew-y: -9.5; scale-x: 0.707; scale-y: 0.806; }
        frame 74 { x: 53; y: 68.7; skew-x: -4.7; skew-y: -4.7; scale-x: 0.706; scale-y: 0.803; }
        frame 75 { x: 54.8; y: 67.8; skew-x: 0; skew-y: 0; scale-x: 0.705; scale-y: 0.8; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 82 { y: 67.7; skew-x: 0.8; skew-y: 0.8; scale-y: 0.806; }
        frame 83 { x: 54.9; y: 67.6; skew-x: 1.5; skew-y: 1.5; scale-y: 0.813; }
        frame 84 { x: -10000; y: 67.3; skew-x: 2.3; skew-y: 2.3; scale-y: 0.819; }
        frame 85 { x: 55; y: 67.2; skew-x: 3; skew-y: 3; scale-x: 0.704; scale-y: 0.825; }
        frame 86 { y: 66.9; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: 0.831; }
        frame 87 { x: -10000; y: 66.8; skew-x: 4.6; skew-y: 4.6; scale-y: 0.838; }
        frame 88 { x: 55.1; y: 66.7; skew-x: 5.3; skew-y: 5.3; scale-y: 0.844; }
        frame 89 { x: 55.3; y: 66.4; skew-x: 6.3; skew-y: 6.3; scale-y: 0.851; }
        frame 90 { x: 55.1; y: 66.7; skew-x: 5.1; skew-y: 5.1; scale-y: 0.842; }
        frame 91 { x: 55; y: 66.8; skew-x: 4; skew-y: 4; scale-y: 0.834; }
        frame 92 { x: -10000; y: 67; skew-x: 3; skew-y: 3; scale-y: 0.825; }
        frame 93 { x: 54.9; y: 67.3; skew-x: 2; skew-y: 2; scale-x: 0.705; scale-y: 0.817; }
        frame 94 { x: -10000; y: 67.6; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: 0.808; }
        frame 95 { x: 54.8; y: 67.8; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 102 { y: 67.7; skew-x: 0.8; skew-y: 0.8; scale-y: 0.806; }
        frame 103 { x: 54.9; y: 67.6; skew-x: 1.5; skew-y: 1.5; scale-y: 0.813; }
        frame 104 { x: -10000; y: 67.3; skew-x: 2.3; skew-y: 2.3; scale-y: 0.819; }
        frame 105 { x: 55; y: 67.2; skew-x: 3; skew-y: 3; scale-x: 0.704; scale-y: 0.825; }
        frame 106 { y: 66.9; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: 0.831; }
        frame 107 { x: -10000; y: 66.8; skew-x: 4.6; skew-y: 4.6; scale-y: 0.838; }
        frame 108 { x: 55.1; y: 66.7; skew-x: 5.3; skew-y: 5.3; scale-y: 0.844; }
        frame 109 { x: 55.3; y: 66.4; skew-x: 6.3; skew-y: 6.3; scale-y: 0.851; }
        frame 110 { x: 55.1; y: 66.7; skew-x: 5.1; skew-y: 5.1; scale-y: 0.842; }
        frame 111 { x: 55; y: 66.8; skew-x: 4; skew-y: 4; scale-y: 0.834; }
        frame 112 { x: -10000; y: 67; skew-x: 3; skew-y: 3; scale-y: 0.825; }
        frame 113 { x: 54.9; y: 67.3; skew-x: 2; skew-y: 2; scale-x: 0.705; scale-y: 0.817; }
        frame 114 { x: -10000; y: 67.6; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: 0.808; }
        frame 115 { x: 54.8; y: 67.8; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 116 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 117 { x: 50.8; y: 70.8; skew-x: 3.8; skew-y: 3.8; scale-x: 0.704; scale-y: 0.799; }
        frame 118 { x: 46.8; y: 73.7; skew-x: 7.8; skew-y: 7.8; scale-x: 0.703; scale-y: -10000; }
        frame 119 { x: 43; y: 76.8; skew-x: 11.7; skew-y: 11.7; scale-x: -10000; scale-y: 0.798; }
        frame 120 { x: 39.9; y: 80.2; skew-x: 11.3; skew-y: 11.3; scale-y: 0.831; }
        frame 121 { x: 36.9; y: 83.5; skew-x: 10.8; skew-y: 10.8; scale-x: 0.702; scale-y: 0.864; }
        frame 122 { x: 34; y: 86.8; skew-x: 10.5; skew-y: 10.5; scale-x: -10000; scale-y: 0.897; }
        frame 123 { x: 34.1; y: -10000; skew-x: 12.3; skew-y: 12.3; scale-y: 0.896; }
        frame 124 { x: 34.4; y: 86.6; skew-x: 14.3; skew-y: 14.3; scale-y: -10000; }
        frame 125 { x: -10000; y: 86.7; skew-x: -10000; skew-y: -10000; scale-x: 0.701; scale-y: 0.895; }
        frame 126 { y: 86.6; scale-x: 0.702; scale-y: 0.896; }
        frame 127 { y: 86.7; skew-x: 13.3; skew-y: 13.3; scale-x: 0.701; scale-y: -10000; }
        frame 128 { x: 34.2; y: 86.8; skew-x: 12.3; skew-y: 12.3; scale-x: 0.702; }
        frame 129 { x: 34.1; y: -10000; skew-x: 11.3; skew-y: 11.3; scale-x: -10000; }
        frame 130 { x: 34; skew-x: 10.5; skew-y: 10.5; scale-y: 0.897; }
        frame 131 { x: 32.9; y: 87.1; skew-x: 8.8; skew-y: 8.8; scale-y: 0.896; }
        frame 132 { x: 32; y: -10000; skew-x: 7.3; skew-y: 7.3; scale-y: -10000; }
        frame 133 { x: 31; skew-x: 5.8; skew-y: 5.8; }
        frame 134 { x: 29; y: 87.3; skew-x: 2.5; skew-y: 2.5; scale-x: 0.701; }
        frame 135 { x: 27.2; y: 87.5; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; }
        frame 136 { x: 25.2; y: 88; skew-x: -3.7; skew-y: -3.7; scale-y: 0.895; }
        frame 137 { x: 22.3; y: 88.5; skew-x: -7.7; skew-y: -8.4; scale-y: 0.894; }
        frame 138 { x: 19.6; y: 89.1; skew-x: -11.7; skew-y: -13.2; scale-x: 0.7; scale-y: -10000; }
        frame 139 { x: 16.8; y: 89.8; skew-x: -16; skew-y: -18; scale-x: 0.701; }
        frame 140 { x: 14.1; y: 93.5; skew-x: -26.2; skew-y: -27.7; scale-x: 0.699; scale-y: 0.892; }
        frame 141 { x: 11.9; y: 97.4; skew-x: -36.7; skew-y: -37.3; scale-x: 0.698; scale-y: 0.891; }
        frame 142 { x: 10.2; y: 101.6; skew-x: -47.1; skew-y: -47.1; scale-x: 0.699; scale-y: 0.892; }
        frame 143 { x: 8.4; y: 103.5; skew-x: -51.8; skew-y: -51.8; scale-x: 0.697; scale-y: 0.891; }
        frame 144 { x: 6.7; y: 105.4; skew-x: -56.4; skew-y: -56.4; scale-x: 0.698; scale-y: 0.892; }
        frame 145 { x: 5.1; y: 110; skew-x: -78.1; skew-y: -78.1; scale-x: 0.697; scale-y: 0.89; }
        frame 146 { x: 6.3; y: 113.8; skew-x: -99.8; skew-y: -99.8; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 2.9; y: 114.7; skew-x: -87.1; skew-y: -89.4; scale-x: 0.67; scale-y: 0.882; }
        frame 148 { x: 0.2; y: 115.2; skew-x: -74.6; skew-y: -78.9; scale-x: 0.643; scale-y: 0.874; }
        frame 149 { x: -1.5; y: 115.7; skew-x: -61.8; skew-y: -68.3; scale-x: 0.617; scale-y: 0.867; }
        frame 150 { x: -0.6; y: 114.5; skew-x: -67.6; skew-y: -70.8; scale-x: 0.655; scale-y: 0.877; }
        frame 151 { x: 0.3; y: 113.3; skew-x: -73.2; skew-y: -73.2; scale-x: 0.695; scale-y: 0.887; }
        frame 152 { x: -0.3; y: 113.1; skew-x: -70.6; skew-y: -70.6; scale-x: 0.694; scale-y: -10000; }
        frame 153 { x: -0.9; y: 112.9; skew-x: -67.9; skew-y: -67.9; scale-x: -10000; }
        frame 154 { x: -1.5; y: 112.7; skew-x: -65.2; skew-y: -65.2; scale-x: 0.695; scale-y: 0.888; }
        frame 155 { x: 60.6; y: 57.9; skew-x: 30.4; skew-y: 30.4; scale-x: 0.753; scale-y: 0.797; }
        frame 156 { x: 61.8; y: 58.8; skew-x: 33.3; skew-y: 33.3; scale-x: 0.752; scale-y: 0.796; }
        frame 157 { x: 62.9; y: 59.6; skew-x: 36.4; skew-y: 36.4; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 64.1; y: 60.6; skew-x: 39.4; skew-y: 39.4; }
        frame 159 { x: 65.3; y: 61.5; skew-x: 42.4; skew-y: 42.4; }
        frame 160 { x: 66.3; y: 62.6; skew-x: 45.4; skew-y: 45.4; scale-x: 0.753; scale-y: 0.797; }
        frame 161 { x: 65.2; y: 61.7; skew-x: 42.4; skew-y: 42.4; scale-x: 0.752; scale-y: 0.796; }
        frame 162 { x: 64.1; y: 60.6; skew-x: 39.4; skew-y: 39.4; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 62.9; y: 59.8; skew-x: 36.4; skew-y: 36.4; }
        frame 164 { x: 61.6; y: 58.8; skew-x: 33.3; skew-y: 33.3; }
        frame 165 { x: 60.6; y: 57.9; skew-x: 30.4; skew-y: 30.4; scale-x: 0.753; scale-y: 0.797; }
    }
    Track {
        source-name: "Zombie_outerleg_foot";
        frame-count: 166;
        frame 0 { x: 44.6; y: 109.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POGO_OUTERLEG_FOOT; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 5 { x: 44.5; y: 109.4; skew-x: -0.7; skew-y: -0.7; }
        frame 6 { x: 44.4; y: -10000; skew-x: -1.7; skew-y: -1.7; }
        frame 7 { x: 44.3; y: 109.6; skew-x: -2.7; skew-y: -2.7; }
        frame 8 { x: 44.1; y: -10000; skew-x: -3.4; skew-y: -3.4; }
        frame 9 { x: 44; y: 109.8; skew-x: -4.4; skew-y: -4.4; }
        frame 10 { y: -10000; skew-x: -5.4; skew-y: -5.4; }
        frame 11 { y: 109.7; skew-x: -4.4; skew-y: -4.4; }
        frame 12 { x: 44.1; y: 109.6; skew-x: -3.4; skew-y: -3.4; }
        frame 13 { x: 44.3; y: 109.5; skew-x: -2.7; skew-y: -2.7; }
        frame 14 { x: 44.5; y: -10000; skew-x: -1.7; skew-y: -1.7; }
        frame 15 { x: -10000; y: 109.3; skew-x: -0.7; skew-y: -0.7; }
        frame 16 { x: 44.6; y: -10000; skew-x: 0; skew-y: 0; }
        frame 17 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 42.7; y: 109.8; skew-x: -1.7; skew-y: -1.7; }
        frame 31 { x: 40.8; y: 110.5; skew-x: -3.7; skew-y: -3.7; }
        frame 32 { x: 38.8; y: 111.1; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 37; y: 111.7; skew-x: -7.5; skew-y: -7.5; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: 35.7; y: -10000; skew-x: -7.4; skew-y: -7.4; scale-x: 0.799; scale-y: 0.799; }
        frame 35 { x: 34.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 33.1; }
        frame 37 { x: 31.8; skew-x: -7.5; skew-y: -7.5; scale-x: 0.8; scale-y: 0.8; }
        frame 38 { x: 29.5; skew-x: -7.4; skew-y: -7.4; scale-x: 0.799; scale-y: 0.799; }
        frame 39 { x: 27.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 24.9; }
        frame 41 { x: 22.6; skew-x: -7.5; skew-y: -7.5; scale-x: 0.8; scale-y: 0.8; }
        frame 42 { x: 23.3; skew-x: -7.4; skew-y: -7.4; scale-x: 0.799; scale-y: 0.799; }
        frame 43 { x: 24.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 24.8; }
        frame 45 { x: 25.4; skew-x: -7.5; skew-y: -7.5; scale-x: 0.8; scale-y: 0.8; }
        frame 46 { x: 25.5; y: 111.6; skew-x: -7.4; skew-y: -7.4; scale-x: 0.799; scale-y: 0.799; }
        frame 47 { x: 25.6; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 25.7; }
        frame 49 { x: -10000; y: 111.7; skew-x: -7.5; skew-y: -7.5; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: 25.6; y: -10000; skew-x: -7.4; skew-y: -7.4; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 25.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 25.4; }
        frame 53 { x: 25.2; skew-x: -7.5; skew-y: -7.5; scale-x: 0.8; scale-y: 0.8; }
        frame 54 { x: 27.4; skew-x: -7.4; skew-y: -7.4; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 29.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 31.8; }
        frame 57 { x: 34; skew-x: -7.5; skew-y: -7.5; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: 36.6; y: 111.6; skew-x: -7.4; skew-y: -7.4; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { x: 39.3; y: 111.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 42; y: 111.3; }
        frame 61 { x: 44.5; y: -10000; skew-x: -7.5; skew-y: -7.5; scale-x: 0.8; scale-y: 0.8; }
        frame 62 { x: 45.4; y: 111.6; skew-x: -9.2; skew-y: -9.2; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: 46.3; y: 112; skew-x: -10.9; skew-y: -10.9; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 47.1; y: 112.3; skew-x: -12.7; skew-y: -12.7; }
        frame 65 { x: 48; y: 112.7; skew-x: -14.6; skew-y: -14.6; }
        frame 66 { x: 49.3; y: -10000; skew-x: -14.5; skew-y: -14.5; }
        frame 67 { x: 50.5; skew-x: -10000; skew-y: -10000; }
        frame 68 { x: 51.9; }
        frame 69 { x: 53.1; skew-x: -14.6; skew-y: -14.6; }
        frame 70 { x: 51.9; y: 112.6; skew-x: -14.7; skew-y: -14.7; }
        frame 71 { x: 50.6; y: 112.3; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; }
        frame 72 { x: 49.4; y: 112.2; skew-x: -14.9; skew-y: -14.9; scale-x: 0.799; scale-y: 0.799; }
        frame 73 { x: 47.8; y: 111.2; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 46.2; y: 110.3; skew-x: -4.9; skew-y: -4.9; }
        frame 75 { x: 44.6; y: 109.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 44.5; y: 109.4; skew-x: -0.4; skew-y: -0.4; }
        frame 83 { x: -10000; y: 109.6; skew-x: -0.9; skew-y: -0.9; }
        frame 84 { x: 44.4; y: 109.7; skew-x: -1.7; skew-y: -1.7; }
        frame 85 { x: 44.3; y: -10000; skew-x: -2.2; skew-y: -2.2; }
        frame 86 { x: -10000; skew-x: -2.7; skew-y: -2.7; }
        frame 87 { x: 44.1; y: 109.9; skew-x: -3.4; skew-y: -3.4; }
        frame 88 { x: 44; y: 110; skew-x: -3.9; skew-y: -3.9; }
        frame 89 { x: -10000; y: 110.1; skew-x: -4.7; skew-y: -4.7; }
        frame 90 { x: 44.1; y: 109.9; skew-x: -3.7; skew-y: -3.7; }
        frame 91 { x: 44.3; y: 109.8; skew-x: -2.9; skew-y: -2.9; }
        frame 92 { x: 44.4; y: 109.7; skew-x: -2.2; skew-y: -2.2; }
        frame 93 { x: 44.5; y: 109.6; skew-x: -1.4; skew-y: -1.4; }
        frame 94 { x: 44.6; y: 109.5; skew-x: -0.7; skew-y: -0.7; }
        frame 95 { x: -10000; y: 109.3; skew-x: 0; skew-y: 0; }
        frame 96 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 102 { x: 44.5; y: 109.4; skew-x: -0.4; skew-y: -0.4; }
        frame 103 { x: -10000; y: 109.6; skew-x: -0.9; skew-y: -0.9; }
        frame 104 { x: 44.4; y: 109.7; skew-x: -1.7; skew-y: -1.7; }
        frame 105 { x: 44.3; y: -10000; skew-x: -2.2; skew-y: -2.2; }
        frame 106 { x: -10000; skew-x: -2.7; skew-y: -2.7; }
        frame 107 { x: 44.1; y: 109.9; skew-x: -3.4; skew-y: -3.4; }
        frame 108 { x: 44; y: 110; skew-x: -3.9; skew-y: -3.9; }
        frame 109 { x: -10000; y: 110.1; skew-x: -4.7; skew-y: -4.7; }
        frame 110 { x: 44.1; y: 109.9; skew-x: -3.7; skew-y: -3.7; }
        frame 111 { x: 44.3; y: 109.8; skew-x: -2.9; skew-y: -2.9; }
        frame 112 { x: 44.4; y: 109.7; skew-x: -2.2; skew-y: -2.2; }
        frame 113 { x: 44.5; y: 109.6; skew-x: -1.4; skew-y: -1.4; }
        frame 114 { x: 44.6; y: 109.5; skew-x: -0.7; skew-y: -0.7; }
        frame 115 { x: -10000; y: 109.3; skew-x: 0; skew-y: 0; }
        frame 116 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 117 { x: 42.2; y: 110.2; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 118 { x: 39.9; y: 111; skew-x: -10.9; skew-y: -10.9; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 37.8; y: 111.8; skew-x: -16.5; skew-y: -16.5; }
        frame 120 { x: 37; y: 114.2; skew-x: -26; skew-y: -26; scale-x: 0.772; scale-y: 0.798; }
        frame 121 { x: 36.5; y: 116.2; skew-x: -35.5; skew-y: -35.5; scale-x: 0.746; scale-y: -10000; }
        frame 122 { x: 36.4; y: 118.2; skew-x: -45; skew-y: -45; scale-x: 0.721; scale-y: 0.799; }
        frame 123 { x: 36.6; y: 118.3; skew-x: -45.3; skew-y: -45.3; scale-x: 0.72; scale-y: 0.798; }
        frame 124 { x: 36.8; y: 118.4; skew-x: -45.5; skew-y: -45.5; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: 36.9; y: 118.3; skew-x: -45.6; skew-y: -45.6; }
        frame 126 { x: 37; y: 118.5; skew-x: -45.8; skew-y: -45.8; }
        frame 127 { x: 37.3; y: 118.6; skew-x: -46; skew-y: -46; }
        frame 128 { x: 37.4; y: -10000; skew-x: -46.3; skew-y: -46.3; }
        frame 129 { x: 37.5; y: 118.7; skew-x: -46.5; skew-y: -46.5; }
        frame 130 { x: -10000; y: -10000; skew-x: -46.7; skew-y: -46.7; scale-x: 0.721; scale-y: 0.799; }
        frame 131 { y: 118.5; skew-x: -46; skew-y: -46; scale-x: 0.719; scale-y: 0.797; }
        frame 132 { x: 37.4; y: 118.3; skew-x: -45.3; skew-y: -45.3; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 37.3; y: 118.2; skew-x: -44.5; skew-y: -44.5; }
        frame 134 { x: 37.7; y: 118.3; skew-x: -45; skew-y: -45; scale-x: 0.707; scale-y: 0.801; }
        frame 135 { x: 38; y: -10000; skew-x: -45.5; skew-y: -45.5; scale-x: 0.695; scale-y: 0.805; }
        frame 136 { x: 38.5; y: 118.5; skew-x: -46.1; skew-y: -46.1; scale-x: 0.684; scale-y: 0.809; }
        frame 137 { x: 38.9; y: 118.6; skew-x: -46.8; skew-y: -46.8; scale-x: 0.672; scale-y: 0.814; }
        frame 138 { x: 39.4; y: 118.7; skew-x: -47.3; skew-y: -47.3; scale-x: 0.66; scale-y: 0.818; }
        frame 139 { x: 39.5; y: -10000; skew-x: -47.7; skew-y: -47.7; scale-x: 0.65; scale-y: 0.824; }
        frame 140 { x: 41.3; y: 116.9; skew-x: -57.8; skew-y: -57.8; scale-x: 0.638; scale-y: 0.828; }
        frame 141 { x: 43.4; y: 114.8; skew-x: -67.8; skew-y: -67.8; scale-x: 0.627; scale-y: 0.833; }
        frame 142 { x: 45.7; y: 112.3; skew-x: -77.8; skew-y: -77.8; scale-x: 0.616; scale-y: 0.839; }
        frame 143 { x: 50; y: 111.5; skew-x: -95.4; skew-y: -95.4; scale-x: -10000; scale-y: 0.838; }
        frame 144 { x: 55; y: 109.4; skew-x: -113.2; skew-y: -113.2; scale-x: 0.615; scale-y: 0.837; }
        frame 145 { x: 55.5; y: 93.5; skew-x: -157.6; skew-y: -157.6; scale-x: 0.613; scale-y: 0.834; }
        frame 146 { x: 51.1; y: 70.4; skew-x: -201.7; skew-y: -201.7; scale-x: 0.612; scale-y: 0.833; }
        frame 147 { x: 58.2; y: 90.1; skew-x: -175.1; skew-y: -172.8; scale-x: 0.59; scale-y: 0.824; }
        frame 148 { x: 64.4; y: 113.2; skew-x: -148.5; skew-y: -143.8; scale-x: 0.568; scale-y: 0.815; }
        frame 149 { x: 60.8; y: 133.1; skew-x: -121.7; skew-y: -114.6; scale-x: 0.547; scale-y: 0.808; }
        frame 150 { x: 61.2; y: 130.9; skew-x: -122.3; skew-y: -118.7; scale-x: 0.578; scale-y: 0.819; }
        frame 151 { x: 61.8; y: 128.7; skew-x: -123; skew-y: -123; scale-x: 0.611; scale-y: 0.832; }
        frame 152 { x: 61.5; y: 130.1; skew-x: -121.3; skew-y: -121.3; scale-x: -10000; scale-y: 0.831; }
        frame 153 { x: 61.2; y: 131.5; skew-x: -119.7; skew-y: -119.7; scale-y: -10000; }
        frame 154 { x: 60.8; y: 133; skew-x: -118; skew-y: -118; scale-x: 0.612; scale-y: 0.832; }
        frame 155 { x: 25.9; y: 105.8; skew-x: -13.2; skew-y: -13.2; scale-x: 0.798; scale-y: 0.798; }
        frame 156 { x: 26.3; y: 105.1; skew-x: -10.7; skew-y: -10.7; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 26.7; y: 104.4; skew-x: -8.2; skew-y: -8.2; }
        frame 158 { x: 27.1; y: 103.8; skew-x: -5.9; skew-y: -5.9; }
        frame 159 { x: 27.5; y: 103.1; skew-x: -3.4; skew-y: -3.4; }
        frame 160 { x: 27.9; y: 102.4; skew-x: -1.1; skew-y: -1.1; }
        frame 161 { x: 27.4; y: 103; skew-x: -3.4; skew-y: -3.4; }
        frame 162 { x: 27; y: 103.7; skew-x: -5.9; skew-y: -5.9; }
        frame 163 { x: 26.6; y: 104.3; skew-x: -8.2; skew-y: -8.2; }
        frame 164 { x: 26.2; y: 105; skew-x: -10.7; skew-y: -10.7; }
        frame 165 { x: 25.9; y: 105.8; skew-x: -13.2; skew-y: -13.2; }
    }
    Track {
        source-name: "Zombie_body";
        frame-count: 166;
        frame 0 { x: 28.9; y: 33.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POGO_BODY; }
        frame 1 { x: 30.3; y: 32.8; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 31.7; y: 31.8; skew-x: 3.5; skew-y: 3.5; }
        frame 3 { x: 33; y: 30.9; skew-x: 5.3; skew-y: 5.3; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 34.4; y: 29.9; skew-x: 7; skew-y: 7; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 35.3; y: 30.2; skew-x: 8.3; skew-y: 8.3; }
        frame 6 { x: 36.2; y: 30.4; skew-x: 9.8; skew-y: 9.8; }
        frame 7 { x: 37.1; y: 30.7; skew-x: 11.3; skew-y: 11.3; }
        frame 8 { x: 37.9; y: 31; skew-x: 12.6; skew-y: 12.6; }
        frame 9 { x: 38.9; y: 31.3; skew-x: 14; skew-y: 14; }
        frame 10 { x: 39.9; y: 31.6; skew-x: 15.6; skew-y: 15.6; }
        frame 11 { x: 38.9; y: 31.4; skew-x: 14; skew-y: 14; }
        frame 12 { x: 37.9; y: 31.1; skew-x: 12.6; skew-y: 12.6; }
        frame 13 { x: 37; y: 30.8; skew-x: 11.3; skew-y: 11.3; }
        frame 14 { x: 36.2; y: 30.6; skew-x: 9.8; skew-y: 9.8; }
        frame 15 { x: 35.3; y: 30.4; skew-x: 8.3; skew-y: 8.3; }
        frame 16 { x: 34.4; y: 29.9; skew-x: 7; skew-y: 7; }
        frame 17 { x: 33; y: 31.1; skew-x: 4.8; skew-y: 4.8; }
        frame 18 { x: 31.8; y: 32.1; skew-x: 2.8; skew-y: 2.8; }
        frame 19 { x: 30.5; y: 33.4; skew-x: 0.6; skew-y: 0.6; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { x: 29.4; y: 34.5; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 28.2; y: 35.7; skew-x: -3.2; skew-y: -3.2; }
        frame 22 { x: 27; y: 37; skew-x: -5.4; skew-y: -5.4; }
        frame 23 { x: 27.3; y: 36.4; skew-x: -4.4; skew-y: -4.4; }
        frame 24 { x: 27.7; y: 35.9; skew-x: -3.4; skew-y: -3.4; }
        frame 25 { x: 27.9; y: 35.4; skew-x: -2.7; skew-y: -2.7; }
        frame 26 { x: 28.3; y: 34.8; skew-x: -1.7; skew-y: -1.7; }
        frame 27 { x: 28.6; y: 34.3; skew-x: -0.7; skew-y: -0.7; }
        frame 28 { x: 28.9; y: 33.8; skew-x: 0; skew-y: 0; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 28.5; y: 32.7; skew-x: 2; skew-y: 2; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 27.9; y: 31.5; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 27.5; y: 30.5; skew-x: 6.1; skew-y: 6.1; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 27.3; y: 29.3; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 27.1; y: 29.5; skew-x: 8.5; skew-y: 8.5; }
        frame 35 { x: 26.9; y: 29.7; skew-x: 8.6; skew-y: 8.6; }
        frame 36 { x: 26.7; y: 29.8; skew-x: 8.8; skew-y: 8.8; }
        frame 37 { x: 26.6; y: 29.9; skew-x: 9.1; skew-y: 9.1; }
        frame 38 { x: 27; y: 29.5; skew-x: 9.8; skew-y: 9.8; }
        frame 39 { x: 27.6; y: 29.1; skew-x: 10.8; skew-y: 10.8; }
        frame 40 { x: 28.1; y: 28.7; skew-x: 11.5; skew-y: 11.5; scale-x: 0.797; scale-y: 0.797; }
        frame 41 { x: 28.6; y: 28.3; skew-x: 12.4; skew-y: 12.4; scale-x: 0.798; scale-y: 0.798; }
        frame 42 { x: 27.9; y: 29.5; skew-x: 10.3; skew-y: 10.3; scale-x: 0.797; scale-y: 0.797; }
        frame 43 { x: 27.4; y: 30.6; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 26.7; y: 31.8; skew-x: 6.3; skew-y: 6.3; }
        frame 45 { x: 26.3; y: 33; skew-x: 4.4; skew-y: 4.4; }
        frame 46 { x: 25.2; y: 33.8; skew-x: 3.3; skew-y: 3.3; }
        frame 47 { x: 24.1; y: 34.4; skew-x: 2.5; skew-y: 2.5; }
        frame 48 { x: 23; y: 35.1; skew-x: 1.5; skew-y: 1.5; }
        frame 49 { x: 22; y: 35.8; skew-x: 0.6; skew-y: 0.6; }
        frame 50 { x: 21.1; y: 35.1; skew-x: 1.6; skew-y: 1.6; }
        frame 51 { x: 20.5; y: 34.1; skew-x: 2.8; skew-y: 2.8; }
        frame 52 { x: 19.7; y: 33.4; skew-x: 3.8; skew-y: 3.8; }
        frame 53 { x: 19; y: 32.5; skew-x: 4.9; skew-y: 4.9; }
        frame 54 { x: 20.6; y: 32; skew-x: 6.1; skew-y: 6.1; }
        frame 55 { x: 22.3; y: 31.4; skew-x: 7.5; skew-y: 7.5; }
        frame 56 { x: 23.9; y: 30.8; skew-x: 8.8; skew-y: 8.8; scale-x: 0.796; scale-y: 0.796; }
        frame 57 { x: 25.6; y: 30.2; skew-x: 10.2; skew-y: 10.2; scale-x: 0.797; scale-y: 0.797; }
        frame 58 { x: 27.4; y: 29.4; skew-x: 11.5; skew-y: 11.5; scale-x: 0.796; scale-y: 0.796; }
        frame 59 { x: 29.3; y: 28.8; skew-x: 13; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 31.2; y: 28.1; skew-x: 14.5; skew-y: 14.5; }
        frame 61 { x: 33; y: 27.4; skew-x: 16; skew-y: 16; scale-x: 0.797; scale-y: 0.797; }
        frame 62 { x: 33.4; y: 27.8; skew-x: 15.3; skew-y: 17; scale-x: -10000; scale-y: 0.796; }
        frame 63 { x: 33.6; y: 28.1; skew-x: 14.8; skew-y: 18; scale-x: 0.798; scale-y: -10000; }
        frame 64 { x: 33.9; y: 28.3; skew-x: 14.3; skew-y: 19; scale-x: 0.799; }
        frame 65 { x: 34.3; y: 28.5; skew-x: 14; skew-y: 20.1; scale-x: 0.801; }
        frame 66 { x: 31.8; y: 28.9; skew-x: 12.5; skew-y: 17.1; scale-x: 0.799; scale-y: 0.795; }
        frame 67 { x: 29.3; y: 29.4; skew-x: 11.1; skew-y: 14.3; scale-x: 0.798; scale-y: -10000; }
        frame 68 { x: 26.7; y: 29.9; skew-x: 9.8; skew-y: 11.3; scale-x: 0.797; }
        frame 69 { x: 24.1; y: 30.4; skew-x: 8.5; skew-y: 8.5; scale-x: 0.796; scale-y: 0.796; }
        frame 70 { x: 24.9; y: 31; skew-x: 7; skew-y: 7; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 25.7; y: 31.5; skew-x: 5.5; skew-y: 5.5; scale-x: 0.797; scale-y: 0.797; }
        frame 72 { x: 26.6; y: 32; skew-x: 4.1; skew-y: 4.1; scale-x: 0.798; scale-y: 0.798; }
        frame 73 { x: 27.5; y: 32.5; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 28.3; y: 33.1; skew-x: 1.3; skew-y: 1.3; scale-x: 0.799; scale-y: 0.799; }
        frame 75 { x: 28.9; y: 33.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 29.2; y: 33.4; skew-x: 0.5; skew-y: 0.5; }
        frame 78 { x: 29.4; y: 32.9; skew-x: 1; skew-y: 1; }
        frame 79 { x: 29.7; y: 32.6; skew-x: 1.5; skew-y: 1.5; }
        frame 80 { x: 29.9; y: 32.1; skew-x: 2.1; skew-y: 2.1; }
        frame 81 { x: 30.3; y: 31.7; skew-x: 2.8; skew-y: 2.8; }
        frame 82 { x: 29.9; y: 32; skew-x: 2.3; skew-y: 2.3; }
        frame 83 { x: 29.7; y: 32.3; skew-x: 2; skew-y: 2; }
        frame 84 { x: 29.3; y: 32.6; skew-x: 1.6; skew-y: 1.6; }
        frame 85 { x: 29.1; y: 33; skew-x: 1.3; skew-y: 1.3; }
        frame 86 { x: 28.7; y: 33.4; skew-x: 0.8; skew-y: 0.8; }
        frame 87 { x: 28.4; y: 33.6; skew-x: 0.5; skew-y: 0.5; }
        frame 88 { x: 28.2; y: 34; skew-x: 0.3; skew-y: 0.3; }
        frame 89 { x: 27.9; y: 34.4; skew-x: -0; skew-y: -0; }
        frame 90 { x: 28.1; y: 34.3; skew-x: 0; skew-y: 0; }
        frame 91 { x: 28.3; y: 34.2; skew-x: -10000; skew-y: -10000; }
        frame 92 { x: 28.4; y: 34.1; }
        frame 93 { x: 28.6; y: 34; }
        frame 94 { x: 28.8; y: -10000; }
        frame 95 { x: 28.9; y: 33.8; }
        frame 96 { x: 29.1; y: 33.5; skew-x: 0.3; skew-y: 0.3; }
        frame 97 { x: 29.3; y: 33.1; skew-x: 0.8; skew-y: 0.8; }
        frame 98 { x: 29.6; y: 32.8; skew-x: 1.3; skew-y: 1.3; }
        frame 99 { x: 29.8; y: 32.4; skew-x: 1.8; skew-y: 1.8; }
        frame 100 { x: 30.1; y: 32; skew-x: 2.3; skew-y: 2.3; }
        frame 101 { x: 30.3; y: 31.7; skew-x: 2.8; skew-y: 2.8; }
        frame 102 { x: 29.8; y: 32.1; skew-x: 2; skew-y: 2; }
        frame 103 { x: 29.4; y: 32.5; skew-x: 1.5; skew-y: 1.5; }
        frame 104 { x: 29; y: 33; skew-x: 1; skew-y: 1; }
        frame 105 { x: 28.6; y: 33.5; skew-x: 0.3; skew-y: 0.3; }
        frame 106 { x: 28.3; y: 34; skew-x: 0; skew-y: 0; }
        frame 107 { x: 27.9; y: 34.4; skew-x: -0.5; skew-y: -0.5; }
        frame 108 { x: 27.5; y: 34.9; skew-x: -1.2; skew-y: -1.2; }
        frame 109 { x: 27.2; y: 35.5; skew-x: -1.8; skew-y: -1.8; }
        frame 110 { x: 27.5; y: 35.2; skew-x: -1.4; skew-y: -1.4; }
        frame 111 { x: 27.8; y: 34.9; skew-x: -1; skew-y: -1; }
        frame 112 { x: 28.1; y: 34.6; skew-x: -0.7; skew-y: -0.7; }
        frame 113 { x: 28.4; y: 34.5; skew-x: -0.4; skew-y: -0.4; }
        frame 114 { x: 28.7; y: 34.1; skew-x: -0.2; skew-y: -0.2; }
        frame 115 { x: 28.9; y: 33.8; skew-x: 0; skew-y: 0; }
        frame 116 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 117 { x: 25.6; y: 37.3; skew-x: 0.5; skew-y: 0.5; }
        frame 118 { x: 22.3; y: 40.6; skew-x: 1.3; skew-y: 1.3; scale-x: 0.799; scale-y: 0.799; }
        frame 119 { x: 19; y: 44; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 15.6; y: 47.4; skew-x: 2.5; skew-y: 2.5; scale-x: 0.798; scale-y: 0.798; }
        frame 121 { x: 12.4; y: 50.8; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 122 { x: 9.1; y: 54; skew-x: 4; skew-y: 4; }
        frame 123 { x: 8.6; y: 56; skew-x: 2; skew-y: 2; scale-x: 0.797; scale-y: 0.77; }
        frame 124 { x: 8.2; y: 58; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.744; }
        frame 125 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 127 { x: 8.4; y: 57; skew-x: 1; skew-y: 1; scale-y: 0.757; }
        frame 128 { x: 8.6; y: 56; skew-x: 2; skew-y: 2; scale-y: 0.77; }
        frame 129 { x: 8.8; y: 55; skew-x: 2.8; skew-y: 2.8; scale-y: 0.784; }
        frame 130 { x: 9.1; y: 54; skew-x: 4; skew-y: 4; scale-x: 0.798; scale-y: 0.798; }
        frame 131 { x: 8.9; y: 53.1; skew-x: 4.8; skew-y: 4.8; scale-x: 0.797; scale-y: 0.797; }
        frame 132 { x: -10000; y: 52.3; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 8.7; y: 51.4; skew-x: 6.8; skew-y: 6.8; }
        frame 134 { x: 8.5; y: 49.5; skew-x: 8.8; skew-y: 8.8; scale-x: 0.796; scale-y: 0.796; }
        frame 135 { x: 8.3; y: 47.9; skew-x: 10.8; skew-y: 10.8; scale-x: 0.795; scale-y: 0.795; }
        frame 136 { x: 7.9; y: 46.1; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 7.6; y: 45.4; skew-x: 15.6; skew-y: 15.6; scale-x: 0.794; scale-y: 0.794; }
        frame 138 { x: 7.2; y: 44.5; skew-x: 18.6; skew-y: 18.6; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 7.1; y: 43.8; skew-x: 21.6; skew-y: 21.6; }
        frame 140 { x: 0.9; y: 48.7; skew-x: 16.8; skew-y: 16.8; scale-x: 0.793; scale-y: 0.793; }
        frame 141 { x: -4.9; y: 53.9; skew-x: 12.3; skew-y: 12.3; scale-x: 0.792; scale-y: 0.792; }
        frame 142 { x: -10.8; y: 59.3; skew-x: 7.6; skew-y: 7.6; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: -17.2; y: 63.6; skew-x: 1.1; skew-y: 1.1; scale-x: 0.791; scale-y: 0.791; }
        frame 144 { x: -23.1; y: 68.3; skew-x: -5.1; skew-y: -5.1; scale-x: 0.79; scale-y: 0.79; }
        frame 145 { x: -34.4; y: 82.1; skew-x: -20.7; skew-y: -20.7; scale-x: 0.788; scale-y: 0.788; }
        frame 146 { x: -43.7; y: 97.2; skew-x: -36.7; skew-y: -36.7; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: -43.2; y: 104.6; skew-x: -44.3; skew-y: -46.8; scale-x: 0.73; scale-y: 0.779; }
        frame 148 { x: -42; y: 111.9; skew-x: -52.1; skew-y: -56.6; scale-x: 0.673; scale-y: 0.772; }
        frame 149 { x: -40.5; y: 119.1; skew-x: -59.7; skew-y: -66.6; scale-x: 0.617; scale-y: 0.766; }
        frame 150 { x: -40.6; y: 115.8; skew-x: -58.6; skew-y: -62.1; scale-x: 0.654; scale-y: 0.775; }
        frame 151 { x: -40.8; y: 112.5; skew-x: -57.5; skew-y: -57.5; scale-x: 0.693; scale-y: 0.787; }
        frame 152 { x: -40.6; y: 113.9; skew-x: -59.5; skew-y: -59.5; scale-x: 0.692; scale-y: 0.785; }
        frame 153 { x: -40.5; y: 115.2; skew-x: -61.3; skew-y: -61.3; scale-x: -10000; scale-y: 0.786; }
        frame 154 { x: -10000; y: 116.7; skew-x: -63.3; skew-y: -63.3; scale-x: 0.693; scale-y: 0.787; }
        frame 155 { x: 32.5; y: 24.8; skew-x: 0; skew-y: 0; scale-x: 0.799; scale-y: 0.799; }
        frame 156 { x: -10000; y: 26.4; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; }
        frame 157 { y: 28.1; skew-x: -1.7; skew-y: -1.7; }
        frame 158 { x: 32.4; y: 29.7; skew-x: -2.5; skew-y: -2.5; }
        frame 159 { x: 32.3; y: 31.4; skew-x: -3.4; skew-y: -3.4; }
        frame 160 { x: -10000; y: 33.1; skew-x: -4.4; skew-y: -4.4; }
        frame 161 { x: 32.4; y: 31.5; skew-x: -3.4; skew-y: -3.4; scale-y: 0.811; }
        frame 162 { x: 32.5; y: 29.8; skew-x: -2.5; skew-y: -2.5; scale-y: 0.823; }
        frame 163 { x: -10000; y: 28.1; skew-x: -1.5; skew-y: -1.5; scale-y: 0.815; }
        frame 164 { y: 26.5; skew-x: -0.7; skew-y: -0.7; scale-y: 0.807; }
        frame 165 { y: 24.8; skew-x: 0; skew-y: 0; scale-y: 0.799; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 166;
        frame 0 { x: 6.7; y: 8.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POGO_HEAD; }
        frame 1 { x: 8.4; y: 7.5; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 10.2; y: 6.2; skew-x: 1; skew-y: 1; }
        frame 3 { x: 11.9; y: 5; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 13.7; y: 3.6; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 15.5; y: 3.4; skew-x: 3.8; skew-y: 3.8; }
        frame 6 { x: 17.2; y: 3.3; skew-x: 5.3; skew-y: 5.3; }
        frame 7 { x: 19.1; y: 3.1; skew-x: 6.8; skew-y: 6.8; }
        frame 8 { x: 20.9; y: 3; skew-x: 8.3; skew-y: 8.3; scale-x: 0.798; scale-y: 0.798; }
        frame 9 { x: 22.7; y: 2.8; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 24.7; y: 2.6; skew-x: 11.6; skew-y: 11.6; }
        frame 11 { x: 24; y: 2.5; skew-x: 12.3; skew-y: 12.3; }
        frame 12 { x: 23.4; y: -10000; skew-x: 13.4; skew-y: 13.4; }
        frame 13 { x: 21.4; skew-x: 11.3; skew-y: 11.3; }
        frame 14 { x: 19.4; skew-x: 9.3; skew-y: 9.3; }
        frame 15 { x: 17.5; y: 2.6; skew-x: 7.3; skew-y: 7.3; }
        frame 16 { x: 15.5; y: 2.5; skew-x: 5.3; skew-y: 5.3; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: 13.1; y: 4.7; skew-x: 3; skew-y: 3; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 10.7; y: 6.7; skew-x: 0.8; skew-y: 0.8; }
        frame 19 { x: 8.4; y: 8.8; skew-x: -1.2; skew-y: -1.2; }
        frame 20 { x: 6; y: 11; skew-x: -3.4; skew-y: -3.4; }
        frame 21 { x: 3.6; y: 13.2; skew-x: -5.7; skew-y: -5.7; }
        frame 22 { x: 1.5; y: 15.4; skew-x: -7.9; skew-y: -7.9; scale-x: 0.8; scale-y: 0.8; }
        frame 23 { x: 1.2; y: 16; skew-x: -9.7; skew-y: -9.7; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { x: 0.9; y: 16.5; skew-x: -11.7; skew-y: -11.7; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 2.3; y: 14.5; skew-x: -8.7; skew-y: -8.7; }
        frame 26 { x: 3.6; y: 12.6; skew-x: -5.7; skew-y: -5.7; }
        frame 27 { x: 5.2; y: 10.6; skew-x: -2.7; skew-y: -2.7; scale-x: 0.8; scale-y: 0.8; }
        frame 28 { x: 6.7; y: 8.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 8.5; y: 6.1; skew-x: 4; skew-y: 4; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 10.4; y: 3.6; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 12.4; y: 1.2; skew-x: 12; skew-y: 12; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 14.5; y: -1.1; skew-x: 16.1; skew-y: 16.1; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 16.1; y: -1.6; skew-x: 17.8; skew-y: 17.8; scale-x: 0.797; scale-y: 0.797; }
        frame 35 { x: 17.6; y: -2.1; skew-x: 19.5; skew-y: 19.5; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 19.1; y: -2.5; skew-x: 21.3; skew-y: 21.3; }
        frame 37 { x: 20.6; y: -3; skew-x: 23; skew-y: 23; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 21.4; y: -3.5; skew-x: 23.8; skew-y: 23.8; scale-x: 0.797; scale-y: 0.797; }
        frame 39 { x: 22.1; y: -4; skew-x: 24.6; skew-y: 24.6; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 22.9; y: -4.5; skew-x: 25.5; skew-y: 25.5; }
        frame 41 { x: 23.7; y: -5; skew-x: 26.3; skew-y: 26.3; }
        frame 42 { x: 22.9; y: -3.9; skew-x: 26.1; skew-y: 25.8; scale-x: 0.796; scale-y: 0.796; }
        frame 43 { x: 22; y: -2.9; skew-x: 25.8; skew-y: 25.3; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 21.2; y: -1.8; skew-x: 25.5; skew-y: 24.8; }
        frame 45 { x: 20.3; y: -0.7; skew-x: 25.3; skew-y: 24.3; scale-x: 0.797; scale-y: 0.797; }
        frame 46 { x: 15.6; y: 1.7; skew-x: 19.6; skew-y: 18.8; scale-x: 0.796; scale-y: 0.796; }
        frame 47 { x: 11.3; y: 4.5; skew-x: 14; skew-y: 13.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 6.9; y: 7.5; skew-x: 8.3; skew-y: 8; }
        frame 49 { x: 2.6; y: 10.7; skew-x: 2.7; skew-y: 2.7; }
        frame 50 { x: 1.7; y: 10.5; skew-x: 1.3; skew-y: 1.3; scale-x: 0.795; scale-y: 0.795; }
        frame 51 { x: 0.9; y: 9.9; skew-x: 0.2; skew-y: 0.2; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 2.5; y: 6.2; skew-x: 6.3; skew-y: 6.3; }
        frame 53 { x: 4.5; y: 2.7; skew-x: 12.3; skew-y: 12.3; scale-x: 0.796; scale-y: 0.796; }
        frame 54 { x: 6.8; y: 1.8; skew-x: 13.5; skew-y: 13.5; scale-x: 0.795; scale-y: 0.795; }
        frame 55 { x: 9.2; y: 1; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 11.6; y: 0; skew-x: 16.3; skew-y: 16.3; }
        frame 57 { x: 13.9; y: -0.7; skew-x: 17.6; skew-y: 17.6; scale-x: 0.796; scale-y: 0.796; }
        frame 58 { x: 16.6; y: -1.6; skew-x: 19; skew-y: 19; scale-x: 0.795; scale-y: 0.795; }
        frame 59 { x: 19.1; y: -2.5; skew-x: 20.3; skew-y: 20.3; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 21.9; y: -3.5; skew-x: 21.8; skew-y: 21.8; }
        frame 61 { x: 24.6; y: -4.5; skew-x: 23.4; skew-y: 23.4; }
        frame 62 { x: 25.3; y: -4.7; skew-x: 24.6; skew-y: 24.6; scale-x: 0.794; scale-y: 0.794; }
        frame 63 { x: 26.2; y: -4.8; skew-x: 25.8; skew-y: 25.8; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 26.8; y: -4.9; skew-x: 26.8; skew-y: 26.8; }
        frame 65 { x: 27.6; y: -5.2; skew-x: 28.1; skew-y: 28.1; scale-x: 0.795; scale-y: 0.795; }
        frame 66 { x: 21.9; y: -2.9; skew-x: 22.8; skew-y: 22.8; scale-x: 0.794; scale-y: 0.794; }
        frame 67 { x: 16.3; y: -0.5; skew-x: 17.6; skew-y: 17.6; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 10.7; y: 2; skew-x: 12.3; skew-y: 12.3; }
        frame 69 { x: 5.5; y: 4.8; skew-x: 7.2; skew-y: 7.2; }
        frame 70 { x: 5.6; y: 5.5; skew-x: 6; skew-y: 6; scale-x: 0.795; scale-y: 0.795; }
        frame 71 { x: 5.8; y: 6.2; skew-x: 4.8; skew-y: 4.8; scale-x: 0.796; scale-y: 0.796; }
        frame 72 { x: 6; y: 6.9; skew-x: 3.5; skew-y: 3.5; scale-x: 0.797; scale-y: 0.797; }
        frame 73 { x: 6.1; y: 7.6; skew-x: 2.3; skew-y: 2.3; scale-x: 0.798; scale-y: 0.798; }
        frame 74 { x: 6.3; y: 8.3; skew-x: 1.1; skew-y: 1.1; scale-x: 0.799; scale-y: 0.799; }
        frame 75 { x: 6.7; y: 8.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 7.3; y: 8.4; scale-x: 0.791; scale-y: 0.805; }
        frame 78 { x: 8.1; y: 8; scale-x: 0.781; scale-y: 0.811; }
        frame 79 { x: 8.7; y: 7.7; scale-x: 0.772; scale-y: 0.816; }
        frame 80 { x: 9.4; y: 7.3; scale-x: 0.762; scale-y: 0.822; }
        frame 81 { x: 8.2; y: 7.8; scale-x: 0.775; scale-y: 0.815; }
        frame 82 { x: 7; y: 8.3; scale-x: 0.787; scale-y: 0.807; }
        frame 83 { x: 5.8; y: 9; scale-x: 0.8; scale-y: 0.8; }
        frame 84 { x: 5.2; y: 9.6; scale-x: 0.805; scale-y: 0.795; }
        frame 85 { x: 4.6; y: 10.1; skew-x: -0.1; skew-y: -0.2; scale-x: 0.809; scale-y: 0.789; }
        frame 86 { x: 4; y: 10.7; skew-x: -0.2; skew-y: -10000; scale-x: 0.814; scale-y: 0.784; }
        frame 87 { x: 3.3; y: 11.4; skew-x: -0.4; skew-y: -0.4; scale-x: 0.819; scale-y: 0.779; }
        frame 88 { x: 2.6; y: 11.9; skew-x: -10000; skew-y: -10000; scale-x: 0.823; scale-y: 0.774; }
        frame 89 { x: 2; y: 12.6; skew-x: -0.7; skew-y: -0.7; scale-x: 0.828; scale-y: 0.769; }
        frame 90 { x: 2.8; y: 11.9; skew-x: -0.4; skew-y: -0.4; scale-x: 0.823; scale-y: 0.774; }
        frame 91 { x: 3.5; y: 11.3; skew-x: -10000; skew-y: -10000; scale-x: 0.819; scale-y: 0.779; }
        frame 92 { x: 4.3; y: 10.7; skew-x: -0.2; skew-y: -0.2; scale-x: 0.814; scale-y: 0.784; }
        frame 93 { x: 5.1; y: 10; skew-x: -10000; skew-y: -10000; scale-x: 0.809; scale-y: 0.789; }
        frame 94 { x: 5.9; y: 9.4; skew-x: 0; skew-y: 0; scale-x: 0.805; scale-y: 0.795; }
        frame 95 { x: 6.7; y: 8.8; skew-x: -10000; skew-y: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 96 { x: 7.2; y: 8.5; scale-x: 0.792; scale-y: 0.804; }
        frame 97 { x: 7.8; y: 8.2; scale-x: 0.785; scale-y: 0.809; }
        frame 98 { x: 8.3; y: 7.9; scale-x: 0.777; scale-y: 0.813; }
        frame 99 { x: 8.9; y: 7.6; scale-x: 0.77; scale-y: 0.818; }
        frame 100 { x: 9.4; y: 7.3; scale-x: 0.762; scale-y: 0.822; }
        frame 101 { x: 8.2; y: 7.8; scale-x: 0.775; scale-y: 0.815; }
        frame 102 { x: 7; y: 8.3; scale-x: 0.787; scale-y: 0.807; }
        frame 103 { x: 5.8; y: 9; scale-x: 0.8; scale-y: 0.8; }
        frame 104 { x: 5.2; y: 9.6; scale-x: 0.805; scale-y: 0.795; }
        frame 105 { x: 4.6; y: 10.1; skew-x: -0.1; skew-y: -0.2; scale-x: 0.809; scale-y: 0.789; }
        frame 106 { x: 4; y: 10.7; skew-x: -0.2; skew-y: -10000; scale-x: 0.814; scale-y: 0.784; }
        frame 107 { x: 3.3; y: 11.4; skew-x: -0.4; skew-y: -0.4; scale-x: 0.819; scale-y: 0.779; }
        frame 108 { x: 2.6; y: 11.9; skew-x: -10000; skew-y: -10000; scale-x: 0.823; scale-y: 0.774; }
        frame 109 { x: 2; y: 12.6; skew-x: -0.7; skew-y: -0.7; scale-x: 0.828; scale-y: 0.769; }
        frame 110 { x: 2.8; y: 11.9; skew-x: -0.4; skew-y: -0.4; scale-x: 0.823; scale-y: 0.774; }
        frame 111 { x: 3.5; y: 11.3; skew-x: -10000; skew-y: -10000; scale-x: 0.819; scale-y: 0.779; }
        frame 112 { x: 4.3; y: 10.7; skew-x: -0.2; skew-y: -0.2; scale-x: 0.814; scale-y: 0.784; }
        frame 113 { x: 5.1; y: 10; skew-x: -10000; skew-y: -10000; scale-x: 0.809; scale-y: 0.789; }
        frame 114 { x: 5.9; y: 9.4; skew-x: 0; skew-y: 0; scale-x: 0.805; scale-y: 0.795; }
        frame 115 { x: 6.7; y: 8.8; skew-x: -10000; skew-y: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 116 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 117 { cel: -10000; }
        frame 155 { x: 4.7; y: 8.4; skew-x: -8; skew-y: -8; cel: 0; }
        frame 156 { x: 5.3; y: 8.9; skew-x: -6.2; skew-y: -6.2; scale-x: 0.799; scale-y: 0.799; cel: -10000; }
        frame 157 { x: 5.8; y: 9.4; skew-x: -4.6; skew-y: -4.6; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 5.3; y: 12.2; skew-x: -7; skew-y: -7; }
        frame 159 { x: 4.6; y: 15.2; skew-x: -9.7; skew-y: -9.7; }
        frame 160 { x: 3.9; y: 18; skew-x: -12.2; skew-y: -12.2; }
        frame 161 { x: 4.1; y: 16.9; skew-x: -11.2; skew-y: -11.2; }
        frame 162 { x: 4.2; y: 15.8; skew-x: -10.4; skew-y: -10.4; }
        frame 163 { x: 4.5; y: 13.3; skew-x: -9.5; skew-y: -9.5; }
        frame 164 { x: 4.6; y: 10.9; skew-x: -8.7; skew-y: -8.7; }
        frame 165 { x: 4.7; y: 8.4; skew-x: -8; skew-y: -8; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 166;
        frame 0 { x: 13.5; y: 40.6; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POGO_JAW; }
        frame 1 { x: 15.1; y: 39; skew-x: 1; skew-y: 2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 16.8; y: 37.5; skew-x: 2.3; skew-y: 4.3; scale-y: 0.799; }
        frame 3 { x: 18.5; y: 36; skew-x: 3.5; skew-y: 6.3; scale-y: -10000; }
        frame 4 { x: 20.2; y: 34.4; skew-x: 4.7; skew-y: 8.5; scale-x: 0.801; }
        frame 5 { x: 20.9; y: 35; skew-x: 4.8; skew-y: 7.8; scale-x: 0.8; scale-y: 0.798; }
        frame 6 { x: 21.6; y: 35.5; skew-x: -10000; skew-y: 7.3; scale-x: 0.799; scale-y: -10000; }
        frame 7 { x: 22.3; y: 36; skew-y: 6.8; scale-x: -10000; }
        frame 8 { x: 22.9; y: 36.6; skew-y: 6.1; scale-x: 0.798; }
        frame 9 { x: 23.6; y: 37.1; skew-y: 5.5; scale-x: -10000; }
        frame 10 { x: 24.3; y: 37.5; skew-x: 5; skew-y: 5; }
        frame 11 { x: 23.3; y: 37.1; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 12 { x: 22.3; y: 36.6; skew-x: 5.1; skew-y: 5.1; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 21.5; y: 35.5; skew-x: 6.6; skew-y: 6.6; }
        frame 14 { x: 20.8; y: 34.3; skew-x: 8.3; skew-y: 8.3; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 20.1; y: 33; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 19.6; y: 32; skew-x: 11.6; skew-y: 11.6; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: 18.3; y: 34.3; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 17.1; y: 36.5; skew-x: 5; skew-y: 5; }
        frame 19 { x: 15.9; y: 38.9; skew-x: 1.8; skew-y: 1.8; }
        frame 20 { x: 14.8; y: 41.1; skew-x: -1.2; skew-y: -1.2; }
        frame 21 { x: 13.7; y: 43.5; skew-x: -4.7; skew-y: -4.7; }
        frame 22 { x: 12.7; y: 45.9; skew-x: -7.9; skew-y: -7.9; scale-x: 0.8; scale-y: 0.8; }
        frame 23 { x: 13.2; y: 47; skew-x: -12.7; skew-y: -12.7; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { x: 13.8; y: 48.4; skew-x: -17.5; skew-y: -17.5; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 13.6; y: 46.4; skew-x: -13; skew-y: -13; }
        frame 26 { x: -10000; y: 44.5; skew-x: -8.7; skew-y: -8.7; }
        frame 27 { x: 13.5; y: 42.5; skew-x: -4.2; skew-y: -4.2; scale-x: 0.8; scale-y: 0.8; }
        frame 28 { x: -10000; y: 40.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 29 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 12.8; y: 38.7; skew-x: 2.8; skew-y: 2.8; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 12.2; y: 36.9; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 11.7; y: 35; skew-x: 8.3; skew-y: 8.3; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 11.3; y: 33.3; skew-x: 11.1; skew-y: 11.1; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 11.5; y: 33.2; skew-x: 11.3; skew-y: 12.3; scale-y: 0.797; }
        frame 35 { x: 11.8; y: 33; skew-x: -10000; skew-y: 13.3; scale-y: -10000; }
        frame 36 { x: 11.9; y: 32.9; skew-x: 11.5; skew-y: 14.5; scale-x: 0.799; }
        frame 37 { x: 12.1; y: 32.4; skew-x: 11.8; skew-y: 15.7; scale-x: -10000; scale-y: 0.798; }
        frame 38 { x: 12.3; y: 31.8; skew-x: -10000; skew-y: 15.6; scale-y: 0.797; }
        frame 39 { x: 12.6; y: 31.2; skew-y: -10000; scale-y: -10000; }
        frame 40 { x: 12.9; y: 30.6; }
        frame 41 { x: 13.2; y: 29.9; skew-y: 15.7; scale-y: 0.798; }
        frame 42 { x: 12.9; y: 31.3; skew-x: 12; skew-y: 16; scale-y: 0.797; }
        frame 43 { x: 12.6; y: 32.5; skew-x: 12.3; skew-y: 16.3; scale-x: 0.798; scale-y: 0.796; }
        frame 44 { x: 12.2; y: 33.9; skew-x: 12.8; skew-y: 16.6; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 11.9; y: 35.3; skew-x: 13.1; skew-y: 17; }
        frame 46 { x: 10.4; y: 37.3; skew-x: 7.8; skew-y: 10.8; scale-x: 0.81; scale-y: 0.795; }
        frame 47 { x: 8.9; y: 39.5; skew-x: 2.8; skew-y: 4.5; scale-x: 0.823; scale-y: 0.794; }
        frame 48 { x: 7.5; y: 41.6; skew-x: -2.2; skew-y: -1.4; scale-x: 0.835; scale-y: 0.793; }
        frame 49 { x: 6.3; y: 44.1; skew-x: -7.4; skew-y: -7.8; scale-x: 0.848; scale-y: 0.792; }
        frame 50 { x: -10000; y: 44.3; skew-x: -9.9; skew-y: -10.4; scale-x: 0.847; scale-y: -10000; }
        frame 51 { x: 6.5; y: 44.4; skew-x: -12.7; skew-y: -13.2; scale-x: -10000; }
        frame 52 { x: 4.8; y: 41.8; skew-x: -8.2; skew-y: -8.7; }
        frame 53 { x: 3; y: 39.3; skew-x: -3.8; skew-y: -4.3; scale-x: 0.848; scale-y: 0.793; }
        frame 54 { x: 4.5; y: 38.3; skew-x: -2.4; skew-y: -2.9; scale-x: -10000; scale-y: 0.792; }
        frame 55 { x: 6; y: 37.3; skew-x: -1.2; skew-y: -1.5; scale-y: -10000; }
        frame 56 { x: 7.5; y: 36.4; skew-x: 0; skew-y: -0.2; }
        frame 57 { x: 9.1; y: 35.4; skew-x: 1.3; skew-y: 0.9; }
        frame 58 { x: 10.9; y: 34.3; skew-x: 2.8; skew-y: 2.3; }
        frame 59 { x: 12.6; y: 33.1; skew-x: 4.1; skew-y: 3.8; }
        frame 60 { x: 14.3; y: 32; skew-x: 5.5; skew-y: 5.3; }
        frame 61 { x: 16.1; y: 30.8; skew-x: 7.1; skew-y: 6.7; }
        frame 62 { x: 16.4; y: 30.7; skew-x: 7.5; skew-y: 7.8; }
        frame 63 { x: 16.7; y: -10000; skew-x: 7.8; skew-y: 9; }
        frame 64 { x: 17; y: 30.5; skew-x: 8.3; skew-y: 10.3; }
        frame 65 { x: 17.2; y: -10000; skew-x: 8.6; skew-y: 11.5; scale-x: 0.849; }
        frame 66 { x: 15; y: 32.6; skew-x: 4.5; skew-y: 7.3; scale-x: 0.848; scale-y: 0.791; }
        frame 67 { x: 12.9; y: 34.8; skew-x: 0.5; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 10.9; y: 37; skew-x: -3.2; skew-y: -0.4; scale-x: 0.847; }
        frame 69 { x: 8.9; y: 39.1; skew-x: -7.4; skew-y: -4.6; scale-x: -10000; }
        frame 70 { x: 9.6; y: 39.4; skew-x: -6.2; skew-y: -3.7; scale-x: 0.839; scale-y: 0.792; }
        frame 71 { x: 10.5; y: 39.5; skew-x: -4.9; skew-y: -2.9; scale-x: 0.831; scale-y: 0.794; }
        frame 72 { x: 11.2; y: 39.9; skew-x: -3.7; skew-y: -2.2; scale-x: 0.823; scale-y: 0.795; }
        frame 73 { x: 12.1; y: 40.2; skew-x: -2.4; skew-y: -1.4; scale-x: 0.816; scale-y: 0.797; }
        frame 74 { x: 12.9; y: 40.5; skew-x: -1.2; skew-y: -0.7; scale-x: 0.808; scale-y: 0.798; }
        frame 75 { x: 13.5; y: 40.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 13.8; y: 41; skew-x: -1.7; skew-y: -1.9; scale-x: 0.804; scale-y: 0.821; }
        frame 78 { x: 14; y: 41.5; skew-x: -3.4; skew-y: -4.2; scale-x: 0.809; scale-y: 0.841; }
        frame 79 { x: 14.4; y: 42; skew-x: -5.2; skew-y: -6.2; scale-x: 0.813; scale-y: 0.862; }
        frame 80 { x: 14.8; y: 42.6; skew-x: -7.2; skew-y: -8.4; scale-x: 0.818; scale-y: 0.883; }
        frame 81 { x: 13.2; y: 42.1; skew-x: -4.9; skew-y: -5.4; scale-x: 0.837; scale-y: 0.855; }
        frame 82 { x: 11.5; y: 41.5; skew-x: -2.7; skew-y: -2.7; scale-x: 0.856; scale-y: 0.827; }
        frame 83 { x: 9.6; y: 41; skew-x: -0.7; skew-y: 0; scale-x: 0.875; scale-y: 0.8; }
        frame 84 { x: 9.7; y: 40.6; skew-x: -0.9; skew-y: -10000; scale-x: 0.865; scale-y: -10000; }
        frame 85 { x: 9.9; y: 40.2; skew-x: -1.2; skew-y: -0.2; scale-x: 0.856; }
        frame 86 { x: 10; y: 40; skew-x: -1.7; skew-y: -0.6; scale-x: 0.847; }
        frame 87 { x: 10.1; y: 39.9; skew-x: -1.2; skew-y: -0.4; scale-x: 0.838; scale-y: 0.805; }
        frame 88 { x: 10.2; y: 39.8; skew-x: -0.7; skew-y: -0.2; scale-x: 0.829; scale-y: 0.81; }
        frame 89 { x: 10.3; y: -10000; skew-x: -0.3; skew-y: -0.1; scale-x: 0.82; scale-y: 0.816; }
        frame 90 { x: 11.8; y: 39.6; skew-x: -0; skew-y: 1; scale-x: 0.79; scale-y: 0.814; }
        frame 91 { x: 13.3; y: -10000; skew-x: 0; skew-y: 2.3; scale-x: 0.76; scale-y: 0.812; }
        frame 92 { x: 14.7; y: 39.5; skew-x: 0.1; skew-y: 3.5; scale-x: 0.73; scale-y: 0.811; }
        frame 93 { x: 14.2; y: 39.9; skew-x: 0; skew-y: 2.3; scale-x: 0.753; scale-y: 0.807; }
        frame 94 { x: 13.9; y: 40.3; skew-x: -10000; skew-y: 1; scale-x: 0.776; scale-y: 0.804; }
        frame 95 { x: 13.5; y: 40.6; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 96 { x: 13.7; y: 40.9; skew-x: -1.2; skew-y: -1.5; scale-x: 0.804; scale-y: 0.817; }
        frame 97 { x: 14; y: 41.3; skew-x: -2.7; skew-y: -3.2; scale-x: 0.807; scale-y: 0.833; }
        frame 98 { x: 14.3; y: 41.8; skew-x: -4.2; skew-y: -4.9; scale-x: 0.811; scale-y: 0.85; }
        frame 99 { x: 14.4; y: 42; skew-x: -5.7; skew-y: -6.7; scale-x: 0.814; scale-y: 0.866; }
        frame 100 { x: 14.8; y: 42.6; skew-x: -7.2; skew-y: -8.4; scale-x: 0.818; scale-y: 0.883; }
        frame 101 { x: 13.2; y: 42.1; skew-x: -4.9; skew-y: -5.4; scale-x: 0.837; scale-y: 0.855; }
        frame 102 { x: 11.5; y: 41.5; skew-x: -2.7; skew-y: -2.7; scale-x: 0.856; scale-y: 0.827; }
        frame 103 { x: 9.6; y: 41; skew-x: -0.7; skew-y: 0; scale-x: 0.875; scale-y: 0.8; }
        frame 104 { x: 9.7; y: 40.6; skew-x: -0.9; skew-y: -10000; scale-x: 0.865; scale-y: -10000; }
        frame 105 { x: 9.9; y: 40.2; skew-x: -1.2; skew-y: -0.2; scale-x: 0.856; }
        frame 106 { x: 10; y: 40; skew-x: -1.7; skew-y: -0.6; scale-x: 0.847; }
        frame 107 { x: 10.1; y: 39.9; skew-x: -1.2; skew-y: -0.4; scale-x: 0.838; scale-y: 0.805; }
        frame 108 { x: 10.2; y: 39.8; skew-x: -0.7; skew-y: -0.2; scale-x: 0.829; scale-y: 0.81; }
        frame 109 { x: 10.3; y: -10000; skew-x: -0.3; skew-y: -0.1; scale-x: 0.82; scale-y: 0.816; }
        frame 110 { x: 11.8; y: 39.6; skew-x: -0; skew-y: 1; scale-x: 0.79; scale-y: 0.814; }
        frame 111 { x: 13.3; y: -10000; skew-x: 0; skew-y: 2.3; scale-x: 0.76; scale-y: 0.812; }
        frame 112 { x: 14.7; y: 39.5; skew-x: 0.1; skew-y: 3.5; scale-x: 0.73; scale-y: 0.811; }
        frame 113 { x: 14.2; y: 39.9; skew-x: 0; skew-y: 2.3; scale-x: 0.753; scale-y: 0.807; }
        frame 114 { x: 13.9; y: 40.3; skew-x: -10000; skew-y: 1; scale-x: 0.776; scale-y: 0.804; }
        frame 115 { x: 13.5; y: 40.6; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 116 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 117 { cel: -10000; }
        frame 155 { x: 16.9; y: 38.5; skew-x: -7.5; skew-y: -7.5; scale-x: 0.799; scale-y: 0.799; cel: 0; }
        frame 156 { x: 16.6; y: 38.9; skew-x: -4.4; skew-y: -4.4; scale-x: 0.798; scale-y: 0.798; cel: -10000; }
        frame 157 { x: 16.5; y: 39.1; skew-x: -1.6; skew-y: -1.6; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 17; y: 42.9; skew-x: -4.9; skew-y: -4.9; }
        frame 159 { x: 17.7; y: 46.5; skew-x: -8.2; skew-y: -8.2; }
        frame 160 { x: 18.3; y: 50.1; skew-x: -11.7; skew-y: -11.7; scale-x: 0.799; scale-y: 0.799; }
        frame 161 { x: 18.1; y: 49.4; skew-x: -10.7; skew-y: -10.7; scale-x: 0.798; scale-y: 0.798; }
        frame 162 { x: 17.8; y: 48.5; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 17.5; y: 45.1; skew-x: -9; skew-y: -9; }
        frame 164 { x: 17.2; y: 41.9; skew-x: -8.2; skew-y: -8.2; }
        frame 165 { x: 16.9; y: 38.5; skew-x: -7.5; skew-y: -7.5; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "anim_head_glasses";
        frame-count: 166;
        frame 0 { x: 5.4; y: 27.8; skew-x: 355.2; skew-y: 355.2; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_PAPER_GLASSES; }
        frame 1 { x: 7; y: 26.3; skew-x: 357; skew-y: 357; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 8.8; y: 24.8; skew-x: 358.7; skew-y: 358.7; }
        frame 3 { x: 10.4; y: 23.3; skew-x: 360; skew-y: 360; }
        frame 4 { x: 12.1; y: 21.7; skew-x: 361.8; skew-y: 361.8; }
        frame 5 { x: 13.3; y: 21.6; skew-x: -10000; skew-y: -10000; }
        frame 6 { x: 14.5; y: 21.5; }
        frame 7 { x: 15.8; y: -10000; skew-x: 362; skew-y: 362; }
        frame 8 { x: 16.9; y: 21.4; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; }
        frame 9 { x: 18.2; y: -10000; skew-x: 362.1; skew-y: 362.1; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 19.3; y: 21.2; skew-x: 362.3; skew-y: 362.3; }
        frame 11 { x: 18.9; y: 21.1; skew-x: 364; skew-y: 364; }
        frame 12 { x: 18.5; y: 20.8; skew-x: 366; skew-y: 366; }
        frame 13 { x: 17; y: 20.9; skew-x: 364.8; skew-y: 364.8; }
        frame 14 { x: 15.3; y: -10000; skew-x: 363.8; skew-y: 363.8; }
        frame 15 { x: 13.8; skew-x: 362.8; skew-y: 362.8; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 12.4; skew-x: 361.8; skew-y: 361.8; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 10.8; y: 23.2; skew-x: 360; skew-y: 360; }
        frame 18 { x: 9.3; y: 25.3; skew-x: 358.7; skew-y: 358.7; }
        frame 19 { x: 7.8; y: 27.5; skew-x: 357; skew-y: 357; }
        frame 20 { x: 6.3; y: 29.7; skew-x: 355.4; skew-y: 355.4; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 4.8; y: 31.9; skew-x: 353.7; skew-y: 353.7; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 3.2; y: 34; skew-x: 352; skew-y: 352; }
        frame 23 { x: 3.6; y: 33.3; skew-x: 353.7; skew-y: 353.7; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { x: 4.2; y: 32.8; skew-x: 355.2; skew-y: 355.2; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 4.5; y: 31.6; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 4.8; y: 30.4; }
        frame 27 { x: 5.1; y: 29.1; }
        frame 28 { x: 5.4; y: 27.8; }
        frame 29 { x: -10000; y: -10000; }
        frame 30 { x: 5.8; y: 24.9; skew-x: 359.7; skew-y: 359.7; }
        frame 31 { x: 6.3; y: 22.3; skew-x: 363.8; skew-y: 363.8; }
        frame 32 { x: 7; y: 19.6; skew-x: 368; skew-y: 368; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 7.7; y: 16.8; skew-x: 372.4; skew-y: 372.4; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 9.2; y: 15.5; skew-x: 375.8; skew-y: 375.8; }
        frame 35 { x: 10.8; y: 14.3; skew-x: 379.3; skew-y: 379.3; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: 12.3; y: 13; skew-x: 382.8; skew-y: 382.8; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 13.9; y: 11.8; skew-x: 386.4; skew-y: 386.4; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 14.1; y: 11.6; skew-x: 386.3; skew-y: 386.3; scale-x: 0.796; scale-y: 0.796; }
        frame 39 { x: 14.4; y: 11.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 14.6; y: 10.7; }
        frame 41 { x: 14.9; y: 10.4; scale-x: 0.797; scale-y: 0.797; }
        frame 42 { x: 14.2; y: 11.7; skew-x: 385; skew-y: 385; scale-x: 0.796; scale-y: 0.796; }
        frame 43 { x: 13.3; y: 13; skew-x: 383.6; skew-y: 383.6; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 12.6; y: 14.2; skew-x: 382.3; skew-y: 382.3; }
        frame 45 { x: 11.8; y: 15.3; skew-x: 381.1; skew-y: 381.1; scale-x: 0.798; scale-y: 0.798; }
        frame 46 { x: 8.3; y: 19.4; skew-x: 374.6; skew-y: 374.6; scale-x: 0.796; scale-y: 0.796; }
        frame 47 { x: 5; y: 23.6; skew-x: 368; skew-y: 368; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 2; y: 27.9; skew-x: 361.5; skew-y: 361.5; scale-x: 0.795; scale-y: 0.795; }
        frame 49 { x: -0.5; y: 32.3; skew-x: 355.2; skew-y: 355.2; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: -0.2; y: 31.3; skew-x: 356.7; skew-y: 356.7; }
        frame 51 { x: -0.1; y: 30.3; skew-x: 357.9; skew-y: 357.9; scale-x: 0.796; scale-y: 0.796; }
        frame 52 { x: -1; y: 25.9; skew-x: 360.3; skew-y: 360.3; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: -1.7; y: 21.4; skew-x: 362.9; skew-y: 362.9; scale-x: 0.797; scale-y: 0.797; }
        frame 54 { x: 0.3; y: 19.9; skew-x: 366.3; skew-y: 366.3; scale-x: 0.796; scale-y: 0.796; }
        frame 55 { x: 2.8; y: 18.3; skew-x: 369.5; skew-y: 369.5; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 5.2; y: 16.8; skew-x: 372.8; skew-y: 372.8; scale-x: 0.795; scale-y: 0.795; }
        frame 57 { x: 7.7; y: 15.4; skew-x: 376.3; skew-y: 376.3; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 9.8; y: 14.4; skew-x: 376.8; skew-y: 376.8; }
        frame 59 { x: 11.9; y: 13.5; skew-x: 377.3; skew-y: 377.3; scale-x: 0.796; scale-y: 0.796; }
        frame 60 { x: 13.9; y: 12.5; skew-x: 377.8; skew-y: 377.8; scale-x: 0.797; scale-y: 0.797; }
        frame 61 { x: 16.1; y: 11.2; skew-x: 378.4; skew-y: 378.4; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: 16.5; y: 11.1; skew-x: 379.3; skew-y: 379.3; scale-x: 0.797; scale-y: 0.797; }
        frame 63 { x: 16.8; y: 10.9; skew-x: 380.3; skew-y: 380.3; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 17.3; y: 10.6; skew-x: 381.3; skew-y: 381.3; }
        frame 65 { x: 17.6; y: 10.3; skew-x: 382.4; skew-y: 382.4; scale-x: 0.798; scale-y: 0.798; }
        frame 66 { x: 13.3; y: 13.9; skew-x: 376.8; skew-y: 376.8; scale-x: 0.796; scale-y: 0.796; }
        frame 67 { x: 9.1; y: 17.5; skew-x: 371.1; skew-y: 371.1; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 5.2; y: 21.2; skew-x: 365.5; skew-y: 365.5; scale-x: 0.795; scale-y: 0.795; }
        frame 69 { x: 1.4; y: 24.9; skew-x: 360.1; skew-y: 360.1; scale-x: 0.794; scale-y: 0.794; }
        frame 70 { x: 2; y: 25.3; skew-x: 359.3; skew-y: 359.3; scale-x: 0.795; scale-y: 0.795; }
        frame 71 { x: 2.6; y: 25.7; skew-x: 358.5; skew-y: 358.5; scale-x: 0.796; scale-y: 0.796; }
        frame 72 { x: 3.3; y: 26.3; skew-x: 357.7; skew-y: 357.7; scale-x: 0.797; scale-y: 0.797; }
        frame 73 { x: 4; y: 26.7; skew-x: 357; skew-y: 357; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 4.7; y: 27.1; skew-x: 356.2; skew-y: 356.2; scale-x: 0.798; scale-y: 0.798; }
        frame 75 { x: 5.4; y: 27.8; skew-x: 355.2; skew-y: 355.2; scale-x: 0.799; scale-y: 0.799; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 5.7; y: 27.9; scale-x: 0.793; }
        frame 78 { x: 6; y: -10000; scale-x: 0.787; }
        frame 79 { x: 6.3; y: 27.8; scale-x: 0.781; }
        frame 80 { x: 6.6; y: -10000; scale-x: 0.775; }
        frame 81 { x: 6.9; scale-x: 0.769; }
        frame 82 { x: 6.1; y: 27.9; scale-x: 0.777; }
        frame 83 { x: 5.3; y: -10000; scale-x: 0.785; }
        frame 84 { x: 4.3; y: 28; scale-x: 0.793; }
        frame 85 { x: 3.5; y: -10000; scale-x: 0.801; }
        frame 86 { x: 2.6; y: 28.1; scale-x: 0.81; }
        frame 87 { x: 2.3; y: 28.4; scale-x: -10000; }
        frame 88 { x: 1.8; y: 28.7; }
        frame 89 { x: 1.4; y: 28.9; }
        frame 90 { x: -10000; y: 29.3; }
        frame 91 { y: 29.6; }
        frame 92 { x: 2.2; y: 29.3; }
        frame 93 { x: 3; y: 29; }
        frame 94 { x: 3.9; y: 28.6; }
        frame 95 { x: 4.8; y: 28.3; }
        frame 96 { x: 5.6; y: 27.9; }
        frame 97 { x: 5.8; y: -10000; scale-x: 0.801; }
        frame 98 { x: 6.2; scale-x: 0.793; }
        frame 99 { x: 6.4; scale-x: 0.785; }
        frame 100 { x: 6.7; scale-x: 0.777; }
        frame 101 { x: 6.9; y: 27.8; scale-x: 0.769; }
        frame 102 { x: 6.1; y: 28.1; scale-x: 0.773; }
        frame 103 { x: 5.1; y: 28.4; scale-x: 0.777; }
        frame 104 { x: 4.2; y: 28.6; scale-x: 0.781; }
        frame 105 { x: 3.3; y: 29; scale-x: 0.786; }
        frame 106 { x: 2.9; y: 29.1; scale-x: 0.793; }
        frame 107 { x: 2.5; y: 29.3; scale-x: 0.8; }
        frame 108 { x: 2; y: -10000; scale-x: 0.808; }
        frame 109 { x: 1.5; scale-x: 0.815; }
        frame 110 { x: 1.9; y: 29.6; scale-x: -10000; }
        frame 111 { x: 2.3; y: 29.8; }
        frame 112 { x: 3; y: 29.4; scale-x: 0.811; }
        frame 113 { x: 3.8; y: 29; scale-x: 0.807; }
        frame 114 { x: 4.5; y: 28.6; scale-x: 0.803; }
        frame 115 { x: 5.4; y: 27.8; scale-x: 0.799; }
        frame 116 { x: -10000; y: -10000; scale-x: -10000; cel: -1; }
        frame 117 { cel: -10000; }
        frame 155 { x: 6; y: 27.9; skew-x: 344.2; skew-y: 344.2; scale-x: 0.798; scale-y: 0.798; cel: 0; }
        frame 156 { x: 6.1; y: 27.2; skew-x: 348.2; skew-y: 348.2; scale-x: 0.797; scale-y: 0.797; cel: -10000; }
        frame 157 { x: 6.3; y: 26.6; skew-x: 352.3; skew-y: 352.3; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: -10000; y: 30.6; skew-x: 348.2; skew-y: 348.2; }
        frame 159 { y: 34.5; skew-x: 344.2; skew-y: 344.2; }
        frame 160 { x: 6.6; y: 38.6; skew-x: 339.9; skew-y: 339.9; scale-x: 0.798; scale-y: 0.798; }
        frame 161 { x: 6.4; y: 38.4; skew-x: 340.9; skew-y: 340.9; scale-x: 0.797; scale-y: 0.797; }
        frame 162 { x: 6.1; y: 38.3; skew-x: 341.7; skew-y: 341.7; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: -10000; y: 34.7; skew-x: 342.7; skew-y: 342.7; }
        frame 164 { y: 31.4; skew-x: 343.4; skew-y: 343.4; }
        frame 165 { x: 6; y: 27.9; skew-x: 344.2; skew-y: 344.2; scale-x: 0.798; scale-y: 0.798; }
    }
    Track {
        source-name: "anim_hair";
        frame-count: 166;
        frame 0 { x: 3.1; y: 6; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POGO_HAIR; }
        frame 1 { x: 5; y: 4.5; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 6.8; y: 3; skew-x: 1; skew-y: 1; }
        frame 3 { x: 8.7; y: 1.6; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 10.6; y: 0; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 12.6; y: -0; skew-x: 3.8; skew-y: 3.8; }
        frame 6 { x: 14.7; y: -10000; skew-x: 5.3; skew-y: 5.3; }
        frame 7 { x: 16.7; y: -0.1; skew-x: 6.8; skew-y: 6.8; }
        frame 8 { x: 18.8; y: -0.3; skew-x: 8.3; skew-y: 8.3; scale-x: 0.798; scale-y: 0.798; }
        frame 9 { x: 20.9; y: -0.4; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 23.1; y: -0.5; skew-x: 11.6; skew-y: 11.6; }
        frame 11 { x: 23.4; y: -0.2; skew-x: 12.3; skew-y: 16.1; scale-y: 0.801; }
        frame 12 { x: 23.8; y: -10000; skew-x: 13.4; skew-y: 20.7; scale-y: 0.805; }
        frame 13 { x: 21; y: -0.5; skew-x: 11.3; skew-y: 16.8; scale-y: 0.803; }
        frame 14 { x: 18.2; y: -0.7; skew-x: 9.3; skew-y: 13; scale-y: 0.801; }
        frame 15 { x: 15.3; y: -1; skew-x: 7.3; skew-y: 9.1; scale-y: 0.8; }
        frame 16 { x: 12.5; y: -1.1; skew-x: 5.3; skew-y: 5.3; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: 9.9; y: 1.2; skew-x: 3; skew-y: 3; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 7.3; y: 3.5; skew-x: 0.8; skew-y: 0.8; }
        frame 19 { x: 4.8; y: 5.8; skew-x: -1.2; skew-y: -1.2; }
        frame 20 { x: 2.4; y: 8.1; skew-x: -3.4; skew-y: -3.4; }
        frame 21 { x: 0; y: 10.5; skew-x: -5.7; skew-y: -5.7; }
        frame 22 { x: -2.3; y: 13.1; skew-x: -7.9; skew-y: -7.9; scale-x: 0.8; scale-y: 0.8; }
        frame 23 { x: -2.6; y: 14.5; skew-x: -11.2; skew-y: -9.7; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { x: -2.7; y: 16.1; skew-x: -14.7; skew-y: -11.7; scale-x: 0.8; scale-y: -10000; }
        frame 25 { x: -1.3; y: 13.6; skew-x: -10.9; skew-y: -8.7; scale-x: -10000; }
        frame 26 { x: 0; y: 11; skew-x: -7.2; skew-y: -5.7; }
        frame 27 { x: 1.6; y: 8.4; skew-x: -3.5; skew-y: -2.7; scale-y: 0.8; }
        frame 28 { x: 3.1; y: 6; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 4.4; y: 3.9; skew-x: 2.8; skew-y: 2.8; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 5.9; y: 1.8; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 7.4; y: -0.1; skew-x: 8.8; skew-y: 8.8; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 9; y: -2.2; skew-x: 11.9; skew-y: 11.9; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 11.1; y: -3.4; skew-x: 14.6; skew-y: 14.6; }
        frame 35 { x: 13.2; y: -4.7; skew-x: 17.3; skew-y: 17.3; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: 15.4; y: -5.9; skew-x: 20.3; skew-y: 20.3; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 17.6; y: -7.1; skew-x: 23; skew-y: 23; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 18.6; y: -7.6; skew-x: 23.8; skew-y: 23.8; scale-x: 0.797; scale-y: 0.797; }
        frame 39 { x: 19.6; y: -8.1; skew-x: 24.6; skew-y: 24.6; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 20.6; y: -8.7; skew-x: 25.5; skew-y: 25.5; }
        frame 41 { x: 21.7; y: -9.3; skew-x: 26.3; skew-y: 26.3; }
        frame 42 { x: 20.7; y: -8.1; skew-x: 25.8; skew-y: 25.8; scale-x: 0.796; scale-y: 0.796; }
        frame 43 { x: 19.9; y: -6.9; skew-x: 25.3; skew-y: 25.3; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 18.9; y: -5.8; skew-x: 24.8; skew-y: 24.8; }
        frame 45 { x: 18.1; y: -4.6; skew-x: 24.3; skew-y: 24.3; scale-x: 0.797; scale-y: 0.797; }
        frame 46 { x: 13.1; y: -1.7; skew-x: 18.8; skew-y: 18.8; scale-x: 0.796; scale-y: 0.796; }
        frame 47 { x: 8.3; y: 1.1; skew-x: 13.5; skew-y: 13.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 3.6; y: 4.3; skew-x: 8; skew-y: 8; }
        frame 49 { x: -0.7; y: 7.6; skew-x: 2.7; skew-y: 2.7; }
        frame 50 { x: -2; y: 8.3; skew-x: -1.4; skew-y: 1.5; scale-x: 0.798; scale-y: 0.795; }
        frame 51 { x: -3.1; y: 9.2; skew-x: -6; skew-y: 0.3; scale-x: 0.8; scale-y: -10000; }
        frame 52 { x: -1; y: 4.1; skew-x: 3; skew-y: 6.3; scale-x: 0.798; }
        frame 53 { x: 1.6; y: -0.8; skew-x: 12.3; skew-y: 12.3; scale-x: 0.796; scale-y: 0.796; }
        frame 54 { x: 3.9; y: -1.8; skew-x: 13.5; skew-y: 13.5; scale-x: 0.795; scale-y: 0.795; }
        frame 55 { x: 6.4; y: -2.6; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 8.9; y: -3.7; skew-x: 16.3; skew-y: 16.3; }
        frame 57 { x: 11.3; y: -4.6; skew-x: 17.6; skew-y: 17.6; scale-x: 0.796; scale-y: 0.796; }
        frame 58 { x: 14.1; y: -5.6; skew-x: 19; skew-y: 19; scale-x: 0.795; scale-y: 0.795; }
        frame 59 { x: 16.8; y: -6.6; skew-x: 20.3; skew-y: 20.3; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 19.6; y: -7.6; skew-x: 21.8; skew-y: 21.8; }
        frame 61 { x: 22.5; y: -8.6; skew-x: 23.4; skew-y: 23.4; }
        frame 62 { x: 23.4; y: -8.9; skew-x: 24.6; skew-y: 24.6; scale-x: 0.794; scale-y: 0.794; }
        frame 63 { x: 24.2; y: -9.1; skew-x: 25.8; skew-y: 25.8; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 25; y: -9.3; skew-x: 26.8; skew-y: 26.8; }
        frame 65 { x: 25.9; y: -9.4; skew-x: 28.1; skew-y: 28.1; scale-x: 0.795; scale-y: 0.795; }
        frame 66 { x: 19.7; y: -6.8; skew-x: 22.8; skew-y: 22.8; scale-x: 0.794; scale-y: 0.794; }
        frame 67 { x: 13.8; y: -4.1; skew-x: 17.6; skew-y: 17.6; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 7.9; y: -1.2; skew-x: 12.3; skew-y: 12.3; }
        frame 69 { x: 2.3; y: 1.5; skew-x: 7.2; skew-y: 7.2; }
        frame 70 { x: 2.5; y: 2.3; skew-x: 6; skew-y: 6; scale-x: 0.795; scale-y: 0.795; }
        frame 71 { x: -10000; y: 3; skew-x: 4.8; skew-y: 4.8; scale-x: 0.796; scale-y: 0.796; }
        frame 72 { x: 2.7; y: 3.8; skew-x: 3.5; skew-y: 3.5; scale-x: 0.797; scale-y: 0.797; }
        frame 73 { x: 2.9; y: 4.5; skew-x: 2.3; skew-y: 2.3; scale-x: 0.798; scale-y: 0.798; }
        frame 74 { x: 3; y: 5.3; skew-x: 1.1; skew-y: 1.1; scale-x: 0.799; scale-y: 0.799; }
        frame 75 { x: 3.1; y: 6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 3.5; y: 5.8; scale-x: 0.794; }
        frame 78 { x: 4; y: -10000; scale-x: 0.788; }
        frame 79 { x: 4.5; y: 5.7; scale-x: 0.781; }
        frame 80 { x: 4.8; y: 5.6; scale-x: 0.775; }
        frame 81 { x: 5.3; y: 5.5; scale-x: 0.769; }
        frame 82 { x: 4.6; y: 5.8; scale-x: 0.775; }
        frame 83 { x: 3.8; y: 6.2; scale-x: 0.781; }
        frame 84 { x: 2.9; y: 6.6; scale-x: 0.788; }
        frame 85 { x: 2.1; y: 7; scale-x: 0.794; }
        frame 86 { x: 1.3; y: 7.3; scale-x: 0.8; }
        frame 87 { x: 0.8; y: 8.2; skew-x: -0.7; scale-x: -10000; }
        frame 88 { x: 0.3; y: 9.1; skew-x: -1.4; skew-y: -0.2; }
        frame 89 { x: -0.3; y: 9.9; skew-x: -2.2; skew-y: -0.4; }
        frame 90 { x: -0.8; y: 10.8; skew-x: -3; skew-y: -0.7; }
        frame 91 { x: -0.1; y: 10.5; skew-x: -2.7; skew-y: -0.2; scale-x: 0.801; }
        frame 92 { x: 0.3; y: 10.2; skew-x: -10000; skew-y: 0; scale-x: -10000; }
        frame 93 { x: 1; y: 9.1; skew-x: -1.9; skew-y: -10000; }
        frame 94 { x: 1.7; y: 8; skew-x: -1.2; scale-x: 0.8; }
        frame 95 { x: 2.4; y: 7; skew-x: -0.4; scale-x: -10000; }
        frame 96 { x: 3.1; y: 6; skew-x: 0; }
        frame 97 { x: 3.5; y: 5.8; skew-x: -10000; scale-x: 0.794; }
        frame 98 { x: 4; y: -10000; scale-x: 0.788; }
        frame 99 { x: 4.5; y: 5.7; scale-x: 0.781; }
        frame 100 { x: 4.8; y: 5.6; scale-x: 0.775; }
        frame 101 { x: 5.3; y: 5.5; scale-x: 0.769; }
        frame 102 { x: 4.6; y: 5.8; scale-x: 0.775; }
        frame 103 { x: 3.8; y: 6.2; scale-x: 0.781; }
        frame 104 { x: 2.9; y: 6.6; scale-x: 0.788; }
        frame 105 { x: 2.1; y: 7; scale-x: 0.794; }
        frame 106 { x: 1.3; y: 7.3; scale-x: 0.8; }
        frame 107 { x: 0.8; y: 8.2; skew-x: -0.7; scale-x: -10000; }
        frame 108 { x: 0.3; y: 9.1; skew-x: -1.4; skew-y: -0.2; }
        frame 109 { x: -0.3; y: 9.9; skew-x: -2.2; skew-y: -0.4; }
        frame 110 { x: -0.8; y: 10.8; skew-x: -3; skew-y: -0.7; }
        frame 111 { x: -0.1; y: 10.5; skew-x: -2.7; skew-y: -0.2; scale-x: 0.801; }
        frame 112 { x: 0.3; y: 10.2; skew-x: -10000; skew-y: 0; scale-x: -10000; }
        frame 113 { x: 1.2; y: 8.7; skew-x: -1.7; skew-y: -10000; }
        frame 114 { x: 2.1; y: 7.3; skew-x: -0.7; scale-x: 0.8; }
        frame 115 { x: 3.1; y: 6; skew-x: 0; scale-x: -10000; }
        frame 116 { x: -10000; y: -10000; skew-x: -10000; cel: -1; }
        frame 117 { cel: -10000; }
        frame 155 { x: 0.2; y: 7.7; skew-x: -12.7; skew-y: -12.7; scale-x: 0.799; scale-y: 0.799; cel: 0; }
        frame 156 { x: 0.7; y: 7.9; skew-x: -11.4; skew-y: -10.9; scale-x: 0.798; scale-y: 0.798; cel: -10000; }
        frame 157 { x: 1.2; y: 8.1; skew-x: -10.4; skew-y: -9.4; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 0.5; y: 12; skew-x: -13.4; skew-y: -11.7; }
        frame 159 { x: -0.1; y: 16; skew-x: -16.4; skew-y: -14.4; scale-x: 0.799; }
        frame 160 { x: -0.6; y: 20; skew-x: -19.6; skew-y: -17; scale-x: 0.8; scale-y: 0.799; }
        frame 161 { x: -0.8; y: 18.8; skew-x: -18; skew-y: -16; scale-x: 0.799; scale-y: 0.798; }
        frame 162 { x: -1; y: 17.8; skew-x: -16.7; skew-y: -15.2; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: -0.5; y: 14.4; skew-x: -15.2; skew-y: -14.2; scale-x: 0.798; }
        frame 164 { x: -0.1; y: 11.1; skew-x: -13.9; skew-y: -13.4; scale-x: -10000; }
        frame 165 { x: 0.2; y: 7.7; skew-x: -12.7; skew-y: -12.7; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "Zombie_outerarm_hand";
        frame-count: 166;
        frame 0 { x: 33.8; y: 83.1; skew-x: 357; skew-y: 357; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_OUTERARM_HAND; }
        frame 1 { x: 34; y: 81.5; skew-x: 360; skew-y: 360; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 34.3; y: 80.1; skew-x: 362.8; skew-y: 362.8; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 34.5; y: 78.5; skew-x: 365.8; skew-y: 365.8; }
        frame 4 { x: 34.7; y: 77; skew-x: 368.8; skew-y: 368.8; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { x: 36.1; y: 77.5; skew-x: 369.8; skew-y: 369.8; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 37.5; y: 78; skew-x: 370.8; skew-y: 370.8; }
        frame 7 { x: 38.9; y: 78.5; skew-x: 371.8; skew-y: 371.8; scale-x: 0.797; scale-y: 0.797; }
        frame 8 { x: 40.3; y: 78.9; skew-x: 372.8; skew-y: 372.8; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 41.7; y: 79.3; skew-x: 374; skew-y: 374; }
        frame 10 { x: 43; y: 79.8; skew-x: 375.1; skew-y: 375.1; }
        frame 11 { x: 42.6; y: 79.5; skew-x: 376.3; skew-y: 376.3; scale-x: 0.796; scale-y: 0.796; }
        frame 12 { x: 42.3; y: 79.1; skew-x: 377.8; skew-y: 377.8; scale-x: 0.797; scale-y: 0.797; }
        frame 13 { x: 41.3; y: -10000; skew-x: 372.3; skew-y: 372.3; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 40.4; y: 79.3; skew-x: 366.8; skew-y: 366.8; }
        frame 15 { x: 39.6; y: 79.6; skew-x: 361.3; skew-y: 361.3; scale-x: 0.798; scale-y: 0.798; }
        frame 16 { x: 39; y: 80; skew-x: 355.9; skew-y: 355.9; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 38.6; y: 80.9; skew-x: 355.2; skew-y: 355.2; }
        frame 18 { x: 38.2; y: 81.8; skew-x: 354.5; skew-y: 354.5; }
        frame 19 { x: 37.8; y: 82.8; skew-x: 353.7; skew-y: 353.7; }
        frame 20 { x: 37.5; y: 83.8; skew-x: 353; skew-y: 353; scale-x: 0.799; scale-y: 0.799; }
        frame 21 { x: 37; y: 84.8; skew-x: 352.2; skew-y: 352.2; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 36.7; y: 85.7; skew-x: 351.5; skew-y: 351.5; scale-x: 0.8; scale-y: 0.8; }
        frame 23 { x: 36.5; y: 86; skew-x: 352.5; skew-y: 352.5; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { x: -10000; y: 86.3; skew-x: 353.4; skew-y: 353.4; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 35.9; y: 85.5; skew-x: 354.5; skew-y: 354.5; }
        frame 26 { x: 35.1; y: 84.8; skew-x: 355.2; skew-y: 355.2; }
        frame 27 { x: 34.5; y: 84.1; skew-x: 356.2; skew-y: 356.2; scale-x: 0.8; scale-y: 0.8; }
        frame 28 { x: 33.8; y: 83.4; skew-x: 357; skew-y: 357; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 32.1; y: 82.7; skew-x: 352.4; skew-y: 352.4; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 30.8; y: 82.1; skew-x: 347.7; skew-y: 347.7; scale-x: 0.798; scale-y: 0.798; }
        frame 32 { x: 29.3; y: 81.6; skew-x: 343; skew-y: 343; scale-x: 0.797; scale-y: 0.797; }
        frame 33 { x: 27.9; y: 81.1; skew-x: 338.3; skew-y: 338.3; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 30.1; y: 82.8; skew-x: 333.2; skew-y: 333.2; scale-x: 0.796; scale-y: 0.796; }
        frame 35 { x: 32.5; y: 84.5; skew-x: 327.9; skew-y: 327.9; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 34.9; y: 86.1; skew-x: 322.7; skew-y: 322.7; scale-x: 0.795; scale-y: 0.795; }
        frame 37 { x: 37.5; y: 87.9; skew-x: 317.5; skew-y: 317.5; scale-x: 0.796; scale-y: 0.796; }
        frame 38 { x: 39; y: 87.5; skew-x: 315.9; skew-y: 315.9; scale-x: 0.795; scale-y: 0.795; }
        frame 39 { x: 40.5; y: 87.1; skew-x: 314.3; skew-y: 314.3; scale-x: 0.794; scale-y: 0.794; }
        frame 40 { x: 42; y: 86.8; skew-x: 312.6; skew-y: 312.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 43.5; y: 86.3; skew-x: 311; skew-y: 311; scale-x: 0.795; scale-y: 0.795; }
        frame 42 { x: 45; y: 87; skew-x: 308.9; skew-y: 308.9; scale-x: 0.794; scale-y: 0.794; }
        frame 43 { x: 46.4; y: 87.7; skew-x: 306.9; skew-y: 306.9; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 47.8; y: 88.3; skew-x: 304.9; skew-y: 304.9; }
        frame 45 { x: 49.3; y: 88.9; skew-x: 303; skew-y: 303; scale-x: 0.795; scale-y: 0.795; }
        frame 46 { x: 47.9; y: 89.4; skew-x: 304.6; skew-y: 304.6; scale-x: 0.793; scale-y: 0.793; }
        frame 47 { x: 46.5; y: 89.8; skew-x: 306.3; skew-y: 306.3; scale-x: 0.792; scale-y: 0.792; }
        frame 48 { x: 45.1; y: 90.2; skew-x: 308.1; skew-y: 308.1; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 43.7; y: 90.5; skew-x: 309.8; skew-y: 309.8; }
        frame 50 { x: 40.3; y: 89.8; skew-x: 313.9; skew-y: 313.9; scale-x: 0.791; scale-y: 0.791; }
        frame 51 { x: 37; y: 89.3; skew-x: 318.1; skew-y: 318.1; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 33.7; y: 88.7; skew-x: 322.2; skew-y: 322.2; }
        frame 53 { x: 30.5; y: 88.1; skew-x: 326.3; skew-y: 326.3; scale-x: 0.792; scale-y: 0.792; }
        frame 54 { x: 30.8; y: 87.7; skew-x: 327.7; skew-y: 327.7; scale-x: 0.79; scale-y: 0.79; }
        frame 55 { x: 31; y: 87.3; skew-x: 328.9; skew-y: 328.9; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 31.4; y: 86.8; skew-x: 330.4; skew-y: 330.4; }
        frame 57 { x: 31.6; y: 86.3; skew-x: 331.6; skew-y: 331.6; scale-x: 0.791; scale-y: 0.791; }
        frame 58 { x: 30.1; y: 85; skew-x: 336.9; skew-y: 336.9; scale-x: 0.79; scale-y: 0.79; }
        frame 59 { x: 28.7; y: 83.7; skew-x: 342.2; skew-y: 342.2; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 27.5; y: 82.4; skew-x: 347.5; skew-y: 347.5; }
        frame 61 { x: 26.4; y: 81.2; skew-x: 352.7; skew-y: 352.7; }
        frame 62 { x: 25.3; y: 78.1; skew-x: 361.3; skew-y: 361.3; }
        frame 63 { x: 24.5; y: 75; skew-x: 370.3; skew-y: 370.3; scale-x: 0.789; scale-y: 0.789; }
        frame 64 { x: 23.8; y: 72.3; skew-x: 379; skew-y: 379; scale-x: 0.788; scale-y: 0.788; }
        frame 65 { x: 23.3; y: 70; skew-x: 387.8; skew-y: 387.8; scale-x: 0.789; scale-y: 0.789; }
        frame 66 { x: 23.6; y: 71.9; skew-x: 384.5; skew-y: 384.5; scale-x: 0.788; scale-y: 0.788; }
        frame 67 { x: 23.7; y: 73.8; skew-x: 381.3; skew-y: 381.3; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 24; y: 75.8; skew-x: 377.8; skew-y: 377.8; }
        frame 69 { x: 24.3; y: 77.8; skew-x: 374.7; skew-y: 374.7; }
        frame 70 { x: 25.7; y: 78.7; skew-x: 371.8; skew-y: 371.8; scale-x: 0.79; scale-y: 0.79; }
        frame 71 { x: 27.1; y: 79.4; skew-x: 368.8; skew-y: 368.8; scale-x: 0.792; scale-y: 0.792; }
        frame 72 { x: 28.6; y: 80.4; skew-x: 365.8; skew-y: 365.8; scale-x: 0.794; scale-y: 0.794; }
        frame 73 { x: 30; y: 81.3; skew-x: 362.8; skew-y: 362.8; scale-x: 0.796; scale-y: 0.796; }
        frame 74 { x: 31.6; y: 82.2; skew-x: 360; skew-y: 360; scale-x: 0.798; scale-y: 0.798; }
        frame 75 { x: 32.9; y: 83.1; skew-x: 357; skew-y: 357; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: 4.2; y: 33.6; skew-x: 365.8; skew-y: 365.8; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_OUTERARM_HAND2; }
        frame 77 { x: 5.6; y: 32.9; skew-x: 369.5; skew-y: 369.5; scale-x: 0.797; scale-y: 0.797; image: none; }
        frame 78 { x: 7; y: 32.1; skew-x: 373.5; skew-y: 373.5; scale-x: 0.795; scale-y: 0.795; }
        frame 79 { x: 8.4; y: 31.4; skew-x: 377.3; skew-y: 377.3; scale-x: 0.793; scale-y: 0.793; }
        frame 80 { x: 9.9; y: 30.8; skew-x: 381.3; skew-y: 381.3; scale-x: 0.791; scale-y: 0.791; }
        frame 81 { x: 11.3; y: 30.4; skew-x: 385.1; skew-y: 385.1; scale-x: 0.79; scale-y: 0.79; }
        frame 82 { x: 9.6; y: 31.1; skew-x: 378.8; skew-y: 378.8; scale-x: 0.788; scale-y: 0.788; }
        frame 83 { x: 7.9; y: 32; skew-x: 372.5; skew-y: 372.5; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 6.3; y: 33.1; skew-x: 366.3; skew-y: 366.3; scale-x: 0.787; scale-y: 0.787; }
        frame 85 { x: 4.8; y: 34.3; skew-x: 360; skew-y: 360; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 3.5; y: 35.7; skew-x: 353.9; skew-y: 353.9; scale-x: 0.786; scale-y: 0.786; }
        frame 87 { x: 2.1; y: 37.1; skew-x: 347.5; skew-y: 347.5; scale-x: 0.785; scale-y: 0.785; }
        frame 88 { x: 2.3; y: 37.6; skew-x: 347.2; skew-y: 347.2; scale-x: 0.784; scale-y: 0.784; }
        frame 89 { x: 2.4; y: 38.1; skew-x: 347; skew-y: 347; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 2.6; y: 38.5; skew-x: 346.7; skew-y: 346.7; }
        frame 91 { x: 2.5; y: 39; skew-x: 346.3; skew-y: 346.3; }
        frame 92 { x: 1.9; y: 42.8; skew-x: 343.7; skew-y: 343.7; scale-x: 0.783; scale-y: 0.783; }
        frame 93 { x: 1.2; y: 46.5; skew-x: 341.2; skew-y: 341.2; scale-x: 0.782; scale-y: 0.782; }
        frame 94 { x: 0.6; y: 50.5; skew-x: 338.5; skew-y: 338.5; scale-x: 0.781; scale-y: 0.781; }
        frame 95 { x: 0; y: 54.4; skew-x: 335.9; skew-y: 335.9; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: -0.2; y: 58.1; skew-x: 333.3; skew-y: 333.3; }
        frame 97 { x: -0.7; y: 59.9; skew-x: 330.4; skew-y: 330.4; scale-x: 0.779; scale-y: 0.779; }
        frame 98 { x: -1.1; y: 61.8; skew-x: 327.4; skew-y: 327.4; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: -1.4; y: 63.6; skew-x: 324.4; skew-y: 324.4; }
        frame 100 { x: -1.7; y: 65.5; skew-x: 321.4; skew-y: 321.4; scale-x: 0.778; scale-y: 0.778; }
        frame 101 { x: -2.1; y: 67.3; skew-x: 318.4; skew-y: 318.4; scale-x: 0.779; scale-y: 0.779; }
        frame 102 { x: -10000; y: 68.7; skew-x: 316.6; skew-y: 316.6; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: -2; y: 70.1; skew-x: 314.9; skew-y: 314.9; }
        frame 104 { x: -10000; y: 71.4; skew-x: 313.1; skew-y: 313.1; scale-x: 0.78; scale-y: 0.78; }
        frame 105 { x: -2.1; y: 72.9; skew-x: 311.3; skew-y: 311.3; scale-x: 0.782; scale-y: 0.782; }
        frame 106 { x: -2.2; y: 72.5; skew-x: 310.6; skew-y: 310.6; scale-x: 0.781; scale-y: 0.781; }
        frame 107 { x: -10000; y: 72.2; skew-x: 309.6; skew-y: 309.6; scale-x: 0.782; scale-y: 0.782; }
        frame 108 { x: -2.4; y: 71.8; skew-x: 308.9; skew-y: 308.9; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: -10000; y: 71.4; skew-x: 308.1; skew-y: 308.1; scale-x: 0.784; scale-y: 0.784; }
        frame 110 { x: -2.2; y: 64.9; skew-x: 317.7; skew-y: 317.7; scale-x: 0.785; scale-y: 0.785; }
        frame 111 { x: -1.6; y: 58.4; skew-x: 327.4; skew-y: 327.4; scale-x: 0.788; scale-y: 0.788; }
        frame 112 { x: -0.7; y: 51.9; skew-x: 337; skew-y: 337; scale-x: 0.791; scale-y: 0.791; }
        frame 113 { x: 0.4; y: 45.5; skew-x: 346.7; skew-y: 346.7; scale-x: 0.794; scale-y: 0.794; }
        frame 114 { x: 2.1; y: 39.6; skew-x: 356.2; skew-y: 356.2; scale-x: 0.797; scale-y: 0.797; }
        frame 115 { x: 4.2; y: 33.6; skew-x: 365.8; skew-y: 365.8; scale-x: 0.8; scale-y: 0.8; }
        frame 116 { x: 32.9; y: 83.1; skew-x: 357; skew-y: 357; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_OUTERARM_HAND; }
        frame 117 { x: 30.7; y: 86.7; skew-x: 355.2; skew-y: 355.2; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 118 { x: 28.3; y: 90.4; skew-x: 353.4; skew-y: 353.4; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 26.1; y: 94.1; skew-x: 351.5; skew-y: 351.5; scale-x: 0.798; scale-y: 0.798; }
        frame 120 { x: 23.8; y: 97.7; skew-x: 349.7; skew-y: 349.7; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 21.6; y: 101.3; skew-x: 347.9; skew-y: 347.9; scale-x: 0.797; scale-y: 0.797; }
        frame 122 { x: 19.4; y: 105.2; skew-x: 345.9; skew-y: 345.9; scale-x: -10000; scale-y: -10000; }
        frame 123 { x: 18.6; y: 108.8; skew-x: 340; skew-y: 340; scale-x: 0.796; scale-y: 0.796; }
        frame 124 { x: 18; y: 112.3; skew-x: 333.9; skew-y: 333.9; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: 19.3; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.795; scale-y: 0.795; }
        frame 126 { x: 20.5; scale-x: 0.796; scale-y: 0.796; }
        frame 127 { x: 20.2; y: 110.6; skew-x: 337; skew-y: 337; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 20.1; y: 109; skew-x: 340; skew-y: 340; }
        frame 129 { x: 19.9; y: 107.3; skew-x: 343; skew-y: 343; }
        frame 130 { x: -10000; y: 105.7; skew-x: 345.9; skew-y: 345.9; scale-x: 0.797; scale-y: 0.797; }
        frame 131 { x: 19.3; y: 104.9; skew-x: 346; skew-y: 346; scale-x: 0.796; scale-y: 0.796; }
        frame 132 { x: 18.8; y: 104.3; skew-x: 345.9; skew-y: 345.9; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 18.2; y: 103.6; skew-x: 345.7; skew-y: 345.7; }
        frame 134 { x: 17.4; y: 102.3; skew-x: -10000; skew-y: -10000; scale-x: 0.795; scale-y: 0.795; }
        frame 135 { x: 16.6; y: 101.2; skew-x: 345.5; skew-y: 345.5; scale-x: 0.794; scale-y: 0.794; }
        frame 136 { x: 15.9; y: 100.1; skew-x: 345.2; skew-y: 345.2; scale-x: 0.795; scale-y: 0.795; }
        frame 137 { x: 14.8; y: 100; skew-x: 345; skew-y: 345; scale-x: 0.794; scale-y: 0.794; }
        frame 138 { x: 13.6; y: 99.8; skew-x: 344.7; skew-y: 344.7; scale-x: 0.793; scale-y: 0.793; }
        frame 139 { x: 12.5; y: -10000; skew-x: 344.3; skew-y: 344.3; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 15.9; y: 104.8; skew-x: 317.4; skew-y: 317.4; scale-x: 0.79; scale-y: 0.79; }
        frame 141 { x: 22.3; y: 109.9; skew-x: 290.5; skew-y: 290.5; scale-x: 0.789; scale-y: 0.789; }
        frame 142 { x: 31.7; y: 113.8; skew-x: 263.6; skew-y: 263.6; scale-x: 0.788; scale-y: 0.788; }
        frame 143 { x: 34.1; y: 108.2; skew-x: 251; skew-y: 251; scale-x: 0.786; scale-y: 0.786; }
        frame 144 { x: 36.8; y: 101.9; skew-x: 238.3; skew-y: 238.3; scale-x: 0.785; scale-y: 0.785; }
        frame 145 { x: 30.6; y: 92.6; skew-x: 213.1; skew-y: 213.1; scale-x: 0.783; scale-y: 0.783; }
        frame 146 { x: 23.9; y: 80.6; skew-x: 188.1; skew-y: 188.1; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: 19.7; y: 100; skew-x: 206.3; skew-y: 208.3; scale-x: 0.752; scale-y: 0.776; }
        frame 148 { x: 15.3; y: 117.8; skew-x: 224.4; skew-y: 228.7; scale-x: 0.721; scale-y: 0.769; }
        frame 149 { x: 11.5; y: 134; skew-x: 242.6; skew-y: 249; scale-x: 0.692; scale-y: 0.765; }
        frame 150 { x: 15.1; y: 129.7; skew-x: 234.1; skew-y: 237.2; scale-x: 0.735; scale-y: 0.771; }
        frame 151 { x: 18.9; y: 124.9; skew-x: 225.4; skew-y: 225.4; scale-x: 0.78; scale-y: 0.78; }
        frame 152 { x: 16.5; y: 128.2; skew-x: 232.4; skew-y: 232.4; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 13.9; y: 131.2; skew-x: 239.2; skew-y: 239.2; }
        frame 154 { x: 11.5; y: 134; skew-x: 246; skew-y: 246; scale-x: 0.781; scale-y: 0.781; }
        frame 155 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 156 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_outerarm_upper";
        frame-count: 166;
        frame 0 { x: 42.1; y: 45.3; skew-x: 357; skew-y: 357; scale-x: 0.743; scale-y: 0.756; image: IMAGE_REANIM_ZOMBIE_POGO_OUTERARM_UPPER; }
        frame 1 { x: 43.3; y: 44.6; skew-x: 358.5; skew-y: 358.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 44.6; y: 44; skew-x: 359.7; skew-y: 359.7; }
        frame 3 { x: 45.8; y: 43.5; skew-x: 361; skew-y: 361; }
        frame 4 { x: 47; y: 42.9; skew-x: 362.5; skew-y: 362.5; scale-x: 0.742; scale-y: 0.755; }
        frame 5 { x: 47.5; y: 43.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 47.9; y: 44; }
        frame 7 { x: 48.3; y: 44.5; skew-x: 362.6; skew-y: 362.6; }
        frame 8 { x: 48.6; y: 45; skew-x: 362.8; skew-y: 362.8; }
        frame 9 { x: 49.3; y: 45.5; skew-x: -10000; skew-y: -10000; }
        frame 10 { x: 49.6; y: 46; skew-x: 363; skew-y: 363; }
        frame 11 { x: 49.1; y: 45.6; skew-x: 362; skew-y: 362; }
        frame 12 { x: 48.5; y: 45; skew-x: 361.3; skew-y: 361.3; }
        frame 13 { x: 48; y: 44.5; skew-x: 360.3; skew-y: 360.3; }
        frame 14 { x: 47.5; y: 44; skew-x: 359.7; skew-y: 359.7; }
        frame 15 { x: 47; y: 43.4; skew-x: 358.9; skew-y: 358.9; }
        frame 16 { x: 46.5; y: 42.9; skew-x: 357.9; skew-y: 357.9; }
        frame 17 { x: 45.6; y: 43.6; skew-x: 357; skew-y: 357; }
        frame 18 { x: 44.8; y: 44.3; skew-x: 355.9; skew-y: 355.9; }
        frame 19 { x: 43.9; y: 45; skew-x: 354.7; skew-y: 354.7; }
        frame 20 { x: 43; y: 45.6; skew-x: 353.7; skew-y: 353.7; scale-x: 0.743; scale-y: 0.756; }
        frame 21 { x: 42.1; y: 46.3; skew-x: 352.7; skew-y: 352.7; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 41.3; y: 47.1; skew-x: 351.5; skew-y: 351.5; }
        frame 23 { x: 41.4; y: 46.9; skew-x: 352.5; skew-y: 352.5; }
        frame 24 { x: 41.5; y: 46.5; skew-x: 353.4; skew-y: 353.4; }
        frame 25 { x: 41.8; y: 46.1; skew-x: 354.2; skew-y: 354.2; }
        frame 26 { x: 41.9; y: 45.9; skew-x: 355.2; skew-y: 355.2; }
        frame 27 { x: 42; y: 45.5; skew-x: 356.2; skew-y: 356.2; }
        frame 28 { x: 42.1; y: 45.3; skew-x: 357; skew-y: 357; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 41.3; y: 44.3; skew-x: 358.2; skew-y: 358.2; }
        frame 31 { x: 40.4; y: 43.4; skew-x: 359.7; skew-y: 359.7; }
        frame 32 { x: 39.5; y: 42.5; skew-x: 360.8; skew-y: 360.8; scale-x: 0.742; scale-y: 0.755; }
        frame 33 { x: 38.8; y: 41.5; skew-x: 362.1; skew-y: 362.1; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 38.2; y: 42.3; skew-x: 359; skew-y: 359; }
        frame 35 { x: 37.7; y: 43.1; skew-x: 355.7; skew-y: 355.7; scale-x: 0.741; scale-y: 0.754; }
        frame 36 { x: 37.2; y: 43.9; skew-x: 352.4; skew-y: 352.4; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 36.5; y: 44.7; skew-x: 349; skew-y: 349; }
        frame 38 { x: 36.9; y: 44.6; skew-x: 348.7; skew-y: 348.7; scale-x: 0.74; scale-y: 0.753; }
        frame 39 { x: 37.2; y: 44.5; skew-x: 348.5; skew-y: 348.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 37.5; y: 44.3; skew-x: 348.2; skew-y: 348.2; }
        frame 41 { x: 37.9; y: 44.2; skew-x: 347.8; skew-y: 347.8; }
        frame 42 { x: -10000; y: 45; skew-x: 345.9; skew-y: 345.9; scale-x: 0.739; scale-y: 0.752; }
        frame 43 { y: 46; skew-x: 343.9; skew-y: 343.9; scale-x: -10000; scale-y: -10000; }
        frame 44 { y: 47; skew-x: 341.9; skew-y: 341.9; }
        frame 45 { x: 37.8; y: 47.9; skew-x: 339.8; skew-y: 339.8; scale-x: 0.74; scale-y: 0.753; }
        frame 46 { x: 37; y: 48; skew-x: 340.2; skew-y: 340.2; scale-x: 0.739; scale-y: 0.752; }
        frame 47 { x: 35.9; y: 48.2; skew-x: 340.5; skew-y: 340.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 34.9; y: 48.4; skew-x: 340.7; skew-y: 340.7; }
        frame 49 { x: 34; y: 48.6; skew-x: 341; skew-y: 341; }
        frame 50 { x: 33; y: 47.4; skew-x: 343.7; skew-y: 343.7; scale-x: 0.738; scale-y: 0.751; }
        frame 51 { x: 32; y: 46.2; skew-x: 346.2; skew-y: 346.2; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 31; y: 45.3; skew-x: 348.7; skew-y: 348.7; }
        frame 53 { x: 30; y: 44; skew-x: 351.1; skew-y: 351.1; scale-x: 0.739; scale-y: 0.752; }
        frame 54 { x: 31.4; y: 43.7; skew-x: 352.5; skew-y: 352.5; scale-x: 0.738; scale-y: 0.751; }
        frame 55 { x: 32.8; y: 43.4; skew-x: 353.7; skew-y: 353.7; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 34.1; y: 42.9; skew-x: 355.2; skew-y: 355.2; }
        frame 57 { x: 35.5; y: 42.6; skew-x: 356.4; skew-y: 356.4; scale-x: 0.739; scale-y: 0.752; }
        frame 58 { x: 36.9; y: 42; skew-x: 359.2; skew-y: 359.2; scale-x: 0.738; scale-y: 0.751; }
        frame 59 { x: 38.1; y: 41.4; skew-x: 362; skew-y: 362; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 39.5; y: 40.7; skew-x: 364.8; skew-y: 364.8; }
        frame 61 { x: 40.8; y: 40.1; skew-x: 367.7; skew-y: 367.7; }
        frame 62 { x: 41.4; y: 40.3; skew-x: 371; skew-y: 371; scale-x: 0.737; scale-y: 0.75; }
        frame 63 { x: 42.1; y: 40.5; skew-x: 374.5; skew-y: 374.5; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 42.8; y: 40.6; skew-x: 378; skew-y: 378; }
        frame 65 { x: 43.5; y: 40.9; skew-x: 381.5; skew-y: 381.5; }
        frame 66 { x: 41.4; y: 41.5; skew-x: 377.3; skew-y: 377.3; }
        frame 67 { x: 39.3; y: 42.1; skew-x: 373.3; skew-y: 373.3; }
        frame 68 { x: 37.3; y: 42.9; skew-x: 369.3; skew-y: 369.3; }
        frame 69 { x: 35.2; y: 43.5; skew-x: 365.4; skew-y: 365.4; }
        frame 70 { x: 36.4; y: 43.8; skew-x: 363.8; skew-y: 363.8; scale-x: 0.738; scale-y: 0.751; }
        frame 71 { x: 37.5; y: 44; skew-x: 362.5; skew-y: 362.5; scale-x: 0.739; scale-y: 0.752; }
        frame 72 { x: 38.7; y: 44.4; skew-x: 361; skew-y: 361; scale-x: 0.74; scale-y: 0.753; }
        frame 73 { x: 40; y: 44.5; skew-x: 359.9; skew-y: 359.9; scale-x: 0.741; scale-y: 0.754; }
        frame 74 { x: 41; y: 44.8; skew-x: 358.5; skew-y: 358.5; scale-x: 0.742; scale-y: 0.755; }
        frame 75 { x: 42.1; y: 45.3; skew-x: 357; skew-y: 357; scale-x: 0.743; scale-y: 0.756; }
        frame 76 { x: 45; y: 41.6; skew-x: 404.4; skew-y: 404.4; scale-x: 0.74; scale-y: 0.753; }
        frame 77 { x: -10000; y: 41.7; skew-x: -10000; skew-y: -10000; scale-x: 0.739; scale-y: 0.752; }
        frame 78 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 81 { y: 41.6; scale-x: 0.74; scale-y: 0.753; }
        frame 82 { y: 41.7; scale-x: 0.739; scale-y: 0.752; }
        frame 83 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 86 { y: 41.6; scale-x: 0.74; scale-y: 0.753; }
        frame 87 { x: 44.5; y: 41.9; skew-x: 402.8; skew-y: 402.8; scale-x: 0.739; scale-y: 0.752; }
        frame 88 { x: 44.1; y: -10000; skew-x: 401.1; skew-y: 401.1; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 43.6; y: 42; skew-x: 399.6; skew-y: 399.6; }
        frame 90 { x: 43.1; y: -10000; skew-x: 397.9; skew-y: 397.9; }
        frame 91 { x: 42.7; y: 42.1; skew-x: 396.3; skew-y: 396.3; scale-x: 0.74; scale-y: 0.753; }
        frame 92 { x: 42.5; y: 42.4; skew-x: 392.6; skew-y: 392.6; scale-x: 0.739; scale-y: 0.752; }
        frame 93 { x: 42.1; y: 42.5; skew-x: 389; skew-y: 389; scale-x: -10000; scale-y: 0.751; }
        frame 94 { x: 41.9; y: 42.9; skew-x: 385.3; skew-y: 385.3; scale-x: 0.738; scale-y: -10000; }
        frame 95 { x: 41.6; y: 43.1; skew-x: 381.6; skew-y: 381.6; scale-x: -10000; }
        frame 96 { x: 41.4; y: 43.5; skew-x: 378; skew-y: 378; scale-x: 0.739; scale-y: 0.752; }
        frame 97 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.738; scale-y: 0.751; }
        frame 98 { scale-x: -10000; scale-y: -10000; }
        frame 101 { scale-x: 0.739; scale-y: 0.752; }
        frame 102 { x: 41.1; skew-x: 377.1; skew-y: 377.1; scale-x: 0.738; scale-y: 0.751; }
        frame 103 { x: 41; skew-x: 376.3; skew-y: 376.3; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 40.8; y: 43.6; skew-x: 375.5; skew-y: 375.5; }
        frame 105 { x: 40.7; y: -10000; skew-x: 374.7; skew-y: 374.7; scale-x: 0.739; scale-y: 0.752; }
        frame 106 { x: 40.9; skew-x: 375.5; skew-y: 375.5; scale-x: 0.738; scale-y: 0.751; }
        frame 107 { x: 41.1; y: 43.5; skew-x: 376.3; skew-y: 376.3; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 41.3; y: -10000; skew-x: 377.1; skew-y: 377.1; }
        frame 109 { x: 41.4; skew-x: 378; skew-y: 378; scale-x: 0.739; scale-y: 0.752; }
        frame 110 { x: 42; y: 43; skew-x: 382.3; skew-y: 382.3; scale-x: 0.738; scale-y: 0.751; }
        frame 111 { x: 42.6; y: 42.5; skew-x: 386.8; skew-y: 386.8; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 43.1; y: 42.2; skew-x: 391.1; skew-y: 391.1; scale-x: 0.739; scale-y: 0.752; }
        frame 113 { x: 43.8; y: 41.9; skew-x: 395.6; skew-y: 395.6; scale-x: -10000; scale-y: -10000; }
        frame 114 { x: 44.4; y: 41.8; skew-x: 399.9; skew-y: 399.9; }
        frame 115 { x: 45; y: 41.6; skew-x: 404.4; skew-y: 404.4; scale-x: 0.74; scale-y: 0.753; }
        frame 116 { x: 42.1; y: 45.3; skew-x: 357; skew-y: 357; scale-x: 0.743; scale-y: 0.756; }
        frame 117 { x: 38.7; y: 48.8; skew-x: 355.2; skew-y: 355.2; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: 35.1; y: 52.3; skew-x: 353.4; skew-y: 353.4; scale-x: 0.742; scale-y: 0.755; }
        frame 119 { x: 31.7; y: 55.7; skew-x: 351.5; skew-y: 351.5; scale-x: -10000; scale-y: -10000; }
        frame 120 { x: 28.2; y: 59.3; skew-x: 349.7; skew-y: 349.7; scale-x: 0.741; scale-y: 0.754; }
        frame 121 { x: 24.7; y: 62.9; skew-x: 347.9; skew-y: 347.9; scale-x: -10000; scale-y: -10000; }
        frame 122 { x: 21.2; y: 66.3; skew-x: 345.9; skew-y: 345.9; }
        frame 123 { x: 21.4; y: 67.7; skew-x: 346.5; skew-y: 346.5; scale-x: 0.74; scale-y: 0.753; }
        frame 124 { x: -10000; y: 69; skew-x: 346.8; skew-y: 346.8; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: 21.5; y: 68.9; skew-x: 346.9; skew-y: 346.9; }
        frame 126 { x: 21.4; y: 69; skew-x: 346.8; skew-y: 346.8; }
        frame 127 { x: 21.5; y: 68.2; skew-x: 346.7; skew-y: 346.7; }
        frame 128 { x: 21.4; y: 67.7; skew-x: 346.5; skew-y: 346.4; }
        frame 129 { x: 21.3; y: 67; skew-x: 346.2; skew-y: 346.2; }
        frame 130 { x: 21.2; y: 66.3; skew-x: 345.9; skew-y: 345.9; scale-x: 0.741; scale-y: 0.754; }
        frame 131 { x: 20.9; y: 65.8; skew-x: 346; skew-y: 346; scale-x: 0.736; scale-y: 0.753; }
        frame 132 { x: 20.5; y: 65.3; skew-x: 345.9; skew-y: 345.9; scale-x: 0.732; scale-y: -10000; }
        frame 133 { x: 20; y: 64.7; skew-x: 345.7; skew-y: 345.7; scale-x: 0.728; }
        frame 134 { x: 19.3; y: 63.6; skew-x: -10000; skew-y: -10000; scale-x: 0.719; scale-y: 0.752; }
        frame 135 { x: 18.3; y: 62.5; skew-x: 345.5; skew-y: 345.5; scale-x: 0.711; scale-y: 0.751; }
        frame 136 { x: 17.5; y: 61.5; skew-x: 345.2; skew-y: 345.2; scale-x: 0.704; scale-y: -10000; }
        frame 137 { x: 16.1; y: 61.6; skew-x: 345; skew-y: 345; scale-x: 0.691; scale-y: 0.75; }
        frame 138 { x: 14.9; y: 61.5; skew-x: 344.7; skew-y: 344.7; scale-x: 0.679; scale-y: -10000; }
        frame 139 { x: 13.5; y: 61.2; skew-x: 344.3; skew-y: 344.3; scale-x: 0.668; }
        frame 140 { x: 9.3; y: 66.6; skew-x: 335.7; skew-y: 335.7; scale-x: 0.642; scale-y: 0.748; }
        frame 141 { x: 5.3; y: 72.2; skew-x: 326.9; skew-y: 326.9; scale-x: 0.617; scale-y: 0.747; }
        frame 142 { x: 1.5; y: 77.7; skew-x: 318.2; skew-y: 318.2; scale-x: 0.593; scale-y: -10000; }
        frame 143 { x: -2.2; y: 80.1; skew-x: 305.6; skew-y: 305.6; scale-x: 0.591; scale-y: 0.745; }
        frame 144 { x: -5.5; y: 82.3; skew-x: 292.9; skew-y: 292.9; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: -12.9; y: 92; skew-x: 267.9; skew-y: 268; scale-x: 0.59; scale-y: 0.743; }
        frame 146 { x: -18.1; y: 100.6; skew-x: 242.7; skew-y: 242.7; scale-x: 0.589; scale-y: 0.742; }
        frame 147 { x: -22.5; y: 105.2; skew-x: 263.4; skew-y: 260.9; scale-x: 0.569; scale-y: 0.733; }
        frame 148 { x: -25.6; y: 109.1; skew-x: 283.8; skew-y: 278.8; scale-x: 0.548; scale-y: 0.724; }
        frame 149 { x: -27.7; y: 112.5; skew-x: 304.5; skew-y: 297; scale-x: 0.529; scale-y: 0.716; }
        frame 150 { x: -26.8; y: 112; skew-x: 298; skew-y: 294.3; scale-x: 0.557; scale-y: 0.727; }
        frame 151 { x: -25.9; y: 111.5; skew-x: 291.6; skew-y: 291.6; scale-x: 0.588; scale-y: 0.741; }
        frame 152 { x: -26.5; y: 110.7; skew-x: 294.6; skew-y: 294.6; scale-x: 0.587; scale-y: 0.74; }
        frame 153 { x: -27; y: 109.8; skew-x: 297.6; skew-y: 297.6; scale-x: -10000; scale-y: -10000; }
        frame 154 { x: -27.7; y: 109.1; skew-x: 300.6; skew-y: 300.6; scale-x: 0.588; scale-y: 0.741; }
        frame 155 { x: 47; y: 37.3; skew-x: 346.7; skew-y: 346.7; scale-x: 0.741; scale-y: 0.754; }
        frame 156 { x: 47.1; y: 39.1; skew-x: 347; skew-y: 347; scale-x: 0.74; scale-y: 0.753; }
        frame 157 { x: 47.5; y: 40.9; skew-x: 347.2; skew-y: 347.2; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 47.8; y: 42.7; skew-x: -10000; skew-y: -10000; }
        frame 159 { x: 48.1; y: 44.5; skew-x: 347.4; skew-y: 347.4; }
        frame 160 { x: 48.5; y: 46.4; skew-x: -10000; skew-y: -10000; scale-x: 0.741; scale-y: 0.754; }
        frame 161 { x: 48.2; y: 44.5; scale-x: 0.74; scale-y: 0.753; }
        frame 162 { x: 47.9; y: 42.7; skew-x: 347.2; skew-y: 347.2; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 47.6; y: 40.9; skew-x: -10000; skew-y: -10000; }
        frame 164 { x: 47.3; y: 39.1; skew-x: 347; skew-y: 347; }
        frame 165 { x: 47; y: 37.3; skew-x: 346.7; skew-y: 346.7; scale-x: 0.741; scale-y: 0.754; }
    }
    Track {
        source-name: "Zombie_outerarm_lower";
        frame-count: 166;
        frame 0 { x: 38.8; y: 65.8; skew-x: 357; skew-y: 357; scale-x: 0.693; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_POGO_OUTERARM_LOWER; }
        frame 1 { x: 39.9; y: 64.7; skew-x: 360; skew-y: 360; scale-x: -10000; scale-y: 0.799; image: none; }
        frame 2 { x: 41; y: 63.5; skew-x: 362.8; skew-y: 362.8; scale-y: -10000; }
        frame 3 { x: 42.1; y: 62.3; skew-x: 365.8; skew-y: 365.8; scale-x: 0.692; }
        frame 4 { x: 43.3; y: 61.2; skew-x: 368.8; skew-y: 368.8; scale-x: -10000; scale-y: 0.798; }
        frame 5 { x: 43.5; y: 62; skew-x: 366; skew-y: 366; scale-y: -10000; }
        frame 6 { x: -10000; y: 62.7; skew-x: 363.3; skew-y: 363.3; }
        frame 7 { x: 43.6; y: 63.6; skew-x: 360.5; skew-y: 360.5; scale-x: 0.691; }
        frame 8 { x: 43.9; y: 64.5; skew-x: 357.8; skew-y: 357.8; scale-x: -10000; scale-y: 0.797; }
        frame 9 { x: 44; y: 65.4; skew-x: 355; skew-y: 355; scale-y: -10000; }
        frame 10 { x: 44.1; y: 66.3; skew-x: 352.2; skew-y: 352.2; }
        frame 11 { x: 44; y: 65.8; skew-x: 352.7; skew-y: 352.7; }
        frame 12 { x: 43.8; y: 65.2; skew-x: 353; skew-y: 353; }
        frame 13 { x: 43.7; y: 64.6; skew-x: 353.2; skew-y: 353.2; }
        frame 14 { x: 43.5; y: 64; skew-x: 353.5; skew-y: 353.5; }
        frame 15 { x: 43.4; y: 63.5; skew-x: 353.9; skew-y: 353.9; }
        frame 16 { x: 43.3; y: 63.1; skew-x: 354.1; skew-y: 354.1; scale-x: 0.692; scale-y: 0.798; }
        frame 17 { x: 42.8; y: 64; skew-x: 353.7; skew-y: 353.7; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 42.2; y: 64.8; skew-x: 353.2; skew-y: 353.2; }
        frame 19 { x: 41.6; y: 65.6; skew-x: 352.9; skew-y: 352.9; }
        frame 20 { x: 41; y: 66.3; skew-x: 352.5; skew-y: 352.5; scale-y: 0.799; }
        frame 21 { x: 40.5; y: 67.2; skew-x: 352; skew-y: 352; scale-x: 0.693; scale-y: -10000; }
        frame 22 { x: 39.8; y: 68; skew-x: 351.5; skew-y: 351.5; scale-x: -10000; scale-y: 0.8; }
        frame 23 { x: 39.7; y: 67.6; skew-x: 352.5; skew-y: 352.5; scale-y: 0.799; }
        frame 24 { x: 39.5; y: 67.3; skew-x: 353.4; skew-y: 353.4; scale-y: -10000; }
        frame 25 { x: 39.4; y: 66.9; skew-x: 354.2; skew-y: 354.2; }
        frame 26 { x: 39; y: 66.5; skew-x: 355.2; skew-y: 355.2; scale-y: 0.8; }
        frame 27 { x: 38.9; y: 66.2; skew-x: 356.2; skew-y: 356.2; scale-y: -10000; }
        frame 28 { x: 38.8; y: 65.8; skew-x: 357; skew-y: 357; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 37.4; y: 64.5; skew-x: 357.5; skew-y: 357.5; scale-y: 0.799; }
        frame 31 { x: 36; y: 62.9; skew-x: 357.9; skew-y: 357.9; scale-x: 0.692; scale-y: -10000; }
        frame 32 { x: 34.5; y: 61.5; skew-x: 358.2; skew-y: 358.2; scale-x: -10000; scale-y: 0.798; }
        frame 33 { x: 33.1; y: 60; skew-x: 358.6; skew-y: 358.6; scale-x: 0.691; scale-y: -10000; }
        frame 34 { x: 33.4; y: 61.3; skew-x: 353.4; skew-y: 353.4; scale-x: -10000; scale-y: 0.797; }
        frame 35 { x: 33.8; y: 62.6; skew-x: 348; skew-y: 348; scale-y: -10000; }
        frame 36 { x: 34.2; y: 64; skew-x: 342.7; skew-y: 342.7; scale-x: 0.69; scale-y: 0.796; }
        frame 37 { x: 34.6; y: 65.4; skew-x: 337.3; skew-y: 337.3; scale-x: 0.691; scale-y: 0.797; }
        frame 38 { x: 35.3; y: -10000; skew-x: 334.4; skew-y: 334.4; scale-x: 0.69; scale-y: 0.796; }
        frame 39 { x: 35.8; y: 65.3; skew-x: 331.7; skew-y: 331.7; scale-x: 0.689; scale-y: 0.795; }
        frame 40 { x: 36.5; y: 65.4; skew-x: 328.7; skew-y: 328.7; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 37; y: 65.6; skew-x: 325.8; skew-y: 325.8; scale-x: 0.69; scale-y: 0.796; }
        frame 42 { x: 37.8; y: 66.3; skew-x: 323.9; skew-y: 323.9; scale-x: 0.688; scale-y: 0.794; }
        frame 43 { x: 38.5; y: 67.1; skew-x: 321.9; skew-y: 321.9; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 39.3; y: 68; skew-x: 319.9; skew-y: 319.9; }
        frame 45 { x: 40.1; y: 68.8; skew-x: 317.8; skew-y: 317.8; scale-x: 0.689; scale-y: 0.795; }
        frame 46 { x: 39; y: 69.2; skew-x: 319.1; skew-y: 319.1; scale-x: 0.688; scale-y: 0.794; }
        frame 47 { x: 38; y: 69.7; skew-x: 320.4; skew-y: 320.4; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 36.8; y: 70.1; skew-x: 321.9; skew-y: 321.9; scale-y: 0.793; }
        frame 49 { x: 35.8; y: 70.6; skew-x: 323.1; skew-y: 323.1; scale-x: 0.689; scale-y: 0.795; }
        frame 50 { x: 34.1; y: 69.6; skew-x: 327.4; skew-y: 327.4; scale-x: 0.688; scale-y: 0.793; }
        frame 51 { x: 32.5; y: 68.7; skew-x: 331.7; skew-y: 331.7; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 31.1; y: 67.8; skew-x: 335.9; skew-y: 335.9; scale-x: 0.687; }
        frame 53 { x: 29.6; y: 66.9; skew-x: 340.2; skew-y: 340.2; scale-x: 0.688; scale-y: 0.794; }
        frame 54 { x: 30.4; y: 66.5; skew-x: 341.5; skew-y: 341.5; scale-x: 0.687; scale-y: 0.793; }
        frame 55 { x: 31.3; y: 66.1; skew-x: 342.9; skew-y: 342.9; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 32.1; y: 65.7; skew-x: 344.2; skew-y: 344.2; }
        frame 57 { x: 33; y: 65.4; skew-x: 345.4; skew-y: 345.4; scale-x: 0.688; scale-y: 0.794; }
        frame 58 { x: 33.1; y: 64.4; skew-x: 350.2; skew-y: 350.2; scale-x: 0.687; scale-y: 0.793; }
        frame 59 { x: 33.3; y: 63.5; skew-x: 355; skew-y: 355; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 33.6; y: 62.6; skew-x: 359.7; skew-y: 359.7; }
        frame 61 { x: 33.7; y: 61.9; skew-x: 364.3; skew-y: 364.3; }
        frame 62 { x: 33; y: 60.8; skew-x: 366.1; skew-y: 366.1; scale-y: 0.792; }
        frame 63 { x: 32.5; y: 59.6; skew-x: 368; skew-y: 368; scale-y: -10000; }
        frame 64 { x: 31.9; y: 58.6; skew-x: 369.8; skew-y: 369.8; scale-x: 0.686; }
        frame 65 { x: 31.3; y: 57.4; skew-x: 371.8; skew-y: 371.8; scale-x: -10000; }
        frame 66 { x: 30.4; y: 59; skew-x: 367.8; skew-y: 367.8; scale-y: 0.791; }
        frame 67 { x: 29.5; y: 60.5; skew-x: 363.6; skew-y: 363.6; scale-y: 0.792; }
        frame 68 { x: 28.6; y: 62.1; skew-x: 359.7; skew-y: 359.7; scale-y: -10000; }
        frame 69 { x: 27.8; y: 63.6; skew-x: 355.7; skew-y: 355.7; }
        frame 70 { x: 29.7; y: 64; skew-x: 356; skew-y: 356; scale-x: 0.687; scale-y: 0.793; }
        frame 71 { x: 31.5; y: 64.4; skew-x: 356.2; skew-y: 356.2; scale-x: 0.688; scale-y: 0.794; }
        frame 72 { x: 33.4; y: 64.8; skew-x: 356.5; skew-y: 356.5; scale-x: 0.69; scale-y: 0.796; }
        frame 73 { x: 35.1; y: 65.1; skew-x: 356.7; skew-y: 356.7; scale-x: 0.691; scale-y: 0.797; }
        frame 74 { x: 37; y: 65.5; skew-x: 356.9; skew-y: 356.9; scale-x: 0.692; scale-y: 0.798; }
        frame 75 { x: 38.8; y: 65.8; skew-x: 357; skew-y: 357; scale-x: 0.693; scale-y: 0.8; }
        frame 76 { x: 38.2; y: 53.8; skew-x: 459.5; skew-y: 459.5; scale-x: 0.692; scale-y: 0.841; }
        frame 77 { x: 38; y: 54; skew-x: 460.6; skew-y: 460.6; scale-x: 0.691; scale-y: 0.832; }
        frame 78 { x: -10000; y: 54.4; skew-x: 461.8; skew-y: 461.8; scale-x: -10000; scale-y: 0.822; }
        frame 79 { y: 54.6; skew-x: 463; skew-y: 463; scale-x: 0.69; scale-y: 0.813; }
        frame 80 { x: 38; y: 55; skew-x: 464.3; skew-y: 464.3; scale-x: 0.689; scale-y: 0.803; }
        frame 81 { x: 38.2; y: 55.3; skew-x: 465.6; skew-y: 465.6; scale-x: -10000; scale-y: 0.795; }
        frame 82 { x: 38.6; y: 55.5; skew-x: 467.6; skew-y: 467.6; scale-x: 0.688; scale-y: 0.794; }
        frame 83 { x: 39; y: 55.9; skew-x: 469.6; skew-y: 469.6; scale-x: -10000; scale-y: 0.793; }
        frame 84 { x: 39.5; y: 56; skew-x: 471.6; skew-y: 471.6; scale-x: 0.687; scale-y: -10000; }
        frame 85 { x: 39.9; y: 56.4; skew-x: 473.8; skew-y: 473.8; scale-x: -10000; }
        frame 86 { x: 40.2; y: 56.6; skew-x: 475.8; skew-y: 475.8; scale-x: 0.688; }
        frame 87 { x: 40.5; y: 56.8; skew-x: 476.6; skew-y: 475.3; scale-x: 0.687; }
        frame 88 { x: 40.8; y: 56.9; skew-x: 477.3; skew-y: 474.8; scale-x: 0.686; scale-y: 0.794; }
        frame 89 { x: 41.1; y: 57; skew-x: 478.1; skew-y: 474.3; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 41.3; y: 57.1; skew-x: 478.8; skew-y: 473.8; scale-x: 0.685; scale-y: 0.795; }
        frame 91 { x: 41.6; y: 57.4; skew-x: 479.6; skew-y: 473.3; scale-x: 0.686; scale-y: 0.796; }
        frame 92 { x: 41.4; y: 57.3; skew-x: 469.8; skew-y: 465; scale-x: 0.685; scale-y: 0.794; }
        frame 93 { x: 40.9; y: 57.4; skew-x: 460.3; skew-y: 456.6; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 40.1; y: 57.5; skew-x: 450.8; skew-y: 448.5; scale-x: 0.686; scale-y: 0.793; }
        frame 95 { x: 39.3; y: 57.9; skew-x: 441.4; skew-y: 440.2; scale-x: 0.685; scale-y: 0.791; }
        frame 96 { x: 37.9; y: 58.1; skew-x: 431.7; skew-y: 431.7; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 37.5; y: 58.2; skew-x: 429.7; skew-y: 429.7; scale-x: 0.684; scale-y: 0.79; }
        frame 98 { x: 37.2; y: 58.4; skew-x: 427.7; skew-y: 427.7; scale-x: -10000; scale-y: 0.789; }
        frame 99 { x: 36.9; y: 58.5; skew-x: 425.7; skew-y: 425.7; scale-y: -10000; }
        frame 100 { x: 36.4; y: -10000; skew-x: 423.5; skew-y: 423.5; }
        frame 101 { x: 36; y: 58.6; skew-x: 421.4; skew-y: 421.4; scale-x: 0.685; scale-y: 0.79; }
        frame 102 { x: -10000; y: 58.9; skew-x: 419.9; skew-y: 419.9; scale-x: 0.684; scale-y: 0.792; }
        frame 103 { x: 35.9; y: 59; skew-x: 418.2; skew-y: 418.2; scale-x: -10000; scale-y: 0.796; }
        frame 104 { x: 35.8; y: 59.1; skew-x: 416.6; skew-y: 416.6; scale-y: 0.799; }
        frame 105 { x: 35.7; y: 59; skew-x: 414.9; skew-y: 414.9; scale-x: 0.685; scale-y: 0.804; }
        frame 106 { x: 36.3; y: 58.6; skew-x: 417.2; skew-y: 417.2; scale-x: 0.684; scale-y: 0.816; }
        frame 107 { x: 36.8; y: 58.4; skew-x: 419.4; skew-y: 419.4; scale-x: -10000; scale-y: 0.829; }
        frame 108 { x: 37.2; y: 58.1; skew-x: 421.7; skew-y: 421.7; scale-y: 0.842; }
        frame 109 { x: 37.8; y: 57.9; skew-x: 423.9; skew-y: 423.9; scale-x: 0.685; scale-y: 0.856; }
        frame 110 { x: 38; y: 57.1; skew-x: 429.9; skew-y: 429.9; scale-x: -10000; scale-y: 0.845; }
        frame 111 { x: -10000; y: 56.4; skew-x: 435.9; skew-y: 435.9; scale-x: 0.687; scale-y: 0.836; }
        frame 112 { x: 38; y: 55.6; skew-x: 441.7; skew-y: 441.7; scale-x: 0.688; scale-y: 0.827; }
        frame 113 { x: 37.9; y: 55; skew-x: 447.7; skew-y: 447.7; scale-x: 0.69; scale-y: 0.818; }
        frame 114 { x: 37.6; y: 54.4; skew-x: 453.5; skew-y: 453.5; scale-x: 0.691; scale-y: 0.808; }
        frame 115 { x: 37; y: 53.8; skew-x: 459.5; skew-y: 459.5; scale-x: 0.692; scale-y: 0.799; }
        frame 116 { x: 38.8; y: 65.8; skew-x: 357; skew-y: 357; scale-x: 0.693; scale-y: 0.8; }
        frame 117 { x: 35.9; y: 69.4; skew-x: 355.2; skew-y: 355.2; scale-x: -10000; scale-y: 0.799; }
        frame 118 { x: 33.1; y: 73; skew-x: 353.4; skew-y: 353.4; scale-x: 0.692; scale-y: -10000; }
        frame 119 { x: 30.2; y: 76.6; skew-x: 351.5; skew-y: 351.5; scale-x: -10000; scale-y: 0.798; }
        frame 120 { x: 27.4; y: 80.1; skew-x: 349.7; skew-y: 349.7; scale-y: -10000; }
        frame 121 { x: 24.7; y: 83.7; skew-x: 347.9; skew-y: 347.9; scale-x: 0.691; scale-y: 0.797; }
        frame 122 { x: 21.8; y: 87.2; skew-x: 345.9; skew-y: 345.9; scale-x: -10000; scale-y: -10000; }
        frame 123 { x: 21.9; y: 88.9; skew-x: 346; skew-y: 346; scale-x: 0.69; scale-y: 0.796; }
        frame 124 { x: -10000; y: 90.8; skew-x: -10000; skew-y: -10000; scale-x: 0.691; scale-y: 0.797; }
        frame 125 { y: -10000; scale-x: 0.69; scale-y: 0.796; }
        frame 126 { scale-x: 0.691; scale-y: 0.797; }
        frame 127 { y: 89.8; scale-x: 0.69; scale-y: 0.796; }
        frame 128 { y: 89; scale-x: -10000; scale-y: -10000; }
        frame 129 { x: 21.8; y: 88.1; scale-x: 0.691; scale-y: 0.797; }
        frame 130 { x: -10000; y: 87.2; skew-x: 345.9; skew-y: 345.9; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: 21.4; y: 86.6; skew-x: 346; skew-y: 346; scale-x: 0.69; scale-y: 0.796; }
        frame 132 { x: 21.1; y: 86; skew-x: 345.9; skew-y: 345.9; scale-x: -10000; scale-y: -10000; }
        frame 133 { x: 20.6; y: 85.5; skew-x: 345.7; skew-y: 345.7; }
        frame 134 { x: 19.8; y: 84.3; skew-x: -10000; skew-y: -10000; scale-x: 0.689; scale-y: 0.795; }
        frame 135 { x: 18.9; y: 83.2; skew-x: 345.5; skew-y: 345.5; scale-x: -10000; scale-y: 0.794; }
        frame 136 { x: 18.1; y: 82; skew-x: 345.2; skew-y: 345.2; scale-y: 0.795; }
        frame 137 { x: 16.9; y: 81.8; skew-x: 345; skew-y: 345; scale-x: 0.688; scale-y: 0.794; }
        frame 138 { x: 15.6; y: 81.7; skew-x: 344.7; skew-y: 344.7; scale-x: 0.687; scale-y: 0.793; }
        frame 139 { x: 14.3; y: -10000; skew-x: 344.3; skew-y: 344.3; scale-x: 0.688; scale-y: -10000; }
        frame 140 { x: 12.7; y: 87; skew-x: 326.9; skew-y: 326.9; scale-x: 0.685; scale-y: 0.791; }
        frame 141 { x: 12.2; y: 92.8; skew-x: 309.4; skew-y: 309.4; scale-x: 0.684; scale-y: 0.789; }
        frame 142 { x: 12.9; y: 98.9; skew-x: 291.9; skew-y: 291.9; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: -10000; y: 97.8; skew-x: 279.3; skew-y: 279.3; scale-x: 0.683; scale-y: 0.787; }
        frame 144 { x: 13.5; y: 96.6; skew-x: 266.6; skew-y: 266.6; scale-x: 0.682; scale-y: 0.786; }
        frame 145 { x: 8.6; y: 96.8; skew-x: 241.5; skew-y: 241.5; scale-x: 0.68; scale-y: 0.784; }
        frame 146 { x: 4.9; y: 95.2; skew-x: 216.4; skew-y: 216.4; scale-x: -10000; scale-y: -10000; }
        frame 147 { x: -1.2; y: 106.8; skew-x: 235.9; skew-y: 235.4; scale-x: 0.647; scale-y: 0.782; }
        frame 148 { x: -6.5; y: 117.3; skew-x: 255.5; skew-y: 254.7; scale-x: 0.616; scale-y: -10000; }
        frame 149 { x: -10.7; y: 126.8; skew-x: 275; skew-y: 273.7; scale-x: 0.585; }
        frame 150 { x: -7.9; y: 126.4; skew-x: 264.5; skew-y: 263.7; scale-x: 0.631; }
        frame 151 { x: -4.7; y: 126; skew-x: 253.7; skew-y: 253.7; scale-x: 0.678; }
        frame 152 { x: -6.8; y: -10000; skew-x: 260.7; skew-y: 260.7; scale-x: 0.677; }
        frame 153 { x: -9; y: 125.8; skew-x: 267.5; skew-y: 267.5; scale-x: 0.678; }
        frame 154 { x: -10.7; y: 125.7; skew-x: 274.3; skew-y: 274.3; scale-x: -10000; scale-y: 0.783; }
        frame 155 { x: 53.9; y: 50.3; skew-x: 399.7; skew-y: 404.4; scale-x: 0.682; scale-y: 0.81; }
        frame 156 { x: 55.4; y: 51.6; skew-x: 407.1; skew-y: 411.2; scale-x: 0.681; scale-y: 0.808; }
        frame 157 { x: 56.9; y: 53.2; skew-x: 414.6; skew-y: 417.9; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 58.2; y: 54.9; skew-x: 421.9; skew-y: 424.7; scale-y: 0.807; }
        frame 159 { x: 59.6; y: 56.8; skew-x: 429.4; skew-y: 431.5; scale-y: -10000; }
        frame 160 { x: 60.8; y: 58.7; skew-x: 436.8; skew-y: 438.1; scale-x: 0.682; }
        frame 161 { x: 59.6; y: 56.8; skew-x: 429.4; skew-y: 431.5; scale-x: 0.681; }
        frame 162 { x: 58.3; y: 54.9; skew-x: 421.9; skew-y: 424.7; scale-x: -10000; }
        frame 163 { x: 57; y: 53.1; skew-x: 414.6; skew-y: 417.9; scale-y: 0.808; }
        frame 164 { x: 55.4; y: 51.6; skew-x: 407.1; skew-y: 411.2; scale-y: -10000; }
        frame 165 { x: 53.9; y: 50.3; skew-x: 399.7; skew-y: 404.4; scale-x: 0.682; scale-y: 0.81; }
    }
    Track {
        source-name: "Zombie_pogo_stick";
        frame-count: 166;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 155 { x: 7.8; y: 65.1; skew-x: -2.7; skew-y: -5.5; scale-x: 0.8; scale-y: 0.801; cel: 0; image: IMAGE_REANIM_ZOMBIE_POGO_STICK; }
        frame 156 { x: 8.1; y: -10000; skew-x: -10000; skew-y: -5.4; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 157 { x: 8.2; y: 65; skew-y: -10000; }
        frame 158 { x: 8.4; }
        frame 159 { x: 8.5; y: 64.9; }
        frame 160 { x: 8.6; y: 64.8; skew-y: -5.5; }
        frame 161 { x: 8.5; y: 65; skew-y: -5.4; }
        frame 162 { x: 8.3; skew-y: -10000; }
        frame 163 { x: 8.2; y: 65.1; }
        frame 164 { x: 8; y: -10000; }
        frame 165 { x: 7.8; skew-y: -5.5; }
    }
    Track {
        source-name: "Zombie_pogo_stickhands";
        frame-count: 166;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 155 { x: 7.8; y: 65.1; skew-x: -2.7; skew-y: -5.5; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_ZOMBIE_POGO_STICKHANDS; }
        frame 156 { x: 8.1; y: -10000; skew-x: -10000; skew-y: -5.4; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 157 { x: 8.2; y: 65; skew-y: -10000; }
        frame 158 { x: 8.4; }
        frame 159 { x: 8.5; y: 64.9; }
        frame 160 { x: 8.6; y: 64.8; skew-y: -5.5; }
        frame 161 { x: 8.5; y: 65; skew-y: -5.4; }
        frame 162 { x: 8.3; skew-y: -10000; }
        frame 163 { x: 8.2; y: 65.1; }
        frame 164 { x: 8; y: -10000; }
        frame 165 { x: 7.8; skew-y: -5.5; }
    }
}
