export component LoadBar_Zombiehead {
    fps: 12;
    Track {
        source-name: "anim_zombie";
        frame-count: 18;
    }
    Track {
        source-name: "Zombie_head";
        frame-count: 18;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: -1.7; y: 18.9; scale-x: 0.328; scale-y: 0.216; cel: 0; image: IMAGE_REANIM_ZOMBIE_HEAD; }
        frame 10 { x: -4.4; y: 5.1; skew-x: 2.3; skew-y: 1.8; scale-x: 0.455; scale-y: 0.474; cel: -10000; image: none; }
        frame 11 { x: -6.5; y: -9; skew-x: 4.5; skew-y: 3.5; scale-x: 0.582; scale-y: 0.732; }
        frame 12 { x: -8.3; y: -23.4; skew-x: 7; skew-y: 5.3; scale-x: 0.709; scale-y: 0.99; }
        frame 13 { x: -11.7; y: -17.5; skew-x: 4.1; skew-y: 3.3; scale-x: 0.754; scale-y: 0.894; }
        frame 14 { x: -14.8; y: -11.8; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.799; }
        frame 15 { x: -10000; y: -11.2; skew-x: 1.3; skew-y: -10000; scale-x: -10000; scale-y: 0.792; }
        frame 16 { y: -10.6; skew-x: -10000; scale-y: 0.784; }
        frame 17 { y: -10.1; skew-x: 1.5; skew-y: 1.6; scale-y: 0.776; }
    }
    Track {
        source-name: "Zombie_hair";
        frame-count: 18;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: -2.4; y: 18.1; scale-x: 0.303; scale-y: 0.214; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAIR; }
        frame 10 { x: -5; y: 4.1; skew-x: 0.8; skew-y: 0.8; scale-x: 0.413; scale-y: 0.394; cel: -10000; image: none; }
        frame 11 { x: -7.4; y: -9.9; skew-x: 1.8; skew-y: 1.8; scale-x: 0.524; scale-y: 0.574; }
        frame 12 { x: -9.7; y: -24.1; skew-x: 2.8; skew-y: 2.8; scale-x: 0.635; scale-y: 0.754; }
        frame 13 { x: -11.1; y: -21.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.798; }
        frame 14 { x: -18.4; y: -15; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -10000; y: -14.2; scale-x: -10000; scale-y: 0.791; }
        frame 16 { x: -18.5; y: -13.4; scale-y: 0.782; }
        frame 17 { x: -10000; y: -12.6; scale-y: 0.774; }
    }
    Track {
        source-name: "Zombie_jaw";
        frame-count: 18;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 12 { x: -8.3; y: 19; scale-x: 0.769; scale-y: 0.724; cel: 0; image: IMAGE_REANIM_ZOMBIE_JAW; }
        frame 13 { x: -9.1; y: 18.1; scale-x: 0.794; scale-y: 0.77; cel: -10000; image: none; }
        frame 14 { x: -9.9; y: 17.1; scale-x: 0.82; scale-y: 0.815; }
        frame 15 { x: -10.2; y: 17.3; scale-x: 0.845; scale-y: 0.749; }
        frame 16 { x: -10; y: 17.7; scale-x: 0.833; scale-y: 0.771; }
        frame 17 { x: -9.9; y: 18; scale-x: 0.82; scale-y: 0.792; }
    }
    Track {
        source-name: "rock";
        frame-count: 18;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 6 { x: 10.5; y: 24.9; skew-x: 15; skew-y: 15; scale-x: 0.2; scale-y: 0.2; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 7 { x: 11.1; y: 24.3; skew-x: 19.8; skew-y: 19.8; scale-x: 0.233; scale-y: 0.233; cel: -10000; image: none; }
        frame 8 { x: 11.8; y: 23.6; skew-x: 24.8; skew-y: 24.8; scale-x: 0.266; scale-y: 0.266; }
        frame 9 { x: 12.5; y: 22.9; skew-x: 30; skew-y: 30; scale-x: 0.3; scale-y: 0.3; }
        frame 10 { x: 15.4; y: 22; skew-x: 44.9; skew-y: 44.9; scale-x: 0.345; scale-y: 0.345; }
        frame 11 { x: 18.6; y: 21.3; skew-x: 60; skew-y: 60; scale-x: 0.391; scale-y: 0.391; }
        frame 12 { x: 22.2; y: 20.9; skew-x: 75; skew-y: 75; scale-x: 0.437; scale-y: 0.437; }
        frame 13 { x: 23.9; y: 21.9; skew-x: 93.5; skew-y: 93.5; scale-x: 0.436; scale-y: 0.436; }
        frame 14 { x: 25.3; y: 23.3; skew-x: 112.3; skew-y: 112.3; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 25.9; y: 24.9; skew-x: 124.8; skew-y: 124.8; }
        frame 16 { x: 26.3; y: 26.5; skew-x: 137.4; skew-y: 137.4; }
        frame 17 { x: -10000; y: 28.1; skew-x: 150; skew-y: 150; scale-x: 0.437; scale-y: 0.437; }
    }
    Track {
        source-name: "rock";
        frame-count: 18;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 7 { x: 9.4; y: 29.3; skew-x: -89.9; skew-y: -89.9; scale-x: 0.2; scale-y: 0.2; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 8 { x: 9.2; y: 28.9; skew-x: -74.9; skew-y: -74.9; scale-x: 0.235; scale-y: 0.237; cel: -10000; image: none; }
        frame 9 { x: 9.1; y: 28.3; skew-x: -59.9; skew-y: -59.9; scale-x: 0.27; scale-y: 0.274; }
        frame 10 { x: 9.7; y: 27.3; skew-x: -39.8; skew-y: -39.8; scale-x: 0.313; scale-y: 0.315; }
        frame 11 { x: 10.9; y: 25.9; skew-x: -19.7; skew-y: -19.7; scale-x: 0.356; scale-y: 0.358; }
        frame 12 { x: 12.6; y: 24.2; skew-x: 0; skew-y: 0; scale-x: 0.4; scale-y: 0.4; }
        frame 13 { x: -10000; y: 23.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 14 { y: 23.4; }
        frame 15 { y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 18;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 10 { x: 13.8; y: 27.5; skew-x: 135; skew-y: 135; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK1; }
        frame 11 { x: 14.4; y: 25.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 12 { x: 15; y: 24.3; }
        frame 13 { x: 15.7; y: 22.7; }
        frame 14 { x: 16.8; y: 24.5; skew-x: 142.6; skew-y: 142.6; scale-x: 0.699; scale-y: 0.699; }
        frame 15 { x: 17.9; y: 26.4; skew-x: 150.1; skew-y: 150.1; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 18.7; y: 28; skew-x: 157.7; skew-y: 157.7; }
        frame 17 { x: 19.6; y: 29.8; skew-x: 165; skew-y: 165; scale-x: 0.7; scale-y: 0.7; }
    }
    Track {
        source-name: "rock";
        frame-count: 18;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 10 { x: -0.3; y: 29.9; skew-x: -104.9; skew-y: -104.9; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK1; }
        frame 11 { x: -0.6; y: 28.6; skew-x: -114.9; skew-y: -114.9; scale-x: 0.554; scale-y: 0.554; cel: -10000; image: none; }
        frame 12 { x: -0.7; y: 27.1; skew-x: -125; skew-y: -125; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -0.9; y: 25.6; skew-x: -134.9; skew-y: -134.9; scale-x: 0.555; scale-y: 0.555; }
        frame 14 { x: -0.5; y: 26.8; skew-x: -157.6; skew-y: -157.6; scale-x: 0.554; scale-y: 0.554; }
        frame 15 { x: -0.3; y: 27.6; skew-x: -179.9; skew-y: -179.9; scale-x: 0.555; scale-y: 0.555; }
        frame 16 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 18;
        frame 0 { cel: -1; }
        frame 1 { x: 4.1; y: 23.8; scale-x: 0.3; scale-y: 0.3; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK1; }
        frame 2 { x: 5.1; y: 23.5; skew-x: 4.8; skew-y: 4.8; scale-x: 0.367; scale-y: 0.367; cel: -10000; image: none; }
        frame 3 { x: 6.1; y: 23.2; skew-x: 9.8; skew-y: 9.8; scale-x: 0.433; scale-y: 0.433; }
        frame 4 { x: 7.3; y: 22.9; skew-x: 15; skew-y: 15; scale-x: 0.5; scale-y: 0.5; }
        frame 5 { x: 8.5; y: 22.5; skew-x: 29.9; skew-y: 29.9; scale-x: 0.508; scale-y: 0.508; }
        frame 6 { x: 9.7; y: -10000; skew-x: 44.9; skew-y: 44.9; scale-x: 0.517; scale-y: 0.517; }
        frame 7 { x: 11; y: 22.7; skew-x: 60; skew-y: 60; scale-x: 0.527; scale-y: 0.527; }
        frame 8 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 13.3; y: 24.4; skew-x: 90; skew-y: 90; }
        frame 10 { x: 14.6; y: 25; skew-x: 104.8; skew-y: 104.8; scale-x: 0.584; scale-y: 0.584; }
        frame 11 { x: 15.8; y: 26; skew-x: 119.9; skew-y: 119.9; scale-x: 0.641; scale-y: 0.641; }
        frame 12 { x: 16.9; y: 27.3; skew-x: 135; skew-y: 135; scale-x: 0.7; scale-y: 0.7; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 14 { y: 26.9; }
        frame 15 { y: 27.3; }
        frame 16 { y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 18;
        frame 0 { cel: -1; }
        frame 1 { x: 3.3; y: 23.7; skew-x: 15; skew-y: 15; scale-x: 0.128; scale-y: 0.137; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 2 { x: 1.7; y: 23.3; skew-x: 0; skew-y: 0; scale-x: 0.185; scale-y: 0.191; cel: -10000; image: none; }
        frame 3 { x: 0.2; y: -10000; skew-x: -14.7; skew-y: -14.7; scale-x: 0.243; scale-y: 0.245; }
        frame 4 { x: -1.2; y: 23.7; skew-x: -29.9; skew-y: -29.9; scale-x: 0.3; scale-y: 0.3; }
        frame 5 { x: -1.6; y: 24.4; skew-x: -39.8; skew-y: -39.8; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: -1.7; y: 25; skew-x: -50; skew-y: -50; }
        frame 7 { x: -1.9; y: 25.6; skew-x: -59.9; skew-y: -59.9; }
        frame 8 { x: -2.9; y: 27; skew-x: -75.1; skew-y: -75.1; }
        frame 9 { x: -3.6; y: 28.1; skew-x: -89.9; skew-y: -89.9; }
        frame 10 { x: -4.1; y: 29.5; skew-x: -114.7; skew-y: -114.7; scale-x: 0.357; scale-y: 0.348; }
        frame 11 { x: -4; y: 30.2; skew-x: -140; skew-y: -139.8; scale-x: 0.413; scale-y: 0.396; }
        frame 12 { x: -3.4; y: 29.5; skew-x: -164.9; skew-y: -164.9; scale-x: 0.471; scale-y: 0.445; }
        frame 13 { x: -10000; y: 29.2; skew-x: -165.1; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 14 { y: 28.9; skew-x: -164.9; }
        frame 15 { x: -2.4; y: 29.2; skew-x: -179.9; skew-y: -179.9; }
        frame 16 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 18;
        frame 0 { cel: -1; }
        frame 1 { x: 1.9; y: 23.4; skew-x: 15; skew-y: 15; scale-x: 0.2; scale-y: 0.2; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 2 { x: 1.7; y: 23.6; skew-x: 14.8; skew-y: 14.8; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 3 { x: 1.4; y: 23.9; skew-x: -10000; skew-y: -10000; }
        frame 4 { x: 1.2; y: 24.1; skew-x: 15; skew-y: 15; }
        frame 5 { x: 0.1; y: -10000; skew-x: 4.8; skew-y: 4.8; scale-x: 0.233; scale-y: 0.233; }
        frame 6 { x: -0.8; y: 24.2; skew-x: -4.7; skew-y: -4.7; scale-x: 0.267; scale-y: 0.267; }
        frame 7 { x: -1.9; y: 24.7; skew-x: -14.9; skew-y: -14.9; scale-x: 0.3; scale-y: 0.3; }
        frame 8 { x: -2.7; y: 25.3; skew-x: -22.2; skew-y: -22.2; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: -3.3; y: 25.9; skew-x: -29.9; skew-y: -29.9; }
        frame 10 { x: -5.4; y: 26.9; skew-x: -44.8; skew-y: -44.8; scale-x: 0.364; scale-y: 0.384; }
        frame 11 { x: -7.2; y: 28.2; skew-x: -60; skew-y: -59.9; scale-x: 0.428; scale-y: 0.469; }
        frame 12 { x: -8.5; y: 29.8; skew-x: -74.9; skew-y: -74.9; scale-x: 0.492; scale-y: 0.555; }
        frame 13 { x: -10000; y: 29.5; skew-x: -75.1; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 14 { y: 29.2; skew-x: -74.9; }
        frame 15 { x: -8.7; y: 29.1; skew-x: -70.1; skew-y: -69.9; }
        frame 16 { x: -9.1; y: 28.9; skew-x: -65.1; skew-y: -65.1; scale-y: 0.554; }
        frame 17 { x: -9.3; y: 28.7; skew-x: -59.9; skew-y: -59.9; scale-y: 0.555; }
    }
    Track {
        source-name: "rock";
        frame-count: 18;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 6; y: 25.3; skew-x: 15; skew-y: 15; scale-x: 0.109; scale-y: 0.127; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 4 { x: 6.4; y: 24.9; skew-x: -10000; skew-y: -10000; scale-x: 0.2; scale-y: 0.2; cel: -10000; image: none; }
        frame 5 { x: 6.3; y: 24.7; skew-x: 14.8; skew-y: 14.8; scale-x: 0.233; scale-y: 0.233; }
        frame 6 { x: 6.1; y: 24.5; skew-x: -10000; skew-y: -10000; scale-x: 0.266; scale-y: 0.266; }
        frame 7 { x: 6; y: 24.3; skew-x: 15; skew-y: 15; scale-x: 0.3; scale-y: 0.3; }
        frame 8 { x: 5.3; y: 24.8; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 4.8; y: 25.2; skew-x: 0; skew-y: 0; }
        frame 10 { x: -10000; y: 24.7; skew-x: 5; skew-y: 5; scale-x: 0.333; scale-y: 0.333; }
        frame 11 { y: 24.3; skew-x: 10; skew-y: 10; scale-x: 0.366; scale-y: 0.366; }
        frame 12 { x: 5.1; y: 23.8; skew-x: 15; skew-y: 15; scale-x: 0.4; scale-y: 0.4; }
        frame 13 { x: -10000; y: 23.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 14 { y: 23.6; }
        frame 15 { y: 23.8; }
        frame 16 { y: -10000; }
    }
    Track {
        source-name: "rock";
        frame-count: 18;
        frame 0 { cel: -1; }
        frame 1 { x: 4; y: 24.6; scale-x: 0.2; scale-y: 0.2; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK1; }
        frame 2 { x: 3.2; y: 24.7; skew-x: -18.7; skew-y: -18.7; scale-x: 0.288; scale-y: 0.288; cel: -10000; image: none; }
        frame 3 { x: 2.4; y: 25.3; skew-x: -37.5; skew-y: -37.5; scale-x: 0.377; scale-y: 0.377; }
        frame 4 { x: 1.8; y: 26.3; skew-x: -56.3; skew-y: -56.3; scale-x: 0.466; scale-y: 0.466; }
        frame 5 { x: -10000; y: 27.6; skew-x: -74.9; skew-y: -74.9; scale-x: 0.555; scale-y: 0.555; }
        frame 6 { x: 2.1; y: 28.8; skew-x: -89.9; skew-y: -89.9; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 2.6; y: 29.7; skew-x: -104.9; skew-y: -104.9; }
        frame 8 { x: 5.1; y: 30.9; skew-x: -150; skew-y: -150; scale-x: 0.552; scale-y: 0.552; }
        frame 9 { x: 6.9; y: 29.9; skew-x: -194.9; skew-y: -194.9; scale-x: 0.55; scale-y: 0.55; }
        frame 10 { x: 7.1; y: 29.3; skew-x: -204.9; skew-y: -204.7; scale-x: 0.582; scale-y: 0.582; }
        frame 11 { x: 7.2; y: 28.4; skew-x: -215; skew-y: -214.8; scale-x: 0.614; scale-y: 0.614; }
        frame 12 { x: -10000; y: 27.5; skew-x: -224.9; skew-y: -224.9; scale-x: 0.648; scale-y: 0.648; }
        frame 13 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
}
