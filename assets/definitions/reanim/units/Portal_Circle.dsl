export component Portal_Circle {
    fps: 12;
    Track {
        source-name: "anim_appear";
        frame-count: 61;
        frame 17 { cel: -1; }
        frame 18 { cel: -10000; }
    }
    Track {
        source-name: "anim_pulse";
        frame-count: 61;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 17 { cel: 0; }
        frame 18 { cel: -10000; }
        frame 31 { cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "anim_pulse_reverse";
        frame-count: 61;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 31 { cel: 0; }
        frame 32 { cel: -10000; }
        frame 45 { cel: -1; }
        frame 46 { cel: -10000; }
    }
    Track {
        source-name: "anim_dissapear";
        frame-count: 61;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 45 { cel: 0; }
        frame 46 { cel: -10000; }
    }
    Track {
        source-name: "Portal_Cirlce_glow";
        frame-count: 61;
        frame 0 { x: 41; y: 100.6; scale-x: 0.047; scale-y: 0.054; image: IMAGE_REANIM_PORTAL_CIRCLE_GLOW; }
        frame 1 { x: 40.9; y: 83.3; scale-x: -10000; scale-y: 0.273; image: none; }
        frame 2 { x: 40.6; y: 66; scale-y: 0.491; }
        frame 3 { x: 40.4; y: 48.7; scale-y: 0.71; }
        frame 4 { x: 40.2; y: 31.4; scale-y: 0.929; }
        frame 5 { x: 40.3; y: 36.4; scale-y: 0.879; }
        frame 6 { x: 40.4; y: 41.3; scale-y: 0.829; }
        frame 7 { x: 26; y: 34.9; scale-x: 0.447; scale-y: 0.886; }
        frame 8 { x: 11.6; y: 28.5; scale-x: 0.848; scale-y: 0.943; }
        frame 9 { x: -2.6; y: 22.1; scale-x: 1.248; scale-y: 1; }
        frame 10 { x: 2; y: 22.3; scale-x: 1.124; scale-y: -10000; }
        frame 11 { x: 6.8; y: 22.5; scale-x: 1; }
        frame 12 { x: -10000; y: -10000; scale-x: -10000; }
        frame 18 { y: 22.4; }
        frame 19 { y: -10000; }
        frame 20 { y: 22.3; }
        frame 21 { y: 22.2; }
        frame 22 { y: -10000; }
        frame 23 { y: 22.1; }
        frame 24 { y: 22.2; }
        frame 25 { y: -10000; }
        frame 26 { y: 22.3; }
        frame 27 { y: -10000; }
        frame 28 { y: 22.4; }
        frame 29 { y: -10000; }
        frame 30 { y: 22.5; }
        frame 31 { y: -10000; }
        frame 32 { y: 22.4; }
        frame 33 { y: -10000; }
        frame 34 { y: 22.3; }
        frame 35 { y: -10000; }
        frame 36 { y: 22.2; }
        frame 37 { y: -10000; }
        frame 38 { y: 22.1; }
        frame 39 { y: 22.2; }
        frame 40 { y: -10000; }
        frame 41 { y: 22.3; }
        frame 42 { y: 22.4; }
        frame 43 { y: -10000; }
        frame 44 { y: 22.5; }
        frame 45 { y: -10000; }
        frame 51 { x: -2.6; y: 22.1; scale-x: 1.248; }
        frame 52 { x: 11.7; y: 28.5; scale-x: 0.848; scale-y: 0.943; }
        frame 53 { x: 26; y: 34.9; scale-x: 0.447; scale-y: 0.886; }
        frame 54 { x: 40.4; y: 41.3; scale-x: 0.047; scale-y: 0.829; }
        frame 55 { x: 40.3; y: 36.3; scale-x: -10000; scale-y: 0.879; }
        frame 56 { x: 40.2; y: 31.4; scale-y: 0.929; }
        frame 57 { x: 40.6; y: 66; scale-y: 0.491; }
        frame 58 { x: 41; y: 100.6; scale-y: 0.054; }
        frame 59 { x: -10000; y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Portal_Circle_center";
        frame-count: 61;
        frame 0 { x: 41.8; y: 101.6; scale-x: 0.047; scale-y: 0.054; image: IMAGE_REANIM_PORTAL_CIRCLE_CENTER; }
        frame 1 { x: 41.3; y: 87.1; skew-x: 45; scale-x: 0.058; scale-y: 0.273; image: none; }
        frame 2 { x: 42; y: 73; skew-x: 90; scale-x: 0.068; scale-y: 0.491; }
        frame 3 { x: 41.1; y: 101.2; skew-x: -10000; scale-x: 0.048; scale-y: 0.349; }
        frame 4 { x: 43.5; y: 49; skew-x: 180; scale-x: 0.089; scale-y: 0.929; }
        frame 5 { x: 43.6; y: 52.3; skew-x: -10000; scale-x: -10000; scale-y: 0.879; }
        frame 6 { x: 43.7; y: 55.5; scale-y: 0.829; }
        frame 7 { x: 50.4; y: 50.4; scale-x: 0.476; scale-y: 0.886; }
        frame 8 { x: 57.1; y: 45.3; scale-x: 0.862; scale-y: 0.943; }
        frame 9 { x: 63.9; y: 40.2; scale-x: 1.248; scale-y: 1; }
        frame 10 { x: 61.4; y: -10000; scale-x: 1.124; scale-y: -10000; }
        frame 11 { x: 58.9; scale-x: 1; }
        frame 12 { x: -10000; scale-x: -10000; }
        frame 51 { x: 63.9; scale-x: 1.248; }
        frame 52 { x: 57.1; y: 45.3; scale-x: 0.862; scale-y: 0.943; }
        frame 53 { x: 50.5; y: 50.5; scale-x: 0.476; scale-y: 0.886; }
        frame 54 { x: 43.7; y: 55.5; scale-x: 0.089; scale-y: 0.829; }
        frame 55 { x: 43.6; y: 52.2; scale-x: -10000; scale-y: 0.879; }
        frame 56 { x: 43.5; y: 49; scale-y: 0.929; }
        frame 57 { x: 43.1; y: 60; skew-x: 135; scale-x: 0.079; scale-y: 0.71; }
        frame 58 { x: 42; y: 73; skew-x: 90; scale-x: 0.068; scale-y: 0.491; }
        frame 59 { x: 42.8; y: 103.4; skew-x: -10000; scale-x: 0.019; scale-y: 0.134; }
        frame 60 { x: 41.8; y: 101.6; skew-x: 0; scale-x: 0.047; scale-y: 0.054; }
    }
    Track {
        source-name: "Portal_Circle_outer";
        frame-count: 61;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: -36.5; y: -8.9; scale-x: 1.248; cel: 0; alpha: 0; image: IMAGE_REANIM_PORTAL_CIRCLE_OUTER; }
        frame 10 { x: -14; y: 4.6; scale-x: 1.124; cel: -10000; alpha: -10000; image: none; }
        frame 11 { x: 8.4; y: 18.3; scale-x: 1; }
        frame 12 { x: -10000; y: -10000; scale-x: -10000; alpha: 0.2; }
        frame 13 { alpha: 0.4; }
        frame 14 { alpha: 0.6; }
        frame 15 { alpha: 0.8; }
        frame 16 { alpha: 1; }
        frame 17 { alpha: -10000; }
        frame 18 { alpha: 0.92; }
        frame 19 { alpha: 0.84; }
        frame 20 { alpha: 0.76; }
        frame 21 { alpha: 0.68; }
        frame 22 { alpha: 0.6; }
        frame 23 { alpha: 0.52; }
        frame 24 { alpha: 0.59; }
        frame 25 { alpha: 0.66; }
        frame 26 { alpha: 0.73; }
        frame 27 { alpha: 0.79; }
        frame 28 { alpha: 0.86; }
        frame 29 { alpha: 0.93; }
        frame 30 { alpha: 1; }
        frame 31 { alpha: -10000; }
        frame 32 { alpha: 0.93; }
        frame 33 { alpha: 0.86; }
        frame 34 { alpha: 0.79; }
        frame 35 { alpha: 0.73; }
        frame 36 { alpha: 0.66; }
        frame 37 { alpha: 0.59; }
        frame 38 { alpha: 0.52; }
        frame 39 { alpha: 0.6; }
        frame 40 { alpha: 0.68; }
        frame 41 { alpha: 0.76; }
        frame 42 { alpha: 0.84; }
        frame 43 { alpha: 0.92; }
        frame 44 { alpha: 1; }
        frame 45 { alpha: -10000; }
        frame 46 { alpha: 0.75; }
        frame 47 { alpha: 0.5; }
        frame 48 { alpha: 0.25; }
        frame 49 { alpha: 0; }
        frame 50 { x: -13.9; y: 4.6; scale-x: 1.124; alpha: -10000; }
        frame 51 { x: -36.5; y: -8.9; scale-x: 1.248; }
        frame 52 { x: -10000; y: -10000; scale-x: -10000; cel: -1; }
        frame 53 { cel: -10000; }
    }
}
