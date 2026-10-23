export component Zombie_bungi {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 67;
        frame 20 { cel: -1; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "anim_drop";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 20 { cel: 0; }
        frame 21 { cel: -10000; }
        frame 29 { cel: -1; }
        frame 30 { cel: -10000; }
    }
    Track {
        source-name: "anim_grab";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 29 { cel: 0; }
        frame 30 { cel: -10000; }
        frame 44 { cel: -1; }
        frame 45 { cel: -10000; }
    }
    Track {
        source-name: "anim_hold";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 44 { cel: 0; }
        frame 45 { cel: -10000; }
        frame 54 { cel: -1; }
        frame 55 { cel: -10000; }
    }
    Track {
        source-name: "anim_raise";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 54 { cel: 0; }
        frame 55 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_body";
        frame-count: 67;
        frame 0 { x: 17.6; y: 17; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_BODY; }
        frame 1 { x: -10000; y: 17.4; scale-x: -10000; scale-y: 0.688; image: none; }
        frame 2 { y: 17.8; scale-y: 0.675; }
        frame 3 { y: 20.4; scale-y: 0.679; }
        frame 4 { y: 22.9; scale-y: 0.683; }
        frame 5 { y: 25.5; scale-y: 0.687; }
        frame 6 { y: 28; scale-y: 0.69; }
        frame 7 { y: 30.6; scale-y: 0.694; }
        frame 8 { y: 33; scale-y: 0.698; }
        frame 9 { y: 35.6; scale-y: 0.702; }
        frame 10 { y: 38.2; scale-y: 0.678; }
        frame 11 { y: 40.9; scale-y: 0.654; }
        frame 12 { y: 43.5; scale-y: 0.63; }
        frame 13 { y: 39.7; scale-y: 0.64; }
        frame 14 { y: 36; scale-y: 0.651; }
        frame 15 { y: 32.1; scale-y: 0.661; }
        frame 16 { y: 28.4; scale-y: 0.671; }
        frame 17 { y: 24.6; scale-y: 0.681; }
        frame 18 { y: 20.8; scale-y: 0.691; }
        frame 19 { y: 17; scale-y: 0.702; }
        frame 20 { y: -10000; scale-y: -10000; }
        frame 30 { x: 17.1; y: 17.9; scale-x: 0.715; scale-y: 0.689; }
        frame 31 { x: 16.7; y: 18.7; scale-x: 0.729; scale-y: 0.677; }
        frame 32 { x: 17.2; y: 17.9; scale-x: 0.715; scale-y: 0.689; }
        frame 33 { x: 17.6; y: 17; scale-x: 0.702; scale-y: 0.702; }
        frame 34 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 41 { cel: -1; }
        frame 42 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightleg_upper";
        frame-count: 67;
        frame 0 { x: 12.5; y: 50.6; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTLEG_UPPER; }
        frame 1 { x: 14.2; y: 48.4; skew-x: 5.5; skew-y: 5.5; scale-x: 0.701; scale-y: 0.701; image: none; }
        frame 2 { x: 15.9; y: 46.1; skew-x: 11.3; skew-y: 11.3; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 15.7; y: 49.3; skew-x: 10.3; skew-y: 10.3; }
        frame 4 { x: 15.5; y: 52.1; skew-x: 9.6; skew-y: 9.6; }
        frame 5 { x: 15.4; y: 55.3; skew-x: 8.8; skew-y: 8.8; }
        frame 6 { x: 15.1; y: 58.3; skew-x: 8; skew-y: 8; }
        frame 7 { x: 15; y: 61.4; skew-x: 7.3; skew-y: 7.3; }
        frame 8 { x: 14.8; y: 64.4; skew-x: 6.5; skew-y: 6.5; }
        frame 9 { x: 14.7; y: 67.4; skew-x: 5.8; skew-y: 5.8; }
        frame 10 { x: 13.8; y: 70.3; skew-x: 0.3; skew-y: 0.3; }
        frame 11 { x: 13.1; y: 73.2; skew-x: -4.9; skew-y: -4.9; }
        frame 12 { x: 12.3; y: 76.2; skew-x: -10.4; skew-y: -10.4; }
        frame 13 { x: -10000; y: 72.5; skew-x: -8.7; skew-y: -8.7; }
        frame 14 { y: 68.8; skew-x: -7.2; skew-y: -7.2; }
        frame 15 { x: 12.4; y: 65.1; skew-x: -5.7; skew-y: -5.7; }
        frame 16 { x: -10000; y: 61.5; skew-x: -4.2; skew-y: -4.2; }
        frame 17 { x: 12.3; y: 57.9; skew-x: -2.7; skew-y: -2.7; }
        frame 18 { x: 12.4; y: 54.1; skew-x: -1.2; skew-y: -1.2; }
        frame 19 { x: 12.5; y: 50.6; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 50.4; skew-x: 0.6; }
        frame 22 { y: 50.2; skew-x: 1.3; }
        frame 23 { y: 49.9; skew-x: 2; }
        frame 24 { y: 49.5; skew-x: 2.9; }
        frame 25 { y: 49.9; skew-x: 2; scale-y: 0.701; }
        frame 26 { y: 50.1; skew-x: 1.3; scale-y: -10000; }
        frame 27 { y: 50.4; skew-x: 0.6; }
        frame 28 { y: 50.6; skew-x: 0; scale-y: 0.702; }
        frame 29 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 30 { y: 50; skew-x: 1.8; }
        frame 31 { y: 49.4; skew-x: 3.6; scale-x: 0.703; }
        frame 32 { y: 50; skew-x: 1.8; scale-x: 0.702; scale-y: 0.701; }
        frame 33 { y: 50.6; skew-x: 0; scale-x: -10000; scale-y: 0.702; }
        frame 34 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 38 { x: 13; y: 50; skew-x: 1.3; skew-y: 1.3; scale-x: 0.701; scale-y: 0.701; }
        frame 39 { x: 13.7; y: 49.2; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 14.2; y: 48.5; skew-x: 4.3; skew-y: 4.3; }
        frame 41 { x: 13.6; y: 49.3; skew-x: 2.8; skew-y: 2.8; }
        frame 42 { x: 13; y: 49.9; skew-x: 1.3; skew-y: 1.3; }
        frame 43 { x: 12.5; y: 50.6; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 12.6; skew-x: -2.4; scale-x: 0.704; }
        frame 62 { x: 12.5; y: 50.5; skew-x: -5.2; scale-x: 0.706; }
        frame 63 { x: -10000; y: -10000; skew-x: -7.9; scale-x: 0.708; }
        frame 64 { x: 11.3; y: 52; skew-x: -17.7; skew-y: -9.4; scale-x: 0.727; scale-y: 0.701; }
        frame 65 { x: 10.3; y: 53.6; skew-x: -27.7; skew-y: -18.9; scale-x: 0.746; scale-y: 0.7; }
        frame 66 { x: 9.8; y: 55.4; skew-x: -37.7; skew-y: -28.5; scale-x: 0.766; scale-y: 0.701; }
    }
    Track {
        source-name: "Zombie_bungi_rightleg_lower";
        frame-count: 67;
        frame 0 { x: 5.8; y: 52.6; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTLEG_LOWER; }
        frame 1 { x: 7.5; y: 49.9; skew-x: 6.8; skew-y: 6; scale-x: 0.701; scale-y: 0.701; image: none; }
        frame 2 { x: 9.3; y: 47.3; skew-x: 13.8; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -10000; y: 50.3; skew-x: 13.3; skew-y: 12; scale-y: 0.7; }
        frame 4 { x: 9.2; y: 53.2; skew-x: 12.8; skew-y: 11.8; scale-y: -10000; }
        frame 5 { x: -10000; y: 56.1; skew-x: 12.5; skew-y: 11.6; scale-y: 0.701; }
        frame 6 { x: 9.1; y: 59.1; skew-x: 12; skew-y: 11.3; scale-y: -10000; }
        frame 7 { x: 9.2; y: 62.1; skew-x: 11.6; skew-y: -10000; }
        frame 8 { x: -10000; y: 65; skew-x: 11.3; skew-y: 11; }
        frame 9 { x: 9.1; y: 68; skew-x: 10.8; skew-y: 10.8; }
        frame 10 { x: 8.2; y: 71.3; skew-x: 4.8; skew-y: 4.8; }
        frame 11 { x: 7.5; y: 74.8; skew-x: -0.7; skew-y: -0.7; }
        frame 12 { x: 6.8; y: 78.5; skew-x: -6.6; skew-y: -6.6; }
        frame 13 { x: -10000; y: 74.8; skew-x: -5.5; skew-y: -5.5; }
        frame 14 { x: 6.5; y: 71.1; skew-x: -4.7; skew-y: -4.7; }
        frame 15 { x: 6.3; y: 67.4; skew-x: -3.7; skew-y: -3.7; }
        frame 16 { x: 6.2; y: 63.7; skew-x: -2.7; skew-y: -2.7; }
        frame 17 { x: 6.1; y: 60; skew-x: -1.7; skew-y: -1.7; }
        frame 18 { x: 5.8; y: 56.3; skew-x: -0.7; skew-y: -0.7; }
        frame 19 { x: -10000; y: 52.6; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 52.3; skew-x: 0.6; }
        frame 22 { y: 52; skew-x: 1.3; }
        frame 23 { y: 51.6; skew-x: 2; }
        frame 24 { y: 51.2; skew-x: 2.9; }
        frame 25 { y: 51.6; skew-x: 2; scale-y: 0.701; }
        frame 26 { y: 52; skew-x: 1.3; scale-y: -10000; }
        frame 27 { y: 52.3; skew-x: 0.6; }
        frame 28 { y: 52.6; skew-x: 0; scale-y: 0.702; }
        frame 29 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 30 { y: 51.8; skew-x: 1.8; }
        frame 31 { y: 50.9; skew-x: 3.6; scale-x: 0.703; }
        frame 32 { y: 51.7; skew-x: 1.8; scale-x: 0.702; scale-y: 0.701; }
        frame 33 { y: 52.6; skew-x: 0; scale-x: -10000; scale-y: 0.702; }
        frame 34 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 38 { x: 6.3; y: 51.2; skew-x: 4; skew-y: 4; scale-x: 0.701; scale-y: 0.701; }
        frame 39 { x: 6.7; y: 49.8; skew-x: 8.1; skew-y: 8.1; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 7.3; y: 48.5; skew-x: 12.3; skew-y: 12.3; }
        frame 41 { x: 6.7; y: 49.9; skew-x: 8.1; skew-y: 8.1; }
        frame 42 { x: 6.3; y: 51.2; skew-x: 4; skew-y: 4; }
        frame 43 { x: 5.8; y: 52.6; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { y: 52.8; }
        frame 62 { y: 52.9; }
        frame 63 { y: 53; }
        frame 64 { x: 6.2; y: 53.8; skew-x: -2.4; skew-y: -2.4; scale-x: 0.701; scale-y: 0.717; }
        frame 65 { x: 6.4; y: 54.5; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: 0.732; }
        frame 66 { x: 6.7; y: 55.5; skew-x: -7.9; skew-y: -7.9; scale-y: 0.748; }
    }
    Track {
        source-name: "Zombie_bungi_rightleg_foot";
        frame-count: 67;
        frame 0 { x: -12.8; y: 66.3; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_FOOT; }
        frame 1 { x: -11.2; y: 60.4; skew-x: 10.3; skew-y: 10.3; scale-x: 0.701; scale-y: 0.701; image: none; }
        frame 2 { x: -9.1; y: 54.8; skew-x: 20.8; skew-y: 20.8; scale-x: 0.7; scale-y: 0.7; }
        frame 3 { x: -9.2; y: 57.5; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: -9.1; y: 60.1; skew-x: 20.5; skew-y: 20.5; }
        frame 5 { x: -10000; y: 62.9; skew-x: 20.3; skew-y: 20.3; }
        frame 6 { x: -9; y: 65.7; skew-x: -10000; skew-y: -10000; }
        frame 7 { x: -10000; y: 68.4; skew-x: 20.1; skew-y: 20.1; }
        frame 8 { y: 71.1; skew-x: 20; skew-y: 20; }
        frame 9 { x: -9.1; y: 73.8; skew-x: 19.9; skew-y: 19.9; scale-x: 0.701; scale-y: 0.701; }
        frame 10 { x: -12; y: 82.7; skew-x: 3.3; skew-y: 3.3; scale-x: 0.7; scale-y: 0.7; }
        frame 11 { x: -13.5; y: 92.8; skew-x: -12.9; skew-y: -12.9; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: -10000; y: 103.8; skew-x: -29.6; skew-y: -29.6; }
        frame 13 { x: -13.7; y: 98.3; skew-x: -25.2; skew-y: -25.2; }
        frame 14 { x: -13.9; y: 92.8; skew-x: -21; skew-y: -21; }
        frame 15 { x: -10000; y: 87.5; skew-x: -16.7; skew-y: -16.7; }
        frame 16 { x: -13.8; y: 82.1; skew-x: -12.5; skew-y: -12.5; }
        frame 17 { x: -13.5; y: 76.8; skew-x: -8.2; skew-y: -8.2; scale-x: 0.701; scale-y: 0.701; }
        frame 18 { x: -13.3; y: 71.5; skew-x: -4; skew-y: -4; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -12.8; y: 66.3; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -12.5; y: 65.3; skew-x: 1.5; skew-y: 1.5; scale-x: 0.701; scale-y: 0.701; }
        frame 22 { x: -12.1; y: 64.3; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -12.6; y: 65.3; skew-x: 1.5; skew-y: 1.5; }
        frame 24 { x: -12.8; y: 66.3; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 25 { x: -12.5; y: 65.3; skew-x: 1.5; skew-y: 1.5; scale-x: 0.701; scale-y: 0.701; }
        frame 26 { x: -12.1; y: 64.3; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -12.6; y: 65.3; skew-x: 1.5; skew-y: 1.5; }
        frame 28 { x: -12.8; y: 66.3; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 64.9; skew-x: 1.8; }
        frame 31 { y: 63.5; skew-x: 3.6; scale-x: 0.703; }
        frame 32 { y: 65; skew-x: 1.8; scale-x: 0.702; scale-y: 0.701; }
        frame 33 { y: 66.3; skew-x: 0; scale-x: -10000; scale-y: 0.702; }
        frame 34 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 38 { x: -12.4; y: 62.3; skew-x: 7; skew-y: 7; scale-x: 0.701; scale-y: 0.701; }
        frame 39 { x: -11.8; y: 58.4; skew-x: 14.3; skew-y: 14.3; scale-x: 0.7; scale-y: 0.7; }
        frame 40 { x: -11; y: 54.9; skew-x: 21.4; skew-y: 21.4; scale-x: 0.701; scale-y: 0.701; }
        frame 41 { x: -11.8; y: 58.5; skew-x: 14.3; skew-y: 14.3; scale-x: 0.7; scale-y: 0.7; }
        frame 42 { x: -12.5; y: 62.4; skew-x: 7; skew-y: 7; scale-x: 0.701; scale-y: 0.701; }
        frame 43 { x: -12.8; y: 66.3; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { y: 66.5; }
        frame 62 { y: 66.6; }
        frame 63 { y: 66.8; }
        frame 64 { x: -13.4; y: 72.2; skew-x: -11.4; skew-y: -11.4; scale-x: 0.701; scale-y: 0.701; }
        frame 65 { x: -13.3; y: 78.2; skew-x: -23; skew-y: -23; scale-x: 0.7; scale-y: 0.7; }
        frame 66 { x: -12.4; y: 84.4; skew-x: -34.8; skew-y: -34.8; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftleg_upper";
        frame-count: 67;
        frame 0 { x: 51.3; y: 47.5; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTLEG_UPPER; }
        frame 1 { x: 51; y: 47.3; skew-x: -0.9; skew-y: -0.9; scale-x: 0.701; scale-y: 0.701; image: none; }
        frame 2 { x: 50.6; y: 47; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 50.3; y: 49.9; skew-x: -2.9; skew-y: -2.9; }
        frame 4 { x: 50; y: 52.8; skew-x: -4.2; skew-y: -4.2; }
        frame 5 { x: 49.6; y: 55.6; skew-x: -5.2; skew-y: -5.2; }
        frame 6 { x: 49.3; y: 58.5; skew-x: -6.2; skew-y: -6.2; }
        frame 7 { x: 49; y: 61.4; skew-x: -7.4; skew-y: -7.4; }
        frame 8 { x: 48.7; y: 64.3; skew-x: -8.5; skew-y: -8.5; }
        frame 9 { x: 48.3; y: 67.3; skew-x: -9.7; skew-y: -9.7; }
        frame 10 { x: 49.4; y: 68; skew-x: -3.9; skew-y: -3.9; }
        frame 11 { x: 50.5; y: 68.7; skew-x: 1.6; skew-y: 1.6; }
        frame 12 { x: 51.9; y: 69.6; skew-x: 7.5; skew-y: 7.5; }
        frame 13 { x: 51.8; y: 66.5; skew-x: 6.3; skew-y: 6.3; }
        frame 14 { x: 51.6; y: 63.3; skew-x: 5.3; skew-y: 5.3; }
        frame 15 { x: 51.5; y: 60.1; skew-x: 4.3; skew-y: 4.3; }
        frame 16 { x: 51.4; y: 57; skew-x: 3.1; skew-y: 3.1; }
        frame 17 { x: -10000; y: 53.8; skew-x: 2; skew-y: 2; }
        frame 18 { x: 51.3; y: 50.6; skew-x: 1; skew-y: 1; }
        frame 19 { x: -10000; y: 47.5; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { skew-x: -1.2; }
        frame 22 { skew-x: -2.4; scale-x: 0.703; }
        frame 23 { x: 51.4; skew-x: -3.7; scale-x: -10000; }
        frame 24 { x: 51.3; y: 47.6; skew-x: -4.9; scale-x: 0.704; }
        frame 25 { x: 51.4; y: -10000; skew-x: -3.7; scale-x: 0.703; scale-y: 0.701; }
        frame 26 { x: 51.3; skew-x: -2.4; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -10000; skew-x: -1.2; scale-x: 0.702; }
        frame 28 { y: 47.5; skew-x: 0; scale-x: -10000; scale-y: 0.702; }
        frame 29 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 30 { skew-x: -1.5; }
        frame 31 { skew-x: -3.4; scale-x: 0.703; }
        frame 32 { skew-x: -1.5; scale-x: 0.702; scale-y: 0.701; }
        frame 33 { skew-x: 0; scale-x: -10000; scale-y: 0.702; }
        frame 34 { skew-x: -10000; scale-y: -10000; }
        frame 38 { x: 51.1; skew-x: -1.4; skew-y: -1.4; scale-x: 0.701; scale-y: 0.701; }
        frame 39 { x: 50.9; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 50.6; y: 47.6; skew-x: -4.5; skew-y: -4.5; }
        frame 41 { x: 50.8; y: -10000; skew-x: -2.9; skew-y: -2.9; }
        frame 42 { x: 51; y: 47.5; skew-x: -1.4; skew-y: -1.4; }
        frame 43 { x: 51.3; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 44 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { y: 46.5; skew-x: 2; scale-x: 0.703; }
        frame 62 { y: 45.5; skew-x: 4.3; scale-x: 0.704; }
        frame 63 { y: 44.5; skew-x: 6.5; scale-x: 0.706; }
        frame 64 { x: 53.1; y: 42.5; skew-x: 14.3; skew-y: 7.8; scale-x: 0.705; scale-y: 0.701; }
        frame 65 { x: 55.1; y: 40.6; skew-x: 22.3; skew-y: 15.8; scale-x: -10000; scale-y: 0.7; }
        frame 66 { x: 57.3; y: 39; skew-x: 30.3; skew-y: 23.8; scale-y: 0.701; }
    }
    Track {
        source-name: "Zombie_bungi_left_tatter";
        frame-count: 67;
        frame 0 { x: 58; y: 44; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFT_TATTER; }
        frame 1 { x: 57.5; y: 44.6; skew-x: -2.9; skew-y: -1.4; scale-x: 0.703; scale-y: 0.711; image: none; }
        frame 2 { x: 57.1; y: 45.2; skew-x: -5.9; skew-y: -3.2; scale-x: 0.705; scale-y: 0.721; }
        frame 3 { x: 56.7; y: 48; skew-x: -8.9; skew-y: -4.7; scale-x: 0.706; scale-y: 0.73; }
        frame 4 { x: 56.2; y: 50.7; skew-x: -11.9; skew-y: -6.4; scale-x: 0.708; scale-y: 0.74; }
        frame 5 { x: 55.8; y: 53.4; skew-x: -14.9; skew-y: -8.2; scale-x: 0.71; scale-y: 0.749; }
        frame 6 { x: 55.4; y: 56.2; skew-x: -17.9; skew-y: -9.7; scale-x: 0.711; scale-y: 0.759; }
        frame 7 { x: 55; y: 58.9; skew-x: -20.9; skew-y: -11.4; scale-x: 0.713; scale-y: 0.768; }
        frame 8 { x: 54.6; y: 61.6; skew-x: -23.9; skew-y: -13.2; scale-x: 0.715; scale-y: 0.778; }
        frame 9 { x: 54.4; y: 64.4; skew-x: -27; skew-y: -14.9; scale-x: 0.717; scale-y: 0.788; }
        frame 10 { x: 55.2; y: 65.6; skew-x: -14.9; skew-y: -3.7; scale-x: 0.715; scale-y: 0.781; }
        frame 11 { x: 56.3; y: 67; skew-x: -2.9; skew-y: 7.3; scale-x: 0.714; scale-y: 0.775; }
        frame 12 { x: 57.6; y: 68.4; skew-x: 9; skew-y: 18.5; scale-x: 0.713; scale-y: 0.768; }
        frame 13 { x: 57.5; y: 65; skew-x: 7.6; skew-y: 15.8; scale-x: 0.711; scale-y: 0.758; }
        frame 14 { x: 57.7; y: 61.4; skew-x: 6.3; skew-y: 13.1; scale-x: 0.709; scale-y: 0.749; }
        frame 15 { x: -10000; y: 58; skew-x: 5; skew-y: 10.5; scale-x: 0.708; scale-y: 0.739; }
        frame 16 { y: 54.5; skew-x: 3.8; skew-y: 7.8; scale-x: 0.706; scale-y: 0.73; }
        frame 17 { x: 57.9; y: 51; skew-x: 2.5; skew-y: 5.3; scale-x: 0.705; scale-y: 0.72; }
        frame 18 { x: -10000; y: 47.6; skew-x: 1.3; skew-y: 2.5; scale-x: 0.703; scale-y: 0.711; }
        frame 19 { x: 58; y: 44; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 56.6; y: 43.3; skew-y: -12; scale-y: 0.842; }
        frame 22 { x: 55; y: 42.9; skew-y: -24.3; scale-y: 0.984; }
        frame 23 { x: 56.6; y: 43.4; skew-y: -12; scale-x: 0.701; scale-y: 0.842; }
        frame 24 { x: 58; y: 44; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 25 { x: 59.4; y: -10000; skew-x: 2; skew-y: 12.8; scale-x: 0.701; scale-y: 0.728; }
        frame 26 { x: 60.8; y: 44.1; skew-x: 4; skew-y: 26; scale-x: -10000; scale-y: 0.756; }
        frame 27 { x: 59.5; y: -10000; skew-x: 2; skew-y: 12.8; scale-y: 0.728; }
        frame 28 { x: 58; y: 44; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 43.8; }
        frame 31 { y: 43.5; }
        frame 32 { y: 43.8; }
        frame 33 { y: 44; }
        frame 34 { y: -10000; }
        frame 38 { x: 57.8; y: 44.2; skew-x: -2.7; skew-y: -2.7; scale-x: 0.701; scale-y: 0.701; }
        frame 39 { x: 57.6; y: 44.4; skew-x: -5.4; skew-y: -5.4; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 57.5; y: 44.5; skew-x: -8.2; skew-y: -8.2; }
        frame 41 { x: -10000; y: 44.7; skew-x: -10.9; skew-y: -10.9; }
        frame 42 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 55 { x: 57.7; y: 44.4; skew-x: -5.4; skew-y: -5.4; }
        frame 56 { x: 58; y: 44; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 57 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { y: 43; }
        frame 62 { y: 42; }
        frame 63 { y: 41; }
        frame 64 { y: 39; }
        frame 65 { y: 37; }
        frame 66 { y: 35; }
    }
    Track {
        source-name: "Zombie_bungi_leftshirt";
        frame-count: 67;
        frame 0 { x: 58.7; y: 30.2; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTSHIRT; }
        frame 1 { x: 57.4; y: 30.5; skew-x: -11.4; skew-y: -4.7; scale-x: 0.714; scale-y: 0.701; image: none; }
        frame 2 { x: 56.5; y: 30.8; skew-x: -22.9; skew-y: -9.4; scale-x: 0.727; scale-y: -10000; }
        frame 3 { x: 56.8; y: 33.5; skew-x: -22; skew-y: -7.9; scale-x: -10000; }
        frame 4 { x: 57.1; y: 36.4; skew-x: -21.2; skew-y: -6.7; scale-x: 0.728; }
        frame 5 { x: 57.4; y: 39; skew-x: -20.4; skew-y: -5.2; scale-x: 0.729; }
        frame 6 { x: 57.6; y: 41.7; skew-x: -19.5; skew-y: -3.9; scale-x: 0.73; }
        frame 7 { x: 57.9; y: 44.5; skew-x: -18.7; skew-y: -2.5; scale-x: 0.732; }
        frame 8 { x: 58.3; y: 47.3; skew-x: -17.9; skew-y: -1.2; scale-x: 0.733; }
        frame 9 { x: 58.5; y: 50; skew-x: -17.1; skew-y: 0; scale-x: 0.735; scale-y: 0.702; }
        frame 10 { x: 58.1; y: 51.4; skew-x: -8.9; skew-y: -10000; scale-x: 0.727; scale-y: 0.701; }
        frame 11 { x: 57.9; y: 52.9; skew-x: -0.7; scale-x: 0.72; scale-y: -10000; }
        frame 12 { x: 58; y: 54.1; skew-x: 7.5; scale-x: 0.713; }
        frame 13 { x: 58.1; y: 50.7; skew-x: 6.3; scale-x: 0.711; }
        frame 14 { x: 58.2; y: 47.3; skew-x: 5.3; scale-x: 0.71; }
        frame 15 { x: 58.3; y: 43.9; skew-x: 4.3; scale-x: 0.708; }
        frame 16 { x: 58.4; y: 40.5; skew-x: 3.1; scale-x: 0.706; }
        frame 17 { x: 58.5; y: 37; skew-x: 2; scale-x: 0.705; }
        frame 18 { x: -10000; y: 33.6; skew-x: 1; scale-x: 0.703; }
        frame 19 { x: 58.7; y: 30.2; skew-x: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 58.6; y: 30.7; skew-x: -5.5; scale-x: 0.708; }
        frame 22 { x: 58.7; y: 31.2; skew-x: -11.3; scale-x: 0.716; }
        frame 23 { x: 58.6; y: 30.7; skew-x: -5.5; scale-x: 0.708; scale-y: 0.701; }
        frame 24 { x: 58.7; y: 30.2; skew-x: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 25 { x: 58.6; y: 30.7; skew-x: -5.5; scale-x: 0.708; scale-y: -10000; }
        frame 26 { x: 58.7; y: 31.2; skew-x: -11.3; scale-x: 0.716; }
        frame 27 { x: 58.6; y: 30.7; skew-x: -5.5; scale-x: 0.708; scale-y: 0.701; }
        frame 28 { x: 58.7; y: 30.2; skew-x: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 59; y: 30.9; skew-x: -1.2; scale-x: 0.717; scale-y: 0.689; }
        frame 31 { x: 59.4; y: 31.7; skew-x: -2.7; scale-x: 0.732; scale-y: 0.677; }
        frame 32 { x: 59; y: 30.9; skew-x: -1.2; scale-x: 0.716; scale-y: 0.689; }
        frame 33 { x: 58.7; y: 30.2; skew-x: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 34 { x: -10000; y: 30.4; skew-x: -1.9; scale-x: 0.703; scale-y: -10000; }
        frame 35 { y: 30.6; skew-x: -3.9; scale-x: 0.705; }
        frame 36 { y: 30.8; skew-x: -5.9; scale-x: 0.706; }
        frame 37 { y: 31; skew-x: -7.9; scale-x: 0.708; }
        frame 38 { x: 57.6; y: 29.3; skew-x: 17.3; skew-y: 7.5; scale-x: 0.704; scale-y: 0.745; }
        frame 39 { x: 58.6; y: 28.4; skew-x: 42.6; skew-y: 15.1; scale-x: 0.7; scale-y: 0.789; }
        frame 40 { x: 62.5; y: 28.2; skew-x: 64.9; skew-y: 37.4; scale-x: 0.699; scale-y: 0.788; }
        frame 41 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 42 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightshirt";
        frame-count: 67;
        frame 0 { x: 2.3; y: 36.4; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTSHIRT; }
        frame 1 { x: 4; y: 33; skew-x: 8.3; skew-y: 6.5; scale-x: 0.703; scale-y: 0.699; image: none; }
        frame 2 { x: 6.1; y: 29.9; skew-x: 16.5; skew-y: 13.3; scale-x: 0.706; scale-y: 0.697; }
        frame 3 { x: 5.8; y: 32.8; skew-x: 15.8; skew-y: 13.5; scale-x: 0.707; scale-y: 0.695; }
        frame 4 { x: 5.6; y: 35.8; skew-x: 15.3; skew-y: 13.6; scale-x: 0.709; scale-y: 0.694; }
        frame 5 { x: 5.3; y: 38.6; skew-x: 14.8; skew-y: 13.8; scale-x: 0.711; scale-y: 0.692; }
        frame 6 { x: 5; y: 41.5; skew-x: 14.1; skew-y: 14; scale-x: 0.712; scale-y: 0.69; }
        frame 7 { x: 4.8; y: 44.5; skew-x: 13.5; skew-y: 14.3; scale-x: 0.714; scale-y: 0.689; }
        frame 8 { x: 4.6; y: 47.4; skew-x: 12.8; skew-y: 14.5; scale-x: 0.716; scale-y: 0.687; }
        frame 9 { x: 4.2; y: 50; skew-x: 12.4; skew-y: 14.7; scale-x: 0.718; scale-y: 0.686; }
        frame 10 { x: 3; y: 55.7; skew-x: 2; skew-y: 7.3; scale-x: 0.726; scale-y: 0.682; }
        frame 11 { x: 2.5; y: 61.6; skew-x: -7.9; skew-y: 0; scale-x: 0.733; scale-y: 0.679; }
        frame 12 { x: -10000; y: 67.6; skew-x: -18.2; skew-y: -7.1; scale-x: 0.741; scale-y: 0.676; }
        frame 13 { x: 2.4; y: 63; skew-x: -15.5; skew-y: -6; scale-x: 0.735; scale-y: 0.679; }
        frame 14 { x: 2.3; y: 58.5; skew-x: -12.9; skew-y: -4.9; scale-x: 0.729; scale-y: 0.683; }
        frame 15 { x: 2.2; y: 54; skew-x: -10.2; skew-y: -3.9; scale-x: 0.724; scale-y: 0.687; }
        frame 16 { x: 2.1; y: 49.6; skew-x: -7.7; skew-y: -2.9; scale-x: 0.718; scale-y: 0.69; }
        frame 17 { x: -10000; y: 45.1; skew-x: -5; skew-y: -1.9; scale-x: 0.713; scale-y: 0.694; }
        frame 18 { y: 40.6; skew-x: -2.4; skew-y: -0.9; scale-x: 0.707; scale-y: 0.698; }
        frame 19 { x: 2.3; y: 36.4; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 34.8; skew-x: 4.3; scale-x: 0.705; }
        frame 22 { y: 33.1; skew-x: 8.8; scale-x: 0.71; }
        frame 23 { y: 34.7; skew-x: 4.3; scale-x: 0.705; scale-y: 0.701; }
        frame 24 { y: 36.4; skew-x: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 25 { y: 34.8; skew-x: 4.3; scale-x: 0.705; scale-y: -10000; }
        frame 26 { y: 33.1; skew-x: 8.8; scale-x: 0.71; }
        frame 27 { y: 34.7; skew-x: 4.3; scale-x: 0.705; scale-y: 0.701; }
        frame 28 { y: 36.4; skew-x: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 29 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 34.8; skew-x: 4; scale-x: 0.705; }
        frame 31 { y: 33.1; skew-x: 8.2; scale-x: 0.709; }
        frame 32 { x: 2.2; y: 34.8; skew-x: 4; scale-x: 0.705; scale-y: 0.701; }
        frame 33 { x: 2.3; y: 36.4; skew-x: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 34 { x: -10000; y: 36; skew-x: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 35 { y: 35.5; skew-x: 1.8; }
        frame 36 { y: 35.1; skew-x: 2.8; scale-x: 0.703; }
        frame 37 { y: 34.6; skew-x: 3.9; scale-x: -10000; }
        frame 38 { x: 4; y: 41.5; skew-x: -15.7; skew-y: -2.7; scale-x: 0.701; scale-y: 0.756; }
        frame 39 { x: 7; y: 47.9; skew-x: -35.7; skew-y: -5.5; scale-x: 0.7; scale-y: 0.81; }
        frame 40 { x: 10.4; y: 57.6; skew-x: -62.6; skew-y: -47.6; scale-x: 0.699; scale-y: 0.724; }
        frame 41 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 42 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftleg_lower";
        frame-count: 67;
        frame 0 { x: 57.8; y: 53; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTLEG_LOWER; }
        frame 1 { x: 57.4; y: 53.4; skew-x: -2.2; skew-y: -2.2; scale-x: 0.701; scale-y: 0.701; image: none; }
        frame 2 { x: 56.9; y: 53.9; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 56.5; y: 57; skew-x: -7; skew-y: -7; }
        frame 4 { x: 56.2; y: 60.3; skew-x: -9.4; skew-y: -9.4; }
        frame 5 { x: 55.9; y: 63.5; skew-x: -11.9; skew-y: -11.9; scale-x: 0.7; scale-y: 0.7; }
        frame 6 { x: 55.5; y: 67; skew-x: -14.4; skew-y: -14.4; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 55.3; y: 70.3; skew-x: -16.7; skew-y: -16.7; }
        frame 8 { x: 55.1; y: 73.6; skew-x: -19.2; skew-y: -19.2; }
        frame 9 { x: 54.9; y: 76.8; skew-x: -21.7; skew-y: -21.7; scale-x: 0.701; scale-y: 0.701; }
        frame 10 { x: 55; y: 77.4; skew-x: -15; skew-y: -15; scale-x: 0.7; scale-y: 0.7; }
        frame 11 { x: 55.4; y: 78.3; skew-x: -8.2; skew-y: -8.2; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 55.9; y: 79.3; skew-x: -1.7; skew-y: -1.7; }
        frame 13 { x: 56.1; y: 75.6; skew-x: -1.4; skew-y: -1.4; }
        frame 14 { x: 56.4; y: 71.8; skew-x: -1.2; skew-y: -1.2; scale-x: 0.701; scale-y: 0.701; }
        frame 15 { x: 56.6; y: 68; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 57; y: 64.2; skew-x: -0.7; skew-y: -0.7; }
        frame 17 { x: 57.3; y: 60.5; skew-x: -0.4; skew-y: -0.4; }
        frame 18 { x: 57.5; y: 56.6; skew-x: -0.2; skew-y: -0.2; }
        frame 19 { x: 57.8; y: 53; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 52.6; }
        frame 22 { y: 52.3; }
        frame 23 { y: 52; }
        frame 24 { y: 51.6; }
        frame 25 { y: 52; }
        frame 26 { y: 52.3; }
        frame 27 { y: 52.6; }
        frame 28 { y: 53; }
        frame 29 { y: -10000; }
        frame 30 { y: 52.8; skew-x: -1.5; }
        frame 31 { y: 52.6; skew-x: -3.4; scale-x: 0.703; }
        frame 32 { x: 57.9; y: 52.8; skew-x: -1.5; scale-x: 0.702; scale-y: 0.701; }
        frame 33 { x: 57.8; y: 53; skew-x: 0; scale-x: -10000; scale-y: 0.702; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 38 { x: 57.5; y: 53.3; skew-x: -2.7; skew-y: -2.7; scale-x: 0.701; scale-y: 0.701; }
        frame 39 { x: 57.4; y: 53.5; skew-x: -5.4; skew-y: -5.4; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 57.2; y: 54; skew-x: -8.2; skew-y: -8.2; }
        frame 41 { x: 57.4; y: 53.6; skew-x: -5.4; skew-y: -5.4; }
        frame 42 { x: 57.6; y: 53.3; skew-x: -2.7; skew-y: -2.7; }
        frame 43 { x: 57.8; y: 53; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { y: 53.1; }
        frame 63 { y: 53.2; }
        frame 64 { x: 56.8; y: 53.8; }
        frame 65 { x: 55.6; y: 54.4; }
        frame 66 { x: 54.6; y: 55; }
    }
    Track {
        source-name: "Zombie_bungi_leftleg_tatter";
        frame-count: 67;
        frame 0 { x: 73.1; y: 64.3; scale-x: 0.747; scale-y: 0.747; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTLEG_TATTER; }
        frame 1 { x: 72.7; y: 64.1; skew-x: -4.4; skew-y: -3.9; scale-x: -10000; scale-y: 0.746; image: none; }
        frame 2 { x: 72.4; y: 63.9; skew-x: -9.2; skew-y: -7.9; scale-y: -10000; }
        frame 3 { x: 72.1; y: 66.5; skew-x: -13.7; skew-y: -11.9; }
        frame 4 { x: 71.8; y: 69.2; skew-x: -18.5; skew-y: -16.2; scale-y: 0.745; }
        frame 5 { x: 71.6; y: 71.7; skew-x: -23.2; skew-y: -20.2; scale-y: -10000; }
        frame 6 { x: 71.5; y: 74.5; skew-x: -28; skew-y: -24.4; }
        frame 7 { x: 71.3; y: 77.2; skew-x: -32.7; skew-y: -28.5; }
        frame 8 { x: -10000; y: 79.8; skew-x: -37.3; skew-y: -32.5; }
        frame 9 { y: 82.7; skew-x: -42; skew-y: -36.7; scale-x: 0.749; scale-y: 0.746; }
        frame 10 { x: 71.6; y: 85.3; skew-x: -18.9; skew-y: -13.9; scale-x: 0.748; scale-y: 0.745; }
        frame 11 { x: 72.8; y: 88.6; skew-x: 4; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 74.8; y: 92.5; skew-x: 27.2; skew-y: 31.4; scale-x: 0.747; }
        frame 13 { x: 74.5; y: 88.3; skew-x: 23.3; skew-y: 26.8; scale-x: 0.746; scale-y: 0.744; }
        frame 14 { x: 74.3; y: 84.3; skew-x: 19.3; skew-y: 22.3; scale-x: -10000; scale-y: 0.745; }
        frame 15 { x: 74; y: 80.2; skew-x: 15.5; skew-y: 17.8; scale-y: -10000; }
        frame 16 { x: 73.7; y: 76.1; skew-x: 11.5; skew-y: 13.3; }
        frame 17 { x: 73.3; y: 72.1; skew-x: 7.8; skew-y: 8.8; scale-x: 0.747; scale-y: 0.746; }
        frame 18 { x: 73.2; y: 68.1; skew-x: 3.8; skew-y: 4.3; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 73.1; y: 64.3; skew-x: 0; skew-y: 0; scale-y: 0.747; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 71.7; y: 64.2; skew-y: -9.7; scale-y: 0.769; }
        frame 22 { x: 70.3; y: 64.3; skew-y: -19.5; scale-y: 0.793; }
        frame 23 { x: 71.8; y: 64.2; skew-y: -9.7; scale-y: 0.769; }
        frame 24 { x: 73.1; y: 64.3; skew-y: 0; scale-y: 0.747; }
        frame 25 { x: 73.8; y: -10000; skew-y: 7.8; scale-x: 0.778; scale-y: 0.761; }
        frame 26 { x: 74.8; y: 64.5; skew-y: 15.6; scale-x: 0.81; scale-y: 0.775; }
        frame 27 { x: 73.9; y: 64.3; skew-y: 7.8; scale-x: 0.778; scale-y: 0.761; }
        frame 28 { x: 73.1; y: -10000; skew-y: 0; scale-x: 0.747; scale-y: 0.747; }
        frame 29 { x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 63.8; }
        frame 31 { y: 63.3; }
        frame 32 { y: 63.8; }
        frame 33 { y: 64.3; }
        frame 34 { y: -10000; }
        frame 38 { x: 73.2; y: 64.1; skew-x: -4.5; skew-y: -4.5; scale-x: 0.746; scale-y: 0.746; }
        frame 39 { x: 73.3; y: 63.9; skew-x: -9.2; skew-y: -9.2; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 73.5; y: 64; skew-x: -14; skew-y: -14; }
        frame 41 { x: 73.3; y: 64.1; skew-x: -9.2; skew-y: -9.2; }
        frame 42 { x: 73.2; y: 64.3; skew-x: -4.5; skew-y: -4.5; }
        frame 43 { x: 73.1; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.747; scale-y: 0.747; }
        frame 44 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 73; y: 65; skew-x: 10.8; skew-y: 11.1; scale-x: 0.78; scale-y: 0.746; }
        frame 65 { x: 73.1; y: 65.8; skew-x: 21.5; skew-y: 22.3; scale-x: 0.813; scale-y: 0.745; }
        frame 66 { x: 73.3; y: 67.1; skew-x: 32.4; skew-y: 33.6; scale-x: 0.848; scale-y: 0.746; }
    }
    Track {
        source-name: "Zombie_bungi_leftleg_foot";
        frame-count: 67;
        frame 0 { x: 95.6; y: 70.7; skew-x: 180; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_FOOT; }
        frame 1 { x: -10000; y: 69.1; skew-x: 176.7; skew-y: -3.2; scale-x: 0.701; scale-y: 0.701; image: none; }
        frame 2 { x: 95.5; y: 67.5; skew-x: 173.5; skew-y: -6.4; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 95.3; y: 68.8; skew-x: 170.2; skew-y: -9.7; scale-x: 0.7; scale-y: 0.7; }
        frame 4 { x: -10000; y: 70; skew-x: 166.9; skew-y: -13; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 95.1; y: 71.2; skew-x: 163.5; skew-y: -16.4; }
        frame 6 { x: 94.7; y: 72.6; skew-x: 160.2; skew-y: -19.7; }
        frame 7 { x: 94.5; y: 74; skew-x: 156.9; skew-y: -23; }
        frame 8 { x: 94.1; y: 75.6; skew-x: 153.5; skew-y: -26.4; scale-x: 0.699; scale-y: 0.699; }
        frame 9 { x: 93.7; y: 76.9; skew-x: 150.2; skew-y: -29.7; scale-x: 0.7; scale-y: 0.7; }
        frame 10 { x: 95.2; y: 83.6; skew-x: 162.5; skew-y: -17.4; scale-x: 0.699; scale-y: 0.699; }
        frame 11 { x: 96.1; y: 91.1; skew-x: 174.7; skew-y: -5.2; scale-x: 0.7; scale-y: 0.7; }
        frame 12 { x: 96.2; y: 99.2; skew-x: 186.9; skew-y: 6.9; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 96.1; y: 95.1; skew-x: 185.8; skew-y: 5.8; }
        frame 14 { x: -10000; y: 91.1; skew-x: 184.8; skew-y: 4.8; }
        frame 15 { x: 96; y: 86.8; skew-x: 183.8; skew-y: 3.8; }
        frame 16 { x: 95.8; y: 82.8; skew-x: 182.8; skew-y: 2.8; scale-x: 0.701; scale-y: 0.701; }
        frame 17 { x: -10000; y: 78.6; skew-x: 181.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 95.7; y: 74.6; skew-x: 180.8; skew-y: 0.8; }
        frame 19 { x: 95.6; y: 70.7; skew-x: 180; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 95.3; y: 69.5; skew-x: 178.4; skew-y: -1.5; scale-x: 0.701; scale-y: 0.701; }
        frame 22 { x: 94.7; y: 68.3; skew-x: 176.5; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 95.2; y: 69.5; skew-x: 178.4; skew-y: -1.5; }
        frame 24 { x: 95.6; y: 70.7; skew-x: 180; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 25 { x: 95.3; y: 69.5; skew-x: 178.4; skew-y: -1.5; scale-x: 0.701; scale-y: 0.701; }
        frame 26 { x: 94.7; y: 68.3; skew-x: 176.5; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 95.2; y: 69.5; skew-x: 178.4; skew-y: -1.5; }
        frame 28 { x: 95.6; y: 70.7; skew-x: 180; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 69.3; skew-x: 178.4; }
        frame 31 { y: 68; skew-x: 176.5; scale-x: 0.703; }
        frame 32 { y: 69.3; skew-x: 178.4; scale-x: 0.702; scale-y: 0.701; }
        frame 33 { y: 70.7; skew-x: 180; scale-x: -10000; scale-y: 0.702; }
        frame 34 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 38 { x: 95.7; y: 68.5; skew-x: 175.5; skew-y: -4.4; scale-x: 0.701; scale-y: 0.701; }
        frame 39 { x: 95.6; y: 66.5; skew-x: 170.7; skew-y: -9.2; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 95.5; y: 64.4; skew-x: 166.1; skew-y: -13.8; }
        frame 41 { x: 95.6; y: 66.4; skew-x: 170.7; skew-y: -9.2; }
        frame 42 { x: -10000; y: 68.5; skew-x: 175.5; skew-y: -4.4; }
        frame 43 { y: 70.7; skew-x: 180; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 44 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { y: 70.8; }
        frame 63 { y: -10000; }
        frame 64 { x: 96.3; y: 74.7; skew-x: 187.8; skew-y: 7.8; scale-x: 0.701; scale-y: 0.701; }
        frame 65 { x: 96.8; y: 78.7; skew-x: 195.6; skew-y: 15.6; scale-x: 0.7; scale-y: 0.7; }
        frame 66 { x: -10000; y: 82.9; skew-x: 203.6; skew-y: 23.6; scale-x: 0.701; scale-y: 0.701; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_upper";
        frame-count: 67;
        frame 0 { x: 0.5; y: 8.4; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTARM_UPPER; }
        frame 1 { x: 2; y: 6; skew-x: 4.8; skew-y: 3.8; scale-x: 0.701; scale-y: -10000; image: none; }
        frame 2 { x: 3.5; y: 3.5; skew-x: 9.8; skew-y: 7.6; scale-x: -10000; scale-y: 0.703; }
        frame 3 { x: -10000; y: 5.9; skew-x: 10.5; skew-y: 7.1; scale-y: 0.704; }
        frame 4 { y: 8.4; skew-x: 11.3; skew-y: 6.8; scale-y: 0.705; }
        frame 5 { y: 10.7; skew-x: 12; skew-y: 6.5; scale-x: 0.7; scale-y: 0.707; }
        frame 6 { y: 13; skew-x: 12.8; skew-y: 6.1; scale-x: -10000; scale-y: 0.708; }
        frame 7 { y: 15.4; skew-x: 13.5; skew-y: 5.8; scale-y: 0.709; }
        frame 8 { y: 17.9; skew-x: 14.3; skew-y: 5.5; scale-y: 0.71; }
        frame 9 { y: 20.3; skew-x: 15.1; skew-y: 5.2; scale-x: 0.701; scale-y: 0.712; }
        frame 10 { x: 1.5; y: 23.2; skew-x: 10.6; skew-y: 1.5; scale-x: 0.7; scale-y: 0.711; }
        frame 11 { x: -0.2; y: 26; skew-x: 6.3; skew-y: -1.7; scale-x: -10000; scale-y: 0.71; }
        frame 12 { x: -2; y: 29; skew-x: 2; skew-y: -5.5; scale-y: 0.709; }
        frame 13 { x: -1.6; y: 26.1; skew-x: 1.6; skew-y: -4.7; scale-y: 0.707; }
        frame 14 { x: -1.2; y: 23.2; skew-x: 1.3; skew-y: -3.7; scale-x: 0.701; scale-y: 0.706; }
        frame 15 { x: -0.8; y: 20.2; skew-x: 1; skew-y: -2.9; scale-x: -10000; scale-y: 0.705; }
        frame 16 { x: -0.4; y: 17.3; skew-x: 0.8; skew-y: -2.2; scale-y: -10000; }
        frame 17 { x: -0.1; y: 14.4; skew-x: 0.5; skew-y: -1.4; scale-y: 0.703; }
        frame 18 { x: 0.2; y: 11.4; skew-x: 0.3; skew-y: -0.7; scale-y: 0.702; }
        frame 19 { x: 0.5; y: 8.4; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: -10000; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 21 { y: 8.2; }
        frame 22 { y: 8; }
        frame 23 { y: 7.8; }
        frame 24 { y: 7.6; }
        frame 25 { y: 7.8; }
        frame 26 { y: 8; }
        frame 27 { y: 8.2; }
        frame 28 { y: 8.4; }
        frame 29 { y: -10000; }
        frame 30 { x: 0.3; y: 8.8; skew-x: 1.3; skew-y: 1.5; scale-x: 0.715; scale-y: 0.689; }
        frame 31 { x: 0.2; y: 9.1; skew-x: 2.8; skew-y: 3.3; scale-x: 0.729; scale-y: 0.677; }
        frame 32 { x: 0.3; y: 8.8; skew-x: 1.3; skew-y: 1.5; scale-x: 0.715; scale-y: 0.689; }
        frame 33 { x: 0.5; y: 8.4; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 34 { x: 1.3; y: 7.5; skew-x: 2; skew-y: 2; scale-x: 0.701; scale-y: 0.701; }
        frame 35 { x: 2.1; y: 6.7; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 3; y: 5.8; skew-x: 6; skew-y: 6; }
        frame 37 { x: 3.9; y: 4.9; skew-x: 8.1; skew-y: 8.1; }
        frame 38 { x: -3.7; y: 14.6; skew-x: -14.4; skew-y: -14.4; scale-x: 0.7; scale-y: 0.7; }
        frame 39 { x: -8.6; y: 26.2; skew-x: -37.2; skew-y: -37.2; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_lower";
        frame-count: 67;
        frame 0 { x: -9.1; y: 9.5; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTARM_LOWER; }
        frame 1 { x: -6.8; y: 5.6; skew-x: 9; skew-y: 9; scale-x: 0.701; scale-y: 0.701; image: none; }
        frame 2 { x: -4.4; y: 2; skew-x: 18.4; skew-y: 18.4; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -10000; y: 4.5; skew-x: 19.1; skew-y: 19.1; scale-x: 0.7; scale-y: 0.7; }
        frame 4 { x: -4.3; y: 6.8; skew-x: 20; skew-y: 20; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: -10000; y: 9.3; skew-x: 20.8; skew-y: 20.8; }
        frame 6 { x: -4.2; y: 11.9; skew-x: 21.8; skew-y: 21.8; }
        frame 7 { x: -10000; y: 14.2; skew-x: 22.6; skew-y: 22.6; }
        frame 8 { y: 16.7; skew-x: 23.3; skew-y: 23.3; }
        frame 9 { x: -4; y: 18.9; skew-x: 24.3; skew-y: 24.3; scale-x: 0.701; scale-y: 0.701; }
        frame 10 { x: -6.6; y: 23.2; skew-x: 14.3; skew-y: 14.3; scale-x: 0.7; scale-y: 0.7; }
        frame 11 { x: -9.2; y: 27.9; skew-x: 4.3; skew-y: 4.3; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: -11.4; y: 32.6; skew-x: -5.7; skew-y: -5.7; }
        frame 13 { x: -11; y: 29.3; skew-x: -4.7; skew-y: -4.7; }
        frame 14 { x: -10.7; y: 26; skew-x: -3.9; skew-y: -3.9; }
        frame 15 { x: -10.3; y: 22.7; skew-x: -3.2; skew-y: -3.2; scale-x: 0.701; scale-y: 0.701; }
        frame 16 { x: -10; y: 19.4; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: -9.7; y: 16.1; skew-x: -1.4; skew-y: -1.4; }
        frame 18 { x: -9.4; y: 12.8; skew-x: -0.7; skew-y: -0.7; }
        frame 19 { x: -9.1; y: 9.5; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 9.3; }
        frame 22 { y: 9.1; }
        frame 23 { y: 8.9; }
        frame 24 { y: 8.7; }
        frame 25 { y: 8.9; }
        frame 26 { y: 9.1; }
        frame 27 { y: 9.3; }
        frame 28 { y: 9.5; }
        frame 29 { y: -10000; }
        frame 30 { x: -9.4; y: 9.6; skew-x: 1.3; skew-y: 1.5; scale-x: 0.715; scale-y: 0.689; }
        frame 31 { x: -9.7; y: 9.7; skew-x: 2.8; skew-y: 3.3; scale-x: 0.729; scale-y: 0.677; }
        frame 32 { x: -9.3; y: 9.6; skew-x: 1.3; skew-y: 1.5; scale-x: 0.715; scale-y: 0.689; }
        frame 33 { x: -9.1; y: 9.5; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 34 { x: -8.3; y: 8.3; skew-x: 2; skew-y: 2; scale-x: 0.701; scale-y: 0.701; }
        frame 35 { x: -7.4; y: 7.1; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -6.6; y: 5.8; skew-x: 6; skew-y: 6; }
        frame 37 { x: -5.7; y: 4.6; skew-x: 8.1; skew-y: 8.1; }
        frame 38 { x: -10.4; y: 20.5; skew-x: -22.4; skew-y: -22.4; scale-x: 0.699; scale-y: 0.699; }
        frame 39 { x: -12.1; y: 37.6; skew-x: -53; skew-y: -53; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_cuff";
        frame-count: 67;
        frame 0 { x: -17.3; y: 11.2; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTARM_CUFF; }
        frame 1 { x: -15.5; y: 5.8; skew-x: 6.5; skew-y: 6.5; scale-x: 0.701; scale-y: 0.701; image: none; }
        frame 2 { x: -13.7; y: 0.6; skew-x: 13.1; skew-y: 13.1; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -14.3; y: 3.2; skew-x: 11.1; skew-y: 11.1; }
        frame 4 { x: -14.7; y: 5.8; skew-x: 9.3; skew-y: 9.3; }
        frame 5 { x: -15.3; y: 8.5; skew-x: 7.3; skew-y: 7.3; }
        frame 6 { x: -15.8; y: 11.2; skew-x: 5.5; skew-y: 5.5; }
        frame 7 { x: -16.2; y: 13.9; skew-x: 3.6; skew-y: 3.6; }
        frame 8 { x: -16.7; y: 16.5; skew-x: 1.8; skew-y: 1.8; }
        frame 9 { x: -17.3; y: 19.2; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 10 { x: -18.3; y: 26.8; skew-x: -8; skew-y: -8; scale-x: 0.701; scale-y: 0.701; }
        frame 11 { x: -19.2; y: 34.6; skew-x: -16.2; skew-y: -16.2; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: -19.7; y: 42.7; skew-x: -24.5; skew-y: -24.5; }
        frame 13 { x: -19.5; y: 38.1; skew-x: -20.9; skew-y: -20.9; scale-x: 0.7; scale-y: 0.7; }
        frame 14 { x: -19.2; y: 33.5; skew-x: -17.4; skew-y: -17.4; scale-x: 0.701; scale-y: 0.701; }
        frame 15 { x: -18.9; y: 29; skew-x: -13.9; skew-y: -13.9; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: -18.5; y: 24.4; skew-x: -10.4; skew-y: -10.4; }
        frame 17 { x: -18.1; y: 20; skew-x: -6.9; skew-y: -6.9; }
        frame 18 { x: -17.7; y: 15.6; skew-x: -3.4; skew-y: -3.4; }
        frame 19 { x: -17.3; y: 11.2; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -16.3; y: 10.7; skew-y: 3.5; scale-y: 0.704; }
        frame 22 { x: -15.1; y: 10.4; skew-y: 7.2; scale-y: 0.707; }
        frame 23 { x: -16.3; y: 10.8; skew-y: 3.5; scale-x: 0.701; scale-y: 0.704; }
        frame 24 { x: -17.3; y: 11.2; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 25 { x: -18.4; y: 10.9; skew-x: -2.7; skew-y: -4.2; scale-x: 0.701; scale-y: -10000; }
        frame 26 { x: -19.7; y: 10.8; skew-x: -5.5; skew-y: -8.4; scale-x: -10000; }
        frame 27 { x: -18.5; y: 11; skew-x: -2.7; skew-y: -4.2; }
        frame 28 { x: -17.3; y: 11.2; skew-x: 0; skew-y: 0; scale-x: 0.702; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 30 { x: -17.9; y: 12.3; skew-x: 1.3; skew-y: 1.5; scale-x: 0.715; scale-y: 0.689; }
        frame 31 { x: -18.3; y: 13.4; skew-x: 2.8; skew-y: 3.3; scale-x: 0.729; scale-y: 0.677; }
        frame 32 { x: -17.8; y: 12.8; skew-x: 1.3; skew-y: 1.5; scale-x: 0.715; scale-y: 0.689; }
        frame 33 { x: -17.3; y: 12.2; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 34 { x: -16.5; y: 11.2; skew-x: 2; skew-y: 2; scale-x: 0.701; scale-y: 0.701; }
        frame 35 { x: -15.8; y: 10.3; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -14.9; y: 9.3; skew-x: 6; skew-y: 6; }
        frame 37 { x: -14.1; y: 8.3; skew-x: 8.1; skew-y: 8.1; }
        frame 38 { x: -15.2; y: 25.4; skew-x: -22.4; skew-y: -22.4; scale-x: 0.699; scale-y: 0.699; }
        frame 39 { x: -13.7; y: 44.1; skew-x: -53; skew-y: -53; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_hand";
        frame-count: 67;
        frame 0 { x: -32.3; y: 9.5; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_HAND; }
        frame 1 { x: -28.5; y: 1.5; skew-x: 12.3; skew-y: 12.3; scale-x: 0.7; scale-y: 0.7; image: none; }
        frame 2 { x: -24.4; y: -5.7; skew-x: 24.7; skew-y: 24.7; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -25.2; y: -2.7; skew-x: 22.3; skew-y: 22.3; }
        frame 4 { x: -26; y: 0.1; skew-x: 20.3; skew-y: 20.3; }
        frame 5 { x: -26.7; y: 3.1; skew-x: 18; skew-y: 18; }
        frame 6 { x: -27.4; y: 6.2; skew-x: 15.8; skew-y: 15.8; }
        frame 7 { x: -28.1; y: 9.2; skew-x: 13.6; skew-y: 13.6; }
        frame 8 { x: -28.8; y: 12.3; skew-x: 11.5; skew-y: 11.5; scale-x: 0.701; scale-y: 0.701; }
        frame 9 { x: -29.4; y: 15.4; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: -32.7; y: 25.6; skew-x: -4.4; skew-y: -4.4; }
        frame 11 { x: -35.2; y: 36.5; skew-x: -18.4; skew-y: -18.4; scale-x: 0.7; scale-y: 0.7; }
        frame 12 { x: -36.9; y: 47.9; skew-x: -32.4; skew-y: -32.4; scale-x: 0.701; scale-y: 0.701; }
        frame 13 { x: -36.4; y: 42.3; skew-x: -27.7; skew-y: -27.7; scale-x: 0.7; scale-y: 0.7; }
        frame 14 { x: -36; y: 36.5; skew-x: -23; skew-y: -23; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: -35.4; y: 31; skew-x: -18.4; skew-y: -18.4; }
        frame 16 { x: -34.8; y: 25.6; skew-x: -13.7; skew-y: -13.7; scale-x: 0.701; scale-y: 0.701; }
        frame 17 { x: -33.9; y: 20.2; skew-x: -9.2; skew-y: -9.2; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -33.1; y: 14.7; skew-x: -4.4; skew-y: -4.4; }
        frame 19 { x: -32.3; y: 9.5; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -32; y: 9; skew-x: 1; skew-y: 1; scale-x: 0.701; scale-y: 0.701; }
        frame 22 { x: -31.8; y: 8.5; skew-x: 2.1; skew-y: 2.1; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -32.1; y: 9; skew-x: 1; skew-y: 1; }
        frame 24 { x: -32.3; y: 9.5; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 25 { x: -32; y: 9; skew-x: 1; skew-y: 1; scale-x: 0.701; scale-y: 0.701; }
        frame 26 { x: -31.8; y: 8.5; skew-x: 2.1; skew-y: 2.1; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -32.1; y: 9; skew-x: 1; skew-y: 1; }
        frame 28 { x: -32.3; y: 9.5; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 7.9; skew-x: 3.8; skew-y: 4.5; scale-x: 0.714; scale-y: 0.689; }
        frame 31 { y: 6.3; skew-x: 7.9; skew-y: 9.2; scale-x: 0.727; scale-y: 0.677; }
        frame 32 { y: 8; skew-x: 3.8; skew-y: 4.5; scale-x: 0.714; scale-y: 0.689; }
        frame 33 { y: 9.5; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 34 { x: -30.7; y: 6.2; skew-x: 5.3; skew-y: 5.3; scale-x: 0.701; scale-y: 0.701; }
        frame 35 { x: -28.8; y: 2.9; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -27; y: -0; skew-x: 16.1; skew-y: 16.1; scale-x: 0.7; scale-y: 0.7; }
        frame 37 { x: -25; y: -3.1; skew-x: 21.6; skew-y: 21.6; scale-x: 0.701; scale-y: 0.701; }
        frame 38 { x: -29.8; y: 24.7; skew-x: -19.2; skew-y: -19.2; scale-x: 0.699; scale-y: 0.699; }
        frame 39 { x: -27.1; y: 56.6; skew-x: -60.5; skew-y: -60.5; scale-x: 0.698; scale-y: 0.698; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftarm_upper";
        frame-count: 67;
        frame 0 { x: 57; y: 9; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTARM_UPPER; }
        frame 1 { x: 54.9; y: 10.3; skew-x: -6.2; skew-y: -5.4; scale-x: 0.701; scale-y: -10000; image: none; }
        frame 2 { x: 52.8; y: 11.8; skew-x: -12.7; skew-y: -11.2; scale-x: -10000; }
        frame 3 { x: 53; y: 14.4; skew-x: -12.9; skew-y: -10.7; }
        frame 4 { x: 53.1; y: 17; skew-x: -13.2; skew-y: -10.4; scale-y: 0.703; }
        frame 5 { x: 53.4; y: 19.6; skew-x: -13.5; skew-y: -9.9; scale-y: -10000; }
        frame 6 { x: 53.5; y: 22.2; skew-x: -13.9; skew-y: -9.5; scale-y: 0.704; }
        frame 7 { x: 53.8; y: 24.7; skew-x: -14.2; skew-y: -9.2; scale-y: -10000; }
        frame 8 { x: 54; y: 27.4; skew-x: -14.5; skew-y: -8.7; scale-y: 0.705; }
        frame 9 { x: 54.1; y: 30; skew-x: -14.9; skew-y: -8.4; scale-x: 0.702; scale-y: 0.706; }
        frame 10 { x: 55.3; y: 31.1; skew-x: -10.4; skew-y: -4.4; scale-x: 0.701; scale-y: 0.705; }
        frame 11 { x: 56.4; y: 32.2; skew-x: -5.9; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 57.6; y: 33.4; skew-x: -1.6; skew-y: 3.3; scale-y: 0.704; }
        frame 13 { x: 57.5; y: 29.8; skew-x: -1.2; skew-y: 2.8; scale-y: -10000; }
        frame 14 { x: 57.4; y: 26.4; skew-x: -1; skew-y: 2.3; scale-y: 0.703; }
        frame 15 { x: -10000; y: 22.9; skew-x: -0.7; skew-y: 1.8; scale-y: -10000; }
        frame 16 { x: 57.2; y: 19.4; skew-x: -0.5; skew-y: 1.3; }
        frame 17 { x: 57.1; y: 15.9; skew-x: -0.2; skew-y: 0.8; scale-y: 0.702; }
        frame 18 { x: 57; y: 12.5; skew-x: -0; skew-y: 0.3; scale-y: -10000; }
        frame 19 { y: 9; skew-x: 0; skew-y: 0; scale-x: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 21 { y: 8.9; }
        frame 22 { y: 8.7; }
        frame 23 { y: 8.6; }
        frame 24 { y: 8.4; }
        frame 25 { y: 8.6; }
        frame 26 { y: 8.7; }
        frame 27 { y: 8.9; }
        frame 28 { y: 9; }
        frame 29 { y: -10000; }
        frame 30 { x: 56.6; y: 10.4; skew-x: -1.7; skew-y: -1.9; scale-x: 0.715; scale-y: 0.689; }
        frame 31 { x: 56.4; y: 11.9; skew-x: -3.4; skew-y: -4; scale-x: 0.728; scale-y: 0.677; }
        frame 32 { x: 56.7; y: 10.5; skew-x: -1.7; skew-y: -1.9; scale-x: 0.715; scale-y: 0.689; }
        frame 33 { x: 57; y: 9; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 34 { x: 56.2; y: 9.6; skew-x: -2.2; skew-y: -2.2; scale-x: 0.701; scale-y: 0.701; }
        frame 35 { x: 55.5; y: 10.2; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 54.8; y: 10.7; skew-x: -7.2; skew-y: -7.2; }
        frame 37 { x: 54; y: 11.4; skew-x: -9.7; skew-y: -9.7; }
        frame 38 { x: 58.8; y: 10.1; skew-x: 12; skew-y: 12; scale-x: 0.7; scale-y: 0.7; }
        frame 39 { x: 64.9; y: 10.7; skew-x: 34.1; skew-y: 34.1; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftarm_lower";
        frame-count: 67;
        frame 0 { x: 74; y: 8.9; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTARM_LOWER; }
        frame 1 { x: 70.4; y: 9.4; skew-x: -11.4; skew-y: -11.4; scale-x: 0.701; scale-y: 0.701; image: none; }
        frame 2 { x: 67.6; y: 10.6; skew-x: -23.2; skew-y: -23.2; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 67.9; y: 12.8; skew-x: -22; skew-y: -22; scale-x: 0.7; scale-y: 0.7; }
        frame 4 { x: 68.3; y: 14.9; skew-x: -20.7; skew-y: -20.7; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 68.7; y: 17; skew-x: -19.5; skew-y: -19.5; }
        frame 6 { x: 69; y: 19.2; skew-x: -18.4; skew-y: -18.4; }
        frame 7 { x: 69.3; y: 21.5; skew-x: -17.2; skew-y: -17.2; scale-x: 0.701; scale-y: 0.701; }
        frame 8 { x: 69.8; y: 23.6; skew-x: -16; skew-y: -16; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 70; y: 25.8; skew-x: -14.9; skew-y: -14.9; scale-x: 0.702; scale-y: 0.702; }
        frame 10 { x: 71.4; y: 27.6; skew-x: -5.4; skew-y: -5.4; scale-x: 0.701; scale-y: 0.701; }
        frame 11 { x: 73.3; y: 29.7; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 75.3; y: 32.1; skew-x: 13.3; skew-y: 13.3; }
        frame 13 { x: 75.1; y: 28.8; skew-x: 11.3; skew-y: 11.3; scale-x: 0.7; scale-y: 0.7; }
        frame 14 { x: 74.8; y: 25.4; skew-x: 9.3; skew-y: 9.3; scale-x: 0.701; scale-y: 0.701; }
        frame 15 { x: 74.7; y: 22.1; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 74.4; y: 18.7; skew-x: 5.5; skew-y: 5.5; }
        frame 17 { x: 74.3; y: 15.5; skew-x: 3.8; skew-y: 3.8; }
        frame 18 { x: 74.1; y: 12.2; skew-x: 1.8; skew-y: 1.8; }
        frame 19 { x: 74; y: 8.9; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 8.7; }
        frame 22 { y: 8.6; }
        frame 23 { y: 8.4; }
        frame 24 { y: 8.3; }
        frame 25 { y: 8.4; }
        frame 26 { y: 8.6; }
        frame 27 { y: 8.7; }
        frame 28 { y: 8.9; }
        frame 29 { y: -10000; }
        frame 30 { x: 73.8; y: 9.9; skew-x: -2.4; skew-y: -2.7; scale-x: 0.715; scale-y: 0.689; }
        frame 31 { x: 73.6; y: 10.8; skew-x: -5; skew-y: -5.8; scale-x: 0.728; scale-y: 0.677; }
        frame 32 { x: 73.8; y: 9.8; skew-x: -2.4; skew-y: -2.7; scale-x: 0.715; scale-y: 0.689; }
        frame 33 { x: 74; y: 8.9; skew-x: 0; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 34 { x: 72.9; y: -10000; skew-x: -3.2; skew-y: -3.2; scale-x: 0.701; scale-y: 0.701; }
        frame 35 { x: 72; y: 8.8; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 71; y: -10000; skew-x: -10.2; skew-y: -10.2; }
        frame 37 { x: 70; y: 9; skew-x: -13.7; skew-y: -13.7; }
        frame 38 { x: 73.8; y: 12.9; skew-x: 13.8; skew-y: 13.8; scale-x: 0.7; scale-y: 0.7; }
        frame 39 { x: 79.7; y: 20.3; skew-x: 41.6; skew-y: 41.6; scale-x: 0.699; scale-y: 0.699; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftarm_hand";
        frame-count: 67;
        frame 0 { x: 112.7; y: 16.1; skew-x: 180; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_HAND; }
        frame 1 { x: 108.1; y: 7.3; skew-x: 163.5; skew-y: -16.4; scale-x: 0.7; scale-y: 0.7; image: none; }
        frame 2 { x: 102.8; y: -0; skew-x: 146.9; skew-y: -33; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 103.8; y: 2.8; skew-x: 149.6; skew-y: -30.3; scale-x: 0.699; scale-y: 0.699; }
        frame 4 { x: 104.8; y: 5.7; skew-x: 152.2; skew-y: -27.7; scale-x: 0.7; scale-y: 0.7; }
        frame 5 { x: 105.7; y: 8.6; skew-x: 154.7; skew-y: -25.2; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 106.7; y: 11.5; skew-x: 157.4; skew-y: -22.5; }
        frame 7 { x: 107.7; y: 14.5; skew-x: 159.9; skew-y: -20; }
        frame 8 { x: 108.6; y: 17.6; skew-x: 162.5; skew-y: -17.4; scale-x: 0.701; scale-y: 0.701; }
        frame 9 { x: 109.6; y: 20.7; skew-x: 165; skew-y: -14.9; scale-x: 0.702; scale-y: 0.702; }
        frame 10 { x: 111.9; y: 30.3; skew-x: 179.5; skew-y: -0.4; scale-x: 0.701; scale-y: 0.701; }
        frame 11 { x: 113.4; y: 40.5; skew-x: 193.8; skew-y: 13.8; scale-x: 0.7; scale-y: 0.7; }
        frame 12 { x: 114.3; y: 51.7; skew-x: 208.3; skew-y: 28.3; scale-x: 0.701; scale-y: 0.701; }
        frame 13 { x: -10000; y: 46.5; skew-x: 204.1; skew-y: 24.1; scale-x: 0.7; scale-y: 0.7; }
        frame 14 { x: 114.1; y: 41.3; skew-x: 200.1; skew-y: 20.1; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 114; y: 36.1; skew-x: 196.1; skew-y: 16.1; }
        frame 16 { x: 113.8; y: 31.1; skew-x: 192; skew-y: 12; scale-x: 0.701; scale-y: 0.701; }
        frame 17 { x: 113.6; y: 26.1; skew-x: 188; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 113.2; y: 21; skew-x: 184; skew-y: 4; }
        frame 19 { x: 112.7; y: 16.1; skew-x: 180; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 112.2; y: 15.4; skew-x: 178; skew-y: -1.9; scale-x: 0.701; scale-y: 0.701; }
        frame 22 { x: 111.7; y: 14.7; skew-x: 176; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 112.2; y: 15.4; skew-x: 178; skew-y: -1.9; }
        frame 24 { x: 112.7; y: 16.1; skew-x: 180; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 25 { x: 112.2; y: 15.4; skew-x: 178; skew-y: -1.9; scale-x: 0.701; scale-y: 0.701; }
        frame 26 { x: 111.7; y: 14.7; skew-x: 176; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 112.2; y: 15.4; skew-x: 178; skew-y: -1.9; }
        frame 28 { x: 112.7; y: 16.1; skew-x: 180; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 113.1; y: 14.4; skew-x: 176; skew-y: -4.7; scale-x: 0.714; scale-y: 0.689; }
        frame 31 { x: 113.3; y: 12.9; skew-x: 171.6; skew-y: -9.6; scale-x: 0.727; scale-y: 0.677; }
        frame 32 { x: 113; y: 14.5; skew-x: 176; skew-y: -4.7; scale-x: 0.714; scale-y: 0.689; }
        frame 33 { x: 112.7; y: 16.1; skew-x: 180; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 34 { x: 111.4; y: 12.8; skew-x: 174.5; skew-y: -5.4; scale-x: 0.701; scale-y: 0.701; }
        frame 35 { x: 110; y: 9.8; skew-x: 168.7; skew-y: -11.2; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 108.5; y: 6.8; skew-x: 163.2; skew-y: -16.7; scale-x: 0.7; scale-y: 0.7; }
        frame 37 { x: 106.8; y: 3.9; skew-x: 157.4; skew-y: -22.5; scale-x: 0.701; scale-y: 0.701; }
        frame 38 { x: 107.8; y: 27.1; skew-x: 192.8; skew-y: 12.8; scale-x: 0.699; scale-y: 0.699; }
        frame 39 { x: 103.7; y: 53.9; skew-x: 228.6; skew-y: 48.6; scale-x: 0.698; scale-y: 0.698; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_body2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 41 { x: 18.4; y: 17.2; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_BODY2; }
        frame 42 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 61 { y: 16.2; }
        frame 62 { y: 15.2; }
        frame 63 { y: 14.2; }
        frame 64 { y: 12.2; }
        frame 65 { y: 10.2; }
        frame 66 { y: 8.2; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_upper2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 15.2; y: 12; skew-x: 37.4; skew-y: 32.7; scale-x: 0.561; scale-y: 0.622; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTARM_UPPER2; }
        frame 41 { x: 15.5; y: 13.6; skew-x: 24.5; skew-y: 24.5; scale-x: 0.554; scale-y: 0.657; cel: -10000; image: none; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 8.8; y: 22.5; skew-x: -7.2; skew-y: -7.2; scale-x: 0.619; scale-y: 0.659; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 8.6; y: 20.8; scale-y: 0.697; }
        frame 48 { x: 8.7; y: 21.6; scale-y: 0.677; }
        frame 49 { x: 8.8; y: 22.5; scale-y: 0.659; }
        frame 50 { x: -10000; y: 21.7; scale-y: 0.677; }
        frame 51 { x: 8.6; y: 20.8; scale-y: 0.697; }
        frame 52 { x: 8.7; y: 21.6; scale-y: 0.677; }
        frame 53 { x: 8.8; y: 22.5; scale-y: 0.659; }
        frame 54 { x: 15.5; y: 13.6; skew-x: 24.5; skew-y: 24.5; scale-x: 0.554; scale-y: 0.657; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftarm_upper2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 48; y: 22.8; skew-x: -28.9; skew-y: -41; scale-x: 0.776; scale-y: 0.698; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTARM_UPPER2; }
        frame 41 { x: 47; y: 24; skew-x: -31.5; skew-y: -35.7; scale-x: 0.791; scale-y: 0.696; cel: -10000; image: none; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 52; y: 21.3; skew-x: 4.2; skew-y: 0; scale-x: 0.792; scale-y: 0.697; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 46 { y: 21.4; skew-x: 4.1; }
        frame 47 { y: 19.7; skew-x: 4.2; scale-y: 0.733; }
        frame 48 { y: 20.5; skew-x: 4; scale-y: 0.715; }
        frame 49 { y: 21.4; skew-x: 4.1; scale-y: 0.697; }
        frame 50 { y: 20.6; skew-x: 4; scale-y: 0.715; }
        frame 51 { y: 19.7; skew-x: 4.2; scale-y: 0.733; }
        frame 52 { y: 20.6; skew-x: 4.1; scale-y: 0.715; }
        frame 53 { y: 21.3; skew-x: 4.2; scale-y: 0.697; }
        frame 54 { x: 47; y: 24; skew-x: -31.5; skew-y: -35.7; scale-x: 0.791; scale-y: 0.696; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_jaw";
        frame-count: 67;
        frame 0 { x: 26.3; y: 33.5; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_JAW; }
        frame 1 { x: -10000; y: 33.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 33.3; }
        frame 3 { y: 35.4; }
        frame 4 { y: 37.4; }
        frame 5 { y: 39.5; }
        frame 6 { y: 41.6; }
        frame 7 { y: 43.7; }
        frame 8 { y: 45.8; }
        frame 9 { y: 47.9; }
        frame 10 { y: 51.2; }
        frame 11 { y: 54.5; }
        frame 12 { y: 57.9; }
        frame 13 { y: 54.4; }
        frame 14 { y: 50.9; }
        frame 15 { y: 47.4; }
        frame 16 { y: 43.9; }
        frame 17 { y: 40.4; }
        frame 18 { y: 37; }
        frame 19 { y: 33.5; }
        frame 20 { y: 35.6; }
        frame 21 { y: 36; }
        frame 22 { y: 36.3; }
        frame 23 { y: 36; }
        frame 24 { y: 35.6; }
        frame 25 { y: 36; }
        frame 26 { y: 36.3; }
        frame 27 { y: 36; }
        frame 28 { y: 35.6; }
        frame 29 { y: -10000; }
        frame 30 { y: 36.3; scale-y: 0.716; }
        frame 31 { y: 36.9; scale-y: 0.731; }
        frame 32 { y: 36.3; scale-y: 0.716; }
        frame 33 { y: 35.6; scale-y: 0.702; }
        frame 34 { y: 35.8; scale-y: 0.72; }
        frame 35 { y: 36; scale-y: 0.739; }
        frame 36 { y: 36.1; scale-y: 0.757; }
        frame 37 { y: 36.4; scale-y: 0.776; }
        frame 38 { y: -10000; scale-y: -10000; }
        frame 40 { y: 35.8; }
        frame 41 { y: 35.1; }
        frame 42 { y: 34.1; scale-y: 0.821; }
        frame 43 { y: 33.1; scale-y: 0.866; }
        frame 44 { y: -10000; scale-y: -10000; }
        frame 45 { y: 32.5; }
        frame 46 { y: 31.8; }
        frame 47 { y: 31.1; }
        frame 48 { y: 32.1; }
        frame 49 { y: 33.1; }
        frame 50 { y: 32.1; }
        frame 51 { y: 31.1; }
        frame 52 { y: 32.1; }
        frame 53 { y: 33.1; }
        frame 54 { y: -10000; }
        frame 55 { y: 34.8; scale-y: 0.821; }
        frame 56 { y: 36.4; scale-y: 0.776; }
        frame 57 { y: -10000; scale-y: -10000; }
        frame 58 { y: 35.5; }
        frame 59 { y: 34.8; }
        frame 60 { y: 34; }
        frame 61 { y: 34.8; }
        frame 62 { y: 35.5; }
        frame 63 { y: 36.4; }
        frame 64 { y: 34.6; scale-y: 0.839; }
        frame 65 { y: 33; scale-y: 0.903; }
        frame 66 { y: 31.2; scale-y: 0.966; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 67;
        frame 0 { x: 22.1; y: 1; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_HEAD; }
        frame 1 { x: -10000; y: -0.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: -1.6; }
        frame 3 { y: 0.9; }
        frame 4 { y: 3.5; }
        frame 5 { y: 6.2; }
        frame 6 { y: 8.8; }
        frame 7 { y: 11.5; }
        frame 8 { y: 14.1; }
        frame 9 { y: 16.8; }
        frame 10 { y: 18.8; }
        frame 11 { y: 20.8; }
        frame 12 { y: 22.9; }
        frame 13 { y: 19.7; }
        frame 14 { y: 16.6; }
        frame 15 { y: 13.5; }
        frame 16 { y: 10.4; }
        frame 17 { y: 7.2; }
        frame 18 { y: 4.1; }
        frame 19 { y: 1; }
        frame 20 { y: -10000; }
        frame 21 { y: 0.7; }
        frame 22 { y: 0.3; }
        frame 23 { y: 0.7; }
        frame 24 { y: 1; }
        frame 25 { y: 0.7; }
        frame 26 { y: 0.3; }
        frame 27 { y: 0.7; }
        frame 28 { y: 1; }
        frame 29 { y: -10000; }
        frame 30 { x: 21.7; y: 2.5; scale-x: 0.715; scale-y: 0.689; }
        frame 31 { x: 21.3; y: 4.2; scale-x: 0.729; scale-y: 0.677; }
        frame 32 { x: 21.7; y: 2.6; scale-x: 0.715; scale-y: 0.689; }
        frame 33 { x: 22.1; y: 1; scale-x: 0.702; scale-y: 0.702; }
        frame 34 { x: -10000; y: 0.7; scale-x: -10000; scale-y: -10000; }
        frame 35 { y: 0.3; }
        frame 36 { y: 0.1; }
        frame 37 { y: -0.1; }
        frame 38 { y: -10000; }
        frame 40 { y: 0.3; }
        frame 41 { y: 1; }
        frame 42 { y: -1.6; }
        frame 43 { y: -4.3; }
        frame 44 { y: -10000; }
        frame 45 { y: -3.7; }
        frame 46 { y: -3.1; }
        frame 47 { y: -2.5; }
        frame 48 { y: -3.4; }
        frame 49 { y: -4.3; }
        frame 50 { y: -3.4; }
        frame 51 { y: -2.5; }
        frame 52 { y: -3.4; }
        frame 53 { y: -4.3; }
        frame 54 { y: -10000; }
        frame 55 { y: -2.2; }
        frame 56 { y: -0.1; }
        frame 57 { y: -10000; }
        frame 64 { y: -1.5; }
        frame 65 { y: -2.9; }
        frame 66 { y: -4.3; }
    }
    Track {
        source-name: "Zombie_bungi_hair";
        frame-count: 67;
        frame 0 { x: 19.4; y: -3; scale-x: 0.702; scale-y: 0.702; image: IMAGE_REANIM_ZOMBIE_BUNGI_HAIR; }
        frame 1 { x: -10000; y: -4.5; scale-x: -10000; scale-y: 0.724; image: none; }
        frame 2 { y: -6; scale-y: 0.746; }
        frame 3 { y: -3.7; scale-y: 0.768; }
        frame 4 { y: -1.2; scale-y: 0.791; }
        frame 5 { y: 0.9; scale-y: 0.813; }
        frame 6 { y: 3.3; scale-y: 0.835; }
        frame 7 { y: 5.7; scale-y: 0.858; }
        frame 8 { y: 8.1; scale-y: 0.88; }
        frame 9 { y: 10.4; scale-y: 0.902; }
        frame 10 { y: 13.4; scale-y: 0.813; }
        frame 11 { y: 16.4; scale-y: 0.725; }
        frame 12 { y: 19.5; scale-y: 0.636; }
        frame 13 { y: 16.3; scale-y: 0.645; }
        frame 14 { y: 13; scale-y: 0.655; }
        frame 15 { y: 9.8; scale-y: 0.664; }
        frame 16 { y: 6.5; scale-y: 0.673; }
        frame 17 { y: 3.3; scale-y: 0.683; }
        frame 18 { y: 0.1; scale-y: 0.692; }
        frame 19 { y: -3; scale-y: 0.702; }
        frame 20 { y: -10000; scale-y: -10000; }
        frame 21 { x: 20.5; y: -3.4; skew-y: 3.8; scale-y: 0.729; }
        frame 22 { x: 21.9; y: -3.9; skew-y: 7.9; scale-y: 0.756; }
        frame 23 { x: 20.6; y: -3.5; skew-y: 3.8; scale-x: 0.701; scale-y: 0.729; }
        frame 24 { x: 19.4; y: -3; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 25 { x: 18.4; y: -3.2; skew-y: -4.2; scale-x: 0.691; scale-y: 0.705; }
        frame 26 { x: 17.3; y: -3.6; skew-y: -8.6; scale-x: 0.68; scale-y: 0.71; }
        frame 27 { x: 18.4; y: -3.3; skew-y: -4.2; scale-x: 0.691; scale-y: 0.705; }
        frame 28 { x: 19.4; y: -3; skew-y: 0; scale-x: 0.702; scale-y: 0.702; }
        frame 29 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 18.8; y: 0; scale-x: 0.715; scale-y: 0.641; }
        frame 31 { x: 18.1; y: 3.2; scale-x: 0.729; scale-y: 0.58; }
        frame 32 { x: 18.7; y: 0.1; scale-x: 0.715; scale-y: 0.641; }
        frame 33 { x: 19.4; y: -3; scale-x: 0.702; scale-y: 0.702; }
        frame 34 { x: -10000; y: -3.3; scale-x: -10000; scale-y: -10000; }
        frame 35 { y: -3.6; }
        frame 36 { y: -3.9; }
        frame 37 { y: -4.2; }
        frame 38 { y: -10000; }
        frame 40 { y: -3.6; }
        frame 41 { y: -3; }
        frame 42 { y: -5.8; }
        frame 43 { y: -8.6; }
        frame 44 { y: -10000; }
        frame 45 { y: -8.2; }
        frame 46 { y: -7.8; }
        frame 47 { y: -7.4; }
        frame 48 { y: -8; }
        frame 49 { y: -8.6; }
        frame 50 { y: -8; }
        frame 51 { y: -7.4; }
        frame 52 { y: -8; }
        frame 53 { y: -8.6; }
        frame 54 { y: -10000; }
        frame 55 { y: -6.4; }
        frame 56 { y: -4.2; }
        frame 57 { y: -10000; }
        frame 64 { x: 19.3; y: -4.3; scale-y: 0.653; }
        frame 65 { x: 19.2; y: -4.4; scale-y: 0.604; }
        frame 66 { x: -10000; y: -4.5; scale-y: 0.555; }
    }
    Track {
        source-name: "Zombie_bungi_leftarm_hand2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 84.2; y: 57.4; skew-x: 163.2; skew-y: -16.7; scale-x: 0.649; scale-y: 0.649; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_HAND2; }
        frame 41 { x: 69.7; y: 55; skew-x: 194.3; skew-y: 14.3; scale-x: 0.647; scale-y: 0.647; cel: -10000; image: none; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 66.8; y: 68.8; skew-x: 181; skew-y: 1; scale-x: 0.649; scale-y: 0.649; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 66.7; y: 68.7; skew-x: 180.8; skew-y: 0.8; }
        frame 51 { x: 66.8; y: 68.8; skew-x: 181; skew-y: 1; }
        frame 52 { x: 66.7; y: 68.7; skew-x: 180.8; skew-y: 0.8; }
        frame 53 { x: 66.8; y: 68.8; skew-x: 181; skew-y: 1; }
        frame 54 { x: 69.7; y: 55; skew-x: 194.3; skew-y: 14.3; scale-x: 0.647; scale-y: 0.647; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_leftarm_lower2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 40; y: 46.8; skew-x: -27.6; skew-y: -27.6; scale-x: 0.699; scale-y: 0.699; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_LEFTARM_LOWER2; }
        frame 41 { x: 38.8; y: 23.7; skew-x: 6.8; skew-y: 13.3; scale-x: 0.702; scale-y: 0.697; cel: -10000; image: none; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 29.6; y: 45.3; skew-x: -6.4; skew-y: 0; scale-x: 0.703; scale-y: 0.699; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 38.8; y: 23.7; skew-x: 6.8; skew-y: 13.3; scale-x: 0.702; scale-y: 0.697; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_hand2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 1.7; y: 54; skew-x: 23.6; skew-y: 23.6; scale-x: 0.649; scale-y: 0.649; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_HAND2; }
        frame 41 { x: 14; y: 60.9; skew-x: -14.5; skew-y: -14.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 17.8; y: 68.6; skew-x: 0; skew-y: 0; scale-x: 0.65; scale-y: 0.65; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 14; y: 60.9; skew-x: -14.5; skew-y: -14.5; scale-x: 0.649; scale-y: 0.649; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_bungi_rightarm_lower2";
        frame-count: 67;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 40 { x: 5.6; y: 34.7; skew-x: 28.8; skew-y: 28.8; scale-x: 0.631; scale-y: 0.631; cel: 0; image: IMAGE_REANIM_ZOMBIE_BUNGI_RIGHTARM_LOWER2; }
        frame 41 { x: 6.8; y: 40.2; skew-x: -2.7; skew-y: -5.6; scale-x: 0.63; scale-y: 0.693; cel: -10000; image: none; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 16.1; y: 46.8; skew-x: 11.8; skew-y: 8.8; scale-x: 0.631; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 50 { y: 46.9; scale-x: 0.63; }
        frame 51 { y: 46.8; scale-x: 0.631; }
        frame 52 { y: 46.9; scale-x: 0.63; }
        frame 53 { y: 46.8; scale-x: 0.631; }
        frame 54 { x: 6.8; y: 40.2; skew-x: -2.7; skew-y: -5.6; scale-x: 0.63; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
    }
}
