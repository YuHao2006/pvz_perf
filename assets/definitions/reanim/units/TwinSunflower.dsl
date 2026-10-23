export component TwinSunflower {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { cel: 0; }
        frame 5 { cel: -10000; }
        frame 9 { cel: -1; }
        frame 10 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink2";
        frame-count: 34;
        frame 4 { cel: -1; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { cel: 0; }
        frame 10 { cel: -10000; }
    }
    Track {
        source-name: "backleaf";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 27.7; y: 53; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF; }
        frame 10 { x: -10000; y: 53.5; scale-x: 0.561; scale-y: 0.529; cel: -10000; image: none; }
        frame 11 { y: 54.1; scale-x: 0.566; scale-y: 0.502; }
        frame 12 { x: 27.6; y: 54.7; scale-x: 0.572; scale-y: 0.476; }
        frame 13 { x: -10000; y: 55.3; scale-x: 0.577; scale-y: 0.449; }
        frame 14 { y: 55.9; scale-x: 0.583; scale-y: 0.423; }
        frame 15 { y: 55.5; scale-x: 0.588; scale-y: 0.44; }
        frame 16 { x: 27.5; y: 55.3; scale-x: 0.592; scale-y: 0.458; }
        frame 17 { x: 27.6; y: 55; scale-x: 0.597; scale-y: 0.475; }
        frame 18 { x: 27.5; y: 54.5; scale-x: 0.601; scale-y: 0.493; }
        frame 19 { x: -10000; y: 54.2; scale-x: 0.606; scale-y: 0.51; }
        frame 20 { y: 53.9; scale-x: 0.61; scale-y: 0.528; }
        frame 21 { y: 54.1; scale-x: 0.607; scale-y: 0.513; }
        frame 22 { y: 54.5; scale-x: 0.603; scale-y: 0.498; }
        frame 23 { y: 54.8; scale-x: 0.599; scale-y: 0.483; }
        frame 24 { x: 27.6; y: 55; scale-x: 0.595; scale-y: 0.468; }
        frame 25 { x: -10000; y: 55.3; scale-x: 0.591; scale-y: 0.453; }
        frame 26 { y: 55.5; scale-x: 0.587; scale-y: 0.438; }
        frame 27 { y: 55.9; scale-x: 0.583; scale-y: 0.423; }
        frame 28 { x: 27.7; y: 55.4; scale-x: 0.578; scale-y: 0.445; }
        frame 29 { x: -10000; y: 54.9; scale-x: 0.574; scale-y: 0.467; }
        frame 30 { x: 27.6; y: 54.5; scale-x: 0.569; scale-y: 0.489; }
        frame 31 { x: 27.7; y: 53.9; scale-x: 0.565; scale-y: 0.511; }
        frame 32 { x: -10000; y: 53.5; scale-x: 0.56; scale-y: 0.533; }
        frame 33 { y: 53; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "backleaf_left_tip";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 25; y: 53.9; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF_LEFTTIP; }
        frame 10 { x: -10000; y: 54.4; skew-x: 0.3; skew-y: 0.5; scale-x: 0.565; scale-y: 0.533; cel: -10000; image: none; }
        frame 11 { x: 24.9; y: 54.8; skew-x: 0.8; skew-y: 1.3; scale-x: 0.575; scale-y: 0.51; }
        frame 12 { x: -10000; y: 55.3; skew-x: 1.3; skew-y: 1.8; scale-x: 0.584; scale-y: 0.488; }
        frame 13 { y: 55.8; skew-x: 1.8; skew-y: 2.5; scale-x: 0.594; scale-y: 0.465; }
        frame 14 { x: 25; y: 56.1; skew-x: 2.4; skew-y: 3.2; scale-x: 0.604; scale-y: 0.443; }
        frame 15 { x: 24.8; y: 56; skew-x: 0.1; skew-y: 1.3; scale-x: 0.614; scale-y: 0.474; }
        frame 16 { x: 24.6; y: -10000; skew-x: -1.7; skew-y: -0; scale-x: 0.625; scale-y: 0.505; }
        frame 17 { x: 24.5; y: 56; skew-x: -3.9; skew-y: -1.7; scale-x: 0.636; scale-y: 0.537; }
        frame 18 { x: 24.2; y: 55.9; skew-x: -6; skew-y: -3.4; scale-x: 0.647; scale-y: 0.568; }
        frame 19 { x: 24; y: -10000; skew-x: -8.2; skew-y: -5.2; scale-x: 0.657; scale-y: 0.599; }
        frame 20 { x: 23.9; skew-x: -10.4; skew-y: -6.9; scale-x: 0.668; scale-y: 0.63; }
        frame 21 { x: 24; skew-x: -8.4; skew-y: -5.4; scale-x: 0.659; scale-y: 0.603; }
        frame 22 { x: 24.2; y: 56; skew-x: -6.7; skew-y: -3.9; scale-x: 0.65; scale-y: 0.577; }
        frame 23 { x: 24.3; y: -10000; skew-x: -4.7; skew-y: -2.4; scale-x: 0.64; scale-y: 0.55; }
        frame 24 { x: 24.6; y: 56; skew-x: -2.9; skew-y: -0.9; scale-x: 0.631; scale-y: 0.523; }
        frame 25 { x: 24.7; y: -10000; skew-x: -1.2; skew-y: 0.3; scale-x: 0.622; scale-y: 0.496; }
        frame 26 { x: 24.8; y: 56.1; skew-x: 0.5; skew-y: 1.6; scale-x: 0.613; scale-y: 0.469; }
        frame 27 { x: 25; y: 56; skew-x: 2.4; skew-y: 3.2; scale-x: 0.604; scale-y: 0.443; }
        frame 28 { x: -10000; y: 55.6; skew-x: 1.8; skew-y: 2.5; scale-x: 0.596; scale-y: 0.461; }
        frame 29 { x: 25.1; y: 55.4; skew-x: 1.5; skew-y: 2; scale-x: 0.588; scale-y: 0.48; }
        frame 30 { x: 25; y: 55; skew-x: 1; skew-y: 1.5; scale-x: 0.58; scale-y: 0.499; }
        frame 31 { x: 25.1; y: 54.5; skew-x: 0.8; skew-y: 1; scale-x: 0.571; scale-y: 0.518; }
        frame 32 { x: 25; y: 54.1; skew-x: 0.3; skew-y: 0.5; scale-x: 0.563; scale-y: 0.537; }
        frame 33 { y: 53.9; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "backleaf_right_tip";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 47; y: 52.9; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_BACKLEAF_RIGHTTIP; }
        frame 10 { x: 47.2; y: 53.4; skew-x: 0.3; skew-y: 0.3; scale-x: 0.578; scale-y: 0.533; cel: -10000; image: none; }
        frame 11 { x: 47.3; y: 54; skew-x: 0.5; skew-y: 0.6; scale-x: 0.6; scale-y: 0.51; }
        frame 12 { x: 47.5; y: 54.5; skew-x: 0.8; skew-y: 1; scale-x: 0.622; scale-y: 0.488; }
        frame 13 { x: -10000; y: 55; skew-x: 1; skew-y: 1.3; scale-x: 0.645; scale-y: 0.465; }
        frame 14 { x: 47.7; y: 55.6; skew-x: 1.3; skew-y: 1.8; scale-x: 0.667; scale-y: 0.442; }
        frame 15 { x: 47.8; y: 55.3; skew-x: 2.8; skew-y: 2.5; scale-x: 0.662; scale-y: 0.466; }
        frame 16 { x: 48; y: 55; skew-x: 4.3; skew-y: 3.5; scale-x: 0.657; scale-y: 0.489; }
        frame 17 { x: 48.3; y: 54.6; skew-x: 6; skew-y: 4.3; scale-x: 0.652; scale-y: 0.513; }
        frame 18 { x: 48.4; y: 54.3; skew-x: 7.5; skew-y: 5.3; scale-x: 0.646; scale-y: 0.536; }
        frame 19 { x: 48.5; y: 53.9; skew-x: 9; skew-y: 6.3; scale-x: 0.641; scale-y: 0.56; }
        frame 20 { x: 48.8; y: 53.6; skew-x: 10.8; skew-y: 7.2; scale-x: 0.636; scale-y: 0.584; }
        frame 21 { x: 48.5; y: 53.9; skew-x: 9.3; skew-y: 6.3; scale-x: 0.64; scale-y: 0.563; }
        frame 22 { x: 48.4; y: 54.1; skew-x: 8; skew-y: 5.5; scale-x: 0.645; scale-y: 0.543; }
        frame 23 { x: 48.2; y: 54.5; skew-x: 6.6; skew-y: 4.8; scale-x: 0.649; scale-y: 0.523; }
        frame 24 { x: 48; y: 54.8; skew-x: 5.3; skew-y: 4; scale-x: 0.654; scale-y: 0.503; }
        frame 25 { x: 47.9; y: 55; skew-x: 4; skew-y: 3.3; scale-x: 0.658; scale-y: 0.483; }
        frame 26 { x: 47.8; y: 55.5; skew-x: 2.5; skew-y: 2.5; scale-x: 0.663; scale-y: 0.463; }
        frame 27 { x: 47.7; y: 55.6; skew-x: 1.3; skew-y: 1.8; scale-x: 0.667; scale-y: 0.442; }
        frame 28 { x: 47.6; y: 55.2; skew-x: 1; skew-y: 1.3; scale-x: 0.649; scale-y: 0.461; }
        frame 29 { x: 47.5; y: 54.6; skew-x: 0.8; skew-y: 1; scale-x: 0.63; scale-y: 0.48; }
        frame 30 { x: -10000; y: 54.2; skew-x: 0.5; skew-y: 0.8; scale-x: 0.611; scale-y: 0.499; }
        frame 31 { x: 47.4; y: 53.8; skew-x: 0.3; skew-y: 0.5; scale-x: 0.593; scale-y: 0.518; }
        frame 32 { x: 47.3; y: 53.3; skew-x: 0.1; skew-y: 0.3; scale-x: 0.574; scale-y: 0.537; }
        frame 33 { x: 47.1; y: 52.9; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "TwinSunflower_stem2";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 16.8; y: 38.4; skew-y: -9.2; scale-x: 0.8; scale-y: 0.912; cel: 0; image: IMAGE_REANIM_TWINSUNFLOWER_STEM1; }
        frame 10 { x: 18.1; y: 37.8; skew-y: -6.9; scale-x: 0.79; scale-y: 0.927; cel: -10000; image: none; }
        frame 11 { x: 19.5; y: 37.1; skew-y: -4.7; scale-x: 0.78; scale-y: 0.943; }
        frame 12 { x: 20.8; y: 36.5; skew-y: -2.4; scale-x: 0.77; scale-y: 0.959; }
        frame 13 { x: 22.1; y: 35.8; skew-y: -0.2; scale-x: 0.759; scale-y: 0.974; }
        frame 14 { x: 23.4; y: 35.1; skew-y: 1.6; scale-x: 0.749; scale-y: 0.99; }
        frame 15 { x: 24.7; y: 34.7; skew-y: 3.9; scale-x: 0.739; scale-y: 1.005; }
        frame 16 { x: 25.4; y: 34.9; skew-x: 2.5; skew-y: 5.8; scale-x: 0.749; scale-y: 0.987; }
        frame 17 { x: 26.2; y: 35.1; skew-x: 5.3; skew-y: 8; scale-x: 0.759; scale-y: 0.97; }
        frame 18 { x: 27; y: 35.4; skew-x: 7.8; skew-y: 10; scale-x: 0.769; scale-y: 0.952; }
        frame 19 { x: 27.8; y: 35.6; skew-x: 10.5; skew-y: 12.1; scale-x: 0.779; scale-y: 0.934; }
        frame 20 { x: 28.6; y: 35.9; skew-x: 13.1; skew-y: 14.3; scale-x: 0.789; scale-y: 0.916; }
        frame 21 { x: 29.4; y: 36; skew-x: 15.8; skew-y: 16.4; scale-x: 0.799; scale-y: 0.9; }
        frame 22 { x: 28.6; y: 35.8; skew-x: 13.1; skew-y: 14.3; scale-x: 0.789; scale-y: 0.916; }
        frame 23 { x: 27.9; y: 35.5; skew-x: 10.5; skew-y: 12.1; scale-x: 0.779; scale-y: 0.934; }
        frame 24 { x: 27; y: 35.4; skew-x: 7.8; skew-y: 10; scale-x: 0.769; scale-y: 0.952; }
        frame 25 { x: 26.3; y: 35.1; skew-x: 5.3; skew-y: 8; scale-x: 0.759; scale-y: 0.97; }
        frame 26 { x: 25.4; y: 34.8; skew-x: 2.5; skew-y: 5.8; scale-x: 0.749; scale-y: 0.987; }
        frame 27 { x: 24.7; y: 34.7; skew-x: 0; skew-y: 3.9; scale-x: 0.739; scale-y: 1.005; }
        frame 28 { x: 23.2; y: 35.3; skew-x: -10000; skew-y: 1.5; scale-x: 0.749; scale-y: 0.99; }
        frame 29 { x: 22; y: 35.9; skew-y: -0.4; scale-x: 0.759; scale-y: 0.974; }
        frame 30 { x: 20.7; y: 36.5; skew-y: -2.4; scale-x: 0.77; scale-y: 0.959; }
        frame 31 { x: 19.4; y: 37.2; skew-y: -4.7; scale-x: 0.78; scale-y: 0.943; }
        frame 32 { x: 18.1; y: 37.8; skew-y: -6.9; scale-x: 0.79; scale-y: 0.927; }
        frame 33 { x: 16.8; y: 38.4; skew-y: -9.2; scale-x: 0.8; scale-y: 0.912; }
    }
    Track {
        source-name: "TwinSunflower_leaf1";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 23.8; y: 46.9; skew-x: 151.9; skew-y: -28; scale-x: 0.592; scale-y: 0.592; cel: 0; image: IMAGE_REANIM_TWINSUNFLOWER_LEAF; }
        frame 10 { x: 24.5; y: 46.4; skew-x: 147.9; skew-y: -27; scale-x: 0.596; scale-y: 0.587; cel: -10000; image: none; }
        frame 11 { x: 25.1; y: 45.8; skew-x: 144.1; skew-y: -26; scale-x: 0.601; scale-y: 0.583; }
        frame 12 { x: 25.7; y: 45.3; skew-x: 140.2; skew-y: -25; scale-x: 0.607; scale-y: 0.579; }
        frame 13 { x: 26.5; y: 45; skew-x: 142.2; skew-y: -24; scale-x: 0.601; scale-y: 0.575; }
        frame 14 { x: 27.4; y: 44.7; skew-x: 144.2; skew-y: -23; scale-x: 0.595; scale-y: 0.571; }
        frame 15 { x: 28; y: 44.5; skew-x: 146.2; skew-y: -22; scale-x: 0.591; scale-y: 0.568; }
        frame 16 { x: 28.9; y: 44.7; skew-x: 154.7; skew-y: -18.7; scale-x: 0.589; scale-y: 0.571; }
        frame 17 { x: 29.7; y: 44.9; skew-x: 163.2; skew-y: -15.5; scale-x: -10000; scale-y: 0.575; }
        frame 18 { x: 30.3; y: 45.1; skew-x: 171.7; skew-y: -12.5; scale-y: 0.579; }
        frame 19 { x: 30.9; y: 45.5; skew-x: 173.5; skew-y: -9.2; scale-x: 0.59; scale-y: 0.583; }
        frame 20 { x: 31.6; y: 45.9; skew-x: 175.2; skew-y: -6.2; scale-x: -10000; scale-y: 0.587; }
        frame 21 { x: 32.3; y: 46; skew-x: 176.7; skew-y: -3.2; scale-x: 0.591; scale-y: 0.591; }
        frame 22 { x: 31.7; y: 45.8; skew-x: 169.7; skew-y: -6.2; scale-x: 0.594; scale-y: 0.587; }
        frame 23 { x: 31.2; y: 45.4; skew-x: 162.7; skew-y: -9.2; scale-x: 0.597; scale-y: 0.583; }
        frame 24 { x: 30.5; y: 45.2; skew-x: 155.6; skew-y: -12.5; scale-x: 0.6; scale-y: 0.579; }
        frame 25 { x: 29.7; y: 44.9; skew-x: 152.5; skew-y: -15.5; scale-x: 0.596; scale-y: 0.575; }
        frame 26 { x: 29; y: 44.8; skew-x: 149.4; skew-y: -18.7; scale-x: 0.593; scale-y: 0.571; }
        frame 27 { x: 28; y: 44.5; skew-x: 146.2; skew-y: -22; scale-x: 0.591; scale-y: 0.568; }
        frame 28 { x: 27.4; y: 44.9; skew-x: 150.7; skew-y: -23; scale-x: 0.589; scale-y: 0.571; }
        frame 29 { x: 26.6; y: 45.4; skew-x: 155.4; skew-y: -24; scale-x: -10000; scale-y: 0.575; }
        frame 30 { x: 25.9; y: 45.8; skew-x: 159.9; skew-y: -25; scale-x: 0.59; scale-y: 0.579; }
        frame 31 { x: 25.1; y: 46.2; skew-x: 157.2; skew-y: -26; scale-x: -10000; scale-y: 0.583; }
        frame 32 { x: 24.5; y: 46.6; skew-x: 154.7; skew-y: -27; scale-x: 0.591; scale-y: 0.587; }
        frame 33 { x: 23.8; y: 46.9; skew-x: 151.9; skew-y: -28; scale-x: 0.592; scale-y: 0.592; }
    }
    Track {
        source-name: "TwinSunflower_stem1";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 42.3; y: 21.2; skew-y: 1.9; scale-x: 0.8; scale-y: 0.868; cel: 0; image: IMAGE_REANIM_TWINSUNFLOWER_STEM2; }
        frame 10 { x: 41.3; y: 21; skew-y: 0.5; scale-x: -10000; scale-y: 0.872; cel: -10000; image: none; }
        frame 11 { x: 40.5; y: 20.8; skew-y: -0.4; scale-y: 0.876; }
        frame 12 { x: 39.5; y: 20.7; skew-y: -1.6; scale-y: 0.88; }
        frame 13 { x: 38.8; y: 20.4; skew-y: -2.7; scale-y: 0.887; }
        frame 14 { x: 37.9; y: 20; skew-y: -3.7; scale-y: 0.895; }
        frame 15 { x: 37; y: 19.6; skew-y: -4.9; scale-y: 0.903; }
        frame 16 { x: 35.6; y: 20; skew-y: -6.7; scale-y: 0.899; }
        frame 17 { x: 34.4; y: 20.5; skew-y: -8.4; scale-y: 0.895; }
        frame 18 { x: 33; y: 20.8; skew-y: -10.2; scale-y: 0.892; }
        frame 19 { x: 31.6; y: 21.7; skew-y: -12.2; scale-y: 0.88; }
        frame 20 { x: 30.3; y: 22.5; skew-y: -14.2; scale-y: 0.868; }
        frame 21 { x: 28.9; y: 23.4; skew-y: -16.3; scale-y: 0.857; }
        frame 22 { x: 30; y: 23; skew-y: -14.7; scale-y: 0.861; }
        frame 23 { x: 31; y: 22.5; skew-y: -13.2; scale-y: 0.865; }
        frame 24 { x: 32; y: 22; skew-y: -11.9; scale-y: 0.871; }
        frame 25 { x: 33.5; y: 21.3; skew-y: -9.7; scale-y: 0.881; }
        frame 26 { x: 35.1; y: 20.4; skew-y: -7.5; scale-y: 0.892; }
        frame 27 { x: 36.6; y: 19.6; skew-y: -5.4; scale-y: 0.903; }
        frame 28 { x: 37.4; y: 20; skew-y: -4.5; scale-y: 0.897; }
        frame 29 { x: 38.1; y: 20.1; skew-y: -3.7; scale-y: 0.891; }
        frame 30 { x: 38.9; y: 20.4; skew-y: -3.1; scale-y: 0.886; }
        frame 31 { x: 40.1; y: 20.6; skew-y: -1.2; scale-y: 0.88; }
        frame 32 { x: 41.1; y: 20.9; skew-y: 0; scale-y: 0.874; }
        frame 33 { x: 42.3; y: 21.2; skew-y: 1.9; scale-y: 0.868; }
    }
    Track {
        source-name: "TwinSunflower_leaf1";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 55.2; y: 33.1; skew-x: 17.6; skew-y: 17.6; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_TWINSUNFLOWER_LEAF; }
        frame 10 { x: 54.4; y: 33; skew-x: 19.8; skew-y: 16.3; scale-x: 0.808; scale-y: 0.797; cel: -10000; image: none; }
        frame 11 { x: 53.9; y: 32.9; skew-x: 22.1; skew-y: 15.3; scale-x: 0.817; scale-y: 0.796; }
        frame 12 { x: 53.3; y: 32.8; skew-x: 24.6; skew-y: 14.1; scale-x: 0.827; scale-y: 0.795; }
        frame 13 { x: 52.6; y: 32.5; skew-x: 23.1; skew-y: 12.8; scale-x: 0.829; scale-y: 0.797; }
        frame 14 { x: 52; y: 32.2; skew-x: 21.8; skew-y: 11.8; scale-x: 0.832; scale-y: 0.8; }
        frame 15 { x: 51.4; y: 32; skew-x: 20.4; skew-y: 10.6; scale-x: 0.836; scale-y: 0.803; }
        frame 16 { x: 50.3; y: 32.2; skew-x: 15.8; skew-y: 8.8; scale-x: 0.834; scale-y: 0.793; }
        frame 17 { x: 49.3; y: 32.5; skew-x: 11.3; skew-y: 7.1; scale-x: 0.832; scale-y: 0.783; }
        frame 18 { x: 48.4; y: 32.9; skew-x: 6.7; skew-y: 5.5; scale-x: 0.83; scale-y: 0.774; }
        frame 19 { x: 47.4; y: 33.5; skew-x: 7.1; skew-y: 3.8; scale-x: 0.835; scale-y: 0.756; }
        frame 20 { x: 46.5; y: 34.1; skew-x: 7.6; skew-y: 2; scale-x: 0.84; scale-y: 0.739; }
        frame 21 { x: 45.5; y: 34.7; skew-x: 8.2; skew-y: 0.4; scale-x: 0.846; scale-y: 0.721; }
        frame 22 { x: 46.3; y: 34.4; skew-x: 11.1; skew-y: 1.5; scale-x: 0.848; scale-y: 0.731; }
        frame 23 { x: 47; y: 34.1; skew-x: 14.1; skew-y: 2.8; scale-x: 0.85; scale-y: 0.74; }
        frame 24 { x: 47.7; y: 33.6; skew-x: 17.3; skew-y: 4.3; scale-x: 0.853; scale-y: 0.75; }
        frame 25 { x: 48.8; y: 33; skew-x: 18.3; skew-y: 6.1; scale-x: 0.848; scale-y: 0.767; }
        frame 26 { x: 50; y: 32.4; skew-x: 19.3; skew-y: 8; scale-x: 0.843; scale-y: 0.784; }
        frame 27 { x: 51; y: 32; skew-x: 20.3; skew-y: 10.1; scale-x: 0.839; scale-y: 0.802; }
        frame 28 { x: 51.7; y: 32.2; skew-x: 15.8; skew-y: 9.3; scale-x: 0.834; scale-y: 0.793; }
        frame 29 { x: 52.5; y: 32.5; skew-x: 11.3; skew-y: 8.8; scale-x: 0.829; scale-y: 0.786; }
        frame 30 { x: 53.1; y: 32.9; skew-x: 6.8; skew-y: 8.3; scale-x: 0.825; scale-y: 0.778; }
        frame 31 { x: 53.7; y: 33; skew-x: 10.3; skew-y: 11.3; scale-x: 0.816; scale-y: 0.785; }
        frame 32 { x: 54.3; y: 33.1; skew-x: 13.8; skew-y: 14.3; scale-x: 0.807; scale-y: 0.792; }
        frame 33 { x: 55.2; y: -10000; skew-x: 17.6; skew-y: 17.6; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "TwinSunflower_leaf1";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 51.2; y: 40.9; skew-x: -164.2; skew-y: 15.7; scale-x: 0.594; scale-y: 0.594; cel: 0; image: IMAGE_REANIM_TWINSUNFLOWER_LEAF; }
        frame 10 { x: 50.8; y: 40.7; skew-x: -167.1; skew-y: 14.5; scale-x: 0.596; scale-y: 0.592; cel: -10000; image: none; }
        frame 11 { x: 50.4; y: 40.6; skew-x: -169.9; skew-y: 13.3; scale-x: 0.6; scale-y: -10000; }
        frame 12 { x: 49.8; y: -10000; skew-x: -172.6; skew-y: 12.1; scale-x: 0.604; }
        frame 13 { x: 49.4; y: 40.5; skew-x: -172.1; skew-y: 10.8; scale-x: 0.605; scale-y: 0.594; }
        frame 14 { x: 48.8; y: 40.3; skew-x: -171.3; skew-y: 9.8; scale-x: 0.607; scale-y: 0.596; }
        frame 15 { x: 48.4; y: 40.1; skew-x: -170.5; skew-y: 8.7; scale-x: 0.61; scale-y: 0.599; }
        frame 16 { x: 47.6; y: 40.3; skew-x: -166.6; skew-y: 6.8; scale-x: 0.623; scale-y: 0.592; }
        frame 17 { x: 47; y: 40.5; skew-x: -162.8; skew-y: 5.1; scale-x: 0.637; scale-y: 0.585; }
        frame 18 { x: 46.2; y: 40.6; skew-x: -158.9; skew-y: 3.5; scale-x: 0.651; scale-y: 0.579; }
        frame 19 { x: 45.5; y: 41.1; skew-x: -160.1; skew-y: 1.6; scale-x: 0.652; scale-y: 0.566; }
        frame 20 { x: 44.6; y: 41.7; skew-x: -161.1; skew-y: 0; scale-x: -10000; scale-y: 0.554; }
        frame 21 { x: 44; y: 42.2; skew-x: -162.1; skew-y: -1.6; scale-x: 0.654; scale-y: 0.541; }
        frame 22 { x: 44.5; y: 41.9; skew-x: -165.6; skew-y: -0.2; scale-x: 0.644; scale-y: 0.548; }
        frame 23 { x: 45.1; y: 41.6; skew-x: -168.9; skew-y: 0.8; scale-x: 0.634; scale-y: 0.554; }
        frame 24 { x: 45.6; y: 41.5; skew-x: -172.2; skew-y: 2.3; scale-x: 0.625; scale-y: 0.561; }
        frame 25 { x: 46.5; y: 41; skew-x: -171.6; skew-y: 4.1; scale-x: 0.62; scale-y: 0.573; }
        frame 26 { x: 47.4; y: 40.5; skew-x: -171.1; skew-y: 6.1; scale-x: 0.615; scale-y: 0.585; }
        frame 27 { x: 48.1; y: 40.1; skew-x: -170.5; skew-y: 8.2; scale-x: 0.61; scale-y: 0.598; }
        frame 28 { x: 48.6; y: 40.4; skew-x: -164.6; skew-y: 9.3; scale-x: 0.62; scale-y: 0.592; }
        frame 29 { x: 49.1; y: 40.6; skew-x: -158.9; skew-y: 10.5; scale-x: 0.63; scale-y: 0.586; }
        frame 30 { x: 49.4; y: 40.9; skew-x: -153; skew-y: 11.8; scale-x: 0.641; scale-y: 0.581; }
        frame 31 { x: 50; y: -10000; skew-x: -156.8; skew-y: 13; scale-x: 0.624; scale-y: 0.585; }
        frame 32 { x: 50.5; skew-x: -160.6; skew-y: 14.3; scale-x: 0.609; scale-y: 0.589; }
        frame 33 { x: 51.2; skew-x: -164.2; skew-y: 15.7; scale-x: 0.594; scale-y: 0.594; }
    }
    Track {
        source-name: "frontleaf";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 22.8; y: 54.4; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF; }
        frame 10 { x: -10000; y: 54; scale-x: 0.558; scale-y: 0.569; cel: -10000; image: none; }
        frame 11 { x: 22.6; y: 53.6; scale-x: 0.562; scale-y: 0.582; }
        frame 12 { x: -10000; y: 53.2; scale-x: 0.565; scale-y: 0.596; }
        frame 13 { x: 22.5; y: 52.9; scale-x: 0.568; scale-y: 0.609; }
        frame 14 { x: 22.4; y: 52.5; scale-x: 0.571; scale-y: 0.623; }
        frame 15 { x: 22.3; y: 52; scale-x: 0.574; scale-y: 0.636; }
        frame 16 { x: 22.2; y: 52.7; scale-x: 0.578; scale-y: 0.611; }
        frame 17 { x: 22.1; y: 53.5; scale-x: 0.582; scale-y: 0.587; }
        frame 18 { x: 22; y: 54.2; scale-x: 0.587; scale-y: 0.562; }
        frame 19 { x: 21.9; y: 55; scale-x: 0.591; scale-y: 0.537; }
        frame 20 { x: 21.8; y: 55.7; scale-x: 0.595; scale-y: 0.512; }
        frame 21 { x: 21.7; y: 56.5; scale-x: 0.6; scale-y: 0.487; }
        frame 22 { x: 21.8; y: 55.8; scale-x: 0.595; scale-y: 0.512; }
        frame 23 { x: 21.9; y: 55; scale-x: 0.591; scale-y: 0.537; }
        frame 24 { x: 22; y: 54.3; scale-x: 0.587; scale-y: 0.562; }
        frame 25 { x: 22.1; y: 53.5; scale-x: 0.582; scale-y: 0.587; }
        frame 26 { x: 22.3; y: 52.8; scale-x: 0.578; scale-y: 0.611; }
        frame 27 { x: -10000; y: 52; scale-x: 0.574; scale-y: 0.636; }
        frame 28 { x: 22.4; y: 52.4; scale-x: 0.571; scale-y: 0.623; }
        frame 29 { x: 22.5; y: 52.8; scale-x: 0.568; scale-y: 0.609; }
        frame 30 { x: 22.6; y: 53.2; scale-x: 0.565; scale-y: 0.596; }
        frame 31 { x: -10000; y: 53.6; scale-x: 0.562; scale-y: 0.582; }
        frame 32 { x: 22.7; y: 54; scale-x: 0.558; scale-y: 0.569; }
        frame 33 { x: 22.8; y: 54.4; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "frontleaf_right_tip";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 56.3; y: 56; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_RIGHTTIP; }
        frame 10 { x: 56.1; y: 55.6; skew-x: -1.4; skew-y: -1.4; scale-x: 0.584; scale-y: 0.571; cel: -10000; image: none; }
        frame 11 { x: 56; y: 55.2; skew-x: -2.9; skew-y: -2.9; scale-x: 0.613; scale-y: 0.587; }
        frame 12 { x: 55.8; y: 55; skew-x: -4.4; skew-y: -4.4; scale-x: 0.642; scale-y: 0.603; }
        frame 13 { x: 55.6; y: 54.6; skew-x: -5.9; skew-y: -5.9; scale-x: 0.671; scale-y: 0.619; }
        frame 14 { x: 55.4; y: 54.2; skew-x: -7.5; skew-y: -7.5; scale-x: 0.7; scale-y: 0.634; }
        frame 15 { x: 55.1; y: 54; skew-x: -9.2; skew-y: -9.2; scale-x: 0.729; scale-y: 0.651; }
        frame 16 { x: 55.6; y: 54.5; skew-x: -7.5; skew-y: -7.5; scale-x: 0.707; scale-y: 0.631; }
        frame 17 { x: 56.1; y: 55; skew-x: -5.9; skew-y: -5.9; scale-x: 0.686; scale-y: 0.612; }
        frame 18 { x: 56.5; y: 55.5; skew-x: -4.4; skew-y: -4.4; scale-x: 0.664; scale-y: 0.593; }
        frame 19 { x: 56.9; y: 56.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.643; scale-y: 0.574; }
        frame 20 { x: 57.4; y: 56.6; skew-x: -1.4; skew-y: -1.4; scale-x: 0.621; scale-y: 0.555; }
        frame 21 { x: 57.9; y: 57.1; skew-x: 0; skew-y: 0; scale-x: 0.6; scale-y: 0.535; }
        frame 22 { x: 57.5; y: 56.6; skew-x: -1.4; skew-y: -1.4; scale-x: 0.621; scale-y: 0.555; }
        frame 23 { x: 57; y: 56; skew-x: -2.9; skew-y: -2.9; scale-x: 0.643; scale-y: 0.574; }
        frame 24 { x: 56.6; y: 55.5; skew-x: -4.4; skew-y: -4.4; scale-x: 0.664; scale-y: 0.593; }
        frame 25 { x: 56.1; y: 55; skew-x: -5.9; skew-y: -5.9; scale-x: 0.686; scale-y: 0.612; }
        frame 26 { x: 55.6; y: 54.5; skew-x: -7.5; skew-y: -7.5; scale-x: 0.707; scale-y: 0.631; }
        frame 27 { x: 55.1; y: 54; skew-x: -9.2; skew-y: -9.2; scale-x: 0.729; scale-y: 0.651; }
        frame 28 { x: 55.4; y: 54.2; skew-x: -7.5; skew-y: -7.5; scale-x: 0.7; scale-y: 0.634; }
        frame 29 { x: 55.5; y: 54.6; skew-x: -5.9; skew-y: -5.9; scale-x: 0.671; scale-y: 0.619; }
        frame 30 { x: 55.8; y: 54.9; skew-x: -4.4; skew-y: -4.4; scale-x: 0.642; scale-y: 0.603; }
        frame 31 { x: 55.9; y: 55.3; skew-x: -2.9; skew-y: -2.9; scale-x: 0.613; scale-y: 0.587; }
        frame 32 { x: 56; y: 55.6; skew-x: -1.4; skew-y: -1.4; scale-x: 0.584; scale-y: 0.571; }
        frame 33 { x: 56.3; y: 56; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "frontleaf_left_tip";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 19.4; y: 61.6; scale-x: 0.555; scale-y: 0.555; cel: 0; image: IMAGE_REANIM_PEASHOOTER_FRONTLEAF_LEFTTIP; }
        frame 10 { x: -10000; y: 61.1; skew-x: 1.3; skew-y: 1.3; scale-x: 0.573; scale-y: 0.571; cel: -10000; image: none; }
        frame 11 { y: 60.6; skew-x: 2.8; skew-y: 2.8; scale-x: 0.591; scale-y: 0.587; }
        frame 12 { x: 19.5; y: 60.3; skew-x: 4; skew-y: 4; scale-x: 0.609; scale-y: 0.603; }
        frame 13 { x: -10000; y: 59.8; skew-x: 5.5; skew-y: 5.5; scale-x: 0.626; scale-y: 0.618; }
        frame 14 { x: 19.6; y: 59.3; skew-x: 6.8; skew-y: 6.8; scale-x: 0.644; scale-y: 0.634; }
        frame 15 { x: 19.5; y: 58.5; skew-x: 8.3; skew-y: 8.3; scale-x: 0.662; scale-y: 0.65; }
        frame 16 { x: 19.1; y: 59.2; skew-x: 5.8; skew-y: 5.8; scale-x: 0.648; scale-y: 0.639; }
        frame 17 { x: 18.9; y: 59.9; skew-x: 3.5; skew-y: 3.5; scale-x: 0.635; scale-y: 0.627; }
        frame 18 { x: 18.7; y: 60.5; skew-x: 1.3; skew-y: 1; scale-x: 0.621; scale-y: 0.616; }
        frame 19 { x: 18.5; y: 61.1; skew-x: -0.9; skew-y: -1.2; scale-x: 0.607; scale-y: 0.604; }
        frame 20 { x: 18.3; y: 61.8; skew-x: -3.2; skew-y: -3.4; scale-x: 0.593; scale-y: 0.593; }
        frame 21 { x: 18.2; y: 62.5; skew-x: -5.7; skew-y: -5.9; scale-x: 0.58; scale-y: 0.582; }
        frame 22 { x: 18.3; y: 61.9; skew-x: -3.2; skew-y: -3.4; scale-x: 0.593; scale-y: 0.593; }
        frame 23 { x: 18.5; y: 61.2; skew-x: -0.9; skew-y: -1.2; scale-x: 0.607; scale-y: 0.604; }
        frame 24 { x: 18.7; y: 60.5; skew-x: 1.3; skew-y: 1; scale-x: 0.621; scale-y: 0.616; }
        frame 25 { x: 19; y: 59.9; skew-x: 3.5; skew-y: 3.5; scale-x: 0.635; scale-y: 0.627; }
        frame 26 { x: 19.2; y: 59.4; skew-x: 5.8; skew-y: 5.8; scale-x: 0.648; scale-y: 0.639; }
        frame 27 { x: 19.5; y: 58.5; skew-x: 8.3; skew-y: 8.3; scale-x: 0.662; scale-y: 0.65; }
        frame 28 { x: 19.3; y: 59; skew-x: 6.8; skew-y: 6.8; scale-x: 0.644; scale-y: 0.634; }
        frame 29 { x: -10000; y: 59.5; skew-x: 5.5; skew-y: 5.5; scale-x: 0.626; scale-y: 0.618; }
        frame 30 { y: 60; skew-x: 4; skew-y: 4; scale-x: 0.609; scale-y: 0.603; }
        frame 31 { y: 60.5; skew-x: 2.8; skew-y: 2.8; scale-x: 0.591; scale-y: 0.587; }
        frame 32 { x: 19.2; y: 61; skew-x: 1.3; skew-y: 1.3; scale-x: 0.573; scale-y: 0.571; }
        frame 33 { x: 19.4; y: 61.6; skew-x: 0; skew-y: 0; scale-x: 0.555; scale-y: 0.555; }
    }
    Track {
        source-name: "Sunflower_double_petals1";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 36.9; y: -3.2; scale-x: 0.6; scale-y: 0.6; cel: 0; image: IMAGE_REANIM_SUNFLOWER_DOUBLE_PETALS; }
        frame 10 { x: 36.4; y: -4; scale-x: 0.59; scale-y: 0.611; cel: -10000; image: none; }
        frame 11 { x: 36; y: -4.8; scale-x: 0.58; scale-y: 0.623; }
        frame 12 { x: 34.9; y: -5.3; scale-x: 0.585; scale-y: 0.617; }
        frame 13 { x: 34; y: -5.6; scale-x: 0.59; scale-y: 0.611; }
        frame 14 { x: 32.9; y: -6.1; scale-x: 0.595; scale-y: 0.606; }
        frame 15 { x: 31.9; y: -6.5; scale-x: 0.6; scale-y: 0.6; }
        frame 16 { x: 30.9; y: -10000; scale-x: -10000; scale-y: 0.596; }
        frame 17 { x: 29.8; scale-y: 0.592; }
        frame 18 { x: 28.7; y: -5.5; scale-y: 0.594; }
        frame 19 { x: 27.7; y: -4.5; scale-y: 0.596; }
        frame 20 { x: 26.6; y: -3.5; scale-y: 0.598; }
        frame 21 { x: 25.5; y: -2.6; scale-y: 0.6; }
        frame 22 { x: 26.6; y: -3.3; scale-y: 0.596; }
        frame 23 { x: 27.7; y: -4; scale-y: 0.592; }
        frame 24 { x: 28.8; y: -4.7; scale-y: 0.594; }
        frame 25 { x: 29.8; y: -5.5; scale-y: 0.596; }
        frame 26 { x: 30.8; y: -6.2; scale-y: 0.598; }
        frame 27 { x: 31.9; y: -6.9; scale-y: 0.6; }
        frame 28 { x: 32.7; y: -6.5; scale-y: 0.595; }
        frame 29 { x: 33.5; y: -6.3; scale-y: 0.59; }
        frame 30 { x: 34.4; y: -5.5; scale-y: 0.593; }
        frame 31 { x: 35.2; y: -4.8; scale-y: 0.595; }
        frame 32 { x: 36; y: -4; scale-y: 0.598; }
        frame 33 { x: 36.9; y: -3.2; scale-y: 0.6; }
    }
    Track {
        source-name: "anim_face2";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 43.4; y: 2; scale-x: 0.6; scale-y: 0.534; cel: 0; image: IMAGE_REANIM_SUNFLOWER_HEAD; }
        frame 10 { x: 42.6; y: 1.2; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { x: 41.8; y: 0.4; }
        frame 12 { x: 40.9; y: 0; }
        frame 13 { x: 40.1; y: -0.3; }
        frame 14 { x: 39.3; y: -0.7; }
        frame 15 { x: 38.4; y: -1.1; }
        frame 16 { x: 37.4; y: -0.5; }
        frame 17 { x: 36.3; y: 0.1; }
        frame 18 { x: 35.2; y: 0.7; }
        frame 19 { x: 34.1; y: 1.3; }
        frame 20 { x: 33; y: 2; }
        frame 21 { x: 32; y: 2.6; }
        frame 22 { x: 33; y: 1.9; }
        frame 23 { x: 34.1; y: 1.2; }
        frame 24 { x: 35.2; y: 0.5; }
        frame 25 { x: 36.3; y: -0.1; }
        frame 26 { x: 37.4; y: -0.8; }
        frame 27 { x: 38.4; y: -1.5; }
        frame 28 { x: 39.3; y: -0.9; }
        frame 29 { x: 40; y: -0.3; }
        frame 30 { x: 40.9; y: 0.2; }
        frame 31 { x: 41.8; y: 0.8; }
        frame 32 { x: 42.5; y: 1.4; }
        frame 33 { x: 43.4; y: 2; }
    }
    Track {
        source-name: "Sunflower_double_petals2";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: -3.8; y: 14.1; scale-x: 0.6; scale-y: 0.6; cel: 0; image: IMAGE_REANIM_SUNFLOWER_DOUBLE_PETALS; }
        frame 10 { x: -2; y: 13.2; scale-x: 0.584; scale-y: 0.609; cel: -10000; image: none; }
        frame 11 { x: -0.2; y: 12.3; scale-x: 0.568; scale-y: 0.617; }
        frame 12 { x: 0.4; y: 11.4; scale-x: 0.576; scale-y: 0.613; }
        frame 13 { x: 1.2; y: 10.5; scale-x: 0.584; scale-y: 0.609; }
        frame 14 { x: 1.9; y: 9.6; scale-x: 0.592; scale-y: 0.604; }
        frame 15 { x: 2.6; y: 8.7; scale-x: 0.6; scale-y: 0.6; }
        frame 16 { x: 3.5; y: 9.1; scale-x: -10000; scale-y: 0.593; }
        frame 17 { x: 4.3; y: 9.4; scale-y: 0.586; }
        frame 18 { x: 5.1; y: 10.7; scale-y: 0.59; }
        frame 19 { x: 6; y: 11.9; scale-y: 0.593; }
        frame 20 { x: 6.8; y: 13.2; scale-y: 0.597; }
        frame 21 { x: 7.6; y: 14.4; scale-y: 0.6; }
        frame 22 { x: 6.8; y: 14; scale-y: 0.596; }
        frame 23 { x: 6; y: 13.5; scale-y: 0.592; }
        frame 24 { x: 5.1; y: 12.3; scale-y: 0.594; }
        frame 25 { x: 4.3; y: 11.1; scale-y: 0.596; }
        frame 26 { x: 3.5; y: 9.9; scale-y: 0.598; }
        frame 27 { x: 2.6; y: 8.7; scale-y: 0.6; }
        frame 28 { x: 1.5; y: 9.1; scale-y: 0.598; }
        frame 29 { x: 0.4; y: 9.5; scale-y: 0.596; }
        frame 30 { x: -0.5; y: 10.7; scale-y: 0.597; }
        frame 31 { x: -1.6; y: 11.8; scale-y: 0.598; }
        frame 32 { x: -2.7; y: 13; scale-y: 0.599; }
        frame 33 { x: -3.8; y: 14.1; scale-y: 0.6; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 2.6; y: 19.5; scale-x: 0.6; scale-y: 0.534; cel: 0; image: IMAGE_REANIM_SUNFLOWER_HEAD; }
        frame 10 { x: 3.7; y: 18.6; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { x: 4.8; y: 17.7; }
        frame 12 { x: 5.9; y: 16.8; }
        frame 13 { x: 7; y: 15.9; }
        frame 14 { x: 8.1; y: 15; }
        frame 15 { x: 9.2; y: 14.1; }
        frame 16 { x: 10; y: 15; }
        frame 17 { x: 10.8; y: 16; }
        frame 18 { x: 11.7; y: 17; }
        frame 19 { x: 12.5; y: 17.9; }
        frame 20 { x: 13.3; y: 18.9; }
        frame 21 { x: 14.2; y: 19.8; }
        frame 22 { x: 13.3; y: 18.9; }
        frame 23 { x: 12.5; y: 17.9; }
        frame 24 { x: 11.7; y: 17; }
        frame 25 { x: 10.8; y: 16; }
        frame 26 { x: 10; y: 15; }
        frame 27 { x: 9.2; y: 14.1; }
        frame 28 { x: 8.1; y: 15; }
        frame 29 { x: 7; y: 15.9; }
        frame 30 { x: 5.9; y: 16.8; }
        frame 31 { x: 4.8; y: 17.7; }
        frame 32 { x: 3.7; y: 18.6; }
        frame 33 { x: 2.6; y: 19.5; }
    }
    Track {
        source-name: "SunFlower_blink";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 12.2; y: 24; scale-x: 0.6; scale-y: 0.6; cel: 0; image: IMAGE_REANIM_SUNFLOWER_BLINK2; }
        frame 6 { x: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_SUNFLOWER_BLINK1; }
        frame 7 { image: IMAGE_REANIM_SUNFLOWER_BLINK2; }
        frame 8 { y: -10000; cel: -1; image: none; }
        frame 9 { cel: -10000; }
    }
    Track {
        source-name: "SunFlower_blink2";
        frame-count: 34;
        frame 0 { cel: -1; }
        frame 1 { x: 52.9; y: 6.7; scale-x: 0.6; scale-y: 0.6; cel: 0; image: IMAGE_REANIM_SUNFLOWER_BLINK2; }
        frame 2 { x: -10000; y: 6.4; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_SUNFLOWER_BLINK1; }
        frame 3 { y: 6.7; image: IMAGE_REANIM_SUNFLOWER_BLINK2; }
        frame 4 { y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
}
