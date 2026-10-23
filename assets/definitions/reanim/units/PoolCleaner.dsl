export component PoolCleaner {
    fps: 12;
    Track {
        source-name: "anim_land";
        frame-count: 70;
        frame 11 { cel: -1; }
        frame 12 { cel: -10000; }
    }
    Track {
        source-name: "anim_water";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { cel: 0; }
        frame 12 { cel: -10000; }
        frame 23 { cel: -1; }
        frame 24 { cel: -10000; }
    }
    Track {
        source-name: "anim_suck";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 23 { cel: 0; }
        frame 24 { cel: -10000; }
        frame 47 { cel: -1; }
        frame 48 { cel: -10000; }
    }
    Track {
        source-name: "anim_landsuck";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 47 { cel: 0; }
        frame 48 { cel: -10000; }
    }
    Track {
        source-name: "PoolCleaner_backwheel1";
        frame-count: 70;
        frame 0 { x: 37.5; y: 32.9; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_POOLCLEANER_WHEEL; }
        frame 1 { x: -10000; y: 32.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 32; }
        frame 3 { y: 31.7; }
        frame 4 { y: 31.3; }
        frame 5 { y: 30.9; }
        frame 6 { y: 31.3; }
        frame 7 { y: 31.7; }
        frame 8 { y: 32; }
        frame 9 { y: 32.5; }
        frame 10 { y: 32.9; }
        frame 11 { y: -10000; cel: -1; }
        frame 12 { cel: -10000; }
        frame 47 { cel: 0; }
        frame 48 { y: 32.2; cel: -10000; }
        frame 49 { y: 31.5; }
        frame 50 { y: 30.9; }
        frame 51 { y: 31.3; }
        frame 52 { y: 31.7; }
        frame 53 { y: 32; }
        frame 54 { y: 32.5; }
        frame 55 { y: 32.9; }
        frame 56 { y: 32.5; }
        frame 57 { y: 32; }
        frame 58 { y: 31.7; }
        frame 59 { y: 31.3; }
        frame 60 { y: 30.9; }
        frame 61 { y: 31.3; }
        frame 62 { y: 31.7; }
        frame 63 { y: 32; }
        frame 64 { y: 32.5; }
        frame 65 { y: 32.9; }
        frame 66 { y: 32.4; }
        frame 67 { y: 31.9; }
        frame 68 { y: 31.4; }
        frame 69 { y: 30.9; }
    }
    Track {
        source-name: "PoolCleaner_backwheel2";
        frame-count: 70;
        frame 0 { x: 9.1; y: 30.4; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_POOLCLEANER_WHEEL; }
        frame 1 { x: -10000; y: 30.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 31.4; }
        frame 3 { y: 31.9; }
        frame 4 { y: 32.4; }
        frame 5 { y: 32.9; }
        frame 6 { y: 32.4; }
        frame 7 { y: 31.9; }
        frame 8 { y: 31.4; }
        frame 9 { y: 30.9; }
        frame 10 { y: 30.4; }
        frame 11 { y: -10000; cel: -1; }
        frame 12 { cel: -10000; }
        frame 47 { cel: 0; }
        frame 48 { y: 31.3; cel: -10000; }
        frame 49 { y: 32; }
        frame 50 { y: 32.9; }
        frame 51 { y: 32.4; }
        frame 52 { y: 31.9; }
        frame 53 { y: 31.4; }
        frame 54 { y: 30.9; }
        frame 55 { y: 30.4; }
        frame 56 { y: 30.9; }
        frame 57 { y: 31.4; }
        frame 58 { y: 31.9; }
        frame 59 { y: 32.4; }
        frame 60 { y: 32.9; }
        frame 61 { y: 32.4; }
        frame 62 { y: 31.9; }
        frame 63 { y: 31.4; }
        frame 64 { y: 30.9; }
        frame 65 { y: 30.4; }
        frame 66 { y: 31.1; }
        frame 67 { y: 31.7; }
        frame 68 { y: 32.3; }
        frame 69 { y: 32.9; }
    }
    Track {
        source-name: "PoolCleaner_body";
        frame-count: 70;
        frame 0 { x: 11.1; y: 14.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POOLCLEANER_BODY1; }
        frame 1 { x: -10000; y: 14.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 15; }
        frame 4 { y: 15.1; }
        frame 5 { y: 14.7; }
        frame 6 { y: 14.2; }
        frame 7 { y: 14.7; }
        frame 8 { y: 15.1; }
        frame 9 { y: 14.6; }
        frame 10 { y: 14.1; }
        frame 11 { y: -10000; cel: -1; }
        frame 12 { cel: -10000; }
        frame 47 { y: 14.2; cel: 0; }
        frame 48 { y: 14.7; cel: -10000; }
        frame 49 { y: 15.1; }
        frame 50 { y: 14.6; }
        frame 51 { y: 14.1; }
        frame 52 { y: 14.5; }
        frame 53 { y: 15; }
        frame 54 { y: 14.6; }
        frame 55 { y: 14.2; }
        frame 56 { y: 14.7; }
        frame 57 { y: 15.1; }
        frame 58 { y: 14.6; }
        frame 59 { y: 14.1; }
        frame 60 { y: 14.5; }
        frame 61 { y: 15; }
        frame 62 { y: 14.5; }
        frame 63 { y: 14.1; }
        frame 64 { y: 14.5; }
        frame 65 { y: 15; }
        frame 66 { y: 14.5; }
        frame 67 { y: 14.1; }
        frame 68 { y: 14.5; }
        frame 69 { y: 15; }
    }
    Track {
        source-name: "PoolCleaner_body2";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { x: 12.7; y: 56.2; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_POOLCLEANER_BODY2; }
        frame 12 { x: -10000; y: 56.4; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 13 { y: 56.6; }
        frame 14 { y: 56.8; }
        frame 15 { y: 57; }
        frame 16 { y: 57.2; }
        frame 17 { y: 57; }
        frame 18 { y: 56.9; }
        frame 19 { y: 56.7; }
        frame 20 { y: 56.5; }
        frame 21 { y: 56.4; }
        frame 22 { y: 56.2; }
        frame 23 { y: -10000; }
        frame 24 { y: 56.5; }
        frame 25 { y: 56.9; }
        frame 26 { y: 57.2; }
        frame 27 { y: 57; }
        frame 28 { y: 56.9; }
        frame 29 { y: 56.7; }
        frame 30 { y: 56.5; }
        frame 31 { y: 56.4; }
        frame 32 { y: 56.2; }
        frame 33 { y: 56.4; }
        frame 34 { y: 56.6; }
        frame 35 { y: 56.8; }
        frame 36 { y: 57; }
        frame 37 { y: 57.2; }
        frame 38 { x: 11.5; y: 56.4; scale-x: 0.861; scale-y: 0.861; }
        frame 39 { x: 10.2; y: 55.6; scale-x: 0.923; scale-y: 0.923; }
        frame 40 { x: 8.9; y: 54.8; scale-x: 0.984; scale-y: 0.984; }
        frame 41 { x: 10.2; y: 55.3; scale-x: 0.923; scale-y: 0.923; }
        frame 42 { x: 11.5; y: 55.7; scale-x: 0.861; scale-y: 0.861; }
        frame 43 { x: 12.7; y: 56.2; scale-x: 0.8; scale-y: 0.8; }
        frame 44 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { cel: -1; }
        frame 48 { cel: -10000; }
    }
    Track {
        source-name: "PoolCleaner_tubeend";
        frame-count: 70;
        frame 0 { x: 30.8; y: 15.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POOLCLEANER_TUBEEND; }
        frame 1 { x: -10000; y: 15.3; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 31; y: 15.5; skew-x: 0.8; skew-y: 0.8; }
        frame 3 { y: 15.4; skew-x: 1.3; skew-y: 1.3; }
        frame 4 { x: 31.1; y: -10000; skew-x: 1.8; skew-y: 1.8; }
        frame 5 { x: -10000; skew-x: 2.4; skew-y: 2.4; }
        frame 6 { skew-x: 1.8; skew-y: 1.8; }
        frame 7 { x: 30.9; y: 15.2; skew-x: 1.3; skew-y: 1.3; }
        frame 8 { x: -10000; y: -10000; skew-x: 0.8; skew-y: 0.8; }
        frame 9 { x: 30.8; skew-x: 0.3; skew-y: 0.3; }
        frame 10 { x: -10000; skew-x: 0; skew-y: 0; }
        frame 11 { y: 54.9; skew-x: -10000; skew-y: -10000; }
        frame 12 { y: 55; }
        frame 13 { y: 55.2; }
        frame 14 { y: 55.4; }
        frame 15 { y: 55.5; }
        frame 16 { y: 55.6; }
        frame 17 { y: 55.5; }
        frame 18 { y: 55.4; }
        frame 19 { y: 55.3; }
        frame 20 { y: 55.1; }
        frame 21 { y: 55; }
        frame 22 { y: 54.9; }
        frame 23 { y: -10000; }
        frame 24 { y: 55.1; }
        frame 25 { y: 55.4; }
        frame 26 { y: 55.6; }
        frame 27 { y: 55.5; }
        frame 28 { y: 55.4; }
        frame 29 { y: 55.3; }
        frame 30 { y: 55.1; }
        frame 31 { y: 55; }
        frame 32 { y: 54.9; }
        frame 33 { y: 55; }
        frame 34 { y: 55.2; }
        frame 35 { y: 55.4; }
        frame 36 { y: 55.5; }
        frame 37 { y: 55.6; }
        frame 38 { x: 29.2; y: 55.2; scale-x: 0.977; scale-y: 0.81; }
        frame 39 { x: 27.5; y: 54.7; scale-x: 1.153; scale-y: 0.821; }
        frame 40 { x: 28.4; y: 54.8; scale-x: 1.065; scale-y: 0.816; }
        frame 41 { x: 29.2; y: -10000; scale-x: 0.977; scale-y: 0.81; }
        frame 42 { x: 30; y: 54.9; scale-x: 0.888; scale-y: 0.805; }
        frame 43 { x: 30.8; y: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 44 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { y: 15.2; }
        frame 48 { y: -10000; }
    }
    Track {
        source-name: "PoolCleaner_whitewater1";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { x: 10.6; y: 64.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_POOLCLEANER_WHITEWATER1; }
        frame 12 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 13 { cel: -10000; }
        frame 14 { y: 64; cel: 0; }
        frame 15 { y: -10000; cel: -1; }
        frame 16 { cel: -10000; }
        frame 17 { y: 64.2; cel: 0; }
        frame 18 { y: -10000; cel: -1; }
        frame 19 { cel: -10000; }
        frame 20 { x: 9.8; y: 64.3; cel: 0; }
        frame 21 { x: -10000; y: -10000; cel: -1; }
        frame 22 { cel: -10000; }
        frame 23 { x: 10.6; y: 64.5; cel: 0; }
        frame 24 { x: -10000; y: -10000; cel: -1; }
        frame 25 { cel: -10000; }
        frame 26 { cel: 0; }
        frame 27 { cel: -1; }
        frame 28 { cel: -10000; }
        frame 29 { cel: 0; }
        frame 30 { cel: -1; }
        frame 31 { cel: -10000; }
        frame 32 { y: 64; cel: 0; }
        frame 33 { y: -10000; cel: -1; }
        frame 34 { cel: -10000; }
        frame 35 { y: 64.2; cel: 0; }
        frame 36 { y: -10000; cel: -1; }
        frame 37 { cel: -10000; }
        frame 38 { x: 8.1; y: 64.3; scale-x: 0.869; cel: 0; }
        frame 39 { x: -10000; y: -10000; scale-x: -10000; cel: -1; }
        frame 40 { cel: -10000; }
        frame 41 { x: 10.6; y: 64.5; scale-x: 0.8; cel: 0; }
        frame 42 { x: -10000; y: -10000; scale-x: -10000; cel: -1; }
        frame 43 { cel: -10000; }
        frame 44 { cel: 0; }
        frame 45 { cel: -1; }
        frame 46 { cel: -10000; }
    }
    Track {
        source-name: "PoolCleaner_whitewater2";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 12 { x: 7.5; y: 64.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_POOLCLEANER_WHITEWATER2; }
        frame 13 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 14 { cel: -10000; }
        frame 15 { x: 8; cel: 0; }
        frame 16 { x: -10000; cel: -1; }
        frame 17 { cel: -10000; }
        frame 18 { cel: 0; }
        frame 19 { cel: -1; }
        frame 20 { cel: -10000; }
        frame 21 { cel: 0; }
        frame 22 { cel: -1; }
        frame 23 { cel: -10000; }
        frame 24 { x: 7.5; cel: 0; }
        frame 25 { x: -10000; cel: -1; }
        frame 26 { cel: -10000; }
        frame 27 { cel: 0; }
        frame 28 { cel: -1; }
        frame 29 { cel: -10000; }
        frame 30 { cel: 0; }
        frame 31 { cel: -1; }
        frame 32 { cel: -10000; }
        frame 33 { x: 8; cel: 0; }
        frame 34 { x: -10000; cel: -1; }
        frame 35 { cel: -10000; }
        frame 36 { cel: 0; }
        frame 37 { cel: -1; }
        frame 38 { cel: -10000; }
        frame 39 { x: 7.1; y: 64.8; skew-x: 0.5; scale-x: 0.848; cel: 0; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; cel: -1; }
        frame 41 { cel: -10000; }
        frame 42 { x: 7.5; y: 64.1; skew-x: 0; scale-x: 0.8; cel: 0; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; cel: -1; }
        frame 44 { cel: -10000; }
        frame 45 { cel: 0; }
        frame 46 { cel: -1; }
        frame 47 { cel: -10000; }
    }
    Track {
        source-name: "PoolCleaner_whitewater3";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 7.9; y: 64; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_POOLCLEANER_WHITEWATER3; }
        frame 14 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 15 { cel: -10000; }
        frame 16 { y: 64.5; cel: 0; }
        frame 17 { y: -10000; cel: -1; }
        frame 18 { cel: -10000; }
        frame 19 { y: 64; cel: 0; }
        frame 20 { y: -10000; cel: -1; }
        frame 21 { cel: -10000; }
        frame 22 { cel: 0; }
        frame 23 { cel: -1; }
        frame 24 { cel: -10000; }
        frame 25 { cel: 0; }
        frame 26 { cel: -1; }
        frame 27 { cel: -10000; }
        frame 28 { cel: 0; }
        frame 29 { cel: -1; }
        frame 30 { cel: -10000; }
        frame 31 { cel: 0; }
        frame 32 { cel: -1; }
        frame 33 { cel: -10000; }
        frame 34 { y: 64.5; cel: 0; }
        frame 35 { y: -10000; cel: -1; }
        frame 36 { cel: -10000; }
        frame 37 { y: 64; cel: 0; }
        frame 38 { y: -10000; cel: -1; }
        frame 39 { cel: -10000; }
        frame 40 { x: 5.8; scale-x: 0.874; cel: 0; }
        frame 41 { x: -10000; scale-x: -10000; cel: -1; }
        frame 42 { cel: -10000; }
        frame 43 { x: 7.9; scale-x: 0.8; cel: 0; }
        frame 44 { x: -10000; scale-x: -10000; cel: -1; }
        frame 45 { cel: -10000; }
        frame 46 { cel: 0; }
        frame 47 { cel: -1; }
        frame 48 { cel: -10000; }
    }
    Track {
        source-name: "PoolCleaner_tube";
        frame-count: 70;
        frame 0 { x: 35.5; y: -4.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POOLCLEANER_TUBE; }
        frame 1 { x: 35.8; y: -3.4; skew-y: 0.3; scale-x: -10000; scale-y: 0.783; image: none; }
        frame 2 { x: 36.1; y: -2.8; skew-x: 0.2; skew-y: 0.8; scale-y: 0.767; }
        frame 3 { x: 36.9; y: -2.1; skew-x: 1.5; skew-y: 2.5; scale-y: 0.75; }
        frame 4 { x: 37.5; y: -1.3; skew-x: 3; skew-y: 4.3; scale-y: 0.734; }
        frame 5 { x: 38.1; y: -0.7; skew-x: 4.5; skew-y: 6.2; scale-y: 0.718; }
        frame 6 { x: 38; y: -1.4; skew-x: -10000; skew-y: 5.8; scale-x: 0.799; scale-y: 0.734; }
        frame 7 { x: -10000; y: -2.1; skew-x: 4.6; skew-y: 5.6; scale-x: 0.8; scale-y: 0.75; }
        frame 8 { x: 37; y: -2.9; skew-x: 3; skew-y: 3.6; scale-x: -10000; scale-y: 0.767; }
        frame 9 { x: 36.3; y: -3.6; skew-x: 1.5; skew-y: 1.8; scale-y: 0.783; }
        frame 10 { x: 35.5; y: -4.2; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 11 { x: -10000; y: 35.4; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 12 { y: 36.1; scale-y: 0.779; }
        frame 13 { x: 35.4; y: 36.8; skew-x: 0.2; skew-y: -0.1; scale-y: 0.759; }
        frame 14 { x: 36.3; y: 37.3; skew-x: 1.5; skew-y: 1.8; scale-y: 0.745; }
        frame 15 { x: 37.1; y: 37.9; skew-x: 3; skew-y: 4; scale-y: 0.731; }
        frame 16 { x: 38.1; y: 38.4; skew-x: 4.5; skew-y: 6.2; scale-y: 0.718; }
        frame 17 { x: 38.6; y: 37.4; skew-x: 4.8; skew-y: 7.3; scale-x: 0.799; scale-y: 0.738; }
        frame 18 { x: 39.2; y: 36.5; skew-x: 5.3; skew-y: 8.6; scale-x: 0.8; scale-y: 0.76; }
        frame 19 { x: 38.3; y: 36.2; skew-x: 4; skew-y: 6.3; scale-x: -10000; scale-y: 0.77; }
        frame 20 { x: 37.5; y: 36; skew-x: 2.5; skew-y: 4.3; scale-y: 0.78; }
        frame 21 { x: 36.5; y: 35.7; skew-x: 1.3; skew-y: 2; scale-y: 0.79; }
        frame 22 { x: 35.5; y: 35.4; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 23 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 24 { x: 55.4; y: 40.8; skew-x: 44.9; skew-y: 49.3; scale-x: 0.799; scale-y: 0.801; }
        frame 25 { x: 53.7; y: 40.6; skew-x: 42.1; skew-y: 46.5; scale-x: -10000; scale-y: 0.767; }
        frame 26 { x: 51.5; y: 39; skew-x: -10000; skew-y: 40.3; scale-x: 0.797; scale-y: 0.768; }
        frame 27 { x: 49; y: 37.5; skew-y: 34.1; scale-x: 0.799; scale-y: 0.772; }
        frame 28 { x: 47.4; y: 36.1; skew-y: 29.1; scale-x: 0.797; scale-y: 0.786; }
        frame 29 { x: 45.6; y: 34.7; skew-y: 24.4; scale-x: 0.799; scale-y: 0.802; }
        frame 30 { x: 48.5; y: 33.4; skew-y: 27.8; scale-x: 0.797; scale-y: 0.865; }
        frame 31 { x: 51.5; y: 32.1; skew-y: 31.4; scale-x: 0.799; scale-y: 0.93; }
        frame 32 { x: 48.7; y: 31.6; skew-x: 33.8; skew-y: 26.1; scale-x: 0.845; scale-y: 0.941; }
        frame 33 { x: 46; y: 31.3; skew-x: 25.7; skew-y: 21; scale-x: 0.893; scale-y: 0.954; }
        frame 34 { x: 44.4; y: 31; skew-x: 22.8; skew-y: 19; scale-x: 0.892; scale-y: 0.952; }
        frame 35 { x: 42.9; y: 30.8; skew-x: 20.2; skew-y: 17; scale-x: 0.893; scale-y: -10000; }
        frame 36 { x: 43; y: 29.3; skew-x: 20.1; skew-y: -10000; scale-x: 0.892; scale-y: 0.99; }
        frame 37 { y: 27.8; skew-x: 20.2; scale-x: 0.893; scale-y: 1.029; }
        frame 38 { x: 43.3; y: 30.1; skew-x: 20.1; scale-x: 0.834; scale-y: 0.975; }
        frame 39 { x: 43.5; y: 32.3; skew-x: 20.2; scale-x: 0.777; scale-y: 0.923; }
        frame 40 { x: 46.9; y: 34.1; skew-x: 26.3; skew-y: 25.1; scale-x: 0.781; scale-y: 0.892; }
        frame 41 { x: 50; y: 36.1; skew-x: 32.6; skew-y: 33.1; scale-x: 0.787; scale-y: 0.861; }
        frame 42 { x: 52.9; y: 38.4; skew-x: 38.6; skew-y: 41.1; scale-x: 0.792; scale-y: 0.83; }
        frame 43 { x: 55.4; y: 40.8; skew-x: 44.9; skew-y: 49.3; scale-x: 0.799; scale-y: 0.801; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 45.5; y: 36.9; skew-x: 22.3; skew-y: 24.6; scale-x: 0.798; scale-y: 0.8; }
        frame 46 { x: 35.5; y: 35.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: -10000; }
        frame 47 { x: -10000; y: -4.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 48 { x: 55; y: 0.1; skew-x: 44.9; skew-y: 49.3; scale-x: 0.799; scale-y: 0.801; }
        frame 49 { x: 53.4; y: -10000; skew-x: 42.1; skew-y: 46.5; scale-x: -10000; scale-y: 0.767; }
        frame 50 { x: 51.4; y: -1.4; skew-x: -10000; skew-y: 40.3; scale-x: 0.797; scale-y: 0.768; }
        frame 51 { x: 49.4; y: -2.9; skew-y: 34.1; scale-x: 0.799; scale-y: 0.772; }
        frame 52 { x: 47.9; y: -4.5; skew-y: 29.1; scale-x: 0.797; scale-y: 0.786; }
        frame 53 { x: 46.5; y: -6; skew-y: 24.4; scale-x: 0.799; scale-y: 0.802; }
        frame 54 { x: 48.9; y: -7; skew-y: 27.8; scale-x: 0.797; scale-y: 0.865; }
        frame 55 { x: 51.3; y: -8.1; skew-y: 31.4; scale-x: 0.799; scale-y: 0.93; }
        frame 56 { x: 48.5; y: -9.3; skew-x: 33.8; skew-y: 26.1; scale-x: 0.845; scale-y: 0.941; }
        frame 57 { x: 45.6; y: -10.3; skew-x: 25.7; skew-y: 21; scale-x: 0.893; scale-y: 0.954; }
        frame 58 { x: 44.5; y: -10.2; skew-x: 22.8; skew-y: 19; scale-x: 0.892; scale-y: 0.952; }
        frame 59 { x: 43.5; y: -10000; skew-x: 20.2; skew-y: 17; scale-x: 0.893; scale-y: -10000; }
        frame 60 { x: 42.9; y: -12.3; skew-x: 20.1; skew-y: -10000; scale-x: 0.892; scale-y: 0.99; }
        frame 61 { x: 42.4; y: -14.3; skew-x: 20.2; scale-x: 0.893; scale-y: 1.029; }
        frame 62 { x: 42.9; y: -11.9; skew-x: 20.1; scale-x: 0.834; scale-y: 0.975; }
        frame 63 { x: 43.5; y: -9.8; skew-x: 20.2; scale-x: 0.777; scale-y: 0.923; }
        frame 64 { x: 47.8; y: -6.7; skew-x: 28.3; skew-y: 27.8; scale-x: 0.783; scale-y: 0.881; }
        frame 65 { x: 51.8; y: -3.3; skew-x: 36.6; skew-y: 38.6; scale-x: 0.79; scale-y: 0.84; }
        frame 66 { x: 55; y: 0.3; skew-x: 44.9; skew-y: 49.3; scale-x: 0.799; scale-y: 0.801; }
        frame 67 { x: 55.4; y: 0.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 46.1; y: -3.5; skew-x: 22.3; skew-y: 24.6; scale-x: 0.798; scale-y: 0.8; }
        frame 69 { x: 35.5; y: -4.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: -10000; }
    }
    Track {
        source-name: "PoolCleaner_bubble";
        frame-count: 70;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 27 { x: 61.1; y: 39.9; skew-x: 84.8; skew-y: 84.8; scale-x: 0.5; scale-y: 0.564; cel: 0; image: IMAGE_REANIM_POOLCLEANER_BUBBLE; }
        frame 28 { x: 59.1; y: 34; skew-x: 83.5; skew-y: 83.5; scale-x: 0.972; scale-y: 0.639; cel: -10000; image: none; }
        frame 29 { x: 56.6; y: 28; skew-x: 82; skew-y: 82; scale-x: 1.445; scale-y: 0.713; }
        frame 30 { x: 50.6; y: 29.6; skew-x: 63.7; skew-y: 60.6; scale-x: 1.338; scale-y: 0.83; }
        frame 31 { x: 44; y: 32; skew-x: 45.3; skew-y: 39.1; scale-x: 1.235; scale-y: 0.948; }
        frame 32 { x: 40.3; y: 35; skew-x: 37.1; skew-y: 29.8; scale-x: 1.092; scale-y: 0.92; }
        frame 33 { x: 37; y: 38.2; skew-x: 28.9; skew-y: 20.7; scale-x: 0.954; scale-y: 0.894; }
        frame 34 { x: 32.9; y: 40.9; skew-x: 25.8; skew-y: 17.5; scale-x: 1.156; scale-y: 0.766; }
        frame 35 { x: 28.6; y: 43.5; skew-x: 22.7; skew-y: 14.5; scale-x: 1.361; scale-y: 0.639; }
        frame 36 { x: 31.7; y: 45.6; skew-x: 22.6; skew-y: 14.3; scale-x: 1.071; scale-y: 0.614; }
        frame 37 { x: 34.6; y: 47.5; skew-x: 22.7; skew-y: 14.5; scale-x: 0.784; scale-y: 0.59; }
        frame 38 { x: 36.5; y: 50; skew-x: 28.1; skew-y: 19.8; scale-x: 0.613; scale-y: 0.483; }
        frame 39 { x: 37.9; y: 52.8; skew-x: 33.7; skew-y: 25.5; scale-x: 0.444; scale-y: 0.376; }
        frame 40 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 41 { cel: -10000; }
        frame 51 { x: 61.4; y: -0.5; skew-x: 84.8; skew-y: 84.8; scale-x: 0.5; scale-y: 0.564; cel: 0; }
        frame 52 { x: 59.6; y: -6.4; skew-x: 83.5; skew-y: 83.5; scale-x: 0.972; scale-y: 0.639; cel: -10000; }
        frame 53 { x: 57.5; y: -12.7; skew-x: 82; skew-y: 82; scale-x: 1.445; scale-y: 0.713; }
        frame 54 { x: 50.9; y: -10.8; skew-x: 63.7; skew-y: 60.6; scale-x: 1.338; scale-y: 0.83; }
        frame 55 { x: 43.8; y: -8.2; skew-x: 45.3; skew-y: 39.1; scale-x: 1.235; scale-y: 0.948; }
        frame 56 { x: 39.9; y: -5.9; skew-x: 37.1; skew-y: 29.8; scale-x: 1.092; scale-y: 0.92; }
        frame 57 { x: 36.7; y: -3.3; skew-x: 28.9; skew-y: 20.7; scale-x: 0.954; scale-y: 0.894; }
        frame 58 { x: 32.9; y: -0.5; skew-x: 25.8; skew-y: 17.5; scale-x: 1.156; scale-y: 0.766; }
        frame 59 { x: 29.2; y: 2.5; skew-x: 22.7; skew-y: 14.5; scale-x: 1.361; scale-y: 0.639; }
        frame 60 { x: 31.5; y: 3.9; skew-x: 22.6; skew-y: 14.3; scale-x: 1.071; scale-y: 0.614; }
        frame 61 { x: 34; y: 5.3; skew-x: 22.7; skew-y: 14.5; scale-x: 0.784; scale-y: 0.59; }
        frame 62 { x: 36.1; y: 7.8; skew-x: 28.1; skew-y: 19.8; scale-x: 0.613; scale-y: 0.483; }
        frame 63 { x: 37.9; y: 10.5; skew-x: 33.7; skew-y: 25.5; scale-x: 0.444; scale-y: 0.376; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 65 { cel: -10000; }
    }
    Track {
        source-name: "PoolCleaner_funnel";
        frame-count: 70;
        frame 0 { x: 41.4; y: -21.2; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_POOLCLEANER_FUNNEL; }
        frame 1 { x: 40.8; y: -21; skew-x: -2.2; skew-y: -2.2; scale-x: 0.899; scale-y: 0.899; image: none; }
        frame 2 { x: 40; y: -20.7; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 43.3; y: -20.1; skew-x: 1.8; skew-y: 1.8; }
        frame 4 { x: 46.6; y: -19.3; skew-x: 8.5; skew-y: 8.5; scale-x: 0.898; scale-y: 0.898; }
        frame 5 { x: 50.4; y: -18.3; skew-x: 15.3; skew-y: 15.3; scale-x: 0.899; scale-y: 0.899; }
        frame 6 { x: 51; y: -18.2; skew-x: 16.6; skew-y: 16.6; scale-x: 0.898; scale-y: 0.898; }
        frame 7 { x: 51.6; y: -10000; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 48.1; y: -19.5; skew-x: 12; skew-y: 12; }
        frame 9 { x: 44.6; y: -20.5; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 0.899; }
        frame 10 { x: 41.4; y: -21.2; skew-x: 0; skew-y: 0; scale-x: 0.9; scale-y: 0.9; }
        frame 11 { x: -10000; y: 18.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 39.8; y: 19.2; skew-x: -3.4; skew-y: -3.4; scale-x: 0.899; scale-y: 0.899; }
        frame 13 { x: 38.1; y: 20; skew-x: -7.2; skew-y: -7.2; scale-x: 0.898; scale-y: 0.898; }
        frame 14 { x: 42; y: 19.7; skew-x: 0.3; skew-y: 0.3; scale-x: 0.899; scale-y: 0.899; }
        frame 15 { x: 45.9; y: -10000; skew-x: 7.8; skew-y: 7.8; scale-x: 0.898; scale-y: 0.898; }
        frame 16 { x: 50.4; y: 20.1; skew-x: 15.3; skew-y: 15.3; scale-x: 0.899; scale-y: 0.899; }
        frame 17 { x: 51.8; y: 20.2; skew-x: 18.3; skew-y: 18.3; scale-x: 0.898; scale-y: 0.898; }
        frame 18 { x: 53.4; y: 20.1; skew-x: 21.6; skew-y: 21.6; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 50.2; y: 19.4; skew-x: 16.1; skew-y: 16.1; }
        frame 20 { x: 47.1; y: 18.9; skew-x: 10.8; skew-y: 10.8; scale-x: 0.899; scale-y: 0.899; }
        frame 21 { x: 44.1; y: 18.6; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 41.4; y: 18.4; skew-x: 0; skew-y: 0; scale-x: 0.9; scale-y: 0.9; }
        frame 23 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 61.7; y: 27.2; skew-x: 13; skew-y: 13; scale-x: 0.897; scale-y: 0.897; }
        frame 25 { x: 60.5; y: 17.4; skew-x: 17.8; skew-y: 9.5; scale-x: 0.951; scale-y: 1.273; }
        frame 26 { x: 58.5; y: 18.9; skew-x: 16.3; skew-y: 10.3; scale-x: 0.942; scale-y: 1.163; }
        frame 27 { x: 56.8; y: 20.3; skew-x: 14.8; skew-y: 11.5; scale-x: 0.936; scale-y: 1.054; }
        frame 28 { x: 56.5; y: 19.2; skew-x: -10000; skew-y: -10000; scale-x: 0.935; scale-y: 1.053; }
        frame 29 { x: 56.2; y: 18.1; skew-x: 15.1; skew-y: 11.8; scale-x: -10000; scale-y: 1.054; }
        frame 30 { x: 54; y: 18.5; skew-x: 7.8; skew-y: 6; scale-x: 0.915; scale-y: 0.974; }
        frame 31 { x: 52.6; y: 19; skew-x: 0.5; skew-y: 0.5; scale-x: 0.896; scale-y: 0.896; }
        frame 32 { x: 50.8; y: 18.4; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 48.9; y: 17.8; skew-x: -5.4; skew-y: -5.4; }
        frame 34 { x: 45.6; y: 17.9; skew-x: -10.7; skew-y: -10.7; scale-x: 0.895; scale-y: 0.895; }
        frame 35 { x: 42.5; y: 18.1; skew-x: -16; skew-y: -16; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 37.8; y: 18.7; skew-x: -24.7; skew-y: -24.7; scale-x: 0.894; scale-y: 0.894; }
        frame 37 { x: 33.6; y: 19.7; skew-x: -33.8; skew-y: -33.8; scale-x: 0.895; scale-y: 0.895; }
        frame 38 { x: 37; y: 19.6; skew-x: -26.7; skew-y: -26.7; scale-x: 0.893; scale-y: 0.893; }
        frame 39 { x: 40.6; y: 19.5; skew-x: -19.5; skew-y: -19.5; scale-x: 0.894; scale-y: 0.894; }
        frame 40 { x: 45.4; y: 20.9; skew-x: -11.2; skew-y: -11.2; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 50.4; y: 22.7; skew-x: -3.2; skew-y: -3.2; scale-x: 0.895; scale-y: 0.895; }
        frame 42 { x: 55.8; y: 24.7; skew-x: 4.8; skew-y: 4.8; scale-x: 0.896; scale-y: 0.896; }
        frame 43 { x: 61.7; y: 27.2; skew-x: 13; skew-y: 13; scale-x: 0.897; scale-y: 0.897; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 51.5; y: 22.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.898; scale-y: 0.898; }
        frame 46 { x: 41.4; y: 18.4; skew-x: 0; skew-y: 0; scale-x: 0.9; scale-y: 0.9; }
        frame 47 { x: -10000; y: -21.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 61.4; y: -13.4; skew-x: 13; skew-y: 13; scale-x: 0.897; scale-y: 0.897; }
        frame 49 { x: 60.1; y: -23; skew-x: 17.8; skew-y: 9.5; scale-x: 0.951; scale-y: 1.273; }
        frame 50 { x: 58.5; y: -21.5; skew-x: 16.3; skew-y: 10.3; scale-x: 0.942; scale-y: 1.163; }
        frame 51 { x: 57; y: -20.1; skew-x: 14.8; skew-y: 11.5; scale-x: 0.936; scale-y: 1.054; }
        frame 52 { y: -21.3; skew-x: -10000; skew-y: -10000; scale-x: 0.935; scale-y: 1.053; }
        frame 53 { y: -22.6; skew-x: 15.1; skew-y: 11.8; scale-x: -10000; scale-y: 1.054; }
        frame 54 { x: 54.5; y: -22; skew-x: 7.8; skew-y: 6; scale-x: 0.915; scale-y: 0.974; }
        frame 55 { x: 52.4; y: -21.2; skew-x: 0.5; skew-y: 0.5; scale-x: 0.896; scale-y: 0.896; }
        frame 56 { x: 50.4; y: -22.4; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 48.5; y: -23.7; skew-x: -5.4; skew-y: -5.4; }
        frame 58 { x: 45.6; y: -23.3; skew-x: -10.7; skew-y: -10.7; scale-x: 0.895; scale-y: 0.895; }
        frame 59 { x: 43; y: -22.8; skew-x: -16; skew-y: -16; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 37.8; y: -10000; skew-x: -24.7; skew-y: -24.7; scale-x: 0.894; scale-y: 0.894; }
        frame 61 { x: 33; y: -22.3; skew-x: -33.8; skew-y: -33.8; scale-x: 0.895; scale-y: 0.895; }
        frame 62 { x: 36.8; y: -22.5; skew-x: -26.7; skew-y: -26.7; scale-x: 0.893; scale-y: 0.893; }
        frame 63 { x: 40.5; y: -22.6; skew-x: -19.5; skew-y: -19.5; scale-x: 0.894; scale-y: 0.894; }
        frame 64 { x: 46.8; y: -20; skew-x: -8.5; skew-y: -8.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 53.6; y: -16.8; skew-x: 2; skew-y: 2; scale-x: 0.896; scale-y: 0.896; }
        frame 66 { x: 61.3; y: -13.1; skew-x: 13; skew-y: 13; scale-x: 0.897; scale-y: 0.897; }
        frame 67 { x: 61.6; y: -12.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 52; y: -17.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.898; scale-y: 0.898; }
        frame 69 { x: 41.4; y: -21.2; skew-x: 0; skew-y: 0; scale-x: 0.9; scale-y: 0.9; }
    }
    Track {
        source-name: "PoolCleaner_funnel_overlay";
        frame-count: 70;
        frame 0 { x: 41.6; y: -21.2; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_POOLCLEANER_FUNNEL_OVERLAY; }
        frame 1 { x: 41; y: -21; skew-x: -2.2; skew-y: -2.2; scale-x: 0.899; scale-y: 0.899; image: none; }
        frame 2 { x: 40.4; y: -20.8; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 43.6; y: -20.2; skew-x: 1.8; skew-y: 1.8; }
        frame 4 { x: 47.1; y: -19.4; skew-x: 8.5; skew-y: 8.5; scale-x: 0.898; scale-y: 0.898; }
        frame 5 { x: 50.6; y: -18.3; skew-x: 15.3; skew-y: 15.3; scale-x: 0.899; scale-y: 0.899; }
        frame 6 { x: 51.3; y: -18.2; skew-x: 16.6; skew-y: 16.6; scale-x: 0.898; scale-y: 0.898; }
        frame 7 { x: 51.9; y: -18.4; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 48.4; y: -19.6; skew-x: 12; skew-y: 12; }
        frame 9 { x: 44.8; y: -20.7; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 0.899; }
        frame 10 { x: 41.6; y: -21.2; skew-x: 0; skew-y: 0; scale-x: 0.9; scale-y: 0.9; }
        frame 11 { x: -10000; y: 18.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 40; y: 19; skew-x: -3.4; skew-y: -3.4; scale-x: 0.899; scale-y: 0.899; }
        frame 13 { x: 38.5; y: 19.8; skew-x: -7.2; skew-y: -7.2; scale-x: 0.898; scale-y: 0.898; }
        frame 14 { x: 42.3; y: 19.6; skew-x: 0.3; skew-y: 0.3; scale-x: 0.899; scale-y: 0.899; }
        frame 15 { x: 46.4; y: 19.7; skew-x: 7.8; skew-y: 7.8; scale-x: 0.898; scale-y: 0.898; }
        frame 16 { x: 50.6; y: 20; skew-x: 15.3; skew-y: 15.3; scale-x: 0.899; scale-y: 0.899; }
        frame 17 { x: 52; y: 20.1; skew-x: 18.3; skew-y: 18.3; scale-x: 0.898; scale-y: 0.898; }
        frame 18 { x: 53.5; y: 20; skew-x: 21.6; skew-y: 21.6; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 50.4; y: 19.3; skew-x: 16.1; skew-y: 16.1; }
        frame 20 { x: 47.4; y: 18.8; skew-x: 10.8; skew-y: 10.8; scale-x: 0.899; scale-y: 0.899; }
        frame 21 { x: 44.4; y: 18.5; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 41.6; y: 18.4; skew-x: 0; skew-y: 0; scale-x: 0.9; scale-y: 0.9; }
        frame 23 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 62; y: 27.2; skew-x: 13; skew-y: 13; scale-x: 0.897; scale-y: 0.897; }
        frame 25 { x: 60.9; y: 17.4; skew-x: 17.8; skew-y: 9.5; scale-x: 0.951; scale-y: 1.273; }
        frame 26 { x: 58.9; y: 18.8; skew-x: 16.3; skew-y: 10.3; scale-x: 0.942; scale-y: 1.163; }
        frame 27 { x: 57.1; y: 20.3; skew-x: 14.8; skew-y: 11.5; scale-x: 0.936; scale-y: 1.054; }
        frame 28 { x: 56.8; y: 19.2; skew-x: -10000; skew-y: -10000; scale-x: 0.935; scale-y: 1.053; }
        frame 29 { x: 56.5; y: 18.1; skew-x: 15.1; skew-y: 11.8; scale-x: -10000; scale-y: 1.054; }
        frame 30 { x: 54.5; y: 18.5; skew-x: 7.8; skew-y: 6; scale-x: 0.915; scale-y: 0.974; }
        frame 31 { x: 52.9; y: 18.9; skew-x: 0.5; skew-y: 0.5; scale-x: 0.896; scale-y: 0.896; }
        frame 32 { x: 51; y: 18.2; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 49.1; y: 17.7; skew-x: -5.4; skew-y: -5.4; }
        frame 34 { x: 45.9; y: 17.8; skew-x: -10.7; skew-y: -10.7; scale-x: 0.895; scale-y: 0.895; }
        frame 35 { x: 42.8; y: 17.9; skew-x: -16; skew-y: -16; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 38.1; y: 18.5; skew-x: -24.7; skew-y: -24.7; scale-x: 0.894; scale-y: 0.894; }
        frame 37 { x: 33.9; y: 19.4; skew-x: -33.8; skew-y: -33.8; scale-x: 0.895; scale-y: 0.895; }
        frame 38 { x: 37.3; y: 19.3; skew-x: -26.7; skew-y: -26.7; scale-x: 0.893; scale-y: 0.893; }
        frame 39 { x: 40.9; y: -10000; skew-x: -19.5; skew-y: -19.5; scale-x: 0.894; scale-y: 0.894; }
        frame 40 { x: 45.6; y: 20.7; skew-x: -11.2; skew-y: -11.2; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 50.8; y: 22.5; skew-x: -3.2; skew-y: -3.2; scale-x: 0.895; scale-y: 0.895; }
        frame 42 { x: 56.3; y: 24.6; skew-x: 4.8; skew-y: 4.8; scale-x: 0.896; scale-y: 0.896; }
        frame 43 { x: 62; y: 27.2; skew-x: 13; skew-y: 13; scale-x: 0.897; scale-y: 0.897; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 51.8; y: 22.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.898; scale-y: 0.898; }
        frame 46 { x: 41.6; y: 18.4; skew-x: 0; skew-y: 0; scale-x: 0.9; scale-y: 0.9; }
        frame 47 { x: -10000; y: -21.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 61.6; y: -13.4; skew-x: 13; skew-y: 13; scale-x: 0.897; scale-y: 0.897; }
        frame 49 { x: 60.5; y: -23; skew-x: 17.8; skew-y: 9.5; scale-x: 0.951; scale-y: 1.273; }
        frame 50 { x: 58.9; y: -21.5; skew-x: 16.3; skew-y: 10.3; scale-x: 0.942; scale-y: 1.163; }
        frame 51 { x: 57.4; y: -20.1; skew-x: 14.8; skew-y: 11.5; scale-x: 0.936; scale-y: 1.054; }
        frame 52 { x: -10000; y: -21.3; skew-x: -10000; skew-y: -10000; scale-x: 0.935; scale-y: 1.053; }
        frame 53 { y: -22.6; skew-x: 15.1; skew-y: 11.8; scale-x: -10000; scale-y: 1.054; }
        frame 54 { x: 54.8; y: -22; skew-x: 7.8; skew-y: 6; scale-x: 0.915; scale-y: 0.974; }
        frame 55 { x: 52.7; y: -21.3; skew-x: 0.5; skew-y: 0.5; scale-x: 0.896; scale-y: 0.896; }
        frame 56 { x: 50.8; y: -22.6; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 48.8; y: -23.9; skew-x: -5.4; skew-y: -5.4; }
        frame 58 { x: 46; y: -23.5; skew-x: -10.7; skew-y: -10.7; scale-x: 0.895; scale-y: 0.895; }
        frame 59 { x: 43.3; y: -23; skew-x: -16; skew-y: -16; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 38; y: -10000; skew-x: -24.7; skew-y: -24.7; scale-x: 0.894; scale-y: 0.894; }
        frame 61 { x: 33.2; y: -22.6; skew-x: -33.8; skew-y: -33.8; scale-x: 0.895; scale-y: 0.895; }
        frame 62 { x: 36.9; y: -22.8; skew-x: -26.7; skew-y: -26.7; scale-x: 0.893; scale-y: 0.893; }
        frame 63 { x: 40.8; y: -10000; skew-x: -19.5; skew-y: -19.5; scale-x: 0.894; scale-y: 0.894; }
        frame 64 { x: 47.2; y: -20.2; skew-x: -8.5; skew-y: -8.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 54.1; y: -17; skew-x: 2; skew-y: 2; scale-x: 0.896; scale-y: 0.896; }
        frame 66 { x: 61.6; y: -13.1; skew-x: 13; skew-y: 13; scale-x: 0.897; scale-y: 0.897; }
        frame 67 { x: 62; y: -12.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 52.3; y: -17.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.898; scale-y: 0.898; }
        frame 69 { x: 41.6; y: -21.2; skew-x: 0; skew-y: 0; scale-x: 0.9; scale-y: 0.9; }
    }
    Track {
        source-name: "PoolCleaner_frontwheel1";
        frame-count: 70;
        frame 0 { x: 4.8; y: 51.8; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_POOLCLEANER_WHEEL; }
        frame 1 { x: 4.9; y: 51.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 5; y: 51.1; }
        frame 3 { y: 50.6; }
        frame 4 { x: 4.8; y: 50.1; }
        frame 5 { x: -10000; y: 49.5; }
        frame 6 { y: 50; }
        frame 7 { y: 50.5; }
        frame 8 { y: 50.9; }
        frame 9 { y: 51.4; }
        frame 10 { y: 51.8; }
        frame 11 { y: -10000; cel: -1; }
        frame 12 { cel: -10000; }
        frame 47 { cel: 0; }
        frame 48 { y: 51; cel: -10000; }
        frame 49 { y: 50.3; }
        frame 50 { y: 49.5; }
        frame 51 { y: 50; }
        frame 52 { y: 50.5; }
        frame 53 { y: 50.9; }
        frame 54 { y: 51.4; }
        frame 55 { y: 51.8; }
        frame 56 { y: 51.4; }
        frame 57 { y: 50.9; }
        frame 58 { y: 50.5; }
        frame 59 { y: 50; }
        frame 60 { y: 49.5; }
        frame 61 { y: 50; }
        frame 62 { y: 50.5; }
        frame 63 { y: 50.9; }
        frame 64 { y: 51.4; }
        frame 65 { y: 51.8; }
        frame 66 { y: 51.3; }
        frame 67 { y: 50.7; }
        frame 68 { y: 50.1; }
        frame 69 { y: 49.5; }
    }
    Track {
        source-name: "PoolCleaner_frontwheel1";
        frame-count: 70;
        frame 0 { x: 33; y: 50; scale-x: 0.72; scale-y: 0.72; image: IMAGE_REANIM_POOLCLEANER_WHEEL; }
        frame 1 { x: -10000; y: 50.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 50.8; }
        frame 3 { y: 51.1; }
        frame 4 { y: 51.5; }
        frame 5 { y: 52; }
        frame 6 { y: 51.5; }
        frame 7 { y: 51.1; }
        frame 8 { y: 50.8; }
        frame 9 { y: 50.4; }
        frame 10 { y: 50; }
        frame 11 { y: -10000; cel: -1; }
        frame 12 { cel: -10000; }
        frame 47 { cel: 0; }
        frame 48 { y: 50.6; cel: -10000; }
        frame 49 { y: 51.3; }
        frame 50 { y: 52; }
        frame 51 { y: 51.5; }
        frame 52 { y: 51.1; }
        frame 53 { y: 50.8; }
        frame 54 { y: 50.4; }
        frame 55 { y: 50; }
        frame 56 { y: 50.4; }
        frame 57 { y: 50.8; }
        frame 58 { y: 51.1; }
        frame 59 { y: 51.5; }
        frame 60 { y: 52; }
        frame 61 { y: 51.5; }
        frame 62 { y: 51.1; }
        frame 63 { y: 50.8; }
        frame 64 { y: 50.4; }
        frame 65 { y: 50; }
        frame 66 { y: 50.5; }
        frame 67 { y: 51; }
        frame 68 { y: 51.5; }
        frame 69 { y: 52; }
    }
}
