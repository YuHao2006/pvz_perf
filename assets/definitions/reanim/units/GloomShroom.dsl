export component GloomShroom {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 71;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 24 { cel: -1; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_sleep";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
        frame 43 { cel: -1; }
        frame 44 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 43 { cel: 0; }
        frame 44 { cel: -10000; }
    }
    Track {
        source-name: "GloomShroom_base";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 12.5; y: 40.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_BASE; }
        frame 6 { x: 12.3; y: 40.5; scale-x: 0.804; scale-y: 0.793; cel: -10000; image: none; }
        frame 7 { x: 12.2; y: 40.9; scale-x: 0.808; scale-y: 0.787; }
        frame 8 { x: 12.1; y: 41.1; scale-x: 0.812; scale-y: 0.78; }
        frame 9 { x: 11.9; y: 41.4; scale-x: 0.816; scale-y: 0.773; }
        frame 10 { x: 11.8; y: 41.6; scale-x: 0.819; scale-y: 0.767; }
        frame 11 { x: 11.7; y: 42; scale-x: 0.823; scale-y: 0.76; }
        frame 12 { x: 11.5; y: 42.3; scale-x: 0.827; scale-y: 0.753; }
        frame 13 { x: -10000; y: 42.5; scale-x: 0.831; scale-y: 0.746; }
        frame 14 { x: 11.2; y: 42.8; scale-x: 0.835; scale-y: 0.74; }
        frame 15 { x: 11.4; y: 42.5; scale-x: 0.831; scale-y: 0.746; }
        frame 16 { x: 11.5; y: 42.2; scale-x: 0.827; scale-y: 0.753; }
        frame 17 { x: 11.6; y: 42; scale-x: 0.823; scale-y: 0.76; }
        frame 18 { x: 11.8; y: 41.6; scale-x: 0.819; scale-y: 0.767; }
        frame 19 { x: 11.9; y: 41.4; scale-x: 0.816; scale-y: 0.773; }
        frame 20 { x: 12; y: 41.1; scale-x: 0.812; scale-y: 0.78; }
        frame 21 { x: 12.1; y: 40.8; scale-x: 0.808; scale-y: 0.787; }
        frame 22 { x: 12.3; y: 40.5; scale-x: 0.804; scale-y: 0.793; }
        frame 23 { x: 12.5; y: 40.3; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 12.3; y: 40.5; scale-x: 0.804; scale-y: 0.793; }
        frame 26 { x: 12.2; y: 40.9; scale-x: 0.808; scale-y: 0.787; }
        frame 27 { x: 12.1; y: 41.1; scale-x: 0.812; scale-y: 0.78; }
        frame 28 { x: 11.9; y: 41.4; scale-x: 0.816; scale-y: 0.773; }
        frame 29 { x: 11.8; y: 41.6; scale-x: 0.819; scale-y: 0.767; }
        frame 30 { x: 11.7; y: 42; scale-x: 0.823; scale-y: 0.76; }
        frame 31 { x: 11.5; y: 42.3; scale-x: 0.827; scale-y: 0.753; }
        frame 32 { x: -10000; y: 42.5; scale-x: 0.831; scale-y: 0.746; }
        frame 33 { x: 11.2; y: 42.8; scale-x: 0.835; scale-y: 0.74; }
        frame 34 { x: 11.4; y: 42.5; scale-x: 0.831; scale-y: 0.746; }
        frame 35 { x: 11.5; y: 42.2; scale-x: 0.827; scale-y: 0.753; }
        frame 36 { x: 11.6; y: 42; scale-x: 0.823; scale-y: 0.76; }
        frame 37 { x: 11.8; y: 41.6; scale-x: 0.819; scale-y: 0.767; }
        frame 38 { x: 11.9; y: 41.4; scale-x: 0.816; scale-y: 0.773; }
        frame 39 { x: 12; y: 41.1; scale-x: 0.812; scale-y: 0.78; }
        frame 40 { x: 12.1; y: 40.8; scale-x: 0.808; scale-y: 0.787; }
        frame 41 { x: 12.3; y: 40.5; scale-x: 0.804; scale-y: 0.793; }
        frame 42 { x: 12.5; y: 40.3; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "GloomShroom_shooter4";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 7.6; y: 3.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_SHOOTER4; }
        frame 6 { x: 8.1; y: 2; scale-x: 0.789; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 8.5; y: 0.7; scale-x: 0.777; scale-y: 0.825; }
        frame 8 { x: 9; y: -0.4; scale-x: 0.766; scale-y: 0.838; }
        frame 9 { x: 8.8; y: 0.9; scale-x: 0.772; scale-y: 0.831; }
        frame 10 { x: 8.5; y: 2.4; scale-x: 0.777; scale-y: 0.825; }
        frame 11 { x: 8.3; y: 3.9; scale-x: 0.783; scale-y: 0.819; }
        frame 12 { x: 8.1; y: 5.4; scale-x: 0.789; scale-y: 0.813; }
        frame 13 { x: 7.8; y: 6.8; scale-x: 0.794; scale-y: 0.806; }
        frame 14 { x: 7.6; y: 8.3; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 7.3; y: -10000; scale-x: 0.806; scale-y: 0.796; }
        frame 16 { x: 7.1; y: 8.4; scale-x: 0.813; scale-y: 0.792; }
        frame 17 { x: 6.8; y: -10000; scale-x: 0.819; scale-y: 0.788; }
        frame 18 { x: 7; y: 7.6; scale-x: 0.816; scale-y: 0.79; }
        frame 19 { x: 7.1; y: 6.7; scale-x: 0.813; scale-y: 0.792; }
        frame 20 { x: 7.2; y: 5.8; scale-x: 0.81; scale-y: 0.794; }
        frame 21 { x: 7.3; y: 5; scale-x: 0.806; scale-y: 0.796; }
        frame 22 { x: 7.4; y: 4.2; scale-x: 0.803; scale-y: 0.798; }
        frame 23 { x: 7.6; y: 3.3; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 8.1; y: 2; scale-x: 0.789; scale-y: 0.813; }
        frame 26 { x: 8.5; y: 0.7; scale-x: 0.777; scale-y: 0.825; }
        frame 27 { x: 9; y: -0.4; scale-x: 0.766; scale-y: 0.838; }
        frame 28 { x: 8.8; y: 0.9; scale-x: 0.772; scale-y: 0.831; }
        frame 29 { x: 8.5; y: 2.4; scale-x: 0.777; scale-y: 0.825; }
        frame 30 { x: 8.3; y: 3.9; scale-x: 0.783; scale-y: 0.819; }
        frame 31 { x: 8.1; y: 5.4; scale-x: 0.789; scale-y: 0.813; }
        frame 32 { x: 7.8; y: 6.8; scale-x: 0.794; scale-y: 0.806; }
        frame 33 { x: 7.6; y: 8.3; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: 7.3; y: -10000; scale-x: 0.806; scale-y: 0.796; }
        frame 35 { x: 7.1; y: 8.4; scale-x: 0.813; scale-y: 0.792; }
        frame 36 { x: 6.8; y: -10000; scale-x: 0.819; scale-y: 0.788; }
        frame 37 { x: 7; y: 7.6; scale-x: 0.816; scale-y: 0.79; }
        frame 38 { x: 7.1; y: 6.7; scale-x: 0.813; scale-y: 0.792; }
        frame 39 { x: 7.2; y: 5.8; scale-x: 0.81; scale-y: 0.794; }
        frame 40 { x: 7.3; y: 5; scale-x: 0.806; scale-y: 0.796; }
        frame 41 { x: 7.4; y: 4.2; scale-x: 0.803; scale-y: 0.798; }
        frame 42 { x: 7.6; y: 3.3; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 7.8; y: 3.5; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 8.1; y: 3.8; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 8.3; y: 4.1; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 8.5; y: 4.3; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 8.7; y: 4.6; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 9; y: 4.8; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 6.3; y: 3.1; scale-x: 0.824; scale-y: 0.817; }
        frame 51 { x: 3.9; y: 1.4; scale-x: 0.881; scale-y: 0.874; }
        frame 52 { x: 1.4; y: -0.1; scale-x: 0.939; scale-y: 0.931; }
        frame 53 { x: 2.7; y: 0.6; scale-x: 0.91; scale-y: 0.903; }
        frame 54 { x: 3.9; y: 1.4; scale-x: 0.881; scale-y: 0.874; }
        frame 55 { x: 2.6; y: 0.6; scale-x: 0.91; scale-y: 0.903; }
        frame 56 { x: 1.4; y: -0.1; scale-x: 0.939; scale-y: 0.931; }
        frame 57 { x: 2.7; y: 0.6; scale-x: 0.91; scale-y: 0.903; }
        frame 58 { x: 3.9; y: 1.4; scale-x: 0.881; scale-y: 0.874; }
        frame 59 { x: 2.6; y: 0.6; scale-x: 0.91; scale-y: 0.903; }
        frame 60 { x: 1.4; y: -0.1; scale-x: 0.939; scale-y: 0.931; }
        frame 61 { x: 2.7; y: 0.6; scale-x: 0.91; scale-y: 0.903; }
        frame 62 { x: 3.9; y: 1.4; scale-x: 0.881; scale-y: 0.874; }
        frame 63 { x: 2.6; y: 0.6; scale-x: 0.91; scale-y: 0.903; }
        frame 64 { x: 1.4; y: -0.1; scale-x: 0.939; scale-y: 0.931; }
        frame 65 { x: 2.7; y: 0.6; scale-x: 0.91; scale-y: 0.903; }
        frame 66 { x: 3.9; y: 1.4; scale-x: 0.881; scale-y: 0.874; }
        frame 67 { x: 4.8; y: 1.9; scale-x: 0.861; scale-y: 0.856; }
        frame 68 { x: 5.8; y: 2.4; scale-x: 0.841; scale-y: 0.837; }
        frame 69 { x: 6.7; y: 2.8; scale-x: 0.82; scale-y: 0.819; }
        frame 70 { x: 7.6; y: 3.3; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_shooter42";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 75.3; y: 3.5; skew-x: 180; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_SHOOTER4; }
        frame 6 { x: 74.8; y: 2.3; skew-x: -10000; scale-x: 0.789; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 74.3; y: 1; scale-x: 0.777; scale-y: 0.825; }
        frame 8 { x: 73.8; y: -0.2; scale-x: 0.766; scale-y: 0.838; }
        frame 9 { x: 74.1; y: 1.2; scale-x: 0.772; scale-y: 0.831; }
        frame 10 { x: 74.3; y: 2.6; scale-x: 0.777; scale-y: 0.825; }
        frame 11 { x: 74.6; y: 4.1; scale-x: 0.783; scale-y: 0.819; }
        frame 12 { x: 74.8; y: 5.7; scale-x: 0.789; scale-y: 0.813; }
        frame 13 { x: 75.1; y: 7.1; scale-x: 0.794; scale-y: 0.806; }
        frame 14 { x: 75.3; y: 8.6; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 75.6; y: -10000; scale-x: 0.806; scale-y: 0.796; }
        frame 16 { x: 75.9; scale-x: 0.813; scale-y: 0.792; }
        frame 17 { x: 76.2; scale-x: 0.819; scale-y: 0.788; }
        frame 18 { x: 76.1; y: 7.8; scale-x: 0.816; scale-y: 0.79; }
        frame 19 { x: 75.8; y: 6.9; scale-x: 0.813; scale-y: 0.792; }
        frame 20 { x: 75.7; y: 6.1; scale-x: 0.81; scale-y: 0.794; }
        frame 21 { x: 75.6; y: 5.3; scale-x: 0.806; scale-y: 0.796; }
        frame 22 { x: 75.4; y: 4.4; scale-x: 0.803; scale-y: 0.798; }
        frame 23 { x: 75.3; y: 3.5; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 74.8; y: 2.3; scale-x: 0.789; scale-y: 0.813; }
        frame 26 { x: 74.3; y: 1; scale-x: 0.777; scale-y: 0.825; }
        frame 27 { x: 73.8; y: -0.2; scale-x: 0.766; scale-y: 0.838; }
        frame 28 { x: 74.1; y: 1.2; scale-x: 0.772; scale-y: 0.831; }
        frame 29 { x: 74.3; y: 2.6; scale-x: 0.777; scale-y: 0.825; }
        frame 30 { x: 74.6; y: 4.1; scale-x: 0.783; scale-y: 0.819; }
        frame 31 { x: 74.8; y: 5.7; scale-x: 0.789; scale-y: 0.813; }
        frame 32 { x: 75.1; y: 7.1; scale-x: 0.794; scale-y: 0.806; }
        frame 33 { x: 75.3; y: 8.6; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: 75.6; y: -10000; scale-x: 0.806; scale-y: 0.796; }
        frame 35 { x: 75.9; scale-x: 0.813; scale-y: 0.792; }
        frame 36 { x: 76.2; scale-x: 0.819; scale-y: 0.788; }
        frame 37 { x: 76.1; y: 7.8; scale-x: 0.816; scale-y: 0.79; }
        frame 38 { x: 75.8; y: 6.9; scale-x: 0.813; scale-y: 0.792; }
        frame 39 { x: 75.7; y: 6.1; scale-x: 0.81; scale-y: 0.794; }
        frame 40 { x: 75.6; y: 5.3; scale-x: 0.806; scale-y: 0.796; }
        frame 41 { x: 75.4; y: 4.4; scale-x: 0.803; scale-y: 0.798; }
        frame 42 { x: 75.3; y: 3.5; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 75; y: 3.8; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 74.8; y: 4.1; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 74.6; y: 4.3; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 74.3; y: 4.6; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 74; y: 4.8; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 73.8; y: 5.1; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 76.1; y: 3.4; scale-x: 0.824; scale-y: 0.817; }
        frame 51 { x: 78.5; y: 1.7; scale-x: 0.881; scale-y: 0.874; }
        frame 52 { x: 80.9; y: 0; scale-x: 0.939; scale-y: 0.931; }
        frame 53 { x: 79.7; y: 0.9; scale-x: 0.91; scale-y: 0.903; }
        frame 54 { x: 78.5; y: 1.7; scale-x: 0.881; scale-y: 0.874; }
        frame 55 { x: 79.7; y: 0.9; scale-x: 0.91; scale-y: 0.903; }
        frame 56 { x: 80.9; y: 0; scale-x: 0.939; scale-y: 0.931; }
        frame 57 { x: 79.7; y: 0.9; scale-x: 0.91; scale-y: 0.903; }
        frame 58 { x: 78.5; y: 1.7; scale-x: 0.881; scale-y: 0.874; }
        frame 59 { x: 79.7; y: 0.9; scale-x: 0.91; scale-y: 0.903; }
        frame 60 { x: 80.9; y: 0; scale-x: 0.939; scale-y: 0.931; }
        frame 61 { x: 79.7; y: 0.9; scale-x: 0.91; scale-y: 0.903; }
        frame 62 { x: 78.5; y: 1.7; scale-x: 0.881; scale-y: 0.874; }
        frame 63 { x: 79.7; y: 0.9; scale-x: 0.91; scale-y: 0.903; }
        frame 64 { x: 80.9; y: 0; scale-x: 0.939; scale-y: 0.931; }
        frame 65 { x: 79.7; y: 0.9; scale-x: 0.91; scale-y: 0.903; }
        frame 66 { x: 78.5; y: 1.7; scale-x: 0.881; scale-y: 0.874; }
        frame 67 { x: 77.7; y: 2.1; scale-x: 0.861; scale-y: 0.856; }
        frame 68 { x: 76.9; y: 2.6; scale-x: 0.841; scale-y: 0.837; }
        frame 69 { x: 76.1; y: 3; scale-x: 0.82; scale-y: 0.819; }
        frame 70 { x: 75.3; y: 3.5; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_shooter5";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 28.3; y: -1.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_SHOOTER5; }
        frame 6 { x: 28.4; y: -2.7; scale-x: 0.792; scale-y: 0.81; cel: -10000; image: none; }
        frame 7 { x: 28.5; y: -4.1; scale-x: 0.785; scale-y: 0.819; }
        frame 8 { x: 28.7; y: -5.4; scale-x: 0.777; scale-y: 0.829; }
        frame 9 { x: 28.5; y: -3.8; scale-x: 0.787; scale-y: 0.82; }
        frame 10 { x: 28.4; y: -2.3; scale-x: 0.796; scale-y: 0.81; }
        frame 11 { x: 28.3; y: -0.6; scale-x: 0.806; scale-y: 0.801; }
        frame 12 { x: 28.1; y: 0.8; scale-x: 0.815; scale-y: 0.792; }
        frame 13 { x: 28; y: 2.3; scale-x: 0.824; scale-y: 0.783; }
        frame 14 { x: 27.8; y: 3.9; scale-x: 0.834; scale-y: 0.774; }
        frame 15 { x: -10000; y: -10000; scale-x: 0.837; scale-y: 0.773; }
        frame 16 { scale-x: 0.84; scale-y: 0.772; }
        frame 17 { x: 27.7; y: 3.8; scale-x: 0.842; scale-y: 0.771; }
        frame 18 { x: 27.8; y: 2.9; scale-x: 0.835; scale-y: 0.776; }
        frame 19 { x: 27.9; y: 2; scale-x: 0.828; scale-y: 0.781; }
        frame 20 { x: 28; y: 1.1; scale-x: 0.821; scale-y: 0.786; }
        frame 21 { x: 28.1; y: 0.2; scale-x: 0.814; scale-y: 0.79; }
        frame 22 { x: 28.2; y: -0.6; scale-x: 0.807; scale-y: 0.795; }
        frame 23 { x: 28.3; y: -1.4; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 28.4; y: -2.7; scale-x: 0.792; scale-y: 0.81; }
        frame 26 { x: 28.5; y: -4.1; scale-x: 0.785; scale-y: 0.819; }
        frame 27 { x: 28.7; y: -5.4; scale-x: 0.777; scale-y: 0.829; }
        frame 28 { x: 28.5; y: -3.8; scale-x: 0.787; scale-y: 0.82; }
        frame 29 { x: 28.4; y: -2.3; scale-x: 0.796; scale-y: 0.81; }
        frame 30 { x: 28.3; y: -0.6; scale-x: 0.806; scale-y: 0.801; }
        frame 31 { x: 28.1; y: 0.8; scale-x: 0.815; scale-y: 0.792; }
        frame 32 { x: 28; y: 2.3; scale-x: 0.824; scale-y: 0.783; }
        frame 33 { x: 27.8; y: 3.9; scale-x: 0.834; scale-y: 0.774; }
        frame 34 { x: -10000; y: -10000; scale-x: 0.837; scale-y: 0.773; }
        frame 35 { scale-x: 0.84; scale-y: 0.772; }
        frame 36 { x: 27.7; y: 3.8; scale-x: 0.842; scale-y: 0.771; }
        frame 37 { x: 27.8; y: 2.9; scale-x: 0.835; scale-y: 0.776; }
        frame 38 { x: 27.9; y: 2; scale-x: 0.828; scale-y: 0.781; }
        frame 39 { x: 28; y: 1.1; scale-x: 0.821; scale-y: 0.786; }
        frame 40 { x: 28.1; y: 0.2; scale-x: 0.814; scale-y: 0.79; }
        frame 41 { x: 28.2; y: -0.6; scale-x: 0.807; scale-y: 0.795; }
        frame 42 { x: 28.3; y: -1.4; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 28.4; y: -1.2; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 28.5; y: -0.8; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 28.6; y: -0.6; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: -10000; y: -0.3; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 28.7; y: -0; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 28.8; y: 0.2; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 28.5; y: -2.9; scale-x: 0.791; scale-y: 0.785; }
        frame 51 { x: 28.1; y: -6.2; scale-x: 0.816; scale-y: 0.81; }
        frame 52 { x: 27.7; y: -9.4; scale-x: 0.841; scale-y: 0.835; }
        frame 53 { x: 27.9; y: -7.8; scale-x: 0.829; scale-y: 0.822; }
        frame 54 { x: 28.1; y: -6.2; scale-x: 0.816; scale-y: 0.81; }
        frame 55 { x: 27.9; y: -7.8; scale-x: 0.829; scale-y: 0.822; }
        frame 56 { x: 27.7; y: -9.4; scale-x: 0.841; scale-y: 0.835; }
        frame 57 { x: 27.9; y: -7.8; scale-x: 0.829; scale-y: 0.822; }
        frame 58 { x: 28.1; y: -6.2; scale-x: 0.816; scale-y: 0.81; }
        frame 59 { x: 27.9; y: -7.8; scale-x: 0.829; scale-y: 0.822; }
        frame 60 { x: 27.7; y: -9.4; scale-x: 0.841; scale-y: 0.835; }
        frame 61 { x: 27.9; y: -7.8; scale-x: 0.829; scale-y: 0.822; }
        frame 62 { x: 28.1; y: -6.2; scale-x: 0.816; scale-y: 0.81; }
        frame 63 { x: 27.9; y: -7.8; scale-x: 0.829; scale-y: 0.822; }
        frame 64 { x: 27.7; y: -9.4; scale-x: 0.841; scale-y: 0.835; }
        frame 65 { x: 27.9; y: -7.8; scale-x: 0.829; scale-y: 0.822; }
        frame 66 { x: 28.1; y: -6.2; scale-x: 0.816; scale-y: 0.81; }
        frame 67 { x: -10000; y: -5; scale-x: 0.812; scale-y: 0.807; }
        frame 68 { x: 28.2; y: -3.8; scale-x: 0.808; scale-y: 0.805; }
        frame 69 { x: 28.3; y: -2.6; scale-x: 0.804; scale-y: 0.802; }
        frame 70 { x: -10000; y: -1.4; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 7.2; y: 5.7; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_HEAD; }
        frame 6 { x: 7.5; y: 4.7; scale-x: 0.792; scale-y: 0.81; cel: -10000; image: none; }
        frame 7 { x: 7.7; y: 3.8; scale-x: 0.785; scale-y: 0.819; }
        frame 8 { x: 8.1; y: 2.9; scale-x: 0.777; scale-y: 0.829; }
        frame 9 { x: 7.7; y: 4; scale-x: 0.787; scale-y: 0.82; }
        frame 10 { x: 7.3; y: 5.2; scale-x: 0.796; scale-y: 0.81; }
        frame 11 { x: 7; y: 6.3; scale-x: 0.806; scale-y: 0.801; }
        frame 12 { x: 6.6; y: 7.4; scale-x: 0.815; scale-y: 0.792; }
        frame 13 { x: 6.2; y: 8.6; scale-x: 0.824; scale-y: 0.783; }
        frame 14 { x: 5.8; y: 9.7; scale-x: 0.834; scale-y: 0.774; }
        frame 15 { x: 5.6; y: 9.6; scale-x: 0.837; scale-y: 0.773; }
        frame 16 { x: 5.5; y: 9.4; scale-x: 0.84; scale-y: 0.772; }
        frame 17 { x: 5.4; y: 9.3; scale-x: 0.842; scale-y: 0.771; }
        frame 18 { x: 5.7; y: 8.6; scale-x: 0.835; scale-y: 0.776; }
        frame 19 { x: 6; y: 8; scale-x: 0.828; scale-y: 0.781; }
        frame 20 { x: 6.3; y: 7.4; scale-x: 0.821; scale-y: 0.786; }
        frame 21 { x: 6.6; y: 6.8; scale-x: 0.814; scale-y: 0.79; }
        frame 22 { x: 6.8; y: 6.3; scale-x: 0.807; scale-y: 0.795; }
        frame 23 { x: 7.2; y: 5.7; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 7.5; y: 4.7; scale-x: 0.792; scale-y: 0.81; }
        frame 26 { x: 7.7; y: 3.8; scale-x: 0.785; scale-y: 0.819; }
        frame 27 { x: 8.1; y: 2.9; scale-x: 0.777; scale-y: 0.829; }
        frame 28 { x: 7.7; y: 4; scale-x: 0.787; scale-y: 0.82; }
        frame 29 { x: 7.3; y: 5.2; scale-x: 0.796; scale-y: 0.81; }
        frame 30 { x: 7; y: 6.3; scale-x: 0.806; scale-y: 0.801; }
        frame 31 { x: 6.6; y: 7.4; scale-x: 0.815; scale-y: 0.792; }
        frame 32 { x: 6.2; y: 8.6; scale-x: 0.824; scale-y: 0.783; }
        frame 33 { x: 5.8; y: 9.7; scale-x: 0.834; scale-y: 0.774; }
        frame 34 { x: 5.6; y: 9.6; scale-x: 0.837; scale-y: 0.773; }
        frame 35 { x: 5.5; y: 9.4; scale-x: 0.84; scale-y: 0.772; }
        frame 36 { x: 5.4; y: 9.3; scale-x: 0.842; scale-y: 0.771; }
        frame 37 { x: 5.7; y: 8.6; scale-x: 0.835; scale-y: 0.776; }
        frame 38 { x: 6; y: 8; scale-x: 0.828; scale-y: 0.781; }
        frame 39 { x: 6.3; y: 7.4; scale-x: 0.821; scale-y: 0.786; }
        frame 40 { x: 6.6; y: 6.8; scale-x: 0.814; scale-y: 0.79; }
        frame 41 { x: 6.8; y: 6.3; scale-x: 0.807; scale-y: 0.795; }
        frame 42 { x: 7.2; y: 5.7; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 7.4; y: 5.9; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 7.6; y: 6.1; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 7.8; y: 6.3; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 8.1; y: 6.6; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 8.3; y: 6.8; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 8.6; y: 7; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 7.5; y: 6.2; scale-x: 0.791; scale-y: 0.785; }
        frame 51 { x: 6.4; y: 5.3; scale-x: 0.816; scale-y: 0.81; }
        frame 52 { x: 5.4; y: 4.5; scale-x: 0.841; scale-y: 0.835; }
        frame 53 { x: 5.9; y: 4.9; scale-x: 0.829; scale-y: 0.822; }
        frame 54 { x: 6.4; y: 5.3; scale-x: 0.816; scale-y: 0.81; }
        frame 55 { x: 5.9; y: 4.8; scale-x: 0.829; scale-y: 0.822; }
        frame 56 { x: 5.4; y: 4.5; scale-x: 0.841; scale-y: 0.835; }
        frame 57 { x: 5.9; y: 4.9; scale-x: 0.829; scale-y: 0.822; }
        frame 58 { x: 6.4; y: 5.3; scale-x: 0.816; scale-y: 0.81; }
        frame 59 { x: 5.9; y: 4.8; scale-x: 0.829; scale-y: 0.822; }
        frame 60 { x: 5.4; y: 4.5; scale-x: 0.841; scale-y: 0.835; }
        frame 61 { x: 5.9; y: 4.9; scale-x: 0.829; scale-y: 0.822; }
        frame 62 { x: 6.4; y: 5.3; scale-x: 0.816; scale-y: 0.81; }
        frame 63 { x: 5.9; y: 4.8; scale-x: 0.829; scale-y: 0.822; }
        frame 64 { x: 5.4; y: 4.5; scale-x: 0.841; scale-y: 0.835; }
        frame 65 { x: 5.9; y: 4.9; scale-x: 0.829; scale-y: 0.822; }
        frame 66 { x: 6.4; y: 5.3; scale-x: 0.816; scale-y: 0.81; }
        frame 67 { x: 6.6; y: 5.4; scale-x: 0.812; scale-y: 0.807; }
        frame 68 { x: 6.8; y: 5.5; scale-x: 0.808; scale-y: 0.805; }
        frame 69 { x: 7; y: -10000; scale-x: 0.804; scale-y: 0.802; }
        frame 70 { x: 7.2; y: 5.7; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_stem1";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 31.4; y: 49.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_STEM1; }
        frame 6 { x: 31.5; y: 48.9; scale-x: 0.792; scale-y: 0.81; cel: -10000; image: none; }
        frame 7 { x: 31.6; y: 48.5; scale-x: 0.785; scale-y: 0.819; }
        frame 8 { x: 31.8; y: 48.1; scale-x: 0.777; scale-y: 0.829; }
        frame 9 { x: 31.7; y: 48.7; scale-x: 0.787; scale-y: 0.82; }
        frame 10 { x: 31.6; y: 49.4; scale-x: 0.796; scale-y: 0.81; }
        frame 11 { x: 31.4; y: 50; scale-x: 0.806; scale-y: 0.801; }
        frame 12 { x: 31.3; y: 50.6; scale-x: 0.815; scale-y: 0.792; }
        frame 13 { x: 31.2; y: 51.3; scale-x: 0.824; scale-y: 0.783; }
        frame 14 { x: 31.1; y: 52; scale-x: 0.834; scale-y: 0.774; }
        frame 15 { x: 31; y: 51.8; scale-x: 0.837; scale-y: 0.773; }
        frame 16 { y: 51.5; scale-x: 0.84; scale-y: 0.772; }
        frame 17 { y: 51.4; scale-x: 0.842; scale-y: 0.771; }
        frame 18 { x: 31.1; y: 51; scale-x: 0.835; scale-y: 0.776; }
        frame 19 { x: 31.2; y: 50.8; scale-x: 0.828; scale-y: 0.781; }
        frame 20 { x: -10000; y: 50.4; scale-x: 0.821; scale-y: 0.786; }
        frame 21 { x: 31.3; y: 50; scale-x: 0.814; scale-y: 0.79; }
        frame 22 { x: 31.4; y: 49.8; scale-x: 0.807; scale-y: 0.795; }
        frame 23 { x: -10000; y: 49.4; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 31.5; y: 48.9; scale-x: 0.792; scale-y: 0.81; }
        frame 26 { x: 31.6; y: 48.5; scale-x: 0.785; scale-y: 0.819; }
        frame 27 { x: 31.8; y: 48.1; scale-x: 0.777; scale-y: 0.829; }
        frame 28 { x: 31.7; y: 48.7; scale-x: 0.787; scale-y: 0.82; }
        frame 29 { x: 31.6; y: 49.4; scale-x: 0.796; scale-y: 0.81; }
        frame 30 { x: 31.4; y: 50; scale-x: 0.806; scale-y: 0.801; }
        frame 31 { x: 31.3; y: 50.6; scale-x: 0.815; scale-y: 0.792; }
        frame 32 { x: 31.2; y: 51.3; scale-x: 0.824; scale-y: 0.783; }
        frame 33 { x: 31.1; y: 52; scale-x: 0.834; scale-y: 0.774; }
        frame 34 { x: 31; y: 51.8; scale-x: 0.837; scale-y: 0.773; }
        frame 35 { y: 51.5; scale-x: 0.84; scale-y: 0.772; }
        frame 36 { y: 51.4; scale-x: 0.842; scale-y: 0.771; }
        frame 37 { x: 31.1; y: 51; scale-x: 0.835; scale-y: 0.776; }
        frame 38 { x: 31.2; y: 50.8; scale-x: 0.828; scale-y: 0.781; }
        frame 39 { x: -10000; y: 50.4; scale-x: 0.821; scale-y: 0.786; }
        frame 40 { x: 31.3; y: 50; scale-x: 0.814; scale-y: 0.79; }
        frame 41 { x: 31.4; y: 49.8; scale-x: 0.807; scale-y: 0.795; }
        frame 42 { x: -10000; y: 49.4; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 31.5; y: 49.2; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 31.6; y: 49; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: -10000; y: 48.9; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 31.7; y: 48.8; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 31.8; y: 48.6; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: -10000; y: 48.5; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 31.5; y: 49; scale-x: 0.791; scale-y: 0.785; }
        frame 51 { x: 31.2; y: 49.5; scale-x: 0.816; scale-y: 0.81; }
        frame 52 { x: 30.9; y: 50; scale-x: 0.841; scale-y: 0.835; }
        frame 53 { x: 31.1; y: 49.8; scale-x: 0.829; scale-y: 0.822; }
        frame 54 { x: 31.2; y: 49.5; scale-x: 0.816; scale-y: 0.81; }
        frame 55 { x: 31.1; y: 49.8; scale-x: 0.829; scale-y: 0.822; }
        frame 56 { x: 30.9; y: 50; scale-x: 0.841; scale-y: 0.835; }
        frame 57 { x: 31.1; y: 49.8; scale-x: 0.829; scale-y: 0.822; }
        frame 58 { x: 31.2; y: 49.5; scale-x: 0.816; scale-y: 0.81; }
        frame 59 { x: 31.1; y: 49.8; scale-x: 0.829; scale-y: 0.822; }
        frame 60 { x: 30.9; y: 50; scale-x: 0.841; scale-y: 0.835; }
        frame 61 { x: 31.1; y: 49.8; scale-x: 0.829; scale-y: 0.822; }
        frame 62 { x: 31.2; y: 49.5; scale-x: 0.816; scale-y: 0.81; }
        frame 63 { x: 31.1; y: 49.8; scale-x: 0.829; scale-y: 0.822; }
        frame 64 { x: 30.9; y: 50; scale-x: 0.841; scale-y: 0.835; }
        frame 65 { x: 31.1; y: 49.8; scale-x: 0.829; scale-y: 0.822; }
        frame 66 { x: 31.2; y: 49.5; scale-x: 0.816; scale-y: 0.81; }
        frame 67 { x: 31.3; y: -10000; scale-x: 0.812; scale-y: 0.807; }
        frame 68 { x: -10000; scale-x: 0.808; scale-y: 0.805; }
        frame 69 { x: 31.4; y: 49.4; scale-x: 0.804; scale-y: 0.802; }
        frame 70 { x: -10000; y: -10000; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_shooter1";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 29.3; y: 51.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_SHOOTER1; }
        frame 6 { x: 29.4; y: 50.5; scale-x: 0.792; scale-y: 0.81; cel: -10000; image: none; }
        frame 7 { x: 29.6; y: 50; scale-x: 0.785; scale-y: 0.819; }
        frame 8 { x: -10000; y: 49.4; scale-x: 0.777; scale-y: 0.829; }
        frame 9 { x: 29.5; y: 50.4; scale-x: 0.787; scale-y: 0.82; }
        frame 10 { x: 29.3; y: 51.4; scale-x: 0.796; scale-y: 0.81; }
        frame 11 { x: 29.2; y: 52.3; scale-x: 0.806; scale-y: 0.801; }
        frame 12 { x: 29.1; y: 53.3; scale-x: 0.815; scale-y: 0.792; }
        frame 13 { x: 28.9; y: 54.3; scale-x: 0.824; scale-y: 0.783; }
        frame 14 { x: 28.8; y: 55.2; scale-x: 0.834; scale-y: 0.774; }
        frame 15 { x: -10000; y: 55.1; scale-x: 0.837; scale-y: 0.773; }
        frame 16 { y: 55; scale-x: 0.84; scale-y: 0.772; }
        frame 17 { x: 28.7; y: 54.9; scale-x: 0.842; scale-y: 0.771; }
        frame 18 { x: 28.8; y: 54.3; scale-x: 0.835; scale-y: 0.776; }
        frame 19 { x: 28.9; y: 53.6; scale-x: 0.828; scale-y: 0.781; }
        frame 20 { x: 29; y: 53; scale-x: 0.821; scale-y: 0.786; }
        frame 21 { x: 29.1; y: 52.4; scale-x: 0.814; scale-y: 0.79; }
        frame 22 { x: 29.2; y: 51.8; scale-x: 0.807; scale-y: 0.795; }
        frame 23 { x: 29.3; y: 51.1; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 29.4; y: 50.5; scale-x: 0.792; scale-y: 0.81; }
        frame 26 { x: 29.6; y: 50; scale-x: 0.785; scale-y: 0.819; }
        frame 27 { x: -10000; y: 49.4; scale-x: 0.777; scale-y: 0.829; }
        frame 28 { x: 29.5; y: 50.4; scale-x: 0.787; scale-y: 0.82; }
        frame 29 { x: 29.3; y: 51.4; scale-x: 0.796; scale-y: 0.81; }
        frame 30 { x: 29.2; y: 52.3; scale-x: 0.806; scale-y: 0.801; }
        frame 31 { x: 29.1; y: 53.3; scale-x: 0.815; scale-y: 0.792; }
        frame 32 { x: 28.9; y: 54.3; scale-x: 0.824; scale-y: 0.783; }
        frame 33 { x: 28.8; y: 55.2; scale-x: 0.834; scale-y: 0.774; }
        frame 34 { x: -10000; y: 55.1; scale-x: 0.837; scale-y: 0.773; }
        frame 35 { y: 55; scale-x: 0.84; scale-y: 0.772; }
        frame 36 { x: 28.7; y: 54.9; scale-x: 0.842; scale-y: 0.771; }
        frame 37 { x: 28.8; y: 54.3; scale-x: 0.835; scale-y: 0.776; }
        frame 38 { x: 28.9; y: 53.6; scale-x: 0.828; scale-y: 0.781; }
        frame 39 { x: 29; y: 53; scale-x: 0.821; scale-y: 0.786; }
        frame 40 { x: 29.1; y: 52.4; scale-x: 0.814; scale-y: 0.79; }
        frame 41 { x: 29.2; y: 51.8; scale-x: 0.807; scale-y: 0.795; }
        frame 42 { x: 29.3; y: 51.1; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 29.4; y: 51; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 29.5; y: 50.9; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 29.6; y: 50.7; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 29.5; y: 50.5; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 29.6; y: 50.4; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 29.7; y: 50.2; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 28.8; y: 52; scale-x: 0.828; scale-y: 0.821; }
        frame 51 { x: 27.9; y: 53.8; scale-x: 0.89; scale-y: 0.883; }
        frame 52 { x: 27; y: 55.5; scale-x: 0.952; scale-y: 0.944; }
        frame 53 { x: 27.5; y: 54.6; scale-x: 0.921; scale-y: 0.913; }
        frame 54 { x: 27.9; y: 53.8; scale-x: 0.89; scale-y: 0.883; }
        frame 55 { x: 27.4; y: 54.6; scale-x: 0.921; scale-y: 0.913; }
        frame 56 { x: 27; y: 55.5; scale-x: 0.952; scale-y: 0.944; }
        frame 57 { x: 27.5; y: 54.6; scale-x: 0.921; scale-y: 0.913; }
        frame 58 { x: 27.9; y: 53.8; scale-x: 0.89; scale-y: 0.883; }
        frame 59 { x: 27.4; y: 54.6; scale-x: 0.921; scale-y: 0.913; }
        frame 60 { x: 27; y: 55.5; scale-x: 0.952; scale-y: 0.944; }
        frame 61 { x: 27.5; y: 54.6; scale-x: 0.921; scale-y: 0.913; }
        frame 62 { x: 27.9; y: 53.8; scale-x: 0.89; scale-y: 0.883; }
        frame 63 { x: 27.4; y: 54.6; scale-x: 0.921; scale-y: 0.913; }
        frame 64 { x: 27; y: 55.5; scale-x: 0.952; scale-y: 0.944; }
        frame 65 { x: 27.5; y: 54.6; scale-x: 0.921; scale-y: 0.913; }
        frame 66 { x: 27.9; y: 53.8; scale-x: 0.89; scale-y: 0.883; }
        frame 67 { x: 28.2; y: 53.2; scale-x: 0.868; scale-y: 0.862; }
        frame 68 { x: 28.6; y: 52.5; scale-x: 0.845; scale-y: 0.841; }
        frame 69 { x: 29; y: 51.9; scale-x: 0.823; scale-y: 0.821; }
        frame 70 { x: 29.3; y: 51.1; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_stem2";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 9.3; y: 40.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_STEM2; }
        frame 6 { x: 9.7; y: 39.8; scale-x: 0.789; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 10.2; y: 39.2; scale-x: 0.777; scale-y: 0.825; }
        frame 8 { x: 10.6; y: 38.6; scale-x: 0.766; scale-y: 0.838; }
        frame 9 { x: 10.4; y: 39.5; scale-x: 0.772; scale-y: 0.831; }
        frame 10 { x: 10.2; y: 40.1; scale-x: 0.777; scale-y: 0.825; }
        frame 11 { x: 9.9; y: 40.9; scale-x: 0.783; scale-y: 0.819; }
        frame 12 { x: 9.7; y: 41.5; scale-x: 0.789; scale-y: 0.813; }
        frame 13 { x: 9.5; y: 42.3; scale-x: 0.794; scale-y: 0.806; }
        frame 14 { x: 9.3; y: 43; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 9; y: 42.8; scale-x: 0.806; scale-y: 0.796; }
        frame 16 { x: 8.8; y: 42.7; scale-x: 0.813; scale-y: 0.792; }
        frame 17 { x: 8.5; y: 42.5; scale-x: 0.819; scale-y: 0.788; }
        frame 18 { x: 8.6; y: 42.2; scale-x: 0.816; scale-y: 0.79; }
        frame 19 { x: 8.8; y: 41.8; scale-x: 0.813; scale-y: 0.792; }
        frame 20 { x: -10000; y: 41.5; scale-x: 0.81; scale-y: 0.794; }
        frame 21 { x: 9; y: 41.1; scale-x: 0.806; scale-y: 0.796; }
        frame 22 { x: 9.1; y: 40.8; scale-x: 0.803; scale-y: 0.798; }
        frame 23 { x: 9.3; y: 40.4; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 9.7; y: 39.8; scale-x: 0.789; scale-y: 0.813; }
        frame 26 { x: 10.2; y: 39.2; scale-x: 0.777; scale-y: 0.825; }
        frame 27 { x: 10.6; y: 38.6; scale-x: 0.766; scale-y: 0.838; }
        frame 28 { x: 10.4; y: 39.5; scale-x: 0.772; scale-y: 0.831; }
        frame 29 { x: 10.2; y: 40.1; scale-x: 0.777; scale-y: 0.825; }
        frame 30 { x: 9.9; y: 40.9; scale-x: 0.783; scale-y: 0.819; }
        frame 31 { x: 9.7; y: 41.5; scale-x: 0.789; scale-y: 0.813; }
        frame 32 { x: 9.5; y: 42.3; scale-x: 0.794; scale-y: 0.806; }
        frame 33 { x: 9.3; y: 43; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: 9; y: 42.8; scale-x: 0.806; scale-y: 0.796; }
        frame 35 { x: 8.8; y: 42.7; scale-x: 0.813; scale-y: 0.792; }
        frame 36 { x: 8.5; y: 42.5; scale-x: 0.819; scale-y: 0.788; }
        frame 37 { x: 8.6; y: 42.2; scale-x: 0.816; scale-y: 0.79; }
        frame 38 { x: 8.8; y: 41.8; scale-x: 0.813; scale-y: 0.792; }
        frame 39 { x: -10000; y: 41.5; scale-x: 0.81; scale-y: 0.794; }
        frame 40 { x: 9; y: 41.1; scale-x: 0.806; scale-y: 0.796; }
        frame 41 { x: 9.1; y: 40.8; scale-x: 0.803; scale-y: 0.798; }
        frame 42 { x: 9.3; y: 40.4; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 9.5; y: 40.3; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 9.7; y: 40.2; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 9.9; y: -10000; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 10.2; y: 40.1; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 10.4; y: 40; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 10.6; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 9.6; y: 40.3; scale-x: 0.791; scale-y: 0.785; }
        frame 51 { x: 8.6; y: 40.5; scale-x: 0.816; scale-y: 0.81; }
        frame 52 { x: 7.7; y: 40.6; scale-x: 0.841; scale-y: 0.835; }
        frame 53 { x: 8.1; y: 40.5; scale-x: 0.829; scale-y: 0.822; }
        frame 54 { x: 8.6; y: -10000; scale-x: 0.816; scale-y: 0.81; }
        frame 55 { x: 8.1; scale-x: 0.829; scale-y: 0.822; }
        frame 56 { x: 7.7; y: 40.6; scale-x: 0.841; scale-y: 0.835; }
        frame 57 { x: 8.1; y: 40.5; scale-x: 0.829; scale-y: 0.822; }
        frame 58 { x: 8.6; y: -10000; scale-x: 0.816; scale-y: 0.81; }
        frame 59 { x: 8.1; scale-x: 0.829; scale-y: 0.822; }
        frame 60 { x: 7.7; y: 40.6; scale-x: 0.841; scale-y: 0.835; }
        frame 61 { x: 8.1; y: 40.5; scale-x: 0.829; scale-y: 0.822; }
        frame 62 { x: 8.6; y: -10000; scale-x: 0.816; scale-y: 0.81; }
        frame 63 { x: 8.1; scale-x: 0.829; scale-y: 0.822; }
        frame 64 { x: 7.7; y: 40.6; scale-x: 0.841; scale-y: 0.835; }
        frame 65 { x: 8.1; y: 40.5; scale-x: 0.829; scale-y: 0.822; }
        frame 66 { x: 8.6; y: -10000; scale-x: 0.816; scale-y: 0.81; }
        frame 67 { x: 8.8; y: 40.4; scale-x: 0.812; scale-y: 0.807; }
        frame 68 { x: 9; y: -10000; scale-x: 0.808; scale-y: 0.805; }
        frame 69 { x: 9.1; scale-x: 0.804; scale-y: 0.802; }
        frame 70 { x: 9.3; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_stem22";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 72; y: 41.6; skew-x: 180; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_STEM2; }
        frame 6 { x: 71.6; y: 41; skew-x: -10000; scale-x: 0.789; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 71.1; y: 40.5; scale-x: 0.777; scale-y: 0.825; }
        frame 8 { x: 70.7; y: 40; scale-x: 0.766; scale-y: 0.838; }
        frame 9 { x: 70.9; y: 40.8; scale-x: 0.772; scale-y: 0.831; }
        frame 10 { x: 71.1; y: 41.4; scale-x: 0.777; scale-y: 0.825; }
        frame 11 { x: 71.3; y: 42.1; scale-x: 0.783; scale-y: 0.819; }
        frame 12 { x: 71.6; y: 42.8; scale-x: 0.789; scale-y: 0.813; }
        frame 13 { x: 71.8; y: 43.5; scale-x: 0.794; scale-y: 0.806; }
        frame 14 { x: 72; y: 44.2; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 72.3; y: 44; scale-x: 0.806; scale-y: 0.796; }
        frame 16 { x: 72.5; scale-x: 0.813; scale-y: 0.792; }
        frame 17 { x: 72.8; y: 43.8; scale-x: 0.819; scale-y: 0.788; }
        frame 18 { x: 72.7; y: 43.5; scale-x: 0.816; scale-y: 0.79; }
        frame 19 { x: 72.5; y: 43; scale-x: 0.813; scale-y: 0.792; }
        frame 20 { x: 72.3; y: 42.8; scale-x: 0.81; scale-y: 0.794; }
        frame 21 { x: -10000; y: 42.4; scale-x: 0.806; scale-y: 0.796; }
        frame 22 { x: 72.2; y: 42; scale-x: 0.803; scale-y: 0.798; }
        frame 23 { x: 72; y: 41.6; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 71.6; y: 41; scale-x: 0.789; scale-y: 0.813; }
        frame 26 { x: 71.1; y: 40.5; scale-x: 0.777; scale-y: 0.825; }
        frame 27 { x: 70.7; y: 40; scale-x: 0.766; scale-y: 0.838; }
        frame 28 { x: 70.9; y: 40.8; scale-x: 0.772; scale-y: 0.831; }
        frame 29 { x: 71.1; y: 41.4; scale-x: 0.777; scale-y: 0.825; }
        frame 30 { x: 71.3; y: 42.1; scale-x: 0.783; scale-y: 0.819; }
        frame 31 { x: 71.6; y: 42.8; scale-x: 0.789; scale-y: 0.813; }
        frame 32 { x: 71.8; y: 43.5; scale-x: 0.794; scale-y: 0.806; }
        frame 33 { x: 72; y: 44.2; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: 72.3; y: 44; scale-x: 0.806; scale-y: 0.796; }
        frame 35 { x: 72.5; scale-x: 0.813; scale-y: 0.792; }
        frame 36 { x: 72.8; y: 43.8; scale-x: 0.819; scale-y: 0.788; }
        frame 37 { x: 72.7; y: 43.5; scale-x: 0.816; scale-y: 0.79; }
        frame 38 { x: 72.5; y: 43; scale-x: 0.813; scale-y: 0.792; }
        frame 39 { x: 72.3; y: 42.8; scale-x: 0.81; scale-y: 0.794; }
        frame 40 { x: -10000; y: 42.4; scale-x: 0.806; scale-y: 0.796; }
        frame 41 { x: 72.2; y: 42; scale-x: 0.803; scale-y: 0.798; }
        frame 42 { x: 72; y: 41.6; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 71.8; y: 41.5; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 71.6; y: -10000; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 71.3; y: 41.4; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 71.1; y: 41.3; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 70.9; y: -10000; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 70.7; y: 41.1; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 71.7; y: 41.5; scale-x: 0.791; scale-y: 0.785; }
        frame 51 { x: 72.7; y: 41.7; scale-x: 0.816; scale-y: 0.81; }
        frame 52 { x: 73.7; y: 42; scale-x: 0.841; scale-y: 0.835; }
        frame 53 { x: 73.2; y: 41.9; scale-x: 0.829; scale-y: 0.822; }
        frame 54 { x: 72.7; y: 41.7; scale-x: 0.816; scale-y: 0.81; }
        frame 55 { x: 73.2; y: 41.9; scale-x: 0.829; scale-y: 0.822; }
        frame 56 { x: 73.7; y: 42; scale-x: 0.841; scale-y: 0.835; }
        frame 57 { x: 73.2; y: 41.9; scale-x: 0.829; scale-y: 0.822; }
        frame 58 { x: 72.7; y: 41.7; scale-x: 0.816; scale-y: 0.81; }
        frame 59 { x: 73.2; y: 41.9; scale-x: 0.829; scale-y: 0.822; }
        frame 60 { x: 73.7; y: 42; scale-x: 0.841; scale-y: 0.835; }
        frame 61 { x: 73.2; y: 41.9; scale-x: 0.829; scale-y: 0.822; }
        frame 62 { x: 72.7; y: 41.7; scale-x: 0.816; scale-y: 0.81; }
        frame 63 { x: 73.2; y: 41.9; scale-x: 0.829; scale-y: 0.822; }
        frame 64 { x: 73.7; y: 42; scale-x: 0.841; scale-y: 0.835; }
        frame 65 { x: 73.2; y: 41.9; scale-x: 0.829; scale-y: 0.822; }
        frame 66 { x: 72.7; y: 41.7; scale-x: 0.816; scale-y: 0.81; }
        frame 67 { x: 72.5; y: -10000; scale-x: 0.812; scale-y: 0.807; }
        frame 68 { x: 72.3; y: 41.6; scale-x: 0.808; scale-y: 0.805; }
        frame 69 { x: 72.2; y: -10000; scale-x: 0.804; scale-y: 0.802; }
        frame 70 { x: 72; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_shooter2";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 8.1; y: 41.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_SHOOTER2; }
        frame 6 { x: 8.3; y: 40.4; scale-x: 0.797; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 8.4; y: 39.3; scale-x: 0.793; scale-y: 0.825; }
        frame 8 { x: 8.5; y: 38.3; scale-x: 0.79; scale-y: 0.838; }
        frame 9 { x: -10000; y: 39.4; scale-x: 0.791; scale-y: 0.831; }
        frame 10 { x: 8.4; y: 40.4; scale-x: 0.793; scale-y: 0.825; }
        frame 11 { x: 8.3; y: 41.6; scale-x: 0.795; scale-y: 0.819; }
        frame 12 { x: -10000; y: 42.6; scale-x: 0.797; scale-y: 0.813; }
        frame 13 { x: 8.2; y: 43.8; scale-x: 0.798; scale-y: 0.806; }
        frame 14 { x: 8.1; y: 44.9; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 7.8; y: -10000; scale-x: 0.806; scale-y: 0.796; }
        frame 16 { x: 7.6; scale-x: 0.813; scale-y: 0.792; }
        frame 17 { x: 7.3; scale-x: 0.819; scale-y: 0.788; }
        frame 18 { x: 7.5; y: 44.4; scale-x: 0.816; scale-y: 0.79; }
        frame 19 { x: 7.6; y: 43.8; scale-x: 0.813; scale-y: 0.792; }
        frame 20 { x: 7.7; y: 43.2; scale-x: 0.81; scale-y: 0.794; }
        frame 21 { x: 7.8; y: 42.5; scale-x: 0.806; scale-y: 0.796; }
        frame 22 { x: 8; y: 42; scale-x: 0.803; scale-y: 0.798; }
        frame 23 { x: 8.1; y: 41.4; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 8.3; y: 40.4; scale-x: 0.797; scale-y: 0.813; }
        frame 26 { x: 8.4; y: 39.3; scale-x: 0.793; scale-y: 0.825; }
        frame 27 { x: 8.5; y: 38.3; scale-x: 0.79; scale-y: 0.838; }
        frame 28 { x: -10000; y: 39.4; scale-x: 0.791; scale-y: 0.831; }
        frame 29 { x: 8.4; y: 40.4; scale-x: 0.793; scale-y: 0.825; }
        frame 30 { x: 8.3; y: 41.6; scale-x: 0.795; scale-y: 0.819; }
        frame 31 { x: -10000; y: 42.6; scale-x: 0.797; scale-y: 0.813; }
        frame 32 { x: 8.2; y: 43.8; scale-x: 0.798; scale-y: 0.806; }
        frame 33 { x: 8.1; y: 44.9; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: 7.8; y: -10000; scale-x: 0.806; scale-y: 0.796; }
        frame 35 { x: 7.6; scale-x: 0.813; scale-y: 0.792; }
        frame 36 { x: 7.3; scale-x: 0.819; scale-y: 0.788; }
        frame 37 { x: 7.5; y: 44.4; scale-x: 0.816; scale-y: 0.79; }
        frame 38 { x: 7.6; y: 43.8; scale-x: 0.813; scale-y: 0.792; }
        frame 39 { x: 7.7; y: 43.2; scale-x: 0.81; scale-y: 0.794; }
        frame 40 { x: 7.8; y: 42.5; scale-x: 0.806; scale-y: 0.796; }
        frame 41 { x: 8; y: 42; scale-x: 0.803; scale-y: 0.798; }
        frame 42 { x: 8.1; y: 41.4; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 8.4; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 8.6; y: 41.3; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 8.8; y: 41.2; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 9; y: 41.1; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 9.3; y: 41; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 9.5; y: -10000; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 7.8; y: 41.4; scale-x: 0.81; scale-y: 0.841; }
        frame 51 { x: 6.1; y: 41.7; scale-x: 0.853; scale-y: 0.922; }
        frame 52 { x: 4.4; y: 42; scale-x: 0.897; scale-y: 1.004; }
        frame 53 { x: 5.2; y: 41.8; scale-x: 0.875; scale-y: 0.963; }
        frame 54 { x: 6.1; y: 41.7; scale-x: 0.853; scale-y: 0.922; }
        frame 55 { x: 5.3; y: 41.9; scale-x: 0.875; scale-y: 0.963; }
        frame 56 { x: 4.4; y: 42; scale-x: 0.897; scale-y: 1.004; }
        frame 57 { x: 5.2; y: 41.8; scale-x: 0.875; scale-y: 0.963; }
        frame 58 { x: 6.1; y: 41.7; scale-x: 0.853; scale-y: 0.922; }
        frame 59 { x: 5.3; y: 41.9; scale-x: 0.875; scale-y: 0.963; }
        frame 60 { x: 4.4; y: 42; scale-x: 0.897; scale-y: 1.004; }
        frame 61 { x: 5.2; y: 41.8; scale-x: 0.875; scale-y: 0.963; }
        frame 62 { x: 6.1; y: 41.7; scale-x: 0.853; scale-y: 0.922; }
        frame 63 { x: 5.3; y: 41.9; scale-x: 0.875; scale-y: 0.963; }
        frame 64 { x: 4.4; y: 42; scale-x: 0.897; scale-y: 1.004; }
        frame 65 { x: 5.2; y: 41.8; scale-x: 0.875; scale-y: 0.963; }
        frame 66 { x: 6.1; y: 41.7; scale-x: 0.853; scale-y: 0.922; }
        frame 67 { x: 6.6; y: 41.6; scale-x: 0.84; scale-y: 0.892; }
        frame 68 { x: 7.2; y: -10000; scale-x: 0.827; scale-y: 0.861; }
        frame 69 { x: 7.6; y: 41.5; scale-x: 0.813; scale-y: 0.831; }
        frame 70 { x: 8.1; y: 41.4; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_shooter22";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 73.2; y: 42.6; skew-x: 180; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_SHOOTER2; }
        frame 6 { x: 73; y: 41.6; skew-x: -10000; scale-x: 0.797; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 72.8; y: 40.6; scale-x: 0.793; scale-y: 0.825; }
        frame 8 { x: -10000; y: 39.5; scale-x: 0.79; scale-y: 0.838; }
        frame 9 { y: 40.7; scale-x: 0.791; scale-y: 0.831; }
        frame 10 { y: 41.7; scale-x: 0.793; scale-y: 0.825; }
        frame 11 { x: 72.9; y: 42.9; scale-x: 0.795; scale-y: 0.819; }
        frame 12 { x: 73; y: 43.9; scale-x: 0.797; scale-y: 0.813; }
        frame 13 { x: 73.1; y: 45.1; scale-x: 0.798; scale-y: 0.806; }
        frame 14 { x: 73.2; y: 46.1; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 73.4; y: -10000; scale-x: 0.806; scale-y: 0.796; }
        frame 16 { x: 73.7; scale-x: 0.813; scale-y: 0.792; }
        frame 17 { x: 74; scale-x: 0.819; scale-y: 0.788; }
        frame 18 { x: 73.8; y: 45.6; scale-x: 0.816; scale-y: 0.79; }
        frame 19 { x: 73.7; y: 45; scale-x: 0.813; scale-y: 0.792; }
        frame 20 { x: 73.5; y: 44.4; scale-x: 0.81; scale-y: 0.794; }
        frame 21 { x: 73.4; y: 43.8; scale-x: 0.806; scale-y: 0.796; }
        frame 22 { x: 73.3; y: 43.3; scale-x: 0.803; scale-y: 0.798; }
        frame 23 { x: 73.2; y: 42.6; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 73; y: 41.6; scale-x: 0.797; scale-y: 0.813; }
        frame 26 { x: 72.8; y: 40.6; scale-x: 0.793; scale-y: 0.825; }
        frame 27 { x: -10000; y: 39.5; scale-x: 0.79; scale-y: 0.838; }
        frame 28 { y: 40.7; scale-x: 0.791; scale-y: 0.831; }
        frame 29 { y: 41.7; scale-x: 0.793; scale-y: 0.825; }
        frame 30 { x: 72.9; y: 42.9; scale-x: 0.795; scale-y: 0.819; }
        frame 31 { x: 73; y: 43.9; scale-x: 0.797; scale-y: 0.813; }
        frame 32 { x: 73.1; y: 45.1; scale-x: 0.798; scale-y: 0.806; }
        frame 33 { x: 73.2; y: 46.1; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: 73.4; y: -10000; scale-x: 0.806; scale-y: 0.796; }
        frame 35 { x: 73.7; scale-x: 0.813; scale-y: 0.792; }
        frame 36 { x: 74; scale-x: 0.819; scale-y: 0.788; }
        frame 37 { x: 73.8; y: 45.6; scale-x: 0.816; scale-y: 0.79; }
        frame 38 { x: 73.7; y: 45; scale-x: 0.813; scale-y: 0.792; }
        frame 39 { x: 73.5; y: 44.4; scale-x: 0.81; scale-y: 0.794; }
        frame 40 { x: 73.4; y: 43.8; scale-x: 0.806; scale-y: 0.796; }
        frame 41 { x: 73.3; y: 43.3; scale-x: 0.803; scale-y: 0.798; }
        frame 42 { x: 73.2; y: 42.6; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 72.9; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 72.7; y: 42.5; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 72.5; y: -10000; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 72.3; y: 42.3; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 72; y: -10000; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 71.8; y: 42.1; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 73.7; y: 42.6; scale-x: 0.81; scale-y: 0.841; }
        frame 51 { x: 75.5; y: 43.1; scale-x: 0.853; scale-y: 0.922; }
        frame 52 { x: 77.3; y: 43.6; scale-x: 0.897; scale-y: 1.004; }
        frame 53 { x: 76.3; y: 43.3; scale-x: 0.875; scale-y: 0.963; }
        frame 54 { x: 75.5; y: 43.1; scale-x: 0.853; scale-y: 0.922; }
        frame 55 { x: 76.4; y: 43.4; scale-x: 0.875; scale-y: 0.963; }
        frame 56 { x: 77.3; y: 43.6; scale-x: 0.897; scale-y: 1.004; }
        frame 57 { x: 76.3; y: 43.3; scale-x: 0.875; scale-y: 0.963; }
        frame 58 { x: 75.5; y: 43.1; scale-x: 0.853; scale-y: 0.922; }
        frame 59 { x: 76.4; y: 43.4; scale-x: 0.875; scale-y: 0.963; }
        frame 60 { x: 77.3; y: 43.6; scale-x: 0.897; scale-y: 1.004; }
        frame 61 { x: 76.3; y: 43.3; scale-x: 0.875; scale-y: 0.963; }
        frame 62 { x: 75.5; y: 43.1; scale-x: 0.853; scale-y: 0.922; }
        frame 63 { x: 76.4; y: 43.4; scale-x: 0.875; scale-y: 0.963; }
        frame 64 { x: 77.3; y: 43.6; scale-x: 0.897; scale-y: 1.004; }
        frame 65 { x: 76.3; y: 43.3; scale-x: 0.875; scale-y: 0.963; }
        frame 66 { x: 75.5; y: 43.1; scale-x: 0.853; scale-y: 0.922; }
        frame 67 { x: 74.9; y: 43; scale-x: 0.84; scale-y: 0.892; }
        frame 68 { x: 74.4; scale-x: 0.827; scale-y: 0.861; }
        frame 69 { x: 73.8; y: 42.8; scale-x: 0.813; scale-y: 0.831; }
        frame 70 { x: 73.2; y: 42.6; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_stem3";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 2.4; y: 24; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_STEM3; }
        frame 6 { x: 2.8; y: 23.1; scale-x: 0.79; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 3.3; y: 22.3; scale-x: 0.781; scale-y: 0.825; }
        frame 8 { x: 3.8; y: 21.5; scale-x: 0.771; scale-y: 0.838; }
        frame 9 { x: 3.4; y: 22.5; scale-x: 0.778; scale-y: 0.831; }
        frame 10 { x: 3; y: 23.6; scale-x: 0.785; scale-y: 0.825; }
        frame 11 { x: 2.7; y: 24.7; scale-x: 0.793; scale-y: 0.819; }
        frame 12 { x: 2.4; y: 25.8; scale-x: 0.8; scale-y: 0.813; }
        frame 13 { x: 2; y: 26.8; scale-x: 0.807; scale-y: 0.806; }
        frame 14 { x: 1.7; y: 27.9; scale-x: 0.815; scale-y: 0.8; }
        frame 15 { x: 1.5; y: 27.8; scale-x: 0.819; scale-y: 0.796; }
        frame 16 { x: 1.3; y: -10000; scale-x: 0.824; scale-y: 0.792; }
        frame 17 { x: 1; scale-x: 0.829; scale-y: 0.788; }
        frame 18 { x: 1.2; y: 27.1; scale-x: 0.824; scale-y: 0.79; }
        frame 19 { x: 1.4; y: 26.5; scale-x: 0.819; scale-y: 0.792; }
        frame 20 { x: 1.7; y: 25.8; scale-x: 0.815; scale-y: 0.794; }
        frame 21 { x: 2; y: 25.2; scale-x: 0.81; scale-y: 0.796; }
        frame 22 { x: 2.1; y: 24.6; scale-x: 0.805; scale-y: 0.798; }
        frame 23 { x: 2.4; y: 24; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 2.8; y: 23.1; scale-x: 0.79; scale-y: 0.813; }
        frame 26 { x: 3.3; y: 22.3; scale-x: 0.781; scale-y: 0.825; }
        frame 27 { x: 3.8; y: 21.5; scale-x: 0.771; scale-y: 0.838; }
        frame 28 { x: 3.4; y: 22.5; scale-x: 0.778; scale-y: 0.831; }
        frame 29 { x: 3; y: 23.6; scale-x: 0.785; scale-y: 0.825; }
        frame 30 { x: 2.7; y: 24.7; scale-x: 0.793; scale-y: 0.819; }
        frame 31 { x: 2.4; y: 25.8; scale-x: 0.8; scale-y: 0.813; }
        frame 32 { x: 2; y: 26.8; scale-x: 0.807; scale-y: 0.806; }
        frame 33 { x: 1.7; y: 27.9; scale-x: 0.815; scale-y: 0.8; }
        frame 34 { x: 1.5; y: 27.8; scale-x: 0.819; scale-y: 0.796; }
        frame 35 { x: 1.3; y: -10000; scale-x: 0.824; scale-y: 0.792; }
        frame 36 { x: 1; scale-x: 0.829; scale-y: 0.788; }
        frame 37 { x: 1.2; y: 27.1; scale-x: 0.824; scale-y: 0.79; }
        frame 38 { x: 1.4; y: 26.5; scale-x: 0.819; scale-y: 0.792; }
        frame 39 { x: 1.7; y: 25.8; scale-x: 0.815; scale-y: 0.794; }
        frame 40 { x: 2; y: 25.2; scale-x: 0.81; scale-y: 0.796; }
        frame 41 { x: 2.1; y: 24.6; scale-x: 0.805; scale-y: 0.798; }
        frame 42 { x: 2.4; y: 24; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 2.6; y: 24.1; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 2.9; y: -10000; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 3.1; y: 24.2; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 3.5; y: 24.3; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 3.7; y: 24.4; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 4; y: -10000; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 2.8; y: 24.1; scale-x: 0.791; scale-y: 0.785; }
        frame 51 { x: 1.6; y: 23.9; scale-x: 0.816; scale-y: 0.81; }
        frame 52 { x: 0.3; y: 23.6; scale-x: 0.841; scale-y: 0.835; }
        frame 53 { x: 1; y: 23.7; scale-x: 0.829; scale-y: 0.822; }
        frame 54 { x: 1.6; y: 23.9; scale-x: 0.816; scale-y: 0.81; }
        frame 55 { x: 1; y: 23.7; scale-x: 0.829; scale-y: 0.822; }
        frame 56 { x: 0.3; y: 23.6; scale-x: 0.841; scale-y: 0.835; }
        frame 57 { x: 1; y: 23.7; scale-x: 0.829; scale-y: 0.822; }
        frame 58 { x: 1.6; y: 23.9; scale-x: 0.816; scale-y: 0.81; }
        frame 59 { x: 1; y: 23.7; scale-x: 0.829; scale-y: 0.822; }
        frame 60 { x: 0.3; y: 23.6; scale-x: 0.841; scale-y: 0.835; }
        frame 61 { x: 1; y: 23.7; scale-x: 0.829; scale-y: 0.822; }
        frame 62 { x: 1.6; y: 23.9; scale-x: 0.816; scale-y: 0.81; }
        frame 63 { x: 1; y: 23.7; scale-x: 0.829; scale-y: 0.822; }
        frame 64 { x: 0.3; y: 23.6; scale-x: 0.841; scale-y: 0.835; }
        frame 65 { x: 1; y: 23.7; scale-x: 0.829; scale-y: 0.822; }
        frame 66 { x: 1.6; y: 23.9; scale-x: 0.816; scale-y: 0.81; }
        frame 67 { x: 1.8; y: -10000; scale-x: 0.812; scale-y: 0.807; }
        frame 68 { x: 2; scale-x: 0.808; scale-y: 0.805; }
        frame 69 { x: 2.1; scale-x: 0.804; scale-y: 0.802; }
        frame 70 { x: 2.4; y: 24; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_stem32";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 78.9; y: 25.2; skew-x: 180; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_STEM3; }
        frame 6 { x: 78.5; y: 24.4; skew-x: -10000; scale-x: 0.79; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 78; y: 23.6; scale-x: 0.781; scale-y: 0.825; }
        frame 8 { x: 77.5; y: 22.8; scale-x: 0.771; scale-y: 0.838; }
        frame 9 { x: 77.8; y: 23.8; scale-x: 0.778; scale-y: 0.831; }
        frame 10 { x: 78.2; y: 24.9; scale-x: 0.785; scale-y: 0.825; }
        frame 11 { x: 78.6; y: 25.9; scale-x: 0.793; scale-y: 0.819; }
        frame 12 { x: 78.9; y: 27.1; scale-x: 0.8; scale-y: 0.813; }
        frame 13 { x: 79.2; y: 28.1; scale-x: 0.807; scale-y: 0.806; }
        frame 14 { x: 79.6; y: 29.1; scale-x: 0.815; scale-y: 0.8; }
        frame 15 { x: 79.9; y: -10000; scale-x: 0.819; scale-y: 0.796; }
        frame 16 { x: 80.1; scale-x: 0.824; scale-y: 0.792; }
        frame 17 { x: 80.3; y: 29; scale-x: 0.829; scale-y: 0.788; }
        frame 18 { x: 80.1; y: 28.4; scale-x: 0.824; scale-y: 0.79; }
        frame 19 { x: 79.8; y: 27.8; scale-x: 0.819; scale-y: 0.792; }
        frame 20 { x: 79.7; y: 27.1; scale-x: 0.815; scale-y: 0.794; }
        frame 21 { x: 79.4; y: 26.5; scale-x: 0.81; scale-y: 0.796; }
        frame 22 { x: 79.2; y: 25.8; scale-x: 0.805; scale-y: 0.798; }
        frame 23 { x: 78.9; y: 25.2; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 78.5; y: 24.4; scale-x: 0.79; scale-y: 0.813; }
        frame 26 { x: 78; y: 23.6; scale-x: 0.781; scale-y: 0.825; }
        frame 27 { x: 77.5; y: 22.8; scale-x: 0.771; scale-y: 0.838; }
        frame 28 { x: 77.8; y: 23.8; scale-x: 0.778; scale-y: 0.831; }
        frame 29 { x: 78.2; y: 24.9; scale-x: 0.785; scale-y: 0.825; }
        frame 30 { x: 78.6; y: 25.9; scale-x: 0.793; scale-y: 0.819; }
        frame 31 { x: 78.9; y: 27.1; scale-x: 0.8; scale-y: 0.813; }
        frame 32 { x: 79.2; y: 28.1; scale-x: 0.807; scale-y: 0.806; }
        frame 33 { x: 79.6; y: 29.1; scale-x: 0.815; scale-y: 0.8; }
        frame 34 { x: 79.9; y: -10000; scale-x: 0.819; scale-y: 0.796; }
        frame 35 { x: 80.1; scale-x: 0.824; scale-y: 0.792; }
        frame 36 { x: 80.3; y: 29; scale-x: 0.829; scale-y: 0.788; }
        frame 37 { x: 80.1; y: 28.4; scale-x: 0.824; scale-y: 0.79; }
        frame 38 { x: 79.8; y: 27.8; scale-x: 0.819; scale-y: 0.792; }
        frame 39 { x: 79.7; y: 27.1; scale-x: 0.815; scale-y: 0.794; }
        frame 40 { x: 79.4; y: 26.5; scale-x: 0.81; scale-y: 0.796; }
        frame 41 { x: 79.2; y: 25.8; scale-x: 0.805; scale-y: 0.798; }
        frame 42 { x: 78.9; y: 25.2; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 78.7; y: 25.3; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 78.3; y: 25.4; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 78.1; y: -10000; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 77.8; y: 25.5; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 77.6; y: -10000; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 77.3; y: 25.6; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 78.5; y: 25.4; scale-x: 0.791; scale-y: 0.785; }
        frame 51 { x: 79.7; y: 25.1; scale-x: 0.816; scale-y: 0.81; }
        frame 52 { x: 80.9; y: 24.9; scale-x: 0.841; scale-y: 0.835; }
        frame 53 { x: 80.3; y: 25; scale-x: 0.829; scale-y: 0.822; }
        frame 54 { x: 79.7; y: 25.1; scale-x: 0.816; scale-y: 0.81; }
        frame 55 { x: 80.3; y: 25; scale-x: 0.829; scale-y: 0.822; }
        frame 56 { x: 80.9; y: 24.9; scale-x: 0.841; scale-y: 0.835; }
        frame 57 { x: 80.3; y: 25; scale-x: 0.829; scale-y: 0.822; }
        frame 58 { x: 79.7; y: 25.1; scale-x: 0.816; scale-y: 0.81; }
        frame 59 { x: 80.3; y: 25; scale-x: 0.829; scale-y: 0.822; }
        frame 60 { x: 80.9; y: 24.9; scale-x: 0.841; scale-y: 0.835; }
        frame 61 { x: 80.3; y: 25; scale-x: 0.829; scale-y: 0.822; }
        frame 62 { x: 79.7; y: 25.1; scale-x: 0.816; scale-y: 0.81; }
        frame 63 { x: 80.3; y: 25; scale-x: 0.829; scale-y: 0.822; }
        frame 64 { x: 80.9; y: 24.9; scale-x: 0.841; scale-y: 0.835; }
        frame 65 { x: 80.3; y: 25; scale-x: 0.829; scale-y: 0.822; }
        frame 66 { x: 79.7; y: 25.1; scale-x: 0.816; scale-y: 0.81; }
        frame 67 { x: 79.5; y: 25.2; scale-x: 0.812; scale-y: 0.807; }
        frame 68 { x: 79.3; y: -10000; scale-x: 0.808; scale-y: 0.805; }
        frame 69 { x: 79.1; scale-x: 0.804; scale-y: 0.802; }
        frame 70 { x: 78.9; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_shooter3";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -0.4; y: 22.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_SHOOTER3; }
        frame 6 { x: 0; y: 21.6; scale-x: 0.79; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 0.5; y: 20.5; scale-x: 0.781; scale-y: 0.825; }
        frame 8 { x: 1; y: 19.6; scale-x: 0.771; scale-y: 0.838; }
        frame 9 { x: 0.6; y: 20.6; scale-x: 0.778; scale-y: 0.831; }
        frame 10 { x: 0.2; y: 21.7; scale-x: 0.785; scale-y: 0.825; }
        frame 11 { x: -0; y: 22.8; scale-x: 0.793; scale-y: 0.819; }
        frame 12 { x: -0.4; y: 23.9; scale-x: 0.8; scale-y: 0.813; }
        frame 13 { x: -0.8; y: 24.9; scale-x: 0.807; scale-y: 0.806; }
        frame 14 { x: -1.1; y: 26; scale-x: 0.815; scale-y: 0.8; }
        frame 15 { x: -1.3; y: 26.5; scale-x: 0.819; scale-y: 0.796; }
        frame 16 { x: -1.6; y: 26.9; scale-x: 0.824; scale-y: 0.792; }
        frame 17 { x: -1.9; y: 27.3; scale-x: 0.829; scale-y: 0.788; }
        frame 18 { x: -1.6; y: 26.6; scale-x: 0.824; scale-y: 0.79; }
        frame 19 { x: -1.4; y: 25.8; scale-x: 0.819; scale-y: 0.792; }
        frame 20 { x: -1.1; y: 25; scale-x: 0.815; scale-y: 0.794; }
        frame 21 { x: -0.8; y: 24.2; scale-x: 0.81; scale-y: 0.796; }
        frame 22 { x: -0.6; y: 23.4; scale-x: 0.805; scale-y: 0.798; }
        frame 23 { x: -0.4; y: 22.5; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 0; y: 21.6; scale-x: 0.79; scale-y: 0.813; }
        frame 26 { x: 0.5; y: 20.5; scale-x: 0.781; scale-y: 0.825; }
        frame 27 { x: 1; y: 19.6; scale-x: 0.771; scale-y: 0.838; }
        frame 28 { x: 0.6; y: 20.6; scale-x: 0.778; scale-y: 0.831; }
        frame 29 { x: 0.2; y: 21.7; scale-x: 0.785; scale-y: 0.825; }
        frame 30 { x: -0; y: 22.8; scale-x: 0.793; scale-y: 0.819; }
        frame 31 { x: -0.4; y: 23.9; scale-x: 0.8; scale-y: 0.813; }
        frame 32 { x: -0.8; y: 24.9; scale-x: 0.807; scale-y: 0.806; }
        frame 33 { x: -1.1; y: 26; scale-x: 0.815; scale-y: 0.8; }
        frame 34 { x: -1.3; y: 26.5; scale-x: 0.819; scale-y: 0.796; }
        frame 35 { x: -1.6; y: 26.9; scale-x: 0.824; scale-y: 0.792; }
        frame 36 { x: -1.9; y: 27.3; scale-x: 0.829; scale-y: 0.788; }
        frame 37 { x: -1.6; y: 26.6; scale-x: 0.824; scale-y: 0.79; }
        frame 38 { x: -1.4; y: 25.8; scale-x: 0.819; scale-y: 0.792; }
        frame 39 { x: -1.1; y: 25; scale-x: 0.815; scale-y: 0.794; }
        frame 40 { x: -0.8; y: 24.2; scale-x: 0.81; scale-y: 0.796; }
        frame 41 { x: -0.6; y: 23.4; scale-x: 0.805; scale-y: 0.798; }
        frame 42 { x: -0.4; y: 22.5; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: -0.1; y: 22.6; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 0.1; y: 22.7; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 0.3; y: 22.8; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 0.6; y: -10000; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 0.9; y: 22.9; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 1.2; y: 23; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: -2; y: 21.8; scale-x: 0.831; scale-y: 0.853; }
        frame 51 { x: -5.3; y: 20.6; scale-x: 0.897; scale-y: 0.947; }
        frame 52 { x: -8.7; y: 19.2; scale-x: 0.962; scale-y: 1.04; }
        frame 53 { x: -7; y: 20; scale-x: 0.929; scale-y: 0.994; }
        frame 54 { x: -5.3; y: 20.6; scale-x: 0.897; scale-y: 0.947; }
        frame 55 { x: -7; y: 19.9; scale-x: 0.929; scale-y: 0.994; }
        frame 56 { x: -8.7; y: 19.2; scale-x: 0.962; scale-y: 1.04; }
        frame 57 { x: -7; y: 20; scale-x: 0.929; scale-y: 0.994; }
        frame 58 { x: -5.3; y: 20.6; scale-x: 0.897; scale-y: 0.947; }
        frame 59 { x: -7; y: 19.9; scale-x: 0.929; scale-y: 0.994; }
        frame 60 { x: -8.7; y: 19.2; scale-x: 0.962; scale-y: 1.04; }
        frame 61 { x: -7; y: 20; scale-x: 0.929; scale-y: 0.994; }
        frame 62 { x: -5.3; y: 20.6; scale-x: 0.897; scale-y: 0.947; }
        frame 63 { x: -7; y: 19.9; scale-x: 0.929; scale-y: 0.994; }
        frame 64 { x: -8.7; y: 19.2; scale-x: 0.962; scale-y: 1.04; }
        frame 65 { x: -7; y: 20; scale-x: 0.929; scale-y: 0.994; }
        frame 66 { x: -5.3; y: 20.6; scale-x: 0.897; scale-y: 0.947; }
        frame 67 { x: -4.2; y: 21.1; scale-x: 0.872; scale-y: 0.91; }
        frame 68 { x: -2.9; y: 21.6; scale-x: 0.848; scale-y: 0.873; }
        frame 69 { x: -1.7; y: 22; scale-x: 0.824; scale-y: 0.837; }
        frame 70 { x: -0.4; y: 22.5; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_shooter32";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 81.8; y: 23.8; skew-x: 180; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_SHOOTER3; }
        frame 6 { x: 81.3; y: 22.8; skew-x: -10000; scale-x: 0.79; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 80.8; y: 21.8; scale-x: 0.781; scale-y: 0.825; }
        frame 8 { x: 80.3; y: 20.9; scale-x: 0.771; scale-y: 0.838; }
        frame 9 { x: 80.7; y: 21.9; scale-x: 0.778; scale-y: 0.831; }
        frame 10 { x: 81; y: 23; scale-x: 0.785; scale-y: 0.825; }
        frame 11 { x: 81.4; y: 24.1; scale-x: 0.793; scale-y: 0.819; }
        frame 12 { x: 81.8; y: 25.1; scale-x: 0.8; scale-y: 0.813; }
        frame 13 { x: 82.2; y: 26.2; scale-x: 0.807; scale-y: 0.806; }
        frame 14 { x: 82.6; y: 27.3; scale-x: 0.815; scale-y: 0.8; }
        frame 15 { x: 82.8; y: 27.7; scale-x: 0.819; scale-y: 0.796; }
        frame 16 { x: 83.1; y: 28.1; scale-x: 0.824; scale-y: 0.792; }
        frame 17 { x: 83.3; y: 28.6; scale-x: 0.829; scale-y: 0.788; }
        frame 18 { x: 83.1; y: 27.8; scale-x: 0.824; scale-y: 0.79; }
        frame 19 { x: 82.8; y: 27; scale-x: 0.819; scale-y: 0.792; }
        frame 20 { x: 82.6; y: 26.2; scale-x: 0.815; scale-y: 0.794; }
        frame 21 { x: 82.3; y: 25.4; scale-x: 0.81; scale-y: 0.796; }
        frame 22 { x: 82.1; y: 24.6; scale-x: 0.805; scale-y: 0.798; }
        frame 23 { x: 81.8; y: 23.8; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 81.3; y: 22.8; scale-x: 0.79; scale-y: 0.813; }
        frame 26 { x: 80.8; y: 21.8; scale-x: 0.781; scale-y: 0.825; }
        frame 27 { x: 80.3; y: 20.9; scale-x: 0.771; scale-y: 0.838; }
        frame 28 { x: 80.7; y: 21.9; scale-x: 0.778; scale-y: 0.831; }
        frame 29 { x: 81; y: 23; scale-x: 0.785; scale-y: 0.825; }
        frame 30 { x: 81.4; y: 24.1; scale-x: 0.793; scale-y: 0.819; }
        frame 31 { x: 81.8; y: 25.1; scale-x: 0.8; scale-y: 0.813; }
        frame 32 { x: 82.2; y: 26.2; scale-x: 0.807; scale-y: 0.806; }
        frame 33 { x: 82.6; y: 27.3; scale-x: 0.815; scale-y: 0.8; }
        frame 34 { x: 82.8; y: 27.7; scale-x: 0.819; scale-y: 0.796; }
        frame 35 { x: 83.1; y: 28.1; scale-x: 0.824; scale-y: 0.792; }
        frame 36 { x: 83.3; y: 28.6; scale-x: 0.829; scale-y: 0.788; }
        frame 37 { x: 83.1; y: 27.8; scale-x: 0.824; scale-y: 0.79; }
        frame 38 { x: 82.8; y: 27; scale-x: 0.819; scale-y: 0.792; }
        frame 39 { x: 82.6; y: 26.2; scale-x: 0.815; scale-y: 0.794; }
        frame 40 { x: 82.3; y: 25.4; scale-x: 0.81; scale-y: 0.796; }
        frame 41 { x: 82.1; y: 24.6; scale-x: 0.805; scale-y: 0.798; }
        frame 42 { x: 81.8; y: 23.8; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 81.5; y: 23.9; scale-x: 0.794; scale-y: 0.793; }
        frame 45 { x: 81.2; y: -10000; scale-x: 0.789; scale-y: 0.787; }
        frame 46 { x: 80.9; y: 24; scale-x: 0.783; scale-y: 0.78; }
        frame 47 { x: 80.7; y: 24.1; scale-x: 0.777; scale-y: 0.773; }
        frame 48 { x: 80.3; y: -10000; scale-x: 0.772; scale-y: 0.766; }
        frame 49 { x: 80.1; y: 24.2; scale-x: 0.766; scale-y: 0.76; }
        frame 50 { x: 83.4; y: 23.1; scale-x: 0.831; scale-y: 0.853; }
        frame 51 { x: 86.8; y: 22; scale-x: 0.897; scale-y: 0.947; }
        frame 52 { x: 90.2; y: 20.9; scale-x: 0.962; scale-y: 1.04; }
        frame 53 { x: 88.5; y: 21.5; scale-x: 0.929; scale-y: 0.994; }
        frame 54 { x: 86.8; y: 22; scale-x: 0.897; scale-y: 0.947; }
        frame 55 { x: 88.5; y: 21.5; scale-x: 0.929; scale-y: 0.994; }
        frame 56 { x: 90.2; y: 20.9; scale-x: 0.962; scale-y: 1.04; }
        frame 57 { x: 88.5; y: 21.5; scale-x: 0.929; scale-y: 0.994; }
        frame 58 { x: 86.8; y: 22; scale-x: 0.897; scale-y: 0.947; }
        frame 59 { x: 88.5; y: 21.5; scale-x: 0.929; scale-y: 0.994; }
        frame 60 { x: 90.2; y: 20.9; scale-x: 0.962; scale-y: 1.04; }
        frame 61 { x: 88.5; y: 21.5; scale-x: 0.929; scale-y: 0.994; }
        frame 62 { x: 86.8; y: 22; scale-x: 0.897; scale-y: 0.947; }
        frame 63 { x: 88.5; y: 21.5; scale-x: 0.929; scale-y: 0.994; }
        frame 64 { x: 90.2; y: 20.9; scale-x: 0.962; scale-y: 1.04; }
        frame 65 { x: 88.5; y: 21.5; scale-x: 0.929; scale-y: 0.994; }
        frame 66 { x: 86.8; y: 22; scale-x: 0.897; scale-y: 0.947; }
        frame 67 { x: 85.5; y: 22.5; scale-x: 0.872; scale-y: 0.91; }
        frame 68 { x: 84.3; y: 22.9; scale-x: 0.848; scale-y: 0.873; }
        frame 69 { x: 83; y: 23.3; scale-x: 0.824; scale-y: 0.837; }
        frame 70 { x: 81.8; y: 23.8; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "GloomShroom_face";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 51 { x: 11.6; y: 7.4; scale-x: 0.816; scale-y: 0.81; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_FACE1; }
        frame 52 { x: 10.7; y: 7; scale-x: 0.841; scale-y: 0.835; cel: -10000; image: IMAGE_REANIM_GLOOMSHROOM_FACE2; }
        frame 53 { x: 11.2; y: 7.3; scale-x: 0.828; scale-y: 0.822; image: none; }
        frame 54 { x: 11.6; y: 7.7; scale-x: 0.816; scale-y: 0.81; }
        frame 55 { x: 11.2; y: 7.3; scale-x: 0.828; scale-y: 0.822; }
        frame 56 { x: 10.7; y: 7; scale-x: 0.841; scale-y: 0.835; }
        frame 57 { x: 11.2; y: 7.3; scale-x: 0.828; scale-y: 0.822; }
        frame 58 { x: 11.6; y: 7.7; scale-x: 0.816; scale-y: 0.81; }
        frame 59 { x: 11.2; y: 7.3; scale-x: 0.828; scale-y: 0.822; }
        frame 60 { x: 10.7; y: 7; scale-x: 0.841; scale-y: 0.835; }
        frame 61 { x: 11.2; y: 7.3; scale-x: 0.828; scale-y: 0.822; }
        frame 62 { x: 11.6; y: 7.7; scale-x: 0.816; scale-y: 0.81; }
        frame 63 { x: 11.2; y: 7.3; scale-x: 0.828; scale-y: 0.822; }
        frame 64 { x: 10.7; y: 7; scale-x: 0.841; scale-y: 0.835; }
        frame 65 { x: 11.2; y: 7.3; scale-x: 0.828; scale-y: 0.822; }
        frame 66 { x: 11.6; y: 7.7; scale-x: 0.816; scale-y: 0.81; }
        frame 67 { x: -10000; y: 7.4; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_GLOOMSHROOM_FACE1; }
        frame 68 { y: -10000; cel: -1; image: none; }
        frame 69 { cel: -10000; }
    }
    Track {
        source-name: "blink";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { x: 15; y: 12; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_BLINK1; }
        frame 2 { x: -10000; y: 11.9; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_GLOOMSHROOM_BLINK2; }
        frame 3 { y: 12; image: IMAGE_REANIM_GLOOMSHROOM_BLINK1; }
        frame 4 { y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 24 { y: 11.9; cel: 0; image: IMAGE_REANIM_GLOOMSHROOM_BLINK2; }
        frame 25 { x: 15.3; y: 11.2; scale-x: 0.793; scale-y: 0.81; cel: -10000; image: none; }
        frame 26 { x: 15.4; y: 10.6; scale-x: 0.787; scale-y: 0.819; }
        frame 27 { x: 15.7; y: 9.9; scale-x: 0.78; scale-y: 0.829; }
        frame 28 { x: 15.5; y: 10.9; scale-x: 0.789; scale-y: 0.82; }
        frame 29 { x: 15.2; y: 11.8; scale-x: 0.798; scale-y: 0.811; }
        frame 30 { x: 15; y: 12.8; scale-x: 0.807; scale-y: 0.801; }
        frame 31 { x: 14.7; y: 13.8; scale-x: 0.816; scale-y: 0.792; }
        frame 32 { x: 14.5; y: 14.8; scale-x: 0.825; scale-y: 0.783; }
        frame 33 { x: 14.2; y: 15.7; scale-x: 0.834; scale-y: 0.774; }
        frame 34 { x: 14; y: 15.5; scale-x: 0.837; scale-y: 0.773; }
        frame 35 { x: 13.9; y: 15.3; scale-x: 0.839; scale-y: 0.772; }
        frame 36 { x: 13.7; y: 15.2; scale-x: 0.842; scale-y: 0.771; }
        frame 37 { x: 13.9; y: 14.7; scale-x: 0.835; scale-y: 0.776; }
        frame 38 { x: 14.1; y: 14.1; scale-x: 0.828; scale-y: 0.781; }
        frame 39 { x: 14.4; y: 13.6; scale-x: 0.821; scale-y: 0.785; }
        frame 40 { x: 14.6; y: 13; scale-x: 0.814; scale-y: 0.79; }
        frame 41 { x: 14.8; y: 12.5; scale-x: 0.807; scale-y: 0.795; }
        frame 42 { x: 15; y: 11.9; scale-x: 0.8; scale-y: 0.8; }
        frame 43 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 44 { cel: -10000; }
    }
}
