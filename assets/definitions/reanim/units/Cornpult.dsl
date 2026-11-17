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
        frame 5 { x: 38.2879991; y: 11.2425653; skew-x: 1.3583216; skew-y: 1.3583216; scale-x: 0.679971791; scale-y: 0.679971791; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK1; }
        frame 6 { x: 38.2718128; y: 11.5749938; skew-x: 1.501662; skew-y: 1.501662; scale-x: 0.677849894; scale-y: 0.677849894; cel: -10000; image: none; }
        frame 7 { x: 38.3248011; y: 11.8360467; skew-x: 1.57610268; skew-y: 1.57610268; scale-x: 0.675329994; scale-y: 0.675329994;  }
        frame 8 { x: 38.2795746; y: 12.2528693; skew-x: 0.941199965; skew-y: 0.941199965; scale-x: 0.676463249; scale-y: 0.676463249;  }
        frame 9 { x: 38.2352204; y: 12.5782171; skew-x: 0.734415169; skew-y: 0.734415169; scale-x: 0.674063933; scale-y: 0.674063933;  }
        frame 10 { x: 38.1234062; y: 12.8823879; skew-x: 0.399467835; skew-y: 0.399467835; scale-x: 0.678760961; scale-y: 0.678760961;  }
        frame 11 { x: 38.0115565; y: 13.2140358; skew-x: 0.0640706439; skew-y: 0.0640706439; scale-x: 0.675266083; scale-y: 0.675266083;  }
        frame 12 { x: 37.9795428; y: 13.6974457; skew-x: -0.545086333; skew-y: -0.545086333; scale-x: 0.677432959; scale-y: 0.677432959;  }
        frame 13 { x: 37.893764; y: 14.0087182; skew-x: -1.07498932; skew-y: -1.07498932; scale-x: 0.677053055; scale-y: 0.677053055;  }
        frame 14 { x: 37.8384131; y: 14.3734223; skew-x: -1.76089773; skew-y: -1.76089773; scale-x: 0.676668791; scale-y: 0.676668791;  }
        frame 15 { x: 37.8045893; y: 14.1096527; skew-x: -1.97092834; skew-y: -1.97092834; scale-x: 0.676384283; scale-y: 0.676384283;  }
        frame 16 { x: 37.7101517; y: 13.8597651; skew-x: -2.13762494; skew-y: -2.13762494; scale-x: 0.681387495; scale-y: 0.681387495;  }
        frame 17 { x: 37.7500262; y: 13.4698146; skew-x: -1.49307718; skew-y: -1.49307718; scale-x: 0.679108329; scale-y: 0.679108329;  }
        frame 18 { x: 37.8221602; y: 13.0626121; skew-x: -1.34605558; skew-y: -1.34605558; scale-x: 0.682919166; scale-y: 0.682919166;  }
        frame 19 { x: 37.9528956; y: 12.7294168; skew-x: -0.775112472; skew-y: -0.775112472; scale-x: 0.678589205; scale-y: 0.678589205;  }
        frame 20 { x: 38.0277433; y: 12.3224441; skew-x: -0.077615782; skew-y: -0.077615782; scale-x: 0.67878025; scale-y: 0.67878025;  }
        frame 21 { x: 38.0955762; y: 11.977422; skew-x: 0.477259474; skew-y: 0.477259474; scale-x: 0.680938835; scale-y: 0.680938835;  }
        frame 22 { x: 38.0878131; y: 11.6270405; skew-x: 0.530338062; skew-y: 0.530338062; scale-x: 0.681669558; scale-y: 0.681669558;  }
        frame 23 { x: 38.2879991; y: 11.2425653; skew-x: 1.3583216; skew-y: 1.3583216; scale-x: 0.679971791; scale-y: 0.679971791;  }
        frame 24 { x: 38.2879991; y: 11.2425653; skew-x: 1.3583216; skew-y: 1.3583216; scale-x: 0.679971791; scale-y: 0.679971791;  }
        frame 25 { x: 35.7058086; y: 12.2866538; skew-x: -4.47066811; skew-y: -4.47066811; scale-x: 0.671257895; scale-y: 0.671257895;  }
        frame 26 { x: 33.1084662; y: 13.3478071; skew-x: -10.6600953; skew-y: -10.6600953; scale-x: 0.657876951; scale-y: 0.657876951;  }
        frame 27 { x: 30.6285629; y: 14.522646; skew-x: -17.1396563; skew-y: -17.1396563; scale-x: 0.649942592; scale-y: 0.649942592;  }
        frame 28 { x: 28.0687442; y: 15.6700926; skew-x: -23.9308466; skew-y: -23.9308466; scale-x: 0.643585958; scale-y: 0.643585958;  }
        frame 29 { x: 25.653899; y: 16.9199829; skew-x: -30.6565846; skew-y: -30.6565846; scale-x: 0.639600405; scale-y: 0.639600405;  }
        frame 30 { x: 25.8690581; y: 16.9813168; skew-x: -32.7445291; skew-y: -32.7445291; scale-x: 0.71116489; scale-y: 0.71116489;  }
        frame 31 { x: 26.0867811; y: 17.0745233; skew-x: -35.9012472; skew-y: -35.9012472; scale-x: 0.779526132; scale-y: 0.779526132;  }
        frame 32 { x: 31.5426785; y: 13.1522517; skew-x: -16.6026758; skew-y: -16.6026758; scale-x: 0.770531374; scale-y: 0.770531374;  }
        frame 33 { x: 38.2951842; y: 9.68233222; skew-x: 3.55418782; skew-y: 3.55418782; scale-x: 0.754329703; scale-y: 0.754329703;  }
        frame 34 { x: 45.7325016; y: 7.66958667; skew-x: 27.3623165; skew-y: 27.3623165; scale-x: 0.721941745; scale-y: 0.721941745;  }
        frame 35 { x: 53.4261387; y: 7.52262335; skew-x: 48.636182; skew-y: 48.636182; scale-x: 0.716007865; scale-y: 0.716007865;  }
        frame 36 { x: 54.2319092; y: 7.42060625; skew-x: 48.0251015; skew-y: 48.0251015; scale-x: 0.719480463; scale-y: 0.719480463;  }
        frame 37 { x: 54.9198777; y: 7.35915581; skew-x: 47.0763696; skew-y: 47.0763696; scale-x: 0.720903813; scale-y: 0.720903813;  }
        frame 38 { x: 54.7604768; y: 7.3997415; skew-x: 47.3328148; skew-y: 47.3328148; scale-x: 0.719149207; scale-y: 0.719149207;  }
        frame 39 { x: 54.5030063; y: 7.43721912; skew-x: 47.9215686; skew-y: 47.9215686; scale-x: 0.718416916; scale-y: 0.718416916;  }
        frame 40 { x: 54.2695332; y: 7.47290154; skew-x: 47.8119215; skew-y: 47.8119215; scale-x: 0.716370809; scale-y: 0.716370809;  }
        frame 41 { x: 54.0866003; y: 7.47249477; skew-x: 48.2764324; skew-y: 48.2764324; scale-x: 0.717362808; scale-y: 0.717362808;  }
        frame 42 { x: 53.8579236; y: 7.45971091; skew-x: 48.1881904; skew-y: 48.1881904; scale-x: 0.713129768; scale-y: 0.713129768;  }
        frame 43 { x: 53.6496287; y: 7.53208076; skew-x: 48.7112095; skew-y: 48.7112095; scale-x: 0.714228312; scale-y: 0.714228312;  }
        frame 44 { x: 53.4261387; y: 7.52262335; skew-x: 48.636182; skew-y: 48.636182; scale-x: 0.716007865; scale-y: 0.716007865;  }
        frame 45 { x: 53.5564322; y: 7.53418248; skew-x: 48.7734007; skew-y: 48.7734007; scale-x: 0.713848792; scale-y: 0.713848792;  }
        frame 46 { x: 53.6506902; y: 7.47420524; skew-x: 48.6816221; skew-y: 48.6816221; scale-x: 0.716088756; scale-y: 0.716088756;  }
        frame 47 { x: 53.706847; y: 7.48943241; skew-x: 48.3419547; skew-y: 48.3419547; scale-x: 0.716013956; scale-y: 0.716013956;  }
        frame 48 { x: 53.8610082; y: 7.50348138; skew-x: 48.1692692; skew-y: 48.1692692; scale-x: 0.714927611; scale-y: 0.714927611;  }
        frame 49 { x: 53.9739621; y: 7.51817242; skew-x: 48.2307739; skew-y: 48.2307739; scale-x: 0.714307465; scale-y: 0.714307465;  }
        frame 50 { x: 54.0362433; y: 7.44811759; skew-x: 47.9416158; skew-y: 47.9416158; scale-x: 0.721759669; scale-y: 0.721759669;  }
        frame 51 { x: 54.1892818; y: 7.48004166; skew-x: 48.2921969; skew-y: 48.2921969; scale-x: 0.717011009; scale-y: 0.717011009;  }
        frame 52 { x: 51.7089563; y: 8.40963581; skew-x: 39.9877592; skew-y: 39.9877592; scale-x: 0.677389884; scale-y: 0.677389884;  }
        frame 53 { x: 49.2603797; y: 8.87316189; skew-x: 31.2104342; skew-y: 31.2104342; scale-x: 0.673127026; scale-y: 0.673127026;  }
        frame 54 { x: 46.3687968; y: 8.08586578; skew-x: 26.6556111; skew-y: 26.6556111; scale-x: 0.715380814; scale-y: 0.715380814;  }
        frame 55 { x: 43.8943598; y: 8.98771819; skew-x: 19.3429311; skew-y: 19.3429311; scale-x: 0.690972784; scale-y: 0.690972784;  }
        frame 56 { x: 41.2701495; y: 9.9550656; skew-x: 11.307339; skew-y: 11.307339; scale-x: 0.681569439; scale-y: 0.681569439;  }
        frame 57 { x: 38.2879991; y: 11.2425653; skew-x: 1.3583216; skew-y: 1.3583216; scale-x: 0.679971791; scale-y: 0.679971791;  }
        frame 58 { x: 38.2879991; y: 11.2425653; skew-x: 1.3583216; skew-y: 1.3583216; scale-x: 0.679971791; scale-y: 0.679971791;  }
        frame 59 { x: 38.2718128; y: 11.5749938; skew-x: 1.501662; skew-y: 1.501662; scale-x: 0.677849894; scale-y: 0.677849894;  }
        frame 60 { x: 38.3248011; y: 11.8360467; skew-x: 1.57610268; skew-y: 1.57610268; scale-x: 0.675329994; scale-y: 0.675329994;  }
        frame 61 { x: 38.2795746; y: 12.2528693; skew-x: 0.941199965; skew-y: 0.941199965; scale-x: 0.676463249; scale-y: 0.676463249;  }
        frame 62 { x: 38.2352204; y: 12.5782171; skew-x: 0.734415169; skew-y: 0.734415169; scale-x: 0.674063933; scale-y: 0.674063933;  }
        frame 63 { x: 38.1234062; y: 12.8823879; skew-x: 0.399467835; skew-y: 0.399467835; scale-x: 0.678760961; scale-y: 0.678760961;  }
        frame 64 { x: 38.0115565; y: 13.2140358; skew-x: 0.0640706439; skew-y: 0.0640706439; scale-x: 0.675266083; scale-y: 0.675266083;  }
        frame 65 { x: 37.9795428; y: 13.6974457; skew-x: -0.545086333; skew-y: -0.545086333; scale-x: 0.677432959; scale-y: 0.677432959;  }
        frame 66 { x: 37.893764; y: 14.0087182; skew-x: -1.07498932; skew-y: -1.07498932; scale-x: 0.677053055; scale-y: 0.677053055;  }
        frame 67 { x: 37.8384131; y: 14.3734223; skew-x: -1.76089773; skew-y: -1.76089773; scale-x: 0.676668791; scale-y: 0.676668791;  }
        frame 68 { x: 37.8045893; y: 14.1096527; skew-x: -1.97092834; skew-y: -1.97092834; scale-x: 0.676384283; scale-y: 0.676384283;  }
        frame 69 { x: 37.7101517; y: 13.8597651; skew-x: -2.13762494; skew-y: -2.13762494; scale-x: 0.681387495; scale-y: 0.681387495;  }
        frame 70 { x: 37.7500262; y: 13.4698146; skew-x: -1.49307718; skew-y: -1.49307718; scale-x: 0.679108329; scale-y: 0.679108329;  }
        frame 71 { x: 37.8221602; y: 13.0626121; skew-x: -1.34605558; skew-y: -1.34605558; scale-x: 0.682919166; scale-y: 0.682919166;  }
        frame 72 { x: 37.9528956; y: 12.7294168; skew-x: -0.775112472; skew-y: -0.775112472; scale-x: 0.678589205; scale-y: 0.678589205;  }
        frame 73 { x: 38.0277433; y: 12.3224441; skew-x: -0.077615782; skew-y: -0.077615782; scale-x: 0.67878025; scale-y: 0.67878025;  }
        frame 74 { x: 38.0955762; y: 11.977422; skew-x: 0.477259474; skew-y: 0.477259474; scale-x: 0.680938835; scale-y: 0.680938835;  }
        frame 75 { x: 38.0878131; y: 11.6270405; skew-x: 0.530338062; skew-y: 0.530338062; scale-x: 0.681669558; scale-y: 0.681669558;  }
        frame 76 { x: 38.2879991; y: 11.2425653; skew-x: 1.3583216; skew-y: 1.3583216; scale-x: 0.679971791; scale-y: 0.679971791;  }
    }
    Track {
        source-name: "Cornpult_stalk2";
        frame-count: 77;
        frame 0 { x: 5.74386978; y: 7.00097545; skew-x: -55.447534; skew-y: -55.447534; scale-x: 0.233597393; scale-y: 0.233597393; cel: -1; }
        frame 1 { x: 5.74386978; y: 7.00097545; skew-x: -55.447534; skew-y: -55.447534; scale-x: 0.233597393; scale-y: 0.233597393; cel: -10000; }
        frame 2 { x: 5.74386978; y: 7.00097545; skew-x: -55.447534; skew-y: -55.447534; scale-x: 0.233597393; scale-y: 0.233597393;  }
        frame 3 { x: 5.74386978; y: 7.00097545; skew-x: -55.447534; skew-y: -55.447534; scale-x: 0.233597393; scale-y: 0.233597393;  }
        frame 4 { x: 5.74386978; y: 7.00097545; skew-x: -55.447534; skew-y: -55.447534; scale-x: 0.233597393; scale-y: 0.233597393;  }
        frame 5 { x: 26.4471968; y: 8.51603272; skew-x: 4.19634252; skew-y: 4.19634252; scale-x: 0.777768839; scale-y: 0.777768839; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK2; }
        frame 6 { x: 26.9207271; y: 8.1931821; skew-x: 7.53866402; skew-y: 7.53866402; scale-x: 0.764246991; scale-y: 0.764246991; cel: -10000; image: none; }
        frame 7 { x: 27.4183924; y: 7.7913879; skew-x: 10.9226945; skew-y: 10.9226945; scale-x: 0.755944745; scale-y: 0.755944745;  }
        frame 8 { x: 27.2244305; y: 8.67920032; skew-x: 8.72238537; skew-y: 8.72238537; scale-x: 0.753347751; scale-y: 0.753347751;  }
        frame 9 { x: 26.9780156; y: 9.48738836; skew-x: 6.40142693; skew-y: 6.40142693; scale-x: 0.753497659; scale-y: 0.753497659;  }
        frame 10 { x: 26.7774845; y: 10.2425473; skew-x: 4.4181767; skew-y: 4.4181767; scale-x: 0.750400912; scale-y: 0.750400912;  }
        frame 11 { x: 26.5211642; y: 11.0864679; skew-x: 2.02504359; skew-y: 2.02504359; scale-x: 0.74922061; scale-y: 0.74922061;  }
        frame 12 { x: 26.3430306; y: 11.9406862; skew-x: 0.24276576; skew-y: 0.24276576; scale-x: 0.75252719; scale-y: 0.75252719;  }
        frame 13 { x: 26.1038485; y: 12.7070269; skew-x: -1.89989021; skew-y: -1.89989021; scale-x: 0.755462199; scale-y: 0.755462199;  }
        frame 14 { x: 25.8664152; y: 13.488851; skew-x: -3.90194134; skew-y: -3.90194134; scale-x: 0.76166898; scale-y: 0.76166898;  }
        frame 15 { x: 25.5131442; y: 13.4051547; skew-x: -4.923659; skew-y: -4.923659; scale-x: 0.778078181; scale-y: 0.778078181;  }
        frame 16 { x: 25.0689949; y: 13.3880215; skew-x: -6.08673917; skew-y: -6.08673917; scale-x: 0.796516886; scale-y: 0.796516886;  }
        frame 17 { x: 25.2457432; y: 12.7039664; skew-x: -4.75239747; skew-y: -4.75239747; scale-x: 0.790327691; scale-y: 0.790327691;  }
        frame 18 { x: 25.3723727; y: 11.9317255; skew-x: -3.17591217; skew-y: -3.17591217; scale-x: 0.791392637; scale-y: 0.791392637;  }
        frame 19 { x: 25.578849; y: 11.2970411; skew-x: -1.86474378; skew-y: -1.86474378; scale-x: 0.789504994; scale-y: 0.789504994;  }
        frame 20 { x: 25.761897; y: 10.6305977; skew-x: -0.635968039; skew-y: -0.635968039; scale-x: 0.786020494; scale-y: 0.786020494;  }
        frame 21 { x: 25.947041; y: 9.94209441; skew-x: 0.952482836; skew-y: 0.952482836; scale-x: 0.784095897; scale-y: 0.784095897;  }
        frame 22 { x: 26.0731413; y: 9.29419884; skew-x: 2.31795511; skew-y: 2.31795511; scale-x: 0.781553227; scale-y: 0.781553227;  }
        frame 23 { x: 26.4471968; y: 8.51603272; skew-x: 4.19634252; skew-y: 4.19634252; scale-x: 0.777768839; scale-y: 0.777768839;  }
        frame 24 { x: 26.4471968; y: 8.51603272; skew-x: 4.19634252; skew-y: 4.19634252; scale-x: 0.777768839; scale-y: 0.777768839;  }
        frame 25 { x: 24.0618089; y: 10.7814086; skew-x: -1.31645459; skew-y: -1.31645459; scale-x: 0.753618461; scale-y: 0.753618461;  }
        frame 26 { x: 21.6663297; y: 13.0881631; skew-x: -7.36758473; skew-y: -7.36758473; scale-x: 0.735228344; scale-y: 0.735228344;  }
        frame 27 { x: 19.2485543; y: 15.333017; skew-x: -12.9142444; skew-y: -12.9142444; scale-x: 0.733456221; scale-y: 0.733456221;  }
        frame 28 { x: 16.8120149; y: 17.5950291; skew-x: -18.733115; skew-y: -18.733115; scale-x: 0.734604097; scale-y: 0.734604097;  }
        frame 29 { x: 14.4591058; y: 19.7856287; skew-x: -23.713166; skew-y: -23.713166; scale-x: 0.744086224; scale-y: 0.744086224;  }
        frame 30 { x: 14.507933; y: 19.689022; skew-x: -22.677935; skew-y: -22.677935; scale-x: 0.764195887; scale-y: 0.764195887;  }
        frame 31 { x: 14.705231; y: 19.4326719; skew-x: -21.2012224; skew-y: -21.2012224; scale-x: 0.775968635; scale-y: 0.775968635;  }
        frame 32 { x: 20.5770025; y: 8.24165915; skew-x: 12.004696; skew-y: 12.004696; scale-x: 0.810180964; scale-y: 0.810180964;  }
        frame 33 { x: 32.6143336; y: -0.481701149; skew-x: 46.1275025; skew-y: 46.1275025; scale-x: 0.790800785; scale-y: 0.790800785;  }
        frame 34 { x: 48.1208143; y: -4.58411482; skew-x: 84.031139; skew-y: 84.031139; scale-x: 0.829494583; scale-y: 0.829494583;  }
        frame 35 { x: 61.0471893; y: -0.129169938; skew-x: 115.67857; skew-y: 115.67857; scale-x: 0.72378286; scale-y: 0.72378286;  }
        frame 36 { x: 62.470313; y: 0.256783108; skew-x: 119.12068; skew-y: 119.12068; scale-x: 0.726703606; scale-y: 0.726703606;  }
        frame 37 { x: 63.9016843; y: 0.638426685; skew-x: 122.724955; skew-y: 122.724955; scale-x: 0.738586446; scale-y: 0.738586446;  }
        frame 38 { x: 63.4824569; y: 0.543346379; skew-x: 121.538585; skew-y: 121.538585; scale-x: 0.733089786; scale-y: 0.733089786;  }
        frame 39 { x: 63.1060966; y: 0.52993005; skew-x: 121.091054; skew-y: 121.091054; scale-x: 0.730738803; scale-y: 0.730738803;  }
        frame 40 { x: 62.6763311; y: 0.402447899; skew-x: 119.947046; skew-y: 119.947046; scale-x: 0.728937253; scale-y: 0.728937253;  }
        frame 41 { x: 62.301545; y: 0.261451168; skew-x: 118.946039; skew-y: 118.946039; scale-x: 0.727665781; scale-y: 0.727665781;  }
        frame 42 { x: 61.8665456; y: 0.127636444; skew-x: 117.904368; skew-y: 117.904368; scale-x: 0.723946177; scale-y: 0.723946177;  }
        frame 43 { x: 61.4832035; y: 0.0278217596; skew-x: 116.863761; skew-y: 116.863761; scale-x: 0.725181891; scale-y: 0.725181891;  }
        frame 44 { x: 61.0471893; y: -0.129169938; skew-x: 115.67857; skew-y: 115.67857; scale-x: 0.72378286; scale-y: 0.72378286;  }
        frame 45 { x: 61.2277986; y: -0.0897934478; skew-x: 115.965664; skew-y: 115.965664; scale-x: 0.724236328; scale-y: 0.724236328;  }
        frame 46 { x: 61.4534825; y: 0.00657591555; skew-x: 116.85473; skew-y: 116.85473; scale-x: 0.722694667; scale-y: 0.722694667;  }
        frame 47 { x: 61.5897975; y: 0.104129989; skew-x: 117.325719; skew-y: 117.325719; scale-x: 0.721922715; scale-y: 0.721922715;  }
        frame 48 { x: 61.8628704; y: 0.184840288; skew-x: 117.909647; skew-y: 117.909647; scale-x: 0.723364541; scale-y: 0.723364541;  }
        frame 49 { x: 62.0837089; y: 0.255389086; skew-x: 118.452343; skew-y: 118.452343; scale-x: 0.725190951; scale-y: 0.725190951;  }
        frame 50 { x: 62.2557708; y: 0.27859827; skew-x: 119.015292; skew-y: 119.015292; scale-x: 0.726439917; scale-y: 0.726439917;  }
        frame 51 { x: 62.4857296; y: 0.37709469; skew-x: 119.553595; skew-y: 119.553595; scale-x: 0.726413165; scale-y: 0.726413165;  }
        frame 52 { x: 56.6209783; y: -0.765033542; skew-x: 100.232008; skew-y: 100.232008; scale-x: 0.701193004; scale-y: 0.701193004;  }
        frame 53 { x: 50.6192707; y: -1.91458525; skew-x: 81.1908381; skew-y: 81.1908381; scale-x: 0.732251862; scale-y: 0.732251862;  }
        frame 54 { x: 43.5174548; y: -2.77807456; skew-x: 61.9526258; skew-y: 61.9526258; scale-x: 0.75963116; scale-y: 0.75963116;  }
        frame 55 { x: 37.5426866; y: 0.594123058; skew-x: 41.9168046; skew-y: 41.9168046; scale-x: 0.708123686; scale-y: 0.708123686;  }
        frame 56 { x: 31.9442066; y: 4.27818048; skew-x: 22.0857564; skew-y: 22.0857564; scale-x: 0.717415086; scale-y: 0.717415086;  }
        frame 57 { x: 26.4471968; y: 8.51603272; skew-x: 4.19634252; skew-y: 4.19634252; scale-x: 0.777768839; scale-y: 0.777768839;  }
        frame 58 { x: 26.4471968; y: 8.51603272; skew-x: 4.19634252; skew-y: 4.19634252; scale-x: 0.777768839; scale-y: 0.777768839;  }
        frame 59 { x: 26.9207271; y: 8.1931821; skew-x: 7.53866402; skew-y: 7.53866402; scale-x: 0.764246991; scale-y: 0.764246991;  }
        frame 60 { x: 27.4183924; y: 7.7913879; skew-x: 10.9226945; skew-y: 10.9226945; scale-x: 0.755944745; scale-y: 0.755944745;  }
        frame 61 { x: 27.2244305; y: 8.67920032; skew-x: 8.72238537; skew-y: 8.72238537; scale-x: 0.753347751; scale-y: 0.753347751;  }
        frame 62 { x: 26.9780156; y: 9.48738836; skew-x: 6.40142693; skew-y: 6.40142693; scale-x: 0.753497659; scale-y: 0.753497659;  }
        frame 63 { x: 26.7774845; y: 10.2425473; skew-x: 4.4181767; skew-y: 4.4181767; scale-x: 0.750400912; scale-y: 0.750400912;  }
        frame 64 { x: 26.5211642; y: 11.0864679; skew-x: 2.02504359; skew-y: 2.02504359; scale-x: 0.74922061; scale-y: 0.74922061;  }
        frame 65 { x: 26.3430306; y: 11.9406862; skew-x: 0.24276576; skew-y: 0.24276576; scale-x: 0.75252719; scale-y: 0.75252719;  }
        frame 66 { x: 26.1038485; y: 12.7070269; skew-x: -1.89989021; skew-y: -1.89989021; scale-x: 0.755462199; scale-y: 0.755462199;  }
        frame 67 { x: 25.8664152; y: 13.488851; skew-x: -3.90194134; skew-y: -3.90194134; scale-x: 0.76166898; scale-y: 0.76166898;  }
        frame 68 { x: 25.5131442; y: 13.4051547; skew-x: -4.923659; skew-y: -4.923659; scale-x: 0.778078181; scale-y: 0.778078181;  }
        frame 69 { x: 25.0689949; y: 13.3880215; skew-x: -6.08673917; skew-y: -6.08673917; scale-x: 0.796516886; scale-y: 0.796516886;  }
        frame 70 { x: 25.2457432; y: 12.7039664; skew-x: -4.75239747; skew-y: -4.75239747; scale-x: 0.790327691; scale-y: 0.790327691;  }
        frame 71 { x: 25.3723727; y: 11.9317255; skew-x: -3.17591217; skew-y: -3.17591217; scale-x: 0.791392637; scale-y: 0.791392637;  }
        frame 72 { x: 25.578849; y: 11.2970411; skew-x: -1.86474378; skew-y: -1.86474378; scale-x: 0.789504994; scale-y: 0.789504994;  }
        frame 73 { x: 25.761897; y: 10.6305977; skew-x: -0.635968039; skew-y: -0.635968039; scale-x: 0.786020494; scale-y: 0.786020494;  }
        frame 74 { x: 25.947041; y: 9.94209441; skew-x: 0.952482836; skew-y: 0.952482836; scale-x: 0.784095897; scale-y: 0.784095897;  }
        frame 75 { x: 26.0731413; y: 9.29419884; skew-x: 2.31795511; skew-y: 2.31795511; scale-x: 0.781553227; scale-y: 0.781553227;  }
        frame 76 { x: 26.4471968; y: 8.51603272; skew-x: 4.19634252; skew-y: 4.19634252; scale-x: 0.777768839; scale-y: 0.777768839;  }
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
        frame 5 { x: 14.6901678; y: 16.5040279; skew-x: 2.82928579; skew-y: 2.82928579; scale-x: 0.78546481; scale-y: 0.78546481; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK3; }
        frame 6 { x: 14.8851719; y: 15.0036749; skew-x: 7.65029826; skew-y: 7.65029826; scale-x: 0.781435256; scale-y: 0.781435256; cel: -10000; image: none; }
        frame 7 { x: 15.1579203; y: 13.5123692; skew-x: 12.3544363; skew-y: 12.3544363; scale-x: 0.779144775; scale-y: 0.779144775;  }
        frame 8 { x: 15.2093938; y: 15.0179658; skew-x: 9.36751979; skew-y: 9.36751979; scale-x: 0.773989732; scale-y: 0.773989732;  }
        frame 9 { x: 15.1283257; y: 16.507482; skew-x: 6.02962581; skew-y: 6.02962581; scale-x: 0.776193272; scale-y: 0.776193272;  }
        frame 10 { x: 15.1595738; y: 17.9130874; skew-x: 2.73170272; skew-y: 2.73170272; scale-x: 0.772580309; scale-y: 0.772580309;  }
        frame 11 { x: 15.1769254; y: 19.4062374; skew-x: -0.56680188; skew-y: -0.56680188; scale-x: 0.773681127; scale-y: 0.773681127;  }
        frame 12 { x: 15.1969962; y: 20.8906513; skew-x: -3.47328956; skew-y: -3.47328956; scale-x: 0.775893115; scale-y: 0.775893115;  }
        frame 13 { x: 15.2111259; y: 22.3693498; skew-x: -6.85346557; skew-y: -6.85346557; scale-x: 0.780337261; scale-y: 0.780337261;  }
        frame 14 { x: 15.2290792; y: 23.8396777; skew-x: -9.91208588; skew-y: -9.91208588; scale-x: 0.786358483; scale-y: 0.786358483;  }
        frame 15 { x: 15.0609551; y: 24.539577; skew-x: -12.6017998; skew-y: -12.6017998; scale-x: 0.789376172; scale-y: 0.789376172;  }
        frame 16 { x: 14.8863765; y: 25.4671829; skew-x: -15.9293052; skew-y: -15.9293052; scale-x: 0.792051012; scale-y: 0.792051012;  }
        frame 17 { x: 14.8103445; y: 24.1732514; skew-x: -13.3188057; skew-y: -13.3188057; scale-x: 0.788617193; scale-y: 0.788617193;  }
        frame 18 { x: 14.6483929; y: 22.8781411; skew-x: -10.6184802; skew-y: -10.6184802; scale-x: 0.787403886; scale-y: 0.787403886;  }
        frame 19 { x: 14.5619741; y: 21.669341; skew-x: -7.95610546; skew-y: -7.95610546; scale-x: 0.790925353; scale-y: 0.790925353;  }
        frame 20 { x: 14.5859777; y: 20.4927744; skew-x: -5.69279958; skew-y: -5.69279958; scale-x: 0.788031877; scale-y: 0.788031877;  }
        frame 21 { x: 14.521489; y: 19.1889988; skew-x: -2.85256902; skew-y: -2.85256902; scale-x: 0.789056689; scale-y: 0.789056689;  }
        frame 22 { x: 14.5561451; y: 18.0083481; skew-x: -0.384424457; skew-y: -0.384424457; scale-x: 0.783697725; scale-y: 0.783697725;  }
        frame 23 { x: 14.6901678; y: 16.5040279; skew-x: 2.82928579; skew-y: 2.82928579; scale-x: 0.78546481; scale-y: 0.78546481;  }
        frame 24 { x: 14.6901678; y: 16.5040279; skew-x: 2.82928579; skew-y: 2.82928579; scale-x: 0.78546481; scale-y: 0.78546481;  }
        frame 25 { x: 13.2409987; y: 20.2927914; skew-x: -6.13435074; skew-y: -6.13435074; scale-x: 0.769602778; scale-y: 0.769602778;  }
        frame 26 { x: 12.0596745; y: 24.1558271; skew-x: -15.6277212; skew-y: -15.6277212; scale-x: 0.758218911; scale-y: 0.758218911;  }
        frame 27 { x: 10.9289322; y: 28.1865945; skew-x: -25.6746064; skew-y: -25.6746064; scale-x: 0.759276248; scale-y: 0.759276248;  }
        frame 28 { x: 10.1700278; y: 32.1253444; skew-x: -35.9440117; skew-y: -35.9440117; scale-x: 0.761448479; scale-y: 0.761448479;  }
        frame 29 { x: 9.46947373; y: 35.9140347; skew-x: -45.4679945; skew-y: -45.4679945; scale-x: 0.777177428; scale-y: 0.777177428;  }
        frame 30 { x: 9.62150641; y: 35.8490675; skew-x: -44.5880209; skew-y: -44.5880209; scale-x: 0.759421155; scale-y: 0.759421155;  }
        frame 31 { x: 9.77764708; y: 35.5833268; skew-x: -43.752364; skew-y: -43.752364; scale-x: 0.742749944; scale-y: 0.742749944;  }
        frame 32 { x: 7.79845375; y: 24.1022752; skew-x: -32.1010774; skew-y: -32.1010774; scale-x: 0.777614012; scale-y: 0.777614012;  }
        frame 33 { x: 13.593467; y: 6.10812016; skew-x: -1.58366844; skew-y: -1.58366844; scale-x: 0.749895961; scale-y: 0.749895961;  }
        frame 34 { x: 30.2604949; y: -12.1320619; skew-x: 46.4156104; skew-y: 46.4156104; scale-x: 0.742988387; scale-y: 0.742988387;  }
        frame 35 { x: 54.6727114; y: -14.8050568; skew-x: 95.1509867; skew-y: 95.1509867; scale-x: 0.734887535; scale-y: 0.734887535;  }
        frame 36 { x: 57.4558043; y: -14.5706645; skew-x: 101.291351; skew-y: 101.291351; scale-x: 0.73355852; scale-y: 0.73355852;  }
        frame 37 { x: 60.2905859; y: -14.4417986; skew-x: 107.776337; skew-y: 107.776337; scale-x: 0.745443268; scale-y: 0.745443268;  }
        frame 38 { x: 59.4745706; y: -14.4249003; skew-x: 105.922752; skew-y: 105.922752; scale-x: 0.740867476; scale-y: 0.740867476;  }
        frame 39 { x: 58.7774819; y: -14.5002705; skew-x: 104.224502; skew-y: 104.224502; scale-x: 0.740417064; scale-y: 0.740417064;  }
        frame 40 { x: 57.9842836; y: -14.5801112; skew-x: 102.588786; skew-y: 102.588786; scale-x: 0.741133741; scale-y: 0.741133741;  }
        frame 41 { x: 57.1774369; y: -14.6609067; skew-x: 100.688062; skew-y: 100.688062; scale-x: 0.738409476; scale-y: 0.738409476;  }
        frame 42 { x: 56.3900891; y: -14.7451361; skew-x: 98.9369179; skew-y: 98.9369179; scale-x: 0.739346116; scale-y: 0.739346116;  }
        frame 43 { x: 55.4801263; y: -14.8348396; skew-x: 96.6542147; skew-y: 96.6542147; scale-x: 0.739576085; scale-y: 0.739576085;  }
        frame 44 { x: 54.6727114; y: -14.8050568; skew-x: 95.1509867; skew-y: 95.1509867; scale-x: 0.734887535; scale-y: 0.734887535;  }
        frame 45 { x: 54.9715211; y: -14.8320122; skew-x: 95.6283139; skew-y: 95.6283139; scale-x: 0.737757878; scale-y: 0.737757878;  }
        frame 46 { x: 55.4614217; y: -14.719591; skew-x: 96.7404045; skew-y: 96.7404045; scale-x: 0.731859006; scale-y: 0.731859006;  }
        frame 47 { x: 55.8624982; y: -14.6247689; skew-x: 97.8969276; skew-y: 97.8969276; scale-x: 0.73208736; scale-y: 0.73208736;  }
        frame 48 { x: 56.3768963; y: -14.6289247; skew-x: 98.9531856; skew-y: 98.9531856; scale-x: 0.735622846; scale-y: 0.735622846;  }
        frame 49 { x: 56.7827315; y: -14.6477942; skew-x: 99.7579412; skew-y: 99.7579412; scale-x: 0.738821434; scale-y: 0.738821434;  }
        frame 50 { x: 57.1655754; y: -14.5282703; skew-x: 100.96952; skew-y: 100.96952; scale-x: 0.73174003; scale-y: 0.73174003;  }
        frame 51 { x: 57.574534; y: -14.5679857; skew-x: 101.510831; skew-y: 101.510831; scale-x: 0.737966583; scale-y: 0.737966583;  }
        frame 52 { x: 48.3069754; y: -12.6827206; skew-x: 86.9427385; skew-y: 86.9427385; scale-x: 0.710534914; scale-y: 0.710534914;  }
        frame 53 { x: 38.7151602; y: -10.4710052; skew-x: 69.3481167; skew-y: 69.3481167; scale-x: 0.714880723; scale-y: 0.714880723;  }
        frame 54 { x: 29.2029269; y: -7.62804485; skew-x: 52.4317831; skew-y: 52.4317831; scale-x: 0.763865157; scale-y: 0.763865157;  }
        frame 55 { x: 24.1153728; y: 0.0916974187; skew-x: 37.6431079; skew-y: 37.6431079; scale-x: 0.721252395; scale-y: 0.721252395;  }
        frame 56 { x: 19.2626838; y: 7.97916728; skew-x: 20.3770864; skew-y: 20.3770864; scale-x: 0.72903698; scale-y: 0.72903698;  }
        frame 57 { x: 14.6901678; y: 16.5040279; skew-x: 2.82928579; skew-y: 2.82928579; scale-x: 0.78546481; scale-y: 0.78546481;  }
        frame 58 { x: 14.6901678; y: 16.5040279; skew-x: 2.82928579; skew-y: 2.82928579; scale-x: 0.78546481; scale-y: 0.78546481;  }
        frame 59 { x: 14.8851719; y: 15.0036749; skew-x: 7.65029826; skew-y: 7.65029826; scale-x: 0.781435256; scale-y: 0.781435256;  }
        frame 60 { x: 15.1579203; y: 13.5123692; skew-x: 12.3544363; skew-y: 12.3544363; scale-x: 0.779144775; scale-y: 0.779144775;  }
        frame 61 { x: 15.2093938; y: 15.0179658; skew-x: 9.36751979; skew-y: 9.36751979; scale-x: 0.773989732; scale-y: 0.773989732;  }
        frame 62 { x: 15.1283257; y: 16.507482; skew-x: 6.02962581; skew-y: 6.02962581; scale-x: 0.776193272; scale-y: 0.776193272;  }
        frame 63 { x: 15.1595738; y: 17.9130874; skew-x: 2.73170272; skew-y: 2.73170272; scale-x: 0.772580309; scale-y: 0.772580309;  }
        frame 64 { x: 15.1769254; y: 19.4062374; skew-x: -0.56680188; skew-y: -0.56680188; scale-x: 0.773681127; scale-y: 0.773681127;  }
        frame 65 { x: 15.1969962; y: 20.8906513; skew-x: -3.47328956; skew-y: -3.47328956; scale-x: 0.775893115; scale-y: 0.775893115;  }
        frame 66 { x: 15.2111259; y: 22.3693498; skew-x: -6.85346557; skew-y: -6.85346557; scale-x: 0.780337261; scale-y: 0.780337261;  }
        frame 67 { x: 15.2290792; y: 23.8396777; skew-x: -9.91208588; skew-y: -9.91208588; scale-x: 0.786358483; scale-y: 0.786358483;  }
        frame 68 { x: 15.0609551; y: 24.539577; skew-x: -12.6017998; skew-y: -12.6017998; scale-x: 0.789376172; scale-y: 0.789376172;  }
        frame 69 { x: 14.8863765; y: 25.4671829; skew-x: -15.9293052; skew-y: -15.9293052; scale-x: 0.792051012; scale-y: 0.792051012;  }
        frame 70 { x: 14.8103445; y: 24.1732514; skew-x: -13.3188057; skew-y: -13.3188057; scale-x: 0.788617193; scale-y: 0.788617193;  }
        frame 71 { x: 14.6483929; y: 22.8781411; skew-x: -10.6184802; skew-y: -10.6184802; scale-x: 0.787403886; scale-y: 0.787403886;  }
        frame 72 { x: 14.5619741; y: 21.669341; skew-x: -7.95610546; skew-y: -7.95610546; scale-x: 0.790925353; scale-y: 0.790925353;  }
        frame 73 { x: 14.5859777; y: 20.4927744; skew-x: -5.69279958; skew-y: -5.69279958; scale-x: 0.788031877; scale-y: 0.788031877;  }
        frame 74 { x: 14.521489; y: 19.1889988; skew-x: -2.85256902; skew-y: -2.85256902; scale-x: 0.789056689; scale-y: 0.789056689;  }
        frame 75 { x: 14.5561451; y: 18.0083481; skew-x: -0.384424457; skew-y: -0.384424457; scale-x: 0.783697725; scale-y: 0.783697725;  }
        frame 76 { x: 14.6901678; y: 16.5040279; skew-x: 2.82928579; skew-y: 2.82928579; scale-x: 0.78546481; scale-y: 0.78546481;  }
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
