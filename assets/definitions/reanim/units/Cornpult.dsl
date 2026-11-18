export component Cornpult {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 77;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 24 { cel: -1; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
        frame 58 { cel: -1; }
        frame 59 { cel: -10000; }
    }
    Track {
        source-name: "anim_full_idle";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 58 { cel: 0; }
        frame 59 { cel: -10000; }
    }
    Track {
        source-name: "Cornpult_husk5";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 55.7; y: 55.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSK5; }
        frame 6 { x: 55.4; y: 55.3; skew-x: -1.2; skew-y: -1.2; scale-x: 0.787; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 55.1; y: 55; skew-x: -2.7; skew-y: -2.7; scale-x: 0.774; scale-y: 0.826; }
        frame 8 { x: 54.8; y: 54.8; skew-x: -4.2; skew-y: -4.2; scale-x: 0.762; scale-y: 0.839; }
        frame 9 { x: 55; y: 54.9; skew-x: -3.4; skew-y: -3.4; scale-x: 0.776; scale-y: 0.832; }
        frame 10 { x: 55.3; y: 55; skew-x: -2.7; skew-y: -2.7; scale-x: 0.79; scale-y: 0.826; }
        frame 11 { x: 55.6; y: 55.1; skew-x: -1.9; skew-y: -1.9; scale-x: 0.805; scale-y: 0.819; }
        frame 12 { x: 55.8; y: 55.3; skew-x: -1.2; skew-y: -1.2; scale-x: 0.819; scale-y: 0.813; }
        frame 13 { x: 56.1; y: 55.4; skew-x: -0.5; skew-y: -0.5; scale-x: 0.833; scale-y: 0.806; }
        frame 14 { x: 56.4; y: 55.5; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 15 { x: 57.4; y: 56.1; skew-x: 0.8; skew-y: 12.3; scale-x: 0.882; scale-y: 0.815; }
        frame 16 { x: 58.4; y: 56.7; skew-x: 1.5; skew-y: 24.6; scale-x: 0.917; scale-y: 0.83; }
        frame 17 { x: 59.3; y: 57.5; skew-x: 2.5; skew-y: 37; scale-x: 0.952; scale-y: 0.846; }
        frame 18 { x: 58.7; y: 57.1; skew-x: 2; skew-y: 30.8; scale-x: 0.927; scale-y: 0.837; }
        frame 19 { x: 58; y: 56.7; skew-x: 1.5; skew-y: 24.6; scale-x: 0.902; scale-y: 0.83; }
        frame 20 { x: 57.5; y: 56.4; skew-x: 1.3; skew-y: 18.3; scale-x: 0.876; scale-y: 0.822; }
        frame 21 { x: 56.8; y: 56; skew-x: 0.8; skew-y: 12.3; scale-x: 0.851; scale-y: 0.815; }
        frame 22 { x: 56.2; y: 55.7; skew-x: 0.3; skew-y: 6; scale-x: 0.825; scale-y: 0.807; }
        frame 23 { x: 55.7; y: 55.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 55.5; y: 55.4; skew-x: -0.7; skew-y: -0.7; scale-x: 0.792; scale-y: 0.808; }
        frame 26 { x: 55.4; y: 55.2; skew-x: -1.5; skew-y: -1.5; scale-x: 0.785; scale-y: 0.815; }
        frame 27 { x: 55.1; y: 55; skew-x: -2.4; skew-y: -2.4; scale-x: 0.777; scale-y: 0.823; }
        frame 28 { x: 55; skew-x: -3.2; skew-y: -3.2; scale-x: 0.769; scale-y: 0.831; }
        frame 29 { x: 54.8; y: 54.8; skew-x: -4.2; skew-y: -4.2; scale-x: 0.762; scale-y: 0.839; }
        frame 30 { x: 55.2; y: 55.1; skew-x: -1.9; skew-y: -1.9; scale-x: 0.781; scale-y: 0.819; }
        frame 31 { x: 55.7; y: 55.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 32 { x: 56.5; y: 56; skew-x: 0.5; skew-y: 9.1; scale-x: 0.838; scale-y: 0.811; }
        frame 33 { x: 57.5; y: 56.4; skew-x: 1.3; skew-y: 18.3; scale-x: 0.876; scale-y: 0.822; }
        frame 34 { x: 58.5; y: 57; skew-x: 1.8; skew-y: 27.6; scale-x: 0.914; scale-y: 0.833; }
        frame 35 { x: 59.3; y: 57.5; skew-x: 2.5; skew-y: 37; scale-x: 0.952; scale-y: 0.846; }
        frame 36 { x: 59.2; y: 57.6; skew-x: -10000; skew-y: 36.9; scale-x: -10000; scale-y: 0.845; }
        frame 37 { x: 59.3; y: 57.5; skew-y: 37; scale-y: 0.846; }
        frame 38 { x: 59.2; y: 57.6; skew-y: 36.9; scale-y: 0.845; }
        frame 39 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 44 { x: 59.3; y: 57.5; skew-y: 37; scale-y: 0.846; }
        frame 45 { x: -10000; y: 57.6; skew-y: 36.9; scale-y: 0.845; }
        frame 46 { y: -10000; skew-y: -10000; scale-y: 0.844; }
        frame 47 { scale-y: -10000; }
        frame 48 { x: 59.2; }
        frame 49 { x: -10000; }
        frame 51 { scale-y: 0.845; }
        frame 52 { x: 58.6; y: 57.2; skew-x: 2; skew-y: 30.6; scale-x: 0.927; scale-y: 0.836; }
        frame 53 { x: 58; y: 56.8; skew-x: 1.5; skew-y: 24.6; scale-x: 0.901; scale-y: 0.829; }
        frame 54 { x: 57.5; y: 56.4; skew-x: 1.3; skew-y: 18.3; scale-x: 0.876; scale-y: 0.822; }
        frame 55 { x: 56.8; y: 56; skew-x: 0.8; skew-y: 12.3; scale-x: 0.851; scale-y: 0.814; }
        frame 56 { x: 56.2; y: 55.8; skew-x: 0.3; skew-y: 6; scale-x: 0.825; scale-y: 0.807; }
        frame 57 { x: 55.7; y: 55.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 55.4; y: 55.3; skew-x: -1.2; skew-y: -1.2; scale-x: 0.787; scale-y: 0.813; }
        frame 60 { x: 55.1; y: 55; skew-x: -2.7; skew-y: -2.7; scale-x: 0.774; scale-y: 0.826; }
        frame 61 { x: 54.8; y: 54.8; skew-x: -4.2; skew-y: -4.2; scale-x: 0.762; scale-y: 0.839; }
        frame 62 { x: 55; y: 54.9; skew-x: -3.4; skew-y: -3.4; scale-x: 0.776; scale-y: 0.832; }
        frame 63 { x: 55.3; y: 55; skew-x: -2.7; skew-y: -2.7; scale-x: 0.79; scale-y: 0.826; }
        frame 64 { x: 55.6; y: 55.1; skew-x: -1.9; skew-y: -1.9; scale-x: 0.805; scale-y: 0.819; }
        frame 65 { x: 55.8; y: 55.3; skew-x: -1.2; skew-y: -1.2; scale-x: 0.819; scale-y: 0.813; }
        frame 66 { x: 56.1; y: 55.4; skew-x: -0.5; skew-y: -0.5; scale-x: 0.833; scale-y: 0.806; }
        frame 67 { x: 56.4; y: 55.5; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 68 { x: 57.4; y: 56.1; skew-x: 0.8; skew-y: 12.3; scale-x: 0.882; scale-y: 0.815; }
        frame 69 { x: 58.4; y: 56.7; skew-x: 1.5; skew-y: 24.6; scale-x: 0.917; scale-y: 0.83; }
        frame 70 { x: 59.3; y: 57.5; skew-x: 2.5; skew-y: 37; scale-x: 0.952; scale-y: 0.846; }
        frame 71 { x: 58.7; y: 57.1; skew-x: 2; skew-y: 30.8; scale-x: 0.927; scale-y: 0.837; }
        frame 72 { x: 58; y: 56.7; skew-x: 1.5; skew-y: 24.6; scale-x: 0.902; scale-y: 0.83; }
        frame 73 { x: 57.5; y: 56.4; skew-x: 1.3; skew-y: 18.3; scale-x: 0.876; scale-y: 0.822; }
        frame 74 { x: 56.8; y: 56; skew-x: 0.8; skew-y: 12.3; scale-x: 0.851; scale-y: 0.815; }
        frame 75 { x: 56.2; y: 55.7; skew-x: 0.3; skew-y: 6; scale-x: 0.825; scale-y: 0.807; }
        frame 76 { x: 55.7; y: 55.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cornpult_husk6";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 16.8; y: 55.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSK6; }
        frame 6 { x: 17.3; y: 54.3; skew-x: 2; skew-y: 2; scale-x: 0.787; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 17.9; y: 53.5; skew-x: 4; skew-y: 4; scale-x: 0.774; scale-y: 0.826; }
        frame 8 { x: 18.6; y: 52.8; skew-x: 6.1; skew-y: 6.1; scale-x: 0.762; scale-y: 0.839; }
        frame 9 { x: 18; y: 53.1; skew-x: 5; skew-y: 5; scale-x: 0.776; scale-y: 0.832; }
        frame 10 { x: 17.5; y: 53.6; skew-x: 4; skew-y: 4; scale-x: 0.79; scale-y: 0.826; }
        frame 11 { x: 16.9; y: 54; skew-x: 3; skew-y: 3; scale-x: 0.804; scale-y: 0.819; }
        frame 12 { x: 16.3; y: 54.4; skew-x: 2; skew-y: 2; scale-x: 0.819; scale-y: 0.813; }
        frame 13 { x: 15.8; y: 54.8; skew-x: 1; skew-y: 1; scale-x: 0.833; scale-y: 0.806; }
        frame 14 { x: 15.2; y: 55.1; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 15 { x: 14.3; y: 55.8; skew-x: -1.2; skew-y: -10000; scale-x: 0.886; scale-y: 0.749; }
        frame 16 { x: 13.5; y: 56.5; skew-x: -2.7; scale-x: 0.924; scale-y: 0.698; }
        frame 17 { x: 12.5; y: 57.3; skew-x: -4.4; scale-x: 0.962; scale-y: 0.647; }
        frame 18 { x: 13.2; y: 56.9; skew-x: -3.5; scale-x: 0.935; scale-y: 0.672; }
        frame 19 { x: 13.9; y: 56.5; skew-x: -2.7; scale-x: 0.908; scale-y: 0.698; }
        frame 20 { x: 14.6; y: 56.1; skew-x: -2; scale-x: 0.881; scale-y: 0.723; }
        frame 21 { x: 15.3; y: 55.8; skew-x: -1.2; scale-x: 0.854; scale-y: 0.749; }
        frame 22 { x: 16; y: 55.4; skew-x: -0.5; scale-x: 0.827; scale-y: 0.774; }
        frame 23 { x: 16.8; y: 55.1; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 17.1; y: 54.6; skew-x: 1.1; skew-y: 1.1; scale-x: 0.792; scale-y: 0.808; }
        frame 26 { x: 17.4; y: 54.1; skew-x: 2.3; skew-y: 2.3; scale-x: 0.785; scale-y: 0.815; }
        frame 27 { x: 17.8; y: 53.8; skew-x: 3.5; skew-y: 3.5; scale-x: 0.777; scale-y: 0.823; }
        frame 28 { x: 18.2; y: 53.2; skew-x: 4.8; skew-y: 4.8; scale-x: 0.769; scale-y: 0.831; }
        frame 29 { x: 18.6; y: 52.8; skew-x: 6.1; skew-y: 6.1; scale-x: 0.762; scale-y: 0.839; }
        frame 30 { x: 17.8; y: 54; skew-x: 3; skew-y: 3; scale-x: 0.781; scale-y: 0.819; }
        frame 31 { x: 16.8; y: 55.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 32 { x: 15.7; y: 55.6; skew-x: -0.9; skew-y: -10000; scale-x: 0.84; scale-y: 0.762; }
        frame 33 { x: 14.7; y: 56.1; skew-x: -2; scale-x: 0.881; scale-y: 0.723; }
        frame 34 { x: 13.6; y: 56.7; skew-x: -3.2; scale-x: 0.921; scale-y: 0.685; }
        frame 35 { x: 12.5; y: 57.3; skew-x: -4.4; scale-x: 0.962; scale-y: 0.647; }
        frame 36 { x: -10000; y: -10000; skew-x: -4.2; scale-x: -10000; scale-y: -10000; }
        frame 37 { skew-x: -4.4; }
        frame 38 { skew-x: -4.2; }
        frame 39 { skew-x: -10000; }
        frame 44 { skew-x: -4.4; }
        frame 45 { skew-x: -4.2; }
        frame 46 { skew-x: -10000; }
        frame 48 { x: 12.4; }
        frame 49 { x: -10000; }
        frame 50 { y: 57.2; }
        frame 51 { x: 12.5; y: 57.3; }
        frame 52 { x: 13.2; y: 56.9; skew-x: -3.4; scale-x: 0.935; scale-y: 0.672; }
        frame 53 { x: 13.8; y: 56.5; skew-x: -2.7; scale-x: 0.908; scale-y: 0.698; }
        frame 54 { x: 14.6; y: 56.1; skew-x: -1.9; scale-x: 0.881; scale-y: 0.723; }
        frame 55 { x: 15.3; y: 55.8; skew-x: -1.2; scale-x: 0.854; scale-y: 0.749; }
        frame 56 { x: 16; y: 55.4; skew-x: -0.5; scale-x: 0.827; scale-y: 0.774; }
        frame 57 { x: 16.8; y: 55.1; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 17.3; y: 54.3; skew-x: 2; skew-y: 2; scale-x: 0.787; scale-y: 0.813; }
        frame 60 { x: 17.9; y: 53.5; skew-x: 4; skew-y: 4; scale-x: 0.774; scale-y: 0.826; }
        frame 61 { x: 18.6; y: 52.8; skew-x: 6.1; skew-y: 6.1; scale-x: 0.762; scale-y: 0.839; }
        frame 62 { x: 18; y: 53.1; skew-x: 5; skew-y: 5; scale-x: 0.776; scale-y: 0.832; }
        frame 63 { x: 17.5; y: 53.6; skew-x: 4; skew-y: 4; scale-x: 0.79; scale-y: 0.826; }
        frame 64 { x: 16.9; y: 54; skew-x: 3; skew-y: 3; scale-x: 0.804; scale-y: 0.819; }
        frame 65 { x: 16.3; y: 54.4; skew-x: 2; skew-y: 2; scale-x: 0.819; scale-y: 0.813; }
        frame 66 { x: 15.8; y: 54.8; skew-x: 1; skew-y: 1; scale-x: 0.833; scale-y: 0.806; }
        frame 67 { x: 15.2; y: 55.1; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 68 { x: 14.3; y: 55.8; skew-x: -1.2; skew-y: -10000; scale-x: 0.886; scale-y: 0.749; }
        frame 69 { x: 13.5; y: 56.5; skew-x: -2.7; scale-x: 0.924; scale-y: 0.698; }
        frame 70 { x: 12.5; y: 57.3; skew-x: -4.4; scale-x: 0.962; scale-y: 0.647; }
        frame 71 { x: 13.2; y: 56.9; skew-x: -3.5; scale-x: 0.935; scale-y: 0.672; }
        frame 72 { x: 13.9; y: 56.5; skew-x: -2.7; scale-x: 0.908; scale-y: 0.698; }
        frame 73 { x: 14.6; y: 56.1; skew-x: -2; scale-x: 0.881; scale-y: 0.723; }
        frame 74 { x: 15.3; y: 55.8; skew-x: -1.2; scale-x: 0.854; scale-y: 0.749; }
        frame 75 { x: 16; y: 55.4; skew-x: -0.5; scale-x: 0.827; scale-y: 0.774; }
        frame 76 { x: 16.8; y: 55.1; skew-x: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 23.4; y: 18.2; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_BODY; }
        frame 6 { x: 23.2; y: 18.6; scale-x: 0.807; scale-y: 0.795; cel: -10000; image: none; }
        frame 7 { x: 23; y: 18.9; scale-x: 0.813; scale-y: 0.79; }
        frame 8 { x: 22.9; y: 19.3; scale-x: 0.82; scale-y: 0.784; }
        frame 9 { x: 22.7; y: 19.6; scale-x: 0.827; scale-y: 0.779; }
        frame 10 { x: 22.5; y: 20; scale-x: 0.834; scale-y: 0.774; }
        frame 11 { x: 22.3; y: 20.3; scale-x: 0.84; scale-y: 0.769; }
        frame 12 { x: 22.1; y: 20.7; scale-x: 0.847; scale-y: 0.763; }
        frame 13 { x: 21.9; y: 21; scale-x: 0.854; scale-y: 0.758; }
        frame 14 { x: 21.8; y: 21.4; scale-x: 0.861; scale-y: 0.753; }
        frame 15 { x: 22; y: 21; scale-x: 0.854; scale-y: 0.758; }
        frame 16 { x: 22.1; y: 20.7; scale-x: 0.847; scale-y: 0.763; }
        frame 17 { x: 22.3; y: 20.3; scale-x: 0.84; scale-y: 0.769; }
        frame 18 { x: 22.5; y: 20; scale-x: 0.834; scale-y: 0.774; }
        frame 19 { x: 22.7; y: 19.6; scale-x: 0.827; scale-y: 0.779; }
        frame 20 { x: 22.9; y: 19.3; scale-x: 0.82; scale-y: 0.784; }
        frame 21 { x: 23; y: 18.9; scale-x: 0.813; scale-y: 0.79; }
        frame 22 { x: 23.2; y: 18.6; scale-x: 0.807; scale-y: 0.795; }
        frame 23 { x: 23.4; y: 18.2; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 21.6; y: 18.1; skew-y: -1.7; scale-y: 0.802; }
        frame 26 { x: 19.7; y: -10000; skew-y: -3.7; scale-y: 0.804; }
        frame 27 { x: 17.8; skew-y: -5.7; scale-y: 0.807; }
        frame 28 { x: 16.1; skew-y: -7.5; scale-y: 0.809; }
        frame 29 { x: 14.2; y: 18.2; skew-y: -9.5; scale-y: 0.811; }
        frame 30 { x: 15.9; y: -10000; skew-y: -7.7; scale-y: 0.808; }
        frame 31 { x: 17.7; skew-y: -5.9; scale-y: 0.804; }
        frame 32 { x: 20.7; y: 18.1; skew-y: -2.7; scale-y: -10000; }
        frame 33 { x: 23.4; y: 18; skew-y: 0; scale-y: 0.805; }
        frame 34 { x: 26.3; y: 18.1; skew-y: 3; scale-y: -10000; }
        frame 35 { x: 29.3; y: 18.2; skew-y: 6.2; }
        frame 36 { x: 29.9; y: -10000; skew-y: 6.8; scale-y: 0.806; }
        frame 37 { x: 30.7; skew-y: 7.7; scale-y: 0.807; }
        frame 38 { x: 30.4; skew-y: 7.3; scale-y: -10000; }
        frame 39 { x: 30.3; skew-y: -10000; scale-y: 0.806; }
        frame 40 { x: 30; skew-y: 7; scale-y: -10000; }
        frame 41 { x: 29.9; skew-y: 6.8; scale-y: 0.805; }
        frame 42 { x: 29.6; skew-y: 6.5; scale-y: -10000; }
        frame 43 { x: 29.4; skew-y: 6.3; }
        frame 44 { x: 29.3; skew-y: 6.2; }
        frame 45 { x: 29.4; skew-y: 6.3; }
        frame 46 { x: -10000; skew-y: -10000; }
        frame 48 { x: 29.6; skew-y: 6.5; }
        frame 49 { x: 29.7; skew-y: -10000; }
        frame 50 { x: -10000; skew-y: 6.6; }
        frame 51 { x: 29.9; skew-y: 6.8; scale-y: 0.806; }
        frame 52 { x: 28.8; skew-y: 5.5; scale-y: 0.804; }
        frame 53 { x: 27.8; y: 18.1; skew-y: 4.5; scale-y: -10000; }
        frame 54 { x: 26.6; y: 18.2; skew-y: 3.3; scale-y: 0.803; }
        frame 55 { x: 25.6; y: -10000; skew-y: 2.3; scale-y: 0.802; }
        frame 56 { x: 24.5; y: 18.1; skew-y: 1; scale-y: 0.801; }
        frame 57 { x: 23.4; y: 18.2; skew-y: 0; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
        frame 59 { x: 23.2; y: 18.6; scale-x: 0.807; scale-y: 0.795; }
        frame 60 { x: 23; y: 18.9; scale-x: 0.813; scale-y: 0.79; }
        frame 61 { x: 22.9; y: 19.3; scale-x: 0.82; scale-y: 0.784; }
        frame 62 { x: 22.7; y: 19.6; scale-x: 0.827; scale-y: 0.779; }
        frame 63 { x: 22.5; y: 20; scale-x: 0.834; scale-y: 0.774; }
        frame 64 { x: 22.3; y: 20.3; scale-x: 0.84; scale-y: 0.769; }
        frame 65 { x: 22.1; y: 20.7; scale-x: 0.847; scale-y: 0.763; }
        frame 66 { x: 21.9; y: 21; scale-x: 0.854; scale-y: 0.758; }
        frame 67 { x: 21.8; y: 21.4; scale-x: 0.861; scale-y: 0.753; }
        frame 68 { x: 22; y: 21; scale-x: 0.854; scale-y: 0.758; }
        frame 69 { x: 22.1; y: 20.7; scale-x: 0.847; scale-y: 0.763; }
        frame 70 { x: 22.3; y: 20.3; scale-x: 0.84; scale-y: 0.769; }
        frame 71 { x: 22.5; y: 20; scale-x: 0.834; scale-y: 0.774; }
        frame 72 { x: 22.7; y: 19.6; scale-x: 0.827; scale-y: 0.779; }
        frame 73 { x: 22.9; y: 19.3; scale-x: 0.82; scale-y: 0.784; }
        frame 74 { x: 23; y: 18.9; scale-x: 0.813; scale-y: 0.79; }
        frame 75 { x: 23.2; y: 18.6; scale-x: 0.807; scale-y: 0.795; }
        frame 76 { x: 23.4; y: 18.2; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cornpult_blink";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { x: 45.8; y: 46.2; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_BLINK1; }
        frame 2 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_CORNPULT_BLINK2; }
        frame 3 { image: IMAGE_REANIM_CORNPULT_BLINK1; }
        frame 4 { cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 36 { x: 49.2; skew-y: 10.4; scale-y: 0.813; cel: 0; }
        frame 37 { x: 49.1; skew-y: 9.1; scale-y: 0.81; cel: -10000; image: IMAGE_REANIM_CORNPULT_BLINK2; }
        frame 38 { x: 48.9; skew-y: 9; scale-y: -10000; image: none; }
        frame 39 { x: 48.7; skew-y: -10000; }
        frame 40 { x: 48.5; skew-y: 9.1; }
        frame 41 { x: 48.6; skew-y: 9; }
        frame 42 { x: 48.7; skew-y: -10000; }
        frame 43 { x: 48.8; }
        frame 44 { x: 48.9; skew-y: 9.1; }
        frame 45 { x: 48.6; skew-y: 10.4; scale-y: 0.813; image: IMAGE_REANIM_CORNPULT_BLINK1; }
        frame 46 { x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 47 { cel: -10000; }
    }
    Track {
        source-name: "Cabbagepult_basket";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -16.5; y: 4.6; skew-x: 4.1; skew-y: 4.1; scale-x: 0.6; scale-y: 0.6; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_BASKET; }
        frame 6 { x: -14.7; y: -0.2; skew-x: 11; skew-y: 11; scale-x: 0.599; scale-y: 0.599; cel: -10000; image: none; }
        frame 7 { x: -12.6; y: -4.9; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: -13.7; y: -1.3; skew-x: 13; skew-y: 13; }
        frame 9 { x: -14.7; y: 2.3; skew-x: 8.1; skew-y: 8.1; }
        frame 10 { x: -15.7; y: 6.3; skew-x: 3.1; skew-y: 3.1; }
        frame 11 { x: -16.4; y: 10.2; skew-x: -1.5; skew-y: -1.5; }
        frame 12 { x: -16.9; y: 14.3; skew-x: -6.4; skew-y: -6.4; }
        frame 13 { x: -17.5; y: 18.5; skew-x: -11.4; skew-y: -11.4; }
        frame 14 { x: -17.8; y: 22.7; skew-x: -16.5; skew-y: -16.5; }
        frame 15 { x: -18.1; y: 24.5; skew-x: -17.5; skew-y: -17.5; }
        frame 16 { x: -18.5; y: 26.3; skew-x: -18.7; skew-y: -18.7; }
        frame 17 { x: -18.4; y: 23.1; skew-x: -15.4; skew-y: -15.4; }
        frame 18 { x: -18.1; y: 20; skew-x: -12.2; skew-y: -12.2; }
        frame 19 { x: -10000; y: 16.9; skew-x: -8.9; skew-y: -8.9; }
        frame 20 { x: -17.8; y: 13.6; skew-x: -5.7; skew-y: -5.7; }
        frame 21 { x: -17.4; y: 10.5; skew-x: -2.2; skew-y: -2.2; scale-x: 0.6; scale-y: 0.6; }
        frame 22 { x: -16.9; y: 7.6; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -16.5; y: 4.6; skew-x: 4.1; skew-y: 4.1; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: -18.4; y: 12.8; skew-x: -4.5; skew-y: -4.5; scale-x: 0.599; scale-y: 0.599; }
        frame 26 { x: -19.8; y: 21.2; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -20.8; y: 30; skew-x: -22.2; skew-y: -22.2; scale-x: 0.598; scale-y: 0.598; }
        frame 28 { x: -21.2; y: 38.6; skew-x: -31; skew-y: -31; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: -21.3; y: 47.4; skew-x: -39.7; skew-y: -39.7; }
        frame 30 { x: -20.4; y: 49; skew-x: -42.8; skew-y: -42.8; scale-x: 0.597; scale-y: 0.597; }
        frame 31 { x: -19.6; y: 50.6; skew-x: -45.7; skew-y: -45.7; scale-x: 0.598; scale-y: 0.598; }
        frame 32 { x: -23.7; y: 34.3; skew-x: -37.3; skew-y: -37.3; scale-x: 0.596; scale-y: 0.596; }
        frame 33 { x: -19.1; y: -2.1; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 13.5; y: -42.1; skew-x: 44.6; skew-y: 44.7; scale-y: 0.595; }
        frame 35 { x: 65.3; y: -46.8; skew-x: 93; skew-y: 93; scale-x: 0.597; scale-y: 0.596; }
        frame 36 { x: 74.3; y: -43.4; skew-x: 105; skew-y: 105; scale-x: 0.596; scale-y: 0.595; }
        frame 37 { x: 82.5; y: -39.5; skew-x: 117.3; skew-y: 117.3; scale-x: 0.597; scale-y: -10000; }
        frame 38 { x: 80.2; y: -40.6; skew-x: 113.8; skew-y: 113.8; scale-x: 0.596; scale-y: 0.594; }
        frame 39 { x: 78; y: -41.8; skew-x: 110.3; skew-y: 110.3; scale-x: -10000; scale-y: 0.595; }
        frame 40 { x: 75.6; y: -42.9; skew-x: 106.8; skew-y: 106.8; scale-y: -10000; }
        frame 41 { x: 73.2; y: -44; skew-x: 103.3; skew-y: 103.3; scale-x: 0.597; }
        frame 42 { x: 70.8; y: -45; skew-x: 99.8; skew-y: 99.8; scale-x: -10000; }
        frame 43 { x: 68.3; y: -46; skew-x: 96.3; skew-y: 96.3; scale-y: 0.596; }
        frame 44 { x: 65.8; y: -46.8; skew-x: 93; skew-y: 93; scale-y: -10000; }
        frame 45 { x: 67.1; y: -46.4; skew-x: 94.5; skew-y: 94.5; }
        frame 46 { x: 68.3; y: -46.1; skew-x: 96.3; skew-y: 96.3; scale-y: 0.595; }
        frame 47 { x: 69.6; y: -45.8; skew-x: 98; skew-y: 98; scale-y: -10000; }
        frame 48 { x: 70.8; y: -45.4; skew-x: 99.8; skew-y: 99.8; }
        frame 49 { x: 71.8; y: -44.9; skew-x: 101.5; skew-y: 101.5; scale-x: 0.596; }
        frame 50 { x: 73.3; y: -44.5; skew-x: 103.3; skew-y: 103.3; scale-x: -10000; }
        frame 51 { x: 74.5; y: -44.1; skew-x: 105; skew-y: 105; }
        frame 52 { x: 55.4; y: -43.7; skew-x: 85.2; skew-y: 85.2; }
        frame 53 { x: 34.7; y: -41.2; skew-x: 65.2; skew-y: 65.2; }
        frame 54 { x: 13.9; y: -35.9; skew-x: 45.1; skew-y: 45.1; scale-x: 0.597; scale-y: 0.596; }
        frame 55 { x: 3; y: -23.4; skew-x: 31.3; skew-y: 31.3; scale-x: -10000; scale-y: 0.597; }
        frame 56 { x: -7.1; y: -9.8; skew-x: 17.6; skew-y: 17.6; scale-x: 0.598; scale-y: 0.598; }
        frame 57 { x: -16.5; y: 4.6; skew-x: 4.1; skew-y: 4.1; scale-x: 0.6; scale-y: 0.6; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -14.7; y: -0.2; skew-x: 11; skew-y: 11; scale-x: 0.599; scale-y: 0.599; }
        frame 60 { x: -12.6; y: -4.9; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -13.7; y: -1.3; skew-x: 13; skew-y: 13; }
        frame 62 { x: -14.7; y: 2.3; skew-x: 8.1; skew-y: 8.1; }
        frame 63 { x: -15.7; y: 6.3; skew-x: 3.1; skew-y: 3.1; }
        frame 64 { x: -16.4; y: 10.2; skew-x: -1.5; skew-y: -1.5; }
        frame 65 { x: -16.9; y: 14.3; skew-x: -6.4; skew-y: -6.4; }
        frame 66 { x: -17.5; y: 18.5; skew-x: -11.4; skew-y: -11.4; }
        frame 67 { x: -17.8; y: 22.7; skew-x: -16.5; skew-y: -16.5; }
        frame 68 { x: -18.1; y: 24.5; skew-x: -17.5; skew-y: -17.5; }
        frame 69 { x: -18.5; y: 26.3; skew-x: -18.7; skew-y: -18.7; }
        frame 70 { x: -18.4; y: 23.1; skew-x: -15.4; skew-y: -15.4; }
        frame 71 { x: -18.1; y: 20; skew-x: -12.2; skew-y: -12.2; }
        frame 72 { x: -10000; y: 16.9; skew-x: -8.9; skew-y: -8.9; }
        frame 73 { x: -17.8; y: 13.6; skew-x: -5.7; skew-y: -5.7; }
        frame 74 { x: -17.4; y: 10.5; skew-x: -2.2; skew-y: -2.2; scale-x: 0.6; scale-y: 0.6; }
        frame 75 { x: -16.9; y: 7.6; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: -16.5; y: 4.6; skew-x: 4.1; skew-y: 4.1; }
    }
    Track {
        source-name: "Cabbagepult_basket2";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -16.4; y: 4.8; skew-x: 4.1; skew-y: 4.1; scale-x: 0.6; scale-y: 0.6; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_BASKET_OVERLAY; }
        frame 6 { x: -14.6; y: -0; skew-x: 11; skew-y: 11; scale-x: 0.599; scale-y: 0.599; cel: -10000; image: none; }
        frame 7 { x: -12.6; y: -4.7; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: -13.6; y: -1.1; skew-x: 13; skew-y: 13; }
        frame 9 { x: -14.7; y: 2.4; skew-x: 8.1; skew-y: 8.1; }
        frame 10 { x: -15.6; y: 6.5; skew-x: 3.1; skew-y: 3.1; }
        frame 11 { x: -16.3; y: 10.3; skew-x: -1.5; skew-y: -1.5; }
        frame 12 { x: -16.8; y: 14.5; skew-x: -6.4; skew-y: -6.4; }
        frame 13 { x: -17.4; y: 18.6; skew-x: -11.4; skew-y: -11.4; }
        frame 14 { x: -17.6; y: 22.8; skew-x: -16.5; skew-y: -16.5; }
        frame 15 { x: -17.9; y: 24.5; skew-x: -17.5; skew-y: -17.5; }
        frame 16 { x: -18.3; y: 26.4; skew-x: -18.7; skew-y: -18.7; }
        frame 17 { x: -10000; y: 23.2; skew-x: -15.4; skew-y: -15.4; }
        frame 18 { x: -18; y: 20.1; skew-x: -12.2; skew-y: -12.2; }
        frame 19 { x: -17.9; y: 17.1; skew-x: -8.9; skew-y: -8.9; }
        frame 20 { x: -17.6; y: 13.8; skew-x: -5.7; skew-y: -5.7; }
        frame 21 { x: -17.3; y: 10.7; skew-x: -2.2; skew-y: -2.2; scale-x: 0.6; scale-y: 0.6; }
        frame 22 { x: -16.8; y: 7.7; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -16.4; y: 4.8; skew-x: 4.1; skew-y: 4.1; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: -18.3; y: 12.9; skew-x: -4.5; skew-y: -4.5; scale-x: 0.599; scale-y: 0.599; }
        frame 26 { x: -19.7; y: 21.4; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -20.6; y: 30.1; skew-x: -22.2; skew-y: -22.2; scale-x: 0.598; scale-y: 0.598; }
        frame 28 { x: -21.1; y: 38.7; skew-x: -31; skew-y: -31; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: -10000; y: 47.4; skew-x: -39.7; skew-y: -39.7; }
        frame 30 { x: -20.3; y: 49; skew-x: -42.8; skew-y: -42.8; scale-x: 0.597; scale-y: 0.597; }
        frame 31 { x: -19.5; y: 50.6; skew-x: -45.7; skew-y: -45.7; scale-x: 0.598; scale-y: 0.598; }
        frame 32 { x: -23.5; y: 34.3; skew-x: -37.3; skew-y: -37.3; scale-x: 0.596; scale-y: 0.596; }
        frame 33 { x: -19; y: -1.9; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 13.5; y: -41.9; skew-x: 44.6; skew-y: 44.7; scale-y: 0.595; }
        frame 35 { x: 65.2; y: -46.7; skew-x: 93; skew-y: 93; scale-x: 0.597; scale-y: 0.596; }
        frame 36 { x: 74.2; y: -43.4; skew-x: 105; skew-y: 105; scale-x: 0.596; scale-y: 0.595; }
        frame 37 { x: 82.3; y: -39.5; skew-x: 117.3; skew-y: 117.3; scale-x: 0.597; scale-y: -10000; }
        frame 38 { x: 80; y: -40.6; skew-x: 113.8; skew-y: 113.8; scale-x: 0.596; scale-y: 0.594; }
        frame 39 { x: 77.8; y: -41.8; skew-x: 110.3; skew-y: 110.3; scale-x: -10000; scale-y: 0.595; }
        frame 40 { x: 75.5; y: -42.8; skew-x: 106.8; skew-y: 106.8; scale-y: -10000; }
        frame 41 { x: 73; y: -43.9; skew-x: 103.3; skew-y: 103.3; scale-x: 0.597; }
        frame 42 { x: 70.6; y: -44.9; skew-x: 99.8; skew-y: 99.8; scale-x: -10000; }
        frame 43 { x: 68.1; y: -45.9; skew-x: 96.3; skew-y: 96.3; scale-y: 0.596; }
        frame 44 { x: 65.6; y: -46.7; skew-x: 93; skew-y: 93; scale-y: -10000; }
        frame 45 { x: 66.9; y: -46.4; skew-x: 94.5; skew-y: 94.5; }
        frame 46 { x: 68.1; y: -46.1; skew-x: 96.3; skew-y: 96.3; scale-y: 0.595; }
        frame 47 { x: 69.3; y: -45.7; skew-x: 98; skew-y: 98; scale-y: -10000; }
        frame 48 { x: 70.6; y: -45.3; skew-x: 99.8; skew-y: 99.8; }
        frame 49 { x: 71.7; y: -44.9; skew-x: 101.5; skew-y: 101.5; scale-x: 0.596; }
        frame 50 { x: 73.1; y: -44.5; skew-x: 103.3; skew-y: 103.3; scale-x: -10000; }
        frame 51 { x: 74.3; y: -44.1; skew-x: 105; skew-y: 105; }
        frame 52 { x: 55.2; y: -43.6; skew-x: 85.2; skew-y: 85.2; }
        frame 53 { x: 34.6; y: -41; skew-x: 65.2; skew-y: 65.2; }
        frame 54 { x: 13.8; y: -35.8; skew-x: 45.1; skew-y: 45.1; scale-x: 0.597; scale-y: 0.596; }
        frame 55 { x: 3; y: -23.3; skew-x: 31.3; skew-y: 31.3; scale-x: -10000; scale-y: 0.597; }
        frame 56 { x: -7.1; y: -9.6; skew-x: 17.6; skew-y: 17.6; scale-x: 0.598; scale-y: 0.598; }
        frame 57 { x: -16.4; y: 4.8; skew-x: 4.1; skew-y: 4.1; scale-x: 0.6; scale-y: 0.6; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -14.6; y: -0; skew-x: 11; skew-y: 11; scale-x: 0.599; scale-y: 0.599; }
        frame 60 { x: -12.6; y: -4.7; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -13.6; y: -1.1; skew-x: 13; skew-y: 13; }
        frame 62 { x: -14.7; y: 2.4; skew-x: 8.1; skew-y: 8.1; }
        frame 63 { x: -15.6; y: 6.5; skew-x: 3.1; skew-y: 3.1; }
        frame 64 { x: -16.3; y: 10.3; skew-x: -1.5; skew-y: -1.5; }
        frame 65 { x: -16.8; y: 14.5; skew-x: -6.4; skew-y: -6.4; }
        frame 66 { x: -17.4; y: 18.6; skew-x: -11.4; skew-y: -11.4; }
        frame 67 { x: -17.6; y: 22.8; skew-x: -16.5; skew-y: -16.5; }
        frame 68 { x: -17.9; y: 24.5; skew-x: -17.5; skew-y: -17.5; }
        frame 69 { x: -18.3; y: 26.4; skew-x: -18.7; skew-y: -18.7; }
        frame 70 { x: -10000; y: 23.2; skew-x: -15.4; skew-y: -15.4; }
        frame 71 { x: -18; y: 20.1; skew-x: -12.2; skew-y: -12.2; }
        frame 72 { x: -17.9; y: 17.1; skew-x: -8.9; skew-y: -8.9; }
        frame 73 { x: -17.6; y: 13.8; skew-x: -5.7; skew-y: -5.7; }
        frame 74 { x: -17.3; y: 10.7; skew-x: -2.2; skew-y: -2.2; scale-x: 0.6; scale-y: 0.6; }
        frame 75 { x: -16.8; y: 7.7; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: -16.4; y: 4.8; skew-x: 4.1; skew-y: 4.1; }
    }
    Track {
        source-name: "Cornpult_kernal";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -16.7; y: 11.1; skew-x: -40.9; skew-y: -40.9; scale-x: 0.95; scale-y: 0.95; cel: 0; image: IMAGE_REANIM_CORNPULT_KERNAL; }
        frame 6 { x: -13.6; y: 2.7; skew-x: -23.5; skew-y: -23.5; scale-x: 0.947; scale-y: 0.947; cel: -10000; image: none; }
        frame 7 { x: -9.6; y: -4.8; skew-x: -6.3; skew-y: -6.3; scale-x: 0.946; scale-y: 0.946; }
        frame 8 { x: -10.7; y: -1; skew-x: -11.9; skew-y: -11.9; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: -11.8; y: 2.9; skew-x: -17.7; skew-y: -17.7; }
        frame 10 { x: -12.7; y: 7; skew-x: -23.5; skew-y: -23.5; }
        frame 11 { x: -13.5; y: 11.2; skew-x: -29.2; skew-y: -29.2; }
        frame 12 { x: -14.2; y: 15.4; skew-x: -35; skew-y: -35; scale-x: 0.947; scale-y: 0.947; }
        frame 13 { x: -14.7; y: 19.7; skew-x: -40.8; skew-y: -40.8; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: -15; y: 23.9; skew-x: -46.5; skew-y: -46.5; scale-x: 0.949; scale-y: 0.949; }
        frame 15 { x: -16.2; y: 28.2; skew-x: -55.5; skew-y: -55.5; scale-x: 0.946; scale-y: 0.946; }
        frame 16 { x: -17.2; y: 32.3; skew-x: -64.4; skew-y: -64.4; scale-x: 0.947; scale-y: 0.947; }
        frame 17 { x: -10000; y: 29.4; skew-x: -61.1; skew-y: -61.1; scale-x: 0.946; scale-y: 0.946; }
        frame 18 { x: -17.3; y: 26.3; skew-x: -57.8; skew-y: -57.8; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -10000; y: 23.3; skew-x: -54.3; skew-y: -54.3; scale-x: 0.947; scale-y: 0.947; }
        frame 20 { x: -17.2; y: 20.4; skew-x: -51; skew-y: -51; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -10000; y: 17.2; skew-x: -47.5; skew-y: -47.5; }
        frame 22 { x: -17; y: 14.3; skew-x: -44.3; skew-y: -44.3; scale-x: 0.948; scale-y: 0.948; }
        frame 23 { x: -16.7; y: 11.1; skew-x: -40.9; skew-y: -40.9; scale-x: 0.95; scale-y: 0.95; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -17.6; y: 20.1; skew-x: -52.6; skew-y: -52.6; scale-x: 0.948; scale-y: 0.948; }
        frame 26 { x: -17.8; y: 29.1; skew-x: -64.3; skew-y: -64.3; scale-x: 0.947; scale-y: 0.947; }
        frame 27 { x: -17.5; y: 38; skew-x: -76.1; skew-y: -76.1; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -16.6; y: 46.8; skew-x: -87.9; skew-y: -87.9; }
        frame 29 { x: -15.2; y: 55; skew-x: -99.5; skew-y: -99.5; }
        frame 30 { x: -14; y: 56.4; skew-x: -102.4; skew-y: -102.4; scale-x: 0.946; scale-y: 0.946; }
        frame 31 { x: -12.9; y: 57.5; skew-x: -105.5; skew-y: -105.5; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -15.7; y: 42.5; skew-x: -97.2; skew-y: -97.4; scale-x: 0.943; scale-y: 0.944; }
        frame 33 { x: -15.3; y: 9.3; skew-x: -63.1; skew-y: -63.3; scale-x: 0.942; scale-y: 0.943; }
        frame 34 { x: 13.3; y: -36.6; skew-x: -14.7; skew-y: -14.9; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 36 { cel: -10000; }
        frame 57 { x: -16.7; y: 11.1; skew-x: -40.9; skew-y: -40.9; scale-x: 0.95; scale-y: 0.95; cel: 0; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 59 { x: -13.6; y: 2.7; skew-x: -23.5; skew-y: -23.5; scale-x: 0.947; scale-y: 0.947; }
        frame 60 { x: -9.6; y: -4.8; skew-x: -6.3; skew-y: -6.3; scale-x: 0.946; scale-y: 0.946; }
        frame 61 { x: -10.7; y: -1; skew-x: -11.9; skew-y: -11.9; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: -11.8; y: 2.9; skew-x: -17.7; skew-y: -17.7; }
        frame 63 { x: -12.7; y: 7; skew-x: -23.5; skew-y: -23.5; }
        frame 64 { x: -13.5; y: 11.2; skew-x: -29.2; skew-y: -29.2; }
        frame 65 { x: -14.2; y: 15.4; skew-x: -35; skew-y: -35; scale-x: 0.947; scale-y: 0.947; }
        frame 66 { x: -14.7; y: 19.7; skew-x: -40.8; skew-y: -40.8; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: -15; y: 23.9; skew-x: -46.5; skew-y: -46.5; scale-x: 0.949; scale-y: 0.949; }
        frame 68 { x: -16.2; y: 28.2; skew-x: -55.5; skew-y: -55.5; scale-x: 0.946; scale-y: 0.946; }
        frame 69 { x: -17.2; y: 32.3; skew-x: -64.4; skew-y: -64.4; scale-x: 0.947; scale-y: 0.947; }
        frame 70 { x: -10000; y: 29.4; skew-x: -61.1; skew-y: -61.1; scale-x: 0.946; scale-y: 0.946; }
        frame 71 { x: -17.3; y: 26.3; skew-x: -57.8; skew-y: -57.8; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -10000; y: 23.3; skew-x: -54.3; skew-y: -54.3; scale-x: 0.947; scale-y: 0.947; }
        frame 73 { x: -17.2; y: 20.4; skew-x: -51; skew-y: -51; scale-x: -10000; scale-y: -10000; }
        frame 74 { x: -10000; y: 17.2; skew-x: -47.5; skew-y: -47.5; }
        frame 75 { x: -17; y: 14.3; skew-x: -44.3; skew-y: -44.3; scale-x: 0.948; scale-y: 0.948; }
        frame 76 { x: -16.7; y: 11.1; skew-x: -40.9; skew-y: -40.9; scale-x: 0.95; scale-y: 0.95; }
    }
    Track {
        source-name: "Cornpult_butter";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -22; y: -18.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_BUTTER; }
        frame 6 { x: -21.5; y: -20.8; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: -21; y: -22.8; }
        frame 8 { x: -21.2; y: -20.3; }
        frame 9 { x: -21.3; y: -17.7; }
        frame 10 { x: -21.5; y: -15.1; }
        frame 11 { x: -21.6; y: -12.5; }
        frame 12 { x: -21.7; y: -10; }
        frame 13 { x: -21.9; y: -7.4; }
        frame 14 { x: -22; y: -4.8; }
        frame 15 { x: -22.5; y: -3.8; }
        frame 16 { x: -23; y: -2.8; }
        frame 17 { x: -22.9; y: -5.1; }
        frame 18 { x: -22.7; y: -7.4; }
        frame 19 { x: -22.6; y: -9.7; }
        frame 20 { x: -22.5; y: -12; }
        frame 21 { x: -22.3; y: -14.3; }
        frame 22 { x: -22.2; y: -16.5; }
        frame 23 { x: -22; y: -18.8; }
        frame 24 { x: -10000; y: -10000; }
        frame 25 { x: -26.9; y: -8.8; skew-x: -8.7; skew-y: -8.7; scale-x: 0.799; scale-y: 0.799; }
        frame 26 { x: -31.4; y: 1.4; skew-x: -17.5; skew-y: -17.5; scale-x: 0.798; scale-y: 0.798; }
        frame 27 { x: -35.1; y: 12.2; skew-x: -26.4; skew-y: -26.4; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -38.4; y: 23.1; skew-x: -35.2; skew-y: -35.2; scale-x: 0.797; scale-y: 0.797; }
        frame 29 { x: -41; y: 34; skew-x: -44.1; skew-y: -44.1; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: -41.9; y: 39.9; skew-x: -48.8; skew-y: -52.8; scale-x: 0.797; scale-y: 0.8; }
        frame 31 { x: -42.3; y: 45.9; skew-x: -53.6; skew-y: -61.6; scale-x: 0.798; scale-y: 0.805; }
        frame 32 { x: -44.1; y: 15.5; skew-x: -32; skew-y: -39.4; scale-x: 0.795; scale-y: 0.806; }
        frame 33 { x: -17.8; y: -29.1; skew-x: 15.3; skew-y: 11.8; scale-x: 0.827; scale-y: 0.751; }
        frame 34 { x: 44.8; y: -62.6; skew-x: 63.1; skew-y: 63.1; scale-x: 0.794; scale-y: 0.804; }
        frame 35 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 36 { cel: -10000; }
    }
    Track {
        source-name: "Cabbagepult_basket_overlay";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -16.5; y: 4.3; skew-x: 4.1; skew-y: 4.1; scale-x: 0.6; scale-y: 0.6; cel: 0; image: IMAGE_REANIM_CABBAGEPULT_BASKET_OVERLAY; }
        frame 6 { x: -14.7; y: -0.4; skew-x: 11; skew-y: 11; scale-x: 0.599; scale-y: 0.599; cel: -10000; image: none; }
        frame 7 { x: -12.7; y: -5; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: -13.8; y: -1.4; skew-x: 13; skew-y: 13; }
        frame 9 { x: -14.9; y: 2.2; skew-x: 8.1; skew-y: 8.1; }
        frame 10 { x: -15.8; y: 6.2; skew-x: 3.1; skew-y: 3.1; }
        frame 11 { x: -16.5; y: 10.1; skew-x: -1.5; skew-y: -1.5; }
        frame 12 { x: -17.1; y: 14.2; skew-x: -6.4; skew-y: -6.4; }
        frame 13 { x: -17.6; y: 18.3; skew-x: -11.4; skew-y: -11.4; }
        frame 14 { x: -17.9; y: 22.6; skew-x: -16.5; skew-y: -16.5; }
        frame 15 { x: -18.2; y: 24.3; skew-x: -17.5; skew-y: -17.5; }
        frame 16 { x: -18.5; y: 26.2; skew-x: -18.7; skew-y: -18.7; }
        frame 17 { x: -18.4; y: 23; skew-x: -15.4; skew-y: -15.4; }
        frame 18 { x: -18.2; y: 19.8; skew-x: -12.2; skew-y: -12.2; }
        frame 19 { x: -18; y: 16.8; skew-x: -8.9; skew-y: -8.9; }
        frame 20 { x: -17.8; y: 13.5; skew-x: -5.7; skew-y: -5.7; }
        frame 21 { x: -17.4; y: 10.4; skew-x: -2.2; skew-y: -2.2; scale-x: 0.6; scale-y: 0.6; }
        frame 22 { x: -17; y: 7.4; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -16.5; y: 4.3; skew-x: 4.1; skew-y: 4.1; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: -18.5; y: 12.5; skew-x: -4.5; skew-y: -4.5; scale-x: 0.599; scale-y: 0.599; }
        frame 26 { x: -20; y: 21; skew-x: -13.2; skew-y: -13.2; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -20.9; y: 29.8; skew-x: -22.2; skew-y: -22.2; scale-x: 0.598; scale-y: 0.598; }
        frame 28 { x: -21.4; y: 38.5; skew-x: -31; skew-y: -31; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: -21.3; y: 47.2; skew-x: -39.7; skew-y: -39.7; }
        frame 30 { x: -20.5; y: 48.8; skew-x: -42.8; skew-y: -42.8; scale-x: 0.597; scale-y: 0.597; }
        frame 31 { x: -19.7; y: 50.4; skew-x: -45.7; skew-y: -45.7; scale-x: 0.598; scale-y: 0.598; }
        frame 32 { x: -23.7; y: 33.9; skew-x: -37.3; skew-y: -37.3; scale-x: 0.596; scale-y: 0.596; }
        frame 33 { x: -19; y: -2.2; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 13.7; y: -42.1; skew-x: 44.6; skew-y: 44.7; scale-y: 0.595; }
        frame 35 { x: 65.6; y: -46.7; skew-x: 93; skew-y: 93; scale-x: 0.597; scale-y: 0.596; }
        frame 36 { x: 74.5; y: -43.3; skew-x: 105; skew-y: 105; scale-x: 0.596; scale-y: 0.595; }
        frame 37 { x: 82.6; y: -39.4; skew-x: 117.3; skew-y: 117.3; scale-x: 0.597; scale-y: -10000; }
        frame 38 { x: 80.3; y: -40.6; skew-x: 113.8; skew-y: 113.8; scale-x: 0.596; scale-y: 0.594; }
        frame 39 { x: 78.2; y: -41.7; skew-x: 110.3; skew-y: 110.3; scale-x: -10000; scale-y: 0.595; }
        frame 40 { x: 75.9; y: -42.8; skew-x: 106.8; skew-y: 106.8; scale-y: -10000; }
        frame 41 { x: 73.5; y: -43.9; skew-x: 103.3; skew-y: 103.3; scale-x: 0.597; }
        frame 42 { x: 70.9; y: -44.9; skew-x: 99.8; skew-y: 99.8; scale-x: -10000; }
        frame 43 { x: 68.5; y: -45.9; skew-x: 96.3; skew-y: 96.3; scale-y: 0.596; }
        frame 44 { x: 66; y: -46.7; skew-x: 93; skew-y: 93; scale-y: -10000; }
        frame 45 { x: 67.3; y: -46.4; skew-x: 94.5; skew-y: 94.5; }
        frame 46 { x: 68.5; y: -46; skew-x: 96.3; skew-y: 96.3; scale-y: 0.595; }
        frame 47 { x: 69.8; y: -45.6; skew-x: 98; skew-y: 98; scale-y: -10000; }
        frame 48 { x: 70.8; y: -45.2; skew-x: 99.8; skew-y: 99.8; }
        frame 49 { x: 72.1; y: -44.7; skew-x: 101.5; skew-y: 101.5; scale-x: 0.596; }
        frame 50 { x: 73.3; y: -44.3; skew-x: 103.3; skew-y: 103.3; scale-x: -10000; }
        frame 51 { x: 74.6; y: -44; skew-x: 105; skew-y: 105; }
        frame 52 { x: 55.4; y: -43.7; skew-x: 85.2; skew-y: 85.2; }
        frame 53 { x: 34.9; y: -41.2; skew-x: 65.2; skew-y: 65.2; }
        frame 54 { x: 14; y: -36; skew-x: 45.1; skew-y: 45.1; scale-x: 0.597; scale-y: 0.596; }
        frame 55 { x: 3.1; y: -23.5; skew-x: 31.3; skew-y: 31.3; scale-x: -10000; scale-y: 0.597; }
        frame 56 { x: -7.1; y: -9.9; skew-x: 17.6; skew-y: 17.6; scale-x: 0.598; scale-y: 0.598; }
        frame 57 { x: -16.5; y: 4.3; skew-x: 4.1; skew-y: 4.1; scale-x: 0.6; scale-y: 0.6; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -14.7; y: -0.4; skew-x: 11; skew-y: 11; scale-x: 0.599; scale-y: 0.599; }
        frame 60 { x: -12.7; y: -5; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -13.8; y: -1.4; skew-x: 13; skew-y: 13; }
        frame 62 { x: -14.9; y: 2.2; skew-x: 8.1; skew-y: 8.1; }
        frame 63 { x: -15.8; y: 6.2; skew-x: 3.1; skew-y: 3.1; }
        frame 64 { x: -16.5; y: 10.1; skew-x: -1.5; skew-y: -1.5; }
        frame 65 { x: -17.1; y: 14.2; skew-x: -6.4; skew-y: -6.4; }
        frame 66 { x: -17.6; y: 18.3; skew-x: -11.4; skew-y: -11.4; }
        frame 67 { x: -17.9; y: 22.6; skew-x: -16.5; skew-y: -16.5; }
        frame 68 { x: -18.2; y: 24.3; skew-x: -17.5; skew-y: -17.5; }
        frame 69 { x: -18.5; y: 26.2; skew-x: -18.7; skew-y: -18.7; }
        frame 70 { x: -18.4; y: 23; skew-x: -15.4; skew-y: -15.4; }
        frame 71 { x: -18.2; y: 19.8; skew-x: -12.2; skew-y: -12.2; }
        frame 72 { x: -18; y: 16.8; skew-x: -8.9; skew-y: -8.9; }
        frame 73 { x: -17.8; y: 13.5; skew-x: -5.7; skew-y: -5.7; }
        frame 74 { x: -17.4; y: 10.4; skew-x: -2.2; skew-y: -2.2; scale-x: 0.6; scale-y: 0.6; }
        frame 75 { x: -17; y: 7.4; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: -16.5; y: 4.3; skew-x: 4.1; skew-y: 4.1; }
    }
    Track {
        source-name: "Cornpult_husk3";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 12.4; y: 58.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSK3; }
        frame 6 { x: 12.9; y: 57.6; skew-x: 1; skew-y: 1; scale-x: 0.787; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 13.5; y: 56.8; skew-x: 2.3; skew-y: 2.3; scale-x: 0.774; scale-y: 0.826; }
        frame 8 { x: 14.2; y: 56.1; skew-x: 3.5; skew-y: 3.5; scale-x: 0.762; scale-y: 0.839; }
        frame 9 { x: 13.5; y: 56.6; skew-x: 2.8; skew-y: 2.8; scale-x: 0.776; scale-y: 0.832; }
        frame 10 { x: 12.9; y: 56.9; skew-x: 2.3; skew-y: 2.3; scale-x: 0.79; scale-y: 0.826; }
        frame 11 { x: 12.3; y: 57.2; skew-x: 1.8; skew-y: 1.8; scale-x: 0.805; scale-y: 0.819; }
        frame 12 { x: 11.6; y: 57.6; skew-x: 1; skew-y: 1; scale-x: 0.819; scale-y: 0.813; }
        frame 13 { x: 11; y: 58; skew-x: 0.5; skew-y: 0.5; scale-x: 0.833; scale-y: 0.806; }
        frame 14 { x: 10.5; y: 58.3; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 15 { x: 9.9; y: 58.5; skew-x: -10000; skew-y: -10000; scale-x: 0.87; scale-y: 0.793; }
        frame 16 { x: 9.2; y: 58.6; scale-x: 0.893; scale-y: 0.786; }
        frame 17 { x: 8.6; y: 58.9; scale-x: 0.915; scale-y: 0.778; }
        frame 18 { x: 9.2; y: 58.8; scale-x: 0.896; scale-y: 0.782; }
        frame 19 { x: 9.9; y: 58.6; scale-x: 0.877; scale-y: 0.786; }
        frame 20 { x: 10.5; y: 58.5; scale-x: 0.858; scale-y: 0.789; }
        frame 21 { x: 11.1; y: -10000; scale-x: 0.838; scale-y: 0.793; }
        frame 22 { x: 11.7; y: 58.4; scale-x: 0.819; scale-y: 0.796; }
        frame 23 { x: 12.4; y: 58.3; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 12.7; y: 57.9; skew-x: 0.5; skew-y: 0.5; scale-x: 0.792; scale-y: 0.808; }
        frame 26 { x: 13.1; y: 57.4; skew-x: 1.3; skew-y: 1.3; scale-x: 0.785; scale-y: 0.815; }
        frame 27 { x: 13.5; y: 56.9; skew-x: 2; skew-y: 2; scale-x: 0.777; scale-y: 0.823; }
        frame 28 { x: 13.9; y: 56.5; skew-x: 2.8; skew-y: 2.8; scale-x: 0.769; scale-y: 0.831; }
        frame 29 { x: 14.2; y: 56.1; skew-x: 3.5; skew-y: 3.5; scale-x: 0.762; scale-y: 0.839; }
        frame 30 { x: 13.3; y: 57.3; skew-x: 1.8; skew-y: 1.8; scale-x: 0.781; scale-y: 0.819; }
        frame 31 { x: 12.4; y: 58.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 32 { x: 11.5; y: 58.4; skew-x: -10000; skew-y: -10000; scale-x: 0.829; scale-y: 0.795; }
        frame 33 { x: 10.5; y: 58.5; scale-x: 0.858; scale-y: 0.789; }
        frame 34 { x: 9.6; y: 58.6; scale-x: 0.886; scale-y: 0.784; }
        frame 35 { x: 8.6; y: 58.9; scale-x: 0.915; scale-y: 0.778; }
        frame 36 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 8.5; }
        frame 49 { x: -10000; }
        frame 51 { x: 8.6; }
        frame 52 { x: 9.2; y: 58.8; scale-x: 0.896; scale-y: 0.782; }
        frame 53 { x: 9.8; y: 58.6; scale-x: 0.877; scale-y: 0.786; }
        frame 54 { x: 10.4; y: 58.5; scale-x: 0.858; scale-y: 0.789; }
        frame 55 { x: 11.1; y: -10000; scale-x: 0.838; scale-y: 0.793; }
        frame 56 { x: 11.7; y: 58.4; scale-x: 0.819; scale-y: 0.796; }
        frame 57 { x: 12.4; y: 58.3; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 12.9; y: 57.6; skew-x: 1; skew-y: 1; scale-x: 0.787; scale-y: 0.813; }
        frame 60 { x: 13.5; y: 56.8; skew-x: 2.3; skew-y: 2.3; scale-x: 0.774; scale-y: 0.826; }
        frame 61 { x: 14.2; y: 56.1; skew-x: 3.5; skew-y: 3.5; scale-x: 0.762; scale-y: 0.839; }
        frame 62 { x: 13.5; y: 56.6; skew-x: 2.8; skew-y: 2.8; scale-x: 0.776; scale-y: 0.832; }
        frame 63 { x: 12.9; y: 56.9; skew-x: 2.3; skew-y: 2.3; scale-x: 0.79; scale-y: 0.826; }
        frame 64 { x: 12.3; y: 57.2; skew-x: 1.8; skew-y: 1.8; scale-x: 0.805; scale-y: 0.819; }
        frame 65 { x: 11.6; y: 57.6; skew-x: 1; skew-y: 1; scale-x: 0.819; scale-y: 0.813; }
        frame 66 { x: 11; y: 58; skew-x: 0.5; skew-y: 0.5; scale-x: 0.833; scale-y: 0.806; }
        frame 67 { x: 10.5; y: 58.3; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 68 { x: 9.9; y: 58.5; skew-x: -10000; skew-y: -10000; scale-x: 0.87; scale-y: 0.793; }
        frame 69 { x: 9.2; y: 58.6; scale-x: 0.893; scale-y: 0.786; }
        frame 70 { x: 8.6; y: 58.9; scale-x: 0.915; scale-y: 0.778; }
        frame 71 { x: 9.2; y: 58.8; scale-x: 0.896; scale-y: 0.782; }
        frame 72 { x: 9.9; y: 58.6; scale-x: 0.877; scale-y: 0.786; }
        frame 73 { x: 10.5; y: 58.5; scale-x: 0.858; scale-y: 0.789; }
        frame 74 { x: 11.1; y: -10000; scale-x: 0.838; scale-y: 0.793; }
        frame 75 { x: 11.7; y: 58.4; scale-x: 0.819; scale-y: 0.796; }
        frame 76 { x: 12.4; y: 58.3; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cornpult_husktip3";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 7.7; y: 59.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSKTIP3; }
        frame 6 { x: 9; y: 57.6; skew-x: 7; skew-y: 7; scale-x: 0.787; scale-y: 0.812; cel: -10000; image: none; }
        frame 7 { x: 10.4; y: 56.4; skew-x: 14; skew-y: 14; scale-x: 0.773; scale-y: 0.825; }
        frame 8 { x: 12; y: 55.1; skew-x: 21.1; skew-y: 21.1; scale-x: 0.761; scale-y: 0.838; }
        frame 9 { x: 10.9; y: 55.8; skew-x: 17.5; skew-y: 17.5; scale-x: 0.775; scale-y: 0.831; }
        frame 10 { x: 9.8; y: 56.4; skew-x: 14; skew-y: 14; scale-x: 0.789; scale-y: 0.825; }
        frame 11 { x: 8.7; y: 57; skew-x: 10.5; skew-y: 10.5; scale-x: 0.804; scale-y: 0.819; }
        frame 12 { x: 7.6; y: 57.6; skew-x: 7; skew-y: 7; scale-x: 0.818; scale-y: 0.812; }
        frame 13 { x: 6.6; y: 58.4; skew-x: 3.5; skew-y: 3.5; scale-x: 0.833; scale-y: 0.806; }
        frame 14 { x: 5.5; y: 59.1; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 15 { x: 4.5; y: 59.9; skew-x: -4.7; skew-y: -5; scale-x: 0.885; scale-y: 0.768; }
        frame 16 { x: 3.5; y: 60.8; skew-x: -9.4; skew-y: -10.2; scale-x: 0.923; scale-y: 0.736; }
        frame 17 { x: 2.6; y: 61.8; skew-x: -14.2; skew-y: -15.6; scale-x: 0.962; scale-y: 0.704; }
        frame 18 { x: 3.4; y: 61.3; skew-x: -11.7; skew-y: -12.9; scale-x: 0.934; scale-y: 0.719; }
        frame 19 { x: 4.3; y: 60.8; skew-x: -9.4; skew-y: -10.2; scale-x: 0.907; scale-y: 0.736; }
        frame 20 { x: 5.1; y: 60.4; skew-x: -6.9; skew-y: -7.7; scale-x: 0.88; scale-y: 0.752; }
        frame 21 { x: 6; y: 60; skew-x: -4.7; skew-y: -5; scale-x: 0.854; scale-y: 0.768; }
        frame 22 { x: 6.8; y: 59.5; skew-x: -2.2; skew-y: -2.4; scale-x: 0.827; scale-y: 0.784; }
        frame 23 { x: 7.7; y: 59.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 8.5; y: 58.3; skew-x: 4.1; skew-y: 4.1; scale-x: 0.792; scale-y: 0.807; }
        frame 26 { x: 9.3; y: 57.4; skew-x: 8.3; skew-y: 8.3; scale-x: 0.784; scale-y: 0.815; }
        frame 27 { x: 10.1; y: 56.6; skew-x: 12.6; skew-y: 12.6; scale-x: 0.776; scale-y: 0.822; }
        frame 28 { x: 11; y: 55.9; skew-x: 16.8; skew-y: 16.8; scale-x: 0.768; scale-y: 0.83; }
        frame 29 { x: 12; y: 55.1; skew-x: 21.1; skew-y: 21.1; scale-x: 0.761; scale-y: 0.838; }
        frame 30 { x: 9.8; y: 57; skew-x: 10.5; skew-y: 10.5; scale-x: 0.78; scale-y: 0.819; }
        frame 31 { x: 7.7; y: 59.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 32 { x: 6.3; y: 59.7; skew-x: -3.4; skew-y: -3.7; scale-x: 0.84; scale-y: 0.776; }
        frame 33 { x: 5.1; y: 60.3; skew-x: -6.9; skew-y: -7.7; scale-x: 0.88; scale-y: 0.752; }
        frame 34 { x: 3.8; y: 61; skew-x: -10.7; skew-y: -11.7; scale-x: 0.921; scale-y: 0.727; }
        frame 35 { x: 2.6; y: 61.8; skew-x: -14.2; skew-y: -15.6; scale-x: 0.962; scale-y: 0.704; }
        frame 36 { x: -10000; y: 61.7; skew-x: -10000; skew-y: -15.5; scale-x: 0.961; scale-y: 0.703; }
        frame 37 { y: 61.8; skew-y: -15.6; scale-x: 0.962; scale-y: 0.704; }
        frame 38 { y: 61.7; skew-y: -15.5; scale-x: 0.961; scale-y: 0.703; }
        frame 39 { y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { y: 61.8; skew-y: -15.6; scale-x: 0.962; scale-y: 0.704; }
        frame 45 { y: -10000; skew-y: -15.5; scale-x: 0.961; scale-y: 0.703; }
        frame 46 { skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { skew-y: -15.4; }
        frame 48 { y: 61.7; skew-y: -10000; }
        frame 49 { y: -10000; scale-x: 0.96; }
        frame 50 { y: 61.6; scale-x: -10000; }
        frame 51 { y: 61.7; skew-y: -15.5; scale-x: 0.961; }
        frame 52 { x: 3.4; y: 61.2; skew-x: -11.7; skew-y: -12.7; scale-x: 0.933; scale-y: 0.719; }
        frame 53 { x: 4.3; y: 60.8; skew-x: -9.4; skew-y: -10.2; scale-x: 0.907; scale-y: 0.735; }
        frame 54 { x: 5.2; y: 60.3; skew-x: -6.9; skew-y: -7.7; scale-x: 0.88; scale-y: 0.751; }
        frame 55 { x: 5.9; y: 60; skew-x: -4.7; skew-y: -4.9; scale-x: 0.853; scale-y: 0.768; }
        frame 56 { x: 6.8; y: 59.5; skew-x: -2.2; skew-y: -2.4; scale-x: 0.827; scale-y: 0.784; }
        frame 57 { x: 7.7; y: 59.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 9; y: 57.6; skew-x: 7; skew-y: 7; scale-x: 0.787; scale-y: 0.812; }
        frame 60 { x: 10.4; y: 56.4; skew-x: 14; skew-y: 14; scale-x: 0.773; scale-y: 0.825; }
        frame 61 { x: 12; y: 55.1; skew-x: 21.1; skew-y: 21.1; scale-x: 0.761; scale-y: 0.838; }
        frame 62 { x: 10.9; y: 55.8; skew-x: 17.5; skew-y: 17.5; scale-x: 0.775; scale-y: 0.831; }
        frame 63 { x: 9.8; y: 56.4; skew-x: 14; skew-y: 14; scale-x: 0.789; scale-y: 0.825; }
        frame 64 { x: 8.7; y: 57; skew-x: 10.5; skew-y: 10.5; scale-x: 0.804; scale-y: 0.819; }
        frame 65 { x: 7.6; y: 57.6; skew-x: 7; skew-y: 7; scale-x: 0.818; scale-y: 0.812; }
        frame 66 { x: 6.6; y: 58.4; skew-x: 3.5; skew-y: 3.5; scale-x: 0.833; scale-y: 0.806; }
        frame 67 { x: 5.5; y: 59.1; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 68 { x: 4.5; y: 59.9; skew-x: -4.7; skew-y: -5; scale-x: 0.885; scale-y: 0.768; }
        frame 69 { x: 3.5; y: 60.8; skew-x: -9.4; skew-y: -10.2; scale-x: 0.923; scale-y: 0.736; }
        frame 70 { x: 2.6; y: 61.8; skew-x: -14.2; skew-y: -15.6; scale-x: 0.962; scale-y: 0.704; }
        frame 71 { x: 3.4; y: 61.3; skew-x: -11.7; skew-y: -12.9; scale-x: 0.934; scale-y: 0.719; }
        frame 72 { x: 4.3; y: 60.8; skew-x: -9.4; skew-y: -10.2; scale-x: 0.907; scale-y: 0.736; }
        frame 73 { x: 5.1; y: 60.4; skew-x: -6.9; skew-y: -7.7; scale-x: 0.88; scale-y: 0.752; }
        frame 74 { x: 6; y: 60; skew-x: -4.7; skew-y: -5; scale-x: 0.854; scale-y: 0.768; }
        frame 75 { x: 6.8; y: 59.5; skew-x: -2.2; skew-y: -2.4; scale-x: 0.827; scale-y: 0.784; }
        frame 76 { x: 7.7; y: 59.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cornpult_husk1";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 19.3; y: 61.6; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSK1; }
        frame 6 { x: 19.8; y: 61; skew-x: 0.5; skew-y: 0.5; scale-x: 0.787; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 20.3; y: 60.4; skew-x: 1; skew-y: 1; scale-x: 0.775; scale-y: 0.826; }
        frame 8 { x: 20.7; y: 59.8; skew-x: 1.5; skew-y: 1.5; scale-x: 0.762; scale-y: 0.839; }
        frame 9 { x: 20.3; y: 60.1; skew-x: 1.3; skew-y: 1.3; scale-x: 0.776; scale-y: 0.832; }
        frame 10 { x: 19.8; y: 60.5; skew-x: 1; skew-y: 1; scale-x: 0.79; scale-y: 0.826; }
        frame 11 { x: 19.4; y: 60.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.805; scale-y: 0.819; }
        frame 12 { x: 18.8; y: 61; skew-x: 0.5; skew-y: 0.5; scale-x: 0.819; scale-y: 0.813; }
        frame 13 { x: 18.4; y: 61.4; skew-x: 0.3; skew-y: 0.3; scale-x: 0.833; scale-y: 0.806; }
        frame 14 { x: 17.8; y: 61.6; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 15 { x: 17.5; y: 61.8; skew-x: -10000; skew-y: -10000; scale-x: 0.857; scale-y: 0.793; }
        frame 16 { x: 17.1; y: 62; scale-x: 0.867; scale-y: 0.786; }
        frame 17 { x: 16.9; y: 62.1; scale-x: 0.876; scale-y: 0.778; }
        frame 18 { x: 17.3; y: 62; scale-x: 0.864; scale-y: 0.782; }
        frame 19 { x: 17.7; y: 61.9; scale-x: 0.851; scale-y: 0.786; }
        frame 20 { x: 18.1; y: -10000; scale-x: 0.838; scale-y: 0.789; }
        frame 21 { x: 18.5; scale-x: 0.825; scale-y: 0.793; }
        frame 22 { x: 19; y: 61.8; scale-x: 0.813; scale-y: 0.796; }
        frame 23 { x: 19.3; y: 61.6; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 19.5; y: 61.3; skew-x: 0.3; skew-y: 0.3; scale-x: 0.792; scale-y: 0.808; }
        frame 26 { x: 19.9; y: 60.9; skew-x: 0.5; skew-y: 0.5; scale-x: 0.785; scale-y: 0.816; }
        frame 27 { x: 20.1; y: 60.5; skew-x: 0.8; skew-y: 0.8; scale-x: 0.777; scale-y: 0.823; }
        frame 28 { x: 20.3; y: 60.3; skew-x: 1.1; skew-y: 1.1; scale-x: 0.77; scale-y: 0.831; }
        frame 29 { x: 20.7; y: 59.8; skew-x: 1.5; skew-y: 1.5; scale-x: 0.762; scale-y: 0.839; }
        frame 30 { x: 20.1; y: 60.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.781; scale-y: 0.819; }
        frame 31 { x: 19.3; y: 61.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 32 { x: 18.7; y: 61.8; skew-x: -10000; skew-y: -10000; scale-x: 0.819; scale-y: 0.795; }
        frame 33 { x: 18.1; y: 61.9; scale-x: 0.838; scale-y: 0.789; }
        frame 34 { x: 17.5; y: 62; scale-x: 0.857; scale-y: 0.784; }
        frame 35 { x: 16.9; y: 62.1; scale-x: 0.876; scale-y: 0.778; }
        frame 36 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 17.3; y: 62; scale-x: 0.864; scale-y: 0.782; }
        frame 53 { x: 17.7; y: 61.9; scale-x: 0.851; scale-y: 0.786; }
        frame 54 { x: 18.1; y: -10000; scale-x: 0.838; scale-y: 0.789; }
        frame 55 { x: 18.5; scale-x: 0.825; scale-y: 0.793; }
        frame 56 { x: 19; y: 61.8; scale-x: 0.813; scale-y: 0.796; }
        frame 57 { x: 19.3; y: 61.6; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 19.8; y: 61; skew-x: 0.5; skew-y: 0.5; scale-x: 0.787; scale-y: 0.813; }
        frame 60 { x: 20.3; y: 60.4; skew-x: 1; skew-y: 1; scale-x: 0.775; scale-y: 0.826; }
        frame 61 { x: 20.7; y: 59.8; skew-x: 1.5; skew-y: 1.5; scale-x: 0.762; scale-y: 0.839; }
        frame 62 { x: 20.3; y: 60.1; skew-x: 1.3; skew-y: 1.3; scale-x: 0.776; scale-y: 0.832; }
        frame 63 { x: 19.8; y: 60.5; skew-x: 1; skew-y: 1; scale-x: 0.79; scale-y: 0.826; }
        frame 64 { x: 19.4; y: 60.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.805; scale-y: 0.819; }
        frame 65 { x: 18.8; y: 61; skew-x: 0.5; skew-y: 0.5; scale-x: 0.819; scale-y: 0.813; }
        frame 66 { x: 18.4; y: 61.4; skew-x: 0.3; skew-y: 0.3; scale-x: 0.833; scale-y: 0.806; }
        frame 67 { x: 17.8; y: 61.6; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 68 { x: 17.5; y: 61.8; skew-x: -10000; skew-y: -10000; scale-x: 0.857; scale-y: 0.793; }
        frame 69 { x: 17.1; y: 62; scale-x: 0.867; scale-y: 0.786; }
        frame 70 { x: 16.9; y: 62.1; scale-x: 0.876; scale-y: 0.778; }
        frame 71 { x: 17.3; y: 62; scale-x: 0.864; scale-y: 0.782; }
        frame 72 { x: 17.7; y: 61.9; scale-x: 0.851; scale-y: 0.786; }
        frame 73 { x: 18.1; y: -10000; scale-x: 0.838; scale-y: 0.789; }
        frame 74 { x: 18.5; scale-x: 0.825; scale-y: 0.793; }
        frame 75 { x: 19; y: 61.8; scale-x: 0.813; scale-y: 0.796; }
        frame 76 { x: 19.3; y: 61.6; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cornpult_husktip1";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 11.8; y: 67.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSKTIP1; }
        frame 6 { x: 13.4; y: 65.9; skew-x: 5.5; skew-y: 10.3; scale-x: 0.787; scale-y: 0.821; cel: -10000; image: none; }
        frame 7 { x: 14.9; y: 64.7; skew-x: 11; skew-y: 20.6; scale-x: 0.774; scale-y: 0.843; }
        frame 8 { x: 16.6; y: 63.7; skew-x: 16.7; skew-y: 31; scale-x: 0.761; scale-y: 0.865; }
        frame 9 { x: 15.4; y: 64.2; skew-x: 13.8; skew-y: 25.8; scale-x: 0.775; scale-y: 0.853; }
        frame 10 { x: 14.3; y: 64.7; skew-x: 11; skew-y: 20.6; scale-x: 0.789; scale-y: 0.843; }
        frame 11 { x: 13.2; y: 65.3; skew-x: 8.3; skew-y: 15.5; scale-x: 0.804; scale-y: 0.832; }
        frame 12 { x: 12; y: 66; skew-x: 5.5; skew-y: 10.3; scale-x: 0.818; scale-y: 0.821; }
        frame 13 { x: 11; y: 66.6; skew-x: 2.8; skew-y: 5; scale-x: 0.833; scale-y: 0.811; }
        frame 14 { x: 9.9; y: 67.3; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 15 { x: 9; y: 68.3; skew-x: -4.7; skew-y: -5; scale-x: 0.848; scale-y: 0.793; }
        frame 16 { x: 8.2; y: 69.3; skew-x: -9.4; skew-y: -10.2; scale-x: 0.849; scale-y: 0.787; }
        frame 17 { x: 7.2; y: 70.3; skew-x: -14.2; skew-y: -15.6; scale-x: 0.851; scale-y: 0.781; }
        frame 18 { x: 7.9; y: 69.8; skew-x: -11.7; skew-y: -12.9; scale-x: 0.842; scale-y: 0.784; }
        frame 19 { x: 8.7; y: 69.3; skew-x: -9.4; skew-y: -10.2; scale-x: 0.833; scale-y: 0.787; }
        frame 20 { x: 9.4; y: 68.8; skew-x: -6.9; skew-y: -7.7; scale-x: 0.825; scale-y: 0.79; }
        frame 21 { x: 10.2; y: 68.3; skew-x: -4.7; skew-y: -5; scale-x: 0.817; scale-y: 0.793; }
        frame 22 { x: 11; y: 67.8; skew-x: -2.2; skew-y: -2.4; scale-x: 0.808; scale-y: 0.797; }
        frame 23 { x: 11.8; y: 67.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 12.8; y: 66.5; skew-x: 3.3; skew-y: 6.1; scale-x: 0.792; scale-y: 0.813; }
        frame 26 { x: 13.6; y: 65.6; skew-x: 6.5; skew-y: 12.3; scale-x: 0.784; scale-y: 0.826; }
        frame 27 { x: 14.6; y: 65; skew-x: 9.8; skew-y: 18.5; scale-x: 0.776; scale-y: 0.838; }
        frame 28 { x: 15.6; y: 64.3; skew-x: 13.3; skew-y: 24.8; scale-x: 0.768; scale-y: 0.851; }
        frame 29 { x: 16.6; y: 63.7; skew-x: 16.7; skew-y: 31; scale-x: 0.761; scale-y: 0.865; }
        frame 30 { x: 14.2; y: 65.3; skew-x: 8.3; skew-y: 15.5; scale-x: 0.78; scale-y: 0.832; }
        frame 31 { x: 11.8; y: 67.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 32 { x: 10.6; y: 68; skew-x: -3.4; skew-y: -3.7; scale-x: 0.813; scale-y: 0.795; }
        frame 33 { x: 9.5; y: 68.8; skew-x: -6.9; skew-y: -7.7; scale-x: 0.825; scale-y: 0.79; }
        frame 34 { x: 8.4; y: 69.5; skew-x: -10.7; skew-y: -11.7; scale-x: 0.838; scale-y: 0.785; }
        frame 35 { x: 7.2; y: 70.3; skew-x: -14.2; skew-y: -15.6; scale-x: 0.851; scale-y: 0.781; }
        frame 36 { x: 7.3; y: -10000; skew-x: -10000; skew-y: -15.5; scale-x: 0.85; scale-y: 0.78; }
        frame 37 { x: 7.2; skew-y: -15.6; scale-x: 0.851; scale-y: 0.781; }
        frame 38 { x: 7.3; skew-y: -15.5; scale-x: 0.85; scale-y: 0.78; }
        frame 39 { x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 7.2; skew-y: -15.6; scale-x: 0.851; scale-y: 0.781; }
        frame 45 { x: 7.3; skew-y: -15.5; scale-x: 0.85; scale-y: 0.78; }
        frame 46 { x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { skew-y: -15.4; }
        frame 48 { y: 70.4; skew-y: -10000; }
        frame 49 { y: 70.3; }
        frame 50 { y: -10000; }
        frame 51 { skew-y: -15.5; }
        frame 52 { x: 8; y: 69.8; skew-x: -11.7; skew-y: -12.7; scale-x: 0.841; scale-y: 0.783; }
        frame 53 { x: 8.7; y: 69.3; skew-x: -9.4; skew-y: -10.2; scale-x: 0.833; scale-y: 0.786; }
        frame 54 { x: 9.4; y: 68.8; skew-x: -6.9; skew-y: -7.7; scale-x: 0.825; scale-y: 0.79; }
        frame 55 { x: 10.2; y: 68.3; skew-x: -4.7; skew-y: -4.9; scale-x: 0.816; scale-y: 0.793; }
        frame 56 { x: 11; y: 67.8; skew-x: -2.2; skew-y: -2.4; scale-x: 0.808; scale-y: 0.797; }
        frame 57 { x: 11.8; y: 67.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 13.4; y: 65.9; skew-x: 5.5; skew-y: 10.3; scale-x: 0.787; scale-y: 0.821; }
        frame 60 { x: 14.9; y: 64.7; skew-x: 11; skew-y: 20.6; scale-x: 0.774; scale-y: 0.843; }
        frame 61 { x: 16.6; y: 63.7; skew-x: 16.7; skew-y: 31; scale-x: 0.761; scale-y: 0.865; }
        frame 62 { x: 15.4; y: 64.2; skew-x: 13.8; skew-y: 25.8; scale-x: 0.775; scale-y: 0.853; }
        frame 63 { x: 14.3; y: 64.7; skew-x: 11; skew-y: 20.6; scale-x: 0.789; scale-y: 0.843; }
        frame 64 { x: 13.2; y: 65.3; skew-x: 8.3; skew-y: 15.5; scale-x: 0.804; scale-y: 0.832; }
        frame 65 { x: 12; y: 66; skew-x: 5.5; skew-y: 10.3; scale-x: 0.818; scale-y: 0.821; }
        frame 66 { x: 11; y: 66.6; skew-x: 2.8; skew-y: 5; scale-x: 0.833; scale-y: 0.811; }
        frame 67 { x: 9.9; y: 67.3; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 68 { x: 9; y: 68.3; skew-x: -4.7; skew-y: -5; scale-x: 0.848; scale-y: 0.793; }
        frame 69 { x: 8.2; y: 69.3; skew-x: -9.4; skew-y: -10.2; scale-x: 0.849; scale-y: 0.787; }
        frame 70 { x: 7.2; y: 70.3; skew-x: -14.2; skew-y: -15.6; scale-x: 0.851; scale-y: 0.781; }
        frame 71 { x: 7.9; y: 69.8; skew-x: -11.7; skew-y: -12.9; scale-x: 0.842; scale-y: 0.784; }
        frame 72 { x: 8.7; y: 69.3; skew-x: -9.4; skew-y: -10.2; scale-x: 0.833; scale-y: 0.787; }
        frame 73 { x: 9.4; y: 68.8; skew-x: -6.9; skew-y: -7.7; scale-x: 0.825; scale-y: 0.79; }
        frame 74 { x: 10.2; y: 68.3; skew-x: -4.7; skew-y: -5; scale-x: 0.817; scale-y: 0.793; }
        frame 75 { x: 11; y: 67.8; skew-x: -2.2; skew-y: -2.4; scale-x: 0.808; scale-y: 0.797; }
        frame 76 { x: 11.8; y: 67.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cornpult_husk4";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 56.3; y: 61.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSK4; }
        frame 6 { x: 56; y: 61.3; skew-x: -1.2; skew-y: -1.2; scale-x: 0.787; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 55.8; y: 61.1; skew-x: -2.5; skew-y: -2.5; scale-x: 0.774; scale-y: 0.826; }
        frame 8 { x: 55.5; y: 61; skew-x: -4; skew-y: -4; scale-x: 0.762; scale-y: 0.839; }
        frame 9 { x: 55.7; y: 61.1; skew-x: -3.2; skew-y: -3.2; scale-x: 0.776; scale-y: 0.832; }
        frame 10 { x: 56; y: 61.2; skew-x: -2.5; skew-y: -2.5; scale-x: 0.79; scale-y: 0.826; }
        frame 11 { x: 56.2; y: 61.3; skew-x: -1.9; skew-y: -1.9; scale-x: 0.805; scale-y: 0.819; }
        frame 12 { x: 56.5; y: 61.4; skew-x: -1.2; skew-y: -1.2; scale-x: 0.819; scale-y: 0.813; }
        frame 13 { x: 56.7; y: -10000; skew-x: -0.4; skew-y: -0.4; scale-x: 0.833; scale-y: 0.806; }
        frame 14 { x: 57; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 15 { y: 61.6; skew-x: -10000; skew-y: -10000; scale-x: 0.871; scale-y: 0.793; }
        frame 16 { x: 57.1; y: 61.8; scale-x: 0.895; scale-y: 0.786; }
        frame 17 { x: 57.3; y: 61.9; scale-x: 0.919; scale-y: 0.778; }
        frame 18 { x: 57; y: -10000; scale-x: 0.899; scale-y: 0.782; }
        frame 19 { y: 61.8; scale-x: 0.879; scale-y: 0.786; }
        frame 20 { x: 56.7; y: 61.7; scale-x: 0.859; scale-y: 0.789; }
        frame 21 { x: 56.5; y: 61.6; scale-x: 0.84; scale-y: 0.793; }
        frame 22 { x: 56.4; y: 61.5; scale-x: 0.82; scale-y: 0.796; }
        frame 23 { x: 56.3; y: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 56; y: 61.4; skew-x: -0.7; skew-y: -0.7; scale-x: 0.792; scale-y: 0.808; }
        frame 26 { x: 55.9; y: 61.3; skew-x: -1.4; skew-y: -1.4; scale-x: 0.785; scale-y: 0.815; }
        frame 27 { x: 55.8; y: 61.1; skew-x: -2.2; skew-y: -2.2; scale-x: 0.777; scale-y: 0.823; }
        frame 28 { x: 55.5; y: 61; skew-x: -3; skew-y: -3; scale-x: 0.769; scale-y: 0.831; }
        frame 29 { x: -10000; y: -10000; skew-x: -4; skew-y: -4; scale-x: 0.762; scale-y: 0.839; }
        frame 30 { x: 55.9; y: 61.3; skew-x: -1.9; skew-y: -1.9; scale-x: 0.781; scale-y: 0.819; }
        frame 31 { x: 56.3; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 32 { x: 56.5; y: 61.6; skew-x: -10000; skew-y: -10000; scale-x: 0.83; scale-y: 0.795; }
        frame 33 { x: 56.8; y: 61.7; scale-x: 0.859; scale-y: 0.789; }
        frame 34 { x: 57; y: 61.8; scale-x: 0.889; scale-y: 0.784; }
        frame 35 { x: 57.3; y: 61.9; scale-x: 0.919; scale-y: 0.778; }
        frame 36 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 57; scale-x: 0.899; scale-y: 0.782; }
        frame 53 { y: 61.8; scale-x: 0.879; scale-y: 0.786; }
        frame 54 { x: 56.7; y: 61.7; scale-x: 0.859; scale-y: 0.789; }
        frame 55 { x: 56.5; y: 61.6; scale-x: 0.84; scale-y: 0.793; }
        frame 56 { x: 56.4; y: 61.5; scale-x: 0.82; scale-y: 0.796; }
        frame 57 { x: 56.3; y: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 56; y: 61.3; skew-x: -1.2; skew-y: -1.2; scale-x: 0.787; scale-y: 0.813; }
        frame 60 { x: 55.8; y: 61.1; skew-x: -2.5; skew-y: -2.5; scale-x: 0.774; scale-y: 0.826; }
        frame 61 { x: 55.5; y: 61; skew-x: -4; skew-y: -4; scale-x: 0.762; scale-y: 0.839; }
        frame 62 { x: 55.7; y: 61.1; skew-x: -3.2; skew-y: -3.2; scale-x: 0.776; scale-y: 0.832; }
        frame 63 { x: 56; y: 61.2; skew-x: -2.5; skew-y: -2.5; scale-x: 0.79; scale-y: 0.826; }
        frame 64 { x: 56.2; y: 61.3; skew-x: -1.9; skew-y: -1.9; scale-x: 0.805; scale-y: 0.819; }
        frame 65 { x: 56.5; y: 61.4; skew-x: -1.2; skew-y: -1.2; scale-x: 0.819; scale-y: 0.813; }
        frame 66 { x: 56.7; y: -10000; skew-x: -0.4; skew-y: -0.4; scale-x: 0.833; scale-y: 0.806; }
        frame 67 { x: 57; y: 61.5; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 68 { y: 61.6; skew-x: -10000; skew-y: -10000; scale-x: 0.871; scale-y: 0.793; }
        frame 69 { x: 57.1; y: 61.8; scale-x: 0.895; scale-y: 0.786; }
        frame 70 { x: 57.3; y: 61.9; scale-x: 0.919; scale-y: 0.778; }
        frame 71 { x: 57; y: -10000; scale-x: 0.899; scale-y: 0.782; }
        frame 72 { y: 61.8; scale-x: 0.879; scale-y: 0.786; }
        frame 73 { x: 56.7; y: 61.7; scale-x: 0.859; scale-y: 0.789; }
        frame 74 { x: 56.5; y: 61.6; scale-x: 0.84; scale-y: 0.793; }
        frame 75 { x: 56.4; y: 61.5; scale-x: 0.82; scale-y: 0.796; }
        frame 76 { x: 56.3; y: -10000; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cornpult_husk2";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 44.9; y: 63; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSK2; }
        frame 6 { x: 44.6; y: 63.1; skew-x: -1.9; skew-y: -1.9; scale-x: 0.787; scale-y: 0.813; cel: -10000; image: none; }
        frame 7 { x: 44.4; y: -10000; skew-x: -4; skew-y: -4; scale-x: 0.774; scale-y: 0.826; }
        frame 8 { x: 44.1; y: 63.2; skew-x: -6.2; skew-y: -6.2; scale-x: 0.762; scale-y: 0.839; }
        frame 9 { x: 44.2; y: -10000; skew-x: -5.2; skew-y: -5.2; scale-x: 0.776; scale-y: 0.832; }
        frame 10 { x: 44.5; y: 63.1; skew-x: -4; skew-y: -4; scale-x: 0.79; scale-y: 0.826; }
        frame 11 { x: -10000; y: -10000; skew-x: -2.9; skew-y: -2.9; scale-x: 0.804; scale-y: 0.819; }
        frame 12 { x: 44.6; skew-x: -1.9; skew-y: -1.9; scale-x: 0.819; scale-y: 0.813; }
        frame 13 { x: 44.7; y: 63; skew-x: -0.9; skew-y: -0.9; scale-x: 0.833; scale-y: 0.806; }
        frame 14 { x: 44.9; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 15 { x: 44.8; y: 63.3; skew-x: -10000; skew-y: -10000; scale-x: 0.867; scale-y: 0.793; }
        frame 16 { x: -10000; y: 63.5; scale-x: 0.886; scale-y: 0.786; }
        frame 17 { y: 63.6; scale-x: 0.905; scale-y: 0.778; }
        frame 18 { y: 63.5; scale-x: 0.888; scale-y: 0.782; }
        frame 19 { y: -10000; scale-x: 0.87; scale-y: 0.786; }
        frame 20 { x: 44.9; y: 63.4; scale-x: 0.853; scale-y: 0.789; }
        frame 21 { x: -10000; y: 63.2; scale-x: 0.835; scale-y: 0.793; }
        frame 22 { y: 63.1; scale-x: 0.818; scale-y: 0.796; }
        frame 23 { y: 63; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 44.7; y: 63.1; skew-x: -1.2; skew-y: -1.2; scale-x: 0.792; scale-y: 0.808; }
        frame 26 { x: 44.5; y: -10000; skew-x: -2.4; skew-y: -2.4; scale-x: 0.785; scale-y: 0.815; }
        frame 27 { x: 44.4; skew-x: -3.7; skew-y: -3.7; scale-x: 0.777; scale-y: 0.823; }
        frame 28 { x: 44.2; y: 63.2; skew-x: -4.9; skew-y: -4.9; scale-x: 0.769; scale-y: 0.831; }
        frame 29 { x: 44.1; y: -10000; skew-x: -6.2; skew-y: -6.2; scale-x: 0.762; scale-y: 0.839; }
        frame 30 { x: 44.5; y: 63.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.781; scale-y: 0.819; }
        frame 31 { x: 44.9; y: 63; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 32 { x: 44.8; y: 63.2; skew-x: -10000; skew-y: -10000; scale-x: 0.826; scale-y: 0.795; }
        frame 33 { x: 44.9; y: 63.4; scale-x: 0.853; scale-y: 0.789; }
        frame 34 { x: -10000; y: 63.5; scale-x: 0.879; scale-y: 0.784; }
        frame 35 { x: 44.8; y: 63.6; scale-x: 0.905; scale-y: 0.778; }
        frame 36 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 44.9; }
        frame 49 { x: -10000; }
        frame 51 { x: 44.8; }
        frame 52 { x: 44.9; y: 63.5; scale-x: 0.888; scale-y: 0.782; }
        frame 53 { x: 44.8; y: -10000; scale-x: 0.87; scale-y: 0.786; }
        frame 54 { x: 44.9; y: 63.4; scale-x: 0.853; scale-y: 0.789; }
        frame 55 { x: -10000; y: 63.2; scale-x: 0.835; scale-y: 0.793; }
        frame 56 { y: 63.1; scale-x: 0.818; scale-y: 0.796; }
        frame 57 { y: 63; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 44.6; y: 63.1; skew-x: -1.9; skew-y: -1.9; scale-x: 0.787; scale-y: 0.813; }
        frame 60 { x: 44.4; y: -10000; skew-x: -4; skew-y: -4; scale-x: 0.774; scale-y: 0.826; }
        frame 61 { x: 44.1; y: 63.2; skew-x: -6.2; skew-y: -6.2; scale-x: 0.762; scale-y: 0.839; }
        frame 62 { x: 44.2; y: -10000; skew-x: -5.2; skew-y: -5.2; scale-x: 0.776; scale-y: 0.832; }
        frame 63 { x: 44.5; y: 63.1; skew-x: -4; skew-y: -4; scale-x: 0.79; scale-y: 0.826; }
        frame 64 { x: -10000; y: -10000; skew-x: -2.9; skew-y: -2.9; scale-x: 0.804; scale-y: 0.819; }
        frame 65 { x: 44.6; skew-x: -1.9; skew-y: -1.9; scale-x: 0.819; scale-y: 0.813; }
        frame 66 { x: 44.7; y: 63; skew-x: -0.9; skew-y: -0.9; scale-x: 0.833; scale-y: 0.806; }
        frame 67 { x: 44.9; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 68 { x: 44.8; y: 63.3; skew-x: -10000; skew-y: -10000; scale-x: 0.867; scale-y: 0.793; }
        frame 69 { x: -10000; y: 63.5; scale-x: 0.886; scale-y: 0.786; }
        frame 70 { y: 63.6; scale-x: 0.905; scale-y: 0.778; }
        frame 71 { y: 63.5; scale-x: 0.888; scale-y: 0.782; }
        frame 72 { y: -10000; scale-x: 0.87; scale-y: 0.786; }
        frame 73 { x: 44.9; y: 63.4; scale-x: 0.853; scale-y: 0.789; }
        frame 74 { x: -10000; y: 63.2; scale-x: 0.835; scale-y: 0.793; }
        frame 75 { y: 63.1; scale-x: 0.818; scale-y: 0.796; }
        frame 76 { y: 63; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cornpult_husktip2";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 62.5; y: 65.5; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_HUSKTIP2; }
        frame 6 { x: 61.4; y: 65; skew-x: -3; skew-y: -7.5; scale-x: 0.787; scale-y: 0.821; cel: -10000; image: none; }
        frame 7 { x: 60.3; y: 64.5; skew-x: -6.2; skew-y: -15.2; scale-x: 0.774; scale-y: 0.841; }
        frame 8 { x: 59.3; y: 64.3; skew-x: -9.5; skew-y: -23.1; scale-x: 0.762; scale-y: 0.863; }
        frame 9 { x: 60; y: 64.6; skew-x: -7.9; skew-y: -19.2; scale-x: 0.776; scale-y: 0.851; }
        frame 10 { x: 60.8; y: 64.7; skew-x: -6.2; skew-y: -15.2; scale-x: 0.79; scale-y: 0.841; }
        frame 11 { x: 61.5; y: 64.9; skew-x: -4.7; skew-y: -11.4; scale-x: 0.804; scale-y: 0.831; }
        frame 12 { x: 62.1; y: 65.1; skew-x: -3; skew-y: -7.5; scale-x: 0.819; scale-y: 0.821; }
        frame 13 { x: 62.9; y: 65.4; skew-x: -1.4; skew-y: -3.7; scale-x: 0.833; scale-y: 0.81; }
        frame 14 { x: 63.5; y: 65.5; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 15 { x: 65.5; y: 65.3; skew-x: 9.5; skew-y: 15.1; scale-x: 0.846; scale-y: 0.807; }
        frame 16 { x: 67.6; y: 65.7; skew-x: 19.1; skew-y: 30.4; scale-x: 0.844; scale-y: 0.814; }
        frame 17 { x: 69.4; y: 66.2; skew-x: 28.9; skew-y: 45.7; scale-x: -10000; scale-y: 0.823; }
        frame 18 { x: 68.3; y: 65.9; skew-x: 24; skew-y: 38.1; scale-x: 0.835; scale-y: 0.817; }
        frame 19 { x: 67.2; y: 65.8; skew-x: 19.1; skew-y: 30.4; scale-x: 0.828; scale-y: 0.814; }
        frame 20 { x: 66; y: 65.5; skew-x: 14.3; skew-y: 22.8; scale-x: 0.821; scale-y: 0.81; }
        frame 21 { x: 64.8; y: -10000; skew-x: 9.5; skew-y: 15.1; scale-x: 0.814; scale-y: 0.807; }
        frame 22 { x: 63.6; skew-x: 4.8; skew-y: 7.5; scale-x: 0.807; scale-y: 0.803; }
        frame 23 { x: 62.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 61.9; y: 65.1; skew-x: -1.7; skew-y: -4.4; scale-x: 0.792; scale-y: 0.812; }
        frame 26 { x: 61.1; y: 64.8; skew-x: -3.7; skew-y: -9.2; scale-x: 0.784; scale-y: 0.825; }
        frame 27 { x: 60.6; y: 64.6; skew-x: -5.7; skew-y: -13.7; scale-x: 0.777; scale-y: 0.837; }
        frame 28 { x: 59.9; y: 64.4; skew-x: -7.5; skew-y: -18.4; scale-x: 0.769; scale-y: 0.849; }
        frame 29 { x: 59.3; y: 64.3; skew-x: -9.5; skew-y: -23.1; scale-x: 0.762; scale-y: 0.863; }
        frame 30 { x: 61; y: 64.8; skew-x: -4.7; skew-y: -11.4; scale-x: 0.781; scale-y: 0.831; }
        frame 31 { x: 62.5; y: 65.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 32 { x: 64.3; y: 65.4; skew-x: 7.1; skew-y: 11.3; scale-x: 0.811; scale-y: 0.805; }
        frame 33 { x: 66; y: 65.5; skew-x: 14.3; skew-y: 22.8; scale-x: 0.821; scale-y: 0.81; }
        frame 34 { x: 67.7; y: 65.7; skew-x: 21.6; skew-y: 34.3; scale-x: 0.832; scale-y: 0.816; }
        frame 35 { x: 69.4; y: 66.2; skew-x: 28.9; skew-y: 45.7; scale-x: 0.844; scale-y: 0.823; }
        frame 36 { x: -10000; y: 66.3; skew-x: 28.8; skew-y: 45.6; scale-x: 0.843; scale-y: 0.821; }
        frame 37 { y: 66.2; skew-x: 28.9; skew-y: 45.7; scale-x: 0.844; scale-y: 0.823; }
        frame 38 { y: 66.3; skew-x: 28.8; skew-y: 45.6; scale-x: 0.843; scale-y: 0.821; }
        frame 39 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 44 { y: 66.2; skew-x: 28.9; skew-y: 45.7; scale-x: 0.844; scale-y: 0.823; }
        frame 45 { y: 66.3; skew-x: 28.8; skew-y: 45.6; scale-x: 0.842; scale-y: 0.821; }
        frame 46 { x: 69.3; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: -10000; y: 66.2; }
        frame 48 { x: 69.4; y: 66.3; scale-y: 0.82; }
        frame 49 { x: -10000; y: -10000; scale-y: -10000; }
        frame 51 { scale-x: 0.843; scale-y: 0.821; }
        frame 52 { x: 68.3; y: 65.9; skew-x: 24; skew-y: 38.1; scale-x: 0.834; scale-y: 0.816; }
        frame 53 { x: 67.2; y: 65.7; skew-x: 19.1; skew-y: 30.3; scale-x: 0.828; scale-y: 0.813; }
        frame 54 { x: 66; y: 65.6; skew-x: 14.3; skew-y: 22.8; scale-x: 0.821; scale-y: 0.81; }
        frame 55 { x: 64.8; y: 65.4; skew-x: 9.5; skew-y: 15.1; scale-x: 0.814; scale-y: 0.806; }
        frame 56 { x: 63.6; y: -10000; skew-x: 4.8; skew-y: 7.5; scale-x: 0.807; scale-y: 0.803; }
        frame 57 { x: 62.5; y: 65.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 61.4; y: 65; skew-x: -3; skew-y: -7.5; scale-x: 0.787; scale-y: 0.821; }
        frame 60 { x: 60.3; y: 64.5; skew-x: -6.2; skew-y: -15.2; scale-x: 0.774; scale-y: 0.841; }
        frame 61 { x: 59.3; y: 64.3; skew-x: -9.5; skew-y: -23.1; scale-x: 0.762; scale-y: 0.863; }
        frame 62 { x: 60; y: 64.6; skew-x: -7.9; skew-y: -19.2; scale-x: 0.776; scale-y: 0.851; }
        frame 63 { x: 60.8; y: 64.7; skew-x: -6.2; skew-y: -15.2; scale-x: 0.79; scale-y: 0.841; }
        frame 64 { x: 61.5; y: 64.9; skew-x: -4.7; skew-y: -11.4; scale-x: 0.804; scale-y: 0.831; }
        frame 65 { x: 62.1; y: 65.1; skew-x: -3; skew-y: -7.5; scale-x: 0.819; scale-y: 0.821; }
        frame 66 { x: 62.9; y: 65.4; skew-x: -1.4; skew-y: -3.7; scale-x: 0.833; scale-y: 0.81; }
        frame 67 { x: 63.5; y: 65.5; skew-x: 0; skew-y: 0; scale-x: 0.847; scale-y: 0.8; }
        frame 68 { x: 65.5; y: 65.3; skew-x: 9.5; skew-y: 15.1; scale-x: 0.846; scale-y: 0.807; }
        frame 69 { x: 67.6; y: 65.7; skew-x: 19.1; skew-y: 30.4; scale-x: 0.844; scale-y: 0.814; }
        frame 70 { x: 69.4; y: 66.2; skew-x: 28.9; skew-y: 45.7; scale-x: -10000; scale-y: 0.823; }
        frame 71 { x: 68.3; y: 65.9; skew-x: 24; skew-y: 38.1; scale-x: 0.835; scale-y: 0.817; }
        frame 72 { x: 67.2; y: 65.8; skew-x: 19.1; skew-y: 30.4; scale-x: 0.828; scale-y: 0.814; }
        frame 73 { x: 66; y: 65.5; skew-x: 14.3; skew-y: 22.8; scale-x: 0.821; scale-y: 0.81; }
        frame 74 { x: 64.8; y: -10000; skew-x: 9.5; skew-y: 15.1; scale-x: 0.814; scale-y: 0.807; }
        frame 75 { x: 63.6; skew-x: 4.8; skew-y: 7.5; scale-x: 0.807; scale-y: 0.803; }
        frame 76 { x: 62.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Cornpult_stalk1";
        frame-count: 77;
        frame 0 { x: 8.74841816; y: 2.5036156; skew-x: 29.853727; skew-y: 29.853727; scale-x: 0.637819481; scale-y: 0.637819481; cel: -1; }
        frame 1 { x: 8.74841816; y: 2.5036156; skew-x: 29.853727; skew-y: 29.853727; scale-x: 0.637819481; scale-y: 0.637819481; cel: -10000; }
        frame 2 { x: 8.74841816; y: 2.5036156; skew-x: 29.853727; skew-y: 29.853727; scale-x: 0.637819481; scale-y: 0.637819481;  }
        frame 3 { x: 8.74841816; y: 2.5036156; skew-x: 29.853727; skew-y: 29.853727; scale-x: 0.637819481; scale-y: 0.637819481;  }
        frame 4 { x: 8.74841816; y: 2.5036156; skew-x: 29.853727; skew-y: 29.853727; scale-x: 0.637819481; scale-y: 0.637819481;  }
        frame 5 { x: 36.24237008; y: 15.32235842; skew-x: -37.09245738; skew-y: -37.76212392; scale-x: 0.39762499; scale-y: 0.73419696; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK1_BEND; }
        frame 6 { x: 36.06652809; y: 15.90735875; skew-x: -37.60710717; skew-y: -38.53149109; scale-x: 0.40707397; scale-y: 0.72729984; cel: -10000; }
        frame 7 { x: 35.99623888; y: 16.35851494; skew-x: -37.97402039; skew-y: -39.12016049; scale-x: 0.41531329; scale-y: 0.72112968; }
        frame 8 { x: 35.86188460; y: 16.99059820; skew-x: -39.37301724; skew-y: -40.61169505; scale-x: 0.42110160; scale-y: 0.72254347; }
        frame 9 { x: 35.63199762; y: 17.50036554; skew-x: -40.61850350; skew-y: -41.92864569; scale-x: 0.42611729; scale-y: 0.72448219; }
        frame 10 { x: 35.51036304; y: 18.02363919; skew-x: -41.51115881; skew-y: -42.88060060; scale-x: 0.42973498; scale-y: 0.72510796; }
        frame 11 { x: 35.42564246; y: 18.44309715; skew-x: -42.45000952; skew-y: -43.77364853; scale-x: 0.42445645; scale-y: 0.72041208; }
        frame 12 { x: 35.53615064; y: 18.92792265; skew-x: -42.94848218; skew-y: -44.19132418; scale-x: 0.41984423; scale-y: 0.72000131; }
        frame 13 { x: 35.57861670; y: 19.29366051; skew-x: -43.77137984; skew-y: -44.92189418; scale-x: 0.41255080; scale-y: 0.71593045; }
        frame 14 { x: 35.67642290; y: 19.66004059; skew-x: -44.51963527; skew-y: -45.56609840; scale-x: 0.40532453; scale-y: 0.71286830; }
        frame 15 { x: 36.02313141; y: 18.77831481; skew-x: -42.68489874; skew-y: -43.28845773; scale-x: 0.38446829; scale-y: 0.71600799; }
        frame 16 { x: 36.28594673; y: 18.09934839; skew-x: -41.43860591; skew-y: -41.59773225; scale-x: 0.36601661; scale-y: 0.72211923; }
        frame 17 { x: 36.21535027; y: 17.63376650; skew-x: -40.56789328; skew-y: -40.79433992; scale-x: 0.37008452; scale-y: 0.72378642; }
        frame 18 { x: 36.20000660; y: 17.17645885; skew-x: -39.98727183; skew-y: -40.31650355; scale-x: 0.37942428; scale-y: 0.73221212; }
        frame 19 { x: 36.11699601; y: 16.80928936; skew-x: -39.60212521; skew-y: -40.02885016; scale-x: 0.38594687; scale-y: 0.73543313; }
        frame 20 { x: 36.06452738; y: 16.47874867; skew-x: -39.19916104; skew-y: -39.71794295; scale-x: 0.39046389; scale-y: 0.73520840; }
        frame 21 { x: 36.04953980; y: 16.12587250; skew-x: -38.46574126; skew-y: -39.06748912; scale-x: 0.39633687; scale-y: 0.73828447; }
        frame 22 { x: 36.09570693; y: 15.73413764; skew-x: -37.97607716; skew-y: -38.61362277; scale-x: 0.39744197; scale-y: 0.73691780; }
        frame 23 { x: 36.24237008; y: 15.32235842; skew-x: -37.09245738; skew-y: -37.76212392; scale-x: 0.39762499; scale-y: 0.73419696; }
        frame 24 { x: 36.24237008; y: 15.32235842; skew-x: -37.09245738; skew-y: -37.76212392; scale-x: 0.39762499; scale-y: 0.73419696; }
        frame 25 { x: 33.52846446; y: 16.21890272; skew-x: -44.45293140; skew-y: -44.65833679; scale-x: 0.39266389; scale-y: 0.77004774; }
        frame 26 { x: 30.87170539; y: 17.08945577; skew-x: -51.67654746; skew-y: -51.38818162; scale-x: 0.38181341; scale-y: 0.79838626; }
        frame 27 { x: 28.37773830; y: 18.04720165; skew-x: -58.50299472; skew-y: -57.72082764; scale-x: 0.37200141; scale-y: 0.82928813; }
        frame 28 { x: 26.01359506; y: 19.03879174; skew-x: -65.26289334; skew-y: -64.03000137; scale-x: 0.35792441; scale-y: 0.84561033; }
        frame 29 { x: 23.85686326; y: 20.40977775; skew-x: -72.42964321; skew-y: -70.94417623; scale-x: 0.34968919; scale-y: 0.85328812; }
        frame 30 { x: 25.42990756; y: 21.60834329; skew-x: -76.32881586; skew-y: -75.11996706; scale-x: 0.36388031; scale-y: 0.85703289; }
        frame 31 { x: 26.94192856; y: 22.19122132; skew-x: -79.37939019; skew-y: -78.33967161; scale-x: 0.37846311; scale-y: 0.87220462; }
        frame 32 { x: 29.85258678; y: 18.17529505; skew-x: -60.62732083; skew-y: -59.65153526; scale-x: 0.39841517; scale-y: 0.91065352; }
        frame 33 { x: 35.03812167; y: 12.96080441; skew-x: -37.44319506; skew-y: -36.68140575; scale-x: 0.41250275; scale-y: 0.91715629; }
        frame 34 { x: 41.21983103; y: 9.02940533; skew-x: -13.06139585; skew-y: -12.78707970; scale-x: 0.42960219; scale-y: 0.89667669; }
        frame 35 { x: 48.41234579; y: 9.20886455; skew-x: 3.02336951; skew-y: 3.59922653; scale-x: 0.41083357; scale-y: 0.89171903; image: IMAGE_REANIM_CORNPULT_STALK1; }
        frame 36 { x: 49.30717516; y: 9.24500117; skew-x: 3.71937389; skew-y: 3.95955966; scale-x: 0.42604059; scale-y: 0.88530927; }
        frame 37 { x: 50.26853782; y: 9.29922056; skew-x: 4.69634842; skew-y: 4.65188501; scale-x: 0.43820614; scale-y: 0.87752195; }
        frame 38 { x: 49.94975497; y: 9.35762902; skew-x: 4.16121384; skew-y: 4.12357913; scale-x: 0.43647473; scale-y: 0.87483081; }
        frame 39 { x: 49.63424297; y: 9.29569106; skew-x: 4.43456846; skew-y: 4.45365608; scale-x: 0.43513593; scale-y: 0.87860068; }
        frame 40 { x: 49.41673243; y: 9.27437255; skew-x: 4.21003985; skew-y: 4.28603298; scale-x: 0.43313897; scale-y: 0.88106055; }
        frame 41 { x: 49.13364843; y: 9.25217199; skew-x: 4.14129576; skew-y: 4.27419484; scale-x: 0.43093248; scale-y: 0.88307872; }
        frame 42 { x: 48.93050341; y: 9.18717484; skew-x: 3.90633671; skew-y: 4.09595647; scale-x: 0.42728471; scale-y: 0.88208081; }
        frame 43 { x: 48.44649564; y: 9.24552868; skew-x: 3.44296122; skew-y: 3.57367192; scale-x: 0.43169644; scale-y: 0.88439273; }
        frame 44 { x: 48.04386746; y: 9.32179949; skew-x: 2.78226584; skew-y: 2.83054306; scale-x: 0.43568976; scale-y: 0.88306262; }
        frame 45 { x: 48.09750498; y: 9.27428453; skew-x: 2.70662773; skew-y: 2.70759510; scale-x: 0.43885227; scale-y: 0.88402015; }
        frame 46 { x: 48.34089314; y: 9.25865214; skew-x: 3.10747561; skew-y: 3.17736020; scale-x: 0.43442828; scale-y: 0.88298193; }
        frame 47 { x: 48.57424482; y: 9.28316646; skew-x: 3.30026846; skew-y: 3.44939436; scale-x: 0.42988891; scale-y: 0.88279971; }
        frame 48 { x: 48.87676666; y: 9.25644110; skew-x: 3.55622022; skew-y: 3.78445010; scale-x: 0.42611918; scale-y: 0.88409837; }
        frame 49 { x: 49.05575703; y: 9.23131845; skew-x: 3.76035215; skew-y: 4.04876691; scale-x: 0.42344016; scale-y: 0.88543499; }
        frame 50 { x: 49.12974521; y: 9.30471395; skew-x: 3.72650427; skew-y: 3.97726228; scale-x: 0.42601071; scale-y: 0.88646376; }
        frame 51 { x: 49.19545032; y: 9.17139899; skew-x: 3.93910945; skew-y: 4.10892183; scale-x: 0.43207516; scale-y: 0.88967752; }
        frame 52 { x: 46.48264818; y: 9.96992944; skew-x: -4.70120255; skew-y: -5.17125318; scale-x: 0.47390452; scale-y: 0.89797709; }
        frame 53 { x: 42.68008761; y: 9.59083843; skew-x: -12.78283806; skew-y: -13.75268240; scale-x: 0.50629970; scale-y: 0.89929346; image: IMAGE_REANIM_CORNPULT_STALK1_BEND_SOFT; }
        frame 54 { x: 39.71855627; y: 10.93259730; skew-x: -19.08876411; skew-y: -20.41128877; scale-x: 0.51160680; scale-y: 0.86845263; image: IMAGE_REANIM_CORNPULT_STALK1_BEND; }
        frame 55 { x: 38.38085000; y: 12.69684930; skew-x: -25.02810937; skew-y: -26.49392229; scale-x: 0.48438584; scale-y: 0.80731963; }
        frame 56 { x: 37.23899025; y: 14.06055692; skew-x: -30.57659524; skew-y: -31.84434303; scale-x: 0.44997775; scale-y: 0.76921727; }
        frame 57 { x: 36.24237008; y: 15.32235842; skew-x: -37.09245738; skew-y: -37.76212392; scale-x: 0.39762499; scale-y: 0.73419696; }
        frame 58 { x: 36.24237008; y: 15.32235842; skew-x: -37.09245738; skew-y: -37.76212392; scale-x: 0.39762499; scale-y: 0.73419696; }
        frame 59 { x: 36.06652809; y: 15.90735875; skew-x: -37.60710717; skew-y: -38.53149109; scale-x: 0.40707397; scale-y: 0.72729984; }
        frame 60 { x: 35.99623888; y: 16.35851494; skew-x: -37.97402039; skew-y: -39.12016049; scale-x: 0.41531329; scale-y: 0.72112968; }
        frame 61 { x: 35.86188460; y: 16.99059820; skew-x: -39.37301724; skew-y: -40.61169505; scale-x: 0.42110160; scale-y: 0.72254347; }
        frame 62 { x: 35.63199762; y: 17.50036554; skew-x: -40.61850350; skew-y: -41.92864569; scale-x: 0.42611729; scale-y: 0.72448219; }
        frame 63 { x: 35.51036304; y: 18.02363919; skew-x: -41.51115881; skew-y: -42.88060060; scale-x: 0.42973498; scale-y: 0.72510796; }
        frame 64 { x: 35.42564246; y: 18.44309715; skew-x: -42.45000952; skew-y: -43.77364853; scale-x: 0.42445645; scale-y: 0.72041208; }
        frame 65 { x: 35.53615064; y: 18.92792265; skew-x: -42.94848218; skew-y: -44.19132418; scale-x: 0.41984423; scale-y: 0.72000131; }
        frame 66 { x: 35.57861670; y: 19.29366051; skew-x: -43.77137984; skew-y: -44.92189418; scale-x: 0.41255080; scale-y: 0.71593045; }
        frame 67 { x: 35.67642290; y: 19.66004059; skew-x: -44.51963527; skew-y: -45.56609840; scale-x: 0.40532453; scale-y: 0.71286830; }
        frame 68 { x: 36.02313141; y: 18.77831481; skew-x: -42.68489874; skew-y: -43.28845773; scale-x: 0.38446829; scale-y: 0.71600799; }
        frame 69 { x: 36.28594673; y: 18.09934839; skew-x: -41.43860591; skew-y: -41.59773225; scale-x: 0.36601661; scale-y: 0.72211923; }
        frame 70 { x: 36.21535027; y: 17.63376650; skew-x: -40.56789328; skew-y: -40.79433992; scale-x: 0.37008452; scale-y: 0.72378642; }
        frame 71 { x: 36.20000660; y: 17.17645885; skew-x: -39.98727183; skew-y: -40.31650355; scale-x: 0.37942428; scale-y: 0.73221212; }
        frame 72 { x: 36.11699601; y: 16.80928936; skew-x: -39.60212521; skew-y: -40.02885016; scale-x: 0.38594687; scale-y: 0.73543313; }
        frame 73 { x: 36.06452738; y: 16.47874867; skew-x: -39.19916104; skew-y: -39.71794295; scale-x: 0.39046389; scale-y: 0.73520840; }
        frame 74 { x: 36.04953980; y: 16.12587250; skew-x: -38.46574126; skew-y: -39.06748912; scale-x: 0.39633687; scale-y: 0.73828447; }
        frame 75 { x: 36.09570693; y: 15.73413764; skew-x: -37.97607716; skew-y: -38.61362277; scale-x: 0.39744197; scale-y: 0.73691780; }
        frame 76 { x: 36.24237008; y: 15.32235842; skew-x: -37.09245738; skew-y: -37.76212392; scale-x: 0.39762499; scale-y: 0.73419696; }
    }
    Track {
        source-name: "Cornpult_stalk2";
        frame-count: 77;
        frame 0 { x: 5.74386978; y: 7.00097545; skew-x: -55.447534; skew-y: -55.447534; scale-x: 0.233597393; scale-y: 0.233597393; cel: -1; }
        frame 1 { x: 5.74386978; y: 7.00097545; skew-x: -55.447534; skew-y: -55.447534; scale-x: 0.233597393; scale-y: 0.233597393; cel: -10000; }
        frame 2 { x: 5.74386978; y: 7.00097545; skew-x: -55.447534; skew-y: -55.447534; scale-x: 0.233597393; scale-y: 0.233597393;  }
        frame 3 { x: 5.74386978; y: 7.00097545; skew-x: -55.447534; skew-y: -55.447534; scale-x: 0.233597393; scale-y: 0.233597393;  }
        frame 4 { x: 5.74386978; y: 7.00097545; skew-x: -55.447534; skew-y: -55.447534; scale-x: 0.233597393; scale-y: 0.233597393;  }
        frame 5 { x: 28.29902701; y: 22.54384701; skew-x: -103.72126047; skew-y: -102.59814709; scale-x: 0.42117962; scale-y: 0.80994668; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK2_BEND; }
        frame 6 { x: 27.67936470; y: 22.15322264; skew-x: -100.02201267; skew-y: -98.88989852; scale-x: 0.42075936; scale-y: 0.80838358; cel: -10000; }
        frame 7 { x: 27.24444687; y: 21.67559723; skew-x: -96.59537511; skew-y: -95.48566531; scale-x: 0.41901295; scale-y: 0.80690105; }
        frame 8 { x: 27.31923707; y: 22.71442686; skew-x: -98.91617162; skew-y: -97.90271282; scale-x: 0.41783740; scale-y: 0.81271560; }
        frame 9 { x: 27.35242605; y: 23.68026464; skew-x: -101.41876875; skew-y: -100.50343046; scale-x: 0.41624473; scale-y: 0.81791387; }
        frame 10 { x: 27.50245096; y: 24.57890149; skew-x: -103.55184202; skew-y: -102.73012070; scale-x: 0.41345216; scale-y: 0.82037525; }
        frame 11 { x: 27.69853844; y: 25.47382913; skew-x: -106.02096831; skew-y: -105.30314134; scale-x: 0.40925559; scale-y: 0.82087832; }
        frame 12 { x: 28.00754339; y: 26.44174687; skew-x: -108.11536073; skew-y: -107.48352832; scale-x: 0.40820174; scale-y: 0.82613240; }
        frame 13 { x: 28.36877958; y: 27.27928503; skew-x: -110.53363065; skew-y: -109.96343147; scale-x: 0.40537295; scale-y: 0.82569472; }
        frame 14 { x: 28.80663999; y: 28.09817650; skew-x: -112.88573500; skew-y: -112.35156959; scale-x: 0.40343705; scale-y: 0.82484466; }
        frame 15 { x: 29.07944749; y: 27.61482011; skew-x: -113.40722284; skew-y: -113.08048138; scale-x: 0.39584910; scale-y: 0.82703622; }
        frame 16 { x: 29.32476349; y: 27.31199533; skew-x: -114.27499919; skew-y: -114.22655504; scale-x: 0.38534211; scale-y: 0.82882249; }
        frame 17 { x: 29.06203759; y: 26.59023283; skew-x: -112.77164385; skew-y: -112.64596545; scale-x: 0.38794382; scale-y: 0.82771500; }
        frame 18 { x: 28.83213778; y: 25.93434221; skew-x: -111.33680365; skew-y: -111.08617826; scale-x: 0.39577467; scale-y: 0.83347725; }
        frame 19 { x: 28.63535126; y: 25.31517042; skew-x: -110.07998388; skew-y: -109.68751105; scale-x: 0.40103847; scale-y: 0.83214997; }
        frame 20 { x: 28.51985368; y: 24.67886709; skew-x: -108.78321191; skew-y: -108.23251948; scale-x: 0.40462415; scale-y: 0.82584737; }
        frame 21 { x: 28.37608357; y: 24.00802573; skew-x: -107.13591413; skew-y: -106.40994659; scale-x: 0.41038681; scale-y: 0.82244978; }
        frame 22 { x: 28.32768977; y: 23.34906477; skew-x: -105.76903411; skew-y: -104.84156343; scale-x: 0.41618144; scale-y: 0.81675881; }
        frame 23 { x: 28.29902701; y: 22.54384701; skew-x: -103.72126047; skew-y: -102.59814709; scale-x: 0.42117962; scale-y: 0.80994668; }
        frame 24 { x: 28.29902701; y: 22.54384701; skew-x: -103.72126047; skew-y: -102.59814709; scale-x: 0.42117962; scale-y: 0.80994668; }
        frame 25 { x: 26.45701358; y: 24.55518023; skew-x: -110.87039806; skew-y: -109.70974288; scale-x: 0.42612375; scale-y: 0.81627086; }
        frame 26 { x: 25.09554498; y: 26.43804566; skew-x: -118.70475210; skew-y: -117.43816213; scale-x: 0.42711826; scale-y: 0.80924662; }
        frame 27 { x: 24.16624762; y: 28.31786847; skew-x: -127.00245788; skew-y: -125.60220503; scale-x: 0.42984915; scale-y: 0.80324068; }
        frame 28 { x: 23.61385260; y: 29.83384685; skew-x: -135.61129472; skew-y: -134.08596423; scale-x: 0.42581909; scale-y: 0.78550392; }
        frame 29 { x: 22.72157925; y: 31.09421669; skew-x: -141.77574538; skew-y: -140.07965367; scale-x: 0.42145901; scale-y: 0.76391232; }
        frame 30 { x: 23.13226550; y: 31.81599662; skew-x: -138.33956399; skew-y: -136.88460463; scale-x: 0.41772747; scale-y: 0.77619197; }
        frame 31 { x: 23.29955718; y: 31.92483904; skew-x: -134.31822964; skew-y: -133.25384840; scale-x: 0.41099133; scale-y: 0.79518474; }
        frame 32 { x: 21.22628594; y: 24.06748893; skew-x: -106.06962554; skew-y: -106.50744784; scale-x: 0.36412362; scale-y: 0.82397317; }
        frame 33 { x: 24.71478003; y: 12.74276935; skew-x: -75.62304095; skew-y: -76.89964464; scale-x: 0.33331971; scale-y: 0.82300632; }
        frame 34 { x: 33.66490018; y: 2.30485433; skew-x: -39.58927019; skew-y: -39.02707605; scale-x: 0.38672377; scale-y: 0.78836630; }
        frame 35 { x: 48.75135377; y: -2.23480498; skew-x: 2.87484668; skew-y: 3.92388766; scale-x: 0.38018974; scale-y: 0.73676208; image: IMAGE_REANIM_CORNPULT_STALK2; }
        frame 36 { x: 50.05712815; y: -2.20751958; skew-x: 4.42054173; skew-y: 5.70956698; scale-x: 0.38869415; scale-y: 0.73473769; }
        frame 37 { x: 51.44074005; y: -2.11409368; skew-x: 6.09372849; skew-y: 7.57877420; scale-x: 0.39468498; scale-y: 0.73110254; }
        frame 38 { x: 50.89584065; y: -1.99809704; skew-x: 4.98958444; skew-y: 6.45592311; scale-x: 0.39269961; scale-y: 0.72883044; }
        frame 39 { x: 50.46286984; y: -2.05042265; skew-x: 4.47888065; skew-y: 5.88885390; scale-x: 0.39179091; scale-y: 0.73138808; }
        frame 40 { x: 50.02988690; y: -2.04943382; skew-x: 3.47664403; skew-y: 4.82863488; scale-x: 0.39019067; scale-y: 0.73277848; }
        frame 41 { x: 49.56438035; y: -2.03828857; skew-x: 2.63731202; skew-y: 3.92975566; scale-x: 0.38829449; scale-y: 0.73372263; }
        frame 42 { x: 49.14825773; y: -2.02933667; skew-x: 1.63944852; skew-y: 2.87082247; scale-x: 0.38498838; scale-y: 0.73208907; }
        frame 43 { x: 48.53115695; y: -1.96183035; skew-x: 0.89741711; skew-y: 2.22057596; scale-x: 0.38907743; scale-y: 0.73286961; }
        frame 44 { x: 47.99830364; y: -1.83492962; skew-x: 0.13056266; skew-y: 1.57800257; scale-x: 0.39271950; scale-y: 0.73029057; }
        frame 45 { x: 48.16530176; y: -1.88558541; skew-x: 0.59073423; skew-y: 2.12387097; scale-x: 0.39501123; scale-y: 0.72808677; }
        frame 46 { x: 48.54411128; y: -1.87000693; skew-x: 1.29676000; skew-y: 2.75794805; scale-x: 0.39023217; scale-y: 0.72463610; }
        frame 47 { x: 48.86159117; y: -1.82227126; skew-x: 1.75331833; skew-y: 3.12831088; scale-x: 0.38533025; scale-y: 0.72193204; }
        frame 48 { x: 49.26212863; y: -1.84259291; skew-x: 2.27907156; skew-y: 3.56786410; scale-x: 0.38109594; scale-y: 0.72039235; }
        frame 49 { x: 49.55003163; y: -1.86420712; skew-x: 2.83814519; skew-y: 4.06639962; scale-x: 0.37786429; scale-y: 0.71877417; }
        frame 50 { x: 49.79094819; y: -1.80176448; skew-x: 3.58051818; skew-y: 4.88283047; scale-x: 0.37956197; scale-y: 0.71648966; }
        frame 51 { x: 49.99232493; y: -1.94724321; skew-x: 4.12908782; skew-y: 5.55746760; scale-x: 0.38445664; scale-y: 0.71633352; }
        frame 52 { x: 43.77741527; y: -0.51245887; skew-x: -14.32397280; skew-y: -12.34533742; scale-x: 0.42388304; scale-y: 0.74637128; }
        frame 53 { x: 36.72270391; y: 1.53635989; skew-x: -32.51240682; skew-y: -30.38291220; scale-x: 0.45048295; scale-y: 0.78108989; image: IMAGE_REANIM_CORNPULT_STALK2_BEND_SOFT; }
        frame 54 { x: 31.49528790; y: 5.87997644; skew-x: -49.55286910; skew-y: -47.61488451; scale-x: 0.45393175; scale-y: 0.80261053; image: IMAGE_REANIM_CORNPULT_STALK2_BEND; }
        frame 55 { x: 28.94050321; y: 11.59030306; skew-x: -67.43822101; skew-y: -65.85905857; scale-x: 0.43977770; scale-y: 0.80676499; }
        frame 56 { x: 27.72099846; y: 17.08323205; skew-x: -84.82701328; skew-y: -83.56161179; scale-x: 0.43157960; scale-y: 0.81779996; }
        frame 57 { x: 28.29902701; y: 22.54384701; skew-x: -103.72126047; skew-y: -102.59814709; scale-x: 0.42117962; scale-y: 0.80994668; }
        frame 58 { x: 28.29902701; y: 22.54384701; skew-x: -103.72126047; skew-y: -102.59814709; scale-x: 0.42117962; scale-y: 0.80994668; }
        frame 59 { x: 27.67936470; y: 22.15322264; skew-x: -100.02201267; skew-y: -98.88989852; scale-x: 0.42075936; scale-y: 0.80838358; }
        frame 60 { x: 27.24444687; y: 21.67559723; skew-x: -96.59537511; skew-y: -95.48566531; scale-x: 0.41901295; scale-y: 0.80690105; }
        frame 61 { x: 27.31923707; y: 22.71442686; skew-x: -98.91617162; skew-y: -97.90271282; scale-x: 0.41783740; scale-y: 0.81271560; }
        frame 62 { x: 27.35242605; y: 23.68026464; skew-x: -101.41876875; skew-y: -100.50343046; scale-x: 0.41624473; scale-y: 0.81791387; }
        frame 63 { x: 27.50245096; y: 24.57890149; skew-x: -103.55184202; skew-y: -102.73012070; scale-x: 0.41345216; scale-y: 0.82037525; }
        frame 64 { x: 27.69853844; y: 25.47382913; skew-x: -106.02096831; skew-y: -105.30314134; scale-x: 0.40925559; scale-y: 0.82087832; }
        frame 65 { x: 28.00754339; y: 26.44174687; skew-x: -108.11536073; skew-y: -107.48352832; scale-x: 0.40820174; scale-y: 0.82613240; }
        frame 66 { x: 28.36877958; y: 27.27928503; skew-x: -110.53363065; skew-y: -109.96343147; scale-x: 0.40537295; scale-y: 0.82569472; }
        frame 67 { x: 28.80663999; y: 28.09817650; skew-x: -112.88573500; skew-y: -112.35156959; scale-x: 0.40343705; scale-y: 0.82484466; }
        frame 68 { x: 29.07944749; y: 27.61482011; skew-x: -113.40722284; skew-y: -113.08048138; scale-x: 0.39584910; scale-y: 0.82703622; }
        frame 69 { x: 29.32476349; y: 27.31199533; skew-x: -114.27499919; skew-y: -114.22655504; scale-x: 0.38534211; scale-y: 0.82882249; }
        frame 70 { x: 29.06203759; y: 26.59023283; skew-x: -112.77164385; skew-y: -112.64596545; scale-x: 0.38794382; scale-y: 0.82771500; }
        frame 71 { x: 28.83213778; y: 25.93434221; skew-x: -111.33680365; skew-y: -111.08617826; scale-x: 0.39577467; scale-y: 0.83347725; }
        frame 72 { x: 28.63535126; y: 25.31517042; skew-x: -110.07998388; skew-y: -109.68751105; scale-x: 0.40103847; scale-y: 0.83214997; }
        frame 73 { x: 28.51985368; y: 24.67886709; skew-x: -108.78321191; skew-y: -108.23251948; scale-x: 0.40462415; scale-y: 0.82584737; }
        frame 74 { x: 28.37608357; y: 24.00802573; skew-x: -107.13591413; skew-y: -106.40994659; scale-x: 0.41038681; scale-y: 0.82244978; }
        frame 75 { x: 28.32768977; y: 23.34906477; skew-x: -105.76903411; skew-y: -104.84156343; scale-x: 0.41618144; scale-y: 0.81675881; }
        frame 76 { x: 28.29902701; y: 22.54384701; skew-x: -103.72126047; skew-y: -102.59814709; scale-x: 0.42117962; scale-y: 0.80994668; }
    }
    Track {
        source-name: "Cornpult_stalk4";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 14; y: 13.5; skew-x: 19.1; skew-y: 19.1; scale-x: 0.755; scale-y: 0.755; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK4; }
        frame 6 { x: 14.5; y: 12; skew-x: 23.3; skew-y: 23.3; scale-x: 0.754; scale-y: 0.754; cel: -10000; image: none; }
        frame 7 { x: 15; y: 10.5; skew-x: 27.6; skew-y: 27.6; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 14.8; y: 11.9; skew-x: 24.3; skew-y: 24.3; scale-x: 0.753; scale-y: 0.753; }
        frame 9 { x: 14.7; y: 13.5; skew-x: 21.3; skew-y: 21.3; scale-x: 0.754; scale-y: 0.754; }
        frame 10 { x: 14.5; y: 15; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 14.4; y: 16.5; skew-x: 14.8; skew-y: 14.8; }
        frame 12 { x: 14.2; y: 18; skew-x: 11.8; skew-y: 11.8; }
        frame 13 { x: 14; y: 19.6; skew-x: 8.5; skew-y: 8.5; scale-x: 0.755; scale-y: 0.755; }
        frame 14 { x: 13.8; y: 21.1; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 13.3; y: 21.9; skew-x: -0.4; skew-y: -0.4; }
        frame 16 { x: 12.7; y: 22.8; skew-x: -6.4; skew-y: -6.4; scale-x: 0.754; scale-y: 0.754; }
        frame 17 { x: 12.8; y: 21.5; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 13; y: 20; skew-x: 0.8; skew-y: 0.8; scale-x: 0.755; scale-y: 0.755; }
        frame 19 { x: 13.2; y: 18.7; skew-x: 4.3; skew-y: 4.3; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 13.3; y: 17.3; skew-x: 8; skew-y: 8; }
        frame 21 { x: 13.6; y: 16; skew-x: 11.6; skew-y: 11.6; }
        frame 22 { x: 13.7; y: 14.7; skew-x: 15.3; skew-y: 15.3; }
        frame 23 { x: 14; y: 13.5; skew-x: 19.1; skew-y: 19.1; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 12.4; y: 17.5; skew-x: 9; skew-y: 9; }
        frame 26 { x: 10.8; y: 21.5; skew-x: -0.5; skew-y: -0.5; }
        frame 27 { x: 9.3; y: 25.8; skew-x: -10.4; skew-y: -10.4; scale-x: 0.754; scale-y: 0.754; }
        frame 28 { x: 7.8; y: 30.1; skew-x: -20.2; skew-y: -20.2; scale-x: 0.753; scale-y: 0.753; }
        frame 29 { x: 6.7; y: 34.5; skew-x: -30.2; skew-y: -30.2; scale-x: 0.754; scale-y: 0.754; }
        frame 30 { x: 6.8; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.753; scale-y: 0.753; }
        frame 31 { x: 6.7; scale-x: 0.754; scale-y: 0.754; }
        frame 32 { x: 5.7; y: 21.2; skew-x: -8.9; skew-y: -8.9; scale-x: 0.752; scale-y: 0.752; }
        frame 33 { x: 14; y: 2.8; skew-x: 31.3; skew-y: 31.3; scale-x: -10000; scale-y: 0.751; }
        frame 34 { x: 31.5; y: -14.9; skew-x: 69.9; skew-y: 70; scale-x: 0.751; scale-y: 0.75; }
        frame 35 { x: 57.6; y: -16.1; skew-x: 108.4; skew-y: 108.5; scale-x: 0.753; scale-y: 0.751; }
        frame 36 { x: 60.6; y: -15.5; skew-x: 117.8; skew-y: 118; scale-x: 0.751; scale-y: 0.75; }
        frame 37 { x: 63.4; y: -14.8; skew-x: 127.5; skew-y: 127.5; scale-x: 0.752; scale-y: -10000; }
        frame 38 { x: 62.6; y: -15; skew-x: 124.8; skew-y: 124.8; scale-x: 0.751; scale-y: 0.749; }
        frame 39 { x: 61.9; y: -15.1; skew-x: 122.1; skew-y: 122.1; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 61; y: -15.4; skew-x: 119.3; skew-y: 119.3; scale-y: 0.75; }
        frame 41 { x: 60.3; y: -15.5; skew-x: 116.6; skew-y: 116.6; scale-y: -10000; }
        frame 42 { x: 59.4; y: -15.7; skew-x: 113.8; skew-y: 113.8; }
        frame 43 { x: 58.5; y: -15.9; skew-x: 111.1; skew-y: 111.1; scale-x: 0.752; }
        frame 44 { x: 57.6; y: -16.1; skew-x: 108.4; skew-y: 108.5; scale-x: 0.753; scale-y: 0.751; }
        frame 45 { x: 58; y: -16; skew-x: 109.8; skew-y: 109.8; scale-x: 0.752; scale-y: 0.75; }
        frame 46 { x: 58.5; y: -10000; skew-x: 111; skew-y: 111.1; scale-x: 0.751; scale-y: -10000; }
        frame 47 { x: 58.9; y: -15.9; skew-x: 112.3; skew-y: 112.5; scale-x: -10000; }
        frame 48 { x: 59.5; y: -15.8; skew-x: 113.8; skew-y: 113.8; scale-y: 0.749; }
        frame 49 { x: 59.9; y: -15.7; skew-x: 115.1; skew-y: 115.3; scale-y: -10000; }
        frame 50 { x: 60.3; y: -15.6; skew-x: 116.3; skew-y: 116.6; scale-x: 0.75; }
        frame 51 { x: 60.6; y: -15.4; skew-x: 117.8; skew-y: 118; scale-x: 0.751; scale-y: 0.75; }
        frame 52 { x: 51.5; y: -13.4; skew-x: 101.3; skew-y: 101.5; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 42; y: -11.2; skew-x: 85; skew-y: 85.2; scale-x: 0.752; scale-y: 0.751; }
        frame 54 { x: 32; y: -8.7; skew-x: 68.5; skew-y: 68.7; scale-x: -10000; scale-y: 0.752; }
        frame 55 { x: 26.2; y: -1.8; skew-x: 51.9; skew-y: 52.1; scale-y: -10000; }
        frame 56 { x: 20.2; y: 5.5; skew-x: 35.6; skew-y: 35.6; scale-x: 0.753; scale-y: 0.753; }
        frame 57 { x: 14; y: 13.5; skew-x: 19.1; skew-y: 19.1; scale-x: 0.755; scale-y: 0.755; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 14.5; y: 12; skew-x: 23.3; skew-y: 23.3; scale-x: 0.754; scale-y: 0.754; }
        frame 60 { x: 15; y: 10.5; skew-x: 27.6; skew-y: 27.6; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 14.8; y: 11.9; skew-x: 24.3; skew-y: 24.3; scale-x: 0.753; scale-y: 0.753; }
        frame 62 { x: 14.7; y: 13.5; skew-x: 21.3; skew-y: 21.3; scale-x: 0.754; scale-y: 0.754; }
        frame 63 { x: 14.5; y: 15; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 14.4; y: 16.5; skew-x: 14.8; skew-y: 14.8; }
        frame 65 { x: 14.2; y: 18; skew-x: 11.8; skew-y: 11.8; }
        frame 66 { x: 14; y: 19.6; skew-x: 8.5; skew-y: 8.5; scale-x: 0.755; scale-y: 0.755; }
        frame 67 { x: 13.8; y: 21.1; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 13.3; y: 21.9; skew-x: -0.4; skew-y: -0.4; }
        frame 69 { x: 12.7; y: 22.8; skew-x: -6.4; skew-y: -6.4; scale-x: 0.754; scale-y: 0.754; }
        frame 70 { x: 12.8; y: 21.5; skew-x: -2.7; skew-y: -2.7; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 13; y: 20; skew-x: 0.8; skew-y: 0.8; scale-x: 0.755; scale-y: 0.755; }
        frame 72 { x: 13.2; y: 18.7; skew-x: 4.3; skew-y: 4.3; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 13.3; y: 17.3; skew-x: 8; skew-y: 8; }
        frame 74 { x: 13.6; y: 16; skew-x: 11.6; skew-y: 11.6; }
        frame 75 { x: 13.7; y: 14.7; skew-x: 15.3; skew-y: 15.3; }
        frame 76 { x: 14; y: 13.5; skew-x: 19.1; skew-y: 19.1; }
    }
    Track {
        source-name: "Cornpult_stalk3";
        frame-count: 77;
        frame 0 { x: 2.37631603; y: 1.2630987; skew-x: 37.840842; skew-y: 37.840842; scale-x: 0.605444425; scale-y: 0.605444425; cel: -1; }
        frame 1 { x: 2.37631603; y: 1.2630987; skew-x: 37.840842; skew-y: 37.840842; scale-x: 0.605444425; scale-y: 0.605444425; cel: -10000; }
        frame 2 { x: 2.37631603; y: 1.2630987; skew-x: 37.840842; skew-y: 37.840842; scale-x: 0.605444425; scale-y: 0.605444425;  }
        frame 3 { x: 2.37631603; y: 1.2630987; skew-x: 37.840842; skew-y: 37.840842; scale-x: 0.605444425; scale-y: 0.605444425;  }
        frame 4 { x: 2.37631603; y: 1.2630987; skew-x: 37.840842; skew-y: 37.840842; scale-x: 0.605444425; scale-y: 0.605444425;  }
        frame 5 { x: 12.18502666; y: 24.20833180; skew-x: -99.78516574; skew-y: -99.53888462; scale-x: 0.43382533; scale-y: 1.78322359; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK3; }
        frame 6 { x: 11.86508952; y: 22.38171646; skew-x: -95.00343328; skew-y: -94.84854934; scale-x: 0.42667177; scale-y: 1.73460005; cel: -10000; image: none; }
        frame 7 { x: 11.61048226; y: 20.53762120; skew-x: -90.31421267; skew-y: -90.14716629; scale-x: 0.41978132; scale-y: 1.70909200; }
        frame 8 { x: 12.04734042; y: 22.14984926; skew-x: -92.14155785; skew-y: -92.22289339; scale-x: 0.42194422; scale-y: 1.66720536; }
        frame 9 { x: 12.38988177; y: 23.76993233; skew-x: -94.36989036; skew-y: -94.65907564; scale-x: 0.42416249; scale-y: 1.63449384; }
        frame 10 { x: 12.78948088; y: 25.23375689; skew-x: -96.37316003; skew-y: -96.79932863; scale-x: 0.42501313; scale-y: 1.61096386; }
        frame 11 { x: 13.20419572; y: 26.78347015; skew-x: -98.86173842; skew-y: -99.34302733; scale-x: 0.42345419; scale-y: 1.59443705; }
        frame 12 { x: 13.52361255; y: 28.33776633; skew-x: -101.08763829; skew-y: -101.54803545; scale-x: 0.42449252; scale-y: 1.60237215; }
        frame 13 { x: 13.87906261; y: 29.86183576; skew-x: -103.71208315; skew-y: -104.08123406; scale-x: 0.42329233; scale-y: 1.61549877; }
        frame 14 { x: 14.18861303; y: 31.38864710; skew-x: -106.31404265; skew-y: -106.52446697; scale-x: 0.42268487; scale-y: 1.64433725; }
        frame 15 { x: 14.34043282; y: 32.24310847; skew-x: -110.85100325; skew-y: -110.61447052; scale-x: 0.42007872; scale-y: 1.72469072; }
        frame 16 { x: 14.47312172; y: 33.26380259; skew-x: -115.03542792; skew-y: -114.33692733; scale-x: 0.41623742; scale-y: 1.80665328; }
        frame 17 { x: 14.15397148; y: 31.96567382; skew-x: -113.04021026; skew-y: -112.45375326; scale-x: 0.41736705; scale-y: 1.78731680; }
        frame 18 { x: 13.70512846; y: 30.72046565; skew-x: -110.82164506; skew-y: -110.36696917; scale-x: 0.42334261; scale-y: 1.78437974; }
        frame 19 { x: 13.36371851; y: 29.53682517; skew-x: -108.78662823; skew-y: -108.43521886; scale-x: 0.42653850; scale-y: 1.77562608; }
        frame 20 { x: 13.12439457; y: 28.32354558; skew-x: -106.73790510; skew-y: -106.45943645; scale-x: 0.42789041; scale-y: 1.76566537; }
        frame 21 { x: 12.71866442; y: 27.01356139; skew-x: -104.39039821; skew-y: -104.15191588; scale-x: 0.43130750; scale-y: 1.77120824; }
        frame 22 { x: 12.44236178; y: 25.78935010; skew-x: -102.42742683; skew-y: -102.19579519; scale-x: 0.43317826; scale-y: 1.77742226; }
        frame 23 { x: 12.18502666; y: 24.20833180; skew-x: -99.78516574; skew-y: -99.53888462; scale-x: 0.43382533; scale-y: 1.78322359; }
        frame 24 { x: 12.18502666; y: 24.20833180; skew-x: -99.78516574; skew-y: -99.53888462; scale-x: 0.43382533; scale-y: 1.78322359; }
        frame 25 { x: 12.24287633; y: 28.22325753; skew-x: -107.60956440; skew-y: -108.23921873; scale-x: 0.44282515; scale-y: 1.63787388; }
        frame 26 { x: 12.55692432; y: 32.08143025; skew-x: -116.72833402; skew-y: -117.89057775; scale-x: 0.44787638; scale-y: 1.55410916; }
        frame 27 { x: 12.75760159; y: 35.98889732; skew-x: -125.96092251; skew-y: -127.24619095; scale-x: 0.45643746; scale-y: 1.56074442; }
        frame 28 { x: 13.10261273; y: 39.62115550; skew-x: -134.81916943; skew-y: -135.84637283; scale-x: 0.45968182; scale-y: 1.62103060; }
        frame 29 { x: 13.37356508; y: 43.00867077; skew-x: -143.81072715; skew-y: -144.28282732; scale-x: 0.45570359; scale-y: 1.71776536; }
        frame 30 { x: 12.97638876; y: 43.02153336; skew-x: -139.72502126; skew-y: -140.19876309; scale-x: 0.45456942; scale-y: 1.71315148; }
        frame 31 { x: 12.72583845; y: 42.80955085; skew-x: -137.61591905; skew-y: -137.88846156; scale-x: 0.44998610; scale-y: 1.73748589; }
        frame 32 { x: 8.34051710; y: 31.33859940; skew-x: -119.86818777; skew-y: -119.30643925; scale-x: 0.41506128; scale-y: 1.77216706; }
        frame 33 { x: 10.42539343; y: 12.18998902; skew-x: -88.19228302; skew-y: -87.46815360; scale-x: 0.39216251; scale-y: 1.70740700; }
        frame 34 { x: 23.08817203; y: -10.25044834; skew-x: -42.95340848; skew-y: -42.11690805; scale-x: 0.42135478; scale-y: 1.85942147; }
        frame 35 { x: 48.01456735; y: -17.64738842; skew-x: -3.08193779; skew-y: -2.87418717; scale-x: 0.39397833; scale-y: 1.61192927; }
        frame 36 { x: 51.15883912; y: -18.20286428; skew-x: 3.07529926; skew-y: 3.44341712; scale-x: 0.39442018; scale-y: 1.64523017; }
        frame 37 { x: 54.40260139; y: -18.88308379; skew-x: 8.45854758; skew-y: 9.26676724; scale-x: 0.39162381; scale-y: 1.72236501; }
        frame 38 { x: 53.53622467; y: -18.70097534; skew-x: 7.54460444; skew-y: 8.28911546; scale-x: 0.39164114; scale-y: 1.70931665; }
        frame 39 { x: 52.73753699; y: -18.60567000; skew-x: 6.64122572; skew-y: 7.23611958; scale-x: 0.39466306; scale-y: 1.69180615; }
        frame 40 { x: 51.80906305; y: -18.48602003; skew-x: 5.22714437; skew-y: 5.69975922; scale-x: 0.39689522; scale-y: 1.67652184; }
        frame 41 { x: 50.90983606; y: -18.37799215; skew-x: 3.95991341; skew-y: 4.33934467; scale-x: 0.39870932; scale-y: 1.66538961; }
        frame 42 { x: 50.02557751; y: -18.25733394; skew-x: 2.52056984; skew-y: 2.83669357; scale-x: 0.39893722; scale-y: 1.65367930; }
        frame 43 { x: 49.01330739; y: -18.15566630; skew-x: 1.18996289; skew-y: 1.42644315; scale-x: 0.40241370; scale-y: 1.65215412; }
        frame 44 { x: 48.13638833; y: -17.97495631; skew-x: -0.03911796; skew-y: 0.14779223; scale-x: 0.40401497; scale-y: 1.64884530; }
        frame 45 { x: 48.45230501; y: -18.05719479; skew-x: 0.39134438; skew-y: 0.59871544; scale-x: 0.40387731; scale-y: 1.65235448; }
        frame 46 { x: 49.02844825; y: -18.05429163; skew-x: 1.07433651; skew-y: 1.35452612; scale-x: 0.40078721; scale-y: 1.65416865; }
        frame 47 { x: 49.47655194; y: -18.04982708; skew-x: 1.51429784; skew-y: 1.87894991; scale-x: 0.39789300; scale-y: 1.65902339; }
        frame 48 { x: 50.03074408; y: -18.14973025; skew-x: 2.01510291; skew-y: 2.47206883; scale-x: 0.39558321; scale-y: 1.66783428; }
        frame 49 { x: 50.48190501; y: -18.25718392; skew-x: 2.51725752; skew-y: 3.06691171; scale-x: 0.39349806; scale-y: 1.67765650; }
        frame 50 { x: 50.92525398; y: -18.26068848; skew-x: 3.06901586; skew-y: 3.68076508; scale-x: 0.39266671; scale-y: 1.68666420; }
        frame 51 { x: 51.34047365; y: -18.34853943; skew-x: 3.78135885; skew-y: 4.33261080; scale-x: 0.39431944; scale-y: 1.68148164; }
        frame 52 { x: 41.03737955; y: -13.95263087; skew-x: -10.29488628; skew-y: -12.15627458; scale-x: 0.43094815; scale-y: 1.37640615; }
        frame 53 { x: 31.11925965; y: -9.04304795; skew-x: -30.43629993; skew-y: -32.80912249; scale-x: 0.45441671; scale-y: 1.36723372; }
        frame 54 { x: 21.85545047; y: -4.37166705; skew-x: -46.24958918; skew-y: -47.57813662; scale-x: 0.46207277; scale-y: 1.57189084; }
        frame 55 { x: 18.37273998; y: 5.21367278; skew-x: -61.58772582; skew-y: -63.82665481; scale-x: 0.45091355; scale-y: 1.37794740; }
        frame 56 { x: 15.41676504; y: 14.66447848; skew-x: -81.80175610; skew-y: -83.52944941; scale-x: 0.43907302; scale-y: 1.42461913; }
        frame 57 { x: 12.18502666; y: 24.20833180; skew-x: -99.78516574; skew-y: -99.53888462; scale-x: 0.43382533; scale-y: 1.78322359; }
        frame 58 { x: 12.18502666; y: 24.20833180; skew-x: -99.78516574; skew-y: -99.53888462; scale-x: 0.43382533; scale-y: 1.78322359; }
        frame 59 { x: 11.86508952; y: 22.38171646; skew-x: -95.00343328; skew-y: -94.84854934; scale-x: 0.42667177; scale-y: 1.73460005; }
        frame 60 { x: 11.61048226; y: 20.53762120; skew-x: -90.31421267; skew-y: -90.14716629; scale-x: 0.41978132; scale-y: 1.70909200; }
        frame 61 { x: 12.04734042; y: 22.14984926; skew-x: -92.14155785; skew-y: -92.22289339; scale-x: 0.42194422; scale-y: 1.66720536; }
        frame 62 { x: 12.38988177; y: 23.76993233; skew-x: -94.36989036; skew-y: -94.65907564; scale-x: 0.42416249; scale-y: 1.63449384; }
        frame 63 { x: 12.78948088; y: 25.23375689; skew-x: -96.37316003; skew-y: -96.79932863; scale-x: 0.42501313; scale-y: 1.61096386; }
        frame 64 { x: 13.20419572; y: 26.78347015; skew-x: -98.86173842; skew-y: -99.34302733; scale-x: 0.42345419; scale-y: 1.59443705; }
        frame 65 { x: 13.52361255; y: 28.33776633; skew-x: -101.08763829; skew-y: -101.54803545; scale-x: 0.42449252; scale-y: 1.60237215; }
        frame 66 { x: 13.87906261; y: 29.86183576; skew-x: -103.71208315; skew-y: -104.08123406; scale-x: 0.42329233; scale-y: 1.61549877; }
        frame 67 { x: 14.18861303; y: 31.38864710; skew-x: -106.31404265; skew-y: -106.52446697; scale-x: 0.42268487; scale-y: 1.64433725; }
        frame 68 { x: 14.34043282; y: 32.24310847; skew-x: -110.85100325; skew-y: -110.61447052; scale-x: 0.42007872; scale-y: 1.72469072; }
        frame 69 { x: 14.47312172; y: 33.26380259; skew-x: -115.03542792; skew-y: -114.33692733; scale-x: 0.41623742; scale-y: 1.80665328; }
        frame 70 { x: 14.15397148; y: 31.96567382; skew-x: -113.04021026; skew-y: -112.45375326; scale-x: 0.41736705; scale-y: 1.78731680; }
        frame 71 { x: 13.70512846; y: 30.72046565; skew-x: -110.82164506; skew-y: -110.36696917; scale-x: 0.42334261; scale-y: 1.78437974; }
        frame 72 { x: 13.36371851; y: 29.53682517; skew-x: -108.78662823; skew-y: -108.43521886; scale-x: 0.42653850; scale-y: 1.77562608; }
        frame 73 { x: 13.12439457; y: 28.32354558; skew-x: -106.73790510; skew-y: -106.45943645; scale-x: 0.42789041; scale-y: 1.76566537; }
        frame 74 { x: 12.71866442; y: 27.01356139; skew-x: -104.39039821; skew-y: -104.15191588; scale-x: 0.43130750; scale-y: 1.77120824; }
        frame 75 { x: 12.44236178; y: 25.78935010; skew-x: -102.42742683; skew-y: -102.19579519; scale-x: 0.43317826; scale-y: 1.77742226; }
        frame 76 { x: 12.18502666; y: 24.20833180; skew-x: -99.78516574; skew-y: -99.53888462; scale-x: 0.43382533; scale-y: 1.78322359; }
    }
    Track {
        source-name: "Cornpult_eyebrow1";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 38.7; y: 42; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_EYEBROW; }
        frame 6 { x: 38.3; y: 43; skew-x: -8.9; skew-y: -8.9; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 38; y: 44; skew-x: -18.2; skew-y: -18.2; }
        frame 8 { x: -10000; y: 44.3; skew-x: -17.7; skew-y: -17.7; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 38.1; y: 44.6; skew-x: -17.2; skew-y: -17.2; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 38; y: 45; skew-x: -16.7; skew-y: -16.7; }
        frame 11 { x: 38.1; y: 45.2; skew-x: -16.2; skew-y: -16.2; }
        frame 12 { x: -10000; y: 45.5; skew-x: -15.7; skew-y: -15.7; }
        frame 13 { y: 45.7; skew-x: -15.2; skew-y: -15.2; }
        frame 14 { y: 46.1; skew-x: -14.9; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 38.6; y: 44.9; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 16 { x: 39.4; y: 44; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: 39.3; y: 43.6; skew-x: 2.8; skew-y: 2.8; }
        frame 18 { x: 39.1; y: 43.4; skew-x: 2.3; skew-y: 2.3; scale-x: 0.8; scale-y: 0.8; }
        frame 19 { x: 39; y: 43.1; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 20 { y: 42.9; skew-x: 1.3; skew-y: 1.3; }
        frame 21 { x: 38.9; y: 42.5; skew-x: 0.8; skew-y: 0.8; }
        frame 22 { x: 38.8; y: 42.4; skew-x: 0.3; skew-y: 0.3; }
        frame 23 { x: 38.7; y: 42; skew-x: 0; skew-y: 0; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 38; y: 42; skew-x: -2.4; skew-y: -2.4; }
        frame 26 { x: 37.1; y: 41.9; skew-x: -4.9; skew-y: -4.9; }
        frame 27 { x: 36.4; y: 41.8; skew-x: -7.4; skew-y: -7.4; scale-x: 0.799; scale-y: 0.799; }
        frame 28 { x: 35.5; y: 41.7; skew-x: -9.9; skew-y: -9.9; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 34.9; y: 41.6; skew-x: -12.4; skew-y: -12.4; }
        frame 30 { x: 36.5; y: 40.5; skew-x: -0.9; skew-y: -0.9; }
        frame 31 { x: 38.3; y: 39.5; skew-x: 10.3; skew-y: 10.3; scale-x: 0.798; scale-y: 0.798; }
        frame 32 { x: 40.4; y: 40; skew-x: 14.8; skew-y: 17.5; scale-x: 0.79; scale-y: 0.809; }
        frame 33 { x: 42.6; y: 40.6; skew-x: 19.3; skew-y: 24.6; scale-x: 0.782; scale-y: 0.82; }
        frame 34 { x: 44.7; y: 41.3; skew-x: 23.8; skew-y: 31.8; scale-x: 0.774; scale-y: 0.831; }
        frame 35 { x: 46.9; y: 42; skew-x: 28.3; skew-y: 39.1; scale-x: 0.768; scale-y: 0.844; }
        frame 36 { x: 47.2; y: 42.2; skew-x: 32.1; skew-y: 42.9; scale-x: 0.766; scale-y: 0.842; }
        frame 37 { x: 47.6; y: 42.4; skew-x: 35.8; skew-y: 46.7; scale-x: 0.767; scale-y: 0.844; }
        frame 38 { x: 47.3; y: -10000; skew-x: -10000; skew-y: 46.6; scale-x: 0.766; scale-y: 0.842; }
        frame 39 { x: 47; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 46.7; skew-y: 46.7; scale-x: 0.767; scale-y: 0.844; }
        frame 41 { x: 46.9; y: 42.3; skew-y: 46.6; scale-x: 0.766; scale-y: 0.842; }
        frame 42 { x: 47.1; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 47.4; }
        frame 44 { x: 47.6; y: 42.4; skew-y: 46.7; scale-x: 0.767; scale-y: 0.844; }
        frame 45 { x: 46.8; y: 42.3; skew-x: 33.1; skew-y: 43.1; scale-x: 0.769; scale-y: 0.839; }
        frame 46 { x: 46.1; y: 42.1; skew-x: 30.3; skew-y: 39.4; scale-x: 0.771; scale-y: 0.836; }
        frame 47 { x: 45.4; y: 42; skew-x: 27.5; skew-y: 35.9; scale-x: 0.774; scale-y: 0.832; }
        frame 48 { x: 44.7; skew-x: 24.8; skew-y: 32.3; scale-x: 0.776; scale-y: 0.829; }
        frame 49 { x: 44; y: 41.9; skew-x: 22; skew-y: 28.6; scale-x: 0.779; scale-y: 0.826; }
        frame 50 { x: 43.4; y: -10000; skew-x: 19.3; skew-y: 25.1; scale-x: 0.782; scale-y: 0.822; }
        frame 51 { x: 42.6; y: 41.8; skew-x: 16.5; skew-y: 21.5; scale-x: 0.784; scale-y: 0.819; }
        frame 52 { x: 42; y: -10000; skew-x: 13.8; skew-y: 17.8; scale-x: 0.787; scale-y: 0.816; }
        frame 53 { x: 41.3; y: 41.9; skew-x: 11; skew-y: 14.3; scale-x: 0.789; scale-y: 0.813; }
        frame 54 { x: 40.6; y: -10000; skew-x: 8.3; skew-y: 10.8; scale-x: 0.792; scale-y: 0.81; }
        frame 55 { x: 40; y: 42; skew-x: 5.5; skew-y: 7; scale-x: 0.795; scale-y: 0.806; }
        frame 56 { x: 39.5; skew-x: 2.7; skew-y: 3.5; scale-x: 0.797; scale-y: 0.803; }
        frame 57 { x: 38.7; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 38.3; y: 43; skew-x: -8.9; skew-y: -8.9; }
        frame 60 { x: 38; y: 44; skew-x: -18.2; skew-y: -18.2; }
        frame 61 { x: -10000; y: 44.3; skew-x: -17.7; skew-y: -17.7; scale-x: 0.799; scale-y: 0.799; }
        frame 62 { x: 38.1; y: 44.6; skew-x: -17.2; skew-y: -17.2; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 38; y: 45; skew-x: -16.7; skew-y: -16.7; }
        frame 64 { x: 38.1; y: 45.2; skew-x: -16.2; skew-y: -16.2; }
        frame 65 { x: -10000; y: 45.5; skew-x: -15.7; skew-y: -15.7; }
        frame 66 { y: 45.7; skew-x: -15.2; skew-y: -15.2; }
        frame 67 { y: 46.1; skew-x: -14.9; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: 38.6; y: 44.9; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 69 { x: 39.4; y: 44; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 39.3; y: 43.6; skew-x: 2.8; skew-y: 2.8; }
        frame 71 { x: 39.1; y: 43.4; skew-x: 2.3; skew-y: 2.3; scale-x: 0.8; scale-y: 0.8; }
        frame 72 { x: 39; y: 43.1; skew-x: 1.8; skew-y: 1.8; scale-x: -10000; scale-y: -10000; }
        frame 73 { y: 42.9; skew-x: 1.3; skew-y: 1.3; }
        frame 74 { x: 38.9; y: 42.5; skew-x: 0.8; skew-y: 0.8; }
        frame 75 { x: 38.8; y: 42.4; skew-x: 0.3; skew-y: 0.3; }
        frame 76 { x: 38.7; y: 42; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "Cornpult_eyebrow2";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 64.7; y: 42.1; skew-x: 180; scale-x: 0.621; scale-y: 0.621; cel: 0; image: IMAGE_REANIM_CORNPULT_EYEBROW; }
        frame 6 { x: 65; y: 42.8; skew-x: 189; skew-y: 9; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 65.2; y: 43.4; skew-x: 198.3; skew-y: 18.3; }
        frame 8 { x: 65.1; y: 43.8; skew-x: 197.8; skew-y: 17.8; scale-x: 0.62; scale-y: 0.62; }
        frame 9 { x: 65.2; y: 44; skew-x: 197.3; skew-y: 17.3; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 65.1; y: 44.4; skew-x: 196.8; skew-y: 16.8; }
        frame 11 { x: -10000; y: 44.8; skew-x: 196.3; skew-y: 16.3; }
        frame 12 { y: 45.1; skew-x: 195.8; skew-y: 15.8; }
        frame 13 { y: 45.4; skew-x: 195.3; skew-y: 15.3; }
        frame 14 { y: 45.8; skew-x: 195; skew-y: 15; scale-x: 0.621; scale-y: 0.621; }
        frame 15 { x: 65; y: 45.1; skew-x: 185.8; skew-y: 5.8; scale-x: 0.62; scale-y: 0.62; }
        frame 16 { x: 64.8; y: 44.5; skew-x: 176.5; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 17 { x: -10000; y: 44.1; skew-x: 177.2; skew-y: -2.7; }
        frame 18 { y: 43.8; skew-x: 177.7; skew-y: -2.2; scale-x: 0.621; scale-y: 0.621; }
        frame 19 { y: 43.5; skew-x: 178.2; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 64.7; y: 43.1; skew-x: 178.7; skew-y: -1.2; }
        frame 21 { x: -10000; y: 42.8; skew-x: 179.2; skew-y: -0.7; }
        frame 22 { x: 64.6; y: 42.5; skew-x: 179.7; skew-y: -0.2; }
        frame 23 { x: 64.7; y: 42.1; skew-x: 180; skew-y: 0; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 64.3; y: 41.8; skew-x: 181.8; skew-y: 1.8; }
        frame 26 { x: 63.9; y: 41.5; skew-x: 183.8; skew-y: 3.8; }
        frame 27 { x: 63.4; y: 41.1; skew-x: 185.8; skew-y: 5.8; scale-x: 0.62; scale-y: 0.62; }
        frame 28 { x: 62.9; y: 40.9; skew-x: 187.8; skew-y: 7.8; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 62.5; y: 40.5; skew-x: 189.8; skew-y: 9.8; scale-x: 0.621; scale-y: 0.621; }
        frame 30 { x: 62.7; y: 40.1; skew-x: 179.7; skew-y: -0.2; scale-x: 0.62; scale-y: 0.62; }
        frame 31 { x: 62.6; y: 39.7; skew-x: 169.2; skew-y: -10.7; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 63.3; y: 40.4; skew-x: 165; skew-y: -12; scale-x: 0.625; scale-y: 0.617; }
        frame 33 { x: 64; y: 41; skew-x: 160.7; skew-y: -13.4; scale-x: 0.631; scale-y: 0.614; }
        frame 34 { x: 64.6; y: 41.6; skew-x: 156.2; skew-y: -14.9; scale-x: 0.637; scale-y: 0.611; }
        frame 35 { x: 65.2; y: 42.1; skew-x: 151.8; skew-y: -16.4; scale-x: 0.644; scale-y: 0.608; }
        frame 36 { x: 64.3; y: 42.4; skew-x: 145.6; skew-y: -22.5; scale-x: 0.642; scale-y: -10000; }
        frame 37 { x: 63.5; y: 42.6; skew-x: 139.3; skew-y: -28.9; scale-x: 0.643; }
        frame 38 { x: 63.1; y: -10000; skew-x: 139.4; skew-y: -28.8; scale-x: 0.642; scale-y: 0.607; }
        frame 39 { x: 62.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 62.5; skew-x: 139.3; skew-y: -28.9; scale-x: 0.643; scale-y: 0.608; }
        frame 41 { x: 62.8; skew-x: 139.4; skew-y: -28.8; scale-x: 0.642; scale-y: 0.607; }
        frame 42 { x: 63; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 63.2; }
        frame 44 { x: 63.5; skew-x: 139.3; skew-y: -28.9; scale-x: 0.643; scale-y: 0.608; }
        frame 45 { x: 63.6; y: 42.5; skew-x: 142.4; skew-y: -26.7; scale-x: 0.64; scale-y: -10000; }
        frame 46 { x: 63.8; y: 42.4; skew-x: 145.6; skew-y: -24.4; scale-x: 0.639; scale-y: 0.609; }
        frame 47 { x: 63.9; y: -10000; skew-x: 148.7; skew-y: -22.2; scale-x: 0.637; scale-y: 0.61; }
        frame 48 { x: 64.2; y: 42.3; skew-x: 151.9; skew-y: -19.9; scale-x: 0.635; scale-y: 0.611; }
        frame 49 { x: -10000; y: -10000; skew-x: 155; skew-y: -17.7; scale-x: 0.634; scale-y: 0.612; }
        frame 50 { x: 64.3; skew-x: 158.2; skew-y: -15.4; scale-x: 0.632; scale-y: 0.613; }
        frame 51 { x: 64.5; skew-x: 161.2; skew-y: -13.2; scale-x: 0.631; scale-y: 0.614; }
        frame 52 { x: 64.6; y: 42.2; skew-x: 164.4; skew-y: -10.9; scale-x: 0.629; scale-y: 0.616; }
        frame 53 { x: 64.7; y: 42.1; skew-x: 167.5; skew-y: -8.7; scale-x: 0.627; scale-y: 0.617; }
        frame 54 { x: -10000; y: -10000; skew-x: 170.7; skew-y: -6.5; scale-x: 0.626; scale-y: 0.618; }
        frame 55 { x: 64.8; skew-x: 173.7; skew-y: -4.2; scale-x: 0.624; scale-y: 0.619; }
        frame 56 { x: -10000; skew-x: 177; skew-y: -2; scale-x: 0.622; scale-y: 0.62; }
        frame 57 { x: 64.7; skew-x: 180; skew-y: 0; scale-x: 0.621; scale-y: 0.621; }
        frame 58 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 65; y: 42.8; skew-x: 189; skew-y: 9; }
        frame 60 { x: 65.2; y: 43.4; skew-x: 198.3; skew-y: 18.3; }
        frame 61 { x: 65.1; y: 43.8; skew-x: 197.8; skew-y: 17.8; scale-x: 0.62; scale-y: 0.62; }
        frame 62 { x: 65.2; y: 44; skew-x: 197.3; skew-y: 17.3; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 65.1; y: 44.4; skew-x: 196.8; skew-y: 16.8; }
        frame 64 { x: -10000; y: 44.8; skew-x: 196.3; skew-y: 16.3; }
        frame 65 { y: 45.1; skew-x: 195.8; skew-y: 15.8; }
        frame 66 { y: 45.4; skew-x: 195.3; skew-y: 15.3; }
        frame 67 { y: 45.8; skew-x: 195; skew-y: 15; scale-x: 0.621; scale-y: 0.621; }
        frame 68 { x: 65; y: 45.1; skew-x: 185.8; skew-y: 5.8; scale-x: 0.62; scale-y: 0.62; }
        frame 69 { x: 64.8; y: 44.5; skew-x: 176.5; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: -10000; y: 44.1; skew-x: 177.2; skew-y: -2.7; }
        frame 71 { y: 43.8; skew-x: 177.7; skew-y: -2.2; scale-x: 0.621; scale-y: 0.621; }
        frame 72 { y: 43.5; skew-x: 178.2; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 64.7; y: 43.1; skew-x: 178.7; skew-y: -1.2; }
        frame 74 { x: -10000; y: 42.8; skew-x: 179.2; skew-y: -0.7; }
        frame 75 { x: 64.6; y: 42.5; skew-x: 179.7; skew-y: -0.2; }
        frame 76 { x: 64.7; y: 42.1; skew-x: 180; skew-y: 0; }
    }
}
