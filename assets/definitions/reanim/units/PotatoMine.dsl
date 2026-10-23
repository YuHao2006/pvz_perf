export component PotatoMine {
    fps: 12;
    Track {
        source-name: "anim_armed";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 20 { cel: 0; }
        frame 21 { cel: -10000; }
        frame 31 { cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "anim_rise";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: 0; }
        frame 2 { cel: -10000; }
        frame 20 { cel: -1; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 37;
        frame 1 { cel: -1; }
        frame 2 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 32 { cel: 0; }
        frame 33 { cel: -10000; }
        frame 35 { cel: -1; }
        frame 36 { cel: -10000; }
    }
    Track {
        source-name: "anim_mashed";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 36 { x: -2.4; y: 22.3; scale-x: 0.64; scale-y: 0.64; cel: 0; image: IMAGE_REANIM_POTATOMINE_MASHED; }
    }
    Track {
        source-name: "PotatoMine_rock4";
        frame-count: 37;
        frame 0 { x: 38.6; y: 62.6; scale-x: 0.59; scale-y: 0.59; image: IMAGE_REANIM_POTATOMINE_ROCK4; }
        frame 1 { x: -10000; y: 63.1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 63.6; }
        frame 3 { y: 63.1; }
        frame 4 { y: 62.6; }
        frame 5 { y: 63.1; }
        frame 6 { y: 63.6; }
        frame 7 { y: 63.1; }
        frame 8 { y: 62.6; }
        frame 9 { y: -10000; }
        frame 11 { x: 43.1; y: 62.3; }
        frame 12 { x: 47.6; y: 61.9; }
        frame 13 { x: 52.1; y: 61.5; }
        frame 14 { x: 56.7; y: 61.1; }
        frame 15 { x: 61.2; y: 60.8; }
        frame 16 { x: -10000; y: -10000; }
        frame 31 { cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock2";
        frame-count: 37;
        frame 0 { x: 23.9; y: 61.8; scale-x: 0.7; scale-y: 0.7; image: IMAGE_REANIM_POTATOMINE_ROCK2; }
        frame 1 { x: -10000; y: 59.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 61.8; }
        frame 3 { y: 59.8; }
        frame 4 { y: 61.8; }
        frame 5 { y: 59.8; }
        frame 6 { y: 61.8; }
        frame 7 { y: 59.8; }
        frame 8 { y: 61.8; }
        frame 9 { y: -10000; }
        frame 11 { x: 17.7; y: 61.5; }
        frame 12 { x: 11.5; y: 61.3; }
        frame 13 { x: 5.3; y: 61; }
        frame 14 { x: -0.8; y: 60.7; }
        frame 15 { x: -7; y: 60.4; }
        frame 16 { x: -10000; y: -10000; }
        frame 31 { cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 10 { x: 25; y: 67.3; scale-x: 0.265; scale-y: 0.053; cel: 0; image: IMAGE_REANIM_POTATOMINE_BODY; }
        frame 11 { x: 19.6; y: 59.4; scale-x: 0.372; scale-y: 0.203; cel: -10000; image: none; }
        frame 12 { x: 14.2; y: 51.5; scale-x: 0.479; scale-y: 0.352; }
        frame 13 { x: 8.8; y: 43.5; scale-x: 0.586; scale-y: 0.501; }
        frame 14 { x: 3.4; y: 35.6; scale-x: 0.693; scale-y: 0.651; }
        frame 15 { x: -1.9; y: 27.7; scale-x: 0.8; scale-y: 0.8; }
        frame 16 { x: -10000; y: 24.9; scale-x: -10000; scale-y: 0.834; }
        frame 17 { y: 22; scale-y: 0.869; }
        frame 18 { y: 24.9; scale-y: 0.834; }
        frame 19 { y: 27.7; scale-y: 0.8; }
        frame 20 { y: -10000; scale-y: -10000; }
        frame 21 { x: -2.2; y: 28.3; scale-x: 0.808; scale-y: 0.791; }
        frame 22 { x: -2.7; y: 28.9; scale-x: 0.815; scale-y: 0.782; }
        frame 23 { x: -3.1; y: 29.5; scale-x: 0.823; scale-y: 0.772; }
        frame 24 { x: -3.4; y: 30.1; scale-x: 0.831; scale-y: 0.763; }
        frame 25 { x: -3.8; y: 30.7; scale-x: 0.839; scale-y: 0.754; }
        frame 26 { x: -3.4; y: 30.1; scale-x: 0.831; scale-y: 0.763; }
        frame 27 { x: -3.1; y: 29.5; scale-x: 0.823; scale-y: 0.772; }
        frame 28 { x: -2.7; y: 28.9; scale-x: 0.815; scale-y: 0.782; }
        frame 29 { x: -2.3; y: 28.3; scale-x: 0.808; scale-y: 0.791; }
        frame 30 { x: -1.9; y: 27.7; scale-x: 0.8; scale-y: 0.8; }
        frame 31 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_stem";
        frame-count: 37;
        frame 0 { x: 20.3; y: 57; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POTATOMINE_STEM; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 11 { x: 22.3; y: 53.2; scale-x: 0.711; }
        frame 12 { x: 22.4; y: 49.5; scale-x: -10000; scale-y: 0.706; }
        frame 13 { x: 20.6; y: 44.3; scale-x: 0.755; scale-y: 0.659; }
        frame 14 { x: 19.1; y: 37; scale-x: 0.836; scale-y: 0.8; alpha: 0; }
        frame 15 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 16 { cel: -10000; }
    }
    Track {
        source-name: "anim_eye";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 10 { x: 33.5; y: 68.2; scale-x: 0.431; scale-y: 0.455; cel: 0; image: IMAGE_REANIM_POTATOMINE_EYES; }
        frame 11 { x: 34.6; y: 65.1; scale-x: 0.378; scale-y: 0.326; cel: -10000; image: none; }
        frame 12 { x: 33.6; y: 61.3; scale-x: 0.484; scale-y: 0.445; }
        frame 13 { x: 32.6; y: 57.5; scale-x: 0.589; scale-y: 0.563; }
        frame 14 { x: 31.7; y: 53.8; scale-x: 0.695; scale-y: 0.682; }
        frame 15 { x: 30.7; y: 50; scale-x: 0.8; scale-y: 0.8; }
        frame 16 { x: -10000; y: 48.8; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: 47.6; }
        frame 18 { y: 48.8; }
        frame 19 { y: 50; }
        frame 20 { y: -10000; }
        frame 21 { x: 30.8; y: 50.4; scale-y: 0.781; }
        frame 22 { x: 30.9; y: 50.8; scale-y: 0.762; }
        frame 23 { x: 31; y: 51.2; scale-y: 0.742; }
        frame 24 { y: 51.5; scale-y: 0.723; }
        frame 25 { x: 31.1; y: 52; scale-y: 0.704; }
        frame 26 { x: 31; y: 51.5; scale-y: 0.723; }
        frame 27 { y: 51.3; scale-y: 0.742; }
        frame 28 { x: 30.9; y: 50.8; scale-y: 0.762; }
        frame 29 { x: 30.8; y: 50.4; scale-y: 0.781; }
        frame 30 { x: 30.7; y: 50; scale-y: 0.8; }
        frame 31 { x: -10000; y: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_blink";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 32 { x: 31; y: 50; scale-x: 0.785; scale-y: 0.84; cel: 0; image: IMAGE_REANIM_POTATOMINE_BLINK1; }
        frame 33 { x: 31.1; y: 50.3; scale-x: 0.782; scale-y: 0.8; cel: -10000; image: IMAGE_REANIM_POTATOMINE_BLINK2; }
        frame 34 { x: 31; y: 50; scale-x: 0.785; scale-y: 0.84; image: IMAGE_REANIM_POTATOMINE_BLINK1; }
        frame 35 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 36 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock4";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 14 { x: 19.5; y: 68.5; skew-x: -6.2; skew-y: -6.2; scale-x: 0.489; scale-y: 0.443; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK4; }
        frame 15 { x: 18.9; y: 65.8; skew-x: 8; skew-y: 8; scale-x: 0.507; scale-y: 0.503; cel: -10000; image: none; }
        frame 16 { x: -10000; y: 66.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.502; }
        frame 17 { y: 66.6; scale-y: 0.503; }
        frame 18 { y: 66.2; scale-y: 0.502; }
        frame 19 { y: 65.8; scale-y: 0.503; }
        frame 20 { y: -10000; scale-y: -10000; }
        frame 21 { x: 19; scale-y: 0.502; }
        frame 22 { x: 18.9; scale-y: -10000; }
        frame 23 { x: 19; }
        frame 24 { x: 18.9; }
        frame 25 { x: -10000; scale-y: 0.503; }
        frame 26 { scale-y: 0.502; }
        frame 27 { scale-y: -10000; }
        frame 30 { scale-y: 0.503; }
        frame 31 { scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock3b";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 10 { x: 20; y: 65.4; skew-x: -4.9; skew-y: -4.9; scale-x: 0.759; scale-y: 0.772; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 11 { x: 23.4; y: 65.1; skew-x: 0.5; skew-y: 0.5; scale-x: 0.758; scale-y: -10000; cel: -10000; image: none; }
        frame 12 { x: 26.8; y: 64.8; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; }
        frame 13 { x: 29.1; y: 63.3; skew-x: 19.6; skew-y: 19.6; scale-y: 0.771; }
        frame 14 { x: 27; y: 66.4; skew-x: 2.5; skew-y: 2.5; scale-x: 0.757; scale-y: 0.77; }
        frame 15 { x: 26.4; y: 69.5; skew-x: -16.5; skew-y: -16.5; scale-x: 0.756; scale-y: 0.769; }
        frame 16 { x: -10000; y: 68.7; skew-x: -16.4; skew-y: -16.4; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: 67.9; skew-x: -16.5; skew-y: -16.5; }
        frame 18 { y: 68.7; skew-x: -16.4; skew-y: -16.4; }
        frame 19 { y: 69.5; skew-x: -16.5; skew-y: -16.5; }
        frame 20 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 21 { skew-x: -16.4; skew-y: -16.4; scale-x: 0.755; scale-y: 0.768; }
        frame 22 { skew-x: -10000; skew-y: -10000; scale-x: 0.756; scale-y: 0.769; }
        frame 23 { y: 69.4; scale-x: 0.755; scale-y: 0.768; }
        frame 24 { y: 69.5; scale-x: -10000; scale-y: 0.769; }
        frame 25 { y: -10000; skew-x: -16.5; skew-y: -16.5; scale-x: 0.756; scale-y: -10000; }
        frame 26 { skew-x: -16.4; skew-y: -16.4; scale-x: -10000; }
        frame 27 { skew-x: -10000; skew-y: -10000; }
        frame 30 { skew-x: -16.5; skew-y: -16.5; }
        frame 31 { skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock1b";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 14 { x: 56.9; y: 80.8; skew-x: -159.1; skew-y: -159.1; scale-x: 0.795; scale-y: 0.795; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK1; }
        frame 15 { x: 56.6; y: 81.3; skew-x: -129; skew-y: -129; scale-x: 0.794; scale-y: 0.794; cel: -10000; image: none; }
        frame 16 { x: 56.5; y: 81.7; skew-x: -10000; skew-y: -10000; scale-x: 0.792; scale-y: 0.792; }
        frame 17 { x: 56.6; y: 82.1; scale-x: 0.794; scale-y: 0.794; }
        frame 18 { x: -10000; y: 81.7; scale-x: 0.792; scale-y: 0.792; }
        frame 19 { y: 81.3; scale-x: 0.794; scale-y: 0.794; }
        frame 20 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { scale-x: 0.792; scale-y: 0.792; }
        frame 22 { x: 56.5; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -10000; scale-x: 0.791; scale-y: 0.791; }
        frame 24 { scale-x: 0.792; scale-y: 0.792; }
        frame 25 { x: 56.6; scale-x: 0.794; scale-y: 0.794; }
        frame 26 { x: 56.5; scale-x: 0.792; scale-y: 0.792; }
        frame 27 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 56.6; scale-x: 0.794; scale-y: 0.794; }
        frame 31 { x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock6b";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { x: 42; y: 70.8; skew-x: -20.7; skew-y: -20.7; scale-x: 0.534; scale-y: 0.528; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK6; }
        frame 12 { x: 44.5; y: 68.3; skew-x: -0.9; skew-y: -0.9; scale-x: 0.632; scale-y: 0.618; cel: -10000; image: none; }
        frame 13 { x: 50; y: 65.1; skew-x: 17.1; skew-y: 17.1; scale-x: 0.812; scale-y: 0.729; }
        frame 14 { x: 53.6; y: 70.1; skew-x: -11.1; skew-y: -11.1; scale-x: 0.88; scale-y: 0.822; }
        frame 15 { x: 57.8; y: 68.2; skew-x: -1.8; skew-y: -1.8; scale-x: -10000; scale-y: 0.823; }
        frame 16 { x: 57.9; y: 67.8; skew-x: -1.7; skew-y: -1.7; scale-y: 0.822; }
        frame 17 { x: 57.8; y: 67.3; skew-x: -1.8; skew-y: -1.8; scale-y: 0.823; }
        frame 18 { x: 57.9; y: 67.8; skew-x: -1.7; skew-y: -1.7; scale-y: 0.822; }
        frame 19 { x: 57.8; y: 68.2; skew-x: -1.8; skew-y: -1.8; scale-y: 0.823; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 21 { x: 57.9; skew-x: -1.7; skew-y: -1.7; scale-y: 0.822; }
        frame 22 { x: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 23 { x: 57.8; }
        frame 24 { x: -10000; }
        frame 25 { skew-x: -1.8; skew-y: -1.8; scale-y: 0.823; }
        frame 26 { x: 57.9; skew-x: -1.7; skew-y: -1.7; scale-y: 0.822; }
        frame 27 { x: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 30 { x: 57.8; skew-x: -1.8; skew-y: -1.8; scale-y: 0.823; }
        frame 31 { x: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock5b";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { x: 20.3; y: 68.7; scale-x: 0.623; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_POTATOMINE_ROCK5; }
        frame 12 { x: 16.7; y: 67.4; skew-x: 4.8; skew-y: 4.8; scale-x: 0.711; scale-y: 0.75; cel: -10000; image: none; }
        frame 13 { x: 13.2; y: 65.8; skew-x: 9.8; skew-y: 9.8; scale-x: 0.8; scale-y: 0.8; }
        frame 14 { x: 5.9; y: 66.7; skew-x: 4.3; skew-y: 4.3; scale-x: 0.799; scale-y: 0.799; }
        frame 15 { x: 0.8; y: 67.6; skew-x: -5.4; skew-y: -5.4; scale-x: -10000; scale-y: -10000; }
        frame 16 { x: -10000; y: 67.9; skew-x: -10000; skew-y: -10000; scale-x: 0.798; scale-y: 0.798; }
        frame 17 { y: 68.3; scale-x: 0.799; scale-y: 0.799; }
        frame 18 { y: 67.9; scale-x: 0.798; scale-y: 0.798; }
        frame 19 { y: 67.6; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { y: 67.5; scale-x: 0.798; scale-y: 0.798; }
        frame 22 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { y: 67.6; }
        frame 24 { x: 0.9; y: -10000; }
        frame 25 { x: 0.8; scale-x: 0.799; scale-y: 0.799; }
        frame 26 { x: -10000; y: 67.5; scale-x: 0.798; scale-y: 0.798; }
        frame 27 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 67.6; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "anim_light";
        frame-count: 37;
        frame 0 { x: 28.2; y: 40.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POTATOMINE_LIGHT1; }
        frame 1 { x: -10000; y: 41.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 42; }
        frame 3 { y: 42.7; }
        frame 4 { y: 43.5; }
        frame 5 { y: 42.7; }
        frame 6 { y: 42; }
        frame 7 { y: 41.2; }
        frame 8 { y: 40.5; }
        frame 9 { y: -10000; }
        frame 11 { y: 35.1; }
        frame 12 { y: 29.8; }
        frame 13 { y: 24.4; }
        frame 14 { y: 19; }
        frame 15 { y: 12.5; }
        frame 16 { y: 8.4; scale-y: 0.834; }
        frame 17 { y: 4.2; scale-y: 0.869; }
        frame 18 { y: 7.6; scale-y: 0.834; }
        frame 19 { y: 12.5; scale-y: 0.8; }
        frame 20 { y: -10000; scale-y: -10000; }
        frame 23 { x: 28; y: 14.5; scale-x: 0.819; scale-y: 0.777; }
        frame 24 { x: 27.7; y: 16.4; scale-x: 0.839; scale-y: 0.754; }
        frame 25 { x: 27.6; y: 17.1; scale-x: 0.847; scale-y: -10000; }
        frame 26 { x: 27.5; y: 16.6; scale-x: 0.856; }
        frame 27 { x: 27.3; y: 16.2; scale-x: 0.865; }
        frame 28 { x: 27.6; y: 15; scale-x: 0.843; scale-y: 0.77; }
        frame 29 { x: 27.9; y: 13.8; scale-x: 0.822; scale-y: 0.785; }
        frame 30 { x: 28.2; y: 12.5; scale-x: 0.8; scale-y: 0.8; }
        frame 31 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "anim_glow";
        frame-count: 37;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 20 { x: 21.1; y: 5.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_POTATOMINE_LIGHT2; }
        frame 21 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 22 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock6";
        frame-count: 37;
        frame 0 { x: 14.7; y: 66.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POTATOMINE_ROCK6; }
        frame 1 { x: -10000; y: 67.1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 66.1; }
        frame 3 { y: 67.1; }
        frame 4 { y: 66.1; }
        frame 5 { y: 67.1; }
        frame 6 { y: 66.1; }
        frame 7 { y: 67.1; }
        frame 8 { y: 66.1; }
        frame 9 { y: -10000; }
        frame 10 { x: 10; y: 67.6; skew-x: -9.9; skew-y: -9.9; }
        frame 11 { x: 9; y: 69.2; skew-x: -20.7; skew-y: -20.7; scale-x: 0.799; scale-y: 0.799; }
        frame 12 { x: 5.9; y: 74.6; skew-x: -55; skew-y: -55; scale-x: 0.798; scale-y: 0.798; }
        frame 13 { x: 7; y: 80.4; skew-x: -115.2; skew-y: -115.2; scale-x: 0.796; scale-y: 0.796; }
        frame 14 { x: 5.5; y: 79.1; skew-x: -156; skew-y: -156; scale-x: 0.795; scale-y: 0.795; }
        frame 15 { x: 7.6; y: 72.4; skew-x: -201.1; skew-y: -201.1; scale-x: 0.793; scale-y: 0.793; }
        frame 16 { x: -10000; y: 72; skew-x: -201; skew-y: -201; scale-x: 0.792; scale-y: 0.792; }
        frame 17 { y: 71.6; skew-x: -201.1; skew-y: -201.1; scale-x: 0.793; scale-y: 0.793; }
        frame 18 { x: 7.7; y: 72; skew-x: -201; skew-y: -201; scale-x: 0.792; scale-y: 0.792; }
        frame 19 { x: 7.6; y: 72.4; skew-x: -201.1; skew-y: -201.1; scale-x: 0.793; scale-y: 0.793; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 21 { skew-x: -201; skew-y: -201; scale-x: 0.792; scale-y: 0.792; }
        frame 22 { y: 72.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 7.7; y: -10000; }
        frame 24 { x: 7.6; }
        frame 25 { x: -10000; y: 72.4; skew-x: -201.1; skew-y: -201.1; scale-x: 0.793; scale-y: 0.793; }
        frame 26 { y: 72.3; skew-x: -201; skew-y: -201; scale-x: 0.792; scale-y: 0.792; }
        frame 27 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 29 { skew-x: -200.9; skew-y: -200.9; }
        frame 30 { skew-x: -201; skew-y: -201; }
        frame 31 { skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock1";
        frame-count: 37;
        frame 0 { x: 26.8; y: 68.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POTATOMINE_ROCK1; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 69.5; }
        frame 3 { y: -10000; }
        frame 4 { y: 68.5; }
        frame 5 { y: -10000; }
        frame 6 { y: 69.5; }
        frame 7 { y: -10000; }
        frame 8 { y: 68.5; }
        frame 9 { y: -10000; }
        frame 10 { x: 25.2; y: 70.5; skew-x: -16.5; skew-y: -16.5; scale-x: 0.799; scale-y: 0.799; }
        frame 11 { x: 23.9; y: 71.2; skew-x: -30.3; skew-y: -30.3; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 22.1; y: 73.1; skew-x: -50.3; skew-y: -50.3; scale-x: 0.798; scale-y: 0.798; }
        frame 13 { x: 23; y: 77.1; skew-x: -100.2; skew-y: -100.2; scale-x: 0.796; scale-y: 0.796; }
        frame 14 { x: 22.5; y: 77.6; skew-x: -159.1; skew-y: -159.1; scale-x: 0.795; scale-y: 0.795; }
        frame 15 { x: 23.8; y: 75.2; skew-x: -194.7; skew-y: -194.7; scale-x: 0.793; scale-y: 0.793; }
        frame 16 { x: -10000; y: 75.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: 76; }
        frame 18 { y: 75.6; }
        frame 19 { y: 75.2; }
        frame 20 { y: -10000; }
        frame 21 { scale-x: 0.792; scale-y: 0.792; }
        frame 22 { scale-x: 0.793; scale-y: 0.793; }
        frame 23 { scale-x: 0.792; scale-y: 0.792; }
        frame 24 { y: 75.3; scale-x: 0.793; scale-y: 0.793; }
        frame 25 { y: 75.2; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 23.9; y: 75.3; }
        frame 27 { x: 23.8; y: 75.2; }
        frame 28 { x: -10000; y: 75.3; scale-x: 0.792; scale-y: 0.792; }
        frame 29 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 30 { y: 75.2; scale-x: 0.793; scale-y: 0.793; }
        frame 31 { y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock3";
        frame-count: 37;
        frame 0 { x: 42.5; y: 64.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POTATOMINE_ROCK3; }
        frame 1 { x: -10000; y: 63.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 62.5; }
        frame 3 { y: 63.5; }
        frame 4 { y: 64.5; }
        frame 5 { y: 63.5; }
        frame 6 { y: 62.5; }
        frame 7 { y: 63.5; }
        frame 8 { y: 64.5; }
        frame 9 { y: -10000; }
        frame 10 { x: 46.9; y: 63; skew-x: 12.3; skew-y: 12.3; scale-x: 0.799; scale-y: 0.799; }
        frame 11 { x: 50.5; y: 62; skew-x: 20.6; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 64.3; y: 61.1; skew-x: 73.7; skew-y: 73.7; scale-x: 0.797; scale-y: 0.797; }
        frame 13 { x: 78.1; y: 67.8; skew-x: 126.8; skew-y: 126.8; scale-x: 0.796; scale-y: 0.796; }
        frame 14 { x: 85.3; y: 71.4; skew-x: 147.9; skew-y: 147.9; scale-x: 0.795; scale-y: 0.795; }
        frame 15 { x: -10000; y: 74.3; skew-x: 164.9; skew-y: 164.9; scale-x: 0.794; scale-y: 0.794; }
        frame 16 { x: 85.4; y: -10000; skew-x: 165; skew-y: 165; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 85.3; skew-x: 164.9; skew-y: 164.9; }
        frame 18 { x: 85.4; skew-x: 165; skew-y: 165; }
        frame 19 { x: 85.3; skew-x: 164.9; skew-y: 164.9; }
        frame 20 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 21 { x: 85.4; y: 74.2; skew-x: 165; skew-y: 165; scale-x: 0.793; scale-y: 0.793; }
        frame 22 { x: -10000; y: 74.3; skew-x: -10000; skew-y: -10000; scale-x: 0.794; scale-y: 0.794; }
        frame 23 { y: 74.2; scale-x: 0.793; scale-y: 0.793; }
        frame 24 { x: 85.3; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -10000; y: 74.3; skew-x: 164.9; skew-y: 164.9; scale-x: 0.794; scale-y: 0.794; }
        frame 26 { y: -10000; skew-x: 165; skew-y: 165; scale-x: 0.793; scale-y: 0.793; }
        frame 27 { y: 74.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 85.4; y: -10000; }
        frame 29 { x: 85.5; y: 74.3; }
        frame 30 { x: 85.4; y: -10000; scale-x: 0.794; scale-y: 0.794; }
        frame 31 { x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
    Track {
        source-name: "PotatoMine_rock5";
        frame-count: 37;
        frame 0 { x: 31.1; y: 69.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POTATOMINE_ROCK5; }
        frame 1 { x: -10000; y: 68.1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 69.1; }
        frame 3 { y: 68.1; }
        frame 4 { y: 69.1; }
        frame 5 { y: 68.1; }
        frame 6 { y: 69.1; }
        frame 7 { y: 68.1; }
        frame 8 { y: 69.1; }
        frame 9 { y: -10000; }
        frame 10 { x: 31.9; }
        frame 11 { x: -10000; }
        frame 12 { x: 36.5; y: 66.8; skew-x: 16.8; skew-y: 16.8; scale-x: 0.799; scale-y: 0.799; }
        frame 13 { x: 36; y: 68.8; skew-x: 2; skew-y: 2; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 38.3; y: 67; skew-x: 16.6; skew-y: 16.6; scale-x: 0.798; scale-y: 0.798; }
        frame 15 { x: 38.5; y: 70.4; skew-x: 1.3; skew-y: 1.3; scale-x: 0.797; scale-y: 0.797; }
        frame 16 { x: -10000; y: 70; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: 69.6; }
        frame 18 { y: 70; }
        frame 19 { y: 70.4; }
        frame 20 { y: -10000; }
        frame 23 { x: 38.4; }
        frame 24 { x: 38.5; }
        frame 25 { x: -10000; }
        frame 28 { x: 38.4; }
        frame 29 { x: -10000; }
        frame 30 { x: 38.5; }
        frame 31 { x: -10000; cel: -1; }
        frame 32 { cel: -10000; }
    }
}
