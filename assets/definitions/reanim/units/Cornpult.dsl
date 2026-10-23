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
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 38.8; y: 9.4; skew-x: 4.1; skew-y: 4.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK1; }
        frame 6 { x: 38.6; y: 9.8; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 38.5; y: 10.1; skew-x: 3; skew-y: 3; }
        frame 8 { x: -10000; y: 10.5; skew-x: 2.6; skew-y: 2.6; }
        frame 9 { x: 38.4; y: 10.8; skew-x: 2.3; skew-y: 2.3; }
        frame 10 { x: 38.3; y: 11.2; skew-x: 1.8; skew-y: 1.8; }
        frame 11 { x: 38.1; y: 11.5; skew-x: 1.3; skew-y: 1.3; }
        frame 12 { x: -10000; y: 12; skew-x: 0.8; skew-y: 0.8; }
        frame 13 { x: 38; y: 12.3; skew-x: 0.3; skew-y: 0.3; }
        frame 14 { x: -10000; y: 12.6; skew-x: 0; skew-y: 0; }
        frame 15 { y: 12.3; skew-x: -10000; skew-y: -10000; }
        frame 16 { y: 12.1; }
        frame 17 { x: 38; y: 11.7; skew-x: 0.5; skew-y: 0.5; }
        frame 18 { x: 38.2; y: 11.3; skew-x: 1; skew-y: 1; }
        frame 19 { x: 38.3; y: 10.9; skew-x: 1.6; skew-y: 1.6; }
        frame 20 { x: 38.4; y: 10.5; skew-x: 2.3; skew-y: 2.3; }
        frame 21 { x: 38.5; y: 10.2; skew-x: 2.8; skew-y: 2.8; }
        frame 22 { x: 38.6; y: 9.8; skew-x: 3.3; skew-y: 3.3; }
        frame 23 { x: 38.8; y: 9.4; skew-x: 4.1; skew-y: 4.1; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 35.9; y: 10.6; skew-x: -3.9; skew-y: -1.7; scale-x: 0.803; }
        frame 26 { x: 33; y: 11.8; skew-x: -12.2; skew-y: -7.7; scale-x: 0.805; scale-y: 0.799; }
        frame 27 { x: 30.4; y: 13.1; skew-x: -20.2; skew-y: -13.5; scale-x: 0.808; scale-y: -10000; }
        frame 28 { x: 27.8; y: 14.4; skew-x: -28.5; skew-y: -19.5; scale-x: 0.811; scale-y: 0.798; }
        frame 29 { x: 25.4; y: 15.8; skew-x: -36.8; skew-y: -25.5; scale-x: 0.815; scale-y: 0.799; }
        frame 30 { x: 25; y: -10000; skew-x: -35.8; skew-y: -36.8; scale-x: 0.749; scale-y: 0.863; }
        frame 31 { x: 24.6; y: 16.1; skew-x: -35; skew-y: -48.2; scale-x: 0.685; scale-y: 0.93; }
        frame 32 { x: 30.7; y: 11.8; skew-x: -17.2; skew-y: -27.7; scale-x: 0.684; scale-y: 0.921; }
        frame 33 { x: 37.8; y: 8.3; skew-x: 0.3; skew-y: -7.5; scale-x: -10000; scale-y: 0.914; }
        frame 34 { x: 45.5; y: 5.3; skew-x: 8.4; skew-y: 15.1; scale-x: 0.679; scale-y: 1.06; }
        frame 35 { x: 54.3; y: 4.7; skew-x: 49; skew-y: 35.8; scale-x: 0.685; scale-y: 0.928; }
        frame 36 { x: 55.2; y: -10000; skew-x: 48.9; skew-y: 35.6; scale-x: 0.683; scale-y: 0.927; }
        frame 37 { x: 56.1; skew-x: 48.7; skew-y: -10000; scale-x: 0.684; scale-y: 0.928; }
        frame 38 { x: 55.9; skew-x: 48.9; scale-x: 0.683; scale-y: 0.927; }
        frame 39 { x: 55.5; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 55.3; }
        frame 41 { x: 55; }
        frame 42 { x: 54.8; y: 4.6; scale-x: 0.684; }
        frame 43 { x: 54.5; y: 4.7; skew-y: 35.8; scale-x: -10000; }
        frame 44 { x: 54.3; y: -10000; skew-x: 49; skew-y: -10000; scale-x: 0.685; scale-y: 0.928; }
        frame 45 { x: 54.4; skew-x: 48.9; scale-x: 0.683; scale-y: 0.927; }
        frame 46 { x: 54.5; skew-x: -10000; scale-x: -10000; scale-y: 0.926; }
        frame 47 { x: 54.6; skew-y: 35.6; scale-y: -10000; }
        frame 48 { x: 54.8; skew-y: -10000; }
        frame 49 { x: 54.9; }
        frame 50 { x: 55; y: 4.8; scale-y: 0.925; }
        frame 51 { x: 55.1; y: 4.7; scale-y: 0.927; }
        frame 52 { x: 52.2; y: 5.9; skew-x: 41.4; skew-y: 30.3; scale-x: 0.701; scale-y: 0.849; }
        frame 53 { x: 49.5; y: 7.3; skew-x: 33.8; skew-y: 25; scale-x: 0.721; scale-y: 0.775; }
        frame 54 { x: 46.6; y: 6.3; skew-x: 26.3; skew-y: 19.8; scale-x: 0.741; scale-y: 0.862; }
        frame 55 { x: 43.9; y: 7.1; skew-x: 18.8; skew-y: 14.5; scale-x: 0.76; scale-y: 0.841; }
        frame 56 { x: 41.3; y: 8.2; skew-x: 11.3; skew-y: 9.3; scale-x: 0.78; scale-y: 0.82; }
        frame 57 { x: 38.8; y: 9.4; skew-x: 4.1; skew-y: 4.1; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 38.6; y: 9.8; skew-x: 3.5; skew-y: 3.5; }
        frame 60 { x: 38.5; y: 10.1; skew-x: 3; skew-y: 3; }
        frame 61 { x: -10000; y: 10.5; skew-x: 2.6; skew-y: 2.6; }
        frame 62 { x: 38.4; y: 10.8; skew-x: 2.3; skew-y: 2.3; }
        frame 63 { x: 38.3; y: 11.2; skew-x: 1.8; skew-y: 1.8; }
        frame 64 { x: 38.1; y: 11.5; skew-x: 1.3; skew-y: 1.3; }
        frame 65 { x: -10000; y: 12; skew-x: 0.8; skew-y: 0.8; }
        frame 66 { x: 38; y: 12.3; skew-x: 0.3; skew-y: 0.3; }
        frame 67 { x: -10000; y: 12.6; skew-x: 0; skew-y: 0; }
        frame 68 { y: 12.3; skew-x: -10000; skew-y: -10000; }
        frame 69 { y: 12.1; }
        frame 70 { x: 38; y: 11.7; skew-x: 0.5; skew-y: 0.5; }
        frame 71 { x: 38.2; y: 11.3; skew-x: 1; skew-y: 1; }
        frame 72 { x: 38.3; y: 10.9; skew-x: 1.6; skew-y: 1.6; }
        frame 73 { x: 38.4; y: 10.5; skew-x: 2.3; skew-y: 2.3; }
        frame 74 { x: 38.5; y: 10.2; skew-x: 2.8; skew-y: 2.8; }
        frame 75 { x: 38.6; y: 9.8; skew-x: 3.3; skew-y: 3.3; }
        frame 76 { x: 38.8; y: 9.4; skew-x: 4.1; skew-y: 4.1; }
    }
    Track {
        source-name: "Cornpult_stalk2";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 26.2; y: 8.5; skew-x: 4.1; skew-y: 4.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK2; }
        frame 6 { x: 26.6; y: 8.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; cel: -10000; image: none; }
        frame 7 { x: 27.1; y: 7.6; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 26.8; y: 8.5; skew-x: 8.5; skew-y: 8.5; }
        frame 9 { x: 26.6; y: 9.3; skew-x: 6.3; skew-y: 6.3; }
        frame 10 { x: 26.3; y: 10; skew-x: 4.1; skew-y: 4.1; }
        frame 11 { x: 26.1; y: 10.8; skew-x: 2; skew-y: 2; }
        frame 12 { x: 25.9; y: 11.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 13 { x: 25.7; y: 12.5; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 25.5; y: 13.4; skew-x: -4.4; skew-y: -4.4; }
        frame 15 { x: -10000; y: 13.6; skew-x: -6.4; skew-y: -3.9; scale-x: 0.801; }
        frame 16 { x: 25.4; y: 13.8; skew-x: -8.6; skew-y: -3.4; scale-x: 0.803; }
        frame 17 { x: 25.5; y: 13; skew-x: -6.7; skew-y: -2.2; scale-x: 0.802; }
        frame 18 { x: -10000; y: 12.2; skew-x: -4.9; skew-y: -1.2; scale-x: -10000; }
        frame 19 { x: 25.7; y: 11.5; skew-x: -3; skew-y: -0.2; scale-x: 0.801; }
        frame 20 { x: 25.8; y: 10.7; skew-x: -1.2; skew-y: 0.8; scale-x: -10000; }
        frame 21 { x: 25.9; y: 10; skew-x: 0.3; skew-y: 1.8; }
        frame 22 { x: -10000; y: 9.3; skew-x: 2.1; skew-y: 2.8; scale-x: 0.8; }
        frame 23 { x: 26.2; y: 8.5; skew-x: 4.1; skew-y: 4.1; scale-x: -10000; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 23.5; y: 10.6; skew-x: -1.7; skew-y: -1.7; }
        frame 26 { x: 20.9; y: 12.8; skew-x: -7.7; skew-y: -7.7; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: 18.4; y: 15.1; skew-x: -13.5; skew-y: -13.5; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 15.9; y: 17.4; skew-x: -19.5; skew-y: -19.5; scale-x: 0.798; scale-y: 0.798; }
        frame 29 { x: 13.6; y: 19.8; skew-x: -25.5; skew-y: -25.5; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: 14.5; y: 19.6; skew-x: -24.4; skew-y: -19; scale-x: 0.798; scale-y: 0.805; }
        frame 31 { x: 15.4; y: 19.3; skew-x: -23.4; skew-y: -12.8; scale-x: 0.799; scale-y: 0.813; }
        frame 32 { x: 21.4; y: 9; skew-x: 9; skew-y: 19.6; scale-x: 0.803; scale-y: 0.805; }
        frame 33 { x: 32.4; y: 0.4; skew-x: 41.7; skew-y: 52.3; scale-x: 0.808; scale-y: 0.799; }
        frame 34 { x: 46.9; y: -4.6; skew-x: 78.5; skew-y: 88.8; scale-x: 0.921; scale-y: 0.803; }
        frame 35 { x: 61.1; y: 0.9; skew-x: 115.2; skew-y: 126; scale-x: 0.798; scale-y: 0.81; }
        frame 36 { x: 62.4; y: 1.3; skew-x: 118.9; skew-y: 129.6; scale-x: 0.796; scale-y: 0.809; }
        frame 37 { x: 63.5; y: 1.8; skew-x: 122.7; skew-y: 133.5; scale-x: 0.797; scale-y: 0.81; }
        frame 38 { x: 63.2; y: 1.7; skew-x: 121.6; skew-y: 132.4; scale-x: 0.796; scale-y: 0.809; }
        frame 39 { x: 62.9; y: 1.6; skew-x: 120.6; skew-y: 131.4; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 62.5; y: 1.5; skew-x: 119.6; skew-y: 130.3; }
        frame 41 { x: 62.2; y: 1.3; skew-x: 118.3; skew-y: 129.1; }
        frame 42 { x: 61.8; y: 1.2; skew-x: 117.3; skew-y: 128.1; }
        frame 43 { x: 61.5; y: 1.1; skew-x: 116.3; skew-y: 127.1; }
        frame 44 { x: 61.1; y: 0.9; skew-x: 115.2; skew-y: 126; scale-x: 0.798; scale-y: 0.81; }
        frame 45 { x: 61.3; y: 1; skew-x: 115.6; skew-y: 126.4; scale-x: 0.796; scale-y: 0.809; }
        frame 46 { x: 61.5; y: -10000; skew-x: 116.3; skew-y: 127.1; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 61.6; y: 1.1; skew-x: 116.8; skew-y: 127.6; scale-y: 0.808; }
        frame 48 { x: 61.8; y: 1.2; skew-x: 117.3; skew-y: 128.1; scale-y: -10000; }
        frame 49 { x: 62; y: 1.3; skew-x: 117.8; skew-y: 128.6; }
        frame 50 { x: 62.1; y: 1.2; skew-x: 118.3; skew-y: 129.1; scale-x: 0.795; }
        frame 51 { x: 62.4; y: 1.4; skew-x: 118.9; skew-y: 129.6; scale-x: 0.796; scale-y: 0.809; }
        frame 52 { x: 57; y: -0.4; skew-x: 99.6; skew-y: 108.6; scale-x: -10000; scale-y: 0.806; }
        frame 53 { x: 50.9; y: -1.9; skew-x: 80.7; skew-y: 88; scale-y: 0.805; }
        frame 54 { x: 43.8; y: -2.5; skew-x: 61.4; skew-y: 66.9; scale-x: 0.797; scale-y: 0.803; }
        frame 55 { x: 37.6; y: -0.1; skew-x: 42.4; skew-y: 45.9; scale-x: -10000; scale-y: 0.801; }
        frame 56 { x: 31.7; y: 3.5; skew-x: 23.1; skew-y: 25; scale-x: 0.798; scale-y: 0.8; }
        frame 57 { x: 26.2; y: 8.5; skew-x: 4.1; skew-y: 4.1; scale-x: 0.8; scale-y: -10000; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 59 { x: 26.6; y: 8.1; skew-x: 7.3; skew-y: 7.3; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: 27.1; y: 7.6; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 26.8; y: 8.5; skew-x: 8.5; skew-y: 8.5; }
        frame 62 { x: 26.6; y: 9.3; skew-x: 6.3; skew-y: 6.3; }
        frame 63 { x: 26.3; y: 10; skew-x: 4.1; skew-y: 4.1; }
        frame 64 { x: 26.1; y: 10.8; skew-x: 2; skew-y: 2; }
        frame 65 { x: 25.9; y: 11.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 66 { x: 25.7; y: 12.5; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 25.5; y: 13.4; skew-x: -4.4; skew-y: -4.4; }
        frame 68 { x: -10000; y: 13.6; skew-x: -6.4; skew-y: -3.9; scale-x: 0.801; }
        frame 69 { x: 25.4; y: 13.8; skew-x: -8.6; skew-y: -3.4; scale-x: 0.803; }
        frame 70 { x: 25.5; y: 13; skew-x: -6.7; skew-y: -2.2; scale-x: 0.802; }
        frame 71 { x: -10000; y: 12.2; skew-x: -4.9; skew-y: -1.2; scale-x: -10000; }
        frame 72 { x: 25.7; y: 11.5; skew-x: -3; skew-y: -0.2; scale-x: 0.801; }
        frame 73 { x: 25.8; y: 10.7; skew-x: -1.2; skew-y: 0.8; scale-x: -10000; }
        frame 74 { x: 25.9; y: 10; skew-x: 0.3; skew-y: 1.8; }
        frame 75 { x: -10000; y: 9.3; skew-x: 2.1; skew-y: 2.8; scale-x: 0.8; }
        frame 76 { x: 26.2; y: 8.5; skew-x: 4.1; skew-y: 4.1; scale-x: -10000; }
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
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 14.6; y: 16; skew-x: 4.1; skew-y: 4.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_CORNPULT_STALK3; }
        frame 6 { x: 14.8; y: 14.5; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; cel: -10000; image: none; }
        frame 7 { x: 15.1; y: 13; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: -10000; y: 14.5; skew-x: 9.5; skew-y: 9.5; }
        frame 9 { x: 15; y: 16; skew-x: 6.3; skew-y: 6.3; }
        frame 10 { y: 17.4; skew-x: 3.1; skew-y: 3.1; }
        frame 11 { x: -10000; y: 18.9; skew-x: 0; skew-y: 0; }
        frame 12 { y: 20.4; skew-x: -2.9; skew-y: -2.9; }
        frame 13 { y: 21.9; skew-x: -6.2; skew-y: -6.2; }
        frame 14 { y: 23.4; skew-x: -9.4; skew-y: -9.4; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 15; y: 24.1; skew-x: -12.4; skew-y: -8.2; scale-x: 0.803; scale-y: 0.799; }
        frame 16 { y: 25; skew-x: -15.5; skew-y: -7.2; scale-x: 0.808; scale-y: -10000; }
        frame 17 { x: 14.9; y: 23.7; skew-x: -12.7; skew-y: -5.4; scale-x: 0.806; }
        frame 18 { x: 14.7; y: 22.4; skew-x: -9.7; skew-y: -3.9; scale-x: 0.805; }
        frame 19 { x: 14.6; y: 21.2; skew-x: -6.9; skew-y: -2.2; scale-x: 0.804; }
        frame 20 { x: -10000; y: 20; skew-x: -4.2; skew-y: -0.7; scale-x: 0.803; scale-y: 0.8; }
        frame 21 { x: 14.5; y: 18.7; skew-x: -1.4; skew-y: 0.8; scale-x: 0.802; scale-y: -10000; }
        frame 22 { x: -10000; y: 17.5; skew-x: 1.1; skew-y: 2.3; scale-x: 0.801; }
        frame 23 { x: 14.6; y: 16; skew-x: 4.1; skew-y: 4.1; scale-x: 0.8; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 25 { x: 13; y: 19.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 26 { x: 11.7; y: 23.7; skew-x: -15.5; skew-y: -15.5; scale-x: 0.798; scale-y: 0.798; }
        frame 27 { x: 10.5; y: 27.8; skew-x: -25.5; skew-y: -25.5; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 9.7; y: 31.8; skew-x: -35.3; skew-y: -35.3; scale-x: 0.797; scale-y: 0.797; }
        frame 29 { x: 9; y: 35.7; skew-x: -45.2; skew-y: -45.2; scale-x: 0.798; scale-y: 0.798; }
        frame 30 { x: 9.1; y: 35.6; skew-x: -44; skew-y: -44; scale-x: 0.797; scale-y: 0.797; }
        frame 31 { x: 9.2; y: 35.3; skew-x: -42.9; skew-y: -42.9; scale-x: 0.798; scale-y: 0.798; }
        frame 32 { x: 7.4; y: 23.8; skew-x: -32; skew-y: -32; scale-x: 0.795; scale-y: 0.795; }
        frame 33 { x: 13.3; y: 5.6; skew-x: -2.4; skew-y: -2.4; scale-x: -10000; scale-y: 0.794; }
        frame 34 { x: 30.5; y: -12.7; skew-x: 46.6; skew-y: 46.6; scale-y: 0.793; }
        frame 35 { x: 55.3; y: -15; skew-x: 95.7; skew-y: 95.7; scale-x: 0.797; scale-y: 0.795; }
        frame 36 { x: 58.1; y: -14.7; skew-x: 101.8; skew-y: 101.8; scale-x: 0.796; scale-y: 0.794; }
        frame 37 { x: 60.9; y: -14.5; skew-x: 108; skew-y: 108; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 60.1; y: -10000; skew-x: 106.3; skew-y: 106.3; }
        frame 39 { x: 59.4; y: -14.6; skew-x: 104.5; skew-y: 104.5; }
        frame 40 { x: 58.6; y: -14.7; skew-x: 102.8; skew-y: 102.8; }
        frame 41 { x: 57.8; y: -14.8; skew-x: 101; skew-y: 101; }
        frame 42 { x: 57; y: -14.9; skew-x: 99.1; skew-y: 99.3; }
        frame 43 { x: 56.1; y: -15; skew-x: 97.3; skew-y: 97.3; scale-x: 0.797; scale-y: 0.795; }
        frame 44 { x: 55.3; y: -10000; skew-x: 95.7; skew-y: 95.7; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 55.6; skew-x: 96.5; skew-y: 96.5; }
        frame 46 { x: 56.1; y: -14.9; skew-x: 97.3; skew-y: 97.3; scale-x: 0.796; scale-y: 0.794; }
        frame 47 { x: 56.5; y: -14.8; skew-x: 98.3; skew-y: 98.3; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 57; y: -10000; skew-x: 99.1; skew-y: 99.1; }
        frame 49 { x: 57.4; skew-x: 100; skew-y: 100; }
        frame 50 { x: 57.8; y: -14.7; skew-x: 100.8; skew-y: 100.8; }
        frame 51 { x: 58.2; y: -10000; skew-x: 101.8; skew-y: 101.8; }
        frame 52 { x: 48.9; y: -13.1; skew-x: 85.5; skew-y: 85.7; scale-y: 0.795; }
        frame 53 { x: 39.2; y: -11; skew-x: 69.2; skew-y: 69.2; scale-y: 0.794; }
        frame 54 { x: 29.5; y: -8.1; skew-x: 52.9; skew-y: 52.9; scale-x: 0.797; scale-y: 0.796; }
        frame 55 { x: 24.2; y: -0.6; skew-x: 36.6; skew-y: 36.6; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 19.2; y: 7.3; skew-x: 20.3; skew-y: 20.3; scale-x: 0.798; scale-y: 0.798; }
        frame 57 { x: 14.6; y: 16; skew-x: 4.1; skew-y: 4.1; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 14.8; y: 14.5; skew-x: 8.3; skew-y: 8.3; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: 15.1; y: 13; skew-x: 12.8; skew-y: 12.8; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -10000; y: 14.5; skew-x: 9.5; skew-y: 9.5; }
        frame 62 { x: 15; y: 16; skew-x: 6.3; skew-y: 6.3; }
        frame 63 { y: 17.4; skew-x: 3.1; skew-y: 3.1; }
        frame 64 { x: -10000; y: 18.9; skew-x: 0; skew-y: 0; }
        frame 65 { y: 20.4; skew-x: -2.9; skew-y: -2.9; }
        frame 66 { y: 21.9; skew-x: -6.2; skew-y: -6.2; }
        frame 67 { y: 23.4; skew-x: -9.4; skew-y: -9.4; scale-x: 0.8; scale-y: 0.8; }
        frame 68 { x: 15; y: 24.1; skew-x: -12.4; skew-y: -8.2; scale-x: 0.803; scale-y: 0.799; }
        frame 69 { y: 25; skew-x: -15.5; skew-y: -7.2; scale-x: 0.808; scale-y: -10000; }
        frame 70 { x: 14.9; y: 23.7; skew-x: -12.7; skew-y: -5.4; scale-x: 0.806; }
        frame 71 { x: 14.7; y: 22.4; skew-x: -9.7; skew-y: -3.9; scale-x: 0.805; }
        frame 72 { x: 14.6; y: 21.2; skew-x: -6.9; skew-y: -2.2; scale-x: 0.804; }
        frame 73 { x: -10000; y: 20; skew-x: -4.2; skew-y: -0.7; scale-x: 0.803; scale-y: 0.8; }
        frame 74 { x: 14.5; y: 18.7; skew-x: -1.4; skew-y: 0.8; scale-x: 0.802; scale-y: -10000; }
        frame 75 { x: -10000; y: 17.5; skew-x: 1.1; skew-y: 2.3; scale-x: 0.801; }
        frame 76 { x: 14.6; y: 16; skew-x: 4.1; skew-y: 4.1; scale-x: 0.8; }
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
