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
        frame 16 { x: -156.800003; y: 51; scale-x: 2; scale-y: 2; cel: 0; }
        frame 17 { x: -138.300003; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; }
        frame 18 { x: -119.800003; }
        frame 19 { x: -101.300003; }
        frame 20 { x: -82.8000031; }
        frame 21 { x: -64.1999969; }
        frame 22 { x: -45.7000008; }
        frame 23 { x: -27.2000008; }
        frame 24 { x: -8.69999981; }
        frame 25 { x: 9.69999981; }
        frame 26 { x: 28.2999992; }
        frame 27 { x: 46.7999992; }
        frame 28 { x: 65.3000031; }
        frame 29 { x: 83.8000031; }
        frame 30 { x: 102.300003; }
        frame 31 { x: 120.800003; }
        frame 32 { x: 139.399994; }
        frame 33 { x: 157.899994; }
        frame 34 { x: 176.399994; }
        frame 35 { x: 194.899994; }
        frame 36 { x: 213.5; }
        frame 37 { x: 232; }
        frame 38 { x: 250.5; }
        frame 39 { x: 269; }
        frame 40 { x: 287.5; }
        frame 41 { x: 306; }
        frame 42 { x: 324.600006; }
        frame 43 { x: 343.100006; }
        frame 44 { x: 361.600006; }
        frame 45 { x: 380.100006; }
        frame 46 { x: 398.600006; }
        frame 47 { x: 417.200012; }
        frame 48 { x: 435.700012; }
        frame 49 { x: 454.200012; }
        frame 50 { x: 472.700012; }
        frame 51 { x: 491.200012; }
        frame 52 { x: 509.700012; }
        frame 53 { x: 528.299988; }
        frame 54 { x: 546.799988; }
        frame 55 { x: 565.299988; }
        frame 56 { x: 583.799988; }
        frame 57 { x: 602.299988; }
        frame 58 { x: 620.900024; }
        frame 59 { x: 639.400024; }
        frame 60 { x: 657.900024; }
        frame 61 { x: 676.400024; }
        frame 62 { x: 694.900024; }
        frame 63 { x: 713.5; }
        frame 64 { x: 732; }
        frame 65 { x: 750.5; }
        frame 66 { x: 769; }
        frame 67 { x: 787.5; }
        frame 68 { x: 806; }
        frame 69 { x: 824.5; }
        frame 70 { x: 843; }
        frame 71 { x: 861.599976; }
        frame 72 { x: 880.099976; }
    }
    Track {
        source-name: "Layer 47";
        frame-count: 73;
        frame 0 { x: 90.8000031; y: 180.199997; scale-x: 0.0979999974; scale-y: 0.0979999974; alpha: 0.25; image: IMAGE_REANIM_ZOMBIE_BOSS_ICEFIRE_SHADOW; }
        frame 1 { x: 87; y: 178.199997; scale-x: 0.151999995; scale-y: 0.151999995; alpha: -10000; image: none; }
        frame 2 { x: 83.0999985; y: 176.199997; scale-x: 0.204999998; scale-y: 0.204999998; }
        frame 3 { x: 79.1999969; y: 174.199997; scale-x: 0.259000003; scale-y: 0.259000003; }
        frame 4 { x: 75.3000031; y: 172.199997; scale-x: 0.312000006; scale-y: 0.312000006; }
        frame 5 { x: 71.5; y: 170.199997; scale-x: 0.365999997; scale-y: 0.365999997; }
        frame 6 { x: 67.5999985; y: 168.199997; scale-x: 0.419; scale-y: 0.419; }
        frame 7 { x: 63.7999992; y: 166.100006; scale-x: 0.472000003; scale-y: 0.472000003; }
        frame 8 { x: 60; y: 164.100006; scale-x: 0.526000023; scale-y: 0.526000023; }
        frame 9 { x: 56; y: 162.100006; scale-x: 0.578999996; scale-y: 0.578999996; }
        frame 10 { x: 52.2000008; y: 160.199997; scale-x: 0.633000016; scale-y: 0.633000016; }
        frame 11 { x: 48.2999992; y: 158.100006; scale-x: 0.68599999; scale-y: 0.68599999; }
        frame 12 { x: 44.5; y: 156.100006; scale-x: 0.74000001; scale-y: 0.74000001; }
        frame 13 { x: 40.5999985; y: 154.100006; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 14 { x: 36.7999992; y: 152.100006; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 15 { x: 32.7999992; y: 150.199997; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 16 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "fireball";
        frame-count: 73;
        frame 0 { x: 90; y: 166.199997; scale-x: 0.108999997; scale-y: 0.108999997; image: IMAGE_REANIM_ZOMBIE_BOSS_FIREBALL; }
        frame 1 { x: 85.3000031; y: 156.800003; scale-x: 0.165000007; scale-y: 0.165000007; image: none; }
        frame 2 { x: 80.6999969; y: 147.5; scale-x: 0.219999999; scale-y: 0.219999999; }
        frame 3 { x: 76; y: 138.100006; scale-x: 0.275999993; scale-y: 0.275999993; }
        frame 4 { x: 71.3000031; y: 128.800003; scale-x: 0.331999987; scale-y: 0.331999987; }
        frame 5 { x: 66.6999969; y: 119.300003; scale-x: 0.386999995; scale-y: 0.386999995; }
        frame 6 { x: 62; y: 110; scale-x: 0.442999989; scale-y: 0.442999989; }
        frame 7 { x: 57.4000015; y: 100.699997; scale-x: 0.499000013; scale-y: 0.499000013; }
        frame 8 { x: 52.7000008; y: 91.3000031; scale-x: 0.555000007; scale-y: 0.555000007; }
        frame 9 { x: 48; y: 82; scale-x: 0.610000014; scale-y: 0.610000014; }
        frame 10 { x: 43.4000015; y: 72.5999985; scale-x: 0.666000009; scale-y: 0.666000009; }
        frame 11 { x: 38.7000008; y: 63.2999992; scale-x: 0.722000003; scale-y: 0.722000003; }
        frame 12 { x: 34.0999985; y: 53.9000015; scale-x: 0.77700001; scale-y: 0.77700001; }
        frame 13 { x: 29.5; y: 44.5; scale-x: 0.833000004; scale-y: 0.833000004; }
        frame 14 { x: 24.7000008; y: 35.0999985; scale-x: 0.888999999; scale-y: 0.888999999; }
        frame 15 { x: 20.1000004; y: 25.7999992; scale-x: 0.944000006; scale-y: 0.944000006; }
        frame 16 { x: 15.3999996; y: 16.3999996; scale-x: 1; scale-y: 1; }
        frame 17 { x: -0.899999976; y: 37.2999992; skew-x: -12.6999998; skew-y: -12.6999998; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 18 { x: -12.5; y: 61.0999985; skew-x: -25.5; skew-y: -25.5; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: -18.5; y: 87.5999985; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 20 { x: -10000; y: 114.199997; skew-x: -51.2999992; skew-y: -51.2999992; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -12.5; y: 140.5; skew-x: -64.3000031; skew-y: -64.3000031; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 22 { x: -1; y: 164.5; skew-x: -77.0999985; skew-y: -77.0999985; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: 15.3999996; y: 185.300003; skew-x: -89.9000015; skew-y: -89.9000015; scale-x: 1; scale-y: 1; }
        frame 24 { x: 36.2999992; y: 201.899994; skew-x: -102.699997; skew-y: -102.699997; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 25 { x: 60.2000008; y: 213.300003; skew-x: -115.5; skew-y: -115.5; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 86.5999985; y: 219.399994; skew-x: -128.5; skew-y: -128.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 27 { x: 113.199997; y: -10000; skew-x: -141.300003; skew-y: -141.300003; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 139.5; y: 213.399994; skew-x: -154.300003; skew-y: -154.300003; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 29 { x: 163.5; y: 201.899994; skew-x: -167.100006; skew-y: -167.100006; scale-x: -10000; scale-y: -10000; }
        frame 30 { x: 184.300003; y: 185.300003; skew-x: -179.899994; skew-y: -179.899994; scale-x: 1; scale-y: 1; }
        frame 31 { x: 200.899994; y: 164.5; skew-x: -192.699997; skew-y: -192.699997; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 32 { x: 212.399994; y: 140.5; skew-x: -205.5; skew-y: -205.5; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 218.399994; y: 114.199997; skew-x: -218.5; skew-y: -218.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 34 { x: 218.300003; y: 87.5999985; skew-x: -231.300003; skew-y: -231.300003; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 212.399994; y: 61.2999992; skew-x: -244.300003; skew-y: -244.300003; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 36 { x: 200.800003; y: 37.2999992; skew-x: -257.100006; skew-y: -257.100006; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 184.300003; y: 16.3999996; skew-x: -269.899994; skew-y: -269.899994; scale-x: 1; scale-y: 1; }
        frame 38 { x: 163.5; y: 0; skew-x: -282.700012; skew-y: -282.700012; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 39 { x: 139.5; y: -11.5; skew-x: -295.5; skew-y: -295.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 113.199997; y: -17.3999996; skew-x: -308.5; skew-y: -308.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 41 { x: 86.5; y: -17.5; skew-x: -321.299988; skew-y: -321.299988; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 60.2000008; y: -11.5; skew-x: -334.299988; skew-y: -334.299988; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 43 { x: 36.2000008; y: 0; skew-x: -347.100006; skew-y: -347.100006; scale-x: -10000; scale-y: -10000; }
        frame 44 { x: 15.3999996; y: 16.3999996; skew-x: -359.899994; skew-y: -359.899994; scale-x: 1; scale-y: 1; }
        frame 45 { x: -0.899999976; y: 37.2999992; skew-x: -372.700012; skew-y: -372.700012; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 46 { x: -12.5; y: 61.0999985; skew-x: -385.5; skew-y: -385.5; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: -18.5; y: 87.5999985; skew-x: -398.5; skew-y: -398.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 48 { x: -10000; y: 114.199997; skew-x: -411.299988; skew-y: -411.299988; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: -12.5; y: 140.5; skew-x: -424.299988; skew-y: -424.299988; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 50 { x: -1; y: 164.5; skew-x: -437.100006; skew-y: -437.100006; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 15.3999996; y: 185.300003; skew-x: -449.899994; skew-y: -449.899994; scale-x: 1; scale-y: 1; }
        frame 52 { x: 36.2999992; y: 201.899994; skew-x: -462.700012; skew-y: -462.700012; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 53 { x: 60.2000008; y: 213.300003; skew-x: -475.5; skew-y: -475.5; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 86.5999985; y: 219.399994; skew-x: -488.5; skew-y: -488.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 55 { x: 113.199997; y: -10000; skew-x: -501.299988; skew-y: -501.299988; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 139.5; y: 213.399994; skew-x: -514.299988; skew-y: -514.299988; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 57 { x: 163.5; y: 201.899994; skew-x: -527.099976; skew-y: -527.099976; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 184.300003; y: 185.300003; skew-x: -539.900024; skew-y: -539.900024; scale-x: 1; scale-y: 1; }
        frame 59 { x: 200.899994; y: 164.5; skew-x: -552.700012; skew-y: -552.700012; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 60 { x: 212.399994; y: 140.5; skew-x: -565.5; skew-y: -565.5; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 218.399994; y: 114.199997; skew-x: -578.5; skew-y: -578.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 62 { x: 218.300003; y: 87.5999985; skew-x: -591.299988; skew-y: -591.299988; scale-x: -10000; scale-y: -10000; }
        frame 63 { x: 212.399994; y: 61.2999992; skew-x: -604.299988; skew-y: -604.299988; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 64 { x: 200.800003; y: 37.2999992; skew-x: -617.099976; skew-y: -617.099976; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 184.300003; y: 16.3999996; skew-x: -629.900024; skew-y: -629.900024; scale-x: 1; scale-y: 1; }
        frame 66 { x: 163.5; y: 0; skew-x: -642.700012; skew-y: -642.700012; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 67 { x: 139.5; y: -11.5; skew-x: -655.5; skew-y: -655.5; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 113.199997; y: -17.3999996; skew-x: -668.5; skew-y: -668.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 69 { x: 86.5; y: -17.5; skew-x: -681.299988; skew-y: -681.299988; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: 60.2000008; y: -11.5; skew-x: -694.299988; skew-y: -694.299988; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 71 { x: 36.2000008; y: 0; skew-x: -707.099976; skew-y: -707.099976; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: 15.3999996; y: 16.3999996; skew-x: -719.900024; skew-y: -719.900024; scale-x: 1; scale-y: 1; }
    }
    Track {
        source-name: "fireball_chunks";
        frame-count: 73;
        frame 0 { x: 90; y: 166.199997; scale-x: 0.108999997; scale-y: 0.108999997; image: IMAGE_REANIM_ZOMBIE_BOSS_FIREBALL_CHUNKS; }
        frame 1 { x: 85.3000031; y: 156.800003; scale-x: 0.165000007; scale-y: 0.165000007; image: none; }
        frame 2 { x: 80.6999969; y: 147.5; scale-x: 0.219999999; scale-y: 0.219999999; }
        frame 3 { x: 76; y: 138.100006; scale-x: 0.275999993; scale-y: 0.275999993; }
        frame 4 { x: 71.3000031; y: 128.800003; scale-x: 0.331999987; scale-y: 0.331999987; }
        frame 5 { x: 66.6999969; y: 119.300003; scale-x: 0.386999995; scale-y: 0.386999995; }
        frame 6 { x: 62; y: 110; scale-x: 0.442999989; scale-y: 0.442999989; }
        frame 7 { x: 57.4000015; y: 100.699997; scale-x: 0.499000013; scale-y: 0.499000013; }
        frame 8 { x: 52.7000008; y: 91.3000031; scale-x: 0.555000007; scale-y: 0.555000007; }
        frame 9 { x: 48; y: 82; scale-x: 0.610000014; scale-y: 0.610000014; }
        frame 10 { x: 43.4000015; y: 72.5999985; scale-x: 0.666000009; scale-y: 0.666000009; }
        frame 11 { x: 38.7000008; y: 63.2999992; scale-x: 0.722000003; scale-y: 0.722000003; }
        frame 12 { x: 34.0999985; y: 53.9000015; scale-x: 0.77700001; scale-y: 0.77700001; }
        frame 13 { x: 29.5; y: 44.5; scale-x: 0.833000004; scale-y: 0.833000004; }
        frame 14 { x: 24.7000008; y: 35.0999985; scale-x: 0.888999999; scale-y: 0.888999999; }
        frame 15 { x: 20.1000004; y: 25.7999992; scale-x: 0.944000006; scale-y: 0.944000006; }
        frame 16 { x: 15.3999996; y: 16.3999996; scale-x: 1; scale-y: 1; }
        frame 17 { x: 6.69999981; y: 26.2000008; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -0.899999976; y: 37.2999992; skew-x: -12.6999998; skew-y: -12.6999998; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 19 { x: -7.5; y: 49; skew-x: -19.2000008; skew-y: -19.2000008; scale-x: -10000; scale-y: -10000; }
        frame 20 { x: -12.5; y: 61.0999985; skew-x: -25.5; skew-y: -25.5; }
        frame 21 { x: -16.2000008; y: 74.1999969; skew-x: -32; skew-y: -32; }
        frame 22 { x: -18.5; y: 87.5999985; skew-x: -38.5; skew-y: -38.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 23 { x: -19.3999996; y: 100.800003; skew-x: -44.9000015; skew-y: -44.9000015; scale-x: 1; scale-y: 1; }
        frame 24 { x: -18.5; y: 114.199997; skew-x: -51.2999992; skew-y: -51.2999992; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 25 { x: -16.2000008; y: 127.5; skew-x: -57.7999992; skew-y: -57.7999992; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 26 { x: -12.5; y: 140.5; skew-x: -64.3000031; skew-y: -64.3000031; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: -7.5; y: 152.699997; skew-x: -70.5999985; skew-y: -70.5999985; }
        frame 28 { x: -1; y: 164.5; skew-x: -77.0999985; skew-y: -77.0999985; }
        frame 29 { x: 6.69999981; y: 175.5; skew-x: -83.5999985; skew-y: -83.5999985; scale-x: 1; scale-y: 1; }
        frame 30 { x: 15.3999996; y: 185.300003; skew-x: -89.9000015; skew-y: -89.9000015; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 25.2000008; y: 194; skew-x: -96.1999969; skew-y: -96.1999969; }
        frame 32 { x: 36.2999992; y: 201.899994; skew-x: -102.699997; skew-y: -102.699997; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 33 { x: 48; y: 208.399994; skew-x: -109.199997; skew-y: -109.199997; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 60.2000008; y: 213.300003; skew-x: -115.5; skew-y: -115.5; }
        frame 35 { x: 73.3000031; y: 217.100006; skew-x: -122; skew-y: -122; }
        frame 36 { x: 86.5999985; y: 219.399994; skew-x: -128.5; skew-y: -128.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 37 { x: 99.9000015; y: 220.300003; skew-x: -134.899994; skew-y: -134.899994; scale-x: 1; scale-y: 1; }
        frame 38 { x: 113.199997; y: 219.399994; skew-x: -141.300003; skew-y: -141.300003; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 39 { x: 126.5; y: 217.100006; skew-x: -147.800003; skew-y: -147.800003; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 40 { x: 139.5; y: 213.399994; skew-x: -154.300003; skew-y: -154.300003; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 151.699997; y: 208.399994; skew-x: -160.600006; skew-y: -160.600006; }
        frame 42 { x: 163.5; y: 201.899994; skew-x: -167.100006; skew-y: -167.100006; }
        frame 43 { x: 174.5; y: 194; skew-x: -173.600006; skew-y: -173.600006; scale-x: 1; scale-y: 1; }
        frame 44 { x: 184.300003; y: 185.300003; skew-x: -179.899994; skew-y: -179.899994; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 193; y: 175.5; skew-x: -186.199997; skew-y: -186.199997; }
        frame 46 { x: 200.899994; y: 164.5; skew-x: -192.699997; skew-y: -192.699997; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 47 { x: 207.399994; y: 152.699997; skew-x: -199.199997; skew-y: -199.199997; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 212.399994; y: 140.5; skew-x: -205.5; skew-y: -205.5; }
        frame 49 { x: 216.100006; y: 127.5; skew-x: -212; skew-y: -212; }
        frame 50 { x: 218.399994; y: 114.199997; skew-x: -218.5; skew-y: -218.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 51 { x: 219.300003; y: 100.900002; skew-x: -224.899994; skew-y: -224.899994; scale-x: 1; scale-y: 1; }
        frame 52 { x: 218.300003; y: 87.5999985; skew-x: -231.300003; skew-y: -231.300003; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 53 { x: 216.100006; y: 74.1999969; skew-x: -237.800003; skew-y: -237.800003; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 54 { x: 212.399994; y: 61.2999992; skew-x: -244.300003; skew-y: -244.300003; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 207.399994; y: 49; skew-x: -250.600006; skew-y: -250.600006; }
        frame 56 { x: 200.800003; y: 37.2999992; skew-x: -257.100006; skew-y: -257.100006; }
        frame 57 { x: 193; y: 26.2000008; skew-x: -263.600006; skew-y: -263.600006; scale-x: 1; scale-y: 1; }
        frame 58 { x: 184.300003; y: 16.3999996; skew-x: -269.899994; skew-y: -269.899994; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 174.5; y: 7.69999981; skew-x: -276.200012; skew-y: -276.200012; }
        frame 60 { x: 163.5; y: 0; skew-x: -282.700012; skew-y: -282.700012; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 61 { x: 151.699997; y: -6.5; skew-x: -289.200012; skew-y: -289.200012; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 139.5; y: -11.5; skew-x: -295.5; skew-y: -295.5; }
        frame 63 { x: 126.5; y: -15.1999998; skew-x: -302; skew-y: -302; }
        frame 64 { x: 113.199997; y: -17.3999996; skew-x: -308.5; skew-y: -308.5; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 65 { x: 99.8000031; y: -18.3999996; skew-x: -314.899994; skew-y: -314.899994; scale-x: 1; scale-y: 1; }
        frame 66 { x: 86.5; y: -17.5; skew-x: -321.299988; skew-y: -321.299988; scale-x: 0.998000026; scale-y: 0.998000026; }
        frame 67 { x: 73.1999969; y: -15.1999998; skew-x: -327.799988; skew-y: -327.799988; scale-x: 0.999000013; scale-y: 0.999000013; }
        frame 68 { x: 60.2000008; y: -11.5; skew-x: -334.299988; skew-y: -334.299988; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 48; y: -6.5; skew-x: -340.600006; skew-y: -340.600006; }
        frame 70 { x: 36.2000008; y: 0; skew-x: -347.100006; skew-y: -347.100006; }
        frame 71 { x: 25.2000008; y: 7.69999981; skew-x: -353.600006; skew-y: -353.600006; scale-x: 1; scale-y: 1; }
        frame 72 { x: 15.3999996; y: 16.3999996; skew-x: -359.899994; skew-y: -359.899994; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "multiply";
        frame-count: 73;
        frame 0 { x: 89.6999969; y: 165.899994; scale-x: 0.109999999; scale-y: 0.109999999; image: IMAGE_REANIM_ZOMBIE_BOSS_FIREBALL_MULTIPLY; }
        frame 1 { x: 85.6999969; y: 157.399994; scale-x: 0.159999996; scale-y: 0.159999996; image: none; }
        frame 2 { x: 81.5999985; y: 148.899994; scale-x: 0.209999993; scale-y: 0.209999993; }
        frame 3 { x: 77.5999985; y: 140.399994; scale-x: 0.25999999; scale-y: 0.25999999; }
        frame 4 { x: 73.4000015; y: 131.899994; scale-x: 0.310000002; scale-y: 0.310000002; }
        frame 5 { x: 69.4000015; y: 123.400002; scale-x: 0.360000014; scale-y: 0.360000014; }
        frame 6 { x: 65.3000031; y: 114.800003; scale-x: 0.409999996; scale-y: 0.409999996; }
        frame 7 { x: 61.2000008; y: 106.400002; scale-x: 0.460000008; scale-y: 0.460000008; }
        frame 8 { x: 57.2000008; y: 97.9000015; scale-x: 0.50999999; scale-y: 0.50999999; }
        frame 9 { x: 53.0999985; y: 89.5; scale-x: 0.560000002; scale-y: 0.560000002; }
        frame 10 { x: 49; y: 81; scale-x: 0.610000014; scale-y: 0.610000014; }
        frame 11 { x: 45; y: 72.5; scale-x: 0.660000026; scale-y: 0.660000026; }
        frame 12 { x: 40.9000015; y: 64; scale-x: 0.709999979; scale-y: 0.709999979; }
        frame 13 { x: 36.7999992; y: 55.4000015; scale-x: 0.75999999; scale-y: 0.75999999; }
        frame 14 { x: 32.7999992; y: 47; scale-x: 0.810000002; scale-y: 0.810000002; }
        frame 15 { x: 28.7000008; y: 38.5; scale-x: 0.860000014; scale-y: 0.860000014; }
        frame 16 { x: 24.7000008; y: 30.5; scale-x: 0.910000026; scale-y: 0.910000026; }
        frame 17 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "additive";
        frame-count: 73;
        frame 0 { x: 90.3000031; y: 166.5; scale-x: 0.104999997; scale-y: 0.104999997; image: IMAGE_REANIM_ZOMBIE_BOSS_FIREBALL_ADDITIVE; }
        frame 1 { x: 85.6999969; y: 157.300003; scale-x: 0.158000007; scale-y: 0.158999994; image: none; }
        frame 2 { x: 81.1999969; y: 148.100006; scale-x: 0.210999995; scale-y: 0.213; }
        frame 3 { x: 76.6999969; y: 138.899994; scale-x: 0.264999986; scale-y: 0.266000003; }
        frame 4 { x: 72.1999969; y: 129.699997; scale-x: 0.317999989; scale-y: 0.319999993; }
        frame 5 { x: 67.6999969; y: 120.5; scale-x: 0.372000009; scale-y: 0.374000013; }
        frame 6 { x: 63.0999985; y: 111.300003; scale-x: 0.425000012; scale-y: 0.426999986; }
        frame 7 { x: 58.5999985; y: 102.099998; scale-x: 0.479000002; scale-y: 0.481000006; }
        frame 8 { x: 54; y: 92.9000015; scale-x: 0.532000005; scale-y: 0.535000026; }
        frame 9 { x: 49.5; y: 83.6999969; scale-x: 0.584999979; scale-y: 0.588; }
        frame 10 { x: 45; y: 74.5; scale-x: 0.638999999; scale-y: 0.64200002; }
        frame 11 { x: 40.5; y: 65.3000031; scale-x: 0.691999972; scale-y: 0.69599998; }
        frame 12 { x: 36; y: 56; scale-x: 0.745999992; scale-y: 0.75; }
        frame 13 { x: 31.3999996; y: 46.9000015; scale-x: 0.799000025; scale-y: 0.802999973; }
        frame 14 { x: 26.8999996; y: 37.5999985; scale-x: 0.851999998; scale-y: 0.856999993; }
        frame 15 { x: 22.3999996; y: 28.5; scale-x: 0.906000018; scale-y: 0.911000013; }
        frame 16 { x: 18; y: 19.3999996; scale-x: 0.958999991; scale-y: 0.963999987; }
        frame 17 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "superglow";
        frame-count: 73;
        frame 0 { x: 85.0999985; y: 161.399994; scale-x: 0.100000001; scale-y: 0.100000001; image: IMAGE_REANIM_ZOMBIE_BOSS_FIREBALL_SUPERGLOW; }
        frame 1 { x: 76.3000031; y: 147.899994; scale-x: 0.160999998; scale-y: 0.160999998; image: none; }
        frame 2 { x: 67.4000015; y: 134.300003; scale-x: 0.223000005; scale-y: 0.223000005; }
        frame 3 { x: 58.5; y: 120.800003; scale-x: 0.284000009; scale-y: 0.284000009; }
        frame 4 { x: 49.5999985; y: 107.199997; scale-x: 0.345999986; scale-y: 0.345999986; }
        frame 5 { x: 40.9000015; y: 93.5999985; scale-x: 0.407000005; scale-y: 0.407000005; }
        frame 6 { x: 32; y: 80.0999985; scale-x: 0.469000012; scale-y: 0.469000012; }
        frame 7 { x: 23.2000008; y: 66.5; scale-x: 0.529999971; scale-y: 0.529999971; }
        frame 8 { x: 14.3000002; y: 52.9000015; scale-x: 0.592000008; scale-y: 0.592000008; }
        frame 9 { x: 5.5; y: 39.4000015; scale-x: 0.652999997; scale-y: 0.652999997; }
        frame 10 { x: -3.29999995; y: 25.8999996; scale-x: 0.714999974; scale-y: 0.714999974; }
        frame 11 { x: -12.1000004; y: 12.3000002; scale-x: 0.776000023; scale-y: 0.776000023; }
        frame 12 { x: -21; y: -1.10000002; scale-x: 0.837000012; scale-y: 0.837000012; }
        frame 13 { x: -29.7999992; y: -14.6999998; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 14 { x: -38.5999985; y: -28.2000008; scale-x: 0.959999979; scale-y: 0.959999979; }
        frame 15 { x: -47.5; y: -41.7999992; scale-x: 1.02199996; scale-y: 1.02199996; }
        frame 16 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 17 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 18 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 19 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 20 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 21 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 22 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 23 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 24 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 25 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 26 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 27 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 28 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 29 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 30 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 31 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 32 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 33 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 34 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 35 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 36 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 37 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 38 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 39 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 40 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 41 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 42 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 43 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 44 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 45 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 46 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 47 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 48 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 49 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 50 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 51 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 52 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 53 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 54 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 55 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 56 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 57 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 58 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 59 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 60 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 61 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 62 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 63 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 64 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 65 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 66 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 67 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 68 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 69 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
        frame 70 { x: -51.5; y: -43.2999992; scale-x: 1.04999995; scale-y: 1; }
        frame 71 { x: -56.2999992; y: -55.2999992; scale-x: 1.08299994; scale-y: 1.08299994; }
        frame 72 { x: -44.2999992; y: -50.5; scale-x: 1; scale-y: 1.04999995; }
    }
}
