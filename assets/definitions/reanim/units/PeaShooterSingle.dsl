export component PeaShooterSingle {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { cel: 0; }
        frame 5 { cel: -10000; }
        frame 29 { cel: -1; }
        frame 30 { cel: -10000; }
    }
    Track {
        source-name: "anim_head_idle";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 29 { cel: 0; }
        frame 30 { cel: -10000; }
        frame 54 { cel: -1; }
        frame 55 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 54 { cel: 0; }
        frame 55 { cel: -10000; }
        frame 79 { cel: -1; }
        frame 80 { cel: -10000; }
    }
    Track {
        source-name: "anim_full_idle";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 79 { cel: 0; }
        frame 80 { cel: -10000; }
    }
    Track {
        source-name: "backleaf";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 27.7; y: 53; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF; }
        frame 5 { x: -10000; y: 53.3; scale-x: 0.561; scale-y: 0.543; cel: -10000; image: none; }
        frame 6 { y: 53.5; scale-x: 0.566; scale-y: 0.53; }
        frame 7 { x: 27.6; y: 53.9; scale-x: 0.572; scale-y: 0.518; }
        frame 8 { x: -10000; y: 54.1; scale-x: 0.577; scale-y: 0.505; }
        frame 9 { y: 54.5; scale-x: 0.583; scale-y: 0.492; }
        frame 10 { y: 54.8; scale-x: 0.588; scale-y: 0.48; }
        frame 11 { y: 55; scale-x: 0.594; scale-y: 0.467; }
        frame 12 { x: 27.5; y: 55.3; scale-x: 0.599; scale-y: 0.454; }
        frame 13 { x: -10000; y: 55.6; scale-x: 0.605; scale-y: 0.442; }
        frame 14 { y: 55.9; scale-x: 0.61; scale-y: 0.429; }
        frame 15 { y: 55.6; scale-x: 0.607; scale-y: 0.438; }
        frame 16 { y: 55.5; scale-x: 0.603; scale-y: 0.447; }
        frame 17 { y: 55.3; scale-x: 0.599; scale-y: 0.456; }
        frame 18 { x: 27.6; y: 55; scale-x: 0.595; scale-y: 0.465; }
        frame 19 { x: -10000; y: 54.9; scale-x: 0.591; scale-y: 0.474; }
        frame 20 { y: 54.6; scale-x: 0.587; scale-y: 0.483; }
        frame 21 { y: 54.4; scale-x: 0.583; scale-y: 0.492; }
        frame 22 { y: 54.2; scale-x: 0.579; scale-y: 0.501; }
        frame 23 { y: 54; scale-x: 0.575; scale-y: 0.51; }
        frame 24 { x: 27.7; y: 53.7; scale-x: 0.571; scale-y: 0.519; }
        frame 25 { x: -10000; y: 53.6; scale-x: 0.567; scale-y: 0.528; }
        frame 26 { y: 53.4; scale-x: 0.563; scale-y: 0.537; }
        frame 27 { y: 53.1; scale-x: 0.559; scale-y: 0.546; }
        frame 28 { y: 53; scale-x: 0.555; scale-y: 0.555; }
        frame 29 { y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 30 { cel: -10000; }
        frame 79 { cel: 0; }
        frame 80 { y: 53.3; scale-x: 0.561; scale-y: 0.543; cel: -10000; }
        frame 81 { y: 53.5; scale-x: 0.566; scale-y: 0.53; }
        frame 82 { x: 27.6; y: 53.9; scale-x: 0.572; scale-y: 0.518; }
        frame 83 { x: -10000; y: 54.1; scale-x: 0.577; scale-y: 0.505; }
        frame 84 { y: 54.5; scale-x: 0.583; scale-y: 0.492; }
        frame 85 { y: 54.8; scale-x: 0.588; scale-y: 0.48; }
        frame 86 { y: 55; scale-x: 0.594; scale-y: 0.467; }
        frame 87 { x: 27.5; y: 55.3; scale-x: 0.599; scale-y: 0.454; }
        frame 88 { x: -10000; y: 55.6; scale-x: 0.605; scale-y: 0.442; }
        frame 89 { y: 55.9; scale-x: 0.61; scale-y: 0.429; }
        frame 90 { y: 55.6; scale-x: 0.607; scale-y: 0.438; }
        frame 91 { y: 55.5; scale-x: 0.603; scale-y: 0.447; }
        frame 92 { y: 55.3; scale-x: 0.599; scale-y: 0.456; }
        frame 93 { x: 27.6; y: 55; scale-x: 0.595; scale-y: 0.465; }
        frame 94 { x: -10000; y: 54.9; scale-x: 0.591; scale-y: 0.474; }
        frame 95 { y: 54.6; scale-x: 0.587; scale-y: 0.483; }
        frame 96 { y: 54.4; scale-x: 0.583; scale-y: 0.492; }
        frame 97 { y: 54.2; scale-x: 0.579; scale-y: 0.501; }
        frame 98 { y: 54; scale-x: 0.575; scale-y: 0.51; }
        frame 99 { x: 27.7; y: 53.7; scale-x: 0.571; scale-y: 0.519; }
        frame 100 { x: -10000; y: 53.6; scale-x: 0.567; scale-y: 0.528; }
        frame 101 { y: 53.4; scale-x: 0.563; scale-y: 0.537; }
        frame 102 { y: 53.1; scale-x: 0.559; scale-y: 0.546; }
        frame 103 { y: 53; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "backleaf_left_tip";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 25; y: 53.9; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF_LEFTTIP; }
        frame 5 { x: -10000; y: 54; skew-x: 0.5; skew-y: 0.5; scale-x: 0.565; scale-y: 0.547; cel: -10000; image: none; }
        frame 6 { x: 24.9; y: 54.2; skew-x: 1; skew-y: 1; scale-x: 0.575; scale-y: 0.539; }
        frame 7 { x: -10000; y: 54.4; skew-x: 1.5; skew-y: 1.5; scale-x: 0.584; scale-y: 0.531; }
        frame 8 { y: 54.5; skew-x: 2; skew-y: 2; scale-x: 0.594; scale-y: 0.523; }
        frame 9 { x: 25; y: 54.7; skew-x: 2.7; skew-y: 2.7; scale-x: 0.604; scale-y: 0.515; }
        frame 10 { x: 24.7; y: 55.3; skew-x: 0.3; skew-y: 0.3; scale-x: 0.616; scale-y: -10000; }
        frame 11 { x: 24.5; y: 55.8; skew-x: -1.7; skew-y: -1.7; scale-x: 0.628; }
        frame 12 { x: 24.3; y: 56.4; skew-x: -3.9; skew-y: -3.9; scale-x: 0.64; }
        frame 13 { x: 24; y: 57; skew-x: -6.2; skew-y: -6.2; scale-x: 0.652; }
        frame 14 { x: 23.9; y: 57.5; skew-x: -8.5; skew-y: -8.5; scale-x: 0.665; }
        frame 15 { x: 24.1; y: 57; skew-x: -6.7; skew-y: -6.7; scale-x: 0.656; }
        frame 16 { x: 24.2; y: 56.8; skew-x: -5.2; skew-y: -5.2; scale-x: 0.647; }
        frame 17 { x: 24.3; y: 56.3; skew-x: -3.5; skew-y: -3.5; scale-x: 0.638; }
        frame 18 { x: 24.5; y: 55.9; skew-x: -1.9; skew-y: -1.9; scale-x: 0.63; }
        frame 19 { x: 24.7; y: 55.5; skew-x: -0.2; skew-y: -0.2; scale-x: 0.621; }
        frame 20 { x: 24.8; y: 55.1; skew-x: 1; skew-y: 1; scale-x: 0.613; }
        frame 21 { x: 25; y: 54.7; skew-x: 2.7; skew-y: 2.7; scale-x: 0.604; }
        frame 22 { y: 54.5; skew-x: 2.3; skew-y: 2.3; scale-x: 0.597; scale-y: 0.521; }
        frame 23 { x: 24.9; y: -10000; skew-x: 1.8; skew-y: 1.8; scale-x: 0.59; scale-y: 0.527; }
        frame 24 { x: 25.1; y: 54.4; skew-x: 1.5; skew-y: 1.5; scale-x: 0.583; scale-y: 0.532; }
        frame 25 { x: 25; y: 54.3; skew-x: 1; skew-y: 1; scale-x: 0.576; scale-y: 0.538; }
        frame 26 { y: 54.1; skew-x: 0.8; skew-y: 0.8; scale-x: 0.569; scale-y: 0.544; }
        frame 27 { y: 54; skew-x: 0.3; skew-y: 0.3; scale-x: 0.562; scale-y: 0.55; }
        frame 28 { x: -10000; y: 53.9; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
        frame 29 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 30 { cel: -10000; }
        frame 79 { cel: 0; }
        frame 80 { y: 54; skew-x: 0.5; skew-y: 0.5; scale-x: 0.565; scale-y: 0.547; cel: -10000; }
        frame 81 { x: 24.9; y: 54.2; skew-x: 1; skew-y: 1; scale-x: 0.575; scale-y: 0.539; }
        frame 82 { x: -10000; y: 54.4; skew-x: 1.5; skew-y: 1.5; scale-x: 0.584; scale-y: 0.531; }
        frame 83 { y: 54.5; skew-x: 2; skew-y: 2; scale-x: 0.594; scale-y: 0.523; }
        frame 84 { x: 25; y: 54.7; skew-x: 2.7; skew-y: 2.7; scale-x: 0.604; scale-y: 0.515; }
        frame 85 { x: 24.7; y: 55.3; skew-x: 0.3; skew-y: 0.3; scale-x: 0.616; scale-y: -10000; }
        frame 86 { x: 24.5; y: 55.8; skew-x: -1.7; skew-y: -1.7; scale-x: 0.628; }
        frame 87 { x: 24.3; y: 56.4; skew-x: -3.9; skew-y: -3.9; scale-x: 0.64; }
        frame 88 { x: 24; y: 57; skew-x: -6.2; skew-y: -6.2; scale-x: 0.652; }
        frame 89 { x: 23.9; y: 57.5; skew-x: -8.5; skew-y: -8.5; scale-x: 0.665; }
        frame 90 { x: 24.1; y: 57; skew-x: -6.7; skew-y: -6.7; scale-x: 0.656; }
        frame 91 { x: 24.2; y: 56.8; skew-x: -5.2; skew-y: -5.2; scale-x: 0.647; }
        frame 92 { x: 24.3; y: 56.3; skew-x: -3.5; skew-y: -3.5; scale-x: 0.638; }
        frame 93 { x: 24.5; y: 55.9; skew-x: -1.9; skew-y: -1.9; scale-x: 0.63; }
        frame 94 { x: 24.7; y: 55.5; skew-x: -0.2; skew-y: -0.2; scale-x: 0.621; }
        frame 95 { x: 24.8; y: 55.1; skew-x: 1; skew-y: 1; scale-x: 0.613; }
        frame 96 { x: 25; y: 54.7; skew-x: 2.7; skew-y: 2.7; scale-x: 0.604; }
        frame 97 { y: 54.5; skew-x: 2.3; skew-y: 2.3; scale-x: 0.597; scale-y: 0.521; }
        frame 98 { x: 24.9; y: -10000; skew-x: 1.8; skew-y: 1.8; scale-x: 0.59; scale-y: 0.527; }
        frame 99 { x: 25.1; y: 54.4; skew-x: 1.5; skew-y: 1.5; scale-x: 0.583; scale-y: 0.532; }
        frame 100 { x: 25; y: 54.3; skew-x: 1; skew-y: 1; scale-x: 0.576; scale-y: 0.538; }
        frame 101 { y: 54.1; skew-x: 0.8; skew-y: 0.8; scale-x: 0.569; scale-y: 0.544; }
        frame 102 { y: 54; skew-x: 0.3; skew-y: 0.3; scale-x: 0.562; scale-y: 0.55; }
        frame 103 { x: -10000; y: 53.9; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "backleaf_right_tip";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 47; y: 52.9; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF_RIGHTTIP; }
        frame 5 { x: 47.2; y: 53.1; skew-x: 0.3; skew-y: 0.3; scale-x: 0.578; scale-y: 0.547; cel: -10000; image: none; }
        frame 6 { x: 47.3; y: 53.4; skew-x: 0.5; skew-y: 0.5; scale-x: 0.6; scale-y: 0.539; }
        frame 7 { x: 47.5; y: 53.6; skew-x: 0.8; skew-y: 0.8; scale-x: 0.623; scale-y: 0.531; }
        frame 8 { x: -10000; y: 54; skew-x: 1.1; skew-y: 1.1; scale-x: 0.645; scale-y: 0.523; }
        frame 9 { x: 47.7; y: 54.1; skew-x: 1.5; skew-y: 1.5; scale-x: 0.667; scale-y: 0.515; }
        frame 10 { x: 47.9; y: 54.4; skew-x: 2.8; skew-y: 2.8; scale-x: 0.66; scale-y: 0.508; }
        frame 11 { x: 48.1; y: 54.8; skew-x: 4.3; skew-y: 4.3; scale-x: 0.653; scale-y: 0.5; }
        frame 12 { x: 48.4; y: 55; skew-x: 5.8; skew-y: 5.8; scale-x: 0.646; scale-y: 0.492; }
        frame 13 { x: 48.6; y: 55.4; skew-x: 7.3; skew-y: 7.3; scale-x: 0.639; scale-y: 0.484; }
        frame 14 { x: 48.8; y: 55.7; skew-x: 8.8; skew-y: 8.8; scale-x: 0.633; scale-y: 0.477; }
        frame 15 { x: 48.5; y: 55.5; skew-x: 7.6; skew-y: 7.6; scale-x: 0.637; scale-y: 0.482; }
        frame 16 { x: 48.4; y: 55.3; skew-x: 6.5; skew-y: 6.5; scale-x: 0.642; scale-y: 0.488; }
        frame 17 { x: 48.3; y: 55; skew-x: 5.5; skew-y: 5.5; scale-x: 0.647; scale-y: 0.493; }
        frame 18 { x: 48; y: 54.8; skew-x: 4.3; skew-y: 4.3; scale-x: 0.652; scale-y: 0.499; }
        frame 19 { y: 54.6; skew-x: 3.3; skew-y: 3.3; scale-x: 0.657; scale-y: 0.504; }
        frame 20 { x: 47.8; y: 54.4; skew-x: 2.3; skew-y: 2.3; scale-x: 0.662; scale-y: 0.51; }
        frame 21 { x: 47.7; y: 54.1; skew-x: 1.2; skew-y: 1.2; scale-x: 0.667; scale-y: 0.515; }
        frame 22 { x: 47.5; y: 54; skew-x: 1; skew-y: 1; scale-x: 0.651; scale-y: 0.521; }
        frame 23 { x: -10000; y: 53.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.635; scale-y: 0.527; }
        frame 24 { y: 53.5; skew-x: 0.6; skew-y: 0.6; scale-x: 0.619; scale-y: 0.533; }
        frame 25 { x: 47.4; y: 53.4; skew-x: 0.5; skew-y: 0.5; scale-x: 0.603; scale-y: 0.538; }
        frame 26 { x: -10000; y: 53.2; skew-x: 0.3; skew-y: 0.3; scale-x: 0.587; scale-y: 0.544; }
        frame 27 { x: 47.3; y: 53; skew-x: 0; skew-y: 0; scale-x: 0.571; scale-y: 0.55; }
        frame 28 { x: 47.1; y: 52.9; skew-x: -10000; skew-y: -10000; scale-x: 0.555; scale-y: 0.555; }
        frame 29 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 30 { cel: -10000; }
        frame 79 { x: 47; cel: 0; }
        frame 80 { x: 47.2; y: 53.1; skew-x: 0.3; skew-y: 0.3; scale-x: 0.578; scale-y: 0.547; cel: -10000; }
        frame 81 { x: 47.3; y: 53.4; skew-x: 0.5; skew-y: 0.5; scale-x: 0.6; scale-y: 0.539; }
        frame 82 { x: 47.5; y: 53.6; skew-x: 0.8; skew-y: 0.8; scale-x: 0.623; scale-y: 0.531; }
        frame 83 { x: -10000; y: 54; skew-x: 1.1; skew-y: 1.1; scale-x: 0.645; scale-y: 0.523; }
        frame 84 { x: 47.7; y: 54.1; skew-x: 1.5; skew-y: 1.5; scale-x: 0.667; scale-y: 0.515; }
        frame 85 { x: 47.9; y: 54.4; skew-x: 2.8; skew-y: 2.8; scale-x: 0.66; scale-y: 0.508; }
        frame 86 { x: 48.1; y: 54.8; skew-x: 4.3; skew-y: 4.3; scale-x: 0.653; scale-y: 0.5; }
        frame 87 { x: 48.4; y: 55; skew-x: 5.8; skew-y: 5.8; scale-x: 0.646; scale-y: 0.492; }
        frame 88 { x: 48.6; y: 55.4; skew-x: 7.3; skew-y: 7.3; scale-x: 0.639; scale-y: 0.484; }
        frame 89 { x: 48.8; y: 55.7; skew-x: 8.8; skew-y: 8.8; scale-x: 0.633; scale-y: 0.477; }
        frame 90 { x: 48.5; y: 55.5; skew-x: 7.6; skew-y: 7.6; scale-x: 0.637; scale-y: 0.482; }
        frame 91 { x: 48.4; y: 55.3; skew-x: 6.5; skew-y: 6.5; scale-x: 0.642; scale-y: 0.488; }
        frame 92 { x: 48.3; y: 55; skew-x: 5.5; skew-y: 5.5; scale-x: 0.647; scale-y: 0.493; }
        frame 93 { x: 48; y: 54.8; skew-x: 4.3; skew-y: 4.3; scale-x: 0.652; scale-y: 0.499; }
        frame 94 { y: 54.6; skew-x: 3.3; skew-y: 3.3; scale-x: 0.657; scale-y: 0.504; }
        frame 95 { x: 47.8; y: 54.4; skew-x: 2.3; skew-y: 2.3; scale-x: 0.662; scale-y: 0.51; }
        frame 96 { x: 47.7; y: 54.1; skew-x: 1.2; skew-y: 1.2; scale-x: 0.667; scale-y: 0.515; }
        frame 97 { x: 47.5; y: 54; skew-x: 1; skew-y: 1; scale-x: 0.651; scale-y: 0.521; }
        frame 98 { x: -10000; y: 53.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.635; scale-y: 0.527; }
        frame 99 { y: 53.5; skew-x: 0.6; skew-y: 0.6; scale-x: 0.619; scale-y: 0.533; }
        frame 100 { x: 47.4; y: 53.4; skew-x: 0.5; skew-y: 0.5; scale-x: 0.603; scale-y: 0.538; }
        frame 101 { x: -10000; y: 53.2; skew-x: 0.3; skew-y: 0.3; scale-x: 0.587; scale-y: 0.544; }
        frame 102 { x: 47.3; y: 53; skew-x: 0; skew-y: 0; scale-x: 0.571; scale-y: 0.55; }
        frame 103 { x: 47.1; y: 52.9; skew-x: -10000; skew-y: -10000; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "stalk_bottom";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 36.1; y: 52.6; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_STALK_BOTTOM; }
        frame 5 { x: 36.5; y: 52; skew-x: 2; skew-y: 1.3; scale-x: 0.556; scale-y: 0.589; cel: -10000; image: none; }
        frame 6 { x: 36.7; y: 51.4; skew-x: 4.1; skew-y: 2.8; scale-x: 0.557; scale-y: 0.622; }
        frame 7 { x: 37.1; y: 50.8; skew-x: 6.3; skew-y: 4; scale-x: 0.558; scale-y: 0.655; }
        frame 8 { x: 37.5; y: 50.1; skew-x: 8.3; skew-y: 5.5; scale-x: 0.559; scale-y: 0.688; }
        frame 9 { x: 37.9; y: 49.6; skew-x: 10.5; skew-y: 6.8; scale-x: -10000; scale-y: 0.721; }
        frame 10 { x: 38.3; y: 49; skew-x: 12.7; skew-y: 8.3; scale-x: 0.56; scale-y: 0.755; }
        frame 11 { x: 39; y: 49.1; skew-x: 16.8; skew-y: 10.8; scale-x: 0.561; scale-y: 0.733; }
        frame 12 { x: 39.7; y: 49.3; skew-x: 20.8; skew-y: 13.5; scale-x: 0.562; scale-y: 0.712; }
        frame 13 { x: 40.4; y: 49.6; skew-x: 25.1; skew-y: 16.1; scale-x: 0.563; scale-y: 0.691; }
        frame 14 { x: 41.1; y: 49.8; skew-x: 29.1; skew-y: 18.8; scale-x: 0.564; scale-y: 0.67; }
        frame 15 { x: 41.8; y: 50; skew-x: 33.3; skew-y: 21.3; scale-x: 0.565; scale-y: 0.649; }
        frame 16 { x: 42.4; y: 50.4; skew-x: 37.5; skew-y: 24.1; scale-x: 0.567; scale-y: 0.629; }
        frame 17 { x: 41.6; y: 50.3; skew-x: 33.3; skew-y: 21.3; scale-x: 0.565; scale-y: 0.634; }
        frame 18 { x: 40.9; y: -10000; skew-x: 29.1; skew-y: 18.8; scale-x: 0.564; scale-y: 0.64; }
        frame 19 { x: 40.1; y: 50.1; skew-x: 25.1; skew-y: 16.1; scale-x: 0.563; scale-y: 0.647; }
        frame 20 { x: 39.4; y: 50; skew-x: 20.8; skew-y: 13.5; scale-x: 0.562; scale-y: 0.653; }
        frame 21 { x: 38.6; y: -10000; skew-x: 16.8; skew-y: 10.8; scale-x: 0.561; scale-y: 0.659; }
        frame 22 { x: 38; y: 49.8; skew-x: 12.7; skew-y: 8.3; scale-x: 0.56; scale-y: 0.665; }
        frame 23 { x: 37.6; y: 50.4; skew-x: 10.5; skew-y: 6.8; scale-x: 0.559; scale-y: 0.647; }
        frame 24 { x: 37.4; y: 50.8; skew-x: 8.3; skew-y: 5.5; scale-x: -10000; scale-y: 0.629; }
        frame 25 { x: 37; y: 51.2; skew-x: 6.3; skew-y: 4; scale-x: 0.558; scale-y: 0.61; }
        frame 26 { x: 36.6; y: 51.6; skew-x: 4.1; skew-y: 2.8; scale-x: 0.557; scale-y: 0.592; }
        frame 27 { x: 36.4; y: 52.1; skew-x: 2; skew-y: 1.3; scale-x: 0.556; scale-y: 0.574; }
        frame 28 { x: 36.1; y: 52.6; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 30 { cel: -10000; }
        frame 79 { cel: 0; }
        frame 80 { x: 36.5; y: 52; skew-x: 2; skew-y: 1.3; scale-x: 0.556; scale-y: 0.589; cel: -10000; }
        frame 81 { x: 36.7; y: 51.4; skew-x: 4.1; skew-y: 2.8; scale-x: 0.557; scale-y: 0.622; }
        frame 82 { x: 37.1; y: 50.8; skew-x: 6.3; skew-y: 4; scale-x: 0.558; scale-y: 0.655; }
        frame 83 { x: 37.5; y: 50.1; skew-x: 8.3; skew-y: 5.5; scale-x: 0.559; scale-y: 0.688; }
        frame 84 { x: 37.9; y: 49.6; skew-x: 10.5; skew-y: 6.8; scale-x: -10000; scale-y: 0.721; }
        frame 85 { x: 38.3; y: 49; skew-x: 12.7; skew-y: 8.3; scale-x: 0.56; scale-y: 0.755; }
        frame 86 { x: 39; y: 49.1; skew-x: 16.8; skew-y: 10.8; scale-x: 0.561; scale-y: 0.733; }
        frame 87 { x: 39.7; y: 49.3; skew-x: 20.8; skew-y: 13.5; scale-x: 0.562; scale-y: 0.712; }
        frame 88 { x: 40.4; y: 49.6; skew-x: 25.1; skew-y: 16.1; scale-x: 0.563; scale-y: 0.691; }
        frame 89 { x: 41.1; y: 49.8; skew-x: 29.1; skew-y: 18.8; scale-x: 0.564; scale-y: 0.67; }
        frame 90 { x: 41.8; y: 50; skew-x: 33.3; skew-y: 21.3; scale-x: 0.565; scale-y: 0.649; }
        frame 91 { x: 42.4; y: 50.4; skew-x: 37.5; skew-y: 24.1; scale-x: 0.567; scale-y: 0.629; }
        frame 92 { x: 41.6; y: 50.3; skew-x: 33.3; skew-y: 21.3; scale-x: 0.565; scale-y: 0.634; }
        frame 93 { x: 40.9; y: -10000; skew-x: 29.1; skew-y: 18.8; scale-x: 0.564; scale-y: 0.64; }
        frame 94 { x: 40.1; y: 50.1; skew-x: 25.1; skew-y: 16.1; scale-x: 0.563; scale-y: 0.647; }
        frame 95 { x: 39.4; y: 50; skew-x: 20.8; skew-y: 13.5; scale-x: 0.562; scale-y: 0.653; }
        frame 96 { x: 38.6; y: -10000; skew-x: 16.8; skew-y: 10.8; scale-x: 0.561; scale-y: 0.659; }
        frame 97 { x: 38; y: 49.8; skew-x: 12.7; skew-y: 8.3; scale-x: 0.56; scale-y: 0.665; }
        frame 98 { x: 37.6; y: 50.4; skew-x: 10.5; skew-y: 6.8; scale-x: 0.559; scale-y: 0.647; }
        frame 99 { x: 37.4; y: 50.8; skew-x: 8.3; skew-y: 5.5; scale-x: -10000; scale-y: 0.629; }
        frame 100 { x: 37; y: 51.2; skew-x: 6.3; skew-y: 4; scale-x: 0.558; scale-y: 0.61; }
        frame 101 { x: 36.6; y: 51.6; skew-x: 4.1; skew-y: 2.8; scale-x: 0.557; scale-y: 0.592; }
        frame 102 { x: 36.4; y: 52.1; skew-x: 2; skew-y: 1.3; scale-x: 0.556; scale-y: 0.574; }
        frame 103 { x: 36.1; y: 52.6; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "stalk_top";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 31; y: 45.3; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_STALK_TOP; }
        frame 5 { x: 31.4; y: 43; skew-x: 1.8; skew-y: 1; scale-x: 0.556; scale-y: 0.633; cel: -10000; image: none; }
        frame 6 { x: 32; y: 40.8; skew-x: 3.8; skew-y: 2.3; scale-x: 0.557; scale-y: 0.71; }
        frame 7 { x: 32.5; y: 38.5; skew-x: 5.7; skew-y: 3.5; scale-x: -10000; scale-y: 0.787; }
        frame 8 { x: 33; y: 38; skew-x: 7.3; skew-y: 4.5; scale-x: 0.56; scale-y: 0.81; }
        frame 9 { x: 33.6; y: 37.4; skew-x: 9.1; skew-y: 5.5; scale-x: 0.563; scale-y: 0.834; }
        frame 10 { x: 34.3; y: 36.6; skew-x: 11; skew-y: 6.5; scale-x: 0.566; scale-y: 0.858; }
        frame 11 { x: 35.5; y: 36.8; skew-x: 13.1; skew-y: 8.8; scale-x: 0.564; scale-y: 0.843; }
        frame 12 { x: 36.8; y: 37; skew-x: 15.5; skew-y: 11; scale-x: 0.562; scale-y: 0.829; }
        frame 13 { x: 38; y: 37.1; skew-x: 17.8; skew-y: 13.3; scale-x: 0.561; scale-y: 0.815; }
        frame 14 { x: 40; y: 37.6; skew-x: 19.6; skew-y: 19.1; scale-x: 0.551; scale-y: 0.804; }
        frame 15 { x: 42; y: 38.1; skew-x: 21.5; skew-y: 25; scale-x: 0.541; scale-y: 0.794; }
        frame 16 { x: 44; y: 39; skew-x: 23.5; skew-y: 30.8; scale-x: 0.532; scale-y: 0.785; }
        frame 17 { x: 42; y: 38.2; skew-x: 22.1; skew-y: 25.6; scale-x: 0.546; scale-y: 0.794; }
        frame 18 { x: 40.3; y: 37.6; skew-x: 20.8; skew-y: 20.3; scale-x: 0.561; scale-y: 0.804; }
        frame 19 { x: 38.4; y: 36.9; skew-x: 19.6; skew-y: 15.1; scale-x: 0.576; scale-y: 0.815; }
        frame 20 { x: 37; y: -10000; skew-x: 16.6; skew-y: 12.3; scale-x: 0.572; scale-y: 0.828; }
        frame 21 { x: 35.6; y: 36.7; skew-x: 13.8; skew-y: 9.3; scale-x: 0.569; scale-y: 0.843; }
        frame 22 { x: 34.3; y: 36.6; skew-x: 11; skew-y: 6.5; scale-x: 0.566; scale-y: 0.858; }
        frame 23 { x: 33.7; y: 37.3; skew-x: 9.1; skew-y: 5.5; scale-x: 0.563; scale-y: 0.834; }
        frame 24 { x: 33.1; y: 37.9; skew-x: 7.3; skew-y: 4.5; scale-x: 0.56; scale-y: 0.81; }
        frame 25 { x: 32.5; y: 38.5; skew-x: 5.7; skew-y: 3.5; scale-x: 0.557; scale-y: 0.787; }
        frame 26 { x: 32; y: 40.9; skew-x: 3.8; skew-y: 2.3; scale-x: -10000; scale-y: 0.71; }
        frame 27 { x: 31.5; y: 43; skew-x: 1.8; skew-y: 1; scale-x: 0.556; scale-y: 0.633; }
        frame 28 { x: 31; y: 45.3; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 30 { cel: -10000; }
        frame 79 { cel: 0; }
        frame 80 { x: 31.4; y: 43; skew-x: 1.8; skew-y: 1; scale-x: 0.556; scale-y: 0.633; cel: -10000; }
        frame 81 { x: 32; y: 40.8; skew-x: 3.8; skew-y: 2.3; scale-x: 0.557; scale-y: 0.71; }
        frame 82 { x: 32.5; y: 38.5; skew-x: 5.7; skew-y: 3.5; scale-x: -10000; scale-y: 0.787; }
        frame 83 { x: 33; y: 38; skew-x: 7.3; skew-y: 4.5; scale-x: 0.56; scale-y: 0.81; }
        frame 84 { x: 33.6; y: 37.4; skew-x: 9.1; skew-y: 5.5; scale-x: 0.563; scale-y: 0.834; }
        frame 85 { x: 34.3; y: 36.6; skew-x: 11; skew-y: 6.5; scale-x: 0.566; scale-y: 0.858; }
        frame 86 { x: 35.5; y: 36.8; skew-x: 13.1; skew-y: 8.8; scale-x: 0.564; scale-y: 0.843; }
        frame 87 { x: 36.8; y: 37; skew-x: 15.5; skew-y: 11; scale-x: 0.562; scale-y: 0.829; }
        frame 88 { x: 38; y: 37.1; skew-x: 17.8; skew-y: 13.3; scale-x: 0.561; scale-y: 0.815; }
        frame 89 { x: 40; y: 37.6; skew-x: 19.6; skew-y: 19.1; scale-x: 0.551; scale-y: 0.804; }
        frame 90 { x: 42; y: 38.1; skew-x: 21.5; skew-y: 25; scale-x: 0.541; scale-y: 0.794; }
        frame 91 { x: 44; y: 39; skew-x: 23.5; skew-y: 30.8; scale-x: 0.532; scale-y: 0.785; }
        frame 92 { x: 42; y: 38.2; skew-x: 22.1; skew-y: 25.6; scale-x: 0.546; scale-y: 0.794; }
        frame 93 { x: 40.3; y: 37.6; skew-x: 20.8; skew-y: 20.3; scale-x: 0.561; scale-y: 0.804; }
        frame 94 { x: 38.4; y: 36.9; skew-x: 19.6; skew-y: 15.1; scale-x: 0.576; scale-y: 0.815; }
        frame 95 { x: 37; y: -10000; skew-x: 16.6; skew-y: 12.3; scale-x: 0.572; scale-y: 0.828; }
        frame 96 { x: 35.6; y: 36.7; skew-x: 13.8; skew-y: 9.3; scale-x: 0.569; scale-y: 0.843; }
        frame 97 { x: 34.3; y: 36.6; skew-x: 11; skew-y: 6.5; scale-x: 0.566; scale-y: 0.858; }
        frame 98 { x: 33.7; y: 37.3; skew-x: 9.1; skew-y: 5.5; scale-x: 0.563; scale-y: 0.834; }
        frame 99 { x: 33.1; y: 37.9; skew-x: 7.3; skew-y: 4.5; scale-x: 0.56; scale-y: 0.81; }
        frame 100 { x: 32.5; y: 38.5; skew-x: 5.7; skew-y: 3.5; scale-x: 0.557; scale-y: 0.787; }
        frame 101 { x: 32; y: 40.9; skew-x: 3.8; skew-y: 2.3; scale-x: -10000; scale-y: 0.71; }
        frame 102 { x: 31.5; y: 43; skew-x: 1.8; skew-y: 1; scale-x: 0.556; scale-y: 0.633; }
        frame 103 { x: 31; y: 45.3; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "frontleaf";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 22.8; y: 54.4; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF; }
        frame 5 { x: 22.7; y: 54.5; scale-x: 0.559; scale-y: 0.55; cel: -10000; image: none; }
        frame 6 { x: 22.6; y: 54.8; scale-x: 0.563; scale-y: 0.544; }
        frame 7 { x: 22.5; y: 55; scale-x: 0.566; scale-y: 0.538; }
        frame 8 { x: 22.4; y: 55.1; scale-x: 0.57; scale-y: 0.533; }
        frame 9 { x: 22.3; y: 55.3; scale-x: 0.574; scale-y: 0.527; }
        frame 10 { x: 22.2; y: 55.4; scale-x: 0.577; scale-y: 0.521; }
        frame 11 { x: 22.1; y: 55.6; scale-x: 0.581; scale-y: 0.516; }
        frame 12 { x: 22; y: 55.8; scale-x: 0.585; scale-y: 0.51; }
        frame 13 { x: 21.9; y: 56; scale-x: 0.588; scale-y: 0.504; }
        frame 14 { x: 21.8; y: 56.1; scale-x: 0.592; scale-y: 0.499; }
        frame 15 { x: 21.7; y: 56.4; scale-x: 0.596; scale-y: 0.493; }
        frame 16 { x: -10000; y: 56.5; scale-x: 0.6; scale-y: 0.487; }
        frame 17 { y: 56.4; scale-x: 0.596; scale-y: 0.493; }
        frame 18 { x: 21.9; y: 56.1; scale-x: 0.592; scale-y: 0.499; }
        frame 19 { x: 22; y: 56; scale-x: 0.588; scale-y: 0.504; }
        frame 20 { x: 22.1; y: 55.9; scale-x: 0.585; scale-y: 0.51; }
        frame 21 { x: 22.2; y: 55.6; scale-x: 0.581; scale-y: 0.516; }
        frame 22 { x: -10000; y: 55.5; scale-x: 0.577; scale-y: 0.521; }
        frame 23 { x: 22.3; y: 55.3; scale-x: 0.574; scale-y: 0.527; }
        frame 24 { x: 22.4; y: 55.1; scale-x: 0.57; scale-y: 0.533; }
        frame 25 { x: 22.5; y: 54.9; scale-x: 0.566; scale-y: 0.538; }
        frame 26 { x: 22.6; y: 54.8; scale-x: 0.563; scale-y: 0.544; }
        frame 27 { x: 22.7; y: 54.6; scale-x: 0.559; scale-y: 0.55; }
        frame 28 { x: 22.8; y: 54.4; scale-x: 0.555; scale-y: 0.555; }
        frame 29 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 30 { cel: -10000; }
        frame 79 { cel: 0; }
        frame 80 { x: 22.7; y: 54.5; scale-x: 0.559; scale-y: 0.55; cel: -10000; }
        frame 81 { x: 22.6; y: 54.8; scale-x: 0.563; scale-y: 0.544; }
        frame 82 { x: 22.5; y: 55; scale-x: 0.566; scale-y: 0.538; }
        frame 83 { x: 22.4; y: 55.1; scale-x: 0.57; scale-y: 0.533; }
        frame 84 { x: 22.3; y: 55.3; scale-x: 0.574; scale-y: 0.527; }
        frame 85 { x: 22.2; y: 55.4; scale-x: 0.577; scale-y: 0.521; }
        frame 86 { x: 22.1; y: 55.6; scale-x: 0.581; scale-y: 0.516; }
        frame 87 { x: 22; y: 55.8; scale-x: 0.585; scale-y: 0.51; }
        frame 88 { x: 21.9; y: 56; scale-x: 0.588; scale-y: 0.504; }
        frame 89 { x: 21.8; y: 56.1; scale-x: 0.592; scale-y: 0.499; }
        frame 90 { x: 21.7; y: 56.4; scale-x: 0.596; scale-y: 0.493; }
        frame 91 { x: -10000; y: 56.5; scale-x: 0.6; scale-y: 0.487; }
        frame 92 { y: 56.4; scale-x: 0.596; scale-y: 0.493; }
        frame 93 { x: 21.9; y: 56.1; scale-x: 0.592; scale-y: 0.499; }
        frame 94 { x: 22; y: 56; scale-x: 0.588; scale-y: 0.504; }
        frame 95 { x: 22.1; y: 55.9; scale-x: 0.585; scale-y: 0.51; }
        frame 96 { x: 22.2; y: 55.6; scale-x: 0.581; scale-y: 0.516; }
        frame 97 { x: -10000; y: 55.5; scale-x: 0.577; scale-y: 0.521; }
        frame 98 { x: 22.3; y: 55.3; scale-x: 0.574; scale-y: 0.527; }
        frame 99 { x: 22.4; y: 55.1; scale-x: 0.57; scale-y: 0.533; }
        frame 100 { x: 22.5; y: 54.9; scale-x: 0.566; scale-y: 0.538; }
        frame 101 { x: 22.6; y: 54.8; scale-x: 0.563; scale-y: 0.544; }
        frame 102 { x: 22.7; y: 54.6; scale-x: 0.559; scale-y: 0.55; }
        frame 103 { x: 22.8; y: 54.4; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "frontleaf_right_tip";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 56.3; y: 56; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_RIGHTTIP; }
        frame 5 { x: 56.1; y: -10000; skew-x: -1.4; skew-y: -1.4; scale-x: 0.584; scale-y: 0.554; cel: -10000; image: none; }
        frame 6 { x: -10000; skew-x: -2.9; skew-y: -2.9; scale-x: 0.613; scale-y: 0.552; }
        frame 7 { x: 56; y: 56.1; skew-x: -4.4; skew-y: -4.4; scale-x: 0.642; scale-y: 0.55; }
        frame 8 { x: 55.9; y: 56.3; skew-x: -5.9; skew-y: -5.9; scale-x: 0.671; scale-y: 0.548; }
        frame 9 { x: 55.8; y: 56.4; skew-x: -7.5; skew-y: -7.5; scale-x: 0.7; scale-y: 0.547; }
        frame 10 { x: 55.5; y: 56.5; skew-x: -9.2; skew-y: -9.2; scale-x: 0.729; scale-y: 0.545; }
        frame 11 { x: 56; y: -10000; skew-x: -7.5; skew-y: -7.5; scale-x: 0.707; scale-y: 0.543; }
        frame 12 { x: 56.4; y: 56.6; skew-x: -5.9; skew-y: -5.9; scale-x: 0.686; scale-y: 0.542; }
        frame 13 { x: 56.8; y: 56.8; skew-x: -4.4; skew-y: -4.4; scale-x: 0.664; scale-y: 0.54; }
        frame 14 { x: 57; y: 56.9; skew-x: -2.9; skew-y: -2.9; scale-x: 0.643; scale-y: 0.539; }
        frame 15 { x: 57.4; y: 57; skew-x: -1.4; skew-y: -1.4; scale-x: 0.621; scale-y: 0.537; }
        frame 16 { x: 57.9; y: 57.1; skew-x: 0; skew-y: 0; scale-x: 0.6; scale-y: 0.535; }
        frame 17 { x: 57.5; y: 57; skew-x: -1.4; skew-y: -1.4; scale-x: 0.621; scale-y: 0.537; }
        frame 18 { x: 57.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.643; scale-y: 0.539; }
        frame 19 { x: 56.8; y: 56.8; skew-x: -4.4; skew-y: -4.4; scale-x: 0.664; scale-y: 0.54; }
        frame 20 { x: 56.4; y: -10000; skew-x: -5.9; skew-y: -5.9; scale-x: 0.686; scale-y: 0.542; }
        frame 21 { x: 56; y: 56.7; skew-x: -7.5; skew-y: -7.5; scale-x: 0.707; scale-y: 0.543; }
        frame 22 { x: 55.5; y: 56.6; skew-x: -9.2; skew-y: -9.2; scale-x: 0.729; scale-y: 0.545; }
        frame 23 { x: 55.6; y: 56.5; skew-x: -7.5; skew-y: -7.5; scale-x: 0.7; scale-y: 0.547; }
        frame 24 { x: 55.7; y: 56.4; skew-x: -5.9; skew-y: -5.9; scale-x: 0.671; scale-y: 0.548; }
        frame 25 { x: 55.9; y: 56.3; skew-x: -4.4; skew-y: -4.4; scale-x: 0.642; scale-y: 0.55; }
        frame 26 { x: 56; y: 56.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.613; scale-y: 0.552; }
        frame 27 { x: 56.1; y: 56; skew-x: -1.4; skew-y: -1.4; scale-x: 0.584; scale-y: 0.554; }
        frame 28 { x: 56.3; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
        frame 29 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 30 { cel: -10000; }
        frame 79 { cel: 0; }
        frame 80 { x: 56.1; skew-x: -1.4; skew-y: -1.4; scale-x: 0.584; scale-y: 0.554; cel: -10000; }
        frame 81 { x: -10000; skew-x: -2.9; skew-y: -2.9; scale-x: 0.613; scale-y: 0.552; }
        frame 82 { x: 56; y: 56.1; skew-x: -4.4; skew-y: -4.4; scale-x: 0.642; scale-y: 0.55; }
        frame 83 { x: 55.9; y: 56.3; skew-x: -5.9; skew-y: -5.9; scale-x: 0.671; scale-y: 0.548; }
        frame 84 { x: 55.8; y: 56.4; skew-x: -7.5; skew-y: -7.5; scale-x: 0.7; scale-y: 0.547; }
        frame 85 { x: 55.5; y: 56.5; skew-x: -9.2; skew-y: -9.2; scale-x: 0.729; scale-y: 0.545; }
        frame 86 { x: 56; y: -10000; skew-x: -7.5; skew-y: -7.5; scale-x: 0.707; scale-y: 0.543; }
        frame 87 { x: 56.4; y: 56.6; skew-x: -5.9; skew-y: -5.9; scale-x: 0.686; scale-y: 0.542; }
        frame 88 { x: 56.8; y: 56.8; skew-x: -4.4; skew-y: -4.4; scale-x: 0.664; scale-y: 0.54; }
        frame 89 { x: 57; y: 56.9; skew-x: -2.9; skew-y: -2.9; scale-x: 0.643; scale-y: 0.539; }
        frame 90 { x: 57.4; y: 57; skew-x: -1.4; skew-y: -1.4; scale-x: 0.621; scale-y: 0.537; }
        frame 91 { x: 57.9; y: 57.1; skew-x: 0; skew-y: 0; scale-x: 0.6; scale-y: 0.535; }
        frame 92 { x: 57.5; y: 57; skew-x: -1.4; skew-y: -1.4; scale-x: 0.621; scale-y: 0.537; }
        frame 93 { x: 57.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.643; scale-y: 0.539; }
        frame 94 { x: 56.8; y: 56.8; skew-x: -4.4; skew-y: -4.4; scale-x: 0.664; scale-y: 0.54; }
        frame 95 { x: 56.4; y: -10000; skew-x: -5.9; skew-y: -5.9; scale-x: 0.686; scale-y: 0.542; }
        frame 96 { x: 56; y: 56.7; skew-x: -7.5; skew-y: -7.5; scale-x: 0.707; scale-y: 0.543; }
        frame 97 { x: 55.5; y: 56.6; skew-x: -9.2; skew-y: -9.2; scale-x: 0.729; scale-y: 0.545; }
        frame 98 { x: 55.6; y: 56.5; skew-x: -7.5; skew-y: -7.5; scale-x: 0.7; scale-y: 0.547; }
        frame 99 { x: 55.7; y: 56.4; skew-x: -5.9; skew-y: -5.9; scale-x: 0.671; scale-y: 0.548; }
        frame 100 { x: 55.9; y: 56.3; skew-x: -4.4; skew-y: -4.4; scale-x: 0.642; scale-y: 0.55; }
        frame 101 { x: 56; y: 56.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.613; scale-y: 0.552; }
        frame 102 { x: 56.1; y: 56; skew-x: -1.4; skew-y: -1.4; scale-x: 0.584; scale-y: 0.554; }
        frame 103 { x: 56.3; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "frontleaf_tip_left";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 19.4; y: 61.6; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_LEFTTIP; }
        frame 5 { x: 19.5; y: 61.4; skew-x: 1.3; skew-y: 1.3; scale-x: 0.567; scale-y: 0.554; cel: -10000; image: none; }
        frame 6 { x: -10000; y: 61.3; skew-x: 2.8; skew-y: 2.8; scale-x: 0.58; scale-y: 0.552; }
        frame 7 { y: 61.1; skew-x: 4; skew-y: 4; scale-x: 0.592; scale-y: 0.55; }
        frame 8 { x: 19.6; y: 60.9; skew-x: 5.5; skew-y: 5.5; scale-x: 0.604; scale-y: 0.548; }
        frame 9 { x: 19.7; y: 60.8; skew-x: 6.8; skew-y: 6.8; scale-x: 0.616; scale-y: 0.546; }
        frame 10 { x: 19.6; y: 60.4; skew-x: 8.3; skew-y: 8.3; scale-x: 0.628; scale-y: 0.545; }
        frame 11 { x: 19.4; y: 60.8; skew-x: 5.8; skew-y: 5.8; scale-x: 0.62; scale-y: 0.551; }
        frame 12 { x: 19.1; y: 61.1; skew-x: 3.5; skew-y: 3.5; scale-x: 0.612; scale-y: 0.557; }
        frame 13 { x: 18.9; y: 61.4; skew-x: 1.3; skew-y: 1; scale-x: 0.604; scale-y: 0.563; }
        frame 14 { x: 18.6; y: 61.8; skew-x: -0.9; skew-y: -1.2; scale-x: 0.596; scale-y: 0.569; }
        frame 15 { x: 18.4; y: 62.1; skew-x: -3.2; skew-y: -3.4; scale-x: 0.588; scale-y: 0.575; }
        frame 16 { x: 18.2; y: 62.5; skew-x: -5.7; skew-y: -5.9; scale-x: 0.58; scale-y: 0.582; }
        frame 17 { x: 18.5; y: 62.1; skew-x: -3.2; skew-y: -3.4; scale-x: 0.588; scale-y: 0.575; }
        frame 18 { x: 18.7; y: 61.8; skew-x: -0.9; skew-y: -1.2; scale-x: 0.596; scale-y: 0.569; }
        frame 19 { x: 18.9; y: 61.5; skew-x: 1.3; skew-y: 1; scale-x: 0.604; scale-y: 0.563; }
        frame 20 { x: 19.2; y: 61.2; skew-x: 3.5; skew-y: 3.5; scale-x: 0.612; scale-y: 0.557; }
        frame 21 { x: 19.5; y: 60.9; skew-x: 5.8; skew-y: 5.8; scale-x: 0.62; scale-y: 0.551; }
        frame 22 { x: 19.6; y: 60.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.628; scale-y: 0.545; }
        frame 23 { x: 19.5; y: 60.9; skew-x: 6.8; skew-y: 6.8; scale-x: 0.616; scale-y: 0.546; }
        frame 24 { x: -10000; y: -10000; skew-x: 5.5; skew-y: 5.5; scale-x: 0.604; scale-y: 0.548; }
        frame 25 { y: 61.1; skew-x: 4; skew-y: 4; scale-x: 0.592; scale-y: 0.55; }
        frame 26 { x: 19.4; y: 61.2; skew-x: 2.8; skew-y: 2.8; scale-x: 0.58; scale-y: 0.552; }
        frame 27 { x: 19.3; y: 61.4; skew-x: 1.3; skew-y: 1.3; scale-x: 0.567; scale-y: 0.554; }
        frame 28 { x: 19.4; y: 61.6; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
        frame 29 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 30 { cel: -10000; }
        frame 79 { cel: 0; }
        frame 80 { x: 19.5; y: 61.4; skew-x: 1.3; skew-y: 1.3; scale-x: 0.567; scale-y: 0.554; cel: -10000; }
        frame 81 { x: -10000; y: 61.3; skew-x: 2.8; skew-y: 2.8; scale-x: 0.58; scale-y: 0.552; }
        frame 82 { y: 61.1; skew-x: 4; skew-y: 4; scale-x: 0.592; scale-y: 0.55; }
        frame 83 { x: 19.6; y: 60.9; skew-x: 5.5; skew-y: 5.5; scale-x: 0.604; scale-y: 0.548; }
        frame 84 { x: 19.7; y: 60.8; skew-x: 6.8; skew-y: 6.8; scale-x: 0.616; scale-y: 0.546; }
        frame 85 { x: 19.6; y: 60.4; skew-x: 8.3; skew-y: 8.3; scale-x: 0.628; scale-y: 0.545; }
        frame 86 { x: 19.4; y: 60.8; skew-x: 5.8; skew-y: 5.8; scale-x: 0.62; scale-y: 0.551; }
        frame 87 { x: 19.1; y: 61.1; skew-x: 3.5; skew-y: 3.5; scale-x: 0.612; scale-y: 0.557; }
        frame 88 { x: 18.9; y: 61.4; skew-x: 1.3; skew-y: 1; scale-x: 0.604; scale-y: 0.563; }
        frame 89 { x: 18.6; y: 61.8; skew-x: -0.9; skew-y: -1.2; scale-x: 0.596; scale-y: 0.569; }
        frame 90 { x: 18.4; y: 62.1; skew-x: -3.2; skew-y: -3.4; scale-x: 0.588; scale-y: 0.575; }
        frame 91 { x: 18.2; y: 62.5; skew-x: -5.7; skew-y: -5.9; scale-x: 0.58; scale-y: 0.582; }
        frame 92 { x: 18.5; y: 62.1; skew-x: -3.2; skew-y: -3.4; scale-x: 0.588; scale-y: 0.575; }
        frame 93 { x: 18.7; y: 61.8; skew-x: -0.9; skew-y: -1.2; scale-x: 0.596; scale-y: 0.569; }
        frame 94 { x: 18.9; y: 61.5; skew-x: 1.3; skew-y: 1; scale-x: 0.604; scale-y: 0.563; }
        frame 95 { x: 19.2; y: 61.2; skew-x: 3.5; skew-y: 3.5; scale-x: 0.612; scale-y: 0.557; }
        frame 96 { x: 19.5; y: 60.9; skew-x: 5.8; skew-y: 5.8; scale-x: 0.62; scale-y: 0.551; }
        frame 97 { x: 19.6; y: 60.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.628; scale-y: 0.545; }
        frame 98 { x: 19.5; y: 60.9; skew-x: 6.8; skew-y: 6.8; scale-x: 0.616; scale-y: 0.546; }
        frame 99 { x: -10000; y: -10000; skew-x: 5.5; skew-y: 5.5; scale-x: 0.604; scale-y: 0.548; }
        frame 100 { y: 61.1; skew-x: 4; skew-y: 4; scale-x: 0.592; scale-y: 0.55; }
        frame 101 { x: 19.4; y: 61.2; skew-x: 2.8; skew-y: 2.8; scale-x: 0.58; scale-y: 0.552; }
        frame 102 { x: 19.3; y: 61.4; skew-x: 1.3; skew-y: 1.3; scale-x: 0.567; scale-y: 0.554; }
        frame 103 { x: 19.4; y: 61.6; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "anim_stem";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 37.6; y: 48.7; cel: 0; }
        frame 5 { x: 38; y: 47; cel: -10000; }
        frame 6 { x: 38.3; y: 45.5; }
        frame 7 { x: 38.6; y: 43.8; }
        frame 8 { x: 39.1; y: 43.5; }
        frame 9 { x: 39.6; y: 43.1; }
        frame 10 { x: 40; y: 42.8; }
        frame 11 { x: 41.1; y: 43.1; }
        frame 12 { x: 42.1; y: 43.5; }
        frame 13 { x: 43.2; y: 43.8; }
        frame 14 { x: 44.6; y: 44.6; }
        frame 15 { x: 46; y: 45.5; }
        frame 16 { x: 47.4; y: 46.3; }
        frame 17 { x: 46; y: 45.5; }
        frame 18 { x: 44.6; y: 44.6; }
        frame 19 { x: 43.2; y: 43.8; }
        frame 20 { x: 42.1; y: 43.5; }
        frame 21 { x: 41.1; y: 43.1; }
        frame 22 { x: 40; y: 42.8; }
        frame 23 { x: 39.6; y: 43.1; }
        frame 24 { x: 39.1; y: 43.5; }
        frame 25 { x: 38.6; y: 43.8; }
        frame 26 { x: 38.3; y: 45.5; }
        frame 27 { x: 38; y: 47; }
        frame 28 { x: 37.6; y: 48.7; }
        frame 29 { x: -10000; y: -10000; cel: -1; }
        frame 30 { cel: -10000; }
        frame 79 { cel: 0; }
        frame 80 { x: 38.5; y: 47; cel: -10000; }
        frame 81 { x: 39.3; y: 45.3; }
        frame 82 { x: 40.1; y: 43.5; }
        frame 83 { x: 41.1; y: 43; }
        frame 84 { x: 42.1; y: 42.6; }
        frame 85 { x: 43; y: 42.1; }
        frame 86 { x: 45.1; y: 41.8; }
        frame 87 { x: 47.1; y: 41.5; }
        frame 88 { x: 49.2; y: 41.1; }
        frame 89 { x: 52; y: 42.2; }
        frame 90 { x: 54.8; y: 43.4; }
        frame 91 { x: 57.6; y: 44.5; }
        frame 92 { x: 55; y: 43.3; }
        frame 93 { x: 52.4; y: 42; }
        frame 94 { x: 49.8; y: 40.8; }
        frame 95 { x: 47.6; y: 40; }
        frame 96 { x: 45.5; y: 39.3; }
        frame 97 { x: 43.4; y: 38.5; }
        frame 98 { x: 42.2; y: 39; }
        frame 99 { x: 41; y: 39.5; }
        frame 100 { x: 39.9; y: 39.9; }
        frame 101 { x: 39.2; y: 42.9; }
        frame 102 { x: 38.5; y: 45.8; }
        frame 103 { x: 37.9; y: 48.7; }
    }
    Track {
        source-name: "anim_sprout";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 29 { x: 7.7; y: 27.7; skew-x: -14.8; skew-y: -14.8; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_ANIM_SPROUT; }
        frame 30 { x: 8; y: 29.5; skew-x: -23.5; skew-y: -10000; scale-x: 0.809; scale-y: -10000; cel: -10000; image: none; }
        frame 31 { x: 7.8; y: 27.5; skew-x: -18.2; skew-y: -13.9; scale-x: 0.803; }
        frame 32 { x: -10000; y: 25.5; skew-x: -13.2; skew-y: -13.2; scale-x: 0.799; }
        frame 33 { y: 25; skew-x: -11.5; skew-y: -11.5; scale-x: -10000; }
        frame 34 { x: 7.7; y: 24.7; skew-x: -9.9; skew-y: -9.9; }
        frame 35 { x: 7.6; y: 24.3; skew-x: -8.4; skew-y: -8.4; }
        frame 36 { x: 7.9; y: 23.4; skew-x: -4.9; skew-y: -4.9; }
        frame 37 { x: 8.2; y: 22.4; skew-x: -1.7; skew-y: -1.7; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 8.5; y: 21.5; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 8.1; y: 22.9; skew-x: -1.7; skew-y: -1.7; }
        frame 40 { x: 7.8; y: 24.4; skew-x: -5.2; skew-y: -5.2; scale-x: 0.797; scale-y: 0.797; }
        frame 41 { x: 7.5; y: 25.9; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 6.8; y: 27.9; skew-x: -18.9; skew-y: -18.9; }
        frame 43 { x: 7; y: 26.6; skew-x: -14.9; skew-y: -14.7; scale-x: 0.796; scale-y: 0.796; }
        frame 44 { x: 7.3; y: 25.2; skew-x: -10.9; skew-y: -10.9; scale-x: 0.797; scale-y: 0.797; }
        frame 45 { x: 7.5; y: 25.3; skew-x: -12.7; skew-y: -12.7; scale-x: 0.778; scale-y: 0.796; }
        frame 46 { x: 7.7; y: 25.4; skew-x: -14.7; skew-y: -14.7; scale-x: 0.759; scale-y: -10000; }
        frame 47 { x: 8; y: -10000; skew-x: -16.6; skew-y: -16.6; scale-x: 0.741; }
        frame 48 { x: 7.9; y: 25.3; skew-x: -15.4; skew-y: -15.4; scale-x: 0.76; scale-y: 0.797; }
        frame 49 { x: 7.7; y: 25.4; skew-x: -14.2; skew-y: -14.2; scale-x: 0.779; scale-y: 0.798; }
        frame 50 { x: 7.8; y: 25.5; skew-x: -13.2; skew-y: -13.2; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 7.7; y: 26.2; skew-x: -13.7; skew-y: -13.7; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: -10000; y: 26.9; skew-x: -14.2; skew-y: -14.2; }
        frame 53 { y: 27.7; skew-x: -14.8; skew-y: -14.8; }
        frame 54 { x: 7.4; y: 26.7; skew-x: -10000; skew-y: -10000; }
        frame 55 { x: 8.4; y: 25.6; skew-x: -14.7; skew-y: -14.7; scale-x: 0.756; scale-y: 0.864; }
        frame 56 { x: 9.4; y: 24.6; skew-x: -10000; skew-y: -10000; scale-x: 0.714; scale-y: 0.929; }
        frame 57 { x: 10.4; y: 23.6; skew-x: -14.8; skew-y: -14.8; scale-x: 0.672; scale-y: 0.995; }
        frame 58 { x: 11.7; y: 22.7; skew-x: -13.9; skew-y: -14.7; scale-x: 0.632; scale-y: 1.031; }
        frame 59 { x: 12.9; y: 21.6; skew-x: -13.2; skew-y: -10000; scale-x: 0.593; scale-y: 1.068; }
        frame 60 { x: 14.2; y: 20.6; skew-x: -12.4; skew-y: -14.8; scale-x: 0.554; scale-y: 1.106; }
        frame 61 { x: 12.1; y: 22.8; skew-x: -13.2; skew-y: -14.7; scale-x: 0.635; scale-y: 1.003; }
        frame 62 { x: 9.9; y: 24.7; skew-x: -13.9; skew-y: -10000; scale-x: 0.717; scale-y: 0.901; }
        frame 63 { x: 7.4; y: 26.7; skew-x: -14.8; skew-y: -14.8; scale-x: 0.799; scale-y: 0.799; }
        frame 64 { x: 6.3; y: 27.9; skew-x: -14.7; skew-y: -14.7; scale-x: 0.847; scale-y: 0.75; }
        frame 65 { x: 5.3; y: 29.1; skew-x: -10000; skew-y: -10000; scale-x: 0.895; scale-y: 0.701; }
        frame 66 { x: 4.2; y: 30.3; skew-x: -14.8; skew-y: -14.8; scale-x: 0.944; scale-y: 0.652; }
        frame 67 { x: 5.3; y: 29.6; skew-x: -14.7; skew-y: -14.7; scale-x: 0.89; scale-y: -10000; }
        frame 68 { x: 6.4; y: 28.9; skew-x: -10000; skew-y: -10000; scale-x: 0.838; }
        frame 69 { x: 7.5; y: 28.2; skew-x: -14.8; skew-y: -14.8; scale-x: 0.786; }
        frame 70 { x: 7.7; y: 27.4; skew-x: -14.7; skew-y: -14.7; scale-x: 0.758; scale-y: 0.72; }
        frame 71 { x: 7.8; y: 26.6; skew-x: -10000; skew-y: -10000; scale-x: 0.731; scale-y: 0.789; }
        frame 72 { x: 8.1; y: 25.9; skew-x: -14.8; skew-y: -14.8; scale-x: 0.704; scale-y: 0.859; }
        frame 73 { x: 8; y: 26.3; skew-x: -14.7; skew-y: -14.7; scale-x: 0.717; scale-y: 0.824; }
        frame 74 { y: 26.7; skew-x: -10000; skew-y: -10000; scale-x: 0.731; scale-y: 0.789; }
        frame 75 { x: 7.8; y: 27; scale-x: 0.744; scale-y: 0.755; }
        frame 76 { x: -10000; y: 27.5; scale-x: 0.758; scale-y: 0.72; }
        frame 77 { x: 7.7; y: 27.8; scale-x: 0.772; scale-y: 0.686; }
        frame 78 { x: 7.5; y: 28.2; skew-x: -14.8; skew-y: -14.8; scale-x: 0.786; scale-y: 0.652; }
        frame 79 { x: 8; y: 27.7; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 80 { x: 8.3; y: 29.2; skew-x: -23.5; scale-x: 0.809; scale-y: -10000; }
        frame 81 { x: 8.8; y: 27.2; skew-x: -18.2; skew-y: -13.9; scale-x: 0.803; }
        frame 82 { x: 9.3; y: 25.2; skew-x: -13.2; skew-y: -13.2; scale-x: 0.799; }
        frame 83 { x: 9.8; y: 24.6; skew-x: -11.5; skew-y: -11.5; scale-x: -10000; }
        frame 84 { x: 10.2; y: 24.2; skew-x: -9.9; skew-y: -9.9; }
        frame 85 { x: 10.6; y: 23.7; skew-x: -8.4; skew-y: -8.4; }
        frame 86 { x: 11.9; y: 22.1; skew-x: -4.9; skew-y: -4.9; }
        frame 87 { x: 13.3; y: 20.4; skew-x: -1.7; skew-y: -1.7; scale-x: 0.798; scale-y: 0.798; }
        frame 88 { x: 14.5; y: 18.8; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 89 { x: 15.5; y: 20.5; skew-x: -1.7; skew-y: -1.7; }
        frame 90 { x: 16.7; y: 22.3; skew-x: -5.2; skew-y: -5.2; scale-x: 0.797; scale-y: 0.797; }
        frame 91 { x: 17.7; y: 24.1; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 14.9; y: 25.8; skew-x: -18.9; skew-y: -18.9; }
        frame 93 { x: 14.4; y: 24.1; skew-x: -14.9; skew-y: -14.7; scale-x: 0.796; scale-y: 0.796; }
        frame 94 { x: 13.9; y: 22.2; skew-x: -10.9; skew-y: -10.9; scale-x: 0.797; scale-y: 0.797; }
        frame 95 { x: 13; y: 21.9; skew-x: -12.7; skew-y: -12.7; scale-x: 0.778; scale-y: 0.796; }
        frame 96 { x: 12.1; y: 21.6; skew-x: -14.7; skew-y: -14.7; scale-x: 0.759; scale-y: -10000; }
        frame 97 { x: 11.3; y: 21.2; skew-x: -16.6; skew-y: -16.6; scale-x: 0.741; }
        frame 98 { x: 10.5; y: 21.3; skew-x: -15.4; skew-y: -15.4; scale-x: 0.76; scale-y: 0.797; }
        frame 99 { x: 9.7; y: 21.4; skew-x: -14.2; skew-y: -14.2; scale-x: 0.779; scale-y: 0.798; }
        frame 100 { x: 9; y: 21.6; skew-x: -13.2; skew-y: -13.2; scale-x: 0.799; scale-y: 0.799; }
        frame 101 { x: 8.6; y: 23.6; skew-x: -13.7; skew-y: -13.7; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 8.3; y: 25.7; skew-x: -14.2; skew-y: -14.2; }
        frame 103 { x: 8; y: 27.7; skew-x: -14.8; skew-y: -14.8; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 29 { x: 19.2; y: 17.8; scale-x: 0.555; scale-y: 0.5; cel: 0; image: IMAGE_REANIM_PEASHOOTER_HEAD; }
        frame 30 { x: 19.3; y: 16.3; scale-x: -10000; scale-y: 0.522; cel: -10000; image: none; }
        frame 31 { x: -10000; y: 14.7; scale-y: 0.545; }
        frame 32 { x: 19.4; y: 13.1; scale-y: 0.567; }
        frame 33 { x: 19.3; y: 12.9; scale-y: 0.57; }
        frame 34 { x: -10000; y: 12.7; scale-y: 0.572; }
        frame 35 { x: 19.2; y: 12.5; scale-y: 0.575; }
        frame 36 { x: 19.3; y: 12.9; scale-y: 0.568; }
        frame 37 { x: 19.4; y: 13.3; scale-y: 0.562; }
        frame 38 { x: -10000; y: 13.8; scale-y: 0.555; }
        frame 39 { y: 15; scale-y: 0.537; }
        frame 40 { x: 19.3; y: 16.1; scale-y: 0.518; }
        frame 41 { x: -10000; y: 17.2; scale-y: 0.5; }
        frame 42 { x: 19.2; y: 16.1; scale-y: 0.518; }
        frame 43 { x: -10000; y: 15; scale-y: 0.537; }
        frame 44 { x: 19.1; y: 13.9; scale-y: 0.555; }
        frame 45 { x: 19.2; y: 13.3; scale-y: 0.565; }
        frame 46 { x: -10000; y: 12.7; scale-y: 0.575; }
        frame 47 { x: 19.3; y: 12; scale-y: 0.585; }
        frame 48 { x: -10000; y: 12.3; scale-y: 0.579; }
        frame 49 { y: 12.6; scale-y: 0.573; }
        frame 50 { x: 19.4; y: 13; scale-y: 0.567; }
        frame 51 { x: 19.3; y: 14.6; scale-y: 0.545; }
        frame 52 { x: -10000; y: 16.3; scale-y: 0.522; }
        frame 53 { x: 19.2; y: 17.8; scale-y: 0.5; }
        frame 54 { x: 19.1; y: 14; scale-y: 0.555; }
        frame 55 { x: 19.7; y: 13.1; scale-x: 0.543; scale-y: 0.568; }
        frame 56 { x: 20.2; y: 12.3; scale-x: 0.531; scale-y: 0.581; }
        frame 57 { x: 20.8; y: 11.5; scale-x: 0.519; scale-y: 0.594; }
        frame 58 { x: 21.5; y: 10; scale-x: 0.496; scale-y: 0.618; }
        frame 59 { x: 22.4; y: 8.6; scale-x: 0.474; scale-y: 0.642; }
        frame 60 { x: 23.2; y: 7; scale-x: 0.451; scale-y: 0.666; }
        frame 61 { x: 22; y: 9.2; scale-x: 0.486; scale-y: 0.629; }
        frame 62 { x: 20.7; y: 11.4; scale-x: 0.521; scale-y: 0.592; }
        frame 63 { x: 19.5; y: 13.8; scale-x: 0.555; scale-y: 0.555; }
        frame 64 { x: 19; y: 15.8; scale-x: 0.572; scale-y: 0.521; }
        frame 65 { x: 18.4; y: 17.7; scale-x: 0.589; scale-y: 0.487; }
        frame 66 { x: 17.9; y: 19.5; scale-x: 0.605; scale-y: 0.452; }
        frame 67 { x: 18.4; y: 17.6; scale-x: 0.589; scale-y: 0.487; }
        frame 68 { x: 18.9; y: 15.6; scale-x: 0.572; scale-y: 0.521; }
        frame 69 { x: 19.3; y: 13.7; scale-x: 0.555; scale-y: 0.555; }
        frame 70 { x: -10000; y: 13.2; scale-x: -10000; scale-y: 0.565; }
        frame 71 { y: 12.7; scale-y: 0.575; }
        frame 72 { y: 12; scale-y: 0.585; }
        frame 73 { x: 19.2; y: 12.4; scale-y: 0.579; }
        frame 74 { x: -10000; y: 12.7; scale-y: 0.573; }
        frame 75 { y: 13.2; scale-y: 0.567; }
        frame 76 { y: 13.4; scale-y: 0.563; }
        frame 77 { x: 19.1; y: 13.7; scale-y: 0.559; }
        frame 78 { x: -10000; y: 14; scale-y: 0.555; }
        frame 79 { x: 19.5; y: 17.8; scale-y: 0.5; }
        frame 80 { x: 20; y: 16.2; scale-y: 0.522; }
        frame 81 { x: 20.4; y: 14.5; scale-y: 0.545; }
        frame 82 { x: 20.9; y: 12.8; scale-y: 0.567; }
        frame 83 { x: 21.3; y: 12.5; scale-y: 0.57; }
        frame 84 { x: 21.8; y: 12.3; scale-y: 0.572; }
        frame 85 { x: 22.2; y: 11.9; scale-y: 0.575; }
        frame 86 { x: 23.3; y: 11.6; scale-y: 0.568; }
        frame 87 { x: 24.4; y: 11.3; scale-y: 0.562; }
        frame 88 { x: 25.4; y: 11.1; scale-y: 0.555; }
        frame 89 { x: 26.8; y: 12.6; scale-y: 0.537; }
        frame 90 { x: 28.1; y: 14; scale-y: 0.518; }
        frame 91 { x: 29.5; y: 15.4; scale-y: 0.5; }
        frame 92 { x: 28.2; y: 13.9; scale-y: 0.518; }
        frame 93 { x: 27; y: 12.4; scale-y: 0.537; }
        frame 94 { x: 25.7; y: 10.9; scale-y: 0.555; }
        frame 95 { x: 24.7; y: 9.9; scale-y: 0.565; }
        frame 96 { x: 23.6; y: 8.9; scale-y: 0.575; }
        frame 97 { x: 22.6; y: 7.8; scale-y: 0.585; }
        frame 98 { x: 21.9; y: 8.2; scale-y: 0.579; }
        frame 99 { x: 21.2; y: 8.6; scale-y: 0.573; }
        frame 100 { x: 20.6; y: 9.1; scale-y: 0.567; }
        frame 101 { x: 20.2; y: 12; scale-y: 0.545; }
        frame 102 { x: 19.8; y: 15; scale-y: 0.522; }
        frame 103 { x: 19.5; y: 17.8; scale-y: 0.5; }
    }
    Track {
        source-name: "idle_mouth";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 29 { x: 52.4; y: 17.8; scale-x: 0.555; scale-y: 0.5; cel: 0; image: IMAGE_REANIM_PEASHOOTER_MOUTH; }
        frame 30 { x: 53; y: 16.3; skew-x: 9.9; scale-x: 0.564; scale-y: 0.517; cel: -10000; image: none; }
        frame 31 { x: 52.8; y: 14.7; skew-x: 4.8; scale-x: 0.559; scale-y: 0.542; }
        frame 32 { x: 52.6; y: 13.1; skew-x: 0; scale-x: 0.555; scale-y: 0.567; }
        frame 33 { x: -10000; y: 12.8; skew-x: -10000; scale-x: -10000; scale-y: 0.573; }
        frame 34 { x: 52.5; y: 12.5; scale-y: 0.579; }
        frame 35 { x: -10000; y: 12.2; scale-y: 0.585; }
        frame 36 { y: 12.8; skew-x: -1.7; scale-x: 0.556; scale-y: 0.575; }
        frame 37 { x: 52.6; y: 13.4; skew-x: -3.7; scale-x: 0.557; scale-y: 0.565; }
        frame 38 { x: 52.7; y: 13.9; skew-x: -5.7; scale-x: 0.558; scale-y: 0.555; }
        frame 39 { x: -10000; y: 15; skew-x: -3.7; scale-x: 0.554; scale-y: 0.537; }
        frame 40 { y: 16.1; skew-x: -1.7; scale-x: 0.551; scale-y: 0.518; }
        frame 41 { x: 52.6; y: 17.2; skew-x: 0; scale-x: 0.547; scale-y: 0.5; }
        frame 42 { x: -10000; y: 15.8; skew-x: 9.1; scale-x: 0.557; scale-y: 0.518; }
        frame 43 { x: 52.5; y: 14.8; skew-x: 4.5; scale-x: 0.556; scale-y: 0.537; }
        frame 44 { x: 52.4; y: 13.9; skew-x: 0; scale-x: 0.555; scale-y: 0.555; }
        frame 45 { x: 52.5; y: 13.2; skew-x: -10000; scale-x: -10000; scale-y: 0.565; }
        frame 46 { x: -10000; y: 12.6; scale-y: 0.575; }
        frame 47 { y: 12; scale-y: 0.585; }
        frame 48 { x: 52.6; y: 12.3; scale-y: 0.579; }
        frame 49 { x: -10000; y: 12.6; scale-y: 0.573; }
        frame 50 { y: 12.9; scale-y: 0.567; }
        frame 51 { x: 52.5; y: 14.6; scale-y: 0.545; }
        frame 52 { x: -10000; y: 16.2; scale-y: 0.522; }
        frame 53 { x: 52.4; y: 17.8; scale-y: 0.5; }
        frame 54 { x: -10000; y: 13.9; scale-y: 0.555; }
        frame 55 { x: 52.2; y: 13.1; scale-x: 0.548; scale-y: 0.57; }
        frame 56 { x: 52.1; y: 12.3; scale-x: 0.541; scale-y: 0.585; }
        frame 57 { x: 51.9; y: 11.4; scale-x: 0.534; scale-y: 0.599; }
        frame 58 { x: 51; y: 10.1; scale-x: 0.493; scale-y: 0.63; }
        frame 59 { x: 50.1; y: 8.7; scale-x: 0.452; scale-y: 0.661; }
        frame 60 { x: 49.1; y: 7.2; scale-x: 0.412; scale-y: 0.692; }
        frame 61 { x: 50.4; y: 9.3; scale-x: 0.461; scale-y: 0.646; }
        frame 62 { x: 51.5; y: 11.5; scale-x: 0.509; scale-y: 0.601; }
        frame 63 { x: 52.7; y: 13.7; scale-x: 0.558; scale-y: 0.555; }
        frame 64 { x: 53.8; y: 15.7; scale-x: 0.565; scale-y: 0.517; }
        frame 65 { x: 54.8; y: 17.7; scale-x: 0.572; scale-y: 0.478; }
        frame 66 { x: 55.9; y: 19.7; scale-x: 0.58; scale-y: 0.44; }
        frame 67 { x: 54.7; y: 17.6; scale-x: 0.572; scale-y: 0.478; }
        frame 68 { x: 53.7; y: 15.7; scale-x: 0.564; scale-y: 0.517; }
        frame 69 { x: 52.6; y: 13.7; scale-x: 0.555; scale-y: 0.555; }
        frame 70 { x: -10000; y: 13.1; scale-x: -10000; scale-y: 0.565; }
        frame 71 { x: 52.5; y: 12.6; scale-y: 0.575; }
        frame 72 { x: -10000; y: 12; scale-y: 0.585; }
        frame 73 { y: 12.4; scale-y: 0.579; }
        frame 74 { y: 12.7; scale-y: 0.573; }
        frame 75 { y: 13.1; scale-y: 0.567; }
        frame 76 { y: 13.4; scale-y: 0.563; }
        frame 77 { x: 52.4; y: 13.6; scale-y: 0.559; }
        frame 78 { x: -10000; y: 13.9; scale-y: 0.555; }
        frame 79 { x: 52.7; y: 17.8; scale-y: 0.5; }
        frame 80 { x: 53.3; y: 16; skew-x: 9.9; scale-x: 0.564; scale-y: 0.517; }
        frame 81 { x: 53.7; y: 14.4; skew-x: 4.8; scale-x: 0.559; scale-y: 0.542; }
        frame 82 { x: 54.1; y: 12.8; skew-x: 0; scale-x: 0.555; scale-y: 0.567; }
        frame 83 { x: 54.6; y: 12.4; skew-x: -10000; scale-x: -10000; scale-y: 0.573; }
        frame 84 { x: 55; y: 12; scale-y: 0.579; }
        frame 85 { x: 55.5; y: 11.6; scale-y: 0.585; }
        frame 86 { x: 56.5; y: 11.4; skew-x: -1.7; scale-x: 0.556; scale-y: 0.575; }
        frame 87 { x: 57.6; y: 11.3; skew-x: -3.7; scale-x: 0.557; scale-y: 0.565; }
        frame 88 { x: 58.7; y: 11.2; skew-x: -5.7; scale-x: 0.558; scale-y: 0.555; }
        frame 89 { x: 60; y: 12.5; skew-x: -3.7; scale-x: 0.554; scale-y: 0.537; }
        frame 90 { x: 61.5; y: 14; skew-x: -1.7; scale-x: 0.551; scale-y: 0.518; }
        frame 91 { x: 62.9; y: 15.4; skew-x: 0; scale-x: 0.547; scale-y: 0.5; }
        frame 92 { x: 60.7; y: 13.7; skew-x: 9.1; scale-x: 0.557; scale-y: 0.518; }
        frame 93 { x: 59.9; y: 12.3; skew-x: 4.5; scale-x: 0.556; scale-y: 0.537; }
        frame 94 { x: 59; y: 10.9; skew-x: 0; scale-x: 0.555; scale-y: 0.555; }
        frame 95 { x: 58; y: 9.8; skew-x: -10000; scale-x: -10000; scale-y: 0.565; }
        frame 96 { x: 56.9; y: 8.8; scale-y: 0.575; }
        frame 97 { x: 55.9; y: 7.8; scale-y: 0.585; }
        frame 98 { x: 55.2; y: 8.1; scale-y: 0.579; }
        frame 99 { x: 54.5; y: 8.6; scale-y: 0.573; }
        frame 100 { x: 53.9; y: 9; scale-y: 0.567; }
        frame 101 { x: 53.5; y: 12; scale-y: 0.545; }
        frame 102 { x: 53.1; y: 14.9; scale-y: 0.522; }
        frame 103 { x: 52.7; y: 17.8; scale-y: 0.5; }
    }
    Track {
        source-name: "idle_shoot_blink";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 64 { x: 38.4; y: 21.6; scale-x: 0.555; scale-y: 0.519; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BLINK1; }
        frame 65 { x: 38.6; y: 23; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 66 { x: 38.9; y: 24.4; scale-y: 0.481; image: IMAGE_REANIM_PEASHOOTER_BLINK2; }
        frame 67 { x: 38.3; y: 22.8; scale-y: -10000; image: none; }
        frame 68 { x: 37.7; y: 21.6; image: IMAGE_REANIM_PEASHOOTER_BLINK1; }
        frame 69 { x: -10000; y: 19.9; scale-y: 0.521; image: none; }
        frame 70 { y: -10000; scale-y: -10000; cel: -1; }
        frame 71 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 104;
        frame 0 { cel: -1; }
        frame 1 { x: 37.5; y: 23.5; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BLINK1; }
        frame 2 { x: -10000; y: 23.4; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_PEASHOOTER_BLINK2; }
        frame 3 { y: 23.5; image: IMAGE_REANIM_PEASHOOTER_BLINK1; }
        frame 4 { y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
}
