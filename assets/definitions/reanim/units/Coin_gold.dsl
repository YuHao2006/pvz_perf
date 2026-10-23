export component Coin_gold {
    fps: 30;
    Track {
        source-name: "glow";
        frame-count: 21;
        frame 0 { x: -27.1; y: -26.6; scale-x: 1.181; scale-y: 1.181; image: IMAGE_REANIM_COINGLOW; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -26.7; scale-x: 1.173; }
        frame 3 { x: -25.5; scale-x: 1.146; }
        frame 4 { x: -23.6; scale-x: 1.102; }
        frame 5 { x: -20.9; scale-x: 1.041; }
        frame 6 { x: -17.5; scale-x: 0.962; }
        frame 7 { x: -13.2; scale-x: 0.866; }
        frame 8 { x: -8.2; scale-x: 0.753; }
        frame 9 { x: -2.5; scale-x: 0.621; }
        frame 10 { x: 3.9; scale-x: 0.472; }
        frame 11 { x: -1.9; scale-x: 0.607; }
        frame 12 { x: -7.2; scale-x: 0.728; }
        frame 13 { x: -11.8; scale-x: 0.834; }
        frame 14 { x: -15.9; scale-x: 0.926; }
        frame 15 { x: -19.3; scale-x: 1.004; }
        frame 16 { x: -22.1; scale-x: 1.068; }
        frame 17 { x: -24.3; scale-x: 1.117; }
        frame 18 { x: -25.8; scale-x: 1.153; }
        frame 19 { x: -26.7; scale-x: 1.174; }
        frame 20 { x: -27.1; scale-x: 1.181; }
    }
    Track {
        source-name: "black";
        frame-count: 21;
        frame 0 { x: 0.7; y: -3.7; scale-x: 1.001; scale-y: 1.321; image: IMAGE_REANIM_COIN_BLACK_GOLD; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 0.9; scale-x: 0.974; }
        frame 3 { x: -10000; y: -3.8; scale-x: 0.946; }
        frame 4 { x: 1; y: -3.7; scale-x: 0.919; scale-y: 1.32; }
        frame 5 { x: 3.4; y: -3.6; scale-x: 0.79; scale-y: -10000; }
        frame 6 { x: 5.8; y: -3.7; scale-x: 0.661; }
        frame 7 { x: 8.6; y: -10000; scale-x: 0.541; }
        frame 8 { x: 11.2; scale-x: 0.421; }
        frame 9 { x: 14; scale-x: 0.301; }
        frame 10 { x: 17.1; scale-x: 0.226; scale-y: 1.321; }
        frame 11 { x: 17.6; scale-x: 0.289; scale-y: 1.32; }
        frame 12 { x: 15.1; scale-x: 0.402; scale-y: -10000; }
        frame 13 { x: 12.5; scale-x: 0.516; }
        frame 14 { x: 10.1; scale-x: 0.629; }
        frame 15 { x: 7.4; y: -3.8; scale-x: 0.75; }
        frame 16 { x: 4.6; y: -3.7; scale-x: 0.871; }
        frame 17 { x: 3.4; y: -10000; scale-x: 0.914; scale-y: 1.321; }
        frame 18 { x: 2; scale-x: 0.958; scale-y: -10000; }
        frame 19 { x: 0.7; scale-x: 1.001; }
        frame 20 { x: -10000; scale-x: -10000; }
    }
    Track {
        source-name: "face";
        frame-count: 21;
        frame 0 { x: 0.1; y: 0.1; image: IMAGE_REANIM_COIN_GOLD_DOLLAR; }
        frame 1 { x: -10000; y: -10000; image: none; }
        frame 2 { x: 2.5; scale-x: 0.89; }
        frame 3 { x: 5; scale-x: 0.779; }
        frame 4 { x: 7.4; scale-x: 0.669; }
        frame 5 { x: 9.9; scale-x: 0.559; }
        frame 6 { x: 12.3; scale-x: 0.448; }
        frame 7 { x: 14.7; scale-x: 0.338; }
        frame 8 { x: 17.2; scale-x: 0.228; }
        frame 9 { x: 19.6; scale-x: 0.117; }
        frame 10 { x: 22.1; scale-x: 0.007; }
        frame 11 { x: 19.9; scale-x: 0.106; }
        frame 12 { x: 17.7; scale-x: 0.206; }
        frame 13 { x: 15.6; scale-x: 0.305; }
        frame 14 { x: 13.4; scale-x: 0.404; }
        frame 15 { x: 11.2; scale-x: 0.503; }
        frame 16 { x: 9; scale-x: 0.603; }
        frame 17 { x: 6.8; scale-x: 0.702; }
        frame 18 { x: 4.7; scale-x: 0.801; }
        frame 19 { x: 2.5; scale-x: 0.901; }
        frame 20 { x: 0.1; scale-x: 1; }
    }
    Track {
        source-name: "shading";
        frame-count: 21;
        frame 0 { x: 0.3; y: -3.7; scale-x: 1.035; scale-y: 1.32; alpha: 0; image: IMAGE_REANIM_COIN_SHADING; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; alpha: -10000; image: none; }
        frame 2 { scale-x: 1.028; alpha: 0.01; }
        frame 3 { x: 0.1; scale-x: 1.007; alpha: 0.03; }
        frame 4 { x: -0; scale-x: 0.971; alpha: 0.07; }
        frame 5 { x: -0.4; scale-x: 0.921; alpha: 0.13; }
        frame 6 { x: 3.6; scale-x: 0.75; alpha: 0.23; }
        frame 7 { x: 7.8; scale-x: 0.579; scale-y: 1.321; alpha: 0.32; }
        frame 8 { x: 12.2; scale-x: 0.408; scale-y: -10000; alpha: 0.42; }
        frame 9 { x: 16.4; scale-x: 0.237; alpha: 0.51; }
        frame 10 { x: 22.4; scale-x: 0.01; scale-y: 1.351; alpha: 0.65; }
        frame 11 { x: 26.9; skew-x: 180; scale-x: 0.189; scale-y: 1.321; alpha: -10000; }
        frame 12 { x: 29.3; skew-x: -10000; scale-x: 0.3; scale-y: -10000; alpha: 0.58; }
        frame 13 { x: 31.6; scale-x: 0.41; alpha: 0.5; }
        frame 14 { x: 33.9; scale-x: 0.521; alpha: 0.43; }
        frame 15 { x: 36.3; scale-x: 0.631; alpha: 0.36; }
        frame 16 { x: 38; scale-x: 0.712; alpha: 0.29; }
        frame 17 { x: 39.8; scale-x: 0.793; scale-y: 1.32; alpha: 0.21; }
        frame 18 { x: 41.5; scale-x: 0.874; scale-y: -10000; alpha: 0.14; }
        frame 19 { x: 43.3; scale-x: 0.954; alpha: 0.07; }
        frame 20 { x: 44.8; scale-x: 1.035; alpha: 0; }
    }
}
