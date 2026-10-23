export component Tanglekelp {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 54;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 27 { cel: -1; }
        frame 28 { cel: -10000; }
    }
    Track {
        source-name: "anim_grab";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 27 { cel: 0; }
        frame 28 { cel: -10000; }
        frame 32 { cel: -1; }
        frame 33 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle_aquarium";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 32 { cel: 0; }
        frame 33 { cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 2.3; y: 11.6; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_TANGLEKELP_BODY; }
        frame 6 { x: -10000; y: 12; scale-x: -10000; scale-y: 0.795; cel: -10000; image: none; }
        frame 7 { y: 12.3; scale-y: 0.791; }
        frame 8 { y: 12.7; scale-y: 0.786; }
        frame 9 { y: 13.1; scale-y: 0.781; }
        frame 10 { y: 13.4; scale-y: 0.777; }
        frame 11 { y: 13.7; scale-y: 0.772; }
        frame 12 { y: 14.1; scale-y: 0.767; }
        frame 13 { y: 14.4; scale-y: 0.763; }
        frame 14 { y: 14.8; scale-y: 0.758; }
        frame 15 { y: 15.1; scale-y: 0.754; }
        frame 16 { y: 14.8; scale-y: 0.758; }
        frame 17 { y: 14.4; scale-y: 0.762; }
        frame 18 { y: 14.1; scale-y: 0.766; }
        frame 19 { y: 13.8; scale-y: 0.77; }
        frame 20 { y: 13.4; scale-y: 0.775; }
        frame 21 { y: 13.2; scale-y: 0.779; }
        frame 22 { y: 12.9; scale-y: 0.783; }
        frame 23 { y: 12.5; scale-y: 0.787; }
        frame 24 { y: 12.2; scale-y: 0.792; }
        frame 25 { y: 11.9; scale-y: 0.796; }
        frame 26 { y: 11.6; scale-y: 0.8; }
        frame 27 { y: -10000; scale-y: -10000; cel: -1; }
        frame 28 { cel: -10000; }
        frame 32 { x: 2.4; y: 11.8; cel: 0; image: IMAGE_REANIM_TANGLEKELP_BODY_ZENGARDEN; }
        frame 33 { x: -10000; y: 12.2; scale-y: 0.795; cel: -10000; image: none; }
        frame 34 { x: 2.3; y: 12.5; scale-y: 0.791; }
        frame 35 { x: -10000; y: 12.9; scale-y: 0.786; }
        frame 36 { y: 13.2; scale-y: 0.781; }
        frame 37 { y: 13.6; scale-y: 0.777; }
        frame 38 { x: 2.2; y: 13.9; scale-y: 0.772; }
        frame 39 { x: -10000; y: 14.2; scale-y: 0.767; }
        frame 40 { x: 2.1; y: 14.6; scale-y: 0.763; }
        frame 41 { x: -10000; y: 14.9; scale-y: 0.758; }
        frame 42 { y: 15.2; scale-y: 0.754; }
        frame 43 { y: 14.9; scale-y: 0.758; }
        frame 44 { y: 14.6; scale-y: 0.762; }
        frame 45 { y: 14.3; scale-y: 0.766; }
        frame 46 { x: 2.2; y: 14; scale-y: 0.77; }
        frame 47 { x: -10000; y: 13.7; scale-y: 0.775; }
        frame 48 { x: 2.3; y: 13.4; scale-y: 0.779; }
        frame 49 { x: -10000; y: 13; scale-y: 0.783; }
        frame 50 { y: 12.7; scale-y: 0.787; }
        frame 51 { y: 12.4; scale-y: 0.792; }
        frame 52 { x: 2.4; y: 12.1; scale-y: 0.796; }
        frame 53 { x: -10000; y: 11.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_waterline";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 3.3; y: 52.9; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER2; }
        frame 6 { x: 2.9; y: 55; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER1; }
        frame 7 { x: 2.8; y: 53.5; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER3; }
        frame 8 { x: 3.3; y: 52.9; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER2; }
        frame 9 { x: 2.9; y: 55; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER1; }
        frame 10 { x: 2.8; y: 53.5; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER3; }
        frame 11 { x: 3.3; y: 52.9; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER2; }
        frame 12 { x: 2.9; y: 55; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER1; }
        frame 13 { x: 2.8; y: 53.5; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER3; }
        frame 14 { x: 3.3; y: 52.9; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER2; }
        frame 15 { x: 2.9; y: 55; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER1; }
        frame 16 { x: 2.8; y: 53.5; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER3; }
        frame 17 { x: 3.3; y: 52.9; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER2; }
        frame 18 { x: 2.9; y: 55; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER1; }
        frame 19 { x: 2.8; y: 53.5; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER3; }
        frame 20 { x: 3.3; y: 52.9; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER2; }
        frame 21 { x: 2.9; y: 55; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER1; }
        frame 22 { x: 2.8; y: 53.5; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER3; }
        frame 23 { x: 3.3; y: 52.9; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER2; }
        frame 24 { x: 2.9; y: 55; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER1; }
        frame 25 { x: 2.8; y: 53.5; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER3; }
        frame 26 { x: 3.3; y: 52.9; image: IMAGE_REANIM_TANGLEKELP_WHITEWATER2; }
        frame 27 { x: -10000; y: -10000; cel: -1; image: none; }
        frame 28 { cel: -10000; }
    }
    Track {
        source-name: "Tanglekelp_arm1";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -5.9; y: 24.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_TANGLEKELP_ARM1; }
        frame 6 { x: -5.8; y: 24.4; skew-x: 1.8; scale-x: 0.801; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: -5.7; y: 24.1; skew-x: 3.6; scale-x: 0.802; }
        frame 8 { x: -5.6; y: 23.7; skew-x: 5.6; scale-x: 0.804; }
        frame 9 { x: -5.7; y: 25.1; skew-x: 3; scale-x: -10000; scale-y: 0.791; }
        frame 10 { x: -5.8; y: 26.5; skew-x: 0.3; scale-x: 0.805; scale-y: 0.781; }
        frame 11 { x: -5.9; y: 27.9; skew-x: -1.9; scale-x: -10000; scale-y: 0.772; }
        frame 12 { x: -10000; y: 29.3; skew-x: -4.4; scale-x: 0.806; scale-y: 0.763; }
        frame 13 { y: 30.6; skew-x: -7.1; scale-x: -10000; scale-y: 0.754; }
        frame 14 { y: -10000; skew-x: -7; scale-y: -10000; }
        frame 15 { skew-x: -7.1; }
        frame 16 { y: 30.8; skew-x: -8.2; scale-x: 0.808; }
        frame 17 { y: 31.1; skew-x: -9.2; scale-x: 0.811; }
        frame 18 { y: 31.3; skew-x: -10.4; scale-x: 0.814; }
        frame 19 { y: 30.5; skew-x: -8.9; scale-x: 0.811; scale-y: 0.759; }
        frame 20 { y: 29.7; skew-x: -7.7; scale-x: 0.81; scale-y: 0.765; }
        frame 21 { y: 28.8; skew-x: -6.4; scale-x: 0.808; scale-y: 0.771; }
        frame 22 { x: -6; y: 28; skew-x: -5; scale-x: 0.807; scale-y: 0.777; }
        frame 23 { x: -5.9; y: 27.1; skew-x: -3.7; scale-x: 0.805; scale-y: 0.783; }
        frame 24 { x: -10000; y: 26.4; skew-x: -2.4; scale-x: 0.803; scale-y: 0.788; }
        frame 25 { y: 25.5; skew-x: -1.2; scale-x: 0.802; scale-y: 0.794; }
        frame 26 { y: 24.8; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 28 { cel: -10000; }
        frame 32 { cel: 0; }
        frame 33 { x: -5.8; y: 24.4; skew-x: 1.8; scale-x: 0.801; cel: -10000; }
        frame 34 { x: -5.7; y: 24.1; skew-x: 3.6; scale-x: 0.802; }
        frame 35 { x: -5.6; y: 23.7; skew-x: 5.6; scale-x: 0.804; }
        frame 36 { x: -5.7; y: 25.1; skew-x: 3; scale-x: -10000; scale-y: 0.791; }
        frame 37 { x: -5.8; y: 26.5; skew-x: 0.3; scale-x: 0.805; scale-y: 0.781; }
        frame 38 { x: -5.9; y: 27.9; skew-x: -1.9; scale-x: -10000; scale-y: 0.772; }
        frame 39 { x: -10000; y: 29.3; skew-x: -4.4; scale-x: 0.806; scale-y: 0.763; }
        frame 40 { y: 30.6; skew-x: -7.1; scale-x: -10000; scale-y: 0.754; }
        frame 41 { y: -10000; skew-x: -7; scale-y: -10000; }
        frame 42 { skew-x: -7.1; }
        frame 43 { y: 30.8; skew-x: -8.2; scale-x: 0.808; }
        frame 44 { y: 31.1; skew-x: -9.2; scale-x: 0.811; }
        frame 45 { y: 31.3; skew-x: -10.4; scale-x: 0.814; }
        frame 46 { y: 30.5; skew-x: -8.9; scale-x: 0.811; scale-y: 0.759; }
        frame 47 { y: 29.7; skew-x: -7.7; scale-x: 0.81; scale-y: 0.765; }
        frame 48 { y: 28.8; skew-x: -6.4; scale-x: 0.808; scale-y: 0.771; }
        frame 49 { x: -6; y: 28; skew-x: -5; scale-x: 0.807; scale-y: 0.777; }
        frame 50 { x: -5.9; y: 27.1; skew-x: -3.7; scale-x: 0.805; scale-y: 0.783; }
        frame 51 { x: -10000; y: 26.4; skew-x: -2.4; scale-x: 0.803; scale-y: 0.788; }
        frame 52 { y: 25.5; skew-x: -1.2; scale-x: 0.802; scale-y: 0.794; }
        frame 53 { y: 24.8; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Tanglekelp_arm2";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 12.8; y: 21.6; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_TANGLEKELP_ARM2; }
        frame 6 { x: 12.7; y: 21.7; skew-x: 1.6; scale-x: 0.801; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 12.8; y: -10000; skew-x: 3.3; scale-x: 0.802; }
        frame 8 { x: -10000; y: 21.8; skew-x: 5.2; scale-x: 0.803; }
        frame 9 { x: 12.6; y: 22.6; skew-x: 3; skew-y: -1.7; scale-x: -10000; scale-y: 0.79; }
        frame 10 { x: 12.4; y: 23.3; skew-x: 1; skew-y: -3.7; scale-y: 0.781; }
        frame 11 { x: 12.2; y: 24.1; skew-x: -0.9; skew-y: -5.4; scale-y: 0.771; }
        frame 12 { x: 12.1; y: 25; skew-x: -2.9; skew-y: -7.4; scale-y: 0.762; }
        frame 13 { x: 12; y: 25.7; skew-x: -5.1; skew-y: -9.3; scale-y: 0.752; }
        frame 14 { x: -10000; y: -10000; skew-x: -5; skew-y: -9.2; scale-y: -10000; }
        frame 15 { skew-x: -5.1; skew-y: -9.3; }
        frame 16 { x: 12.1; skew-x: -7.2; skew-y: -9.4; scale-x: 0.802; scale-y: 0.757; }
        frame 17 { x: -10000; y: 25.6; skew-x: -9.2; skew-y: -10000; scale-x: 0.801; scale-y: 0.761; }
        frame 18 { x: 12.3; y: -10000; skew-x: -11.4; skew-y: -9.7; scale-x: -10000; scale-y: 0.766; }
        frame 19 { x: 12.4; y: 25.1; skew-x: -9.9; skew-y: -8.4; scale-y: 0.77; }
        frame 20 { x: -10000; y: 24.6; skew-x: -8.4; skew-y: -7.2; scale-y: 0.774; }
        frame 21 { x: 12.5; y: 24.1; skew-x: -6.9; skew-y: -5.9; scale-x: 0.8; scale-y: 0.779; }
        frame 22 { x: -10000; y: 23.6; skew-x: -5.5; skew-y: -4.7; scale-x: -10000; scale-y: 0.783; }
        frame 23 { x: 12.6; y: 23.1; skew-x: -4.2; skew-y: -3.4; scale-y: 0.787; }
        frame 24 { x: -10000; y: 22.6; skew-x: -2.7; skew-y: -2.2; scale-y: 0.791; }
        frame 25 { x: 12.8; y: 22; skew-x: -1.2; skew-y: -1; scale-y: 0.796; }
        frame 26 { x: -10000; y: 21.6; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 27 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 28 { cel: -10000; }
        frame 32 { cel: 0; }
        frame 33 { x: 12.7; y: 21.7; skew-x: 1.6; scale-x: 0.801; cel: -10000; }
        frame 34 { x: 12.8; y: -10000; skew-x: 3.3; scale-x: 0.802; }
        frame 35 { x: -10000; y: 21.8; skew-x: 5.2; scale-x: 0.803; }
        frame 36 { x: 12.6; y: 22.6; skew-x: 3; skew-y: -1.7; scale-x: -10000; scale-y: 0.79; }
        frame 37 { x: 12.4; y: 23.3; skew-x: 1; skew-y: -3.7; scale-y: 0.781; }
        frame 38 { x: 12.2; y: 24.1; skew-x: -0.9; skew-y: -5.4; scale-y: 0.771; }
        frame 39 { x: 12.1; y: 25; skew-x: -2.9; skew-y: -7.4; scale-y: 0.762; }
        frame 40 { x: 12; y: 25.7; skew-x: -5.1; skew-y: -9.3; scale-y: 0.752; }
        frame 41 { x: -10000; y: -10000; skew-x: -5; skew-y: -9.2; scale-y: -10000; }
        frame 42 { skew-x: -5.1; skew-y: -9.3; }
        frame 43 { x: 12.1; skew-x: -7.2; skew-y: -9.4; scale-x: 0.802; scale-y: 0.757; }
        frame 44 { x: -10000; y: 25.6; skew-x: -9.2; skew-y: -10000; scale-x: 0.801; scale-y: 0.761; }
        frame 45 { x: 12.3; y: -10000; skew-x: -11.4; skew-y: -9.7; scale-x: -10000; scale-y: 0.766; }
        frame 46 { x: 12.4; y: 25.1; skew-x: -9.9; skew-y: -8.4; scale-y: 0.77; }
        frame 47 { x: -10000; y: 24.6; skew-x: -8.4; skew-y: -7.2; scale-y: 0.774; }
        frame 48 { x: 12.5; y: 24.1; skew-x: -6.9; skew-y: -5.9; scale-x: 0.8; scale-y: 0.779; }
        frame 49 { x: -10000; y: 23.6; skew-x: -5.5; skew-y: -4.7; scale-x: -10000; scale-y: 0.783; }
        frame 50 { x: 12.6; y: 23.1; skew-x: -4.2; skew-y: -3.4; scale-y: 0.787; }
        frame 51 { x: -10000; y: 22.6; skew-x: -2.7; skew-y: -2.2; scale-y: 0.791; }
        frame 52 { x: 12.8; y: 22; skew-x: -1.2; skew-y: -1; scale-y: 0.796; }
        frame 53 { x: -10000; y: 21.6; skew-x: 0; skew-y: 0; scale-y: 0.8; }
    }
    Track {
        source-name: "Tanglekelp_arm3";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 14.6; y: 11; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_TANGLEKELP_ARM3; }
        frame 6 { x: -10000; y: 10.4; skew-x: 4.1; scale-x: 0.804; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 9.8; skew-x: 8.5; scale-x: 0.809; }
        frame 8 { x: 14.7; y: 10.8; skew-x: 6; scale-x: -10000; scale-y: 0.794; }
        frame 9 { x: 14.6; y: 11.8; skew-x: 3.5; scale-x: 0.81; scale-y: 0.788; }
        frame 10 { x: -10000; y: 12.9; skew-x: 1.1; scale-x: 0.811; scale-y: 0.783; }
        frame 11 { y: 13.9; skew-x: -0.9; scale-x: 0.812; scale-y: 0.777; }
        frame 12 { x: 14.7; y: 15; skew-x: -3.4; scale-x: -10000; scale-y: 0.771; }
        frame 13 { x: -10000; y: 16; skew-x: -5.7; scale-x: 0.813; scale-y: 0.765; }
        frame 14 { x: 14.8; y: 17.1; skew-x: -8.2; scale-x: -10000; scale-y: 0.759; }
        frame 15 { x: -10000; y: 18.2; skew-x: -10.7; scale-x: 0.814; scale-y: 0.754; }
        frame 16 { x: 14.7; y: 18.4; skew-x: -11.5; scale-x: 0.818; scale-y: 0.729; }
        frame 17 { x: -10000; y: 18.7; skew-x: -12.5; scale-x: 0.822; scale-y: 0.705; }
        frame 18 { y: 17.8; skew-x: -11; scale-x: 0.819; scale-y: 0.715; }
        frame 19 { y: 17; skew-x: -9.7; scale-x: 0.817; scale-y: 0.726; }
        frame 20 { x: 14.6; y: 16.2; skew-x: -8.2; scale-x: 0.814; scale-y: 0.736; }
        frame 21 { x: -10000; y: 15.3; skew-x: -6.9; scale-x: 0.812; scale-y: 0.747; }
        frame 22 { y: 14.4; skew-x: -5.4; scale-x: 0.809; scale-y: 0.758; }
        frame 23 { y: 13.6; skew-x: -4; scale-x: 0.807; scale-y: 0.768; }
        frame 24 { y: 12.7; skew-x: -2.7; scale-x: 0.805; scale-y: 0.779; }
        frame 25 { y: 11.9; skew-x: -1.2; scale-x: 0.802; scale-y: 0.789; }
        frame 26 { y: 11; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 28 { cel: -10000; }
        frame 32 { cel: 0; }
        frame 33 { y: 10.4; skew-x: 4.1; scale-x: 0.804; cel: -10000; }
        frame 34 { y: 9.8; skew-x: 8.5; scale-x: 0.809; }
        frame 35 { x: 14.7; y: 10.8; skew-x: 6; scale-x: -10000; scale-y: 0.794; }
        frame 36 { x: 14.6; y: 11.8; skew-x: 3.5; scale-x: 0.81; scale-y: 0.788; }
        frame 37 { x: -10000; y: 12.9; skew-x: 1.1; scale-x: 0.811; scale-y: 0.783; }
        frame 38 { y: 13.9; skew-x: -0.9; scale-x: 0.812; scale-y: 0.777; }
        frame 39 { x: 14.7; y: 15; skew-x: -3.4; scale-x: -10000; scale-y: 0.771; }
        frame 40 { x: -10000; y: 16; skew-x: -5.7; scale-x: 0.813; scale-y: 0.765; }
        frame 41 { x: 14.8; y: 17.1; skew-x: -8.2; scale-x: -10000; scale-y: 0.759; }
        frame 42 { x: -10000; y: 18.2; skew-x: -10.7; scale-x: 0.814; scale-y: 0.754; }
        frame 43 { x: 14.7; y: 18.4; skew-x: -11.5; scale-x: 0.818; scale-y: 0.729; }
        frame 44 { x: -10000; y: 18.7; skew-x: -12.5; scale-x: 0.822; scale-y: 0.705; }
        frame 45 { y: 17.8; skew-x: -11; scale-x: 0.819; scale-y: 0.715; }
        frame 46 { y: 17; skew-x: -9.7; scale-x: 0.817; scale-y: 0.726; }
        frame 47 { x: 14.6; y: 16.2; skew-x: -8.2; scale-x: 0.814; scale-y: 0.736; }
        frame 48 { x: -10000; y: 15.3; skew-x: -6.9; scale-x: 0.812; scale-y: 0.747; }
        frame 49 { y: 14.4; skew-x: -5.4; scale-x: 0.809; scale-y: 0.758; }
        frame 50 { y: 13.6; skew-x: -4; scale-x: 0.807; scale-y: 0.768; }
        frame 51 { y: 12.7; skew-x: -2.7; scale-x: 0.805; scale-y: 0.779; }
        frame 52 { y: 11.9; skew-x: -1.2; scale-x: 0.802; scale-y: 0.789; }
        frame 53 { y: 11; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Tanglekelp_arm4";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 16; y: 5.2; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_TANGLEKELP_ARM4; }
        frame 6 { x: 16.5; y: 4.4; skew-x: 4; skew-y: 2; scale-x: 0.801; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 17.1; y: 3.8; skew-x: 8; skew-y: 4.3; scale-x: 0.802; }
        frame 8 { x: 16.9; y: 5; skew-x: 5.5; skew-y: 3.1; scale-x: -10000; scale-y: 0.794; }
        frame 9 { x: 16.7; y: 6.2; skew-x: 3.3; skew-y: 2.1; scale-y: 0.788; }
        frame 10 { x: 16.4; y: 7.3; skew-x: 0.8; skew-y: 1.1; scale-x: 0.803; scale-y: 0.782; }
        frame 11 { x: -10000; y: 8.4; skew-x: -1.2; skew-y: 0.1; scale-x: 0.804; scale-y: 0.777; }
        frame 12 { y: 9.6; skew-x: -3.7; skew-y: -0.7; scale-x: -10000; scale-y: 0.771; }
        frame 13 { x: 16.2; y: 10.7; skew-x: -5.9; skew-y: -1.7; scale-x: 0.805; scale-y: 0.765; }
        frame 14 { x: 16.1; y: 12; skew-x: -8.4; skew-y: -2.7; scale-x: -10000; scale-y: 0.759; }
        frame 15 { x: 16; y: 13.2; skew-x: -10.8; skew-y: -3.7; scale-x: 0.806; scale-y: 0.753; }
        frame 16 { y: 13.5; skew-x: -10.9; skew-y: -3.2; scale-x: 0.807; scale-y: 0.717; }
        frame 17 { y: 13.9; skew-x: -11.3; skew-y: -2.9; scale-x: 0.809; scale-y: 0.681; }
        frame 18 { x: 15.9; y: 13; skew-x: -9.9; skew-y: -2.4; scale-x: 0.808; scale-y: 0.694; }
        frame 19 { x: -10000; y: 12; skew-x: -8.7; skew-y: -2.2; scale-x: 0.807; scale-y: 0.707; }
        frame 20 { x: 15.8; y: 11; skew-x: -7.4; skew-y: -1.9; scale-x: 0.806; scale-y: 0.72; }
        frame 21 { x: -10000; y: 10; skew-x: -6.2; skew-y: -1.4; scale-x: 0.805; scale-y: 0.734; }
        frame 22 { y: 9.1; skew-x: -4.9; skew-y: -1.2; scale-x: 0.804; scale-y: 0.747; }
        frame 23 { y: 8.2; skew-x: -3.7; skew-y: -0.9; scale-x: 0.803; scale-y: 0.76; }
        frame 24 { y: 7.2; skew-x: -2.4; skew-y: -0.4; scale-x: 0.802; scale-y: 0.773; }
        frame 25 { y: 6.2; skew-x: -1.2; skew-y: -0.2; scale-x: 0.801; scale-y: 0.787; }
        frame 26 { x: 16; y: 5.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 28 { cel: -10000; }
        frame 32 { cel: 0; }
        frame 33 { x: 16.5; y: 4.4; skew-x: 4; skew-y: 2; scale-x: 0.801; cel: -10000; }
        frame 34 { x: 17.1; y: 3.8; skew-x: 8; skew-y: 4.3; scale-x: 0.802; }
        frame 35 { x: 16.9; y: 5; skew-x: 5.5; skew-y: 3.1; scale-x: -10000; scale-y: 0.794; }
        frame 36 { x: 16.7; y: 6.2; skew-x: 3.3; skew-y: 2.1; scale-y: 0.788; }
        frame 37 { x: 16.4; y: 7.3; skew-x: 0.8; skew-y: 1.1; scale-x: 0.803; scale-y: 0.782; }
        frame 38 { x: -10000; y: 8.4; skew-x: -1.2; skew-y: 0.1; scale-x: 0.804; scale-y: 0.777; }
        frame 39 { y: 9.6; skew-x: -3.7; skew-y: -0.7; scale-x: -10000; scale-y: 0.771; }
        frame 40 { x: 16.2; y: 10.7; skew-x: -5.9; skew-y: -1.7; scale-x: 0.805; scale-y: 0.765; }
        frame 41 { x: 16.1; y: 12; skew-x: -8.4; skew-y: -2.7; scale-x: -10000; scale-y: 0.759; }
        frame 42 { x: 16; y: 13.2; skew-x: -10.8; skew-y: -3.7; scale-x: 0.806; scale-y: 0.753; }
        frame 43 { y: 13.5; skew-x: -10.9; skew-y: -3.2; scale-x: 0.807; scale-y: 0.717; }
        frame 44 { y: 13.9; skew-x: -11.3; skew-y: -2.9; scale-x: 0.809; scale-y: 0.681; }
        frame 45 { x: 15.9; y: 13; skew-x: -9.9; skew-y: -2.4; scale-x: 0.808; scale-y: 0.694; }
        frame 46 { x: -10000; y: 12; skew-x: -8.7; skew-y: -2.2; scale-x: 0.807; scale-y: 0.707; }
        frame 47 { x: 15.8; y: 11; skew-x: -7.4; skew-y: -1.9; scale-x: 0.806; scale-y: 0.72; }
        frame 48 { x: -10000; y: 10; skew-x: -6.2; skew-y: -1.4; scale-x: 0.805; scale-y: 0.734; }
        frame 49 { y: 9.1; skew-x: -4.9; skew-y: -1.2; scale-x: 0.804; scale-y: 0.747; }
        frame 50 { y: 8.2; skew-x: -3.7; skew-y: -0.9; scale-x: 0.803; scale-y: 0.76; }
        frame 51 { y: 7.2; skew-x: -2.4; skew-y: -0.4; scale-x: 0.802; scale-y: 0.773; }
        frame 52 { y: 6.2; skew-x: -1.2; skew-y: -0.2; scale-x: 0.801; scale-y: 0.787; }
        frame 53 { x: 16; y: 5.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Tanglekelp_arm5";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 41.4; y: 5.6; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_TANGLEKELP_ARM5; }
        frame 6 { x: 41; y: 6.2; skew-x: -2.7; skew-y: -1.4; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 40.6; y: 6.7; skew-x: -5.7; skew-y: -2.9; scale-x: 0.801; }
        frame 8 { x: 40.3; y: 7.3; skew-x: -8.8; skew-y: -4.7; scale-x: 0.802; }
        frame 9 { x: 40.5; y: 7.5; skew-x: -4.2; skew-y: -2.2; scale-x: -10000; scale-y: 0.79; }
        frame 10 { x: 40.9; y: 7.8; skew-x: 0; skew-y: 0; scale-x: 0.803; scale-y: 0.781; }
        frame 11 { x: 41.3; y: 8; skew-x: 4.5; skew-y: 2.3; scale-x: -10000; scale-y: 0.772; }
        frame 12 { x: 41.7; y: 8.2; skew-x: 9; skew-y: 4.8; scale-x: 0.804; scale-y: 0.762; }
        frame 13 { x: 42.3; y: 8.5; skew-x: 13.6; skew-y: 7.3; scale-x: -10000; scale-y: 0.753; }
        frame 14 { x: -10000; y: -10000; skew-x: 13.5; skew-y: -10000; scale-y: -10000; }
        frame 15 { skew-x: 13.6; }
        frame 16 { y: 8.3; skew-x: 14; skew-y: 6.5; scale-x: 0.807; scale-y: 0.738; }
        frame 17 { y: 8; skew-x: 14.5; skew-y: 5.8; scale-x: 0.809; scale-y: 0.724; }
        frame 18 { x: 42; y: 7.6; skew-x: 15.2; skew-y: 5; scale-x: 0.813; scale-y: 0.709; }
        frame 19 { x: 41.9; y: 7.3; skew-x: 13.3; skew-y: 4.3; scale-x: 0.811; scale-y: 0.721; }
        frame 20 { x: 41.8; y: 7.2; skew-x: 11.3; skew-y: 3.8; scale-x: 0.809; scale-y: 0.732; }
        frame 21 { x: 41.6; y: 6.9; skew-x: 9.3; skew-y: 3; scale-x: 0.808; scale-y: 0.743; }
        frame 22 { x: 41.5; y: 6.6; skew-x: 7.5; skew-y: 2.5; scale-x: 0.806; scale-y: 0.755; }
        frame 23 { x: 41.4; y: 6.3; skew-x: 5.6; skew-y: 1.8; scale-x: 0.805; scale-y: 0.766; }
        frame 24 { x: -10000; y: 6.1; skew-x: 3.8; skew-y: 1.3; scale-x: 0.803; scale-y: 0.777; }
        frame 25 { x: 41.3; y: 5.9; skew-x: 1.8; skew-y: 0.5; scale-x: 0.802; scale-y: 0.789; }
        frame 26 { x: 41.4; y: 5.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 28 { cel: -10000; }
        frame 32 { cel: 0; }
        frame 33 { x: 41; y: 6.2; skew-x: -2.7; skew-y: -1.4; cel: -10000; }
        frame 34 { x: 40.6; y: 6.7; skew-x: -5.7; skew-y: -2.9; scale-x: 0.801; }
        frame 35 { x: 40.3; y: 7.3; skew-x: -8.8; skew-y: -4.7; scale-x: 0.802; }
        frame 36 { x: 40.5; y: 7.5; skew-x: -4.2; skew-y: -2.2; scale-x: -10000; scale-y: 0.79; }
        frame 37 { x: 40.9; y: 7.8; skew-x: 0; skew-y: 0; scale-x: 0.803; scale-y: 0.781; }
        frame 38 { x: 41.3; y: 8; skew-x: 4.5; skew-y: 2.3; scale-x: -10000; scale-y: 0.772; }
        frame 39 { x: 41.7; y: 8.2; skew-x: 9; skew-y: 4.8; scale-x: 0.804; scale-y: 0.762; }
        frame 40 { x: 42.3; y: 8.5; skew-x: 13.6; skew-y: 7.3; scale-x: -10000; scale-y: 0.753; }
        frame 41 { x: -10000; y: -10000; skew-x: 13.5; skew-y: -10000; scale-y: -10000; }
        frame 42 { skew-x: 13.6; }
        frame 43 { y: 8.3; skew-x: 14; skew-y: 6.5; scale-x: 0.807; scale-y: 0.738; }
        frame 44 { y: 8; skew-x: 14.5; skew-y: 5.8; scale-x: 0.809; scale-y: 0.724; }
        frame 45 { x: 42; y: 7.6; skew-x: 15.2; skew-y: 5; scale-x: 0.813; scale-y: 0.709; }
        frame 46 { x: 41.9; y: 7.3; skew-x: 13.3; skew-y: 4.3; scale-x: 0.811; scale-y: 0.721; }
        frame 47 { x: 41.8; y: 7.2; skew-x: 11.3; skew-y: 3.8; scale-x: 0.809; scale-y: 0.732; }
        frame 48 { x: 41.6; y: 6.9; skew-x: 9.3; skew-y: 3; scale-x: 0.808; scale-y: 0.743; }
        frame 49 { x: 41.5; y: 6.6; skew-x: 7.5; skew-y: 2.5; scale-x: 0.806; scale-y: 0.755; }
        frame 50 { x: 41.4; y: 6.3; skew-x: 5.6; skew-y: 1.8; scale-x: 0.805; scale-y: 0.766; }
        frame 51 { x: -10000; y: 6.1; skew-x: 3.8; skew-y: 1.3; scale-x: 0.803; scale-y: 0.777; }
        frame 52 { x: 41.3; y: 5.9; skew-x: 1.8; skew-y: 0.5; scale-x: 0.802; scale-y: 0.789; }
        frame 53 { x: 41.4; y: 5.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Tanglekelp_arm6";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 51.2; y: 14; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_TANGLEKELP_ARM6; }
        frame 6 { x: 51.1; y: 14.5; skew-x: -2.7; scale-x: 0.803; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: -10000; y: 15; skew-x: -5.4; scale-x: 0.805; }
        frame 8 { y: 15.6; skew-x: -8.3; scale-x: 0.809; }
        frame 9 { x: 51.2; y: 15.8; skew-x: -3.4; skew-y: 1.5; scale-x: 0.808; scale-y: 0.791; }
        frame 10 { x: 51.4; y: 16.1; skew-x: 1; skew-y: 3.3; scale-x: -10000; scale-y: 0.781; }
        frame 11 { x: 51.5; y: 16.4; skew-x: 5.8; skew-y: 4.8; scale-x: 0.807; scale-y: 0.772; }
        frame 12 { x: 51.9; y: 16.7; skew-x: 10.5; skew-y: 6.5; scale-x: 0.806; scale-y: 0.762; }
        frame 13 { x: 52.2; y: 17.1; skew-x: 15.4; skew-y: 8.2; scale-x: -10000; scale-y: 0.753; }
        frame 14 { x: -10000; y: 17.2; skew-x: 15.3; skew-y: 8.1; scale-x: 0.805; scale-y: -10000; }
        frame 15 { y: 17.1; skew-x: 15.4; skew-y: 8.2; scale-x: 0.806; }
        frame 16 { x: 52.1; y: 17; skew-x: 16.5; skew-y: 7.3; scale-x: 0.811; scale-y: 0.737; }
        frame 17 { x: 52; y: 16.9; skew-x: 17.8; skew-y: 6.5; scale-x: 0.816; scale-y: 0.72; }
        frame 18 { y: 16.8; skew-x: 19; skew-y: 5.8; scale-x: 0.822; scale-y: 0.704; }
        frame 19 { x: 51.9; y: 16.5; skew-x: 16.5; skew-y: 5; scale-x: 0.819; scale-y: 0.716; }
        frame 20 { x: 51.8; y: 16.1; skew-x: 14.1; skew-y: 4.3; scale-x: 0.816; scale-y: 0.728; }
        frame 21 { x: 51.6; y: 15.8; skew-x: 11.8; skew-y: 3.5; scale-x: 0.813; scale-y: 0.74; }
        frame 22 { x: 51.5; y: 15.5; skew-x: 9.3; skew-y: 2.8; scale-x: 0.811; scale-y: 0.752; }
        frame 23 { x: -10000; y: 15.1; skew-x: 7; skew-y: 2; scale-x: 0.808; scale-y: 0.764; }
        frame 24 { x: 51.4; y: 14.8; skew-x: 4.6; skew-y: 1.3; scale-x: 0.805; scale-y: 0.776; }
        frame 25 { x: 51.3; y: 14.4; skew-x: 2.3; skew-y: 0.6; scale-x: 0.803; scale-y: 0.788; }
        frame 26 { x: 51.2; y: 14; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 28 { cel: -10000; }
        frame 32 { cel: 0; }
        frame 33 { x: 51.1; y: 14.5; skew-x: -2.7; scale-x: 0.803; cel: -10000; }
        frame 34 { x: -10000; y: 15; skew-x: -5.4; scale-x: 0.805; }
        frame 35 { y: 15.6; skew-x: -8.3; scale-x: 0.809; }
        frame 36 { x: 51.2; y: 15.8; skew-x: -3.4; skew-y: 1.5; scale-x: 0.808; scale-y: 0.791; }
        frame 37 { x: 51.4; y: 16.1; skew-x: 1; skew-y: 3.3; scale-x: -10000; scale-y: 0.781; }
        frame 38 { x: 51.5; y: 16.4; skew-x: 5.8; skew-y: 4.8; scale-x: 0.807; scale-y: 0.772; }
        frame 39 { x: 51.9; y: 16.7; skew-x: 10.5; skew-y: 6.5; scale-x: 0.806; scale-y: 0.762; }
        frame 40 { x: 52.2; y: 17.1; skew-x: 15.4; skew-y: 8.2; scale-x: -10000; scale-y: 0.753; }
        frame 41 { x: -10000; y: 17.2; skew-x: 15.3; skew-y: 8.1; scale-x: 0.805; scale-y: -10000; }
        frame 42 { y: 17.1; skew-x: 15.4; skew-y: 8.2; scale-x: 0.806; }
        frame 43 { x: 52.1; y: 17; skew-x: 16.5; skew-y: 7.3; scale-x: 0.811; scale-y: 0.737; }
        frame 44 { x: 52; y: 16.9; skew-x: 17.8; skew-y: 6.5; scale-x: 0.816; scale-y: 0.72; }
        frame 45 { y: 16.8; skew-x: 19; skew-y: 5.8; scale-x: 0.822; scale-y: 0.704; }
        frame 46 { x: 51.9; y: 16.5; skew-x: 16.5; skew-y: 5; scale-x: 0.819; scale-y: 0.716; }
        frame 47 { x: 51.8; y: 16.1; skew-x: 14.1; skew-y: 4.3; scale-x: 0.816; scale-y: 0.728; }
        frame 48 { x: 51.6; y: 15.8; skew-x: 11.8; skew-y: 3.5; scale-x: 0.813; scale-y: 0.74; }
        frame 49 { x: 51.5; y: 15.5; skew-x: 9.3; skew-y: 2.8; scale-x: 0.811; scale-y: 0.752; }
        frame 50 { x: -10000; y: 15.1; skew-x: 7; skew-y: 2; scale-x: 0.808; scale-y: 0.764; }
        frame 51 { x: 51.4; y: 14.8; skew-x: 4.6; skew-y: 1.3; scale-x: 0.805; scale-y: 0.776; }
        frame 52 { x: 51.3; y: 14.4; skew-x: 2.3; skew-y: 0.6; scale-x: 0.803; scale-y: 0.788; }
        frame 53 { x: 51.2; y: 14; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Tanglekelp_arm7";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 63.8; y: 21.2; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_TANGLEKELP_ARM7; }
        frame 6 { x: -10000; y: 20.7; skew-x: 2.5; scale-x: 0.803; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 63.6; y: 20.1; skew-x: 5; scale-x: 0.806; }
        frame 8 { x: 63.5; y: 19.7; skew-x: 7.6; scale-x: 0.809; }
        frame 9 { x: -10000; y: 19.1; skew-x: 10.3; scale-x: 0.813; }
        frame 10 { y: 20.3; skew-x: 8.5; scale-x: 0.811; scale-y: 0.792; }
        frame 11 { y: 21.5; skew-x: 6.8; scale-x: 0.808; scale-y: 0.785; }
        frame 12 { y: 22.7; skew-x: 5; scale-x: 0.806; scale-y: 0.777; }
        frame 13 { y: 23.9; skew-x: 3.3; scale-x: 0.804; scale-y: 0.769; }
        frame 14 { x: 63.6; y: 25.1; skew-x: 1.6; scale-x: 0.802; scale-y: 0.761; }
        frame 15 { x: -10000; y: 26.3; skew-x: 0; scale-x: 0.8; scale-y: 0.754; }
        frame 16 { y: 26.2; skew-x: 0.5; skew-y: 0.3; scale-x: -10000; scale-y: 0.744; }
        frame 17 { x: 63.7; y: 26.3; skew-x: 1; skew-y: 0.5; scale-y: 0.734; }
        frame 18 { x: -10000; y: -10000; skew-x: 1.5; skew-y: 0.8; scale-y: 0.724; }
        frame 19 { x: 63.8; skew-x: 2.1; skew-y: 1.2; scale-x: 0.801; scale-y: 0.714; }
        frame 20 { x: 63.7; y: 25.6; skew-x: 1.8; skew-y: 0.8; scale-x: 0.8; scale-y: 0.727; }
        frame 21 { x: -10000; y: 25; skew-x: 1.3; skew-y: -10000; scale-x: -10000; scale-y: 0.739; }
        frame 22 { y: 24.2; skew-x: 1; skew-y: 0.5; scale-y: 0.751; }
        frame 23 { x: 63.8; y: 23.5; skew-x: 0.8; skew-y: 0.3; scale-y: 0.763; }
        frame 24 { x: -10000; y: 22.8; skew-x: 0.5; skew-y: -10000; scale-y: 0.776; }
        frame 25 { y: 22.1; skew-x: 0.3; skew-y: 0; scale-y: 0.788; }
        frame 26 { y: 21.2; skew-x: 0; skew-y: -10000; scale-y: 0.8; }
        frame 27 { y: -10000; skew-x: -10000; scale-y: -10000; cel: -1; }
        frame 28 { cel: -10000; }
        frame 32 { cel: 0; }
        frame 33 { y: 20.7; skew-x: 2.5; scale-x: 0.803; cel: -10000; }
        frame 34 { x: 63.6; y: 20.1; skew-x: 5; scale-x: 0.806; }
        frame 35 { x: 63.5; y: 19.7; skew-x: 7.6; scale-x: 0.809; }
        frame 36 { x: -10000; y: 19.1; skew-x: 10.3; scale-x: 0.813; }
        frame 37 { y: 20.3; skew-x: 8.5; scale-x: 0.811; scale-y: 0.792; }
        frame 38 { y: 21.5; skew-x: 6.8; scale-x: 0.808; scale-y: 0.785; }
        frame 39 { y: 22.7; skew-x: 5; scale-x: 0.806; scale-y: 0.777; }
        frame 40 { y: 23.9; skew-x: 3.3; scale-x: 0.804; scale-y: 0.769; }
        frame 41 { x: 63.6; y: 25.1; skew-x: 1.6; scale-x: 0.802; scale-y: 0.761; }
        frame 42 { x: -10000; y: 26.3; skew-x: 0; scale-x: 0.8; scale-y: 0.754; }
        frame 43 { y: 26.2; skew-x: 0.5; skew-y: 0.3; scale-x: -10000; scale-y: 0.744; }
        frame 44 { x: 63.7; y: 26.3; skew-x: 1; skew-y: 0.5; scale-y: 0.734; }
        frame 45 { x: -10000; y: -10000; skew-x: 1.5; skew-y: 0.8; scale-y: 0.724; }
        frame 46 { x: 63.8; skew-x: 2.1; skew-y: 1.2; scale-x: 0.801; scale-y: 0.714; }
        frame 47 { x: 63.7; y: 25.6; skew-x: 1.8; skew-y: 0.8; scale-x: 0.8; scale-y: 0.727; }
        frame 48 { x: -10000; y: 25; skew-x: 1.3; skew-y: -10000; scale-x: -10000; scale-y: 0.739; }
        frame 49 { y: 24.2; skew-x: 1; skew-y: 0.5; scale-y: 0.751; }
        frame 50 { x: 63.8; y: 23.5; skew-x: 0.8; skew-y: 0.3; scale-y: 0.763; }
        frame 51 { x: -10000; y: 22.8; skew-x: 0.5; skew-y: -10000; scale-y: 0.776; }
        frame 52 { y: 22.1; skew-x: 0.3; skew-y: 0; scale-y: 0.788; }
        frame 53 { y: 21.2; skew-x: 0; skew-y: -10000; scale-y: 0.8; }
    }
    Track {
        source-name: "Tanglekelp_arm8";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 66.1; y: 28.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: "IMAGE_REANIM_TANGLEKELP_ARM 8"; }
        frame 6 { x: -10000; y: 29.1; skew-x: -2.2; scale-x: 0.803; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 29.4; skew-x: -4.7; scale-x: 0.805; }
        frame 8 { x: 66.2; y: 29.7; skew-x: -7; scale-x: 0.808; }
        frame 9 { x: -10000; y: 30; skew-x: -9.5; scale-x: 0.811; }
        frame 10 { y: 30.2; skew-x: -6.4; scale-x: -10000; scale-y: 0.792; }
        frame 11 { x: 66.1; y: 30.4; skew-x: -3.4; scale-x: 0.81; scale-y: 0.785; }
        frame 12 { x: -10000; y: 30.7; skew-x: -0.4; scale-x: -10000; scale-y: 0.777; }
        frame 13 { y: 31; skew-x: 2.3; scale-x: 0.809; scale-y: 0.769; }
        frame 14 { y: 31.2; skew-x: 5.3; scale-x: -10000; scale-y: 0.761; }
        frame 15 { y: 31.3; skew-x: 8.3; scale-x: 0.808; scale-y: 0.754; }
        frame 16 { y: 31.2; skew-x: 8.8; scale-x: 0.81; scale-y: 0.757; }
        frame 17 { y: 31.1; skew-x: 9.3; scale-x: 0.811; scale-y: 0.76; }
        frame 18 { y: 30.9; skew-x: 9.8; scale-x: 0.813; scale-y: 0.764; }
        frame 19 { y: 30.8; skew-x: 10.5; scale-x: 0.815; scale-y: 0.767; }
        frame 20 { y: 30.5; skew-x: 9; scale-x: 0.813; scale-y: 0.772; }
        frame 21 { y: 30.2; skew-x: 7.5; scale-x: 0.811; scale-y: 0.777; }
        frame 22 { y: 29.9; skew-x: 6; scale-x: 0.808; scale-y: 0.781; }
        frame 23 { y: 29.7; skew-x: 4.5; scale-x: 0.806; scale-y: 0.786; }
        frame 24 { y: 29.4; skew-x: 3; scale-x: 0.804; scale-y: 0.791; }
        frame 25 { y: 29.1; skew-x: 1.5; scale-x: 0.802; scale-y: 0.795; }
        frame 26 { y: 28.8; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 27 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 28 { cel: -10000; }
        frame 32 { cel: 0; }
        frame 33 { y: 29.1; skew-x: -2.2; scale-x: 0.803; cel: -10000; }
        frame 34 { y: 29.4; skew-x: -4.7; scale-x: 0.805; }
        frame 35 { x: 66.2; y: 29.7; skew-x: -7; scale-x: 0.808; }
        frame 36 { x: -10000; y: 30; skew-x: -9.5; scale-x: 0.811; }
        frame 37 { y: 30.2; skew-x: -6.4; scale-x: -10000; scale-y: 0.792; }
        frame 38 { x: 66.1; y: 30.4; skew-x: -3.4; scale-x: 0.81; scale-y: 0.785; }
        frame 39 { x: -10000; y: 30.7; skew-x: -0.4; scale-x: -10000; scale-y: 0.777; }
        frame 40 { y: 31; skew-x: 2.3; scale-x: 0.809; scale-y: 0.769; }
        frame 41 { y: 31.2; skew-x: 5.3; scale-x: -10000; scale-y: 0.761; }
        frame 42 { y: 31.3; skew-x: 8.3; scale-x: 0.808; scale-y: 0.754; }
        frame 43 { y: 31.2; skew-x: 8.8; scale-x: 0.81; scale-y: 0.757; }
        frame 44 { y: 31.1; skew-x: 9.3; scale-x: 0.811; scale-y: 0.76; }
        frame 45 { y: 30.9; skew-x: 9.8; scale-x: 0.813; scale-y: 0.764; }
        frame 46 { y: 30.8; skew-x: 10.5; scale-x: 0.815; scale-y: 0.767; }
        frame 47 { y: 30.5; skew-x: 9; scale-x: 0.813; scale-y: 0.772; }
        frame 48 { y: 30.2; skew-x: 7.5; scale-x: 0.811; scale-y: 0.777; }
        frame 49 { y: 29.9; skew-x: 6; scale-x: 0.808; scale-y: 0.781; }
        frame 50 { y: 29.7; skew-x: 4.5; scale-x: 0.806; scale-y: 0.786; }
        frame 51 { y: 29.4; skew-x: 3; scale-x: 0.804; scale-y: 0.791; }
        frame 52 { y: 29.1; skew-x: 1.5; scale-x: 0.802; scale-y: 0.795; }
        frame 53 { y: 28.8; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Layer 29";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 27 { x: 56; y: 15.8; cel: 0; image: IMAGE_REANIM_TANGLEKELP_GRAB_BACK1; }
        frame 28 { x: 56.3; y: 15.5; cel: -10000; image: IMAGE_REANIM_TANGLEKELP_GRAB_BACK2; }
        frame 29 { x: 55.3; y: 15.4; image: IMAGE_REANIM_TANGLEKELP_GRAB_BACK3; }
        frame 30 { x: 55.2; y: 16.1; scale-x: 0.975; scale-y: 0.975; image: IMAGE_REANIM_TANGLEKELP_GRAB_BACK4; }
        frame 31 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "Layer 32";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 27 { x: 56; y: 15.9; cel: 0; image: IMAGE_REANIM_TANGLEKELP_GRAB_FRONT1; }
        frame 28 { x: 56.2; y: 15.4; cel: -10000; image: IMAGE_REANIM_TANGLEKELP_GRAB_FRONT2; }
        frame 29 { x: 56.3; y: -10000; image: IMAGE_REANIM_TANGLEKELP_GRAB_FRONT3; }
        frame 30 { x: 55.8; y: 15.5; scale-x: 1.023; image: IMAGE_REANIM_TANGLEKELP_GRAB_FRONT4; }
        frame 31 { x: 56.4; y: 15.4; scale-x: 1; image: IMAGE_REANIM_TANGLEKELP_GRAB_FRONT5; }
        frame 32 { x: -10000; y: -10000; scale-x: -10000; cel: -1; image: none; }
        frame 33 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 54;
        frame 0 { cel: -1; }
        frame 1 { x: 21.7; y: 42.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_TANGLEKELP_BLINK1; }
        frame 2 { x: 21.5; y: 43.3; scale-x: -10000; scale-y: 0.757; cel: -10000; image: IMAGE_REANIM_TANGLEKELP_BLINK2; }
        frame 3 { x: 21.7; y: 42.8; scale-y: 0.8; image: IMAGE_REANIM_TANGLEKELP_BLINK1; }
        frame 4 { x: -10000; y: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
}
