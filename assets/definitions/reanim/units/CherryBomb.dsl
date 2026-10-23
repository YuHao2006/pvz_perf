export component CherryBomb {
    fps: 30;
    Track {
        source-name: "anim_explode";
        frame-count: 27;
        frame 14 { cel: -1; }
        frame 15 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 27;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 14 { cel: 0; }
        frame 15 { cel: -10000; }
    }
    Track {
        source-name: "CherryBomb_leftstem";
        frame-count: 27;
        frame 0 { x: 31; y: 17.1; skew-x: 28.3; skew-y: 28.3; scale-x: 0.599; scale-y: 0.599; image: IMAGE_REANIM_CHERRYBOMB_LEFTSTEM; }
        frame 1 { x: 30.8; y: 16.9; skew-x: -10000; skew-y: -10000; scale-x: 0.598; scale-y: 0.598; image: none; }
        frame 2 { x: 30.6; y: 16.6; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 30.4; y: 16.3; skew-x: 28.6; skew-y: 28.6; scale-x: 0.599; scale-y: 0.599; }
        frame 4 { x: 30.2; y: 16; skew-x: -10000; skew-y: -10000; scale-x: 0.6; scale-y: 0.6; }
        frame 5 { x: 29.7; y: 15.3; skew-x: 29.1; skew-y: 29.1; scale-x: 0.599; scale-y: 0.599; }
        frame 6 { x: 29.4; y: 14.6; skew-x: 29.6; skew-y: 29.6; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 29; y: 13.7; skew-x: 30; skew-y: 30; scale-x: 0.6; scale-y: 0.6; }
        frame 8 { x: 29.4; y: 12.4; skew-x: 34.9; skew-y: 34.9; scale-x: 0.599; scale-y: 0.599; }
        frame 9 { x: 29.8; y: 11.1; skew-x: 40.1; skew-y: 40.1; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 30.2; y: 10; skew-x: 45; skew-y: 45; scale-x: 0.6; scale-y: 0.6; }
        frame 11 { x: 30; y: 8.6; skew-x: 44.9; skew-y: 44.9; scale-x: 0.599; scale-y: 0.599; }
        frame 12 { x: 29.9; y: 7.2; skew-x: 44.6; skew-y: 44.6; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 29.7; y: 5.9; skew-x: 44.4; skew-y: 44.4; }
        frame 14 { x: 31; y: 17.1; skew-x: 28.3; skew-y: 28.3; }
        frame 15 { x: 30.8; y: 16.9; skew-x: -10000; skew-y: -10000; scale-x: 0.598; scale-y: 0.598; }
        frame 16 { x: 30.6; y: 16.6; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 30.4; y: 16.3; skew-x: 28.6; skew-y: 28.6; scale-x: 0.599; scale-y: 0.599; }
        frame 18 { x: 30.2; y: 16; skew-x: -10000; skew-y: -10000; scale-x: 0.6; scale-y: 0.6; }
        frame 19 { x: 30.3; y: 16.2; scale-x: 0.599; scale-y: 0.599; }
        frame 20 { x: 30.4; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 30.5; y: 16.4; skew-x: 28.5; skew-y: 28.5; }
        frame 22 { x: -10000; y: 16.5; skew-x: 28.3; skew-y: 28.3; scale-x: 0.598; scale-y: 0.598; }
        frame 23 { x: 30.6; y: 16.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 30.8; y: 16.9; }
        frame 25 { x: 30.9; y: 17; }
        frame 26 { x: 31; y: 17.1; scale-x: 0.599; scale-y: 0.599; }
    }
    Track {
        source-name: "CherryBomb_left1";
        frame-count: 27;
        frame 0 { x: 4; y: 30.9; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHERRYBOMB_LEFT1; }
        frame 1 { x: 2.6; y: 29.5; skew-x: 0.8; skew-y: 0.8; scale-x: 0.847; scale-y: 0.847; image: none; }
        frame 2 { x: 1.5; y: 28; skew-x: 1.8; skew-y: 1.8; scale-x: 0.895; scale-y: 0.895; }
        frame 3 { x: 0.3; y: 26.5; skew-x: 2.8; skew-y: 2.8; scale-x: 0.942; scale-y: 0.942; }
        frame 4 { x: -0.6; y: 24.9; skew-x: 3.8; skew-y: 3.8; scale-x: 0.99; scale-y: 0.99; }
        frame 5 { x: -1.8; y: 22.7; skew-x: 4.8; skew-y: 4.8; scale-x: 1.03; scale-y: 1.039; }
        frame 6 { x: -3; y: 20.4; skew-x: 6; skew-y: 6; scale-x: 1.071; scale-y: 1.088; }
        frame 7 { x: -4; y: 18; skew-x: 7.3; skew-y: 7.3; scale-x: 1.112; scale-y: 1.138; }
        frame 8 { x: -5.4; y: 17.7; skew-x: 5.8; skew-y: 5.8; scale-x: 1.125; scale-y: 1.173; }
        frame 9 { x: -6.8; y: 17.4; skew-x: 4.5; skew-y: 4.5; scale-x: 1.139; scale-y: 1.209; }
        frame 10 { x: -8.3; y: 17.2; skew-x: 3.3; skew-y: 3.3; scale-x: 1.152; scale-y: 1.246; }
        frame 11 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 12 { cel: -10000; }
        frame 14 { x: 4; y: 30.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; cel: 0; }
        frame 15 { x: 2.6; y: 29.5; skew-x: 0.8; skew-y: 0.8; scale-x: 0.847; scale-y: 0.847; cel: -10000; }
        frame 16 { x: 1.5; y: 28; skew-x: 1.8; skew-y: 1.8; scale-x: 0.895; scale-y: 0.895; }
        frame 17 { x: 0.3; y: 26.5; skew-x: 2.8; skew-y: 2.8; scale-x: 0.942; scale-y: 0.942; }
        frame 18 { x: -0.6; y: 24.9; skew-x: 3.8; skew-y: 3.8; scale-x: 0.99; scale-y: 0.99; }
        frame 19 { x: -0.1; y: 25.7; skew-x: 3.3; skew-y: 3.3; scale-x: 0.966; scale-y: 0.966; }
        frame 20 { x: 0.3; y: 26.4; skew-x: 2.8; skew-y: 2.8; scale-x: 0.942; scale-y: 0.942; }
        frame 21 { x: 0.9; y: 27.3; skew-x: 2.3; skew-y: 2.3; scale-x: 0.919; scale-y: 0.919; }
        frame 22 { x: 1.6; y: 28.1; skew-x: 1.8; skew-y: 1.8; scale-x: 0.895; scale-y: 0.895; }
        frame 23 { x: 2; y: 28.8; skew-x: 1.3; skew-y: 1.3; scale-x: 0.871; scale-y: 0.871; }
        frame 24 { x: 2.7; y: 29.6; skew-x: 0.8; skew-y: 0.8; scale-x: 0.847; scale-y: 0.847; }
        frame 25 { x: 3.4; y: 30.3; skew-x: 0.3; skew-y: 0.3; scale-x: 0.824; scale-y: 0.824; }
        frame 26 { x: 4; y: 30.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CherryBomb_left3";
        frame-count: 27;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 7 { x: -6.9; y: 19.5; skew-x: 3.1; skew-y: 3.1; scale-x: 0.842; scale-y: 0.842; cel: 0; alpha: 0; image: IMAGE_REANIM_CHERRYBOMB_LEFT3; }
        frame 8 { x: -7.6; y: 18; skew-x: 3.5; skew-y: 3.5; scale-x: 0.871; scale-y: 0.873; cel: -10000; alpha: 0.33; image: none; }
        frame 9 { x: -8.4; y: 16.3; skew-x: 4.1; skew-y: 4.1; scale-x: 0.901; scale-y: 0.905; alpha: 0.67; }
        frame 10 { x: -9; y: 14.7; skew-x: 4.8; skew-y: 4.8; scale-x: 0.931; scale-y: 0.937; alpha: 1; }
        frame 11 { x: -10.3; y: 11.8; skew-x: 6.3; skew-y: 6.3; scale-x: 0.966; scale-y: 0.959; alpha: -10000; }
        frame 12 { x: -11.5; y: 8.6; skew-x: 8; skew-y: 8; scale-x: 1.001; scale-y: 0.981; }
        frame 13 { x: -12.4; y: 5.3; skew-x: 9.8; skew-y: 9.8; scale-x: 1.037; scale-y: 1.003; }
        frame 14 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 15 { cel: -10000; }
    }
    Track {
        source-name: "CherryBomb_lefteye11";
        frame-count: 27;
        frame 0 { x: 8.7; y: 41.6; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHERRYBOMB_LEFTEYE11; }
        frame 1 { x: 7.2; y: 40.6; scale-x: 0.841; scale-y: 0.841; image: none; }
        frame 2 { x: 5.7; y: 39.5; scale-x: 0.882; scale-y: 0.882; }
        frame 3 { x: 4.1; y: 38.5; scale-x: 0.923; scale-y: 0.923; }
        frame 4 { x: 2.5; y: 37.4; scale-x: 0.963; scale-y: 0.963; }
        frame 5 { x: 0.9; y: 36; scale-x: 1.002; scale-y: 1.016; }
        frame 6 { x: -0.6; y: 34.5; scale-x: 1.041; scale-y: 1.068; }
        frame 7 { x: -2.3; y: 33; scale-x: 1.08; scale-y: 1.12; }
        frame 8 { x: -3.9; y: 32.1; scale-x: 1.115; scale-y: 1.152; }
        frame 9 { x: -5.6; y: 31.2; scale-x: 1.15; scale-y: 1.183; }
        frame 10 { x: -7.2; y: 30.3; scale-x: 1.185; scale-y: 1.215; }
        frame 11 { x: -8.1; y: 27.7; skew-x: 3.3; skew-y: 3.3; scale-x: 1.184; scale-y: 1.214; }
        frame 12 { x: -8.9; y: 24.9; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -9.7; y: 22.1; skew-x: 10; skew-y: 10; }
        frame 14 { x: 8.7; y: 41.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 7.2; y: 40.6; skew-x: -10000; skew-y: -10000; scale-x: 0.841; scale-y: 0.841; }
        frame 16 { x: 5.7; y: 39.5; scale-x: 0.882; scale-y: 0.882; }
        frame 17 { x: 4.1; y: 38.5; scale-x: 0.923; scale-y: 0.923; }
        frame 18 { x: 2.5; y: 37.4; scale-x: 0.963; scale-y: 0.963; }
        frame 19 { x: 3.3; y: 38; scale-x: 0.943; scale-y: 0.943; }
        frame 20 { x: 4; y: 38.5; scale-x: 0.923; scale-y: 0.923; }
        frame 21 { x: 4.8; y: 39; scale-x: 0.902; scale-y: 0.902; }
        frame 22 { x: 5.6; y: 39.6; scale-x: 0.882; scale-y: 0.882; }
        frame 23 { x: 6.3; y: 40.1; scale-x: 0.861; scale-y: 0.861; }
        frame 24 { x: 7.1; y: 40.6; scale-x: 0.841; scale-y: 0.841; }
        frame 25 { x: 7.8; y: 41.1; scale-x: 0.82; scale-y: 0.82; }
        frame 26 { x: 8.7; y: 41.6; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CherryBomb_lefteye21";
        frame-count: 27;
        frame 0 { x: 21.2; y: 44.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHERRYBOMB_LEFTEYE21; }
        frame 1 { x: 20.7; y: 43.5; scale-x: 0.841; scale-y: 0.841; image: none; }
        frame 2 { x: 20.3; y: 42.6; scale-x: 0.882; scale-y: 0.882; }
        frame 3 { x: 19.8; y: 41.8; scale-x: 0.923; scale-y: 0.923; }
        frame 4 { x: 19.4; y: 40.9; scale-x: 0.963; scale-y: 0.963; }
        frame 5 { x: 19.1; y: 39.8; scale-x: 1.002; scale-y: 1.016; }
        frame 6 { x: 18.8; y: 38.6; scale-x: 1.041; scale-y: 1.068; }
        frame 7 { x: 18.5; y: 37.5; scale-x: 1.08; scale-y: 1.12; }
        frame 8 { x: 18.2; y: 36.9; scale-x: 1.115; scale-y: 1.152; }
        frame 9 { x: 17.9; y: 36.3; scale-x: 1.15; scale-y: 1.183; }
        frame 10 { x: 17.6; y: 35.7; scale-x: 1.185; scale-y: 1.215; }
        frame 11 { x: 16.8; y: 34.5; skew-x: 3.3; skew-y: 3.3; scale-x: 1.184; scale-y: 1.214; }
        frame 12 { x: 16; y: 33.1; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 15.4; y: 31.8; skew-x: 10; skew-y: 10; }
        frame 14 { x: 21.2; y: 44.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 20.7; y: 43.5; skew-x: -10000; skew-y: -10000; scale-x: 0.841; scale-y: 0.841; }
        frame 16 { x: 20.3; y: 42.6; scale-x: 0.882; scale-y: 0.882; }
        frame 17 { x: 19.8; y: 41.8; scale-x: 0.923; scale-y: 0.923; }
        frame 18 { x: 19.4; y: 40.9; scale-x: 0.963; scale-y: 0.963; }
        frame 19 { x: 19.6; y: 41.4; scale-x: 0.943; scale-y: 0.943; }
        frame 20 { x: 19.9; y: 41.7; scale-x: 0.923; scale-y: 0.923; }
        frame 21 { x: 20; y: 42.1; scale-x: 0.902; scale-y: 0.902; }
        frame 22 { x: 20.3; y: 42.6; scale-x: 0.882; scale-y: 0.882; }
        frame 23 { x: 20.5; y: 43; scale-x: 0.861; scale-y: 0.861; }
        frame 24 { x: 20.7; y: 43.4; scale-x: 0.841; scale-y: 0.841; }
        frame 25 { x: 21; y: 43.8; scale-x: 0.82; scale-y: 0.82; }
        frame 26 { x: 21.2; y: 44.3; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CherryBomb_leftmouth1";
        frame-count: 27;
        frame 0 { x: 9.2; y: 52.9; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHERRYBOMB_LEFTMOUTH1; }
        frame 1 { x: 7.6; y: 52.8; scale-x: 0.855; scale-y: 0.841; image: none; }
        frame 2 { x: 6; y: 52.7; scale-x: 0.91; scale-y: 0.882; }
        frame 3 { x: 4.4; y: 52.6; scale-x: 0.965; scale-y: 0.923; }
        frame 4 { x: 2.9; y: 52.5; scale-x: 1.02; scale-y: 0.963; }
        frame 5 { x: 1; y: -10000; scale-x: 1.101; scale-y: 1.016; }
        frame 6 { x: -0.8; y: 52.4; scale-x: 1.182; scale-y: 1.068; }
        frame 7 { x: -2.8; y: 52.3; scale-x: 1.263; scale-y: 1.12; }
        frame 8 { x: -4.9; y: 52.1; scale-x: 1.381; scale-y: 1.152; }
        frame 9 { x: -7.1; y: 52; scale-x: 1.498; scale-y: 1.183; }
        frame 10 { x: -9.1; y: 51.7; scale-x: 1.616; scale-y: 1.215; }
        frame 11 { x: -11.5; y: 48.9; skew-x: 3.3; skew-y: 3.3; scale-x: 1.643; scale-y: 1.214; }
        frame 12 { x: -13.7; y: 46.1; skew-x: 6.5; skew-y: 6.5; scale-x: 1.67; scale-y: -10000; }
        frame 13 { x: -15.9; y: 43.3; skew-x: 10; skew-y: 10; scale-x: 1.698; }
        frame 14 { x: 9.2; y: 52.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 7.6; y: 52.8; skew-x: -10000; skew-y: -10000; scale-x: 0.855; scale-y: 0.841; }
        frame 16 { x: 6; y: 52.7; scale-x: 0.91; scale-y: 0.882; }
        frame 17 { x: 4.4; y: 52.6; scale-x: 0.965; scale-y: 0.923; }
        frame 18 { x: 2.9; y: 52.5; scale-x: 1.02; scale-y: 0.963; }
        frame 19 { x: 3.6; y: 52.6; scale-x: 0.992; scale-y: 0.943; }
        frame 20 { x: 4.4; y: -10000; scale-x: 0.965; scale-y: 0.923; }
        frame 21 { x: 5.2; y: 52.7; scale-x: 0.937; scale-y: 0.902; }
        frame 22 { x: 6.1; y: 52.8; scale-x: 0.91; scale-y: 0.882; }
        frame 23 { x: 6.8; y: 52.9; scale-x: 0.882; scale-y: 0.861; }
        frame 24 { x: 7.6; y: -10000; scale-x: 0.855; scale-y: 0.841; }
        frame 25 { x: 8.4; scale-x: 0.827; scale-y: 0.82; }
        frame 26 { x: 9.2; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CherryBomb_rightstem";
        frame-count: 27;
        frame 0 { x: 34; y: 21.9; skew-x: 357.2; skew-y: 357.2; scale-x: 0.5; scale-y: 0.5; image: IMAGE_REANIM_CHERRYBOMB_RIGHTSTEM; }
        frame 1 { x: 34.5; y: 21.4; skew-x: 358.2; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 34.8; y: 21.1; skew-x: 359.2; }
        frame 3 { x: 35.1; y: 20.6; skew-x: 360; scale-x: 0.501; }
        frame 4 { x: 35.4; y: 20.2; skew-x: 361.1; skew-y: 357; scale-x: -10000; }
        frame 5 { x: 35.5; y: 18.7; skew-x: 362.8; skew-y: 359; scale-y: 0.502; }
        frame 6 { x: 35.4; y: 17.2; skew-x: 364.8; skew-y: 360.5; scale-x: 0.502; scale-y: 0.504; }
        frame 7 { x: -10000; y: 15.7; skew-x: 366.6; skew-y: 362.5; scale-x: 0.503; scale-y: 0.506; }
        frame 8 { x: 35.5; y: 14.7; skew-x: 367.8; skew-y: 365.3; scale-x: 0.502; scale-y: 0.503; }
        frame 9 { x: 35.8; y: 13.5; skew-x: 369.3; skew-y: 368.3; scale-x: 0.501; scale-y: 0.5; }
        frame 10 { x: 36.1; y: 12.5; skew-x: 370.6; skew-y: 371.3; scale-x: -10000; scale-y: 0.498; }
        frame 11 { x: 35.4; y: 10.9; skew-x: 373.5; skew-y: 374.1; scale-x: 0.524; scale-y: 0.516; }
        frame 12 { x: 35; y: 9.3; skew-x: 376.3; skew-y: 377.1; scale-x: 0.547; scale-y: 0.535; }
        frame 13 { x: 34.5; y: 7.6; skew-x: 379.4; skew-y: 380.1; scale-x: 0.57; scale-y: 0.554; }
        frame 14 { x: 34; y: 21.9; skew-x: 357.2; skew-y: 357.2; scale-x: 0.5; scale-y: 0.5; }
        frame 15 { x: 34.4; y: 21.6; skew-x: 358; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 34.5; y: 21.3; skew-x: 358.7; }
        frame 17 { x: 34.8; y: 21.1; skew-x: 359.2; }
        frame 18 { x: 35; y: 20.7; skew-x: 360; scale-x: 0.501; }
        frame 19 { x: 35.1; y: 20.6; skew-x: 360.3; scale-x: -10000; }
        frame 20 { x: 35.4; y: 20.2; skew-x: 361.1; skew-y: 357; }
        frame 21 { x: 35.2; y: 20.6; skew-x: 360.3; skew-y: 357.2; }
        frame 22 { x: 35; y: 20.7; skew-x: 360; skew-y: -10000; }
        frame 23 { x: 34.8; y: 21.1; skew-x: 359.2; scale-x: 0.5; }
        frame 24 { x: 34.5; y: 21.3; skew-x: 358.7; scale-x: -10000; }
        frame 25 { x: 34.3; y: 21.6; skew-x: 358; }
        frame 26 { x: 34; y: 21.9; skew-x: 357.2; }
    }
    Track {
        source-name: "CherryBomb_right1";
        frame-count: 27;
        frame 0 { x: 44.5; y: 31.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHERRYBOMB_RIGHT1; }
        frame 1 { x: 44; y: 30.6; scale-x: 0.84; scale-y: 0.84; image: none; }
        frame 2 { x: 43.6; y: 29.9; scale-x: 0.88; scale-y: 0.88; }
        frame 3 { x: 43.3; y: 29.2; scale-x: 0.919; scale-y: 0.919; }
        frame 4 { x: 42.7; y: 28.5; scale-x: 0.959; scale-y: 0.959; }
        frame 5 { x: 40.8; y: 27.5; skew-x: -0.9; skew-y: -0.9; scale-x: 1.026; scale-y: 1.023; }
        frame 6 { x: 38.8; y: 26.6; skew-x: -2.2; skew-y: -2.2; scale-x: 1.093; scale-y: 1.086; }
        frame 7 { x: 36.8; y: 25.9; skew-x: -3.4; skew-y: -3.4; scale-x: 1.161; scale-y: 1.15; }
        frame 8 { x: 35.2; y: 24.8; skew-x: -4.9; skew-y: -4.4; scale-x: 1.209; scale-y: 1.208; }
        frame 9 { x: 33.5; y: 23.7; skew-x: -6.5; skew-y: -5.5; scale-x: 1.258; scale-y: 1.267; }
        frame 10 { x: 31.8; y: 22.7; skew-x: -8.2; skew-y: -6.7; scale-x: 1.308; scale-y: 1.327; }
        frame 11 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 12 { cel: -10000; }
        frame 14 { x: 44.5; y: 31.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; cel: 0; }
        frame 15 { x: 44.1; y: 30.9; skew-x: -10000; skew-y: -10000; scale-x: 0.827; scale-y: 0.827; cel: -10000; }
        frame 16 { x: 43.9; y: 30.3; scale-x: 0.853; scale-y: 0.853; }
        frame 17 { x: 43.6; y: 29.9; scale-x: 0.88; scale-y: 0.88; }
        frame 18 { x: 43.4; y: 29.4; scale-x: 0.906; scale-y: 0.906; }
        frame 19 { x: 43; y: 29; scale-x: 0.933; scale-y: 0.933; }
        frame 20 { x: 42.7; y: 28.5; scale-x: 0.959; scale-y: 0.959; }
        frame 21 { x: 43; y: 29; scale-x: 0.933; scale-y: 0.933; }
        frame 22 { x: 43.3; y: 29.4; scale-x: 0.906; scale-y: 0.906; }
        frame 23 { x: 43.5; y: 30; scale-x: 0.88; scale-y: 0.88; }
        frame 24 { x: 43.9; y: 30.4; scale-x: 0.853; scale-y: 0.853; }
        frame 25 { x: 44.1; y: 30.9; scale-x: 0.827; scale-y: 0.827; }
        frame 26 { x: 44.5; y: 31.3; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CherryBomb_right3";
        frame-count: 27;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 7 { x: 38; y: 25.5; skew-x: -7.5; skew-y: -7.5; scale-x: 0.854; scale-y: 0.872; cel: 0; alpha: 0; image: IMAGE_REANIM_CHERRYBOMB_RIGHT3; }
        frame 8 { x: 35.8; y: 25.1; skew-x: -9; skew-y: -9; scale-x: 0.902; scale-y: 0.914; cel: -10000; alpha: 0.33; image: none; }
        frame 9 { x: 33.5; y: 24.8; skew-x: -10.7; skew-y: -10.7; scale-x: 0.95; scale-y: 0.956; alpha: 0.67; }
        frame 10 { x: 31; y: 24.5; skew-x: -12.5; skew-y: -12.5; scale-x: 0.999; scale-y: 0.999; alpha: 1; }
        frame 11 { x: 29.5; y: 24; skew-x: -13.4; skew-y: -13.4; scale-x: 1.038; scale-y: 1.038; alpha: -10000; }
        frame 12 { x: 27.8; y: 23.7; skew-x: -14.4; skew-y: -14.4; scale-x: 1.077; scale-y: 1.077; }
        frame 13 { x: 26.2; y: 23.3; skew-x: -15.5; skew-y: -15.5; scale-x: 1.116; scale-y: 1.116; }
        frame 14 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 15 { cel: -10000; }
    }
    Track {
        source-name: "CherryBomb_righteye11";
        frame-count: 27;
        frame 0 { x: 66.7; y: 42; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHERRYBOMB_RIGHTEYE11; }
        frame 1 { x: 67.5; y: 41.5; scale-x: 0.831; scale-y: 0.831; image: none; }
        frame 2 { x: 68.3; y: 41; scale-x: 0.862; scale-y: 0.862; }
        frame 3 { x: 69.1; y: 40.6; scale-x: 0.892; scale-y: 0.892; }
        frame 4 { x: 69.9; y: 40.1; scale-x: 0.923; scale-y: 0.923; }
        frame 5 { x: 70.7; y: 39.3; scale-x: 0.949; scale-y: 0.949; }
        frame 6 { x: 71.5; y: 38.5; scale-x: 0.975; scale-y: 0.975; }
        frame 7 { x: 72.3; y: 37.5; scale-x: 1; scale-y: 1; }
        frame 8 { x: 73.3; y: 36.3; scale-x: 1.029; scale-y: 1.029; }
        frame 9 { x: 74.3; y: 35.2; scale-x: 1.057; scale-y: 1.057; }
        frame 10 { x: 75.3; y: 34; scale-x: 1.085; scale-y: 1.085; }
        frame 11 { x: 75.6; y: 32.8; scale-x: 1.129; scale-y: 1.129; }
        frame 12 { x: 76; y: 31.5; scale-x: 1.174; scale-y: 1.174; }
        frame 13 { x: 76.2; y: 30.2; scale-x: 1.218; scale-y: 1.218; }
        frame 14 { x: 66.7; y: 42; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 67.2; y: 41.6; scale-x: 0.82; scale-y: 0.82; }
        frame 16 { x: 67.7; y: 41.4; scale-x: 0.841; scale-y: 0.841; }
        frame 17 { x: 68.3; y: 41; scale-x: 0.862; scale-y: 0.862; }
        frame 18 { x: 68.9; y: 40.8; scale-x: 0.882; scale-y: 0.882; }
        frame 19 { x: 69.4; y: 40.5; scale-x: 0.903; scale-y: 0.903; }
        frame 20 { x: 69.9; y: 40.1; scale-x: 0.923; scale-y: 0.923; }
        frame 21 { x: 69.3; y: 40.5; scale-x: 0.903; scale-y: 0.903; }
        frame 22 { x: 68.8; y: 40.8; scale-x: 0.882; scale-y: 0.882; }
        frame 23 { x: 68.3; y: 41; scale-x: 0.862; scale-y: 0.862; }
        frame 24 { x: 67.7; y: 41.4; scale-x: 0.841; scale-y: 0.841; }
        frame 25 { x: 67.2; y: 41.6; scale-x: 0.82; scale-y: 0.82; }
        frame 26 { x: 66.7; y: 42; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CherryBomb_righteye21";
        frame-count: 27;
        frame 0 { x: 51.4; y: 45.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHERRYBOMB_RIGHTEYE21; }
        frame 1 { x: 51.1; y: -10000; scale-x: 0.835; scale-y: 0.835; image: none; }
        frame 2 { x: 50.8; scale-x: 0.87; scale-y: 0.87; }
        frame 3 { x: 50.5; y: 45.4; scale-x: 0.905; scale-y: 0.905; }
        frame 4 { x: 50.1; y: -10000; scale-x: 0.94; scale-y: 0.94; }
        frame 5 { x: 49; y: 44.6; scale-x: 1.035; scale-y: 1.035; }
        frame 6 { x: 48; y: 43.9; scale-x: 1.131; scale-y: 1.131; }
        frame 7 { x: 46.9; y: 43.1; scale-x: 1.226; scale-y: 1.226; }
        frame 8 { x: 46; y: 42.4; scale-x: 1.261; scale-y: 1.261; }
        frame 9 { x: 44.9; y: 41.8; scale-x: 1.295; scale-y: 1.295; }
        frame 10 { x: 44; y: 41; scale-x: 1.33; scale-y: 1.33; }
        frame 11 { x: 42.3; y: 40.3; scale-x: 1.384; scale-y: 1.384; }
        frame 12 { x: 40.5; y: 39.5; scale-x: 1.439; scale-y: 1.439; }
        frame 13 { x: 38.6; y: 38.7; scale-x: 1.493; scale-y: 1.493; }
        frame 14 { x: 51.4; y: 45.5; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 51.2; y: -10000; scale-x: 0.823; scale-y: 0.823; }
        frame 16 { x: 51; y: 45.4; scale-x: 0.847; scale-y: 0.847; }
        frame 17 { x: 50.8; y: 45.5; scale-x: 0.87; scale-y: 0.87; }
        frame 18 { x: 50.5; y: 45.4; scale-x: 0.893; scale-y: 0.893; }
        frame 19 { x: 50.4; y: -10000; scale-x: 0.917; scale-y: 0.917; }
        frame 20 { x: 50.1; scale-x: 0.94; scale-y: 0.94; }
        frame 21 { x: 50.4; y: 45.5; scale-x: 0.917; scale-y: 0.917; }
        frame 22 { x: 50.5; y: -10000; scale-x: 0.893; scale-y: 0.893; }
        frame 23 { x: 50.8; scale-x: 0.87; scale-y: 0.87; }
        frame 24 { x: 51; scale-x: 0.847; scale-y: 0.847; }
        frame 25 { x: 51.2; scale-x: 0.823; scale-y: 0.823; }
        frame 26 { x: 51.4; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CherryBomb_rightmouth1";
        frame-count: 27;
        frame 0 { x: 63.1; y: 50.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHERRYBOMB_RIGHTMOUTH1; }
        frame 1 { x: 63.4; y: 50.8; scale-x: 0.892; scale-y: 0.831; image: none; }
        frame 2 { x: 63.6; y: 51.2; scale-x: 0.985; scale-y: 0.862; }
        frame 3 { x: 63.9; y: 51.5; scale-x: 1.077; scale-y: 0.892; }
        frame 4 { x: 64.2; y: 51.8; scale-x: 1.169; scale-y: 0.923; }
        frame 5 { x: 64; y: -10000; scale-x: 1.394; scale-y: 0.949; }
        frame 6 { x: 63.6; y: 51.6; scale-x: 1.619; scale-y: 0.975; }
        frame 7 { x: 63.4; y: -10000; scale-x: 1.844; scale-y: 1; }
        frame 8 { x: 63.1; y: 51.8; skew-x: -0.4; scale-x: 2.045; scale-y: 0.987; }
        frame 9 { x: 62.9; y: 52; skew-x: -1.2; scale-x: 2.246; scale-y: 0.973; }
        frame 10 { x: 62.6; y: 52.3; skew-x: -2; scale-x: 2.446; scale-y: 0.96; }
        frame 11 { x: 60.8; y: -10000; skew-x: -3.4; skew-y: -1.4; scale-x: 2.759; scale-y: 0.999; }
        frame 12 { x: 58.5; y: 52.5; skew-x: -5.2; skew-y: -3; scale-x: 3.072; scale-y: 1.038; }
        frame 13 { x: 56.4; y: 52.7; skew-x: -6.8; skew-y: -4.7; scale-x: 3.386; scale-y: 1.077; }
        frame 14 { x: 63.1; y: 50.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 63.3; y: 50.7; skew-x: -10000; skew-y: -10000; scale-x: 0.862; scale-y: 0.82; }
        frame 16 { x: 63.4; y: 51; scale-x: 0.923; scale-y: 0.841; }
        frame 17 { x: 63.6; y: 51.2; scale-x: 0.985; scale-y: 0.862; }
        frame 18 { x: 63.8; y: 51.4; scale-x: 1.046; scale-y: 0.882; }
        frame 19 { x: 64; y: 51.6; scale-x: 1.108; scale-y: 0.903; }
        frame 20 { x: 64.2; y: 51.8; scale-x: 1.169; scale-y: 0.923; }
        frame 21 { x: 64; y: 51.5; scale-x: 1.108; scale-y: 0.903; }
        frame 22 { x: 63.9; y: 51.4; scale-x: 1.046; scale-y: 0.882; }
        frame 23 { x: 63.6; y: 51.1; scale-x: 0.985; scale-y: 0.862; }
        frame 24 { x: 63.5; y: 50.9; scale-x: 0.923; scale-y: 0.841; }
        frame 25 { x: 63.3; y: 50.6; scale-x: 0.862; scale-y: 0.82; }
        frame 26 { x: 63.1; y: 50.5; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CherryBomb_leaf3";
        frame-count: 27;
        frame 0 { x: 36.1; y: 11.7; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHERRYBOMB_LEAF3; }
        frame 1 { x: 37; y: 10.8; skew-x: 7.3; skew-y: 8; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 38.1; y: 9.9; skew-x: 14.8; skew-y: 16.1; scale-x: 0.798; scale-y: -10000; }
        frame 3 { x: 39.5; y: 9.1; skew-x: 22.3; skew-y: 24.3; scale-x: -10000; scale-y: 0.798; }
        frame 4 { x: 40.8; y: 8.7; skew-x: 29.7; skew-y: 32.5; scale-y: 0.799; }
        frame 5 { x: 40.6; y: 7.8; skew-x: 28.3; skew-y: 30.8; scale-x: 0.797; scale-y: 0.798; }
        frame 6 { x: 40.5; y: 6.9; skew-x: 27.3; skew-y: 29.3; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 40.3; y: 6; skew-x: 26.1; skew-y: 27.8; }
        frame 8 { x: 40.2; y: 5.1; skew-x: 24.8; skew-y: 26.3; scale-y: 0.797; }
        frame 9 { x: 40; y: 4.2; skew-x: 23.6; skew-y: 24.8; scale-y: -10000; }
        frame 10 { x: 39.9; y: 3.3; skew-x: 22.3; skew-y: 23.3; }
        frame 11 { x: -10000; y: 2.4; skew-x: 21.1; skew-y: 21.8; }
        frame 12 { x: 39.7; y: 1.5; skew-x: 20; skew-y: 20.3; }
        frame 13 { x: 39.5; y: 0.5; skew-x: 18.8; skew-y: 18.8; scale-x: 0.798; scale-y: 0.798; }
        frame 14 { x: 36.1; y: 11.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 35.4; y: 12; skew-x: -5.2; skew-y: -4.7; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 34.7; y: 12.4; skew-x: -10.4; skew-y: -9.4; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { x: 35.9; y: 11.1; skew-x: -0.2; skew-y: 0.8; scale-x: -10000; scale-y: 0.799; }
        frame 18 { x: 37.3; y: 10.1; skew-x: 9.5; skew-y: 11.3; scale-y: 0.798; }
        frame 19 { x: 38.9; y: 9.2; skew-x: 19.6; skew-y: 21.8; scale-x: 0.797; scale-y: -10000; }
        frame 20 { x: 40.8; y: 8.7; skew-x: 29.7; skew-y: 32.5; scale-x: 0.798; scale-y: 0.799; }
        frame 21 { x: 39.9; y: -10000; skew-x: 30.3; skew-y: 27; scale-x: 0.802; scale-y: 0.798; }
        frame 22 { x: 39; skew-x: 31.1; skew-y: 21.6; scale-x: 0.809; scale-y: -10000; }
        frame 23 { x: 38; y: 9.4; skew-x: 23.3; skew-y: 16.1; scale-x: 0.806; }
        frame 24 { x: 37.3; y: 10.1; skew-x: 15.5; skew-y: 10.8; scale-x: 0.804; scale-y: 0.799; }
        frame 25 { x: 36.6; y: 10.8; skew-x: 7.8; skew-y: 5.3; scale-x: 0.802; scale-y: -10000; }
        frame 26 { x: 36.1; y: 11.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CherryBomb_leaf2tip";
        frame-count: 27;
        frame 0 { x: 25.5; y: 7.6; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHERRYBOMB_LEAF2TIP; }
        frame 1 { x: 25.6; y: 7.5; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 25.7; y: 7.4; skew-x: -11.2; skew-y: -11.2; scale-x: 0.798; scale-y: 0.798; }
        frame 3 { x: 25.8; y: 7.3; skew-x: -16.7; skew-y: -16.7; scale-x: 0.797; scale-y: 0.797; }
        frame 4 { x: 26; y: -10000; skew-x: -22.4; skew-y: -22.4; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { x: 27.8; y: 5; skew-x: -9.7; skew-y: -7.2; scale-x: 0.797; scale-y: 0.804; }
        frame 6 { x: 29.8; y: 3; skew-x: 2.6; skew-y: 7.5; scale-x: -10000; scale-y: 0.811; }
        frame 7 { x: 31.8; y: 1.1; skew-x: 15.3; skew-y: 22.6; scale-y: 0.817; }
        frame 8 { x: 33.8; y: -0.4; skew-x: 27.8; skew-y: 37.6; scale-x: 0.796; scale-y: 0.824; }
        frame 9 { x: 35.9; y: -1.9; skew-x: 40.6; skew-y: 52.7; scale-x: -10000; scale-y: 0.83; }
        frame 10 { x: 37.8; y: -3.2; skew-x: 53.2; skew-y: 67.9; scale-y: 0.838; }
        frame 11 { x: 39.5; y: -4.2; skew-x: 65.9; skew-y: 83; scale-y: 0.845; }
        frame 12 { x: 41.2; y: -5.3; skew-x: 78.5; skew-y: 97.8; scale-y: 0.852; }
        frame 13 { x: 42.8; y: -6.3; skew-x: 91; skew-y: 113; scale-y: 0.859; }
        frame 14 { x: 25.5; y: 7.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 25.9; y: 7.2; skew-x: -3.7; skew-y: -3.7; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 26.4; y: 6.7; skew-x: -7.4; skew-y: -7.4; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 26.3; y: 6.8; skew-x: -11.2; skew-y: -11.2; scale-x: 0.798; scale-y: 0.798; }
        frame 18 { x: 26.1; y: 7; skew-x: -14.9; skew-y: -14.9; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -10000; y: 7.1; skew-x: -18.7; skew-y: -18.7; scale-x: 0.797; scale-y: 0.797; }
        frame 20 { x: 26; y: 7.3; skew-x: -22.4; skew-y: -22.4; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 24.7; y: 9.4; skew-x: -26.2; skew-y: -28.5; scale-x: 0.776; scale-y: 0.819; }
        frame 22 { x: 23.6; y: 11.6; skew-x: -30.1; skew-y: -34.6; scale-x: 0.757; scale-y: 0.843; }
        frame 23 { x: 24; y: 10.6; skew-x: -22.5; skew-y: -25.9; scale-x: 0.767; scale-y: 0.831; }
        frame 24 { x: 24.5; y: 9.6; skew-x: -14.9; skew-y: -17.2; scale-x: 0.778; scale-y: 0.821; }
        frame 25 { x: 25; y: 8.7; skew-x: -7.4; skew-y: -8.5; scale-x: 0.789; scale-y: 0.81; }
        frame 26 { x: 25.5; y: 7.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CherryBomb_leaf2";
        frame-count: 27;
        frame 0 { x: 27.2; y: 5.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHERRYBOMB_LEAF2; }
        frame 1 { x: -10000; y: 5.2; skew-x: -0.5; skew-y: -0.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 27.3; y: 4.8; skew-x: -1.2; skew-y: -1.2; scale-x: 0.799; scale-y: 0.799; }
        frame 3 { x: 27.5; y: 4.5; skew-x: -2; skew-y: -2; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 27.4; y: 4.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.798; scale-y: 0.798; }
        frame 5 { x: 28.9; y: 2.3; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 30.5; y: 0.6; skew-x: 8; skew-y: 8; }
        frame 7 { x: 32; y: -0.8; skew-x: 13.5; skew-y: 13.5; }
        frame 8 { x: 33.6; y: -2.4; skew-x: 19.1; skew-y: 19.1; scale-x: 0.797; scale-y: 0.797; }
        frame 9 { x: 35.4; y: -3.8; skew-x: 24.6; skew-y: 24.6; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 37; y: -5.2; skew-x: 30.3; skew-y: 30.3; }
        frame 11 { x: 38.6; y: -6.4; skew-x: 35.8; skew-y: 35.8; }
        frame 12 { x: 40.4; y: -7.6; skew-x: 41.4; skew-y: 41.4; }
        frame 13 { x: 42; y: -8.7; skew-x: 46.9; skew-y: 46.9; scale-x: 0.798; scale-y: 0.798; }
        frame 14 { x: 27.2; y: 5.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 28.2; y: 4.3; skew-x: 5; skew-y: 5; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 29.4; y: 3.1; skew-x: 10.2; skew-y: 10.2; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 28.9; y: 3.3; skew-x: 6.8; skew-y: 6.8; }
        frame 18 { x: 28.4; y: 3.5; skew-x: 3.5; skew-y: 3.5; }
        frame 19 { x: 28; y: 3.8; skew-x: 0.3; skew-y: 0.3; }
        frame 20 { x: 27.4; y: 4.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 25.7; y: 6.1; skew-x: -9.2; skew-y: -12.7; scale-x: 0.788; scale-y: 0.812; }
        frame 22 { x: 24; y: 8.4; skew-x: -15.8; skew-y: -22.6; scale-x: 0.777; scale-y: 0.826; }
        frame 23 { x: 24.7; y: 7.5; skew-x: -11.7; skew-y: -16.9; scale-x: 0.783; scale-y: 0.819; }
        frame 24 { x: 25.5; y: 6.7; skew-x: -7.7; skew-y: -11.2; scale-x: 0.788; scale-y: 0.813; }
        frame 25 { x: 26.3; y: 5.9; skew-x: -3.7; skew-y: -5.4; scale-x: 0.794; scale-y: 0.806; }
        frame 26 { x: 27.2; y: 5.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CherryBomb_leaf1";
        frame-count: 27;
        frame 0 { x: 23.3; y: 14.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_CHERRYBOMB_LEAF1; }
        frame 1 { x: 23.6; y: 13.1; skew-x: 0.8; skew-y: 0.8; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 24; y: 12.1; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 24.3; y: 11.1; skew-x: 2.8; skew-y: 2.8; scale-x: 0.798; scale-y: 0.798; }
        frame 4 { x: 24.6; y: 10; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 25.5; y: 7.9; skew-x: 8.5; skew-y: 9.3; scale-x: 0.797; }
        frame 6 { x: 26.5; y: 5.9; skew-x: 13.3; skew-y: 14.8; scale-x: -10000; }
        frame 7 { x: 27.5; y: 4; skew-x: 18; skew-y: 20.5; scale-y: 0.799; }
        frame 8 { x: 28.5; y: 2.1; skew-x: 22.8; skew-y: 26.1; scale-x: 0.796; scale-y: -10000; }
        frame 9 { x: 29.5; y: 0.5; skew-x: 27.3; skew-y: 31.6; scale-x: -10000; scale-y: 0.8; }
        frame 10 { x: 30.5; y: -0.9; skew-x: 32.1; skew-y: 37.1; scale-y: 0.801; }
        frame 11 { x: 31.5; y: -2.5; skew-x: 36.9; skew-y: 42.8; scale-y: 0.802; }
        frame 12 { x: 32.5; y: -3.9; skew-x: 41.6; skew-y: 48.4; scale-x: 0.797; scale-y: 0.803; }
        frame 13 { x: 33.5; y: -5.2; skew-x: 46.4; skew-y: 53.9; scale-x: 0.798; scale-y: 0.805; }
        frame 14 { x: 23.3; y: 14.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 23.2; y: 12; skew-x: 6.8; skew-y: 0.5; scale-x: 0.811; scale-y: 0.798; }
        frame 16 { x: -10000; y: 9.9; skew-x: 13.6; skew-y: 1.3; scale-x: 0.822; scale-y: 0.795; }
        frame 17 { x: 23.6; y: 10; skew-x: 11; skew-y: 1.8; scale-x: 0.816; scale-y: 0.796; }
        frame 18 { x: 23.9; skew-x: 8.6; skew-y: 2.5; scale-x: 0.81; scale-y: 0.797; }
        frame 19 { x: 24.3; skew-x: 6.3; skew-y: 3.1; scale-x: 0.804; scale-y: -10000; }
        frame 20 { x: 24.6; y: -10000; skew-x: 3.8; skew-y: 3.8; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 24.4; y: 11.3; skew-x: 0; skew-y: 3; scale-x: 0.799; scale-y: 0.8; }
        frame 22 { x: 24.2; y: 12.6; skew-x: -3.5; skew-y: 2.5; scale-x: -10000; scale-y: 0.802; }
        frame 23 { x: 23.9; y: 13; skew-x: -2.4; skew-y: 1.8; scale-y: -10000; }
        frame 24 { x: 23.8; y: 13.3; skew-x: -1.7; skew-y: 1.3; scale-x: 0.8; scale-y: 0.801; }
        frame 25 { x: 23.5; y: 13.7; skew-x: -0.7; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 23.3; y: 14.1; skew-x: 0; skew-y: 0; scale-y: 0.8; }
    }
    Track {
        source-name: "CherryBomb_leaf1tip";
        frame-count: 27;
        frame 0 { x: 18; y: 14.9; scale-x: 0.8; scale-y: 0.871; image: IMAGE_REANIM_CHERRYBOMB_LEAF1TIP; }
        frame 1 { x: 17.8; y: 14.4; skew-x: -2.5; skew-y: -2.5; scale-x: 0.799; scale-y: 0.852; image: none; }
        frame 2 { x: 17.7; y: 14; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: 0.834; }
        frame 3 { x: 17.5; y: 13.7; skew-x: -8; skew-y: -8; scale-x: 0.798; scale-y: 0.816; }
        frame 4 { x: 17.3; y: 13.2; skew-x: -10.9; skew-y: -10.9; scale-x: -10000; scale-y: 0.798; }
        frame 5 { x: 18.5; y: 10.2; skew-x: -3.4; skew-y: -4.2; scale-y: -10000; }
        frame 6 { x: 19.7; y: 7.3; skew-x: 3.6; skew-y: 2; scale-x: 0.797; scale-y: 0.799; }
        frame 7 { x: 20.9; y: 4.3; skew-x: 11; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 22.3; y: 1.6; skew-x: 18.3; skew-y: 15.1; scale-x: 0.796; }
        frame 9 { x: 23.7; y: -0.8; skew-x: 25.8; skew-y: 21.8; scale-x: -10000; scale-y: 0.8; }
        frame 10 { x: 25; y: -3.4; skew-x: 33.1; skew-y: 28.3; scale-y: -10000; }
        frame 11 { x: 26.4; y: -5.8; skew-x: 40.4; skew-y: 34.8; scale-x: 0.795; }
        frame 12 { x: 27.8; y: -8; skew-x: 47.9; skew-y: 41.4; scale-x: -10000; scale-y: 0.801; }
        frame 13 { x: 29.2; y: -10.1; skew-x: 55.2; skew-y: 48; scale-x: 0.796; scale-y: 0.802; }
        frame 14 { x: 18; y: 14.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.871; }
        frame 15 { x: 18.6; y: 12.4; skew-x: 3.5; skew-y: 3.3; scale-x: 0.794; scale-y: 0.864; }
        frame 16 { x: 19.1; y: 10; skew-x: 7.4; skew-y: 6.6; scale-x: 0.788; scale-y: 0.857; }
        frame 17 { x: 18.6; y: 10.7; skew-x: 2.8; skew-y: 2.1; scale-x: 0.791; scale-y: 0.842; }
        frame 18 { x: 18.1; y: 11.6; skew-x: -1.7; skew-y: -1.9; scale-x: 0.793; scale-y: 0.827; }
        frame 19 { x: 17.7; y: 12.4; skew-x: -6.2; skew-y: -6.4; scale-x: 0.795; scale-y: 0.813; }
        frame 20 { x: 17.3; y: 13.2; skew-x: -10.9; skew-y: -10.9; scale-x: 0.798; scale-y: 0.798; }
        frame 21 { x: 17.4; y: 14.3; skew-x: -11.9; skew-y: -8.9; scale-x: 0.805; scale-y: 0.804; }
        frame 22 { x: 17.5; y: 15.6; skew-x: -13.1; skew-y: -7.3; scale-x: 0.813; scale-y: 0.811; }
        frame 23 { x: 17.6; y: 15.4; skew-x: -9.7; skew-y: -5.4; scale-x: 0.81; scale-y: 0.826; }
        frame 24 { x: 17.8; y: 15.2; skew-x: -6.4; skew-y: -3.4; scale-x: 0.806; scale-y: 0.841; }
        frame 25 { x: 17.9; y: 15; skew-x: -3.2; skew-y: -1.7; scale-x: 0.803; scale-y: 0.856; }
        frame 26 { x: 18; y: 14.9; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.871; }
    }
}
