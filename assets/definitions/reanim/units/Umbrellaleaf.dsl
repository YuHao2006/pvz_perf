export component Umbrellaleaf {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 32;
        frame 4 { cel: -1; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { cel: 0; }
        frame 5 { cel: -10000; }
        frame 19 { cel: -1; }
        frame 20 { cel: -10000; }
    }
    Track {
        source-name: "anim_block";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 19 { x: -57.5; y: -53.1; scale-x: 2.479; scale-y: 3.089; cel: 0; }
        frame 20 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 27.6; y: 33.5; scale-x: 0.637; scale-y: 0.637; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_BODY; }
        frame 5 { x: 27.5; y: 34; scale-x: 0.646; scale-y: 0.631; cel: -10000; image: none; }
        frame 6 { x: 27.3; y: 34.3; scale-x: 0.656; scale-y: 0.624; }
        frame 7 { x: 27.1; y: 34.7; scale-x: 0.665; scale-y: 0.618; }
        frame 8 { x: 27; y: 35; scale-x: 0.674; scale-y: 0.611; }
        frame 9 { x: 26.9; y: 35.4; scale-x: 0.683; scale-y: 0.604; }
        frame 10 { x: 26.7; y: 35.8; scale-x: 0.692; scale-y: 0.598; }
        frame 11 { x: 26.5; y: 36.2; scale-x: 0.701; scale-y: 0.591; }
        frame 12 { x: 26.7; y: 35.8; scale-x: 0.692; scale-y: 0.598; }
        frame 13 { x: 26.8; y: 35.4; scale-x: 0.683; scale-y: 0.604; }
        frame 14 { x: 27; y: 35; scale-x: 0.674; scale-y: 0.611; }
        frame 15 { x: 27.2; y: 34.6; scale-x: 0.665; scale-y: 0.618; }
        frame 16 { x: -10000; y: 34.3; scale-x: 0.656; scale-y: 0.624; }
        frame 17 { x: 27.4; y: 33.9; scale-x: 0.646; scale-y: 0.631; }
        frame 18 { x: 27.6; y: 33.5; scale-x: 0.637; scale-y: 0.637; }
        frame 19 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 27.2; y: 32.3; scale-x: 0.661; scale-y: 0.661; }
        frame 21 { x: 26.8; y: 31; scale-x: 0.684; scale-y: 0.684; }
        frame 22 { x: 26.4; y: 29.8; scale-x: 0.707; scale-y: 0.707; }
        frame 23 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 26.8; y: 31; scale-x: 0.684; scale-y: 0.684; }
        frame 29 { x: 27.1; y: 31.9; scale-x: 0.668; scale-y: 0.668; }
        frame 30 { x: 27.3; y: 32.7; scale-x: 0.653; scale-y: 0.653; }
        frame 31 { x: 27.6; y: 33.5; scale-x: 0.637; scale-y: 0.637; }
    }
    Track {
        source-name: "Umbrellaleaf_blink";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { x: 33.1; y: 50.6; scale-x: 0.665; scale-y: 0.665; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_BLINK1; }
        frame 2 { x: 33; y: 50.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_UMBRELLALEAF_BLINK2; }
        frame 3 { x: 33.1; y: 50.6; image: IMAGE_REANIM_UMBRELLALEAF_BLINK1; }
        frame 4 { x: -10000; y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf5";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 32.9; y: 3.9; scale-x: 0.637; scale-y: 0.637; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF5; }
        frame 5 { x: 32.5; y: 4; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 32; y: 4.3; skew-x: -3.1; skew-y: -3.1; }
        frame 7 { x: 32.5; y: 4.4; skew-x: -0.9; skew-y: -0.9; }
        frame 8 { x: 33; y: 4.7; skew-x: 1; skew-y: 1; }
        frame 9 { x: 33.6; y: 4.8; skew-x: 3.3; skew-y: 3.3; }
        frame 10 { x: 34.1; y: 5; skew-x: 5.5; skew-y: 5.5; }
        frame 11 { x: 34.9; y: 5.2; skew-x: 7.8; skew-y: 7.8; }
        frame 12 { x: 34.5; y: 6.3; skew-x: 6.5; skew-y: 6.5; scale-y: 0.61; }
        frame 13 { x: 34.1; y: 7.4; skew-x: 5.5; skew-y: 5.5; scale-y: 0.583; }
        frame 14 { x: 33.9; y: 6.8; skew-x: 4.3; skew-y: 4.3; scale-y: 0.594; }
        frame 15 { x: 33.6; y: 6; skew-x: 3.3; skew-y: 3.3; scale-y: 0.604; }
        frame 16 { x: 33.4; y: 5.3; skew-x: 2.1; skew-y: 2.1; scale-y: 0.615; }
        frame 17 { x: 33; y: 4.7; skew-x: 1; skew-y: 1; scale-y: 0.626; }
        frame 18 { x: 32.9; y: 3.9; skew-x: 0; skew-y: 0; scale-y: 0.637; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 20 { x: 26.1; y: -36; skew-x: -2.7; skew-y: -1.7; scale-x: 1.238; scale-y: 1.358; }
        frame 21 { x: 18.5; y: -74.7; skew-x: -5.4; skew-y: -3.4; scale-x: 1.839; scale-y: 2.078; }
        frame 22 { x: 10.1; y: -111.9; skew-x: -8.3; skew-y: -5.4; scale-x: 2.441; scale-y: 2.799; }
        frame 23 { x: 11.4; y: -106.8; skew-x: -8.2; skew-y: -5.2; scale-x: 2.347; scale-y: 2.691; }
        frame 24 { x: 12.3; y: -101.5; skew-x: -8.3; skew-y: -5.4; scale-x: 2.255; scale-y: 2.586; }
        frame 25 { x: 11.3; y: -106.8; skew-x: -8.2; skew-y: -5.2; scale-x: 2.347; scale-y: 2.691; }
        frame 26 { x: 10.1; y: -111.9; skew-x: -8.3; skew-y: -5.4; scale-x: 2.441; scale-y: 2.799; }
        frame 27 { x: 20; y: -62.1; skew-x: -6.2; skew-y: -4.7; scale-x: 1.649; scale-y: 1.804; }
        frame 28 { x: 29.4; y: -10.8; skew-x: -4.4; skew-y: -4.4; scale-x: 0.859; scale-y: 0.81; }
        frame 29 { x: 30.6; y: -5.9; skew-x: -2.9; skew-y: -2.9; scale-x: 0.785; scale-y: 0.752; }
        frame 30 { x: 31.7; y: -1; skew-x: -1.4; skew-y: -1.4; scale-x: 0.711; scale-y: 0.695; }
        frame 31 { x: 32.9; y: 3.9; skew-x: 0; skew-y: 0; scale-x: 0.637; scale-y: 0.637; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf4";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 9.6; y: 4.8; scale-x: 0.637; scale-y: 0.637; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF4; }
        frame 5 { x: 9.8; y: 4.4; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 10; y: 4; skew-x: 1.3; skew-y: 1.3; }
        frame 7 { x: 9.5; y: 5.3; skew-x: -0.9; skew-y: -0.9; }
        frame 8 { x: 9; y: 6.7; skew-x: -3.4; skew-y: -3.4; }
        frame 9 { x: 8.6; y: 8.2; skew-x: -5.7; skew-y: -5.7; }
        frame 10 { x: 8.2; y: 9.6; skew-x: -8.2; skew-y: -8.2; }
        frame 11 { x: 7.7; y: 11.1; skew-x: -10.7; skew-y: -10.7; }
        frame 12 { x: 8.2; y: 12.4; skew-x: -11.4; skew-y: -9.2; scale-y: 0.604; }
        frame 13 { x: 8.5; y: 13.6; skew-x: -12.3; skew-y: -8.1; scale-x: 0.638; scale-y: 0.571; }
        frame 14 { x: 8.6; y: 11.8; skew-x: -9.7; skew-y: -6.4; scale-x: -10000; scale-y: 0.584; }
        frame 15 { x: 8.9; y: 10; skew-x: -7.2; skew-y: -4.7; scale-y: 0.597; }
        frame 16 { x: 9.1; y: 8.3; skew-x: -4.7; skew-y: -3.2; scale-x: 0.637; scale-y: 0.611; }
        frame 17 { x: 9.4; y: 6.5; skew-x: -2.2; skew-y: -1.4; scale-x: -10000; scale-y: 0.624; }
        frame 18 { x: 9.6; y: 4.8; skew-x: 0; skew-y: 0; scale-y: 0.637; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 20 { x: -16.9; y: -36.8; skew-x: 3; skew-y: 1.8; scale-x: 1.239; scale-y: 1.357; }
        frame 21 { x: -42.6; y: -80; skew-x: 6; skew-y: 3.8; scale-x: 1.84; scale-y: 2.077; }
        frame 22 { x: -67.1; y: -124.7; skew-x: 9.1; skew-y: 5.9; scale-x: 2.442; scale-y: 2.797; }
        frame 23 { x: -63.1; y: -119; skew-x: 9; skew-y: 5.8; scale-x: 2.348; scale-y: 2.69; }
        frame 24 { x: -59.1; y: -113.4; skew-x: 9.1; skew-y: 5.9; scale-x: 2.256; scale-y: 2.585; }
        frame 25 { x: -63.1; y: -119.1; skew-x: 9; skew-y: 5.8; scale-x: 2.348; scale-y: 2.69; }
        frame 26 { x: -67.1; y: -124.7; skew-x: 9.1; skew-y: 5.9; scale-x: 2.442; scale-y: 2.797; }
        frame 27 { x: -33.4; y: -67.8; skew-x: 6.8; skew-y: 5.3; scale-x: 1.65; scale-y: 1.803; }
        frame 28 { x: 0.8; y: -12.7; skew-x: 4.8; skew-y: 4.8; scale-x: 0.859; scale-y: 0.81; }
        frame 29 { x: 3.6; y: -6.7; skew-x: 3; skew-y: 3; scale-x: 0.785; scale-y: 0.752; }
        frame 30 { x: 6.5; y: -0.8; skew-x: 1.5; skew-y: 1.5; scale-x: 0.711; scale-y: 0.695; }
        frame 31 { x: 9.6; y: 4.8; skew-x: 0; skew-y: 0; scale-x: 0.637; scale-y: 0.637; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf6";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 33.5; y: 11.4; scale-x: 0.637; scale-y: 0.637; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF6; }
        frame 5 { x: 33.4; y: 11.2; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 33.3; y: 11; skew-x: -1.9; skew-y: -1.9; }
        frame 7 { x: 33.8; y: 11.1; skew-x: 0.1; skew-y: 0.1; }
        frame 8 { x: 34.3; y: 11; skew-x: 2.3; skew-y: 2.3; }
        frame 9 { x: 34.8; y: 11.2; skew-x: 4.6; skew-y: 4.6; }
        frame 10 { x: 35.5; y: 11.1; skew-x: 7; skew-y: 7; }
        frame 11 { x: 36.1; y: 11.3; skew-x: 9.3; skew-y: 9.3; }
        frame 12 { x: 36.2; y: 11; skew-x: 11.1; skew-y: -10000; }
        frame 13 { x: 36.4; y: 10.7; skew-x: 13.1; scale-x: 0.638; }
        frame 14 { x: 35.7; y: 10.9; skew-x: 10.3; skew-y: 7.3; scale-x: -10000; }
        frame 15 { x: 35.1; y: 11; skew-x: 7.8; skew-y: 5.5; scale-x: 0.637; }
        frame 16 { x: 34.6; y: 11.2; skew-x: 5.1; skew-y: 3.6; scale-x: -10000; }
        frame 17 { x: 34; y: 11.3; skew-x: 2.5; skew-y: 1.8; }
        frame 18 { x: 33.5; y: 11.4; skew-x: 0; skew-y: 0; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 20 { x: 30.7; y: -19.2; skew-x: -1.7; skew-y: -1; scale-x: 1.299; scale-y: 1.359; }
        frame 21 { x: 27.2; y: -48.4; skew-x: -3.7; skew-y: -2.2; scale-x: 1.96; scale-y: 2.081; }
        frame 22 { x: 23; y: -76.1; skew-x: -5.6; skew-y: -3.6; scale-x: 2.621; scale-y: 2.803; }
        frame 23 { x: 23.7; y: -72.4; skew-x: -5.4; skew-y: -3.4; scale-x: 2.521; scale-y: 2.696; }
        frame 24 { x: 24.2; y: -68.4; skew-x: -5.6; skew-y: -3.6; scale-x: 2.422; scale-y: 2.589; }
        frame 25 { x: 23.7; y: -72.5; skew-x: -5.4; skew-y: -3.4; scale-x: 2.521; scale-y: 2.695; }
        frame 26 { x: 23; y: -76.1; skew-x: -5.6; skew-y: -3.6; scale-x: 2.621; scale-y: 2.803; }
        frame 27 { x: 28.1; y: -39.1; skew-x: -4.2; skew-y: -3.2; scale-x: 1.764; scale-y: 1.806; }
        frame 28 { x: 32.9; y: -0.7; skew-x: -2.9; skew-y: -2.9; scale-x: 0.908; scale-y: 0.81; }
        frame 29 { x: 33.1; y: 3.1; skew-x: -1.9; skew-y: -1.9; scale-x: 0.818; scale-y: 0.753; }
        frame 30 { x: 33.3; y: 7.2; skew-x: -0.9; skew-y: -0.9; scale-x: 0.728; scale-y: 0.695; }
        frame 31 { x: 33.5; y: 11.4; skew-x: 0; skew-y: 0; scale-x: 0.637; scale-y: 0.637; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf3";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { y: 16.3; scale-x: 0.637; scale-y: 0.637; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF3; }
        frame 5 { x: 0.1; y: 15.1; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 0.5; y: 13.9; skew-x: 2.8; skew-y: 2.8; }
        frame 7 { x: -0.1; y: 15.8; skew-x: 0.3; skew-y: 0.3; }
        frame 8 { x: -0.6; y: 17.6; skew-x: -2; skew-y: -2; }
        frame 9 { x: -1.2; y: 19.6; skew-x: -4.7; skew-y: -4.7; }
        frame 10 { x: -1.8; y: 21.5; skew-x: -7.2; skew-y: -7.2; }
        frame 11 { x: -2.3; y: 23.4; skew-x: -9.7; skew-y: -9.7; }
        frame 12 { x: -2.6; y: 24.5; skew-x: -11.9; skew-y: -10.5; scale-y: 0.636; }
        frame 13 { x: -2.8; y: 25.5; skew-x: -14.2; skew-y: -11.5; scale-y: 0.637; }
        frame 14 { x: -2.3; y: 23.5; skew-x: -11.2; skew-y: -9.2; scale-y: 0.636; }
        frame 15 { x: -1.8; y: 21.7; skew-x: -8.4; skew-y: -6.7; scale-y: 0.637; }
        frame 16 { x: -1.3; y: 19.8; skew-x: -5.5; skew-y: -4.4; scale-y: -10000; }
        frame 17 { x: -0.6; y: 18; skew-x: -2.7; skew-y: -2.2; }
        frame 18 { x: -0; y: 16.3; skew-x: 0; skew-y: 0; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 20 { x: -38.5; y: -13.2; skew-x: 1.8; skew-y: 1; scale-x: 1.301; scale-y: 1.359; }
        frame 21 { x: -76.4; y: -44.2; skew-x: 3.5; skew-y: 2.3; scale-x: 1.966; scale-y: 2.081; }
        frame 22 { x: -113.6; y: -76.8; skew-x: 5.3; skew-y: 3.4; scale-x: 2.63; scale-y: 2.803; }
        frame 23 { x: -107.8; y: -72.9; skew-x: -10000; skew-y: 3.3; scale-x: 2.529; scale-y: 2.696; }
        frame 24 { x: -101.9; y: -69.1; skew-y: 3.4; scale-x: 2.43; scale-y: 2.59; }
        frame 25 { x: -107.9; y: -72.8; skew-y: 3.3; scale-x: 2.529; scale-y: 2.696; }
        frame 26 { x: -113.6; y: -76.8; skew-y: 3.4; scale-x: 2.63; scale-y: 2.803; }
        frame 27 { x: -64.2; y: -37.1; skew-x: 4; skew-y: 3; scale-x: 1.77; scale-y: 1.806; }
        frame 28 { x: -14.6; y: 1.1; skew-x: 2.8; skew-y: 2.8; scale-x: 0.911; scale-y: 0.81; }
        frame 29 { x: -9.8; y: 6.2; skew-x: 1.8; skew-y: 1.8; scale-x: 0.819; scale-y: 0.753; }
        frame 30 { x: -5; y: 11.3; skew-x: 0.8; skew-y: 0.8; scale-x: 0.728; scale-y: 0.695; }
        frame 31 { x: -0; y: 16.3; skew-x: 0; skew-y: 0; scale-x: 0.637; scale-y: 0.637; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf7";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 37.7; y: 19.1; scale-x: 0.637; scale-y: 0.637; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF7; }
        frame 5 { x: 37.4; y: 19.4; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 37; y: 19.7; skew-x: -3.2; skew-y: -3.2; }
        frame 7 { x: 37.5; y: 19.8; skew-x: -1; skew-y: -1; }
        frame 8 { x: 37.9; y: 19.9; skew-x: 0.8; skew-y: 0.8; }
        frame 9 { x: 38.4; y: 20; skew-x: 2.8; skew-y: 2.8; }
        frame 10 { x: 38.9; y: 20.1; skew-x: 4.8; skew-y: 4.8; }
        frame 11 { x: 39.4; y: -10000; skew-x: 7; skew-y: 7; }
        frame 12 { x: 39.5; y: 19.6; skew-x: 8.8; skew-y: 6.8; }
        frame 13 { x: -10000; y: 19.1; skew-x: 10.6; skew-y: 6.5; scale-x: 0.638; }
        frame 14 { x: 39.1; y: -10000; skew-x: 8.3; skew-y: 5.1; scale-x: -10000; }
        frame 15 { x: 38.6; skew-x: 6.3; skew-y: 3.8; }
        frame 16 { x: 38.3; y: 19.2; skew-x: 4.1; skew-y: 2.5; }
        frame 17 { x: 38; y: 19.1; skew-x: 2; skew-y: 1.3; scale-x: 0.637; }
        frame 18 { x: 37.7; y: -10000; skew-x: 0; skew-y: 0; scale-x: -10000; }
        frame 19 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 20 { x: 33.9; y: -2.9; skew-x: -1.7; skew-y: -0.9; scale-x: 1.303; scale-y: 1.359; }
        frame 21 { x: 29.3; y: -23.9; skew-x: -3.4; skew-y: -2.2; scale-x: 1.968; scale-y: 2.081; }
        frame 22 { x: 24.5; y: -43.3; skew-x: -5.2; skew-y: -3.3; scale-x: 2.634; scale-y: 2.803; }
        frame 23 { x: 25.3; y: -40.8; skew-x: -10000; skew-y: -3.2; scale-x: 2.533; scale-y: 2.696; }
        frame 24 { x: 25.6; y: -38.2; skew-y: -3.3; scale-x: 2.434; scale-y: 2.59; }
        frame 25 { x: 25.1; y: -40.8; skew-y: -3.2; scale-x: 2.533; scale-y: 2.696; }
        frame 26 { x: 24.5; y: -43.3; skew-y: -3.3; scale-x: 2.634; scale-y: 2.803; }
        frame 27 { x: 29.8; y: -17.9; skew-x: -3.9; skew-y: -2.9; scale-x: 1.773; scale-y: 1.806; }
        frame 28 { x: 34.8; y: 8.8; skew-x: -2.7; skew-y: -2.7; scale-x: 0.912; scale-y: 0.81; }
        frame 29 { x: 35.9; y: 12.1; skew-x: -1.7; skew-y: -1.7; scale-x: 0.82; scale-y: 0.753; }
        frame 30 { x: 36.8; y: 15.5; skew-x: -0.7; skew-y: -0.7; scale-x: 0.729; scale-y: 0.695; }
        frame 31 { x: 37.7; y: 19.1; skew-x: 0; skew-y: 0; scale-x: 0.637; scale-y: 0.637; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf2";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 11.1; y: 23.2; scale-x: 0.637; scale-y: 0.637; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF2; }
        frame 5 { x: 11.4; y: 22.8; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: 0.623; cel: -10000; image: none; }
        frame 6 { x: 11.7; y: 22.6; skew-x: 1.5; skew-y: 1.5; scale-y: 0.608; }
        frame 7 { x: 11.4; y: 23.4; skew-x: 0.5; skew-y: 0.5; scale-y: 0.614; }
        frame 8 { x: 11.2; y: 24.1; skew-x: -0.2; skew-y: -0.2; scale-y: 0.62; }
        frame 9 { x: 11; y: 24.8; skew-x: -1; skew-y: -1; scale-y: 0.626; }
        frame 10 { x: 10.7; y: 25.6; skew-x: -1.9; skew-y: -1.9; scale-y: 0.631; }
        frame 11 { x: 10.3; y: 26.2; skew-x: -2.9; skew-y: -2.9; scale-y: 0.637; }
        frame 12 { x: 10.1; y: 26.8; skew-x: -4.4; skew-y: -4.4; scale-y: -10000; }
        frame 13 { x: 9.7; y: 27.4; skew-x: -6.2; skew-y: -6.2; }
        frame 14 { x: 10; y: 26.5; skew-x: -4.9; skew-y: -4.9; }
        frame 15 { x: 10.2; y: 25.7; skew-x: -3.7; skew-y: -3.7; }
        frame 16 { x: 10.6; y: 24.8; skew-x: -2.4; skew-y: -2.4; }
        frame 17 { x: 10.8; y: 24; skew-x: -1.2; skew-y: -1.2; }
        frame 18 { x: 11.1; y: 23.2; skew-x: 0; skew-y: 0; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 20 { x: -21.1; y: 2.1; skew-x: 1.5; skew-y: 1; scale-x: 1.357; scale-y: 1.359; }
        frame 21 { x: -52.7; y: -19.8; skew-x: 3; skew-y: 2; scale-x: 2.077; scale-y: 2.081; }
        frame 22 { x: -83.3; y: -42.8; skew-x: 4.7; skew-y: 3.1; scale-x: 2.797; scale-y: 2.804; }
        frame 23 { x: -78.7; y: -39.9; skew-x: 4.6; skew-y: 3; scale-x: 2.69; scale-y: 2.697; }
        frame 24 { x: -74; y: -37.7; skew-x: 4.7; skew-y: 3.1; scale-x: 2.584; scale-y: 2.59; }
        frame 25 { x: -78.7; y: -40.1; skew-x: 4.6; skew-y: 3; scale-x: 2.69; scale-y: 2.697; }
        frame 26 { x: -83.3; y: -42.8; skew-x: 4.7; skew-y: 3.1; scale-x: 2.797; scale-y: 2.804; }
        frame 27 { x: -43.3; y: -15.3; skew-x: 3.5; skew-y: 2.8; scale-x: 1.876; scale-y: 1.807; }
        frame 28 { x: -2.9; y: 10.6; skew-x: 2.5; skew-y: 2.5; scale-x: 0.955; scale-y: 0.811; }
        frame 29 { x: 1.5; y: 14.9; skew-x: 1.5; skew-y: 1.5; scale-x: 0.849; scale-y: 0.753; }
        frame 30 { x: 6.3; y: 19.1; skew-x: 0.8; skew-y: 0.8; scale-x: 0.743; scale-y: 0.695; }
        frame 31 { x: 11.1; y: 23.2; skew-x: 0; skew-y: 0; scale-x: 0.637; scale-y: 0.637; }
    }
    Track {
        source-name: "Umbrellaleaf_leaf1";
        frame-count: 32;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 32; y: 24; scale-x: 0.637; scale-y: 0.637; cel: 0; image: IMAGE_REANIM_UMBRELLALEAF_LEAF1; }
        frame 5 { x: 32.1; y: 24.1; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: 0.622; cel: -10000; image: none; }
        frame 6 { x: 32.4; y: 24.2; skew-x: -0.9; skew-y: -0.9; scale-y: 0.607; }
        frame 7 { x: -10000; y: 24.3; skew-x: -0.2; skew-y: -0.2; scale-y: 0.613; }
        frame 8 { y: 24.5; skew-x: 0.1; skew-y: 0.1; scale-y: 0.619; }
        frame 9 { x: 32.5; y: 24.6; skew-x: 0.8; skew-y: 0.8; scale-y: 0.625; }
        frame 10 { x: -10000; y: 24.8; skew-x: 1.3; skew-y: 1.3; scale-y: 0.631; }
        frame 11 { y: 25; skew-x: 2; skew-y: 2; scale-y: 0.637; }
        frame 12 { x: 32.7; y: 24.7; skew-x: 2.8; skew-y: 2.8; scale-y: 0.648; }
        frame 13 { x: 32.9; y: 24.5; skew-x: 3.6; skew-y: 3.6; scale-y: 0.659; }
        frame 14 { x: 32.6; y: 24.4; skew-x: 2.8; skew-y: 2.8; scale-y: 0.654; }
        frame 15 { x: 32.5; y: -10000; skew-x: 2; skew-y: 2; scale-y: 0.65; }
        frame 16 { x: 32.4; y: 24.2; skew-x: 1.3; skew-y: 1.3; scale-y: 0.646; }
        frame 17 { x: 32.1; y: -10000; skew-x: 0.6; skew-y: 0.6; scale-y: 0.642; }
        frame 18 { x: 32; y: 24; skew-x: 0; skew-y: 0; scale-y: 0.637; }
        frame 19 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 20 { x: 27.4; y: 4.8; skew-x: -2.2; skew-y: -1.4; scale-x: 1.252; scale-y: 1.482; }
        frame 21 { x: 21.4; y: -12.7; skew-x: -4.7; skew-y: -3; scale-x: 1.866; scale-y: 2.327; }
        frame 22 { x: 13.6; y: -28.7; skew-x: -7.4; skew-y: -4.7; scale-x: 2.481; scale-y: 3.172; }
        frame 23 { x: 14.9; y: -26.7; skew-x: -7.2; skew-y: -10000; scale-x: 2.386; scale-y: 3.051; }
        frame 24 { x: 15.5; y: -24.6; skew-x: -7.4; scale-x: 2.293; scale-y: 2.931; }
        frame 25 { x: 14.8; y: -26.8; skew-x: -7.2; scale-x: 2.386; scale-y: 3.051; }
        frame 26 { x: 13.6; y: -28.7; skew-x: -7.4; scale-x: 2.481; scale-y: 3.172; }
        frame 27 { x: 22.3; y: -8.3; skew-x: -5.5; skew-y: -4.2; scale-x: 1.675; scale-y: 2.03; }
        frame 28 { x: 30.2; y: 13.5; skew-x: -3.9; skew-y: -3.9; scale-x: 0.87; scale-y: 0.89; }
        frame 29 { x: 31; y: 16.8; skew-x: -2.4; skew-y: -2.4; scale-x: 0.792; scale-y: 0.805; }
        frame 30 { x: 31.6; y: 20.4; skew-x: -1.2; skew-y: -1.2; scale-x: 0.715; scale-y: 0.721; }
        frame 31 { x: 32; y: 24; skew-x: 0; skew-y: 0; scale-x: 0.637; scale-y: 0.637; }
    }
}
