export component Cabbagepult {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 74;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -1.3; y: -1.3; cel: 0; }
        frame 6 { x: -10000; y: -10000; cel: -10000; }
        frame 36 { cel: -1; }
        frame 37 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 36 { x: -5.6; y: -8; skew-x: 7.3; skew-y: 7.3; cel: 0; }
        frame 37 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -10000; }
    }
    Track {
        source-name: "Cabbagepult_backleaf1";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 17.3; y: 51.9; skew-x: 22.8; skew-y: 22.8; scale-x: 0.555; scale-y: 0.374; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_LEFTTIP; }
        frame 6 { x: 17.7; y: 51.4; skew-x: 26.6; skew-y: 24.8; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 18.1; y: 51; skew-x: 30.6; skew-y: 27.1; scale-x: 0.556; }
        frame 8 { x: 18.5; y: 50.5; skew-x: 34.4; skew-y: 29.1; scale-x: 0.557; }
        frame 9 { x: 18.9; y: 50.2; skew-x: 38.3; skew-y: 31.3; scale-x: 0.559; }
        frame 10 { x: 18.1; y: 50.8; skew-x: 33.6; skew-y: 26.6; scale-x: 0.558; }
        frame 11 { x: 17.2; y: 51.5; skew-x: 28.8; skew-y: 21.8; scale-x: -10000; }
        frame 12 { x: 16.4; y: 52.1; skew-x: 24.1; skew-y: 17; }
        frame 13 { x: 15.6; y: 52.9; skew-x: 19.3; skew-y: 12.3; }
        frame 14 { x: 14.8; y: 53.6; skew-x: 14.6; skew-y: 7.5; }
        frame 15 { x: 14; y: 54.5; skew-x: 9.9; skew-y: 2.9; }
        frame 16 { x: 14.6; y: 53.9; skew-x: 12.5; skew-y: 6.8; scale-x: 0.557; }
        frame 17 { x: 15.3; y: 53.4; skew-x: 15; skew-y: 10.8; scale-x: 0.556; }
        frame 18 { x: 16; y: 52.9; skew-x: 17.6; skew-y: 14.8; scale-x: -10000; }
        frame 19 { x: 16.6; y: 52.5; skew-x: 20.1; skew-y: 18.8; scale-x: 0.555; }
        frame 20 { x: 17.3; y: 51.9; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; }
        frame 21 { x: 17.7; y: 51.4; skew-x: 26.6; skew-y: 24.8; }
        frame 22 { x: 18.1; y: 51; skew-x: 30.6; skew-y: 27.1; scale-x: 0.556; }
        frame 23 { x: 18.5; y: 50.5; skew-x: 34.4; skew-y: 29.1; scale-x: 0.557; }
        frame 24 { x: 18.9; y: 50.2; skew-x: 38.3; skew-y: 31.3; scale-x: 0.559; }
        frame 25 { x: 18.1; y: 50.8; skew-x: 33.6; skew-y: 26.6; scale-x: 0.558; }
        frame 26 { x: 17.2; y: 51.5; skew-x: 28.8; skew-y: 21.8; scale-x: -10000; }
        frame 27 { x: 16.4; y: 52.1; skew-x: 24.1; skew-y: 17; }
        frame 28 { x: 15.6; y: 52.9; skew-x: 19.3; skew-y: 12.3; }
        frame 29 { x: 14.8; y: 53.6; skew-x: 14.6; skew-y: 7.5; }
        frame 30 { x: 14; y: 54.5; skew-x: 9.9; skew-y: 2.9; }
        frame 31 { x: 14.6; y: 53.9; skew-x: 12.5; skew-y: 6.8; scale-x: 0.557; }
        frame 32 { x: 15.3; y: 53.4; skew-x: 15; skew-y: 10.8; scale-x: 0.556; }
        frame 33 { x: 16; y: 52.9; skew-x: 17.6; skew-y: 14.8; scale-x: -10000; }
        frame 34 { x: 16.6; y: 52.5; skew-x: 20.1; skew-y: 18.8; scale-x: 0.555; }
        frame 35 { x: 17.3; y: 51.9; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 37 { x: 17.8; y: 51.3; skew-x: 27.8; skew-y: 25.6; }
        frame 38 { x: 18.4; y: 50.6; skew-x: 33.1; skew-y: 28.3; scale-x: 0.557; }
        frame 39 { x: 18.9; y: 50.2; skew-x: 38.3; skew-y: 31.3; scale-x: 0.559; }
        frame 40 { x: 17.9; y: 50.9; skew-x: 32.6; skew-y: 25.6; scale-x: 0.558; }
        frame 41 { x: 16.9; y: 51.7; skew-x: 26.8; skew-y: 19.8; scale-x: -10000; }
        frame 42 { x: 15.9; y: 52.5; skew-x: 21.3; skew-y: 14.3; }
        frame 43 { x: 14.9; y: 53.5; skew-x: 15.5; skew-y: 8.5; }
        frame 44 { x: 14; y: 54.5; skew-x: 9.9; skew-y: 2.9; }
        frame 45 { x: 14.8; y: 53.7; skew-x: 13; skew-y: 7.8; scale-x: 0.557; }
        frame 46 { x: 15.7; y: 53.3; skew-x: 16.3; skew-y: 12.8; scale-x: 0.556; }
        frame 47 { x: 16.5; y: 52.5; skew-x: 19.5; skew-y: 17.8; scale-x: 0.555; }
        frame 48 { x: 17.3; y: 51.9; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; }
        frame 49 { x: 17.8; y: 51.3; skew-x: 27.8; skew-y: 25.6; }
        frame 50 { x: 18.4; y: 50.6; skew-x: 33.1; skew-y: 28.3; scale-x: 0.557; }
        frame 51 { x: 18.9; y: 50.2; skew-x: 38.3; skew-y: 31.3; scale-x: 0.559; }
        frame 52 { x: 18.6; y: 50.4; skew-x: 36.4; skew-y: 29.3; scale-x: 0.558; }
        frame 53 { x: 18.2; y: 50.6; skew-x: 34.6; skew-y: 27.5; scale-x: -10000; }
        frame 54 { x: 17.9; y: 50.9; skew-x: 32.6; skew-y: 25.6; }
        frame 55 { x: 17.6; y: 51.1; skew-x: 30.6; skew-y: 23.6; }
        frame 56 { x: 17.2; y: 51.5; skew-x: 28.8; skew-y: 21.8; }
        frame 57 { x: 16.9; y: 51.7; skew-x: 26.8; skew-y: 19.8; }
        frame 58 { x: 16.5; y: 51.9; skew-x: 25.1; skew-y: 18; }
        frame 59 { x: 16.2; y: 52.3; skew-x: 23.1; skew-y: 16.1; }
        frame 60 { x: 15.9; y: 52.5; skew-x: 21.3; skew-y: 14.3; }
        frame 61 { x: 15.6; y: 52.9; skew-x: 19.3; skew-y: 12.3; }
        frame 62 { x: 15.3; y: 53.2; skew-x: 17.5; skew-y: 10.5; }
        frame 63 { x: 14.9; y: 53.5; skew-x: 15.5; skew-y: 8.5; }
        frame 64 { x: 14.6; y: 53.9; skew-x: 13.6; skew-y: 6.6; }
        frame 65 { x: 14.3; y: 54.1; skew-x: 11.8; skew-y: 4.8; }
        frame 66 { x: 14; y: 54.5; skew-x: 9.9; skew-y: 2.9; }
        frame 67 { x: 14.4; y: 54; skew-x: 11.8; skew-y: 5.8; scale-x: 0.557; }
        frame 68 { x: 15; y: 53.7; skew-x: 13.5; skew-y: 8.5; scale-x: -10000; }
        frame 69 { x: 15.4; y: 53.4; skew-x: 15.3; skew-y: 11.3; scale-x: 0.556; }
        frame 70 { x: 15.9; y: 53; skew-x: 17.3; skew-y: 14.3; scale-x: -10000; }
        frame 71 { x: 16.3; y: 52.6; skew-x: 19; skew-y: 17; scale-x: 0.555; }
        frame 72 { x: 16.8; y: 52.4; skew-x: 20.8; skew-y: 19.8; scale-x: -10000; }
        frame 73 { x: 17.3; y: 51.9; skew-x: 22.8; skew-y: 22.8; }
    }
    Track {
        source-name: "Cabbagepult_backleaf2";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 55.3; y: 52; skew-x: -24.2; skew-y: -24.2; scale-x: 0.555; scale-y: 0.444; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_RIGHTTIP; }
        frame 6 { x: 54.9; y: 52.1; skew-x: -28; skew-y: -25; scale-x: 0.58; scale-y: 0.443; cel: -10000; image: none; }
        frame 7 { x: 54.6; y: 52.3; skew-x: -32; skew-y: -26; scale-x: 0.606; scale-y: -10000; }
        frame 8 { x: 54.4; y: 52.4; skew-x: -35.7; skew-y: -27; scale-x: 0.633; }
        frame 9 { x: 54; y: 52.5; skew-x: -39.6; skew-y: -28; scale-x: 0.66; scale-y: 0.444; }
        frame 10 { x: 54.1; y: 52.7; skew-x: -36.2; skew-y: -25.7; scale-x: 0.665; scale-y: 0.443; }
        frame 11 { x: -10000; y: 52.9; skew-x: -32.7; skew-y: -23.4; scale-x: 0.671; scale-y: -10000; }
        frame 12 { x: 54.3; y: 53; skew-x: -29.3; skew-y: -21.2; scale-x: 0.677; }
        frame 13 { x: -10000; y: 53.2; skew-x: -25.9; skew-y: -18.9; scale-x: 0.683; }
        frame 14 { x: 54.5; y: 53.3; skew-x: -22.5; skew-y: -16.7; scale-x: 0.689; }
        frame 15 { x: -10000; y: 53.5; skew-x: -19.1; skew-y: -14.4; scale-x: 0.695; }
        frame 16 { x: 54.7; y: 53.1; skew-x: -20; skew-y: -16.2; scale-x: 0.666; }
        frame 17 { x: 54.8; y: 52.9; skew-x: -21; skew-y: -18.2; scale-x: 0.638; }
        frame 18 { x: 55; y: 52.6; skew-x: -22.2; skew-y: -20.2; scale-x: 0.61; }
        frame 19 { y: 52.3; skew-x: -23.2; skew-y: -22.2; scale-x: 0.582; }
        frame 20 { x: 55.3; y: 52; skew-x: -24.2; skew-y: -24.2; scale-x: 0.555; scale-y: 0.444; }
        frame 21 { x: 54.9; y: 52.1; skew-x: -28; skew-y: -25; scale-x: 0.58; scale-y: 0.443; }
        frame 22 { x: 54.6; y: 52.3; skew-x: -32; skew-y: -26; scale-x: 0.606; scale-y: -10000; }
        frame 23 { x: 54.4; y: 52.4; skew-x: -35.7; skew-y: -27; scale-x: 0.633; }
        frame 24 { x: 54; y: 52.5; skew-x: -39.6; skew-y: -28; scale-x: 0.66; scale-y: 0.444; }
        frame 25 { x: 54.1; y: 52.7; skew-x: -36.2; skew-y: -25.7; scale-x: 0.665; scale-y: 0.443; }
        frame 26 { x: -10000; y: 52.9; skew-x: -32.7; skew-y: -23.4; scale-x: 0.671; scale-y: -10000; }
        frame 27 { x: 54.3; y: 53; skew-x: -29.3; skew-y: -21.2; scale-x: 0.677; }
        frame 28 { x: -10000; y: 53.2; skew-x: -25.9; skew-y: -18.9; scale-x: 0.683; }
        frame 29 { x: 54.5; y: 53.3; skew-x: -22.5; skew-y: -16.7; scale-x: 0.689; }
        frame 30 { x: -10000; y: 53.5; skew-x: -19.1; skew-y: -14.4; scale-x: 0.695; }
        frame 31 { x: 54.7; y: 53.1; skew-x: -20; skew-y: -16.2; scale-x: 0.666; }
        frame 32 { x: 54.8; y: 52.9; skew-x: -21; skew-y: -18.2; scale-x: 0.638; }
        frame 33 { x: 55; y: 52.6; skew-x: -22.2; skew-y: -20.2; scale-x: 0.61; }
        frame 34 { y: 52.3; skew-x: -23.2; skew-y: -22.2; scale-x: 0.582; }
        frame 35 { x: 55.3; y: 52; skew-x: -24.2; skew-y: -24.2; scale-x: 0.555; scale-y: 0.444; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 54.3; y: 52.3; skew-x: -29.2; skew-y: -25.5; scale-x: 0.598; scale-y: 0.443; }
        frame 38 { x: 53.3; y: 52.4; skew-x: -34.5; skew-y: -26.7; scale-x: 0.642; scale-y: -10000; }
        frame 39 { x: 52.4; y: 52.6; skew-x: -39.6; skew-y: -28; scale-x: 0.687; scale-y: 0.444; }
        frame 40 { x: -10000; y: 52.9; skew-x: -35.5; skew-y: -25.2; scale-x: 0.713; scale-y: 0.443; }
        frame 41 { x: 52.1; y: 53.1; skew-x: -31.5; skew-y: -22.4; scale-x: 0.74; scale-y: -10000; }
        frame 42 { x: -10000; y: 53.4; skew-x: -27.2; skew-y: -19.7; scale-x: 0.767; }
        frame 43 { x: 52; y: 53.5; skew-x: -23.2; skew-y: -17; scale-x: 0.795; }
        frame 44 { x: 54.5; y: -10000; skew-x: -19.1; skew-y: -14.4; scale-x: 0.695; }
        frame 45 { x: 54.8; y: 53.1; skew-x: -20.2; skew-y: -16.7; scale-x: 0.659; }
        frame 46 { x: 54.9; y: 52.9; skew-x: -21.7; skew-y: -19.2; scale-x: 0.624; }
        frame 47 { x: 55; y: 52.5; skew-x: -22.9; skew-y: -21.7; scale-x: 0.589; }
        frame 48 { x: 55.3; y: 52; skew-x: -24.2; skew-y: -24.2; scale-x: 0.555; scale-y: 0.444; }
        frame 49 { x: 54.9; y: 52.1; skew-x: -29.2; skew-y: -25.4; scale-x: 0.589; scale-y: 0.443; }
        frame 50 { x: 54.4; y: 52.4; skew-x: -34.5; skew-y: -26.7; scale-x: 0.624; scale-y: -10000; }
        frame 51 { x: 54; y: 52.5; skew-x: -39.6; skew-y: -28; scale-x: 0.66; scale-y: 0.444; }
        frame 52 { x: 54.1; y: 52.7; skew-x: -38.3; skew-y: -27; scale-x: 0.661; scale-y: 0.443; }
        frame 53 { x: 54; y: -10000; skew-x: -37; skew-y: -26.2; scale-x: 0.664; scale-y: -10000; }
        frame 54 { x: 54.1; y: 52.8; skew-x: -35.5; skew-y: -25.2; scale-x: 0.666; }
        frame 55 { x: -10000; y: 52.9; skew-x: -34.2; skew-y: -24.2; scale-x: 0.668; }
        frame 56 { y: -10000; skew-x: -32.7; skew-y: -23.4; scale-x: 0.671; }
        frame 57 { y: 53; skew-x: -31.5; skew-y: -22.5; scale-x: 0.673; }
        frame 58 { x: 54.3; skew-x: -30; skew-y: -21.5; scale-x: 0.675; }
        frame 59 { x: 54.4; y: -10000; skew-x: -28.7; skew-y: -20.7; scale-x: 0.678; }
        frame 60 { x: -10000; y: 53.1; skew-x: -27.2; skew-y: -19.7; scale-x: 0.68; }
        frame 61 { x: 54.3; y: 53.2; skew-x: -25.9; skew-y: -18.9; scale-x: 0.683; }
        frame 62 { x: 54.4; y: -10000; skew-x: -24.5; skew-y: -17.9; scale-x: 0.685; }
        frame 63 { x: 54.5; y: 53.3; skew-x: -23.2; skew-y: -17; scale-x: 0.687; }
        frame 64 { x: -10000; y: -10000; skew-x: -21.7; skew-y: -16.2; scale-x: 0.69; }
        frame 65 { y: 53.4; skew-x: -20.4; skew-y: -15.2; scale-x: 0.692; }
        frame 66 { y: 53.5; skew-x: -19.1; skew-y: -14.4; scale-x: 0.695; }
        frame 67 { x: 54.7; y: 53.2; skew-x: -19.7; skew-y: -15.7; scale-x: 0.674; }
        frame 68 { x: 54.8; y: 53.1; skew-x: -20.5; skew-y: -17.2; scale-x: 0.654; }
        frame 69 { x: -10000; y: 52.9; skew-x: -21.2; skew-y: -18.5; scale-x: 0.634; }
        frame 70 { x: 54.9; y: 52.8; skew-x: -22; skew-y: -19.9; scale-x: 0.614; }
        frame 71 { x: 55; y: 52.4; skew-x: -22.7; skew-y: -21.4; scale-x: 0.594; }
        frame 72 { y: 52.3; skew-x: -23.4; skew-y: -22.7; scale-x: 0.574; }
        frame 73 { x: 55.3; y: 52; skew-x: -24.2; skew-y: -24.2; scale-x: 0.555; scale-y: 0.444; }
    }
    Track {
        source-name: "Cabbagepult_basket";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -19.9; y: 8.3; scale-x: 0.64; scale-y: 0.64; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_BASKET; }
        frame 6 { x: -21.2; y: 11.4; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: -22.4; y: 14.4; skew-x: -5.9; skew-y: -5.9; }
        frame 8 { x: -23.6; y: 17.6; skew-x: -8.9; skew-y: -8.9; scale-x: 0.639; scale-y: 0.639; }
        frame 9 { x: -24.7; y: 20.8; skew-x: -12; skew-y: -12; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: -25.7; y: 24.1; skew-x: -15.2; skew-y: -15.2; }
        frame 11 { x: -26.6; y: 27.3; skew-x: -18.2; skew-y: -18.2; }
        frame 12 { x: -27.6; y: 30.5; skew-x: -21.3; skew-y: -21.3; }
        frame 13 { x: -27.5; y: 31.5; skew-x: -22.9; skew-y: -22.9; scale-x: 0.638; scale-y: 0.638; }
        frame 14 { x: -27.2; y: 32.4; skew-x: -24.5; skew-y: -24.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: -27; y: 33.3; skew-x: -26.3; skew-y: -26.3; }
        frame 16 { x: -26; y: 28.2; skew-x: -21; skew-y: -21; }
        frame 17 { x: -24.8; y: 23.1; skew-x: -15.7; skew-y: -15.7; }
        frame 18 { x: -23.4; y: 18; skew-x: -10.4; skew-y: -10.4; scale-x: 0.639; scale-y: 0.639; }
        frame 19 { x: -21.8; y: 13; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: -19.9; y: 8.3; skew-x: 0; skew-y: 0; scale-x: 0.64; scale-y: 0.64; }
        frame 21 { x: -19.3; y: 7.6; skew-x: 0.6; skew-y: 0.6; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: -18.7; y: 7; skew-x: 1.3; skew-y: 1.3; }
        frame 23 { x: -18; y: 6.3; skew-x: 2; skew-y: 2; }
        frame 24 { x: -17.3; y: 5.6; skew-x: 2.8; skew-y: 2.8; }
        frame 25 { x: -16.6; y: 4.8; skew-x: 3.5; skew-y: 3.5; }
        frame 26 { x: -15.9; y: 4.2; skew-x: 4.3; skew-y: 4.3; }
        frame 27 { x: -15.2; y: 3.5; skew-x: 5; skew-y: 5; }
        frame 28 { x: -13.1; y: 0; skew-x: 9.8; skew-y: 9.8; scale-x: 0.639; scale-y: 0.639; }
        frame 29 { x: -10.8; y: -3.6; skew-x: 14.5; skew-y: 14.5; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -8.4; y: -7; skew-x: 19.3; skew-y: 19.3; }
        frame 31 { x: -10.9; y: -4.1; skew-x: 15.3; skew-y: 15.3; }
        frame 32 { x: -13.2; y: -1; skew-x: 11.5; skew-y: 11.5; }
        frame 33 { x: -15.5; y: 2; skew-x: 7.6; skew-y: 7.6; }
        frame 34 { x: -17.8; y: 5.1; skew-x: 3.8; skew-y: 3.8; scale-x: 0.64; scale-y: 0.64; }
        frame 35 { x: -19.9; y: 8.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 37 { x: -22.3; y: 15.1; skew-x: -6.9; skew-y: -7.2; scale-y: 0.641; }
        frame 38 { x: -24.5; y: 22.1; skew-x: -14; skew-y: -14.4; scale-x: 0.641; scale-y: 0.642; }
        frame 39 { x: -26.2; y: 29.2; skew-x: -21; skew-y: -21.7; scale-x: -10000; scale-y: 0.643; }
        frame 40 { x: -27.5; y: 36.3; skew-x: -28.2; skew-y: -29; scale-x: 0.642; scale-y: -10000; }
        frame 41 { x: -28.6; y: 43.5; skew-x: -35.2; skew-y: -36.2; scale-x: -10000; scale-y: 0.644; }
        frame 42 { x: -29.2; y: 50.8; skew-x: -42.3; skew-y: -43.5; scale-x: 0.643; scale-y: 0.645; }
        frame 43 { x: -29.6; y: 58; skew-x: -49.4; skew-y: -50.8; scale-x: 0.645; scale-y: 0.648; }
        frame 44 { x: -24.7; y: 31.1; skew-x: -23.9; skew-y: -24.5; scale-x: 0.639; scale-y: 0.64; }
        frame 45 { x: -15.1; y: 5; skew-x: 1.5; skew-y: 1.5; scale-x: 0.634; scale-y: 0.634; }
        frame 46 { x: 0.1; y: -11.9; skew-x: 29.6; skew-y: 29.6; scale-x: 0.633; scale-y: 0.633; }
        frame 47 { x: 18; y: -24.2; skew-x: 57.9; skew-y: 57.9; scale-x: 0.634; scale-y: 0.634; }
        frame 48 { x: 33; y: -27.2; skew-x: 75.7; skew-y: 73.5; scale-x: -10000; scale-y: 0.633; }
        frame 49 { x: 47.5; y: -28.2; skew-x: 93.2; skew-y: 89; scale-x: 0.635; scale-y: -10000; }
        frame 50 { x: 62; y: -24.1; skew-x: 115.2; skew-y: 108.8; scale-x: 0.636; }
        frame 51 { x: 41.7; y: -28.8; skew-x: 85.9; skew-y: 82.7; scale-x: 0.635; }
        frame 52 { x: 38.1; y: -28.5; skew-x: 81.2; skew-y: 78.7; scale-x: -10000; }
        frame 53 { x: 34.5; y: -28.3; skew-x: 76.7; skew-y: 74.5; }
        frame 54 { x: 30.7; y: -27.7; skew-x: 72; skew-y: 70.4; scale-x: 0.634; }
        frame 55 { x: 27; y: -27.1; skew-x: 67.2; skew-y: 66.2; scale-x: -10000; }
        frame 56 { x: 23.3; y: -26.4; skew-x: 62.7; skew-y: 62; }
        frame 57 { x: 19.7; y: -25.5; skew-x: 57.9; skew-y: 57.9; scale-y: 0.634; }
        frame 58 { x: 21.1; y: -25.7; skew-x: 59.9; skew-y: 59.9; scale-x: 0.633; scale-y: 0.633; }
        frame 59 { x: 22.4; y: -25.9; skew-x: 61.9; skew-y: 61.9; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 23.8; y: -26; skew-x: 63.7; skew-y: 63.7; }
        frame 61 { x: 25.2; y: -26.1; skew-x: 65.7; skew-y: 65.7; }
        frame 62 { x: 26.6; y: -26.3; skew-x: 67.7; skew-y: 67.7; }
        frame 63 { x: 27.9; y: -26.4; skew-x: 69.7; skew-y: 69.7; scale-x: 0.632; scale-y: 0.632; }
        frame 64 { x: 29.2; y: -26.6; skew-x: 71.6; skew-y: 71.6; scale-x: 0.633; scale-y: 0.633; }
        frame 65 { x: 23.8; y: -25; skew-x: 64.5; skew-y: 64.5; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 18.4; y: -23; skew-x: 57.4; skew-y: 57.4; }
        frame 67 { x: 12.9; y: -20.7; skew-x: 50.1; skew-y: 50.1; }
        frame 68 { x: 7.5; y: -18; skew-x: 42.9; skew-y: 42.9; scale-x: 0.634; scale-y: 0.634; }
        frame 69 { x: 2.2; y: -15.1; skew-x: 35.8; skew-y: 35.8; scale-x: 0.635; scale-y: 0.635; }
        frame 70 { x: -3.8; y: -9.9; skew-x: 26.8; skew-y: 26.8; scale-x: 0.636; scale-y: 0.636; }
        frame 71 { x: -9.6; y: -4.1; skew-x: 17.8; skew-y: 17.8; scale-x: 0.637; scale-y: 0.637; }
        frame 72 { x: -15.3; y: 1.9; skew-x: 8.8; skew-y: 8.8; scale-x: 0.639; scale-y: 0.639; }
        frame 73 { x: -19.9; y: 8.3; skew-x: 0; skew-y: 0; scale-x: 0.64; scale-y: 0.64; }
    }
    Track {
        source-name: "Cabbagepult_cabbage";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -17.5; y: 3.2; skew-x: -4.4; skew-y: -4.4; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_CABBAGE; }
        frame 6 { x: -18.8; y: 6.1; skew-x: -7; skew-y: -7; scale-x: 0.999; scale-y: 0.999; cel: -10000; image: none; }
        frame 7 { x: -20.2; y: 9.1; skew-x: -9.7; skew-y: -9.7; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: -21.5; y: 11.9; skew-x: -12.4; skew-y: -12.4; }
        frame 9 { x: -22.8; y: 14.9; skew-x: -15.2; skew-y: -15.2; scale-x: 0.998; scale-y: 0.998; }
        frame 10 { x: -24.1; y: 17.8; skew-x: -17.7; skew-y: -17.7; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: -25.3; y: 20.8; skew-x: -20.5; skew-y: -20.5; }
        frame 12 { x: -26.5; y: 23.9; skew-x: -23.2; skew-y: -23.2; scale-x: 0.999; scale-y: 0.999; }
        frame 13 { x: -27.1; y: 25.9; skew-x: -28.5; skew-y: -28.5; scale-x: 0.997; scale-y: 0.997; }
        frame 14 { x: -27.7; y: 27.8; skew-x: -33.7; skew-y: -33.7; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: -28.1; y: 29.9; skew-x: -39; skew-y: -39; scale-x: 0.998; scale-y: 0.998; }
        frame 16 { x: -26.3; y: 24.1; skew-x: -31.2; skew-y: -31.2; scale-x: 0.996; scale-y: 0.996; }
        frame 17 { x: -24.3; y: 18.4; skew-x: -23.5; skew-y: -23.5; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -21.9; y: 12.7; skew-x: -15.7; skew-y: -15.7; }
        frame 19 { x: -19.3; y: 7.2; skew-x: -8.2; skew-y: -8.2; }
        frame 20 { x: -16.2; y: 2; skew-x: -0.4; skew-y: -0.4; scale-x: 0.997; scale-y: 0.997; }
        frame 21 { x: -15.3; y: 1.3; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: -14.4; y: 0.6; skew-x: 1.3; skew-y: 1.3; scale-x: 0.996; scale-y: 0.996; }
        frame 23 { x: -13.5; y: -0; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: -12.7; y: -0.6; skew-x: 3.1; skew-y: 3.1; }
        frame 25 { x: -11.8; y: -1.3; skew-x: 4; skew-y: 4; }
        frame 26 { x: -10.8; y: -2.1; skew-x: 5; skew-y: 5; }
        frame 27 { x: -9.9; y: -2.7; skew-x: 6; skew-y: 6; }
        frame 28 { x: -7.8; y: -5.8; skew-x: 9; skew-y: 9; scale-x: 0.995; scale-y: 0.995; }
        frame 29 { x: -5.7; y: -9; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: -3.5; y: -12.1; skew-x: 15.1; skew-y: 15.1; scale-x: 0.996; scale-y: 0.996; }
        frame 31 { x: -6.5; y: -9; skew-x: 11; skew-y: 11; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -9.4; y: -6; skew-x: 7.1; skew-y: 7.1; scale-x: 0.997; scale-y: 0.997; }
        frame 33 { x: -12.2; y: -2.9; skew-x: 3.3; skew-y: 3.3; scale-x: 0.998; scale-y: 0.998; }
        frame 34 { x: -14.9; y: 0; skew-x: -0.4; skew-y: -0.4; scale-x: 0.999; scale-y: 0.999; }
        frame 35 { x: -17.5; y: 3.2; skew-x: -4.4; skew-y: -4.4; scale-x: 1; scale-y: 1; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: -20.3; y: 9.8; skew-x: -11.2; skew-y: -11.2; scale-x: 0.999; scale-y: 0.999; }
        frame 38 { x: -22.9; y: 16.6; skew-x: -18.2; skew-y: -18.2; scale-x: 0.998; scale-y: 0.998; }
        frame 39 { x: -25.2; y: 23.4; skew-x: -25; skew-y: -25; scale-x: 0.997; scale-y: 0.997; }
        frame 40 { x: -27.1; y: 30.4; skew-x: -32; skew-y: -32; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: -28.8; y: 37.4; skew-x: -38.8; skew-y: -38.8; scale-x: 0.996; scale-y: 0.996; }
        frame 42 { x: -30.3; y: 44.4; skew-x: -45.8; skew-y: -45.8; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: -31.5; y: 51.3; skew-x: -52.6; skew-y: -52.6; scale-x: 0.997; scale-y: 0.997; }
        frame 44 { x: -23.4; y: 26.3; skew-x: -26.2; skew-y: -26.2; scale-x: 0.995; scale-y: 0.995; }
        frame 45 { x: -11.4; y: 2.6; skew-x: -0.2; skew-y: -0.2; scale-x: 0.996; scale-y: 0.996; }
        frame 46 { x: 8.5; y: -13; skew-x: 25.8; skew-y: 25.8; scale-x: 0.995; scale-y: 0.995; }
        frame 47 { x: 27.5; y: -27.2; skew-x: 52.1; skew-y: 52.1; scale-x: 0.996; scale-y: 0.996; }
        frame 48 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 49 { cel: -10000; }
    }
    Track {
        source-name: "Cabbagepult_basket_overlay";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -19.8; y: 8.3; scale-x: 0.637; scale-y: 0.637; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_BASKET_OVERLAY; }
        frame 6 { x: -21; y: 11.3; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: -22.3; y: 14.4; skew-x: -5.7; skew-y: -5.7; }
        frame 8 { x: -23.4; y: 17.5; skew-x: -8.5; skew-y: -8.5; }
        frame 9 { x: -24.6; y: 20.7; skew-x: -11.4; skew-y: -11.4; scale-x: 0.636; scale-y: 0.636; }
        frame 10 { x: -25.6; y: 23.8; skew-x: -14.4; skew-y: -14.4; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: -26.7; y: 27; skew-x: -17.2; skew-y: -17.2; }
        frame 12 { x: -27.6; y: 30.2; skew-x: -20.3; skew-y: -20.3; }
        frame 13 { x: -27.4; y: 31.2; skew-x: -22; skew-y: -22; }
        frame 14 { x: -27.2; y: 32.1; skew-x: -23.7; skew-y: -23.7; }
        frame 15 { x: -26.9; y: 33.2; skew-x: -25.6; skew-y: -25.6; }
        frame 16 { x: -25.9; y: 28.1; skew-x: -20.2; skew-y: -20.2; scale-x: 0.635; scale-y: 0.635; }
        frame 17 { x: -24.6; y: 23.1; skew-x: -15; skew-y: -15; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -23.2; y: 18; skew-x: -9.7; skew-y: -9.7; }
        frame 19 { x: -21.6; y: 13.2; skew-x: -4.4; skew-y: -4.4; }
        frame 20 { x: -19.8; y: 8.4; skew-x: 0.6; skew-y: 0.6; }
        frame 21 { x: -19.1; y: 7.6; skew-x: 1.5; skew-y: 1.5; scale-y: 0.638; }
        frame 22 { x: -18.4; y: 6.7; skew-x: 2.3; skew-y: 2.3; scale-x: 0.636; scale-y: 0.64; }
        frame 23 { x: -17.6; y: 5.8; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: 0.643; }
        frame 24 { x: -16.8; y: 5; skew-x: 4.3; skew-y: 4.3; scale-y: 0.645; }
        frame 25 { x: -16.1; y: 4.3; skew-x: 5.1; skew-y: 5.1; scale-y: 0.647; }
        frame 26 { x: -15.4; y: 3.5; skew-x: 6; skew-y: 6; scale-y: 0.65; }
        frame 27 { x: -14.5; y: 2.5; skew-x: 7.1; skew-y: 7.1; scale-y: 0.652; }
        frame 28 { x: -12.7; y: -0.5; skew-x: 10.8; skew-y: 10.8; scale-y: -10000; }
        frame 29 { x: -10.9; y: -3.7; skew-x: 14.8; skew-y: 14.8; }
        frame 30 { x: -8.8; y: -6.7; skew-x: 18.6; skew-y: 18.6; }
        frame 31 { x: -11.2; y: -3.8; skew-x: 14.8; skew-y: 14.8; scale-y: 0.648; }
        frame 32 { x: -13.5; y: -0.9; skew-x: 11; skew-y: 11; scale-y: 0.646; }
        frame 33 { x: -15.6; y: 2; skew-x: 7.3; skew-y: 7.3; scale-y: 0.643; }
        frame 34 { x: -17.8; y: 5.2; skew-x: 3.6; skew-y: 3.6; scale-x: 0.637; scale-y: 0.64; }
        frame 35 { x: -19.8; y: 8.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.637; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 37 { x: -22.2; y: 15.1; skew-x: -6.9; skew-y: -6.9; scale-x: 0.638; scale-y: 0.64; }
        frame 38 { x: -24.2; y: 21.9; skew-x: -13.9; skew-y: -13.9; scale-x: 0.639; scale-y: 0.643; }
        frame 39 { x: -26; y: 28.9; skew-x: -20.9; skew-y: -20.9; scale-x: 0.64; scale-y: 0.647; }
        frame 40 { x: -27.4; y: 36; skew-x: -28; skew-y: -28; scale-x: 0.641; scale-y: 0.65; }
        frame 41 { x: -28.5; y: 43.1; skew-x: -35; skew-y: -35; scale-x: 0.642; scale-y: 0.653; }
        frame 42 { x: -29.3; y: 50.3; skew-x: -42; skew-y: -42; scale-x: 0.643; scale-y: 0.656; }
        frame 43 { x: -29.6; y: 57.3; skew-x: -49; skew-y: -49; scale-x: 0.645; scale-y: 0.661; }
        frame 44 { x: -24.4; y: 29.5; skew-x: -22; skew-y: -22; scale-x: 0.633; scale-y: 0.667; }
        frame 45 { x: -14.1; y: 3; skew-x: 4.7; skew-y: 4.7; scale-x: 0.621; scale-y: 0.675; }
        frame 46 { x: 1.5; y: -12.9; skew-x: 31.3; skew-y: 31.3; scale-x: 0.62; scale-y: 0.674; }
        frame 47 { x: 19; y: -24.4; skew-x: 57.9; skew-y: 57.9; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 34.1; y: -27; skew-x: 75.9; skew-y: 74.5; scale-x: 0.619; scale-y: 0.673; }
        frame 49 { x: 48.5; y: -27.5; skew-x: 93.7; skew-y: 91; scale-x: 0.62; scale-y: -10000; }
        frame 50 { x: 62.6; y: -22.6; skew-x: 115.8; skew-y: 111.8; scale-x: -10000; scale-y: 0.672; }
        frame 51 { x: 42.9; y: -28.1; skew-x: 86.2; skew-y: 84.2; scale-y: 0.673; }
        frame 52 { x: 39.4; y: -28; skew-x: 81.5; skew-y: 79.9; scale-x: 0.619; scale-y: -10000; }
        frame 53 { x: 35.8; y: -27.8; skew-x: 76.9; skew-y: 75.5; scale-x: -10000; }
        frame 54 { x: 32; y: -27.4; skew-x: 72.2; skew-y: 71.2; }
        frame 55 { x: 28.4; y: -27.1; skew-x: 67.4; skew-y: 66.7; }
        frame 56 { x: 24.6; y: -26.4; skew-x: 62.7; skew-y: 62.4; }
        frame 57 { x: 20.8; y: -25.7; skew-x: 57.9; skew-y: 57.9; scale-x: 0.62; scale-y: 0.674; }
        frame 58 { x: 22; y: -25.9; skew-x: 59.4; skew-y: 59.4; scale-x: 0.619; scale-y: 0.673; }
        frame 59 { x: 23.2; y: -26.1; skew-x: 60.9; skew-y: 60.9; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 24.5; y: -26.4; skew-x: 62.4; skew-y: 62.4; }
        frame 61 { x: 25.7; y: -26.6; skew-x: 63.9; skew-y: 63.9; scale-x: 0.618; scale-y: 0.672; }
        frame 62 { x: 26.9; y: -26.7; skew-x: 65.4; skew-y: 65.4; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 28.1; y: -26.9; skew-x: 66.9; skew-y: 66.9; }
        frame 64 { x: 29.2; y: -27; skew-x: 68.3; skew-y: 68.3; scale-x: 0.619; scale-y: 0.673; }
        frame 65 { x: 23.8; y: -25.4; skew-x: 61.5; skew-y: 61.5; scale-x: 0.62; scale-y: 0.668; }
        frame 66 { x: 18.3; y: -23.4; skew-x: 54.7; skew-y: 54.7; scale-x: 0.621; scale-y: 0.664; }
        frame 67 { x: 13; y: -21.1; skew-x: 47.9; skew-y: 47.9; scale-x: 0.623; scale-y: 0.66; }
        frame 68 { x: 7.6; y: -18.2; skew-x: 40.9; skew-y: 40.9; scale-x: 0.624; scale-y: 0.657; }
        frame 69 { x: 2.3; y: -15.3; skew-x: 34.1; skew-y: 34.1; scale-x: 0.627; scale-y: 0.654; }
        frame 70 { x: -3.6; y: -9.9; skew-x: 25.6; skew-y: 25.6; scale-x: 0.629; scale-y: 0.649; }
        frame 71 { x: -9.4; y: -4.2; skew-x: 17; skew-y: 17; scale-x: 0.632; scale-y: 0.645; }
        frame 72 { x: -14.8; y: 1.7; skew-x: 8.5; skew-y: 8.5; scale-x: 0.634; scale-y: 0.641; }
        frame 73 { x: -19.8; y: 8.3; skew-x: 0; skew-y: 0; scale-x: 0.637; scale-y: 0.637; }
    }
    Track {
        source-name: "Cabbagepult_stalk4";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 12.2; y: 16.1; skew-x: -0.2; skew-y: -0.2; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_STALK4; }
        frame 6 { x: 11.1; y: 17.4; skew-x: -2.4; skew-y: -2.4; scale-x: 0.798; scale-y: 0.798; cel: -10000; image: none; }
        frame 7 { x: 10.1; y: 18.9; skew-x: -4.9; skew-y: -4.9; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 9.1; y: 20.2; skew-x: -7.4; skew-y: -7.4; }
        frame 9 { x: 8.1; y: 21.6; skew-x: -9.7; skew-y: -9.7; }
        frame 10 { x: 7.1; y: 23.1; skew-x: -12.2; skew-y: -12.2; scale-x: 0.797; scale-y: 0.797; }
        frame 11 { x: 6.1; y: 24.4; skew-x: -14.5; skew-y: -14.5; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 5.1; y: 26; skew-x: -17; skew-y: -17; scale-x: 0.798; scale-y: 0.798; }
        frame 13 { x: 5.3; y: 25.7; skew-x: -17.7; skew-y: -17.7; scale-x: 0.797; scale-y: 0.797; }
        frame 14 { x: 5.5; y: 25.5; skew-x: -18.7; skew-y: -18.7; scale-x: 0.796; scale-y: 0.796; }
        frame 15 { x: 5.7; y: 25.3; skew-x: -19.5; skew-y: -19.5; scale-x: 0.797; scale-y: 0.797; }
        frame 16 { x: 7; y: 23.3; skew-x: -15.7; skew-y: -15.7; scale-x: 0.796; scale-y: 0.796; }
        frame 17 { x: 8.2; y: 21.5; skew-x: -11.7; skew-y: -11.7; scale-x: 0.797; scale-y: 0.797; }
        frame 18 { x: 9.5; y: 19.7; skew-x: -7.9; skew-y: -7.9; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 10.8; y: 17.9; skew-x: -3.9; skew-y: -3.9; scale-x: 0.798; scale-y: 0.798; }
        frame 20 { x: 12.2; y: 16.1; skew-x: -0.2; skew-y: -0.2; scale-x: 0.799; scale-y: 0.799; }
        frame 21 { x: 12.8; y: 15.8; skew-x: 0.5; skew-y: 0.5; scale-x: 0.798; scale-y: 0.798; }
        frame 22 { x: 13.3; y: 15.6; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 13.9; y: 15.2; skew-x: 2; skew-y: 2; }
        frame 24 { x: 14.4; y: 14.9; skew-x: 2.7; skew-y: 2.7; }
        frame 25 { x: 15; y: 14.7; skew-x: 3.5; skew-y: 3.5; }
        frame 26 { x: 15.6; y: 14.4; skew-x: 4.2; skew-y: 4.2; }
        frame 27 { x: 16.1; y: 14.1; skew-x: 4.8; skew-y: 4.8; scale-x: 0.799; scale-y: 0.799; }
        frame 28 { x: 16.7; y: 13.1; skew-x: 7; skew-y: 7; scale-x: 0.798; scale-y: 0.798; }
        frame 29 { x: 17.2; y: 12; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 17.9; y: 11; skew-x: 11; skew-y: 11; }
        frame 31 { x: 16.7; y: 12; skew-x: 8.8; skew-y: 8.8; }
        frame 32 { x: 15.5; y: 12.9; skew-x: 6.5; skew-y: 6.5; }
        frame 33 { x: 14.4; y: 14; skew-x: 4.3; skew-y: 4.3; }
        frame 34 { x: 13.3; y: 15; skew-x: 2; skew-y: 2; }
        frame 35 { x: 12.2; y: 16.1; skew-x: -0.2; skew-y: -0.2; scale-x: 0.799; scale-y: 0.799; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 10; y: 18.9; skew-x: -6.4; skew-y: -6.7; }
        frame 38 { x: 7.7; y: 21.8; skew-x: -12.9; skew-y: -13.2; scale-x: 0.8; scale-y: 0.801; }
        frame 39 { x: 5.7; y: 24.9; skew-x: -19.2; skew-y: -19.7; scale-x: 0.801; scale-y: -10000; }
        frame 40 { x: 3.6; y: 28; skew-x: -25.5; skew-y: -26.3; scale-x: 0.802; scale-y: 0.802; }
        frame 41 { x: 1.6; y: 31.2; skew-x: -31.9; skew-y: -33; scale-x: 0.803; scale-y: 0.803; }
        frame 42 { x: -0.1; y: 34.5; skew-x: -38.2; skew-y: -39.6; scale-x: 0.805; scale-y: 0.804; }
        frame 43 { x: -1.8; y: 37.8; skew-x: -44.6; skew-y: -46.1; scale-x: 0.807; scale-y: 0.807; }
        frame 44 { x: 6.3; y: 25.2; skew-x: -16.7; skew-y: -17.4; scale-x: 0.799; scale-y: 0.799; }
        frame 45 { x: 16.1; y: 14; skew-x: 11.1; skew-y: 11.1; scale-x: 0.793; scale-y: 0.793; }
        frame 46 { x: 22.7; y: 9.3; skew-x: 30.6; skew-y: 30.6; scale-x: 0.792; scale-y: 0.792; }
        frame 47 { x: 29.4; y: 5.7; skew-x: 50.4; skew-y: 50.4; scale-x: 0.793; scale-y: 0.793; }
        frame 48 { x: 34.4; y: 4.2; skew-x: 65.9; skew-y: 65.9; scale-x: 0.791; scale-y: 0.791; }
        frame 49 { x: 38.8; y: 3.3; skew-x: 81.5; skew-y: 81.5; scale-x: 0.79; scale-y: 0.79; }
        frame 50 { x: 42.7; y: 2.7; skew-x: 96.9; skew-y: 96.9; scale-x: 0.791; scale-y: 0.791; }
        frame 51 { x: 41.4; y: 2.8; skew-x: 90.3; skew-y: 90.3; scale-x: 0.79; scale-y: 0.79; }
        frame 52 { x: 39.9; y: 3; skew-x: 83.7; skew-y: 83.7; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 38.3; y: 3.1; skew-x: 77; skew-y: 77; scale-x: 0.791; scale-y: 0.791; }
        frame 54 { x: 36.6; y: 3.5; skew-x: 70.4; skew-y: 70.4; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 35; y: 3.9; skew-x: 63.7; skew-y: 63.7; }
        frame 56 { x: 33.1; y: 4.4; skew-x: 56.9; skew-y: 56.9; }
        frame 57 { x: 31.4; y: 5.1; skew-x: 50.4; skew-y: 50.4; scale-x: 0.793; scale-y: 0.793; }
        frame 58 { x: 31.9; y: -10000; skew-x: 53.2; skew-y: 53.2; scale-x: 0.791; scale-y: 0.791; }
        frame 59 { x: 32.4; skew-x: 55.9; skew-y: 55.9; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 33; y: 5.2; skew-x: 58.9; skew-y: 58.9; }
        frame 61 { x: 33.5; y: -10000; skew-x: 61.7; skew-y: 61.7; scale-x: 0.79; scale-y: 0.79; }
        frame 62 { x: 34; skew-x: 64.4; skew-y: 64.4; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 34.5; y: 5.3; skew-x: 67.2; skew-y: 67.2; }
        frame 64 { x: 35.1; y: 5.5; skew-x: 70; skew-y: 70; scale-x: 0.791; scale-y: 0.791; }
        frame 65 { x: 32.8; y: 5.9; skew-x: 62.2; skew-y: 62.2; scale-x: 0.79; scale-y: 0.79; }
        frame 66 { x: 30.4; y: 6.7; skew-x: 54.4; skew-y: 54.4; scale-x: 0.791; scale-y: 0.791; }
        frame 67 { x: 27.9; y: 7.4; skew-x: 46.6; skew-y: 46.6; scale-x: 0.792; scale-y: 0.792; }
        frame 68 { x: 25.1; y: 8.4; skew-x: 38.6; skew-y: 38.6; scale-x: 0.793; scale-y: 0.793; }
        frame 69 { x: 22.6; y: 9.6; skew-x: 30.9; skew-y: 30.9; scale-x: 0.794; scale-y: 0.794; }
        frame 70 { x: 20; y: 11; skew-x: 23.1; skew-y: 23.1; scale-x: 0.796; scale-y: 0.796; }
        frame 71 { x: 17.4; y: 12.3; skew-x: 15.3; skew-y: 15.3; scale-x: 0.797; scale-y: 0.797; }
        frame 72 { x: 14.8; y: 14; skew-x: 7.7; skew-y: 7.7; scale-x: 0.798; scale-y: 0.798; }
        frame 73 { x: 12.2; y: 16.1; skew-x: -0.2; skew-y: -0.2; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "Cabbagepult_stalk3";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 19.7; y: 13.1; skew-x: 35.4; skew-y: 35.4; scale-x: 0.798; scale-y: 0.798; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_STALK3; }
        frame 6 { x: 18.5; y: 14.1; skew-x: 32.4; skew-y: 32.4; scale-x: 0.797; scale-y: 0.797; cel: -10000; image: none; }
        frame 7 { x: 17.2; y: 15.2; skew-x: 29.3; skew-y: 29.3; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 15.9; y: 16.4; skew-x: 26.3; skew-y: 26.3; scale-x: 0.796; scale-y: 0.796; }
        frame 9 { x: 14.7; y: 17.5; skew-x: 23.3; skew-y: 23.3; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 13.4; y: 18.8; skew-x: 20.1; skew-y: 20.1; }
        frame 11 { x: 12.3; y: 19.9; skew-x: 17.1; skew-y: 17.1; }
        frame 12 { x: 11; y: 21.3; skew-x: 14; skew-y: 14; scale-x: 0.797; scale-y: 0.797; }
        frame 13 { x: 11.3; y: 21.1; skew-x: -10000; skew-y: -10000; scale-x: 0.795; scale-y: 0.795; }
        frame 14 { x: 11.5; y: 20.9; skew-x: 13.8; skew-y: 13.8; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 11.6; y: 20.6; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 16 { x: 13.1; y: 19; skew-x: 18.1; skew-y: 18.1; scale-x: 0.795; scale-y: 0.795; }
        frame 17 { x: 14.8; y: 17.4; skew-x: 22.5; skew-y: 22.5; scale-x: 0.796; scale-y: 0.796; }
        frame 18 { x: 16.2; y: 15.9; skew-x: 26.8; skew-y: 26.8; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 18; y: 14.5; skew-x: 31.1; skew-y: 31.1; scale-x: 0.797; scale-y: 0.797; }
        frame 20 { x: 19.7; y: 13.1; skew-x: 35.4; skew-y: 35.4; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 20.3; y: 13; skew-x: 36.1; skew-y: 36.1; scale-x: 0.797; scale-y: 0.797; }
        frame 22 { x: 20.9; y: 12.6; skew-x: 36.9; skew-y: 36.9; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 21.5; y: 12.4; skew-x: 37.6; skew-y: 37.6; }
        frame 24 { x: 22; y: 12.2; skew-x: 38.3; skew-y: 38.3; }
        frame 25 { x: 22.7; y: 12; skew-x: 39.1; skew-y: 39.1; }
        frame 26 { x: 23.2; y: 11.8; skew-x: 39.8; skew-y: 39.8; }
        frame 27 { x: 23.8; y: 11.5; skew-x: 40.4; skew-y: 40.4; }
        frame 28 { x: 24.9; y: 11.2; skew-x: 45.2; skew-y: 45.2; }
        frame 29 { x: 26; y: 10.9; skew-x: 50.1; skew-y: 50.1; }
        frame 30 { x: 27.2; y: 10.7; skew-x: 55.1; skew-y: 55.1; }
        frame 31 { x: 25.6; y: 11; skew-x: 50.9; skew-y: 50.9; }
        frame 32 { x: 24.3; y: 11.3; skew-x: 47.1; skew-y: 47.1; }
        frame 33 { x: 22.8; y: 11.7; skew-x: 43.3; skew-y: 43.3; }
        frame 34 { x: 21.2; y: 12.4; skew-x: 39.4; skew-y: 39.4; }
        frame 35 { x: 19.7; y: 13.1; skew-x: 35.4; skew-y: 35.4; scale-x: 0.798; scale-y: 0.798; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 17; y: 15.1; skew-x: 30; skew-y: 29.9; scale-x: 0.8; scale-y: 0.797; }
        frame 38 { x: 14.4; y: 17.3; skew-x: 24.3; skew-y: 24.3; scale-x: 0.802; scale-y: 0.796; }
        frame 39 { x: 11.8; y: 19.6; skew-x: 18.7; skew-y: 18.7; scale-x: 0.805; scale-y: 0.795; }
        frame 40 { x: 9.3; y: 22; skew-x: 13.2; skew-y: 13.1; scale-x: 0.807; scale-y: 0.796; }
        frame 41 { x: 6.8; y: 24.5; skew-x: 7.6; skew-y: 7.5; scale-x: 0.809; scale-y: 0.795; }
        frame 42 { x: 4.6; y: 27.1; skew-x: 2.1; skew-y: 1.9; scale-x: 0.811; scale-y: 0.796; }
        frame 43 { x: 2.3; y: 29.8; skew-x: -3.4; skew-y: -3.5; scale-x: 0.816; scale-y: -10000; }
        frame 44 { x: 12.3; y: 20.1; skew-x: 20.1; skew-y: 20; scale-x: 0.803; scale-y: 0.795; }
        frame 45 { x: 23.2; y: 12.7; skew-x: 43.6; skew-y: 43.6; scale-x: 0.794; scale-y: 0.794; }
        frame 46 { x: 29.2; y: 9.8; skew-x: 55.2; skew-y: 55.2; scale-x: 0.793; scale-y: 0.793; }
        frame 47 { x: 34.9; y: 7.3; skew-x: 66.9; skew-y: 66.9; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 38.8; y: 6.7; skew-x: 78.4; skew-y: 78.4; scale-x: 0.791; scale-y: 0.791; }
        frame 49 { x: 42.4; y: 6.5; skew-x: 90; skew-y: 90; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 45.5; y: 6.7; skew-x: 101.4; skew-y: 101.4; }
        frame 51 { x: 44.4; y: 6.8; skew-x: 98.3; skew-y: 98.3; scale-x: 0.79; scale-y: 0.79; }
        frame 52 { x: 43.3; y: 7; skew-x: 95; skew-y: 95; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 42; skew-x: 91.8; skew-y: 91.8; }
        frame 54 { x: 40.9; y: 7.2; skew-x: 88.5; skew-y: 88.5; }
        frame 55 { x: 39.6; y: 7.4; skew-x: 85.3; skew-y: 85.3; }
        frame 56 { x: 38.5; y: 7.6; skew-x: 82.2; skew-y: 82.2; }
        frame 57 { x: 37.3; y: 7.8; skew-x: 79; skew-y: 79; scale-x: 0.792; scale-y: 0.792; }
        frame 58 { x: 37.5; y: -10000; skew-x: 79.2; skew-y: 79.2; scale-x: 0.79; scale-y: 0.79; }
        frame 59 { x: 37.9; skew-x: 79.4; skew-y: 79.4; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 38.1; skew-x: 79.5; skew-y: 79.5; }
        frame 61 { x: 38.4; skew-x: 79.7; skew-y: 79.7; }
        frame 62 { x: 38.6; y: 7.7; skew-x: 80; skew-y: 80; }
        frame 63 { x: 39; y: 7.8; skew-x: 80.2; skew-y: 80.2; }
        frame 64 { y: 7.6; skew-x: 80.5; skew-y: 80.5; scale-x: 0.791; scale-y: 0.791; }
        frame 65 { x: 37; y: 7.8; skew-x: 75.5; skew-y: 75.5; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 35; y: 8.1; skew-x: 70.4; skew-y: 70.4; scale-x: 0.792; scale-y: 0.792; }
        frame 67 { x: 32.9; y: 8.5; skew-x: 65.4; skew-y: 65.4; scale-x: 0.793; scale-y: 0.793; }
        frame 68 { x: 30.6; y: 8.9; skew-x: 60.4; skew-y: 60.4; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 28.5; y: 9.5; skew-x: 55.4; skew-y: 55.4; scale-x: 0.794; scale-y: 0.794; }
        frame 70 { x: 26.3; y: 10.2; skew-x: 50.4; skew-y: 50.4; scale-x: 0.795; scale-y: 0.795; }
        frame 71 { x: 24.1; y: 11; skew-x: 45.4; skew-y: 45.4; scale-x: 0.796; scale-y: 0.796; }
        frame 72 { x: 21.8; y: 11.9; skew-x: 40.4; skew-y: 40.4; scale-x: 0.797; scale-y: 0.797; }
        frame 73 { x: 19.7; y: 13.1; skew-x: 35.4; skew-y: 35.4; scale-x: 0.798; scale-y: 0.798; }
    }
    Track {
        source-name: "Cabbagepult_stalk2";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 24.9; y: 13.2; skew-x: 32.9; skew-y: 32.9; scale-x: 0.798; scale-y: 0.798; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_STALK2; }
        frame 6 { x: 24; y: 13.8; skew-x: 31.1; skew-y: 31.1; scale-x: 0.797; scale-y: 0.797; cel: -10000; image: none; }
        frame 7 { x: 23; y: 14.5; skew-x: 29.3; skew-y: 29.3; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 22; y: 15.2; skew-x: 27.4; skew-y: 27.4; }
        frame 9 { x: 21; y: 15.9; skew-x: 25.6; skew-y: 25.6; }
        frame 10 { x: 20.1; y: 16.5; skew-x: 23.8; skew-y: 23.8; }
        frame 11 { x: 19.1; y: 17.2; skew-x: 21.9; skew-y: 21.9; }
        frame 12 { x: 18.1; y: 17.9; skew-x: 20; skew-y: 20; }
        frame 13 { x: 18.2; y: 17.6; skew-x: 19.9; skew-y: 19.9; scale-x: 0.796; scale-y: 0.796; }
        frame 14 { x: 18.4; y: 17.5; skew-x: 19.8; skew-y: 19.8; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 18.5; y: 17.3; skew-x: 19.6; skew-y: 19.6; scale-x: 0.797; scale-y: 0.797; }
        frame 16 { x: 19.8; y: 16.4; skew-x: 22.3; skew-y: 22.3; scale-x: 0.796; scale-y: 0.796; }
        frame 17 { x: 21.1; y: 15.5; skew-x: 24.9; skew-y: 24.9; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 22.4; y: 14.6; skew-x: 27.6; skew-y: 27.6; scale-x: 0.797; scale-y: 0.797; }
        frame 19 { x: 23.7; y: 13.8; skew-x: 30.3; skew-y: 30.3; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 25; y: 13.1; skew-x: 32.9; skew-y: 32.9; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 25.7; y: 12.9; skew-x: 33.6; skew-y: 33.6; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 26.2; y: 12.7; skew-x: 34.4; skew-y: 34.4; }
        frame 23 { x: 26.8; y: 12.5; skew-x: 35.1; skew-y: 35.1; }
        frame 24 { x: 27.3; y: 12.4; skew-x: 35.8; skew-y: 35.8; }
        frame 25 { x: 27.9; y: 12.2; skew-x: 36.6; skew-y: 36.6; }
        frame 26 { x: 28.6; y: 12.1; skew-x: 37.3; skew-y: 37.3; }
        frame 27 { x: 29; y: 11.9; skew-x: 37.9; skew-y: 37.9; }
        frame 28 { x: 29.4; y: 12; skew-x: 38.6; skew-y: 38.6; }
        frame 29 { x: 29.8; y: 12.1; skew-x: 39.3; skew-y: 39.3; }
        frame 30 { x: 30.1; y: 12.2; skew-x: 39.9; skew-y: 39.9; }
        frame 31 { x: 29.2; y: 12.4; skew-x: 38.6; skew-y: 38.6; }
        frame 32 { x: 28; y: 12.7; skew-x: 37.1; skew-y: 37.1; }
        frame 33 { x: 27.1; y: -10000; skew-x: 35.8; skew-y: 35.8; }
        frame 34 { x: 25.9; y: 12.9; skew-x: 34.4; skew-y: 34.4; }
        frame 35 { x: 24.9; y: 13.2; skew-x: 32.9; skew-y: 32.9; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 37 { x: 22.2; y: 14.6; skew-x: 28.2; skew-y: 28.2; scale-x: 0.8; scale-y: 0.797; }
        frame 38 { x: 19.7; y: 16.3; skew-x: 23.6; skew-y: 23.6; scale-x: 0.803; scale-y: 0.796; }
        frame 39 { x: 17.1; y: 17.9; skew-x: 18.8; skew-y: 18.8; scale-x: 0.804; scale-y: 0.797; }
        frame 40 { x: 14.5; y: 19.7; skew-x: 14.2; skew-y: 14.2; scale-x: 0.807; scale-y: 0.796; }
        frame 41 { x: 11.9; y: 21.6; skew-x: 9.3; skew-y: 9.3; scale-x: 0.81; scale-y: -10000; }
        frame 42 { x: 9.6; y: 23.6; skew-x: 4.7; skew-y: 4.7; scale-x: 0.813; scale-y: 0.795; }
        frame 43 { x: 7.2; y: 25.6; skew-x: 0; skew-y: 0; scale-x: 0.816; scale-y: 0.797; }
        frame 44 { x: 17.7; y: 19; skew-x: 17.8; skew-y: 17.8; scale-x: 0.804; scale-y: 0.796; }
        frame 45 { x: 28.6; y: 13.9; skew-x: 35.6; skew-y: 35.6; scale-x: 0.795; scale-y: 0.795; }
        frame 46 { x: 33.5; y: 12.1; skew-x: 44.2; skew-y: 44.2; scale-x: 0.794; scale-y: 0.794; }
        frame 47 { x: 38.4; y: 10.7; skew-x: 53.2; skew-y: 53.2; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 40.5; y: 10.3; skew-x: 59.7; skew-y: 59.7; scale-x: 0.793; scale-y: 0.793; }
        frame 49 { x: 42.9; y: 10.1; skew-x: 66.2; skew-y: 66.2; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 45; y: 10.2; skew-x: 72.8; skew-y: 72.8; }
        frame 51 { x: 44; y: -10000; skew-x: 70; skew-y: 70; scale-x: 0.792; scale-y: 0.792; }
        frame 52 { x: 43.1; skew-x: 67.2; skew-y: 67.2; scale-x: 0.793; scale-y: 0.793; }
        frame 53 { x: 42.2; skew-x: 64.2; skew-y: 64.2; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 41.1; y: 10.3; skew-x: 61.5; skew-y: 61.5; }
        frame 55 { x: 40.2; y: -10000; skew-x: 58.7; skew-y: 58.7; }
        frame 56 { x: 39.3; y: 10.5; skew-x: 55.9; skew-y: 55.9; }
        frame 57 { x: 38.4; y: 10.7; skew-x: 53.2; skew-y: 53.2; scale-x: 0.794; scale-y: 0.794; }
        frame 58 { x: 38.6; y: -10000; skew-x: 54.4; skew-y: 54.4; scale-x: 0.793; scale-y: 0.793; }
        frame 59 { x: 39.1; skew-x: 55.7; skew-y: 55.7; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 39.5; skew-x: 57; skew-y: 57; }
        frame 61 { x: 39.9; skew-x: 58.2; skew-y: 58.2; }
        frame 62 { x: 40.1; skew-x: 59.7; skew-y: 59.7; }
        frame 63 { x: 40.6; skew-x: 60.9; skew-y: 60.9; scale-x: 0.792; scale-y: 0.792; }
        frame 64 { x: 41; y: 10.9; skew-x: 62.3; skew-y: 62.3; scale-x: 0.793; scale-y: 0.793; }
        frame 65 { x: 39.2; y: -10000; skew-x: 58.9; skew-y: 58.9; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 37.4; y: 11.1; skew-x: 55.7; skew-y: 55.7; scale-x: 0.794; scale-y: 0.794; }
        frame 67 { x: 35.7; y: 11.2; skew-x: 52.4; skew-y: 52.4; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 34; y: 11.4; skew-x: 49.2; skew-y: 49.2; scale-x: 0.795; scale-y: 0.795; }
        frame 69 { x: 32.1; y: 11.7; skew-x: 45.9; skew-y: 45.9; scale-x: 0.796; scale-y: 0.796; }
        frame 70 { x: 30.4; y: 12; skew-x: 42.6; skew-y: 42.6; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 28.7; y: 12.3; skew-x: 39.6; skew-y: 39.6; scale-x: 0.797; scale-y: 0.797; }
        frame 72 { x: 26.9; y: 12.8; skew-x: 36.1; skew-y: 36.1; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 24.9; y: 13.2; skew-x: 32.9; skew-y: 32.9; scale-x: 0.798; scale-y: 0.798; }
    }
    Track {
        source-name: "Cabbagepult_stalk1";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 31.8; y: 21.7; skew-x: 2.8; skew-y: 2.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_STALK1; }
        frame 6 { x: 30.9; y: 22.1; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 30.1; y: 22.6; skew-x: -0.9; skew-y: -0.9; }
        frame 8 { x: 29.2; y: 22.9; skew-x: -2.7; skew-y: -2.7; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 28.3; y: 23.3; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 27.4; y: 23.8; skew-x: -6.7; skew-y: -6.7; }
        frame 11 { x: 26.6; y: 24.3; skew-x: -8.5; skew-y: -8.5; }
        frame 12 { x: 25.8; y: 24.8; skew-x: -10.5; skew-y: -10.5; }
        frame 13 { x: 26; y: 24.6; skew-x: -9.9; skew-y: -9.9; }
        frame 14 { x: 26.2; y: 24.3; skew-x: -9.5; skew-y: -9.5; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 26.4; y: 24.2; skew-x: -9.2; skew-y: -9.2; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 27.5; y: 23.6; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 28.5; y: 23.2; skew-x: -4.2; skew-y: -4.2; }
        frame 18 { x: 29.6; y: 22.5; skew-x: -1.9; skew-y: -1.9; }
        frame 19 { x: 30.6; y: 22.1; skew-x: 0.5; skew-y: 0.5; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { x: 31.8; y: 21.6; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 32.1; y: 21.5; skew-x: 3.3; skew-y: 3.3; }
        frame 22 { x: 32.5; y: 21.4; skew-x: 4.1; skew-y: 4.1; }
        frame 23 { x: 33; y: 21.5; skew-x: 4.8; skew-y: 4.8; }
        frame 24 { x: 33.4; y: 21.4; skew-x: 5.5; skew-y: 5.5; }
        frame 25 { x: 33.8; y: 21.3; skew-x: 6.3; skew-y: 6.3; }
        frame 26 { x: 34.2; y: -10000; skew-x: 7; skew-y: 7; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: 34.6; skew-x: 7.8; skew-y: 7.8; scale-x: 0.8; scale-y: 0.8; }
        frame 28 { x: 34.9; y: 21.4; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 29 { x: 35; y: 21.5; skew-x: 9; skew-y: 9; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 35.3; y: 21.6; skew-x: 9.8; skew-y: 9.8; }
        frame 31 { x: 34.6; y: -10000; skew-x: 8.3; skew-y: 8.3; }
        frame 32 { x: 33.9; skew-x: 6.8; skew-y: 6.8; }
        frame 33 { x: 33.3; y: 21.7; skew-x: 5.5; skew-y: 5.5; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: 32.5; y: -10000; skew-x: 4; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 31.8; skew-x: 2.8; skew-y: 2.8; }
        frame 36 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 37 { x: 29.8; y: 22.4; skew-x: -0.4; skew-y: -0.7; scale-x: 0.802; }
        frame 38 { x: 28; y: 23.3; skew-x: -3.9; skew-y: -4.2; scale-x: 0.804; }
        frame 39 { x: 26.1; y: 24.2; skew-x: -7.2; skew-y: -7.7; scale-x: 0.806; }
        frame 40 { x: 24.4; y: 25.1; skew-x: -10.7; skew-y: -11.2; scale-x: 0.808; }
        frame 41 { x: 22.5; y: 26.1; skew-x: -14.2; skew-y: -14.9; scale-x: 0.811; }
        frame 42 { x: 20.7; y: 27.1; skew-x: -17.5; skew-y: -18.4; scale-x: 0.813; }
        frame 43 { x: 18.7; y: 28.1; skew-x: -21; skew-y: -22; scale-x: 0.816; scale-y: 0.801; }
        frame 44 { x: 27; y: 24.7; skew-x: -3.5; skew-y: -4.1; scale-x: 0.806; scale-y: 0.799; }
        frame 45 { x: 35.3; y: 22.5; skew-x: 13.6; skew-y: 13.6; scale-x: 0.797; scale-y: 0.797; }
        frame 46 { x: 39.1; y: 21.6; skew-x: 24.8; skew-y: 24.8; scale-x: 0.796; scale-y: 0.796; }
        frame 47 { x: 42.8; y: 21.2; skew-x: 36.2; skew-y: 36.2; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 43.3; y: 21.3; skew-x: 35.6; skew-y: 35.6; scale-x: 0.795; scale-y: 0.795; }
        frame 49 { x: 43.9; y: 21.4; skew-x: 35.3; skew-y: 35.3; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 44.5; y: 21.5; skew-x: 34.9; skew-y: 34.9; scale-x: 0.796; scale-y: 0.796; }
        frame 51 { x: 44.1; y: -10000; skew-x: 34.4; skew-y: 34.4; scale-x: 0.795; scale-y: 0.795; }
        frame 52 { x: 43.8; y: 21.4; skew-x: 34.1; skew-y: 34.1; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 43.4; y: -10000; skew-x: 33.6; skew-y: 33.6; }
        frame 54 { x: 43; y: 21.3; skew-x: 33.1; skew-y: 33.1; }
        frame 55 { x: 42.5; y: 21.2; skew-x: 32.6; skew-y: 32.6; }
        frame 56 { x: 42.1; y: 21.3; skew-x: 32.3; skew-y: 32.3; }
        frame 57 { x: 41.9; y: 21.2; skew-x: 31.9; skew-y: 31.9; scale-x: 0.796; scale-y: 0.796; }
        frame 58 { x: 42; y: 21.3; skew-x: 32.1; skew-y: 32.1; scale-x: 0.795; scale-y: 0.795; }
        frame 59 { x: 42.1; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 42.3; y: 21.5; skew-x: 32.3; skew-y: 32.3; }
        frame 61 { x: 42.4; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 62 { x: 42.6; y: 21.6; skew-x: 32.6; skew-y: 32.6; }
        frame 63 { x: -10000; y: 21.7; skew-x: -10000; skew-y: -10000; }
        frame 64 { y: -10000; skew-x: 32.9; skew-y: 32.9; scale-x: 0.796; scale-y: 0.796; }
        frame 65 { x: 41.5; y: 21.5; skew-x: 29.5; skew-y: 29.5; scale-x: 0.795; scale-y: 0.795; }
        frame 66 { x: 40.3; y: 21.4; skew-x: 26.1; skew-y: 26.1; scale-x: 0.796; scale-y: 0.796; }
        frame 67 { x: 39.1; y: -10000; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 37.9; y: 21.3; skew-x: 19.3; skew-y: 19.3; scale-x: 0.797; scale-y: 0.797; }
        frame 69 { x: 36.7; y: -10000; skew-x: 16; skew-y: 16; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 35.5; skew-x: 12.8; skew-y: 12.8; scale-x: 0.798; scale-y: 0.798; }
        frame 71 { x: 34.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.799; scale-y: 0.799; }
        frame 72 { x: 33; y: 21.5; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 31.8; y: 21.7; skew-x: 2.8; skew-y: 2.8; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cabbagepult_leaf";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 32.6; y: 11.3; skew-x: 7.8; skew-y: 7.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_LEAF; }
        frame 6 { x: 30.9; y: 11.7; skew-x: 3.3; skew-y: 3.3; scale-x: 0.799; scale-y: 0.799; cel: -10000; image: none; }
        frame 7 { x: 29.2; y: 12.3; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 27.5; y: 12.9; skew-x: -5.7; skew-y: -5.7; }
        frame 9 { x: 26; y: 13.6; skew-x: -10.2; skew-y: -10.2; scale-x: 0.798; scale-y: 0.798; }
        frame 10 { x: 24.4; y: 14.2; skew-x: -14.7; skew-y: -14.7; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 23; y: 15; skew-x: -19.4; skew-y: -19.4; }
        frame 12 { x: 21.5; y: 15.7; skew-x: -24; skew-y: -24; }
        frame 13 { x: 20.8; y: 16.4; skew-x: -28.7; skew-y: -28.7; scale-x: 0.797; scale-y: 0.797; }
        frame 14 { x: 20.2; y: 17.2; skew-x: -33.5; skew-y: -33.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 19.8; y: 18; skew-x: -38.5; skew-y: -38.5; scale-x: 0.798; scale-y: 0.798; }
        frame 16 { x: 21.8; y: 16.4; skew-x: -29.2; skew-y: -29.2; scale-x: 0.797; scale-y: 0.797; }
        frame 17 { x: 24.1; y: 14.9; skew-x: -19.9; skew-y: -19.9; scale-x: 0.798; scale-y: 0.798; }
        frame 18 { x: 26.7; y: 13.5; skew-x: -10.5; skew-y: -10.5; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 29.5; y: 12.3; skew-x: -1.2; skew-y: -1.2; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { x: 32.6; y: 11.3; skew-x: 7.8; skew-y: 7.8; scale-x: 0.8; scale-y: 0.8; }
        frame 21 { x: 33.5; y: 11.1; skew-x: 10.5; skew-y: 10.5; scale-x: 0.799; scale-y: 0.799; }
        frame 22 { x: 34.6; y: 11; skew-x: 13.3; skew-y: 13.3; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 35.7; y: 10.8; skew-x: 16.1; skew-y: 16.1; }
        frame 24 { x: 36.7; y: -10000; skew-x: 18.8; skew-y: 18.8; scale-x: 0.798; scale-y: 0.798; }
        frame 25 { x: 37.8; y: 10.7; skew-x: 21.8; skew-y: 21.8; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 38.9; y: -10000; skew-x: 24.6; skew-y: 24.6; }
        frame 27 { x: 40; skew-x: 27.4; skew-y: 27.4; scale-x: 0.799; scale-y: 0.799; }
        frame 28 { x: 41.4; y: 11.3; skew-x: 31.8; skew-y: 31.8; scale-x: 0.797; scale-y: 0.797; }
        frame 29 { x: 42.8; y: 11.8; skew-x: 36.1; skew-y: 36.1; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 44.3; y: 12.3; skew-x: 40.7; skew-y: 40.7; scale-x: 0.798; scale-y: 0.798; }
        frame 31 { x: 41.9; y: 11.9; skew-x: 34.1; skew-y: 34.1; scale-x: 0.797; scale-y: 0.797; }
        frame 32 { x: 39.5; y: 11.5; skew-x: 27.5; skew-y: 27.5; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 37.1; y: 11.3; skew-x: 20.8; skew-y: 20.8; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 34.9; y: -10000; skew-x: 14.3; skew-y: 14.3; scale-x: 0.799; scale-y: 0.799; }
        frame 35 { x: 32.6; skew-x: 7.8; skew-y: 7.8; scale-x: 0.8; scale-y: 0.8; }
        frame 36 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 29.1; y: 12.5; skew-x: 1; skew-y: 1; scale-x: 0.799; scale-y: 0.799; }
        frame 38 { x: 25.8; y: 13.8; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 22.5; y: 15.2; skew-x: -11.9; skew-y: -11.9; }
        frame 40 { x: 19.3; y: 16.8; skew-x: -18.5; skew-y: -18.5; scale-x: 0.798; scale-y: 0.798; }
        frame 41 { x: 16.2; y: 18.4; skew-x: -25.2; skew-y: -25.2; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 13.4; y: 20; skew-x: -31.7; skew-y: -31.7; scale-x: 0.797; scale-y: 0.797; }
        frame 43 { x: 10.6; y: 21.7; skew-x: -38.5; skew-y: -38.5; scale-x: 0.798; scale-y: 0.798; }
        frame 44 { x: 19.6; y: 19.1; skew-x: -40.8; skew-y: -34.5; scale-x: 0.807; scale-y: 0.797; }
        frame 45 { x: 28.5; y: 16.5; skew-x: -43.3; skew-y: -30.4; scale-x: 0.819; scale-y: 0.798; }
        frame 46 { x: 33.4; y: 14.1; skew-x: -31.2; skew-y: -18; scale-x: 0.813; scale-y: 0.802; }
        frame 47 { x: 38.5; y: 11.8; skew-x: -19.2; skew-y: -5.7; scale-x: 0.809; scale-y: 0.808; }
        frame 48 { x: 42.6; y: -10000; skew-x: -5.2; skew-y: 8.5; scale-x: 0.805; scale-y: 0.813; }
        frame 49 { x: 47; y: 12.2; skew-x: 8.5; skew-y: 22.8; scale-x: 0.8; scale-y: 0.817; }
        frame 50 { x: 51.5; y: 13.1; skew-x: 22.6; skew-y: 37.2; scale-x: 0.797; scale-y: 0.823; }
        frame 51 { x: 51; y: 13; skew-x: -10000; skew-y: 36.3; scale-x: 0.796; scale-y: 0.819; }
        frame 52 { x: 50.4; skew-y: 35.4; scale-x: -10000; scale-y: 0.817; }
        frame 53 { x: 49.9; y: 12.9; skew-y: 34.6; scale-y: 0.814; }
        frame 54 { x: 49.3; y: 12.8; skew-y: 33.8; scale-y: 0.812; }
        frame 55 { x: 48.7; y: 12.7; skew-y: 32.8; scale-y: 0.81; }
        frame 56 { x: 48.1; y: 12.6; skew-y: 32.1; scale-y: 0.807; }
        frame 57 { x: 47.5; y: 12.4; skew-y: 31.2; scale-x: 0.797; scale-y: 0.806; }
        frame 58 { x: 47.7; y: 12.5; skew-y: 32.1; scale-x: 0.796; scale-y: 0.807; }
        frame 59 { x: 48; y: -10000; skew-y: 32.8; scale-x: -10000; scale-y: 0.81; }
        frame 60 { x: 48.3; y: 12.6; skew-y: 33.8; scale-y: 0.812; }
        frame 61 { x: 48.5; y: 12.5; skew-y: 34.6; scale-y: 0.814; }
        frame 62 { x: 48.8; y: -10000; skew-y: 35.4; scale-y: 0.817; }
        frame 63 { x: 49.1; skew-y: 36.3; scale-y: 0.819; }
        frame 64 { x: 49.4; skew-y: 37.2; scale-x: 0.797; scale-y: 0.823; }
        frame 65 { x: 47.5; y: 12.4; skew-x: 20.8; skew-y: 33.9; scale-x: 0.796; scale-y: 0.819; }
        frame 66 { x: 45.8; y: 12.2; skew-x: 19.3; skew-y: 30.6; scale-x: 0.797; scale-y: 0.817; }
        frame 67 { x: 43.9; y: 12; skew-x: 17.6; skew-y: 27.3; scale-x: -10000; scale-y: 0.814; }
        frame 68 { x: 42; y: 11.8; skew-x: 16; skew-y: 24.1; scale-y: 0.812; }
        frame 69 { x: 40.1; y: 11.7; skew-x: 14.3; skew-y: 20.8; scale-x: 0.798; scale-y: 0.809; }
        frame 70 { x: 38.3; y: -10000; skew-x: 12.6; skew-y: 17.5; scale-x: -10000; scale-y: 0.807; }
        frame 71 { x: 36.3; y: 11.5; skew-x: 11; skew-y: 14.3; scale-y: 0.804; }
        frame 72 { x: 34.5; y: 11.6; skew-x: 9.3; skew-y: 11; scale-x: 0.799; scale-y: 0.802; }
        frame 73 { x: 32.6; y: 11.3; skew-x: 7.8; skew-y: 7.8; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 14.8; y: 29.1; skew-x: -3.1; skew-y: -3.1; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_HEAD; }
        frame 6 { x: 14.4; y: 29.9; skew-x: -4.4; skew-y: -4.4; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 13.8; y: 30.6; skew-x: -5.6; skew-y: -5.6; }
        frame 8 { x: 13.6; y: 31.3; skew-x: -6.6; skew-y: -6.6; }
        frame 9 { x: 13.2; y: 32; skew-x: -7.8; skew-y: -7.8; }
        frame 10 { x: 12.9; y: 32.7; skew-x: -8.7; skew-y: -8.7; }
        frame 11 { x: 12.5; y: 33.4; skew-x: -9.9; skew-y: -9.9; }
        frame 12 { x: 12.1; y: 34.3; skew-x: -11.2; skew-y: -11.2; }
        frame 13 { x: 12.3; y: 33.8; skew-x: -10.4; skew-y: -10.4; }
        frame 14 { x: 12.6; y: 33.3; skew-x: -9.7; skew-y: -9.7; }
        frame 15 { x: 12.7; y: 33; skew-x: -9.1; skew-y: -9.1; }
        frame 16 { x: 13; y: 32.3; skew-x: -8.1; skew-y: -8.1; }
        frame 17 { x: 13.5; y: 31.5; skew-x: -6.8; skew-y: -6.8; }
        frame 18 { x: 13.9; y: 30.7; skew-x: -5.6; skew-y: -5.6; }
        frame 19 { x: 14.3; y: 29.9; skew-x: -4.4; skew-y: -4.4; }
        frame 20 { x: 14.8; y: 29.1; skew-x: -3.1; skew-y: -3.1; }
        frame 21 { x: 15.1; y: 28.9; skew-x: -2.6; skew-y: -2.6; }
        frame 22 { x: 15.6; y: 28.6; skew-x: -1.8; skew-y: -1.8; }
        frame 23 { x: 15.9; y: 28.4; skew-x: -1.1; skew-y: -1.1; }
        frame 24 { x: 16.3; y: 28.1; skew-x: -0.3; skew-y: -0.3; }
        frame 25 { x: 16.7; y: 27.9; skew-x: 0.3; skew-y: 0.3; }
        frame 26 { x: 17.2; y: 27.7; skew-x: 1; skew-y: 1; }
        frame 27 { x: 17.5; y: 27.3; skew-x: 1.8; skew-y: 1.8; }
        frame 28 { x: 17.1; y: 27.6; skew-x: 1.1; skew-y: 1.1; }
        frame 29 { x: 16.8; y: 27.8; skew-x: 0.5; skew-y: 0.5; }
        frame 30 { x: 16.4; y: 28; skew-x: -0.1; skew-y: -0.1; }
        frame 31 { x: 16.1; y: 28.2; skew-x: -0.6; skew-y: -0.6; }
        frame 32 { x: 15.7; y: 28.4; skew-x: -1.3; skew-y: -1.3; }
        frame 33 { x: 15.4; y: 28.7; skew-x: -1.9; skew-y: -1.9; }
        frame 34 { x: 15; y: 29; skew-x: -2.6; skew-y: -2.6; }
        frame 35 { x: 14.8; y: 29.1; skew-x: -3.1; skew-y: -3.1; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 37 { x: 13.6; y: 30; skew-x: -5.2; skew-y: -6.1; scale-x: 0.797; scale-y: 0.802; }
        frame 38 { x: 12.5; y: 31.1; skew-x: -7.2; skew-y: -8.9; scale-x: 0.795; scale-y: 0.805; }
        frame 39 { x: 11.4; y: 32; skew-x: -9; skew-y: -11.8; scale-x: 0.793; scale-y: 0.808; }
        frame 40 { x: 10.3; y: 33.1; skew-x: -11; skew-y: -14.8; scale-x: 0.791; scale-y: 0.81; }
        frame 41 { x: 9.2; y: 34.2; skew-x: -13.1; skew-y: -17.7; scale-x: 0.788; scale-y: 0.813; }
        frame 42 { x: 8.2; y: 35.4; skew-x: -15.1; skew-y: -20.7; scale-x: 0.786; scale-y: 0.816; }
        frame 43 { x: 7.1; y: 36.8; skew-x: -17.3; skew-y: -23.8; scale-x: 0.784; scale-y: 0.819; }
        frame 44 { x: 11.3; y: 33; skew-x: -9.8; skew-y: -13.1; scale-x: 0.791; scale-y: 0.808; }
        frame 45 { x: 15.9; y: 29.6; skew-x: -2.6; skew-y: -2.6; scale-x: 0.798; scale-y: 0.798; }
        frame 46 { x: 17.7; y: 28; skew-x: 1; skew-y: 1; scale-x: 0.797; scale-y: 0.797; }
        frame 47 { x: 19.7; y: 26.3; skew-x: 4.9; skew-y: 4.9; scale-x: 0.798; scale-y: 0.798; }
        frame 48 { x: 20.5; y: 26.5; skew-x: 4.8; skew-y: 7; scale-x: 0.802; scale-y: 0.794; }
        frame 49 { x: 21.5; y: 26.6; skew-x: 4.9; skew-y: 9.3; scale-x: 0.807; scale-y: 0.791; }
        frame 50 { x: 22.4; y: 26.8; skew-x: 5; skew-y: 11.6; scale-x: 0.812; scale-y: 0.789; }
        frame 51 { x: 22; y: -10000; skew-x: 4.9; skew-y: 10.5; scale-x: 0.809; scale-y: 0.79; }
        frame 52 { x: 21.6; y: 26.7; skew-x: -10000; skew-y: 9.6; scale-x: 0.807; scale-y: 0.791; }
        frame 53 { x: 21.2; y: 26.6; skew-y: 8.6; scale-x: 0.805; scale-y: 0.792; }
        frame 54 { x: 20.8; y: -10000; skew-y: 7.8; scale-x: 0.804; scale-y: 0.793; }
        frame 55 { x: 20.4; y: 26.5; skew-x: 4.8; skew-y: 6.8; scale-x: 0.801; scale-y: 0.795; }
        frame 56 { x: 20; y: -10000; skew-x: -10000; skew-y: 5.8; scale-x: 0.799; scale-y: 0.796; }
        frame 57 { x: 19.7; y: 26.3; skew-x: 4.9; skew-y: 4.9; scale-x: 0.798; scale-y: 0.798; }
        frame 58 { x: -10000; y: 26.5; skew-x: 4.8; skew-y: 5.1; scale-x: -10000; scale-y: 0.797; }
        frame 59 { x: 19.9; y: 26.6; skew-x: -10000; skew-y: 5.3; scale-y: 0.796; }
        frame 60 { x: 20; y: 26.5; skew-y: 5.6; scale-x: 0.799; scale-y: -10000; }
        frame 61 { x: 20.1; y: 26.6; skew-y: 5.8; scale-x: -10000; scale-y: 0.795; }
        frame 62 { x: 20.2; y: -10000; skew-y: 6.3; scale-x: 0.8; scale-y: 0.794; }
        frame 63 { x: 20.4; y: 26.7; skew-y: 6.5; scale-x: -10000; scale-y: 0.793; }
        frame 64 { x: 20.5; y: 26.6; skew-x: 4.9; skew-y: 6.8; scale-x: 0.802; scale-y: 0.794; }
        frame 65 { x: 20.1; y: 26.5; skew-x: 4.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.795; }
        frame 66 { x: 19.7; y: -10000; skew-x: -10000; skew-y: 4.8; scale-x: 0.797; scale-y: 0.797; }
        frame 67 { x: 19; y: 26.8; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 18.2; y: 27.3; skew-x: 2.3; skew-y: 2.3; }
        frame 69 { x: 17.4; y: 27.7; skew-x: 1; skew-y: 1; scale-x: 0.798; scale-y: 0.798; }
        frame 70 { x: 16.7; y: 28.1; skew-x: -0.1; skew-y: -0.1; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 16.1; y: 28.5; skew-x: -1.1; skew-y: -1.1; }
        frame 72 { x: 15.5; y: 28.9; skew-x: -2.1; skew-y: -2.1; scale-x: 0.799; scale-y: 0.799; }
        frame 73 { x: 14.8; y: 29.1; skew-x: -3.1; skew-y: -3.1; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Cabbagepult_blink";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { x: 43; y: 48.3; skew-x: -2.7; skew-y: -2.7; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_BLINK1; }
        frame 2 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_CABBAGEPULT_BLINK2; }
        frame 3 { image: IMAGE_REANIM_CABBAGEPULT_BLINK1; }
        frame 4 { cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 47 { x: 44.8; y: 49.3; skew-x: 4.3; skew-y: 4.3; scale-x: 0.798; scale-y: 0.798; cel: 0; }
        frame 48 { x: 45.5; y: 49.1; skew-x: 6.4; skew-y: 9.8; scale-x: 0.799; scale-y: 0.801; cel: -10000; image: IMAGE_REANIM_CABBAGEPULT_BLINK2; }
        frame 49 { x: 45.6; y: -10000; skew-x: 6.3; skew-y: -10000; scale-x: -10000; scale-y: 0.8; image: none; }
        frame 50 { x: 45.8; skew-x: 6.4; scale-y: 0.801; }
        frame 51 { x: 45.4; y: 49.3; skew-x: 6.3; skew-y: 8; scale-y: 0.8; }
        frame 52 { x: 44.9; y: 49.1; skew-x: 6.4; skew-y: 6.4; scale-y: 0.799; }
        frame 53 { x: 45; y: 49.2; skew-x: 6.3; skew-y: 6.3; scale-y: -10000; }
        frame 54 { y: 49.3; skew-x: -10000; skew-y: -10000; }
        frame 55 { x: 45.1; y: -10000; }
        frame 56 { x: 45.2; y: 49.2; skew-x: 6.4; skew-y: 6.4; }
        frame 57 { x: 45.1; y: -10000; skew-x: 5.3; skew-y: 5.3; }
        frame 58 { x: -10000; y: 49.3; skew-x: 4.3; skew-y: 4.3; image: IMAGE_REANIM_CABBAGEPULT_BLINK1; }
        frame 59 { y: -10000; skew-x: -10000; skew-y: -10000; image: none; }
        frame 60 { cel: -1; }
        frame 61 { cel: -10000; }
    }
    Track {
        source-name: "Cabbagepult_eyebrow2";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 51.4; y: 42.5; skew-x: 14.6; skew-y: 14.6; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_EYEBROW; }
        frame 6 { x: -10000; y: 42.2; skew-x: 14.5; skew-y: 14.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 42; skew-x: -10000; skew-y: -10000; }
        frame 8 { x: 51.3; y: 41.8; }
        frame 9 { x: -10000; y: 41.5; }
        frame 10 { x: 51.2; y: 41.4; }
        frame 11 { x: -10000; y: 41.1; }
        frame 12 { x: 51.1; y: 41; skew-x: 14.6; skew-y: 14.6; }
        frame 13 { x: 51.2; y: 41.1; skew-x: 14.5; skew-y: 14.5; }
        frame 14 { x: -10000; y: 41.4; skew-x: -10000; skew-y: -10000; }
        frame 15 { x: 51.3; y: 41.5; }
        frame 16 { x: -10000; y: 41.7; }
        frame 17 { y: 41.9; }
        frame 18 { x: 51.4; y: 42.1; }
        frame 19 { x: -10000; y: 42.3; }
        frame 20 { y: 42.5; skew-x: 14.6; skew-y: 14.6; }
        frame 21 { x: 51.6; y: 42.2; skew-x: 14.5; skew-y: 14.5; }
        frame 22 { x: 51.8; y: 42; skew-x: -10000; skew-y: -10000; }
        frame 23 { x: 52; y: 41.8; }
        frame 24 { x: 52.1; y: 41.5; }
        frame 25 { x: 52.3; y: 41.4; }
        frame 26 { x: 52.5; y: 41.1; }
        frame 27 { x: 52.6; y: 41; skew-x: 14.6; skew-y: 14.6; }
        frame 28 { x: 52.5; skew-x: 14.5; skew-y: 14.5; }
        frame 29 { x: 52.4; y: 41.3; skew-x: -10000; skew-y: -10000; }
        frame 30 { x: 52.2; y: 41.4; }
        frame 31 { x: 52; y: 41.6; }
        frame 32 { x: 51.9; y: 41.8; }
        frame 33 { x: 51.7; y: 42; }
        frame 34 { x: 51.5; y: 42.1; }
        frame 35 { x: 51.4; y: 42.5; skew-x: 14.6; skew-y: 14.6; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 37 { x: 51.3; y: 42; skew-x: 15.3; skew-y: 15.3; }
        frame 38 { x: -10000; y: 41.5; skew-x: 16.3; skew-y: 16.3; }
        frame 39 { x: 51.1; y: 40.9; skew-x: 17.1; skew-y: 17.1; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 51; y: 40.3; skew-x: 18; skew-y: 18; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 50.9; y: 39.9; skew-x: 18.8; skew-y: 18.8; }
        frame 42 { x: 50.8; y: 39.3; skew-x: 19.8; skew-y: 19.8; }
        frame 43 { x: 50.7; y: 38.8; skew-x: 20.6; skew-y: 20.6; scale-x: 0.799; scale-y: 0.799; }
        frame 44 { x: 50.6; y: 41.1; skew-x: 13.3; skew-y: 13.3; scale-x: 0.798; scale-y: 0.798; }
        frame 45 { x: 50.4; y: 43.5; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 50.5; y: 46; skew-x: -1.4; skew-y: -1.4; }
        frame 47 { x: -10000; y: 48.5; skew-x: -8.7; skew-y: -8.7; }
        frame 48 { x: 50.6; y: 51.1; skew-x: -16.2; skew-y: -16.2; }
        frame 49 { x: 50.8; y: 51.2; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 50 { x: 50.9; y: 51.1; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { x: 50.8; y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 52 { x: 50.6; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: -10000; y: 51.2; scale-x: 0.797; scale-y: 0.797; }
        frame 54 { x: 50.7; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 50.8; }
        frame 56 { x: 50.9; }
        frame 57 { x: -10000; y: 51.1; scale-x: 0.798; scale-y: 0.798; }
        frame 58 { x: 51.1; y: 49.5; skew-x: -9.7; skew-y: -9.7; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 51.4; y: 48; skew-x: -3.2; skew-y: -3.2; }
        frame 60 { x: 51.6; y: 46.5; skew-x: 3; skew-y: 3; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: -10000; y: 46.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { y: 46.3; }
        frame 63 { y: 46.2; }
        frame 64 { y: 46.1; }
        frame 65 { y: 45.7; skew-x: 4.3; skew-y: 4.3; }
        frame 66 { y: 45.3; skew-x: 5.5; skew-y: 5.5; }
        frame 67 { y: 44.9; skew-x: 6.8; skew-y: 6.8; }
        frame 68 { x: 51.5; y: 44.5; skew-x: 8; skew-y: 8; }
        frame 69 { x: -10000; y: 44.1; skew-x: 9.3; skew-y: 9.3; }
        frame 70 { y: 43.6; skew-x: 10.6; skew-y: 10.6; }
        frame 71 { x: 51.4; y: 43.3; skew-x: 11.8; skew-y: 11.8; }
        frame 72 { x: -10000; y: 42.9; skew-x: 13.3; skew-y: 13.3; }
        frame 73 { y: 42.5; skew-x: 14.6; skew-y: 14.6; }
    }
    Track {
        source-name: "Cabbagepult_eyebrow1";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 47.1; y: 43.1; skew-x: 147.2; skew-y: -32.7; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_EYEBROW; }
        frame 6 { x: 46.9; y: 43; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; cel: -10000; image: none; }
        frame 7 { x: 46.6; y: 42.9; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 46.4; y: 42.6; }
        frame 9 { x: 46.1; y: 42.5; }
        frame 10 { x: 45.9; y: 42.3; }
        frame 11 { x: 45.6; y: 42.1; }
        frame 12 { x: 45.4; y: 41.9; scale-x: 0.799; scale-y: 0.799; }
        frame 13 { x: 45.6; y: 42.1; scale-x: 0.797; scale-y: 0.797; }
        frame 14 { x: 45.9; y: 42.3; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 46; y: 42.4; }
        frame 16 { x: 46.3; y: 42.6; }
        frame 17 { x: 46.5; y: 42.8; }
        frame 18 { x: 46.7; y: 42.9; }
        frame 19 { x: 47; y: 43; }
        frame 20 { x: 47.1; y: 43.1; scale-x: 0.799; scale-y: 0.799; }
        frame 21 { x: -10000; y: 43; scale-x: 0.797; scale-y: 0.797; }
        frame 22 { y: 42.9; scale-x: -10000; scale-y: -10000; }
        frame 23 { y: 42.6; }
        frame 24 { y: 42.5; }
        frame 25 { y: 42.3; }
        frame 26 { y: 42.1; }
        frame 27 { y: 41.9; scale-x: 0.799; scale-y: 0.799; }
        frame 28 { y: 42.1; scale-x: 0.797; scale-y: 0.797; }
        frame 29 { y: 42.3; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 42.4; }
        frame 31 { y: 42.6; }
        frame 32 { y: 42.8; }
        frame 33 { y: 42.9; }
        frame 34 { y: 43; }
        frame 35 { y: 43.1; scale-x: 0.799; scale-y: 0.799; }
        frame 36 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 46.6; y: 42.9; skew-x: 145.6; skew-y: -34.3; scale-x: 0.797; scale-y: 0.797; }
        frame 38 { x: 46.2; y: 42.5; skew-x: 143.9; skew-y: -36; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 45.7; y: 42.3; skew-x: 142.4; skew-y: -37.5; }
        frame 40 { x: 45.3; y: 42; skew-x: 140.6; skew-y: -39.3; }
        frame 41 { x: 44.8; y: 41.6; skew-x: 138.9; skew-y: -41; }
        frame 42 { x: 44.3; y: 41.3; skew-x: 137.4; skew-y: -42.5; }
        frame 43 { x: 43.8; y: 41; skew-x: 135.7; skew-y: -44.2; scale-x: 0.798; scale-y: 0.798; }
        frame 44 { x: 45.9; y: 42.7; skew-x: 147.4; skew-y: -32.5; scale-x: 0.797; scale-y: 0.797; }
        frame 45 { x: 48; y: 44.8; skew-x: 159.4; skew-y: -20.5; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 49.9; y: 46.9; skew-x: 171.2; skew-y: -8.7; }
        frame 47 { x: 51.6; y: 49.2; skew-x: 182.8; skew-y: 2.8; }
        frame 48 { x: 53.1; y: 51.5; skew-x: 194.8; skew-y: 14.8; }
        frame 49 { x: 53.3; y: 51.6; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 50 { x: 53.5; y: 51.5; scale-x: 0.797; scale-y: 0.797; }
        frame 51 { x: 53.3; y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 52 { x: 53.1; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 53.2; y: 51.6; scale-x: 0.796; scale-y: 0.796; }
        frame 54 { x: 53.3; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 53.4; }
        frame 56 { x: -10000; }
        frame 57 { x: 53.5; y: 51.5; scale-x: 0.797; scale-y: 0.797; }
        frame 58 { x: 52.6; y: 49.6; skew-x: 182.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 51.6; y: 47.8; skew-x: 171; skew-y: -8.9; }
        frame 60 { x: 50.5; y: 46.1; skew-x: 159; skew-y: -20.9; scale-x: 0.798; scale-y: 0.798; }
        frame 61 { x: -10000; y: 46; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 62 { scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 50.4; y: 45.9; }
        frame 64 { x: -10000; y: 45.8; scale-x: 0.798; scale-y: 0.798; }
        frame 65 { x: 50; y: 45.5; skew-x: 157.7; skew-y: -22.2; scale-x: 0.797; scale-y: 0.797; }
        frame 66 { x: 49.6; y: 45.1; skew-x: 156.4; skew-y: -23.5; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 49.4; y: 44.9; skew-x: 155.2; skew-y: -24.7; }
        frame 68 { x: 49; y: 44.6; skew-x: 153.7; skew-y: -26.2; }
        frame 69 { x: 48.7; y: 44.4; skew-x: 152.4; skew-y: -27.5; }
        frame 70 { x: 48.4; y: 44; skew-x: 151.2; skew-y: -28.7; }
        frame 71 { x: 48; y: 43.8; skew-x: 149.9; skew-y: -30; }
        frame 72 { x: 47.6; y: 43.5; skew-x: 148.6; skew-y: -31.3; }
        frame 73 { x: 47.1; y: 43.1; skew-x: 147.2; skew-y: -32.7; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "frontleaf";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 23.9; y: 54; skew-x: 6; skew-y: 6; scale-x: 0.555; scale-y: 0.43; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF; }
        frame 6 { x: 23.7; y: 54.3; skew-x: -10000; skew-y: -10000; scale-x: 0.562; scale-y: 0.422; cel: -10000; image: none; }
        frame 7 { x: 23.5; y: 54.6; scale-x: 0.568; scale-y: 0.415; }
        frame 8 { x: 23.4; y: 54.8; scale-x: 0.574; scale-y: 0.407; }
        frame 9 { x: 23.2; y: 55; skew-y: 5.8; scale-x: 0.58; scale-y: 0.4; }
        frame 10 { x: 23; y: 55.3; skew-y: -10000; scale-x: 0.587; scale-y: 0.392; }
        frame 11 { x: 22.9; y: 55.6; scale-x: 0.593; scale-y: 0.385; }
        frame 12 { x: 22.8; y: 55.8; skew-y: 6; scale-x: 0.6; scale-y: 0.377; }
        frame 13 { x: 22.9; y: 55.6; skew-y: 5.8; scale-x: 0.594; scale-y: 0.384; }
        frame 14 { x: 23.1; y: 55.3; skew-y: -10000; scale-x: 0.588; scale-y: 0.39; }
        frame 15 { x: 23.2; y: 55.1; scale-x: 0.583; scale-y: 0.397; }
        frame 16 { x: 23.3; y: 54.9; scale-x: 0.577; scale-y: 0.404; }
        frame 17 { x: 23.4; y: 54.8; skew-y: 6; scale-x: 0.572; scale-y: 0.41; }
        frame 18 { x: 23.6; y: 54.5; skew-y: -10000; scale-x: 0.566; scale-y: 0.417; }
        frame 19 { x: 23.7; y: 54.3; scale-x: 0.561; scale-y: 0.423; }
        frame 20 { x: 23.9; y: 54; scale-x: 0.555; scale-y: 0.43; }
        frame 21 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 22 { y: 54; skew-x: 6.3; skew-y: 6.3; }
        frame 23 { x: 24; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 24 { x: -10000; y: 53.9; skew-x: 6.6; skew-y: 6.6; }
        frame 25 { x: 23.6; y: 54.5; skew-x: 6.3; skew-y: 6.3; scale-x: 0.57; scale-y: 0.412; }
        frame 26 { x: 23.2; y: 55.1; skew-x: 6; skew-y: 6; scale-x: 0.585; scale-y: 0.395; }
        frame 27 { x: 22.8; y: 55.8; skew-x: -10000; skew-y: -10000; scale-x: 0.6; scale-y: 0.377; }
        frame 28 { x: 22.9; y: 55.6; skew-y: 5.8; scale-x: 0.594; scale-y: 0.384; }
        frame 29 { x: 23.1; y: 55.3; skew-y: -10000; scale-x: 0.588; scale-y: 0.39; }
        frame 30 { x: 23.2; y: 55.1; scale-x: 0.583; scale-y: 0.397; }
        frame 31 { x: 23.3; y: 54.9; scale-x: 0.577; scale-y: 0.404; }
        frame 32 { x: 23.4; y: 54.8; skew-y: 6; scale-x: 0.572; scale-y: 0.41; }
        frame 33 { x: 23.6; y: 54.5; skew-y: -10000; scale-x: 0.566; scale-y: 0.417; }
        frame 34 { x: 23.7; y: 54.3; scale-x: 0.561; scale-y: 0.423; }
        frame 35 { x: 23.9; y: 54; scale-x: 0.555; scale-y: 0.43; }
        frame 36 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 23.6; y: 54.5; scale-x: 0.566; scale-y: 0.417; }
        frame 38 { x: 23.3; y: 55; skew-y: 5.8; scale-x: 0.577; scale-y: 0.404; }
        frame 39 { x: 23.1; y: 55.4; skew-y: -10000; scale-x: 0.588; scale-y: 0.39; }
        frame 40 { x: 22.8; y: 55.8; skew-y: 6; scale-x: 0.6; scale-y: 0.377; }
        frame 41 { x: 23.1; y: 55.3; skew-y: 5.8; scale-x: 0.588; scale-y: 0.39; }
        frame 42 { x: 23.3; y: 54.9; skew-y: -10000; scale-x: 0.577; scale-y: 0.404; }
        frame 43 { x: 23.6; y: 54.5; skew-y: 6; scale-x: 0.566; scale-y: 0.417; }
        frame 44 { x: 23.9; y: 54; skew-y: -10000; scale-x: 0.555; scale-y: 0.43; }
        frame 45 { x: -10000; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 24; y: 53.9; skew-x: 6.6; skew-y: 6.6; }
        frame 47 { x: 23.4; y: 54.8; skew-x: 6.3; skew-y: 6.3; scale-x: 0.577; scale-y: 0.403; }
        frame 48 { x: 22.8; y: 55.8; skew-x: 6; skew-y: 6; scale-x: 0.6; scale-y: 0.377; }
        frame 49 { x: -10000; y: -10000; skew-x: 5.8; skew-y: 5.8; scale-x: 0.598; scale-y: 0.379; }
        frame 50 { y: 55.7; skew-x: -10000; skew-y: -10000; scale-x: 0.596; scale-y: 0.381; }
        frame 51 { x: 22.9; y: 55.6; skew-x: 6; scale-x: 0.594; scale-y: 0.383; }
        frame 52 { x: -10000; y: 55.5; skew-x: -10000; scale-x: 0.592; scale-y: 0.386; }
        frame 53 { x: 23; y: -10000; scale-x: 0.591; scale-y: 0.388; }
        frame 54 { x: 23.1; y: 55.4; scale-x: 0.589; scale-y: 0.39; }
        frame 55 { x: -10000; y: 55.3; scale-x: 0.587; scale-y: 0.392; }
        frame 56 { y: -10000; scale-x: 0.585; scale-y: 0.394; }
        frame 57 { x: 23.2; y: 55.1; scale-x: 0.583; scale-y: 0.396; }
        frame 58 { x: -10000; y: -10000; scale-x: 0.582; scale-y: 0.398; }
        frame 59 { y: 55; scale-x: 0.58; scale-y: 0.4; }
        frame 60 { x: 23.3; y: 54.9; scale-x: 0.578; scale-y: 0.402; }
        frame 61 { x: -10000; y: -10000; scale-x: 0.576; scale-y: 0.405; }
        frame 62 { y: 54.8; skew-y: 6; scale-x: 0.575; scale-y: 0.407; }
        frame 63 { x: 23.4; y: 54.7; skew-y: -10000; scale-x: 0.573; scale-y: 0.409; }
        frame 64 { x: 23.5; y: -10000; scale-x: 0.571; scale-y: 0.411; }
        frame 65 { x: -10000; y: 54.6; scale-x: 0.569; scale-y: 0.413; }
        frame 66 { x: 23.6; y: 54.5; scale-x: 0.568; scale-y: 0.415; }
        frame 67 { x: -10000; y: -10000; scale-x: 0.566; scale-y: 0.417; }
        frame 68 { x: 23.7; y: 54.4; scale-x: 0.564; scale-y: 0.419; }
        frame 69 { x: -10000; y: 54.3; scale-x: 0.562; scale-y: 0.421; }
        frame 70 { y: -10000; scale-x: 0.561; scale-y: 0.424; }
        frame 71 { x: 23.8; y: 54.2; scale-x: 0.559; scale-y: 0.426; }
        frame 72 { x: -10000; y: 54.1; scale-x: 0.557; scale-y: 0.428; }
        frame 73 { x: 23.9; y: 54; scale-x: 0.555; scale-y: 0.43; }
    }
    Track {
        source-name: "frontleaf_right_tip";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 57.1; y: 58.4; skew-x: 6; skew-y: 6; scale-x: 0.555; scale-y: 0.444; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_RIGHTTIP; }
        frame 6 { x: 57; y: -10000; skew-x: 3.5; skew-y: 3.5; scale-x: 0.599; scale-y: 0.442; cel: -10000; image: none; }
        frame 7 { x: 56.9; y: 58.5; skew-x: 1.3; skew-y: 1.3; scale-x: 0.642; scale-y: 0.44; }
        frame 8 { x: 56.6; y: -10000; skew-x: -0.7; skew-y: -0.7; scale-x: 0.686; scale-y: 0.438; }
        frame 9 { x: 56.5; y: 58.6; skew-x: -3.2; skew-y: -3.2; scale-x: 0.729; scale-y: 0.436; }
        frame 10 { x: 57.3; y: 58.9; skew-x: 0; skew-y: 0; scale-x: 0.686; scale-y: 0.434; }
        frame 11 { x: 57.9; y: 59.1; skew-x: 2.8; skew-y: 2.8; scale-x: 0.643; scale-y: 0.431; }
        frame 12 { x: 58.8; y: 59.6; skew-x: 6; skew-y: 6; scale-x: 0.6; scale-y: 0.428; }
        frame 13 { x: 58.2; y: 59.4; skew-x: 3.5; skew-y: 3.5; scale-x: 0.632; scale-y: 0.43; }
        frame 14 { x: 57.7; y: 59.2; skew-x: 1.3; skew-y: 1.3; scale-x: 0.664; scale-y: 0.432; }
        frame 15 { x: 57.1; y: 59; skew-x: -0.7; skew-y: -0.7; scale-x: 0.697; scale-y: 0.434; }
        frame 16 { x: 56.5; y: 58.8; skew-x: -3.2; skew-y: -3.2; scale-x: 0.729; scale-y: 0.436; }
        frame 17 { x: 56.7; y: 58.5; skew-x: -0.7; skew-y: -0.7; scale-x: 0.686; scale-y: 0.438; }
        frame 18 { x: 56.9; y: -10000; skew-x: 1.3; skew-y: 1.3; scale-x: 0.642; scale-y: 0.44; }
        frame 19 { x: -10000; skew-x: 3.5; skew-y: 3.5; scale-x: 0.599; scale-y: 0.442; }
        frame 20 { x: 57.1; y: 58.4; skew-x: 6; skew-y: 6; scale-x: 0.555; scale-y: 0.444; }
        frame 21 { x: 56.8; y: 58.3; skew-x: 3.5; skew-y: 3.5; scale-x: 0.599; scale-y: 0.442; }
        frame 22 { x: 56.4; y: 58.4; skew-x: 1.3; skew-y: 1.3; scale-x: 0.642; scale-y: 0.44; }
        frame 23 { x: 56; y: 58.3; skew-x: -0.7; skew-y: -0.7; scale-x: 0.686; scale-y: 0.438; }
        frame 24 { x: 55.6; y: -10000; skew-x: -3.2; skew-y: -3.2; scale-x: 0.729; scale-y: 0.436; }
        frame 25 { x: 56.6; y: 58.6; skew-x: 0; skew-y: 0; scale-x: 0.686; scale-y: 0.434; }
        frame 26 { x: 57.6; y: 59; skew-x: 2.8; skew-y: 2.8; scale-x: 0.643; scale-y: 0.431; }
        frame 27 { x: 58.8; y: 59.6; skew-x: 6; skew-y: 6; scale-x: 0.6; scale-y: 0.428; }
        frame 28 { x: 58.2; y: 59.4; skew-x: 3.5; skew-y: 3.5; scale-x: 0.632; scale-y: 0.43; }
        frame 29 { x: 57.7; y: 59.2; skew-x: 1.3; skew-y: 1.3; scale-x: 0.664; scale-y: 0.432; }
        frame 30 { x: 57.1; y: 59; skew-x: -0.7; skew-y: -0.7; scale-x: 0.697; scale-y: 0.434; }
        frame 31 { x: 56.5; y: 58.8; skew-x: -3.2; skew-y: -3.2; scale-x: 0.729; scale-y: 0.436; }
        frame 32 { x: 56.7; y: 58.5; skew-x: -0.7; skew-y: -0.7; scale-x: 0.686; scale-y: 0.438; }
        frame 33 { x: 56.9; y: -10000; skew-x: 1.3; skew-y: 1.3; scale-x: 0.642; scale-y: 0.44; }
        frame 34 { x: -10000; skew-x: 3.5; skew-y: 3.5; scale-x: 0.599; scale-y: 0.442; }
        frame 35 { x: 57.1; y: 58.4; skew-x: 6; skew-y: 6; scale-x: 0.555; scale-y: 0.444; }
        frame 36 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 56.9; y: 58.5; skew-x: 1.3; skew-y: 1.3; scale-x: 0.642; scale-y: 0.44; }
        frame 38 { x: 56.5; y: 58.6; skew-x: -3.2; skew-y: -3.2; scale-x: 0.729; scale-y: 0.436; }
        frame 39 { x: 57.5; y: 59; skew-x: 1.3; skew-y: 1.3; scale-x: 0.664; scale-y: 0.432; }
        frame 40 { x: 58.8; y: 59.6; skew-x: 6; skew-y: 6; scale-x: 0.6; scale-y: 0.428; }
        frame 41 { x: 57.7; y: 59.2; skew-x: 1.3; skew-y: 1.3; scale-x: 0.664; scale-y: 0.432; }
        frame 42 { x: 56.5; y: 58.8; skew-x: -3.2; skew-y: -3.2; scale-x: 0.729; scale-y: 0.436; }
        frame 43 { x: 56.9; y: 58.5; skew-x: 1.3; skew-y: 1.3; scale-x: 0.642; scale-y: 0.44; }
        frame 44 { x: 57.1; y: 58.4; skew-x: 6; skew-y: 6; scale-x: 0.555; scale-y: 0.444; }
        frame 45 { x: 56.4; y: -10000; skew-x: 1.3; skew-y: 1.3; scale-x: 0.642; scale-y: 0.44; }
        frame 46 { x: 55.6; y: 58.3; skew-x: -3.2; skew-y: -3.2; scale-x: 0.729; scale-y: 0.436; }
        frame 47 { x: 57.2; y: 58.9; skew-x: 1.3; skew-y: 1.3; scale-x: 0.664; scale-y: 0.432; }
        frame 48 { x: 58.8; y: 59.6; skew-x: 6; skew-y: 6; scale-x: 0.6; scale-y: 0.428; }
        frame 49 { x: 58; y: 59.3; skew-x: 2.8; skew-y: 2.8; scale-x: 0.643; scale-y: 0.431; }
        frame 50 { x: 57.4; y: 59; skew-x: 0; skew-y: 0; scale-x: 0.686; scale-y: 0.434; }
        frame 51 { x: 56.5; y: 58.8; skew-x: -3.2; skew-y: -3.2; scale-x: 0.729; scale-y: 0.436; }
        frame 52 { x: 56.6; y: -10000; skew-x: -2.7; skew-y: -2.7; scale-x: 0.721; scale-y: -10000; }
        frame 53 { x: -10000; y: 58.6; skew-x: -2.2; skew-y: -2.2; scale-x: 0.713; scale-y: 0.437; }
        frame 54 { y: 58.7; skew-x: -1.9; skew-y: -1.9; scale-x: 0.705; scale-y: -10000; }
        frame 55 { x: 56.5; y: 58.6; skew-x: -1.4; skew-y: -1.4; scale-x: 0.698; scale-y: 0.438; }
        frame 56 { x: 56.6; y: -10000; skew-x: -0.9; skew-y: -0.9; scale-x: 0.69; scale-y: -10000; }
        frame 57 { x: -10000; skew-x: -0.5; skew-y: -0.5; scale-x: 0.682; }
        frame 58 { x: 56.8; y: 58.5; skew-x: -0.2; skew-y: -0.2; scale-x: 0.674; scale-y: 0.439; }
        frame 59 { x: -10000; y: 58.6; skew-x: 0; skew-y: 0; scale-x: 0.666; scale-y: -10000; }
        frame 60 { y: 58.5; skew-x: 0.5; skew-y: 0.5; scale-x: 0.658; }
        frame 61 { y: -10000; skew-x: 0.8; skew-y: 0.8; scale-x: 0.65; scale-y: 0.44; }
        frame 62 { x: 56.9; skew-x: 1.3; skew-y: 1.3; scale-x: 0.642; scale-y: -10000; }
        frame 63 { x: -10000; skew-x: 1.8; skew-y: 1.8; scale-x: 0.634; scale-y: 0.441; }
        frame 64 { skew-x: 2.1; skew-y: 2.1; scale-x: 0.626; scale-y: -10000; }
        frame 65 { skew-x: 2.5; skew-y: 2.5; scale-x: 0.619; }
        frame 66 { x: 57; y: 58.4; skew-x: 3; skew-y: 3; scale-x: 0.611; scale-y: 0.442; }
        frame 67 { x: -10000; y: 58.5; skew-x: 3.3; skew-y: 3.3; scale-x: 0.603; scale-y: -10000; }
        frame 68 { y: 58.4; skew-x: 3.8; skew-y: 3.8; scale-x: 0.595; }
        frame 69 { x: 57; y: -10000; skew-x: 4.3; skew-y: 4.3; scale-x: 0.587; scale-y: 0.443; }
        frame 70 { x: -10000; skew-x: 4.6; skew-y: 4.6; scale-x: 0.579; scale-y: -10000; }
        frame 71 { x: 57.1; skew-x: 5; skew-y: 5; scale-x: 0.571; }
        frame 72 { x: -10000; skew-x: 5.5; skew-y: 5.5; scale-x: 0.563; scale-y: 0.444; }
        frame 73 { skew-x: 6; skew-y: 6; scale-x: 0.555; scale-y: -10000; }
    }
    Track {
        source-name: "frontleaf_tip_left";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 19.9; y: 59; skew-x: 6; skew-y: 6; scale-x: 0.555; scale-y: 0.452; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_LEFTTIP; }
        frame 6 { x: 20; y: 58.7; skew-x: 8; skew-y: 8; scale-x: 0.573; scale-y: 0.45; cel: -10000; image: none; }
        frame 7 { x: 20.1; y: 58.5; skew-x: 10; skew-y: 10; scale-x: 0.591; scale-y: 0.447; }
        frame 8 { x: 20.2; y: 58.1; skew-x: 12.1; skew-y: 12.1; scale-x: 0.609; scale-y: 0.445; }
        frame 9 { x: 20.3; y: 57.6; skew-x: 14.3; skew-y: 14.3; scale-x: 0.628; scale-y: 0.443; }
        frame 10 { x: 19.7; y: 58.3; skew-x: 9.5; skew-y: 9.5; scale-x: 0.612; scale-y: 0.453; }
        frame 11 { x: 19.1; y: 59; skew-x: 4.8; skew-y: 4.6; scale-x: 0.596; scale-y: 0.463; }
        frame 12 { x: 18.7; y: 59.7; skew-x: 0.2; skew-y: 0; scale-x: 0.58; scale-y: 0.473; }
        frame 13 { x: 19; y: 59.4; skew-x: 3.8; skew-y: 3.5; scale-x: 0.592; scale-y: 0.466; }
        frame 14 { x: 19.5; y: 58.8; skew-x: 7.3; skew-y: 7; scale-x: 0.604; scale-y: 0.458; }
        frame 15 { x: 19.9; y: 58.3; skew-x: 10.8; skew-y: 10.6; scale-x: 0.616; scale-y: 0.451; }
        frame 16 { x: 20.2; y: 57.9; skew-x: 14.3; skew-y: 14.3; scale-x: 0.628; scale-y: 0.443; }
        frame 17 { x: 20.1; y: 58.1; skew-x: 12.1; skew-y: 12.1; scale-x: 0.609; scale-y: 0.445; }
        frame 18 { x: 19.9; y: 58.4; skew-x: 10; skew-y: 10; scale-x: 0.591; scale-y: 0.447; }
        frame 19 { x: -10000; y: 58.5; skew-x: 8; skew-y: 8; scale-x: 0.573; scale-y: 0.45; }
        frame 20 { y: 59; skew-x: 6; skew-y: 6; scale-x: 0.555; scale-y: 0.452; }
        frame 21 { x: 20; y: 58.7; skew-x: 8; skew-y: 8; scale-x: 0.573; scale-y: 0.45; }
        frame 22 { x: 20.1; y: 58.5; skew-x: 10; skew-y: 10; scale-x: 0.591; scale-y: 0.447; }
        frame 23 { x: 20.2; y: 58.1; skew-x: 12.1; skew-y: 12.1; scale-x: 0.609; scale-y: 0.445; }
        frame 24 { x: 20.3; y: 57.6; skew-x: 14.3; skew-y: 14.3; scale-x: 0.628; scale-y: 0.443; }
        frame 25 { x: 19.7; y: 58.3; skew-x: 9.5; skew-y: 9.5; scale-x: 0.612; scale-y: 0.453; }
        frame 26 { x: 19.1; y: 59; skew-x: 4.8; skew-y: 4.6; scale-x: 0.596; scale-y: 0.463; }
        frame 27 { x: 18.7; y: 59.7; skew-x: 0.2; skew-y: 0; scale-x: 0.58; scale-y: 0.473; }
        frame 28 { x: 19; y: 59.4; skew-x: 3.8; skew-y: 3.5; scale-x: 0.592; scale-y: 0.466; }
        frame 29 { x: 19.5; y: 58.8; skew-x: 7.3; skew-y: 7; scale-x: 0.604; scale-y: 0.458; }
        frame 30 { x: 19.9; y: 58.3; skew-x: 10.8; skew-y: 10.6; scale-x: 0.616; scale-y: 0.451; }
        frame 31 { x: 20.2; y: 57.9; skew-x: 14.3; skew-y: 14.3; scale-x: 0.628; scale-y: 0.443; }
        frame 32 { x: 20.1; y: 58.1; skew-x: 12.1; skew-y: 12.1; scale-x: 0.609; scale-y: 0.445; }
        frame 33 { x: 19.9; y: 58.4; skew-x: 10; skew-y: 10; scale-x: 0.591; scale-y: 0.447; }
        frame 34 { x: -10000; y: 58.5; skew-x: 8; skew-y: 8; scale-x: 0.573; scale-y: 0.45; }
        frame 35 { y: 59; skew-x: 6; skew-y: 6; scale-x: 0.555; scale-y: 0.452; }
        frame 36 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 20.1; y: 58.5; skew-x: 10; skew-y: 10; scale-x: 0.591; scale-y: 0.447; }
        frame 38 { x: 20.3; y: 57.6; skew-x: 14.3; skew-y: 14.3; scale-x: 0.628; scale-y: 0.443; }
        frame 39 { x: 19.5; y: 58.6; skew-x: 7.3; skew-y: 7; scale-x: 0.604; scale-y: 0.458; }
        frame 40 { x: 18.7; y: 59.7; skew-x: 0.2; skew-y: 0; scale-x: 0.58; scale-y: 0.473; }
        frame 41 { x: 19.5; y: 58.8; skew-x: 7.3; skew-y: 7; scale-x: 0.604; scale-y: 0.458; }
        frame 42 { x: 20.2; y: 57.9; skew-x: 14.3; skew-y: 14.3; scale-x: 0.628; scale-y: 0.443; }
        frame 43 { x: 19.9; y: 58.4; skew-x: 10; skew-y: 10; scale-x: 0.591; scale-y: 0.447; }
        frame 44 { x: -10000; y: 59; skew-x: 6; skew-y: 6; scale-x: 0.555; scale-y: 0.452; }
        frame 45 { x: 20.1; y: 58.5; skew-x: 10; skew-y: 10; scale-x: 0.591; scale-y: 0.447; }
        frame 46 { x: 20.3; y: 57.6; skew-x: 14.3; skew-y: 14.3; scale-x: 0.628; scale-y: 0.443; }
        frame 47 { x: 19.5; y: 58.6; skew-x: 7.3; skew-y: 7; scale-x: 0.604; scale-y: 0.458; }
        frame 48 { x: 18.7; y: 59.7; skew-x: 0.2; skew-y: 0; scale-x: 0.58; scale-y: 0.473; }
        frame 49 { x: 19.1; y: 59.1; skew-x: 4.8; skew-y: 4.6; scale-x: 0.596; scale-y: 0.463; }
        frame 50 { x: 19.8; y: 58.5; skew-x: 9.5; skew-y: 9.5; scale-x: 0.612; scale-y: 0.453; }
        frame 51 { x: 20.2; y: 57.9; skew-x: 14.3; skew-y: 14.3; scale-x: 0.628; scale-y: 0.443; }
        frame 52 { x: -10000; y: -10000; skew-x: 13.8; skew-y: 13.8; scale-x: 0.624; scale-y: 0.444; }
        frame 53 { skew-x: 13.5; skew-y: 13.5; scale-x: 0.621; scale-y: -10000; }
        frame 54 { x: 20.1; y: 58; skew-x: 13; skew-y: 13; scale-x: 0.618; }
        frame 55 { x: -10000; y: -10000; skew-x: 12.8; skew-y: 12.8; scale-x: 0.614; scale-y: 0.445; }
        frame 56 { skew-x: 12.3; skew-y: 12.3; scale-x: 0.611; scale-y: -10000; }
        frame 57 { y: 58.1; skew-x: 12; skew-y: 12; scale-x: 0.608; }
        frame 58 { x: 20; y: 58.2; skew-x: 11.5; skew-y: 11.5; scale-x: 0.605; scale-y: 0.446; }
        frame 59 { x: -10000; y: -10000; skew-x: 11.3; skew-y: 11.3; scale-x: 0.601; scale-y: -10000; }
        frame 60 { y: 58.3; skew-x: 10.8; skew-y: 10.8; scale-x: 0.598; scale-y: 0.447; }
        frame 61 { x: 20; y: -10000; skew-x: 10.5; skew-y: 10.5; scale-x: 0.595; scale-y: -10000; }
        frame 62 { x: 19.9; y: 58.4; skew-x: 10; skew-y: 10; scale-x: 0.591; }
        frame 63 { x: -10000; y: -10000; skew-x: 9.8; skew-y: 9.8; scale-x: 0.588; scale-y: 0.448; }
        frame 64 { skew-x: 9.3; skew-y: 9.3; scale-x: 0.585; scale-y: -10000; }
        frame 65 { y: 58.5; skew-x: 9; skew-y: 9; scale-x: 0.582; scale-y: 0.449; }
        frame 66 { y: -10000; skew-x: 8.5; skew-y: 8.5; scale-x: 0.578; scale-y: -10000; }
        frame 67 { skew-x: 8.3; skew-y: 8.3; scale-x: 0.575; }
        frame 68 { y: 58.6; skew-x: 7.8; skew-y: 7.8; scale-x: 0.572; scale-y: 0.45; }
        frame 69 { x: 19.8; y: -10000; skew-x: 7.5; skew-y: 7.5; scale-x: 0.568; scale-y: -10000; }
        frame 70 { x: -10000; skew-x: 7; skew-y: 7; scale-x: 0.565; scale-y: 0.451; }
        frame 71 { y: 58.8; skew-x: 6.8; skew-y: 6.8; scale-x: 0.562; scale-y: -10000; }
        frame 72 { y: 58.9; skew-x: 6.3; skew-y: 6.3; scale-x: 0.559; }
        frame 73 { x: 19.9; y: 59; skew-x: 6; skew-y: 6; scale-x: 0.555; scale-y: 0.452; }
    }
}
