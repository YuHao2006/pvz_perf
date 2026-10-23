export component Jalapeno {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 25;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 12 { cel: -1; }
        frame 13 { cel: -10000; }
    }
    Track {
        source-name: "anim_explode";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 12 { cel: 0; }
        frame 13 { cel: -10000; }
    }
    Track {
        source-name: "Jalapeno_stem";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 33; y: 2.6; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_JALAPENO_STEM; }
        frame 6 { x: 34.1; y: 2.9; skew-x: 6; skew-y: 5.1; scale-x: 0.776; scale-y: 0.795; cel: -10000; image: none; }
        frame 7 { x: 35.2; y: 3.3; skew-x: 12; skew-y: 10.3; scale-x: 0.753; scale-y: 0.79; }
        frame 8 { x: 36.4; y: 3.8; skew-x: 18.1; skew-y: 15.6; scale-x: 0.73; scale-y: 0.786; }
        frame 9 { x: 35.2; y: 3.2; skew-x: 12; skew-y: 10.3; scale-x: 0.753; scale-y: 0.79; }
        frame 10 { x: 34.1; y: 2.9; skew-x: 6; skew-y: 5.1; scale-x: 0.776; scale-y: 0.795; }
        frame 11 { x: 33; y: 2.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { y: 1.3; skew-x: 1.5; skew-y: 2; scale-x: 0.804; scale-y: 0.813; }
        frame 14 { x: 33.1; y: 0; skew-x: 3.1; skew-y: 4; scale-x: 0.808; scale-y: 0.825; }
        frame 15 { x: 33.2; y: -1.2; skew-x: 4.8; skew-y: 6.1; scale-x: 0.812; scale-y: 0.838; }
        frame 16 { x: 33.4; y: -2.5; skew-x: 6.3; skew-y: 8.3; scale-x: 0.817; scale-y: 0.85; }
        frame 17 { x: 33.5; y: -3.8; skew-x: 8; skew-y: 10.3; scale-x: 0.821; scale-y: 0.863; }
        frame 18 { x: 33.6; y: -5; skew-x: 9.5; skew-y: 12.3; scale-x: 0.825; scale-y: 0.876; }
        frame 19 { x: 33.7; y: -6.3; skew-x: 11.1; skew-y: 14.5; scale-x: 0.829; scale-y: 0.888; }
        frame 20 { x: 34; y: -7.6; skew-x: 12.8; skew-y: 16.5; scale-x: 0.833; scale-y: 0.901; }
        frame 21 { y: -8.9; skew-x: 14.3; skew-y: 18.6; scale-x: 0.838; scale-y: 0.914; }
        frame 22 { x: 34.3; y: -10.1; skew-x: 16; skew-y: 20.8; scale-x: 0.842; scale-y: 0.926; }
        frame 23 { x: 34.5; y: -11.3; skew-x: 17.5; skew-y: 22.8; scale-x: 0.846; scale-y: 0.939; }
        frame 24 { x: -10000; y: -12.7; skew-x: 19.2; skew-y: 24.9; scale-x: 0.851; scale-y: 0.953; }
    }
    Track {
        source-name: "Jalapeno_body";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 17.1; y: 10.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_JALAPENO_BODY; }
        frame 6 { x: 16.9; y: 11; scale-x: 0.813; scale-y: 0.786; cel: -10000; image: none; }
        frame 7 { x: 16.7; y: 11.6; scale-x: 0.826; scale-y: 0.772; }
        frame 8 { x: 16.5; y: 12.3; scale-x: 0.839; scale-y: 0.759; }
        frame 9 { x: 16.7; y: 11.6; scale-x: 0.826; scale-y: 0.772; }
        frame 10 { x: 16.9; y: 11; scale-x: 0.813; scale-y: 0.786; }
        frame 11 { x: 17.1; y: 10.4; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 16.1; y: 9.2; scale-x: 0.838; scale-y: 0.818; }
        frame 14 { x: 15.1; y: 8; scale-x: 0.876; scale-y: 0.836; }
        frame 15 { x: 14.1; y: 6.8; scale-x: 0.914; scale-y: 0.854; }
        frame 16 { x: 13.2; y: 5.6; scale-x: 0.953; scale-y: 0.872; }
        frame 17 { x: 12.2; y: 4.3; scale-x: 0.991; scale-y: 0.89; }
        frame 18 { x: 11.2; y: 3.1; scale-x: 1.029; scale-y: 0.908; }
        frame 19 { x: 10.2; y: 1.9; scale-x: 1.067; scale-y: 0.926; }
        frame 20 { x: 9.2; y: 0.6; scale-x: 1.105; scale-y: 0.944; }
        frame 21 { x: 8.3; y: -0.5; scale-x: 1.143; scale-y: 0.962; }
        frame 22 { x: 7.3; y: -1.6; scale-x: 1.182; scale-y: 0.98; }
        frame 23 { x: 6.3; y: -2.9; scale-x: 1.22; scale-y: 0.997; }
        frame 24 { x: 5.4; y: -4.2; scale-x: 1.258; scale-y: 1.015; }
    }
    Track {
        source-name: "Jalapeno_mouth";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 27.2; y: 34.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_JALAPENO_MOUTH; }
        frame 6 { x: 26; y: 34.3; scale-x: 0.866; scale-y: 0.754; cel: -10000; image: none; }
        frame 7 { x: 24.8; y: 34.4; scale-x: 0.932; scale-y: 0.708; }
        frame 8 { x: 23.6; y: 34.5; scale-x: 0.998; scale-y: 0.661; }
        frame 9 { x: 24.8; y: 34.4; scale-x: 0.932; scale-y: 0.708; }
        frame 10 { x: 26; y: 34.3; scale-x: 0.866; scale-y: 0.754; }
        frame 11 { x: 27.2; y: 34.1; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 26.1; y: 33.8; skew-x: -0.2; skew-y: 0.3; scale-x: 0.864; scale-y: 0.832; }
        frame 14 { x: 24.9; y: 33.4; skew-x: -0.4; skew-y: 0.5; scale-x: 0.929; scale-y: 0.863; }
        frame 15 { x: 23.7; y: 33; skew-x: -0.7; skew-y: 0.8; scale-x: 0.993; scale-y: 0.895; }
        frame 16 { x: 22.6; y: 32.7; skew-x: -0.9; skew-y: 1.1; scale-x: 1.058; scale-y: 0.927; }
        frame 17 { x: 21.5; y: 32.4; skew-x: -1.2; skew-y: 1.5; scale-x: 1.122; scale-y: 0.958; }
        frame 18 { x: 20.3; y: 32.1; skew-x: -1.4; skew-y: 1.8; scale-x: 1.187; scale-y: 0.99; }
        frame 19 { x: 19.3; y: 31.9; skew-x: -1.7; skew-y: 2; scale-x: 1.251; scale-y: 1.021; }
        frame 20 { x: 18.1; y: 31.4; skew-x: -1.9; skew-y: 2.3; scale-x: 1.315; scale-y: 1.053; }
        frame 21 { x: 17; y: 31.2; skew-x: -2.2; skew-y: 2.6; scale-x: 1.38; scale-y: 1.085; }
        frame 22 { x: 16; y: 30.9; skew-x: -2.4; skew-y: 3; scale-x: 1.444; scale-y: 1.116; }
        frame 23 { x: 14.8; y: 30.5; skew-x: -2.7; skew-y: 3.3; scale-x: 1.509; scale-y: 1.148; }
        frame 24 { x: 13.7; y: 30.6; skew-x: -3.1; skew-y: 3.6; scale-x: 1.573; scale-y: 1.18; }
    }
    Track {
        source-name: "Jalapeno_eye1";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 21.3; y: 19.2; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_JALAPENO_EYE1; }
        frame 6 { x: -10000; y: 19.7; scale-x: -10000; scale-y: 0.754; cel: -10000; image: none; }
        frame 7 { y: 20.3; scale-y: 0.707; }
        frame 8 { y: 20.8; scale-y: 0.661; }
        frame 9 { y: 20.3; scale-y: 0.707; }
        frame 10 { y: 19.7; scale-y: 0.754; }
        frame 11 { y: 19.2; scale-y: 0.8; }
        frame 12 { y: -10000; scale-y: -10000; }
        frame 13 { x: 20.1; y: 17.7; scale-x: 0.851; scale-y: 0.86; }
        frame 14 { x: 18.9; y: 16.2; scale-x: 0.901; scale-y: 0.92; }
        frame 15 { x: 17.7; y: 14.8; scale-x: 0.952; scale-y: 0.98; }
        frame 16 { x: 16.6; y: 13.3; scale-x: 1.002; scale-y: 1.039; }
        frame 17 { x: 15.3; y: 11.8; scale-x: 1.053; scale-y: 1.099; }
        frame 18 { x: 14.2; y: 10.3; scale-x: 1.104; scale-y: 1.159; }
        frame 19 { x: 13; y: 8.9; scale-x: 1.154; scale-y: 1.219; }
        frame 20 { x: 11.8; y: 7.4; scale-x: 1.205; scale-y: 1.279; }
        frame 21 { x: 10.6; y: 5.9; scale-x: 1.255; scale-y: 1.339; }
        frame 22 { x: 9.5; y: 4.5; scale-x: 1.306; scale-y: 1.399; }
        frame 23 { x: 8.3; y: 3; scale-x: 1.357; scale-y: 1.459; }
        frame 24 { x: 7.1; y: 1.5; scale-x: 1.407; scale-y: 1.518; }
    }
    Track {
        source-name: "Jalapeno_eye2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 41; y: 25; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_JALAPENO_EYE2; }
        frame 6 { x: -10000; y: 25.6; scale-x: -10000; scale-y: 0.697; cel: -10000; image: none; }
        frame 7 { y: 26.1; scale-y: 0.594; }
        frame 8 { y: 26.7; scale-y: 0.491; }
        frame 9 { y: 26.1; scale-y: 0.594; }
        frame 10 { y: 25.5; scale-y: 0.697; }
        frame 11 { y: 25; scale-y: 0.8; }
        frame 12 { y: -10000; scale-y: -10000; }
        frame 13 { x: 41.2; y: 23.8; scale-x: 0.868; scale-y: 0.861; }
        frame 14 { x: 41.4; y: 22.5; scale-x: 0.936; scale-y: 0.921; }
        frame 15 { x: 41.6; y: 21.2; scale-x: 1.004; scale-y: 0.982; }
        frame 16 { x: 41.7; y: 20; scale-x: 1.072; scale-y: 1.042; }
        frame 17 { x: 42; y: 18.7; scale-x: 1.14; scale-y: 1.103; }
        frame 18 { x: 42.1; y: 17.5; scale-x: 1.208; scale-y: 1.164; }
        frame 19 { x: 42.3; y: 16.3; scale-x: 1.276; scale-y: 1.224; }
        frame 20 { x: 42.6; y: 14.9; scale-x: 1.344; scale-y: 1.285; }
        frame 21 { x: 42.8; y: 13.7; scale-x: 1.412; scale-y: 1.345; }
        frame 22 { x: 43; y: 12.5; scale-x: 1.48; scale-y: 1.406; }
        frame 23 { x: 43.1; y: 11.2; scale-x: 1.548; scale-y: 1.467; }
        frame 24 { x: 43.3; y: 9.9; scale-x: 1.616; scale-y: 1.527; }
    }
    Track {
        source-name: "Jalapeno_cheek";
        frame-count: 25;
        frame 0 { x: 42.1; y: 29.1; scale-x: 0.631; scale-y: 0.8; image: IMAGE_REANIM_JALAPENO_CHEEK; }
        frame 1 { x: 41.9; y: 27.9; scale-x: -10000; scale-y: 0.925; image: none; }
        frame 2 { x: 42.1; y: 29.1; scale-y: 0.8; }
        frame 3 { x: -10000; y: -10000; scale-y: -10000; }
        frame 4 { x: 41.9; y: 27.9; scale-y: 0.925; }
        frame 5 { x: 42.1; y: 29.1; scale-y: 0.8; }
        frame 6 { x: 41.7; y: 28.9; scale-x: 0.698; scale-y: 0.756; }
        frame 7 { x: 41.4; y: 28.6; scale-x: 0.765; scale-y: 0.711; }
        frame 8 { x: 41.2; y: 28.4; scale-x: 0.831; scale-y: 0.667; }
        frame 9 { x: 41.6; y: 28.6; scale-x: 0.765; scale-y: 0.711; }
        frame 10 { x: 41.8; y: 28.9; scale-x: 0.698; scale-y: 0.756; }
        frame 11 { x: 42.1; y: 29.1; scale-x: 0.631; scale-y: 0.8; }
        frame 12 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 42.2; y: 28.1; skew-y: 1.8; scale-x: 0.691; scale-y: 0.828; }
        frame 14 { x: 42.4; y: 27.2; skew-x: 0.3; skew-y: 3.5; scale-x: 0.751; scale-y: 0.856; }
        frame 15 { x: 42.5; y: 26.3; skew-x: 0.5; skew-y: 5.3; scale-x: 0.811; scale-y: 0.885; }
        frame 16 { x: 42.7; y: 25.3; skew-x: -10000; skew-y: 7.1; scale-x: 0.871; scale-y: 0.913; }
        frame 17 { x: 42.9; y: 24.4; skew-x: 0.8; skew-y: 9; scale-x: 0.931; scale-y: 0.941; }
        frame 18 { x: 43.1; y: 23.4; skew-x: 1; skew-y: 10.8; scale-x: 0.992; scale-y: 0.969; }
        frame 19 { x: 43.3; y: 22.6; skew-x: 1.1; skew-y: 12.5; scale-x: 1.052; scale-y: 0.997; }
        frame 20 { x: 43.5; y: 21.7; skew-x: 1.3; skew-y: 14.3; scale-x: 1.112; scale-y: 1.025; }
        frame 21 { x: 43.6; y: 20.7; skew-x: 1.5; skew-y: 16.1; scale-x: 1.172; scale-y: 1.053; }
        frame 22 { x: 43.9; y: 19.8; skew-x: 1.6; skew-y: 18; scale-x: 1.232; scale-y: 1.082; }
        frame 23 { x: 44.1; y: 18.8; skew-x: 1.8; skew-y: 19.8; scale-x: 1.292; scale-y: 1.11; }
        frame 24 { x: 44.3; y: 17.8; skew-x: 2.1; skew-y: 21.6; scale-x: 1.352; scale-y: 1.139; }
    }
    Track {
        source-name: "Jalapeno_eyebrow1";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 22.3; y: 15.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_JALAPENO_EYEBROW1; }
        frame 6 { x: 23.2; y: 16; skew-x: 5; skew-y: 4.8; scale-x: 0.837; scale-y: 0.794; cel: -10000; image: none; }
        frame 7 { x: 24; y: -10000; skew-x: 10; skew-y: 9.8; scale-x: 0.875; scale-y: 0.789; }
        frame 8 { x: 25; y: 15.9; skew-x: 15; skew-y: 15; scale-x: 0.913; scale-y: 0.784; }
        frame 9 { x: 24; y: 15.8; skew-x: 10; skew-y: 9.8; scale-x: 0.875; scale-y: 0.789; }
        frame 10 { x: 23; y: -10000; skew-x: 5; skew-y: 4.8; scale-x: 0.837; scale-y: 0.794; }
        frame 11 { x: 22.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 21.1; y: 14.5; skew-x: 1.3; skew-y: 0.5; scale-x: 0.888; scale-y: 0.87; }
        frame 14 { x: 20.1; y: 13; skew-x: 2.8; skew-y: 1.1; scale-x: 0.977; scale-y: 0.94; }
        frame 15 { x: 19; y: 11.6; skew-x: 4; skew-y: 1.8; scale-x: 1.065; scale-y: 1.01; }
        frame 16 { x: 17.9; y: 10.2; skew-x: 5.5; skew-y: 2.3; scale-x: 1.153; scale-y: 1.08; }
        frame 17 { x: 16.8; y: 8.6; skew-x: 6.8; skew-y: 3; scale-x: 1.241; scale-y: 1.149; }
        frame 18 { x: 15.8; y: 7; skew-x: 8.3; skew-y: 3.5; scale-x: 1.329; scale-y: 1.219; }
        frame 19 { x: 14.8; y: 5.5; skew-x: 9.5; skew-y: 4.1; scale-x: 1.418; scale-y: 1.289; }
        frame 20 { x: 13.8; y: 3.8; skew-x: 11; skew-y: 4.8; scale-x: 1.506; scale-y: 1.359; }
        frame 21 { x: 12.8; y: 2.2; skew-x: 12.3; skew-y: 5.3; scale-x: 1.594; scale-y: 1.429; }
        frame 22 { x: 11.9; y: 0.5; skew-x: 13.8; skew-y: 6; scale-x: 1.682; scale-y: 1.499; }
        frame 23 { x: 11; y: -1; skew-x: 15.1; skew-y: 6.5; scale-x: 1.77; scale-y: 1.568; }
        frame 24 { x: 10.2; y: -2.9; skew-x: 16.5; skew-y: 7.3; scale-x: 1.86; scale-y: 1.639; }
    }
    Track {
        source-name: "Jalapeno_eyebrow2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 39.9; y: 21.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_JALAPENO_EYEBROW2; }
        frame 6 { x: 40; y: 21.9; scale-x: 0.841; scale-y: 0.775; cel: -10000; image: none; }
        frame 7 { x: 40.1; y: 22.5; scale-x: 0.882; scale-y: 0.75; }
        frame 8 { x: -10000; y: 23.1; scale-x: 0.923; scale-y: 0.725; }
        frame 9 { x: 40; y: 22.5; scale-x: 0.882; scale-y: 0.75; }
        frame 10 { x: 39.9; y: 21.9; scale-x: 0.841; scale-y: 0.775; }
        frame 11 { x: -10000; y: 21.3; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 40.1; y: 20.2; skew-x: 0.8; skew-y: 0.3; scale-x: 0.864; scale-y: 0.866; }
        frame 14 { x: 40.4; y: 19; skew-x: 1.5; skew-y: 0.5; scale-x: 0.927; scale-y: 0.932; }
        frame 15 { x: 40.6; y: 18; skew-x: 2.3; skew-y: 0.8; scale-x: 0.991; scale-y: 0.998; }
        frame 16 { x: 40.9; y: 16.9; skew-x: 3; skew-y: 1; scale-x: 1.055; scale-y: 1.064; }
        frame 17 { x: 41.1; y: 15.7; skew-x: 3.8; skew-y: 1.3; scale-x: 1.119; scale-y: 1.131; }
        frame 18 { x: 41.3; y: 14.5; skew-x: 4.5; skew-y: 1.5; scale-x: 1.182; scale-y: 1.197; }
        frame 19 { x: 41.6; y: 13.4; skew-x: 5.3; skew-y: 1.8; scale-x: 1.246; scale-y: 1.263; }
        frame 20 { x: 41.8; y: 12.2; skew-x: 6; skew-y: 2; scale-x: 1.31; scale-y: 1.329; }
        frame 21 { x: 42; y: 11; skew-x: 6.8; skew-y: 2.3; scale-x: 1.373; scale-y: 1.395; }
        frame 22 { x: 42.3; y: 9.8; skew-x: 7.5; skew-y: 2.6; scale-x: 1.437; scale-y: 1.461; }
        frame 23 { x: 42.6; y: 8.6; skew-x: 8.3; skew-y: 2.8; scale-x: 1.501; scale-y: 1.527; }
        frame 24 { x: 43; y: 7.6; skew-x: 9; skew-y: 3.2; scale-x: 1.565; scale-y: 1.594; }
    }
}
