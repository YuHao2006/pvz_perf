export component Zombie_jackbox {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { cel: 0; }
        frame 14 { cel: -10000; }
        frame 30 { cel: -1; }
        frame 31 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 30 { x: -9; y: 8.8; skew-x: -10.3; skew-y: -10.3; scale-x: 0.998; scale-y: 0.998; cel: 0; }
        frame 31 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 49 { cel: -1; }
        frame 50 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 49 { cel: 0; }
        frame 50 { cel: -10000; }
        frame 64 { cel: -1; }
        frame 65 { cel: -10000; }
    }
    Track {
        source-name: "anim_pop";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 64 { cel: 0; }
        frame 65 { cel: -10000; }
        frame 80 { cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 80 { cel: 0; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 30 { x: -49.8; y: 70; cel: 0; }
        frame 31 { x: -10000; y: -10000; cel: -10000; }
        frame 32 { x: -49.2; }
        frame 33 { x: -48.6; }
        frame 34 { x: -47.9; }
        frame 35 { x: -44.3; }
        frame 36 { x: -40.7; }
        frame 37 { x: -39.7; }
        frame 38 { x: -38.7; }
        frame 39 { x: -10000; }
        frame 40 { x: -37.8; }
        frame 41 { x: -36.8; }
        frame 42 { x: -35.8; }
        frame 43 { x: -34; }
        frame 44 { x: -32.1; }
        frame 45 { x: -10000; }
        frame 47 { x: -30.5; }
        frame 48 { x: -28.9; }
        frame 49 { x: -10000; cel: -1; }
        frame 50 { cel: -10000; }
    }
    Track {
        source-name: "zombie_jackbox_innerleg_foot";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 27; y: 104.5; scale-x: 0.748; scale-y: 0.748; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_INNERLEG_FOOT; }
        frame 14 { x: 27.1; y: 104.4; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 27.3; y: 104.3; skew-x: 0.5; skew-y: 0.5; }
        frame 16 { x: 27.5; y: 104.1; skew-x: 1.3; skew-y: 1.3; }
        frame 17 { x: 28.2; y: 103.3; skew-x: 3.3; skew-y: 3.3; scale-x: 0.747; scale-y: 0.747; }
        frame 18 { x: 28.6; y: 103; skew-x: 4.3; skew-y: 4.3; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 28.8; y: 102.8; skew-x: 4.8; skew-y: 4.8; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 21 { x: 28.9; y: 102.7; skew-x: 5.3; skew-y: 5.3; }
        frame 22 { x: 28.7; y: 103; skew-x: 4.5; skew-y: 4.5; }
        frame 23 { x: 28.4; y: 103.2; skew-x: 3.8; skew-y: 3.8; }
        frame 24 { x: 28.1; y: 103.4; skew-x: 3; skew-y: 3; }
        frame 25 { x: 27.9; y: 103.6; skew-x: 2.5; skew-y: 2.5; }
        frame 26 { x: 27.7; y: 103.8; skew-x: 1.8; skew-y: 1.8; }
        frame 27 { x: 27.4; y: 104.1; skew-x: 1.3; skew-y: 1.3; }
        frame 28 { x: 27.2; y: 104.3; skew-x: 0.5; skew-y: 0.5; scale-x: 0.748; scale-y: 0.748; }
        frame 29 { x: 27; y: 104.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: 27.7; }
        frame 33 { x: 28.4; }
        frame 34 { x: 29; }
        frame 35 { x: 32.2; }
        frame 36 { x: 35.4; }
        frame 37 { x: 36.5; }
        frame 38 { x: 37.6; }
        frame 39 { x: -10000; }
        frame 40 { x: 39.6; y: 104.1; skew-x: 1.3; skew-y: 1.3; }
        frame 41 { x: 41.6; y: 103.6; skew-x: 2.5; skew-y: 2.5; scale-x: 0.747; scale-y: 0.747; }
        frame 42 { x: 43.6; y: 103.1; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 45 { x: 37.4; y: 103.5; skew-x: -2.2; skew-y: -2.2; }
        frame 46 { x: 31.6; y: 103.9; skew-x: -8.8; skew-y: -8.8; }
        frame 47 { x: 29.3; y: 104.1; skew-x: -4.2; skew-y: -4.2; }
        frame 48 { x: 27; y: 104.5; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 27.3; y: 103.8; skew-x: 1.3; skew-y: 1.3; scale-x: 0.747; scale-y: 0.747; }
        frame 51 { x: 27.7; y: 103; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 28.1; y: 102.2; skew-x: 4.3; skew-y: 4.3; }
        frame 53 { x: 28.5; y: 101.4; skew-x: 5.8; skew-y: 5.8; }
        frame 54 { x: 28.8; y: 100.6; skew-x: 7.3; skew-y: 7.3; }
        frame 55 { x: 28.4; y: 101.6; skew-x: 5.3; skew-y: 5.3; }
        frame 56 { x: 27.9; y: 102.6; skew-x: 3.5; skew-y: 3.5; }
        frame 57 { x: 27.4; y: 103.5; skew-x: 1.8; skew-y: 1.8; }
        frame 58 { x: 27; y: 104.5; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 27.7; y: 103.5; skew-x: 2; skew-y: 2; scale-x: 0.747; scale-y: 0.747; }
        frame 74 { x: 28.4; y: 102.3; skew-x: 4.3; skew-y: 4.3; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 77 { y: 102.8; }
        frame 78 { y: 103.1; }
        frame 79 { y: -10000; }
        frame 80 { x: 27; y: 104.5; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 81 { x: 26.5; y: 105; skew-x: -2.4; skew-y: -2.4; scale-x: 0.747; scale-y: 0.747; }
        frame 82 { x: 26.2; y: 105.7; skew-x: -4.9; skew-y: -4.9; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 25.7; y: 106.2; skew-x: -7.5; skew-y: -7.5; }
        frame 84 { x: 25.3; y: 106.8; skew-x: -10.2; skew-y: -10.2; }
        frame 85 { x: 25.1; y: 109.2; skew-x: -25.7; skew-y: -25.7; scale-x: 0.746; scale-y: 0.746; }
        frame 86 { x: 26.4; y: 111.7; skew-x: -41.3; skew-y: -41.3; scale-x: 0.745; scale-y: 0.745; }
        frame 87 { x: 29.2; y: 113.8; skew-x: -56.8; skew-y: -56.8; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 33.5; y: 115.5; skew-x: -72.4; skew-y: -72.4; }
        frame 89 { x: 38.6; y: 108.6; skew-x: -99.2; skew-y: -99.2; scale-x: 0.743; scale-y: 0.743; }
        frame 90 { x: 45.1; y: 97.3; skew-x: -126; skew-y: -126; scale-x: 0.742; scale-y: 0.742; }
        frame 91 { x: 44.6; y: 96.6; skew-x: -133.3; skew-y: -133.3; scale-x: 0.741; scale-y: 0.741; }
        frame 92 { x: 44; y: 95.4; skew-x: -140.6; skew-y: -140.6; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 43.1; y: 94; skew-x: -148; skew-y: -148; }
        frame 94 { x: 42.4; y: 92.3; skew-x: -155.3; skew-y: -155.3; scale-x: 0.742; scale-y: 0.742; }
        frame 95 { x: 39; y: 114.7; skew-x: -127; skew-y: -127; scale-x: 0.74; scale-y: 0.74; }
        frame 96 { x: 35.1; y: 131.8; skew-x: -98.9; skew-y: -98.9; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 36.1; y: 132.4; skew-x: -99.2; skew-y: -98.4; scale-x: 0.726; scale-y: 0.752; }
        frame 98 { x: 37.1; y: 132.8; skew-x: -99.6; skew-y: -98.3; scale-x: 0.713; scale-y: 0.765; }
        frame 99 { x: 36.5; y: 131.7; skew-x: -100.5; skew-y: -99.9; scale-x: 0.726; scale-y: 0.752; }
        frame 100 { x: 36.1; y: 130.7; skew-x: -101.7; skew-y: -101.7; scale-x: 0.74; scale-y: 0.74; }
        frame 101 { x: 36.2; y: 131.8; skew-x: -10000; skew-y: -10000; scale-x: 0.739; scale-y: 0.739; }
        frame 102 { x: 36.1; y: 132.9; scale-x: 0.74; scale-y: 0.74; }
    }
    Track {
        source-name: "zombie_jackbox_innerleg_lower";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 27.2; y: 93.6; scale-x: 0.748; scale-y: 0.748; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_INNERLEG_LOWER; }
        frame 14 { x: 27.4; y: -10000; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 27.5; y: 93.3; skew-x: 0.8; skew-y: 0.8; }
        frame 16 { x: 27.9; y: 92.8; skew-x: 1.5; skew-y: 1.5; scale-x: 0.747; scale-y: 0.747; }
        frame 17 { x: 29; y: 91.6; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 29.5; y: 91; skew-x: 5; skew-y: 5; }
        frame 19 { x: 29.9; y: 90.7; skew-x: 5.8; skew-y: 5.8; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 21 { x: 30.2; y: 90.4; skew-x: 6.3; skew-y: 6.3; }
        frame 22 { x: 29.7; y: 90.9; skew-x: 5.3; skew-y: 5.3; }
        frame 23 { x: 29.4; y: 91.3; skew-x: 4.6; skew-y: 4.6; }
        frame 24 { x: 29; y: 91.7; skew-x: 3.8; skew-y: 3.8; }
        frame 25 { x: 28.7; y: 92; skew-x: 3; skew-y: 3; }
        frame 26 { x: 28.3; y: 92.5; skew-x: 2.3; skew-y: 2.3; }
        frame 27 { x: 27.9; y: 92.8; skew-x: 1.5; skew-y: 1.5; }
        frame 28 { x: 27.6; y: 93.3; skew-x: 0.8; skew-y: 0.8; }
        frame 29 { x: 27.2; y: 93.6; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 28.8; y: 92.7; skew-x: 3.3; skew-y: 3.3; scale-x: 0.747; scale-y: 0.747; }
        frame 32 { x: 28.4; y: 93.5; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 28.1; y: 94.3; skew-x: -2.2; skew-y: -2.2; }
        frame 34 { x: 28; y: 95.2; skew-x: -4.9; skew-y: -4.9; }
        frame 35 { x: 30.2; y: 95.6; skew-x: -7.9; skew-y: -7.9; }
        frame 36 { x: 32.5; y: 95.9; skew-x: -10.9; skew-y: -10.9; }
        frame 37 { x: 34.3; y: 95.3; skew-x: -8.7; skew-y: -8.7; scale-x: 0.746; scale-y: 0.746; }
        frame 38 { x: 36.1; y: 94.7; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 37.4; y: 94.1; skew-x: -3.9; skew-y: -3.9; }
        frame 40 { x: 36; y: 95.9; skew-x: -9.7; skew-y: -9.7; }
        frame 41 { x: 35.1; y: 97.8; skew-x: -15.4; skew-y: -15.4; scale-x: 0.745; scale-y: 0.745; }
        frame 42 { x: 34.1; y: 99.8; skew-x: -21.3; skew-y: -21.3; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 32.6; y: 101.3; skew-x: -27.7; skew-y: -27.7; scale-x: 0.744; scale-y: 0.744; }
        frame 44 { x: 31.3; y: 102.8; skew-x: -34.1; skew-y: -34.1; scale-x: 0.745; scale-y: 0.745; }
        frame 45 { x: 28.2; y: 97.9; skew-x: -21.4; skew-y: -21.4; scale-x: 0.743; scale-y: 0.743; }
        frame 46 { x: 26.4; y: 93.4; skew-x: -8.8; skew-y: -8.8; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 27; y: 93.6; skew-x: -4.2; skew-y: -4.2; scale-x: 0.745; scale-y: 0.745; }
        frame 48 { x: 27.2; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 49 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 27.1; y: 93.5; skew-x: -0.4; skew-y: -0.4; }
        frame 51 { x: -10000; y: -10000; skew-x: -0.9; skew-y: -0.9; }
        frame 52 { x: 27; y: 93.3; skew-x: -1.4; skew-y: -1.4; scale-x: 0.747; scale-y: 0.747; }
        frame 53 { x: -10000; y: -10000; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 26.9; y: 93.1; skew-x: -2.4; skew-y: -2.4; }
        frame 55 { x: 27.9; y: 92.7; skew-x: -0.2; skew-y: -0.2; }
        frame 56 { x: 28.7; y: 92.4; skew-x: 1.5; skew-y: 1.5; }
        frame 57 { x: 29.7; y: 92.1; skew-x: 3.5; skew-y: 3.5; }
        frame 58 { x: 30.7; y: 91.8; skew-x: 5.8; skew-y: 5.8; }
        frame 59 { x: 30; y: 92.2; skew-x: 4.5; skew-y: 4.5; }
        frame 60 { x: 29.3; y: 92.6; skew-x: 3.3; skew-y: 3.3; }
        frame 61 { x: 28.6; y: 92.9; skew-x: 2.3; skew-y: 2.3; }
        frame 62 { x: 28; y: 93.3; skew-x: 1; skew-y: 1; scale-x: 0.748; scale-y: 0.748; }
        frame 63 { x: 27.2; y: 93.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 26.7; y: 92.6; skew-x: -1.4; skew-y: -1.4; scale-x: 0.747; scale-y: 0.782; }
        frame 74 { x: 26.2; y: 91.6; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: 0.817; }
        frame 75 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: 0.816; }
        frame 76 { scale-y: 0.817; }
        frame 77 { x: 26.6; y: 91.4; skew-x: -1.7; skew-y: -1.7; scale-y: 0.816; }
        frame 78 { x: 26.9; y: 91.2; skew-x: -0.2; skew-y: -0.2; scale-y: -10000; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 27.2; y: 93.6; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 81 { x: 26.9; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 26.5; y: 93.5; skew-x: 0.3; skew-y: 0.3; scale-x: 0.747; scale-y: 0.747; }
        frame 83 { x: 26.2; y: 93.3; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 26; y: 93.2; skew-x: 0.7; skew-y: 0.7; }
        frame 85 { x: 21.8; y: 98.3; skew-x: -18.7; skew-y: -18.7; scale-x: 0.746; scale-y: 0.766; }
        frame 86 { x: 19.6; y: 104.3; skew-x: -38.3; skew-y: -38.3; scale-x: 0.744; scale-y: 0.784; }
        frame 87 { x: 19.8; y: 110.4; skew-x: -57.8; skew-y: -57.8; scale-x: -10000; scale-y: 0.804; }
        frame 88 { x: 22.3; y: 116; skew-x: -77.4; skew-y: -77.4; scale-y: 0.824; }
        frame 89 { x: 29.7; y: 112.9; skew-x: -105; skew-y: -105; scale-x: 0.742; scale-y: 0.821; }
        frame 90 { x: 39.4; y: 105.3; skew-x: -132.8; skew-y: -132.8; scale-x: 0.741; scale-y: 0.82; }
        frame 91 { x: 39.9; y: -10000; skew-x: -140.3; skew-y: -140.3; scale-x: 0.739; scale-y: 0.819; }
        frame 92 { x: 40.3; y: 105; skew-x: -147.8; skew-y: -147.8; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 40.5; y: 104.3; skew-x: -155.4; skew-y: -155.4; scale-x: 0.74; }
        frame 94 { x: 40.6; y: 103.3; skew-x: -162.9; skew-y: -162.9; scale-x: -10000; scale-y: 0.82; }
        frame 95 { x: 35.1; y: 124.1; skew-x: -137.6; skew-y: -137.6; scale-x: 0.738; scale-y: 0.818; }
        frame 96 { x: 29; y: 140.7; skew-x: -112.3; skew-y: -112.3; scale-x: 0.739; scale-y: -10000; }
        frame 97 { x: 30; y: 140.9; skew-x: -113; skew-y: -111.5; scale-x: 0.728; scale-y: 0.827; }
        frame 98 { x: 30.8; y: 141.3; skew-x: -113.9; skew-y: -110.9; scale-x: 0.719; scale-y: 0.839; }
        frame 99 { x: 29.9; y: 140.9; skew-x: -113; skew-y: -111.5; scale-x: 0.728; scale-y: 0.827; }
        frame 100 { x: 29; y: 140.7; skew-x: -112.3; skew-y: -112.3; scale-x: 0.739; scale-y: 0.818; }
        frame 101 { y: 140.6; skew-x: -112.2; skew-y: -112.2; scale-x: 0.738; scale-y: 0.817; }
        frame 102 { y: 140.7; skew-x: -112.3; skew-y: -112.3; scale-x: 0.739; scale-y: 0.818; }
    }
    Track {
        source-name: "zombie_jackbox_innerleg_upper";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 41.7; y: 75.6; scale-x: 0.748; scale-y: 0.748; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_INNERLEG_UPPER; }
        frame 14 { x: 41.5; y: 75.7; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 41.4; y: 75.8; skew-x: -0.9; skew-y: -0.9; scale-x: 0.747; scale-y: 0.747; }
        frame 16 { x: 41; y: 76.1; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 39.9; y: 76.8; skew-x: -5.7; skew-y: -5.7; }
        frame 18 { x: 39.3; y: 77.3; skew-x: -7.4; skew-y: -7.4; }
        frame 19 { x: 38.9; y: 77.6; skew-x: -8.7; skew-y: -8.7; }
        frame 20 { x: -10000; y: -10000; skew-x: -8.9; skew-y: -8.9; }
        frame 21 { x: 38.8; y: 77.7; skew-x: -9.4; skew-y: -9.4; }
        frame 22 { x: 39.1; y: 77.4; skew-x: -8.2; skew-y: -8.2; }
        frame 23 { x: 39.5; y: 77.2; skew-x: -6.9; skew-y: -6.9; }
        frame 24 { x: 39.9; y: 76.8; skew-x: -5.7; skew-y: -5.7; }
        frame 25 { x: 40.3; y: 76.6; skew-x: -4.4; skew-y: -4.4; }
        frame 26 { x: 40.6; y: 76.4; skew-x: -3.4; skew-y: -3.4; }
        frame 27 { x: 41; y: 76.1; skew-x: -2.2; skew-y: -2.2; }
        frame 28 { x: 41.4; y: 75.8; skew-x: -0.9; skew-y: -0.9; }
        frame 29 { x: 41.7; y: 75.6; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 41; y: 77.2; skew-x: -4.7; skew-y: -4.7; scale-x: 0.747; scale-y: 0.747; }
        frame 32 { x: 41.9; y: 76.3; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 42.9; y: 75.5; skew-x: 2.5; skew-y: 2.5; }
        frame 34 { x: 43.9; y: 74.7; skew-x: 6.3; skew-y: 6.3; }
        frame 35 { x: 43.6; y: 75.6; skew-x: 0; skew-y: 0; }
        frame 36 { x: 43.5; y: 76.8; skew-x: -6.4; skew-y: -6.4; }
        frame 37 { x: 44.7; y: 77; skew-x: -9.7; skew-y: -9.7; scale-x: 0.746; scale-y: 0.746; }
        frame 38 { x: 45.8; y: 77.2; skew-x: -13.3; skew-y: -13.3; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 45.4; y: 79; skew-x: -16.1; skew-y: -16.1; }
        frame 40 { x: 44.7; y: 78.8; skew-x: -14.7; skew-y: -14.7; scale-x: 0.745; scale-y: 0.745; }
        frame 41 { x: 44.1; y: 78.5; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 43.4; y: 78.3; skew-x: -12; skew-y: -12; scale-x: 0.746; scale-y: 0.746; }
        frame 43 { x: 43.5; y: 76.9; skew-x: -4.9; skew-y: -4.9; scale-x: 0.745; scale-y: 0.745; }
        frame 44 { x: 43.9; y: 75.7; skew-x: 1.9; skew-y: 1.9; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 43.5; y: 73.6; skew-x: 3.8; skew-y: 3.8; }
        frame 46 { x: 43.3; y: 71.6; skew-x: 5.9; skew-y: 5.9; }
        frame 47 { x: 42.5; y: 73.7; skew-x: 2.8; skew-y: 2.8; scale-x: 0.746; scale-y: 0.746; }
        frame 48 { x: 41.7; y: 75.6; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 42; y: 75.2; skew-x: 0.3; skew-y: 0.3; }
        frame 51 { x: 42.4; y: 74.7; skew-x: 0.8; skew-y: 0.8; }
        frame 52 { x: 42.6; y: 74.2; skew-x: 1.1; skew-y: 1.1; }
        frame 53 { x: 43; y: 73.7; skew-x: 1.5; skew-y: 1.5; scale-x: 0.747; scale-y: 0.747; }
        frame 54 { x: 43.3; y: 73.3; skew-x: 2; skew-y: 2; scale-x: 0.748; scale-y: 0.748; }
        frame 55 { x: 42.5; y: 74.3; skew-x: -0.5; skew-y: -0.5; scale-x: 0.747; scale-y: 0.747; }
        frame 56 { x: 41.8; y: 75.5; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 41; y: 76.6; skew-x: -6.2; skew-y: -6.2; }
        frame 58 { x: 40.4; y: 77.8; skew-x: -9; skew-y: -9; }
        frame 59 { x: 40.5; y: 77.3; skew-x: -7.2; skew-y: -7.2; }
        frame 60 { x: 40.9; y: 76.8; skew-x: -5.2; skew-y: -5.2; }
        frame 61 { x: 41.1; y: 76.4; skew-x: -3.4; skew-y: -3.4; }
        frame 62 { x: 41.4; y: 76; skew-x: -1.7; skew-y: -1.7; }
        frame 63 { x: 41.7; y: 75.6; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 43.2; y: 72.3; skew-x: 3.5; skew-y: 3.5; scale-x: 0.747; scale-y: 0.747; }
        frame 74 { x: 44.6; y: 69; skew-x: 7.1; skew-y: 7.1; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -10000; y: -10000; skew-x: 7; skew-y: 7; }
        frame 76 { skew-x: 7.1; skew-y: 7.1; }
        frame 77 { y: 69.8; skew-x: 7; skew-y: 7; }
        frame 78 { y: 70.7; skew-x: 7.1; skew-y: 7.1; }
        frame 79 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 41.7; y: 75.6; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 81 { x: 38.2; y: 77.3; skew-x: -6.2; skew-y: -6.2; scale-x: 0.747; scale-y: 0.747; }
        frame 82 { x: 34.8; y: 79.1; skew-x: -12.7; skew-y: -12.7; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 31.5; y: 81.1; skew-x: -19; skew-y: -19; scale-x: 0.746; scale-y: 0.746; }
        frame 84 { x: 28.3; y: 83.2; skew-x: -25.5; skew-y: -25.5; scale-x: 0.747; scale-y: 0.747; }
        frame 85 { x: 23.7; y: 84.1; skew-x: -30.2; skew-y: -30.2; scale-x: 0.745; scale-y: 0.745; }
        frame 86 { x: 19.1; y: 85.1; skew-x: -35; skew-y: -35; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 14.7; y: 86.1; skew-x: -39.8; skew-y: -39.8; }
        frame 88 { x: 10.5; y: 87.1; skew-x: -44.6; skew-y: -44.6; scale-x: 0.746; scale-y: 0.746; }
        frame 89 { x: 6.4; y: 93.7; skew-x: -69.9; skew-y: -69.9; scale-x: 0.744; scale-y: 0.778; }
        frame 90 { x: 5.1; y: 99.8; skew-x: -95.2; skew-y: -95.2; scale-x: 0.743; scale-y: 0.813; }
        frame 91 { x: -10000; y: 103.3; skew-x: -102; skew-y: -102; scale-x: -10000; scale-y: 0.821; }
        frame 92 { x: 5.5; y: 106.6; skew-x: -108.9; skew-y: -108.9; scale-x: 0.742; scale-y: 0.829; }
        frame 93 { x: 5.8; y: 109.8; skew-x: -115.9; skew-y: -115.9; scale-x: -10000; scale-y: 0.837; }
        frame 94 { x: 6.2; y: 112.8; skew-x: -122.9; skew-y: -122.9; scale-y: 0.847; }
        frame 95 { x: 2; y: 119.8; skew-x: -104.2; skew-y: -104.2; scale-x: 0.741; scale-y: 0.845; }
        frame 96 { x: -0.7; y: 125.6; skew-x: -85.5; skew-y: -85.5; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: -0.3; y: 126.3; skew-x: -85.4; skew-y: -85.8; scale-x: 0.727; scale-y: 0.86; }
        frame 98 { x: 0; y: 126.8; skew-x: -85.2; skew-y: -10000; scale-x: 0.713; scale-y: 0.875; }
        frame 99 { x: -0.3; y: 126.3; skew-x: -85.4; scale-x: 0.727; scale-y: 0.86; }
        frame 100 { x: -0.7; y: 125.6; skew-x: -85.5; skew-y: -85.5; scale-x: 0.741; scale-y: 0.845; }
        frame 101 { x: -10000; y: -10000; skew-x: -85.6; skew-y: -85.6; scale-x: -10000; scale-y: -10000; }
        frame 102 { skew-x: -85.5; skew-y: -85.5; }
    }
    Track {
        source-name: "Zombie_jackbox_body2";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 38.4; y: 59.7; scale-x: 0.748; scale-y: 0.748; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_BODY2; }
        frame 14 { x: -10000; y: 59.8; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { y: 59.9; }
        frame 16 { y: 60.1; }
        frame 17 { x: 38.3; y: 60.8; skew-x: -0.2; skew-y: -0.2; }
        frame 18 { x: 38.4; y: 61.1; skew-x: -10000; skew-y: -10000; }
        frame 19 { x: -10000; y: 61.4; }
        frame 20 { y: 61.5; }
        frame 21 { x: 38.2; y: -10000; skew-x: -0.5; skew-y: -0.5; }
        frame 22 { x: 38.4; y: 61.2; skew-x: -0.2; skew-y: -0.2; }
        frame 23 { x: 38.3; y: 61; skew-x: -10000; skew-y: -10000; }
        frame 24 { x: 38.4; y: 60.7; skew-x: -0; skew-y: -0; }
        frame 25 { x: 38.5; y: 60.5; skew-x: 0; skew-y: 0; }
        frame 26 { x: -10000; y: 60.3; skew-x: -10000; skew-y: -10000; }
        frame 27 { x: 38.4; y: 60.1; }
        frame 28 { x: -10000; y: 59.9; }
        frame 29 { y: 59.7; }
        frame 30 { y: -10000; }
        frame 31 { y: 60.2; }
        frame 32 { y: 59.6; }
        frame 33 { y: 59; }
        frame 34 { y: 58.5; }
        frame 35 { x: 38.2; y: 58.2; skew-x: 0.5; skew-y: 0.5; }
        frame 36 { x: 38; y: 57.9; skew-x: 1; skew-y: 1; }
        frame 37 { x: 37.7; y: 59.4; skew-x: 2; skew-y: 2; scale-x: 0.747; scale-y: 0.747; }
        frame 38 { x: 37.2; y: 60.9; skew-x: 3.1; skew-y: 3.1; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 36.8; y: 64.8; skew-x: -2.1; skew-y: -2.1; }
        frame 40 { x: 37.3; y: 63; skew-x: -1.2; skew-y: -1.2; }
        frame 41 { x: 37.9; y: 61.3; skew-x: -0.5; skew-y: -0.5; }
        frame 42 { x: 38.4; y: 59.7; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 43 { x: -10000; y: 59.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { y: 58.5; }
        frame 45 { x: 38.2; y: 58.2; skew-x: 0.5; skew-y: 0.5; }
        frame 46 { x: 38; y: 57.9; skew-x: 1; skew-y: 1; }
        frame 47 { x: 38.2; y: 58.8; skew-x: 0.5; skew-y: 0.5; }
        frame 48 { x: 38.4; y: 59.7; skew-x: 0; skew-y: 0; }
        frame 49 { x: 36.9; y: 62.3; skew-x: -5.2; skew-y: -5.2; scale-x: 0.747; scale-y: 0.747; }
        frame 50 { x: 38.5; y: 60; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 40; y: 58; skew-x: 1.5; skew-y: 1.5; }
        frame 52 { x: 41.8; y: 55.9; skew-x: 5; skew-y: 5; }
        frame 53 { x: 43.6; y: 53.9; skew-x: 8.5; skew-y: 8.5; }
        frame 54 { x: 45.5; y: 51.9; skew-x: 12.1; skew-y: 12.1; }
        frame 55 { x: 43.8; y: 53.8; skew-x: 9.5; skew-y: 9.5; }
        frame 56 { x: 42; y: 55.6; skew-x: 7; skew-y: 7; }
        frame 57 { x: 40.4; y: 57.6; skew-x: 4.5; skew-y: 4.5; }
        frame 58 { x: 38.8; y: 59.6; skew-x: 2; skew-y: 2; scale-x: 0.748; scale-y: 0.748; }
        frame 59 { x: 38.7; y: 59.7; skew-x: 1.5; skew-y: 1.5; scale-x: 0.747; scale-y: 0.747; }
        frame 60 { x: 38.5; y: -10000; skew-x: 1.1; skew-y: 1.1; scale-x: 0.748; scale-y: 0.748; }
        frame 61 { x: -10000; y: 59.6; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 62 { y: 59.8; skew-x: 0.3; skew-y: 0.3; }
        frame 63 { x: 38.4; y: 59.7; skew-x: 0; skew-y: 0; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 40.7; y: 56.3; skew-x: 3.5; skew-y: 3.5; scale-x: 0.747; scale-y: 0.747; }
        frame 74 { x: 43.3; y: 52.8; skew-x: 7.1; skew-y: 7.1; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 43.8; y: 52.4; skew-x: 8.3; skew-y: 8.3; }
        frame 76 { x: 44.3; y: 51.9; skew-x: 9.6; skew-y: 9.6; }
        frame 77 { x: 43.6; y: 53.2; skew-x: 8.3; skew-y: 8.3; }
        frame 78 { x: 43.3; y: 54.5; skew-x: 7.1; skew-y: 7.1; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 38.4; y: 59.7; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 81 { x: 33.9; y: 62.8; skew-x: -5.9; skew-y: -5.9; scale-x: 0.747; scale-y: 0.747; }
        frame 82 { x: 29.6; y: 66.2; skew-x: -11.9; skew-y: -11.9; scale-x: 0.746; scale-y: 0.746; }
        frame 83 { x: 25.5; y: 69.6; skew-x: -18; skew-y: -18; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 21.6; y: 73.3; skew-x: -24.2; skew-y: -24.2; }
        frame 85 { x: 16.2; y: 74.8; skew-x: -29; skew-y: -29; scale-x: 0.745; scale-y: 0.745; }
        frame 86 { x: 10.9; y: 76.5; skew-x: -33.7; skew-y: -33.7; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 5.8; y: 78.2; skew-x: -38.5; skew-y: -38.5; scale-x: 0.744; scale-y: 0.744; }
        frame 88 { x: 0.9; y: 79.8; skew-x: -43.2; skew-y: -43.2; scale-x: 0.745; scale-y: 0.745; }
        frame 89 { x: -4.9; y: 92.5; skew-x: -66.1; skew-y: -66.1; scale-x: 0.743; scale-y: 0.743; }
        frame 90 { x: -7.1; y: 103.7; skew-x: -88.9; skew-y: -88.9; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -6.9; y: 108.4; skew-x: -95.2; skew-y: -95.2; }
        frame 92 { x: -6.5; y: 113; skew-x: -101.4; skew-y: -101.4; scale-x: 0.742; scale-y: 0.742; }
        frame 93 { x: -6.1; y: 117.3; skew-x: -107.7; skew-y: -107.7; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: -5.4; y: 121.5; skew-x: -114; skew-y: -114; scale-x: 0.743; scale-y: 0.743; }
        frame 95 { x: -14.6; y: 123.1; skew-x: -87.4; skew-y: -89.9; scale-x: 0.741; scale-y: -10000; }
        frame 96 { x: -20.5; y: 121.1; skew-x: -60.6; skew-y: -65.9; scale-x: -10000; scale-y: 0.744; }
        frame 97 { x: -20.4; y: 121.8; skew-x: -59.8; skew-y: -66.8; scale-x: 0.732; scale-y: 0.752; }
        frame 98 { x: -10000; y: 122.5; skew-x: -58.8; skew-y: -67.4; scale-x: 0.726; scale-y: 0.761; }
        frame 99 { y: 121.8; skew-x: -59.8; skew-y: -66.8; scale-x: 0.732; scale-y: 0.752; }
        frame 100 { x: -20.5; y: 121.1; skew-x: -60.6; skew-y: -65.9; scale-x: 0.741; scale-y: 0.744; }
        frame 101 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.74; scale-y: 0.743; }
        frame 102 { scale-x: 0.741; scale-y: 0.744; }
    }
    Track {
        source-name: "zombie_jackbox_outerleg_foot";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 48.4; y: 113.5; scale-x: 0.748; scale-y: 0.748; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERLEG_FOOT; }
        frame 14 { x: 48.3; y: 113.6; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: -10000; y: 113.8; skew-x: -0.7; skew-y: -0.7; }
        frame 16 { x: 48.1; y: 114; skew-x: -1.4; skew-y: -1.4; scale-x: 0.747; scale-y: 0.747; }
        frame 17 { x: 47.8; y: 114.6; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 47.6; y: 114.9; skew-x: -5.2; skew-y: -5.2; }
        frame 19 { x: -10000; y: 115.1; skew-x: -6.2; skew-y: -6.2; }
        frame 20 { x: 47.7; y: 115; skew-x: -10000; skew-y: -10000; }
        frame 21 { x: 47.5; y: 115.2; skew-x: -6.7; skew-y: -6.7; }
        frame 22 { x: -10000; y: 115; skew-x: -5.7; skew-y: -5.7; }
        frame 23 { x: 47.6; y: 114.8; skew-x: -4.9; skew-y: -4.9; }
        frame 24 { x: 47.8; y: 114.5; skew-x: -3.9; skew-y: -3.9; }
        frame 25 { x: 47.9; y: 114.3; skew-x: -3.2; skew-y: -3.2; }
        frame 26 { x: 48; y: 114.2; skew-x: -2.4; skew-y: -2.4; }
        frame 27 { x: 48.1; y: 114; skew-x: -1.4; skew-y: -1.4; }
        frame 28 { x: 48.3; y: 113.8; skew-x: -0.7; skew-y: -0.7; scale-x: 0.748; scale-y: 0.748; }
        frame 29 { x: 48.4; y: 113.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 32 { x: 47.5; y: 113.6; skew-x: -1.9; skew-y: -1.9; scale-x: 0.747; scale-y: 0.747; }
        frame 33 { x: 46.8; y: 113.5; skew-x: -4; skew-y: -4; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 45.8; y: -10000; skew-x: -6.3; skew-y: -6.3; }
        frame 35 { x: 41.9; y: 110.1; skew-x: 1.3; skew-y: 1.3; }
        frame 36 { x: 38.4; y: 106.8; skew-x: 9.1; skew-y: 9.1; }
        frame 37 { x: 38.5; y: 108.8; skew-x: 8.5; skew-y: 8.5; scale-x: 0.746; scale-y: 0.746; }
        frame 38 { x: 38.8; y: 110.8; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 39.3; y: 111; skew-x: 7.8; skew-y: 7.8; }
        frame 40 { x: 40.6; y: 111.1; skew-x: -10000; skew-y: -10000; }
        frame 41 { x: 41.9; y: -10000; }
        frame 42 { x: 43; y: 111; }
        frame 43 { x: 44.9; y: 111.1; }
        frame 44 { x: 46.8; y: 111; }
        frame 45 { x: 46.5; y: 111.4; skew-x: 5.8; skew-y: 5.8; }
        frame 46 { x: 46.1; y: 111.8; skew-x: 4; skew-y: 4; }
        frame 47 { x: 47.2; y: 112.7; skew-x: 2; skew-y: 2; scale-x: 0.747; scale-y: 0.747; }
        frame 48 { x: 48.4; y: 113.5; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 48.3; y: 113.6; skew-x: -0.7; skew-y: -0.7; }
        frame 51 { x: 48.1; y: 113.8; skew-x: -1.7; skew-y: -1.7; scale-x: 0.747; scale-y: 0.747; }
        frame 52 { x: 48; y: 114; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 47.8; y: 114.1; skew-x: -3.7; skew-y: -3.7; }
        frame 54 { x: 47.6; y: 114.2; skew-x: -4.7; skew-y: -4.7; }
        frame 55 { x: 47.8; y: 114; skew-x: -3.4; skew-y: -3.4; }
        frame 56 { x: 48; y: 113.8; skew-x: -2.2; skew-y: -2.2; }
        frame 57 { x: 48.1; y: 113.7; skew-x: -0.9; skew-y: -0.9; scale-x: 0.748; scale-y: 0.748; }
        frame 58 { x: 48.4; y: 113.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 47.9; y: 114; skew-x: -3.2; skew-y: -3.2; scale-x: 0.747; scale-y: 0.747; }
        frame 74 { x: 47.5; y: 114.6; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 77 { x: 47.7; y: 114.4; skew-x: -4.7; skew-y: -4.7; }
        frame 78 { x: 48; y: 114.2; skew-x: -2.9; skew-y: -2.9; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 48.4; y: 113.5; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 81 { x: 48; y: 114; skew-x: -2.7; skew-y: -2.7; scale-x: 0.747; scale-y: 0.747; }
        frame 82 { x: 47.6; y: 114.4; skew-x: -5.4; skew-y: -5.4; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 47.3; y: 114.8; skew-x: -8.2; skew-y: -8.2; }
        frame 84 { x: 47; y: 115.3; skew-x: -11.2; skew-y: -11.2; }
        frame 85 { x: 45.3; y: 114.8; skew-x: -20.5; skew-y: -20.5; scale-x: 0.746; scale-y: 0.746; }
        frame 86 { x: 44.2; y: 114.2; skew-x: -30; skew-y: -30; scale-x: 0.745; scale-y: 0.745; }
        frame 87 { x: 43.5; y: 113.6; skew-x: -39.3; skew-y: -39.3; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: -10000; y: 112.8; skew-x: -48.7; skew-y: -48.7; scale-x: 0.746; scale-y: 0.746; }
        frame 89 { x: 49; y: 102.4; skew-x: -95.7; skew-y: -95.7; scale-x: 0.743; scale-y: 0.743; }
        frame 90 { x: 58.7; y: 80.3; skew-x: -142.8; skew-y: -142.8; scale-x: 0.741; scale-y: 0.741; }
        frame 91 { x: 55.1; y: 76.8; skew-x: -151.6; skew-y: -151.6; scale-x: 0.74; scale-y: 0.74; }
        frame 92 { x: 51.4; y: 73; skew-x: -160.3; skew-y: -160.3; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 47.3; y: 68.8; skew-x: -169.1; skew-y: -169.1; }
        frame 94 { x: 43; y: 64.6; skew-x: -177.6; skew-y: -177.6; }
        frame 95 { x: 45; y: 106; skew-x: -148; skew-y: -148; scale-x: 0.736; scale-y: 0.736; }
        frame 96 { x: 44.3; y: 143.2; skew-x: -118.2; skew-y: -118.2; scale-x: 0.733; scale-y: 0.733; }
        frame 97 { x: 45.5; y: 143.5; skew-x: -119; skew-y: -117.2; scale-x: 0.724; scale-y: 0.739; }
        frame 98 { x: 46.6; y: 143.8; skew-x: -120; skew-y: -116.5; scale-x: 0.718; scale-y: 0.747; }
        frame 99 { x: 46.7; y: 141.9; skew-x: -122.7; skew-y: -121; scale-x: 0.724; scale-y: 0.739; }
        frame 100 { x: 46.8; y: 140; skew-x: -125.3; skew-y: -125.3; scale-x: 0.733; scale-y: 0.733; }
        frame 101 { x: 47.7; y: 140.9; skew-x: -128.2; skew-y: -128.2; scale-x: 0.732; scale-y: 0.732; }
        frame 102 { x: 48.7; y: 141.9; skew-x: -131.1; skew-y: -131.1; scale-x: 0.733; scale-y: 0.733; }
    }
    Track {
        source-name: "zombie_jackbox_outerleg_lower";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 57.6; y: 92.8; scale-x: 0.748; scale-y: 0.748; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERLEG_LOWER; }
        frame 14 { x: 57.4; y: -10000; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 57; skew-x: -0.7; skew-y: -0.7; }
        frame 16 { x: 56.4; skew-x: -1.7; skew-y: -1.7; scale-x: 0.747; scale-y: 0.747; }
        frame 17 { x: 54.6; skew-x: -4.4; skew-y: -4.4; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 53.8; y: 92.9; skew-x: -5.7; skew-y: -5.7; }
        frame 19 { x: 53.1; y: 93; skew-x: -6.7; skew-y: -6.7; }
        frame 20 { x: 53; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 21 { x: 52.9; skew-x: -7.2; skew-y: -7.2; }
        frame 22 { x: 53.5; skew-x: -6.2; skew-y: -6.2; }
        frame 23 { x: 54; y: 92.9; skew-x: -5.2; skew-y: -5.2; }
        frame 24 { x: 54.6; y: 92.8; skew-x: -4.2; skew-y: -4.2; }
        frame 25 { x: 55.3; y: 92.9; skew-x: -3.4; skew-y: -3.4; }
        frame 26 { x: 55.9; y: 92.8; skew-x: -2.4; skew-y: -2.4; }
        frame 27 { x: 56.5; y: -10000; skew-x: -1.7; skew-y: -1.7; }
        frame 28 { x: 57.1; skew-x: -0.7; skew-y: -0.7; }
        frame 29 { x: 57.6; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 30 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 56.2; y: 93.9; skew-x: -3.2; skew-y: -3.2; scale-x: 0.747; scale-y: 0.747; }
        frame 32 { x: 55.2; y: 93.1; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 54.3; y: 92.3; skew-x: -4.2; skew-y: -4.2; }
        frame 34 { x: 53.2; y: 91.7; skew-x: -4.9; skew-y: -4.9; }
        frame 35 { x: 52; y: 89.6; skew-x: 1.7; skew-y: 1.7; }
        frame 36 { x: 51; y: 87.8; skew-x: 8.5; skew-y: 8.5; }
        frame 37 { x: 49.5; y: 89.8; skew-x: 4.8; skew-y: 4.8; scale-x: 0.746; scale-y: 0.746; }
        frame 38 { x: 48.2; y: 91.8; skew-x: 1.2; skew-y: 1.2; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 46.6; y: 92.4; skew-x: -3.7; skew-y: -3.7; }
        frame 40 { x: 48.4; y: 91.7; skew-x: -1.4; skew-y: -1.4; }
        frame 41 { x: 50; y: 91.1; skew-x: 0.5; skew-y: 0.5; }
        frame 42 { x: 51.6; y: 90.3; skew-x: 2.7; skew-y: 2.7; }
        frame 43 { x: 53.6; y: 90.1; skew-x: 4.6; skew-y: 4.6; scale-x: 0.745; scale-y: 0.745; }
        frame 44 { x: 56; y: 89.7; skew-x: 6.7; skew-y: 6.7; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 56.5; y: 89.3; skew-x: 8; skew-y: 8; }
        frame 46 { x: 57.1; y: 89; skew-x: 9.3; skew-y: 9.3; }
        frame 47 { x: 57.3; y: 90.8; skew-x: 4.5; skew-y: 4.5; scale-x: 0.746; scale-y: 0.746; }
        frame 48 { x: 57.6; y: 92.8; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 58; y: 92.5; skew-x: 0.8; skew-y: 0.8; }
        frame 51 { x: 58.4; y: 92.1; skew-x: 1.5; skew-y: 1.5; scale-x: 0.747; scale-y: 0.747; }
        frame 52 { x: 58.9; y: 91.7; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 59.3; y: 91.4; skew-x: 3.3; skew-y: 3.3; }
        frame 54 { x: 59.7; y: 91; skew-x: 4.2; skew-y: 4.2; }
        frame 55 { x: 58.2; y: 91.7; skew-x: 1.3; skew-y: 1.3; }
        frame 56 { x: 56.9; y: 92.4; skew-x: -1.4; skew-y: -1.4; }
        frame 57 { x: 55.5; y: 93.2; skew-x: -4.4; skew-y: -4.4; }
        frame 58 { x: 54.1; y: 94.1; skew-x: -7.4; skew-y: -7.4; }
        frame 59 { x: 54.8; y: 93.8; skew-x: -5.9; skew-y: -5.9; }
        frame 60 { x: 55.5; y: 93.5; skew-x: -4.4; skew-y: -4.4; }
        frame 61 { x: 56.3; y: 93.3; skew-x: -2.9; skew-y: -2.9; }
        frame 62 { x: 57; y: 93.1; skew-x: -1.4; skew-y: -1.4; }
        frame 63 { x: 57.6; y: 92.8; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 58.5; y: 90.7; skew-x: 4; skew-y: 4; scale-x: 0.747; scale-y: 0.747; }
        frame 74 { x: 59.5; y: 88.5; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 77 { x: 59.3; y: 89.4; skew-x: 6.1; skew-y: 6.1; }
        frame 78 { x: 59.1; y: 90.3; skew-x: 4.5; skew-y: 4.5; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 57.6; y: 92.8; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 81 { x: 55; y: 92.9; skew-x: -4; skew-y: -4; scale-x: 0.747; scale-y: 0.747; }
        frame 82 { x: 52.3; y: 93; skew-x: -8.2; skew-y: -8.2; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 49.6; y: 93.2; skew-x: -12.4; skew-y: -12.4; }
        frame 84 { x: 47.3; y: 93.5; skew-x: -16.7; skew-y: -16.7; }
        frame 85 { x: 42.8; y: 93; skew-x: -25.2; skew-y: -25.2; scale-x: 0.746; scale-y: 0.746; }
        frame 86 { x: 38.6; y: 92.6; skew-x: -33.7; skew-y: -33.7; scale-x: 0.745; scale-y: 0.745; }
        frame 87 { x: 35.1; y: 92.3; skew-x: -42.3; skew-y: -42.3; scale-x: -10000; scale-y: -10000; }
        frame 88 { x: 32; y: 92.2; skew-x: -50.8; skew-y: -50.8; }
        frame 89 { x: 26.6; y: 93.5; skew-x: -86.3; skew-y: -86.3; scale-x: 0.743; scale-y: 0.743; }
        frame 90 { x: 27.8; y: 88.5; skew-x: -121.5; skew-y: -121.5; scale-x: 0.742; scale-y: 0.742; }
        frame 91 { x: 26.4; y: 89.4; skew-x: -131; skew-y: -131; scale-x: 0.74; scale-y: 0.74; }
        frame 92 { x: 25; y: 89.6; skew-x: -140.5; skew-y: -140.5; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 23.4; y: 89.1; skew-x: -150.1; skew-y: -150.1; }
        frame 94 { x: 21.8; y: 88.3; skew-x: -159.5; skew-y: -159.5; scale-x: 0.741; scale-y: 0.741; }
        frame 95 { x: 15.3; y: 114.1; skew-x: -119.5; skew-y: -119.5; scale-x: 0.736; scale-y: 0.736; }
        frame 96 { x: 11.9; y: 128.8; skew-x: -79.7; skew-y: -79.7; scale-x: 0.734; scale-y: 0.734; }
        frame 97 { x: 12.5; y: 129.3; skew-x: -79.4; skew-y: -80.1; scale-x: 0.72; scale-y: 0.745; }
        frame 98 { x: 13.1; y: 129.9; skew-x: -79; skew-y: -80.5; scale-x: 0.707; scale-y: 0.758; }
        frame 99 { x: 12.9; y: 129.8; skew-x: -82.9; skew-y: -83.6; scale-x: 0.72; scale-y: 0.745; }
        frame 100 { x: 12.8; y: 129.6; skew-x: -86.8; skew-y: -86.8; scale-x: 0.733; scale-y: 0.733; }
        frame 101 { x: 12.2; y: 129.8; skew-x: -83.4; skew-y: -83.4; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 11.6; y: -10000; skew-x: -79.8; skew-y: -79.8; }
    }
    Track {
        source-name: "zombie_jackbox_outerleg_upper";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 56.4; y: 73.5; scale-x: 0.748; scale-y: 0.748; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERLEG_UPPER; }
        frame 14 { x: 56.5; y: -10000; skew-x: 0.8; skew-y: 0.8; scale-x: 0.747; scale-y: 0.747; cel: -10000; image: none; }
        frame 15 { x: -10000; y: 73.3; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 56.6; y: 73; skew-x: 3; skew-y: 3; }
        frame 17 { x: 57.1; y: 72.3; skew-x: 7.5; skew-y: 7.5; }
        frame 18 { x: 57.4; y: 72; skew-x: 9.8; skew-y: 9.8; }
        frame 19 { x: 57.5; y: 71.7; skew-x: 11.3; skew-y: 11.3; scale-x: 0.746; scale-y: 0.746; }
        frame 20 { x: -10000; y: -10000; skew-x: 11.5; skew-y: 11.5; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 71.6; skew-x: 12.3; skew-y: 12.3; scale-x: 0.747; scale-y: 0.747; }
        frame 22 { x: 57.4; y: 71.9; skew-x: 10.6; skew-y: 10.6; scale-x: 0.746; scale-y: 0.746; }
        frame 23 { x: 57.1; y: 72.1; skew-x: 9.1; skew-y: 9.1; scale-x: 0.747; scale-y: 0.747; }
        frame 24 { x: 57; y: 72.3; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 56.9; y: 72.5; skew-x: 6; skew-y: 6; }
        frame 26 { x: 56.8; y: 72.8; skew-x: 4.5; skew-y: 4.5; }
        frame 27 { x: 56.5; y: 73; skew-x: 3; skew-y: 3; }
        frame 28 { x: -10000; y: 73.3; skew-x: 1.5; skew-y: 1.5; }
        frame 29 { x: 56.4; y: 73.5; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 30 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 57.4; y: 73.3; skew-x: 6; skew-y: 6; scale-x: 0.747; scale-y: 0.747; }
        frame 32 { x: 57.5; y: 72.1; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 57.7; y: 70.9; skew-x: 10.3; skew-y: 10.3; }
        frame 34 { x: 57.9; y: 69.8; skew-x: 12.4; skew-y: 12.4; }
        frame 35 { x: 58.6; y: 68.8; skew-x: 18.6; skew-y: 18.6; scale-x: 0.746; scale-y: 0.746; }
        frame 36 { x: 59.5; y: 67.8; skew-x: 25.1; skew-y: 25.1; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 58.3; y: 69.6; skew-x: 23.8; skew-y: 23.8; scale-x: 0.745; scale-y: 0.745; }
        frame 38 { x: 57.1; y: 71.4; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 59; y: 70.7; skew-x: 28.9; skew-y: 28.9; scale-x: 0.744; scale-y: 0.767; }
        frame 40 { y: 70.2; skew-x: 26.1; skew-y: 26.1; scale-x: 0.743; scale-y: 0.766; }
        frame 41 { x: -10000; y: 69.6; skew-x: 23.3; skew-y: 23.3; scale-x: -10000; scale-y: -10000; }
        frame 42 { y: 69.1; skew-x: 20.6; skew-y: 20.6; scale-x: 0.744; scale-y: 0.767; }
        frame 43 { x: 58.4; y: 69.6; skew-x: 14.8; skew-y: 14.8; scale-x: 0.743; scale-y: 0.766; }
        frame 44 { x: 57.8; y: 70.2; skew-x: 9.1; skew-y: 9.1; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 56.9; y: 70.1; skew-x: 5.8; skew-y: 5.8; }
        frame 46 { x: 56.1; y: 69.9; skew-x: 2.8; skew-y: 2.8; }
        frame 47 { x: 56.3; y: 71.8; skew-x: 1.3; skew-y: 1.3; scale-x: 0.745; scale-y: 0.757; }
        frame 48 { x: 56.4; y: 73.5; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 56.8; y: 73.2; skew-x: 0.3; skew-y: 0.3; }
        frame 51 { x: 57; y: 72.8; skew-x: 0.8; skew-y: 0.8; }
        frame 52 { x: 57.4; y: 72.5; skew-x: 1.1; skew-y: 1.1; }
        frame 53 { x: 57.8; y: 72.1; skew-x: 1.5; skew-y: 1.5; scale-x: 0.747; scale-y: 0.747; }
        frame 54 { x: 58.1; y: 71.7; skew-x: 2; skew-y: 2; scale-x: 0.748; scale-y: 0.748; }
        frame 55 { x: 57.8; y: 71.8; skew-x: 4.1; skew-y: 4.1; scale-x: 0.747; scale-y: 0.747; }
        frame 56 { x: 57.6; y: -10000; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 57.4; y: 72; skew-x: 8.5; skew-y: 8.5; }
        frame 58 { x: 57.1; skew-x: 10.8; skew-y: 10.8; }
        frame 59 { x: 57; y: 72.3; skew-x: 8.5; skew-y: 8.5; }
        frame 60 { x: 56.8; y: 72.6; skew-x: 6.3; skew-y: 6.3; }
        frame 61 { x: 56.7; y: 72.8; skew-x: 4.3; skew-y: 4.3; }
        frame 62 { x: 56.5; y: 73.2; skew-x: 2; skew-y: 2; }
        frame 63 { x: 56.4; y: 73.5; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 58; y: 71.2; skew-x: 3.5; skew-y: 3.5; scale-x: 0.747; scale-y: 0.747; }
        frame 74 { x: 59.5; y: 68.7; skew-x: 7.1; skew-y: 7.1; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 59.4; y: -10000; skew-x: 7; skew-y: 7; }
        frame 76 { x: 59.5; skew-x: 7.1; skew-y: 7.1; }
        frame 77 { x: 59.4; y: 69.6; skew-x: 7; skew-y: 7; }
        frame 78 { x: 59.5; y: 70.5; skew-x: 7.1; skew-y: 7.1; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { x: 56.4; y: 73.5; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 81 { x: 53.1; y: 73.3; skew-x: -1.9; skew-y: -1.9; scale-x: 0.747; scale-y: 0.747; }
        frame 82 { x: 49.9; y: 73.2; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 46.6; y: 73; skew-x: -5.9; skew-y: -5.9; scale-x: 0.746; scale-y: 0.746; }
        frame 84 { x: 43.1; y: 72.8; skew-x: -7.9; skew-y: -7.9; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 37.5; y: 72.7; skew-x: -12.7; skew-y: -12.7; scale-x: 0.745; scale-y: 0.745; }
        frame 86 { x: 32; y: 72.5; skew-x: -17.4; skew-y: -17.4; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 26.5; y: 72.4; skew-x: -22.2; skew-y: -22.2; }
        frame 88 { x: 21.1; y: 72.3; skew-x: -27; skew-y: -27; }
        frame 89 { x: 10.2; y: 79.2; skew-x: -57.3; skew-y: -57.3; scale-x: 0.743; scale-y: 0.743; }
        frame 90 { x: 3.6; y: 85.9; skew-x: -87.4; skew-y: -87.4; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 2.5; y: 89.7; skew-x: -95.4; skew-y: -95.4; scale-x: 0.742; scale-y: 0.742; }
        frame 92 { x: 1.5; y: 93.2; skew-x: -103.5; skew-y: -103.5; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 0.8; y: 96.6; skew-x: -111.7; skew-y: -111.7; scale-x: 0.741; scale-y: 0.741; }
        frame 94 { x: 0.3; y: 99.5; skew-x: -119.9; skew-y: -119.9; scale-x: 0.742; scale-y: 0.742; }
        frame 95 { x: -5.4; y: 103.3; skew-x: -74.1; skew-y: -74.1; scale-x: 0.739; scale-y: 0.782; }
        frame 96 { x: -1.2; y: 103; skew-x: -28.3; skew-y: -28.3; scale-x: 0.738; scale-y: 0.825; }
        frame 97 { x: -0.8; y: 104.1; skew-x: -27.5; skew-y: -29.2; scale-x: 0.744; scale-y: 0.815; }
        frame 98 { x: -0.5; y: 105.1; skew-x: -26.6; skew-y: -30.1; scale-x: 0.752; scale-y: 0.807; }
        frame 99 { x: -0.9; y: 104; skew-x: -27.5; skew-y: -29.2; scale-x: 0.744; scale-y: 0.815; }
        frame 100 { x: -1.2; y: 103; skew-x: -28.3; skew-y: -28.3; scale-x: 0.738; scale-y: 0.825; }
        frame 101 { x: -10000; y: 102.9; skew-x: -28.2; skew-y: -28.2; scale-x: 0.737; scale-y: 0.823; }
        frame 102 { y: 103; skew-x: -28.3; skew-y: -28.3; scale-x: 0.738; scale-y: 0.825; }
    }
    Track {
        source-name: "Zombie_jackbox_innerarm_upper";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 15.8; y: 33.4; skew-x: 2.1; skew-y: 2.1; scale-x: 0.815; scale-y: 0.757; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_INNERARM_UPPER; }
        frame 14 { x: 16.5; y: 32.4; skew-x: 2.8; skew-y: 2.8; scale-x: 0.814; scale-y: 0.756; cel: -10000; image: none; }
        frame 15 { x: 12.9; y: 36; skew-x: -2.6; skew-y: -2.6; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 17 { x: 12; y: 37.1; skew-x: -3.4; skew-y: -3.4; }
        frame 18 { x: 14.4; y: 33.4; skew-x: -0.2; skew-y: -0.2; }
        frame 19 { x: 12.7; y: 36.1; skew-x: -3.2; skew-y: -3.2; }
        frame 20 { x: 14.6; y: 32.6; skew-x: 0.7; skew-y: 0.7; }
        frame 21 { x: 12.7; y: 37.3; skew-x: -2.9; skew-y: -2.9; }
        frame 22 { x: 12.4; y: 37.4; skew-x: -3.9; skew-y: -3.9; }
        frame 23 { x: 12; y: -10000; skew-x: -5.2; skew-y: -5.2; }
        frame 24 { x: 12.5; y: 36.6; skew-x: -3.9; skew-y: -3.9; }
        frame 25 { x: 13.3; y: 35.9; skew-x: -2.7; skew-y: -2.7; }
        frame 26 { x: 13.9; y: 35.3; skew-x: -1.4; skew-y: -1.4; }
        frame 27 { x: 14.5; y: 34.6; skew-x: -0.2; skew-y: -0.2; scale-x: 0.815; scale-y: 0.757; }
        frame 28 { x: 15.1; y: 33.9; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 15.8; y: 33.4; skew-x: 2.1; skew-y: 2.1; }
        frame 30 { x: 21.4; y: 26.4; skew-x: 10.1; skew-y: 10.1; scale-x: 0.814; scale-y: 0.756; }
        frame 31 { x: 21.1; y: 28.1; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 20.8; y: 27.7; skew-x: 9.5; skew-y: 9.5; }
        frame 33 { x: 20.6; y: 34.3; skew-x: -11.3; skew-y: -11.4; scale-x: 0.812; scale-y: 0.754; }
        frame 34 { x: 25.4; y: 43.4; skew-x: -43.8; skew-y: -43.8; scale-x: 0.813; scale-y: 0.755; }
        frame 35 { x: 31.8; y: 32.7; skew-x: -16.2; skew-y: -16.2; scale-x: 0.812; scale-y: 0.754; }
        frame 36 { x: 38.3; y: 24.3; skew-x: 11; skew-y: 11; scale-x: 0.813; scale-y: 0.755; }
        frame 37 { x: 36.5; y: 26.6; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 27.4; y: 25; skew-x: 20.1; skew-y: 20.1; }
        frame 39 { x: 19.2; y: 34; skew-x: 9.5; skew-y: 9.5; scale-x: 0.812; scale-y: 0.754; }
        frame 40 { x: 24.4; y: 29.2; skew-x: 19.2; skew-y: 21.3; scale-x: -10000; scale-y: 0.755; }
        frame 41 { x: 20.1; y: 32.3; skew-x: 3.3; skew-y: 4.7; scale-x: 0.813; scale-y: 0.754; }
        frame 42 { x: 24.3; y: 31.3; skew-x: 0.8; skew-y: -0.2; scale-x: 0.825; scale-y: 0.746; }
        frame 43 { x: 25; y: 42.5; skew-x: -36.3; skew-y: -36.8; scale-x: 0.817; scale-y: 0.749; }
        frame 44 { x: 30.6; y: 33; skew-x: -15.7; skew-y: -15.7; scale-x: 0.813; scale-y: 0.755; }
        frame 45 { x: 34.1; y: 28.3; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 28.9; y: 38.5; skew-x: -32; skew-y: -32; scale-x: 0.812; scale-y: 0.754; }
        frame 47 { x: 25.6; y: 20.7; skew-x: 11.1; skew-y: 11.1; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 21.4; y: 26.4; skew-x: 10.1; skew-y: 10.1; scale-x: 0.814; scale-y: 0.756; }
        frame 49 { x: 11.8; y: 38; skew-x: -3.1; skew-y: -3.1; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 18; y: 35.9; skew-x: -2.4; skew-y: -2.4; scale-x: 0.809; scale-y: 0.752; }
        frame 51 { x: 19.9; y: 35.5; skew-x: -15.6; skew-y: -15.6; scale-x: 0.811; scale-y: 0.753; }
        frame 52 { x: 29.8; y: 35.2; skew-x: -16.2; skew-y: -16.2; scale-x: 0.809; scale-y: 0.752; }
        frame 53 { x: 42.4; y: 22.8; skew-x: 6.8; skew-y: 6.8; scale-x: 0.813; scale-y: 0.755; }
        frame 54 { x: 36.4; y: 31.4; skew-x: -16.5; skew-y: -16.5; scale-x: 0.812; scale-y: 0.754; }
        frame 55 { x: 27.6; y: 23.5; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 18.7; y: 32.6; skew-x: -1.4; skew-y: -1.4; scale-x: 0.811; scale-y: 0.753; }
        frame 57 { x: 22.5; y: 35.5; skew-x: 13.3; skew-y: 17; scale-x: 0.81; scale-y: 0.809; }
        frame 58 { x: 11.4; y: 47.5; skew-x: -24.4; skew-y: -24.4; scale-x: 0.812; scale-y: 0.754; }
        frame 59 { x: 14.9; y: 47; skew-x: -36.2; skew-y: -36.2; scale-x: 0.811; scale-y: 0.753; }
        frame 60 { x: 22.4; y: 42; skew-x: -23.4; skew-y: -23.4; scale-x: -10000; scale-y: 0.754; }
        frame 61 { x: 27.3; y: 37.3; skew-x: -10.5; skew-y: -10.5; scale-x: 0.813; scale-y: 0.755; }
        frame 62 { x: 22.2; y: 31.2; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 15.8; y: 33.4; skew-x: 2.1; skew-y: 2.1; scale-x: 0.815; scale-y: 0.757; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 18; y: 34; skew-x: 15; skew-y: 15; scale-x: 0.813; scale-y: 0.755; }
        frame 66 { x: 17.7; y: 34.2; skew-x: 14.8; skew-y: 14.8; scale-x: 0.812; scale-y: 0.768; }
        frame 67 { x: 18.8; y: 33.4; skew-x: 14.5; skew-y: 14.5; scale-x: 0.811; scale-y: 0.782; }
        frame 68 { x: 20; y: 32.8; skew-x: 14.3; skew-y: 14.3; scale-x: 0.812; scale-y: 0.796; }
        frame 69 { x: 21.1; y: 32.1; skew-x: 14.1; skew-y: 14.1; scale-x: -10000; scale-y: 0.811; }
        frame 70 { x: 20.2; y: 32.5; skew-x: 11.8; skew-y: 11.8; scale-y: 0.791; }
        frame 71 { x: 19.5; y: 32.9; skew-x: 9.6; skew-y: 9.6; scale-y: 0.773; }
        frame 72 { x: 18.8; y: 33.1; skew-x: 7.6; skew-y: 7.6; scale-x: 0.813; scale-y: 0.755; }
        frame 73 { x: 27.5; y: 26.4; skew-x: 15.5; skew-y: 15.5; scale-x: 0.812; scale-y: 0.754; }
        frame 74 { x: 36.3; y: 19.9; skew-x: 23.7; skew-y: 23.7; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 37.5; y: 19.4; skew-x: 24.8; skew-y: 24.8; scale-x: 0.811; scale-y: 0.753; }
        frame 76 { x: 38.8; y: 18.8; skew-x: 26.2; skew-y: 26.2; scale-x: 0.812; scale-y: 0.754; }
        frame 77 { x: -10000; y: 19.8; skew-x: 26.1; skew-y: 26.1; scale-x: 0.811; scale-y: 0.753; }
        frame 78 { y: 20.6; skew-x: 26.2; skew-y: 26.2; scale-x: 0.812; scale-y: 0.754; }
        frame 79 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 20.1; y: 31.8; skew-x: 8.1; skew-y: 8.1; scale-x: 0.814; scale-y: 0.756; }
        frame 81 { x: 12.7; y: 38.2; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 5.5; y: 44.8; skew-x: -5.9; skew-y: -5.9; }
        frame 83 { x: -1.3; y: 51.6; skew-x: -12.9; skew-y: -12.9; scale-x: 0.813; scale-y: 0.755; }
        frame 84 { x: -7.8; y: 58.8; skew-x: -20.1; skew-y: -20.1; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: -11.2; y: 52.9; skew-x: 0; skew-y: 0; scale-x: 0.812; scale-y: 0.754; }
        frame 86 { x: -12.7; y: 48.8; skew-x: 19.8; skew-y: 19.8; scale-x: 0.811; scale-y: 0.753; }
        frame 87 { x: -12.9; y: 47.1; skew-x: 39.9; skew-y: 39.9; scale-x: 0.809; scale-y: 0.752; }
        frame 88 { x: -10000; y: 48; skew-x: 59.9; skew-y: 59.9; scale-x: 0.81; scale-y: -10000; }
        frame 89 { x: -25.8; y: 64.9; skew-x: 50.9; skew-y: 50.9; scale-x: 0.807; scale-y: 0.749; }
        frame 90 { x: -38.9; y: 82.2; skew-x: 41.6; skew-y: 41.6; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -41.6; y: 86.1; skew-x: 40.9; skew-y: 40.9; scale-x: 0.805; scale-y: 0.748; }
        frame 92 { x: -44.3; y: 89.9; skew-x: 40.1; skew-y: 40.1; scale-x: 0.806; scale-y: -10000; }
        frame 93 { x: -47.1; y: 93.8; skew-x: 39.1; skew-y: 39.1; scale-x: -10000; }
        frame 94 { x: -50; y: 97.8; skew-x: 38.4; skew-y: 38.4; scale-x: 0.807; scale-y: 0.75; }
        frame 95 { x: -50.7; y: 98.6; skew-x: 43.6; skew-y: 46.2; scale-x: 0.816; scale-y: -10000; }
        frame 96 { x: -51.5; y: 99.6; skew-x: 49; skew-y: 54; scale-x: 0.828; scale-y: 0.754; }
        frame 97 { x: -52; y: 100.8; skew-x: 47.9; skew-y: 55.1; scale-x: 0.825; scale-y: 0.756; }
        frame 98 { x: -52.5; y: 101.8; skew-x: 46.9; skew-y: 56; scale-x: 0.824; scale-y: 0.762; }
        frame 99 { x: -51.9; y: 100.7; skew-x: 47.9; skew-y: 55.1; scale-x: 0.825; scale-y: 0.756; }
        frame 100 { x: -51.5; y: 99.6; skew-x: 49; skew-y: 54; scale-x: 0.828; scale-y: 0.754; }
        frame 101 { x: -10000; y: 99.7; skew-x: 48.9; skew-y: 54.1; scale-x: 0.827; scale-y: 0.752; }
        frame 102 { y: 99.6; skew-x: 49; skew-y: 54; scale-x: 0.828; scale-y: 0.754; }
    }
    Track {
        source-name: "Zombie_jackbox_innerarm_lower";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: -12; y: 44.5; scale-x: 0.775; scale-y: 0.748; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_INNERARM_LOWER; }
        frame 14 { x: -11.5; y: 43.3; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: 0.747; cel: -10000; image: none; }
        frame 15 { x: -13.8; y: 49.3; skew-x: -4.5; skew-y: -4.5; scale-y: -10000; }
        frame 16 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 17 { x: -14.6; y: 50.9; skew-x: -5.4; skew-y: -5.4; }
        frame 18 { x: -13; y: 45.6; skew-x: -2.2; skew-y: -2.2; scale-x: 0.774; }
        frame 19 { x: -14; y: 49.9; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; }
        frame 20 { x: -12.9; y: 44.5; skew-x: -1.2; skew-y: -1.2; }
        frame 21 { x: -14.1; y: 50.8; skew-x: -4.9; skew-y: -4.9; scale-x: 0.775; }
        frame 22 { x: -10000; y: 51.5; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; }
        frame 23 { y: 52.2; skew-x: -7.4; skew-y: -7.4; }
        frame 24 { x: -13.8; y: 50.9; skew-x: -6.2; skew-y: -6.2; scale-x: 0.774; }
        frame 25 { x: -13.4; y: 49.6; skew-x: -4.9; skew-y: -4.9; scale-x: 0.775; }
        frame 26 { x: -13; y: 48.3; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; }
        frame 27 { x: -12.8; y: 47; skew-x: -2.4; skew-y: -2.4; }
        frame 28 { x: -12.4; y: 45.7; skew-x: -1.2; skew-y: -1.2; }
        frame 29 { x: -12; y: 44.5; skew-x: 0; skew-y: 0; scale-y: 0.748; }
        frame 30 { x: -7.8; y: 33.4; skew-x: 8.1; skew-y: 8.1; scale-y: 0.747; }
        frame 31 { x: -8; y: 35.4; skew-x: 7.3; skew-y: 7.3; scale-y: -10000; }
        frame 32 { x: -10.2; y: 56.1; skew-x: -29.3; skew-y: -29.3; scale-x: 0.773; scale-y: 0.745; }
        frame 33 { x: -2.9; y: 59.1; skew-x: -27; skew-y: -27; scale-x: 0.772; scale-y: -10000; }
        frame 34 { x: 5.3; y: 58.3; skew-x: -31.8; skew-y: -31.8; scale-x: 0.773; }
        frame 35 { x: 13.7; y: 39.4; skew-x: 2.2; skew-y: 2.2; scale-x: 0.772; }
        frame 36 { x: 15; y: 28; skew-x: 13.5; skew-y: 13.5; scale-x: 0.774; scale-y: 0.746; }
        frame 37 { x: 10.2; y: 25.7; skew-x: 24.1; skew-y: 24.1; scale-x: 0.772; scale-y: 0.744; }
        frame 38 { x: -2.6; y: 27; skew-x: 18.6; skew-y: 18.6; scale-x: 0.773; scale-y: 0.746; }
        frame 39 { x: -10; y: 41.5; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: 0.745; }
        frame 40 { x: -10.4; y: 38.5; skew-x: 3.5; skew-y: 3.5; scale-x: 0.806; scale-y: -10000; }
        frame 41 { x: -10.6; y: 53.7; skew-x: -17; skew-y: -17; scale-x: 0.816; }
        frame 42 { x: -3.2; y: 61.4; skew-x: -32.5; skew-y: -32.5; scale-x: 0.808; scale-y: 0.746; }
        frame 43 { x: 4.8; y: 58.8; skew-x: -29; skew-y: -29; scale-x: 0.79; scale-y: 0.745; }
        frame 44 { x: 12.1; y: 42.6; skew-x: -7.4; skew-y: -7.4; scale-x: 0.774; scale-y: 0.746; }
        frame 45 { x: 15.4; y: 27.9; skew-x: 14.8; skew-y: 14.8; scale-x: 0.772; scale-y: 0.745; }
        frame 46 { x: 8.3; y: 22.6; skew-x: 14.3; skew-y: 14.3; scale-x: 0.774; scale-y: 0.746; }
        frame 47 { x: -3.4; y: 25.8; skew-x: 11.1; skew-y: 11.1; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: -7.8; y: 33.4; skew-x: 8.1; skew-y: 8.1; scale-x: 0.775; scale-y: 0.747; }
        frame 49 { x: -14.9; y: 51.6; skew-x: -5.1; skew-y: -5.1; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: -9.7; y: 58.7; skew-x: -19.9; skew-y: -19.9; scale-x: 0.772; scale-y: 0.745; }
        frame 51 { x: -0.4; y: 68; skew-x: -40.5; skew-y: -40.5; scale-x: 0.769; scale-y: 0.742; }
        frame 52 { x: 15.1; y: 50.1; skew-x: -20.4; skew-y: -20.4; scale-x: 0.768; scale-y: 0.741; }
        frame 53 { x: 19; y: 32.4; skew-x: 6.1; skew-y: 6.1; scale-x: 0.771; scale-y: 0.743; }
        frame 54 { x: 13.1; y: 25.5; skew-x: 6.3; skew-y: 6.3; scale-x: 0.772; scale-y: 0.745; }
        frame 55 { x: 0.7; y: 30.4; skew-x: 9; skew-y: 9; scale-x: 0.771; scale-y: 0.744; }
        frame 56 { x: -7.7; y: 42.7; skew-x: 0.7; skew-y: 0.7; scale-x: 0.772; scale-y: 0.745; }
        frame 57 { x: -9.6; y: 70.2; skew-x: -38; skew-y: -38; scale-x: 0.823; scale-y: 0.746; }
        frame 58 { x: -7.2; y: 75.3; skew-x: -36; skew-y: -36; scale-x: 0.772; scale-y: 0.745; }
        frame 59 { x: 0.7; y: 74.1; skew-x: -40.5; skew-y: -40.5; scale-x: 0.77; scale-y: 0.743; }
        frame 60 { x: 8.8; y: 43.2; skew-x: 2.5; skew-y: 2.5; scale-x: 0.772; scale-y: 0.744; }
        frame 61 { x: 8; y: 33.5; skew-x: 19.6; skew-y: 19.6; scale-x: 0.773; scale-y: 0.745; }
        frame 62 { x: -6.5; y: 36.4; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: 0.746; }
        frame 63 { x: -12; y: 44.5; skew-x: 0; skew-y: 0; scale-x: 0.775; scale-y: 0.748; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -15.1; y: 47.8; skew-x: -3.9; skew-y: -3.9; scale-x: 0.797; scale-y: 0.747; }
        frame 66 { x: -18; y: 51.4; skew-x: -7.9; skew-y: -7.9; scale-x: 0.818; scale-y: -10000; }
        frame 67 { x: -17.7; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.823; }
        frame 68 { x: -17.3; scale-x: 0.828; }
        frame 69 { x: -17; y: 51.2; scale-x: 0.834; }
        frame 70 { x: -10000; y: 51.1; scale-x: 0.814; }
        frame 71 { x: -16.9; y: -10000; scale-x: 0.794; }
        frame 72 { x: -10000; y: 51; scale-x: 0.774; }
        frame 73 { x: -16.7; y: 48; skew-x: -8.2; skew-y: -8.2; scale-x: -10000; scale-y: 0.746; }
        frame 74 { x: -16.6; y: 44.9; skew-x: -8.6; skew-y: -8.6; scale-x: 0.773; scale-y: -10000; }
        frame 75 { x: -14.9; y: 51.9; skew-x: -15.9; skew-y: -15.9; scale-x: 0.772; scale-y: 0.745; }
        frame 76 { x: -13; y: 59; skew-x: -23.3; skew-y: -23.3; scale-x: 0.773; scale-y: -10000; }
        frame 77 { x: -14.6; y: 59.6; skew-x: -26; skew-y: -26; scale-x: 0.771; scale-y: 0.744; }
        frame 78 { x: -16.4; y: 60.3; skew-x: -28.8; skew-y: -28.8; scale-x: 0.772; scale-y: 0.745; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: -12; y: 44.5; skew-x: 0; skew-y: 0; scale-x: 0.775; scale-y: 0.748; }
        frame 81 { x: -17.7; y: 44.6; skew-x: 1.8; skew-y: 1.8; scale-x: 0.774; scale-y: 0.747; }
        frame 82 { x: -23.4; y: 44.8; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: 0.746; }
        frame 83 { x: -28.9; y: 44.9; skew-x: 5.8; skew-y: 5.8; scale-x: 0.773; scale-y: 0.745; }
        frame 84 { x: -34.5; y: 45; skew-x: 7.8; skew-y: 7.8; scale-x: 0.772; scale-y: -10000; }
        frame 85 { x: -37.1; y: 41.1; skew-x: 17.1; skew-y: 17.1; scale-x: 0.771; scale-y: 0.744; }
        frame 86 { x: -39.5; y: 37.6; skew-x: 26.6; skew-y: 26.6; scale-x: 0.77; scale-y: 0.743; }
        frame 87 { x: -41.8; y: 34.8; skew-x: 35.9; skew-y: 35.9; scale-x: 0.769; scale-y: 0.742; }
        frame 88 { x: -43.8; y: 32.5; skew-x: 45.4; skew-y: 45.4; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: -58.3; y: 54.9; skew-x: 36.1; skew-y: 36.1; scale-x: 0.767; scale-y: 0.74; }
        frame 90 { x: -72.8; y: 77.5; skew-x: 26.9; skew-y: 26.9; scale-x: -10000; scale-y: 0.739; }
        frame 91 { x: -72.5; y: 79; skew-x: 33.4; skew-y: 33.4; scale-x: 0.765; scale-y: 0.738; }
        frame 92 { x: -72.3; y: 80.8; skew-x: 40.1; skew-y: 40.1; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -71.9; y: 83; skew-x: 46.6; skew-y: 46.6; }
        frame 94 { x: -71.6; y: 85.5; skew-x: 53.2; skew-y: 53.2; scale-x: 0.766; scale-y: 0.739; }
        frame 95 { x: -82.3; y: 93.5; skew-x: 26.6; skew-y: 29.1; scale-x: -10000; scale-y: 0.748; }
        frame 96 { x: -91.5; y: 105.3; skew-x: 0; skew-y: 5; scale-x: 0.767; scale-y: 0.759; }
        frame 97 { x: -92.8; y: 106.4; skew-x: -10000; skew-y: -10000; scale-x: 0.781; scale-y: 0.745; }
        frame 98 { x: -94; y: 107.3; skew-y: 5.4; scale-x: 0.794; scale-y: 0.731; }
        frame 99 { x: -91.2; y: 103.3; skew-x: 5; skew-y: 10.3; scale-x: 0.78; scale-y: 0.744; }
        frame 100 { x: -88.1; y: 99.2; skew-x: 10.3; skew-y: 15.3; scale-x: 0.767; scale-y: 0.759; }
        frame 101 { x: -89; y: 100.9; skew-x: 7.5; skew-y: 12.5; scale-x: 0.766; scale-y: 0.758; }
        frame 102 { x: -89.9; y: 102.5; skew-x: 4.7; skew-y: 9.8; scale-x: 0.767; scale-y: 0.759; }
    }
    Track {
        source-name: "Zombie_jackbox_body1";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 26.9; y: 27.2; scale-x: 0.748; scale-y: 0.748; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_BODY1; }
        frame 14 { x: 28.1; y: 26.4; skew-x: 1.3; skew-y: 1.3; scale-x: 0.747; scale-y: 0.747; cel: -10000; image: none; }
        frame 15 { x: 24.4; y: 28.6; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 26.5; y: 27.9; skew-x: -0.4; skew-y: -0.4; scale-x: 0.748; scale-y: 0.748; }
        frame 17 { x: 23.6; y: 30; skew-x: -3.9; skew-y: -3.9; scale-x: 0.747; scale-y: 0.747; }
        frame 18 { x: 26.7; y: 27; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 24.9; y: 29.1; skew-x: -2.9; skew-y: -2.9; }
        frame 20 { x: 27.5; y: 26.3; skew-x: 1.2; skew-y: 1.2; }
        frame 21 { x: 24.9; y: 30.4; skew-x: -2.4; skew-y: -2.4; scale-x: 0.748; scale-y: 0.748; }
        frame 22 { x: 25.3; y: 29.9; skew-x: -1.9; skew-y: -1.9; scale-x: 0.747; scale-y: 0.755; }
        frame 23 { x: 25.5; y: 29.5; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: 0.762; }
        frame 24 { x: 25.7; y: 29; skew-x: -1.2; skew-y: -1.2; scale-y: 0.76; }
        frame 25 { x: 25.9; y: 28.6; skew-x: -0.9; skew-y: -0.9; scale-y: 0.757; }
        frame 26 { x: 26.2; y: 28.3; skew-x: -0.7; skew-y: -0.7; scale-y: 0.755; }
        frame 27 { x: 26.4; y: 27.9; skew-x: -0.4; skew-y: -0.4; scale-x: 0.748; scale-y: 0.752; }
        frame 28 { x: 26.6; y: 27.5; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: 0.75; }
        frame 29 { x: 26.9; y: 27.2; skew-x: 0; skew-y: 0; scale-y: 0.748; }
        frame 30 { x: 33.3; y: 21.8; skew-x: 8.1; skew-y: 8.1; scale-x: 0.747; scale-y: 0.747; }
        frame 31 { x: 32.9; y: 23.3; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: 0.762; }
        frame 32 { x: 33; y: 22.4; skew-x: 7.5; skew-y: 7.5; scale-y: 0.757; }
        frame 33 { x: 33.1; y: 21.5; skew-x: 7.8; skew-y: 7.8; scale-y: 0.751; }
        frame 34 { x: 33.3; y: 20.6; skew-x: 8; skew-y: 8; scale-y: 0.747; }
        frame 35 { x: 33.5; y: 20.1; skew-x: 8.5; skew-y: 8.5; scale-x: 0.746; scale-y: 0.746; }
        frame 36 { x: 33.6; y: 19.5; skew-x: 9; skew-y: 9; scale-x: 0.747; scale-y: 0.747; }
        frame 37 { x: 33.4; y: 21.8; skew-x: 8.8; skew-y: 8.8; scale-x: 0.746; scale-y: 0.746; }
        frame 38 { x: 33.2; y: 24; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 23.1; y: 31.9; skew-x: -3.2; skew-y: -3.2; scale-x: 0.745; scale-y: 0.757; }
        frame 40 { x: 26.3; y: 28.4; skew-x: 0.3; skew-y: 0.3; scale-x: 0.746; scale-y: 0.754; }
        frame 41 { x: 29.9; y: 25.1; skew-x: 4.3; skew-y: 4.3; scale-x: -10000; scale-y: 0.75; }
        frame 42 { x: 33.3; y: 21.8; skew-x: 8.1; skew-y: 8.1; scale-x: 0.747; scale-y: 0.747; }
        frame 43 { x: -10000; y: 21.2; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 44 { y: 20.6; skew-x: -10000; skew-y: -10000; }
        frame 45 { x: 33.5; y: 20.1; skew-x: 8.5; skew-y: 8.5; scale-x: 0.746; scale-y: 0.746; }
        frame 46 { x: 33.6; y: 19.5; skew-x: 9; skew-y: 9; scale-x: 0.747; scale-y: 0.747; }
        frame 47 { x: 33.5; y: 20.7; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 33.3; y: 21.8; skew-x: 8.1; skew-y: 8.1; }
        frame 49 { x: 22.3; y: 30.9; skew-x: -5.1; skew-y: -5.1; }
        frame 50 { x: 26.5; y: 27.6; skew-x: -0.9; skew-y: -0.9; }
        frame 51 { x: 30.7; y: 24.6; skew-x: 3; skew-y: 3; }
        frame 52 { x: 35.1; y: 21.7; skew-x: 7.3; skew-y: 7.3; }
        frame 53 { x: 39.6; y: 19.1; skew-x: 11.3; skew-y: 11.3; scale-x: 0.746; scale-y: 0.746; }
        frame 54 { x: 44.3; y: 16.4; skew-x: 15.6; skew-y: 15.6; scale-x: 0.747; scale-y: 0.747; }
        frame 55 { x: 38.1; y: 19.5; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 32.2; y: 22.9; skew-x: 4.3; skew-y: 4.3; }
        frame 57 { x: 26.5; y: 26.4; skew-x: -0.9; skew-y: -0.9; }
        frame 58 { x: 21; y: 30.5; skew-x: -6.7; skew-y: -6.7; }
        frame 59 { x: 22.5; y: 29.6; skew-x: -4.9; skew-y: -4.9; }
        frame 60 { x: 24; y: 28.6; skew-x: -3.2; skew-y: -3.2; }
        frame 61 { x: 25.5; y: 27.9; skew-x: -1.5; skew-y: -1.5; }
        frame 62 { x: 26.2; y: 27.6; skew-x: -0.7; skew-y: -0.7; scale-x: 0.748; scale-y: 0.748; }
        frame 63 { x: 26.9; y: 27.2; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 65 { x: 26; y: 27.5; skew-x: -0.9; skew-y: -0.9; scale-x: 0.747; scale-y: 0.754; }
        frame 66 { x: 25.1; y: 27.9; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: 0.761; }
        frame 67 { x: 24; y: 28.2; skew-x: -3.2; skew-y: -3.2; scale-y: 0.768; }
        frame 68 { x: 25.5; y: 27.6; skew-x: -1.4; skew-y: -1.4; scale-y: 0.758; }
        frame 69 { x: 26.9; y: 27.2; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 36.1; y: 21.6; skew-x: 8; skew-y: 8; scale-x: 0.747; scale-y: 0.747; }
        frame 74 { x: 45.8; y: 16.5; skew-x: 16.1; skew-y: 16.1; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 47; y: 16.2; skew-x: 17.3; skew-y: 17.3; scale-x: 0.746; scale-y: 0.746; }
        frame 76 { x: 48.4; y: 15.8; skew-x: 18.6; skew-y: 18.6; scale-x: 0.747; scale-y: 0.747; }
        frame 77 { x: 47; y: 17.1; skew-x: 17.3; skew-y: 17.3; scale-x: 0.746; scale-y: 0.746; }
        frame 78 { x: 45.8; y: 18.3; skew-x: 16.1; skew-y: 16.1; scale-x: 0.747; scale-y: 0.747; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 26.9; y: 27.2; skew-x: 0; skew-y: 0; scale-x: 0.748; scale-y: 0.748; }
        frame 81 { x: 18.5; y: 32.6; skew-x: -6.9; skew-y: -6.9; scale-x: 0.747; scale-y: 0.747; }
        frame 82 { x: 10.5; y: 38.6; skew-x: -14; skew-y: -14; scale-x: 0.746; scale-y: 0.746; }
        frame 83 { x: 2.9; y: 44.9; skew-x: -21; skew-y: -21; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: -4; y: 51.5; skew-x: -28.2; skew-y: -28.2; }
        frame 85 { x: -11; y: 55.4; skew-x: -33; skew-y: -33; scale-x: 0.745; scale-y: 0.745; }
        frame 86 { x: -17.7; y: 59.5; skew-x: -37.7; skew-y: -37.7; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -24.1; y: 63.6; skew-x: -42.5; skew-y: -42.5; }
        frame 88 { x: -30.4; y: 67.6; skew-x: -47.3; skew-y: -47.3; scale-x: 0.746; scale-y: 0.746; }
        frame 89 { x: -40.3; y: 88.4; skew-x: -62.1; skew-y: -62.1; scale-x: 0.744; scale-y: 0.744; }
        frame 90 { x: -47.9; y: 108.8; skew-x: -76.8; skew-y: -76.8; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -50.6; y: 112.1; skew-x: -76.1; skew-y: -76.1; scale-x: 0.743; scale-y: 0.743; }
        frame 92 { x: -53.4; y: 115.3; skew-x: -75.3; skew-y: -75.3; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -56.2; y: 118.5; skew-x: -74.4; skew-y: -74.4; }
        frame 94 { x: -58.8; y: 121.8; skew-x: -73.6; skew-y: -73.6; scale-x: 0.744; scale-y: 0.744; }
        frame 95 { x: -59.1; y: 122.3; skew-x: -72.9; skew-y: -74.3; scale-x: 0.734; scale-y: 0.763; }
        frame 96 { x: -59.6; y: 122.9; skew-x: -72.1; skew-y: -74.9; scale-x: 0.726; scale-y: 0.784; }
        frame 97 { x: -60.1; y: 123.7; skew-x: -71.6; skew-y: -75.6; scale-x: 0.714; scale-y: 0.796; }
        frame 98 { x: -60.9; y: 124.3; skew-x: -70.8; skew-y: -75.9; scale-x: 0.704; scale-y: 0.808; }
        frame 99 { x: -60.1; y: 123; skew-x: -71.4; skew-y: -75.4; scale-x: 0.714; scale-y: 0.796; }
        frame 100 { x: -59.6; y: 121.7; skew-x: -71.8; skew-y: -74.6; scale-x: 0.726; scale-y: 0.784; }
        frame 101 { x: -10000; y: 122.3; skew-x: -72.1; skew-y: -74.9; scale-x: -10000; scale-y: -10000; }
        frame 102 { y: 122.9; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 0.3; y: -1.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_HEAD; }
        frame 14 { x: 2.4; y: -3.2; skew-x: 1.7; skew-y: 1.7; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: -3.4; y: 1.1; skew-x: -2.9; skew-y: -2.9; }
        frame 16 { x: 0.5; y: -1.4; skew-x: 0.8; skew-y: 0.8; }
        frame 17 { x: -4.5; y: 3.2; skew-x: -3.2; skew-y: -3.2; }
        frame 18 { x: 0.1; y: -0.8; skew-x: 0.1; skew-y: 0.1; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: -3.1; y: 2.8; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 1.1; y: -1.7; skew-x: 1.2; skew-y: 1.2; }
        frame 21 { x: -2.9; y: 3.9; skew-x: -2.4; skew-y: -2.4; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: -3.2; y: 4.7; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -3.5; y: 5.6; skew-x: -4.2; skew-y: -4.2; }
        frame 24 { x: -2.9; y: 4.3; skew-x: -3.4; skew-y: -3.4; }
        frame 25 { x: -2.1; y: 3.1; skew-x: -2.7; skew-y: -2.7; }
        frame 26 { x: -1.5; y: 1.9; skew-x: -1.9; skew-y: -1.9; }
        frame 27 { x: -0.8; y: 0.7; skew-x: -1.2; skew-y: -1.2; }
        frame 28 { x: -0.1; y: -0.3; skew-x: -0.5; skew-y: -0.5; }
        frame 29 { x: 0.3; y: -1.4; skew-x: 0; skew-y: 0; }
        frame 30 { x: 11.1; y: -10.3; skew-x: 8.1; skew-y: 8.1; }
        frame 31 { x: 8.7; y: -7.4; skew-x: 5; skew-y: 5; scale-x: 0.799; scale-y: 0.799; }
        frame 32 { x: 10; y: -9.2; skew-x: 6.8; skew-y: 6.8; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 11.2; y: -11; skew-x: 8.5; skew-y: 8.5; }
        frame 34 { x: 12.4; y: -12.8; skew-x: 10.3; skew-y: 10.3; }
        frame 35 { x: 12.8; y: -13.4; skew-x: 10.6; skew-y: 10.6; scale-x: 0.798; scale-y: 0.798; }
        frame 36 { x: 13.3; y: -14.2; skew-x: 11; skew-y: 11; scale-x: 0.799; scale-y: 0.799; }
        frame 37 { x: 13; y: -11.8; skew-x: 10.8; skew-y: 10.8; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 12.8; y: -9.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: -8.4; y: 9.7; skew-x: -11.6; skew-y: -11.6; scale-x: 0.797; scale-y: 0.797; }
        frame 40 { x: -2.1; y: 2.6; skew-x: -4.9; skew-y: -4.9; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 4.2; y: -3.9; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.799; }
        frame 42 { x: 11.1; y: -10.3; skew-x: 8.1; skew-y: 8.1; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: 11.7; y: -11.4; skew-x: 9.1; skew-y: 9.1; scale-x: 0.799; scale-y: 0.799; }
        frame 44 { x: 12.4; y: -12.8; skew-x: 10.3; skew-y: 10.3; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 12.8; y: -13.4; skew-x: 10.6; skew-y: 10.6; scale-x: 0.798; scale-y: 0.798; }
        frame 46 { x: 13.3; y: -14.2; skew-x: 11; skew-y: 11; scale-x: 0.799; scale-y: 0.799; }
        frame 47 { x: 12.2; y: -12.2; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 11.1; y: -10.3; skew-x: 8.1; skew-y: 8.1; scale-x: 0.8; scale-y: 0.8; }
        frame 49 { x: -9.8; y: 9.1; skew-x: -10.9; skew-y: -10.9; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: -2; y: 2.5; skew-x: -4.4; skew-y: -4.4; scale-x: 0.788; scale-y: 0.813; }
        frame 51 { x: 5.9; y: -3.6; skew-x: 1.6; skew-y: 1.6; scale-x: 0.778; scale-y: 0.827; }
        frame 52 { x: 14.5; y: -9.6; skew-x: 8; skew-y: 8; scale-x: 0.767; scale-y: 0.84; }
        frame 53 { x: 23.4; y: -15.1; skew-x: 14.5; skew-y: 14.5; scale-x: 0.756; scale-y: 0.854; }
        frame 54 { x: 32.5; y: -20.3; skew-x: 20.9; skew-y: 20.9; scale-x: 0.746; scale-y: 0.868; }
        frame 55 { x: 22.3; y: -14.4; skew-x: 15; skew-y: 15; scale-x: 0.759; scale-y: 0.839; }
        frame 56 { x: 12.5; y: -8.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.773; scale-y: 0.811; }
        frame 57 { x: 0.9; y: 0.1; skew-x: 1.3; skew-y: 1.3; scale-x: 0.786; scale-y: 0.782; }
        frame 58 { x: -10; y: 9.1; skew-x: -6.7; skew-y: -6.7; scale-x: 0.8; scale-y: 0.753; }
        frame 59 { x: -7.9; y: 6.9; skew-x: -5.2; skew-y: -5.2; scale-x: 0.799; scale-y: 0.763; }
        frame 60 { x: -5.8; y: 4.8; skew-x: -3.9; skew-y: -3.9; scale-x: 0.8; scale-y: 0.772; }
        frame 61 { x: -3.7; y: 2.6; skew-x: -2.5; skew-y: -2.5; scale-x: -10000; scale-y: 0.781; }
        frame 62 { x: -1.6; y: 0.5; skew-x: -1.2; skew-y: -1.2; scale-y: 0.791; }
        frame 63 { x: 0.3; y: -1.4; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 65 { x: -1.5; y: 0.4; skew-x: -0.9; skew-y: -0.9; scale-x: 0.797; scale-y: 0.786; }
        frame 66 { x: -3.5; y: 2.3; skew-x: -1.9; skew-y: -1.9; scale-x: 0.794; scale-y: 0.771; }
        frame 67 { x: -5.5; y: 4.3; skew-x: -3.2; skew-y: -3.2; scale-x: 0.791; scale-y: 0.757; }
        frame 68 { x: -2.5; y: 1.3; skew-x: -1.4; skew-y: -1.4; scale-x: 0.796; scale-y: 0.778; }
        frame 69 { x: 0.3; y: -1.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 14.1; y: -10.1; skew-x: 8; skew-y: 8; scale-x: 0.799; scale-y: 0.799; }
        frame 74 { x: 28.3; y: -18.3; skew-x: 16.1; skew-y: 16.1; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 29.7; y: -18.6; skew-x: -10000; skew-y: -10000; image: IMAGE_REANIM_ZOMBIE_JACKBOX_HEAD2; }
        frame 76 { x: 35.4; y: -23.5; skew-x: 18.6; skew-y: 18.6; scale-x: 0.767; scale-y: 0.903; image: none; }
        frame 77 { x: 31.4; y: -18.6; skew-x: 16.3; skew-y: 16.3; scale-x: 0.783; scale-y: 0.85; }
        frame 78 { x: 27.6; y: -13.7; skew-x: 14.1; skew-y: 14.1; scale-x: 0.799; scale-y: 0.799; }
        frame 79 { x: 28.5; y: -15.2; skew-x: 14; skew-y: 14; scale-x: 0.773; scale-y: 0.824; }
        frame 80 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 10.1; y: 35.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_JAW; }
        frame 14 { x: 11.1; y: 34; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 8; y: 37.4; skew-x: -3.4; skew-y: -3.4; }
        frame 16 { x: 9.7; y: 35.1; skew-x: -0.4; skew-y: -0.4; }
        frame 17 { x: 7.3; y: 39.7; skew-x: -3.9; skew-y: -3.9; }
        frame 18 { x: 9.9; y: 36.5; skew-x: -0.2; skew-y: -0.2; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: 8.5; y: 40; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 10.2; y: 36.1; skew-x: 1.2; skew-y: 1.2; }
        frame 21 { x: 8.3; y: 41.3; skew-x: -2.4; skew-y: -2.4; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 8.9; y: 42; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: 0.829; }
        frame 23 { x: 9.4; y: 42.5; skew-x: -1.7; skew-y: -1.7; scale-y: 0.857; }
        frame 24 { x: 9.5; y: 41.3; skew-x: -1.2; skew-y: -1.2; scale-y: 0.848; }
        frame 25 { x: 9.6; y: 40.1; skew-x: -0.9; skew-y: -0.9; scale-y: 0.838; }
        frame 26 { x: 9.7; y: 39; skew-x: -0.7; skew-y: -0.7; scale-y: 0.829; }
        frame 27 { x: 9.8; y: 37.9; skew-x: -0.4; skew-y: -0.4; scale-y: 0.819; }
        frame 28 { x: 9.9; y: 36.7; skew-x: -0.2; skew-y: -0.2; scale-y: 0.81; }
        frame 29 { x: 10.1; y: 35.5; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 30 { x: 15.4; y: 27.7; skew-x: 8.1; skew-y: 8.1; scale-y: -10000; }
        frame 31 { x: 15.1; y: 30.3; skew-x: 5; skew-y: 5; scale-x: 0.799; scale-y: 0.799; }
        frame 32 { x: 15.3; y: 28.6; skew-x: 6.8; skew-y: 6.8; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: -10000; y: 26.9; skew-x: 8.5; skew-y: 8.5; }
        frame 34 { y: 25.3; skew-x: 10.3; skew-y: 10.3; }
        frame 35 { x: 15.4; y: 24.8; skew-x: 10.6; skew-y: 10.6; scale-x: 0.798; scale-y: 0.798; }
        frame 36 { x: 15.5; y: 24; skew-x: 11; skew-y: 11; scale-x: 0.799; scale-y: 0.799; }
        frame 37 { x: 15.4; y: 26.4; skew-x: 10.8; skew-y: 10.8; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 15.2; y: 28.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 8.2; y: 44.2; skew-x: -11.6; skew-y: -11.6; scale-x: 0.797; scale-y: 0.797; }
        frame 40 { x: 10.4; y: 38.6; skew-x: -4.9; skew-y: -4.9; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 12.8; y: 33.1; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.799; }
        frame 42 { x: 15.4; y: 27.7; skew-x: 8.1; skew-y: 8.1; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: 26.5; skew-x: 9.1; skew-y: 9.1; scale-x: 0.799; scale-y: 0.799; }
        frame 44 { x: 15.3; y: 25.3; skew-x: 10.3; skew-y: 10.3; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 15.4; y: 24.8; skew-x: 10.6; skew-y: 10.6; scale-x: 0.798; scale-y: 0.798; }
        frame 46 { x: 15.5; y: 24; skew-x: 11; skew-y: 11; scale-x: 0.799; scale-y: 0.799; }
        frame 47 { x: -10000; y: 26; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 15.4; y: 27.7; skew-x: 8.1; skew-y: 8.1; scale-x: 0.8; scale-y: 0.8; }
        frame 49 { x: 6.7; y: 43.6; skew-x: -10.9; skew-y: -10.9; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: 10.2; y: 39.4; skew-x: -5.4; skew-y: -5.4; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 13.9; y: 35.2; skew-x: -0.2; skew-y: -0.2; }
        frame 52 { x: 17.6; y: 31.2; skew-x: 5; skew-y: 5; }
        frame 53 { x: 21.5; y: 27.1; skew-x: 10.5; skew-y: 10.5; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: 25.3; y: 23; skew-x: 15.9; skew-y: 15.9; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 19.8; y: 27.7; skew-x: 12; skew-y: 11; scale-x: 0.818; scale-y: 0.798; }
        frame 56 { x: 14.4; y: 32.3; skew-x: 8.3; skew-y: 6.3; scale-x: 0.839; scale-y: 0.799; }
        frame 57 { x: 7.7; y: 35.5; skew-x: 3.3; skew-y: -1.7; scale-x: 0.863; scale-y: -10000; }
        frame 58 { x: 1.5; y: 38.6; skew-x: -1.3; skew-y: -10; scale-x: 0.888; }
        frame 59 { x: 3.3; y: 38; skew-x: -0.9; skew-y: -7.9; scale-x: 0.87; }
        frame 60 { x: 5.1; y: 37.3; skew-x: -0.7; skew-y: -5.9; scale-x: 0.853; }
        frame 61 { x: 6.8; y: 36.5; skew-x: -0.4; skew-y: -3.9; scale-x: 0.835; }
        frame 62 { x: 8.6; y: 36; skew-x: -0.2; skew-y: -1.9; scale-x: 0.817; scale-y: 0.8; }
        frame 63 { x: 10.1; y: 35.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: -10000; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 65 { x: 8.3; y: 35.9; skew-y: -0.4; scale-x: 0.831; }
        frame 66 { x: 6.4; y: 36.2; skew-x: 0.1; skew-y: -0.9; scale-x: 0.861; }
        frame 67 { x: 4.8; y: 36.4; skew-x: 0.3; skew-y: -1.4; scale-x: 0.892; }
        frame 68 { x: 7.5; y: 36; skew-x: 0; skew-y: -0.7; scale-x: 0.846; }
        frame 69 { x: 10.1; y: 35.5; skew-x: -10000; skew-y: 0; scale-x: 0.8; }
        frame 70 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; }
        frame 73 { x: 18.4; y: 28.9; skew-x: 3.8; skew-y: 3.8; scale-x: 0.799; scale-y: 0.799; }
        frame 74 { x: 26.6; y: 22.3; skew-x: 7.6; skew-y: 7.6; scale-x: 0.798; scale-y: 0.798; }
        frame 75 { x: 29.2; y: 20.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 31.8; y: 22.2; skew-x: 6.6; skew-y: 6.6; scale-x: 0.734; scale-y: 0.962; }
        frame 77 { x: 29.9; y: 24.1; skew-x: 6; skew-y: 6; scale-x: 0.766; scale-y: 0.88; }
        frame 78 { x: 28; y: 25.8; skew-x: 5.4; skew-y: 5.4; scale-x: 0.798; scale-y: 0.798; }
        frame 79 { x: 27.3; y: 26.5; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_handle";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: -3; y: 45.6; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_HANDLE; }
        frame 14 { x: -2.4; y: 44.5; skew-x: 0.7; skew-y: 0.7; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: -4.8; y: 49.7; skew-x: -4.7; skew-y: -4.7; }
        frame 16 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 17 { x: -5.6; y: 51.5; skew-x: -6.5; skew-y: -6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: -3.9; y: 46.9; skew-x: -3.5; skew-y: -3.5; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -4.9; y: 50.6; skew-x: -6.9; skew-y: -6.9; }
        frame 20 { x: -3.9; y: 45.9; skew-x: -2.9; skew-y: -2.9; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: -5.1; y: 51.7; skew-x: -6.7; skew-y: -6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: -5.2; y: 52.5; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -5.3; y: 53.5; skew-x: -13.5; skew-y: -13.5; }
        frame 24 { x: -4.9; y: 52.1; skew-x: -11.2; skew-y: -11.2; }
        frame 25 { x: -4.6; y: 50.8; skew-x: -8.9; skew-y: -8.9; }
        frame 26 { x: -4.1; y: 49.5; skew-x: -6.7; skew-y: -6.7; }
        frame 27 { x: -3.9; y: 48.2; skew-x: -4.4; skew-y: -4.4; }
        frame 28 { x: -3.4; y: 46.9; skew-x: -2.2; skew-y: -2.2; scale-x: 0.8; scale-y: 0.8; }
        frame 29 { x: -3; y: 45.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -1; y: 37.5; skew-x: 1.1; skew-y: 1.1; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: -0.9; y: 38.9; skew-x: 0.7; skew-y: 0.7; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -2; y: 56; skew-x: -45.5; skew-y: -45.5; scale-x: 0.797; scale-y: 0.797; }
        frame 33 { x: 6.8; y: 66.8; skew-x: -89.6; skew-y: -89.6; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 22.3; y: 68; skew-x: -134.8; skew-y: -134.8; scale-x: 0.797; scale-y: 0.797; }
        frame 35 { x: 35.3; y: 57; skew-x: -180.2; skew-y: -180.2; scale-x: 0.798; scale-y: 0.798; }
        frame 36 { x: 36.8; y: 39.9; skew-x: -231.6; skew-y: -231.6; scale-x: 0.797; scale-y: 0.797; }
        frame 37 { x: 27.6; y: 31.4; skew-x: -269.9; skew-y: -269.9; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 10.3; y: 30.6; skew-x: -319.3; skew-y: -319.3; scale-x: 0.795; scale-y: 0.795; }
        frame 39 { x: 2.4; y: 43; skew-x: -329.9; skew-y: -329.9; scale-x: 0.794; scale-y: 0.794; }
        frame 40 { x: -1.8; y: 40.9; skew-x: -359.5; skew-y: -359.5; scale-x: 0.797; scale-y: 0.797; }
        frame 41 { x: -2.5; y: 58.4; skew-x: -411.8; skew-y: -411.8; scale-x: 0.796; scale-y: 0.796; }
        frame 42 { x: 6.8; y: 67; skew-x: -448.4; skew-y: -448.4; scale-x: 0.799; scale-y: 0.799; }
        frame 43 { x: 21.3; y: 68.1; skew-x: -489.5; skew-y: -489.5; scale-x: 0.798; scale-y: 0.798; }
        frame 44 { x: 34.5; y: 58.1; skew-x: -536.3; skew-y: -536.3; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 36.6; y: 40; skew-x: -592.3; skew-y: -592.3; scale-x: 0.797; scale-y: 0.797; }
        frame 46 { x: 27.2; y: 28.9; skew-x: -629.2; skew-y: -629.2; scale-x: 0.798; scale-y: 0.798; }
        frame 47 { x: 12.8; y: 27.7; skew-x: -670.5; skew-y: -670.5; scale-x: 0.797; scale-y: 0.797; }
        frame 48 { x: -1; y: 37.5; skew-x: -718.8; skew-y: -718.8; scale-x: 0.799; scale-y: 0.799; }
        frame 49 { x: -5.9; y: 51.9; skew-x: -725.1; skew-y: -725.1; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: -2; y: 61.5; skew-x: -768.1; skew-y: -768.1; scale-x: 0.796; scale-y: 0.796; }
        frame 51 { x: 9.3; y: 71; skew-x: -808.7; skew-y: -808.7; scale-x: 0.794; scale-y: 0.794; }
        frame 52 { x: 39.8; y: 61.3; skew-x: -902.1; skew-y: -902.1; scale-x: 0.791; scale-y: 0.791; }
        frame 53 { x: 43.3; y: 42.5; skew-x: -952.3; skew-y: -952.3; scale-x: 0.793; scale-y: 0.793; }
        frame 54 { x: 35; y: 29.6; skew-x: -990.9; skew-y: -990.9; scale-x: 0.8; scale-y: 0.8; }
        frame 55 { x: 14; y: 31.5; skew-x: -1045.7; skew-y: -1045.7; scale-x: 0.797; scale-y: 0.797; }
        frame 56 { x: 0.7; y: 43.8; skew-x: -1079.6; skew-y: -1079.6; scale-x: 0.8; scale-y: 0.8; }
        frame 57 { x: -2.2; y: 69.4; skew-x: -1137.6; skew-y: -1137.6; scale-x: 0.798; scale-y: 0.798; }
        frame 58 { x: 2.5; y: 80.2; skew-x: -1168.9; skew-y: -1168.9; scale-x: 0.797; scale-y: 0.797; }
        frame 59 { x: 17.1; y: -10000; skew-x: -1213.8; skew-y: -1213.8; scale-x: 0.796; scale-y: 0.796; }
        frame 60 { x: 33.4; y: 52.8; skew-x: -1309.6; skew-y: -1309.6; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 24.8; y: 40; skew-x: -1350.4; skew-y: -1350.4; }
        frame 62 { x: 7.8; y: 38.5; skew-x: -1395.1; skew-y: -1395.1; scale-x: 0.797; scale-y: 0.797; }
        frame 63 { x: -3; y: 45.6; skew-x: -1439.9; skew-y: -1439.9; scale-x: 0.8; scale-y: 0.8; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -5.4; y: 48.6; skew-x: -1442.7; skew-y: -1442.7; }
        frame 66 { x: -7.8; y: 51.8; skew-x: -1445.7; skew-y: -1445.7; scale-x: 0.799; scale-y: 0.799; }
        frame 67 { x: -7.6; y: 51.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: -7.4; y: 51.1; }
        frame 69 { x: -7.2; y: 50.8; }
        frame 70 { x: -10000; y: -10000; }
        frame 73 { x: -7.5; y: 48.3; skew-x: -1447.2; skew-y: -1447.2; scale-x: 0.798; scale-y: 0.798; }
        frame 74 { x: -7.9; y: 45.8; skew-x: -1448.6; skew-y: -1448.6; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: -6.2; y: 51.3; skew-x: -1456.5; skew-y: -1456.5; scale-x: 0.797; scale-y: 0.797; }
        frame 76 { x: -4.4; y: 56.9; skew-x: -1464.5; skew-y: -1464.5; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -5.8; y: 56.7; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 78 { x: -7.3; y: 56.5; scale-x: 0.797; scale-y: 0.797; }
        frame 79 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: -3; y: 45.6; skew-x: -1439.9; skew-y: -1439.9; scale-x: 0.8; scale-y: 0.8; }
        frame 81 { x: -8.8; y: 43; skew-x: -1434.9; skew-y: -1434.9; scale-x: 0.799; scale-y: 0.799; }
        frame 82 { x: -14.3; y: 40.6; skew-x: -1429.6; skew-y: -1429.6; scale-x: 0.798; scale-y: 0.798; }
        frame 83 { x: -20; y: 38.2; skew-x: -1424.6; skew-y: -1424.6; scale-x: 0.797; scale-y: 0.797; }
        frame 84 { x: -25.5; y: 35.8; skew-x: -1419.3; skew-y: -1419.3; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: -28.5; y: 31.5; skew-x: -1413.3; skew-y: -1413.3; scale-x: 0.795; scale-y: 0.795; }
        frame 86 { x: -31.5; y: 27.3; skew-x: -1407.3; skew-y: -1407.3; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -34.5; y: 23.2; skew-x: -1401.5; skew-y: -1401.5; }
        frame 88 { x: -37.5; y: 19.2; skew-x: -1395.4; skew-y: -1395.4; scale-x: 0.796; scale-y: 0.796; }
        frame 89 { x: -39.7; y: 28.1; skew-x: -1383.7; skew-y: -1383.7; scale-x: 0.794; scale-y: 0.794; }
        frame 90 { x: -41.9; y: 37.5; skew-x: -1372; skew-y: -1372; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -44.3; y: 47.3; skew-x: -1360.4; skew-y: -1360.4; scale-x: 0.795; scale-y: 0.795; }
        frame 92 { x: -46.8; y: 57.5; skew-x: -1348.9; skew-y: -1348.9; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -49.6; y: 68.1; skew-x: -1337.1; skew-y: -1337.1; scale-x: 0.794; scale-y: 0.794; }
        frame 94 { x: -52.7; y: 79; skew-x: -1325.5; skew-y: -1325.5; scale-x: 0.795; scale-y: 0.795; }
        frame 95 { x: -55; y: 83; skew-x: -1332.1; skew-y: -1335.8; scale-x: 0.747; scale-y: 0.852; }
        frame 96 { x: -57.2; y: 87.1; skew-x: -1338.6; skew-y: -1345.8; scale-x: 0.701; scale-y: 0.91; }
        frame 97 { x: -58.4; y: 79.4; skew-x: -1339.8; skew-y: -1343.4; scale-x: 0.747; scale-y: 0.852; }
        frame 98 { x: -59.8; y: 71.7; skew-x: -1340.7; skew-y: -1340.7; scale-x: 0.794; scale-y: 0.794; }
        frame 99 { x: -60.3; y: 75.7; skew-x: -1342.1; skew-y: -1342.1; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: -61; y: 79.8; skew-x: -1343.3; skew-y: -1343.3; }
        frame 101 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_box";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 7.8; y: 43.5; skew-x: -5.7; skew-y: -5.7; scale-x: 0.67; scale-y: 0.67; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_BOX; }
        frame 14 { x: 8.7; y: 42; skew-x: -4.5; skew-y: -4.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 6.3; y: 45.6; skew-x: -9.3; skew-y: -9.3; }
        frame 16 { x: 7.6; y: 43.5; skew-x: -6.3; skew-y: -6.3; }
        frame 17 { x: 5.6; y: 47.6; skew-x: -9.8; skew-y: -9.8; }
        frame 18 { x: 7.6; y: 43.9; skew-x: -6.1; skew-y: -6.1; }
        frame 19 { x: 6.7; y: 47.1; skew-x: -8.8; skew-y: -8.8; }
        frame 20 { x: 8; y: 43.1; skew-x: -4.6; skew-y: -4.6; }
        frame 21 { x: 6.6; y: 48.4; skew-x: -8.3; skew-y: -8.3; }
        frame 22 { x: -10000; y: 48.9; skew-x: -8.8; skew-y: -8.8; }
        frame 23 { x: 6.3; y: 49.4; skew-x: -9.6; skew-y: -9.6; }
        frame 24 { x: 6.7; y: 48.4; skew-x: -8.8; skew-y: -8.8; }
        frame 25 { x: 6.9; y: 47.4; skew-x: -8.3; skew-y: -8.3; }
        frame 26 { x: 7.1; y: 46.4; skew-x: -7.5; skew-y: -7.5; }
        frame 27 { x: 7.3; y: 45.5; skew-x: -7; skew-y: -7; }
        frame 28 { x: 7.7; y: 44.5; skew-x: -6.3; skew-y: -6.3; }
        frame 29 { x: 7.8; y: 43.5; skew-x: -5.7; skew-y: -5.7; }
        frame 30 { x: 12.2; y: 35.3; skew-x: 2.3; skew-y: 2.3; }
        frame 31 { x: 12; y: 37; skew-x: 1.4; skew-y: 1.4; }
        frame 32 { x: 12.1; y: 36; skew-x: 1.7; skew-y: 1.7; }
        frame 33 { x: 12.2; y: 35; skew-x: 1.9; skew-y: 1.9; }
        frame 34 { x: -10000; y: 34; skew-x: 2.2; skew-y: 2.2; }
        frame 35 { y: 33.5; skew-x: 2.7; skew-y: 2.7; scale-x: 0.669; scale-y: 0.669; }
        frame 36 { x: 12.3; y: 33; skew-x: 3.2; skew-y: 3.2; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 12.1; y: 35.4; skew-x: 2.9; skew-y: 2.9; }
        frame 38 { x: 12; y: 37.5; skew-x: 3; skew-y: 3; }
        frame 39 { x: 5.1; y: 49.5; skew-x: -9.1; skew-y: -9.1; scale-x: 0.668; scale-y: 0.668; }
        frame 40 { x: 7.3; y: 44.8; skew-x: -5.4; skew-y: -5.4; scale-x: 0.669; scale-y: 0.669; }
        frame 41 { x: 9.7; y: 39.9; skew-x: -1.5; skew-y: -1.5; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 12.2; y: 35.3; skew-x: 2.3; skew-y: 2.3; scale-x: 0.67; scale-y: 0.67; }
        frame 43 { x: 12.3; y: 34.6; skew-x: 2.2; skew-y: 2.2; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 12.2; y: 34; skew-x: -10000; skew-y: -10000; }
        frame 45 { x: -10000; y: 33.5; skew-x: 2.7; skew-y: 2.7; scale-x: 0.669; scale-y: 0.669; }
        frame 46 { x: 12.3; y: 33; skew-x: 3.2; skew-y: 3.2; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: -10000; y: 34.1; skew-x: 2.7; skew-y: 2.7; }
        frame 48 { x: 12.2; y: 35.3; skew-x: 2.3; skew-y: 2.3; scale-x: 0.67; scale-y: 0.67; }
        frame 49 { x: 4.8; y: 49; skew-x: -11; skew-y: -11; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 7.5; y: 45.8; skew-x: -8.5; skew-y: -8.5; }
        frame 51 { x: 10.2; y: 42.5; skew-x: -6; skew-y: -6; }
        frame 52 { x: 13; y: 39.5; skew-x: -3.7; skew-y: -3.7; }
        frame 53 { x: 15.8; y: 36.3; skew-x: -1.2; skew-y: -1.2; scale-x: 0.669; scale-y: 0.669; }
        frame 54 { x: 18.7; y: 33.2; skew-x: 1.2; skew-y: 1.2; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 14.8; y: 36.5; skew-x: -1.4; skew-y: -1.4; }
        frame 56 { x: 11.1; y: 39.8; skew-x: -4; skew-y: -4; scale-x: 0.67; scale-y: 0.67; }
        frame 57 { x: 7.3; y: 43; skew-x: -6.5; skew-y: -6.5; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 3.6; y: 46.4; skew-x: -9.2; skew-y: -9.2; }
        frame 59 { x: 4.5; y: 45.9; skew-x: -8.5; skew-y: -8.5; }
        frame 60 { x: 5.3; y: 45.3; skew-x: -7.8; skew-y: -7.8; }
        frame 61 { x: 6.2; y: 44.6; skew-x: -7; skew-y: -7; }
        frame 62 { x: 7.1; y: 44; skew-x: -6.3; skew-y: -6.3; }
        frame 63 { x: 7.8; y: 43.5; skew-x: -5.7; skew-y: -5.7; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 65 { x: 4.9; y: 45.9; skew-x: -9.5; skew-y: -9.5; }
        frame 66 { x: 2; y: 48.3; skew-x: -13.5; skew-y: -13.5; }
        frame 67 { x: 0.8; y: 47.1; skew-x: -15.5; skew-y: -15.5; }
        frame 68 { x: 1.4; y: 45.1; skew-x: -10000; skew-y: -10000; scale-x: 0.669; scale-y: 0.669; }
        frame 69 { x: 1.9; y: 43.3; skew-x: -15.8; skew-y: -15.8; scale-x: 0.67; scale-y: 0.67; }
        frame 70 { x: -10000; y: 43.6; skew-x: -10000; skew-y: -10000; scale-x: 0.669; scale-y: 0.669; }
        frame 71 { x: 2; y: 43.8; skew-x: -15.6; skew-y: -15.6; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 1.9; y: 44.2; skew-x: -15.7; skew-y: -15.7; scale-x: 0.67; scale-y: 0.67; }
        frame 73 { x: 0.7; y: 41.4; skew-x: -18.3; skew-y: -18.3; scale-x: 0.669; scale-y: 0.669; }
        frame 74 { x: -0.5; y: 38.6; skew-x: -21.2; skew-y: -21.2; scale-x: 0.67; scale-y: 0.67; }
        frame 75 { x: 0.8; y: 42.5; skew-x: -24.8; skew-y: -24.8; scale-x: 0.669; scale-y: 0.669; }
        frame 76 { x: 2.3; y: 46.5; skew-x: -28.3; skew-y: -28.3; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 1.3; y: 47.3; skew-x: -28.5; skew-y: -28.5; }
        frame 78 { x: 0.2; y: 47.9; skew-x: -28.7; skew-y: -28.7; }
        frame 79 { x: -10000; y: 48; skew-x: -28.9; skew-y: -28.9; }
        frame 80 { x: 7.8; y: 43.5; skew-x: -5.7; skew-y: -5.7; scale-x: 0.67; scale-y: 0.67; }
        frame 81 { x: 2; y: 42; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: -3.5; y: 40.4; skew-x: 4.4; skew-y: 4.4; scale-x: 0.669; scale-y: 0.669; }
        frame 83 { x: -9.1; y: 39; skew-x: 9.5; skew-y: 9.5; scale-x: 0.668; scale-y: 0.668; }
        frame 84 { x: -14.4; y: 37.8; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: -18; y: 34.3; skew-x: 20.7; skew-y: 20.7; scale-x: 0.666; scale-y: 0.666; }
        frame 86 { x: -21.5; y: 31.1; skew-x: 26.7; skew-y: 26.7; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -24.9; y: 28.2; skew-x: 32.5; skew-y: 32.5; }
        frame 88 { x: -28.1; y: 25.5; skew-x: 38.6; skew-y: 38.6; scale-x: 0.667; scale-y: 0.667; }
        frame 89 { x: -31.7; y: 33.8; skew-x: 50.3; skew-y: 50.3; scale-x: 0.666; scale-y: 0.666; }
        frame 90 { x: -35.3; y: 43; skew-x: 62.1; skew-y: 62.1; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -39.5; y: 53.5; skew-x: 73.6; skew-y: 73.6; }
        frame 92 { x: -44; y: 64.8; skew-x: 85.2; skew-y: 85.2; }
        frame 93 { x: -49.3; y: 77; skew-x: 96.9; skew-y: 96.9; }
        frame 94 { x: -55.4; y: 89.9; skew-x: 108.6; skew-y: 108.6; }
        frame 95 { x: -56; y: 93.5; skew-x: 101.1; skew-y: 99; scale-x: 0.622; scale-y: 0.717; }
        frame 96 { x: -56.8; y: 96.7; skew-x: 93.7; skew-y: 89.6; scale-x: 0.58; scale-y: 0.769; }
        frame 97 { x: -58.1; y: 89.8; skew-x: 93.4; skew-y: 91.4; scale-x: 0.623; scale-y: 0.717; }
        frame 98 { x: -59.4; y: 82.9; skew-x: 93.3; skew-y: 93.3; scale-x: 0.665; scale-y: 0.665; }
        frame 99 { x: -59.8; y: 86.8; skew-x: 91.9; skew-y: 91.9; scale-x: -10000; scale-y: -10000; }
        frame 100 { x: -60.1; y: 91; skew-x: 90.8; skew-y: 90.8; }
        frame 101 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_box2";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 67 { x: -10.4; y: 35.1; skew-x: -15.4; skew-y: -15.4; scale-x: 0.679; scale-y: 0.679; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_BOX2; }
        frame 68 { x: -9.6; y: 33.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 69 { x: -8.9; y: 31.2; }
        frame 70 { x: -10000; y: 31.5; }
        frame 71 { y: 31.8; }
        frame 72 { y: 32.3; skew-x: -15.5; skew-y: -15.5; }
        frame 73 { x: -10.9; y: 30.1; skew-x: -18.4; skew-y: -18.4; }
        frame 74 { x: -12.9; y: 27.9; skew-x: -21.4; skew-y: -21.4; scale-x: 0.68; scale-y: 0.68; }
        frame 75 { x: -11.8; y: 32.8; skew-x: -25; skew-y: -25; scale-x: 0.679; scale-y: 0.679; }
        frame 76 { x: -10.7; y: 37.5; skew-x: -28.7; skew-y: -28.7; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -11.8; y: 38.2; skew-x: -10000; skew-y: -10000; scale-x: 0.678; scale-y: 0.678; }
        frame 78 { x: -12.9; y: 38.8; scale-x: 0.679; scale-y: 0.679; }
        frame 79 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_clownneck3";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 68 { x: 16; y: 49.4; scale-x: 0.8; scale-y: 0.211; cel: 0; alpha: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_CLOWNNECK; }
        frame 69 { x: 15.2; y: 36.5; skew-x: -5.2; skew-y: -5.2; scale-x: 0.687; scale-y: 0.901; cel: -10000; alpha: 1; image: none; }
        frame 70 { x: 15.8; y: 48; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.191; alpha: 0; }
        frame 71 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 72 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_clownneck2";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 68 { x: 15.9; y: 44.2; scale-x: 0.8; scale-y: 0.413; cel: 0; alpha: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_CLOWNNECK; }
        frame 69 { x: 8.1; y: 29; skew-x: -18.2; skew-y: -18.2; scale-x: 0.686; scale-y: 0.9; cel: -10000; alpha: 1; image: none; }
        frame 70 { x: 15.1; y: 36.9; skew-x: -2.9; skew-y: -2.9; scale-x: 0.776; scale-y: 0.862; alpha: -10000; }
        frame 71 { x: 15.5; y: 38.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.746; }
        frame 72 { x: 15.1; y: 36.9; scale-y: 0.862; }
        frame 73 { x: 13.3; y: 33.9; scale-y: -10000; }
        frame 74 { x: 12.5; y: 30.3; }
        frame 75 { x: 13.9; y: 33; }
        frame 76 { x: 14.6; y: 36.7; skew-x: -12.5; skew-y: -12.5; scale-x: 0.775; scale-y: 0.861; }
        frame 77 { x: 13.3; y: 37.4; skew-x: -13.9; skew-y: -13.9; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 12.8; y: 38.4; skew-x: -15.4; skew-y: -15.4; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_clownneck1";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 68 { x: 14.7; y: 39.9; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_CLOWNNECK; }
        frame 69 { x: -0.4; y: 23.1; skew-x: -30.8; skew-y: -30.8; scale-x: 0.685; scale-y: 0.899; cel: -10000; image: none; }
        frame 70 { x: 8.1; y: 29.8; skew-x: -13.9; skew-y: -13.9; scale-x: 0.775; scale-y: 0.861; }
        frame 71 { x: 6.6; y: 31.7; skew-x: -21.2; skew-y: -21.2; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 8.1; y: 29.8; skew-x: -13.9; skew-y: -13.9; }
        frame 73 { x: 6.7; y: 26.1; skew-x: -10000; skew-y: -10000; }
        frame 74 { x: 5.8; y: 22.7; }
        frame 75 { x: 6.8; y: 26; }
        frame 76 { x: 6.5; y: 30.9; skew-x: -23.5; skew-y: -23.5; }
        frame 77 { x: 5.1; y: 31.8; skew-x: -24.9; skew-y: -24.9; scale-x: 0.774; scale-y: 0.86; }
        frame 78 { x: 5; y: 32.4; skew-x: -26.4; skew-y: -26.4; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 80 { cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_clownhead";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 67 { x: 6.2; y: 37.3; skew-x: 1.7; skew-y: 1.7; scale-x: 0.541; scale-y: 0.307; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_CLOWNHEAD; }
        frame 68 { x: -2.8; y: 17.5; skew-x: -12.2; skew-y: -12.2; scale-x: 0.535; scale-y: 0.711; cel: -10000; image: none; }
        frame 69 { x: -19.3; y: 4; skew-x: -23.8; skew-y: -23.8; scale-x: 0.502; scale-y: 0.733; }
        frame 70 { x: -15.1; y: 9.8; skew-x: -19.4; skew-y: -19.4; scale-x: 0.559; scale-y: 0.649; }
        frame 71 { x: -11.3; y: 15.8; skew-x: -15.2; skew-y: -15.2; scale-x: 0.618; scale-y: 0.566; }
        frame 72 { x: -11; y: 12.9; skew-x: -10000; skew-y: -10000; scale-x: 0.583; scale-y: 0.583; }
        frame 73 { x: -13.1; y: 10.8; skew-x: -18; skew-y: -18; scale-x: 0.582; scale-y: 0.582; }
        frame 74 { x: -15.2; y: 8.9; skew-x: -21; skew-y: -21; scale-x: 0.583; scale-y: 0.583; }
        frame 75 { x: -15.8; y: 14.1; skew-x: -24.5; skew-y: -24.5; scale-x: 0.582; scale-y: 0.582; }
        frame 76 { x: -16.3; y: 19.5; skew-x: -28.3; skew-y: -28.3; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -17; y: 19.7; skew-x: -28.2; skew-y: -28.2; scale-x: 0.581; scale-y: 0.581; }
        frame 78 { x: -17.8; y: 20; skew-x: -28.3; skew-y: -28.3; scale-x: 0.582; scale-y: 0.582; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 80 { cel: -1; }
        frame 81 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_jackbox_outerarm_upper";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 44.6; y: 38.1; skew-x: -7.8; skew-y: 5.1; scale-x: 0.767; scale-y: 0.795; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERARM_UPPER; }
        frame 14 { x: 45.5; y: 37.5; skew-x: -6.4; skew-y: 6.1; scale-x: 0.766; scale-y: 0.794; cel: -10000; image: none; }
        frame 15 { x: 42.6; y: 38.4; skew-x: -11.2; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 44.3; y: 38.8; skew-x: -8.4; skew-y: 4.3; scale-x: 0.767; scale-y: 0.795; }
        frame 17 { x: 42; y: 39.6; skew-x: -11.7; skew-y: 0.8; scale-x: 0.766; scale-y: 0.794; }
        frame 18 { x: 44.5; y: 37.7; skew-x: -8; skew-y: 4.5; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 43; y: 39.1; skew-x: -10.7; skew-y: 1.8; }
        frame 20 { x: 44.8; y: 37.7; skew-x: -6.7; skew-y: 5.8; }
        frame 21 { x: 43.1; y: 40.5; skew-x: -10.3; skew-y: 2.6; scale-x: 0.767; scale-y: 0.795; }
        frame 22 { x: 43.3; y: -10000; skew-x: -9.9; skew-y: 2.8; scale-x: 0.766; scale-y: -10000; }
        frame 23 { x: 43.5; skew-x: -9.7; skew-y: 3.1; scale-x: -10000; }
        frame 24 { x: 43.6; y: 40.1; skew-x: -9.2; skew-y: 3.3; }
        frame 25 { x: 43.8; y: 39.8; skew-x: -8.9; skew-y: 3.6; }
        frame 26 { x: 44.1; y: 39.4; skew-x: -8.7; skew-y: 4; }
        frame 27 { x: 44.3; y: 39; skew-x: -8.4; skew-y: 4.3; }
        frame 28 { x: 44.5; y: 38.5; skew-x: -8; skew-y: 4.8; scale-x: 0.767; }
        frame 29 { x: 44.6; y: 38.1; skew-x: -7.8; skew-y: 5.1; scale-x: -10000; }
        frame 30 { x: 49.3; y: 35; skew-x: 0.3; skew-y: 13.1; scale-x: 0.766; scale-y: 0.794; }
        frame 31 { x: 49.1; y: 36.3; skew-x: -0.4; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -10000; y: 35.5; skew-x: -0.2; skew-y: -10000; scale-y: 0.793; }
        frame 33 { y: 34.5; skew-x: -10000; scale-y: -10000; }
        frame 34 { y: 33.8; scale-y: 0.794; }
        frame 35 { y: 33.4; skew-x: 0; scale-y: 0.793; }
        frame 36 { x: 49; y: 32.9; skew-x: -0; scale-y: -10000; }
        frame 37 { x: 48.6; y: 35.2; skew-x: 0; scale-y: 0.792; }
        frame 38 { x: 48.4; y: 37.5; skew-x: -10000; scale-y: 0.793; }
        frame 39 { x: 40.6; y: 40.9; skew-x: -11.2; skew-y: 1; scale-x: 0.765; scale-y: 0.792; }
        frame 40 { x: 43.2; y: 38.5; skew-x: -7.4; skew-y: 4.5; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 45.8; y: 36.1; skew-x: -3.7; skew-y: 8.3; scale-x: 0.766; }
        frame 42 { x: 48.5; y: 34; skew-x: -0.2; skew-y: 12; scale-x: -10000; }
        frame 43 { x: 48.6; y: 33.3; skew-x: 0; skew-y: -10000; }
        frame 44 { x: 48.8; y: 32.5; skew-x: -10000; skew-y: 12.3; }
        frame 45 { x: 49; y: -10000; skew-y: 12.5; }
        frame 46 { x: 49.3; skew-x: 0.2; skew-y: 12.8; scale-y: 0.793; }
        frame 47 { x: -10000; y: 33.8; skew-x: 0.3; skew-y: -10000; scale-y: -10000; }
        frame 48 { y: 35; skew-x: -10000; skew-y: 13.1; scale-y: 0.794; }
        frame 49 { x: 40.9; y: 40.1; skew-x: -13.1; skew-y: -0; scale-y: -10000; }
        frame 50 { x: 43.9; y: 38.5; skew-x: -10.5; skew-y: 2.3; }
        frame 51 { x: 46.8; y: 37; skew-x: -8; skew-y: 4.8; }
        frame 52 { x: 49.9; y: 35.4; skew-x: -5.7; skew-y: 7.3; }
        frame 53 { x: 52.8; y: 33.9; skew-x: -3.2; skew-y: 9.6; scale-y: 0.793; }
        frame 54 { x: 55.8; y: 32.3; skew-x: -0.7; skew-y: 12.2; scale-y: 0.794; }
        frame 55 { x: 51.8; y: 33.8; skew-x: -3.2; skew-y: 9.5; scale-y: 0.793; }
        frame 56 { x: 47.8; y: 35.3; skew-x: -5.9; skew-y: 6.8; scale-y: 0.794; }
        frame 57 { x: 43.9; y: 37; skew-x: -8.7; skew-y: 4.3; scale-y: -10000; }
        frame 58 { x: 40.1; y: 38.6; skew-x: -11.3; skew-y: 1.6; scale-x: 0.767; }
        frame 59 { x: 41; y: 38.5; skew-x: -10.5; skew-y: 2.3; scale-x: 0.766; }
        frame 60 { x: 42; y: -10000; skew-x: -9.9; skew-y: 3; scale-x: -10000; }
        frame 61 { x: 42.9; y: 38.3; skew-x: -9.2; skew-y: 3.6; }
        frame 62 { x: 43.8; y: 38.1; skew-x: -8.4; skew-y: 4.3; scale-x: 0.767; scale-y: 0.795; }
        frame 63 { x: 44.6; y: -10000; skew-x: -7.8; skew-y: 5.1; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 65 { x: 44.1; y: 38; skew-x: -7.7; skew-y: 5; }
        frame 66 { x: 43.5; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.766; scale-y: 0.794; }
        frame 67 { x: 43; scale-x: 0.767; scale-y: 0.795; }
        frame 68 { x: 43.8; y: 38.1; scale-x: 0.766; scale-y: -10000; }
        frame 69 { x: 44.6; y: -10000; skew-x: -7.8; skew-y: 5.1; scale-x: 0.767; }
        frame 70 { x: -10000; y: 38; skew-x: -7.7; skew-y: 5; scale-x: -10000; }
        frame 71 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 72 { y: 38.1; skew-x: -7.8; skew-y: 5.1; }
        frame 73 { x: 53.4; y: 34; skew-x: 6; skew-y: 19.8; scale-x: 0.766; scale-y: 0.863; }
        frame 74 { x: 62.8; y: 31.3; skew-x: 20.3; skew-y: 34.6; scale-x: -10000; scale-y: 0.933; }
        frame 75 { x: 63.2; y: 30.7; skew-x: 18.3; skew-y: 32.6; scale-x: 0.765; scale-y: 0.931; }
        frame 76 { x: 63.8; y: 30.1; skew-x: 16.5; skew-y: 30.8; scale-x: -10000; scale-y: 0.932; }
        frame 77 { x: 62.7; y: 31; skew-x: 16.3; skew-y: -10000; scale-y: 0.931; }
        frame 78 { x: 61.6; y: 31.9; skew-x: 16.5; scale-y: 0.932; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 80 { x: 44.6; y: 38.1; skew-x: -7.8; skew-y: 5.1; scale-x: 0.767; scale-y: 0.795; }
        frame 81 { x: 39.1; y: 40.1; skew-x: -5.7; skew-y: 7; scale-x: 0.766; scale-y: 0.794; }
        frame 82 { x: 33.6; y: 42.3; skew-x: -3.9; skew-y: 9; scale-x: 0.765; scale-y: 0.793; }
        frame 83 { x: 28; y: 44.3; skew-x: -1.9; skew-y: 10.8; scale-x: -10000; scale-y: 0.792; }
        frame 84 { x: 22.4; y: 46.4; skew-x: -0; skew-y: 12.9; scale-x: 0.764; scale-y: -10000; }
        frame 85 { x: 15.5; y: 47.6; skew-x: 2.8; skew-y: 15.8; scale-x: -10000; scale-y: 0.791; }
        frame 86 { x: 8.7; y: 49; skew-x: 5.8; skew-y: 18.8; scale-x: 0.763; scale-y: 0.79; }
        frame 87 { x: 1.8; y: 50.4; skew-x: 8.8; skew-y: 21.8; scale-x: 0.762; scale-y: -10000; }
        frame 88 { x: -4.9; y: 51.8; skew-x: 11.9; skew-y: 24.9; scale-x: -10000; }
        frame 89 { x: -18.1; y: 65.9; skew-x: 1; skew-y: 14; scale-y: 0.788; }
        frame 90 { x: -31.1; y: 80.6; skew-x: -9.4; skew-y: 3.3; scale-x: 0.761; scale-y: -10000; }
        frame 91 { x: -34.1; y: 84.1; skew-x: -5.7; skew-y: 6.8; scale-x: 0.76; scale-y: 0.787; }
        frame 92 { x: -36.9; y: 87.7; skew-x: -2.2; skew-y: 10.3; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -39.8; y: 91.5; skew-x: 1; skew-y: 14; }
        frame 94 { x: -42.7; y: 95.2; skew-x: 4.6; skew-y: 17.7; scale-x: 0.759; }
        frame 95 { x: -10000; y: 96.1; skew-x: 4.3; skew-y: 18.3; scale-x: 0.783; scale-y: 0.778; }
        frame 96 { y: 97.1; skew-x: 4.2; skew-y: 19.3; scale-x: 0.806; scale-y: 0.77; }
        frame 97 { x: -43.1; y: 98.3; skew-x: 4; skew-y: 19.8; scale-x: 0.82; scale-y: 0.757; }
        frame 98 { x: -43.4; y: 99.4; skew-x: 3.9; skew-y: 20.6; scale-x: 0.834; scale-y: 0.747; }
        frame 99 { x: -43.1; y: 98; skew-x: 4; skew-y: 19.8; scale-x: 0.82; scale-y: 0.757; }
        frame 100 { x: -42.7; y: 96.3; skew-x: 4.2; skew-y: 19.3; scale-x: 0.806; scale-y: 0.77; }
        frame 101 { x: -10000; y: 96.8; skew-x: 4.1; skew-y: -10000; scale-x: -10000; scale-y: 0.769; }
        frame 102 { y: 97.1; skew-x: 4.2; scale-y: 0.77; }
    }
    Track {
        source-name: "Zombie_jackbox_outerarm_lower";
        frame-count: 103;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 14.2; y: 59.5; skew-x: -5.7; skew-y: -5.7; scale-x: 0.747; scale-y: 0.747; cel: 0; image: IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERARM_LOWER; }
        frame 14 { x: 14.9; y: 58; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 15 { x: 13.8; y: 60.9; skew-x: -8.5; skew-y: -8.5; }
        frame 16 { x: 14.1; y: 59; skew-x: -4.9; skew-y: -4.9; }
        frame 17 { x: 13; y: 62.9; skew-x: -9.7; skew-y: -9.7; }
        frame 18 { x: 13.9; y: 59.9; skew-x: -6.7; skew-y: -6.7; scale-x: 0.746; scale-y: 0.746; }
        frame 19 { x: 13.7; y: 63.1; skew-x: -10; skew-y: -10; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: -10000; y: 59.6; skew-x: -5.9; skew-y: -5.9; }
        frame 21 { x: 13.3; y: 64.3; skew-x: -9.8; skew-y: -9.8; scale-x: 0.747; scale-y: 0.747; }
        frame 22 { x: 13.5; y: 64.8; skew-x: -10.4; skew-y: -10.4; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 13.6; y: 65.1; skew-x: -11.2; skew-y: -11.2; }
        frame 24 { x: 13.8; y: 64.1; skew-x: -10.2; skew-y: -10.2; scale-x: 0.746; scale-y: 0.746; }
        frame 25 { x: -10000; y: 63.2; skew-x: -9.4; skew-y: -9.4; scale-x: 0.747; scale-y: 0.747; }
        frame 26 { x: 14; y: 62.3; skew-x: -8.4; skew-y: -8.4; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 14.1; y: 61.3; skew-x: -7.4; skew-y: -7.4; }
        frame 28 { x: -10000; y: 60.5; skew-x: -6.7; skew-y: -6.7; }
        frame 29 { x: 14.2; y: 59.5; skew-x: -5.7; skew-y: -5.7; }
        frame 30 { x: 16.1; y: 52; skew-x: 2.3; skew-y: 2.3; }
        frame 31 { x: 16.2; y: 53.6; skew-x: 1.5; skew-y: 1.5; }
        frame 32 { x: 16.1; y: 52.9; skew-x: -10000; skew-y: -10000; }
        frame 33 { x: -10000; y: 52; }
        frame 34 { y: 51.2; }
        frame 35 { x: 16; y: 50.8; }
        frame 36 { x: 15.9; y: 50.3; }
        frame 37 { x: 15.5; y: 52.5; }
        frame 38 { x: 15.3; y: 54.8; }
        frame 39 { x: 12; y: 65.8; skew-x: -12.8; skew-y: -12.5; scale-x: 0.746; scale-y: 0.746; }
        frame 40 { x: 13.2; y: 61.2; skew-x: -8.7; skew-y: -8.4; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 14.4; y: 56.8; skew-x: -4.7; skew-y: -4.4; }
        frame 42 { x: 15.7; y: 52.5; skew-x: -0.7; skew-y: -0.4; }
        frame 43 { x: 15.8; y: 51.5; skew-x: -0.2; skew-y: 0; }
        frame 44 { x: -10000; y: 50.5; skew-x: 0.3; skew-y: 0.3; scale-y: 0.747; }
        frame 45 { x: 15.9; y: 50.1; skew-x: 0.8; skew-y: 0.8; scale-x: 0.747; scale-y: -10000; }
        frame 46 { x: 16; y: 49.7; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; }
        frame 47 { x: 16.1; y: 51; skew-x: 1.8; skew-y: 1.8; }
        frame 48 { x: -10000; y: 52; skew-x: 2.3; skew-y: 2.3; }
        frame 49 { x: 12.5; y: 64.2; skew-x: -11; skew-y: -11; }
        frame 50 { x: 14.5; y: 61.4; skew-x: -8.7; skew-y: -8.7; scale-x: 0.746; scale-y: 0.746; }
        frame 51 { x: 16.5; y: 58.7; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 18.4; y: 56; skew-x: -4.7; skew-y: -4.7; }
        frame 53 { x: 20.5; y: 53.2; skew-x: -2.4; skew-y: -2.4; }
        frame 54 { x: 22.6; y: 50.5; skew-x: -0.4; skew-y: -0.4; }
        frame 55 { x: 19.8; y: 53.2; skew-x: -2.5; skew-y: -2.5; }
        frame 56 { x: 16.9; y: 56.1; skew-x: -4.7; skew-y: -4.7; }
        frame 57 { x: 14; y: 59; skew-x: -6.9; skew-y: -6.9; }
        frame 58 { x: 11.1; y: 61.9; skew-x: -9.2; skew-y: -9.2; scale-x: 0.747; scale-y: 0.747; }
        frame 59 { x: 11.7; y: 61.3; skew-x: -8.4; skew-y: -8.4; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 12.3; y: 60.9; skew-x: -7.7; skew-y: -7.7; }
        frame 61 { x: 13; y: 60.4; skew-x: -7; skew-y: -7; }
        frame 62 { x: 13.6; y: 60; skew-x: -6.4; skew-y: -6.4; }
        frame 63 { x: 14.2; y: 59.5; skew-x: -5.7; skew-y: -5.7; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 65 { x: 13.7; y: 60.5; skew-x: -7.2; skew-y: -6.2; }
        frame 66 { x: 13.3; y: 61.5; skew-x: -8.5; skew-y: -6.7; }
        frame 67 { x: 12.8; y: 62.5; skew-x: -10.1; skew-y: -7.4; scale-x: 0.748; }
        frame 68 { x: 13.6; y: 61; skew-x: -7.9; skew-y: -6.4; scale-x: 0.747; }
        frame 69 { x: 14.2; y: 59.5; skew-x: -5.7; skew-y: -5.7; scale-x: -10000; }
        frame 70 { x: 14.3; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: -10000; }
        frame 72 { x: 14.2; }
        frame 73 { x: 15.3; y: 54.5; skew-x: -2.2; skew-y: -2.2; scale-x: 0.768; }
        frame 74 { x: 16.4; y: 49.6; skew-x: 1.2; skew-y: 1.2; scale-x: 0.79; }
        frame 75 { x: 18; y: 52.4; skew-x: -4.7; skew-y: -4.7; scale-x: 0.789; scale-y: 0.746; }
        frame 76 { x: 19.8; y: 55.4; skew-x: -11; skew-y: -11; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 18.8; y: 56.4; skew-x: -10.9; skew-y: -10.9; scale-x: 0.788; }
        frame 78 { x: 17.6; y: 57.5; skew-x: -11; skew-y: -11; scale-x: 0.789; }
        frame 79 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 80 { x: 14.3; y: 56.5; skew-x: -0.1; skew-y: -0.1; scale-x: 0.747; scale-y: 0.747; image: IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERARM_LOWER2; }
        frame 81 { x: 8.2; y: 57.5; skew-x: 1.5; skew-y: 1.5; scale-x: 0.746; scale-y: 0.746; image: none; }
        frame 82 { x: 2; y: 58.5; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: -3.8; y: 59.5; skew-x: 5.5; skew-y: 5.5; scale-x: 0.745; scale-y: 0.745; }
        frame 84 { x: -9.9; y: 60.4; skew-x: 7.5; skew-y: 7.5; scale-x: 0.744; scale-y: 0.744; }
        frame 85 { x: -17.4; y: 59.9; skew-x: 10.5; skew-y: 10.5; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: -24.8; y: 59.4; skew-x: 13.5; skew-y: 13.5; scale-x: 0.743; scale-y: 0.743; }
        frame 87 { x: -32.1; y: 59; skew-x: 16.5; skew-y: 16.5; scale-x: 0.742; scale-y: 0.742; }
        frame 88 { x: -39.5; y: 58.7; skew-x: 19.6; skew-y: 19.6; scale-x: 0.743; scale-y: 0.743; }
        frame 89 { x: -48.9; y: 74.4; skew-x: 15.8; skew-y: 15.8; scale-x: 0.741; scale-y: 0.741; }
        frame 90 { x: -58.2; y: 90.2; skew-x: 12.1; skew-y: 12.1; scale-x: 0.74; scale-y: 0.74; }
        frame 91 { x: -60.3; y: 89.6; skew-x: 19.1; skew-y: 19.1; scale-x: 0.739; scale-y: 0.739; }
        frame 92 { x: -62.3; y: 89.5; skew-x: 26.1; skew-y: 26.1; scale-x: 0.738; scale-y: 0.738; }
        frame 93 { x: -64; y: 89.8; skew-x: 33.3; skew-y: 33.3; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: -65.8; y: 90.6; skew-x: 40.4; skew-y: 40.4; scale-x: 0.739; scale-y: 0.739; }
        frame 95 { x: -66.5; y: 91.6; skew-x: 39.1; skew-y: 41.6; scale-x: 0.746; scale-y: 0.741; }
        frame 96 { x: -67.2; y: 92.6; skew-x: 37.9; skew-y: 43; scale-x: 0.756; scale-y: 0.745; }
        frame 97 { x: -68; y: 93.9; skew-x: 36.8; skew-y: 44.1; scale-x: 0.758; scale-y: 0.743; }
        frame 98 { x: -68.8; y: 95.1; skew-x: 35.8; skew-y: 45.1; scale-x: 0.763; scale-y: -10000; }
        frame 99 { x: -66.9; y: 92.6; skew-x: 38.6; skew-y: 45.9; scale-x: 0.758; }
        frame 100 { x: -65; y: 90; skew-x: 41.6; skew-y: 46.8; scale-x: 0.756; scale-y: 0.745; }
        frame 101 { x: -66.3; y: 90.8; skew-x: 39.6; skew-y: 44.6; scale-x: 0.755; scale-y: 0.744; }
        frame 102 { x: -67.5; y: 91.7; skew-x: 37.4; skew-y: 42.5; scale-x: 0.756; scale-y: 0.745; }
    }
}
