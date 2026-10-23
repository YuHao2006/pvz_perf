export component Zombie_boss_iceball {
    fps: 12;
    Track {
        source-name: "anim_form";
        frame-count: 76;
        frame 0 { cel: -1; }
        frame 1 { cel: 0; }
        frame 2 { cel: -10000; }
        frame 17 { cel: -1; }
        frame 18 { cel: -10000; }
    }
    Track {
        source-name: "anim_role";
        frame-count: 76;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 17 { cel: 0; }
        frame 18 { cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 76;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 17 { x: -156.8; y: 51; scale-x: 2; scale-y: 2; cel: 0; }
        frame 18 { x: -138.9; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 19 { x: -121; }
        frame 20 { x: -103.2; }
        frame 21 { x: -85.3; }
        frame 22 { x: -67.4; }
        frame 23 { x: -49.5; }
        frame 24 { x: -31.6; }
        frame 25 { x: -13.8; }
        frame 26 { x: 4; }
        frame 27 { x: 21.9; }
        frame 28 { x: 39.7; }
        frame 29 { x: 57.6; }
        frame 30 { x: 75.5; }
        frame 31 { x: 93.3; }
        frame 32 { x: 111.3; }
        frame 33 { x: 129.2; }
        frame 34 { x: 147; }
        frame 35 { x: 164.9; }
        frame 36 { x: 182.8; }
        frame 37 { x: 200.7; }
        frame 38 { x: 218.6; }
        frame 39 { x: 236.4; }
        frame 40 { x: 254.3; }
        frame 41 { x: 272.2; }
        frame 42 { x: 290.1; }
        frame 43 { x: 308; }
        frame 44 { x: 325.8; }
        frame 45 { x: 343.7; }
        frame 46 { x: 361.6; }
        frame 47 { x: 379.5; }
        frame 48 { x: 397.4; }
        frame 49 { x: 415.2; }
        frame 50 { x: 433.1; }
        frame 51 { x: 451; }
        frame 52 { x: 468.9; }
        frame 53 { x: 486.8; }
        frame 54 { x: 504.6; }
        frame 55 { x: 522.5; }
        frame 56 { x: 540.4; }
        frame 57 { x: 558.3; }
        frame 58 { x: 576.1; }
        frame 59 { x: 594; }
        frame 60 { x: 611.9; }
        frame 61 { x: 629.8; }
        frame 62 { x: 647.6; }
        frame 63 { x: 665.5; }
        frame 64 { x: 683.4; }
        frame 65 { x: 701.3; }
        frame 66 { x: 719.2; }
        frame 67 { x: 737; }
        frame 68 { x: 755; }
        frame 69 { x: 772.8; }
        frame 70 { x: 790.7; }
        frame 71 { x: 808.6; }
        frame 72 { x: 826.5; }
        frame 73 { x: 844.4; }
        frame 74 { x: 862.2; }
        frame 75 { x: 880.1; }
    }
    Track {
        source-name: "Layer 64";
        frame-count: 76;
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
        source-name: "iceball";
        frame-count: 76;
        frame 0 { x: 87.3; y: 161.4; scale-x: 0.128; scale-y: 0.128; image: IMAGE_REANIM_ZOMBIE_BOSS_ICEBALL; }
        frame 1 { x: 82.8; y: 151.9; scale-x: 0.183; scale-y: 0.183; image: none; }
        frame 2 { x: 78.2; y: 142.5; scale-x: 0.237; scale-y: 0.237; }
        frame 3 { x: 73.6; y: 133; scale-x: 0.292; scale-y: 0.292; }
        frame 4 { x: 69.1; y: 123.5; scale-x: 0.346; scale-y: 0.346; }
        frame 5 { x: 64.4; y: 114; scale-x: 0.401; scale-y: 0.401; }
        frame 6 { x: 59.9; y: 104.5; scale-x: 0.455; scale-y: 0.455; }
        frame 7 { x: 55.3; y: 95; scale-x: 0.51; scale-y: 0.51; }
        frame 8 { x: 50.7; y: 85.5; scale-x: 0.564; scale-y: 0.564; }
        frame 9 { x: 46.1; y: 76.1; scale-x: 0.619; scale-y: 0.619; }
        frame 10 { x: 41.5; y: 66.6; scale-x: 0.673; scale-y: 0.673; }
        frame 11 { x: 37; y: 57.1; scale-x: 0.728; scale-y: 0.728; }
        frame 12 { x: 32.4; y: 47.6; scale-x: 0.782; scale-y: 0.782; }
        frame 13 { x: 27.8; y: 38.1; scale-x: 0.837; scale-y: 0.837; }
        frame 14 { x: 23.2; y: 28.7; scale-x: 0.891; scale-y: 0.891; }
        frame 15 { x: 18.7; y: 19.2; scale-x: 0.946; scale-y: 0.946; }
        frame 16 { x: 13.9; y: 9.9; scale-x: 1; scale-y: 1; }
        frame 17 { x: -3.1; y: 31.5; skew-x: -12.7; skew-y: -12.7; scale-x: 0.999; scale-y: 0.999; }
        frame 18 { x: -15; y: 56.3; skew-x: -25.5; skew-y: -25.5; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -21.3; y: 83.6; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998; scale-y: 0.998; }
        frame 20 { x: -21.2; y: 111.1; skew-x: -51.3; skew-y: -51.3; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -15.1; y: 138.4; skew-x: -64.3; skew-y: -64.3; scale-x: 0.999; scale-y: 0.999; }
        frame 22 { x: -3.1; y: 163.2; skew-x: -77.1; skew-y: -77.1; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 13.9; y: 184.8; skew-x: -89.9; skew-y: -89.9; scale-x: 1; scale-y: 1; }
        frame 24 { x: 35.4; y: 202; skew-x: -102.7; skew-y: -102.7; scale-x: 0.999; scale-y: 0.999; }
        frame 25 { x: 60.3; y: 213.9; skew-x: -115.5; skew-y: -115.5; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 87.5; y: 220.1; skew-x: -128.5; skew-y: -128.5; scale-x: 0.998; scale-y: 0.998; }
        frame 27 { x: 115.1; y: -10000; skew-x: -141.3; skew-y: -141.3; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 142.3; y: 213.8; skew-x: -154.3; skew-y: -154.3; scale-x: 0.999; scale-y: 0.999; }
        frame 29 { x: 167.2; y: 201.9; skew-x: -167.1; skew-y: -167.1; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 188.8; y: 184.8; skew-x: -179.9; skew-y: -179.9; scale-x: 1; scale-y: 1; }
        frame 31 { x: 205.9; y: 163.3; skew-x: -192.7; skew-y: -192.7; scale-x: 0.999; scale-y: 0.999; }
        frame 32 { x: 217.8; y: 138.4; skew-x: -205.5; skew-y: -205.5; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 224; y: 111.2; skew-x: -218.5; skew-y: -218.5; scale-x: 0.998; scale-y: 0.998; }
        frame 34 { x: -10000; y: 83.6; skew-x: -231.3; skew-y: -231.3; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 217.8; y: 56.3; skew-x: -244.3; skew-y: -244.3; scale-x: 0.999; scale-y: 0.999; }
        frame 36 { x: 205.9; y: 31.4; skew-x: -257.1; skew-y: -257.1; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 188.8; y: 9.9; skew-x: -269.9; skew-y: -269.9; scale-x: 1; scale-y: 1; }
        frame 38 { x: 170; y: -5.3; skew-x: -281.1; skew-y: -281.1; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 148.7; y: -16.8; skew-x: -292.4; skew-y: -292.4; }
        frame 40 { x: 125.4; y: -23.7; skew-x: -303.7; skew-y: -303.7; }
        frame 41 { x: 101.3; y: -26.1; skew-x: -314.9; skew-y: -314.9; }
        frame 42 { x: 77.2; y: -23.8; skew-x: -326.1; skew-y: -326.1; }
        frame 43 { x: 54; y: -16.7; skew-x: -337.4; skew-y: -337.4; }
        frame 44 { x: 32.5; y: -5.3; skew-x: -348.7; skew-y: -348.7; }
        frame 45 { x: 13.9; y: 9.9; skew-x: -359.9; skew-y: -359.9; }
        frame 46 { x: -1.3; y: 28.6; skew-x: -371.1; skew-y: -371.1; }
        frame 47 { x: -12.8; y: 50; skew-x: -382.4; skew-y: -382.4; }
        frame 48 { x: -19.9; y: 73.3; skew-x: -393.7; skew-y: -393.7; }
        frame 49 { x: -22.2; y: 97.3; skew-x: -404.9; skew-y: -404.9; }
        frame 50 { x: -19.8; y: 121.5; skew-x: -416.1; skew-y: -416.1; }
        frame 51 { x: -12.8; y: 144.7; skew-x: -427.4; skew-y: -427.4; }
        frame 52 { x: -1.4; y: 166.1; skew-x: -438.7; skew-y: -438.7; }
        frame 53 { x: 13.9; y: 184.8; skew-x: -449.9; skew-y: -449.9; }
        frame 54 { x: 35.4; y: 202; skew-x: -462.7; skew-y: -462.7; scale-x: 0.999; scale-y: 0.999; }
        frame 55 { x: 60.3; y: 213.9; skew-x: -475.5; skew-y: -475.5; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 87.5; y: 220.1; skew-x: -488.5; skew-y: -488.5; scale-x: 0.998; scale-y: 0.998; }
        frame 57 { x: 115.1; y: -10000; skew-x: -501.3; skew-y: -501.3; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 142.3; y: 213.8; skew-x: -514.3; skew-y: -514.3; scale-x: 0.999; scale-y: 0.999; }
        frame 59 { x: 167.2; y: 201.9; skew-x: -527.1; skew-y: -527.1; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 188.8; y: 184.8; skew-x: -539.9; skew-y: -539.9; scale-x: 1; scale-y: 1; }
        frame 61 { x: 205.9; y: 163.3; skew-x: -552.7; skew-y: -552.7; scale-x: 0.999; scale-y: 0.999; }
        frame 62 { x: 217.8; y: 138.4; skew-x: -565.5; skew-y: -565.5; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 224; y: 111.2; skew-x: -578.5; skew-y: -578.5; scale-x: 0.998; scale-y: 0.998; }
        frame 64 { x: -10000; y: 83.6; skew-x: -591.3; skew-y: -591.3; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 217.8; y: 56.3; skew-x: -604.3; skew-y: -604.3; scale-x: 0.999; scale-y: 0.999; }
        frame 66 { x: 205.9; y: 31.4; skew-x: -617.1; skew-y: -617.1; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 188.8; y: 9.9; skew-x: -629.9; skew-y: -629.9; scale-x: 1; scale-y: 1; }
        frame 68 { x: 170; y: -5.3; skew-x: -641.1; skew-y: -641.1; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 148.7; y: -16.8; skew-x: -652.4; skew-y: -652.4; }
        frame 70 { x: 125.4; y: -23.7; skew-x: -663.7; skew-y: -663.7; }
        frame 71 { x: 101.3; y: -26.1; skew-x: -674.9; skew-y: -674.9; }
        frame 72 { x: 77.2; y: -23.8; skew-x: -686.1; skew-y: -686.1; }
        frame 73 { x: 54; y: -16.7; skew-x: -697.4; skew-y: -697.4; }
        frame 74 { x: 32.5; y: -5.3; skew-x: -708.7; skew-y: -708.7; }
        frame 75 { x: 13.9; y: 9.9; skew-x: -719.9; skew-y: -719.9; }
    }
    Track {
        source-name: "ice_crystal1";
        frame-count: 76;
        frame 0 { x: 89.3; y: 167; scale-x: 0.128; scale-y: 0.128; image: IMAGE_REANIM_ZOMBIE_BOSS_ICEBALL_CRYSTAL1; }
        frame 1 { x: 85.6; y: 159.9; scale-x: 0.183; scale-y: 0.183; image: none; }
        frame 2 { x: 81.8; y: 152.8; scale-x: 0.237; scale-y: 0.237; }
        frame 3 { x: 78.1; y: 145.7; scale-x: 0.292; scale-y: 0.292; }
        frame 4 { x: 74.3; y: 138.6; scale-x: 0.346; scale-y: 0.346; }
        frame 5 { x: 70.5; y: 131.5; scale-x: 0.401; scale-y: 0.401; }
        frame 6 { x: 66.7; y: 124.5; scale-x: 0.455; scale-y: 0.455; }
        frame 7 { x: 63; y: 117.3; scale-x: 0.51; scale-y: 0.51; }
        frame 8 { x: 59.3; y: 110.3; scale-x: 0.564; scale-y: 0.564; }
        frame 9 { x: 55.5; y: 103.2; scale-x: 0.619; scale-y: 0.619; }
        frame 10 { x: 51.8; y: 96.1; scale-x: 0.673; scale-y: 0.673; }
        frame 11 { x: 48; y: 89; scale-x: 0.728; scale-y: 0.728; }
        frame 12 { x: 44.3; y: 81.9; scale-x: 0.782; scale-y: 0.782; }
        frame 13 { x: 40.5; y: 74.8; scale-x: 0.837; scale-y: 0.837; }
        frame 14 { x: 36.7; y: 67.6; scale-x: 0.891; scale-y: 0.891; }
        frame 15 { x: 32.9; y: 60.6; scale-x: 0.946; scale-y: 0.946; }
        frame 16 { x: 29.4; y: 53.5; scale-x: 1; scale-y: 1; }
        frame 17 { x: 24.8; y: 64.3; skew-x: -19.2; skew-y: -19.2; scale-x: 0.999; scale-y: 0.999; }
        frame 18 { x: 21.9; y: 76.5; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998; scale-y: 0.998; }
        frame 19 { x: 21; y: 89; skew-x: -57.8; skew-y: -57.8; scale-x: 0.999; scale-y: 0.999; }
        frame 20 { x: 22.2; y: 101.3; skew-x: -77.1; skew-y: -77.1; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 25.2; y: 112.7; skew-x: -96.2; skew-y: -96.2; scale-x: 1; scale-y: 1; }
        frame 22 { x: 29.6; y: 122.6; skew-x: -115.5; skew-y: -115.5; scale-x: 0.999; scale-y: 0.999; }
        frame 23 { x: 35.1; y: 130.7; skew-x: -134.9; skew-y: -134.9; scale-x: 1; scale-y: 1; }
        frame 24 { x: 36.5; y: 135.5; skew-x: -128.5; skew-y: -128.5; scale-x: 0.998; scale-y: 0.998; }
        frame 25 { x: 37.7; y: 140.2; skew-x: -122; skew-y: -122; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 39.2; y: 144.6; skew-x: -115.5; skew-y: -115.5; scale-x: 0.999; scale-y: 0.999; }
        frame 27 { x: 40.7; y: 149; skew-x: -109.2; skew-y: -109.2; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 42.4; y: 153; skew-x: -102.7; skew-y: -102.7; }
        frame 29 { x: 44.1; y: 156.9; skew-x: -96.2; skew-y: -96.2; scale-x: 1; scale-y: 1; }
        frame 30 { x: 46.1; y: 160.6; skew-x: -89.9; skew-y: -89.9; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 53.8; y: 160; skew-x: -83.1; skew-y: -83.1; scale-x: 0.999; scale-y: 0.999; }
        frame 32 { x: 61.7; y: 159.1; skew-x: -76.3; skew-y: -76.3; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 69.8; y: 158.3; skew-x: -69.3; skew-y: -69.3; scale-x: 0.998; scale-y: 0.998; }
        frame 34 { x: 78.2; y: 157.4; skew-x: -62.6; skew-y: -62.6; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 86.8; y: 156.3; skew-x: -55.6; skew-y: -55.6; scale-x: 0.997; scale-y: 0.997; }
        frame 36 { x: 95.8; y: 155.3; skew-x: -48.8; skew-y: -48.8; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 104.9; y: 154.1; skew-x: -41.8; skew-y: -41.8; scale-x: 0.998; scale-y: 0.998; }
        frame 38 { x: 109.3; y: 156.4; skew-x: -59.1; skew-y: -59.1; scale-x: 0.997; scale-y: 0.997; }
        frame 39 { x: 115.1; y: 158.5; skew-x: -76.4; skew-y: -76.4; scale-x: 0.998; scale-y: 0.998; }
        frame 40 { x: 122.3; y: 159.9; skew-x: -93.4; skew-y: -93.4; scale-x: 0.999; scale-y: 0.999; }
        frame 41 { x: 131.1; y: 160.3; skew-x: -110.7; skew-y: -110.7; scale-x: 0.998; scale-y: 0.998; }
        frame 42 { x: 140.6; y: 159.2; skew-x: -128; skew-y: -128; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 150.4; y: 156.4; skew-x: -145.3; skew-y: -145.3; }
        frame 44 { x: 160.2; y: 152.1; skew-x: -162.6; skew-y: -162.6; scale-x: 0.999; scale-y: 0.999; }
        frame 45 { x: 169.5; y: 146.2; skew-x: -179.9; skew-y: -179.9; scale-x: 1; scale-y: 1; }
        frame 46 { x: 167.9; y: 138.9; skew-x: -174.8; skew-y: -174.8; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 166.2; y: 131.6; skew-x: -169.6; skew-y: -169.6; scale-x: 0.999; scale-y: 0.999; }
        frame 48 { x: 164.5; y: 124.1; skew-x: -164.3; skew-y: -164.3; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 162.8; y: 116.5; skew-x: -159.1; skew-y: -159.1; scale-x: 0.998; scale-y: 0.998; }
        frame 50 { x: 160.8; y: 108.8; skew-x: -153.8; skew-y: -153.8; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 159.1; y: 100.8; skew-x: -148.6; skew-y: -148.6; scale-x: 0.997; scale-y: 0.997; }
        frame 52 { x: 157; y: 92.8; skew-x: -143.3; skew-y: -143.3; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 155.1; y: 84.5; skew-x: -138; skew-y: -138; scale-x: 0.998; scale-y: 0.998; }
        frame 54 { x: 158.4; y: 80; skew-x: -156.9; skew-y: -156.9; scale-x: 0.997; scale-y: 0.997; }
        frame 55 { x: 161.1; y: 73.6; skew-x: -175.8; skew-y: -175.8; scale-x: 0.999; scale-y: 0.999; }
        frame 56 { x: 162.7; y: 65.5; skew-x: -194.4; skew-y: -194.4; scale-x: 0.998; scale-y: 0.998; }
        frame 57 { x: -10000; y: 56.3; skew-x: -213.3; skew-y: -213.3; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 160.9; y: 46.4; skew-x: -232.3; skew-y: -232.3; }
        frame 59 { x: 157.1; y: 36.5; skew-x: -251.1; skew-y: -251.1; scale-x: 0.999; scale-y: 0.999; }
        frame 60 { x: 151.4; y: 27.3; skew-x: -269.9; skew-y: -269.9; scale-x: 1; scale-y: 1; }
        frame 61 { x: 145.3; y: 28.4; skew-x: -264.8; skew-y: -264.8; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 139; y: 29.5; skew-x: -259.6; skew-y: -259.6; scale-x: 0.999; scale-y: 0.999; }
        frame 63 { x: 132.7; y: 30.6; skew-x: -254.3; skew-y: -254.3; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 126.1; y: 31.9; skew-x: -249.1; skew-y: -249.1; scale-x: 0.998; scale-y: 0.998; }
        frame 65 { x: 119.4; y: 33.3; skew-x: -243.8; skew-y: -243.8; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 112.6; y: 34.5; skew-x: -238.6; skew-y: -238.6; scale-x: 0.997; scale-y: 0.997; }
        frame 67 { x: 105.6; y: 36; skew-x: -233.3; skew-y: -233.3; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 98.6; y: 37.3; skew-x: -228; skew-y: -228; scale-x: 0.998; scale-y: 0.998; }
        frame 69 { x: 92.3; y: 35.8; skew-x: -246.9; skew-y: -246.9; scale-x: 0.997; scale-y: 0.997; }
        frame 70 { x: 84.2; y: 34.8; skew-x: -265.8; skew-y: -265.8; scale-x: 0.999; scale-y: 0.999; }
        frame 71 { x: 74.5; y: 35.1; skew-x: -284.4; skew-y: -284.4; scale-x: 0.998; scale-y: 0.998; }
        frame 72 { x: 63.5; y: 36.8; skew-x: -303.3; skew-y: -303.3; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 51.9; y: 40.4; skew-x: -322.3; skew-y: -322.3; }
        frame 74 { x: 40.3; y: 46; skew-x: -341.1; skew-y: -341.1; scale-x: 0.999; scale-y: 0.999; }
        frame 75 { x: 29.4; y: 53.5; skew-x: -359.9; skew-y: -359.9; scale-x: 1; scale-y: 1; }
    }
    Track {
        source-name: "ice_crystal1_2";
        frame-count: 76;
        frame 0 { x: 104.2; y: 174; scale-x: 0.128; scale-y: 0.128; image: IMAGE_REANIM_ZOMBIE_BOSS_ICEBALL_CRYSTAL1; }
        frame 1 { x: 106.7; y: 169.9; scale-x: 0.183; scale-y: 0.183; image: none; }
        frame 2 { x: 109.3; y: 165.8; scale-x: 0.237; scale-y: 0.237; }
        frame 3 { x: 111.8; y: 161.6; scale-x: 0.292; scale-y: 0.292; }
        frame 4 { x: 114.3; y: 157.5; scale-x: 0.346; scale-y: 0.346; }
        frame 5 { x: 117; y: 153.3; scale-x: 0.401; scale-y: 0.401; }
        frame 6 { x: 119.5; y: 149.2; scale-x: 0.455; scale-y: 0.455; }
        frame 7 { x: 122; y: 145; scale-x: 0.51; scale-y: 0.51; }
        frame 8 { x: 124.6; y: 140.9; scale-x: 0.564; scale-y: 0.564; }
        frame 9 { x: 127.1; y: 136.8; scale-x: 0.619; scale-y: 0.619; }
        frame 10 { x: 129.7; y: 132.6; scale-x: 0.673; scale-y: 0.673; }
        frame 11 { x: 132.2; y: 128.5; scale-x: 0.728; scale-y: 0.728; }
        frame 12 { x: 134.8; y: 124.3; scale-x: 0.782; scale-y: 0.782; }
        frame 13 { x: 137.3; y: 120.2; scale-x: 0.837; scale-y: 0.837; }
        frame 14 { x: 139.8; y: 116; scale-x: 0.891; scale-y: 0.891; }
        frame 15 { x: 142.5; y: 111.9; scale-x: 0.946; scale-y: 0.946; }
        frame 16 { x: 144.8; y: 108.1; scale-x: 1; scale-y: 1; }
        frame 17 { x: 139.6; y: 103; skew-x: -19.2; skew-y: -19.2; scale-x: 0.999; scale-y: 0.999; }
        frame 18 { x: 136; y: 98.9; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998; scale-y: 0.998; }
        frame 19 { x: 134.5; y: 95.4; skew-x: -57.8; skew-y: -57.8; scale-x: 0.999; scale-y: 0.999; }
        frame 20 { x: 135; y: 91.6; skew-x: -77.1; skew-y: -77.1; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 137.4; y: 86.9; skew-x: -96.2; skew-y: -96.2; scale-x: 1; scale-y: 1; }
        frame 22 { x: 141.2; y: 80.7; skew-x: -115.5; skew-y: -115.5; scale-x: 0.999; scale-y: 0.999; }
        frame 23 { x: 146.1; y: 72.8; skew-x: -134.9; skew-y: -134.9; scale-x: 1; scale-y: 1; }
        frame 24 { x: 142.3; y: 70.8; skew-x: -128.5; skew-y: -128.5; scale-x: 0.998; scale-y: 0.998; }
        frame 25 { x: 138.4; y: 68.6; skew-x: -122; skew-y: -122; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 134.6; y: 66.2; skew-x: -115.5; skew-y: -115.5; scale-x: 0.999; scale-y: 0.999; }
        frame 27 { x: 131.1; y: 63.5; skew-x: -109.2; skew-y: -109.2; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 127.6; y: 60.8; skew-x: -102.7; skew-y: -102.7; }
        frame 29 { x: 124.2; y: 57.8; skew-x: -96.2; skew-y: -96.2; scale-x: 1; scale-y: 1; }
        frame 30 { x: 121; y: 54.6; skew-x: -89.9; skew-y: -89.9; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 111; y: 52.3; skew-x: -83.1; skew-y: -83.1; scale-x: 0.999; scale-y: 0.999; }
        frame 32 { x: 101.3; y: 49.7; skew-x: -76.3; skew-y: -76.3; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 91.7; y: 47.1; skew-x: -69.3; skew-y: -69.3; scale-x: 0.998; scale-y: 0.998; }
        frame 34 { x: 82.5; y: 44.4; skew-x: -62.6; skew-y: -62.6; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 73.4; y: 41.5; skew-x: -55.6; skew-y: -55.6; scale-x: 0.997; scale-y: 0.997; }
        frame 36 { x: 64.7; y: 38.8; skew-x: -48.8; skew-y: -48.8; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 56.2; y: 35.9; skew-x: -41.8; skew-y: -41.8; scale-x: 0.998; scale-y: 0.998; }
        frame 38 { x: 53; y: 44.3; skew-x: -59.1; skew-y: -59.1; scale-x: 0.997; scale-y: 0.997; }
        frame 39 { x: 51.4; y: 52.5; skew-x: -76.4; skew-y: -76.4; scale-x: 0.998; scale-y: 0.998; }
        frame 40 { x: 51.3; y: 60; skew-x: -93.4; skew-y: -93.4; scale-x: 0.999; scale-y: 0.999; }
        frame 41 { x: 52.4; y: 66.5; skew-x: -110.7; skew-y: -110.7; scale-x: 0.998; scale-y: 0.998; }
        frame 42 { x: 54.4; y: 71.5; skew-x: -128; skew-y: -128; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 56.8; y: 75; skew-x: -145.3; skew-y: -145.3; }
        frame 44 { x: 59; y: 76.7; skew-x: -162.6; skew-y: -162.6; scale-x: 0.999; scale-y: 0.999; }
        frame 45 { x: 60.8; y: 76.9; skew-x: -179.9; skew-y: -179.9; scale-x: 1; scale-y: 1; }
        frame 46 { x: 59.8; y: 86.4; skew-x: -174.8; skew-y: -174.8; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 58.7; y: 95.9; skew-x: -169.6; skew-y: -169.6; scale-x: 0.999; scale-y: 0.999; }
        frame 48 { x: 57.6; y: 105.3; skew-x: -164.3; skew-y: -164.3; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 56.3; y: 114.4; skew-x: -159.1; skew-y: -159.1; scale-x: 0.998; scale-y: 0.998; }
        frame 50 { x: 55; y: 123.3; skew-x: -153.8; skew-y: -153.8; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 53.6; y: 132.3; skew-x: -148.6; skew-y: -148.6; scale-x: 0.997; scale-y: 0.997; }
        frame 52 { x: 52.3; y: 141; skew-x: -143.3; skew-y: -143.3; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 51; y: 149.6; skew-x: -138; skew-y: -138; scale-x: 0.998; scale-y: 0.998; }
        frame 54 { x: 59.5; y: 152.1; skew-x: -156.9; skew-y: -156.9; scale-x: 0.997; scale-y: 0.997; }
        frame 55 { x: 67.5; y: 152.5; skew-x: -175.8; skew-y: -175.8; scale-x: 0.999; scale-y: 0.999; }
        frame 56 { x: 74.3; y: 151.4; skew-x: -194.4; skew-y: -194.4; scale-x: 0.998; scale-y: 0.998; }
        frame 57 { x: 79.7; y: 149.2; skew-x: -213.3; skew-y: -213.3; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 83.2; y: 146.2; skew-x: -232.3; skew-y: -232.3; }
        frame 59 { x: 84.6; y: 143.3; skew-x: -251.1; skew-y: -251.1; scale-x: 0.999; scale-y: 0.999; }
        frame 60 { x: 84.3; y: 141; skew-x: -269.9; skew-y: -269.9; scale-x: 1; scale-y: 1; }
        frame 61 { x: 92.7; y: 142.8; skew-x: -264.8; skew-y: -264.8; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 100.9; y: 144.6; skew-x: -259.6; skew-y: -259.6; scale-x: 0.999; scale-y: 0.999; }
        frame 63 { x: 109; y: 146.5; skew-x: -254.3; skew-y: -254.3; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 117; y: 148.4; skew-x: -249.1; skew-y: -249.1; scale-x: 0.998; scale-y: 0.998; }
        frame 65 { x: 124.8; y: 150.5; skew-x: -243.8; skew-y: -243.8; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 132.5; y: 152.5; skew-x: -238.6; skew-y: -238.6; scale-x: 0.997; scale-y: 0.997; }
        frame 67 { x: 140; y: 154.5; skew-x: -233.3; skew-y: -233.3; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 147.5; y: 156.7; skew-x: -228; skew-y: -228; scale-x: 0.998; scale-y: 0.998; }
        frame 69 { x: 150.7; y: 146; skew-x: -246.9; skew-y: -246.9; scale-x: 0.997; scale-y: 0.997; }
        frame 70 { x: 152.1; y: 135.7; skew-x: -265.8; skew-y: -265.8; scale-x: 0.999; scale-y: 0.999; }
        frame 71 { x: 151.8; y: 126.7; skew-x: -284.4; skew-y: -284.4; scale-x: 0.998; scale-y: 0.998; }
        frame 72 { x: 150.4; y: 119.1; skew-x: -303.3; skew-y: -303.3; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 148.3; y: 113.5; skew-x: -322.3; skew-y: -322.3; }
        frame 74 { x: 146.2; y: 109.8; skew-x: -341.1; skew-y: -341.1; scale-x: 0.999; scale-y: 0.999; }
        frame 75 { x: 144.8; y: 108.1; skew-x: -359.9; skew-y: -359.9; scale-x: 1; scale-y: 1; }
    }
    Track {
        source-name: "ice_crystal2";
        frame-count: 76;
        frame 0 { x: 95.3; y: 174.3; scale-x: 0.128; scale-y: 0.128; image: IMAGE_REANIM_ZOMBIE_BOSS_ICEBALL_CRYSTAL2; }
        frame 1 { x: 94.1; y: 170.3; scale-x: 0.183; scale-y: 0.183; image: none; }
        frame 2 { x: 92.8; y: 166.3; scale-x: 0.237; scale-y: 0.237; }
        frame 3 { x: 91.6; y: 162.3; scale-x: 0.292; scale-y: 0.292; }
        frame 4 { x: 90.5; y: 158.2; scale-x: 0.346; scale-y: 0.346; }
        frame 5 { x: 89.2; y: 154.3; scale-x: 0.401; scale-y: 0.401; }
        frame 6 { x: 88; y: 150.2; scale-x: 0.455; scale-y: 0.455; }
        frame 7 { x: 86.8; y: 146.2; scale-x: 0.51; scale-y: 0.51; }
        frame 8 { x: 85.6; y: 142.2; scale-x: 0.564; scale-y: 0.564; }
        frame 9 { x: 84.3; y: 138.2; scale-x: 0.619; scale-y: 0.619; }
        frame 10 { x: 83.1; y: 134.2; scale-x: 0.673; scale-y: 0.673; }
        frame 11 { x: 81.9; y: 130.1; scale-x: 0.728; scale-y: 0.728; }
        frame 12 { x: 80.7; y: 126.2; scale-x: 0.782; scale-y: 0.782; }
        frame 13 { x: 79.5; y: 122.1; scale-x: 0.837; scale-y: 0.837; }
        frame 14 { x: 78.2; y: 118.1; scale-x: 0.891; scale-y: 0.891; }
        frame 15 { x: 77; y: 114.1; scale-x: 0.946; scale-y: 0.946; }
        frame 16 { x: 76.1; y: 110.3; scale-x: 1; scale-y: 1; }
        frame 17 { x: 82.5; y: 105.2; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: 89.3; y: 100.3; skew-x: 12.8; skew-y: 12.8; scale-x: 0.999; scale-y: 0.999; }
        frame 19 { x: 96.3; y: 95.8; skew-x: 19.3; skew-y: 19.3; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: 103.3; y: 91.8; skew-x: 25.6; skew-y: 25.6; }
        frame 21 { x: 110.8; y: 88.3; skew-x: 32.1; skew-y: 32.1; }
        frame 22 { x: 118.2; y: 85.3; skew-x: 38.6; skew-y: 38.6; scale-x: 0.998; scale-y: 0.998; }
        frame 23 { x: 125.6; y: 82.7; skew-x: 45; skew-y: 45; scale-x: 1; scale-y: 1; }
        frame 24 { x: 132.9; y: 80.6; skew-x: 51.4; skew-y: 51.4; scale-x: 0.998; scale-y: 0.998; }
        frame 25 { x: 140.2; y: 79.1; skew-x: 57.9; skew-y: 57.9; scale-x: 0.999; scale-y: 0.999; }
        frame 26 { x: 147.4; y: 77.8; skew-x: 64.4; skew-y: 64.4; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 154.3; y: 77.2; skew-x: 70.7; skew-y: 70.7; }
        frame 28 { x: 161; y: 76.9; skew-x: 77.2; skew-y: 77.2; }
        frame 29 { x: 167.5; y: 77.1; skew-x: 83.7; skew-y: 83.7; scale-x: 1; scale-y: 1; }
        frame 30 { x: 173.5; y: 77.5; skew-x: 90; skew-y: 90; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: -10000; y: 77.3; skew-x: 95.8; skew-y: 95.8; }
        frame 32 { x: 173.2; y: 77.5; skew-x: 101.8; skew-y: 101.8; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: 172.6; y: 77.9; skew-x: 107.8; skew-y: 107.8; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 171.5; y: 78.5; skew-x: 113.8; skew-y: 113.8; }
        frame 35 { x: 170; y: 79.1; skew-x: 119.9; skew-y: 119.9; }
        frame 36 { x: 168.1; y: 79.8; skew-x: 125.9; skew-y: 125.9; scale-x: 0.998; scale-y: 0.998; }
        frame 37 { x: 165.9; y: 80.7; skew-x: 131.9; skew-y: 131.9; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 163.1; y: 81.7; skew-x: 138.1; skew-y: 138.1; }
        frame 39 { x: 160; y: 82.3; skew-x: 144.1; skew-y: 144.1; }
        frame 40 { x: 156.5; y: 83; skew-x: 150.1; skew-y: 150.1; scale-x: 0.999; scale-y: 0.999; }
        frame 41 { x: 152.5; y: 83.5; skew-x: 156.2; skew-y: 156.2; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 148.2; y: 83.9; skew-x: 162.2; skew-y: 162.2; }
        frame 43 { x: 143.4; y: 84; skew-x: 168.2; skew-y: 168.2; }
        frame 44 { x: 138.4; skew-x: 174.2; skew-y: 174.2; scale-x: 1; scale-y: 1; }
        frame 45 { x: 133.2; y: 83.4; skew-x: 180; skew-y: 180; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 126.8; y: 88.2; skew-x: 185.8; skew-y: 185.8; }
        frame 47 { x: 120.1; y: 92.7; skew-x: 191.8; skew-y: 191.8; scale-x: 0.999; scale-y: 0.999; }
        frame 48 { x: 113.2; y: 96.8; skew-x: 197.8; skew-y: 197.8; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 106.2; y: 100.5; skew-x: 203.8; skew-y: 203.8; }
        frame 50 { x: 98.9; y: 103.9; skew-x: 209.9; skew-y: 209.9; }
        frame 51 { x: 91.6; y: 106.8; skew-x: 215.9; skew-y: 215.9; scale-x: 0.998; scale-y: 0.998; }
        frame 52 { x: 84.3; y: 109.3; skew-x: 221.9; skew-y: 221.9; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 76.8; y: 111.3; skew-x: 228.1; skew-y: 228.1; }
        frame 54 { x: 69.6; y: 113; skew-x: 234.1; skew-y: 234.1; }
        frame 55 { x: 62.4; y: 114.3; skew-x: 240.1; skew-y: 240.1; scale-x: 0.999; scale-y: 0.999; }
        frame 56 { x: 55.3; y: 115.1; skew-x: 246.2; skew-y: 246.2; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 48.5; y: 115.6; skew-x: 252.2; skew-y: 252.2; }
        frame 58 { x: 41.8; y: 115.7; skew-x: 258.2; skew-y: 258.2; }
        frame 59 { x: 35.5; y: 115.4; skew-x: 264.2; skew-y: 264.2; scale-x: 1; scale-y: 1; }
        frame 60 { x: 29.4; y: 115; skew-x: 270; skew-y: 270; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 29.9; y: 115.2; skew-x: 275.8; skew-y: 275.8; }
        frame 62 { x: 30.5; y: 115.1; skew-x: 281.8; skew-y: 281.8; scale-x: 0.999; scale-y: 0.999; }
        frame 63 { x: 31.7; y: 114.7; skew-x: 287.8; skew-y: 287.8; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 33.1; y: 114.2; skew-x: 293.8; skew-y: 293.8; }
        frame 65 { x: 35; y: 113.6; skew-x: 299.9; skew-y: 299.9; }
        frame 66 { x: 37.3; y: 112.9; skew-x: 305.9; skew-y: 305.9; scale-x: 0.998; scale-y: 0.998; }
        frame 67 { x: 40; y: 112.2; skew-x: 311.9; skew-y: 311.9; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 43.1; y: 111.3; skew-x: 318.1; skew-y: 318.1; }
        frame 69 { x: 46.7; y: 110.6; skew-x: 324.1; skew-y: 324.1; }
        frame 70 { x: 50.6; y: 110; skew-x: 330.1; skew-y: 330.1; scale-x: 0.999; scale-y: 0.999; }
        frame 71 { x: 55; y: 109.5; skew-x: 336.2; skew-y: 336.2; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 59.8; y: 109.2; skew-x: 342.2; skew-y: 342.2; }
        frame 73 { x: 64.9; y: -10000; skew-x: 348.2; skew-y: 348.2; }
        frame 74 { x: 70.4; y: 109.3; skew-x: 354.2; skew-y: 354.2; scale-x: 1; scale-y: 1; }
        frame 75 { x: 76.1; y: 109.9; skew-x: 360; skew-y: 360; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "ice_crystal3";
        frame-count: 76;
        frame 0 { x: 99.6; y: 165.6; scale-x: 0.128; scale-y: 0.128; image: IMAGE_REANIM_ZOMBIE_BOSS_ICEBALL_CRYSTAL3; }
        frame 1 { x: 100.2; y: 158; scale-x: 0.183; scale-y: 0.183; image: none; }
        frame 2 { x: 100.8; y: 150.2; scale-x: 0.237; scale-y: 0.237; }
        frame 3 { x: 101.3; y: 142.6; scale-x: 0.292; scale-y: 0.292; }
        frame 4 { x: 102; y: 134.8; scale-x: 0.346; scale-y: 0.346; }
        frame 5 { x: 102.6; y: 127.2; scale-x: 0.401; scale-y: 0.401; }
        frame 6 { x: 103.2; y: 119.5; scale-x: 0.455; scale-y: 0.455; }
        frame 7 { x: 103.8; y: 111.8; scale-x: 0.51; scale-y: 0.51; }
        frame 8 { x: 104.3; y: 104.2; scale-x: 0.564; scale-y: 0.564; }
        frame 9 { x: 105; y: 96.5; scale-x: 0.619; scale-y: 0.619; }
        frame 10 { x: 105.6; y: 88.8; scale-x: 0.673; scale-y: 0.673; }
        frame 11 { x: 106.2; y: 81.1; scale-x: 0.728; scale-y: 0.728; }
        frame 12 { x: 106.8; y: 73.3; scale-x: 0.782; scale-y: 0.782; }
        frame 13 { x: 107.3; y: 65.7; scale-x: 0.837; scale-y: 0.837; }
        frame 14 { x: 108; y: 58; scale-x: 0.891; scale-y: 0.891; }
        frame 15 { x: 108.6; y: 50.3; scale-x: 0.946; scale-y: 0.946; }
        frame 16 { x: 109.1; y: 42.5; scale-x: 1; scale-y: 1; }
        frame 17 { x: 97.1; y: 50.3; skew-x: -19.2; skew-y: -19.2; scale-x: 0.999; scale-y: 0.999; }
        frame 18 { x: 88.6; y: 60; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998; scale-y: 0.998; }
        frame 19 { x: 84.3; y: 70.3; skew-x: -57.8; skew-y: -57.8; scale-x: 0.999; scale-y: 0.999; }
        frame 20 { x: 84.1; y: 79.7; skew-x: -77.1; skew-y: -77.1; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 87.5; y: 87; skew-x: -96.2; skew-y: -96.2; scale-x: 1; scale-y: 1; }
        frame 22 { x: 93.5; y: 91.1; skew-x: -115.5; skew-y: -115.5; scale-x: 0.999; scale-y: 0.999; }
        frame 23 { x: 101.1; y: 91.5; skew-x: -134.9; skew-y: -134.9; scale-x: 1; scale-y: 1; }
        frame 24 { x: 108.8; y: 91.9; skew-x: -154.3; skew-y: -154.3; scale-x: 0.999; scale-y: 0.999; }
        frame 25 { x: 115.2; y: 88.5; skew-x: -173.6; skew-y: -173.6; scale-x: 1; scale-y: 1; }
        frame 26 { x: 119.1; y: 81.8; skew-x: -192.7; skew-y: -192.7; scale-x: 0.999; scale-y: 0.999; }
        frame 27 { x: 119.5; y: 72.6; skew-x: -212; skew-y: -212; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 116; y: 62.4; skew-x: -231.3; skew-y: -231.3; scale-x: 0.998; scale-y: 0.998; }
        frame 29 { x: 108.2; y: 52.6; skew-x: -250.6; skew-y: -250.6; scale-x: 0.999; scale-y: 0.999; }
        frame 30 { x: 96.8; y: 44.5; skew-x: -269.9; skew-y: -269.9; scale-x: 1; scale-y: 1; }
        frame 31 { x: 86.3; y: 42.1; skew-x: -288.7; skew-y: -288.7; scale-x: 0.999; scale-y: 0.999; }
        frame 32 { x: 74.1; y: 43.2; skew-x: -307.5; skew-y: -307.5; scale-x: 0.998; scale-y: 0.998; }
        frame 33 { x: 61; y: 48.3; skew-x: -326.5; skew-y: -326.5; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 48.6; y: 57.2; skew-x: -345.4; skew-y: -345.4; }
        frame 35 { x: 38.5; y: 69.6; skew-x: -364; skew-y: -364; scale-x: 0.999; scale-y: 0.999; }
        frame 36 { x: 31; y: 84.7; skew-x: -382.9; skew-y: -382.9; scale-x: 0.997; scale-y: 0.997; }
        frame 37 { x: 27.2; y: 101.4; skew-x: -401.8; skew-y: -401.8; scale-x: 0.998; scale-y: 0.998; }
        frame 38 { x: 29.3; y: 115.3; skew-x: -419.1; skew-y: -419.1; scale-x: 0.997; scale-y: 0.997; }
        frame 39 { x: 34.5; y: 128.7; skew-x: -436.4; skew-y: -436.4; scale-x: 0.998; scale-y: 0.998; }
        frame 40 { x: 42.7; y: 140.1; skew-x: -453.4; skew-y: -453.4; scale-x: 0.999; scale-y: 0.999; }
        frame 41 { x: 53.3; y: 149.3; skew-x: -470.7; skew-y: -470.7; scale-x: 0.998; scale-y: 0.998; }
        frame 42 { x: 65.2; y: 155.4; skew-x: -488; skew-y: -488; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 77.7; y: 158.3; skew-x: -505.3; skew-y: -505.3; }
        frame 44 { x: 89.7; y: 157.9; skew-x: -522.6; skew-y: -522.6; scale-x: 0.999; scale-y: 0.999; }
        frame 45 { x: 100.2; y: 154.4; skew-x: -539.9; skew-y: -539.9; scale-x: 1; scale-y: 1; }
        frame 46 { x: 111.4; y: 146.6; skew-x: -557.2; skew-y: -557.2; scale-x: 0.999; scale-y: 0.999; }
        frame 47 { x: 119.7; y: 137.1; skew-x: -574.5; skew-y: -574.5; scale-x: 0.998; scale-y: 0.998; }
        frame 48 { x: 124.7; y: 127; skew-x: -591.8; skew-y: -591.8; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 126.5; y: 117.1; skew-x: -609.1; skew-y: -609.1; }
        frame 50 { x: 125.1; y: 108.5; skew-x: -626.4; skew-y: -626.4; scale-x: 0.999; scale-y: 0.999; }
        frame 51 { x: 121.3; y: 102.2; skew-x: -643.4; skew-y: -643.4; scale-x: 0.998; scale-y: 0.998; }
        frame 52 { x: 115.5; y: 98.6; skew-x: -660.7; skew-y: -660.7; scale-x: 0.997; scale-y: 0.997; }
        frame 53 { x: 108.8; y: 98.2; skew-x: -678; skew-y: -678; scale-x: 0.998; scale-y: 0.998; }
        frame 54 { x: 100.2; y: 98.8; skew-x: -696.9; skew-y: -696.9; scale-x: 0.997; scale-y: 0.997; }
        frame 55 { x: 92.8; y: 103; skew-x: -715.8; skew-y: -715.8; scale-x: 0.999; scale-y: 0.999; }
        frame 56 { x: 88.1; y: 110.1; skew-x: -734.4; skew-y: -734.4; scale-x: 0.998; scale-y: 0.998; }
        frame 57 { x: 86.6; y: 119.5; skew-x: -753.3; skew-y: -753.3; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 89.1; y: 129.8; skew-x: -772.3; skew-y: -772.3; }
        frame 59 { x: 95.4; y: 139.7; skew-x: -791.1; skew-y: -791.1; scale-x: 0.999; scale-y: 0.999; }
        frame 60 { x: 105.3; y: 148; skew-x: -809.9; skew-y: -809.9; scale-x: 1; scale-y: 1; }
        frame 61 { x: 115.7; y: 152.3; skew-x: -827.2; skew-y: -827.2; scale-x: 0.999; scale-y: 0.999; }
        frame 62 { x: 127.8; y: 153.6; skew-x: -844.5; skew-y: -844.5; scale-x: 0.998; scale-y: 0.998; }
        frame 63 { x: 140.7; y: 151.8; skew-x: -861.8; skew-y: -861.8; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 153.1; y: 146.6; skew-x: -879.1; skew-y: -879.1; }
        frame 65 { x: 164.3; y: 138.4; skew-x: -896.4; skew-y: -896.4; scale-x: 0.999; scale-y: 0.999; }
        frame 66 { x: 173.2; y: 127.6; skew-x: -913.4; skew-y: -913.4; scale-x: 0.998; scale-y: 0.998; }
        frame 67 { x: 179.5; y: 114.9; skew-x: -930.7; skew-y: -930.7; scale-x: 0.997; scale-y: 0.997; }
        frame 68 { x: 182.5; y: 101.3; skew-x: -948; skew-y: -948; scale-x: 0.998; scale-y: 0.998; }
        frame 69 { x: 178.6; y: 84.8; skew-x: -966.9; skew-y: -966.9; scale-x: 0.997; scale-y: 0.997; }
        frame 70 { x: 171; y: 69.5; skew-x: -985.8; skew-y: -985.8; scale-x: 0.999; scale-y: 0.999; }
        frame 71 { x: 160.5; y: 57; skew-x: -1004.4; skew-y: -1004.4; scale-x: 0.998; scale-y: 0.998; }
        frame 72 { x: 147.7; y: 47.6; skew-x: -1023.3; skew-y: -1023.3; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 134; y: 42; skew-x: -1042.3; skew-y: -1042.3; }
        frame 74 { x: 120.7; y: 40.5; skew-x: -1061.1; skew-y: -1061.1; scale-x: 0.999; scale-y: 0.999; }
        frame 75 { x: 109.1; y: 42.5; skew-x: -1079.9; skew-y: -1079.9; scale-x: 1; scale-y: 1; }
    }
    Track {
        source-name: "ice_overlay";
        frame-count: 76;
        frame 0 { x: 87.3; y: 161.4; scale-x: 0.128; scale-y: 0.128; image: IMAGE_REANIM_ZOMBIE_BOSS_ICEBALL_OVERLAY; }
        frame 1 { x: 82.8; y: 151.9; scale-x: 0.183; scale-y: 0.183; image: none; }
        frame 2 { x: 78.2; y: 142.5; scale-x: 0.237; scale-y: 0.237; }
        frame 3 { x: 73.7; y: 133; scale-x: 0.292; scale-y: 0.292; }
        frame 4 { x: 69.1; y: 123.5; scale-x: 0.346; scale-y: 0.346; }
        frame 5 { x: 64.5; y: 114; scale-x: 0.401; scale-y: 0.401; }
        frame 6 { x: 59.9; y: 104.5; scale-x: 0.455; scale-y: 0.455; }
        frame 7 { x: 55.4; y: 95; scale-x: 0.51; scale-y: 0.51; }
        frame 8 { x: 50.7; y: 85.5; scale-x: 0.564; scale-y: 0.564; }
        frame 9 { x: 46.1; y: 76.1; scale-x: 0.619; scale-y: 0.619; }
        frame 10 { x: 41.5; y: 66.6; scale-x: 0.673; scale-y: 0.673; }
        frame 11 { x: 37; y: 57.1; scale-x: 0.728; scale-y: 0.728; }
        frame 12 { x: 32.4; y: 47.6; scale-x: 0.782; scale-y: 0.782; }
        frame 13 { x: 27.9; y: 38.1; scale-x: 0.837; scale-y: 0.837; }
        frame 14 { x: 23.3; y: 28.7; scale-x: 0.891; scale-y: 0.891; }
        frame 15 { x: 18.7; y: 19.2; scale-x: 0.946; scale-y: 0.946; }
        frame 16 { x: 13.9; y: 9.9; scale-x: 1; scale-y: 1; }
        frame 17 { x: 4.9; y: 20.1; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -3; y: 31.5; skew-x: -12.7; skew-y: -12.7; scale-x: 0.999; scale-y: 0.999; }
        frame 19 { x: -9.8; y: 43.8; skew-x: -19.2; skew-y: -19.2; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: -15; y: 56.3; skew-x: -25.5; skew-y: -25.5; }
        frame 21 { x: -18.9; y: 69.8; skew-x: -32; skew-y: -32; }
        frame 22 { x: -21.2; y: 83.6; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998; scale-y: 0.998; }
        frame 23 { x: -22.1; y: 97.3; skew-x: -44.9; skew-y: -44.9; scale-x: 1; scale-y: 1; }
        frame 24 { x: -21.1; y: 111.1; skew-x: -51.3; skew-y: -51.3; scale-x: 0.998; scale-y: 0.998; }
        frame 25 { x: -18.8; y: 125; skew-x: -57.8; skew-y: -57.8; scale-x: 0.999; scale-y: 0.999; }
        frame 26 { x: -15; y: 138.4; skew-x: -64.3; skew-y: -64.3; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -9.8; y: 151; skew-x: -70.6; skew-y: -70.6; }
        frame 28 { x: -3; y: 163.2; skew-x: -77.1; skew-y: -77.1; }
        frame 29 { x: 4.8; y: 174.7; skew-x: -83.6; skew-y: -83.6; scale-x: 1; scale-y: 1; }
        frame 30 { x: 13.9; y: 184.8; skew-x: -89.9; skew-y: -89.9; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 23.2; y: 193.2; skew-x: -95.7; skew-y: -95.7; }
        frame 32 { x: 33.7; y: 200.8; skew-x: -101.7; skew-y: -101.7; scale-x: 0.999; scale-y: 0.999; }
        frame 33 { x: 44.9; y: 207.3; skew-x: -107.7; skew-y: -107.7; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 56.8; y: 212.5; skew-x: -113.7; skew-y: -113.7; }
        frame 35 { x: 69.2; y: 216.6; skew-x: -119.8; skew-y: -119.8; }
        frame 36 { x: 81.8; y: 219.3; skew-x: -125.8; skew-y: -125.8; scale-x: 0.998; scale-y: 0.998; }
        frame 37 { x: 94.7; y: 220.7; skew-x: -131.8; skew-y: -131.8; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 108.1; y: 220.6; skew-x: -138; skew-y: -138; }
        frame 39 { x: 121; y: 219.3; skew-x: -144; skew-y: -144; }
        frame 40 { x: 133.6; y: 216.6; skew-x: -150; skew-y: -150; scale-x: 0.999; scale-y: 0.999; }
        frame 41 { x: 145.9; y: 212.6; skew-x: -156.1; skew-y: -156.1; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 157.8; y: 207.3; skew-x: -162.1; skew-y: -162.1; }
        frame 43 { x: 169; y: 200.8; skew-x: -168.1; skew-y: -168.1; }
        frame 44 { x: 179.5; y: 193.2; skew-x: -174.1; skew-y: -174.1; scale-x: 1; scale-y: 1; }
        frame 45 { x: 188.8; y: 184.8; skew-x: -179.9; skew-y: -179.9; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 197.2; y: 175.5; skew-x: -185.7; skew-y: -185.7; }
        frame 47 { x: 204.8; y: 165; skew-x: -191.7; skew-y: -191.7; scale-x: 0.999; scale-y: 0.999; }
        frame 48 { x: 211.3; y: 153.8; skew-x: -197.7; skew-y: -197.7; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 216.6; y: 141.9; skew-x: -203.7; skew-y: -203.7; }
        frame 50 { x: 220.6; y: 129.7; skew-x: -209.8; skew-y: -209.8; }
        frame 51 { x: 223.3; y: 117; skew-x: -215.8; skew-y: -215.8; scale-x: 0.998; scale-y: 0.998; }
        frame 52 { x: 224.7; y: 104.1; skew-x: -221.8; skew-y: -221.8; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: -10000; y: 90.7; skew-x: -228; skew-y: -228; }
        frame 54 { x: 223.3; y: 77.8; skew-x: -234; skew-y: -234; }
        frame 55 { x: 220.6; y: 65.1; skew-x: -240; skew-y: -240; scale-x: 0.999; scale-y: 0.999; }
        frame 56 { x: 216.6; y: 52.8; skew-x: -246.1; skew-y: -246.1; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 211.3; y: 41; skew-x: -252.1; skew-y: -252.1; }
        frame 58 { x: 204.8; y: 29.8; skew-x: -258.1; skew-y: -258.1; }
        frame 59 { x: 197.2; y: 19.3; skew-x: -264.1; skew-y: -264.1; scale-x: 1; scale-y: 1; }
        frame 60 { x: 188.8; y: 9.9; skew-x: -269.9; skew-y: -269.9; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 179.5; y: 1.6; skew-x: -275.7; skew-y: -275.7; }
        frame 62 { x: 169; y: -5.9; skew-x: -281.7; skew-y: -281.7; scale-x: 0.999; scale-y: 0.999; }
        frame 63 { x: 157.8; y: -12.4; skew-x: -287.7; skew-y: -287.7; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 146; y: -17.7; skew-x: -293.7; skew-y: -293.7; }
        frame 65 { x: 133.6; y: -21.7; skew-x: -299.8; skew-y: -299.8; }
        frame 66 { x: 121; y: -24.4; skew-x: -305.8; skew-y: -305.8; scale-x: 0.998; scale-y: 0.998; }
        frame 67 { x: 108.1; y: -25.8; skew-x: -311.8; skew-y: -311.8; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 94.7; y: -10000; skew-x: -318; skew-y: -318; }
        frame 69 { x: 81.8; y: -24.4; skew-x: -324; skew-y: -324; }
        frame 70 { x: 69.1; y: -21.7; skew-x: -330; skew-y: -330; scale-x: 0.999; scale-y: 0.999; }
        frame 71 { x: 56.8; y: -17.7; skew-x: -336.1; skew-y: -336.1; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 44.9; y: -12.4; skew-x: -342.1; skew-y: -342.1; }
        frame 73 { x: 33.8; y: -5.9; skew-x: -348.1; skew-y: -348.1; }
        frame 74 { x: 23.3; y: 1.6; skew-x: -354.1; skew-y: -354.1; scale-x: 1; scale-y: 1; }
        frame 75 { x: 13.9; y: 9.9; skew-x: -359.9; skew-y: -359.9; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "ice_multiply";
        frame-count: 76;
        frame 0 { x: 87.5; y: 162.1; scale-x: 0.128; scale-y: 0.128; image: IMAGE_REANIM_ZOMBIE_BOSS_ICEBALL_MULTIPLY; }
        frame 1 { x: 83.1; y: 152.9; scale-x: 0.182; scale-y: 0.182; image: none; }
        frame 2 { x: 78.6; y: 143.6; scale-x: 0.237; scale-y: 0.237; }
        frame 3 { x: 74.2; y: 134.2; scale-x: 0.291; scale-y: 0.291; }
        frame 4 { x: 69.7; y: 125; scale-x: 0.346; scale-y: 0.346; }
        frame 5 { x: 65.3; y: 115.8; scale-x: 0.4; scale-y: 0.4; }
        frame 6 { x: 60.8; y: 106.5; scale-x: 0.455; scale-y: 0.455; }
        frame 7 { x: 56.4; y: 97.2; scale-x: 0.509; scale-y: 0.509; }
        frame 8 { x: 51.9; y: 87.9; scale-x: 0.564; scale-y: 0.564; }
        frame 9 { x: 47.5; y: 78.6; scale-x: 0.618; scale-y: 0.618; }
        frame 10 { x: 43; y: 69.3; scale-x: 0.673; scale-y: 0.673; }
        frame 11 { x: 38.6; y: 60; scale-x: 0.727; scale-y: 0.727; }
        frame 12 { x: 34.1; y: 50.8; scale-x: 0.782; scale-y: 0.782; }
        frame 13 { x: 29.7; y: 41.5; scale-x: 0.837; scale-y: 0.837; }
        frame 14 { x: 25.3; y: 32.2; scale-x: 0.891; scale-y: 0.891; }
        frame 15 { x: 20.8; y: 22.9; scale-x: 0.945; scale-y: 0.945; }
        frame 16 { x: 16.4; y: 13.7; scale-x: 1; scale-y: 1; }
        frame 17 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "ice_highlight";
        frame-count: 76;
        frame 0 { x: 87.4; y: 161.4; scale-x: 0.128; scale-y: 0.128; image: IMAGE_REANIM_ZOMBIE_BOSS_ICEBALL_HIGHLIGHT; }
        frame 1 { x: 82.8; y: 151.9; scale-x: 0.183; scale-y: 0.183; image: none; }
        frame 2 { x: 78.3; y: 142.5; scale-x: 0.237; scale-y: 0.237; }
        frame 3 { x: 73.7; y: 133; scale-x: 0.292; scale-y: 0.292; }
        frame 4 { x: 69.2; y: 123.5; scale-x: 0.346; scale-y: 0.346; }
        frame 5 { x: 64.6; y: 114; scale-x: 0.401; scale-y: 0.401; }
        frame 6 { x: 60.1; y: 104.5; scale-x: 0.455; scale-y: 0.455; }
        frame 7 { x: 55.5; y: 95; scale-x: 0.51; scale-y: 0.51; }
        frame 8 { x: 51; y: 85.5; scale-x: 0.564; scale-y: 0.564; }
        frame 9 { x: 46.5; y: 76.1; scale-x: 0.619; scale-y: 0.619; }
        frame 10 { x: 41.9; y: 66.6; scale-x: 0.673; scale-y: 0.673; }
        frame 11 { x: 37.4; y: 57.1; scale-x: 0.728; scale-y: 0.728; }
        frame 12 { x: 32.8; y: 47.6; scale-x: 0.782; scale-y: 0.782; }
        frame 13 { x: 28.3; y: 38.1; scale-x: 0.837; scale-y: 0.837; }
        frame 14 { x: 23.7; y: 28.7; scale-x: 0.891; scale-y: 0.891; }
        frame 15 { x: 19.1; y: 19.2; scale-x: 0.946; scale-y: 0.946; }
        frame 16 { x: 14.4; y: 9.9; scale-x: 1; scale-y: 1; }
        frame 17 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
}
