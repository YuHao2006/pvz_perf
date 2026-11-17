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
        frame 0 { x: 49.9683018; y: 108.880058; skew-x: -4.18540133; skew-y: -4.18540378; scale-x: 0.755394471; scale-y: 0.75539444; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_INNERLEG_LOWER; }
        frame 1 { x: 51.9983113; y: 108.592323; skew-x: -11.2134799; skew-y: -11.2134814; scale-x: 0.736142646; scale-y: 0.736142679; cel: 0; alpha: 1; }
        frame 2 { x: 54.1233208; y: 108.368684; skew-x: -18.4115928; skew-y: -18.4115997; scale-x: 0.72708588; scale-y: 0.72708586; cel: 0; alpha: 1; }
        frame 3 { x: 56.0567304; y: 108.290308; skew-x: -24.7068004; skew-y: -24.7068036; scale-x: 0.723470404; scale-y: 0.723470455; cel: 0; alpha: 1; }
        frame 4 { x: 55.9314907; y: 109.7202; skew-x: -33.1663924; skew-y: -33.1663972; scale-x: 0.722966759; scale-y: 0.722966783; cel: 0; alpha: 1; }
        frame 5 { x: 55.8396559; y: 111.307782; skew-x: -41.4244823; skew-y: -41.4244798; scale-x: 0.720757101; scale-y: 0.720757029; cel: 0; alpha: 1; }
        frame 6 { x: 55.6647289; y: 113.292649; skew-x: -50.6183915; skew-y: -50.6183957; scale-x: 0.741408056; scale-y: 0.741408054; cel: 0; alpha: 1; }
        frame 7 { x: 56.5089048; y: 114.799404; skew-x: -60.2542859; skew-y: -60.2539949; scale-x: 0.745504134; scale-y: 0.783819475; cel: 0; alpha: 1; }
        frame 8 { x: 57.2732286; y: 116.602938; skew-x: -69.0405252; skew-y: -69.0399455; scale-x: 0.776359612; scale-y: 0.856213568; cel: 0; alpha: 1; }
        frame 9 { x: 58.3988762; y: 118.668028; skew-x: -78.5116934; skew-y: -78.5108212; scale-x: 0.810592264; scale-y: 0.935735433; cel: 0; alpha: 1; }
        frame 10 { x: 57.5707205; y: 118.475899; skew-x: -77.4712617; skew-y: -77.4706055; scale-x: 0.799734646; scale-y: 0.885367689; cel: 0; alpha: 1; }
        frame 11 { x: 56.7100127; y: 118.027146; skew-x: -75.3815657; skew-y: -75.3811317; scale-x: 0.779161326; scale-y: 0.825714076; cel: 0; alpha: 1; }
        frame 12 { x: 55.6750796; y: 117.65743; skew-x: -73.099813; skew-y: -73.0995944; scale-x: 0.765205788; scale-y: 0.788070559; cel: 0; alpha: 1; }
        frame 13 { x: 54.5415572; y: 117.4244; skew-x: -71.6157528; skew-y: -71.6157528; scale-x: 0.778280877; scale-y: 0.778280865; cel: 0; alpha: 1; }
        frame 14 { x: 52.1353064; y: 116.623217; skew-x: -67.8358571; skew-y: -67.835856; scale-x: 0.777367687; scale-y: 0.777367646; cel: 0; alpha: 1; }
        frame 15 { x: 49.4628214; y: 115.919286; skew-x: -64.0813027; skew-y: -64.081301; scale-x: 0.78776122; scale-y: 0.787761239; cel: 0; alpha: 1; }
        frame 16 { x: 47.1080969; y: 115.017539; skew-x: -60.3625398; skew-y: -60.3625379; scale-x: 0.785679041; scale-y: 0.785679048; cel: 0; alpha: 1; }
        frame 17 { x: 46.8748243; y: 111.405348; skew-x: -42.0959138; skew-y: -42.0959128; scale-x: 0.713046529; scale-y: 0.713046526; cel: 0; alpha: 1; }
        frame 18 { x: 47.1571717; y: 109.497215; skew-x: -27.6312578; skew-y: -27.6312579; scale-x: 0.699699188; scale-y: 0.699699158; cel: 0; alpha: 1; }
        frame 19 { x: 46.9136309; y: 108.863557; skew-x: -13.5254228; skew-y: -13.5254169; scale-x: 0.756155904; scale-y: 0.75615582; cel: 0; alpha: 1; }
        frame 20 { x: 46.5193178; y: 108.554011; skew-x: 0.223492983; skew-y: 0.223484278; scale-x: 0.783324602; scale-y: 0.783324628; cel: 0; alpha: 1; }
        frame 21 { x: 46.1745842; y: 108.71858; skew-x: 14.1052873; skew-y: 14.1052875; scale-x: 0.81674713; scale-y: 0.816747087; cel: 0; alpha: 1; }
        frame 22 { x: 45.8048733; y: 109.139345; skew-x: 27.5355352; skew-y: 27.5355397; scale-x: 0.856903284; scale-y: 0.856903235; cel: 0; alpha: 1; }
        frame 23 { x: 44.5878637; y: 109.430206; skew-x: 14.1758838; skew-y: 14.1761274; scale-x: 0.792192058; scale-y: 0.783235276; cel: 0; alpha: 1; }
        frame 24 { x: 43.3673973; y: 110.004117; skew-x: -0.0418423959; skew-y: -0.0413414248; scale-x: 0.768517672; scale-y: 0.754604576; cel: 0; alpha: 1; }
        frame 25 { x: 42.3869407; y: 110.765402; skew-x: -13.3068247; skew-y: -13.3060818; scale-x: 0.758615836; scale-y: 0.744881998; cel: 0; alpha: 1; }
        frame 26 { x: 43.7117914; y: 110.843859; skew-x: -14.0287267; skew-y: -14.0281703; scale-x: 0.750470868; scale-y: 0.713712235; cel: 0; alpha: 1; }
        frame 27 { x: 44.9840748; y: 110.79075; skew-x: -13.3944283; skew-y: -13.3940554; scale-x: 0.758931853; scale-y: 0.698461038; cel: 0; alpha: 1; }
        frame 28 { x: 46.342005; y: 110.574861; skew-x: -12.5148957; skew-y: -12.5147067; scale-x: 0.74594562; scale-y: 0.686509532; cel: 0; alpha: 1; }
        frame 29 { x: 47.4025448; y: 110.458065; skew-x: -14.3831362; skew-y: -14.3831376; scale-x: 0.754571031; scale-y: 0.694447681; cel: 0; alpha: 1; }
        frame 30 { x: 48.2109266; y: 109.851207; skew-x: -9.7012411; skew-y: -9.70124343; scale-x: 0.753316751; scale-y: 0.713475423; cel: 0; alpha: 1; }
        frame 31 { x: 49.0566559; y: 109.327377; skew-x: -6.59701173; skew-y: -6.59702326; scale-x: 0.753753301; scale-y: 0.733907634; cel: 0; alpha: 1; }
        frame 32 { x: 49.9683018; y: 108.880058; skew-x: -4.18540133; skew-y: -4.18540378; scale-x: 0.755394471; scale-y: 0.75539444; cel: 0; alpha: 1; }
        frame 33 { x: 47.2579849; y: 108.668087; skew-x: 0.51441654; skew-y: 0.51441395; scale-x: 0.752920871; scale-y: 0.752920851; cel: 0; alpha: 1; }
        frame 34 { x: 47.0252466; y: 108.565656; skew-x: -1.23113078; skew-y: -1.23114307; scale-x: 0.752880259; scale-y: 0.773580265; cel: 0; alpha: 1; }
        frame 35 { x: 46.7955615; y: 108.427624; skew-x: -2.88676553; skew-y: -2.88677682; scale-x: 0.755455248; scale-y: 0.797000282; cel: 0; alpha: 1; }
        frame 36 { x: 46.6021002; y: 108.245756; skew-x: -4.10863256; skew-y: -4.1086302; scale-x: 0.760563719; scale-y: 0.823307949; cel: 0; alpha: 1; }
        frame 37 { x: 46.3086493; y: 108.120325; skew-x: -6.14011018; skew-y: -6.14010574; scale-x: 0.763969467; scale-y: 0.848010093; cel: 0; alpha: 1; }
        frame 38 { x: 46.3600869; y: 108.02832; skew-x: -4.5446281; skew-y: -4.5446279; scale-x: 0.769519262; scale-y: 0.8330071; cel: 0; alpha: 1; }
        frame 39 { x: 46.5520831; y: 107.975056; skew-x: -3.54331892; skew-y: -3.54332466; scale-x: 0.771004682; scale-y: 0.813411414; cel: 0; alpha: 1; }
        frame 40 { x: 46.515745; y: 107.862866; skew-x: -2.19888973; skew-y: -2.19889216; scale-x: 0.787310773; scale-y: 0.808962307; cel: 0; alpha: 1; }
        frame 41 { x: 46.4783929; y: 107.738193; skew-x: -0.328876564; skew-y: -0.328882251; scale-x: 0.792517587; scale-y: 0.792517607; cel: 0; alpha: 1; }
        frame 42 { x: 46.322976; y: 108.333933; skew-x: -3.91591641; skew-y: -3.91591186; scale-x: 0.779576988; scale-y: 0.779576889; cel: 0; alpha: 1; }
        frame 43 { x: 46.1191033; y: 108.809554; skew-x: -7.1598649; skew-y: -7.15986202; scale-x: 0.767024671; scale-y: 0.767024567; cel: 0; alpha: 1; }
        frame 44 { x: 46.0050205; y: 109.48442; skew-x: -10.7918007; skew-y: -10.7918087; scale-x: 0.732977881; scale-y: 0.732977864; cel: 0; alpha: 1; }
        frame 45 { x: 46.3106451; y: 109.264063; skew-x: -7.78726043; skew-y: -7.78726453; scale-x: 0.737544995; scale-y: 0.737544936; cel: 0; alpha: 1; }
        frame 46 { x: 46.6610582; y: 109.025333; skew-x: -4.57641355; skew-y: -4.57642162; scale-x: 0.743273852; scale-y: 0.743273886; cel: 0; alpha: 1; }
        frame 47 { x: 46.9501075; y: 108.800559; skew-x: -1.89221033; skew-y: -1.89221295; scale-x: 0.752277185; scale-y: 0.752277141; cel: 0; alpha: 1; }
        frame 48 { x: 47.0999368; y: 108.588073; skew-x: -0.38583189; skew-y: -0.385833875; scale-x: 0.765720575; scale-y: 0.765720508; cel: 0; alpha: 1; }
        frame 49 { x: 47.0461738; y: 108.271846; skew-x: 0.765448028; skew-y: 0.765450617; scale-x: 0.778527642; scale-y: 0.778527608; cel: 0; alpha: 1; }
        frame 50 { x: 47.155407; y: 108.032116; skew-x: 1.3000525; skew-y: 1.30004827; scale-x: 0.781959779; scale-y: 0.781959723; cel: 0; alpha: 1; }
        frame 51 { x: 47.1075849; y: 107.724516; skew-x: 2.55629358; skew-y: 2.55629252; scale-x: 0.799459561; scale-y: 0.799459565; cel: 0; alpha: 1; }
        frame 52 { x: 47.0106615; y: 107.425413; skew-x: 3.94960002; skew-y: 3.94959515; scale-x: 0.805231286; scale-y: 0.805231295; cel: 0; alpha: 1; }
        frame 53 { x: 46.6707779; y: 108.108471; skew-x: -0.968828621; skew-y: -0.96883324; scale-x: 0.786889777; scale-y: 0.786889678; cel: 0; alpha: 1; }
        frame 54 { x: 46.3116039; y: 108.691161; skew-x: -5.50093106; skew-y: -5.50093271; scale-x: 0.768984746; scale-y: 0.768984809; cel: 0; alpha: 1; }
        frame 55 { x: 45.9995176; y: 109.465193; skew-x: -10.7518206; skew-y: -10.7518286; scale-x: 0.734885751; scale-y: 0.734885735; cel: 0; alpha: 1; }
        frame 56 { x: 46.3401192; y: 109.294687; skew-x: -7.69747346; skew-y: -7.69746922; scale-x: 0.733508206; scale-y: 0.733508123; cel: 0; alpha: 1; }
        frame 57 { x: 46.7038027; y: 109.057367; skew-x: -4.3820761; skew-y: -4.3820783; scale-x: 0.738634943; scale-y: 0.738634914; cel: 0; alpha: 1; }
        frame 58 { x: 46.9870819; y: 108.853503; skew-x: -1.78357833; skew-y: -1.78358649; scale-x: 0.746058829; scale-y: 0.746058844; cel: 0; alpha: 1; }
        frame 59 { x: 47.2579849; y: 108.668087; skew-x: 0.51441654; skew-y: 0.51441395; scale-x: 0.752920871; scale-y: 0.752920851; cel: 0; alpha: 1; }
        frame 60 { x: 47.2579849; y: 108.668087; skew-x: 0.51441654; skew-y: 0.51441395; scale-x: 0.752920871; scale-y: 0.752920851; cel: 0; alpha: 1; }
        frame 61 { x: 47.4453236; y: 108.515058; skew-x: 2.31694067; skew-y: 2.31693845; scale-x: 0.762041141; scale-y: 0.762041149; cel: 0; alpha: 1; }
        frame 62 { x: 47.460768; y: 108.498828; skew-x: 2.4629428; skew-y: 2.46293642; scale-x: 0.763099898; scale-y: 0.763099934; cel: 0; alpha: 1; }
        frame 63 { x: 47.6424871; y: 108.289861; skew-x: 4.18656489; skew-y: 4.18656341; scale-x: 0.777632729; scale-y: 0.777632665; cel: 0; alpha: 1; }
        frame 64 { x: 47.7663739; y: 108.144748; skew-x: 5.32940309; skew-y: 5.32940561; scale-x: 0.788184122; scale-y: 0.788184161; cel: 0; alpha: 1; }
        frame 65 { x: 47.7970618; y: 108.01496; skew-x: 5.7753207; skew-y: 5.775318; scale-x: 0.799817955; scale-y: 0.799817902; cel: 0; alpha: 1; }
        frame 66 { x: 47.9085693; y: 107.883952; skew-x: 6.66209387; skew-y: 6.66208417; scale-x: 0.808812689; scale-y: 0.808812723; cel: 0; alpha: 1; }
        frame 67 { x: 49.4061314; y: 107.32019; skew-x: 10.7624532; skew-y: 10.7624489; scale-x: 0.820042889; scale-y: 0.860958766; cel: 0; alpha: 1; }
        frame 68 { x: 50.8332666; y: 106.927574; skew-x: 14.4703464; skew-y: 14.4703428; scale-x: 0.833584405; scale-y: 0.916824173; cel: 0; alpha: 1; }
        frame 69 { x: 51.8794453; y: 106.697564; skew-x: 15.8052457; skew-y: 15.8052459; scale-x: 0.837646625; scale-y: 0.963200259; cel: 0; alpha: 1; }
        frame 70 { x: 52.9127174; y: 106.512193; skew-x: 18.1865452; skew-y: 18.1865466; scale-x: 0.845897023; scale-y: 1.01506599; cel: 0; alpha: 1; }
        frame 71 { x: 56.0540611; y: 106.769378; skew-x: 39.1211137; skew-y: 39.1211075; scale-x: 0.806770451; scale-y: 0.914478437; cel: 0; alpha: 1; }
        frame 72 { x: 57.9968284; y: 107.462205; skew-x: 60.4474581; skew-y: 60.4474653; scale-x: 0.800539197; scale-y: 0.854049536; cel: 0; alpha: 1; }
        frame 73 { x: 58.9672666; y: 108.434638; skew-x: 83.6236726; skew-y: 83.6236725; scale-x: 0.840598967; scale-y: 0.840598914; cel: 0; alpha: 1; }
        frame 74 { x: 58.8457573; y: 108.79973; skew-x: 81.235822; skew-y: 81.2358155; scale-x: 0.808549253; scale-y: 0.861873628; cel: 0; alpha: 1; }
        frame 75 { x: 58.7451547; y: 109.137208; skew-x: 78.5091067; skew-y: 78.5091008; scale-x: 0.772803774; scale-y: 0.878490111; cel: 0; alpha: 1; }
        frame 76 { x: 57.9362252; y: 111.316169; skew-x: 76.5513836; skew-y: 76.5513834; scale-x: 0.83919312; scale-y: 0.894595919; cel: 0; alpha: 1; }
        frame 77 { x: 56.7434754; y: 113.384508; skew-x: 73.9220315; skew-y: 73.9220372; scale-x: 0.89710893; scale-y: 0.89710891; cel: 0; alpha: 1; }
        frame 78 { x: 57.5160133; y: 112.7055; skew-x: 73.7851904; skew-y: 73.7851921; scale-x: 0.887999365; scale-y: 0.887999366; cel: 0; alpha: 1; }
        frame 79 { x: 58.0149133; y: 111.838295; skew-x: 73.1627281; skew-y: 73.1627244; scale-x: 0.892884378; scale-y: 0.892884285; cel: 0; alpha: 1; }
        frame 80 { x: 56.6338966; y: 112.877824; skew-x: 73.2147486; skew-y: 73.2147464; scale-x: 0.885829133; scale-y: 0.885829044; cel: 0; alpha: 1; }
        frame 81 { x: 55.2858722; y: 113.805405; skew-x: 73.5206149; skew-y: 73.5206173; scale-x: 0.882170228; scale-y: 0.882170258; cel: 0; alpha: 1; }
        frame 82 { x: 108.604156; y: 27.8585945; skew-x: -89.8085668; skew-y: -89.8085375; scale-x: 0.89666358; scale-y: 0.979515264; cel: 0; alpha: 1; }
        frame 83 { x: 106.112974; y: 26.9044295; skew-x: -89.5072513; skew-y: -89.5072231; scale-x: 0.794360001; scale-y: 0.877522693; cel: 0; alpha: 1; }
        frame 84 { x: 103.594577; y: 25.9311387; skew-x: -88.2938652; skew-y: -88.2938917; scale-x: 0.72099237; scale-y: 0.805616663; cel: 0; alpha: 1; }
        frame 85 { x: 100.576494; y: 24.7391414; skew-x: -84.6415363; skew-y: -84.6415305; scale-x: 0.676493764; scale-y: 0.764748545; cel: 0; alpha: 1; }
        frame 86 { x: 105.275633; y: 12.2345017; skew-x: -125.008279; skew-y: -125.008297; scale-x: 0.697287401; scale-y: 0.6972883; cel: 0; alpha: 1; }
        frame 87 { x: 98.6331909; y: 8.20452571; skew-x: -145.215798; skew-y: -145.21589; scale-x: 0.641796729; scale-y: 0.724761474; cel: 0; alpha: 1; }
        frame 88 { x: 77.2619556; y: -3.83941666; skew-x: -215.05082; skew-y: -215.05084; scale-x: 0.543914963; scale-y: 0.614227117; cel: 0; alpha: 1; }
        frame 89 { x: 71.3771297; y: 4.13921548; skew-x: -217.215197; skew-y: -217.215227; scale-x: 0.615473889; scale-y: 0.695036085; cel: 0; alpha: 1; }
        frame 90 { x: 65.328157; y: 10.559267; skew-x: -268.142971; skew-y: -268.143034; scale-x: 0.640102713; scale-y: 0.694525793; cel: 0; alpha: 1; }
        frame 91 { x: 55.025111; y: 14.8545261; skew-x: -319.896828; skew-y: -319.896735; scale-x: 1.00132986; scale-y: 1.06420299; cel: 0; alpha: 1; }
        frame 92 { x: 50.0126701; y: 24.6162757; skew-x: -332.816488; skew-y: -334.982108; scale-x: 0.943305493; scale-y: 1.02477942; cel: 0; alpha: 1; }
        frame 93 { x: 44.0151467; y: 34.6604819; skew-x: -350.536143; skew-y: -354.867471; scale-x: 0.945890749; scale-y: 1.04838593; cel: 0; alpha: 1; }
        frame 94 { x: 40.9741965; y: 45.7986964; skew-x: -353.454818; skew-y: -357.758533; scale-x: 0.908772838; scale-y: 1.0072828; cel: 0; alpha: 1; }
        frame 95 { x: 37.8519917; y: 56.7928736; skew-x: -355.967494; skew-y: -360.243643; scale-x: 0.876279775; scale-y: 0.971302328; cel: 0; alpha: 1; }
        frame 96 { x: 40.9063079; y: 73.802792; skew-x: -371.952724; skew-y: -376.257321; scale-x: 0.874952556; scale-y: 0.951946893; cel: 0; alpha: 1; }
        frame 97 { x: 43.9599412; y: 91.0661594; skew-x: -388.619257; skew-y: -392.952304; scale-x: 0.913675516; scale-y: 0.975678571; cel: 0; alpha: 1; }
        frame 98 { x: 44.9062668; y: 98.3620756; skew-x: -23.294695; skew-y: -27.6277562; scale-x: 0.846263441; scale-y: 0.903691879; cel: 0; alpha: 1; }
        frame 99 { x: 47.598861; y: 102.687943; skew-x: -0.0490435028; skew-y: -4.52124815; scale-x: 0.816760237; scale-y: 1.01409504; cel: 0; alpha: 1; }
        frame 100 { x: 47.1414577; y: 105.535155; skew-x: -5.42905434; skew-y: -9.8313056; scale-x: 0.728737605; scale-y: 0.822833308; cel: 0; alpha: 1; }
        frame 101 { x: 46.9090752; y: 107.696677; skew-x: -9.60282499; skew-y: -13.9350954; scale-x: 0.657906291; scale-y: 0.672875047; cel: 0; alpha: 1; }
        frame 102 { x: 47.0043943; y: 107.886929; skew-x: -4.54968817; skew-y: -6.71582667; scale-x: 0.68779498; scale-y: 0.733223606; cel: 0; alpha: 1; }
        frame 103 { x: 46.8191433; y: 108.051426; skew-x: 0.0969665341; skew-y: 0.0969639435; scale-x: 0.775025703; scale-y: 0.775025683; cel: 0; alpha: 1; }
    }
    Track {
        source-name: "Zombie_imp_innerleg_upper";
        frame-count: 104;
        frame 0 { x: 46.0530693; y: 102.368476; skew-x: -13.0999368; skew-y: -13.099937; scale-x: 0.755936932; scale-y: 0.755936912; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_INNERLEG_UPPER; }
        frame 1 { x: 48.2967216; y: 102.211379; skew-x: -14.1152728; skew-y: -14.1152749; scale-x: 0.736922837; scale-y: 0.736922895; cel: 0; alpha: 1; }
        frame 2 { x: 50.506856; y: 101.993754; skew-x: -15.3006497; skew-y: -15.3006518; scale-x: 0.728105148; scale-y: 0.728105126; cel: 0; alpha: 1; }
        frame 3 { x: 52.5399255; y: 101.777579; skew-x: -15.5831102; skew-y: -15.5831141; scale-x: 0.724732252; scale-y: 0.724732292; cel: 0; alpha: 1; }
        frame 4 { x: 53.1343481; y: 101.940067; skew-x: -8.81566172; skew-y: -8.8156618; scale-x: 0.724497864; scale-y: 0.724497837; cel: 0; alpha: 1; }
        frame 5 { x: 53.587968; y: 102.377505; skew-x: -3.18002544; skew-y: -3.18002701; scale-x: 0.722553102; scale-y: 0.722553122; cel: 0; alpha: 1; }
        frame 6 { x: 52.9464618; y: 103.299984; skew-x: -3.81356823; skew-y: -3.81356905; scale-x: 0.743533288; scale-y: 0.743533293; cel: 0; alpha: 1; }
        frame 7 { x: 52.6962058; y: 105.303074; skew-x: -12.3100709; skew-y: -10.2126111; scale-x: 0.746356967; scale-y: 0.749313504; cel: 0; alpha: 1; }
        frame 8 { x: 52.3028753; y: 107.232748; skew-x: -19.9618258; skew-y: -15.7668087; scale-x: 0.775907318; scale-y: 0.781012677; cel: 0; alpha: 1; }
        frame 9 { x: 52.0158313; y: 109.493085; skew-x: -28.3034262; skew-y: -22.0106773; scale-x: 0.808719541; scale-y: 0.815054688; cel: 0; alpha: 1; }
        frame 10 { x: 51.9041528; y: 108.342792; skew-x: -20.3683024; skew-y: -15.6488739; scale-x: 0.799359533; scale-y: 0.804972749; cel: 0; alpha: 1; }
        frame 11 { x: 52.1113769; y: 107.075917; skew-x: -11.3866913; skew-y: -8.24047022; scale-x: 0.780231558; scale-y: 0.784475924; cel: 0; alpha: 1; }
        frame 12 { x: 52.4103943; y: 105.990402; skew-x: -2.21578198; skew-y: -0.642691769; scale-x: 0.767666946; scale-y: 0.770043567; cel: 0; alpha: 1; }
        frame 13 { x: 52.4412046; y: 104.807517; skew-x: 6.15468024; skew-y: 6.15468588; scale-x: 0.782217066; scale-y: 0.782217084; cel: 0; alpha: 1; }
        frame 14 { x: 51.3637697; y: 103.8234; skew-x: 12.8132644; skew-y: 12.8132561; scale-x: 0.781541028; scale-y: 0.781541096; cel: 0; alpha: 1; }
        frame 15 { x: 50.0405554; y: 102.885279; skew-x: 19.4464884; skew-y: 19.4464866; scale-x: 0.792235751; scale-y: 0.792235749; cel: 0; alpha: 1; }
        frame 16 { x: 49.0391488; y: 102.09215; skew-x: 26.0439295; skew-y: 26.0439239; scale-x: 0.790386766; scale-y: 0.790386767; cel: 0; alpha: 1; }
        frame 17 { x: 49.8871001; y: 100.833275; skew-x: 30.9713309; skew-y: 30.9713314; scale-x: 0.717767643; scale-y: 0.717767672; cel: 0; alpha: 1; }
        frame 18 { x: 50.4431542; y: 99.9703288; skew-x: 32.0967764; skew-y: 32.0967686; scale-x: 0.704773297; scale-y: 0.704773306; cel: 0; alpha: 1; }
        frame 19 { x: 50.5306361; y: 99.1626566; skew-x: 32.8633872; skew-y: 32.8633975; scale-x: 0.762117375; scale-y: 0.762117397; cel: 0; alpha: 1; }
        frame 20 { x: 50.5934429; y: 99.4529429; skew-x: 35.3366916; skew-y: 35.3367041; scale-x: 0.789879103; scale-y: 0.789879056; cel: 0; alpha: 1; }
        frame 21 { x: 50.6065154; y: 99.9454184; skew-x: 37.9429097; skew-y: 37.9429073; scale-x: 0.823977739; scale-y: 0.823977693; cel: 0; alpha: 1; }
        frame 22 { x: 50.4559387; y: 100.31414; skew-x: 40.097569; skew-y: 40.0975689; scale-x: 0.864906668; scale-y: 0.864906663; cel: 0; alpha: 1; }
        frame 23 { x: 50.0882482; y: 100.690812; skew-x: 43.1219311; skew-y: 43.121927; scale-x: 0.800397421; scale-y: 0.800397392; cel: 0; alpha: 1; }
        frame 24 { x: 49.5664884; y: 100.784381; skew-x: 45.2882326; skew-y: 45.2882314; scale-x: 0.776871563; scale-y: 0.776871501; cel: 0; alpha: 1; }
        frame 25 { x: 49.2128534; y: 101.079884; skew-x: 48.4072669; skew-y: 48.4072607; scale-x: 0.766673116; scale-y: 0.766673043; cel: 0; alpha: 1; }
        frame 26 { x: 48.5568411; y: 100.866025; skew-x: 38.0540156; skew-y: 38.0540173; scale-x: 0.757352024; scale-y: 0.757352048; cel: 0; alpha: 1; }
        frame 27 { x: 48.1760723; y: 100.662888; skew-x: 29.0569371; skew-y: 29.05694; scale-x: 0.76479526; scale-y: 0.764795269; cel: 0; alpha: 1; }
        frame 28 { x: 47.8824547; y: 100.873038; skew-x: 20.3050964; skew-y: 20.305097; scale-x: 0.752811554; scale-y: 0.752811543; cel: 0; alpha: 1; }
        frame 29 { x: 46.9291146; y: 101.09904; skew-x: 8.8054819; skew-y: 8.80547591; scale-x: 0.762631977; scale-y: 0.762632001; cel: 0; alpha: 1; }
        frame 30 { x: 46.7374725; y: 101.331684; skew-x: 2.78632526; skew-y: 2.7863259; scale-x: 0.758840262; scale-y: 0.758840249; cel: 0; alpha: 1; }
        frame 31 { x: 46.3733592; y: 101.744939; skew-x: -4.81050679; skew-y: -4.81051005; scale-x: 0.756776528; scale-y: 0.756776524; cel: 0; alpha: 1; }
        frame 32 { x: 46.0530693; y: 102.368476; skew-x: -13.0999368; skew-y: -13.099937; scale-x: 0.755936932; scale-y: 0.755936912; cel: 0; alpha: 1; }
        frame 33 { x: 46.3955162; y: 100.566617; skew-x: 7.32980106; skew-y: 7.32979805; scale-x: 0.752748224; scale-y: 0.752748288; cel: 0; alpha: 1; }
        frame 34 { x: 46.4808257; y: 100.116254; skew-x: 9.11896961; skew-y: 9.02452452; scale-x: 0.752752918; scale-y: 0.762637859; cel: 0; alpha: 1; }
        frame 35 { x: 46.5963784; y: 99.6018672; skew-x: 10.99808; skew-y: 10.8103761; scale-x: 0.755373445; scale-y: 0.775210541; cel: 0; alpha: 1; }
        frame 36 { x: 46.8359007; y: 99.0157016; skew-x: 13.3109522; skew-y: 13.0311559; scale-x: 0.760528239; scale-y: 0.790484338; cel: 0; alpha: 1; }
        frame 37 { x: 46.8637859; y: 98.504193; skew-x: 14.8142076; skew-y: 14.4434298; scale-x: 0.7639813; scale-y: 0.804100731; cel: 0; alpha: 1; }
        frame 38 { x: 47.0474301; y: 98.3241977; skew-x: 15.6486097; skew-y: 15.1868557; scale-x: 0.769585951; scale-y: 0.820242598; cel: 0; alpha: 1; }
        frame 39 { x: 47.2739897; y: 98.2248046; skew-x: 15.8888368; skew-y: 15.3371757; scale-x: 0.771126973; scale-y: 0.83214465; cel: 0; alpha: 1; }
        frame 40 { x: 47.3522044; y: 97.8803699; skew-x: 16.4721822; skew-y: 15.8316544; scale-x: 0.78749271; scale-y: 0.86027867; cel: 0; alpha: 1; }
        frame 41 { x: 47.5186821; y: 97.6706578; skew-x: 17.5811025; skew-y: 16.8527056; scale-x: 0.792758776; scale-y: 0.876570699; cel: 0; alpha: 1; }
        frame 42 { x: 47.3563653; y: 98.6541198; skew-x: 17.5224654; skew-y: 17.0291341; scale-x: 0.779695526; scale-y: 0.83467921; cel: 0; alpha: 1; }
        frame 43 { x: 47.1890388; y: 99.4972859; skew-x: 17.8068249; skew-y: 17.5560508; scale-x: 0.767028229; scale-y: 0.794087772; cel: 0; alpha: 1; }
        frame 44 { x: 47.0042074; y: 100.76809; skew-x: 17.703146; skew-y: 17.7031425; scale-x: 0.732876977; scale-y: 0.732876913; cel: 0; alpha: 1; }
        frame 45 { x: 46.9973763; y: 100.497828; skew-x: 15.9353756; skew-y: 15.8408401; scale-x: 0.737465331; scale-y: 0.747157996; cel: 0; alpha: 1; }
        frame 46 { x: 47.0529785; y: 100.193685; skew-x: 14.373873; skew-y: 14.1860563; scale-x: 0.743216119; scale-y: 0.762747074; cel: 0; alpha: 1; }
        frame 47 { x: 46.9506066; y: 99.8584485; skew-x: 12.2857284; skew-y: 12.0058114; scale-x: 0.752242066; scale-y: 0.781885714; cel: 0; alpha: 1; }
        frame 48 { x: 46.5004307; y: 99.4935556; skew-x: 9.01973684; skew-y: 8.64886377; scale-x: 0.765709132; scale-y: 0.805930059; cel: 0; alpha: 1; }
        frame 49 { x: 46.5652807; y: 98.791271; skew-x: 9.76530264; skew-y: 9.20531603; scale-x: 0.778625537; scale-y: 0.841175125; cel: 0; alpha: 1; }
        frame 50 { x: 46.6991596; y: 98.2774542; skew-x: 9.89419271; skew-y: 9.14955253; scale-x: 0.782170581; scale-y: 0.866740386; cel: 0; alpha: 1; }
        frame 51 { x: 46.7945839; y: 97.505929; skew-x: 10.7447094; skew-y: 9.81956522; scale-x: 0.799792565; scale-y: 0.90847886; cel: 0; alpha: 1; }
        frame 52 { x: 46.8787365; y: 96.8842429; skew-x: 11.732237; skew-y: 10.6304783; scale-x: 0.805687434; scale-y: 0.937535078; cel: 0; alpha: 1; }
        frame 53 { x: 47.0083309; y: 98.1145274; skew-x: 13.7180513; skew-y: 12.966575; scale-x: 0.787141472; scale-y: 0.87308593; cel: 0; alpha: 1; }
        frame 54 { x: 47.1091379; y: 99.2035056; skew-x: 16.0900483; skew-y: 15.7049489; scale-x: 0.769050311; scale-y: 0.811067883; cel: 0; alpha: 1; }
        frame 55 { x: 47.0422853; y: 100.631171; skew-x: 17.7431261; skew-y: 17.7431227; scale-x: 0.734784585; scale-y: 0.734784521; cel: 0; alpha: 1; }
        frame 56 { x: 46.9521898; y: 100.703659; skew-x: 15.3775902; skew-y: 15.3775924; scale-x: 0.733390374; scale-y: 0.733390318; cel: 0; alpha: 1; }
        frame 57 { x: 46.9202254; y: 100.636695; skew-x: 13.27309; skew-y: 13.2730913; scale-x: 0.738499373; scale-y: 0.738499366; cel: 0; alpha: 1; }
        frame 58 { x: 46.6905189; y: 100.580903; skew-x: 10.451684; skew-y: 10.4516867; scale-x: 0.745904848; scale-y: 0.745904845; cel: 0; alpha: 1; }
        frame 59 { x: 46.3955162; y: 100.566617; skew-x: 7.32980106; skew-y: 7.32979805; scale-x: 0.752748224; scale-y: 0.752748288; cel: 0; alpha: 1; }
        frame 60 { x: 46.3955162; y: 100.566617; skew-x: 7.32980106; skew-y: 7.32979805; scale-x: 0.752748224; scale-y: 0.752748288; cel: 0; alpha: 1; }
        frame 61 { x: 48.1262872; y: 99.8216895; skew-x: 16.3853668; skew-y: 16.29161; scale-x: 0.761721744; scale-y: 0.771651037; cel: 0; alpha: 1; }
        frame 62 { x: 49.5152504; y: 99.4522873; skew-x: 23.7844312; skew-y: 23.5980592; scale-x: 0.762635767; scale-y: 0.782519813; cel: 0; alpha: 1; }
        frame 63 { x: 51.4310044; y: 98.9654124; skew-x: 32.7611191; skew-y: 32.4832673; scale-x: 0.777013126; scale-y: 0.807403956; cel: 0; alpha: 1; }
        frame 64 { x: 53.2970229; y: 98.7979111; skew-x: 41.1570632; skew-y: 40.7887556; scale-x: 0.78740819; scale-y: 0.828474792; cel: 0; alpha: 1; }
        frame 65 { x: 55.0133161; y: 98.7656603; skew-x: 48.856086; skew-y: 48.398371; scale-x: 0.798880848; scale-y: 0.850966221; cel: 0; alpha: 1; }
        frame 66 { x: 56.8660742; y: 99.0083095; skew-x: 56.995983; skew-y: 56.4498537; scale-x: 0.807714211; scale-y: 0.870912728; cel: 0; alpha: 1; }
        frame 67 { x: 61.1903102; y: 100.803518; skew-x: 74.5042857; skew-y: 73.8135831; scale-x: 0.819393995; scale-y: 0.901238387; cel: 0; alpha: 1; }
        frame 68 { x: 64.9498104; y: 103.369366; skew-x: 91.620124; skew-y: 90.7873947; scale-x: 0.833399523; scale-y: 0.934674983; cel: 0; alpha: 1; }
        frame 69 { x: 66.75065; y: 104.313408; skew-x: 97.1196244; skew-y: 96.1472315; scale-x: 0.837940137; scale-y: 0.957894731; cel: 0; alpha: 1; }
        frame 70 { x: 68.5740824; y: 105.609976; skew-x: 103.665533; skew-y: 102.55573; scale-x: 0.846679805; scale-y: 0.986198485; cel: 0; alpha: 1; }
        frame 71 { x: 68.4780994; y: 106.061913; skew-x: 99.2311152; skew-y: 98.4848567; scale-x: 0.808548896; scale-y: 0.896117166; cel: 0; alpha: 1; }
        frame 72 { x: 68.1896372; y: 106.380371; skew-x: 95.1884457; skew-y: 94.8228733; scale-x: 0.803341114; scale-y: 0.844920684; cel: 0; alpha: 1; }
        frame 73 { x: 68.0591306; y: 106.675955; skew-x: 92.9956263; skew-y: 93.0307837; scale-x: 0.844643739; scale-y: 0.840550461; cel: 0; alpha: 1; }
        frame 74 { x: 67.5487417; y: 107.519041; skew-x: 93.7089237; skew-y: 93.5435603; scale-x: 0.824940706; scale-y: 0.843998977; cel: 0; alpha: 1; }
        frame 75 { x: 67.0076973; y: 108.283065; skew-x: 94.087449; skew-y: 93.7190572; scale-x: 0.801301169; scale-y: 0.843103173; cel: 0; alpha: 1; }
        frame 76 { x: 68.8849794; y: 110.127347; skew-x: 95.5245284; skew-y: 94.4382092; scale-x: 0.856750828; scale-y: 0.994740929; cel: 0; alpha: 1; }
        frame 77 { x: 69.9714968; y: 112.274594; skew-x: 96.2749146; skew-y: 94.5505775; scale-x: 0.902561709; scale-y: 1.14227813; cel: 0; alpha: 1; }
        frame 78 { x: 70.0345581; y: 111.652549; skew-x: 95.9606537; skew-y: 94.5288587; scale-x: 0.89373837; scale-y: 1.08748773; cel: 0; alpha: 1; }
        frame 79 { x: 70.014565; y: 110.726611; skew-x: 95.1606806; skew-y: 94.031243; scale-x: 0.899007564; scale-y: 1.04995334; cel: 0; alpha: 1; }
        frame 80 { x: 67.2615569; y: 111.738378; skew-x: 94.8997651; skew-y: 94.3309349; scale-x: 0.891097813; scale-y: 0.963825461; cel: 0; alpha: 1; }
        frame 81 { x: 64.6043713; y: 112.673289; skew-x: 94.8924829; skew-y: 94.9277133; scale-x: 0.886641897; scale-y: 0.882336805; cel: 0; alpha: 1; }
        frame 82 { x: 99.4234135; y: 27.6557298; skew-x: -74.023348; skew-y: -74.0233367; scale-x: 0.979515563; scale-y: 0.979515183; cel: 0; alpha: 1; }
        frame 83 { x: 97.5095785; y: 24.2277951; skew-x: -61.1537906; skew-y: -61.1537869; scale-x: 0.878451011; scale-y: 0.87845104; cel: 0; alpha: 1; }
        frame 84 { x: 95.8888165; y: 21.0298336; skew-x: -47.3722313; skew-y: -47.3722543; scale-x: 0.807327313; scale-y: 0.80732745; cel: 0; alpha: 1; }
        frame 85 { x: 94.2497031; y: 17.5723245; skew-x: -31.1516862; skew-y: -31.1516643; scale-x: 0.767195722; scale-y: 0.767194991; cel: 0; alpha: 1; }
        frame 86 { x: 96.5605677; y: 10.9634126; skew-x: -71.5409226; skew-y: -71.540919; scale-x: 0.700241097; scale-y: 0.7002404; cel: 0; alpha: 1; }
        frame 87 { x: 89.5792684; y: 10.2493937; skew-x: -91.7259991; skew-y: -91.7259724; scale-x: 0.727086328; scale-y: 0.727086392; cel: 0; alpha: 1; }
        frame 88 { x: 76.0918027; y: 4.33176817; skew-x: -161.786011; skew-y: -161.786019; scale-x: 0.613988672; scale-y: 0.613989006; cel: 0; alpha: 1; }
        frame 89 { x: 74.3946303; y: 10.8053882; skew-x: -191.20222; skew-y: -191.202289; scale-x: 0.697255112; scale-y: 0.697255351; cel: 0; alpha: 1; }
        frame 90 { x: 72.0580652; y: 12.1229642; skew-x: -244.100989; skew-y: -244.101021; scale-x: 0.696765837; scale-y: 0.69676583; cel: 0; alpha: 1; }
        frame 91 { x: 66.5413923; y: 10.5013598; skew-x: -280.645867; skew-y: -280.645834; scale-x: 1.06767079; scale-y: 1.0676709; cel: 0; alpha: 1; }
        frame 92 { x: 58.6522469; y: 17.5890213; skew-x: -299.351643; skew-y: -299.697231; scale-x: 1.00540751; scale-y: 1.05453681; cel: 0; alpha: 1; }
        frame 93 { x: 49.0597799; y: 24.3835876; skew-x: -322.857073; skew-y: -323.533825; scale-x: 1.00777716; scale-y: 1.10632028; cel: 0; alpha: 1; }
        frame 94 { x: 44.9713236; y: 35.8486444; skew-x: -327.190689; skew-y: -327.868117; scale-x: 0.967130918; scale-y: 1.06170118; cel: 0; alpha: 1; }
        frame 95 { x: 40.9462063; y: 47.1904872; skew-x: -331.118365; skew-y: -331.796461; scale-x: 0.931490713; scale-y: 1.0225771; cel: 0; alpha: 1; }
        frame 96 { x: 41.5575835; y: 63.5612386; skew-x: -345.544023; skew-y: -346.22241; scale-x: 0.923142254; scale-y: 1.01341888; cel: 0; alpha: 1; }
        frame 97 { x: 41.7486359; y: 80.0186331; skew-x: -360.651016; skew-y: -361.329667; scale-x: 0.956860547; scale-y: 1.05044155; cel: 0; alpha: 1; }
        frame 98 { x: 43.7509461; y: 88.0164964; skew-x: 4.56345471; skew-y: 3.88480655; scale-x: 0.886262288; scale-y: 0.972938903; cel: 0; alpha: 1; }
        frame 99 { x: 47.3446443; y: 93.4199139; skew-x: 12.2695824; skew-y: 11.7726484; scale-x: 0.886295241; scale-y: 0.949193852; cel: 0; alpha: 1; }
        frame 100 { x: 49.556066; y: 96.957396; skew-x: 25.4834983; skew-y: 24.8965306; scale-x: 0.759446857; scale-y: 0.823408639; cel: 0; alpha: 1; }
        frame 101 { x: 51.3764552; y: 100.143137; skew-x: 39.9048661; skew-y: 39.2266942; scale-x: 0.658886684; scale-y: 0.723323266; cel: 0; alpha: 1; }
        frame 102 { x: 48.7419306; y: 100.0038; skew-x: 23.6098857; skew-y: 23.2670133; scale-x: 0.725000406; scale-y: 0.76007394; cel: 0; alpha: 1; }
        frame 103 { x: 45.8706185; y: 99.718797; skew-x: 6.91235105; skew-y: 6.91234805; scale-x: 0.774847987; scale-y: 0.774848054; cel: 0; alpha: 1; }
    }
    Track {
        source-name: "Zombie_imp_body2";
        frame-count: 104;
        frame 0 { x: 42.8873032; y: 89.2459082; skew-x: 10.9642956; skew-y: 7.99997857; scale-x: 1.00135867; scale-y: 0.998661915; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_BODY2; }
        frame 1 { x: 43.046243; y: 88.6202701; skew-x: 12.2084443; skew-y: 9.29998027; scale-x: 1.00029639; scale-y: 0.997713057; cel: 0; alpha: 1; }
        frame 2 { x: 43.2073361; y: 87.9159318; skew-x: 13.4525927; skew-y: 10.5999832; scale-x: 1.00023551; scale-y: 0.997762053; cel: 0; alpha: 1; }
        frame 3 { x: 43.2724257; y: 87.218698; skew-x: 14.896742; skew-y: 12.0999837; scale-x: 1.00017456; scale-y: 0.997810045; cel: 0; alpha: 1; }
        frame 4 { x: 42.4645876; y: 88.6513834; skew-x: 12.4803166; skew-y: 9.99998333; scale-x: 0.999961161; scale-y: 0.998063947; cel: 0; alpha: 1; }
        frame 5 { x: 41.7647159; y: 90.1864357; skew-x: 10.2638978; skew-y: 8.09998259; scale-x: 0.999747653; scale-y: 0.998287436; cel: 0; alpha: 1; }
        frame 6 { x: 41.0192754; y: 91.6224923; skew-x: 8.14748077; skew-y: 6.29998269; scale-x: 0.999534137; scale-y: 0.998480739; cel: 0; alpha: 1; }
        frame 7 { x: 40.8262059; y: 93.0521841; skew-x: 5.96534166; skew-y: 3.49997953; scale-x: 1.000048; scale-y: 0.998075295; cel: 0; alpha: 1; }
        frame 8 { x: 40.5713376; y: 94.2972066; skew-x: 4.08320511; skew-y: 0.999980331; scale-x: 1.00056197; scale-y: 0.99755386; cel: 0; alpha: 1; }
        frame 9 { x: 40.3494561; y: 95.7433055; skew-x: 2.30107099; skew-y: -1.40001946; scale-x: 1.0010761; scale-y: 0.996916472; cel: 0; alpha: 1; }
        frame 10 { x: 40.3921299; y: 95.2204542; skew-x: 3.45620625; skew-y: -0.208375625; scale-x: 1.00000604; scale-y: 0.996057947; cel: 0; alpha: 1; }
        frame 11 { x: 40.5583151; y: 94.6730543; skew-x: 4.31134374; skew-y: 0.683217489; scale-x: 0.999938148; scale-y: 0.996188227; cel: 0; alpha: 1; }
        frame 12 { x: 40.7630414; y: 94.2443586; skew-x: 5.25881081; skew-y: 1.66843792; scale-x: 0.999899396; scale-y: 0.996105762; cel: 0; alpha: 1; }
        frame 13 { x: 40.7376737; y: 93.6152176; skew-x: 6.30645714; skew-y: 2.75347469; scale-x: 0.999861071; scale-y: 0.996020791; cel: 0; alpha: 1; }
        frame 14 { x: 41.3870918; y: 92.3960259; skew-x: 8.56320325; skew-y: 4.77086106; scale-x: 1.00013592; scale-y: 0.99574372; cel: 0; alpha: 1; }
        frame 15 { x: 41.8873629; y: 91.1622998; skew-x: 11.1199457; skew-y: 7.08824731; scale-x: 0.999408519; scale-y: 0.994451716; cel: 0; alpha: 1; }
        frame 16 { x: 42.5818287; y: 90.042848; skew-x: 13.4766843; skew-y: 9.20563824; scale-x: 1.00068591; scale-y: 0.995137013; cel: 0; alpha: 1; }
        frame 17 { x: 42.7281577; y: 89.8568872; skew-x: 14.2844538; skew-y: 11.4370872; scale-x: 0.99878937; scale-y: 0.995708241; cel: 0; alpha: 1; }
        frame 18 { x: 42.9127877; y: 89.7690576; skew-x: 15.1922178; skew-y: 13.7685328; scale-x: 0.996894081; scale-y: 0.995661972; cel: 0; alpha: 1; }
        frame 19 { x: 42.8845858; y: 89.6285197; skew-x: 16.0999893; skew-y: 16.0999848; scale-x: 0.997000095; scale-y: 0.996999913; cel: 0; alpha: 1; }
        frame 20 { x: 42.3586671; y: 90.5386365; skew-x: 13.6121595; skew-y: 12.3656682; scale-x: 0.996680735; scale-y: 0.995738824; cel: 0; alpha: 1; }
        frame 21 { x: 41.8000399; y: 91.6709236; skew-x: 11.1243384; skew-y: 8.63135041; scale-x: 0.998362454; scale-y: 0.996005443; cel: 0; alpha: 1; }
        frame 22 { x: 41.1591332; y: 92.6820114; skew-x: 8.73650981; skew-y: 4.99703127; scale-x: 1.00004517; scale-y: 0.995798974; cel: 0; alpha: 1; }
        frame 23 { x: 40.7883825; y: 94.1863179; skew-x: 5.72342852; skew-y: 2.73134848; scale-x: 0.999469877; scale-y: 0.99658864; cel: 0; alpha: 1; }
        frame 24 { x: 40.4683743; y: 95.4746336; skew-x: 2.81034321; skew-y: 0.565662918; scale-x: 0.998894909; scale-y: 0.997208766; cel: 0; alpha: 1; }
        frame 25 { x: 40.3632696; y: 96.9962263; skew-x: 0.0972594307; skew-y: -1.40001689; scale-x: 0.999320572; scale-y: 0.99865888; cel: 0; alpha: 1; }
        frame 26 { x: 40.7115703; y: 95.6983368; skew-x: 2.04218493; skew-y: 0.360106562; scale-x: 0.999472865; scale-y: 0.998603145; cel: 0; alpha: 1; }
        frame 27 { x: 41.2767058; y: 94.4207811; skew-x: 3.48711375; skew-y: 1.6202437; scale-x: 0.999624943; scale-y: 0.998539248; cel: 0; alpha: 1; }
        frame 28 { x: 41.8738201; y: 93.3333897; skew-x: 5.11275916; skew-y: 3.0601048; scale-x: 0.999686441; scale-y: 0.998395606; cel: 0; alpha: 1; }
        frame 29 { x: 41.9464322; y: 91.9678561; skew-x: 7.03839096; skew-y: 4.79998002; scale-x: 0.999747782; scale-y: 0.998237543; cel: 0; alpha: 1; }
        frame 30 { x: 42.3876862; y: 91.0473477; skew-x: 8.28035778; skew-y: 5.79998012; scale-x: 0.999951031; scale-y: 0.998064049; cel: 0; alpha: 1; }
        frame 31 { x: 42.6297623; y: 90.1250195; skew-x: 9.52232793; skew-y: 6.7999815; scale-x: 1.00015423; scale-y: 0.997872546; cel: 0; alpha: 1; }
        frame 32 { x: 42.8873032; y: 89.2459082; skew-x: 10.9642956; skew-y: 7.99997857; scale-x: 1.00135867; scale-y: 0.998661915; cel: 0; alpha: 1; }
        frame 33 { x: 42.8871022; y: 89.29579; skew-x: 10.9642955; skew-y: 7.99997947; scale-x: 1.00135869; scale-y: 0.998661918; cel: 0; alpha: 1; }
        frame 34 { x: 42.9426674; y: 89.2043928; skew-x: 12.0803525; skew-y: 8.65846453; scale-x: 1.00094464; scale-y: 0.997268276; cel: 0; alpha: 1; }
        frame 35 { x: 43.0486738; y: 89.029863; skew-x: 13.2964099; skew-y: 9.41694806; scale-x: 1.00153205; scale-y: 0.996809722; cel: 0; alpha: 1; }
        frame 36 { x: 43.2385791; y: 88.8268903; skew-x: 14.3124728; skew-y: 9.9754273; scale-x: 1.00211966; scale-y: 0.996287753; cel: 0; alpha: 1; }
        frame 37 { x: 43.2801906; y: 88.6211663; skew-x: 15.6285193; skew-y: 10.8339133; scale-x: 1.00270723; scale-y: 0.995701715; cel: 0; alpha: 1; }
        frame 38 { x: 43.3637516; y: 88.2714071; skew-x: 16.0629488; skew-y: 10.8512847; scale-x: 1.00153229; scale-y: 0.995001067; cel: 0; alpha: 1; }
        frame 39 { x: 43.4983723; y: 87.9449847; skew-x: 16.597391; skew-y: 10.9686558; scale-x: 1.00136107; scale-y: 0.995243388; cel: 0; alpha: 1; }
        frame 40 { x: 43.5294087; y: 87.4114657; skew-x: 17.1318135; skew-y: 11.0860274; scale-x: 1.00118977; scale-y: 0.995431517; cel: 0; alpha: 1; }
        frame 41 { x: 43.6101027; y: 86.9977536; skew-x: 17.7662474; skew-y: 11.303398; scale-x: 1.00202149; scale-y: 0.996563305; cel: 0; alpha: 1; }
        frame 42 { x: 42.4148408; y: 89.6218574; skew-x: 10.5651609; skew-y: 7.0526449; scale-x: 0.996094332; scale-y: 0.99526591; cel: 0; alpha: 1; }
        frame 43 { x: 41.433099; y: 92.1732195; skew-x: 3.37361476; skew-y: 2.79738308; scale-x: 0.99055072; scale-y: 0.994269686; cel: 0; alpha: 1; }
        frame 44 { x: 40.6181554; y: 95.1067264; skew-x: -3.60545587; skew-y: -1.28503217; scale-x: 0.984407599; scale-y: 0.992574364; cel: 0; alpha: 1; }
        frame 45 { x: 41.1968217; y: 93.5892122; skew-x: 1.2627002; skew-y: 1.75385319; scale-x: 0.992294351; scale-y: 0.994563235; cel: 0; alpha: 1; }
        frame 46 { x: 41.9163688; y: 92.0729532; skew-x: 5.87283477; skew-y: 4.57104458; scale-x: 0.999167976; scale-y: 0.998596366; cel: 0; alpha: 1; }
        frame 47 { x: 42.6471812; y: 90.6806114; skew-x: 9.73343035; skew-y: 7.55153298; scale-x: 0.999306961; scale-y: 0.997416021; cel: 0; alpha: 1; }
        frame 48 { x: 43.175141; y: 89.2188427; skew-x: 13.5948209; skew-y: 10.8339169; scale-x: 1.00037309; scale-y: 0.998038553; cel: 0; alpha: 1; }
        frame 49 { x: 43.3574295; y: 88.4590977; skew-x: 15.0853616; skew-y: 11.4095004; scale-x: 1.00067109; scale-y: 0.996167268; cel: 0; alpha: 1; }
        frame 50 { x: 43.6000176; y: 87.8260119; skew-x: 16.675914; skew-y: 12.0850812; scale-x: 1.00197079; scale-y: 0.995041251; cel: 0; alpha: 1; }
        frame 51 { x: 43.8493503; y: 86.9890591; skew-x: 18.2664648; skew-y: 12.7606605; scale-x: 1.00327055; scale-y: 0.993661296; cel: 0; alpha: 1; }
        frame 52 { x: 44.05934; y: 86.2758495; skew-x: 19.957014; skew-y: 13.5362497; scale-x: 1.00557705; scale-y: 0.993021852; cel: 0; alpha: 1; }
        frame 53 { x: 42.7051613; y: 89.1450056; skew-x: 12.0282173; skew-y: 8.5414338; scale-x: 0.998101683; scale-y: 0.993236075; cel: 0; alpha: 1; }
        frame 54 { x: 41.6058894; y: 91.9731802; skew-x: 4.10716185; skew-y: 3.5392899; scale-x: 0.991378184; scale-y: 0.993417585; cel: 0; alpha: 1; }
        frame 55 { x: 40.6181554; y: 95.1067273; skew-x: -3.60545845; skew-y: -1.28503291; scale-x: 0.984407602; scale-y: 0.992574347; cel: 0; alpha: 1; }
        frame 56 { x: 41.1236618; y: 93.6599226; skew-x: 0.621710957; skew-y: 1.06517138; scale-x: 0.99260665; scale-y: 0.994360846; cel: 0; alpha: 1; }
        frame 57 { x: 41.7514162; y: 92.1041915; skew-x: 4.59361625; skew-y: 3.19075699; scale-x: 0.999366482; scale-y: 0.998597989; cel: 0; alpha: 1; }
        frame 58 { x: 42.3131549; y: 90.6868034; skew-x: 7.77996275; skew-y: 5.44592625; scale-x: 0.999428556; scale-y: 0.998201148; cel: 0; alpha: 1; }
        frame 59 { x: 42.8871022; y: 89.29579; skew-x: 10.9642955; skew-y: 7.99997947; scale-x: 1.00135869; scale-y: 0.998661918; cel: 0; alpha: 1; }
        frame 60 { x: 42.8871022; y: 89.29579; skew-x: 10.9642955; skew-y: 7.99997947; scale-x: 1.00135869; scale-y: 0.998661918; cel: 0; alpha: 1; }
        frame 61 { x: 43.9147574; y: 90.1844692; skew-x: 9.53502074; skew-y: 7.79792019; scale-x: 1.0007193; scale-y: 0.998637412; cel: 0; alpha: 1; }
        frame 62 { x: 44.5952195; y: 91.1869042; skew-x: 8.40573063; skew-y: 7.89585764; scale-x: 1.00007955; scale-y: 0.998153574; cel: 0; alpha: 1; }
        frame 63 { x: 45.6985728; y: 92.0546619; skew-x: 6.97645081; skew-y: 7.69379585; scale-x: 1.00044194; scale-y: 0.998211636; cel: 0; alpha: 1; }
        frame 64 { x: 46.6927055; y: 93.0067049; skew-x: 5.7471609; skew-y: 7.69173635; scale-x: 0.999801969; scale-y: 0.996811942; cel: 0; alpha: 1; }
        frame 65 { x: 47.5413013; y: 93.8837715; skew-x: 4.61788278; skew-y: 7.78967422; scale-x: 1.00016489; scale-y: 0.995955269; cel: 0; alpha: 1; }
        frame 66 { x: 48.5054832; y: 94.9042426; skew-x: 3.38859954; skew-y: 7.78761032; scale-x: 0.999524709; scale-y: 0.993643904; cel: 0; alpha: 1; }
        frame 67 { x: 51.6727151; y: 94.9376314; skew-x: 13.0073959; skew-y: 18.0875807; scale-x: 0.999724353; scale-y: 0.991668644; cel: 0; alpha: 1; }
        frame 68 { x: 55.1499013; y: 95.3509064; skew-x: 22.6261893; skew-y: 28.3875485; scale-x: 0.999922958; scale-y: 0.989555275; cel: 0; alpha: 1; }
        frame 69 { x: 58.8163443; y: 95.8860986; skew-x: 32.4449824; skew-y: 38.8875168; scale-x: 1.0001207; scale-y: 0.987304496; cel: 0; alpha: 1; }
        frame 70 { x: 62.7638489; y: 97.140919; skew-x: 42.1637781; skew-y: 49.2874929; scale-x: 1.00233398; scale-y: 0.986902435; cel: 0; alpha: 1; }
        frame 71 { x: 63.4371699; y: 98.2300143; skew-x: 41.1561484; skew-y: 49.1845639; scale-x: 0.99099951; scale-y: 0.98304664; cel: 0; alpha: 1; }
        frame 72 { x: 63.8890383; y: 99.2408156; skew-x: 40.3485215; skew-y: 49.2816339; scale-x: 0.981678163; scale-y: 0.980930662; cel: 0; alpha: 1; }
        frame 73 { x: 64.3565578; y: 100.370953; skew-x: 39.4408943; skew-y: 49.2787067; scale-x: 0.973333158; scale-y: 0.979555714; cel: 0; alpha: 1; }
        frame 74 { x: 63.5515799; y: 101.489832; skew-x: 36.424859; skew-y: 50.9646711; scale-x: 0.992932629; scale-y: 0.964397465; cel: 0; alpha: 1; }
        frame 75 { x: 62.7802126; y: 102.557382; skew-x: 33.5255897; skew-y: 52.897897; scale-x: 1.01389051; scale-y: 0.945747824; cel: 0; alpha: 1; }
        frame 76 { x: 63.1280924; y: 101.410569; skew-x: 35.7107859; skew-y: 49.4414173; scale-x: 1.00839955; scale-y: 0.967768003; cel: 0; alpha: 1; }
        frame 77 { x: 63.2954689; y: 99.9958024; skew-x: 38.0108243; skew-y: 46.2378383; scale-x: 1.00432111; scale-y: 0.983777512; cel: 0; alpha: 1; }
        frame 78 { x: 62.6250478; y: 99.9112613; skew-x: 35.5020243; skew-y: 44.6308576; scale-x: 1.00589493; scale-y: 0.980458803; cel: 0; alpha: 1; }
        frame 79 { x: 61.9176489; y: 99.5649911; skew-x: 33.0932376; skew-y: 43.1238827; scale-x: 1.00949736; scale-y: 0.978873638; cel: 0; alpha: 1; }
        frame 80 { x: 62.5940568; y: 99.5409318; skew-x: 36.7152905; skew-y: 44.5311042; scale-x: 1.00383405; scale-y: 0.982669806; cel: 0; alpha: 1; }
        frame 81 { x: 63.4611452; y: 99.4762542; skew-x: 40.4163813; skew-y: 46.115943; scale-x: 0.997819502; scale-y: 0.989618691; cel: 0; alpha: 1; }
        frame 82 { x: 92.3909255; y: 25.5702311; skew-x: -70.4955967; skew-y: -70.4956086; scale-x: 0.994792321; scale-y: 0.994791959; cel: 0; alpha: 1; }
        frame 83 { x: 91.0489944; y: 24.9664073; skew-x: -72.0092826; skew-y: -72.009283; scale-x: 0.992539971; scale-y: 0.992539777; cel: 0; alpha: 1; }
        frame 84 { x: 89.7087327; y: 24.4957644; skew-x: -73.322976; skew-y: -73.3229663; scale-x: 0.991294735; scale-y: 0.99129449; cel: 0; alpha: 1; }
        frame 85 { x: 88.162868; y: 23.7904777; skew-x: -74.8366659; skew-y: -74.8366829; scale-x: 0.991055564; scale-y: 0.991055551; cel: 0; alpha: 1; }
        frame 86 { x: 94.3082498; y: 20.4636164; skew-x: -113.691593; skew-y: -113.691605; scale-x: 0.988860754; scale-y: 0.988860452; cel: 0; alpha: 1; }
        frame 87 { x: 91.6462889; y: 18.7031563; skew-x: -134.038712; skew-y: -134.038727; scale-x: 0.989060674; scale-y: 0.989060486; cel: 0; alpha: 1; }
        frame 88 { x: 89.1055167; y: 7.05981919; skew-x: -190.116915; skew-y: -190.116922; scale-x: 0.986851506; scale-y: 0.986851643; cel: 0; alpha: 1; }
        frame 89 { x: 82.963022; y: 9.19033233; skew-x: -224.039162; skew-y: -224.03916; scale-x: 0.989045375; scale-y: 0.989045485; cel: 0; alpha: 1; }
        frame 90 { x: 79.9938013; y: 8.60263528; skew-x: -246.306802; skew-y: -246.306795; scale-x: 0.985650463; scale-y: 0.985650698; cel: 0; alpha: 1; }
        frame 91 { x: 74.420359; y: 8.82051249; skew-x: -268.37444; skew-y: -268.374443; scale-x: 0.984265943; scale-y: 0.984265857; cel: 0; alpha: 1; }
        frame 92 { x: 65.9012392; y: 12.4963928; skew-x: -280.42153; skew-y: -286.26876; scale-x: 0.993126896; scale-y: 0.977617452; cel: 0; alpha: 1; }
        frame 93 { x: 56.1398698; y: 16.7116173; skew-x: -292.368606; skew-y: -304.063079; scale-x: 1.00300406; scale-y: 0.961809767; cel: 0; alpha: 1; }
        frame 94 { x: 50.783892; y: 27.3968613; skew-x: -298.754461; skew-y: -310.486617; scale-x: 0.999884133; scale-y: 0.958827038; cel: 0; alpha: 1; }
        frame 95 { x: 45.486974; y: 38.1317509; skew-x: -305.140323; skew-y: -316.910126; scale-x: 0.999834288; scale-y: 0.958787858; cel: 0; alpha: 1; }
        frame 96 { x: 43.6336763; y: 53.5948044; skew-x: -318.153134; skew-y: -329.886249; scale-x: 0.998870455; scale-y: 0.957859643; cel: 0; alpha: 1; }
        frame 97 { x: 41.924483; y: 69.6433091; skew-x: -331.465958; skew-y: -343.162369; scale-x: 0.999953273; scale-y: 0.958893738; cel: 0; alpha: 1; }
        frame 98 { x: 41.4433338; y: 78.8706216; skew-x: 16.8342594; skew-y: 5.13785168; scale-x: 0.997906297; scale-y: 0.956930658; cel: 0; alpha: 1; }
        frame 99 { x: 43.3277475; y: 88.8434875; skew-x: -0.968524989; skew-y: -4.82169956; scale-x: 0.986166816; scale-y: 0.977860394; cel: 0; alpha: 1; }
        frame 100 { x: 43.3107341; y: 94.1952233; skew-x: -6.85780311; skew-y: -9.86178641; scale-x: 0.98332627; scale-y: 0.978606509; cel: 0; alpha: 1; }
        frame 101 { x: 43.1129562; y: 99.0268711; skew-x: -12.5470887; skew-y: -14.7018764; scale-x: 0.980486639; scale-y: 0.979137483; cel: 0; alpha: 1; }
        frame 102 { x: 42.6617282; y: 93.946491; skew-x: -0.441389791; skew-y: -3.00094766; scale-x: 0.977884456; scale-y: 0.975915683; cel: 0; alpha: 1; }
        frame 103 { x: 42.8126811; y: 88.6387321; skew-x: 11.9642955; skew-y: 8.99997947; scale-x: 0.976324718; scale-y: 0.97369537; cel: 0; alpha: 1; }
    }
    Track {
        source-name: "Zombie_imp_body1";
        frame-count: 104;
        frame 0 { x: 37.5; y: 63.2; skew-x: 8; skew-y: 8; image: IMAGE_REANIM_ZOMBIE_IMP_HD_BODY1; }
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
        frame 0 { x: 46.8251566; y: 116.337364; skew-x: -2.2767643; skew-y: -2.27676839; scale-x: 0.999374117; scale-y: 0.999374087; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_OUTERLEG_FOOT; }
        frame 1 { x: 44.6883295; y: 116.853959; skew-x: -6.95268675; skew-y: -6.95269437; scale-x: 0.997118923; scale-y: 0.997118894; cel: 0; alpha: 1; }
        frame 2 { x: 42.6073087; y: 117.347339; skew-x: -11.6286127; skew-y: -11.6286201; scale-x: 0.995862957; scale-y: 0.995863033; cel: 0; alpha: 1; }
        frame 3 { x: 40.3755753; y: 117.861435; skew-x: -16.1045382; skew-y: -16.1045461; scale-x: 0.994606838; scale-y: 0.994606934; cel: 0; alpha: 1; }
        frame 4 { x: 39.7033715; y: 114.28079; skew-x: 3.52461832; skew-y: 3.52461508; scale-x: 0.993619776; scale-y: 0.993619721; cel: 0; alpha: 1; }
        frame 5 { x: 39.8572165; y: 111.557649; skew-x: 23.3537748; skew-y: 23.35377; scale-x: 0.992632498; scale-y: 0.992632324; cel: 0; alpha: 1; }
        frame 6 { x: 40.4421509; y: 109.739561; skew-x: 43.2829221; skew-y: 43.2829236; scale-x: 0.991644917; scale-y: 0.991644777; cel: 0; alpha: 1; }
        frame 7 { x: 40.302328; y: 111.769248; skew-x: 26.7062922; skew-y: 26.7062847; scale-x: 0.991745784; scale-y: 0.991745755; cel: 0; alpha: 1; }
        frame 8 { x: 40.309273; y: 114.305981; skew-x: 10.4296482; skew-y: 10.4296403; scale-x: 0.991846668; scale-y: 0.99184648; cel: 0; alpha: 1; }
        frame 9 { x: 40.7994051; y: 117.621728; skew-x: -5.74698753; skew-y: -5.74699732; scale-x: 0.991947509; scale-y: 0.991947511; cel: 0; alpha: 1; }
        frame 10 { x: 41.3496414; y: 117.858501; skew-x: -6.25576616; skew-y: -6.25426553; scale-x: 0.990722817; scale-y: 0.990848586; cel: 0; alpha: 1; }
        frame 11 { x: 42.1390108; y: 118.083985; skew-x: -7.06485843; skew-y: -7.06121602; scale-x: 0.990492496; scale-y: 0.990732475; cel: 0; alpha: 1; }
        frame 12 { x: 42.9283814; y: 118.420057; skew-x: -7.77884508; skew-y: -7.77643461; scale-x: 0.990289254; scale-y: 0.99040687; cel: 0; alpha: 1; }
        frame 13 { x: 43.4427337; y: 118.5555; skew-x: -8.39224228; skew-y: -8.3922489; scale-x: 0.990082842; scale-y: 0.990082775; cel: 0; alpha: 1; }
        frame 14 { x: 45.0533415; y: 118.619467; skew-x: -8.84715897; skew-y: -8.84716632; scale-x: 0.989751155; scale-y: 0.989751117; cel: 0; alpha: 1; }
        frame 15 { x: 46.3472993; y: 118.64355; skew-x: -9.00207521; skew-y: -9.00208425; scale-x: 0.988427962; scale-y: 0.98842807; cel: 0; alpha: 1; }
        frame 16 { x: 47.9131576; y: 118.804984; skew-x: -9.35699115; skew-y: -9.35700116; scale-x: 0.989087484; scale-y: 0.989087456; cel: 0; alpha: 1; }
        frame 17 { x: 50.2749234; y: 119.862073; skew-x: -24.2912531; skew-y: -24.2912576; scale-x: 0.987468372; scale-y: 0.987468429; cel: 0; alpha: 1; }
        frame 18 { x: 53.2464446; y: 121.171563; skew-x: -39.1255107; skew-y: -39.1255153; scale-x: 0.985850183; scale-y: 0.985850332; cel: 0; alpha: 1; }
        frame 19 { x: 56.6729801; y: 122.474221; skew-x: -53.9597689; skew-y: -53.959771; scale-x: 0.986211225; scale-y: 0.986211399; cel: 0; alpha: 1; }
        frame 20 { x: 57.6716271; y: 123.030139; skew-x: -57.7441265; skew-y: -57.7441273; scale-x: 0.983863545; scale-y: 0.98386363; cel: 0; alpha: 1; }
        frame 21 { x: 58.6870367; y: 123.810528; skew-x: -61.5284758; skew-y: -61.5284778; scale-x: 0.98349206; scale-y: 0.983492234; cel: 0; alpha: 1; }
        frame 22 { x: 59.5825655; y: 124.436371; skew-x: -65.2128362; skew-y: -65.2128323; scale-x: 0.983118752; scale-y: 0.983118833; cel: 0; alpha: 1; }
        frame 23 { x: 59.6799374; y: 125.303401; skew-x: -70.2179121; skew-y: -70.2179111; scale-x: 0.981917543; scale-y: 0.981917617; cel: 0; alpha: 1; }
        frame 24 { x: 59.7923174; y: 125.932021; skew-x: -75.1229905; skew-y: -75.1229907; scale-x: 0.98071695; scale-y: 0.980717071; cel: 0; alpha: 1; }
        frame 25 { x: 60.0508817; y: 126.83518; skew-x: -79.8280698; skew-y: -79.8280671; scale-x: 0.980498537; scale-y: 0.980498615; cel: 0; alpha: 1; }
        frame 26 { x: 56.418485; y: 125.604478; skew-x: -66.6741494; skew-y: -66.674959; scale-x: 0.983251236; scale-y: 0.983253896; cel: 0; alpha: 1; }
        frame 27 { x: 53.676046; y: 124.016162; skew-x: -54.0202701; skew-y: -54.0217701; scale-x: 0.986010663; scale-y: 0.98600355; cel: 0; alpha: 1; }
        frame 28 { x: 51.3266193; y: 122.532814; skew-x: -41.1870322; skew-y: -41.1875365; scale-x: 0.988686399; scale-y: 0.988678457; cel: 0; alpha: 1; }
        frame 29 { x: 48.7783538; y: 120.780187; skew-x: -28.0535404; skew-y: -28.0535517; scale-x: 0.991354894; scale-y: 0.991354953; cel: 0; alpha: 1; }
        frame 30 { x: 48.0893795; y: 119.197381; skew-x: -19.5279501; skew-y: -19.5279543; scale-x: 0.993695766; scale-y: 0.993695841; cel: 0; alpha: 1; }
        frame 31 { x: 47.4007331; y: 117.677859; skew-x: -11.0023511; skew-y: -11.0023605; scale-x: 0.996035701; scale-y: 0.996035769; cel: 0; alpha: 1; }
        frame 32 { x: 46.8251566; y: 116.337364; skew-x: -2.2767643; skew-y: -2.27676839; scale-x: 0.999374117; scale-y: 0.999374087; cel: 0; alpha: 1; }
        frame 33 { x: 51.0269426; y: 116.38388; skew-x: -2.27676429; skew-y: -2.27676766; scale-x: 0.999374123; scale-y: 0.999374086; cel: 0; alpha: 1; }
        frame 34 { x: 50.9958829; y: 116.417755; skew-x: -2.30856554; skew-y: -2.30857339; scale-x: 0.998462374; scale-y: 0.99846235; cel: 0; alpha: 1; }
        frame 35 { x: 50.9697898; y: 116.407197; skew-x: -2.24037211; skew-y: -2.2403784; scale-x: 0.998550024; scale-y: 0.998549987; cel: 0; alpha: 1; }
        frame 36 { x: 51.1173226; y: 116.3381; skew-x: -2.3721747; skew-y: -2.3721829; scale-x: 0.99863771; scale-y: 0.998637763; cel: 0; alpha: 1; }
        frame 37 { x: 50.9664226; y: 116.304626; skew-x: -2.20398142; skew-y: -2.20399003; scale-x: 0.998725414; scale-y: 0.998725379; cel: 0; alpha: 1; }
        frame 38 { x: 50.8629827; y: 116.540323; skew-x: -3.88833153; skew-y: -3.88834128; scale-x: 0.997698987; scale-y: 0.997698937; cel: 0; alpha: 1; }
        frame 39 { x: 50.7749697; y: 116.844357; skew-x: -5.47267971; skew-y: -5.47269143; scale-x: 0.997672265; scale-y: 0.997672255; cel: 0; alpha: 1; }
        frame 40 { x: 50.5884246; y: 116.944948; skew-x: -7.05703376; skew-y: -7.05704337; scale-x: 0.99764558; scale-y: 0.997645521; cel: 0; alpha: 1; }
        frame 41 { x: 50.410841; y: 117.210971; skew-x: -8.54138451; skew-y: -8.54139264; scale-x: 0.998618538; scale-y: 0.998618509; cel: 0; alpha: 1; }
        frame 42 { x: 50.5406666; y: 116.613268; skew-x: -7.09095104; skew-y: -6.39476473; scale-x: 0.998218467; scale-y: 0.991362879; cel: 0; alpha: 1; }
        frame 43 { x: 50.6653792; y: 115.985044; skew-x: -5.72924415; skew-y: -4.15711314; scale-x: 0.994300269; scale-y: 0.989698224; cel: 0; alpha: 1; }
        frame 44 { x: 50.6834278; y: 115.794035; skew-x: -4.11329837; skew-y: -1.78408809; scale-x: 0.985529702; scale-y: 0.992990811; cel: 0; alpha: 1; }
        frame 45 { x: 50.8410692; y: 115.989649; skew-x: -3.06958394; skew-y: -1.8789052; scale-x: 0.99402147; scale-y: 0.993540866; cel: 0; alpha: 1; }
        frame 46 { x: 51.1307634; y: 116.224856; skew-x: -2.279371; skew-y: -2.19930452; scale-x: 0.99893093; scale-y: 0.9988412; cel: 0; alpha: 1; }
        frame 47 { x: 51.2426711; y: 116.304893; skew-x: -2.24221033; skew-y: -2.35163594; scale-x: 0.997859693; scale-y: 0.998314324; cel: 0; alpha: 1; }
        frame 48 { x: 50.9664221; y: 116.304625; skew-x: -2.20397676; skew-y: -2.20398632; scale-x: 0.998725394; scale-y: 0.99872542; cel: 0; alpha: 1; }
        frame 49 { x: 50.825698; y: 116.452755; skew-x: -3.88833172; skew-y: -3.88833856; scale-x: 0.997698936; scale-y: 0.997698934; cel: 0; alpha: 1; }
        frame 50 { x: 50.7004606; y: 116.769258; skew-x: -5.47268256; skew-y: -5.47268968; scale-x: 0.997672281; scale-y: 0.997672295; cel: 0; alpha: 1; }
        frame 51 { x: 50.5767487; y: 116.88235; skew-x: -7.05703203; skew-y: -7.05704045; scale-x: 0.99764557; scale-y: 0.997645688; cel: 0; alpha: 1; }
        frame 52 { x: 50.3611234; y: 117.161094; skew-x: -8.54137733; skew-y: -8.54138892; scale-x: 0.998618521; scale-y: 0.998618563; cel: 0; alpha: 1; }
        frame 53 { x: 50.5405884; y: 116.612766; skew-x: -7.09094636; skew-y: -6.39476434; scale-x: 0.998218482; scale-y: 0.991362947; cel: 0; alpha: 1; }
        frame 54 { x: 50.7152725; y: 116.035273; skew-x: -5.72924286; skew-y: -4.15711129; scale-x: 0.994300256; scale-y: 0.989698188; cel: 0; alpha: 1; }
        frame 55 { x: 50.6834281; y: 115.794035; skew-x: -4.11330093; skew-y: -1.78408884; scale-x: 0.985529705; scale-y: 0.992990794; cel: 0; alpha: 1; }
        frame 56 { x: 50.8147232; y: 116.037907; skew-x: -3.06958877; skew-y: -1.87890811; scale-x: 0.994021453; scale-y: 0.993540917; cel: 0; alpha: 1; }
        frame 57 { x: 51.0805951; y: 116.224734; skew-x: -2.27937533; skew-y: -2.19930578; scale-x: 0.998930968; scale-y: 0.998841286; cel: 0; alpha: 1; }
        frame 58 { x: 51.1239433; y: 116.296137; skew-x: -2.2855689; skew-y: -2.38017946; scale-x: 0.997816734; scale-y: 0.998998466; cel: 0; alpha: 1; }
        frame 59 { x: 51.0269426; y: 116.38388; skew-x: -2.27676429; skew-y: -2.27676766; scale-x: 0.999374123; scale-y: 0.999374086; cel: 0; alpha: 1; }
        frame 60 { x: 51.0269426; y: 116.38388; skew-x: -2.27676429; skew-y: -2.27676766; scale-x: 0.999374123; scale-y: 0.999374086; cel: 0; alpha: 1; }
        frame 61 { x: 51.2006998; y: 116.284778; skew-x: -2.41232718; skew-y: -2.41233666; scale-x: 0.99895678; scale-y: 0.998956687; cel: 0; alpha: 1; }
        frame 62 { x: 50.8838973; y: 116.336524; skew-x: -2.24789878; skew-y: -2.2479063; scale-x: 0.998538976; scale-y: 0.998538867; cel: 0; alpha: 1; }
        frame 63 { x: 51.1203875; y: 116.244046; skew-x: -2.38346869; skew-y: -2.38347463; scale-x: 0.999121767; scale-y: 0.999121667; cel: 0; alpha: 1; }
        frame 64 { x: 51.1485193; y: 116.230607; skew-x: -2.31903831; skew-y: -2.31904399; scale-x: 0.998703582; scale-y: 0.998703498; cel: 0; alpha: 1; }
        frame 65 { x: 50.9907257; y: 116.168583; skew-x: -2.15460492; skew-y: -2.15461212; scale-x: 0.999287178; scale-y: 0.999287147; cel: 0; alpha: 1; }
        frame 66 { x: 50.9796321; y: 116.217055; skew-x: -2.09017479; skew-y: -2.09018179; scale-x: 0.998868542; scale-y: 0.998868496; cel: 0; alpha: 1; }
        frame 67 { x: 50.5723481; y: 114.755624; skew-x: 9.9414344; skew-y: 9.94159746; scale-x: 0.989638939; scale-y: 0.987846773; cel: 0; alpha: 1; }
        frame 68 { x: 50.3851511; y: 113.64187; skew-x: 21.9730422; skew-y: 21.9733785; scale-x: 0.980416159; scale-y: 0.976833355; cel: 0; alpha: 1; }
        frame 69 { x: 52.3408486; y: 112.517716; skew-x: 31.804651; skew-y: 31.8051614; scale-x: 0.971200245; scale-y: 0.965828266; cel: 0; alpha: 1; }
        frame 70 { x: 54.4703618; y: 111.937198; skew-x: 41.5362658; skew-y: 41.5369486; scale-x: 0.963930528; scale-y: 0.956756573; cel: 0; alpha: 1; }
        frame 71 { x: 56.4917084; y: 110.094634; skew-x: 52.0131451; skew-y: 52.0135972; scale-x: 0.960893191; scale-y: 0.953747474; cel: 0; alpha: 1; }
        frame 72 { x: 58.2182313; y: 108.497381; skew-x: 62.6900212; skew-y: 62.6902467; scale-x: 0.959794964; scale-y: 0.952662898; cel: 0; alpha: 1; }
        frame 73 { x: 59.9031809; y: 107.349485; skew-x: 73.2668939; skew-y: 73.2668997; scale-x: 0.959662499; scale-y: 0.952537191; cel: 0; alpha: 1; }
        frame 74 { x: 59.5314323; y: 108.357402; skew-x: 71.7495556; skew-y: 74.4226332; scale-x: 0.923757157; scale-y: 0.979260013; cel: 0; alpha: 1; }
        frame 75 { x: 59.1499663; y: 109.264058; skew-x: 70.461938; skew-y: 75.7411901; scale-x: 0.888467823; scale-y: 1.00788061; cel: 0; alpha: 1; }
        frame 76 { x: 58.3268674; y: 110.313605; skew-x: 66.7353332; skew-y: 69.390661; scale-x: 0.922819461; scale-y: 0.97819904; cel: 0; alpha: 1; }
        frame 77 { x: 57.1949177; y: 111.157334; skew-x: 63.2200214; skew-y: 63.2207191; scale-x: 0.957679097; scale-y: 0.950523223; cel: 0; alpha: 1; }
        frame 78 { x: 56.7396218; y: 111.021282; skew-x: 59.6292423; skew-y: 59.6301977; scale-x: 0.956336787; scale-y: 0.949187288; cel: 0; alpha: 1; }
        frame 79 { x: 56.1949003; y: 110.646247; skew-x: 56.1384772; skew-y: 56.139686; scale-x: 0.956922545; scale-y: 0.949764939; cel: 0; alpha: 1; }
        frame 80 { x: 56.7032936; y: 111.271128; skew-x: 60.9887838; skew-y: 61.022636; scale-x: 0.957149099; scale-y: 0.948177594; cel: 0; alpha: 1; }
        frame 81 { x: 57.2721332; y: 111.89202; skew-x: 66.0500649; skew-y: 65.9889298; scale-x: 0.957013715; scale-y: 0.951012321; cel: 0; alpha: 1; }
        frame 82 { x: 121.444328; y: 27.5172287; skew-x: -91.846872; skew-y: -91.846892; scale-x: 0.996608827; scale-y: 0.99660834; cel: 0; alpha: 1; }
        frame 83 { x: 117.199723; y: 26.394512; skew-x: -86.9753139; skew-y: -86.9753104; scale-x: 0.99371337; scale-y: 0.993713755; cel: 0; alpha: 1; }
        frame 84 { x: 113.025472; y: 25.4532767; skew-x: -81.9037323; skew-y: -81.9037289; scale-x: 0.991827838; scale-y: 0.991828256; cel: 0; alpha: 1; }
        frame 85 { x: 108.718473; y: 24.1562631; skew-x: -77.0321815; skew-y: -77.0321432; scale-x: 0.990948892; scale-y: 0.990948595; cel: 0; alpha: 1; }
        frame 86 { x: 111.231531; y: 8.91900673; skew-x: -115.742902; skew-y: -115.742878; scale-x: 0.988616182; scale-y: 0.988616126; cel: 0; alpha: 1; }
        frame 87 { x: 104.039558; y: 1.26751152; skew-x: -136.233739; skew-y: -136.233684; scale-x: 0.988907637; scale-y: 0.98890745; cel: 0; alpha: 1; }
        frame 88 { x: 83.3211982; y: -7.3003515; skew-x: -169.291789; skew-y: -169.291812; scale-x: 0.985951405; scale-y: 0.985952191; cel: 0; alpha: 1; }
        frame 89 { x: 69.7683079; y: 1.41721651; skew-x: -198.633717; skew-y: -198.633725; scale-x: 0.988892885; scale-y: 0.988892285; cel: 0; alpha: 1; }
        frame 90 { x: 60.2542504; y: 6.38542218; skew-x: -238.456228; skew-y: -238.456212; scale-x: 0.984583502; scale-y: 0.98458338; cel: 0; alpha: 1; }
        frame 91 { x: 46.1562447; y: 17.3534467; skew-x: -305.679; skew-y: -305.679017; scale-x: 0.982281953; scale-y: 0.982281922; cel: 0; alpha: 1; }
        frame 92 { x: 41.6505104; y: 29.8669415; skew-x: -319.067366; skew-y: -319.067379; scale-x: 0.979801616; scale-y: 0.979801659; cel: 0; alpha: 1; }
        frame 93 { x: 36.6380368; y: 42.162346; skew-x: -332.355719; skew-y: -332.355732; scale-x: 0.978320818; scale-y: 0.97832095; cel: 0; alpha: 1; }
        frame 94 { x: 35.4801892; y: 53.4101769; skew-x: -332.038248; skew-y: -332.038274; scale-x: 0.97544595; scale-y: 0.975446095; cel: 0; alpha: 1; }
        frame 95 { x: 34.3425342; y: 64.435668; skew-x: -331.720815; skew-y: -331.720802; scale-x: 0.97556604; scale-y: 0.975566016; cel: 0; alpha: 1; }
        frame 96 { x: 38.8112086; y: 80.5829614; skew-x: -336.233326; skew-y: -336.233336; scale-x: 0.973790662; scale-y: 0.973790558; cel: 0; alpha: 1; }
        frame 97 { x: 43.1481439; y: 96.596289; skew-x: -341.045856; skew-y: -341.045866; scale-x: 0.974010751; scale-y: 0.974010599; cel: 0; alpha: 1; }
        frame 98 { x: 47.7322354; y: 105.327261; skew-x: 4.15612945; skew-y: 4.15611637; scale-x: 0.972016824; scale-y: 0.9720169; cel: 0; alpha: 1; }
        frame 99 { x: 52.3365666; y: 110.568318; skew-x: -5.9904525; skew-y: -5.99046127; scale-x: 0.999340946; scale-y: 0.999340938; cel: 0; alpha: 1; }
        frame 100 { x: 54.0996005; y: 114.718025; skew-x: -18.1370322; skew-y: -18.1370404; scale-x: 0.999184654; scale-y: 0.999184646; cel: 0; alpha: 1; }
        frame 101 { x: 55.6193211; y: 118.29331; skew-x: -30.0836115; skew-y: -30.0836196; scale-x: 0.999028395; scale-y: 0.999028386; cel: 0; alpha: 1; }
        frame 102 { x: 53.0879637; y: 116.963676; skew-x: -15.830182; skew-y: -15.8301937; scale-x: 0.986055902; scale-y: 0.986055921; cel: 0; alpha: 1; }
        frame 103 { x: 50.2868831; y: 115.184105; skew-x: -1.27676429; skew-y: -1.27676766; scale-x: 0.97438977; scale-y: 0.974389734; cel: 0; alpha: 1; }
    }
    Track {
        source-name: "Zombie_imp_outerleg_lower";
        frame-count: 104;
        frame 0 { x: 53.1764222; y: 111.926173; skew-x: 1.99549807; skew-y: 1.99469806; scale-x: 1.00047601; scale-y: 1.00047045; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_OUTERLEG_LOWER; }
        frame 1 { x: 51.1191663; y: 111.738882; skew-x: -1.83435718; skew-y: -1.83488373; scale-x: 0.998884907; scale-y: 0.998867176; cel: 0; alpha: 1; }
        frame 2 { x: 49.0910134; y: 111.512332; skew-x: -5.66421695; skew-y: -5.6644622; scale-x: 0.998294237; scale-y: 0.998264259; cel: 0; alpha: 1; }
        frame 3 { x: 46.9008989; y: 111.320689; skew-x: -9.29406914; skew-y: -9.29404137; scale-x: 0.997703439; scale-y: 0.997661282; cel: 0; alpha: 1; }
        frame 4 { x: 46.51952; y: 110.603692; skew-x: 3.35538045; skew-y: 3.35609079; scale-x: 0.99679539; scale-y: 0.996750244; cel: 0; alpha: 1; }
        frame 5 { x: 46.3751334; y: 110.250501; skew-x: 16.2048443; skew-y: 16.2062153; scale-x: 0.995887186; scale-y: 0.995839267; cel: 0; alpha: 1; }
        frame 6 { x: 46.3005634; y: 110.102148; skew-x: 29.1542935; skew-y: 29.1563433; scale-x: 0.99497859; scale-y: 0.994927921; cel: 0; alpha: 1; }
        frame 7 { x: 46.4486778; y: 111.046167; skew-x: 18.5051929; skew-y: 18.5064121; scale-x: 0.995347226; scale-y: 0.995295347; cel: 0; alpha: 1; }
        frame 8 { x: 46.5266334; y: 112.021036; skew-x: 8.15608209; skew-y: 8.15648727; scale-x: 0.995715928; scale-y: 0.99566261; cel: 0; alpha: 1; }
        frame 9 { x: 46.729542; y: 113.37461; skew-x: -2.09301573; skew-y: -2.09344127; scale-x: 0.99608475; scale-y: 0.996030277; cel: 0; alpha: 1; }
        frame 10 { x: 46.9871182; y: 113.716534; skew-x: -4.45694362; skew-y: -4.45614415; scale-x: 0.994847037; scale-y: 0.994921963; cel: 0; alpha: 1; }
        frame 11 { x: 47.4773491; y: 114.021573; skew-x: -7.12166376; skew-y: -7.11806009; scale-x: 0.994609302; scale-y: 0.994798992; cel: 0; alpha: 1; }
        frame 12 { x: 47.9843432; y: 114.455473; skew-x: -9.69124566; skew-y: -9.68827775; scale-x: 0.994399457; scale-y: 0.994464961; cel: 0; alpha: 1; }
        frame 13 { x: 48.2332032; y: 114.704833; skew-x: -12.1598034; skew-y: -12.1595261; scale-x: 0.994183429; scale-y: 0.994135508; cel: 0; alpha: 1; }
        frame 14 { x: 49.703364; y: 114.695361; skew-x: -12.3236171; skew-y: -12.3228397; scale-x: 0.994079433; scale-y: 0.994030485; cel: 0; alpha: 1; }
        frame 15 { x: 50.8725568; y: 114.674205; skew-x: -12.1874252; skew-y: -12.1861548; scale-x: 0.992979491; scale-y: 0.992929641; cel: 0; alpha: 1; }
        frame 16 { x: 52.3086537; y: 114.766258; skew-x: -12.2512322; skew-y: -12.2494703; scale-x: 0.993871426; scale-y: 0.993820393; cel: 0; alpha: 1; }
        frame 17 { x: 53.395729; y: 115.131667; skew-x: -26.8798884; skew-y: -26.8781802; scale-x: 0.992304462; scale-y: 0.992255156; cel: 0; alpha: 1; }
        frame 18 { x: 54.906661; y: 115.732371; skew-x: -41.4085391; skew-y: -41.4068936; scale-x: 0.990738343; scale-y: 0.990690636; cel: 0; alpha: 1; }
        frame 19 { x: 56.6806087; y: 116.342192; skew-x: -55.9371896; skew-y: -55.9356052; scale-x: 0.991161332; scale-y: 0.991115127; cel: 0; alpha: 1; }
        frame 20 { x: 57.1493163; y: 116.694947; skew-x: -57.7101639; skew-y: -57.7086456; scale-x: 0.988740509; scale-y: 0.988699736; cel: 0; alpha: 1; }
        frame 21 { x: 57.6013401; y: 117.272792; skew-x: -59.4831418; skew-y: -59.4816786; scale-x: 0.988305812; scale-y: 0.988270408; cel: 0; alpha: 1; }
        frame 22 { x: 57.9127262; y: 117.708461; skew-x: -61.1561177; skew-y: -61.1547178; scale-x: 0.987869057; scale-y: 0.987839018; cel: 0; alpha: 1; }
        frame 23 { x: 57.722558; y: 118.766377; skew-x: -67.0208705; skew-y: -67.0189897; scale-x: 0.987163451; scale-y: 0.987124519; cel: 0; alpha: 1; }
        frame 24 { x: 57.5652013; y: 119.593258; skew-x: -72.7856243; skew-y: -72.783259; scale-x: 0.98645818; scale-y: 0.986410387; cel: 0; alpha: 1; }
        frame 25 { x: 57.5794278; y: 120.688658; skew-x: -78.3503792; skew-y: -78.347528; scale-x: 0.986741149; scale-y: 0.986684328; cel: 0; alpha: 1; }
        frame 26 { x: 55.7565565; y: 119.154002; skew-x: -62.7379463; skew-y: -62.7365479; scale-x: 0.98863904; scale-y: 0.988585371; cel: 0; alpha: 1; }
        frame 27 { x: 54.8162643; y: 117.339574; skew-x: -47.6256198; skew-y: -47.6254082; scale-x: 0.990544561; scale-y: 0.9904801; cel: 0; alpha: 1; }
        frame 28 { x: 54.3209511; y: 115.72689; skew-x: -32.3338931; skew-y: -32.3332734; scale-x: 0.992362808; scale-y: 0.992303187; cel: 0; alpha: 1; }
        frame 29 { x: 53.6657343; y: 113.995027; skew-x: -16.7418127; skew-y: -16.7414912; scale-x: 0.994174621; scale-y: 0.994127624; cel: 0; alpha: 1; }
        frame 30 { x: 53.5906796; y: 113.228296; skew-x: -10.5627075; skew-y: -10.5627599; scale-x: 0.995942308; scale-y: 0.995909172; cel: 0; alpha: 1; }
        frame 31 { x: 53.380586; y: 112.501715; skew-x: -4.38360301; skew-y: -4.38403162; scale-x: 0.997709277; scale-y: 0.997689904; cel: 0; alpha: 1; }
        frame 32 { x: 53.1764222; y: 111.926173; skew-x: 1.99549807; skew-y: 1.99469806; scale-x: 1.00047601; scale-y: 1.00047045; cel: 0; alpha: 1; }
        frame 33 { x: 56.558625; y: 112.332132; skew-x: -2.04381149; skew-y: -2.04458101; scale-x: 0.999620483; scale-y: 0.99961303; cel: 0; alpha: 1; }
        frame 34 { x: 56.594025; y: 112.402617; skew-x: -2.47046484; skew-y: -2.47131833; scale-x: 0.998670482; scale-y: 0.998666881; cel: 0; alpha: 1; }
        frame 35 { x: 56.6471672; y: 112.434669; skew-x: -2.79712792; skew-y: -2.7980585; scale-x: 0.99872013; scale-y: 0.998720298; cel: 0; alpha: 1; }
        frame 36 { x: 56.8603552; y: 112.388522; skew-x: -3.32379041; skew-y: -3.32479478; scale-x: 0.998769798; scale-y: 0.998773785; cel: 0; alpha: 1; }
        frame 37 { x: 56.7959941; y: 112.40837; skew-x: -3.55044893; skew-y: -3.55153445; scale-x: 0.998819498; scale-y: 0.998827159; cel: 0; alpha: 1; }
        frame 38 { x: 57.0608396; y: 112.009027; skew-x: -3.19895004; skew-y: -3.38864916; scale-x: 0.998161696; scale-y: 1.00651803; cel: 0; alpha: 1; }
        frame 39 { x: 57.3483223; y: 111.679864; skew-x: -2.74749156; skew-y: -3.12415747; scale-x: 0.998506462; scale-y: 1.01520162; cel: 0; alpha: 1; }
        frame 40 { x: 57.5317291; y: 111.143019; skew-x: -2.29609699; skew-y: -2.85810874; scale-x: 0.998854015; scale-y: 1.02387793; cel: 0; alpha: 1; }
        frame 41 { x: 57.7370123; y: 110.773873; skew-x: -1.74475962; skew-y: -2.49053279; scale-x: 1.00020553; scale-y: 1.03358158; cel: 0; alpha: 1; }
        frame 42 { x: 56.8285959; y: 111.413155; skew-x: -4.92813001; skew-y: -4.70748964; scale-x: 0.998671612; scale-y: 1.01485061; cel: 0; alpha: 1; }
        frame 43 { x: 55.9062737; y: 112.009278; skew-x: -8.15835532; skew-y: -6.86610584; scale-x: 0.995708103; scale-y: 0.99982907; cel: 0; alpha: 1; }
        frame 44 { x: 54.8770495; y: 113.073925; skew-x: -11.194005; skew-y: -8.81853841; scale-x: 0.990178837; scale-y: 0.987522843; cel: 0; alpha: 1; }
        frame 45 { x: 55.4800813; y: 112.913327; skew-x: -7.69886829; skew-y: -6.52666349; scale-x: 0.995448422; scale-y: 0.991630507; cel: 0; alpha: 1; }
        frame 46 { x: 56.1975753; y: 112.778091; skew-x: -4.49425817; skew-y: -4.41536669; scale-x: 0.998909844; scale-y: 0.998697684; cel: 0; alpha: 1; }
        frame 47 { x: 56.72142; y: 112.451519; skew-x: -2.03324801; skew-y: -2.14351171; scale-x: 0.997952283; scale-y: 0.998381851; cel: 0; alpha: 1; }
        frame 48 { x: 56.8961919; y: 112.049317; skew-x: 0.428970059; skew-y: 0.428196636; scale-x: 0.998971664; scale-y: 0.998964201; cel: 0; alpha: 1; }
        frame 49 { x: 56.8608217; y: 111.778394; skew-x: -0.214388918; skew-y: -0.403840252; scale-x: 0.998275713; scale-y: 1.00662073; cel: 0; alpha: 1; }
        frame 50 { x: 56.8475648; y: 111.678439; skew-x: -0.757800921; skew-y: -1.13427994; scale-x: 0.998582518; scale-y: 1.0152702; cel: 0; alpha: 1; }
        frame 51 { x: 56.8289895; y: 111.371782; skew-x: -1.30125523; skew-y: -1.86316404; scale-x: 0.998892052; scale-y: 1.02391225; cel: 0; alpha: 1; }
        frame 52 { x: 56.7282768; y: 111.232825; skew-x: -1.74474536; skew-y: -2.49053098; scale-x: 1.00020554; scale-y: 1.03358169; cel: 0; alpha: 1; }
        frame 53 { x: 56.1899343; y: 111.757408; skew-x: -4.92813499; skew-y: -4.70749062; scale-x: 0.998671666; scale-y: 1.01485064; cel: 0; alpha: 1; }
        frame 54 { x: 55.6380935; y: 112.235633; skew-x: -8.15835398; skew-y: -6.86610419; scale-x: 0.995708091; scale-y: 0.999829014; cel: 0; alpha: 1; }
        frame 55 { x: 54.8770498; y: 113.073925; skew-x: -11.1940075; skew-y: -8.81853876; scale-x: 0.990178833; scale-y: 0.987522822; cel: 0; alpha: 1; }
        frame 56 { x: 55.3610481; y: 113.021394; skew-x: -8.29645404; skew-y: -7.12884172; scale-x: 0.995660606; scale-y: 0.991419235; cel: 0; alpha: 1; }
        frame 57 { x: 55.9573085; y: 112.892147; skew-x: -5.69399304; skew-y: -5.61563545; scale-x: 0.998938842; scale-y: 0.99866882; cel: 0; alpha: 1; }
        frame 58 { x: 56.3097813; y: 112.602038; skew-x: -3.87865519; skew-y: -3.97000005; scale-x: 0.99785752; scale-y: 0.999117945; cel: 0; alpha: 1; }
        frame 59 { x: 56.558625; y: 112.332132; skew-x: -2.04381149; skew-y: -2.04458101; scale-x: 0.999620483; scale-y: 0.99961303; cel: 0; alpha: 1; }
        frame 60 { x: 56.558625; y: 112.332132; skew-x: -2.04381149; skew-y: -2.04458101; scale-x: 0.999620483; scale-y: 0.99961303; cel: 0; alpha: 1; }
        frame 61 { x: 56.5635574; y: 112.398409; skew-x: -3.37937343; skew-y: -3.38014941; scale-x: 0.999203031; scale-y: 0.999195625; cel: 0; alpha: 1; }
        frame 62 { x: 56.1006046; y: 112.645474; skew-x: -4.41494874; skew-y: -4.41571822; scale-x: 0.998785182; scale-y: 0.998777673; cel: 0; alpha: 1; }
        frame 63 { x: 56.1790564; y: 112.719271; skew-x: -5.75051602; skew-y: -5.75128807; scale-x: 0.999368072; scale-y: 0.999360571; cel: 0; alpha: 1; }
        frame 64 { x: 56.0589707; y: 112.895473; skew-x: -6.886083; skew-y: -6.88685849; scale-x: 0.998949838; scale-y: 0.998942305; cel: 0; alpha: 1; }
        frame 65 { x: 55.76538; y: 113.029679; skew-x: -7.92165428; skew-y: -7.9224259; scale-x: 0.999533579; scale-y: 0.999526103; cel: 0; alpha: 1; }
        frame 66 { x: 55.6099269; y: 113.270521; skew-x: -9.057221; skew-y: -9.05799329; scale-x: 0.99911484; scale-y: 0.999107373; cel: 0; alpha: 1; }
        frame 67 { x: 56.9836048; y: 112.149523; skew-x: 10.4348061; skew-y: 10.4342392; scale-x: 0.998387228; scale-y: 0.998380621; cel: 0; alpha: 1; }
        frame 68 { x: 58.7919062; y: 111.693758; skew-x: 29.9268191; skew-y: 29.9264668; scale-x: 0.997659276; scale-y: 0.997653465; cel: 0; alpha: 1; }
        frame 69 { x: 61.0912761; y: 112.231557; skew-x: 38.8188287; skew-y: 38.8186973; scale-x: 0.996931259; scale-y: 0.996926191; cel: 0; alpha: 1; }
        frame 70 { x: 63.5375239; y: 113.199478; skew-x: 47.6108472; skew-y: 47.6109355; scale-x: 0.998211221; scale-y: 0.998207074; cel: 0; alpha: 1; }
        frame 71 { x: 64.5934812; y: 112.601449; skew-x: 57.3812401; skew-y: 57.3815632; scale-x: 0.995470898; scale-y: 0.995468192; cel: 0; alpha: 1; }
        frame 72 { x: 65.3268599; y: 112.165449; skew-x: 67.3516466; skew-y: 67.3521899; scale-x: 0.994738756; scale-y: 0.994737512; cel: 0; alpha: 1; }
        frame 73 { x: 66.0159956; y: 112.051653; skew-x: 77.2220371; skew-y: 77.2228195; scale-x: 0.995008267; scale-y: 0.995008522; cel: 0; alpha: 1; }
        frame 74 { x: 65.9485968; y: 112.733743; skew-x: 75.9836162; skew-y: 78.104916; scale-x: 0.954983142; scale-y: 1.02633988; cel: 0; alpha: 1; }
        frame 75 { x: 65.8664782; y: 113.335457; skew-x: 75.0136235; skew-y: 79.1558819; scale-x: 0.915171681; scale-y: 1.05977758; cel: 0; alpha: 1; }
        frame 76 { x: 66.0062256; y: 114.377664; skew-x: 73.3473934; skew-y: 75.4588554; scale-x: 0.954152128; scale-y: 1.02540413; cel: 0; alpha: 1; }
        frame 77 { x: 65.8928103; y: 115.168792; skew-x: 71.9395803; skew-y: 71.940148; scale-x: 0.993237702; scale-y: 0.993244553; cel: 0; alpha: 1; }
        frame 78 { x: 65.555642; y: 114.51276; skew-x: 68.3491958; skew-y: 68.3497976; scale-x: 0.991848402; scale-y: 0.991851316; cel: 0; alpha: 1; }
        frame 79 { x: 65.1350235; y: 113.629622; skew-x: 64.8588255; skew-y: 64.8594524; scale-x: 0.992458742; scale-y: 0.992457715; cel: 0; alpha: 1; }
        frame 80 { x: 65.5199738; y: 115.085312; skew-x: 70.0418112; skew-y: 69.4189464; scale-x: 0.961884374; scale-y: 0.989759681; cel: 0; alpha: 1; }
        frame 81 { x: 65.9383708; y: 116.531476; skew-x: 75.5004259; skew-y: 74.0227013; scale-x: 0.931464406; scale-y: 0.991082938; cel: 0; alpha: 1; }
        frame 82 { x: 116.840317; y: 20.5355782; skew-x: -90.49958; skew-y: -90.5003789; scale-x: 1.00030435; scale-y: 1.00029982; cel: 0; alpha: 1; }
        frame 83 { x: 113.250664; y: 19.6568482; skew-x: -86.3845845; skew-y: -86.4776663; scale-x: 0.994867387; scale-y: 0.998917932; cel: 0; alpha: 1; }
        frame 84 { x: 109.729369; y: 18.966071; skew-x: -82.0692042; skew-y: -82.2549737; scale-x: 0.990445721; scale-y: 0.998546532; cel: 0; alpha: 1; }
        frame 85 { x: 106.026628; y: 17.9497262; skew-x: -77.9533863; skew-y: -78.2323695; scale-x: 0.987028944; scale-y: 0.999187303; cel: 0; alpha: 1; }
        frame 86 { x: 105.02559; y: 5.55310395; skew-x: -110.543331; skew-y: -110.870957; scale-x: 0.985352498; scale-y: 0.999629216; cel: 0; alpha: 1; }
        frame 87 { x: 95.0985033; y: 0.286346765; skew-x: -126.221758; skew-y: -126.560171; scale-x: 0.985156557; scale-y: 0.999905968; cel: 0; alpha: 1; }
        frame 88 { x: 76.1037095; y: -3.7179022; skew-x: -166.693284; skew-y: -167.104483; scale-x: 0.981284378; scale-y: 0.999166491; cel: 0; alpha: 1; }
        frame 89 { x: 64.4653567; y: 8.15177808; skew-x: -189.804279; skew-y: -190.143023; scale-x: 0.985157902; scale-y: 0.999919863; cel: 0; alpha: 1; }
        frame 90 { x: 60.2697195; y: 13.4633854; skew-x: -242.386472; skew-y: -242.792234; scale-x: 0.98098424; scale-y: 0.998624597; cel: 0; alpha: 1; }
        frame 91 { x: 54.9456817; y: 20.8708517; skew-x: -294.768514; skew-y: -295.241552; scale-x: 0.978812922; scale-y: 0.999362083; cel: 0; alpha: 1; }
        frame 92 { x: 48.8405098; y: 31.7011853; skew-x: -315.333581; skew-y: -313.586644; scale-x: 0.973515847; scale-y: 0.900985206; cel: 0; alpha: 1; }
        frame 93 { x: 43.2149199; y: 43.3192558; skew-x: -335.809165; skew-y: -331.555362; scale-x: 0.96956001; scale-y: 0.802537947; cel: 0; alpha: 1; }
        frame 94 { x: 40.9049198; y: 54.6201089; skew-x: -341.159466; skew-y: -337.009131; scale-x: 0.973647846; scale-y: 0.80964246; cel: 0; alpha: 1; }
        frame 95 { x: 38.6448723; y: 65.7851265; skew-x: -346.510237; skew-y: -342.461622; scale-x: 0.980720699; scale-y: 0.819224906; cel: 0; alpha: 1; }
        frame 96 { x: 43.5572665; y: 81.3421254; skew-x: -348.72798; skew-y: -344.778571; scale-x: 0.98549815; scale-y: 0.826859831; cel: 0; alpha: 1; }
        frame 97 { x: 48.34112; y: 96.6953998; skew-x: -351.246202; skew-y: -347.394343; scale-x: 0.992294717; scale-y: 0.836186798; cel: 0; alpha: 1; }
        frame 98 { x: 52.5960178; y: 104.908852; skew-x: -12.8648184; skew-y: -8.90853137; scale-x: 0.989960961; scale-y: 0.834728117; cel: 0; alpha: 1; }
        frame 99 { x: 59.2356765; y: 107.913378; skew-x: -8.28379552; skew-y: -4.38901053; scale-x: 0.990130184; scale-y: 0.834569717; cel: 0; alpha: 1; }
        frame 100 { x: 58.7228683; y: 112.105114; skew-x: -32.0646123; skew-y: -30.1671804; scale-x: 0.993178277; scale-y: 0.917893038; cel: 0; alpha: 1; }
        frame 101 { x: 58.4473212; y: 116.38785; skew-x: -55.6510887; skew-y: -55.5550607; scale-x: 0.996435377; scale-y: 1.00057852; cel: 0; alpha: 1; }
        frame 102 { x: 56.7441682; y: 113.826346; skew-x: -28.4974674; skew-y: -28.4498259; scale-x: 0.984897866; scale-y: 0.986939485; cel: 0; alpha: 1; }
        frame 103 { x: 55.7483969; y: 111.32838; skew-x: -1.04381149; skew-y: -1.04458101; scale-x: 0.974629971; scale-y: 0.974622704; cel: 0; alpha: 1; }
    }
    Track {
        source-name: "Zombie_imp_outerleg_upper";
        frame-count: 104;
        frame 0 { x: 51.8616253; y: 100.092893; skew-x: 12.4451906; skew-y: 12.4451688; scale-x: 0.999206535; scale-y: 0.999206041; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_OUTERLEG_UPPER; }
        frame 1 { x: 51.3916233; y: 99.0641605; skew-x: 17.4749695; skew-y: 17.4749461; scale-x: 0.998059864; scale-y: 0.998059281; cel: 0; alpha: 1; }
        frame 2 { x: 50.9614592; y: 98.032455; skew-x: 22.5047468; skew-y: 22.5047243; scale-x: 0.997912341; scale-y: 0.997911805; cel: 0; alpha: 1; }
        frame 3 { x: 50.4234291; y: 97.100462; skew-x: 27.7345243; skew-y: 27.7345006; scale-x: 0.997764832; scale-y: 0.997764278; cel: 0; alpha: 1; }
        frame 4 { x: 49.9668236; y: 97.6055836; skew-x: 29.7924352; skew-y: 29.792418; scale-x: 0.997683327; scale-y: 0.99768274; cel: 0; alpha: 1; }
        frame 5 { x: 49.5668005; y: 98.2375711; skew-x: 32.0503491; skew-y: 32.0503314; scale-x: 0.997601808; scale-y: 0.997601195; cel: 0; alpha: 1; }
        frame 6 { x: 49.0906743; y: 98.7851177; skew-x: 34.4082662; skew-y: 34.408243; scale-x: 0.997520253; scale-y: 0.997519659; cel: 0; alpha: 1; }
        frame 7 { x: 50.4596695; y: 99.8406961; skew-x: 34.8300947; skew-y: 36.1113962; scale-x: 0.98525663; scale-y: 0.990231479; cel: 0; alpha: 1; }
        frame 8 { x: 51.6971032; y: 100.744269; skew-x: 35.5259914; skew-y: 38.1179975; scale-x: 0.973325924; scale-y: 0.98244976; cel: 0; alpha: 1; }
        frame 9 { x: 52.9233876; y: 101.860873; skew-x: 36.2957593; skew-y: 40.2281036; scale-x: 0.961740711; scale-y: 0.97415176; cel: 0; alpha: 1; }
        frame 10 { x: 52.6907449; y: 102.130066; skew-x: 32.0576248; skew-y: 37.9273173; scale-x: 0.946946301; scale-y: 0.97614018; cel: 0; alpha: 1; }
        frame 11 { x: 52.6562637; y: 102.33832; skew-x: 27.4384755; skew-y: 35.3185317; scale-x: 0.933765623; scale-y: 0.977406124; cel: 0; alpha: 1; }
        frame 12 { x: 52.6036791; y: 101.698864; skew-x: 26.1934512; skew-y: 31.6984423; scale-x: 0.953963385; scale-y: 1.01702207; cel: 0; alpha: 1; }
        frame 13 { x: 52.2471914; y: 100.884059; skew-x: 25.0348294; skew-y: 28.2152323; scale-x: 0.974984021; scale-y: 1.05576093; cel: 0; alpha: 1; }
        frame 14 { x: 51.5499396; y: 100.486985; skew-x: 20.5266176; skew-y: 21.0170642; scale-x: 0.996276779; scale-y: 1.04793535; cel: 0; alpha: 1; }
        frame 15 { x: 50.7510676; y: 100.758621; skew-x: 14.1055552; skew-y: 13.8729257; scale-x: 0.991709413; scale-y: 1.04406653; cel: 0; alpha: 1; }
        frame 16 { x: 50.2526213; y: 101.245353; skew-x: 7.49780692; skew-y: 6.51764544; scale-x: 0.989118766; scale-y: 1.04121885; cel: 0; alpha: 1; }
        frame 17 { x: 50.5599172; y: 101.298339; skew-x: 2.17054788; skew-y: 1.75520703; scale-x: 0.990384626; scale-y: 1.03055206; cel: 0; alpha: 1; }
        frame 18 { x: 50.9516791; y: 101.506281; skew-x: -3.05734122; skew-y: -2.89497435; scale-x: 0.991647283; scale-y: 1.01995823; cel: 0; alpha: 1; }
        frame 19 { x: 51.1910488; y: 101.704257; skew-x: -8.23438096; skew-y: -7.95632295; scale-x: 0.992837459; scale-y: 1.03340004; cel: 0; alpha: 1; }
        frame 20 { x: 51.6636672; y: 101.800551; skew-x: -7.75711801; skew-y: -7.67943842; scale-x: 0.988461344; scale-y: 1.03363768; cel: 0; alpha: 1; }
        frame 21 { x: 52.1028459; y: 102.094765; skew-x: -7.28019015; skew-y: -7.40148095; scale-x: 0.986075874; scale-y: 1.03595762; cel: 0; alpha: 1; }
        frame 22 { x: 52.4226881; y: 102.2396; skew-x: -6.70361863; skew-y: -7.02244065; scale-x: 0.983689533; scale-y: 1.03828698; cel: 0; alpha: 1; }
        frame 23 { x: 52.2092741; y: 103.19883; skew-x: -8.17996749; skew-y: -6.94085017; scale-x: 0.978823832; scale-y: 1.032704; cel: 0; alpha: 1; }
        frame 24 { x: 51.9929555; y: 103.943574; skew-x: -9.56400648; skew-y: -6.75248453; scale-x: 0.974178386; scale-y: 1.02651421; cel: 0; alpha: 1; }
        frame 25 { x: 51.9378395; y: 104.953815; skew-x: -10.7554463; skew-y: -6.3574765; scale-x: 0.970727465; scale-y: 1.02073288; cel: 0; alpha: 1; }
        frame 26 { x: 51.7642424; y: 104.08803; skew-x: -6.34578151; skew-y: -3.04997916; scale-x: 0.976747865; scale-y: 1.01504715; cel: 0; alpha: 1; }
        frame 27 { x: 51.901773; y: 103.154013; skew-x: -2.44388398; skew-y: -0.248117871; scale-x: 0.982944022; scale-y: 1.00899264; cel: 0; alpha: 1; }
        frame 28 { x: 52.0658864; y: 102.455359; skew-x: 1.63081272; skew-y: 2.72771001; scale-x: 0.989223132; scale-y: 1.00250981; cel: 0; alpha: 1; }
        frame 29 { x: 51.6768447; y: 101.542217; skew-x: 5.99763325; skew-y: 5.9976111; scale-x: 0.995673822; scale-y: 0.995673227; cel: 0; alpha: 1; }
        frame 30 { x: 51.8731605; y: 101.024316; skew-x: 8.08015402; skew-y: 8.08013003; scale-x: 0.99651865; scale-y: 0.996518204; cel: 0; alpha: 1; }
        frame 31 { x: 51.8729072; y: 100.512073; skew-x: 10.1626751; skew-y: 10.1626503; scale-x: 0.997363177; scale-y: 0.997362662; cel: 0; alpha: 1; }
        frame 32 { x: 51.8616253; y: 100.092893; skew-x: 12.4451906; skew-y: 12.4451688; scale-x: 0.999206535; scale-y: 0.999206041; cel: 0; alpha: 1; }
        frame 33 { x: 53.2647534; y: 100.941333; skew-x: 4.18550734; skew-y: 3.52209064; scale-x: 0.992201489; scale-y: 0.998507822; cel: 0; alpha: 1; }
        frame 34 { x: 53.3886748; y: 100.986436; skew-x: 4.33391379; skew-y: 3.67048753; scale-x: 0.991216728; scale-y: 0.997516784; cel: 0; alpha: 1; }
        frame 35 { x: 53.546823; y: 100.97604; skew-x: 4.58230835; skew-y: 3.91888379; scale-x: 0.991224184; scale-y: 0.997524272; cel: 0; alpha: 1; }
        frame 36 { x: 53.8248115; y: 100.898054; skew-x: 4.63070563; skew-y: 3.96728372; scale-x: 0.991231655; scale-y: 0.997531881; cel: 0; alpha: 1; }
        frame 37 { x: 53.8852824; y: 100.870161; skew-x: 4.97910235; skew-y: 4.3156772; scale-x: 0.991239123; scale-y: 0.99753936; cel: 0; alpha: 1; }
        frame 38 { x: 53.929707; y: 100.744772; skew-x: 4.23153259; skew-y: 3.56811162; scale-x: 0.990341488; scale-y: 0.996635908; cel: 0; alpha: 1; }
        frame 39 { x: 54.0139989; y: 100.673972; skew-x: 3.583974; skew-y: 2.92054346; scale-x: 0.990436055; scale-y: 0.996731099; cel: 0; alpha: 1; }
        frame 40 { x: 53.9942569; y: 100.39653; skew-x: 2.93639647; skew-y: 2.27297373; scale-x: 0.990530644; scale-y: 0.996826235; cel: 0; alpha: 1; }
        frame 41 { x: 54.0110219; y: 100.270775; skew-x: 2.38883057; skew-y: 1.72540753; scale-x: 0.991617858; scale-y: 0.997920486; cel: 0; alpha: 1; }
        frame 42 { x: 53.8005305; y: 100.629397; skew-x: 3.87993562; skew-y: 4.00720028; scale-x: 0.98848613; scale-y: 0.992924579; cel: 0; alpha: 1; }
        frame 43 { x: 53.5814832; y: 100.882474; skew-x: 5.38771356; skew-y: 6.27636575; scale-x: 0.981580332; scale-y: 0.993826606; cel: 0; alpha: 1; }
        frame 44 { x: 53.2768959; y: 101.540644; skew-x: 7.25751066; skew-y: 8.58053158; scale-x: 0.970551542; scale-y: 0.999079396; cel: 0; alpha: 1; }
        frame 45 { x: 53.6832129; y: 101.405716; skew-x: 7.88241602; skew-y: 8.33494453; scale-x: 0.982641643; scale-y: 0.996122792; cel: 0; alpha: 1; }
        frame 46 { x: 54.1497096; y: 101.231065; skew-x: 8.35276007; skew-y: 7.76608238; scale-x: 0.991226743; scale-y: 0.997948988; cel: 0; alpha: 1; }
        frame 47 { x: 54.4592499; y: 100.939513; skew-x: 8.10522663; skew-y: 7.33003885; scale-x: 0.990906776; scale-y: 0.996956691; cel: 0; alpha: 1; }
        frame 48 { x: 54.4672769; y: 100.550605; skew-x: 7.85839545; skew-y: 7.19497024; scale-x: 0.991557467; scale-y: 0.997859679; cel: 0; alpha: 1; }
        frame 49 { x: 54.3373915; y: 100.313796; skew-x: 7.2910085; skew-y: 6.62758691; scale-x: 0.990579941; scale-y: 0.996875905; cel: 0; alpha: 1; }
        frame 50 { x: 54.2481383; y: 100.23193; skew-x: 6.82363038; skew-y: 6.16020672; scale-x: 0.99059509; scale-y: 0.996891161; cel: 0; alpha: 1; }
        frame 51 { x: 54.1544649; y: 99.9430862; skew-x: 6.35624742; skew-y: 5.6928252; scale-x: 0.990610184; scale-y: 0.996906412; cel: 0; alpha: 1; }
        frame 52 { x: 53.9967329; y: 99.8054361; skew-x: 5.98886951; skew-y: 5.32544769; scale-x: 0.991617903; scale-y: 0.997920448; cel: 0; alpha: 1; }
        frame 53 { x: 53.8319356; y: 100.362187; skew-x: 6.27690566; skew-y: 6.4105985; scale-x: 0.987912359; scale-y: 0.9935013; cel: 0; alpha: 1; }
        frame 54 { x: 53.6509003; y: 100.803793; skew-x: 6.59571294; skew-y: 7.46832704; scale-x: 0.981024226; scale-y: 0.994389886; cel: 0; alpha: 1; }
        frame 55 { x: 53.276896; y: 101.540645; skew-x: 7.25750795; skew-y: 8.58053062; scale-x: 0.970551537; scale-y: 0.999079385; cel: 0; alpha: 1; }
        frame 56 { x: 53.3432715; y: 101.534567; skew-x: 6.97607361; skew-y: 7.44111453; scale-x: 0.982944901; scale-y: 0.99581554; cel: 0; alpha: 1; }
        frame 57 { x: 53.4719892; y: 101.387469; skew-x: 6.55202259; skew-y: 5.96666289; scale-x: 0.991268745; scale-y: 0.997906836; cel: 0; alpha: 1; }
        frame 58 { x: 53.3963113; y: 101.157506; skew-x: 5.36798268; skew-y: 4.59588593; scale-x: 0.990751922; scale-y: 0.997752935; cel: 0; alpha: 1; }
        frame 59 { x: 53.2647534; y: 100.941333; skew-x: 4.18550734; skew-y: 3.52209064; scale-x: 0.992201489; scale-y: 0.998507822; cel: 0; alpha: 1; }
        frame 60 { x: 53.2647534; y: 100.941333; skew-x: 4.18550734; skew-y: 3.52209064; scale-x: 0.992201489; scale-y: 0.998507822; cel: 0; alpha: 1; }
        frame 61 { x: 54.9811491; y: 100.409243; skew-x: 9.85897464; skew-y: 9.96716698; scale-x: 0.993147261; scale-y: 1.01677075; cel: 0; alpha: 1; }
        frame 62 { x: 56.3720639; y: 100.156932; skew-x: 15.8313374; skew-y: 16.70167; scale-x: 0.994125378; scale-y: 1.03500341; cel: 0; alpha: 1; }
        frame 63 { x: 58.3081501; y: 99.8333571; skew-x: 21.5026488; skew-y: 23.1260043; scale-x: 0.996134638; scale-y: 1.05425747; cel: 0; alpha: 1; }
        frame 64 { x: 60.1428173; y: 99.753058; skew-x: 27.3729371; skew-y: 29.7405577; scale-x: 0.99718144; scale-y: 1.07243491; cel: 0; alpha: 1; }
        frame 65 { x: 61.8719131; y: 99.7618211; skew-x: 33.3422445; skew-y: 36.4457014; scale-x: 0.999264629; scale-y: 1.09166284; cel: 0; alpha: 1; }
        frame 66 { x: 63.7347929; y: 100.021648; skew-x: 39.2105884; skew-y: 43.0417842; scale-x: 1.00038233; scale-y: 1.10976606; cel: 0; alpha: 1; }
        frame 67 { x: 68.3706638; y: 103.299773; skew-x: 55.4135489; skew-y: 61.0275813; scale-x: 0.900685965; scale-y: 1.03353802; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_OUTERLEG_UPPER2; }
        frame 68 { x: 72.6843145; y: 107.241067; skew-x: 74.0188772; skew-y: 79.5364802; scale-x: 0.809714617; scale-y: 1.00519251; cel: 0; alpha: 1; }
        frame 69 { x: 75.6839944; y: 110.484523; skew-x: 85.8777643; skew-y: 90.5729728; scale-x: 0.812389903; scale-y: 1.00520965; cel: 0; alpha: 1; }
        frame 70 { x: 78.5560567; y: 114.237757; skew-x: 97.5402723; skew-y: 101.518826; scale-x: 0.816819801; scale-y: 1.00566192; cel: 0; alpha: 1; }
        frame 71 { x: 79.3858073; y: 115.651584; skew-x: 104.488541; skew-y: 107.899345; scale-x: 0.789211936; scale-y: 1.0282527; cel: 0; alpha: 1; }
        frame 72 { x: 79.7686906; y: 117.166555; skew-x: 111.58789; skew-y: 114.471205; scale-x: 0.76294529; scale-y: 1.05202427; cel: 0; alpha: 1; }
        frame 73 { x: 80.0070534; y: 118.85235; skew-x: 118.532889; skew-y: 120.935248; scale-x: 0.737124675; scale-y: 1.07603073; cel: 0; alpha: 1; }
        frame 74 { x: 80.1941213; y: 119.13769; skew-x: 120.189067; skew-y: 118.788237; scale-x: 0.720711086; scale-y: 1.09287358; cel: 0; alpha: 1; }
        frame 75 { x: 80.3589223; y: 119.367463; skew-x: 122.17369; skew-y: 116.783487; scale-x: 0.705749582; scale-y: 1.10623976; cel: 0; alpha: 1; }
        frame 76 { x: 80.0725111; y: 118.531838; skew-x: 112.113626; skew-y: 111.104049; scale-x: 0.724840258; scale-y: 1.08754092; cel: 0; alpha: 1; }
        frame 77 { x: 79.3960214; y: 117.586118; skew-x: 102.416751; skew-y: 105.565461; scale-x: 0.745728281; scale-y: 1.06535963; cel: 0; alpha: 1; }
        frame 78 { x: 79.4016546; y: 116.943147; skew-x: 102.838683; skew-y: 105.879054; scale-x: 0.740364227; scale-y: 1.03530559; cel: 0; alpha: 1; }
        frame 79 { x: 79.3608857; y: 116.07261; skew-x: 103.386814; skew-y: 106.263984; scale-x: 0.736455195; scale-y: 1.00760472; cel: 0; alpha: 1; }
        frame 80 { x: 78.9041914; y: 116.974781; skew-x: 101.494018; skew-y: 103.227635; scale-x: 0.708040755; scale-y: 1.00671845; cel: 0; alpha: 1; }
        frame 81 { x: 78.5580463; y: 117.803902; skew-x: 100.023825; skew-y: 100.168622; scale-x: 0.683131689; scale-y: 1.00699368; cel: 0; alpha: 1; }
        frame 82 { x: 103.571532; y: 17.8564767; skew-x: -63.4987624; skew-y: -63.4987678; scale-x: 0.995708671; scale-y: 0.995707855; cel: 0; alpha: 1; image: IMAGE_REANIM_ZOMBIE_IMP_HD_OUTERLEG_UPPER; }
        frame 83 { x: 100.482404; y: 14.2119533; skew-x: -52.5445419; skew-y: -52.5830107; scale-x: 0.991773863; scale-y: 0.993854854; cel: 0; alpha: 1; }
        frame 84 { x: 97.813489; y: 10.6930929; skew-x: -41.3904132; skew-y: -41.4672212; scale-x: 0.98884799; scale-y: 0.993008338; cel: 0; alpha: 1; }
        frame 85 { x: 95.2681702; y: 6.93432251; skew-x: -30.4363805; skew-y: -30.5514889; scale-x: 0.986925872; scale-y: 0.993169122; cel: 0; alpha: 1; }
        frame 86 { x: 91.363342; y: 3.41795047; skew-x: -69.3906041; skew-y: -69.3774975; scale-x: 0.984198782; scale-y: 0.990042115; cel: 0; alpha: 1; }
        frame 87 { x: 80.914773; y: 3.40366898; skew-x: -89.6368068; skew-y: -89.7523688; scale-x: 0.984926195; scale-y: 0.991175928; cel: 0; alpha: 1; }
        frame 88 { x: 68.2850489; y: 7.74196725; skew-x: -132.314784; skew-y: -132.490117; scale-x: 0.980406975; scale-y: 0.986760226; cel: 0; alpha: 1; }
        frame 89 { x: 68.2792825; y: 19.9210515; skew-x: -179.63675; skew-y: -179.753318; scale-x: 0.98492573; scale-y: 0.991162217; cel: 0; alpha: 1; }
        frame 90 { x: 70.8004792; y: 21.1063147; skew-x: -218.63163; skew-y: -218.747574; scale-x: 0.980622437; scale-y: 0.986840768; cel: 0; alpha: 1; }
        frame 91 { x: 68.0648968; y: 20.9481543; skew-x: -257.426506; skew-y: -257.541798; scale-x: 0.978319342; scale-y: 0.984532306; cel: 0; alpha: 1; }
        frame 92 { x: 61.5360589; y: 26.5143115; skew-x: -278.335448; skew-y: -278.451293; scale-x: 0.976793189; scale-y: 0.982997514; cel: 0; alpha: 1; }
        frame 93 { x: 53.5110622; y: 32.8416511; skew-x: -299.144377; skew-y: -299.26076; scale-x: 0.976264207; scale-y: 0.982465559; cel: 0; alpha: 1; }
        frame 94 { x: 50.0592871; y: 43.5727098; skew-x: -305.060523; skew-y: -305.204646; scale-x: 0.973162815; scale-y: 0.979438789; cel: 0; alpha: 1; }
        frame 95 { x: 46.6479533; y: 54.2238247; skew-x: -310.976652; skew-y: -311.148497; scale-x: 0.973049904; scale-y: 0.97941865; cel: 0; alpha: 1; }
        frame 96 { x: 49.1773572; y: 68.759508; skew-x: -319.739681; skew-y: -319.884229; scale-x: 0.972185049; scale-y: 0.978461959; cel: 0; alpha: 1; }
        frame 97 { x: 51.5775632; y: 83.2012813; skew-x: -329.409834; skew-y: -330.048511; scale-x: 0.962693024; scale-y: 0.998518239; cel: 0; alpha: 1; }
        frame 98 { x: 53.4634793; y: 90.3118776; skew-x: 13.5964434; skew-y: 17.7073325; scale-x: 0.968178053; scale-y: 1.05607895; cel: 0; alpha: 1; }
        frame 99 { x: 56.1724115; y: 96.8722659; skew-x: 4.27609631; skew-y: 3.46146087; scale-x: 0.9668226; scale-y: 0.974007348; cel: 0; alpha: 1; }
        frame 100 { x: 58.2004808; y: 98.9416241; skew-x: 9.37550557; skew-y: 11.556464; scale-x: 0.953151735; scale-y: 0.951573121; cel: 0; alpha: 1; }
        frame 101 { x: 59.6737894; y: 100.692933; skew-x: 14.5843328; skew-y: 19.8263924; scale-x: 0.943159968; scale-y: 0.926584315; cel: 0; alpha: 1; }
        frame 102 { x: 56.4202281; y: 100.63587; skew-x: 9.78871908; skew-y: 12.0343894; scale-x: 0.953086543; scale-y: 0.950827239; cel: 0; alpha: 1; }
        frame 103 { x: 52.7311882; y: 100.167994; skew-x: 5.18550734; skew-y: 4.52209064; scale-x: 0.967396452; scale-y: 0.973545126; cel: 0; alpha: 1; }
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
