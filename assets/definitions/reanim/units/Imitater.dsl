export component Imitater {
    fps: 48;
    Track {
        source-name: "anim_blink";
        frame-count: 84;
        frame 3 { cel: -1; }
        frame 4 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 84;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { cel: 0; }
        frame 4 { cel: -10000; }
        frame 53 { cel: -1; }
        frame 54 { cel: -10000; }
    }
    Track {
        source-name: "anim_explode";
        frame-count: 84;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 53 { cel: 0; }
        frame 54 { cel: -10000; }
    }
    Track {
        source-name: "Imitater_root4";
        frame-count: 84;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 62.8; y: 49.1; skew-x: 147.4; skew-y: -31.1; scale-x: 0.809; scale-y: 0.809; cel: 0; image: IMAGE_REANIM_IMITATER_ROOT2; }
        frame 4 { x: 62.6; y: 49; skew-x: 145.9; skew-y: -33; scale-x: 0.808; scale-y: 0.808; cel: -10000; image: none; }
        frame 5 { x: 62.4; y: 48.8; skew-x: 144.2; skew-y: -35; scale-x: 0.807; scale-y: -10000; }
        frame 6 { x: -10000; y: 48.6; skew-x: 142.7; skew-y: -37; scale-x: -10000; scale-y: 0.809; }
        frame 7 { x: 62.1; y: 48.4; skew-x: 141.1; skew-y: -39; scale-x: 0.806; scale-y: -10000; }
        frame 8 { x: 62; y: 48.3; skew-x: 139.6; skew-y: -41; scale-x: -10000; }
        frame 9 { x: 61.8; y: 48; skew-x: 137.9; skew-y: -43; scale-x: 0.805; }
        frame 10 { x: 61.6; skew-x: 136.4; skew-y: -45; scale-x: -10000; scale-y: 0.81; }
        frame 11 { x: 61.4; y: 47.7; skew-x: 134.9; skew-y: -47; scale-y: -10000; }
        frame 12 { x: -10000; y: 47.6; skew-x: 133.3; skew-y: -49; scale-x: 0.804; }
        frame 13 { x: 61; y: 47.5; skew-x: 131.7; skew-y: -51.1; scale-x: 0.805; scale-y: 0.812; }
        frame 14 { x: 61.2; y: 47.6; skew-x: 134.9; skew-y: -47.8; scale-x: 0.804; scale-y: 0.81; }
        frame 15 { x: 61.5; y: 47.8; skew-x: 138.1; skew-y: -44.3; scale-x: -10000; scale-y: 0.809; }
        frame 16 { x: 61.7; y: 48; skew-x: 141.2; skew-y: -40.8; scale-x: 0.803; scale-y: -10000; }
        frame 17 { x: 62; y: 48.1; skew-x: 144.4; skew-y: -37.5; scale-x: -10000; }
        frame 18 { x: 62.1; y: 48.4; skew-x: 147.4; skew-y: -34; scale-y: 0.808; }
        frame 19 { x: 62.4; y: 48.5; skew-x: 150.7; skew-y: -30.7; scale-x: 0.804; scale-y: 0.809; }
        frame 20 { x: -10000; y: 48.6; skew-x: 150.4; skew-y: -10000; scale-x: -10000; scale-y: 0.808; }
        frame 21 { x: 62.5; y: 48.8; skew-x: 149.9; scale-y: -10000; }
        frame 22 { x: -10000; y: -10000; skew-x: 149.4; skew-y: -30.8; scale-x: 0.805; }
        frame 23 { y: 48.9; skew-x: 149.1; skew-y: -31; scale-x: 0.806; }
        frame 24 { y: 49; skew-x: 148.7; skew-y: -10000; scale-x: -10000; }
        frame 25 { x: 62.6; y: -10000; skew-x: 148.2; scale-x: 0.807; }
        frame 26 { x: 62.7; y: 49; skew-x: 147.9; scale-x: -10000; }
        frame 27 { x: 62.8; y: 49.1; skew-x: 147.4; skew-y: -31.1; scale-x: 0.809; scale-y: 0.809; }
        frame 28 { x: 63; y: 49.5; skew-x: 146.7; skew-y: -32.2; scale-x: -10000; scale-y: 0.808; }
        frame 29 { x: 63.2; y: 49.6; skew-x: 145.9; skew-y: -33.2; scale-x: 0.811; scale-y: -10000; }
        frame 30 { x: 63.5; y: 49.9; skew-x: 145.2; skew-y: -34.2; scale-x: 0.812; scale-y: 0.807; }
        frame 31 { x: 63.6; y: 50.1; skew-x: 144.4; skew-y: -35.3; scale-x: 0.813; scale-y: -10000; }
        frame 32 { x: 63.9; y: 50.5; skew-x: 143.7; skew-y: -36.5; scale-x: 0.814; }
        frame 33 { x: 64; y: 50.6; skew-x: 142.9; skew-y: -37.5; scale-x: 0.816; }
        frame 34 { x: 64.2; y: 50.9; skew-x: 142.1; skew-y: -38.5; scale-x: 0.817; }
        frame 35 { x: 64.4; y: 51.1; skew-x: 141.4; skew-y: -39.5; scale-x: 0.818; scale-y: 0.806; }
        frame 36 { x: 64.7; y: 51.4; skew-x: 140.6; skew-y: -40.5; scale-x: 0.819; scale-y: -10000; }
        frame 37 { x: 64.8; y: 51.6; skew-x: 139.9; skew-y: -41.7; scale-x: 0.822; scale-y: 0.807; }
        frame 38 { x: -10000; y: 51.5; skew-x: 141.4; skew-y: -40; scale-x: 0.82; scale-y: 0.806; }
        frame 39 { x: 64.6; y: 51.4; skew-x: 142.9; skew-y: -38.5; scale-x: 0.819; scale-y: -10000; }
        frame 40 { x: -10000; y: -10000; skew-x: 144.4; skew-y: -36.8; scale-x: 0.818; }
        frame 41 { x: 64.5; y: 51.2; skew-x: 145.9; skew-y: -35.2; scale-x: 0.817; scale-y: 0.805; }
        frame 42 { x: 64.6; y: 51.1; skew-x: 147.2; skew-y: -33.5; scale-x: 0.816; scale-y: -10000; }
        frame 43 { x: 64.5; y: 51; skew-x: 148.7; skew-y: -31.9; scale-x: -10000; scale-y: 0.806; }
        frame 44 { x: 64.3; y: 50.8; skew-x: 148.6; skew-y: -31.7; scale-x: 0.814; scale-y: 0.805; }
        frame 45 { x: 64.1; y: 50.5; skew-x: 148.4; skew-y: -10000; scale-x: 0.813; scale-y: 0.806; }
        frame 46 { x: 64; y: 50.4; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 63.8; y: 50.1; skew-x: 148.2; skew-y: -31.5; scale-x: 0.812; }
        frame 48 { x: 63.5; y: 50; skew-x: 147.9; skew-y: -10000; scale-x: 0.811; scale-y: 0.807; }
        frame 49 { x: 63.3; y: 49.8; skew-x: -10000; scale-x: 0.81; scale-y: -10000; }
        frame 50 { x: 63.2; y: 49.5; skew-x: 147.7; skew-y: -31.2; scale-x: 0.809; }
        frame 51 { x: 62.9; y: 49.4; skew-x: 147.6; skew-y: -10000; scale-x: -10000; scale-y: 0.808; }
        frame 52 { x: 62.8; y: 49.1; skew-x: 147.4; skew-y: -31.1; scale-y: 0.809; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 54 { cel: -10000; }
    }
    Track {
        source-name: "Imitater_root3";
        frame-count: 84;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 55.8; y: 29.6; skew-x: 14.3; skew-y: 14.3; scale-x: 0.799; scale-y: 0.819; cel: 0; image: IMAGE_REANIM_IMITATER_ROOT3; }
        frame 4 { x: 55.5; y: 29.7; skew-x: 12.3; skew-y: 12.3; scale-x: 0.802; scale-y: 0.815; cel: -10000; image: none; }
        frame 5 { x: 55.1; y: -10000; skew-x: 10.5; skew-y: 10.3; scale-x: 0.805; scale-y: 0.812; }
        frame 6 { x: 54.9; y: 29.8; skew-x: 8.6; skew-y: 8.5; scale-x: 0.808; scale-y: 0.809; }
        frame 7 { x: 54.5; y: -10000; skew-x: 6.8; skew-y: 6.5; scale-x: 0.811; scale-y: 0.806; }
        frame 8 { x: 54.1; skew-x: 4.8; skew-y: 4.5; scale-x: 0.814; scale-y: 0.803; }
        frame 9 { x: 53.8; y: 29.9; skew-x: 3; skew-y: 2.6; scale-x: 0.816; scale-y: 0.8; }
        frame 10 { x: 53.5; y: 30; skew-x: 1; skew-y: 0.8; scale-x: 0.819; scale-y: 0.797; }
        frame 11 { x: 53.3; skew-x: -0.5; skew-y: -0.9; scale-x: 0.822; scale-y: 0.794; }
        frame 12 { x: 52.9; y: 30.2; skew-x: -2.4; skew-y: -2.9; scale-x: 0.825; scale-y: 0.791; }
        frame 13 { x: 52.5; y: 30.3; skew-x: -4.4; skew-y: -4.9; scale-x: 0.828; scale-y: 0.788; }
        frame 14 { x: 52.8; y: 30.2; skew-x: -1; skew-y: -1.5; scale-x: 0.826; scale-y: 0.79; }
        frame 15 { x: 53; y: 30.1; skew-x: 2; skew-y: 1.5; scale-x: 0.825; scale-y: 0.791; }
        frame 16 { x: 53.4; y: -10000; skew-x: 5.3; skew-y: 4.8; scale-x: 0.823; scale-y: 0.793; }
        frame 17 { x: 53.5; y: 30; skew-x: 8.5; skew-y: 8; scale-x: 0.821; scale-y: 0.794; }
        frame 18 { x: 53.9; y: 29.9; skew-x: 11.8; skew-y: 11.3; scale-x: 0.819; scale-y: 0.796; }
        frame 19 { x: 54.1; y: 29.8; skew-x: 15.1; skew-y: 14.6; scale-x: 0.818; scale-y: 0.798; }
        frame 20 { x: 54.3; y: -10000; skew-x: 14.8; skew-y: 14.5; scale-x: 0.815; scale-y: 0.8; }
        frame 21 { x: 54.5; skew-x: -10000; skew-y: -10000; scale-x: 0.813; scale-y: 0.802; }
        frame 22 { x: 54.8; y: 29.7; scale-x: 0.81; scale-y: 0.805; }
        frame 23 { x: 55; y: -10000; skew-x: 14.6; skew-y: 14.3; scale-x: 0.808; scale-y: 0.808; }
        frame 24 { x: -10000; skew-x: 14.5; skew-y: -10000; scale-x: 0.806; scale-y: 0.81; }
        frame 25 { x: 55.3; y: 29.6; skew-x: -10000; scale-x: 0.803; scale-y: 0.813; }
        frame 26 { x: 55.5; y: -10000; skew-x: 14.3; scale-x: 0.801; scale-y: 0.815; }
        frame 27 { x: 55.8; skew-x: -10000; scale-x: 0.799; scale-y: 0.819; }
        frame 28 { x: 56.3; y: 29.9; skew-x: 13.8; skew-y: 13.8; scale-x: 0.801; scale-y: 0.817; }
        frame 29 { x: 56.6; y: 30.1; skew-x: 13.1; skew-y: 13.3; scale-x: 0.804; scale-y: 0.815; }
        frame 30 { x: 57; y: 30.3; skew-x: 12.5; skew-y: 13; scale-x: 0.807; scale-y: 0.814; }
        frame 31 { x: 57.5; y: 30.5; skew-x: 12; skew-y: 12.5; scale-x: 0.809; scale-y: 0.812; }
        frame 32 { x: 57.9; y: 30.9; skew-x: 11.3; skew-y: 12.1; scale-x: 0.812; scale-y: 0.811; }
        frame 33 { x: 58.3; y: 31.1; skew-x: 10.8; skew-y: 11.8; scale-x: 0.815; scale-y: 0.809; }
        frame 34 { x: 58.7; y: 31.3; skew-x: 10.3; skew-y: 11.3; scale-x: 0.817; scale-y: 0.808; }
        frame 35 { x: 59; y: 31.5; skew-x: 9.8; skew-y: 10.8; scale-x: 0.82; scale-y: 0.806; }
        frame 36 { x: 59.5; y: 31.8; skew-x: 9.1; skew-y: 10.5; scale-x: 0.823; scale-y: 0.805; }
        frame 37 { x: 60; y: 32; skew-x: 8.6; skew-y: 10.1; scale-x: 0.826; scale-y: 0.804; }
        frame 38 { x: 59.9; y: 31.9; skew-x: 10.3; skew-y: 11.8; scale-x: 0.824; scale-y: -10000; }
        frame 39 { x: 59.6; y: 31.7; skew-x: 12.3; skew-y: 13.5; scale-x: 0.822; scale-y: 0.805; }
        frame 40 { x: 59.5; y: 31.4; skew-x: 14; skew-y: 15.1; scale-x: 0.82; scale-y: -10000; }
        frame 41 { x: 59.4; y: -10000; skew-x: 15.8; skew-y: 16.8; scale-x: 0.818; scale-y: 0.806; }
        frame 42 { x: 59.2; y: 31.1; skew-x: 17.6; skew-y: 18.6; scale-x: 0.817; scale-y: -10000; }
        frame 43 { x: 59; y: 30.9; skew-x: 19.6; skew-y: 20.4; scale-x: 0.816; scale-y: 0.808; }
        frame 44 { x: 58.6; y: 30.8; skew-x: 18.8; skew-y: 19.6; scale-x: 0.813; scale-y: -10000; }
        frame 45 { x: 58.3; y: 30.6; skew-x: 18.3; skew-y: 19; scale-x: 0.811; scale-y: 0.81; }
        frame 46 { x: 58; y: -10000; skew-x: 17.8; skew-y: 18.3; scale-x: 0.81; scale-y: 0.811; }
        frame 47 { x: 57.6; y: 30.4; skew-x: 17.1; skew-y: 17.6; scale-x: 0.808; scale-y: 0.812; }
        frame 48 { x: 57.3; y: 30.2; skew-x: 16.6; skew-y: 17; scale-x: 0.806; scale-y: 0.813; }
        frame 49 { x: 56.9; y: 30.1; skew-x: 16; skew-y: 16.3; scale-x: 0.804; scale-y: 0.814; }
        frame 50 { x: 56.5; y: 30; skew-x: 15.5; skew-y: 15.6; scale-x: 0.802; scale-y: 0.816; }
        frame 51 { x: 56.2; y: 29.8; skew-x: 14.8; skew-y: 15; scale-x: 0.801; scale-y: 0.817; }
        frame 52 { x: 55.8; y: 29.6; skew-x: 14.3; skew-y: 14.3; scale-x: 0.799; scale-y: 0.819; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 54 { cel: -10000; }
    }
    Track {
        source-name: "Imitater_root2";
        frame-count: 84;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 15.8; y: 49; skew-x: -15.2; skew-y: -15.2; scale-x: 0.799; scale-y: 0.819; cel: 0; image: IMAGE_REANIM_IMITATER_ROOT2; }
        frame 4 { x: 15.6; y: 49.1; skew-x: -14; skew-y: -14.2; scale-x: 0.802; scale-y: 0.815; cel: -10000; image: none; }
        frame 5 { x: 15.4; y: 49.2; skew-x: -12.9; skew-y: -13.2; scale-x: 0.805; scale-y: 0.812; }
        frame 6 { x: 15.1; y: 49.5; skew-x: -11.9; skew-y: -12; scale-x: 0.807; scale-y: 0.809; }
        frame 7 { x: 15; y: -10000; skew-x: -10.7; skew-y: -11; scale-x: 0.81; scale-y: 0.806; }
        frame 8 { x: 14.7; y: 49.7; skew-x: -9.7; skew-y: -9.9; scale-x: 0.813; scale-y: 0.803; }
        frame 9 { x: 14.4; y: 49.8; skew-x: -8.7; skew-y: -8.9; scale-x: 0.816; scale-y: 0.8; }
        frame 10 { x: 14.2; y: 50; skew-x: -7.7; skew-y: -7.9; scale-x: 0.819; scale-y: 0.797; }
        frame 11 { x: 14.1; y: 50.1; skew-x: -6.4; skew-y: -6.9; scale-x: 0.822; scale-y: 0.794; }
        frame 12 { x: 13.8; y: 50.2; skew-x: -5.4; skew-y: -5.9; scale-x: 0.825; scale-y: 0.791; }
        frame 13 { x: 13.5; y: 50.4; skew-x: -4.4; skew-y: -4.9; scale-x: 0.828; scale-y: 0.788; }
        frame 14 { x: 13.7; y: -10000; skew-x: -6.2; skew-y: -6.7; scale-x: 0.826; scale-y: 0.789; }
        frame 15 { x: 13.8; y: 50.5; skew-x: -8.2; skew-y: -8.5; scale-x: 0.824; scale-y: 0.791; }
        frame 16 { x: 14; y: -10000; skew-x: -9.9; skew-y: -10.4; scale-x: 0.823; scale-y: 0.792; }
        frame 17 { x: 14.2; skew-x: -11.9; skew-y: -12.2; scale-x: 0.821; scale-y: 0.794; }
        frame 18 { x: 14.5; y: 50.6; skew-x: -13.7; skew-y: -14.2; scale-x: 0.819; scale-y: 0.795; }
        frame 19 { x: -10000; y: 50.7; skew-x: -15.7; skew-y: -16; scale-x: 0.818; scale-y: 0.798; }
        frame 20 { x: 14.7; y: 50.5; skew-x: -10000; skew-y: -15.9; scale-x: 0.815; scale-y: 0.8; }
        frame 21 { x: 14.8; y: 50.3; skew-x: -15.5; skew-y: -15.7; scale-x: 0.813; scale-y: 0.802; }
        frame 22 { x: 14.9; y: 50; skew-x: -10000; skew-y: -10000; scale-x: 0.81; scale-y: 0.805; }
        frame 23 { x: 15; y: 49.8; skew-x: -15.4; skew-y: -15.5; scale-x: 0.808; scale-y: 0.807; }
        frame 24 { x: 15.2; y: 49.5; skew-x: -10000; skew-y: -15.4; scale-x: 0.806; scale-y: 0.81; }
        frame 25 { x: 15.4; y: 49.3; skew-x: -15.2; skew-y: -10000; scale-x: 0.803; scale-y: 0.813; }
        frame 26 { x: 15.5; y: 49; skew-x: -10000; skew-y: -15.2; scale-x: 0.801; scale-y: 0.815; }
        frame 27 { x: 15.8; skew-y: -10000; scale-x: 0.799; scale-y: 0.819; }
        frame 28 { x: 16.1; y: 48.5; skew-x: -12.2; skew-y: -12; scale-x: 0.801; scale-y: 0.817; }
        frame 29 { x: 16.4; y: 48.1; skew-x: -9.2; skew-y: -8.9; scale-x: 0.804; scale-y: 0.815; }
        frame 30 { x: 16.7; y: 47.8; skew-x: -6.2; skew-y: -5.9; scale-x: 0.807; scale-y: 0.814; }
        frame 31 { x: 16.9; y: 47.4; skew-x: -3; skew-y: -2.7; scale-x: 0.81; scale-y: 0.812; }
        frame 32 { x: 17.3; y: 47; skew-x: -0; skew-y: 0; scale-x: 0.812; scale-y: 0.811; }
        frame 33 { x: 17.5; y: 46.6; skew-x: 2.8; skew-y: 3.1; scale-x: 0.815; scale-y: 0.809; }
        frame 34 { x: 17.7; y: 46.3; skew-x: 5.8; skew-y: 6.3; scale-x: 0.817; scale-y: 0.807; }
        frame 35 { x: 18.1; y: 46; skew-x: 8.8; skew-y: 9.3; scale-x: 0.82; scale-y: 0.806; }
        frame 36 { x: 18.4; y: 45.7; skew-x: 11.8; skew-y: 12.3; scale-x: 0.822; scale-y: 0.804; }
        frame 37 { x: 18.7; y: 45.4; skew-x: 14.9; skew-y: 15.6; scale-x: 0.825; scale-y: 0.803; }
        frame 38 { x: 18.4; y: 45.7; skew-x: 11.5; skew-y: 12.3; scale-x: 0.823; scale-y: -10000; }
        frame 39 { x: 18.2; y: 46.1; skew-x: 8.3; skew-y: 9; scale-x: 0.822; scale-y: 0.804; }
        frame 40 { x: 18; y: 46.5; skew-x: 5.1; skew-y: 5.8; scale-x: 0.82; scale-y: 0.805; }
        frame 41 { x: 17.8; y: 46.8; skew-x: 1.8; skew-y: 2.5; scale-x: 0.819; scale-y: 0.806; }
        frame 42 { x: 17.6; y: 47.1; skew-x: -1.2; skew-y: -0.5; scale-x: 0.817; scale-y: 0.807; }
        frame 43 { x: 17.3; y: 47.5; skew-x: -4.4; skew-y: -3.9; scale-x: 0.816; scale-y: 0.808; }
        frame 44 { x: 17.1; y: 47.7; skew-x: -5.5; skew-y: -5.2; scale-x: 0.814; scale-y: 0.809; }
        frame 45 { x: 16.9; y: 47.8; skew-x: -6.7; skew-y: -6.4; scale-x: 0.812; scale-y: 0.81; }
        frame 46 { x: 16.8; y: 48; skew-x: -7.9; skew-y: -7.7; scale-x: 0.81; scale-y: 0.811; }
        frame 47 { x: 16.6; y: 48.1; skew-x: -9.2; skew-y: -8.9; scale-x: 0.808; scale-y: 0.812; }
        frame 48 { x: 16.5; y: 48.4; skew-x: -10.4; skew-y: -10.2; scale-x: 0.806; scale-y: 0.813; }
        frame 49 { x: 16.4; y: 48.5; skew-x: -11.5; skew-y: -11.4; scale-x: 0.804; scale-y: 0.814; }
        frame 50 { x: 16.2; y: 48.6; skew-x: -12.7; skew-y: -12.7; scale-x: 0.802; scale-y: 0.816; }
        frame 51 { x: 16; y: 48.9; skew-x: -13.9; skew-y: -13.9; scale-x: 0.801; scale-y: 0.817; }
        frame 52 { x: 15.8; y: 49; skew-x: -15.2; skew-y: -15.2; scale-x: 0.799; scale-y: 0.819; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 54 { cel: -10000; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 84;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 17.3; y: 3.7; scale-x: 0.8; scale-y: 0.819; cel: 0; image: IMAGE_REANIM_IMITATER_BODY; }
        frame 4 { x: 16.8; y: 4.1; skew-x: -0.2; skew-y: -0.2; scale-x: 0.803; scale-y: 0.816; cel: -10000; image: none; }
        frame 5 { x: 16.2; y: 4.5; skew-x: -0.7; skew-y: -0.7; scale-x: 0.806; scale-y: 0.813; }
        frame 6 { x: 15.7; y: 4.9; skew-x: -1.2; skew-y: -1.2; scale-x: 0.808; scale-y: 0.81; }
        frame 7 { x: 15; y: 5.3; skew-x: -1.7; skew-y: -1.7; scale-x: 0.811; scale-y: 0.807; }
        frame 8 { x: 14.5; y: 5.8; skew-x: -2.2; skew-y: -2.2; scale-x: 0.814; scale-y: 0.804; }
        frame 9 { x: 13.8; y: 6.2; skew-x: -2.5; skew-y: -2.7; scale-x: 0.817; scale-y: 0.801; }
        frame 10 { x: 13.3; y: 6.7; skew-x: -2.9; skew-y: -3.2; scale-x: 0.82; scale-y: 0.797; }
        frame 11 { x: 12.7; y: 7.2; skew-x: -3.4; skew-y: -3.7; scale-x: 0.822; scale-y: 0.794; }
        frame 12 { x: 12.1; y: 7.6; skew-x: -3.9; skew-y: -4.2; scale-x: 0.825; scale-y: 0.791; }
        frame 13 { x: 11.4; y: 8.1; skew-x: -4.4; skew-y: -4.9; scale-x: 0.828; scale-y: 0.788; }
        frame 14 { x: 11.9; y: 7.8; skew-x: -4.2; skew-y: -4.4; scale-x: 0.826; scale-y: 0.79; }
        frame 15 { x: 12.1; y: 7.6; skew-x: -3.9; skew-y: -4.2; scale-x: 0.825; scale-y: 0.791; }
        frame 16 { x: 12.5; y: 7.3; skew-x: -3.7; skew-y: -3.9; scale-x: 0.823; scale-y: 0.793; }
        frame 17 { x: 12.8; y: 7.1; skew-x: -3.4; skew-y: -3.7; scale-x: 0.822; scale-y: 0.795; }
        frame 18 { x: 13.1; y: 6.8; skew-x: -3.2; skew-y: -3.4; scale-x: 0.82; scale-y: 0.797; }
        frame 19 { x: 13.4; y: 6.6; skew-x: -2.9; skew-y: -3.2; scale-x: 0.819; scale-y: 0.798; }
        frame 20 { x: 14; y: 6.1; skew-x: -2.4; skew-y: -2.7; scale-x: 0.816; scale-y: 0.801; }
        frame 21 { x: 14.5; y: 6; skew-x: -2.1; skew-y: -2.2; scale-x: 0.814; scale-y: 0.804; }
        frame 22 { x: 14.9; y: 5.5; skew-x: -1.7; skew-y: -1.9; scale-x: 0.812; scale-y: 0.806; }
        frame 23 { x: 15.4; y: 5.1; skew-x: -1.4; skew-y: -1.4; scale-x: 0.809; scale-y: 0.809; }
        frame 24 { x: 15.9; y: 4.7; skew-x: -0.9; skew-y: -1; scale-x: 0.807; scale-y: 0.811; }
        frame 25 { x: 16.3; y: 4.4; skew-x: -0.6; skew-y: -0.7; scale-x: 0.805; scale-y: 0.814; }
        frame 26 { x: 16.8; y: 4.1; skew-x: -0.2; skew-y: -0.2; scale-x: 0.802; scale-y: 0.817; }
        frame 27 { x: 17.3; y: 3.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.819; }
        frame 28 { x: 17.9; y: 3.6; skew-x: 0.5; skew-y: 0.5; scale-x: 0.803; scale-y: 0.818; }
        frame 29 { x: 18.6; y: 3.5; skew-x: 1; skew-y: 1.3; scale-x: 0.806; scale-y: 0.816; }
        frame 30 { x: 19.2; y: -10000; skew-x: 1.6; skew-y: 1.8; scale-x: 0.809; scale-y: 0.814; }
        frame 31 { x: 19.9; y: 3.4; skew-x: 2.3; skew-y: 2.5; scale-x: 0.812; scale-y: 0.813; }
        frame 32 { x: 20.5; y: -10000; skew-x: 2.8; skew-y: 3; scale-x: 0.814; scale-y: 0.811; }
        frame 33 { x: 21.2; skew-x: 3.3; skew-y: 3.8; scale-x: 0.817; scale-y: 0.809; }
        frame 34 { x: 21.8; y: 3.3; skew-x: 3.8; skew-y: 4.3; scale-x: 0.82; scale-y: 0.807; }
        frame 35 { x: 22.5; y: 3.1; skew-x: 4.5; skew-y: 5; scale-x: 0.823; scale-y: 0.806; }
        frame 36 { x: 23.1; y: -10000; skew-x: 5; skew-y: 5.6; scale-x: 0.826; scale-y: 0.804; }
        frame 37 { x: 23.8; y: 3; skew-x: 5.7; skew-y: 6.4; scale-x: 0.829; scale-y: 0.803; }
        frame 38 { x: 23.3; y: 3.1; skew-x: 5.3; skew-y: 5.8; scale-x: 0.827; scale-y: -10000; }
        frame 39 { x: 23; y: 3; skew-x: 5; skew-y: 5.5; scale-x: 0.826; scale-y: 0.804; }
        frame 40 { x: 22.6; y: 3.2; skew-x: 4.6; skew-y: 5.1; scale-x: 0.824; scale-y: 0.805; }
        frame 41 { x: 22.3; y: 3.3; skew-x: 4.3; skew-y: 4.8; scale-x: 0.822; scale-y: 0.806; }
        frame 42 { x: 21.9; y: 3.2; skew-x: 4; skew-y: 4.3; scale-x: 0.821; scale-y: 0.807; }
        frame 43 { x: 21.5; y: -10000; skew-x: 3.8; skew-y: 4.1; scale-x: 0.819; scale-y: 0.808; }
        frame 44 { x: 21.1; y: 3.3; skew-x: 3.3; skew-y: 3.5; scale-x: 0.817; scale-y: 0.809; }
        frame 45 { x: 20.5; y: 3.4; skew-x: 2.8; skew-y: 3; scale-x: 0.815; scale-y: 0.81; }
        frame 46 { x: 20; y: -10000; skew-x: 2.5; skew-y: 2.6; scale-x: 0.813; scale-y: 0.812; }
        frame 47 { x: 19.6; y: 3.5; skew-x: 2; skew-y: 2.3; scale-x: 0.811; scale-y: 0.813; }
        frame 48 { x: 19.1; y: -10000; skew-x: 1.5; skew-y: 1.8; scale-x: 0.808; scale-y: 0.814; }
        frame 49 { x: 18.6; skew-x: 1.3; skew-y: 1.3; scale-x: 0.806; scale-y: 0.816; }
        frame 50 { x: 18.1; y: 3.6; skew-x: 0.8; skew-y: 0.8; scale-x: 0.804; scale-y: 0.817; }
        frame 51 { x: 17.6; y: 3.7; skew-x: 0.3; skew-y: 0.3; scale-x: 0.802; scale-y: 0.818; }
        frame 52 { x: 17.3; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.819; }
        frame 53 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 54 { cel: -10000; }
    }
    Track {
        source-name: "Imitater_root1";
        frame-count: 84;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 14.7; y: 31.7; skew-x: -19.6; skew-y: -6.5; scale-x: 0.821; scale-y: 0.819; cel: 0; image: IMAGE_REANIM_IMITATER_ROOT1; }
        frame 4 { x: 14.3; y: 31.8; skew-x: -18; skew-y: -6.2; scale-x: -10000; scale-y: 0.816; cel: -10000; image: none; }
        frame 5 { x: 13.9; y: 31.9; skew-x: -16.4; skew-y: -6; scale-x: 0.822; scale-y: 0.813; }
        frame 6 { x: 13.7; y: 32; skew-x: -14.9; skew-y: -5.9; scale-x: 0.823; scale-y: 0.81; }
        frame 7 { x: 13.2; y: -10000; skew-x: -13.4; skew-y: -5.7; scale-x: -10000; scale-y: 0.806; }
        frame 8 { x: 12.8; y: 32.1; skew-x: -11.9; skew-y: -10000; scale-x: 0.824; scale-y: 0.803; }
        frame 9 { x: 12.5; y: 32.3; skew-x: -10.4; skew-y: -5.4; scale-x: 0.825; scale-y: 0.8; }
        frame 10 { x: 12.2; y: 32.4; skew-x: -8.9; skew-y: -5.2; scale-x: 0.826; scale-y: 0.797; }
        frame 11 { x: 11.8; y: -10000; skew-x: -7.4; skew-y: -10000; scale-x: -10000; scale-y: 0.794; }
        frame 12 { x: 11.5; y: 32.5; skew-x: -5.9; skew-y: -4.9; scale-x: 0.827; scale-y: 0.791; }
        frame 13 { x: 11.1; y: 32.6; skew-x: -4.4; skew-y: -10000; scale-x: 0.828; scale-y: 0.788; }
        frame 14 { x: -10000; y: 32.9; skew-x: -7; skew-y: -6.7; scale-x: 0.827; scale-y: 0.789; }
        frame 15 { x: 11.3; y: 33.1; skew-x: -9.7; skew-y: -8.7; scale-x: -10000; scale-y: 0.791; }
        frame 16 { x: -10000; y: 33.4; skew-x: -12.4; skew-y: -10.7; scale-x: 0.826; scale-y: 0.792; }
        frame 17 { x: 11.6; y: 33.6; skew-x: -15.2; skew-y: -12.7; scale-x: 0.825; scale-y: 0.794; }
        frame 18 { x: 11.7; y: 34; skew-x: -17.9; skew-y: -14.7; scale-x: -10000; scale-y: 0.795; }
        frame 19 { x: 11.8; y: 34.1; skew-x: -20.7; skew-y: -16.7; scale-y: 0.798; }
        frame 20 { x: 12.2; y: 33.9; skew-x: -20.5; skew-y: -15.4; scale-x: 0.824; scale-y: 0.8; }
        frame 21 { x: 12.5; y: 33.5; skew-x: -20.4; skew-y: -14; scale-x: 0.823; scale-y: 0.802; }
        frame 22 { x: 12.9; y: 33.1; skew-x: -20.2; skew-y: -12.7; scale-x: -10000; scale-y: 0.805; }
        frame 23 { x: 13.2; y: 33; skew-x: -20; skew-y: -11.5; scale-x: 0.822; scale-y: 0.808; }
        frame 24 { x: 13.6; y: 32.5; skew-x: -19.9; skew-y: -10.2; scale-x: -10000; scale-y: 0.811; }
        frame 25 { x: 13.9; y: 32.3; skew-x: -19.7; skew-y: -8.9; scale-x: 0.821; scale-y: 0.813; }
        frame 26 { x: 14.3; y: 32; skew-x: -10000; skew-y: -7.7; scale-x: -10000; scale-y: 0.816; }
        frame 27 { x: 14.7; y: 31.7; skew-x: -19.6; skew-y: -6.5; scale-y: 0.819; }
        frame 28 { x: 15.1; y: 31.2; skew-x: -16.2; skew-y: -5.2; scale-x: 0.822; scale-y: 0.817; }
        frame 29 { x: 15.3; y: 30.6; skew-x: -12.9; skew-y: -4.2; scale-x: 0.824; scale-y: 0.815; }
        frame 30 { x: 15.7; y: 30.1; skew-x: -9.5; skew-y: -3.2; scale-x: 0.826; scale-y: 0.814; }
        frame 31 { x: 16; y: 29.7; skew-x: -6.2; skew-y: -1.9; scale-x: 0.828; scale-y: 0.812; }
        frame 32 { x: 16.4; y: 29.1; skew-x: -2.9; skew-y: -0.9; scale-x: 0.83; scale-y: 0.81; }
        frame 33 { x: 16.8; y: 28.6; skew-x: 0.3; skew-y: 0; scale-x: 0.832; scale-y: 0.809; }
        frame 34 { x: 17.2; y: 28; skew-x: 3.5; skew-y: 1; scale-x: 0.834; scale-y: 0.807; }
        frame 35 { x: 17.6; y: 27.6; skew-x: 6.8; skew-y: 2; scale-x: 0.836; scale-y: 0.805; }
        frame 36 { x: 18; y: 27; skew-x: 10.3; skew-y: 3.3; scale-x: 0.837; scale-y: 0.803; }
        frame 37 { x: 18.5; y: 26.6; skew-x: 13.6; skew-y: 4.4; scale-x: 0.84; scale-y: 0.802; }
        frame 38 { x: 18; y: 27.2; skew-x: 9.5; skew-y: 1.5; scale-x: 0.838; scale-y: 0.803; }
        frame 39 { x: 17.5; y: 27.9; skew-x: 5.5; skew-y: -1; scale-x: 0.837; scale-y: -10000; }
        frame 40 { x: 17.1; y: 28.4; skew-x: 1.5; skew-y: -3.9; scale-x: 0.836; scale-y: 0.804; }
        frame 41 { x: 16.7; y: 28.9; skew-x: -2.4; skew-y: -6.7; scale-x: 0.835; scale-y: 0.805; }
        frame 42 { x: 16.3; y: 29.6; skew-x: -6.4; skew-y: -9.5; scale-x: 0.834; scale-y: 0.806; }
        frame 43 { x: 15.9; y: 30.1; skew-x: -10.5; skew-y: -12.4; scale-x: 0.833; scale-y: 0.807; }
        frame 44 { x: 15.8; y: 30.3; skew-x: -11.4; skew-y: -11.7; scale-x: 0.831; scale-y: 0.808; }
        frame 45 { x: 15.6; y: 30.5; skew-x: -12.4; skew-y: -11; scale-x: 0.83; scale-y: 0.809; }
        frame 46 { x: 15.5; y: 30.7; skew-x: -13.4; skew-y: -10.4; scale-x: 0.828; scale-y: 0.81; }
        frame 47 { x: 15.4; y: 30.8; skew-x: -14.4; skew-y: -9.7; scale-x: 0.827; scale-y: 0.812; }
        frame 48 { x: 15.2; y: 31.1; skew-x: -15.4; skew-y: -9; scale-x: 0.826; scale-y: 0.813; }
        frame 49 { x: 15.1; y: 31.2; skew-x: -16.4; skew-y: -8.4; scale-x: 0.824; scale-y: 0.815; }
        frame 50 { x: 15; y: 31.3; skew-x: -17.5; skew-y: -7.7; scale-x: 0.823; scale-y: 0.816; }
        frame 51 { x: 14.9; y: 31.6; skew-x: -18.5; skew-y: -7; scale-x: 0.822; scale-y: 0.817; }
        frame 52 { x: 14.7; y: 31.7; skew-x: -19.6; skew-y: -6.5; scale-x: 0.821; scale-y: 0.819; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 54 { cel: -10000; }
    }
    Track {
        source-name: "Imitater_blink";
        frame-count: 84;
        frame 0 { x: 26.9; y: 13.4; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_IMITATER_BLINK1; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_IMITATER_BLINK2; }
        frame 2 { image: IMAGE_REANIM_IMITATER_BLINK1; }
        frame 3 { cel: -1; image: none; }
        frame 4 { cel: -10000; }
    }
    Track {
        source-name: "Imitater_hat";
        frame-count: 84;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 15.8; y: -0.5; scale-x: 0.8; scale-y: 0.819; cel: 0; image: IMAGE_REANIM_IMITATER_HAT; }
        frame 4 { x: 15.2; y: -0.1; skew-x: -0.2; skew-y: -0.2; scale-x: 0.803; scale-y: 0.816; cel: -10000; image: none; }
        frame 5 { x: 14.5; y: 0.3; skew-x: -0.7; skew-y: -0.7; scale-x: 0.806; scale-y: 0.813; }
        frame 6 { x: 13.9; y: 0.8; skew-x: -1.2; skew-y: -1.2; scale-x: 0.808; scale-y: 0.81; }
        frame 7 { x: 13.3; y: 1.3; skew-x: -1.7; skew-y: -1.7; scale-x: 0.811; scale-y: 0.807; }
        frame 8 { x: 12.6; y: 1.7; skew-x: -2.2; skew-y: -2.2; scale-x: 0.814; scale-y: 0.804; }
        frame 9 { x: 12; y: 2.1; skew-x: -2.5; skew-y: -2.7; scale-x: 0.817; scale-y: 0.801; }
        frame 10 { x: 11.4; y: 2.6; skew-x: -2.9; skew-y: -3.2; scale-x: 0.82; scale-y: 0.797; }
        frame 11 { x: 10.7; y: 3.1; skew-x: -3.4; skew-y: -3.7; scale-x: 0.822; scale-y: 0.794; }
        frame 12 { x: 10.1; y: 3.6; skew-x: -3.9; skew-y: -4.2; scale-x: 0.825; scale-y: 0.791; }
        frame 13 { x: 9.5; y: 4.1; skew-x: -4.4; skew-y: -4.9; scale-x: 0.828; scale-y: 0.788; }
        frame 14 { x: 9.8; y: -10000; skew-x: -4.2; skew-y: -4.5; scale-x: 0.831; scale-y: 0.781; }
        frame 15 { x: 9.9; skew-x: -3.9; skew-y: -4.2; scale-x: 0.835; scale-y: 0.775; }
        frame 16 { x: 10.2; y: 4.2; skew-x: -3.7; skew-y: -3.9; scale-x: 0.839; scale-y: 0.768; }
        frame 17 { x: 10.4; y: 4.1; skew-x: -3.4; skew-y: -3.7; scale-x: 0.842; scale-y: 0.762; }
        frame 18 { x: 10.7; y: 4.2; skew-x: -3.2; skew-y: -3.4; scale-x: 0.846; scale-y: 0.755; }
        frame 19 { x: 11; y: 4.1; skew-x: -2.9; skew-y: -3.2; scale-x: 0.849; scale-y: 0.749; }
        frame 20 { x: 11.6; y: 3.4; skew-x: -2.4; skew-y: -2.7; scale-x: 0.843; scale-y: 0.757; }
        frame 21 { x: 12.3; y: 2.9; skew-x: -2.2; skew-y: -2.2; scale-x: 0.837; scale-y: 0.766; }
        frame 22 { x: 12.8; y: 2.3; skew-x: -1.7; skew-y: -1.9; scale-x: 0.831; scale-y: 0.775; }
        frame 23 { x: 13.5; y: 1.7; skew-x: -1.4; skew-y: -1.4; scale-x: 0.825; scale-y: 0.784; }
        frame 24 { x: 14.1; y: 1.1; skew-x: -0.9; skew-y: -1; scale-x: 0.818; scale-y: 0.793; }
        frame 25 { x: 14.7; y: 0.5; skew-x: -0.7; skew-y: -0.7; scale-x: 0.812; scale-y: 0.802; }
        frame 26 { x: 15.4; y: -0; skew-x: -0.2; skew-y: -0.2; scale-x: 0.806; scale-y: 0.811; }
        frame 27 { x: 15.8; y: -0.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.819; }
        frame 28 { x: 16.5; y: -10000; skew-x: 0.5; skew-y: 0.5; scale-x: 0.803; scale-y: 0.818; }
        frame 29 { x: 17.2; y: -0.6; skew-x: 1; skew-y: 1.3; scale-x: 0.806; scale-y: 0.816; }
        frame 30 { x: 17.8; y: -10000; skew-x: 1.6; skew-y: 1.8; scale-x: 0.809; scale-y: 0.814; }
        frame 31 { x: 18.6; y: -0.7; skew-x: 2.3; skew-y: 2.5; scale-x: 0.812; scale-y: 0.813; }
        frame 32 { x: 19.3; y: -0.8; skew-x: 2.8; skew-y: 3; scale-x: 0.814; scale-y: 0.811; }
        frame 33 { x: 20; y: -0.9; skew-x: 3.3; skew-y: 3.8; scale-x: 0.817; scale-y: 0.809; }
        frame 34 { x: 20.6; y: -10000; skew-x: 3.8; skew-y: 4.3; scale-x: 0.82; scale-y: 0.807; }
        frame 35 { x: 21.3; y: -1; skew-x: 4.5; skew-y: 5; scale-x: 0.823; scale-y: 0.806; }
        frame 36 { x: 22; y: -1.1; skew-x: 5; skew-y: 5.6; scale-x: 0.826; scale-y: 0.804; }
        frame 37 { x: 22.7; y: -1.2; skew-x: 5.7; skew-y: 6.4; scale-x: 0.829; scale-y: 0.803; }
        frame 38 { x: 22.2; y: -0.9; skew-x: 5.3; skew-y: 5.8; scale-x: 0.833; scale-y: 0.795; }
        frame 39 { x: 21.7; y: -0.6; skew-x: 5; skew-y: 5.5; scale-x: 0.837; scale-y: 0.787; }
        frame 40 { x: 21.2; y: -0.4; skew-x: 4.6; skew-y: 5.1; scale-x: 0.841; scale-y: 0.78; }
        frame 41 { x: 20.7; y: -0.1; skew-x: 4.3; skew-y: 4.8; scale-x: 0.845; scale-y: 0.772; }
        frame 42 { x: 20.1; y: 0; skew-x: 4; skew-y: 4.3; scale-x: 0.849; scale-y: 0.765; }
        frame 43 { x: 19.6; y: 0.2; skew-x: 3.8; skew-y: 4.1; scale-x: 0.854; scale-y: 0.757; }
        frame 44 { x: 19.2; y: -10000; skew-x: 3.3; skew-y: 3.5; scale-x: 0.848; scale-y: 0.764; }
        frame 45 { x: 18.8; y: 0.1; skew-x: 2.8; skew-y: 3; scale-x: 0.842; scale-y: 0.771; }
        frame 46 { x: 18.3; y: 0; skew-x: 2.5; skew-y: 2.6; scale-x: 0.836; scale-y: 0.778; }
        frame 47 { x: 17.9; y: -0; skew-x: 2; skew-y: 2.3; scale-x: 0.83; scale-y: 0.785; }
        frame 48 { x: 17.5; y: -0.1; skew-x: 1.5; skew-y: 1.8; scale-x: 0.824; scale-y: 0.792; }
        frame 49 { x: 17; y: -0.2; skew-x: 1.3; skew-y: 1.3; scale-x: 0.818; scale-y: 0.799; }
        frame 50 { x: 16.5; y: -0.3; skew-x: 0.8; skew-y: 0.8; scale-x: 0.812; scale-y: 0.805; }
        frame 51 { x: 16.2; y: -0.4; skew-x: 0.3; skew-y: 0.3; scale-x: 0.806; scale-y: 0.812; }
        frame 52 { x: 15.8; y: -0.5; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.819; }
        frame 53 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 54 { cel: -10000; }
    }
    Track {
        source-name: "Imitater_spin";
        frame-count: 84;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 53 { x: 14.2; y: -3.8; scale-x: 0.801; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_IMITATER_SPIN1; }
        frame 54 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_IMITATER_SPIN2; }
        frame 55 { image: IMAGE_REANIM_IMITATER_SPIN3; }
        frame 56 { image: IMAGE_REANIM_IMITATER_SPIN4; }
        frame 57 { image: IMAGE_REANIM_IMITATER_SPIN5; }
        frame 58 { image: IMAGE_REANIM_IMITATER_SPIN6; }
        frame 59 { image: IMAGE_REANIM_IMITATER_SPIN1; }
        frame 60 { image: IMAGE_REANIM_IMITATER_SPIN2; }
        frame 61 { image: IMAGE_REANIM_IMITATER_SPIN3; }
        frame 62 { image: IMAGE_REANIM_IMITATER_SPIN4; }
        frame 63 { image: IMAGE_REANIM_IMITATER_SPIN5; }
        frame 64 { image: IMAGE_REANIM_IMITATER_SPIN6; }
        frame 65 { image: IMAGE_REANIM_IMITATER_SPIN1; }
        frame 66 { image: IMAGE_REANIM_IMITATER_SPIN2; }
        frame 67 { image: IMAGE_REANIM_IMITATER_SPIN3; }
        frame 68 { image: IMAGE_REANIM_IMITATER_SPIN4; }
        frame 69 { image: IMAGE_REANIM_IMITATER_SPIN5; }
        frame 70 { image: IMAGE_REANIM_IMITATER_SPIN6; }
        frame 71 { image: IMAGE_REANIM_IMITATER_SPIN1; }
        frame 72 { image: IMAGE_REANIM_IMITATER_SPIN2; }
        frame 73 { image: IMAGE_REANIM_IMITATER_SPIN3; }
        frame 74 { image: IMAGE_REANIM_IMITATER_SPIN4; }
        frame 75 { image: IMAGE_REANIM_IMITATER_SPIN5; }
        frame 76 { image: IMAGE_REANIM_IMITATER_SPIN6; }
        frame 77 { image: IMAGE_REANIM_IMITATER_SPIN1; }
        frame 78 { image: IMAGE_REANIM_IMITATER_SPIN2; }
        frame 79 { image: IMAGE_REANIM_IMITATER_SPIN3; }
        frame 80 { image: IMAGE_REANIM_IMITATER_SPIN4; }
        frame 81 { image: IMAGE_REANIM_IMITATER_SPIN5; }
        frame 82 { image: IMAGE_REANIM_IMITATER_SPIN6; }
        frame 83 { image: IMAGE_REANIM_IMITATER_SPIN1; }
    }
    Track {
        source-name: "Imitater_explode";
        frame-count: 84;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
    }
}
