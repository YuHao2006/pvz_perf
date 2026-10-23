export component Zombie_imp {
    fps: 12;
    Track {
        source-name: "anim_land";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 98 { cel: 0; }
        frame 99 { cel: -10000; }
    }
    Track {
        source-name: "anim_thrown";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 82 { cel: 0; }
        frame 83 { cel: -10000; }
        frame 98 { cel: -1; }
        frame 99 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 104;
        frame 33 { cel: -1; }
        frame 34 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 33 { cel: 0; }
        frame 34 { cel: -10000; }
        frame 60 { cel: -1; }
        frame 61 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 60 { cel: 0; }
        frame 61 { cel: -10000; }
        frame 82 { cel: -1; }
        frame 83 { cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 104;
        frame 0 { x: -59.8; y: 90.1; }
        frame 1 { x: -56.5; y: -10000; }
        frame 2 { x: -53.2; }
        frame 3 { x: -49.9; }
        frame 4 { x: -47.8; }
        frame 5 { x: -45.7; }
        frame 6 { x: -43.5; }
        frame 7 { x: -40.3; }
        frame 8 { x: -37.1; }
        frame 9 { x: -33.9; }
        frame 10 { x: -33; }
        frame 11 { x: -32.2; }
        frame 12 { x: -31.3; }
        frame 13 { x: -30.4; }
        frame 14 { x: -28.7; }
        frame 15 { x: -26.9; }
        frame 16 { x: -25.2; }
        frame 17 { x: -21.3; }
        frame 18 { x: -17.4; }
        frame 19 { x: -13.5; }
        frame 20 { x: -12.3; }
        frame 21 { x: -11.2; }
        frame 22 { x: -10; }
        frame 23 { x: -7.8; }
        frame 24 { x: -5.5; }
        frame 25 { x: -3.3; }
        frame 26 { x: -2.2; }
        frame 27 { x: -1.1; }
        frame 28 { x: -0.1; }
        frame 29 { x: 0.9; }
        frame 30 { x: 1.6; }
        frame 31 { x: 2.4; }
        frame 32 { x: 3.1; }
        frame 33 { x: -10000; cel: -1; }
        frame 34 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_imp_innerarm_upper";
        frame-count: 104;
        frame 0 { x: 30.4; y: 89.2; skew-x: 319.3; skew-y: 319.3; scale-x: 0.907; scale-y: 0.907; image: IMAGE_REANIM_ZOMBIE_IMP_ARM1; }
        frame 1 { x: -10000; y: 87.9; skew-x: 323.4; skew-y: 323.4; scale-x: 0.905; scale-y: 0.905; image: none; }
        frame 2 { y: 86.6; skew-x: 327.6; skew-y: 327.6; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 30.5; y: 85.4; skew-x: 331.6; skew-y: 331.6; scale-x: 0.906; scale-y: 0.906; }
        frame 4 { x: 29.5; y: 86.9; skew-x: 331.9; skew-y: 331.9; scale-x: 0.905; scale-y: 0.905; }
        frame 5 { x: 28.6; y: 88.4; skew-x: 332.2; skew-y: 332.2; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 27.5; y: 90; skew-x: 332.6; skew-y: 332.6; scale-x: 0.906; scale-y: 0.906; }
        frame 7 { x: -10000; y: 93.4; skew-x: 321.2; skew-y: 321.2; scale-x: 0.905; scale-y: 0.905; }
        frame 8 { x: 27.9; y: 96.9; skew-x: 309.9; skew-y: 309.9; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 28.6; y: 100.3; skew-x: 298.5; skew-y: 298.5; scale-x: 0.907; scale-y: 0.907; }
        frame 10 { x: 28.3; y: 98.3; skew-x: 303.6; skew-y: 303.6; scale-x: 0.905; scale-y: 0.905; }
        frame 11 { x: 28; y: 96.3; skew-x: 308.9; skew-y: 308.9; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 27.8; y: 94.2; skew-x: 314.1; skew-y: 314.1; }
        frame 13 { x: 27.6; y: 92.2; skew-x: 319.3; skew-y: 319.3; scale-x: 0.907; scale-y: 0.907; }
        frame 14 { x: 28.6; y: 89.9; skew-x: 323.4; skew-y: 323.4; scale-x: 0.905; scale-y: 0.905; }
        frame 15 { x: 29.5; y: 87.6; skew-x: 327.6; skew-y: 327.6; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 30.5; y: 85.4; skew-x: 331.6; skew-y: 331.6; scale-x: 0.906; scale-y: 0.906; }
        frame 17 { x: -10000; y: 85.2; skew-x: 332.9; skew-y: 332.9; scale-x: 0.905; scale-y: 0.905; }
        frame 18 { x: 30.6; y: 85; skew-x: 334.4; skew-y: 334.4; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 30.5; y: 84.8; skew-x: 335.6; skew-y: 335.6; scale-x: 0.906; scale-y: 0.906; }
        frame 20 { x: 29.9; y: 88.1; skew-x: 325.9; skew-y: 325.9; scale-x: 0.904; scale-y: 0.904; }
        frame 21 { x: 29.6; y: 91.4; skew-x: 316.1; skew-y: 316.1; scale-x: 0.905; scale-y: 0.905; }
        frame 22 { x: -10000; y: 94.8; skew-x: 306.3; skew-y: 306.3; scale-x: 0.906; scale-y: 0.906; }
        frame 23 { x: 29.4; y: 96; skew-x: 303.6; skew-y: 303.6; scale-x: 0.905; scale-y: 0.905; }
        frame 24 { x: -10000; y: 97.3; skew-x: 301.1; skew-y: 301.1; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 29.3; y: 98.5; skew-x: 298.5; skew-y: 298.5; scale-x: 0.907; scale-y: 0.907; }
        frame 26 { x: 29.5; y: 97.1; skew-x: 301.3; skew-y: 301.3; scale-x: 0.905; scale-y: 0.905; }
        frame 27 { x: 29.8; y: 95.6; skew-x: 304.3; skew-y: 304.3; scale-x: 0.904; scale-y: 0.904; }
        frame 28 { x: 30.1; y: 94.1; skew-x: 307.1; skew-y: 307.1; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 30.3; y: 92.7; skew-x: 310.1; skew-y: 310.1; scale-x: 0.905; scale-y: 0.905; }
        frame 30 { x: 30.2; y: 91.6; skew-x: 313.1; skew-y: 313.1; scale-x: 0.904; scale-y: 0.904; }
        frame 31 { x: 30.3; y: 90.4; skew-x: 316.3; skew-y: 316.3; scale-x: 0.905; scale-y: 0.905; }
        frame 32 { x: 30.4; y: 89.2; skew-x: 319.3; skew-y: 319.3; scale-x: 0.907; scale-y: 0.907; }
        frame 33 { x: -10000; y: 89.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 30.6; y: 88.7; skew-x: 320.9; skew-y: 320.9; scale-x: 0.905; scale-y: 0.905; }
        frame 35 { x: 30.9; y: 88.1; skew-x: 322.6; skew-y: 322.6; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 31.1; y: 87.4; skew-x: 324.2; skew-y: 324.2; }
        frame 37 { x: 31.4; y: 86.7; skew-x: 325.8; skew-y: 325.8; scale-x: 0.907; scale-y: 0.907; }
        frame 38 { x: 31.5; y: 86.1; skew-x: 326.9; skew-y: 326.9; scale-x: 0.905; scale-y: 0.905; }
        frame 39 { x: 31.7; y: 85.5; skew-x: 327.9; skew-y: 327.9; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 31.8; y: 84.9; skew-x: 328.9; skew-y: 328.9; }
        frame 41 { x: 31.9; y: 84.3; skew-x: 329.9; skew-y: 329.9; scale-x: 0.906; scale-y: 0.906; }
        frame 42 { x: 30.4; y: 88.9; skew-x: 321.7; skew-y: 321.7; scale-x: 0.904; scale-y: 0.904; }
        frame 43 { x: 29.1; y: 93.3; skew-x: 313.4; skew-y: 313.4; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 28; y: 97.8; skew-x: 305.1; skew-y: 305.1; scale-x: 0.905; scale-y: 0.905; }
        frame 45 { x: 28.4; y: 94.2; skew-x: 316.4; skew-y: 316.4; scale-x: 0.904; scale-y: 0.904; }
        frame 46 { x: 29.1; y: 90.6; skew-x: 327.4; skew-y: 327.4; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 30.2; y: 86.9; skew-x: 338.7; skew-y: 338.7; }
        frame 48 { x: 31.5; y: 83.2; skew-x: 349.9; skew-y: 349.9; scale-x: 0.905; scale-y: 0.905; }
        frame 49 { x: 31.8; y: 81.3; skew-x: 358.2; skew-y: 358.2; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 32.4; y: 79.3; skew-x: 366.3; skew-y: 366.3; scale-x: 0.904; scale-y: 0.904; }
        frame 51 { x: 33; y: 77.6; skew-x: 374.6; skew-y: 374.6; scale-x: 0.903; scale-y: 0.903; }
        frame 52 { x: 33.8; y: 75.9; skew-x: 383; skew-y: 383; scale-x: 0.904; scale-y: 0.904; }
        frame 53 { x: 31.2; y: 80; skew-x: 377.1; skew-y: 377.1; scale-x: 0.903; scale-y: 0.903; }
        frame 54 { x: 28.8; y: 84.2; skew-x: 371.3; skew-y: 371.3; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 26.4; y: 88.5; skew-x: 365.5; skew-y: 365.5; scale-x: 0.904; scale-y: 0.904; }
        frame 56 { x: 27; y: 88.6; skew-x: 354; skew-y: 354; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 27.9; y: 88.8; skew-x: 342.5; skew-y: 342.5; scale-x: 0.905; scale-y: 0.905; }
        frame 58 { x: 29.1; y: 89.1; skew-x: 330.9; skew-y: 330.9; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 30.4; y: 89.4; skew-x: 319.3; skew-y: 319.3; scale-x: 0.907; scale-y: 0.907; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 31.2; y: 91.1; skew-x: 317.4; skew-y: 317.4; scale-x: 0.905; scale-y: 0.905; }
        frame 62 { x: 32; y: 92.6; skew-x: 315.6; skew-y: 315.6; scale-x: 0.904; scale-y: 0.904; }
        frame 63 { x: 32.7; y: 94.2; skew-x: 313.6; skew-y: 313.6; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 33.5; y: 95.9; skew-x: 311.9; skew-y: 311.9; scale-x: 0.903; scale-y: 0.903; }
        frame 65 { x: 34.4; y: 97.4; skew-x: 309.9; skew-y: 309.9; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 35; y: 99.1; skew-x: 308.1; skew-y: 308.1; scale-x: 0.904; scale-y: 0.904; }
        frame 67 { x: 38.6; y: 97; skew-x: 318.6; skew-y: 318.6; scale-x: 0.902; scale-y: 0.902; }
        frame 68 { x: 42.3; y: 94.9; skew-x: 328.9; skew-y: 328.9; scale-x: 0.901; scale-y: 0.901; }
        frame 69 { x: 46.4; y: 92.8; skew-x: 339.4; skew-y: 339.4; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 50.6; y: 90.8; skew-x: 349.8; skew-y: 349.8; scale-x: 0.902; scale-y: 0.902; }
        frame 71 { x: 51; y: 95.7; skew-x: 329.7; skew-y: 329.7; scale-x: 0.9; scale-y: 0.9; }
        frame 72 { x: 52.4; y: 100.8; skew-x: 309.6; skew-y: 309.6; scale-x: 0.899; scale-y: 0.899; }
        frame 73 { x: 54.6; y: 105.5; skew-x: 289.6; skew-y: 289.6; scale-x: 0.9; scale-y: 0.9; }
        frame 74 { x: 53.8; y: 106.4; skew-x: 291.1; skew-y: 288.1; scale-x: 0.868; scale-y: 0.925; }
        frame 75 { x: 53.1; y: 107.3; skew-x: 292.7; skew-y: 286.7; scale-x: 0.838; scale-y: 0.952; }
        frame 76 { x: 53.9; y: 106.4; skew-x: 291.1; skew-y: 288.1; scale-x: 0.868; scale-y: 0.925; }
        frame 77 { x: 54.6; y: 105.5; skew-x: 289.6; skew-y: 289.6; scale-x: 0.9; scale-y: 0.9; }
        frame 78 { x: 54.7; y: 105.6; skew-x: 289.5; skew-y: 289.5; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: 54.6; y: 105.5; skew-x: 289.6; skew-y: 289.6; scale-x: 0.9; scale-y: 0.9; }
        frame 80 { x: -10000; y: 105.9; skew-x: 290.8; skew-y: 290.8; scale-x: 0.899; scale-y: 0.899; }
        frame 81 { x: 54.8; y: 106.2; skew-x: 292.4; skew-y: 292.4; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 91.5; y: 38.1; skew-x: 224.5; skew-y: 224.5; scale-x: 0.987; scale-y: 0.987; }
        frame 83 { x: 90.7; y: 37.8; skew-x: 229.9; skew-y: 229.9; scale-x: 0.984; scale-y: 0.984; }
        frame 84 { x: 89.9; y: 37.6; skew-x: 235.2; skew-y: 235.2; scale-x: 0.983; scale-y: 0.983; }
        frame 85 { x: 89.2; y: 37.1; skew-x: 240.5; skew-y: 240.5; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 96.7; y: 31.9; skew-x: 210.8; skew-y: 210.8; scale-x: 0.98; scale-y: 0.98; }
        frame 87 { x: 103.2; y: 24.7; skew-x: 181.3; skew-y: 181.3; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 90; y: -3; skew-x: 113.3; skew-y: 113.3; scale-x: 0.977; scale-y: 0.977; }
        frame 89 { x: 89.1; y: -2.4; skew-x: 91.3; skew-y: 91.3; scale-x: 0.98; scale-y: 0.98; }
        frame 90 { x: 82.8; y: -2.7; skew-x: 74; skew-y: 74; scale-x: 0.979; scale-y: 0.979; }
        frame 91 { x: 76.3; y: -2.3; skew-x: 56.6; skew-y: 56.6; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 68.7; y: 0.3; skew-x: 65.4; skew-y: 65.4; scale-x: 0.976; scale-y: 0.976; }
        frame 93 { x: 61.1; y: 3.1; skew-x: 73.9; skew-y: 73.9; scale-x: 0.975; scale-y: 0.975; }
        frame 94 { x: 56.1; y: 12.7; skew-x: 75.4; skew-y: 75.4; scale-x: 0.973; scale-y: 0.973; }
        frame 95 { x: 51; y: 22.3; skew-x: 76.7; skew-y: 76.7; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 46.3; y: 36.8; skew-x: 68.2; skew-y: 68.2; scale-x: 0.971; scale-y: 0.971; }
        frame 97 { x: 41.6; y: 51.5; skew-x: 59.6; skew-y: 59.6; scale-x: 0.972; scale-y: 0.972; }
        frame 98 { x: 37.4; y: 61.4; skew-x: 40.1; skew-y: 40.1; scale-x: 0.969; scale-y: 0.969; }
        frame 99 { x: 33.4; y: 72.1; skew-x: 20.8; skew-y: 20.8; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 30; y: 83.6; skew-x: 1.3; skew-y: 1.3; }
        frame 101 { x: 27.4; y: 95.8; skew-x: -17.8; skew-y: -17.8; }
        frame 102 { x: 28.4; y: 92; skew-x: -28.5; skew-y: -28.5; scale-x: 0.967; scale-y: 0.967; }
        frame 103 { x: 29.6; y: 88.2; skew-x: -39.3; skew-y: -39.3; scale-x: 0.968; scale-y: 0.968; }
    }
    Track {
        source-name: "Zombie_imp_innerarm_lower";
        frame-count: 104;
        frame 0 { x: 25.4; y: 95.2; skew-x: 334.3; skew-y: 334.3; scale-x: 0.848; scale-y: 0.907; image: IMAGE_REANIM_ZOMBIE_IMP_ARM2; }
        frame 1 { x: 25.2; y: 92.5; skew-x: 342.4; skew-y: 342.4; scale-x: 0.846; scale-y: 0.906; image: none; }
        frame 2 { x: 25.1; y: 89.7; skew-x: 350.2; skew-y: 350.2; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 25.3; y: 87.2; skew-x: 358.2; skew-y: 358.2; }
        frame 4 { x: 24; y: 89.6; skew-x: 354.7; skew-y: 354.7; scale-y: 0.905; }
        frame 5 { x: 22.6; y: 92.2; skew-x: 351.2; skew-y: 351.2; scale-y: -10000; }
        frame 6 { x: 21.3; y: 94.7; skew-x: 347.6; skew-y: 347.6; scale-x: 0.847; scale-y: 0.906; }
        frame 7 { x: 22.9; y: 100.2; skew-x: 330.2; skew-y: 330.2; scale-x: 0.845; scale-y: 0.904; }
        frame 8 { x: 25.2; y: 105.8; skew-x: 312.6; skew-y: 312.6; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 28.4; y: 111.3; skew-x: 295.2; skew-y: 295.2; scale-x: 0.846; scale-y: 0.906; }
        frame 10 { x: 29.6; y: 111.2; skew-x: 288.3; skew-y: 288.3; scale-x: 0.845; scale-y: 0.904; }
        frame 11 { x: 30.9; y: 111; skew-x: 281.7; skew-y: 281.7; scale-x: 0.844; scale-y: -10000; }
        frame 12 { x: 26; y: 104.9; skew-x: 308.1; skew-y: 308.1; scale-x: 0.845; }
        frame 13 { x: 22.7; y: 98.2; skew-x: 334.3; skew-y: 334.3; scale-x: 0.848; scale-y: 0.907; }
        frame 14 { x: 23.3; y: 94.5; skew-x: 342.4; skew-y: 342.4; scale-x: 0.846; scale-y: 0.906; }
        frame 15 { x: 24.1; y: 90.8; skew-x: 350.2; skew-y: 350.2; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 25.3; y: 87.2; skew-x: 358.2; skew-y: 358.2; }
        frame 17 { x: 24.9; y: 87.8; skew-x: 355.7; skew-y: 355.7; scale-y: 0.905; }
        frame 18 { x: 24.6; y: 88.5; skew-x: 353.2; skew-y: 353.2; scale-y: -10000; }
        frame 19 { x: 24.1; y: 89.2; skew-x: 350.6; skew-y: 350.6; scale-y: 0.906; }
        frame 20 { x: 24.8; y: 94.6; skew-x: 334.7; skew-y: 334.7; scale-x: 0.845; scale-y: 0.904; }
        frame 21 { x: 26; y: 100.1; skew-x: 318.9; skew-y: 318.9; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 27.9; y: 105.6; skew-x: 303; skew-y: 303; scale-x: 0.846; scale-y: 0.905; }
        frame 23 { x: 29; y: 107.8; skew-x: 295.1; skew-y: 295.1; scale-x: 0.864; scale-y: 0.904; }
        frame 24 { x: 30.2; y: 109.8; skew-x: 287.3; skew-y: 287.3; scale-x: 0.884; scale-y: -10000; }
        frame 25 { x: 31.8; y: 111.6; skew-x: 279.5; skew-y: 279.5; scale-x: 0.904; }
        frame 26 { x: 32.6; y: 111; skew-x: 277.3; skew-y: 277.3; scale-x: 0.893; scale-y: 0.903; }
        frame 27 { x: 33.4; y: 110.5; skew-x: 275.3; skew-y: 275.3; scale-x: 0.883; scale-y: 0.902; }
        frame 28 { x: 29.9; y: 106.2; skew-x: 294.8; skew-y: 294.8; scale-x: 0.863; scale-y: -10000; }
        frame 29 { x: 27; y: 101.4; skew-x: 314.6; skew-y: 314.6; scale-x: 0.845; scale-y: 0.905; }
        frame 30 { x: 26.4; y: 99.3; skew-x: 321.2; skew-y: 321.2; scale-x: -10000; scale-y: 0.904; }
        frame 31 { x: 25.9; y: 97.3; skew-x: 327.9; skew-y: 327.9; scale-x: 0.846; scale-y: 0.905; }
        frame 32 { x: 25.4; y: 95.2; skew-x: 334.3; skew-y: 334.3; scale-x: 0.848; scale-y: 0.907; }
        frame 33 { x: -10000; y: 95.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 25.5; y: 94.5; skew-x: 336; skew-y: 336; scale-x: 0.846; scale-y: 0.906; }
        frame 35 { x: 25.6; y: 93.8; skew-x: 337.7; skew-y: 337.7; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 25.7; y: 92.9; skew-x: 339.2; skew-y: 339.2; }
        frame 37 { x: -10000; y: 92.1; skew-x: 340.8; skew-y: 340.8; scale-x: 0.847; scale-y: 0.907; }
        frame 38 { x: 25.8; y: 91.4; skew-x: 341.9; skew-y: 341.9; scale-x: 0.846; scale-y: 0.906; }
        frame 39 { x: -10000; y: 90.7; skew-x: 343; skew-y: 343; scale-x: -10000; scale-y: -10000; }
        frame 40 { y: 89.9; skew-x: 344; skew-y: 344; }
        frame 41 { y: 89.3; skew-x: 344.9; skew-y: 344.9; scale-x: 0.847; }
        frame 42 { x: 25.3; y: 94.5; skew-x: 336.7; skew-y: 336.7; scale-x: 0.846; scale-y: 0.905; }
        frame 43 { x: 24.9; y: 99.7; skew-x: 328.4; skew-y: 328.4; scale-x: 0.845; scale-y: 0.904; }
        frame 44 { x: 24.6; y: 104.8; skew-x: 320.1; skew-y: 320.1; scale-x: 0.846; scale-y: 0.905; }
        frame 45 { x: 24; y: 99.2; skew-x: 334.4; skew-y: 334.4; scale-x: 0.845; scale-y: 0.904; }
        frame 46 { y: 93.6; skew-x: 348.7; skew-y: 348.7; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 24.4; y: 88.3; skew-x: 362.8; skew-y: 362.8; scale-y: 0.905; }
        frame 48 { x: 25.5; y: 83.1; skew-x: 377.2; skew-y: 377.2; scale-x: 0.846; scale-y: -10000; }
        frame 49 { x: 28.1; y: 78.9; skew-x: 394.9; skew-y: 394.9; scale-x: 0.843; scale-y: 0.903; }
        frame 50 { x: 31; y: 75.4; skew-x: 412.7; skew-y: 412.7; scale-x: -10000; scale-y: 0.902; }
        frame 51 { x: 33.8; y: 72.9; skew-x: 430.5; skew-y: 430.5; scale-x: 0.842; scale-y: 0.901; }
        frame 52 { x: 36.1; y: 71; skew-x: 448.2; skew-y: 448.2; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 33.9; y: 75.3; skew-x: 445.7; skew-y: 445.7; }
        frame 54 { x: 31.6; y: 79.7; skew-x: 443.2; skew-y: 443.2; }
        frame 55 { x: 29.5; y: 83.8; skew-x: 440.7; skew-y: 440.7; }
        frame 56 { x: 27.6; y: 84.3; skew-x: 414.1; skew-y: 414.1; }
        frame 57 { x: 25.7; y: 86.6; skew-x: 387.5; skew-y: 387.5; scale-x: 0.844; scale-y: 0.903; }
        frame 58 { x: 24.7; y: 90.6; skew-x: 360.8; skew-y: 360.8; scale-x: 0.846; scale-y: 0.906; }
        frame 59 { x: 25.4; y: 95.4; skew-x: 334.3; skew-y: 334.3; scale-x: 0.848; scale-y: 0.907; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 26.4; y: 97.2; skew-x: 332.4; skew-y: 332.4; scale-x: 0.846; scale-y: 0.905; }
        frame 62 { x: 27.4; y: 98.9; skew-x: 330.7; skew-y: 330.7; scale-x: 0.845; scale-y: -10000; }
        frame 63 { x: 28.3; y: 100.7; skew-x: 328.7; skew-y: 328.7; scale-x: -10000; scale-y: 0.904; }
        frame 64 { x: 29.3; y: 102.4; skew-x: 326.9; skew-y: 326.9; scale-x: 0.844; scale-y: 0.903; }
        frame 65 { x: 30.4; y: 104.2; skew-x: 324.9; skew-y: 324.9; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 31.3; y: 105.9; skew-x: 323.1; skew-y: 323.1; scale-x: 0.845; scale-y: 0.904; }
        frame 67 { x: 33.8; y: 102.6; skew-x: 333.7; skew-y: 333.7; scale-x: 0.843; scale-y: 0.902; }
        frame 68 { x: 36.7; y: 99.4; skew-x: 344; skew-y: 344; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 39.9; y: 96.3; skew-x: 354.5; skew-y: 354.5; }
        frame 70 { x: 43.3; y: 93.3; skew-x: 364.8; skew-y: 364.8; }
        frame 71 { x: 45.5; y: 99.7; skew-x: 344.7; skew-y: 344.7; scale-x: 0.841; scale-y: 0.9; }
        frame 72 { x: 48.8; y: 106.4; skew-x: 324.7; skew-y: 324.7; scale-x: 0.84; scale-y: 0.899; }
        frame 73 { x: 53.1; y: 113.2; skew-x: 304.6; skew-y: 304.6; scale-x: 0.841; scale-y: 0.9; }
        frame 74 { x: 52.3; y: 113.7; skew-x: 306.8; skew-y: 302.3; scale-x: 0.826; scale-y: 0.91; }
        frame 75 { x: 51.4; y: 114.3; skew-x: 309.1; skew-y: 300.3; scale-x: 0.813; scale-y: 0.922; }
        frame 76 { x: 52.3; y: 113.8; skew-x: 306.8; skew-y: 302.3; scale-x: 0.826; scale-y: 0.91; }
        frame 77 { x: 53.1; y: 113.2; skew-x: 304.6; skew-y: 304.6; scale-x: 0.841; scale-y: 0.9; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.839; scale-y: 0.898; }
        frame 79 { scale-x: 0.841; scale-y: 0.9; }
        frame 80 { x: 53; y: 113.5; skew-x: 305.9; skew-y: 305.9; scale-x: 0.839; scale-y: 0.898; }
        frame 81 { x: 52.9; y: 113.8; skew-x: 307.4; skew-y: 307.4; scale-x: 0.841; scale-y: 0.899; }
        frame 82 { x: 102.5; y: 37.8; skew-x: 201.5; skew-y: 201.5; scale-x: 0.867; scale-y: 0.981; }
        frame 83 { x: 96.2; y: 40.9; skew-x: 236.1; skew-y: 236.1; scale-x: 0.864; scale-y: 0.978; }
        frame 84 { x: 90.3; y: 40.8; skew-x: 270.5; skew-y: 270.5; scale-x: -10000; scale-y: 0.977; }
        frame 85 { x: 86.3; y: 38.1; skew-x: 305.1; skew-y: 305.1; scale-x: 0.862; scale-y: 0.976; }
        frame 86 { x: 93.5; y: 33.8; skew-x: 275.3; skew-y: 275.3; scale-x: 0.861; scale-y: 0.974; }
        frame 87 { x: 102.6; y: 27.6; skew-x: 245.9; skew-y: 245.9; scale-x: 0.86; scale-y: 0.973; }
        frame 88 { x: 98.7; y: 15.1; skew-x: 200.8; skew-y: 200.8; scale-x: 0.859; scale-y: 0.972; }
        frame 89 { x: 92; y: -1.7; skew-x: 155.8; skew-y: 155.8; scale-x: 0.86; scale-y: 0.973; }
        frame 90 { x: 85.9; y: -2.6; skew-x: 138.6; skew-y: 138.6; scale-x: 0.858; scale-y: 0.97; }
        frame 91 { x: 79; y: -3.5; skew-x: 121.2; skew-y: 121.2; scale-x: -10000; scale-y: 0.971; }
        frame 92 { x: 69.8; y: -3; skew-x: 110.1; skew-y: 110.1; scale-x: 0.857; scale-y: 0.97; }
        frame 93 { x: 60.3; y: -2.3; skew-x: 99.2; skew-y: 99.1; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 55.5; y: 6.8; skew-x: 101.3; skew-y: 101.3; scale-x: 0.856; scale-y: 0.968; }
        frame 95 { x: 50.7; y: 16.1; skew-x: 103.8; skew-y: 103.8; scale-x: 0.855; scale-y: -10000; }
        frame 96 { x: 45.2; y: 30.5; skew-x: 96.3; skew-y: 96.3; scale-x: 0.854; scale-y: 0.967; }
        frame 97 { x: 39.6; y: 45.1; skew-x: 88.8; skew-y: 88.8; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 37.1; y: 56.1; skew-x: 81.7; skew-y: 81.7; scale-x: 0.853; scale-y: 0.965; }
        frame 99 { x: 34.6; y: 67.3; skew-x: 74.5; skew-y: 74.5; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 32.1; y: 78.8; skew-x: 67.2; skew-y: 67.2; scale-x: 0.852; scale-y: 0.964; }
        frame 101 { x: 29.5; y: 90.2; skew-x: 60; skew-y: 60; scale-x: -10000; scale-y: 0.965; }
        frame 102 { x: 26.1; y: -10000; skew-x: 18.5; skew-y: 18.5; scale-x: 0.851; scale-y: 0.963; }
        frame 103 { x: 25; y: 93.8; skew-x: -22.7; skew-y: -22.7; scale-x: -10000; scale-y: 0.962; }
    }
    Track {
        source-name: "Zombie_imp_innerleg_foot";
        frame-count: 104;
        frame 0 { x: 45.1; y: 114; skew-x: 358.9; skew-y: 358.9; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZOMBIE_IMP_INNERLEG_FOOT; }
        frame 1 { x: 47.7; y: 114.1; skew-x: 351.9; skew-y: 351.9; scale-x: 0.998; scale-y: 0.998; image: none; }
        frame 2 { x: 50.5; y: 114.3; skew-x: 344.7; skew-y: 344.7; scale-x: 0.997; scale-y: 0.997; }
        frame 3 { x: 53.1; y: 114.7; skew-x: 337.4; skew-y: 337.4; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 54.1; y: 116.9; skew-x: 325.9; skew-y: 325.9; scale-x: 0.995; scale-y: 0.995; }
        frame 5 { x: 55.3; y: 119.1; skew-x: 314.1; skew-y: 314.1; scale-x: 0.994; scale-y: 0.994; }
        frame 6 { x: 56.8; y: 121.4; skew-x: 302.5; skew-y: 302.5; scale-x: 0.995; scale-y: 0.995; }
        frame 7 { x: 59.8; y: 123.1; skew-x: 289; skew-y: 289; scale-x: 0.994; scale-y: 0.994; }
        frame 8 { x: 63.1; y: 124.7; skew-x: 275.5; skew-y: 275.5; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 66.8; y: 125.8; skew-x: 262.1; skew-y: 262.1; scale-x: 0.993; scale-y: 0.993; }
        frame 10 { x: 65.5; y: 125.7; skew-x: 262.2; skew-y: 262.2; scale-x: 0.992; scale-y: 0.992; }
        frame 11 { x: 64.1; y: 125.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 62.7; y: 125.4; skew-x: 262.4; skew-y: 262.4; }
        frame 13 { x: 61.5; y: 125.3; skew-x: -10000; skew-y: -10000; }
        frame 14 { x: 59; y: 125; skew-x: 263; skew-y: 263; scale-x: 0.991; scale-y: 0.991; }
        frame 15 { x: 56.3; y: 124.8; skew-x: 263.7; skew-y: 263.7; scale-x: 0.99; scale-y: 0.99; }
        frame 16 { x: 53.8; y: 124.4; skew-x: 264.1; skew-y: 264.1; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 47.6; y: 120.6; skew-x: 300.1; skew-y: 300.1; scale-x: 0.987; scale-y: 0.987; }
        frame 18 { x: 44.4; y: 115.6; skew-x: 336.4; skew-y: 336.4; scale-x: 0.985; scale-y: 0.985; }
        frame 19 { x: 43.9; y: 111.6; skew-x: 372.5; skew-y: 372.5; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 42.8; y: 111.1; skew-x: 383.3; skew-y: 383.3; scale-x: 0.981; scale-y: 0.981; }
        frame 21 { x: 41.7; y: 110.9; skew-x: 394.4; skew-y: 394.4; scale-x: 0.979; scale-y: 0.979; }
        frame 22 { x: 40.6; y: 110.8; skew-x: 405.4; skew-y: 405.4; scale-x: 0.978; scale-y: 0.978; }
        frame 23 { x: 39.6; y: 111.8; skew-x: 389.3; skew-y: 389.3; scale-x: 0.976; scale-y: 0.976; }
        frame 24 { x: 38.9; y: 113.5; skew-x: 373.1; skew-y: 373.1; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 38.7; y: 115.5; skew-x: 357; skew-y: 357; }
        frame 26 { x: 40; y: 115.1; skew-x: 358; skew-y: 358; scale-x: 0.98; scale-y: 0.98; }
        frame 27 { x: 41.2; y: 114.8; skew-x: 359; skew-y: 359; scale-x: 0.984; scale-y: 0.984; }
        frame 28 { x: 42.4; y: 114.4; skew-x: 360; skew-y: 360; scale-x: 0.988; scale-y: 0.988; }
        frame 29 { x: 43.7; y: 114.1; skew-x: 360.8; skew-y: 360.8; scale-x: 0.991; scale-y: 0.991; }
        frame 30 { x: 44; y: -10000; skew-x: 360; skew-y: 360; scale-x: 0.994; scale-y: 0.994; }
        frame 31 { x: 44.5; y: 114; skew-x: 359.7; skew-y: 359.7; scale-x: 0.996; scale-y: 0.996; }
        frame 32 { x: 45.1; y: -10000; skew-x: 358.9; skew-y: 358.9; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: 41.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: -10000; skew-x: 359; skew-y: 359; scale-x: 0.998; scale-y: 0.998; }
        frame 35 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { skew-x: 358.9; skew-y: 358.9; scale-x: 0.999; scale-y: 0.999; }
        frame 38 { x: 41.6; y: 114.1; skew-x: 357.2; skew-y: 357.2; scale-x: 0.998; scale-y: 0.998; }
        frame 39 { x: -10000; y: 114.2; skew-x: 355.2; skew-y: 355.2; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 41.4; y: 114.4; skew-x: 353.2; skew-y: 353.2; }
        frame 41 { x: 41.1; y: 114.5; skew-x: 351.2; skew-y: 351.2; }
        frame 42 { x: 41.4; y: 114.4; skew-x: 353.9; skew-y: 353.9; }
        frame 43 { x: 41.6; y: 114.2; skew-x: 356.5; skew-y: 356.5; }
        frame 44 { x: 41.8; y: 114; skew-x: 358.9; skew-y: 358.9; scale-x: 0.999; scale-y: 0.999; }
        frame 45 { x: -10000; y: -10000; skew-x: 359; skew-y: 359; scale-x: 0.998; scale-y: 0.998; }
        frame 46 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { skew-x: 358.9; skew-y: 358.9; scale-x: 0.999; scale-y: 0.999; }
        frame 49 { x: 41.6; y: 114.1; skew-x: 357.2; skew-y: 357.2; scale-x: 0.998; scale-y: 0.998; }
        frame 50 { x: -10000; y: 114.2; skew-x: 355.2; skew-y: 355.2; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 41.4; y: 114.4; skew-x: 353.2; skew-y: 353.2; }
        frame 52 { x: 41.1; y: 114.5; skew-x: 351.2; skew-y: 351.2; }
        frame 53 { x: 41.4; y: 114.4; skew-x: 353.9; skew-y: 353.9; }
        frame 54 { x: 41.6; y: 114.2; skew-x: 356.5; skew-y: 356.5; }
        frame 55 { x: 41.8; y: 114; skew-x: 358.9; skew-y: 358.9; scale-x: 0.999; scale-y: 0.999; }
        frame 56 { x: -10000; y: -10000; skew-x: 359; skew-y: 359; scale-x: 0.998; scale-y: 0.998; }
        frame 57 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { skew-x: 358.9; skew-y: 358.9; scale-x: 0.999; scale-y: 0.999; }
        frame 60 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { skew-x: 359; skew-y: 359; scale-x: 0.998; scale-y: 0.998; }
        frame 62 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 66 { skew-x: 358.9; skew-y: 358.9; scale-x: 0.999; scale-y: 0.999; }
        frame 67 { x: 43.2; y: 112.5; skew-x: 370.3; skew-y: 370.3; scale-x: 0.998; scale-y: 0.998; }
        frame 68 { x: 44.8; y: 111.3; skew-x: 381.6; skew-y: 381.6; scale-x: 0.997; scale-y: 0.997; }
        frame 69 { x: 46.6; y: 110.3; skew-x: 392.9; skew-y: 392.9; scale-x: 0.996; scale-y: 0.996; }
        frame 70 { x: 48.4; y: 109.6; skew-x: 404.3; skew-y: 404.3; scale-x: 0.997; scale-y: 0.997; }
        frame 71 { x: 51.4; y: 107.2; skew-x: 426.4; skew-y: 426.4; scale-x: 0.995; scale-y: 0.995; }
        frame 72 { x: 54.1; y: 105.9; skew-x: 448.5; skew-y: 448.5; scale-x: 0.994; scale-y: 0.994; }
        frame 73 { x: 56; y: 105.5; skew-x: 470.5; skew-y: 470.5; scale-x: 0.993; scale-y: 0.993; }
        frame 74 { x: -10000; y: 106.4; skew-x: 472.1; skew-y: 469; scale-x: 0.959; scale-y: 1.02; }
        frame 75 { x: 56.1; y: 107.3; skew-x: 473.8; skew-y: 467.6; scale-x: 0.927; scale-y: 1.05; }
        frame 76 { x: 53.1; y: 108.6; skew-x: 455.3; skew-y: 452.3; scale-x: 0.958; scale-y: 1.02; }
        frame 77 { x: 49.6; y: 110.6; skew-x: 437.2; skew-y: 437.2; scale-x: 0.99; scale-y: 0.99; }
        frame 78 { x: 49; y: 110; skew-x: 426.9; skew-y: 426.9; scale-x: 0.988; scale-y: 0.988; }
        frame 79 { x: 48.1; y: 109.6; skew-x: 416.6; skew-y: 416.6; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 48.4; y: 110.2; skew-x: 428.4; skew-y: 428.4; }
        frame 81 { x: 48.7; y: 111; skew-x: 440; skew-y: 440; scale-x: 0.99; scale-y: 0.99; }
        frame 82 { x: 115.5; y: 32.6; skew-x: 273.1; skew-y: 273.1; scale-x: 0.996; scale-y: 0.996; }
        frame 83 { x: 113.3; y: 32.3; skew-x: 264.2; skew-y: 264.2; scale-x: 0.993; scale-y: 0.993; }
        frame 84 { x: 111.4; y: 31.8; skew-x: 255.4; skew-y: 255.4; scale-x: 0.99; scale-y: 0.99; }
        frame 85 { x: 109.4; y: 31.1; skew-x: 246.3; skew-y: 246.3; scale-x: 0.989; scale-y: 0.989; }
        frame 86 { x: 115.4; y: 11.8; skew-x: 207.3; skew-y: 207.3; scale-x: 0.985; scale-y: 0.985; }
        frame 87 { x: 108.3; y: 4.2; skew-x: 187.1; skew-y: 187.1; scale-x: 0.986; scale-y: 0.986; }
        frame 88 { x: 79.1; y: -12; skew-x: 132.4; skew-y: 132.4; scale-x: 0.982; scale-y: 0.982; }
        frame 89 { x: 68.6; y: -7.4; skew-x: 97.1; skew-y: 97.1; scale-x: 0.986; scale-y: 0.986; }
        frame 90 { x: 58.2; y: 4.5; skew-x: 72.7; skew-y: 72.7; scale-x: 0.982; scale-y: 0.982; }
        frame 91 { x: 47.4; y: 17.7; skew-x: 48; skew-y: 48; scale-x: 0.981; scale-y: 0.981; }
        frame 92 { x: 43.5; y: 28.9; skew-x: 34.6; skew-y: 34.6; scale-x: 0.978; scale-y: 0.978; }
        frame 93 { x: 39.8; y: 40.5; skew-x: 21.2; skew-y: 21.2; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 37.2; y: 51.1; skew-x: 21.3; skew-y: 21.3; scale-x: 0.975; scale-y: 0.975; }
        frame 95 { x: 34.4; y: 61.6; skew-x: 21.4; skew-y: 21.4; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 39.2; y: 78.4; skew-x: 11.6; skew-y: 11.6; scale-x: 0.974; scale-y: 0.974; }
        frame 97 { x: 44.1; y: 95.1; skew-x: 2.1; skew-y: 2.1; scale-x: 0.975; scale-y: 0.975; }
        frame 98 { x: 43.9; y: 102.6; skew-x: 2; skew-y: 2; scale-x: 0.974; scale-y: 0.974; }
        frame 99 { x: 43.5; y: 110.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 43.3; y: 110.8; }
        frame 101 { x: 43; y: 111.3; skew-x: 2.1; skew-y: 2.1; scale-x: 0.975; scale-y: 0.975; }
        frame 102 { x: 42.5; y: 112.4; skew-x: 2; skew-y: 2; scale-x: 0.974; scale-y: 0.974; }
        frame 103 { x: 41.8; y: 113.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_imp_innerleg_lower";
        frame-count: 104;
        frame 0 { x: 47.4; y: 111.2; skew-x: 358.9; skew-y: 358.9; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZOMBIE_IMP_INNERLEG_LOWER; }
        frame 1 { x: 49.6; y: 111.1; skew-x: 351.9; skew-y: 351.9; scale-x: 0.998; scale-y: 0.998; image: none; }
        frame 2 { x: 51.9; y: 111.2; skew-x: 344.7; skew-y: 344.7; scale-x: 0.997; scale-y: 0.997; }
        frame 3 { x: 54.3; y: 111.3; skew-x: 337.4; skew-y: 337.4; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 54.5; y: 113.4; skew-x: 325.9; skew-y: 325.9; scale-x: 0.995; scale-y: 0.995; }
        frame 5 { x: 55; y: 115.6; skew-x: 314.1; skew-y: 314.1; scale-x: 0.994; scale-y: 0.994; }
        frame 6 { x: 55.7; y: 117.8; skew-x: 302.5; skew-y: 302.5; scale-x: 0.995; scale-y: 0.995; }
        frame 7 { x: 57; y: 119.1; skew-x: 293.1; skew-y: 293.1; scale-x: 0.994; scale-y: 1.045; }
        frame 8 { x: 58.5; y: 120.5; skew-x: 283.8; skew-y: 283.8; scale-x: 0.993; scale-y: 1.096; }
        frame 9 { x: 60; y: 121.7; skew-x: 274.4; skew-y: 274.4; scale-x: 0.994; scale-y: 1.147; }
        frame 10 { x: 59.1; y: -10000; skew-x: 273.8; skew-y: 273.8; scale-x: 0.993; scale-y: 1.108; }
        frame 11 { x: 58.4; y: 121.8; skew-x: 273; skew-y: 273; scale-x: -10000; scale-y: 1.07; }
        frame 12 { x: 57.5; y: -10000; skew-x: 272.3; skew-y: 272.3; scale-y: 1.031; }
        frame 13 { x: 56.7; y: 122; skew-x: 271.7; skew-y: 271.7; scale-y: 0.993; }
        frame 14 { x: 54.2; y: 121.7; skew-x: 272.3; skew-y: 272.3; scale-x: 0.992; scale-y: 0.992; }
        frame 15 { x: 51.6; y: 121.3; skew-x: 272.8; skew-y: 272.8; scale-x: 0.991; scale-y: 0.991; }
        frame 16 { x: 49.1; y: 121.1; skew-x: 273.4; skew-y: 273.4; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 46; y: 118.1; skew-x: 297.1; skew-y: 297.1; scale-x: 0.988; scale-y: 0.988; }
        frame 18 { x: 44; y: 114.7; skew-x: 320.9; skew-y: 320.9; scale-x: 0.987; scale-y: 0.987; }
        frame 19 { x: 43.1; y: 111.3; skew-x: 344.6; skew-y: 344.6; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 42.5; y: 110.1; skew-x: 359.7; skew-y: 359.7; scale-x: 0.985; scale-y: 0.985; }
        frame 21 { x: 42.1; y: 109.2; skew-x: 374.8; skew-y: 374.8; scale-x: 0.983; scale-y: 0.983; }
        frame 22 { x: -10000; y: 108.9; skew-x: 389.8; skew-y: 389.8; scale-x: 0.982; scale-y: 0.982; }
        frame 23 { x: 40.4; y: 109.6; skew-x: 372.3; skew-y: 372.3; scale-x: 0.98; scale-y: 1.095; }
        frame 24 { x: 38.6; y: 110.8; skew-x: 355; skew-y: 355; scale-x: 0.979; scale-y: 1.209; }
        frame 25 { x: 37; y: 112.8; skew-x: 337.5; skew-y: 337.5; scale-x: 0.978; scale-y: 1.323; }
        frame 26 { x: 38.8; y: 112.7; skew-x: 339.7; skew-y: 339.7; scale-x: 0.98; scale-y: 1.268; }
        frame 27 { x: 40.5; y: 112.6; skew-x: 342; skew-y: 342; scale-x: 0.984; scale-y: 1.214; }
        frame 28 { x: 42.1; y: 112.5; skew-x: 344.2; skew-y: 344.2; scale-x: 0.987; scale-y: 1.16; }
        frame 29 { x: 43.8; y: 112.3; skew-x: 346.5; skew-y: 346.5; scale-x: 0.991; scale-y: 1.106; }
        frame 30 { x: 45; y: 112; skew-x: 350.7; skew-y: 350.7; scale-x: 0.993; scale-y: 1.07; }
        frame 31 { x: 46.1; y: 111.6; skew-x: 354.9; skew-y: 354.9; scale-x: 0.996; scale-y: 1.034; }
        frame 32 { x: 47.4; y: 111.2; skew-x: 358.9; skew-y: 358.9; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: 44.4; y: -10000; skew-x: 358.2; skew-y: 358.2; scale-x: 0.998; scale-y: 0.998; }
        frame 34 { x: 44.1; skew-x: 356.7; skew-y: 356.7; scale-x: -10000; scale-y: 1.026; }
        frame 35 { x: 44; skew-x: 355.2; skew-y: 355.2; scale-y: 1.053; }
        frame 36 { x: 43.6; y: 111.1; skew-x: 353.7; skew-y: 353.7; scale-y: 1.08; }
        frame 37 { x: 43.4; y: -10000; skew-x: 352.1; skew-y: 352.1; scale-y: 1.108; }
        frame 38 { x: 43.6; y: 110.7; skew-x: 355.2; skew-y: 355.2; scale-y: 1.08; }
        frame 39 { x: 44; y: 110.3; skew-x: 358.2; skew-y: 358.2; scale-y: 1.053; }
        frame 40 { x: 44.3; y: 109.9; skew-x: 361; skew-y: 361; scale-y: 1.026; }
        frame 41 { x: 44.6; y: 109.4; skew-x: 364; skew-y: 364; scale-y: 0.998; }
        frame 42 { x: 44; y: 110.5; skew-x: 358.7; skew-y: 358.7; scale-y: -10000; }
        frame 43 { x: 43.4; y: 111.7; skew-x: 353.2; skew-y: 353.2; }
        frame 44 { x: 43; y: 113; skew-x: 347.7; skew-y: 347.7; }
        frame 45 { x: 43.3; y: 112.5; skew-x: 350.4; skew-y: 350.4; }
        frame 46 { x: 43.7; y: 112.1; skew-x: 353; skew-y: 353; }
        frame 47 { x: 44.1; y: 111.6; skew-x: 355.7; skew-y: 355.7; }
        frame 48 { x: 44.4; y: 111.2; skew-x: 358.2; skew-y: 358.2; }
        frame 49 { x: -10000; y: 110.8; skew-x: 359.7; skew-y: 359.7; }
        frame 50 { x: 44.5; y: 110.4; skew-x: 361; skew-y: 361; }
        frame 51 { x: 44.6; y: 110; skew-x: 362.5; skew-y: 362.5; }
        frame 52 { x: -10000; y: 109.4; skew-x: 364; skew-y: 364; }
        frame 53 { x: 44; y: 110.5; skew-x: 358.7; skew-y: 358.7; }
        frame 54 { x: 43.4; y: 111.7; skew-x: 353.2; skew-y: 353.2; }
        frame 55 { x: 43; y: 113; skew-x: 347.7; skew-y: 347.7; }
        frame 56 { x: 43.3; y: 112.3; skew-x: 350.4; skew-y: 350.4; scale-x: 0.997; scale-y: 1.017; }
        frame 57 { x: 43.6; y: 111.6; skew-x: 353; skew-y: 353; scale-x: 0.998; scale-y: 1.037; }
        frame 58 { x: 44.1; y: 110.9; skew-x: 355.7; skew-y: 355.7; scale-x: -10000; scale-y: 1.057; }
        frame 59 { x: 44.4; y: 110.2; skew-x: 358.2; skew-y: 358.2; scale-y: 1.078; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 61 { y: 110.4; scale-y: 1.064; }
        frame 62 { y: 110.6; scale-y: 1.051; }
        frame 63 { y: 110.7; scale-y: 1.038; }
        frame 64 { y: 110.8; scale-y: 1.025; }
        frame 65 { y: 111; scale-y: 1.012; }
        frame 66 { y: 111.2; scale-y: 0.998; }
        frame 67 { x: 45.3; y: 110.1; skew-x: 361.8; skew-y: 361.8; scale-y: 1.047; }
        frame 68 { x: 46.2; y: 109.1; skew-x: 365.5; skew-y: 365.5; scale-x: 0.997; scale-y: 1.096; }
        frame 69 { x: 47.1; y: 108; skew-x: 369.3; skew-y: 369.3; scale-x: 0.996; scale-y: 1.145; }
        frame 70 { x: 48.1; y: 106.9; skew-x: 373; skew-y: 373; scale-x: -10000; scale-y: 1.195; }
        frame 71 { x: 51.3; y: 105.2; skew-x: 398.1; skew-y: 398.1; scale-x: 0.993; scale-y: 1.125; }
        frame 72 { x: 54.4; y: 104.7; skew-x: 423.4; skew-y: 423.4; scale-x: 0.992; scale-y: 1.058; }
        frame 73 { x: 56.8; y: 105.3; skew-x: 448.5; skew-y: 448.5; scale-x: -10000; scale-y: 0.992; }
        frame 74 { x: 56.3; y: 105.9; skew-x: 442.2; skew-y: 445.2; scale-x: 0.957; scale-y: 1.021; }
        frame 75 { x: 55.8; y: 106.3; skew-x: 435.9; skew-y: 441.8; scale-x: 0.924; scale-y: 1.05; }
        frame 76 { x: 54.2; y: 108; skew-x: 428.5; skew-y: 431.5; scale-x: 0.956; scale-y: 1.019; }
        frame 77 { x: 52.5; y: 109.8; skew-x: 421; skew-y: 421; scale-x: 0.99; scale-y: 0.99; }
        frame 78 { x: 52.4; y: 108.9; skew-x: 414.4; skew-y: 414.4; scale-x: 0.988; scale-y: 0.988; }
        frame 79 { x: 52.2; y: 107.9; skew-x: 407.7; skew-y: 407.7; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 51.8; y: 109.3; skew-x: 415.7; skew-y: 415.7; }
        frame 81 { x: 51.4; y: 110.5; skew-x: 423.8; skew-y: 423.8; scale-x: 0.99; scale-y: 0.99; }
        frame 82 { x: 112.7; y: 32.8; skew-x: 251.5; skew-y: 251.5; scale-x: 0.994; scale-y: 0.994; }
        frame 83 { x: 109.6; y: 31.6; skew-x: 254.5; skew-y: 254.5; scale-x: 0.991; scale-y: 0.991; }
        frame 84 { x: 106.5; y: 30.4; skew-x: 257.5; skew-y: 257.5; scale-x: 0.989; scale-y: 0.989; }
        frame 85 { x: 103.5; y: 29.3; skew-x: 260.3; skew-y: 260.3; scale-x: 0.987; scale-y: 0.987; }
        frame 86 { x: 110.1; y: 13.9; skew-x: 221.4; skew-y: 221.4; scale-x: 0.984; scale-y: 0.984; }
        frame 87 { x: 103.8; y: 8.4; skew-x: 201.1; skew-y: 201.1; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 79.8; y: -7.1; skew-x: 146.4; skew-y: 146.4; scale-x: 0.981; scale-y: 0.981; }
        frame 89 { x: 72.8; y: -2.9; skew-x: 111.1; skew-y: 111.1; scale-x: 0.984; scale-y: 0.984; }
        frame 90 { x: 62.1; y: 5.2; skew-x: 71.4; skew-y: 71.4; scale-x: 0.981; scale-y: 0.981; }
        frame 91 { x: 49.8; y: 16.7; skew-x: 31.6; skew-y: 31.6; scale-x: 0.979; scale-y: 0.979; }
        frame 92 { x: 44.6; y: 27.5; skew-x: 12.8; skew-y: 10.5; scale-x: 0.978; scale-y: 1.067; }
        frame 93 { x: 39.1; y: 39.1; skew-x: -6; skew-y: -10.4; scale-x: 0.979; scale-y: 1.156; }
        frame 94 { x: 36.4; y: 49.8; skew-x: -4.7; skew-y: -8.9; scale-x: 0.978; scale-y: 1.154; }
        frame 95 { x: 33.4; y: 60.3; skew-x: -3.4; skew-y: -7.7; scale-x: 0.977; scale-y: -10000; }
        frame 96 { x: 38; y: 77.2; skew-x: -11.9; skew-y: -16.2; scale-x: 0.976; scale-y: 1.152; }
        frame 97 { x: 42.5; y: 94.1; skew-x: -20.6; skew-y: -24.9; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 43.1; y: 99.9; skew-x: -10.7; skew-y: -15; scale-x: 0.974; scale-y: 1.149; }
        frame 99 { x: 44; y: 105.8; skew-x: -0.9; skew-y: -5.3; scale-x: 0.973; scale-y: 1.148; }
        frame 100 { x: 41.9; y: 109.6; skew-x: -19.7; skew-y: -24.2; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 40.6; y: 113.9; skew-x: -38.7; skew-y: -43; scale-x: 0.975; scale-y: 1.151; }
        frame 102 { x: 41; y: 111.2; skew-x: -19.7; skew-y: -24.2; scale-x: 0.973; scale-y: 1.148; }
        frame 103 { x: 42.3; y: 108.9; skew-x: -0.9; skew-y: -5.3; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_imp_innerleg_upper";
        frame-count: 104;
        frame 0 { x: 44; y: 103.1; skew-x: 346.4; skew-y: 346.4; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZOMBIE_IMP_INNERLEG_UPPER; }
        frame 1 { x: 46.2; y: 102.9; skew-x: 345.4; skew-y: 345.4; scale-x: 0.998; scale-y: 0.998; image: none; }
        frame 2 { x: 48.3; y: 102.6; skew-x: 344.2; skew-y: 344.2; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 50.4; y: -10000; skew-x: 342.9; skew-y: 342.9; scale-x: 0.999; scale-y: 0.999; }
        frame 4 { x: 50.6; y: 103.2; skew-x: 343.9; skew-y: 343.9; scale-x: 0.998; scale-y: 0.998; }
        frame 5 { x: 50.9; y: 103.9; skew-x: 344.9; skew-y: 344.9; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 51.1; y: 104.6; skew-x: 345.7; skew-y: 345.7; }
        frame 7 { x: 51.4; y: 106.2; skew-x: 339.7; skew-y: 339.7; scale-x: 0.997; scale-y: 0.997; }
        frame 8 { x: 51.7; y: 108; skew-x: 333.6; skew-y: 333.6; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 52; y: 109.7; skew-x: 327.4; skew-y: 327.4; scale-x: 0.998; scale-y: 0.998; }
        frame 10 { x: 51.5; y: 109.2; skew-x: 329.9; skew-y: 329.9; scale-x: 0.997; scale-y: 0.997; }
        frame 11 { x: 51; y: 108.6; skew-x: 332.4; skew-y: 332.4; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 50.4; y: 108.1; skew-x: 334.9; skew-y: 334.9; scale-x: 0.996; scale-y: 0.996; }
        frame 13 { x: 49.9; y: 107.5; skew-x: 337.4; skew-y: 337.4; scale-x: 0.998; scale-y: 0.998; }
        frame 14 { x: 48.8; y: 106.2; skew-x: 343.7; skew-y: 343.7; scale-x: 0.996; scale-y: 0.996; }
        frame 15 { x: 47.6; y: 105.1; skew-x: 350; skew-y: 350; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 46.5; y: 103.9; skew-x: 356.3; skew-y: 356.3; scale-x: 0.997; scale-y: 0.997; }
        frame 17 { x: 46.9; y: 102; skew-x: 366.5; skew-y: 366.5; scale-x: 0.996; scale-y: 0.996; }
        frame 18 { x: 47.5; y: 100.3; skew-x: 377; skew-y: 377; scale-x: 0.994; scale-y: 0.994; }
        frame 19 { x: 48.1; y: 98.8; skew-x: 387.4; skew-y: 387.4; scale-x: 0.995; scale-y: 0.995; }
        frame 20 { x: -10000; y: 99.2; skew-x: 391.1; skew-y: 391.1; scale-x: 0.992; scale-y: 0.992; }
        frame 21 { x: 48.2; y: 99.5; skew-x: 395.1; skew-y: 395.1; scale-x: 0.991; scale-y: 0.991; }
        frame 22 { x: -10000; y: 100; skew-x: 398.8; skew-y: 398.8; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 47.5; y: 100.3; skew-x: 397.6; skew-y: 397.6; scale-x: 0.989; scale-y: 0.989; }
        frame 24 { x: 46.8; y: 100.6; skew-x: 396.6; skew-y: 396.6; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 46.4; y: 101; skew-x: 395.6; skew-y: 395.6; scale-x: 0.99; scale-y: 0.99; }
        frame 26 { x: 46; y: 100.8; skew-x: 388.1; skew-y: 388.1; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 45.5; y: 100.9; skew-x: 380.8; skew-y: 380.8; scale-x: 0.992; scale-y: 0.992; }
        frame 28 { x: 45.1; y: 101.1; skew-x: 373.3; skew-y: 373.3; scale-x: 0.994; scale-y: 0.994; }
        frame 29 { x: 44.6; y: 101.5; skew-x: 366; skew-y: 366; scale-x: 0.996; scale-y: 0.996; }
        frame 30 { x: 44.3; y: 101.9; skew-x: 359.7; skew-y: 359.7; scale-x: 0.997; scale-y: 0.997; }
        frame 31 { x: 44; y: 102.5; skew-x: 353; skew-y: 353; scale-x: 0.998; scale-y: 0.998; }
        frame 32 { y: 103.1; skew-x: 346.4; skew-y: 346.4; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: -10000; y: 101; skew-x: 363.8; skew-y: 363.8; scale-x: 0.998; scale-y: 0.998; }
        frame 34 { x: 44.1; y: 100.4; skew-x: 365; skew-y: 365; scale-x: -10000; scale-y: 1.011; }
        frame 35 { x: -10000; y: 100; skew-x: 366.5; skew-y: 366.5; scale-y: 1.024; }
        frame 36 { x: 44.3; y: 99.4; skew-x: 367.8; skew-y: 367.8; scale-y: 1.037; }
        frame 37 { x: 44.5; y: 99; skew-x: 369.3; skew-y: 369.3; scale-y: 1.051; }
        frame 38 { x: 44.6; y: 98.7; skew-x: 368.8; skew-y: 368.8; scale-x: 0.997; scale-y: 1.064; }
        frame 39 { x: -10000; y: 98.4; skew-x: 368.3; skew-y: 368.3; scale-x: 0.998; scale-y: 1.077; }
        frame 40 { y: 98.2; skew-x: 367.8; skew-y: 367.8; scale-x: -10000; scale-y: 1.091; }
        frame 41 { y: 97.8; skew-x: 367.6; skew-y: 367.6; scale-y: 1.105; }
        frame 42 { x: 44.5; y: 99.2; skew-x: 369.1; skew-y: 369.1; scale-x: 0.997; scale-y: 1.068; }
        frame 43 { x: -10000; y: 100.5; skew-x: 370.8; skew-y: 370.8; scale-x: -10000; scale-y: 1.033; }
        frame 44 { x: 44.3; y: 101.8; skew-x: 372.6; skew-y: 372.6; scale-x: 0.998; scale-y: 0.998; }
        frame 45 { x: 44.2; y: 101.4; skew-x: 370.3; skew-y: 370.3; scale-x: 0.997; scale-y: 1.011; }
        frame 46 { x: -10000; y: 100.9; skew-x: 368; skew-y: 368; scale-x: 0.998; scale-y: 1.024; }
        frame 47 { x: 44.1; y: 100.4; skew-x: 365.8; skew-y: 365.8; scale-x: -10000; scale-y: 1.037; }
        frame 48 { x: 44; y: 100; skew-x: 363.8; skew-y: 363.8; scale-y: 1.051; }
        frame 49 { x: 44.1; y: 99.1; skew-x: 364.6; skew-y: 364.6; scale-y: 1.079; }
        frame 50 { x: 44.3; y: 98.4; skew-x: 365.5; skew-y: 365.5; scale-y: 1.107; }
        frame 51 { x: 44.4; y: 97.5; skew-x: 366.5; skew-y: 366.5; scale-y: 1.135; }
        frame 52 { x: 44.6; y: 96.8; skew-x: 367.6; skew-y: 367.6; scale-y: 1.163; }
        frame 53 { x: -10000; y: 98.5; skew-x: 369.1; skew-y: 369.1; scale-x: 0.997; scale-y: 1.107; }
        frame 54 { y: 100.2; skew-x: 370.8; skew-y: 370.8; scale-x: -10000; scale-y: 1.052; }
        frame 55 { x: 44.3; y: 101.8; skew-x: 372.6; skew-y: 372.6; scale-x: 0.998; scale-y: 0.998; }
        frame 56 { x: -10000; y: 101.2; skew-x: 370.3; skew-y: 370.3; scale-x: 0.997; scale-y: 1.017; }
        frame 57 { x: 44.2; y: 100.6; skew-x: 368; skew-y: 368; scale-x: 0.998; scale-y: 1.037; }
        frame 58 { x: 44.1; y: 99.9; skew-x: 365.8; skew-y: 365.8; scale-x: -10000; scale-y: 1.057; }
        frame 59 { x: 44; y: 99.2; skew-x: 363.8; skew-y: 363.8; scale-y: 1.078; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 61 { x: 45.2; skew-x: 368.3; skew-y: 368.3; scale-y: 1.077; }
        frame 62 { x: 46.5; skew-x: 373; skew-y: 373; scale-x: 0.997; scale-y: 1.076; }
        frame 63 { x: 47.8; y: 99.3; skew-x: 377.5; skew-y: 377.5; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 49; y: 99.4; skew-x: 382.1; skew-y: 382.1; scale-x: 0.996; scale-y: 1.075; }
        frame 65 { x: 50.4; y: 99.5; skew-x: 386.8; skew-y: 386.8; scale-x: -10000; scale-y: 1.074; }
        frame 66 { x: 51.8; y: 99.8; skew-x: 391.4; skew-y: 391.4; scale-x: 0.997; scale-y: 1.076; }
        frame 67 { x: 55.5; y: 101.2; skew-x: 399.9; skew-y: 407.4; scale-x: 0.995; scale-y: 1.095; }
        frame 68 { x: 58.8; y: 103.2; skew-x: 408.4; skew-y: 423.4; scale-x: -10000; scale-y: 1.117; }
        frame 69 { x: 61.8; y: 105.7; skew-x: 417.1; skew-y: 439.4; scale-y: 1.14; }
        frame 70 { x: 64.2; y: 108.2; skew-x: 425.6; skew-y: 455.2; scale-x: 0.996; scale-y: 1.162; }
        frame 71 { x: 65.6; y: 109.3; skew-x: 444.5; skew-y: 466.1; scale-x: -10000; scale-y: 1.104; }
        frame 72 { x: 66.8; y: 110.9; skew-x: 463.3; skew-y: 477; scale-y: 1.047; }
        frame 73 { x: 67.5; y: 112.5; skew-x: 482.3; skew-y: 487.9; scale-x: 0.997; scale-y: 0.992; }
        frame 74 { x: 67.2; y: 113.2; skew-x: 484.6; skew-y: 485.6; scale-x: 0.976; scale-y: 0.998; }
        frame 75 { x: 66.8; y: 113.7; skew-x: 486.7; skew-y: 483.4; scale-x: 0.958; scale-y: 1.008; }
        frame 76 { x: 67.6; y: 112; skew-x: 466.3; skew-y: 467.5; scale-x: 0.975; scale-y: 1.134; }
        frame 77 { x: -10000; y: 110.2; skew-x: 445.9; skew-y: 451.6; scale-x: 0.995; scale-y: 1.262; }
        frame 78 { x: 67.8; y: 110.8; skew-x: 450.3; skew-y: 456; scale-x: -10000; scale-y: 1.212; }
        frame 79 { x: 68; y: 111.5; skew-x: 455; skew-y: 460.6; scale-y: 1.163; }
        frame 80 { x: 65.3; y: 112; skew-x: 453.8; skew-y: 459.5; scale-x: 0.994; scale-y: 1.076; }
        frame 81 { x: 62.9; y: 112.5; skew-x: 453; skew-y: 458.7; scale-x: 0.995; scale-y: 0.99; }
        frame 82 { x: 100.2; y: 27.4; skew-x: 288.9; skew-y: 288.9; scale-x: -10000; scale-y: 0.995; }
        frame 83 { x: 98.1; y: 25.1; skew-x: 295.8; skew-y: 295.8; scale-x: 0.992; scale-y: 0.992; }
        frame 84 { x: 96; y: 22.8; skew-x: 303.1; skew-y: 303.1; scale-x: 0.99; scale-y: 0.99; }
        frame 85 { x: 94.1; y: 20.5; skew-x: 310.2; skew-y: 310.2; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 97.9; y: 12.8; skew-x: 271.2; skew-y: 271.2; scale-x: 0.988; scale-y: 0.988; }
        frame 87 { x: 91.4; y: 12; skew-x: 251; skew-y: 251; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 75.8; y: 6; skew-x: 196.1; skew-y: 196.1; scale-x: 0.984; scale-y: 0.984; }
        frame 89 { x: 76.4; y: 9.3; skew-x: 161; skew-y: 161; scale-x: 0.988; scale-y: 0.988; }
        frame 90 { x: 72.3; y: 11.6; skew-x: 121.6; skew-y: 121.6; scale-x: 0.983; scale-y: 0.983; }
        frame 91 { x: 64.3; y: 14; skew-x: 82.3; skew-y: 82.3; scale-x: 0.982; scale-y: 0.982; }
        frame 92 { x: 57.1; y: 20.4; skew-x: 60.9; skew-y: 60.9; scale-x: 0.98; scale-y: 1.028; }
        frame 93 { x: 49.4; y: 27.7; skew-x: 39.4; skew-y: 39.4; scale-x: -10000; scale-y: 1.076; }
        frame 94 { x: 45.3; y: 38.4; skew-x: 35.3; skew-y: 35.3; scale-x: 0.977; scale-y: 1.074; }
        frame 95 { x: 41.3; y: 49.1; skew-x: 31.1; skew-y: 31.1; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 42.6; y: 65.3; skew-x: 17.1; skew-y: 17.1; scale-y: 1.073; }
        frame 97 { x: 43.9; y: 82.1; skew-x: 3.3; skew-y: 3.3; scale-y: 1.074; }
        frame 98 { x: 44.6; y: 88.4; skew-x: 5.3; skew-y: 5.3; scale-x: 0.976; scale-y: 1.072; }
        frame 99 { x: 45.3; y: 94.8; skew-x: 7.5; skew-y: 7.5; scale-x: 0.975; scale-y: -10000; }
        frame 100 { x: 46.8; y: 96.5; skew-x: 19.1; skew-y: 19.1; scale-x: -10000; scale-y: 1.071; }
        frame 101 { x: 48.6; y: 98.6; skew-x: 30.9; skew-y: 30.9; scale-x: 0.976; scale-y: 1.072; }
        frame 102 { x: 46; y: 98.1; skew-x: 19.1; skew-y: 19.1; scale-x: 0.975; scale-y: 1.071; }
        frame 103 { x: 43.6; y: 97.8; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: 1.072; }
    }
    Track {
        source-name: "Zombie_imp_body2";
        frame-count: 104;
        frame 0 { x: 42.1; y: 89.5; skew-x: 11; skew-y: 8; scale-x: 1.001; image: IMAGE_REANIM_ZOMBIE_IMP_BODY2; }
        frame 1 { x: 42.3; y: 88.8; skew-x: 12.3; skew-y: 9.3; scale-x: 1; scale-y: 0.999; image: none; }
        frame 2 { x: -10000; y: 88.1; skew-x: 13.5; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 42.6; y: 87.4; skew-x: 14.9; skew-y: 12.1; }
        frame 4 { x: 41.8; y: 88.8; skew-x: 12.5; skew-y: 10; scale-x: 0.999; }
        frame 5 { x: 41; y: 90.4; skew-x: 10.3; skew-y: 8.1; scale-x: -10000; }
        frame 6 { x: 40.3; y: 91.8; skew-x: 8.1; skew-y: 6.3; }
        frame 7 { x: 40; y: 93.2; skew-x: 6; skew-y: 3.5; scale-x: 1; }
        frame 8 { x: 39.9; y: 94.5; skew-x: 4; skew-y: 1; scale-x: -10000; }
        frame 9 { x: 39.8; y: 96; skew-x: 2.2; skew-y: -1.4; scale-x: 1.001; }
        frame 10 { x: 39.9; y: 95.5; skew-x: 3.1; skew-y: -0.2; scale-x: 1; scale-y: 0.998; }
        frame 11 { x: -10000; y: 94.8; skew-x: 4.3; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 40; y: 94.4; skew-x: 5.3; skew-y: 1.6; }
        frame 13 { x: 40.1; y: 93.8; skew-x: 6.3; skew-y: 2.8; }
        frame 14 { x: 40.7; y: 92.5; skew-x: 8.6; skew-y: 4.8; }
        frame 15 { x: 41.4; y: 91.3; skew-x: 11; skew-y: 7; scale-y: 0.997; }
        frame 16 { x: 42; y: 90.2; skew-x: 13.5; skew-y: 9.2; scale-x: 1.001; scale-y: 0.998; }
        frame 17 { y: 90; skew-x: 14.3; skew-y: 11.5; scale-x: 0.999; scale-y: 0.997; }
        frame 18 { x: 42.1; y: 89.8; skew-x: 15.3; skew-y: 13.8; scale-x: 0.997; scale-y: 0.996; }
        frame 19 { x: 42.3; y: 89.7; skew-x: 16.1; skew-y: 16.1; scale-x: -10000; scale-y: 0.997; }
        frame 20 { x: 41.6; y: 90.8; skew-x: 13.6; skew-y: 12.3; scale-y: 0.996; }
        frame 21 { x: 41.1; y: 91.9; skew-x: 11.1; skew-y: 8.6; scale-x: 0.998; scale-y: 0.997; }
        frame 22 { x: 40.6; y: 92.9; skew-x: 8.7; skew-y: 5; scale-x: 1; scale-y: 0.998; }
        frame 23 { x: 40.4; y: 94.4; skew-x: 5.8; skew-y: 2.8; scale-x: 0.999; scale-y: -10000; }
        frame 24 { x: 40; y: 95.8; skew-x: 2.8; skew-y: 0.5; scale-x: -10000; }
        frame 25 { x: 39.8; y: 97.2; skew-x: 0; skew-y: -1.4; scale-y: 0.999; }
        frame 26 { x: 40.2; y: 95.9; skew-x: 1.8; skew-y: 0; scale-y: -10000; }
        frame 27 { x: 40.5; y: 94.7; skew-x: 3.5; skew-y: 1.5; }
        frame 28 { x: 41; y: 93.4; skew-x: 5.3; skew-y: 3.1; }
        frame 29 { x: 41.4; y: 92.1; skew-x: 7; skew-y: 4.8; scale-x: 1; }
        frame 30 { x: 41.6; y: 91.3; skew-x: 8.3; skew-y: 5.8; scale-x: -10000; }
        frame 31 { x: 42; y: 90.3; skew-x: 9.5; skew-y: 6.8; }
        frame 32 { x: 42.1; y: 89.5; skew-x: 11; skew-y: 8; scale-x: 1.001; scale-y: 1; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 42.2; y: 89.4; skew-x: 12; skew-y: 8.6; scale-y: 0.999; }
        frame 35 { x: 42.3; y: 89.2; skew-x: 13.3; skew-y: 9.3; scale-y: -10000; }
        frame 36 { x: 42.5; y: 89; skew-x: 14.3; skew-y: 10; scale-x: 1.002; }
        frame 37 { x: -10000; y: 88.8; skew-x: 15.6; skew-y: 10.8; scale-x: 1.003; }
        frame 38 { x: 42.6; y: 88.5; skew-x: 16.1; skew-y: -10000; scale-x: 1.002; scale-y: 1; }
        frame 39 { x: 42.7; y: 88; skew-x: 16.6; skew-y: 11; scale-x: -10000; scale-y: 1.001; }
        frame 40 { x: 42.8; y: 87.5; skew-x: 17.3; skew-y: 11.1; scale-x: 1.001; scale-y: -10000; }
        frame 41 { x: 42.7; y: 87.2; skew-x: 17.8; skew-y: 11.3; scale-x: 1.002; scale-y: 1.003; }
        frame 42 { x: 41.6; y: 89.9; skew-x: 11.3; skew-y: 6.8; scale-x: 1; scale-y: 1.001; }
        frame 43 { x: 40.6; y: 92.7; skew-x: 4.8; skew-y: 2.5; scale-x: 0.999; scale-y: 1; }
        frame 44 { x: 39.9; y: 95.4; skew-x: -1.6; skew-y: -1.6; scale-x: 0.998; scale-y: 0.998; }
        frame 45 { x: 40.5; y: 93.9; skew-x: 2; skew-y: 1.3; scale-x: 0.999; scale-y: -10000; }
        frame 46 { x: 41; y: 92.4; skew-x: 5.8; skew-y: 4.5; scale-x: -10000; }
        frame 47 { x: 41.6; y: 90.9; skew-x: 9.6; skew-y: 7.5; scale-y: 0.999; }
        frame 48 { x: 42.4; y: 89.4; skew-x: 13.6; skew-y: 10.8; scale-x: 1.001; scale-y: -10000; }
        frame 49 { x: 42.5; y: 88.6; skew-x: 15.1; skew-y: 11.3; scale-x: -10000; }
        frame 50 { x: 42.8; y: 87.8; skew-x: 16.8; skew-y: 12.1; scale-x: 1.002; }
        frame 51 { x: 43.1; y: 87; skew-x: 18.3; skew-y: 12.8; scale-x: 1.003; }
        frame 52 { x: 43.2; y: 86.5; skew-x: 20; skew-y: 13.6; scale-x: 1.006; }
        frame 53 { x: 41.9; y: 89.4; skew-x: 12.8; skew-y: 8.3; scale-x: 1.002; scale-y: 0.998; }
        frame 54 { x: 40.8; y: 92.4; skew-x: 5.5; skew-y: 3.3; scale-x: 1; scale-y: -10000; }
        frame 55 { x: 39.9; y: 95.4; skew-x: -1.6; skew-y: -1.6; scale-x: 0.998; }
        frame 56 { x: 40.3; y: 93.9; skew-x: 1.3; skew-y: 0.6; scale-x: 0.999; }
        frame 57 { x: 40.9; y: 92.4; skew-x: 4.5; skew-y: 3; scale-x: -10000; scale-y: 0.999; }
        frame 58 { x: 41.5; y: 91; skew-x: 7.8; skew-y: 5.5; scale-x: 1; scale-y: -10000; }
        frame 59 { x: 42.1; y: 89.5; skew-x: 11; skew-y: 8; scale-x: 1.001; scale-y: 1; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 43; y: 90.4; skew-x: 9.6; skew-y: 7.8; scale-x: 1; scale-y: 0.999; }
        frame 62 { x: 43.9; y: 91.4; skew-x: 8.3; skew-y: -10000; scale-x: -10000; scale-y: 0.998; }
        frame 63 { x: 44.9; y: 92.4; skew-x: 7; scale-y: -10000; }
        frame 64 { x: 45.9; y: 93.3; skew-x: 5.8; scale-y: 0.997; }
        frame 65 { x: 46.7; y: 94.2; skew-x: 4.5; skew-y: 7.6; scale-x: 0.999; scale-y: -10000; }
        frame 66 { x: 47.8; y: 95.3; skew-x: 3.2; skew-y: -10000; scale-x: 1; }
        frame 67 { x: 51; y: 95.2; skew-x: 12.8; skew-y: 18; scale-x: 0.999; scale-y: 0.995; }
        frame 68 { x: 54.4; y: 95.4; skew-x: 22.6; skew-y: 28.3; scale-x: 1; scale-y: 0.994; }
        frame 69 { x: 58.1; y: 96; skew-x: 32.3; skew-y: 38.9; scale-x: -10000; scale-y: 0.993; }
        frame 70 { x: 62.1; y: 97; skew-x: 42.2; skew-y: 49.3; scale-x: 1.002; scale-y: 0.994; }
        frame 71 { x: 62.6; y: 98.2; skew-x: 41.1; skew-y: 49.4; scale-x: 0.991; scale-y: 0.993; }
        frame 72 { x: 63.1; y: 99.3; skew-x: 40.4; skew-y: -10000; scale-x: 0.981; scale-y: -10000; }
        frame 73 { x: 63.5; y: 100.4; skew-x: 39.4; skew-y: 49.3; scale-x: 0.973; scale-y: 0.994; }
        frame 74 { x: 62.6; y: 101.6; skew-x: 36.4; skew-y: 51.1; scale-x: 0.992; scale-y: 0.997; }
        frame 75 { x: 61.9; y: 102.7; skew-x: 33.5; skew-y: 52.9; scale-x: 1.014; scale-y: 1.003; }
        frame 76 { x: 62.3; y: 101.4; skew-x: 35.8; skew-y: 49.6; scale-x: 1.008; scale-y: 0.997; }
        frame 77 { x: 62.5; y: 100; skew-x: 38; skew-y: 46.2; scale-x: 1.004; scale-y: 0.994; }
        frame 78 { x: 61.9; y: 99.8; skew-x: 35.6; skew-y: 44.6; scale-x: 1.005; scale-y: 0.992; }
        frame 79 { x: 61.1; y: 99.5; skew-x: 33.1; skew-y: 43.2; scale-x: 1.009; scale-y: 0.994; }
        frame 80 { x: 61.9; y: 99.6; skew-x: 36.8; skew-y: 44.6; scale-x: 1.002; scale-y: 0.992; }
        frame 81 { x: 62.4; y: -10000; skew-x: 40.4; skew-y: 46.1; scale-x: 0.999; scale-y: 0.994; }
        frame 82 { x: 92.9; y: 25.5; skew-x: -70.5; skew-y: -70.5; scale-x: 0.994; scale-y: -10000; }
        frame 83 { x: 91.3; y: 25.2; skew-x: -72.1; skew-y: -72.1; scale-x: 0.993; scale-y: 0.993; }
        frame 84 { x: 89.5; y: 24.9; skew-x: -73.4; skew-y: -73.4; scale-x: 0.992; scale-y: 0.992; }
        frame 85 { x: 87.9; y: 24.5; skew-x: -74.8; skew-y: -74.8; scale-x: 0.991; scale-y: 0.991; }
        frame 86 { x: 95.1; y: 20.5; skew-x: -113.7; skew-y: -113.7; scale-x: 0.989; scale-y: 0.989; }
        frame 87 { x: 91.7; y: 19.4; skew-x: -134; skew-y: -134; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 86.7; y: 5.1; skew-x: -202.1; skew-y: -202.1; scale-x: 0.987; scale-y: 0.987; }
        frame 89 { x: 83.8; y: 9; skew-x: -224; skew-y: -224; scale-x: 0.989; scale-y: 0.989; }
        frame 90 { x: 79; y: 8.5; skew-x: -252.3; skew-y: -252.3; scale-x: 0.985; scale-y: 0.985; }
        frame 91 { x: 71.2; y: 10.8; skew-x: -280.4; skew-y: -280.4; scale-x: 0.984; scale-y: 0.984; }
        frame 92 { x: 62.5; y: 13.9; skew-x: -296; skew-y: -301.7; scale-x: 0.992; scale-y: 0.982; }
        frame 93 { x: 53.2; y: 18.8; skew-x: -311.6; skew-y: -323.3; scale-x: 1.003; scale-y: -10000; }
        frame 94 { x: 48.3; y: 29.4; skew-x: -316.2; skew-y: -327.8; scale-x: 1; scale-y: 0.979; }
        frame 95 { x: 43.1; y: 39.6; skew-x: -320.7; skew-y: -332.5; scale-x: -10000; scale-y: 0.98; }
        frame 96 { x: 41.8; y: 55.8; skew-x: -335.1; skew-y: -346.9; scale-x: 0.999; scale-y: 0.979; }
        frame 97 { x: 41.3; y: 72.8; skew-x: -349.5; skew-y: -361.1; scale-x: 1; scale-y: 0.98; }
        frame 98 { x: 42; y: 80.9; skew-x: -353.4; skew-y: -360.9; scale-x: 0.993; scale-y: -10000; }
        frame 99 { x: 42.6; y: 89; skew-x: -357.1; skew-y: -361; scale-x: 0.986; }
        frame 100 { x: 42.2; y: 92.5; skew-x: -358.1; skew-y: -360.9; scale-x: 0.983; }
        frame 101 { x: 41.8; y: 95.8; skew-x: -359; skew-y: -361.1; scale-x: 0.98; }
        frame 102 { x: 40.8; y: 92.5; skew-x: -354.6; skew-y: -360.9; scale-x: 0.991; }
        frame 103 { x: 40; y: 89.2; skew-x: -349.9; skew-y: -361; scale-x: 1.002; }
    }
    Track {
        source-name: "Zombie_imp_body1";
        frame-count: 104;
        frame 0 { x: 37.5; y: 63.2; skew-x: 8; skew-y: 8; image: IMAGE_REANIM_ZOMBIE_IMP_BODY1; }
        frame 1 { x: 38.3; y: 62.4; skew-x: 9.3; skew-y: 9.3; scale-x: 0.999; scale-y: 0.999; image: none; }
        frame 2 { x: 39.1; y: 61.5; skew-x: 10.6; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 39.9; y: 60.6; skew-x: 12.1; skew-y: 12.1; }
        frame 4 { x: 38.1; y: 62.1; skew-x: 10; skew-y: 10; }
        frame 5 { x: 36.5; y: 63.7; skew-x: 8.1; skew-y: 8.1; }
        frame 6 { x: 34.9; y: 65.2; skew-x: 6.3; skew-y: 6.3; }
        frame 7 { x: 33.4; y: 67.3; skew-x: 3.5; skew-y: 3.5; }
        frame 8 { x: 32; y: 69.2; skew-x: 1; skew-y: 1; }
        frame 9 { x: 30.7; y: 71.3; skew-x: -1.4; skew-y: -1.4; }
        frame 10 { x: 31.2; y: 70.7; skew-x: -0.4; skew-y: -0.4; scale-x: 0.998; scale-y: 1.022; }
        frame 11 { x: 31.7; y: 70.1; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: 1.046; }
        frame 12 { x: 32.8; y: 69; skew-x: 2; skew-y: 2; scale-y: 1.022; }
        frame 13 { x: 33.7; y: 67.7; skew-x: 3.8; skew-y: 3.8; scale-y: 0.998; }
        frame 14 { x: 35.4; y: 66.3; skew-x: 6; skew-y: 6; scale-y: -10000; }
        frame 15 { x: 37.1; y: 64.9; skew-x: 8.5; skew-y: 8.5; scale-x: 0.997; scale-y: 0.997; }
        frame 16 { x: 38.9; y: 63.6; skew-x: 10.8; skew-y: 10.8; scale-x: 0.998; scale-y: 0.998; }
        frame 17 { x: 39.8; y: 62.9; skew-x: 12.5; skew-y: 12.5; scale-x: 0.997; scale-y: 0.997; }
        frame 18 { x: 40.8; y: 62.3; skew-x: 14.3; skew-y: 14.3; scale-x: 0.996; scale-y: 0.996; }
        frame 19 { x: 41.6; y: 61.6; skew-x: 16.1; skew-y: 16.1; scale-x: 0.997; scale-y: 0.997; }
        frame 20 { x: 39.5; y: 63.2; skew-x: 12.8; skew-y: 12.8; scale-x: 0.996; scale-y: 0.996; }
        frame 21 { x: 37.4; y: 65; skew-x: 9.5; skew-y: 9.5; scale-x: 0.997; scale-y: 0.997; }
        frame 22 { x: 35.3; y: 66.7; skew-x: 6.3; skew-y: 6.3; scale-x: 0.998; scale-y: 0.998; }
        frame 23 { x: 33.6; y: 68.3; skew-x: 3.6; skew-y: 3.6; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 32; y: 69.7; skew-x: 1; skew-y: 1; }
        frame 25 { x: 30.7; y: 71.3; skew-x: -1.4; skew-y: -1.4; scale-x: 0.999; scale-y: 0.999; }
        frame 26 { x: 31.4; y: 70.3; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: 1.016; }
        frame 27 { x: 32.1; y: 69.4; skew-x: 0.5; skew-y: 0.5; scale-y: 1.033; }
        frame 28 { x: 33.8; y: 67.8; skew-x: 2.5; skew-y: 2.5; scale-y: 1.016; }
        frame 29 { x: 35.1; y: 65.9; skew-x: 4.8; skew-y: 4.8; scale-y: 0.999; }
        frame 30 { x: 36; y: 65; skew-x: 5.8; skew-y: 5.8; scale-y: -10000; }
        frame 31 { x: 36.7; y: 64.1; skew-x: 6.8; skew-y: 6.8; }
        frame 32 { x: 37.5; y: 63.2; skew-x: 8; skew-y: 8; scale-x: 1; scale-y: 1; }
        frame 33 { x: -10000; y: 63.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 38.4; y: 63.1; skew-x: 9.6; skew-y: 9.6; scale-x: 0.999; scale-y: 0.999; }
        frame 35 { x: 39.4; y: 62.6; skew-x: 11.3; skew-y: 11.3; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 40.4; y: 62.1; skew-x: 12.8; skew-y: 12.8; }
        frame 37 { x: 41.4; y: 61.6; skew-x: 14.6; skew-y: 14.6; }
        frame 38 { x: 41.9; y: 61.3; skew-x: 15.5; skew-y: 15.5; scale-x: 0.998; scale-y: 0.998; }
        frame 39 { x: 42.5; y: 61; skew-x: 16.5; skew-y: 16.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 43; y: 60.5; skew-x: 17.5; skew-y: 17.5; }
        frame 41 { x: 43.6; y: 60.1; skew-x: 18.6; skew-y: 18.6; scale-x: 0.999; scale-y: 0.999; }
        frame 42 { x: 38.1; y: 63.3; skew-x: 10.3; skew-y: 10.3; scale-x: 0.998; scale-y: 0.998; }
        frame 43 { x: 33; y: 66.8; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 28.4; y: 71; skew-x: -6.1; skew-y: -6.1; }
        frame 45 { x: 31.3; y: 68.6; skew-x: -0.9; skew-y: 0; scale-y: 1.008; }
        frame 46 { x: 34.4; y: 66.4; skew-x: 4; skew-y: 5.9; scale-y: 1.019; }
        frame 47 { x: 37.9; y: 64; skew-x: 9.3; skew-y: 10.1; scale-y: 1.008; }
        frame 48 { x: 41.4; y: 61.6; skew-x: 14.6; skew-y: 14.6; scale-x: 0.999; scale-y: 0.999; }
        frame 49 { x: 41.9; y: 61.1; skew-x: 15.5; skew-y: 15.5; scale-x: 0.998; scale-y: 0.998; }
        frame 50 { x: 42.5; y: 60.7; skew-x: 16.5; skew-y: 16.5; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 43.1; y: 60.1; skew-x: 17.5; skew-y: 17.5; }
        frame 52 { x: 43.7; y: 59.6; skew-x: 18.6; skew-y: 18.6; scale-x: 0.999; scale-y: 0.999; }
        frame 53 { x: 38.2; y: 63; skew-x: 10.3; skew-y: 10.3; scale-x: 0.998; scale-y: 0.998; }
        frame 54 { x: 33.1; y: 66.7; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 28.4; y: 71; skew-x: -6.1; skew-y: -6.1; }
        frame 56 { x: 31.2; y: 68.5; skew-x: -0.9; skew-y: 0; scale-y: 1.008; }
        frame 57 { x: 34.2; y: 66.1; skew-x: 4; skew-y: 5.9; scale-y: 1.019; }
        frame 58 { x: 35.8; y: 64.8; skew-x: 6; skew-y: 6.8; scale-y: 1.009; }
        frame 59 { x: 37.5; y: 63.5; skew-x: 8; skew-y: 8; scale-x: 1; scale-y: 1; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 37.4; y: 64.9; skew-x: 6; skew-y: 6; scale-x: 0.999; scale-y: 0.999; }
        frame 62 { x: 37.1; y: 66.4; skew-x: 4.3; skew-y: 4.3; scale-x: 0.998; scale-y: 0.998; }
        frame 63 { x: -10000; y: 67.8; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: -10000; }
        frame 64 { y: 69.3; skew-x: 0.5; skew-y: 0.5; scale-x: 0.997; scale-y: 0.997; }
        frame 65 { x: 37; y: 70.7; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 66 { y: 72.3; skew-x: -3; skew-y: -3; scale-x: 0.996; scale-y: 0.996; }
        frame 67 { x: 44.4; y: 71.2; skew-x: 7.3; skew-y: 7.3; scale-x: 0.995; scale-y: 0.995; }
        frame 68 { x: 52.4; y: 70.8; skew-x: 17.6; skew-y: 17.6; scale-x: 0.994; scale-y: 0.994; }
        frame 69 { x: 60.9; y: 70.9; skew-x: 28.1; skew-y: 28.1; scale-x: 0.993; scale-y: 0.993; }
        frame 70 { x: 69.8; y: 72.1; skew-x: 38.5; skew-y: 38.5; scale-x: 0.994; scale-y: 0.994; }
        frame 71 { x: 67.7; y: 73.6; skew-x: 34.8; skew-y: 34.8; scale-x: 0.992; scale-y: 0.992; }
        frame 72 { x: 65.5; y: 75.1; skew-x: 31.3; skew-y: 31.3; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 63.3; y: 76.8; skew-x: 27.7; skew-y: 27.7; scale-x: 0.993; scale-y: 0.993; }
        frame 74 { x: 62.8; y: 79; skew-x: 25.8; skew-y: 29.6; scale-x: 1.013; scale-y: 0.966; }
        frame 75 { x: 62.4; y: 81.1; skew-x: 24; skew-y: 31.8; scale-x: 1.035; scale-y: 0.942; }
        frame 76 { x: 62.9; y: 79.1; skew-x: 25.8; skew-y: 29.6; scale-x: 1.013; scale-y: 0.966; }
        frame 77 { x: 63.3; y: 76.8; skew-x: 27.7; skew-y: 27.7; scale-x: 0.993; scale-y: 0.993; }
        frame 78 { x: 61.8; y: 76.6; skew-x: 25.6; skew-y: 25.6; scale-x: 0.992; scale-y: 0.992; }
        frame 79 { x: 60.3; y: 76.1; skew-x: 23.6; skew-y: 23.6; scale-x: 0.993; scale-y: 0.993; }
        frame 80 { x: 55.4; y: 79.7; skew-x: 18.8; skew-y: 16.6; scale-x: -10000; scale-y: 0.991; }
        frame 81 { x: 50.8; y: 83.5; skew-x: 14; skew-y: 9.9; scale-x: 0.994; scale-y: 0.992; }
        frame 82 { x: 64.5; y: 22.9; skew-x: -65.9; skew-y: -65.9; scale-x: 0.988; scale-y: 0.988; }
        frame 83 { x: -10000; y: 25.9; skew-x: -71.6; skew-y: -71.6; scale-x: 0.986; scale-y: 0.986; }
        frame 84 { x: 64.7; y: 28.8; skew-x: -77.1; skew-y: -77.1; scale-x: 0.985; scale-y: 0.985; }
        frame 85 { x: 64.9; y: 31.4; skew-x: -82.8; skew-y: -82.8; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 74.7; y: 39.5; skew-x: -112.2; skew-y: -112.2; scale-x: 0.983; scale-y: 0.983; }
        frame 87 { x: 85.9; y: 42.5; skew-x: -142; skew-y: -142; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 101.7; y: 31.6; skew-x: -186.9; skew-y: -186.9; scale-x: 0.982; scale-y: 0.982; }
        frame 89 { x: 106.9; y: 14.8; skew-x: -232; skew-y: -232; scale-x: 0.983; scale-y: 0.983; }
        frame 90 { x: 104.6; y: 7.7; skew-x: -249.4; skew-y: -249.4; scale-x: 0.981; scale-y: 0.981; }
        frame 91 { x: 100.7; y: 1.5; skew-x: -266.6; skew-y: -266.6; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 90.3; y: 1.1; skew-x: -277.7; skew-y: -277.7; scale-x: 0.98; scale-y: 0.98; }
        frame 93 { x: 79.4; y: -10000; skew-x: -288.7; skew-y: -288.7; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 72.7; y: 9.8; skew-x: -293.2; skew-y: -293.2; scale-x: 0.977; scale-y: 0.977; }
        frame 95 { x: 66; y: 18.5; skew-x: -297.7; skew-y: -297.7; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 58.6; y: 30.1; skew-x: -312; skew-y: -312; scale-x: 0.976; scale-y: 0.976; }
        frame 97 { x: 51; y: 42.9; skew-x: -326.6; skew-y: -326.6; scale-x: 0.977; scale-y: 0.977; }
        frame 98 { x: 44.9; y: 50.9; skew-x: -338.3; skew-y: -338.3; scale-x: 0.975; scale-y: 0.975; }
        frame 99 { x: 39.2; y: 59.6; skew-x: -349.9; skew-y: -349.9; scale-x: 0.976; scale-y: 0.976; }
        frame 100 { x: 35.3; y: 66.1; skew-x: -356.3; skew-y: -356.3; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 31.5; y: 72.5; skew-x: -362.5; skew-y: -362.5; }
        frame 102 { x: 34.6; y: 67.9; skew-x: -356.9; skew-y: -356.9; scale-x: 0.975; scale-y: 0.975; }
        frame 103 { x: 38; y: 63.4; skew-x: -351; skew-y: -351; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_imp_outerleg_foot";
        frame-count: 104;
        frame 0 { x: 46.1; y: 116.2; skew-x: 357.8; skew-y: 357.8; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZOMBIE_IMP_OUTERLEG_FOOT; }
        frame 1 { x: 43.9; y: 116.6; skew-x: 353.2; skew-y: 353.2; scale-x: 0.997; scale-y: 0.997; image: none; }
        frame 2 { x: 41.8; y: 117.1; skew-x: 348.5; skew-y: 348.5; scale-x: 0.996; scale-y: 0.996; }
        frame 3 { x: 39.8; y: 117.6; skew-x: 343.9; skew-y: 343.9; scale-x: 0.995; scale-y: 0.995; }
        frame 4 { x: 39; y: 114.2; skew-x: 363.5; skew-y: 363.5; scale-x: 0.994; scale-y: 0.994; }
        frame 5 { x: -10000; y: 111.5; skew-x: 383.3; skew-y: 383.3; scale-x: 0.992; scale-y: 0.992; }
        frame 6 { x: 39.5; y: 109.5; skew-x: 403.2; skew-y: 403.2; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 39.2; y: 111.5; skew-x: 386.8; skew-y: 386.8; scale-x: 0.99; scale-y: 0.99; }
        frame 8 { x: 39.3; y: 114.1; skew-x: 370.5; skew-y: 370.5; scale-x: 0.991; scale-y: 0.991; }
        frame 9 { x: 40; y: 117.4; skew-x: 354.2; skew-y: 354.2; scale-x: 0.992; scale-y: 0.992; }
        frame 10 { x: 40.8; y: 117.5; skew-x: 353.7; skew-y: 353.7; scale-x: 0.991; scale-y: 0.991; }
        frame 11 { x: 41.6; y: 117.7; skew-x: 353; skew-y: 353; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 42.5; y: 118; skew-x: 352.4; skew-y: 352.4; scale-x: 0.99; scale-y: 0.99; }
        frame 13 { x: 43.2; y: 118.3; skew-x: 351.6; skew-y: 351.6; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 44.9; y: -10000; skew-x: 351.4; skew-y: 351.4; scale-x: 0.989; scale-y: 0.989; }
        frame 15 { x: 46.6; y: 118.4; skew-x: 351; skew-y: 351; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 48.3; y: 118.5; skew-x: 350.7; skew-y: 350.7; }
        frame 17 { x: 50.2; y: 119.6; skew-x: 335.9; skew-y: 335.9; scale-x: 0.987; scale-y: 0.987; }
        frame 18 { x: 52.8; y: 120.8; skew-x: 320.9; skew-y: 320.9; scale-x: 0.986; scale-y: 0.986; }
        frame 19 { x: 56.1; y: 122; skew-x: 306.1; skew-y: 306.1; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 57.1; y: 122.7; skew-x: 302.3; skew-y: 302.3; scale-x: 0.984; scale-y: 0.984; }
        frame 21 { x: 58; y: 123.5; skew-x: 298.6; skew-y: 298.6; scale-x: 0.983; scale-y: 0.983; }
        frame 22 { x: 58.9; y: 124.2; skew-x: 294.8; skew-y: 294.8; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 58.6; y: 125.1; skew-x: 289.8; skew-y: 289.8; scale-x: 0.981; scale-y: 0.981; }
        frame 24 { x: 58.5; y: 125.9; skew-x: 284.8; skew-y: 284.8; scale-x: 0.98; scale-y: 0.98; }
        frame 25 { x: 58.4; y: 126.5; skew-x: 280.1; skew-y: 280.1; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 55.2; y: 125; skew-x: 293; skew-y: 293; scale-x: 0.982; scale-y: 0.982; }
        frame 27 { x: 52.4; y: 123.4; skew-x: 306.1; skew-y: 306.1; scale-x: 0.984; scale-y: 0.984; }
        frame 28 { x: 50.1; y: 121.6; skew-x: 318.9; skew-y: 318.9; scale-x: 0.987; scale-y: 0.987; }
        frame 29 { x: 48.3; y: 119.6; skew-x: 331.9; skew-y: 331.9; scale-x: 0.991; scale-y: 0.991; }
        frame 30 { x: 47.3; y: 118.5; skew-x: 340.7; skew-y: 340.7; scale-x: 0.993; scale-y: 0.993; }
        frame 31 { x: 46.6; y: 117.3; skew-x: 349.2; skew-y: 349.2; scale-x: 0.996; scale-y: 0.996; }
        frame 32 { x: 46.1; y: 116.2; skew-x: 357.8; skew-y: 357.8; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: 50.3; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: -10000; skew-x: 357.9; skew-y: 357.9; }
        frame 35 { skew-x: -10000; skew-y: -10000; }
        frame 37 { skew-x: 357.8; skew-y: 357.8; }
        frame 38 { x: 50.1; y: 116.3; skew-x: 356.2; skew-y: 356.2; }
        frame 39 { x: 50; y: 116.6; skew-x: 354.7; skew-y: 354.7; scale-x: 0.998; scale-y: 0.998; }
        frame 40 { x: 49.9; y: 116.7; skew-x: 353.2; skew-y: 353.2; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 49.6; y: 116.9; skew-x: 351.5; skew-y: 351.5; scale-x: 0.999; scale-y: 0.999; }
        frame 42 { x: 49.8; y: 116.5; skew-x: 353.7; skew-y: 353.7; scale-x: 0.998; scale-y: 0.998; }
        frame 43 { x: 50; y: 116.4; skew-x: 355.7; skew-y: 355.7; scale-x: 0.999; scale-y: 0.999; }
        frame 44 { x: 50.3; y: 116.2; skew-x: 357.8; skew-y: 357.8; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: -10000; y: -10000; skew-x: 357.9; skew-y: 357.9; }
        frame 46 { skew-x: -10000; skew-y: -10000; }
        frame 48 { skew-x: 357.8; skew-y: 357.8; }
        frame 49 { x: 50.1; y: 116.3; skew-x: 356.2; skew-y: 356.2; }
        frame 50 { x: 50; y: 116.6; skew-x: 354.7; skew-y: 354.7; scale-x: 0.998; scale-y: 0.998; }
        frame 51 { x: 49.9; y: 116.7; skew-x: 353.2; skew-y: 353.2; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 49.6; y: 116.9; skew-x: 351.5; skew-y: 351.5; scale-x: 0.999; scale-y: 0.999; }
        frame 53 { x: 49.8; y: 116.5; skew-x: 353.7; skew-y: 353.7; scale-x: 0.998; scale-y: 0.998; }
        frame 54 { x: 50; y: 116.4; skew-x: 355.7; skew-y: 355.7; scale-x: 0.999; scale-y: 0.999; }
        frame 55 { x: 50.3; y: 116.2; skew-x: 357.8; skew-y: 357.8; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: -10000; y: -10000; skew-x: 357.9; skew-y: 357.9; }
        frame 57 { skew-x: -10000; skew-y: -10000; }
        frame 59 { skew-x: 357.8; skew-y: 357.8; }
        frame 60 { skew-x: -10000; skew-y: -10000; }
        frame 61 { skew-x: 357.9; skew-y: 357.9; }
        frame 62 { skew-x: -10000; skew-y: -10000; }
        frame 66 { skew-x: 357.8; skew-y: 357.8; }
        frame 67 { x: 51.1; y: 114.8; skew-x: 365; skew-y: 365; scale-x: 0.99; scale-y: 0.988; }
        frame 68 { x: 52.1; y: 113.4; skew-x: 372.3; skew-y: 372.3; scale-x: 0.981; scale-y: 0.977; }
        frame 69 { x: 53; y: 112.3; skew-x: 379.8; skew-y: 379.8; scale-x: 0.971; scale-y: 0.966; }
        frame 70 { x: 54.1; y: 111.2; skew-x: 387.1; skew-y: 387.1; scale-x: 0.964; scale-y: 0.956; }
        frame 71 { x: 56.4; y: 109.3; skew-x: 402.6; skew-y: 402.6; scale-x: 0.961; scale-y: 0.954; }
        frame 72 { x: 58.7; y: 108; skew-x: 417.9; skew-y: 417.9; scale-x: 0.96; scale-y: 0.952; }
        frame 73 { x: 61; y: 107.3; skew-x: 433.3; skew-y: 433.3; scale-x: -10000; scale-y: 0.953; }
        frame 74 { x: 60.4; y: 108.1; skew-x: 431.9; skew-y: 434.5; scale-x: 0.923; scale-y: 0.982; }
        frame 75 { x: 59.9; y: 109; skew-x: 430.5; skew-y: 435.7; scale-x: 0.889; scale-y: 1.012; }
        frame 76 { x: 58.2; y: 109.7; skew-x: 426.9; skew-y: 429.5; scale-x: 0.922; scale-y: 0.98; }
        frame 77 { x: 56.5; y: 110.4; skew-x: 423.2; skew-y: 423.2; scale-x: 0.958; scale-y: 0.951; }
        frame 78 { x: 56; y: 110.3; skew-x: 419.7; skew-y: 419.7; scale-x: 0.956; scale-y: 0.949; }
        frame 79 { x: 55.4; y: 110.1; skew-x: 416.2; skew-y: 416.2; scale-x: 0.957; scale-y: 0.95; }
        frame 80 { x: 55.9; y: 110.6; skew-x: 421.2; skew-y: 421.2; scale-x: 0.956; scale-y: 0.949; }
        frame 81 { x: 56.3; y: 111.2; skew-x: 426; skew-y: 426; scale-x: 0.958; scale-y: 0.95; }
        frame 82 { x: 124.1; y: 26.8; skew-x: 250; skew-y: 250; scale-x: 0.996; scale-y: 0.996; }
        frame 83 { x: 118.1; y: -10000; skew-x: 261; skew-y: 261; scale-x: 0.994; scale-y: 0.994; }
        frame 84 { x: 112.3; y: 26.7; skew-x: 271.8; skew-y: 271.8; scale-x: 0.993; scale-y: 0.993; }
        frame 85 { x: 106.7; y: 26.2; skew-x: 282.9; skew-y: 282.9; scale-x: 0.991; scale-y: 0.991; }
        frame 86 { x: 110.5; y: 10.2; skew-x: 244.1; skew-y: 244.1; scale-x: 0.988; scale-y: 0.988; }
        frame 87 { x: 102.8; y: 4.1; skew-x: 223.7; skew-y: 223.7; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 78.2; y: -7.8; skew-x: 169; skew-y: 169; scale-x: 0.986; scale-y: 0.986; }
        frame 89 { x: 68.5; y: -1.9; skew-x: 133.7; skew-y: 133.7; scale-x: 0.988; scale-y: 0.988; }
        frame 90 { x: 58.7; y: 9.2; skew-x: 88; skew-y: 88; scale-x: 0.985; scale-y: 0.985; }
        frame 91 { x: 45.6; y: 25.2; skew-x: 42.2; skew-y: 42.2; scale-x: 0.982; scale-y: 0.982; }
        frame 92 { x: 44.5; y: 36.5; skew-x: 25.3; skew-y: 25.3; scale-x: 0.979; scale-y: 0.979; }
        frame 93 { x: 43.6; y: 48.4; skew-x: 8.3; skew-y: 8.3; scale-x: 0.978; scale-y: 0.978; }
        frame 94 { x: 41.6; y: 58.3; skew-x: 10.3; skew-y: 10.3; scale-x: 0.976; scale-y: 0.976; }
        frame 95 { x: 39.8; y: 68.1; skew-x: 12.6; skew-y: 12.6; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 46.1; y: 82.7; skew-x: 4.8; skew-y: 4.8; scale-x: 0.975; scale-y: 0.975; }
        frame 97 { x: 52.4; y: 97.3; skew-x: -2.6; skew-y: -2.6; scale-x: 0.974; scale-y: 0.974; }
        frame 98 { x: 52.1; y: 105.4; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 51.8; y: 113.5; skew-x: -2.5; skew-y: -2.5; }
        frame 100 { x: 51.5; y: -10000; skew-x: -2.4; skew-y: -2.4; }
        frame 101 { x: 51.2; skew-x: -2.6; skew-y: -2.6; }
        frame 102 { x: 50.6; y: 114.9; skew-x: -2.4; skew-y: -2.4; }
        frame 103 { x: 50.1; y: 116.3; skew-x: -2.5; skew-y: -2.5; }
    }
    Track {
        source-name: "Zombie_imp_outerleg_lower";
        frame-count: 104;
        frame 0 { x: 49.1; y: 109.7; skew-x: 351.2; skew-y: 351.2; scale-x: 0.999; scale-y: 1.229; image: IMAGE_REANIM_ZOMBIE_IMP_OUTERLEG_LOWER; }
        frame 1 { x: 47.4; y: 109; skew-x: 352; skew-y: 352; scale-x: 0.998; scale-y: 1.227; image: none; }
        frame 2 { x: 45.5; y: 108.4; skew-x: 352.5; skew-y: 352.5; scale-x: -10000; scale-y: 1.226; }
        frame 3 { x: 43.7; y: 107.7; skew-x: 353.1; skew-y: 353.1; scale-x: 0.997; scale-y: -10000; }
        frame 4 { x: 42.8; y: 107.5; skew-x: 359.2; skew-y: 359.2; scale-x: 0.996; scale-y: 1.225; }
        frame 5 { x: 41.9; y: -10000; skew-x: 365; skew-y: 365; scale-x: 0.995; scale-y: 1.223; }
        frame 6 { x: 41.2; y: 107.2; skew-x: 371.1; skew-y: 371.1; scale-x: 0.994; scale-y: 1.222; }
        frame 7 { x: 41.1; y: 108.6; skew-x: 360.5; skew-y: 360.5; scale-x: -10000; scale-y: 1.223; }
        frame 8 { x: 41.4; y: 110.2; skew-x: 350.2; skew-y: 350.2; scale-y: 1.222; }
        frame 9 { x: 41.8; y: 112.1; skew-x: 339.8; skew-y: 339.8; scale-x: 0.995; scale-y: 1.223; }
        frame 10 { x: 42.4; y: 112.4; skew-x: 339.2; skew-y: 339.2; scale-x: 0.994; scale-y: 1.221; }
        frame 11 { x: 43; y: 112.5; skew-x: 338.5; skew-y: 338.5; scale-x: 0.993; scale-y: -10000; }
        frame 12 { x: 43.7; y: 112.7; skew-x: 337.7; skew-y: 337.7; scale-x: -10000; }
        frame 13 { x: 44.3; y: 112.8; skew-x: 337.1; skew-y: 337.1; scale-x: 0.994; scale-y: 1.222; }
        frame 14 { x: 45.3; y: 113.5; skew-x: 332.7; skew-y: 332.7; scale-x: 0.992; scale-y: 1.22; }
        frame 15 { x: 46.2; y: 114.1; skew-x: 328.2; skew-y: 328.2; scale-x: -10000; scale-y: 1.219; }
        frame 16 { x: 47.3; y: 114.7; skew-x: 323.8; skew-y: 323.8; scale-x: 0.993; scale-y: 1.221; }
        frame 17 { x: 48.6; y: 114.2; skew-x: 319.6; skew-y: 319.6; scale-x: 0.991; scale-y: 1.218; }
        frame 18 { x: 50.1; y: 113.5; skew-x: 315.4; skew-y: 315.4; scale-x: 0.99; scale-y: 1.217; }
        frame 19 { x: 51.5; y: 112.8; skew-x: 311.3; skew-y: 311.3; scale-x: -10000; scale-y: 1.218; }
        frame 20 { x: 51.8; y: 113.9; skew-x: 307.6; skew-y: 307.6; scale-x: 0.988; scale-y: 1.214; }
        frame 21 { x: 52.3; y: 115; skew-x: 303.8; skew-y: 303.8; scale-x: 0.987; scale-y: 1.213; }
        frame 22 { x: 52.6; y: 116.1; skew-x: 300; skew-y: 300.1; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 52.2; y: 116.9; skew-x: 298.3; skew-y: 298.3; scale-x: 0.985; scale-y: 1.211; }
        frame 24 { x: 51.7; y: 117.7; skew-x: 296.5; skew-y: 296.5; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 51.4; y: 118.6; skew-x: 294.8; skew-y: 294.8; scale-x: 0.986; scale-y: 1.212; }
        frame 26 { x: 50.5; y: 117.1; skew-x: 304.1; skew-y: 304.1; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 49.7; y: 115.5; skew-x: 313.6; skew-y: 313.6; scale-x: 0.988; scale-y: 1.214; }
        frame 28 { x: 49.4; y: 113.9; skew-x: 323.1; skew-y: 323.1; scale-x: 0.99; scale-y: 1.217; }
        frame 29 { x: 49; y: 112.4; skew-x: 332.4; skew-y: 332.4; scale-x: 0.993; scale-y: 1.221; }
        frame 30 { y: 111.4; skew-x: 338.7; skew-y: 338.7; scale-x: 0.994; scale-y: 1.222; }
        frame 31 { x: 49.1; y: 110.5; skew-x: 345; skew-y: 345; scale-x: 0.997; scale-y: 1.225; }
        frame 32 { x: -10000; y: 109.7; skew-x: 351.2; skew-y: 351.2; scale-x: 0.999; scale-y: 1.229; }
        frame 33 { x: 52.6; y: -10000; skew-x: 352; skew-y: 352; scale-x: 0.998; scale-y: 1.228; }
        frame 34 { x: -10000; y: 109.8; skew-x: 351.4; skew-y: 351.4; scale-x: -10000; scale-y: 1.227; }
        frame 35 { x: 52.4; y: 109.9; skew-x: 350.7; skew-y: 350.7; scale-y: -10000; }
        frame 36 { x: 52.3; y: 110; skew-x: 350; skew-y: 350; }
        frame 37 { x: 52.1; y: 110.1; skew-x: 349.2; skew-y: 349.2; }
        frame 38 { x: 52.4; y: 109.3; skew-x: 351.4; skew-y: 351.4; scale-y: 1.238; }
        frame 39 { x: 52.6; y: 108.6; skew-x: 353.5; skew-y: 353.5; scale-y: 1.249; }
        frame 40 { x: 52.9; y: 108; skew-x: 355.5; skew-y: 355.5; scale-y: 1.26; }
        frame 41 { x: 53.3; y: 107.2; skew-x: 357.5; skew-y: 357.5; scale-y: 1.271; }
        frame 42 { x: 52.5; y: 108.7; skew-x: 351.7; skew-y: 351.7; scale-y: 1.256; }
        frame 43 { x: 51.9; y: 110.4; skew-x: 345.9; skew-y: 345.9; scale-x: 0.997; scale-y: 1.241; }
        frame 44 { x: 51.1; y: 112.1; skew-x: 339.9; skew-y: 339.9; scale-x: 0.998; scale-y: 1.227; }
        frame 45 { x: 51.5; y: 111.4; skew-x: 343; skew-y: 343; scale-x: 0.997; scale-y: 1.226; }
        frame 46 { x: 51.9; y: 110.9; skew-x: 346; skew-y: 346; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 52.2; y: 110.3; skew-x: 349; skew-y: 349; scale-x: 0.998; scale-y: 1.227; }
        frame 48 { x: 52.6; y: 109.7; skew-x: 352; skew-y: 352; scale-x: -10000; scale-y: 1.228; }
        frame 49 { x: 52.8; y: 109.1; skew-x: 353.5; skew-y: 353.5; scale-y: 1.238; }
        frame 50 { x: 53; y: 108.5; skew-x: 354.9; skew-y: 354.9; scale-y: 1.249; }
        frame 51 { x: 53.1; y: 107.8; skew-x: 356.2; skew-y: 356.2; scale-y: 1.26; }
        frame 52 { x: 53.3; y: 107.2; skew-x: 357.5; skew-y: 357.5; scale-y: 1.271; }
        frame 53 { x: 52.5; y: 108.7; skew-x: 351.7; skew-y: 351.7; scale-y: 1.256; }
        frame 54 { x: 51.9; y: 110.4; skew-x: 345.9; skew-y: 345.9; scale-x: 0.997; scale-y: 1.241; }
        frame 55 { x: 51.1; y: 112.1; skew-x: 339.9; skew-y: 339.9; scale-x: 0.998; scale-y: 1.227; }
        frame 56 { x: 51.5; y: 111.4; skew-x: 343; skew-y: 343; scale-x: 0.997; scale-y: 1.226; }
        frame 57 { x: 51.9; y: 110.9; skew-x: 346; skew-y: 346; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 52.2; y: 110.3; skew-x: 349; skew-y: 349; scale-x: 0.998; scale-y: 1.227; }
        frame 59 { x: 52.6; y: 109.7; skew-x: 352; skew-y: 352; scale-x: -10000; scale-y: 1.228; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 61 { x: 52.7; skew-x: 352.2; skew-y: 352.2; scale-y: 1.227; }
        frame 62 { x: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 66 { x: 52.6; skew-x: 352; skew-y: 352; scale-y: 1.228; }
        frame 67 { x: 53.8; skew-x: 357.2; skew-y: 357.2; scale-y: 1.227; }
        frame 68 { x: 55; y: 109.8; skew-x: 362.3; skew-y: 362.3; scale-y: -10000; }
        frame 69 { x: 56.1; y: 109.9; skew-x: 367.5; skew-y: 367.5; scale-x: 0.997; scale-y: 1.226; }
        frame 70 { x: 57.3; y: 110; skew-x: 372.8; skew-y: 372.8; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 60.3; y: 108.4; skew-x: 390.6; skew-y: 390.6; scale-x: 0.995; scale-y: 1.223; }
        frame 72 { x: 63.4; y: 107.7; skew-x: 408.6; skew-y: 408.6; scale-x: 0.994; scale-y: 1.222; }
        frame 73 { x: 66.5; y: 108; skew-x: 426.4; skew-y: 426.4; scale-x: -10000; scale-y: 1.223; }
        frame 74 { x: 66.1; y: 108.9; skew-x: 424.7; skew-y: 428.2; scale-x: 0.963; scale-y: 1.252; }
        frame 75 { x: 65.8; y: 109.6; skew-x: 422.7; skew-y: 429.7; scale-x: 0.934; scale-y: 1.285; }
        frame 76 { x: 65; y: 110.3; skew-x: 421.9; skew-y: 425.4; scale-x: 0.962; scale-y: 1.251; }
        frame 77 { x: 64.1; y: 110.7; skew-x: 421.1; skew-y: 421.1; scale-x: 0.993; scale-y: 1.22; }
        frame 78 { x: 63.6; y: 110.1; skew-x: 417.7; skew-y: 417.7; scale-x: 0.991; scale-y: 1.218; }
        frame 79 { x: 63.1; y: 109.4; skew-x: 414.1; skew-y: 414.1; scale-x: 0.992; scale-y: 1.219; }
        frame 80 { x: 63.6; y: 110.7; skew-x: 419.1; skew-y: 419.1; scale-x: 0.991; scale-y: 1.218; }
        frame 81 { x: 63.9; y: 111.9; skew-x: 423.9; skew-y: 423.9; scale-x: 0.992; scale-y: 1.22; }
        frame 82 { x: 114.2; y: 22.2; skew-x: 273.3; skew-y: 273.3; scale-x: 0.994; scale-y: 0.994; }
        frame 83 { x: 109.5; y: 20.6; skew-x: 284.3; skew-y: 284.3; scale-x: 0.991; scale-y: 0.993; }
        frame 84 { x: 105.2; y: 18.9; skew-x: 295.3; skew-y: 295.3; scale-x: 0.988; scale-y: 0.991; }
        frame 85 { x: 100.9; y: 17; skew-x: 306.3; skew-y: 306.5; scale-x: 0.986; scale-y: 0.992; }
        frame 86 { x: 101.2; y: 6.8; skew-x: 267.2; skew-y: 267.5; scale-x: 0.984; scale-y: 0.99; }
        frame 87 { x: 91.9; y: 4.3; skew-x: 247.1; skew-y: 247.3; scale-x: 0.983; scale-y: 0.989; }
        frame 88 { x: 72.4; y: 0.9; skew-x: 192.3; skew-y: 192.5; scale-x: 0.98; scale-y: 0.986; }
        frame 89 { x: 68.7; y: 8.8; skew-x: 157.1; skew-y: 157.2; scale-x: 0.983; scale-y: 0.989; }
        frame 90 { x: 64.7; y: 15.6; skew-x: 111.3; skew-y: 111.5; scale-x: 0.979; scale-y: 0.985; }
        frame 91 { x: 56.2; y: 24.6; skew-x: 65.6; skew-y: 65.8; scale-x: 0.977; scale-y: 0.983; }
        frame 92 { x: 52; y: 33.4; skew-x: 37.1; skew-y: 37.3; scale-x: 0.974; scale-y: 0.98; }
        frame 93 { x: 48.1; y: 44.1; skew-x: 8.7; skew-y: 8.9; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 45.3; y: 54.5; skew-x: 7; skew-y: 7.1; scale-x: 0.98; scale-y: 0.99; }
        frame 95 { x: 42.4; y: 64.8; skew-x: 5.3; skew-y: 5.6; scale-x: 0.986; scale-y: 1.001; }
        frame 96 { x: 47.3; y: 79.8; skew-x: -5.9; skew-y: -5.7; scale-x: 0.991; scale-y: 1.011; }
        frame 97 { x: 52.4; y: 94.8; skew-x: -17.3; skew-y: -17.1; scale-x: 0.997; scale-y: 1.022; }
        frame 98 { x: 52.8; y: 101.9; skew-x: -15.2; skew-y: -15.2; scale-x: 0.995; scale-y: 1.02; }
        frame 99 { x: 53.1; y: 109; skew-x: -13.5; skew-y: -13.4; scale-x: 0.994; scale-y: 1.019; }
        frame 100 { x: 51.4; y: 112.3; skew-x: -27.9; skew-y: -27.7; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 50.1; y: 115.7; skew-x: -42.4; skew-y: -42.2; scale-x: 0.996; scale-y: 1.021; }
        frame 102 { x: 50.6; y: 113.1; skew-x: -25.7; skew-y: -25.5; scale-x: 0.994; scale-y: 1.055; }
        frame 103 { x: 51.8; y: 110.5; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: 1.092; }
    }
    Track {
        source-name: "Zombie_imp_outerleg_upper";
        frame-count: 104;
        frame 0 { x: 51.9; y: 99.1; skew-x: 17.3; skew-y: 17.3; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZOMBIE_IMP_OUTERLEG_UPPER; }
        frame 1 { x: 51.3; y: 98.1; skew-x: 21.1; skew-y: 21.1; scale-x: 0.997; scale-y: 0.997; image: none; }
        frame 2 { x: 50.8; y: 97.2; skew-x: 25; skew-y: 25; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 50.3; y: 96.2; skew-x: 28.9; skew-y: 28.9; scale-x: 0.998; scale-y: 0.998; }
        frame 4 { x: 50; y: 96.8; skew-x: 32.3; skew-y: 32.3; scale-x: 0.996; scale-y: 0.996; }
        frame 5 { x: 49.7; y: 97.5; skew-x: 35.6; skew-y: 35.6; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 49.3; y: 98.3; skew-x: 39.2; skew-y: 39.2; scale-x: 0.997; scale-y: 0.997; }
        frame 7 { x: 50.6; y: 99; skew-x: 40.9; skew-y: 40.9; scale-x: 0.996; scale-y: 0.996; }
        frame 8 { x: 52; y: 99.8; skew-x: 42.6; skew-y: 42.6; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 53.3; y: 100.5; skew-x: 44.2; skew-y: 44.2; scale-x: 0.997; scale-y: 0.997; }
        frame 10 { x: 53.1; y: 100.2; skew-x: 41.1; skew-y: 41.1; scale-x: 0.995; scale-y: 1.015; }
        frame 11 { x: 52.9; y: 99.9; skew-x: 38.1; skew-y: 38.1; scale-x: -10000; scale-y: 1.035; }
        frame 12 { x: 52.6; y: 99.7; skew-x: 35.1; skew-y: 35.1; scale-y: 1.054; }
        frame 13 { x: 52.5; y: 99.5; skew-x: 32.1; skew-y: 32.1; scale-x: 0.997; scale-y: 1.075; }
        frame 14 { x: 52.4; y: 99.3; skew-x: 28.1; skew-y: 28.1; scale-x: 0.995; scale-y: 1.047; }
        frame 15 { x: 52.3; y: 99.2; skew-x: 24.1; skew-y: 24.1; scale-x: 0.994; scale-y: 1.021; }
        frame 16 { x: -10000; y: 99; skew-x: 20.1; skew-y: 20.1; scale-x: 0.995; scale-y: 0.995; }
        frame 17 { x: 52; skew-x: 13.5; skew-y: 13.5; scale-x: 0.994; scale-y: 0.994; }
        frame 18 { x: 51.9; y: 99.1; skew-x: 6.8; skew-y: 6.8; scale-x: 0.993; scale-y: 0.993; }
        frame 19 { x: -10000; y: 99.3; skew-x: 0.4; skew-y: 0.4; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 52; y: 99.9; skew-x: -0.2; skew-y: -0.2; scale-x: 0.992; scale-y: 0.992; }
        frame 21 { x: 52.3; y: 100.4; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 52.4; y: 101; skew-x: -1.4; skew-y: -1.4; scale-x: 0.991; scale-y: 0.991; }
        frame 23 { x: 52.1; y: 101.9; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 51.8; y: 102.6; skew-x: -2.4; skew-y: -2.4; }
        frame 25 { x: 51.6; y: 103.4; skew-x: -3; skew-y: -3; }
        frame 26 { x: -10000; y: 102.6; skew-x: 0.3; skew-y: 0.3; scale-x: 0.992; scale-y: 0.992; }
        frame 27 { x: 51.8; y: 101.8; skew-x: 3.8; skew-y: 3.8; scale-x: 0.993; scale-y: 0.993; }
        frame 28 { x: -10000; y: 101; skew-x: 7.3; skew-y: 7.3; scale-x: 0.994; scale-y: 0.994; }
        frame 29 { x: 52; y: 100.3; skew-x: 10.8; skew-y: 10.8; scale-x: 0.996; scale-y: 0.996; }
        frame 30 { y: 99.8; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 52.1; y: 99.4; skew-x: 15; skew-y: 15; scale-x: 0.997; scale-y: 0.997; }
        frame 32 { x: 51.9; y: 99.1; skew-x: 17.3; skew-y: 17.3; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: 53.6; y: 100.3; skew-x: 4.2; skew-y: 4.2; scale-x: 0.998; scale-y: 0.998; }
        frame 34 { x: 53.7; y: 100.2; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 53.8; y: 100; skew-x: 6.8; skew-y: 6.8; scale-x: 0.997; scale-y: 0.997; }
        frame 36 { x: -10000; y: -10000; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 53.9; y: 99.8; skew-x: 9.8; skew-y: 9.8; scale-x: 0.998; scale-y: 0.998; }
        frame 38 { x: 53.7; y: 99.7; skew-x: 7.5; skew-y: 7.5; scale-x: 0.997; scale-y: 0.997; }
        frame 39 { x: 53.5; y: -10000; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 53.3; y: 99.6; skew-x: 3.3; skew-y: 3.3; scale-x: 0.998; scale-y: 0.998; }
        frame 41 { x: 53.1; y: -10000; skew-x: 1.2; skew-y: 1.2; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 53.3; y: 100.1; skew-x: 5.3; skew-y: 5.3; scale-x: 0.997; scale-y: 0.997; }
        frame 43 { x: 53.5; y: 100.5; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 53.6; y: 101; skew-x: 13.8; skew-y: 13.8; }
        frame 45 { x: 53.5; y: 100.9; skew-x: 11.3; skew-y: 11.3; }
        frame 46 { x: 53.6; y: 100.7; skew-x: 9; skew-y: 9; }
        frame 47 { x: -10000; y: 100.5; skew-x: 6.5; skew-y: 6.5; }
        frame 48 { y: 100.3; skew-x: 4.2; skew-y: 4.2; scale-x: 0.998; scale-y: 0.998; }
        frame 49 { x: 53.5; y: 100.2; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 53.4; y: 100; skew-x: 2.6; skew-y: 2.6; }
        frame 51 { x: 53.3; y: 99.8; skew-x: 1.8; skew-y: 1.8; }
        frame 52 { x: 53.1; y: 99.6; skew-x: 1.2; skew-y: 1.2; }
        frame 53 { x: 53.3; y: 100.1; skew-x: 5.3; skew-y: 5.3; scale-x: 0.997; scale-y: 0.997; }
        frame 54 { x: 53.5; y: 100.5; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 53.6; y: 101; skew-x: 13.8; skew-y: 13.8; }
        frame 56 { x: 53.5; y: 100.9; skew-x: 11.3; skew-y: 11.3; }
        frame 57 { x: 53.6; y: 100.7; skew-x: 9; skew-y: 9; }
        frame 58 { x: -10000; y: 100.5; skew-x: 6.5; skew-y: 6.5; }
        frame 59 { y: 100.3; skew-x: 4.2; skew-y: 4.2; scale-x: 0.998; scale-y: 0.998; }
        frame 60 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 54.9; y: 100; skew-x: 9.8; skew-y: 10; scale-y: 1.014; }
        frame 62 { x: 56.3; y: 99.9; skew-x: 15.3; skew-y: 15.8; scale-x: 0.997; scale-y: 1.031; }
        frame 63 { x: 57.9; y: 99.7; skew-x: 20.8; skew-y: 21.8; scale-x: -10000; scale-y: 1.047; }
        frame 64 { x: 59.4; y: 99.6; skew-x: 26.3; skew-y: 27.6; scale-y: 1.064; }
        frame 65 { x: 61; y: 99.7; skew-x: 31.8; skew-y: 33.6; scale-y: 1.08; }
        frame 66 { x: 62.7; y: 99.8; skew-x: 37.5; skew-y: 39.4; scale-x: 0.999; scale-y: 1.099; }
        frame 67 { x: 67.2; y: 102.1; skew-x: 53.1; skew-y: 55.7; scale-x: 0.982; scale-y: 1.07; }
        frame 68 { x: 71.5; y: 105.2; skew-x: 68.7; skew-y: 72; scale-x: 0.968; scale-y: 1.045; }
        frame 69 { x: 75.3; y: 108.7; skew-x: 84.5; skew-y: 88.4; scale-x: 0.953; scale-y: 1.019; }
        frame 70 { x: 78.3; y: 112.6; skew-x: 100; skew-y: 104.6; scale-x: 0.938; scale-y: 0.993; }
        frame 71 { x: 79.1; y: 114.8; skew-x: 109.3; skew-y: 112.3; scale-x: 0.906; scale-y: 1.022; }
        frame 72 { x: 79.7; y: 117.1; skew-x: 118.6; skew-y: 120.1; scale-x: 0.875; scale-y: 1.052; }
        frame 73 { x: 80; y: 119.4; skew-x: 127.9; skew-y: 127.9; scale-x: 0.845; scale-y: 1.084; }
        frame 74 { x: 80.2; y: 119.6; skew-x: 130.3; skew-y: 125.6; scale-x: 0.834; scale-y: 1.091; }
        frame 75 { x: 80.3; y: 119.9; skew-x: 132.6; skew-y: 123.4; scale-x: 0.825; scale-y: 1.101; }
        frame 76 { x: 80.1; y: 118.4; skew-x: 120.6; skew-y: 116; scale-x: 0.833; scale-y: 1.091; }
        frame 77 { x: 79.5; y: 116.9; skew-x: 108.6; skew-y: 108.6; scale-x: 0.844; scale-y: 1.082; }
        frame 78 { x: 79.6; y: 116.6; skew-x: 111.3; skew-y: 111.3; scale-x: 0.843; scale-y: 1.081; }
        frame 79 { x: -10000; y: 116.3; skew-x: 114.1; skew-y: 114.1; scale-x: 0.844; scale-y: 1.082; }
        frame 80 { x: 79; y: 117.4; skew-x: 109.8; skew-y: 109.8; scale-x: 0.756; scale-y: 1.081; }
        frame 81 { x: 78.6; y: 118.4; skew-x: 105.8; skew-y: 105.8; scale-x: 0.67; scale-y: 1.082; }
        frame 82 { x: 103.4; y: 16.6; skew-x: -58.7; skew-y: -58.7; scale-x: 0.995; scale-y: 0.995; }
        frame 83 { x: 100.2; y: 13.2; skew-x: -47.8; skew-y: -47.8; scale-x: 0.991; scale-y: 0.993; }
        frame 84 { x: 97.4; y: 9.8; skew-x: -36.5; skew-y: -36.7; scale-x: 0.989; scale-y: 0.992; }
        frame 85 { x: 94.9; y: 6.5; skew-x: -25.6; skew-y: -25.7; scale-x: 0.987; scale-y: 0.993; }
        frame 86 { x: 91; y: 2.6; skew-x: -64.6; skew-y: -64.6; scale-x: 0.984; scale-y: 0.99; }
        frame 87 { x: 79.8; y: 4.2; skew-x: -84.8; skew-y: -85; scale-x: 0.985; scale-y: -10000; }
        frame 88 { x: 65.7; y: 11.2; skew-x: -139.5; skew-y: -139.7; scale-x: 0.981; scale-y: 0.987; }
        frame 89 { x: 68.6; y: 21; skew-x: -174.8; skew-y: -175; scale-x: 0.985; scale-y: 0.99; }
        frame 90 { x: 71.7; y: 23; skew-x: -220.5; skew-y: -220.7; scale-x: 0.98; scale-y: 0.986; }
        frame 91 { x: 68.3; y: 24.6; skew-x: -266.3; skew-y: -266.5; scale-x: 0.978; scale-y: 0.984; }
        frame 92 { x: 63.6; y: 29.1; skew-x: -287.7; skew-y: -287.7; scale-x: 0.976; scale-y: 0.982; }
        frame 93 { x: 58.1; y: 34.8; skew-x: -309.1; skew-y: -309.3; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 54.3; y: 44.6; skew-x: -313.8; skew-y: -314; scale-x: 0.973; scale-y: 0.979; }
        frame 95 { x: 50.6; y: 54.5; skew-x: -318.3; skew-y: -318.5; scale-x: 0.974; scale-y: -10000; }
        frame 96 { x: 52.6; y: 68.2; skew-x: -332.6; skew-y: -332.8; scale-x: 0.973; scale-y: 0.978; }
        frame 97 { x: 54.9; y: 82.4; skew-x: -347; skew-y: -347.2; scale-x: 0.974; scale-y: 0.98; }
        frame 98 { x: 55.4; y: 89.7; skew-x: -347.1; skew-y: -347.4; scale-x: 0.972; scale-y: 0.978; }
        frame 99 { x: 55.9; y: 97; skew-x: -347.2; skew-y: -10000; scale-x: 0.971; scale-y: 0.977; }
        frame 100 { x: 57.1; y: 98.4; skew-x: -335.1; skew-y: -335.1; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 58.6; y: 100.2; skew-x: -322.7; skew-y: -322.8; scale-x: 0.973; scale-y: 0.978; }
        frame 102 { x: 56; y: 99.9; skew-x: -336.6; skew-y: -336.6; scale-x: 0.971; scale-y: 0.977; }
        frame 103 { x: 53.4; y: 100.1; skew-x: -350.2; skew-y: -350.4; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 104;
        frame 0 { x: 34.3; y: 41.9; skew-x: 12.6; skew-y: 12.6; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZOMBIE_IMP_HEAD; }
        frame 1 { x: 36.5; y: 40.3; skew-x: 15.3; skew-y: 15.3; scale-x: 0.998; scale-y: 0.998; image: none; }
        frame 2 { x: 38.8; y: 38.8; skew-x: 18.3; skew-y: 18.3; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 41.1; y: 37.5; skew-x: 21.1; skew-y: 21.1; scale-x: 0.999; scale-y: 0.999; }
        frame 4 { x: 42.4; y: 37.3; skew-x: 25.6; skew-y: 25.6; scale-x: 0.997; scale-y: 0.997; }
        frame 5 { x: 35.4; y: 41; skew-x: 15.8; skew-y: 15.8; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 28.6; y: 45.3; skew-x: 6.3; skew-y: 6.3; scale-x: 0.999; scale-y: 0.999; }
        frame 7 { x: 25.1; y: 48.9; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 21.8; y: 52.5; skew-x: -2.5; skew-y: -2.5; scale-x: 0.998; scale-y: 0.998; }
        frame 9 { x: 18.5; y: 56.3; skew-x: -7.2; skew-y: -7.2; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 18.7; y: 56.7; skew-x: -8; skew-y: -8; scale-x: 0.997; scale-y: 0.997; }
        frame 11 { x: 18.8; y: 57.1; skew-x: -9; skew-y: -9; scale-x: 0.998; scale-y: 0.998; }
        frame 12 { x: 21; y: 54.4; skew-x: -5.4; skew-y: -5.4; scale-x: 0.997; scale-y: 0.997; }
        frame 13 { x: 23.1; y: 51.6; skew-x: -1.8; skew-y: -1.8; scale-x: 0.998; scale-y: 0.998; }
        frame 14 { x: 26.7; y: 48.4; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 30.4; y: 45.2; skew-x: 7.6; skew-y: 7.6; }
        frame 16 { x: 34.3; y: 42.1; skew-x: 12.6; skew-y: 12.6; scale-x: 0.999; scale-y: 0.999; }
        frame 17 { x: 37.4; y: 40.5; skew-x: 16.3; skew-y: 16.3; scale-x: 0.998; scale-y: 0.998; }
        frame 18 { x: 40.6; y: 39; skew-x: 20.3; skew-y: 20.3; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 44; y: 37.6; skew-x: 24.1; skew-y: 24.1; scale-x: 0.999; scale-y: 0.999; }
        frame 20 { x: 42.6; y: 37.9; skew-x: 25.6; skew-y: 25.6; scale-x: 0.997; scale-y: 0.997; }
        frame 21 { x: 35.4; y: 42; skew-x: 15.8; skew-y: 15.8; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 28.6; y: 46.6; skew-x: 6.3; skew-y: 6.3; scale-x: 0.999; scale-y: 0.999; }
        frame 23 { x: 25; y: 49.8; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 21.8; y: 52.9; skew-x: -2.5; skew-y: -2.5; scale-x: 0.998; scale-y: 0.998; }
        frame 25 { x: 18.5; y: 56.3; skew-x: -7.2; skew-y: -7.2; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 19; y: 56.4; skew-x: -8; skew-y: -8; scale-x: 0.997; scale-y: 0.997; }
        frame 27 { x: 19.3; y: 56.6; skew-x: -9; skew-y: -9; scale-x: 0.998; scale-y: 0.998; }
        frame 28 { x: 24; y: 51.1; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 28.8; y: 45.9; skew-x: 5.8; skew-y: 5.8; scale-x: 0.999; scale-y: 0.999; }
        frame 30 { x: 30.5; y: 44.5; skew-x: 8; skew-y: 8; scale-x: 0.998; scale-y: 0.998; }
        frame 31 { x: 32.4; y: 43.2; skew-x: 10.3; skew-y: 10.3; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 34.3; y: 41.9; skew-x: 12.6; skew-y: 12.6; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: 29.9; y: 46.3; skew-x: 3; skew-y: 3; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 31.4; y: 45.6; skew-x: 4.5; skew-y: 4.5; scale-x: 0.998; scale-y: 0.998; }
        frame 35 { x: 32.9; y: 45; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 34.5; y: 44.4; skew-x: 7.8; skew-y: 7.8; }
        frame 37 { x: 36; y: 43.8; skew-x: 9.6; skew-y: 9.6; }
        frame 38 { x: 37.6; y: 42.7; skew-x: 11.5; skew-y: 11.5; }
        frame 39 { x: 39.3; y: 41.6; skew-x: 13.5; skew-y: 13.5; scale-x: 0.997; scale-y: 0.997; }
        frame 40 { x: 40.9; y: 40.6; skew-x: 15.6; skew-y: 15.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 42.7; y: 39.6; skew-x: 17.7; skew-y: 17.7; scale-x: 0.998; scale-y: 0.998; }
        frame 42 { x: 33; y: 44.8; skew-x: 7.3; skew-y: 7.3; scale-x: 0.997; scale-y: 0.997; }
        frame 43 { x: 23.9; y: 50.6; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 14.4; y: 58.5; skew-x: -12.7; skew-y: -14.4; scale-x: 1.024; scale-y: 0.968; }
        frame 45 { x: 18.7; y: 55.5; skew-x: -8.9; skew-y: -9.7; scale-x: 1.01; scale-y: 0.982; }
        frame 46 { x: 23.2; y: 52.6; skew-x: -5.2; skew-y: -5.2; scale-x: 0.997; scale-y: 0.997; }
        frame 47 { x: 29.5; y: 48.1; skew-x: 2; skew-y: 2; scale-x: 0.998; scale-y: 0.998; }
        frame 48 { x: 36; y: 43.8; skew-x: 9.6; skew-y: 9.6; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 37.6; y: 42.5; skew-x: 11.5; skew-y: 11.5; }
        frame 50 { x: 39.3; y: 41.2; skew-x: 13.5; skew-y: 13.5; scale-x: 0.997; scale-y: 0.997; }
        frame 51 { x: 40.9; y: 40; skew-x: 15.6; skew-y: 15.6; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 42.7; y: 38.7; skew-x: 17.7; skew-y: 17.7; scale-x: 0.998; scale-y: 0.998; }
        frame 53 { x: 33.1; y: 44.3; skew-x: 7.3; skew-y: 7.3; scale-x: 0.997; scale-y: 0.997; }
        frame 54 { x: 23.9; y: 50.6; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 14.4; y: 58.5; skew-x: -12.7; skew-y: -14.4; scale-x: 1.024; scale-y: 0.968; }
        frame 56 { x: 18; y: 55.7; skew-x: -9.7; skew-y: -10.4; scale-x: 1.01; scale-y: 0.982; }
        frame 57 { x: 21.8; y: 53.1; skew-x: -6.7; skew-y: -6.7; scale-x: 0.997; scale-y: 0.997; }
        frame 58 { x: 25.9; y: 49.6; skew-x: -1.7; skew-y: -1.7; scale-x: 0.998; scale-y: 0.998; }
        frame 59 { x: 29.9; y: 46.3; skew-x: 3; skew-y: 3; scale-x: 0.999; scale-y: 0.999; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 61 { cel: -10000; }
        frame 82 { x: 41.1; y: 16.1; skew-x: -51.6; skew-y: -51.6; scale-x: 0.987; scale-y: 0.987; cel: 0; }
        frame 83 { x: 45.9; y: 28.6; skew-x: -73.1; skew-y: -73.1; scale-x: 0.985; scale-y: 0.985; cel: -10000; }
        frame 84 { x: 53.9; y: 39.6; skew-x: -94.4; skew-y: -94.4; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 64.3; y: 47.9; skew-x: -115.9; skew-y: -115.9; scale-x: 0.984; scale-y: 0.984; }
        frame 86 { x: 82.6; y: 53; skew-x: -145.5; skew-y: -145.5; scale-x: 0.981; scale-y: 0.981; }
        frame 87 { x: 99.7; y: 51.4; skew-x: -175.1; skew-y: -175.1; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 118.3; y: 27.1; skew-x: -220; skew-y: -220; scale-x: 0.98; scale-y: 0.98; }
        frame 89 { x: 115.8; y: 1; skew-x: -265.1; skew-y: -265.1; scale-x: 0.981; scale-y: 0.981; }
        frame 90 { x: 113.7; y: -5.7; skew-x: -273.5; skew-y: -273.5; scale-x: 0.98; scale-y: 0.98; }
        frame 91 { x: 111; y: -12.4; skew-x: -282.2; skew-y: -282.2; scale-x: 0.978; scale-y: 0.978; }
        frame 92 { x: 101.1; y: -13.3; skew-x: -287.2; skew-y: -287.2; scale-x: 0.977; scale-y: 0.977; }
        frame 93 { x: 91.1; y: -14.2; skew-x: -292.5; skew-y: -292.5; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 83.9; y: -6.1; skew-x: -295.7; skew-y: -295.7; scale-x: 0.974; scale-y: 0.974; }
        frame 95 { x: 76.6; y: 1.9; skew-x: -299; skew-y: -299; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 65.3; y: 11.4; skew-x: -312; skew-y: -312; scale-x: 0.973; scale-y: 0.973; }
        frame 97 { x: 53.8; y: 22.3; skew-x: -325.3; skew-y: -325.3; scale-x: 0.974; scale-y: 0.974; }
        frame 98 { x: 43.1; y: 31.4; skew-x: -339.1; skew-y: -339.1; scale-x: 0.972; scale-y: 0.972; }
        frame 99 { x: 32.9; y: 41.6; skew-x: -352.9; skew-y: -352.9; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 23.8; y: 53.1; skew-x: -366.4; skew-y: -366.4; }
        frame 101 { x: 15.6; y: 65.7; skew-x: -380.2; skew-y: -380.2; }
        frame 102 { x: 22.3; y: 55.8; skew-x: -368.9; skew-y: -368.9; scale-x: 0.971; scale-y: 0.971; }
        frame 103 { x: 29.7; y: 46.5; skew-x: -357.9; skew-y: -357.9; scale-x: 0.972; scale-y: 0.972; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 104;
        frame 0 { x: 34; y: 66.4; skew-x: 8.8; skew-y: 8.8; scale-x: 0.999; scale-y: 0.999; image: IMAGE_REANIM_ZOMBIE_IMP_JAW; }
        frame 1 { x: 34.6; y: 65.7; skew-x: 9.3; skew-y: 9.3; scale-x: 0.998; scale-y: 0.998; image: none; }
        frame 2 { x: 35.3; y: 64.9; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 35.9; y: 64.1; skew-x: 10.8; skew-y: 10.8; }
        frame 4 { x: 35.4; y: 64.6; skew-x: 11.8; skew-y: 18.8; scale-x: 1.005; scale-y: 0.997; }
        frame 5 { x: 33.5; y: 66.5; skew-x: 9; skew-y: 12.5; scale-x: 1.001; scale-y: -10000; }
        frame 6 { x: 31.6; y: 68.3; skew-x: 6.3; skew-y: 6.3; scale-x: 0.999; scale-y: 0.999; }
        frame 7 { x: 29.7; y: 70.5; skew-x: 2.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 27.8; y: 72.7; skew-x: -0.4; skew-y: -2.5; scale-y: 0.998; }
        frame 9 { x: 26; y: 75.1; skew-x: -4; skew-y: -7.2; scale-x: 1; scale-y: -10000; }
        frame 10 { x: 26.1; y: 75.2; skew-x: -3.9; skew-y: -8; scale-x: -10000; scale-y: 0.997; }
        frame 11 { x: -10000; y: 75.4; skew-x: -4.1; skew-y: -9; scale-x: 1.002; scale-y: 0.998; }
        frame 12 { x: 27.4; y: 73.2; skew-x: -1.2; skew-y: -5.4; scale-x: 1; scale-y: 0.997; }
        frame 13 { x: 28.8; y: 71; skew-x: 1.3; skew-y: -1.8; scale-x: 0.999; scale-y: 0.998; }
        frame 14 { x: 30.5; y: 69.6; skew-x: 3.8; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 32.2; y: 68.1; skew-x: 6.3; skew-y: 5; }
        frame 16 { x: 34; y: 66.7; skew-x: 8.8; skew-y: 8.8; scale-y: 0.999; }
        frame 17 { x: 35.1; y: 65.8; skew-x: 10.3; skew-y: 10.3; scale-x: 0.998; scale-y: 0.998; }
        frame 18 { x: 36.3; y: 65; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 37.4; y: 64; skew-x: 13.8; skew-y: 13.8; }
        frame 20 { x: 35.6; y: 65.2; skew-x: 11.8; skew-y: 18.8; scale-x: 1.005; scale-y: 0.997; }
        frame 21 { x: 33.6; y: 67.5; skew-x: 9; skew-y: 12.5; scale-x: 1.001; scale-y: -10000; }
        frame 22 { x: 31.6; y: 69.7; skew-x: 6.3; skew-y: 6.3; scale-x: 0.999; scale-y: 0.999; }
        frame 23 { x: 29.7; y: 71.4; skew-x: 2.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 27.8; y: 73.2; skew-x: -0.4; skew-y: -2.5; scale-y: 0.998; }
        frame 25 { x: 26; y: 75.1; skew-x: -4; skew-y: -7.2; scale-x: 1; scale-y: -10000; }
        frame 26 { x: 26.3; y: 75; skew-x: -3.9; skew-y: -8; scale-x: -10000; scale-y: 0.997; }
        frame 27 { x: 26.5; y: -10000; skew-x: -4.1; skew-y: -9; scale-x: 1.002; scale-y: 0.998; }
        frame 28 { x: 28.8; y: 71.7; skew-x: 0; skew-y: -2.7; scale-x: 1; scale-y: -10000; }
        frame 29 { x: 31.1; y: 68.5; skew-x: 4.3; skew-y: 3.3; scale-x: 0.999; scale-y: 0.999; }
        frame 30 { x: 31.9; y: 67.8; skew-x: 5.8; skew-y: 5; scale-x: -10000; scale-y: 0.998; }
        frame 31 { x: 32.8; y: 67; skew-x: 7.3; skew-y: 6.8; scale-y: -10000; }
        frame 32 { x: 34; y: 66.4; skew-x: 8.8; skew-y: 8.8; scale-y: 0.999; }
        frame 33 { x: 32.9; y: 68.1; skew-x: 2.8; skew-y: 2.8; scale-y: -10000; }
        frame 34 { x: 33.6; y: 67.9; skew-x: 3.8; skew-y: 3.8; scale-x: 0.998; scale-y: 0.998; }
        frame 35 { x: 34.5; y: 67.6; skew-x: 4.8; skew-y: 4.8; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 35.2; y: 67.4; skew-x: 5.8; skew-y: 5.8; }
        frame 37 { x: 36; y: 67.2; skew-x: 7; skew-y: 7; }
        frame 38 { x: 36.1; y: 67.8; skew-x: 4.8; skew-y: 4.6; scale-x: 1.005; scale-y: 0.997; }
        frame 39 { x: 36.5; y: 68.4; skew-x: 2.8; skew-y: 2.3; scale-x: 1.012; scale-y: -10000; }
        frame 40 { x: 36.7; y: 69; skew-x: 0.8; skew-y: 0; scale-x: 1.019; }
        frame 41 { x: 37.3; y: 69.6; skew-x: -0.9; skew-y: -2.1; scale-x: 1.026; scale-y: 0.996; }
        frame 42 { x: 32.5; y: 71.1; skew-x: -2.4; skew-y: -5; scale-x: 1.012; scale-y: 0.995; }
        frame 43 { x: 27.5; y: 72.6; skew-x: -4.2; skew-y: -8.2; scale-x: 0.998; scale-y: 0.994; }
        frame 44 { x: 22.4; y: 76.7; skew-x: -10; skew-y: -13.4; scale-x: 1.023; scale-y: 0.965; }
        frame 45 { x: 25.3; y: 76; skew-x: -8.7; skew-y: -10.9; scale-x: 1.009; scale-y: 0.98; }
        frame 46 { x: 28.2; y: 75.2; skew-x: -7.5; skew-y: -8.5; scale-x: 0.996; scale-y: 0.995; }
        frame 47 { x: 32; y: 71.1; skew-x: -0.2; skew-y: -0.7; scale-x: 0.997; scale-y: 0.997; }
        frame 48 { x: 36; y: 67.2; skew-x: 7; skew-y: 7; scale-x: 0.998; scale-y: 0.998; }
        frame 49 { x: 36.1; y: 67.7; skew-x: 4.8; skew-y: 4.6; scale-x: 1.005; scale-y: 0.997; }
        frame 50 { x: 36.5; y: 68.1; skew-x: 2.8; skew-y: 2.3; scale-x: 1.012; scale-y: -10000; }
        frame 51 { x: 36.7; y: 68.6; skew-x: 0.8; skew-y: 0; scale-x: 1.019; }
        frame 52 { x: 37.3; y: 69; skew-x: -0.9; skew-y: -2.1; scale-x: 1.026; scale-y: 0.996; }
        frame 53 { x: 32.5; y: 70.8; skew-x: -2.4; skew-y: -5; scale-x: 1.012; scale-y: 0.995; }
        frame 54 { x: 27.5; y: 72.6; skew-x: -4.2; skew-y: -8.2; scale-x: 0.998; scale-y: 0.994; }
        frame 55 { x: 22.4; y: 76.7; skew-x: -10; skew-y: -13.4; scale-x: 1.023; scale-y: 0.965; }
        frame 56 { x: 24.9; y: 76.1; skew-x: -9.4; skew-y: -11.7; scale-x: 1.009; scale-y: 0.979; }
        frame 57 { x: 27.4; y: 75.5; skew-x: -9; skew-y: -10; scale-x: 0.996; scale-y: 0.995; }
        frame 58 { x: 30.1; y: 71.7; skew-x: -2.9; skew-y: -3.4; scale-x: 0.997; scale-y: 0.997; }
        frame 59 { x: 32.9; y: 68.1; skew-x: 2.8; skew-y: 2.8; scale-x: 0.999; scale-y: 0.999; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 61 { cel: -10000; }
        frame 82 { x: 70.2; y: 31.8; skew-x: -75.6; skew-y: -72.4; scale-x: 0.987; scale-y: 0.986; cel: 0; }
        frame 83 { x: 74.1; y: 33.2; skew-x: -89.9; skew-y: -86.9; scale-x: 0.986; scale-y: 0.984; cel: -10000; }
        frame 84 { x: 78.5; y: 33.6; skew-x: -104.2; skew-y: -100.9; scale-x: 0.983; scale-y: 0.982; }
        frame 85 { x: 83.3; y: 33.4; skew-x: -118.5; skew-y: -115.4; scale-x: -10000; scale-y: 0.981; }
        frame 86 { x: 91.1; y: 32.4; skew-x: -148.3; skew-y: -145; scale-x: 0.98; scale-y: 0.978; }
        frame 87 { x: 96.9; y: 27.8; skew-x: -177.8; skew-y: -174.6; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 102; y: 14.9; skew-x: -222.8; skew-y: -219.5; scale-x: 0.978; scale-y: 0.977; }
        frame 89 { x: 92.2; y: 3.8; skew-x: -267.8; skew-y: -264.6; scale-x: 0.98; scale-y: 0.978; }
        frame 90 { x: 90; y: 0.6; skew-x: -278.4; skew-y: -275.4; scale-x: 0.978; scale-y: 0.977; }
        frame 91 { x: 87.3; y: -2.2; skew-x: -289.4; skew-y: -286.2; scale-x: 0.977; scale-y: 0.975; }
        frame 92 { x: 77.7; y: -1.2; skew-x: -296.2; skew-y: -293; scale-x: 0.975; scale-y: 0.973; }
        frame 93 { x: 68; y: 0; skew-x: -302.9; skew-y: -299.8; scale-x: -10000; scale-y: 0.974; }
        frame 94 { x: 62; y: 8.9; skew-x: -306; skew-y: -302.7; scale-x: 0.972; scale-y: 0.971; }
        frame 95 { x: 55.9; y: 17.8; skew-x: -309; skew-y: -305.7; scale-x: 0.973; scale-y: -10000; }
        frame 96 { x: 49.2; y: 31.2; skew-x: -321.8; skew-y: -318.5; scale-x: 0.971; scale-y: 0.97; }
        frame 97 { x: 42.6; y: 45.2; skew-x: -334.6; skew-y: -331.4; scale-x: 0.973; scale-y: 0.971; }
        frame 98 { x: 38.1; y: 55.5; skew-x: -348.4; skew-y: -345.1; scale-x: 0.971; scale-y: 0.97; }
        frame 99 { x: 34.2; y: 66.5; skew-x: -361.9; skew-y: -358.9; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 31.2; y: 77.9; skew-x: -375.7; skew-y: -372.5; scale-x: 0.97; scale-y: 0.969; }
        frame 101 { x: 28.8; y: 89.5; skew-x: -389.5; skew-y: -386.3; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 30.8; y: 78.6; skew-x: -373.9; skew-y: -370.7; }
        frame 103 { x: 33.8; y: 68; skew-x: -358.4; skew-y: -355.4; scale-x: 0.971; scale-y: 0.97; }
    }
    Track {
        source-name: "Zombie_imp_outerarm_upper";
        frame-count: 104;
        frame 0 { x: 47.8; y: 91; skew-x: 317.3; skew-y: 320; scale-x: 1.017; scale-y: 1.027; image: IMAGE_REANIM_ZOMBIE_IMP_ARM1; }
        frame 1 { x: 47.6; y: 90.3; skew-x: 318.6; skew-y: 321.4; scale-x: 1.014; scale-y: 1.024; image: none; }
        frame 2 { x: 47.5; y: 89.7; skew-x: 319.9; skew-y: 322.7; scale-x: 1.013; scale-y: 1.023; }
        frame 3 { x: 47.2; y: 89.3; skew-x: 321.4; skew-y: 324.1; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 46.4; y: 90.2; skew-x: -10000; skew-y: 324.2; scale-x: 1.011; scale-y: 1.022; }
        frame 5 { x: 45.6; y: 91.2; skew-y: -10000; scale-x: 1.012; scale-y: -10000; }
        frame 6 { x: 44.8; y: 92.2; skew-x: 321.6; skew-y: 324.3; scale-x: 1.013; scale-y: 1.023; }
        frame 7 { x: 45.2; y: 95.2; skew-x: 311.4; skew-y: 314.1; scale-x: 1.012; scale-y: 1.022; }
        frame 8 { x: 45.8; y: 98.1; skew-x: 301.1; skew-y: 303.8; scale-x: 1.013; scale-y: 1.023; }
        frame 9 { x: 46.5; y: 100.8; skew-x: 291; skew-y: 293.7; scale-x: 1.015; scale-y: 1.025; }
        frame 10 { x: 46; y: 99.8; skew-x: 295.8; skew-y: 298.6; scale-x: 1.014; scale-y: 1.024; }
        frame 11 { x: 45.5; y: 98.6; skew-x: 300.8; skew-y: 303.6; scale-x: 1.013; scale-y: 1.023; }
        frame 12 { x: 45; y: 97.6; skew-x: 305.6; skew-y: 308.4; scale-x: 1.012; scale-y: 1.022; }
        frame 13 { x: 44.6; y: 96.5; skew-x: 310.7; skew-y: 313.4; scale-x: 1.014; scale-y: 1.024; }
        frame 14 { x: 45.2; y: 94.8; skew-x: 313.6; skew-y: 316.4; scale-x: 1.012; scale-y: 1.022; }
        frame 15 { x: 46; y: 93; skew-x: 316.4; skew-y: 319.1; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 46.7; y: 91.5; skew-x: 319.4; skew-y: 322.1; scale-x: 1.013; scale-y: 1.023; }
        frame 17 { x: 46.5; y: 91.4; skew-x: 321.1; skew-y: 323.7; scale-x: 1.012; scale-y: 1.022; }
        frame 18 { x: 46.3; y: 91.3; skew-x: 322.7; skew-y: 325.4; scale-x: 1.011; scale-y: 1.021; }
        frame 19 { x: 46; y: 91.1; skew-x: 324.4; skew-y: 327.1; scale-x: 1.013; scale-y: 1.023; }
        frame 20 { x: -10000; y: 93; skew-x: 317.4; skew-y: 320.2; scale-x: 1.011; scale-y: 1.021; }
        frame 21 { x: 46.1; y: 94.9; skew-x: 310.6; skew-y: 313.3; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 46.3; y: 96.9; skew-x: 303.6; skew-y: 306.3; scale-x: 1.013; scale-y: 1.023; }
        frame 23 { x: 46.4; y: 97.9; skew-x: 299.3; skew-y: 302.1; scale-x: -10000; scale-y: 1.022; }
        frame 24 { x: -10000; y: 99.2; skew-x: 295.1; skew-y: 297.8; scale-y: 1.023; }
        frame 25 { x: 46.5; y: 100; skew-x: 291; skew-y: 293.7; scale-x: 1.015; scale-y: 1.025; }
        frame 26 { x: 46.6; y: 98.6; skew-x: 295.3; skew-y: 298.1; scale-x: 1.014; scale-y: 1.024; }
        frame 27 { x: 46.8; y: 97; skew-x: 299.8; skew-y: 302.3; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 46.9; y: 95.6; skew-x: 304.1; skew-y: 306.8; }
        frame 29 { x: 47.1; y: 94; skew-x: 308.6; skew-y: 311.1; scale-x: 1.015; scale-y: 1.025; }
        frame 30 { x: 47.3; y: 93.1; skew-x: 311.4; skew-y: 314.1; scale-x: 1.014; scale-y: 1.024; }
        frame 31 { x: 47.5; y: 92; skew-x: 314.4; skew-y: 317.1; scale-x: 1.015; scale-y: 1.025; }
        frame 32 { x: 47.8; y: 91; skew-x: 317.3; skew-y: 320; scale-x: 1.017; scale-y: 1.027; }
        frame 33 { x: -10000; y: 91.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 47.9; y: 90.1; skew-x: 322.7; skew-y: 325.4; scale-x: 1.015; scale-y: 1.025; }
        frame 35 { x: -10000; y: 89; skew-x: 328.2; skew-y: 330.9; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 48.1; y: 88; skew-x: 333.5; skew-y: 336.2; }
        frame 37 { x: 48.3; y: 86.8; skew-x: 338.9; skew-y: 341.6; scale-x: 1.016; scale-y: 1.026; }
        frame 38 { x: 48.5; y: 84.8; skew-x: 348.2; skew-y: 351; scale-x: 1.015; scale-y: 1.025; }
        frame 39 { x: 48.8; y: 82.9; skew-x: 357.7; skew-y: 360.3; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 49.5; y: 81.2; skew-x: 366.8; skew-y: 369.5; scale-x: 1.014; scale-y: 1.024; }
        frame 41 { x: 50.2; y: 79.6; skew-x: 376.3; skew-y: 379; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 47.5; y: 80.9; skew-x: 370.3; skew-y: 373; scale-x: 1.013; scale-y: 1.023; }
        frame 43 { x: 44.9; y: 82.3; skew-x: 364.3; skew-y: 366.8; scale-x: 1.012; scale-y: 1.022; }
        frame 44 { x: 42.3; y: 83.6; skew-x: 358.3; skew-y: 361; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 43.8; y: 84.3; skew-x: 353.5; skew-y: 356.2; scale-x: 1.013; scale-y: 1.023; }
        frame 46 { x: 45.3; y: 85.1; skew-x: 348.7; skew-y: 351.4; scale-x: -10000; scale-y: 1.024; }
        frame 47 { x: 46.8; y: 85.9; skew-x: 343.7; skew-y: 346.5; scale-x: 1.014; scale-y: -10000; }
        frame 48 { x: 48.3; y: 86.8; skew-x: 338.9; skew-y: 341.6; scale-x: 1.016; scale-y: 1.026; }
        frame 49 { x: 48.6; y: 87.1; skew-x: 336.2; skew-y: 338.7; scale-x: 1.015; scale-y: 1.025; }
        frame 50 { x: 48.8; y: 87.3; skew-x: 333.2; skew-y: 335.9; scale-x: 1.014; scale-y: -10000; }
        frame 51 { x: 49.2; y: 87.7; skew-x: 330.4; skew-y: 333.2; scale-x: -10000; scale-y: 1.024; }
        frame 52 { x: 49.6; y: 88; skew-x: 327.6; skew-y: 330.3; scale-x: 1.015; scale-y: 1.025; }
        frame 53 { x: 47.9; y: 88.8; skew-x: 326.9; skew-y: 329.7; scale-x: 1.014; scale-y: 1.024; }
        frame 54 { x: 46.1; y: 89.5; skew-x: 326.4; skew-y: 329.2; scale-x: 1.015; scale-y: 1.025; }
        frame 55 { x: 44.4; y: 90.4; skew-x: 325.8; skew-y: 328.5; scale-x: 1.017; scale-y: 1.027; }
        frame 56 { x: 45.3; y: 90.6; skew-x: 323.7; skew-y: 326.4; scale-x: 1.015; scale-y: 1.025; }
        frame 57 { x: 46.1; y: 90.8; skew-x: 321.6; skew-y: 324.4; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 47; y: 91; skew-x: 319.4; skew-y: 322.1; scale-y: 1.026; }
        frame 59 { x: 47.8; y: 91.2; skew-x: 317.3; skew-y: 320; scale-x: 1.017; scale-y: 1.027; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_IMP_ARM1_BONE; }
        frame 61 { x: 48.6; y: 92.3; skew-x: 315.4; skew-y: 318.1; scale-x: 1.015; scale-y: 1.025; image: none; }
        frame 62 { x: 49.4; y: 93.3; skew-x: 313.6; skew-y: 316.2; scale-x: 1.014; scale-y: 1.024; }
        frame 63 { x: 50.1; y: 94.4; skew-x: 311.6; skew-y: 314.4; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 50.9; y: 95.4; skew-x: 309.8; skew-y: 312.6; scale-x: 1.013; scale-y: 1.023; }
        frame 65 { x: 51.7; y: 96.4; skew-x: 307.9; skew-y: 310.6; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 52.4; y: 97.4; skew-x: 306.1; skew-y: 308.8; scale-x: 1.014; scale-y: 1.024; }
        frame 67 { x: 55.1; y: 98.5; skew-x: 316.4; skew-y: 319.2; scale-x: 1.011; scale-y: 1.021; }
        frame 68 { x: 57.9; y: 99.3; skew-x: 326.9; skew-y: 329.7; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 61.1; y: 100.2; skew-x: 337.4; skew-y: 340.2; }
        frame 70 { x: 64.7; y: 101; skew-x: 347.7; skew-y: 350.4; }
        frame 71 { x: 63.9; y: 104.5; skew-x: 334.9; skew-y: 337.5; scale-x: 1.009; scale-y: 1.019; }
        frame 72 { x: 63.6; y: 108.3; skew-x: 321.9; skew-y: 324.6; scale-x: 1.008; scale-y: 1.018; }
        frame 73 { x: 63.8; y: 111.9; skew-x: 308.9; skew-y: 311.6; scale-x: 1.009; scale-y: 1.019; }
        frame 74 { x: 63.4; y: 112.5; skew-x: 311.1; skew-y: 309.1; scale-x: 0.997; scale-y: 1.021; }
        frame 75 { x: 62.9; y: 113.1; skew-x: 313.6; skew-y: 306.9; scale-x: 0.988; scale-y: 1.026; }
        frame 76 { x: 63.3; y: 112.5; skew-x: 311.1; skew-y: 309.1; scale-x: 0.997; scale-y: 1.021; }
        frame 77 { x: 63.8; y: 111.9; skew-x: 308.9; skew-y: 311.6; scale-x: 1.009; scale-y: 1.019; }
        frame 78 { x: 64.1; y: 111.3; skew-x: 305.3; skew-y: 308.1; scale-x: 1.008; scale-y: 1.017; }
        frame 79 { x: 64.5; y: 110.7; skew-x: 301.8; skew-y: 304.5; scale-x: 1.009; scale-y: 1.019; }
        frame 80 { x: 63.3; y: 113.2; skew-x: 299.8; skew-y: 302.6; scale-x: 1.007; scale-y: 1.017; }
        frame 81 { x: 62; y: 115.7; skew-x: 297.9; skew-y: 300.6; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 101.1; y: 21.6; skew-x: 215.8; skew-y: 215.8; scale-x: 0.983; scale-y: 0.983; image: IMAGE_REANIM_ZOMBIE_IMP_ARM1; }
        frame 83 { x: 97.4; y: 20.1; skew-x: 221.8; skew-y: 221.8; scale-x: 0.98; scale-y: 0.98; image: none; }
        frame 84 { x: 93.7; y: 18.6; skew-x: 227.9; skew-y: 227.9; scale-x: 0.979; scale-y: 0.979; }
        frame 85 { x: 90.2; y: 17.1; skew-x: 233.8; skew-y: 233.8; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 89.1; y: 16.4; skew-x: 204.1; skew-y: 204.1; scale-x: 0.976; scale-y: 0.976; }
        frame 87 { x: 86.6; y: 13.5; skew-x: 174.6; skew-y: 174.6; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 84.8; y: 13; skew-x: 129.6; skew-y: 129.6; scale-x: 0.975; scale-y: 0.975; }
        frame 89 { x: 77.9; y: 14.2; skew-x: 84.5; skew-y: 84.5; scale-x: 0.976; scale-y: 0.976; }
        frame 90 { x: 77.4; y: 13.7; skew-x: 67.2; skew-y: 67.2; scale-x: 0.974; scale-y: 0.974; }
        frame 91 { x: 76.6; y: 13.9; skew-x: 49.9; skew-y: 49.9; scale-x: 0.975; scale-y: 0.975; }
        frame 92 { x: 75.4; y: 15.3; skew-x: 72.2; skew-y: 72.2; scale-x: 0.971; scale-y: 0.971; }
        frame 93 { x: 73.9; y: 17.9; skew-x: 94.2; skew-y: 94.2; scale-x: 0.97; scale-y: 0.97; }
        frame 94 { x: 69.8; y: 26.5; skew-x: 96.3; skew-y: 96.3; scale-x: 0.969; scale-y: 0.969; }
        frame 95 { x: 65.8; y: 35.1; skew-x: 98.6; skew-y: 98.6; scale-x: 0.968; scale-y: 0.968; }
        frame 96 { x: 63.6; y: 45.7; skew-x: 91; skew-y: 91; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 61.6; y: 56.3; skew-x: 83.7; skew-y: 83.7; scale-x: 0.967; scale-y: 0.967; }
        frame 98 { x: 56.1; y: 62.8; skew-x: 61.4; skew-y: 61.4; scale-x: 0.964; scale-y: 0.964; }
        frame 99 { x: 50.6; y: 70.6; skew-x: 39.1; skew-y: 39.1; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 45.7; y: 79.8; skew-x: 16.8; skew-y: 16.8; scale-x: 0.963; scale-y: 0.963; }
        frame 101 { x: 41.7; y: 89.9; skew-x: -5.3; skew-y: -5.3; scale-x: 0.964; scale-y: 0.964; }
        frame 102 { x: 44.4; y: 90.4; skew-x: -24.2; skew-y: -24.2; scale-x: 0.962; scale-y: 0.962; }
        frame 103 { x: 47.9; y: 91; skew-x: -43.4; skew-y: -43.4; scale-x: 0.963; scale-y: 0.963; }
    }
    Track {
        source-name: "Zombie_outerarm_lower";
        frame-count: 104;
        frame 0 { x: 43; y: 104.9; skew-x: 311.4; skew-y: 314.1; scale-x: 1.06; scale-y: 1.024; image: IMAGE_REANIM_ZOMBIE_IMP_ARM2; }
        frame 1 { x: 41.1; y: 101.3; skew-x: 323.9; skew-y: 326.7; scale-x: 1.056; scale-y: 1.02; image: none; }
        frame 2 { x: 39.7; y: 97.5; skew-x: 336.4; skew-y: 339.2; scale-x: 1.055; scale-y: 1.019; }
        frame 3 { x: 38.8; y: 94; skew-x: 348.8; skew-y: 351.6; scale-x: 1.054; scale-y: 1.018; }
        frame 4 { x: 38.1; y: 93.8; skew-x: 353.2; skew-y: 355.9; scale-x: 1.053; scale-y: -10000; }
        frame 5 { x: 37.3; y: 93.6; skew-x: 357.4; skew-y: 360; scale-x: 1.054; }
        frame 6 { x: 36.8; y: 93.5; skew-x: 361.5; skew-y: 364.2; scale-x: -10000; }
        frame 7 { x: 38.7; y: 100.8; skew-x: 336.2; skew-y: 338.9; }
        frame 8 { x: 42.6; y: 108.3; skew-x: 310.6; skew-y: 313.3; scale-x: 1.055; scale-y: 1.019; }
        frame 9 { x: 48.4; y: 115.4; skew-x: 285.1; skew-y: 287.8; scale-x: 1.058; scale-y: 1.022; }
        frame 10 { x: 48.5; y: 115.3; skew-x: 283; skew-y: 285.8; scale-x: 1.056; scale-y: 1.02; }
        frame 11 { x: 48.6; y: 115.1; skew-x: 281.2; skew-y: 284; scale-x: 1.055; scale-y: 1.019; }
        frame 12 { x: 43.6; y: 111.5; skew-x: 300.6; skew-y: 303.4; scale-x: 1.054; scale-y: 1.018; }
        frame 13 { x: 39.5; y: 107.3; skew-x: 320.3; skew-y: 323; scale-x: 1.055; scale-y: 1.019; }
        frame 14 { x: 39.1; y: 104.4; skew-x: 326.4; skew-y: 329.2; scale-x: 1.053; scale-y: 1.017; }
        frame 15 { x: 38.9; y: 101.5; skew-x: 332.7; skew-y: 335.4; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 38.6; y: 98.6; skew-x: 338.8; skew-y: 341.5; scale-x: 1.054; scale-y: 1.018; }
        frame 17 { x: 38.1; y: 97.5; skew-x: 343.2; skew-y: 346; scale-x: 1.053; scale-y: 1.017; }
        frame 18 { x: 37.7; y: 96.4; skew-x: 347.5; skew-y: 350.2; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 37.3; y: 95.4; skew-x: 351.9; skew-y: 354.6; scale-x: 1.054; scale-y: 1.018; }
        frame 20 { x: 38.5; y: 99.7; skew-x: 338.5; skew-y: 341.2; scale-x: 1.053; scale-y: 1.017; }
        frame 21 { x: 40.1; y: 104.1; skew-x: 325.1; skew-y: 327.9; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 42.3; y: 108.6; skew-x: 311.6; skew-y: 314.3; scale-x: 1.055; scale-y: 1.019; }
        frame 23 { x: 44.4; y: 110.7; skew-x: 301.1; skew-y: 303.9; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 46.8; y: 112.8; skew-x: 290.8; skew-y: 293.6; scale-x: 1.056; scale-y: 1.02; }
        frame 25 { x: 49.5; y: 114.4; skew-x: 280.5; skew-y: 283.3; scale-x: 1.058; scale-y: 1.022; }
        frame 26 { x: 50.5; y: 114.3; skew-x: 276.8; skew-y: 279.8; scale-x: 1.057; scale-y: 1.02; }
        frame 27 { x: 51.3; y: 114.2; skew-x: 273.5; skew-y: 276.2; scale-x: 1.056; scale-y: -10000; }
        frame 28 { x: 47.9; y: 111.4; skew-x: 287.3; skew-y: 290; scale-x: -10000; }
        frame 29 { x: 44.9; y: 108.2; skew-x: 301.1; skew-y: 303.8; scale-x: 1.058; scale-y: 1.022; }
        frame 30 { x: 44.3; y: 107.1; skew-x: 304.4; skew-y: 307.3; scale-x: 1.057; scale-y: 1.021; }
        frame 31 { x: 43.7; y: 105.9; skew-x: 307.9; skew-y: 310.6; scale-x: 1.058; scale-y: 1.022; }
        frame 32 { x: 43; y: 104.9; skew-x: 311.4; skew-y: 314.1; scale-x: 1.06; scale-y: 1.024; }
        frame 33 { x: -10000; y: 105.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 41.1; y: 100.6; skew-x: 325.9; skew-y: 328.7; scale-x: 1.058; scale-y: 1.022; }
        frame 35 { x: 39.8; y: 96.2; skew-x: 340.4; skew-y: 343.2; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 39.1; y: 91.8; skew-x: 354.9; skew-y: 357.7; }
        frame 37 { x: -10000; y: 87.9; skew-x: 369.3; skew-y: 372; scale-x: 1.057; scale-y: 1.021; }
        frame 38 { x: 40.9; y: 83.1; skew-x: 384.6; skew-y: 387.3; scale-x: 1.055; scale-y: 1.019; }
        frame 39 { x: 43.1; y: 79.1; skew-x: 399.9; skew-y: 402.6; scale-x: 1.054; scale-y: 1.018; }
        frame 40 { x: 45.6; y: 75.6; skew-x: 415.2; skew-y: 417.9; scale-x: 1.053; scale-y: 1.017; }
        frame 41 { x: 48; y: 72.9; skew-x: 430.5; skew-y: 433.3; scale-x: -10000; scale-y: 1.018; }
        frame 42 { x: 43.8; y: 74.4; skew-x: 421.5; skew-y: 424.2; scale-x: 1.051; scale-y: 1.015; }
        frame 43 { x: 39.6; y: 76.1; skew-x: 412.4; skew-y: 415.2; scale-x: 1.05; scale-y: 1.014; }
        frame 44 { x: 35.3; y: 78.1; skew-x: 403.4; skew-y: 406.2; scale-x: 1.051; scale-y: 1.015; }
        frame 45 { x: 36.1; y: 80.3; skew-x: 394.8; skew-y: 397.6; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 37; y: 82.6; skew-x: 386.3; skew-y: 389.1; scale-x: 1.053; scale-y: 1.017; }
        frame 47 { x: 38; y: 85.2; skew-x: 377.8; skew-y: 380.5; scale-x: 1.055; scale-y: 1.019; }
        frame 48 { x: 39.1; y: 87.9; skew-x: 369.3; skew-y: 372; scale-x: 1.057; scale-y: 1.021; }
        frame 49 { x: 39.4; y: 89.6; skew-x: 362; skew-y: 364.8; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 40; y: 91.4; skew-x: 355.2; skew-y: 358; scale-x: 1.056; scale-y: 1.02; }
        frame 51 { x: 40.5; y: 93.3; skew-x: 348; skew-y: 350.7; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 41.3; y: 95.2; skew-x: 340.9; skew-y: 343.6; }
        frame 53 { x: 39.9; y: 97.9; skew-x: 333.9; skew-y: 336.7; }
        frame 54 { x: 38.6; y: 100.7; skew-x: 326.9; skew-y: 329.7; scale-x: 1.057; scale-y: 1.021; }
        frame 55 { x: 37.5; y: 103.4; skew-x: 319.9; skew-y: 322.7; scale-x: 1.06; scale-y: 1.023; }
        frame 56 { x: 38.9; y: 103.9; skew-x: 317.9; skew-y: 320.6; scale-x: 1.058; scale-y: 1.022; }
        frame 57 { x: 40.2; y: 104.3; skew-x: 315.6; skew-y: 318.4; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 41.6; y: 104.8; skew-x: 313.4; skew-y: 316.3; }
        frame 59 { x: 43; y: 105.2; skew-x: 311.4; skew-y: 314.1; scale-x: 1.06; scale-y: 1.024; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 61 { cel: -10000; }
        frame 82 { x: 120.8; y: 20.1; skew-x: 195.4; skew-y: 195.4; scale-x: 1.148; scale-y: 0.982; cel: 0; }
        frame 83 { x: 110.7; y: 24.4; skew-x: 222.6; skew-y: 222.6; scale-x: 1.144; scale-y: 0.978; cel: -10000; }
        frame 84 { x: 99.9; y: 26.4; skew-x: 249.7; skew-y: 249.7; scale-x: 1.143; scale-y: 0.977; }
        frame 85 { x: 89.5; y: 26; skew-x: 276.8; skew-y: 276.8; scale-x: 1.142; scale-y: 0.976; }
        frame 86 { x: 91.6; y: 23.7; skew-x: 247.2; skew-y: 247.2; scale-x: 1.139; scale-y: 0.974; }
        frame 87 { x: 93.9; y: 18.7; skew-x: 217.6; skew-y: 217.6; scale-x: -10000; scale-y: 0.973; }
        frame 88 { x: 91.4; y: 14; skew-x: 172.7; skew-y: 172.7; scale-x: 1.138; scale-y: -10000; }
        frame 89 { x: 83.1; y: 6.9; skew-x: 127.6; skew-y: 127.6; scale-x: 1.139; }
        frame 90 { x: 80.2; y: 5.6; skew-x: 110.3; skew-y: 110.3; scale-x: 1.136; scale-y: 0.972; }
        frame 91 { x: 76.6; y: 5; skew-x: 92.9; skew-y: 92.9; scale-x: 1.137; scale-y: -10000; }
        frame 92 { x: 73.7; y: 4.5; skew-x: 96.5; skew-y: 96.5; scale-x: 1.135; scale-y: 0.97; }
        frame 93 { x: 70.7; y: 4; skew-x: 100.4; skew-y: 100.4; scale-x: 1.133; scale-y: 0.969; }
        frame 94 { x: 67.3; y: 12.6; skew-x: 102.5; skew-y: 102.5; scale-x: 1.131; scale-y: 0.967; }
        frame 95 { x: 63.8; y: 21.1; skew-x: 104.8; skew-y: 104.8; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 59.8; y: 32.1; skew-x: 97.3; skew-y: 97.3; scale-x: 1.13; scale-y: 0.966; }
        frame 97 { x: 55.8; y: 43.4; skew-x: 89.8; skew-y: 89.8; scale-x: 1.129; scale-y: -10000; }
        frame 98 { x: 49.3; y: 53.8; skew-x: 70.2; skew-y: 70.2; scale-x: 1.126; scale-y: 0.963; }
        frame 99 { x: 42.4; y: 65.3; skew-x: 50.4; skew-y: 50.4; scale-x: 1.125; scale-y: 0.962; }
        frame 100 { x: 35.9; y: 78.1; skew-x: 30.6; skew-y: 30.6; scale-x: 1.124; scale-y: 0.961; }
        frame 101 { x: 29.8; y: 92; skew-x: 10.8; skew-y: 10.9; scale-x: 1.125; scale-y: 0.962; }
        frame 102 { x: 34.4; y: 97.2; skew-x: -14.7; skew-y: -14.7; scale-x: 1.124; scale-y: 0.961; }
        frame 103 { x: 41; y: 102.9; skew-x: -40.4; skew-y: -40.4; scale-x: -10000; scale-y: -10000; }
    }
}
