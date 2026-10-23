export component Zombie_yeti {
    fps: 20;
    Track {
        source-name: "anim_death";
        frame-count: 105;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 78 { cel: 0; }
        frame 79 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 105;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 49 { cel: 0; }
        frame 50 { cel: -10000; }
        frame 78 { cel: -1; }
        frame 79 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 105;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 15 { x: 7.8; cel: 0; }
        frame 16 { x: -10000; cel: -10000; }
        frame 49 { cel: -1; }
        frame 50 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 105;
        frame 15 { cel: -1; }
        frame 16 { cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 105;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 15 { x: -103.8; y: 81.1; cel: 0; }
        frame 16 { x: -97.5; y: -10000; cel: -10000; }
        frame 17 { x: -91.2; }
        frame 18 { x: -86.5; }
        frame 19 { x: -81.9; }
        frame 20 { x: -77.2; }
        frame 21 { x: -72.6; }
        frame 22 { x: -69.1; }
        frame 23 { x: -65.6; }
        frame 24 { x: -62.2; }
        frame 25 { x: -58.8; }
        frame 26 { x: -55.2; }
        frame 27 { x: -51.6; }
        frame 28 { x: -48; }
        frame 29 { x: -44.4; }
        frame 30 { x: -40.8; }
        frame 31 { x: -37.2; }
        frame 32 { x: -35.8; }
        frame 33 { x: -34.4; }
        frame 34 { x: -32.5; }
        frame 35 { x: -30.6; }
        frame 36 { x: -28.7; }
        frame 37 { x: -26.8; }
        frame 38 { x: -10000; y: 81; }
        frame 39 { y: -10000; }
        frame 40 { x: -22.5; }
        frame 41 { x: -18.2; }
        frame 42 { x: -13.9; }
        frame 43 { x: -9.6; }
        frame 44 { x: -5.3; y: 81.1; }
        frame 45 { x: -1; y: -10000; }
        frame 46 { x: 3.1; }
        frame 47 { x: 7.5; }
        frame 48 { x: 11.8; }
        frame 49 { x: -10000; cel: -1; }
        frame 50 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_yeti_innerarm_hand";
        frame-count: 105;
        frame 0 { x: 1.4; y: 83.5; skew-x: 6.8; skew-y: 6.8; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_INNERARM_HAND; }
        frame 1 { x: 1.7; y: 84.3; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 2; y: 85; skew-x: 4.5; skew-y: 4.5; }
        frame 3 { x: 2.4; y: 85.8; skew-x: 3.3; skew-y: 3.3; }
        frame 4 { x: 2.6; y: 86.6; skew-x: 2.3; skew-y: 2.3; }
        frame 5 { x: 3; y: 87.3; skew-x: 1; skew-y: 1; }
        frame 6 { x: 3.4; y: 88.1; skew-x: 0; skew-y: 0; }
        frame 7 { x: 3.2; y: 88; skew-x: 0.8; skew-y: 0.8; }
        frame 8 { x: 3; y: 87.8; skew-x: 1.5; skew-y: 1.5; }
        frame 9 { x: 2.6; y: 87.2; skew-x: 2.3; skew-y: 2.3; }
        frame 10 { x: 2.4; y: 86.4; skew-x: 3.3; skew-y: 3.3; }
        frame 11 { x: 2.1; y: 85.7; skew-x: 4; skew-y: 4; }
        frame 12 { x: 1.9; y: 85; skew-x: 5; skew-y: 5; }
        frame 13 { x: 1.7; y: 84.3; skew-x: 5.8; skew-y: 5.8; scale-x: 0.719; scale-y: 0.719; }
        frame 14 { x: 1.4; y: 83.5; skew-x: 6.8; skew-y: 6.8; scale-x: 0.72; scale-y: 0.72; }
        frame 15 { x: -11.7; y: 66.4; skew-x: 80.1; skew-y: 80.1; scale-x: 0.717; scale-y: 0.717; }
        frame 16 { x: -9.2; y: 71.4; skew-x: 81.7; skew-y: 81.7; scale-x: 0.715; scale-y: 0.715; }
        frame 17 { x: -6.9; y: 76.5; skew-x: 83.1; skew-y: 83.1; scale-x: 0.714; scale-y: 0.714; }
        frame 18 { x: -3.2; y: 80.6; skew-x: 67.9; skew-y: 67.9; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -0; y: 85.5; skew-x: 52.6; skew-y: 52.6; scale-x: 0.713; scale-y: 0.713; }
        frame 20 { x: 3; y: 91.5; skew-x: 37.3; skew-y: 37.3; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 6.1; y: 98.3; skew-x: 22.1; skew-y: 22.1; scale-x: 0.715; scale-y: 0.715; }
        frame 22 { x: 10.5; y: 96.8; skew-x: 19.3; skew-y: 19.3; scale-x: 0.713; scale-y: 0.713; }
        frame 23 { x: 14.8; y: 95.2; skew-x: 16.8; skew-y: 16.8; scale-x: 0.714; scale-y: 0.714; }
        frame 24 { x: 19.2; y: 93.7; skew-x: 14.3; skew-y: 14.3; scale-x: 0.713; scale-y: 0.713; }
        frame 25 { x: 23.7; y: 92; skew-x: 11.8; skew-y: 11.8; scale-x: 0.714; scale-y: 0.714; }
        frame 26 { x: 32.5; y: 89.1; skew-x: 6.6; skew-y: 6.6; scale-x: 0.713; scale-y: 0.713; }
        frame 27 { x: 41.4; y: 86.2; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 50.4; y: 83.3; skew-x: -3.2; skew-y: -3.2; }
        frame 29 { x: 59.4; y: 80.6; skew-x: -8.4; skew-y: -8.4; }
        frame 30 { x: 68.6; y: 78; skew-x: -13.5; skew-y: -13.5; scale-x: 0.712; scale-y: 0.712; }
        frame 31 { x: 77.8; y: 75.4; skew-x: -18.7; skew-y: -18.7; scale-x: 0.713; scale-y: 0.713; }
        frame 32 { x: 70.2; y: 77.6; skew-x: -24.2; skew-y: -24.2; scale-x: 0.711; scale-y: 0.711; }
        frame 33 { x: 62.7; y: 79.9; skew-x: -30.1; skew-y: -30.1; scale-x: 0.712; scale-y: 0.712; }
        frame 34 { x: 52.1; y: 82; skew-x: -16.9; skew-y: -16.9; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 42.2; y: 84.3; skew-x: -3.9; skew-y: -3.9; scale-x: 0.713; scale-y: 0.713; }
        frame 36 { x: 32.7; y: 87.2; skew-x: 9; skew-y: 9; scale-x: 0.714; scale-y: 0.714; }
        frame 37 { x: 23.9; y: 90.5; skew-x: 22.1; skew-y: 22.1; scale-x: 0.715; scale-y: 0.715; }
        frame 38 { x: 17.6; y: 90.3; skew-x: 21.8; skew-y: 21.8; scale-x: 0.713; scale-y: 0.713; }
        frame 39 { x: 11.4; y: 90.1; skew-x: 21.6; skew-y: 21.6; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 9.1; y: 88.3; skew-x: 21.3; skew-y: 21.3; }
        frame 41 { x: 6.8; y: 86.6; skew-x: -10000; skew-y: -10000; scale-x: 0.714; scale-y: 0.714; }
        frame 42 { x: 4.2; y: 82.8; skew-x: 29.6; skew-y: 29.6; scale-x: 0.713; scale-y: 0.713; }
        frame 43 { x: 1.6; y: 79.3; skew-x: 38.1; skew-y: 38.1; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: -0.7; y: 76.2; skew-x: 46.6; skew-y: 46.6; scale-x: 0.714; scale-y: 0.714; }
        frame 45 { x: -3.3; y: 73.3; skew-x: 54.9; skew-y: 54.9; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: -5.9; y: 70.8; skew-x: 63.4; skew-y: 63.4; scale-x: 0.715; scale-y: 0.715; }
        frame 47 { x: -8.7; y: 68.4; skew-x: 71.7; skew-y: 71.7; scale-x: 0.716; scale-y: 0.716; }
        frame 48 { x: -11.7; y: 66.4; skew-x: 80.1; skew-y: 80.1; scale-x: 0.717; scale-y: 0.717; }
        frame 49 { x: 1.4; y: 83.5; skew-x: 6.8; skew-y: 6.8; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: 0.7; y: 82.5; skew-x: 10.6; skew-y: 10.6; scale-x: 0.719; scale-y: 0.719; }
        frame 51 { x: 0.3; y: 81.5; skew-x: 14.5; skew-y: 14.5; scale-x: 0.718; scale-y: 0.718; }
        frame 52 { x: -0.1; y: 80.6; skew-x: 18.3; skew-y: 18.3; scale-x: 0.717; scale-y: 0.717; }
        frame 53 { x: -0.6; y: 79.8; skew-x: 22.3; skew-y: 22.3; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: -1.1; y: 79; skew-x: 26.1; skew-y: 26.1; scale-x: 0.716; scale-y: 0.716; }
        frame 55 { x: -1.7; y: 78.2; skew-x: 30; skew-y: 30; scale-x: 0.717; scale-y: 0.717; }
        frame 56 { x: -3; y: 85.8; skew-x: 21.3; skew-y: 21.3; scale-x: 0.715; scale-y: 0.715; }
        frame 57 { x: -4.2; y: 93.5; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: -5.2; y: 101.5; skew-x: 4.2; skew-y: 4.2; scale-x: 0.716; scale-y: 0.716; }
        frame 59 { x: -10000; y: 102.2; skew-x: 4.1; skew-y: 4.1; scale-x: 0.715; scale-y: 0.715; }
        frame 60 { y: 102.8; skew-x: 4.2; skew-y: 4.2; scale-x: 0.716; scale-y: 0.716; }
        frame 61 { x: -9.8; y: 87.3; skew-x: 36.1; skew-y: 36.1; scale-x: 0.714; scale-y: 0.714; }
        frame 62 { x: -14; y: 76; skew-x: 67.9; skew-y: 67.9; scale-x: 0.713; scale-y: 0.713; }
        frame 63 { x: -20; y: 68.5; skew-x: 99.6; skew-y: 99.6; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: -14.5; y: 55.5; skew-x: 121.1; skew-y: 121.1; scale-x: 0.711; scale-y: 0.711; }
        frame 65 { x: -11; y: 42.9; skew-x: 142.4; skew-y: 142.4; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: -9.9; y: 42; skew-x: 155.7; skew-y: 155.7; scale-x: 0.71; scale-y: 0.71; }
        frame 67 { x: -9.4; y: 40.8; skew-x: 169; skew-y: 169; scale-x: 0.711; scale-y: 0.711; }
        frame 68 { x: -9.6; y: 39; skew-x: 182.2; skew-y: 182.2; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: -12.1; y: 44.3; skew-x: 149.4; skew-y: 149.4; scale-x: 0.709; scale-y: 0.709; }
        frame 70 { x: -19.2; y: 48.3; skew-x: 116.6; skew-y: 116.6; scale-x: 0.708; scale-y: 0.708; }
        frame 71 { x: -30.6; y: 53.6; skew-x: 83.9; skew-y: 83.9; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -31.3; y: 55.2; skew-x: 80.5; skew-y: 80.5; scale-x: 0.707; scale-y: 0.707; }
        frame 73 { x: -32.1; y: 56.9; skew-x: 76.9; skew-y: 76.9; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -27.1; y: 66.7; skew-x: 59.4; skew-y: 59.4; scale-x: 0.709; scale-y: 0.709; }
        frame 75 { x: -22.7; y: 77.6; skew-x: 41.9; skew-y: 41.9; scale-x: 0.712; scale-y: 0.712; }
        frame 76 { x: -14.2; y: 83.8; skew-x: 24.3; skew-y: 24.3; scale-x: 0.715; scale-y: 0.715; }
        frame 77 { x: 1.4; y: 83.5; skew-x: 6.8; skew-y: 6.8; scale-x: 0.72; scale-y: 0.72; }
        frame 78 { x: 5.1; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 7; y: 82.9; skew-x: 7.1; skew-y: 7.1; scale-x: 0.719; scale-y: 0.719; }
        frame 80 { x: 8.8; y: 82.3; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 10.9; y: 81.8; skew-x: 8; skew-y: 8; }
        frame 82 { x: 12.8; y: 81.2; skew-x: 8.5; skew-y: 8.5; }
        frame 83 { x: 14.7; y: 80.7; skew-x: 8.8; skew-y: 8.8; }
        frame 84 { x: 16.6; y: 80; skew-x: 9.3; skew-y: 9.3; }
        frame 85 { x: 18.5; y: 79.4; skew-x: 9.8; skew-y: 9.8; scale-x: 0.718; scale-y: 0.718; }
        frame 86 { x: 20.5; y: 79; skew-x: 10.3; skew-y: 10.3; scale-x: 0.719; scale-y: 0.719; }
        frame 87 { x: 12.8; y: 86; skew-x: -4.7; skew-y: -4.7; scale-x: 0.718; scale-y: 0.718; }
        frame 88 { x: 5.9; y: 93.7; skew-x: -19.7; skew-y: -19.7; scale-x: 0.717; scale-y: 0.717; }
        frame 89 { x: -0; y: 101.8; skew-x: -34.7; skew-y: -34.7; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: -5.2; y: 110.1; skew-x: -49.8; skew-y: -49.8; scale-x: 0.718; scale-y: 0.718; }
        frame 91 { x: -7.1; y: 114.5; skew-x: -56.3; skew-y: -56.3; scale-x: 0.716; scale-y: 0.716; }
        frame 92 { x: -8.7; y: 118.8; skew-x: -62.8; skew-y: -62.8; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -10.4; y: 123.1; skew-x: -69.4; skew-y: -69.4; }
        frame 94 { x: -11.8; y: 127.3; skew-x: -75.9; skew-y: -75.9; scale-x: 0.717; scale-y: 0.717; }
        frame 95 { x: -11.7; y: 126.4; skew-x: -90.4; skew-y: -90.4; scale-x: 0.716; scale-y: 0.716; }
        frame 96 { x: -11; y: 125; skew-x: -105; skew-y: -105; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: -10.9; y: 125.5; skew-x: -104.9; skew-y: -104.9; scale-x: 0.715; scale-y: 0.715; }
        frame 98 { x: -10000; y: 126; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 99 { y: 126.5; }
        frame 100 { x: -11; y: 127; skew-x: -105; skew-y: -105; scale-x: 0.716; scale-y: 0.716; }
        frame 101 { x: -10.9; y: 126.7; skew-x: -104.9; skew-y: -104.9; scale-x: 0.715; scale-y: 0.715; }
        frame 102 { x: -10000; y: 126.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 103 { y: 126.8; }
        frame 104 { x: -11; y: 127; skew-x: -105; skew-y: -105; scale-x: 0.716; scale-y: 0.716; }
    }
    Track {
        source-name: "Zombie_yeti_innerarm_upper";
        frame-count: 105;
        frame 0 { x: -1.5; y: 28.6; scale-x: 0.643; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_INNERARM_UPPER; }
        frame 1 { x: -10000; y: 29; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 29.3; }
        frame 3 { y: 29.6; }
        frame 4 { y: 30; }
        frame 5 { y: 30.3; }
        frame 6 { y: 30.6; }
        frame 7 { y: 30.8; }
        frame 8 { y: 31; }
        frame 9 { y: 30.6; }
        frame 10 { y: 30.2; }
        frame 11 { y: 29.8; }
        frame 12 { y: 29.4; }
        frame 13 { y: 29; }
        frame 14 { y: 28.6; }
        frame 15 { x: 19.6; y: 21.6; skew-x: 37.6; skew-y: 37.7; scale-x: 0.642; scale-y: 0.719; }
        frame 16 { x: 13.3; y: 24.3; skew-x: 28.9; skew-y: 28.9; scale-x: 0.641; scale-y: 0.717; }
        frame 17 { x: 7.3; y: 27.6; skew-x: 20.3; skew-y: 20.3; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 1; y: 31.6; skew-x: 10; skew-y: 10; scale-x: 0.64; scale-y: 0.716; }
        frame 19 { x: -4.7; y: 36.4; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.717; }
        frame 20 { x: -10.1; y: 41.9; skew-x: -9.9; skew-y: -9.9; scale-y: 0.716; }
        frame 21 { x: -15; y: 48; skew-x: -20.2; skew-y: -20.2; scale-y: -10000; }
        frame 22 { x: -10.9; y: 48.6; skew-x: -24.2; skew-y: -24.2; scale-x: 0.639; scale-y: 0.715; }
        frame 23 { x: -6.8; y: 49.3; skew-x: -28.4; skew-y: -28.4; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: -2.5; y: 49; skew-x: -32.5; skew-y: -32.5; scale-x: 0.638; scale-y: 0.714; }
        frame 25 { x: 1.8; y: 48.9; skew-x: -36.5; skew-y: -36.5; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 6.2; y: 48.8; skew-x: -40.7; skew-y: -40.7; scale-y: 0.713; }
        frame 27 { x: 10.8; y: 48.6; skew-x: -44.8; skew-y: -44.8; scale-x: 0.637; scale-y: -10000; }
        frame 28 { x: 15.6; y: -10000; skew-x: -48.8; skew-y: -48.8; scale-x: -10000; }
        frame 29 { x: 20.6; skew-x: -53; skew-y: -53; }
        frame 30 { x: 25.6; skew-x: -57.1; skew-y: -57.1; }
        frame 31 { x: 30.6; y: 48.5; skew-x: -61.1; skew-y: -61.1; scale-x: 0.638; scale-y: 0.714; }
        frame 32 { x: 24.6; y: 47.2; skew-x: -55.8; skew-y: -55.8; scale-x: 0.637; scale-y: 0.713; }
        frame 33 { x: 18.6; y: 46; skew-x: -50.6; skew-y: -50.6; scale-x: 0.638; scale-y: 0.714; }
        frame 34 { x: 14; y: 43.5; skew-x: -43; skew-y: -43; scale-x: 0.637; scale-y: 0.713; }
        frame 35 { x: 9.7; y: 41.3; skew-x: -35.5; skew-y: -35.5; scale-x: 0.638; scale-y: 0.714; }
        frame 36 { x: 5.9; y: 38.9; skew-x: -27.7; skew-y: -27.7; scale-x: 0.639; scale-y: 0.715; }
        frame 37 { x: 2.6; y: 37; skew-x: -20.2; skew-y: -20.2; scale-x: 0.64; scale-y: 0.716; }
        frame 38 { x: 0.4; y: 35.4; skew-x: -14.9; skew-y: -14.9; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: -1.5; y: 33.8; skew-x: -9.7; skew-y: -9.7; }
        frame 40 { x: 0.5; y: 31.6; skew-x: -4.4; skew-y: -4.2; }
        frame 41 { x: 2.5; y: 29.6; skew-x: 0.8; skew-y: 0.8; scale-y: 0.717; }
        frame 42 { x: 4.7; y: 27.8; skew-x: 6; skew-y: 6; scale-x: 0.641; scale-y: -10000; }
        frame 43 { x: 7; y: 26.2; skew-x: 11.3; skew-y: 11.3; scale-x: -10000; }
        frame 44 { x: 9.4; y: 24.7; skew-x: 16.5; skew-y: 16.5; }
        frame 45 { x: 12; y: 23.6; skew-x: 21.8; skew-y: 21.8; }
        frame 46 { x: 14.5; y: 22.8; skew-x: 27.1; skew-y: 27.1; }
        frame 47 { x: 17; y: 22; skew-x: 32.3; skew-y: 32.3; }
        frame 48 { x: 19.6; y: 21.6; skew-x: 37.6; skew-y: 37.7; scale-x: 0.642; scale-y: 0.719; }
        frame 49 { x: -1.5; y: 28.6; skew-x: 0; skew-y: 0; scale-x: 0.643; scale-y: 0.72; }
        frame 50 { x: -1.2; y: 28.5; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: -0.8; y: -10000; skew-x: -3.9; skew-y: -3.9; scale-y: 0.719; }
        frame 52 { x: -0.5; y: 28.4; skew-x: -5.9; skew-y: -5.9; scale-x: 0.642; scale-y: -10000; }
        frame 53 { x: -0.2; y: 28.5; skew-x: -8.2; skew-y: -8.2; scale-x: -10000; }
        frame 54 { x: 0.2; y: 28.4; skew-x: -10.2; skew-y: -10.2; scale-y: 0.718; }
        frame 55 { x: 0.5; y: -10000; skew-x: -12.3; skew-y: -12.3; scale-y: -10000; }
        frame 56 { x: -10000; skew-x: -12.2; skew-y: -12.2; scale-x: 0.641; }
        frame 57 { skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 58 { skew-x: -12.3; skew-y: -12.3; scale-x: 0.642; }
        frame 59 { y: 29.7; skew-x: -12.2; skew-y: -12.2; scale-x: 0.641; }
        frame 60 { y: 30.9; skew-x: -12.3; skew-y: -12.3; scale-x: 0.642; }
        frame 61 { x: 1.2; y: 27.8; skew-x: -5; skew-y: -5; scale-x: 0.641; }
        frame 62 { x: 1.9; y: 25.1; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; }
        frame 63 { x: 3; y: 22.6; skew-x: 9; skew-y: 9; scale-y: 0.717; }
        frame 64 { x: 7.6; y: 21.2; skew-x: 16.1; skew-y: 16.1; scale-x: 0.64; scale-y: 0.716; }
        frame 65 { x: 12.4; y: 20; skew-x: 23.3; skew-y: 23.3; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 14; y: 19.7; skew-x: 25.6; skew-y: 25.6; }
        frame 67 { x: 15.6; y: 19.4; skew-x: 28.1; skew-y: 28.1; }
        frame 68 { x: 17.2; y: 19.2; skew-x: 30.5; skew-y: 30.5; scale-x: 0.641; scale-y: 0.717; }
        frame 69 { x: 6.6; y: 24.8; skew-x: 19.3; skew-y: 19.3; scale-x: 0.64; scale-y: 0.716; }
        frame 70 { x: -3.5; y: 31.2; skew-x: 8.1; skew-y: 8.1; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: -13.4; y: 38.6; skew-x: -2.8; skew-y: -2.8; }
        frame 72 { x: -13.3; y: 39.4; skew-x: -2.7; skew-y: -2.7; }
        frame 73 { x: -13.4; y: 40.1; skew-x: -2.8; skew-y: -2.8; }
        frame 74 { x: -10.3; y: 37.1; skew-x: -1.9; skew-y: -1.9; scale-x: 0.641; scale-y: 0.717; }
        frame 75 { x: -7.4; y: 34.2; skew-x: -1.2; skew-y: -1.2; scale-x: 0.642; scale-y: 0.718; }
        frame 76 { x: -4.4; y: 31.3; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: 0.719; }
        frame 77 { x: -1.5; y: 28.6; skew-x: 0; skew-y: 0; scale-x: 0.643; scale-y: 0.72; }
        frame 78 { x: 5.1; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 7.3; y: 28.1; skew-x: 0.3; skew-y: 0.3; }
        frame 80 { x: 9.7; y: 27.5; skew-x: 0.8; skew-y: 0.8; }
        frame 81 { x: 12.1; y: 27; skew-x: 1.3; skew-y: 1.3; }
        frame 82 { x: 14.4; y: 26.4; skew-x: 1.6; skew-y: 1.6; scale-y: 0.719; }
        frame 83 { x: 16.7; y: 25.9; skew-x: 2; skew-y: 2; scale-y: -10000; }
        frame 84 { x: 19; y: 25.3; skew-x: 2.5; skew-y: 2.5; }
        frame 85 { x: 21.4; y: 24.7; skew-x: 3; skew-y: 3; scale-x: 0.642; }
        frame 86 { x: 23.8; y: 24.2; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; }
        frame 87 { x: 2.8; y: 36.5; skew-x: -11.4; skew-y: -11.4; scale-y: 0.718; }
        frame 88 { x: -16.7; y: 50.1; skew-x: -26.5; skew-y: -26.5; scale-x: 0.641; scale-y: 0.717; }
        frame 89 { x: -34.7; y: 64.8; skew-x: -41.5; skew-y: -41.5; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: -50.9; y: 80; skew-x: -56.6; skew-y: -56.6; scale-y: 0.718; }
        frame 91 { x: -55.2; y: 90.2; skew-x: -63.1; skew-y: -63.1; scale-x: 0.64; scale-y: 0.717; }
        frame 92 { x: -59.1; y: 100.3; skew-x: -69.6; skew-y: -69.6; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -62.7; y: 110.4; skew-x: -76.1; skew-y: -76.1; }
        frame 94 { x: -66; y: 120.3; skew-x: -82.6; skew-y: -82.6; scale-x: 0.641; }
        frame 95 { x: -64.5; y: 133.4; skew-x: -97.2; skew-y: -97.2; scale-x: 0.64; scale-y: 0.716; }
        frame 96 { x: -61.7; y: 145.4; skew-x: -111.7; skew-y: -111.7; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: -10000; y: 145.9; skew-x: -10000; skew-y: -10000; scale-x: 0.639; scale-y: 0.715; }
        frame 98 { y: 146.4; scale-x: -10000; scale-y: -10000; }
        frame 99 { y: 146.9; }
        frame 100 { y: 147.4; scale-x: 0.64; scale-y: 0.716; }
        frame 101 { y: 147; scale-x: 0.639; scale-y: 0.715; }
        frame 102 { y: 146.9; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: -61.6; y: 147.1; }
        frame 104 { x: -61.7; y: 147.4; scale-x: 0.64; scale-y: 0.716; }
    }
    Track {
        source-name: "Zombie_yeti_innerarm_lower";
        frame-count: 105;
        frame 0 { x: 1.7; y: 51.6; skew-x: 6.8; skew-y: 6.8; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_INNERARM_LOWER; }
        frame 1 { x: 1.4; y: 52.3; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 1.1; y: 52.9; skew-x: 4.5; skew-y: 4.5; }
        frame 3 { x: 0.8; y: 53.6; skew-x: 3.3; skew-y: 3.3; }
        frame 4 { x: 0.6; y: 54.2; skew-x: 2.3; skew-y: 2.3; }
        frame 5 { x: 0.3; y: 54.9; skew-x: 1; skew-y: 1; }
        frame 6 { x: 0; y: 55.6; skew-x: 0; skew-y: 0; }
        frame 7 { x: 0.2; y: 55.1; skew-x: 0.8; skew-y: 0.8; }
        frame 8 { x: 0.3; y: 54.7; skew-x: 1.5; skew-y: 1.5; }
        frame 9 { x: 0.5; y: 54.1; skew-x: 2.3; skew-y: 2.3; }
        frame 10 { x: 0.7; y: 53.6; skew-x: 3.3; skew-y: 3.3; }
        frame 11 { x: 1; y: 53.1; skew-x: 4; skew-y: 4; }
        frame 12 { x: 1.2; y: 52.5; skew-x: 5; skew-y: 5; }
        frame 13 { x: 1.4; y: 52.1; skew-x: 5.8; skew-y: 5.8; scale-x: 0.719; scale-y: 0.719; }
        frame 14 { x: 1.7; y: 51.6; skew-x: 6.8; skew-y: 6.8; scale-x: 0.72; scale-y: 0.72; }
        frame 15 { x: 9.5; y: 42.3; skew-x: 54.2; skew-y: 54.2; scale-x: 0.718; scale-y: 0.718; }
        frame 16 { x: 7.6; y: 45.4; skew-x: 48.7; skew-y: 48.7; scale-x: 0.716; scale-y: 0.716; }
        frame 17 { x: 5.7; y: 48.7; skew-x: 43.2; skew-y: 43.2; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 3.4; y: 51.8; skew-x: 31.4; skew-y: 31.4; scale-x: 0.715; scale-y: 0.715; }
        frame 19 { x: 1; y: 56; skew-x: 19.6; skew-y: 19.6; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: -1; y: 61.2; skew-x: 7.8; skew-y: 7.8; }
        frame 21 { x: -2.9; y: 67.6; skew-x: -3.7; skew-y: -3.7; scale-x: 0.716; scale-y: 0.716; }
        frame 22 { x: 2.1; y: 66.6; skew-x: -7.7; skew-y: -7.7; scale-x: 0.715; scale-y: 0.715; }
        frame 23 { x: 7.4; y: 65.9; skew-x: -11.7; skew-y: -11.7; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 12.7; y: 64.3; skew-x: -15.7; skew-y: -15.7; scale-x: 0.714; scale-y: 0.714; }
        frame 25 { x: 18; y: 62.9; skew-x: -19.9; skew-y: -19.9; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 23.6; y: 61.5; skew-x: -24; skew-y: -24; scale-x: 0.713; scale-y: 0.713; }
        frame 27 { x: 29.2; y: 60; skew-x: -28; skew-y: -28; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 34.8; y: 58.8; skew-x: -32.2; skew-y: -32.2; }
        frame 29 { x: 40.6; y: 57.7; skew-x: -36.3; skew-y: -36.3; }
        frame 30 { x: 46.5; y: 56.6; skew-x: -40.5; skew-y: -40.5; scale-x: 0.712; scale-y: 0.712; }
        frame 31 { x: 52.5; y: 55.5; skew-x: -44.5; skew-y: -44.5; scale-x: 0.714; scale-y: 0.714; }
        frame 32 { x: 45.4; y: 56.8; skew-x: -42.3; skew-y: -42.3; scale-x: 0.712; scale-y: 0.712; }
        frame 33 { x: 38; y: 58.1; skew-x: -40.1; skew-y: -40.1; scale-x: 0.713; scale-y: 0.713; }
        frame 34 { x: 31.5; y: 57.2; skew-x: -31; skew-y: -31; scale-x: 0.712; scale-y: 0.712; }
        frame 35 { x: 25.5; y: 56.5; skew-x: -21.7; skew-y: -21.7; scale-x: 0.713; scale-y: 0.713; }
        frame 36 { x: 19.9; y: 56.3; skew-x: -12.7; skew-y: -12.7; scale-x: 0.714; scale-y: 0.714; }
        frame 37 { x: 14.7; y: 56.5; skew-x: -3.7; skew-y: -3.7; scale-x: 0.716; scale-y: 0.716; }
        frame 38 { x: 10.9; y: 55; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 7.2; y: 53.5; skew-x: 6.8; skew-y: 6.8; }
        frame 40 { x: 7.3; y: 51.5; skew-x: 12; skew-y: 12; scale-x: 0.715; scale-y: 0.715; }
        frame 41 { x: 7.7; y: 49.6; skew-x: 17.3; skew-y: 17.3; scale-x: 0.716; scale-y: 0.716; }
        frame 42 { x: 7.9; y: 47.9; skew-x: 22.6; skew-y: 22.6; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 8.2; y: 46.4; skew-x: 27.8; skew-y: 27.8; }
        frame 44 { x: 8.5; y: 45.1; skew-x: 33.1; skew-y: 33.1; }
        frame 45 { x: 8.9; y: 44.1; skew-x: 38.4; skew-y: 38.4; }
        frame 46 { x: 9.1; y: 43.4; skew-x: 43.6; skew-y: 43.6; }
        frame 47 { x: 9.3; y: 42.8; skew-x: 48.9; skew-y: 48.9; }
        frame 48 { x: 9.5; y: 42.3; skew-x: 54.2; skew-y: 54.2; scale-x: 0.718; scale-y: 0.718; }
        frame 49 { x: 1.7; y: 51.6; skew-x: 6.8; skew-y: 6.8; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: 3.1; y: 51; skew-x: 10.6; skew-y: 10.6; scale-x: 0.719; scale-y: 0.719; }
        frame 51 { x: 4.8; y: 50.4; skew-x: 14.5; skew-y: 14.5; scale-x: 0.718; scale-y: 0.718; }
        frame 52 { x: 6.3; y: 49.9; skew-x: 18.3; skew-y: 18.3; scale-x: 0.717; scale-y: 0.717; }
        frame 53 { x: 7.9; y: 49.5; skew-x: 22.3; skew-y: 22.3; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 9.5; y: 49.3; skew-x: 26.1; skew-y: 26.1; scale-x: 0.716; scale-y: 0.716; }
        frame 55 { x: 11.1; y: 49.2; skew-x: 30; skew-y: 30; scale-x: 0.717; scale-y: 0.717; }
        frame 56 { x: 5.1; y: 55.5; skew-x: 21.3; skew-y: 21.3; scale-x: 0.715; scale-y: 0.715; }
        frame 57 { x: -0.6; y: 62.4; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: -6.2; y: 69.8; skew-x: 4.2; skew-y: 4.2; scale-x: 0.716; scale-y: 0.716; }
        frame 59 { x: -6.3; y: 71.1; skew-x: 4.1; skew-y: 4.1; scale-x: 0.715; scale-y: 0.715; }
        frame 60 { x: -6.2; y: 72.3; skew-x: 4.2; skew-y: 4.2; scale-x: 0.716; scale-y: 0.716; }
        frame 61 { x: -1.5; y: 61.5; skew-x: 26.6; skew-y: 26.6; scale-x: 0.714; scale-y: 0.714; }
        frame 62 { x: 3.2; y: 54.6; skew-x: 49.2; skew-y: 49.2; scale-x: 0.713; scale-y: 0.713; }
        frame 63 { x: 6.5; y: 51.3; skew-x: 71.7; skew-y: 71.7; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 12.8; y: 47.9; skew-x: 82; skew-y: 92.8; scale-x: 0.741; }
        frame 65 { x: 16.1; y: 44.6; skew-x: 92; skew-y: 114.2; scale-x: 0.769; scale-y: 0.712; }
        frame 66 { x: 19.6; y: 46.6; skew-x: 101; skew-y: 119.6; scale-x: 0.754; scale-y: 0.758; }
        frame 67 { x: 22.6; y: 49.3; skew-x: 110.1; skew-y: 125.1; scale-x: 0.74; scale-y: 0.804; }
        frame 68 { x: 25.2; y: 52; skew-x: 119.2; skew-y: 130.5; scale-x: 0.726; scale-y: 0.852; }
        frame 69 { x: 20.6; y: 56; skew-x: 111.1; skew-y: 122.3; scale-x: 0.725; scale-y: 0.85; }
        frame 70 { x: 15.5; y: 59.8; skew-x: 103.1; skew-y: 114.3; scale-x: 0.724; scale-y: -10000; }
        frame 71 { x: 9.8; y: 63.7; skew-x: 95.1; skew-y: 106.4; scale-x: -10000; }
        frame 72 { x: 9.7; y: 64; skew-x: 93.5; skew-y: 104.8; scale-y: 0.849; }
        frame 73 { x: 9.6; y: 64.1; skew-x: 92.1; skew-y: 103.3; scale-y: 0.85; }
        frame 74 { x: 9.1; y: 57.5; skew-x: 70.7; skew-y: 79.2; scale-x: 0.722; scale-y: 0.816; }
        frame 75 { x: 4.8; y: 54.3; skew-x: 49.4; skew-y: 55.1; scale-x: 0.721; scale-y: 0.784; }
        frame 76 { x: -0; y: 54.5; skew-x: 28.1; skew-y: 30.9; scale-x: 0.719; scale-y: 0.751; }
        frame 77 { x: 1.7; y: 51.6; skew-x: 6.8; skew-y: 6.8; scale-x: 0.72; scale-y: 0.72; }
        frame 78 { x: 5.5; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 7.6; y: 51.1; skew-x: 7.1; skew-y: 7.1; scale-x: 0.719; scale-y: 0.719; }
        frame 80 { x: 9.7; y: 50.5; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 12; y: 50; skew-x: 8; skew-y: 8; }
        frame 82 { x: 14.1; y: 49.4; skew-x: 8.5; skew-y: 8.5; }
        frame 83 { x: 16.2; y: 48.9; skew-x: 8.8; skew-y: 8.8; }
        frame 84 { x: 18.4; y: 48.4; skew-x: 9.3; skew-y: 9.3; }
        frame 85 { x: 20.6; y: 47.8; skew-x: 9.8; skew-y: 9.8; scale-x: 0.718; scale-y: 0.718; }
        frame 86 { x: 22.8; y: 47.2; skew-x: 10.3; skew-y: 10.3; scale-x: 0.719; scale-y: 0.719; }
        frame 87 { x: 7.5; y: 56.6; skew-x: -4.7; skew-y: -4.7; scale-x: 0.718; scale-y: 0.718; }
        frame 88 { x: -6.8; y: 67.4; skew-x: -19.7; skew-y: -19.7; scale-x: 0.717; scale-y: 0.717; }
        frame 89 { x: -19.9; y: 79.3; skew-x: -34.7; skew-y: -34.7; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: -31.5; y: 92.3; skew-x: -49.8; skew-y: -49.8; scale-x: 0.718; scale-y: 0.718; }
        frame 91 { x: -34.9; y: 100; skew-x: -56.3; skew-y: -56.3; scale-x: 0.716; scale-y: 0.716; }
        frame 92 { x: -37.9; y: 107.7; skew-x: -62.8; skew-y: -62.8; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -40.8; y: 115.2; skew-x: -69.4; skew-y: -69.4; }
        frame 94 { x: -43.2; y: 122.9; skew-x: -75.9; skew-y: -75.9; scale-x: 0.717; scale-y: 0.717; }
        frame 95 { x: -42.6; y: 130.1; skew-x: -90.4; skew-y: -90.4; scale-x: 0.716; scale-y: 0.716; }
        frame 96 { x: -40.5; y: 136.4; skew-x: -105; skew-y: -105; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: -10000; y: 136.9; skew-x: -104.9; skew-y: -104.9; scale-x: 0.715; scale-y: 0.715; }
        frame 98 { y: 137.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 99 { y: 137.9; }
        frame 100 { y: 138.4; skew-x: -105; skew-y: -105; scale-x: 0.716; scale-y: 0.716; }
        frame 101 { x: -40.6; y: 138.2; skew-x: -104.9; skew-y: -104.9; scale-x: 0.715; scale-y: 0.715; }
        frame 102 { x: -40.5; y: 137.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: -10000; y: 138.2; }
        frame 104 { y: 138.4; skew-x: -105; skew-y: -105; scale-x: 0.716; scale-y: 0.716; }
    }
    Track {
        source-name: "Zombie_yeti_innerleg_foot";
        frame-count: 105;
        frame 0 { x: 5.5; y: 121.1; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_INNERLEG_FOOT; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 15 { x: 44.9; y: 122.5; skew-x: -2.4; skew-y: -2.4; scale-x: 0.717; scale-y: 0.717; }
        frame 16 { x: 43.7; y: 124.1; skew-x: -11.7; skew-y: -11.7; scale-x: 0.716; scale-y: 0.716; }
        frame 17 { x: 43.1; y: 125.8; skew-x: -21.2; skew-y: -21.2; scale-x: 0.715; scale-y: 0.715; }
        frame 18 { x: -10000; y: 127.7; skew-x: -30.7; skew-y: -30.7; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 43.7; y: 129.4; skew-x: -40.2; skew-y: -40.2; scale-x: 0.714; scale-y: 0.714; }
        frame 20 { x: 44.9; y: 130.9; skew-x: -49.6; skew-y: -49.6; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 46.5; y: 132.1; skew-x: -59; skew-y: -59; scale-x: 0.715; scale-y: 0.715; }
        frame 22 { x: 38.1; y: 130; skew-x: -48; skew-y: -48; scale-x: 0.713; scale-y: 0.713; }
        frame 23 { x: 30.6; y: 127.6; skew-x: -37; skew-y: -37; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 23.7; y: 124.9; skew-x: -25.7; skew-y: -25.7; scale-x: 0.712; scale-y: 0.712; }
        frame 25 { x: 17.7; y: 122.2; skew-x: -14.7; skew-y: -14.7; scale-x: 0.713; scale-y: 0.713; }
        frame 26 { x: 12.5; y: 119.6; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 8.1; y: 117.2; skew-x: 7.2; skew-y: 7.2; }
        frame 28 { x: 2.9; y: 110.4; skew-x: 19.8; skew-y: 19.8; scale-x: 0.712; scale-y: 0.712; }
        frame 29 { x: -1.5; y: 104.3; skew-x: 32.3; skew-y: 32.3; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -5.4; y: 97; skew-x: 44.9; skew-y: 44.9; scale-x: 0.711; scale-y: 0.711; }
        frame 31 { x: -8.9; y: 90.6; skew-x: 57.4; skew-y: 57.4; scale-x: 0.713; scale-y: 0.713; }
        frame 32 { x: -8.7; y: 96.2; skew-x: 46.9; skew-y: 46.9; scale-x: 0.711; scale-y: 0.711; }
        frame 33 { x: -8.3; y: 102.3; skew-x: 36.3; skew-y: 36.3; scale-x: 0.71; scale-y: 0.71; }
        frame 34 { x: -7.5; y: 109.2; skew-x: 25.8; skew-y: 25.8; scale-x: 0.711; scale-y: 0.711; }
        frame 35 { x: -3.1; y: 112.7; skew-x: 18.8; skew-y: 18.8; scale-x: 0.71; scale-y: 0.71; }
        frame 36 { x: 1.4; y: 116.3; skew-x: 11.8; skew-y: 11.8; scale-x: 0.711; scale-y: 0.711; }
        frame 37 { x: 6.2; y: 120.3; skew-x: 4.8; skew-y: 4.8; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 6.4; y: 120.5; skew-x: 4; skew-y: 4; scale-x: 0.712; scale-y: 0.712; }
        frame 39 { x: 6.8; y: 120.7; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 11; y: 121; skew-x: 2.5; skew-y: 2.5; scale-x: 0.713; scale-y: 0.713; }
        frame 41 { x: 15.3; y: 121.1; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 19.4; y: 121.3; skew-x: 1.3; skew-y: 1.3; scale-x: 0.714; scale-y: 0.714; }
        frame 43 { x: 23.7; y: 121.5; skew-x: 0.6; skew-y: 0.6; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 27.9; y: 121.7; skew-x: 0; skew-y: 0; scale-x: 0.715; scale-y: 0.715; }
        frame 45 { x: 32.2; y: 121.8; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 36.4; y: 122.1; skew-x: -1; skew-y: -1; scale-x: 0.716; scale-y: 0.716; }
        frame 47 { x: 40.6; y: 122.3; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 44.9; y: 122.5; skew-x: -2.4; skew-y: -2.4; scale-x: 0.717; scale-y: 0.717; }
        frame 49 { x: 5.5; y: 121.1; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 5.2; y: 121.6; skew-x: -2.4; skew-y: -2.4; }
        frame 88 { x: 4.8; y: 122.2; skew-x: -5.2; skew-y: -5.2; scale-x: 0.719; scale-y: 0.719; }
        frame 89 { x: 4.6; y: 122.8; skew-x: -7.9; skew-y: -7.9; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 4.3; y: 123.3; skew-x: -10.6; skew-y: -10.6; }
        frame 91 { x: 7.6; y: 128.7; skew-x: -34.7; skew-y: -34.7; scale-x: 0.717; scale-y: 0.717; }
        frame 92 { x: 14.6; y: 133.4; skew-x: -58.9; skew-y: -58.9; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 24.7; y: 135.6; skew-x: -83.1; skew-y: -83.1; scale-x: 0.716; scale-y: 0.716; }
        frame 94 { x: 36.6; y: 134.4; skew-x: -107.2; skew-y: -107.2; scale-x: 0.715; scale-y: 0.715; }
        frame 95 { x: 36.1; y: 121.3; skew-x: -127.2; skew-y: -127.2; scale-x: 0.713; scale-y: 0.713; }
        frame 96 { x: 34.9; y: 105.9; skew-x: -147.3; skew-y: -147.3; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 34.5; y: 116.7; skew-x: -136.8; skew-y: -136.8; scale-x: 0.711; scale-y: 0.711; }
        frame 98 { x: 33.9; y: 126.8; skew-x: -126.3; skew-y: -126.3; scale-x: 0.71; scale-y: 0.71; }
        frame 99 { x: 33.1; y: 136.2; skew-x: -115.9; skew-y: -115.9; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 32.3; y: 145; skew-x: -105.4; skew-y: -105.4; }
        frame 101 { x: 32.8; y: 140.7; skew-x: -110.7; skew-y: -110.7; scale-x: 0.709; scale-y: 0.709; }
        frame 102 { x: 33.1; y: 136.2; skew-x: -115.9; skew-y: -115.9; scale-x: 0.71; scale-y: 0.71; }
        frame 103 { x: 32.6; y: 140.7; skew-x: -110.7; skew-y: -110.7; scale-x: 0.709; scale-y: 0.709; }
        frame 104 { x: 32.3; y: 145; skew-x: -105.4; skew-y: -105.4; scale-x: 0.71; scale-y: 0.71; }
    }
    Track {
        source-name: "Zombie_yeti_innerleg_lower";
        frame-count: 105;
        frame 0 { x: 10.9; y: 96; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_INNERLEG_LOWER; }
        frame 1 { x: 10.4; y: -10000; skew-y: -0.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 9.8; skew-y: -1.4; scale-y: 0.721; }
        frame 3 { x: 9.3; y: 96.1; skew-y: -2.4; scale-y: -10000; }
        frame 4 { x: 8.7; y: 96; skew-y: -3.2; scale-y: 0.722; }
        frame 5 { x: 8.2; skew-y: -4; scale-y: -10000; }
        frame 6 { x: 7.6; y: -10000; skew-y: -4.9; scale-y: 0.723; }
        frame 7 { x: 8.1; skew-y: -4.2; scale-y: 0.722; }
        frame 8 { x: 8.4; skew-y: -3.7; scale-y: -10000; }
        frame 9 { x: 8.9; skew-y: -2.9; }
        frame 10 { x: 9.3; skew-y: -2.4; scale-y: 0.721; }
        frame 11 { x: 9.7; y: 96; skew-y: -1.7; scale-y: -10000; }
        frame 12 { x: 10.1; skew-y: -1.2; }
        frame 13 { x: 10.6; y: -10000; skew-y: -0.4; scale-y: 0.72; }
        frame 14 { x: 10.9; skew-y: 0; scale-y: -10000; }
        frame 15 { x: 36; y: 106; skew-x: -20.8; skew-y: -26.4; scale-x: 0.738; scale-y: 0.701; }
        frame 16 { x: 33; y: 108.1; skew-x: -26.5; skew-y: -33.5; scale-x: 0.74; scale-y: 0.699; }
        frame 17 { x: 30.5; y: 110.4; skew-x: -32.5; skew-y: -40.5; scale-x: 0.742; scale-y: -10000; }
        frame 18 { x: 28.3; y: 112.8; skew-x: -38.2; skew-y: -47.8; scale-x: 0.745; }
        frame 19 { x: 26.4; y: 115.3; skew-x: -44; skew-y: -54.8; scale-x: 0.748; }
        frame 20 { x: 24.9; y: 117.8; skew-x: -49.8; skew-y: -62.1; scale-x: 0.75; }
        frame 21 { x: 23.8; y: 120.3; skew-x: -55.6; skew-y: -69.1; scale-x: 0.754; scale-y: 0.7; }
        frame 22 { x: 19.3; y: 114.6; skew-x: -44.5; skew-y: -56.8; scale-x: 0.75; scale-y: 0.698; }
        frame 23 { x: 15.9; y: 109; skew-x: -33.5; skew-y: -44.6; scale-x: 0.749; scale-y: -10000; }
        frame 24 { x: 13.8; y: 103.3; skew-x: -22.2; skew-y: -32.3; scale-x: 0.746; scale-y: 0.697; }
        frame 25 { x: 12.7; y: 98.2; skew-x: -11.2; skew-y: -20; scale-x: 0.744; scale-y: -10000; }
        frame 26 { x: 12.5; y: 93.6; skew-x: -0; skew-y: -7.9; scale-x: 0.743; scale-y: 0.698; }
        frame 27 { x: 13.2; y: 90; skew-x: 10.8; skew-y: 4; scale-x: 0.74; scale-y: -10000; }
        frame 28 { x: 14.6; y: 87.2; skew-x: 21.8; skew-y: 16.3; scale-x: 0.738; scale-y: 0.697; }
        frame 29 { x: 16.5; y: 85.5; skew-x: 33.1; skew-y: 28.6; scale-x: 0.736; scale-y: 0.698; }
        frame 30 { x: 18.3; y: 84; skew-x: 47.9; skew-y: 44.9; scale-x: 0.733; scale-y: 0.697; }
        frame 31 { x: 19.8; y: 84.1; skew-x: 62.6; skew-y: 61.2; scale-x: 0.732; scale-y: 0.698; }
        frame 32 { x: 17.6; y: 83.6; skew-x: 52.9; skew-y: 49.1; scale-x: 0.73; scale-y: 0.701; }
        frame 33 { x: 14.9; y: 83.9; skew-x: 43.1; skew-y: 37.1; scale-x: -10000; scale-y: 0.705; }
        frame 34 { x: 12.3; y: 85.2; skew-x: 33.3; skew-y: 25; scale-y: 0.71; }
        frame 35 { x: 9.6; y: 87.5; skew-x: 23.6; skew-y: 12.8; scale-y: 0.714; }
        frame 36 { x: 7.2; y: 90.7; skew-x: 13.8; skew-y: 0.8; scale-y: 0.719; }
        frame 37 { x: 5.3; y: 94.9; skew-x: 4.2; skew-y: -11.1; scale-x: 0.731; scale-y: 0.723; }
        frame 38 { x: 4.6; y: 96.4; skew-x: 0.5; skew-y: -13.7; scale-x: -10000; scale-y: 0.72; }
        frame 39 { x: 4; y: 97.9; skew-x: -3; skew-y: -16.5; scale-x: 0.732; scale-y: 0.718; }
        frame 40 { x: 7.5; y: 98.8; skew-x: -4.9; skew-y: -17.5; scale-x: -10000; scale-y: 0.715; }
        frame 41 { x: 10.9; y: 99.7; skew-x: -6.9; skew-y: -18.7; scale-x: 0.733; scale-y: 0.713; }
        frame 42 { x: 14.4; y: 100.5; skew-x: -8.9; skew-y: -19.7; scale-x: -10000; scale-y: 0.711; }
        frame 43 { x: 17.9; y: 101.3; skew-x: -10.9; skew-y: -20.9; scale-x: 0.734; scale-y: 0.709; }
        frame 44 { x: 21.5; y: 102.3; skew-x: -12.7; skew-y: -22; scale-x: 0.735; scale-y: 0.708; }
        frame 45 { x: 25.1; y: 103.1; skew-x: -14.7; skew-y: -23; scale-x: -10000; scale-y: 0.706; }
        frame 46 { x: 28.7; y: 104; skew-x: -16.7; skew-y: -24.2; scale-x: 0.736; scale-y: 0.704; }
        frame 47 { x: 32.3; y: 104.8; skew-x: -18.7; skew-y: -25.2; scale-x: -10000; scale-y: 0.702; }
        frame 48 { x: 36; y: 106; skew-x: -20.8; skew-y: -26.4; scale-x: 0.738; scale-y: 0.701; }
        frame 49 { x: 10.9; y: 96; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: 9.8; y: 96.5; skew-x: -1.5; skew-y: -1.5; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 8.7; y: 97.1; skew-x: -3.2; skew-y: -3.2; }
        frame 52 { x: 7.6; y: 97.8; skew-x: -4.9; skew-y: -4.9; }
        frame 53 { x: 6.5; y: 98.3; skew-x: -6.7; skew-y: -6.7; scale-x: 0.719; scale-y: 0.719; }
        frame 54 { x: 5.4; y: 99; skew-x: -8.4; skew-y: -8.4; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 4.4; y: 99.7; skew-x: -10.2; skew-y: -10.2; scale-x: 0.72; scale-y: 0.72; }
        frame 56 { x: 1.7; y: 100.6; skew-x: -10.9; skew-y: -15.7; scale-x: 0.727; scale-y: 0.719; }
        frame 57 { x: -0.8; y: 101.8; skew-x: -11.7; skew-y: -21.5; scale-x: 0.735; scale-y: 0.718; }
        frame 58 { x: -3.5; y: 103.3; skew-x: -12.5; skew-y: -27.2; scale-x: 0.743; scale-y: 0.719; }
        frame 59 { x: -4.1; y: 103.4; skew-x: -12.2; skew-y: -28.5; scale-x: 0.748; scale-y: 0.718; }
        frame 60 { x: -4.6; y: 103.7; skew-x: -10000; skew-y: -30; scale-x: 0.755; scale-y: 0.719; }
        frame 61 { x: -3.6; y: 103.1; skew-x: -11.9; skew-y: -27.5; scale-x: 0.75; scale-y: 0.718; }
        frame 62 { x: -2.3; y: 102.4; skew-x: -11.7; skew-y: -25; scale-x: 0.745; scale-y: -10000; }
        frame 63 { x: -1.2; y: 101.9; skew-x: -11.4; skew-y: -22.5; scale-x: 0.741; }
        frame 64 { x: -0.1; y: 101.4; skew-x: -11.2; skew-y: -20; scale-x: 0.737; }
        frame 65 { x: 0.8; y: 100.9; skew-x: -10.9; skew-y: -17.5; scale-x: 0.732; scale-y: 0.719; }
        frame 66 { x: 2; y: 100.5; skew-x: -10.7; skew-y: -15.2; scale-x: 0.728; scale-y: -10000; }
        frame 67 { x: 3.2; y: 100; skew-x: -10.4; skew-y: -12.7; scale-x: 0.724; }
        frame 68 { x: 4.4; y: 99.7; skew-x: -10.2; skew-y: -10.2; scale-x: 0.72; scale-y: 0.72; }
        frame 69 { x: 1.3; y: 100.7; skew-x: -10.7; skew-y: -16.7; scale-x: 0.731; scale-y: 0.719; }
        frame 70 { x: -1.6; y: 102.1; skew-x: -11.4; skew-y: -23.4; scale-x: 0.743; scale-y: 0.718; }
        frame 71 { x: -4.6; y: 103.7; skew-x: -12.2; skew-y: -30; scale-x: 0.755; scale-y: 0.719; }
        frame 72 { x: -5; y: 103.5; skew-x: -10.7; skew-y: -10000; scale-x: 0.762; scale-y: 0.718; }
        frame 73 { x: -5.5; y: 103.2; skew-x: -9.1; scale-x: 0.769; scale-y: 0.719; }
        frame 74 { x: -1.6; y: 100.9; skew-x: -6.7; skew-y: -22.4; scale-x: 0.757; scale-y: 0.718; }
        frame 75 { x: 2.4; y: 98.9; skew-x: -4.4; skew-y: -14.9; scale-x: 0.745; scale-y: 0.719; }
        frame 76 { x: 6.6; y: 97.3; skew-x: -2.2; skew-y: -7.4; scale-x: 0.732; scale-y: -10000; }
        frame 77 { x: 10.9; y: 96; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 10.7; y: 96; skew-y: -0.4; }
        frame 80 { x: 10.5; y: -10000; skew-y: -0.9; }
        frame 81 { x: 10.2; y: 96; skew-y: -1.4; scale-y: 0.721; }
        frame 82 { x: 10; y: -10000; skew-y: -1.9; scale-y: -10000; }
        frame 83 { x: 9.8; skew-y: -2.4; }
        frame 84 { x: 9.6; skew-y: -2.9; }
        frame 85 { x: 9.3; skew-y: -3.4; scale-y: 0.722; }
        frame 86 { x: 9; skew-y: -4.1; scale-y: -10000; }
        frame 87 { x: 3.5; y: 100.5; skew-x: -10.9; skew-y: -15; scale-x: 0.719; scale-y: 0.721; }
        frame 88 { x: -1; y: 105.5; skew-x: -21.9; skew-y: -26; scale-x: 0.718; scale-y: 0.72; }
        frame 89 { x: -4.8; y: 110.9; skew-x: -33; skew-y: -37; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: -7.6; y: 116.3; skew-x: -44; skew-y: -48.2; }
        frame 91 { x: -6.5; y: 122.3; skew-x: -59.3; skew-y: -63.6; scale-x: 0.717; scale-y: 0.719; }
        frame 92 { x: -3.5; y: 127.7; skew-x: -74.8; skew-y: -78.9; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 0.9; y: 131.9; skew-x: -89.9; skew-y: -94.2; scale-y: 0.718; }
        frame 94 { x: 6.8; y: 134.8; skew-x: -105.4; skew-y: -109.6; scale-x: 0.716; scale-y: -10000; }
        frame 95 { x: 9.5; y: 131.7; skew-x: -125.5; skew-y: -129.7; scale-x: 0.714; scale-y: 0.716; }
        frame 96 { x: 12.4; y: 125.3; skew-x: -145.6; skew-y: -149.7; scale-x: 0.715; scale-y: -10000; }
        frame 97 { x: 7.6; y: 130.8; skew-x: -130.8; skew-y: -135; scale-x: 0.713; scale-y: 0.714; }
        frame 98 { x: 2.9; y: 134.3; skew-x: -116.2; skew-y: -120.3; scale-x: 0.712; scale-y: -10000; }
        frame 99 { x: -1.1; y: 136.3; skew-x: -101.4; skew-y: -105.7; scale-x: -10000; scale-y: 0.713; }
        frame 100 { x: -4.4; y: 136.8; skew-x: -86.9; skew-y: -91; scale-x: 0.711; scale-y: -10000; }
        frame 101 { x: -2.8; y: 136.7; skew-x: -94.2; skew-y: -98.2; scale-x: -10000; }
        frame 102 { x: -1.1; y: 136.3; skew-x: -101.4; skew-y: -105.7; scale-x: 0.712; }
        frame 103 { x: -2.8; y: 136.7; skew-x: -94.2; skew-y: -98.2; scale-x: 0.711; }
        frame 104 { x: -4.4; y: 136.8; skew-x: -86.9; skew-y: -91; scale-x: -10000; }
    }
    Track {
        source-name: "Zombie_yeti_innerleg_upper";
        frame-count: 105;
        frame 0 { x: 9.7; y: 82.1; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_INNERLEG_UPPER; }
        frame 1 { x: 9.8; y: 81.9; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 10.1; y: 81.8; skew-x: 2; skew-y: 2; }
        frame 3 { x: 10.3; y: 81.7; skew-x: 3; skew-y: 3; }
        frame 4 { x: 10.4; y: 81.6; skew-x: 4.1; skew-y: 4.1; }
        frame 5 { x: 10.7; y: 81.5; skew-x: 5.3; skew-y: 5.3; }
        frame 6 { x: 11; y: 81.2; skew-x: 6.3; skew-y: 6.3; }
        frame 7 { x: 10.8; y: 81.3; skew-x: 5.5; skew-y: 5.5; scale-x: 0.719; scale-y: 0.719; }
        frame 8 { x: 10.7; y: 81.4; skew-x: 4.8; skew-y: 4.8; scale-x: 0.72; scale-y: 0.72; }
        frame 9 { x: 10.4; y: 81.6; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 10.2; y: 81.7; skew-x: 3; skew-y: 3; }
        frame 11 { x: 10.1; y: 81.8; skew-x: 2.3; skew-y: 2.3; }
        frame 12 { x: 10; y: -10000; skew-x: 1.5; skew-y: 1.5; }
        frame 13 { x: 9.8; y: 81.9; skew-x: 0.8; skew-y: 0.8; }
        frame 14 { x: 9.7; y: 82.1; skew-x: 0; skew-y: 0; }
        frame 15 { x: 27.6; y: 96; skew-x: -30.2; skew-y: -30.2; scale-x: 0.718; scale-y: 0.718; }
        frame 16 { x: 24.5; y: 97.5; skew-x: -34.7; skew-y: -34.7; scale-x: 0.717; scale-y: 0.717; }
        frame 17 { x: 21.4; y: 99.1; skew-x: -39.3; skew-y: -39.3; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 18.4; y: 100.6; skew-x: -43.8; skew-y: -43.8; }
        frame 19 { x: 15.6; y: 102.2; skew-x: -48.5; skew-y: -48.5; }
        frame 20 { x: 13; y: 103.7; skew-x: -53; skew-y: -53; }
        frame 21 { x: 10.4; y: 105.2; skew-x: -57.6; skew-y: -57.6; scale-x: 0.718; scale-y: 0.718; }
        frame 22 { x: 9.6; y: 100.5; skew-x: -45.8; skew-y: -45.8; scale-x: 0.716; scale-y: 0.716; }
        frame 23 { x: -10000; y: 95.6; skew-x: -33.7; skew-y: -33.7; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 10.6; y: 91; skew-x: -21.7; skew-y: -21.7; scale-x: 0.715; scale-y: 0.715; }
        frame 25 { x: 12.4; y: 86.7; skew-x: -9.9; skew-y: -9.9; scale-x: 0.716; scale-y: 0.716; }
        frame 26 { x: 14.9; y: 83; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 18; y: 79.9; skew-x: 13.6; skew-y: 13.6; }
        frame 28 { x: 21.6; y: 77.7; skew-x: 25.6; skew-y: 25.6; scale-x: 0.715; scale-y: 0.715; }
        frame 29 { x: 25.4; y: 76.3; skew-x: 37.4; skew-y: 37.4; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 29.5; y: 75.8; skew-x: 49.4; skew-y: 49.4; }
        frame 31 { x: 33.4; y: 76.2; skew-x: 61.2; skew-y: 61.2; scale-x: 0.716; scale-y: 0.716; }
        frame 32 { x: 31.8; y: 77.1; skew-x: 54.4; skew-y: 57.6; scale-x: 0.721; scale-y: 0.715; }
        frame 33 { x: 30.3; y: 78.2; skew-x: 47.9; skew-y: 53.9; scale-x: 0.727; scale-y: -10000; }
        frame 34 { x: 28.7; y: 79.5; skew-x: 41.1; skew-y: 50.1; scale-x: 0.734; }
        frame 35 { x: 27.3; y: 81; skew-x: 34.3; skew-y: 46.4; scale-x: 0.74; }
        frame 36 { x: 26.1; y: 82.8; skew-x: 27.6; skew-y: 42.8; scale-x: 0.746; }
        frame 37 { x: 24.9; y: 84.7; skew-x: 20.9; skew-y: 39.1; scale-x: 0.754; scale-y: 0.716; }
        frame 38 { x: 22; y: -10000; skew-x: 16.8; skew-y: 33.6; scale-x: 0.75; scale-y: 0.715; }
        frame 39 { x: 19; y: 84.8; skew-x: 12.8; skew-y: 28.1; scale-x: 0.747; scale-y: -10000; }
        frame 40 { x: 19.8; y: 85; skew-x: 8.6; skew-y: 22.5; scale-x: 0.744; }
        frame 41 { x: 20.8; y: 85.3; skew-x: 4.5; skew-y: 17; scale-x: 0.742; scale-y: 0.716; }
        frame 42 { x: 21.7; y: 85.8; skew-x: 0.5; skew-y: 11.5; scale-x: 0.739; scale-y: -10000; }
        frame 43 { x: 22.7; y: 86.3; skew-x: -3.2; skew-y: 6; scale-x: 0.736; scale-y: 0.717; }
        frame 44 { x: 23.7; y: 87.3; skew-x: -7.4; skew-y: 0.5; scale-x: 0.734; scale-y: -10000; }
        frame 45 { x: 24.5; y: 89.1; skew-x: -13; skew-y: -6.9; scale-x: 0.729; }
        frame 46 { x: 25.3; y: 91.2; skew-x: -18.7; skew-y: -14.7; scale-x: 0.725; }
        frame 47 { x: 26.5; y: 93.4; skew-x: -24.5; skew-y: -22.4; scale-x: 0.721; }
        frame 48 { x: 27.6; y: 96; skew-x: -30.2; skew-y: -30.2; scale-x: 0.718; scale-y: 0.718; }
        frame 49 { x: 9.7; y: 82.1; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: 10.3; y: 81.8; skew-x: 2.6; skew-y: 2.6; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 10.9; y: 81.4; skew-x: 5.3; skew-y: 5.3; }
        frame 52 { x: 11.6; y: 81.1; skew-x: 8.1; skew-y: 8.1; scale-x: 0.719; scale-y: 0.719; }
        frame 53 { x: 12.3; y: 80.8; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 13.1; y: 80.7; skew-x: 13.5; skew-y: 13.5; }
        frame 55 { x: 14; y: 80.5; skew-x: 16.4; skew-y: 16.4; }
        frame 56 { x: 12.3; y: 81.8; skew-x: 15.8; skew-y: 15.8; scale-x: 0.718; scale-y: 0.718; }
        frame 57 { x: 10.8; y: 83.1; skew-x: 15.5; skew-y: 15.5; scale-x: 0.717; scale-y: 0.717; }
        frame 58 { x: 9.2; y: 84.3; skew-x: 15.1; skew-y: 15.1; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 9.8; y: 85.1; skew-x: 16.8; skew-y: 16.8; }
        frame 60 { x: 10.3; y: 85.7; skew-x: 18.9; skew-y: 18.9; }
        frame 61 { x: 10.7; y: 85.1; skew-x: 18.5; skew-y: 18.5; }
        frame 62 { x: 11.2; y: 84.4; skew-x: 18.3; skew-y: 18.3; }
        frame 63 { x: 11.6; y: 83.8; skew-x: 17.8; skew-y: 17.8; }
        frame 64 { x: 12.2; y: 83.1; skew-x: 17.5; skew-y: 17.5; scale-x: 0.718; scale-y: 0.718; }
        frame 65 { x: 12.6; y: 82.4; skew-x: 17.3; skew-y: 17.3; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 13; y: 81.8; skew-x: 16.8; skew-y: 16.8; }
        frame 67 { x: 13.5; y: 81.1; skew-x: 16.6; skew-y: 16.6; }
        frame 68 { x: 14; y: 80.5; skew-x: 16.4; skew-y: 16.4; scale-x: 0.719; scale-y: 0.719; }
        frame 69 { x: 12.7; y: 81.8; skew-x: 17.1; skew-y: 17.1; scale-x: 0.718; scale-y: 0.718; }
        frame 70 { x: 11.4; y: 83.2; skew-x: 18; skew-y: 18; scale-x: 0.717; scale-y: 0.717; }
        frame 71 { x: 10.3; y: 84.5; skew-x: 18.9; skew-y: 18.9; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -10000; y: -10000; skew-x: 18.8; skew-y: 18.8; }
        frame 73 { skew-x: 18.9; skew-y: 18.9; }
        frame 74 { x: 10; y: 83.7; skew-x: 14.1; skew-y: 14.1; }
        frame 75 { x: 9.8; y: 83.1; skew-x: 9.3; skew-y: 9.3; scale-x: 0.718; scale-y: 0.718; }
        frame 76 { x: -10000; y: 82.5; skew-x: 4.6; skew-y: 4.6; scale-x: 0.719; scale-y: 0.719; }
        frame 77 { x: 9.7; y: 82.1; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 10.5; y: 82; skew-x: 1.6; skew-y: 1.6; }
        frame 80 { x: 11.3; y: 81.9; skew-x: 3.3; skew-y: 3.3; }
        frame 81 { x: 12.3; y: 81.8; skew-x: 5; skew-y: 5; }
        frame 82 { x: 13.1; y: 81.6; skew-x: 6.8; skew-y: 6.8; scale-x: 0.719; scale-y: 0.719; }
        frame 83 { x: 14; y: -10000; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 14.9; y: 81.5; skew-x: 10.3; skew-y: 10.3; }
        frame 85 { x: 15.9; y: -10000; skew-x: 12; skew-y: 12; }
        frame 86 { x: 16.8; y: 81.4; skew-x: 13.8; skew-y: 13.8; }
        frame 87 { x: 6.2; y: 86.7; skew-x: -0.9; skew-y: -0.9; }
        frame 88 { x: -3.1; y: 92.9; skew-x: -16; skew-y: -16; scale-x: 0.718; scale-y: 0.718; }
        frame 89 { x: -11.5; y: 99.8; skew-x: -31.2; skew-y: -31.2; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: -18.4; y: 107.2; skew-x: -46.2; skew-y: -46.2; }
        frame 91 { x: -10000; y: 114.1; skew-x: -56.8; skew-y: -56.8; scale-x: 0.717; scale-y: 0.717; }
        frame 92 { x: -17.7; y: 120.7; skew-x: -67.4; skew-y: -67.4; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -16.3; y: 127.1; skew-x: -78.1; skew-y: -78.1; }
        frame 94 { x: -14.4; y: 133; skew-x: -88.6; skew-y: -88.6; }
        frame 95 { x: -12.3; y: 134.4; skew-x: -103; skew-y: -103; scale-x: 0.716; scale-y: 0.716; }
        frame 96 { x: -9.5; y: 134.8; skew-x: -117.7; skew-y: -117.7; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: -16.8; y: 128.1; skew-x: -96.2; skew-y: -96.2; scale-x: 0.715; scale-y: 0.715; }
        frame 98 { x: -22.1; y: 119.2; skew-x: -74.8; skew-y: -74.8; scale-x: 0.714; scale-y: 0.714; }
        frame 99 { x: -24.7; y: 108.9; skew-x: -53.3; skew-y: -53.3; scale-x: 0.713; scale-y: 0.713; }
        frame 100 { x: -24.6; y: 98.1; skew-x: -31.7; skew-y: -31.7; scale-x: 0.714; scale-y: 0.714; }
        frame 101 { x: -25; y: 103.5; skew-x: -42.5; skew-y: -42.5; scale-x: 0.712; scale-y: 0.712; }
        frame 102 { x: -24.7; y: 108.9; skew-x: -53.3; skew-y: -53.3; scale-x: 0.713; scale-y: 0.713; }
        frame 103 { x: -25; y: 103.6; skew-x: -42.5; skew-y: -42.5; scale-x: 0.712; scale-y: 0.712; }
        frame 104 { x: -24.6; y: 98.1; skew-x: -31.7; skew-y: -31.7; scale-x: 0.714; scale-y: 0.714; }
    }
    Track {
        source-name: "Zombie_yeti_body";
        frame-count: 105;
        frame 0 { x: 5.3; y: 11.7; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_BODY; }
        frame 1 { x: -10000; y: 12; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 12.3; }
        frame 3 { y: 12.6; }
        frame 4 { y: 12.8; }
        frame 5 { y: 13.1; }
        frame 6 { y: 13.4; }
        frame 7 { x: 5; y: 13.2; scale-x: 0.725; scale-y: 0.726; }
        frame 8 { x: 4.8; y: 13; scale-x: 0.73; scale-y: 0.733; }
        frame 9 { x: -10000; y: 12.8; scale-x: 0.728; scale-y: 0.731; }
        frame 10 { x: 5; y: 12.5; scale-x: 0.727; scale-y: 0.728; }
        frame 11 { y: 12.4; scale-x: 0.725; scale-y: 0.726; }
        frame 12 { x: 5.1; y: 12.2; scale-x: 0.723; scale-y: 0.724; }
        frame 13 { x: 5.2; y: 11.9; scale-x: 0.722; scale-y: 0.722; }
        frame 14 { x: 5.3; y: 11.7; scale-x: 0.72; scale-y: 0.72; }
        frame 15 { x: 17; y: 5.4; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 10.3; y: 8.5; skew-x: 5.8; skew-y: 5.8; scale-x: 0.719; scale-y: 0.719; }
        frame 17 { x: 3.7; y: 11.6; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -2.4; y: 14.9; skew-x: -0.9; skew-y: -0.9; }
        frame 19 { x: -8.6; y: 18.5; skew-x: -4.4; skew-y: -4.4; }
        frame 20 { x: -14.7; y: 22.2; skew-x: -7.9; skew-y: -7.9; }
        frame 21 { x: -20.8; y: 26; skew-x: -11.4; skew-y: -11.4; }
        frame 22 { x: -19; y: 25.2; skew-x: -10.2; skew-y: -10.2; scale-x: 0.723; scale-y: 0.72; }
        frame 23 { x: -17.4; y: 24.6; skew-x: -9.2; skew-y: -9.2; scale-x: 0.728; scale-y: 0.723; }
        frame 24 { x: -15.7; y: 22.3; skew-x: -7.9; skew-y: -7.9; scale-x: 0.732; scale-y: 0.725; }
        frame 25 { x: -14.1; y: 20; skew-x: -6.9; skew-y: -6.9; scale-x: 0.737; scale-y: 0.727; }
        frame 26 { x: -9.9; y: 17; skew-x: -4.7; skew-y: -4.7; scale-x: 0.734; scale-y: 0.726; }
        frame 27 { x: -5.6; y: 14; skew-x: -2.2; skew-y: -2.2; scale-x: 0.731; scale-y: 0.724; }
        frame 28 { x: -1.3; y: 11.1; skew-x: -0; skew-y: -0; scale-x: 0.728; scale-y: 0.723; }
        frame 29 { x: 2.6; y: 8.5; skew-x: 2; skew-y: 2; scale-x: 0.724; scale-y: 0.721; }
        frame 30 { x: 7; y: 5.8; skew-x: 4.3; skew-y: 4.3; scale-x: 0.721; scale-y: 0.719; }
        frame 31 { x: 11.5; y: 3.2; skew-x: 6.5; skew-y: 6.5; scale-x: 0.718; scale-y: 0.718; }
        frame 32 { x: 7.1; y: 6.2; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 2.8; y: 9.2; skew-x: 0.5; skew-y: 0.5; }
        frame 34 { x: -1.2; y: 12.4; skew-x: -2.4; skew-y: -2.4; }
        frame 35 { x: -5.3; y: 15.8; skew-x: -5.4; skew-y: -5.4; }
        frame 36 { x: -9.2; y: 19.3; skew-x: -8.4; skew-y: -8.4; }
        frame 37 { x: -13.1; y: 22.8; skew-x: -11.4; skew-y: -11.4; scale-x: 0.719; scale-y: 0.719; }
        frame 38 { x: -15.1; y: 22.4; skew-x: -10.2; skew-y: -10.2; scale-x: 0.724; scale-y: 0.721; }
        frame 39 { x: -17.4; y: 22; skew-x: -8.9; skew-y: -8.9; scale-x: 0.729; scale-y: 0.724; }
        frame 40 { x: -15.6; y: 20.1; skew-x: -7.7; skew-y: -7.7; scale-x: 0.735; scale-y: 0.727; }
        frame 41 { x: -14; y: 18.4; skew-x: -6.7; skew-y: -6.7; scale-x: 0.741; scale-y: 0.73; }
        frame 42 { x: -9.6; y: 16.2; skew-x: -4.2; skew-y: -4.2; scale-x: 0.738; scale-y: 0.728; }
        frame 43 { x: -5.3; y: 14.2; skew-x: -1.9; skew-y: -1.9; scale-x: 0.735; scale-y: 0.727; }
        frame 44 { x: -1.1; y: 12.3; skew-x: 0; skew-y: 0; scale-x: 0.732; scale-y: 0.725; }
        frame 45 { x: 3.2; y: 10.5; skew-x: 2.3; skew-y: 2.3; scale-x: 0.729; scale-y: 0.724; }
        frame 46 { x: 7.7; y: 8.7; skew-x: 4.6; skew-y: 4.6; scale-x: 0.725; scale-y: 0.722; }
        frame 47 { x: 12.4; y: 7; skew-x: 7; skew-y: 7; scale-x: 0.722; scale-y: 0.721; }
        frame 48 { x: 17; y: 5.4; skew-x: 9.3; skew-y: 9.3; scale-x: 0.72; scale-y: 0.72; }
        frame 49 { x: 5.3; y: 11.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 7.5; y: 10.8; skew-x: 2.3; skew-y: 2.3; }
        frame 51 { x: 9.8; y: 10; skew-x: 4.8; skew-y: 4.8; }
        frame 52 { x: 12.3; y: 9.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.719; scale-y: 0.719; }
        frame 53 { x: 14.8; y: 8.4; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 17.4; y: 7.8; skew-x: 12.3; skew-y: 12.3; }
        frame 55 { x: 20.1; y: 7.3; skew-x: 14.9; skew-y: 14.9; }
        frame 56 { x: 7; y: 13.2; skew-x: 6.3; skew-y: 6.3; }
        frame 57 { x: -5; y: 20.2; skew-x: -2.2; skew-y: -2.2; }
        frame 58 { x: -16.4; y: 28.3; skew-x: -10.8; skew-y: -10.8; scale-x: 0.718; scale-y: 0.718; }
        frame 59 { x: -16.6; y: 29.1; skew-x: -10.7; skew-y: -10.7; scale-x: 0.723; scale-y: 0.723; }
        frame 60 { x: -16.9; y: 30.1; skew-x: -10.8; skew-y: -10.8; scale-x: 0.728; scale-y: 0.727; }
        frame 61 { x: -12.6; y: 26.6; skew-x: -7.4; skew-y: -7.5; scale-x: 0.727; scale-y: 0.726; }
        frame 62 { x: -8.1; y: 23.4; skew-x: -4.2; skew-y: -4.2; scale-x: 0.726; scale-y: 0.725; }
        frame 63 { x: -3.7; y: 20.2; skew-x: -1; skew-y: -1; scale-x: 0.725; scale-y: 0.724; }
        frame 64 { x: 0.7; y: 17.4; skew-x: 2; skew-y: 2; scale-x: 0.724; scale-y: 0.723; }
        frame 65 { x: 5.3; y: 14.8; skew-x: 5.1; skew-y: 5.1; scale-x: 0.723; scale-y: 0.722; }
        frame 66 { x: 10.1; y: 12.1; skew-x: 8.3; skew-y: 8.3; scale-x: 0.721; scale-y: 0.721; }
        frame 67 { x: 15; y: 9.7; skew-x: 11.6; skew-y: 11.6; scale-x: 0.72; scale-y: 0.72; }
        frame 68 { x: 20.1; y: 7.3; skew-x: 14.9; skew-y: 14.9; scale-x: 0.719; scale-y: 0.719; }
        frame 69 { x: 6.9; y: 13.3; skew-x: 6.3; skew-y: 6.3; scale-x: 0.722; scale-y: 0.722; }
        frame 70 { x: -5.3; y: 20.5; skew-x: -2.2; skew-y: -2.2; scale-x: 0.725; scale-y: 0.725; }
        frame 71 { x: -16.9; y: 28.9; skew-x: -10.8; skew-y: -10.8; scale-x: 0.728; scale-y: 0.727; }
        frame 72 { x: -16.7; y: 29.6; skew-x: -10.7; skew-y: -10.7; scale-x: -10000; scale-y: 0.733; }
        frame 73 { x: -16.9; y: 30.4; skew-x: -10.8; skew-y: -10.8; scale-y: 0.74; }
        frame 74 { x: -11.3; y: 25.4; skew-x: -8; skew-y: -8; scale-x: 0.726; scale-y: 0.735; }
        frame 75 { x: -5.7; y: 20.7; skew-x: -5.2; skew-y: -5.2; scale-x: 0.724; scale-y: 0.73; }
        frame 76 { x: -0.1; y: 16.1; skew-x: -2.5; skew-y: -2.5; scale-x: 0.722; scale-y: 0.725; }
        frame 77 { x: 5.3; y: 11.7; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 8.1; y: 10.9; skew-x: 1.8; skew-y: 1.8; }
        frame 80 { x: 11; y: 10; skew-x: 3.8; skew-y: 3.8; }
        frame 81 { x: 13.7; y: 9.4; skew-x: 5.6; skew-y: 5.6; }
        frame 82 { x: 16.7; y: 8.7; skew-x: 7.5; skew-y: 7.5; scale-x: 0.719; scale-y: 0.719; }
        frame 83 { x: 19.8; y: 8; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 22.7; y: 7.5; skew-x: 11.3; skew-y: 11.3; }
        frame 85 { x: 25.9; y: 6.9; skew-x: 13.3; skew-y: 13.3; }
        frame 86 { x: 29; y: 6.5; skew-x: 15.3; skew-y: 15.3; }
        frame 87 { x: 4.6; y: 15.5; skew-x: 3; skew-y: 3; }
        frame 88 { x: -17.9; y: 26.9; skew-x: -9.2; skew-y: -9.2; scale-x: 0.718; scale-y: 0.718; }
        frame 89 { x: -43.4; y: 45.5; skew-x: -27; skew-y: -27; scale-x: 0.717; scale-y: 0.717; }
        frame 90 { x: -63.7; y: 66.7; skew-x: -44.8; skew-y: -44.8; scale-x: 0.718; scale-y: 0.718; }
        frame 91 { x: -69.7; y: 78.7; skew-x: -51.3; skew-y: -51.3; scale-x: 0.717; scale-y: 0.717; }
        frame 92 { x: -75; y: 90.6; skew-x: -57.8; skew-y: -57.8; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -79.6; y: 102.3; skew-x: -64.3; skew-y: -64.3; }
        frame 94 { x: -83.3; y: 114.1; skew-x: -70.9; skew-y: -70.9; }
        frame 95 { x: -83; y: 132.5; skew-x: -85.6; skew-y: -85.6; }
        frame 96 { x: -79.7; y: 148.2; skew-x: -100; skew-y: -100; scale-x: 0.716; scale-y: 0.716; }
        frame 97 { x: -81.4; y: 149; skew-x: -99.9; skew-y: -99.9; scale-x: 0.692; scale-y: 0.741; }
        frame 98 { x: -83.2; y: 149.9; skew-x: -10000; skew-y: -10000; scale-x: 0.669; scale-y: 0.767; }
        frame 99 { x: -85.1; y: 150.6; scale-x: 0.645; scale-y: 0.792; }
        frame 100 { x: -86.8; y: 151.4; skew-x: -100; skew-y: -100; scale-x: 0.622; scale-y: 0.818; }
        frame 101 { x: -84.5; y: 150.7; skew-x: -99.9; skew-y: -99.9; scale-x: 0.641; scale-y: 0.785; }
        frame 102 { x: -82.3; y: 150.1; skew-x: -10000; skew-y: -10000; scale-x: 0.66; scale-y: 0.754; }
        frame 103 { x: -82.7; y: 150.4; scale-x: 0.651; scale-y: 0.76; }
        frame 104 { x: -83.1; y: 150.8; skew-x: -100; skew-y: -100; scale-x: 0.642; scale-y: 0.767; }
    }
    Track {
        source-name: "Zombie_yeti_outerleg_foot";
        frame-count: 105;
        frame 0 { x: 32.1; y: 123.8; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_OUTERLEG_FOOT; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 15 { x: 2.4; y: 90; skew-x: 54.6; skew-y: 54.6; scale-x: 0.716; scale-y: 0.716; }
        frame 16 { x: 2.1; y: 94.3; skew-x: 45.9; skew-y: 45.9; scale-x: 0.715; scale-y: 0.715; }
        frame 17 { x: 2.3; y: 99.3; skew-x: 37.1; skew-y: 37.1; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 2.6; y: 104.7; skew-x: 28.3; skew-y: 28.3; }
        frame 19 { x: 3.2; y: 110.6; skew-x: 19.6; skew-y: 19.6; }
        frame 20 { x: 4.3; y: 116.9; skew-x: 10.8; skew-y: 10.8; }
        frame 21 { x: 5.9; y: 123.5; skew-x: 2.2; skew-y: 2.2; scale-x: 0.716; scale-y: 0.716; }
        frame 22 { x: 9.3; y: 123.8; skew-x: 1.3; skew-y: 1.3; scale-x: 0.715; scale-y: 0.715; }
        frame 23 { x: 12.7; y: 124; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 16.1; y: 124.3; skew-x: 0; skew-y: 0; }
        frame 25 { x: 19.5; y: 124.4; skew-x: -0.4; skew-y: -0.4; }
        frame 26 { x: 22.9; y: 124.7; skew-x: -1.2; skew-y: -1.2; }
        frame 27 { x: 26.3; y: 125; skew-x: -1.9; skew-y: -1.9; }
        frame 28 { x: 29.7; y: 125.2; skew-x: -2.7; skew-y: -2.7; }
        frame 29 { x: 33; y: 125.3; skew-x: -3.2; skew-y: -3.2; }
        frame 30 { x: 36.5; y: 125.6; skew-x: -3.9; skew-y: -3.9; }
        frame 31 { x: 39.8; y: 126; skew-x: -4.8; skew-y: -4.8; }
        frame 32 { x: 39.5; y: 127.1; skew-x: -11.4; skew-y: -11.4; scale-x: 0.714; scale-y: 0.714; }
        frame 33 { x: -10000; y: 128.3; skew-x: -18.2; skew-y: -18.2; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 39.8; y: 129.6; skew-x: -25; skew-y: -25; scale-x: 0.713; scale-y: 0.713; }
        frame 35 { x: 40.5; y: 130.8; skew-x: -31.8; skew-y: -31.8; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 41.5; y: 132; skew-x: -38.5; skew-y: -38.5; scale-x: 0.712; scale-y: 0.712; }
        frame 37 { x: 43; y: 133.2; skew-x: -45.4; skew-y: -45.4; scale-x: 0.713; scale-y: 0.713; }
        frame 38 { x: 35.1; y: 131; skew-x: -38.3; skew-y: -38.3; scale-x: 0.711; scale-y: 0.711; }
        frame 39 { x: 27.5; y: 128.8; skew-x: -31.3; skew-y: -31.3; scale-x: 0.712; scale-y: 0.712; }
        frame 40 { x: 24.2; y: 126.5; skew-x: -24.2; skew-y: -24.2; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 21.2; y: 124.2; skew-x: -17.2; skew-y: -17.2; scale-x: 0.713; scale-y: 0.713; }
        frame 42 { x: 18.6; y: 122.1; skew-x: -10.2; skew-y: -10.2; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 16.5; y: 120; skew-x: -3.4; skew-y: -3.4; scale-x: 0.714; scale-y: 0.714; }
        frame 44 { x: 13.7; y: 115.3; skew-x: 6.8; skew-y: 6.8; scale-x: 0.715; scale-y: 0.715; }
        frame 45 { x: 9.8; y: 107.7; skew-x: 18.6; skew-y: 18.6; scale-x: 0.714; scale-y: 0.714; }
        frame 46 { x: 6.8; y: 100.9; skew-x: 30.6; skew-y: 30.6; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 4.3; y: 94.9; skew-x: 42.6; skew-y: 42.6; scale-x: 0.715; scale-y: 0.715; }
        frame 48 { x: 2.4; y: 90; skew-x: 54.6; skew-y: 54.6; scale-x: 0.716; scale-y: 0.716; }
        frame 49 { x: 32.1; y: 123.8; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: 32; y: 124; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: -10000; y: 124.2; skew-x: -0.9; skew-y: -0.9; }
        frame 52 { x: 32; y: 124.3; skew-x: -1.4; skew-y: -1.4; }
        frame 53 { x: 31.9; y: 124.5; skew-x: -1.9; skew-y: -1.9; }
        frame 54 { x: 31.8; y: 124.7; skew-x: -2.4; skew-y: -2.4; }
        frame 55 { x: -10000; y: 124.8; skew-x: -2.9; skew-y: -2.9; }
        frame 56 { x: 31.9; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 57 { x: -10000; }
        frame 58 { x: 31.8; }
        frame 59 { x: 31.9; }
        frame 60 { x: 31.8; }
        frame 61 { x: 31.9; }
        frame 62 { x: -10000; }
        frame 68 { x: 31.8; }
        frame 69 { x: 31.9; }
        frame 70 { x: -10000; }
        frame 71 { x: 31.8; }
        frame 72 { x: 31.9; }
        frame 73 { x: 31.8; }
        frame 74 { x: 31.9; y: 124.6; skew-x: -2.2; skew-y: -2.2; }
        frame 75 { x: 32; y: 124.3; skew-x: -1.4; skew-y: -1.4; }
        frame 76 { y: 124; skew-x: -0.7; skew-y: -0.7; }
        frame 77 { x: 32.1; y: 123.8; skew-x: 0; skew-y: 0; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 87 { x: 31.4; y: 124.9; skew-x: -4; skew-y: -4; }
        frame 88 { x: 30.9; y: 126.1; skew-x: -8.2; skew-y: -8.2; scale-x: 0.719; scale-y: 0.719; }
        frame 89 { x: 30.4; y: 127.4; skew-x: -12.4; skew-y: -12.4; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 30.1; y: 128.6; skew-x: -16.7; skew-y: -16.7; }
        frame 91 { x: 29.6; y: 127.1; skew-x: -39; skew-y: -39; scale-x: 0.717; scale-y: 0.717; }
        frame 92 { x: 32.9; y: 124.6; skew-x: -61.6; skew-y: -61.6; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 39.1; y: 119.7; skew-x: -83.9; skew-y: -83.9; }
        frame 94 { x: 47.4; y: 111.3; skew-x: -106.2; skew-y: -106.2; scale-x: 0.716; scale-y: 0.716; }
        frame 95 { x: 41; y: 98.6; skew-x: -126.5; skew-y: -126.5; scale-x: 0.714; scale-y: 0.714; }
        frame 96 { x: 33.8; y: 82.7; skew-x: -146.8; skew-y: -146.8; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 28.5; y: 107.8; skew-x: -123.3; skew-y: -123.3; scale-x: 0.711; scale-y: 0.711; }
        frame 98 { x: 22.7; y: 128.7; skew-x: -99.9; skew-y: -99.9; scale-x: 0.71; scale-y: 0.71; }
        frame 99 { x: 18.2; y: 145.6; skew-x: -96.9; skew-y: -96.9; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: 13.6; y: 162.4; skew-x: -94.2; skew-y: -94.2; }
        frame 101 { x: 14.4; y: 154.9; skew-x: -97.9; skew-y: -97.9; }
        frame 102 { x: 15.3; y: 147.4; skew-x: -101.7; skew-y: -101.7; }
        frame 103 { x: 14.4; y: 154.9; skew-x: -97.9; skew-y: -97.9; }
        frame 104 { x: 13.6; y: 162.4; skew-x: -94.2; skew-y: -94.2; }
    }
    Track {
        source-name: "Zombie_yeti_outerleg_lower";
        frame-count: 105;
        frame 0 { x: 44.1; y: 94.7; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_OUTERLEG_LOWER; }
        frame 1 { x: 43.3; y: -10000; skew-y: -1.2; scale-x: -10000; scale-y: 0.721; image: none; }
        frame 2 { x: 42.5; skew-y: -2.4; scale-y: 0.722; }
        frame 3 { x: 41.6; skew-y: -3.7; scale-y: 0.723; }
        frame 4 { x: 40.9; skew-y: -4.9; scale-y: 0.724; }
        frame 5 { x: 40; y: 94.6; skew-y: -6.2; scale-y: 0.725; }
        frame 6 { x: 39.1; y: 94.7; skew-y: -7.7; scale-y: 0.727; }
        frame 7 { x: 39.8; y: -10000; skew-y: -6.7; scale-y: 0.726; }
        frame 8 { x: 40.2; skew-y: -5.9; scale-y: 0.725; }
        frame 9 { x: 40.9; skew-y: -4.9; scale-y: 0.724; }
        frame 10 { x: 41.5; y: 94.6; skew-y: -3.9; scale-y: 0.723; }
        frame 11 { x: 42.1; y: 94.7; skew-y: -2.9; scale-y: 0.722; }
        frame 12 { x: 42.8; y: 94.6; skew-y: -1.9; scale-y: -10000; }
        frame 13 { x: 43.5; y: -10000; skew-y: -0.9; scale-y: 0.721; }
        frame 14 { x: 44.1; y: 94.7; skew-y: 0; scale-y: 0.72; }
        frame 15 { x: 30.7; y: 81.1; skew-x: 50.5; skew-y: 50.5; scale-x: 0.716; scale-y: 0.716; }
        frame 16 { x: 27.9; y: 81.5; skew-x: 42.1; skew-y: 41.1; scale-x: -10000; scale-y: 0.723; }
        frame 17 { x: 25.1; y: 82.5; skew-x: 33.4; skew-y: 31.6; scale-y: 0.732; }
        frame 18 { x: 22.3; y: 84.2; skew-x: 24.8; skew-y: 22.1; scale-x: 0.717; scale-y: 0.74; }
        frame 19 { x: 19.5; y: 86.7; skew-x: 16.3; skew-y: 12.6; scale-x: 0.718; scale-y: 0.749; }
        frame 20 { x: 17; y: 89.7; skew-x: 7.8; skew-y: 3.1; scale-x: -10000; scale-y: 0.757; }
        frame 21 { x: 14.9; y: 93.3; skew-x: -0.5; skew-y: -6.1; scale-x: 0.719; scale-y: 0.766; }
        frame 22 { x: 17.8; y: 94.2; skew-x: -1.9; skew-y: -6.9; scale-x: -10000; scale-y: 0.76; }
        frame 23 { x: 20.6; y: 95.1; skew-x: -3.4; skew-y: -7.9; scale-x: 0.718; scale-y: 0.755; }
        frame 24 { x: 23.5; y: 95.9; skew-x: -4.9; skew-y: -8.9; scale-x: -10000; scale-y: 0.75; }
        frame 25 { x: 26.4; y: 96.8; skew-x: -6.4; skew-y: -9.9; scale-x: 0.717; scale-y: 0.745; }
        frame 26 { x: 29.5; y: 97.6; skew-x: -7.9; skew-y: -10.7; scale-x: -10000; scale-y: 0.74; }
        frame 27 { x: 32.4; y: 98.5; skew-x: -9.5; skew-y: -11.7; scale-x: 0.716; scale-y: 0.735; }
        frame 28 { x: 35.3; y: 99.5; skew-x: -11; skew-y: -12.7; scale-x: -10000; scale-y: 0.73; }
        frame 29 { x: 38.3; y: 100.3; skew-x: -12.7; skew-y: -13.7; scale-x: 0.715; scale-y: 0.725; }
        frame 30 { x: 41.3; y: 101.2; skew-x: -14.2; skew-y: -14.7; scale-x: -10000; scale-y: 0.72; }
        frame 31 { x: 44.3; y: 102.2; skew-x: -15.8; skew-y: -15.8; scale-y: 0.715; }
        frame 32 { x: 41.5; y: 101.7; skew-x: -18.5; skew-y: -20.4; scale-x: 0.716; scale-y: 0.714; }
        frame 33 { x: 38.8; y: 101.3; skew-x: -21.5; skew-y: -25.2; scale-x: 0.718; scale-y: 0.713; }
        frame 34 { x: 36.1; y: 101.1; skew-x: -24.2; skew-y: -30; scale-x: 0.72; scale-y: -10000; }
        frame 35 { x: 33.6; y: -10000; skew-x: -27.2; skew-y: -34.7; scale-x: 0.722; scale-y: 0.712; }
        frame 36 { x: 31.3; y: 101; skew-x: -30; skew-y: -39.5; scale-x: 0.724; scale-y: -10000; }
        frame 37 { x: 29.1; y: -10000; skew-x: -33; skew-y: -44.1; scale-x: 0.726; scale-y: 0.713; }
        frame 38 { x: 25.1; y: 98.2; skew-x: -27.2; skew-y: -37.5; scale-x: 0.724; scale-y: 0.72; }
        frame 39 { x: 21.4; y: 95.5; skew-x: -21.4; skew-y: -30.7; scale-x: -10000; scale-y: 0.73; }
        frame 40 { x: 22; y: 92.9; skew-x: -15.7; skew-y: -24; scale-x: 0.723; scale-y: 0.738; }
        frame 41 { x: 23; y: 90.5; skew-x: -9.7; skew-y: -17.2; scale-x: 0.722; scale-y: 0.747; }
        frame 42 { x: 24.2; y: 88.3; skew-x: -3.9; skew-y: -10.7; scale-x: -10000; scale-y: 0.757; }
        frame 43 { x: 25.8; y: 86.5; skew-x: 1.5; skew-y: -3.9; scale-x: 0.721; scale-y: 0.766; }
        frame 44 { x: 27.7; y: 84.9; skew-x: 7.4; skew-y: 2.6; scale-x: -10000; scale-y: 0.775; }
        frame 45 { x: 28.2; y: 82.3; skew-x: 18.1; skew-y: 14.5; scale-x: 0.719; scale-y: 0.76; }
        frame 46 { x: 29; y: 80.8; skew-x: 28.8; skew-y: 26.6; scale-x: 0.718; scale-y: 0.745; }
        frame 47 { x: 30; y: 80.5; skew-x: 39.6; skew-y: 38.6; scale-x: 0.716; scale-y: 0.73; }
        frame 48 { x: 30.7; y: 81.1; skew-x: 50.5; skew-y: 50.5; scale-x: -10000; scale-y: 0.716; }
        frame 49 { x: 44.1; y: 94.7; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: 42.5; y: 95.7; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 41; y: 96.7; skew-x: -5.2; skew-y: -5.2; }
        frame 52 { x: 39.5; y: 97.7; skew-x: -7.9; skew-y: -7.9; scale-x: 0.719; scale-y: 0.719; }
        frame 53 { x: 37.9; y: 98.8; skew-x: -10.7; skew-y: -10.7; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 36.5; y: 99.8; skew-x: -13.2; skew-y: -13.2; }
        frame 55 { x: 35; y: 101.2; skew-x: -16.1; skew-y: -16.1; }
        frame 56 { x: 31.5; y: 102.6; skew-x: -17.5; skew-y: -21; scale-x: 0.722; scale-y: 0.718; }
        frame 57 { x: 27.9; y: 104; skew-x: -19; skew-y: -26.2; scale-x: 0.726; scale-y: -10000; }
        frame 58 { x: 24.3; y: 105.8; skew-x: -20.7; skew-y: -31.3; scale-x: 0.731; }
        frame 59 { x: 22; y: 106.4; skew-x: -18.5; skew-y: -34.5; scale-x: 0.75; scale-y: 0.717; }
        frame 60 { x: 19.7; y: 107.1; skew-x: -16.4; skew-y: -37.8; scale-x: 0.771; scale-y: 0.718; }
        frame 61 { x: 21.7; y: 106.3; skew-x: -16.2; skew-y: -35; scale-x: 0.764; scale-y: 0.717; }
        frame 62 { x: 23.5; y: 105.4; skew-x: -10000; skew-y: -32.3; scale-x: 0.758; scale-y: -10000; }
        frame 63 { x: 25.3; y: 104.6; skew-y: -29.7; scale-x: 0.751; }
        frame 64 { x: 27.2; y: 103.9; skew-y: -26.9; scale-x: 0.745; scale-y: 0.718; }
        frame 65 { x: 29.2; y: 103.2; skew-y: -24.2; scale-x: 0.738; scale-y: -10000; }
        frame 66 { x: 31.1; y: 102.5; skew-x: -16; skew-y: -21.4; scale-x: 0.732; }
        frame 67 { x: 33.1; y: 101.8; skew-x: -10000; skew-y: -18.7; scale-x: 0.725; }
        frame 68 { x: 35; y: 101.2; skew-x: -16.1; skew-y: -16.1; scale-x: 0.719; scale-y: 0.719; }
        frame 69 { x: 30.6; y: 102.6; skew-x: -17.2; skew-y: -22; scale-x: 0.727; scale-y: 0.718; }
        frame 70 { x: 26.1; y: 104.2; skew-x: -18.2; skew-y: -28.2; scale-x: 0.734; scale-y: -10000; }
        frame 71 { x: 21.9; y: 106.2; skew-x: -19.4; skew-y: -34.3; scale-x: 0.743; }
        frame 72 { x: 19.4; y: 107.3; skew-x: -17.7; skew-y: -37.8; scale-x: 0.767; scale-y: 0.717; }
        frame 73 { x: 16.9; y: 108.5; skew-x: -16.2; skew-y: -41.3; scale-x: 0.793; scale-y: 0.718; }
        frame 74 { x: 23; y: 104; skew-x: -12; skew-y: -31; scale-x: 0.774; scale-y: 0.717; }
        frame 75 { x: 29.9; y: 100.3; skew-x: -7.9; skew-y: -20.5; scale-x: 0.756; scale-y: 0.718; }
        frame 76 { x: 36.8; y: 97.1; skew-x: -3.9; skew-y: -10.2; scale-x: 0.738; scale-y: 0.719; }
        frame 77 { x: 44.1; y: 94.7; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 43.7; skew-y: -0.7; scale-y: 0.721; }
        frame 80 { x: 43.2; y: 94.6; skew-y: -1.7; scale-y: -10000; }
        frame 81 { x: 42.8; y: 94.7; skew-y: -2.7; scale-y: 0.722; }
        frame 82 { x: 42.3; y: 94.6; skew-y: -3.5; scale-y: 0.723; }
        frame 83 { x: 41.9; y: 94.7; skew-y: -4.4; scale-y: 0.724; }
        frame 84 { x: 41.4; y: -10000; skew-y: -5.4; scale-y: -10000; }
        frame 85 { x: 40.9; skew-y: -6.4; scale-y: 0.725; }
        frame 86 { x: 40.4; skew-y: -7.4; scale-y: 0.726; }
        frame 87 { x: 36.3; y: 96; skew-x: -6.2; skew-y: -11.4; scale-x: 0.719; scale-y: 0.724; }
        frame 88 { x: 32.6; y: 97.5; skew-x: -12.7; skew-y: -15.7; scale-x: -10000; scale-y: 0.722; }
        frame 89 { x: 29.1; y: 98.9; skew-x: -19; skew-y: -19.9; scale-x: 0.718; scale-y: 0.72; }
        frame 90 { x: 26; y: 100.4; skew-x: -25.5; skew-y: -24.1; scale-x: 0.719; scale-y: 0.719; }
        frame 91 { x: 18.4; y: 105.8; skew-x: -47.8; skew-y: -46.5; scale-x: 0.717; scale-y: 0.717; }
        frame 92 { x: 15.2; y: 111.2; skew-x: -70.3; skew-y: -68.9; scale-x: 0.716; scale-y: 0.716; }
        frame 93 { x: 15.7; y: 114.7; skew-x: -92.4; skew-y: -91.2; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 19.3; y: 115.2; skew-x: -115; skew-y: -113.6; scale-x: 0.715; }
        frame 95 { x: 17.1; y: 111.3; skew-x: -135.3; skew-y: -133.8; scale-x: 0.713; scale-y: 0.714; }
        frame 96 { x: 15; y: 103.9; skew-x: -155.6; skew-y: -154.2; scale-x: 0.714; scale-y: -10000; }
        frame 97 { x: 2; y: 117.7; skew-x: -125.3; skew-y: -128; scale-x: 0.718; scale-y: 0.711; }
        frame 98 { x: -10.5; y: 124.7; skew-x: -95.1; skew-y: -101.9; scale-x: 0.723; scale-y: -10000; }
        frame 99 { x: -18.4; y: 131.8; skew-x: -79.3; skew-y: -89.9; scale-x: 0.729; }
        frame 100 { x: -25.5; y: 137.5; skew-x: -63.3; skew-y: -78.3; scale-x: 0.736; }
        frame 101 { x: -22.6; y: 136.1; skew-x: -72.1; skew-y: -85.1; scale-x: 0.732; }
        frame 102 { x: -19.4; y: 134.2; skew-x: -80.8; skew-y: -91.6; scale-x: 0.73; }
        frame 103 { x: -22.6; y: 136.1; skew-x: -72.1; skew-y: -85.1; scale-x: 0.732; }
        frame 104 { x: -25.5; y: 137.5; skew-x: -63.3; skew-y: -78.3; scale-x: 0.736; }
    }
    Track {
        source-name: "Zombie_yeti_outerleg_upper";
        frame-count: 105;
        frame 0 { x: 34.9; y: 76.1; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_OUTERLEG_UPPER; }
        frame 1 { x: 35; y: 76; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 35.2; y: 75.6; skew-x: 1.8; skew-y: 1.8; }
        frame 3 { x: 35.4; y: 75.5; skew-x: 2.5; skew-y: 2.5; }
        frame 4 { x: 35.5; y: 75.3; skew-x: 3.5; skew-y: 3.5; }
        frame 5 { x: 35.6; y: 75; skew-x: 4.3; skew-y: 4.3; }
        frame 6 { x: 36; y: 74.8; skew-x: 5.3; skew-y: 5.3; }
        frame 7 { x: 35.8; y: 75; skew-x: 4.5; skew-y: 4.5; }
        frame 8 { x: 35.6; y: 75.2; skew-x: 4; skew-y: 4; }
        frame 9 { x: 35.5; y: 75.4; skew-x: 3.3; skew-y: 3.3; }
        frame 10 { x: 35.3; y: 75.6; skew-x: 2.5; skew-y: 2.5; }
        frame 11 { x: 35.2; y: 75.7; skew-x: 2; skew-y: 2; }
        frame 12 { x: 35; y: 75.9; skew-x: 1.3; skew-y: 1.3; }
        frame 13 { x: 34.9; y: 76; skew-x: 0.5; skew-y: 0.5; }
        frame 14 { x: -10000; y: 76.1; skew-x: 0; skew-y: 0; }
        frame 15 { x: 53.3; y: 66.7; skew-x: 66.1; skew-y: 66.1; scale-x: 0.717; scale-y: 0.788; }
        frame 16 { x: 49.2; y: 67.6; skew-x: 58.9; skew-y: 60.7; scale-x: 0.718; scale-y: 0.775; }
        frame 17 { x: 45; y: 69; skew-x: 51.6; skew-y: 55.4; scale-x: 0.721; scale-y: 0.763; }
        frame 18 { x: 41.1; y: 70.8; skew-x: 44.4; skew-y: 50.1; scale-x: 0.723; scale-y: 0.751; }
        frame 19 { x: 37.3; y: 73; skew-x: 37.1; skew-y: 44.6; scale-x: 0.725; scale-y: 0.739; }
        frame 20 { x: 33.5; y: 75.5; skew-x: 29.9; skew-y: 39.3; scale-x: 0.727; scale-y: 0.727; }
        frame 21 { x: 30.1; y: 78.5; skew-x: 22.8; skew-y: 34; scale-x: 0.73; scale-y: 0.716; }
        frame 22 { x: 30.8; y: 78; skew-x: 21.5; skew-y: 31.6; scale-x: 0.728; scale-y: 0.723; }
        frame 23 { x: 31.6; y: 77.3; skew-x: 20.3; skew-y: 29.4; scale-x: 0.726; scale-y: 0.731; }
        frame 24 { x: 31.5; y: 76.8; skew-x: 16.8; skew-y: 24.6; scale-x: 0.724; scale-y: 0.739; }
        frame 25 { x: 31.6; y: 76.3; skew-x: 13.3; skew-y: 20.1; scale-x: 0.723; scale-y: 0.747; }
        frame 26 { x: 31.4; y: 76.1; skew-x: 9.8; skew-y: 15.5; scale-x: 0.722; scale-y: 0.755; }
        frame 27 { x: 31.3; y: 75.8; skew-x: 6.3; skew-y: 10.8; scale-x: 0.721; scale-y: 0.763; }
        frame 28 { x: -10000; y: -10000; skew-x: 2.8; skew-y: 6.3; scale-x: 0.719; scale-y: 0.772; }
        frame 29 { x: 31.2; y: 76; skew-x: -0.4; skew-y: 1.5; scale-x: 0.718; scale-y: 0.78; }
        frame 30 { x: 31.3; y: 76.1; skew-x: -3.9; skew-y: -2.7; scale-x: 0.717; scale-y: 0.788; }
        frame 31 { x: -10000; y: 76.5; skew-x: -7.5; skew-y: -7.5; scale-x: 0.715; scale-y: 0.797; }
        frame 32 { x: 31.4; y: 75; skew-x: -5.4; skew-y: -5.4; scale-x: -10000; scale-y: 0.796; }
        frame 33 { x: -10000; y: 73.6; skew-x: -3.5; skew-y: -3.5; scale-y: -10000; }
        frame 34 { x: 31.5; y: 72.3; skew-x: -1.7; skew-y: -1.7; }
        frame 35 { x: 31.6; y: 71; skew-x: 0; skew-y: 0; }
        frame 36 { x: 31.8; y: 69.7; skew-x: 2; skew-y: 2; scale-x: 0.714; }
        frame 37 { x: 32; y: 68.3; skew-x: 4; skew-y: 4; scale-x: -10000; }
        frame 38 { x: 30.3; y: 67.3; skew-x: 8.3; skew-y: 8.3; scale-y: 0.788; }
        frame 39 { x: 28.9; y: 66.6; skew-x: 12.8; skew-y: 12.8; scale-y: 0.781; }
        frame 40 { x: 31.3; y: 65.4; skew-x: 18.6; skew-y: 18.6; scale-y: -10000; }
        frame 41 { x: 34; y: 64.4; skew-x: 24.6; skew-y: 24.6; }
        frame 42 { x: 36.7; y: 63.8; skew-x: 30.6; skew-y: 30.6; scale-y: 0.782; }
        frame 43 { x: 39.5; y: 63.5; skew-x: 36.4; skew-y: 36.4; scale-x: 0.715; scale-y: 0.783; }
        frame 44 { x: 42.3; y: -10000; skew-x: 42.4; skew-y: 42.4; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 45.3; y: 63.8; skew-x: 48.4; skew-y: 48.4; scale-y: 0.784; }
        frame 46 { x: 47.9; y: 64.5; skew-x: 54.2; skew-y: 54.2; scale-x: 0.716; scale-y: 0.785; }
        frame 47 { x: 50.7; y: 65.5; skew-x: 60.2; skew-y: 60.2; scale-x: -10000; scale-y: 0.786; }
        frame 48 { x: 53.3; y: 66.7; skew-x: 66.1; skew-y: 66.1; scale-x: 0.717; scale-y: 0.788; }
        frame 49 { x: 34.9; y: 76.1; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: 34.6; y: 76; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 34.4; y: 75.8; skew-x: 3; skew-y: 3; }
        frame 52 { x: 34.1; y: 75.7; skew-x: 4.5; skew-y: 4.5; }
        frame 53 { x: 34; y: 75.5; skew-x: 6.3; skew-y: 6.3; scale-x: 0.719; scale-y: 0.719; }
        frame 54 { x: 33.8; y: -10000; skew-x: 7.8; skew-y: 7.8; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 33.7; y: 75.3; skew-x: 9.4; skew-y: 9.4; scale-x: 0.72; scale-y: 0.72; }
        frame 56 { x: 31.6; y: 76.1; skew-x: 8.8; skew-y: 8.8; scale-x: 0.719; scale-y: 0.719; }
        frame 57 { x: 29.5; y: 76.8; skew-x: 8.1; skew-y: 8.1; scale-x: 0.718; scale-y: 0.718; }
        frame 58 { x: 27.5; y: 77.6; skew-x: 7.6; skew-y: 7.6; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 28; y: 78.2; skew-x: 9.5; skew-y: 9.5; scale-x: 0.717; scale-y: 0.717; }
        frame 60 { x: 28.6; y: 78.7; skew-x: 11.4; skew-y: 11.4; scale-x: 0.718; scale-y: 0.718; }
        frame 61 { x: 29.2; y: 78.3; skew-x: 11; skew-y: 11; scale-x: 0.717; scale-y: 0.717; }
        frame 62 { x: 29.8; y: 78; skew-x: 10.8; skew-y: 10.8; scale-x: 0.718; scale-y: 0.718; }
        frame 63 { x: 30.4; y: 77.5; skew-x: 10.5; skew-y: 10.5; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 31.1; y: 77.1; skew-x: 10.3; skew-y: 10.3; }
        frame 65 { x: 31.8; y: 76.7; skew-x: 10; skew-y: 10; }
        frame 66 { x: 32.4; y: 76.2; skew-x: 9.8; skew-y: 9.8; scale-x: 0.719; scale-y: 0.719; }
        frame 67 { x: 33; y: 75.8; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 33.7; y: 75.3; skew-x: 9.4; skew-y: 9.4; scale-x: 0.72; scale-y: 0.72; }
        frame 69 { x: 32; y: 76.1; skew-x: 10; skew-y: 10; scale-x: 0.719; scale-y: 0.719; }
        frame 70 { x: 30.2; y: 76.8; skew-x: 10.6; skew-y: 10.6; scale-x: 0.718; scale-y: 0.718; }
        frame 71 { x: 28.6; y: 77.5; skew-x: 11.4; skew-y: 11.4; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 29.3; y: 77.8; skew-x: 13; skew-y: 13; scale-x: 0.717; scale-y: 0.717; }
        frame 73 { x: 30.1; y: 78.1; skew-x: 14.9; skew-y: 14.9; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 31.2; y: 77.5; skew-x: 11.1; skew-y: 11.1; scale-x: 0.718; scale-y: 0.718; }
        frame 75 { x: 32.4; y: 76.9; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 33.5; y: 76.5; skew-x: 3.6; skew-y: 3.6; scale-x: 0.719; scale-y: 0.719; }
        frame 77 { x: 34.9; y: 76.1; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 36; y: 75.8; skew-x: 1.8; skew-y: 1.8; }
        frame 80 { x: 37; y: 75.5; skew-x: 3.8; skew-y: 3.8; }
        frame 81 { x: 38.1; y: 75.1; skew-x: 5.8; skew-y: 5.8; }
        frame 82 { x: 39.4; y: 74.8; skew-x: 7.8; skew-y: 7.8; scale-x: 0.719; scale-y: 0.719; }
        frame 83 { x: 40.5; y: 74.5; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 41.7; y: 74.3; skew-x: 11.8; skew-y: 11.8; }
        frame 85 { x: 43; y: 74.1; skew-x: 13.8; skew-y: 13.8; }
        frame 86 { x: 44.2; y: 73.8; skew-x: 15.8; skew-y: 15.8; }
        frame 87 { x: 32.9; y: 76.3; skew-x: 3.8; skew-y: 3.8; }
        frame 88 { x: 22.6; y: 79.3; skew-x: -7.7; skew-y: -7.7; scale-x: 0.718; scale-y: 0.718; }
        frame 89 { x: 13.2; y: 83.3; skew-x: -19.5; skew-y: -19.5; scale-x: 0.717; scale-y: 0.717; }
        frame 90 { x: 4.7; y: 87.9; skew-x: -31.4; skew-y: -31.4; scale-x: 0.718; scale-y: 0.718; }
        frame 91 { x: -0.8; y: 94; skew-x: -43; skew-y: -43; scale-x: 0.716; scale-y: 0.716; }
        frame 92 { x: -5.3; y: 100.1; skew-x: -54.3; skew-y: -54.3; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -8.6; y: 106.1; skew-x: -65.9; skew-y: -65.9; }
        frame 94 { x: -10.9; y: 111.7; skew-x: -77.3; skew-y: -77.3; }
        frame 95 { x: -15; y: 113.6; skew-x: -91.7; skew-y: -91.7; scale-x: 0.715; scale-y: 0.715; }
        frame 96 { x: -17.6; y: 114.2; skew-x: -106.4; skew-y: -106.4; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: -26.8; y: 113.8; skew-x: -83.9; skew-y: -83.9; scale-x: 0.714; scale-y: 0.714; }
        frame 98 { x: -32.6; y: 110.7; skew-x: -61.1; skew-y: -61.1; scale-x: 0.713; scale-y: 0.713; }
        frame 99 { x: -33.9; y: 106.2; skew-x: -38.3; skew-y: -38.3; scale-x: 0.711; scale-y: 0.711; }
        frame 100 { x: -30.8; y: 102.6; skew-x: -15.7; skew-y: -15.7; scale-x: 0.712; scale-y: 0.712; }
        frame 101 { x: -33.3; y: 104.9; skew-x: -26; skew-y: -26; scale-x: 0.711; scale-y: 0.711; }
        frame 102 { x: -35; y: 107.5; skew-x: -36.5; skew-y: -36.5; scale-x: 0.712; scale-y: 0.712; }
        frame 103 { x: -34.5; y: 106.9; skew-x: -28.5; skew-y: -28.5; scale-x: 0.711; scale-y: 0.711; }
        frame 104 { x: -33.7; y: 106.8; skew-x: -20.7; skew-y: -20.7; scale-x: 0.713; scale-y: 0.713; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 105;
        frame 0 { x: -12.6; y: -10.3; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_HEAD; }
        frame 1 { x: -10000; y: -9.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: -9.3; }
        frame 3 { y: -8.8; }
        frame 4 { y: -8.3; }
        frame 5 { y: -7.8; }
        frame 6 { y: -7.3; }
        frame 7 { x: -13.1; y: -7; skew-x: -0.7; skew-y: -0.7; }
        frame 8 { x: -13.7; y: -6.6; skew-x: -1.4; skew-y: -1.4; }
        frame 9 { x: -13.5; y: -7.2; skew-x: -1.2; skew-y: -1.2; }
        frame 10 { x: -13.3; y: -7.9; skew-x: -0.9; skew-y: -0.9; }
        frame 11 { x: -13.1; y: -8.4; skew-x: -0.7; skew-y: -0.7; }
        frame 12 { x: -13; y: -9.1; skew-x: -0.4; skew-y: -0.4; }
        frame 13 { x: -12.8; y: -9.6; skew-x: -0.2; skew-y: -0.2; }
        frame 14 { x: -12.6; y: -10.3; skew-x: 0; skew-y: 0; }
        frame 15 { x: 11.2; y: -23.3; skew-x: 17.8; skew-y: 17.8; scale-x: 0.719; scale-y: 0.719; }
        frame 16 { x: 3.1; y: -19.8; skew-x: 15.8; skew-y: 15.8; scale-x: 0.718; scale-y: 0.718; }
        frame 17 { x: -4.7; y: -16.5; skew-x: 13.9; skew-y: 13.9; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -13.1; y: -11.9; skew-x: 9.5; skew-y: 9.5; }
        frame 19 { x: -21.3; y: -7.1; skew-x: 5.3; skew-y: 5.3; }
        frame 20 { x: -29.3; y: -2; skew-x: 1.1; skew-y: 1.1; }
        frame 21 { x: -37; y: 2.9; skew-x: -2.9; skew-y: -2.9; }
        frame 22 { x: -34.8; y: 3.1; skew-x: -2.2; skew-y: -2.2; }
        frame 23 { x: -32.5; y: 3.4; skew-x: -1.4; skew-y: -1.4; }
        frame 24 { x: -30.1; y: 0.6; skew-x: -0.5; skew-y: -0.5; }
        frame 25 { x: -28; y: -1.9; skew-x: 0; skew-y: 0; }
        frame 26 { x: -22; y: -6.1; skew-x: 3.5; skew-y: 3.5; }
        frame 27 { x: -16; y: -10.4; skew-x: 7; skew-y: 7; }
        frame 28 { x: -9.9; y: -14.4; skew-x: 10.5; skew-y: 10.5; scale-x: 0.717; scale-y: 0.717; }
        frame 29 { x: -3.7; y: -18.3; skew-x: 14; skew-y: 14; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 2.5; y: -22; skew-x: 17.5; skew-y: 17.5; }
        frame 31 { x: 8.9; y: -25.7; skew-x: 21.1; skew-y: 21.1; }
        frame 32 { x: 3.5; y: -22.8; skew-x: 19.3; skew-y: 19.3; }
        frame 33 { x: -1.8; y: -20; skew-x: 17.5; skew-y: 17.5; }
        frame 34 { x: -9; y: -15.3; skew-x: 12.3; skew-y: 12.3; }
        frame 35 { x: -15.9; y: -10.6; skew-x: 7.3; skew-y: 7.3; }
        frame 36 { x: -22.8; y: -5.5; skew-x: 2; skew-y: 2; scale-x: 0.718; scale-y: 0.718; }
        frame 37 { x: -29.3; y: -0.2; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: -31.1; y: 0.3; skew-x: -2.4; skew-y: -2.4; }
        frame 39 { x: -32.9; y: 0.9; skew-x: -1.9; skew-y: -1.9; }
        frame 40 { x: -30.8; y: -1; skew-x: -1.4; skew-y: -1.4; }
        frame 41 { x: -28.9; y: -3; skew-x: -1.1; skew-y: -1.1; }
        frame 42 { x: -23.4; y: -6; skew-x: 1.3; skew-y: 1.3; scale-x: 0.719; scale-y: 0.719; }
        frame 43 { x: -17.8; y: -9.2; skew-x: 4.1; skew-y: 4.1; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: -12.1; y: -12; skew-x: 6.8; skew-y: 6.8; }
        frame 45 { x: -6.2; y: -15; skew-x: 9.5; skew-y: 9.5; }
        frame 46 { x: -0.4; y: -17.8; skew-x: 12.3; skew-y: 12.3; }
        frame 47 { x: 5.3; y: -20.6; skew-x: 15; skew-y: 15; }
        frame 48 { x: 11.2; y: -23.3; skew-x: 17.8; skew-y: 17.8; }
        frame 49 { x: -12.6; y: -10.3; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: -6.7; y: -13.7; skew-x: 4.5; skew-y: 4.5; scale-x: 0.716; scale-y: 0.725; }
        frame 51 { x: -0.6; y: -16.9; skew-x: 9; skew-y: 9; scale-x: 0.713; scale-y: 0.73; }
        frame 52 { x: 5.5; y: -19.7; skew-x: 13.6; skew-y: 13.6; scale-x: 0.709; scale-y: 0.735; }
        frame 53 { x: 12.1; y: -22.5; skew-x: 18.3; skew-y: 18.3; scale-x: 0.705; scale-y: 0.74; }
        frame 54 { x: 18.7; y: -24.8; skew-x: 22.8; skew-y: 22.8; scale-x: 0.701; scale-y: 0.745; }
        frame 55 { x: 25.5; y: -27; skew-x: 27.4; skew-y: 27.4; scale-x: 0.699; scale-y: 0.751; }
        frame 56 { x: 7.3; y: -19.2; skew-x: 18.8; skew-y: 18.8; scale-x: 0.698; scale-y: 0.75; }
        frame 57 { x: -10.2; y: -10.5; skew-x: 10.1; skew-y: 10.1; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: -27.2; y: -1.2; skew-x: 1.6; skew-y: 1.6; }
        frame 59 { x: -27.8; y: 0.7; skew-x: 1.5; skew-y: 1.5; scale-x: 0.709; scale-y: 0.732; }
        frame 60 { x: -28.3; y: 2.6; skew-x: 1.6; skew-y: 1.6; scale-x: 0.721; scale-y: 0.715; }
        frame 61 { x: -21.8; y: -1.3; skew-x: 4.8; skew-y: 4.8; scale-x: 0.718; scale-y: 0.719; }
        frame 62 { x: -15.3; y: -5.5; skew-x: 8; skew-y: 8; scale-x: 0.715; scale-y: 0.724; }
        frame 63 { x: -8.6; y: -9.4; skew-x: 11.3; skew-y: 11.3; scale-x: 0.712; scale-y: 0.728; }
        frame 64 { x: -1.9; y: -13.1; skew-x: 14.5; skew-y: 14.5; scale-x: 0.709; scale-y: 0.732; }
        frame 65 { x: 4.8; y: -16.8; skew-x: 17.8; skew-y: 17.8; scale-x: 0.706; scale-y: 0.737; }
        frame 66 { x: 11.5; y: -20.2; skew-x: 20.8; skew-y: 20.8; scale-x: 0.704; scale-y: 0.741; }
        frame 67 { x: 18.5; y: -23.6; skew-x: 24.1; skew-y: 24.1; scale-x: 0.701; scale-y: 0.746; }
        frame 68 { x: 25.5; y: -27; skew-x: 27.4; skew-y: 27.4; scale-x: 0.699; scale-y: 0.751; }
        frame 69 { x: 6.8; y: -18.4; skew-x: 18.8; skew-y: 18.8; scale-x: 0.705; scale-y: 0.738; }
        frame 70 { x: -11.1; y: -8.9; skew-x: 10.1; skew-y: 10.1; scale-x: 0.713; scale-y: 0.726; }
        frame 71 { x: -28.3; y: 1.4; skew-x: 1.6; skew-y: 1.6; scale-x: 0.721; scale-y: 0.715; }
        frame 72 { x: -28.6; y: 2.3; skew-x: 1.5; skew-y: 1.5; scale-x: 0.727; scale-y: -10000; }
        frame 73 { x: -28.8; y: 3.1; skew-x: 1.6; skew-y: 1.6; scale-x: 0.732; }
        frame 74 { x: -24.7; y: -0; skew-x: 1.1; skew-y: 1.1; scale-x: 0.729; scale-y: 0.716; }
        frame 75 { x: -20.7; y: -3.5; skew-x: 0.8; skew-y: 0.8; scale-x: 0.726; scale-y: 0.717; }
        frame 76 { x: -16.7; y: -6.9; skew-x: 0.3; skew-y: 0.3; scale-x: 0.723; scale-y: 0.719; }
        frame 77 { x: -12.6; y: -10.3; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 79 { cel: -10000; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 105;
        frame 0 { x: 2.5; y: 33.9; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_JAW; }
        frame 1 { x: -10000; y: 34.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 35.5; }
        frame 3 { y: 36.3; }
        frame 4 { y: 37; }
        frame 5 { y: 37.9; }
        frame 6 { y: 38.6; }
        frame 7 { x: 2.7; y: -10000; }
        frame 8 { x: 2.8; }
        frame 9 { x: -10000; y: 37.8; }
        frame 10 { x: 2.7; y: 37; }
        frame 11 { x: -10000; y: 36.3; }
        frame 12 { x: 2.6; y: 35.5; }
        frame 13 { x: -10000; y: 34.7; }
        frame 14 { x: 2.5; y: 33.9; }
        frame 15 { x: 12.6; y: 24.6; skew-x: 17.8; skew-y: 17.8; scale-x: 0.719; scale-y: 0.719; }
        frame 16 { x: 6.3; y: 28.3; skew-x: 15.8; skew-y: 15.8; scale-x: 0.718; scale-y: 0.718; }
        frame 17 { x: 0.1; y: 32; skew-x: 13.9; skew-y: 13.9; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -4.6; y: 34.9; skew-x: 9.5; skew-y: 9.5; }
        frame 19 { x: -9.2; y: 37.7; skew-x: 5.3; skew-y: 5.3; }
        frame 20 { x: -13.9; y: 42.8; skew-x: 1; skew-y: 1; }
        frame 21 { x: -18.5; y: 48; skew-x: -2.9; skew-y: -2.9; }
        frame 22 { x: -16.9; y: 49; skew-x: -2.2; skew-y: -2.2; }
        frame 23 { x: -15.2; y: 50; skew-x: -1.4; skew-y: -1.4; }
        frame 24 { x: -13.5; y: 47.3; skew-x: -0.5; skew-y: -0.5; }
        frame 25 { x: -12.1; y: 44.5; skew-x: 0; skew-y: 0; }
        frame 26 { x: -8.8; y: 40.3; skew-x: 3.5; skew-y: 3.5; }
        frame 27 { x: -5.6; y: 36; skew-x: 7; skew-y: 7; scale-x: 0.717; scale-y: 0.717; }
        frame 28 { x: -2.2; y: 31.8; skew-x: 10.5; skew-y: 10.5; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 0.9; y: 28.7; skew-x: 14; skew-y: 14; }
        frame 30 { x: 4.1; y: 25.8; skew-x: 17.5; skew-y: 17.5; }
        frame 31 { x: 7.3; y: 22.9; skew-x: 21.1; skew-y: 21.1; }
        frame 32 { x: 3.5; y: 26.1; skew-x: 19.3; skew-y: 19.3; }
        frame 33 { x: -0.1; y: 29.4; skew-x: 17.5; skew-y: 17.5; }
        frame 34 { x: -5.1; y: 31.6; skew-x: 12.3; skew-y: 12.3; }
        frame 35 { x: -9.9; y: 33.8; skew-x: 7.3; skew-y: 7.3; }
        frame 36 { x: -10.4; y: 39.3; skew-x: 2; skew-y: 2; scale-x: 0.718; scale-y: 0.718; }
        frame 37 { x: -10.8; y: 44.8; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: -13; y: 46; skew-x: -1.7; skew-y: -1.7; }
        frame 39 { x: -15.1; y: 47.2; skew-x: -0.5; skew-y: -0.5; }
        frame 40 { x: -13.5; y: 44.6; skew-x: 0.3; skew-y: 0.3; scale-x: 0.719; scale-y: 0.719; }
        frame 41 { x: -11.7; y: 42.1; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: -8.3; y: 39.3; skew-x: 3.8; skew-y: 3.8; scale-x: 0.718; scale-y: 0.718; }
        frame 43 { x: -4.7; y: 36.4; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: -1.2; y: 33.6; skew-x: 8.3; skew-y: 8.3; }
        frame 45 { x: 2.3; y: 30.8; skew-x: 10.8; skew-y: 10.8; scale-x: 0.719; scale-y: 0.719; }
        frame 46 { x: 5.7; y: 28.8; skew-x: 13; skew-y: 13; scale-x: 0.718; scale-y: 0.718; }
        frame 47 { x: 9.1; y: 26.7; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 12.6; y: 24.6; skew-x: 17.8; skew-y: 17.8; scale-x: 0.719; scale-y: 0.719; }
        frame 49 { x: 2.5; y: 33.9; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: 4.1; y: 32.3; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: 0.73; }
        frame 51 { x: 5.6; y: 30.8; skew-x: 7.1; skew-y: 7.1; scale-x: 0.719; scale-y: 0.74; }
        frame 52 { x: 7.2; y: 29.4; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: 0.75; }
        frame 53 { x: 8.8; y: 27.9; skew-x: 14.3; skew-y: 14.3; scale-y: 0.761; }
        frame 54 { x: 10.5; y: 26.5; skew-x: 18; skew-y: 18; scale-y: 0.771; }
        frame 55 { x: 12.3; y: 25.2; skew-x: 21.7; skew-y: 21.7; scale-y: 0.782; }
        frame 56 { x: 2.8; y: 30.7; skew-x: 13; skew-y: 13; scale-x: 0.718; scale-y: 0.781; }
        frame 57 { x: -6.5; y: 36.4; skew-x: 4.3; skew-y: 4.3; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: -15.6; y: 42.4; skew-x: -4; skew-y: -4; }
        frame 59 { x: -16.3; y: 42.8; skew-x: -3.9; skew-y: -3.9; scale-x: 0.767; }
        frame 60 { x: -17.1; y: 43.3; skew-x: -4; skew-y: -4; scale-x: 0.815; }
        frame 61 { x: -13; y: 40.7; skew-x: -0.7; skew-y: -0.7; scale-x: 0.803; }
        frame 62 { x: -8.9; y: 38.4; skew-x: 2.3; skew-y: 2.3; scale-x: 0.791; }
        frame 63 { x: -4.8; y: 36; skew-x: 5.5; skew-y: 5.5; scale-x: 0.779; }
        frame 64 { x: -0.5; y: 33.7; skew-x: 8.8; skew-y: 8.8; scale-x: 0.767; }
        frame 65 { x: 2.4; y: 31.5; skew-x: 11.8; skew-y: 11.8; scale-x: 0.754; }
        frame 66 { x: 5.8; y: 29.4; skew-x: 15.1; skew-y: 15.1; scale-x: 0.742; }
        frame 67 { x: 9; y: 27.3; skew-x: 18.3; skew-y: 18.3; scale-x: 0.73; }
        frame 68 { x: 12.3; y: 25.2; skew-x: 21.7; skew-y: 21.7; scale-x: 0.719; scale-y: 0.782; }
        frame 69 { x: 2.3; y: 30.3; skew-x: 13; skew-y: 13; scale-x: 0.751; scale-y: 0.781; }
        frame 70 { x: -7.5; y: 36; skew-x: 4.3; skew-y: 4.3; scale-x: 0.783; scale-y: -10000; }
        frame 71 { x: -17.1; y: 42; skew-x: -4; skew-y: -4; scale-x: 0.815; }
        frame 72 { x: -17.7; y: 42.8; skew-x: -3.9; skew-y: -3.9; scale-x: 0.856; scale-y: 0.764; }
        frame 73 { x: -18.3; y: 43.6; skew-x: -4; skew-y: -4; scale-x: 0.898; scale-y: 0.748; }
        frame 74 { x: -12.9; y: 41.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.853; scale-y: 0.741; }
        frame 75 { x: -7.7; y: 38.7; skew-x: -1.9; skew-y: -1.9; scale-x: 0.809; scale-y: 0.734; }
        frame 76 { x: -2.4; y: 36.3; skew-x: -0.9; skew-y: -0.9; scale-x: 0.764; scale-y: 0.727; }
        frame 77 { x: 2.5; y: 33.9; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 79 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_outerarm_hand";
        frame-count: 105;
        frame 0 { x: 41; y: 87.1; skew-x: 5.1; skew-y: 5.1; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_OUTERARM_HAND; }
        frame 1 { x: 41.2; y: 87.9; skew-x: 4.1; skew-y: 4.1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 41.4; y: 88.7; skew-x: 3.3; skew-y: 3.3; }
        frame 3 { x: 41.7; y: 89.4; skew-x: 2.5; skew-y: 2.5; }
        frame 4 { x: 42; y: 90.2; skew-x: 1.5; skew-y: 1.5; }
        frame 5 { x: 42.2; y: 90.9; skew-x: 0.8; skew-y: 0.8; }
        frame 6 { x: 42.5; y: 91.7; skew-x: 0; skew-y: 0; }
        frame 7 { x: 42.4; y: 91.5; skew-x: 0.5; skew-y: 0.5; }
        frame 8 { x: 42.1; y: 91.3; skew-x: 1; skew-y: 1; }
        frame 9 { x: 41.9; y: 90.7; skew-x: 1.6; skew-y: 1.6; }
        frame 10 { x: 41.8; y: 90; skew-x: 2.3; skew-y: 2.3; }
        frame 11 { x: 41.5; y: 89.2; skew-x: 3; skew-y: 3; }
        frame 12 { x: 41.4; y: 88.6; skew-x: 3.6; skew-y: 3.6; }
        frame 13 { x: 41.1; y: 87.8; skew-x: 4.3; skew-y: 4.3; }
        frame 14 { x: 41; y: 87.1; skew-x: 5.1; skew-y: 5.1; }
        frame 15 { x: 90.3; y: 89.4; skew-x: -64.1; skew-y: -64.1; scale-x: 0.717; scale-y: 0.717; }
        frame 16 { x: 83; y: 92.3; skew-x: -66.6; skew-y: -66.6; scale-x: 0.715; scale-y: 0.715; }
        frame 17 { x: 75.7; y: 95.2; skew-x: -69.1; skew-y: -69.1; scale-x: 0.714; scale-y: 0.714; }
        frame 18 { x: 62.7; y: 96.3; skew-x: -58.8; skew-y: -58.8; scale-x: 0.713; scale-y: 0.713; }
        frame 19 { x: 50.1; y: 97.1; skew-x: -48.3; skew-y: -48.3; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 38; y: 98; skew-x: -37.8; skew-y: -37.8; }
        frame 21 { x: 26.4; y: 98.7; skew-x: -27.5; skew-y: -27.5; scale-x: 0.714; scale-y: 0.714; }
        frame 22 { x: 24.6; y: 98.1; skew-x: -26.2; skew-y: -26.2; scale-x: 0.713; scale-y: 0.713; }
        frame 23 { x: 22.8; y: 97.7; skew-x: -25.2; skew-y: -25.2; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 20.9; y: 95.7; skew-x: -24; skew-y: -24; scale-x: 0.712; scale-y: 0.712; }
        frame 25 { x: 19; y: 93.7; skew-x: -23; skew-y: -23; scale-x: 0.713; scale-y: 0.713; }
        frame 26 { x: 15.9; y: 88.4; skew-x: -14.2; skew-y: -14.2; scale-x: 0.712; scale-y: 0.712; }
        frame 27 { x: 13; y: 83.3; skew-x: -5.5; skew-y: -5.5; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 10.4; y: 78.5; skew-x: 2.8; skew-y: 2.8; }
        frame 29 { x: 8.1; y: 74; skew-x: 11.6; skew-y: 11.6; }
        frame 30 { x: 6; y: 69.7; skew-x: 20.3; skew-y: 20.3; scale-x: 0.711; scale-y: 0.711; }
        frame 31 { x: 4; y: 65.8; skew-x: 29.1; skew-y: 29.1; scale-x: 0.712; scale-y: 0.712; }
        frame 32 { x: 5.8; y: 67.3; skew-x: 40.1; skew-y: 40.1; scale-x: 0.71; scale-y: 0.71; }
        frame 33 { x: 7.5; y: 69.3; skew-x: 50.9; skew-y: 50.9; scale-x: 0.711; scale-y: 0.711; }
        frame 34 { x: 11.7; y: 74.7; skew-x: 32.8; skew-y: 32.8; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 16.1; y: 81.8; skew-x: 14.8; skew-y: 14.8; scale-x: 0.712; scale-y: 0.712; }
        frame 36 { x: 21.4; y: 90.1; skew-x: -3; skew-y: -3; scale-x: 0.713; scale-y: 0.713; }
        frame 37 { x: 27.8; y: 99.7; skew-x: -21.2; skew-y: -21.2; scale-x: 0.714; scale-y: 0.714; }
        frame 38 { x: 29.9; y: 99.8; skew-x: -21.4; skew-y: -21.4; scale-x: 0.713; scale-y: 0.713; }
        frame 39 { x: 32.1; y: -10000; skew-x: -21.7; skew-y: -21.7; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 38.1; y: 98.3; skew-x: -21.9; skew-y: -21.9; scale-x: 0.712; scale-y: 0.712; }
        frame 41 { x: 44.1; y: 96.8; skew-x: -22.2; skew-y: -22.2; scale-x: 0.713; scale-y: 0.713; }
        frame 42 { x: 50.2; y: 95.7; skew-x: -28.2; skew-y: -28.2; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 56.5; y: 94.6; skew-x: -34; skew-y: -34; }
        frame 44 { x: 62.9; y: 93.6; skew-x: -40; skew-y: -40; scale-x: 0.714; scale-y: 0.714; }
        frame 45 { x: 69.5; y: 92.5; skew-x: -46.1; skew-y: -46.1; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 76.2; y: 91.5; skew-x: -52.1; skew-y: -52.1; scale-x: 0.715; scale-y: 0.715; }
        frame 47 { x: 83.2; y: 90.5; skew-x: -58.1; skew-y: -58.1; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 90.3; y: 89.4; skew-x: -64.1; skew-y: -64.1; scale-x: 0.717; scale-y: 0.717; }
        frame 49 { x: 41; y: 87.1; skew-x: 5.1; skew-y: 5.1; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: 30.8; y: 78.3; skew-x: 28.4; skew-y: 28.4; scale-x: 0.717; scale-y: 0.717; }
        frame 51 { x: 21.4; y: 72; skew-x: 51.9; skew-y: 51.9; scale-x: 0.716; scale-y: 0.716; }
        frame 52 { x: 18; y: 58.4; skew-x: 75.5; skew-y: 75.5; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 24.7; y: 52.7; skew-x: 101.3; skew-y: 101.3; scale-x: 0.715; scale-y: 0.715; }
        frame 54 { x: 28.5; y: 48.8; skew-x: 127.1; skew-y: 127.1; scale-x: 0.714; scale-y: 0.714; }
        frame 55 { x: 29.4; y: 45.3; skew-x: 153; skew-y: 153; scale-x: 0.715; scale-y: 0.715; }
        frame 56 { x: 22.1; y: 43; skew-x: 125.1; skew-y: 125.1; scale-x: 0.712; scale-y: 0.712; }
        frame 57 { x: 11.3; y: 41.5; skew-x: 97; skew-y: 97; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: -2.3; y: 42.3; skew-x: 69.2; skew-y: 69.2; scale-x: 0.71; scale-y: 0.71; }
        frame 59 { x: -2.9; y: 44.3; skew-x: 66.9; skew-y: 66.9; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: -3.7; y: 46.3; skew-x: 64.4; skew-y: 64.4; }
        frame 61 { x: 3.5; y: 54; skew-x: 51.9; skew-y: 51.9; }
        frame 62 { x: 10.8; y: 62.5; skew-x: 39.6; skew-y: 39.6; scale-x: 0.711; scale-y: 0.711; }
        frame 63 { x: 18.1; y: 71.7; skew-x: 27.1; skew-y: 27.1; scale-x: 0.714; scale-y: 0.714; }
        frame 64 { x: 24.4; y: 76.1; skew-x: 19.6; skew-y: 19.6; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 30.8; y: 80.7; skew-x: 12.1; skew-y: 12.1; scale-x: 0.715; scale-y: 0.715; }
        frame 66 { x: 37.3; y: 85.5; skew-x: 4.8; skew-y: 4.8; scale-x: 0.717; scale-y: 0.717; }
        frame 67 { x: 44.1; y: 90.6; skew-x: -2.4; skew-y: -2.4; scale-x: 0.718; scale-y: 0.718; }
        frame 68 { x: 51; y: 95.8; skew-x: -10; skew-y: -10; scale-x: 0.719; scale-y: 0.719; }
        frame 69 { x: 43.1; y: 96.6; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 35.3; y: 97.3; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 27.5; y: 98.3; skew-x: -10; skew-y: -10; }
        frame 72 { x: -10000; y: 98.6; skew-x: -9.9; skew-y: -9.9; }
        frame 73 { y: 98.8; skew-x: -10; skew-y: -10; }
        frame 74 { x: 30.8; y: 95.8; skew-x: -6.2; skew-y: -6.2; }
        frame 75 { x: 34; y: 92.8; skew-x: -2.4; skew-y: -2.4; }
        frame 76 { x: 37.5; y: 90; skew-x: 1.3; skew-y: 1.3; scale-x: 0.72; scale-y: 0.72; }
        frame 77 { x: 41; y: 87.1; skew-x: 5.1; skew-y: 5.1; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 79 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_yeti_outerarm_upper";
        frame-count: 105;
        frame 0 { x: 37.6; y: 27.3; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_OUTERARM_UPPER; }
        frame 1 { x: -10000; y: 27.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 28.1; }
        frame 3 { y: 28.5; }
        frame 4 { y: 28.8; }
        frame 5 { y: 29.2; }
        frame 6 { y: 29.6; }
        frame 7 { y: 29.7; }
        frame 8 { y: 29.9; }
        frame 9 { y: 29.5; }
        frame 10 { y: 29; }
        frame 11 { y: 28.6; }
        frame 12 { y: 28.2; }
        frame 13 { y: 27.8; }
        frame 14 { y: 27.3; }
        frame 15 { x: 42.5; y: 40.1; skew-x: -42; skew-y: -42; scale-x: 0.718; scale-y: 0.718; }
        frame 16 { x: 37.7; y: 38.3; skew-x: -35.8; skew-y: -35.8; scale-x: 0.716; scale-y: 0.716; }
        frame 17 { x: 33; y: 36.5; skew-x: -29.7; skew-y: -29.7; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 28.7; y: 34.9; skew-x: -23.7; skew-y: -23.7; scale-x: 0.715; scale-y: 0.715; }
        frame 19 { x: 24.8; y: 33.3; skew-x: -17.5; skew-y: -17.5; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 21; y: 32; skew-x: -11.4; skew-y: -11.4; }
        frame 21 { x: 17.5; y: 31; skew-x: -5.4; skew-y: -5.4; scale-x: 0.716; scale-y: 0.716; }
        frame 22 { x: 20.8; y: 29.7; skew-x: 0; skew-y: 0; scale-x: 0.715; scale-y: 0.715; }
        frame 23 { x: 24.4; y: 28.5; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 27.9; y: 26.6; skew-x: 11.3; skew-y: 11.3; scale-x: 0.714; scale-y: 0.714; }
        frame 25 { x: 31.8; y: 25.1; skew-x: 17; skew-y: 17; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 35.7; y: 23.7; skew-x: 22.8; skew-y: 22.6; scale-y: 0.713; }
        frame 27 { x: 39.6; y: 22.7; skew-x: 28.3; skew-y: 28.3; scale-y: -10000; }
        frame 28 { x: 43.6; y: 21.9; skew-x: 34.1; skew-y: 34.1; scale-x: 0.713; }
        frame 29 { x: 47.6; y: 21.4; skew-x: 39.8; skew-y: 39.6; scale-x: -10000; scale-y: 0.712; }
        frame 30 { x: 51.6; y: 21.2; skew-x: 45.4; skew-y: 45.4; scale-y: -10000; }
        frame 31 { x: 55.5; y: 21.4; skew-x: 51.2; skew-y: 51; scale-x: 0.714; scale-y: 0.713; }
        frame 32 { x: 50.1; y: 22.2; skew-x: 45.1; skew-y: 45.1; scale-x: 0.712; scale-y: 0.712; }
        frame 33 { x: 44.5; y: 23; skew-x: 39.1; skew-y: 39.1; scale-x: 0.713; scale-y: -10000; }
        frame 34 { x: 39.8; y: 23.9; skew-x: 29.6; skew-y: 29.5; scale-x: -10000; }
        frame 35 { x: 35; y: 25.7; skew-x: 19.8; skew-y: 19.8; scale-y: 0.713; }
        frame 36 { x: 30.5; y: 28.1; skew-x: 10.3; skew-y: 10.3; scale-x: 0.714; scale-y: 0.714; }
        frame 37 { x: 26.3; y: 31.4; skew-x: 0.8; skew-y: 0.8; scale-x: 0.715; scale-y: 0.715; }
        frame 38 { x: 24.2; y: 32.5; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 22; y: 33.8; skew-x: -6.9; skew-y: -6.9; scale-x: 0.716; scale-y: 0.716; }
        frame 40 { x: 23.9; y: 34.1; skew-x: -10.7; skew-y: -10.7; scale-x: 0.715; scale-y: 0.715; }
        frame 41 { x: 25.8; y: 34.6; skew-x: -14.7; skew-y: -14.7; scale-x: 0.716; scale-y: 0.716; }
        frame 42 { x: 27.9; y: 35.1; skew-x: -18.5; skew-y: -18.5; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 30.1; y: 35.9; skew-x: -22.5; skew-y: -22.5; }
        frame 44 { x: 32.3; y: 36.7; skew-x: -26.4; skew-y: -26.4; }
        frame 45 { x: 34.7; y: 37.4; skew-x: -30.2; skew-y: -30.2; }
        frame 46 { x: 37.1; y: 38.3; skew-x: -34.2; skew-y: -34.2; }
        frame 47 { x: 39.8; y: 39.1; skew-x: -38; skew-y: -38; scale-x: 0.717; scale-y: 0.717; }
        frame 48 { x: 42.5; y: 40.1; skew-x: -42; skew-y: -42; scale-x: 0.718; scale-y: 0.718; }
        frame 49 { x: 37.6; y: 27.3; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: 43.5; y: 25; skew-x: 13.1; skew-y: 13.1; scale-x: 0.719; scale-y: 0.719; }
        frame 51 { x: 50.1; y: 24.2; skew-x: 26.3; skew-y: 26.3; scale-x: 0.717; scale-y: 0.717; }
        frame 52 { x: 56.9; y: 24.7; skew-x: 39.6; skew-y: 39.6; scale-x: 0.718; scale-y: 0.718; }
        frame 53 { x: 61.5; y: 25.9; skew-x: 48.4; skew-y: 48.4; scale-x: 0.716; scale-y: 0.716; }
        frame 54 { x: 65.8; y: 27.8; skew-x: 57.4; skew-y: 57.4; scale-x: 0.717; scale-y: 0.717; }
        frame 55 { x: 69.9; y: 30.3; skew-x: 66.1; skew-y: 66.1; scale-x: 0.718; scale-y: 0.718; }
        frame 56 { x: 59.2; y: 28.5; skew-x: 56.2; skew-y: 56.2; scale-x: 0.716; scale-y: 0.716; }
        frame 57 { x: 48; y: 27.5; skew-x: 46.1; skew-y: 46.1; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 37; y: 27.3; skew-x: 36.2; skew-y: 36.2; scale-x: 0.717; scale-y: 0.717; }
        frame 59 { x: 36.5; y: 28.2; skew-x: 35.1; skew-y: 35.1; scale-x: 0.716; scale-y: 0.716; }
        frame 60 { x: 36; y: 29; skew-x: 33.9; skew-y: 33.9; scale-x: 0.717; scale-y: 0.717; }
        frame 61 { x: 37.4; skew-x: 29.6; skew-y: 29.6; scale-x: 0.716; scale-y: 0.716; }
        frame 62 { x: 38.7; y: -10000; skew-x: 25.3; skew-y: 25.3; scale-x: 0.717; scale-y: 0.717; }
        frame 63 { x: 40; y: 29.2; skew-x: 21.1; skew-y: 21.1; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 41.5; y: 29.6; skew-x: 16.8; skew-y: 16.8; scale-x: 0.718; scale-y: 0.718; }
        frame 65 { x: 43; y: 30; skew-x: 12.6; skew-y: 12.6; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 44.6; y: 30.8; skew-x: 8.3; skew-y: 8.3; scale-x: 0.719; scale-y: 0.719; }
        frame 67 { x: 46.1; y: 31.5; skew-x: 4.1; skew-y: 4.1; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 47.9; y: 32.3; skew-x: 0; skew-y: 0; scale-x: 0.72; scale-y: 0.72; }
        frame 69 { x: 40; y: 33.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 32.3; y: 34; }
        frame 71 { x: 24.4; y: 34.8; }
        frame 72 { x: -10000; y: 35.5; }
        frame 73 { y: 36.3; }
        frame 74 { x: 27.7; y: 34; }
        frame 75 { x: 31.1; y: 31.8; }
        frame 76 { x: 34.4; y: 29.6; }
        frame 77 { x: 37.6; y: 27.3; }
        frame 78 { x: 37.8; y: 27.9; scale-x: 0.7; scale-y: 0.7; image: IMAGE_REANIM_ZOMBIE_YETI_OUTERARM_UPPER2; }
        frame 79 { x: 39.6; y: 28.5; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 80 { x: 41.5; y: 29.2; skew-x: 1.1; skew-y: 1.1; }
        frame 81 { x: 43.5; y: 29.7; skew-x: 1.8; skew-y: 1.8; }
        frame 82 { x: 45.5; y: 30.4; skew-x: 2.3; skew-y: 2.3; scale-x: 0.699; scale-y: 0.699; }
        frame 83 { x: 47.4; y: 31; skew-x: 3; skew-y: 3; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 49.3; y: 31.6; skew-x: 3.6; skew-y: 3.6; }
        frame 85 { x: 51.2; y: 32.2; skew-x: 4.3; skew-y: 4.3; }
        frame 86 { x: 53.2; y: 32.9; skew-x: 5; skew-y: 5; }
        frame 87 { x: 32.9; y: 37.2; skew-x: -7.2; skew-y: -7.2; scale-x: 0.698; scale-y: 0.698; }
        frame 88 { x: 13.5; y: 42.5; skew-x: -19.4; skew-y: -19.4; scale-x: 0.697; scale-y: 0.697; }
        frame 89 { x: -8.8; y: 50.4; skew-x: -37.2; skew-y: -37.2; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: -28.8; y: 58.8; skew-x: -55.1; skew-y: -55.1; scale-x: 0.698; scale-y: 0.698; }
        frame 91 { x: -35; y: 69.2; skew-x: -68.9; skew-y: -68.9; scale-x: 0.697; scale-y: 0.697; }
        frame 92 { x: -39.9; y: 79.2; skew-x: -82.6; skew-y: -82.6; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -43.3; y: 88.4; skew-x: -96.4; skew-y: -96.4; scale-x: 0.696; scale-y: 0.696; }
        frame 94 { x: -45.5; y: 96.6; skew-x: -110.2; skew-y: -110.2; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: -50.6; y: 106.4; skew-x: -124.7; skew-y: -124.7; scale-x: 0.695; scale-y: 0.695; }
        frame 96 { x: -55.3; y: 114.6; skew-x: -139.3; skew-y: -139.3; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: -70.6; y: 114.5; skew-x: -104.2; skew-y: -104.2; scale-x: 0.694; scale-y: 0.694; }
        frame 98 { x: -79.3; y: 106.7; skew-x: -69.4; skew-y: -69.4; scale-x: 0.693; scale-y: 0.693; }
        frame 99 { x: -78.4; y: 96.2; skew-x: -34.5; skew-y: -34.5; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: -67.9; y: 88.8; skew-x: 0.5; skew-y: 0.5; }
        frame 101 { x: -72.6; y: 91.8; skew-x: -13.9; skew-y: -13.9; scale-x: 0.692; scale-y: 0.692; }
        frame 102 { x: -76; y: 96; skew-x: -28.4; skew-y: -28.4; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: -72.6; y: 92; skew-x: -13.9; skew-y: -13.9; }
        frame 104 { x: -67.9; y: 88.8; skew-x: 0.5; skew-y: 0.5; scale-x: 0.693; scale-y: 0.693; }
    }
    Track {
        source-name: "Zombie_outerarm_lower";
        frame-count: 105;
        frame 0 { x: 44.4; y: 56.6; skew-x: 5.1; skew-y: 5.1; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_ZOMBIE_YETI_OUTERARM_LOWER; }
        frame 1 { x: 44.1; y: 57.3; skew-x: 4.1; skew-y: 4.1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 43.9; y: 57.9; skew-x: 3.3; skew-y: 3.3; }
        frame 3 { x: 43.7; y: 58.5; skew-x: 2.5; skew-y: 2.5; }
        frame 4 { x: 43.5; y: 59.1; skew-x: 1.5; skew-y: 1.5; }
        frame 5 { x: 43.4; y: 59.8; skew-x: 0.8; skew-y: 0.8; }
        frame 6 { x: 43.2; y: 60.3; skew-x: 0; skew-y: 0; }
        frame 7 { x: 43.3; y: 59.9; skew-x: 0.5; skew-y: 0.5; }
        frame 8 { x: 43.4; y: 59.5; skew-x: 1; skew-y: 1; }
        frame 9 { x: 43.5; y: 59.1; skew-x: 1.6; skew-y: 1.6; }
        frame 10 { x: 43.6; y: 58.5; skew-x: 2.3; skew-y: 2.3; }
        frame 11 { x: 43.8; y: 58; skew-x: 3; skew-y: 3; }
        frame 12 { x: 44; y: 57.5; skew-x: 3.6; skew-y: 3.6; }
        frame 13 { y: 57.1; skew-x: 4.3; skew-y: 4.3; }
        frame 14 { x: 44.4; y: 56.6; skew-x: 5.1; skew-y: 5.1; }
        frame 15 { x: 68; y: 60.1; skew-x: -43; skew-y: -43; scale-x: 0.718; scale-y: 0.718; }
        frame 16 { x: 61.1; y: 61; skew-x: -40; skew-y: -40; scale-x: 0.715; scale-y: 0.715; }
        frame 17 { x: 54.3; y: 61.8; skew-x: -37; skew-y: -37; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 46.7; y: 61.4; skew-x: -29.3; skew-y: -29.3; scale-x: 0.714; scale-y: 0.714; }
        frame 19 { x: 39.5; y: 61.3; skew-x: -21.7; skew-y: -21.7; scale-x: 0.715; scale-y: 0.715; }
        frame 20 { x: 32.5; y: 61.4; skew-x: -14; skew-y: -14; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 26; y: 62.1; skew-x: -6.4; skew-y: -6.4; }
        frame 22 { x: 26.6; y: 60.1; skew-x: -0.7; skew-y: -0.7; }
        frame 23 { x: 27.2; y: 58.5; skew-x: 4.8; skew-y: 4.8; scale-y: 0.714; }
        frame 24 { x: 28; y: 56; skew-x: 10.3; skew-y: 10.3; scale-x: 0.714; scale-y: -10000; }
        frame 25 { x: 28.9; y: 53.9; skew-x: 16; skew-y: 16; scale-x: -10000; scale-y: 0.713; }
        frame 26 { x: 29.8; y: 51.9; skew-x: 21.8; skew-y: 21.6; scale-x: 0.713; scale-y: -10000; }
        frame 27 { x: 30.7; y: 50.1; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; }
        frame 28 { x: 31.8; y: 48.7; skew-x: 33.1; skew-y: 33.1; scale-y: 0.712; }
        frame 29 { x: 32.7; y: 47.4; skew-x: 38.8; skew-y: 38.6; scale-y: -10000; }
        frame 30 { x: 33.5; y: 46.4; skew-x: 44.4; skew-y: 44.4; scale-x: 0.712; }
        frame 31 { x: 34.4; y: 45.5; skew-x: 50.2; skew-y: 50; scale-x: 0.713; scale-y: 0.713; }
        frame 32 { x: 32.9; y: 47.8; skew-x: 49.4; skew-y: 49.4; scale-x: 0.712; scale-y: 0.711; }
        frame 33 { x: 31.4; y: 49.9; skew-x: 48.7; skew-y: 48.6; scale-x: -10000; scale-y: 0.712; }
        frame 34 { x: -10000; y: 51.5; skew-x: 36.4; skew-y: 36.4; scale-y: 0.711; }
        frame 35 { x: 31.3; y: 54.4; skew-x: 24.1; skew-y: 24.1; scale-x: 0.713; scale-y: 0.712; }
        frame 36 { x: 31; y: 58.3; skew-x: 12; skew-y: 11.8; scale-x: 0.714; scale-y: 0.714; }
        frame 37 { x: 31.3; y: 63.3; skew-x: -0.1; skew-y: -0.1; scale-x: 0.715; scale-y: 0.715; }
        frame 38 { x: 31.2; y: -10000; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 31; y: 63.5; skew-x: -7.9; skew-y: -7.9; }
        frame 40 { x: 34.8; y: 62.8; skew-x: -11.7; skew-y: -11.7; }
        frame 41 { x: 38.6; y: 62.2; skew-x: -15.7; skew-y: -15.7; }
        frame 42 { x: 42.6; y: 61.7; skew-x: -19.5; skew-y: -19.5; }
        frame 43 { x: 46.6; y: 61.3; skew-x: -23.5; skew-y: -23.5; }
        frame 44 { x: 50.7; y: 61; skew-x: -27.4; skew-y: -27.4; scale-x: 0.716; scale-y: 0.716; }
        frame 45 { x: 54.9; y: 60.6; skew-x: -31.2; skew-y: -31.2; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 59.2; y: 60.5; skew-x: -35.2; skew-y: -35.2; }
        frame 47 { x: 63.6; y: 60.3; skew-x: -39; skew-y: -39; }
        frame 48 { x: 68; y: 60.1; skew-x: -43; skew-y: -43; scale-x: 0.718; scale-y: 0.718; }
        frame 49 { x: 44.4; y: 56.6; skew-x: 5.1; skew-y: 5.1; scale-x: 0.72; scale-y: 0.72; }
        frame 50 { x: 45.5; y: 52.7; skew-x: 27.6; skew-y: 27.6; scale-x: 0.717; scale-y: 0.717; }
        frame 51 { x: 46.6; y: 52.5; skew-x: 50.2; skew-y: 50.2; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 48.4; y: 49.9; skew-x: 63.8; skew-y: 72.7; scale-x: 0.726; scale-y: 0.762; }
        frame 53 { x: 53.2; y: 50.9; skew-x: 82; skew-y: 87.9; scale-x: 0.722; scale-y: 0.747; }
        frame 54 { x: 56.5; y: 52.5; skew-x: 99.8; skew-y: 102.8; scale-x: 0.719; scale-y: 0.731; }
        frame 55 { x: 58.5; y: 54.9; skew-x: 117.8; skew-y: 117.8; scale-x: 0.716; scale-y: 0.716; }
        frame 56 { x: 50.6; y: 55.6; skew-x: 108.3; skew-y: 114.8; scale-x: 0.729; scale-y: 0.714; }
        frame 57 { x: 42.7; y: 56.7; skew-x: 98.8; skew-y: 111.8; scale-x: 0.743; scale-y: -10000; }
        frame 58 { x: 34.7; y: 58; skew-x: 89.5; skew-y: 108.8; scale-x: 0.756; }
        frame 59 { x: 34.9; y: 58.4; skew-x: 87.2; skew-y: 106.3; scale-x: -10000; scale-y: 0.713; }
        frame 60 { x: 35; y: 58.6; skew-x: 84.7; skew-y: 104; scale-y: 0.714; }
        frame 61 { x: 39.6; y: 56.6; skew-x: 74.2; skew-y: 91; scale-x: 0.751; scale-y: -10000; }
        frame 62 { x: 43.3; y: 55; skew-x: 63.7; skew-y: 78.2; scale-x: 0.746; scale-y: 0.715; }
        frame 63 { x: 46.2; y: 54; skew-x: 53.2; skew-y: 65.4; scale-x: 0.741; scale-y: -10000; }
        frame 64 { x: 48.3; y: 53.6; skew-x: 42.6; skew-y: 52.4; scale-x: 0.737; scale-y: 0.716; }
        frame 65 { x: 49.8; y: 54.2; skew-x: 32.1; skew-y: 39.4; scale-x: 0.732; scale-y: -10000; }
        frame 66 { x: 51; y: 55.9; skew-x: 21.6; skew-y: 26.6; scale-x: 0.728; scale-y: 0.717; }
        frame 67 { x: 52.1; y: 58.5; skew-x: 11.1; skew-y: 13.6; scale-x: 0.724; scale-y: 0.718; }
        frame 68 { x: 53.6; y: 62.4; skew-x: 0.8; skew-y: 0.8; scale-x: 0.72; scale-y: 0.72; }
        frame 69 { x: 45.8; y: 63.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 38; y: 64; }
        frame 71 { x: 30.1; y: 64.8; }
        frame 72 { x: -10000; y: 65.6; }
        frame 73 { y: 66.3; }
        frame 74 { x: 33.6; y: 64; skew-x: 1.8; skew-y: 1.8; }
        frame 75 { x: 37.3; y: 61.5; skew-x: 2.8; skew-y: 2.8; }
        frame 76 { x: 40.8; y: 59.1; skew-x: 3.8; skew-y: 3.8; }
        frame 77 { x: 44.4; y: 56.6; skew-x: 5.1; skew-y: 5.1; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 79 { cel: -10000; }
    }
}
