export component Chomper {
    fps: 12;
    Track {
        source-name: "anim_swallow";
        frame-count: 94;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 66 { x: 23.8; y: -22.2; skew-x: 25; skew-y: 25; scale-x: 0.999; scale-y: 0.999; cel: 0; }
        frame 67 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
    }
    Track {
        source-name: "anim_chew";
        frame-count: 94;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 50 { x: 3.6; y: -2.9; skew-x: 6; skew-y: 6; cel: 0; }
        frame 51 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -10000; }
        frame 66 { cel: -1; }
        frame 67 { cel: -10000; }
    }
    Track {
        source-name: "anim_bite";
        frame-count: 94;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 25 { cel: 0; }
        frame 26 { cel: -10000; }
        frame 50 { cel: -1; }
        frame 51 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 94;
        frame 0 { x: 0.2; y: -2.1; }
        frame 1 { x: -10000; y: -10000; }
        frame 25 { cel: -1; }
        frame 26 { cel: -10000; }
    }
    Track {
        source-name: "Chomper_groundleaf4";
        frame-count: 94;
        frame 0 { x: 32.8; y: 65.7; scale-x: 0.64; scale-y: 0.64; image: IMAGE_REANIM_CHOMPER_GROUNDLEAF4; }
        frame 1 { x: -10000; y: 65.2; scale-x: -10000; scale-y: 0.681; image: none; }
        frame 2 { y: 64.7; scale-y: 0.722; }
        frame 3 { y: 64.2; scale-y: 0.763; }
        frame 4 { x: 32.9; y: 63.6; scale-y: 0.804; }
        frame 5 { x: -10000; y: 63.1; scale-y: 0.845; }
        frame 6 { x: 32.8; y: 62.6; scale-y: 0.886; }
        frame 7 { x: 32.7; y: 62.8; skew-x: -1.7; skew-y: -1.7; scale-y: 0.885; }
        frame 8 { x: -10000; y: 63.1; skew-x: -3.4; skew-y: -3.4; scale-y: -10000; }
        frame 9 { x: 32.6; y: 63.3; skew-x: -5.2; skew-y: -5.2; }
        frame 10 { x: -10000; y: 63.5; skew-x: -6.9; skew-y: -6.9; scale-x: 0.639; }
        frame 11 { x: 32.5; y: 63.7; skew-x: -8.7; skew-y: -8.7; scale-x: -10000; }
        frame 12 { x: -10000; y: 64; skew-x: -10.5; skew-y: -10.5; scale-x: 0.64; }
        frame 13 { x: 32.3; y: 64.6; skew-x: -10.9; skew-y: -10.9; scale-x: 0.639; scale-y: 0.884; }
        frame 14 { x: 32.1; y: 65.2; skew-x: -11.5; skew-y: -11.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 32; y: 65.7; skew-x: -12.2; skew-y: -12.2; }
        frame 16 { x: 31.9; y: 66.3; skew-x: -12.7; skew-y: -12.7; }
        frame 17 { x: 31.7; y: 66.8; skew-x: -13.2; skew-y: -13.2; }
        frame 18 { x: 31.6; y: 67.3; skew-x: -13.9; skew-y: -13.9; scale-y: 0.885; }
        frame 19 { x: 31.9; y: 67.1; skew-x: -11.5; skew-y: -11.5; scale-y: 0.843; }
        frame 20 { x: 32; y: 66.8; skew-x: -9.2; skew-y: -9.2; scale-y: 0.803; }
        frame 21 { x: 32.3; y: 66.5; skew-x: -6.9; skew-y: -6.9; scale-y: 0.762; }
        frame 22 { x: 32.4; y: 66.1; skew-x: -4.4; skew-y: -4.4; scale-x: 0.64; scale-y: 0.721; }
        frame 23 { x: 32.5; y: 65.9; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: 0.681; }
        frame 24 { x: 32.8; y: 65.7; skew-x: 0; skew-y: 0; scale-y: 0.64; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { x: 32.4; y: 65.2; skew-x: -0.7; skew-y: -0.7; scale-y: 0.681; }
        frame 27 { x: 32; y: 64.7; skew-x: -1.4; skew-y: -1.4; scale-y: 0.722; }
        frame 28 { x: 31.6; y: 64.2; skew-x: -2.2; skew-y: -2.2; scale-y: 0.763; }
        frame 29 { x: 31.2; y: 63.5; skew-x: -2.9; skew-y: -2.9; scale-y: 0.803; }
        frame 30 { x: 30.8; y: 63; skew-x: -3.7; skew-y: -3.7; scale-y: 0.844; }
        frame 31 { x: 30.3; y: 62.5; skew-x: -4.4; skew-y: -4.4; scale-y: 0.885; }
        frame 32 { x: -10000; y: 62.8; skew-x: -5.4; skew-y: -5.4; scale-y: -10000; }
        frame 33 { x: 30.4; y: 63; skew-x: -6.4; skew-y: -6.4; scale-x: 0.639; }
        frame 34 { x: 30.5; y: 63.4; skew-x: -7.4; skew-y: -7.4; scale-x: -10000; }
        frame 35 { x: 30.6; y: 63.5; skew-x: -8.4; skew-y: -8.4; }
        frame 36 { x: 30.7; y: 63.7; skew-x: -9.4; skew-y: -9.4; }
        frame 37 { x: -10000; y: 64; skew-x: -10.5; skew-y: -10.5; scale-x: 0.64; }
        frame 38 { y: 64.6; skew-x: -10.9; skew-y: -10.9; scale-x: 0.639; scale-y: 0.884; }
        frame 39 { y: 65.2; skew-x: -11.5; skew-y: -11.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { y: 65.7; skew-x: -12.2; skew-y: -12.2; }
        frame 41 { y: 66.3; skew-x: -12.7; skew-y: -12.7; }
        frame 42 { y: 66.8; skew-x: -13.2; skew-y: -13.2; }
        frame 43 { y: 67.3; skew-x: -13.9; skew-y: -13.9; scale-y: 0.885; }
        frame 44 { x: 31.1; y: 67; skew-x: -11.5; skew-y: -11.5; scale-y: 0.843; }
        frame 45 { x: 31.5; y: 66.8; skew-x: -9.2; skew-y: -9.2; scale-y: 0.803; }
        frame 46 { x: 31.8; y: 66.5; skew-x: -6.9; skew-y: -6.9; scale-y: 0.762; }
        frame 47 { x: 32.1; y: 66.2; skew-x: -4.4; skew-y: -4.4; scale-x: 0.64; scale-y: 0.721; }
        frame 48 { x: 32.4; y: 66; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: 0.681; }
        frame 49 { x: 32.8; y: 65.7; skew-x: 0; skew-y: 0; scale-y: 0.64; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 51 { x: 32; y: 64.7; skew-x: -1.4; skew-y: -1.4; scale-y: 0.722; }
        frame 52 { x: 31.2; y: 63.5; skew-x: -2.9; skew-y: -2.9; scale-y: 0.803; }
        frame 53 { x: 30.3; y: 62.5; skew-x: -4.4; skew-y: -4.4; scale-y: 0.885; }
        frame 54 { x: 30.4; y: 62.9; skew-x: -5.9; skew-y: -5.9; scale-y: -10000; }
        frame 55 { x: 30.5; y: 63.4; skew-x: -7.4; skew-y: -7.4; scale-x: 0.639; }
        frame 56 { x: 30.7; y: 63.6; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; }
        frame 57 { x: -10000; y: 64; skew-x: -10.5; skew-y: -10.5; scale-x: 0.64; }
        frame 58 { y: 64.8; skew-x: -11.2; skew-y: -11.2; scale-x: 0.639; scale-y: 0.884; }
        frame 59 { y: 65.7; skew-x: -12.2; skew-y: -12.2; scale-x: -10000; scale-y: -10000; }
        frame 60 { y: 66.6; skew-x: -13; skew-y: -13; }
        frame 61 { y: 67.3; skew-x: -13.9; skew-y: -13.9; scale-y: 0.885; }
        frame 62 { x: 31.3; y: 67; skew-x: -10.4; skew-y: -10.4; scale-y: 0.823; }
        frame 63 { x: 31.8; y: 66.5; skew-x: -6.9; skew-y: -6.9; scale-y: 0.762; }
        frame 64 { x: 32.3; y: 66.1; skew-x: -3.4; skew-y: -3.4; scale-x: 0.64; scale-y: 0.701; }
        frame 65 { x: 32.8; y: 65.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.64; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 67 { y: 65.3; scale-y: 0.675; }
        frame 68 { y: 64.8; scale-y: 0.71; }
        frame 69 { y: 64.3; scale-y: 0.745; }
        frame 70 { x: 32.9; y: 63.9; scale-y: 0.78; }
        frame 71 { x: -10000; y: 63.5; scale-y: 0.815; }
        frame 72 { y: 63; scale-y: 0.851; }
        frame 73 { x: 32.8; y: 62.6; scale-y: 0.886; }
        frame 74 { x: -10000; y: 62.8; skew-x: -1.4; skew-y: -1.4; scale-y: -10000; }
        frame 75 { x: 32.7; y: 63; skew-x: -2.9; skew-y: -2.9; scale-y: 0.885; }
        frame 76 { x: 32.6; y: 63.1; skew-x: -4.4; skew-y: -4.4; scale-y: -10000; }
        frame 77 { x: -10000; y: 63.3; skew-x: -5.9; skew-y: -5.9; }
        frame 78 { x: 32.5; y: 63.5; skew-x: -7.4; skew-y: -7.4; scale-x: 0.639; }
        frame 79 { x: -10000; y: 63.8; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; }
        frame 80 { y: 64; skew-x: -10.5; skew-y: -10.5; scale-x: 0.64; }
        frame 81 { x: 32.3; y: 64.6; skew-x: -10.9; skew-y: -10.9; scale-x: 0.639; scale-y: 0.884; }
        frame 82 { x: 32.1; y: 65.2; skew-x: -11.5; skew-y: -11.5; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 32; y: 65.7; skew-x: -12.2; skew-y: -12.2; }
        frame 84 { x: 31.9; y: 66.3; skew-x: -12.7; skew-y: -12.7; }
        frame 85 { x: 31.7; y: 66.8; skew-x: -13.2; skew-y: -13.2; }
        frame 86 { x: 31.6; y: 67.3; skew-x: -13.9; skew-y: -13.9; scale-y: 0.885; }
        frame 87 { x: 31.8; y: 67.1; skew-x: -11.9; skew-y: -11.9; scale-y: 0.849; }
        frame 88 { x: 32; y: 66.8; skew-x: -9.9; skew-y: -9.9; scale-y: 0.814; }
        frame 89 { x: 32.1; y: 66.6; skew-x: -7.9; skew-y: -7.9; scale-y: 0.779; }
        frame 90 { x: 32.3; y: 66.3; skew-x: -5.9; skew-y: -5.9; scale-y: 0.745; }
        frame 91 { x: 32.4; y: 66.1; skew-x: -3.9; skew-y: -3.9; scale-x: 0.64; scale-y: 0.71; }
        frame 92 { x: 32.5; y: 65.9; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: 0.675; }
        frame 93 { x: 32.8; y: 65.7; skew-x: 0; skew-y: 0; scale-y: 0.64; }
    }
    Track {
        source-name: "Chomper_groundleaf3";
        frame-count: 94;
        frame 0 { x: 6.1; y: 65.2; scale-x: 0.64; scale-y: 0.64; image: IMAGE_REANIM_CHOMPER_GROUNDLEAF3; }
        frame 1 { x: -10000; y: 64.9; scale-x: -10000; scale-y: 0.673; image: none; }
        frame 2 { x: 6.2; y: 64.6; scale-y: 0.707; }
        frame 3 { x: 6.3; y: 64.3; scale-y: 0.74; }
        frame 4 { x: -10000; y: 64; scale-y: 0.773; }
        frame 5 { x: 6.4; y: 63.6; scale-y: 0.807; }
        frame 6 { x: -10000; y: 63.3; scale-y: 0.84; }
        frame 7 { x: 6.8; y: 62.5; skew-x: 1.8; skew-y: 1.8; scale-y: 0.834; }
        frame 8 { x: 7.2; y: 61.8; skew-x: 3.5; skew-y: 3.5; scale-y: 0.827; }
        frame 9 { x: 7.6; y: 61; skew-x: 5.5; skew-y: 5.5; scale-y: 0.821; }
        frame 10 { x: 8; y: 60.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.639; scale-y: 0.815; }
        frame 11 { x: 8.4; y: 59.5; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: 0.809; }
        frame 12 { x: 8.9; y: 58.6; skew-x: 11; skew-y: 11; scale-x: 0.64; scale-y: 0.803; }
        frame 13 { x: 9; y: 59; skew-x: 11.3; skew-y: 11.3; scale-x: 0.639; scale-y: 0.789; }
        frame 14 { x: -10000; y: 59.4; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: 0.775; }
        frame 15 { y: 59.9; skew-x: 12; skew-y: 12; scale-y: 0.761; }
        frame 16 { x: 9.1; y: 60.3; skew-x: 12.5; skew-y: 12.5; scale-y: 0.748; }
        frame 17 { x: -10000; y: 60.6; skew-x: 12.8; skew-y: 12.8; scale-y: 0.734; }
        frame 18 { y: 61; skew-x: 13.3; skew-y: 13.3; scale-y: 0.721; }
        frame 19 { x: 8.6; y: 61.8; skew-x: 11; skew-y: 11; scale-y: 0.707; }
        frame 20 { x: 8; y: 62.4; skew-x: 8.8; skew-y: 8.8; scale-y: 0.694; }
        frame 21 { x: 7.4; y: 63.1; skew-x: 6.5; skew-y: 6.5; scale-y: 0.68; }
        frame 22 { x: 7; y: 63.8; skew-x: 4.3; skew-y: 4.3; scale-x: 0.64; scale-y: 0.667; }
        frame 23 { x: 6.5; y: 64.5; skew-x: 2.1; skew-y: 2.1; scale-x: -10000; scale-y: 0.653; }
        frame 24 { x: 6.1; y: 65.2; skew-x: 0; skew-y: 0; scale-y: 0.64; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { y: 64.9; scale-y: 0.673; }
        frame 27 { x: 6.2; y: 64.6; scale-y: 0.707; }
        frame 28 { x: 6.3; y: 64.3; scale-y: 0.74; }
        frame 29 { x: -10000; y: 64; scale-y: 0.773; }
        frame 30 { x: 6.4; y: 63.6; scale-y: 0.807; }
        frame 31 { x: -10000; y: 63.3; scale-y: 0.84; }
        frame 32 { x: 6.8; y: 62.5; skew-x: 1.8; skew-y: 1.8; scale-y: 0.834; }
        frame 33 { x: 7.2; y: 61.8; skew-x: 3.5; skew-y: 3.5; scale-y: 0.827; }
        frame 34 { x: 7.6; y: 61; skew-x: 5.5; skew-y: 5.5; scale-y: 0.821; }
        frame 35 { x: 8; y: 60.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.639; scale-y: 0.815; }
        frame 36 { x: 8.4; y: 59.5; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: 0.809; }
        frame 37 { x: 8.9; y: 58.6; skew-x: 11; skew-y: 11; scale-x: 0.64; scale-y: 0.803; }
        frame 38 { x: 9; y: 59; skew-x: 11.3; skew-y: 11.3; scale-x: 0.639; scale-y: 0.789; }
        frame 39 { x: -10000; y: 59.4; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: 0.775; }
        frame 40 { y: 59.9; skew-x: 12; skew-y: 12; scale-y: 0.761; }
        frame 41 { x: 9.1; y: 60.3; skew-x: 12.5; skew-y: 12.5; scale-y: 0.748; }
        frame 42 { x: -10000; y: 60.6; skew-x: 12.8; skew-y: 12.8; scale-y: 0.734; }
        frame 43 { y: 61; skew-x: 13.3; skew-y: 13.3; scale-y: 0.721; }
        frame 44 { x: 8.6; y: 61.8; skew-x: 11; skew-y: 11; scale-y: 0.707; }
        frame 45 { x: 8; y: 62.4; skew-x: 8.8; skew-y: 8.8; scale-y: 0.694; }
        frame 46 { x: 7.4; y: 63.1; skew-x: 6.5; skew-y: 6.5; scale-y: 0.68; }
        frame 47 { x: 7; y: 63.8; skew-x: 4.3; skew-y: 4.3; scale-x: 0.64; scale-y: 0.667; }
        frame 48 { x: 6.5; y: 64.5; skew-x: 2.1; skew-y: 2.1; scale-x: -10000; scale-y: 0.653; }
        frame 49 { x: 6.1; y: 65.2; skew-x: 0; skew-y: 0; scale-y: 0.64; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 51 { x: 6.2; y: 64.6; scale-y: 0.707; }
        frame 52 { x: 6.3; y: 64; scale-y: 0.773; }
        frame 53 { x: 6.4; y: 63.3; scale-y: 0.84; }
        frame 54 { x: 7; y: 62.1; skew-x: 2.8; skew-y: 2.8; scale-y: 0.831; }
        frame 55 { x: 7.6; y: 61; skew-x: 5.5; skew-y: 5.5; scale-y: 0.821; }
        frame 56 { x: 8.3; y: 59.9; skew-x: 8.3; skew-y: 8.3; scale-x: 0.639; scale-y: 0.812; }
        frame 57 { x: 8.9; y: 58.6; skew-x: 11; skew-y: 11; scale-x: 0.64; scale-y: 0.803; }
        frame 58 { x: -10000; y: 59.3; skew-x: 11.5; skew-y: 11.5; scale-x: 0.639; scale-y: 0.782; }
        frame 59 { x: 9; y: 59.9; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: 0.761; }
        frame 60 { x: 9.1; y: 60.5; skew-x: 12.6; skew-y: 12.6; scale-y: 0.741; }
        frame 61 { x: -10000; y: 61; skew-x: 13.3; skew-y: 13.3; scale-y: 0.721; }
        frame 62 { x: 8.2; y: 62; skew-x: 9.8; skew-y: 9.8; scale-y: 0.7; }
        frame 63 { x: 7.4; y: 63.1; skew-x: 6.5; skew-y: 6.5; scale-y: 0.68; }
        frame 64 { x: 6.7; y: 64.1; skew-x: 3.3; skew-y: 3.3; scale-x: 0.64; scale-y: 0.66; }
        frame 65 { x: 6.1; y: 65.2; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.64; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 67 { y: 65; scale-y: 0.669; }
        frame 68 { x: 6.2; y: 64.7; scale-y: 0.697; }
        frame 69 { x: -10000; y: 64.4; scale-y: 0.726; }
        frame 70 { x: 6.3; y: 64.2; scale-y: 0.754; }
        frame 71 { x: -10000; y: 63.9; scale-y: 0.783; }
        frame 72 { x: 6.4; y: 63.6; scale-y: 0.811; }
        frame 73 { x: -10000; y: 63.3; scale-y: 0.84; }
        frame 74 { x: 6.8; y: 62.6; skew-x: 1.5; skew-y: 1.5; scale-y: 0.835; }
        frame 75 { x: 7.1; y: 62; skew-x: 3; skew-y: 3; scale-y: 0.829; }
        frame 76 { x: 7.4; y: 61.4; skew-x: 4.6; skew-y: 4.6; scale-y: 0.824; }
        frame 77 { x: 7.8; y: 60.6; skew-x: 6.3; skew-y: 6.3; scale-y: 0.818; }
        frame 78 { x: 8.2; y: 60; skew-x: 7.8; skew-y: 7.8; scale-x: 0.639; scale-y: 0.813; }
        frame 79 { x: 8.5; y: 59.4; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: 0.808; }
        frame 80 { x: 8.9; y: 58.6; skew-x: 11; skew-y: 11; scale-x: 0.64; scale-y: 0.803; }
        frame 81 { x: 9; y: 59; skew-x: 11.3; skew-y: 11.3; scale-x: 0.639; scale-y: 0.789; }
        frame 82 { x: -10000; y: 59.4; skew-x: 11.8; skew-y: 11.8; scale-x: -10000; scale-y: 0.775; }
        frame 83 { y: 59.9; skew-x: 12; skew-y: 12; scale-y: 0.761; }
        frame 84 { x: 9.1; y: 60.3; skew-x: 12.5; skew-y: 12.5; scale-y: 0.748; }
        frame 85 { x: -10000; y: 60.6; skew-x: 12.8; skew-y: 12.8; scale-y: 0.734; }
        frame 86 { y: 61; skew-x: 13.3; skew-y: 13.3; scale-y: 0.721; }
        frame 87 { x: 8.6; y: 61.6; skew-x: 11.3; skew-y: 11.3; scale-y: 0.709; }
        frame 88 { x: 8.1; y: 62.2; skew-x: 9.3; skew-y: 9.3; scale-y: 0.697; }
        frame 89 { x: 7.7; y: 62.9; skew-x: 7.5; skew-y: 7.5; scale-y: 0.686; }
        frame 90 { x: 7.3; y: 63.4; skew-x: 5.6; skew-y: 5.6; scale-y: 0.674; }
        frame 91 { x: 6.7; y: 63.9; skew-x: 3.8; skew-y: 3.8; scale-x: 0.64; scale-y: 0.663; }
        frame 92 { x: 6.4; y: 64.6; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: 0.651; }
        frame 93 { x: 6.1; y: 65.2; skew-x: 0; skew-y: 0; scale-y: 0.64; }
    }
    Track {
        source-name: "Chomper_stem3";
        frame-count: 94;
        frame 0 { x: 27.2; y: 67.4; skew-x: 5.2; skew-y: 358.4; scale-x: 0.835; scale-y: 0.698; image: IMAGE_REANIM_CHOMPER_STEM3; }
        frame 1 { x: 27.4; y: 67.6; skew-x: 6.1; skew-y: 357.6; scale-x: 0.826; scale-y: 0.684; image: none; }
        frame 2 { x: 27.8; y: 67.1; skew-x: 7.8; skew-y: 357; scale-x: 0.818; scale-y: 0.732; }
        frame 3 { x: 28.3; y: 66.6; skew-x: 9.3; skew-y: 356.2; scale-x: 0.811; scale-y: 0.78; }
        frame 4 { x: 28.7; y: 66.1; skew-x: 11.1; skew-y: 355.4; scale-x: 0.804; scale-y: 0.829; }
        frame 5 { x: 29.2; y: 65.5; skew-x: 12.1; skew-y: 358; scale-x: 0.799; scale-y: 0.85; }
        frame 6 { x: 29.5; y: 64.7; skew-x: 13.3; skew-y: 360.1; scale-x: 0.796; scale-y: 0.871; }
        frame 7 { x: 29.9; y: 64.1; skew-x: 14.3; skew-y: 362.5; scale-x: 0.792; scale-y: 0.891; }
        frame 8 { x: 30.3; y: 63.4; skew-x: 15.6; skew-y: 365.1; scale-x: 0.789; scale-y: 0.912; }
        frame 9 { x: 30; y: 63.8; skew-x: 11.3; skew-y: 361.3; scale-x: 0.742; scale-y: 0.888; }
        frame 10 { x: 29.9; y: 64.2; skew-x: 7; skew-y: 357.7; scale-x: 0.697; scale-y: 0.863; }
        frame 11 { x: 29.7; y: 64.6; skew-x: 2.6; skew-y: 354; scale-x: 0.651; scale-y: 0.838; }
        frame 12 { x: 29.5; y: 64.9; skew-x: -1.5; skew-y: 350.2; scale-x: 0.606; scale-y: 0.813; }
        frame 13 { x: 29.7; y: 64.6; skew-x: 2.6; skew-y: 354; scale-x: 0.651; scale-y: 0.838; }
        frame 14 { x: 29.9; y: 64.3; skew-x: 7; skew-y: 357.7; scale-x: 0.697; scale-y: 0.863; }
        frame 15 { x: 30.1; y: 63.9; skew-x: 11.3; skew-y: 361.3; scale-x: 0.742; scale-y: 0.887; }
        frame 16 { x: 30.3; y: 63.4; skew-x: 15.6; skew-y: 365.1; scale-x: 0.789; scale-y: 0.912; }
        frame 17 { x: 29.9; y: 64.1; skew-x: 14.3; skew-y: 362.5; scale-x: 0.792; scale-y: 0.891; }
        frame 18 { x: 29.5; y: 64.8; skew-x: 13.3; skew-y: 360.1; scale-x: 0.795; scale-y: 0.871; }
        frame 19 { x: 29.1; y: 65.4; skew-x: 12.1; skew-y: 358; scale-x: 0.799; scale-y: 0.85; }
        frame 20 { x: 28.7; y: 66.1; skew-x: 11.1; skew-y: 355.4; scale-x: 0.804; scale-y: 0.829; }
        frame 21 { x: 28.4; y: 66.4; skew-x: 9.5; skew-y: 356.2; scale-x: 0.811; scale-y: 0.796; }
        frame 22 { x: 28; y: 66.7; skew-x: 8; skew-y: 357; scale-x: 0.819; scale-y: 0.763; }
        frame 23 { x: 27.7; y: 67.1; skew-x: 6.6; skew-y: 357.7; scale-x: 0.827; scale-y: 0.731; }
        frame 24 { x: 27.2; y: 67.4; skew-x: 5.2; skew-y: 358.4; scale-x: 0.835; scale-y: 0.698; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 27.1; skew-x: 5.3; skew-y: 356.9; scale-x: 0.837; scale-y: 0.716; }
        frame 27 { x: 26.8; y: 67.5; skew-x: -10000; skew-y: 355.2; scale-x: 0.84; scale-y: 0.734; }
        frame 28 { x: 26.6; y: 67.6; skew-x: 5.5; skew-y: 353.7; scale-x: 0.843; scale-y: 0.753; }
        frame 29 { x: 26.4; y: -10000; skew-x: 5.6; skew-y: 351.9; scale-x: 0.845; scale-y: 0.771; }
        frame 30 { x: 26.5; y: 67.8; skew-x: 3.3; skew-y: 348.7; scale-x: 0.847; scale-y: 0.773; }
        frame 31 { x: -10000; y: 68.2; skew-x: 1.3; skew-y: 345.7; scale-x: 0.848; scale-y: 0.775; }
        frame 32 { x: 26.6; y: 68.5; skew-x: -0.7; skew-y: 342.5; scale-x: 0.85; scale-y: 0.778; }
        frame 33 { x: -10000; y: 68.7; skew-x: -2.8; skew-y: 339.2; scale-x: 0.851; scale-y: 0.781; }
        frame 34 { x: 26.7; y: 68.8; skew-x: -5.7; skew-y: 336.2; scale-x: -10000; scale-y: 0.78; }
        frame 35 { x: -10000; y: 68.9; skew-x: -8.7; skew-y: 333.2; scale-x: 0.85; scale-y: 0.779; }
        frame 36 { y: 69; skew-x: -11.9; skew-y: 330.2; scale-x: 0.851; scale-y: 0.78; }
        frame 37 { x: 26.8; y: 68.9; skew-x: -11.7; skew-y: -10000; scale-x: 0.85; scale-y: 0.779; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 26.7; y: 69; skew-x: -11.9; scale-x: 0.851; scale-y: 0.78; }
        frame 40 { x: 26.8; y: 68.9; skew-x: -11.7; scale-x: 0.85; scale-y: 0.779; }
        frame 41 { x: 26.7; y: 69; skew-x: -11.9; scale-x: 0.851; scale-y: 0.78; }
        frame 42 { x: 27; y: 69.3; skew-x: -8.7; skew-y: 333.4; scale-x: 0.85; scale-y: 0.779; }
        frame 43 { x: 27.3; y: 69.5; skew-x: -5.6; skew-y: 336.5; scale-x: -10000; scale-y: 0.78; }
        frame 44 { x: -10000; y: -10000; skew-x: -5.5; skew-y: -10000; scale-y: 0.779; }
        frame 45 { skew-x: -10000; scale-y: -10000; }
        frame 46 { skew-x: -5.6; scale-y: 0.78; }
        frame 47 { y: 68.7; skew-x: -1.9; skew-y: 343.9; scale-x: 0.845; scale-y: 0.752; }
        frame 48 { y: 68; skew-x: 1.5; skew-y: 351.2; scale-x: 0.84; scale-y: 0.725; }
        frame 49 { x: 27.2; y: 67.4; skew-x: 5.2; skew-y: 358.4; scale-x: 0.835; scale-y: 0.698; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { y: 67.2; skew-x: 6; skew-y: 358.6; scale-x: 0.836; scale-y: 0.807; }
        frame 52 { y: 66.8; skew-x: 6.5; skew-y: 359.5; scale-x: 0.835; scale-y: 0.788; }
        frame 53 { y: 66.4; skew-x: 7.3; skew-y: 360; scale-x: -10000; scale-y: 0.769; }
        frame 54 { x: 26.9; y: 66.7; skew-x: 8; skew-y: 360.8; scale-y: 0.748; }
        frame 55 { x: 26.5; y: 67.1; skew-x: 8.8; skew-y: 361.8; scale-y: 0.727; }
        frame 56 { x: 26.1; y: 67.3; skew-x: 9.5; skew-y: 362.7; scale-y: 0.706; }
        frame 57 { x: 26.3; y: -10000; skew-x: 9; skew-y: 362.1; scale-x: 0.834; scale-y: 0.717; }
        frame 58 { x: 26.5; skew-x: 8.6; skew-y: 361.6; scale-x: 0.835; scale-y: 0.728; }
        frame 59 { x: -10000; y: 67.2; skew-x: 8.3; skew-y: 361.3; scale-x: -10000; scale-y: 0.739; }
        frame 60 { x: 26.6; y: -10000; skew-x: 7.8; skew-y: 360.8; scale-y: 0.733; }
        frame 61 { x: 26.7; skew-x: 7.3; skew-y: 360.3; scale-y: 0.726; }
        frame 62 { x: 26.9; skew-x: 6.8; skew-y: 360; scale-y: 0.719; }
        frame 63 { x: 27; y: 67.3; skew-x: 6.1; skew-y: 359.5; scale-y: 0.712; }
        frame 64 { y: 67.2; skew-x: 5.6; skew-y: 359; scale-y: 0.705; }
        frame 65 { x: 27.2; y: 67.4; skew-x: 5.2; skew-y: 358.4; scale-y: 0.698; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 67 { y: 67.2; skew-x: 6; skew-y: 358.6; scale-x: 0.836; scale-y: 0.807; }
        frame 68 { x: 27.5; y: 66.4; skew-x: 9.8; skew-y: 361.8; scale-x: 0.837; scale-y: 0.926; }
        frame 69 { x: 27.7; y: 65.7; skew-x: 13.8; skew-y: 365; scale-x: 0.839; scale-y: 1.045; }
        frame 70 { x: 28; y: 65.3; skew-x: 13.3; skew-y: -10000; scale-x: 0.837; scale-y: 1.006; }
        frame 71 { x: 28.3; y: 64.8; skew-x: 12.8; skew-y: 365.3; scale-x: 0.835; scale-y: 0.968; }
        frame 72 { x: 28.6; y: 64.5; skew-x: 12.3; skew-y: 365.6; scale-x: 0.834; scale-y: 0.93; }
        frame 73 { x: 28.7; y: 64.7; skew-x: -10000; skew-y: 366.5; scale-x: 0.831; scale-y: 0.879; }
        frame 74 { x: 28.9; y: 65; skew-y: 367.5; scale-x: 0.829; scale-y: 0.827; }
        frame 75 { x: 29; y: 65.3; skew-x: 12.4; skew-y: 368.7; scale-x: 0.828; scale-y: 0.777; }
        frame 76 { x: 29.3; y: 65.6; skew-x: 11.3; skew-y: 369.5; scale-x: 0.825; scale-y: 0.714; }
        frame 77 { x: 29.6; y: 65.9; skew-x: 10.3; skew-y: 370.5; scale-x: 0.822; scale-y: 0.651; }
        frame 78 { x: 29.9; y: 66.3; skew-x: 9.3; skew-y: 371.5; scale-x: 0.82; scale-y: 0.588; }
        frame 79 { x: 30; y: 66.2; skew-x: -10000; skew-y: -10000; scale-x: 0.819; scale-y: -10000; }
        frame 80 { x: 29.9; y: 66.3; scale-x: 0.82; }
        frame 81 { x: 29.7; y: 65.2; skew-x: 14.5; skew-y: 373.6; scale-x: 0.823; scale-y: 0.686; }
        frame 82 { x: 29.4; y: 64.1; skew-x: 19.8; skew-y: 375.9; scale-x: 0.828; scale-y: 0.784; }
        frame 83 { x: 29.5; y: 65.2; skew-x: 14.5; skew-y: 373.6; scale-x: 0.823; scale-y: 0.686; }
        frame 84 { x: 29.9; y: 66.3; skew-x: 9.3; skew-y: 371.5; scale-x: 0.82; scale-y: 0.588; }
        frame 85 { x: 29.6; y: 65.8; skew-x: 10.3; skew-y: 370.5; scale-x: 0.822; scale-y: 0.651; }
        frame 86 { x: 29.3; y: 65.6; skew-x: 11.3; skew-y: 369.5; scale-x: 0.825; scale-y: 0.714; }
        frame 87 { x: 29; y: 65.3; skew-x: 12.4; skew-y: 368.7; scale-x: 0.828; scale-y: 0.777; }
        frame 88 { x: 28.7; y: 65.6; skew-x: 11; skew-y: 367; scale-x: 0.829; scale-y: 0.763; }
        frame 89 { x: 28.4; y: 65.9; skew-x: 9.8; skew-y: 365.3; scale-x: 0.83; scale-y: 0.75; }
        frame 90 { x: 28.1; y: 66.3; skew-x: 8.8; skew-y: 363.5; scale-x: 0.831; scale-y: 0.737; }
        frame 91 { x: 27.8; y: 66.7; skew-x: 7.5; skew-y: 361.8; scale-x: 0.832; scale-y: 0.724; }
        frame 92 { x: 27.6; y: 67.1; skew-x: 6.3; skew-y: 360; scale-x: 0.834; scale-y: 0.711; }
        frame 93 { x: 27.2; y: 67.4; skew-x: 5.2; skew-y: 358.4; scale-x: 0.835; scale-y: 0.698; }
    }
    Track {
        source-name: "Chomper_stem2";
        frame-count: 94;
        frame 0 { x: 4.6; y: 49.3; skew-x: 5.2; skew-y: 343.2; scale-x: 0.835; scale-y: 0.685; image: IMAGE_REANIM_CHOMPER_STEM2; }
        frame 1 { x: 5.6; y: 49.1; skew-x: 6.1; skew-y: 345.6; scale-x: 0.826; scale-y: 0.677; image: none; }
        frame 2 { x: 7.1; y: 46.6; skew-x: 7.8; skew-y: 349; scale-x: 0.818; scale-y: 0.727; }
        frame 3 { x: 8.7; y: 44.3; skew-x: 9.3; skew-y: 352.2; scale-x: 0.811; scale-y: 0.778; }
        frame 4 { x: 10.3; y: 41.8; skew-x: 11.1; skew-y: 355.4; scale-x: 0.804; scale-y: 0.829; }
        frame 5 { x: 12.3; y: 41.7; skew-x: 12.6; skew-y: 359.5; scale-x: 0.794; scale-y: 0.815; }
        frame 6 { x: 14.2; y: -10000; skew-x: 14.1; skew-y: 363.3; scale-x: 0.786; scale-y: 0.802; }
        frame 7 { x: 16; skew-x: 15.6; skew-y: 367.5; scale-x: 0.777; scale-y: 0.788; }
        frame 8 { x: 17.8; skew-x: 17.3; skew-y: 371.5; scale-x: 0.769; scale-y: 0.775; }
        frame 9 { x: 18.5; y: 41.5; skew-x: 19; skew-y: 374.3; scale-x: 0.783; scale-y: 0.774; }
        frame 10 { x: 19; y: 41.3; skew-x: 20.8; skew-y: 377; scale-x: 0.798; scale-y: -10000; }
        frame 11 { x: 19.7; y: 41; skew-x: 22.6; skew-y: 379.8; scale-x: 0.812; }
        frame 12 { x: 20.2; y: 40.7; skew-x: 24.5; skew-y: 382.6; scale-x: 0.828; scale-y: 0.775; }
        frame 13 { x: 19.5; y: 41.1; skew-x: 22.6; skew-y: 379.8; scale-x: 0.812; scale-y: 0.774; }
        frame 14 { x: 18.9; y: 41.6; skew-x: 20.8; skew-y: 377; scale-x: 0.798; scale-y: -10000; }
        frame 15 { x: 18.3; y: 42.1; skew-x: 19; skew-y: 374.3; scale-x: 0.783; }
        frame 16 { x: 17.8; y: 42.6; skew-x: 17.3; skew-y: 371.5; scale-x: 0.769; scale-y: 0.775; }
        frame 17 { x: 15.9; y: 42.4; skew-x: 15.6; skew-y: 367.5; scale-x: 0.777; scale-y: 0.788; }
        frame 18 { x: 14; y: 42.1; skew-x: 14.1; skew-y: 363.3; scale-x: 0.786; scale-y: 0.802; }
        frame 19 { x: 12.1; y: 42; skew-x: 12.6; skew-y: 359.5; scale-x: 0.794; scale-y: 0.815; }
        frame 20 { x: 10.3; y: 41.8; skew-x: 11.1; skew-y: 355.4; scale-x: 0.804; scale-y: 0.829; }
        frame 21 { x: 8.8; y: 43.6; skew-x: 9.5; skew-y: 352.5; scale-x: 0.811; scale-y: 0.793; }
        frame 22 { x: 7.3; y: 45.6; skew-x: 8; skew-y: 349.5; scale-x: 0.819; scale-y: 0.756; }
        frame 23 { x: 6; y: 47.4; skew-x: 6.6; skew-y: 346.4; scale-x: 0.827; scale-y: 0.72; }
        frame 24 { x: 4.6; y: 49.3; skew-x: 5.2; skew-y: 343.2; scale-x: 0.835; scale-y: 0.685; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 3.8; y: 48.9; skew-x: 5.3; skew-y: 342.2; scale-x: 0.837; scale-y: 0.706; }
        frame 27 { x: 3.1; y: 48.5; skew-x: -10000; skew-y: 341; scale-x: 0.84; scale-y: 0.727; }
        frame 28 { x: 2.2; y: 48.1; skew-x: 5.5; skew-y: 339.7; scale-x: 0.843; scale-y: 0.749; }
        frame 29 { x: 1.4; y: 47.7; skew-x: 5.6; skew-y: 338.6; scale-x: 0.845; scale-y: 0.771; }
        frame 30 { x: 0.4; y: 49; skew-x: 3.3; skew-y: 335.7; scale-x: 0.847; scale-y: 0.775; }
        frame 31 { x: -0.3; y: 50.2; skew-x: 1.3; skew-y: 332.7; scale-x: 0.848; scale-y: 0.78; }
        frame 32 { x: -1.4; y: 51.5; skew-x: -0.7; skew-y: 329.4; scale-x: 0.85; scale-y: 0.785; }
        frame 33 { x: -2.3; y: 52.8; skew-x: -2.8; skew-y: 326.4; scale-x: 0.851; scale-y: 0.792; }
        frame 34 { x: -3.1; y: 54.5; skew-x: -5.7; skew-y: 323.4; scale-x: -10000; scale-y: 0.79; }
        frame 35 { x: -4; y: 56.5; skew-x: -8.7; skew-y: 320.4; scale-x: 0.85; scale-y: -10000; }
        frame 36 { x: -4.7; y: 58.2; skew-x: -11.9; skew-y: 317.4; scale-x: 0.851; scale-y: 0.791; }
        frame 37 { x: 1.7; y: 46.6; skew-x: 4.5; skew-y: 344.8; scale-x: 0.909; scale-y: 0.826; }
        frame 38 { x: 8.3; y: 35.8; skew-x: 21.2; skew-y: 361.1; scale-x: 0.967; scale-y: 0.915; }
        frame 39 { x: 15.7; y: 24.1; skew-x: 42.4; skew-y: 371.8; scale-x: 1.129; scale-y: 1.006; }
        frame 40 { x: 20.7; y: 33.1; skew-x: 41.8; skew-y: 379.5; scale-x: 0.956; scale-y: 0.878; }
        frame 41 { x: 25.2; y: 42.1; skew-x: 41.1; skew-y: 387.3; scale-x: 0.786; scale-y: 0.751; }
        frame 42 { x: 26.9; y: 42.4; skew-x: 44.3; skew-y: 390.3; scale-x: 0.784; scale-y: 0.75; }
        frame 43 { x: 28.7; y: 42.6; skew-x: 47.4; skew-y: 393.5; scale-x: 0.785; scale-y: 0.751; }
        frame 44 { x: 25.9; y: 38.7; skew-x: 37.9; skew-y: 384; scale-x: 0.735; scale-y: 0.936; }
        frame 45 { x: 22.7; y: 34.6; skew-x: 28.3; skew-y: 374.3; scale-x: 0.686; scale-y: 1.123; }
        frame 46 { x: 19.1; y: 30.4; skew-x: 18.8; skew-y: 365; scale-x: 0.638; scale-y: 1.311; }
        frame 47 { x: 13.6; y: 36.5; skew-x: 14.3; skew-y: 357.7; scale-x: 0.703; scale-y: 1.102; }
        frame 48 { x: 8.7; y: 42.6; skew-x: 9.8; skew-y: 350.5; scale-x: 0.769; scale-y: 0.893; }
        frame 49 { x: 4.6; y: 49.3; skew-x: 5.2; skew-y: 343.2; scale-x: 0.835; scale-y: 0.685; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { y: 46.1; skew-x: 6; skew-y: 345.4; scale-x: 0.836; scale-y: 0.784; }
        frame 52 { x: 4.8; y: 46; skew-x: 6.5; skew-y: 346; scale-x: 0.835; scale-y: 0.766; }
        frame 53 { x: 4.9; y: 45.8; skew-x: 7.3; skew-y: 346.4; scale-x: -10000; scale-y: 0.749; }
        frame 54 { x: 5.4; y: 45.9; skew-x: 10; skew-y: 349; scale-x: 0.853; scale-y: 0.729; }
        frame 55 { x: 6; y: 46; skew-x: 12.8; skew-y: 351.4; scale-x: 0.872; scale-y: 0.711; }
        frame 56 { x: 6.5; y: 46.1; skew-x: 15.6; skew-y: 353.7; scale-x: 0.891; scale-y: 0.692; }
        frame 57 { x: 6.3; y: 45.2; skew-x: 16.3; skew-y: 352.9; scale-x: 0.897; scale-y: 0.724; }
        frame 58 { x: 6; y: 44.4; skew-x: 17.1; skew-y: 352; scale-x: 0.905; scale-y: 0.757; }
        frame 59 { x: 5.7; y: 43.3; skew-x: 18.1; skew-y: 351; scale-x: 0.913; scale-y: 0.789; }
        frame 60 { x: 5.5; y: 44.4; skew-x: 15.8; skew-y: 349.7; scale-x: 0.899; scale-y: 0.772; }
        frame 61 { x: 5.2; y: 45.3; skew-x: 13.8; skew-y: 348.5; scale-x: 0.886; scale-y: 0.754; }
        frame 62 { x: 5; y: 46.3; skew-x: 11.5; skew-y: 347.2; scale-x: 0.873; scale-y: 0.737; }
        frame 63 { x: 4.9; y: 47.4; skew-x: 9.5; skew-y: 345.9; scale-x: 0.86; scale-y: 0.719; }
        frame 64 { x: 4.7; y: 48.3; skew-x: 7.3; skew-y: 344.7; scale-x: 0.848; scale-y: 0.702; }
        frame 65 { x: 4.6; y: 49.3; skew-x: 5.2; skew-y: 343.2; scale-x: 0.835; scale-y: 0.685; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { y: 46.1; skew-x: 6; skew-y: 345.4; scale-x: 0.836; scale-y: 0.784; }
        frame 68 { x: 9.5; y: 35.9; skew-x: 17; skew-y: 356.5; scale-x: 0.837; scale-y: 0.994; }
        frame 69 { x: 15.9; y: 26.2; skew-x: 28.2; skew-y: 367.5; scale-x: 0.838; scale-y: 1.204; }
        frame 70 { x: 16.3; y: 27.3; skew-x: 27.3; skew-y: 367.8; scale-x: 0.831; scale-y: 1.16; }
        frame 71 { x: 16.5; y: 28.4; skew-x: 26.3; skew-y: 368; scale-x: 0.824; scale-y: 1.116; }
        frame 72 { x: 16.8; y: 29.4; skew-x: 25.5; skew-y: 368.4; scale-x: 0.819; scale-y: 1.073; }
        frame 73 { x: 17.3; y: 31.4; skew-x: 24.8; skew-y: 369.5; scale-x: 0.81; scale-y: 1.014; }
        frame 74 { x: 17.8; y: 33.5; skew-x: 24.3; skew-y: 370.8; scale-x: 0.802; scale-y: 0.956; }
        frame 75 { x: 18.2; y: 35.5; skew-x: 23.7; skew-y: 372; scale-x: 0.795; scale-y: 0.898; }
        frame 76 { x: 18.6; y: 38.4; skew-x: 21.8; skew-y: 373.3; scale-x: 0.785; scale-y: 0.827; }
        frame 77 { x: 18.9; y: 41.1; skew-x: 20; skew-y: 374.5; scale-x: 0.775; scale-y: 0.756; }
        frame 78 { x: 19.1; y: 43.9; skew-x: 18.2; skew-y: 375.8; scale-x: 0.767; scale-y: 0.686; }
        frame 79 { x: 21.6; y: 46.4; skew-x: 16.8; skew-y: 383.3; scale-x: 0.737; scale-y: 0.644; }
        frame 80 { x: 23.9; y: 48.9; skew-x: 15.4; skew-y: 390.9; scale-x: 0.709; scale-y: 0.603; }
        frame 81 { x: 25.2; y: 44.6; skew-x: 21.3; skew-y: 391.1; scale-x: 0.718; scale-y: 0.682; }
        frame 82 { x: 26.4; y: 40.2; skew-x: 27.6; skew-y: 391.3; scale-x: 0.729; scale-y: 0.762; }
        frame 83 { x: 25; y: 44.6; skew-x: 21.3; skew-y: 391.1; scale-x: 0.718; scale-y: 0.682; }
        frame 84 { x: 23.9; y: 48.9; skew-x: 15.4; skew-y: 390.9; scale-x: 0.709; scale-y: 0.603; }
        frame 85 { x: 22.2; y: 44.5; skew-x: 18.1; skew-y: 384.6; scale-x: 0.737; scale-y: 0.701; }
        frame 86 { x: 20.4; y: 40; skew-x: 20.8; skew-y: 378.3; scale-x: 0.766; scale-y: 0.799; }
        frame 87 { x: 18.2; y: 35.5; skew-x: 23.7; skew-y: 372; scale-x: 0.795; scale-y: 0.898; }
        frame 88 { x: 15.6; y: 37.6; skew-x: 20.5; skew-y: 367.1; scale-x: 0.801; scale-y: 0.862; }
        frame 89 { x: 13.3; y: 39.8; skew-x: 17.5; skew-y: 362.3; scale-x: 0.808; scale-y: 0.827; }
        frame 90 { x: 10.9; y: 42.1; skew-x: 14.3; skew-y: 357.7; scale-x: 0.814; scale-y: 0.792; }
        frame 91 { x: 8.7; y: 44.3; skew-x: 11.3; skew-y: 353; scale-x: 0.821; scale-y: 0.756; }
        frame 92 { x: 6.7; y: 46.7; skew-x: 8.3; skew-y: 348.2; scale-x: 0.828; scale-y: 0.72; }
        frame 93 { x: 4.6; y: 49.3; skew-x: 5.2; skew-y: 343.2; scale-x: 0.835; scale-y: 0.685; }
    }
    Track {
        source-name: "Chomper_stem1";
        frame-count: 94;
        frame 0 { x: 4; y: 39.8; skew-x: 5.2; skew-y: 358.4; scale-x: 0.835; scale-y: 0.698; image: IMAGE_REANIM_CHOMPER_STEM1; }
        frame 1 { x: 4.9; y: 39.9; skew-x: 6.1; skew-y: 357.6; scale-x: 0.826; scale-y: 0.684; image: none; }
        frame 2 { x: 6.3; y: 37; skew-x: 7.8; skew-y: 357; scale-x: 0.818; scale-y: 0.732; }
        frame 3 { x: 7.6; y: 34; skew-x: 9.3; skew-y: 356.2; scale-x: 0.811; scale-y: 0.78; }
        frame 4 { x: 8.9; y: 31.1; skew-x: 11.1; skew-y: 355.4; scale-x: 0.804; scale-y: 0.829; }
        frame 5 { x: 11.4; y: 31; skew-x: 12.5; skew-y: 359.5; scale-x: 0.794; scale-y: 0.815; }
        frame 6 { x: 13.9; y: -10000; skew-x: 14.1; skew-y: 363.3; scale-x: 0.786; scale-y: 0.802; }
        frame 7 { x: 16.4; y: 31.1; skew-x: 15.6; skew-y: 367.3; scale-x: 0.777; scale-y: 0.788; }
        frame 8 { x: 18.8; y: 31.4; skew-x: 17.3; skew-y: 371.5; scale-x: 0.769; scale-y: 0.775; }
        frame 9 { x: 20.3; y: 31.6; skew-x: 22.5; skew-y: 376.8; scale-x: 0.805; scale-y: 0.751; }
        frame 10 { x: 21.8; y: 31.8; skew-x: 27.8; skew-y: 382.3; scale-x: 0.841; scale-y: 0.728; }
        frame 11 { x: 23.4; y: 32.1; skew-x: 33.1; skew-y: 387.8; scale-x: 0.877; scale-y: 0.704; }
        frame 12 { x: 25; y: 32.4; skew-x: 38.3; skew-y: 393.4; scale-x: 0.915; scale-y: 0.682; }
        frame 13 { x: 23.5; y: 32.5; skew-x: 33.1; skew-y: 387.8; scale-x: 0.877; scale-y: 0.704; }
        frame 14 { x: 22; y: -10000; skew-x: 27.8; skew-y: 382.3; scale-x: 0.841; scale-y: 0.728; }
        frame 15 { x: 20.4; y: 32.6; skew-x: 22.5; skew-y: 376.8; scale-x: 0.805; scale-y: 0.751; }
        frame 16 { x: 18.8; y: 32.7; skew-x: 17.3; skew-y: 371.5; scale-x: 0.769; scale-y: 0.775; }
        frame 17 { x: 16.4; y: 32.3; skew-x: 15.6; skew-y: 367.5; scale-x: 0.777; scale-y: 0.788; }
        frame 18 { x: 13.9; y: 32; skew-x: 14.1; skew-y: 363.3; scale-x: 0.786; scale-y: 0.802; }
        frame 19 { x: 11.4; y: 31.6; skew-x: 12.6; skew-y: 359.5; scale-x: 0.794; scale-y: 0.815; }
        frame 20 { x: 8.9; y: 31.1; skew-x: 11.1; skew-y: 355.4; scale-x: 0.804; scale-y: 0.829; }
        frame 21 { x: 7.6; y: 33.3; skew-x: 9.5; skew-y: 356.2; scale-x: 0.811; scale-y: 0.796; }
        frame 22 { x: 6.4; y: 35.6; skew-x: 8; skew-y: 357; scale-x: 0.819; scale-y: 0.763; }
        frame 23 { x: 5.1; y: 37.7; skew-x: 6.6; skew-y: 357.7; scale-x: 0.827; scale-y: 0.731; }
        frame 24 { x: 4; y: 39.8; skew-x: 5.2; skew-y: 358.4; scale-x: 0.835; scale-y: 0.698; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 2.9; y: 39.1; skew-x: 5.3; skew-y: 356.9; scale-x: 0.837; scale-y: 0.716; }
        frame 27 { x: 1.9; y: 38.6; skew-x: -10000; skew-y: 355.2; scale-x: 0.84; scale-y: 0.734; }
        frame 28 { x: 0.7; y: 37.9; skew-x: 5.5; skew-y: 353.7; scale-x: 0.843; scale-y: 0.753; }
        frame 29 { x: -0.2; y: 37.4; skew-x: 5.6; skew-y: 351.9; scale-x: 0.845; scale-y: 0.771; }
        frame 30 { x: -1.7; y: 38.8; skew-x: 3.3; skew-y: 348.7; scale-x: 0.847; scale-y: 0.773; }
        frame 31 { x: -3.2; y: 40.3; skew-x: 1.3; skew-y: 345.7; scale-x: 0.848; scale-y: 0.775; }
        frame 32 { x: -4.8; y: 41.7; skew-x: -0.7; skew-y: 342.5; scale-x: 0.85; scale-y: 0.778; }
        frame 33 { x: -6.4; y: 43.1; skew-x: -2.8; skew-y: 339.2; scale-x: 0.851; scale-y: 0.781; }
        frame 34 { x: -7.9; y: 45.1; skew-x: -5.7; skew-y: 336.2; scale-x: -10000; scale-y: 0.78; }
        frame 35 { x: -9.4; y: 47; skew-x: -8.7; skew-y: 333.2; scale-x: 0.85; scale-y: 0.779; }
        frame 36 { x: -10.9; y: 49; skew-x: -11.9; skew-y: 330.2; scale-x: 0.851; scale-y: 0.78; }
        frame 37 { x: -0.8; y: 36; skew-x: 8.8; skew-y: 351; scale-x: 0.928; scale-y: 0.841; }
        frame 38 { x: 10.3; y: 23.4; skew-x: 29.6; skew-y: 371.8; scale-x: 1.006; scale-y: 0.902; }
        frame 39 { x: 22.6; y: 12.1; skew-x: 50.4; skew-y: 392.6; scale-x: 1.086; scale-y: 0.964; }
        frame 40 { x: 22.9; y: 23.1; skew-x: 36.1; skew-y: 378.3; scale-x: 0.966; scale-y: 0.871; }
        frame 41 { x: 23.8; y: 34.4; skew-x: 21.8; skew-y: 364; scale-x: 0.849; scale-y: 0.779; }
        frame 42 { x: 26; y: 34.7; skew-x: 24.8; skew-y: 367; scale-x: 0.848; scale-y: -10000; }
        frame 43 { x: 28.1; y: 34.9; skew-x: 28.1; skew-y: 370.3; scale-x: 0.849; }
        frame 44 { x: 25.4; y: 30.1; skew-x: -10000; skew-y: -10000; scale-x: 0.828; scale-y: 0.778; }
        frame 45 { x: 22.7; y: 25.4; scale-x: 0.808; scale-y: -10000; }
        frame 46 { x: 20.1; y: 20.6; scale-x: 0.79; scale-y: 0.779; }
        frame 47 { x: 14.6; y: 26.9; skew-x: 20.3; skew-y: 366.3; scale-x: 0.804; scale-y: 0.752; }
        frame 48 { x: 9.2; y: 33.3; skew-x: 12.8; skew-y: 362.3; scale-x: 0.819; scale-y: 0.725; }
        frame 49 { x: 4; y: 39.8; skew-x: 5.2; skew-y: 358.4; scale-x: 0.835; scale-y: 0.698; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { y: 35.3; skew-x: 6; skew-y: 358.6; scale-x: 0.836; scale-y: 0.807; }
        frame 52 { x: 4.1; y: 35; skew-x: -10000; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: -10000; y: 34.6; skew-y: -10000; }
        frame 54 { x: 4.6; y: 35; }
        frame 55 { x: 5; y: 35.4; }
        frame 56 { x: 5.4; y: 35.7; skew-y: 358.6; }
        frame 57 { x: 5.3; y: 35.1; skew-y: 358.7; }
        frame 58 { x: 5.1; y: 34.5; skew-y: -10000; }
        frame 59 { x: 4.9; y: 33.8; }
        frame 60 { x: -10000; y: 34.9; skew-x: 5.8; scale-x: 0.835; scale-y: 0.789; }
        frame 61 { x: 4.7; y: 35.8; skew-x: 5.6; scale-x: -10000; scale-y: 0.77; }
        frame 62 { x: 4.5; y: 36.8; skew-x: 5.5; scale-y: 0.752; }
        frame 63 { x: 4.3; y: 37.9; skew-x: 5.3; scale-y: 0.734; }
        frame 64 { x: 4.2; y: 38.8; skew-x: -10000; skew-y: 358.5; scale-y: 0.716; }
        frame 65 { x: 4; y: 39.8; skew-x: 5.2; skew-y: 358.4; scale-y: 0.698; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 67 { x: 4.4; y: 27.9; skew-x: 6; skew-y: 358.6; scale-x: 0.836; scale-y: 1.327; }
        frame 68 { x: 11.2; y: 20.8; skew-x: 13.3; skew-y: 365.3; scale-x: 0.837; scale-y: 1.185; }
        frame 69 { x: 17.8; y: 13.7; skew-x: 20.9; skew-y: 372; scale-x: 0.839; scale-y: 1.044; }
        frame 70 { x: 18.1; y: 15.3; skew-x: 20.1; skew-y: 372.5; scale-x: 0.834; scale-y: 1.007; }
        frame 71 { x: 18.3; y: 16.8; skew-x: 19.3; skew-y: 373; scale-x: 0.83; scale-y: 0.97; }
        frame 72 { x: 18.7; y: 18.4; skew-x: 18.7; skew-y: 373.5; scale-x: 0.827; scale-y: 0.934; }
        frame 73 { x: 19.2; y: 21.1; skew-x: 18.3; skew-y: 375; scale-x: 0.822; scale-y: 0.884; }
        frame 74 { x: 19.8; y: 23.8; skew-x: 18; skew-y: 376.5; scale-x: 0.818; scale-y: 0.836; }
        frame 75 { x: 20.4; y: 26.5; skew-x: 17.8; skew-y: 378.1; scale-x: 0.814; scale-y: 0.788; }
        frame 76 { x: 20.7; y: 30; skew-x: 16.3; skew-y: 379.8; scale-x: 0.808; scale-y: 0.729; }
        frame 77 { x: 21; y: 33.5; skew-x: 14.8; skew-y: 381.6; scale-x: 0.802; scale-y: 0.671; }
        frame 78 { x: 21.3; y: 37.1; skew-x: 13.6; skew-y: 383.5; scale-x: 0.797; scale-y: 0.613; }
        frame 79 { x: 24.4; y: 40.3; skew-x: 12.3; skew-y: 390.8; scale-x: 0.776; scale-y: 0.587; }
        frame 80 { x: 27.3; y: 43.6; skew-x: 11.2; skew-y: 398.3; scale-x: 0.755; scale-y: 0.562; }
        frame 81 { x: 29; y: 38.6; skew-x: 16.6; skew-y: 398.1; scale-x: 0.76; scale-y: 0.624; }
        frame 82 { x: 30.7; y: 33.5; skew-x: 22.2; skew-y: 397.7; scale-x: 0.766; scale-y: 0.688; }
        frame 83 { x: 29; y: 38.5; skew-x: 16.6; skew-y: 398.1; scale-x: 0.76; scale-y: 0.624; }
        frame 84 { x: 27.3; y: 43.6; skew-x: 11.2; skew-y: 398.3; scale-x: 0.755; scale-y: 0.562; }
        frame 85 { x: 25.1; y: 37.9; skew-x: 13.3; skew-y: 391.6; scale-x: 0.774; scale-y: 0.637; }
        frame 86 { x: 22.8; y: 32.3; skew-x: 15.5; skew-y: 384.8; scale-x: 0.794; scale-y: 0.712; }
        frame 87 { x: 20.4; y: 26.5; skew-x: 17.8; skew-y: 378.1; scale-x: 0.814; scale-y: 0.788; }
        frame 88 { x: 17.6; y: 28.7; skew-x: 15.6; skew-y: 374.8; scale-x: 0.817; scale-y: 0.772; }
        frame 89 { x: 14.8; y: 30.8; skew-x: 13.5; skew-y: 371.5; scale-x: 0.821; scale-y: 0.757; }
        frame 90 { x: 12.1; y: 33; skew-x: 11.5; skew-y: 368.1; scale-x: 0.824; scale-y: 0.742; }
        frame 91 { x: 9.4; y: 35.3; skew-x: 9.3; skew-y: 364.8; scale-x: 0.828; scale-y: 0.728; }
        frame 92 { x: 6.7; y: 37.6; skew-x: 7.3; skew-y: 361.5; scale-x: 0.831; scale-y: 0.713; }
        frame 93 { x: 4; y: 39.8; skew-x: 5.2; skew-y: 358.4; scale-x: 0.835; scale-y: 0.698; }
    }
    Track {
        source-name: "Chomper_stomach";
        frame-count: 94;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 79 { x: 18.8; y: 39.1; skew-x: 1.5; skew-y: 1.5; scale-x: 0.324; scale-y: 0.298; cel: 0; image: IMAGE_REANIM_CHOMPER_STOMACH; }
        frame 80 { x: 19.1; y: 40; skew-x: -2.4; skew-y: -2.4; scale-x: 0.36; scale-y: 0.354; cel: -10000; image: none; }
        frame 81 { x: 19.3; y: 41; skew-x: -6.4; skew-y: -6.4; scale-x: 0.396; scale-y: 0.41; }
        frame 82 { x: 18.3; y: 45.6; skew-x: -13.7; skew-y: -13.7; scale-x: 0.436; scale-y: 0.44; }
        frame 83 { x: 17.4; y: 50.8; skew-x: -21.2; skew-y: -21.2; scale-x: 0.476; scale-y: 0.47; }
        frame 84 { x: 15; y: 52.6; skew-x: -16.9; skew-y: -16.9; scale-x: 0.542; scale-y: 0.513; }
        frame 85 { x: 12.8; y: 54.1; skew-x: -12.8; skew-y: -12.7; scale-x: 0.609; scale-y: 0.557; }
        frame 86 { x: 13.9; y: 56.6; skew-x: -6.9; skew-y: -6.9; scale-x: 0.661; scale-y: 0.429; }
        frame 87 { x: 14.5; y: 59.1; skew-x: -1.1; skew-y: -1.1; scale-x: 0.714; scale-y: 0.301; }
        frame 88 { x: 17.8; y: 61.2; skew-x: -0.4; skew-y: -1.2; scale-x: 0.593; scale-y: 0.261; }
        frame 89 { x: 21; y: 63.4; skew-x: 0; skew-y: -1.4; scale-x: 0.472; scale-y: 0.222; }
        frame 90 { x: 24.3; y: 65.6; skew-x: 0.4; skew-y: -1.6; scale-x: 0.352; scale-y: 0.183; }
        frame 91 { x: 25.3; y: 68; skew-x: -0.7; skew-y: -2.2; scale-x: 0.292; scale-y: 0.196; }
        frame 92 { x: 26.2; y: 70.3; skew-x: -2.2; skew-y: -2.9; scale-x: 0.233; scale-y: 0.21; }
        frame 93 { x: 27.1; y: 72.6; skew-x: -3.7; skew-y: -3.7; scale-x: 0.173; scale-y: 0.223; }
    }
    Track {
        source-name: "Chomper_groundleaf1";
        frame-count: 94;
        frame 0 { x: 6; y: 68.6; scale-x: 0.64; scale-y: 0.64; image: IMAGE_REANIM_CHOMPER_GROUNDLEAF1; }
        frame 1 { x: 6.2; y: 67.8; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 6.4; y: 67; skew-x: 3.8; skew-y: 3.8; }
        frame 3 { x: 6.5; y: 66.3; skew-x: 5.5; skew-y: 5.5; }
        frame 4 { x: 6.7; y: 65.6; skew-x: 7.5; skew-y: 7.5; scale-x: 0.639; scale-y: 0.639; }
        frame 5 { x: 6.9; y: 64.8; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 7.1; y: 64; skew-x: 11.3; skew-y: 11.3; scale-x: 0.64; scale-y: 0.64; }
        frame 7 { x: 7.5; y: 63.4; skew-x: 12.3; skew-y: 12.3; scale-x: 0.639; scale-y: 0.639; }
        frame 8 { x: 7.8; y: 62.7; skew-x: 13.3; skew-y: 13.3; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 8.1; y: 62.1; skew-x: 14.3; skew-y: 14.3; }
        frame 10 { x: 8.5; y: 61.4; skew-x: 15.5; skew-y: 15.5; }
        frame 11 { x: 8.8; y: 60.8; skew-x: 16.5; skew-y: 16.5; }
        frame 12 { x: 9.2; y: 60.2; skew-x: 17.6; skew-y: 17.6; }
        frame 13 { x: 8.9; y: 60.9; skew-x: 16; skew-y: 16; }
        frame 14 { x: 8.6; y: 61.6; skew-x: 14.6; skew-y: 14.6; }
        frame 15 { x: 8.3; y: 62.3; skew-x: 13.1; skew-y: 13.1; }
        frame 16 { x: 8; y: 63; skew-x: 11.6; skew-y: 11.6; }
        frame 17 { x: 7.7; y: 63.7; skew-x: 10.1; skew-y: 10.1; }
        frame 18 { x: 7.5; y: 64.3; skew-x: 8.8; skew-y: 8.8; }
        frame 19 { x: 7.2; y: 65.1; skew-x: 7.3; skew-y: 7.3; }
        frame 20 { x: 7; y: 65.8; skew-x: 5.8; skew-y: 5.8; }
        frame 21 { x: 6.8; y: 66.5; skew-x: 4.3; skew-y: 4.3; }
        frame 22 { x: 6.5; y: 67.3; skew-x: 2.8; skew-y: 2.8; scale-x: 0.64; scale-y: 0.64; }
        frame 23 { x: 6.2; y: 68; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 6; y: 68.6; skew-x: 0; skew-y: 0; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 6.2; y: 67.8; skew-x: 1.8; skew-y: 1.8; }
        frame 27 { x: 6.4; y: 67; skew-x: 3.8; skew-y: 3.8; }
        frame 28 { x: 6.5; y: 66.3; skew-x: 5.5; skew-y: 5.5; }
        frame 29 { x: 6.7; y: 65.6; skew-x: 7.5; skew-y: 7.5; scale-x: 0.639; scale-y: 0.639; }
        frame 30 { x: 6.9; y: 64.8; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 7.1; y: 64; skew-x: 11.3; skew-y: 11.3; scale-x: 0.64; scale-y: 0.64; }
        frame 32 { x: 7.5; y: 63.4; skew-x: 12.3; skew-y: 12.3; scale-x: 0.639; scale-y: 0.639; }
        frame 33 { x: 7.8; y: 62.7; skew-x: 13.3; skew-y: 13.3; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 8.1; y: 62.1; skew-x: 14.3; skew-y: 14.3; }
        frame 35 { x: 8.5; y: 61.4; skew-x: 15.5; skew-y: 15.5; }
        frame 36 { x: 8.8; y: 60.8; skew-x: 16.5; skew-y: 16.5; }
        frame 37 { x: 9.2; y: 60.2; skew-x: 17.6; skew-y: 17.6; }
        frame 38 { x: 8.9; y: 60.9; skew-x: 16; skew-y: 16; }
        frame 39 { x: 8.6; y: 61.6; skew-x: 14.6; skew-y: 14.6; }
        frame 40 { x: 8.3; y: 62.3; skew-x: 13.1; skew-y: 13.1; }
        frame 41 { x: 8; y: 63; skew-x: 11.6; skew-y: 11.6; }
        frame 42 { x: 7.7; y: 63.7; skew-x: 10.1; skew-y: 10.1; }
        frame 43 { x: 7.5; y: 64.3; skew-x: 8.8; skew-y: 8.8; }
        frame 44 { x: 7.2; y: 65.1; skew-x: 7.3; skew-y: 7.3; }
        frame 45 { x: 7; y: 65.8; skew-x: 5.8; skew-y: 5.8; }
        frame 46 { x: 6.8; y: 66.5; skew-x: 4.3; skew-y: 4.3; }
        frame 47 { x: 6.5; y: 67.3; skew-x: 2.8; skew-y: 2.8; scale-x: 0.64; scale-y: 0.64; }
        frame 48 { x: 6.2; y: 68; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 6; y: 68.6; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 51 { x: 6.4; y: 67; skew-x: 3.8; skew-y: 3.8; }
        frame 52 { x: 6.7; y: 65.6; skew-x: 7.5; skew-y: 7.5; scale-x: 0.639; scale-y: 0.639; }
        frame 53 { x: 7.1; y: 64; skew-x: 11.3; skew-y: 11.3; scale-x: 0.64; scale-y: 0.64; }
        frame 54 { x: 7.6; y: 63.1; skew-x: 12.8; skew-y: 12.8; scale-x: 0.639; scale-y: 0.639; }
        frame 55 { x: 8.1; y: 62.1; skew-x: 14.3; skew-y: 14.3; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 8.7; y: 61.1; skew-x: 16; skew-y: 16; }
        frame 57 { x: 9.2; y: 60.2; skew-x: 17.6; skew-y: 17.6; }
        frame 58 { x: 8.7; y: 61.3; skew-x: 15.3; skew-y: 15.3; }
        frame 59 { x: 8.3; y: 62.3; skew-x: 13.1; skew-y: 13.1; }
        frame 60 { x: 7.9; y: 63.3; skew-x: 10.8; skew-y: 10.8; }
        frame 61 { x: 7.5; y: 64.3; skew-x: 8.8; skew-y: 8.8; }
        frame 62 { x: 7.1; y: 65.4; skew-x: 6.5; skew-y: 6.5; }
        frame 63 { x: 6.8; y: 66.5; skew-x: 4.3; skew-y: 4.3; }
        frame 64 { x: 6.3; y: 67.6; skew-x: 2; skew-y: 2; scale-x: 0.64; scale-y: 0.64; }
        frame 65 { x: 6; y: 68.6; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 67 { x: 6.2; y: 67.8; skew-x: 1.8; skew-y: 1.8; }
        frame 68 { x: 6.4; y: 67; skew-x: 3.8; skew-y: 3.8; }
        frame 69 { x: 6.5; y: 66.3; skew-x: 5.5; skew-y: 5.5; }
        frame 70 { x: 6.7; y: 65.6; skew-x: 7.5; skew-y: 7.5; scale-x: 0.639; scale-y: 0.639; }
        frame 71 { x: 6.9; y: 64.8; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 7.1; y: 64; skew-x: 11.3; skew-y: 11.3; scale-x: 0.64; scale-y: 0.64; }
        frame 73 { x: 7.3; y: 63.5; skew-x: 12.1; skew-y: 12.1; scale-x: 0.639; scale-y: 0.639; }
        frame 74 { x: 7.6; y: 62.9; skew-x: 13; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 8; y: 62.3; skew-x: 14; skew-y: 14; }
        frame 76 { x: 8.3; y: 61.8; skew-x: 14.8; skew-y: 14.8; }
        frame 77 { x: 8.6; y: 61.3; skew-x: 15.8; skew-y: 15.8; }
        frame 78 { x: 8.9; y: 60.7; skew-x: 16.6; skew-y: 16.6; }
        frame 79 { x: 9.2; y: 60.2; skew-x: 17.6; skew-y: 17.6; }
        frame 80 { x: 8.9; y: 60.9; skew-x: 16.3; skew-y: 16.3; }
        frame 81 { x: 8.7; y: 61.4; skew-x: 15; skew-y: 15; }
        frame 82 { x: 8.4; y: 62; skew-x: 13.8; skew-y: 13.8; }
        frame 83 { x: 8.1; y: 62.6; skew-x: 12.5; skew-y: 12.5; }
        frame 84 { x: 7.9; y: 63.1; skew-x: 11.3; skew-y: 11.3; }
        frame 85 { x: 7.6; y: 63.8; skew-x: 10; skew-y: 10; }
        frame 86 { x: 7.5; y: 64.3; skew-x: 8.8; skew-y: 8.8; }
        frame 87 { x: 7.2; y: 65; skew-x: 7.5; skew-y: 7.5; }
        frame 88 { x: 7; y: 65.6; skew-x: 6.3; skew-y: 6.3; }
        frame 89 { x: 6.8; y: 66.2; skew-x: 5; skew-y: 5; }
        frame 90 { x: 6.6; y: 66.8; skew-x: 3.8; skew-y: 3.8; scale-x: 0.64; scale-y: 0.64; }
        frame 91 { x: 6.5; y: 67.4; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 6.2; y: 68; skew-x: 1.3; skew-y: 1.3; }
        frame 93 { x: 6; y: 68.6; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Chomper_groundleaf1tip";
        frame-count: 94;
        frame 0 { x: -5.7; y: 77.6; skew-x: 350; skew-y: 350; scale-x: 0.64; scale-y: 0.64; image: IMAGE_REANIM_CHOMPER_GROUNDLEAF1TIP; }
        frame 1 { x: -5.8; y: 77.5; skew-x: 348.5; skew-y: 348.5; scale-x: 0.639; scale-y: 0.639; image: none; }
        frame 2 { x: -6; y: -10000; skew-x: 346.7; skew-y: 346.7; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -6.1; y: 77.4; skew-x: 345.2; skew-y: 345.2; }
        frame 4 { x: -6.3; y: -10000; skew-x: 343.5; skew-y: 343.5; }
        frame 5 { x: -6.5; skew-x: 341.9; skew-y: 341.9; scale-x: 0.638; scale-y: 0.638; }
        frame 6 { x: -6.7; y: 77.3; skew-x: 340.2; skew-y: 340.2; scale-x: 0.639; scale-y: 0.639; }
        frame 7 { x: -6.6; y: 76.6; skew-x: 340.7; skew-y: 341.9; scale-x: -10000; scale-y: 0.638; }
        frame 8 { x: -6.4; y: 75.9; skew-x: 341; skew-y: 343.4; scale-y: -10000; }
        frame 9 { x: -6.3; y: 75.1; skew-x: 341.2; skew-y: 345; scale-x: 0.64; scale-y: 0.637; }
        frame 10 { x: -6.1; y: 74.3; skew-x: 341.7; skew-y: 346.5; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: -6; y: 73.6; skew-x: 342; skew-y: 348; scale-x: 0.641; }
        frame 12 { x: -5.8; y: 72.9; skew-x: 342.3; skew-y: 349.6; scale-x: 0.642; }
        frame 13 { x: -5.6; y: 72.1; skew-x: 347; skew-y: 353; scale-x: 0.641; }
        frame 14 { x: -5.3; y: 71.4; skew-x: 351.7; skew-y: 356.5; scale-x: 0.64; }
        frame 15 { x: -4.9; y: 70.7; skew-x: 356.4; skew-y: 359.9; scale-x: -10000; }
        frame 16 { x: -4.6; y: 70; skew-x: 360.8; skew-y: 363.1; scale-x: 0.639; }
        frame 17 { x: -4.3; y: 69.4; skew-x: 365.5; skew-y: 366.5; scale-x: 0.638; }
        frame 18 { x: -4; y: 68.7; skew-x: 370.3; skew-y: 370; scale-x: 0.637; }
        frame 19 { x: -4.3; y: 70.2; skew-x: 366.8; skew-y: 366.5; scale-x: 0.638; scale-y: 0.638; }
        frame 20 { x: -4.6; y: 71.7; skew-x: 363.5; skew-y: 363.3; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -4.8; y: 73.2; skew-x: 360; skew-y: 360; scale-x: 0.639; scale-y: 0.639; }
        frame 22 { x: -5.2; y: 74.7; skew-x: 356.7; skew-y: 356.7; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -5.4; y: 76.2; skew-x: 353.5; skew-y: 353.5; }
        frame 24 { x: -5.7; y: 77.6; skew-x: 350; skew-y: 350; scale-x: 0.64; scale-y: 0.64; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: -5.8; y: 77.5; skew-x: 348.5; skew-y: 348.5; scale-x: 0.639; scale-y: 0.639; }
        frame 27 { x: -6; y: -10000; skew-x: 346.7; skew-y: 346.7; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -6.1; y: 77.4; skew-x: 345.2; skew-y: 345.2; }
        frame 29 { x: -6.3; y: -10000; skew-x: 343.5; skew-y: 343.5; }
        frame 30 { x: -6.5; skew-x: 341.9; skew-y: 341.9; scale-x: 0.638; scale-y: 0.638; }
        frame 31 { x: -6.7; y: 77.3; skew-x: 340.2; skew-y: 340.2; scale-x: 0.639; scale-y: 0.639; }
        frame 32 { x: -6.6; y: 76.6; skew-x: 340.7; skew-y: 341.9; scale-x: -10000; scale-y: 0.638; }
        frame 33 { x: -6.4; y: 75.9; skew-x: 341; skew-y: 343.4; scale-y: -10000; }
        frame 34 { x: -6.3; y: 75.1; skew-x: 341.2; skew-y: 345; scale-x: 0.64; scale-y: 0.637; }
        frame 35 { x: -6.1; y: 74.3; skew-x: 341.7; skew-y: 346.5; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -6; y: 73.6; skew-x: 342; skew-y: 348; scale-x: 0.641; }
        frame 37 { x: -5.8; y: 72.9; skew-x: 342.3; skew-y: 349.6; scale-x: 0.642; }
        frame 38 { x: -5.6; y: 72.1; skew-x: 347; skew-y: 353; scale-x: 0.641; }
        frame 39 { x: -5.3; y: 71.4; skew-x: 351.7; skew-y: 356.5; scale-x: 0.64; }
        frame 40 { x: -4.9; y: 70.7; skew-x: 356.4; skew-y: 359.9; scale-x: -10000; }
        frame 41 { x: -4.6; y: 70; skew-x: 360.8; skew-y: 363.1; scale-x: 0.639; }
        frame 42 { x: -4.3; y: 69.4; skew-x: 365.5; skew-y: 366.5; scale-x: 0.638; }
        frame 43 { x: -4; y: 68.7; skew-x: 370.3; skew-y: 370; scale-x: 0.637; }
        frame 44 { x: -4.3; y: 70.2; skew-x: 366.8; skew-y: 366.5; scale-x: 0.638; scale-y: 0.638; }
        frame 45 { x: -4.6; y: 71.7; skew-x: 363.5; skew-y: 363.3; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: -4.8; y: 73.2; skew-x: 360; skew-y: 360; scale-x: 0.639; scale-y: 0.639; }
        frame 47 { x: -5.2; y: 74.7; skew-x: 356.7; skew-y: 356.7; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: -5.4; y: 76.2; skew-x: 353.5; skew-y: 353.5; }
        frame 49 { x: -5.7; y: 77.6; skew-x: 350; skew-y: 350; scale-x: 0.64; scale-y: 0.64; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: -6; y: 77.5; skew-x: 346.7; skew-y: 346.7; scale-x: 0.639; scale-y: 0.639; }
        frame 52 { x: -6.3; y: 77.4; skew-x: 343.5; skew-y: 343.5; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: -6.7; y: 77.3; skew-x: 340.2; skew-y: 340.2; }
        frame 54 { x: -6.5; y: 76.2; skew-x: 340.7; skew-y: 342.7; scale-y: 0.638; }
        frame 55 { x: -6.3; y: 75.1; skew-x: 341.2; skew-y: 345; scale-x: 0.64; scale-y: 0.637; }
        frame 56 { x: -6; y: 73.9; skew-x: 341.7; skew-y: 347.2; scale-x: 0.641; scale-y: -10000; }
        frame 57 { x: -5.8; y: 72.9; skew-x: 342.3; skew-y: 349.6; scale-x: 0.642; }
        frame 58 { x: -5.4; y: 71.8; skew-x: 349.4; skew-y: 354.7; scale-x: 0.641; }
        frame 59 { x: -4.9; y: 70.7; skew-x: 356.4; skew-y: 359.9; scale-x: 0.64; }
        frame 60 { x: -4.5; y: 69.7; skew-x: 363.3; skew-y: 364.8; scale-x: 0.639; }
        frame 61 { x: -4; y: 68.7; skew-x: 370.3; skew-y: 370; scale-x: 0.637; }
        frame 62 { x: -4.4; y: 71; skew-x: 365.1; skew-y: 365; scale-x: 0.638; scale-y: 0.638; }
        frame 63 { x: -4.8; y: 73.2; skew-x: 360; skew-y: 360; scale-x: 0.639; scale-y: 0.639; }
        frame 64 { x: -5.3; y: 75.4; skew-x: 355.2; skew-y: 355; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -5.7; y: 77.6; skew-x: 350; skew-y: 350; scale-x: 0.64; scale-y: 0.64; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: -5.8; y: 77.5; skew-x: 348.5; skew-y: 348.5; scale-x: 0.639; scale-y: 0.639; }
        frame 68 { x: -6; y: -10000; skew-x: 346.7; skew-y: 346.7; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: -6.1; y: 77.4; skew-x: 345.2; skew-y: 345.2; }
        frame 70 { x: -6.3; y: -10000; skew-x: 343.5; skew-y: 343.5; }
        frame 71 { x: -6.5; skew-x: 341.9; skew-y: 341.9; scale-x: 0.638; scale-y: 0.638; }
        frame 72 { x: -6.7; y: 77.3; skew-x: 340.2; skew-y: 340.2; scale-x: 0.639; scale-y: 0.639; }
        frame 73 { x: -6.6; y: 76.7; skew-x: 340.5; skew-y: 341.7; scale-x: -10000; scale-y: 0.638; }
        frame 74 { x: -6.4; y: 76; skew-x: 340.9; skew-y: 343; scale-y: -10000; }
        frame 75 { x: -10000; y: 75.5; skew-x: 341.2; skew-y: 344.2; scale-x: 0.64; scale-y: 0.637; }
        frame 76 { x: -6.2; y: 74.8; skew-x: 341.4; skew-y: 345.7; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: -6.1; y: 74.1; skew-x: 341.7; skew-y: 347; scale-x: 0.641; }
        frame 78 { x: -6; y: 73.5; skew-x: 342; skew-y: 348.2; scale-x: -10000; }
        frame 79 { x: -5.8; y: 72.9; skew-x: 342.3; skew-y: 349.6; scale-x: 0.642; }
        frame 80 { x: -5.6; y: 72.2; skew-x: 346.4; skew-y: 352.5; scale-x: 0.641; }
        frame 81 { x: -5.4; y: 71.6; skew-x: 350.4; skew-y: 355.5; scale-x: 0.64; }
        frame 82 { x: -5.1; y: 71.1; skew-x: 354.4; skew-y: 358.5; scale-x: -10000; }
        frame 83 { x: -4.9; y: 70.4; skew-x: 358.4; skew-y: 361.1; scale-x: 0.639; }
        frame 84 { x: -4.6; y: 69.9; skew-x: 362.3; skew-y: 364; scale-x: -10000; }
        frame 85 { x: -4.3; y: 69.2; skew-x: 366.3; skew-y: 367; scale-x: 0.638; }
        frame 86 { x: -4; y: 68.7; skew-x: 370.3; skew-y: 370; scale-x: 0.637; }
        frame 87 { x: -4.3; y: 70; skew-x: 367.3; skew-y: 367; scale-x: 0.638; }
        frame 88 { x: -4.5; y: 71.2; skew-x: 364.3; skew-y: 364.3; scale-x: -10000; scale-y: 0.638; }
        frame 89 { x: -4.8; y: 72.6; skew-x: 361.5; skew-y: 361.3; scale-y: -10000; }
        frame 90 { x: -5; y: 73.8; skew-x: 358.7; skew-y: 358.7; scale-x: 0.639; scale-y: 0.639; }
        frame 91 { x: -5.2; y: 75.1; skew-x: 355.9; skew-y: 355.7; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: -5.5; y: 76.4; skew-x: 353; skew-y: 353; }
        frame 93 { x: -5.7; y: 77.6; skew-x: 350; skew-y: 350; scale-x: 0.64; scale-y: 0.64; }
    }
    Track {
        source-name: "Chomper_Headleaf4";
        frame-count: 94;
        frame 0 { x: 5.4; y: 39.9; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHOMPER_HEADLEAF4; }
        frame 1 { x: 7.3; y: 38.4; skew-x: 340.2; skew-y: 340.2; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 9; y: 37; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 10.9; y: 35.6; skew-x: 330; skew-y: 330; scale-x: 0.8; scale-y: 0.8; }
        frame 4 { x: 13.1; y: 34.5; skew-x: 338; skew-y: 335; scale-x: 0.839; scale-y: 0.813; }
        frame 5 { x: 15.5; y: 33.2; skew-x: 346; skew-y: 340; scale-x: 0.879; scale-y: 0.827; }
        frame 6 { x: 17.8; y: 32; skew-x: 353.8; skew-y: 344.9; scale-x: 0.92; scale-y: 0.842; }
        frame 7 { x: 19.4; y: 32.4; skew-x: 362; skew-y: 352.2; scale-x: 0.942; scale-y: 0.831; }
        frame 8 { x: 21; y: 32.8; skew-x: 370.3; skew-y: 359.2; scale-x: 0.964; scale-y: 0.821; }
        frame 9 { x: 22.9; y: 33.4; skew-x: 378.9; skew-y: 366.3; scale-x: 0.988; scale-y: 0.81; }
        frame 10 { x: 22.7; y: 34.9; skew-x: 368; skew-y: 359.7; scale-x: 0.924; scale-y: 0.807; }
        frame 11 { x: 22.8; y: 36.3; skew-x: 357.5; skew-y: 353.2; scale-x: 0.862; scale-y: 0.803; }
        frame 12 { x: 23; y: 37.6; skew-x: 346.5; skew-y: 346.5; scale-x: 0.799; scale-y: 0.799; }
        frame 13 { x: 22.5; y: 38.1; skew-x: 340; skew-y: 340; scale-x: 0.798; scale-y: 0.798; }
        frame 14 { x: 22; y: 38.7; skew-x: 333.4; skew-y: 333.4; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 21.7; y: 39.3; skew-x: 326.9; skew-y: 326.9; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 20.2; y: 39.1; skew-x: 324.7; skew-y: 324.7; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { x: 18.7; y: 39; skew-x: 322.4; skew-y: 322.4; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 17.2; y: 38.6; skew-x: 320.3; skew-y: 320.3; scale-x: 0.8; scale-y: 0.8; }
        frame 19 { x: 15.2; y: 38; skew-x: 326.2; skew-y: 326.2; scale-x: 0.798; scale-y: 0.798; }
        frame 20 { x: 13.1; y: 37.3; skew-x: 331.9; skew-y: 331.9; scale-x: 0.799; scale-y: 0.799; }
        frame 21 { x: 11.4; y: 36.7; skew-x: 337.8; skew-y: 337.8; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 9.5; y: 37.8; skew-x: 340.2; skew-y: 340.2; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 7.4; y: 38.9; skew-x: 342.7; skew-y: 342.7; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 5.4; y: 39.9; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 4.1; y: 40.8; skew-x: 340.7; skew-y: 340.7; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: 2.9; y: 41.7; skew-x: 336.5; skew-y: 336.5; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 1.7; y: 42.8; skew-x: 332.2; skew-y: 332.2; scale-x: 0.798; scale-y: 0.798; }
        frame 29 { x: 0.6; y: 43.8; skew-x: 327.9; skew-y: 327.9; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: 0.2; y: 44.6; skew-x: 324.1; skew-y: 324.1; scale-x: 0.798; scale-y: 0.798; }
        frame 31 { x: -0.1; y: 45.6; skew-x: 320.4; skew-y: 320.4; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -0.6; y: 46.5; skew-x: 316.4; skew-y: 316.4; scale-x: 0.797; scale-y: 0.797; }
        frame 33 { x: -0.9; y: 47.4; skew-x: 312.6; skew-y: 312.6; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: -10000; y: 49.2; skew-x: 307.6; skew-y: 307.6; scale-x: 0.797; scale-y: 0.797; }
        frame 35 { y: 51.1; skew-x: 302.6; skew-y: 302.6; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -0.7; y: 52.9; skew-x: 297.5; skew-y: 297.5; scale-x: 0.798; scale-y: 0.798; }
        frame 37 { x: 4; y: 38.2; skew-x: 329.9; skew-y: 327.7; scale-x: 0.835; scale-y: 0.874; }
        frame 38 { x: 11.6; y: 23.9; skew-x: 362.1; skew-y: 358; scale-x: 0.874; scale-y: 0.953; }
        frame 39 { x: 21.2; y: 11.3; skew-x: 394.6; skew-y: 388; scale-x: 0.912; scale-y: 1.03; }
        frame 40 { x: 24.7; y: 23.2; skew-x: 379.6; skew-y: 376.3; scale-x: 0.853; scale-y: 0.912; }
        frame 41 { x: 29.1; y: 35.1; skew-x: 364.7; skew-y: 364.7; scale-x: 0.796; scale-y: 0.796; }
        frame 42 { x: 29.5; y: 36.9; skew-x: 358.5; skew-y: 358.5; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 30; y: 38.6; skew-x: 351.9; skew-y: 351.9; scale-x: 0.795; scale-y: 0.795; }
        frame 44 { x: 25.9; y: 33.5; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 45 { x: 21.7; y: 28.6; skew-x: 351.7; skew-y: 351.7; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 17.7; y: 23.6; skew-x: 351.5; skew-y: 351.5; scale-x: 0.797; scale-y: 0.797; }
        frame 47 { x: 13.7; y: 29; skew-x: 349.4; skew-y: 349.4; scale-x: 0.798; scale-y: 0.798; }
        frame 48 { x: 9.7; y: 34.4; skew-x: 347.2; skew-y: 347.2; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 5.4; y: 39.9; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 5.5; y: 38.1; skew-x: 354; skew-y: 354; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 5.6; y: 36.6; skew-x: 362.5; skew-y: 362.5; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: 6; y: 35.2; skew-x: 371.5; skew-y: 371.5; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 6.2; y: 35.8; skew-x: 369.5; skew-y: 369.5; scale-x: 0.797; scale-y: 0.797; }
        frame 55 { x: 6.6; y: 36.3; skew-x: 367.8; skew-y: 367.8; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 6.8; y: 36.8; skew-x: 365.9; skew-y: 365.9; scale-x: 0.798; scale-y: 0.798; }
        frame 57 { x: 6.6; y: 36.4; skew-x: 362.5; skew-y: 362.5; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 6.3; y: 35.9; skew-x: 359.2; skew-y: 359.2; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { x: 6; y: 35.6; skew-x: 355.8; skew-y: 355.8; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 5.3; y: 37.2; skew-x: 348.5; skew-y: 348.5; }
        frame 61 { x: 4.7; y: 39; skew-x: 341.2; skew-y: 341.2; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: 4.2; y: 40.9; skew-x: 333.8; skew-y: 333.8; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 4.6; y: 40.6; skew-x: 337.7; skew-y: 337.7; }
        frame 64 { x: 4.9; y: 40.2; skew-x: 341.4; skew-y: 341.4; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: 5.4; y: 39.9; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 8.6; y: 33.6; skew-x: 338.4; skew-y: 338.4; scale-x: 0.798; scale-y: 0.798; }
        frame 68 { x: 11.9; y: 27.6; skew-x: 331.9; skew-y: 331.9; scale-x: 0.797; scale-y: 0.797; }
        frame 69 { x: 15.3; y: 21.5; skew-x: 325.2; skew-y: 325.2; scale-x: 0.796; scale-y: 0.796; }
        frame 70 { x: 15.8; y: 21.6; skew-x: 331.9; skew-y: 331.9; scale-x: 0.795; scale-y: 0.795; }
        frame 71 { x: 16.5; y: 21.8; skew-x: 338.7; skew-y: 338.7; scale-x: 0.796; scale-y: 0.796; }
        frame 72 { x: 17.2; y: 22; skew-x: 345.5; skew-y: 345.5; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 16.9; y: 26.5; skew-x: 336; skew-y: 336; scale-x: 0.795; scale-y: 0.795; }
        frame 74 { x: 16.6; y: 31.1; skew-x: 326.4; skew-y: 326.4; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 16.5; y: 35.9; skew-x: 316.9; skew-y: 316.9; }
        frame 76 { x: 17.4; y: 39; skew-x: 309.4; skew-y: 309.4; scale-x: 0.794; scale-y: 0.794; }
        frame 77 { x: 18.4; y: 42.1; skew-x: 302.1; skew-y: 302.1; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 19.6; y: 45.3; skew-x: 294.6; skew-y: 294.6; }
        frame 79 { x: 21.2; y: 48.5; skew-x: 288.8; skew-y: 288.8; scale-x: 0.793; scale-y: 0.793; }
        frame 80 { x: 22.9; y: 51.5; skew-x: 283.3; skew-y: 283.3; scale-x: 0.794; scale-y: 0.794; }
        frame 81 { x: 23.8; y: 45.6; skew-x: 299.6; skew-y: 299.6; scale-x: 0.792; scale-y: 0.792; }
        frame 82 { x: 25.4; y: 39.7; skew-x: 315.9; skew-y: 315.9; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 23.9; y: 45.6; skew-x: 299.6; skew-y: 299.6; }
        frame 84 { x: 22.9; y: 51.5; skew-x: 283.3; skew-y: 283.3; scale-x: 0.794; scale-y: 0.794; }
        frame 85 { x: 20.8; y: 46.8; skew-x: 292.8; skew-y: 292.8; scale-x: 0.793; scale-y: 0.793; }
        frame 86 { x: 18.9; y: 41.8; skew-x: 302.6; skew-y: 302.6; scale-x: 0.794; scale-y: 0.794; }
        frame 87 { x: 17.2; y: 36.9; skew-x: 312.4; skew-y: 312.4; scale-x: 0.795; scale-y: 0.795; }
        frame 88 { x: 15; y: 37.3; skew-x: 317.9; skew-y: 317.9; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 13; y: 37.8; skew-x: 323.2; skew-y: 323.2; }
        frame 90 { x: 11.1; y: 38.3; skew-x: 328.7; skew-y: 328.7; scale-x: 0.796; scale-y: 0.796; }
        frame 91 { x: 9.1; y: 38.8; skew-x: 334.2; skew-y: 334.2; scale-x: 0.797; scale-y: 0.797; }
        frame 92 { x: 7.3; y: 39.3; skew-x: 339.7; skew-y: 339.7; scale-x: 0.798; scale-y: 0.798; }
        frame 93 { x: 5.4; y: 39.9; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Chomper_Headleaf3";
        frame-count: 94;
        frame 0 { x: 6.6; y: 22; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHOMPER_HEADLEAF3; }
        frame 1 { x: 8; y: 20.5; skew-x: 340.2; skew-y: 340.2; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 9.6; y: 19.1; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 11; y: 17.8; skew-x: 330; skew-y: 330; scale-x: 0.8; scale-y: 0.8; }
        frame 4 { x: 13; y: 18.5; skew-x: 327.9; skew-y: 324.9; scale-x: 0.839; scale-y: 0.813; }
        frame 5 { x: 15; y: 19.3; skew-x: 325.9; skew-y: 319.9; scale-x: 0.878; scale-y: 0.826; }
        frame 6 { x: 16.9; y: 20.1; skew-x: 323.8; skew-y: 314.9; scale-x: 0.92; scale-y: 0.842; }
        frame 7 { x: 18.6; y: 21.4; skew-x: 327.9; skew-y: 316.6; scale-x: 0.926; scale-y: 0.847; }
        frame 8 { x: 20.3; y: 22.7; skew-x: 332.2; skew-y: 318.4; scale-x: 0.933; scale-y: 0.854; }
        frame 9 { x: 22; y: 24; skew-x: 336.2; skew-y: 320.1; scale-x: 0.942; scale-y: 0.863; }
        frame 10 { x: 24.3; y: 22.7; skew-x: 342.4; skew-y: 331.7; scale-x: 0.894; scale-y: 0.84; }
        frame 11 { x: 26.9; y: 21.7; skew-x: 348.5; skew-y: 343.2; scale-x: 0.846; scale-y: 0.819; }
        frame 12 { x: 29.5; y: 21; skew-x: 354.6; skew-y: 354.6; scale-x: 0.799; scale-y: 0.799; }
        frame 13 { x: 27.7; y: 20.3; skew-x: 350.5; skew-y: 350.5; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 26; y: 19.6; skew-x: 346.2; skew-y: 346.2; }
        frame 15 { x: 24.4; y: 18.9; skew-x: 341.9; skew-y: 341.9; }
        frame 16 { x: 22; y: 19; skew-x: 334.7; skew-y: 334.7; }
        frame 17 { x: 19.7; y: 19.3; skew-x: 327.4; skew-y: 327.4; scale-x: 0.798; scale-y: 0.798; }
        frame 18 { x: 17.4; y: 19.7; skew-x: 320.3; skew-y: 320.3; scale-x: 0.8; scale-y: 0.8; }
        frame 19 { x: 15.7; y: 18.9; skew-x: 326.2; skew-y: 326.2; scale-x: 0.798; scale-y: 0.798; }
        frame 20 { x: 14; y: 18.2; skew-x: 331.9; skew-y: 331.9; scale-x: 0.799; scale-y: 0.799; }
        frame 21 { x: 12.4; y: 17.4; skew-x: 337.8; skew-y: 337.8; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 10.5; y: 18.9; skew-x: 340.2; skew-y: 340.2; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 8.6; y: 20.3; skew-x: 342.7; skew-y: 342.7; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 6.6; y: 22; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 5.1; y: 22.3; skew-x: 345.5; skew-y: 345.5; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: 3.7; y: 22.5; skew-x: 346; skew-y: 346; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 2.3; y: 22.8; skew-x: 346.5; skew-y: 346.5; }
        frame 29 { x: 0.9; y: 23.1; skew-x: 347; skew-y: 347; }
        frame 30 { x: 0.1; y: 23.6; skew-x: 350.4; skew-y: 350.4; }
        frame 31 { x: -0.4; y: 24; skew-x: 353.7; skew-y: 353.7; scale-x: 0.798; scale-y: 0.798; }
        frame 32 { x: -1.2; y: 24.4; skew-x: 357; skew-y: 357; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: -1.8; y: 25; skew-x: 360.3; skew-y: 360.3; }
        frame 34 { x: -2.4; y: 25.4; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 35 { x: -3.1; y: 25.9; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -3.8; y: 26.3; skew-x: 360.4; skew-y: 360.4; }
        frame 37 { x: 1.4; y: 19.4; skew-x: 341.7; skew-y: 341.7; scale-x: 0.796; scale-y: 0.796; }
        frame 38 { x: 7.2; y: 13; skew-x: 322.9; skew-y: 322.9; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 14; y: 6.7; skew-x: 304.1; skew-y: 304.1; scale-x: 0.797; scale-y: 0.797; }
        frame 40 { x: 20.9; y: 16.8; skew-x: 311.6; skew-y: 311.6; scale-x: 0.795; scale-y: 0.795; }
        frame 41 { x: 27.8; y: 26.7; skew-x: 319; skew-y: 319; scale-x: 0.796; scale-y: 0.796; }
        frame 42 { x: 28.1; y: 29.3; skew-x: 307.8; skew-y: 307.8; scale-x: 0.794; scale-y: 0.794; }
        frame 43 { x: 28.6; y: 32; skew-x: 296.5; skew-y: 296.5; scale-x: 0.795; scale-y: 0.795; }
        frame 44 { x: 25.3; y: 23.2; skew-x: 314.9; skew-y: 314.9; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 22.8; y: 14.4; skew-x: 333.2; skew-y: 333.2; }
        frame 46 { x: 21; y: 6; skew-x: 351.5; skew-y: 351.5; scale-x: 0.797; scale-y: 0.797; }
        frame 47 { x: 16.2; y: 11.4; skew-x: 349.4; skew-y: 349.4; scale-x: 0.798; scale-y: 0.798; }
        frame 48 { x: 11.4; y: 16.6; skew-x: 347.2; skew-y: 347.2; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 6.6; y: 22; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 7.1; y: 21; skew-x: 348.9; skew-y: 348.9; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 7.5; y: 20.2; skew-x: 352.7; skew-y: 352.7; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 8; y: 19.3; skew-x: 356.3; skew-y: 356.3; }
        frame 54 { x: 7; y: 20.3; skew-x: 348.5; skew-y: 348.5; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { x: 6; y: 21.5; skew-x: 340.7; skew-y: 340.7; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 5.3; y: 22.7; skew-x: 332.7; skew-y: 332.7; }
        frame 57 { x: 5.8; y: 21.6; skew-x: 336.9; skew-y: 336.9; }
        frame 58 { x: 6.1; y: 20.4; skew-x: 341; skew-y: 341; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { x: 6.6; y: 19.4; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 60 { x: 5.2; y: 21.3; skew-x: 341.4; skew-y: 341.4; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: 3.8; y: 23.2; skew-x: 337.7; skew-y: 337.7; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: 2.5; y: 25.2; skew-x: 333.8; skew-y: 333.8; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 3.9; y: 24.1; skew-x: 337.7; skew-y: 337.7; }
        frame 64 { x: 5.3; y: 23; skew-x: 341.4; skew-y: 341.4; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: 6.6; y: 22; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 10.8; y: 17.4; skew-x: 330.7; skew-y: 330.7; scale-x: 0.797; scale-y: 0.797; }
        frame 68 { x: 15.4; y: 13.1; skew-x: 316.1; skew-y: 316.1; scale-x: 0.796; scale-y: 0.796; }
        frame 69 { x: 20.5; y: 8.9; skew-x: 301.6; skew-y: 301.6; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 22.3; y: 8.7; skew-x: 314.9; skew-y: 314.9; scale-x: 0.794; scale-y: 0.794; }
        frame 71 { x: 24.6; y: 8.5; skew-x: 328.2; skew-y: 328.2; scale-x: 0.795; scale-y: 0.795; }
        frame 72 { x: 27.1; y: -10000; skew-x: 341.5; skew-y: 341.5; scale-x: 0.796; scale-y: 0.796; }
        frame 73 { x: 24.2; y: 12; skew-x: 331.9; skew-y: 331.9; scale-x: 0.795; scale-y: 0.795; }
        frame 74 { x: 21.4; y: 15.7; skew-x: 322.4; skew-y: 322.4; scale-x: 0.794; scale-y: 0.794; }
        frame 75 { x: 18.8; y: 19.3; skew-x: 312.9; skew-y: 312.9; scale-x: 0.795; scale-y: 0.795; }
        frame 76 { x: 17.5; y: 22.6; skew-x: 305.4; skew-y: 305.4; scale-x: 0.794; scale-y: 0.794; }
        frame 77 { x: 16.5; y: 25.8; skew-x: 298.1; skew-y: 298.1; scale-x: 0.793; scale-y: 0.793; }
        frame 78 { x: 15.4; y: 29.1; skew-x: 290.6; skew-y: 290.6; scale-x: 0.794; scale-y: 0.794; }
        frame 79 { x: 15.5; y: 32.9; skew-x: 284.8; skew-y: 284.8; scale-x: 0.793; scale-y: 0.793; }
        frame 80 { x: 15.6; y: 36.5; skew-x: 279.3; skew-y: 279.3; scale-x: 0.794; scale-y: 0.794; }
        frame 81 { x: 16.9; y: 37.3; skew-x: 259; skew-y: 259; scale-x: 0.792; scale-y: 0.792; }
        frame 82 { x: 18.7; y: 37.4; skew-x: 238.4; skew-y: 238.4; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 16.9; y: 37.3; skew-x: 259; skew-y: 259; }
        frame 84 { x: 15.6; y: 36.5; skew-x: 279.3; skew-y: 279.3; scale-x: 0.794; scale-y: 0.794; }
        frame 85 { x: 16; y: 31.9; skew-x: 283.5; skew-y: 283.5; scale-x: 0.793; scale-y: 0.793; }
        frame 86 { x: 16.5; y: 27.3; skew-x: 287.8; skew-y: 287.8; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 16.9; y: 22.5; skew-x: 292.1; skew-y: 292.1; scale-x: 0.794; scale-y: 0.794; }
        frame 88 { x: 14.8; y: 22.4; skew-x: 300.8; skew-y: 300.8; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 12.8; y: 22.3; skew-x: 309.8; skew-y: 309.8; scale-x: 0.795; scale-y: 0.795; }
        frame 90 { x: 11; y: 22.2; skew-x: 318.6; skew-y: 318.6; scale-x: 0.796; scale-y: 0.796; }
        frame 91 { x: 9.4; y: 22; skew-x: 327.4; skew-y: 327.4; scale-x: 0.797; scale-y: 0.797; }
        frame 92 { x: 7.9; y: 21.9; skew-x: 336.2; skew-y: 336.2; scale-x: 0.798; scale-y: 0.798; }
        frame 93 { x: 6.6; y: 22; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Chomper_Headleaf2";
        frame-count: 94;
        frame 0 { x: 1.6; y: 24.3; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHOMPER_HEADLEAF2; }
        frame 1 { x: 3.2; y: 23; skew-x: 340.2; skew-y: 340.2; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 4.7; y: 21.8; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 6.3; y: 20.7; skew-x: 330; skew-y: 330; scale-x: 0.8; scale-y: 0.8; }
        frame 4 { x: 8.4; y: 20.9; skew-x: 328.7; skew-y: 329.9; scale-x: 0.836; scale-y: 0.813; }
        frame 5 { x: 10.5; y: 21.2; skew-x: 327.4; skew-y: -10000; scale-x: 0.872; scale-y: 0.827; }
        frame 6 { x: 12.5; y: 21.3; skew-x: 326.2; scale-x: 0.911; scale-y: 0.842; }
        frame 7 { x: 14.1; y: 22.5; skew-x: 330.4; skew-y: 331.7; scale-x: 0.918; scale-y: 0.838; }
        frame 8 { x: 15.6; y: 23.4; skew-x: 334.5; skew-y: 333.4; scale-x: 0.928; scale-y: 0.836; }
        frame 9 { x: 17; y: 24.3; skew-x: 338.6; skew-y: 335.2; scale-x: 0.938; scale-y: 0.834; }
        frame 10 { x: 18.6; y: 23.4; skew-x: 341.2; skew-y: 339; scale-x: 0.891; scale-y: 0.822; }
        frame 11 { x: 20.2; y: 22.6; skew-x: 344; skew-y: 342.7; scale-x: 0.845; scale-y: 0.81; }
        frame 12 { x: 22; y: 22; skew-x: 346.5; skew-y: 346.5; scale-x: 0.799; scale-y: 0.799; }
        frame 13 { x: 20.9; y: 21.6; skew-x: 345.2; skew-y: 345.4; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 19.8; y: 21.1; skew-x: 343.7; skew-y: 344.2; }
        frame 15 { x: 18.7; y: 20.8; skew-x: 342.3; skew-y: 342.9; scale-y: 0.8; }
        frame 16 { x: 15.9; y: 21.3; skew-x: 335.2; skew-y: 335.7; scale-x: 0.798; scale-y: 0.799; }
        frame 17 { x: 13.3; y: 21.8; skew-x: 327.9; skew-y: 328.4; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 10.9; y: 22.4; skew-x: 320.8; skew-y: 321.3; scale-x: 0.8; scale-y: 0.8; }
        frame 19 { x: 9.6; y: 21.5; skew-x: 326.7; skew-y: 327.2; scale-x: 0.798; scale-y: 0.799; }
        frame 20 { x: 8.3; y: 20.6; skew-x: 332.4; skew-y: 332.9; scale-x: 0.799; scale-y: -10000; }
        frame 21 { x: 7; y: 19.6; skew-x: 338.2; skew-y: 338.8; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 5.2; y: 21.2; skew-x: 340.5; skew-y: 340.9; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 3.4; y: 22.8; skew-x: 342.7; skew-y: 343; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 1.6; y: 24.3; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 0.4; y: 24.6; skew-x: 345.2; skew-y: 345.2; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: -0.8; y: 25; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -2; y: 25.3; skew-x: 345.4; skew-y: 345.4; }
        frame 29 { x: -3.3; y: 25.8; skew-x: 345.5; skew-y: 345.5; }
        frame 30 { x: -4.2; y: 26.7; skew-x: 345.7; skew-y: 345.7; scale-x: 0.798; scale-y: 0.798; }
        frame 31 { x: -5.1; y: 27.4; skew-x: 346; skew-y: 346; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -6.1; y: 28.2; skew-x: 346.2; skew-y: 346.2; }
        frame 33 { x: -7.1; y: 28.9; skew-x: 346.5; skew-y: 346.5; }
        frame 34 { x: -8; y: 29.9; skew-x: 344.7; skew-y: 344.7; scale-x: 0.797; scale-y: 0.797; }
        frame 35 { x: -8.9; y: 31.1; skew-x: 343; skew-y: 343; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -9.7; y: 32.1; skew-x: 341.1; skew-y: 341.1; scale-x: 0.798; scale-y: 0.798; }
        frame 37 { x: -3.6; y: 24.5; skew-x: 329.2; skew-y: 329.2; scale-x: 0.796; scale-y: 0.796; }
        frame 38 { x: 2.7; y: 16.9; skew-x: 317.1; skew-y: 317.1; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 9.6; y: 9.4; skew-x: 305; skew-y: 305; scale-x: 0.797; scale-y: 0.797; }
        frame 40 { x: 15.6; y: 19.1; skew-x: 310.1; skew-y: 310.1; scale-x: 0.795; scale-y: 0.795; }
        frame 41 { x: 21.8; y: 28.8; skew-x: 315.3; skew-y: 315.3; scale-x: 0.796; scale-y: 0.796; }
        frame 42 { x: 22.2; y: 31.7; skew-x: 308.3; skew-y: 308.3; scale-x: 0.794; scale-y: 0.794; }
        frame 43 { x: 22.7; y: 34.6; skew-x: 301.3; skew-y: 301.3; scale-x: 0.795; scale-y: 0.795; }
        frame 44 { x: 19.6; y: 25.4; skew-x: 318.1; skew-y: 318.1; scale-x: 0.794; scale-y: 0.794; }
        frame 45 { x: 17.3; y: 16.3; skew-x: 334.7; skew-y: 334.7; scale-x: 0.795; scale-y: 0.795; }
        frame 46 { x: 15.9; y: 7.7; skew-x: 351.5; skew-y: 351.5; scale-x: 0.797; scale-y: 0.797; }
        frame 47 { x: 11.1; y: 13.2; skew-x: 349.4; skew-y: 349.4; scale-x: 0.798; scale-y: 0.798; }
        frame 48 { x: 6.4; y: 18.8; skew-x: 347.2; skew-y: 347.2; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 1.6; y: 24.3; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 1.7; y: 23.8; skew-x: 344.7; skew-y: 344.7; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: 1.8; y: 23.3; skew-x: 344.2; skew-y: 344.2; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: -10000; y: 22.7; skew-x: 343.6; skew-y: 343.6; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 1.3; y: 23.7; skew-x: 339.5; skew-y: 339.5; scale-x: 0.797; scale-y: 0.797; }
        frame 55 { x: 0.9; y: 24.5; skew-x: 335.4; skew-y: 335.4; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 0.5; y: 25.5; skew-x: 331.1; skew-y: 331.1; }
        frame 57 { x: 1; y: 23.8; skew-x: 337.7; skew-y: 337.7; }
        frame 58 { x: 1.7; y: 22.2; skew-x: 344; skew-y: 344; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: 2.5; y: 20.6; skew-x: 350.3; skew-y: 350.3; scale-x: 0.8; scale-y: 0.8; }
        frame 60 { x: 0.7; y: 22.5; skew-x: 344.9; skew-y: 344.9; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: -0.8; y: 24.5; skew-x: 339.4; skew-y: 339.4; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: -2.4; y: 26.5; skew-x: 333.8; skew-y: 333.8; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: -1; y: 25.8; skew-x: 337.7; skew-y: 337.7; }
        frame 64 { x: 0.3; y: 25.1; skew-x: 341.4; skew-y: 341.4; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: 1.6; y: 24.3; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 5.4; y: 19.9; skew-x: 331.7; skew-y: 331.7; scale-x: 0.797; scale-y: 0.797; }
        frame 68 { x: 9.5; y: 15.7; skew-x: 318.1; skew-y: 318.1; scale-x: 0.796; scale-y: 0.796; }
        frame 69 { x: 14.5; y: 11.7; skew-x: 304.7; skew-y: 304.7; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 15.7; y: 10.8; skew-x: 314.9; skew-y: 314.9; scale-x: 0.794; scale-y: 0.794; }
        frame 71 { x: 17.1; y: 10; skew-x: 325.2; skew-y: 325.2; scale-x: 0.795; scale-y: 0.795; }
        frame 72 { x: 18.9; y: 9.2; skew-x: 335.5; skew-y: 335.5; scale-x: 0.796; scale-y: 0.796; }
        frame 73 { x: 16.3; y: 14.1; skew-x: 325.9; skew-y: 325.9; scale-x: 0.795; scale-y: 0.795; }
        frame 74 { x: 14; y: 18.9; skew-x: 316.4; skew-y: 316.4; scale-x: 0.794; scale-y: 0.794; }
        frame 75 { x: 12; y: 23.9; skew-x: 306.9; skew-y: 306.9; scale-x: 0.795; scale-y: 0.795; }
        frame 76 { x: 11.4; y: 28; skew-x: 299.4; skew-y: 299.4; scale-x: 0.794; scale-y: 0.794; }
        frame 77 { x: 11.1; y: 32; skew-x: 292; skew-y: 292; scale-x: 0.793; scale-y: 0.793; }
        frame 78 { x: 10.9; y: 35.9; skew-x: 284.6; skew-y: 284.6; scale-x: 0.794; scale-y: 0.794; }
        frame 79 { x: 11.7; y: 40; skew-x: 278.8; skew-y: 278.8; scale-x: 0.793; scale-y: 0.793; }
        frame 80 { x: 12.5; y: 44; skew-x: 273.3; skew-y: 273.3; scale-x: 0.794; scale-y: 0.794; }
        frame 81 { x: 16; y: 44.5; skew-x: 251.4; skew-y: 251.4; scale-x: 0.792; scale-y: 0.792; }
        frame 82 { x: 20.2; y: 43.8; skew-x: 229.2; skew-y: 229.2; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 16; y: 44.4; skew-x: 251.4; skew-y: 251.4; }
        frame 84 { x: 12.5; y: 44; skew-x: 273.3; skew-y: 273.3; scale-x: 0.794; scale-y: 0.794; }
        frame 85 { x: 12.4; y: 38.3; skew-x: 279; skew-y: 279; scale-x: 0.793; scale-y: 0.793; }
        frame 86 { x: 12.3; y: 32.5; skew-x: 284.8; skew-y: 284.8; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -10000; y: 26.7; skew-x: 290.6; skew-y: 290.6; scale-x: 0.794; scale-y: 0.794; }
        frame 88 { x: 10; y: 26.2; skew-x: 299.6; skew-y: 299.6; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 7.9; y: 25.8; skew-x: 308.8; skew-y: 308.8; scale-x: 0.795; scale-y: 0.795; }
        frame 90 { x: 6; y: 25.4; skew-x: 317.9; skew-y: 317.9; scale-x: 0.796; scale-y: 0.796; }
        frame 91 { x: 4.4; y: 24.9; skew-x: 326.9; skew-y: 326.9; scale-x: 0.797; scale-y: 0.797; }
        frame 92 { x: 3.1; y: 24.7; skew-x: 336; skew-y: 336; scale-x: 0.798; scale-y: 0.798; }
        frame 93 { x: 1.6; y: 24.3; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Chomper_Headleaf1";
        frame-count: 94;
        frame 0 { x: -2.3; y: 36.1; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHOMPER_HEADLEAF1; }
        frame 1 { x: -0.3; y: 35.1; skew-x: 340.2; skew-y: 340.2; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 1.6; y: 34; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 3.8; y: 33.1; skew-x: 330; skew-y: 330; scale-x: 0.8; scale-y: 0.8; }
        frame 4 { x: 4.9; y: 32.2; skew-x: 334.9; skew-y: 329.9; scale-x: 0.845; scale-y: 0.813; }
        frame 5 { x: 6; y: 31.2; skew-x: 339.7; skew-y: -10000; scale-x: 0.892; scale-y: 0.827; }
        frame 6 { x: 7.4; y: 30.1; skew-x: 344.5; scale-x: 0.939; scale-y: 0.842; }
        frame 7 { x: 9.5; y: 28.8; skew-x: 354.2; skew-y: 336.7; scale-x: 0.944; scale-y: 0.838; }
        frame 8 { x: 11.8; y: 27.4; skew-x: 363.5; skew-y: 343.5; scale-x: 0.95; scale-y: 0.836; }
        frame 9 { x: 14.2; y: 26.1; skew-x: 373.2; skew-y: 350.2; scale-x: 0.956; scale-y: 0.834; }
        frame 10 { x: 14.6; y: 28.6; skew-x: 364.3; skew-y: 349; scale-x: 0.904; scale-y: 0.822; }
        frame 11 { x: 15.2; y: 30.9; skew-x: 355.5; skew-y: 347.7; scale-x: 0.851; scale-y: 0.81; }
        frame 12 { x: 16; y: 33; skew-x: 346.5; skew-y: 346.5; scale-x: 0.799; scale-y: 0.799; }
        frame 13 { x: 15.4; y: 34.1; skew-x: 340; skew-y: 340; scale-x: 0.798; scale-y: 0.798; }
        frame 14 { x: 14.8; y: 35.4; skew-x: 333.4; skew-y: 333.4; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 14.5; y: 36.6; skew-x: 326.9; skew-y: 326.9; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 12.9; y: 36.4; skew-x: 324.7; skew-y: 324.7; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { x: 11.3; y: -10000; skew-x: 322.4; skew-y: 322.4; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 9.7; y: 36.1; skew-x: 320.3; skew-y: 320.3; scale-x: 0.8; scale-y: 0.8; }
        frame 19 { x: 7.8; y: 34.8; skew-x: 326.2; skew-y: 326.2; scale-x: 0.798; scale-y: 0.798; }
        frame 20 { x: 6; y: 33.4; skew-x: 331.9; skew-y: 331.9; scale-x: 0.799; scale-y: 0.799; }
        frame 21 { x: 4.3; y: 32.1; skew-x: 337.8; skew-y: 337.8; scale-x: 0.8; scale-y: 0.8; }
        frame 22 { x: 2; y: 33.5; skew-x: 340.2; skew-y: 340.2; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: -0; y: 34.8; skew-x: 342.7; skew-y: 342.7; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: -2.3; y: 36.1; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: -3.5; y: 37.4; skew-x: 341.2; skew-y: 341.2; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: -4.6; y: 38.8; skew-x: 337.2; skew-y: 337.2; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -5.7; y: 40.1; skew-x: 333.2; skew-y: 333.2; scale-x: 0.798; scale-y: 0.798; }
        frame 29 { x: -6.7; y: 41.6; skew-x: 329.1; skew-y: 329.1; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: -6.9; y: 43.5; skew-x: 322.4; skew-y: 322.4; scale-x: 0.798; scale-y: 0.798; }
        frame 31 { x: -7; y: 45.3; skew-x: 315.7; skew-y: 315.7; scale-x: 0.797; scale-y: 0.797; }
        frame 32 { x: -10000; y: 47.1; skew-x: 309.1; skew-y: 309.1; scale-x: -10000; scale-y: -10000; }
        frame 33 { y: 48.8; skew-x: 302.3; skew-y: 302.3; scale-x: 0.798; scale-y: 0.798; }
        frame 34 { x: -7.2; y: 51.1; skew-x: 298.3; skew-y: 298.3; scale-x: 0.797; scale-y: 0.797; }
        frame 35 { x: -7.4; y: 53.3; skew-x: 294.3; skew-y: 294.3; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -7.5; y: 55.7; skew-x: 290.5; skew-y: 290.5; scale-x: 0.798; scale-y: 0.798; }
        frame 37 { x: -2.6; y: 41.6; skew-x: 308.9; skew-y: 308.9; scale-x: 0.796; scale-y: 0.796; }
        frame 38 { x: 3.1; y: 27.1; skew-x: 327.4; skew-y: 327.4; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 9.9; y: 12.6; skew-x: 345.7; skew-y: 345.7; scale-x: 0.797; scale-y: 0.797; }
        frame 40 { x: 15.2; y: 23.1; skew-x: 347; skew-y: 347; scale-x: 0.796; scale-y: 0.796; }
        frame 41 { x: 20.5; y: 33.7; skew-x: 348.1; skew-y: 348.1; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 21.4; y: 36.2; skew-x: 339.7; skew-y: 339.7; scale-x: 0.794; scale-y: 0.794; }
        frame 43 { x: 22.5; y: 38.8; skew-x: 331.1; skew-y: 331.1; scale-x: 0.795; scale-y: 0.795; }
        frame 44 { x: 18.4; y: 32.2; skew-x: 337.9; skew-y: 337.9; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 14.3; y: 25.6; skew-x: 344.7; skew-y: 344.7; scale-x: 0.796; scale-y: 0.796; }
        frame 46 { x: 10.4; y: 19.1; skew-x: 351.5; skew-y: 351.5; scale-x: 0.797; scale-y: 0.797; }
        frame 47 { x: 6.2; y: 24.8; skew-x: 349.4; skew-y: 349.4; scale-x: 0.798; scale-y: 0.798; }
        frame 48 { x: 1.9; y: 30.5; skew-x: 347.2; skew-y: 347.2; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: -2.3; y: 36.1; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: -2.1; y: 33.9; skew-x: 350.7; skew-y: 350.7; scale-x: 0.799; scale-y: 0.799; }
        frame 52 { x: -1.7; y: 31.7; skew-x: 356.5; skew-y: 356.5; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: -1.3; y: 29.6; skew-x: 362.1; skew-y: 362.1; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: -1.4; y: 30.9; skew-x: 360.3; skew-y: 360.3; }
        frame 55 { x: -1.5; y: 32.2; skew-x: 358.7; skew-y: 358.7; }
        frame 56 { x: -1.6; y: 33.5; skew-x: 357; skew-y: 357; }
        frame 57 { x: -1.5; y: 32.6; skew-x: 357.5; skew-y: 357.5; }
        frame 58 { x: -10000; y: 31.8; skew-x: 357.7; skew-y: 357.7; scale-x: 0.799; scale-y: 0.799; }
        frame 59 { y: 30.8; skew-x: 358; skew-y: 358; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: -2.6; y: 33.4; skew-x: 350; skew-y: 350; }
        frame 61 { x: -3.4; y: 36.1; skew-x: 342; skew-y: 342; scale-x: 0.798; scale-y: 0.798; }
        frame 62 { x: -4.2; y: 38.8; skew-x: 333.8; skew-y: 333.8; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: -3.6; y: 37.9; skew-x: 337.7; skew-y: 337.7; }
        frame 64 { x: -3; y: 37; skew-x: 341.4; skew-y: 341.4; scale-x: 0.799; scale-y: 0.799; }
        frame 65 { x: -2.3; y: 36.1; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 1.7; y: 29.8; skew-x: 340; skew-y: 340; scale-x: 0.798; scale-y: 0.798; }
        frame 68 { x: 6.1; y: 23.6; skew-x: 335; skew-y: 335; scale-x: 0.797; scale-y: 0.797; }
        frame 69 { x: 10.2; y: 17.6; skew-x: 330; skew-y: 330; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 11; y: 16.7; skew-x: 338.9; skew-y: 338.9; scale-x: 0.796; scale-y: 0.796; }
        frame 71 { x: 12.1; y: 15.8; skew-x: 347.9; skew-y: 347.9; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 13.4; y: 15; skew-x: 356.7; skew-y: 356.7; scale-x: 0.797; scale-y: 0.797; }
        frame 73 { x: 12.1; y: 20.5; skew-x: 347.2; skew-y: 347.2; scale-x: 0.796; scale-y: 0.796; }
        frame 74 { x: 10.9; y: 26.1; skew-x: 337.7; skew-y: 337.7; scale-x: 0.795; scale-y: 0.795; }
        frame 75 { x: 9.9; y: 31.6; skew-x: 328.2; skew-y: 328.2; scale-x: 0.796; scale-y: 0.796; }
        frame 76 { x: 10.3; y: 35.6; skew-x: 320.9; skew-y: 320.9; scale-x: 0.794; scale-y: 0.794; }
        frame 77 { x: 11; y: 39.8; skew-x: 313.4; skew-y: 313.4; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 11.8; y: 43.8; skew-x: 305.9; skew-y: 305.9; scale-x: 0.795; scale-y: 0.795; }
        frame 79 { x: 13.3; y: 47.8; skew-x: 300.1; skew-y: 300.1; scale-x: 0.793; scale-y: 0.793; }
        frame 80 { x: 15; y: 51.6; skew-x: 294.6; skew-y: 294.6; scale-x: 0.794; scale-y: 0.794; }
        frame 81 { x: 18.1; y: 49.8; skew-x: 283.8; skew-y: 283.8; scale-x: 0.793; scale-y: 0.793; }
        frame 82 { x: 21.5; y: 48; skew-x: 273.3; skew-y: 273.3; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 18.2; y: 50; skew-x: 283.8; skew-y: 283.8; }
        frame 84 { x: 15; y: 51.6; skew-x: 294.6; skew-y: 294.6; scale-x: 0.794; scale-y: 0.794; }
        frame 85 { x: 13.3; y: 46.1; skew-x: 301.8; skew-y: 301.8; scale-x: 0.793; scale-y: 0.793; }
        frame 86 { x: 11.6; y: 40.5; skew-x: 309.1; skew-y: 309.1; scale-x: 0.794; scale-y: 0.794; }
        frame 87 { x: 10.2; y: 34.9; skew-x: 316.4; skew-y: 316.4; scale-x: 0.795; scale-y: 0.795; }
        frame 88 { x: 8; y: 35.1; skew-x: 321.2; skew-y: 321.2; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 5.7; y: 35.4; skew-x: 325.9; skew-y: 325.9; scale-x: 0.796; scale-y: 0.796; }
        frame 90 { x: 3.6; y: 35.5; skew-x: 330.7; skew-y: 330.7; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 1.5; y: 35.8; skew-x: 335.5; skew-y: 335.5; scale-x: 0.797; scale-y: 0.797; }
        frame 92 { x: -0.4; y: 36; skew-x: 340.2; skew-y: 340.2; scale-x: 0.798; scale-y: 0.798; }
        frame 93 { x: -2.3; y: 36.1; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Chomper_insidemouth";
        frame-count: 94;
        frame 0 { x: 24.3; y: 32; skew-x: 354.6; skew-y: 354.6; scale-x: 0.823; scale-y: 0.759; image: IMAGE_REANIM_CHOMPER_INSIDEMOUTH; }
        frame 1 { x: 26; y: 31.8; skew-x: 357.3; skew-y: 355.4; scale-x: 0.818; scale-y: 0.714; image: none; }
        frame 2 { x: 27.9; y: 28.9; skew-x: 352.5; skew-y: 351.2; scale-x: -10000; scale-y: 0.73; }
        frame 3 { x: 29.8; y: 26; skew-x: 347.7; skew-y: 347; scale-x: 0.819; scale-y: 0.747; }
        frame 4 { x: 31.7; y: 23.4; skew-x: 342.7; skew-y: 342.7; scale-x: 0.82; scale-y: 0.764; }
        frame 5 { x: 33; y: 25.2; skew-x: 342.5; skew-y: 342.5; scale-x: 0.818; scale-y: -10000; }
        frame 6 { x: 34.3; y: 27.2; skew-x: 342.2; skew-y: 342.2; scale-x: 0.817; scale-y: 0.765; }
        frame 7 { x: 35.6; y: 29.2; skew-x: 342; skew-y: 342; scale-x: 0.816; scale-y: 0.766; }
        frame 8 { x: 36.9; y: 31.1; skew-x: 341.7; skew-y: 341.7; scale-x: -10000; scale-y: 0.767; }
        frame 9 { x: 37.6; y: 31.8; skew-x: 346.2; skew-y: 346.2; scale-x: 0.814; scale-y: -10000; }
        frame 10 { x: 38.4; y: 32.7; skew-x: 350.4; skew-y: 350.4; scale-x: 0.813; scale-y: 0.769; }
        frame 11 { x: 39.4; y: 33.6; skew-x: 354.7; skew-y: 354.7; scale-x: -10000; scale-y: 0.77; }
        frame 12 { x: 40.3; y: 34.8; skew-x: 358.9; skew-y: 358.9; scale-x: 0.812; scale-y: 0.771; }
        frame 13 { x: 40.6; y: 34.4; skew-x: -10000; skew-y: 358.8; scale-x: -10000; scale-y: 0.736; }
        frame 14 { x: 38.9; y: 32.9; skew-x: 353.2; skew-y: 353.2; scale-x: 0.813; scale-y: 0.746; }
        frame 15 { x: 37.5; y: 31.6; skew-x: 347.5; skew-y: 347.5; scale-x: 0.814; scale-y: 0.756; }
        frame 16 { x: 36.1; y: 30.3; skew-x: 341.7; skew-y: 341.7; scale-x: 0.816; scale-y: 0.767; }
        frame 17 { x: 34.3; y: 27.8; skew-x: 342; skew-y: 342; scale-x: -10000; scale-y: 0.766; }
        frame 18 { x: 32.5; y: 25.2; skew-x: 342.2; skew-y: 342.2; scale-x: 0.817; scale-y: 0.765; }
        frame 19 { x: 30.5; y: 22.6; skew-x: 342.5; skew-y: 342.5; scale-x: 0.818; scale-y: 0.764; }
        frame 20 { x: 28.7; y: 20.1; skew-x: 342.7; skew-y: 342.7; scale-x: 0.82; scale-y: -10000; }
        frame 21 { x: 27.6; y: 23.1; skew-x: 345.7; skew-y: 345.7; scale-x: -10000; scale-y: 0.762; }
        frame 22 { x: 26.4; y: 26.1; skew-x: 348.7; skew-y: 348.7; scale-x: 0.821; scale-y: 0.761; }
        frame 23 { x: 25.4; y: 29.1; skew-x: 351.7; skew-y: 351.7; scale-x: 0.822; scale-y: 0.759; }
        frame 24 { x: 24.3; y: 32; skew-x: 354.6; skew-y: 354.6; scale-x: 0.823; scale-y: -10000; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 26 { x: 23.2; y: 30.8; skew-x: 351.5; skew-y: 351.5; scale-x: 0.812; scale-y: 0.758; }
        frame 27 { x: 22.4; y: 29.6; skew-x: 348.5; skew-y: 348.5; scale-x: 0.801; scale-y: 0.759; }
        frame 28 { x: 21.4; y: 28.2; skew-x: 345.4; skew-y: 345.4; scale-x: 0.789; scale-y: -10000; }
        frame 29 { x: 20.5; y: 27; skew-x: 342.3; skew-y: 342.3; scale-x: 0.779; }
        frame 30 { x: 18.9; y: 28.5; skew-x: 343.9; skew-y: 343.9; scale-x: 0.79; }
        frame 31 { x: 17.3; y: 29.9; skew-x: 345.5; skew-y: 345.5; scale-x: 0.801; }
        frame 32 { x: 15.8; y: 31.4; skew-x: 347; skew-y: 347; scale-x: 0.812; }
        frame 33 { x: 14.2; y: 32.8; skew-x: 348.6; skew-y: 348.6; scale-x: 0.824; }
        frame 34 { x: 13; y: 34.1; skew-x: 345.4; skew-y: 345.4; scale-x: 0.823; scale-y: 0.758; }
        frame 35 { x: 11.7; y: 35.6; skew-x: 342.2; skew-y: 342.2; scale-x: 0.822; scale-y: -10000; }
        frame 36 { x: 10.6; y: 37.2; skew-x: 338.7; skew-y: 338.7; scale-x: 0.823; scale-y: 0.759; }
        frame 37 { x: 20.6; y: 17.3; skew-x: 359.4; skew-y: 354.7; scale-x: 0.855; scale-y: 0.875; }
        frame 38 { x: 32; y: 0.4; skew-x: 377.3; skew-y: 368.5; scale-x: 0.883; scale-y: 0.978; }
        frame 39 { x: 43.6; y: -13.4; skew-x: 393.1; skew-y: 380.7; scale-x: 0.909; scale-y: 1.067; }
        frame 40 { x: 40.1; y: 10.2; skew-x: 361; skew-y: 342.9; scale-x: 0.858; scale-y: 0.944; }
        frame 41 { x: 41.5; y: 32.2; skew-x: 330; skew-y: 303.7; scale-x: 0.914; scale-y: 0.706; }
        frame 42 { x: 42.6; y: 32.9; skew-x: 331.9; skew-y: 307.1; scale-x: 0.893; scale-y: 0.691; }
        frame 43 { x: 43.9; y: 33.5; skew-x: 333.8; skew-y: 310.6; scale-x: 0.874; scale-y: 0.677; }
        frame 44 { x: 39.6; y: 29.3; skew-x: 336.4; skew-y: 313.1; scale-x: 0.873; scale-y: 0.676; }
        frame 45 { x: 35.3; y: 25; skew-x: 339; skew-y: 315.9; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 31; y: 20.7; skew-x: 341.6; skew-y: 318.4; scale-y: 0.677; }
        frame 47 { x: 27.8; y: 23.6; skew-x: 341.9; skew-y: 326.4; scale-x: 0.856; scale-y: 0.684; }
        frame 48 { x: 24.6; y: 26.6; skew-x: 342.2; skew-y: 334.4; scale-x: 0.84; scale-y: 0.693; }
        frame 49 { x: 21.6; y: 29.8; skew-x: 342.3; skew-y: 342.3; scale-x: 0.824; scale-y: 0.702; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 22.6; skew-x: 344.4; skew-y: 344.4; scale-x: 0.823; scale-y: 0.701; }
        frame 52 { x: 23.4; y: 29.9; skew-x: 346.4; skew-y: 346.4; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 24.3; y: 30.1; skew-x: 348.3; skew-y: 348.3; scale-x: 0.824; scale-y: 0.702; }
        frame 54 { x: 23.6; y: 29.7; skew-x: 348.4; skew-y: 348.4; scale-x: 0.823; scale-y: 0.701; }
        frame 55 { x: 22.8; y: 29.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 22; y: 28.9; skew-x: 348.3; skew-y: 348.3; scale-x: 0.824; scale-y: 0.702; }
        frame 57 { x: 21.1; y: 28.8; skew-x: 348.4; skew-y: 348.4; scale-x: 0.823; scale-y: 0.701; }
        frame 58 { x: 20; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 18.8; y: 28.9; skew-x: 348.3; skew-y: 348.3; scale-x: 0.824; scale-y: 0.702; }
        frame 60 { x: 19.9; y: 29.2; skew-x: 348.4; skew-y: 348.4; scale-x: 0.823; scale-y: 0.701; }
        frame 61 { x: 21; y: 29.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 22; y: 30.1; skew-x: 348.3; skew-y: 348.3; scale-x: 0.824; scale-y: 0.702; }
        frame 63 { x: 21.9; y: 29.9; skew-x: 346.4; skew-y: 346.4; scale-x: 0.823; scale-y: 0.701; }
        frame 64 { x: -10000; y: 29.8; skew-x: 344.4; skew-y: 344.4; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 21.6; y: -10000; skew-x: 342.3; skew-y: 342.3; scale-x: 0.824; scale-y: 0.702; }
        frame 66 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 26.3; y: 24.1; skew-x: 353; skew-y: 353; scale-x: 0.823; scale-y: 0.701; }
        frame 68 { x: 31.3; y: 18.9; skew-x: 363.5; skew-y: 363.5; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 37; y: 14; skew-x: 374.3; skew-y: 374.3; scale-x: 0.822; }
        frame 70 { x: 37.7; y: 16; skew-x: 377.5; skew-y: 377.5; scale-x: 0.821; scale-y: 0.7; }
        frame 71 { x: 38.5; y: 18.1; skew-x: 380.6; skew-y: 380.6; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 39.2; y: 20.1; skew-x: 383.8; skew-y: 383.9; scale-x: 0.822; }
        frame 73 { x: 37.4; y: 20.9; skew-x: 374.3; skew-y: 374.3; scale-x: 0.821; }
        frame 74 { x: 36; y: 22.3; skew-x: 364.8; skew-y: 364.8; scale-x: -10000; }
        frame 75 { x: 35; y: 23.8; skew-x: 355.3; skew-y: 355.3; scale-y: 0.699; }
        frame 76 { x: 33.7; y: 24.7; skew-x: 348; skew-y: 348; scale-x: 0.82; scale-y: -10000; }
        frame 77 { x: 32.8; y: 25.9; skew-x: 340.5; skew-y: 340.5; scale-x: 0.819; scale-y: 0.698; }
        frame 78 { x: 32; y: 27.1; skew-x: 333; skew-y: 333; scale-x: 0.82; scale-y: 0.699; }
        frame 79 { x: 31.7; y: 29.2; skew-x: 327.4; skew-y: 327.4; scale-x: 0.818; scale-y: 0.697; }
        frame 80 { x: 31.5; y: 31.2; skew-x: 321.7; skew-y: 321.7; scale-x: 0.819; scale-y: 0.698; }
        frame 81 { x: 31.7; y: 27.4; skew-x: 316.9; skew-y: 316.9; scale-x: 0.818; scale-y: 0.697; }
        frame 82 { x: 31.8; y: 23.5; skew-x: 312.2; skew-y: 312.2; scale-x: 0.819; scale-y: 0.698; }
        frame 83 { x: 31.6; y: 27.4; skew-x: 316.9; skew-y: 316.9; scale-x: 0.818; scale-y: 0.697; }
        frame 84 { x: 31.5; y: 31.2; skew-x: 321.7; skew-y: 321.7; scale-x: 0.819; scale-y: 0.698; }
        frame 85 { x: 32; y: 28.6; skew-x: 332.9; skew-y: 332.9; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 33.1; y: 26; skew-x: 344.2; skew-y: 344.2; scale-x: 0.82; }
        frame 87 { x: 35; y: 23.8; skew-x: 355.3; skew-y: 355.3; scale-x: 0.821; scale-y: 0.699; }
        frame 88 { x: 33.1; y: 25.1; skew-x: 355.2; skew-y: 355.2; scale-x: -10000; scale-y: 0.709; }
        frame 89 { x: 31.5; y: 26.5; skew-x: -10000; skew-y: -10000; scale-y: 0.719; }
        frame 90 { x: 29.6; y: 27.9; skew-x: 355; skew-y: 355; scale-x: 0.822; scale-y: 0.729; }
        frame 91 { x: 27.9; y: 29.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.739; }
        frame 92 { x: 26.1; y: 30.7; skew-x: 354.7; skew-y: 354.7; scale-y: 0.749; }
        frame 93 { x: 24.3; y: 32; skew-x: 354.6; skew-y: 354.6; scale-x: 0.823; scale-y: 0.759; }
    }
    Track {
        source-name: "Chomper_tongue";
        frame-count: 94;
        frame 0 { x: 18.2; y: 34; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHOMPER_TONGUE; }
        frame 1 { x: 21.4; y: 31.9; skew-x: 13.7; skew-y: 14.1; scale-x: 0.799; scale-y: 0.749; image: none; }
        frame 2 { x: 23.1; y: 30.8; skew-x: 9; skew-y: 9.3; scale-x: -10000; scale-y: 0.765; }
        frame 3 { x: 24.7; y: 29.6; skew-x: 4.5; skew-y: 4.6; scale-y: 0.783; }
        frame 4 { x: 26.5; y: 28.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 5 { x: 30.4; y: 29.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 34.3; y: 31.2; }
        frame 7 { x: 38.1; y: 32.5; }
        frame 8 { x: 42; y: 33.9; }
        frame 9 { x: 43; y: 35.3; skew-x: 4; skew-y: 4; }
        frame 10 { x: 43.9; y: 36.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 11 { x: 45; y: 38.1; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 46.1; y: 39.6; skew-x: 16.6; skew-y: 16.6; }
        frame 13 { x: -10000; y: 37.9; skew-x: 15.9; skew-y: 17.4; scale-x: 0.796; scale-y: 0.766; }
        frame 14 { x: 44.6; y: 36.5; skew-x: 10.5; skew-y: 11.5; scale-x: 0.797; scale-y: 0.777; }
        frame 15 { x: 43.3; y: 35.1; skew-x: 5.3; skew-y: 5.8; scale-x: 0.799; scale-y: 0.788; }
        frame 16 { x: 42; y: 33.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 17 { x: 38.1; y: 32.5; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 34.3; y: 31.2; }
        frame 19 { x: 30.4; y: 29.9; }
        frame 20 { x: 26.5; y: 28.6; }
        frame 21 { x: 24.5; y: 30; }
        frame 22 { x: 22.4; y: 31.3; }
        frame 23 { x: 20.3; y: 32.7; }
        frame 24 { x: 18.2; y: 34; }
        frame 25 { x: -10000; y: -10000; }
        frame 26 { x: 17.1; }
        frame 27 { x: 16; }
        frame 28 { x: 14.9; }
        frame 29 { x: 13.7; }
        frame 30 { x: 12.8; y: 34.5; skew-x: 1.5; skew-y: 1.5; }
        frame 31 { x: 11.8; y: 34.9; skew-x: 3; skew-y: 3; }
        frame 32 { x: 10.8; y: 35.3; skew-x: 4.6; skew-y: 4.6; }
        frame 33 { x: 9.9; y: 35.6; skew-x: 6.3; skew-y: 6.3; }
        frame 34 { x: 8.9; y: 37.3; skew-x: 3; skew-y: 3; scale-x: 0.799; scale-y: 0.799; }
        frame 35 { x: 7.8; y: 39; skew-x: -0; skew-y: -0; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 6.8; y: 40.8; skew-x: -3.4; skew-y: -3.4; }
        frame 37 { x: 18.1; y: 27.4; skew-x: -3.2; skew-y: -3.2; scale-x: 1.265; scale-y: 0.818; }
        frame 38 { x: 28.1; y: 15.8; skew-x: -10000; skew-y: -10000; scale-x: 1.676; scale-y: 0.835; }
        frame 39 { x: 36.6; y: 5.6; skew-x: -3.1; scale-x: 2.032; scale-y: 0.85; }
        frame 40 { x: 43; y: 23.8; skew-x: -31.7; skew-y: -37; scale-x: 1.615; scale-y: 0.917; }
        frame 41 { x: 51.1; y: 38.9; skew-x: -60.5; skew-y: -70.8; scale-x: 1.203; scale-y: 0.986; }
        frame 42 { x: 51.6; y: 40; skew-x: -58.6; skew-y: -67.8; scale-x: 1.193; scale-y: 0.959; }
        frame 43 { x: 52.2; y: 41.1; skew-x: -56.7; skew-y: -64.5; scale-x: 1.186; scale-y: 0.934; }
        frame 44 { x: 47.5; y: 37.1; skew-x: -54.1; skew-y: -61.8; scale-x: 1.184; scale-y: 0.933; }
        frame 45 { x: 42.9; y: 33.2; skew-x: -51.5; skew-y: -59.3; scale-x: -10000; scale-y: 0.932; }
        frame 46 { x: 38.2; y: 29.3; skew-x: -48.9; skew-y: -56.7; scale-x: 1.185; scale-y: 0.934; }
        frame 47 { x: 30.5; y: 29.9; skew-x: -32.5; skew-y: -37.7; scale-x: 1.055; scale-y: 0.888; }
        frame 48 { x: 24; y: 31.4; skew-x: -16.2; skew-y: -18.7; scale-x: 0.928; scale-y: 0.844; }
        frame 49 { x: 18.2; y: 34; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { skew-x: 2; skew-y: 2; }
        frame 52 { x: 18.1; skew-x: 4; skew-y: 4; }
        frame 53 { x: 18.2; y: 34; skew-x: 6; skew-y: 6; }
        frame 54 { x: -10000; y: 33.5; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { y: 33.1; scale-x: -10000; scale-y: -10000; }
        frame 56 { y: 32.7; scale-x: 0.8; scale-y: 0.8; }
        frame 57 { y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { scale-x: -10000; scale-y: -10000; }
        frame 59 { scale-x: 0.8; scale-y: 0.8; }
        frame 60 { y: 33.1; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { y: 33.5; scale-x: -10000; scale-y: -10000; }
        frame 62 { y: 34; scale-x: 0.8; scale-y: 0.8; }
        frame 63 { y: -10000; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 64 { skew-x: 2; skew-y: 2; }
        frame 65 { y: 34; skew-x: 0; skew-y: 0; }
        frame 66 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 67 { x: 22.5; y: 27.8; skew-x: 10.6; skew-y: 10.6; scale-x: 0.799; scale-y: 0.799; }
        frame 68 { x: 27.1; y: 21.7; skew-x: 21.3; skew-y: 21.3; scale-x: 0.798; scale-y: 0.798; }
        frame 69 { x: 31.8; y: 15.7; skew-x: 32.1; skew-y: 32.1; scale-x: 0.799; scale-y: 0.799; }
        frame 70 { x: 32.5; y: 17.5; skew-x: 35.3; skew-y: 35.3; scale-x: 0.797; scale-y: 0.797; }
        frame 71 { x: 33.2; y: 19.2; skew-x: 38.4; skew-y: 38.4; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 33.9; y: 21; skew-x: 41.6; skew-y: 41.6; scale-x: 0.798; scale-y: 0.798; }
        frame 73 { x: 32.7; y: 22.8; skew-x: 32.1; skew-y: 32.1; scale-x: 0.797; scale-y: 0.797; }
        frame 74 { x: 31.7; y: 24.8; skew-x: 22.5; skew-y: 22.5; scale-x: 0.796; scale-y: 0.796; }
        frame 75 { x: 30.7; y: 27.1; skew-x: 13; skew-y: 13; scale-x: 0.797; scale-y: 0.797; }
        frame 76 { x: 30.1; y: 28.5; skew-x: 5.5; skew-y: 5.5; scale-x: 0.796; scale-y: 0.796; }
        frame 77 { x: 29.7; y: 30.1; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 29.3; y: 31.8; skew-x: -9.2; skew-y: -9.2; }
        frame 79 { x: 29.5; y: 34; skew-x: -14.7; skew-y: -14.7; scale-x: 0.795; scale-y: 0.795; }
        frame 80 { x: 29.8; y: 36.4; skew-x: -20.5; skew-y: -20.5; scale-x: 0.796; scale-y: 0.796; }
        frame 81 { x: 30.4; y: 32.6; skew-x: -25.2; skew-y: -25.2; scale-x: 0.794; scale-y: 0.794; }
        frame 82 { x: 30.9; y: 29; skew-x: -30; skew-y: -30; scale-x: 0.795; scale-y: 0.795; }
        frame 83 { x: 30.4; y: 32.7; skew-x: -25.2; skew-y: -25.2; scale-x: 0.794; scale-y: 0.794; }
        frame 84 { x: 29.8; y: 36.4; skew-x: -20.5; skew-y: -20.5; scale-x: 0.796; scale-y: 0.796; }
        frame 85 { x: -10000; y: 33.1; skew-x: -9.2; skew-y: -9.2; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 30; y: 30; skew-x: 1.8; skew-y: 1.8; }
        frame 87 { x: 30.7; y: 27.1; skew-x: 13; skew-y: 13; scale-x: 0.797; scale-y: 0.797; }
        frame 88 { x: 28.6; y: 28.2; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 26.4; y: 29.4; skew-x: 8.6; skew-y: 8.6; scale-x: 0.798; scale-y: 0.798; }
        frame 90 { x: 24.4; y: 30.5; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 22.3; y: 31.7; skew-x: 4.3; skew-y: 4.3; scale-x: 0.799; scale-y: 0.799; }
        frame 92 { x: 20.3; y: 32.9; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 18.2; y: 34; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Chomper_underjaw";
        frame-count: 94;
        frame 0 { x: 6.4; y: 27.4; skew-x: 341.9; skew-y: 341.9; scale-x: 0.74; scale-y: 0.736; image: IMAGE_REANIM_CHOMPER_UNDERJAW; }
        frame 1 { x: 9.2; y: 28.5; skew-x: 343.9; skew-y: 340.7; scale-x: 0.728; scale-y: 0.7; image: none; }
        frame 2 { x: 10.7; y: 27.7; skew-x: 338.7; skew-y: 336.5; scale-x: 0.734; scale-y: 0.711; }
        frame 3 { x: 12.3; y: 27; skew-x: 333.4; skew-y: 332.4; scale-x: 0.74; scale-y: 0.723; }
        frame 4 { x: 13.9; y: 26.5; skew-x: 328.2; skew-y: 328.2; scale-x: 0.747; scale-y: 0.735; }
        frame 5 { x: 16.3; y: 26.8; skew-x: 330.4; skew-y: 330.4; scale-x: -10000; scale-y: 0.734; }
        frame 6 { x: 18.5; y: 27; skew-x: 332.7; skew-y: 332.7; scale-x: 0.749; scale-y: -10000; }
        frame 7 { x: 20.7; y: 27.3; skew-x: 335; skew-y: 335; scale-x: 0.751; }
        frame 8 { x: 23; y: 27.5; skew-x: 337.3; skew-y: 337.3; scale-x: 0.753; }
        frame 9 { x: 24.1; y: 27.9; skew-x: 340.4; skew-y: 340.4; scale-x: 0.754; scale-y: 0.733; }
        frame 10 { x: 25.1; y: 28.2; skew-x: 343.5; skew-y: 343.5; scale-x: 0.756; scale-y: -10000; }
        frame 11 { x: 26.1; y: 28.6; skew-x: 346.5; skew-y: 346.5; scale-x: 0.757; }
        frame 12 { x: 27.3; y: 29.1; skew-x: 349.6; skew-y: 349.6; scale-x: 0.76; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 14 { x: 25.9; y: 28.5; skew-x: 345.5; skew-y: 345.5; scale-x: 0.757; }
        frame 15 { x: 24.7; y: 27.9; skew-x: 341.4; skew-y: 341.4; scale-x: 0.755; }
        frame 16 { x: 23.5; y: 27.5; skew-x: 337.3; skew-y: 337.3; scale-x: 0.753; scale-y: 0.734; }
        frame 17 { x: 21; y: 27.3; skew-x: 335; skew-y: 335; scale-x: 0.751; scale-y: -10000; }
        frame 18 { x: 18.6; y: 26.9; skew-x: 332.7; skew-y: 332.7; scale-x: 0.749; }
        frame 19 { x: 16.3; y: 26.7; skew-x: 330.4; skew-y: 330.4; scale-x: 0.747; }
        frame 20 { x: 13.9; y: 26.5; skew-x: 328.2; skew-y: 328.2; scale-x: -10000; scale-y: 0.735; }
        frame 21 { x: 12; y: 26.6; skew-x: 331.7; skew-y: 331.7; scale-x: 0.744; scale-y: 0.734; }
        frame 22 { x: 10; y: 26.8; skew-x: 335.2; skew-y: 335.2; scale-x: 0.742; scale-y: 0.735; }
        frame 23 { x: 8.2; y: 27.2; skew-x: 338.5; skew-y: 338.5; scale-x: 0.741; scale-y: -10000; }
        frame 24 { x: 6.4; y: 27.4; skew-x: 341.9; skew-y: 341.9; scale-x: 0.74; scale-y: 0.736; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 4.5; y: 28.7; skew-x: 337.2; skew-y: 337.2; scale-x: 0.739; scale-y: 0.735; }
        frame 27 { x: 2.8; y: 30; skew-x: 332.5; skew-y: 332.5; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 1.2; y: 31.4; skew-x: 327.7; skew-y: 327.7; }
        frame 29 { x: -0.1; y: 32.9; skew-x: 323; skew-y: 323; scale-x: 0.74; scale-y: 0.736; }
        frame 30 { x: -0.7; y: 33; skew-x: 323.9; skew-y: 323.9; scale-x: 0.739; scale-y: 0.735; }
        frame 31 { x: -1.1; y: -10000; skew-x: 324.6; skew-y: 324.6; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -1.8; y: 33.2; skew-x: 325.4; skew-y: 325.4; }
        frame 33 { x: -2.4; y: 33.4; skew-x: 326.1; skew-y: 326.1; scale-x: 0.74; scale-y: 0.736; }
        frame 34 { x: -3.5; y: 35.8; skew-x: 322.9; skew-y: 322.9; scale-x: 0.738; scale-y: 0.735; }
        frame 35 { x: -4.7; y: 38.4; skew-x: 319.4; skew-y: 319.4; scale-x: -10000; scale-y: 0.734; }
        frame 36 { x: -5.7; y: 40.8; skew-x: 316.2; skew-y: 316.2; scale-x: 0.739; scale-y: 0.735; }
        frame 37 { x: 4.6; y: 19.7; skew-x: 338.7; skew-y: 339; scale-x: 0.804; scale-y: 0.807; }
        frame 38 { x: 17.8; y: 1.2; skew-x: 358.7; skew-y: 359; scale-x: 0.863; scale-y: 0.873; }
        frame 39 { x: 32.1; y: -13.2; skew-x: 375.8; skew-y: 376.3; scale-x: 0.913; scale-y: 0.929; }
        frame 40 { x: 23.4; y: 17.7; skew-x: 348.5; skew-y: 343.3; scale-x: 1.026; scale-y: 0.795; }
        frame 41 { x: 26.5; y: 34.4; skew-x: 325.7; skew-y: 319.7; scale-x: 1.167; scale-y: 0.834; }
        frame 42 { x: 28; y: 33.9; skew-x: 327.7; skew-y: 323.2; scale-x: 1.142; scale-y: 0.823; }
        frame 43 { x: 29.7; y: 33.5; skew-x: 329.4; skew-y: 326.7; scale-x: 1.12; scale-y: 0.814; }
        frame 44 { x: 25.4; y: 28.7; skew-x: 332; skew-y: 329.4; scale-x: 1.118; scale-y: 0.812; }
        frame 45 { x: 21.1; y: 23.7; skew-x: 334.7; skew-y: 331.9; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 16.9; y: 18.8; skew-x: 337.2; skew-y: 334.5; scale-x: 1.119; scale-y: 0.813; }
        frame 47 { x: 12.5; y: 24.6; skew-x: 330.7; skew-y: 328.9; scale-x: 1.003; scale-y: 0.786; }
        frame 48 { x: 8.3; y: 29.8; skew-x: 324.2; skew-y: 323.4; scale-x: 0.888; scale-y: 0.761; }
        frame 49 { x: 4; y: 34.3; skew-x: 317.7; skew-y: 317.7; scale-x: 0.774; scale-y: 0.736; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 4; y: 33.8; skew-x: 319.7; skew-y: 319.7; scale-x: 0.772; scale-y: 0.735; }
        frame 52 { y: 33.3; skew-x: 321.7; skew-y: 321.7; scale-x: -10000; scale-y: -10000; }
        frame 53 { y: 32.7; skew-x: 323.7; skew-y: 323.7; scale-x: 0.773; scale-y: 0.736; }
        frame 54 { x: 4.4; y: 32; skew-x: 327.4; skew-y: 327.4; scale-x: 0.755; scale-y: 0.719; }
        frame 55 { x: 4.7; y: 31.3; skew-x: 331.2; skew-y: 331.2; scale-x: 0.738; scale-y: 0.704; }
        frame 56 { x: 5.1; y: 30.8; skew-x: 334.8; skew-y: 334.8; scale-x: 0.723; scale-y: 0.69; }
        frame 57 { x: 5.2; y: 29.8; skew-x: 334.9; skew-y: 334.9; scale-x: 0.715; scale-y: 0.685; }
        frame 58 { x: 5.3; y: 29; skew-x: -10000; skew-y: -10000; scale-x: 0.708; scale-y: 0.68; }
        frame 59 { x: -10000; y: 28.1; skew-x: 334.8; skew-y: 334.8; scale-x: 0.702; scale-y: 0.677; }
        frame 60 { x: 4.9; y: 29.5; skew-x: 332.9; skew-y: 332.9; scale-x: 0.724; scale-y: 0.676; }
        frame 61 { x: 4.5; y: 30.9; skew-x: 331.2; skew-y: 331.2; scale-x: 0.747; scale-y: 0.675; }
        frame 62 { x: 4.1; y: 32.5; skew-x: 329.2; skew-y: 329.2; scale-x: 0.77; scale-y: 0.676; }
        frame 63 { x: 4; y: 32.9; skew-x: 325.4; skew-y: 325.4; scale-x: -10000; scale-y: 0.695; }
        frame 64 { x: 4.1; y: 33.5; skew-x: 321.6; skew-y: 321.6; scale-x: 0.771; scale-y: 0.715; }
        frame 65 { x: 4; y: 34.3; skew-x: 317.7; skew-y: 317.7; scale-x: 0.774; scale-y: 0.736; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 8.4; y: 25.4; skew-x: 328.4; skew-y: 328.4; scale-x: 0.772; scale-y: 0.735; }
        frame 68 { x: 13.7; y: 16.7; skew-x: 339.2; skew-y: 339.2; scale-x: -10000; scale-y: 0.734; }
        frame 69 { x: 19.7; y: 8.5; skew-x: 349.8; skew-y: 349.7; scale-y: 0.735; }
        frame 70 { x: 20.8; y: 9.6; skew-x: 353; skew-y: 353; scale-y: 0.734; }
        frame 71 { x: 21.9; y: 10.7; skew-x: 356.2; skew-y: 356.2; scale-y: -10000; }
        frame 72 { x: 23.1; y: 11.9; skew-x: 359.3; skew-y: 359.3; }
        frame 73 { x: 20.5; y: 15.6; skew-x: 349.7; skew-y: 349.7; scale-x: 0.771; }
        frame 74 { x: 18.4; y: 19.8; skew-x: 340.2; skew-y: 340.2; scale-x: 0.77; scale-y: 0.733; }
        frame 75 { x: 16.9; y: 24.2; skew-x: 330.7; skew-y: 330.7; scale-x: 0.771; scale-y: -10000; }
        frame 76 { x: 16; y: 27.5; skew-x: 323.4; skew-y: 323.4; scale-x: 0.769; scale-y: 0.732; }
        frame 77 { x: 15.6; y: 30.9; skew-x: 315.9; skew-y: 315.9; scale-x: -10000; scale-y: 0.731; }
        frame 78 { x: 15.5; y: 34.3; skew-x: 308.4; skew-y: 308.4; scale-x: 0.77; scale-y: 0.732; }
        frame 79 { x: 16.1; y: 38; skew-x: 302.6; skew-y: 302.6; scale-x: 0.769; scale-y: 0.731; }
        frame 80 { x: 16.7; y: 41.6; skew-x: 297.1; skew-y: 297.1; scale-x: -10000; scale-y: 0.732; }
        frame 81 { x: 17.8; y: 38.9; skew-x: 292.3; skew-y: 292.3; scale-x: 0.768; scale-y: 0.731; }
        frame 82 { x: 19; y: 36.1; skew-x: 287.6; skew-y: 287.6; scale-x: 0.769; scale-y: 0.732; }
        frame 83 { x: 17.7; y: 38.9; skew-x: 292.3; skew-y: 292.3; scale-x: 0.768; scale-y: 0.731; }
        frame 84 { x: 16.7; y: 41.6; skew-x: 297.1; skew-y: 297.1; scale-x: 0.769; scale-y: 0.732; }
        frame 85 { x: 15.9; y: 35.7; skew-x: 308.3; skew-y: 308.3; scale-x: -10000; scale-y: 0.731; }
        frame 86 { x: -10000; y: 29.9; skew-x: 319.6; skew-y: 319.6; scale-y: 0.732; }
        frame 87 { x: 16.9; y: 24.2; skew-x: 330.7; skew-y: 330.7; scale-x: 0.771; scale-y: 0.733; }
        frame 88 { x: 15.1; y: 24.6; skew-x: 332.7; skew-y: 332.7; scale-x: 0.765; scale-y: -10000; }
        frame 89 { x: 13.3; y: 25.2; skew-x: 334.5; skew-y: 334.5; scale-x: 0.759; }
        frame 90 { x: 11.5; y: 25.6; skew-x: 336.4; skew-y: 336.4; scale-x: 0.754; scale-y: 0.734; }
        frame 91 { x: 9.9; y: 26.3; skew-x: 338.2; skew-y: 338.2; scale-x: 0.749; scale-y: -10000; }
        frame 92 { x: 8.1; y: 26.8; skew-x: 340.2; skew-y: 340.2; scale-x: 0.744; scale-y: 0.735; }
        frame 93 { x: 6.4; y: 27.4; skew-x: 341.9; skew-y: 341.9; scale-x: 0.74; scale-y: 0.736; }
    }
    Track {
        source-name: "Chomper_bottomlip";
        frame-count: 94;
        frame 0 { x: 17.6; y: 31.9; skew-x: 339; skew-y: 339.5; scale-x: 0.798; scale-y: 0.798; image: IMAGE_REANIM_CHOMPER_BOTTOMLIP; }
        frame 1 { x: 20.9; y: 29.3; skew-x: 346.5; skew-y: 343.6; scale-x: 0.781; scale-y: 0.761; image: none; }
        frame 2 { x: 22.2; y: 28.4; skew-x: 339.7; skew-y: 337.9; scale-x: 0.786; scale-y: 0.772; }
        frame 3 { x: 23.7; y: 27.6; skew-x: 332.9; skew-y: 332.2; scale-x: 0.791; scale-y: 0.784; }
        frame 4 { x: 25.5; y: 27; skew-x: 325.9; skew-y: 326.4; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { x: 27.7; y: 27.4; skew-x: 328.4; skew-y: 328.9; scale-x: 0.796; scale-y: 0.796; }
        frame 6 { x: 29.9; y: 27.8; skew-x: 330.9; skew-y: 331.2; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 32.1; y: 28.3; skew-x: 333.4; skew-y: 333.7; }
        frame 8 { x: 34.4; y: 28.7; skew-x: 335.8; skew-y: 336.1; scale-x: 0.797; }
        frame 9 { x: 35.5; y: 29.1; skew-x: 340.4; skew-y: 340.7; scale-x: 0.795; scale-y: 0.795; }
        frame 10 { x: 36.6; y: 29.6; skew-x: 344.9; skew-y: 345.2; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 37.9; y: 30; skew-x: 349.5; skew-y: 349.7; }
        frame 12 { x: 39.1; y: 30.8; skew-x: 353.9; skew-y: 354.1; }
        frame 13 { x: 38.9; y: 29.5; skew-x: 354.1; skew-y: 353.8; scale-y: 0.759; }
        frame 14 { x: 37.2; y: 29.1; skew-x: 348.2; skew-y: 348; scale-y: 0.771; }
        frame 15 { x: 35.7; y: 28.8; skew-x: 342; skew-y: 342; scale-y: 0.783; }
        frame 16 { x: 34.4; y: 28.7; skew-x: 335.8; skew-y: 336.1; scale-x: 0.797; scale-y: 0.796; }
        frame 17 { x: 32.1; y: 28.2; skew-x: 333.4; skew-y: 333.7; scale-x: 0.796; scale-y: -10000; }
        frame 18 { x: 29.8; y: 27.8; skew-x: 330.9; skew-y: 331.2; scale-x: -10000; }
        frame 19 { x: 27.6; y: 27.4; skew-x: 328.4; skew-y: 328.9; }
        frame 20 { x: 25.2; y: 27; skew-x: 325.9; skew-y: 326.4; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 23.4; y: 28.2; skew-x: 329.2; skew-y: 329.7; scale-x: 0.797; scale-y: 0.797; }
        frame 22 { x: 21.7; y: 29.4; skew-x: 332.4; skew-y: 333; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 19.9; y: 30.7; skew-x: 335.7; skew-y: 336.2; }
        frame 24 { x: 18.2; y: 31.9; skew-x: 339; skew-y: 339.5; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 15.9; y: 32.2; skew-x: 334.2; skew-y: 334.9; scale-x: 0.797; scale-y: 0.797; }
        frame 27 { x: 13.7; y: 32.6; skew-x: 329.6; skew-y: 330.2; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 11.7; y: 33.1; skew-x: 324.9; skew-y: 325.4; }
        frame 29 { x: 9.8; y: 33.8; skew-x: 320.1; skew-y: 320.6; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: 8.7; y: 34.5; skew-x: 320.6; skew-y: 320.2; scale-x: 0.797; scale-y: 0.797; }
        frame 31 { x: 7.6; y: 35.3; skew-x: 320.9; skew-y: 319.9; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 6.4; y: 35.9; skew-x: 321.4; skew-y: 319.4; scale-y: 0.798; }
        frame 33 { x: 5.2; y: 36.8; skew-x: 321.8; skew-y: 319; scale-x: 0.798; scale-y: 0.799; }
        frame 34 { x: 4; y: 37.6; skew-x: 320.7; skew-y: 317.9; scale-x: 0.797; scale-y: 0.798; }
        frame 35 { x: 2.6; y: 38.4; skew-x: 319.4; skew-y: 316.6; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 1.3; y: 39.2; skew-x: 318.3; skew-y: 315.5; scale-x: 0.798; scale-y: 0.799; }
        frame 37 { x: 13; y: 20.8; skew-x: 347.2; skew-y: 344.7; scale-x: 0.886; scale-y: 0.818; }
        frame 38 { x: 27.8; y: 5.9; skew-x: 372.6; skew-y: 370.5; scale-x: 0.964; scale-y: 0.835; }
        frame 39 { x: 43.4; y: -4.4; skew-x: 394.8; skew-y: 392.9; scale-x: 1.033; scale-y: 0.851; }
        frame 40 { x: 37.3; y: 9; skew-x: 358.7; skew-y: 350; scale-x: 1.016; scale-y: 0.931; }
        frame 41 { x: 38.5; y: 33.4; skew-x: 322.2; skew-y: 306.9; scale-x: 0.999; scale-y: 1.013; }
        frame 42 { x: 40.9; y: 33.1; skew-x: 323.4; skew-y: 309.6; scale-x: 0.954; scale-y: 0.974; }
        frame 43 { x: 43.2; y: 32.9; skew-x: 324.6; skew-y: 312.6; scale-x: 0.913; scale-y: 0.939; }
        frame 44 { x: 38.9; y: 28.7; skew-x: 327.2; skew-y: 315.1; scale-x: 0.912; scale-y: 0.937; }
        frame 45 { x: 34.7; y: 24.3; skew-x: 329.7; skew-y: 317.9; scale-x: 0.911; scale-y: -10000; }
        frame 46 { x: 30.4; y: 20; skew-x: 332.3; skew-y: 320.4; scale-x: 0.913; scale-y: 0.938; }
        frame 47 { x: 24.7; y: 25.6; skew-x: 325.4; skew-y: 315.6; scale-x: 0.861; scale-y: 0.879; }
        frame 48 { x: 19.2; y: 30.7; skew-x: 318.4; skew-y: 310.6; scale-x: 0.812; scale-y: 0.822; }
        frame 49 { x: 13.9; y: 35.4; skew-x: 311.5; skew-y: 305.8; scale-x: 0.763; scale-y: 0.766; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 13.5; y: 34.6; skew-x: 318.1; skew-y: 312.4; scale-x: 0.762; scale-y: 0.764; }
        frame 52 { x: 13.4; y: 33.7; skew-x: 324.9; skew-y: 319.1; scale-x: 0.761; scale-y: -10000; }
        frame 53 { x: 13.6; y: 32.9; skew-x: 331.4; skew-y: 325.7; scale-x: 0.762; scale-y: 0.765; }
        frame 54 { x: 13.1; y: 31.8; skew-x: 334.2; skew-y: 328.4; scale-x: 0.761; scale-y: 0.764; }
        frame 55 { x: 12.7; y: 30.5; skew-x: 337; skew-y: 331.4; scale-x: -10000; scale-y: 0.763; }
        frame 56 { x: 12.2; y: 29.3; skew-x: 339.7; skew-y: 334; scale-x: 0.762; scale-y: 0.764; }
        frame 57 { x: 12.9; y: 29.1; skew-x: -10000; skew-y: 336.9; scale-x: 0.761; scale-y: 0.727; }
        frame 58 { x: 13.6; y: 29; skew-y: 339.7; scale-x: -10000; scale-y: 0.69; }
        frame 59 { x: 14.2; y: 28.9; skew-y: 342.6; scale-x: 0.762; scale-y: 0.655; }
        frame 60 { x: 13.6; y: 29.9; skew-x: 337.9; skew-y: 340.7; scale-x: 0.796; scale-y: 0.654; }
        frame 61 { x: 13.3; y: 31; skew-x: 335.9; skew-y: 338.7; scale-x: 0.832; scale-y: -10000; }
        frame 62 { x: 12.9; y: 32.1; skew-x: 333.9; skew-y: 336.7; scale-x: 0.868; }
        frame 63 { x: 13.1; y: 32.9; skew-x: 326.4; skew-y: 326.4; scale-x: 0.832; scale-y: 0.69; }
        frame 64 { x: 13.4; y: 34; skew-x: 318.9; skew-y: 316.1; scale-x: 0.797; scale-y: 0.727; }
        frame 65 { x: 13.9; y: 35.4; skew-x: 311.5; skew-y: 305.8; scale-x: 0.763; scale-y: 0.766; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 17.7; y: 28.3; skew-x: 322.2; skew-y: 316.4; scale-x: 0.761; scale-y: 0.764; }
        frame 68 { x: 22.2; y: 21.3; skew-x: 332.9; skew-y: 327.2; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 27.6; y: 14.7; skew-x: 343.6; skew-y: 337.9; scale-x: 0.762; }
        frame 70 { x: 28.2; y: 16.2; skew-x: 346.7; skew-y: 341.2; scale-x: 0.761; scale-y: 0.763; }
        frame 71 { x: 28.8; y: 17.8; skew-x: 350; skew-y: 344.2; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 29.4; y: 19.4; skew-x: 353.1; skew-y: 347.4; scale-y: 0.764; }
        frame 73 { x: 27.8; y: 21.8; skew-x: 343.7; skew-y: 337.9; scale-x: 0.76; scale-y: 0.763; }
        frame 74 { x: 26.7; y: 24.6; skew-x: 334.2; skew-y: 328.4; scale-x: -10000; scale-y: 0.762; }
        frame 75 { x: 26.2; y: 27.6; skew-x: 324.5; skew-y: 318.8; scale-y: 0.763; }
        frame 76 { x: 25.6; y: 29.9; skew-x: 317.1; skew-y: 311.4; scale-x: 0.759; scale-y: 0.761; }
        frame 77 { x: 25.3; y: 32.3; skew-x: 309.6; skew-y: 303.9; scale-x: 0.758; scale-y: -10000; }
        frame 78 { x: 25.4; y: 34.7; skew-x: 302.2; skew-y: 296.5; scale-x: 0.759; scale-y: 0.762; }
        frame 79 { x: 26.3; y: 37.4; skew-x: 296.6; skew-y: 290.8; scale-x: 0.758; scale-y: 0.761; }
        frame 80 { x: 27; y: 39.9; skew-x: 290.9; skew-y: 285.2; scale-x: 0.759; scale-y: -10000; }
        frame 81 { x: 28.1; y: 36.4; skew-x: 286.1; skew-y: 280.3; scale-x: 0.758; }
        frame 82 { x: 29.1; y: 32.9; skew-x: 281.4; skew-y: 275.7; scale-x: 0.759; }
        frame 83 { x: 27.8; y: 36.5; skew-x: 286.1; skew-y: 280.3; scale-x: 0.758; }
        frame 84 { x: 26.7; y: 39.9; skew-x: 290.9; skew-y: 285.2; scale-x: 0.759; }
        frame 85 { x: 25.8; y: 36.1; skew-x: 302.1; skew-y: 296.3; scale-x: 0.758; }
        frame 86 { x: 25.6; y: 32; skew-x: 313.4; skew-y: 307.6; scale-x: 0.759; }
        frame 87 { x: 26.2; y: 27.9; skew-x: 324.5; skew-y: 318.8; scale-x: 0.76; scale-y: 0.763; }
        frame 88 { x: 24.7; y: 28.5; skew-x: 326.9; skew-y: 322.4; scale-x: 0.765; scale-y: 0.767; }
        frame 89 { x: 23.1; y: 29.2; skew-x: 329.4; skew-y: 325.7; scale-x: 0.772; scale-y: 0.773; }
        frame 90 { x: 21.6; y: 29.9; skew-x: 331.7; skew-y: 329.2; scale-x: 0.778; scale-y: 0.779; }
        frame 91 { x: 20.2; y: 30.5; skew-x: 334.2; skew-y: 332.7; scale-x: 0.784; scale-y: 0.785; }
        frame 92 { x: 18.9; y: 31.2; skew-x: 336.7; skew-y: 336.2; scale-x: 0.791; scale-y: 0.791; }
        frame 93 { x: 17.6; y: 31.9; skew-x: 339; skew-y: 339.5; scale-x: 0.798; scale-y: 0.798; }
    }
    Track {
        source-name: "Zombie_outerarm_hand";
        frame-count: 94;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 50 { x: 47; y: 61; skew-x: -82.9; skew-y: -82.9; scale-x: 0.798; scale-y: 0.798; cel: 0; image: IMAGE_REANIM_ZOMBIE_OUTERARM_HAND; }
        frame 51 { x: 41.6; y: 61.9; skew-x: -69.4; skew-y: -69.4; scale-x: 0.796; scale-y: 0.796; cel: -10000; image: none; }
        frame 52 { x: 37.1; y: 62.4; skew-x: -55.8; skew-y: -55.8; scale-x: 0.795; scale-y: 0.795; }
        frame 53 { x: 33.3; y: 62.9; skew-x: -42.1; skew-y: -42.1; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 32.1; y: 63.3; skew-x: -40.9; skew-y: -40.9; }
        frame 55 { x: 31.1; y: 63.7; skew-x: -39.7; skew-y: -39.7; scale-x: 0.794; scale-y: 0.794; }
        frame 56 { x: 30; y: 64; skew-x: -38.5; skew-y: -38.5; scale-x: 0.795; scale-y: 0.795; }
        frame 57 { x: 27.4; y: 60.1; skew-x: -25.5; skew-y: -25.5; scale-x: 0.794; scale-y: 0.794; }
        frame 58 { x: 25.5; y: 56.5; skew-x: -12.5; skew-y: -12.5; scale-x: 0.793; scale-y: 0.793; }
        frame 59 { x: 24.1; y: 53.3; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 26.7; y: 50.2; skew-x: 8.8; skew-y: 8.8; scale-x: 0.792; scale-y: 0.792; }
        frame 61 { x: 29.6; y: 47.2; skew-x: 17.5; skew-y: 17.5; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 32.6; y: 44.6; skew-x: 26.3; skew-y: 26.3; }
        frame 63 { x: 32.3; y: 49.1; skew-x: -9.9; skew-y: -9.9; scale-x: 0.793; scale-y: 0.793; }
        frame 64 { x: 36.2; y: 56.8; skew-x: -46.5; skew-y: -46.5; scale-x: 0.794; scale-y: 0.794; }
        frame 65 { x: 47; y: 61; skew-x: -82.9; skew-y: -82.9; scale-x: 0.798; scale-y: 0.798; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 40.6; y: 55.8; skew-x: -59.6; skew-y: -59.6; scale-x: 0.796; scale-y: 0.796; }
        frame 69 { x: 36.6; y: 50.1; skew-x: -36; skew-y: -36; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 35.9; y: 49.1; skew-x: -24.5; skew-y: -24.5; scale-x: 0.794; scale-y: 0.794; }
        frame 71 { x: 35.6; y: 48.6; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 35.8; y: 48.1; skew-x: -1.9; skew-y: -1.9; }
        frame 73 { x: 38.6; y: 46.4; skew-x: -8.2; skew-y: -8.2; scale-x: 0.793; scale-y: 0.793; }
        frame 74 { x: 41.6; y: 44.9; skew-x: -14.4; skew-y: -14.4; scale-x: 0.792; scale-y: 0.792; }
        frame 75 { x: 44.6; y: 43.4; skew-x: -20.7; skew-y: -20.7; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 45.6; y: 41.9; skew-x: -18.7; skew-y: -18.7; scale-x: 0.791; scale-y: 0.791; }
        frame 77 { x: 46.6; y: 40.6; skew-x: -16.9; skew-y: -16.9; scale-x: 0.79; scale-y: 0.79; }
        frame 78 { x: 47.5; y: 39.3; skew-x: -15.2; skew-y: -15.2; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 48.6; y: 37.9; skew-x: -13.2; skew-y: -13.2; }
        frame 80 { x: 49.6; y: 36.6; skew-x: -11.4; skew-y: -11.4; }
        frame 81 { x: 48; y: 32; skew-x: -19.5; skew-y: -19.5; scale-x: 0.788; scale-y: 0.788; }
        frame 82 { x: 46.6; y: 27.7; skew-x: -27.7; skew-y: -27.7; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 41.1; y: 28.5; skew-x: -35.8; skew-y: -35.8; scale-x: 0.787; scale-y: 0.787; }
        frame 84 { x: 35.6; y: 29.1; skew-x: -44; skew-y: -44; scale-x: 0.789; scale-y: 0.789; }
        frame 85 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 86 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_outerarm_lower";
        frame-count: 94;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 50 { x: 29.4; y: 43.5; skew-x: -52.3; skew-y: -52.3; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_ZOMBIE_OUTERARM_LOWER; }
        frame 51 { x: 29.7; y: 42; skew-x: -40.3; skew-y: -40.3; scale-x: 0.797; scale-y: 0.797; cel: -10000; image: none; }
        frame 52 { x: 30.5; y: 40.6; skew-x: -28.2; skew-y: -28.2; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 31.8; y: 39.6; skew-x: -16.2; skew-y: -16.2; }
        frame 54 { x: 31.2; y: 40; skew-x: -14.9; skew-y: -14.9; }
        frame 55 { x: 30.6; y: 40.3; skew-x: -13.7; skew-y: -13.7; }
        frame 56 { x: 29.9; y: 40.7; skew-x: -12.7; skew-y: -12.7; }
        frame 57 { x: 30.8; y: 38.6; skew-x: -5.2; skew-y: -5.2; }
        frame 58 { x: 31.6; y: 36.9; skew-x: 1.8; skew-y: 1.8; }
        frame 59 { x: 32.5; y: 35.1; skew-x: 9.1; skew-y: 9.1; scale-x: 0.796; scale-y: 0.796; }
        frame 60 { x: 33.5; y: 34.4; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 34.3; y: 33.6; skew-x: 5.3; skew-y: 5.3; }
        frame 62 { x: 35.1; y: 32.8; skew-x: 3.7; skew-y: 3.7; }
        frame 63 { x: 32; y: 35.6; skew-x: -14.7; skew-y: -14.7; scale-x: 0.795; scale-y: 0.795; }
        frame 64 { x: 30; y: 39.2; skew-x: -33.5; skew-y: -33.5; scale-x: 0.796; scale-y: 0.796; }
        frame 65 { x: 29.4; y: 43.5; skew-x: -52.3; skew-y: -52.3; scale-x: 0.799; scale-y: 0.799; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 31.5; y: 36.4; skew-x: -36.5; skew-y: -36.5; scale-x: 0.797; scale-y: 0.797; }
        frame 69 { x: 34.6; y: 29.8; skew-x: -20.7; skew-y: -20.7; scale-x: 0.798; scale-y: 0.798; }
        frame 70 { x: 35.8; y: 30.4; skew-x: -15.7; skew-y: -15.7; scale-x: 0.797; scale-y: 0.797; }
        frame 71 { x: 37; y: 31.1; skew-x: -10.7; skew-y: -10.7; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 38.2; y: 31.9; skew-x: -5.9; skew-y: -5.9; }
        frame 73 { x: 37.1; y: 31.8; skew-x: -18.7; skew-y: -18.7; scale-x: 0.796; scale-y: 0.796; }
        frame 74 { x: 36.6; y: 32.2; skew-x: -31.5; skew-y: -31.5; scale-x: 0.795; scale-y: 0.795; }
        frame 75 { x: -10000; y: 32.7; skew-x: -44.5; skew-y: -44.5; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 36.8; y: 33.1; skew-x: -49; skew-y: -49; scale-x: 0.794; scale-y: 0.794; }
        frame 77 { x: -10000; y: 33.5; skew-x: -53.5; skew-y: -53.5; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 37; y: 33.8; skew-x: -57.8; skew-y: -57.8; }
        frame 79 { x: 37.3; y: 34.1; skew-x: -62.3; skew-y: -62.3; scale-x: 0.793; scale-y: 0.793; }
        frame 80 { x: 37.6; y: 34.4; skew-x: -66.8; skew-y: -66.8; scale-x: 0.794; scale-y: 0.794; }
        frame 81 { x: 36.4; y: 32; skew-x: -75.1; skew-y: -75.1; scale-x: 0.793; scale-y: 0.793; }
        frame 82 { x: 35.1; y: 29.3; skew-x: -83.1; skew-y: -83.1; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 31.7; y: 33.5; skew-x: -91.2; skew-y: -91.2; }
        frame 84 { x: 28.5; y: 37.7; skew-x: -99.3; skew-y: -99.3; }
        frame 85 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 86 { cel: -10000; }
    }
    Track {
        source-name: "Chomper_groundleaf2";
        frame-count: 94;
        frame 0 { x: 30.4; y: 68.4; scale-x: 0.64; scale-y: 0.64; image: IMAGE_REANIM_CHOMPER_GROUNDLEAF2; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 3 { x: 30.2; skew-x: -2.2; skew-y: -2.2; }
        frame 4 { x: 30.1; y: 68.5; skew-x: -4.7; skew-y: -4.7; }
        frame 5 { x: 29.9; y: 68.6; skew-x: -7.2; skew-y: -7.2; scale-x: 0.639; scale-y: 0.639; }
        frame 6 { x: 29.8; y: 68.7; skew-x: -9.5; skew-y: -9.5; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 29.7; y: 68.9; skew-x: -11.9; skew-y: -11.9; }
        frame 8 { x: 29.6; y: 69; skew-x: -14.5; skew-y: -14.5; }
        frame 9 { x: -10000; y: 68.9; skew-x: -11.9; skew-y: -11.9; }
        frame 10 { x: 29.8; y: 68.7; skew-x: -9.5; skew-y: -9.5; }
        frame 11 { x: 29.9; y: 68.6; skew-x: -7.2; skew-y: -7.2; }
        frame 12 { x: 30.1; y: 68.5; skew-x: -4.7; skew-y: -4.7; scale-x: 0.64; scale-y: 0.64; }
        frame 13 { x: 30.2; y: 68.4; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 30.4; y: -10000; skew-x: 0; skew-y: 0; }
        frame 15 { x: -10000; y: 68.2; skew-x: 1; skew-y: 1; }
        frame 16 { x: 30.5; y: 68.1; skew-x: 2.3; skew-y: 2.3; }
        frame 17 { x: 30.6; y: 68; skew-x: 3.3; skew-y: 3.3; }
        frame 18 { x: 30.8; y: 67.8; skew-x: 4.5; skew-y: 4.5; }
        frame 19 { x: -10000; y: 67.7; skew-x: 5.5; skew-y: 5.5; }
        frame 20 { x: 30.9; y: 67.5; skew-x: 6.8; skew-y: 6.8; }
        frame 21 { x: 30.8; y: 67.7; skew-x: 5; skew-y: 5; }
        frame 22 { x: 30.6; y: 67.8; skew-x: 3.3; skew-y: 3.3; }
        frame 23 { x: 30.5; y: 68.2; skew-x: 1.5; skew-y: 1.5; }
        frame 24 { x: 30.4; y: 68.4; skew-x: 0; skew-y: 0; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 28 { x: 30.2; skew-x: -2.2; skew-y: -2.2; }
        frame 29 { x: 30.1; y: 68.5; skew-x: -4.7; skew-y: -4.7; }
        frame 30 { x: 29.9; y: 68.6; skew-x: -7.2; skew-y: -7.2; scale-x: 0.639; scale-y: 0.639; }
        frame 31 { x: 29.8; y: 68.7; skew-x: -9.5; skew-y: -9.5; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 29.7; y: 68.9; skew-x: -11.9; skew-y: -11.9; }
        frame 33 { x: 29.6; y: 69; skew-x: -14.5; skew-y: -14.5; }
        frame 34 { x: -10000; y: 68.9; skew-x: -11.9; skew-y: -11.9; }
        frame 35 { x: 29.8; y: 68.7; skew-x: -9.5; skew-y: -9.5; }
        frame 36 { x: 29.9; y: 68.6; skew-x: -7.2; skew-y: -7.2; }
        frame 37 { x: 30.1; y: 68.5; skew-x: -4.7; skew-y: -4.7; scale-x: 0.64; scale-y: 0.64; }
        frame 38 { x: 30.2; y: 68.4; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 30.4; y: -10000; skew-x: 0; skew-y: 0; }
        frame 40 { x: -10000; y: 68.2; skew-x: 1; skew-y: 1; }
        frame 41 { x: 30.5; y: 68.1; skew-x: 2.3; skew-y: 2.3; }
        frame 42 { x: 30.6; y: 68; skew-x: 3.3; skew-y: 3.3; }
        frame 43 { x: 30.8; y: 67.8; skew-x: 4.5; skew-y: 4.5; }
        frame 44 { x: -10000; y: 67.7; skew-x: 5.5; skew-y: 5.5; }
        frame 45 { x: 30.9; y: 67.5; skew-x: 6.8; skew-y: 6.8; }
        frame 46 { x: 30.8; y: 67.7; skew-x: 5; skew-y: 5; }
        frame 47 { x: 30.6; y: 67.8; skew-x: 3.3; skew-y: 3.3; }
        frame 48 { x: 30.5; y: 68.2; skew-x: 1.5; skew-y: 1.5; }
        frame 49 { x: 30.4; y: 68.4; skew-x: 0; skew-y: 0; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 51 { x: 30.1; y: 68.5; skew-x: -4.7; skew-y: -4.7; }
        frame 52 { x: 29.8; y: 68.7; skew-x: -9.5; skew-y: -9.5; scale-x: 0.639; scale-y: 0.639; }
        frame 53 { x: 29.6; y: 69; skew-x: -14.5; skew-y: -14.5; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 29.8; y: 68.8; skew-x: -10.7; skew-y: -10.7; }
        frame 55 { x: 29.9; y: 68.6; skew-x: -7.2; skew-y: -7.2; }
        frame 56 { x: 30.1; y: 68.4; skew-x: -3.4; skew-y: -3.4; scale-x: 0.64; scale-y: 0.64; }
        frame 57 { x: 30.4; y: -10000; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 30.5; y: 68.2; skew-x: 1.5; skew-y: 1.5; }
        frame 59 { x: 30.6; y: 68; skew-x: 3.3; skew-y: 3.3; }
        frame 60 { x: 30.7; y: 67.7; skew-x: 5; skew-y: 5; }
        frame 61 { x: 30.9; y: 67.5; skew-x: 6.8; skew-y: 6.8; }
        frame 62 { x: 30.8; y: 67.7; skew-x: 5; skew-y: 5; }
        frame 63 { x: 30.6; y: 67.8; skew-x: 3.3; skew-y: 3.3; }
        frame 64 { x: 30.5; y: 68.2; skew-x: 1.5; skew-y: 1.5; }
        frame 65 { x: 30.4; y: 68.4; skew-x: 0; skew-y: 0; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 70 { x: 30.2; skew-x: -2.2; skew-y: -2.2; }
        frame 71 { x: 30.1; y: 68.5; skew-x: -4.7; skew-y: -4.7; }
        frame 72 { x: 29.9; y: 68.6; skew-x: -7.2; skew-y: -7.2; scale-x: 0.639; scale-y: 0.639; }
        frame 73 { x: 29.8; y: 68.7; skew-x: -9.5; skew-y: -9.5; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: 29.7; y: 68.9; skew-x: -11.9; skew-y: -11.9; }
        frame 75 { x: 29.6; y: 69; skew-x: -14.5; skew-y: -14.5; }
        frame 76 { x: 29.7; y: 68.8; skew-x: -12.2; skew-y: -12.2; }
        frame 77 { x: -10000; y: -10000; skew-x: -10.2; skew-y: -10.2; }
        frame 78 { x: 29.9; y: 68.7; skew-x: -8.2; skew-y: -8.2; }
        frame 79 { x: 30; y: 68.5; skew-x: -6; skew-y: -6; scale-x: 0.64; scale-y: 0.64; }
        frame 80 { x: 30.1; y: 68.4; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 30.2; y: -10000; skew-x: -1.9; skew-y: -1.9; }
        frame 82 { x: 30.4; skew-x: 0; skew-y: 0; }
        frame 83 { x: -10000; y: 68.2; skew-x: 1; skew-y: 1; }
        frame 84 { x: 30.5; y: 68.1; skew-x: 2.3; skew-y: 2.3; }
        frame 85 { x: 30.6; y: 68; skew-x: 3.3; skew-y: 3.3; }
        frame 86 { x: 30.8; y: 67.8; skew-x: 4.5; skew-y: 4.5; }
        frame 87 { x: -10000; y: 67.7; skew-x: 5.5; skew-y: 5.5; }
        frame 88 { x: 30.9; y: 67.5; skew-x: 6.8; skew-y: 6.8; }
        frame 89 { x: 30.8; y: 67.6; skew-x: 5.3; skew-y: 5.3; }
        frame 90 { x: 30.7; y: 67.8; skew-x: 4; skew-y: 4; }
        frame 91 { x: 30.5; y: 68; skew-x: 2.6; skew-y: 2.6; }
        frame 92 { x: 30.4; y: 68.1; skew-x: 1.3; skew-y: 1.3; }
        frame 93 { x: -10000; y: 68.4; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Chomper_groundleaf2tip";
        frame-count: 94;
        frame 0 { x: 53.8; y: 73.4; skew-x: 22.3; skew-y: 22.3; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_CHOMPER_GROUNDLEAF2TIP; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; image: none; }
        frame 2 { scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: 54; y: 72.5; skew-x: 25.1; skew-y: 23.5; scale-x: 0.8; scale-y: 0.842; }
        frame 4 { x: 54.3; y: 71.6; skew-x: 28.1; skew-y: 24.8; scale-x: 0.803; scale-y: 0.887; }
        frame 5 { x: 54.6; y: 70.7; skew-x: 31.1; skew-y: 26; scale-x: 0.805; scale-y: 0.931; }
        frame 6 { x: 54.9; y: 69.8; skew-x: 34.1; skew-y: 27.1; scale-x: 0.807; scale-y: 0.975; }
        frame 7 { x: 55.3; y: 68.9; skew-x: 37.1; skew-y: 28.4; scale-x: 0.809; scale-y: 1.02; }
        frame 8 { x: 55.6; y: 67.8; skew-x: 39.9; skew-y: 29.7; scale-x: 0.813; scale-y: 1.065; }
        frame 9 { x: 54.9; y: 68.5; skew-x: 33.3; skew-y: 24.8; scale-x: 0.81; scale-y: 1.02; }
        frame 10 { x: 54.1; y: 69.2; skew-x: 26.6; skew-y: 19.8; scale-x: 0.808; scale-y: 0.976; }
        frame 11 { x: 53.5; y: 70; skew-x: 19.8; skew-y: 14.8; scale-x: 0.806; scale-y: 0.932; }
        frame 12 { x: 53; y: 70.8; skew-x: 13.3; skew-y: 9.8; scale-x: 0.804; scale-y: 0.888; }
        frame 13 { x: 52.5; y: 71.7; skew-x: 6.5; skew-y: 4.8; scale-x: 0.802; scale-y: 0.844; }
        frame 14 { x: 52.2; y: 72.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 52.3; y: 73.2; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 52.4; y: 73.5; skew-x: 3.8; skew-y: 3.8; }
        frame 17 { x: 52.5; y: 73.8; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { x: -10000; y: 74.1; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 52.6; y: 74.5; skew-x: 9.5; skew-y: 9.5; }
        frame 20 { x: 52.8; y: 74.8; skew-x: 11.5; skew-y: 11.5; }
        frame 21 { x: 53; y: 74.4; skew-x: 14.1; skew-y: 14.1; }
        frame 22 { x: 53.1; y: 74; skew-x: 16.8; skew-y: 16.8; }
        frame 23 { x: 53.5; y: 73.7; skew-x: 19.5; skew-y: 19.5; scale-x: 0.798; scale-y: 0.798; }
        frame 24 { x: 53.8; y: 73.4; skew-x: 22.3; skew-y: 22.3; scale-x: 0.799; scale-y: 0.799; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { scale-x: 0.798; scale-y: 0.798; }
        frame 27 { scale-x: 0.799; scale-y: 0.799; }
        frame 28 { x: 54; y: 72.5; skew-x: 25.1; skew-y: 23.5; scale-x: 0.8; scale-y: 0.842; }
        frame 29 { x: 54.3; y: 71.6; skew-x: 28.1; skew-y: 24.8; scale-x: 0.803; scale-y: 0.887; }
        frame 30 { x: 54.6; y: 70.7; skew-x: 31.1; skew-y: 26; scale-x: 0.805; scale-y: 0.931; }
        frame 31 { x: 54.9; y: 69.8; skew-x: 34.1; skew-y: 27.1; scale-x: 0.807; scale-y: 0.975; }
        frame 32 { x: 55.3; y: 68.9; skew-x: 37.1; skew-y: 28.4; scale-x: 0.809; scale-y: 1.02; }
        frame 33 { x: 55.6; y: 67.8; skew-x: 39.9; skew-y: 29.7; scale-x: 0.813; scale-y: 1.065; }
        frame 34 { x: 54.9; y: 68.5; skew-x: 33.3; skew-y: 24.8; scale-x: 0.81; scale-y: 1.02; }
        frame 35 { x: 54.1; y: 69.2; skew-x: 26.6; skew-y: 19.8; scale-x: 0.808; scale-y: 0.976; }
        frame 36 { x: 53.5; y: 70; skew-x: 19.8; skew-y: 14.8; scale-x: 0.806; scale-y: 0.932; }
        frame 37 { x: 53; y: 70.8; skew-x: 13.3; skew-y: 9.8; scale-x: 0.804; scale-y: 0.888; }
        frame 38 { x: 52.5; y: 71.7; skew-x: 6.5; skew-y: 4.8; scale-x: 0.802; scale-y: 0.844; }
        frame 39 { x: 52.2; y: 72.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 40 { x: 52.3; y: 73.2; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 52.4; y: 73.5; skew-x: 3.8; skew-y: 3.8; }
        frame 42 { x: 52.5; y: 73.8; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 43 { x: -10000; y: 74.1; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 52.6; y: 74.5; skew-x: 9.5; skew-y: 9.5; }
        frame 45 { x: 52.8; y: 74.8; skew-x: 11.5; skew-y: 11.5; }
        frame 46 { x: 53; y: 74.4; skew-x: 14.1; skew-y: 14.1; }
        frame 47 { x: 53.1; y: 74; skew-x: 16.8; skew-y: 16.8; }
        frame 48 { x: 53.5; y: 73.7; skew-x: 19.5; skew-y: 19.5; scale-x: 0.798; scale-y: 0.798; }
        frame 49 { x: 53.8; y: 73.4; skew-x: 22.3; skew-y: 22.3; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 54.1; y: 71.6; skew-x: 28.1; skew-y: 24.8; scale-x: 0.803; scale-y: 0.887; }
        frame 52 { x: 54.6; y: 69.8; skew-x: 34.1; skew-y: 27.1; scale-x: 0.807; scale-y: 0.975; }
        frame 53 { x: 55.1; y: 67.8; skew-x: 39.9; skew-y: 29.7; scale-x: 0.813; scale-y: 1.065; }
        frame 54 { x: 54.1; y: 68.9; skew-x: 29.8; skew-y: 22.3; scale-x: 0.809; scale-y: 0.998; }
        frame 55 { x: 53.1; y: 70; skew-x: 19.8; skew-y: 14.8; scale-x: 0.806; scale-y: 0.932; }
        frame 56 { x: 52.5; y: 71.3; skew-x: 9.8; skew-y: 7.3; scale-x: 0.803; scale-y: 0.866; }
        frame 57 { x: 52.2; y: 72.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: 52.3; y: 73.3; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 52.5; y: 73.8; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: 52.6; y: 74.3; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 52.8; y: 74.8; skew-x: 11.5; skew-y: 11.5; }
        frame 62 { x: 53; y: 74.4; skew-x: 14.1; skew-y: 14.1; }
        frame 63 { x: 53.1; y: 74; skew-x: 16.8; skew-y: 16.8; }
        frame 64 { x: 53.5; y: 73.7; skew-x: 19.5; skew-y: 19.5; scale-x: 0.798; scale-y: 0.798; }
        frame 65 { x: 53.8; y: 73.4; skew-x: 22.3; skew-y: 22.3; scale-x: 0.799; scale-y: 0.799; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { scale-x: 0.798; scale-y: 0.798; }
        frame 68 { scale-x: -10000; scale-y: -10000; }
        frame 69 { scale-x: 0.799; scale-y: 0.799; }
        frame 70 { x: 54; y: 72.5; skew-x: 25.1; skew-y: 23.5; scale-x: 0.8; scale-y: 0.842; }
        frame 71 { x: 54.3; y: 71.6; skew-x: 28.1; skew-y: 24.8; scale-x: 0.803; scale-y: 0.887; }
        frame 72 { x: 54.6; y: 70.7; skew-x: 31.1; skew-y: 26; scale-x: 0.805; scale-y: 0.931; }
        frame 73 { x: 54.9; y: 69.8; skew-x: 34.1; skew-y: 27.1; scale-x: 0.807; scale-y: 0.975; }
        frame 74 { x: 55.3; y: 68.9; skew-x: 37.1; skew-y: 28.4; scale-x: 0.809; scale-y: 1.02; }
        frame 75 { x: 55.6; y: 67.8; skew-x: 39.9; skew-y: 29.7; scale-x: 0.813; scale-y: 1.065; }
        frame 76 { x: 55; y: 68.4; skew-x: 34.1; skew-y: 25.3; scale-x: 0.81; scale-y: 1.026; }
        frame 77 { x: 54.3; y: 68.9; skew-x: 28.6; skew-y: 21.1; scale-x: 0.808; scale-y: 0.988; }
        frame 78 { x: 53.8; y: 69.6; skew-x: 22.8; skew-y: 16.8; scale-x: 0.806; scale-y: 0.951; }
        frame 79 { x: 53.3; y: 70.3; skew-x: 17; skew-y: 12.6; scale-x: 0.805; scale-y: 0.913; }
        frame 80 { x: 52.9; y: 71.1; skew-x: 11.3; skew-y: 8.3; scale-x: 0.803; scale-y: 0.875; }
        frame 81 { x: 52.5; y: 71.8; skew-x: 5.6; skew-y: 4.1; scale-x: 0.802; scale-y: 0.838; }
        frame 82 { x: 52.2; y: 72.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 83 { x: 52.3; y: 73.2; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 52.4; y: 73.5; skew-x: 3.8; skew-y: 3.8; }
        frame 85 { x: 52.5; y: 73.8; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 86 { x: -10000; y: 74.1; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 52.6; y: 74.5; skew-x: 9.5; skew-y: 9.5; }
        frame 88 { x: 52.8; y: 74.8; skew-x: 11.5; skew-y: 11.5; }
        frame 89 { x: 52.9; y: 74.5; skew-x: 13.6; skew-y: 13.6; }
        frame 90 { x: 53.1; y: 74.1; skew-x: 15.8; skew-y: 15.8; }
        frame 91 { x: 53.3; y: 73.9; skew-x: 17.8; skew-y: 17.8; scale-x: 0.798; scale-y: 0.798; }
        frame 92 { x: 53.6; y: 73.7; skew-x: 20.1; skew-y: 20.1; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 53.8; y: 73.4; skew-x: 22.3; skew-y: 22.3; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "Chomper_tongue_lick";
        frame-count: 94;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 86 { x: 51.5; y: 26.9; skew-x: 118.3; skew-y: 118.3; scale-x: 0.797; scale-y: 0.797; cel: 0; image: IMAGE_REANIM_CHOMPER_TONGUE; }
        frame 87 { x: 55.5; y: 29.2; skew-x: 115.8; skew-y: 115.8; scale-x: 0.903; scale-y: 0.794; cel: -10000; image: none; }
        frame 88 { x: 59.5; y: 31.4; skew-x: 113.7; skew-y: 113.7; scale-x: 1.011; scale-y: -10000; }
        frame 89 { x: 54; y: 25.1; skew-x: 74.2; skew-y: 74.2; scale-x: 1.083; scale-y: 0.793; }
        frame 90 { x: 46.4; y: 24.2; skew-x: 34.5; skew-y: 34.5; scale-x: 1.158; scale-y: 0.794; }
        frame 91 { x: 37.5; y: 24.7; skew-x: 28.1; skew-y: 28.1; scale-x: 1.055; scale-y: 0.792; }
        frame 92 { x: 28.7; y: 25.1; skew-x: 22; skew-y: 22; scale-x: 0.955; scale-y: 0.793; }
        frame 93 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
    }
    Track {
        source-name: "Chomper_spike4";
        frame-count: 94;
        frame 0 { x: 32.3; y: -6.4; skew-x: 340.5; skew-y: 340.5; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_CHOMPER_SPIKE; }
        frame 1 { x: 35.9; y: -2.8; skew-x: 326.5; skew-y: 326.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 36.6; y: -5.7; skew-x: 328.7; skew-y: 328.7; scale-x: 0.798; scale-y: 0.798; }
        frame 3 { x: 37.3; y: -8.5; skew-x: 331; skew-y: 331; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 38; y: -11.1; skew-x: 333.2; skew-y: 333.2; scale-x: 0.8; scale-y: 0.8; }
        frame 5 { x: 41.5; y: -9.7; skew-x: 332.9; skew-y: 332.9; scale-x: 0.798; scale-y: 0.798; }
        frame 6 { x: 44.9; y: -8.4; skew-x: 332.7; skew-y: 332.7; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 48.3; y: -6.9; skew-x: 332.2; skew-y: 332.2; }
        frame 8 { x: 51.6; y: -5.5; skew-x: 331.8; skew-y: 331.8; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 55; y: -4.2; skew-x: 340.2; skew-y: 340.2; scale-x: 0.798; scale-y: 0.798; }
        frame 10 { x: 58.4; y: -2.8; skew-x: 348.7; skew-y: 348.7; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 62; y: -1.2; skew-x: 357; skew-y: 357; scale-x: 0.799; scale-y: 0.799; }
        frame 12 { x: 65.5; y: 0.3; skew-x: 365.2; skew-y: 365.2; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 67.8; y: 0.7; skew-x: 378.3; skew-y: 378.3; scale-x: 0.798; scale-y: 0.798; }
        frame 14 { x: 62.2; y: -1.4; skew-x: 362.8; skew-y: 362.8; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 56.8; y: -3.1; skew-x: 347.4; skew-y: 347.4; }
        frame 16 { x: 51.9; y: -4.3; skew-x: 331.8; skew-y: 331.8; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: 48.4; y: -5.9; skew-x: 332.2; skew-y: 332.2; scale-x: 0.798; scale-y: 0.798; }
        frame 18 { x: 44.9; y: -7.7; skew-x: 332.7; skew-y: 332.7; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 41.4; y: -9.3; skew-x: 332.9; skew-y: 332.9; }
        frame 20 { x: 37.9; y: -10.8; skew-x: 333.2; skew-y: 333.2; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: 36.5; y: -9.7; skew-x: 335.2; skew-y: 335.2; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 35.1; y: -8.5; skew-x: 336.9; skew-y: 336.9; scale-x: 0.798; scale-y: 0.798; }
        frame 23 { x: 33.7; y: -7.5; skew-x: 338.7; skew-y: 338.7; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 32.3; y: -6.4; skew-x: 340.5; skew-y: 340.5; scale-x: 0.799; scale-y: 0.799; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 33.6; y: -4.1; skew-x: 345.4; skew-y: 345.4; }
        frame 27 { x: 34.9; y: -1.9; skew-x: 350.2; skew-y: 350.2; }
        frame 28 { x: 36.3; y: 0.2; skew-x: 355.2; skew-y: 355.2; scale-x: 0.8; scale-y: 0.8; }
        frame 29 { x: 37.8; y: 2.6; skew-x: 360; skew-y: 360; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 38.1; y: 3.6; skew-x: 365.3; skew-y: 365.3; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 38.6; y: 4.5; skew-x: 370.6; skew-y: 370.6; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 39.2; y: 5.6; skew-x: 376; skew-y: 376; }
        frame 33 { x: 39.7; y: 6.7; skew-x: 381.4; skew-y: 381.4; }
        frame 34 { x: 36.8; y: 6.9; skew-x: 378; skew-y: 378; scale-x: 0.798; scale-y: 0.798; }
        frame 35 { x: 34; y: 7; skew-x: 374.8; skew-y: 374.8; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 31.2; y: 7.2; skew-x: 371.5; skew-y: 371.5; scale-x: 0.799; scale-y: 0.799; }
        frame 37 { x: 28.6; y: -2.7; skew-x: 331.2; skew-y: 331.2; scale-x: 0.815; scale-y: 0.821; }
        frame 38 { x: 29.1; y: -10; skew-x: 295.5; skew-y: 295.6; scale-x: 0.831; scale-y: 0.842; }
        frame 39 { x: 32.1; y: -16.3; skew-x: 264.6; skew-y: 264.8; scale-x: 0.846; scale-y: 0.861; }
        frame 40 { x: 54.8; y: -6.7; skew-x: 314.4; skew-y: 314.6; scale-x: 0.818; scale-y: 0.825; }
        frame 41 { x: 83.1; y: 4.1; skew-x: 364.3; skew-y: 364.3; scale-x: 0.792; scale-y: 0.792; }
        frame 42 { x: 87.9; y: 6.2; skew-x: 373.6; skew-y: 373.6; scale-x: 0.791; scale-y: 0.791; }
        frame 43 { x: 92.9; y: 8.4; skew-x: 383.1; skew-y: 383.1; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 89.6; y: 6.4; skew-x: 385.6; skew-y: 385.6; scale-x: 0.79; scale-y: 0.79; }
        frame 45 { x: 86.3; y: 4.5; skew-x: 388.3; skew-y: 388.3; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 83; y: 2.5; skew-x: 390.9; skew-y: 390.9; scale-x: 0.791; scale-y: 0.791; }
        frame 47 { x: 69.2; y: 2.3; skew-x: 380.5; skew-y: 380.5; scale-x: 0.793; scale-y: 0.793; }
        frame 48 { x: 55.6; y: -10000; skew-x: 370.3; skew-y: 370.3; scale-x: 0.796; scale-y: 0.796; }
        frame 49 { x: 42.3; y: 2.6; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 43.3; y: 3.4; skew-x: 362.3; skew-y: 362.3; }
        frame 52 { x: 44.3; y: 4.2; skew-x: 364.5; skew-y: 364.5; }
        frame 53 { x: 45.4; y: 5.1; skew-x: 366.8; skew-y: 366.8; }
        frame 54 { x: 45.3; y: 5.8; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 55 { x: -10000; y: 6.6; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 45.4; y: 7.3; scale-x: 0.8; scale-y: 0.8; }
        frame 57 { x: 45.3; y: 6.9; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: -10000; y: 6.4; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 45.4; y: 5.9; scale-x: 0.8; scale-y: 0.8; }
        frame 60 { x: 45.1; y: 6.1; skew-x: 366; skew-y: 366; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: 44.8; y: 6.2; skew-x: 365.3; skew-y: 365.3; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 44.5; y: 6.3; skew-x: 364.5; skew-y: 364.5; scale-x: 0.8; scale-y: 0.8; }
        frame 63 { x: 43.7; y: 5.1; skew-x: 362.8; skew-y: 362.8; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 42.9; y: 3.9; skew-x: 361.3; skew-y: 361.3; }
        frame 65 { x: 42.3; y: 2.6; skew-x: 360; skew-y: 360; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 67 { x: 51; y: 2.1; skew-x: 370.6; skew-y: 370.6; scale-x: 0.799; scale-y: 0.799; }
        frame 68 { x: 59.9; y: 1.9; skew-x: 381.3; skew-y: 381.3; scale-x: 0.798; scale-y: 0.798; }
        frame 69 { x: 68.8; y: 2; skew-x: 392.1; skew-y: 392.1; scale-x: 0.799; scale-y: 0.799; }
        frame 70 { x: 70.1; y: 5.8; skew-x: 395.3; skew-y: 395.3; scale-x: 0.797; scale-y: 0.797; }
        frame 71 { x: 71.3; y: 9.7; skew-x: 398.4; skew-y: 398.4; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 72.6; y: 13.5; skew-x: 401.6; skew-y: 401.6; scale-x: 0.798; scale-y: 0.798; }
        frame 73 { x: 68.8; y: 9.5; skew-x: 392.1; skew-y: 392.1; scale-x: 0.797; scale-y: 0.797; }
        frame 74 { x: 64.9; y: 5.7; skew-x: 382.5; skew-y: 382.5; scale-x: 0.796; scale-y: 0.796; }
        frame 75 { x: 61.1; y: 2; skew-x: 373; skew-y: 373; scale-x: 0.797; scale-y: 0.797; }
        frame 76 { x: 56.6; y: 0.2; skew-x: 365.5; skew-y: 365.5; scale-x: 0.796; scale-y: 0.796; }
        frame 77 { x: 52.3; y: -1.2; skew-x: 358.2; skew-y: 358.2; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 48; y: -2.7; skew-x: 350.7; skew-y: 350.7; }
        frame 79 { x: 44.5; y: -1.9; skew-x: 345.2; skew-y: 345.2; scale-x: 0.795; scale-y: 0.795; }
        frame 80 { x: 41.3; y: -1.1; skew-x: 339.4; skew-y: 339.4; scale-x: 0.796; scale-y: 0.796; }
        frame 81 { x: 36.7; y: -2.4; skew-x: 320.6; skew-y: 320.6; scale-x: 0.794; scale-y: 0.794; }
        frame 82 { x: 32.9; y: -3.6; skew-x: 301.9; skew-y: 301.9; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 36.6; y: -2.4; skew-x: 320.6; skew-y: 320.6; }
        frame 84 { x: 41.3; y: -1.1; skew-x: 339.4; skew-y: 339.4; scale-x: 0.796; scale-y: 0.796; }
        frame 85 { x: 48.1; y: -0.7; skew-x: 355.2; skew-y: 355.2; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 55.5; y: 0.1; skew-x: 370.8; skew-y: 370.8; }
        frame 87 { x: 63; y: 1.5; skew-x: 386.6; skew-y: 386.6; }
        frame 88 { x: 57.7; y: 0; skew-x: 378.8; skew-y: 378.8; }
        frame 89 { x: 52.5; y: -1.4; skew-x: 371.1; skew-y: 371.1; scale-x: 0.797; scale-y: 0.797; }
        frame 90 { x: 47.3; y: -2.8; skew-x: 363.5; skew-y: 363.5; scale-x: 0.798; scale-y: 0.798; }
        frame 91 { x: 42.1; y: -4.1; skew-x: 356; skew-y: 356; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 37.2; y: -5.2; skew-x: 348.2; skew-y: 348.2; }
        frame 93 { x: 32.3; y: -6.4; skew-x: 340.5; skew-y: 340.5; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "Chomper_spike3";
        frame-count: 94;
        frame 0 { x: 20; y: -0.2; skew-x: 319.4; skew-y: 319.4; scale-x: 0.798; scale-y: 0.798; image: IMAGE_REANIM_CHOMPER_SPIKE; }
        frame 1 { x: 24.1; y: 5.4; skew-x: 297.5; skew-y: 297.5; scale-x: 0.797; scale-y: 0.797; image: none; }
        frame 2 { x: 24.9; y: 2.4; skew-x: 302.3; skew-y: 302.3; scale-x: 0.796; scale-y: 0.796; }
        frame 3 { x: 25.7; y: -0.5; skew-x: 307.3; skew-y: 307.3; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 26.6; y: -3.4; skew-x: 312.2; skew-y: 312.2; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { x: 29.9; y: -2.5; skew-x: 311.6; skew-y: 311.6; scale-x: 0.796; scale-y: 0.796; }
        frame 6 { x: 33.1; y: -1.7; skew-x: 311.1; skew-y: 311.1; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 36.3; y: -0.9; skew-x: 310.8; skew-y: 310.8; scale-x: 0.795; scale-y: 0.795; }
        frame 8 { x: 39.5; y: -0; skew-x: 310.3; skew-y: 310.3; scale-x: 0.796; scale-y: 0.796; }
        frame 9 { x: 42.4; y: 0; skew-x: 320.6; skew-y: 320.6; scale-x: 0.795; scale-y: 0.795; }
        frame 10 { x: 45.5; y: 0.3; skew-x: 330.9; skew-y: 330.9; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 48.8; y: 0.7; skew-x: 341.2; skew-y: 341.2; }
        frame 12 { x: 52.4; y: 1.3; skew-x: 351.3; skew-y: 351.3; scale-x: 0.796; scale-y: 0.796; }
        frame 13 { x: 55; y: 2.5; skew-x: 364.1; skew-y: 364.1; scale-x: 0.795; scale-y: 0.795; }
        frame 14 { x: 49.3; y: 1.6; skew-x: 346.2; skew-y: 346.2; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 44.3; y: 1.1; skew-x: 328.2; skew-y: 328.2; }
        frame 16 { x: 39.8; y: 1; skew-x: 310.3; skew-y: 310.3; scale-x: 0.796; scale-y: 0.796; }
        frame 17 { x: 36.5; y: 0; skew-x: 310.8; skew-y: 310.8; scale-x: 0.795; scale-y: 0.795; }
        frame 18 { x: 33.1; y: -0.9; skew-x: 311.1; skew-y: 311.1; scale-x: 0.796; scale-y: 0.796; }
        frame 19 { x: 29.8; y: -2; skew-x: 311.6; skew-y: 311.6; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 26.5; y: -3.1; skew-x: 312.2; skew-y: 312.2; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 24.8; y: -2.3; skew-x: 313.9; skew-y: 313.9; scale-x: 0.797; scale-y: 0.797; }
        frame 22 { x: 23.2; y: -1.7; skew-x: 315.9; skew-y: 315.9; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 21.5; y: -1; skew-x: 317.6; skew-y: 317.6; }
        frame 24 { x: 20; y: -0.2; skew-x: 319.4; skew-y: 319.4; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 19.3; y: 0.6; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: 20.8; y: 1.8; skew-x: 325.9; skew-y: 325.9; scale-x: 0.798; scale-y: 0.798; }
        frame 28 { x: 22.4; y: 3; skew-x: 332.4; skew-y: 332.4; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 24.1; y: 4.3; skew-x: 338.9; skew-y: 338.9; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: 24.5; y: 5; skew-x: 343.5; skew-y: 343.5; scale-x: 0.798; scale-y: 0.798; }
        frame 31 { x: 24.8; y: 5.6; skew-x: 347.9; skew-y: 347.9; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 25.2; y: 6.3; skew-x: 352.4; skew-y: 352.4; }
        frame 33 { x: 25.5; y: 6.9; skew-x: 356.8; skew-y: 356.8; }
        frame 34 { x: 22.7; y: 7.9; skew-x: 353.5; skew-y: 353.5; }
        frame 35 { x: 20; y: 8.8; skew-x: 350.2; skew-y: 350.2; }
        frame 36 { x: 17.3; y: 9.9; skew-x: 346.9; skew-y: 346.9; }
        frame 37 { x: 19.3; y: 3.9; skew-x: 306.8; skew-y: 307.1; scale-x: 0.816; scale-y: 0.819; }
        frame 38 { x: 24.3; y: -0.7; skew-x: 271.3; skew-y: 271.8; scale-x: 0.834; scale-y: 0.84; }
        frame 39 { x: 30.9; y: -6.2; skew-x: 240.7; skew-y: 241.5; scale-x: 0.849; scale-y: 0.857; }
        frame 40 { x: 46.4; y: -0.1; skew-x: 291.3; skew-y: 291.8; scale-x: 0.819; scale-y: 0.823; }
        frame 41 { x: 67.7; y: 4.9; skew-x: 342.2; skew-y: 342.2; scale-x: 0.792; scale-y: 0.792; }
        frame 42 { x: 72.8; y: 5.4; skew-x: 356; skew-y: 356; scale-x: 0.791; scale-y: 0.791; }
        frame 43 { x: 78.1; y: 6.1; skew-x: 369.8; skew-y: 369.8; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 75; y: 3.5; skew-x: 372.3; skew-y: 372.3; scale-x: 0.79; scale-y: 0.79; }
        frame 45 { x: 71.7; y: 0.8; skew-x: 374.8; skew-y: 374.8; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 68.6; y: -1.7; skew-x: 377.6; skew-y: 377.6; }
        frame 47 { x: 55.1; y: -0; skew-x: 364.5; skew-y: 364.5; scale-x: 0.793; scale-y: 0.793; }
        frame 48 { x: 41.6; y: 2; skew-x: 351.9; skew-y: 351.9; scale-x: 0.796; scale-y: 0.796; }
        frame 49 { x: 28.6; y: 4.3; skew-x: 338.9; skew-y: 338.9; scale-x: 0.799; scale-y: 0.799; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 29.6; y: 4.7; skew-x: 341.2; skew-y: 341.2; scale-x: 0.798; scale-y: 0.798; }
        frame 52 { x: 30.6; y: 5; skew-x: 343.5; skew-y: 343.5; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 31.6; y: 5.1; skew-x: 345.7; skew-y: 345.7; scale-x: 0.799; scale-y: 0.799; }
        frame 54 { x: -10000; y: 5.8; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; }
        frame 55 { y: 6.6; scale-x: -10000; scale-y: -10000; }
        frame 56 { y: 7.4; scale-x: 0.799; scale-y: 0.799; }
        frame 57 { x: 31.5; y: 6.9; scale-x: 0.798; scale-y: 0.798; }
        frame 58 { x: -10000; y: 6.4; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 31.6; y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: 31.3; y: 6.3; skew-x: 345; skew-y: 345; scale-x: 0.798; scale-y: 0.798; }
        frame 61 { x: 31; y: 6.6; skew-x: 344.2; skew-y: 344.2; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 30.7; y: 6.9; skew-x: 343.4; skew-y: 343.4; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: 30; y: 6.1; skew-x: 342; skew-y: 342; scale-x: 0.798; scale-y: 0.798; }
        frame 64 { x: 29.3; y: 5.2; skew-x: 340.5; skew-y: 340.5; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 28.6; y: 4.3; skew-x: 338.9; skew-y: 338.9; scale-x: 0.799; scale-y: 0.799; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 37.6; y: 1.4; skew-x: 349.7; skew-y: 349.7; scale-x: 0.798; scale-y: 0.798; }
        frame 68 { x: 46.9; y: -1.1; skew-x: 360.3; skew-y: 360.3; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 56.4; y: -3.7; skew-x: 371; skew-y: 371; }
        frame 70 { x: 58; y: -0.5; skew-x: 374.1; skew-y: 374.1; scale-x: 0.797; scale-y: 0.797; }
        frame 71 { x: 59.8; y: 2.5; skew-x: 377.3; skew-y: 377.3; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 61.3; y: 5.7; skew-x: 380.5; skew-y: 380.5; }
        frame 73 { x: 56.6; y: 3.8; skew-x: 370.8; skew-y: 370.8; scale-x: 0.796; scale-y: 0.796; }
        frame 74 { x: 52; y: 2.1; skew-x: 361.3; skew-y: 361.3; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 47.4; y: 0.6; skew-x: 352; skew-y: 352; }
        frame 76 { x: 43.1; y: -10000; skew-x: 344.7; skew-y: 344.7; scale-x: 0.795; scale-y: 0.795; }
        frame 77 { x: 38.9; y: 0.8; skew-x: 337.2; skew-y: 337.2; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 34.8; y: 0.9; skew-x: 329.6; skew-y: 329.6; }
        frame 79 { x: 31.9; y: 3; skew-x: 323.9; skew-y: 323.9; scale-x: 0.794; scale-y: 0.794; }
        frame 80 { x: 29.1; y: 5.1; skew-x: 318.3; skew-y: 318.3; scale-x: 0.795; scale-y: 0.795; }
        frame 81 { x: 26.3; y: 4.4; skew-x: 302.8; skew-y: 302.8; scale-x: 0.793; scale-y: 0.793; }
        frame 82 { x: 24.1; y: 3.6; skew-x: 287.5; skew-y: 287.5; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 26.3; y: 4.3; skew-x: 302.8; skew-y: 302.8; }
        frame 84 { x: 29.1; y: 5.1; skew-x: 318.3; skew-y: 318.3; scale-x: 0.795; scale-y: 0.795; }
        frame 85 { x: 35.1; y: 2.9; skew-x: 333.7; skew-y: 333.7; scale-x: 0.794; scale-y: 0.794; }
        frame 86 { x: 41.8; y: 1; skew-x: 349.2; skew-y: 349.2; scale-x: 0.795; scale-y: 0.795; }
        frame 87 { x: 48.9; y: -0.4; skew-x: 364.5; skew-y: 364.5; scale-x: 0.796; scale-y: 0.796; }
        frame 88 { x: 43.8; y: -0.6; skew-x: 357; skew-y: 357; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 38.8; y: -0.7; skew-x: 349.5; skew-y: 349.5; }
        frame 90 { x: 33.9; y: -10000; skew-x: 342; skew-y: 342; }
        frame 91 { x: 29.1; y: -0.5; skew-x: 334.4; skew-y: 334.4; }
        frame 92 { x: 24.4; y: -0.4; skew-x: 326.9; skew-y: 326.9; scale-x: 0.797; scale-y: 0.797; }
        frame 93 { x: 20; y: -0.2; skew-x: 319.4; skew-y: 319.4; scale-x: 0.798; scale-y: 0.798; }
    }
    Track {
        source-name: "Chomper_spike2";
        frame-count: 94;
        frame 0 { x: 10.5; y: 10.7; skew-x: 299; skew-y: 299; scale-x: 0.798; scale-y: 0.798; image: IMAGE_REANIM_CHOMPER_SPIKE; }
        frame 1 { x: 14.7; y: 14; skew-x: 284.6; skew-y: 284.6; scale-x: 0.796; scale-y: 0.796; image: none; }
        frame 2 { x: 15.9; y: 11.9; skew-x: 287; skew-y: 287; scale-x: 0.795; scale-y: 0.795; }
        frame 3 { x: 17.1; y: 9.7; skew-x: 289.3; skew-y: 289.3; scale-x: 0.796; scale-y: 0.796; }
        frame 4 { x: 18.2; y: 7.7; skew-x: 291.9; skew-y: 291.9; scale-x: 0.797; scale-y: 0.797; }
        frame 5 { x: 21.1; y: 8.4; skew-x: 291.1; skew-y: 291.1; scale-x: 0.795; scale-y: 0.795; }
        frame 6 { x: 24; y: 9; skew-x: 290.5; skew-y: 290.5; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 26.9; y: 9.6; skew-x: 289.8; skew-y: 289.8; }
        frame 8 { x: 29.7; y: 10.1; skew-x: 289.2; skew-y: 289.2; }
        frame 9 { x: 31.7; y: 9.6; skew-x: 299.8; skew-y: 299.8; scale-x: 0.793; scale-y: 0.793; }
        frame 10 { x: 34; y: 9.1; skew-x: 310.4; skew-y: 310.4; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 36.6; y: 8.6; skew-x: 320.9; skew-y: 320.9; }
        frame 12 { x: 39.5; y: 8.4; skew-x: 331.5; skew-y: 331.5; scale-x: 0.794; scale-y: 0.794; }
        frame 13 { x: 41.8; y: 8.5; skew-x: 345.1; skew-y: 345.1; scale-x: 0.793; scale-y: 0.793; }
        frame 14 { x: 37.1; y: 9.2; skew-x: 326.4; skew-y: 326.4; scale-x: 0.792; scale-y: 0.792; }
        frame 15 { x: 33.1; y: 10.3; skew-x: 307.8; skew-y: 307.8; scale-x: 0.793; scale-y: 0.793; }
        frame 16 { x: 30; y: 11.3; skew-x: 289.2; skew-y: 289.2; scale-x: 0.795; scale-y: 0.795; }
        frame 17 { x: 27.1; y: 10.5; skew-x: 289.8; skew-y: 289.8; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 24.1; y: 9.6; skew-x: 290.5; skew-y: 290.5; }
        frame 19 { x: 21.2; y: 8.8; skew-x: 291.1; skew-y: 291.1; }
        frame 20 { x: 18.1; y: 8; skew-x: 291.9; skew-y: 291.9; scale-x: 0.797; scale-y: 0.797; }
        frame 21 { x: 16.2; y: 8.7; skew-x: 293.6; skew-y: 293.6; scale-x: 0.796; scale-y: 0.796; }
        frame 22 { x: 14.3; y: 9.4; skew-x: 295.3; skew-y: 295.3; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 12.4; y: 10; skew-x: 297.3; skew-y: 297.3; }
        frame 24 { x: 10.5; y: 10.7; skew-x: 299; skew-y: 299; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 9.8; y: 11.7; skew-x: 299.1; skew-y: 299.1; }
        frame 27 { x: 10.3; y: -10000; skew-x: 305.6; skew-y: 305.6; scale-x: 0.797; scale-y: 0.797; }
        frame 28 { x: 10.9; y: 11.8; skew-x: 312.1; skew-y: 312.1; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 11.5; y: 11.6; skew-x: 318.6; skew-y: 318.6; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: 11.8; y: 11.5; skew-x: 324.4; skew-y: 324.4; scale-x: 0.797; scale-y: 0.797; }
        frame 31 { x: 12.2; y: -10000; skew-x: 330.1; skew-y: 330.1; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 12.6; y: 11.3; skew-x: 335.7; skew-y: 335.7; }
        frame 33 { x: 13.1; y: 11.4; skew-x: 341.5; skew-y: 341.5; }
        frame 34 { x: 10.6; y: 13; skew-x: 338.2; skew-y: 338.2; scale-x: 0.796; scale-y: 0.796; }
        frame 35 { x: 8.2; y: 14.6; skew-x: 334.9; skew-y: 334.9; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 5.8; y: 16.4; skew-x: 331.6; skew-y: 331.6; scale-x: 0.797; scale-y: 0.797; }
        frame 37 { x: 11.7; y: 12.1; skew-x: 293.1; skew-y: 293.5; scale-x: 0.816; scale-y: 0.817; }
        frame 38 { x: 19.8; y: 7.8; skew-x: 259.2; skew-y: 260; scale-x: 0.834; scale-y: 0.836; }
        frame 39 { x: 28.5; y: 2.8; skew-x: 229.8; skew-y: 230.8; scale-x: 0.85; scale-y: 0.853; }
        frame 40 { x: 38; y: 6; skew-x: 285.8; skew-y: 286.3; scale-x: 0.82; scale-y: 0.821; }
        frame 41 { x: 54.5; y: 7.1; skew-x: 341.9; skew-y: 341.9; scale-x: 0.791; scale-y: 0.791; }
        frame 42 { x: 59.6; y: -10000; skew-x: 353.7; skew-y: 353.7; scale-x: 0.79; scale-y: 0.79; }
        frame 43 { x: 64.8; y: 7.4; skew-x: 365.5; skew-y: 365.5; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 61.6; y: 4.2; skew-x: 368; skew-y: 368; }
        frame 45 { x: 58.4; y: 0.9; skew-x: 370.5; skew-y: 370.5; }
        frame 46 { x: 55.3; y: -2.2; skew-x: 373.2; skew-y: 373.2; }
        frame 47 { x: 41.6; y: 1.6; skew-x: 355.2; skew-y: 355.2; scale-x: 0.792; scale-y: 0.792; }
        frame 48 { x: 28.5; y: 6.4; skew-x: 336.9; skew-y: 336.9; scale-x: 0.795; scale-y: 0.795; }
        frame 49 { x: 16; y: 11.6; skew-x: 318.6; skew-y: 318.6; scale-x: 0.798; scale-y: 0.798; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 16.7; y: 11.4; skew-x: 320.9; skew-y: 320.9; scale-x: 0.797; scale-y: 0.797; }
        frame 52 { x: 17.4; y: 11.1; skew-x: 323.1; skew-y: 323.1; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 18.2; y: 10.9; skew-x: 325.4; skew-y: 325.4; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: -10000; y: 11.6; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 55 { y: 12.4; scale-x: -10000; scale-y: -10000; }
        frame 56 { y: 13.2; scale-x: 0.798; scale-y: 0.798; }
        frame 57 { y: 12.7; scale-x: 0.797; scale-y: 0.797; }
        frame 58 { y: 12.2; scale-x: -10000; scale-y: -10000; }
        frame 59 { y: 11.8; scale-x: 0.798; scale-y: 0.798; }
        frame 60 { x: 18; y: 12.2; skew-x: 324.7; skew-y: 324.7; scale-x: 0.797; scale-y: 0.797; }
        frame 61 { x: 17.9; y: 12.7; skew-x: 323.9; skew-y: 323.9; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 17.7; y: 13.3; skew-x: 323.1; skew-y: 323.1; scale-x: 0.798; scale-y: 0.798; }
        frame 63 { x: 17.1; y: 12.7; skew-x: 321.6; skew-y: 321.6; scale-x: 0.797; scale-y: 0.797; }
        frame 64 { x: 16.6; y: 12.2; skew-x: 320.1; skew-y: 320.1; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 16; y: 11.6; skew-x: 318.6; skew-y: 318.6; scale-x: 0.798; scale-y: 0.798; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 24.3; y: 6.1; skew-x: 329.4; skew-y: 329.4; scale-x: 0.797; scale-y: 0.797; }
        frame 68 { x: 33; y: 0.9; skew-x: 340; skew-y: 340; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 41.9; y: -4.2; skew-x: 350.7; skew-y: 350.7; }
        frame 70 { x: 43.6; y: -1.9; skew-x: 354; skew-y: 354; }
        frame 71 { x: 45.3; y: 0.4; skew-x: 357.2; skew-y: 357.2; }
        frame 72 { x: 47.1; y: 2.8; skew-x: 360.2; skew-y: 360.2; }
        frame 73 { x: 42.4; y: 3.3; skew-x: 350.7; skew-y: 350.7; scale-x: 0.796; scale-y: 0.796; }
        frame 74 { x: 37.9; y: 3.9; skew-x: 341.2; skew-y: 341.2; scale-x: 0.795; scale-y: 0.795; }
        frame 75 { x: 33.6; y: 4.8; skew-x: 331.6; skew-y: 331.6; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 30.2; y: 6.5; skew-x: 324.2; skew-y: 324.2; scale-x: 0.794; scale-y: 0.794; }
        frame 77 { x: 26.9; y: 8.2; skew-x: 316.9; skew-y: 316.9; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 23.6; y: 10.1; skew-x: 309.3; skew-y: 309.3; scale-x: 0.795; scale-y: 0.795; }
        frame 79 { x: 21.8; y: 13.2; skew-x: 303.6; skew-y: 303.6; scale-x: 0.793; scale-y: 0.793; }
        frame 80 { x: 19.9; y: 16.2; skew-x: 298; skew-y: 298; scale-x: 0.794; scale-y: 0.794; }
        frame 81 { x: -10000; y: 17.6; skew-x: 273.3; skew-y: 273.3; scale-x: 0.793; scale-y: 0.793; }
        frame 82 { x: 21.1; y: 18.1; skew-x: 248.9; skew-y: 248.9; scale-x: 0.792; scale-y: 0.792; }
        frame 83 { x: 19.9; y: 17.6; skew-x: 273.3; skew-y: 273.3; scale-x: 0.793; scale-y: 0.793; }
        frame 84 { x: -10000; y: 16.2; skew-x: 298; skew-y: 298; scale-x: 0.794; scale-y: 0.794; }
        frame 85 { x: 24.3; y: 11.6; skew-x: 314.4; skew-y: 314.4; scale-x: 0.793; scale-y: 0.793; }
        frame 86 { x: 29.2; y: 7.2; skew-x: 330.9; skew-y: 330.9; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 35; y: 2.9; skew-x: 347.2; skew-y: 347.2; scale-x: 0.795; scale-y: 0.795; }
        frame 88 { x: 30.5; y: 4; skew-x: 339.2; skew-y: 339.2; scale-x: 0.794; scale-y: 0.794; }
        frame 89 { x: 26.2; y: 5.3; skew-x: 331.2; skew-y: 331.2; scale-x: 0.795; scale-y: 0.795; }
        frame 90 { x: 22.1; y: 6.5; skew-x: 323.1; skew-y: 323.1; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 18; y: 7.8; skew-x: 315.1; skew-y: 315.1; }
        frame 92 { x: 14.2; y: 9.2; skew-x: 307.1; skew-y: 307.1; scale-x: 0.796; scale-y: 0.796; }
        frame 93 { x: 10.5; y: 10.7; skew-x: 299; skew-y: 299; scale-x: 0.798; scale-y: 0.798; }
    }
    Track {
        source-name: "Chomper_spike1";
        frame-count: 94;
        frame 0 { x: 5.7; y: 21.9; skew-x: 282.3; skew-y: 282.3; scale-x: 0.797; scale-y: 0.797; image: IMAGE_REANIM_CHOMPER_SPIKE; }
        frame 1 { x: 10.3; y: 23.8; skew-x: 275.3; skew-y: 275.3; scale-x: 0.796; scale-y: 0.796; image: none; }
        frame 2 { x: 11.8; y: 22.4; skew-x: 275.1; skew-y: 275.1; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 13.4; y: 20.9; skew-x: 275; skew-y: 275; }
        frame 4 { x: 14.9; y: 19.4; skew-x: 275.1; skew-y: 275.1; }
        frame 5 { x: 17.1; y: 19.7; skew-x: 274.8; skew-y: 274.8; scale-x: 0.795; scale-y: 0.795; }
        frame 6 { x: 19.4; y: 19.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 21.6; y: 20.1; }
        frame 8 { x: 23.7; y: 20.3; skew-x: 274.6; skew-y: 274.6; scale-x: 0.794; scale-y: 0.794; }
        frame 9 { x: 25.1; y: 19.6; skew-x: 285; skew-y: 285; scale-x: 0.793; scale-y: 0.793; }
        frame 10 { x: 26.6; y: 18.8; skew-x: 295.6; skew-y: 295.6; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 28.6; y: 18; skew-x: 306.1; skew-y: 306.1; scale-x: 0.792; scale-y: 0.792; }
        frame 12 { x: 30.7; y: 17.1; skew-x: 316.5; skew-y: 316.5; scale-x: 0.793; scale-y: 0.793; }
        frame 13 { x: 31.9; y: 16.2; skew-x: 331.3; skew-y: 331.3; scale-x: 0.792; scale-y: 0.792; }
        frame 14 { x: 28.3; y: 18.1; skew-x: 312.4; skew-y: 312.4; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 25.7; y: 19.9; skew-x: 293.5; skew-y: 293.5; scale-x: 0.793; scale-y: 0.793; }
        frame 16 { x: 24; y: 21.5; skew-x: 274.6; skew-y: 274.6; scale-x: 0.794; scale-y: 0.794; }
        frame 17 { x: 21.6; y: 21.1; skew-x: 274.8; skew-y: 274.8; scale-x: 0.795; scale-y: 0.795; }
        frame 18 { x: 19.3; y: 20.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 17; y: 20.3; }
        frame 20 { x: 14.8; y: 19.7; skew-x: 275.1; skew-y: 275.1; scale-x: 0.796; scale-y: 0.796; }
        frame 21 { x: 12.6; y: 20.3; skew-x: 276.8; skew-y: 276.8; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 10.3; y: 20.8; skew-x: 278.6; skew-y: 278.6; }
        frame 23 { x: 8.1; y: 21.4; skew-x: 280.5; skew-y: 280.5; }
        frame 24 { x: 5.7; y: 21.9; skew-x: 282.3; skew-y: 282.3; scale-x: 0.797; scale-y: 0.797; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 5; y: 22.8; skew-x: 282.4; skew-y: 282.4; scale-x: 0.798; scale-y: 0.798; }
        frame 27 { x: 4.3; y: 22.1; skew-x: 288.8; skew-y: 288.8; scale-x: 0.797; scale-y: 0.797; }
        frame 28 { x: 3.7; y: 21.3; skew-x: 295.3; skew-y: 295.3; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 3.2; y: 20.5; skew-x: 301.9; skew-y: 301.9; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: 2.8; y: 19.7; skew-x: 307.4; skew-y: 307.4; scale-x: 0.796; scale-y: 0.796; }
        frame 31 { x: 2.4; y: 18.9; skew-x: 313.1; skew-y: 313.1; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 2; y: 18.2; skew-x: 318.6; skew-y: 318.6; }
        frame 33 { x: 1.8; y: 17.4; skew-x: 324.2; skew-y: 324.2; scale-x: 0.797; scale-y: 0.797; }
        frame 34 { x: -0.1; y: 19.7; skew-x: 320.9; skew-y: 320.9; scale-x: 0.795; scale-y: 0.795; }
        frame 35 { x: -2.1; y: 21.9; skew-x: 317.6; skew-y: 317.6; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -4.2; y: 24.2; skew-x: 314.4; skew-y: 314.4; scale-x: 0.796; scale-y: 0.796; }
        frame 37 { x: 5.7; y: 21.4; skew-x: 278.5; skew-y: 278.8; scale-x: 0.817; scale-y: 0.816; }
        frame 38 { x: 16.9; y: 17.9; skew-x: 247; skew-y: 247.7; scale-x: 0.835; scale-y: 0.833; }
        frame 39 { x: 27.7; y: 13.2; skew-x: 219.5; skew-y: 220.5; scale-x: 0.852; scale-y: 0.849; }
        frame 40 { x: 30.8; y: 15.7; skew-x: 274.6; skew-y: 271.5; scale-x: 0.889; scale-y: 0.83; }
        frame 41 { x: 39.1; y: 13.9; skew-x: 330; skew-y: 322.7; scale-x: 0.926; scale-y: 0.81; }
        frame 42 { x: 43.5; y: 12.7; skew-x: 345.4; skew-y: 338.2; scale-x: 0.925; scale-y: 0.809; }
        frame 43 { x: 48.3; y: 11.9; skew-x: 360.6; skew-y: 353.4; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 45; y: 7.9; skew-x: 363.1; skew-y: 356; scale-x: 0.924; }
        frame 45 { x: 41.7; y: 3.9; skew-x: 365.8; skew-y: 358.7; scale-x: -10000; }
        frame 46 { x: 38.3; y: -0; skew-x: 368.4; skew-y: 361.2; }
        frame 47 { x: 27.1; y: 6.4; skew-x: 346.2; skew-y: 341.5; scale-x: 0.881; scale-y: 0.804; }
        frame 48 { x: 16.9; y: 13.4; skew-x: 324.1; skew-y: 321.6; scale-x: 0.838; scale-y: 0.8; }
        frame 49 { x: 7.7; y: 20.5; skew-x: 301.9; skew-y: 301.9; scale-x: 0.798; scale-y: 0.798; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 8.1; y: 19.9; skew-x: 304.1; skew-y: 304.1; scale-x: 0.796; scale-y: 0.796; }
        frame 52 { x: 8.5; y: 19.4; skew-x: 306.3; skew-y: 306.3; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 9; y: 18.8; skew-x: 308.6; skew-y: 308.6; scale-x: 0.797; scale-y: 0.797; }
        frame 54 { x: -10000; y: 19.5; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 55 { y: 20.3; scale-x: -10000; scale-y: -10000; }
        frame 56 { y: 21; scale-x: 0.797; scale-y: 0.797; }
        frame 57 { x: 9.1; y: 20.6; scale-x: 0.796; scale-y: 0.796; }
        frame 58 { x: -10000; y: 20.1; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 9; y: 19.6; scale-x: 0.797; scale-y: 0.797; }
        frame 60 { x: -10000; y: 20.3; skew-x: 307.9; skew-y: 307.9; scale-x: 0.796; scale-y: 0.796; }
        frame 61 { x: 8.8; y: 20.8; skew-x: 307.1; skew-y: 307.1; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 8.7; y: 21.5; skew-x: 306.4; skew-y: 306.4; scale-x: 0.797; scale-y: 0.797; }
        frame 63 { x: 8.4; y: 21.1; skew-x: 304.8; skew-y: 304.8; scale-x: 0.796; scale-y: 0.796; }
        frame 64 { x: 8.1; y: 20.9; skew-x: 303.3; skew-y: 303.3; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 7.7; y: 20.5; skew-x: 301.9; skew-y: 301.9; scale-x: 0.798; scale-y: 0.798; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 15; y: 13.3; skew-x: 312.6; skew-y: 312.6; scale-x: 0.796; scale-y: 0.796; }
        frame 68 { x: 22.4; y: 6; skew-x: 323.2; skew-y: 323.2; scale-x: 0.795; scale-y: 0.795; }
        frame 69 { x: 30.1; y: -1.1; skew-x: 333.9; skew-y: 333.9; scale-x: 0.796; scale-y: 0.796; }
        frame 70 { x: 31.7; y: 0.5; skew-x: 337.2; skew-y: 337.2; scale-x: 0.795; scale-y: 0.795; }
        frame 71 { x: 33.3; y: 2.2; skew-x: 340.4; skew-y: 340.4; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 35; y: 4; skew-x: 343.5; skew-y: 343.5; scale-x: 0.796; scale-y: 0.796; }
        frame 73 { x: 31; y: 6.5; skew-x: 333.9; skew-y: 333.9; scale-x: 0.794; scale-y: 0.794; }
        frame 74 { x: 27.2; y: 9; skew-x: 324.4; skew-y: 324.4; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 23.5; y: 11.6; skew-x: 314.9; skew-y: 314.9; scale-x: 0.795; scale-y: 0.795; }
        frame 76 { x: 21.2; y: 14.5; skew-x: 307.4; skew-y: 307.4; scale-x: 0.793; scale-y: 0.793; }
        frame 77 { x: 18.9; y: 17.3; skew-x: 300.1; skew-y: 300.1; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 16.9; y: 20.2; skew-x: 292.6; skew-y: 292.6; scale-x: 0.794; scale-y: 0.794; }
        frame 79 { x: 16.1; y: 23.8; skew-x: 286.8; skew-y: 286.8; scale-x: 0.793; scale-y: 0.793; }
        frame 80 { x: 15.3; y: 27.4; skew-x: 281.3; skew-y: 281.3; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 16.2; y: 27.3; skew-x: 264.7; skew-y: 264.7; scale-x: 0.792; scale-y: 0.792; }
        frame 82 { x: 17.6; y: 26.6; skew-x: 248.2; skew-y: 248.2; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 16.3; y: 27.2; skew-x: 264.7; skew-y: 264.7; }
        frame 84 { x: 15.3; y: 27.4; skew-x: 281.3; skew-y: 281.3; scale-x: 0.793; scale-y: 0.793; }
        frame 85 { x: 17.7; y: 21.7; skew-x: 295.8; skew-y: 295.8; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 20.5; y: 16; skew-x: 310.4; skew-y: 310.4; }
        frame 87 { x: 23.9; y: 10.1; skew-x: 324.9; skew-y: 324.9; scale-x: 0.794; scale-y: 0.794; }
        frame 88 { x: 20.7; y: 12; skew-x: 317.9; skew-y: 317.9; scale-x: 0.793; scale-y: 0.793; }
        frame 89 { x: 17.3; y: 14.1; skew-x: 310.6; skew-y: 310.6; scale-x: 0.794; scale-y: 0.794; }
        frame 90 { x: 14.3; y: 16; skew-x: 303.6; skew-y: 303.6; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 11.3; y: 17.9; skew-x: 296.5; skew-y: 296.5; scale-x: 0.795; scale-y: 0.795; }
        frame 92 { x: 8.5; y: 19.9; skew-x: 289.3; skew-y: 289.3; scale-x: 0.796; scale-y: 0.796; }
        frame 93 { x: 5.7; y: 21.9; skew-x: 282.3; skew-y: 282.3; scale-x: 0.797; scale-y: 0.797; }
    }
    Track {
        source-name: "Chomper_topjaw";
        frame-count: 94;
        frame 0 { x: 4.7; y: 11.6; skew-x: 340.5; skew-y: 340.5; scale-x: 0.884; scale-y: 0.799; image: IMAGE_REANIM_CHOMPER_TOPJAW; }
        frame 1 { x: 9.2; y: 11.2; skew-x: 343.3; skew-y: 343.3; scale-x: -10000; scale-y: 0.774; image: none; }
        frame 2 { x: 10.6; y: 9.6; skew-x: 342.4; skew-y: 342.5; scale-x: 0.882; scale-y: 0.782; }
        frame 3 { x: 11.8; y: 8.1; skew-x: 341.5; skew-y: 341.5; scale-x: -10000; scale-y: 0.791; }
        frame 4 { x: 13; y: 6.5; skew-x: 340.5; skew-y: 340.5; scale-y: 0.8; }
        frame 5 { x: 15.8; y: 6.6; skew-x: 342.4; skew-y: 342.4; scale-x: 0.88; scale-y: 0.799; }
        frame 6 { x: 18.7; y: 6.8; skew-x: 344.2; skew-y: 344.2; scale-x: 0.879; scale-y: -10000; }
        frame 7 { x: 21.5; y: 6.9; skew-x: 345.9; skew-y: 345.9; scale-x: 0.878; }
        frame 8 { x: 24.4; y: 7.1; skew-x: 347.6; skew-y: 347.6; scale-x: -10000; scale-y: 0.8; }
        frame 9 { x: 26.6; y: 7.6; skew-x: 350.4; skew-y: 350.4; scale-x: 0.876; scale-y: 0.799; }
        frame 10 { x: 28.7; y: 8.1; skew-x: 353.2; skew-y: 353.2; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 30.8; y: 8.8; skew-x: 355.7; skew-y: 355.7; scale-x: 0.875; }
        frame 12 { x: 33.1; y: 9.4; skew-x: 358.4; skew-y: 358.4; scale-x: 0.874; }
        frame 13 { x: 33; y: 11.4; skew-x: 357.6; skew-y: 359.2; scale-x: 0.87; scale-y: 0.766; }
        frame 14 { x: 30.2; y: 10.2; skew-x: 354.4; skew-y: 355.5; scale-x: 0.872; scale-y: 0.777; }
        frame 15 { x: 27.4; y: 9.3; skew-x: 351; skew-y: 351.5; scale-x: 0.875; scale-y: 0.788; }
        frame 16 { x: 24.7; y: 8.3; skew-x: 347.6; skew-y: 347.6; scale-x: 0.878; scale-y: 0.8; }
        frame 17 { x: 21.8; y: 7.8; skew-x: 345.9; skew-y: 345.9; scale-x: -10000; scale-y: 0.799; }
        frame 18 { x: 18.9; y: 7.4; skew-x: 344.2; skew-y: 344.2; scale-x: 0.879; scale-y: -10000; }
        frame 19 { x: 15.9; y: 7; skew-x: 342.4; skew-y: 342.4; scale-x: 0.88; }
        frame 20 { x: 12.9; y: 6.8; skew-x: 340.5; skew-y: 340.5; scale-x: 0.882; scale-y: 0.8; }
        frame 21 { x: 10.9; y: 8; skew-x: -10000; skew-y: -10000; scale-x: 0.881; scale-y: 0.799; }
        frame 22 { x: 8.9; y: 9.2; scale-x: 0.882; scale-y: -10000; }
        frame 23 { x: 6.8; y: 10.4; scale-x: 0.883; }
        frame 24 { x: 4.7; y: 11.6; scale-x: 0.884; }
        frame 25 { x: -10000; y: -10000; scale-x: -10000; }
        frame 26 { x: 4; y: 12.5; scale-x: 0.885; scale-y: 0.8; }
        frame 27 { x: 4.3; y: 11.7; skew-x: 347; skew-y: 347.2; scale-x: 0.884; scale-y: 0.799; }
        frame 28 { x: 4.9; y: 11.1; skew-x: 353.5; skew-y: 353.7; scale-x: 0.885; scale-y: 0.8; }
        frame 29 { x: 5.7; y: 10.5; skew-x: 360; skew-y: 360; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 5.6; y: 10.4; skew-x: 362.3; skew-y: 362.3; }
        frame 31 { x: -10000; y: -10000; skew-x: 364.5; skew-y: 364.5; }
        frame 32 { x: 5.4; skew-x: 366.8; skew-y: 366.8; scale-x: 0.884; scale-y: 0.799; }
        frame 33 { x: -10000; skew-x: 369.1; skew-y: 369.1; scale-x: 0.885; scale-y: 0.8; }
        frame 34 { x: 2.9; y: 12.5; skew-x: 365.8; skew-y: 365.8; scale-x: 0.884; scale-y: 0.799; }
        frame 35 { x: 0.4; y: 14.6; skew-x: 362.5; skew-y: 362.5; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -1.8; y: 16.7; skew-x: 359.3; skew-y: 359.3; }
        frame 37 { x: 3.6; y: 5.6; skew-x: 347; skew-y: 346.7; scale-x: 0.973; scale-y: 0.819; }
        frame 38 { x: 9.6; y: -2.7; skew-x: 336.2; skew-y: 335.4; scale-x: 1.052; scale-y: 0.837; }
        frame 39 { x: 16; y: -9.1; skew-x: 326.6; skew-y: 325.7; scale-x: 1.121; scale-y: 0.853; }
        frame 40 { x: 23.9; y: 1.4; skew-x: 343.5; skew-y: 343; scale-x: 1.225; scale-y: 0.823; }
        frame 41 { x: 34.1; y: 11.3; skew-x: 360.2; skew-y: 360.2; scale-x: 1.33; scale-y: 0.795; }
        frame 42 { x: 37; y: 10.4; skew-x: 363.8; skew-y: 364; scale-x: 1.29; scale-y: -10000; }
        frame 43 { x: 40.1; y: 9.7; skew-x: 367.8; skew-y: 367.8; scale-x: 1.251; }
        frame 44 { x: 36.8; y: 5.3; skew-x: 370.3; skew-y: 370.3; scale-x: 1.25; scale-y: 0.794; }
        frame 45 { x: 33.5; y: 1; skew-x: 372.8; skew-y: 372.8; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 30.4; y: -3.3; skew-x: 375.6; skew-y: 375.6; scale-y: 0.795; }
        frame 47 { x: 23.1; y: 1.7; skew-x: 370.3; skew-y: 370.3; scale-x: 1.128; scale-y: 0.796; }
        frame 48 { x: 16.1; y: 6.4; skew-x: 365.1; skew-y: 365; scale-x: 1.007; scale-y: 0.798; }
        frame 49 { x: 9.3; y: 10.5; skew-x: 360; skew-y: 360; scale-x: 0.885; scale-y: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 10.1; y: 10.1; skew-x: 362; skew-y: 362; }
        frame 52 { x: 10.9; y: 9.8; skew-x: 364; skew-y: 364; }
        frame 53 { x: 11.7; y: 9.6; skew-x: 366; skew-y: 366; }
        frame 54 { x: -10000; y: 9.9; skew-x: 366.6; skew-y: 366.6; scale-x: 0.884; scale-y: 0.799; }
        frame 55 { x: 11.8; y: 10.1; skew-x: 367.3; skew-y: 367.3; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 11.9; y: 10.3; skew-x: 368.1; skew-y: 368.1; scale-x: 0.885; scale-y: 0.8; }
        frame 57 { x: 12.1; y: 9.7; skew-x: 368.6; skew-y: 368.6; scale-x: 0.884; scale-y: 0.799; }
        frame 58 { x: 12.6; y: 9; skew-x: 369.3; skew-y: 369.3; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 12.9; y: 8.3; skew-x: 370; skew-y: 370; scale-x: 0.885; scale-y: 0.8; }
        frame 60 { x: 12.4; y: 9.4; skew-x: 368.8; skew-y: 368.8; scale-x: 0.884; scale-y: 0.799; }
        frame 61 { x: 11.9; y: 10.7; skew-x: 367.5; skew-y: 367.5; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 11.5; y: 11.7; skew-x: 366.5; skew-y: 366.5; }
        frame 63 { x: 10.7; y: 11.4; skew-x: 364.3; skew-y: 364.3; }
        frame 64 { x: 9.9; y: 10.9; skew-x: 362; skew-y: 362; scale-x: 0.885; scale-y: 0.8; }
        frame 65 { x: 9.3; y: 10.5; skew-x: 360; skew-y: 360; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 67 { x: 17.9; y: 3.4; skew-x: 370.6; skew-y: 370.6; scale-x: 0.884; scale-y: 0.799; }
        frame 68 { x: 27.1; y: -2.9; skew-x: 381.3; skew-y: 381.3; scale-x: 0.883; scale-y: 0.798; }
        frame 69 { x: 36.9; y: -8.8; skew-x: 392.1; skew-y: 392.1; scale-x: 0.884; scale-y: 0.799; }
        frame 70 { x: 38.9; y: -6.7; skew-x: 395.3; skew-y: 395.3; scale-x: 0.882; scale-y: 0.797; }
        frame 71 { x: 40.9; y: -4.6; skew-x: 398.4; skew-y: 398.4; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 42.9; y: -2.3; skew-x: 401.6; skew-y: 401.6; scale-x: 0.883; scale-y: 0.798; }
        frame 73 { x: 37.5; y: -1.4; skew-x: 392.1; skew-y: 392.1; scale-x: 0.881; scale-y: 0.797; }
        frame 74 { x: 32.3; y: 0.1; skew-x: 382.5; skew-y: 382.5; scale-x: -10000; scale-y: 0.796; }
        frame 75 { x: 27.4; y: 2.1; skew-x: 373; skew-y: 373; scale-x: 0.882; scale-y: 0.797; }
        frame 76 { x: 23.6; y: 4.6; skew-x: 365.5; skew-y: 365.5; scale-x: 0.881; scale-y: 0.796; }
        frame 77 { x: 20; y: 7.1; skew-x: 358.2; skew-y: 358.2; scale-x: -10000; scale-y: -10000; }
        frame 78 { x: 16.9; y: 10; skew-x: 350.7; skew-y: 350.7; }
        frame 79 { x: 15; y: 13.7; skew-x: 345.2; skew-y: 345.2; scale-x: 0.88; scale-y: 0.795; }
        frame 80 { x: 13.3; y: 17.5; skew-x: 339.4; skew-y: 339.4; scale-x: -10000; scale-y: 0.796; }
        frame 81 { x: 12.4; y: 15.3; skew-x: 334.7; skew-y: 334.7; scale-x: 0.879; scale-y: 0.794; }
        frame 82 { x: 11.5; y: 13; skew-x: 329.9; skew-y: 329.9; scale-x: 0.88; scale-y: 0.795; }
        frame 83 { x: 12.3; y: 15.3; skew-x: 334.7; skew-y: 334.7; scale-x: 0.879; scale-y: 0.794; }
        frame 84 { x: 13.3; y: 17.5; skew-x: 339.4; skew-y: 339.4; scale-x: 0.88; scale-y: 0.796; }
        frame 85 { x: 17.2; y: 11.9; skew-x: 350.7; skew-y: 350.7; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 21.7; y: 6.8; skew-x: 361.8; skew-y: 361.8; scale-x: 0.881; }
        frame 87 { x: 27.4; y: 2.1; skew-x: 373; skew-y: 373; scale-x: 0.882; scale-y: 0.797; }
        frame 88 { x: 23.1; y: 3.4; skew-x: 367.5; skew-y: 367.5; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 19.1; y: 4.8; skew-x: 362; skew-y: 362; scale-y: 0.798; }
        frame 90 { x: 15.3; y: 6.2; skew-x: 356.9; skew-y: 356.9; scale-x: 0.883; scale-y: -10000; }
        frame 91 { x: 11.5; y: 7.8; skew-x: 351.5; skew-y: 351.4; scale-x: -10000; }
        frame 92 { x: 8; y: 9.6; skew-x: 346; skew-y: 346; }
        frame 93 { x: 4.7; y: 11.6; skew-x: 340.5; skew-y: 340.5; scale-x: 0.884; scale-y: 0.799; }
    }
}
