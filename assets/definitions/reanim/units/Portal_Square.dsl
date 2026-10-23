export component Portal_Square {
    fps: 12;
    Track {
        source-name: "anim_appear";
        frame-count: 60;
        frame 0 { x: 11.2; }
        frame 1 { x: -10000; }
        frame 13 { cel: -1; }
        frame 14 { cel: -10000; }
    }
    Track {
        source-name: "anim_pulse";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { x: 25.6; cel: 0; }
        frame 14 { x: -10000; cel: -10000; }
        frame 31 { cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "anim_pulse_reverse";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 31 { x: 11.2; cel: 0; }
        frame 32 { x: -10000; cel: -10000; }
        frame 47 { cel: -1; }
        frame 48 { cel: -10000; }
    }
    Track {
        source-name: "anim_dissapear";
        frame-count: 60;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 47 { x: 11.2; cel: 0; }
        frame 48 { x: -10000; cel: -10000; }
    }
    Track {
        source-name: "Portal_Square_glow";
        frame-count: 60;
        frame 0 { x: 46.8; y: 75.1; scale-x: 0.051; scale-y: 0.041; image: IMAGE_REANIM_PORTAL_SQUARE_GLOW; }
        frame 1 { x: -10000; y: 54.5; scale-x: -10000; scale-y: 0.301; image: none; }
        frame 2 { y: 33.8; scale-y: 0.56; }
        frame 3 { y: 13.2; scale-y: 0.82; }
        frame 4 { y: -7.2; scale-y: 1.079; }
        frame 5 { x: 46.3; y: -2.2; scale-x: 0.065; scale-y: 1.04; }
        frame 6 { x: 45.9; y: 2.6; scale-x: 0.078; scale-y: 1; }
        frame 7 { x: 36.3; y: 3; scale-x: 0.337; scale-y: -10000; }
        frame 8 { x: 26.8; y: 3.3; scale-x: 0.597; }
        frame 9 { x: 17.1; y: 3.5; scale-x: 0.856; }
        frame 10 { x: 7.1; y: 3.9; scale-x: 1.115; }
        frame 11 { x: 9.2; y: -10000; scale-x: 1.058; }
        frame 12 { x: 11.1; scale-x: 1; }
        frame 13 { x: -10000; scale-x: -10000; }
        frame 14 { x: 10.9; y: 3.1; scale-x: 1.015; scale-y: 1.01; alpha: 0.94; }
        frame 15 { x: 10.8; y: 2.5; scale-x: 1.03; scale-y: 1.02; alpha: 0.88; }
        frame 16 { x: 10.6; y: 1.8; scale-x: 1.045; scale-y: 1.03; alpha: 0.82; }
        frame 17 { x: 10.4; y: 1.1; scale-x: 1.06; scale-y: 1.04; alpha: 0.76; }
        frame 18 { x: 10.2; y: 0.3; scale-x: 1.075; scale-y: 1.05; alpha: 0.7; }
        frame 19 { x: 10; y: -0.2; scale-x: 1.089; scale-y: 1.06; alpha: 0.63; }
        frame 20 { x: 9.9; y: -0.9; scale-x: 1.104; scale-y: 1.07; alpha: 0.57; }
        frame 21 { x: 9.7; y: -1.6; scale-x: 1.119; scale-y: 1.08; alpha: 0.51; }
        frame 22 { x: 9.8; y: -0.9; scale-x: 1.106; scale-y: 1.071; alpha: 0.57; }
        frame 23 { x: 9.9; y: -0.3; scale-x: 1.093; scale-y: 1.062; alpha: 0.62; }
        frame 24 { x: 10.1; y: 0.2; scale-x: 1.079; scale-y: 1.053; alpha: 0.68; }
        frame 25 { x: 10.3; y: 0.8; scale-x: 1.066; scale-y: 1.044; alpha: 0.73; }
        frame 26 { x: 10.5; y: 1.4; scale-x: 1.053; scale-y: 1.035; alpha: 0.78; }
        frame 27 { x: 10.6; y: 2; scale-x: 1.04; scale-y: 1.027; alpha: 0.84; }
        frame 28 { x: 10.8; y: 2.6; scale-x: 1.026; scale-y: 1.018; alpha: 0.89; }
        frame 29 { x: 10.9; y: 3.2; scale-x: 1.013; scale-y: 1.009; alpha: 0.95; }
        frame 30 { x: 11.1; y: 3.9; scale-x: 1; scale-y: 1; alpha: 1; }
        frame 31 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; alpha: -10000; }
        frame 32 { x: 10.9; y: 3.1; scale-x: 1.015; scale-y: 1.01; alpha: 0.94; }
        frame 33 { x: 10.8; y: 2.5; scale-x: 1.03; scale-y: 1.02; alpha: 0.88; }
        frame 34 { x: 10.6; y: 1.8; scale-x: 1.045; scale-y: 1.03; alpha: 0.82; }
        frame 35 { x: 10.4; y: 1.1; scale-x: 1.06; scale-y: 1.04; alpha: 0.76; }
        frame 36 { x: 10.2; y: 0.3; scale-x: 1.075; scale-y: 1.05; alpha: 0.7; }
        frame 37 { x: 10; y: -0.2; scale-x: 1.089; scale-y: 1.06; alpha: 0.63; }
        frame 38 { x: 9.9; y: -0.9; scale-x: 1.104; scale-y: 1.07; alpha: 0.57; }
        frame 39 { x: 9.7; y: -1.6; scale-x: 1.119; scale-y: 1.08; alpha: 0.51; }
        frame 40 { x: 9.9; y: -0.8; scale-x: 1.102; scale-y: 1.068; alpha: 0.58; }
        frame 41 { x: 10.1; y: 0; scale-x: 1.085; scale-y: 1.057; alpha: 0.65; }
        frame 42 { x: 10.3; y: 0.7; scale-x: 1.068; scale-y: 1.045; alpha: 0.72; }
        frame 43 { x: 10.4; y: 1.5; scale-x: 1.051; scale-y: 1.034; alpha: 0.79; }
        frame 44 { x: 10.7; y: 2.3; scale-x: 1.034; scale-y: 1.023; alpha: 0.86; }
        frame 45 { x: 10.9; y: 3; scale-x: 1.017; scale-y: 1.011; alpha: 0.93; }
        frame 46 { x: 11.1; y: 3.9; scale-x: 1; scale-y: 1; alpha: 1; }
        frame 47 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; alpha: -10000; }
        frame 48 { x: 9.1; scale-x: 1.058; }
        frame 49 { x: 7.1; scale-x: 1.115; }
        frame 50 { x: 16.8; y: 3.5; scale-x: 0.856; }
        frame 51 { x: 26.5; y: 3.3; scale-x: 0.597; }
        frame 52 { x: 36.2; y: 3; scale-x: 0.337; }
        frame 53 { x: 45.9; y: 2.6; scale-x: 0.078; }
        frame 54 { x: 46.4; y: -2.2; scale-x: 0.065; scale-y: 1.04; }
        frame 55 { x: 46.8; y: -7.2; scale-x: 0.051; scale-y: 1.079; }
        frame 56 { x: -10000; y: 13.3; scale-x: -10000; scale-y: 0.82; }
        frame 57 { y: 33.9; scale-y: 0.56; }
        frame 58 { y: 54.5; scale-y: 0.301; }
        frame 59 { y: 75.1; scale-y: 0.041; }
    }
    Track {
        source-name: "Portal_Square_center";
        frame-count: 60;
        frame 0 { x: 47; y: 75.2; scale-x: 0.051; scale-y: 0.041; image: IMAGE_REANIM_PORTAL_SQUARE_CENTER; }
        frame 1 { x: -10000; y: 55.1; scale-x: -10000; scale-y: 0.301; image: none; }
        frame 2 { y: 35.1; scale-y: 0.56; }
        frame 3 { y: 15.2; scale-y: 0.82; }
        frame 4 { y: -4.9; scale-y: 1.079; }
        frame 5 { x: 46.5; y: 0; scale-x: 0.067; scale-y: 1.04; }
        frame 6 { x: 46; y: 4.8; scale-x: 0.083; scale-y: 1; }
        frame 7 { x: 37.5; y: 5.2; scale-x: 0.341; scale-y: -10000; }
        frame 8 { x: 29.1; y: 5.4; scale-x: 0.599; }
        frame 9 { x: 20.7; y: 5.7; scale-x: 0.857; }
        frame 10 { x: 11.9; y: 6; scale-x: 1.115; }
        frame 11 { x: 13.8; y: -10000; scale-x: 1.058; }
        frame 12 { x: 15.5; scale-x: 1; }
        frame 13 { x: -10000; scale-x: -10000; }
        frame 14 { x: 15.6; }
        frame 15 { x: 15.7; }
        frame 16 { x: 15.8; }
        frame 17 { x: 15.9; }
        frame 18 { x: 16; }
        frame 19 { x: 16.1; }
        frame 20 { x: 16.2; }
        frame 21 { x: 16.3; }
        frame 22 { x: 16.2; }
        frame 23 { x: 16.1; }
        frame 24 { x: -10000; }
        frame 25 { x: 16; }
        frame 26 { x: 15.9; }
        frame 27 { x: 15.8; }
        frame 28 { x: 15.7; }
        frame 29 { x: 15.6; }
        frame 30 { x: 15.5; }
        frame 31 { x: -10000; }
        frame 32 { x: 15.6; }
        frame 33 { x: 15.7; }
        frame 34 { x: 15.8; }
        frame 35 { x: 15.9; }
        frame 36 { x: 16; }
        frame 37 { x: 16.1; }
        frame 38 { x: 16.2; }
        frame 39 { x: 16.3; }
        frame 40 { x: 16.2; }
        frame 41 { x: 16.1; }
        frame 42 { x: 16; }
        frame 43 { x: 15.9; }
        frame 44 { x: 15.8; }
        frame 45 { x: 15.6; }
        frame 46 { x: 15.5; }
        frame 47 { x: -10000; }
        frame 48 { x: 13.7; scale-x: 1.058; }
        frame 49 { x: 11.9; scale-x: 1.115; }
        frame 50 { x: 20.5; y: 5.8; scale-x: 0.857; }
        frame 51 { x: 28.9; y: 5.5; scale-x: 0.599; }
        frame 52 { x: 37.5; y: 5.2; scale-x: 0.341; }
        frame 53 { x: 46; y: 4.8; scale-x: 0.083; }
        frame 54 { x: 46.5; y: 0; scale-x: 0.067; scale-y: 1.04; }
        frame 55 { x: 47; y: -4.9; scale-x: 0.051; scale-y: 1.079; }
        frame 56 { x: -10000; y: 15; scale-x: -10000; scale-y: 0.82; }
        frame 57 { y: 35.1; scale-y: 0.56; }
        frame 58 { y: 55.1; scale-y: 0.301; }
        frame 59 { y: 75.2; scale-y: 0.041; }
    }
}
