export component Zombie_boss_fireball {
    fps: 12;
    Track {
        source-name: "anim_form";
        frame-count: 73;
        frame 16 { cel: -1; }
        frame 17 { cel: -10000; }
    }
    Track {
        source-name: "anim_role";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 16 { cel: 0; }
        frame 17 { cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 16 { x: -156.8; y: 51; scale-x: 2; scale-y: 2; cel: 0; }
        frame 17 { x: -138.3; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 18 { x: -119.8; }
        frame 19 { x: -101.3; }
        frame 20 { x: -82.8; }
        frame 21 { x: -64.2; }
        frame 22 { x: -45.7; }
        frame 23 { x: -27.2; }
        frame 24 { x: -8.7; }
        frame 25 { x: 9.7; }
        frame 26 { x: 28.3; }
        frame 27 { x: 46.8; }
        frame 28 { x: 65.3; }
        frame 29 { x: 83.8; }
        frame 30 { x: 102.3; }
        frame 31 { x: 120.8; }
        frame 32 { x: 139.4; }
        frame 33 { x: 157.9; }
        frame 34 { x: 176.4; }
        frame 35 { x: 194.9; }
        frame 36 { x: 213.5; }
        frame 37 { x: 232; }
        frame 38 { x: 250.5; }
        frame 39 { x: 269; }
        frame 40 { x: 287.5; }
        frame 41 { x: 306; }
        frame 42 { x: 324.6; }
        frame 43 { x: 343.1; }
        frame 44 { x: 361.6; }
        frame 45 { x: 380.1; }
        frame 46 { x: 398.6; }
        frame 47 { x: 417.2; }
        frame 48 { x: 435.7; }
        frame 49 { x: 454.2; }
        frame 50 { x: 472.7; }
        frame 51 { x: 491.2; }
        frame 52 { x: 509.7; }
        frame 53 { x: 528.3; }
        frame 54 { x: 546.8; }
        frame 55 { x: 565.3; }
        frame 56 { x: 583.8; }
        frame 57 { x: 602.3; }
        frame 58 { x: 620.9; }
        frame 59 { x: 639.4; }
        frame 60 { x: 657.9; }
        frame 61 { x: 676.4; }
        frame 62 { x: 694.9; }
        frame 63 { x: 713.5; }
        frame 64 { x: 732; }
        frame 65 { x: 750.5; }
        frame 66 { x: 769; }
        frame 67 { x: 787.5; }
        frame 68 { x: 806; }
        frame 69 { x: 824.5; }
        frame 70 { x: 843; }
        frame 71 { x: 861.6; }
        frame 72 { x: 880.1; }
    }
    Track {
        source-name: "Layer 47";
        frame-count: 73;
        frame 0 { x: 90.8; y: 180.2; scale-x: 0.098; scale-y: 0.098; alpha: 0.25; image: IMAGE_REANIM_ZOMBIE_BOSS_ICEFIRE_SHADOW; }
        frame 1 { x: 87; y: 178.2; scale-x: 0.152; scale-y: 0.152; alpha: -10000; image: none; }
        frame 2 { x: 83.1; y: 176.2; scale-x: 0.205; scale-y: 0.205; }
        frame 3 { x: 79.2; y: 174.2; scale-x: 0.259; scale-y: 0.259; }
        frame 4 { x: 75.3; y: 172.2; scale-x: 0.312; scale-y: 0.312; }
        frame 5 { x: 71.5; y: 170.2; scale-x: 0.366; scale-y: 0.366; }
        frame 6 { x: 67.6; y: 168.2; scale-x: 0.419; scale-y: 0.419; }
        frame 7 { x: 63.8; y: 166.1; scale-x: 0.472; scale-y: 0.472; }
        frame 8 { x: 60; y: 164.1; scale-x: 0.526; scale-y: 0.526; }
        frame 9 { x: 56; y: 162.1; scale-x: 0.579; scale-y: 0.579; }
        frame 10 { x: 52.2; y: 160.2; scale-x: 0.633; scale-y: 0.633; }
        frame 11 { x: 48.3; y: 158.1; scale-x: 0.686; scale-y: 0.686; }
        frame 12 { x: 44.5; y: 156.1; scale-x: 0.74; scale-y: 0.74; }
        frame 13 { x: 40.6; y: 154.1; scale-x: 0.793; scale-y: 0.793; }
        frame 14 { x: 36.8; y: 152.1; scale-x: 0.847; scale-y: 0.847; }
        frame 15 { x: 32.8; y: 150.2; scale-x: 0.9; scale-y: 0.9; }
        frame 16 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "fireball";
        frame-count: 73;
        frame 0 { x: 90; y: 166.2; scale-x: 0.109; scale-y: 0.109; image: IMAGE_REANIM_ZOMBIE_BOSS_FIREBALL; }
        frame 1 { x: 85.3; y: 156.8; scale-x: 0.165; scale-y: 0.165; image: none; }
        frame 2 { x: 80.7; y: 147.5; scale-x: 0.22; scale-y: 0.22; }
        frame 3 { x: 76; y: 138.1; scale-x: 0.276; scale-y: 0.276; }
        frame 4 { x: 71.3; y: 128.8; scale-x: 0.332; scale-y: 0.332; }
        frame 5 { x: 66.7; y: 119.3; scale-x: 0.387; scale-y: 0.387; }
        frame 6 { x: 62; y: 110; scale-x: 0.443; scale-y: 0.443; }
        frame 7 { x: 57.4; y: 100.7; scale-x: 0.499; scale-y: 0.499; }
        frame 8 { x: 52.7; y: 91.3; scale-x: 0.555; scale-y: 0.555; }
        frame 9 { x: 48; y: 82; scale-x: 0.61; scale-y: 0.61; }
        frame 10 { x: 43.4; y: 72.6; scale-x: 0.666; scale-y: 0.666; }
        frame 11 { x: 38.7; y: 63.3; scale-x: 0.722; scale-y: 0.722; }
        frame 12 { x: 34.1; y: 53.9; scale-x: 0.777; scale-y: 0.777; }
        frame 13 { x: 29.5; y: 44.5; scale-x: 0.833; scale-y: 0.833; }
        frame 14 { x: 24.7; y: 35.1; scale-x: 0.889; scale-y: 0.889; }
        frame 15 { x: 20.1; y: 25.8; scale-x: 0.944; scale-y: 0.944; }
        frame 16 { x: 15.4; y: 16.4; scale-x: 1; scale-y: 1; }
        frame 17 { x: -0.9; y: 37.3; skew-x: -12.7; skew-y: -12.7; scale-x: 0.999; scale-y: 0.999; }
        frame 18 { x: -12.5; y: 61.1; skew-x: -25.5; skew-y: -25.5; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -18.5; y: 87.6; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998; scale-y: 0.998; }
        frame 20 { x: -10000; y: 114.2; skew-x: -51.3; skew-y: -51.3; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -12.5; y: 140.5; skew-x: -64.3; skew-y: -64.3; scale-x: 0.999; scale-y: 0.999; }
        frame 22 { x: -1; y: 164.5; skew-x: -77.1; skew-y: -77.1; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 15.4; y: 185.3; skew-x: -89.9; skew-y: -89.9; scale-x: 1; scale-y: 1; }
        frame 24 { x: 36.3; y: 201.9; skew-x: -102.7; skew-y: -102.7; scale-x: 0.999; scale-y: 0.999; }
        frame 25 { x: 60.2; y: 213.3; skew-x: -115.5; skew-y: -115.5; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 86.6; y: 219.4; skew-x: -128.5; skew-y: -128.5; scale-x: 0.998; scale-y: 0.998; }
        frame 27 { x: 113.2; y: -10000; skew-x: -141.3; skew-y: -141.3; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 139.5; y: 213.4; skew-x: -154.3; skew-y: -154.3; scale-x: 0.999; scale-y: 0.999; }
        frame 29 { x: 163.5; y: 201.9; skew-x: -167.1; skew-y: -167.1; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 184.3; y: 185.3; skew-x: -179.9; skew-y: -179.9; scale-x: 1; scale-y: 1; }
        frame 31 { x: 200.9; y: 164.5; skew-x: -192.7; skew-y: -192.7; scale-x: 0.999; scale-y: 0.999; }
        frame 32 { x: 212.4; y: 140.5; skew-x: -205.5; skew-y: -205.5; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 218.4; y: 114.2; skew-x: -218.5; skew-y: -218.5; scale-x: 0.998; scale-y: 0.998; }
        frame 34 { x: 218.3; y: 87.6; skew-x: -231.3; skew-y: -231.3; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 212.4; y: 61.3; skew-x: -244.3; skew-y: -244.3; scale-x: 0.999; scale-y: 0.999; }
        frame 36 { x: 200.8; y: 37.3; skew-x: -257.1; skew-y: -257.1; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 184.3; y: 16.4; skew-x: -269.9; skew-y: -269.9; scale-x: 1; scale-y: 1; }
        frame 38 { x: 163.5; y: 0; skew-x: -282.7; skew-y: -282.7; scale-x: 0.999; scale-y: 0.999; }
        frame 39 { x: 139.5; y: -11.5; skew-x: -295.5; skew-y: -295.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 113.2; y: -17.4; skew-x: -308.5; skew-y: -308.5; scale-x: 0.998; scale-y: 0.998; }
        frame 41 { x: 86.5; y: -17.5; skew-x: -321.3; skew-y: -321.3; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 60.2; y: -11.5; skew-x: -334.3; skew-y: -334.3; scale-x: 0.999; scale-y: 0.999; }
        frame 43 { x: 36.2; y: 0; skew-x: -347.1; skew-y: -347.1; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 15.4; y: 16.4; skew-x: -359.9; skew-y: -359.9; scale-x: 1; scale-y: 1; }
        frame 45 { x: -0.9; y: 37.3; skew-x: -372.7; skew-y: -372.7; scale-x: 0.999; scale-y: 0.999; }
        frame 46 { x: -12.5; y: 61.1; skew-x: -385.5; skew-y: -385.5; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: -18.5; y: 87.6; skew-x: -398.5; skew-y: -398.5; scale-x: 0.998; scale-y: 0.998; }
        frame 48 { x: -10000; y: 114.2; skew-x: -411.3; skew-y: -411.3; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: -12.5; y: 140.5; skew-x: -424.3; skew-y: -424.3; scale-x: 0.999; scale-y: 0.999; }
        frame 50 { x: -1; y: 164.5; skew-x: -437.1; skew-y: -437.1; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 15.4; y: 185.3; skew-x: -449.9; skew-y: -449.9; scale-x: 1; scale-y: 1; }
        frame 52 { x: 36.3; y: 201.9; skew-x: -462.7; skew-y: -462.7; scale-x: 0.999; scale-y: 0.999; }
        frame 53 { x: 60.2; y: 213.3; skew-x: -475.5; skew-y: -475.5; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 86.6; y: 219.4; skew-x: -488.5; skew-y: -488.5; scale-x: 0.998; scale-y: 0.998; }
        frame 55 { x: 113.2; y: -10000; skew-x: -501.3; skew-y: -501.3; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 139.5; y: 213.4; skew-x: -514.3; skew-y: -514.3; scale-x: 0.999; scale-y: 0.999; }
        frame 57 { x: 163.5; y: 201.9; skew-x: -527.1; skew-y: -527.1; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 184.3; y: 185.3; skew-x: -539.9; skew-y: -539.9; scale-x: 1; scale-y: 1; }
        frame 59 { x: 200.9; y: 164.5; skew-x: -552.7; skew-y: -552.7; scale-x: 0.999; scale-y: 0.999; }
        frame 60 { x: 212.4; y: 140.5; skew-x: -565.5; skew-y: -565.5; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 218.4; y: 114.2; skew-x: -578.5; skew-y: -578.5; scale-x: 0.998; scale-y: 0.998; }
        frame 62 { x: 218.3; y: 87.6; skew-x: -591.3; skew-y: -591.3; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 212.4; y: 61.3; skew-x: -604.3; skew-y: -604.3; scale-x: 0.999; scale-y: 0.999; }
        frame 64 { x: 200.8; y: 37.3; skew-x: -617.1; skew-y: -617.1; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 184.3; y: 16.4; skew-x: -629.9; skew-y: -629.9; scale-x: 1; scale-y: 1; }
        frame 66 { x: 163.5; y: 0; skew-x: -642.7; skew-y: -642.7; scale-x: 0.999; scale-y: 0.999; }
        frame 67 { x: 139.5; y: -11.5; skew-x: -655.5; skew-y: -655.5; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 113.2; y: -17.4; skew-x: -668.5; skew-y: -668.5; scale-x: 0.998; scale-y: 0.998; }
        frame 69 { x: 86.5; y: -17.5; skew-x: -681.3; skew-y: -681.3; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 60.2; y: -11.5; skew-x: -694.3; skew-y: -694.3; scale-x: 0.999; scale-y: 0.999; }
        frame 71 { x: 36.2; y: 0; skew-x: -707.1; skew-y: -707.1; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 15.4; y: 16.4; skew-x: -719.9; skew-y: -719.9; scale-x: 1; scale-y: 1; }
    }
    Track {
        source-name: "fireball_chunks";
        frame-count: 73;
        frame 0 { x: 90; y: 166.2; scale-x: 0.109; scale-y: 0.109; image: IMAGE_REANIM_ZOMBIE_BOSS_FIREBALL_CHUNKS; }
        frame 1 { x: 85.3; y: 156.8; scale-x: 0.165; scale-y: 0.165; image: none; }
        frame 2 { x: 80.7; y: 147.5; scale-x: 0.22; scale-y: 0.22; }
        frame 3 { x: 76; y: 138.1; scale-x: 0.276; scale-y: 0.276; }
        frame 4 { x: 71.3; y: 128.8; scale-x: 0.332; scale-y: 0.332; }
        frame 5 { x: 66.7; y: 119.3; scale-x: 0.387; scale-y: 0.387; }
        frame 6 { x: 62; y: 110; scale-x: 0.443; scale-y: 0.443; }
        frame 7 { x: 57.4; y: 100.7; scale-x: 0.499; scale-y: 0.499; }
        frame 8 { x: 52.7; y: 91.3; scale-x: 0.555; scale-y: 0.555; }
        frame 9 { x: 48; y: 82; scale-x: 0.61; scale-y: 0.61; }
        frame 10 { x: 43.4; y: 72.6; scale-x: 0.666; scale-y: 0.666; }
        frame 11 { x: 38.7; y: 63.3; scale-x: 0.722; scale-y: 0.722; }
        frame 12 { x: 34.1; y: 53.9; scale-x: 0.777; scale-y: 0.777; }
        frame 13 { x: 29.5; y: 44.5; scale-x: 0.833; scale-y: 0.833; }
        frame 14 { x: 24.7; y: 35.1; scale-x: 0.889; scale-y: 0.889; }
        frame 15 { x: 20.1; y: 25.8; scale-x: 0.944; scale-y: 0.944; }
        frame 16 { x: 15.4; y: 16.4; scale-x: 1; scale-y: 1; }
        frame 17 { x: 6.7; y: 26.2; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -0.9; y: 37.3; skew-x: -12.7; skew-y: -12.7; scale-x: 0.999; scale-y: 0.999; }
        frame 19 { x: -7.5; y: 49; skew-x: -19.2; skew-y: -19.2; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: -12.5; y: 61.1; skew-x: -25.5; skew-y: -25.5; }
        frame 21 { x: -16.2; y: 74.2; skew-x: -32; skew-y: -32; }
        frame 22 { x: -18.5; y: 87.6; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998; scale-y: 0.998; }
        frame 23 { x: -19.4; y: 100.8; skew-x: -44.9; skew-y: -44.9; scale-x: 1; scale-y: 1; }
        frame 24 { x: -18.5; y: 114.2; skew-x: -51.3; skew-y: -51.3; scale-x: 0.998; scale-y: 0.998; }
        frame 25 { x: -16.2; y: 127.5; skew-x: -57.8; skew-y: -57.8; scale-x: 0.999; scale-y: 0.999; }
        frame 26 { x: -12.5; y: 140.5; skew-x: -64.3; skew-y: -64.3; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -7.5; y: 152.7; skew-x: -70.6; skew-y: -70.6; }
        frame 28 { x: -1; y: 164.5; skew-x: -77.1; skew-y: -77.1; }
        frame 29 { x: 6.7; y: 175.5; skew-x: -83.6; skew-y: -83.6; scale-x: 1; scale-y: 1; }
        frame 30 { x: 15.4; y: 185.3; skew-x: -89.9; skew-y: -89.9; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 25.2; y: 194; skew-x: -96.2; skew-y: -96.2; }
        frame 32 { x: 36.3; y: 201.9; skew-x: -102.7; skew-y: -102.7; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: 48; y: 208.4; skew-x: -109.2; skew-y: -109.2; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 60.2; y: 213.3; skew-x: -115.5; skew-y: -115.5; }
        frame 35 { x: 73.3; y: 217.1; skew-x: -122; skew-y: -122; }
        frame 36 { x: 86.6; y: 219.4; skew-x: -128.5; skew-y: -128.5; scale-x: 0.998; scale-y: 0.998; }
        frame 37 { x: 99.9; y: 220.3; skew-x: -134.9; skew-y: -134.9; scale-x: 1; scale-y: 1; }
        frame 38 { x: 113.2; y: 219.4; skew-x: -141.3; skew-y: -141.3; scale-x: 0.998; scale-y: 0.998; }
        frame 39 { x: 126.5; y: 217.1; skew-x: -147.8; skew-y: -147.8; scale-x: 0.999; scale-y: 0.999; }
        frame 40 { x: 139.5; y: 213.4; skew-x: -154.3; skew-y: -154.3; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 151.7; y: 208.4; skew-x: -160.6; skew-y: -160.6; }
        frame 42 { x: 163.5; y: 201.9; skew-x: -167.1; skew-y: -167.1; }
        frame 43 { x: 174.5; y: 194; skew-x: -173.6; skew-y: -173.6; scale-x: 1; scale-y: 1; }
        frame 44 { x: 184.3; y: 185.3; skew-x: -179.9; skew-y: -179.9; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 193; y: 175.5; skew-x: -186.2; skew-y: -186.2; }
        frame 46 { x: 200.9; y: 164.5; skew-x: -192.7; skew-y: -192.7; scale-x: 0.999; scale-y: 0.999; }
        frame 47 { x: 207.4; y: 152.7; skew-x: -199.2; skew-y: -199.2; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 212.4; y: 140.5; skew-x: -205.5; skew-y: -205.5; }
        frame 49 { x: 216.1; y: 127.5; skew-x: -212; skew-y: -212; }
        frame 50 { x: 218.4; y: 114.2; skew-x: -218.5; skew-y: -218.5; scale-x: 0.998; scale-y: 0.998; }
        frame 51 { x: 219.3; y: 100.9; skew-x: -224.9; skew-y: -224.9; scale-x: 1; scale-y: 1; }
        frame 52 { x: 218.3; y: 87.6; skew-x: -231.3; skew-y: -231.3; scale-x: 0.998; scale-y: 0.998; }
        frame 53 { x: 216.1; y: 74.2; skew-x: -237.8; skew-y: -237.8; scale-x: 0.999; scale-y: 0.999; }
        frame 54 { x: 212.4; y: 61.3; skew-x: -244.3; skew-y: -244.3; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 207.4; y: 49; skew-x: -250.6; skew-y: -250.6; }
        frame 56 { x: 200.8; y: 37.3; skew-x: -257.1; skew-y: -257.1; }
        frame 57 { x: 193; y: 26.2; skew-x: -263.6; skew-y: -263.6; scale-x: 1; scale-y: 1; }
        frame 58 { x: 184.3; y: 16.4; skew-x: -269.9; skew-y: -269.9; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 174.5; y: 7.7; skew-x: -276.2; skew-y: -276.2; }
        frame 60 { x: 163.5; y: 0; skew-x: -282.7; skew-y: -282.7; scale-x: 0.999; scale-y: 0.999; }
        frame 61 { x: 151.7; y: -6.5; skew-x: -289.2; skew-y: -289.2; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 139.5; y: -11.5; skew-x: -295.5; skew-y: -295.5; }
        frame 63 { x: 126.5; y: -15.2; skew-x: -302; skew-y: -302; }
        frame 64 { x: 113.2; y: -17.4; skew-x: -308.5; skew-y: -308.5; scale-x: 0.998; scale-y: 0.998; }
        frame 65 { x: 99.8; y: -18.4; skew-x: -314.9; skew-y: -314.9; scale-x: 1; scale-y: 1; }
        frame 66 { x: 86.5; y: -17.5; skew-x: -321.3; skew-y: -321.3; scale-x: 0.998; scale-y: 0.998; }
        frame 67 { x: 73.2; y: -15.2; skew-x: -327.8; skew-y: -327.8; scale-x: 0.999; scale-y: 0.999; }
        frame 68 { x: 60.2; y: -11.5; skew-x: -334.3; skew-y: -334.3; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 48; y: -6.5; skew-x: -340.6; skew-y: -340.6; }
        frame 70 { x: 36.2; y: 0; skew-x: -347.1; skew-y: -347.1; }
        frame 71 { x: 25.2; y: 7.7; skew-x: -353.6; skew-y: -353.6; scale-x: 1; scale-y: 1; }
        frame 72 { x: 15.4; y: 16.4; skew-x: -359.9; skew-y: -359.9; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "multiply";
        frame-count: 73;
        frame 0 { x: 89.7; y: 165.9; scale-x: 0.11; scale-y: 0.11; image: IMAGE_REANIM_ZOMBIE_BOSS_FIREBALL_MULTIPLY; }
        frame 1 { x: 85.7; y: 157.4; scale-x: 0.16; scale-y: 0.16; image: none; }
        frame 2 { x: 81.6; y: 148.9; scale-x: 0.21; scale-y: 0.21; }
        frame 3 { x: 77.6; y: 140.4; scale-x: 0.26; scale-y: 0.26; }
        frame 4 { x: 73.4; y: 131.9; scale-x: 0.31; scale-y: 0.31; }
        frame 5 { x: 69.4; y: 123.4; scale-x: 0.36; scale-y: 0.36; }
        frame 6 { x: 65.3; y: 114.8; scale-x: 0.41; scale-y: 0.41; }
        frame 7 { x: 61.2; y: 106.4; scale-x: 0.46; scale-y: 0.46; }
        frame 8 { x: 57.2; y: 97.9; scale-x: 0.51; scale-y: 0.51; }
        frame 9 { x: 53.1; y: 89.5; scale-x: 0.56; scale-y: 0.56; }
        frame 10 { x: 49; y: 81; scale-x: 0.61; scale-y: 0.61; }
        frame 11 { x: 45; y: 72.5; scale-x: 0.66; scale-y: 0.66; }
        frame 12 { x: 40.9; y: 64; scale-x: 0.71; scale-y: 0.71; }
        frame 13 { x: 36.8; y: 55.4; scale-x: 0.76; scale-y: 0.76; }
        frame 14 { x: 32.8; y: 47; scale-x: 0.81; scale-y: 0.81; }
        frame 15 { x: 28.7; y: 38.5; scale-x: 0.86; scale-y: 0.86; }
        frame 16 { x: 24.7; y: 30.5; scale-x: 0.91; scale-y: 0.91; }
        frame 17 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "additive";
        frame-count: 73;
        frame 0 { x: 90.3; y: 166.5; scale-x: 0.105; scale-y: 0.105; image: IMAGE_REANIM_ZOMBIE_BOSS_FIREBALL_ADDITIVE; }
        frame 1 { x: 85.7; y: 157.3; scale-x: 0.158; scale-y: 0.159; image: none; }
        frame 2 { x: 81.2; y: 148.1; scale-x: 0.211; scale-y: 0.213; }
        frame 3 { x: 76.7; y: 138.9; scale-x: 0.265; scale-y: 0.266; }
        frame 4 { x: 72.2; y: 129.7; scale-x: 0.318; scale-y: 0.32; }
        frame 5 { x: 67.7; y: 120.5; scale-x: 0.372; scale-y: 0.374; }
        frame 6 { x: 63.1; y: 111.3; scale-x: 0.425; scale-y: 0.427; }
        frame 7 { x: 58.6; y: 102.1; scale-x: 0.479; scale-y: 0.481; }
        frame 8 { x: 54; y: 92.9; scale-x: 0.532; scale-y: 0.535; }
        frame 9 { x: 49.5; y: 83.7; scale-x: 0.585; scale-y: 0.588; }
        frame 10 { x: 45; y: 74.5; scale-x: 0.639; scale-y: 0.642; }
        frame 11 { x: 40.5; y: 65.3; scale-x: 0.692; scale-y: 0.696; }
        frame 12 { x: 36; y: 56; scale-x: 0.746; scale-y: 0.75; }
        frame 13 { x: 31.4; y: 46.9; scale-x: 0.799; scale-y: 0.803; }
        frame 14 { x: 26.9; y: 37.6; scale-x: 0.852; scale-y: 0.857; }
        frame 15 { x: 22.4; y: 28.5; scale-x: 0.906; scale-y: 0.911; }
        frame 16 { x: 18; y: 19.4; scale-x: 0.959; scale-y: 0.964; }
        frame 17 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "superglow";
        frame-count: 73;
        frame 0 { x: 85.1; y: 161.4; scale-x: 0.1; scale-y: 0.1; image: IMAGE_REANIM_ZOMBIE_BOSS_FIREBALL_SUPERGLOW; }
        frame 1 { x: 76.3; y: 147.9; scale-x: 0.161; scale-y: 0.161; image: none; }
        frame 2 { x: 67.4; y: 134.3; scale-x: 0.223; scale-y: 0.223; }
        frame 3 { x: 58.5; y: 120.8; scale-x: 0.284; scale-y: 0.284; }
        frame 4 { x: 49.6; y: 107.2; scale-x: 0.346; scale-y: 0.346; }
        frame 5 { x: 40.9; y: 93.6; scale-x: 0.407; scale-y: 0.407; }
        frame 6 { x: 32; y: 80.1; scale-x: 0.469; scale-y: 0.469; }
        frame 7 { x: 23.2; y: 66.5; scale-x: 0.53; scale-y: 0.53; }
        frame 8 { x: 14.3; y: 52.9; scale-x: 0.592; scale-y: 0.592; }
        frame 9 { x: 5.5; y: 39.4; scale-x: 0.653; scale-y: 0.653; }
        frame 10 { x: -3.3; y: 25.9; scale-x: 0.715; scale-y: 0.715; }
        frame 11 { x: -12.1; y: 12.3; scale-x: 0.776; scale-y: 0.776; }
        frame 12 { x: -21; y: -1.1; scale-x: 0.837; scale-y: 0.837; }
        frame 13 { x: -29.8; y: -14.7; scale-x: 0.899; scale-y: 0.899; }
        frame 14 { x: -38.6; y: -28.2; scale-x: 0.96; scale-y: 0.96; }
        frame 15 { x: -47.5; y: -41.8; scale-x: 1.022; scale-y: 1.022; }
        frame 16 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 17 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 18 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 19 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 20 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 21 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 22 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 23 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 24 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 25 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 26 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 27 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 28 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 29 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 30 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 31 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 32 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 33 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 34 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 35 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 36 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 37 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 38 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 39 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 40 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 41 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 42 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 43 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 44 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 45 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 46 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 47 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 48 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 49 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 50 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 51 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 52 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 53 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 54 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 55 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 56 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 57 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 58 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 59 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 60 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 61 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 62 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 63 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 64 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 65 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 66 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 67 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 68 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 69 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
        frame 70 { x: -51.5; y: -43.3; scale-x: 1.05; scale-y: 1; }
        frame 71 { x: -56.3; y: -55.3; scale-x: 1.083; scale-y: 1.083; }
        frame 72 { x: -44.3; y: -50.5; scale-x: 1; scale-y: 1.05; }
    }
}
