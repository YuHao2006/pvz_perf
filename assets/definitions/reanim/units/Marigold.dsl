export component Marigold {
    fps: 33;
    Track {
        source-name: "anim_idle";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 30;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "backleaf";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 27.7; y: 53; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF; }
        frame 6 { x: -10000; y: 53.3; scale-x: 0.561; scale-y: 0.543; cel: -10000; image: none; }
        frame 7 { y: 53.5; scale-x: 0.566; scale-y: 0.53; }
        frame 8 { x: 27.6; y: 53.9; scale-x: 0.572; scale-y: 0.518; }
        frame 9 { x: -10000; y: 54.1; scale-x: 0.577; scale-y: 0.505; }
        frame 10 { y: 54.5; scale-x: 0.583; scale-y: 0.492; }
        frame 11 { y: 54.8; scale-x: 0.588; scale-y: 0.48; }
        frame 12 { y: 55; scale-x: 0.594; scale-y: 0.467; }
        frame 13 { x: 27.5; y: 55.3; scale-x: 0.599; scale-y: 0.454; }
        frame 14 { x: -10000; y: 55.6; scale-x: 0.605; scale-y: 0.442; }
        frame 15 { y: 55.9; scale-x: 0.61; scale-y: 0.429; }
        frame 16 { y: 55.6; scale-x: 0.607; scale-y: 0.438; }
        frame 17 { y: 55.5; scale-x: 0.603; scale-y: 0.447; }
        frame 18 { y: 55.3; scale-x: 0.599; scale-y: 0.456; }
        frame 19 { x: 27.6; y: 55; scale-x: 0.595; scale-y: 0.465; }
        frame 20 { x: -10000; y: 54.9; scale-x: 0.591; scale-y: 0.474; }
        frame 21 { y: 54.6; scale-x: 0.587; scale-y: 0.483; }
        frame 22 { y: 54.4; scale-x: 0.583; scale-y: 0.492; }
        frame 23 { y: 54.2; scale-x: 0.579; scale-y: 0.501; }
        frame 24 { y: 54; scale-x: 0.575; scale-y: 0.51; }
        frame 25 { x: 27.7; y: 53.7; scale-x: 0.571; scale-y: 0.519; }
        frame 26 { x: -10000; y: 53.6; scale-x: 0.567; scale-y: 0.528; }
        frame 27 { y: 53.4; scale-x: 0.563; scale-y: 0.537; }
        frame 28 { y: 53.1; scale-x: 0.559; scale-y: 0.546; }
        frame 29 { y: 53; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "backleaf_left_tip";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 25; y: 53.9; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF_LEFTTIP; }
        frame 6 { x: -10000; y: 54; skew-x: 0.5; skew-y: 0.5; scale-x: 0.565; scale-y: 0.547; cel: -10000; image: none; }
        frame 7 { x: 24.9; y: 54.2; skew-x: 1; skew-y: 1; scale-x: 0.575; scale-y: 0.539; }
        frame 8 { x: -10000; y: 54.4; skew-x: 1.5; skew-y: 1.5; scale-x: 0.584; scale-y: 0.531; }
        frame 9 { y: 54.5; skew-x: 2; skew-y: 2; scale-x: 0.594; scale-y: 0.523; }
        frame 10 { x: 25; y: 54.7; skew-x: 2.7; skew-y: 2.7; scale-x: 0.604; scale-y: 0.515; }
        frame 11 { x: 24.7; y: 55.3; skew-x: 0.3; skew-y: 0.3; scale-x: 0.616; scale-y: -10000; }
        frame 12 { x: 24.5; y: 55.8; skew-x: -1.7; skew-y: -1.7; scale-x: 0.628; }
        frame 13 { x: 24.3; y: 56.4; skew-x: -3.9; skew-y: -3.9; scale-x: 0.64; }
        frame 14 { x: 24; y: 57; skew-x: -6.2; skew-y: -6.2; scale-x: 0.652; }
        frame 15 { x: 23.9; y: 57.5; skew-x: -8.5; skew-y: -8.5; scale-x: 0.665; }
        frame 16 { x: 24.1; y: 57; skew-x: -6.7; skew-y: -6.7; scale-x: 0.656; }
        frame 17 { x: 24.2; y: 56.8; skew-x: -5.2; skew-y: -5.2; scale-x: 0.647; }
        frame 18 { x: 24.3; y: 56.3; skew-x: -3.5; skew-y: -3.5; scale-x: 0.638; }
        frame 19 { x: 24.5; y: 55.9; skew-x: -1.9; skew-y: -1.9; scale-x: 0.63; }
        frame 20 { x: 24.7; y: 55.5; skew-x: -0.2; skew-y: -0.2; scale-x: 0.621; }
        frame 21 { x: 24.8; y: 55.1; skew-x: 1; skew-y: 1; scale-x: 0.613; }
        frame 22 { x: 25; y: 54.7; skew-x: 2.7; skew-y: 2.7; scale-x: 0.604; }
        frame 23 { y: 54.5; skew-x: 2.3; skew-y: 2.3; scale-x: 0.597; scale-y: 0.521; }
        frame 24 { x: 24.9; y: -10000; skew-x: 1.8; skew-y: 1.8; scale-x: 0.59; scale-y: 0.527; }
        frame 25 { x: 25.1; y: 54.4; skew-x: 1.5; skew-y: 1.5; scale-x: 0.583; scale-y: 0.532; }
        frame 26 { x: 25; y: 54.3; skew-x: 1; skew-y: 1; scale-x: 0.576; scale-y: 0.538; }
        frame 27 { y: 54.1; skew-x: 0.8; skew-y: 0.8; scale-x: 0.569; scale-y: 0.544; }
        frame 28 { y: 54; skew-x: 0.3; skew-y: 0.3; scale-x: 0.562; scale-y: 0.55; }
        frame 29 { x: -10000; y: 53.9; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "backleaf_right_tip";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 47; y: 52.9; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF_RIGHTTIP; }
        frame 6 { x: 47.2; y: 53.1; skew-x: 0.3; skew-y: 0.3; scale-x: 0.578; scale-y: 0.547; cel: -10000; image: none; }
        frame 7 { x: 47.3; y: 53.4; skew-x: 0.5; skew-y: 0.5; scale-x: 0.6; scale-y: 0.539; }
        frame 8 { x: 47.5; y: 53.6; skew-x: 0.8; skew-y: 0.8; scale-x: 0.623; scale-y: 0.531; }
        frame 9 { x: -10000; y: 54; skew-x: 1.1; skew-y: 1.1; scale-x: 0.645; scale-y: 0.523; }
        frame 10 { x: 47.7; y: 54.1; skew-x: 1.5; skew-y: 1.5; scale-x: 0.667; scale-y: 0.515; }
        frame 11 { x: 47.9; y: 54.4; skew-x: 2.8; skew-y: 2.8; scale-x: 0.66; scale-y: 0.508; }
        frame 12 { x: 48.1; y: 54.8; skew-x: 4.3; skew-y: 4.3; scale-x: 0.653; scale-y: 0.5; }
        frame 13 { x: 48.4; y: 55; skew-x: 5.8; skew-y: 5.8; scale-x: 0.646; scale-y: 0.492; }
        frame 14 { x: 48.6; y: 55.4; skew-x: 7.3; skew-y: 7.3; scale-x: 0.639; scale-y: 0.484; }
        frame 15 { x: 48.8; y: 55.7; skew-x: 8.8; skew-y: 8.8; scale-x: 0.633; scale-y: 0.477; }
        frame 16 { x: 48.5; y: 55.5; skew-x: 7.6; skew-y: 7.6; scale-x: 0.637; scale-y: 0.482; }
        frame 17 { x: 48.4; y: 55.3; skew-x: 6.5; skew-y: 6.5; scale-x: 0.642; scale-y: 0.488; }
        frame 18 { x: 48.3; y: 55; skew-x: 5.5; skew-y: 5.5; scale-x: 0.647; scale-y: 0.493; }
        frame 19 { x: 48; y: 54.8; skew-x: 4.3; skew-y: 4.3; scale-x: 0.652; scale-y: 0.499; }
        frame 20 { y: 54.6; skew-x: 3.3; skew-y: 3.3; scale-x: 0.657; scale-y: 0.504; }
        frame 21 { x: 47.8; y: 54.4; skew-x: 2.3; skew-y: 2.3; scale-x: 0.662; scale-y: 0.51; }
        frame 22 { x: 47.7; y: 54.1; skew-x: 1.2; skew-y: 1.2; scale-x: 0.667; scale-y: 0.515; }
        frame 23 { x: 47.5; y: 54; skew-x: 1; skew-y: 1; scale-x: 0.651; scale-y: 0.521; }
        frame 24 { x: -10000; y: 53.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.635; scale-y: 0.527; }
        frame 25 { y: 53.5; skew-x: 0.6; skew-y: 0.6; scale-x: 0.619; scale-y: 0.533; }
        frame 26 { x: 47.4; y: 53.4; skew-x: 0.5; skew-y: 0.5; scale-x: 0.603; scale-y: 0.538; }
        frame 27 { x: -10000; y: 53.2; skew-x: 0.3; skew-y: 0.3; scale-x: 0.587; scale-y: 0.544; }
        frame 28 { x: 47.3; y: 53; skew-x: 0; skew-y: 0; scale-x: 0.571; scale-y: 0.55; }
        frame 29 { x: 47.1; y: 52.9; skew-x: -10000; skew-y: -10000; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "stalk_bottom";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 36.1; y: 52.6; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_STALK_BOTTOM; }
        frame 6 { x: 36.5; y: 52.1; skew-x: 2; skew-y: 1.3; scale-x: 0.556; scale-y: 0.574; cel: -10000; image: none; }
        frame 7 { x: 36.6; y: 51.6; skew-x: 4.1; skew-y: 2.8; scale-x: 0.557; scale-y: 0.592; }
        frame 8 { x: 37; y: 51.1; skew-x: 6.3; skew-y: 4; scale-x: 0.558; scale-y: 0.61; }
        frame 9 { x: 37.4; y: 50.8; skew-x: 8.3; skew-y: 5.5; scale-x: 0.559; scale-y: 0.629; }
        frame 10 { x: 37.7; y: 50.3; skew-x: 10.5; skew-y: 6.8; scale-x: -10000; scale-y: 0.647; }
        frame 11 { x: 38; y: 49.8; skew-x: 12.7; skew-y: 8.3; scale-x: 0.56; scale-y: 0.665; }
        frame 12 { x: 38.8; y: 49.9; skew-x: 15.8; skew-y: 11.3; scale-x: -10000; scale-y: 0.646; }
        frame 13 { x: 39.5; y: 50.1; skew-x: 18.8; skew-y: 14.5; scale-y: 0.627; }
        frame 14 { x: 40.1; y: 50.3; skew-x: 22.1; skew-y: 17.6; scale-y: 0.609; }
        frame 15 { x: 40.8; y: 50.5; skew-x: 25.3; skew-y: 20.8; scale-x: 0.559; scale-y: 0.59; }
        frame 16 { x: 41.5; y: 50.6; skew-x: 28.3; skew-y: 23.8; scale-x: -10000; scale-y: 0.571; }
        frame 17 { x: 42.2; y: 50.9; skew-x: 31.6; skew-y: 27.1; scale-x: 0.56; scale-y: 0.553; }
        frame 18 { x: 41.5; y: 50.8; skew-x: 28.3; skew-y: 23.8; scale-x: 0.559; scale-y: 0.571; }
        frame 19 { x: 40.8; y: 50.5; skew-x: 25.3; skew-y: 20.8; scale-x: -10000; scale-y: 0.59; }
        frame 20 { x: 40.2; y: 50.4; skew-x: 22.1; skew-y: 17.6; scale-x: 0.56; scale-y: 0.609; }
        frame 21 { x: 39.5; y: 50.2; skew-x: 18.8; skew-y: 14.5; scale-x: -10000; scale-y: 0.627; }
        frame 22 { x: 38.7; y: 50; skew-x: 15.8; skew-y: 11.3; scale-y: 0.646; }
        frame 23 { x: 38; y: 49.8; skew-x: 12.7; skew-y: 8.3; scale-y: 0.665; }
        frame 24 { x: 37.6; y: 50.4; skew-x: 10.5; skew-y: 6.8; scale-x: 0.559; scale-y: 0.647; }
        frame 25 { x: 37.4; y: 50.8; skew-x: 8.3; skew-y: 5.5; scale-x: -10000; scale-y: 0.629; }
        frame 26 { x: 37; y: 51.2; skew-x: 6.3; skew-y: 4; scale-x: 0.558; scale-y: 0.61; }
        frame 27 { x: 36.6; y: 51.6; skew-x: 4.1; skew-y: 2.8; scale-x: 0.557; scale-y: 0.592; }
        frame 28 { x: 36.4; y: 52.1; skew-x: 2; skew-y: 1.3; scale-x: 0.556; scale-y: 0.574; }
        frame 29 { x: 36.1; y: 52.6; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "stalk_top";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 31; y: 45.3; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_STALK_TOP; }
        frame 6 { x: 31.4; y: 43; skew-x: 1.8; skew-y: 1; scale-x: 0.556; scale-y: 0.633; cel: -10000; image: none; }
        frame 7 { x: 32; y: 40.8; skew-x: 3.8; skew-y: 2.3; scale-x: 0.557; scale-y: 0.71; }
        frame 8 { x: 32.5; y: 38.5; skew-x: 5.7; skew-y: 3.5; scale-x: -10000; scale-y: 0.787; }
        frame 9 { x: 33.6; y: 37.7; skew-x: 7.3; skew-y: 4.5; scale-x: 0.56; scale-y: 0.81; }
        frame 10 { x: 34.9; y: 36.8; skew-x: 9.1; skew-y: 5.5; scale-x: 0.563; scale-y: 0.834; }
        frame 11 { x: 36.1; y: 35.8; skew-x: 11; skew-y: 6.5; scale-x: 0.566; scale-y: 0.858; }
        frame 12 { x: 36.8; y: 36.3; skew-x: 13.1; skew-y: 8.8; scale-x: 0.564; scale-y: 0.843; }
        frame 13 { x: 37.4; y: 36.6; skew-x: 15.5; skew-y: 11; scale-x: 0.562; scale-y: 0.829; }
        frame 14 { x: 38; y: 37.1; skew-x: 17.8; skew-y: 13.3; scale-x: 0.561; scale-y: 0.815; }
        frame 15 { x: 40.2; y: 37.5; skew-x: 24.1; skew-y: 19.6; scale-x: 0.559; scale-y: 0.786; }
        frame 16 { x: 42.5; y: 37.8; skew-x: 30.4; skew-y: 26; scale-x: 0.558; scale-y: 0.757; }
        frame 17 { x: 44.6; y: 38.4; skew-x: 36.8; skew-y: 32.4; scale-x: 0.557; scale-y: 0.73; }
        frame 18 { x: 42.4; y: 37.9; skew-x: 30.4; skew-y: 26; scale-x: 0.558; scale-y: 0.757; }
        frame 19 { x: 40.1; y: 37.5; skew-x: 24.1; skew-y: 19.6; scale-x: 0.559; scale-y: 0.786; }
        frame 20 { x: 38; y: 37.1; skew-x: 17.8; skew-y: 13.3; scale-x: 0.561; scale-y: 0.815; }
        frame 21 { x: 36.8; y: 36.9; skew-x: 15.5; skew-y: 11; scale-x: 0.562; scale-y: 0.829; }
        frame 22 { x: 35.5; y: 36.8; skew-x: 13.1; skew-y: 8.8; scale-x: 0.564; scale-y: 0.843; }
        frame 23 { x: 34.3; y: 36.6; skew-x: 11; skew-y: 6.5; scale-x: 0.566; scale-y: 0.858; }
        frame 24 { x: 33.7; y: 37.3; skew-x: 9.1; skew-y: 5.5; scale-x: 0.563; scale-y: 0.834; }
        frame 25 { x: 33.1; y: 37.9; skew-x: 7.3; skew-y: 4.5; scale-x: 0.56; scale-y: 0.81; }
        frame 26 { x: 32.5; y: 38.5; skew-x: 5.7; skew-y: 3.5; scale-x: 0.557; scale-y: 0.787; }
        frame 27 { x: 32; y: 40.9; skew-x: 3.8; skew-y: 2.3; scale-x: -10000; scale-y: 0.71; }
        frame 28 { x: 31.5; y: 43; skew-x: 1.8; skew-y: 1; scale-x: 0.556; scale-y: 0.633; }
        frame 29 { x: 31; y: 45.3; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "frontleaf";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 22.8; y: 54.4; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF; }
        frame 6 { x: 22.7; y: 54.5; scale-x: 0.559; scale-y: 0.55; cel: -10000; image: none; }
        frame 7 { x: 22.6; y: 54.8; scale-x: 0.563; scale-y: 0.544; }
        frame 8 { x: 22.5; y: 55; scale-x: 0.566; scale-y: 0.538; }
        frame 9 { x: 22.4; y: 55.1; scale-x: 0.57; scale-y: 0.533; }
        frame 10 { x: 22.3; y: 55.3; scale-x: 0.574; scale-y: 0.527; }
        frame 11 { x: 22.2; y: 55.4; scale-x: 0.577; scale-y: 0.521; }
        frame 12 { x: 22.1; y: 55.6; scale-x: 0.581; scale-y: 0.516; }
        frame 13 { x: 22; y: 55.8; scale-x: 0.585; scale-y: 0.51; }
        frame 14 { x: 21.9; y: 56; scale-x: 0.588; scale-y: 0.504; }
        frame 15 { x: 21.8; y: 56.1; scale-x: 0.592; scale-y: 0.499; }
        frame 16 { x: 21.7; y: 56.4; scale-x: 0.596; scale-y: 0.493; }
        frame 17 { x: -10000; y: 56.5; scale-x: 0.6; scale-y: 0.487; }
        frame 18 { y: 56.4; scale-x: 0.596; scale-y: 0.493; }
        frame 19 { x: 21.9; y: 56.1; scale-x: 0.592; scale-y: 0.499; }
        frame 20 { x: 22; y: 56; scale-x: 0.588; scale-y: 0.504; }
        frame 21 { x: 22.1; y: 55.9; scale-x: 0.585; scale-y: 0.51; }
        frame 22 { x: 22.2; y: 55.6; scale-x: 0.581; scale-y: 0.516; }
        frame 23 { x: -10000; y: 55.5; scale-x: 0.577; scale-y: 0.521; }
        frame 24 { x: 22.3; y: 55.3; scale-x: 0.574; scale-y: 0.527; }
        frame 25 { x: 22.4; y: 55.1; scale-x: 0.57; scale-y: 0.533; }
        frame 26 { x: 22.5; y: 54.9; scale-x: 0.566; scale-y: 0.538; }
        frame 27 { x: 22.6; y: 54.8; scale-x: 0.563; scale-y: 0.544; }
        frame 28 { x: 22.7; y: 54.6; scale-x: 0.559; scale-y: 0.55; }
        frame 29 { x: 22.8; y: 54.4; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "frontleaf_right_tip";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 56.3; y: 56; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_RIGHTTIP; }
        frame 6 { x: 56.1; y: -10000; skew-x: -1.4; skew-y: -1.4; scale-x: 0.584; scale-y: 0.554; cel: -10000; image: none; }
        frame 7 { x: -10000; skew-x: -2.9; skew-y: -2.9; scale-x: 0.613; scale-y: 0.552; }
        frame 8 { x: 56; y: 56.1; skew-x: -4.4; skew-y: -4.4; scale-x: 0.642; scale-y: 0.55; }
        frame 9 { x: 55.9; y: 56.3; skew-x: -5.9; skew-y: -5.9; scale-x: 0.671; scale-y: 0.548; }
        frame 10 { x: 55.8; y: 56.4; skew-x: -7.5; skew-y: -7.5; scale-x: 0.7; scale-y: 0.547; }
        frame 11 { x: 55.5; y: 56.5; skew-x: -9.2; skew-y: -9.2; scale-x: 0.729; scale-y: 0.545; }
        frame 12 { x: 56; y: -10000; skew-x: -7.5; skew-y: -7.5; scale-x: 0.707; scale-y: 0.543; }
        frame 13 { x: 56.4; y: 56.6; skew-x: -5.9; skew-y: -5.9; scale-x: 0.686; scale-y: 0.542; }
        frame 14 { x: 56.8; y: 56.8; skew-x: -4.4; skew-y: -4.4; scale-x: 0.664; scale-y: 0.54; }
        frame 15 { x: 57; y: 56.9; skew-x: -2.9; skew-y: -2.9; scale-x: 0.643; scale-y: 0.539; }
        frame 16 { x: 57.4; y: 57; skew-x: -1.4; skew-y: -1.4; scale-x: 0.621; scale-y: 0.537; }
        frame 17 { x: 57.9; y: 57.1; skew-x: 0; skew-y: 0; scale-x: 0.6; scale-y: 0.535; }
        frame 18 { x: 57.5; y: 57; skew-x: -1.4; skew-y: -1.4; scale-x: 0.621; scale-y: 0.537; }
        frame 19 { x: 57.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.643; scale-y: 0.539; }
        frame 20 { x: 56.8; y: 56.8; skew-x: -4.4; skew-y: -4.4; scale-x: 0.664; scale-y: 0.54; }
        frame 21 { x: 56.4; y: -10000; skew-x: -5.9; skew-y: -5.9; scale-x: 0.686; scale-y: 0.542; }
        frame 22 { x: 56; y: 56.7; skew-x: -7.5; skew-y: -7.5; scale-x: 0.707; scale-y: 0.543; }
        frame 23 { x: 55.5; y: 56.6; skew-x: -9.2; skew-y: -9.2; scale-x: 0.729; scale-y: 0.545; }
        frame 24 { x: 55.6; y: 56.5; skew-x: -7.5; skew-y: -7.5; scale-x: 0.7; scale-y: 0.547; }
        frame 25 { x: 55.7; y: 56.4; skew-x: -5.9; skew-y: -5.9; scale-x: 0.671; scale-y: 0.548; }
        frame 26 { x: 55.9; y: 56.3; skew-x: -4.4; skew-y: -4.4; scale-x: 0.642; scale-y: 0.55; }
        frame 27 { x: 56; y: 56.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.613; scale-y: 0.552; }
        frame 28 { x: 56.1; y: 56; skew-x: -1.4; skew-y: -1.4; scale-x: 0.584; scale-y: 0.554; }
        frame 29 { x: 56.3; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "frontleaf_tip_left";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 19.4; y: 61.6; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_LEFTTIP; }
        frame 6 { x: 19.5; y: 61.4; skew-x: 1.3; skew-y: 1.3; scale-x: 0.567; scale-y: 0.554; cel: -10000; image: none; }
        frame 7 { x: -10000; y: 61.3; skew-x: 2.8; skew-y: 2.8; scale-x: 0.58; scale-y: 0.552; }
        frame 8 { y: 61.1; skew-x: 4; skew-y: 4; scale-x: 0.592; scale-y: 0.55; }
        frame 9 { x: 19.6; y: 60.9; skew-x: 5.5; skew-y: 5.5; scale-x: 0.604; scale-y: 0.548; }
        frame 10 { x: 19.7; y: 60.8; skew-x: 6.8; skew-y: 6.8; scale-x: 0.616; scale-y: 0.546; }
        frame 11 { x: 19.6; y: 60.4; skew-x: 8.3; skew-y: 8.3; scale-x: 0.628; scale-y: 0.545; }
        frame 12 { x: -10000; y: 60.8; skew-x: 5.8; skew-y: 5.8; scale-x: 0.609; scale-y: 0.551; }
        frame 13 { x: 19.5; y: 61.2; skew-x: 3.5; skew-y: 3.5; scale-x: 0.591; scale-y: 0.557; }
        frame 14 { x: -10000; y: 61.5; skew-x: 1; skew-y: 1; scale-x: 0.573; scale-y: 0.563; }
        frame 15 { y: 61.9; skew-x: -1.2; skew-y: -1.2; scale-x: 0.554; scale-y: 0.569; }
        frame 16 { x: 19.4; y: 62.3; skew-x: -3.4; skew-y: -3.4; scale-x: 0.536; scale-y: 0.575; }
        frame 17 { x: -10000; y: 62.6; skew-x: -5.9; skew-y: -5.9; scale-x: 0.517; scale-y: 0.582; }
        frame 18 { x: 19.5; y: 62.4; skew-x: -3.4; skew-y: -3.4; scale-x: 0.536; scale-y: 0.575; }
        frame 19 { x: -10000; y: 62; skew-x: -1.2; skew-y: -1.2; scale-x: 0.554; scale-y: 0.569; }
        frame 20 { y: 61.6; skew-x: 1; skew-y: 1; scale-x: 0.573; scale-y: 0.563; }
        frame 21 { x: 19.6; y: 61.4; skew-x: 3.5; skew-y: 3.5; scale-x: 0.591; scale-y: 0.557; }
        frame 22 { x: -10000; y: 61; skew-x: 5.8; skew-y: 5.8; scale-x: 0.609; scale-y: 0.551; }
        frame 23 { y: 60.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.628; scale-y: 0.545; }
        frame 24 { x: 19.5; y: 60.9; skew-x: 6.8; skew-y: 6.8; scale-x: 0.616; scale-y: 0.546; }
        frame 25 { x: -10000; y: -10000; skew-x: 5.5; skew-y: 5.5; scale-x: 0.604; scale-y: 0.548; }
        frame 26 { y: 61.1; skew-x: 4; skew-y: 4; scale-x: 0.592; scale-y: 0.55; }
        frame 27 { x: 19.4; y: 61.2; skew-x: 2.8; skew-y: 2.8; scale-x: 0.58; scale-y: 0.552; }
        frame 28 { x: 19.3; y: 61.4; skew-x: 1.3; skew-y: 1.3; scale-x: 0.567; scale-y: 0.554; }
        frame 29 { x: 19.4; y: 61.6; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "Marigold_petals";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 13.8; y: 6; scale-x: 0.7; scale-y: 0.664; cel: 0; image: IMAGE_REANIM_MARIGOLD_PETALS; }
        frame 6 { x: 14.2; y: 4.5; scale-x: -10000; scale-y: 0.676; cel: -10000; image: none; }
        frame 7 { x: 14.6; y: 3; scale-y: 0.688; }
        frame 8 { x: 15; y: 1.5; scale-y: 0.7; }
        frame 9 { x: 15.6; y: 1; scale-y: -10000; }
        frame 10 { x: 16.2; y: 0.5; }
        frame 11 { x: 16.8; y: 0; }
        frame 12 { x: 17.4; y: 0.7; }
        frame 13 { x: 18; y: 1.4; }
        frame 14 { x: 18.6; y: 2.1; }
        frame 15 { x: 19.6; y: 3.5; scale-y: 0.688; }
        frame 16 { x: 20.5; y: 4.8; scale-y: 0.676; }
        frame 17 { x: 21.4; y: 6.2; scale-y: 0.664; }
        frame 18 { x: 20.5; y: 4.8; scale-y: 0.676; }
        frame 19 { x: 19.6; y: 3.5; scale-y: 0.688; }
        frame 20 { x: 18.6; y: 2.1; scale-y: 0.7; }
        frame 21 { x: 18; y: 1.4; scale-y: -10000; }
        frame 22 { x: 17.4; y: 0.7; }
        frame 23 { x: 16.8; y: 0; }
        frame 24 { x: 16.2; y: 0.5; }
        frame 25 { x: 15.6; y: 1; }
        frame 26 { x: 15; y: 1.5; }
        frame 27 { x: 14.6; y: 3; scale-y: 0.688; }
        frame 28 { x: 14.2; y: 4.5; scale-y: 0.676; }
        frame 29 { x: 13.8; y: 6; scale-y: 0.664; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 25.9; y: 15.4; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_MARIGOLD_HEAD; }
        frame 6 { x: 26.3; y: 14.7; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 26.7; y: 14; }
        frame 8 { x: 27.1; y: 13.2; }
        frame 9 { x: 27.7; y: 13; }
        frame 10 { x: 28.3; y: 12.7; }
        frame 11 { x: 28.9; y: 12.4; }
        frame 12 { x: 29.5; y: 12.9; }
        frame 13 { x: 30.1; y: 13.4; }
        frame 14 { x: 30.7; y: 13.8; }
        frame 15 { x: 31.7; y: 14.5; }
        frame 16 { x: 32.7; y: 15.2; }
        frame 17 { x: 33.8; y: 15.8; }
        frame 18 { x: 32.7; y: 15.2; }
        frame 19 { x: 31.7; y: 14.5; }
        frame 20 { x: 30.7; y: 13.8; }
        frame 21 { x: 30.1; y: 13.4; }
        frame 22 { x: 29.5; y: 12.9; }
        frame 23 { x: 28.9; y: 12.4; }
        frame 24 { x: 28.3; y: 12.7; }
        frame 25 { x: 27.7; y: 13; }
        frame 26 { x: 27.1; y: 13.2; }
        frame 27 { x: 26.7; y: 14; }
        frame 28 { x: 26.3; y: 14.7; }
        frame 29 { x: 25.9; y: 15.4; }
    }
    Track {
        source-name: "Marigold_mouth";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 33; y: 27.5; skew-x: 5.9; skew-y: 5.9; scale-x: 0.7; scale-y: 0.977; cel: 0; image: IMAGE_REANIM_MARIGOLD_MOUTH; }
        frame 6 { x: 33.1; y: 27.4; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: 0.885; cel: -10000; image: none; }
        frame 7 { x: 33.3; y: -10000; skew-x: 1.8; skew-y: 1.8; scale-y: 0.792; }
        frame 8 { x: 33.6; y: 27.3; skew-x: 0; skew-y: 0; scale-y: 0.7; }
        frame 9 { x: 34.1; y: 27.8; skew-x: -0.7; skew-y: -0.7; scale-y: 0.622; }
        frame 10 { x: 34.6; y: 28.1; skew-x: -1.7; skew-y: -1.7; scale-y: 0.544; }
        frame 11 { x: 35.2; y: 28.7; skew-x: -2.7; skew-y: -2.7; scale-y: 0.467; }
        frame 12 { x: 35.9; y: 28.5; skew-x: -1.7; skew-y: -1.7; scale-y: 0.544; }
        frame 13 { x: 36.5; y: 28.1; skew-x: -0.7; skew-y: -0.7; scale-y: 0.622; }
        frame 14 { x: 37; y: -10000; skew-x: 0; skew-y: 0; scale-y: 0.7; }
        frame 15 { x: 38.4; y: 27.9; skew-x: 2.5; skew-y: 2.5; scale-y: 0.792; }
        frame 16 { x: 39.7; y: 27.8; skew-x: 5; skew-y: 5; scale-y: 0.885; }
        frame 17 { x: 41.1; y: 27.6; skew-x: 7.7; skew-y: 7.7; scale-y: 0.977; }
        frame 18 { x: 39.6; y: 27.8; skew-x: 5; skew-y: 5; scale-y: 0.885; }
        frame 19 { x: 38.4; y: 28; skew-x: 2.5; skew-y: 2.5; scale-y: 0.792; }
        frame 20 { x: 37; y: 28.1; skew-x: 0; skew-y: 0; scale-y: 0.7; }
        frame 21 { x: 36.4; y: 28.2; skew-x: -0.7; skew-y: -0.7; scale-y: 0.622; }
        frame 22 { x: 35.8; y: 28.5; skew-x: -1.7; skew-y: -1.7; scale-y: 0.544; }
        frame 23 { x: 35.2; y: 28.7; skew-x: -2.7; skew-y: -2.7; scale-y: 0.467; }
        frame 24 { x: 34.7; y: 28.2; skew-x: -1.7; skew-y: -1.7; scale-y: 0.544; }
        frame 25 { x: 34.2; y: 27.6; skew-x: -0.7; skew-y: -0.7; scale-y: 0.622; }
        frame 26 { x: 33.6; y: 27.3; skew-x: 0; skew-y: 0; scale-y: 0.7; }
        frame 27 { x: 33.4; y: 27.4; skew-x: 1.8; skew-y: 1.8; scale-y: 0.792; }
        frame 28 { x: 33.1; y: 27.5; skew-x: 3.8; skew-y: 3.8; scale-y: 0.885; }
        frame 29 { x: 33; y: -10000; skew-x: 5.9; skew-y: 5.9; scale-y: 0.977; }
    }
    Track {
        source-name: "Marigold_eyebrow1";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 30.1; y: 21; scale-x: 0.49; scale-y: 0.49; cel: 0; image: IMAGE_REANIM_MARIGOLD_EYEBROW1; }
        frame 6 { x: 30.5; y: 20.3; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 30.9; y: 19.8; skew-x: -7.9; skew-y: -7.9; }
        frame 8 { x: 31.4; y: 19.1; skew-x: -11.9; skew-y: -11.9; }
        frame 9 { x: 32; y: 18.6; skew-x: -12.7; skew-y: -12.7; scale-x: 0.489; scale-y: 0.489; }
        frame 10 { x: 32.6; y: 18; skew-x: -13.5; skew-y: -13.5; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 33.2; y: 17.4; skew-x: -14.4; skew-y: -14.4; scale-x: 0.49; scale-y: 0.49; }
        frame 12 { x: 34.3; y: 17.9; skew-x: -10; skew-y: -10; scale-x: 0.489; scale-y: 0.489; }
        frame 13 { x: 35.4; y: 18.3; skew-x: -5.7; skew-y: -5.7; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 36.5; y: 18.7; skew-x: -1.4; skew-y: -1.4; scale-x: 0.49; scale-y: 0.49; }
        frame 15 { x: 37.6; y: 19.2; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: 38.8; y: 19.7; skew-x: 6.8; skew-y: 6.8; scale-x: 0.489; scale-y: 0.489; }
        frame 17 { x: 40; y: 20.2; skew-x: 11.2; skew-y: 11.2; scale-x: 0.49; scale-y: 0.49; }
        frame 18 { x: 38.6; y: 20; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 37.1; y: 19.7; skew-x: 1.5; skew-y: 1.5; }
        frame 20 { x: 35.9; y: 19.4; skew-x: -3.2; skew-y: -3.2; }
        frame 21 { x: 35; y: 18.7; skew-x: -6.9; skew-y: -6.9; }
        frame 22 { x: 34.2; y: 18; skew-x: -10.7; skew-y: -10.7; scale-x: 0.489; scale-y: 0.489; }
        frame 23 { x: 33.2; y: 17.4; skew-x: -14.4; skew-y: -14.4; scale-x: 0.49; scale-y: 0.49; }
        frame 24 { x: 32.5; y: 18; skew-x: -13.5; skew-y: -13.5; scale-x: 0.489; scale-y: 0.489; }
        frame 25 { x: 31.9; y: 18.5; skew-x: -12.7; skew-y: -12.7; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 31.4; y: 19.1; skew-x: -11.9; skew-y: -11.9; scale-x: 0.49; scale-y: 0.49; }
        frame 27 { x: 30.9; y: 19.8; skew-x: -7.9; skew-y: -7.9; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 30.6; y: 20.4; skew-x: -3.9; skew-y: -3.9; }
        frame 29 { x: 30.1; y: 21; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Marigold_eyebrow2";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 46.3; y: 18.1; scale-x: 0.49; scale-y: 0.49; cel: 0; image: IMAGE_REANIM_MARIGOLD_EYEBROW2; }
        frame 6 { x: 46.5; y: 17.3; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 46.9; y: 16.5; }
        frame 8 { x: 47.1; y: 15.7; }
        frame 9 { x: 47.9; y: 14.8; skew-x: 3.8; skew-y: 3.8; }
        frame 10 { x: 48.8; y: 13.9; skew-x: 7.5; skew-y: 7.5; scale-x: 0.489; scale-y: 0.489; }
        frame 11 { x: 49.6; y: 13; skew-x: 11.3; skew-y: 11.3; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 50.3; y: 14; skew-x: 8.3; skew-y: 8.3; }
        frame 13 { x: 50.8; y: 14.9; skew-x: 5.3; skew-y: 5.3; }
        frame 14 { x: 51.4; y: 16; skew-x: 2.3; skew-y: 2.3; }
        frame 15 { x: 51.9; y: 17; skew-x: -0.4; skew-y: -0.4; scale-x: 0.488; scale-y: 0.488; }
        frame 16 { x: 52.5; y: 18; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 53.3; y: 19.1; skew-x: -6.5; skew-y: -6.5; }
        frame 18 { x: 52.3; y: 18.1; skew-x: -4.7; skew-y: -4.7; }
        frame 19 { x: 51.3; y: 17.2; skew-x: -2.9; skew-y: -2.9; scale-x: 0.489; scale-y: 0.489; }
        frame 20 { x: 50.3; y: 16.2; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 50; y: 15.2; skew-x: 2.8; skew-y: 2.8; }
        frame 22 { x: 49.9; y: 14.1; skew-x: 7; skew-y: 7; }
        frame 23 { x: 49.6; y: 13; skew-x: 11.3; skew-y: 11.3; }
        frame 24 { x: 48.8; y: 13.9; skew-x: 7.5; skew-y: 7.5; }
        frame 25 { x: 48; y: 14.7; skew-x: 3.8; skew-y: 3.8; scale-x: 0.49; scale-y: 0.49; }
        frame 26 { x: 47.1; y: 15.7; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 46.9; y: 16.5; skew-x: -10000; skew-y: -10000; }
        frame 28 { x: 46.5; y: 17.3; }
        frame 29 { x: 46.3; y: 18.1; }
    }
    Track {
        source-name: "Marigold_blink";
        frame-count: 30;
        frame 0 { cel: -1; }
        frame 1 { x: 31.4; y: 20.3; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_MARIGOLD_BLINK1; }
        frame 2 { x: 31.3; y: 20.4; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_MARIGOLD_BLINK2; }
        frame 3 { x: 31.4; y: 20.3; image: IMAGE_REANIM_MARIGOLD_BLINK1; }
        frame 4 { x: -10000; y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
}
