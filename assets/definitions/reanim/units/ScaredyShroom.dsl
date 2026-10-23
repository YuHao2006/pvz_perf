export component ScaredyShroom {
    fps: 12;
    Track {
        source-name: "anim_sleep";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 70 { cel: 0; }
        frame 71 { cel: -10000; }
    }
    Track {
        source-name: "anim_grow";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 60 { cel: 0; }
        frame 61 { cel: -10000; }
        frame 70 { cel: -1; }
        frame 71 { cel: -10000; }
    }
    Track {
        source-name: "anim_scaredidle";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 49 { cel: 0; }
        frame 50 { cel: -10000; }
        frame 60 { cel: -1; }
        frame 61 { cel: -10000; }
    }
    Track {
        source-name: "anim_scared";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 36 { cel: 0; }
        frame 37 { cel: -10000; }
        frame 49 { cel: -1; }
        frame 50 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { cel: 0; }
        frame 22 { cel: -10000; }
        frame 36 { cel: -1; }
        frame 37 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 21 { cel: -1; }
        frame 22 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: 0; }
        frame 2 { cel: -10000; }
        frame 4 { cel: -1; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "ScaredyShroom_head_inner";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 22.5; y: 25.6; scale-x: 0.762; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_HEAD_INNER; }
        frame 6 { x: -10000; y: 25.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 25.4; }
        frame 8 { y: 26; }
        frame 9 { y: 26.5; }
        frame 10 { y: 27.1; }
        frame 11 { y: 27.6; }
        frame 12 { y: 28.2; }
        frame 13 { x: 21.7; y: 29; scale-x: 0.804; scale-y: 0.768; }
        frame 14 { x: 20.8; y: 29.8; scale-x: 0.846; scale-y: 0.736; }
        frame 15 { x: 21.1; y: 29.1; scale-x: 0.832; scale-y: 0.746; }
        frame 16 { x: 21.4; y: 28.4; scale-x: 0.818; scale-y: 0.757; }
        frame 17 { x: 21.6; y: 27.7; scale-x: 0.804; scale-y: 0.768; }
        frame 18 { x: 22; y: 27; scale-x: 0.79; scale-y: 0.779; }
        frame 19 { x: 22.2; y: 26.3; scale-x: 0.776; scale-y: 0.789; }
        frame 20 { x: 22.5; y: 25.6; scale-x: 0.762; scale-y: 0.8; }
        frame 21 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 21.5; y: 26; skew-x: -0.7; skew-y: -1.2; }
        frame 23 { x: 20.5; y: 26.4; skew-x: -1.4; skew-y: -2.4; }
        frame 24 { x: 19.6; y: 26.7; skew-x: -2.2; skew-y: -3.7; }
        frame 25 { x: 18.6; y: 26.9; skew-x: -2.9; skew-y: -4.9; }
        frame 26 { x: 17.7; y: 27.4; skew-x: -3.7; skew-y: -6.2; }
        frame 27 { x: 16.6; y: 27.7; skew-x: -4.4; skew-y: -7.4; scale-y: 0.801; }
        frame 28 { x: 20.9; y: 26.5; skew-x: 2; skew-y: 2.6; scale-x: 0.741; scale-y: 0.799; }
        frame 29 { x: 42.1; y: 24.1; skew-x: 20.4; skew-y: 28.3; scale-x: 0.697; scale-y: 0.794; }
        frame 30 { x: 36.5; y: 24.8; skew-x: 14.3; skew-y: 20.5; scale-x: 0.707; scale-y: -10000; }
        frame 31 { x: 30.9; y: 25.8; skew-x: 8.6; skew-y: 12.8; scale-x: 0.719; scale-y: 0.796; }
        frame 32 { x: 28.8; y: 25.7; skew-x: 6.3; skew-y: 9.5; scale-x: 0.729; scale-y: 0.797; }
        frame 33 { x: 26.7; y: -10000; skew-x: 4.3; skew-y: 6.3; scale-x: 0.74; scale-y: 0.798; }
        frame 34 { x: 24.6; skew-x: 2; skew-y: 3.1; scale-x: 0.751; scale-y: 0.799; }
        frame 35 { x: 22.5; y: 25.6; skew-x: 0; skew-y: 0; scale-x: 0.762; scale-y: 0.8; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { y: 24.6; }
        frame 38 { y: 23.5; }
        frame 39 { y: 22.5; }
        frame 40 { y: -10000; }
        frame 42 { x: 22.4; y: 34; skew-x: 8; skew-y: 7.8; scale-x: 0.795; scale-y: 0.752; }
        frame 43 { x: -10000; y: 45.6; skew-x: 16.1; skew-y: 15.5; scale-x: 0.828; scale-y: 0.704; }
        frame 44 { x: 22.8; y: 57.3; skew-x: 24.2; skew-y: 23.3; scale-x: 0.862; scale-y: 0.656; }
        frame 45 { x: 21.3; y: 59.5; skew-x: 21.8; skew-y: 24.8; scale-x: 0.89; scale-y: 0.598; }
        frame 46 { x: 19.8; y: 61.6; skew-x: 19.7; skew-y: 26.3; scale-x: 0.919; scale-y: 0.542; }
        frame 47 { x: 21.9; y: 55.1; skew-x: 25.3; skew-y: 22.8; scale-x: 0.899; scale-y: 0.702; }
        frame 48 { x: 24.1; y: 48.6; skew-x: 31.2; skew-y: 19.5; scale-x: 0.882; scale-y: 0.863; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 23.9; y: 49.2; skew-x: 30.3; skew-y: 20; scale-x: 0.889; scale-y: 0.854; }
        frame 51 { x: 23.7; y: 49.6; skew-x: 29.6; skew-y: 20.6; scale-x: 0.899; scale-y: 0.848; }
        frame 52 { x: 23.8; y: 48.5; skew-x: 30.1; skew-y: 20.3; scale-x: 0.892; scale-y: 0.852; }
        frame 53 { x: 24; y: 47.3; skew-x: 30.6; skew-y: 19.8; scale-x: 0.887; scale-y: 0.857; }
        frame 54 { x: 24.1; y: 46.1; skew-x: 31.2; skew-y: 19.5; scale-x: 0.882; scale-y: 0.863; }
        frame 55 { x: 24.8; y: 46.2; skew-x: 31.8; skew-y: 20.1; scale-x: 0.859; scale-y: 0.861; }
        frame 56 { x: 25.4; y: 46.3; skew-x: 32.4; skew-y: 20.9; scale-x: 0.838; scale-y: 0.862; }
        frame 57 { x: 25; y: 47; skew-x: 32.1; skew-y: 20.3; scale-x: 0.852; scale-y: 0.861; }
        frame 58 { x: 24.6; y: 48; skew-x: 31.6; skew-y: 19.8; scale-x: 0.866; scale-y: 0.862; }
        frame 59 { x: 24.1; y: 48.6; skew-x: 31.2; skew-y: 19.5; scale-x: 0.882; scale-y: 0.863; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 23.8; y: 51.6; skew-x: 28.8; skew-y: 20.8; scale-x: 0.874; scale-y: 0.793; }
        frame 62 { x: 23.4; y: 54.5; skew-x: 26.5; skew-y: 22; scale-x: 0.868; scale-y: 0.724; }
        frame 63 { x: 22.8; y: 57.3; skew-x: 24.2; skew-y: 23.3; scale-x: 0.862; scale-y: 0.656; }
        frame 64 { x: 22.6; y: 45.6; skew-x: 16.1; skew-y: 15.5; scale-x: 0.828; scale-y: 0.704; }
        frame 65 { x: -10000; y: 34; skew-x: 8; skew-y: 7.8; scale-x: 0.795; scale-y: 0.752; }
        frame 66 { x: 22.5; y: 22.5; skew-x: 0; skew-y: 0; scale-x: 0.762; scale-y: 0.8; }
        frame 67 { x: -10000; y: 23.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { y: 24.6; }
        frame 69 { y: 25.6; }
        frame 70 { x: 27.6; y: 25.5; skew-x: 22.6; skew-y: 22.6; scale-y: 0.799; }
        frame 71 { x: -10000; y: 25.3; skew-x: 23.1; skew-y: 21.8; scale-x: 0.756; scale-y: 0.81; }
        frame 72 { y: 24.9; skew-x: 23.8; skew-y: 21.3; scale-x: 0.751; scale-y: 0.823; }
        frame 73 { y: 25.6; skew-x: 23.6; skew-y: 21.5; scale-x: 0.752; scale-y: 0.818; }
        frame 74 { y: 26.2; skew-x: 23.3; skew-y: 21.8; scale-x: 0.755; scale-y: 0.813; }
        frame 75 { x: 27.5; y: 26.9; skew-x: 23; skew-y: 22; scale-x: 0.757; scale-y: 0.808; }
        frame 76 { x: 27.6; y: 27.5; skew-x: 22.8; skew-y: 22.3; scale-x: 0.759; scale-y: 0.803; }
        frame 77 { x: -10000; y: 28.2; skew-x: 22.6; skew-y: 22.6; scale-x: 0.762; scale-y: 0.799; }
        frame 78 { x: 27.4; y: 28.3; skew-x: 21.8; skew-y: 23.1; scale-x: 0.771; scale-y: 0.792; }
        frame 79 { x: 27.3; y: -10000; skew-x: 21.4; skew-y: 23.8; scale-x: 0.783; scale-y: 0.788; }
        frame 80 { x: -10000; y: 27.8; skew-x: 21.5; skew-y: 23.6; scale-x: 0.779; scale-y: 0.789; }
        frame 81 { y: 27.4; skew-x: 21.8; skew-y: 23.3; scale-x: 0.775; scale-y: 0.79; }
        frame 82 { x: 27.4; y: 27; skew-x: -10000; skew-y: 23.1; scale-x: 0.771; scale-y: 0.792; }
        frame 83 { x: -10000; y: 26.4; skew-x: 22.1; skew-y: 22.8; scale-x: 0.768; scale-y: 0.794; }
        frame 84 { y: 26; skew-x: 22.3; skew-y: -10000; scale-x: 0.764; scale-y: 0.796; }
        frame 85 { x: 27.6; y: 25.5; skew-x: 22.6; skew-y: 22.6; scale-x: 0.762; scale-y: 0.799; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 27.6; y: 35.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_STEM; }
        frame 6 { x: -10000; y: 35.8; scale-x: -10000; scale-y: 0.789; cel: -10000; image: none; }
        frame 7 { y: 36.4; scale-y: 0.777; }
        frame 8 { y: 37; scale-y: 0.766; }
        frame 9 { y: 37.5; scale-y: 0.754; }
        frame 10 { y: 38.1; scale-y: 0.743; }
        frame 11 { y: 38.8; scale-y: 0.732; }
        frame 12 { y: 39.4; scale-y: 0.72; }
        frame 13 { y: 38.9; scale-y: 0.73; }
        frame 14 { y: 38.4; scale-y: 0.74; }
        frame 15 { y: 37.8; scale-y: 0.75; }
        frame 16 { y: 37.3; scale-y: 0.76; }
        frame 17 { y: 36.7; scale-y: 0.77; }
        frame 18 { y: 36.2; scale-y: 0.78; }
        frame 19 { y: 35.6; scale-y: 0.79; }
        frame 20 { y: 35.1; scale-y: 0.8; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 22 { x: 27.2; skew-y: -0.4; }
        frame 23 { x: 26.9; skew-y: -0.9; }
        frame 24 { x: 26.5; skew-y: -1.4; }
        frame 25 { x: 26.2; skew-y: -1.9; scale-y: 0.801; }
        frame 26 { x: 25.8; skew-y: -2.4; scale-y: -10000; }
        frame 27 { x: 25.4; skew-y: -2.9; }
        frame 28 { x: 29.4; y: 35; skew-y: 2.3; scale-y: 0.804; }
        frame 29 { x: 33.5; y: 35.1; skew-y: 7.9; scale-y: 0.808; }
        frame 30 { x: 32.4; y: -10000; skew-y: 6.5; scale-y: 0.806; }
        frame 31 { x: 31.5; skew-y: 5.3; scale-y: 0.805; }
        frame 32 { x: 30.5; skew-y: 3.8; scale-y: 0.804; }
        frame 33 { x: 29.5; y: 35; skew-y: 2.5; scale-y: 0.802; }
        frame 34 { x: 28.5; y: 35.1; skew-y: 1.3; scale-y: 0.801; }
        frame 35 { x: 27.6; y: -10000; skew-y: 0; scale-y: 0.8; }
        frame 36 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 37 { y: 34.4; scale-y: 0.815; }
        frame 38 { y: 33.5; scale-y: 0.83; }
        frame 39 { y: 32.8; scale-y: 0.845; }
        frame 40 { y: 30; scale-y: 0.9; }
        frame 41 { y: 27.2; scale-y: 0.955; }
        frame 42 { y: 35; scale-y: 0.806; }
        frame 43 { y: 43; scale-y: 0.657; }
        frame 44 { y: 50.9; scale-y: 0.508; }
        frame 45 { x: 27; y: 51.9; scale-x: 0.857; scale-y: 0.49; }
        frame 46 { x: 26.4; y: 52.9; scale-x: 0.914; scale-y: 0.471; }
        frame 47 { x: 27; y: 51.9; scale-x: 0.857; scale-y: 0.49; }
        frame 48 { x: 27.6; y: 50.9; scale-x: 0.8; scale-y: 0.508; }
        frame 49 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 64 { y: 43; scale-y: 0.657; }
        frame 65 { y: 35; scale-y: 0.806; }
        frame 66 { y: 27.2; scale-y: 0.955; }
        frame 67 { y: 29.9; scale-y: 0.903; }
        frame 68 { y: 32.5; scale-y: 0.852; }
        frame 69 { y: 35.1; scale-y: 0.8; }
        frame 70 { y: -10000; scale-y: -10000; }
        frame 71 { y: 35.8; scale-y: 0.789; }
        frame 72 { y: 36.4; scale-y: 0.777; }
        frame 73 { y: 37; scale-y: 0.766; }
        frame 74 { y: 37.5; scale-y: 0.754; }
        frame 75 { y: 38.1; scale-y: 0.743; }
        frame 76 { y: 38.8; scale-y: 0.732; }
        frame 77 { y: 39.4; scale-y: 0.72; }
        frame 78 { y: 38.9; scale-y: 0.73; }
        frame 79 { y: 38.4; scale-y: 0.74; }
        frame 80 { y: 37.8; scale-y: 0.75; }
        frame 81 { y: 37.3; scale-y: 0.76; }
        frame 82 { y: 36.7; scale-y: 0.77; }
        frame 83 { y: 36.2; scale-y: 0.78; }
        frame 84 { y: 35.6; scale-y: 0.79; }
        frame 85 { y: 35.1; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_eye2";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { x: 39.4; y: 35; scale-x: 0.8; scale-y: 0.44; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_EYE2; }
        frame 2 { x: -10000; y: 36.5; scale-x: -10000; scale-y: 0.124; cel: -10000; image: none; }
        frame 3 { y: 35; scale-y: 0.44; }
        frame 4 { y: -10000; scale-y: -10000; cel: -1; }
        frame 5 { y: 33.1; scale-y: 0.8; cel: 0; }
        frame 6 { y: 33.4; scale-y: -10000; cel: -10000; }
        frame 7 { y: 33.6; }
        frame 8 { y: 33.9; }
        frame 9 { y: 34.2; }
        frame 10 { y: 34.5; }
        frame 11 { y: 34.7; }
        frame 12 { y: 35; }
        frame 13 { y: 34.8; }
        frame 14 { y: 34.5; }
        frame 15 { y: 34.3; }
        frame 16 { y: 34; }
        frame 17 { y: 33.9; }
        frame 18 { y: 33.6; }
        frame 19 { y: 33.4; }
        frame 20 { y: 33.1; }
        frame 21 { y: -10000; }
        frame 22 { x: 39; skew-y: -0.4; }
        frame 23 { x: 38.6; skew-y: -0.9; }
        frame 24 { x: 38.2; skew-y: -1.4; }
        frame 25 { x: 37.8; skew-y: -1.9; scale-y: 0.801; }
        frame 26 { x: 37.4; skew-y: -2.4; scale-y: -10000; }
        frame 27 { x: 37; skew-y: -2.9; }
        frame 28 { x: 41.3; skew-y: 2.3; scale-y: 0.804; }
        frame 29 { x: 45.5; skew-y: 7.9; scale-y: 0.808; }
        frame 30 { x: 44.5; skew-y: 6.5; scale-y: 0.806; }
        frame 31 { x: 43.5; skew-y: 5.3; scale-y: 0.805; }
        frame 32 { x: 42.5; skew-y: 3.8; scale-y: 0.804; }
        frame 33 { x: 41.5; skew-y: 2.5; scale-y: 0.802; }
        frame 34 { x: 40.4; skew-y: 1.3; scale-y: 0.801; }
        frame 35 { x: 39.4; skew-y: 0; scale-y: 0.8; }
        frame 36 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 37 { x: 39.6; y: 32; scale-x: 0.838; scale-y: 0.901; }
        frame 38 { x: 39.8; y: 30.9; skew-x: 0.3; skew-y: 0.3; scale-x: 0.875; scale-y: 1.001; }
        frame 39 { x: 40; y: 29.9; skew-x: 0.6; skew-y: 0.6; scale-x: 0.913; scale-y: 1.102; }
        frame 40 { x: -10000; y: -10000; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 41 { skew-x: 0.6; skew-y: 0.6; }
        frame 42 { x: 39.9; y: 39.1; skew-x: 0.5; skew-y: 0.5; }
        frame 43 { x: 39.7; y: 52.3; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 39.6; y: 65.3; skew-x: 0.6; skew-y: 0.6; }
        frame 45 { x: 39.5; y: 65; skew-x: 0.5; skew-y: 0.5; scale-x: 0.961; scale-y: 1.128; }
        frame 46 { x: -10000; y: 64.4; skew-x: -10000; skew-y: -10000; scale-x: 1.009; scale-y: 1.153; }
        frame 47 { y: 64; scale-x: 1.056; scale-y: 1.179; }
        frame 48 { x: 39.4; y: 63.4; skew-x: 0.6; skew-y: 0.6; scale-x: 1.104; scale-y: 1.205; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { skew-x: 0.5; skew-y: 0.5; }
        frame 51 { skew-x: -10000; skew-y: -10000; }
        frame 54 { skew-x: 0.6; skew-y: 0.6; }
        frame 55 { skew-x: 0.5; skew-y: 0.5; }
        frame 56 { skew-x: -10000; skew-y: -10000; }
        frame 59 { skew-x: 0.6; skew-y: 0.6; }
        frame 60 { skew-x: -10000; skew-y: -10000; }
        frame 61 { x: 39.5; y: 64.1; skew-x: 0.5; skew-y: 0.5; scale-x: 1.04; scale-y: 1.171; }
        frame 62 { x: -10000; y: 64.7; skew-x: -10000; skew-y: -10000; scale-x: 0.977; scale-y: 1.136; }
        frame 63 { x: 39.6; y: 65.3; skew-x: 0.6; skew-y: 0.6; scale-x: 0.913; scale-y: 1.102; }
        frame 64 { x: 39.8; y: 53.5; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 39.9; y: 41.6; skew-x: -10000; skew-y: -10000; }
        frame 66 { x: 40; y: 29.9; skew-x: 0.6; skew-y: 0.6; }
        frame 67 { x: 39.8; y: 31; skew-x: 0.3; skew-y: 0.3; scale-x: 0.875; scale-y: 1.001; }
        frame 68 { x: 39.6; y: 32.1; skew-x: 0; skew-y: 0; scale-x: 0.838; scale-y: 0.901; }
        frame 69 { x: 39.4; y: 33.1; skew-x: -10000; skew-y: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { y: 33.4; }
        frame 72 { y: 33.6; }
        frame 73 { y: 33.9; }
        frame 74 { y: 34.2; }
        frame 75 { y: 34.5; }
        frame 76 { y: 34.7; }
        frame 77 { y: 35; }
        frame 78 { y: 34.8; }
        frame 79 { y: 34.5; }
        frame 80 { y: 34.3; }
        frame 81 { y: 34; }
        frame 82 { y: 33.9; }
        frame 83 { y: 33.6; }
        frame 84 { y: 33.4; }
        frame 85 { y: 33.1; }
    }
    Track {
        source-name: "ScaredyShroom_eye_big2";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 49 { x: 40.3; y: 64.5; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_EYE_BIG; }
        frame 50 { x: -10000; y: 64; scale-x: 0.726; scale-y: 0.726; cel: -10000; image: none; }
        frame 51 { y: 63.5; scale-x: 0.752; scale-y: 0.752; }
        frame 52 { y: 64; scale-x: 0.726; scale-y: 0.726; }
        frame 53 { y: 64.5; scale-x: 0.7; scale-y: 0.7; }
        frame 54 { y: 64; scale-x: 0.726; scale-y: 0.726; }
        frame 55 { y: 63.5; scale-x: 0.752; scale-y: 0.752; }
        frame 56 { y: 64; scale-x: 0.726; scale-y: 0.726; }
        frame 57 { y: 64.5; scale-x: 0.7; scale-y: 0.7; }
        frame 58 { y: 64; scale-x: 0.726; scale-y: 0.726; }
        frame 59 { y: 63.5; scale-x: 0.752; scale-y: 0.752; }
        frame 60 { y: 64.5; scale-x: 0.7; scale-y: 0.7; }
        frame 61 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 63 { cel: -1; }
        frame 64 { cel: -10000; }
    }
    Track {
        source-name: "ScaredyShroom_mouth";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 38.5; y: 43.6; scale-x: 1.6; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_MOUTH; }
        frame 6 { x: -10000; y: 43.9; skew-x: -3; scale-x: 1.605; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 44.3; skew-x: -6.3; scale-x: 1.61; }
        frame 8 { y: 44.5; skew-x: -4.9; scale-x: 1.608; }
        frame 9 { y: 44.8; skew-x: -3.7; scale-x: 1.606; }
        frame 10 { y: 45; skew-x: -2.4; scale-x: 1.604; }
        frame 11 { y: 45.3; skew-x: -1.2; scale-x: 1.602; }
        frame 12 { y: 45.5; skew-x: 0; scale-x: 1.6; }
        frame 13 { y: 45.4; skew-x: 3.1; scale-x: 1.605; }
        frame 14 { y: 45.2; skew-x: 6.4; scale-x: 1.61; }
        frame 15 { y: 45; skew-x: 5.3; scale-x: 1.608; }
        frame 16 { y: 44.7; skew-x: 4.3; scale-x: 1.606; }
        frame 17 { y: 44.5; skew-x: 3.1; scale-x: 1.605; }
        frame 18 { y: 44.2; skew-x: 2; scale-x: 1.603; }
        frame 19 { y: 43.9; skew-x: 1; scale-x: 1.602; }
        frame 20 { y: 43.6; skew-x: 0; scale-x: 1.6; }
        frame 21 { y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 22 { x: 38.2; skew-y: -0.4; scale-x: 1.413; }
        frame 23 { x: 38; skew-y: -0.9; scale-x: 1.227; }
        frame 24 { x: 37.7; y: 43.5; skew-y: -1.4; scale-x: 1.04; }
        frame 25 { x: 37.5; y: 43.6; skew-y: -1.9; scale-x: 0.853; scale-y: 0.801; }
        frame 26 { x: 37.2; y: -10000; skew-y: -2.4; scale-x: 0.667; scale-y: -10000; }
        frame 27 { x: 37; skew-y: -2.9; scale-x: 0.48; }
        frame 28 { x: 40.1; y: 44.4; skew-y: 2.3; scale-x: 1.777; scale-y: 0.689; }
        frame 29 { x: 43.4; y: 45.1; skew-y: 7.9; scale-x: 3.074; scale-y: 0.576; }
        frame 30 { x: 42.6; y: 44.9; skew-y: 6.5; scale-x: 2.828; scale-y: 0.613; }
        frame 31 { x: 41.9; y: 44.6; skew-y: 5.3; scale-x: 2.583; scale-y: 0.651; }
        frame 32 { x: 41.1; y: 44.4; skew-y: 3.8; scale-x: 2.337; scale-y: 0.688; }
        frame 33 { x: 40.4; y: 44; skew-y: 2.5; scale-x: 2.091; scale-y: 0.725; }
        frame 34 { x: 39.5; y: 43.9; skew-y: 1.3; scale-x: 1.846; scale-y: 0.763; }
        frame 35 { x: 38.5; y: 43.6; skew-y: 0; scale-x: 1.6; scale-y: 0.8; }
        frame 36 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { skew-x: -1.4; scale-x: 1.522; }
        frame 38 { x: 38.4; skew-x: -3.2; scale-x: 1.443; }
        frame 39 { x: -10000; skew-x: -4.9; scale-x: 1.365; }
        frame 40 { y: 43.5; skew-x: -6.9; scale-x: 1.371; }
        frame 41 { y: -10000; skew-x: -9; scale-x: 1.377; }
        frame 42 { y: 51; skew-x: -7.5; scale-x: 1.372; }
        frame 43 { x: 38.3; y: 57; skew-x: -6.2; scale-x: 1.368; }
        frame 44 { x: 38.4; y: 63; skew-x: -4.9; scale-x: 1.365; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; cel: -1; }
        frame 46 { cel: -10000; }
        frame 63 { cel: 0; }
        frame 64 { y: 56.5; skew-x: -6.2; scale-x: 1.369; cel: -10000; }
        frame 65 { y: 50; skew-x: -7.5; scale-x: 1.372; }
        frame 66 { y: 43.5; skew-x: -9; scale-x: 1.377; }
        frame 67 { y: -10000; skew-x: -5.9; scale-x: 1.451; }
        frame 68 { x: 38.5; y: 43.6; skew-x: -2.9; scale-x: 1.525; }
        frame 69 { x: -10000; y: -10000; skew-x: 0; scale-x: 1.6; }
        frame 70 { skew-x: -10000; scale-x: -10000; }
        frame 71 { y: 43.9; skew-x: -3; scale-x: 1.605; }
        frame 72 { y: 44.3; skew-x: -6.3; scale-x: 1.61; }
        frame 73 { y: 44.5; skew-x: -4.9; scale-x: 1.608; }
        frame 74 { y: 44.8; skew-x: -3.7; scale-x: 1.606; }
        frame 75 { y: 45; skew-x: -2.4; scale-x: 1.604; }
        frame 76 { y: 45.3; skew-x: -1.2; scale-x: 1.602; }
        frame 77 { y: 45.5; skew-x: 0; scale-x: 1.6; }
        frame 78 { y: 45.4; skew-x: 3.1; scale-x: 1.605; }
        frame 79 { y: 45.2; skew-x: 6.4; scale-x: 1.61; }
        frame 80 { y: 45; skew-x: 5.3; scale-x: 1.608; }
        frame 81 { y: 44.7; skew-x: 4.3; scale-x: 1.606; }
        frame 82 { y: 44.5; skew-x: 3.1; scale-x: 1.605; }
        frame 83 { y: 44.2; skew-x: 2; scale-x: 1.603; }
        frame 84 { y: 43.9; skew-x: 1; scale-x: 1.602; }
        frame 85 { y: 43.6; skew-x: 0; scale-x: 1.6; }
    }
    Track {
        source-name: "ScaredyShroom_lips";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 43.5; y: 39.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_LIPS; }
        frame 6 { x: 43.1; y: 39.6; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: 0.771; cel: -10000; image: none; }
        frame 7 { x: 42.9; y: -10000; skew-x: -4.2; skew-y: -4.2; scale-y: 0.742; }
        frame 8 { x: 43; y: 40; skew-x: -3.2; skew-y: -3.2; scale-y: 0.753; }
        frame 9 { x: 43.1; y: 40.4; skew-x: -2.4; skew-y: -2.4; scale-y: 0.765; }
        frame 10 { x: 43.2; y: 40.6; skew-x: -1.5; skew-y: -1.5; scale-y: 0.777; }
        frame 11 { x: 43.4; y: 41; skew-x: -0.7; skew-y: -0.7; scale-y: 0.788; }
        frame 12 { x: 43.5; y: 41.5; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 13 { x: 43.7; y: 42.4; skew-x: 2.3; skew-y: 2.3; scale-y: 0.779; }
        frame 14 { x: 43.9; y: 43.1; skew-x: 4.8; skew-y: 4.8; scale-y: 0.758; }
        frame 15 { x: 43.8; y: 42.6; skew-x: 4; skew-y: 4; scale-y: 0.765; }
        frame 16 { x: -10000; y: 42; skew-x: 3.1; skew-y: 3.1; scale-y: 0.772; }
        frame 17 { x: 43.6; y: 41.4; skew-x: 2.3; skew-y: 2.3; scale-y: 0.779; }
        frame 18 { x: -10000; y: 40.7; skew-x: 1.5; skew-y: 1.5; scale-y: 0.786; }
        frame 19 { x: 43.5; y: 40.1; skew-x: 0.8; skew-y: 0.8; scale-y: 0.793; }
        frame 20 { x: -10000; y: 39.5; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 21 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 22 { x: 42.5; y: 39.3; skew-y: -0.4; scale-x: 0.769; scale-y: 0.818; }
        frame 23 { x: 41.5; y: 39.1; skew-y: -0.9; scale-x: 0.737; scale-y: 0.835; }
        frame 24 { x: 40.5; y: 38.9; skew-y: -1.4; scale-x: 0.706; scale-y: 0.853; }
        frame 25 { x: 39.6; y: 38.8; skew-y: -1.9; scale-x: 0.674; scale-y: 0.87; }
        frame 26 { x: 38.5; y: 38.5; skew-y: -2.4; scale-x: 0.643; scale-y: 0.888; }
        frame 27 { x: 37.6; y: 38.3; skew-y: -2.9; scale-x: 0.611; scale-y: 0.905; }
        frame 28 { x: 45.4; y: 40; skew-y: -1.4; scale-x: 0.706; scale-y: 0.766; }
        frame 29 { x: 53; y: 41.6; skew-y: 0; scale-x: 0.8; scale-y: 0.627; }
        frame 30 { x: 51.4; y: 41.3; skew-y: -10000; scale-x: -10000; scale-y: 0.656; }
        frame 31 { x: 49.8; y: 40.9; scale-y: 0.685; }
        frame 32 { x: 48.3; y: 40.5; scale-y: 0.714; }
        frame 33 { x: 46.7; y: 40.2; scale-y: 0.742; }
        frame 34 { x: 45.1; y: 39.9; scale-y: 0.771; }
        frame 35 { x: 43.5; y: 39.5; scale-y: 0.8; }
        frame 36 { x: -10000; y: -10000; scale-y: -10000; }
        frame 37 { x: 43; y: 39; scale-y: 0.821; }
        frame 38 { x: 42.5; y: 38.5; scale-y: 0.842; }
        frame 39 { x: 42; y: 38; scale-y: 0.862; }
        frame 40 { x: -10000; y: 37.6; skew-x: -1.9; scale-x: 0.801; scale-y: -10000; }
        frame 41 { y: 37.1; skew-x: -4; scale-x: 0.802; }
        frame 42 { x: 41.8; y: 44.8; skew-x: -2.7; scale-x: 0.801; }
        frame 43 { x: 41.9; y: 49.5; skew-x: -1.2; scale-x: -10000; }
        frame 44 { x: 42; y: 54.3; skew-x: 0; scale-x: 0.8; }
        frame 45 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; cel: -1; }
        frame 46 { cel: -10000; }
        frame 63 { cel: 0; }
        frame 64 { x: 42; y: 48.5; skew-x: -1.2; scale-x: 0.801; cel: -10000; }
        frame 65 { x: -10000; y: 42.9; skew-x: -2.7; scale-x: -10000; }
        frame 66 { x: 42; y: 37.1; skew-x: -4; scale-x: 0.802; }
        frame 67 { x: 42.5; y: 38; skew-x: -2.7; scale-x: 0.801; scale-y: 0.842; }
        frame 68 { x: 43; y: 38.8; skew-x: -1.2; scale-x: -10000; scale-y: 0.821; }
        frame 69 { x: 43.5; y: 39.5; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 43.1; y: 39.6; skew-x: -1.9; skew-y: -1.9; scale-y: 0.771; }
        frame 72 { x: 42.9; y: -10000; skew-x: -4.2; skew-y: -4.2; scale-y: 0.742; }
        frame 73 { x: 43; y: 40; skew-x: -3.2; skew-y: -3.2; scale-y: 0.753; }
        frame 74 { x: 43.1; y: 40.4; skew-x: -2.4; skew-y: -2.4; scale-y: 0.765; }
        frame 75 { x: 43.2; y: 40.6; skew-x: -1.5; skew-y: -1.5; scale-y: 0.777; }
        frame 76 { x: 43.4; y: 41; skew-x: -0.7; skew-y: -0.7; scale-y: 0.788; }
        frame 77 { x: 43.5; y: 41.5; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 78 { x: 43.7; y: 42.4; skew-x: 2.3; skew-y: 2.3; scale-y: 0.779; }
        frame 79 { x: 43.9; y: 43.1; skew-x: 4.8; skew-y: 4.8; scale-y: 0.758; }
        frame 80 { x: 43.8; y: 42.6; skew-x: 4; skew-y: 4; scale-y: 0.765; }
        frame 81 { x: -10000; y: 42; skew-x: 3.1; skew-y: 3.1; scale-y: 0.772; }
        frame 82 { x: 43.6; y: 41.4; skew-x: 2.3; skew-y: 2.3; scale-y: 0.779; }
        frame 83 { x: -10000; y: 40.7; skew-x: 1.5; skew-y: 1.5; scale-y: 0.786; }
        frame 84 { x: 43.5; y: 40.1; skew-x: 0.8; skew-y: 0.8; scale-y: 0.793; }
        frame 85 { x: -10000; y: 39.5; skew-x: 0; skew-y: 0; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_eye1";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { x: 33.4; y: 36.6; scale-x: 0.8; scale-y: 0.44; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_EYE1; }
        frame 2 { x: 33.3; y: 38.4; skew-x: -4.2; skew-y: -4.2; scale-x: -10000; scale-y: 0.124; cel: -10000; image: none; }
        frame 3 { x: 33.4; y: 36.6; skew-x: 0; skew-y: 0; scale-y: 0.44; }
        frame 4 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 5 { y: 34.9; scale-y: 0.8; cel: 0; }
        frame 6 { y: 35.1; scale-y: -10000; cel: -10000; }
        frame 7 { y: 35.4; }
        frame 8 { y: 35.6; }
        frame 9 { y: 35.9; }
        frame 10 { y: 36.1; }
        frame 11 { y: 36.4; }
        frame 12 { y: 36.6; }
        frame 13 { y: 36.5; }
        frame 14 { y: 36.2; }
        frame 15 { y: 36; }
        frame 16 { y: 35.8; }
        frame 17 { y: 35.5; }
        frame 18 { y: 35.3; }
        frame 19 { y: 35.1; }
        frame 20 { y: 34.9; }
        frame 21 { y: -10000; }
        frame 22 { x: 33; skew-y: -0.4; }
        frame 23 { x: 32.5; skew-y: -0.9; }
        frame 24 { x: 32.3; y: 34.8; skew-y: -1.4; }
        frame 25 { x: 31.9; y: 34.9; skew-y: -1.9; scale-y: 0.801; }
        frame 26 { x: 31.5; y: -10000; skew-y: -2.4; scale-y: -10000; }
        frame 27 { x: 31.1; skew-y: -2.9; }
        frame 28 { x: 35.1; skew-y: 2.3; scale-y: 0.804; }
        frame 29 { x: 39.3; skew-y: 7.9; scale-y: 0.808; }
        frame 30 { x: 38.3; skew-y: 6.5; scale-y: 0.806; }
        frame 31 { x: 37.3; skew-y: 5.3; scale-y: 0.805; }
        frame 32 { x: 36.3; skew-y: 3.8; scale-y: 0.804; }
        frame 33 { x: 35.3; skew-y: 2.5; scale-y: 0.802; }
        frame 34 { x: 34.3; skew-y: 1.3; scale-y: 0.801; }
        frame 35 { x: 33.4; skew-y: 0; scale-y: 0.8; }
        frame 36 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 37 { x: 33.3; y: 34; scale-x: 0.838; scale-y: 0.901; }
        frame 38 { x: -10000; y: 33; skew-x: 0.3; skew-y: 0.3; scale-x: 0.875; scale-y: 1.001; }
        frame 39 { x: 33.1; y: 32.2; skew-x: 0.6; skew-y: 0.6; scale-x: 0.913; scale-y: 1.102; }
        frame 40 { x: 33.2; y: 32.1; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 33.1; y: 32.2; skew-x: 0.6; skew-y: 0.6; }
        frame 42 { x: 33; y: 41.4; skew-x: 0.5; skew-y: 0.5; }
        frame 43 { x: 32.9; y: 53.9; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 32.7; y: 66.5; skew-x: 0.6; skew-y: 0.6; }
        frame 45 { x: 32.4; y: 65.9; skew-x: 0.5; skew-y: 0.5; scale-x: 0.962; scale-y: 1.16; }
        frame 46 { x: 32; y: 65.3; skew-x: -10000; skew-y: -10000; scale-x: 1.01; scale-y: 1.219; }
        frame 47 { x: 31.6; y: 64.8; scale-x: 1.059; scale-y: 1.277; }
        frame 48 { x: 31.2; y: 64.3; skew-x: 0.6; skew-y: 0.6; scale-x: 1.107; scale-y: 1.336; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { skew-x: 0.5; skew-y: 0.5; }
        frame 51 { skew-x: -10000; skew-y: -10000; }
        frame 54 { skew-x: 0.6; skew-y: 0.6; }
        frame 55 { skew-x: 0.5; skew-y: 0.5; }
        frame 56 { skew-x: -10000; skew-y: -10000; }
        frame 59 { skew-x: 0.6; skew-y: 0.6; }
        frame 60 { skew-x: -10000; skew-y: -10000; }
        frame 61 { x: 31.7; y: 65; skew-x: 0.5; skew-y: 0.5; scale-x: 1.043; scale-y: 1.258; }
        frame 62 { x: 32.1; y: 65.7; skew-x: -10000; skew-y: -10000; scale-x: 0.978; scale-y: 1.18; }
        frame 63 { x: 32.7; y: 66.5; skew-x: 0.6; skew-y: 0.6; scale-x: 0.913; scale-y: 1.102; }
        frame 64 { x: 32.9; y: 55; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 33; y: 43.5; skew-x: -10000; skew-y: -10000; }
        frame 66 { x: 33.1; y: 32.2; skew-x: 0.6; skew-y: 0.6; }
        frame 67 { x: 33.3; y: 33.1; skew-x: 0.3; skew-y: 0.3; scale-x: 0.875; scale-y: 1.001; }
        frame 68 { x: 33.2; y: 34; skew-x: 0; skew-y: 0; scale-x: 0.838; scale-y: 0.901; }
        frame 69 { x: 33.4; y: 34.9; skew-x: -10000; skew-y: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 70 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { y: 35.1; }
        frame 72 { y: 35.4; }
        frame 73 { y: 35.6; }
        frame 74 { y: 35.9; }
        frame 75 { y: 36.1; }
        frame 76 { y: 36.4; }
        frame 77 { y: 36.6; }
        frame 78 { y: 36.5; }
        frame 79 { y: 36.2; }
        frame 80 { y: 36; }
        frame 81 { y: 35.8; }
        frame 82 { y: 35.5; }
        frame 83 { y: 35.3; }
        frame 84 { y: 35.1; }
        frame 85 { y: 34.9; }
    }
    Track {
        source-name: "ScaredyShroom_eye_big1";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 49 { x: 31.3; y: 64; scale-x: 0.91; scale-y: 0.91; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_EYE_BIG; }
        frame 50 { x: 30.9; y: 63.6; scale-x: 0.944; scale-y: 0.944; cel: -10000; image: none; }
        frame 51 { x: 30.6; y: 63; scale-x: 0.978; scale-y: 0.978; }
        frame 52 { x: 31; y: 63.5; scale-x: 0.944; scale-y: 0.944; }
        frame 53 { x: 31.3; y: 64; scale-x: 0.91; scale-y: 0.91; }
        frame 54 { x: 30.9; y: 63.6; scale-x: 0.944; scale-y: 0.944; }
        frame 55 { x: 30.6; y: 63; scale-x: 0.978; scale-y: 0.978; }
        frame 56 { x: 31; y: 63.5; scale-x: 0.944; scale-y: 0.944; }
        frame 57 { x: 31.3; y: 64; scale-x: 0.91; scale-y: 0.91; }
        frame 58 { x: 30.9; y: 63.6; scale-x: 0.944; scale-y: 0.944; }
        frame 59 { x: 30.6; y: 63; scale-x: 0.978; scale-y: 0.978; }
        frame 60 { x: 31.3; y: 64; scale-x: 0.91; scale-y: 0.91; }
        frame 61 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 63 { cel: -1; }
        frame 64 { cel: -10000; }
    }
    Track {
        source-name: "ScaredyShroom_head";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 5.2; y: 6.6; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_HEAD; }
        frame 6 { x: -10000; y: 6.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 6.3; }
        frame 8 { y: 6.9; }
        frame 9 { y: 7.5; }
        frame 10 { y: 8; }
        frame 11 { y: 8.6; }
        frame 12 { y: 9.1; }
        frame 13 { x: 4.4; y: 10.3; scale-x: 0.827; scale-y: 0.779; }
        frame 14 { x: 3.5; y: 11.4; scale-x: 0.854; scale-y: 0.758; }
        frame 15 { x: 3.8; y: 10.6; scale-x: 0.845; scale-y: 0.765; }
        frame 16 { x: 4.1; y: 9.7; scale-x: 0.836; scale-y: 0.772; }
        frame 17 { x: 4.3; y: 8.9; scale-x: 0.827; scale-y: 0.779; }
        frame 18 { x: 4.6; y: 8.2; scale-x: 0.818; scale-y: 0.786; }
        frame 19 { x: 4.9; y: 7.3; scale-x: 0.809; scale-y: 0.793; }
        frame 20 { x: 5.2; y: 6.6; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 3.8; y: 7.2; skew-x: -0.7; skew-y: -1.2; }
        frame 23 { x: 2.4; y: 7.8; skew-x: -1.4; skew-y: -2.4; }
        frame 24 { x: 1.1; y: 8.3; skew-x: -2.2; skew-y: -3.7; }
        frame 25 { x: -0.2; y: 9; skew-x: -2.9; skew-y: -4.9; }
        frame 26 { x: -1.6; y: 9.5; skew-x: -3.7; skew-y: -6.2; }
        frame 27 { x: -2.9; y: 10.2; skew-x: -4.4; skew-y: -7.4; scale-y: 0.801; }
        frame 28 { x: 3.1; y: 7.7; skew-x: -1; skew-y: -0.7; scale-x: 0.777; scale-y: 0.83; }
        frame 29 { x: 26.6; y: 3.1; skew-x: 14.3; skew-y: 21.7; scale-x: 0.838; scale-y: 0.801; }
        frame 30 { x: 24.1; y: 3.8; skew-x: 11; skew-y: 16.8; scale-x: 0.769; scale-y: 0.826; }
        frame 31 { x: 21.7; y: 4.3; skew-x: 8; skew-y: 11.8; scale-x: 0.7; scale-y: 0.853; }
        frame 32 { x: 17.5; y: 4.7; skew-x: 6; skew-y: 8.8; scale-x: 0.725; scale-y: 0.839; }
        frame 33 { x: 13.4; y: 5.2; skew-x: 4; skew-y: 5.8; scale-x: 0.75; scale-y: 0.826; }
        frame 34 { x: 9.3; y: 5.9; skew-x: 2; skew-y: 2.8; scale-x: 0.775; scale-y: 0.813; }
        frame 35 { x: 5.2; y: 6.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { y: 5.6; }
        frame 38 { y: 4.7; }
        frame 39 { y: 3.7; }
        frame 40 { y: 2.6; scale-y: 0.812; }
        frame 41 { y: 1.6; scale-y: 0.823; }
        frame 42 { x: 8.6; y: 11; skew-x: 8.5; skew-y: 8.8; scale-x: 0.823; scale-y: 0.815; }
        frame 43 { x: 12.5; y: 20.6; skew-x: 17; skew-y: 17.5; scale-x: 0.847; scale-y: 0.806; }
        frame 44 { x: 16.8; y: 30.7; skew-x: 25.7; skew-y: 26.4; scale-x: 0.871; scale-y: 0.799; }
        frame 45 { x: 13.2; y: 33.6; skew-x: 23.1; skew-y: 26.3; scale-x: 0.919; scale-y: 0.743; }
        frame 46 { x: 9.4; y: 36.9; skew-x: 20.5; skew-y: -10000; scale-x: 0.969; scale-y: 0.69; }
        frame 47 { x: 13.1; y: 32.6; skew-x: 23.1; scale-x: 0.919; scale-y: 0.743; }
        frame 48 { x: 16.8; y: 28.3; skew-x: 25.7; skew-y: 26.4; scale-x: 0.871; scale-y: 0.799; alpha: 0; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 50 { cel: -10000; }
        frame 61 { x: 18.8; y: 29.3; skew-x: 25.6; skew-y: 26.3; scale-x: 0.799; cel: 0; alpha: 1; }
        frame 62 { x: 17.9; y: 30.1; skew-x: -10000; skew-y: -10000; scale-x: 0.834; scale-y: 0.798; cel: -10000; alpha: -10000; }
        frame 63 { x: 16.8; y: 30.7; skew-x: 25.7; skew-y: 26.4; scale-x: 0.871; scale-y: 0.799; }
        frame 64 { x: 12.6; y: 20.7; skew-x: 17; skew-y: 17.5; scale-x: 0.847; scale-y: 0.806; }
        frame 65 { x: 8.8; y: 11.1; skew-x: 8.5; skew-y: 8.8; scale-x: 0.823; scale-y: 0.815; }
        frame 66 { x: 5.2; y: 1.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.823; }
        frame 67 { x: -10000; y: 3.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.815; }
        frame 68 { y: 4.9; scale-y: 0.808; }
        frame 69 { y: 6.6; scale-y: 0.8; }
        frame 70 { x: 17.7; y: 2.3; skew-x: 20.3; skew-y: 20.3; scale-x: 0.799; scale-y: 0.799; }
        frame 71 { x: 17.9; y: 1.5; skew-x: 20.8; skew-y: 19.6; scale-x: 0.792; scale-y: 0.811; }
        frame 72 { x: 18.1; y: 0.6; skew-x: 21.5; skew-y: 19.1; scale-x: 0.787; scale-y: 0.824; }
        frame 73 { x: 17.9; y: 1.5; skew-x: 21.1; skew-y: 19.3; scale-x: 0.788; scale-y: 0.818; }
        frame 74 { x: -10000; y: 2.3; skew-x: 20.8; skew-y: 19.5; scale-x: 0.791; scale-y: 0.813; }
        frame 75 { x: 17.8; y: 3.1; skew-x: 20.6; skew-y: 19.8; scale-x: 0.793; scale-y: 0.808; }
        frame 76 { x: -10000; y: 3.9; skew-x: 20.3; skew-y: 20; scale-x: 0.795; scale-y: 0.803; }
        frame 77 { x: 17.7; y: 4.6; skew-x: -10000; skew-y: 20.3; scale-x: 0.799; scale-y: 0.799; }
        frame 78 { x: 17.4; y: 5; skew-x: 19.6; skew-y: 20.8; scale-x: 0.81; scale-y: 0.791; }
        frame 79 { x: 17.1; y: 5.3; skew-x: 19.2; skew-y: 21.4; scale-x: 0.823; scale-y: 0.786; }
        frame 80 { x: 17.2; y: 4.8; skew-x: 19.3; skew-y: 21.1; scale-x: 0.818; scale-y: 0.787; }
        frame 81 { x: 17.4; y: 4.3; skew-x: 19.5; skew-y: 21; scale-x: 0.814; scale-y: 0.789; }
        frame 82 { x: 17.5; y: 3.9; skew-x: 19.6; skew-y: 20.8; scale-x: 0.81; scale-y: 0.791; }
        frame 83 { x: -10000; y: 3.4; skew-x: 19.8; skew-y: 20.6; scale-x: 0.806; scale-y: 0.794; }
        frame 84 { x: 17.6; y: 2.9; skew-x: 20; skew-y: 20.3; scale-x: 0.802; scale-y: 0.796; }
        frame 85 { x: 17.7; y: 2.3; skew-x: 20.3; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "ScaredyShroom_head2";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 46 { x: 14.8; y: 36.8; skew-x: 23.4; skew-y: 33.4; scale-x: 0.909; scale-y: 0.74; cel: 0; alpha: 0.27; image: IMAGE_REANIM_SCAREDYSHROOM_HEAD2; }
        frame 47 { x: 17.8; y: 32.5; skew-x: 25.5; skew-y: 32; scale-x: 0.871; scale-y: 0.779; cel: -10000; alpha: 1; image: none; }
        frame 48 { x: 21; y: 28.4; skew-x: 27.7; skew-y: 30.7; scale-x: 0.833; scale-y: 0.82; alpha: -10000; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 20.8; y: 29.1; skew-x: 27.1; skew-y: 31.6; scale-x: 0.843; scale-y: 0.815; }
        frame 51 { x: 20.5; y: 29.9; skew-x: 26.4; skew-y: 32.4; scale-x: 0.852; scale-y: 0.813; }
        frame 52 { x: 20.8; y: 28.6; skew-x: 26.9; skew-y: 31.9; scale-x: 0.845; scale-y: 0.815; }
        frame 53 { x: -10000; y: 27.3; skew-x: 27.4; skew-y: 31.3; scale-x: 0.84; scale-y: 0.816; }
        frame 54 { x: 21; y: 26; skew-x: 27.7; skew-y: 30.7; scale-x: 0.833; scale-y: 0.82; }
        frame 55 { x: 21.3; y: 24.8; skew-x: 29.2; skew-y: 29.5; scale-x: 0.821; scale-y: -10000; }
        frame 56 { x: 21.4; y: 23.5; skew-x: 30.5; skew-y: 28.2; scale-x: 0.81; scale-y: 0.821; }
        frame 57 { x: 21.3; y: 25.2; skew-x: 29.6; skew-y: 29.1; scale-x: 0.817; scale-y: 0.82; }
        frame 58 { x: 21.2; y: 26.8; skew-x: 28.7; skew-y: 30; scale-x: 0.825; scale-y: 0.819; }
        frame 59 { x: 21; y: 28.4; skew-x: 27.7; skew-y: 30.7; scale-x: 0.833; scale-y: 0.82; }
        frame 60 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 21.1; y: 29.3; skew-x: 27.8; skew-y: 30.8; scale-y: 0.819; alpha: 0.67; }
        frame 62 { x: -10000; y: 30.2; skew-x: -10000; skew-y: -10000; scale-y: -10000; alpha: 0.33; }
        frame 63 { x: 21; y: 31.1; skew-x: 27.7; skew-y: 30.7; scale-y: 0.82; alpha: 0; }
        frame 64 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; alpha: -10000; }
        frame 66 { cel: -1; }
        frame 67 { cel: -10000; }
    }
    Track {
        source-name: "ScaredyShroom_eyebrow1";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 28.2; y: 30; scale-x: 1.018; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_EYEBROW1; }
        frame 6 { x: 28; y: 30.2; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 27.8; y: 30.4; skew-x: -9.7; skew-y: -9.7; }
        frame 8 { x: 27.7; y: 30.7; skew-x: -14.9; skew-y: -14.9; }
        frame 9 { x: 27.8; y: 32; skew-x: -14.7; skew-y: -14.7; scale-x: 1.017; scale-y: 0.799; }
        frame 10 { x: -10000; y: 33.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { y: 34.5; }
        frame 12 { x: 27.7; y: 35.8; skew-x: -14.9; skew-y: -14.9; scale-x: 1.018; scale-y: 0.8; }
        frame 13 { x: 27.9; y: 35; skew-x: -5.4; skew-y: -5.4; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 28.3; y: 34.3; skew-x: 3.9; skew-y: 3.9; }
        frame 15 { x: -10000; y: 33.5; skew-x: 3.3; skew-y: 3.3; scale-x: 1.017; scale-y: 0.799; }
        frame 16 { y: 32.8; skew-x: 2.5; skew-y: 2.5; scale-x: 1.018; scale-y: 0.8; }
        frame 17 { x: 28.2; y: 32.1; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 28.3; y: 31.4; skew-x: 1.3; skew-y: 1.3; }
        frame 19 { x: -10000; y: 30.7; skew-x: 0.5; skew-y: 0.5; }
        frame 20 { x: 28.2; y: 30; skew-x: 0; skew-y: 0; }
        frame 21 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 22 { x: 27.4; y: 29.9; skew-x: -1; skew-y: -1.5; }
        frame 23 { x: 26.5; y: 29.8; skew-x: -2.2; skew-y: -3.2; }
        frame 24 { x: 25.7; y: -10000; skew-x: -3.4; skew-y: -4.9; }
        frame 25 { x: 24.9; y: 29.7; skew-x: -4.7; skew-y: -6.7; }
        frame 26 { x: 24; y: 29.6; skew-x: -5.9; skew-y: -8.4; scale-x: 1.017; }
        frame 27 { x: 23.1; y: 29.5; skew-x: -7.2; skew-y: -10.2; scale-x: 1.018; scale-y: 0.801; }
        frame 28 { x: 25.1; y: 31.5; skew-x: -10; skew-y: -10.4; scale-x: 1.023; scale-y: 0.797; }
        frame 29 { x: 38; y: 34.9; skew-x: 10.9; skew-y: 18.6; scale-x: 1.041; scale-y: 0.787; }
        frame 30 { x: 36.5; y: 35; skew-x: 7.8; skew-y: 13.6; scale-x: 1.037; scale-y: 0.789; }
        frame 31 { x: 35.1; y: 35.1; skew-x: 4.8; skew-y: 8.8; scale-x: 1.033; scale-y: 0.791; }
        frame 32 { x: 33.5; y: 33.9; skew-x: 3.5; skew-y: 6.5; scale-x: 1.029; scale-y: 0.793; }
        frame 33 { x: 31.7; y: 32.5; skew-x: 2.3; skew-y: 4.3; scale-x: 1.026; scale-y: 0.795; }
        frame 34 { x: 30; y: 31.4; skew-x: 1; skew-y: 2.1; scale-x: 1.022; scale-y: 0.798; }
        frame 35 { x: 28.2; y: 30; skew-x: 0; skew-y: 0; scale-x: 1.018; scale-y: 0.8; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 27.6; y: 29.2; skew-x: -8.5; skew-y: -8.5; scale-x: 1.017; scale-y: 0.799; }
        frame 38 { x: 27.2; y: 28.5; skew-x: -17.2; skew-y: -17.2; scale-x: 1.016; scale-y: -10000; }
        frame 39 { x: 26.8; y: 27.6; skew-x: -26; skew-y: -26; scale-x: 1.017; }
        frame 40 { x: 26.9; y: 27; skew-x: -10000; skew-y: -10000; scale-x: 1.015; scale-y: 0.797; }
        frame 41 { x: 26.8; y: 26.4; scale-x: 1.016; scale-y: 0.798; }
        frame 42 { x: 26.6; y: 41.3; skew-x: -28.2; skew-y: -28.2; scale-x: 1.014; scale-y: 0.797; }
        frame 43 { x: 26.4; y: 56; skew-x: -30.7; skew-y: -30.7; scale-x: 1.015; scale-y: -10000; }
        frame 44 { x: 26.1; y: 70.8; skew-x: -33; skew-y: -33; scale-x: 1.016; scale-y: 0.799; }
        frame 45 { x: -10000; y: 69.2; skew-x: -10000; skew-y: -10000; scale-x: 1.015; scale-y: 0.797; }
        frame 46 { y: 67.7; scale-x: -10000; scale-y: -10000; }
        frame 47 { y: 66.2; }
        frame 48 { y: 64.6; scale-x: 1.016; scale-y: 0.799; }
        frame 49 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { y: 64.3; scale-x: 1.015; scale-y: 0.797; }
        frame 51 { y: 64.1; scale-x: -10000; scale-y: -10000; }
        frame 52 { y: 63.8; }
        frame 53 { y: 63.5; }
        frame 54 { y: 63.3; scale-x: 1.016; scale-y: 0.799; }
        frame 55 { y: 63.5; scale-x: 1.015; scale-y: 0.797; }
        frame 56 { y: 63.8; scale-x: -10000; scale-y: -10000; }
        frame 57 { y: 64.1; }
        frame 58 { y: 64.3; }
        frame 59 { y: 64.6; scale-x: 1.016; scale-y: 0.799; }
        frame 60 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { y: 66.7; scale-x: 1.015; scale-y: 0.797; }
        frame 62 { y: 68.7; scale-x: -10000; scale-y: -10000; }
        frame 63 { y: 70.8; scale-x: 1.016; scale-y: 0.799; }
        frame 64 { x: 26.4; y: 56; skew-x: -30.7; skew-y: -30.7; scale-x: 1.015; scale-y: 0.797; }
        frame 65 { x: 26.6; y: 41.1; skew-x: -28.2; skew-y: -28.2; scale-x: 1.014; scale-y: -10000; }
        frame 66 { x: 26.8; y: 26.4; skew-x: -26; skew-y: -26; scale-x: 1.016; scale-y: 0.798; }
        frame 67 { x: 27.2; y: 27.6; skew-x: -17.2; skew-y: -17.2; scale-x: 1.015; scale-y: -10000; }
        frame 68 { x: 27.6; y: 28.8; skew-x: -8.5; skew-y: -8.5; scale-x: 1.017; scale-y: 0.799; }
        frame 69 { x: 28.2; y: 30; skew-x: 0; skew-y: 0; scale-x: 1.018; scale-y: 0.8; }
        frame 70 { x: -10000; y: 36.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 28.3; y: 35.6; }
        frame 72 { x: -10000; y: 34.9; }
        frame 73 { y: 35.3; }
        frame 74 { y: 35.8; }
        frame 75 { x: 28.4; y: 36.3; }
        frame 76 { x: -10000; y: 36.8; }
        frame 77 { y: 37.2; }
        frame 78 { y: 37.6; }
        frame 79 { y: 38.1; }
        frame 80 { x: 28.3; y: 37.8; }
        frame 81 { x: -10000; y: 37.5; }
        frame 82 { y: 37.3; }
        frame 83 { x: 28.2; y: 37; }
        frame 84 { x: -10000; y: 36.7; }
        frame 85 { y: 36.4; }
    }
    Track {
        source-name: "ScaredyShroom_eyebrow2";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 38.6; y: 26.5; cel: 0; image: IMAGE_REANIM_SCAREDYSHROOM_EYEBROW2; }
        frame 6 { x: 39.6; y: 25.4; skew-x: 9.8; skew-y: 9.8; scale-x: 0.999; scale-y: 0.999; cel: -10000; image: none; }
        frame 7 { x: 40.9; y: 24.4; skew-x: 20; skew-y: 20; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 42; y: 23.7; skew-x: 30; skew-y: 30; scale-x: 1; scale-y: 1; }
        frame 9 { x: -10000; y: 24.9; skew-x: 29.9; skew-y: 29.9; scale-x: 0.999; scale-y: 0.999; }
        frame 10 { y: 26.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 11 { y: 27.5; }
        frame 12 { y: 28.8; skew-x: 30; skew-y: 30; scale-x: 1; scale-y: 1; }
        frame 13 { x: 40.6; y: 29.6; skew-x: 18.6; skew-y: 18.6; scale-x: 0.998; scale-y: 0.998; }
        frame 14 { x: 39.3; y: 30.7; skew-x: 7.3; skew-y: 7.3; scale-x: 0.999; scale-y: 0.999; }
        frame 15 { x: -10000; y: 30.1; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 39.1; y: 29.3; skew-x: 4.8; skew-y: 4.8; }
        frame 17 { x: 39; y: 28.6; skew-x: 3.5; skew-y: 3.5; }
        frame 18 { x: 38.9; y: 27.9; skew-x: 2.3; skew-y: 2.3; }
        frame 19 { x: 38.8; y: 27.3; skew-x: 1.1; skew-y: 1.1; scale-x: 1; scale-y: 1; }
        frame 20 { x: 38.6; y: 26.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 22 { x: 37.6; y: 26.2; skew-x: -1; skew-y: -1.5; }
        frame 23 { x: 36.6; y: 25.9; skew-x: -2.2; skew-y: -3.2; }
        frame 24 { x: 35.8; y: 25.6; skew-x: -3.4; skew-y: -4.9; }
        frame 25 { x: 34.8; y: 25.3; skew-x: -4.7; skew-y: -6.7; scale-x: 0.999; }
        frame 26 { x: 33.8; y: 24.9; skew-x: -5.9; skew-y: -8.4; scale-x: -10000; }
        frame 27 { x: 32.8; y: 24.7; skew-x: -7.2; skew-y: -10.2; scale-x: 1; scale-y: 1.001; }
        frame 28 { x: 34.1; y: 26.4; skew-x: -13; skew-y: -13.4; scale-x: 1.005; scale-y: 0.996; }
        frame 29 { x: 47.3; y: 33.3; skew-x: -1; skew-y: 6.6; scale-x: 1.023; scale-y: 0.984; }
        frame 30 { x: 45.8; y: 33.1; skew-x: -1.9; skew-y: 3.6; scale-x: 1.019; scale-y: 0.987; }
        frame 31 { x: 44.3; y: 32.9; skew-x: -2.9; skew-y: 0.8; scale-x: 1.015; scale-y: 0.99; }
        frame 32 { x: 42.9; y: 31.3; skew-x: -2.2; skew-y: 0.5; scale-x: 1.011; scale-y: 0.992; }
        frame 33 { x: 41.5; y: 29.7; skew-x: -1.4; skew-y: 0.3; scale-x: 1.008; scale-y: 0.995; }
        frame 34 { x: 40; y: 28.1; skew-x: -0.7; skew-y: 0.1; scale-x: 1.004; scale-y: 0.997; }
        frame 35 { x: 38.6; y: 26.5; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 39.1; y: 24.2; skew-x: 5.8; skew-y: 5.8; scale-x: 0.999; scale-y: 0.999; }
        frame 38 { x: 39.7; y: 22; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 40.3; y: 19.9; skew-x: 17.8; skew-y: 17.8; }
        frame 40 { x: -10000; y: 19.4; skew-x: -10000; skew-y: -10000; scale-x: 0.998; scale-y: 0.998; }
        frame 41 { y: 18.8; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 40.9; y: 33; skew-x: 24.6; skew-y: 24.6; scale-x: 0.997; scale-y: 0.997; }
        frame 43 { x: 41.4; y: 47.4; skew-x: 31.4; skew-y: 31.4; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 41.9; y: 61.8; skew-x: 38.4; skew-y: 38.4; scale-x: 0.998; scale-y: 0.998; }
        frame 45 { x: 42.5; y: 60.3; skew-x: 38.3; skew-y: 38.3; scale-x: 0.996; scale-y: 0.996; }
        frame 46 { x: 43; y: 58.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 43.4; y: 57.2; }
        frame 48 { x: 43.9; y: 55.6; skew-x: 38.4; skew-y: 38.4; scale-x: 0.998; scale-y: 0.998; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { y: 55.4; skew-x: 38.3; skew-y: 38.3; scale-x: 0.996; scale-y: 0.996; }
        frame 51 { y: 55; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 52 { y: 54.6; }
        frame 53 { y: 54.3; }
        frame 54 { y: 53.9; skew-x: 38.4; skew-y: 38.4; scale-x: 0.998; scale-y: 0.998; }
        frame 55 { y: 54.2; skew-x: 38.3; skew-y: 38.3; scale-x: 0.996; scale-y: 0.996; }
        frame 56 { y: 54.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 57 { y: 55; }
        frame 58 { y: 55.3; }
        frame 59 { y: 55.6; skew-x: 38.4; skew-y: 38.4; scale-x: 0.998; scale-y: 0.998; }
        frame 60 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 43.3; y: 57.8; skew-x: 38.3; skew-y: 38.3; scale-x: 0.996; scale-y: 0.996; }
        frame 62 { x: 42.6; y: 59.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 41.9; y: 61.8; skew-x: 38.4; skew-y: 38.4; scale-x: 0.998; scale-y: 0.998; }
        frame 64 { x: 41.3; y: 47.4; skew-x: 31.4; skew-y: 31.4; scale-x: 0.997; scale-y: 0.997; }
        frame 65 { x: 40.8; y: 33; skew-x: 24.6; skew-y: 24.6; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 40.3; y: 18.8; skew-x: 17.8; skew-y: 17.8; scale-x: 0.998; scale-y: 0.998; }
        frame 67 { x: 39.7; y: 21.3; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 39.1; y: 23.8; skew-x: 5.8; skew-y: 5.8; scale-x: 0.999; scale-y: 0.999; }
        frame 69 { x: 38.6; y: 26.5; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 70 { x: 44.5; y: 32; skew-x: 37.8; skew-y: 37.8; scale-x: 0.998; scale-y: 0.998; }
        frame 71 { x: 44.6; y: 31.3; skew-x: -10000; skew-y: -10000; scale-x: 0.996; scale-y: 0.996; }
        frame 72 { x: -10000; y: 30.6; scale-x: 0.997; scale-y: 0.997; }
        frame 73 { y: 31; scale-x: 0.996; scale-y: 0.996; }
        frame 74 { y: 31.6; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 44.5; y: 32.1; }
        frame 76 { x: -10000; y: 32.6; scale-x: 0.997; scale-y: 0.997; }
        frame 77 { y: 33.1; scale-x: 0.998; scale-y: 0.998; }
        frame 78 { y: 33.5; scale-x: 0.996; scale-y: 0.996; }
        frame 79 { y: 34; scale-x: 0.997; scale-y: 0.997; }
        frame 80 { x: 44.6; y: 33.6; scale-x: 0.996; scale-y: 0.996; }
        frame 81 { x: 44.5; y: 33.3; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: -10000; y: 33; }
        frame 83 { x: 44.6; y: 32.7; }
        frame 84 { x: 44.5; y: 32.4; scale-x: 0.997; scale-y: 0.997; }
        frame 85 { x: -10000; y: 32; scale-x: 0.998; scale-y: 0.998; }
    }
    Track {
        source-name: "ScaredyShroom_sweat2";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 50 { x: 44.1; y: 65.7; scale-x: 0.8; scale-y: 0.585; cel: 0; alpha: 0.35; image: IMAGE_REANIM_SCAREDYSHROOM_SWEAT; }
        frame 51 { x: 46.1; y: 63; scale-x: 1.138; scale-y: 0.832; cel: -10000; alpha: 1; image: none; }
        frame 52 { x: 49.1; y: 61.5; scale-x: -10000; scale-y: 1.131; alpha: 0.26; }
        frame 53 { x: 51.6; y: 56.7; scale-y: 1.397; alpha: 0; }
        frame 54 { x: -10000; y: -10000; scale-y: -10000; alpha: -10000; }
        frame 55 { x: 44.1; y: 65.7; scale-x: 0.8; scale-y: 0.585; alpha: 0.35; }
        frame 56 { x: 46.1; y: 63; scale-x: 1.138; scale-y: 0.832; alpha: 1; }
        frame 57 { x: 49.1; y: 61.5; scale-x: -10000; scale-y: 1.131; alpha: 0.26; }
        frame 58 { x: 51.6; y: 56.7; scale-y: 1.397; alpha: 0; }
        frame 59 { x: -10000; y: -10000; scale-y: -10000; alpha: -10000; }
        frame 60 { cel: -1; }
        frame 61 { cel: -10000; }
    }
    Track {
        source-name: "ScaredyShroom_sweat1";
        frame-count: 86;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 50 { x: 34.5; y: 66.3; skew-x: 180; scale-x: 0.8; scale-y: 0.585; cel: 0; alpha: 0.35; image: IMAGE_REANIM_SCAREDYSHROOM_SWEAT; }
        frame 51 { x: 32.6; y: 63; skew-x: -10000; scale-x: 1.138; scale-y: 0.832; cel: -10000; alpha: 1; image: none; }
        frame 52 { x: 28.2; y: 61.8; scale-x: -10000; scale-y: 1.131; alpha: 0.26; }
        frame 53 { x: 25.2; y: 56.7; scale-y: 1.397; alpha: 0; }
        frame 54 { x: -10000; y: -10000; scale-y: -10000; alpha: -10000; }
        frame 55 { x: 34.5; y: 66.3; scale-x: 0.8; scale-y: 0.585; alpha: 0.35; }
        frame 56 { x: 32.6; y: 63; scale-x: 1.138; scale-y: 0.832; alpha: 1; }
        frame 57 { x: 28.2; y: 61.8; scale-x: -10000; scale-y: 1.131; alpha: 0.26; }
        frame 58 { x: 25.2; y: 56.7; scale-y: 1.397; alpha: 0; }
        frame 59 { x: -10000; y: -10000; scale-y: -10000; alpha: -10000; }
        frame 60 { cel: -1; }
        frame 61 { cel: -10000; }
    }
}
