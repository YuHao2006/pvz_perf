export component Zombie_catapult {
    fps: 12;
    Track {
        source-name: "anim_walk";
        frame-count: 85;
        frame 25 { cel: -1; }
        frame 26 { cel: -10000; }
    }
    Track {
        source-name: "anim_shoot";
        frame-count: 85;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 25 { cel: 0; }
        frame 26 { cel: -10000; }
        frame 57 { cel: -1; }
        frame 58 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 85;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 57 { cel: 0; }
        frame 58 { cel: -10000; }
        frame 70 { cel: -1; }
        frame 71 { cel: -10000; }
    }
    Track {
        source-name: "anim_bounce";
        frame-count: 85;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 70 { cel: 0; }
        frame 71 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_catapult_crank";
        frame-count: 85;
        frame 0 { x: 16.1; y: 52.8; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_CRANK; }
        frame 1 { x: -10000; y: 52.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 52.3; }
        frame 3 { y: 52; }
        frame 4 { y: 51.8; }
        frame 5 { y: 51.5; }
        frame 6 { y: 51.2; }
        frame 7 { y: 51.5; }
        frame 8 { y: 51.6; }
        frame 9 { y: 51.9; }
        frame 10 { y: 52.1; }
        frame 11 { y: 52.4; }
        frame 12 { y: 52.6; }
        frame 13 { y: 52.5; }
        frame 14 { y: 52.4; }
        frame 15 { y: 52.2; }
        frame 16 { y: 52; }
        frame 18 { y: 51.8; }
        frame 19 { y: 52; }
        frame 20 { y: 52.1; }
        frame 21 { y: 52.3; }
        frame 22 { y: 52.5; }
        frame 23 { y: 52.6; }
        frame 24 { y: 52.8; }
        frame 25 { y: -10000; }
        frame 27 { x: 21.9; y: 61; skew-x: 3.1; skew-y: 4.5; scale-x: 0.769; scale-y: 0.781; }
        frame 28 { x: 28.2; y: 65.2; skew-x: 6; skew-y: 9; scale-x: 0.605; scale-y: 0.614; }
        frame 29 { x: 34.1; y: 69.7; skew-x: 9.1; skew-y: 13.7; scale-x: 0.442; scale-y: 0.448; }
        frame 30 { x: 35.6; y: 69.3; skew-x: -4.9; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 37.3; y: 69.2; skew-x: -19.2; skew-y: -14.7; }
        frame 32 { x: 36.9; y: 60.9; skew-x: -11.2; skew-y: -6.7; scale-x: 0.639; scale-y: 0.701; }
        frame 33 { x: 37.1; y: 51.8; skew-x: -3.1; skew-y: 1.3; scale-x: 0.836; scale-y: 0.954; }
        frame 34 { x: 34.1; y: 50; skew-x: -9.4; skew-y: -4.9; scale-x: 0.835; scale-y: 0.953; }
        frame 35 { x: 31.2; y: 48.4; skew-x: -15.7; skew-y: -11.2; scale-x: 0.834; scale-y: 0.952; }
        frame 36 { x: 28.5; y: 46.5; skew-x: -13.7; skew-y: -9.2; scale-x: 0.833; scale-y: 0.951; }
        frame 37 { x: 25.8; y: 44.5; skew-x: -11.8; skew-y: -7.3; scale-x: 0.832; scale-y: 0.95; }
        frame 38 { x: 21.9; y: 46.5; skew-x: -14.4; skew-y: -9.9; scale-x: 0.831; scale-y: 0.948; }
        frame 39 { x: 17.8; y: 48.5; skew-x: -17; skew-y: -12.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 16.8; y: 50.5; skew-x: -8.4; skew-y: -6.2; scale-x: 0.865; scale-y: 0.924; }
        frame 41 { x: 16.1; y: 52.8; skew-x: 0; skew-y: 0; scale-x: 0.9; scale-y: 0.9; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 14.1; y: 54.7; skew-x: -5; skew-y: -5; scale-x: 0.899; scale-y: 0.899; }
        frame 44 { x: 12.3; y: 56.7; skew-x: -10.2; skew-y: -10.2; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 10.5; y: 58.9; skew-x: -15.4; skew-y: -15.4; scale-x: 0.898; scale-y: 0.898; }
        frame 46 { x: 8.8; y: 60.9; skew-x: -20.7; skew-y: -20.7; scale-x: 0.899; scale-y: 0.899; }
        frame 47 { x: 11; y: 58.1; skew-x: -13.7; skew-y: -13.7; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 13.5; y: 55.4; skew-x: -6.7; skew-y: -6.7; }
        frame 49 { x: 16.1; y: 52.8; skew-x: 0; skew-y: 0; scale-x: 0.9; scale-y: 0.9; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 25; y: 37.3; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 34.3; y: 22; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 28.6; y: 27.1; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 23; y: 32.1; skew-x: 4; skew-y: 4; }
        frame 75 { x: 17.4; y: 37.4; skew-x: 0; skew-y: 0; }
        frame 76 { x: 12.1; y: 42.5; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 12.3; y: 48.4; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: -10000; y: 54.2; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: 13; y: 55.3; skew-x: -3; skew-y: -3.2; scale-x: 0.907; scale-y: 0.889; }
        frame 80 { x: 13.4; y: 56.6; skew-x: -2.3; skew-y: -2.5; scale-x: 0.916; scale-y: 0.88; }
        frame 81 { x: 14.1; y: 54; skew-x: -2.2; skew-y: -2.4; scale-x: 0.907; scale-y: 0.889; }
        frame 82 { x: 14.7; y: 51.3; skew-x: -2.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: -10000; y: 53; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 54.8; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_driver_innerarm_hand";
        frame-count: 85;
        frame 0 { x: 16.4; y: 47; skew-x: 13.9; skew-y: 13.9; scale-x: 0.74; scale-y: 0.74; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_INNERARM_HAND; }
        frame 1 { x: 16.3; y: 46.9; skew-x: 13.3; skew-y: 13.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -10000; y: -10000; skew-x: 12.8; skew-y: 12.8; }
        frame 3 { skew-x: 12.3; skew-y: 12.3; }
        frame 4 { x: 16.1; y: 46.8; skew-x: 11.8; skew-y: 11.8; scale-x: 0.739; scale-y: 0.739; }
        frame 5 { x: -10000; y: -10000; skew-x: 11.3; skew-y: 11.3; scale-x: -10000; scale-y: -10000; }
        frame 6 { y: 46.7; skew-x: 10.9; skew-y: 10.9; scale-x: 0.74; scale-y: 0.74; }
        frame 7 { x: 16.2; y: 46.8; skew-x: 11.3; skew-y: 11.3; scale-x: 0.739; scale-y: 0.739; }
        frame 8 { x: -10000; y: 46.9; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 16.3; y: -10000; skew-x: 12.3; skew-y: 12.3; scale-x: 0.74; scale-y: 0.74; }
        frame 10 { x: 16.4; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: -10000; y: 47; skew-x: 13.3; skew-y: 13.3; }
        frame 12 { skew-x: 13.9; skew-y: 13.9; }
        frame 13 { x: 16.3; y: 46.9; skew-x: 13.3; skew-y: 13.3; }
        frame 14 { x: -10000; y: -10000; skew-x: 12.8; skew-y: 12.8; }
        frame 15 { skew-x: 12.3; skew-y: 12.3; }
        frame 16 { x: 16.1; y: 46.8; skew-x: 11.8; skew-y: 11.8; scale-x: 0.739; scale-y: 0.739; }
        frame 17 { x: -10000; y: -10000; skew-x: 11.3; skew-y: 11.3; scale-x: -10000; scale-y: -10000; }
        frame 18 { y: 46.7; skew-x: 10.9; skew-y: 10.9; scale-x: 0.74; scale-y: 0.74; }
        frame 19 { x: 16.2; y: 46.8; skew-x: 11.3; skew-y: 11.3; scale-x: 0.739; scale-y: 0.739; }
        frame 20 { x: -10000; y: 46.9; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 16.3; y: -10000; skew-x: 12.3; skew-y: 12.3; scale-x: 0.74; scale-y: 0.74; }
        frame 22 { x: 16.4; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -10000; y: 47; skew-x: 13.3; skew-y: 13.3; }
        frame 24 { skew-x: 13.9; skew-y: 13.9; }
        frame 25 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 27 { x: 20.6; y: 53.6; skew-x: 13.8; skew-y: 13.8; }
        frame 28 { x: 25.8; y: 54.6; skew-x: 16.8; skew-y: 16.8; scale-x: 0.739; scale-y: 0.739; }
        frame 29 { x: 31.1; y: 55.8; skew-x: 19.9; skew-y: 19.9; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 36.1; y: 55.3; skew-x: 25.1; skew-y: 25.1; scale-x: 0.738; scale-y: 0.738; }
        frame 31 { x: 41.4; y: 55; skew-x: 30.4; skew-y: 30.4; scale-x: 0.739; scale-y: 0.739; }
        frame 32 { x: 42.5; y: 49.1; skew-x: 33.3; skew-y: 33.3; scale-x: 0.738; scale-y: 0.738; }
        frame 33 { x: 43.5; y: 43.4; skew-x: 36.2; skew-y: 36.2; scale-x: 0.739; scale-y: 0.739; }
        frame 34 { x: 42.5; y: 41.6; skew-x: 36.9; skew-y: 40.6; scale-x: 0.74; scale-y: 0.737; }
        frame 35 { x: 41.3; y: 39.7; skew-x: 37.7; skew-y: 45; scale-x: 0.744; scale-y: 0.738; }
        frame 36 { x: 38.5; y: 39.1; skew-x: 33.1; skew-y: 44.9; scale-x: 0.756; scale-y: 0.76; }
        frame 37 { x: 35.6; y: 38.5; skew-x: 28.5; skew-y: 45; scale-x: 0.77; scale-y: 0.785; }
        frame 38 { x: 30.6; y: 39.1; skew-x: 28.1; skew-y: 40.1; scale-x: 0.756; scale-y: 0.768; }
        frame 39 { x: 25.4; y: 39.8; skew-x: 27.9; skew-y: 35.2; scale-x: 0.744; scale-y: 0.754; }
        frame 40 { x: 20.8; y: 43.5; skew-x: 20.8; skew-y: 24.6; scale-x: 0.741; scale-y: 0.746; }
        frame 41 { x: 16.4; y: 47; skew-x: 13.9; skew-y: 13.9; scale-x: 0.74; scale-y: 0.74; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 15.5; y: 47.9; skew-x: 13.8; skew-y: 13.8; }
        frame 44 { x: 14.5; y: 48.8; skew-x: -10000; skew-y: -10000; }
        frame 45 { x: 13.6; y: 49.7; }
        frame 46 { x: 12.6; y: 50.6; skew-x: 13.9; skew-y: 13.9; }
        frame 47 { x: 13.8; y: 49.4; skew-x: 13.8; skew-y: 13.8; }
        frame 48 { x: 15.1; y: 48.1; skew-x: -10000; skew-y: -10000; }
        frame 49 { x: 16.4; y: 47; skew-x: 13.9; skew-y: 13.9; }
        frame 50 { x: -10000; y: -10000; skew-x: 13.8; skew-y: 13.8; }
        frame 51 { skew-x: -10000; skew-y: -10000; }
        frame 54 { skew-x: 13.9; skew-y: 13.9; }
        frame 55 { skew-x: 13.8; skew-y: 13.8; }
        frame 56 { skew-x: 13.9; skew-y: 13.9; }
        frame 57 { skew-x: -10000; skew-y: -10000; }
        frame 59 { skew-x: 13.8; skew-y: 13.8; }
        frame 60 { skew-x: -10000; skew-y: -10000; }
        frame 63 { skew-x: 13.9; skew-y: 13.9; }
        frame 64 { skew-x: 13.8; skew-y: 13.8; }
        frame 65 { skew-x: -10000; skew-y: -10000; }
        frame 69 { skew-x: 13.9; skew-y: 13.9; }
        frame 70 { skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 29.6; y: 30.1; skew-x: 31.3; skew-y: 31.3; scale-x: 0.738; scale-y: 0.738; }
        frame 72 { x: 43; y: 14.3; skew-x: 48.8; skew-y: 48.8; scale-x: 0.739; scale-y: 0.739; }
        frame 73 { x: 35; y: 19.6; skew-x: 40.1; skew-y: 40.1; scale-x: 0.737; scale-y: 0.737; }
        frame 74 { x: 27.3; y: 25.3; skew-x: 31.3; skew-y: 31.3; scale-x: 0.738; scale-y: 0.738; }
        frame 75 { x: 22.5; y: 29.5; skew-x: 30.6; skew-y: 30.6; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 17.8; y: 33.8; skew-x: 29.9; skew-y: 29.9; scale-x: 0.739; scale-y: 0.739; }
        frame 77 { x: 15.6; y: 40; skew-x: 21.8; skew-y: 21.8; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 13.7; y: 46.3; skew-x: 13.9; skew-y: 13.9; scale-x: 0.74; scale-y: 0.74; }
        frame 79 { x: 15.7; y: 47.5; skew-x: 20.3; skew-y: 20.3; scale-x: 0.739; scale-y: 0.739; }
        frame 80 { x: 17.8; y: 48.8; skew-x: 26.7; skew-y: 26.7; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 18.3; y: 45.8; skew-x: 26.8; skew-y: 26.8; }
        frame 82 { x: 18.9; y: 42.6; skew-x: 27.2; skew-y: 27.2; scale-x: 0.74; scale-y: 0.74; }
        frame 83 { x: 17.6; y: 44.8; skew-x: 20.5; skew-y: 20.5; scale-x: 0.739; scale-y: 0.739; }
        frame 84 { x: 16.4; y: 47; skew-x: 13.9; skew-y: 13.9; scale-x: 0.74; scale-y: 0.74; }
    }
    Track {
        source-name: "Zombie_catapult_driver_innerarm_lower";
        frame-count: 85;
        frame 0 { x: 50.1; y: 41.6; skew-x: 63; skew-y: 73.9; scale-x: 0.741; scale-y: 0.754; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_INNERARM_LOWER; }
        frame 1 { x: 50; y: 41.3; skew-x: 62.4; skew-y: 73.2; scale-x: 0.74; scale-y: -10000; image: none; }
        frame 2 { x: 49.9; y: 41.1; skew-x: 61.7; skew-y: 72.7; scale-x: -10000; }
        frame 3 { x: 49.8; y: 40.8; skew-x: 60.9; skew-y: 71.9; scale-y: 0.753; }
        frame 4 { x: 49.6; y: 40.4; skew-x: 60.2; skew-y: 71.2; scale-x: 0.739; scale-y: -10000; }
        frame 5 { x: 49.4; y: 40.1; skew-x: 59.4; skew-y: 70.5; scale-x: -10000; }
        frame 6 { x: 49.2; y: 39.8; skew-x: 58.8; skew-y: 69.7; scale-x: 0.74; scale-y: 0.754; }
        frame 7 { x: 49.4; y: 40.1; skew-x: 59.4; skew-y: 70.5; scale-x: 0.739; scale-y: 0.753; }
        frame 8 { x: 49.5; y: 40.4; skew-x: 60.2; skew-y: 71.2; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 49.7; y: 40.7; skew-x: 60.9; skew-y: 71.9; scale-x: 0.74; }
        frame 10 { x: 49.9; y: 41.1; skew-x: 61.7; skew-y: 72.7; scale-x: -10000; scale-y: 0.754; }
        frame 11 { x: 50; y: 41.4; skew-x: 62.4; skew-y: 73.2; scale-y: -10000; }
        frame 12 { x: 50.1; y: 41.6; skew-x: 63; skew-y: 73.9; scale-x: 0.741; }
        frame 13 { x: 50; y: 41.3; skew-x: 62.4; skew-y: 73.2; scale-x: 0.74; }
        frame 14 { x: 49.9; y: 41.1; skew-x: 61.7; skew-y: 72.7; scale-x: -10000; }
        frame 15 { x: 49.8; y: 40.8; skew-x: 60.9; skew-y: 71.9; scale-y: 0.753; }
        frame 16 { x: 49.6; y: 40.4; skew-x: 60.2; skew-y: 71.2; scale-x: 0.739; scale-y: -10000; }
        frame 17 { x: 49.4; y: 40.1; skew-x: 59.4; skew-y: 70.5; scale-x: -10000; }
        frame 18 { x: 49.2; y: 39.8; skew-x: 58.8; skew-y: 69.7; scale-x: 0.74; scale-y: 0.754; }
        frame 19 { x: 49.4; y: 40.1; skew-x: 59.4; skew-y: 70.5; scale-x: 0.739; scale-y: 0.753; }
        frame 20 { x: 49.5; y: 40.4; skew-x: 60.2; skew-y: 71.2; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 49.7; y: 40.7; skew-x: 60.9; skew-y: 71.9; scale-x: 0.74; }
        frame 22 { x: 49.9; y: 41.1; skew-x: 61.7; skew-y: 72.7; scale-x: -10000; scale-y: 0.754; }
        frame 23 { x: 50; y: 41.4; skew-x: 62.4; skew-y: 73.2; scale-y: -10000; }
        frame 24 { x: 50.1; y: 41.6; skew-x: 63; skew-y: 73.9; scale-x: 0.741; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 27 { x: 48.9; y: 42.6; skew-x: 51.4; skew-y: 56.4; scale-x: 0.739; scale-y: 0.742; }
        frame 28 { x: 54.5; y: 45; skew-x: 53.9; skew-y: 59.2; scale-x: 0.737; scale-y: 0.741; }
        frame 29 { x: 60.2; y: 47.5; skew-x: 56.6; skew-y: 61.7; scale-x: 0.738; scale-y: -10000; }
        frame 30 { x: 64.3; y: -10000; skew-x: 56.7; skew-y: -10000; scale-x: 0.737; scale-y: 0.74; }
        frame 31 { x: 68.6; skew-x: 56.6; scale-x: 0.738; scale-y: 0.741; }
        frame 32 { x: 69.8; y: 43.7; skew-x: 60.9; skew-y: 65.9; scale-x: 0.737; scale-y: 0.74; }
        frame 33 { x: 71.1; y: 40; skew-x: 64.9; skew-y: 70; scale-x: -10000; scale-y: 0.741; }
        frame 34 { x: 70.8; y: 42; skew-x: 71.5; skew-y: 80.2; scale-x: 0.744; scale-y: 0.74; }
        frame 35 { x: 69.9; y: 44.3; skew-x: 77.9; skew-y: 90.3; scale-x: 0.751; scale-y: -10000; }
        frame 36 { x: 68.3; y: 44.1; skew-x: 80.5; skew-y: 92.6; scale-x: -10000; }
        frame 37 { x: 66.8; y: -10000; skew-x: 82.7; skew-y: 95.1; }
        frame 38 { x: 62.3; y: 44.3; skew-x: 82.4; skew-y: 94.5; }
        frame 39 { x: 57.9; y: 44.5; skew-x: 81.8; skew-y: 94.2; }
        frame 40 { x: 54.3; y: 43; skew-x: 72.5; skew-y: 84.2; scale-x: 0.745; scale-y: 0.747; }
        frame 41 { x: 50.1; y: 41.6; skew-x: 63; skew-y: 73.9; scale-x: 0.741; scale-y: 0.754; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 48.5; skew-x: 60.7; skew-y: 71.5; scale-x: 0.74; }
        frame 44 { x: 47; y: 41.7; skew-x: 58.2; skew-y: 69.2; scale-x: 0.739; scale-y: 0.753; }
        frame 45 { x: 45.5; y: 41.9; skew-x: 55.7; skew-y: 66.7; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 43.8; y: 42; skew-x: 53.2; skew-y: 64.1; scale-x: 0.74; scale-y: 0.754; }
        frame 47 { x: 45.9; y: 41.8; skew-x: 56.4; skew-y: 67.4; scale-x: 0.739; scale-y: 0.753; }
        frame 48 { x: 48.1; y: 41.7; skew-x: 59.9; skew-y: 70.7; scale-x: 0.74; scale-y: 0.754; }
        frame 49 { x: 50.1; y: 41.6; skew-x: 63; skew-y: 73.9; scale-x: 0.741; scale-y: -10000; }
        frame 50 { x: 50.2; y: -10000; skew-x: 63.2; skew-y: 74; scale-x: 0.74; }
        frame 51 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 54 { x: 50.1; skew-x: 63; skew-y: 73.9; scale-x: 0.741; }
        frame 55 { x: 50.2; skew-x: 63.2; skew-y: 74; scale-x: 0.74; }
        frame 56 { x: 50.1; skew-x: 63; skew-y: 73.9; scale-x: 0.741; }
        frame 57 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 59 { x: 50.6; y: 42.4; skew-x: 65; skew-y: 76; scale-x: 0.74; }
        frame 60 { x: 51; y: 43.1; skew-x: 66.9; skew-y: 77.9; scale-x: -10000; }
        frame 61 { x: 51.5; y: 43.9; skew-x: 68.9; skew-y: 79.7; }
        frame 62 { x: 51.8; y: 44.7; skew-x: 70.7; skew-y: 81.7; }
        frame 63 { x: 52.2; y: 45.5; skew-x: 72.6; skew-y: 83.5; }
        frame 64 { x: 52; y: 44.8; skew-x: 71.2; skew-y: 82; }
        frame 65 { x: 51.5; y: 44.2; skew-x: 69.5; skew-y: 80.5; }
        frame 66 { x: 51.3; y: 43.5; skew-x: 67.9; skew-y: 78.7; }
        frame 67 { x: 50.9; y: 42.9; skew-x: 66.2; skew-y: 77.2; }
        frame 68 { x: 50.5; y: 42.3; skew-x: 64.7; skew-y: 75.7; }
        frame 69 { x: 50.1; y: 41.6; skew-x: 63; skew-y: 73.9; scale-x: 0.741; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 71 { x: 62.9; y: 36.7; skew-x: 85; skew-y: 95.8; scale-x: 0.739; scale-y: 0.753; }
        frame 72 { x: 73.3; y: 33.3; skew-x: 106.9; skew-y: 117.8; scale-x: -10000; scale-y: 0.752; }
        frame 73 { x: 67.8; y: 33.6; skew-x: 98; skew-y: 108.8; scale-y: -10000; }
        frame 74 { x: 61.8; y: 34; skew-x: 89.3; skew-y: 100.1; scale-y: 0.753; }
        frame 75 { x: 56.1; y: 35.9; skew-x: 84.2; skew-y: 94.8; scale-y: -10000; }
        frame 76 { x: 50; y: 37.9; skew-x: 78.8; skew-y: 89.7; scale-x: 0.74; }
        frame 77 { x: 48.6; y: 39.7; skew-x: 71; skew-y: 82; scale-x: 0.739; scale-y: 0.754; }
        frame 78 { x: 46.9; y: 41.6; skew-x: 63; skew-y: 73.9; scale-x: 0.741; scale-y: -10000; }
        frame 79 { x: 47.6; y: 44.6; skew-x: 65.4; skew-y: 76.4; scale-x: 0.74; }
        frame 80 { x: 48.3; y: 47.5; skew-x: 67.7; skew-y: 78.7; scale-x: -10000; }
        frame 81 { x: 50; y: 44.9; skew-x: 68.7; skew-y: 79.5; }
        frame 82 { x: 51.7; y: 42.3; skew-x: 69.3; skew-y: 80.2; }
        frame 83 { x: 51; y: 42; skew-x: 66.2; skew-y: 77.2; }
        frame 84 { x: 50.1; y: 41.6; skew-x: 63; skew-y: 73.9; scale-x: 0.741; }
    }
    Track {
        source-name: "Zombie_catapult_driver_innerarm_upper";
        frame-count: 85;
        frame 0 { x: 64.1; y: 29.1; skew-x: 65.9; skew-y: 49.6; scale-x: 0.8; scale-y: 0.715; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_INNERARM_UPPER; }
        frame 1 { x: 63.6; y: 28.6; skew-x: 64.5; skew-y: 48.2; scale-x: 0.798; scale-y: 0.714; image: none; }
        frame 2 { x: 63.2; y: 27.8; skew-x: 63.2; skew-y: 46.9; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 62.8; y: 27.2; skew-x: 61.7; skew-y: 45.4; }
        frame 4 { x: 62.3; y: 26.6; skew-x: 60.4; skew-y: 44.1; }
        frame 5 { x: 62; y: 26; skew-x: 58.9; skew-y: 42.6; }
        frame 6 { x: 61.5; y: 25.3; skew-x: 57.6; skew-y: 41.3; scale-x: 0.799; scale-y: 0.715; }
        frame 7 { x: 61.9; y: 26; skew-x: 58.9; skew-y: 42.6; scale-x: 0.798; scale-y: 0.714; }
        frame 8 { x: 62.3; y: 26.7; skew-x: 60.4; skew-y: 44.1; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 62.7; y: 27.2; skew-x: 61.7; skew-y: 45.4; }
        frame 10 { x: 63.3; y: 27.8; skew-x: 63.2; skew-y: 46.9; }
        frame 11 { x: 63.6; y: 28.5; skew-x: 64.5; skew-y: 48.2; scale-x: 0.799; }
        frame 12 { x: 64.1; y: 29.1; skew-x: 65.9; skew-y: 49.6; scale-x: 0.8; scale-y: 0.715; }
        frame 13 { x: 63.6; y: 28.6; skew-x: 64.5; skew-y: 48.2; scale-x: 0.798; scale-y: 0.714; }
        frame 14 { x: 63.2; y: 27.8; skew-x: 63.2; skew-y: 46.9; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 62.8; y: 27.2; skew-x: 61.7; skew-y: 45.4; }
        frame 16 { x: 62.3; y: 26.6; skew-x: 60.4; skew-y: 44.1; }
        frame 17 { x: 62; y: 26; skew-x: 58.9; skew-y: 42.6; }
        frame 18 { x: 61.5; y: 25.3; skew-x: 57.6; skew-y: 41.3; scale-x: 0.799; scale-y: 0.715; }
        frame 19 { x: 61.9; y: 26; skew-x: 58.9; skew-y: 42.6; scale-x: 0.798; scale-y: 0.714; }
        frame 20 { x: 62.3; y: 26.7; skew-x: 60.4; skew-y: 44.1; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 62.7; y: 27.2; skew-x: 61.7; skew-y: 45.4; }
        frame 22 { x: 63.3; y: 27.8; skew-x: 63.2; skew-y: 46.9; }
        frame 23 { x: 63.6; y: 28.5; skew-x: 64.5; skew-y: 48.2; scale-x: 0.799; }
        frame 24 { x: 64.1; y: 29.1; skew-x: 65.9; skew-y: 49.6; scale-x: 0.8; scale-y: 0.715; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 62.5; y: 28.6; skew-x: 58.7; skew-y: 42.4; scale-x: 0.798; scale-y: 0.714; }
        frame 28 { x: 57.3; y: 30.7; skew-x: 31.3; skew-y: 22.3; scale-x: 0.78; scale-y: 0.712; }
        frame 29 { x: 53.4; y: 34.9; skew-x: 3.8; skew-y: 2.6; scale-x: 0.765; scale-y: -10000; }
        frame 30 { x: 54.2; y: -10000; skew-x: -10000; skew-y: 2.5; scale-x: 0.764; }
        frame 31 { x: 55; skew-y: 2.6; scale-x: 0.765; }
        frame 32 { x: -10000; skew-y: 2.5; scale-x: 0.764; }
        frame 33 { skew-y: 2.6; scale-x: 0.765; }
        frame 34 { skew-y: 2.5; scale-x: 0.764; }
        frame 35 { skew-y: 2.6; scale-x: 0.765; }
        frame 36 { skew-y: 2.5; scale-x: 0.764; }
        frame 37 { skew-y: 2.6; scale-x: 0.765; }
        frame 38 { skew-y: 2.5; scale-x: 0.764; }
        frame 39 { skew-y: 2.6; scale-x: 0.765; }
        frame 40 { x: 58.9; y: 30.3; skew-x: 34.8; skew-y: 26.1; scale-x: 0.781; scale-y: 0.713; }
        frame 41 { x: 64.1; y: 29.1; skew-x: 65.9; skew-y: 49.6; scale-x: 0.8; scale-y: 0.715; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 63.3; y: 29.7; skew-x: 64; skew-y: 50.6; scale-x: 0.791; scale-y: 0.714; }
        frame 44 { x: 62.6; y: 30.1; skew-x: 62.2; skew-y: 51.4; scale-x: 0.784; scale-y: -10000; }
        frame 45 { x: 61.9; y: 30.7; skew-x: 60.2; skew-y: 52.4; scale-x: 0.776; }
        frame 46 { x: 61.1; y: 31.2; skew-x: 58.3; skew-y: 53.4; scale-x: 0.77; scale-y: 0.715; }
        frame 47 { x: 62.1; y: 30.5; skew-x: 60.9; skew-y: 52.1; scale-x: 0.779; scale-y: 0.714; }
        frame 48 { x: 63.1; y: 29.9; skew-x: 63.4; skew-y: 50.9; scale-x: 0.789; scale-y: -10000; }
        frame 49 { x: 64.1; y: 29.1; skew-x: 65.9; skew-y: 49.6; scale-x: 0.8; scale-y: 0.715; }
        frame 50 { x: -10000; y: 29.2; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.714; }
        frame 51 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 54 { y: 29.1; scale-x: 0.8; scale-y: 0.715; }
        frame 55 { y: 29.2; scale-x: 0.799; scale-y: 0.714; }
        frame 56 { y: 29.1; scale-x: 0.8; scale-y: 0.715; }
        frame 57 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 63; y: 29.3; skew-x: 63.7; skew-y: 47.2; scale-x: 0.798; scale-y: 0.714; }
        frame 60 { x: 62; y: 29.4; skew-x: 61.2; skew-y: 44.9; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 60.9; y: 29.7; skew-x: 58.9; skew-y: 42.4; }
        frame 62 { x: 59.7; y: 29.9; skew-x: 56.4; skew-y: 40.1; }
        frame 63 { x: 58.6; y: 30.1; skew-x: 54.1; skew-y: 37.8; scale-x: 0.799; scale-y: 0.715; }
        frame 64 { x: 59.5; y: 29.9; skew-x: 56.1; skew-y: 39.6; scale-x: 0.798; scale-y: 0.714; }
        frame 65 { x: 60.5; y: 29.7; skew-x: 58.1; skew-y: 41.6; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 61.4; y: 29.5; skew-x: 59.9; skew-y: 43.6; }
        frame 67 { x: 62.3; y: 29.3; skew-x: 61.9; skew-y: 45.6; }
        frame 68 { x: 63.1; y: 29.2; skew-x: 63.9; skew-y: 47.6; }
        frame 69 { x: 64.1; y: 29.1; skew-x: 65.9; skew-y: 49.6; scale-x: 0.8; scale-y: 0.715; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 74; y: 24.6; skew-x: 73.7; skew-y: 57.2; scale-x: 0.799; scale-y: 0.714; }
        frame 72 { x: 83.7; y: 20.4; skew-x: 81.2; skew-y: 64.9; scale-x: -10000; scale-y: 0.715; }
        frame 73 { x: 78.8; y: 21.5; skew-x: 77.5; skew-y: 61.2; scale-x: 0.798; scale-y: 0.713; }
        frame 74 { x: 73.8; y: 22.6; skew-x: 73.7; skew-y: 57.2; scale-x: 0.799; scale-y: 0.714; }
        frame 75 { x: 71; y: 26.4; skew-x: 76.7; skew-y: 60.4; scale-x: 0.798; scale-y: 0.713; }
        frame 76 { x: 68.2; y: 30; skew-x: 79.7; skew-y: 63.4; scale-x: 0.799; scale-y: 0.715; }
        frame 77 { x: 65.1; y: 29.7; skew-x: 71.7; skew-y: 55.4; scale-x: 0.798; scale-y: 0.714; }
        frame 78 { x: 61.8; y: -10000; skew-x: 63.6; skew-y: 47.3; scale-x: 0.8; scale-y: 0.715; }
        frame 79 { x: 56.8; y: 29.4; skew-x: 56.9; skew-y: 34.8; scale-x: 0.831; scale-y: 0.714; }
        frame 80 { x: 51.4; y: 29.8; skew-x: 50; skew-y: 22.4; scale-x: 0.864; scale-y: -10000; }
        frame 81 { x: 57.5; y: 28.8; skew-x: 55.7; skew-y: 33.6; scale-x: 0.83; }
        frame 82 { x: 63.1; y: 28.3; skew-x: 61.3; skew-y: 45; scale-x: 0.799; scale-y: 0.715; }
        frame 83 { x: 63.6; y: 28.7; skew-x: 63.7; skew-y: 47.4; scale-x: 0.798; scale-y: 0.714; }
        frame 84 { x: 64.1; y: 29.1; skew-x: 65.9; skew-y: 49.6; scale-x: 0.8; scale-y: 0.715; }
    }
    Track {
        source-name: "Zombie_catapult_crankarm";
        frame-count: 85;
        frame 0 { x: 16; y: 52.8; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_CRANKARM; }
        frame 1 { x: -10000; y: 52.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 52.3; }
        frame 3 { y: 52; }
        frame 4 { y: 51.8; }
        frame 5 { y: 51.5; }
        frame 6 { y: 51.2; }
        frame 7 { y: 51.5; }
        frame 8 { y: 51.6; }
        frame 9 { y: 51.9; }
        frame 10 { y: 52.1; }
        frame 11 { y: 52.4; }
        frame 12 { y: 52.6; }
        frame 13 { y: 52.5; }
        frame 14 { y: 52.4; }
        frame 15 { y: 52.2; }
        frame 16 { y: 52; }
        frame 18 { y: 51.8; }
        frame 19 { y: 52; }
        frame 20 { y: 52.1; }
        frame 21 { y: 52.3; }
        frame 22 { y: 52.5; }
        frame 23 { y: 52.6; }
        frame 24 { y: 52.8; }
        frame 25 { y: -10000; }
        frame 27 { x: 12; y: 72.1; skew-x: -44.9; skew-y: -44.9; }
        frame 28 { x: 16.4; y: 80.7; skew-x: -67.4; skew-y: -67.4; }
        frame 29 { x: 22.7; y: 88.3; skew-x: -89.9; skew-y: -89.9; }
        frame 30 { x: 32; y: 91.4; skew-x: -112.4; skew-y: -112.4; }
        frame 31 { x: 41.9; y: 92.4; skew-x: -134.9; skew-y: -134.9; }
        frame 32 { x: 50.6; y: 88.1; skew-x: -157.4; skew-y: -157.4; }
        frame 33 { x: 58.3; y: 81.8; skew-x: -179.9; skew-y: -179.9; }
        frame 34 { x: 61.4; y: 72.5; skew-x: -202.4; skew-y: -202.4; }
        frame 35 { x: 62.4; y: 62.5; skew-x: -224.9; skew-y: -224.9; }
        frame 36 { x: 58.1; y: 53.8; skew-x: -247.4; skew-y: -247.4; }
        frame 37 { x: 51.9; y: 46; skew-x: -269.9; skew-y: -269.9; }
        frame 38 { x: 42.5; y: 43; skew-x: -292.4; skew-y: -292.4; }
        frame 39 { x: 32.5; y: 41.9; skew-x: -314.9; skew-y: -314.9; }
        frame 40 { x: 23.8; y: 46.4; skew-x: -337.4; skew-y: -337.4; }
        frame 41 { x: 16; y: 52.8; skew-x: -359.9; skew-y: -359.9; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 43 { x: 14; y: 54.7; skew-x: -365; skew-y: -365; scale-x: 0.899; scale-y: 0.899; }
        frame 44 { x: 12.2; y: 56.8; skew-x: -370.2; skew-y: -370.2; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 10.4; y: 58.8; skew-x: -375.4; skew-y: -375.4; scale-x: 0.898; scale-y: 0.898; }
        frame 46 { x: 8.7; y: 61; skew-x: -380.7; skew-y: -380.7; scale-x: 0.899; scale-y: 0.899; }
        frame 47 { x: 10.9; y: 58.1; skew-x: -373.7; skew-y: -373.7; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 13.4; y: 55.4; skew-x: -366.7; skew-y: -366.7; }
        frame 49 { x: 16; y: 52.8; skew-x: -359.9; skew-y: -359.9; scale-x: 0.9; scale-y: 0.9; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 24.9; y: 37.3; skew-x: -353.9; skew-y: -353.9; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 34.1; y: 22; skew-x: -347.5; skew-y: -347.5; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 28.5; y: 27.1; skew-x: -351.6; skew-y: -351.6; }
        frame 74 { x: 22.9; y: 32.1; skew-x: -355.9; skew-y: -355.9; }
        frame 75 { x: 17.3; y: 37.3; skew-x: -359.9; skew-y: -359.9; }
        frame 76 { x: 12; y: 42.5; skew-x: -363.9; skew-y: -363.9; }
        frame 77 { x: 12.2; y: 48.4; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: -10000; y: 54.2; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: 12.9; y: 55.3; skew-x: -363; skew-y: -363.2; scale-x: 0.907; scale-y: 0.889; }
        frame 80 { x: 13.3; y: 56.6; skew-x: -362.3; skew-y: -362.5; scale-x: 0.916; scale-y: 0.88; }
        frame 81 { x: 14; y: 53.9; skew-x: -362.2; skew-y: -362.4; scale-x: 0.907; scale-y: 0.889; }
        frame 82 { x: 14.6; y: 51.3; skew-x: -362.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: -10000; y: 53; skew-x: -362.2; skew-y: -362.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 54.8; skew-x: -362.4; skew-y: -362.4; }
    }
    Track {
        source-name: "Zombie_catapult_driver_innerleg_foot";
        frame-count: 85;
        frame 0 { x: 63; y: 98.5; scale-x: 0.741; scale-y: 0.741; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_INNERLEG_FOOT; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
    }
    Track {
        source-name: "Zombie_catapult_driver_innerleg_lower";
        frame-count: 85;
        frame 0 { x: 61.5; y: 93.1; scale-x: 0.741; scale-y: 0.741; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_INNERLEG_LOWER; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
    }
    Track {
        source-name: "Zombie_catapult_driver_innerleg_upper";
        frame-count: 85;
        frame 0 { x: 63.5; y: 75.7; scale-x: 0.741; scale-y: 0.741; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_INNERLEG_UPPER; }
        frame 1 { x: 63.6; y: 76.3; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 63.8; y: 76.8; skew-x: -4.4; skew-y: -4.4; }
        frame 3 { x: 64; y: 77.5; skew-x: -6.9; skew-y: -6.9; scale-x: 0.74; scale-y: 0.74; }
        frame 4 { x: 64.3; y: 78.1; skew-x: -9.2; skew-y: -9.2; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 64.5; y: 78.7; skew-x: -11.5; skew-y: -11.5; }
        frame 6 { x: 64.8; y: 79.4; skew-x: -13.9; skew-y: -13.9; }
        frame 7 { x: -10000; y: 79.6; skew-x: -10000; skew-y: -10000; }
        frame 8 { y: 79.7; }
        frame 9 { y: 79.8; }
        frame 10 { y: -10000; }
        frame 11 { y: 80; }
        frame 13 { x: 64.6; y: 79.3; skew-x: -11.5; skew-y: -11.5; }
        frame 14 { x: 64.3; y: 78.5; skew-x: -9.2; skew-y: -9.2; }
        frame 15 { x: 64; y: 77.8; skew-x: -6.9; skew-y: -6.9; }
        frame 16 { x: 63.9; y: 77.1; skew-x: -4.4; skew-y: -4.4; scale-x: 0.741; scale-y: 0.741; }
        frame 17 { x: 63.7; y: 76.3; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 63.5; y: 75.7; skew-x: 0; skew-y: 0; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 77 { x: 63.3; y: 75.9; skew-x: -0.9; skew-y: -0.9; }
        frame 78 { x: 63; y: 76.3; skew-x: -2.2; skew-y: -2.2; }
        frame 79 { x: 63.3; y: 75.9; skew-x: -0.9; skew-y: -0.9; }
        frame 80 { x: 63.5; y: 75.7; skew-x: 0; skew-y: 0; }
        frame 81 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "Zombie_catapult_driver_body";
        frame-count: 85;
        frame 0 { x: 50.4; y: 15.2; scale-x: 0.741; scale-y: 0.741; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_BODY; }
        frame 1 { x: 50.1; y: 14.9; scale-x: 0.747; scale-y: 0.747; image: none; }
        frame 2 { x: 49.9; y: 14.8; skew-x: -0.1; skew-y: -0.1; scale-x: 0.754; scale-y: 0.754; }
        frame 3 { x: 50.6; y: 14.2; skew-x: 0.6; skew-y: 0.6; scale-x: 0.75; scale-y: 0.75; }
        frame 4 { x: 51.5; y: 13.3; skew-x: 1.5; skew-y: 1.5; scale-x: 0.747; scale-y: 0.747; }
        frame 5 { x: 52.4; y: 12.5; skew-x: 2.5; skew-y: 2.5; scale-x: 0.744; scale-y: 0.744; }
        frame 6 { x: 53.1; y: 11.6; skew-x: 3.6; skew-y: 3.6; scale-x: 0.741; scale-y: 0.741; }
        frame 7 { x: 52.5; y: 12.3; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 52.1; y: 12.9; skew-x: 2.3; skew-y: 2.3; }
        frame 9 { x: 51.8; y: 13.5; skew-x: 1.8; skew-y: 1.8; }
        frame 10 { x: 51.2; y: 14.1; skew-x: 1; skew-y: 1; }
        frame 11 { x: 50.9; y: 14.7; skew-x: 0.5; skew-y: 0.5; }
        frame 12 { x: 50.4; y: 15.2; skew-x: 0; skew-y: 0; }
        frame 13 { x: -10000; y: 14.7; skew-x: 0.5; skew-y: 0.5; scale-x: 0.748; scale-y: 0.744; }
        frame 14 { x: 50.5; y: 14.1; skew-x: 1; skew-y: 1; scale-x: 0.755; scale-y: 0.747; }
        frame 15 { x: 51.1; y: 13.5; skew-x: 1.5; skew-y: 1.5; scale-x: 0.751; scale-y: 0.745; }
        frame 16 { x: 51.8; y: 12.8; skew-x: 2.3; skew-y: 2.3; scale-x: 0.748; scale-y: 0.744; }
        frame 17 { x: 52.2; y: 12.2; skew-x: 2.8; skew-y: 2.8; scale-x: 0.744; scale-y: 0.742; }
        frame 18 { x: 53.1; y: 11.6; skew-x: 3.6; skew-y: 3.6; scale-x: 0.741; scale-y: 0.741; }
        frame 19 { x: 52.5; y: 12.3; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 52.1; y: 12.9; skew-x: 2.3; skew-y: 2.3; }
        frame 21 { x: 51.8; y: 13.5; skew-x: 1.8; skew-y: 1.8; }
        frame 22 { x: 51.2; y: 14.1; skew-x: 1; skew-y: 1; }
        frame 23 { x: 50.9; y: 14.7; skew-x: 0.5; skew-y: 0.5; }
        frame 24 { x: 50.4; y: 15.2; skew-x: 0; skew-y: 0; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 50; y: 15.5; skew-x: -0.4; skew-y: -0.4; }
        frame 27 { x: 49.6; y: 15.9; skew-x: -0.9; skew-y: -0.9; }
        frame 28 { x: 49.3; y: 16.1; skew-x: -1.5; skew-y: -1.5; }
        frame 29 { x: 48.9; y: 16.6; skew-x: -2.2; skew-y: -2.2; }
        frame 30 { x: 48.5; y: 16.9; skew-x: -2.7; skew-y: -2.7; }
        frame 31 { x: 48; y: 17.2; skew-x: -3.2; skew-y: -3.2; }
        frame 32 { x: 47.8; y: 17.5; skew-x: -3.7; skew-y: -3.7; }
        frame 33 { x: 47.3; y: 18; skew-x: -4.4; skew-y: -4.4; }
        frame 34 { x: 47.9; y: 17.5; skew-x: -3.7; skew-y: -3.7; }
        frame 35 { x: 48.2; y: 17.2; skew-x: -3.2; skew-y: -3.2; }
        frame 36 { x: 48.5; y: 16.9; skew-x: -2.7; skew-y: -2.7; }
        frame 37 { x: 48.9; y: 16.6; skew-x: -2.2; skew-y: -2.2; }
        frame 38 { x: 49.4; y: 16.2; skew-x: -1.5; skew-y: -1.5; }
        frame 39 { x: 49.7; y: 15.8; skew-x: -0.9; skew-y: -0.9; }
        frame 40 { x: 50.1; y: 15.6; skew-x: -0.4; skew-y: -0.4; }
        frame 41 { x: 50.4; y: 15.2; skew-x: 0; skew-y: 0; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 43 { x: 49.6; y: 14.8; }
        frame 44 { x: 48.9; y: 14.4; }
        frame 45 { x: 48.2; y: 14; }
        frame 46 { x: 47.5; y: 13.5; skew-x: 0.2; skew-y: 0.2; }
        frame 47 { x: 47.8; y: 13.8; skew-x: 0; skew-y: 0; }
        frame 48 { x: 48.1; y: 14; skew-x: -10000; skew-y: -10000; }
        frame 49 { x: 48.5; y: 14.2; }
        frame 50 { x: 48.9; y: 14.4; }
        frame 51 { x: 49.3; y: 14.6; }
        frame 52 { x: 49.6; y: 14.9; }
        frame 53 { x: 50; y: 15.1; }
        frame 54 { x: 50.4; y: 15.2; }
        frame 55 { x: -10000; y: -10000; }
        frame 59 { x: 49.8; y: 15.6; skew-x: -0.4; skew-y: -0.4; }
        frame 60 { x: 49.1; y: 16.1; skew-x: -0.9; skew-y: -0.9; }
        frame 61 { x: 48.5; y: 16.5; skew-x: -1.4; skew-y: -1.4; }
        frame 62 { x: 47.9; y: 16.9; skew-x: -2; skew-y: -2; }
        frame 63 { x: 47.2; y: 17.5; skew-x: -2.7; skew-y: -2.7; }
        frame 64 { x: 47.8; y: 17.1; skew-x: -2.2; skew-y: -2.2; }
        frame 65 { x: 48.4; y: 16.7; skew-x: -1.7; skew-y: -1.7; }
        frame 66 { x: 49; y: 16.3; skew-x: -1.2; skew-y: -1.2; }
        frame 67 { x: 49.4; y: 15.9; skew-x: -0.7; skew-y: -0.7; }
        frame 68 { x: 50; y: 15.6; skew-x: -0.2; skew-y: -0.2; }
        frame 69 { x: 50.4; y: 15.2; skew-x: 0; skew-y: 0; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 61; y: 8.8; skew-x: 7.5; skew-y: 7.5; scale-x: 0.74; scale-y: 0.74; }
        frame 72 { x: 72.2; y: 3; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 66.3; y: 5.9; skew-x: 11.3; skew-y: 11.3; }
        frame 74 { x: 60.9; y: 8.8; skew-x: 7.5; skew-y: 7.5; }
        frame 75 { x: 55.5; y: 11.9; skew-x: 3.8; skew-y: 3.8; scale-x: 0.741; scale-y: 0.741; }
        frame 76 { x: 50.4; y: 15.2; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 49; y: 15.8; skew-x: -0.9; skew-y: -0.9; }
        frame 78 { x: 47.5; y: 16.4; skew-x: -2.2; skew-y: -2.2; }
        frame 79 { x: 45.8; y: 17.4; skew-x: -3.4; skew-y: -3.4; }
        frame 80 { x: 43.9; y: 18.3; skew-x: -4.7; skew-y: -4.7; }
        frame 81 { x: 47.9; y: 16.3; skew-x: -1.4; skew-y: -1.4; }
        frame 82 { x: 51.8; y: 14.5; skew-x: 1.5; skew-y: 1.5; }
        frame 83 { x: 51.1; y: 14.8; skew-x: 0.8; skew-y: 0.8; }
        frame 84 { x: 50.4; y: 15.2; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_catapult_driver_mouth";
        frame-count: 85;
        frame 0 { x: 40.8; y: 27.8; scale-x: 0.741; scale-y: 0.741; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_MOUTH; }
        frame 1 { x: 41.1; y: 28.1; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 41.3; y: 28.4; skew-x: -0.6; skew-y: -0.6; }
        frame 3 { x: 41.8; y: 26.7; skew-x: 1.3; skew-y: 1.3; scale-x: 0.74; scale-y: 0.74; }
        frame 4 { x: 42.3; y: 25; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 42.8; y: 23.3; skew-x: 5.6; skew-y: 5.6; }
        frame 6 { x: 43.3; y: 21.7; skew-x: 7.9; skew-y: 7.9; scale-x: 0.741; scale-y: 0.741; }
        frame 7 { x: 43.6; y: 21.2; skew-x: 8.3; skew-y: 8.3; scale-x: 0.74; scale-y: 0.74; }
        frame 8 { x: 43.8; y: 20.7; skew-x: 8.8; skew-y: 8.8; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 43; y: 22.5; skew-x: 6.5; skew-y: 6.5; }
        frame 10 { x: 42.1; y: 24.3; skew-x: 4.3; skew-y: 4.3; }
        frame 11 { x: 41.4; y: 26; skew-x: 2; skew-y: 2; scale-x: 0.741; scale-y: 0.741; }
        frame 12 { x: 40.8; y: 27.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 41.1; y: 28.1; skew-x: -0.2; skew-y: -0.2; }
        frame 14 { x: 41.3; y: 28.4; skew-x: -0.6; skew-y: -0.6; }
        frame 15 { x: 41.8; y: 26.7; skew-x: 1.3; skew-y: 1.3; scale-x: 0.74; scale-y: 0.74; }
        frame 16 { x: 42.3; y: 25; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 42.8; y: 23.3; skew-x: 5.6; skew-y: 5.6; }
        frame 18 { x: 43.3; y: 21.7; skew-x: 7.9; skew-y: 7.9; scale-x: 0.741; scale-y: 0.741; }
        frame 19 { x: 43.6; y: 21.2; skew-x: 8.3; skew-y: 8.3; scale-x: 0.74; scale-y: 0.74; }
        frame 20 { x: 43.8; y: 20.7; skew-x: 8.8; skew-y: 8.8; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 43; y: 22.5; skew-x: 6.5; skew-y: 6.5; }
        frame 22 { x: 42.1; y: 24.3; skew-x: 4.3; skew-y: 4.3; }
        frame 23 { x: 41.4; y: 26; skew-x: 2; skew-y: 2; scale-x: 0.741; scale-y: 0.741; }
        frame 24 { x: 40.8; y: 27.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 40.5; y: 28.2; skew-x: -0.2; skew-y: -0.2; }
        frame 27 { x: 40.1; y: 28.6; skew-x: -0.4; skew-y: -0.4; }
        frame 28 { x: 39.9; y: 29.1; skew-x: -0.7; skew-y: -0.7; }
        frame 29 { x: 39.5; y: 29.5; skew-x: -1.2; skew-y: -1.2; }
        frame 30 { x: 39.2; y: 30; skew-x: -1.4; skew-y: -1.4; }
        frame 31 { x: 39; y: 30.4; skew-x: -1.7; skew-y: -1.7; }
        frame 32 { x: 38.7; y: 30.9; skew-x: -2; skew-y: -2; }
        frame 33 { x: 38.4; y: 31.3; skew-x: -2.4; skew-y: -2.4; }
        frame 34 { x: 38.7; y: 30.9; skew-x: -2; skew-y: -2; }
        frame 35 { x: 39; y: 30.4; skew-x: -1.7; skew-y: -1.7; }
        frame 36 { x: 39.2; y: 30; skew-x: -1.4; skew-y: -1.4; }
        frame 37 { x: 39.5; y: 29.6; skew-x: -1.2; skew-y: -1.2; }
        frame 38 { x: 39.9; y: 29.1; skew-x: -0.7; skew-y: -0.7; }
        frame 39 { x: 40.1; y: 28.7; skew-x: -0.4; skew-y: -0.4; }
        frame 40 { x: 40.5; y: 28.2; skew-x: -0.2; skew-y: -0.2; }
        frame 41 { x: 40.8; y: 27.8; skew-x: 0; skew-y: 0; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 43 { x: 39.7; y: 25.9; skew-x: 2.5; skew-y: 2.5; }
        frame 44 { x: 38.6; y: 24.1; skew-x: 5.3; skew-y: 5.3; scale-x: 0.74; scale-y: 0.74; }
        frame 45 { x: 37.7; y: 22.3; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 36.6; y: 20.4; skew-x: 10.8; skew-y: 10.8; }
        frame 47 { x: 36.8; y: 20.9; skew-x: 12; skew-y: 9.8; scale-x: 0.755; }
        frame 48 { x: 37; y: 21.2; skew-x: 13.3; skew-y: 8.8; scale-x: 0.771; }
        frame 49 { y: 21.5; skew-x: 14.7; skew-y: 8.1; scale-x: 0.787; }
        frame 50 { x: 37.8; y: 22.7; skew-x: 11.8; skew-y: 6.3; scale-x: 0.778; }
        frame 51 { x: 38.5; y: 23.9; skew-x: 8.8; skew-y: 4.8; scale-x: 0.768; }
        frame 52 { x: 39.3; y: 25.3; skew-x: 5.8; skew-y: 3.1; scale-x: 0.759; }
        frame 53 { x: 40; y: 26.5; skew-x: 2.8; skew-y: 1.5; scale-x: 0.75; scale-y: 0.741; }
        frame 54 { x: 40.8; y: 27.8; skew-x: 0; skew-y: 0; scale-x: 0.741; scale-y: -10000; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 58 { x: 40.5; y: 27.1; skew-x: 0.5; skew-y: 0.5; }
        frame 59 { x: 40.2; y: 26.4; skew-x: 1.3; skew-y: 1.3; }
        frame 60 { x: 39.7; y: 27.4; skew-x: 0.3; skew-y: 0.3; }
        frame 61 { x: 39.2; y: 28.4; skew-x: -0.7; skew-y: -0.7; }
        frame 62 { x: 38.8; y: 29.3; skew-x: -1.7; skew-y: -1.7; }
        frame 63 { x: 38.1; y: 30.4; skew-x: -2.7; skew-y: -2.7; }
        frame 64 { x: 38.6; y: 31.2; skew-x: -3.7; skew-y: -1.9; }
        frame 65 { x: 39; y: 31.8; skew-x: -4.7; skew-y: -1.4; scale-x: 0.742; }
        frame 66 { x: 39.5; y: 30.8; skew-x: -3.4; skew-y: -0.9; scale-x: -10000; }
        frame 67 { x: 39.9; y: 29.8; skew-x: -2.2; skew-y: -0.7; scale-x: 0.741; }
        frame 68 { x: 40.3; y: 28.8; skew-x: -0.9; skew-y: -0.2; scale-x: -10000; }
        frame 69 { x: 40.8; y: 27.8; skew-x: 0; skew-y: 0; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 50.1; y: 19.7; skew-x: 7.5; skew-y: 7.5; scale-x: 0.74; scale-y: 0.774; }
        frame 72 { x: 59.8; y: 11.8; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: 0.808; }
        frame 73 { x: 55; y: 15.8; skew-x: 11.3; skew-y: 11.3; scale-y: 0.79; }
        frame 74 { x: 50.1; y: 19.7; skew-x: 7.5; skew-y: 7.5; scale-y: 0.774; }
        frame 75 { x: 45.5; y: 23.8; skew-x: 3.8; skew-y: 3.8; scale-x: 0.741; scale-y: 0.757; }
        frame 76 { x: 40.8; y: 27.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.741; }
        frame 77 { x: 40.1; y: 28; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 78 { x: 39.5; y: 28.3; }
        frame 79 { x: 37.5; y: 29.9; skew-x: -2.2; skew-y: -2.2; }
        frame 80 { x: 35.4; y: 31.6; skew-x: -4.7; skew-y: -4.7; }
        frame 81 { x: 38; y: 29.5; skew-x: -1.4; skew-y: -1.4; }
        frame 82 { x: 40.8; y: 27.3; skew-x: 1.5; skew-y: 1.5; }
        frame 83 { x: -10000; y: 27.6; skew-x: 0.8; skew-y: 0.8; }
        frame 84 { y: 27.8; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_catapult_driver_head";
        frame-count: 85;
        frame 0 { x: 33.8; y: -1.7; scale-x: 0.741; scale-y: 0.741; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_HEAD; }
        frame 1 { x: 34; y: -10000; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: -1.6; skew-x: -0.6; skew-y: -0.6; }
        frame 3 { x: 35.5; y: -3.3; skew-x: 1.3; skew-y: 1.3; scale-x: 0.74; scale-y: 0.74; }
        frame 4 { x: 37.2; y: -5; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 38.8; y: -6.6; skew-x: 5.6; skew-y: 5.6; }
        frame 6 { x: 40.4; y: -8.5; skew-x: 7.9; skew-y: 7.9; scale-x: 0.741; scale-y: 0.741; }
        frame 7 { x: 40.5; y: -8.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.74; scale-y: 0.74; }
        frame 8 { x: 40.7; y: -8.7; skew-x: 8.8; skew-y: 8.8; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 38.8; y: -7; skew-x: 6.5; skew-y: 6.5; }
        frame 10 { x: 37.1; y: -5.3; skew-x: 4.3; skew-y: 4.3; }
        frame 11 { x: 35.3; y: -3.5; skew-x: 2; skew-y: 2; scale-x: 0.741; scale-y: 0.741; }
        frame 12 { x: 33.8; y: -1.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 34; y: -10000; skew-x: -0.2; skew-y: -0.2; }
        frame 14 { y: -1.6; skew-x: -0.6; skew-y: -0.6; }
        frame 15 { x: 35.5; y: -3.3; skew-x: 1.3; skew-y: 1.3; scale-x: 0.74; scale-y: 0.74; }
        frame 16 { x: 37.2; y: -5; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 38.8; y: -6.6; skew-x: 5.6; skew-y: 5.6; }
        frame 18 { x: 40.4; y: -8.5; skew-x: 7.9; skew-y: 7.9; scale-x: 0.741; scale-y: 0.741; }
        frame 19 { x: 40.5; y: -8.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.74; scale-y: 0.74; }
        frame 20 { x: 40.7; y: -8.7; skew-x: 8.8; skew-y: 8.8; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 38.8; y: -7; skew-x: 6.5; skew-y: 6.5; }
        frame 22 { x: 37.1; y: -5.3; skew-x: 4.3; skew-y: 4.3; }
        frame 23 { x: 35.3; y: -3.5; skew-x: 2; skew-y: 2; scale-x: 0.741; scale-y: 0.741; }
        frame 24 { x: 33.8; y: -1.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 33.4; y: -1.2; skew-x: -0.2; skew-y: -0.2; }
        frame 27 { x: 33; y: -0.7; skew-x: -0.4; skew-y: -0.4; }
        frame 28 { x: 32.5; y: -0.2; skew-x: -0.7; skew-y: -0.7; }
        frame 29 { x: 32; y: 0.2; skew-x: -1.2; skew-y: -1.2; }
        frame 30 { x: 31.5; y: 0.6; skew-x: -1.4; skew-y: -1.4; }
        frame 31 { x: 31.1; y: 1.1; skew-x: -1.7; skew-y: -1.7; }
        frame 32 { x: 30.7; y: 1.6; skew-x: -2; skew-y: -2; }
        frame 33 { x: 30.2; y: 2; skew-x: -2.4; skew-y: -2.4; }
        frame 34 { x: 30.7; y: 1.6; skew-x: -2; skew-y: -2; }
        frame 35 { x: 31.1; y: 1.1; skew-x: -1.7; skew-y: -1.7; }
        frame 36 { x: 31.5; y: 0.6; skew-x: -1.4; skew-y: -1.4; }
        frame 37 { x: 32; y: 0.1; skew-x: -1.2; skew-y: -1.2; }
        frame 38 { x: 32.5; y: -0.3; skew-x: -0.7; skew-y: -0.7; }
        frame 39 { x: 33; y: -0.8; skew-x: -0.4; skew-y: -0.4; }
        frame 40 { x: 33.4; y: -1.3; skew-x: -0.2; skew-y: -0.2; }
        frame 41 { x: 33.8; y: -1.7; skew-x: 0; skew-y: 0; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 43 { x: 34; y: -3.7; skew-x: 2.5; skew-y: 2.5; }
        frame 44 { x: 34.5; y: -5.8; skew-x: 5.3; skew-y: 5.3; scale-x: 0.74; scale-y: 0.74; }
        frame 45 { x: 35; y: -7.8; skew-x: 8; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 35.5; y: -9.8; skew-x: 10.8; skew-y: 10.8; }
        frame 47 { x: 35.2; y: -8.9; skew-x: 9.8; skew-y: 9.8; }
        frame 48 { x: 34.8; y: -8.1; skew-x: 8.8; skew-y: 8.8; }
        frame 49 { x: 34.6; y: -7.5; skew-x: 8.1; skew-y: 8.1; }
        frame 50 { x: 34.4; y: -6.4; skew-x: 6.3; skew-y: 6.3; }
        frame 51 { x: 34.3; y: -5.3; skew-x: 4.8; skew-y: 4.8; }
        frame 52 { x: 34.1; y: -4; skew-x: 3.1; skew-y: 3.1; }
        frame 53 { x: 34; y: -2.9; skew-x: 1.5; skew-y: 1.5; scale-x: 0.741; scale-y: 0.741; }
        frame 54 { x: 33.8; y: -1.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { x: 33.5; y: -1.9; skew-x: 0.5; skew-y: 0.5; }
        frame 59 { x: 33.3; y: -2.2; skew-x: 1.3; skew-y: 1.3; }
        frame 60 { x: 32.4; y: -1.3; skew-x: 0.3; skew-y: 0.3; }
        frame 61 { x: 31.5; y: -0.4; skew-x: -0.7; skew-y: -0.7; }
        frame 62 { x: 30.6; y: 0.3; skew-x: -1.7; skew-y: -1.7; }
        frame 63 { x: 29.8; y: 1.2; skew-x: -2.7; skew-y: -2.7; }
        frame 64 { x: 29.6; y: 1.5; skew-x: -3.2; skew-y: -3.4; }
        frame 65 { x: 29.2; y: 1.9; skew-x: -4; skew-y: -4.4; }
        frame 66 { x: 30.4; y: 0.9; skew-x: -2.9; skew-y: -3.2; }
        frame 67 { x: 31.5; y: 0; skew-x: -1.9; skew-y: -2.2; }
        frame 68 { x: 32.6; y: -0.7; skew-x: -0.9; skew-y: -0.9; }
        frame 69 { x: 33.8; y: -1.7; skew-x: 0; skew-y: 0; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 49.5; y: -11.6; skew-x: 11.1; skew-y: 11.1; scale-x: 0.74; scale-y: 0.748; }
        frame 72 { x: 65.9; y: -20.5; skew-x: 22.4; skew-y: 22.4; scale-x: -10000; scale-y: 0.755; }
        frame 73 { x: 57.6; y: -16.1; skew-x: 16.8; skew-y: 16.8; scale-y: 0.751; }
        frame 74 { x: 49.4; y: -11.5; skew-x: 11.1; skew-y: 11.1; scale-y: 0.748; }
        frame 75 { x: 41.5; y: -6.7; skew-x: 5.5; skew-y: 5.5; scale-y: 0.744; }
        frame 76 { x: 33.8; y: -1.7; skew-x: 0; skew-y: 0; scale-x: 0.741; scale-y: 0.741; }
        frame 77 { x: 32.1; y: -0.8; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 30.3; y: 0; skew-x: -2.2; skew-y: -2.2; }
        frame 79 { x: 27.9; y: 2.3; skew-x: -3.4; skew-y: -3.4; }
        frame 80 { x: 25.5; y: 4.5; skew-x: -4.7; skew-y: -4.7; }
        frame 81 { x: 31.2; y: -0; skew-x: 0; skew-y: 0; }
        frame 82 { x: 37; y: -4.5; skew-x: 4.8; skew-y: 4.8; }
        frame 83 { x: 35.3; y: -3.1; skew-x: 2.3; skew-y: 2.3; }
        frame 84 { x: 33.8; y: -1.7; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Zombie_catapult_driver_outerleg_foot";
        frame-count: 85;
        frame 0 { x: 76.7; y: 105; scale-x: 0.778; scale-y: 0.741; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_OUTERLEG_FOOT; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
    }
    Track {
        source-name: "Zombie_catapult_driver_outerleg_lower";
        frame-count: 85;
        frame 0 { x: 88.3; y: 87.9; scale-x: 0.741; scale-y: 0.741; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_OUTERLEG_LOWER; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
    }
    Track {
        source-name: "Zombie_catapult_driver_outerleg_upper";
        frame-count: 85;
        frame 0 { x: 88; y: 64.2; scale-x: 0.741; scale-y: 0.741; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_OUTERLEG_UPPER; }
        frame 1 { x: 87.9; y: 64; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 87.8; y: 63.8; skew-x: 1; skew-y: 1; }
        frame 3 { x: -10000; y: 63.5; skew-x: 1.8; skew-y: 1.8; }
        frame 4 { x: 87.7; y: 63.3; skew-x: 2.3; skew-y: 2.3; }
        frame 5 { x: 87.5; y: 63; skew-x: 2.8; skew-y: 2.8; }
        frame 6 { x: 87.6; y: 62.9; skew-x: 3.6; skew-y: 3.6; }
        frame 7 { x: -10000; y: 63.1; skew-x: 2.8; skew-y: 2.8; }
        frame 8 { x: 87.7; y: 63.4; skew-x: 2.3; skew-y: 2.3; }
        frame 9 { x: 87.8; y: 63.6; skew-x: 1.8; skew-y: 1.8; }
        frame 10 { x: -10000; y: 63.8; skew-x: 1; skew-y: 1; }
        frame 11 { x: 88; y: 64.1; skew-x: 0.5; skew-y: 0.5; }
        frame 12 { x: -10000; y: 64.2; skew-x: 0; skew-y: 0; }
        frame 13 { x: 87.9; y: 64; skew-x: 0.5; skew-y: 0.5; }
        frame 14 { x: 87.8; y: 63.8; skew-x: 1; skew-y: 1; }
        frame 15 { x: -10000; y: 63.5; skew-x: 1.8; skew-y: 1.8; }
        frame 16 { x: 87.7; y: 63.3; skew-x: 2.3; skew-y: 2.3; }
        frame 17 { x: 87.5; y: 63; skew-x: 2.8; skew-y: 2.8; }
        frame 18 { x: 87.6; y: 62.9; skew-x: 3.6; skew-y: 3.6; }
        frame 19 { x: -10000; y: 63.1; skew-x: 2.8; skew-y: 2.8; }
        frame 20 { x: 87.7; y: 63.4; skew-x: 2.3; skew-y: 2.3; }
        frame 21 { x: 87.8; y: 63.6; skew-x: 1.8; skew-y: 1.8; }
        frame 22 { x: -10000; y: 63.8; skew-x: 1; skew-y: 1; }
        frame 23 { x: 88; y: 64.1; skew-x: 0.5; skew-y: 0.5; }
        frame 24 { x: -10000; y: 64.2; skew-x: 0; skew-y: 0; }
        frame 25 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 43 { x: 87.5; y: 64.7; skew-x: -1.4; skew-y: -1.4; }
        frame 44 { x: 86.8; y: 65.2; skew-x: -2.9; skew-y: -2.9; }
        frame 45 { x: 86.3; y: 65.6; skew-x: -4.4; skew-y: -4.4; }
        frame 46 { x: 85.8; y: 66.2; skew-x: -6; skew-y: -6; }
        frame 47 { x: 86.2; y: 65.9; skew-x: -5.2; skew-y: -5.2; scale-x: 0.74; scale-y: 0.74; }
        frame 48 { x: 86.4; y: 65.6; skew-x: -4.4; skew-y: -4.4; scale-x: 0.741; scale-y: 0.741; }
        frame 49 { x: 86.7; y: 65.4; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 87; y: 65.2; skew-x: -2.9; skew-y: -2.9; }
        frame 51 { x: 87.2; y: 65; skew-x: -2.2; skew-y: -2.2; }
        frame 52 { x: 87.5; y: 64.7; skew-x: -1.4; skew-y: -1.4; }
        frame 53 { x: 87.8; y: 64.5; skew-x: -0.7; skew-y: -0.7; }
        frame 54 { x: 88; y: 64.2; skew-x: 0; skew-y: 0; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { x: 87.9; skew-x: -0.2; skew-y: -0.2; }
        frame 59 { x: 87.8; y: 64.3; skew-x: -0.7; skew-y: -0.7; }
        frame 60 { x: 87.6; y: -10000; skew-x: -1.2; skew-y: -1.2; }
        frame 61 { x: 87.4; skew-x: -1.7; skew-y: -1.7; }
        frame 62 { x: 87.3; y: 64.5; skew-x: -2.2; skew-y: -2.2; }
        frame 63 { x: 87.2; y: -10000; skew-x: -2.7; skew-y: -2.7; }
        frame 64 { x: 87.3; skew-x: -2.2; skew-y: -2.2; }
        frame 65 { x: 87.5; y: 64.4; skew-x: -1.7; skew-y: -1.7; }
        frame 66 { x: 87.7; y: 64.3; skew-x: -1.2; skew-y: -1.2; }
        frame 67 { x: 87.8; y: -10000; skew-x: -0.7; skew-y: -0.7; }
        frame 68 { x: 88; y: 64.2; skew-x: -0.2; skew-y: -0.2; }
        frame 69 { x: -10000; y: -10000; skew-x: 0; skew-y: 0; }
        frame 70 { skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 91.6; y: 62; skew-x: 7.5; skew-y: 7.5; scale-x: 0.74; scale-y: 0.74; }
        frame 72 { x: 95.5; y: 60.2; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 93.5; y: 61.1; skew-x: 11.3; skew-y: 11.3; }
        frame 74 { x: 91.7; y: 62.1; skew-x: 7.5; skew-y: 7.5; }
        frame 75 { x: 89.8; y: 63; skew-x: 3.8; skew-y: 3.8; scale-x: 0.741; scale-y: 0.741; }
        frame 76 { x: 88; y: 64.2; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 87.6; y: 64; skew-x: -0.9; skew-y: -0.9; }
        frame 78 { x: 87.1; y: 63.9; skew-x: -2.2; skew-y: -2.2; }
        frame 79 { x: 86.2; y: 64; skew-x: -3.4; skew-y: -3.4; }
        frame 80 { x: 85.5; y: 63.9; skew-x: -4.7; skew-y: -4.7; }
        frame 81 { x: 86.9; y: 64.1; skew-x: -2.2; skew-y: -2.2; }
        frame 82 { x: 88; y: 64.2; skew-x: 0; skew-y: 0; }
        frame 83 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "Zombie_catapult_driver_hankie";
        frame-count: 85;
        frame 0 { x: 114.6; y: 61.5; scale-x: 0.741; scale-y: 0.741; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_HANKIE; }
        frame 1 { x: -10000; y: 61.6; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: 0.755; image: none; }
        frame 2 { y: 61.7; skew-x: 4.1; skew-y: 4.1; scale-y: 0.769; }
        frame 3 { x: 114.5; y: 61.6; skew-x: 4.3; skew-y: 4.3; scale-y: 0.762; }
        frame 4 { x: -10000; y: 61.7; skew-x: 4.8; skew-y: 4.8; scale-x: 0.74; scale-y: 0.755; }
        frame 5 { y: 61.6; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: 0.748; }
        frame 6 { x: 114.3; y: -10000; skew-x: 5.8; skew-y: 5.8; scale-x: 0.741; scale-y: 0.741; }
        frame 7 { x: 113.9; y: 61.9; skew-x: 2; skew-y: 2; scale-x: 0.74; scale-y: 0.74; }
        frame 8 { x: 113.7; y: 62; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 113.4; y: 62.4; skew-x: -5.2; skew-y: -5.2; }
        frame 10 { x: 113.2; y: 62.6; skew-x: -8.9; skew-y: -8.9; }
        frame 11 { x: 114; y: 62.1; skew-x: -4.2; skew-y: -4.2; }
        frame 12 { x: 114.6; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.741; scale-y: 0.741; }
        frame 13 { x: -10000; y: 61.6; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: 0.755; }
        frame 14 { y: 61.7; skew-x: 4.1; skew-y: 4.1; scale-y: 0.769; }
        frame 15 { x: 114.5; y: -10000; skew-x: 3.8; skew-y: 3.8; scale-y: 0.762; }
        frame 16 { x: 114.4; skew-x: -10000; skew-y: -10000; scale-y: 0.755; }
        frame 17 { x: 114.3; y: 61.8; skew-x: 3.5; skew-y: 3.5; scale-y: 0.748; }
        frame 18 { x: -10000; y: -10000; skew-x: 3.6; skew-y: 3.6; scale-y: 0.741; }
        frame 19 { x: 114; y: 62; skew-x: 0.3; skew-y: 0.3; scale-y: -10000; }
        frame 20 { x: 113.7; y: 62.1; skew-x: -2.5; skew-y: -2.5; scale-x: 0.74; scale-y: 0.74; }
        frame 21 { x: 113.3; y: 62.4; skew-x: -5.7; skew-y: -5.7; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 113.2; y: 62.6; skew-x: -8.9; skew-y: -8.9; }
        frame 23 { x: 114; y: 62.1; skew-x: -4.2; skew-y: -4.2; }
        frame 24 { x: 114.6; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.741; scale-y: 0.741; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 114.1; y: 61.1; skew-x: -2.9; skew-y: -2.9; }
        frame 44 { x: 113.4; y: 60.9; skew-x: -6.2; skew-y: -6.2; scale-x: 0.74; scale-y: 0.74; }
        frame 45 { x: 112.9; y: 60.6; skew-x: -9.2; skew-y: -9.2; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 112.2; y: 60.4; skew-x: -12.4; skew-y: -12.4; }
        frame 47 { x: 112.5; y: 60.5; skew-x: -10.7; skew-y: -10.7; }
        frame 48 { x: 112.8; y: 60.6; skew-x: -9.2; skew-y: -9.2; }
        frame 49 { x: 113.1; y: 60.8; skew-x: -7.7; skew-y: -7.7; }
        frame 50 { x: 113.3; y: 60.9; skew-x: -6.2; skew-y: -6.2; }
        frame 51 { x: 113.7; y: 61; skew-x: -4.5; skew-y: -4.5; }
        frame 52 { x: 114; y: 61.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.741; scale-y: 0.741; }
        frame 53 { x: 114.3; y: 61.3; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 114.6; y: 61.5; skew-x: 0; skew-y: 0; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { x: 114.5; y: 61.3; skew-x: -0.4; skew-y: -2.9; scale-y: 0.742; }
        frame 59 { x: 114.3; y: 61; skew-x: -0.9; skew-y: -6.2; scale-y: 0.744; }
        frame 60 { x: 114.2; y: 60.9; skew-x: -1.2; skew-y: -5.2; scale-y: 0.743; }
        frame 61 { x: 114; y: 60.8; skew-x: -1.7; skew-y: -4.4; scale-y: 0.742; }
        frame 62 { x: 113.8; y: 60.6; skew-x: -2.2; skew-y: -3.4; scale-y: 0.741; }
        frame 63 { x: 113.6; y: 60.5; skew-x: -2.7; skew-y: -2.7; scale-y: -10000; }
        frame 64 { x: 113.7; y: 60.6; skew-x: -1.9; skew-y: -0.2; }
        frame 65 { x: 114; y: 60.9; skew-x: -1.4; skew-y: 2; scale-y: 0.742; }
        frame 66 { x: 114.2; y: 61; skew-x: -0.9; skew-y: 1.5; scale-y: -10000; }
        frame 67 { x: 114.3; y: 61.1; skew-x: -0.7; skew-y: 1; }
        frame 68 { x: 114.5; y: 61.3; skew-x: -0.2; skew-y: 0.5; scale-y: 0.741; }
        frame 69 { x: 114.6; y: 61.5; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 118.2; y: 63; skew-x: 7.5; skew-y: 7.5; scale-x: 0.74; scale-y: 0.74; }
        frame 72 { x: 121.8; y: 64.6; skew-x: 15.3; skew-y: 15.3; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 120.1; y: 63.7; skew-x: 11.3; skew-y: 11.3; }
        frame 74 { x: 118.3; y: 63; skew-x: 7.5; skew-y: 7.5; }
        frame 75 { x: 116.5; y: 62.1; skew-x: 3.8; skew-y: 3.8; scale-x: 0.741; scale-y: 0.741; }
        frame 76 { x: 114.6; y: 61.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 114.2; y: 60.8; skew-x: -0.9; skew-y: -0.9; }
        frame 78 { x: 113.6; y: 60; skew-x: -2.2; skew-y: -2.2; }
        frame 79 { x: 112.4; skew-x: -7.5; skew-y: -7.5; scale-x: 0.74; scale-y: 0.74; }
        frame 80 { x: 111.3; y: 59.8; skew-x: -13; skew-y: -13; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 113; y: 60.5; skew-x: -6.4; skew-y: -6.4; }
        frame 82 { x: 114.6; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.741; scale-y: 0.741; }
        frame 83 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_catapult_driver_outerarm_hand";
        frame-count: 85;
        frame 0 { x: 59.2; y: 62; skew-x: 39; skew-y: 40.7; scale-x: 0.737; scale-y: 0.742; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_OUTERARM_HAND; }
        frame 1 { x: 59.4; y: 61.8; skew-x: 39.6; skew-y: 41.4; scale-x: 0.735; scale-y: 0.741; image: none; }
        frame 2 { x: 59.6; y: 61.7; skew-x: 40.3; skew-y: 42.1; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 59.8; y: 61.6; skew-x: 40.9; skew-y: 42.8; }
        frame 4 { x: 59.9; y: 61.5; skew-x: 41.6; skew-y: 43.4; }
        frame 5 { x: 60; y: 61.4; skew-x: 42.4; skew-y: 44.1; }
        frame 6 { x: 60.1; y: 61.2; skew-x: 43; skew-y: 44.8; scale-x: 0.736; scale-y: 0.742; }
        frame 7 { x: 60; y: 61.3; skew-x: 42.4; skew-y: 44.1; scale-x: 0.735; scale-y: 0.741; }
        frame 8 { x: 59.8; y: 61.5; skew-x: 41.6; skew-y: 43.4; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 59.6; y: 61.6; skew-x: 40.9; skew-y: 42.8; }
        frame 10 { x: 59.5; y: 61.7; skew-x: 40.3; skew-y: 42.1; }
        frame 11 { x: 59.3; y: 61.9; skew-x: 39.6; skew-y: 41.4; }
        frame 12 { x: 59.2; y: 62; skew-x: 39; skew-y: 40.7; scale-x: 0.737; scale-y: 0.742; }
        frame 13 { x: -10000; y: -10000; skew-x: 38.9; skew-y: 40.6; scale-x: 0.735; scale-y: 0.741; }
        frame 14 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 18 { skew-x: 39; skew-y: 40.7; scale-x: 0.737; scale-y: 0.742; }
        frame 19 { skew-x: 38.9; skew-y: 40.6; scale-x: 0.735; scale-y: 0.741; }
        frame 20 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 24 { skew-x: 39; skew-y: 40.7; scale-x: 0.737; scale-y: 0.742; }
        frame 25 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { y: 62; skew-x: 38.9; skew-y: 40.6; scale-x: 0.735; scale-y: 0.741; }
        frame 27 { x: 59.1; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 59.2; y: 62; }
        frame 29 { x: -10000; y: -10000; scale-y: 0.74; }
        frame 30 { y: 62; scale-y: -10000; }
        frame 31 { x: 59.1; y: -10000; }
        frame 32 { x: -10000; scale-x: 0.734; }
        frame 33 { x: 59.2; y: 62; scale-x: 0.735; scale-y: 0.741; }
        frame 34 { x: -10000; scale-x: 0.734; scale-y: 0.74; }
        frame 35 { x: 59.3; y: -10000; scale-x: 0.735; scale-y: -10000; }
        frame 36 { x: -10000; scale-x: -10000; }
        frame 37 { x: 59.2; }
        frame 38 { x: -10000; scale-y: 0.741; }
        frame 39 { scale-y: -10000; }
        frame 40 { x: 59.3; y: 62; }
        frame 41 { x: 59.2; y: -10000; skew-x: 39; skew-y: 40.7; scale-x: 0.737; scale-y: 0.742; }
        frame 42 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 58.5; y: 62; skew-x: 38.9; skew-y: 40.6; scale-x: 0.735; scale-y: 0.741; }
        frame 44 { x: 57.9; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.74; }
        frame 45 { x: 57.1; y: 62.2; scale-y: -10000; }
        frame 46 { x: 56.6; y: 62.1; scale-y: 0.741; }
        frame 47 { x: 56.9; y: 62.2; scale-x: 0.734; scale-y: 0.74; }
        frame 48 { x: 57.3; y: -10000; scale-x: 0.735; scale-y: -10000; }
        frame 49 { x: 57.6; y: 62.1; scale-x: -10000; }
        frame 50 { x: 57.9; y: 62; }
        frame 51 { x: 58.3; y: -10000; scale-y: 0.741; }
        frame 52 { x: 58.5; scale-y: -10000; }
        frame 53 { x: 58.9; }
        frame 54 { x: 59.2; y: 62; skew-x: 39; skew-y: 40.7; scale-x: 0.737; scale-y: 0.742; }
        frame 55 { x: -10000; y: -10000; skew-x: 38.9; skew-y: 40.6; scale-x: 0.735; scale-y: 0.741; }
        frame 56 { skew-x: 39; skew-y: 40.7; scale-x: 0.737; scale-y: 0.742; }
        frame 57 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { skew-x: 38.9; skew-y: 40.6; scale-x: 0.735; scale-y: 0.741; }
        frame 60 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 63 { skew-x: 39; skew-y: 40.7; scale-x: 0.737; scale-y: 0.742; }
        frame 64 { skew-x: 38.9; skew-y: 40.6; scale-x: 0.735; scale-y: 0.741; }
        frame 65 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 69 { skew-x: 39; skew-y: 40.7; scale-x: 0.737; scale-y: 0.742; }
        frame 70 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 66.7; y: 50.5; skew-x: 62.9; skew-y: 64.7; scale-x: 0.735; scale-y: 0.74; }
        frame 72 { x: 73.8; y: 41.4; skew-x: 86.7; skew-y: 88.5; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 70.5; y: 44.6; skew-x: 79.9; skew-y: 81.7; scale-x: 0.734; }
        frame 74 { x: 67; y: 48; skew-x: 73; skew-y: 74.7; scale-x: 0.735; }
        frame 75 { x: 63.5; y: 51.5; skew-x: 66; skew-y: 67.7; scale-x: -10000; }
        frame 76 { x: 59.8; y: 55.4; skew-x: 59.1; skew-y: 60.8; scale-x: 0.736; scale-y: 0.741; }
        frame 77 { x: 59; y: 58.9; skew-x: 47.9; skew-y: 49.6; scale-x: 0.735; scale-y: -10000; }
        frame 78 { x: 58.2; y: 62.8; skew-x: 36.7; skew-y: 38.4; scale-x: 0.736; scale-y: 0.742; }
        frame 79 { x: 57.7; y: 66.2; skew-x: 31.1; skew-y: 32.8; scale-x: 0.735; scale-y: 0.741; }
        frame 80 { x: 57.3; y: 69.8; skew-x: 25.3; skew-y: 27.1; scale-x: 0.736; scale-y: 0.742; }
        frame 81 { x: 58.1; y: 64.3; skew-x: 35.3; skew-y: 37.1; scale-x: 0.735; scale-y: 0.741; }
        frame 82 { x: 59.2; y: 59; skew-x: 45.3; skew-y: 47.1; scale-x: 0.736; scale-y: 0.742; }
        frame 83 { x: -10000; y: 60.5; skew-x: 42.1; skew-y: 43.9; scale-x: 0.735; scale-y: 0.741; }
        frame 84 { y: 62; skew-x: 39; skew-y: 40.7; scale-x: 0.737; scale-y: 0.742; }
    }
    Track {
        source-name: "Zombie_catapult_driver_outerarm_upper";
        frame-count: 85;
        frame 0 { x: 71.5; y: 28.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.741; scale-y: 0.741; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_OUTERARM_UPPER; }
        frame 1 { x: 71.6; y: 28.5; skew-x: 6.8; skew-y: 6.8; scale-x: 0.74; scale-y: 0.74; image: none; }
        frame 2 { x: 71.7; y: 28.3; skew-x: 7.1; skew-y: 7.1; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 71.9; y: 28; skew-x: 7.5; skew-y: 7.5; }
        frame 4 { x: 72.1; y: 27.9; skew-x: 7.8; skew-y: 7.8; }
        frame 5 { x: 72.2; y: 27.6; skew-x: 8.1; skew-y: 8.1; }
        frame 6 { x: 72.5; y: 27.3; skew-x: 8.6; skew-y: 8.6; }
        frame 7 { x: 72.3; y: 27.6; skew-x: 8.1; skew-y: 8.1; }
        frame 8 { x: 72.1; y: 27.9; skew-x: 7.8; skew-y: 7.8; }
        frame 9 { x: 72; y: 28.1; skew-x: 7.5; skew-y: 7.5; }
        frame 10 { x: 71.8; y: 28.3; skew-x: 7.1; skew-y: 7.1; }
        frame 11 { x: 71.7; y: 28.5; skew-x: 6.8; skew-y: 6.8; }
        frame 12 { x: 71.5; y: 28.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.741; scale-y: 0.741; }
        frame 13 { x: 71.6; y: 28.5; skew-x: 6.8; skew-y: 6.8; scale-x: 0.74; scale-y: 0.74; }
        frame 14 { x: 71.7; y: 28.3; skew-x: 7.1; skew-y: 7.1; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 71.9; y: 28; skew-x: 7.5; skew-y: 7.5; }
        frame 16 { x: 72.1; y: 27.9; skew-x: 7.8; skew-y: 7.8; }
        frame 17 { x: 72.2; y: 27.6; skew-x: 8.1; skew-y: 8.1; }
        frame 18 { x: 72.5; y: 27.3; skew-x: 8.6; skew-y: 8.6; }
        frame 19 { x: 72.3; y: 27.6; skew-x: 8.1; skew-y: 8.1; }
        frame 20 { x: 72.1; y: 27.9; skew-x: 7.8; skew-y: 7.8; }
        frame 21 { x: 72; y: 28.1; skew-x: 7.5; skew-y: 7.5; }
        frame 22 { x: 71.8; y: 28.3; skew-x: 7.1; skew-y: 7.1; }
        frame 23 { x: 71.7; y: 28.5; skew-x: 6.8; skew-y: 6.8; }
        frame 24 { x: 71.5; y: 28.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.741; scale-y: 0.741; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 71.1; y: 28.9; skew-x: 5.8; skew-y: 5.8; scale-x: 0.74; scale-y: 0.74; }
        frame 27 { x: 70.8; y: 29; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 70.7; y: 29.1; skew-x: 4.8; skew-y: 4.8; }
        frame 29 { x: 70.3; y: 29.2; skew-x: 4.3; skew-y: 4.3; }
        frame 30 { x: 70; y: 29.5; skew-x: 3.5; skew-y: 3.5; }
        frame 31 { x: 69.8; y: 29.6; skew-x: 3; skew-y: 3; }
        frame 32 { x: 69.5; y: 29.7; skew-x: 2.5; skew-y: 2.5; }
        frame 33 { x: 69.2; y: 29.8; skew-x: 2; skew-y: 2; }
        frame 34 { x: 69.5; y: 29.6; skew-x: 2.5; skew-y: 2.5; }
        frame 35 { x: 69.8; y: 29.5; skew-x: 3; skew-y: 3; }
        frame 36 { x: 70.1; y: 29.4; skew-x: 3.5; skew-y: 3.5; }
        frame 37 { x: 70.3; y: 29.2; skew-x: 4.3; skew-y: 4.3; }
        frame 38 { x: 70.6; y: 29; skew-x: 4.8; skew-y: 4.8; }
        frame 39 { x: 70.8; y: 28.9; skew-x: 5.3; skew-y: 5.3; }
        frame 40 { x: 71.1; y: 28.8; skew-x: 5.8; skew-y: 5.8; }
        frame 41 { x: 71.5; y: 28.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.741; scale-y: 0.741; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 70.7; y: 28.2; scale-x: 0.74; scale-y: 0.74; }
        frame 44 { x: 69.9; y: 28; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 69.1; y: 27.5; }
        frame 46 { x: 68.3; y: 27.1; skew-x: 6.7; skew-y: 6.7; }
        frame 47 { x: 68.8; y: 27.4; skew-x: 6.6; skew-y: 6.6; }
        frame 48 { x: 69.2; y: 27.5; skew-x: 6.5; skew-y: 6.5; }
        frame 49 { x: 69.5; y: 27.7; skew-x: -10000; skew-y: -10000; }
        frame 50 { x: 69.8; y: 27.9; }
        frame 51 { x: 70.2; y: 28; }
        frame 52 { x: 70.6; y: 28.3; }
        frame 53 { x: 71.1; y: 28.5; }
        frame 54 { x: 71.5; y: 28.7; scale-x: 0.741; scale-y: 0.741; }
        frame 55 { x: 71.3; y: -10000; scale-x: 0.74; scale-y: 0.74; }
        frame 56 { x: 71.5; scale-x: 0.741; scale-y: 0.741; }
        frame 57 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 70.8; y: 29.2; skew-x: 5.5; skew-y: 5.5; scale-x: 0.74; scale-y: 0.74; }
        frame 60 { x: 70.2; y: 29.8; skew-x: 4.5; skew-y: 4.5; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 69.6; y: 30.4; skew-x: 3.5; skew-y: 3.5; }
        frame 62 { x: 68.9; y: 30.9; skew-x: 2.5; skew-y: 2.5; }
        frame 63 { x: 68.3; y: 31.5; skew-x: 1.7; skew-y: 1.7; }
        frame 64 { x: 68.8; y: 31; skew-x: 2.5; skew-y: 2.5; }
        frame 65 { x: 69.3; y: 30.5; skew-x: 3.3; skew-y: 3.3; }
        frame 66 { x: 69.9; y: 30.1; skew-x: 4; skew-y: 4; }
        frame 67 { x: 70.3; y: 29.6; skew-x: 4.8; skew-y: 4.8; }
        frame 68 { x: 70.9; y: 29.2; skew-x: 5.6; skew-y: 5.6; }
        frame 69 { x: 71.5; y: 28.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.741; scale-y: 0.741; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 82; y: 24.9; skew-x: 16.6; skew-y: 16.6; scale-x: 0.74; scale-y: 0.74; }
        frame 72 { x: 93.1; y: 21.7; skew-x: 26.9; skew-y: 26.9; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 88.7; y: 23.2; skew-x: 23.3; skew-y: 23.3; scale-x: 0.739; scale-y: 0.739; }
        frame 74 { x: 84.3; y: 24.8; skew-x: 19.8; skew-y: 19.8; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 79.8; y: 26.4; skew-x: 16.3; skew-y: 16.3; scale-x: 0.74; scale-y: 0.74; }
        frame 76 { x: 75.3; y: 28.1; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 72.2; y: 28.5; skew-x: 8.5; skew-y: 8.5; }
        frame 78 { x: 69.2; y: 29; skew-x: 4.3; skew-y: 4.3; scale-x: 0.741; scale-y: 0.741; }
        frame 79 { x: 67.6; y: 30.1; skew-x: 2.8; skew-y: 2.8; scale-x: 0.74; scale-y: 0.74; }
        frame 80 { x: 66; y: 30.9; skew-x: 1.7; skew-y: 1.7; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 69.1; y: 29.8; skew-x: 4.8; skew-y: 4.8; }
        frame 82 { x: 72.4; y: 28.5; skew-x: 8.1; skew-y: 8.1; scale-x: 0.741; scale-y: 0.741; }
        frame 83 { x: 71.9; y: 28.6; skew-x: 7.3; skew-y: 7.3; scale-x: 0.74; scale-y: 0.74; }
        frame 84 { x: 71.5; y: 28.7; skew-x: 6.5; skew-y: 6.5; scale-x: 0.741; scale-y: 0.741; }
    }
    Track {
        source-name: "Zombie_catapult_driver_outerarm_lower";
        frame-count: 85;
        frame 0 { x: 68.8; y: 51; skew-x: 18.6; skew-y: 20.4; scale-x: 0.737; scale-y: 0.743; image: IMAGE_REANIM_ZOMBIE_CATAPULT_DRIVER_OUTERARM_LOWER; }
        frame 1 { x: -10000; skew-x: 18.5; skew-y: 20.3; scale-x: -10000; scale-y: 0.742; image: none; }
        frame 2 { x: 68.7; y: 50.9; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 3 { x: -10000; y: 50.8; }
        frame 4 { y: 50.5; }
        frame 5 { x: 68.6; y: -10000; skew-x: 18.3; skew-y: 20.1; scale-x: 0.736; }
        frame 6 { x: -10000; y: 50.3; skew-x: 18.4; skew-y: 20.2; scale-x: 0.737; scale-y: 0.743; }
        frame 7 { x: 68.7; y: 50.4; skew-x: 18.3; skew-y: 20.1; scale-x: 0.736; scale-y: 0.742; }
        frame 8 { x: 68.8; y: 50.5; skew-x: 18.5; skew-y: 20.3; scale-x: 0.737; scale-y: -10000; }
        frame 9 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.736; }
        frame 10 { y: 50.8; scale-x: -10000; }
        frame 11 { x: 68.9; y: 50.9; }
        frame 12 { x: 68.8; y: 51; skew-x: 18.6; skew-y: 20.4; scale-x: 0.737; scale-y: 0.743; }
        frame 13 { x: -10000; skew-x: 18.5; skew-y: 20.3; scale-x: -10000; scale-y: 0.742; }
        frame 14 { x: 68.7; y: 50.9; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 15 { x: -10000; y: 50.8; }
        frame 16 { y: 50.5; }
        frame 17 { x: 68.6; y: -10000; skew-x: 18.3; skew-y: 20.1; scale-x: 0.736; }
        frame 18 { x: -10000; y: 50.3; skew-x: 18.4; skew-y: 20.2; scale-x: 0.737; scale-y: 0.743; }
        frame 19 { y: 50.4; skew-x: 18.3; skew-y: 20.1; scale-x: 0.736; scale-y: 0.742; }
        frame 20 { x: 68.8; y: 50.5; skew-x: 18.5; skew-y: 20.3; scale-x: 0.737; scale-y: -10000; }
        frame 21 { x: -10000; y: 50.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 22 { y: -10000; }
        frame 23 { y: 50.9; }
        frame 24 { y: 51; skew-x: 18.6; skew-y: 20.4; scale-y: 0.743; }
        frame 25 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { y: 51.3; skew-x: 18.3; skew-y: 20.5; scale-y: 0.742; }
        frame 27 { y: 51.5; skew-x: 18; skew-y: 20.6; scale-y: -10000; }
        frame 28 { y: 51.6; skew-x: 17.8; skew-y: 20.8; }
        frame 29 { x: 68.9; y: 51.9; skew-x: 17.3; skew-y: -10000; scale-x: 0.738; }
        frame 30 { x: 68.8; y: 52; skew-x: 17.1; scale-x: -10000; }
        frame 31 { x: 69; y: 52.3; skew-x: 16.8; skew-y: 21.1; }
        frame 32 { x: 68.8; y: 52.5; skew-x: 16.5; skew-y: -10000; scale-y: 0.741; }
        frame 33 { x: 69.1; y: 52.6; skew-x: 16.3; skew-y: 21.3; scale-x: 0.739; scale-y: 0.742; }
        frame 34 { x: -10000; y: 52.5; skew-x: 16.5; skew-y: 21.1; scale-x: 0.738; scale-y: 0.741; }
        frame 35 { x: 69.2; y: 52.1; skew-x: 16.8; skew-y: -10000; scale-x: -10000; scale-y: 0.742; }
        frame 36 { x: 69.1; y: 52; skew-x: 17.1; skew-y: 20.8; scale-y: -10000; }
        frame 37 { x: 69; y: 51.8; skew-x: 17.3; skew-y: -10000; }
        frame 38 { x: 69.1; y: 51.6; skew-x: 17.8; scale-x: 0.737; }
        frame 39 { x: -10000; y: 51.5; skew-x: 18; skew-y: 20.6; scale-x: -10000; }
        frame 40 { x: 69; y: 51.2; skew-x: 18.3; skew-y: 20.5; }
        frame 41 { x: 68.8; y: 51; skew-x: 18.6; skew-y: 20.4; scale-y: 0.743; }
        frame 42 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 43 { x: 68.1; skew-x: 17.6; skew-y: 21.8; scale-x: 0.74; scale-y: 0.742; }
        frame 44 { x: 67.4; skew-x: 16.8; skew-y: 23.5; scale-x: 0.743; scale-y: 0.741; }
        frame 45 { x: 66.7; skew-x: 15.8; skew-y: 25; scale-x: 0.747; scale-y: -10000; }
        frame 46 { x: 66; y: 51; skew-x: 15; skew-y: 26.6; scale-x: 0.751; }
        frame 47 { x: 66.3; skew-x: 15.3; skew-y: 25.8; scale-x: 0.748; }
        frame 48 { x: 66.8; y: -10000; skew-x: 15.8; skew-y: 25; scale-x: 0.747; }
        frame 49 { x: 67.1; skew-x: 16.3; skew-y: 24.3; scale-x: 0.745; }
        frame 50 { x: 67.5; skew-x: 16.8; skew-y: 23.5; scale-x: 0.743; }
        frame 51 { x: 67.8; y: 50.9; skew-x: 17.3; skew-y: 22.6; scale-x: 0.742; scale-y: 0.742; }
        frame 52 { x: 68.2; y: 51; skew-x: 17.6; skew-y: 21.8; scale-x: 0.74; scale-y: -10000; }
        frame 53 { x: 68.6; skew-x: 18.1; skew-y: 21.1; scale-x: 0.738; }
        frame 54 { x: 68.8; skew-x: 18.6; skew-y: 20.4; scale-x: 0.737; scale-y: 0.743; }
        frame 55 { x: -10000; y: -10000; skew-x: -10000; skew-y: 20.3; scale-x: -10000; scale-y: 0.742; }
        frame 56 { skew-y: 20.4; scale-y: 0.743; }
        frame 57 { skew-y: -10000; scale-y: -10000; }
        frame 59 { y: 51.1; skew-x: 18.8; skew-y: 20.6; scale-y: 0.742; }
        frame 60 { y: 51.3; skew-x: 19.1; skew-y: 21; scale-y: -10000; }
        frame 61 { y: 51.5; skew-x: 19.5; skew-y: 21.3; }
        frame 62 { y: -10000; skew-x: 19.8; skew-y: 21.6; scale-x: 0.736; }
        frame 63 { x: 68.7; skew-x: 20.1; skew-y: 21.9; scale-x: 0.737; scale-y: 0.743; }
        frame 64 { x: -10000; skew-x: 19.8; skew-y: 21.6; scale-x: 0.736; scale-y: 0.742; }
        frame 65 { x: 68.8; y: 51.4; skew-x: 19.6; skew-y: 21.3; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: -10000; y: 51.3; skew-x: 19.3; skew-y: 21.1; scale-x: 0.737; }
        frame 67 { y: 51.1; skew-x: 19.1; skew-y: 20.8; scale-x: -10000; }
        frame 68 { y: -10000; skew-x: 18.8; skew-y: 20.6; }
        frame 69 { y: 51; skew-x: 18.6; skew-y: 20.4; scale-y: 0.743; }
        frame 70 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 71 { x: 78.5; y: 44.4; skew-x: 42.4; skew-y: 44.3; scale-x: 0.735; scale-y: 0.741; }
        frame 72 { x: 88.3; y: 41.2; skew-x: 66.4; skew-y: 68.1; scale-x: 0.736; scale-y: -10000; }
        frame 73 { x: 84.4; y: 42.5; skew-x: 59.4; skew-y: 61.2; scale-x: 0.735; scale-y: 0.74; }
        frame 74 { x: 80.5; y: 44.4; skew-x: 52.6; skew-y: 54.4; scale-x: -10000; scale-y: 0.741; }
        frame 75 { x: 76.5; y: 46.3; skew-x: 45.6; skew-y: 47.4; scale-y: -10000; }
        frame 76 { x: 72.6; y: 48.5; skew-x: 38.7; skew-y: 40.5; scale-x: 0.737; scale-y: 0.742; }
        frame 77 { x: 69.9; y: 49.6; skew-x: 27.5; skew-y: 29.3; scale-x: 0.736; scale-y: -10000; }
        frame 78 { x: 67.5; y: 51.4; skew-x: 16.3; skew-y: 18.1; scale-x: 0.737; scale-y: 0.743; }
        frame 79 { x: 65.7; y: 54.1; skew-x: 10.5; skew-y: 12.3; scale-x: -10000; scale-y: 0.742; }
        frame 80 { x: 64.1; y: 57; skew-x: 5; skew-y: 6.8; scale-y: 0.743; }
        frame 81 { x: 66.8; y: 52.9; skew-x: 14.8; skew-y: 16.8; scale-x: 0.736; scale-y: 0.742; }
        frame 82 { x: 70; y: 49.3; skew-x: 25; skew-y: 26.7; scale-x: 0.737; scale-y: 0.743; }
        frame 83 { x: 69.5; y: 50.1; skew-x: 21.8; skew-y: 23.5; scale-x: 0.736; scale-y: 0.742; }
        frame 84 { x: 68.8; y: 51; skew-x: 18.6; skew-y: 20.4; scale-x: 0.737; scale-y: 0.743; }
    }
    Track {
        source-name: "Zombie_catapult_innerwheel_rear1";
        frame-count: 85;
        frame 0 { x: 9.6; y: 89; image: IMAGE_REANIM_LAWNMOWER_WHEEL2; }
        frame 1 { x: -10000; y: -10000; image: none; }
        frame 43 { x: 9.2; y: 89.2; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: 8.6; y: 89.6; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: 8.1; y: 89.8; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: 7.6; y: 90.2; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: 8.2; y: 89.8; skew-x: -1.7; skew-y: -1.7; }
        frame 48 { x: 8.9; y: 89.3; skew-x: -0.7; skew-y: -0.7; }
        frame 49 { x: 9.6; y: 89; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 14.9; y: 72.5; skew-x: 6; skew-y: 6; scale-x: 0.999; scale-y: 0.999; }
        frame 72 { x: 20.2; y: 56; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 17.2; y: 61.6; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 14; y: 67.4; skew-x: 4; skew-y: 4; }
        frame 75 { x: 11; y: 73.2; skew-x: 0; skew-y: 0; }
        frame 76 { x: 8.2; y: 78.9; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 8.3; y: 84.8; skew-x: -10000; skew-y: -10000; scale-x: 0.998; scale-y: 0.998; }
        frame 78 { x: 8.4; y: 90.7; scale-x: 0.999; scale-y: 0.999; }
        frame 79 { x: 8.5; y: 91.5; skew-x: -3; skew-y: -3.2; scale-x: 1.008; scale-y: 0.988; }
        frame 80 { x: -10000; y: 92.3; skew-x: -2.3; skew-y: -2.5; scale-x: 1.018; scale-y: 0.978; }
        frame 81 { x: 9.1; y: 89.9; skew-x: -2.2; skew-y: -2.4; scale-x: 1.008; scale-y: 0.988; }
        frame 82 { x: 9.8; y: 87.7; skew-x: -2.4; skew-y: -10000; scale-x: 0.998; scale-y: 0.998; }
        frame 83 { x: 9.9; y: 89.5; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 9.8; y: 91.2; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_innerwheel_rear2";
        frame-count: 85;
        frame 0 { x: 84.4; y: 89.2; image: IMAGE_REANIM_LAWNMOWER_WHEEL2; }
        frame 1 { x: -10000; y: -10000; image: none; }
        frame 43 { x: 83.8; y: 88.6; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: 83.3; y: 88; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: 82.8; y: 87.3; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: 82.3; y: 86.8; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: 83; y: 87.6; skew-x: -1.7; skew-y: -1.7; }
        frame 48 { x: 83.8; y: 88.3; skew-x: -0.7; skew-y: -0.7; }
        frame 49 { x: 84.4; y: 89.2; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 88.6; y: 80.7; skew-x: 6; skew-y: 6; scale-x: 0.999; scale-y: 0.999; }
        frame 72 { x: 93.1; y: 72.2; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 90.3; y: 72.5; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 87.7; y: 72.9; skew-x: 4; skew-y: 4; }
        frame 75 { x: 85.1; y: 73.4; skew-x: 0; skew-y: 0; }
        frame 76 { x: 82.6; y: 73.9; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 82.8; y: 79.8; skew-x: -10000; skew-y: -10000; scale-x: 0.998; scale-y: 0.998; }
        frame 78 { x: -10000; y: 85.7; scale-x: 0.999; scale-y: 0.999; }
        frame 79 { x: 83.7; y: 87.5; skew-x: -3; skew-y: -3.2; scale-x: 1.008; scale-y: 0.988; }
        frame 80 { x: 84.4; y: 89.3; skew-x: -2.3; skew-y: -2.5; scale-x: 1.018; scale-y: 0.978; }
        frame 81 { x: -10000; y: 87; skew-x: -2.2; skew-y: -2.4; scale-x: 1.008; scale-y: 0.988; }
        frame 82 { x: 84.3; y: 84.7; skew-x: -2.4; skew-y: -10000; scale-x: 0.998; scale-y: 0.998; }
        frame 83 { x: 84.4; y: 86.4; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 84.3; y: 88.2; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_body";
        frame-count: 85;
        frame 0 { x: -2.4; y: 58.5; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BODY; }
        frame 1 { x: -10000; y: 58.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 58; }
        frame 3 { y: 57.9; }
        frame 4 { y: 57.6; }
        frame 5 { y: 57.5; }
        frame 6 { y: 57.3; }
        frame 7 { y: 57.5; }
        frame 8 { y: 57.6; }
        frame 9 { y: 57.9; }
        frame 10 { y: 58; }
        frame 11 { y: 58.3; }
        frame 12 { y: 58.5; }
        frame 13 { y: 58.3; }
        frame 14 { y: 58; }
        frame 15 { y: 57.9; }
        frame 16 { y: 57.6; }
        frame 17 { y: 57.5; }
        frame 18 { y: 57.3; }
        frame 19 { y: 57.5; }
        frame 20 { y: 57.6; }
        frame 21 { y: 57.9; }
        frame 22 { y: 58; }
        frame 23 { y: 58.3; }
        frame 24 { y: 58.5; }
        frame 25 { y: -10000; }
        frame 43 { x: -3.2; y: 58.7; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: -4.1; y: 59.2; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: -5; y: 59.6; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: -5.9; y: 60.2; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: -4.7; y: 59.5; skew-x: -1.7; skew-y: -1.7; }
        frame 48 { x: -3.5; y: 58.9; skew-x: -0.7; skew-y: -0.7; }
        frame 49 { x: -2.4; y: 58.5; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 58.9; }
        frame 59 { y: 59.3; }
        frame 60 { y: 58.9; }
        frame 61 { y: 58.5; }
        frame 62 { y: 58.9; }
        frame 63 { y: 59.3; }
        frame 64 { y: 58.9; }
        frame 65 { y: 58.5; }
        frame 66 { y: 58.9; }
        frame 67 { y: 59.3; }
        frame 68 { y: 58.9; }
        frame 69 { y: 58.5; }
        frame 70 { y: -10000; }
        frame 71 { x: 5.7; y: 41; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 14.9; y: 23.6; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 9.2; y: 29.7; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 3.6; y: 36.1; skew-x: 4; skew-y: 4; }
        frame 75 { x: -1.3; y: 42.6; skew-x: 0; skew-y: 0; }
        frame 76 { x: -6; y: 49.3; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: -5.8; y: 55.3; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: -5.7; y: 61; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: -5.5; y: 61.9; skew-x: -3; skew-y: -3.2; scale-x: 0.907; scale-y: 0.889; }
        frame 80 { x: -5.2; y: 62.9; skew-x: -2.3; skew-y: -2.5; scale-x: 0.916; scale-y: 0.88; }
        frame 81 { x: -4.4; y: 60; skew-x: -2.2; skew-y: -2.4; scale-x: 0.907; scale-y: 0.889; }
        frame 82 { x: -3.6; y: 57.7; skew-x: -2.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: -3.5; y: 59.2; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: -3.6; y: 61.2; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_spring";
        frame-count: 85;
        frame 0 { x: 10.4; y: 87.3; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_SPRING; }
        frame 1 { x: 10.5; y: 86.8; scale-x: -10000; scale-y: 0.912; image: none; }
        frame 2 { x: -10000; y: 86.3; scale-y: 0.924; }
        frame 3 { x: 10.6; y: 85.9; scale-y: 0.936; }
        frame 4 { x: -10000; y: 85.5; scale-y: 0.948; }
        frame 5 { y: 85; scale-y: 0.96; }
        frame 6 { x: 10.7; y: 84.5; scale-y: 0.972; }
        frame 7 { x: -10000; y: 85.6; skew-x: -0.7; skew-y: -0.7; scale-y: 0.93; }
        frame 8 { x: 10.6; y: 86.7; skew-x: -1.5; skew-y: -1.5; scale-y: 0.888; }
        frame 9 { x: 10.7; y: 86.8; skew-x: -0.9; skew-y: -0.9; scale-y: 0.891; }
        frame 10 { x: 10.6; y: 87; skew-x: -0.7; skew-y: -0.7; scale-y: 0.894; }
        frame 11 { x: 10.7; y: 87.1; skew-x: -0.2; skew-y: -0.2; scale-y: 0.897; }
        frame 12 { x: -10000; y: 87.3; skew-x: 0; skew-y: 0; scale-y: 0.9; }
        frame 13 { y: 86.8; skew-x: -10000; skew-y: -10000; scale-y: 0.912; }
        frame 14 { y: 86.3; scale-y: 0.924; }
        frame 15 { y: 85.9; scale-y: 0.936; }
        frame 16 { y: 85.5; scale-y: 0.948; }
        frame 17 { y: 85; scale-y: 0.96; }
        frame 18 { y: 84.5; scale-y: 0.972; }
        frame 19 { x: 10.8; y: 85.6; skew-x: -0.7; skew-y: -0.7; scale-y: 0.93; }
        frame 20 { x: -10000; y: 86.7; skew-x: -1.5; skew-y: -1.5; scale-y: 0.888; }
        frame 21 { x: 11; y: 86.8; skew-x: -0.9; skew-y: -0.9; scale-y: 0.891; }
        frame 22 { y: 87; skew-x: -0.7; skew-y: -0.7; scale-y: 0.894; }
        frame 23 { x: 11.1; y: 87.2; skew-x: -0.2; skew-y: -0.2; scale-y: 0.897; }
        frame 24 { x: 11.2; y: 87.3; skew-x: 0; skew-y: 0; scale-y: 0.9; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { y: 86.8; scale-x: 0.892; scale-y: 0.918; }
        frame 27 { y: 86.5; scale-x: 0.885; scale-y: 0.937; }
        frame 28 { x: 11.1; y: 86.1; scale-x: 0.877; scale-y: 0.955; }
        frame 29 { x: -10000; y: 85.7; scale-x: 0.87; scale-y: 0.973; }
        frame 30 { x: 11.2; y: 85.3; scale-x: 0.862; scale-y: 0.992; }
        frame 31 { x: -10000; y: 84.8; scale-x: 0.855; scale-y: 1.01; }
        frame 32 { x: 11.1; y: 84.5; scale-x: 0.847; scale-y: 1.029; }
        frame 33 { x: -10000; y: 84.1; scale-x: 0.839; scale-y: 1.047; }
        frame 34 { y: 83.7; scale-x: 0.832; scale-y: 1.065; }
        frame 35 { y: 83.3; scale-x: 0.824; scale-y: 1.084; }
        frame 36 { y: 82.9; scale-x: 0.817; scale-y: 1.102; }
        frame 37 { y: 82.6; scale-x: 0.809; scale-y: 1.12; }
        frame 38 { y: 82.1; scale-x: 0.802; scale-y: 1.139; }
        frame 39 { y: 81.8; scale-x: 0.794; scale-y: 1.157; }
        frame 40 { y: 81.3; scale-x: 0.787; scale-y: 1.175; }
        frame 41 { y: 80.9; scale-x: 0.779; scale-y: 1.194; }
        frame 42 { x: 14.1; y: 88.3; skew-x: 3.7; skew-y: 15.2; scale-x: 0.978; scale-y: 0.879; }
        frame 43 { x: 13.3; y: 88.8; skew-x: 0.8; skew-y: 12.3; scale-x: -10000; scale-y: 0.863; }
        frame 44 { x: 12.6; y: 89.3; skew-x: -1.7; skew-y: 9.6; scale-y: 0.849; }
        frame 45 { x: 11.9; y: 89.8; skew-x: -4.4; skew-y: 6.8; scale-x: 0.977; scale-y: 0.834; }
        frame 46 { x: 11.3; y: 90.3; skew-x: -7.2; skew-y: 4.2; scale-x: -10000; scale-y: 0.819; }
        frame 47 { x: -10000; y: 91.7; skew-x: -2.7; skew-y: 6.3; scale-x: 1.095; scale-y: 0.712; }
        frame 48 { x: 12.5; y: 90.2; skew-x: 1.5; skew-y: 7.3; scale-x: 1.027; scale-y: 0.765; }
        frame 49 { x: 13.6; y: 88.8; skew-x: 6; skew-y: 8.7; scale-x: 0.959; scale-y: 0.819; }
        frame 50 { x: 13.1; y: 88.2; skew-x: 4.8; skew-y: 7; scale-x: 0.947; scale-y: 0.85; }
        frame 51 { x: 12.5; y: 87.6; skew-x: 3.5; skew-y: 5.3; scale-x: 0.935; scale-y: 0.881; }
        frame 52 { x: 12; y: 86.9; skew-x: 2.3; skew-y: 3.8; scale-x: 0.923; scale-y: 0.913; }
        frame 53 { x: 11.4; y: 86.3; skew-x: 1; skew-y: 2.1; scale-x: 0.912; scale-y: 0.944; }
        frame 54 { x: 10.7; y: 85.6; skew-x: 0; skew-y: 0.6; scale-x: 0.9; scale-y: 0.976; }
        frame 55 { x: 10.8; y: 86.6; skew-x: -10000; skew-y: 0.3; scale-x: -10000; scale-y: 0.938; }
        frame 56 { x: 10.9; y: 87.3; skew-y: 0; scale-y: 0.9; }
        frame 57 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 58 { x: 10.8; y: 87.7; }
        frame 59 { x: 10.7; y: 88.1; }
        frame 60 { x: 10.9; y: 86.4; scale-y: 0.96; }
        frame 61 { x: 10.7; y: 87.3; scale-y: 0.9; }
        frame 62 { x: -10000; y: 88.3; scale-x: 0.968; scale-y: 0.868; }
        frame 63 { y: 88.1; scale-x: 0.9; scale-y: 0.9; }
        frame 64 { y: 86.4; scale-x: -10000; scale-y: 0.96; }
        frame 65 { x: 10.9; y: -10000; scale-y: 0.94; }
        frame 66 { x: -10000; y: 88.1; scale-y: 0.9; }
        frame 67 { y: 87.8; scale-y: -10000; }
        frame 68 { x: 11.2; y: 86.4; scale-y: 0.96; }
        frame 69 { x: 10.9; y: 87.3; scale-y: 0.9; }
        frame 70 { x: -10000; y: -10000; scale-y: -10000; }
        frame 71 { x: 16.9; y: 67.7; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 1.041; }
        frame 72 { x: 23.2; y: 48.3; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: 1.183; }
        frame 73 { x: 19.6; y: 55.3; skew-x: 8.3; skew-y: 8.3; scale-y: 1.111; }
        frame 74 { x: 15.9; y: 62.6; skew-x: 4; skew-y: 4; scale-y: 1.04; }
        frame 75 { x: 12.5; y: 69.8; skew-x: 0; skew-y: 0; scale-y: 0.97; }
        frame 76 { x: 9.3; y: 77.1; skew-x: -3.9; skew-y: -3.9; scale-y: 0.899; }
        frame 77 { x: 9.4; y: 83.1; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: 9.5; y: 88.8; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: 9.6; y: 88.6; skew-x: -3; skew-y: -3.2; scale-x: 0.907; scale-y: 0.937; }
        frame 80 { x: -10000; y: 88.2; skew-x: -2.3; skew-y: -2.5; scale-x: 0.916; scale-y: 0.975; }
        frame 81 { x: 10.2; y: 87.1; skew-x: -2.2; skew-y: -2.4; scale-x: 0.907; scale-y: 0.937; }
        frame 82 { x: 11; y: 86; skew-x: -2.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: -10000; y: 87.7; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 89.5; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_pole";
        frame-count: 85;
        frame 0 { x: 2.5; y: 29.1; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_POLE_WITHBALL; }
        frame 1 { x: 2.8; y: 28.6; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 3.3; y: 28.2; skew-x: 0.5; skew-y: 0.5; }
        frame 3 { x: 3.6; y: 27.5; skew-x: 1; skew-y: 1; }
        frame 4 { x: 4.1; y: 27; skew-x: 1.3; skew-y: 1.3; }
        frame 5 { x: 4.4; y: 26.7; skew-x: 1.6; skew-y: 1.6; }
        frame 6 { x: 4.8; y: 25.8; skew-x: 2; skew-y: 2; }
        frame 7 { x: 3.9; y: 27.1; skew-x: 0.8; skew-y: 0.8; }
        frame 8 { x: 3; y: 28.2; skew-x: -0.2; skew-y: -0.2; }
        frame 9 { x: 3.2; y: -10000; skew-x: -0; skew-y: -0; }
        frame 10 { x: 3.3; y: 28.5; skew-x: 0; skew-y: 0; }
        frame 11 { x: 3.4; y: 28.8; skew-x: -10000; skew-y: -10000; }
        frame 12 { x: 3.5; y: 29.1; }
        frame 13 { x: 3.7; y: 28.6; skew-x: 0.3; skew-y: 0.3; }
        frame 14 { x: 4; y: 28.2; skew-x: 0.5; skew-y: 0.5; }
        frame 15 { x: 4.3; y: 27.5; skew-x: 1; skew-y: 1; }
        frame 16 { x: 4.6; y: 27.1; skew-x: 1.3; skew-y: 1.3; }
        frame 17 { x: 4.8; y: 26.7; skew-x: 1.6; skew-y: 1.6; }
        frame 18 { x: 5.1; y: 25.8; skew-x: 2; skew-y: 2; }
        frame 19 { x: 4; y: 27.1; skew-x: 0.8; skew-y: 0.8; }
        frame 20 { x: 3; y: 28.2; skew-x: -0.2; skew-y: -0.2; }
        frame 21 { x: 3.1; y: -10000; skew-x: -0; skew-y: -0; }
        frame 22 { x: -10000; y: 28.5; skew-x: 0; skew-y: 0; }
        frame 23 { x: 3.2; y: 28.8; skew-x: -10000; skew-y: -10000; }
        frame 24 { x: 3.3; y: 29.1; }
        frame 25 { x: -10000; y: -10000; }
        frame 26 { x: 3.9; y: 28.6; skew-x: 0.8; skew-y: 0.8; }
        frame 27 { x: 4.5; y: 28.2; skew-x: 1.6; skew-y: 1.6; }
        frame 28 { x: 5.3; y: 27.4; skew-x: 2.5; skew-y: 2.5; }
        frame 29 { x: 5.9; y: 27; skew-x: 3.3; skew-y: 3.3; }
        frame 30 { x: 6.8; y: 26.3; skew-x: 4.3; skew-y: 4.3; }
        frame 31 { x: 7.5; y: 25.9; skew-x: 5; skew-y: 5; scale-x: 0.899; scale-y: 0.899; }
        frame 32 { x: 8.4; y: 25.2; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 9.1; y: 24.9; skew-x: 6.8; skew-y: 6.8; }
        frame 34 { x: 10; y: 24.2; skew-x: 7.8; skew-y: 7.8; }
        frame 35 { x: 10.8; y: 23.8; skew-x: 8.5; skew-y: 8.5; }
        frame 36 { x: 11.5; y: 23.5; skew-x: 9.3; skew-y: 9.3; }
        frame 37 { x: 12.5; y: 22.8; skew-x: 10.3; skew-y: 10.3; }
        frame 38 { x: 13.3; y: 22.5; skew-x: 11.1; skew-y: 11.1; }
        frame 39 { x: 14.3; y: 22; skew-x: 12; skew-y: 12; }
        frame 40 { x: 15.1; y: 21.5; skew-x: 12.8; skew-y: 12.8; }
        frame 41 { x: 16.2; y: 20.9; skew-x: 13.8; skew-y: 13.8; }
        frame 42 { x: -13.4; y: 44.1; skew-x: -29.7; skew-y: -29.7; scale-x: 0.897; scale-y: 0.897; image: IMAGE_REANIM_ZOMBIE_CATAPULT_POLE; }
        frame 43 { x: -14.8; y: 44.8; skew-x: -30.3; skew-y: -30.3; scale-x: 0.896; scale-y: 0.896; image: none; }
        frame 44 { x: -16.2; y: 45.5; skew-x: -31; skew-y: -31; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: -17.7; y: 46.3; skew-x: -31.7; skew-y: -31.7; }
        frame 46 { x: -19.2; y: 47.1; skew-x: -32.5; skew-y: -32.5; scale-x: 0.897; scale-y: 0.897; }
        frame 47 { x: -18.6; y: 49; skew-x: -33.6; skew-y: -33.6; scale-x: 0.896; scale-y: 0.896; }
        frame 48 { x: -17.1; y: 47; skew-x: -31.5; skew-y: -31.5; scale-x: 0.895; scale-y: 0.895; }
        frame 49 { x: -15.5; y: 45.3; skew-x: -29.7; skew-y: -29.7; scale-x: 0.897; scale-y: 0.897; }
        frame 50 { x: -13.7; y: 41.4; skew-x: -23.2; skew-y: -23.4; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: -10.7; y: 37.5; skew-x: -17; skew-y: -17.2; scale-x: 0.898; scale-y: 0.898; }
        frame 52 { x: -6.7; y: 34; skew-x: -10.7; skew-y: -10.9; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: -1.6; y: 30.7; skew-x: -4.4; skew-y: -4.7; scale-x: 0.899; scale-y: 0.899; }
        frame 54 { x: 4.3; y: 27.6; skew-x: 1.8; skew-y: 1.5; scale-x: 0.9; scale-y: 0.9; }
        frame 55 { x: 3.5; y: 28.5; skew-x: 0.8; skew-y: 0.6; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 3; y: 29.1; skew-x: 0; skew-y: 0; image: IMAGE_REANIM_ZOMBIE_CATAPULT_POLE_WITHBALL; }
        frame 57 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; image: none; }
        frame 58 { y: 29.5; }
        frame 59 { y: 29.9; }
        frame 60 { x: 3.8; y: 29.1; skew-x: 1; skew-y: 1; }
        frame 61 { x: 3; y: -10000; skew-x: 0; skew-y: 0; }
        frame 62 { x: 1.6; y: 30.1; skew-x: -1.2; skew-y: -1.2; }
        frame 63 { x: 3; y: 29.9; skew-x: 0; skew-y: 0; }
        frame 64 { x: 3.8; y: 29.1; skew-x: 1; skew-y: 1; }
        frame 65 { x: 2.8; y: -10000; skew-x: 0; skew-y: 0; }
        frame 66 { x: 1.6; y: 30.1; skew-x: -1.2; skew-y: -1.2; }
        frame 67 { x: 3; y: 29.9; skew-x: 0; skew-y: 0; }
        frame 68 { x: 3.8; y: 29.1; skew-x: 1; skew-y: 1; }
        frame 69 { x: 3; y: -10000; skew-x: 0; skew-y: 0; }
        frame 70 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 21; y: 8; skew-x: 12; skew-y: 12; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 42.4; y: -10.9; skew-x: 24.2; skew-y: 24.2; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 29.4; y: -4.3; skew-x: 17.1; skew-y: 17.1; scale-x: 0.898; scale-y: 0.898; }
        frame 74 { x: 17.5; y: 2.8; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 6.8; y: 11; skew-x: 3; skew-y: 3; scale-x: 0.899; scale-y: 0.899; }
        frame 76 { x: -2.6; y: 19.7; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -2.4; y: 25.6; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: -2.3; y: 31.4; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: -0.5; y: 31.3; skew-x: -1.4; skew-y: -1.4; scale-x: 0.907; scale-y: 0.889; }
        frame 80 { x: 1.1; y: 31.4; skew-x: 0.9; skew-y: 0.7; scale-x: 0.916; scale-y: 0.88; }
        frame 81 { x: 0.9; y: 29.8; skew-x: -0.7; skew-y: -0.7; scale-x: 0.907; scale-y: 0.889; }
        frame 82 { x: 0.5; y: 28.2; skew-x: -2.4; skew-y: -2.4; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: 0.7; y: 29.8; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 0.5; y: 31.7; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_basket";
        frame-count: 85;
        frame 0 { x: 72.6; y: 77.8; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BASKET; }
        frame 1 { x: 72.5; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 72.4; y: 78; }
        frame 3 { x: 72.3; }
        frame 4 { x: -10000; y: 77.8; }
        frame 5 { x: 72.2; y: 77.5; }
        frame 6 { x: 72.1; y: 77.2; }
        frame 7 { x: -10000; y: 76.9; }
        frame 8 { x: 72; y: 77.1; }
        frame 9 { y: 77.3; }
        frame 10 { x: 71.9; y: 77.5; }
        frame 11 { x: 71.8; y: 77.6; }
        frame 12 { x: -10000; y: 77.8; }
        frame 13 { x: 72; y: -10000; }
        frame 14 { x: 72.2; y: 78; }
        frame 15 { x: 72.3; }
        frame 16 { x: 72.1; y: 77.7; }
        frame 17 { x: 71.8; y: 77.3; }
        frame 18 { x: 71.6; y: 77; }
        frame 19 { x: 71.3; y: 76.7; }
        frame 20 { x: 71.5; y: 76.9; }
        frame 21 { x: 71.6; y: 77.1; }
        frame 22 { x: 71.8; y: 77.3; }
        frame 23 { x: 71.9; y: 77.6; }
        frame 24 { x: 72.1; y: 77.8; }
        frame 25 { x: -10000; y: -10000; }
        frame 26 { x: 72; }
        frame 27 { x: -10000; }
        frame 28 { x: 72; }
        frame 29 { x: -10000; }
        frame 30 { x: 71.9; }
        frame 31 { x: 71.8; }
        frame 32 { x: -10000; }
        frame 36 { x: 71.7; }
        frame 37 { x: -10000; }
        frame 39 { x: 71.6; }
        frame 40 { x: -10000; }
        frame 42 { x: 71.8; }
        frame 43 { x: 71; y: 77.1; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: 70.2; y: 76.5; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: 69.3; y: 75.7; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: 68.5; y: 75.1; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: 69.6; y: 76; skew-x: -1.7; skew-y: -1.7; }
        frame 48 { x: 70.7; y: 76.8; skew-x: -0.7; skew-y: -0.7; }
        frame 49 { x: 71.8; y: 77.8; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 78.2; }
        frame 59 { y: 78.6; }
        frame 60 { y: 78.2; }
        frame 61 { y: 77.8; }
        frame 62 { x: 71.7; y: 78.2; }
        frame 63 { x: 71.6; y: 78.6; }
        frame 64 { x: -10000; y: 78.2; }
        frame 65 { y: 77.8; }
        frame 66 { y: 78.2; }
        frame 67 { y: 78.6; }
        frame 68 { x: 71.7; y: 78.2; }
        frame 69 { x: 71.8; y: 77.8; }
        frame 70 { x: -10000; y: -10000; }
        frame 71 { x: 77.3; y: 68.1; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 83.2; y: 58.3; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 79.5; y: 59.4; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 76; y: 60.8; skew-x: 4; skew-y: 4; }
        frame 75 { x: 72.5; y: 61.9; skew-x: 0; skew-y: 0; }
        frame 76 { x: 69.2; y: 63.4; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 69.4; y: 69.3; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: 69.5; y: 75.2; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: 70.3; y: 77.7; skew-x: -2.9; skew-y: -3.2; scale-x: 0.907; scale-y: 0.867; }
        frame 80 { x: 71; y: 80.3; skew-x: -2.2; skew-y: -2.6; scale-x: 0.916; scale-y: 0.836; }
        frame 81 { x: 71.2; y: 77; skew-x: -10000; skew-y: -2.4; scale-x: 0.907; scale-y: 0.867; }
        frame 82 { x: -10000; y: 73.8; skew-x: -2.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: 71.3; y: 75.5; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 71.2; y: 77.3; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_basketball";
        frame-count: 85;
        frame 0 { x: 76.2; y: 76.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL; }
        frame 1 { x: -10000; y: 75.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 76.5; }
        frame 3 { y: 75.8; }
        frame 4 { y: 76.5; }
        frame 5 { y: 75.8; }
        frame 6 { y: 76.5; }
        frame 7 { y: 75.8; }
        frame 8 { y: 76.5; }
        frame 9 { y: 75.8; }
        frame 10 { y: 76.5; }
        frame 11 { y: 75.8; }
        frame 12 { y: 76.5; }
        frame 13 { y: 75.8; }
        frame 14 { y: 76.5; }
        frame 15 { y: 75.8; }
        frame 16 { y: 76.5; }
        frame 17 { y: 75.8; }
        frame 18 { y: 76.5; }
        frame 19 { y: 75.8; }
        frame 20 { y: 76.5; }
        frame 21 { y: 75.8; }
        frame 22 { y: 76.5; }
        frame 23 { y: 75.8; }
        frame 24 { y: 76.5; }
        frame 25 { y: 75.8; }
        frame 26 { y: -10000; }
        frame 27 { y: 75.9; }
        frame 28 { y: 76; }
        frame 30 { y: -10000; }
        frame 31 { y: 76.1; }
        frame 32 { y: -10000; }
        frame 33 { y: 76.2; }
        frame 34 { y: -10000; }
        frame 35 { y: 76.3; }
        frame 36 { y: -10000; }
        frame 39 { y: 76.4; }
        frame 40 { y: 76.5; }
        frame 41 { y: -10000; }
        frame 43 { x: 75.6; y: 75.6; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: 74.8; y: 74.7; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: 74.2; y: 73.9; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: 73.5; y: 73; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: 73.9; y: 72.8; skew-x: -2.2; skew-y: -2.2; }
        frame 48 { x: 74.3; y: 72.5; skew-x: -1.7; skew-y: -1.7; }
        frame 49 { x: 74.9; y: 73.8; skew-x: -0.9; skew-y: -0.9; }
        frame 50 { x: 75.6; y: 75.1; skew-x: -0.4; skew-y: -0.4; }
        frame 51 { x: 76.2; y: 76.5; skew-x: 0; skew-y: 0; }
        frame 52 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 76.9; }
        frame 59 { y: 77.3; }
        frame 60 { y: 76.9; }
        frame 61 { y: 76.5; }
        frame 62 { y: -10000; }
        frame 63 { y: 77.3; }
        frame 64 { y: 76.9; }
        frame 65 { y: 76.5; }
        frame 66 { y: -10000; }
        frame 67 { y: 77.3; }
        frame 68 { y: 76.9; }
        frame 69 { y: 76.5; }
        frame 70 { y: -10000; }
        frame 71 { x: 81.9; y: 67.2; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 72 { x: 87.8; y: 58; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 84.2; y: 58.9; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 80.6; y: 59.9; skew-x: 4; skew-y: 4; }
        frame 75 { x: 77; y: 60.6; skew-x: 0; skew-y: 0; }
        frame 76 { x: 73.5; y: 61.8; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 73.7; y: 67.7; skew-x: -10000; skew-y: -10000; }
        frame 78 { x: 73.8; y: 73.6; }
        frame 79 { x: 74.7; y: 76.9; skew-x: -2.9; skew-y: -3.2; scale-x: 0.806; scale-y: 0.764; }
        frame 80 { x: 75.5; y: 80.1; skew-x: -2.1; skew-y: -2.7; scale-x: 0.814; scale-y: 0.729; }
        frame 81 { x: 75.6; y: 76.2; skew-x: -2.2; skew-y: -2.4; scale-x: 0.806; scale-y: 0.764; }
        frame 82 { x: -10000; y: 72.3; skew-x: -2.4; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 83 { x: 75.7; y: 74.2; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 75.6; y: 75.8; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_basketball2";
        frame-count: 85;
        frame 0 { x: 93.7; y: 72.7; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 72; }
        frame 3 { y: 72.3; }
        frame 4 { y: 72.7; }
        frame 5 { y: 72.3; }
        frame 6 { y: 72; }
        frame 7 { y: 72.7; }
        frame 8 { y: 72.3; }
        frame 9 { y: 72; }
        frame 10 { y: 72.7; }
        frame 11 { y: 72; }
        frame 12 { y: 72.3; }
        frame 13 { y: 72.7; }
        frame 14 { y: 72; }
        frame 15 { y: 72.3; }
        frame 16 { y: 72.7; }
        frame 17 { y: 72; }
        frame 18 { y: 72.3; }
        frame 19 { y: 72.7; }
        frame 20 { y: 72; }
        frame 21 { y: 72.7; }
        frame 22 { y: 72; }
        frame 23 { y: 72.7; }
        frame 24 { y: -10000; }
        frame 43 { x: 92.8; y: 71.5; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: 92; y: 70.5; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: 91.2; y: 69.4; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: 90.3; y: 68.3; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: 90.7; y: 66.7; skew-x: -1.7; skew-y: -1.7; }
        frame 48 { x: 91.2; y: 67.7; skew-x: -1.2; skew-y: -1.2; }
        frame 49 { x: 91.7; y: 68.7; skew-x: -0.9; skew-y: -0.9; }
        frame 50 { x: 92.2; y: 69.7; skew-x: -0.7; skew-y: -0.7; }
        frame 51 { x: 92.7; y: 70.6; skew-x: -0.4; skew-y: -0.4; }
        frame 52 { x: 93.2; y: 71.7; skew-x: -0.2; skew-y: -0.2; }
        frame 53 { x: 93.7; y: 72.7; skew-x: 0; skew-y: 0; }
        frame 54 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 73.1; }
        frame 59 { y: 73.5; }
        frame 60 { y: 73.1; }
        frame 61 { y: 72.7; }
        frame 62 { y: -10000; }
        frame 63 { y: 73.5; }
        frame 64 { y: 73.1; }
        frame 65 { y: 72.7; }
        frame 66 { y: -10000; }
        frame 67 { y: 73.5; }
        frame 68 { y: 73.1; }
        frame 69 { y: 72.7; }
        frame 70 { y: -10000; }
        frame 71 { x: 99.6; y: 65.3; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 72 { x: 105.7; y: 58; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 101.8; y: 57.5; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 98.1; y: 57.3; skew-x: 4; skew-y: 4; }
        frame 75 { x: 94.3; y: 56.9; skew-x: 0; skew-y: 0; }
        frame 76 { x: 90.7; y: 56.8; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 90.8; y: 62.6; skew-x: -10000; skew-y: -10000; }
        frame 78 { x: 90.9; y: 68.5; }
        frame 79 { x: 92; y: 72.2; skew-x: -2.9; skew-y: -3.2; scale-x: 0.806; scale-y: 0.764; }
        frame 80 { x: 93.1; y: 75.8; skew-x: -2.1; skew-y: -2.7; scale-x: 0.814; scale-y: 0.729; }
        frame 81 { x: -10000; y: 71.8; skew-x: -2.2; skew-y: -2.4; scale-x: 0.806; scale-y: 0.764; }
        frame 82 { x: 92.8; y: 67.8; skew-x: -2.4; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 83 { x: 92.9; y: 69.5; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 92.8; y: 71.3; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_basketball3";
        frame-count: 85;
        frame 0 { x: 97.8; y: 81; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL; }
        frame 1 { x: -10000; y: 80.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 80.6; }
        frame 3 { y: 81; }
        frame 4 { y: 80.3; }
        frame 5 { y: 81; }
        frame 6 { y: 80.6; }
        frame 7 { y: 81; }
        frame 8 { y: 80.6; }
        frame 9 { y: 80.3; }
        frame 10 { y: 81; }
        frame 11 { y: 80.3; }
        frame 12 { y: 80.6; }
        frame 13 { y: 81; }
        frame 14 { y: 80.6; }
        frame 15 { y: 81; }
        frame 16 { y: 80.3; }
        frame 17 { y: 80.6; }
        frame 18 { y: 81; }
        frame 19 { y: 80.3; }
        frame 20 { y: 81; }
        frame 21 { y: 80.3; }
        frame 22 { y: 80.6; }
        frame 23 { y: 81; }
        frame 24 { y: -10000; }
        frame 43 { x: 97.2; y: 79.8; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: 96.6; y: 78.8; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: 96; y: 77.7; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: 95.2; y: 76.6; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: 95.7; y: 76.3; skew-x: -2.2; skew-y: -2.2; }
        frame 48 { x: 96.1; y: 76; skew-x: -1.7; skew-y: -1.7; }
        frame 49 { x: 96.9; y: 78.4; skew-x: -0.7; skew-y: -0.7; }
        frame 50 { x: 97.8; y: 81; skew-x: 0; skew-y: 0; }
        frame 51 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 81.3; }
        frame 59 { y: 81.8; }
        frame 60 { y: 81.3; }
        frame 61 { y: 81; }
        frame 62 { y: 80.6; }
        frame 63 { y: 81.8; }
        frame 64 { y: 81.3; }
        frame 65 { y: 81; }
        frame 66 { y: 80.6; }
        frame 67 { y: 81.8; }
        frame 68 { y: 81.3; }
        frame 69 { y: 81; }
        frame 70 { y: -10000; }
        frame 71 { x: 102.8; y: 73.9; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 72 { x: 108; y: 67; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 104.8; y: 66.3; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 101.7; y: 65.8; skew-x: 4; skew-y: 4; }
        frame 75 { x: 98.5; y: 65.2; skew-x: 0; skew-y: 0; }
        frame 76 { x: 95.3; y: 64.8; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 95.5; y: 70.7; skew-x: -10000; skew-y: -10000; }
        frame 78 { x: 95.6; y: 76.5; }
        frame 79 { x: 96.7; y: 79.9; skew-x: -2.9; skew-y: -3.2; scale-x: 0.806; scale-y: 0.764; }
        frame 80 { x: 97.6; y: 83.3; skew-x: -2.1; skew-y: -2.7; scale-x: 0.814; scale-y: 0.729; }
        frame 81 { x: 97.5; y: 79.6; skew-x: -2.2; skew-y: -2.4; scale-x: 0.806; scale-y: 0.764; }
        frame 82 { x: 97.3; y: 75.9; skew-x: -2.4; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 83 { x: -10000; y: 77.7; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 79.4; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_basketball4";
        frame-count: 85;
        frame 0 { x: 82.1; y: 85; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 84.3; }
        frame 3 { y: 84.6; }
        frame 4 { y: 85; }
        frame 5 { y: -10000; }
        frame 6 { y: 84.6; }
        frame 7 { y: 84.3; }
        frame 8 { y: 85; }
        frame 9 { y: 84.3; }
        frame 10 { y: 85; }
        frame 11 { y: 84.3; }
        frame 12 { y: 85; }
        frame 13 { y: 84.6; }
        frame 14 { y: 84.3; }
        frame 15 { y: 85; }
        frame 16 { y: 84.6; }
        frame 17 { y: 85; }
        frame 18 { y: -10000; }
        frame 19 { y: 84.3; }
        frame 20 { y: 84.6; }
        frame 21 { y: 85; }
        frame 22 { y: 84.6; }
        frame 23 { y: 85; }
        frame 24 { y: -10000; }
        frame 43 { x: 81.5; y: 84.2; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: 80.9; y: 83.5; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: 80.3; y: 82.8; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: 79.7; y: 82.2; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: 80.5; y: 80.5; skew-x: -1.7; skew-y: -1.7; }
        frame 48 { x: 80.8; y: 81.3; skew-x: -1.2; skew-y: -1.2; }
        frame 49 { x: 81.1; y: 82.3; skew-x: -0.9; skew-y: -0.9; }
        frame 50 { x: 81.4; y: 83.1; skew-x: -0.5; skew-y: -0.5; }
        frame 51 { x: 81.7; y: 84.1; skew-x: -0.2; skew-y: -0.2; }
        frame 52 { x: 82.1; y: 85; skew-x: 0; skew-y: 0; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 85.3; }
        frame 59 { y: 85.8; }
        frame 60 { y: 85.3; }
        frame 61 { y: 85; }
        frame 62 { y: 84.3; }
        frame 63 { y: 85.8; }
        frame 64 { y: 85.3; }
        frame 65 { y: 85; }
        frame 66 { y: 84.3; }
        frame 67 { y: 85.8; }
        frame 68 { y: 85.3; }
        frame 69 { y: 85; }
        frame 70 { y: -10000; }
        frame 71 { x: 86.8; y: 76.2; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 72 { x: 91.8; y: 67.6; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 88.8; y: 68.2; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 85.8; y: 68.6; skew-x: 4; skew-y: 4; }
        frame 75 { x: 82.8; y: 69.2; skew-x: 0; skew-y: 0; }
        frame 76 { x: 80; y: 69.8; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 80.1; y: 75.8; skew-x: -10000; skew-y: -10000; }
        frame 78 { x: 80.2; y: 81.6; }
        frame 79 { x: 81.1; y: 84.6; skew-x: -2.9; skew-y: -3.2; scale-x: 0.806; scale-y: 0.764; }
        frame 80 { x: 81.8; y: 87.6; skew-x: -2.1; skew-y: -2.7; scale-x: 0.814; scale-y: 0.729; }
        frame 81 { x: -10000; y: 84.1; skew-x: -2.2; skew-y: -2.4; scale-x: 0.806; scale-y: 0.764; }
        frame 82 { y: 80.6; skew-x: -2.4; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 83 { y: 82.3; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 84.1; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_basket_overlay";
        frame-count: 85;
        frame 0 { x: 72.5; y: 79.6; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BASKET_OVERLAY; }
        frame 1 { x: 72.4; y: 79.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 72.3; y: -10000; }
        frame 3 { x: -10000; y: 80; }
        frame 4 { x: 72.2; y: 79.7; }
        frame 5 { x: -10000; y: 79.3; }
        frame 6 { x: 72.1; y: 79.1; }
        frame 7 { x: 72; y: 78.7; }
        frame 8 { y: 78.9; }
        frame 9 { x: 71.9; y: 79.1; }
        frame 10 { x: 71.8; y: 79.3; }
        frame 11 { x: -10000; y: 79.4; }
        frame 12 { y: 79.6; }
        frame 13 { x: 71.9; y: 79.8; }
        frame 14 { x: 72.1; y: -10000; }
        frame 15 { x: 72.3; y: 80; }
        frame 16 { x: 72; y: 79.6; }
        frame 17 { x: 71.8; y: 79.3; }
        frame 18 { x: 71.5; y: 78.8; }
        frame 19 { x: 71.3; y: 78.5; }
        frame 20 { x: 71.4; y: 78.7; }
        frame 21 { x: 71.6; y: 78.9; }
        frame 22 { x: 71.7; y: 79.2; }
        frame 23 { x: 71.8; y: 79.3; }
        frame 24 { x: 72; y: 79.6; }
        frame 25 { x: -10000; y: -10000; }
        frame 26 { x: 72; }
        frame 27 { x: -10000; }
        frame 28 { x: 71.9; }
        frame 29 { x: -10000; }
        frame 30 { x: 71.8; }
        frame 31 { x: -10000; }
        frame 34 { x: 71.7; }
        frame 35 { x: -10000; }
        frame 38 { x: 71.6; }
        frame 39 { x: -10000; }
        frame 41 { x: 71.5; }
        frame 42 { x: 71.8; }
        frame 43 { x: 71; y: 78.8; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: 70.1; y: 78; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: 69.3; y: 77.1; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: 68.5; y: 76.3; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: 69.6; y: 77.4; skew-x: -1.7; skew-y: -1.7; }
        frame 48 { x: 70.8; y: 78.5; skew-x: -0.7; skew-y: -0.7; }
        frame 49 { x: 71.8; y: 79.6; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 80; }
        frame 59 { y: 80.4; }
        frame 60 { y: 80; }
        frame 61 { y: 79.6; }
        frame 62 { x: 71.7; y: 80; }
        frame 63 { x: 71.5; y: 80.4; }
        frame 64 { x: -10000; y: 80; }
        frame 65 { y: 79.6; }
        frame 66 { y: 80; }
        frame 67 { y: 80.4; }
        frame 68 { x: 71.7; y: 80; }
        frame 69 { x: 71.8; y: 79.6; }
        frame 70 { x: -10000; y: -10000; }
        frame 71 { x: 77.2; y: 69.8; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 82.8; y: 60.1; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 79.3; y: 61.2; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 75.8; y: 62.5; skew-x: 4; skew-y: 4; }
        frame 75 { x: 72.5; y: 63.8; skew-x: 0; skew-y: 0; }
        frame 76 { x: 69.3; y: 65.3; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 69.4; y: 71.2; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: 69.5; y: 77; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: 70.3; y: 79.4; skew-x: -2.9; skew-y: -3.2; scale-x: 0.907; scale-y: 0.867; }
        frame 80 { x: 71; y: 82.1; skew-x: -2.2; skew-y: -2.6; scale-x: 0.916; scale-y: 0.836; }
        frame 81 { x: 71.2; y: 78.8; skew-x: -10000; skew-y: -2.4; scale-x: 0.907; scale-y: 0.867; }
        frame 82 { x: -10000; y: 75.7; skew-x: -2.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: 71.3; y: 77.3; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 71.2; y: 79.2; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "LawnMower_wheelpiece";
        frame-count: 85;
        frame 0 { x: 48.9; y: 110.2; skew-x: 180; image: IMAGE_REANIM_LAWNMOWER_WHEELPIECE; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; image: none; }
        frame 2 { y: 110.1; }
        frame 3 { y: -10000; }
        frame 4 { y: 110; }
        frame 5 { y: 109.9; }
        frame 6 { y: 109.8; }
        frame 7 { y: -10000; }
        frame 9 { y: 109.7; }
        frame 10 { y: -10000; }
        frame 11 { y: 109.6; }
        frame 12 { y: -10000; }
        frame 13 { y: 109.5; }
        frame 14 { y: 109.4; }
        frame 15 { y: 109.3; }
        frame 16 { y: -10000; }
        frame 18 { y: 109.2; }
        frame 19 { y: 109.3; }
        frame 20 { y: -10000; }
        frame 21 { y: 109.5; }
        frame 22 { y: 109.6; }
        frame 23 { y: -10000; }
        frame 24 { y: 109.7; }
        frame 25 { y: -10000; }
        frame 71 { x: 51.5; y: 97; skew-x: 186; skew-y: 6; scale-x: 0.999; scale-y: 0.999; }
        frame 72 { x: 54.1; y: 84.6; skew-x: 192.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 52.9; y: 87.6; skew-x: 188.3; skew-y: 8.3; }
        frame 74 { x: 51.6; y: 90.7; skew-x: 184; skew-y: 4; }
        frame 75 { x: 50.2; y: 93.7; skew-x: 180; skew-y: 0; }
        frame 76 { x: 48.6; y: 96.8; skew-x: 176; skew-y: -3.9; }
        frame 77 { x: 48.9; y: 102.7; skew-x: -10000; skew-y: -10000; scale-x: 0.998; scale-y: 0.998; }
        frame 78 { x: -10000; y: 108.6; scale-x: 0.999; scale-y: 0.999; }
        frame 79 { x: 49.8; y: 110.3; skew-x: 176.9; skew-y: -3.2; scale-x: 1.054; scale-y: 0.969; }
        frame 80 { x: 50.5; y: 111.8; skew-x: 177.6; skew-y: -2.5; scale-x: 1.109; scale-y: 0.94; }
        frame 81 { x: 50.1; y: 109.3; skew-x: 177.7; skew-y: -2.4; scale-x: 1.054; scale-y: 0.969; }
        frame 82 { x: 49.9; y: 106.7; skew-x: 177.5; skew-y: -10000; scale-x: 0.998; scale-y: 0.998; }
        frame 83 { x: -10000; y: 108.6; skew-x: 177.7; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 110.2; skew-x: 177.5; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_outerwheel_front1";
        frame-count: 85;
        frame 0 { x: 24.5; y: 113.3; image: IMAGE_REANIM_LAWNMOWER_WHEEL2; }
        frame 1 { x: 21.9; y: 116.5; skew-x: -12.7; skew-y: -12.7; scale-x: 0.999; scale-y: 0.999; image: none; }
        frame 2 { x: 20.1; y: 120.3; skew-x: -25.5; skew-y: -25.5; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 19.3; y: 124.3; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998; scale-y: 0.998; }
        frame 4 { x: -10000; y: 128.4; skew-x: -51.3; skew-y: -51.3; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 20.2; y: 132.4; skew-x: -64.3; skew-y: -64.3; scale-x: 0.999; scale-y: 0.999; }
        frame 6 { x: 21.9; y: 136; skew-x: -77.1; skew-y: -77.1; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 24.5; y: 139.3; skew-x: -89.9; skew-y: -89.9; scale-x: 1; scale-y: 1; }
        frame 8 { x: 28.3; y: 142.3; skew-x: -104.9; skew-y: -104.9; scale-x: 0.999; scale-y: 0.999; }
        frame 9 { x: 32.6; y: 144.2; skew-x: -119.8; skew-y: -119.8; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 37.4; y: 145; skew-x: -134.9; skew-y: -134.9; scale-x: 1; scale-y: 1; }
        frame 11 { x: 42.1; y: 144.6; skew-x: -150; skew-y: -150; scale-x: 0.999; scale-y: 0.999; }
        frame 12 { x: 46.5; y: 142.8; skew-x: -164.9; skew-y: -164.9; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 50.4; y: 140.1; skew-x: -179.9; skew-y: -179.9; scale-x: 1; scale-y: 1; }
        frame 14 { x: 53.3; y: 136.1; skew-x: -194.9; skew-y: -194.9; scale-x: 0.999; scale-y: 0.999; }
        frame 15 { x: 55; y: 131.7; skew-x: -209.8; skew-y: -209.8; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 55.8; y: 126.8; skew-x: -224.9; skew-y: -224.9; scale-x: 1; scale-y: 1; }
        frame 17 { x: 55.1; y: 121.8; skew-x: -240; skew-y: -240; scale-x: 0.999; scale-y: 0.999; }
        frame 18 { x: 53.3; y: 117.3; skew-x: -254.9; skew-y: -254.9; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 50.4; y: 113.3; skew-x: -269.9; skew-y: -269.9; scale-x: 1; scale-y: 1; }
        frame 20 { x: 45.8; y: 110.1; skew-x: -287.7; skew-y: -287.7; scale-x: 0.999; scale-y: 0.999; }
        frame 21 { x: 40.3; y: 108.3; skew-x: -305.8; skew-y: -305.8; scale-x: 0.998; scale-y: 0.998; }
        frame 22 { x: 34.5; y: 108.2; skew-x: -324; skew-y: -324; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 29.1; y: 110; skew-x: -342.1; skew-y: -342.1; scale-x: 0.999; scale-y: 0.999; }
        frame 24 { x: 24.5; y: 113.3; skew-x: -359.9; skew-y: -359.9; scale-x: 1; scale-y: 1; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 24.4; }
        frame 44 { x: -10000; }
        frame 45 { x: 24.3; }
        frame 46 { x: -10000; }
        frame 48 { x: 24.4; }
        frame 49 { x: 24.5; }
        frame 50 { x: -10000; }
        frame 71 { x: 26.8; y: 98.1; skew-x: -353.9; skew-y: -353.9; scale-x: 0.999; scale-y: 0.999; }
        frame 72 { x: 29.5; y: 83; skew-x: -347.5; skew-y: -347.5; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 28.3; y: 87.7; skew-x: -351.6; skew-y: -351.6; }
        frame 74 { x: 26.9; y: 92.5; skew-x: -355.9; skew-y: -355.9; }
        frame 75 { x: 25.8; y: 97.3; skew-x: -359.9; skew-y: -359.9; }
        frame 76 { x: 24.7; y: 102.2; skew-x: -363.9; skew-y: -363.9; }
        frame 77 { x: 25.3; y: 107.6; skew-x: -361.7; skew-y: -361.7; scale-x: 0.998; scale-y: 0.998; }
        frame 78 { x: 25.8; y: 113; skew-x: -359.6; skew-y: -359.6; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 24.8; y: 114.2; skew-x: -359.1; skew-y: -358.9; scale-x: 1.075; scale-y: 0.967; }
        frame 80 { x: 23.9; y: 115.3; skew-x: -358.3; skew-y: -358; scale-x: 1.152; scale-y: 0.936; }
        frame 81 { x: 25.2; y: 113.1; skew-x: -358.4; skew-y: -358.1; scale-x: 1.075; scale-y: 0.967; }
        frame 82 { x: 26.6; y: 110.5; skew-x: -358.1; skew-y: -10000; scale-x: 0.998; scale-y: 0.998; }
        frame 83 { x: -10000; y: 112.3; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 114; }
    }
    Track {
        source-name: "Zombie_catapult_siding";
        frame-count: 85;
        frame 0 { x: -9.2; y: 84.3; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_SIDING; }
        frame 1 { x: -9.6; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -10; y: 84.2; }
        frame 3 { x: -10.4; y: 84.1; }
        frame 4 { x: -10.1; y: 83.6; }
        frame 5 { x: -9.9; y: 83; }
        frame 6 { x: -9.6; y: 82.4; }
        frame 7 { x: -10000; y: 82.6; }
        frame 8 { y: 82.8; }
        frame 9 { y: 82.9; }
        frame 10 { x: -9.5; y: 83.5; }
        frame 11 { x: -10000; y: 84.1; }
        frame 12 { x: -9.4; y: 84.6; }
        frame 13 { x: -9.5; y: 84.5; }
        frame 14 { x: -10000; y: 84.3; }
        frame 15 { x: -9.6; y: 84.1; }
        frame 16 { x: -9.5; y: 83.6; }
        frame 17 { x: -10000; y: 83; }
        frame 18 { x: -9.4; y: 82.4; }
        frame 19 { x: -9.5; y: 82.6; }
        frame 20 { x: -9.7; y: 82.8; }
        frame 21 { x: -9.9; y: 82.9; }
        frame 22 { x: -9.7; y: 83.5; }
        frame 23 { x: -9.5; y: 84.1; }
        frame 24 { x: -9.4; y: 84.6; }
        frame 25 { x: -10000; y: -10000; }
        frame 30 { x: -9.5; }
        frame 31 { x: -10000; }
        frame 37 { x: -9.6; }
        frame 38 { x: -10000; }
        frame 43 { y: 85.3; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: -9.5; y: 86; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: -9.6; y: 86.7; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: -10000; y: 87.3; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: -9.9; y: 87.2; skew-x: -1.7; skew-y: -1.7; }
        frame 48 { x: -9.5; y: 85.8; skew-x: -0.7; skew-y: -0.7; }
        frame 49 { x: -9.1; y: 84.6; skew-x: 0; skew-y: 0; }
        frame 50 { x: -9; y: 84.2; skew-x: -10000; skew-y: -10000; }
        frame 51 { x: -8.9; y: 83.8; }
        frame 52 { x: -9; y: 84.1; }
        frame 53 { x: -9.2; y: 84.3; }
        frame 54 { x: -9.4; y: 84.6; }
        frame 55 { x: -10000; y: -10000; }
        frame 58 { y: 85; }
        frame 59 { y: 85.4; }
        frame 60 { x: -9.2; y: 85; }
        frame 61 { x: -9.1; y: 84.6; }
        frame 62 { x: -9.2; y: 85; }
        frame 63 { x: -9.4; y: 85.4; }
        frame 64 { x: -10000; y: 85; }
        frame 65 { y: 84.6; }
        frame 66 { y: 85; }
        frame 67 { y: 85.4; }
        frame 68 { y: 85; }
        frame 69 { y: 84.6; }
        frame 70 { y: -10000; }
        frame 71 { x: -3.5; y: 66; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 2.4; y: 47.5; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: -1; y: 54.5; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: -4.5; y: 61.5; skew-x: 4; skew-y: 4; }
        frame 75 { x: -7.8; y: 68.7; skew-x: 0; skew-y: 0; }
        frame 76 { x: -11.1; y: 75.9; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: -10.9; y: 81.8; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: -10000; y: 87.7; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { y: 89; skew-x: -3; skew-y: -3.2; scale-x: 0.907; scale-y: 0.889; }
        frame 80 { x: -11.1; y: 90.3; skew-x: -2.3; skew-y: -2.5; scale-x: 0.916; scale-y: 0.88; }
        frame 81 { x: -10.2; y: 87.2; skew-x: -2.2; skew-y: -2.4; scale-x: 0.907; scale-y: 0.889; }
        frame 82 { x: -9.4; y: 84.2; skew-x: -2.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: -9.3; y: 85.9; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: -9.4; y: 87.7; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_body_overlays";
        frame-count: 85;
        frame 0 { x: 81; y: 105.5; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BODY_OVERLAY1; }
        frame 1 { x: -10000; y: 105.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 105; }
        frame 3 { x: 81; y: 104.8; }
        frame 4 { x: -10000; y: 104.6; }
        frame 5 { y: 104.3; }
        frame 6 { y: 104.2; }
        frame 7 { y: 104.3; }
        frame 8 { y: 104.6; }
        frame 9 { y: 104.8; }
        frame 10 { y: 105; }
        frame 11 { y: 105.2; }
        frame 12 { y: 105.3; }
        frame 13 { y: 105.2; }
        frame 14 { y: 105; }
        frame 15 { y: 104.8; }
        frame 16 { y: 104.6; }
        frame 17 { y: 104.3; }
        frame 18 { y: 104.2; }
        frame 19 { y: 104.3; }
        frame 20 { y: 104.6; }
        frame 21 { y: 104.8; }
        frame 22 { y: 105; }
        frame 23 { y: 105.2; }
        frame 24 { y: 105.3; }
        frame 25 { y: -10000; }
        frame 43 { x: 80.6; y: 104.8; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: 80.2; y: 104.1; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: 79.8; y: 103.4; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: 79.5; y: 102.9; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: 80.1; y: 103.7; skew-x: -1.7; skew-y: -1.7; }
        frame 48 { x: 80.5; y: 104.6; skew-x: -0.7; skew-y: -0.7; }
        frame 49 { x: 81; y: 105.3; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 105.8; }
        frame 59 { y: 106.2; }
        frame 60 { y: 105.8; }
        frame 61 { y: 105.3; }
        frame 62 { y: 105.8; }
        frame 63 { y: 106.2; }
        frame 64 { y: 105.8; }
        frame 65 { y: 105.3; }
        frame 66 { y: 105.8; }
        frame 67 { y: 106.2; }
        frame 68 { y: 105.8; }
        frame 69 { y: 105.3; }
        frame 70 { y: -10000; }
        frame 71 { x: 83.8; y: 96.4; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 86.4; y: 87.2; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 85; y: 88; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 83.5; y: 88.8; skew-x: 4; skew-y: 4; }
        frame 75 { x: 81.9; y: 89.5; skew-x: 0; skew-y: 0; }
        frame 76 { x: 80.3; y: 90.2; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 80.5; y: 96.2; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: 80.6; y: 102; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: 81.1; y: 103.6; skew-x: -3; skew-y: -3.2; scale-x: 0.907; scale-y: 0.889; }
        frame 80 { x: 81.7; y: 105.3; skew-x: -2.3; skew-y: -2.5; scale-x: 0.916; scale-y: 0.88; }
        frame 81 { x: -10000; y: 103.1; skew-x: -2.2; skew-y: -2.4; scale-x: 0.907; scale-y: 0.889; }
        frame 82 { y: 101; skew-x: -2.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { y: 102.8; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 104.5; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_body_overlays2";
        frame-count: 85;
        frame 0 { x: 27.2; y: 69.3; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_BODY_OVERLAY2; }
        frame 1 { x: -10000; y: 69.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 68.9; }
        frame 3 { x: 27.3; y: 68.7; }
        frame 4 { x: -10000; y: 68.5; }
        frame 5 { y: 68.3; }
        frame 6 { y: 68.1; }
        frame 7 { y: 68.3; }
        frame 8 { y: 68.5; }
        frame 9 { y: 68.7; }
        frame 10 { y: 68.8; }
        frame 11 { y: 69.1; }
        frame 12 { y: 69.3; }
        frame 13 { y: 69.1; }
        frame 14 { y: 68.8; }
        frame 15 { y: 68.7; }
        frame 16 { y: 68.5; }
        frame 17 { y: 68.3; }
        frame 18 { y: 68.1; }
        frame 19 { y: 68.3; }
        frame 20 { y: 68.5; }
        frame 21 { y: 68.7; }
        frame 22 { y: 68.8; }
        frame 23 { y: 69.1; }
        frame 24 { y: 69.3; }
        frame 25 { y: -10000; }
        frame 43 { x: 26.5; y: 69.2; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: 25.7; y: 69.3; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: 24.9; y: -10000; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: 24.1; y: 69.4; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: 25.2; y: 69.3; skew-x: -1.7; skew-y: -1.7; }
        frame 48 { x: 26.3; y: 69.2; skew-x: -0.7; skew-y: -0.7; }
        frame 49 { x: 27.3; y: 69.3; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 58 { y: 69.7; }
        frame 59 { y: 70.1; }
        frame 60 { y: 69.7; }
        frame 61 { y: 69.3; }
        frame 62 { y: 69.7; }
        frame 63 { y: 70.1; }
        frame 64 { y: 69.7; }
        frame 65 { y: 69.3; }
        frame 66 { y: 69.7; }
        frame 67 { y: 70.1; }
        frame 68 { y: 69.7; }
        frame 69 { y: 69.3; }
        frame 70 { y: -10000; }
        frame 71 { x: 34.1; y: 54.9; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 41.6; y: 40.5; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 37; y: 44.6; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 32.5; y: 49; skew-x: 4; skew-y: 4; }
        frame 75 { x: 28.2; y: 53.5; skew-x: 0; skew-y: 0; }
        frame 76 { x: 24.3; y: 58; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 24.5; y: 64; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: -10000; y: 69.8; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: 25; y: 70.8; skew-x: -3; skew-y: -3.2; scale-x: 0.907; scale-y: 0.889; }
        frame 80 { x: 25.4; y: 72.3; skew-x: -2.3; skew-y: -2.5; scale-x: 0.916; scale-y: 0.88; }
        frame 81 { x: 26; y: 69.6; skew-x: -2.2; skew-y: -2.4; scale-x: 0.907; scale-y: 0.889; }
        frame 82 { x: 26.5; y: 67.2; skew-x: -2.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: 26.6; y: 68.8; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 26.5; y: 70.7; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_engine";
        frame-count: 85;
        frame 0 { x: 44.1; y: 76.3; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_ENGINE; }
        frame 1 { x: -10000; y: 75.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 75.1; }
        frame 3 { y: 75.5; }
        frame 4 { y: 75.9; }
        frame 5 { y: 75.5; }
        frame 6 { y: 75.1; }
        frame 7 { y: 75.8; }
        frame 8 { y: 76.5; }
        frame 9 { y: 76; }
        frame 10 { y: 75.4; }
        frame 11 { y: 75.8; }
        frame 12 { y: 76.3; }
        frame 13 { y: 76; }
        frame 14 { y: 75.7; }
        frame 15 { y: 76.3; }
        frame 16 { y: 76.8; }
        frame 17 { y: 76.6; }
        frame 18 { y: 76.3; }
        frame 19 { y: 75.6; }
        frame 20 { y: 74.9; }
        frame 21 { y: 75.8; }
        frame 22 { y: 76.6; }
        frame 23 { y: 76.5; }
        frame 24 { y: 76.3; }
        frame 25 { y: -10000; }
        frame 26 { y: 76.6; }
        frame 27 { y: 76.9; }
        frame 28 { y: 76.6; }
        frame 29 { y: 76.3; }
        frame 30 { y: 76.6; }
        frame 31 { y: 76.9; }
        frame 32 { y: 76.6; }
        frame 33 { y: 76.3; }
        frame 34 { y: 76.6; }
        frame 35 { y: 76.9; }
        frame 36 { y: 76.6; }
        frame 37 { y: 76.3; }
        frame 38 { y: 76.6; }
        frame 39 { y: 76.9; }
        frame 40 { y: 76.6; }
        frame 41 { y: 76.3; }
        frame 42 { y: -10000; }
        frame 43 { x: 43.4; y: 76.2; skew-x: -0.7; skew-y: -0.7; }
        frame 44 { x: 42.8; y: 76; skew-x: -1.4; skew-y: -1.4; }
        frame 45 { x: 42; y: 75.8; skew-x: -2.2; skew-y: -2.2; }
        frame 46 { x: 41.3; y: -10000; skew-x: -3.2; skew-y: -3.2; }
        frame 47 { x: 42.3; y: 76; skew-x: -1.9; skew-y: -1.9; }
        frame 48 { x: 43.1; y: 76.1; skew-x: -0.9; skew-y: -0.9; }
        frame 49 { x: 44.1; y: 76.3; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: 76.6; skew-x: -10000; skew-y: -10000; }
        frame 51 { y: 76.9; }
        frame 52 { y: 76.6; }
        frame 53 { y: 76.3; }
        frame 54 { y: 76.6; }
        frame 55 { y: 76.9; }
        frame 56 { y: 76.3; }
        frame 57 { y: -10000; }
        frame 58 { y: 76.6; }
        frame 59 { y: 76.9; }
        frame 60 { y: 76.6; }
        frame 61 { y: 76.3; }
        frame 62 { y: 76.6; }
        frame 63 { y: 76.9; }
        frame 64 { y: 76.6; }
        frame 65 { y: 76.3; }
        frame 66 { y: 76.6; }
        frame 67 { y: 76.9; }
        frame 68 { y: -10000; }
        frame 71 { x: 50; y: 64.2; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 56.4; y: 51.5; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 52.6; y: 54.6; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 48.9; y: 57.7; skew-x: 4; skew-y: 4; }
        frame 75 { x: 45.2; y: 61; skew-x: 0; skew-y: 0; }
        frame 76 { x: 41.6; y: 64.5; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 41.8; y: 70.5; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: 41.9; y: 76.3; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: 42.4; y: 77.7; skew-x: -3; skew-y: -3.2; scale-x: 0.907; scale-y: 0.889; }
        frame 80 { x: 42.9; y: 79.1; skew-x: -2.3; skew-y: -2.5; scale-x: 0.916; scale-y: 0.88; }
        frame 81 { x: 43.2; y: 76.6; skew-x: -2.2; skew-y: -2.4; scale-x: 0.907; scale-y: 0.889; }
        frame 82 { x: 43.6; y: 74.2; skew-x: -2.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: -10000; y: 76; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 77.7; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_manhole";
        frame-count: 85;
        frame 0 { x: 92.8; y: 96.4; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_MANHOLE; }
        frame 1 { x: -10000; y: 96.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: -10000; }
        frame 4 { y: 96.2; }
        frame 5 { y: -10000; }
        frame 6 { y: 96.1; }
        frame 7 { y: -10000; }
        frame 8 { y: 96; }
        frame 10 { y: 95.9; }
        frame 11 { y: 95.8; }
        frame 12 { y: -10000; }
        frame 14 { y: 95.9; }
        frame 15 { y: 96; }
        frame 17 { y: 96.1; }
        frame 18 { y: -10000; }
        frame 19 { y: 96.2; }
        frame 20 { y: -10000; }
        frame 21 { y: 96.3; }
        frame 22 { y: -10000; }
        frame 24 { y: 96.4; }
        frame 25 { y: -10000; }
        frame 43 { x: 92.5; y: 95.7; skew-x: -0.4; skew-y: -0.4; }
        frame 44 { x: 92; y: 95; skew-x: -1.2; skew-y: -1.2; }
        frame 45 { x: 91.6; y: 94.4; skew-x: -1.9; skew-y: -1.9; }
        frame 46 { x: 91.1; y: 93.7; skew-x: -2.7; skew-y: -2.7; }
        frame 47 { x: 91.7; y: 94.6; skew-x: -1.7; skew-y: -1.7; }
        frame 48 { x: 92.2; y: 95.4; skew-x: -0.7; skew-y: -0.7; }
        frame 49 { x: 92.8; y: 96.4; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 96.2; y: 88.7; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 99.8; y: 81; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 97.5; y: 80.8; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 95.4; y: 80.6; skew-x: 4; skew-y: 4; }
        frame 75 { x: 93.3; y: 80.5; skew-x: 0; skew-y: 0; }
        frame 76 { x: 91.5; y: -10000; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 91.6; y: 86.3; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: 91.7; y: 92.2; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: 92.6; y: 94; skew-x: -3; skew-y: -3.2; scale-x: 0.907; scale-y: 0.889; }
        frame 80 { x: 93.3; y: 95.9; skew-x: -2.3; skew-y: -2.5; scale-x: 0.916; scale-y: 0.88; }
        frame 81 { x: 93.2; y: 93.7; skew-x: -2.2; skew-y: -2.4; scale-x: 0.907; scale-y: 0.889; }
        frame 82 { x: 93.1; y: 91.5; skew-x: -2.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: -10000; y: 93.2; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 95; skew-x: -2.4; skew-y: -2.4; }
    }
    Track {
        source-name: "Zombie_catapult_manhole_overlay";
        frame-count: 85;
        frame 0 { x: 96.3; y: 98.2; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_MANHOLE_OVERLAY; }
        frame 1 { x: 91.5; y: 104.6; skew-x: -14.9; skew-y: -14.9; scale-x: 0.899; scale-y: 0.899; image: none; }
        frame 2 { x: 88.3; y: 112; skew-x: -29.8; skew-y: -29.8; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 87.3; y: 120.1; skew-x: -44.9; skew-y: -44.9; scale-x: 0.9; scale-y: 0.9; }
        frame 4 { x: 88.4; y: 128.3; skew-x: -60; skew-y: -60; scale-x: 0.899; scale-y: 0.899; }
        frame 5 { x: 91.5; y: 135.6; skew-x: -74.9; skew-y: -74.9; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 96.3; y: 142.1; skew-x: -89.9; skew-y: -89.9; scale-x: 0.9; scale-y: 0.9; }
        frame 7 { x: 102.8; y: 146.9; skew-x: -104.9; skew-y: -104.9; scale-x: 0.899; scale-y: 0.899; }
        frame 8 { x: 110.2; y: 149.9; skew-x: -119.8; skew-y: -119.8; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 118.3; y: 151; skew-x: -134.9; skew-y: -134.9; scale-x: 0.9; scale-y: 0.9; }
        frame 10 { x: 126.5; y: 149.9; skew-x: -150; skew-y: -150; scale-x: 0.899; scale-y: 0.899; }
        frame 11 { x: 133.8; y: 146.6; skew-x: -164.9; skew-y: -164.9; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 140.3; y: 141.7; skew-x: -179.9; skew-y: -179.9; scale-x: 0.9; scale-y: 0.9; }
        frame 13 { x: 145.2; y: 135.3; skew-x: -194.9; skew-y: -194.9; scale-x: 0.899; scale-y: 0.899; }
        frame 14 { x: 148.3; y: 128; skew-x: -209.8; skew-y: -209.8; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 149.3; y: 119.9; skew-x: -224.9; skew-y: -224.9; scale-x: 0.9; scale-y: 0.9; }
        frame 16 { x: 148.3; y: 111.8; skew-x: -240; skew-y: -240; scale-x: 0.899; scale-y: 0.899; }
        frame 17 { x: 145.2; y: 104.5; skew-x: -254.9; skew-y: -254.9; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 140.3; y: 98.2; skew-x: -269.9; skew-y: -269.9; scale-x: 0.9; scale-y: 0.9; }
        frame 19 { x: 133.8; y: 93.3; skew-x: -284.9; skew-y: -284.9; scale-x: 0.899; scale-y: 0.899; }
        frame 20 { x: 126.5; y: 90.2; skew-x: -299.8; skew-y: -299.8; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 118.3; y: 89.1; skew-x: -314.9; skew-y: -314.9; scale-x: 0.9; scale-y: 0.9; }
        frame 22 { x: 110.3; y: 90.2; skew-x: -330; skew-y: -330; scale-x: 0.899; scale-y: 0.899; }
        frame 23 { x: 102.8; y: 93.2; skew-x: -344.9; skew-y: -344.9; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 96.3; y: 98.2; skew-x: -359.9; skew-y: -359.9; scale-x: 0.9; scale-y: 0.9; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 96; y: 97.4; skew-x: -360.4; skew-y: -360.4; }
        frame 44 { x: 95.5; y: 96.7; skew-x: -361.2; skew-y: -361.2; }
        frame 45 { x: 95.1; y: 96.1; skew-x: -361.9; skew-y: -361.9; }
        frame 46 { x: 94.7; y: 95.3; skew-x: -362.7; skew-y: -362.7; }
        frame 47 { x: 95.3; y: 96.2; skew-x: -361.7; skew-y: -361.7; }
        frame 48 { x: 95.8; y: 97.2; skew-x: -360.7; skew-y: -360.7; }
        frame 49 { x: 96.3; y: 98.2; skew-x: -359.9; skew-y: -359.9; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 71 { x: 99.5; y: 90.7; skew-x: -353.9; skew-y: -353.9; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 102.9; y: 83.5; skew-x: -347.5; skew-y: -347.5; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 101; y: 83; skew-x: -351.6; skew-y: -351.6; }
        frame 74 { x: 98.9; y: 82.6; skew-x: -355.9; skew-y: -355.9; }
        frame 75 { x: 97; y: 82.2; skew-x: -359.9; skew-y: -359.9; }
        frame 76 { x: 95.2; y: 82; skew-x: -363.9; skew-y: -363.9; }
        frame 77 { x: 95.4; y: 87.8; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: 95.5; y: 93.7; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: 96.3; y: 95.6; skew-x: -363; skew-y: -363.2; scale-x: 0.907; scale-y: 0.889; }
        frame 80 { x: 97; y: 97.6; skew-x: -362.3; skew-y: -362.5; scale-x: 0.916; scale-y: 0.88; }
        frame 81 { x: 96.9; y: 95.3; skew-x: -362.2; skew-y: -362.4; scale-x: 0.907; scale-y: 0.889; }
        frame 82 { x: 96.7; y: 93.1; skew-x: -362.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: 96.8; y: 94.8; skew-x: -362.2; skew-y: -362.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 96.7; y: 96.6; skew-x: -362.4; skew-y: -362.4; }
    }
    Track {
        source-name: "Zombie_catapult_tape";
        frame-count: 85;
        frame 0 { x: 79.6; y: 115.2; scale-x: 0.9; scale-y: 0.9; image: IMAGE_REANIM_ZOMBIE_CATAPULT_TAPE; }
        frame 1 { x: 79.8; y: 115; scale-x: -10000; scale-y: 0.919; image: none; }
        frame 2 { x: 80; y: 114.8; scale-y: 0.939; }
        frame 3 { x: -10000; y: 114.6; scale-y: 0.908; }
        frame 4 { y: 114.3; scale-y: 0.877; }
        frame 5 { y: 114.1; scale-y: 0.845; }
        frame 6 { y: 113.8; scale-y: 0.814; }
        frame 7 { x: 79.6; y: 113.3; skew-x: 1.3; skew-y: 1.3; scale-y: -10000; }
        frame 8 { x: 79.3; y: 112.6; skew-x: 2.5; skew-y: 2.5; }
        frame 9 { x: 79.5; y: 113.2; skew-x: 1.8; skew-y: 1.8; scale-y: 0.836; }
        frame 10 { x: 79.6; y: 113.9; skew-x: 1.3; skew-y: 1.3; scale-y: 0.857; }
        frame 11 { x: 79.8; y: 114.5; skew-x: 0.5; skew-y: 0.5; scale-y: 0.879; }
        frame 12 { x: 80; y: 115.2; skew-x: 0; skew-y: 0; scale-y: 0.9; }
        frame 13 { x: 79.9; y: 115; skew-x: -10000; skew-y: -10000; scale-y: 0.919; }
        frame 14 { x: 79.8; y: 114.8; scale-y: 0.939; }
        frame 15 { x: 79.7; y: 114.6; scale-y: 0.908; }
        frame 16 { x: -10000; y: 114.3; scale-y: 0.877; }
        frame 17 { x: 79.6; y: 114.1; scale-y: 0.845; }
        frame 18 { x: 79.5; y: 113.8; scale-y: 0.814; }
        frame 19 { x: -10000; y: 113.3; skew-x: 1.3; skew-y: 1.3; scale-y: -10000; }
        frame 20 { y: 112.6; skew-x: 2.5; skew-y: 2.5; }
        frame 21 { x: 79.6; y: 113.3; skew-x: 1.8; skew-y: 1.8; scale-y: 0.836; }
        frame 22 { x: 79.8; y: 114; skew-x: 1.3; skew-y: 1.3; scale-y: 0.857; }
        frame 23 { x: -10000; y: 114.6; skew-x: 0.5; skew-y: 0.5; scale-y: 0.879; }
        frame 24 { x: 80; y: 115.2; skew-x: 0; skew-y: 0; scale-y: 0.9; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 27 { x: 80; }
        frame 28 { x: -10000; }
        frame 30 { x: 79.9; }
        frame 31 { x: -10000; }
        frame 34 { x: 79.8; }
        frame 35 { x: -10000; }
        frame 43 { x: 79.3; y: 114.7; skew-x: -1.7; skew-y: -1.7; }
        frame 44 { x: 79; y: 114.3; skew-x: -3.7; skew-y: -3.7; }
        frame 45 { x: 78.6; y: 114; skew-x: -5.4; skew-y: -5.4; scale-x: 0.899; scale-y: 0.899; }
        frame 46 { x: 78.2; y: 113.6; skew-x: -7.5; skew-y: -7.5; scale-x: 0.9; scale-y: 0.9; }
        frame 47 { x: 77.5; y: 114.8; skew-x: -16.2; skew-y: -16.2; scale-x: 0.899; scale-y: 0.899; }
        frame 48 { x: 78.6; y: -10000; skew-x: -7.9; skew-y: -7.9; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 79.8; y: 115.2; skew-x: 0; skew-y: 0; scale-x: 0.9; scale-y: 0.9; }
        frame 50 { x: 80; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.946; }
        frame 51 { x: 80.3; scale-y: 0.992; }
        frame 52 { x: 80.1; scale-y: 0.961; }
        frame 53 { x: 79.9; scale-y: 0.931; }
        frame 54 { x: 79.8; scale-y: 0.9; }
        frame 55 { x: -10000; scale-y: -10000; }
        frame 58 { x: 79.7; y: 115.6; }
        frame 59 { x: 79.5; y: 116; }
        frame 60 { x: 79.8; y: 116.2; }
        frame 61 { x: 79.5; y: 115.2; }
        frame 62 { x: 79.8; y: 115; }
        frame 63 { x: 79.5; y: 116; }
        frame 64 { x: 79.8; y: 116.2; }
        frame 65 { x: 79.5; y: 115.2; }
        frame 66 { x: 79.8; y: 115; }
        frame 67 { x: -10000; y: 116; }
        frame 68 { y: 116.2; }
        frame 69 { y: 115.2; }
        frame 70 { y: -10000; }
        frame 71 { x: 81.3; y: 105.8; skew-x: 6; skew-y: 6; scale-x: 0.899; scale-y: 0.899; }
        frame 72 { x: 83; y: 96.5; skew-x: 12.4; skew-y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 82.3; y: 97.4; skew-x: 8.3; skew-y: 8.3; }
        frame 74 { x: 81.3; y: 98.3; skew-x: 4; skew-y: 4; }
        frame 75 { x: 80.6; y: 99.2; skew-x: 0; skew-y: 0; }
        frame 76 { x: 79.8; y: 100.1; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 80; y: 106; skew-x: -10000; skew-y: -10000; scale-x: 0.898; scale-y: 0.898; }
        frame 78 { x: 80.1; y: 111.8; scale-x: 0.899; scale-y: 0.899; }
        frame 79 { x: 80.5; y: 113.8; skew-x: -3; skew-y: -3.2; scale-x: 0.907; scale-y: 0.932; }
        frame 80 { x: 80.8; y: 115.7; skew-x: -2.3; skew-y: -2.5; scale-x: 0.916; scale-y: 0.966; }
        frame 81 { x: -10000; y: 113.3; skew-x: -2.2; skew-y: -2.4; scale-x: 0.907; scale-y: 0.932; }
        frame 82 { y: 110.8; skew-x: -2.4; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; }
        frame 83 { x: 80.9; y: 112.6; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 80.8; y: 114.3; skew-x: -2.4; skew-y: -2.4; }
    }
}
