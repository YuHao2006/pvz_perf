export component Zombie_charred {
    fps: 15;
    Track {
        source-name: "anim_blink";
        frame-count: 43;
        frame 20 { cel: -1; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "anim_crumble";
        frame-count: 43;
    }
    Track {
        source-name: "Zombie_charred_body";
        frame-count: 43;
        frame 0 { x: 18.4; y: 41.6; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_CHARRED1; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 21 { y: 41.8; image: IMAGE_REANIM_ZOMBIE_CHARRED2; }
        frame 22 { x: 18.5; y: 41.6; image: IMAGE_REANIM_ZOMBIE_CHARRED3; }
        frame 23 { x: 18.4; y: 41.8; image: IMAGE_REANIM_ZOMBIE_CHARRED4; }
        frame 24 { x: 20.6; y: 41.6; image: IMAGE_REANIM_ZOMBIE_CHARRED5; }
        frame 25 { x: 20.7; y: 41.5; image: IMAGE_REANIM_ZOMBIE_CHARRED6; }
        frame 26 { x: 20.6; y: 41.6; image: IMAGE_REANIM_ZOMBIE_CHARRED7; }
        frame 27 { x: 21.5; y: 41.5; image: IMAGE_REANIM_ZOMBIE_CHARRED8; }
        frame 28 { x: 21.8; y: 41.6; image: IMAGE_REANIM_ZOMBIE_CHARRED9; }
        frame 29 { x: 21.4; y: -10000; image: IMAGE_REANIM_ZOMBIE_CHARRED10; }
        frame 30 { x: -10000; cel: -1; image: none; }
        frame 31 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_charred_tail";
        frame-count: 43;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 29 { x: 21; y: 39.7; scale-x: 0.8; scale-y: 0.8; cel: 0; alpha: 0.23; image: IMAGE_REANIM_ZOMBIE_CHARRED_TAIL; }
        frame 30 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; alpha: 1; image: none; }
        frame 31 { x: 26.5; y: 53.6; scale-x: 0.524; scale-y: 0.678; alpha: -10000; }
        frame 32 { x: 32; y: 67.6; scale-x: 0.247; scale-y: 0.556; }
        frame 33 { x: 32.7; y: 79.9; scale-x: 0.214; scale-y: 0.468; }
        frame 34 { x: 33.4; y: 92.3; scale-x: 0.18; scale-y: 0.379; }
        frame 35 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 36 { cel: -10000; }
    }
    Track {
        source-name: "Layer 10";
        frame-count: 43;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 23 { x: 41.8; y: 116.1; scale-x: 0.191; scale-y: 0.191; cel: 0; image: IMAGE_REANIM_ZOMBIE_CHARRED_PILE2; }
        frame 24 { x: 37.6; y: 113.3; skew-y: -0.1; scale-x: 0.27; scale-y: 0.25; cel: -10000; image: none; }
        frame 25 { x: 33.5; y: 110.5; skew-y: -0.4; scale-x: 0.349; scale-y: 0.308; }
        frame 26 { x: 29.4; y: 107.8; skew-y: -0.6; scale-x: 0.428; scale-y: 0.366; }
        frame 27 { x: 25.2; y: 105; skew-y: -0.9; scale-x: 0.507; scale-y: 0.424; }
        frame 28 { x: 21; y: 102.2; skew-y: -1.2; scale-x: 0.587; scale-y: 0.483; }
        frame 29 { x: 16.8; y: 99.5; skew-y: -1.4; scale-x: 0.666; scale-y: 0.541; }
        frame 30 { x: 12.5; y: 96.7; skew-y: -1.6; scale-x: 0.745; scale-y: 0.599; }
        frame 31 { x: 8.3; y: 93.9; skew-y: -1.9; scale-x: 0.824; scale-y: 0.657; }
        frame 32 { x: 4.2; y: 91.4; skew-y: -2.2; scale-x: 0.903; scale-y: 0.716; }
        frame 33 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_charred_pile2";
        frame-count: 43;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { x: 28.6; y: 112.6; scale-x: 0.25; scale-y: 0.179; cel: 0; image: IMAGE_REANIM_ZOMBIE_CHARRED_PILE2; }
        frame 22 { x: 25.7; y: 110.8; scale-x: 0.28; scale-y: 0.207; cel: -10000; image: none; }
        frame 23 { x: 22.8; y: 109.2; scale-x: 0.311; scale-y: 0.236; }
        frame 24 { x: 19.9; y: 107.4; scale-x: 0.341; scale-y: 0.265; }
        frame 25 { x: 17; y: 105.7; scale-x: 0.372; scale-y: 0.294; }
        frame 26 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_charred_pile2";
        frame-count: 43;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { x: 53; y: 116; scale-x: 0.25; scale-y: 0.179; cel: 0; image: IMAGE_REANIM_ZOMBIE_CHARRED_PILE2; }
        frame 22 { x: 49; y: 114; scale-x: 0.312; scale-y: 0.215; cel: -10000; image: none; }
        frame 23 { x: 45; y: 112; scale-x: 0.373; scale-y: 0.252; }
        frame 24 { x: 41; y: 110.1; scale-x: 0.435; scale-y: 0.289; }
        frame 25 { x: 36.9; y: 108.1; scale-x: 0.497; scale-y: 0.326; }
        frame 26 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_charred_pile1";
        frame-count: 43;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { x: 21.6; y: 114.3; scale-x: 0.346; scale-y: 0.335; cel: 0; image: IMAGE_REANIM_ZOMBIE_CHARRED_PILE1; }
        frame 22 { x: 19.8; y: 114.2; scale-x: 0.365; scale-y: 0.355; cel: -10000; image: none; }
        frame 23 { x: 18; y: 114.1; scale-x: 0.385; scale-y: 0.375; }
        frame 24 { x: 16.2; y: 113.8; scale-x: 0.405; scale-y: 0.395; }
        frame 25 { x: 14.4; y: 113.7; scale-x: 0.425; scale-y: 0.414; }
        frame 26 { x: 12.6; y: 113.6; scale-x: 0.445; scale-y: 0.434; }
        frame 27 { x: 10.7; y: 113.4; scale-x: 0.464; scale-y: 0.454; }
        frame 28 { x: 8.9; y: 113.3; scale-x: 0.484; scale-y: 0.474; }
        frame 29 { x: 7.1; y: 113.2; skew-x: 0.1; skew-y: 0.1; scale-x: 0.504; scale-y: 0.494; }
        frame 30 { x: 5.3; y: 113.1; skew-x: -10000; skew-y: -10000; scale-x: 0.524; scale-y: 0.514; }
        frame 31 { x: 3.5; y: 112.8; skew-x: 0.3; skew-y: 0.3; scale-x: 0.544; scale-y: 0.534; }
        frame 32 { x: 1.9; y: 112.6; skew-x: -10000; skew-y: -10000; scale-x: 0.563; scale-y: 0.554; }
        frame 33 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_charred_pile1.2";
        frame-count: 43;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 21 { x: 37.9; y: 119.5; scale-x: 0.413; scale-y: 0.35; cel: 0; image: IMAGE_REANIM_ZOMBIE_CHARRED_PILE1; }
        frame 22 { x: 37; y: 119; scale-x: 0.427; scale-y: 0.373; cel: -10000; image: none; }
        frame 23 { x: 36; y: 118.6; scale-x: 0.44; scale-y: 0.395; }
        frame 24 { x: 35.1; y: 118.1; scale-x: 0.454; scale-y: 0.417; }
        frame 25 { x: 34.2; y: 117.6; scale-x: 0.468; scale-y: 0.439; }
        frame 26 { x: 33.3; y: 117.2; scale-x: 0.481; scale-y: 0.461; }
        frame 27 { x: 32.5; y: 116.7; scale-x: 0.495; scale-y: 0.483; }
        frame 28 { x: 31.5; y: 116.3; scale-x: 0.509; scale-y: 0.505; }
        frame 29 { x: 30.6; y: 115.8; scale-x: 0.522; scale-y: 0.527; }
        frame 30 { x: 29.7; y: 115.4; scale-x: 0.536; scale-y: 0.549; }
        frame 31 { x: 28.8; y: 114.8; scale-x: 0.55; scale-y: 0.571; }
        frame 32 { x: 27.8; y: 114.5; scale-x: 0.563; scale-y: 0.593; }
        frame 33 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_charred_head";
        frame-count: 43;
        frame 0 { x: -4.3; y: 14.4; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_CHARRED_HEAD; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 38 { x: 1.4; y: 44.9; skew-x: 10; skew-y: 10; scale-x: 0.799; scale-y: 0.757; }
        frame 39 { x: 7.7; y: 76; skew-x: 20.3; skew-y: 20.3; scale-x: -10000; scale-y: 0.714; }
        frame 40 { x: 8.5; y: 67; skew-x: -10000; skew-y: -10000; scale-y: 0.799; }
        frame 41 { x: -10000; y: 70.5; scale-x: 0.798; scale-y: 0.798; }
        frame 42 { y: 73.8; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "Zombie_hair";
        frame-count: 43;
        frame 0 { x: -3.2; y: 14.9; scale-x: 0.751; scale-y: 0.852; image: IMAGE_REANIM_ZOMBIE_HAIR; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 38 { x: -1.2; y: 35.9; skew-x: 1.8; skew-y: 1.8; }
        frame 39 { x: 8.1; y: 79.4; skew-x: 14.8; skew-y: 16.4; scale-x: 0.75; scale-y: 0.731; }
        frame 40 { x: 7.7; y: 70.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 8.1; y: 72.8; }
        frame 42 { x: -10000; y: 77.4; }
    }
    Track {
        source-name: "Zombie_charred_blink";
        frame-count: 43;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 11 { x: -0.3; y: 29.6; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_CHARRED_EYES1; }
        frame 12 { x: -0.5; y: 29.9; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_ZOMBIE_CHARRED_EYES2; }
        frame 13 { x: -0.3; y: 29.6; image: IMAGE_REANIM_ZOMBIE_CHARRED_EYES1; }
        frame 14 { x: -10000; y: -10000; cel: -1; image: none; }
        frame 15 { cel: 0; }
        frame 16 { x: -0.5; y: 29.9; cel: -10000; image: IMAGE_REANIM_ZOMBIE_CHARRED_EYES2; }
        frame 17 { x: -0.3; y: 29.6; image: IMAGE_REANIM_ZOMBIE_CHARRED_EYES1; }
        frame 18 { x: -10000; y: -10000; cel: -1; image: none; }
        frame 19 { cel: -10000; }
    }
}
