export component PuffShroom {
    fps: 12;
    Track {
        source-name: "anim_sleep";
        frame-count: 51;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 34 { cel: 0; }
        frame 35 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 51;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { cel: 0; }
        frame 22 { cel: -10000; }
        frame 34 { cel: -1; }
        frame 35 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 51;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { cel: 0; }
        frame 5 { cel: -10000; }
        frame 21 { cel: -1; }
        frame 22 { cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 51;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 29.3; y: 46.6; scale-x: 0.44; scale-y: 0.44; cel: 0; image: IMAGE_REANIM_PUFFSHROOM_BODY; }
        frame 5 { x: -10000; y: 46.9; scale-x: -10000; scale-y: 0.43; cel: -10000; image: none; }
        frame 6 { y: 47.3; scale-y: 0.421; }
        frame 7 { y: 47.6; scale-y: 0.411; }
        frame 8 { y: 48; scale-y: 0.402; }
        frame 9 { y: 47.7; scale-y: 0.411; }
        frame 10 { y: 47.4; scale-y: 0.421; }
        frame 11 { y: 47; scale-y: 0.43; }
        frame 12 { y: 46.6; scale-y: 0.44; }
        frame 13 { y: 46.3; scale-y: 0.449; }
        frame 14 { y: 46; scale-y: 0.457; }
        frame 15 { y: 45.7; scale-y: 0.466; }
        frame 16 { y: 45.4; scale-y: 0.474; }
        frame 17 { y: 45.8; scale-y: 0.466; }
        frame 18 { y: 46; scale-y: 0.457; }
        frame 19 { y: 46.4; scale-y: 0.449; }
        frame 20 { y: 46.6; scale-y: 0.44; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 22 { x: 29.1; skew-y: -0.9; scale-x: 0.436; }
        frame 23 { x: 29; skew-y: -1.9; scale-x: 0.431; scale-y: 0.441; }
        frame 24 { x: 28.7; skew-y: -2.9; scale-x: 0.427; scale-y: -10000; }
        frame 25 { x: 28.5; skew-y: -3.9; scale-x: 0.423; }
        frame 26 { x: 28.3; skew-y: -5.1; scale-x: 0.419; scale-y: 0.442; }
        frame 27 { x: 28.6; y: 46.9; skew-y: -2.4; scale-x: 0.434; scale-y: 0.43; }
        frame 28 { x: 28.8; y: 47.1; skew-y: 0; scale-x: 0.449; scale-y: 0.419; }
        frame 29 { x: 28.9; y: 47.5; skew-y: 2.3; scale-x: 0.464; scale-y: 0.407; }
        frame 30 { x: 29; y: 47.8; skew-y: 5; scale-x: 0.48; scale-y: 0.396; }
        frame 31 { x: 29.2; y: 47.4; skew-y: 3.3; scale-x: 0.466; scale-y: 0.41; }
        frame 32 { x: 29.3; y: 47; skew-y: 1.5; scale-x: 0.453; scale-y: 0.425; }
        frame 33 { x: -10000; y: 46.6; skew-y: 0; scale-x: 0.44; scale-y: 0.44; }
        frame 34 { y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 35 { y: 46.9; scale-y: 0.43; }
        frame 36 { y: 47.3; scale-y: 0.421; }
        frame 37 { y: 47.6; scale-y: 0.411; }
        frame 38 { y: 48; scale-y: 0.402; }
        frame 39 { y: 47.7; scale-y: 0.411; }
        frame 40 { y: 47.4; scale-y: 0.421; }
        frame 41 { y: 47; scale-y: 0.43; }
        frame 42 { y: 46.6; scale-y: 0.44; }
        frame 43 { y: 46.3; scale-y: 0.449; }
        frame 44 { y: 46; scale-y: 0.457; }
        frame 45 { y: 45.7; scale-y: 0.466; }
        frame 46 { y: 45.4; scale-y: 0.474; }
        frame 47 { y: 45.8; scale-y: 0.466; }
        frame 48 { y: 46; scale-y: 0.457; }
        frame 49 { y: 46.4; scale-y: 0.449; }
        frame 50 { y: 46.6; scale-y: 0.44; }
    }
    Track {
        source-name: "PuffShroom_stem";
        frame-count: 51;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 47.6; y: 51; scale-x: 0.45; scale-y: 0.45; cel: 0; image: IMAGE_REANIM_PUFFSHROOM_STEM; }
        frame 5 { x: -10000; y: 51.3; scale-x: -10000; scale-y: 0.44; cel: -10000; image: none; }
        frame 6 { y: 51.5; scale-y: 0.431; }
        frame 7 { y: 51.8; scale-y: 0.421; }
        frame 8 { y: 52; scale-y: 0.411; }
        frame 9 { y: 51.5; skew-x: 17.7; scale-x: 0.472; scale-y: 0.419; }
        frame 10 { x: 47.5; y: 51.3; skew-x: 11.8; scale-x: 0.465; scale-y: 0.429; }
        frame 11 { x: 47.6; y: 51.1; skew-x: 5.8; scale-x: 0.457; scale-y: 0.44; }
        frame 12 { x: -10000; y: 51; skew-x: 0; scale-x: 0.45; scale-y: 0.45; }
        frame 13 { y: 50.8; skew-x: -10000; scale-x: -10000; scale-y: 0.459; }
        frame 14 { y: 50.6; scale-y: 0.468; }
        frame 15 { y: 50.4; scale-y: 0.476; }
        frame 16 { y: 50.1; scale-y: 0.485; }
        frame 17 { y: 50.7; skew-x: -13; scale-x: 0.462; scale-y: 0.478; }
        frame 18 { y: 50.8; skew-x: -8.5; scale-x: 0.458; scale-y: 0.469; }
        frame 19 { y: 50.9; skew-x: -4.2; scale-x: 0.454; scale-y: 0.459; }
        frame 20 { y: 51; skew-x: 0; scale-x: 0.45; scale-y: 0.45; }
        frame 21 { y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 22 { scale-x: 0.402; }
        frame 23 { scale-x: 0.354; }
        frame 24 { scale-x: 0.307; }
        frame 25 { scale-x: 0.259; }
        frame 26 { scale-x: 0.211; }
        frame 27 { x: 46.6; y: 51.3; scale-x: 0.518; scale-y: 0.436; }
        frame 28 { x: 45.6; y: 51.5; scale-x: 0.825; scale-y: 0.421; }
        frame 29 { x: 44.6; y: 51.7; scale-x: 1.132; scale-y: 0.407; }
        frame 30 { x: 44; y: 51.9; scale-x: 1.439; scale-y: 0.393; }
        frame 31 { x: 45.2; y: 51.6; scale-x: 1.109; scale-y: 0.412; }
        frame 32 { x: 46.5; y: 51.3; scale-x: 0.78; scale-y: 0.431; }
        frame 33 { x: 47.6; y: 51; scale-x: 0.45; scale-y: 0.45; }
        frame 34 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 35 { y: 51.3; scale-y: 0.44; }
        frame 36 { y: 51.5; scale-y: 0.431; }
        frame 37 { y: 51.8; scale-y: 0.421; }
        frame 38 { y: 52; scale-y: 0.411; }
        frame 39 { y: 51.5; skew-x: 17.7; scale-x: 0.472; scale-y: 0.419; }
        frame 40 { x: 47.5; y: 51.3; skew-x: 11.8; scale-x: 0.465; scale-y: 0.429; }
        frame 41 { x: 47.6; y: 51.1; skew-x: 5.8; scale-x: 0.457; scale-y: 0.44; }
        frame 42 { x: -10000; y: 51; skew-x: 0; scale-x: 0.45; scale-y: 0.45; }
        frame 43 { y: 50.8; skew-x: -10000; scale-x: -10000; scale-y: 0.459; }
        frame 44 { y: 50.6; scale-y: 0.468; }
        frame 45 { y: 50.4; scale-y: 0.476; }
        frame 46 { y: 50.1; scale-y: 0.485; }
        frame 47 { y: 50.7; skew-x: -13; scale-x: 0.462; scale-y: 0.478; }
        frame 48 { y: 50.8; skew-x: -8.5; scale-x: 0.458; scale-y: 0.469; }
        frame 49 { y: 50.9; skew-x: -4.2; scale-x: 0.454; scale-y: 0.459; }
        frame 50 { y: 51; skew-x: 0; scale-x: 0.45; scale-y: 0.45; }
    }
    Track {
        source-name: "PuffShroom_tip";
        frame-count: 51;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 49.4; y: 48.8; scale-x: 0.45; scale-y: 0.45; cel: 0; image: IMAGE_REANIM_PUFFSHROOM_TIP; }
        frame 5 { x: -10000; y: 49; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { y: 49.1; }
        frame 7 { y: 49.4; }
        frame 8 { y: 49.5; }
        frame 9 { y: 49.9; }
        frame 10 { y: 49.5; }
        frame 11 { y: 49.2; }
        frame 12 { y: 48.8; }
        frame 13 { y: 48.6; }
        frame 14 { y: 48.5; }
        frame 15 { y: 48.3; }
        frame 16 { y: 48.1; }
        frame 17 { y: 47.9; }
        frame 18 { y: 48.2; }
        frame 19 { y: 48.5; }
        frame 20 { y: 48.8; }
        frame 21 { y: -10000; }
        frame 22 { x: 48.8; scale-x: 0.432; }
        frame 23 { x: 48.1; skew-x: -0; scale-x: 0.413; }
        frame 24 { x: 47.5; y: 48.9; skew-x: -0.2; scale-x: 0.395; }
        frame 25 { x: 46.9; y: -10000; skew-x: -10000; scale-x: 0.377; }
        frame 26 { x: 46.2; y: 48.8; skew-x: -0.4; scale-x: 0.358; }
        frame 27 { x: 47.5; y: 48.6; skew-x: -0.2; scale-x: 0.399; scale-y: 0.47; }
        frame 28 { x: 48.9; y: 48.4; skew-x: -10000; scale-x: 0.44; scale-y: 0.491; }
        frame 29 { x: 50.2; y: 48.2; skew-x: 0; scale-x: 0.481; scale-y: 0.511; }
        frame 30 { x: 51.5; y: 48.1; skew-x: -10000; scale-x: 0.522; scale-y: 0.532; }
        frame 31 { x: 50.8; y: 48.4; scale-x: 0.498; scale-y: 0.505; }
        frame 32 { x: 50.1; y: 48.5; scale-x: 0.474; scale-y: 0.477; }
        frame 33 { x: 49.4; y: 48.8; scale-x: 0.45; scale-y: 0.45; }
        frame 34 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 35 { y: 49; }
        frame 36 { y: 49.1; }
        frame 37 { y: 49.4; }
        frame 38 { y: 49.5; }
        frame 39 { y: 49.9; }
        frame 40 { y: 49.5; }
        frame 41 { y: 49.2; }
        frame 42 { y: 48.8; }
        frame 43 { y: 48.6; }
        frame 44 { y: 48.5; }
        frame 45 { y: 48.3; }
        frame 46 { y: 48.1; }
        frame 47 { y: 47.9; }
        frame 48 { y: 48.2; }
        frame 49 { y: 48.5; }
        frame 50 { y: 48.8; }
    }
    Track {
        source-name: "PuffShroom_head";
        frame-count: 51;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 22.4; y: 28.4; scale-x: 0.44; scale-y: 0.44; cel: 0; image: IMAGE_REANIM_PUFFSHROOM_HEAD; }
        frame 5 { x: 22.2; y: 29; scale-x: 0.444; scale-y: 0.431; cel: -10000; image: none; }
        frame 6 { x: 22.1; y: 29.6; scale-x: 0.448; scale-y: 0.422; }
        frame 7 { x: 21.9; y: 30.3; scale-x: 0.451; scale-y: 0.413; }
        frame 8 { x: 21.8; y: 30.9; scale-x: 0.455; scale-y: 0.405; }
        frame 9 { x: -10000; y: 31.3; scale-x: -10000; scale-y: 0.394; }
        frame 10 { x: 22; y: 30.3; scale-x: 0.45; scale-y: 0.409; }
        frame 11 { x: 22.2; y: 29.3; scale-x: 0.445; scale-y: 0.425; }
        frame 12 { x: 22.4; y: 28.4; scale-x: 0.44; scale-y: 0.44; }
        frame 13 { x: 22.5; y: 27.8; scale-x: 0.437; scale-y: 0.449; }
        frame 14 { x: 22.6; y: 27.2; scale-x: 0.434; scale-y: 0.458; }
        frame 15 { x: 22.7; y: 26.6; scale-x: 0.43; scale-y: 0.467; }
        frame 16 { x: 22.9; y: 26; scale-x: 0.427; scale-y: 0.475; }
        frame 17 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 22.7; y: 26.8; scale-x: 0.432; scale-y: 0.464; }
        frame 19 { x: 22.5; y: 27.6; scale-x: 0.436; scale-y: 0.452; }
        frame 20 { x: 22.4; y: 28.4; scale-x: 0.44; scale-y: 0.44; }
        frame 21 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 22 { x: 21.8; y: 27.9; skew-y: -1.2; scale-x: 0.436; scale-y: 0.45; }
        frame 23 { x: 21.3; y: 27.4; skew-y: -2.4; scale-x: 0.432; scale-y: 0.46; }
        frame 24 { x: 20.8; y: 27; skew-y: -3.7; scale-x: 0.428; scale-y: 0.47; }
        frame 25 { x: 20.2; y: 26.5; skew-y: -4.9; scale-x: 0.424; scale-y: 0.481; }
        frame 26 { x: 19.6; y: 26.1; skew-y: -6.3; scale-x: 0.42; scale-y: 0.491; }
        frame 27 { x: 19; y: 27.4; skew-x: -2.7; skew-y: -9.1; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 20.5; y: 28.7; skew-x: -1.7; skew-y: -5.9; scale-x: 0.432; scale-y: 0.456; }
        frame 29 { x: 22; y: 30; skew-x: -0.7; skew-y: -2.9; scale-x: 0.445; scale-y: 0.421; }
        frame 30 { x: 23.4; y: 31.4; skew-x: 0; skew-y: 0; scale-x: 0.458; scale-y: 0.387; }
        frame 31 { x: 24.4; y: 31.1; skew-x: -10000; skew-y: -10000; scale-x: 0.442; scale-y: 0.397; }
        frame 32 { x: 23.4; y: 29.8; scale-x: 0.441; scale-y: 0.418; }
        frame 33 { x: 22.4; y: 28.4; scale-x: 0.44; scale-y: 0.44; }
        frame 34 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 22.2; y: 29; scale-x: 0.444; scale-y: 0.431; }
        frame 36 { x: 22.1; y: 29.6; scale-x: 0.448; scale-y: 0.422; }
        frame 37 { x: 21.9; y: 30.3; scale-x: 0.451; scale-y: 0.413; }
        frame 38 { x: 21.8; y: 30.9; scale-x: 0.455; scale-y: 0.405; }
        frame 39 { x: -10000; y: 31.3; scale-x: -10000; scale-y: 0.394; }
        frame 40 { x: 22; y: 30.3; scale-x: 0.45; scale-y: 0.409; }
        frame 41 { x: 22.2; y: 29.3; scale-x: 0.445; scale-y: 0.425; }
        frame 42 { x: 22.4; y: 28.4; scale-x: 0.44; scale-y: 0.44; }
        frame 43 { x: 22.5; y: 27.8; scale-x: 0.437; scale-y: 0.449; }
        frame 44 { x: 22.6; y: 27.2; scale-x: 0.434; scale-y: 0.458; }
        frame 45 { x: 22.7; y: 26.6; scale-x: 0.43; scale-y: 0.467; }
        frame 46 { x: 22.9; y: 26; scale-x: 0.427; scale-y: 0.475; }
        frame 47 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 22.7; y: 26.8; scale-x: 0.432; scale-y: 0.464; }
        frame 49 { x: 22.5; y: 27.6; scale-x: 0.436; scale-y: 0.452; }
        frame 50 { x: 22.4; y: 28.4; scale-x: 0.44; scale-y: 0.44; }
    }
    Track {
        source-name: "PuffShroom_eyes";
        frame-count: 51;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 29 { x: 44.6; y: 49.8; scale-x: 0.44; scale-y: 0.401; cel: 0; image: IMAGE_REANIM_PUFFSHROOM_BLINK1; }
        frame 30 { x: 44.9; y: 49.9; scale-x: -10000; scale-y: 0.417; cel: -10000; image: IMAGE_REANIM_PUFFSHROOM_BLINK2; }
        frame 31 { x: -10000; y: 49.8; scale-y: -10000; image: IMAGE_REANIM_PUFFSHROOM_BLINK1; }
        frame 32 { y: -10000; cel: -1; image: none; }
        frame 33 { cel: -10000; }
        frame 34 { x: 43.9; y: 49.3; scale-y: 0.455; cel: 0; image: IMAGE_REANIM_PUFFSHROOM_BLINK2; }
        frame 35 { x: -10000; y: 49.5; scale-y: 0.459; cel: -10000; image: none; }
        frame 36 { y: 49.6; scale-y: 0.463; }
        frame 37 { y: 49.9; scale-y: 0.467; }
        frame 38 { y: 50; scale-y: 0.471; }
        frame 39 { y: -10000; scale-y: 0.44; }
        frame 40 { y: 49.8; scale-y: 0.445; }
        frame 41 { y: 49.5; scale-y: 0.45; }
        frame 42 { y: 49.3; scale-y: 0.455; }
        frame 43 { y: 49; scale-y: 0.459; }
        frame 44 { y: 48.8; scale-y: 0.463; }
        frame 45 { y: 48.6; scale-y: 0.467; }
        frame 46 { y: 48.4; scale-y: 0.471; }
        frame 47 { y: 48.5; scale-y: -10000; }
        frame 48 { y: 48.9; scale-y: 0.466; }
        frame 49 { y: 49; scale-y: 0.461; }
        frame 50 { y: 49.3; scale-y: 0.455; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 51;
        frame 0 { cel: -1; }
        frame 1 { x: 43.9; y: 49.2; scale-x: 0.44; scale-y: 0.44; cel: 0; image: IMAGE_REANIM_PUFFSHROOM_BLINK1; }
        frame 2 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 3 { cel: 0; }
        frame 4 { cel: -1; }
        frame 5 { cel: -10000; }
    }
}
