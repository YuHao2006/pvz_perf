export component Plantern {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 25;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "Plantern_stem";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 24.5; y: 56.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_PLANTERN_STEM; }
        frame 6 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 10.9; y: -2.7; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_PLANTERN_BODY; }
        frame 6 { x: 10.7; y: -1.9; scale-x: 0.805; scale-y: 0.795; cel: -10000; image: none; }
        frame 7 { x: 10.5; y: -1.1; scale-x: 0.811; scale-y: 0.79; }
        frame 8 { x: 10.3; y: -0.3; scale-x: 0.816; scale-y: 0.785; }
        frame 9 { x: 10.1; y: 0.4; scale-x: 0.822; scale-y: 0.779; }
        frame 10 { x: 9.9; y: 1.2; scale-x: 0.827; scale-y: 0.774; }
        frame 11 { x: 9.7; y: 2; scale-x: 0.832; scale-y: 0.769; }
        frame 12 { x: 9.5; y: 2.9; scale-x: 0.838; scale-y: 0.764; }
        frame 13 { x: 9.3; y: 3.6; scale-x: 0.843; scale-y: 0.759; }
        frame 14 { x: 9.1; y: 4.4; scale-x: 0.849; scale-y: 0.754; }
        frame 15 { x: 9.2; y: 3.7; scale-x: 0.844; scale-y: 0.758; }
        frame 16 { x: 9.4; y: 3; scale-x: 0.839; scale-y: 0.763; }
        frame 17 { x: 9.6; y: 2.3; scale-x: 0.834; scale-y: 0.768; }
        frame 18 { x: 9.8; y: 1.5; scale-x: 0.829; scale-y: 0.772; }
        frame 19 { x: 10; y: 0.8; scale-x: 0.824; scale-y: 0.777; }
        frame 20 { x: 10.2; y: 0; scale-x: 0.819; scale-y: 0.781; }
        frame 21 { x: 10.4; y: -0.5; scale-x: 0.815; scale-y: 0.786; }
        frame 22 { x: 10.6; y: -1.3; scale-x: 0.81; scale-y: 0.791; }
        frame 23 { x: 10.7; y: -2; scale-x: 0.805; scale-y: 0.795; }
        frame 24 { x: 10.9; y: -2.7; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Plantern_blink";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { x: 42.5; y: 30.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_PLANTERN_EYES; }
        frame 2 { x: -10000; y: 30.7; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_PLANTERN_EYES2; }
        frame 3 { y: 30.8; image: IMAGE_REANIM_PLANTERN_EYES; }
        frame 4 { y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "Plantern_leaf1";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 5.7; y: 7.7; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF1; }
        frame 6 { x: 5.8; y: 7.9; skew-x: 4; skew-y: 4; scale-x: 0.799; scale-y: 0.799; cel: -10000; image: none; }
        frame 7 { x: 5.9; y: 8.1; skew-x: 8.3; skew-y: 8.3; scale-x: 0.798; scale-y: 0.798; }
        frame 8 { x: 4.8; y: 9.9; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 4; y: 11.9; skew-x: -4.9; skew-y: -4.9; }
        frame 10 { x: 3.1; y: 13.8; skew-x: -11.5; skew-y: -11.5; }
        frame 11 { x: 2.5; y: 15.9; skew-x: -18.2; skew-y: -18.2; }
        frame 12 { x: 1.8; y: 18; skew-x: -24.9; skew-y: -24.9; scale-x: 0.797; scale-y: 0.797; }
        frame 13 { x: 1.3; y: 20.2; skew-x: -31.5; skew-y: -31.5; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 0.7; y: 22.2; skew-x: -38.2; skew-y: -38.2; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 1.4; y: 25.5; skew-x: -57.6; skew-y: -57.6; scale-x: 0.796; scale-y: 0.796; }
        frame 16 { x: 2.7; y: 28.6; skew-x: -76.9; skew-y: -76.9; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 2.5; y: 26.1; skew-x: -67.3; skew-y: -67.3; scale-x: 0.795; scale-y: 0.795; }
        frame 18 { x: 2.3; y: 23.5; skew-x: -57.6; skew-y: -57.6; scale-x: 0.796; scale-y: 0.796; }
        frame 19 { x: 2.4; y: 20.7; skew-x: -48; skew-y: -48; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 2.6; y: 18.1; skew-x: -38.3; skew-y: -38.3; scale-x: 0.797; scale-y: 0.797; }
        frame 21 { x: 3.1; y: 15.4; skew-x: -28.7; skew-y: -28.7; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 3.8; y: 12.7; skew-x: -19; skew-y: -19; scale-x: 0.798; scale-y: 0.798; }
        frame 23 { x: 4.7; y: 10.1; skew-x: -9.4; skew-y: -9.4; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { x: 5.7; y: 7.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Plantern_leaf2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -1.1; y: 11.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF2; }
        frame 6 { x: -0; y: 10.3; skew-x: 8; skew-y: 9; scale-x: -10000; scale-y: 0.799; cel: -10000; image: none; }
        frame 7 { x: 1; y: 9.5; skew-x: 16.3; skew-y: 18.3; scale-x: 0.801; scale-y: 0.798; }
        frame 8 { x: -0; y: 11.7; skew-x: 9.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: -1; y: 13.8; skew-x: 2.5; skew-y: 6.5; scale-x: 0.803; }
        frame 10 { x: -1.9; y: 16; skew-x: -4.2; skew-y: 0.8; scale-x: 0.804; }
        frame 11 { x: -2.6; y: 18.3; skew-x: -10.9; skew-y: -4.9; scale-x: 0.805; }
        frame 12 { x: -3.2; y: 20.8; skew-x: -17.7; skew-y: -10.7; scale-x: 0.806; }
        frame 13 { x: -3.6; y: 23.2; skew-x: -24.7; skew-y: -16.5; scale-x: 0.807; }
        frame 14 { x: -3.8; y: 25.6; skew-x: -31.6; skew-y: -22.4; scale-x: 0.809; scale-y: 0.799; }
        frame 15 { x: -2.5; y: 27.7; skew-x: -41.3; skew-y: -26.5; scale-x: 0.829; scale-y: 0.797; }
        frame 16 { x: -1; y: 29.6; skew-x: -51.2; skew-y: -30.8; scale-x: 0.852; scale-y: -10000; }
        frame 17 { x: -1.4; y: 27.3; skew-x: -44.8; skew-y: -26.9; scale-x: 0.844; scale-y: 0.796; }
        frame 18 { x: -1.7; y: 25; skew-x: -38.3; skew-y: -23; scale-x: 0.837; scale-y: 0.797; }
        frame 19 { x: -1.9; y: 22.8; skew-x: -32; skew-y: -19.2; scale-x: 0.831; scale-y: -10000; }
        frame 20 { x: -10000; y: 20.5; skew-x: -25.5; skew-y: -15.2; scale-x: 0.825; scale-y: 0.798; }
        frame 21 { x: -1.8; y: 18.2; skew-x: -19; skew-y: -11.4; scale-x: 0.819; scale-y: -10000; }
        frame 22 { x: -1.7; y: 15.9; skew-x: -12.7; skew-y: -7.5; scale-x: 0.812; scale-y: 0.799; }
        frame 23 { x: -1.4; y: 13.5; skew-x: -6.2; skew-y: -3.7; scale-x: 0.806; scale-y: -10000; }
        frame 24 { x: -1.1; y: 11.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Plantern_leaf3";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 7.4; y: 16.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF3; }
        frame 6 { x: 7; y: 16.7; skew-x: 2.3; skew-y: 2.3; scale-x: 0.891; scale-y: 0.748; cel: -10000; image: none; }
        frame 7 { x: 6.5; y: 16.9; skew-x: 5; skew-y: 5; scale-x: 0.982; scale-y: 0.695; }
        frame 8 { x: 6.3; y: 18; skew-x: 2.5; skew-y: 2.5; scale-x: 0.955; scale-y: 0.72; }
        frame 9 { x: 6.2; y: 19.2; skew-x: 0; skew-y: 0; scale-x: 0.929; scale-y: 0.746; }
        frame 10 { x: 6.1; y: 20.3; skew-x: -2.2; skew-y: -2.2; scale-x: 0.903; scale-y: 0.77; }
        frame 11 { x: 5.9; y: 21.4; skew-x: -4.7; skew-y: -4.7; scale-x: 0.877; scale-y: 0.795; }
        frame 12 { x: 5.8; y: 22.5; skew-x: -7.2; skew-y: -7.2; scale-x: 0.851; scale-y: 0.82; }
        frame 13 { x: 5.7; y: 23.6; skew-x: -9.7; skew-y: -9.7; scale-x: 0.825; scale-y: 0.845; }
        frame 14 { x: 5.6; y: 24.7; skew-x: -12.2; skew-y: -12.2; scale-x: 0.799; scale-y: 0.871; }
        frame 15 { x: 5.7; y: 24.5; skew-x: -17.9; skew-y: -11.9; scale-x: 0.807; scale-y: 0.913; }
        frame 16 { x: 5.8; y: 24.1; skew-x: -23.8; skew-y: -11.7; scale-x: 0.817; scale-y: 0.957; }
        frame 17 { x: 6; y: 23; skew-x: -20.7; skew-y: -10.2; scale-x: 0.814; scale-y: 0.937; }
        frame 18 { x: 6.2; y: 22.1; skew-x: -17.7; skew-y: -8.7; scale-x: 0.812; scale-y: 0.917; }
        frame 19 { x: 6.4; y: 21.1; skew-x: -14.7; skew-y: -7.2; scale-x: 0.81; scale-y: 0.898; }
        frame 20 { x: 6.7; y: 20.1; skew-x: -11.7; skew-y: -5.7; scale-x: 0.808; scale-y: 0.878; }
        frame 21 { x: 6.9; y: 19.3; skew-x: -8.7; skew-y: -4.2; scale-x: 0.806; scale-y: 0.859; }
        frame 22 { x: 7; y: 18.3; skew-x: -5.7; skew-y: -2.7; scale-x: 0.804; scale-y: 0.839; }
        frame 23 { x: 7.3; y: 17.3; skew-x: -2.7; skew-y: -1.2; scale-x: 0.802; scale-y: 0.82; }
        frame 24 { x: 7.4; y: 16.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Plantern_leaf1.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 74.5; y: 9.8; skew-x: -163.8; skew-y: 16.1; scale-x: 0.735; scale-y: 0.735; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF1; }
        frame 6 { x: 73.9; y: 8.4; skew-x: -176.1; skew-y: 3.8; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 73.2; y: 7.4; skew-x: -188.2; skew-y: -8.2; scale-x: 0.736; scale-y: 0.736; }
        frame 8 { x: 73.9; y: 9; skew-x: -181.4; skew-y: -1.7; scale-x: 0.737; scale-y: 0.737; }
        frame 9 { x: 74.5; y: 10.8; skew-x: -174.9; skew-y: 4.5; scale-x: 0.739; scale-y: 0.739; }
        frame 10 { x: 75.1; y: 12.5; skew-x: -168.3; skew-y: 11; scale-x: 0.74; scale-y: 0.741; }
        frame 11 { x: 75.7; y: 14.2; skew-x: -161.6; skew-y: 17.5; scale-x: 0.741; scale-y: 0.742; }
        frame 12 { x: 76; y: 16.1; skew-x: -155.1; skew-y: 23.8; scale-x: 0.742; scale-y: 0.744; }
        frame 13 { x: 76.4; y: 18; skew-x: -148.3; skew-y: 30.3; scale-x: 0.744; scale-y: 0.745; }
        frame 14 { x: 76.7; y: 19.9; skew-x: -141.6; skew-y: 36.9; scale-x: 0.746; scale-y: 0.748; }
        frame 15 { x: 75.9; y: 23.7; skew-x: -118.3; skew-y: 60.4; scale-x: 0.743; scale-y: 0.744; }
        frame 16 { x: 74.1; y: 27.2; skew-x: -95.2; skew-y: 83.7; scale-x: 0.742; scale-y: 0.743; }
        frame 17 { x: 74.6; y: 25.2; skew-x: -103.7; skew-y: 75.4; scale-x: 0.74; scale-y: 0.741; }
        frame 18 { x: 75; y: 23; skew-x: -112.2; skew-y: 66.9; scale-x: 0.739; scale-y: 0.74; }
        frame 19 { x: 75.3; y: 20.9; skew-x: -121; skew-y: 58.4; scale-x: 0.738; scale-y: 0.739; }
        frame 20 { x: 75.5; y: 18.7; skew-x: -129.5; skew-y: 49.9; scale-x: 0.737; scale-y: 0.738; }
        frame 21 { x: 75.4; y: 16.5; skew-x: -138; skew-y: 41.4; scale-x: 0.736; scale-y: 0.737; }
        frame 22 { x: 75.2; y: 14.3; skew-x: -146.6; skew-y: 32.9; scale-x: -10000; scale-y: 0.736; }
        frame 23 { x: 74.9; y: 12; skew-x: -155.3; skew-y: 24.5; scale-x: 0.735; scale-y: 0.735; }
        frame 24 { x: 74.5; y: 9.8; skew-x: -163.8; skew-y: 16.1; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Plantern_leaf2.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 81.1; y: 12.8; skew-x: -169.6; skew-y: 10.3; scale-x: 0.736; scale-y: 0.736; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF2; }
        frame 6 { x: 80; y: 10.4; skew-x: -182.7; skew-y: -3.7; scale-x: 0.768; scale-y: 0.767; cel: -10000; image: none; }
        frame 7 { x: 78.5; y: 8.3; skew-x: -196.2; skew-y: -18.2; scale-x: 0.801; scale-y: 0.798; }
        frame 8 { x: 79.3; y: 10.6; skew-x: -188; skew-y: -11.2; scale-x: 0.794; scale-y: 0.791; }
        frame 9 { x: 79.8; y: 13; skew-x: -179.9; skew-y: -4.4; scale-x: 0.787; scale-y: 0.785; }
        frame 10 { x: 80.3; y: 15.4; skew-x: -172.1; skew-y: 2.3; scale-x: 0.78; scale-y: 0.779; }
        frame 11 { x: 80.4; y: 18; skew-x: -164.1; skew-y: 9; scale-x: 0.773; scale-y: 0.772; }
        frame 12 { x: 80.5; y: 20.6; skew-x: -155.9; skew-y: 16; scale-x: 0.766; scale-y: 0.765; }
        frame 13 { x: 80.3; y: 23.1; skew-x: -147.8; skew-y: 22.8; scale-x: 0.76; scale-y: 0.758; }
        frame 14 { x: 79.9; y: 25.6; skew-x: -139.8; skew-y: 29.8; scale-x: 0.754; scale-y: 0.753; }
        frame 15 { x: 78.7; y: 25.8; skew-x: -137.5; skew-y: 26.6; scale-x: 0.773; scale-y: 0.749; }
        frame 16 { x: 77.8; y: 26; skew-x: -135.1; skew-y: 23.6; scale-x: 0.795; scale-y: 0.747; }
        frame 17 { x: 78.3; y: 24.4; skew-x: -139.3; skew-y: 21.8; scale-x: 0.786; scale-y: 0.745; }
        frame 18 { x: 78.9; y: 22.8; skew-x: -143.8; skew-y: 20.3; scale-x: 0.779; scale-y: 0.744; }
        frame 19 { x: 79.3; y: 21.2; skew-x: -148.1; skew-y: 18.5; scale-x: 0.771; scale-y: 0.742; }
        frame 20 { x: 79.7; y: 19.5; skew-x: -152.3; skew-y: 16.8; scale-x: 0.764; scale-y: 0.741; }
        frame 21 { x: 80.1; y: 17.9; skew-x: -156.6; skew-y: 15.3; scale-x: 0.757; scale-y: 0.739; }
        frame 22 { x: 80.5; y: 16.2; skew-x: -161.1; skew-y: 13.5; scale-x: 0.75; scale-y: 0.738; }
        frame 23 { x: 80.7; y: 14.5; skew-x: -165.4; skew-y: 11.8; scale-x: 0.742; scale-y: 0.737; }
        frame 24 { x: 81.1; y: 12.8; skew-x: -169.6; skew-y: 10.3; scale-x: 0.736; scale-y: 0.736; }
    }
    Track {
        source-name: "Plantern_leaf3.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 71.1; y: 14.1; skew-x: 174.9; skew-y: -5; scale-x: 0.736; scale-y: 0.736; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF3; }
        frame 6 { x: 72.3; y: 14.6; skew-x: 175; skew-y: -4.9; scale-x: 0.858; scale-y: 0.715; cel: -10000; image: none; }
        frame 7 { x: 73.6; y: 15.1; skew-x: -10000; skew-y: -10000; scale-x: 0.982; scale-y: 0.695; }
        frame 8 { x: 73.4; y: 16.1; skew-x: 177.5; skew-y: -2.4; scale-x: 0.947; scale-y: 0.714; }
        frame 9 { x: 73.2; y: 17.2; skew-x: 180; skew-y: -0.2; scale-x: 0.913; scale-y: 0.732; }
        frame 10 { x: 73; y: 18.1; skew-x: 182.1; skew-y: 1.8; scale-x: 0.878; scale-y: 0.75; }
        frame 11 { x: 72.8; y: 19.3; skew-x: 184.5; skew-y: 4.1; scale-x: 0.844; scale-y: 0.768; }
        frame 12 { x: 72.6; y: 20.3; skew-x: 187; skew-y: 6.5; scale-x: 0.809; scale-y: 0.787; }
        frame 13 { x: 72.4; y: 21.4; skew-x: 189.3; skew-y: 8.8; scale-x: 0.774; scale-y: 0.805; }
        frame 14 { x: 72.3; y: 22.2; skew-x: 191.9; skew-y: 11.2; scale-x: 0.74; scale-y: 0.823; }
        frame 15 { x: 71.9; y: 22.8; skew-x: 202.3; skew-y: 11.5; scale-x: 0.765; scale-y: 0.813; }
        frame 16 { x: 71.4; y: 23.3; skew-x: 213; skew-y: 12.1; scale-x: 0.79; scale-y: 0.805; }
        frame 17 { x: 71.5; y: 22.1; skew-x: 208.1; skew-y: 9.8; scale-x: 0.782; scale-y: 0.796; }
        frame 18 { x: -10000; y: 20.9; skew-x: 203.3; skew-y: 7.8; scale-x: 0.776; scale-y: 0.787; }
        frame 19 { y: 19.8; skew-x: 198.6; skew-y: 5.5; scale-x: 0.769; scale-y: 0.779; }
        frame 20 { y: 18.6; skew-x: 193.8; skew-y: 3.5; scale-x: 0.762; scale-y: 0.77; }
        frame 21 { x: 71.4; y: 17.4; skew-x: 189.1; skew-y: 1.3; scale-x: 0.756; scale-y: 0.762; }
        frame 22 { x: 71.3; y: 16.2; skew-x: 184.3; skew-y: -0.7; scale-x: 0.749; scale-y: 0.753; }
        frame 23 { x: 71.2; y: 15.1; skew-x: 179.7; skew-y: -2.7; scale-x: 0.743; scale-y: 0.744; }
        frame 24 { x: 71.1; y: 14.1; skew-x: 174.9; skew-y: -5; scale-x: 0.736; scale-y: 0.736; }
    }
    Track {
        source-name: "Plantern_leaf4";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 26; y: 23.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF4; }
        frame 6 { x: 26.4; y: 22; skew-x: 5; skew-y: 5; scale-x: 0.799; scale-y: 0.799; cel: -10000; image: none; }
        frame 7 { x: 26.8; y: 20.7; skew-x: 10; skew-y: 10; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 26.6; y: 22.2; skew-x: 6.8; skew-y: 6.8; }
        frame 9 { x: 26.4; y: 23.7; skew-x: 3.8; skew-y: 3.8; }
        frame 10 { x: 26.1; y: 25.2; skew-x: 0.5; skew-y: 0.5; }
        frame 11 { x: 25.9; y: 26.6; skew-x: -2.2; skew-y: -2.2; }
        frame 12 { x: 25.7; y: 28.1; skew-x: -5.4; skew-y: -5.4; }
        frame 13 { x: 25.6; y: 29.7; skew-x: -8.4; skew-y: -8.4; }
        frame 14 { x: 25.3; y: 31.3; skew-x: -11.7; skew-y: -11.7; }
        frame 15 { x: -10000; y: 34.3; skew-x: -26.7; skew-y: -21.9; scale-x: 0.803; scale-y: 0.798; }
        frame 16 { x: 25.6; y: 37.3; skew-x: -41.8; skew-y: -32.2; scale-x: 0.809; scale-y: -10000; }
        frame 17 { x: 25.5; y: 35.6; skew-x: -36.5; skew-y: -28.2; scale-x: 0.807; scale-y: 0.797; }
        frame 18 { x: 25.3; y: 33.8; skew-x: -31.2; skew-y: -24.2; scale-x: 0.806; scale-y: 0.798; }
        frame 19 { x: -10000; y: 32; skew-x: -26; skew-y: -20; scale-x: 0.805; scale-y: -10000; }
        frame 20 { x: 25.4; y: 30.2; skew-x: -20.7; skew-y: -16; scale-x: 0.804; }
        frame 21 { x: -10000; y: 28.5; skew-x: -15.5; skew-y: -11.9; scale-x: 0.803; scale-y: 0.799; }
        frame 22 { x: 25.6; y: 26.8; skew-x: -10.2; skew-y: -7.9; scale-x: 0.802; scale-y: -10000; }
        frame 23 { x: 25.9; y: 25; skew-x: -5; skew-y: -3.9; scale-x: 0.801; scale-y: 0.8; }
        frame 24 { x: 26; y: 23.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: -10000; }
    }
    Track {
        source-name: "Plantern_leaf4.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 53; y: 26.7; skew-x: -164.9; skew-y: 15; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF4; }
        frame 6 { x: 52.5; y: 25.2; skew-x: -175.1; skew-y: 4.8; scale-x: 0.799; scale-y: 0.799; cel: -10000; image: none; }
        frame 7 { x: 51.8; y: 23.7; skew-x: -185.2; skew-y: -5.2; scale-x: 0.798; scale-y: 0.798; }
        frame 8 { x: 52.2; y: 25.1; skew-x: -180.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 52.5; y: 26.6; skew-x: -175.9; skew-y: 4; }
        frame 10 { x: 52.7; y: 28; skew-x: -171.1; skew-y: 8.8; }
        frame 11 { x: 52.9; y: 29.5; skew-x: -166.4; skew-y: 13.5; }
        frame 12 { x: 53.1; y: 30.9; skew-x: -161.8; skew-y: 18.1; }
        frame 13 { x: 53.2; y: 32.4; skew-x: -157.1; skew-y: 22.8; }
        frame 14 { x: -10000; y: 33.9; skew-x: -152.3; skew-y: 27.6; scale-x: 0.799; scale-y: 0.799; }
        frame 15 { x: 52.8; y: 36.4; skew-x: -139.5; skew-y: 35.8; scale-x: 0.808; scale-y: 0.797; }
        frame 16 { x: 52.1; y: 38.6; skew-x: -126.6; skew-y: 43.9; scale-x: 0.82; scale-y: 0.798; }
        frame 17 { x: 52.4; y: 37.1; skew-x: -131.3; skew-y: 40.1; scale-x: 0.816; scale-y: 0.797; }
        frame 18 { x: 52.6; y: 35.6; skew-x: -136.2; skew-y: 36.6; scale-x: 0.814; scale-y: -10000; }
        frame 19 { x: 52.8; y: 34.1; skew-x: -141; skew-y: 33.1; scale-x: 0.811; }
        frame 20 { x: 52.9; y: 32.8; skew-x: -145.8; skew-y: 29.3; scale-x: 0.809; scale-y: 0.798; }
        frame 21 { x: -10000; y: 31.2; skew-x: -150.6; skew-y: 25.8; scale-x: 0.806; scale-y: -10000; }
        frame 22 { x: 53; y: 29.8; skew-x: -155.3; skew-y: 22.1; scale-x: 0.804; }
        frame 23 { x: 52.9; y: 28.2; skew-x: -160.1; skew-y: 18.5; scale-x: 0.802; scale-y: 0.799; }
        frame 24 { x: 53; y: 26.7; skew-x: -164.9; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Plantern_leaf5";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 26.7; y: 26; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_PLANTERN_LEAF5; }
        frame 6 { x: 27.1; y: 24.8; skew-x: 6.5; skew-y: 6.5; scale-x: 0.801; scale-y: 0.807; cel: -10000; image: none; }
        frame 7 { x: 27.5; y: 23.8; skew-x: 13.1; skew-y: 13.1; scale-x: 0.802; scale-y: 0.815; }
        frame 8 { x: 27.2; y: 25.1; skew-x: 9.5; skew-y: 9.5; scale-x: 0.803; scale-y: 0.823; }
        frame 9 { x: 27; y: 26.4; skew-x: 6; skew-y: 6; scale-x: 0.805; scale-y: 0.831; }
        frame 10 { x: 26.8; y: 27.8; skew-x: 2.5; skew-y: 2.5; scale-x: 0.807; scale-y: 0.839; }
        frame 11 { x: 26.6; y: 29.1; skew-x: -0.7; skew-y: -0.7; scale-x: 0.809; scale-y: 0.847; }
        frame 12 { x: 26.3; y: 30.5; skew-x: -4.2; skew-y: -4.2; scale-x: 0.81; scale-y: 0.855; }
        frame 13 { x: -10000; y: 32; skew-x: -7.7; skew-y: -7.7; scale-x: 0.812; scale-y: 0.863; }
        frame 14 { x: 26.1; y: 33.3; skew-x: -11.2; skew-y: -11.2; scale-x: 0.814; scale-y: 0.871; }
        frame 15 { x: 27; y: 33.5; skew-x: -14.5; skew-y: -14.5; scale-x: 0.767; scale-y: 0.914; }
        frame 16 { x: 27.9; y: -10000; skew-x: -18; skew-y: -18; scale-x: 0.722; scale-y: 0.958; }
        frame 17 { x: 27.8; y: 32.5; skew-x: -15.7; skew-y: -15.7; scale-x: 0.731; scale-y: 0.937; }
        frame 18 { x: 27.7; y: 31.6; skew-x: -13.4; skew-y: -13.4; scale-x: 0.741; scale-y: 0.918; }
        frame 19 { x: 27.6; y: 30.7; skew-x: -11.2; skew-y: -11.2; scale-x: 0.751; scale-y: 0.898; }
        frame 20 { x: 27.4; y: 29.7; skew-x: -8.9; skew-y: -8.9; scale-x: 0.761; scale-y: 0.879; }
        frame 21 { x: 27.3; y: 28.7; skew-x: -6.7; skew-y: -6.7; scale-x: 0.771; scale-y: 0.859; }
        frame 22 { x: 27.1; y: 27.8; skew-x: -4.4; skew-y: -4.4; scale-x: 0.78; scale-y: 0.839; }
        frame 23 { x: 27; y: 26.9; skew-x: -2.2; skew-y: -2.2; scale-x: 0.79; scale-y: 0.82; }
        frame 24 { x: 26.7; y: 26; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
}
