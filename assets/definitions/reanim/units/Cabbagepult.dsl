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
        frame 5 { x: 11.21162; y: 17.62949; skew-x: -17.28855; skew-y: -17.28855; scale-x: 0.9044773; scale-y: 0.9044774; cel: 0; alpha: 1; image: IMAGE_REANIM_CABBAGEPULT_STALK4; }
        frame 6 { x: 10.12141; y: 19.01492; skew-x: -20.16519; skew-y: -20.55909; scale-x: 0.8984367; scale-y: 0.9052444; cel: 0; alpha: 1; }
        frame 7 { x: 9.155342; y: 20.60693; skew-x: -23.2583; skew-y: -24.05251; scale-x: 0.8922439; scale-y: 0.9058358; cel: 0; alpha: 1; }
        frame 8 { x: 8.212901; y: 22.00019; skew-x: -26.27494; skew-y: -27.47586; scale-x: 0.883602; scale-y: 0.9038965; cel: 0; alpha: 1; }
        frame 9 { x: 7.238702; y: 23.51065; skew-x: -29.42275; skew-y: -31.03693; scale-x: 0.8782481; scale-y: 0.9052818; cel: 0; alpha: 1; }
        frame 10 { x: 6.267281; y: 25.10225; skew-x: -32.43913; skew-y: -34.43392; scale-x: 0.8795358; scale-y: 0.9066484; cel: 0; alpha: 1; }
        frame 11 { x: 5.252256; y: 26.48925; skew-x: -34.63918; skew-y: -36.84808; scale-x: 0.906904; scale-y: 0.9074296; cel: 0; alpha: 1; }
        frame 12 { x: 4.246781; y: 28.2346; skew-x: -37.62092; skew-y: -40.0099; scale-x: 0.932421; scale-y: 0.9093232; cel: 0; alpha: 1; }
        frame 13 { x: 4.460066; y: 27.88682; skew-x: -37.43268; skew-y: -39.92974; scale-x: 0.9417597; scale-y: 0.9074737; cel: 0; alpha: 1; }
        frame 14 { x: 4.692306; y: 27.65424; skew-x: -37.63958; skew-y: -40.24129; scale-x: 0.9493065; scale-y: 0.903952; cel: 0; alpha: 1; }
        frame 15 { x: 5.001179; y: 27.33579; skew-x: -37.17471; skew-y: -38.33853; scale-x: 0.9683514; scale-y: 0.899045; cel: 0; alpha: 1; }
        frame 16 { x: 6.249044; y: 25.22465; skew-x: -33.37389; skew-y: -34.82846; scale-x: 0.9343928; scale-y: 0.898865; cel: 0; alpha: 1; }
        frame 17 { x: 7.383015; y: 23.33617; skew-x: -29.60198; skew-y: -31.36646; scale-x: 0.9038998; scale-y: 0.9022064; cel: 0; alpha: 1; }
        frame 18 { x: 8.599742; y: 21.48489; skew-x: -26.5066; skew-y: -28.60243; scale-x: 0.8739516; scale-y: 0.9064514; cel: 0; alpha: 1; }
        frame 19 { x: 9.798815; y: 19.61028; skew-x: -22.4978; skew-y: -24.30664; scale-x: 0.8746274; scale-y: 0.90737; cel: 0; alpha: 1; }
        frame 20 { x: 11.07923; y: 17.73166; skew-x: -18.78213; skew-y: -20.15083; scale-x: 0.8866794; scale-y: 0.9111818; cel: 0; alpha: 1; }
        frame 21 { x: 11.76118; y: 17.39739; skew-x: -17.3604; skew-y: -18.29447; scale-x: 0.8827779; scale-y: 0.8986425; cel: 0; alpha: 1; }
        frame 22 { x: 12.2963; y: 17.21788; skew-x: -17.22399; skew-y: -16.68958; scale-x: 0.8874798; scale-y: 0.8960933; cel: 0; alpha: 1; }
        frame 23 { x: 12.87218; y: 16.76228; skew-x: -16.13183; skew-y: -15.7642; scale-x: 0.8900813; scale-y: 0.9002263; cel: 0; alpha: 1; }
        frame 24 { x: 13.33407; y: 16.46147; skew-x: -15.39163; skew-y: -15.60284; scale-x: 0.8846723; scale-y: 0.8984532; cel: 0; alpha: 1; }
        frame 25 { x: 13.90682; y: 16.2899; skew-x: -14.71341; skew-y: -15.51086; scale-x: 0.8744836; scale-y: 0.8916937; cel: 0; alpha: 1; }
        frame 26 { x: 14.49414; y: 15.97225; skew-x: -13.65833; skew-y: -15.04948; scale-x: 0.8676336; scale-y: 0.8881984; cel: 0; alpha: 1; }
        frame 27 { x: 14.97652; y: 15.64357; skew-x: -12.61898; skew-y: -14.61122; scale-x: 0.8642485; scale-y: 0.8881338; cel: 0; alpha: 1; }
        frame 28 { x: 15.52618; y: 14.47819; skew-x: -8.714638; skew-y: -11.47738; scale-x: 0.8750815; scale-y: 0.8906397; cel: 0; alpha: 1; }
        frame 29 { x: 16.01846; y: 13.18448; skew-x: -4.320166; skew-y: -7.938093; scale-x: 0.8921617; scale-y: 0.8914693; cel: 0; alpha: 1; }
        frame 30 { x: 16.68108; y: 12.01901; skew-x: -0.4931628; skew-y: -4.936699; scale-x: 0.9109203; scale-y: 0.8938201; cel: 0; alpha: 1; }
        frame 31 { x: 15.53391; y: 13.11843; skew-x: -3.722278; skew-y: -7.70518; scale-x: 0.8963294; scale-y: 0.8957193; cel: 0; alpha: 1; }
        frame 32 { x: 14.39793; y: 14.08986; skew-x: -7.314658; skew-y: -10.47368; scale-x: 0.8816613; scale-y: 0.9057093; cel: 0; alpha: 1; }
        frame 33 { x: 13.31907; y: 15.29235; skew-x: -10.73057; skew-y: -12.83714; scale-x: 0.8876841; scale-y: 0.9086531; cel: 0; alpha: 1; }
        frame 34 { x: 12.27599; y: 16.40135; skew-x: -13.91014; skew-y: -14.94639; scale-x: 0.8949025; scale-y: 0.9054942; cel: 0; alpha: 1; }
        frame 35 { x: 11.21162; y: 17.62949; skew-x: -17.28855; skew-y: -17.28855; scale-x: 0.9044773; scale-y: 0.9044774; cel: 0; alpha: 1; }
        frame 36 { x: 11.21162; y: 17.62949; skew-x: -17.28855; skew-y: -17.28855; scale-x: 0.9044773; scale-y: 0.9044774; cel: 0; alpha: 1; }
        frame 37 { x: 9.317412; y: 20.52792; skew-x: -26.17028; skew-y: -24.408; scale-x: 0.8588653; scale-y: 0.9252976; cel: 0; alpha: 1; }
        frame 38 { x: 7.228298; y: 23.45118; skew-x: -35.72916; skew-y: -31.74362; scale-x: 0.8316529; scale-y: 0.9660207; cel: 0; alpha: 1; }
        frame 39 { x: 5.45869; y: 26.55098; skew-x: -41.94153; skew-y: -38.22452; scale-x: 0.8160562; scale-y: 0.9665547; cel: 0; alpha: 1; }
        frame 40 { x: 3.451851; y: 29.63429; skew-x: -47.02946; skew-y: -44.33538; scale-x: 0.8374147; scale-y: 0.9749134; cel: 0; alpha: 1; }
        frame 41 { x: 1.512729; y: 32.81743; skew-x: -50.16823; skew-y: -49.45917; scale-x: 0.8881936; scale-y: 0.9641399; cel: 0; alpha: 1; }
        frame 42 { x: -0.1315486; y: 36.11038; skew-x: -53.6216; skew-y: -54.65331; scale-x: 0.9386351; scale-y: 0.9541689; cel: 0; alpha: 1; }
        frame 43 { x: -1.796951; y: 39.41288; skew-x: -57.28576; skew-y: -59.85455; scale-x: 0.9912648; scale-y: 0.94747; cel: 0; alpha: 1; }
        frame 44 { x: 5.875669; y: 27.04797; skew-x: -43.6659; skew-y: -39.94401; scale-x: 0.7857462; scale-y: 0.9880144; cel: 0; alpha: 1; }
        frame 45 { x: 14.52493; y: 15.23683; skew-x: -2.866391; skew-y: -16.19751; scale-x: 0.7702947; scale-y: 0.899065; cel: 0; alpha: 1; }
        frame 46 { x: 19.84752; y: 10.81952; skew-x: -2.054228; skew-y: 6.475479; scale-x: 1.065068; scale-y: 0.9179095; cel: 0; alpha: 1; }
        frame 47 { x: 25.66285; y: 6.554131; skew-x: 18.38955; skew-y: 25.91026; scale-x: 1.141433; scale-y: 0.798676; cel: 0; alpha: 1; }
        frame 48 { x: 30.42652; y: 4.268599; skew-x: 32.84172; skew-y: 36.57098; scale-x: 1.044358; scale-y: 0.7464425; cel: 0; alpha: 1; }
        frame 49 { x: 34.54376; y: 2.170529; skew-x: 49.24524; skew-y: 45.24148; scale-x: 1.028061; scale-y: 0.6882216; cel: 0; alpha: 1; }
        frame 50 { x: 38.08068; y: 0.1607042; skew-x: 60.04773; skew-y: 56.61924; scale-x: 1.149165; scale-y: 0.6416755; cel: 0; alpha: 1; }
        frame 51 { x: 36.90143; y: 1.003396; skew-x: 46.24107; skew-y: 52.44328; scale-x: 1.08686; scale-y: 0.7805865; cel: 0; alpha: 1; }
        frame 52 { x: 35.62718; y: 1.67497; skew-x: 43.68141; skew-y: 47.009; scale-x: 1.037968; scale-y: 0.788643; cel: 0; alpha: 1; }
        frame 53 { x: 34.39804; y: 2.242123; skew-x: 43.53753; skew-y: 42.30243; scale-x: 0.9784477; scale-y: 0.7752997; cel: 0; alpha: 1; }
        frame 54 { x: 33.04668; y: 3.124924; skew-x: 41.56811; skew-y: 39.18848; scale-x: 0.9480491; scale-y: 0.7649073; cel: 0; alpha: 1; }
        frame 55 { x: 31.88769; y: 3.963653; skew-x: 39.60272; skew-y: 37.03592; scale-x: 0.9260735; scale-y: 0.757152; cel: 0; alpha: 1; }
        frame 56 { x: 30.42787; y: 4.780897; skew-x: 37.12795; skew-y: 34.36433; scale-x: 0.9153816; scale-y: 0.7586147; cel: 0; alpha: 1; }
        frame 57 { x: 29.1336; y: 5.78199; skew-x: 34.21798; skew-y: 31.24728; scale-x: 0.8972826; scale-y: 0.753965; cel: 0; alpha: 1; }
        frame 58 { x: 29.42124; y: 5.638726; skew-x: 34.72239; skew-y: 31.53376; scale-x: 0.8959467; scale-y: 0.7635338; cel: 0; alpha: 1; }
        frame 59 { x: 29.70915; y: 5.57555; skew-x: 34.95677; skew-y: 32.61052; scale-x: 0.9000269; scale-y: 0.7620355; cel: 0; alpha: 1; }
        frame 60 { x: 30.08445; y: 5.566718; skew-x: 35.36907; skew-y: 33.85766; scale-x: 0.9078013; scale-y: 0.7635314; cel: 0; alpha: 1; }
        frame 61 { x: 30.37749; y: 5.461248; skew-x: 35.66166; skew-y: 34.97747; scale-x: 0.9131995; scale-y: 0.7628912; cel: 0; alpha: 1; }
        frame 62 { x: 30.68498; y: 5.33437; skew-x: 36.0224; skew-y: 36.1577; scale-x: 0.9224293; scale-y: 0.7653103; cel: 0; alpha: 1; }
        frame 63 { x: 31.00862; y: 5.309821; skew-x: 36.72398; skew-y: 37.41292; scale-x: 0.9259202; scale-y: 0.7629756; cel: 0; alpha: 1; }
        frame 64 { x: 31.51036; y: 5.417849; skew-x: 37.7172; skew-y: 38.17998; scale-x: 0.8984268; scale-y: 0.7604485; cel: 0; alpha: 1; }
        frame 65 { x: 29.7296; y: 6.319516; skew-x: 32.8131; skew-y: 32.16627; scale-x: 0.8134379; scale-y: 0.7765608; cel: 0; alpha: 1; }
        frame 66 { x: 27.82539; y: 7.534226; skew-x: 27.94399; skew-y: 25.43812; scale-x: 0.7333664; scale-y: 0.7847334; cel: 0; alpha: 1; }
        frame 67 { x: 25.816; y: 8.400718; skew-x: 26.35462; skew-y: 18.12522; scale-x: 0.6729599; scale-y: 0.7893407; cel: 0; alpha: 1; }
        frame 68 { x: 23.41596; y: 9.518995; skew-x: 23.73378; skew-y: 10.194; scale-x: 0.6290169; scale-y: 0.7929493; cel: 0; alpha: 1; }
        frame 69 { x: 21.25943; y: 10.89477; skew-x: 17.86741; skew-y: 4.752789; scale-x: 0.6279989; scale-y: 0.7902431; cel: 0; alpha: 1; }
        frame 70 { x: 18.81948; y: 12.38191; skew-x: 7.817019; skew-y: -2.27597; scale-x: 0.6450395; scale-y: 0.8261618; cel: 0; alpha: 1; }
        frame 71 { x: 16.24248; y: 13.71224; skew-x: -4.485728; skew-y: -10.05706; scale-x: 0.6801836; scale-y: 0.8925569; cel: 0; alpha: 1; }
        frame 72 { x: 13.7241; y: 15.49133; skew-x: -12.39249; skew-y: -14.43022; scale-x: 0.7733306; scale-y: 0.9108235; cel: 0; alpha: 1; }
        frame 73 { x: 11.2303; y: 17.64112; skew-x: -17.27337; skew-y: -17.27338; scale-x: 0.9009107; scale-y: 0.9009108; cel: 0; alpha: 1; }
    }
    Track {
        source-name: "Cabbagepult_stalk3";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 5 { x: 17.36015; y: 18.35314; skew-x: -17.28855; skew-y: -17.28855; scale-x: 0.9044773; scale-y: 0.9044774; cel: 0; alpha: 1; image: IMAGE_REANIM_CABBAGEPULT_STALK3; }
        frame 6 { x: 16.29693; y: 19.44495; skew-x: -20.01931; skew-y: -20.24872; scale-x: 0.9003196; scale-y: 0.9004647; cel: 0; alpha: 1; }
        frame 7 { x: 15.34352; y: 20.71885; skew-x: -22.96963; skew-y: -23.43693; scale-x: 0.8959287; scale-y: 0.8962329; cel: 0; alpha: 1; }
        frame 8 { x: 14.38076; y: 21.80247; skew-x: -25.84667; skew-y: -26.56039; scale-x: 0.8889919; scale-y: 0.8894689; cel: 0; alpha: 1; }
        frame 9 { x: 13.39265; y: 22.98943; skew-x: -28.85813; skew-y: -29.82702; scale-x: 0.8852781; scale-y: 0.8859435; cel: 0; alpha: 1; }
        frame 10 { x: 12.42601; y: 24.25108; skew-x: -31.73493; skew-y: -33.06791; scale-x: 0.8842322; scale-y: 0.8823114; cel: 0; alpha: 1; }
        frame 11 { x: 11.54086; y: 25.30488; skew-x: -33.76623; skew-y: -35.86693; scale-x: 0.8935713; scale-y: 0.8779022; cel: 0; alpha: 1; }
        frame 12 { x: 10.61902; y: 26.62931; skew-x: -36.55283; skew-y: -39.36461; scale-x: 0.9026472; scale-y: 0.8743357; cel: 0; alpha: 1; }
        frame 13 { x: 10.90211; y: 26.26297; skew-x: -36.08565; skew-y: -39.38349; scale-x: 0.9026126; scale-y: 0.8663889; cel: 0; alpha: 1; }
        frame 14 { x: 11.18043; y: 25.97106; skew-x: -36.01562; skew-y: -39.80459; scale-x: 0.9008356; scale-y: 0.8568445; cel: 0; alpha: 1; }
        frame 15 { x: 11.52775; y: 25.66555; skew-x: -35.05924; skew-y: -38.50978; scale-x: 0.906957; scale-y: 0.8496771; cel: 0; alpha: 1; }
        frame 16 { x: 12.68736; y: 24.09625; skew-x: -31.76028; skew-y: -34.43038; scale-x: 0.8965461; scale-y: 0.8572283; cel: 0; alpha: 1; }
        frame 17 { x: 13.71532; y: 22.72466; skew-x: -28.51926; skew-y: -30.41509; scale-x: 0.8895029; scale-y: 0.8682225; cel: 0; alpha: 1; }
        frame 18 { x: 14.78976; y: 21.29852; skew-x: -25.98642; skew-y: -27.11341; scale-x: 0.8831546; scale-y: 0.8802029; cel: 0; alpha: 1; }
        frame 19 { x: 15.96177; y: 19.8586; skew-x: -22.26871; skew-y: -22.98166; scale-x: 0.8872955; scale-y: 0.8868107; cel: 0; alpha: 1; }
        frame 20 { x: 17.25156; y: 18.36617; skew-x: -18.77245; skew-y: -19.16827; scale-x: 0.89775; scale-y: 0.8957003; cel: 0; alpha: 1; }
        frame 21 { x: 17.8443; y: 18.15891; skew-x: -17.57148; skew-y: -17.66004; scale-x: 0.8920185; scale-y: 0.8884447; cel: 0; alpha: 1; }
        frame 22 { x: 18.32876; y: 17.99509; skew-x: -16.92441; skew-y: -16.34995; scale-x: 0.8942475; scale-y: 0.88386; cel: 0; alpha: 1; }
        frame 23 { x: 18.92272; y: 17.66593; skew-x: -15.78312; skew-y: -15.3074; scale-x: 0.8970237; scale-y: 0.8849614; cel: 0; alpha: 1; }
        frame 24 { x: 19.37129; y: 17.44731; skew-x: -15.2311; skew-y: -14.98111; scale-x: 0.8932087; scale-y: 0.8821468; cel: 0; alpha: 1; }
        frame 25 { x: 19.89814; y: 17.34479; skew-x: -14.74613; skew-y: -14.72653; scale-x: 0.8844603; scale-y: 0.8744364; cel: 0; alpha: 1; }
        frame 26 { x: 20.45395; y: 17.138; skew-x: -13.88941; skew-y: -14.1049; scale-x: 0.878977; scale-y: 0.869928; cel: 0; alpha: 1; }
        frame 27 { x: 20.92696; y: 16.92212; skew-x: -13.05349; skew-y: -13.5088; scale-x: 0.8769028; scale-y: 0.8687747; cel: 0; alpha: 1; }
        frame 28 { x: 21.45961; y: 16.13395; skew-x: -10.04023; skew-y: -10.70922; scale-x: 0.8861398; scale-y: 0.8834649; cel: 0; alpha: 1; }
        frame 29 { x: 21.93709; y: 15.26241; skew-x: -6.479408; skew-y: -7.631997; scale-x: 0.8957981; scale-y: 0.8965808; cel: 0; alpha: 1; }
        frame 30 { x: 22.5876; y: 14.47301; skew-x: -3.459734; skew-y: -5.09038; scale-x: 0.9068063; scale-y: 0.9112333; cel: 0; alpha: 1; }
        frame 31 { x: 21.45721; y: 15.24302; skew-x: -6.398286; skew-y: -7.597895; scale-x: 0.9012765; scale-y: 0.9123154; cel: 0; alpha: 1; }
        frame 32 { x: 20.32277; y: 15.88056; skew-x: -9.391764; skew-y: -9.926403; scale-x: 0.8998641; scale-y: 0.9183282; cel: 0; alpha: 1; }
        frame 33 { x: 19.33412; y: 16.73415; skew-x: -12.10224; skew-y: -12.3823; scale-x: 0.9027898; scale-y: 0.9170557; cel: 0; alpha: 1; }
        frame 34 { x: 18.35776; y: 17.49619; skew-x: -14.58202; skew-y: -14.71825; scale-x: 0.9025466; scale-y: 0.9096521; cel: 0; alpha: 1; }
        frame 35 { x: 17.36015; y: 18.35314; skew-x: -17.28855; skew-y: -17.28855; scale-x: 0.9044773; scale-y: 0.9044774; cel: 0; alpha: 1; }
        frame 36 { x: 17.36015; y: 18.35314; skew-x: -17.28855; skew-y: -17.28855; scale-x: 0.9044773; scale-y: 0.9044774; cel: 0; alpha: 1; }
        frame 37 { x: 15.24263; y: 20.47805; skew-x: -23.17499; skew-y: -22.71462; scale-x: 0.8832235; scale-y: 0.9047028; cel: 0; alpha: 1; }
        frame 38 { x: 12.93996; y: 22.63598; skew-x: -29.30351; skew-y: -28.37119; scale-x: 0.8802263; scale-y: 0.9234944; cel: 0; alpha: 1; }
        frame 39 { x: 10.9998; y: 25.1704; skew-x: -34.86913; skew-y: -34.39686; scale-x: 0.8698646; scale-y: 0.9200783; cel: 0; alpha: 1; }
        frame 40 { x: 8.99947; y: 27.64232; skew-x: -40.03114; skew-y: -40.67535; scale-x: 0.8805275; scale-y: 0.9273529; cel: 0; alpha: 1; }
        frame 41 { x: 7.187312; y: 30.18391; skew-x: -44.1908; skew-y: -46.88681; scale-x: 0.8948706; scale-y: 0.9216374; cel: 0; alpha: 1; }
        frame 42 { x: 5.587648; y: 32.79714; skew-x: -48.47164; skew-y: -53.1526; scale-x: 0.909212; scale-y: 0.9170228; cel: 0; alpha: 1; }
        frame 43 { x: 3.897775; y: 35.38645; skew-x: -52.80862; skew-y: -59.40745; scale-x: 0.926002; scale-y: 0.9158775; cel: 0; alpha: 1; }
        frame 44 { x: 11.28935; y: 25.69372; skew-x: -36.39088; skew-y: -35.23498; scale-x: 0.8687144; scale-y: 0.9356998; cel: 0; alpha: 1; }
        frame 45 { x: 19.98155; y: 17.46014; skew-x: -13.69689; skew-y: -13.65739; scale-x: 0.8713079; scale-y: 0.9589704; cel: 0; alpha: 1; }
        frame 46 { x: 26.13745; y: 13.16357; skew-x: 0.2577404; skew-y: 3.061469; scale-x: 0.9982446; scale-y: 0.8786852; cel: 0; alpha: 1; }
        frame 47 { x: 31.18378; y: 10.71545; skew-x: 14.35947; skew-y: 15.95334; scale-x: 1.039417; scale-y: 0.8292755; cel: 0; alpha: 1; }
        frame 48 { x: 34.30757; y: 9.191401; skew-x: 23.29749; skew-y: 25.77222; scale-x: 1.024559; scale-y: 0.8509539; cel: 0; alpha: 1; }
        frame 49 { x: 36.99058; y: 7.909633; skew-x: 32.60093; skew-y: 32.28593; scale-x: 1.016071; scale-y: 0.8795085; cel: 0; alpha: 1; }
        frame 50 { x: 39.84245; y: 6.709054; skew-x: 42.43243; skew-y: 38.3037; scale-x: 1.0598; scale-y: 0.8795043; cel: 0; alpha: 1; }
        frame 51 { x: 39.59133; y: 6.720226; skew-x: 37.33365; skew-y: 39.84442; scale-x: 1.063587; scale-y: 0.9098736; cel: 0; alpha: 1; }
        frame 52 { x: 38.41512; y: 7.22127; skew-x: 33.87871; skew-y: 36.3651; scale-x: 1.030549; scale-y: 0.9159294; cel: 0; alpha: 1; }
        frame 53 { x: 37.03619; y: 7.657227; skew-x: 30.3746; skew-y: 33.02885; scale-x: 1.006934; scale-y: 0.9228225; cel: 0; alpha: 1; }
        frame 54 { x: 35.7768; y: 8.344282; skew-x: 27.38757; skew-y: 30.38923; scale-x: 0.985072; scale-y: 0.9154944; cel: 0; alpha: 1; }
        frame 55 { x: 34.71596; y: 8.997252; skew-x: 25.07246; skew-y: 28.4939; scale-x: 0.9658651; scale-y: 0.9066734; cel: 0; alpha: 1; }
        frame 56 { x: 33.42525; y: 9.661807; skew-x: 22.2414; skew-y: 26.08115; scale-x: 0.9584296; scale-y: 0.9089448; cel: 0; alpha: 1; }
        frame 57 { x: 32.30214; y: 10.4427; skew-x: 18.96799; skew-y: 23.22433; scale-x: 0.9432513; scale-y: 0.9039497; cel: 0; alpha: 1; }
        frame 58 { x: 32.53511; y: 10.35271; skew-x: 19.10126; skew-y: 23.77222; scale-x: 0.9457446; scale-y: 0.9160669; cel: 0; alpha: 1; }
        frame 59 { x: 32.79788; y: 10.28609; skew-x: 19.66795; skew-y: 24.56957; scale-x: 0.9493771; scale-y: 0.9132885; cel: 0; alpha: 1; }
        frame 60 { x: 33.14693; y: 10.30203; skew-x: 20.40888; skew-y: 25.53595; scale-x: 0.9567952; scale-y: 0.9140964; cel: 0; alpha: 1; }
        frame 61 { x: 33.4164; y: 10.20181; skew-x: 21.02628; skew-y: 26.37364; scale-x: 0.9615983; scale-y: 0.9123443; cel: 0; alpha: 1; }
        frame 62 { x: 33.7082; y: 10.10302; skew-x: 21.70792; skew-y: 27.27036; scale-x: 0.9703253; scale-y: 0.9142467; cel: 0; alpha: 1; }
        frame 63 { x: 33.97544; y: 10.10155; skew-x: 22.56535; skew-y: 28.25905; scale-x: 0.9727867; scale-y: 0.911768; cel: 0; alpha: 1; }
        frame 64 { x: 34.2626; y: 10.15004; skew-x: 23.12527; skew-y: 29.41212; scale-x: 0.962104; scale-y: 0.9111919; cel: 0; alpha: 1; }
        frame 65 { x: 32.44377; y: 10.58954; skew-x: 17.60609; skew-y: 25.87689; scale-x: 0.9400557; scale-y: 0.9226874; cel: 0; alpha: 1; }
        frame 66 { x: 30.51543; y: 11.40949; skew-x: 11.82444; skew-y: 21.48375; scale-x: 0.9115302; scale-y: 0.9255612; cel: 0; alpha: 1; }
        frame 67 { x: 28.47944; y: 12.18572; skew-x: 6.745264; skew-y: 16.21864; scale-x: 0.8821755; scale-y: 0.9378064; cel: 0; alpha: 1; }
        frame 68 { x: 26.21198; y: 13.18156; skew-x: 0.8682172; skew-y: 9.999625; scale-x: 0.8579419; scale-y: 0.9453447; cel: 0; alpha: 1; }
        frame 69 { x: 24.42681; y: 14.25918; skew-x: -3.844686; skew-y: 5.047828; scale-x: 0.8521128; scale-y: 0.9289932; cel: 0; alpha: 1; }
        frame 70 { x: 22.62817; y: 15.2529; skew-x: -8.422997; skew-y: -0.8307497; scale-x: 0.8445027; scale-y: 0.9270979; cel: 0; alpha: 1; }
        frame 71 { x: 20.79778; y: 15.86433; skew-x: -12.36605; skew-y: -6.977678; scale-x: 0.8464367; scale-y: 0.9404651; cel: 0; alpha: 1; }
        frame 72 { x: 19.04498; y: 16.92902; skew-x: -14.89633; skew-y: -12.1056; scale-x: 0.8675898; scale-y: 0.9262594; cel: 0; alpha: 1; }
        frame 73 { x: 17.3544; y: 18.36354; skew-x: -17.27337; skew-y: -17.27338; scale-x: 0.9009107; scale-y: 0.9009108; cel: 0; alpha: 1; }
    }
    Track {
        source-name: "Cabbagepult_stalk2";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 5 { x: 28.10166; y: 20.33366; skew-x: -1.688545; skew-y: -1.688549; scale-x: 0.9044773; scale-y: 0.9044773; cel: 0; alpha: 1; image: IMAGE_REANIM_CABBAGEPULT_STALK2; }
        frame 6 { x: 27.11684; y: 20.84117; skew-x: -3.509291; skew-y: -3.930138; scale-x: 0.9008061; scale-y: 0.9061647; cel: 0; alpha: 1; }
        frame 7 { x: 26.21179; y: 21.48598; skew-x: -5.543717; skew-y: -6.394173; scale-x: 0.8970348; scale-y: 0.9076112; cel: 0; alpha: 1; }
        frame 8 { x: 25.23109; y: 21.95275; skew-x: -7.499078; skew-y: -8.787734; scale-x: 0.8908482; scale-y: 0.9064544; cel: 0; alpha: 1; }
        frame 9 { x: 24.22973; y: 22.49983; skew-x: -9.583062; skew-y: -11.31853; scale-x: 0.8880291; scale-y: 0.9085632; cel: 0; alpha: 1; }
        frame 10 { x: 23.25595; y: 23.12245; skew-x: -11.51823; skew-y: -13.70928; scale-x: 0.8852671; scale-y: 0.9105883; cel: 0; alpha: 1; }
        frame 11 { x: 22.50319; y: 23.58589; skew-x: -12.55876; skew-y: -15.215; scale-x: 0.8820009; scale-y: 0.9119549; cel: 0; alpha: 1; }
        frame 12 { x: 21.64616; y: 24.17295; skew-x: -14.32394; skew-y: -17.45351; scale-x: 0.87983; scale-y: 0.9142933; cel: 0; alpha: 1; }
        frame 13 { x: 21.98568; y: 23.75318; skew-x: -12.78145; skew-y: -16.39202; scale-x: 0.8738536; scale-y: 0.9124907; cel: 0; alpha: 1; }
        frame 14 { x: 22.2776; y: 23.34519; skew-x: -11.73804; skew-y: -15.85274; scale-x: 0.8667981; scale-y: 0.9081202; cel: 0; alpha: 1; }
        frame 15 { x: 22.67292; y: 23.17752; skew-x: -10.89907; skew-y: -14.75817; scale-x: 0.8639504; scale-y: 0.9017495; cel: 0; alpha: 1; }
        frame 16 { x: 23.76095; y: 22.49104; skew-x: -8.836392; skew-y: -12.24904; scale-x: 0.869246; scale-y: 0.9023534; cel: 0; alpha: 1; }
        frame 17 { x: 24.69417; y: 21.97169; skew-x: -6.812693; skew-y: -9.786527; scale-x: 0.878088; scale-y: 0.9064258; cel: 0; alpha: 1; }
        frame 18 { x: 25.62136; y: 21.24967; skew-x: -5.477773; skew-y: -8.020597; scale-x: 0.8879767; scale-y: 0.9113422; cel: 0; alpha: 1; }
        frame 19 { x: 26.75418; y: 20.60722; skew-x: -2.728199; skew-y: -4.849724; scale-x: 0.8943653; scale-y: 0.9124644; cel: 0; alpha: 1; }
        frame 20 { x: 28.04086; y: 19.84557; skew-x: -0.1413354; skew-y: -1.849929; scale-x: 0.9036402; scale-y: 0.9163264; cel: 0; alpha: 1; }
        frame 21 { x: 28.46886; y: 19.90819; skew-x: 0.1550391; skew-y: -1.148679; scale-x: 0.8967462; scale-y: 0.9036718; cel: 0; alpha: 1; }
        frame 22 { x: 28.8632; y: 19.85901; skew-x: 0.6496851; skew-y: -0.3971565; scale-x: 0.8974087; scale-y: 0.8999965; cel: 0; alpha: 1; }
        frame 23 { x: 29.46711; y: 19.70501; skew-x: 2.263728; skew-y: 0.9133985; scale-x: 0.9003163; scale-y: 0.9042671; cel: 0; alpha: 1; }
        frame 24 { x: 29.88044; y: 19.55957; skew-x: 3.125301; skew-y: 1.469154; scale-x: 0.897693; scale-y: 0.9029562; cel: 0; alpha: 1; }
        frame 25 { x: 30.31634; y: 19.50517; skew-x: 3.919954; skew-y: 1.955338; scale-x: 0.8901149; scale-y: 0.8966167; cel: 0; alpha: 1; }
        frame 26 { x: 30.80498; y: 19.42052; skew-x: 5.086526; skew-y: 2.810746; scale-x: 0.8858244; scale-y: 0.8935402; cel: 0; alpha: 1; }
        frame 27 { x: 31.25068; y: 19.33071; skew-x: 6.232406; skew-y: 3.642833; scale-x: 0.8849798; scale-y: 0.8939015; cel: 0; alpha: 1; }
        frame 28 { x: 31.72544; y: 19.24331; skew-x: 7.441704; skew-y: 5.428761; scale-x: 0.8935888; scale-y: 0.8955721; cel: 0; alpha: 1; }
        frame 29 { x: 32.10797; y: 19.16405; skew-x: 9.132929; skew-y: 7.68196; scale-x: 0.8995168; scale-y: 0.8942601; cel: 0; alpha: 1; }
        frame 30 { x: 32.69223; y: 19.06104; skew-x: 10.68431; skew-y: 9.840378; scale-x: 0.9058996; scale-y: 0.8976754; cel: 0; alpha: 1; }
        frame 31 { x: 31.66462; y: 19.33032; skew-x: 7.731056; skew-y: 7.12819; scale-x: 0.9065033; scale-y: 0.8991269; cel: 0; alpha: 1; }
        frame 32 { x: 30.63433; y: 19.46263; skew-x: 5.091843; skew-y: 4.640346; scale-x: 0.9139099; scale-y: 0.9083092; cel: 0; alpha: 1; }
        frame 33 { x: 29.82416; y: 19.79361; skew-x: 2.756572; skew-y: 2.45556; scale-x: 0.9141369; scale-y: 0.910394; cel: 0; alpha: 1; }
        frame 34 { x: 28.96872; y: 20.03693; skew-x: 0.650448; skew-y: 0.4998278; scale-x: 0.9082239; scale-y: 0.9063615; cel: 0; alpha: 1; }
        frame 35 { x: 28.10166; y: 20.33366; skew-x: -1.688545; skew-y: -1.688549; scale-x: 0.9044773; scale-y: 0.9044773; cel: 0; alpha: 1; }
        frame 36 { x: 28.10166; y: 20.33366; skew-x: -1.688545; skew-y: -1.688549; scale-x: 0.9044773; scale-y: 0.9044773; cel: 0; alpha: 1; }
        frame 37 { x: 25.87131; y: 21.39861; skew-x: -6.177708; skew-y: -6.343322; scale-x: 0.9040698; scale-y: 0.9106813; cel: 0; alpha: 1; }
        frame 38 { x: 23.57384; y: 22.48726; skew-x: -10.86521; skew-y: -11.20456; scale-x: 0.922743; scale-y: 0.9363789; cel: 0; alpha: 1; }
        frame 39 { x: 21.53409; y: 23.96562; skew-x: -15.73307; skew-y: -16.25694; scale-x: 0.9150589; scale-y: 0.9355832; cel: 0; alpha: 1; }
        frame 40 { x: 19.64423; y: 25.31333; skew-x: -20.40937; skew-y: -21.12599; scale-x: 0.91584; scale-y: 0.9435665; cel: 0; alpha: 1; }
        frame 41 { x: 17.97522; y: 26.71476; skew-x: -24.36844; skew-y: -25.2863; scale-x: 0.90046; scale-y: 0.9349784; cel: 0; alpha: 1; }
        frame 42 { x: 16.38843; y: 28.14066; skew-x: -28.39745; skew-y: -29.52279; scale-x: 0.8856119; scale-y: 0.9268663; cel: 0; alpha: 1; }
        frame 43 { x: 14.60753; y: 29.50493; skew-x: -32.43457; skew-y: -33.7731; scale-x: 0.8735825; scale-y: 0.9216566; cel: 0; alpha: 1; }
        frame 44 { x: 21.77511; y: 24.1467; skew-x: -14.14766; skew-y: -15.49627; scale-x: 0.9301439; scale-y: 0.9744238; cel: 0; alpha: 1; }
        frame 45 { x: 30.22164; y: 20.46424; skew-x: 2.779084; skew-y: 1.892011; scale-x: 0.9341974; scale-y: 0.9716701; cel: 0; alpha: 1; }
        frame 46 { x: 36.93747; y: 17.67783; skew-x: 23.69955; skew-y: 22.55626; scale-x: 0.9343487; scale-y: 0.9618664; cel: 0; alpha: 1; }
        frame 47 { x: 41.10813; y: 17.66711; skew-x: 33.97224; skew-y: 33.45191; scale-x: 0.9111054; scale-y: 0.9155764; cel: 0; alpha: 1; }
        frame 48 { x: 42.25911; y: 17.69147; skew-x: 36.27287; skew-y: 37.07201; scale-x: 0.9392284; scale-y: 0.9090947; cel: 0; alpha: 1; }
        frame 49 { x: 43.01541; y: 18.03371; skew-x: 37.17866; skew-y: 39.04424; scale-x: 0.9521556; scale-y: 0.8848047; cel: 0; alpha: 1; }
        frame 50 { x: 44.43881; y: 18.52055; skew-x: 40.75134; skew-y: 43.42324; scale-x: 0.9528041; scale-y: 0.8476258; cel: 0; alpha: 1; }
        frame 51 { x: 44.76622; y: 17.50837; skew-x: 42.63271; skew-y: 45.20407; scale-x: 1.005228; scale-y: 0.909809; cel: 0; alpha: 1; }
        frame 52 { x: 43.94039; y: 17.50512; skew-x: 40.03685; skew-y: 42.47494; scale-x: 0.9901014; scale-y: 0.9116447; cel: 0; alpha: 1; }
        frame 53 { x: 42.92377; y: 17.44795; skew-x: 37.02133; skew-y: 39.28851; scale-x: 0.9861341; scale-y: 0.9234038; cel: 0; alpha: 1; }
        frame 54 { x: 41.94363; y: 17.65747; skew-x: 34.00335; skew-y: 36.63631; scale-x: 0.9713678; scale-y: 0.9150273; cel: 0; alpha: 1; }
        frame 55 { x: 41.04747; y: 17.91426; skew-x: 31.5419; skew-y: 34.67854; scale-x: 0.956203; scale-y: 0.9037859; cel: 0; alpha: 1; }
        frame 56 { x: 40.05908; y: 18.23084; skew-x: 28.56344; skew-y: 32.20214; scale-x: 0.9527166; scale-y: 0.9035882; cel: 0; alpha: 1; }
        frame 57 { x: 39.22548; y: 18.53618; skew-x: 25.14142; skew-y: 29.28062; scale-x: 0.941571; scale-y: 0.8961432; cel: 0; alpha: 1; }
        frame 58 { x: 39.37941; y: 18.53167; skew-x: 25.12473; skew-y: 29.7629; scale-x: 0.9481435; scale-y: 0.9056114; cel: 0; alpha: 1; }
        frame 59 { x: 39.57498; y: 18.51692; skew-x: 25.59715; skew-y: 30.30214; scale-x: 0.9497802; scale-y: 0.9038119; cel: 0; alpha: 1; }
        frame 60 { x: 39.85869; y: 18.63776; skew-x: 26.24144; skew-y: 31.01227; scale-x: 0.9551605; scale-y: 0.9055497; cel: 0; alpha: 1; }
        frame 61 { x: 40.06212; y: 18.6048; skew-x: 26.75986; skew-y: 31.59556; scale-x: 0.9578847; scale-y: 0.9047412; cel: 0; alpha: 1; }
        frame 62 { x: 40.30521; y: 18.61477; skew-x: 27.34018; skew-y: 32.23977; scale-x: 0.9644697; scale-y: 0.9075469; cel: 0; alpha: 1; }
        frame 63 { x: 40.45195; y: 18.70375; skew-x: 27.99854; skew-y: 32.96127; scale-x: 0.9653809; scale-y: 0.9049885; cel: 0; alpha: 1; }
        frame 64 { x: 40.44319; y: 18.72555; skew-x: 28.30724; skew-y: 33.33328; scale-x: 0.9668511; scale-y: 0.9029258; cel: 0; alpha: 1; }
        frame 65 { x: 38.92324; y: 18.31001; skew-x: 24.47559; skew-y: 28.99343; scale-x: 0.9826621; scale-y: 0.9247221; cel: 0; alpha: 1; }
        frame 66 { x: 37.27199; y: 18.22915; skew-x: 20.47554; skew-y: 24.31561; scale-x: 0.9859333; scale-y: 0.9374109; cel: 0; alpha: 1; }
        frame 67 { x: 35.45041; y: 18.40052; skew-x: 15.89937; skew-y: 19.03383; scale-x: 0.9860376; scale-y: 0.9470004; cel: 0; alpha: 1; }
        frame 68 { x: 33.52855; y: 18.67256; skew-x: 10.67107; skew-y: 13.06917; scale-x: 0.9839942; scale-y: 0.9543375; cel: 0; alpha: 1; }
        frame 69 { x: 32.2293; y: 18.93859; skew-x: 7.704906; skew-y: 9.332756; scale-x: 0.9705377; scale-y: 0.9502713; cel: 0; alpha: 1; }
        frame 70 { x: 30.94854; y: 19.23614; skew-x: 4.79822; skew-y: 5.632196; scale-x: 0.956517; scale-y: 0.9451429; cel: 0; alpha: 1; }
        frame 71 { x: 29.77204; y: 19.26092; skew-x: 2.545673; skew-y: 2.560282; scale-x: 0.9526635; scale-y: 0.9496522; cel: 0; alpha: 1; }
        frame 72 { x: 28.82747; y: 19.67895; skew-x: 0.7606265; skew-y: 0.4247379; scale-x: 0.9325723; scale-y: 0.9319026; cel: 0; alpha: 1; }
        frame 73 { x: 28.03202; y: 20.33092; skew-x: -1.570713; skew-y: -1.930563; scale-x: 0.9047479; scale-y: 0.9026322; cel: 0; alpha: 1; }
    }
    Track {
        source-name: "Cabbagepult_stalk1";
        frame-count: 74;
        frame 0 { cel: -1; }
        frame 5 { x: 33.75082; y: 25.6333; skew-x: -1.688545; skew-y: -1.688547; scale-x: 0.9044773; scale-y: 0.9044773; cel: 0; alpha: 1; image: IMAGE_REANIM_CABBAGEPULT_STALK1; }
        frame 6 { x: 32.95414; y: 25.97377; skew-x: -3.665958; skew-y: -3.658159; scale-x: 0.9047015; scale-y: 0.9063089; cel: 0; alpha: 1; }
        frame 7 { x: 32.25118; y: 26.42063; skew-x: -5.865942; skew-y: -5.850616; scale-x: 0.9047506; scale-y: 0.9079668; cel: 0; alpha: 1; }
        frame 8 { x: 31.4435; y: 26.67601; skew-x: -7.995617; skew-y: -7.973054; scale-x: 0.9022736; scale-y: 0.9070866; cel: 0; alpha: 1; }
        frame 9 { x: 30.64283; y: 27.0068; skew-x: -10.26275; skew-y: -10.23324; scale-x: 0.903116; scale-y: 0.9095413; cel: 0; alpha: 1; }
        frame 10 { x: 29.85246; y: 27.42072; skew-x: -12.38994; skew-y: -12.35378; scale-x: 0.9039401; scale-y: 0.9119812; cel: 0; alpha: 1; }
        frame 11 { x: 29.20891; y: 27.76958; skew-x: -13.63177; skew-y: -13.58923; scale-x: 0.9041794; scale-y: 0.9138343; cel: 0; alpha: 1; }
        frame 12 { x: 28.51927; y: 28.15631; skew-x: -15.60692; skew-y: -15.55826; scale-x: 0.9054472; scale-y: 0.9167302; cel: 0; alpha: 1; }
        frame 13 { x: 28.76185; y: 27.90963; skew-x: -14.28285; skew-y: -14.22835; scale-x: 0.9026812; scale-y: 0.9155401; cel: 0; alpha: 1; }
        frame 14 { x: 28.97278; y: 27.60575; skew-x: -13.54925; skew-y: -13.51783; scale-x: 0.9001962; scale-y: 0.9116762; cel: 0; alpha: 1; }
        frame 15 { x: 29.24311; y: 27.51031; skew-x: -12.6576; skew-y: -12.65464; scale-x: 0.8967614; scale-y: 0.9047856; cel: 0; alpha: 1; }
        frame 16 { x: 30.15013; y: 27.06423; skew-x: -10.44115; skew-y: -10.46388; scale-x: 0.9000896; scale-y: 0.9047026; cel: 0; alpha: 1; }
        frame 17 { x: 30.92259; y: 26.79139; skew-x: -8.271843; skew-y: -8.321014; scale-x: 0.9069679; scale-y: 0.9081645; cel: 0; alpha: 1; }
        frame 18 { x: 31.74744; y: 26.24102; skew-x: -6.799548; skew-y: -6.875932; scale-x: 0.9147962; scale-y: 0.9125374; cel: 0; alpha: 1; }
        frame 19 { x: 32.62152; y: 25.89258; skew-x: -3.921838; skew-y: -4.026213; scale-x: 0.9189218; scale-y: 0.9131871; cel: 0; alpha: 1; }
        frame 20 { x: 33.66999; y: 25.41193; skew-x: -1.215304; skew-y: -1.348437; scale-x: 0.9259039; scale-y: 0.9166491; cel: 0; alpha: 1; }
        frame 21 { x: 33.97657; y: 25.42403; skew-x: -0.8075473; skew-y: -0.9702274; scale-x: 0.9162461; scale-y: 0.9036635; cel: 0; alpha: 1; }
        frame 22 { x: 34.2921; y: 25.39948; skew-x: -0.2771628; skew-y: -0.4726959; scale-x: 0.9157356; scale-y: 0.8997855; cel: 0; alpha: 1; }
        frame 23 { x: 34.77152; y: 25.43373; skew-x: 1.103147; skew-y: 0.8639931; scale-x: 0.9233982; scale-y: 0.9040599; cel: 0; alpha: 1; }
        frame 24 { x: 35.09957; y: 25.3696; skew-x: 1.729238; skew-y: 1.445886; scale-x: 0.9253915; scale-y: 0.9027662; cel: 0; alpha: 1; }
        frame 25 { x: 35.42766; y: 25.35637; skew-x: 2.286375; skew-y: 1.958224; scale-x: 0.9222257; scale-y: 0.8964595; cel: 0; alpha: 1; }
        frame 26 { x: 35.78864; y: 25.36492; skew-x: 3.213356; skew-y: 2.839788; scale-x: 0.9224045; scale-y: 0.8934301; cel: 0; alpha: 1; }
        frame 27 { x: 36.12638; y: 25.387; skew-x: 4.117577; skew-y: 3.698045; scale-x: 0.9261445; scale-y: 0.8938529; cel: 0; alpha: 1; }
        frame 28 { x: 36.45883; y: 25.40524; skew-x: 5.52966; skew-y: 5.07931; scale-x: 0.9309318; scale-y: 0.895086; cel: 0; alpha: 1; }
        frame 29 { x: 36.63233; y: 25.44565; skew-x: 7.408712; skew-y: 6.926669; scale-x: 0.9327533; scale-y: 0.8934568; cel: 0; alpha: 1; }
        frame 30 { x: 37.04921; y: 25.46374; skew-x: 9.417244; skew-y: 9.027586; scale-x: 0.9297987; scale-y: 0.8969007; cel: 0; alpha: 1; }
        frame 31 { x: 36.34957; y: 25.49549; skew-x: 6.748244; skew-y: 6.442285; scale-x: 0.9248114; scale-y: 0.8984808; cel: 0; alpha: 1; }
        frame 32 { x: 35.64665; y: 25.45384; skew-x: 4.352682; skew-y: 4.126591; scale-x: 0.9277219; scale-y: 0.9078085; cel: 0; alpha: 1; }
        frame 33 { x: 35.08566; y: 25.57667; skew-x: 2.262276; skew-y: 2.113809; scale-x: 0.9233353; scale-y: 0.9100535; cel: 0; alpha: 1; }
        frame 34 { x: 34.41162; y: 25.58605; skew-x: 0.4024889; skew-y: 0.3293841; scale-x: 0.9127892; scale-y: 0.9061893; cel: 0; alpha: 1; }
        frame 35 { x: 33.75082; y: 25.6333; skew-x: -1.688545; skew-y: -1.688547; scale-x: 0.9044773; scale-y: 0.9044773; cel: 0; alpha: 1; }
        frame 36 { x: 33.75082; y: 25.6333; skew-x: -1.688545; skew-y: -1.688547; scale-x: 0.9044773; scale-y: 0.9044773; cel: 0; alpha: 1; }
        frame 37 { x: 31.98448; y: 26.24992; skew-x: -5.75489; skew-y: -5.745687; scale-x: 0.8973535; scale-y: 0.9111448; cel: 0; alpha: 1; }
        frame 38 { x: 30.2702; y: 26.91961; skew-x: -10.01534; skew-y: -10.01341; scale-x: 0.9090149; scale-y: 0.9373675; cel: 0; alpha: 1; }
        frame 39 { x: 28.59861; y: 27.7833; skew-x: -14.45327; skew-y: -14.47511; scale-x: 0.8946476; scale-y: 0.9371303; cel: 0; alpha: 1; }
        frame 40 { x: 27.07945; y: 28.54102; skew-x: -18.69478; skew-y: -18.757; scale-x: 0.888608; scale-y: 0.9457222; cel: 0; alpha: 1; }
        frame 41 { x: 25.56415; y: 29.36707; skew-x: -22.2139; skew-y: -22.3333; scale-x: 0.8670069; scale-y: 0.9377344; cel: 0; alpha: 1; }
        frame 42 { x: 24.09361; y: 30.20447; skew-x: -25.79677; skew-y: -25.99029; scale-x: 0.8461172; scale-y: 0.9302353; cel: 0; alpha: 1; }
        frame 43 { x: 22.40859; y: 30.9816; skew-x: -29.38095; skew-y: -29.6657; scale-x: 0.8280956; scale-y: 0.9256592; cel: 0; alpha: 1; }
        frame 44 { x: 29.08076; y: 28.24049; skew-x: -11.54741; skew-y: -12.11297; scale-x: 0.8954262; scale-y: 0.9789795; cel: 0; alpha: 1; }
        frame 45 { x: 35.90406; y: 26.52394; skew-x: 4.549764; skew-y: 4.391745; scale-x: 0.9126952; scale-y: 0.9754722; cel: 0; alpha: 1; }
        frame 46 { x: 40.05361; y: 25.32763; skew-x: 24.72591; skew-y: 24.41699; scale-x: 0.9227874; scale-y: 0.9647765; cel: 0; alpha: 1; }
        frame 47 { x: 42.76582; y: 25.38966; skew-x: 35.02187; skew-y: 34.35782; scale-x: 0.8902805; scale-y: 0.9174211; cel: 0; alpha: 1; }
        frame 48 { x: 43.65715; y: 25.44571; skew-x: 37.56935; skew-y: 36.55165; scale-x: 0.8977374; scale-y: 0.9117171; cel: 0; alpha: 1; }
        frame 49 { x: 44.35968; y: 25.66014; skew-x: 38.4714; skew-y: 37.08285; scale-x: 0.889663; scale-y: 0.8905422; cel: 0; alpha: 1; }
        frame 50 { x: 45.4028; y: 25.99033; skew-x: 41.79218; skew-y: 40.015; scale-x: 0.8701625; scale-y: 0.8586227; cel: 0; alpha: 1; }
        frame 51 { x: 45.47407; y: 25.49561; skew-x: 43.91644; skew-y: 42.3607; scale-x: 0.9243079; scale-y: 0.9191123; cel: 0; alpha: 1; }
        frame 52 { x: 44.94941; y: 25.41468; skew-x: 41.54103; skew-y: 40.20238; scale-x: 0.9168257; scale-y: 0.9187786; cel: 0; alpha: 1; }
        frame 53 { x: 44.30618; y: 25.34912; skew-x: 38.71187; skew-y: 37.58602; scale-x: 0.9196472; scale-y: 0.9288359; cel: 0; alpha: 1; }
        frame 54 { x: 43.68702; y: 25.36039; skew-x: 36.04047; skew-y: 35.13395; scale-x: 0.9040391; scale-y: 0.9200592; cel: 0; alpha: 1; }
        frame 55 { x: 43.06148; y: 25.39871; skew-x: 33.97146; skew-y: 33.28368; scale-x: 0.8860899; scale-y: 0.9086896; cel: 0; alpha: 1; }
        frame 56 { x: 42.42333; y: 25.55776; skew-x: 31.38638; skew-y: 30.9142; scale-x: 0.8790432; scale-y: 0.9084104; cel: 0; alpha: 1; }
        frame 57 { x: 41.96219; y: 25.61109; skew-x: 28.35876; skew-y: 28.09908; scale-x: 0.8649933; scale-y: 0.9008315; cel: 0; alpha: 1; }
        frame 58 { x: 42.109; y: 25.64134; skew-x: 28.73757; skew-y: 28.68727; scale-x: 0.8672438; scale-y: 0.9102396; cel: 0; alpha: 1; }
        frame 59 { x: 42.24486; y: 25.63825; skew-x: 29.12468; skew-y: 29.04981; scale-x: 0.8689899; scale-y: 0.9085782; cel: 0; alpha: 1; }
        frame 60 { x: 42.45781; y: 25.80616; skew-x: 29.68303; skew-y: 29.58292; scale-x: 0.8741579; scale-y: 0.9104861; cel: 0; alpha: 1; }
        frame 61 { x: 42.5987; y: 25.79393; skew-x: 30.11489; skew-y: 29.98887; scale-x: 0.8768922; scale-y: 0.9098473; cel: 0; alpha: 1; }
        frame 62 { x: 42.78136; y: 25.8557; skew-x: 30.60801; skew-y: 30.45544; scale-x: 0.8831584; scale-y: 0.9128566; cel: 0; alpha: 1; }
        frame 63 { x: 42.843; y: 25.95644; skew-x: 31.17875; skew-y: 30.99894; scale-x: 0.8842258; scale-y: 0.910482; cel: 0; alpha: 1; }
        frame 64 { x: 42.795; y: 25.9789; skew-x: 31.39942; skew-y: 31.19173; scale-x: 0.8857776; scale-y: 0.9086153; cel: 0; alpha: 1; }
        frame 65 { x: 41.80207; y: 25.57382; skew-x: 27.30561; skew-y: 27.05842; scale-x: 0.9094253; scale-y: 0.9295866; cel: 0; alpha: 1; }
        frame 66 { x: 40.67497; y: 25.38989; skew-x: 22.97708; skew-y: 22.68658; scale-x: 0.9240148; scale-y: 0.941235; cel: 0; alpha: 1; }
        frame 67 { x: 39.43932; y: 25.35905; skew-x: 18.04807; skew-y: 17.71316; scale-x: 0.935776; scale-y: 0.9499189; cel: 0; alpha: 1; }
        frame 68 { x: 38.16364; y: 25.31363; skew-x: 12.43939; skew-y: 12.05903; scale-x: 0.9455588; scale-y: 0.9565285; cel: 0; alpha: 1; }
        frame 69 { x: 37.1814; y: 25.32841; skew-x: 9.06304; skew-y: 8.636169; scale-x: 0.9442802; scale-y: 0.9519271; cel: 0; alpha: 1; }
        frame 70 { x: 36.19776; y: 25.35787; skew-x: 5.722773; skew-y: 5.248342; scale-x: 0.9420825; scale-y: 0.9464197; cel: 0; alpha: 1; }
        frame 71 { x: 35.29883; y: 25.22339; skew-x: 3.012675; skew-y: 2.489683; scale-x: 0.949662; scale-y: 0.9507248; cel: 0; alpha: 1; }
        frame 72 { x: 34.43844; y: 25.37006; skew-x: 0.9762932; skew-y: 0.4131879; scale-x: 0.9351944; scale-y: 0.9328629; cel: 0; alpha: 1; }
        frame 73 { x: 33.68669; y: 25.62249; skew-x: -1.455906; skew-y: -2.053581; scale-x: 0.9090813; scale-y: 0.9034645; cel: 0; alpha: 1; }
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
