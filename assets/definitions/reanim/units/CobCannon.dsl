export component CobCannon {
    fps: 12;
    Track {
        source-name: "anim_unarmed_idle";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 24 { cel: -1; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 39 { cel: 0; }
        frame 40 { cel: -10000; }
        frame 58 { cel: -1; }
        frame 59 { cel: -10000; }
    }
    Track {
        source-name: "anim_shooting";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 58 { cel: 0; }
        frame 59 { cel: -10000; }
    }
    Track {
        source-name: "anim_charge";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
        frame 39 { cel: -1; }
        frame 40 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: 0; }
        frame 2 { cel: -10000; }
        frame 4 { cel: -1; }
        frame 5 { cel: -10000; }
    }
    Track {
        source-name: "CobCannon_backwheels";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 31.7; y: -5.7; scale-x: 0.72; scale-y: 0.72; cel: 0; image: IMAGE_REANIM_COBCANNON_WHEEL; }
        frame 6 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 59 { x: 31.1; y: -4.4; skew-x: -1.2; skew-y: -1.2; }
        frame 60 { x: 30.5; y: -2.8; skew-x: -2.7; skew-y: -2.7; }
        frame 61 { x: 29.9; y: -1.3; skew-x: -4.2; skew-y: -4.2; }
        frame 62 { x: 29.4; y: 0.1; skew-x: -5.7; skew-y: -5.7; }
        frame 63 { x: 30.6; y: -2.9; skew-x: -2.7; skew-y: -2.7; }
        frame 64 { x: 31.7; y: -5.7; skew-x: 0; skew-y: 0; }
        frame 65 { x: -10000; y: -4.8; skew-x: -10000; skew-y: -10000; scale-y: 0.709; }
        frame 66 { y: -4; scale-y: 0.697; }
        frame 67 { y: -4.8; scale-y: 0.709; }
        frame 68 { y: -5.7; scale-y: 0.72; }
        frame 69 { y: -10000; scale-y: -10000; }
        frame 77 { x: 31.1; y: -4.4; scale-x: 0.728; scale-y: 0.703; }
        frame 78 { x: 30.4; y: -3.2; scale-x: 0.736; scale-y: 0.685; }
        frame 79 { x: 31.1; y: -4.4; scale-x: 0.728; scale-y: 0.703; }
        frame 80 { x: 31.7; y: -5.7; scale-x: 0.72; scale-y: 0.72; }
        frame 81 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: -5.1; scale-y: 0.712; }
        frame 85 { y: -4.5; scale-y: 0.704; }
        frame 86 { y: -4; scale-y: 0.697; }
        frame 87 { y: -3.4; scale-y: 0.689; }
        frame 88 { y: -4.5; scale-y: 0.704; }
        frame 89 { y: -5.7; scale-y: 0.72; }
        frame 90 { y: -10000; scale-y: -10000; }
        frame 96 { y: -5.1; scale-y: 0.711; }
        frame 97 { y: -4.5; scale-y: 0.703; }
        frame 98 { y: -5.1; scale-y: 0.711; }
        frame 99 { y: -5.7; scale-y: 0.72; }
    }
    Track {
        source-name: "CobCannon_backwheels2";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 98.6; y: -5.7; scale-x: 0.72; scale-y: 0.72; cel: 0; image: IMAGE_REANIM_COBCANNON_WHEEL; }
        frame 6 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 59 { x: 98; y: -5.9; skew-x: -1.2; skew-y: -1.2; }
        frame 60 { x: 97.3; y: -6.1; skew-x: -2.7; skew-y: -2.7; }
        frame 61 { x: 96.6; y: -6.3; skew-x: -4.2; skew-y: -4.2; }
        frame 62 { x: 96; y: -6.5; skew-x: -5.7; skew-y: -5.7; }
        frame 63 { x: 97.4; y: -6.1; skew-x: -2.7; skew-y: -2.7; }
        frame 64 { x: 98.6; y: -5.7; skew-x: 0; skew-y: 0; }
        frame 65 { x: -10000; y: -4.8; skew-x: -10000; skew-y: -10000; scale-y: 0.709; }
        frame 66 { y: -4; scale-y: 0.697; }
        frame 67 { y: -4.8; scale-y: 0.709; }
        frame 68 { y: -5.7; scale-y: 0.72; }
        frame 69 { y: -10000; scale-y: -10000; }
        frame 77 { x: 98.7; y: -4.4; scale-x: 0.728; scale-y: 0.703; }
        frame 78 { x: 98.8; y: -3.2; scale-x: 0.736; scale-y: 0.685; }
        frame 79 { x: 98.7; y: -4.4; scale-x: 0.728; scale-y: 0.703; }
        frame 80 { x: 98.6; y: -5.7; scale-x: 0.72; scale-y: 0.72; }
        frame 81 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: -5.1; scale-y: 0.712; }
        frame 85 { y: -4.5; scale-y: 0.704; }
        frame 86 { y: -4; scale-y: 0.697; }
        frame 87 { y: -3.4; scale-y: 0.689; }
        frame 88 { y: -4.5; scale-y: 0.704; }
        frame 89 { y: -5.7; scale-y: 0.72; }
        frame 90 { y: -10000; scale-y: -10000; }
        frame 96 { y: -5.1; scale-y: 0.711; }
        frame 97 { y: -4.5; scale-y: 0.703; }
        frame 98 { y: -5.1; scale-y: 0.711; }
        frame 99 { y: -5.7; scale-y: 0.72; }
    }
    Track {
        source-name: "CobCannon_log2";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 15.2; y: 11.2; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_COBCANNON_LOG; }
        frame 6 { x: -10000; y: 11.4; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 11.5; }
        frame 8 { y: 11.7; }
        frame 9 { y: 11.8; }
        frame 10 { y: 12; }
        frame 11 { y: 12.2; }
        frame 12 { y: 12.3; }
        frame 13 { y: 12.5; }
        frame 14 { y: 12.6; }
        frame 15 { y: 12.5; }
        frame 16 { y: 12.3; }
        frame 17 { y: 12.2; }
        frame 18 { y: 12; }
        frame 19 { y: 11.8; }
        frame 20 { y: 11.7; }
        frame 21 { y: 11.5; }
        frame 22 { y: 11.4; }
        frame 23 { y: 11.2; }
        frame 24 { y: -10000; }
        frame 40 { y: 11.4; }
        frame 41 { y: 11.5; }
        frame 42 { y: 11.7; }
        frame 43 { y: 11.8; }
        frame 44 { y: 12; }
        frame 45 { y: 12.2; }
        frame 46 { y: 12.3; }
        frame 47 { y: 12.5; }
        frame 48 { y: 12.6; }
        frame 49 { y: 12.5; }
        frame 50 { y: 12.3; }
        frame 51 { y: 12.2; }
        frame 52 { y: 12; }
        frame 53 { y: 11.8; }
        frame 54 { y: 11.7; }
        frame 55 { y: 11.5; }
        frame 56 { y: 11.4; }
        frame 57 { y: 11.2; }
        frame 58 { y: -10000; }
        frame 59 { x: 14.6; y: 11.1; skew-x: -0.4; skew-y: -0.4; }
        frame 60 { x: 14.1; y: -10000; skew-x: -0.9; skew-y: -0.9; }
        frame 61 { x: 13.6; y: 11; skew-x: -1.4; skew-y: -1.4; }
        frame 62 { x: 13.1; y: 10.9; skew-x: -1.9; skew-y: -1.9; }
        frame 63 { x: 14.2; y: 11; skew-x: -0.9; skew-y: -0.9; }
        frame 64 { x: 15.2; y: 11.2; skew-x: 0; skew-y: 0; }
        frame 65 { x: -10000; y: 12.4; skew-x: -10000; skew-y: -10000; }
        frame 66 { y: 13.6; }
        frame 67 { y: 12.4; }
        frame 68 { y: 11.2; }
        frame 69 { y: -10000; }
        frame 77 { y: 13.8; }
        frame 78 { y: 16.4; }
        frame 79 { y: 10.9; scale-y: 0.819; }
        frame 80 { y: 5.3; scale-y: 0.838; }
        frame 81 { y: 7.3; scale-y: 0.826; }
        frame 82 { y: 9.3; scale-y: 0.813; }
        frame 83 { y: 11.2; scale-y: 0.8; }
        frame 84 { x: 15; y: 11.8; scale-x: 0.802; scale-y: 0.792; }
        frame 85 { x: 14.9; y: 12.3; scale-x: 0.804; scale-y: 0.784; }
        frame 86 { x: 14.7; y: 12.9; scale-x: 0.806; scale-y: 0.776; }
        frame 87 { x: 14.5; y: 13.5; scale-x: 0.808; scale-y: 0.768; }
        frame 88 { x: 14.9; y: 12.4; scale-x: 0.804; scale-y: 0.784; }
        frame 89 { x: 15.2; y: 11.2; scale-x: 0.8; scale-y: 0.8; }
        frame 90 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 14.6; y: 12.5; scale-x: 0.808; scale-y: 0.796; }
        frame 97 { x: 14.1; y: 13.8; scale-x: 0.816; scale-y: 0.792; }
        frame 98 { x: 14.6; y: 12.5; scale-x: 0.808; scale-y: 0.796; }
        frame 99 { x: 15.2; y: 11.2; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CobCannon_fuse";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: -12.5; y: 19.5; skew-x: -44.9; skew-y: -44.9; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_COBCANNON_FUSE; }
        frame 6 { x: -13; y: 21; skew-x: -46.3; skew-y: -47.8; scale-x: 0.799; scale-y: 0.801; cel: -10000; image: none; }
        frame 7 { x: -13.4; y: 22.7; skew-x: -47.8; skew-y: -50.5; scale-x: -10000; scale-y: 0.803; }
        frame 8 { x: -13.8; y: 24.2; skew-x: -49.3; skew-y: -53.3; scale-x: 0.8; scale-y: 0.805; }
        frame 9 { x: -14.2; y: 25.9; skew-x: -50.8; skew-y: -56; scale-x: -10000; scale-y: 0.807; }
        frame 10 { x: -14.5; y: 27.5; skew-x: -52.3; skew-y: -58.8; scale-x: 0.801; scale-y: 0.809; }
        frame 11 { x: -14.9; y: 29.2; skew-x: -53.8; skew-y: -61.5; scale-x: -10000; scale-y: 0.811; }
        frame 12 { x: -15.2; y: 30.8; skew-x: -55.3; skew-y: -64.3; scale-x: 0.802; scale-y: 0.813; }
        frame 13 { x: -15.4; y: 32.5; skew-x: -56.8; skew-y: -67.1; scale-x: -10000; scale-y: 0.815; }
        frame 14 { x: -15.7; y: 34.1; skew-x: -58.3; skew-y: -69.7; scale-x: 0.804; scale-y: 0.818; }
        frame 15 { x: -14.9; y: 36.4; skew-x: -64.3; skew-y: -77.9; scale-x: 0.802; scale-y: 0.825; }
        frame 16 { x: -13.9; y: 38.5; skew-x: -70.3; skew-y: -85.9; scale-x: -10000; scale-y: 0.834; }
        frame 17 { x: -14.1; y: 35.7; skew-x: -66.8; skew-y: -80.1; scale-x: 0.8; scale-y: 0.828; }
        frame 18 { x: -14.2; y: 33; skew-x: -63.1; skew-y: -74.3; scale-x: -10000; scale-y: 0.823; }
        frame 19 { x: -14.1; y: 30.2; skew-x: -59.5; skew-y: -68.4; scale-y: 0.818; }
        frame 20 { x: -14; y: 27.4; skew-x: -55.8; skew-y: -62.6; scale-x: 0.799; scale-y: 0.813; }
        frame 21 { x: -13.7; y: 24.6; skew-x: -52.3; skew-y: -56.6; scale-x: -10000; scale-y: 0.808; }
        frame 22 { x: -13.1; y: 21.9; skew-x: -48.5; skew-y: -50.8; scale-y: 0.803; }
        frame 23 { x: -12.5; y: 19.5; skew-x: -44.9; skew-y: -44.9; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: -13; y: 21; skew-x: -46.3; skew-y: -47.8; scale-x: 0.799; scale-y: 0.801; }
        frame 41 { x: -13.4; y: 22.7; skew-x: -47.8; skew-y: -50.5; scale-x: -10000; scale-y: 0.803; }
        frame 42 { x: -13.8; y: 24.2; skew-x: -49.3; skew-y: -53.3; scale-x: 0.8; scale-y: 0.805; }
        frame 43 { x: -14.2; y: 25.9; skew-x: -50.8; skew-y: -56; scale-x: -10000; scale-y: 0.807; }
        frame 44 { x: -14.5; y: 27.5; skew-x: -52.3; skew-y: -58.8; scale-x: 0.801; scale-y: 0.809; }
        frame 45 { x: -14.9; y: 29.2; skew-x: -53.8; skew-y: -61.5; scale-x: -10000; scale-y: 0.811; }
        frame 46 { x: -15.2; y: 30.8; skew-x: -55.3; skew-y: -64.3; scale-x: 0.802; scale-y: 0.813; }
        frame 47 { x: -15.4; y: 32.5; skew-x: -56.8; skew-y: -67.1; scale-x: -10000; scale-y: 0.815; }
        frame 48 { x: -15.7; y: 34.1; skew-x: -58.3; skew-y: -69.7; scale-x: 0.804; scale-y: 0.818; }
        frame 49 { x: -14.9; y: 37.8; skew-x: -64.3; skew-y: -77.9; scale-x: 0.802; scale-y: 0.825; }
        frame 50 { x: -13.9; y: 41.3; skew-x: -70.3; skew-y: -85.9; scale-x: -10000; scale-y: 0.834; }
        frame 51 { x: -14.2; y: 38.1; skew-x: -66.8; skew-y: -80.1; scale-x: 0.8; scale-y: 0.828; }
        frame 52 { x: -14.3; y: 34.9; skew-x: -63.1; skew-y: -74.3; scale-x: -10000; scale-y: 0.823; }
        frame 53 { x: -14.2; y: 31.7; skew-x: -59.5; skew-y: -68.4; scale-y: 0.818; }
        frame 54 { x: -14; y: 28.5; skew-x: -55.8; skew-y: -62.6; scale-x: 0.799; scale-y: 0.813; }
        frame 55 { x: -13.6; y: 25.4; skew-x: -52.3; skew-y: -56.6; scale-x: -10000; scale-y: 0.808; }
        frame 56 { x: -13.1; y: 22.3; skew-x: -48.5; skew-y: -50.8; scale-y: 0.803; }
        frame 57 { x: -12.5; y: 19.5; skew-x: -44.9; skew-y: -44.9; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: -11.7; y: 36.2; skew-x: -64.9; skew-y: -64.9; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: -8.8; y: 52.4; skew-x: -85.1; skew-y: -85.1; scale-x: 0.8; scale-y: 0.8; }
        frame 61 { x: -4.2; y: 67.1; skew-x: -104.9; skew-y: -104.9; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 9.8; y: 70; skew-x: -114.7; skew-y: -114.7; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: 24.3; y: 72.3; skew-x: -125; skew-y: -125; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 38.6; y: 74.3; skew-x: -134.9; skew-y: -134.9; scale-x: 0.8; scale-y: 0.8; }
        frame 65 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 15.1; y: 69.6; skew-x: -117.5; skew-y: -117.5; scale-x: 0.798; scale-y: 0.798; }
        frame 93 { x: -7.6; y: 63.4; skew-x: -100.2; skew-y: -100.2; scale-x: 0.799; scale-y: 0.799; }
        frame 94 { x: -11.8; y: 42.4; skew-x: -72.6; skew-y: -72.6; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: -12.5; y: 19.5; skew-x: -44.9; skew-y: -44.9; scale-x: 0.8; scale-y: 0.8; }
        frame 96 { x: -13.3; y: 20.7; skew-x: -44.5; skew-y: -45.3; scale-x: 0.801; scale-y: 0.801; }
        frame 97 { x: -14.2; y: 21.9; skew-x: -44.1; skew-y: -45.7; scale-x: 0.804; scale-y: 0.804; }
        frame 98 { x: -13.3; y: 20.7; skew-x: -44.5; skew-y: -45.3; scale-x: 0.801; scale-y: 0.801; }
        frame 99 { x: -12.5; y: 19.5; skew-x: -44.9; skew-y: -44.9; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CobCannon_husk4";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 51.2; y: 5.3; cel: 0; image: IMAGE_REANIM_COBCANNON_HUSK4; }
        frame 6 { x: 51.1; y: 6; scale-x: 1.004; scale-y: 0.997; cel: -10000; image: none; }
        frame 7 { x: 51; y: 6.6; scale-x: 1.007; scale-y: 0.995; }
        frame 8 { x: -10000; y: 7.2; scale-x: 1.011; scale-y: 0.992; }
        frame 9 { x: 51; y: 7.8; scale-x: 1.014; scale-y: 0.99; }
        frame 10 { x: 50.8; y: 8.5; scale-x: 1.018; scale-y: 0.987; }
        frame 11 { x: -10000; y: 9.1; scale-x: 1.021; scale-y: 0.984; }
        frame 12 { x: 50.7; y: 9.8; scale-x: 1.025; scale-y: 0.982; }
        frame 13 { x: 50.6; y: 10.4; scale-x: 1.028; scale-y: 0.979; }
        frame 14 { x: -10000; y: 11; scale-x: 1.032; scale-y: 0.976; }
        frame 15 { x: 50.7; y: 10.4; scale-x: 1.028; scale-y: 0.979; }
        frame 16 { x: 50.8; y: 9.7; scale-x: 1.025; scale-y: 0.982; }
        frame 17 { x: -10000; y: 9.1; scale-x: 1.021; scale-y: 0.984; }
        frame 18 { x: 50.9; y: 8.5; scale-x: 1.018; scale-y: 0.987; }
        frame 19 { x: 51; y: 7.8; scale-x: 1.014; scale-y: 0.99; }
        frame 20 { x: -10000; y: 7.2; scale-x: 1.011; scale-y: 0.992; }
        frame 21 { x: 51.1; y: 6.6; scale-x: 1.007; scale-y: 0.995; }
        frame 22 { x: -10000; y: 5.9; scale-x: 1.004; scale-y: 0.997; }
        frame 23 { x: 51.2; y: 5.3; scale-x: 1; scale-y: 1; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 51.3; skew-x: 0.3; scale-x: 1.003; }
        frame 26 { x: 51.4; skew-x: 0.5; scale-x: 1.006; }
        frame 27 { x: 51.5; skew-x: 0.8; scale-x: 1.009; }
        frame 28 { x: 51.6; skew-x: 1; scale-x: 1.012; }
        frame 29 { x: 51.9; skew-x: 1.3; scale-x: 1.015; }
        frame 30 { x: 52; skew-x: 1.5; scale-x: 1.018; }
        frame 31 { x: 52.1; skew-x: 1.8; scale-x: 1.022; }
        frame 32 { x: 52.2; skew-x: 2; scale-x: 1.025; }
        frame 33 { x: 52.3; skew-x: 2.3; scale-x: 1.028; }
        frame 34 { x: 52.1; y: 5.4; skew-x: 1.8; scale-x: 1.022; }
        frame 35 { x: 51.8; y: -10000; skew-x: 1.3; scale-x: 1.017; }
        frame 36 { x: 51.6; y: 5.5; skew-x: 0.8; scale-x: 1.011; }
        frame 37 { x: 51.4; y: -10000; skew-x: 0.3; scale-x: 1.006; }
        frame 38 { x: 51.2; y: 5.3; skew-x: 0; scale-x: 1; }
        frame 39 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 40 { x: 51.1; y: 6; scale-x: 1.004; scale-y: 0.997; }
        frame 41 { x: 51; y: 6.6; scale-x: 1.007; scale-y: 0.995; }
        frame 42 { x: -10000; y: 7.2; scale-x: 1.011; scale-y: 0.992; }
        frame 43 { x: 51; y: 7.8; scale-x: 1.014; scale-y: 0.99; }
        frame 44 { x: 50.8; y: 8.5; scale-x: 1.018; scale-y: 0.987; }
        frame 45 { x: -10000; y: 9.1; scale-x: 1.021; scale-y: 0.984; }
        frame 46 { x: 50.7; y: 9.8; scale-x: 1.025; scale-y: 0.982; }
        frame 47 { x: 50.6; y: 10.4; scale-x: 1.028; scale-y: 0.979; }
        frame 48 { x: -10000; y: 11; scale-x: 1.032; scale-y: 0.976; }
        frame 49 { x: 50.7; y: 10.4; scale-x: 1.028; scale-y: 0.979; }
        frame 50 { x: 50.8; y: 9.7; scale-x: 1.025; scale-y: 0.982; }
        frame 51 { x: -10000; y: 9.1; scale-x: 1.021; scale-y: 0.984; }
        frame 52 { x: 50.9; y: 8.5; scale-x: 1.018; scale-y: 0.987; }
        frame 53 { x: 51; y: 7.8; scale-x: 1.014; scale-y: 0.99; }
        frame 54 { x: -10000; y: 7.2; scale-x: 1.011; scale-y: 0.992; }
        frame 55 { x: 51.1; y: 6.6; scale-x: 1.007; scale-y: 0.995; }
        frame 56 { x: -10000; y: 5.9; scale-x: 1.004; scale-y: 0.997; }
        frame 57 { x: 51.2; y: 5.3; scale-x: 1; scale-y: 1; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 51.5; y: 6.3; skew-x: -14.7; skew-y: -14.7; scale-x: 0.999; scale-y: 0.999; }
        frame 60 { x: 40.2; y: 3.7; skew-x: -29.7; skew-y: -29.7; scale-x: 0.998; scale-y: 0.998; }
        frame 61 { x: 32.4; y: 1.2; skew-x: -44.9; skew-y: -44.9; scale-x: 1; scale-y: 1; }
        frame 62 { x: 27.8; y: 6.1; skew-x: -59.9; skew-y: -59.9; scale-x: 0.999; scale-y: 0.999; }
        frame 63 { x: 26.3; y: 9.5; skew-x: -75.1; skew-y: -75.1; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 27.3; y: 10; skew-x: -89.9; skew-y: -89.9; scale-x: 1; scale-y: 1; }
        frame 65 { x: 27.1; y: 11.6; skew-x: -10000; skew-y: -10000; scale-x: 0.991; scale-y: 1.015; }
        frame 66 { x: 26.8; y: 13.2; scale-x: 0.983; scale-y: 1.03; }
        frame 67 { x: 27.1; y: 11.5; scale-x: 0.991; scale-y: 1.015; }
        frame 68 { x: 27.3; y: 10; scale-x: 1; scale-y: 1; }
        frame 69 { x: 26.3; y: 11.4; skew-x: -89.1; scale-x: 0.985; scale-y: 1.025; }
        frame 70 { x: 25.4; y: 12.9; skew-x: -88.4; scale-x: 0.97; scale-y: 1.051; }
        frame 71 { x: 24.4; y: 14.3; skew-x: -87.6; scale-x: 0.954; scale-y: 1.076; }
        frame 72 { x: 23.3; y: 15.8; skew-x: -86.6; scale-x: 0.939; scale-y: 1.101; }
        frame 73 { x: 22.5; y: 17.1; skew-x: -85.9; scale-x: 0.924; scale-y: 1.126; }
        frame 74 { x: 21.6; y: 18.5; skew-x: -85.1; scale-x: 0.909; scale-y: 1.152; }
        frame 75 { x: 20.6; y: 19.9; skew-x: -84.1; scale-x: 0.894; scale-y: 1.177; }
        frame 76 { x: 19.6; y: 21.3; skew-x: -83.3; scale-x: 0.879; scale-y: 1.202; }
        frame 77 { x: 19.5; y: 24.6; skew-x: -82.4; scale-x: 0.865; scale-y: 1.219; }
        frame 78 { x: 19.2; y: 28; skew-x: -81.4; scale-x: 0.851; scale-y: 1.235; }
        frame 79 { x: 19.3; y: 20; skew-x: -86.3; scale-x: 0.929; scale-y: 1.219; }
        frame 80 { x: 19.6; y: 11.8; skew-x: -91; scale-x: 1.008; scale-y: 1.202; }
        frame 81 { x: 20.9; y: 9.8; skew-x: -90.7; scale-x: 1.053; scale-y: 1.104; }
        frame 82 { x: 22.4; y: 7.7; skew-x: -10000; scale-x: 1.098; scale-y: 1.005; }
        frame 83 { x: 23.8; y: 5.7; skew-x: -90.6; scale-x: 1.143; scale-y: 0.907; }
        frame 84 { x: 23; y: 7.1; skew-x: -90.4; scale-x: 1.1; scale-y: 0.951; }
        frame 85 { x: 22.4; y: 8.5; skew-x: -90.2; scale-x: 1.056; scale-y: 0.996; }
        frame 86 { x: 21.6; y: 9.9; skew-x: -89.9; scale-x: 1.013; scale-y: 1.04; }
        frame 87 { x: 21.1; y: 11.4; skew-x: -10000; scale-x: 0.969; scale-y: 1.084; }
        frame 88 { x: 21.7; y: 10.7; scale-x: 0.985; scale-y: 1.042; }
        frame 89 { x: 22.3; y: 10; scale-x: 1; scale-y: 1; }
        frame 90 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 25.7; y: 12.3; skew-x: -62.8; skew-y: -62.8; scale-x: 0.998; scale-y: 0.998; }
        frame 93 { x: 38.6; y: 8.2; skew-x: -35.8; skew-y: -35.8; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 42.4; y: 6.1; skew-x: -17.7; skew-y: -17.7; }
        frame 95 { x: 51.2; y: 5.3; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 96 { x: 51; y: 6.7; skew-x: -10000; skew-y: -10000; scale-x: 1.01; scale-y: 0.995; }
        frame 97 { x: 50.8; y: 7.9; scale-x: 1.019; scale-y: 0.991; }
        frame 98 { x: 51; y: 6.7; scale-x: 1.01; scale-y: 0.995; }
        frame 99 { x: 51.2; y: 5.3; scale-x: 1; scale-y: 1; }
    }
    Track {
        source-name: "CobCannon_husk4.2";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { x: 51.4; y: 5.3; cel: 0; alpha: 0; image: IMAGE_REANIM_COBCANNON_HUSK4; }
        frame 25 { x: 51.5; y: -10000; skew-x: 0.3; scale-x: 1.003; cel: -10000; alpha: 0.11; image: none; }
        frame 26 { x: -10000; y: 5.4; skew-x: 0.5; scale-x: 1.006; alpha: 0.22; }
        frame 27 { x: 51.7; y: -10000; skew-x: 0.8; scale-x: 1.009; alpha: 0.33; }
        frame 28 { x: 51.8; y: 5.3; skew-x: 1; scale-x: 1.012; alpha: 0.45; }
        frame 29 { x: 52; y: 5.4; skew-x: 1.3; scale-x: 1.015; alpha: 0.55; }
        frame 30 { x: 52.1; y: -10000; skew-x: 1.5; scale-x: 1.018; alpha: 0.67; }
        frame 31 { x: 52.3; y: 5.3; skew-x: 1.8; scale-x: 1.022; alpha: 0.78; }
        frame 32 { x: 52.4; y: 5.4; skew-x: 2; scale-x: 1.025; alpha: 0.89; }
        frame 33 { x: 52.5; y: 5.3; skew-x: 2.3; scale-x: 1.028; alpha: 1; }
        frame 34 { x: 52.1; y: -10000; skew-x: 1.8; scale-x: 1.021; alpha: 0.75; }
        frame 35 { x: 51.9; y: 5.5; skew-x: 1; scale-x: 1.014; alpha: 0.5; }
        frame 36 { x: 51.6; y: -10000; skew-x: 0.5; scale-x: 1.007; alpha: 0.25; }
        frame 37 { x: 51.4; y: 5.3; skew-x: 0; scale-x: 1; alpha: 0; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; cel: -1; alpha: -10000; }
        frame 39 { cel: -10000; }
        frame 78 { x: 19.2; y: 28; skew-x: -81.4; skew-y: -89.9; scale-x: 0.851; scale-y: 1.235; cel: 0; alpha: 1; }
        frame 79 { x: -10000; y: 19.9; skew-x: -86.4; skew-y: -10000; scale-x: 0.929; scale-y: 1.218; cel: -10000; alpha: -10000; }
        frame 80 { x: 19.6; y: 11.6; skew-x: -91; scale-x: 1.007; scale-y: 1.202; }
        frame 81 { x: 20.9; y: 9.5; skew-x: -90.7; scale-x: 1.052; scale-y: 1.104; }
        frame 82 { x: 22.4; y: 7.5; skew-x: -10000; scale-x: 1.097; scale-y: 1.005; }
        frame 83 { x: 23.8; y: 5.5; skew-x: -90.6; scale-x: 1.143; scale-y: 0.907; }
        frame 84 { x: -10000; y: 5.8; skew-x: -90.7; scale-x: 1.087; scale-y: 0.938; alpha: 0.75; }
        frame 85 { y: 6.3; skew-x: -10000; scale-x: 1.032; scale-y: 0.97; alpha: 0.5; }
        frame 86 { x: 23.7; y: 6.7; scale-x: 0.977; scale-y: 1.002; alpha: 0.25; }
        frame 87 { x: 23.9; y: 7; skew-x: -90.9; scale-x: 0.922; scale-y: 1.034; alpha: 0; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 89 { cel: -10000; }
    }
    Track {
        source-name: "CobCannon_husk3";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 67.2; y: -8.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_COBCANNON_HUSK3; }
        frame 6 { x: 67.3; y: -7.7; scale-x: 0.803; scale-y: 0.798; cel: -10000; image: none; }
        frame 7 { x: 67.2; y: -7; scale-x: 0.806; scale-y: 0.796; }
        frame 8 { x: -10000; y: -6.3; scale-x: 0.808; scale-y: 0.794; }
        frame 9 { y: -5.6; scale-x: 0.811; scale-y: 0.792; }
        frame 10 { y: -4.9; scale-x: 0.814; scale-y: 0.79; }
        frame 11 { y: -4.2; scale-x: 0.817; scale-y: 0.787; }
        frame 12 { x: 67.1; y: -3.6; scale-x: 0.82; scale-y: 0.785; }
        frame 13 { x: -10000; y: -2.9; scale-x: 0.823; scale-y: 0.783; }
        frame 14 { y: -2.3; scale-x: 0.825; scale-y: 0.781; }
        frame 15 { y: -2.9; skew-x: 0.5; scale-x: 0.823; scale-y: 0.783; }
        frame 16 { x: 67.2; y: -3.6; skew-x: 1.3; scale-x: 0.82; scale-y: 0.785; }
        frame 17 { x: 67.1; y: -4.3; skew-x: 1; scale-x: 0.817; scale-y: 0.787; }
        frame 18 { x: 67.2; y: -4.8; skew-x: 0.8; scale-x: 0.814; scale-y: 0.79; }
        frame 19 { x: -10000; y: -5.6; skew-x: 0.6; scale-x: 0.811; scale-y: 0.792; }
        frame 20 { y: -6.3; skew-x: 0.5; scale-x: 0.809; scale-y: 0.794; }
        frame 21 { y: -6.9; skew-x: 0.3; scale-x: 0.806; scale-y: 0.796; }
        frame 22 { y: -7.6; skew-x: 0; scale-x: 0.803; scale-y: 0.798; }
        frame 23 { y: -8.3; skew-x: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: 67.3; y: -8.4; skew-x: -0.2; scale-x: 0.802; scale-y: -10000; }
        frame 25 { x: 67.5; y: -8.3; skew-x: -0.4; scale-x: 0.804; }
        frame 26 { x: 67.6; y: -8.4; skew-x: -0.7; scale-x: 0.807; }
        frame 27 { x: 67.8; y: -10000; skew-x: -0.9; scale-x: 0.809; }
        frame 28 { x: 68; skew-x: -1.2; scale-x: 0.811; }
        frame 29 { x: 68.1; skew-x: -1.4; scale-x: 0.813; }
        frame 30 { x: 68.3; skew-x: -1.7; scale-x: 0.816; }
        frame 31 { x: 68.4; skew-x: -1.9; scale-x: 0.818; }
        frame 32 { x: 68.6; skew-x: -2.2; scale-x: 0.82; }
        frame 33 { x: 68.7; y: -8.3; skew-x: -2.5; scale-x: 0.822; }
        frame 34 { x: 68.4; y: -8.4; skew-x: -1.9; scale-x: 0.818; }
        frame 35 { x: 68.1; y: -8.3; skew-x: -1.4; scale-x: 0.813; }
        frame 36 { x: 67.8; y: -10000; skew-x: -0.9; scale-x: 0.809; }
        frame 37 { x: 67.5; skew-x: -0.4; scale-x: 0.804; }
        frame 38 { x: 67.2; skew-x: 0; scale-x: 0.8; }
        frame 39 { x: -10000; skew-x: -10000; scale-x: -10000; }
        frame 40 { x: 67.3; y: -7.7; scale-x: 0.803; scale-y: 0.798; }
        frame 41 { x: 67.2; y: -7; scale-x: 0.806; scale-y: 0.796; }
        frame 42 { x: -10000; y: -6.3; scale-x: 0.808; scale-y: 0.794; }
        frame 43 { y: -5.6; scale-x: 0.811; scale-y: 0.792; }
        frame 44 { y: -4.9; scale-x: 0.814; scale-y: 0.79; }
        frame 45 { y: -4.2; scale-x: 0.817; scale-y: 0.787; }
        frame 46 { x: 67.1; y: -3.6; scale-x: 0.82; scale-y: 0.785; }
        frame 47 { x: -10000; y: -2.9; scale-x: 0.823; scale-y: 0.783; }
        frame 48 { y: -2.3; scale-x: 0.825; scale-y: 0.781; }
        frame 49 { y: -2.9; skew-x: 0.5; scale-x: 0.823; scale-y: 0.783; }
        frame 50 { x: 67.2; y: -3.6; skew-x: 1.3; scale-x: 0.82; scale-y: 0.785; }
        frame 51 { x: 67.1; y: -4.3; skew-x: 1; scale-x: 0.817; scale-y: 0.787; }
        frame 52 { x: 67.2; y: -4.8; skew-x: 0.8; scale-x: 0.814; scale-y: 0.79; }
        frame 53 { x: -10000; y: -5.6; skew-x: 0.6; scale-x: 0.811; scale-y: 0.792; }
        frame 54 { y: -6.3; skew-x: 0.5; scale-x: 0.809; scale-y: 0.794; }
        frame 55 { y: -6.9; skew-x: 0.3; scale-x: 0.806; scale-y: 0.796; }
        frame 56 { y: -7.6; skew-x: 0; scale-x: 0.803; scale-y: 0.798; }
        frame 57 { y: -8.3; skew-x: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 59.9; y: -14.7; skew-x: -14.7; skew-y: -14.7; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: 46; y: -15.1; skew-x: -29.7; skew-y: -29.7; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 35; y: -10000; skew-x: -44.9; skew-y: -44.9; scale-x: 0.8; scale-y: 0.8; }
        frame 62 { x: 22.9; y: -11.1; skew-x: -59.9; skew-y: -59.9; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: 13.8; y: -8.3; skew-x: -75.1; skew-y: -75.1; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 6.7; y: -7.9; skew-x: -89.9; skew-y: -89.9; scale-x: 0.8; scale-y: 0.8; }
        frame 65 { x: 6.2; y: -6.1; skew-x: -10000; skew-y: -10000; scale-x: 0.793; scale-y: 0.812; }
        frame 66 { x: 5.6; y: -4.4; scale-x: 0.786; scale-y: 0.824; }
        frame 67 { x: 6.1; y: -6.1; scale-x: 0.793; scale-y: 0.812; }
        frame 68 { x: 6.7; y: -7.9; scale-x: 0.8; scale-y: 0.8; }
        frame 69 { x: 5.2; y: -6.2; skew-x: -90.9; scale-x: 0.788; scale-y: 0.82; }
        frame 70 { x: 3.9; y: -4.4; skew-x: -91.9; scale-x: 0.776; scale-y: 0.84; }
        frame 71 { x: 2.4; y: -2.7; skew-x: -92.9; scale-x: 0.765; scale-y: 0.861; }
        frame 72 { x: 0.9; y: -0.9; skew-x: -93.9; scale-x: 0.753; scale-y: 0.881; }
        frame 73 { x: -0.4; y: 0.5; skew-x: -94.9; scale-x: 0.741; scale-y: 0.901; }
        frame 74 { x: -1.9; y: 2.2; skew-x: -95.9; scale-x: 0.729; scale-y: 0.921; }
        frame 75 { x: -3.5; y: 3.9; skew-x: -97; scale-x: 0.717; scale-y: 0.942; }
        frame 76 { x: -4.9; y: 5.6; skew-x: -98.1; scale-x: 0.706; scale-y: 0.962; }
        frame 77 { x: -5.5; y: 9.2; skew-x: -99.4; scale-x: 0.696; scale-y: 0.975; }
        frame 78 { x: -6.1; y: 12.8; skew-x: -100.8; scale-x: 0.686; scale-y: 0.988; }
        frame 79 { x: -5.3; y: 3.3; skew-x: -95.9; scale-x: 0.746; scale-y: 0.975; }
        frame 80 { x: -4.9; y: -6.2; skew-x: -91.3; scale-x: 0.806; scale-y: 0.962; }
        frame 81 { x: -1.6; y: -9.1; skew-x: -91; scale-x: 0.842; scale-y: 0.883; }
        frame 82 { x: 1.8; y: -11.8; skew-x: -90.9; scale-x: 0.878; scale-y: 0.804; }
        frame 83 { x: 5.2; y: -14.8; skew-x: -90.8; scale-x: 0.915; scale-y: 0.726; }
        frame 84 { x: 3.5; y: -12.6; skew-x: -90.4; scale-x: 0.88; scale-y: 0.761; }
        frame 85 { x: 1.9; y: -10.3; skew-x: -90.2; scale-x: 0.845; scale-y: 0.797; }
        frame 86 { x: 0.2; y: -8.2; skew-x: -90; scale-x: 0.81; scale-y: 0.832; }
        frame 87 { x: -1.1; y: -5.9; skew-x: -89.9; scale-x: 0.776; scale-y: 0.867; }
        frame 88 { x: 0.3; y: -6.9; skew-x: -10000; scale-x: 0.788; scale-y: 0.834; }
        frame 89 { x: 1.7; y: -7.9; scale-x: 0.8; scale-y: 0.8; }
        frame 90 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 17.2; y: -6.8; skew-x: -62.8; skew-y: -62.8; scale-x: 0.798; scale-y: 0.798; }
        frame 93 { x: 41.6; y: -10.5; skew-x: -35.8; skew-y: -35.8; scale-x: 0.799; scale-y: 0.799; }
        frame 94 { x: 52.3; y: -10.1; skew-x: -17.7; skew-y: -17.7; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 67.2; y: -8.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 96 { x: -10000; y: -6.9; skew-x: -10000; skew-y: -10000; scale-x: 0.808; scale-y: 0.796; }
        frame 97 { x: 67.1; y: -5.6; scale-x: 0.816; scale-y: 0.792; }
        frame 98 { x: 67.2; y: -7; scale-x: 0.808; scale-y: 0.796; }
        frame 99 { x: -10000; y: -8.3; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CobCannon_husk3.2";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { x: 67.3; y: -8.1; scale-x: 0.8; scale-y: 0.8; cel: 0; alpha: 0; image: IMAGE_REANIM_COBCANNON_HUSK3; }
        frame 25 { x: 67.5; y: -10000; skew-x: -0.2; scale-x: 0.802; scale-y: -10000; cel: -10000; alpha: 0.11; image: none; }
        frame 26 { x: 67.6; y: -8.2; skew-x: -0.4; scale-x: 0.805; alpha: 0.22; }
        frame 27 { x: 67.7; y: -10000; skew-x: -0.7; scale-x: 0.807; alpha: 0.33; }
        frame 28 { x: 67.9; skew-x: -0.9; scale-x: 0.81; alpha: 0.45; }
        frame 29 { x: 68.1; y: -8.3; skew-x: -1.2; scale-x: 0.812; alpha: 0.55; }
        frame 30 { x: 68.3; y: -10000; skew-x: -1.5; scale-x: 0.815; alpha: 0.67; }
        frame 31 { x: 68.5; y: -8.2; skew-x: -1.9; scale-x: 0.817; alpha: 0.78; }
        frame 32 { x: 68.6; y: -10000; skew-x: -2.2; scale-x: 0.82; alpha: 0.89; }
        frame 33 { x: 68.8; y: -8.1; skew-x: -2.5; scale-x: 0.822; alpha: 1; }
        frame 34 { x: 68.3; y: -8.2; skew-x: -1.7; scale-x: 0.817; alpha: 0.75; }
        frame 35 { x: 68; y: -8.1; skew-x: -1.2; scale-x: 0.811; alpha: 0.5; }
        frame 36 { x: 67.6; y: -8.2; skew-x: -0.4; scale-x: 0.806; alpha: 0.25; }
        frame 37 { x: 67.3; y: -8.1; skew-x: 0; scale-x: 0.8; alpha: 0; }
        frame 38 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; cel: -1; alpha: -10000; }
        frame 39 { cel: -10000; }
        frame 78 { x: -6.3; y: 12.9; skew-x: -100.7; skew-y: -89.9; scale-x: 0.686; scale-y: 0.988; cel: 0; alpha: 1; }
        frame 79 { x: -5.7; y: 3.3; skew-x: -95.9; skew-y: -10000; scale-x: 0.745; scale-y: 0.975; cel: -10000; alpha: -10000; }
        frame 80 { x: -5.6; y: -6.2; skew-x: -91.2; scale-x: 0.805; scale-y: 0.962; }
        frame 81 { x: -2.2; y: -9.1; skew-x: -90.9; scale-x: 0.841; scale-y: 0.883; }
        frame 82 { x: 1.1; y: -11.9; skew-x: -90.7; scale-x: 0.878; scale-y: 0.804; }
        frame 83 { x: 4.7; y: -14.8; skew-x: -90.8; scale-x: 0.914; scale-y: 0.726; }
        frame 84 { x: 3.5; y: -13.4; skew-x: -90.7; scale-x: 0.87; scale-y: 0.751; alpha: 0.75; }
        frame 85 { x: 2.5; y: -12; skew-x: -90.9; scale-x: 0.825; scale-y: 0.776; alpha: 0.5; }
        frame 86 { x: 1.3; y: -10.6; skew-x: -10000; scale-x: 0.781; scale-y: 0.802; alpha: 0.25; }
        frame 87 { x: 0.3; y: -9.3; skew-x: -91.1; scale-x: 0.737; scale-y: 0.827; alpha: 0; }
        frame 88 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; alpha: -10000; }
        frame 89 { cel: -10000; }
    }
    Track {
        source-name: "CobCannon_cob";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 30 { x: 24.1; y: -6.1; scale-x: 0.465; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_COBCANNON_COB; }
        frame 31 { x: 24.2; y: -10000; scale-x: 0.585; scale-y: -10000; cel: -10000; image: none; }
        frame 32 { x: 24.1; scale-x: 0.705; }
        frame 33 { x: -10000; scale-x: 0.825; }
        frame 34 { scale-x: 0.817; }
        frame 35 { x: 24.2; scale-x: 0.808; }
        frame 36 { x: 24.1; scale-x: 0.8; }
        frame 37 { x: -10000; scale-x: -10000; }
        frame 40 { x: 24; y: -5.4; scale-x: 0.803; scale-y: 0.798; }
        frame 41 { x: 23.8; y: -4.8; scale-x: 0.806; scale-y: 0.796; }
        frame 42 { x: 23.6; y: -4.1; scale-x: 0.808; scale-y: 0.794; }
        frame 43 { x: 23.5; y: -3.5; scale-x: 0.811; scale-y: 0.792; }
        frame 44 { x: 23.4; y: -2.8; scale-x: 0.814; scale-y: 0.79; }
        frame 45 { x: 23.1; y: -2.1; scale-x: 0.817; scale-y: 0.787; }
        frame 46 { x: 23; y: -1.5; scale-x: 0.82; scale-y: 0.785; }
        frame 47 { x: 22.9; y: -0.8; scale-x: 0.823; scale-y: 0.783; }
        frame 48 { x: 22.6; y: -0.1; scale-x: 0.825; scale-y: 0.781; }
        frame 49 { x: 22.8; y: 0.3; scale-x: 0.823; scale-y: 0.783; }
        frame 50 { x: 22.9; y: 1; scale-x: 0.82; scale-y: 0.785; }
        frame 51 { x: 23.1; y: 0; scale-x: 0.817; scale-y: 0.787; }
        frame 52 { x: 23.2; y: -0.9; scale-x: 0.814; scale-y: 0.79; }
        frame 53 { x: 23.4; y: -1.9; scale-x: 0.811; scale-y: 0.792; }
        frame 54 { x: 23.6; y: -3; scale-x: 0.808; scale-y: 0.794; }
        frame 55 { x: 23.7; y: -4; scale-x: 0.806; scale-y: 0.796; }
        frame 56 { x: 23.9; y: -5.1; scale-x: 0.803; scale-y: 0.798; }
        frame 57 { x: 24.1; y: -6.1; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 10.6; y: 2.9; skew-x: -14.7; skew-y: -14.7; scale-x: 0.799; scale-y: 0.795; }
        frame 60 { x: 1.9; y: 13.1; skew-x: -29.7; skew-y: -29.7; scale-x: -10000; scale-y: 0.79; }
        frame 61 { x: -2; y: 23.1; skew-x: -44.9; skew-y: -44.9; scale-x: 0.8; scale-y: 0.787; }
        frame 62 { x: -1; y: 32.8; skew-x: -59.9; skew-y: -59.9; scale-x: 0.799; scale-y: 0.782; }
        frame 63 { x: 3.8; y: 40; skew-x: -75.1; skew-y: -75.1; scale-x: -10000; scale-y: 0.778; }
        frame 64 { x: 11.7; y: 43; skew-x: -89.9; skew-y: -89.9; scale-x: 0.8; scale-y: 0.774; }
        frame 65 { x: 11.2; y: 44.5; skew-x: -10000; skew-y: -10000; scale-x: 0.793; scale-y: 0.786; }
        frame 66 { x: 10.8; y: 45.6; scale-x: 0.786; scale-y: 0.798; }
        frame 67 { x: 11.2; y: 44.4; scale-x: 0.793; scale-y: 0.786; }
        frame 68 { x: 11.7; y: 43; scale-x: 0.8; scale-y: 0.774; }
        frame 69 { x: 10.6; y: 44; scale-x: 0.79; scale-y: 0.79; }
        frame 70 { x: 9.5; y: 45; scale-x: 0.78; scale-y: 0.806; }
        frame 71 { x: 8.4; y: 46; scale-x: 0.77; scale-y: 0.821; }
        frame 72 { x: 7.3; y: 47; scale-x: 0.759; scale-y: 0.837; }
        frame 73 { x: 6.3; y: 48; scale-x: 0.749; scale-y: 0.853; }
        frame 74 { x: 5.2; y: 49; scale-x: 0.739; scale-y: 0.868; }
        frame 75 { x: 4.1; y: 50; scale-x: 0.729; scale-y: 0.884; }
        frame 76 { x: 3; y: 51; scale-x: 0.719; scale-y: 0.9; }
        frame 77 { x: 1.9; y: 52; scale-x: 0.709; scale-y: 0.915; }
        frame 78 { x: 0.9; y: 53; scale-x: 0.698; scale-y: 0.931; }
        frame 79 { x: 1.2; y: 21.5; scale-x: 0.749; scale-y: 0.923; }
        frame 80 { x: 1.5; y: -9.8; scale-x: 0.799; scale-y: 0.915; }
        frame 81 { x: 1.8; y: -41.4; scale-x: 0.85; scale-y: 0.908; }
        frame 82 { x: 2; y: -73; scale-x: 0.9; scale-y: 0.9; }
        frame 83 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 84 { cel: -10000; }
    }
    Track {
        source-name: "CobCannon_husk2";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 13.5; y: 0.3; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_COBCANNON_HUSK2; }
        frame 6 { x: 13.3; y: 0.9; scale-x: 0.803; scale-y: 0.798; cel: -10000; image: none; }
        frame 7 { x: 13.1; y: 1.6; scale-x: 0.806; scale-y: 0.796; }
        frame 8 { x: 12.9; y: 2.2; scale-x: 0.808; scale-y: 0.794; }
        frame 9 { x: 12.7; y: 2.9; scale-x: 0.811; scale-y: 0.792; }
        frame 10 { x: 12.5; y: 3.5; scale-x: 0.814; scale-y: 0.79; }
        frame 11 { x: 12.3; y: 4.2; scale-x: 0.817; scale-y: 0.787; }
        frame 12 { x: 12.1; y: 4.8; scale-x: 0.82; scale-y: 0.785; }
        frame 13 { x: 11.9; y: 5.5; scale-x: 0.823; scale-y: 0.783; }
        frame 14 { x: 11.7; y: 6.2; scale-x: 0.825; scale-y: 0.781; }
        frame 15 { x: 11.9; y: 5.5; scale-x: 0.823; scale-y: 0.783; }
        frame 16 { x: 12.1; y: 4.8; scale-x: 0.82; scale-y: 0.785; }
        frame 17 { x: 12.3; y: 4.2; scale-x: 0.817; scale-y: 0.787; }
        frame 18 { x: 12.5; y: 3.5; scale-x: 0.814; scale-y: 0.79; }
        frame 19 { x: 12.7; y: 2.9; scale-x: 0.811; scale-y: 0.792; }
        frame 20 { x: 12.9; y: 2.3; scale-x: 0.808; scale-y: 0.794; }
        frame 21 { x: 13.1; y: 1.6; scale-x: 0.806; scale-y: 0.796; }
        frame 22 { x: 13.4; y: 1; scale-x: 0.803; scale-y: 0.798; }
        frame 23 { x: 13.5; y: 0.3; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { y: 0.5; skew-x: 0.1; scale-x: 0.802; }
        frame 26 { x: 13.6; y: -10000; skew-x: 0.3; scale-x: 0.805; }
        frame 27 { x: 13.5; skew-x: 0.5; scale-x: 0.807; }
        frame 28 { x: -10000; skew-x: 0.8; scale-x: 0.81; }
        frame 29 { y: 0.4; skew-x: 1; scale-x: 0.812; }
        frame 30 { y: -10000; skew-x: 1.3; scale-x: 0.815; }
        frame 31 { x: 13.6; y: 0.3; skew-x: 1.5; scale-x: 0.817; }
        frame 32 { x: 13.5; y: -10000; skew-x: 1.8; scale-x: 0.82; }
        frame 33 { x: 13.6; skew-x: 2; scale-x: 0.822; }
        frame 34 { x: -10000; skew-x: 1.5; scale-x: 0.818; }
        frame 35 { x: 13.5; y: 0.4; skew-x: 1; scale-x: 0.813; }
        frame 36 { x: 13.6; y: 0.3; skew-x: 0.8; scale-x: 0.809; }
        frame 37 { x: 13.5; y: 0.4; skew-x: 0.3; scale-x: 0.804; }
        frame 38 { x: -10000; y: 0.3; skew-x: 0; scale-x: 0.8; }
        frame 39 { y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 40 { x: 13.3; y: 0.9; scale-x: 0.803; scale-y: 0.798; }
        frame 41 { x: 13.1; y: 1.6; scale-x: 0.806; scale-y: 0.796; }
        frame 42 { x: 12.9; y: 2.2; scale-x: 0.808; scale-y: 0.794; }
        frame 43 { x: 12.7; y: 2.9; scale-x: 0.811; scale-y: 0.792; }
        frame 44 { x: 12.5; y: 3.5; scale-x: 0.814; scale-y: 0.79; }
        frame 45 { x: 12.3; y: 4.2; scale-x: 0.817; scale-y: 0.787; }
        frame 46 { x: 12.1; y: 4.8; scale-x: 0.82; scale-y: 0.785; }
        frame 47 { x: 11.9; y: 5.5; scale-x: 0.823; scale-y: 0.783; }
        frame 48 { x: 11.7; y: 6.2; scale-x: 0.825; scale-y: 0.781; }
        frame 49 { x: 11.9; y: 5.5; scale-x: 0.823; scale-y: 0.783; }
        frame 50 { x: 12.1; y: 4.8; scale-x: 0.82; scale-y: 0.785; }
        frame 51 { x: 12.3; y: 4.2; scale-x: 0.817; scale-y: 0.787; }
        frame 52 { x: 12.5; y: 3.5; scale-x: 0.814; scale-y: 0.79; }
        frame 53 { x: 12.7; y: 2.9; scale-x: 0.811; scale-y: 0.792; }
        frame 54 { x: 12.9; y: 2.3; scale-x: 0.808; scale-y: 0.794; }
        frame 55 { x: 13.1; y: 1.6; scale-x: 0.806; scale-y: 0.796; }
        frame 56 { x: 13.4; y: 1; scale-x: 0.803; scale-y: 0.798; }
        frame 57 { x: 13.5; y: 0.3; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 6.7; y: 13.9; skew-x: -14.7; skew-y: -14.7; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: 2.4; y: 22.9; skew-x: -29.5; skew-y: -29.7; scale-x: 0.798; scale-y: -10000; }
        frame 61 { x: 2.3; y: 31.9; skew-x: -44.3; skew-y: -44.9; scale-x: 0.799; scale-y: 0.8; }
        frame 62 { x: 4.5; y: 41.6; skew-x: -59.1; skew-y: -59.9; scale-x: 0.798; scale-y: 0.799; }
        frame 63 { x: 10.4; y: 49.2; skew-x: -73.9; skew-y: -75.1; scale-x: 0.799; scale-y: -10000; }
        frame 64 { x: 19.5; y: 53.3; skew-x: -88.6; skew-y: -89.9; scale-x: 0.8; scale-y: 0.8; }
        frame 65 { x: 19.2; y: 54.5; skew-x: -10000; skew-y: -10000; scale-x: 0.793; scale-y: 0.812; }
        frame 66 { x: 18.8; y: 55.7; skew-x: -88.5; scale-x: 0.786; scale-y: 0.824; }
        frame 67 { x: 19.2; y: 54.5; skew-x: -88.6; scale-x: 0.793; scale-y: 0.812; }
        frame 68 { x: 19.5; y: 53.3; skew-x: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 69 { x: 18.2; y: 54.1; skew-x: -87.1; scale-x: 0.79; scale-y: 0.82; }
        frame 70 { x: 17; y: 55; skew-x: -85.6; scale-x: 0.779; scale-y: 0.84; }
        frame 71 { x: 15.8; y: 55.7; skew-x: -84.1; scale-x: 0.769; scale-y: 0.861; }
        frame 72 { x: 14.6; y: 56.5; skew-x: -82.6; scale-x: 0.759; scale-y: 0.881; }
        frame 73 { x: 13.4; y: 57.1; skew-x: -81.1; scale-x: 0.748; scale-y: 0.901; }
        frame 74 { x: 12.3; y: 57.9; skew-x: -79.6; scale-x: 0.738; scale-y: 0.921; }
        frame 75 { x: 11.3; y: 58.4; skew-x: -78.1; scale-x: 0.728; scale-y: 0.942; }
        frame 76 { x: 10.3; y: 59; skew-x: -76.5; scale-x: 0.718; scale-y: 0.962; }
        frame 77 { x: 10; y: 61.6; skew-x: -75.4; scale-x: 0.708; scale-y: 0.975; }
        frame 78 { x: 9.7; y: 64.3; skew-x: -74.2; scale-x: 0.699; scale-y: 0.988; }
        frame 79 { x: 9.4; y: 60; skew-x: -80.4; scale-x: 0.768; scale-y: 0.975; }
        frame 80 { x: 10.3; y: 55.4; skew-x: -86.5; scale-x: 0.837; scale-y: 0.962; }
        frame 81 { x: 12.6; y: 55.3; skew-x: -87.1; scale-x: 0.874; scale-y: 0.883; }
        frame 82 { x: 14.7; y: 55.2; skew-x: -87.4; scale-x: 0.911; scale-y: 0.804; }
        frame 83 { x: 16.8; y: 55.1; skew-x: -87.7; scale-x: 0.948; scale-y: 0.726; }
        frame 84 { x: 15.9; y: 54.6; skew-x: -87.9; scale-x: 0.905; scale-y: 0.761; }
        frame 85 { x: 14.9; y: 54.2; skew-x: -88.1; scale-x: 0.862; scale-y: 0.797; }
        frame 86 { x: 13.9; y: 53.7; skew-x: -88.4; scale-x: 0.819; scale-y: 0.832; }
        frame 87 { x: 12.6; y: 53.3; skew-x: -88.5; scale-x: 0.776; scale-y: 0.867; }
        frame 88 { x: 13.7; y: -10000; skew-x: -88.6; scale-x: 0.788; scale-y: 0.834; }
        frame 89 { x: 14.5; skew-x: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 90 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 2.2; y: 44.1; skew-x: -62.1; skew-y: -62.8; scale-x: 0.798; scale-y: 0.798; }
        frame 93 { x: 1.5; y: 26.7; skew-x: -35.3; skew-y: -35.8; scale-x: 0.799; scale-y: 0.799; }
        frame 94 { x: 4.4; y: 12.9; skew-x: -17.5; skew-y: -17.7; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 13.5; y: 0.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 96 { x: 13; y: 1.6; skew-x: -10000; skew-y: -10000; scale-x: 0.808; scale-y: 0.796; }
        frame 97 { x: 12.4; y: 3; scale-x: 0.816; scale-y: 0.792; }
        frame 98 { x: 13; y: 1.7; scale-x: 0.808; scale-y: 0.796; }
        frame 99 { x: 13.5; y: 0.3; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 11.8; y: -17.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_COBCANNON_HUSK1; }
        frame 6 { x: 11.6; y: -16.7; scale-x: 0.803; scale-y: 0.798; cel: -10000; image: none; }
        frame 7 { x: 11.4; y: -16; scale-x: 0.806; scale-y: 0.796; }
        frame 8 { x: 11.2; y: -15.3; scale-x: 0.808; scale-y: 0.794; }
        frame 9 { x: 11; y: -14.6; scale-x: 0.811; scale-y: 0.792; }
        frame 10 { x: 10.8; y: -13.9; scale-x: 0.814; scale-y: 0.79; }
        frame 11 { x: 10.6; y: -13.2; scale-x: 0.817; scale-y: 0.787; }
        frame 12 { x: 10.4; y: -12.5; scale-x: 0.82; scale-y: 0.785; }
        frame 13 { x: 10.2; y: -11.9; scale-x: 0.823; scale-y: 0.783; }
        frame 14 { x: 10; y: -11.2; scale-x: 0.825; scale-y: 0.781; }
        frame 15 { x: 10.2; y: -11.7; skew-x: 0.5; scale-x: 0.823; scale-y: 0.783; }
        frame 16 { x: 10.4; y: -12.5; skew-x: 1.3; scale-x: 0.82; scale-y: 0.785; }
        frame 17 { x: 10.6; y: -13.2; skew-x: 1; scale-x: 0.817; scale-y: 0.787; }
        frame 18 { x: 10.9; y: -13.8; skew-x: 0.8; scale-x: 0.814; scale-y: 0.79; }
        frame 19 { x: 11.1; y: -14.5; skew-x: 0.6; scale-x: 0.811; scale-y: 0.792; }
        frame 20 { x: 11.2; y: -15.4; skew-x: 0.5; scale-x: 0.809; scale-y: 0.794; }
        frame 21 { x: 11.4; y: -16; skew-x: 0.3; scale-x: 0.806; scale-y: 0.796; }
        frame 22 { x: 11.7; y: -16.6; skew-x: 0; scale-x: 0.803; scale-y: 0.798; }
        frame 23 { x: 11.8; y: -17.4; skew-x: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 11.9; y: -17.5; skew-x: -0.2; scale-x: 0.802; }
        frame 26 { x: 11.8; y: -10000; skew-x: -0.4; scale-x: 0.805; }
        frame 27 { x: -10000; y: -17.6; skew-x: -0.7; scale-x: 0.807; }
        frame 28 { y: -10000; skew-x: -1; scale-x: 0.81; }
        frame 29 { x: 11.9; y: -17.5; skew-x: -1.4; scale-x: 0.812; }
        frame 30 { x: 11.8; y: -10000; skew-x: -1.7; scale-x: 0.815; }
        frame 31 { x: -10000; y: -17.6; skew-x: -1.9; scale-x: 0.817; }
        frame 32 { y: -10000; skew-x: -2.2; scale-x: 0.82; }
        frame 33 { y: -17.4; skew-x: -2.7; scale-x: 0.823; }
        frame 34 { y: -17.6; skew-x: -2; scale-x: 0.818; }
        frame 35 { y: -10000; skew-x: -1.4; scale-x: 0.813; }
        frame 36 { y: -17.5; skew-x: -0.9; scale-x: 0.809; }
        frame 37 { y: -10000; skew-x: -0.4; scale-x: 0.804; }
        frame 38 { y: -17.4; skew-x: 0; scale-x: 0.8; }
        frame 39 { y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 40 { x: 11.6; y: -16.7; scale-x: 0.803; scale-y: 0.798; }
        frame 41 { x: 11.4; y: -16; scale-x: 0.806; scale-y: 0.796; }
        frame 42 { x: 11.2; y: -15.3; scale-x: 0.808; scale-y: 0.794; }
        frame 43 { x: 11; y: -14.6; scale-x: 0.811; scale-y: 0.792; }
        frame 44 { x: 10.8; y: -13.9; scale-x: 0.814; scale-y: 0.79; }
        frame 45 { x: 10.6; y: -13.2; scale-x: 0.817; scale-y: 0.787; }
        frame 46 { x: 10.4; y: -12.5; scale-x: 0.82; scale-y: 0.785; }
        frame 47 { x: 10.2; y: -11.9; scale-x: 0.823; scale-y: 0.783; }
        frame 48 { x: 10; y: -11.2; scale-x: 0.825; scale-y: 0.781; }
        frame 49 { x: 10.2; y: -11.7; skew-x: 0.5; scale-x: 0.823; scale-y: 0.783; }
        frame 50 { x: 10.4; y: -12.5; skew-x: 1.3; scale-x: 0.82; scale-y: 0.785; }
        frame 51 { x: 10.6; y: -13.2; skew-x: 1; scale-x: 0.817; scale-y: 0.787; }
        frame 52 { x: 10.9; y: -13.8; skew-x: 0.8; scale-x: 0.814; scale-y: 0.79; }
        frame 53 { x: 11.1; y: -14.5; skew-x: 0.6; scale-x: 0.811; scale-y: 0.792; }
        frame 54 { x: 11.2; y: -15.4; skew-x: 0.5; scale-x: 0.809; scale-y: 0.794; }
        frame 55 { x: 11.4; y: -16; skew-x: 0.3; scale-x: 0.806; scale-y: 0.796; }
        frame 56 { x: 11.7; y: -16.6; skew-x: 0; scale-x: 0.803; scale-y: 0.798; }
        frame 57 { x: 11.8; y: -17.4; skew-x: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 0.6; y: -6.1; skew-x: -14.9; skew-y: -14.7; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: -9.1; y: 6.1; skew-x: -30; skew-y: -29.7; scale-x: 0.798; scale-y: -10000; }
        frame 61 { x: -14.4; y: 18.6; skew-x: -45.3; skew-y: -44.9; scale-x: 0.799; scale-y: 0.8; }
        frame 62 { x: -12.5; y: 33.5; skew-x: -60.5; skew-y: -59.9; scale-x: 0.798; scale-y: 0.799; }
        frame 63 { x: -7.1; y: 46; skew-x: -75.6; skew-y: -75.1; scale-x: 0.799; scale-y: -10000; }
        frame 64 { x: 1.6; y: 55; skew-x: -90.7; skew-y: -89.9; scale-x: 0.8; scale-y: 0.8; }
        frame 65 { x: 0.9; y: 56.1; skew-x: -10000; skew-y: -10000; scale-x: 0.793; scale-y: 0.812; }
        frame 66 { x: 0.3; y: 57.4; scale-x: 0.786; scale-y: 0.824; }
        frame 67 { x: 1; y: 56.2; scale-x: 0.793; scale-y: 0.812; }
        frame 68 { x: 1.6; y: 55; scale-x: 0.8; scale-y: 0.8; }
        frame 69 { x: 0; y: 55.8; skew-x: -92.2; scale-x: 0.79; scale-y: 0.82; }
        frame 70 { x: -1.2; y: 56.5; skew-x: -93.9; scale-x: 0.78; scale-y: 0.84; }
        frame 71 { x: -2.9; y: 57.4; skew-x: -95.4; scale-x: 0.769; scale-y: 0.861; }
        frame 72 { x: -4.3; y: 58; skew-x: -97.2; scale-x: 0.759; scale-y: 0.881; }
        frame 73 { x: -6; y: 58.8; skew-x: -98.7; scale-x: 0.749; scale-y: 0.901; }
        frame 74 { x: -7.6; y: 59.4; skew-x: -100.4; scale-x: 0.739; scale-y: 0.921; }
        frame 75 { x: -9.4; y: 60; skew-x: -101.9; scale-x: 0.729; scale-y: 0.942; }
        frame 76 { x: -11.1; y: 60.5; skew-x: -103.6; scale-x: 0.719; scale-y: 0.962; }
        frame 77 { x: -11.9; y: 63.1; skew-x: -104.7; scale-x: 0.709; scale-y: 0.975; }
        frame 78 { x: -12.6; y: 65.8; skew-x: -105.9; scale-x: 0.701; scale-y: 0.988; }
        frame 79 { x: -11.1; y: 61.7; skew-x: -99.2; scale-x: 0.777; scale-y: 0.975; }
        frame 80 { x: -10000; y: 57; skew-x: -92.5; scale-x: 0.855; scale-y: 0.962; }
        frame 81 { x: -7.3; y: -10000; skew-x: -92.2; scale-x: 0.893; scale-y: 0.883; }
        frame 82 { x: -3.3; skew-x: -91.9; scale-x: 0.931; scale-y: 0.804; }
        frame 83 { x: 0.5; skew-x: -91.7; scale-x: 0.97; scale-y: 0.726; }
        frame 84 { x: -1.3; y: 56.5; skew-x: -91.4; scale-x: 0.921; scale-y: 0.761; }
        frame 85 { x: -3.2; y: 56; skew-x: -91.2; scale-x: 0.873; scale-y: 0.797; }
        frame 86 { x: -5.1; y: 55.5; skew-x: -90.9; scale-x: 0.824; scale-y: 0.832; }
        frame 87 { x: -6.6; y: 55; skew-x: -90.8; scale-x: 0.776; scale-y: 0.867; }
        frame 88 { x: -5; y: -10000; skew-x: -90.7; scale-x: 0.788; scale-y: 0.834; }
        frame 89 { x: -3.3; skew-x: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 90 { x: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: -3.3; }
        frame 92 { x: -13; y: 43; skew-x: -68.1; skew-y: -67.4; scale-x: 0.799; }
        frame 93 { x: -14.9; y: 24.5; skew-x: -45.3; skew-y: -44.9; scale-x: -10000; }
        frame 94 { x: -6.7; y: 2.8; skew-x: -22.5; skew-y: -22.4; }
        frame 95 { x: 11.8; y: -17.4; skew-x: 0; skew-y: 0; scale-x: 0.8; }
        frame 96 { x: 11.2; y: -16; skew-x: -10000; skew-y: -10000; scale-x: 0.808; scale-y: 0.796; }
        frame 97 { x: 10.7; y: -14.6; scale-x: 0.816; scale-y: 0.792; }
        frame 98 { x: 11.3; y: -16; scale-x: 0.808; scale-y: 0.796; }
        frame 99 { x: 11.8; y: -17.4; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CobCannon_blink";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { x: 51.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_COBCANNON_BLINK1; }
        frame 2 { x: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_COBCANNON_BLINK2; }
        frame 3 { image: IMAGE_REANIM_COBCANNON_BLINK1; }
        frame 4 { cel: -1; image: none; }
        frame 5 { cel: -10000; }
        frame 78 { x: -0.2; y: 31.6; skew-x: -105.9; skew-y: -89.9; scale-x: 0.687; scale-y: 0.889; cel: 0; }
        frame 79 { x: 4.2; y: 22.9; skew-x: -100.5; skew-y: -10000; scale-x: 0.772; scale-y: 0.928; cel: -10000; image: IMAGE_REANIM_COBCANNON_BLINK2; }
        frame 80 { x: 7.8; y: 13.4; skew-x: -91.7; scale-x: 0.828; scale-y: -10000; image: none; }
        frame 81 { x: 10.3; y: 11.7; skew-x: -10000; scale-x: 0.857; scale-y: 0.856; }
        frame 82 { x: 12.8; y: 10.2; scale-x: 0.886; scale-y: 0.785; }
        frame 83 { x: 15.1; y: 8.5; scale-x: 0.915; scale-y: 0.713; }
        frame 84 { x: 14.3; y: 10.5; skew-x: -91.9; scale-x: 0.905; scale-y: 0.739; image: IMAGE_REANIM_COBCANNON_BLINK1; }
        frame 85 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 86 { cel: -10000; }
    }
    Track {
        source-name: "CobCannon_log1";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 6.2; y: 35; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_COBCANNON_LOG; }
        frame 6 { x: -10000; y: 35.1; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { y: 35.3; }
        frame 8 { y: 35.5; }
        frame 9 { y: 35.6; }
        frame 10 { y: 35.8; }
        frame 11 { y: 36; }
        frame 12 { y: 36.1; }
        frame 13 { y: 36.3; }
        frame 14 { y: 36.4; }
        frame 15 { y: 36.3; }
        frame 16 { y: 36.1; }
        frame 17 { y: 36; }
        frame 18 { y: 35.8; }
        frame 19 { y: 35.6; }
        frame 20 { y: 35.5; }
        frame 21 { y: 35.3; }
        frame 22 { y: 35.1; }
        frame 23 { y: 35; }
        frame 24 { y: -10000; }
        frame 40 { y: 35.1; }
        frame 41 { y: 35.3; }
        frame 42 { y: 35.5; }
        frame 43 { y: 35.6; }
        frame 44 { y: 35.8; }
        frame 45 { y: 36; }
        frame 46 { y: 36.1; }
        frame 47 { y: 36.3; }
        frame 48 { y: 36.4; }
        frame 49 { y: 36.3; }
        frame 50 { y: 36.1; }
        frame 51 { y: 36; }
        frame 52 { y: 35.8; }
        frame 53 { y: 35.6; }
        frame 54 { y: 35.5; }
        frame 55 { y: 35.3; }
        frame 56 { y: 35.1; }
        frame 57 { y: 35; }
        frame 58 { y: -10000; }
        frame 59 { x: 5.8; skew-x: -0.4; skew-y: -0.4; }
        frame 60 { x: 5.7; skew-x: -0.9; skew-y: -0.9; }
        frame 61 { x: 5.3; skew-x: -1.4; skew-y: -1.4; }
        frame 62 { x: 5.1; skew-x: -1.9; skew-y: -1.9; }
        frame 63 { x: 5.6; skew-x: -0.9; skew-y: -0.9; }
        frame 64 { x: 6.2; skew-x: 0; skew-y: 0; }
        frame 65 { x: -10000; y: 36.2; skew-x: -10000; skew-y: -10000; }
        frame 66 { y: 37.4; }
        frame 67 { y: 36.2; }
        frame 68 { y: 35; }
        frame 69 { y: -10000; }
        frame 77 { y: 37.6; }
        frame 78 { y: 40.2; }
        frame 79 { y: 35.4; scale-y: 0.819; }
        frame 80 { y: 30.4; scale-y: 0.838; }
        frame 81 { y: 31.9; scale-y: 0.826; }
        frame 82 { y: 33.5; scale-y: 0.813; }
        frame 83 { y: 35; scale-y: 0.8; }
        frame 84 { x: 6; y: 35.4; scale-x: 0.802; scale-y: 0.792; }
        frame 85 { x: 5.8; y: 35.7; scale-x: 0.804; scale-y: 0.784; }
        frame 86 { x: 5.6; y: 36; scale-x: 0.806; scale-y: 0.776; }
        frame 87 { x: 5.4; y: 36.3; scale-x: 0.808; scale-y: 0.768; }
        frame 88 { x: 5.8; y: 35.6; scale-x: 0.804; scale-y: 0.784; }
        frame 89 { x: 6.2; y: 35; scale-x: 0.8; scale-y: 0.8; }
        frame 90 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: 5.5; y: 36.2; scale-x: 0.808; scale-y: 0.796; }
        frame 97 { x: 4.8; y: 37.3; scale-x: 0.816; scale-y: 0.792; }
        frame 98 { x: 5.5; y: 36.1; scale-x: 0.808; scale-y: 0.796; }
        frame 99 { x: 6.2; y: 35; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "CobCannon_outerwheels";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 13; y: 31.9; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_COBCANNON_WHEEL; }
        frame 6 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 59 { x: 12.5; y: 32.4; skew-x: -0.9; skew-y: -0.9; }
        frame 60 { x: 12; y: 33.1; skew-x: -2.2; skew-y: -2.2; }
        frame 61 { x: 11.6; y: 33.5; skew-x: -3.2; skew-y: -3.2; }
        frame 62 { x: 11.2; y: 34.4; skew-x: -4.4; skew-y: -4.4; }
        frame 63 { x: 12; y: 33.1; skew-x: -2.2; skew-y: -2.2; }
        frame 64 { x: 13; y: 31.9; skew-x: 0; skew-y: 0; }
        frame 65 { x: -10000; y: 32.9; skew-x: -10000; skew-y: -10000; scale-y: 0.686; }
        frame 66 { y: 33.9; scale-y: 0.672; }
        frame 67 { y: 32.9; scale-y: 0.686; }
        frame 68 { y: 31.9; scale-y: 0.7; }
        frame 69 { y: -10000; scale-y: -10000; }
        frame 77 { x: 12; y: 33.5; scale-x: 0.712; scale-y: 0.677; }
        frame 78 { x: 10.9; y: 35.1; scale-x: 0.724; scale-y: 0.654; }
        frame 79 { x: 11.9; y: 33.5; scale-x: 0.712; scale-y: 0.677; }
        frame 80 { x: 13; y: 31.9; scale-x: 0.7; scale-y: 0.7; }
        frame 81 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 32.3; scale-y: 0.694; }
        frame 85 { y: 32.8; scale-y: 0.688; }
        frame 86 { y: 33.2; scale-y: 0.682; }
        frame 87 { y: 33.6; scale-y: 0.676; }
        frame 88 { y: 32.8; scale-y: 0.688; }
        frame 89 { y: 31.9; scale-y: 0.7; }
        frame 90 { y: -10000; scale-y: -10000; }
        frame 96 { y: 32.7; scale-y: 0.689; }
        frame 97 { y: 33.5; scale-y: 0.677; }
        frame 98 { y: 32.8; scale-y: 0.689; }
        frame 99 { y: 31.9; scale-y: 0.7; }
    }
    Track {
        source-name: "CobCannon_outerwheels2";
        frame-count: 100;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 87.3; y: 31.9; scale-x: 0.7; scale-y: 0.7; cel: 0; image: IMAGE_REANIM_COBCANNON_WHEEL; }
        frame 6 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 59 { x: 86.8; y: 31; skew-x: -0.9; skew-y: -0.9; }
        frame 60 { x: 86.3; y: 30.2; skew-x: -2.2; skew-y: -2.2; }
        frame 61 { x: 85.8; y: 29.3; skew-x: -3.2; skew-y: -3.2; }
        frame 62 { x: 85.3; y: 28.5; skew-x: -4.4; skew-y: -4.4; }
        frame 63 { x: 86.3; y: 30.2; skew-x: -2.2; skew-y: -2.2; }
        frame 64 { x: 87.3; y: 31.9; skew-x: 0; skew-y: 0; }
        frame 65 { x: -10000; y: 32.9; skew-x: -10000; skew-y: -10000; scale-y: 0.686; }
        frame 66 { y: 33.9; scale-y: 0.672; }
        frame 67 { y: 32.9; scale-y: 0.686; }
        frame 68 { y: 31.9; scale-y: 0.7; }
        frame 69 { y: -10000; scale-y: -10000; }
        frame 77 { x: 87.6; y: 33.5; scale-x: 0.712; scale-y: 0.677; }
        frame 78 { x: 87.8; y: 35.1; scale-x: 0.724; scale-y: 0.654; }
        frame 79 { x: 87.6; y: 33.5; scale-x: 0.712; scale-y: 0.677; }
        frame 80 { x: 87.3; y: 31.9; scale-x: 0.7; scale-y: 0.7; }
        frame 81 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 84 { y: 32.3; scale-y: 0.694; }
        frame 85 { y: 32.8; scale-y: 0.688; }
        frame 86 { y: 33.2; scale-y: 0.682; }
        frame 87 { y: 33.6; scale-y: 0.676; }
        frame 88 { y: 32.8; scale-y: 0.688; }
        frame 89 { y: 31.9; scale-y: 0.7; }
        frame 90 { y: -10000; scale-y: -10000; }
        frame 96 { y: 32.7; scale-y: 0.689; }
        frame 97 { y: 33.5; scale-y: 0.677; }
        frame 98 { y: 32.8; scale-y: 0.689; }
        frame 99 { y: 31.9; scale-y: 0.7; }
    }
}
