export component Caltrop {
    fps: 12;
    Track {
        source-name: "anim_attack";
        frame-count: 35;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 25 { cel: 0; }
        frame 26 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 35;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { cel: 0; }
        frame 5 { cel: -10000; }
        frame 25 { cel: -1; }
        frame 26 { cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 35;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: -0.5; y: 44.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CALTROP_BODY; }
        frame 5 { x: -0.8; y: 45; scale-x: 0.807; scale-y: 0.786; cel: -10000; image: none; }
        frame 6 { x: -1.1; y: 45.6; scale-x: 0.814; scale-y: 0.772; }
        frame 7 { x: -1.5; y: 46; scale-x: 0.82; scale-y: 0.758; }
        frame 8 { x: -1.8; y: 46.5; scale-x: 0.827; scale-y: 0.744; }
        frame 9 { x: -2.2; y: 47; scale-x: 0.834; scale-y: 0.73; }
        frame 10 { x: -1.9; y: 46.5; scale-x: 0.827; scale-y: 0.744; }
        frame 11 { x: -1.5; y: 46; scale-x: 0.82; scale-y: 0.758; }
        frame 12 { x: -1.2; y: 45.5; scale-x: 0.814; scale-y: 0.772; }
        frame 13 { x: -0.8; y: 45; scale-x: 0.807; scale-y: 0.786; }
        frame 14 { x: -0.5; y: 44.5; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: -0.2; y: 44.1; scale-x: 0.795; scale-y: 0.811; }
        frame 16 { x: -0; y: 43.7; scale-x: 0.79; scale-y: 0.822; }
        frame 17 { x: 0.1; y: 43.3; scale-x: 0.786; scale-y: 0.833; }
        frame 18 { x: 0.3; y: 42.9; scale-x: 0.781; scale-y: 0.845; }
        frame 19 { x: 0.6; y: 42.5; scale-x: 0.776; scale-y: 0.856; }
        frame 20 { x: 0.3; y: 42.9; scale-x: 0.781; scale-y: 0.845; }
        frame 21 { x: 0.1; y: 43.3; scale-x: 0.786; scale-y: 0.833; }
        frame 22 { x: -0; y: 43.8; scale-x: 0.79; scale-y: 0.822; }
        frame 23 { x: -0.2; y: 44.2; scale-x: 0.795; scale-y: 0.811; }
        frame 24 { x: -0.5; y: 44.5; scale-x: 0.8; scale-y: 0.8; }
        frame 25 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 0.3; y: 42.8; scale-x: 0.782; scale-y: 0.851; }
        frame 27 { x: 1.3; y: 41; scale-x: 0.765; scale-y: 0.902; }
        frame 28 { x: 2.1; y: 39.1; scale-x: 0.747; scale-y: 0.953; }
        frame 29 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 1.5; y: 40.5; scale-x: 0.76; scale-y: 0.915; }
        frame 32 { x: 0.8; y: 41.8; scale-x: 0.773; scale-y: 0.876; }
        frame 33 { x: 0.1; y: 43.1; scale-x: 0.787; scale-y: 0.838; }
        frame 34 { x: -0.5; y: 44.5; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Caltrop_horn1";
        frame-count: 35;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 8.1; y: 45.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CALTROP_HORN1; }
        frame 5 { x: 7.3; y: 46.1; skew-x: -1.9; skew-y: -1.9; scale-x: -10000; scale-y: 0.787; cel: -10000; image: none; }
        frame 6 { x: 6.6; y: 46.9; skew-x: -3.9; skew-y: -3.9; scale-y: 0.775; }
        frame 7 { x: 5.8; y: 47.6; skew-x: -6.2; skew-y: -6.2; scale-x: 0.799; scale-y: 0.762; }
        frame 8 { x: 5.2; y: 48.4; skew-x: -8.2; skew-y: -8.2; scale-x: -10000; scale-y: 0.75; }
        frame 9 { x: 4.4; y: 49.2; skew-x: -10.3; skew-y: -10.3; scale-y: 0.738; }
        frame 10 { x: 5.1; y: 48.5; skew-x: -8.2; skew-y: -8.2; scale-y: 0.75; }
        frame 11 { x: 5.8; y: 47.7; skew-x: -6.2; skew-y: -6.2; scale-y: 0.762; }
        frame 12 { x: 6.6; y: 47; skew-x: -3.9; skew-y: -3.9; scale-y: 0.775; }
        frame 13 { x: 7.3; y: 46.3; skew-x: -1.9; skew-y: -1.9; scale-x: 0.8; scale-y: 0.787; }
        frame 14 { x: 8.1; y: 45.5; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.8; }
        frame 15 { x: 8.5; y: 44.9; skew-x: 0.8; skew-y: 0.8; scale-y: 0.811; }
        frame 16 { x: 8.8; y: 44.3; skew-x: 1.5; skew-y: 1.5; scale-y: 0.822; }
        frame 17 { x: 9.2; y: 43.6; skew-x: 2.3; skew-y: 2.3; scale-y: 0.833; }
        frame 18 { x: 9.5; y: 43.2; skew-x: 3.1; skew-y: 3.1; scale-y: 0.844; }
        frame 19 { x: 10; y: 42.6; skew-x: 4.1; skew-y: 4; scale-y: 0.856; }
        frame 20 { x: 9.6; y: 43.2; skew-x: 3.1; skew-y: 3.1; scale-y: 0.844; }
        frame 21 { x: 9.2; y: 43.8; skew-x: 2.3; skew-y: 2.3; scale-y: 0.833; }
        frame 22 { x: 8.9; y: 44.3; skew-x: 1.5; skew-y: 1.5; scale-y: 0.822; }
        frame 23 { x: 8.5; y: 44.9; skew-x: 0.8; skew-y: 0.8; scale-y: 0.811; }
        frame 24 { x: 8.1; y: 45.5; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { x: 9.7; y: 42.6; skew-x: 2.3; skew-y: 1.8; scale-x: 0.765; scale-y: 0.881; }
        frame 27 { x: 11.3; y: 40; skew-x: 4.5; skew-y: 3.5; scale-x: 0.731; scale-y: 0.962; }
        frame 28 { x: 13.1; y: 37.1; skew-x: 6.8; skew-y: 5.5; scale-x: 0.696; scale-y: 1.043; }
        frame 29 { x: -10000; y: 36.5; skew-x: -10000; skew-y: 5.3; scale-x: -10000; scale-y: 1.072; }
        frame 30 { y: 35.7; skew-y: 5.5; scale-y: 1.102; }
        frame 31 { x: 11.8; y: 38; skew-x: 5; skew-y: 4; scale-x: 0.722; scale-y: 1.026; }
        frame 32 { x: 10.6; y: 40.5; skew-x: 3.3; skew-y: 2.6; scale-x: 0.748; scale-y: 0.951; }
        frame 33 { x: 9.3; y: 42.9; skew-x: 1.5; skew-y: 1.3; scale-x: 0.774; scale-y: 0.875; }
        frame 34 { x: 8.1; y: 45.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Caltrop_horn2";
        frame-count: 35;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 24; y: 41.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CALTROP_HORN2; }
        frame 5 { x: 23.5; y: 42; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: 0.795; cel: -10000; image: none; }
        frame 6 { x: 22.9; y: 42.5; skew-x: -3.7; skew-y: -3.7; scale-y: 0.79; }
        frame 7 { x: 22.4; y: 43.1; skew-x: -5.7; skew-y: -5.7; scale-y: 0.785; }
        frame 8 { x: 21.9; y: 43.8; skew-x: -7.7; skew-y: -7.7; scale-x: 0.799; scale-y: 0.779; }
        frame 9 { x: 21.4; y: 44.4; skew-x: -9.6; skew-y: -9.6; scale-x: 0.8; scale-y: 0.775; }
        frame 10 { x: 21.9; y: 43.8; skew-x: -7.7; skew-y: -7.7; scale-x: 0.799; scale-y: 0.779; }
        frame 11 { x: 22.4; y: 43.1; skew-x: -5.7; skew-y: -5.7; scale-x: 0.8; scale-y: 0.785; }
        frame 12 { x: 22.9; y: 42.5; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; scale-y: 0.79; }
        frame 13 { x: 23.5; y: 41.9; skew-x: -1.7; skew-y: -1.7; scale-y: 0.795; }
        frame 14 { x: 24; y: 41.4; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 15 { x: 24.3; y: 40.8; skew-x: 0.8; skew-y: 0.8; scale-y: 0.811; }
        frame 16 { x: 24.5; y: 40.3; skew-x: 1.5; skew-y: 1.5; scale-y: 0.822; }
        frame 17 { x: 24.7; y: 39.6; skew-x: 2.3; skew-y: 2.3; scale-y: 0.833; }
        frame 18 { x: 24.9; y: 39; skew-x: 3; skew-y: 3; scale-y: 0.844; }
        frame 19 { x: 25.1; y: 38.4; skew-x: 3.8; skew-y: 3.8; scale-y: 0.856; }
        frame 20 { x: 24.9; y: 39; skew-x: 3; skew-y: 3; scale-y: 0.844; }
        frame 21 { x: 24.7; y: 39.6; skew-x: 2.3; skew-y: 2.3; scale-y: 0.833; }
        frame 22 { x: 24.4; y: 40.2; skew-x: 1.5; skew-y: 1.5; scale-y: 0.822; }
        frame 23 { x: 24.2; y: 40.9; skew-x: 0.8; skew-y: 0.8; scale-y: 0.811; }
        frame 24 { x: 24; y: 41.4; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { x: 24.5; y: 38.5; scale-x: 0.768; scale-y: 0.897; }
        frame 27 { x: 24.8; y: 35.5; scale-x: 0.737; scale-y: 0.994; }
        frame 28 { x: 25.3; y: 32.5; scale-x: 0.705; scale-y: 1.09; }
        frame 29 { x: -10000; y: 31.9; scale-x: -10000; scale-y: 1.119; }
        frame 30 { y: 31.3; scale-y: 1.147; }
        frame 31 { x: 25; y: 33.8; scale-x: 0.729; scale-y: 1.06; }
        frame 32 { x: 24.7; y: 36.3; scale-x: 0.753; scale-y: 0.973; }
        frame 33 { x: 24.4; y: 38.9; scale-x: 0.776; scale-y: 0.887; }
        frame 34 { x: 24; y: 41.4; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Caltrop_horn3";
        frame-count: 35;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 45.4; y: 43; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CALTROP_HORN3; }
        frame 5 { x: 45.7; y: 43.1; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 46.1; y: -10000; skew-x: 2.8; skew-y: 2.8; }
        frame 7 { x: 46.5; y: 43.2; skew-x: 4.3; skew-y: 4.3; }
        frame 8 { x: 47; y: 43.4; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 47.4; y: 43.5; skew-x: 7.5; skew-y: 7.5; scale-x: 0.8; scale-y: 0.8; }
        frame 10 { x: 46.9; y: 43.4; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 11 { x: 46.5; y: 43.3; skew-x: 4.3; skew-y: 4.3; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: 46.1; y: 43.2; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 45.8; y: 43.1; skew-x: 1.3; skew-y: 1.3; }
        frame 14 { x: 45.4; y: 43; skew-x: 0; skew-y: 0; }
        frame 15 { x: 45.1; y: 42.6; skew-x: -0.9; skew-y: -0.9; scale-y: 0.811; }
        frame 16 { x: 44.9; y: 42.1; skew-x: -1.9; skew-y: -1.9; scale-y: 0.822; }
        frame 17 { x: 44.5; y: 41.7; skew-x: -2.9; skew-y: -2.9; scale-y: 0.833; }
        frame 18 { x: 44.3; y: 41.3; skew-x: -3.9; skew-y: -3.9; scale-y: 0.844; }
        frame 19 { x: 44; y: 41; skew-x: -4.9; skew-y: -4.9; scale-y: 0.856; }
        frame 20 { x: 44.4; y: 41.4; skew-x: -3.9; skew-y: -3.9; scale-y: 0.844; }
        frame 21 { x: 44.5; y: 41.8; skew-x: -2.9; skew-y: -2.9; scale-y: 0.833; }
        frame 22 { x: 44.9; y: 42.3; skew-x: -1.9; skew-y: -1.9; scale-y: 0.822; }
        frame 23 { x: 45.1; y: 42.6; skew-x: -0.9; skew-y: -0.9; scale-y: 0.811; }
        frame 24 { x: 45.4; y: 43; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { x: 45.5; y: 40.1; scale-x: 0.769; scale-y: 0.905; }
        frame 27 { x: -10000; y: 37.3; scale-x: 0.739; scale-y: 1.009; }
        frame 28 { x: 45.6; y: 34.4; scale-x: 0.708; scale-y: 1.114; }
        frame 29 { x: -10000; y: 33.9; scale-x: -10000; scale-y: 1.136; }
        frame 30 { y: 33.2; scale-y: 1.158; }
        frame 31 { y: 35.6; scale-x: 0.731; scale-y: 1.069; }
        frame 32 { x: 45.5; y: 38.1; scale-x: 0.754; scale-y: 0.979; }
        frame 33 { x: -10000; y: 40.5; scale-x: 0.777; scale-y: 0.89; }
        frame 34 { x: 45.4; y: 43; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Caltrop_horn4";
        frame-count: 35;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 56.5; y: 49.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CALTROP_HORN4; }
        frame 5 { x: 56.7; y: -10000; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 57.1; y: 49.9; skew-x: 2; skew-y: 2; scale-x: 0.799; scale-y: 0.799; }
        frame 7 { x: 57.5; y: -10000; skew-x: 3; skew-y: 3; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 57.8; skew-x: 4.3; skew-y: 4.3; }
        frame 9 { x: 58; skew-x: 5.3; skew-y: 5.3; }
        frame 10 { x: 57.8; skew-x: 4.3; skew-y: 4.3; }
        frame 11 { x: 57.4; skew-x: 3; skew-y: 3; }
        frame 12 { x: 57; skew-x: 2; skew-y: 2; }
        frame 13 { x: 56.6; y: 49.8; skew-x: 1; skew-y: 1; scale-x: 0.8; scale-y: 0.8; }
        frame 14 { x: 56.5; y: -10000; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 56.3; y: 49.4; skew-x: -0.7; skew-y: -0.7; scale-y: 0.811; }
        frame 16 { x: 56; y: 49; skew-x: -1.5; skew-y: -1.5; scale-y: 0.822; }
        frame 17 { x: 55.7; y: 48.6; skew-x: -2.4; skew-y: -2.4; scale-y: 0.833; }
        frame 18 { x: 55.4; y: 48.3; skew-x: -3.2; skew-y: -3.2; scale-y: 0.844; }
        frame 19 { x: 55.1; y: 48; skew-x: -4.2; skew-y: -4.2; scale-y: 0.856; }
        frame 20 { x: 55.4; y: 48.4; skew-x: -3.2; skew-y: -3.2; scale-y: 0.844; }
        frame 21 { x: 55.7; y: 48.8; skew-x: -2.4; skew-y: -2.4; scale-y: 0.833; }
        frame 22 { x: 56; y: 49.1; skew-x: -1.5; skew-y: -1.5; scale-y: 0.822; }
        frame 23 { x: 56.3; y: 49.5; skew-x: -0.7; skew-y: -0.7; scale-y: 0.811; }
        frame 24 { x: 56.5; y: 49.8; skew-x: 0; skew-y: 0; scale-y: 0.8; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { x: 55.3; y: 47.5; skew-x: -3.9; skew-y: -3.2; scale-x: 0.769; scale-y: 0.903; }
        frame 27 { x: 54.1; y: 45.5; skew-x: -8.2; skew-y: -6.7; scale-x: 0.738; scale-y: 1.006; }
        frame 28 { x: 52.9; y: 43.4; skew-x: -12.4; skew-y: -10.1; scale-x: 0.707; scale-y: 1.11; }
        frame 29 { x: 52.8; y: 42.6; skew-x: -10000; skew-y: -9.9; scale-x: -10000; scale-y: 1.15; }
        frame 30 { x: 52.7; y: 41.8; skew-y: -10.1; scale-y: 1.191; }
        frame 31 { x: 53.8; y: 43.8; skew-x: -9.2; skew-y: -7.4; scale-x: 0.73; scale-y: 1.092; }
        frame 32 { x: 54.8; y: 45.8; skew-x: -6.2; skew-y: -4.9; scale-x: 0.753; scale-y: 0.995; }
        frame 33 { x: 55.6; y: 47.8; skew-x: -2.9; skew-y: -2.4; scale-x: 0.777; scale-y: 0.898; }
        frame 34 { x: 56.5; y: 49.8; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 35;
        frame 0 { cel: -1; }
        frame 1 { x: 19.4; y: 60.6; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CALTROP_BLINK1; }
        frame 2 { x: -10000; y: 60.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_CALTROP_BLINK2; }
        frame 3 { y: 60.6; image: IMAGE_REANIM_CALTROP_BLINK1; }
        frame 4 { y: -10000; cel: -1; image: none; }
        frame 5 { cel: -10000; }
    }
}
