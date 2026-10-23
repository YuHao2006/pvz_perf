export component Cattail {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 40;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 24 { cel: -1; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "Cattail_paw2";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 6.5; y: 54; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CATTAIL_PAW2; }
        frame 6 { x: 6.3; y: -10000; scale-x: 0.803; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 6.2; scale-x: 0.807; }
        frame 8 { x: 6.1; scale-x: 0.81; }
        frame 9 { x: 5.9; scale-x: 0.814; }
        frame 10 { x: 5.8; scale-x: 0.817; }
        frame 11 { x: 5.6; scale-x: 0.82; }
        frame 12 { x: 5.5; scale-x: 0.824; }
        frame 13 { x: 5.3; scale-x: 0.827; }
        frame 14 { x: 5.2; scale-x: 0.831; }
        frame 15 { x: 5.4; scale-x: 0.827; }
        frame 16 { x: 5.5; scale-x: 0.824; }
        frame 17 { x: 5.7; scale-x: 0.82; }
        frame 18 { x: 5.8; scale-x: 0.817; }
        frame 19 { x: 6; scale-x: 0.814; }
        frame 20 { x: 6.1; scale-x: 0.81; }
        frame 21 { x: 6.3; scale-x: 0.807; }
        frame 22 { x: 6.4; scale-x: 0.803; }
        frame 23 { x: 6.5; scale-x: 0.8; }
        frame 24 { x: -10000; scale-x: -10000; }
        frame 30 { x: 7; skew-y: 2.3; scale-y: 0.803; }
        frame 31 { x: 7.5; skew-y: 4.5; scale-y: 0.806; }
        frame 32 { x: 8; skew-y: 6.8; scale-y: 0.809; }
        frame 33 { x: 8.5; skew-y: 9; scale-y: 0.812; }
        frame 34 { x: 9; skew-y: 11.3; scale-y: 0.816; }
        frame 35 { x: 8.5; skew-y: 9; scale-y: 0.812; }
        frame 36 { x: 8; skew-y: 6.8; scale-y: 0.809; }
        frame 37 { x: 7.6; skew-y: 4.5; scale-y: 0.806; }
        frame 38 { x: 7.1; skew-y: 2.3; scale-y: 0.803; }
        frame 39 { x: 6.5; skew-y: 0; scale-y: 0.8; }
    }
    Track {
        source-name: "Cattail_paw3";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 57.8; y: 50.6; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CATTAIL_PAW3; }
        frame 6 { x: 57.7; y: -10000; scale-x: 0.81; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: -10000; scale-x: 0.821; }
        frame 8 { x: 57.6; scale-x: 0.831; }
        frame 9 { x: -10000; scale-x: 0.841; }
        frame 10 { scale-x: 0.852; }
        frame 11 { scale-x: 0.862; }
        frame 12 { x: 57.5; scale-x: 0.872; }
        frame 13 { x: -10000; scale-x: 0.883; }
        frame 14 { scale-x: 0.893; }
        frame 15 { scale-x: 0.883; }
        frame 16 { scale-x: 0.872; }
        frame 17 { x: 57.6; scale-x: 0.862; }
        frame 18 { x: -10000; scale-x: 0.852; }
        frame 19 { scale-x: 0.841; }
        frame 20 { scale-x: 0.831; }
        frame 21 { x: 57.7; scale-x: 0.821; }
        frame 22 { x: 57.6; scale-x: 0.81; }
        frame 23 { x: 57.8; scale-x: 0.8; }
        frame 24 { x: -10000; scale-x: -10000; }
        frame 30 { x: 57.5; y: 50.5; skew-x: 1.1; scale-x: 0.801; }
        frame 31 { x: 57.3; y: -10000; skew-x: 2.3; scale-x: 0.802; }
        frame 32 { x: 57; y: 50.4; skew-x: 3.5; scale-x: 0.803; }
        frame 33 { x: 56.7; y: 50.3; skew-x: 4.8; scale-x: -10000; }
        frame 34 { x: 56.5; y: 50.1; skew-x: 6.1; scale-x: 0.805; }
        frame 35 { x: 56.7; y: 50.3; skew-x: 4.8; scale-x: 0.803; }
        frame 36 { x: 57; y: 50.4; skew-x: 3.5; scale-x: -10000; }
        frame 37 { x: 57.3; y: 50.5; skew-x: 2.3; scale-x: 0.802; }
        frame 38 { x: 57.5; y: 50.6; skew-x: 1.1; scale-x: 0.801; }
        frame 39 { x: 57.8; y: -10000; skew-x: 0; scale-x: 0.8; }
    }
    Track {
        source-name: "Cattail_tail";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 2.4; y: 33.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CATTAIL_TAIL; }
        frame 6 { x: 3.3; y: 33.5; skew-x: 1; skew-y: 1.8; scale-x: -10000; scale-y: 0.799; cel: -10000; image: none; }
        frame 7 { x: 4.3; y: 33.4; skew-x: 2; skew-y: 3.5; scale-x: 0.801; scale-y: -10000; }
        frame 8 { x: 5.3; y: 33; skew-x: 3; skew-y: 5.3; scale-x: -10000; scale-y: 0.798; }
        frame 9 { x: 3.9; y: 34; skew-x: 0.6; skew-y: 2.5; scale-y: -10000; }
        frame 10 { x: 2.7; y: 34.8; skew-x: -1.4; skew-y: 0; scale-y: 0.799; }
        frame 11 { x: 1.4; y: 35.8; skew-x: -3.7; skew-y: -2.7; scale-x: 0.8; scale-y: -10000; }
        frame 12 { x: 0.2; y: 36.7; skew-x: -5.9; skew-y: -5.2; scale-x: -10000; }
        frame 13 { x: -0.9; y: 37.6; skew-x: -8.2; skew-y: -7.9; scale-x: 0.799; }
        frame 14 { x: -2.2; y: 38.8; skew-x: -10.7; skew-y: -10.7; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: 39.1; skew-x: -10.9; skew-y: -10000; scale-x: 0.801; scale-y: 0.797; }
        frame 16 { y: 39.5; skew-x: -11.4; skew-y: -11; scale-x: 0.803; scale-y: 0.794; }
        frame 17 { y: 39.9; skew-x: -11.8; skew-y: -11.3; scale-x: 0.806; scale-y: 0.793; }
        frame 18 { x: -1.5; y: 38.8; skew-x: -9.7; skew-y: -9.4; scale-x: 0.804; scale-y: -10000; }
        frame 19 { x: -0.7; y: 37.8; skew-x: -7.7; skew-y: -7.4; scale-x: 0.803; scale-y: 0.795; }
        frame 20 { x: 0; y: 36.7; skew-x: -5.7; skew-y: -5.5; scale-x: -10000; scale-y: 0.796; }
        frame 21 { x: 0.7; y: 35.7; skew-x: -3.7; skew-y: -3.7; scale-x: 0.802; scale-y: 0.797; }
        frame 22 { x: 1.6; y: 34.7; skew-x: -1.7; skew-y: -1.7; scale-x: 0.801; scale-y: 0.799; }
        frame 23 { x: 2.4; y: 33.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -1.2; y: 36.5; skew-x: -4.9; skew-y: -8.9; scale-y: 0.81; }
        frame 26 { x: -4.9; y: 39.6; skew-x: -9.9; skew-y: -17.9; scale-x: 0.799; scale-y: 0.819; }
        frame 27 { x: -8.3; y: 43; skew-x: -15; skew-y: -27; scale-x: -10000; scale-y: 0.829; }
        frame 28 { x: -11.5; y: 46.6; skew-x: -20.2; skew-y: -36; scale-x: 0.798; scale-y: 0.839; }
        frame 29 { x: -14.5; y: 50.5; skew-x: -25.2; skew-y: -45.2; scale-x: 0.799; scale-y: 0.85; }
        frame 30 { x: -9.1; y: 41.4; skew-x: -12.7; skew-y: -30; scale-x: 0.8; scale-y: 0.838; }
        frame 31 { x: -2.6; y: 32.9; skew-x: -0.2; skew-y: -15; scale-x: 0.802; scale-y: 0.829; }
        frame 32 { x: 5.2; y: 27.7; skew-x: 12.1; skew-y: 0; scale-x: 0.803; scale-y: 0.819; }
        frame 33 { x: 13.7; y: 23.4; skew-x: 24.6; skew-y: 14.8; scale-x: 0.804; scale-y: 0.809; }
        frame 34 { x: 22.7; y: 20.1; skew-x: 37.1; skew-y: 30; scale-x: 0.806; scale-y: 0.8; }
        frame 35 { x: 19.3; y: 22.5; skew-x: 29.9; skew-y: 25.5; scale-x: 0.795; scale-y: 0.806; }
        frame 36 { x: 16; y: 24.9; skew-x: 22.8; skew-y: 21; scale-x: 0.786; scale-y: 0.814; }
        frame 37 { x: 11.2; y: 27.6; skew-x: 15.1; skew-y: 14; scale-x: 0.79; scale-y: 0.809; }
        frame 38 { x: 6.7; y: 30.6; skew-x: 7.5; skew-y: 7; scale-x: 0.795; scale-y: 0.804; }
        frame 39 { x: 2.4; y: 33.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cattail_tail2";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -1.4; y: 4.7; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CATTAIL_TAIL2; }
        frame 6 { x: 3.2; y: 3.9; skew-x: 6.1; skew-y: 7.8; scale-x: 0.798; scale-y: 0.802; cel: -10000; image: none; }
        frame 7 { x: 8.2; y: 3.5; skew-x: 12.3; skew-y: 15.6; scale-x: 0.795; scale-y: 0.804; }
        frame 8 { x: 13.2; y: -10000; skew-x: 18.7; skew-y: 23.6; scale-x: 0.794; scale-y: 0.807; }
        frame 9 { x: 7.5; y: 4.7; skew-x: 11.3; skew-y: 15.3; scale-x: -10000; scale-y: 0.805; }
        frame 10 { x: 2; y: 6.1; skew-x: 3.8; skew-y: 7; scale-x: 0.796; scale-y: 0.804; }
        frame 11 { x: -3; y: 8.1; skew-x: -3.4; skew-y: -0.9; scale-x: 0.797; scale-y: 0.803; }
        frame 12 { x: -8.1; y: 10.1; skew-x: -10.7; skew-y: -9.2; scale-x: -10000; scale-y: 0.801; }
        frame 13 { x: -12.9; y: 12.7; skew-x: -18.2; skew-y: -17.4; scale-x: 0.798; scale-y: 0.8; }
        frame 14 { x: -17.5; y: 15.4; skew-x: -25.7; skew-y: -25.7; scale-x: 0.8; scale-y: -10000; }
        frame 15 { x: -19.5; y: 17.3; skew-x: -29; skew-y: -30.2; scale-x: 0.799; scale-y: 0.798; }
        frame 16 { x: -21.3; y: 19.4; skew-x: -32.5; skew-y: -35; scale-x: 0.8; scale-y: 0.797; }
        frame 17 { x: -23.1; y: 21.6; skew-x: -36.1; skew-y: -39.7; scale-x: 0.802; scale-y: -10000; }
        frame 18 { x: -20; y: 18.4; skew-x: -30; skew-y: -33; scale-x: 0.801; scale-y: 0.796; }
        frame 19 { x: -16.7; y: 15.4; skew-x: -24; skew-y: -26.4; scale-x: 0.8; scale-y: 0.797; }
        frame 20 { x: -13.1; y: 12.5; skew-x: -17.9; skew-y: -19.7; scale-x: -10000; scale-y: 0.798; }
        frame 21 { x: -9.4; y: 9.7; skew-x: -11.9; skew-y: -13.2; scale-y: -10000; }
        frame 22 { x: -5.5; y: 7.2; skew-x: -5.9; skew-y: -6.4; scale-y: 0.799; }
        frame 23 { x: -1.4; y: 4.7; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: -9.4; y: 9.1; skew-x: -4.9; skew-y: -8.9; scale-y: 0.81; }
        frame 26 { x: -17.4; y: 13.9; skew-x: -9.9; skew-y: -17.9; scale-x: 0.799; scale-y: 0.819; }
        frame 27 { x: -25.2; y: 19; skew-x: -15; skew-y: -27; scale-x: -10000; scale-y: 0.829; }
        frame 28 { x: -32.7; y: 24.7; skew-x: -20.2; skew-y: -36; scale-x: 0.798; scale-y: 0.839; }
        frame 29 { x: -40; y: 30.5; skew-x: -25.2; skew-y: -45.2; scale-x: 0.799; scale-y: 0.85; }
        frame 30 { x: -35.2; y: 23.7; skew-x: -29.7; skew-y: -48; scale-x: 0.79; scale-y: 0.861; }
        frame 31 { x: -30.5; y: 16.9; skew-x: -34.3; skew-y: -50.8; scale-x: 0.783; scale-y: 0.875; }
        frame 32 { x: -11.7; y: 3; skew-x: -8.7; skew-y: -23.9; scale-x: 0.776; scale-y: 0.889; }
        frame 33 { x: 11; y: -7.4; skew-x: 16.5; skew-y: 2.8; scale-x: 0.769; scale-y: 0.905; }
        frame 34 { x: 36.3; y: -13.3; skew-x: 42; skew-y: 29.8; scale-x: 0.762; scale-y: 0.92; }
        frame 35 { x: 33.8; y: -9.4; skew-x: 39.9; skew-y: 31.3; scale-x: 0.759; scale-y: 0.902; }
        frame 36 { x: 31.2; y: -5.6; skew-x: 37.8; skew-y: 32.9; scale-x: 0.758; scale-y: 0.887; }
        frame 37 { x: 19.7; y: -3.1; skew-x: 25.1; skew-y: 21.8; scale-x: 0.771; scale-y: 0.857; }
        frame 38 { x: 8.8; y: 0.3; skew-x: 12.5; skew-y: 10.8; scale-x: 0.786; scale-y: 0.828; }
        frame 39 { x: -1.4; y: 4.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cattail_spike";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 8.3; y: 2.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CATTAIL_SPIKE; }
        frame 6 { x: 13.3; y: 3; skew-x: 6.1; skew-y: 7.8; scale-x: 0.798; scale-y: 0.802; cel: -10000; image: none; }
        frame 7 { x: 18.2; y: 3.6; skew-x: 12.3; skew-y: 15.6; scale-x: 0.795; scale-y: 0.804; }
        frame 8 { x: 23.2; y: 4.5; skew-x: 18.7; skew-y: 23.6; scale-x: 0.794; scale-y: 0.807; }
        frame 9 { x: 17.5; y: 4.8; skew-x: 11.3; skew-y: 15.3; scale-x: -10000; scale-y: 0.805; }
        frame 10 { x: 11.8; y: 5.3; skew-x: 3.8; skew-y: 7; scale-x: 0.796; scale-y: 0.804; }
        frame 11 { x: 6.2; y: 6; skew-x: -3.4; skew-y: -0.9; scale-x: 0.797; scale-y: 0.803; }
        frame 12 { x: 0.7; y: 6.8; skew-x: -10.7; skew-y: -9.2; scale-x: -10000; scale-y: 0.801; }
        frame 13 { x: -4.4; y: 7.8; skew-x: -18.2; skew-y: -17.4; scale-x: 0.798; scale-y: 0.8; }
        frame 14 { x: -9.7; y: 9; skew-x: -25.7; skew-y: -25.7; scale-x: 0.8; scale-y: -10000; }
        frame 15 { x: -12; y: 10.7; skew-x: -29; skew-y: -30.2; scale-x: 0.799; scale-y: 0.798; }
        frame 16 { x: -14.4; y: 12.4; skew-x: -32.5; skew-y: -35; scale-x: 0.8; scale-y: 0.797; }
        frame 17 { x: -16.7; y: 14.2; skew-x: -36.1; skew-y: -39.7; scale-x: 0.802; scale-y: -10000; }
        frame 18 { x: -12.8; y: 12; skew-x: -30; skew-y: -33; scale-x: 0.801; scale-y: 0.796; }
        frame 19 { x: -8.7; y: 9.9; skew-x: -24; skew-y: -26.4; scale-x: 0.8; scale-y: 0.797; }
        frame 20 { x: -4.5; y: 8; skew-x: -17.9; skew-y: -19.7; scale-x: -10000; scale-y: 0.798; }
        frame 21 { x: -0.3; y: 5.9; skew-x: -11.9; skew-y: -13.2; scale-y: -10000; }
        frame 22 { x: 3.9; y: 4.1; skew-x: -5.9; skew-y: -6.4; scale-y: 0.799; }
        frame 23 { x: 8.3; y: 2.4; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: 0.1; y: 6.3; skew-x: -4.9; skew-y: -8.9; scale-y: 0.81; }
        frame 26 { x: -7.9; y: 10.5; skew-x: -9.9; skew-y: -17.9; scale-x: 0.799; scale-y: 0.819; }
        frame 27 { x: -15.9; y: 14.8; skew-x: -15; skew-y: -27; scale-x: -10000; scale-y: 0.829; }
        frame 28 { x: -23.9; y: 19.4; skew-x: -20.2; skew-y: -36; scale-x: 0.798; scale-y: 0.839; }
        frame 29 { x: -31.7; y: 24; skew-x: -25.2; skew-y: -45.2; scale-x: 0.799; scale-y: 0.85; }
        frame 30 { x: -27.3; y: 17.3; skew-x: -29.7; skew-y: -48; scale-x: 0.79; scale-y: 0.861; }
        frame 31 { x: -22.9; y: 10.8; skew-x: -34.3; skew-y: -50.8; scale-x: 0.783; scale-y: 0.875; }
        frame 32 { x: -0.9; y: 1.1; skew-x: -8.7; skew-y: -24; scale-x: 0.775; scale-y: 0.889; }
        frame 33 { x: 23.1; y: -6.8; skew-x: 16.5; skew-y: 2.8; scale-x: 0.769; scale-y: 0.905; }
        frame 34 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 35 { cel: -10000; }
        frame 39 { x: 8.3; y: 2.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; cel: 0; }
    }
    Track {
        source-name: "Cattail_tail2_overlay";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -0.7; y: 8.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CATTAIL_TAIL2_OVERLAY; }
        frame 6 { x: 3.4; y: 8.1; skew-x: 6.1; skew-y: 7.8; scale-x: 0.798; scale-y: 0.802; cel: -10000; image: none; }
        frame 7 { x: 7.8; y: 7.6; skew-x: 12.3; skew-y: 15.6; scale-x: 0.795; scale-y: 0.804; }
        frame 8 { x: 12.3; y: 7.3; skew-x: 18.7; skew-y: 23.6; scale-x: 0.794; scale-y: 0.807; }
        frame 9 { x: 7.2; y: 8.7; skew-x: 11.3; skew-y: 15.3; scale-x: -10000; scale-y: 0.805; }
        frame 10 { x: 2.3; y: 10.3; skew-x: 3.8; skew-y: 7; scale-x: 0.796; scale-y: 0.804; }
        frame 11 { x: -2.2; y: 12.1; skew-x: -3.4; skew-y: -0.9; scale-x: 0.797; scale-y: 0.803; }
        frame 12 { x: -6.8; y: 14.1; skew-x: -10.7; skew-y: -9.2; scale-x: -10000; scale-y: 0.801; }
        frame 13 { x: -11.1; y: 16.4; skew-x: -18.2; skew-y: -17.4; scale-x: 0.798; scale-y: 0.8; }
        frame 14 { x: -15.1; y: 18.7; skew-x: -25.7; skew-y: -25.7; scale-x: 0.8; scale-y: -10000; }
        frame 15 { x: -16.8; y: 20.5; skew-x: -29; skew-y: -30.2; scale-x: 0.799; scale-y: 0.798; }
        frame 16 { x: -18.3; y: 22.4; skew-x: -32.5; skew-y: -35; scale-x: 0.8; scale-y: 0.797; }
        frame 17 { x: -20; y: 24.3; skew-x: -36.1; skew-y: -39.7; scale-x: 0.802; scale-y: -10000; }
        frame 18 { x: -17.2; y: 21.6; skew-x: -30; skew-y: -33; scale-x: 0.801; scale-y: 0.796; }
        frame 19 { x: -14.2; y: 18.8; skew-x: -24; skew-y: -26.4; scale-x: 0.8; scale-y: 0.797; }
        frame 20 { x: -11; y: 16.1; skew-x: -17.9; skew-y: -19.7; scale-x: -10000; scale-y: 0.798; }
        frame 21 { x: -7.7; y: 13.6; skew-x: -11.9; skew-y: -13.2; scale-y: -10000; }
        frame 22 { x: -4.2; y: 11.1; skew-x: -5.9; skew-y: -6.4; scale-y: 0.799; }
        frame 23 { x: -0.7; y: 8.8; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: -8; y: 13.1; skew-x: -4.9; skew-y: -8.9; scale-y: 0.81; }
        frame 26 { x: -15.4; y: 17.8; skew-x: -9.9; skew-y: -17.9; scale-x: 0.799; scale-y: 0.819; }
        frame 27 { x: -22.5; y: 22.6; skew-x: -15; skew-y: -27; scale-x: -10000; scale-y: 0.829; }
        frame 28 { x: -29.5; y: 27.8; skew-x: -20.2; skew-y: -36; scale-x: 0.798; scale-y: 0.839; }
        frame 29 { x: -36.3; y: 33.2; skew-x: -25.2; skew-y: -45.2; scale-x: 0.799; scale-y: 0.85; }
        frame 30 { x: -31.3; y: 26.3; skew-x: -29.7; skew-y: -48; scale-x: 0.79; scale-y: 0.861; }
        frame 31 { x: -26.1; y: 19.4; skew-x: -34.3; skew-y: -50.8; scale-x: 0.783; scale-y: 0.875; }
        frame 32 { x: -8.7; y: 7.5; skew-x: -8.7; skew-y: -23.9; scale-x: 0.776; scale-y: 0.889; }
        frame 33 { x: 11.9; y: -2.1; skew-x: 16.5; skew-y: 2.8; scale-x: 0.769; scale-y: 0.905; }
        frame 34 { x: 34.5; y: -8.8; skew-x: 42; skew-y: 29.8; scale-x: 0.762; scale-y: 0.92; }
        frame 35 { x: 32; y: -5; skew-x: 39.9; skew-y: 31.3; scale-x: 0.759; scale-y: 0.902; }
        frame 36 { x: 29.4; y: -1.3; skew-x: 37.8; skew-y: 32.9; scale-x: 0.758; scale-y: 0.887; }
        frame 37 { x: 18.7; y: 1.4; skew-x: 25.1; skew-y: 21.8; scale-x: 0.771; scale-y: 0.857; }
        frame 38 { x: 8.7; y: 4.7; skew-x: 12.5; skew-y: 10.8; scale-x: 0.786; scale-y: 0.828; }
        frame 39 { x: -0.7; y: 8.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 26; y: 25.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CATTAIL_HEAD; }
        frame 6 { x: 25.8; y: 25.3; scale-x: 0.807; scale-y: 0.796; cel: -10000; image: none; }
        frame 7 { x: 25.6; y: 25.5; scale-x: 0.814; scale-y: 0.792; }
        frame 8 { x: 25.5; y: 25.7; scale-x: 0.821; scale-y: 0.788; }
        frame 9 { x: 25.3; y: 25.9; scale-x: 0.828; scale-y: 0.784; }
        frame 10 { x: 25.2; y: 26.1; scale-x: 0.835; scale-y: 0.779; }
        frame 11 { x: 25; y: 26.3; scale-x: 0.842; scale-y: 0.775; }
        frame 12 { x: 24.9; y: 26.5; scale-x: 0.849; scale-y: 0.771; }
        frame 13 { x: 24.8; y: 26.7; scale-x: 0.857; scale-y: 0.767; }
        frame 14 { x: 24.6; y: 26.9; scale-x: 0.864; scale-y: 0.763; }
        frame 15 { x: 24.7; y: 26.7; scale-x: 0.857; scale-y: 0.767; }
        frame 16 { x: 24.9; y: 26.6; scale-x: 0.849; scale-y: 0.771; }
        frame 17 { x: 25; y: 26.4; scale-x: 0.842; scale-y: 0.775; }
        frame 18 { x: 25.2; y: 26.2; scale-x: 0.835; scale-y: 0.779; }
        frame 19 { x: 25.3; y: 25.9; scale-x: 0.828; scale-y: 0.784; }
        frame 20 { x: 25.5; y: 25.7; scale-x: 0.821; scale-y: 0.788; }
        frame 21 { x: 25.6; y: 25.5; scale-x: 0.814; scale-y: 0.792; }
        frame 22 { x: 25.8; y: 25.3; scale-x: 0.807; scale-y: 0.796; }
        frame 23 { x: 26; y: 25.1; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 24.8; skew-y: -1.4; scale-y: 0.802; }
        frame 26 { x: 23.4; skew-y: -3.2; scale-y: 0.803; }
        frame 27 { x: 22.1; skew-y: -4.9; scale-y: 0.805; }
        frame 28 { x: 20.9; skew-y: -6.5; scale-y: 0.807; }
        frame 29 { x: 19.5; skew-y: -8.3; scale-y: 0.809; }
        frame 30 { x: 23; y: 24.1; skew-x: 4.1; skew-y: -1.9; scale-y: 0.807; }
        frame 31 { x: 26.6; y: 23.2; skew-x: 8.3; skew-y: 4.3; scale-x: 0.799; scale-y: 0.805; }
        frame 32 { x: 30.3; y: 22.6; skew-x: 12.6; skew-y: 10.8; scale-x: -10000; scale-y: 0.802; }
        frame 33 { x: 34; y: 22.2; skew-x: 16.8; skew-y: 17.1; scale-y: 0.8; }
        frame 34 { x: 37.9; y: 22; skew-x: 21.2; skew-y: 23.6; scale-x: 0.8; scale-y: 0.799; }
        frame 35 { x: 35.2; y: 22.4; skew-x: 16.8; skew-y: 18.8; scale-x: 0.799; scale-y: 0.798; }
        frame 36 { x: 32.8; y: 22.9; skew-x: 12.6; skew-y: 14; scale-x: -10000; scale-y: 0.799; }
        frame 37 { x: 30.4; y: 23.5; skew-x: 8.3; skew-y: 9.3; scale-y: -10000; }
        frame 38 { x: 28.1; y: 24.3; skew-x: 4.1; skew-y: 4.6; scale-x: 0.8; scale-y: 0.8; }
        frame 39 { x: 26; y: 25.1; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Cattail_paw1";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 31.2; y: 59.4; scale-x: 0.85; scale-y: 0.85; cel: 0; image: IMAGE_REANIM_CATTAIL_PAW1; }
        frame 6 { x: 31.1; y: -10000; scale-x: 0.854; scale-y: 0.856; cel: -10000; image: none; }
        frame 7 { x: 31; scale-x: 0.858; scale-y: 0.861; }
        frame 8 { x: 30.9; y: 59.5; scale-x: 0.862; scale-y: 0.867; }
        frame 9 { x: 30.8; y: -10000; scale-x: 0.865; scale-y: 0.873; }
        frame 10 { x: 30.7; scale-x: 0.869; scale-y: 0.878; }
        frame 11 { x: -10000; scale-x: 0.873; scale-y: 0.884; }
        frame 12 { x: 30.6; y: 59.6; scale-x: 0.877; scale-y: 0.89; }
        frame 13 { x: 30.5; y: -10000; scale-x: 0.881; scale-y: 0.896; }
        frame 14 { x: 30.4; scale-x: 0.885; scale-y: 0.901; }
        frame 15 { x: 30.5; y: 59.5; scale-x: 0.881; scale-y: 0.896; }
        frame 16 { x: 30.6; y: 59.6; scale-x: 0.877; scale-y: 0.89; }
        frame 17 { x: 30.7; y: 59.5; scale-x: 0.873; scale-y: 0.884; }
        frame 18 { x: -10000; y: -10000; scale-x: 0.869; scale-y: 0.878; }
        frame 19 { x: 30.9; scale-x: 0.865; scale-y: 0.873; }
        frame 20 { x: -10000; scale-x: 0.862; scale-y: 0.867; }
        frame 21 { x: 31; y: 59.4; scale-x: 0.858; scale-y: 0.861; }
        frame 22 { x: 31.1; y: 59.5; scale-x: 0.854; scale-y: 0.856; }
        frame 23 { x: 31.2; y: 59.4; scale-x: 0.85; scale-y: 0.85; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 30.7; y: 58.5; skew-x: 1.3; scale-x: 0.863; }
        frame 31 { x: 30.2; y: 57.6; skew-x: 2.8; scale-x: 0.875; }
        frame 32 { x: 29.8; y: 56.7; skew-x: 4.3; scale-x: 0.888; }
        frame 33 { x: 29.4; y: 55.8; skew-x: 5.8; scale-x: 0.901; }
        frame 34 { x: 28.9; y: 54.8; skew-x: 7.4; scale-x: 0.914; }
        frame 35 { x: 29.4; y: 55.8; skew-x: 5.8; scale-x: 0.901; }
        frame 36 { x: 29.8; y: 56.8; skew-x: 4.3; scale-x: 0.888; }
        frame 37 { x: 30.2; y: 57.6; skew-x: 2.8; scale-x: 0.875; }
        frame 38 { x: 30.7; y: 58.6; skew-x: 1.3; scale-x: 0.863; }
        frame 39 { x: 31.2; y: 59.4; skew-x: 0; scale-x: 0.85; }
    }
    Track {
        source-name: "Cattail_hat";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 11.8; y: 9.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CATTAIL_HAT; }
        frame 6 { x: 11.5; y: 9.6; scale-x: 0.807; scale-y: 0.796; cel: -10000; image: none; }
        frame 7 { x: 11.2; y: 9.8; scale-x: 0.814; scale-y: 0.792; }
        frame 8 { x: 10.9; y: 10.1; scale-x: 0.821; scale-y: 0.788; }
        frame 9 { x: 10.7; y: 10.4; scale-x: 0.828; scale-y: 0.784; }
        frame 10 { x: 10.3; y: 10.7; scale-x: 0.835; scale-y: 0.779; }
        frame 11 { x: 10.1; y: 11; scale-x: 0.842; scale-y: 0.775; }
        frame 12 { x: 9.9; y: 11.2; scale-x: 0.849; scale-y: 0.771; }
        frame 13 { x: 9.5; y: 11.5; scale-x: 0.857; scale-y: 0.767; }
        frame 14 { x: 9.3; y: 11.8; scale-x: 0.864; scale-y: 0.763; }
        frame 15 { x: 9.5; y: 11.5; scale-x: 0.857; scale-y: 0.767; }
        frame 16 { x: 9.9; y: 11.2; scale-x: 0.849; scale-y: 0.771; }
        frame 17 { x: 10.1; y: 10.9; scale-x: 0.842; scale-y: 0.775; }
        frame 18 { x: 10.4; y: 10.6; scale-x: 0.835; scale-y: 0.779; }
        frame 19 { x: 10.7; y: 10.3; scale-x: 0.828; scale-y: 0.784; }
        frame 20 { x: 11; y: 10.1; scale-x: 0.821; scale-y: 0.788; }
        frame 21 { x: 11.2; y: 9.8; scale-x: 0.814; scale-y: 0.792; }
        frame 22 { x: 11.5; y: 9.5; scale-x: 0.807; scale-y: 0.796; }
        frame 23 { x: 11.8; y: 9.3; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 10.1; y: 9.2; skew-y: -1.4; scale-y: 0.802; }
        frame 26 { x: 8.3; y: -10000; skew-y: -3.2; scale-y: 0.803; }
        frame 27 { x: 6.5; skew-y: -4.9; scale-y: 0.805; }
        frame 28 { x: 4.8; skew-y: -6.5; scale-y: 0.807; }
        frame 29 { x: 3; y: 9.3; skew-y: -8.3; scale-y: 0.809; }
        frame 30 { x: 8.4; y: 7.3; skew-x: 4.1; skew-y: -1.9; scale-y: 0.807; }
        frame 31 { x: 13.8; y: 5.6; skew-x: 8.3; skew-y: 4.3; scale-x: 0.799; scale-y: 0.805; }
        frame 32 { x: 19.5; y: 4.2; skew-x: 12.6; skew-y: 10.8; scale-x: -10000; scale-y: 0.802; }
        frame 33 { x: 25.2; y: 3.1; skew-x: 16.8; skew-y: 17.1; scale-y: 0.8; }
        frame 34 { x: 31; y: 2.3; skew-x: 21.2; skew-y: 23.6; scale-x: 0.8; scale-y: 0.799; }
        frame 35 { x: 26.8; y: 3.4; skew-x: 16.8; skew-y: 18.8; scale-x: 0.799; scale-y: 0.798; }
        frame 36 { x: 22.9; y: 4.6; skew-x: 12.6; skew-y: 14; scale-x: -10000; scale-y: 0.799; }
        frame 37 { x: 19; y: 6.1; skew-x: 8.3; skew-y: 9.3; scale-y: -10000; }
        frame 38 { x: 15.3; y: 7.6; skew-x: 4.1; skew-y: 4.6; scale-x: 0.8; scale-y: 0.8; }
        frame 39 { x: 11.8; y: 9.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Cattail_blink";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { x: 41.1; y: 33.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CATTAIL_BLINK1; }
        frame 2 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_CATTAIL_BLINK2; }
        frame 3 { image: IMAGE_REANIM_CATTAIL_BLINK1; }
        frame 4 { cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 33 { x: 46.6; y: 36.2; skew-x: 13.2; skew-y: 23.5; scale-x: 0.796; scale-y: 0.816; cel: 0; }
        frame 34 { x: 45.8; y: 35.1; skew-x: 19.4; skew-y: 14.6; scale-x: 0.854; scale-y: 0.799; cel: -10000; image: IMAGE_REANIM_CATTAIL_BLINK2; }
        frame 35 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 36 { cel: -10000; }
    }
    Track {
        source-name: "Cattail_eyebrow1";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 38.6; y: 34; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CATTAIL_EYEBROW1; }
        frame 6 { x: -10000; y: 34.4; scale-x: 0.807; scale-y: 0.796; cel: -10000; image: none; }
        frame 7 { y: 34.6; scale-x: 0.814; scale-y: 0.792; }
        frame 8 { x: 38.5; y: 35; scale-x: 0.821; scale-y: 0.788; }
        frame 9 { x: -10000; y: 35.3; scale-x: 0.828; scale-y: 0.784; }
        frame 10 { y: 35.6; scale-x: 0.835; scale-y: 0.779; }
        frame 11 { y: 35.9; scale-x: 0.842; scale-y: 0.775; }
        frame 12 { x: 38.4; y: 36.3; scale-x: 0.849; scale-y: 0.771; }
        frame 13 { x: -10000; y: 36.5; scale-x: 0.857; scale-y: 0.767; }
        frame 14 { x: 38.3; y: 36.9; scale-x: 0.864; scale-y: 0.763; }
        frame 15 { x: -10000; y: 36.6; scale-x: 0.857; scale-y: 0.767; }
        frame 16 { y: 36.3; scale-x: 0.849; scale-y: 0.771; }
        frame 17 { x: 38.4; y: 36; scale-x: 0.842; scale-y: 0.775; }
        frame 18 { x: -10000; y: 35.6; scale-x: 0.835; scale-y: 0.779; }
        frame 19 { x: 38.5; y: 35.4; scale-x: 0.828; scale-y: 0.784; }
        frame 20 { x: -10000; y: 35; scale-x: 0.821; scale-y: 0.788; }
        frame 21 { y: 34.7; scale-x: 0.814; scale-y: 0.792; }
        frame 22 { y: 34.4; scale-x: 0.807; scale-y: 0.796; }
        frame 23 { x: 38.6; y: 34; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 38; y: 33.4; }
        frame 26 { x: 37.3; y: 32.8; }
        frame 27 { x: 36.5; y: 32.2; }
        frame 28 { x: 35.9; y: 31.6; }
        frame 29 { x: 35.1; y: 31; }
        frame 30 { x: 38.3; y: 32.3; skew-x: 11.8; skew-y: 12.1; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 41.5; y: 33.8; skew-x: 23.5; skew-y: 24.3; scale-x: 0.798; scale-y: 0.797; }
        frame 32 { x: 44.9; y: 35.6; skew-x: 35.3; skew-y: 36.6; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 47.9; y: 39.1; skew-x: 47.1; skew-y: 48.9; scale-x: 0.797; scale-y: 0.796; }
        frame 34 { x: 51; y: 43; skew-x: 58.8; skew-y: 61.2; scale-x: 0.798; scale-y: 0.798; }
        frame 35 { x: 48.5; y: 40.7; skew-x: 47.1; skew-y: 48.9; scale-x: 0.797; scale-y: 0.797; }
        frame 36 { x: 45.9; y: 38.6; skew-x: 35.3; skew-y: 36.6; scale-x: 0.798; scale-y: -10000; }
        frame 37 { x: 43.5; y: 36.9; skew-x: 23.5; skew-y: 24.3; scale-x: -10000; scale-y: 0.798; }
        frame 38 { x: 41; y: 35.3; skew-x: 11.8; skew-y: 12.1; scale-x: 0.799; scale-y: 0.799; }
        frame 39 { x: 38.6; y: 34; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cattail_eyebrow2";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 60.9; y: 31.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CATTAIL_EYEBROW2; }
        frame 6 { x: 61; y: 31.7; scale-x: 0.807; scale-y: 0.796; cel: -10000; image: none; }
        frame 7 { x: 61.3; y: 32.1; scale-x: 0.814; scale-y: 0.792; }
        frame 8 { x: 61.4; y: 32.4; scale-x: 0.821; scale-y: 0.788; }
        frame 9 { x: 61.5; y: 32.8; scale-x: 0.828; scale-y: 0.784; }
        frame 10 { x: 61.6; y: 33; scale-x: 0.835; scale-y: 0.779; }
        frame 11 { x: 61.8; y: 33.5; scale-x: 0.842; scale-y: 0.775; }
        frame 12 { x: 62; y: 33.7; scale-x: 0.849; scale-y: 0.771; }
        frame 13 { x: 62.1; y: 34; scale-x: 0.857; scale-y: 0.767; }
        frame 14 { x: 62.3; y: 34.4; scale-x: 0.864; scale-y: 0.763; }
        frame 15 { x: 62.1; y: 34.1; scale-x: 0.857; scale-y: 0.767; }
        frame 16 { x: 62; y: 33.7; scale-x: 0.849; scale-y: 0.771; }
        frame 17 { x: 61.8; y: 33.4; scale-x: 0.842; scale-y: 0.775; }
        frame 18 { x: 61.6; y: 33; scale-x: 0.835; scale-y: 0.779; }
        frame 19 { x: 61.5; y: 32.7; scale-x: 0.828; scale-y: 0.784; }
        frame 20 { x: 61.4; y: 32.4; scale-x: 0.821; scale-y: 0.788; }
        frame 21 { x: 61.3; y: 32; scale-x: 0.814; scale-y: 0.792; }
        frame 22 { x: 61; y: 31.7; scale-x: 0.807; scale-y: 0.796; }
        frame 23 { x: 60.9; y: 31.4; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 60.2; y: 30.8; }
        frame 26 { x: 59.5; y: 30.2; }
        frame 27 { x: 58.8; y: 29.6; }
        frame 28 { x: 58.1; y: 29; }
        frame 29 { x: 57.4; y: 28.4; }
        frame 30 { x: 59; y: 32; skew-x: -5.2; skew-y: -4.7; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 60.5; y: 35.7; skew-x: -10.5; skew-y: -9.5; scale-x: 0.798; scale-y: 0.798; }
        frame 32 { x: 62; y: 39.4; skew-x: -15.9; skew-y: -14.4; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 63.8; y: 44.6; skew-x: -21.2; skew-y: -19.2; scale-x: 0.797; scale-y: 0.797; }
        frame 34 { x: 65.7; y: 49.7; skew-x: -26.6; skew-y: -24.2; scale-x: 0.798; scale-y: 0.798; }
        frame 35 { x: 64.7; y: 46; skew-x: -21.2; skew-y: -19.2; scale-x: -10000; scale-y: 0.797; }
        frame 36 { x: 63.8; y: 42.4; skew-x: -15.9; skew-y: -14.4; scale-y: 0.798; }
        frame 37 { x: 62.9; y: 38.7; skew-x: -10.5; skew-y: -9.5; scale-x: 0.799; scale-y: 0.799; }
        frame 38 { x: 61.9; y: 35; skew-x: -5.2; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 60.9; y: 31.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
}
