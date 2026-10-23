export component Zombie_football {
    fps: 12;
    Track {
        source-name: "anim_death";
        frame-count: 105;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 87 { cel: 0; }
        frame 88 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 105;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 51 { cel: 0; }
        frame 52 { cel: -10000; }
        frame 87 { cel: -1; }
        frame 88 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 105;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { cel: 0; }
        frame 22 { cel: -10000; }
        frame 51 { cel: -1; }
        frame 52 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 105;
        frame 21 { cel: -1; }
        frame 22 { cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 105;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { x: -59.8; y: 70.1; cel: 0; }
        frame 22 { x: -57.4; y: -10000; cel: -10000; }
        frame 23 { x: -55; }
        frame 24 { x: -52.6; }
        frame 25 { x: -50.2; }
        frame 26 { x: -47.8; }
        frame 27 { x: -47.5; }
        frame 28 { x: -47.3; }
        frame 29 { x: -47; }
        frame 30 { x: -46.7; }
        frame 31 { x: -46.4; }
        frame 32 { x: -46.1; }
        frame 33 { x: -45.8; }
        frame 34 { x: -44.3; }
        frame 35 { x: -42.8; }
        frame 36 { x: -41.3; }
        frame 37 { x: -39.8; }
        frame 38 { x: -38.3; }
        frame 39 { x: -36.8; }
        frame 40 { x: -35.3; }
        frame 41 { x: -33.8; }
        frame 42 { x: -33.5; }
        frame 43 { x: -33.3; }
        frame 44 { x: -33; }
        frame 45 { x: -32.7; }
        frame 46 { x: -32.4; }
        frame 47 { x: -32.1; }
        frame 48 { x: -31.8; }
        frame 49 { x: -30.8; }
        frame 50 { x: -29.8; }
        frame 51 { x: -10000; cel: -1; }
        frame 52 { cel: -10000; }
    }
    Track {
        source-name: "zombie_football_leftarm_upper";
        frame-count: 105;
        frame 0 { x: 35.9; y: 61.7; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTARM_UPPER; }
        frame 1 { x: -10000; y: 60.9; skew-x: 358.9; skew-y: 358.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 60.2; skew-x: 359.2; skew-y: 359.2; }
        frame 3 { x: 35.8; y: 59.5; skew-x: 359.5; skew-y: 359.5; }
        frame 4 { x: 35.9; y: 58.8; skew-x: 359.7; skew-y: 359.7; }
        frame 5 { x: -10000; y: 58; skew-x: 360; skew-y: 360; }
        frame 6 { y: 58.8; skew-x: 359.7; skew-y: 359.7; }
        frame 7 { y: 59.4; skew-x: 359.5; skew-y: 359.5; }
        frame 8 { y: 60.2; skew-x: 359.2; skew-y: 359.2; }
        frame 9 { x: 35.8; y: 60.9; skew-x: 358.9; skew-y: 358.9; }
        frame 10 { x: 35.9; y: 61.7; skew-x: 358.5; skew-y: 358.5; }
        frame 11 { x: 35.8; y: 62.5; skew-x: 358.2; skew-y: 358.2; }
        frame 12 { x: 35.9; y: 63.1; skew-x: 357.9; skew-y: 357.9; }
        frame 13 { x: -10000; y: 63.9; skew-x: 357.5; skew-y: 357.5; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { y: 64.6; skew-x: 357.2; skew-y: 357.2; scale-x: -10000; scale-y: -10000; }
        frame 15 { y: 65.3; skew-x: 356.7; skew-y: 356.7; }
        frame 16 { x: 35.8; y: 64.6; skew-x: 357.2; skew-y: 357.2; }
        frame 17 { x: -10000; y: 63.9; skew-x: 357.5; skew-y: 357.5; }
        frame 18 { y: 63.1; skew-x: 357.9; skew-y: 357.9; scale-x: 0.8; scale-y: 0.8; }
        frame 19 { y: 62.5; skew-x: 358.2; skew-y: 358.2; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 35.9; y: 61.7; skew-x: 358.5; skew-y: 358.5; }
        frame 21 { x: 23.7; y: 62.6; skew-x: 415.4; skew-y: 415.4; scale-x: 0.796; scale-y: 0.796; }
        frame 22 { x: -10000; y: 58.6; skew-x: -10000; skew-y: -10000; scale-x: 0.795; scale-y: 0.795; }
        frame 23 { y: 54.6; scale-x: 0.796; scale-y: 0.796; }
        frame 24 { x: 25.1; y: 45.6; scale-x: 0.795; scale-y: 0.795; }
        frame 25 { x: 26.6; y: 36.5; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 28.1; y: 27.5; scale-x: 0.796; scale-y: 0.796; }
        frame 27 { x: 28.3; y: 24.5; scale-x: 0.795; scale-y: 0.795; }
        frame 28 { x: 28.5; y: 21.5; scale-x: 0.796; scale-y: 0.796; }
        frame 29 { x: 28.9; y: 24; scale-x: 0.795; scale-y: 0.795; }
        frame 30 { x: 29.3; y: 26.7; scale-x: 0.796; scale-y: 0.796; }
        frame 31 { x: 25.8; y: 37.6; scale-x: 0.795; scale-y: 0.795; }
        frame 32 { x: 22.3; y: 48.5; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 18.9; y: 59.5; scale-x: 0.796; scale-y: 0.796; }
        frame 34 { x: 17.7; y: 64.5; scale-x: 0.795; scale-y: 0.795; }
        frame 35 { x: 16.5; y: 69.5; scale-x: 0.796; scale-y: 0.796; }
        frame 36 { x: 16.7; y: 64.1; scale-x: 0.795; scale-y: 0.795; }
        frame 37 { x: 16.9; y: 58.6; scale-x: 0.796; scale-y: 0.796; }
        frame 38 { x: 18.1; y: 54.6; scale-x: 0.795; scale-y: 0.795; }
        frame 39 { x: 19.3; y: 50.6; scale-x: 0.796; scale-y: 0.796; }
        frame 40 { x: 22.1; y: 42.5; scale-x: 0.795; scale-y: 0.795; }
        frame 41 { x: 24.9; y: 34.4; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 27.7; y: 26.3; scale-x: 0.796; scale-y: 0.796; }
        frame 43 { x: -10000; y: 24.2; scale-x: 0.795; scale-y: 0.795; }
        frame 44 { x: 27.8; y: 21.9; scale-x: 0.796; scale-y: 0.796; }
        frame 45 { x: 27.5; y: 24.1; scale-x: 0.795; scale-y: 0.795; }
        frame 46 { x: 27.3; y: 26.3; scale-x: 0.796; scale-y: 0.796; }
        frame 47 { x: 21.7; y: 42.3; scale-x: 0.795; scale-y: 0.795; }
        frame 48 { x: 16.1; y: 58.3; scale-x: 0.796; scale-y: 0.796; }
        frame 49 { x: 19.9; y: 60.4; scale-x: 0.795; scale-y: 0.795; }
        frame 50 { x: 23.7; y: 62.6; scale-x: 0.796; scale-y: 0.796; }
        frame 51 { x: 35.9; y: 61.7; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 52 { x: 36.5; y: 61.1; skew-x: 362.1; skew-y: 362.1; scale-x: 0.799; scale-y: 0.799; }
        frame 53 { x: 37.1; y: 60.4; skew-x: 366; skew-y: 366; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 37.9; y: 59.9; skew-x: 369.8; skew-y: 369.8; }
        frame 55 { x: 38.5; y: 59.3; skew-x: 373.5; skew-y: 373.5; scale-x: 0.798; scale-y: 0.798; }
        frame 56 { x: 39.3; y: 58.8; skew-x: 377.3; skew-y: 377.3; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 40.1; y: 58.3; skew-x: 381.1; skew-y: 381.1; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 39.5; y: 59.6; skew-x: 379.5; skew-y: 379.5; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: 38.9; y: 60.8; skew-x: 377.8; skew-y: 377.8; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 38.4; y: 62.1; skew-x: 376.3; skew-y: 376.3; }
        frame 61 { x: 37.9; y: 63.5; skew-x: 374.8; skew-y: 374.8; }
        frame 62 { x: 37.2; y: 64.8; skew-x: 373.1; skew-y: 373.1; }
        frame 63 { x: 36.7; y: 66.1; skew-x: 371.6; skew-y: 371.6; }
        frame 64 { x: 37.1; y: 65; skew-x: 372.5; skew-y: 372.5; }
        frame 65 { x: 37.6; y: 63.9; skew-x: 373.6; skew-y: 373.6; }
        frame 66 { x: 38.1; y: 62.9; skew-x: 374.6; skew-y: 374.6; }
        frame 67 { x: 38.6; y: 61.7; skew-x: 375.8; skew-y: 375.8; }
        frame 68 { x: 39.1; y: 60.6; skew-x: 376.8; skew-y: 376.8; }
        frame 69 { x: 39.4; y: 59.5; skew-x: 377.8; skew-y: 377.8; scale-x: 0.799; scale-y: 0.799; }
        frame 70 { x: 40; y: 59.3; skew-x: 378.3; skew-y: 378.3; scale-x: 0.798; scale-y: 0.798; }
        frame 71 { x: 40.6; y: 59.1; skew-x: 378.8; skew-y: 378.8; scale-x: 0.797; scale-y: 0.797; }
        frame 72 { x: 41.1; y: 59; skew-x: 379.1; skew-y: 379.1; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 41.6; y: 58.8; skew-x: 379.6; skew-y: 379.6; }
        frame 74 { x: 42.1; y: 58.6; skew-x: 380.1; skew-y: 380.1; }
        frame 75 { x: 42.7; y: 58.3; skew-x: 380.6; skew-y: 380.6; }
        frame 76 { x: 42.6; y: 59.7; skew-x: 376.8; skew-y: 376.8; scale-x: 0.796; scale-y: 0.796; }
        frame 77 { x: 42.5; y: 61.1; skew-x: 373; skew-y: 373; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 42.4; y: 62.6; skew-x: 369.1; skew-y: 369.1; }
        frame 79 { x: -10000; y: 64; skew-x: 365.3; skew-y: 365.3; }
        frame 80 { y: 65.5; skew-x: 361.5; skew-y: 361.5; }
        frame 81 { x: 42.3; y: 67; skew-x: 357.8; skew-y: 357.8; }
        frame 82 { x: 41; y: 66; skew-x: 358; skew-y: 358; scale-x: 0.797; scale-y: 0.797; }
        frame 83 { x: 39.8; y: 64.9; skew-x: 358.2; skew-y: 358.2; scale-x: 0.798; scale-y: 0.798; }
        frame 84 { x: 38.4; y: 63.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 37.1; y: 62.9; skew-x: 358.5; skew-y: 358.5; scale-x: 0.799; scale-y: 0.799; }
        frame 86 { x: 35.9; y: 61.7; skew-x: -10000; skew-y: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: 39.4; y: 59.5; skew-x: 377.8; skew-y: 377.8; scale-x: 0.799; scale-y: 0.799; }
        frame 88 { x: 44; y: 60.6; skew-x: 382; skew-y: 382; scale-x: 0.785; scale-y: 0.797; }
        frame 89 { x: 48.5; y: 61.6; skew-x: 386.3; skew-y: 386.3; scale-x: 0.772; scale-y: -10000; }
        frame 90 { x: 53.1; y: 62.6; skew-x: 390.6; skew-y: 390.6; scale-x: 0.759; scale-y: 0.796; }
        frame 91 { x: 57.6; y: 63.8; skew-x: 394.8; skew-y: 394.8; scale-x: 0.747; scale-y: 0.797; }
        frame 92 { x: 71; y: 66.3; skew-x: 401.3; skew-y: 401.3; scale-x: 0.745; scale-y: 0.795; }
        frame 93 { x: 84.4; y: 69.1; skew-x: 407.7; skew-y: 407.7; scale-x: 0.744; scale-y: 0.794; }
        frame 94 { x: 97.7; y: 71.9; skew-x: 414.2; skew-y: 414.2; scale-x: 0.743; scale-y: 0.793; }
        frame 95 { x: 111; y: 74.7; skew-x: 420.6; skew-y: 420.6; scale-x: 0.744; scale-y: 0.794; }
        frame 96 { x: 126.5; y: 79.7; skew-x: 409.2; skew-y: 409.2; scale-x: 0.742; scale-y: 0.792; }
        frame 97 { x: 138.3; y: 85; skew-x: 382.7; skew-y: 382.8; scale-x: 0.74; scale-y: 0.79; }
        frame 98 { x: 150.7; y: 91.9; skew-x: 379.9; skew-y: 379.9; scale-x: 0.741; scale-y: 0.791; }
        frame 99 { x: 150.3; y: 95; skew-x: 374.6; skew-y: 376.3; scale-x: 0.746; scale-y: 0.743; }
        frame 100 { x: 150.1; y: 98; skew-x: 369.6; skew-y: 372.9; scale-x: 0.753; scale-y: 0.696; }
        frame 101 { x: -10000; y: 93.8; skew-x: 370.3; skew-y: 372; scale-x: 0.746; scale-y: 0.743; }
        frame 102 { x: 150; y: 89.5; skew-x: 371.1; skew-y: 371.1; scale-x: 0.741; scale-y: 0.791; }
        frame 103 { x: -10000; y: 91; skew-x: 371; skew-y: 371; scale-x: -10000; scale-y: -10000; }
        frame 104 { y: 92.5; skew-x: 371.1; skew-y: 371.1; }
    }
    Track {
        source-name: "zombie_football_leftleg_foot";
        frame-count: 105;
        frame 0 { x: 36.6; y: 112.2; skew-x: 357; skew-y: 357; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTLEG_FOOT; }
        frame 1 { x: 36.8; y: 112.1; skew-x: 357.7; skew-y: 357.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -10000; y: -10000; skew-x: 358.2; skew-y: 358.2; }
        frame 3 { x: 36.9; y: 112; skew-x: 358.9; skew-y: 358.9; }
        frame 4 { x: -10000; skew-x: 359.5; skew-y: 359.5; }
        frame 5 { x: 37; y: -10000; skew-x: 360; skew-y: 360; }
        frame 6 { x: -10000; y: 112; skew-x: 359.5; skew-y: 359.5; }
        frame 7 { x: 36.9; skew-x: 358.9; skew-y: 358.9; }
        frame 8 { x: 36.8; skew-x: 358.2; skew-y: 358.2; }
        frame 9 { x: 36.6; y: 112.1; skew-x: 357.7; skew-y: 357.7; }
        frame 10 { x: -10000; y: 112.2; skew-x: 357; skew-y: 357; }
        frame 11 { y: -10000; skew-x: 356.5; skew-y: 356.5; }
        frame 12 { y: 112.3; skew-x: 355.9; skew-y: 355.9; }
        frame 13 { x: 36.4; y: -10000; skew-x: 355.2; skew-y: 355.2; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 36.5; y: 112.4; skew-x: 354.7; skew-y: 354.7; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 36.4; y: -10000; skew-x: 354; skew-y: 354; scale-x: 0.8; scale-y: 0.8; }
        frame 16 { x: -10000; y: 112.3; skew-x: 354.7; skew-y: 354.7; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: 36.5; y: -10000; skew-x: 355.2; skew-y: 355.2; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -10000; y: 112.2; skew-x: 355.9; skew-y: 355.9; scale-x: 0.8; scale-y: 0.8; }
        frame 19 { x: 36.6; y: -10000; skew-x: 356.5; skew-y: 356.5; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: -10000; skew-x: 357; skew-y: 357; }
        frame 21 { x: 58; y: 112.6; skew-x: 353.8; skew-y: 353.8; scale-x: 0.798; scale-y: 0.798; }
        frame 22 { x: 65.6; y: 114.6; skew-x: 340.5; skew-y: 340.5; scale-x: 0.797; scale-y: 0.797; }
        frame 23 { x: 74; y: 116.8; skew-x: 327.2; skew-y: 327.2; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 88.1; y: 117; skew-x: 293.1; skew-y: 293.1; scale-x: 0.796; scale-y: 0.796; }
        frame 25 { x: 100.7; y: 108.9; skew-x: 273; skew-y: 273; scale-x: 0.795; scale-y: 0.795; }
        frame 26 { x: 114.7; y: 98.7; skew-x: 253.2; skew-y: 253.2; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -10000; y: 96; skew-x: -10000; skew-y: -10000; scale-x: 0.794; scale-y: 0.794; }
        frame 28 { y: 93.1; scale-x: -10000; scale-y: -10000; }
        frame 29 { y: 95.9; }
        frame 30 { y: 98.7; scale-x: 0.795; scale-y: 0.795; }
        frame 31 { x: 111.4; y: 104.2; skew-x: 250; skew-y: 250; scale-x: 0.794; scale-y: 0.794; }
        frame 32 { x: 108.1; y: 109.7; skew-x: 246.7; skew-y: 246.7; scale-x: 0.793; scale-y: 0.793; }
        frame 33 { x: 104.8; y: 115.1; skew-x: 243.5; skew-y: 243.5; scale-x: 0.794; scale-y: 0.794; }
        frame 34 { x: 99.6; y: 118.1; skew-x: 246.7; skew-y: 246.7; scale-x: 0.792; scale-y: 0.792; }
        frame 35 { x: 94.4; y: 121; skew-x: 250; skew-y: 250; scale-x: 0.791; scale-y: 0.791; }
        frame 36 { x: 83; y: 123.3; skew-x: 259.2; skew-y: 259.2; scale-x: 0.789; scale-y: 0.789; }
        frame 37 { x: 71.9; y: 125.3; skew-x: 268.3; skew-y: 268.3; scale-x: 0.787; scale-y: 0.787; }
        frame 38 { x: 44.9; y: 119.7; skew-x: 322.4; skew-y: 322.4; scale-x: 0.786; scale-y: 0.786; }
        frame 39 { x: 37.6; y: 115.3; skew-x: 340.3; skew-y: 340.3; scale-x: 0.787; scale-y: 0.787; }
        frame 40 { x: 34.8; y: 96.4; skew-x: 379.3; skew-y: 379.3; scale-x: 0.785; scale-y: 0.785; }
        frame 41 { x: 32.3; y: 83.5; skew-x: 399.1; skew-y: 399.1; scale-x: 0.783; scale-y: 0.783; }
        frame 42 { x: 30.2; y: 72.6; skew-x: 418.7; skew-y: 418.7; scale-x: 0.784; scale-y: 0.784; }
        frame 43 { x: -10000; y: 70.3; skew-x: -10000; skew-y: -10000; scale-x: 0.782; scale-y: 0.782; }
        frame 44 { y: 67.8; scale-x: 0.783; scale-y: 0.783; }
        frame 45 { y: 70.3; scale-x: 0.782; scale-y: 0.782; }
        frame 46 { y: 72.6; scale-x: 0.784; scale-y: 0.784; }
        frame 47 { x: 29.1; y: 89.7; skew-x: 395.1; skew-y: 395.1; scale-x: 0.783; scale-y: 0.783; }
        frame 48 { x: 28.9; y: 109.3; skew-x: 371.5; skew-y: 371.5; scale-x: 0.784; scale-y: 0.784; }
        frame 49 { x: 43.3; y: 110.9; skew-x: 362.5; skew-y: 362.5; scale-x: 0.791; scale-y: 0.791; }
        frame 50 { x: 58; y: 112.6; skew-x: 353.8; skew-y: 353.8; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { x: 36.6; y: 112.2; skew-x: 357; skew-y: 357; scale-x: 0.8; scale-y: 0.8; }
        frame 52 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 38.5; y: 104.2; skew-x: 371.6; skew-y: 371.6; scale-x: 0.799; scale-y: 0.799; }
        frame 89 { x: 41.1; y: 97; skew-x: 386.3; skew-y: 386.3; scale-x: 0.797; scale-y: 0.797; }
        frame 90 { x: 44.5; y: 90.9; skew-x: 401.1; skew-y: 401.1; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 48.1; y: 85.9; skew-x: 415.8; skew-y: 415.8; }
        frame 92 { x: 62.4; y: 82.8; skew-x: 435.7; skew-y: 435.7; scale-x: 0.796; scale-y: 0.796; }
        frame 93 { x: 75.9; y: 81.5; skew-x: 455.3; skew-y: 455.3; scale-x: 0.795; scale-y: 0.795; }
        frame 94 { x: 88; y: 82.1; skew-x: 475.3; skew-y: 475.3; scale-x: 0.794; scale-y: 0.794; }
        frame 95 { x: 98.3; y: 83.5; skew-x: 495.1; skew-y: 495.1; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 105.3; y: 83.8; skew-x: 488.4; skew-y: 488.4; scale-x: 0.792; scale-y: 0.792; }
        frame 97 { x: 112; y: 84.1; skew-x: 481.8; skew-y: 481.8; scale-x: 0.791; scale-y: 0.791; }
        frame 98 { x: 118.6; y: 84.6; skew-x: 475.3; skew-y: 475.3; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 112.8; y: 94.6; skew-x: 462.3; skew-y: 462.3; scale-x: 0.741; scale-y: 0.799; }
        frame 100 { x: 106.8; y: 105.3; skew-x: 449.3; skew-y: 449.5; scale-x: 0.692; scale-y: 0.809; }
        frame 101 { x: 105.2; y: 102.7; skew-x: 442; skew-y: 442.2; scale-x: 0.742; scale-y: 0.8; }
        frame 102 { x: 103.2; y: 100.4; skew-x: 434.6; skew-y: 434.6; scale-x: 0.792; scale-y: 0.792; }
        frame 103 { x: 105.5; y: 100.7; skew-x: 442.2; skew-y: 442.2; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 107.6; y: 100.9; skew-x: 449.4; skew-y: 449.4; }
    }
    Track {
        source-name: "zombie_football_leftleg_lower";
        frame-count: 105;
        frame 0 { x: 48.9; y: 100; skew-x: 354.2; skew-y: 354.2; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTLEG_LOWER; }
        frame 1 { x: 49.2; y: 99.9; skew-x: 355.5; skew-y: 355.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 49.6; y: -10000; skew-x: 356.7; skew-y: 356.7; scale-x: 0.8; scale-y: 0.8; }
        frame 3 { x: 49.8; y: 100; skew-x: 357.7; skew-y: 357.7; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 50.2; y: 99.9; skew-x: 359; skew-y: 359; }
        frame 5 { x: 50.6; y: 99.8; skew-x: 360; skew-y: 360; }
        frame 6 { x: 50.3; y: 99.9; skew-x: 359; skew-y: 359; }
        frame 7 { x: 49.9; y: -10000; skew-x: 357.7; skew-y: 357.7; }
        frame 8 { x: 49.6; skew-x: 356.7; skew-y: 356.7; }
        frame 9 { x: 49.3; y: 99.8; skew-x: 355.5; skew-y: 355.5; scale-x: 0.799; scale-y: 0.799; }
        frame 10 { x: 48.9; y: 100; skew-x: 354.2; skew-y: 354.2; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 48.6; skew-x: 353.2; skew-y: 353.2; }
        frame 12 { x: 48.3; y: -10000; skew-x: 352; skew-y: 352; }
        frame 13 { x: 48.1; y: 100.1; skew-x: 350.9; skew-y: 350.9; }
        frame 14 { x: 47.7; y: -10000; skew-x: 349.7; skew-y: 349.7; }
        frame 15 { x: 47.5; skew-x: 348.5; skew-y: 348.5; }
        frame 16 { x: 47.7; skew-x: 349.7; skew-y: 349.7; }
        frame 17 { x: 48.1; skew-x: 350.9; skew-y: 350.9; }
        frame 18 { x: 48.4; y: 100; skew-x: 352; skew-y: 352; }
        frame 19 { x: 48.7; y: 99.9; skew-x: 353.2; skew-y: 353.2; }
        frame 20 { x: 48.9; y: 100; skew-x: 354.2; skew-y: 354.2; }
        frame 21 { x: 61.1; y: 108.7; skew-x: 319.2; skew-y: 319.2; scale-x: 0.797; scale-y: 0.797; }
        frame 22 { x: 69.3; y: 105.8; skew-x: 319.4; skew-y: 319.4; scale-x: 0.796; scale-y: 0.796; }
        frame 23 { x: 77.2; y: 102.8; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: 82.8; y: 97.2; skew-x: 300.3; skew-y: 300.3; scale-x: 0.795; scale-y: 0.795; }
        frame 25 { x: 89.6; y: 91.6; skew-x: 281; skew-y: 281; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 97.6; y: 85.5; skew-x: 262; skew-y: 262; }
        frame 27 { x: -10000; y: 82.6; skew-x: 262.2; skew-y: 262.2; scale-x: 0.794; scale-y: 0.794; }
        frame 28 { y: 79.8; skew-x: -10000; skew-y: -10000; scale-x: 0.795; scale-y: 0.795; }
        frame 29 { y: 82.7; scale-x: 0.794; scale-y: 0.794; }
        frame 30 { y: 85.5; skew-x: 262; skew-y: 262; scale-x: 0.795; scale-y: 0.795; }
        frame 31 { x: 94.8; y: 93.2; skew-x: 253.7; skew-y: 253.7; scale-x: 0.794; scale-y: 0.794; }
        frame 32 { x: 92.3; y: 100.8; skew-x: 245.2; skew-y: 245.2; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 90; y: 108.2; skew-x: 236.7; skew-y: 236.7; }
        frame 34 { x: 82.1; y: 107.1; skew-x: 254; skew-y: 254; scale-x: 0.793; scale-y: 0.793; }
        frame 35 { x: 74.9; y: 105.2; skew-x: 271.2; skew-y: 271.2; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 67.7; y: 107.7; skew-x: 270.5; skew-y: 270.5; scale-x: 0.792; scale-y: 0.792; }
        frame 37 { x: 60.5; y: 110; skew-x: 269.8; skew-y: 269.8; scale-x: 0.79; scale-y: 0.79; }
        frame 38 { x: 51.3; y: 106.8; skew-x: 299.6; skew-y: 299.6; scale-x: 0.788; scale-y: 0.788; }
        frame 39 { x: 45; y: 103.6; skew-x: 329.4; skew-y: 329.4; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 43.6; y: 92.3; skew-x: 355.7; skew-y: 355.7; scale-x: 0.787; scale-y: 0.787; }
        frame 41 { x: -10000; y: 83; skew-x: 381.6; skew-y: 381.6; scale-x: 0.785; scale-y: 0.785; }
        frame 42 { x: 44.1; y: 76.1; skew-x: 407.9; skew-y: 407.9; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: -10000; y: 73.7; skew-x: -10000; skew-y: -10000; scale-x: 0.783; scale-y: 0.783; }
        frame 44 { y: 71.3; scale-x: 0.784; scale-y: 0.784; }
        frame 45 { y: 73.7; scale-x: 0.783; scale-y: 0.783; }
        frame 46 { y: 76.1; scale-x: 0.785; scale-y: 0.785; }
        frame 47 { x: 46; y: 88.3; skew-x: 393.6; skew-y: 393.6; scale-x: 0.784; scale-y: 0.784; }
        frame 48 { x: 48; y: 101.2; skew-x: 379.6; skew-y: 379.6; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 53.5; y: 103.8; skew-x: 349.5; skew-y: 349.5; scale-x: 0.79; scale-y: 0.79; }
        frame 50 { x: 61.1; y: 108.7; skew-x: 319.2; skew-y: 319.2; scale-x: 0.797; scale-y: 0.797; }
        frame 51 { x: 48.9; y: 100; skew-x: 354.2; skew-y: 354.2; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 49; y: 99.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: -10000; y: -10000; }
        frame 57 { x: 48.9; y: 100; }
        frame 58 { x: 49.6; y: 99.7; skew-x: 356.2; skew-y: 356.2; }
        frame 59 { x: 50.3; y: 99.5; skew-x: 358.2; skew-y: 358.2; }
        frame 60 { x: 51; y: 99.3; skew-x: 360; skew-y: 360; }
        frame 61 { x: 51.6; y: 99.1; skew-x: 361.8; skew-y: 361.8; }
        frame 62 { x: 52.1; y: 98.9; skew-x: 363.5; skew-y: 363.5; }
        frame 63 { x: 53; y: 98.7; skew-x: 365.5; skew-y: 365.5; }
        frame 64 { x: 52.3; y: 98.8; skew-x: 363.5; skew-y: 363.5; }
        frame 65 { x: 51.6; y: 99; skew-x: 361.8; skew-y: 361.8; }
        frame 66 { x: 50.9; y: 99.2; skew-x: 360; skew-y: 360; }
        frame 67 { x: 50.3; y: 99.4; skew-x: 358.2; skew-y: 358.2; }
        frame 68 { x: 49.5; y: 99.8; skew-x: 356.2; skew-y: 356.2; }
        frame 69 { x: 48.9; y: 100; skew-x: 354.2; skew-y: 354.2; }
        frame 70 { x: 49; y: 99.9; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: -10000; y: -10000; }
        frame 75 { x: 48.9; y: 100; }
        frame 76 { x: 49.6; y: 99.7; skew-x: 356.2; skew-y: 356.2; }
        frame 77 { x: 50.3; y: 99.5; skew-x: 358.2; skew-y: 358.2; }
        frame 78 { x: 51; y: 99.3; skew-x: 360; skew-y: 360; }
        frame 79 { x: 51.6; y: 99.1; skew-x: 361.8; skew-y: 361.8; }
        frame 80 { x: 52.1; y: 98.9; skew-x: 363.5; skew-y: 363.5; }
        frame 81 { x: 53; y: 98.7; skew-x: 365.5; skew-y: 365.5; }
        frame 82 { x: 52.1; y: 98.9; skew-x: 363.3; skew-y: 363.3; }
        frame 83 { x: 51.3; y: 99.1; skew-x: 361; skew-y: 361; }
        frame 84 { x: 50.5; y: 99.4; skew-x: 358.9; skew-y: 358.9; }
        frame 85 { x: 49.7; y: 99.6; skew-x: 356.7; skew-y: 356.7; }
        frame 86 { x: 48.9; y: 100; skew-x: 354.2; skew-y: 354.2; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 88 { x: 53; y: 96.3; skew-x: 370.3; skew-y: 370.3; scale-x: 0.798; scale-y: 0.798; }
        frame 89 { x: 57.5; y: 93.6; skew-x: 386.3; skew-y: 386.3; scale-x: 0.796; scale-y: 0.796; }
        frame 90 { x: 61.9; y: 91.8; skew-x: 402.4; skew-y: 402.4; scale-x: 0.795; scale-y: 0.795; }
        frame 91 { x: 66.2; y: 90.9; skew-x: 418.4; skew-y: 418.4; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 75.7; y: 92.7; skew-x: 438.4; skew-y: 438.4; scale-x: 0.794; scale-y: 0.794; }
        frame 93 { x: 84.1; y: 95.4; skew-x: 458; skew-y: 458; scale-x: 0.793; scale-y: 0.793; }
        frame 94 { x: 91.2; y: 98.8; skew-x: 477.8; skew-y: 477.8; scale-x: 0.792; scale-y: 0.792; }
        frame 95 { x: 96.8; y: 102.3; skew-x: 497.7; skew-y: 497.7; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 104.7; y: 104.3; skew-x: 495.1; skew-y: 495.1; scale-x: 0.789; scale-y: 0.789; }
        frame 97 { x: 112.7; y: 106.4; skew-x: 492.6; skew-y: 492.6; scale-x: 0.788; scale-y: 0.788; }
        frame 98 { x: 120.9; y: 108.5; skew-x: 490.2; skew-y: 490.2; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 120.6; y: 116; skew-x: 478.3; skew-y: 476.3; scale-x: 0.742; scale-y: 0.793; }
        frame 100 { x: 119.5; y: 123.3; skew-x: 466.6; skew-y: 462.3; scale-x: 0.697; scale-y: 0.799; }
        frame 101 { x: 120.1; y: 120.2; skew-x: 458; skew-y: 455.8; scale-x: 0.743; scale-y: 0.794; }
        frame 102 { x: 120.5; y: 117.2; skew-x: 449.5; skew-y: 449.5; scale-x: 0.789; scale-y: 0.789; }
        frame 103 { x: 120.3; y: 119.4; skew-x: 456.8; skew-y: 456.8; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 120; y: 121.5; skew-x: 464.3; skew-y: 464.3; }
    }
    Track {
        source-name: "zombie_football_leftleg_upper";
        frame-count: 105;
        frame 0 { x: 49.6; y: 80.5; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTLEG_UPPER; }
        frame 1 { x: 49.1; y: 80.9; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 49; y: 81.3; skew-x: 4.3; skew-y: 4.3; scale-x: 0.8; scale-y: 0.8; }
        frame 3 { x: 48.7; y: 81.6; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 48.5; y: 82; skew-x: 1.3; skew-y: 1.3; }
        frame 5 { x: 48.3; y: 82.3; skew-x: 0; skew-y: 0; }
        frame 6 { x: 48.5; y: 82; skew-x: 1.3; skew-y: 1.3; }
        frame 7 { x: 48.8; y: 81.6; skew-x: 2.8; skew-y: 2.8; }
        frame 8 { x: 49; y: 81.3; skew-x: 4.3; skew-y: 4.3; }
        frame 9 { x: 49.1; y: 80.9; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 10 { x: 49.6; y: 80.5; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 11 { x: 49.8; y: 80.2; skew-x: 8.8; skew-y: 8.8; scale-x: 0.799; scale-y: 0.799; }
        frame 12 { x: 50; y: 79.8; skew-x: 10.3; skew-y: 10.3; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 50.4; y: 79.5; skew-x: 11.8; skew-y: 11.8; }
        frame 14 { x: 50.6; y: 79.3; skew-x: 13.3; skew-y: 13.3; }
        frame 15 { x: 51; y: 78.9; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
        frame 16 { x: 50.6; y: 79.2; skew-x: 13.3; skew-y: 13.3; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: 50.4; y: 79.5; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 50; y: 79.8; skew-x: 10.3; skew-y: 10.3; }
        frame 19 { x: 49.8; y: 80.2; skew-x: 8.8; skew-y: 8.8; }
        frame 20 { x: 49.6; y: 80.5; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: 50.1; y: 92.7; skew-x: -29.4; skew-y: -29.4; scale-x: 0.798; scale-y: 0.798; }
        frame 22 { x: 52.6; y: 93.6; skew-x: -43.3; skew-y: -43.3; scale-x: 0.796; scale-y: 0.796; }
        frame 23 { x: 56.2; y: 94.6; skew-x: -57; skew-y: -57; scale-x: 0.797; scale-y: 0.797; }
        frame 24 { x: 62.8; y: 92.8; skew-x: -67.6; skew-y: -67.6; scale-x: 0.796; scale-y: 0.796; }
        frame 25 { x: 69.8; y: 90.6; skew-x: -78.4; skew-y: -78.4; scale-x: 0.795; scale-y: 0.795; }
        frame 26 { x: 77.5; y: 88.1; skew-x: -88.8; skew-y: -88.8; scale-x: 0.796; scale-y: 0.796; }
        frame 27 { x: -10000; y: 85.3; skew-x: -88.9; skew-y: -88.9; scale-x: 0.795; scale-y: 0.795; }
        frame 28 { y: 82.5; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 29 { y: 85.3; scale-x: 0.795; scale-y: 0.795; }
        frame 30 { y: 88.1; skew-x: -88.8; skew-y: -88.8; scale-x: 0.796; scale-y: 0.796; }
        frame 31 { x: 74.3; y: 92.7; skew-x: -81.8; skew-y: -81.8; scale-x: 0.795; scale-y: 0.795; }
        frame 32 { x: 71.2; y: 97; skew-x: -74.6; skew-y: -74.6; scale-x: 0.794; scale-y: 0.794; }
        frame 33 { x: 68.5; y: 101.1; skew-x: -67.3; skew-y: -67.3; scale-x: 0.795; scale-y: 0.795; }
        frame 34 { x: 62.8; y: 95.2; skew-x: -48.3; skew-y: -48.3; scale-x: 0.793; scale-y: 0.793; }
        frame 35 { x: 59; y: 89.1; skew-x: -29.2; skew-y: -29.2; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 52.2; y: 90.7; skew-x: -27.5; skew-y: -27.5; scale-x: 0.791; scale-y: 0.791; }
        frame 37 { x: 45.3; y: 92.4; skew-x: -25.9; skew-y: -25.9; scale-x: 0.792; scale-y: 0.792; }
        frame 38 { x: 43; y: 86.8; skew-x: -9.2; skew-y: -9.2; scale-x: 0.791; scale-y: 0.791; }
        frame 39 { x: 41.8; y: 82.1; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 43.7; y: 73.5; skew-x: 12.8; skew-y: 12.8; scale-x: 0.79; scale-y: 0.79; }
        frame 41 { x: 45.8; y: 64.9; skew-x: 18.6; skew-y: 18.6; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 48.1; y: 56.4; skew-x: 24.3; skew-y: 24.3; }
        frame 43 { x: 48; y: 54.1; skew-x: -10000; skew-y: -10000; scale-x: 0.789; scale-y: 0.789; }
        frame 44 { x: -10000; y: 51.6; scale-x: -10000; scale-y: -10000; }
        frame 45 { y: 54.1; }
        frame 46 { x: 48.1; y: 56.4; scale-x: 0.79; scale-y: 0.79; }
        frame 47 { x: 44.8; y: 69.7; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 42.4; y: 84; skew-x: -5.4; skew-y: -5.4; }
        frame 49 { x: 45.8; y: 88.1; skew-x: -17.4; skew-y: -17.4; scale-x: 0.793; scale-y: 0.793; }
        frame 50 { x: 50.1; y: 92.7; skew-x: -29.4; skew-y: -29.4; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { x: 49.6; y: 80.5; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 52 { x: 49.5; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 53 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 49.6; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: 49.5; y: 80.8; skew-x: 6.1; skew-y: 6.1; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { x: 49.6; y: 81; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: -10000; y: 81.3; skew-x: 4; skew-y: 4; }
        frame 61 { y: 81.5; skew-x: 2.8; skew-y: 2.8; }
        frame 62 { y: 81.7; skew-x: 1.8; skew-y: 1.8; }
        frame 63 { x: 49.7; y: 82; skew-x: 0.8; skew-y: 0.8; }
        frame 64 { x: -10000; y: 81.8; skew-x: 1.8; skew-y: 1.8; }
        frame 65 { x: 49.6; y: 81.5; skew-x: 2.8; skew-y: 2.8; }
        frame 66 { x: -10000; y: 81.2; skew-x: 4; skew-y: 4; }
        frame 67 { y: 81; skew-x: 5; skew-y: 5; }
        frame 68 { y: 80.8; skew-x: 6.1; skew-y: 6.1; }
        frame 69 { y: 80.5; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: 49.5; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 71 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 49.6; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: 49.5; y: 80.8; skew-x: 6.1; skew-y: 6.1; scale-x: 0.799; scale-y: 0.799; }
        frame 77 { x: 49.6; y: 81; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: -10000; y: 81.3; skew-x: 4; skew-y: 4; }
        frame 79 { y: 81.5; skew-x: 2.8; skew-y: 2.8; }
        frame 80 { y: 81.7; skew-x: 1.8; skew-y: 1.8; }
        frame 81 { x: 49.7; y: 82; skew-x: 0.8; skew-y: 0.8; }
        frame 82 { x: -10000; y: 81.7; skew-x: 2; skew-y: 2; }
        frame 83 { x: 49.6; y: 81.4; skew-x: 3.3; skew-y: 3.3; }
        frame 84 { x: -10000; y: 81.1; skew-x: 4.5; skew-y: 4.5; }
        frame 85 { y: 80.9; skew-x: 6; skew-y: 6; }
        frame 86 { y: 80.5; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 55.1; y: 78.7; skew-x: 14.5; skew-y: 14.5; scale-x: 0.799; scale-y: 0.799; }
        frame 89 { x: 60.8; y: 77.1; skew-x: 21.8; skew-y: 21.8; scale-x: 0.798; scale-y: 0.798; }
        frame 90 { x: 66.8; y: 75.7; skew-x: 29.3; skew-y: 29.3; scale-x: 0.797; scale-y: 0.797; }
        frame 91 { x: 72.8; y: 74.7; skew-x: 36.6; skew-y: 36.6; scale-x: 0.798; scale-y: 0.798; }
        frame 92 { x: 83.4; y: 78.8; skew-x: 48.7; skew-y: 48.7; scale-x: 0.796; scale-y: 0.796; }
        frame 93 { x: 94.1; y: 83.7; skew-x: 60.9; skew-y: 60.9; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 104.3; y: 89.4; skew-x: 73; skew-y: 73; }
        frame 95 { x: 114.3; y: 95.8; skew-x: 85; skew-y: 85; }
        frame 96 { x: 122; y: 96.4; skew-x: 80; skew-y: 80; scale-x: 0.795; scale-y: 0.795; }
        frame 97 { x: 129.7; y: 97.1; skew-x: 75; skew-y: 75; scale-x: 0.794; scale-y: 0.794; }
        frame 98 { x: 137.4; y: 98; skew-x: 69.8; skew-y: 69.8; scale-x: 0.793; scale-y: 0.793; }
        frame 99 { x: 133.5; y: 102.9; skew-x: 54.7; skew-y: 59.2; scale-x: 0.774; scale-y: 0.772; }
        frame 100 { x: 130.1; y: 108.7; skew-x: 39.5; skew-y: 48.3; scale-x: 0.757; scale-y: 0.753; }
        frame 101 { x: 130.2; y: 105.4; skew-x: 41.6; skew-y: 46.1; scale-x: 0.775; scale-y: 0.772; }
        frame 102 { x: 130.4; y: 101.8; skew-x: 43.9; skew-y: 43.9; scale-x: 0.795; scale-y: 0.795; }
        frame 103 { x: -10000; y: 103.3; skew-x: -10000; skew-y: -10000; scale-x: 0.793; scale-y: 0.793; }
        frame 104 { y: 104.8; scale-x: 0.795; scale-y: 0.795; }
    }
    Track {
        source-name: "zombie_football_lowerbody";
        frame-count: 105;
        frame 0 { x: 56.3; y: 75.6; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_LOWERBODY; }
        frame 1 { x: -10000; y: 75.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 74.9; }
        frame 3 { y: 74.6; }
        frame 4 { y: 74.3; }
        frame 5 { y: 74; }
        frame 6 { y: 74.3; }
        frame 7 { y: 74.6; }
        frame 8 { y: 74.9; }
        frame 9 { y: 75.3; }
        frame 10 { y: 75.6; }
        frame 11 { y: 75.9; }
        frame 12 { y: 76.2; }
        frame 13 { y: 76.5; }
        frame 14 { y: 76.9; }
        frame 15 { y: 77.2; }
        frame 16 { y: 76.9; }
        frame 17 { y: 76.5; }
        frame 18 { y: 76.2; }
        frame 19 { y: 75.9; }
        frame 20 { y: 75.6; }
        frame 21 { x: 54.3; y: 76.9; skew-x: 0.8; skew-y: -7.5; scale-x: 0.808; }
        frame 22 { x: 56.8; y: 69.9; skew-x: 8; skew-y: 4.6; scale-x: 0.772; scale-y: 0.911; }
        frame 23 { x: 59.8; y: 63.6; skew-x: 15.3; skew-y: 17.1; scale-x: 0.735; scale-y: 1.023; }
        frame 24 { x: 68.8; y: 50.6; skew-x: 33.4; skew-y: 27.3; scale-x: 0.658; scale-y: 1.258; }
        frame 25 { x: 73.5; y: 45.9; skew-x: 42.6; skew-y: 32.5; scale-x: 0.621; scale-y: 1.377; }
        frame 26 { x: 72.9; y: 31.3; skew-x: 55.1; skew-y: 41; scale-x: 0.756; scale-y: 1.376; }
        frame 27 { x: 72.8; y: 28.6; skew-x: 55.2; skew-y: 40.9; scale-x: 0.754; scale-y: 1.372; }
        frame 28 { x: -10000; y: 25.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.373; }
        frame 29 { x: 72.9; y: 28.6; scale-y: 1.372; }
        frame 30 { x: -10000; y: 31.3; skew-x: 55.1; skew-y: 41; scale-x: 0.756; scale-y: 1.376; }
        frame 31 { x: 70; y: 41.9; skew-x: 47.4; skew-y: 37.3; scale-x: 0.696; scale-y: 1.354; }
        frame 32 { x: 67.6; y: 52.4; skew-x: 39.4; skew-y: 33.6; scale-x: 0.637; scale-y: 1.335; }
        frame 33 { x: 65.5; y: 62.6; skew-x: 31.7; skew-y: 30; scale-x: 0.58; scale-y: 1.318; }
        frame 34 { x: 62.7; y: 64.8; skew-x: 28.6; skew-y: 26.8; scale-x: 0.579; scale-y: 1.316; }
        frame 35 { x: 60.1; y: 66.8; skew-x: 25.4; skew-y: 23.7; scale-x: -10000; scale-y: 1.317; }
        frame 36 { x: 61.3; y: 64.1; skew-x: 25.6; skew-y: 24; scale-x: 0.578; scale-y: 1.211; }
        frame 37 { x: 62.5; y: 61.1; skew-x: 26.1; skew-y: 24.4; scale-x: -10000; scale-y: 1.107; }
        frame 38 { x: 55.5; y: 64.8; skew-x: 10.3; skew-y: 8.6; scale-x: 0.617; scale-y: 1.102; }
        frame 39 { x: 49.3; y: 70.3; skew-x: -5.2; skew-y: -6.9; scale-x: 0.657; scale-y: 1.099; }
        frame 40 { x: 50.8; y: 64.1; skew-x: -5.7; skew-y: -7.4; scale-x: 0.675; scale-y: 1.098; }
        frame 41 { x: 52.4; y: 58; skew-x: -6.2; skew-y: -7.9; scale-x: 0.693; scale-y: 1.097; }
        frame 42 { x: 53.9; y: 51.9; skew-x: -6.8; skew-y: -8.5; scale-x: 0.711; scale-y: -10000; }
        frame 43 { x: -10000; y: 49.4; skew-x: -6.7; skew-y: -8.4; scale-x: -10000; }
        frame 44 { y: 47; skew-x: -10000; skew-y: -10000; }
        frame 45 { y: 49.5; }
        frame 46 { y: 51.9; skew-x: -6.8; skew-y: -8.5; }
        frame 47 { x: 50.3; y: 63.5; skew-x: -9.9; skew-y: -12.4; scale-x: 0.715; scale-y: 1.059; }
        frame 48 { x: 46.7; y: 75.3; skew-x: -13.2; skew-y: -16.5; scale-x: 0.719; scale-y: 1.021; }
        frame 49 { x: 46.3; y: 75.5; skew-x: -7.4; skew-y: -12.4; scale-x: 0.814; scale-y: 0.948; }
        frame 50 { x: 54.3; y: 76.9; skew-x: 0.8; skew-y: -7.5; scale-x: 0.808; scale-y: 0.8; }
        frame 51 { x: 56.3; y: 75.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: -10000; }
        frame 52 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 58 { y: 75.8; }
        frame 59 { y: 76.1; }
        frame 60 { y: 76.4; }
        frame 61 { y: 76.6; }
        frame 62 { y: 76.9; }
        frame 63 { y: 77.2; }
        frame 64 { y: 76.9; }
        frame 65 { y: 76.6; }
        frame 66 { y: 76.4; }
        frame 67 { y: 76.1; }
        frame 68 { y: 75.8; }
        frame 69 { y: 75.6; }
        frame 70 { y: -10000; }
        frame 76 { y: 75.8; }
        frame 77 { y: 76.1; }
        frame 78 { y: 76.4; }
        frame 79 { y: 76.6; }
        frame 80 { y: 76.9; }
        frame 81 { y: 77.2; }
        frame 82 { y: 76.9; }
        frame 83 { y: 76.5; }
        frame 84 { y: 76.2; }
        frame 85 { y: 75.9; }
        frame 86 { y: 75.6; }
        frame 87 { y: -10000; }
        frame 88 { x: 61.9; y: 72.9; skew-x: 3.5; skew-y: 3.5; scale-x: 0.784; scale-y: 0.893; }
        frame 89 { x: 67.8; y: 70.3; skew-x: 7; skew-y: 7; scale-x: 0.768; scale-y: 0.987; }
        frame 90 { x: 73.9; y: 67.7; skew-x: 10.5; skew-y: 10.5; scale-x: 0.752; scale-y: 1.08; }
        frame 91 { x: 80; y: 65.4; skew-x: 14; skew-y: 14; scale-x: 0.737; scale-y: 1.175; }
        frame 92 { x: 92.2; y: 73.4; skew-x: 22.1; skew-y: 27.6; scale-x: 0.698; scale-y: 1.165; }
        frame 93 { x: 104.3; y: 82.4; skew-x: 30.3; skew-y: 41.1; scale-x: 0.659; scale-y: 1.158; }
        frame 94 { x: 116; y: 92.6; skew-x: 38.6; skew-y: 54.9; scale-x: 0.621; scale-y: 1.15; }
        frame 95 { x: 127.3; y: 103.3; skew-x: 46.7; skew-y: 68.4; scale-x: 0.583; scale-y: 1.145; }
        frame 96 { x: 138.9; y: 105.6; skew-x: 60.9; skew-y: 77.2; scale-x: 0.569; scale-y: 1.143; }
        frame 97 { x: 150.5; y: 108.7; skew-x: 75.2; skew-y: 85.7; scale-x: 0.556; scale-y: 1.142; }
        frame 98 { x: 161.8; y: 112.6; skew-x: 89.4; skew-y: 94.3; scale-x: 0.543; scale-y: 1.141; }
        frame 99 { x: 159.7; y: 113.7; skew-x: 79.7; skew-y: 93.8; scale-x: 0.529; scale-y: 1.152; }
        frame 100 { x: 157.9; y: 115.3; skew-x: 70; skew-y: 93.7; scale-x: 0.516; scale-y: 1.164; }
        frame 101 { x: 157.8; y: 112.4; skew-x: 71.4; skew-y: 93.8; scale-x: 0.549; scale-y: 1.152; }
        frame 102 { x: 157.6; y: 109.3; skew-x: 72.7; skew-y: 94.3; scale-x: 0.582; scale-y: 1.141; }
        frame 103 { x: 157.7; y: 110.8; skew-x: -10000; skew-y: -10000; scale-x: 0.581; scale-y: -10000; }
        frame 104 { x: 157.6; y: 112.3; scale-x: 0.582; }
    }
    Track {
        source-name: "zombie_football_rightleg_lower";
        frame-count: 105;
        frame 0 { x: 81.4; y: 108.8; skew-x: 349.2; skew-y: 349.2; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_RIGHTLEG_LOWER; }
        frame 1 { x: 82.1; y: 108.5; skew-x: 351.5; skew-y: 351.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 82.8; y: 108.1; skew-x: 353.7; skew-y: 353.7; }
        frame 3 { x: 83.4; y: 107.8; skew-x: 355.7; skew-y: 355.7; scale-x: 0.8; scale-y: 0.8; }
        frame 4 { x: 84.2; y: 107.5; skew-x: 358; skew-y: 358; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 84.8; y: 107.2; skew-x: 360; skew-y: 360; }
        frame 6 { x: 84.1; y: 107.4; skew-x: 358; skew-y: 358; }
        frame 7 { x: 83.4; y: 107.8; skew-x: 355.7; skew-y: 355.7; }
        frame 8 { x: 82.8; y: 108.1; skew-x: 353.7; skew-y: 353.7; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 82.1; y: 108.4; skew-x: 351.5; skew-y: 351.5; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 81.4; y: 108.8; skew-x: 349.2; skew-y: 349.2; }
        frame 11 { x: 80.9; y: 109.1; skew-x: 347.2; skew-y: 347.2; }
        frame 12 { x: 80.2; y: 109.5; skew-x: 345; skew-y: 345; }
        frame 13 { x: 79.6; y: 109.8; skew-x: 342.9; skew-y: 342.9; }
        frame 14 { x: 79; y: 110.2; skew-x: 340.7; skew-y: 340.7; }
        frame 15 { x: 78.4; y: 110.5; skew-x: 338.4; skew-y: 338.4; scale-x: 0.8; scale-y: 0.8; }
        frame 16 { x: 79; y: 110.1; skew-x: 340.7; skew-y: 340.7; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: 79.6; y: 109.8; skew-x: 342.9; skew-y: 342.9; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 80.2; y: 109.3; skew-x: 345; skew-y: 345; }
        frame 19 { x: 80.9; y: 109; skew-x: 347.2; skew-y: 347.2; }
        frame 20 { x: 81.4; y: 108.8; skew-x: 349.2; skew-y: 349.2; }
        frame 21 { x: 72.8; y: 106.7; skew-x: 303.3; skew-y: 303.3; scale-x: 0.796; scale-y: 0.796; }
        frame 22 { x: 69.3; y: 104; skew-x: 306.4; skew-y: 306.4; scale-x: 0.795; scale-y: 0.795; }
        frame 23 { x: 65.8; y: 101.3; skew-x: 309.6; skew-y: 309.6; scale-x: 0.796; scale-y: 0.796; }
        frame 24 { x: 58.6; y: 90; skew-x: 342.9; skew-y: 342.9; scale-x: 0.794; scale-y: 0.794; }
        frame 25 { x: 54.9; y: 81.1; skew-x: 375.8; skew-y: 375.8; scale-x: 0.792; scale-y: 0.792; }
        frame 26 { x: 53; y: 76.3; skew-x: 409.1; skew-y: 409.1; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -10000; y: 73.5; skew-x: -10000; skew-y: -10000; scale-x: 0.79; scale-y: 0.79; }
        frame 28 { y: 70.8; scale-x: 0.791; scale-y: 0.791; }
        frame 29 { x: 52.9; y: 73.6; scale-x: 0.79; scale-y: 0.79; }
        frame 30 { x: 53; y: 76.3; scale-x: 0.792; scale-y: 0.792; }
        frame 31 { x: 51.6; y: 84.9; skew-x: 400.6; skew-y: 400.6; scale-x: 0.79; scale-y: 0.79; }
        frame 32 { x: 50.4; y: 93.7; skew-x: 392.1; skew-y: 392.1; scale-x: 0.789; scale-y: 0.789; }
        frame 33 { x: 49.2; y: 102.9; skew-x: 383.8; skew-y: 383.8; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 49.4; y: 107.3; skew-x: 362.3; skew-y: 362.3; scale-x: 0.788; scale-y: 0.788; }
        frame 35 { x: 50.7; y: 113; skew-x: 340.9; skew-y: 340.9; scale-x: 0.787; scale-y: 0.787; }
        frame 36 { x: 57.8; y: 111.9; skew-x: 341.2; skew-y: 341.2; scale-x: 0.786; scale-y: 0.786; }
        frame 37 { x: 64.8; y: 110.9; skew-x: 341.3; skew-y: 341.3; scale-x: 0.785; scale-y: 0.785; }
        frame 38 { x: 73.1; y: 109.9; skew-x: 345.4; skew-y: 345.4; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 81.4; y: 109.1; skew-x: 349.3; skew-y: 349.3; scale-x: 0.786; scale-y: 0.786; }
        frame 40 { x: 84.2; y: 101.5; skew-x: 330.9; skew-y: 330.9; scale-x: 0.784; scale-y: 0.784; }
        frame 41 { x: 88.2; y: 94.5; skew-x: 312.1; skew-y: 312.1; scale-x: 0.783; scale-y: 0.783; }
        frame 42 { x: 93.5; y: 87.6; skew-x: 293.7; skew-y: 293.7; scale-x: 0.784; scale-y: 0.784; }
        frame 43 { x: 93.6; y: 85.2; skew-x: 293.6; skew-y: 293.6; scale-x: 0.783; scale-y: 0.783; }
        frame 44 { x: -10000; y: 82.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 45 { y: 85.2; }
        frame 46 { x: 93.5; y: 87.6; skew-x: 293.7; skew-y: 293.7; scale-x: 0.784; scale-y: 0.784; }
        frame 47 { x: 88.8; y: 98.2; skew-x: 281.8; skew-y: 281.8; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 84.6; y: 108.4; skew-x: 270.3; skew-y: 270.3; scale-x: 0.785; scale-y: 0.785; }
        frame 49 { x: 78.2; y: 107.8; skew-x: 286.8; skew-y: 286.8; scale-x: 0.79; scale-y: 0.79; }
        frame 50 { x: 72.8; y: 106.7; skew-x: 303.3; skew-y: 303.3; scale-x: 0.796; scale-y: 0.796; }
        frame 51 { x: 81.4; y: 108.8; skew-x: 349.2; skew-y: 349.2; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 81.5; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: -10000; }
        frame 57 { x: 81.4; }
        frame 58 { x: 80.9; y: 109; skew-x: 348; skew-y: 348; }
        frame 59 { x: 80.3; y: 109.2; skew-x: 346.7; skew-y: 346.7; scale-x: 0.798; scale-y: 0.798; }
        frame 60 { x: 79.8; y: 109.5; skew-x: 345.5; skew-y: 345.5; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 79.3; y: 109.7; skew-x: 344.2; skew-y: 344.2; }
        frame 62 { x: 78.8; y: 110; skew-x: 342.9; skew-y: 342.9; }
        frame 63 { x: 78.1; y: 110.3; skew-x: 341.5; skew-y: 341.5; }
        frame 64 { x: 78.7; y: 110; skew-x: 342.9; skew-y: 342.9; }
        frame 65 { x: 79.3; y: 109.7; skew-x: 344.2; skew-y: 344.2; }
        frame 66 { x: 79.7; y: 109.5; skew-x: 345.5; skew-y: 345.5; }
        frame 67 { x: 80.3; y: 109.2; skew-x: 346.7; skew-y: 346.7; }
        frame 68 { x: 80.9; y: 109; skew-x: 348; skew-y: 348; scale-x: 0.799; scale-y: 0.799; }
        frame 69 { x: 81.4; y: 108.8; skew-x: 349.2; skew-y: 349.2; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 81.5; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: -10000; }
        frame 75 { x: 81.4; }
        frame 76 { x: 80.9; y: 109; skew-x: 348; skew-y: 348; }
        frame 77 { x: 80.3; y: 109.2; skew-x: 346.7; skew-y: 346.7; scale-x: 0.798; scale-y: 0.798; }
        frame 78 { x: 79.8; y: 109.5; skew-x: 345.5; skew-y: 345.5; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 79.3; y: 109.7; skew-x: 344.2; skew-y: 344.2; }
        frame 80 { x: 78.8; y: 110; skew-x: 342.9; skew-y: 342.9; }
        frame 81 { x: 78.1; y: 110.3; skew-x: 341.5; skew-y: 341.5; }
        frame 82 { x: 78.8; y: 109.9; skew-x: 343.2; skew-y: 343.2; }
        frame 83 { x: 79.4; y: 109.6; skew-x: 344.7; skew-y: 344.7; }
        frame 84 { x: 80.1; y: 109.4; skew-x: 346.2; skew-y: 346.2; }
        frame 85 { x: 80.7; y: 109.1; skew-x: 347.7; skew-y: 347.7; scale-x: 0.799; scale-y: 0.799; }
        frame 86 { x: 81.4; y: 108.8; skew-x: 349.2; skew-y: 349.2; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 88 { x: 81.7; y: 103.3; skew-x: 370.5; skew-y: 370.5; scale-x: 0.798; scale-y: 0.798; }
        frame 89 { x: 82.9; y: 99.6; skew-x: 392.1; skew-y: 392.1; scale-x: 0.796; scale-y: 0.796; }
        frame 90 { x: 84.2; y: 97.5; skew-x: 413.4; skew-y: 413.4; scale-x: 0.794; scale-y: 0.794; }
        frame 91 { x: 85.1; y: 97.2; skew-x: 434.9; skew-y: 434.9; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 92.8; y: 100.8; skew-x: 452.3; skew-y: 452.3; }
        frame 93 { x: 99.6; y: 105; skew-x: 469.8; skew-y: 469.8; scale-x: 0.792; scale-y: 0.792; }
        frame 94 { x: 105.2; y: 109.6; skew-x: 487.3; skew-y: 487.3; scale-x: 0.791; scale-y: 0.791; }
        frame 95 { x: 109.7; y: 114.2; skew-x: 504.8; skew-y: 504.8; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 113.4; y: 115.5; skew-x: 501.9; skew-y: 501.9; scale-x: 0.789; scale-y: 0.789; }
        frame 97 { x: 117.1; y: 116.9; skew-x: 498.9; skew-y: 498.9; scale-x: 0.788; scale-y: 0.788; }
        frame 98 { x: 120.9; y: 118.3; skew-x: 495.8; skew-y: 495.8; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 122.6; y: 124.7; skew-x: 484.4; skew-y: 481.6; scale-x: 0.745; scale-y: 0.79; }
        frame 100 { x: 123.8; y: 131; skew-x: 473; skew-y: 467.3; scale-x: 0.704; scale-y: 0.793; }
        frame 101 { x: 124.3; y: 126.2; skew-x: 460.8; skew-y: 458; scale-x: 0.746; scale-y: 0.79; }
        frame 102 { x: 124.1; y: 121.7; skew-x: 448.8; skew-y: 448.8; scale-x: 0.788; scale-y: 0.788; }
        frame 103 { x: 124.3; y: 125.8; skew-x: 459.3; skew-y: 459.3; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 124.2; y: 130.3; skew-x: 470; skew-y: 470; scale-x: 0.789; scale-y: 0.789; }
    }
    Track {
        source-name: "zombie_football_rightleg_foot";
        frame-count: 105;
        frame 0 { x: 69.8; y: 125.7; skew-x: 356; skew-y: 356; scale-x: 0.708; scale-y: 0.708; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_RIGHTLEG_FOOT; }
        frame 1 { x: 70; y: 125.6; skew-x: 356.9; skew-y: 356.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 70.1; y: -10000; skew-x: 357.7; skew-y: 357.7; }
        frame 3 { x: 70.4; y: 125.4; skew-x: 358.5; skew-y: 358.5; }
        frame 4 { x: 70.5; y: -10000; skew-x: 359.2; skew-y: 359.2; }
        frame 5 { x: 70.8; y: 125.3; skew-x: 360; skew-y: 360; }
        frame 6 { x: 70.6; y: -10000; skew-x: 359.2; skew-y: 359.2; }
        frame 7 { x: -10000; y: 125.4; skew-x: 358.5; skew-y: 358.5; }
        frame 8 { x: 70.4; y: 125.5; skew-x: 357.7; skew-y: 357.7; }
        frame 9 { x: 70.3; y: -10000; skew-x: 356.9; skew-y: 356.9; }
        frame 10 { x: 70.2; y: 125.7; skew-x: 356; skew-y: 356; }
        frame 11 { x: -10000; y: -10000; skew-x: 355.2; skew-y: 355.2; }
        frame 12 { x: 70.1; y: 125.8; skew-x: 354.5; skew-y: 354.5; }
        frame 13 { x: 70; y: 125.9; skew-x: 353.7; skew-y: 353.7; scale-x: 0.707; scale-y: 0.707; }
        frame 14 { x: 70.1; y: -10000; skew-x: 352.9; skew-y: 352.9; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 70; y: 126; skew-x: 352; skew-y: 352; scale-x: 0.708; scale-y: 0.708; }
        frame 16 { y: 125.9; skew-x: 352.9; skew-y: 352.9; scale-x: 0.707; scale-y: 0.707; }
        frame 17 { y: 125.8; skew-x: 353.7; skew-y: 353.7; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 69.9; y: 125.7; skew-x: 354.5; skew-y: 354.5; scale-x: 0.708; scale-y: 0.708; }
        frame 19 { x: -10000; y: 125.6; skew-x: 355.2; skew-y: 355.2; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 69.8; y: 125.7; skew-x: 356; skew-y: 356; }
        frame 21 { x: 80.5; y: 129.9; skew-x: 296.6; skew-y: 296.6; scale-x: 0.706; scale-y: 0.706; }
        frame 22 { x: 78.7; y: 129; skew-x: 296.3; skew-y: 296.3; scale-x: 0.705; scale-y: 0.705; }
        frame 23 { x: 76.9; y: 128.2; skew-x: -10000; skew-y: -10000; scale-x: 0.706; scale-y: 0.706; }
        frame 24 { x: 49.1; y: 113.7; skew-x: 333.9; skew-y: 333.9; scale-x: 0.703; scale-y: 0.703; }
        frame 25 { x: 37.1; y: 93; skew-x: 371.3; skew-y: 371.3; scale-x: 0.702; scale-y: 0.702; }
        frame 26 { x: 29.8; y: 76.2; skew-x: 409; skew-y: 409; scale-x: 0.701; scale-y: 0.701; }
        frame 27 { x: 30.1; y: 73.5; skew-x: 408.9; skew-y: 408.9; scale-x: 0.7; scale-y: 0.7; }
        frame 28 { x: 30.3; y: 70.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 30.6; y: 73.5; }
        frame 30 { x: 30.9; y: 76.2; skew-x: 409; skew-y: 409; scale-x: 0.701; scale-y: 0.701; }
        frame 31 { x: 30.1; y: 87.8; skew-x: 401.4; skew-y: 401.4; scale-x: 0.7; scale-y: 0.7; }
        frame 32 { x: 29.4; y: 99.6; skew-x: 393.9; skew-y: 393.9; scale-x: 0.699; scale-y: 0.699; }
        frame 33 { x: 28.9; y: 111.3; skew-x: 386.4; skew-y: 386.4; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 35.6; y: 117.1; skew-x: 377.1; skew-y: 377.1; scale-x: 0.698; scale-y: 0.698; }
        frame 35 { x: 42.4; y: 123.2; skew-x: 367.9; skew-y: 367.9; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 49.4; y: 124.4; skew-x: 362.5; skew-y: 362.5; }
        frame 37 { x: 56.3; y: 125.7; skew-x: 357.5; skew-y: 357.5; }
        frame 38 { x: 63.5; y: 125.8; skew-x: 357.7; skew-y: 357.7; scale-x: 0.697; scale-y: 0.697; }
        frame 39 { x: 70.8; y: -10000; skew-x: 357.5; skew-y: 357.5; scale-x: 0.698; scale-y: 0.698; }
        frame 40 { x: 86.3; y: 131.8; skew-x: 305.3; skew-y: 305.3; scale-x: 0.696; scale-y: 0.696; }
        frame 41 { x: 103; y: 122.4; skew-x: 279; skew-y: 279; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 121.4; y: 110.5; skew-x: 253; skew-y: 253; scale-x: 0.697; scale-y: 0.697; }
        frame 43 { x: 121.3; y: 107.8; skew-x: -10000; skew-y: -10000; scale-x: 0.696; scale-y: 0.696; }
        frame 44 { x: 121.1; y: 105; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: -10000; y: 107.7; }
        frame 46 { y: 110.5; scale-x: 0.697; scale-y: 0.697; }
        frame 47 { x: 114.2; y: 117.3; skew-x: 254.2; skew-y: 254.2; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 107.6; y: 123.7; skew-x: 255.2; skew-y: 255.2; }
        frame 49 { x: 93.8; y: 127.5; skew-x: 275.8; skew-y: 275.8; scale-x: 0.701; scale-y: 0.701; }
        frame 50 { x: 80.5; y: 129.9; skew-x: 296.6; skew-y: 296.6; scale-x: 0.706; scale-y: 0.706; }
        frame 51 { x: 69.8; y: 125.7; skew-x: 356; skew-y: 356; scale-x: 0.708; scale-y: 0.708; }
        frame 52 { x: 69.7; y: 125.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 69.6; y: -10000; }
        frame 54 { x: 69.5; }
        frame 55 { x: 69.4; }
        frame 56 { x: 69.2; }
        frame 57 { x: 69.1; y: 125.7; }
        frame 58 { x: 69.2; y: 125.6; }
        frame 59 { x: -10000; y: -10000; }
        frame 63 { x: 69.1; y: 125.7; }
        frame 64 { x: 69.2; y: 125.6; }
        frame 65 { x: -10000; y: -10000; }
        frame 69 { x: 69.1; y: 125.7; }
        frame 70 { x: 69.2; y: 125.6; }
        frame 71 { x: -10000; y: -10000; }
        frame 75 { x: 69.1; y: 125.7; }
        frame 76 { x: 69.2; y: 125.6; }
        frame 77 { x: -10000; y: -10000; }
        frame 81 { x: 69.1; y: 125.7; }
        frame 82 { x: 69.3; y: 125.6; }
        frame 83 { x: 69.5; y: -10000; }
        frame 84 { x: 69.6; }
        frame 85 { x: 69.7; }
        frame 86 { x: 69.8; y: 125.7; }
        frame 87 { x: -10000; y: -10000; }
        frame 88 { x: 65.7; y: 115.9; skew-x: 371; skew-y: 371; scale-x: 0.707; scale-y: 0.707; }
        frame 89 { x: 62.3; y: 106.7; skew-x: 386.1; skew-y: 386.1; scale-x: 0.706; scale-y: 0.706; }
        frame 90 { x: 59.6; y: 98.4; skew-x: 401.1; skew-y: 401.1; scale-x: 0.705; scale-y: 0.705; }
        frame 91 { x: 57.1; y: 91; skew-x: 416.2; skew-y: 416.2; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 70.3; y: 87.6; skew-x: 433.7; skew-y: 433.7; scale-x: 0.704; scale-y: 0.704; }
        frame 93 { x: 83; y: 85.8; skew-x: 451; skew-y: 451; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 95.2; y: 85; skew-x: 468.6; skew-y: 468.6; scale-x: 0.703; scale-y: 0.703; }
        frame 95 { x: 106.3; y: 85.3; skew-x: 486.2; skew-y: 486.2; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 108.3; y: 86.7; skew-x: 482.3; skew-y: 482.3; scale-x: 0.701; scale-y: 0.701; }
        frame 97 { x: 110.2; y: 88.2; skew-x: 478.6; skew-y: 478.6; scale-x: 0.7; scale-y: 0.7; }
        frame 98 { x: 112.2; y: 89.7; skew-x: 474.9; skew-y: 474.9; scale-x: 0.701; scale-y: 0.701; }
        frame 99 { x: 108.5; y: 99.9; skew-x: 461.8; skew-y: 462; scale-x: 0.657; scale-y: 0.708; }
        frame 100 { x: 104.8; y: 110.5; skew-x: 448.9; skew-y: 449.2; scale-x: 0.613; scale-y: 0.716; }
        frame 101 { x: 105.8; y: 107.8; skew-x: 449.5; skew-y: 449.5; scale-x: 0.657; scale-y: 0.708; }
        frame 102 { x: 106.7; y: 105.1; skew-x: 449.7; skew-y: 449.7; scale-x: 0.7; scale-y: 0.7; }
        frame 103 { x: 106.1; y: 105.7; skew-x: 449.5; skew-y: 449.5; scale-x: 0.701; scale-y: 0.701; }
        frame 104 { x: 105.6; y: 106.2; skew-x: 449; skew-y: 449; scale-x: 0.702; scale-y: 0.702; }
    }
    Track {
        source-name: "zombie_football_rightleg_upper";
        frame-count: 105;
        frame 0 { x: 73.4; y: 81.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_RIGHTLEG_UPPER; }
        frame 1 { x: 73.2; y: 81; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: -10000; y: 80.9; skew-x: 4.3; skew-y: 4.3; scale-x: 0.8; scale-y: 0.8; }
        frame 3 { x: 73.1; y: -10000; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 73; skew-x: 1.3; skew-y: 1.3; }
        frame 5 { x: 73.1; y: 80.8; skew-x: 0; skew-y: 0; }
        frame 6 { x: -10000; y: -10000; skew-x: 1.3; skew-y: 1.3; }
        frame 7 { x: 73.2; y: 80.9; skew-x: 2.8; skew-y: 2.8; }
        frame 8 { x: -10000; y: -10000; skew-x: 4.3; skew-y: 4.3; }
        frame 9 { x: 73.4; y: 81.1; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 10 { x: -10000; y: -10000; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 11 { x: 73.5; skew-x: 8.8; skew-y: 8.8; scale-x: 0.799; scale-y: 0.799; }
        frame 12 { x: 73.6; y: 81.2; skew-x: 10.3; skew-y: 10.3; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -10000; y: 81.3; skew-x: 11.8; skew-y: 11.8; }
        frame 14 { x: 73.8; y: 81.5; skew-x: 13.3; skew-y: 13.3; }
        frame 15 { x: 74.1; y: -10000; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
        frame 16 { x: 74; y: 81.4; skew-x: 13.3; skew-y: 13.3; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: 73.7; y: 81.3; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 73.8; y: 81.2; skew-x: 10.3; skew-y: 10.3; }
        frame 19 { x: 73.6; y: -10000; skew-x: 8.8; skew-y: 8.8; }
        frame 20 { x: 73.4; y: 81.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: 77.9; y: 74.3; skew-x: 35; skew-y: 35; scale-x: 0.798; scale-y: 0.798; }
        frame 22 { x: 77.7; y: 71.5; skew-x: 43.4; skew-y: 43.4; scale-x: 0.797; scale-y: 0.797; }
        frame 23 { x: 77.3; y: 69.2; skew-x: 51.8; skew-y: 51.8; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: -10000; y: 64.5; skew-x: 59.2; skew-y: 59.2; scale-x: 0.796; scale-y: 0.796; }
        frame 25 { x: 77.2; y: 60; skew-x: 66.7; skew-y: 66.7; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 77; y: 55.6; skew-x: 74.1; skew-y: 74.1; scale-x: 0.797; scale-y: 0.797; }
        frame 27 { x: 77.1; y: 52.9; skew-x: 74.2; skew-y: 74.2; scale-x: 0.796; scale-y: 0.796; }
        frame 28 { x: -10000; y: 50.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { y: 52.9; }
        frame 30 { x: 77; y: 55.6; skew-x: 74.1; skew-y: 74.1; scale-x: 0.797; scale-y: 0.797; }
        frame 31 { x: 72.7; y: 62.4; skew-x: 65.7; skew-y: 65.7; scale-x: 0.795; scale-y: 0.795; }
        frame 32 { x: 68.4; y: 69.4; skew-x: 56.9; skew-y: 56.9; scale-x: 0.794; scale-y: 0.794; }
        frame 33 { x: 63.6; y: 76.8; skew-x: 48.3; skew-y: 48.3; scale-x: 0.795; scale-y: 0.795; }
        frame 34 { x: 61; y: 80.3; skew-x: 41.1; skew-y: 41.1; scale-x: 0.793; scale-y: 0.793; }
        frame 35 { x: 58.2; y: 84; skew-x: 33.8; skew-y: 33.8; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 59.4; y: 82.4; skew-x: 23.1; skew-y: 23.1; scale-x: 0.792; scale-y: 0.792; }
        frame 37 { x: 60.6; y: 81.3; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 60.5; y: 82.8; skew-x: -2.5; skew-y: -2.5; scale-x: 0.791; scale-y: 0.791; }
        frame 39 { x: 61.1; y: 85.5; skew-x: -17.8; skew-y: -17.8; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 63.5; y: 81.2; skew-x: -25.7; skew-y: -25.7; scale-x: 0.789; scale-y: 0.789; }
        frame 41 { x: 66.1; y: 77; skew-x: -33.7; skew-y: -33.7; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 69; y: 72.9; skew-x: -41.6; skew-y: -41.6; scale-x: 0.79; scale-y: 0.79; }
        frame 43 { x: 69.1; y: 70.4; skew-x: -41.5; skew-y: -41.5; scale-x: 0.788; scale-y: 0.788; }
        frame 44 { x: -10000; y: 68.1; skew-x: -10000; skew-y: -10000; scale-x: 0.789; scale-y: 0.789; }
        frame 45 { y: 70.5; scale-x: 0.788; scale-y: 0.788; }
        frame 46 { x: 69; y: 72.9; skew-x: -41.6; skew-y: -41.6; scale-x: 0.79; scale-y: 0.79; }
        frame 47 { x: 66; y: 77.4; skew-x: -28.7; skew-y: -28.7; scale-x: 0.789; scale-y: 0.789; }
        frame 48 { x: 63.8; y: 82.3; skew-x: -15.9; skew-y: -15.9; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 69.9; y: 76.6; skew-x: 9.3; skew-y: 9.3; scale-x: 0.793; scale-y: 0.793; }
        frame 50 { x: 77.9; y: 74.3; skew-x: 35; skew-y: 35; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { x: 73.4; y: 81.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 52 { x: 73.3; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 53 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 73.4; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: 73.5; y: 80.9; skew-x: 8.5; skew-y: 8.5; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { x: -10000; y: 80.7; skew-x: 9.6; skew-y: 9.6; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 73.7; y: 80.5; skew-x: 10.8; skew-y: 10.8; }
        frame 61 { x: 73.8; y: 80.4; skew-x: 12; skew-y: 12; }
        frame 62 { x: 73.9; y: 80.2; skew-x: 13.3; skew-y: 13.3; }
        frame 63 { x: 74.1; y: 80; skew-x: 14.6; skew-y: 14.6; }
        frame 64 { x: 74; y: 80.2; skew-x: 13.3; skew-y: 13.3; }
        frame 65 { x: 73.8; y: 80.4; skew-x: 12; skew-y: 12; }
        frame 66 { x: 73.7; y: 80.6; skew-x: 10.8; skew-y: 10.8; }
        frame 67 { x: 73.5; y: 80.7; skew-x: 9.6; skew-y: 9.6; }
        frame 68 { x: -10000; y: 80.9; skew-x: 8.5; skew-y: 8.5; }
        frame 69 { x: 73.4; y: 81.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: 73.3; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 71 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 73.4; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: 73.5; y: 80.9; skew-x: 8.5; skew-y: 8.5; scale-x: 0.799; scale-y: 0.799; }
        frame 77 { x: -10000; y: 80.7; skew-x: 9.6; skew-y: 9.6; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 73.7; y: 80.5; skew-x: 10.8; skew-y: 10.8; }
        frame 79 { x: 73.8; y: 80.4; skew-x: 12; skew-y: 12; }
        frame 80 { x: 73.9; y: 80.2; skew-x: 13.3; skew-y: 13.3; }
        frame 81 { x: 74.1; y: 80; skew-x: 14.6; skew-y: 14.6; }
        frame 82 { x: 74; y: 80.2; skew-x: 13; skew-y: 13; }
        frame 83 { x: 73.8; y: 80.4; skew-x: 11.6; skew-y: 11.6; }
        frame 84 { x: 73.6; y: 80.6; skew-x: 10.1; skew-y: 10.1; }
        frame 85 { x: -10000; y: 80.8; skew-x: 8.8; skew-y: 8.8; }
        frame 86 { x: 73.4; y: 81.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 79.6; y: 77.8; skew-x: 17.8; skew-y: 19.8; scale-y: 0.798; }
        frame 89 { x: 85.9; y: 75.2; skew-x: 28.6; skew-y: 32.3; scale-x: 0.801; scale-y: 0.797; }
        frame 90 { x: 92.2; y: 73.5; skew-x: 39.1; skew-y: 44.8; scale-x: 0.802; scale-y: -10000; }
        frame 91 { x: 98.3; y: 72.5; skew-x: 49.9; skew-y: 57.3; scale-x: 0.804; scale-y: 0.798; }
        frame 92 { x: 109.1; y: 80.4; skew-x: 64.4; skew-y: 68.2; scale-x: 0.813; scale-y: 0.79; }
        frame 93 { x: 119.8; y: 89.1; skew-x: 78.7; skew-y: 79.2; scale-x: 0.823; scale-y: 0.784; }
        frame 94 { x: 130; y: 98.4; skew-x: 93; skew-y: 90; scale-x: 0.833; scale-y: 0.778; }
        frame 95 { x: 139.7; y: 108.6; skew-x: 107.5; skew-y: 100.8; scale-x: 0.843; scale-y: 0.771; }
        frame 96 { x: 142.5; y: 110.5; skew-x: 105.6; skew-y: 103.3; scale-x: 0.841; scale-y: 0.77; }
        frame 97 { x: 145.4; y: 112.5; skew-x: 103.8; skew-y: 105.8; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 148.1; y: 114.4; skew-x: 102; skew-y: 108.4; scale-x: 0.84; }
        frame 99 { x: 149.4; y: 116; skew-x: 95.3; skew-y: 95.8; scale-x: 0.788; scale-y: 0.777; }
        frame 100 { x: 150.4; y: 117.7; skew-x: 89; skew-y: 83.6; scale-x: 0.736; scale-y: 0.785; }
        frame 101 { x: 153.1; y: 115.1; skew-x: 97; skew-y: 90.8; scale-x: 0.788; scale-y: 0.777; }
        frame 102 { x: 155.8; y: 112.9; skew-x: 105; skew-y: 98.3; scale-x: 0.841; scale-y: 0.77; }
        frame 103 { x: 153.2; y: 113.9; skew-x: 97; skew-y: 90.3; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 150.3; y: 115.1; skew-x: 89.2; skew-y: 82.5; scale-x: 0.842; scale-y: 0.771; }
    }
    Track {
        source-name: "zombie_football_upperbody2";
        frame-count: 105;
        frame 0 { x: 15.4; y: 21.1; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_UPPERBODY2; }
        frame 1 { x: 15.7; y: 20.2; skew-x: 358.9; skew-y: 358.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 15.9; y: 19.5; skew-x: 359.2; skew-y: 359.2; }
        frame 3 { x: 16; y: 18.9; skew-x: 359.5; skew-y: 359.5; }
        frame 4 { x: 16.2; y: 18.2; skew-x: 359.7; skew-y: 359.7; }
        frame 5 { x: 16.4; y: 17.5; skew-x: 360; skew-y: 360; }
        frame 6 { x: 16.2; y: 18.1; skew-x: 359.7; skew-y: 359.7; }
        frame 7 { x: 16; y: 18.9; skew-x: 359.5; skew-y: 359.5; }
        frame 8 { x: 15.9; y: 19.5; skew-x: 359.2; skew-y: 359.2; }
        frame 9 { x: 15.6; y: 20.2; skew-x: 358.9; skew-y: 358.9; }
        frame 10 { x: 15.4; y: 21.1; skew-x: 358.5; skew-y: 358.5; }
        frame 11 { x: 15.2; y: 21.8; skew-x: 358.2; skew-y: 358.2; }
        frame 12 { x: 15; y: 22.5; skew-x: 357.9; skew-y: 357.9; }
        frame 13 { x: 14.7; y: 23.4; skew-x: 357.5; skew-y: 357.5; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 14.5; y: 24; skew-x: 357.2; skew-y: 357.2; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 14.2; y: 24.9; skew-x: 356.7; skew-y: 356.7; }
        frame 16 { x: 14.5; y: 24; skew-x: 357.2; skew-y: 357.2; }
        frame 17 { x: 14.7; y: 23.3; skew-x: 357.5; skew-y: 357.5; }
        frame 18 { x: 15; y: 22.4; skew-x: 357.9; skew-y: 357.9; scale-x: 0.8; scale-y: 0.8; }
        frame 19 { x: 15.2; y: 21.7; skew-x: 358.2; skew-y: 358.2; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 15.4; y: 21.1; skew-x: 358.5; skew-y: 358.5; }
        frame 21 { x: 7.2; y: 33.6; skew-x: 350.9; skew-y: 350.9; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 7.1; y: 29.3; skew-x: 351.2; skew-y: 351.2; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -10000; y: 25; skew-x: 351.6; skew-y: 351.6; }
        frame 24 { x: 11.2; y: 15.6; skew-x: 355.2; skew-y: 355.2; }
        frame 25 { x: 15.4; y: 6.2; skew-x: 358.7; skew-y: 358.7; }
        frame 26 { x: 19.9; y: -2.7; skew-x: 362.2; skew-y: 362.2; }
        frame 27 { x: 19.8; y: -5.3; skew-x: 362; skew-y: 362; }
        frame 28 { x: -10000; y: -8.2; skew-x: -10000; skew-y: -10000; }
        frame 29 { y: -5.3; }
        frame 30 { x: 19.9; y: -2.7; skew-x: 362.2; skew-y: 362.2; }
        frame 31 { x: 14; y: 8.2; skew-x: 358.7; skew-y: 358.7; }
        frame 32 { x: 8.4; y: 19.5; skew-x: 355.2; skew-y: 355.2; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 2.9; y: 30.8; skew-x: 351.8; skew-y: 351.8; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: -0.4; y: 36.4; skew-x: 348.7; skew-y: 348.7; }
        frame 35 { x: -3.8; y: 42.1; skew-x: 345.5; skew-y: 345.5; }
        frame 36 { x: -1.5; y: 36.3; skew-x: 348.7; skew-y: 348.7; scale-x: 0.797; scale-y: 0.797; }
        frame 37 { x: 0.8; y: 30.6; skew-x: 352; skew-y: 352; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 3.6; y: 26; skew-x: 354.5; skew-y: 354.5; scale-x: 0.797; scale-y: 0.797; }
        frame 39 { x: 6.4; y: 21.3; skew-x: 357; skew-y: 357; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 11.2; y: 13; skew-x: 360; skew-y: 360; scale-x: 0.797; scale-y: 0.797; }
        frame 41 { x: 15.9; y: 4.9; skew-x: 362.8; skew-y: 362.8; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 21; y: -3.2; skew-x: 365.8; skew-y: 365.8; }
        frame 43 { x: 21.1; y: -5.6; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 21; y: -8; }
        frame 45 { x: -10000; y: -5.5; }
        frame 46 { x: 21; y: -3.2; }
        frame 47 { x: 10.9; y: 12.9; skew-x: 359.5; skew-y: 359.5; }
        frame 48 { x: 1.4; y: 29.5; skew-x: 353.2; skew-y: 353.2; }
        frame 49 { x: 4.4; y: 31.4; skew-x: 352.2; skew-y: 352.2; scale-x: 0.798; scale-y: 0.798; }
        frame 50 { x: 7.2; y: 33.6; skew-x: 350.9; skew-y: 350.9; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 15.4; y: 21.1; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 52 { x: 15.9; y: 20.5; skew-x: 359.2; skew-y: 359.2; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 16.4; y: 20.1; skew-x: 359.7; skew-y: 359.7; }
        frame 54 { x: 16.8; y: 19.9; skew-x: 360; skew-y: 360; }
        frame 55 { x: 17.2; y: 19.5; skew-x: 360.5; skew-y: 360.5; }
        frame 56 { x: 17.6; y: 19.1; skew-x: 361; skew-y: 361; scale-x: 0.799; scale-y: 0.799; }
        frame 57 { x: 18.2; y: 18.5; skew-x: 361.7; skew-y: 361.7; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: 16.5; y: 20.6; skew-x: 360; skew-y: 360; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { x: 14.9; y: 22.3; skew-x: 358.7; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 13.3; y: 24.5; skew-x: 357; skew-y: 357; }
        frame 61 { x: 11.7; y: 26.4; skew-x: 355.5; skew-y: 355.5; }
        frame 62 { x: 10.1; y: 28.3; skew-x: 354; skew-y: 354; }
        frame 63 { x: 8.6; y: 30.5; skew-x: 352.2; skew-y: 352.2; }
        frame 64 { x: 9.8; y: 28.8; skew-x: 353.4; skew-y: 353.4; }
        frame 65 { x: 10.9; y: 27.3; skew-x: 354.5; skew-y: 354.5; }
        frame 66 { x: 12.1; y: 25.7; skew-x: 355.5; skew-y: 355.5; }
        frame 67 { x: 13.2; y: 24.2; skew-x: 356.5; skew-y: 356.5; }
        frame 68 { x: 14.3; y: 22.6; skew-x: 357.5; skew-y: 357.5; }
        frame 69 { x: 15.4; y: 21.1; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: 15.9; y: 20.5; skew-x: 359.2; skew-y: 359.2; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 16.4; y: 20.1; skew-x: 359.7; skew-y: 359.7; }
        frame 72 { x: 16.8; y: 19.9; skew-x: 360; skew-y: 360; }
        frame 73 { x: 17.2; y: 19.5; skew-x: 360.5; skew-y: 360.5; }
        frame 74 { x: 17.6; y: 19.1; skew-x: 361; skew-y: 361; scale-x: 0.799; scale-y: 0.799; }
        frame 75 { x: 18.2; y: 18.5; skew-x: 361.7; skew-y: 361.7; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: 16.5; y: 20.6; skew-x: 360; skew-y: 360; scale-x: 0.799; scale-y: 0.799; }
        frame 77 { x: 14.9; y: 22.3; skew-x: 358.7; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 13.3; y: 24.5; skew-x: 357; skew-y: 357; }
        frame 79 { x: 11.7; y: 26.4; skew-x: 355.5; skew-y: 355.5; }
        frame 80 { x: 10.1; y: 28.3; skew-x: 354; skew-y: 354; }
        frame 81 { x: 8.6; y: 30.5; skew-x: 352.2; skew-y: 352.2; }
        frame 82 { x: 10; y: 28.6; skew-x: 353.5; skew-y: 353.5; }
        frame 83 { x: 11.3; y: 26.7; skew-x: 354.7; skew-y: 354.7; }
        frame 84 { x: 12.7; y: 24.8; skew-x: 356; skew-y: 356; }
        frame 85 { x: 14.1; y: 22.9; skew-x: 357.2; skew-y: 357.2; }
        frame 86 { x: 15.4; y: 21.1; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 17.4; y: 24.1; skew-x: 355.5; skew-y: 355.5; scale-x: 0.799; scale-y: 0.799; }
        frame 89 { x: 19.6; y: 27.1; skew-x: 352.5; skew-y: 352.5; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 22; y: 30.2; skew-x: 349.5; skew-y: 349.5; }
        frame 91 { x: 24.6; y: 33.5; skew-x: 346.4; skew-y: 346.4; }
        frame 92 { x: 43.5; y: 30.6; skew-x: 358.5; skew-y: 358.5; scale-x: 0.798; scale-y: 0.798; }
        frame 93 { x: 64.8; y: 29.3; skew-x: 370.5; skew-y: 370.5; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 88.1; y: 29.8; skew-x: 382.6; skew-y: 382.6; scale-x: 0.797; scale-y: 0.797; }
        frame 95 { x: 113.1; y: 32.5; skew-x: 394.7; skew-y: 394.7; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 133.7; y: 34.6; skew-x: 403.4; skew-y: 403.4; scale-x: 0.795; scale-y: 0.795; }
        frame 97 { x: 154.7; y: 37.9; skew-x: 412.1; skew-y: 412.1; scale-x: 0.794; scale-y: 0.794; }
        frame 98 { x: 175.8; y: 42.6; skew-x: 420.7; skew-y: 420.7; scale-x: 0.795; scale-y: 0.795; }
        frame 99 { x: 176; y: 48.6; skew-x: 418.7; skew-y: 422.5; scale-x: 0.758; scale-y: 0.789; }
        frame 100 { x: 176.4; y: 54.4; skew-x: 416.7; skew-y: 424.3; scale-x: 0.724; scale-y: 0.785; }
        frame 101 { x: 172.3; y: 45.9; skew-x: 415.9; skew-y: 419.7; scale-x: 0.758; scale-y: 0.788; }
        frame 102 { x: 167.6; y: 37.5; skew-x: 414.8; skew-y: 414.8; scale-x: 0.794; scale-y: 0.794; }
        frame 103 { x: 171.6; y: 40.1; skew-x: 417.7; skew-y: 417.7; scale-x: 0.793; scale-y: 0.793; }
        frame 104 { x: 175.8; y: 42.6; skew-x: 420.7; skew-y: 420.7; scale-x: 0.795; scale-y: 0.795; }
    }
    Track {
        source-name: "zombie_football_leftarm_lower";
        frame-count: 105;
        frame 0 { x: 17.5; y: 69; skew-x: 354.7; skew-y: 354.7; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTARM_LOWER; }
        frame 1 { x: 17.6; y: 67.8; skew-x: 355.9; skew-y: 355.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 17.5; y: 66.6; skew-x: 357; skew-y: 357; }
        frame 3 { x: -10000; y: 65.5; skew-x: 358; skew-y: 358; }
        frame 4 { y: 64.3; skew-x: 359; skew-y: 359; scale-x: 0.8; scale-y: 0.8; }
        frame 5 { y: 63.2; skew-x: 360; skew-y: 360; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 17.4; y: 64.3; skew-x: 359; skew-y: 359; }
        frame 7 { x: 17.5; y: 65.5; skew-x: 358; skew-y: 358; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: -10000; y: 66.7; skew-x: 357; skew-y: 357; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 17.6; y: 67.8; skew-x: 355.9; skew-y: 355.9; }
        frame 10 { x: 17.5; y: 69; skew-x: 354.7; skew-y: 354.7; }
        frame 11 { x: 17.6; y: 70.1; skew-x: 353.7; skew-y: 353.7; scale-x: 0.798; scale-y: 0.798; }
        frame 12 { x: -10000; y: 71.3; skew-x: 352.7; skew-y: 352.7; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 17.5; y: 72.5; skew-x: 351.7; skew-y: 351.7; }
        frame 14 { x: 17.6; y: 73.6; skew-x: 350.7; skew-y: 350.7; }
        frame 15 { x: 17.5; y: 74.7; skew-x: 349.4; skew-y: 349.4; }
        frame 16 { x: 17.6; y: 73.5; skew-x: 350.7; skew-y: 350.7; }
        frame 17 { x: 17.5; y: 72.4; skew-x: 351.7; skew-y: 351.7; }
        frame 18 { x: 17.6; y: 71.2; skew-x: 352.7; skew-y: 352.7; }
        frame 19 { x: -10000; y: 70.1; skew-x: 353.7; skew-y: 353.7; }
        frame 20 { x: 17.5; y: 69; skew-x: 354.7; skew-y: 354.7; scale-x: 0.799; scale-y: 0.799; }
        frame 21 { x: -4.3; y: 67.2; skew-x: 359.8; skew-y: 359.8; scale-x: 0.795; scale-y: 0.795; }
        frame 22 { x: -10000; y: 63.1; skew-x: 360; skew-y: 360; scale-x: -10000; scale-y: -10000; }
        frame 23 { y: 59.2; skew-x: 359.8; skew-y: 359.8; }
        frame 24 { x: -2.9; y: 50.1; skew-x: 360; skew-y: 360; }
        frame 25 { x: -1.4; y: 41; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 0; y: 32; skew-x: 359.8; skew-y: 359.8; }
        frame 27 { x: 0.1; y: 29; skew-x: 360; skew-y: 360; }
        frame 28 { x: 0.3; y: 26; skew-x: 359.8; skew-y: 359.8; }
        frame 29 { x: 0.7; y: 28.6; skew-x: 360; skew-y: 360; }
        frame 30 { x: 1.1; y: 31.2; skew-x: 359.8; skew-y: 359.8; }
        frame 31 { x: -2.2; y: 42.1; skew-x: 360; skew-y: 360; }
        frame 32 { x: -5.7; y: 53; skew-x: -10000; skew-y: -10000; }
        frame 33 { x: -9.1; y: 64; skew-x: 359.8; skew-y: 359.8; }
        frame 34 { x: -10.3; y: 69; skew-x: 360; skew-y: 360; }
        frame 35 { x: -11.5; y: 74; skew-x: 359.8; skew-y: 359.8; }
        frame 36 { x: -11.3; y: 68.6; skew-x: 360; skew-y: 360; }
        frame 37 { x: -11.1; y: 63.2; skew-x: 359.8; skew-y: 359.8; }
        frame 38 { x: -9.9; y: 59.1; skew-x: 360; skew-y: 360; }
        frame 39 { x: -8.7; y: 55.2; skew-x: 359.8; skew-y: 359.8; }
        frame 40 { x: -5.9; y: 47.1; skew-x: 360; skew-y: 360; }
        frame 41 { x: -3.1; y: 39; skew-x: -10000; skew-y: -10000; }
        frame 42 { x: -0.3; y: 30.8; skew-x: 359.8; skew-y: 359.8; }
        frame 43 { x: -10000; y: 28.6; skew-x: 360; skew-y: 360; }
        frame 44 { x: -0.2; y: 26.5; skew-x: 359.8; skew-y: 359.8; }
        frame 45 { x: -0.5; y: 28.6; skew-x: 360; skew-y: 360; }
        frame 46 { x: -0.7; y: 30.8; skew-x: 359.8; skew-y: 359.8; }
        frame 47 { x: -6.4; y: 46.8; skew-x: 360; skew-y: 360; }
        frame 48 { x: -11.9; y: 62.8; skew-x: 359.8; skew-y: 359.8; }
        frame 49 { x: -8.1; y: 65; skew-x: 360; skew-y: 360; }
        frame 50 { x: -4.3; y: 67.2; skew-x: 359.8; skew-y: 359.8; }
        frame 51 { x: 18; y: 69; skew-x: 354.8; skew-y: 354.8; scale-x: 0.796; scale-y: 0.796; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTARM_EATINGLOWER; }
        frame 52 { x: 18.2; y: 67.8; skew-x: 357; skew-y: 357; scale-x: -10000; scale-y: -10000; image: none; }
        frame 53 { x: 18.4; y: 66.5; skew-x: 359; skew-y: 359; }
        frame 54 { x: 18.6; y: 65.3; skew-x: 360.8; skew-y: 360.8; }
        frame 55 { x: 18.9; y: 64; skew-x: 362.8; skew-y: 362.8; scale-x: 0.797; scale-y: 0.797; }
        frame 56 { x: 19.1; y: 62.8; skew-x: 365; skew-y: 365; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 19.4; y: 61.6; skew-x: 367.1; skew-y: 367.1; }
        frame 58 { x: 18.9; y: 63.5; skew-x: 365.3; skew-y: 365.3; }
        frame 59 { x: 18.5; y: 65.3; skew-x: 363.8; skew-y: 363.8; }
        frame 60 { x: 18; y: 67.2; skew-x: 362.3; skew-y: 362.3; }
        frame 61 { x: 17.6; y: 69.1; skew-x: 360.6; skew-y: 360.6; }
        frame 62 { x: 17.2; y: 70.8; skew-x: 359.2; skew-y: 359.2; scale-x: 0.796; scale-y: 0.796; }
        frame 63 { x: 16.8; y: 72.8; skew-x: 357.6; skew-y: 357.6; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 17.2; y: 71.4; skew-x: 358.7; skew-y: 358.7; }
        frame 65 { x: 17.5; y: 69.8; skew-x: 359.7; skew-y: 359.7; scale-x: 0.797; scale-y: 0.797; }
        frame 66 { x: 17.9; y: 68.4; skew-x: 360.5; skew-y: 360.5; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 18.2; y: 67; skew-x: 361.6; skew-y: 361.6; }
        frame 68 { x: 18.6; y: 65.5; skew-x: 362.8; skew-y: 362.8; }
        frame 69 { x: 19; y: 64; skew-x: 363.8; skew-y: 363.8; }
        frame 70 { x: 20.4; y: 61.3; skew-x: 370.3; skew-y: 370.3; scale-x: 0.796; scale-y: 0.796; }
        frame 71 { x: 22; y: 58.6; skew-x: 377.1; skew-y: 377.1; scale-x: 0.795; scale-y: 0.795; }
        frame 72 { x: 23.8; y: 56.1; skew-x: 383.8; skew-y: 383.8; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 25.7; y: 53.6; skew-x: 390.6; skew-y: 390.6; scale-x: 0.794; scale-y: 0.794; }
        frame 74 { x: 27.7; y: 51.3; skew-x: 397.1; skew-y: 397.1; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 29.7; y: 49.1; skew-x: 403.9; skew-y: 403.9; scale-x: 0.795; scale-y: 0.795; }
        frame 76 { x: 30.2; y: 50; skew-x: 404.4; skew-y: 399.3; scale-x: 0.793; scale-y: 0.814; }
        frame 77 { x: 30.4; y: 50.8; skew-x: 404.7; skew-y: 394.6; scale-x: -10000; scale-y: 0.834; }
        frame 78 { x: 30.8; y: 51.7; skew-x: 405.1; skew-y: 390.1; scale-x: 0.792; scale-y: 0.855; }
        frame 79 { x: 31.1; y: 52.5; skew-x: 405.6; skew-y: 385.3; scale-x: -10000; scale-y: 0.876; }
        frame 80 { x: 31.4; y: 53.4; skew-x: 405.9; skew-y: 380.8; scale-y: 0.896; }
        frame 81 { x: 31.5; y: 54.3; skew-x: 406.4; skew-y: 376.1; scale-x: 0.793; scale-y: 0.918; }
        frame 82 { x: 28.2; y: 57; skew-x: 396.1; skew-y: 371.8; scale-x: 0.792; scale-y: 0.893; }
        frame 83 { x: 25.1; y: 59.8; skew-x: 385.6; skew-y: 367.5; scale-x: 0.793; scale-y: 0.869; }
        frame 84 { x: 22.2; y: 62.9; skew-x: 375.3; skew-y: 363.3; scale-x: 0.794; scale-y: 0.845; }
        frame 85 { x: 19.9; y: 66.1; skew-x: 365; skew-y: 359.2; scale-x: 0.795; scale-y: 0.82; }
        frame 86 { x: 18; y: 69; skew-x: 354.8; skew-y: 354.8; scale-x: 0.796; scale-y: 0.796; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 88 { cel: -10000; }
    }
    Track {
        source-name: "zombie_football_upperbody";
        frame-count: 105;
        frame 0 { x: 15; y: 21.6; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_UPPERBODY; }
        frame 1 { x: 15.3; y: 20.7; skew-x: 358.9; skew-y: 358.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 15.5; y: 20; skew-x: 359.2; skew-y: 359.2; }
        frame 3 { x: 15.6; y: 19.3; skew-x: 359.5; skew-y: 359.5; }
        frame 4 { x: 15.8; y: 18.7; skew-x: 359.7; skew-y: 359.7; }
        frame 5 { x: 16; y: 18; skew-x: 360; skew-y: 360; }
        frame 6 { x: 15.8; y: 18.7; skew-x: 359.7; skew-y: 359.7; }
        frame 7 { x: 15.6; y: 19.4; skew-x: 359.5; skew-y: 359.5; }
        frame 8 { x: 15.5; y: 20; skew-x: 359.2; skew-y: 359.2; }
        frame 9 { x: 15.3; y: 20.7; skew-x: 358.9; skew-y: 358.9; }
        frame 10 { x: 15; y: 21.6; skew-x: 358.5; skew-y: 358.5; }
        frame 11 { x: 14.8; y: 22.3; skew-x: 358.2; skew-y: 358.2; }
        frame 12 { x: 14.6; y: 23; skew-x: 357.9; skew-y: 357.9; }
        frame 13 { x: 14.4; y: 23.8; skew-x: 357.5; skew-y: 357.5; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 14.2; y: 24.6; skew-x: 357.2; skew-y: 357.2; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 13.8; y: 25.4; skew-x: 356.7; skew-y: 356.7; }
        frame 16 { x: 14.1; y: 24.5; skew-x: 357.2; skew-y: 357.2; }
        frame 17 { x: 14.3; y: 23.8; skew-x: 357.5; skew-y: 357.5; }
        frame 18 { x: 14.5; y: 23; skew-x: 357.9; skew-y: 357.9; scale-x: 0.8; scale-y: 0.8; }
        frame 19 { x: 14.8; y: 22.2; skew-x: 358.2; skew-y: 358.2; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 15; y: 21.6; skew-x: 358.5; skew-y: 358.5; }
        frame 21 { x: 6.8; y: 34.2; skew-x: 350.9; skew-y: 350.9; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: -10000; y: 30; skew-x: 351.2; skew-y: 351.2; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 6.7; y: 25.6; skew-x: 351.6; skew-y: 351.6; }
        frame 24 { x: 10.8; y: 16; skew-x: 355.2; skew-y: 355.2; }
        frame 25 { x: 15; y: 6.7; skew-x: 358.7; skew-y: 358.7; }
        frame 26 { x: 19.4; y: -2.2; skew-x: 362.2; skew-y: 362.2; }
        frame 27 { x: -10000; y: -4.8; skew-x: 362; skew-y: 362; }
        frame 28 { y: -7.7; skew-x: -10000; skew-y: -10000; }
        frame 29 { y: -4.8; }
        frame 30 { y: -2.2; skew-x: 362.2; skew-y: 362.2; }
        frame 31 { x: 13.6; y: 8.8; skew-x: 358.7; skew-y: 358.7; }
        frame 32 { x: 8; y: 20; skew-x: 355.2; skew-y: 355.2; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 2.6; y: 31.4; skew-x: 351.8; skew-y: 351.8; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: -0.7; y: 37; skew-x: 348.7; skew-y: 348.7; }
        frame 35 { x: -4.1; y: 42.6; skew-x: 345.5; skew-y: 345.5; }
        frame 36 { x: -1.8; y: 36.9; skew-x: 348.7; skew-y: 348.7; scale-x: 0.797; scale-y: 0.797; }
        frame 37 { x: 0.4; y: 31.1; skew-x: 352; skew-y: 352; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 3.1; y: 26.4; skew-x: 354.5; skew-y: 354.5; scale-x: 0.797; scale-y: 0.797; }
        frame 39 { x: 5.9; y: 21.8; skew-x: 357; skew-y: 357; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 10.7; y: 13.4; skew-x: 360; skew-y: 360; scale-x: 0.797; scale-y: 0.797; }
        frame 41 { x: 15.5; y: 5.3; skew-x: 362.8; skew-y: 362.8; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 20.5; y: -2.7; skew-x: 365.8; skew-y: 365.8; }
        frame 43 { x: -10000; y: -5.1; skew-x: -10000; skew-y: -10000; }
        frame 44 { y: -7.5; }
        frame 45 { y: -5.1; }
        frame 46 { y: -2.7; }
        frame 47 { x: 10.5; y: 13.3; skew-x: 359.5; skew-y: 359.5; }
        frame 48 { x: 1.1; y: 30.1; skew-x: 353.2; skew-y: 353.2; }
        frame 49 { x: 4.1; y: 32; skew-x: 352.2; skew-y: 352.2; scale-x: 0.798; scale-y: 0.798; }
        frame 50 { x: 6.8; y: 34.2; skew-x: 350.9; skew-y: 350.9; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 15; y: 21.6; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 52 { x: 15.6; y: 21; skew-x: 359.2; skew-y: 359.2; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 16; y: 20.5; skew-x: 359.7; skew-y: 359.7; }
        frame 54 { x: 16.4; y: 20.4; skew-x: 360; skew-y: 360; }
        frame 55 { x: 16.8; y: 20; skew-x: 360.5; skew-y: 360.5; }
        frame 56 { x: 17.3; y: 19.5; skew-x: 361; skew-y: 361; scale-x: 0.799; scale-y: 0.799; }
        frame 57 { x: 17.8; y: 19; skew-x: 361.7; skew-y: 361.7; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: 16; y: 21.1; skew-x: 360; skew-y: 360; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { x: 14.5; y: 22.8; skew-x: 358.7; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 12.9; y: 25; skew-x: 357; skew-y: 357; }
        frame 61 { x: 11.3; y: 26.9; skew-x: 355.5; skew-y: 355.5; }
        frame 62 { x: 9.8; y: 28.9; skew-x: 354; skew-y: 354; }
        frame 63 { x: 8.3; y: 31; skew-x: 352.2; skew-y: 352.2; }
        frame 64 { x: 9.5; y: 29.2; skew-x: 353.4; skew-y: 353.4; }
        frame 65 { x: 10.5; y: 27.6; skew-x: 354.5; skew-y: 354.5; }
        frame 66 { x: 11.6; y: 26.1; skew-x: 355.5; skew-y: 355.5; }
        frame 67 { x: 12.7; y: 24.6; skew-x: 356.5; skew-y: 356.5; }
        frame 68 { x: 13.8; y: 23; skew-x: 357.5; skew-y: 357.5; }
        frame 69 { x: 15; y: 21.6; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: 15.6; y: 21; skew-x: 359.2; skew-y: 359.2; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 16; y: 20.5; skew-x: 359.7; skew-y: 359.7; }
        frame 72 { x: 16.4; y: 20.4; skew-x: 360; skew-y: 360; }
        frame 73 { x: 16.8; y: 20; skew-x: 360.5; skew-y: 360.5; }
        frame 74 { x: 17.3; y: 19.5; skew-x: 361; skew-y: 361; scale-x: 0.799; scale-y: 0.799; }
        frame 75 { x: 17.8; y: 19; skew-x: 361.7; skew-y: 361.7; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: 16; y: 21.1; skew-x: 360; skew-y: 360; scale-x: 0.799; scale-y: 0.799; }
        frame 77 { x: 14.5; y: 22.8; skew-x: 358.7; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 12.9; y: 25; skew-x: 357; skew-y: 357; }
        frame 79 { x: 11.3; y: 26.9; skew-x: 355.5; skew-y: 355.5; }
        frame 80 { x: 9.8; y: 28.9; skew-x: 354; skew-y: 354; }
        frame 81 { x: 8.3; y: 31; skew-x: 352.2; skew-y: 352.2; }
        frame 82 { x: 9.6; y: 29.1; skew-x: 353.5; skew-y: 353.5; }
        frame 83 { x: 10.9; y: 27.2; skew-x: 354.7; skew-y: 354.7; }
        frame 84 { x: 12.3; y: 25.3; skew-x: 356; skew-y: 356; }
        frame 85 { x: 13.6; y: 23.4; skew-x: 357.2; skew-y: 357.2; }
        frame 86 { x: 15; y: 21.6; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 17.1; y: 24.5; skew-x: 355.5; skew-y: 355.5; scale-x: 0.799; scale-y: 0.799; }
        frame 89 { x: 19.4; y: 27.7; skew-x: 352.5; skew-y: 352.5; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 21.8; y: 30.8; skew-x: 349.5; skew-y: 349.5; }
        frame 91 { x: 24.3; y: 34; skew-x: 346.4; skew-y: 346.4; }
        frame 92 { x: 43.1; y: 31.1; skew-x: 358.5; skew-y: 358.5; scale-x: 0.798; scale-y: 0.798; }
        frame 93 { x: 64.3; y: 29.7; skew-x: 370.5; skew-y: 370.5; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 87.5; y: 30.2; skew-x: 382.6; skew-y: 382.6; scale-x: 0.797; scale-y: 0.797; }
        frame 95 { x: 112.4; y: 32.7; skew-x: 394.7; skew-y: 394.7; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 133; y: 34.8; skew-x: 403.4; skew-y: 403.4; scale-x: 0.795; scale-y: 0.795; }
        frame 97 { x: 154; y: 38; skew-x: 412.1; skew-y: 412.1; scale-x: 0.794; scale-y: 0.794; }
        frame 98 { x: 175; y: 42.4; skew-x: 420.7; skew-y: 420.7; scale-x: 0.795; scale-y: 0.795; }
        frame 99 { x: 175.3; y: 48.3; skew-x: 418.7; skew-y: 422.5; scale-x: 0.758; scale-y: 0.789; }
        frame 100 { x: 175.6; y: 54.2; skew-x: 416.7; skew-y: 424.3; scale-x: 0.724; scale-y: 0.785; }
        frame 101 { x: 171.5; y: 45.8; skew-x: 415.9; skew-y: 419.7; scale-x: 0.758; scale-y: 0.788; }
        frame 102 { x: 166.8; y: 37.3; skew-x: 414.8; skew-y: 414.8; scale-x: 0.794; scale-y: 0.794; }
        frame 103 { x: 170.9; y: 39.9; skew-x: 417.7; skew-y: 417.7; scale-x: 0.793; scale-y: 0.793; }
        frame 104 { x: 175; y: 42.4; skew-x: 420.7; skew-y: 420.7; scale-x: 0.795; scale-y: 0.795; }
    }
    Track {
        source-name: "anim_hair";
        frame-count: 105;
        frame 0 { x: 26.7; y: 7.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_HAIR; }
        frame 1 { x: 26.9; y: 6.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 27.1; y: 6.4; }
        frame 3 { x: 27.3; y: 5.8; }
        frame 4 { x: 27.5; y: 5.3; }
        frame 5 { x: 27.7; y: 4.7; }
        frame 6 { x: 28.1; y: 4; scale-y: 0.824; }
        frame 7 { x: 28.5; y: 3.2; scale-y: 0.848; }
        frame 8 { x: 27.9; y: 4.5; scale-y: 0.832; }
        frame 9 { x: 27.3; y: 5.8; scale-y: 0.816; }
        frame 10 { x: 26.7; y: 7; scale-y: 0.8; }
        frame 11 { x: 26.5; y: 7.5; scale-y: -10000; }
        frame 12 { x: 26.3; y: 8.1; }
        frame 13 { x: 26.1; y: 8.6; }
        frame 14 { x: 25.9; y: 9.2; }
        frame 15 { x: 25.7; y: 9.7; }
        frame 16 { x: -10000; y: 10.4; scale-y: 0.768; }
        frame 17 { y: 11; scale-y: 0.735; }
        frame 18 { x: 26.1; y: 9.8; scale-y: 0.757; }
        frame 19 { x: 26.4; y: 8.7; scale-y: 0.778; }
        frame 20 { x: 26.7; y: 7.5; scale-y: 0.8; }
        frame 21 { x: 15.6; y: 18.5; skew-x: -7.6; skew-y: -7.6; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 17.5; y: 12.2; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 19.5; y: 6; skew-x: 1.1; skew-y: 1.1; }
        frame 24 { x: 24.4; y: -1.5; skew-x: 2.8; skew-y: 2.8; }
        frame 25 { x: 29.3; y: -9.2; skew-x: 4.6; skew-y: 4.6; scale-x: 0.798; scale-y: 0.798; }
        frame 26 { x: 34.3; y: -17; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 36.9; y: -21.2; skew-x: 11.6; skew-y: 11.6; }
        frame 28 { x: 39.8; y: -25.4; skew-x: 16.8; skew-y: 16.8; }
        frame 29 { x: 38.5; y: -24.6; skew-x: -10000; skew-y: -10000; scale-y: 0.893; }
        frame 30 { x: 37; y: -19.9; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 27.8; y: -8.1; skew-x: 8.8; skew-y: 8.8; scale-x: 0.798; scale-y: 0.798; }
        frame 32 { x: 19.3; y: 3.9; skew-x: 0.8; skew-y: 0.8; scale-x: 0.799; scale-y: -10000; }
        frame 33 { x: 11.1; y: 16.3; skew-x: -7; skew-y: -7; scale-x: 0.798; }
        frame 34 { x: 5.5; y: 23.7; skew-x: -13.7; skew-y: -13.7; scale-x: 0.797; scale-y: 0.797; }
        frame 35 { x: 0.1; y: 31.3; skew-x: -20.8; skew-y: -20.8; scale-x: 0.798; scale-y: 0.798; }
        frame 36 { x: 0.5; y: 32.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.737; }
        frame 37 { x: 5.4; y: 20.8; skew-x: -16.2; skew-y: -16.2; scale-x: 0.799; scale-y: 0.799; }
        frame 38 { x: 8.8; y: 15.9; skew-x: -12.7; skew-y: -12.7; scale-x: 0.798; scale-y: 0.798; }
        frame 39 { x: 12.2; y: 11; skew-x: -9.3; skew-y: -9.3; scale-x: 0.799; scale-y: 0.799; }
        frame 40 { x: 19.3; y: 1.8; skew-x: -3.7; skew-y: -3.7; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 26.7; y: -6.9; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.799; }
        frame 42 { x: 34.2; y: -15.7; skew-x: 7.1; skew-y: 7.1; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 36.8; y: -20.1; skew-x: 10.3; skew-y: 10.3; scale-x: 0.798; scale-y: 0.798; }
        frame 44 { x: 39.5; y: -24.5; skew-x: 13.9; skew-y: 13.9; scale-x: 0.799; scale-y: 0.799; }
        frame 45 { x: 39.9; y: -24.1; skew-x: 13.8; skew-y: 13.8; scale-x: -10000; scale-y: 0.891; }
        frame 46 { x: 39.5; y: -20; skew-x: -10000; skew-y: -10000; scale-y: 0.799; }
        frame 47 { x: 26.7; y: -3.5; skew-x: 5.8; skew-y: 5.8; scale-y: -10000; }
        frame 48 { x: 14.3; y: 13.1; skew-x: -2.1; skew-y: -2.1; scale-x: 0.8; scale-y: 0.8; }
        frame 49 { x: 8.9; y: 19.8; skew-x: -10.9; skew-y: -10.9; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: 15.6; y: 18.5; skew-x: -7.6; skew-y: -7.6; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 26.7; y: 7.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 52 { x: 27.7; y: 6.9; skew-x: -10000; skew-y: -10000; scale-x: 0.788; scale-y: -10000; }
        frame 53 { x: 28.8; y: 6.4; scale-x: 0.777; }
        frame 54 { x: 29.8; y: 5.9; scale-x: 0.765; }
        frame 55 { x: 30.8; y: 5.3; scale-x: 0.754; }
        frame 56 { x: 31.9; y: 4.8; scale-x: 0.742; }
        frame 57 { x: 32.9; y: 4.2; scale-x: 0.731; }
        frame 58 { x: 30.8; y: 5.8; skew-x: -0.9; skew-y: -0.9; scale-x: 0.733; }
        frame 59 { x: 28.6; y: 7.3; skew-x: -2.2; skew-y: -2.2; scale-x: 0.736; }
        frame 60 { x: 26.5; y: 9; skew-x: -3.4; skew-y: -3.4; scale-x: 0.739; }
        frame 61 { x: 24.4; y: 10.5; skew-x: -4.5; skew-y: -4.5; scale-x: 0.742; scale-y: 0.799; }
        frame 62 { x: 22.2; y: 12.1; skew-x: -5.7; skew-y: -5.7; scale-x: 0.744; scale-y: -10000; }
        frame 63 { x: 20; y: 13.7; skew-x: -7; skew-y: -7; scale-x: 0.747; scale-y: 0.8; }
        frame 64 { x: 21.1; y: 12.9; skew-x: -6.4; skew-y: -6.4; scale-x: 0.753; scale-y: 0.799; }
        frame 65 { x: 22.1; y: 12; skew-x: -6; skew-y: -6; scale-x: 0.759; scale-y: -10000; }
        frame 66 { x: 23.1; y: 11.4; skew-x: -5.7; skew-y: -5.7; scale-x: 0.765; }
        frame 67 { x: 24.1; y: 10.5; skew-x: -5.2; skew-y: -5.2; scale-x: 0.771; }
        frame 68 { x: 25.1; y: 9.7; skew-x: -4.7; skew-y: -4.7; scale-x: 0.778; }
        frame 69 { x: 26.1; y: 8.9; skew-x: -4.4; skew-y: -4.4; scale-x: 0.784; scale-y: 0.8; }
        frame 70 { x: 27.2; y: 8; skew-x: -3.5; skew-y: -3.5; scale-x: 0.775; scale-y: 0.799; }
        frame 71 { x: 28.4; y: 7.2; skew-x: -2.7; skew-y: -2.7; scale-x: 0.766; scale-y: 0.8; }
        frame 72 { x: 29.5; y: 6.4; skew-x: -2; skew-y: -2; scale-x: 0.757; scale-y: -10000; }
        frame 73 { x: 30.6; y: 5.5; skew-x: -1.2; skew-y: -1.2; scale-x: 0.748; }
        frame 74 { x: 31.8; y: 4.8; skew-x: -0.5; skew-y: -0.5; scale-x: 0.74; }
        frame 75 { x: 32.9; y: 4.2; skew-x: 0; skew-y: 0; scale-x: 0.731; }
        frame 76 { x: 30.8; y: 5.8; skew-x: -0.9; skew-y: -0.9; scale-x: 0.733; }
        frame 77 { x: 28.6; y: 7.3; skew-x: -2.2; skew-y: -2.2; scale-x: 0.736; }
        frame 78 { x: 26.5; y: 9; skew-x: -3.4; skew-y: -3.4; scale-x: 0.739; }
        frame 79 { x: 24.4; y: 10.5; skew-x: -4.5; skew-y: -4.5; scale-x: 0.742; scale-y: 0.799; }
        frame 80 { x: 22.2; y: 12.1; skew-x: -5.7; skew-y: -5.7; scale-x: 0.744; scale-y: -10000; }
        frame 81 { x: 20; y: 13.7; skew-x: -7; skew-y: -7; scale-x: 0.747; scale-y: 0.8; }
        frame 82 { x: 21.3; y: 12.4; skew-x: -5.4; skew-y: -5.4; scale-x: 0.758; scale-y: 0.799; }
        frame 83 { x: 22.7; y: 11.2; skew-x: -4; skew-y: -4; scale-x: 0.768; scale-y: 0.8; }
        frame 84 { x: 24; y: 9.9; skew-x: -2.7; skew-y: -2.7; scale-x: 0.779; scale-y: -10000; }
        frame 85 { x: 25.3; y: 8.7; skew-x: -1.2; skew-y: -1.2; scale-x: 0.789; }
        frame 86 { x: 26.7; y: 7.5; skew-x: 0; skew-y: 0; scale-x: 0.8; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; cel: -1; }
        frame 88 { cel: -10000; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 105;
        frame 0 { x: 30.5; y: 10.2; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_HEAD; }
        frame 1 { x: 30.8; y: 9.4; skew-x: 358.9; skew-y: 358.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 31.1; y: 8.8; skew-x: 359.2; skew-y: 359.2; }
        frame 3 { x: 31.3; y: 8.2; skew-x: 359.5; skew-y: 359.5; }
        frame 4 { x: 31.6; y: 7.6; skew-x: 359.7; skew-y: 359.7; }
        frame 5 { x: 31.9; y: 7; skew-x: 360; skew-y: 360; }
        frame 6 { x: 32.5; y: 6.4; skew-x: 361; skew-y: 361; }
        frame 7 { x: 33.3; y: 5.9; skew-x: 362.3; skew-y: 362.3; }
        frame 8 { x: 32.3; y: 7.4; skew-x: 360.8; skew-y: 360.8; }
        frame 9 { x: 31.4; y: 8.8; skew-x: 359.7; skew-y: 359.7; }
        frame 10 { x: 30.5; y: 10.2; skew-x: 358.5; skew-y: 358.5; }
        frame 11 { x: 30.2; y: 10.7; skew-x: 358.2; skew-y: 358.2; }
        frame 12 { x: 29.9; y: 11.4; skew-x: 357.9; skew-y: 357.9; }
        frame 13 { x: 29.6; y: 12.1; skew-x: 357.5; skew-y: 357.5; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 29.4; y: 12.8; skew-x: 357.2; skew-y: 357.2; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 29; y: 13.4; skew-x: 356.7; skew-y: 356.7; }
        frame 16 { x: 28.7; y: 13.8; skew-x: 355.7; skew-y: 355.7; }
        frame 17 { x: 28.3; y: 14.2; skew-x: 354.4; skew-y: 354.4; }
        frame 18 { x: 29.2; y: 12.8; skew-x: 355.9; skew-y: 355.9; }
        frame 19 { x: 29.7; y: 11.4; skew-x: 357.2; skew-y: 357.2; }
        frame 20 { x: 30.5; y: 10.2; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: 20.2; y: 20.6; skew-x: 351.6; skew-y: 351.6; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 22.2; y: 14; skew-x: 357.7; skew-y: 357.7; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 24.2; y: 7.7; skew-x: 363.5; skew-y: 363.5; }
        frame 24 { x: 28.9; y: 0.3; skew-x: 364.5; skew-y: 364.5; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: 33.5; y: -6.9; skew-x: 365.5; skew-y: 365.5; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 38.1; y: -14.3; skew-x: 366.8; skew-y: 366.8; }
        frame 27 { x: 41; y: -18.4; skew-x: 373; skew-y: 373; scale-x: 0.797; scale-y: 0.797; }
        frame 28 { x: 44; y: -22.5; skew-x: 379.4; skew-y: 379.4; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 42.2; y: -19.5; skew-x: 378.1; skew-y: 378.1; scale-x: 0.796; scale-y: 0.796; }
        frame 30 { x: 40.4; y: -16.6; skew-x: 377.1; skew-y: 377.1; scale-x: 0.797; scale-y: 0.797; }
        frame 31 { x: 31.8; y: -5.4; skew-x: 369.5; skew-y: 369.5; scale-x: 0.796; scale-y: 0.796; }
        frame 32 { x: 23.6; y: 6; skew-x: 362; skew-y: 362; scale-x: 0.797; scale-y: 0.797; }
        frame 33 { x: 15.7; y: 17.9; skew-x: 354.6; skew-y: 354.6; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 10.1; y: 24.9; skew-x: 346.7; skew-y: 346.7; scale-x: 0.796; scale-y: 0.796; }
        frame 35 { x: 4.8; y: 32.1; skew-x: 338.7; skew-y: 338.7; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: -10000; y: 32.9; skew-x: 336.7; skew-y: 336.7; scale-x: 0.795; scale-y: 0.795; }
        frame 37 { x: 10.6; y: 21.8; skew-x: 345.2; skew-y: 345.2; scale-x: 0.796; scale-y: 0.796; }
        frame 38 { x: 13.6; y: 17.6; skew-x: 347.7; skew-y: 347.7; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 16.8; y: 13.4; skew-x: 350.2; skew-y: 350.2; }
        frame 40 { x: 23.8; y: 4.6; skew-x: 356.2; skew-y: 356.2; scale-x: 0.795; scale-y: 0.795; }
        frame 41 { x: 30.9; y: -3.9; skew-x: 361.8; skew-y: 361.8; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 38.3; y: -12.3; skew-x: 367.6; skew-y: 367.6; }
        frame 43 { x: 42.1; y: -17.6; skew-x: 374.3; skew-y: 374.3; scale-x: 0.794; scale-y: 0.794; }
        frame 44 { x: 46.1; y: -22.7; skew-x: 381.3; skew-y: 381.3; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 45.6; y: -20.1; skew-x: 380.3; skew-y: 380.3; scale-x: 0.793; scale-y: 0.793; }
        frame 46 { x: 45.2; y: -17.6; skew-x: 379.7; skew-y: 379.7; scale-x: 0.794; scale-y: 0.794; }
        frame 47 { x: 32; y: -1.7; skew-x: 370; skew-y: 370; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 19.2; y: 14.6; skew-x: 360.5; skew-y: 360.5; }
        frame 49 { x: 13.6; y: 21.9; skew-x: 349.1; skew-y: 349.1; scale-x: 0.795; scale-y: 0.795; }
        frame 50 { x: 20.2; y: 20.6; skew-x: 351.6; skew-y: 351.6; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 30.5; y: 10.2; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 52 { x: 31.5; y: 9.4; skew-x: 359.2; skew-y: 359.2; scale-x: 0.789; scale-y: 0.805; }
        frame 53 { x: 32.5; y: 8.8; skew-x: 359.7; skew-y: 359.7; scale-x: 0.779; scale-y: 0.81; }
        frame 54 { x: 33.5; y: 8.3; skew-x: 360; skew-y: 360; scale-x: 0.768; scale-y: 0.815; }
        frame 55 { x: 34.4; y: 7.7; skew-x: 360.5; skew-y: 360.5; scale-x: 0.758; scale-y: 0.82; }
        frame 56 { x: 35.4; y: 7; skew-x: 361; skew-y: 361; scale-x: 0.747; scale-y: 0.825; }
        frame 57 { x: 36.6; y: 6.3; skew-x: 361.7; skew-y: 361.7; scale-x: 0.736; scale-y: 0.831; }
        frame 58 { x: 34.1; y: 8.1; skew-x: 360.1; skew-y: 360.1; scale-x: 0.747; scale-y: 0.825; }
        frame 59 { x: 31.9; y: 9.8; skew-x: 358.7; skew-y: 358.7; scale-x: 0.757; scale-y: 0.82; }
        frame 60 { x: 29.6; y: 11.6; skew-x: 357.2; skew-y: 357.2; scale-x: 0.768; scale-y: 0.815; }
        frame 61 { x: 27.3; y: 13.4; skew-x: 355.7; skew-y: 355.7; scale-x: 0.778; scale-y: 0.809; }
        frame 62 { x: 25.1; y: 15.2; skew-x: 354.2; skew-y: 354.2; scale-x: 0.788; scale-y: 0.804; }
        frame 63 { x: 22.7; y: 17.2; skew-x: 352.5; skew-y: 352.5; scale-x: 0.799; scale-y: 0.799; }
        frame 64 { x: 24; y: 16.1; skew-x: 353.5; skew-y: 353.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 25.3; y: 14.9; skew-x: 354.5; skew-y: 354.5; }
        frame 66 { x: 26.7; y: 13.8; skew-x: 355.5; skew-y: 355.5; }
        frame 67 { x: 28; y: 12.6; skew-x: 356.5; skew-y: 356.5; }
        frame 68 { x: 29.3; y: 11.4; skew-x: 357.5; skew-y: 357.5; }
        frame 69 { x: 30.5; y: 10.2; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: 31.5; y: 9.4; skew-x: 359.2; skew-y: 359.2; scale-x: 0.789; scale-y: 0.805; }
        frame 71 { x: 32.5; y: 8.8; skew-x: 359.7; skew-y: 359.7; scale-x: 0.779; scale-y: 0.81; }
        frame 72 { x: 33.5; y: 8.3; skew-x: 360; skew-y: 360; scale-x: 0.768; scale-y: 0.815; }
        frame 73 { x: 34.4; y: 7.7; skew-x: 360.5; skew-y: 360.5; scale-x: 0.758; scale-y: 0.82; }
        frame 74 { x: 35.4; y: 7; skew-x: 361; skew-y: 361; scale-x: 0.747; scale-y: 0.825; }
        frame 75 { x: 36.6; y: 6.3; skew-x: 361.7; skew-y: 361.7; scale-x: 0.736; scale-y: 0.831; }
        frame 76 { x: 34.1; y: 8.1; skew-x: 360.1; skew-y: 360.1; scale-x: 0.747; scale-y: 0.825; }
        frame 77 { x: 31.9; y: 9.8; skew-x: 358.7; skew-y: 358.7; scale-x: 0.757; scale-y: 0.82; }
        frame 78 { x: 29.6; y: 11.6; skew-x: 357.2; skew-y: 357.2; scale-x: 0.768; scale-y: 0.815; }
        frame 79 { x: 27.3; y: 13.4; skew-x: 355.7; skew-y: 355.7; scale-x: 0.778; scale-y: 0.809; }
        frame 80 { x: 25.1; y: 15.2; skew-x: 354.2; skew-y: 354.2; scale-x: 0.788; scale-y: 0.804; }
        frame 81 { x: 22.7; y: 17.2; skew-x: 352.5; skew-y: 352.5; scale-x: 0.799; scale-y: 0.799; }
        frame 82 { x: 24.3; y: 15.8; skew-x: 353.7; skew-y: 353.7; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 25.8; y: 14.4; skew-x: 355; skew-y: 355; }
        frame 84 { x: 27.5; y: 12.9; skew-x: 356.2; skew-y: 356.2; }
        frame 85 { x: 29; y: 11.5; skew-x: 357.4; skew-y: 357.4; }
        frame 86 { x: 30.5; y: 10.2; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 88 { cel: -10000; }
    }
    Track {
        source-name: "zombie_football_rightarm_upper";
        frame-count: 105;
        frame 0 { x: 80.6; y: 62.9; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_RIGHTARM_UPPER; }
        frame 1 { x: 80.5; y: 62.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -10000; y: 62.1; }
        frame 3 { x: 80.4; y: 61.6; }
        frame 4 { x: -10000; y: 61.2; }
        frame 5 { x: 80.3; y: 60.8; }
        frame 6 { x: 80.4; y: 61.2; }
        frame 7 { x: -10000; y: 61.6; }
        frame 8 { x: 80.5; y: 62.1; }
        frame 9 { x: -10000; y: 62.5; }
        frame 10 { x: 80.6; y: 62.9; }
        frame 11 { x: -10000; y: 63.3; }
        frame 12 { x: 80.7; y: 63.6; }
        frame 13 { x: -10000; y: 64.1; }
        frame 14 { x: 80.8; y: 64.5; }
        frame 15 { x: -10000; y: 64.8; }
        frame 16 { y: 64.5; }
        frame 17 { x: 80.7; y: 64.1; }
        frame 18 { x: -10000; y: 63.6; }
        frame 19 { x: 80.6; y: 63.3; }
        frame 20 { x: -10000; y: 62.9; }
        frame 21 { x: 78.9; y: 64.7; skew-x: -13.5; skew-y: -13.5; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 83.3; y: 58.3; skew-x: -29; skew-y: -29; scale-x: 0.798; scale-y: 0.798; }
        frame 23 { x: 88.2; y: 52; skew-x: -44.4; skew-y: -44.4; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 90.4; y: 47.5; skew-x: -40.8; skew-y: -40.8; scale-x: 0.796; scale-y: 0.796; }
        frame 25 { x: 92.5; y: 43; skew-x: -37.3; skew-y: -37.3; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 94.6; y: 38.5; skew-x: -33.8; skew-y: -33.8; scale-x: 0.797; scale-y: 0.797; }
        frame 27 { x: 94.7; y: 35.6; skew-x: -33.7; skew-y: -33.7; scale-x: 0.796; scale-y: 0.796; }
        frame 28 { x: -10000; y: 32.9; skew-x: -33.8; skew-y: -33.8; scale-x: -10000; scale-y: -10000; }
        frame 29 { y: 35.6; skew-x: -33.7; skew-y: -33.7; }
        frame 30 { x: 94.6; y: 38.5; skew-x: -33.8; skew-y: -33.8; scale-x: 0.797; scale-y: 0.797; }
        frame 31 { x: 90.8; y: 45; skew-x: -31.2; skew-y: -31.2; scale-x: 0.796; scale-y: 0.796; }
        frame 32 { x: 86.9; y: 51.6; skew-x: -28.7; skew-y: -28.7; scale-x: 0.795; scale-y: 0.795; }
        frame 33 { x: 83.1; y: 58.2; skew-x: -26.2; skew-y: -26.2; scale-x: 0.796; scale-y: 0.796; }
        frame 34 { x: 80.9; y: 59.4; skew-x: -29.2; skew-y: -29.2; scale-x: 0.795; scale-y: 0.795; }
        frame 35 { x: 78.6; y: 60.6; skew-x: -32.5; skew-y: -32.5; scale-x: 0.796; scale-y: 0.796; }
        frame 36 { x: 78.2; y: 60; skew-x: -20.2; skew-y: -20.2; scale-x: 0.794; scale-y: 0.794; }
        frame 37 { x: 77.9; y: 59.6; skew-x: -7.9; skew-y: -7.9; scale-x: 0.795; scale-y: 0.795; }
        frame 38 { x: 76.6; y: 59.5; skew-x: 1.3; skew-y: 1.3; scale-x: 0.794; scale-y: 0.794; }
        frame 39 { x: 75.5; y: 59.4; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 75.1; y: 53.5; skew-x: 22.3; skew-y: 22.3; scale-x: 0.792; scale-y: 0.792; }
        frame 41 { x: 74.9; y: 47.9; skew-x: 34.1; skew-y: 34.1; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 74.7; y: 42.6; skew-x: 45.7; skew-y: 45.7; }
        frame 43 { x: 74.6; y: 40.3; skew-x: 45.6; skew-y: 45.6; scale-x: 0.79; scale-y: 0.79; }
        frame 44 { x: 74.7; y: 37.8; skew-x: -10000; skew-y: -10000; scale-x: 0.791; scale-y: 0.791; }
        frame 45 { x: -10000; y: 40.4; scale-x: 0.79; scale-y: 0.79; }
        frame 46 { y: 42.6; skew-x: 45.7; skew-y: 45.7; scale-x: 0.792; scale-y: 0.792; }
        frame 47 { x: 71.7; y: 53.6; skew-x: 22.5; skew-y: 22.5; scale-x: 0.791; scale-y: 0.791; }
        frame 48 { x: 68.7; y: 65.8; skew-x: -0.4; skew-y: -0.4; scale-x: 0.792; scale-y: 0.792; }
        frame 49 { x: 73.8; y: 65.3; skew-x: -6.9; skew-y: -6.9; scale-x: 0.795; scale-y: 0.795; }
        frame 50 { x: 78.9; y: 64.7; skew-x: -13.5; skew-y: -13.5; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 80.6; y: 62.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 52 { x: 80.2; y: 62.3; skew-x: 6.3; skew-y: 6.3; scale-x: 0.799; scale-y: 0.799; }
        frame 53 { x: 79.9; y: 61.6; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 79.4; y: 61.2; skew-x: 18.8; skew-y: 18.8; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { x: 79.1; y: 60.9; skew-x: 25.1; skew-y: 25.1; scale-x: 0.797; scale-y: 0.797; }
        frame 56 { x: 78.9; y: 60.6; skew-x: 31.6; skew-y: 31.6; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 78.6; y: 60.4; skew-x: 37.9; skew-y: 37.9; scale-x: 0.798; scale-y: 0.798; }
        frame 58 { x: 77.8; y: 60.3; skew-x: 41.4; skew-y: 38.6; scale-x: 0.802; scale-y: 0.796; }
        frame 59 { x: 76.9; y: -10000; skew-x: 45.1; skew-y: 39.4; scale-x: 0.808; scale-y: -10000; }
        frame 60 { x: 76.2; skew-x: 48.6; skew-y: 40.3; scale-x: 0.813; }
        frame 61 { x: 75.4; skew-x: 52.2; skew-y: 41.1; scale-x: 0.819; }
        frame 62 { x: 74.6; skew-x: 55.7; skew-y: 41.9; scale-x: 0.825; }
        frame 63 { x: 73.9; y: 60.2; skew-x: 59.3; skew-y: 42.7; scale-x: 0.831; scale-y: 0.797; }
        frame 64 { x: 74.5; y: 60.3; skew-x: 54.7; skew-y: 40.8; scale-x: 0.825; scale-y: 0.796; }
        frame 65 { x: 75.2; y: 60.2; skew-x: 49.9; skew-y: 38.9; scale-x: 0.819; scale-y: -10000; }
        frame 66 { x: 75.8; y: 60.3; skew-x: 45.4; skew-y: 36.9; scale-x: 0.813; }
        frame 67 { x: 76.6; y: 60.4; skew-x: 40.6; skew-y: 35.1; scale-x: 0.808; }
        frame 68 { x: 77.2; y: 60.6; skew-x: 35.9; skew-y: 33.1; scale-x: 0.802; scale-y: 0.797; }
        frame 69 { x: 78; y: -10000; skew-x: 31.3; skew-y: 31.3; scale-x: 0.798; scale-y: 0.798; }
        frame 70 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 71 { scale-x: -10000; scale-y: -10000; }
        frame 75 { scale-x: 0.798; scale-y: 0.798; }
        frame 76 { x: 77.5; y: 60.9; skew-x: 30.1; skew-y: 30.1; scale-x: 0.797; scale-y: 0.797; }
        frame 77 { x: 77.2; y: 61; skew-x: 28.8; skew-y: 28.8; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 76.7; y: 61.1; skew-x: 27.6; skew-y: 27.6; }
        frame 79 { x: 76.4; y: 61.4; skew-x: 26.3; skew-y: 26.3; }
        frame 80 { x: 76.1; y: 61.6; skew-x: 25.3; skew-y: 25.3; }
        frame 81 { x: 75.6; y: 61.9; skew-x: 24.1; skew-y: 24.1; scale-x: 0.798; scale-y: 0.798; }
        frame 82 { x: 76.6; y: 62; skew-x: 19.1; skew-y: 19.1; scale-x: 0.797; scale-y: 0.797; }
        frame 83 { x: 77.5; y: 62.1; skew-x: 14.3; skew-y: 14.3; scale-x: 0.798; scale-y: 0.798; }
        frame 84 { x: 78.5; y: 62.3; skew-x: 9.5; skew-y: 9.5; scale-x: 0.799; scale-y: 0.799; }
        frame 85 { x: 79.5; y: 62.5; skew-x: 4.8; skew-y: 4.8; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 80.6; y: 62.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 83.1; y: 61.5; skew-x: 5; skew-y: 5; }
        frame 89 { x: 85.8; y: 60.1; skew-x: 10; skew-y: 10; scale-x: 0.799; scale-y: 0.799; }
        frame 90 { x: 88.4; y: 58.9; skew-x: 15; skew-y: 15; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 91.1; y: 57.7; skew-x: 20.1; skew-y: 20.1; }
        frame 92 { x: 104.9; y: 67.1; skew-x: 39.4; skew-y: 39.4; scale-x: 0.797; scale-y: 0.797; }
        frame 93 { x: 118.7; y: 77.4; skew-x: 58.9; skew-y: 58.9; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 131.9; y: 88.5; skew-x: 78.2; skew-y: 78.2; }
        frame 95 { x: 144.5; y: 100.2; skew-x: 97.5; skew-y: 97.5; }
        frame 96 { x: 153.4; y: 107.3; skew-x: 74; skew-y: 74; scale-x: 0.796; scale-y: 0.796; }
        frame 97 { x: 161.1; y: 115.4; skew-x: 50.2; skew-y: 50.2; scale-x: 0.795; scale-y: 0.795; }
        frame 98 { x: 168.5; y: 124.8; skew-x: 26.6; skew-y: 26.6; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: -10000; y: 126.7; skew-x: 24.8; skew-y: 28.6; scale-x: 0.783; scale-y: 0.746; }
        frame 100 { y: 128.6; skew-x: 23; skew-y: 30.6; scale-x: 0.772; scale-y: 0.7; }
        frame 101 { y: 123.5; skew-x: 24.8; skew-y: 28.6; scale-x: 0.783; scale-y: 0.746; }
        frame 102 { y: 118.3; skew-x: 26.6; skew-y: 26.6; scale-x: 0.795; scale-y: 0.795; }
        frame 103 { x: 168.4; y: 121.5; skew-x: -10000; skew-y: -10000; scale-x: 0.794; scale-y: 0.794; }
        frame 104 { x: 168.5; y: 124.8; scale-x: 0.795; scale-y: 0.795; }
    }
    Track {
        source-name: "zombie_football_rightarm_lower";
        frame-count: 105;
        frame 0 { x: 64; y: 67.7; skew-x: 354.5; skew-y: 354.5; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_RIGHTARM_LOWER; }
        frame 1 { x: 64.2; y: 66.8; skew-x: 355.7; skew-y: 355.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 64.3; y: 66; skew-x: 356.7; skew-y: 356.7; }
        frame 3 { x: -10000; y: 65.2; skew-x: 357.9; skew-y: 357.9; scale-x: 0.8; scale-y: 0.8; }
        frame 4 { x: 64.5; y: 64.3; skew-x: 359; skew-y: 359; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 64.6; y: 63.5; skew-x: 360; skew-y: 360; }
        frame 6 { x: 64.4; y: 64.3; skew-x: 359; skew-y: 359; }
        frame 7 { x: -10000; y: 65.1; skew-x: 357.9; skew-y: 357.9; }
        frame 8 { x: 64.2; y: 66.1; skew-x: 356.7; skew-y: 356.7; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: -10000; y: 66.8; skew-x: 355.7; skew-y: 355.7; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 64; y: 67.7; skew-x: 354.5; skew-y: 354.5; }
        frame 11 { x: 63.9; y: 68.5; skew-x: 353.5; skew-y: 353.5; }
        frame 12 { x: -10000; y: 69.3; skew-x: 352.4; skew-y: 352.4; }
        frame 13 { x: 63.7; y: 70.2; skew-x: 351.2; skew-y: 351.2; }
        frame 14 { x: 63.6; y: 71; skew-x: 350.2; skew-y: 350.2; }
        frame 15 { x: -10000; y: 71.9; skew-x: 349; skew-y: 349; }
        frame 16 { y: 71; skew-x: 350.2; skew-y: 350.2; }
        frame 17 { x: 63.8; y: 70.2; skew-x: 351.2; skew-y: 351.2; }
        frame 18 { x: 63.9; y: 69.3; skew-x: 352.4; skew-y: 352.4; }
        frame 19 { x: 64; y: 68.6; skew-x: 353.5; skew-y: 353.5; }
        frame 20 { y: 67.7; skew-x: 354.5; skew-y: 354.5; }
        frame 21 { x: 63.9; y: 73.3; skew-x: 340.9; skew-y: 340.9; }
        frame 22 { x: 71.2; y: 70.2; skew-x: 325.4; skew-y: 325.4; scale-x: 0.797; scale-y: 0.797; }
        frame 23 { x: 79.7; y: 66.9; skew-x: 310; skew-y: 310; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 84.7; y: 65.8; skew-x: 296.3; skew-y: 296.3; scale-x: 0.795; scale-y: 0.795; }
        frame 25 { x: 90.5; y: 64.1; skew-x: 282.8; skew-y: 282.8; scale-x: 0.794; scale-y: 0.794; }
        frame 26 { x: 96.8; y: 61.9; skew-x: 269.2; skew-y: 269.2; scale-x: 0.793; scale-y: 0.793; }
        frame 27 { x: 96.9; y: 59.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 96.8; y: 56.3; }
        frame 29 { x: -10000; y: 59.1; }
        frame 30 { y: 61.9; }
        frame 31 { x: 91.8; y: 68.6; skew-x: 271.8; skew-y: 271.8; scale-x: 0.792; scale-y: 0.792; }
        frame 32 { x: 87; y: 75.2; skew-x: 274.3; skew-y: 274.3; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 82; y: 81.8; skew-x: 276.9; skew-y: 276.9; }
        frame 34 { x: 78.1; y: 82.8; skew-x: 283.3; skew-y: 283.3; scale-x: 0.79; scale-y: 0.79; }
        frame 35 { x: 74.2; y: 83.7; skew-x: 289.9; skew-y: 289.9; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 67.3; y: 78.6; skew-x: 310.4; skew-y: 310.4; scale-x: 0.788; scale-y: 0.788; }
        frame 37 { x: 62.5; y: 73; skew-x: 331; skew-y: 331; scale-x: 0.789; scale-y: 0.789; }
        frame 38 { x: 59.6; y: 67.2; skew-x: 346.5; skew-y: 346.5; scale-x: 0.787; scale-y: 0.787; }
        frame 39 { x: 57.6; y: 61.9; skew-x: 361.8; skew-y: 361.8; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -10000; y: 52.4; skew-x: 373.3; skew-y: 373.3; scale-x: 0.786; scale-y: 0.786; }
        frame 41 { x: 58; y: 43.3; skew-x: 385; skew-y: 385; scale-x: 0.785; scale-y: 0.785; }
        frame 42 { x: 58.7; y: 34.6; skew-x: 396.7; skew-y: 396.7; scale-x: 0.786; scale-y: 0.786; }
        frame 43 { x: 58.8; y: 32; skew-x: 396.6; skew-y: 396.6; scale-x: 0.784; scale-y: 0.784; }
        frame 44 { x: -10000; y: 29.8; skew-x: -10000; skew-y: -10000; scale-x: 0.785; scale-y: 0.785; }
        frame 45 { x: 58.7; y: 32.3; scale-x: 0.784; scale-y: 0.784; }
        frame 46 { x: -10000; y: 34.6; skew-x: 396.7; skew-y: 396.7; scale-x: 0.786; scale-y: 0.786; }
        frame 47 { x: 54.6; y: 52.1; skew-x: 373.8; skew-y: 373.8; scale-x: 0.785; scale-y: 0.785; }
        frame 48 { x: 51.9; y: 71.6; skew-x: 351; skew-y: 351; scale-x: 0.786; scale-y: 0.786; }
        frame 49 { x: 57.8; y: 72.5; skew-x: 346; skew-y: 346; scale-x: 0.792; scale-y: 0.792; }
        frame 50 { x: 63.9; y: 73.3; skew-x: 340.9; skew-y: 340.9; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 64; y: 67.7; skew-x: 354.5; skew-y: 354.5; scale-x: -10000; scale-y: -10000; }
        frame 52 { y: 64.5; skew-x: 363; skew-y: 363; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: 64.3; y: 61.2; skew-x: 371.6; skew-y: 371.6; scale-x: 0.797; scale-y: 0.797; }
        frame 54 { x: 64.8; y: 58.4; skew-x: 380.3; skew-y: 380.3; scale-x: 0.796; scale-y: 0.796; }
        frame 55 { x: 65.5; y: 55.6; skew-x: 388.8; skew-y: 388.8; scale-x: 0.795; scale-y: 0.795; }
        frame 56 { x: 66.3; y: 53.4; skew-x: 397.6; skew-y: 397.6; scale-x: 0.794; scale-y: 0.794; }
        frame 57 { x: 67.3; y: 51.5; skew-x: 406.2; skew-y: 406.2; scale-x: 0.795; scale-y: 0.795; }
        frame 58 { x: 67; y: 51.1; skew-x: 408.6; skew-y: 408.6; scale-x: 0.793; scale-y: 0.793; }
        frame 59 { x: 66.7; y: 50.8; skew-x: 410.9; skew-y: 410.9; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 66.3; y: 50.5; skew-x: 413.2; skew-y: 413.2; }
        frame 61 { x: 66; y: 50.2; skew-x: 415.7; skew-y: 415.7; }
        frame 62 { x: 65.7; y: 50; skew-x: 417.9; skew-y: 417.9; }
        frame 63 { x: 65.3; y: 49.6; skew-x: 420.3; skew-y: 420.3; }
        frame 64 { x: 64.5; y: 50.5; skew-x: 414.2; skew-y: 414.2; }
        frame 65 { x: 63.6; y: 51.5; skew-x: 408.1; skew-y: 408.1; }
        frame 66 { x: 62.8; y: 52.7; skew-x: 401.9; skew-y: 401.9; }
        frame 67 { x: 62.1; y: 54; skew-x: 395.8; skew-y: 395.8; scale-x: 0.794; scale-y: 0.794; }
        frame 68 { x: 61.3; y: 55.5; skew-x: 389.6; skew-y: 389.6; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 60.6; y: 57.1; skew-x: 383.6; skew-y: 383.6; scale-x: 0.796; scale-y: 0.796; }
        frame 70 { x: 60.8; y: 56.9; skew-x: 384.6; skew-y: 384.6; scale-x: 0.795; scale-y: 0.795; }
        frame 71 { x: 61.1; y: 56.6; skew-x: 385.5; skew-y: 385.5; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 61.4; y: 56.3; skew-x: 386.5; skew-y: 386.5; }
        frame 73 { x: 61.7; y: 56; skew-x: 387.3; skew-y: 387.3; }
        frame 74 { x: 62; y: 55.7; skew-x: 388.3; skew-y: 388.3; }
        frame 75 { x: 62.1; y: 55.4; skew-x: 389.4; skew-y: 389.4; scale-x: 0.796; scale-y: 0.796; }
        frame 76 { x: 61.4; y: 56.3; skew-x: 387.1; skew-y: 387.1; scale-x: 0.795; scale-y: 0.795; }
        frame 77 { x: 60.6; y: 57.1; skew-x: 385; skew-y: 385; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 60; y: 57.9; skew-x: 382.8; skew-y: 382.8; }
        frame 79 { x: 59.1; y: 58.9; skew-x: 380.6; skew-y: 380.6; }
        frame 80 { x: 58.4; y: 59.6; skew-x: 378.5; skew-y: 378.5; }
        frame 81 { x: 57.9; y: 60.6; skew-x: 376.3; skew-y: 376.3; scale-x: 0.796; scale-y: 0.796; }
        frame 82 { x: 59; y: 62.1; skew-x: 371.8; skew-y: 371.8; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 60.1; y: 63.4; skew-x: 367.5; skew-y: 367.5; scale-x: 0.797; scale-y: 0.797; }
        frame 84 { x: 61.4; y: 64.8; skew-x: 363.1; skew-y: 363.1; scale-x: 0.798; scale-y: 0.798; }
        frame 85 { x: 62.7; y: 66.3; skew-x: 359; skew-y: 359; scale-x: 0.799; scale-y: 0.799; }
        frame 86 { x: 64; y: 67.7; skew-x: 354.5; skew-y: 354.5; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 88 { x: 66.3; y: 64.8; skew-x: 359.7; skew-y: 359.7; }
        frame 89 { x: 68.8; y: 61.9; skew-x: 364.5; skew-y: 364.5; }
        frame 90 { x: 71.3; y: 59.2; skew-x: 369.5; skew-y: 369.5; scale-x: 0.798; scale-y: 0.798; }
        frame 91 { x: 73.9; y: 56.5; skew-x: 374.6; skew-y: 374.6; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 85.8; y: 63.5; skew-x: 381.3; skew-y: 381.3; scale-x: 0.797; scale-y: 0.797; }
        frame 93 { x: 97.7; y: 70.6; skew-x: 387.9; skew-y: 387.9; scale-x: 0.796; scale-y: 0.796; }
        frame 94 { x: 109.8; y: 78; skew-x: 394.6; skew-y: 394.6; scale-x: 0.795; scale-y: 0.795; }
        frame 95 { x: 121.9; y: 85.6; skew-x: 401.4; skew-y: 401.4; scale-x: 0.796; scale-y: 0.796; }
        frame 96 { x: 131.8; y: 97.7; skew-x: 394.3; skew-y: 394.3; scale-x: 0.794; scale-y: 0.794; }
        frame 97 { x: 141.6; y: 109.9; skew-x: 387.1; skew-y: 387.1; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 151.6; y: 122.3; skew-x: 380.1; skew-y: 380.1; scale-x: 0.795; scale-y: 0.795; }
        frame 99 { x: -10000; y: 124.4; skew-x: 378.6; skew-y: 381.6; scale-x: 0.787; scale-y: 0.741; }
        frame 100 { y: 126.5; skew-x: 377.2; skew-y: 383.4; scale-x: 0.781; scale-y: 0.689; }
        frame 101 { x: 152.7; y: 119.8; skew-x: 384.1; skew-y: 387.1; scale-x: 0.787; scale-y: 0.74; }
        frame 102 { x: 153.9; y: 113.2; skew-x: 391.1; skew-y: 391.1; scale-x: 0.794; scale-y: 0.794; }
        frame 103 { x: 152.8; y: 117.7; skew-x: 385.6; skew-y: 385.6; scale-x: 0.793; scale-y: 0.793; }
        frame 104 { x: 151.6; y: 122.3; skew-x: 380.1; skew-y: 380.1; scale-x: 0.795; scale-y: 0.795; }
    }
    Track {
        source-name: "zombie_football_upperbody3";
        frame-count: 105;
        frame 0 { x: 15; y: 21.6; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_UPPERBODY3; }
        frame 1 { x: 15.3; y: 20.7; skew-x: 358.9; skew-y: 358.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 15.5; y: 20; skew-x: 359.2; skew-y: 359.2; }
        frame 3 { x: 15.6; y: 19.3; skew-x: 359.5; skew-y: 359.5; }
        frame 4 { x: 15.8; y: 18.7; skew-x: 359.7; skew-y: 359.7; }
        frame 5 { x: 16; y: 18; skew-x: 360; skew-y: 360; }
        frame 6 { x: 15.8; y: 18.7; skew-x: 359.7; skew-y: 359.7; }
        frame 7 { x: 15.6; y: 19.4; skew-x: 359.5; skew-y: 359.5; }
        frame 8 { x: 15.5; y: 20; skew-x: 359.2; skew-y: 359.2; }
        frame 9 { x: 15.3; y: 20.7; skew-x: 358.9; skew-y: 358.9; }
        frame 10 { x: 15; y: 21.6; skew-x: 358.5; skew-y: 358.5; }
        frame 11 { x: 14.8; y: 22.3; skew-x: 358.2; skew-y: 358.2; }
        frame 12 { x: 14.6; y: 23; skew-x: 357.9; skew-y: 357.9; }
        frame 13 { x: 14.4; y: 23.8; skew-x: 357.5; skew-y: 357.5; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: 14.2; y: 24.6; skew-x: 357.2; skew-y: 357.2; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 13.8; y: 25.4; skew-x: 356.7; skew-y: 356.7; }
        frame 16 { x: 14.1; y: 24.5; skew-x: 357.2; skew-y: 357.2; }
        frame 17 { x: 14.3; y: 23.8; skew-x: 357.5; skew-y: 357.5; }
        frame 18 { x: 14.5; y: 23; skew-x: 357.9; skew-y: 357.9; scale-x: 0.8; scale-y: 0.8; }
        frame 19 { x: 14.8; y: 22.2; skew-x: 358.2; skew-y: 358.2; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 15; y: 21.6; skew-x: 358.5; skew-y: 358.5; }
        frame 21 { x: 6.8; y: 34.2; skew-x: 350.9; skew-y: 350.9; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: -10000; y: 30; skew-x: 351.2; skew-y: 351.2; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 6.7; y: 25.6; skew-x: 351.6; skew-y: 351.6; }
        frame 24 { x: 10.8; y: 16; skew-x: 355.2; skew-y: 355.2; }
        frame 25 { x: 15; y: 6.7; skew-x: 358.7; skew-y: 358.7; }
        frame 26 { x: 19.4; y: -2.2; skew-x: 362.2; skew-y: 362.2; }
        frame 27 { x: -10000; y: -4.8; skew-x: 362; skew-y: 362; }
        frame 28 { y: -7.7; skew-x: -10000; skew-y: -10000; }
        frame 29 { y: -4.8; }
        frame 30 { y: -2.2; skew-x: 362.2; skew-y: 362.2; }
        frame 31 { x: 13.6; y: 8.8; skew-x: 358.7; skew-y: 358.7; }
        frame 32 { x: 8; y: 20; skew-x: 355.2; skew-y: 355.2; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 2.6; y: 31.4; skew-x: 351.8; skew-y: 351.8; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: -0.7; y: 37; skew-x: 348.7; skew-y: 348.7; }
        frame 35 { x: -4.1; y: 42.6; skew-x: 345.5; skew-y: 345.5; }
        frame 36 { x: -1.8; y: 36.9; skew-x: 348.7; skew-y: 348.7; scale-x: 0.797; scale-y: 0.797; }
        frame 37 { x: 0.4; y: 31.1; skew-x: 352; skew-y: 352; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 3.1; y: 26.4; skew-x: 354.5; skew-y: 354.5; scale-x: 0.797; scale-y: 0.797; }
        frame 39 { x: 5.9; y: 21.8; skew-x: 357; skew-y: 357; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 10.7; y: 13.4; skew-x: 360; skew-y: 360; scale-x: 0.797; scale-y: 0.797; }
        frame 41 { x: 15.5; y: 5.3; skew-x: 362.8; skew-y: 362.8; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 20.5; y: -2.7; skew-x: 365.8; skew-y: 365.8; }
        frame 43 { x: -10000; y: -5.1; skew-x: -10000; skew-y: -10000; }
        frame 44 { y: -7.5; }
        frame 45 { y: -5.1; }
        frame 46 { y: -2.7; }
        frame 47 { x: 10.5; y: 13.3; skew-x: 359.5; skew-y: 359.5; }
        frame 48 { x: 1.1; y: 30.1; skew-x: 353.2; skew-y: 353.2; }
        frame 49 { x: 4.1; y: 32; skew-x: 352.2; skew-y: 352.2; scale-x: 0.798; scale-y: 0.798; }
        frame 50 { x: 6.8; y: 34.2; skew-x: 350.9; skew-y: 350.9; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 15; y: 21.6; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 52 { x: 15.6; y: 21; skew-x: 359.2; skew-y: 359.2; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 16; y: 20.5; skew-x: 359.7; skew-y: 359.7; }
        frame 54 { x: 16.4; y: 20.4; skew-x: 360; skew-y: 360; }
        frame 55 { x: 16.8; y: 20; skew-x: 360.5; skew-y: 360.5; }
        frame 56 { x: 17.3; y: 19.5; skew-x: 361; skew-y: 361; scale-x: 0.799; scale-y: 0.799; }
        frame 57 { x: 17.8; y: 19; skew-x: 361.7; skew-y: 361.7; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: 16; y: 21.1; skew-x: 360; skew-y: 360; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { x: 14.5; y: 22.8; skew-x: 358.7; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 12.9; y: 25; skew-x: 357; skew-y: 357; }
        frame 61 { x: 11.3; y: 26.9; skew-x: 355.5; skew-y: 355.5; }
        frame 62 { x: 9.8; y: 28.9; skew-x: 354; skew-y: 354; }
        frame 63 { x: 8.3; y: 31; skew-x: 352.2; skew-y: 352.2; }
        frame 64 { x: 9.5; y: 29.2; skew-x: 353.4; skew-y: 353.4; }
        frame 65 { x: 10.5; y: 27.6; skew-x: 354.5; skew-y: 354.5; }
        frame 66 { x: 11.6; y: 26.1; skew-x: 355.5; skew-y: 355.5; }
        frame 67 { x: 12.7; y: 24.6; skew-x: 356.5; skew-y: 356.5; }
        frame 68 { x: 13.8; y: 23; skew-x: 357.5; skew-y: 357.5; }
        frame 69 { x: 15; y: 21.6; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: 15.6; y: 21; skew-x: 359.2; skew-y: 359.2; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 16; y: 20.5; skew-x: 359.7; skew-y: 359.7; }
        frame 72 { x: 16.4; y: 20.4; skew-x: 360; skew-y: 360; }
        frame 73 { x: 16.8; y: 20; skew-x: 360.5; skew-y: 360.5; }
        frame 74 { x: 17.3; y: 19.5; skew-x: 361; skew-y: 361; scale-x: 0.799; scale-y: 0.799; }
        frame 75 { x: 17.8; y: 19; skew-x: 361.7; skew-y: 361.7; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: 16; y: 21.1; skew-x: 360; skew-y: 360; scale-x: 0.799; scale-y: 0.799; }
        frame 77 { x: 14.5; y: 22.8; skew-x: 358.7; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 12.9; y: 25; skew-x: 357; skew-y: 357; }
        frame 79 { x: 11.3; y: 26.9; skew-x: 355.5; skew-y: 355.5; }
        frame 80 { x: 9.8; y: 28.9; skew-x: 354; skew-y: 354; }
        frame 81 { x: 8.3; y: 31; skew-x: 352.2; skew-y: 352.2; }
        frame 82 { x: 9.6; y: 29.1; skew-x: 353.5; skew-y: 353.5; }
        frame 83 { x: 10.9; y: 27.2; skew-x: 354.7; skew-y: 354.7; }
        frame 84 { x: 12.3; y: 25.3; skew-x: 356; skew-y: 356; }
        frame 85 { x: 13.6; y: 23.4; skew-x: 357.2; skew-y: 357.2; }
        frame 86 { x: 15; y: 21.6; skew-x: 358.5; skew-y: 358.5; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 17.1; y: 24.5; skew-x: 355.5; skew-y: 355.5; scale-x: 0.799; scale-y: 0.799; }
        frame 89 { x: 19.2; y: 27.7; skew-x: 352.5; skew-y: 352.2; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 21.5; y: 30.8; skew-x: 349.5; skew-y: 349; }
        frame 91 { x: 24; y: 34.1; skew-x: 346.4; skew-y: 345.8; }
        frame 92 { x: 42.8; y: 31.1; skew-x: 358.5; skew-y: 357.9; scale-x: 0.798; }
        frame 93 { x: 63.8; y: 29.6; skew-x: 370.5; skew-y: 369.6; scale-x: -10000; scale-y: 0.798; }
        frame 94 { x: 87; y: 30; skew-x: 382.6; skew-y: 381.6; scale-x: 0.797; scale-y: 0.797; }
        frame 95 { x: 111.8; y: 32.4; skew-x: 394.7; skew-y: 393.5; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 132.4; y: 34.3; skew-x: 403.4; skew-y: 402.1; scale-x: 0.795; scale-y: 0.795; }
        frame 97 { x: 153.6; y: 37.5; skew-x: 412.1; skew-y: 410.9; scale-x: 0.794; scale-y: 0.794; }
        frame 98 { x: 174.7; y: 41.9; skew-x: 420.7; skew-y: 419.5; scale-x: 0.795; scale-y: 0.795; }
        frame 99 { x: 175; y: 47.9; skew-x: 418.7; skew-y: 421.4; scale-x: 0.758; scale-y: 0.788; }
        frame 100 { x: 175.3; y: 53.7; skew-x: 416.7; skew-y: 423.2; scale-x: 0.724; scale-y: 0.783; }
        frame 101 { x: 171.1; y: 45.3; skew-x: 415.9; skew-y: 418.4; scale-x: 0.758; scale-y: 0.788; }
        frame 102 { x: 166.5; y: 36.9; skew-x: 414.8; skew-y: 413.6; scale-x: 0.794; scale-y: 0.795; }
        frame 103 { x: 170.6; y: 39.4; skew-x: 417.7; skew-y: 416.6; scale-x: 0.793; scale-y: 0.794; }
        frame 104 { x: 174.7; y: 41.9; skew-x: 420.7; skew-y: 419.5; scale-x: 0.795; scale-y: 0.795; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 105;
        frame 0 { x: 38.1; y: 44.8; skew-x: 355.5; skew-y: 355.5; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_JAW; }
        frame 1 { x: 38.3; y: 43.9; skew-x: 356.5; skew-y: 356.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -10000; y: 43; skew-x: 357.4; skew-y: 357.4; }
        frame 3 { y: 42.1; skew-x: 358.2; skew-y: 358.2; scale-x: 0.8; scale-y: 0.8; }
        frame 4 { x: 38.4; y: 41.2; skew-x: 359.2; skew-y: 359.2; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 38.6; y: 40.4; skew-x: 360; skew-y: 360; }
        frame 6 { x: -10000; y: 40.1; skew-x: 360.8; skew-y: 360.8; }
        frame 7 { x: 38.7; y: 39.7; skew-x: 361.7; skew-y: 361.7; }
        frame 8 { x: 38.6; y: 41.3; skew-x: 359.7; skew-y: 359.7; }
        frame 9 { x: 38.4; y: 43.1; skew-x: 357.7; skew-y: 357.7; scale-x: 0.799; scale-y: 0.799; }
        frame 10 { x: 38.1; y: 44.8; skew-x: 355.5; skew-y: 355.5; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: -10000; y: 45.5; skew-x: 354.7; skew-y: 354.7; }
        frame 12 { y: 46.1; skew-x: 353.7; skew-y: 353.7; }
        frame 13 { y: 46.8; skew-x: 352.9; skew-y: 352.9; }
        frame 14 { x: 38; y: 47.5; skew-x: 352; skew-y: 352; }
        frame 15 { x: 37.9; y: 48.2; skew-x: 351; skew-y: 351; }
        frame 16 { x: -10000; y: 48.8; skew-x: 348.2; skew-y: 348.2; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { x: 37.8; y: 49.3; skew-x: 345.3; skew-y: 345.3; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 37.9; y: 47.8; skew-x: 348.7; skew-y: 348.7; scale-x: 0.798; scale-y: 0.798; }
        frame 19 { x: 38; y: 46.2; skew-x: 352.2; skew-y: 352.2; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { x: 38.1; y: 44.8; skew-x: 355.5; skew-y: 355.5; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 31.9; y: 54; skew-x: 348.6; skew-y: 348.6; scale-x: 0.798; scale-y: 0.798; }
        frame 22 { x: 30.3; y: 48.3; skew-x: 354.7; skew-y: 354.7; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 28.8; y: 42.7; skew-x: 360.5; skew-y: 360.5; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { x: 32.9; y: 35.3; skew-x: 361.5; skew-y: 361.5; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: 36.9; y: 28.1; skew-x: 362.6; skew-y: 362.6; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 41; y: 20.8; skew-x: 363.8; skew-y: 363.8; }
        frame 27 { x: 39.9; y: 16.4; skew-x: 370; skew-y: 370; scale-x: 0.797; scale-y: 0.797; }
        frame 28 { x: 38.9; y: 11.9; skew-x: 376.4; skew-y: 376.4; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 37.8; y: 14.9; skew-x: 375.1; skew-y: 375.1; scale-x: 0.796; scale-y: 0.796; }
        frame 30 { x: 36.8; y: 18; skew-x: 374.1; skew-y: 374.1; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 32.8; y: 29.2; skew-x: 366.5; skew-y: 366.5; }
        frame 32 { x: 29.1; y: 40.5; skew-x: 359.2; skew-y: 359.2; scale-x: 0.797; scale-y: 0.797; }
        frame 33 { x: 25.7; y: 51.8; skew-x: 351.6; skew-y: 351.6; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 24; y: 57.2; skew-x: 345.7; skew-y: 345.7; scale-x: 0.796; scale-y: 0.796; }
        frame 35 { x: 22.6; y: 62.8; skew-x: 339.5; skew-y: 339.5; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: 24.7; y: 63.9; skew-x: 332.5; skew-y: 337.6; scale-x: 0.799; scale-y: 0.795; }
        frame 37 { x: 24.8; y: 54.1; skew-x: 346; skew-y: 346; scale-x: 0.796; scale-y: 0.796; }
        frame 38 { x: 26.5; y: 50.5; skew-x: 348.7; skew-y: 348.7; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 28.2; y: 46.9; skew-x: 351; skew-y: 351; }
        frame 40 { x: 31.9; y: 38.5; skew-x: 355.7; skew-y: 355.7; scale-x: 0.795; scale-y: 0.795; }
        frame 41 { x: 35.4; y: 30.2; skew-x: 360; skew-y: 360; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 39.1; y: 22; skew-x: 364.6; skew-y: 364.6; }
        frame 43 { x: 38.9; y: 16.4; skew-x: 371.5; skew-y: 371.5; scale-x: 0.794; scale-y: 0.794; }
        frame 44 { x: 38.8; y: 10.8; skew-x: 378.5; skew-y: 378.5; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 39.1; y: 13.6; skew-x: 377.6; skew-y: 377.6; scale-x: 0.793; scale-y: 0.793; }
        frame 46 { x: 39.2; y: 16.4; skew-x: 376.9; skew-y: 376.9; scale-x: 0.794; scale-y: 0.794; }
        frame 47 { x: 32; y: 33.1; skew-x: 367.1; skew-y: 367.1; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 25; y: 49.9; skew-x: 357.5; skew-y: 357.5; }
        frame 49 { x: 26.5; y: 55.1; skew-x: 346.1; skew-y: 346.1; scale-x: 0.795; scale-y: 0.795; }
        frame 50 { x: 31.9; y: 54; skew-x: 348.6; skew-y: 348.6; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { x: 38.1; y: 44.8; skew-x: 355.5; skew-y: 355.5; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 38.4; y: 44.9; skew-x: 355; skew-y: 355; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 38.6; y: 45; skew-x: 354.5; skew-y: 354.5; }
        frame 54 { x: 38.8; y: 45.1; skew-x: 354; skew-y: 354; }
        frame 55 { x: 38.9; y: -10000; skew-x: 353.5; skew-y: 353.5; }
        frame 56 { x: 39.1; y: 45.3; skew-x: 353; skew-y: 353; }
        frame 57 { x: 39.4; y: 45.4; skew-x: 352.5; skew-y: 352.5; }
        frame 58 { x: 37.5; y: 45.2; skew-x: 353.5; skew-y: 353.5; scale-x: 0.828; scale-y: 0.798; }
        frame 59 { x: 35.5; y: 45; skew-x: 354.5; skew-y: 354.5; scale-x: 0.857; scale-y: -10000; }
        frame 60 { x: 33.4; y: 44.9; skew-x: 355.2; skew-y: 355.2; scale-x: 0.887; }
        frame 61 { x: 33.6; y: 45.3; skew-x: 354.2; skew-y: 354.2; scale-x: 0.857; }
        frame 62 { x: 34.1; y: 45.6; skew-x: 353.2; skew-y: 353.2; scale-x: 0.827; scale-y: 0.797; }
        frame 63 { x: 34.6; y: 45.8; skew-x: 352; skew-y: 352; scale-x: 0.798; scale-y: 0.798; }
        frame 64 { x: 35.1; y: 45.6; skew-x: 352.7; skew-y: 352.7; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 35.8; y: 45.5; skew-x: 353.2; skew-y: 353.2; }
        frame 66 { x: 36.4; y: 45.2; skew-x: 353.7; skew-y: 353.7; }
        frame 67 { x: 36.9; y: 45.1; skew-x: 354.5; skew-y: 354.5; scale-x: 0.799; scale-y: 0.799; }
        frame 68 { x: 37.6; y: 44.8; skew-x: 355; skew-y: 355; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 38.1; y: -10000; skew-x: 355.5; skew-y: 355.5; }
        frame 70 { x: 38.4; y: 44.9; skew-x: 355; skew-y: 355; }
        frame 71 { x: 38.6; y: 45; skew-x: 354.5; skew-y: 354.5; }
        frame 72 { x: 38.8; y: 45.1; skew-x: 354; skew-y: 354; }
        frame 73 { x: 38.9; y: -10000; skew-x: 353.5; skew-y: 353.5; }
        frame 74 { x: 39.1; y: 45.3; skew-x: 353; skew-y: 353; }
        frame 75 { x: 39.4; y: 45.4; skew-x: 352.5; skew-y: 352.5; }
        frame 76 { x: 37.5; y: 45.2; skew-x: 353.5; skew-y: 353.5; scale-x: 0.828; scale-y: 0.798; }
        frame 77 { x: 35.5; y: 45; skew-x: 354.5; skew-y: 354.5; scale-x: 0.857; scale-y: -10000; }
        frame 78 { x: 33.4; y: 44.9; skew-x: 355.2; skew-y: 355.2; scale-x: 0.887; }
        frame 79 { x: 33.6; y: 45.3; skew-x: 354.2; skew-y: 354.2; scale-x: 0.857; }
        frame 80 { x: 34.1; y: 45.6; skew-x: 353.2; skew-y: 353.2; scale-x: 0.827; scale-y: 0.797; }
        frame 81 { x: 34.6; y: 45.8; skew-x: 352; skew-y: 352; scale-x: 0.798; scale-y: 0.798; }
        frame 82 { x: 35.3; y: 45.6; skew-x: 352.7; skew-y: 352.7; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 36; y: 45.3; skew-x: 353.5; skew-y: 353.5; }
        frame 84 { x: 36.6; y: 45.1; skew-x: 354.2; skew-y: 354.2; }
        frame 85 { x: 37.5; y: 44.9; skew-x: 354.9; skew-y: 354.9; scale-x: 0.799; scale-y: 0.799; }
        frame 86 { x: 38.1; y: 44.8; skew-x: 355.5; skew-y: 355.5; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 88 { cel: -10000; }
    }
    Track {
        source-name: "zombie_football_helmet";
        frame-count: 105;
        frame 0 { x: 25.8; y: 2.8; skew-x: 357.2; skew-y: 357.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_HELMET; }
        frame 1 { x: 26.3; y: 1.8; skew-x: 357.9; skew-y: 357.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 26.8; y: 0.9; skew-x: 358.5; skew-y: 358.5; }
        frame 3 { x: 27.3; y: 0.1; skew-x: 359; skew-y: 359; }
        frame 4 { x: 27.8; y: -0.6; skew-x: 359.5; skew-y: 359.5; }
        frame 5 { x: 28.3; y: -1.4; skew-x: 360; skew-y: 360; }
        frame 6 { x: 29; y: -1.7; skew-x: 360.8; skew-y: 360.8; }
        frame 7 { x: 29.9; y: -2.1; skew-x: 362; skew-y: 362; }
        frame 8 { x: 28.5; y: -0.4; skew-x: 360.3; skew-y: 360.3; }
        frame 9 { x: 27.2; y: 1; skew-x: 359; skew-y: 359; }
        frame 10 { x: 25.8; y: 2.8; skew-x: 357.2; skew-y: 357.2; }
        frame 11 { x: 25.4; y: 3.6; skew-x: 356.7; skew-y: 356.7; scale-x: 0.799; scale-y: 0.799; }
        frame 12 { x: 25; y: 4.5; skew-x: 356.2; skew-y: 356.2; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 24.4; y: 5.4; skew-x: 355.5; skew-y: 355.5; }
        frame 14 { x: 23.9; y: 6.3; skew-x: 355; skew-y: 355; }
        frame 15 { x: 23.3; y: 7.2; skew-x: 354.2; skew-y: 354.2; }
        frame 16 { x: 23.1; y: 7.1; skew-x: 353.5; skew-y: 353.5; }
        frame 17 { x: 22.6; y: 7; skew-x: 352.4; skew-y: 352.4; }
        frame 18 { x: 23.8; y: 5.5; skew-x: 354.2; skew-y: 354.2; }
        frame 19 { x: 24.8; y: 4.1; skew-x: 355.7; skew-y: 355.7; }
        frame 20 { x: 25.8; y: 2.8; skew-x: 357.2; skew-y: 357.2; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: 14.6; y: 13.8; skew-x: 350.4; skew-y: 350.4; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 17.3; y: 6.5; skew-x: 356.4; skew-y: 356.4; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 20.2; y: -0; skew-x: 362.2; skew-y: 362.2; }
        frame 24 { x: 25; y: -7.4; skew-x: 363.3; skew-y: 363.3; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: 29.8; y: -14.8; skew-x: 364.3; skew-y: 364.3; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 34.7; y: -22.2; skew-x: 365.5; skew-y: 365.5; }
        frame 27 { x: 38.4; y: -26.8; skew-x: 371.8; skew-y: 371.8; scale-x: 0.797; scale-y: 0.797; }
        frame 28 { x: 42.1; y: -30.8; skew-x: 378.1; skew-y: 378.1; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 40.1; y: -27.6; skew-x: 376.8; skew-y: 376.8; scale-x: 0.796; scale-y: 0.796; }
        frame 30 { x: 38.3; y: -24.5; skew-x: 375.8; skew-y: 375.8; scale-x: 0.797; scale-y: 0.797; }
        frame 31 { x: 28.7; y: -12.9; skew-x: 368.3; skew-y: 368.3; scale-x: 0.796; scale-y: 0.796; }
        frame 32 { x: 19.4; y: -0.7; skew-x: 360.8; skew-y: 360.8; scale-x: 0.797; scale-y: 0.797; }
        frame 33 { x: 10.5; y: 11.6; skew-x: 353.3; skew-y: 353.3; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 5.4; y: 18.1; skew-x: 347.4; skew-y: 347.4; scale-x: 0.796; scale-y: 0.796; }
        frame 35 { x: 0.5; y: 24.8; skew-x: 341.3; skew-y: 341.3; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: -0.9; y: 25.2; skew-x: 339.4; skew-y: 339.4; scale-x: 0.796; scale-y: 0.796; }
        frame 37 { x: 6.2; y: 13.7; skew-x: 347.8; skew-y: 347.8; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 10; y: 8.9; skew-x: 350.4; skew-y: 350.4; }
        frame 39 { x: 13.8; y: 4.2; skew-x: 352.8; skew-y: 352.8; }
        frame 40 { x: 21.1; y: -4.4; skew-x: 357.4; skew-y: 357.4; }
        frame 41 { x: 28.3; y: -12.8; skew-x: 361.8; skew-y: 361.8; scale-x: 0.795; scale-y: 0.795; }
        frame 42 { x: 35.8; y: -21.2; skew-x: 366.3; skew-y: 366.3; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 40.7; y: -26.6; skew-x: 373.3; skew-y: 373.3; scale-x: 0.794; scale-y: 0.794; }
        frame 44 { x: 45.8; y: -31.7; skew-x: 380.3; skew-y: 380.3; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 45; y: -28.9; skew-x: 379.3; skew-y: 379.3; scale-x: 0.793; scale-y: 0.793; }
        frame 46 { x: 44.5; y: -26.4; skew-x: 378.6; skew-y: 378.6; scale-x: 0.794; scale-y: 0.794; }
        frame 47 { x: 29.2; y: -9.8; skew-x: 368.8; skew-y: 368.8; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 14.6; y: 7.5; skew-x: 359.3; skew-y: 359.3; }
        frame 49 { x: 6.9; y: 17.2; skew-x: 347.8; skew-y: 347.8; scale-x: 0.795; scale-y: 0.795; }
        frame 50 { x: 14.6; y: 13.8; skew-x: 350.4; skew-y: 350.4; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 25.8; y: 2.8; skew-x: 357.2; skew-y: 357.2; scale-x: 0.8; scale-y: 0.8; }
        frame 52 { x: 27.1; y: 1.8; skew-x: 358; skew-y: 358; scale-x: 0.795; scale-y: 0.799; }
        frame 53 { x: 28.3; y: 0.8; skew-x: 358.7; skew-y: 358.7; scale-x: 0.791; scale-y: -10000; }
        frame 54 { x: 29.5; y: 0; skew-x: 359.2; skew-y: 359.2; scale-x: 0.786; }
        frame 55 { x: 30.7; y: -0.8; skew-x: 360; skew-y: 360; scale-x: 0.782; }
        frame 56 { x: 31.9; y: -1.6; skew-x: 360.5; skew-y: 360.5; scale-x: 0.777; }
        frame 57 { x: 33.1; y: -2.5; skew-x: 361.3; skew-y: 361.3; scale-x: 0.773; }
        frame 58 { x: 30.6; y: -0.5; skew-x: 359.7; skew-y: 359.7; scale-x: 0.777; }
        frame 59 { x: 28.1; y: 1.4; skew-x: 358.2; skew-y: 358.2; scale-x: 0.782; }
        frame 60 { x: 25.5; y: 3.5; skew-x: 356.7; skew-y: 356.7; scale-x: 0.786; }
        frame 61 { x: 23; y: 5.5; skew-x: 355.2; skew-y: 355.2; scale-x: 0.79; }
        frame 62 { x: 20.6; y: 7.6; skew-x: 353.7; skew-y: 353.7; scale-x: 0.795; }
        frame 63 { x: 18; y: 9.9; skew-x: 352; skew-y: 352; scale-x: 0.799; }
        frame 64 { x: 19.4; y: 8.7; skew-x: 353; skew-y: 353; scale-x: -10000; }
        frame 65 { x: 20.6; y: 7.5; skew-x: 353.7; skew-y: 353.7; }
        frame 66 { x: 22; y: 6.3; skew-x: 354.7; skew-y: 354.7; }
        frame 67 { x: 23.2; y: 5.2; skew-x: 355.5; skew-y: 355.5; }
        frame 68 { x: 24.5; y: 3.9; skew-x: 356.5; skew-y: 356.5; }
        frame 69 { x: 25.8; y: 2.8; skew-x: 357.2; skew-y: 357.2; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: 27.1; y: 1.8; skew-x: 358; skew-y: 358; scale-x: 0.795; scale-y: 0.799; }
        frame 71 { x: 28.3; y: 0.8; skew-x: 358.7; skew-y: 358.7; scale-x: 0.791; scale-y: -10000; }
        frame 72 { x: 29.5; y: 0; skew-x: 359.2; skew-y: 359.2; scale-x: 0.786; }
        frame 73 { x: 30.7; y: -0.8; skew-x: 360; skew-y: 360; scale-x: 0.782; }
        frame 74 { x: 31.9; y: -1.6; skew-x: 360.5; skew-y: 360.5; scale-x: 0.777; }
        frame 75 { x: 33.1; y: -2.5; skew-x: 361.3; skew-y: 361.3; scale-x: 0.773; }
        frame 76 { x: 30.6; y: -0.5; skew-x: 359.7; skew-y: 359.7; scale-x: 0.777; }
        frame 77 { x: 28.1; y: 1.4; skew-x: 358.2; skew-y: 358.2; scale-x: 0.782; }
        frame 78 { x: 25.5; y: 3.5; skew-x: 356.7; skew-y: 356.7; scale-x: 0.786; }
        frame 79 { x: 23; y: 5.5; skew-x: 355.2; skew-y: 355.2; scale-x: 0.79; }
        frame 80 { x: 20.6; y: 7.6; skew-x: 353.7; skew-y: 353.7; scale-x: 0.795; }
        frame 81 { x: 18; y: 9.9; skew-x: 352; skew-y: 352; scale-x: 0.799; }
        frame 82 { x: 19.7; y: 8.4; skew-x: 353.2; skew-y: 353.2; scale-x: -10000; }
        frame 83 { x: 21.2; y: 7; skew-x: 354.2; skew-y: 354.2; }
        frame 84 { x: 22.7; y: 5.6; skew-x: 355.2; skew-y: 355.2; }
        frame 85 { x: 24.2; y: 4.1; skew-x: 356.2; skew-y: 356.2; }
        frame 86 { x: 25.8; y: 2.8; skew-x: 357.2; skew-y: 357.2; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 88 { cel: -10000; }
    }
    Track {
        source-name: "zombie_football_leftarm_hand";
        frame-count: 105;
        frame 0 { x: -1.3; y: 52.8; skew-x: 4; skew-y: 4; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTARM_HAND; }
        frame 1 { x: -1.8; y: 52.1; skew-x: 3.1; skew-y: 3.1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -2.3; y: 51.2; skew-x: 2.3; skew-y: 2.3; }
        frame 3 { x: -2.7; y: 50.4; skew-x: 1.5; skew-y: 1.5; scale-x: 0.8; scale-y: 0.8; }
        frame 4 { x: -3.1; y: 49.6; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: -3.5; y: 48.8; skew-x: 0; skew-y: 0; }
        frame 6 { x: -2.5; y: 47.8; skew-x: 4; skew-y: 4; }
        frame 7 { x: -1.5; y: 46.9; skew-x: 8; skew-y: 8; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: -10000; y: 48.9; skew-x: 6.6; skew-y: 6.6; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: -1.4; y: 50.8; skew-x: 5.3; skew-y: 5.3; }
        frame 10 { x: -1.3; y: 52.8; skew-x: 4; skew-y: 4; }
        frame 11 { x: -1; y: 53.6; skew-x: 4.8; skew-y: 4.8; }
        frame 12 { x: -0.4; y: 54.4; skew-x: 5.6; skew-y: 5.6; }
        frame 13 { x: -0; y: 55.1; skew-x: 6.5; skew-y: 6.5; }
        frame 14 { x: 0.3; y: 56.1; skew-x: 7.3; skew-y: 7.3; }
        frame 15 { x: 0.8; y: 56.7; skew-x: 8.3; skew-y: 8.3; }
        frame 16 { x: -0.7; y: 57.9; skew-x: 1.8; skew-y: 1.8; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { x: -2.3; y: 59.1; skew-x: -4.6; skew-y: -4.6; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -2; y: 56.9; skew-x: -1.7; skew-y: -1.7; }
        frame 19 { x: -1.8; y: 54.8; skew-x: 1; skew-y: 1; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { x: -1.3; y: 52.8; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -6.2; y: 41.8; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 22 { x: -10000; y: 37.9; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 23 { y: 33.8; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 24 { x: -4.7; y: 24.8; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 25 { x: -3.2; y: 15.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: -1.8; y: 6.6; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 27 { x: -1.6; y: 3.6; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 28 { x: -1.4; y: 0.6; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 29 { x: -1; y: 3.2; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 30 { x: -0.6; y: 5.8; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 31 { x: -4; y: 16.9; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 32 { x: -7.5; y: 27.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: -11; y: 38.6; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 34 { x: -12.2; y: 43.6; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 35 { x: -13.4; y: 48.6; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 36 { x: -13.2; y: 43.2; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 37 { x: -13; y: 37.8; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 38 { x: -11.8; y: 33.9; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 39 { x: -10.6; y: 29.8; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 40 { x: -7.8; y: 21.7; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 41 { x: -5; y: 13.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: -2.2; y: 5.4; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 43 { x: -2.1; y: 3.3; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 44 { x: -10000; y: 1.1; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 45 { x: -2.3; y: 3.3; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 46 { x: -2.6; y: 5.4; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 47 { x: -8.2; y: 21.5; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 48 { x: -13.8; y: 37.4; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 49 { x: -10.1; y: 39.6; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 50 { x: -6.2; y: 41.8; skew-x: 44.7; skew-y: 44.7; scale-x: 0.796; scale-y: 0.796; }
        frame 51 { x: -6.6; y: 56.8; skew-x: -7.7; skew-y: -7.7; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTARM_EATINGHAND; }
        frame 52 { x: -5.9; y: 54.9; skew-x: -5.9; skew-y: -5.9; scale-x: 0.899; scale-y: 0.899; image: none; }
        frame 53 { x: -5.5; y: 52.9; skew-x: -4.4; skew-y: -4.4; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: -4.9; y: 50.9; skew-x: -2.7; skew-y: -2.7; scale-x: 0.9; scale-y: 0.9; }
        frame 55 { x: -4.2; y: 49; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: -3.8; y: 47.1; skew-x: 0.3; skew-y: 0.3; }
        frame 57 { x: -3.1; y: 45.1; skew-x: 2; skew-y: 2; }
        frame 58 { x: -4.1; y: 48; skew-x: -0; skew-y: -0; }
        frame 59 { x: -5.2; y: 50.9; skew-x: -2.2; skew-y: -2.2; }
        frame 60 { x: -6.2; y: 53.9; skew-x: -4.4; skew-y: -4.4; }
        frame 61 { x: -7.1; y: 56.8; skew-x: -6.7; skew-y: -6.7; scale-x: 0.899; scale-y: 0.899; }
        frame 62 { x: -8.1; y: 59.8; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: -9; y: 62.9; skew-x: -11.2; skew-y: -11.2; scale-x: 0.9; scale-y: 0.9; }
        frame 64 { x: -8.1; y: 60.1; skew-x: -8.9; skew-y: -8.9; scale-x: 0.899; scale-y: 0.899; }
        frame 65 { x: -7.4; y: 57.4; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: -6.6; y: 54.7; skew-x: -4.7; skew-y: -4.7; scale-x: 0.9; scale-y: 0.9; }
        frame 67 { x: -5.7; y: 52.1; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: -4.9; y: 49.4; skew-x: -0.2; skew-y: -0.2; }
        frame 69 { x: -4; y: 46.8; skew-x: 1.8; skew-y: 1.8; }
        frame 70 { x: 0.8; y: 42.6; skew-x: 9; skew-y: 9; scale-x: 0.899; scale-y: 0.899; }
        frame 71 { x: 6; y: 38.6; skew-x: 16.3; skew-y: 16.3; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 11.5; y: 35; skew-x: 23.6; skew-y: 23.6; scale-x: 0.898; scale-y: 0.898; }
        frame 73 { x: 17; y: 31.4; skew-x: 31.1; skew-y: 31.1; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 22.6; y: 28.3; skew-x: 38.3; skew-y: 38.3; scale-x: 0.897; scale-y: 0.897; }
        frame 75 { x: 28.2; y: 25.3; skew-x: 45.6; skew-y: 45.6; scale-x: 0.898; scale-y: 0.898; }
        frame 76 { x: 29.3; y: 26.7; skew-x: -10000; skew-y: -10000; scale-x: 0.897; scale-y: 0.897; }
        frame 77 { x: 30.4; y: 28.1; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 31.5; y: 29.5; }
        frame 79 { x: 32.5; y: 30.9; }
        frame 80 { x: 33.6; y: 32.3; }
        frame 81 { x: 34.9; y: 33.9; scale-x: 0.899; scale-y: 0.899; }
        frame 82 { x: 26.1; y: 37.4; skew-x: 34.9; skew-y: 34.9; scale-x: 0.898; scale-y: 0.898; }
        frame 83 { x: 17.5; y: 41.3; skew-x: 24.3; skew-y: 24.3; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 9.1; y: 46; skew-x: 13.5; skew-y: 13.5; scale-x: 0.899; scale-y: 0.899; }
        frame 85 { x: 1.1; y: 51.1; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: -6.6; y: 56.8; skew-x: -7.7; skew-y: -7.7; scale-x: 0.9; scale-y: 0.9; }
        frame 87 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 88 { cel: -10000; }
    }
    Track {
        source-name: "zombie_football_rightarm_hand";
        frame-count: 105;
        frame 0 { x: 44.6; y: 69.1; skew-x: 5; skew-y: 5; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_RIGHTARM_HAND; }
        frame 1 { x: 44.1; y: 68.8; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 43.8; y: 68.4; skew-x: 3; skew-y: 3; }
        frame 3 { x: 43.3; y: 68.2; skew-x: 2; skew-y: 2; scale-x: 0.8; scale-y: 0.8; }
        frame 4 { x: 42.9; y: 67.8; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 42.6; y: 67.6; skew-x: 0; skew-y: 0; }
        frame 6 { x: 43.7; y: 66.2; skew-x: 4.5; skew-y: 4.5; scale-x: 0.799; scale-y: 0.799; }
        frame 7 { x: 44.8; y: 64.8; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 44.6; y: 66.2; skew-x: 7.5; skew-y: 7.5; }
        frame 9 { x: -10000; y: 67.6; skew-x: 6.3; skew-y: 6.3; }
        frame 10 { y: 69.1; skew-x: 5; skew-y: 5; }
        frame 11 { x: 44.9; y: 69.4; skew-x: 6; skew-y: 6; }
        frame 12 { x: 45.3; y: 69.7; skew-x: 7; skew-y: 7; }
        frame 13 { x: 45.6; y: 70; skew-x: 8.1; skew-y: 8.1; }
        frame 14 { x: 46.1; y: 70.3; skew-x: 9.3; skew-y: 9.3; }
        frame 15 { x: 46.5; y: 70.6; skew-x: 10.3; skew-y: 10.3; }
        frame 16 { x: 45.5; y: 71.5; skew-x: 6.6; skew-y: 6.6; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { x: 44.6; y: 72.3; skew-x: 3; skew-y: 3; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -10000; y: 71.3; skew-x: 3.6; skew-y: 3.6; }
        frame 19 { x: 44.5; y: 70.3; skew-x: 4.3; skew-y: 4.3; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { x: 44.6; y: 69.1; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 47.6; y: 72.8; skew-x: 6; skew-y: 6; scale-x: 0.798; scale-y: 0.798; }
        frame 22 { x: 57.4; y: 68.6; skew-x: 1.8; skew-y: 1.8; scale-x: 0.797; scale-y: 0.797; }
        frame 23 { x: 67.3; y: 64.3; skew-x: -2.2; skew-y: -2.2; scale-x: 0.796; scale-y: 0.796; }
        frame 24 { x: 72.7; y: 68.2; skew-x: -23.5; skew-y: -23.5; scale-x: 0.793; scale-y: 0.793; }
        frame 25 { x: 80.7; y: 72.8; skew-x: -45; skew-y: -45; scale-x: 0.791; scale-y: 0.791; }
        frame 26 { x: 90.7; y: 76.5; skew-x: -66.3; skew-y: -66.3; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 90.8; y: 73.7; skew-x: -66.4; skew-y: -66.4; scale-x: 0.789; scale-y: 0.789; }
        frame 28 { x: 90.7; y: 70.9; skew-x: -66.3; skew-y: -66.3; scale-x: 0.79; scale-y: 0.79; }
        frame 29 { x: -10000; y: 73.7; skew-x: -66.4; skew-y: -66.4; scale-x: 0.789; scale-y: 0.789; }
        frame 30 { y: 76.5; skew-x: -66.3; skew-y: -66.3; scale-x: 0.791; scale-y: 0.791; }
        frame 31 { x: 83.6; y: 81.3; skew-x: -58.6; skew-y: -58.6; scale-x: 0.789; scale-y: 0.789; }
        frame 32 { x: 77; y: 86; skew-x: -51; skew-y: -51; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 70.6; y: 90.6; skew-x: -43.3; skew-y: -43.3; }
        frame 34 { x: 65.8; y: 90.1; skew-x: -36.7; skew-y: -36.7; scale-x: 0.788; scale-y: 0.788; }
        frame 35 { x: 61.1; y: 89.6; skew-x: -30.3; skew-y: -30.3; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 54; y: 78.6; skew-x: -9.7; skew-y: -9.7; scale-x: 0.787; scale-y: 0.787; }
        frame 37 { x: 48.9; y: 68.7; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 48.4; y: 59.4; skew-x: 26.1; skew-y: 26.1; scale-x: 0.785; scale-y: 0.785; }
        frame 39 { x: 48.2; y: 51.2; skew-x: 41.6; skew-y: 41.6; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 54.4; y: 40.3; skew-x: 61; skew-y: 61; scale-x: 0.783; scale-y: 0.783; }
        frame 41 { x: 60.1; y: 31.4; skew-x: 80.5; skew-y: 80.5; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 64.7; y: 23.9; skew-x: 99.8; skew-y: 99.8; }
        frame 43 { x: -10000; y: 21.6; skew-x: -10000; skew-y: -10000; scale-x: 0.782; scale-y: 0.782; }
        frame 44 { y: 19.1; scale-x: -10000; scale-y: -10000; }
        frame 45 { y: 21.5; }
        frame 46 { y: 23.9; scale-x: 0.783; scale-y: 0.783; }
        frame 47 { x: 55.2; y: 40.8; skew-x: 71; skew-y: 71; scale-x: 0.782; scale-y: 0.782; }
        frame 48 { x: 44.1; y: 61.4; skew-x: 42.1; skew-y: 42.1; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 45.7; y: 66.3; skew-x: 24; skew-y: 24; scale-x: 0.789; scale-y: 0.789; }
        frame 50 { x: 47.6; y: 72.8; skew-x: 6; skew-y: 6; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { x: 42.4; y: 67.6; skew-x: -18.9; skew-y: -18.9; scale-x: 0.88; scale-y: 0.88; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_OUTERARM_EATINGHAND; }
        frame 52 { x: 41.4; y: 64; skew-x: -17.7; skew-y: -17.7; scale-x: 0.879; scale-y: 0.879; image: none; }
        frame 53 { x: 40.3; y: 60.5; skew-x: -16.5; skew-y: -16.5; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 39.3; y: 57; skew-x: -15.4; skew-y: -15.4; }
        frame 55 { x: 38.1; y: 53.4; skew-x: -14.2; skew-y: -14.2; }
        frame 56 { x: 37.1; y: 49.9; skew-x: -13.2; skew-y: -13.2; }
        frame 57 { x: 36; y: 46.5; skew-x: -12.1; skew-y: -12.1; scale-x: 0.88; scale-y: 0.88; }
        frame 58 { x: 34.8; y: 46.8; skew-x: -14.2; skew-y: -14.2; scale-x: 0.879; scale-y: 0.879; }
        frame 59 { x: 33.5; y: 47.2; skew-x: -16.5; skew-y: -16.5; scale-x: 0.878; scale-y: 0.878; }
        frame 60 { x: 32.3; y: 47.6; skew-x: -18.9; skew-y: -18.9; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 31.1; y: 48; skew-x: -21.2; skew-y: -21.2; }
        frame 62 { x: 30; y: 48.5; skew-x: -23.4; skew-y: -23.4; scale-x: 0.877; scale-y: 0.877; }
        frame 63 { x: 28.7; y: 48.9; skew-x: -25.7; skew-y: -25.7; scale-x: 0.878; scale-y: 0.878; }
        frame 64 { x: 29.4; y: 50.1; skew-x: -24.5; skew-y: -24.5; scale-x: 0.877; scale-y: 0.877; }
        frame 65 { x: 30.3; y: 51.5; skew-x: -23.4; skew-y: -23.4; scale-x: 0.878; scale-y: 0.878; }
        frame 66 { x: 31.1; y: 52.6; skew-x: -22.2; skew-y: -22.2; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 31.8; y: 54; skew-x: -21.2; skew-y: -21.2; }
        frame 68 { x: 32.6; y: 55.3; skew-x: -20; skew-y: -20; scale-x: 0.879; scale-y: 0.879; }
        frame 69 { x: 33.4; y: 56.6; skew-x: -18.9; skew-y: -18.9; scale-x: 0.88; scale-y: 0.88; }
        frame 70 { x: 33.8; y: 55.8; skew-x: -17.9; skew-y: -17.9; scale-x: 0.879; scale-y: 0.879; }
        frame 71 { x: 34; y: 55.1; skew-x: -16.9; skew-y: -16.9; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 34.4; y: 54.3; skew-x: -15.9; skew-y: -15.9; }
        frame 73 { x: 34.6; y: 53.6; skew-x: -15; skew-y: -15; }
        frame 74 { x: 35.1; y: 52.8; skew-x: -14; skew-y: -14; }
        frame 75 { x: 35.2; y: 52.1; skew-x: -13.1; skew-y: -13.1; scale-x: 0.88; scale-y: 0.88; }
        frame 76 { x: 34.4; y: 54.1; skew-x: -15.2; skew-y: -15.2; scale-x: 0.879; scale-y: 0.879; }
        frame 77 { x: 33.6; y: 55.9; skew-x: -17.4; skew-y: -17.4; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 32.9; y: 57.9; skew-x: -19.7; skew-y: -19.7; }
        frame 79 { x: 32.1; y: 59.7; skew-x: -21.7; skew-y: -21.7; }
        frame 80 { x: 31.6; y: 61.6; skew-x: -24; skew-y: -24; }
        frame 81 { x: 30.8; y: 63.5; skew-x: -26.2; skew-y: -26.2; scale-x: 0.88; scale-y: 0.88; }
        frame 82 { x: 33; y: 64.3; skew-x: -24.7; skew-y: -24.7; scale-x: 0.879; scale-y: 0.879; }
        frame 83 { x: 35.5; y: 65.2; skew-x: -23.2; skew-y: -23.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 37.8; y: 65.9; skew-x: -21.7; skew-y: -21.7; }
        frame 85 { x: 40.1; y: 66.7; skew-x: -20.2; skew-y: -20.2; }
        frame 86 { x: 42.4; y: 67.6; skew-x: -18.9; skew-y: -18.9; scale-x: 0.88; scale-y: 0.88; }
        frame 87 { x: 44.1; y: 69.3; skew-x: 6; skew-y: 6; scale-x: 0.798; scale-y: 0.798; image: IMAGE_REANIM_ZOMBIE_FOOTBALL_RIGHTARM_HAND; }
        frame 88 { x: 48.1; y: 63; skew-x: 15.6; skew-y: 15.6; scale-x: 0.797; scale-y: 0.797; image: none; }
        frame 89 { x: 52.5; y: 57.1; skew-x: 25.3; skew-y: 25.3; scale-x: 0.796; scale-y: 0.796; }
        frame 90 { x: 57; y: 51.6; skew-x: 35.1; skew-y: 35.1; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 61.6; y: 46.6; skew-x: 44.8; skew-y: 44.8; }
        frame 92 { x: 70.2; y: 54.1; skew-x: 40.6; skew-y: 40.6; scale-x: 0.794; scale-y: 0.794; }
        frame 93 { x: 78.8; y: 61.8; skew-x: 36.3; skew-y: 36.3; scale-x: 0.793; scale-y: 0.793; }
        frame 94 { x: 87.3; y: 69.6; skew-x: 32.1; skew-y: 32.1; scale-x: 0.792; scale-y: 0.792; }
        frame 95 { x: 96; y: 77.4; skew-x: 27.7; skew-y: 27.7; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 106.6; y: 91.6; skew-x: 23.8; skew-y: 23.8; scale-x: 0.79; scale-y: 0.79; }
        frame 97 { x: 117.3; y: 105.9; skew-x: 20.1; skew-y: 20.1; scale-x: 0.789; scale-y: 0.789; }
        frame 98 { x: 128; y: 120.1; skew-x: 16.4; skew-y: 16.4; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 128.1; y: 122.4; skew-x: 15.1; skew-y: 17.8; scale-x: 0.784; scale-y: 0.733; }
        frame 100 { x: 128; y: 124.7; skew-x: 14; skew-y: 19.1; scale-x: 0.78; scale-y: 0.679; }
        frame 101 { x: 132.3; y: 112.9; skew-x: 29.8; skew-y: 32.3; scale-x: 0.783; scale-y: 0.732; }
        frame 102 { x: 137.3; y: 102.3; skew-x: 45.7; skew-y: 45.7; scale-x: 0.788; scale-y: 0.788; }
        frame 103 { x: 132.5; y: 110.7; skew-x: 31.1; skew-y: 31.1; scale-x: 0.787; scale-y: 0.787; }
        frame 104 { x: 128; y: 120.1; skew-x: 16.4; skew-y: 16.4; scale-x: 0.789; scale-y: 0.789; }
    }
}
