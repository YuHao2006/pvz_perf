export component Zombie_dancer {
    fps: 12;
    Track {
        source-name: "anim_walk";
        frame-count: 100;
        frame 21 { cel: -1; }
        frame 22 { cel: -10000; }
    }
    Track {
        source-name: "anim_armraise";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { cel: 0; }
        frame 22 { cel: -10000; }
        frame 32 { cel: -1; }
        frame 33 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 32 { cel: 0; }
        frame 33 { cel: -10000; }
        frame 65 { cel: -1; }
        frame 66 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 65 { cel: 0; }
        frame 66 { cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 100;
        frame 0 { x: -9.8; y: 40; }
        frame 1 { x: -7.4; y: -10000; }
        frame 2 { x: -4.9; }
        frame 3 { x: -2.5; }
        frame 4 { x: -0.1; }
        frame 5 { x: -10000; }
        frame 7 { y: 39.8; }
        frame 8 { y: 39.5; }
        frame 9 { y: 39.4; }
        frame 10 { y: 39.1; }
        frame 11 { x: 3.9; y: 39.4; }
        frame 12 { x: 8; y: 39.5; }
        frame 13 { x: 12.2; y: 39.8; }
        frame 14 { x: 16.3; y: 40; }
        frame 15 { x: -10000; y: -10000; }
        frame 20 { x: 18.8; }
        frame 21 { x: -10000; cel: -1; }
        frame 22 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_Jackson_innerarm_upper";
        frame-count: 100;
        frame 0 { x: 62.8; y: 43.6; skew-x: 135; skew-y: 135; scale-x: 0.736; scale-y: 1.359; image: IMAGE_REANIM_ZOMBIE_DANCER_INNERARM_UPPER; }
        frame 1 { x: 62.4; y: 41.6; skew-x: 135.1; skew-y: 135.1; scale-x: 0.735; scale-y: 1.356; image: none; }
        frame 2 { x: 62.1; y: 39.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 61.9; y: 37.6; }
        frame 4 { x: 61.8; y: 35.6; skew-x: 135; skew-y: 135; scale-x: 0.736; scale-y: 1.359; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 61.4; y: 37.8; skew-x: 137.2; skew-y: 137.2; scale-x: 0.735; scale-y: 1.356; }
        frame 8 { x: 61; y: 40; skew-x: 139.4; skew-y: 139.4; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 60.5; y: 42.1; skew-x: 141.6; skew-y: 141.6; }
        frame 10 { x: 60.3; y: 44.3; skew-x: 143.8; skew-y: 143.8; scale-x: 0.736; scale-y: 1.358; }
        frame 11 { x: 60.6; y: 42; skew-x: 141.6; skew-y: 141.6; scale-x: 0.735; scale-y: 1.356; }
        frame 12 { x: 61; y: 40; skew-x: 139.4; skew-y: 139.4; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 61.5; y: 37.7; skew-x: 137.2; skew-y: 137.2; }
        frame 14 { x: 61.8; y: 35.6; skew-x: 135; skew-y: 135; scale-x: 0.736; scale-y: 1.359; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 61.9; y: 37.6; skew-x: 135.1; skew-y: 135.1; scale-x: 0.735; scale-y: 1.356; }
        frame 18 { x: 62.1; y: 39.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 62.4; y: 41.6; }
        frame 20 { x: 62.8; y: 43.6; skew-x: 135; skew-y: 135; scale-x: 0.736; scale-y: 1.359; }
        frame 21 { x: 41.8; y: 33; skew-x: 21.6; skew-y: 21.6; scale-x: 0.795; scale-y: 1.037; }
        frame 22 { x: 49.4; y: 30.4; skew-x: 48.1; skew-y: 48.1; scale-x: 0.793; scale-y: 1.035; }
        frame 23 { x: 54.5; y: 31.6; skew-x: 74.7; skew-y: 74.7; scale-x: 0.794; scale-y: 1.036; }
        frame 24 { x: 52.1; y: 35.9; skew-x: 99.8; skew-y: 99.8; scale-x: -10000; scale-y: 1.037; }
        frame 25 { x: 49.5; y: 34.9; skew-x: 124.9; skew-y: 125; scale-x: 0.796; scale-y: 1.038; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { y: 34; skew-x: 90.3; skew-y: 90.3; scale-x: 0.795; }
        frame 30 { x: 38; y: 29.1; skew-x: 23.1; skew-y: 23.1; scale-x: 0.792; scale-y: 1.034; }
        frame 31 { x: 41.8; y: 33; skew-x: 21.6; skew-y: 21.6; scale-x: 0.795; scale-y: 1.037; }
        frame 32 { x: 30.3; y: 40; skew-x: 7.8; skew-y: 7.8; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 31.5; y: 38.8; skew-x: 8; skew-y: 8; scale-x: 0.798; scale-y: 0.798; }
        frame 34 { x: 32.6; y: 37.4; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 33.8; y: 36; skew-x: 8.8; skew-y: 8.8; }
        frame 36 { x: 35; y: 34.5; skew-x: 9.1; skew-y: 9.1; }
        frame 37 { x: 36.1; y: 33.2; skew-x: 9.5; skew-y: 9.5; }
        frame 38 { x: 37.3; y: 31.9; skew-x: 9.8; skew-y: 9.8; }
        frame 39 { x: 38.5; y: 30.5; skew-x: 10.3; skew-y: 10.3; scale-x: 0.799; scale-y: 0.799; }
        frame 40 { x: 34.9; y: 33.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 31.4; y: 36.1; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 27.8; y: 39; skew-x: 7.5; skew-y: 7.5; }
        frame 43 { x: 24.4; y: 41.9; skew-x: 6.7; skew-y: 6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 44 { x: 25.2; y: 43.8; skew-x: 6.6; skew-y: 6.6; scale-x: 0.798; scale-y: 0.798; }
        frame 45 { x: 26.2; y: 45.5; skew-x: 6.7; skew-y: 6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 46 { x: 27.9; y: 41.4; skew-x: 13.3; skew-y: 11.8; scale-x: 0.798; scale-y: 0.861; }
        frame 47 { x: 29.9; y: 37.5; skew-x: 19.8; skew-y: 17; scale-x: 0.799; scale-y: 0.924; }
        frame 48 { x: 32.3; y: 33.8; skew-x: 26.5; skew-y: 22.3; scale-x: 0.8; scale-y: 0.988; }
        frame 49 { x: 34.6; y: 32.6; skew-x: 29.1; skew-y: 23.5; scale-x: -10000; scale-y: 0.976; }
        frame 50 { x: 39; y: 30.9; skew-x: 43.6; skew-y: 37.1; scale-x: 0.801; scale-y: 0.962; }
        frame 51 { x: 42.9; y: 30.3; skew-x: 58.2; skew-y: 50.9; scale-x: 0.802; scale-y: 0.95; }
        frame 52 { x: 46; y: 30.5; skew-x: 72.7; skew-y: 64.7; scale-x: 0.805; scale-y: 0.939; }
        frame 53 { x: 50.5; y: 31.5; skew-x: 87.2; skew-y: 78.5; scale-x: 0.807; scale-y: 0.927; }
        frame 54 { x: 53.8; y: 32.8; skew-x: 101.6; skew-y: 92.1; scale-x: 0.809; scale-y: 0.917; }
        frame 55 { x: 48.5; y: 32.1; skew-x: 83; skew-y: 73.4; scale-x: -10000; scale-y: 0.916; }
        frame 56 { x: 41.5; y: 32.8; skew-x: 64.2; skew-y: 54.6; scale-x: 0.808; scale-y: 0.915; }
        frame 57 { x: 33.3; y: 35.3; skew-x: 45.4; skew-y: 35.8; scale-x: 0.807; scale-y: 0.914; }
        frame 58 { x: 24.6; y: 39.6; skew-x: 26.6; skew-y: 17.1; scale-x: 0.808; scale-y: 0.915; }
        frame 59 { x: 23.9; y: 41; skew-x: 23.3; skew-y: 13.8; scale-x: 0.807; scale-y: -10000; }
        frame 60 { x: 23.2; y: 42.3; skew-x: 20.3; skew-y: 10.8; scale-x: 0.808; }
        frame 61 { x: 24.9; y: 41.1; skew-x: 17.1; skew-y: 10; scale-x: 0.805; scale-y: 0.886; }
        frame 62 { x: 26.7; y: 40; skew-x: 14; skew-y: 9.3; scale-x: 0.803; scale-y: 0.856; }
        frame 63 { x: 28.5; y: 38.8; skew-x: 10.8; skew-y: 8.5; scale-x: 0.801; scale-y: 0.827; }
        frame 64 { x: 30.3; y: 37.6; skew-x: 7.8; skew-y: 7.8; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 32.8; y: 35.2; skew-x: 5.5; skew-y: 5.5; scale-x: 0.798; scale-y: 0.798; }
        frame 67 { x: 35.3; y: 32.9; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 37.8; y: 30.4; skew-x: 1.3; skew-y: 1.3; }
        frame 69 { x: 40.4; y: 28.1; skew-x: -0.8; skew-y: -0.8; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 72 { x: 38.4; y: 28.9; skew-x: -2.7; skew-y: -2.7; scale-x: 0.797; scale-y: 0.797; }
        frame 73 { x: 36.6; y: 29.8; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 34.6; y: 30.7; skew-x: -6.7; skew-y: -6.7; }
        frame 75 { x: 32.7; y: 31.5; skew-x: -8.7; skew-y: -8.7; }
        frame 76 { x: 31; y: 32.5; skew-x: -10.7; skew-y: -10.7; }
        frame 77 { x: 32.8; y: 31.6; skew-x: -8.7; skew-y: -8.7; }
        frame 78 { x: 34.6; y: 30.8; skew-x: -6.7; skew-y: -6.7; }
        frame 79 { x: 36.5; y: 29.8; skew-x: -4.7; skew-y: -4.7; }
        frame 80 { x: 38.5; y: 29; skew-x: -2.7; skew-y: -2.7; }
        frame 81 { x: 40.4; y: 28.1; skew-x: -0.8; skew-y: -0.8; scale-x: 0.798; scale-y: 0.798; }
        frame 82 { x: 42.4; y: 27.5; skew-x: 0.8; skew-y: 0.8; scale-x: 0.797; scale-y: 0.797; }
        frame 83 { x: 44.6; y: 26.9; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 46.8; y: 26.3; skew-x: 4.5; skew-y: 4.5; }
        frame 85 { x: 48.9; y: 25.8; skew-x: 6.3; skew-y: 6.3; }
        frame 86 { x: 51.3; y: 25.3; skew-x: 8.3; skew-y: 8.3; }
        frame 87 { x: 77.1; y: 34; skew-x: 32.1; skew-y: 32.1; scale-x: 0.795; scale-y: 0.795; }
        frame 88 { x: 102.5; y: 45.8; skew-x: 55.9; skew-y: 55.9; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 126.2; y: 59.9; skew-x: 79.7; skew-y: 79.7; }
        frame 90 { x: 147.6; y: 75.7; skew-x: 103.5; skew-y: 103.5; }
        frame 91 { x: 155.3; y: 85.7; skew-x: 114.1; skew-y: 114.1; scale-x: 0.794; scale-y: 0.794; }
        frame 92 { x: 162.4; y: 95.8; skew-x: 124.6; skew-y: 124.6; scale-x: 0.793; scale-y: 0.793; }
        frame 93 { x: 169.1; y: 105.8; skew-x: 135.2; skew-y: 135.2; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 171.3; y: 109.8; skew-x: 112.8; skew-y: 112.8; scale-x: 0.765; scale-y: 0.808; }
        frame 95 { x: 171.2; y: 113.6; skew-x: 90.7; skew-y: 90.5; scale-x: 0.738; scale-y: 0.824; }
        frame 96 { x: 171.6; y: 110.8; skew-x: 96.5; skew-y: 96.3; scale-x: 0.737; scale-y: -10000; }
        frame 97 { x: 171.7; y: 108; skew-x: 102.4; skew-y: 102.3; scale-x: -10000; }
        frame 98 { x: 171.3; y: 110.5; skew-x: 96.3; skew-y: 96.3; scale-x: 0.768; scale-y: 0.812; }
        frame 99 { x: 170.8; y: 113.1; skew-x: 90.6; skew-y: 90.5; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_Jackson_innerarm_lower";
        frame-count: 100;
        frame 0 { x: 47; y: 33.1; skew-x: 170.9; skew-y: 166.8; scale-x: 0.795; scale-y: 0.919; image: IMAGE_REANIM_ZOMBIE_DANCER_INNERARM_LOWER; }
        frame 1 { x: 46.7; y: 31.8; skew-x: 174.5; skew-y: 170.5; scale-x: 0.794; scale-y: 0.918; image: none; }
        frame 2 { x: 46.5; y: 30.5; skew-x: 178.2; skew-y: 174; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 46.2; y: 29; skew-x: 181.5; skew-y: 177.7; }
        frame 4 { x: 46.1; y: 27.5; skew-x: 185.2; skew-y: 181.1; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 7 { x: 46.5; y: 28.5; skew-x: 181.5; skew-y: 177.7; }
        frame 8 { x: 46.9; y: 29.5; skew-x: 178.2; skew-y: 174; }
        frame 9 { x: 47.1; y: 30.3; skew-x: 174.5; skew-y: 170.5; }
        frame 10 { x: 47.5; y: 31.2; skew-x: 170.9; skew-y: 166.8; scale-x: 0.795; scale-y: 0.919; }
        frame 11 { x: 47.1; y: 30.4; skew-x: 174.5; skew-y: 170.5; scale-x: 0.794; scale-y: 0.918; }
        frame 12 { x: 46.9; y: 29.5; skew-x: 178.2; skew-y: 174; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 46.4; y: 28.5; skew-x: 181.5; skew-y: 177.7; }
        frame 14 { x: 46.1; y: 27.5; skew-x: 185.2; skew-y: 181.1; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 17 { x: 46.3; y: 29; skew-x: 181.5; skew-y: 177.7; }
        frame 18 { x: 46.6; y: 30.5; skew-x: 178.2; skew-y: 174; }
        frame 19 { x: 46.8; y: 31.8; skew-x: 174.5; skew-y: 170.5; }
        frame 20 { x: 47; y: 33.1; skew-x: 170.9; skew-y: 166.8; scale-x: 0.795; scale-y: 0.919; }
        frame 21 { x: 34.6; y: 51.1; skew-x: 23.5; skew-y: 23.5; scale-x: 0.794; scale-y: 0.794; }
        frame 22 { x: 38.4; y: 44.5; skew-x: 67.2; skew-y: 67.2; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 39.7; y: -10000; skew-x: 110.8; skew-y: 110.8; scale-x: 0.796; scale-y: 0.796; }
        frame 24 { x: 38.8; y: 36.4; skew-x: 126.6; skew-y: 126.6; scale-x: 0.795; scale-y: 0.795; }
        frame 25 { x: 36.6; y: 28; skew-x: 142.4; skew-y: 142.4; scale-x: 0.797; scale-y: 0.797; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 35; y: 35.9; skew-x: 104.8; skew-y: 104.8; scale-x: 0.795; scale-y: 0.795; }
        frame 30 { x: 37.7; y: 44.9; skew-x: 67.2; skew-y: 67.2; scale-x: 0.794; scale-y: 0.794; }
        frame 31 { x: 34.6; y: 51.1; skew-x: 23.5; skew-y: 23.5; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 29.7; y: 52.4; skew-x: 7.8; skew-y: 7.8; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 30.8; y: 51; skew-x: 8; skew-y: 8; scale-x: 0.798; scale-y: 0.798; }
        frame 34 { x: 31.9; y: 49.7; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 33; y: 48.4; skew-x: 8.8; skew-y: 8.8; }
        frame 36 { x: 34; y: 47; skew-x: 9.1; skew-y: 9.1; }
        frame 37 { x: 35.1; y: 45.6; skew-x: 9.5; skew-y: 9.5; }
        frame 38 { x: 36.3; y: 44.3; skew-x: 9.8; skew-y: 9.8; }
        frame 39 { x: 37.4; y: 42.9; skew-x: 10.3; skew-y: 10.3; scale-x: 0.799; scale-y: 0.799; }
        frame 40 { x: 34; y: 45.7; skew-x: 9.3; skew-y: 9.3; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 30.7; y: 48.6; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 27.4; y: 51.5; skew-x: 7.5; skew-y: 7.5; }
        frame 43 { x: 24; y: 54.4; skew-x: 6.7; skew-y: 6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 44 { x: 24.8; y: 56.3; skew-x: 6.6; skew-y: 6.6; scale-x: 0.798; scale-y: 0.798; }
        frame 45 { x: 25.8; y: 58; skew-x: 6.7; skew-y: 6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 46 { x: 28; y: 53.5; skew-x: 28.3; skew-y: 28.3; scale-x: 0.797; scale-y: 0.861; }
        frame 47 { x: 31.3; y: 50.5; skew-x: 50.1; skew-y: 50.1; scale-x: -10000; scale-y: 0.927; }
        frame 48 { x: 34.8; y: 48; skew-x: 71.7; skew-y: 71.7; scale-y: 0.991; }
        frame 49 { x: 38.5; y: 48.1; skew-x: 93.3; skew-y: 93.3; scale-x: 0.798; scale-y: 1.057; }
        frame 50 { x: 40.5; y: 48.3; skew-x: 115; skew-y: 115; scale-x: 0.797; scale-y: 1.027; }
        frame 51 { x: 41; y: 45.5; skew-x: 123.9; skew-y: 125.8; scale-x: -10000; scale-y: 1.01; }
        frame 52 { x: 40.9; y: 42.6; skew-x: 132.8; skew-y: 136.7; scale-x: 0.8; scale-y: 0.996; }
        frame 53 { x: 42; y: 41.6; skew-x: 141.7; skew-y: 147.6; scale-x: 0.801; scale-y: 0.981; }
        frame 54 { x: 42.8; y: 39.9; skew-x: 150.5; skew-y: 158.5; scale-x: 0.805; scale-y: 0.969; }
        frame 55 { x: 41.3; y: 43.5; skew-x: 137.1; skew-y: 145.1; scale-x: 0.803; scale-y: 0.953; }
        frame 56 { x: 38.8; y: 46.7; skew-x: 123.6; skew-y: 131.6; scale-x: 0.802; scale-y: 0.938; }
        frame 57 { x: 35.4; y: 49.8; skew-x: 110.3; skew-y: 118.1; scale-x: 0.801; scale-y: 0.923; }
        frame 58 { x: 30.9; y: 52.9; skew-x: 96.9; skew-y: 104.8; scale-x: -10000; scale-y: 0.909; }
        frame 59 { x: 31; y: 53.9; skew-x: 92.3; skew-y: 100.3; scale-y: 1.033; }
        frame 60 { y: 54.7; skew-x: 88.1; skew-y: 96.1; scale-x: 0.8; scale-y: 1.159; }
        frame 61 { x: 32.8; y: 48.9; skew-x: 68.2; skew-y: 74.2; scale-x: 0.799; scale-y: 1.068; }
        frame 62 { x: 32.2; y: 46; skew-x: 47.9; skew-y: 51.9; scale-x: 0.798; scale-y: 0.977; }
        frame 63 { x: 30.7; y: 46.5; skew-x: 27.8; skew-y: 29.8; scale-x: -10000; scale-y: 0.888; }
        frame 64 { x: 29.7; y: 50.1; skew-x: 7.8; skew-y: 7.8; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 32.6; y: 47.7; skew-x: 5.5; skew-y: 5.5; scale-x: 0.798; scale-y: 0.798; }
        frame 67 { x: 35.7; y: 45.3; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 38.6; y: 42.8; skew-x: 1.3; skew-y: 1.3; }
        frame 69 { x: 41.7; y: 40.5; skew-x: -0.8; skew-y: -0.8; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 72 { x: 40.2; y: 41.4; skew-x: -2.7; skew-y: -2.7; scale-x: 0.797; scale-y: 0.797; }
        frame 73 { x: 38.8; y: 42; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 37.3; y: 42.8; skew-x: -6.7; skew-y: -6.7; }
        frame 75 { x: 35.8; y: 43.6; skew-x: -8.7; skew-y: -8.7; }
        frame 76 { x: 34.5; y: 44.5; skew-x: -10.7; skew-y: -10.7; }
        frame 77 { x: 35.9; y: 43.7; skew-x: -8.7; skew-y: -8.7; }
        frame 78 { x: 37.4; y: 42.8; skew-x: -6.7; skew-y: -6.7; }
        frame 79 { x: 38.8; y: 42.1; skew-x: -4.7; skew-y: -4.7; }
        frame 80 { x: 40.4; y: 41.3; skew-x: -2.7; skew-y: -2.7; }
        frame 81 { x: 41.7; y: 40.5; skew-x: -0.8; skew-y: -0.8; scale-x: 0.798; scale-y: 0.798; }
        frame 82 { x: 43.4; y: 39.9; skew-x: 0.8; skew-y: 0.8; scale-x: 0.797; scale-y: 0.797; }
        frame 83 { x: 45.1; y: 39.4; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 47; y: 38.8; skew-x: 4.5; skew-y: 4.5; }
        frame 85 { x: 48.7; y: 38.2; skew-x: 6.3; skew-y: 6.3; }
        frame 86 { x: 50.5; y: 37.7; skew-x: 8.3; skew-y: 8.3; }
        frame 87 { x: 73.5; y: 43; skew-x: 32.1; skew-y: 32.1; scale-x: 0.795; scale-y: 0.795; }
        frame 88 { x: 95.8; y: 51; skew-x: 55.9; skew-y: 55.9; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 116.8; y: 61.6; skew-x: 79.7; skew-y: 79.7; }
        frame 90 { x: 135.2; y: 73.8; skew-x: 103.5; skew-y: 103.5; }
        frame 91 { x: 143.9; y: 81.9; skew-x: 114.1; skew-y: 114.1; scale-x: 0.794; scale-y: 0.794; }
        frame 92 { x: 152; y: 89.9; skew-x: 124.6; skew-y: 124.6; scale-x: 0.793; scale-y: 0.793; }
        frame 93 { x: 159.6; y: 97.8; skew-x: 135.2; skew-y: 135.2; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 160.2; y: 106.3; skew-x: 112.8; skew-y: 112.8; scale-x: 0.765; scale-y: 0.808; }
        frame 95 { x: 158.5; y: 114.6; skew-x: 90.7; skew-y: 90.5; scale-x: 0.738; scale-y: 0.824; }
        frame 96 { x: 158.8; y: 110.5; skew-x: 96.5; skew-y: 96.3; scale-x: 0.737; scale-y: -10000; }
        frame 97 { x: 159; y: 106.3; skew-x: 102.4; skew-y: 102.3; scale-x: -10000; }
        frame 98 { x: 158.5; y: 110.2; skew-x: 96.3; skew-y: 96.3; scale-x: 0.768; scale-y: 0.812; }
        frame 99 { x: 158; y: 114.1; skew-x: 90.6; skew-y: 90.5; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_Jackson_innerarm_hand";
        frame-count: 100;
        frame 0 { x: 42.1; y: 7.6; skew-x: 120; skew-y: 120; scale-x: 0.791; scale-y: 0.791; image: IMAGE_REANIM_ZOMBIE_DANCER_INNERARM_HAND; }
        frame 1 { x: 43.5; y: 5.8; skew-x: 121.4; skew-y: 121.4; scale-x: 0.79; scale-y: 0.79; image: none; }
        frame 2 { x: 44.7; y: 4.2; skew-x: 122.8; skew-y: 122.8; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 45.9; y: 2.8; skew-x: 124.3; skew-y: 124.3; }
        frame 4 { x: 47.1; y: 1.2; skew-x: 125.8; skew-y: 125.8; scale-x: 0.791; scale-y: 0.791; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 46; y: 2.4; skew-x: 124.4; skew-y: 124.4; scale-x: 0.79; scale-y: 0.79; }
        frame 8 { x: 44.8; y: 3.4; skew-x: 123.1; skew-y: 123.1; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 43.6; y: 4.5; skew-x: 121.6; skew-y: 121.6; }
        frame 10 { x: 42.4; y: 5.6; skew-x: 120.3; skew-y: 120.3; scale-x: 0.791; scale-y: 0.791; }
        frame 11 { x: 43.6; y: 4.3; skew-x: 121.6; skew-y: 121.6; scale-x: 0.79; scale-y: 0.79; }
        frame 12 { x: 44.8; y: 3.4; skew-x: 123.1; skew-y: 123.1; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 46; y: 2.3; skew-x: 124.3; skew-y: 124.3; }
        frame 14 { x: 47.1; y: 1.2; skew-x: 125.8; skew-y: 125.8; scale-x: 0.791; scale-y: 0.791; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 45.9; y: 2.8; skew-x: 124.3; skew-y: 124.3; scale-x: 0.79; scale-y: 0.79; }
        frame 18 { x: 44.7; y: 4.3; skew-x: 122.8; skew-y: 122.8; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 43.4; y: 5.9; skew-x: 121.4; skew-y: 121.4; }
        frame 20 { x: 42.1; y: 7.6; skew-x: 120; skew-y: 120; scale-x: 0.791; scale-y: 0.791; }
        frame 21 { x: 24.3; y: 66; skew-x: 12.8; skew-y: 12.8; scale-x: 0.792; scale-y: 0.792; }
        frame 22 { x: 20.1; y: 47.2; skew-x: 48.7; skew-y: 48.7; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 22.2; y: 33.4; skew-x: 84.7; skew-y: 84.7; scale-x: 0.794; scale-y: 0.794; }
        frame 24 { x: 23.8; y: 21.9; skew-x: 95.5; skew-y: 95.5; scale-x: 0.793; scale-y: 0.793; }
        frame 25 { x: 24.8; y: 10.6; skew-x: 106.6; skew-y: 106.6; scale-x: 0.794; scale-y: 0.794; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 17.9; y: 28; skew-x: 77.7; skew-y: 77.7; scale-x: 0.792; scale-y: 0.792; }
        frame 30 { x: 19.6; y: 47.5; skew-x: 48.7; skew-y: 48.7; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 24.3; y: 66; skew-x: 12.8; skew-y: 12.8; }
        frame 32 { x: 24.6; y: 69; skew-x: 7.8; skew-y: 7.8; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 25.6; y: 67.5; skew-x: 8; skew-y: 8; scale-x: 0.798; scale-y: 0.798; }
        frame 34 { x: 26.5; y: 66.1; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 27.6; y: 64.8; skew-x: 8.8; skew-y: 8.8; }
        frame 36 { x: 28.6; y: 63.4; skew-x: 9.1; skew-y: 9.1; }
        frame 37 { x: 29.6; y: 62; skew-x: 9.5; skew-y: 9.5; }
        frame 38 { x: 30.6; y: 60.5; skew-x: 9.8; skew-y: 9.8; }
        frame 39 { x: 31.5; y: 59.3; skew-x: 10.3; skew-y: 10.3; scale-x: 0.799; scale-y: 0.799; }
        frame 40 { x: 28.4; y: 62.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 25.2; y: 65.2; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 22.2; y: 68.2; skew-x: 7.5; skew-y: 7.5; }
        frame 43 { x: 19.2; y: 71.1; skew-x: 6.7; skew-y: 6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 44 { x: 19.8; y: 73.3; skew-x: 6.6; skew-y: 6.6; scale-x: 0.798; scale-y: 0.798; }
        frame 45 { x: 20.6; y: 75.6; skew-x: 6.7; skew-y: 6.7; scale-x: 0.799; scale-y: 0.799; }
        frame 46 { x: 16.6; y: 69; skew-x: 33.1; skew-y: 33.1; scale-x: 0.796; scale-y: 0.796; }
        frame 47 { x: 13.8; y: 62.5; skew-x: 59.7; skew-y: 59.7; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 14.3; y: 53.8; skew-x: 86.2; skew-y: 86.2; }
        frame 49 { x: 18.5; y: 45.2; skew-x: 112.4; skew-y: 112.4; }
        frame 50 { x: 26.6; y: 40.7; skew-x: 143.9; skew-y: 143.9; scale-x: 0.795; scale-y: 0.795; }
        frame 51 { x: 29.1; y: 35.8; skew-x: 153.7; skew-y: 153.7; scale-x: 0.794; scale-y: 0.794; }
        frame 52 { x: 31.2; y: 30.8; skew-x: 163.5; skew-y: 163.5; scale-x: 0.795; scale-y: 0.795; }
        frame 53 { x: 34.7; y: 28.5; skew-x: 173.4; skew-y: 173.4; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 38.1; y: 25.6; skew-x: 183; skew-y: 183; scale-x: 0.797; scale-y: 0.797; }
        frame 55 { x: 34.3; y: 32.2; skew-x: 168.4; skew-y: 168.4; scale-x: 0.795; scale-y: 0.795; }
        frame 56 { x: 29.7; y: 38; skew-x: 153.5; skew-y: 153.5; scale-x: 0.793; scale-y: 0.793; }
        frame 57 { x: 24.4; y: 43; skew-x: 138.7; skew-y: 138.7; scale-x: 0.792; scale-y: 0.792; }
        frame 58 { x: 17.9; y: 47.8; skew-x: 123.9; skew-y: 123.9; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 16.3; y: 48.2; skew-x: 100.3; skew-y: 100.3; scale-x: 0.79; scale-y: 0.79; }
        frame 60 { x: 12.2; y: 49.4; skew-x: 77; skew-y: 77; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 16.1; y: 51.9; skew-x: 59.7; skew-y: 59.7; scale-x: 0.791; scale-y: 0.791; }
        frame 62 { x: 19.3; y: 55.5; skew-x: 42.4; skew-y: 42.4; scale-x: 0.793; scale-y: 0.793; }
        frame 63 { x: 22; y: 60.4; skew-x: 25.1; skew-y: 25.1; scale-x: 0.796; scale-y: 0.796; }
        frame 64 { x: 24.6; y: 66.7; skew-x: 7.8; skew-y: 7.8; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 28.2; y: 64.5; skew-x: 5.5; skew-y: 5.5; scale-x: 0.798; scale-y: 0.798; }
        frame 67 { x: 31.8; y: 62.1; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 35.4; y: 59.8; skew-x: 1.3; skew-y: 1.3; }
        frame 69 { x: 39.1; y: 57.5; skew-x: -0.8; skew-y: -0.8; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 72 { x: 38.3; y: 58.4; skew-x: -2.7; skew-y: -2.7; scale-x: 0.797; scale-y: 0.797; }
        frame 73 { x: 37.4; y: 59.1; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 36.5; y: 60.1; skew-x: -6.7; skew-y: -6.7; }
        frame 75 { x: 35.7; y: 61; skew-x: -8.7; skew-y: -8.7; }
        frame 76 { x: 34.9; y: 61.8; skew-x: -10.7; skew-y: -10.7; }
        frame 77 { x: 35.6; y: 61; skew-x: -8.7; skew-y: -8.7; }
        frame 78 { x: 36.5; y: 60; skew-x: -6.7; skew-y: -6.7; }
        frame 79 { x: 37.4; y: 59.2; skew-x: -4.7; skew-y: -4.7; }
        frame 80 { x: 38.3; y: 58.3; skew-x: -2.7; skew-y: -2.7; }
        frame 81 { x: 39.1; y: 57.5; skew-x: -0.8; skew-y: -0.8; scale-x: 0.798; scale-y: 0.798; }
        frame 82 { x: 40.3; y: 56.9; skew-x: 0.8; skew-y: 0.8; scale-x: 0.797; scale-y: 0.797; }
        frame 83 { x: 41.5; y: 56.1; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 42.8; y: 55.5; skew-x: 4.5; skew-y: 4.5; }
        frame 85 { x: 44; y: 54.8; skew-x: 6.3; skew-y: 6.3; }
        frame 86 { x: 45.3; y: 54.1; skew-x: 8.3; skew-y: 8.3; }
        frame 87 { x: 65.3; y: 53.6; skew-x: 32.1; skew-y: 32.1; scale-x: 0.795; scale-y: 0.795; }
        frame 88 { x: 85; y: 56; skew-x: 55.9; skew-y: 55.9; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 103.3; y: 60.7; skew-x: 79.7; skew-y: 79.7; }
        frame 90 { x: 119.5; y: 67.1; skew-x: 103.5; skew-y: 103.5; }
        frame 91 { x: 130.1; y: 72.7; skew-x: 114.1; skew-y: 114.1; scale-x: 0.794; scale-y: 0.794; }
        frame 92 { x: 140.2; y: 78.3; skew-x: 124.6; skew-y: 124.6; scale-x: 0.793; scale-y: 0.793; }
        frame 93 { x: 149.8; y: 83.9; skew-x: 135.2; skew-y: 135.2; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 146.5; y: 97.8; skew-x: 112.8; skew-y: 112.8; scale-x: 0.765; scale-y: 0.808; }
        frame 95 { x: 141; y: 111.8; skew-x: 90.7; skew-y: 90.5; scale-x: 0.738; scale-y: 0.824; }
        frame 96 { x: 141.9; y: 105.9; skew-x: 96.5; skew-y: 96.3; scale-x: 0.737; scale-y: -10000; }
        frame 97 { x: 142.5; y: 100.1; skew-x: 102.4; skew-y: 102.3; scale-x: -10000; }
        frame 98 { x: 141.6; y: 105.6; skew-x: 96.3; skew-y: 96.3; scale-x: 0.768; scale-y: 0.812; }
        frame 99 { x: 140.6; y: 111.3; skew-x: 90.6; skew-y: 90.5; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_Jackson_innerleg_lower";
        frame-count: 100;
        frame 0 { x: 45; y: 99.8; skew-x: 309.7; skew-y: 309.7; scale-x: 0.745; scale-y: 0.745; image: IMAGE_REANIM_ZOMBIE_DANCER_INNERLEG_LOWER; }
        frame 1 { x: 38.3; y: 97.8; skew-x: 304.8; skew-y: 304.8; scale-x: 0.744; scale-y: 0.744; image: none; }
        frame 2 { x: 31.7; y: 95.9; skew-x: 299.9; skew-y: 299.9; scale-x: 0.746; scale-y: 0.746; }
        frame 3 { x: 24.4; y: 91.1; skew-x: 307.5; skew-y: 307.5; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 17.3; y: 86.3; skew-x: 315; skew-y: 315; scale-x: 0.747; scale-y: 0.747; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 22; y: 85.5; skew-x: 326.3; skew-y: 326.3; }
        frame 8 { x: 27.1; y: 84.8; skew-x: 337.1; skew-y: 337.1; }
        frame 9 { x: 32.8; y: 84.5; skew-x: 348.2; skew-y: 348.2; }
        frame 10 { x: 39; y: 84.7; skew-x: 359.4; skew-y: 359.4; }
        frame 11 { x: 41.8; y: 89.7; skew-x: 342.1; skew-y: 342.1; scale-x: 0.746; scale-y: 0.746; }
        frame 12 { x: 45.6; y: 95.5; skew-x: 324.8; skew-y: 324.8; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 51.4; y: 97.1; skew-x: 318.7; skew-y: 319.9; scale-x: 0.75; scale-y: 0.76; }
        frame 14 { x: 57.4; y: 98.9; skew-x: 312.4; skew-y: 314.7; scale-x: 0.754; scale-y: 0.775; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 54.5; y: 99.3; skew-x: 311.1; skew-y: 313; scale-x: 0.751; scale-y: 0.769; }
        frame 18 { x: 51.5; y: 99.8; skew-x: 309.8; skew-y: 311.3; scale-x: 0.749; scale-y: 0.764; }
        frame 19 { x: 48.8; y: 100.2; skew-x: 308.4; skew-y: 309.6; scale-x: 0.748; scale-y: 0.759; }
        frame 20 { x: 45; y: 99.8; skew-x: 309.7; skew-y: 309.7; scale-x: 0.745; scale-y: 0.745; }
        frame 21 { x: 40; y: 92.1; skew-x: 340.5; skew-y: 334.8; scale-x: 0.726; scale-y: 0.679; }
        frame 22 { x: 30.6; y: 92.5; skew-x: 319.9; skew-y: 318.2; scale-x: 0.738; scale-y: 0.723; }
        frame 23 { x: 22.8; y: 92.4; skew-x: 299.3; skew-y: 301.2; scale-x: 0.751; scale-y: 0.769; }
        frame 24 { x: 16.6; y: 81.8; skew-x: 315.8; skew-y: 318.7; scale-x: 0.754; scale-y: 0.781; }
        frame 25 { x: 11.6; y: 71.6; skew-x: 332.1; skew-y: 335.9; scale-x: 0.759; scale-y: 0.794; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 16.2; y: 82.2; skew-x: 325.3; skew-y: 326.7; scale-x: 0.749; scale-y: 0.762; }
        frame 30 { x: 32.2; y: 93.8; skew-x: 318.3; skew-y: 317.2; scale-x: 0.74; scale-y: 0.73; }
        frame 31 { x: 40; y: 92.1; skew-x: 340.5; skew-y: 334.8; scale-x: 0.726; scale-y: 0.679; }
        frame 32 { x: 39.8; y: 86.7; skew-x: 353.4; skew-y: 353.4; scale-x: 0.748; scale-y: 0.748; }
        frame 33 { x: 39.4; y: 87; skew-x: 350; skew-y: 350.8; scale-x: 0.749; scale-y: 0.756; }
        frame 34 { x: 38.9; y: 87.2; skew-x: 346.6; skew-y: 348.1; scale-x: 0.752; scale-y: 0.766; }
        frame 35 { x: 38.4; y: 87.5; skew-x: 343.3; skew-y: 345.5; scale-x: 0.755; scale-y: 0.776; }
        frame 36 { x: 38; y: 87.7; skew-x: 340.1; skew-y: 343.1; scale-x: 0.758; scale-y: 0.786; }
        frame 37 { x: 37.5; y: 88; skew-x: 336.7; skew-y: 340.4; scale-x: 0.761; scale-y: 0.796; }
        frame 38 { x: 37.1; y: 88.3; skew-x: 333.4; skew-y: 337.8; scale-x: 0.764; scale-y: 0.805; }
        frame 39 { x: 36.6; y: 88.8; skew-x: 330.2; skew-y: 335.3; scale-x: 0.767; scale-y: 0.815; }
        frame 40 { x: 35.1; y: 90.1; skew-x: 326.4; skew-y: 330.6; scale-x: 0.763; scale-y: 0.803; }
        frame 41 { x: 33.8; y: 91.3; skew-x: 322.6; skew-y: 325.9; scale-x: 0.759; scale-y: 0.79; }
        frame 42 { x: 32.5; y: 92.3; skew-x: 318.8; skew-y: 321.2; scale-x: 0.755; scale-y: 0.777; }
        frame 43 { x: 31.3; y: 93.5; skew-x: 314.8; skew-y: 316.2; scale-x: 0.752; scale-y: 0.765; }
        frame 44 { x: 30.3; y: 95.2; skew-x: 312.3; skew-y: 313.7; scale-x: 0.751; scale-y: 0.764; }
        frame 45 { x: 29.3; y: 96.8; skew-x: 309.6; skew-y: 311; scale-x: 0.752; scale-y: 0.765; }
        frame 46 { x: 30.3; y: 95.8; skew-x: 312.8; skew-y: 314.2; scale-x: 0.751; scale-y: 0.764; }
        frame 47 { x: 31.2; y: 95; skew-x: 315.8; skew-y: 317.2; scale-x: 0.752; scale-y: -10000; }
        frame 48 { x: 32.3; y: 94.1; skew-x: 318.9; skew-y: 320.2; scale-x: -10000; }
        frame 49 { x: 33.3; y: 93.2; skew-x: 321.9; skew-y: 323.3; scale-y: 0.765; }
        frame 50 { x: 34.5; y: 92.3; skew-x: 325.1; skew-y: 326.5; scale-y: -10000; }
        frame 51 { x: 35.7; y: 91.5; skew-x: 328.1; skew-y: 329.5; scale-x: 0.753; }
        frame 52 { x: 36.9; y: 90.6; skew-x: 331.1; skew-y: 332.5; scale-x: -10000; }
        frame 53 { x: 38.1; y: 89.8; skew-x: 333.9; skew-y: 335.3; scale-y: 0.766; }
        frame 54 { x: 39.4; y: 89.1; skew-x: 337.2; skew-y: 338.6; scale-y: -10000; }
        frame 55 { x: 37.6; y: 89.8; skew-x: 332.7; skew-y: 334.1; }
        frame 56 { x: 35.9; y: 90.7; skew-x: 328.6; skew-y: 330; scale-y: 0.765; }
        frame 57 { x: 34.3; y: 91.5; skew-x: 324.3; skew-y: 325.7; scale-x: 0.752; scale-y: -10000; }
        frame 58 { x: 32.6; y: 92.3; skew-x: 319.9; skew-y: 321.3; scale-x: -10000; }
        frame 59 { x: 31; y: 94.2; skew-x: 314.8; skew-y: 316.2; scale-x: 0.751; scale-y: 0.764; }
        frame 60 { x: 29.6; y: 95.8; skew-x: 309.6; skew-y: 311; scale-x: 0.752; scale-y: 0.765; }
        frame 61 { x: 30.9; y: 94.5; skew-x: 315.3; skew-y: 316.3; scale-x: 0.75; scale-y: 0.76; }
        frame 62 { x: 32.5; y: 93.3; skew-x: 321; skew-y: 321.7; scale-x: -10000; scale-y: 0.756; }
        frame 63 { x: 34.1; y: 92; skew-x: 326.7; skew-y: 327; scale-x: 0.749; scale-y: 0.752; }
        frame 64 { x: 36; y: 91; skew-x: 332.3; skew-y: 332.3; scale-x: 0.748; scale-y: 0.748; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 38.3; y: 88.7; skew-x: 335.3; skew-y: 336.5; scale-x: 0.752; scale-y: 0.763; }
        frame 67 { x: 40.8; y: 86.6; skew-x: 338.4; skew-y: 340.7; scale-x: 0.756; scale-y: 0.777; }
        frame 68 { x: 43; y: 84.5; skew-x: 341.4; skew-y: 344.8; scale-x: 0.76; scale-y: 0.792; }
        frame 69 { x: 45.5; y: 82.4; skew-x: 344.6; skew-y: 349.1; scale-x: 0.764; scale-y: 0.807; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 45.3; y: 82.7; skew-x: 344.1; skew-y: 348.6; scale-y: 0.806; }
        frame 73 { x: 45.1; y: 82.8; skew-x: 343.8; skew-y: 348.3; scale-y: -10000; }
        frame 74 { x: 44.9; y: 83; skew-x: 343.3; skew-y: 347.8; }
        frame 75 { x: 44.8; y: 83.3; skew-x: 343.1; skew-y: 347.6; }
        frame 76 { x: 44.5; y: 83.5; skew-x: 342.8; skew-y: 347.3; scale-y: 0.807; }
        frame 77 { x: 44.8; y: 83.2; skew-x: 343.1; skew-y: 347.6; scale-y: 0.806; }
        frame 78 { x: 44.9; y: 83; skew-x: 343.3; skew-y: 347.8; scale-y: -10000; }
        frame 79 { x: 45.1; y: 82.8; skew-x: 343.8; skew-y: 348.3; }
        frame 80 { x: 45.3; y: 82.7; skew-x: 344.1; skew-y: 348.6; }
        frame 81 { x: 45.5; y: 82.4; skew-x: 344.6; skew-y: 349.1; scale-y: 0.807; }
        frame 82 { x: 46.2; y: 82.1; skew-x: 345.8; skew-y: 350.3; scale-y: 0.806; }
        frame 83 { x: 46.8; y: 81.8; skew-x: 347.3; skew-y: 351.8; scale-x: 0.763; scale-y: -10000; }
        frame 84 { x: 47.5; y: 81.5; skew-x: 348.8; skew-y: 353.3; scale-x: -10000; }
        frame 85 { x: 48.1; y: 81.3; skew-x: 350.1; skew-y: 354.6; }
        frame 86 { x: 48.8; y: 81; skew-x: 351.7; skew-y: 356.2; scale-x: 0.764; scale-y: 0.807; }
        frame 87 { x: 59.8; y: 81.3; skew-x: 365.4; skew-y: 369.9; scale-x: 0.762; scale-y: 0.805; }
        frame 88 { x: 71.2; y: 82.6; skew-x: 379.2; skew-y: 383.7; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 82.8; y: 84.8; skew-x: 392.9; skew-y: 397.4; }
        frame 90 { x: 94.3; y: 88; skew-x: 406.6; skew-y: 411.1; scale-x: 0.763; }
        frame 91 { x: 103.2; y: 91; skew-x: 420.3; skew-y: 424.8; scale-x: 0.762; }
        frame 92 { x: 111.7; y: 94.8; skew-x: 434.1; skew-y: 438.6; scale-x: 0.761; scale-y: 0.804; }
        frame 93 { x: 119.6; y: 99.4; skew-x: 448.1; skew-y: 452.6; scale-x: 0.762; scale-y: -10000; }
        frame 94 { x: 117.7; y: 103.4; skew-x: 440; skew-y: 445.6; scale-x: 0.737; scale-y: 0.819; }
        frame 95 { x: 115.6; y: 107.5; skew-x: 431.8; skew-y: 438.6; scale-x: 0.713; scale-y: 0.835; }
        frame 96 { x: 115.3; y: 105.6; skew-x: 436.6; skew-y: 443.4; scale-x: -10000; scale-y: 0.834; }
        frame 97 { x: 115; y: 103.7; skew-x: 441.6; skew-y: 448.4; scale-y: 0.835; }
        frame 98 { x: 116.2; y: 105.3; skew-x: 440.7; skew-y: 443.3; scale-x: 0.719; scale-y: 0.799; }
        frame 99 { x: 117.1; y: 106.9; skew-x: 440.1; skew-y: 438.1; scale-x: 0.728; scale-y: 0.766; }
    }
    Track {
        source-name: "Zombie_Jackson_innerleg_foot";
        frame-count: 100;
        frame 0 { x: 60.4; y: 112.6; skew-x: 334.1; skew-y: 334.1; scale-x: 0.75; scale-y: 0.797; image: IMAGE_REANIM_ZOMBIE_DANCER_INNERLEG_FOOT; }
        frame 1 { x: 53.7; y: 110.1; skew-x: 330.9; skew-y: 330.9; scale-x: -10000; scale-y: 0.796; image: none; }
        frame 2 { x: 46.9; y: 107.6; skew-x: 327.7; skew-y: 327.7; scale-y: -10000; }
        frame 3 { x: 40.1; y: 105.1; skew-x: 324.4; skew-y: 324.4; scale-y: 0.797; }
        frame 4 { x: 33.5; y: 102.7; skew-x: 321.1; skew-y: 321.1; scale-x: 0.751; scale-y: 0.798; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 34.3; y: 104.2; skew-x: 330.9; skew-y: 330.9; scale-y: 0.797; }
        frame 8 { x: 35.3; y: 105.8; skew-x: 340.7; skew-y: 340.7; scale-y: 0.798; }
        frame 9 { x: 36.4; y: 107.5; skew-x: 350.4; skew-y: 350.4; scale-x: 0.752; scale-y: 0.799; }
        frame 10 { x: 38; y: 109.2; skew-x: 360; skew-y: 360; scale-x: 0.753; scale-y: 0.8; }
        frame 11 { x: 46.6; y: 111.1; skew-x: 348.2; skew-y: 348.2; scale-x: 0.752; scale-y: 0.799; }
        frame 12 { x: 55.5; y: 113.1; skew-x: 336.2; skew-y: 336.2; scale-x: 0.751; scale-y: 0.798; }
        frame 13 { x: 64.8; y: 115.1; skew-x: 324.4; skew-y: 324.4; scale-x: 0.75; scale-y: 0.797; }
        frame 14 { x: 74.3; y: 117.3; skew-x: 312.5; skew-y: 312.5; scale-x: 0.751; scale-y: 0.798; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 71.3; y: 116.7; skew-x: 314.4; skew-y: 314.4; scale-y: 0.806; }
        frame 18 { x: 68.3; y: 116.1; skew-x: 316.1; skew-y: 316.1; scale-x: 0.752; scale-y: 0.816; }
        frame 19 { x: 65.3; y: 115.4; skew-x: 318; skew-y: 318; scale-x: 0.754; scale-y: 0.827; }
        frame 20 { x: 60.4; y: 112.6; skew-x: 334.1; skew-y: 334.1; scale-x: 0.75; scale-y: 0.797; }
        frame 21 { x: 52.1; y: 111.3; skew-x: 354.8; skew-y: 354.6; scale-x: 0.425; scale-y: 0.725; }
        frame 22 { x: 46.5; y: 106.3; skew-x: 348; skew-y: 348; scale-x: 0.587; scale-y: 0.761; }
        frame 23 { x: 41; y: 101.6; skew-x: 341.2; skew-y: 341.2; scale-x: 0.75; scale-y: 0.797; }
        frame 24 { x: 30.9; y: 97.5; skew-x: 341.7; skew-y: 341.7; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 20.7; y: 93.6; skew-x: 341.8; skew-y: 341.8; scale-x: 0.751; scale-y: 0.798; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 27.8; y: 101.2; skew-x: 345; skew-y: 345; scale-x: 0.697; scale-y: 0.776; }
        frame 30 { x: 44.8; y: 105.7; skew-x: 348; skew-y: 348; scale-x: 0.644; scale-y: 0.757; }
        frame 31 { x: 52.1; y: 111.3; skew-x: 354.8; skew-y: 354.6; scale-x: 0.425; scale-y: 0.725; }
        frame 32 { x: 39.5; y: 110; skew-x: 354.7; skew-y: 354.7; scale-x: 0.753; scale-y: 0.8; }
        frame 33 { x: 40.5; y: 109.9; skew-x: 353.5; skew-y: 353.5; scale-x: -10000; scale-y: 0.799; }
        frame 34 { x: 41.1; y: 110; skew-x: 352.2; skew-y: 352.2; scale-x: 0.752; scale-y: -10000; }
        frame 35 { x: 41.9; y: -10000; skew-x: 350.7; skew-y: 350.7; scale-x: -10000; }
        frame 36 { x: 42.7; y: 110; skew-x: 349.5; skew-y: 349.5; }
        frame 37 { x: 43.5; y: -10000; skew-x: 348.2; skew-y: 348.2; }
        frame 38 { x: 44.2; y: 109.9; skew-x: 346.9; skew-y: 346.9; }
        frame 39 { x: 45.1; y: 110; skew-x: 345.4; skew-y: 345.4; }
        frame 40 { x: -10000; y: 110.3; skew-x: 342; skew-y: 342; scale-y: 0.798; }
        frame 41 { x: 45; y: 110.5; skew-x: 338.7; skew-y: 338.7; scale-x: 0.751; scale-y: -10000; }
        frame 42 { x: -10000; y: 110.8; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; }
        frame 43 { x: 44.9; y: 111.1; skew-x: 331.6; skew-y: 331.6; scale-x: 0.752; scale-y: 0.799; }
        frame 44 { x: 45.3; y: 111.5; skew-x: 330.4; skew-y: 330.4; scale-x: 0.751; scale-y: 0.798; }
        frame 45 { x: 45.5; y: 111.8; skew-x: 329.1; skew-y: 329.1; scale-x: 0.752; scale-y: 0.799; }
        frame 46 { x: 45.4; y: 111.6; skew-x: 331.9; skew-y: 331.9; scale-x: 0.751; scale-y: 0.798; }
        frame 47 { x: -10000; y: 111.3; skew-x: 334.9; skew-y: 334.9; scale-x: -10000; scale-y: -10000; }
        frame 48 { y: 110.9; skew-x: 337.7; skew-y: 337.7; }
        frame 49 { y: 110.7; skew-x: 340.5; skew-y: 340.5; scale-x: 0.752; }
        frame 50 { y: 110.3; skew-x: 343.2; skew-y: 343.2; scale-x: -10000; scale-y: 0.799; }
        frame 51 { x: 45.5; y: 110.1; skew-x: 346.2; skew-y: 346.2; scale-y: -10000; }
        frame 52 { x: -10000; y: 109.8; skew-x: 349; skew-y: 349; }
        frame 53 { x: 45.6; y: 109.6; skew-x: 351.7; skew-y: 351.7; }
        frame 54 { x: 45.7; y: 109.3; skew-x: 354.5; skew-y: 354.5; scale-x: 0.753; scale-y: 0.8; }
        frame 55 { x: 45.5; y: 109.2; skew-x: 353.2; skew-y: 353.2; scale-x: -10000; scale-y: 0.799; }
        frame 56 { x: -10000; y: -10000; skew-x: 351.7; skew-y: 351.7; scale-x: 0.752; scale-y: -10000; }
        frame 57 { x: 45.4; y: 109.1; skew-x: 350.5; skew-y: 350.5; scale-x: -10000; }
        frame 58 { x: 45.3; y: 109.2; skew-x: 349; skew-y: 349; scale-x: 0.753; }
        frame 59 { x: 45; y: 109.1; skew-x: 345; skew-y: 345; scale-x: 0.752; }
        frame 60 { x: 44.8; y: 109.2; skew-x: 340.9; skew-y: 340.9; scale-x: -10000; }
        frame 61 { x: 44.5; y: 109.6; skew-x: 342.7; skew-y: 342.7; scale-y: 0.798; }
        frame 62 { x: 44.1; y: 109.8; skew-x: 344.5; skew-y: 344.5; scale-y: 0.799; }
        frame 63 { x: 43.8; y: 110.2; skew-x: 346.2; skew-y: 346.2; scale-y: -10000; }
        frame 64 { x: 43.4; y: 110.4; skew-x: 348; skew-y: 348; scale-x: 0.753; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 66 { x: 44.5; y: 110.2; skew-x: 346.2; skew-y: 346.2; scale-x: 0.752; scale-y: 0.798; }
        frame 67 { x: 45.6; y: 110; skew-x: 344.2; skew-y: 344.2; scale-x: 0.751; scale-y: -10000; }
        frame 68 { x: 46.7; y: 109.8; skew-x: 342.4; skew-y: 342.4; scale-x: 0.75; scale-y: 0.797; }
        frame 69 { x: 47.5; y: 109.5; skew-x: 340.4; skew-y: 340.4; scale-x: 0.751; scale-y: -10000; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 72 { x: 47.6; y: 109.8; skew-x: 340.2; skew-y: 340.2; scale-x: 0.75; }
        frame 73 { x: 47.5; y: 110; skew-x: 339.7; skew-y: 339.7; scale-x: -10000; }
        frame 74 { x: -10000; y: 110.1; skew-x: 339.4; skew-y: 339.4; scale-y: 0.796; }
        frame 75 { y: 110.3; skew-x: 339; skew-y: 339; scale-y: -10000; }
        frame 76 { y: 110.6; skew-x: 338.6; skew-y: 338.6; scale-x: 0.751; scale-y: 0.797; }
        frame 77 { y: 110.4; skew-x: 339; skew-y: 339; scale-x: 0.75; scale-y: 0.796; }
        frame 78 { x: 47.6; y: 110.1; skew-x: 339.4; skew-y: 339.4; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 47.5; y: 109.9; skew-x: 339.7; skew-y: 339.7; scale-y: 0.797; }
        frame 80 { x: 47.6; y: 109.7; skew-x: 340.2; skew-y: 340.2; scale-y: -10000; }
        frame 81 { x: 47.5; y: 109.5; skew-x: 340.4; skew-y: 340.4; scale-x: 0.751; }
        frame 82 { x: 47.4; y: 109.3; skew-x: 341.9; skew-y: 341.9; scale-x: 0.75; }
        frame 83 { x: 47; y: 109; skew-x: 343.2; skew-y: 343.2; scale-x: -10000; }
        frame 84 { x: 46.9; y: 108.7; skew-x: 344.7; skew-y: 344.7; }
        frame 85 { x: 46.6; y: 108.4; skew-x: 346.2; skew-y: 346.2; }
        frame 86 { x: 46.3; y: 108.1; skew-x: 347.5; skew-y: 347.5; }
        frame 87 { x: 51.2; y: 107; skew-x: 356.9; skew-y: 356.9; }
        frame 88 { x: 56.3; y: 105.8; skew-x: 366; skew-y: 366; }
        frame 89 { x: 61.5; y: 105; skew-x: 375.3; skew-y: 375.3; }
        frame 90 { x: 66.8; y: 104.3; skew-x: 384.8; skew-y: 384.8; scale-x: 0.751; }
        frame 91 { x: 73.4; y: 101.1; skew-x: 395.4; skew-y: 395.4; scale-x: 0.749; scale-y: 0.795; }
        frame 92 { x: 79.9; y: 98.2; skew-x: 406.1; skew-y: 406.1; scale-x: 0.748; scale-y: -10000; }
        frame 93 { x: 86.7; y: 95.6; skew-x: 416.8; skew-y: 416.8; scale-x: 0.749; }
        frame 94 { x: 84.3; y: 103.3; skew-x: 409.9; skew-y: 412.9; scale-x: 0.742; scale-y: 0.79; }
        frame 95 { x: 82; y: 111.1; skew-x: 402.8; skew-y: 409.1; scale-x: 0.738; scale-y: 0.787; }
        frame 96 { x: 82.3; y: 107.3; skew-x: 405.6; skew-y: 412.1; scale-x: 0.737; scale-y: 0.785; }
        frame 97 { x: -10000; y: 103.5; skew-x: 408.6; skew-y: 415; scale-x: 0.738; scale-y: 0.786; }
        frame 98 { x: 83.2; y: 106.5; skew-x: 403.9; skew-y: 410.2; scale-x: 0.766; scale-y: 0.79; }
        frame 99 { x: 84.1; y: 109.3; skew-x: 399.1; skew-y: 405.4; scale-x: 0.797; scale-y: 0.797; }
    }
    Track {
        source-name: "Zombie_Jackson_innerleg_upper";
        frame-count: 100;
        frame 0 { x: 38.6; y: 67.1; skew-x: 345; skew-y: 345; scale-x: 0.795; scale-y: 0.868; image: IMAGE_REANIM_ZOMBIE_DANCER_INNERLEG_UPPER; }
        frame 1 { x: 43; y: 62.4; skew-x: 366.8; skew-y: 366.8; scale-x: -10000; scale-y: 0.85; image: none; }
        frame 2 { x: 48.1; y: 60.1; skew-x: 388.8; skew-y: 388.8; scale-y: 0.831; }
        frame 3 { x: 52.8; y: -10000; skew-x: 410.6; skew-y: 410.6; scale-y: 0.813; }
        frame 4 { x: 56.4; y: 62.3; skew-x: 432.5; skew-y: 432.5; scale-x: 0.796; scale-y: 0.796; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 53.3; skew-x: 416.9; skew-y: 417.4; scale-y: 0.745; }
        frame 8 { x: 49.9; y: 63.5; skew-x: 401.1; skew-y: 402.3; scale-y: 0.695; }
        frame 9 { x: 46.6; y: 66.3; skew-x: 385.3; skew-y: 387.1; scale-x: 0.797; scale-y: 0.645; }
        frame 10 { x: 43.9; y: 70.4; skew-x: 369.5; skew-y: 372; scale-x: 0.798; scale-y: 0.595; }
        frame 11 { x: 45.9; y: 70.2; skew-x: 361.5; skew-y: 363.3; scale-x: 0.797; scale-y: 0.66; }
        frame 12 { x: 47.5; y: 70.3; skew-x: 353.7; skew-y: 355; scale-x: 0.796; scale-y: 0.726; }
        frame 13 { x: 49.1; y: 70.8; skew-x: 345.7; skew-y: 346.4; scale-x: 0.795; scale-y: 0.79; }
        frame 14 { x: 50.2; y: 71.3; skew-x: 337.7; skew-y: 337.7; scale-x: -10000; scale-y: 0.856; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 17 { x: 46; y: 70.7; skew-x: 336.4; skew-y: 336.4; scale-x: 0.793; scale-y: 0.871; }
        frame 18 { x: 41.8; y: 70; skew-x: 334.9; skew-y: 334.9; scale-x: -10000; scale-y: 0.887; }
        frame 19 { x: 37.5; y: 69.3; skew-x: 333.5; skew-y: 333.5; scale-x: 0.794; scale-y: 0.904; }
        frame 20 { x: 38.6; y: 67.1; skew-x: 345; skew-y: 345; scale-x: 0.795; scale-y: 0.868; }
        frame 21 { x: 48.9; y: 66.7; skew-x: 366.8; skew-y: 372.7; scale-x: -10000; scale-y: 0.799; }
        frame 22 { x: 51.5; y: 63.5; skew-x: 389.8; skew-y: 394.3; scale-x: 0.793; scale-y: 0.796; }
        frame 23 { x: 53.9; y: 62.8; skew-x: 413.1; skew-y: 416.1; scale-x: -10000; scale-y: 0.795; }
        frame 24 { x: 55.2; y: 64.3; skew-x: 436.2; skew-y: 437.7; scale-y: 0.794; }
        frame 25 { x: 54.5; y: 67.3; skew-x: 459.3; skew-y: 459.3; scale-y: 0.793; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 29 { y: 62.4; skew-x: 428.5; skew-y: 430.5; scale-y: 0.794; }
        frame 30 { x: 49.9; y: 62.2; skew-x: 387.1; skew-y: 391.1; scale-x: 0.792; scale-y: 0.795; }
        frame 31 { x: 48.9; y: 66.7; skew-x: 366.8; skew-y: 372.7; scale-x: 0.795; scale-y: 0.799; }
        frame 32 { x: 39.6; y: 62.5; skew-x: 355.2; skew-y: 355.2; scale-x: 0.799; scale-y: -10000; }
        frame 33 { x: 40.1; y: 62.2; skew-x: 356.7; skew-y: 356.7; scale-x: -10000; }
        frame 34 { x: 40.6; y: 62; skew-x: 358.2; skew-y: 358.2; }
        frame 35 { x: 41; y: 61.9; skew-x: 359.5; skew-y: 359.5; }
        frame 36 { x: 41.4; y: 61.8; skew-x: 360.8; skew-y: 360.8; scale-x: 0.8; scale-y: 0.8; }
        frame 37 { x: 41.9; y: 61.6; skew-x: 362.1; skew-y: 362.1; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 42.4; y: 61.5; skew-x: 363.5; skew-y: 363.5; }
        frame 39 { x: 42.8; y: 61.4; skew-x: 365.1; skew-y: 365.1; }
        frame 40 { x: 43.8; y: 61.2; skew-x: 369.3; skew-y: 369.3; scale-x: 0.799; scale-y: 0.799; }
        frame 41 { x: 44.6; y: 61; skew-x: 373.5; skew-y: 373.5; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 45.6; y: 61.1; skew-x: 377.8; skew-y: 377.8; scale-x: 0.798; scale-y: 0.798; }
        frame 43 { x: 46.6; y: 61.2; skew-x: 382.1; skew-y: 382.1; scale-x: 0.799; scale-y: 0.799; }
        frame 44 { x: 47.3; y: 61.7; skew-x: 384.8; skew-y: 384.8; scale-x: 0.798; scale-y: 0.798; }
        frame 45 { x: 48; y: 62.1; skew-x: 387.7; skew-y: 387.7; scale-x: 0.799; scale-y: 0.799; }
        frame 46 { x: 47.4; y: 61.5; skew-x: 385.1; skew-y: 385.1; scale-x: 0.798; scale-y: 0.798; }
        frame 47 { x: 46.8; y: 61.1; skew-x: 382.6; skew-y: 382.6; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 46.1; y: 60.5; skew-x: 380.1; skew-y: 380.1; }
        frame 49 { x: 45.4; y: 60; skew-x: 377.5; skew-y: 377.5; }
        frame 50 { x: 44.8; y: 59.6; skew-x: 375; skew-y: 375; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 44.1; y: 59.1; skew-x: 372.5; skew-y: 372.5; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 43.5; y: 58.8; skew-x: 370; skew-y: 370; }
        frame 53 { x: 43; y: 58.5; skew-x: 367.5; skew-y: 367.5; }
        frame 54 { x: 42.3; y: 58.1; skew-x: 365.1; skew-y: 365.1; scale-x: 0.8; scale-y: 0.8; }
        frame 55 { x: 43; y: 58.8; skew-x: 367.5; skew-y: 367.5; scale-x: 0.799; scale-y: 0.799; }
        frame 56 { x: 43.5; y: 59.6; skew-x: 370.1; skew-y: 370.1; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 44.3; y: 60.4; skew-x: 372.8; skew-y: 372.8; scale-x: 0.798; scale-y: 0.798; }
        frame 58 { x: 45; y: 61.3; skew-x: 375.4; skew-y: 375.4; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { x: 46.5; y: 61.7; skew-x: 381.5; skew-y: 381.5; scale-x: 0.798; scale-y: 0.798; }
        frame 60 { x: 48; y: 62.1; skew-x: 387.7; skew-y: 387.7; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: 46.6; y: 61.6; skew-x: 382; skew-y: 382; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: 45.1; y: 61.4; skew-x: 376.3; skew-y: 376.3; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: 43.7; y: 61.1; skew-x: 370.6; skew-y: 370.6; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 42.3; y: -10000; skew-x: 365.1; skew-y: 365.1; scale-x: 0.8; scale-y: 0.8; }
        frame 65 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 43.5; y: 60.2; skew-x: 363.8; skew-y: 363.8; }
        frame 67 { x: 44.9; y: 59.5; skew-x: 362.5; skew-y: 362.5; }
        frame 68 { x: 46.2; y: 58.5; skew-x: 361.3; skew-y: 361.3; }
        frame 69 { x: 47.6; y: 57.7; skew-x: 360; skew-y: 360; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 72 { x: 46.9; y: 58.1; skew-x: 359.2; skew-y: 359.2; scale-x: 0.799; scale-y: 0.799; }
        frame 73 { x: 45.9; y: 58.5; skew-x: 358.2; skew-y: 358.2; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 45; y: 59; skew-x: 357.2; skew-y: 357.2; }
        frame 75 { x: 44.3; y: 59.4; skew-x: 356.2; skew-y: 356.2; }
        frame 76 { x: 43.4; y: 59.9; skew-x: 355.2; skew-y: 355.2; }
        frame 77 { x: 44.3; y: 59.5; skew-x: 356.2; skew-y: 356.2; }
        frame 78 { x: 45; y: 58.9; skew-x: 357.2; skew-y: 357.2; }
        frame 79 { x: 46; y: 58.5; skew-x: 358.2; skew-y: 358.2; }
        frame 80 { x: 46.9; y: 58; skew-x: 359.2; skew-y: 359.2; }
        frame 81 { x: 47.6; y: 57.7; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 82 { x: 48.8; y: 57.5; skew-x: 361.3; skew-y: 361.3; scale-x: 0.799; scale-y: 0.799; }
        frame 83 { x: 50.1; y: 57.3; skew-x: 362.8; skew-y: 362.8; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 51.3; y: 57; skew-x: 364.1; skew-y: 364.1; }
        frame 85 { x: 52.5; y: 56.9; skew-x: 365.5; skew-y: 365.5; }
        frame 86 { x: 53.9; y: 56.6; skew-x: 367.1; skew-y: 367.1; }
        frame 87 { x: 71.3; y: 62.1; skew-x: 383.3; skew-y: 385.8; scale-x: 0.798; scale-y: 0.801; }
        frame 88 { x: 88.6; y: 69.1; skew-x: 399.6; skew-y: 404.6; scale-x: 0.797; scale-y: 0.804; }
        frame 89 { x: 105.3; y: 77.8; skew-x: 415.9; skew-y: 423.4; scale-x: -10000; scale-y: 0.807; }
        frame 90 { x: 120.7; y: 87.8; skew-x: 432; skew-y: 442.1; scale-x: 0.798; scale-y: 0.811; }
        frame 91 { x: 127.5; y: 93.1; skew-x: 441; skew-y: 447.7; scale-x: 0.797; scale-y: 0.806; }
        frame 92 { x: 134.3; y: 98.5; skew-x: 450; skew-y: 453; scale-x: -10000; scale-y: 0.801; }
        frame 93 { x: 140.9; y: 104.1; skew-x: 458.7; skew-y: 458.7; scale-y: 0.797; }
        frame 94 { x: 139.7; y: 106.2; skew-x: 453; skew-y: 453.3; scale-x: 0.769; scale-y: 0.812; }
        frame 95 { x: 138.5; y: 108.2; skew-x: 447.6; skew-y: 448.1; scale-x: 0.742; scale-y: 0.829; }
        frame 96 { x: 139; y: 107.7; skew-x: 450.5; skew-y: 451; scale-x: -10000; scale-y: 0.828; }
        frame 97 { x: 139.2; y: 107.3; skew-x: 453.4; skew-y: 453.9; scale-y: -10000; }
        frame 98 { x: 138.5; y: 106.5; skew-x: 449.5; skew-y: 450; scale-x: 0.771; scale-y: 0.814; }
        frame 99 { x: 137.5; y: 105.9; skew-x: 445.4; skew-y: 445.9; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_Jackson_body2";
        frame-count: 100;
        frame 0 { x: 48.2; y: 61.7; skew-x: 36.2; skew-y: 24.1; scale-x: 0.816; scale-y: 0.798; image: IMAGE_REANIM_ZOMBIE_DANCER_BODY2; }
        frame 1 { x: 49.1; y: 60.6; skew-x: 38.4; skew-y: 29.3; scale-x: 0.81; scale-y: 0.797; image: none; }
        frame 2 { x: 49.9; y: 59.6; skew-x: 40.6; skew-y: 34.6; scale-x: 0.806; scale-y: -10000; }
        frame 3 { x: 50.7; y: 58.8; skew-x: 42.6; skew-y: 39.6; scale-x: 0.801; }
        frame 4 { x: 51.4; y: 57.8; skew-x: 44.9; skew-y: 44.9; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 50.9; y: 59.1; skew-x: 40.6; skew-y: 40.6; scale-x: 0.796; scale-y: 0.796; }
        frame 8 { x: 50.4; y: 60.5; skew-x: 36.4; skew-y: 36.4; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 49.9; y: 62; skew-x: 32.1; skew-y: 32.1; }
        frame 10 { x: 49.5; y: 63.5; skew-x: 28; skew-y: 28; scale-x: 0.797; scale-y: 0.797; }
        frame 11 { x: 48.2; y: 62.9; skew-x: 22.1; skew-y: 17; scale-x: 0.777; scale-y: -10000; }
        frame 12 { x: 47; y: 62.1; skew-x: 16.5; skew-y: 6.1; scale-x: 0.758; scale-y: 0.798; }
        frame 13 { x: 46.4; y: 62.3; skew-x: 16.8; skew-y: 6; scale-x: 0.784; scale-y: 0.797; }
        frame 14 { x: 45.5; y: 62; skew-x: 17.3; skew-y: 6.3; scale-x: 0.812; scale-y: -10000; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 17 { x: 46.1; y: 61.9; skew-x: 22; skew-y: 10.8; }
        frame 18 { x: 46.8; y: 61.6; skew-x: 26.6; skew-y: 15.1; scale-x: 0.813; }
        frame 19 { x: 47.5; y: -10000; skew-x: 31.4; skew-y: 19.6; scale-x: 0.814; }
        frame 20 { x: 48.2; y: 61.7; skew-x: 36.2; skew-y: 24.1; scale-x: 0.816; scale-y: 0.798; }
        frame 21 { x: 44.8; y: 63.6; skew-x: 4.8; skew-y: 0.7; scale-x: 0.873; scale-y: 0.799; }
        frame 22 { x: 43.3; y: 62.6; skew-x: 8.6; skew-y: 4.8; scale-x: 0.888; scale-y: -10000; }
        frame 23 { x: 41.8; y: 61.5; skew-x: 12.6; skew-y: 8.8; scale-x: 0.904; }
        frame 24 { x: 42.4; y: 61.6; skew-x: 13.6; skew-y: 10.1; scale-x: 0.819; scale-y: 0.798; }
        frame 25 { x: 43.1; y: -10000; skew-x: 14.9; skew-y: 11.6; scale-x: 0.736; scale-y: 0.799; }
        frame 26 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 43.6; y: 62.1; skew-x: 11.5; skew-y: 7.8; scale-x: 0.781; }
        frame 30 { x: 44.3; y: 62.8; skew-x: 8.1; skew-y: 4.3; scale-x: 0.827; }
        frame 31 { x: 44.8; y: 63.6; skew-x: 4.8; skew-y: 0.7; scale-x: 0.873; }
        frame 32 { x: 46; y: 67.7; skew-x: 5.1; skew-y: 5.1; scale-x: 0.8; scale-y: 0.8; }
        frame 33 { x: -10000; y: 67.2; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 34 { y: 66.7; skew-x: -10000; skew-y: -10000; }
        frame 35 { y: 66.3; }
        frame 36 { y: 65.8; }
        frame 37 { y: 65.3; }
        frame 38 { y: 64.9; }
        frame 39 { y: 64.5; skew-x: 5.1; skew-y: 5.1; }
        frame 40 { x: 45.7; y: 65.3; skew-x: 4.3; skew-y: 4.3; }
        frame 41 { x: 45.4; y: 66; skew-x: 3.8; skew-y: 3.8; }
        frame 42 { x: 45; y: 66.8; skew-x: 3; skew-y: 3; }
        frame 43 { x: 44.6; y: 67.6; skew-x: 2.5; skew-y: 2.5; }
        frame 44 { x: 44.5; y: 68.6; skew-x: 1.8; skew-y: 1.8; }
        frame 45 { x: 44.1; y: 69.6; skew-x: 1.2; skew-y: 1.2; }
        frame 46 { x: 44.4; y: 69.2; skew-x: 1.5; skew-y: 1.5; }
        frame 47 { x: 44.5; y: 68.5; skew-x: 2; skew-y: 2; }
        frame 48 { x: 44.8; y: 68.1; skew-x: 2.3; skew-y: 2.3; }
        frame 49 { x: 44.9; y: 67.5; skew-x: 2.8; skew-y: 2.8; }
        frame 50 { x: 45.1; y: 66.9; skew-x: 3.3; skew-y: 3.3; }
        frame 51 { x: 45.4; y: 66.4; skew-x: 3.8; skew-y: 3.8; }
        frame 52 { x: 45.5; y: 65.8; skew-x: 4.1; skew-y: 4.1; }
        frame 53 { x: 45.8; y: 65.2; skew-x: 4.5; skew-y: 4.5; }
        frame 54 { x: 46; y: 64.5; skew-x: 5.1; skew-y: 5.1; }
        frame 55 { x: 45.6; y: 65.8; skew-x: 2.6; skew-y: 4.3; scale-x: 0.801; }
        frame 56 { x: 45.3; y: 67.2; skew-x: 0.3; skew-y: 3.8; scale-x: 0.802; }
        frame 57 { x: 45; y: 68.6; skew-x: -1.7; skew-y: 3; scale-x: 0.804; }
        frame 58 { x: 44.5; y: 69.9; skew-x: -4.1; skew-y: 2.5; scale-x: 0.805; }
        frame 59 { x: 44.3; y: 69.7; skew-x: -1.2; skew-y: 1.8; scale-x: 0.802; }
        frame 60 { x: 44.1; y: 69.6; skew-x: 1.2; skew-y: 1.2; scale-x: 0.8; }
        frame 61 { x: 44.6; y: 69.3; skew-x: 2; skew-y: 2; scale-x: -10000; }
        frame 62 { x: 45; y: 68.8; skew-x: 3; skew-y: 3; }
        frame 63 { x: 45.5; y: 68.4; skew-x: 4; skew-y: 4; }
        frame 64 { x: 46; y: 67.8; skew-x: 5.1; skew-y: 5.1; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 66 { x: 46.9; y: 65; skew-x: 5; skew-y: 5; }
        frame 67 { x: 47.7; y: 62.2; skew-x: -10000; skew-y: -10000; }
        frame 68 { x: 48.5; y: 59.5; }
        frame 69 { x: 49.4; y: 56.7; skew-x: 5.1; skew-y: 5.1; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 72 { x: 48.4; y: 57.1; skew-x: 4; skew-y: 4; }
        frame 73 { x: 47.5; y: 57.5; skew-x: 3; skew-y: 3; }
        frame 74 { x: 46.6; y: 58; skew-x: 2; skew-y: 2; scale-x: 0.799; scale-y: 0.799; }
        frame 75 { x: 45.7; y: 58.4; skew-x: 1; skew-y: 1; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: 44.9; y: 58.7; skew-x: 0.2; skew-y: 0.2; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 45.8; y: 58.3; skew-x: 1; skew-y: 1; }
        frame 78 { x: 46.7; y: 58; skew-x: 2; skew-y: 2; }
        frame 79 { x: 47.6; y: 57.5; skew-x: 3; skew-y: 3; }
        frame 80 { x: 48.5; y: 57.1; skew-x: 4; skew-y: 4; }
        frame 81 { x: 49.4; y: 56.7; skew-x: 5.1; skew-y: 5.1; }
        frame 82 { x: 50.5; y: 56.6; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 83 { x: 51.5; y: 56.5; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 52.8; y: 56.4; skew-x: 7.5; skew-y: 7.5; }
        frame 85 { x: 53.9; y: -10000; skew-x: 8.3; skew-y: 8.3; }
        frame 86 { x: 55.1; y: 56.3; skew-x: 9.1; skew-y: 9.1; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: 70.8; y: 62.6; skew-x: 26.1; skew-y: 26.1; scale-x: 0.798; scale-y: 0.798; }
        frame 88 { x: 87.2; y: 70; skew-x: 43.1; skew-y: 43.1; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 103.9; y: 78.4; skew-x: 60.2; skew-y: 60.2; }
        frame 90 { x: 120.5; y: 88.1; skew-x: 77.1; skew-y: 77.1; scale-x: 0.799; scale-y: 0.799; }
        frame 91 { x: 126.6; y: 93.7; skew-x: 84.7; skew-y: 84.7; scale-x: 0.798; scale-y: 0.798; }
        frame 92 { x: 132.7; y: 99.4; skew-x: 91.8; skew-y: 91.8; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 138.7; y: 105.3; skew-x: 99.4; skew-y: 99.4; scale-x: 0.797; scale-y: 0.797; }
        frame 94 { x: 137.6; y: 107.5; skew-x: 93.8; skew-y: 94; scale-x: 0.77; scale-y: 0.813; }
        frame 95 { x: 136.5; y: 109.7; skew-x: 88.4; skew-y: 88.8; scale-x: 0.742; scale-y: 0.829; }
        frame 96 { x: 136.9; y: 109; skew-x: 90.8; skew-y: 91; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 137.3; y: 108.3; skew-x: 93.2; skew-y: 93.5; }
        frame 98 { x: 136.8; y: 108.6; skew-x: 90.8; skew-y: 91.1; scale-x: 0.771; scale-y: 0.814; }
        frame 99 { x: 136.3; y: 108.8; skew-x: 88.5; skew-y: 88.9; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_Jackson_outerleg_foot";
        frame-count: 100;
        frame 0 { x: 31.8; y: 117.3; skew-x: 355.4; skew-y: 355.4; scale-x: 0.697; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DANCER_OUTERLEG_FOOT; }
        frame 1 { x: 37.4; y: 118.3; skew-x: 349.5; skew-y: 349.5; scale-x: 0.696; scale-y: 0.799; image: none; }
        frame 2 { x: 43.3; y: 119.6; skew-x: 343.4; skew-y: 343.4; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 49.3; y: 120.7; skew-x: 337.2; skew-y: 337.2; scale-y: 0.798; }
        frame 4 { x: 55.6; y: 122; skew-x: 331.1; skew-y: 331.1; scale-y: 0.799; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 7 { x: 55.4; y: 120.8; skew-x: 337.2; skew-y: 337.2; scale-y: 0.798; }
        frame 8 { x: 55.5; y: 119.7; skew-x: 343.4; skew-y: 343.4; scale-y: 0.799; }
        frame 9 { x: -10000; y: 118.5; skew-x: 349.5; skew-y: 349.5; scale-y: -10000; }
        frame 10 { x: 55.8; y: 117.3; skew-x: 355.4; skew-y: 355.4; scale-x: 0.697; scale-y: 0.8; }
        frame 11 { x: 50.5; y: 116.2; skew-x: 346.5; skew-y: 346.5; scale-x: 0.696; scale-y: 0.799; }
        frame 12 { x: 45.5; y: 115.2; skew-x: 337.4; skew-y: 337.4; scale-x: -10000; scale-y: 0.798; }
        frame 13 { x: 41.1; y: 114.2; skew-x: 328.4; skew-y: 328.4; scale-x: 0.695; scale-y: -10000; }
        frame 14 { x: 37.1; y: 113.1; skew-x: 319.3; skew-y: 319.3; scale-x: 0.696; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 17 { x: 35.1; y: 114.2; skew-x: 328.4; skew-y: 328.4; scale-x: 0.695; }
        frame 18 { x: 33.6; y: 115.2; skew-x: 337.4; skew-y: 337.4; scale-x: 0.696; }
        frame 19 { x: 32.5; y: 116.2; skew-x: 346.5; skew-y: 346.5; scale-x: -10000; scale-y: 0.799; }
        frame 20 { x: 31.8; y: 117.3; skew-x: 355.4; skew-y: 355.4; scale-x: 0.697; scale-y: 0.8; }
        frame 21 { x: 49.8; y: 118.4; skew-x: -10000; skew-y: -10000; scale-x: 0.444; scale-y: 0.781; }
        frame 22 { x: 44.9; y: 118.2; skew-x: 355.5; skew-y: 355.5; scale-x: 0.507; scale-y: 0.785; }
        frame 23 { x: 40; y: 117.8; skew-x: -10000; skew-y: -10000; scale-x: 0.57; scale-y: 0.79; }
        frame 24 { x: 35; y: 117.7; scale-x: 0.634; scale-y: 0.795; }
        frame 25 { x: 30.3; y: 117.3; skew-x: 355.4; skew-y: 355.4; scale-x: 0.697; scale-y: 0.8; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 38; y: 117.1; skew-x: 355.5; skew-y: 355.5; scale-x: 0.585; scale-y: 0.821; }
        frame 30 { x: 45.6; y: 116.7; skew-x: -10000; skew-y: -10000; scale-x: 0.472; scale-y: 0.843; }
        frame 31 { x: 49.8; y: 118.4; skew-x: 355.4; skew-y: 355.4; scale-x: 0.444; scale-y: 0.781; }
        frame 32 { x: 48.5; y: 116.4; skew-x: 360; skew-y: 360; scale-x: 0.697; scale-y: 0.8; }
        frame 33 { x: -10000; y: 116.5; skew-x: 359.7; skew-y: 359.7; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 48.4; y: -10000; skew-x: 359.2; skew-y: 359.2; }
        frame 35 { x: -10000; y: 116.6; skew-x: 359; skew-y: 359; }
        frame 36 { y: -10000; skew-x: 358.5; skew-y: 358.5; }
        frame 37 { x: 48.3; skew-x: 358.2; skew-y: 358.2; }
        frame 38 { x: -10000; y: 116.7; skew-x: 357.7; skew-y: 357.7; }
        frame 39 { y: 116.8; skew-x: 357.2; skew-y: 357.2; }
        frame 40 { x: 47.9; y: 117.8; skew-x: 352.2; skew-y: 352.2; scale-y: 0.799; }
        frame 41 { x: 47.7; y: 118.8; skew-x: 347.2; skew-y: 347.2; scale-x: 0.696; scale-y: -10000; }
        frame 42 { x: 47.6; y: 119.9; skew-x: 342; skew-y: 342; scale-x: -10000; scale-y: 0.798; }
        frame 43 { x: -10000; y: 120.9; skew-x: 336.9; skew-y: 336.9; scale-y: 0.799; }
        frame 44 { x: 48.3; y: 121.3; skew-x: 334.9; skew-y: 334.9; scale-x: 0.695; scale-y: 0.798; }
        frame 45 { x: 48.9; y: 121.6; skew-x: 332.9; skew-y: 332.9; scale-x: 0.696; scale-y: 0.799; }
        frame 46 { x: 48.6; y: 121; skew-x: 335.7; skew-y: 335.7; scale-x: 0.695; scale-y: 0.798; }
        frame 47 { x: 48.4; y: 120.3; skew-x: 338.4; skew-y: 338.4; scale-x: 0.696; scale-y: -10000; }
        frame 48 { x: 48.3; y: 119.9; skew-x: 341; skew-y: 341; scale-x: -10000; }
        frame 49 { x: 48.1; y: 119.3; skew-x: 343.7; skew-y: 343.7; scale-y: 0.799; }
        frame 50 { x: -10000; y: 118.7; skew-x: 346.5; skew-y: 346.5; scale-y: -10000; }
        frame 51 { x: 48; y: 118.2; skew-x: 349.2; skew-y: 349.2; }
        frame 52 { x: -10000; y: 117.7; skew-x: 351.9; skew-y: 351.9; scale-x: 0.697; }
        frame 53 { y: 117.2; skew-x: 354.7; skew-y: 354.7; scale-x: -10000; }
        frame 54 { x: 48.3; y: 116.8; skew-x: 357.2; skew-y: 357.2; scale-y: 0.8; }
        frame 55 { x: 48.1; y: 117.1; skew-x: 356; skew-y: 356; scale-y: -10000; }
        frame 56 { x: 48; y: 117.3; skew-x: 354.7; skew-y: 354.7; scale-y: 0.799; }
        frame 57 { y: 117.5; skew-x: 353.4; skew-y: 353.4; scale-y: -10000; }
        frame 58 { x: 47.8; y: 117.7; skew-x: 352; skew-y: 352; scale-y: 0.8; }
        frame 59 { x: 47.6; y: 118.4; skew-x: 348; skew-y: 348; scale-x: 0.696; scale-y: 0.799; }
        frame 60 { x: 47.4; y: 119.1; skew-x: 343.9; skew-y: 343.9; scale-x: 0.697; scale-y: -10000; }
        frame 61 { x: 47.5; y: 118.3; skew-x: 348; skew-y: 348; scale-x: 0.696; }
        frame 62 { x: 47.8; y: 117.7; skew-x: 352; skew-y: 352; scale-x: 0.697; }
        frame 63 { x: 48.1; y: 117; skew-x: 356; skew-y: 356; scale-x: -10000; scale-y: 0.8; }
        frame 64 { x: 48.5; y: 116.4; skew-x: 360; skew-y: 360; scale-y: -10000; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 66 { x: 47.9; y: 117.8; skew-x: 352; skew-y: 352; scale-x: 0.696; scale-y: 0.799; }
        frame 67 { x: 47.6; y: 119.1; skew-x: 343.7; skew-y: 343.7; scale-x: -10000; scale-y: 0.798; }
        frame 68 { x: -10000; y: 120.5; skew-x: 335.7; skew-y: 335.7; scale-x: 0.695; scale-y: 0.797; }
        frame 69 { x: 48; y: 122; skew-x: 327.4; skew-y: 327.4; scale-x: -10000; scale-y: 0.798; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 72 { y: 122.1; skew-x: 327.1; skew-y: 327.1; scale-x: 0.694; scale-y: 0.797; }
        frame 73 { x: 48.1; y: 122.4; skew-x: 326.7; skew-y: 326.7; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 48.2; y: 122.5; skew-x: 326.4; skew-y: 326.4; }
        frame 75 { x: 48.3; y: 122.8; skew-x: 325.9; skew-y: 325.9; scale-y: 0.796; }
        frame 76 { x: -10000; y: 123; skew-x: 325.6; skew-y: 325.6; scale-x: 0.695; scale-y: 0.798; }
        frame 77 { y: 122.8; skew-x: 325.9; skew-y: 325.9; scale-x: 0.694; scale-y: 0.796; }
        frame 78 { x: 48.2; y: 122.5; skew-x: 326.4; skew-y: 326.4; scale-x: -10000; scale-y: 0.797; }
        frame 79 { x: 48.1; y: 122.4; skew-x: 326.7; skew-y: 326.7; scale-y: -10000; }
        frame 80 { x: 48; y: 122.2; skew-x: 327.1; skew-y: 327.1; }
        frame 81 { x: -10000; y: 122; skew-x: 327.4; skew-y: 327.4; scale-x: 0.695; scale-y: 0.798; }
        frame 82 { y: 121.9; skew-x: -10000; skew-y: -10000; scale-x: 0.694; scale-y: 0.797; }
        frame 83 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 86 { y: 122; scale-x: 0.695; scale-y: 0.798; }
        frame 87 { x: 48.8; y: 110.8; skew-x: 362; skew-y: 362; scale-x: 0.694; scale-y: 0.796; }
        frame 88 { x: 55.6; y: 102.2; skew-x: 396.6; skew-y: 396.6; scale-x: 0.693; scale-y: 0.795; }
        frame 89 { x: 64.6; y: 98.6; skew-x: 418.4; skew-y: 418.4; scale-x: 0.692; scale-y: 0.794; }
        frame 90 { x: 73.8; y: 97.5; skew-x: 440.1; skew-y: 440.1; scale-x: 0.693; scale-y: 0.795; }
        frame 91 { x: 82.1; y: 94.5; skew-x: 453.8; skew-y: 453.8; scale-x: 0.692; scale-y: 0.794; }
        frame 92 { x: 90; y: 92.6; skew-x: 467.6; skew-y: 467.6; scale-x: 0.691; scale-y: 0.793; }
        frame 93 { x: 97.3; y: 91.6; skew-x: 481.5; skew-y: 481.5; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 91; y: 99.9; skew-x: 465.5; skew-y: 468.5; scale-x: 0.678; scale-y: 0.796; }
        frame 95 { x: 84.3; y: 109.3; skew-x: 449.7; skew-y: 455.5; scale-x: 0.667; scale-y: 0.8; }
        frame 96 { x: 88.8; y: 104.3; skew-x: 460; skew-y: 465.8; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 93.1; y: 99.8; skew-x: 470.5; skew-y: 476.3; scale-y: 0.801; }
        frame 98 { x: 89; y: 101.3; skew-x: 458.3; skew-y: 464; scale-x: 0.732; scale-y: 0.799; }
        frame 99 { x: 84; y: 103.6; skew-x: 446.2; skew-y: 452; scale-x: 0.797; scale-y: 0.798; }
    }
    Track {
        source-name: "Zombie_Jackson_outerleg_lower";
        frame-count: 100;
        frame 0 { x: 40.3; y: 89.7; skew-x: 2.2; skew-y: 2.2; scale-x: 0.799; scale-y: 0.776; image: IMAGE_REANIM_ZOMBIE_DANCER_OUTERLEG_LOWER; }
        frame 1 { x: 42.2; y: 91.1; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: 0.766; image: none; }
        frame 2 { x: 44.5; y: 92.9; skew-x: -12.5; skew-y: -12.5; scale-x: 0.798; scale-y: 0.756; }
        frame 3 { x: 47; y: 95; skew-x: -20; skew-y: -20; scale-x: -10000; scale-y: 0.746; }
        frame 4 { x: 49.9; y: 97.1; skew-x: -27.5; skew-y: -27.5; scale-y: 0.737; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 7 { x: 51.9; y: 96.3; skew-x: -22.7; skew-y: -22.7; scale-x: 0.797; scale-y: 0.723; }
        frame 8 { x: 54.1; y: 95.8; skew-x: -18; skew-y: -18; scale-x: 0.798; scale-y: 0.71; }
        frame 9 { x: 56.3; y: 95.3; skew-x: -13.4; skew-y: -13.4; scale-x: 0.799; scale-y: 0.698; }
        frame 10 { x: 58.6; y: 94.8; skew-x: -8.8; skew-y: -8.8; scale-x: 0.8; scale-y: 0.685; }
        frame 11 { x: 51.5; y: 91.6; skew-x: -13.9; skew-y: -13.9; scale-x: 0.798; scale-y: 0.722; }
        frame 12 { x: 44; y: 88.5; skew-x: -19.2; skew-y: -19.2; scale-x: -10000; scale-y: 0.759; }
        frame 13 { x: 36.3; y: 86.5; skew-x: -24.5; skew-y: -24.5; scale-x: 0.797; scale-y: 0.762; }
        frame 14 { x: 28.7; y: 84.4; skew-x: -29.9; skew-y: -29.9; scale-x: 0.798; scale-y: 0.766; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 31.2; y: 85.3; skew-x: -21.7; skew-y: -21.7; scale-y: 0.768; }
        frame 18 { x: 34; y: 86.4; skew-x: -13.7; skew-y: -13.7; scale-y: 0.771; }
        frame 19 { x: 37; y: 87.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.773; }
        frame 20 { x: 40.3; y: 89.7; skew-x: 2.2; skew-y: 2.2; scale-x: -10000; scale-y: 0.776; }
        frame 21 { x: 52.3; y: 93.8; skew-x: 5.5; skew-y: 7.2; scale-x: 0.779; scale-y: 0.68; }
        frame 22 { x: 49.8; y: 92.7; skew-x: 7.3; skew-y: 7.8; scale-x: 0.785; scale-y: 0.689; }
        frame 23 { x: 47.3; y: 91.7; skew-x: 9.3; skew-y: 8.3; scale-x: 0.79; scale-y: 0.699; }
        frame 24 { x: 44.7; y: 90.6; skew-x: 11.1; skew-y: 8.8; scale-x: 0.795; scale-y: 0.708; }
        frame 25 { x: 42.1; y: 89.5; skew-x: 13.1; skew-y: 9.5; scale-x: 0.801; scale-y: 0.718; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 45.2; y: 91.1; skew-x: 9.3; skew-y: 8.3; scale-x: 0.818; scale-y: 0.688; }
        frame 30 { x: 48.2; y: 92.6; skew-x: 5.7; skew-y: 7.3; scale-x: 0.836; scale-y: 0.658; }
        frame 31 { x: 52.3; y: 93.8; skew-x: 5.5; skew-y: 7.2; scale-x: 0.779; scale-y: 0.68; }
        frame 32 { x: 54.4; y: 94.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.665; }
        frame 33 { x: 54.6; y: 94.3; skew-x: 0.6; skew-y: 0.6; scale-x: -10000; scale-y: 0.672; }
        frame 34 { x: 55; y: 93.8; skew-x: 1.3; skew-y: 1.3; scale-y: 0.679; }
        frame 35 { x: 55.2; y: 93.4; skew-x: 2; skew-y: 2; scale-y: 0.687; }
        frame 36 { x: 55.5; y: 92.8; skew-x: 2.8; skew-y: 2.8; scale-y: 0.694; }
        frame 37 { x: 55.9; y: 92.3; skew-x: 3.5; skew-y: 3.5; scale-y: 0.701; }
        frame 38 { x: 56.1; y: 91.8; skew-x: 4.3; skew-y: 4.3; scale-y: 0.709; }
        frame 39 { x: 56.5; y: 91.3; skew-x: 5; skew-y: 5; scale-y: 0.716; }
        frame 40 { x: 53; y: 92.1; skew-x: -2.2; skew-y: -2.2; scale-x: 0.799; scale-y: -10000; }
        frame 41 { x: 49.6; y: 93.1; skew-x: -9.4; skew-y: -9.4; scale-x: -10000; scale-y: 0.715; }
        frame 42 { x: 46.5; y: 94.3; skew-x: -16.7; skew-y: -16.7; scale-x: 0.798; scale-y: -10000; }
        frame 43 { x: 43.5; y: 95.8; skew-x: -24.2; skew-y: -24.2; scale-x: 0.799; }
        frame 44 { x: 42.4; y: 95.2; skew-x: -26.7; skew-y: -27; scale-x: 0.798; scale-y: 0.754; }
        frame 45 { x: 40.8; y: 94.6; skew-x: -29.3; skew-y: -30; scale-x: 0.799; scale-y: 0.794; }
        frame 46 { x: 42.2; y: 94.1; skew-x: -26; skew-y: -26.7; scale-x: 0.798; scale-y: 0.781; }
        frame 47 { x: 43.6; y: 93.7; skew-x: -22.7; skew-y: -23.2; scale-x: -10000; scale-y: 0.769; }
        frame 48 { x: 45.1; y: 93.3; skew-x: -19.4; skew-y: -19.9; scale-y: 0.757; }
        frame 49 { x: 46.7; y: 92.9; skew-x: -16; skew-y: -16.5; scale-y: 0.745; }
        frame 50 { x: 48.1; y: 92.7; skew-x: -12.7; skew-y: -13.2; scale-x: 0.799; scale-y: 0.733; }
        frame 51 { x: 49.8; y: 92.4; skew-x: -9.4; skew-y: -9.7; scale-x: -10000; scale-y: 0.721; }
        frame 52 { x: 51.4; y: 92.3; skew-x: -6.2; skew-y: -6.4; scale-y: 0.709; }
        frame 53 { x: 53; y: 92.2; skew-x: -2.9; skew-y: -2.9; scale-y: 0.697; }
        frame 54 { x: 54.5; y: -10000; skew-x: 0.2; skew-y: 0.2; scale-x: 0.8; scale-y: 0.685; }
        frame 55 { x: 52.3; y: 93.3; skew-x: -4.9; skew-y: -4.9; scale-x: 0.799; scale-y: -10000; }
        frame 56 { x: 50.1; y: 94.8; skew-x: -10.2; skew-y: -10.2; scale-x: -10000; }
        frame 57 { x: 48.1; y: 96.1; skew-x: -15.4; skew-y: -15.4; scale-y: 0.684; }
        frame 58 { x: 46.2; y: 97.7; skew-x: -20.7; skew-y: -20.7; scale-y: 0.685; }
        frame 59 { x: 46.3; y: 96.8; skew-x: -20; skew-y: -20; scale-x: 0.798; scale-y: 0.684; }
        frame 60 { x: 46.2; y: 95.7; skew-x: -19.5; skew-y: -19.5; scale-x: 0.799; scale-y: 0.685; }
        frame 61 { x: 48.5; y: 95.5; skew-x: -14.5; skew-y: -14.5; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 50.7; y: 95.4; skew-x: -9.7; skew-y: -9.7; }
        frame 63 { x: 53; y: 95.5; skew-x: -4.7; skew-y: -4.7; scale-x: 0.8; }
        frame 64 { x: 55.4; y: 95.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.686; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 66 { x: 55.7; y: 92.8; skew-x: 0.3; skew-y: 0.3; scale-y: 0.71; }
        frame 67 { x: 56.1; y: 89.9; skew-x: 0.8; skew-y: 0.8; scale-x: 0.799; scale-y: 0.734; }
        frame 68 { x: 56.5; y: 87.1; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: 0.759; }
        frame 69 { x: 56.8; y: 84.3; skew-x: 1.9; skew-y: 1.9; scale-y: 0.783; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 72 { x: 56.6; y: 84.5; skew-x: 1.5; skew-y: 1.5; scale-x: 0.798; }
        frame 73 { x: 56.5; y: 84.6; skew-x: 1.1; skew-y: 1.1; scale-x: -10000; }
        frame 74 { x: 56.3; y: 84.8; skew-x: 0.8; skew-y: 0.8; }
        frame 75 { x: 56; y: 84.9; skew-x: 0.3; skew-y: 0.3; }
        frame 76 { x: 55.9; y: 85; skew-x: 0.1; skew-y: 0.1; }
        frame 77 { x: 56; skew-x: 0.3; skew-y: 0.3; }
        frame 78 { x: 56.3; y: 84.8; skew-x: 0.8; skew-y: 0.8; }
        frame 79 { x: 56.5; y: 84.6; skew-x: 1.1; skew-y: 1.1; }
        frame 80 { x: -10000; y: 84.5; skew-x: 1.5; skew-y: 1.5; }
        frame 81 { x: 56.8; y: 84.3; skew-x: 1.9; skew-y: 1.9; scale-x: 0.799; }
        frame 82 { x: 57.9; y: -10000; skew-x: 4.3; skew-y: 4.3; scale-x: 0.798; scale-y: 0.768; }
        frame 83 { x: 59; skew-x: 6.6; skew-y: 6.6; scale-x: -10000; scale-y: 0.753; }
        frame 84 { x: 60.1; skew-x: 9; skew-y: 9; scale-y: 0.738; }
        frame 85 { x: 61.1; y: 84.4; skew-x: 11.3; skew-y: 11.3; scale-y: 0.723; }
        frame 86 { x: 62.2; y: 84.5; skew-x: 13.8; skew-y: 13.8; scale-x: 0.799; scale-y: 0.709; }
        frame 87 { x: 72; y: 86.6; skew-x: 32.6; skew-y: 32.6; scale-x: 0.797; scale-y: 0.701; }
        frame 88 { x: 82; y: 91; skew-x: 51.6; skew-y: 51.6; scale-x: -10000; scale-y: 0.695; }
        frame 89 { x: 91.4; y: 97.3; skew-x: 70.5; skew-y: 70.5; scale-y: 0.69; }
        frame 90 { x: 99.7; y: 105.3; skew-x: 89.3; skew-y: 89.3; scale-x: 0.798; scale-y: 0.684; }
        frame 91 { x: 104.8; y: 106.8; skew-x: 101.3; skew-y: 101.3; scale-x: 0.797; scale-y: 0.683; }
        frame 92 { x: 109.5; y: 108.7; skew-x: 113.3; skew-y: 113.3; scale-x: 0.796; scale-y: 0.682; }
        frame 93 { x: 113.2; y: 111; skew-x: 125.6; skew-y: 125.6; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 112; y: 114.6; skew-x: 113.3; skew-y: 110.8; scale-x: 0.775; scale-y: 0.689; }
        frame 95 { x: 109.6; y: 118.3; skew-x: 101; skew-y: 96.2; scale-x: 0.756; scale-y: 0.697; }
        frame 96 { x: 111; y: 118.1; skew-x: 111.3; skew-y: 106.6; scale-x: -10000; scale-y: 0.696; }
        frame 97 { x: 111.9; y: 118.2; skew-x: 122; skew-y: 117.2; scale-x: 0.757; scale-y: 0.697; }
        frame 98 { x: 110.8; y: 117.3; skew-x: 111.8; skew-y: 107; scale-x: 0.777; scale-y: 0.69; }
        frame 99 { x: 109.3; y: 116.3; skew-x: 102; skew-y: 97; scale-x: 0.798; scale-y: 0.684; }
    }
    Track {
        source-name: "Zombie_Jackson_outerleg_toe";
        frame-count: 100;
        frame 0 { x: 26.4; y: 116.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DANCER_OUTERLEG_TOE; }
        frame 1 { x: 33; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 39.5; }
        frame 3 { x: 46.1; }
        frame 4 { x: 52.6; }
        frame 5 { x: -10000; }
        frame 8 { x: 52.5; }
        frame 9 { x: -10000; }
        frame 10 { x: 52.4; }
        frame 11 { x: 47.4; y: 114.9; skew-x: -4.7; skew-y: -4.7; }
        frame 12 { x: 42.5; y: 113.4; skew-x: -9.7; skew-y: -9.7; scale-x: 0.799; scale-y: 0.799; }
        frame 13 { x: 37.5; y: 111.9; skew-x: -14.5; skew-y: -14.5; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 32.6; y: 110.3; skew-x: -19.5; skew-y: -19.5; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 17 { x: 31; y: 111.8; skew-x: -14.5; skew-y: -14.5; }
        frame 18 { x: 29.5; y: 113.3; skew-x: -9.7; skew-y: -9.7; }
        frame 19 { x: 28; y: 114.8; skew-x: -4.7; skew-y: -4.7; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { x: 26.4; y: 116.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 44.8; y: 117.7; skew-x: 1.1; skew-y: 1.1; scale-x: 0.71; scale-y: 0.782; }
        frame 22 { x: 40.8; y: 117.4; skew-x: 0.5; skew-y: 0.5; scale-x: 0.768; scale-y: 0.798; }
        frame 23 { x: 36.7; y: 117.1; skew-x: 0; skew-y: 0; scale-x: 0.827; scale-y: 0.815; }
        frame 24 { x: 31.7; y: 116.8; skew-x: -10000; skew-y: -10000; scale-x: 0.814; scale-y: 0.807; }
        frame 25 { x: 26.7; y: 116.5; scale-x: 0.8; scale-y: 0.8; }
        frame 26 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 34.1; y: 117.1; scale-x: 0.77; scale-y: 0.786; }
        frame 30 { x: 41.5; y: 117.7; scale-x: 0.741; scale-y: 0.773; }
        frame 31 { x: 44.8; y: -10000; skew-x: 1.1; skew-y: 1.1; scale-x: 0.71; scale-y: 0.782; }
        frame 32 { x: 45.9; y: 116.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 33 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 34 { y: 116.6; }
        frame 35 { y: -10000; }
        frame 38 { y: 116.5; }
        frame 39 { y: -10000; }
        frame 40 { y: 116.4; }
        frame 41 { x: 45.8; y: 116.3; }
        frame 42 { x: 45.7; y: 116.2; }
        frame 43 { x: 45.6; y: 116; }
        frame 44 { x: 45.8; y: -10000; }
        frame 45 { x: 45.9; }
        frame 46 { x: -10000; y: 116.1; }
        frame 47 { y: -10000; }
        frame 48 { y: 116.2; }
        frame 49 { y: -10000; }
        frame 50 { y: 116.3; }
        frame 51 { y: -10000; }
        frame 52 { y: 116.4; }
        frame 53 { y: 116.5; }
        frame 54 { y: -10000; }
        frame 66 { y: 116.8; skew-x: -2.7; skew-y: -2.7; }
        frame 67 { y: 117.3; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 68 { y: 117.6; skew-x: -8.2; skew-y: -8.2; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 46; y: 118; skew-x: -10.9; skew-y: -10.9; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 72 { y: 118; }
        frame 73 { y: -10000; }
        frame 76 { y: 118; }
        frame 78 { y: -10000; }
        frame 81 { y: 118; }
        frame 83 { y: -10000; }
        frame 86 { y: 118; }
        frame 87 { x: 46.2; y: 110.3; skew-x: 3.3; skew-y: 3.3; scale-x: 0.798; scale-y: 0.798; }
        frame 88 { x: 47; y: 103.3; skew-x: 17.8; skew-y: 17.8; scale-x: 0.797; scale-y: 0.797; }
        frame 89 { x: 60.4; y: 98; skew-x: 50.2; skew-y: 50.2; scale-x: 0.796; scale-y: 0.796; }
        frame 90 { x: 73.8; y: 95.5; skew-x: 82.6; skew-y: 82.6; scale-x: 0.797; scale-y: 0.797; }
        frame 91 { x: 82.5; y: 93.3; skew-x: 96.3; skew-y: 96.3; scale-x: 0.796; scale-y: 0.796; }
        frame 92 { x: 90.9; y: 91.6; skew-x: 110.1; skew-y: 110.1; scale-x: 0.795; scale-y: 0.795; }
        frame 93 { x: 98.4; y: 89.8; skew-x: 124; skew-y: 124; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 91.4; y: 98.5; skew-x: 108.1; skew-y: 110.8; scale-x: 0.778; scale-y: 0.799; }
        frame 95 { x: 84.3; y: 107.4; skew-x: 92.3; skew-y: 97.9; scale-x: 0.763; scale-y: 0.805; }
        frame 96 { x: 89.2; y: 102.7; skew-x: 102.6; skew-y: 108.3; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 93.8; y: 98.1; skew-x: 113.1; skew-y: 118.6; scale-x: 0.764; scale-y: 0.806; }
        frame 98 { x: 89; y: 101; skew-x: 99.6; skew-y: 105.3; scale-x: 0.78; scale-y: 0.801; }
        frame 99 { x: 83.7; y: 104.2; skew-x: 86.3; skew-y: 92; scale-x: 0.797; scale-y: 0.798; }
    }
    Track {
        source-name: "Zombie_Jackson_outerleg_upper";
        frame-count: 100;
        frame 0 { x: 58.1; y: 75; skew-x: 39.7; skew-y: 39.7; scale-x: 0.797; scale-y: 0.715; image: IMAGE_REANIM_ZOMBIE_DANCER_OUTERLEG_UPPER; }
        frame 1 { x: 57.8; y: 73.3; skew-x: 32.1; skew-y: 32.1; scale-x: 0.796; scale-y: 0.741; image: none; }
        frame 2 { x: 57.4; y: 72; skew-x: 24.3; skew-y: 24.3; scale-x: 0.797; scale-y: 0.768; }
        frame 3 { x: 56.8; y: 70.8; skew-x: 16.6; skew-y: 16.6; scale-x: -10000; scale-y: 0.795; }
        frame 4 { x: 56.1; y: 69.8; skew-x: 9.1; skew-y: 9.1; scale-x: 0.798; scale-y: 0.822; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 54.4; y: 71.3; skew-x: 1.5; skew-y: 1.5; scale-y: 0.816; }
        frame 8 { x: 52.9; y: 72.8; skew-x: -5.7; skew-y: -5.7; scale-y: 0.81; }
        frame 9 { x: 51.6; y: 74.6; skew-x: -13; skew-y: -13; scale-y: 0.804; }
        frame 10 { x: 50.6; y: 76.7; skew-x: -20.5; skew-y: -20.5; scale-y: 0.798; }
        frame 11 { x: 55.6; y: 69.8; skew-x: 6; skew-y: 6; scale-x: 0.797; scale-y: 0.821; }
        frame 12 { x: 62.8; y: 66.4; skew-x: 32.9; skew-y: 32.9; scale-x: 0.795; scale-y: 0.843; }
        frame 13 { x: 63; y: 66.5; skew-x: 48.4; skew-y: 48.4; scale-x: 0.794; scale-y: 0.866; }
        frame 14 { x: 62.7; y: 67.9; skew-x: 64; skew-y: 64; scale-x: 0.796; scale-y: 0.892; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 61.5; y: 69.3; skew-x: 57.9; skew-y: 57.9; scale-x: 0.795; scale-y: 0.847; }
        frame 18 { x: 60.4; y: 70.8; skew-x: 51.9; skew-y: 51.9; scale-x: -10000; scale-y: 0.802; }
        frame 19 { x: 59.1; y: 72.8; skew-x: 45.9; skew-y: 45.9; scale-y: 0.758; }
        frame 20 { x: 58.1; y: 75; skew-x: 39.7; skew-y: 39.7; scale-x: 0.797; scale-y: 0.715; }
        frame 21 { x: 61; y: 69.8; skew-x: 9.6; skew-y: 19.2; scale-x: -10000; scale-y: 0.893; }
        frame 22 { x: 59.9; y: 69.1; skew-x: 15.8; skew-y: 20.3; scale-x: 0.799; scale-y: 0.88; }
        frame 23 { x: 57.7; y: 68.2; skew-x: 21.8; skew-y: 21.6; scale-x: 0.802; scale-y: 0.866; }
        frame 24 { x: 56.5; y: 67.2; skew-x: 30.1; skew-y: 25; scale-x: 0.805; scale-y: 0.853; }
        frame 25 { x: 55.5; y: 66.5; skew-x: 38.6; skew-y: 28.6; scale-x: 0.81; scale-y: 0.842; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 57.4; y: 67.5; skew-x: 28.8; skew-y: 25.3; scale-x: 0.804; scale-y: 0.857; }
        frame 30 { x: 59.4; y: 68.7; skew-x: 19.1; skew-y: 22.3; scale-x: 0.8; scale-y: 0.875; }
        frame 31 { x: 61; y: 69.8; skew-x: 9.6; skew-y: 19.2; scale-x: 0.797; scale-y: 0.893; }
        frame 32 { x: 58.8; y: 72.1; skew-x: 10.4; skew-y: 10.4; scale-x: 0.8; scale-y: 0.8; }
        frame 33 { x: 58.6; y: 72; skew-x: 9.5; skew-y: 9.5; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 58.5; y: 71.6; skew-x: 8.8; skew-y: 8.8; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 58.4; y: 71.5; skew-x: 8; skew-y: 8; }
        frame 36 { x: 58.2; y: 71.2; skew-x: 7.3; skew-y: 7.3; }
        frame 37 { x: 58.1; y: 71; skew-x: 6.5; skew-y: 6.5; }
        frame 38 { x: 58; y: 70.7; skew-x: 5.8; skew-y: 5.8; }
        frame 39 { x: 57.8; y: 70.5; skew-x: 5.1; skew-y: 5.1; scale-x: 0.8; scale-y: 0.8; }
        frame 40 { x: 58.5; y: 70; skew-x: 11.3; skew-y: 11.3; scale-x: 0.799; scale-y: 0.816; }
        frame 41 { x: 59.2; y: 69.8; skew-x: 17.3; skew-y: 17.3; scale-x: 0.798; scale-y: 0.832; }
        frame 42 { x: 60.2; y: 69.7; skew-x: 23.6; skew-y: 23.6; scale-x: -10000; scale-y: 0.848; }
        frame 43 { x: 61.1; y: 69.8; skew-x: 29.9; skew-y: 29.9; scale-x: 0.799; scale-y: 0.866; }
        frame 44 { x: 61; y: 71.4; skew-x: 34.1; skew-y: 34.1; scale-x: 0.797; scale-y: 0.822; }
        frame 45 { x: 60.6; y: 73; skew-x: 38.2; skew-y: 38.2; scale-x: 0.798; scale-y: 0.78; }
        frame 46 { x: 60.1; y: 72.5; skew-x: 34.4; skew-y: 34.4; scale-x: 0.797; scale-y: 0.781; }
        frame 47 { x: 59.7; y: 72.1; skew-x: 30.8; skew-y: 30.8; scale-x: -10000; scale-y: 0.783; }
        frame 48 { x: 59.1; y: 71.6; skew-x: 27.1; skew-y: 27.1; scale-x: 0.798; scale-y: 0.786; }
        frame 49 { x: 58.6; y: 71.3; skew-x: 23.3; skew-y: 23.3; scale-x: -10000; scale-y: 0.788; }
        frame 50 { x: 58; y: 71; skew-x: 19.8; skew-y: 19.8; scale-y: 0.79; }
        frame 51 { x: 57.6; y: 70.8; skew-x: 16; skew-y: 16; scale-x: 0.799; scale-y: 0.792; }
        frame 52 { x: 57.1; y: 70.7; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: 0.795; }
        frame 53 { x: 56.6; y: 70.6; skew-x: 8.6; skew-y: 8.6; scale-y: 0.797; }
        frame 54 { x: 56.1; y: 70.5; skew-x: 5.1; skew-y: 5.1; scale-x: 0.8; scale-y: 0.8; }
        frame 55 { x: 56.8; y: 71.1; skew-x: 9.3; skew-y: 9.3; scale-x: 0.799; scale-y: 0.795; }
        frame 56 { x: 57.5; y: 71.8; skew-x: 13.8; skew-y: 13.8; scale-x: -10000; scale-y: 0.79; }
        frame 57 { x: 58; y: 72.5; skew-x: 18.1; skew-y: 18.1; scale-x: 0.798; scale-y: 0.785; }
        frame 58 { x: 58.7; y: 73.3; skew-x: 22.6; skew-y: 22.6; scale-x: 0.799; scale-y: 0.781; }
        frame 59 { x: 59.4; y: 72.8; skew-x: 23.3; skew-y: 23.3; scale-x: 0.797; scale-y: 0.779; }
        frame 60 { x: 59.8; y: 72; skew-x: 24.1; skew-y: 24.1; scale-x: 0.798; scale-y: 0.78; }
        frame 61 { x: 58.8; y: 72.2; skew-x: 19.3; skew-y: 19.3; scale-x: 0.797; scale-y: 0.784; }
        frame 62 { x: 57.9; y: 72.6; skew-x: 14.5; skew-y: 14.5; scale-x: 0.798; scale-y: 0.789; }
        frame 63 { x: 57; y: 73; skew-x: 9.8; skew-y: 9.8; scale-x: 0.799; scale-y: 0.794; }
        frame 64 { x: 56.1; y: 73.5; skew-x: 5.1; skew-y: 5.1; scale-x: 0.8; scale-y: 0.8; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 57; y: 70.8; skew-x: 5; skew-y: 5; }
        frame 67 { x: 57.8; y: 68; skew-x: -10000; skew-y: -10000; }
        frame 68 { x: 58.6; y: 65.2; }
        frame 69 { x: 59.5; y: 62.4; skew-x: 5.1; skew-y: 5.1; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 72 { x: 58.5; y: 62.6; skew-x: 4; skew-y: 4; }
        frame 73 { x: 57.9; y: 62.9; skew-x: 3; skew-y: 3; }
        frame 74 { x: 57; y: 63.1; skew-x: 2; skew-y: 2; scale-x: 0.799; scale-y: 0.799; }
        frame 75 { x: 56.3; y: 63.4; skew-x: 1; skew-y: 1; scale-x: 0.8; scale-y: 0.8; }
        frame 76 { x: 55.5; y: 63.5; skew-x: 0.2; skew-y: 0.2; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 56.3; y: 63.4; skew-x: 1; skew-y: 1; }
        frame 78 { x: 57; y: 63; skew-x: 2; skew-y: 2; }
        frame 79 { x: 57.9; y: 62.8; skew-x: 3; skew-y: 3; }
        frame 80 { x: 58.5; y: 62.6; skew-x: 4; skew-y: 4; }
        frame 81 { x: 59.5; y: 62.4; skew-x: 5.1; skew-y: 5.1; }
        frame 82 { x: 60.5; y: 62.6; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 83 { x: 61.5; y: 62.9; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 62.6; y: 63; skew-x: 7.5; skew-y: 7.5; }
        frame 85 { x: 63.7; y: 63.3; skew-x: 8.3; skew-y: 8.3; }
        frame 86 { x: 64.8; y: 63.4; skew-x: 9.1; skew-y: 9.1; scale-x: 0.8; scale-y: 0.8; }
        frame 87 { x: 78.4; y: 70.2; skew-x: 26.1; skew-y: 26.1; scale-x: 0.798; scale-y: 0.798; }
        frame 88 { x: 92.2; y: 78.6; skew-x: 43.1; skew-y: 43.1; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 105.7; y: 88.3; skew-x: 60.2; skew-y: 60.2; }
        frame 90 { x: 118.3; y: 99.5; skew-x: 77.1; skew-y: 77.1; scale-x: 0.799; scale-y: 0.799; }
        frame 91 { x: 123.7; y: 104.5; skew-x: 87.5; skew-y: 87.5; scale-x: 0.798; scale-y: 0.798; }
        frame 92 { x: 128.5; y: 109.7; skew-x: 97.6; skew-y: 97.6; scale-x: 0.797; scale-y: 0.797; }
        frame 93 { x: 132.8; y: 115.2; skew-x: 108; skew-y: 108; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 132; y: 116.8; skew-x: 100.3; skew-y: 99.3; scale-x: 0.769; scale-y: 0.812; }
        frame 95 { x: 130.8; y: 118.7; skew-x: 92.5; skew-y: 90.9; scale-x: 0.743; scale-y: 0.827; }
        frame 96 { x: 131.6; y: 119.7; skew-x: 97.5; skew-y: 96; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 132.3; y: 120.7; skew-x: 102.8; skew-y: 101.2; }
        frame 98 { x: 131.6; y: 119.7; skew-x: 100.3; skew-y: 98.6; scale-x: 0.771; scale-y: 0.813; }
        frame 99 { x: 131.1; y: 119; skew-x: 98; skew-y: 96.3; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Zombie_dancer_belt";
        frame-count: 100;
        frame 0 { x: 50.5; y: 68.6; skew-x: 27.8; skew-y: 27.8; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_DANCER_BELT; }
        frame 1 { x: -10000; y: -10000; skew-x: 26.3; skew-y: 26.3; scale-x: 0.798; scale-y: 0.798; image: none; }
        frame 2 { x: 50.6; y: 68.5; skew-x: 25.1; skew-y: 25.1; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -10000; y: -10000; skew-x: 23.6; skew-y: 23.6; }
        frame 4 { x: 50.7; y: 68.3; skew-x: 22.3; skew-y: 22.3; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 7 { x: 50.9; y: 68.8; skew-x: 20; scale-y: 0.797; }
        frame 8 { x: -10000; y: 69.2; skew-x: 17.9; scale-x: 0.8; scale-y: 0.798; }
        frame 9 { x: 51.4; y: 69.8; skew-x: 20; scale-x: 0.798; scale-y: 0.797; }
        frame 10 { x: 51.7; y: 70.3; skew-x: 22.3; scale-x: -10000; scale-y: 0.798; }
        frame 11 { x: 51.5; y: 69.9; skew-x: -10000; scale-y: -10000; }
        frame 12 { x: 51.3; y: 69.4; }
        frame 13 { x: 51; y: 68.9; }
        frame 14 { x: 50.7; y: 68.3; }
        frame 15 { x: -10000; y: -10000; }
        frame 17 { x: 50.9; y: 68.8; skew-x: 20; scale-y: 0.797; }
        frame 18 { x: -10000; y: 69.2; skew-x: 17.9; scale-x: 0.8; scale-y: 0.798; }
        frame 19 { x: 50.6; y: 68.8; skew-x: 22.8; skew-y: 25.1; scale-x: 0.798; scale-y: 0.797; }
        frame 20 { x: 50.5; y: 68.6; skew-x: 27.8; skew-y: 27.8; scale-x: 0.799; scale-y: 0.799; }
        frame 21 { x: 52; y: 69.6; skew-x: 7.1; skew-y: 7.1; scale-x: 0.798; scale-y: 0.798; }
        frame 22 { x: 50.5; y: 68.6; skew-x: 10; skew-y: 10; scale-x: 0.797; scale-y: 0.797; }
        frame 23 { x: 48.9; y: 67.5; skew-x: 13; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 47.4; y: 66.3; skew-x: 16; skew-y: 16; }
        frame 25 { x: 45.9; y: 65.3; skew-x: 19.1; skew-y: 19.1; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 29 { x: 47.9; y: 66.8; skew-x: 15; skew-y: 15; }
        frame 30 { x: 50; y: 68.2; skew-x: 11; skew-y: 11; }
        frame 31 { x: 52; y: 69.6; skew-x: 7.1; skew-y: 7.1; scale-x: 0.798; scale-y: 0.798; }
        frame 32 { x: 51.1; y: 71.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 51; y: 71.2; skew-x: 7; skew-y: 7; }
        frame 34 { x: 50.8; y: 70.6; skew-x: -10000; skew-y: -10000; }
        frame 35 { x: 50.6; y: 70; }
        frame 36 { x: 50.5; y: 69.4; }
        frame 37 { x: 50.3; y: 68.8; }
        frame 38 { x: 50.1; y: 68.3; }
        frame 39 { x: 49.9; y: 67.7; skew-x: 7.1; skew-y: 7.1; }
        frame 40 { x: 50; y: 68.3; skew-x: 7; skew-y: 7; }
        frame 41 { x: -10000; y: 68.8; skew-x: -10000; skew-y: -10000; }
        frame 42 { y: 69.4; }
        frame 43 { x: 49.9; y: 70; skew-x: 7.1; skew-y: 7.1; }
        frame 44 { x: 50; y: 71.3; skew-x: 7; skew-y: 7; }
        frame 45 { x: 49.9; y: 72.7; skew-x: 7.1; skew-y: 7.1; }
        frame 46 { x: 50; y: 72.1; skew-x: 7; skew-y: 7; }
        frame 47 { x: -10000; y: 71.6; skew-x: -10000; skew-y: -10000; }
        frame 48 { y: 71.1; }
        frame 49 { y: 70.6; }
        frame 50 { y: 70; }
        frame 51 { y: 69.5; }
        frame 52 { y: 69; }
        frame 53 { y: 68.5; }
        frame 54 { x: 49.9; y: 68; skew-x: 7.1; skew-y: 7.1; }
        frame 55 { x: 49.8; y: 68.3; skew-x: 7; skew-y: 7; }
        frame 56 { x: 49.5; y: 68.7; skew-x: -10000; skew-y: -10000; }
        frame 57 { x: 49.4; y: 69; }
        frame 58 { x: 49.2; y: 69.3; skew-x: 7.1; skew-y: 7.1; }
        frame 59 { x: 49.4; y: 70.1; skew-x: 7; skew-y: 7; }
        frame 60 { x: -10000; y: 70.8; skew-x: 7.1; skew-y: 7.1; }
        frame 61 { y: 71.2; skew-x: 7; skew-y: 7; }
        frame 62 { y: 71.6; skew-x: -10000; skew-y: -10000; }
        frame 63 { y: 71.8; }
        frame 64 { y: 72.2; skew-x: 7.1; skew-y: 7.1; }
        frame 65 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 66 { x: 50.5; y: 69.1; skew-x: 7; skew-y: 7; }
        frame 67 { x: 51.8; y: 66; skew-x: -10000; skew-y: -10000; }
        frame 68 { x: 52.9; y: 62.9; }
        frame 69 { x: 54; y: 59.8; skew-x: 7.1; skew-y: 7.1; }
        frame 70 { x: -10000; y: -10000; skew-x: 7; skew-y: 7; }
        frame 71 { skew-x: 7.1; skew-y: 7.1; }
        frame 72 { x: 53.2; y: 60.1; skew-x: 6; skew-y: 6; }
        frame 73 { x: 52.4; y: 60.5; skew-x: 5; skew-y: 5; }
        frame 74 { x: 51.5; y: 60.7; skew-x: 4; skew-y: 4; }
        frame 75 { x: 50.6; y: 61; skew-x: 3; skew-y: 3; }
        frame 76 { x: 49.8; y: 61.4; skew-x: 2.2; skew-y: 2.2; }
        frame 77 { x: 50.6; y: 61.1; skew-x: 3; skew-y: 3; }
        frame 78 { x: 51.5; y: 60.8; skew-x: 4; skew-y: 4; }
        frame 79 { x: 52.3; y: 60.5; skew-x: 5; skew-y: 5; }
        frame 80 { x: 53.1; y: 60.2; skew-x: 6; skew-y: 6; }
        frame 81 { x: 54; y: 59.8; skew-x: 7.1; skew-y: 7.1; }
        frame 82 { x: 54.9; y: -10000; skew-x: 8; skew-y: 8; scale-x: 0.797; scale-y: 0.797; }
        frame 83 { x: 55.8; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 56.7; y: 59.9; skew-x: 10; skew-y: 10; }
        frame 85 { x: 57.5; y: -10000; skew-x: 11; skew-y: 11; }
        frame 86 { x: 58.5; skew-x: 12.1; skew-y: 12.1; scale-x: 0.798; scale-y: 0.798; }
        frame 87 { x: 73.1; y: 66.6; skew-x: 29.8; skew-y: 29.8; scale-x: 0.796; scale-y: 0.796; }
        frame 88 { x: 88.4; y: 74.2; skew-x: 47.7; skew-y: 47.7; scale-x: 0.795; scale-y: 0.795; }
        frame 89 { x: 104.1; y: 83; skew-x: 65.7; skew-y: 65.7; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 119.2; y: 93; skew-x: 83.4; skew-y: 83.4; }
        frame 91 { x: 125.1; y: 97.7; skew-x: 90; skew-y: 90; }
        frame 92 { x: 130.9; y: 102.6; skew-x: 96.3; skew-y: 96.3; scale-x: 0.794; scale-y: 0.794; }
        frame 93 { x: 136.5; y: 107.5; skew-x: 102.9; skew-y: 102.9; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 136.1; y: 110; skew-x: 102.8; skew-y: 102.8; }
        frame 95 { x: 135.9; y: 112.5; skew-x: 102.9; skew-y: 102.9; }
        frame 96 { x: 134.7; y: 111.7; skew-x: 102.8; skew-y: 102.8; }
        frame 97 { x: 133.7; y: 110.9; skew-x: 102.9; skew-y: 102.9; }
        frame 98 { x: 133.4; y: 112.1; skew-x: 98.8; skew-y: 98.8; }
        frame 99 { x: 133; y: 113.2; skew-x: 94.9; skew-y: 94.9; }
    }
    Track {
        source-name: "Zombie_Jackson_body1";
        frame-count: 100;
        frame 0 { x: 58.6; y: 21.1; skew-x: 44.5; skew-y: 44.5; scale-x: 0.798; scale-y: 0.798; image: IMAGE_REANIM_ZOMBIE_DANCER_BODY1; }
        frame 1 { x: 58.5; y: 20.5; skew-x: 43.6; skew-y: 43.6; scale-x: 0.796; scale-y: 0.809; image: none; }
        frame 2 { x: 58.3; y: 19.7; skew-x: 42.8; skew-y: 42.8; scale-x: 0.797; scale-y: 0.823; }
        frame 3 { x: 58.6; y: 19.1; skew-x: 43.6; skew-y: 43.6; scale-x: 0.796; scale-y: 0.809; }
        frame 4 { x: 59.1; y: 18.6; skew-x: 44.5; skew-y: 44.5; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { y: 19; skew-x: 44.6; skew-y: 44.6; scale-x: 0.797; scale-y: 0.797; }
        frame 8 { x: 59; y: 19.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 58.9; y: 19.5; }
        frame 10 { x: 58.6; y: 19.7; skew-x: 44.5; skew-y: 44.5; scale-x: 0.798; scale-y: 0.798; }
        frame 11 { x: 58.5; y: 19.5; skew-x: 43.6; skew-y: 43.6; scale-x: 0.796; scale-y: 0.809; }
        frame 12 { x: 58.3; y: 19.2; skew-x: 42.8; skew-y: 42.8; scale-x: 0.797; scale-y: 0.823; }
        frame 13 { x: 58.6; y: 18.9; skew-x: 43.6; skew-y: 43.6; scale-x: 0.796; scale-y: 0.809; }
        frame 14 { x: 59.1; y: 18.6; skew-x: 44.5; skew-y: 44.5; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: 19.2; skew-x: 44.6; skew-y: 44.6; scale-x: 0.797; scale-y: 0.797; }
        frame 18 { x: 59; y: 19.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 58.9; y: 20.2; }
        frame 20 { x: 58.6; y: 20.6; skew-x: 44.5; skew-y: 44.5; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 38.4; y: 21.1; skew-x: 22.4; skew-y: 24.3; scale-x: 0.829; scale-y: 0.804; }
        frame 22 { x: 39.5; y: 19.9; skew-x: 25.1; skew-y: 26.6; scale-x: 0.82; scale-y: 0.801; }
        frame 23 { x: 40.7; y: 18.7; skew-x: 28; skew-y: 28.8; scale-x: 0.812; scale-y: 0.799; }
        frame 24 { x: 41.9; y: 17.6; skew-x: 30.8; skew-y: 31.3; scale-x: 0.804; scale-y: 0.798; }
        frame 25 { x: 43; y: 16.5; skew-x: 33.6; skew-y: 33.6; scale-x: 0.797; scale-y: 0.797; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 41.5; y: 17.9; skew-x: 29.8; skew-y: 30.5; scale-x: 0.807; scale-y: 0.798; }
        frame 30 { x: 39.9; y: 19.4; skew-x: 26.1; skew-y: 27.3; scale-x: 0.817; scale-y: 0.801; }
        frame 31 { x: 38.4; y: 21.1; skew-x: 22.4; skew-y: 24.3; scale-x: 0.829; scale-y: 0.804; }
        frame 32 { x: 32.6; y: 27.1; skew-x: 17.1; skew-y: 17.1; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 34.7; y: 25.3; skew-x: 19.8; skew-y: 19.8; scale-x: 0.798; scale-y: 0.798; }
        frame 34 { x: 37; y: 23.5; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 39.2; y: 21.9; skew-x: 25.6; skew-y: 25.6; }
        frame 36 { x: 41.5; y: 20.3; skew-x: 28.6; skew-y: 28.6; }
        frame 37 { x: 43.6; y: 18.9; skew-x: 31.3; skew-y: 31.3; scale-x: 0.797; scale-y: 0.797; }
        frame 38 { x: 46; y: 17.5; skew-x: 34.3; skew-y: 34.3; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 48.5; y: 16.1; skew-x: 37.2; skew-y: 37.2; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 41; y: 19.2; skew-x: 28.3; skew-y: 27.8; scale-x: 0.797; scale-y: 0.797; }
        frame 41 { x: 33.8; y: 23; skew-x: 19.5; skew-y: 18.6; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 27; y: 27.5; skew-x: 10.8; skew-y: 9.5; }
        frame 43 { x: 20.6; y: 32.6; skew-x: 2; skew-y: 0.3; }
        frame 44 { x: 19.5; y: 35.1; skew-x: 0; skew-y: -1.2; }
        frame 45 { x: 18.3; y: 37.5; skew-x: -1.5; skew-y: -3.2; }
        frame 46 { x: 21.2; y: 34.5; skew-x: 2.5; skew-y: 1.1; }
        frame 47 { x: 24.3; y: 31.5; skew-x: 7; skew-y: 5.6; }
        frame 48 { x: 27.5; y: 28.8; skew-x: 11.3; skew-y: 10.1; }
        frame 49 { x: 30.8; y: 26.2; skew-x: 15.5; skew-y: 14.6; }
        frame 50 { x: 34.1; y: 23.8; skew-x: 19.8; skew-y: 19.1; }
        frame 51 { x: 37.6; y: 21.6; skew-x: 24.1; skew-y: 23.6; }
        frame 52 { x: 41.3; y: 19.5; skew-x: 28.6; skew-y: 28.1; }
        frame 53 { x: 44.9; y: 17.7; skew-x: 32.8; skew-y: 32.6; }
        frame 54 { x: 48.5; y: 16.1; skew-x: 37.2; skew-y: 37.2; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { x: 41; y: 19.2; skew-x: 28.3; skew-y: 27.8; scale-x: 0.797; scale-y: 0.797; }
        frame 56 { x: 33.8; y: 23; skew-x: 19.5; skew-y: 18.6; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 27; y: 27.5; skew-x: 10.8; skew-y: 9.5; }
        frame 58 { x: 20.6; y: 32.6; skew-x: 2; skew-y: 0.3; }
        frame 59 { x: 19.5; y: 35.1; skew-x: 0; skew-y: -1.2; }
        frame 60 { x: 18.3; y: 37.5; skew-x: -1.5; skew-y: -3.2; }
        frame 61 { x: 21.7; y: 34.6; skew-x: 3; skew-y: 1.8; scale-x: 0.798; }
        frame 62 { x: 25.2; y: 31.9; skew-x: 7.6; skew-y: 6.8; scale-x: -10000; scale-y: 0.798; }
        frame 63 { x: 29; y: 29.3; skew-x: 12.3; skew-y: 11.8; scale-y: -10000; }
        frame 64 { x: 32.6; y: 27.1; skew-x: 17.1; skew-y: 17.1; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 35.4; y: 22.7; skew-x: 19.3; skew-y: 19.3; scale-x: 0.798; scale-y: 0.798; }
        frame 67 { x: 38.4; y: 18.2; skew-x: 21.8; skew-y: 21.8; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 41.3; y: 13.7; skew-x: 24.3; skew-y: 24.3; }
        frame 69 { x: 44.1; y: 9.5; skew-x: 26.7; skew-y: 26.7; scale-x: 0.799; scale-y: 0.799; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 41.5; y: 10.3; skew-x: 24.6; skew-y: 24.6; scale-x: 0.798; scale-y: 0.798; }
        frame 73 { x: 39; y: 11; skew-x: 22.6; skew-y: 22.6; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 36.5; y: 11.9; skew-x: 20.6; skew-y: 20.6; }
        frame 75 { x: 34; y: 12.6; skew-x: 18.8; skew-y: 18.8; }
        frame 76 { x: 31.6; y: 13.6; skew-x: 16.8; skew-y: 16.8; }
        frame 77 { x: 34.1; y: 12.7; skew-x: 18.8; skew-y: 18.8; }
        frame 78 { x: 36.5; y: 11.9; skew-x: 20.6; skew-y: 20.6; }
        frame 79 { x: 39.1; y: 11.1; skew-x: 22.6; skew-y: 22.6; }
        frame 80 { x: 41.6; y: 10.4; skew-x: 24.6; skew-y: 24.6; }
        frame 81 { x: 44.1; y: 9.5; skew-x: 26.7; skew-y: 26.7; scale-x: 0.799; scale-y: 0.799; }
        frame 82 { x: 46.9; y: 9.1; skew-x: 28.5; skew-y: 28.5; scale-x: 0.798; scale-y: 0.798; }
        frame 83 { x: 49.6; y: 8.6; skew-x: 30.3; skew-y: 30.3; scale-x: 0.797; scale-y: 0.797; }
        frame 84 { x: 52.3; y: 8.2; skew-x: 32.1; skew-y: 32.1; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 55; y: 7.8; skew-x: 33.9; skew-y: 33.9; }
        frame 86 { x: 57.9; y: 7.4; skew-x: 35.8; skew-y: 35.8; scale-x: 0.798; scale-y: 0.798; }
        frame 87 { x: 86.2; y: 19.5; skew-x: 52.9; skew-y: 52.9; scale-x: 0.797; scale-y: 0.797; }
        frame 88 { x: 114.1; y: 34.5; skew-x: 69.9; skew-y: 69.9; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 140.9; y: 52.2; skew-x: 86.9; skew-y: 86.9; scale-x: 0.798; scale-y: 0.798; }
        frame 90 { x: 165.7; y: 72.3; skew-x: 103.7; skew-y: 103.7; scale-x: 0.797; scale-y: 0.797; }
        frame 91 { x: 173.5; y: 84; skew-x: 111.1; skew-y: 111.1; scale-x: 0.796; scale-y: 0.796; }
        frame 92 { x: 180.8; y: 96.1; skew-x: 118.6; skew-y: 118.6; scale-x: 0.795; scale-y: 0.795; }
        frame 93 { x: 187.6; y: 108.3; skew-x: 126.1; skew-y: 126.1; scale-x: 0.796; scale-y: 0.796; }
        frame 94 { x: 187.5; y: 110.4; skew-x: 127.3; skew-y: 124.6; scale-x: 0.767; scale-y: -10000; }
        frame 95 { x: 187.3; y: 112.5; skew-x: 128.6; skew-y: 123.1; scale-x: 0.74; scale-y: 0.799; }
        frame 96 { x: 186.4; y: 110.4; skew-x: 127.3; skew-y: 124.6; scale-x: 0.767; scale-y: 0.796; }
        frame 97 { x: 185.6; y: 108.3; skew-x: 126.1; skew-y: 126.1; scale-x: 0.796; scale-y: -10000; }
        frame 98 { x: 187.1; y: 109.3; skew-x: 127.6; skew-y: 124.6; scale-x: -10000; }
        frame 99 { x: 188.6; y: 110.3; skew-x: 129.1; skew-y: 123.1; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 100;
        frame 0 { x: 55.4; y: -5.7; skew-x: 29.5; skew-y: 29.5; scale-x: 0.797; scale-y: 0.797; image: IMAGE_REANIM_ZOMBIE_DANCER__HEAD; }
        frame 1 { x: -10000; y: -6.2; skew-x: 29.4; skew-y: 29.4; scale-x: 0.796; scale-y: 0.796; image: none; }
        frame 2 { x: 55.5; y: -6.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -10000; y: -7.4; }
        frame 4 { x: 55.6; y: -8; skew-x: 29.5; skew-y: 29.5; scale-x: 0.797; scale-y: 0.797; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 55.5; y: -7.6; skew-x: 29.4; skew-y: 29.4; scale-x: 0.796; scale-y: 0.796; }
        frame 8 { x: -10000; y: -7.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 55.4; y: -6.9; }
        frame 10 { x: -10000; y: -6.6; skew-x: 29.5; skew-y: 29.5; scale-x: 0.797; scale-y: 0.797; }
        frame 11 { y: -6.9; skew-x: 29.4; skew-y: 29.4; scale-x: 0.796; scale-y: 0.796; }
        frame 12 { x: 55.5; y: -7.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -10000; y: -7.6; }
        frame 14 { x: 55.6; y: -8; skew-x: 29.5; skew-y: 29.5; scale-x: 0.797; scale-y: 0.797; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 55.5; y: -7.4; skew-x: 29.4; skew-y: 29.4; scale-x: 0.796; scale-y: 0.796; }
        frame 18 { x: -10000; y: -6.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 55.4; y: -6.2; }
        frame 20 { x: -10000; y: -5.7; skew-x: 29.5; skew-y: 29.5; scale-x: 0.797; scale-y: 0.797; }
        frame 21 { x: 29.3; y: -3; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 30.4; y: -4.5; skew-x: 10.6; skew-y: 10.6; }
        frame 23 { x: 31.7; y: -6; skew-x: 13.1; skew-y: 13.1; scale-x: 0.796; scale-y: 0.796; }
        frame 24 { x: 32.9; y: -7.4; skew-x: 15.5; skew-y: 15.5; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 34.4; y: -8.8; skew-x: 18.1; skew-y: 18.1; scale-x: 0.797; scale-y: 0.797; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 32.6; y: -7; skew-x: 14.8; skew-y: 14.8; scale-x: 0.796; scale-y: 0.796; }
        frame 30 { x: 31.1; y: -5; skew-x: 11.5; skew-y: 11.5; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 29.3; y: -3; skew-x: 8.3; skew-y: 8.3; scale-x: 0.797; scale-y: 0.797; }
        frame 32 { x: 20.1; y: 3; skew-x: 5; skew-y: 5; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 23.5; y: 0.7; skew-x: 8; skew-y: 7.8; scale-x: 0.798; scale-y: 0.801; }
        frame 34 { x: 26.9; y: -1.7; skew-x: 11; skew-y: 10.3; scale-x: 0.797; scale-y: 0.803; }
        frame 35 { x: 30.4; y: -3.9; skew-x: 14; skew-y: 13.1; scale-x: 0.796; scale-y: 0.806; }
        frame 36 { x: 33.9; y: -6.2; skew-x: 17; skew-y: 15.8; scale-x: 0.795; scale-y: 0.808; }
        frame 37 { x: 37.5; y: -8.2; skew-x: 20; skew-y: 18.6; scale-x: 0.794; scale-y: 0.811; }
        frame 38 { x: 41.3; y: -10.4; skew-x: 23.1; skew-y: 21.3; scale-x: 0.793; scale-y: 0.814; }
        frame 39 { x: 44.8; y: -12.4; skew-x: 26.1; skew-y: 24.1; scale-x: 0.794; scale-y: 0.817; }
        frame 40 { x: 33.6; y: -7.1; skew-x: 18.3; skew-y: 16.3; scale-x: 0.799; scale-y: 0.812; }
        frame 41 { x: 22.7; y: -1.6; skew-x: 10.8; skew-y: 8.5; scale-x: 0.806; scale-y: 0.808; }
        frame 42 { x: 12.1; y: 4.6; skew-x: 3.1; skew-y: 0.8; scale-x: 0.813; scale-y: 0.804; }
        frame 43 { x: 1.9; y: 11.3; skew-x: -4.3; skew-y: -6.9; scale-x: 0.82; scale-y: 0.8; }
        frame 44 { x: 0.1; y: 14.2; skew-x: -5.9; skew-y: -8.7; scale-x: -10000; scale-y: 0.799; }
        frame 45 { x: -1.6; y: 17.3; skew-x: -7.9; skew-y: -10.5; scale-y: 0.8; }
        frame 46 { x: 3.1; y: 13.5; skew-x: -3.9; skew-y: -6.5; scale-x: 0.817; scale-y: 0.801; }
        frame 47 { x: 8; y: 9.8; skew-x: -0.2; skew-y: -2.7; scale-x: 0.814; scale-y: 0.803; }
        frame 48 { x: 13; y: 6.3; skew-x: 3.3; skew-y: 0.8; scale-x: 0.811; scale-y: 0.805; }
        frame 49 { x: 18.2; y: 3; skew-x: 7; skew-y: 4.8; scale-x: 0.808; scale-y: 0.807; }
        frame 50 { x: 23.3; y: -0.4; skew-x: 10.8; skew-y: 8.6; scale-x: 0.805; scale-y: 0.809; }
        frame 51 { x: 28.7; y: -3.5; skew-x: 14.8; skew-y: 12.5; scale-x: 0.802; scale-y: 0.811; }
        frame 52 { x: 34; y: -6.6; skew-x: 18.5; skew-y: 16.3; scale-x: 0.799; scale-y: 0.813; }
        frame 53 { x: 39.4; y: -9.5; skew-x: 22.3; skew-y: 20.3; scale-x: 0.796; scale-y: 0.814; }
        frame 54 { x: 44.8; y: -12.4; skew-x: 26.1; skew-y: 24.1; scale-x: 0.794; scale-y: 0.817; }
        frame 55 { x: 33.6; y: -7.1; skew-x: 18.3; skew-y: 16.3; scale-x: 0.799; scale-y: 0.812; }
        frame 56 { x: 22.7; y: -1.6; skew-x: 10.8; skew-y: 8.5; scale-x: 0.806; scale-y: 0.808; }
        frame 57 { x: 12.1; y: 4.6; skew-x: 3.1; skew-y: 0.8; scale-x: 0.813; scale-y: 0.804; }
        frame 58 { x: 1.9; y: 11.3; skew-x: -4.3; skew-y: -6.9; scale-x: 0.82; scale-y: 0.8; }
        frame 59 { x: 0.1; y: 13.8; skew-x: -5.9; skew-y: -8.7; scale-x: -10000; scale-y: 0.799; }
        frame 60 { x: -1.6; y: 16.4; skew-x: -7.9; skew-y: -10.5; scale-y: 0.8; }
        frame 61 { x: 3.7; y: 12.9; skew-x: -4.5; skew-y: -6.4; scale-x: 0.814; scale-y: 0.799; }
        frame 62 { x: 9.2; y: 9.5; skew-x: -1.2; skew-y: -2.7; scale-x: 0.809; scale-y: -10000; }
        frame 63 { x: 14.5; y: 6.3; skew-x: 1.8; skew-y: 1; scale-x: 0.804; }
        frame 64 { x: 20.1; y: 3; skew-x: 5; skew-y: 5; scale-x: 0.799; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; cel: -1; }
        frame 66 { cel: -10000; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 100;
        frame 0 { x: 42.7; y: 25.9; skew-x: 12.7; skew-y: 12.7; scale-x: 0.797; scale-y: 0.797; image: IMAGE_REANIM_ZOMBIE_JAW; }
        frame 1 { x: 42.5; y: 25.7; skew-x: 12.5; skew-y: 12.5; scale-x: 0.796; scale-y: 0.796; image: none; }
        frame 2 { x: 42.3; y: 25.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 42.1; y: 25.2; }
        frame 4 { x: 42; y: 24.9; skew-x: 12.7; skew-y: 12.7; scale-x: 0.797; scale-y: 0.797; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 42.4; y: 24.6; skew-x: 12.5; skew-y: 12.5; scale-x: 0.796; scale-y: 0.796; }
        frame 8 { x: 42.9; y: 24.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: -10000; y: 25.2; }
        frame 10 { x: 42.7; y: 25.9; skew-x: 12.7; skew-y: 12.7; scale-x: 0.797; scale-y: 0.797; }
        frame 11 { x: 42.5; y: 25.7; skew-x: 12.5; skew-y: 12.5; scale-x: 0.796; scale-y: 0.796; }
        frame 12 { x: 42.3; y: 25.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 42.1; y: 25.2; }
        frame 14 { x: 42; y: 24.9; skew-x: 12.7; skew-y: 12.7; scale-x: 0.797; scale-y: 0.797; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 42.4; y: 24.6; skew-x: 12.5; skew-y: 12.5; scale-x: 0.796; scale-y: 0.796; }
        frame 18 { x: 42.9; y: 24.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -10000; y: 25.2; }
        frame 20 { x: 42.7; y: 25.9; skew-x: 12.7; skew-y: 12.7; scale-x: 0.797; scale-y: 0.797; }
        frame 21 { x: 33.4; y: 28; skew-x: 5.3; skew-y: 5.3; scale-x: 0.796; scale-y: 0.796; }
        frame 22 { x: 32.1; y: 27; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 30.7; y: 26; skew-x: 4.8; skew-y: 4.8; }
        frame 24 { x: 29.3; y: 25; skew-x: 4.6; skew-y: 4.6; scale-x: 0.795; scale-y: 0.795; }
        frame 25 { x: 28; y: 23.8; skew-x: 4.5; skew-y: 4.5; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 29 { x: 29.7; y: 24.1; skew-x: 4.8; skew-y: 4.8; scale-x: 0.796; scale-y: 0.796; }
        frame 30 { x: 31.6; y: 26; skew-x: 5; skew-y: 5; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 33.4; y: 28; skew-x: 5.3; skew-y: 5.3; }
        frame 32 { x: 24; y: 34; skew-x: 5; skew-y: 5; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 25.5; y: 32.1; skew-x: 6.8; skew-y: 7.1; scale-x: 0.798; scale-y: 0.798; }
        frame 34 { x: 27; y: 30.1; skew-x: 8.8; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 28.6; y: 28.3; skew-x: 10.8; skew-y: 11.5; scale-y: 0.797; }
        frame 36 { x: 30.1; y: 26.5; skew-x: 12.6; skew-y: 13.8; scale-x: 0.797; scale-y: -10000; }
        frame 37 { x: 31.5; y: 24.6; skew-x: 14.5; skew-y: 16; scale-x: -10000; }
        frame 38 { x: 33; y: 22.8; skew-x: 16.3; skew-y: 18.1; scale-y: 0.796; }
        frame 39 { x: 34.8; y: 21; skew-x: 18.4; skew-y: 20.4; scale-y: 0.797; }
        frame 40 { x: 29.1; y: 24.7; skew-x: 15.6; skew-y: 17.8; scale-x: 0.803; scale-y: 0.792; }
        frame 41 { x: 23.5; y: 28.5; skew-x: 12.8; skew-y: 15.3; scale-x: 0.809; scale-y: 0.788; }
        frame 42 { x: 18; y: 32.4; skew-x: 10.3; skew-y: 13; scale-x: 0.816; scale-y: 0.784; }
        frame 43 { x: 12.5; y: 36.2; skew-x: 7.6; skew-y: 10.5; scale-x: 0.822; scale-y: 0.78; }
        frame 44 { x: 11.4; y: 38.3; skew-x: 5.8; skew-y: 8.6; scale-x: -10000; scale-y: 0.779; }
        frame 45 { x: 10.4; y: 40.4; skew-x: 4; skew-y: 7; scale-y: 0.78; }
        frame 46 { x: 13; y: 38.3; skew-x: 5.5; skew-y: 8.3; scale-x: 0.819; scale-y: 0.781; }
        frame 47 { x: 15.7; y: 36.4; skew-x: 7.1; skew-y: 9.8; scale-x: 0.816; scale-y: 0.783; }
        frame 48 { x: 18.4; y: 34.3; skew-x: 8.8; skew-y: 11.3; scale-x: 0.813; scale-y: 0.785; }
        frame 49 { x: 21.1; y: 32.5; skew-x: 10.3; skew-y: 12.8; scale-x: 0.811; scale-y: 0.787; }
        frame 50 { x: 23.8; y: 30.4; skew-x: 12; skew-y: 14.3; scale-x: 0.808; scale-y: 0.789; }
        frame 51 { x: 26.6; y: 28.5; skew-x: 13.5; skew-y: 15.8; scale-x: 0.805; scale-y: 0.79; }
        frame 52 { x: 29.4; y: 26.6; skew-x: 15.1; skew-y: 17.3; scale-x: 0.802; scale-y: 0.792; }
        frame 53 { x: 32; y: 24.5; skew-x: 16.8; skew-y: 18.8; scale-x: 0.799; scale-y: 0.794; }
        frame 54 { x: 34.8; y: 22.8; skew-x: 18.4; skew-y: 20.4; scale-x: 0.797; scale-y: 0.797; }
        frame 55 { x: 28.9; y: 26.5; skew-x: 15; skew-y: 17.3; scale-x: 0.803; scale-y: 0.792; }
        frame 56 { x: 23.3; y: 30.3; skew-x: 11.8; skew-y: 14.3; scale-x: 0.809; scale-y: 0.788; }
        frame 57 { x: 17.6; y: 34; skew-x: 8.5; skew-y: 11.3; scale-x: 0.816; scale-y: 0.784; }
        frame 58 { x: 12; y: 37.9; skew-x: 5.3; skew-y: 8.3; scale-x: 0.822; scale-y: 0.78; }
        frame 59 { x: 11.1; y: 39.1; skew-x: 4.5; skew-y: 7.5; scale-x: -10000; scale-y: 0.779; }
        frame 60 { x: 10.4; y: 40.4; skew-x: 4; skew-y: 7; scale-y: 0.78; }
        frame 61 { x: 13.8; y: 38.7; skew-x: 4.1; skew-y: 6.3; scale-x: 0.816; scale-y: 0.784; }
        frame 62 { x: 17.2; y: 37.1; skew-x: 4.5; skew-y: 5.8; scale-x: 0.81; scale-y: 0.789; }
        frame 63 { x: 20.7; y: 35.5; skew-x: 4.8; skew-y: 5.5; scale-x: 0.804; scale-y: 0.794; }
        frame 64 { x: 24; y: 34; skew-x: 5; skew-y: 5; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 66 { cel: -10000; }
    }
    Track {
        source-name: "anim_earing";
        frame-count: 100;
        frame 0 { x: 71.5; y: 28.9; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_DANCER_EARING; }
        frame 1 { x: 71.3; y: 28.8; skew-x: -4.9; skew-y: -4.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 71.2; y: 28.9; skew-x: -9.9; skew-y: -9.9; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: 71; y: 29.1; skew-x: -14.9; skew-y: -14.9; scale-x: -10000; scale-y: -10000; }
        frame 4 { y: 29.2; skew-x: -19.9; skew-y: -19.9; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { x: 70.9; y: 29.4; skew-x: -25; skew-y: -25; scale-x: 0.799; scale-y: 0.799; }
        frame 6 { x: 71; y: 29.1; skew-x: -18.7; skew-y: -18.7; scale-x: 0.798; scale-y: 0.798; }
        frame 7 { x: 71.1; y: 29; skew-x: -12.4; skew-y: -12.4; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 71.3; y: 28.8; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 71.5; y: 28.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 10 { x: 71.3; y: -10000; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 71.2; skew-x: -8.2; skew-y: -8.2; scale-x: 0.799; scale-y: 0.799; }
        frame 12 { x: 71.1; y: 29.1; skew-x: -12.4; skew-y: -12.4; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 71; y: -10000; skew-x: -16.5; skew-y: -16.5; }
        frame 14 { x: -10000; y: 29.3; skew-x: -20.7; skew-y: -20.7; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 70.9; y: 29.4; skew-x: -25; skew-y: -25; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: -10000; y: 29.2; skew-x: -19.9; skew-y: -19.9; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { x: 71; y: 29.1; skew-x: -14.9; skew-y: -14.9; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: 71.2; y: 28.9; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 71.3; y: 28.8; skew-x: -4.9; skew-y: -4.9; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { x: 71.5; y: 28.9; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 59; y: 22.1; skew-x: -10000; skew-y: -10000; }
        frame 22 { x: 59.1; y: 21.6; skew-x: 3; skew-y: 3; }
        frame 23 { x: -10000; y: 21.2; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { x: 59.3; y: 20.8; skew-x: 9.1; skew-y: 9.1; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 59.4; y: 20.4; skew-x: 12.3; skew-y: 12.3; }
        frame 26 { x: 59.8; y: 20.2; skew-x: 17.8; skew-y: 17.8; scale-x: 0.798; scale-y: 0.798; }
        frame 27 { x: 60.3; y: 20; skew-x: 23.6; skew-y: 23.6; scale-x: 0.799; scale-y: 0.799; }
        frame 28 { x: 59.9; y: 20.4; skew-x: 17.6; skew-y: 17.6; scale-x: 0.798; scale-y: 0.798; }
        frame 29 { x: 59.5; y: 20.9; skew-x: 11.8; skew-y: 11.8; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: 59.3; y: 21.5; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 59; y: 22.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 32 { x: 51.5; y: 25.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 53.3; y: 25; }
        frame 34 { x: 55.1; y: 24.4; }
        frame 35 { x: 56.9; y: 23.8; }
        frame 36 { x: 58.7; y: 23.2; }
        frame 37 { x: 60.5; y: 22.6; }
        frame 38 { x: 62.3; y: 22; }
        frame 39 { x: 64.1; y: 21.4; }
        frame 40 { x: 57.9; y: 23; skew-x: 1.8; skew-y: 1.8; }
        frame 41 { x: 51.5; y: 24.6; skew-x: 3.5; skew-y: 3.5; }
        frame 42 { x: 45.3; y: 26.3; skew-x: 5.3; skew-y: 5.3; scale-x: 0.799; scale-y: 0.799; }
        frame 43 { x: 39; y: 27.9; skew-x: 7.3; skew-y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 44 { x: 37.9; y: 29.6; skew-x: 1.8; skew-y: 1.8; scale-x: 0.799; scale-y: 0.799; }
        frame 45 { x: 36.6; y: 31.4; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 39.6; y: 30.7; skew-x: -10000; skew-y: -10000; }
        frame 47 { x: 42.6; y: 29.9; }
        frame 48 { x: 45.5; y: 29; }
        frame 49 { x: 48.4; y: 28.2; }
        frame 50 { x: 51.4; y: 27.1; }
        frame 51 { x: 54.4; y: 26; }
        frame 52 { x: 57.4; y: 24.9; }
        frame 53 { x: 60.4; y: 23.8; }
        frame 54 { x: 63.4; y: 22.7; }
        frame 55 { x: 57.3; y: 24; }
        frame 56 { x: 51.1; y: 25.2; }
        frame 57 { x: 45; y: 26.5; }
        frame 58 { x: 38.8; y: 27.7; }
        frame 59 { x: 37.6; y: 29.6; }
        frame 60 { x: 36.4; y: 31.4; }
        frame 61 { x: 40; y: 30.5; }
        frame 62 { x: 43.5; y: 29.6; }
        frame 63 { x: 46.9; y: 28.7; }
        frame 64 { x: 50.4; y: 27.8; }
        frame 65 { x: -10000; y: -10000; cel: -1; }
        frame 66 { cel: -10000; }
    }
    Track {
        source-name: "anim_hair";
        frame-count: 100;
        frame 0 { x: 62.8; y: -21.1; skew-x: 29.5; skew-y: 29.5; scale-x: 0.797; scale-y: 0.797; image: IMAGE_REANIM_ZOMBIE_DANCER_HAIR; }
        frame 1 { x: 62.6; y: -21; skew-x: 29.3; skew-y: 29.3; scale-x: 0.796; scale-y: 0.787; image: none; }
        frame 2 { x: 62.5; y: -21.1; skew-x: 29.4; skew-y: 29.4; scale-x: -10000; scale-y: 0.779; }
        frame 3 { x: 62.8; y: -22.1; skew-x: 29.3; skew-y: 29.3; scale-y: 0.787; }
        frame 4 { x: 63.3; y: -23.1; skew-x: 29.5; skew-y: 29.5; scale-x: 0.797; scale-y: 0.797; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 64.2; y: -23.5; skew-x: 29.3; skew-y: 29.3; scale-x: 0.783; scale-y: 0.818; }
        frame 8 { x: 64.9; y: -24; skew-x: 29.4; skew-y: 29.4; scale-x: 0.772; scale-y: 0.841; }
        frame 9 { x: 63.9; y: -23; skew-x: 29.3; skew-y: 29.3; scale-x: 0.783; scale-y: 0.818; }
        frame 10 { x: 62.8; y: -22; skew-x: 29.5; skew-y: 29.5; scale-x: 0.797; scale-y: 0.797; }
        frame 11 { x: 62.5; y: -21.6; skew-x: 29.3; skew-y: 29.3; scale-x: 0.796; scale-y: 0.787; }
        frame 12 { x: 62.3; y: -21.3; skew-x: 29.4; skew-y: 29.4; scale-x: -10000; scale-y: 0.779; }
        frame 13 { x: 62.8; y: -22.2; skew-x: 29.3; skew-y: 29.3; scale-y: 0.787; }
        frame 14 { x: 63.3; y: -23.1; skew-x: 29.5; skew-y: 29.5; scale-x: 0.797; scale-y: 0.797; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 64.2; y: -23.5; skew-x: 29.3; skew-y: 29.3; scale-x: 0.783; scale-y: 0.818; }
        frame 18 { x: 64.9; y: -24; skew-x: 29.4; skew-y: 29.4; scale-x: 0.772; scale-y: 0.841; }
        frame 19 { x: 63.9; y: -22.5; skew-x: 29.3; skew-y: 29.3; scale-x: 0.783; scale-y: 0.818; }
        frame 20 { x: 62.8; y: -21.1; skew-x: 29.5; skew-y: 29.5; scale-x: 0.797; scale-y: 0.797; }
        frame 21 { x: 30.4; y: -19.5; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 32.5; y: -21; skew-x: 10.8; skew-y: 10.8; }
        frame 23 { x: 34.8; y: -22.4; skew-x: 13.3; skew-y: 13.3; scale-x: 0.796; scale-y: 0.796; }
        frame 24 { x: 37; y: -23.9; skew-x: 16; skew-y: 16; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 39.4; y: -25.1; skew-x: 18.6; skew-y: 18.6; scale-x: 0.797; scale-y: 0.797; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 36.2; y: -23.4; skew-x: 15; skew-y: 15; scale-x: 0.796; scale-y: 0.796; }
        frame 30 { x: 33.3; y: -21.4; skew-x: 11.6; skew-y: 11.6; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 30.4; y: -19.5; skew-x: 8.3; skew-y: 8.3; scale-x: 0.797; scale-y: 0.797; }
        frame 32 { x: 20.8; y: -13.7; skew-x: 5; skew-y: 5; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 25; y: -16; skew-x: 8; skew-y: 7.8; scale-x: 0.798; scale-y: 0.801; }
        frame 34 { x: 29.1; y: -18.3; skew-x: 11; skew-y: 10.3; scale-x: 0.797; scale-y: 0.803; }
        frame 35 { x: 33.5; y: -20.6; skew-x: 14; skew-y: 13.1; scale-x: 0.796; scale-y: 0.806; }
        frame 36 { x: 37.8; y: -22.6; skew-x: 17; skew-y: 15.8; scale-x: 0.795; scale-y: 0.808; }
        frame 37 { x: 42.3; y: -24.7; skew-x: 20; skew-y: 18.6; scale-x: 0.794; scale-y: 0.811; }
        frame 38 { x: 46.6; y: -26.6; skew-x: 23.1; skew-y: 21.3; scale-x: 0.793; scale-y: 0.814; }
        frame 39 { x: 51.2; y: -28.5; skew-x: 26.1; skew-y: 24.1; scale-x: 0.794; scale-y: 0.817; }
        frame 40 { x: 37.6; y: -23.7; skew-x: 18.3; skew-y: 16.3; scale-x: 0.799; scale-y: 0.812; }
        frame 41 { x: 24.3; y: -18.3; skew-x: 10.8; skew-y: 8.5; scale-x: 0.806; scale-y: 0.808; }
        frame 42 { x: 11.4; y: -12.1; skew-x: 3.1; skew-y: 0.8; scale-x: 0.813; scale-y: 0.804; }
        frame 43 { x: -0.8; y: -5.5; skew-x: -4.3; skew-y: -6.9; scale-x: 0.82; scale-y: 0.8; }
        frame 44 { x: -3.1; y: -1.9; skew-x: -5.9; skew-y: -8.7; scale-x: -10000; scale-y: 0.799; }
        frame 45 { x: -5.5; y: 1.5; skew-x: -7.9; skew-y: -10.5; scale-y: 0.8; }
        frame 46 { x: 0.5; y: -2.4; skew-x: -3.9; skew-y: -6.5; scale-x: 0.817; scale-y: 0.801; }
        frame 47 { x: 6.4; y: -6.2; skew-x: -0.2; skew-y: -2.7; scale-x: 0.814; scale-y: 0.803; }
        frame 48 { x: 12.4; y: -9.8; skew-x: 3.3; skew-y: 0.8; scale-x: 0.811; scale-y: 0.805; }
        frame 49 { x: 18.7; y: -13.3; skew-x: 7; skew-y: 4.8; scale-x: 0.808; scale-y: 0.807; }
        frame 50 { x: 25; y: -16.7; skew-x: 10.8; skew-y: 8.6; scale-x: 0.805; scale-y: 0.809; }
        frame 51 { x: 31.6; y: -20; skew-x: 14.8; skew-y: 12.5; scale-x: 0.802; scale-y: 0.811; }
        frame 52 { x: 38; y: -23.1; skew-x: 18.5; skew-y: 16.3; scale-x: 0.799; scale-y: 0.813; }
        frame 53 { x: 44.6; y: -25.9; skew-x: 22.3; skew-y: 20.3; scale-x: 0.796; scale-y: 0.814; }
        frame 54 { x: 51.2; y: -28.5; skew-x: 26.1; skew-y: 24.1; scale-x: 0.794; scale-y: 0.817; }
        frame 55 { x: 37.6; y: -23.7; skew-x: 18.3; skew-y: 16.3; scale-x: 0.799; scale-y: 0.812; }
        frame 56 { x: 24.3; y: -18.3; skew-x: 10.8; skew-y: 8.5; scale-x: 0.806; scale-y: 0.808; }
        frame 57 { x: 11.4; y: -12.1; skew-x: 3.1; skew-y: 0.8; scale-x: 0.813; scale-y: 0.804; }
        frame 58 { x: -0.8; y: -5.5; skew-x: -4.3; skew-y: -6.9; scale-x: 0.82; scale-y: 0.8; }
        frame 59 { x: -3.1; y: -1.9; skew-x: -5.9; skew-y: -8.7; scale-x: -10000; scale-y: 0.799; }
        frame 60 { x: -5.5; y: 1.5; skew-x: -7.9; skew-y: -10.5; scale-y: 0.8; }
        frame 61 { x: 1; y: -2.5; skew-x: -4.5; skew-y: -6.4; scale-x: 0.814; scale-y: 0.799; }
        frame 62 { x: 7.5; y: -6.5; skew-x: -1.2; skew-y: -2.7; scale-x: 0.809; scale-y: -10000; }
        frame 63 { x: 14; y: -10.2; skew-x: 1.8; skew-y: 1; scale-x: 0.804; }
        frame 64 { x: 20.8; y: -13.7; skew-x: 5; skew-y: 5; scale-x: 0.799; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; cel: -1; }
        frame 66 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_Jackson_colar";
        frame-count: 100;
        frame 0 { x: 71.8; y: 34.8; skew-x: 44.5; skew-y: 44.5; scale-x: 0.798; scale-y: 0.798; image: IMAGE_REANIM_ZOMBIE_DANCER_COLAR; }
        frame 1 { x: 72; y: 34.4; skew-x: 44.6; skew-y: 44.6; scale-x: 0.797; scale-y: 0.797; image: none; }
        frame 2 { x: 72.1; y: 33.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 72.2; y: 33.4; }
        frame 4 { x: 72.3; y: 32.8; skew-x: 44.5; skew-y: 44.5; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 72.2; y: 33.2; skew-x: 44.6; skew-y: 44.6; scale-x: 0.797; scale-y: 0.797; }
        frame 8 { x: 72; y: 33.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 71.9; y: 33.8; }
        frame 10 { x: 71.8; y: 33.9; skew-x: 44.5; skew-y: 44.5; scale-x: 0.798; scale-y: 0.798; }
        frame 11 { x: 72; y: 33.7; skew-x: 44.6; skew-y: 44.6; scale-x: 0.797; scale-y: 0.797; }
        frame 12 { x: 72.1; y: 33.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 72.2; y: 33.1; }
        frame 14 { x: 72.3; y: 32.8; skew-x: 44.5; skew-y: 44.5; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 72.2; y: 33.4; skew-x: 44.6; skew-y: 44.6; scale-x: 0.797; scale-y: 0.797; }
        frame 18 { x: 72; y: 33.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 71.9; y: 34.4; }
        frame 20 { x: 71.8; y: 34.8; skew-x: 44.5; skew-y: 44.5; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 56.1; y: 29.7; skew-x: 22.4; skew-y: 24.3; scale-x: 0.829; scale-y: 0.804; }
        frame 22 { x: 56.6; y: 29.3; skew-x: 25.1; skew-y: 26.6; scale-x: 0.82; scale-y: 0.801; }
        frame 23 { x: 57; y: 28.9; skew-x: 28; skew-y: 28.8; scale-x: 0.812; scale-y: 0.799; }
        frame 24 { x: 57.5; y: 28.4; skew-x: 30.8; skew-y: 31.3; scale-x: 0.804; scale-y: 0.798; }
        frame 25 { x: 57.9; y: 28.1; skew-x: 33.6; skew-y: 33.6; scale-x: 0.797; scale-y: 0.797; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 57.4; y: 28.6; skew-x: 29.8; skew-y: 30.5; scale-x: 0.807; scale-y: 0.798; }
        frame 30 { x: 56.7; y: 29.2; skew-x: 26.1; skew-y: 27.3; scale-x: 0.817; scale-y: 0.801; }
        frame 31 { x: 56.1; y: 29.7; skew-x: 22.4; skew-y: 24.3; scale-x: 0.829; scale-y: 0.804; }
        frame 32 { x: 50.6; y: 33.7; skew-x: 17.1; skew-y: 17.1; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 52.4; y: 32.8; skew-x: 19.8; skew-y: 19.8; scale-x: 0.798; scale-y: 0.798; }
        frame 34 { x: 54.1; y: 31.9; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 55.8; y: 31.1; skew-x: 25.6; skew-y: 25.6; }
        frame 36 { x: 57.7; y: 30.5; skew-x: 28.6; skew-y: 28.6; }
        frame 37 { x: 59.5; y: 29.7; skew-x: 31.3; skew-y: 31.3; scale-x: 0.797; scale-y: 0.797; }
        frame 38 { x: 61.3; y: 29; skew-x: 34.3; skew-y: 34.3; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 63; y: 28.5; skew-x: 37.2; skew-y: 37.2; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 56.9; y: 29.1; skew-x: 27.8; skew-y: 27.8; scale-x: 0.797; scale-y: 0.797; }
        frame 41 { x: 51; y: 30.4; skew-x: 18.6; skew-y: 18.6; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 45.2; y: 32.2; skew-x: 9.5; skew-y: 9.5; }
        frame 43 { x: 39.6; y: 34.6; skew-x: 0.3; skew-y: 0.3; }
        frame 44 { x: 38.5; y: 36.4; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: 37.4; y: 38.4; skew-x: -3.2; skew-y: -3.2; }
        frame 46 { x: 40; y: 36.7; skew-x: 1.1; skew-y: 1.1; }
        frame 47 { x: 42.7; y: 35.1; skew-x: 5.6; skew-y: 5.6; }
        frame 48 { x: 45.5; y: 33.8; skew-x: 10.1; skew-y: 10.1; }
        frame 49 { x: 48.4; y: 32.6; skew-x: 14.6; skew-y: 14.6; }
        frame 50 { x: 51.2; y: 31.6; skew-x: 19.1; skew-y: 19.1; }
        frame 51 { x: 54.1; y: 30.5; skew-x: 23.6; skew-y: 23.6; }
        frame 52 { x: 57; y: 29.8; skew-x: 28.1; skew-y: 28.1; }
        frame 53 { x: 60; y: 29.1; skew-x: 32.6; skew-y: 32.6; }
        frame 54 { x: 63; y: 28.5; skew-x: 37.2; skew-y: 37.2; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { x: 56.9; y: 29.1; skew-x: 27.8; skew-y: 27.8; scale-x: 0.797; scale-y: 0.797; }
        frame 56 { x: 51; y: 30.4; skew-x: 18.6; skew-y: 18.6; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 45.2; y: 32.2; skew-x: 9.5; skew-y: 9.5; }
        frame 58 { x: 39.6; y: 34.6; skew-x: 0.3; skew-y: 0.3; }
        frame 59 { x: 38.5; y: 36.4; skew-x: -1.2; skew-y: -1.2; }
        frame 60 { x: 37.4; y: 38.4; skew-x: -3.2; skew-y: -3.2; }
        frame 61 { x: 40.5; y: 37; skew-x: 1.8; skew-y: 1.8; }
        frame 62 { x: 43.8; y: 35.6; skew-x: 6.8; skew-y: 6.8; scale-x: 0.798; scale-y: 0.798; }
        frame 63 { x: 47.2; y: 34.6; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 50.6; y: 33.7; skew-x: 17.1; skew-y: 17.1; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 53.1; y: 30.1; skew-x: 19.3; skew-y: 19.3; scale-x: 0.798; scale-y: 0.798; }
        frame 67 { x: 55.7; y: 26.3; skew-x: 21.8; skew-y: 21.8; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 58.2; y: 22.6; skew-x: 24.3; skew-y: 24.3; }
        frame 69 { x: 60.7; y: 19; skew-x: 26.7; skew-y: 26.7; scale-x: 0.799; scale-y: 0.799; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 58.4; y: 19.1; skew-x: 24.6; skew-y: 24.6; scale-x: 0.798; scale-y: 0.798; }
        frame 73 { x: 56.1; y: 19.3; skew-x: 22.6; skew-y: 22.6; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 53.9; y: 19.6; skew-x: 20.6; skew-y: 20.6; }
        frame 75 { x: 51.8; y: 19.8; skew-x: 18.8; skew-y: 18.8; }
        frame 76 { x: 49.4; y: 20; skew-x: 16.8; skew-y: 16.8; }
        frame 77 { x: 51.6; y: 19.8; skew-x: 18.8; skew-y: 18.8; }
        frame 78 { x: 53.9; y: 19.6; skew-x: 20.6; skew-y: 20.6; }
        frame 79 { x: 56.1; y: 19.4; skew-x: 22.6; skew-y: 22.6; }
        frame 80 { x: 58.5; y: 19.2; skew-x: 24.6; skew-y: 24.6; }
        frame 81 { x: 60.7; y: 19; skew-x: 26.7; skew-y: 26.7; scale-x: 0.799; scale-y: 0.799; }
        frame 82 { x: 63.1; skew-x: 28.5; skew-y: 28.5; scale-x: 0.798; scale-y: 0.798; }
        frame 83 { x: 65.6; y: 19.1; skew-x: 30.3; skew-y: 30.3; scale-x: 0.797; scale-y: 0.797; }
        frame 84 { x: 67.9; y: 19.2; skew-x: 32.1; skew-y: 32.1; scale-x: -10000; scale-y: -10000; }
        frame 85 { x: 70.3; y: 19.4; skew-x: 33.9; skew-y: 33.9; }
        frame 86 { x: 72.7; y: -10000; skew-x: 35.8; skew-y: 35.8; scale-x: 0.798; scale-y: 0.798; }
        frame 87 { x: 96.5; y: 34.6; skew-x: 52.9; skew-y: 52.9; scale-x: 0.797; scale-y: 0.797; }
        frame 88 { x: 119.5; y: 51.8; skew-x: 69.9; skew-y: 69.9; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 141.2; y: 70.6; skew-x: 86.9; skew-y: 86.9; scale-x: 0.798; scale-y: 0.798; }
        frame 90 { x: 161.3; y: 90.6; skew-x: 103.7; skew-y: 103.7; scale-x: 0.797; scale-y: 0.797; }
        frame 91 { x: 166.4; y: 101.3; skew-x: 111.1; skew-y: 111.1; scale-x: 0.796; scale-y: 0.796; }
        frame 92 { x: 171.1; y: 112.2; skew-x: 118.6; skew-y: 118.6; scale-x: 0.795; scale-y: 0.795; }
        frame 93 { x: 175.4; y: 123.1; skew-x: 126.1; skew-y: 126.1; scale-x: 0.796; scale-y: 0.796; }
        frame 94 { x: 175.5; y: 124.3; skew-x: 127.6; skew-y: 124.6; scale-x: 0.783; scale-y: -10000; }
        frame 95 { x: -10000; y: 125.6; skew-x: 129.2; skew-y: 123.1; scale-x: 0.773; scale-y: 0.799; }
        frame 96 { x: 174.4; y: 124.3; skew-x: 127.6; skew-y: 124.6; scale-x: 0.783; scale-y: 0.796; }
        frame 97 { x: 173.4; y: 123.1; skew-x: 126.1; skew-y: 126.1; scale-x: 0.796; scale-y: -10000; }
        frame 98 { x: 174.6; y: 123.8; skew-x: 127.6; skew-y: 124.6; scale-x: -10000; }
        frame 99 { x: 175.7; y: 124.5; skew-x: 129.1; skew-y: 123.1; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "Zombie_Jackson_outerarm_upper";
        frame-count: 100;
        frame 0 { x: 79.2; y: 49.9; skew-x: 133; skew-y: 123.5; scale-x: 0.754; scale-y: 0.659; image: IMAGE_REANIM_ZOMBIE_DANCER_OUTERARM_UPPER; }
        frame 1 { x: 78.4; y: 49.1; skew-x: 129.6; skew-y: 123.1; scale-x: 0.744; scale-y: 0.686; image: none; }
        frame 2 { x: 77.7; y: 48.5; skew-x: 126.4; skew-y: 122.9; scale-x: 0.735; scale-y: 0.714; }
        frame 3 { x: 76.8; y: 47.8; skew-x: 123.1; skew-y: 122.6; scale-x: 0.726; scale-y: 0.743; }
        frame 4 { x: 76.2; y: 47; skew-x: 119.9; skew-y: 122.4; scale-x: 0.718; scale-y: 0.772; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 76.7; y: 47.3; skew-x: 123.1; skew-y: 122.6; scale-x: 0.726; scale-y: 0.743; }
        frame 8 { x: 77.4; y: 47.7; skew-x: 126.4; skew-y: 122.9; scale-x: 0.735; scale-y: 0.714; }
        frame 9 { x: 78.1; y: 48.1; skew-x: 129.6; skew-y: 123.1; scale-x: 0.744; scale-y: 0.686; }
        frame 10 { x: 78.5; y: 48.9; skew-x: 133; skew-y: 123.5; scale-x: 0.754; scale-y: 0.659; }
        frame 11 { x: 77.8; y: 48.4; skew-x: 129.6; skew-y: 123.1; scale-x: 0.744; scale-y: 0.686; }
        frame 12 { x: 77.3; y: 48; skew-x: 126.4; skew-y: 122.9; scale-x: 0.735; scale-y: 0.714; }
        frame 13 { x: 76.6; y: 47.5; skew-x: 123.1; skew-y: 122.6; scale-x: 0.726; scale-y: 0.743; }
        frame 14 { x: 76.2; y: 47; skew-x: 119.9; skew-y: 122.4; scale-x: 0.718; scale-y: 0.772; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 76.9; y: 47.5; skew-x: 123.1; skew-y: 122.6; scale-x: 0.726; scale-y: 0.743; }
        frame 18 { x: 77.8; y: 48.2; skew-x: 126.4; skew-y: 122.9; scale-x: 0.735; scale-y: 0.714; }
        frame 19 { x: 78.6; y: 48.9; skew-x: 129.6; skew-y: 123.1; scale-x: 0.744; scale-y: 0.686; }
        frame 20 { x: 79.2; y: 49.9; skew-x: 133; skew-y: 123.5; scale-x: 0.754; scale-y: 0.659; }
        frame 21 { x: 51.6; y: 41; skew-x: 0.2; skew-y: 14; scale-x: 0.793; scale-y: 0.816; }
        frame 22 { x: 55.1; y: 37.2; skew-x: 22.1; skew-y: 35.9; scale-x: 0.792; scale-y: 0.815; }
        frame 23 { x: 58; y: 36; skew-x: 44.1; skew-y: 57.9; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 69.4; y: 39.9; skew-x: 113.9; skew-y: 99.9; scale-x: 0.823; scale-y: 0.84; }
        frame 25 { x: 71.1; y: 44.3; skew-x: 137.7; skew-y: 125.5; scale-x: 0.806; scale-y: 0.865; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 69.4; y: 39.9; skew-x: 113.9; skew-y: 99.9; scale-x: 0.823; scale-y: 0.84; }
        frame 30 { x: 55.1; y: 37.2; skew-x: 22.1; skew-y: 35.9; scale-x: 0.792; scale-y: 0.815; }
        frame 31 { x: 51.6; y: 41; skew-x: 0.2; skew-y: 14; scale-x: 0.793; scale-y: 0.816; }
        frame 32 { x: 47.3; y: 42.1; skew-x: 9.3; skew-y: 9.3; scale-x: 0.799; scale-y: 0.799; }
        frame 33 { x: 49.9; y: 40; skew-x: 17.6; skew-y: 17.6; scale-x: 0.797; scale-y: 0.797; }
        frame 34 { x: 52.7; y: 38.5; skew-x: 26.1; skew-y: 26.1; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 55.5; y: 37.3; skew-x: 34.4; skew-y: 34.4; scale-x: 0.796; scale-y: 0.796; }
        frame 36 { x: 58.4; y: 36.7; skew-x: 42.9; skew-y: 42.9; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 63.8; y: 34.2; skew-x: 68.8; skew-y: 50.1; scale-x: 0.762; scale-y: 0.8; }
        frame 38 { x: 65.4; y: 34; skew-x: 75; skew-y: 57.2; scale-x: 0.782; scale-y: 0.804; }
        frame 39 { x: 66.7; y: 34.1; skew-x: 81; skew-y: 64.3; scale-x: 0.803; scale-y: 0.811; }
        frame 40 { x: 62; y: 34.9; skew-x: 72.2; skew-y: 59.6; scale-x: 0.8; scale-y: 0.806; }
        frame 41 { x: 57.1; y: 35.9; skew-x: 63.2; skew-y: 54.9; scale-x: 0.798; scale-y: 0.802; }
        frame 42 { x: 52.4; y: 37.2; skew-x: 54.4; skew-y: 50.1; scale-x: 0.796; scale-y: 0.798; }
        frame 43 { x: 47.6; y: 38.9; skew-x: 45.4; skew-y: 45.4; scale-x: 0.795; scale-y: 0.795; }
        frame 44 { x: 46.9; y: 40.5; skew-x: 41.9; skew-y: 39.9; scale-x: 0.735; scale-y: 0.794; }
        frame 45 { x: 46.3; y: 41.9; skew-x: 38.5; skew-y: 34.6; scale-x: 0.678; scale-y: 0.796; }
        frame 46 { x: 46.9; y: 41; skew-x: 35.3; skew-y: 31.8; scale-x: 0.69; scale-y: 0.795; }
        frame 47 { x: 47.5; y: 40.3; skew-x: 32.1; skew-y: 28.8; scale-x: 0.703; scale-y: -10000; }
        frame 48 { x: 48; y: 39.5; skew-x: 28.8; skew-y: 26.1; scale-x: 0.717; }
        frame 49 { x: 48.5; y: 38.9; skew-x: 25.5; skew-y: 23.3; scale-x: 0.731; scale-y: 0.796; }
        frame 50 { x: 49.4; y: 38.6; skew-x: 22.3; skew-y: 20.3; scale-x: 0.744; scale-y: -10000; }
        frame 51 { x: 50.2; y: -10000; skew-x: 19; skew-y: 17.6; scale-x: 0.757; scale-y: 0.797; }
        frame 52 { x: 51; skew-x: 15.8; skew-y: 14.8; scale-x: 0.771; scale-y: -10000; }
        frame 53 { x: 52; skew-x: 12.5; skew-y: 12; scale-x: 0.785; scale-y: 0.798; }
        frame 54 { x: 53; y: 39; skew-x: 9.3; skew-y: 9.3; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: 50; y: 39.5; skew-x: 7.3; skew-y: 7.3; scale-x: 0.798; scale-y: 0.798; }
        frame 56 { x: 46.9; y: 40.3; skew-x: 5.1; skew-y: 5.1; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 43.9; y: 41; skew-x: 3.1; skew-y: 3.1; }
        frame 58 { x: 40.9; y: 41.5; skew-x: 1.2; skew-y: 1.2; }
        frame 59 { x: 39.7; y: 43.6; skew-x: -2.4; skew-y: -2.4; }
        frame 60 { x: 38.4; y: 46; skew-x: -6.5; skew-y: -6.5; }
        frame 61 { x: 40.6; y: 45; skew-x: -2.4; skew-y: -2.4; }
        frame 62 { x: 42.7; y: 44; skew-x: 1.3; skew-y: 1.3; }
        frame 63 { x: 44.9; y: 43; skew-x: 5.3; skew-y: 5.3; }
        frame 64 { x: 47.3; y: 42.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 47.8; y: 39.8; skew-x: 3.5; skew-y: 3.5; scale-x: 0.798; scale-y: 0.798; }
        frame 67 { x: 48.4; y: 37.2; skew-x: -2; skew-y: -2; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 49.1; y: 35; skew-x: -7.7; skew-y: -7.7; scale-x: 0.797; scale-y: 0.797; }
        frame 69 { x: 50; y: 32.8; skew-x: -13.6; skew-y: -13.6; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 72 { x: 48.3; y: 33.3; skew-x: -15.5; skew-y: -15.5; scale-x: 0.796; scale-y: 0.796; }
        frame 73 { x: 46.5; y: 33.8; skew-x: -17.5; skew-y: -17.5; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 44.8; y: 34.3; skew-x: -19.5; skew-y: -19.5; }
        frame 75 { x: 43; y: 34.9; skew-x: -21.5; skew-y: -21.5; }
        frame 76 { x: 41.3; y: 35.6; skew-x: -23.5; skew-y: -23.5; scale-x: 0.797; scale-y: 0.797; }
        frame 77 { x: 43; y: 35; skew-x: -21.5; skew-y: -21.5; scale-x: 0.796; scale-y: 0.796; }
        frame 78 { x: 44.7; y: 34.4; skew-x: -19.5; skew-y: -19.5; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 46.5; y: 33.9; skew-x: -17.5; skew-y: -17.5; }
        frame 80 { x: 48.3; y: 33.4; skew-x: -15.5; skew-y: -15.5; }
        frame 81 { x: 50; y: 32.8; skew-x: -13.6; skew-y: -13.6; scale-x: 0.797; scale-y: 0.797; }
        frame 82 { x: 52.5; y: 32; skew-x: -9.2; skew-y: -9.2; scale-x: 0.796; scale-y: 0.796; }
        frame 83 { x: 55.1; y: 31.4; skew-x: -4.9; skew-y: -4.9; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 57.8; y: 30.8; skew-x: -0.5; skew-y: -0.5; }
        frame 85 { x: 60.5; y: 30.5; skew-x: 3.5; skew-y: 3.5; }
        frame 86 { x: 63.4; y: 30; skew-x: 7.9; skew-y: 7.9; }
        frame 87 { x: 85.3; y: 41.1; skew-x: 28.6; skew-y: 28.6; scale-x: 0.794; scale-y: 0.794; }
        frame 88 { x: 107.5; y: 54.9; skew-x: 49.4; skew-y: 49.4; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 129.8; y: 69.8; skew-x: 70.2; skew-y: 70.2; }
        frame 90 { x: 150.4; y: 87; skew-x: 90.9; skew-y: 90.9; scale-x: 0.795; scale-y: 0.795; }
        frame 91 { x: 157; y: 97.2; skew-x: 100.8; skew-y: 100.8; scale-x: 0.794; scale-y: 0.794; }
        frame 92 { x: 162.9; y: 107.5; skew-x: 110.6; skew-y: 110.6; scale-x: 0.793; scale-y: 0.793; }
        frame 93 { x: 168.2; y: 118; skew-x: 120.5; skew-y: 120.5; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 164; y: 113.6; skew-x: 89.5; skew-y: 92; scale-x: 0.775; scale-y: 0.798; }
        frame 95 { x: 155.6; y: 112.3; skew-x: 58.4; skew-y: 63.7; scale-x: 0.757; scale-y: 0.803; }
        frame 96 { x: 155.9; y: 111.2; skew-x: 62.6; skew-y: 67.9; scale-x: 0.756; scale-y: 0.802; }
        frame 97 { x: 156.4; y: 110.1; skew-x: 66.7; skew-y: 72; scale-x: 0.757; scale-y: 0.803; }
        frame 98 { x: 155.5; y: 111.3; skew-x: 59.7; skew-y: 65; scale-x: 0.777; scale-y: 0.8; }
        frame 99 { x: 154.3; y: 112.5; skew-x: 52.6; skew-y: 57.9; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "Zombie_outerarm_lower";
        frame-count: 100;
        frame 0 { x: 67.7; y: 51.5; skew-x: 185.4; skew-y: 185.4; scale-x: 0.794; scale-y: 1.082; image: IMAGE_REANIM_ZOMBIE_DANCER_OUTERARM_LOWER; }
        frame 1 { x: 66.8; y: 50.6; skew-x: 186.3; skew-y: 186.3; scale-x: -10000; scale-y: 1.062; image: none; }
        frame 2 { x: 65.9; y: 50; skew-x: 187.1; skew-y: 187.1; scale-y: 1.041; }
        frame 3 { x: 65; y: 49.1; skew-x: 188; skew-y: 188; scale-y: 1.021; }
        frame 4 { x: 64; y: 48.5; skew-x: 189; skew-y: 189; scale-y: 1.001; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 7 { x: 64.2; y: 49.1; skew-x: 189.8; skew-y: 189.8; scale-y: 1.021; }
        frame 8 { x: 64.5; y: 49.8; skew-x: 190.5; skew-y: 190.5; scale-y: 1.041; }
        frame 9 { x: 64.7; y: 50.4; skew-x: 191.3; skew-y: 191.3; scale-x: 0.793; scale-y: 1.061; }
        frame 10 { x: 64.9; y: 51; skew-x: 192.2; skew-y: 192.2; scale-x: 0.794; scale-y: 1.082; }
        frame 11 { x: 64.7; y: 50.5; skew-x: 191.3; skew-y: 191.3; scale-x: 0.793; scale-y: 1.061; }
        frame 12 { x: 64.6; y: 49.8; skew-x: 190.5; skew-y: 190.5; scale-x: 0.794; scale-y: 1.041; }
        frame 13 { x: 64.3; y: 49.1; skew-x: 189.8; skew-y: 189.8; scale-x: -10000; scale-y: 1.021; }
        frame 14 { x: 64; y: 48.5; skew-x: 189; skew-y: 189; scale-y: 1.001; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 17 { x: 64.9; y: 49.1; skew-x: 188; skew-y: 188; scale-y: 1.021; }
        frame 18 { x: 65.8; y: 50; skew-x: 187.1; skew-y: 187.1; scale-y: 1.041; }
        frame 19 { x: 66.7; y: 50.7; skew-x: 186.3; skew-y: 186.3; scale-y: 1.062; }
        frame 20 { x: 67.7; y: 51.5; skew-x: 185.4; skew-y: 185.4; scale-y: 1.082; }
        frame 21 { x: 47.2; y: 53.9; skew-x: 16.9; skew-y: 16.9; scale-x: 0.791; scale-y: 0.791; }
        frame 22 { x: 52.6; y: 45.4; skew-x: 68.7; skew-y: 68.7; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 57; y: 49.8; skew-x: 136.2; skew-y: 136.2; scale-x: 0.792; scale-y: 1.025; }
        frame 24 { x: 56.9; y: 44.1; skew-x: 147.2; skew-y: 147.2; scale-x: -10000; scale-y: 0.909; }
        frame 25 { x: 57; y: 37.4; skew-x: 158; skew-y: 158; scale-x: 0.794; scale-y: 0.794; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 56.9; y: 44.1; skew-x: 147.2; skew-y: 147.2; scale-x: 0.792; scale-y: 0.909; }
        frame 30 { x: 52.6; y: 45.4; skew-x: 68.7; skew-y: 68.7; scale-x: 0.791; scale-y: 0.791; }
        frame 31 { x: 47.2; y: 53.9; skew-x: 16.9; skew-y: 16.9; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 44.5; y: 58.1; skew-x: 17.3; skew-y: 17.3; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 46.5; y: 54; skew-x: 29.6; skew-y: 29.6; scale-x: 0.797; scale-y: 0.797; }
        frame 34 { x: 48.3; y: 50.9; skew-x: 41.9; skew-y: 41.9; scale-x: 0.796; scale-y: 0.796; }
        frame 35 { x: 49.9; y: 48.5; skew-x: 54.4; skew-y: 54.4; scale-x: 0.795; scale-y: 0.795; }
        frame 36 { x: 51; y: 47; skew-x: 66.7; skew-y: 66.7; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 54.4; y: 45.8; skew-x: 84.2; skew-y: 84.2; }
        frame 38 { x: 56.3; y: 45.5; skew-x: 101.5; skew-y: 101.5; scale-x: 0.794; scale-y: 0.794; }
        frame 39 { x: 56.6; y: 45.6; skew-x: 119.1; skew-y: 119.1; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 54.8; y: 47.4; skew-x: 120.3; skew-y: 115.8; scale-x: 0.803; scale-y: 0.856; }
        frame 41 { x: 53; y: 48.9; skew-x: 121.8; skew-y: 112.6; scale-x: 0.813; scale-y: 0.919; }
        frame 42 { x: 51.1; y: 50.3; skew-x: 123.1; skew-y: 109.5; scale-x: 0.822; scale-y: 0.982; }
        frame 43 { x: 49.4; y: 51.6; skew-x: 124.4; skew-y: 106.3; scale-x: 0.833; scale-y: 1.046; }
        frame 44 { x: 47.1; y: 52.9; skew-x: 111.8; skew-y: 102.8; scale-x: 0.811; scale-y: 0.918; }
        frame 45 { x: 44.8; y: 54.7; skew-x: 99.4; skew-y: 99.4; scale-x: 0.792; scale-y: 0.792; }
        frame 46 { x: 45.9; y: 53.3; skew-x: 90.3; skew-y: 90.3; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 46.5; y: 51.9; skew-x: 81.2; skew-y: 81.2; }
        frame 48 { x: 46.6; y: 50.9; skew-x: 72.2; skew-y: 72.2; }
        frame 49 { x: 46.4; y: 50.3; skew-x: 62.9; skew-y: 62.9; scale-x: 0.794; scale-y: 0.794; }
        frame 50 { x: 47.5; y: 50.4; skew-x: 53.9; skew-y: 53.9; scale-x: 0.793; scale-y: 0.793; }
        frame 51 { x: 48.1; y: 50.9; skew-x: 44.6; skew-y: 44.6; scale-x: 0.794; scale-y: 0.794; }
        frame 52 { x: 48.9; y: 51.8; skew-x: 35.6; skew-y: 35.6; scale-x: 0.795; scale-y: 0.795; }
        frame 53 { x: 49.4; y: 53.3; skew-x: 26.3; skew-y: 26.3; scale-x: 0.796; scale-y: 0.796; }
        frame 54 { x: 49.9; y: 55.3; skew-x: 17.3; skew-y: 17.3; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { x: 47.2; y: -10000; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 44.7; y: 55.4; skew-x: 13.3; skew-y: 13.3; }
        frame 57 { x: 42.1; y: 55.5; skew-x: 11.3; skew-y: 11.3; }
        frame 58 { x: 39.5; y: 55.6; skew-x: 9.3; skew-y: 9.3; }
        frame 59 { x: 40; y: 58.6; skew-x: 5.3; skew-y: 5.3; }
        frame 60 { x: 40.4; y: 61.6; skew-x: 1.5; skew-y: 1.5; }
        frame 61 { x: 41.4; y: 60; skew-x: 5.3; skew-y: 5.3; }
        frame 62 { x: 42.6; y: 58.4; skew-x: 9.3; skew-y: 9.3; }
        frame 63 { x: 43.8; y: 56.8; skew-x: 13.3; skew-y: 13.3; }
        frame 64 { x: 44.9; y: 55.5; skew-x: 17.3; skew-y: 17.3; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 66 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_outerarm_hand";
        frame-count: 100;
        frame 0 { x: 74; y: 22.5; skew-x: 144.5; skew-y: 144.5; scale-x: 0.796; scale-y: 0.796; image: IMAGE_REANIM_ZOMBIE_DANCER_OUTERARM_HAND; }
        frame 1 { x: 73.2; y: 22.2; skew-x: 144.1; skew-y: 144.1; scale-x: 0.794; scale-y: 0.794; image: none; }
        frame 2 { x: 72.5; y: 22; skew-x: 143.7; skew-y: 143.7; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 71.7; y: 21.7; skew-x: 143.2; skew-y: 143.2; }
        frame 4 { x: 70.9; y: 21.5; skew-x: 142.8; skew-y: 142.8; scale-x: 0.796; scale-y: 0.796; }
        frame 5 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 71.8; skew-x: 143.2; skew-y: 143.2; scale-x: 0.794; scale-y: 0.794; }
        frame 8 { x: 72.8; skew-x: 143.7; skew-y: 143.7; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 73.8; y: 21.6; skew-x: 144.1; skew-y: 144.1; }
        frame 10 { x: 75; y: 21.5; skew-x: 144.5; skew-y: 144.5; scale-x: 0.796; scale-y: 0.796; }
        frame 11 { x: 73.8; y: -10000; skew-x: 144.1; skew-y: 144.1; scale-x: 0.794; scale-y: 0.794; }
        frame 12 { x: 73; skew-x: 143.7; skew-y: 143.7; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 71.8; y: 21.6; skew-x: 143.2; skew-y: 143.2; }
        frame 14 { x: 70.9; y: 21.5; skew-x: 142.8; skew-y: 142.8; scale-x: 0.796; scale-y: 0.796; }
        frame 15 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 71.6; y: 21.8; skew-x: 143.2; skew-y: 143.2; scale-x: 0.794; scale-y: 0.794; }
        frame 18 { x: 72.3; y: 22; skew-x: 143.7; skew-y: 143.7; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 73.1; y: 22.3; skew-x: 144.1; skew-y: 144.1; }
        frame 20 { x: 74; y: 22.5; skew-x: 144.5; skew-y: 144.5; scale-x: 0.796; scale-y: 0.796; }
        frame 21 { x: 40.4; y: 68.1; skew-x: 35; skew-y: 35; scale-x: 0.802; scale-y: 0.795; }
        frame 22 { x: 33.2; y: 46.6; skew-x: 63.9; skew-y: 63.9; scale-x: 0.798; scale-y: -10000; }
        frame 23 { x: 40.5; y: 26.3; skew-x: 92.8; skew-y: 92.8; scale-x: 0.796; scale-y: 0.796; }
        frame 24 { x: 46.9; y: 19.9; skew-x: 106.3; skew-y: 106.3; scale-x: 0.795; scale-y: 0.795; }
        frame 25 { x: 52.3; y: 14; skew-x: 120.1; skew-y: 120.1; scale-x: 0.796; scale-y: 0.796; }
        frame 26 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 46.9; y: 19.9; skew-x: 106.3; skew-y: 106.3; scale-x: 0.795; scale-y: 0.795; }
        frame 30 { x: 33.2; y: 46.6; skew-x: 63.9; skew-y: 63.9; scale-x: 0.798; scale-y: -10000; }
        frame 31 { x: 40.4; y: 68.1; skew-x: 35; skew-y: 35; scale-x: 0.802; }
        frame 32 { x: 34.2; y: 74; skew-x: 17.3; skew-y: 17.3; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 35.6; y: 64.3; skew-x: 37.1; skew-y: 37.1; scale-x: 0.796; scale-y: 0.796; }
        frame 34 { x: 37.3; y: 57; skew-x: 56.9; skew-y: 56.9; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 38.1; y: 51.8; skew-x: 76.5; skew-y: 76.5; }
        frame 36 { x: 37.5; y: 48.5; skew-x: 96.2; skew-y: 96.2; scale-x: 0.795; scale-y: 0.795; }
        frame 37 { x: 40.7; y: 43.5; skew-x: 107.5; skew-y: 107.5; scale-x: 0.793; scale-y: 0.793; }
        frame 38 { x: 43.3; y: 38.8; skew-x: 118.8; skew-y: 118.8; scale-x: 0.792; scale-y: 0.792; }
        frame 39 { x: 45; y: 34.1; skew-x: 130.2; skew-y: 130.2; scale-x: 0.791; scale-y: 0.791; }
        frame 40 { x: 42.6; y: 37.6; skew-x: 137.1; skew-y: 137.1; scale-x: 0.789; scale-y: 0.789; }
        frame 41 { x: 40; y: 40.9; skew-x: 143.9; skew-y: 143.9; scale-x: 0.788; scale-y: 0.788; }
        frame 42 { x: 37.1; y: 44.2; skew-x: 150.7; skew-y: 150.7; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 34.1; y: 47.3; skew-x: 157.5; skew-y: 157.5; }
        frame 44 { x: 30.1; y: 44.7; skew-x: 113; skew-y: 113; scale-x: 0.785; scale-y: 0.785; }
        frame 45 { x: 27.1; y: 45.9; skew-x: 93.7; skew-y: 93.7; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 27.7; y: 47.1; skew-x: 85.4; skew-y: 85.4; scale-x: 0.786; scale-y: 0.786; }
        frame 47 { x: 27.8; y: 48.7; skew-x: 76.9; skew-y: 76.9; scale-x: 0.787; scale-y: 0.787; }
        frame 48 { x: 27.7; y: 50.4; skew-x: 68.4; skew-y: 68.4; scale-x: 0.788; scale-y: 0.788; }
        frame 49 { x: 27.4; y: 52.5; skew-x: 59.9; skew-y: 59.9; scale-x: 0.79; scale-y: 0.79; }
        frame 50 { x: 29.8; y: 55.5; skew-x: 51.4; skew-y: 51.4; scale-x: 0.791; scale-y: 0.791; }
        frame 51 { x: 32; y: 59; skew-x: 42.9; skew-y: 42.9; scale-x: 0.792; scale-y: 0.792; }
        frame 52 { x: 34.2; y: 62.9; skew-x: 34.3; skew-y: 34.3; scale-x: 0.794; scale-y: 0.794; }
        frame 53 { x: 36.5; y: 67.1; skew-x: 25.8; skew-y: 25.8; scale-x: 0.796; scale-y: 0.796; }
        frame 54 { x: 39; y: 71.5; skew-x: 17.3; skew-y: 17.3; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { x: 36.5; y: 72.3; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 34.4; y: 73.2; skew-x: 4.5; skew-y: 4.5; }
        frame 57 { x: 32.3; y: 74.2; skew-x: -1.4; skew-y: -1.4; }
        frame 58 { x: 30.3; y: 75.3; skew-x: -7.9; skew-y: -7.9; scale-x: 0.797; scale-y: 0.797; }
        frame 59 { x: 31.9; y: 79.1; skew-x: -11.7; skew-y: -11.7; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 33.6; y: 83; skew-x: -15.7; skew-y: -15.7; }
        frame 61 { x: 33.4; y: 79.7; skew-x: -7.4; skew-y: -7.4; }
        frame 62 { x: 33.5; y: 76.5; skew-x: 0.8; skew-y: 0.8; scale-x: 0.798; scale-y: 0.798; }
        frame 63 { x: 34; y: 73.9; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 34.5; y: 71.5; skew-x: 17.3; skew-y: 17.3; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 66 { cel: -10000; }
    }
}
