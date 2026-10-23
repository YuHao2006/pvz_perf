export component Starfruit {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 39;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 22 { cel: -1; }
        frame 23 { cel: -10000; }
    }
    Track {
        source-name: "anim_shoot";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 22 { cel: 0; }
        frame 23 { cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 3.1; y: 9.7; scale-x: 0.706; scale-y: 0.706; cel: 0; image: IMAGE_REANIM_STARFRUIT_BODY; }
        frame 6 { x: 2.8; y: 10; scale-x: 0.713; scale-y: 0.7; cel: -10000; image: none; }
        frame 7 { x: 2.4; y: 10.3; scale-x: 0.72; scale-y: 0.695; }
        frame 8 { x: 2; y: 10.5; scale-x: 0.728; scale-y: 0.69; }
        frame 9 { x: 1.8; y: 10.8; scale-x: 0.735; scale-y: 0.685; }
        frame 10 { x: 1.3; y: 11.1; scale-x: 0.743; scale-y: 0.68; }
        frame 11 { x: 2; y: 10.4; scale-x: 0.726; scale-y: 0.691; }
        frame 12 { x: 3; y: 9.9; scale-x: 0.71; scale-y: 0.703; }
        frame 13 { x: 3.7; y: 9.3; scale-x: 0.693; scale-y: 0.714; }
        frame 14 { x: 4.5; y: 8.6; scale-x: 0.677; scale-y: 0.726; }
        frame 15 { x: 5.3; y: 8; scale-x: 0.66; scale-y: 0.737; }
        frame 16 { x: 6.2; y: 7.5; scale-x: 0.644; scale-y: 0.749; }
        frame 17 { x: 5.6; y: 7.9; scale-x: 0.656; scale-y: 0.74; }
        frame 18 { x: 5; y: 8.4; scale-x: 0.668; scale-y: 0.731; }
        frame 19 { x: 4.4; y: 8.9; scale-x: 0.681; scale-y: 0.723; }
        frame 20 { x: 3.8; y: 9.3; scale-x: 0.693; scale-y: 0.714; }
        frame 21 { x: 3.1; y: 9.7; scale-x: 0.706; scale-y: 0.706; }
        frame 22 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 3.7; y: 9.4; scale-x: 0.695; scale-y: 0.712; }
        frame 24 { x: 4.3; y: 9.1; scale-x: 0.684; scale-y: 0.717; }
        frame 25 { x: 4.8; y: 8.9; scale-x: 0.673; scale-y: 0.723; }
        frame 26 { x: 5.3; y: 8.6; scale-x: 0.663; scale-y: 0.729; }
        frame 27 { x: 5.8; y: 8.3; scale-x: 0.652; scale-y: 0.735; }
        frame 28 { x: 6.4; y: 7.9; scale-x: 0.641; scale-y: 0.741; }
        frame 29 { x: 6.9; y: 7.7; scale-x: 0.63; scale-y: 0.747; }
        frame 30 { x: 7.5; y: 7.3; scale-x: 0.62; scale-y: 0.753; }
        frame 31 { x: 3.9; y: 8.6; scale-x: 0.692; scale-y: 0.728; }
        frame 32 { x: 0.2; y: 9.9; scale-x: 0.764; scale-y: 0.702; }
        frame 33 { x: 0.7; y: 9.8; scale-x: 0.754; scale-y: 0.703; }
        frame 34 { x: 1.2; y: -10000; scale-x: 0.745; scale-y: -10000; }
        frame 35 { x: 1.7; scale-x: 0.735; scale-y: 0.704; }
        frame 36 { x: 2.1; scale-x: 0.725; scale-y: 0.705; }
        frame 37 { x: 2.6; scale-x: 0.715; scale-y: -10000; }
        frame 38 { x: 3.1; y: 9.7; scale-x: 0.706; scale-y: 0.706; }
    }
    Track {
        source-name: "Starfruit_mouth";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 30 { x: 42.6; y: 41.2; scale-x: 0.329; scale-y: 0.256; cel: 0; image: IMAGE_REANIM_STARFRUIT_MOUTH; }
        frame 31 { x: 41.8; y: 40.5; skew-x: 1.3; skew-y: 8; scale-x: 0.569; scale-y: 0.492; cel: -10000; image: none; }
        frame 32 { x: 41.9; y: 39.7; skew-x: 2.6; skew-y: 16.1; scale-x: 0.81; scale-y: 0.729; }
        frame 33 { x: 41.8; y: 40; skew-x: 2.1; skew-y: 13.3; scale-x: 0.73; scale-y: 0.65; }
        frame 34 { x: 42; y: 40.2; skew-x: 1.8; skew-y: 10.6; scale-x: 0.65; scale-y: 0.571; }
        frame 35 { x: 42.1; y: 40.5; skew-x: 1.3; skew-y: 8; scale-x: 0.569; scale-y: 0.492; }
        frame 36 { x: 42.5; y: 40.9; skew-x: 0.8; skew-y: 5.3; scale-x: 0.489; scale-y: 0.413; }
        frame 37 { x: 42.8; y: 41.1; skew-x: 0.3; skew-y: 2.5; scale-x: 0.409; scale-y: 0.334; }
        frame 38 { x: 43.3; y: 41.6; skew-x: 0; skew-y: 0; scale-x: 0.329; scale-y: 0.256; }
    }
    Track {
        source-name: "Starfruit_smile";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 34.6; y: 35.3; scale-x: 0.706; scale-y: 0.706; cel: 0; image: IMAGE_REANIM_STARFRUIT_SMILE; }
        frame 6 { x: 34.1; y: -10000; skew-y: -0.9; scale-x: 0.73; scale-y: 0.705; cel: -10000; image: none; }
        frame 7 { x: 33.8; y: 35.4; skew-y: -1.9; scale-x: 0.754; scale-y: 0.704; }
        frame 8 { x: 33.4; y: -10000; skew-y: -2.9; scale-x: 0.778; scale-y: 0.703; }
        frame 9 { x: 33; skew-y: -3.9; scale-x: 0.803; scale-y: -10000; }
        frame 10 { x: 32.6; skew-y: -5.1; scale-x: 0.827; scale-y: 0.702; }
        frame 11 { x: 33; y: 35.3; skew-y: -4.2; scale-x: 0.796; scale-y: 0.71; }
        frame 12 { x: 33.5; y: 35.2; skew-y: -3.2; scale-x: 0.766; scale-y: 0.718; }
        frame 13 { x: 33.8; y: 35; skew-y: -2.4; scale-x: 0.735; scale-y: 0.725; }
        frame 14 { x: 34.2; skew-y: -1.5; scale-x: 0.705; scale-y: 0.733; }
        frame 15 { x: 34.5; y: 34.8; skew-y: -0.7; scale-x: 0.674; scale-y: 0.741; }
        frame 16 { x: 34.9; y: 34.6; skew-y: 0; scale-x: 0.644; scale-y: 0.749; }
        frame 17 { x: 34.8; y: 34.8; skew-y: -10000; scale-x: 0.656; scale-y: 0.74; }
        frame 18 { x: -10000; y: 34.9; scale-x: 0.668; scale-y: 0.731; }
        frame 19 { x: 34.6; y: 35; scale-x: 0.681; scale-y: 0.723; }
        frame 20 { x: -10000; y: 35.1; scale-x: 0.693; scale-y: 0.714; }
        frame 21 { y: 35.3; scale-x: 0.706; scale-y: 0.706; }
        frame 22 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 34.9; y: 35.1; skew-x: 0.8; scale-x: 0.683; scale-y: 0.705; }
        frame 24 { x: 35.1; y: 35; skew-x: 1.6; scale-x: 0.66; scale-y: 0.704; }
        frame 25 { x: 35.5; y: 34.8; skew-x: 2.5; scale-x: 0.637; scale-y: -10000; }
        frame 26 { x: 35.7; y: 34.6; skew-x: 3.3; scale-x: 0.614; scale-y: 0.703; }
        frame 27 { x: 36; y: 34.5; skew-x: 4.3; scale-x: 0.591; scale-y: -10000; }
        frame 28 { x: 36.3; y: 34.3; skew-x: 5; scale-x: 0.569; scale-y: 0.702; }
        frame 29 { x: 36.6; y: 34.1; skew-x: 6; scale-x: 0.546; scale-y: 0.701; }
        frame 30 { x: 36.8; y: 33.9; skew-x: 6.9; scale-x: 0.523; scale-y: -10000; }
        frame 31 { x: 35.3; y: 35; skew-x: 1.5; skew-y: -4.2; scale-x: 0.648; scale-y: 0.65; }
        frame 32 { x: 33.7; y: 36.5; skew-x: -3.5; skew-y: -8.8; scale-x: 0.774; scale-y: 0.599; }
        frame 33 { x: 33.9; y: 36.3; skew-x: -2.9; skew-y: -7.2; scale-x: 0.762; scale-y: 0.616; }
        frame 34 { x: 34; y: 36; skew-x: -2.2; skew-y: -5.7; scale-x: 0.751; scale-y: 0.634; }
        frame 35 { y: 35.9; skew-x: -1.7; skew-y: -4.2; scale-x: 0.74; scale-y: 0.652; }
        frame 36 { x: 34.2; y: 35.6; skew-x: -1; skew-y: -2.7; scale-x: 0.728; scale-y: 0.67; }
        frame 37 { x: 34.3; y: 35.5; skew-x: -0.4; skew-y: -1.2; scale-x: 0.717; scale-y: 0.688; }
        frame 38 { x: 34.6; y: 35.3; skew-x: 0; skew-y: 0; scale-x: 0.706; scale-y: 0.706; }
    }
    Track {
        source-name: "Starfruit_leaf";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 26.7; y: 5.2; scale-x: 0.706; scale-y: 0.706; cel: 0; image: IMAGE_REANIM_STARFRUIT_LEAF; }
        frame 6 { x: 27.2; y: 4.9; skew-x: 3.1; skew-y: 1.5; scale-x: -10000; scale-y: 0.732; cel: -10000; image: none; }
        frame 7 { x: 27.7; y: 4.6; skew-x: 6.5; skew-y: 3.3; scale-y: 0.758; }
        frame 8 { x: 28.1; y: 4.7; skew-x: 11.3; skew-y: 7.8; scale-y: 0.74; }
        frame 9 { x: 28.5; y: 4.8; skew-x: 16; skew-y: 12.5; scale-y: 0.722; }
        frame 10 { x: 28.6; y: 4.9; skew-x: 20.8; skew-y: 17.2; scale-y: 0.705; }
        frame 11 { x: 28.1; y: 5.8; skew-x: 10.3; skew-y: 8; scale-x: 0.705; scale-y: 0.661; }
        frame 12 { x: 27.6; y: 7.2; skew-x: 0.1; skew-y: -0.9; scale-x: 0.704; scale-y: 0.618; }
        frame 13 { x: 28; y: 5.8; skew-x: 2.5; skew-y: 2.3; scale-x: 0.69; scale-y: 0.649; }
        frame 14 { x: 28.5; y: 4.4; skew-x: 4.8; skew-y: 5.8; scale-x: 0.676; scale-y: 0.68; }
        frame 15 { x: 28.9; y: 3.1; skew-x: 7.3; skew-y: 9.3; scale-x: 0.662; scale-y: 0.711; }
        frame 16 { x: 29.7; y: 2; skew-x: 9.8; skew-y: 12.9; scale-x: 0.648; scale-y: 0.743; }
        frame 17 { x: 29.9; y: 1.7; skew-x: 13; skew-y: 15.5; scale-x: 0.659; scale-y: 0.734; }
        frame 18 { x: 30.1; y: 1.5; skew-x: 16.3; skew-y: 18.1; scale-x: 0.67; scale-y: 0.727; }
        frame 19 { x: 29; y: 2.5; skew-x: 10.8; skew-y: 12; scale-x: 0.682; scale-y: 0.719; }
        frame 20 { x: 27.9; y: 3.8; skew-x: 5.3; skew-y: 6; scale-x: 0.694; scale-y: 0.712; }
        frame 21 { x: 26.7; y: 5.2; skew-x: 0; skew-y: 0; scale-x: 0.706; scale-y: 0.706; }
        frame 22 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 26.9; y: 4.8; scale-x: 0.695; scale-y: 0.712; }
        frame 24 { x: 27; y: 4.6; scale-x: 0.684; scale-y: 0.717; }
        frame 25 { x: 27.2; y: 4.2; scale-x: 0.673; scale-y: 0.723; }
        frame 26 { x: 27.5; y: 3.9; scale-x: 0.663; scale-y: 0.729; }
        frame 27 { x: 27.6; y: 3.5; scale-x: 0.652; scale-y: 0.735; }
        frame 28 { x: 27.8; y: 3.2; scale-x: 0.641; scale-y: 0.741; }
        frame 29 { x: 27.9; y: 2.9; scale-x: 0.63; scale-y: 0.747; }
        frame 30 { x: 28.2; y: 2.5; scale-x: 0.62; scale-y: 0.753; }
        frame 31 { x: 35.3; y: 2.6; skew-x: 44; skew-y: 45.3; scale-x: 0.636; scale-y: 0.724; }
        frame 32 { x: 24.4; y: 9.4; skew-x: -15.7; skew-y: -15.7; scale-x: 0.763; scale-y: 0.702; }
        frame 33 { x: 24.7; y: 7.8; skew-x: -13.9; skew-y: -16.7; scale-x: 0.722; scale-y: 0.71; }
        frame 34 { x: 25; y: 6.3; skew-x: -12.1; skew-y: -17.9; scale-x: 0.682; scale-y: 0.72; }
        frame 35 { x: 25.5; y: 6; skew-x: -8.9; skew-y: -13.4; scale-x: 0.687; scale-y: 0.716; }
        frame 36 { x: 26; y: 5.6; skew-x: -5.9; skew-y: -8.9; scale-x: 0.693; scale-y: 0.712; }
        frame 37 { x: 26.4; y: 5.3; skew-x: -2.9; skew-y: -4.4; scale-x: 0.699; scale-y: 0.709; }
        frame 38 { x: 26.7; y: 5.2; skew-x: 0; skew-y: 0; scale-x: 0.706; scale-y: 0.706; }
    }
    Track {
        source-name: "Starfruit_stem";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 29.3; y: 6.4; scale-x: 0.706; scale-y: 0.706; cel: 0; image: IMAGE_REANIM_STARFRUIT_STEM; }
        frame 6 { x: -10000; y: 6.6; scale-x: 0.72; scale-y: 0.712; cel: -10000; image: none; }
        frame 7 { y: 6.7; scale-x: 0.734; scale-y: 0.718; }
        frame 8 { y: 7.3; scale-x: 0.744; scale-y: 0.687; }
        frame 9 { y: 7.8; scale-x: 0.753; scale-y: 0.656; }
        frame 10 { y: 8.5; scale-x: 0.763; scale-y: 0.625; }
        frame 11 { x: 29.5; y: 8.4; scale-x: 0.748; scale-y: 0.634; }
        frame 12 { x: 29.7; y: 8.2; scale-x: 0.734; scale-y: 0.643; }
        frame 13 { x: 29.9; y: 7.1; scale-x: 0.697; scale-y: 0.684; }
        frame 14 { x: 30.2; y: 6.1; scale-x: 0.66; scale-y: 0.726; }
        frame 15 { x: 30.3; y: 5; scale-x: 0.623; scale-y: 0.767; }
        frame 16 { x: 30.6; y: 3.9; scale-x: 0.586; scale-y: 0.809; }
        frame 17 { x: -10000; y: 4.1; scale-x: 0.61; scale-y: 0.822; }
        frame 18 { x: 30.5; y: 4.2; scale-x: 0.634; scale-y: 0.835; }
        frame 19 { x: 30.1; y: 5; scale-x: 0.658; scale-y: 0.792; }
        frame 20 { x: 29.8; y: 5.7; scale-x: 0.682; scale-y: 0.749; }
        frame 21 { x: 29.3; y: 6.4; scale-x: 0.706; scale-y: 0.706; }
        frame 22 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 29.4; y: 6.1; scale-x: 0.695; scale-y: 0.712; }
        frame 24 { x: 29.5; y: 5.8; scale-x: 0.684; scale-y: 0.717; }
        frame 25 { x: 29.7; y: 5.5; scale-x: 0.673; scale-y: 0.723; }
        frame 26 { x: 29.8; y: 5.2; scale-x: 0.663; scale-y: 0.729; }
        frame 27 { x: 30; y: 4.8; scale-x: 0.652; scale-y: 0.735; }
        frame 28 { x: 30.1; y: 4.5; scale-x: 0.641; scale-y: 0.741; }
        frame 29 { x: 30.3; y: 4.1; scale-x: 0.63; scale-y: 0.747; }
        frame 30 { x: 30.5; y: 3.8; scale-x: 0.62; scale-y: 0.753; }
        frame 31 { x: 32.5; y: 5.6; skew-x: 19.4; skew-y: 10.1; scale-x: 0.637; scale-y: 0.715; }
        frame 32 { x: 26.3; y: 8.8; skew-x: 0; skew-y: -20.1; scale-x: 0.764; scale-y: 0.682; }
        frame 33 { x: 26.6; y: 8; skew-x: -10000; skew-y: -17.7; scale-x: 0.728; scale-y: 0.697; }
        frame 34 { x: 26.9; y: 7.1; skew-y: -15.6; scale-x: 0.692; scale-y: 0.713; }
        frame 35 { x: 27.5; y: 6.8; skew-y: -11.7; scale-x: 0.695; scale-y: 0.711; }
        frame 36 { x: 28.1; y: 6.7; skew-y: -7.7; scale-x: 0.699; scale-y: 0.709; }
        frame 37 { x: 28.7; y: 6.5; skew-y: -3.7; scale-x: 0.702; scale-y: 0.707; }
        frame 38 { x: 29.3; y: 6.4; skew-y: 0; scale-x: 0.706; scale-y: 0.706; }
    }
    Track {
        source-name: "Starfruit_eyes";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { x: 29.2; y: 25.8; scale-x: 0.706; scale-y: 0.714; cel: 0; image: IMAGE_REANIM_STARFRUIT_EYES1; }
        frame 2 { x: 29.3; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_STARFRUIT_EYES2; }
        frame 3 { x: 29.2; image: IMAGE_REANIM_STARFRUIT_EYES1; }
        frame 4 { x: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 31 { x: 28.3; y: 24.1; scale-x: 0.754; scale-y: 0.826; cel: 0; }
        frame 32 { x: 27.5; y: 24.6; scale-x: 0.839; scale-y: 0.805; cel: -10000; image: IMAGE_REANIM_STARFRUIT_EYES2; }
        frame 33 { x: 28.2; y: 24.2; scale-x: 0.771; scale-y: 0.844; image: IMAGE_REANIM_STARFRUIT_EYES1; }
        frame 34 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 35 { cel: -10000; }
    }
}
