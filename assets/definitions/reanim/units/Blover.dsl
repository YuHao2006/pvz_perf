export component Blover {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 62;
        frame 33 { cel: -1; }
        frame 34 { cel: -10000; }
    }
    Track {
        source-name: "anim_loop";
        frame-count: 62;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 52 { cel: 0; }
        frame 53 { cel: -10000; }
    }
    Track {
        source-name: "anim_blow";
        frame-count: 62;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 33 { x: 5; cel: 0; }
        frame 34 { x: -10000; cel: -10000; }
        frame 53 { cel: -1; }
        frame 54 { cel: -10000; }
    }
    Track {
        source-name: "Blover_dirt_back";
        frame-count: 62;
        frame 0 { x: 37.4; y: 65.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_BLOVER_DIRT_BACK; }
        frame 1 { x: 37.5; y: 65.2; scale-x: 0.788; scale-y: 0.821; image: none; }
        frame 2 { x: 37.6; y: 65.1; scale-x: 0.777; scale-y: 0.843; }
        frame 3 { x: -10000; y: 65; scale-x: 0.765; scale-y: 0.864; }
        frame 4 { x: 37.7; y: 64.8; scale-x: 0.754; scale-y: 0.886; }
        frame 5 { x: 37.6; y: 65; scale-x: 0.766; scale-y: 0.864; }
        frame 6 { x: -10000; y: 65.1; scale-x: 0.777; scale-y: 0.843; }
        frame 7 { x: 37.5; y: 65.2; scale-x: 0.788; scale-y: 0.821; }
        frame 8 { x: 37.4; y: 65.3; scale-x: 0.8; scale-y: 0.8; }
        frame 9 { x: 37.5; y: 65.2; scale-x: 0.788; scale-y: 0.821; }
        frame 10 { x: 37.6; y: 65.1; scale-x: 0.777; scale-y: 0.843; }
        frame 11 { x: -10000; y: 65; scale-x: 0.765; scale-y: 0.864; }
        frame 12 { x: 37.7; y: 64.8; scale-x: 0.754; scale-y: 0.886; }
        frame 13 { x: 37.6; y: 65.1; scale-x: 0.766; scale-y: 0.864; }
        frame 14 { x: -10000; y: 65.2; scale-x: 0.777; scale-y: 0.843; }
        frame 15 { x: 37.5; y: 65.3; scale-x: 0.788; scale-y: 0.821; }
        frame 16 { x: 37.4; y: 65.5; scale-x: 0.8; scale-y: 0.8; }
        frame 17 { x: 37.5; y: 65.3; scale-x: 0.788; scale-y: 0.821; }
        frame 18 { x: 37.6; y: 65.2; scale-x: 0.777; scale-y: 0.843; }
        frame 19 { x: -10000; y: 65; scale-x: 0.765; scale-y: 0.864; }
        frame 20 { x: 37.7; y: 64.8; scale-x: 0.754; scale-y: 0.886; }
        frame 21 { x: 37.6; y: 65.1; scale-x: 0.766; scale-y: 0.864; }
        frame 22 { x: -10000; y: 65.2; scale-x: 0.777; scale-y: 0.843; }
        frame 23 { x: 37.5; y: 65.3; scale-x: 0.788; scale-y: 0.821; }
        frame 24 { x: 37.4; y: 65.5; scale-x: 0.8; scale-y: 0.8; }
        frame 25 { x: 37.5; y: 65.3; scale-x: 0.788; scale-y: 0.821; }
        frame 26 { x: 37.6; y: 65.1; scale-x: 0.777; scale-y: 0.843; }
        frame 27 { x: -10000; y: 64.9; scale-x: 0.765; scale-y: 0.864; }
        frame 28 { x: 37.7; y: 64.7; scale-x: 0.754; scale-y: 0.886; }
        frame 29 { x: 37.6; y: 64.8; scale-x: 0.766; scale-y: 0.864; }
        frame 30 { x: -10000; y: 65; scale-x: 0.777; scale-y: 0.843; }
        frame 31 { x: 37.5; y: 65.1; scale-x: 0.788; scale-y: 0.821; }
        frame 32 { x: 37.4; y: 65.3; scale-x: 0.8; scale-y: 0.8; }
        frame 33 { x: 37.3; y: -10000; skew-y: -0.9; scale-x: -10000; scale-y: 0.801; }
        frame 34 { x: 37.2; skew-y: -1.9; scale-y: 0.802; }
        frame 35 { x: 37.1; skew-y: -3.2; scale-y: 0.803; }
        frame 36 { x: 37; skew-y: -4.2; scale-y: 0.804; }
        frame 37 { x: 36.9; skew-y: -5.2; scale-y: 0.805; }
        frame 38 { x: 36.7; skew-y: -6.4; scale-y: 0.806; }
        frame 39 { x: 36.6; skew-y: -7.5; scale-y: 0.807; }
        frame 40 { x: 37.1; skew-y: -2.4; scale-y: 0.81; }
        frame 41 { x: 37.6; skew-y: 2.1; scale-y: 0.813; }
        frame 42 { x: 38.1; skew-y: 7; scale-y: 0.815; }
        frame 43 { x: 38.6; skew-y: 12.1; scale-y: 0.818; }
        frame 44 { x: -10000; skew-y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Blover_stem2";
        frame-count: 62;
        frame 0 { x: 30.6; y: 52.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_BLOVER_STEM2; }
        frame 1 { x: 29.3; y: 50.9; skew-x: -1.4; skew-y: -3.7; scale-x: -10000; scale-y: 0.893; image: none; }
        frame 2 { x: 28; y: 49.4; skew-x: -2.9; skew-y: -7.4; scale-x: 0.799; scale-y: 0.986; }
        frame 3 { x: 26.4; y: 48.1; skew-x: -4.4; skew-y: -11.2; scale-x: -10000; scale-y: 1.079; }
        frame 4 { x: 24.6; y: 46.6; skew-x: -6.1; skew-y: -15.1; scale-y: 1.173; }
        frame 5 { x: 23.8; y: 48.9; skew-x: -9.4; skew-y: -18.4; scale-x: 0.798; scale-y: 1.122; }
        frame 6 { x: 23; y: 51.1; skew-x: -12.7; skew-y: -21.7; scale-x: -10000; scale-y: 1.072; }
        frame 7 { x: 22.5; y: 53.5; skew-x: -16.2; skew-y: -25; scale-y: 1.022; }
        frame 8 { x: 21.8; y: 55.7; skew-x: -19.6; skew-y: -28.5; scale-y: 0.974; }
        frame 9 { x: 22.3; y: 53.5; skew-x: -16.2; skew-y: -25; scale-x: 0.797; scale-y: 1.028; }
        frame 10 { x: 23; y: 51.2; skew-x: -12.7; skew-y: -21.7; scale-x: 0.798; scale-y: 1.084; }
        frame 11 { x: 23.7; y: 48.9; skew-x: -9.4; skew-y: -18.4; scale-x: -10000; scale-y: 1.14; }
        frame 12 { x: 24.5; y: 46.7; skew-x: -6.1; skew-y: -15.1; scale-x: 0.799; scale-y: 1.196; }
        frame 13 { x: 26.1; y: 47.9; skew-x: -4.4; skew-y: -11.2; scale-x: -10000; scale-y: 1.097; }
        frame 14 { x: 27.8; y: 49.3; skew-x: -2.9; skew-y: -7.4; scale-y: 0.998; }
        frame 15 { x: 29.2; y: 50.8; skew-x: -1.4; skew-y: -3.7; scale-x: 0.8; scale-y: 0.899; }
        frame 16 { x: 30.6; y: 52.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: 0.8; }
        frame 17 { x: 33; y: 49.5; skew-x: 6.3; skew-y: 6.3; scale-x: 0.799; scale-y: 0.904; }
        frame 18 { x: 35.7; y: 46.8; skew-x: 12.5; skew-y: 12.5; scale-x: 0.798; scale-y: 1.007; }
        frame 19 { x: 38.8; y: 44.3; skew-x: 18.8; skew-y: 18.8; scale-x: -10000; scale-y: 1.111; }
        frame 20 { x: 42.1; y: 42.1; skew-x: 25.3; skew-y: 25.3; scale-y: 1.216; }
        frame 21 { x: 43.2; y: 43.9; skew-x: 30.3; skew-y: 30.3; scale-x: 0.796; scale-y: 1.109; }
        frame 22 { x: 44.3; y: 45.6; skew-x: 35.4; skew-y: 35.4; scale-x: 0.795; scale-y: 1.004; }
        frame 23 { x: 45.1; y: 47.3; skew-x: 40.6; skew-y: 40.6; scale-x: -10000; scale-y: 0.899; }
        frame 24 { x: 45.8; y: 49; skew-x: 45.6; skew-y: 45.6; scale-x: 0.796; scale-y: 0.796; }
        frame 25 { x: 44.7; y: 47.6; skew-x: 40.1; skew-y: 40.1; scale-x: 0.795; scale-y: 0.874; }
        frame 26 { x: 43.5; y: 46.3; skew-x: 34.8; skew-y: 34.8; scale-x: -10000; scale-y: 0.953; }
        frame 27 { x: 42; y: 44.9; skew-x: 29.3; skew-y: 29.3; scale-x: 0.796; scale-y: 1.033; }
        frame 28 { x: 40.5; y: 43.4; skew-x: 24; skew-y: 24; scale-x: 0.797; scale-y: 1.114; }
        frame 29 { x: 37.6; y: 45.3; skew-x: 17.8; skew-y: 17.8; scale-x: -10000; scale-y: 1.035; }
        frame 30 { x: 35.1; y: 47.6; skew-x: 11.8; skew-y: 11.8; scale-x: 0.798; scale-y: 0.956; }
        frame 31 { x: 32.6; y: 49.8; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.878; }
        frame 32 { x: 30.6; y: 52.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 33 { x: 29.1; y: 53.5; skew-x: -5.2; skew-y: -5.9; scale-x: 0.799; scale-y: 0.801; }
        frame 34 { x: 27.8; y: 55; skew-x: -10.4; skew-y: -12.2; scale-x: -10000; scale-y: 0.803; }
        frame 35 { x: 26.6; y: 56.5; skew-x: -15.7; skew-y: -18.2; scale-x: 0.798; scale-y: 0.804; }
        frame 36 { x: 25.3; y: 58; skew-x: -20.9; skew-y: -24.4; scale-x: -10000; scale-y: 0.806; }
        frame 37 { x: 24.3; y: 59.6; skew-x: -26.2; skew-y: -30.5; scale-x: 0.797; scale-y: 0.808; }
        frame 38 { x: 23.2; y: 61.2; skew-x: -31.5; skew-y: -36.7; scale-x: -10000; scale-y: 0.809; }
        frame 39 { x: 22.2; y: 63.1; skew-x: -36.7; skew-y: -42.8; scale-y: 0.812; }
        frame 40 { x: 26.2; y: 56.6; skew-x: -14.2; skew-y: -18.9; scale-y: 0.838; }
        frame 41 { x: 32.1; y: 51.2; skew-x: 7.9; skew-y: 4.9; scale-y: 0.865; }
        frame 42 { x: 37.5; y: 47.5; skew-x: 20.8; skew-y: 19.3; scale-y: 0.934; }
        frame 43 { x: 43.6; y: 44.8; skew-x: 33.8; skew-y: 33.8; scale-x: 0.798; scale-y: 1.005; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Blover_stem1";
        frame-count: 62;
        frame 0 { x: 29.1; y: 38; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_BLOVER_STEM1; }
        frame 1 { x: 26.8; y: 36.3; skew-x: -2.7; skew-y: -3.2; scale-x: 0.802; scale-y: 0.857; image: none; }
        frame 2 { x: 24.4; y: 34.7; skew-x: -5.7; skew-y: -6.7; scale-x: 0.804; scale-y: 0.915; }
        frame 3 { x: 21.9; y: 33.2; skew-x: -8.7; skew-y: -10.2; scale-x: 0.806; scale-y: 0.972; }
        frame 4 { x: 19.6; y: 31.6; skew-x: -11.8; skew-y: -13.6; scale-x: 0.808; scale-y: 1.03; }
        frame 5 { x: 17.7; y: 34.3; skew-x: -12; skew-y: -17.5; scale-x: 0.816; scale-y: 0.993; }
        frame 6 { x: 15.9; y: 37; skew-x: -12.2; skew-y: -21.5; scale-x: 0.824; scale-y: 0.957; }
        frame 7 { x: 14; y: 39.7; skew-x: -12.5; skew-y: -25.5; scale-x: 0.833; scale-y: 0.92; }
        frame 8 { x: 12.2; y: 42.6; skew-x: -12.8; skew-y: -29.5; scale-x: 0.842; scale-y: 0.885; }
        frame 9 { x: 13.9; y: 40.3; skew-x: -12.5; skew-y: -25.5; scale-x: 0.833; scale-y: 0.886; }
        frame 10 { x: 15.8; y: 37.9; skew-x: -12.2; skew-y: -21.5; scale-x: 0.824; scale-y: 0.888; }
        frame 11 { x: 17.6; y: 35.6; skew-x: -12; skew-y: -17.5; scale-x: 0.816; scale-y: 0.891; }
        frame 12 { x: 19.5; y: 33.2; skew-x: -11.8; skew-y: -13.6; scale-x: 0.808; scale-y: 0.893; }
        frame 13 { x: 22; y: 34.4; skew-x: -8.7; skew-y: -10.2; scale-x: 0.806; scale-y: 0.87; }
        frame 14 { x: 24.4; y: 35.5; skew-x: -5.7; skew-y: -6.7; scale-x: 0.804; scale-y: 0.846; }
        frame 15 { x: 26.9; y: 36.8; skew-x: -2.7; skew-y: -3.2; scale-x: 0.802; scale-y: 0.823; }
        frame 16 { x: 29.1; y: 38; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 17 { x: 32.6; y: 35.6; skew-x: 1; skew-y: 4.3; scale-x: 0.816; scale-y: 0.856; }
        frame 18 { x: 36.3; y: 33.2; skew-x: 2; skew-y: 8.5; scale-x: 0.833; scale-y: 0.911; }
        frame 19 { x: 40; y: 30.9; skew-x: 3; skew-y: 12.8; scale-x: 0.849; scale-y: 0.967; }
        frame 20 { x: 43.8; y: 28.6; skew-x: 4; skew-y: 17; scale-x: 0.866; scale-y: 1.023; }
        frame 21 { x: 45.5; y: 31.2; skew-x: 7.1; skew-y: 21.3; scale-x: 0.857; scale-y: 1.006; }
        frame 22 { x: 47.1; y: 33.8; skew-x: 10.3; skew-y: 25.6; scale-x: 0.848; scale-y: 0.989; }
        frame 23 { x: 48.6; y: 36.5; skew-x: 13.5; skew-y: 29.8; scale-x: 0.84; scale-y: 0.972; }
        frame 24 { x: 50.3; y: 39.1; skew-x: 16.7; skew-y: 34.2; scale-x: 0.832; scale-y: 0.957; }
        frame 25 { x: 48.7; y: 36.3; skew-x: 14.5; skew-y: 30.8; scale-x: 0.84; scale-y: 0.97; }
        frame 26 { x: 47.1; y: 33.6; skew-x: 12.3; skew-y: 27.5; scale-x: 0.848; scale-y: 0.986; }
        frame 27 { x: 45.6; y: 30.9; skew-x: 10; skew-y: 24.1; scale-x: 0.857; scale-y: 1.001; }
        frame 28 { x: 44; y: 28.5; skew-x: 7.9; skew-y: 20.8; scale-x: 0.866; scale-y: 1.017; }
        frame 29 { x: 40.1; y: 30.8; skew-x: 5.8; skew-y: 15.5; scale-x: 0.849; scale-y: 0.962; }
        frame 30 { x: 36.4; y: 33.1; skew-x: 3.8; skew-y: 10.3; scale-x: 0.833; scale-y: 0.908; }
        frame 31 { x: 32.6; y: 35.5; skew-x: 1.8; skew-y: 5.1; scale-x: 0.816; scale-y: 0.854; }
        frame 32 { x: 29.1; y: 38; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 33 { x: 27; y: 39.1; skew-x: -1.2; skew-y: -3.4; scale-x: 0.792; scale-y: 0.808; }
        frame 34 { x: 24.8; y: 40.3; skew-x: -2.4; skew-y: -7.2; scale-x: 0.784; scale-y: 0.815; }
        frame 35 { x: 22.7; y: 41.4; skew-x: -3.7; skew-y: -10.7; scale-x: 0.775; scale-y: 0.823; }
        frame 36 { x: 20.6; y: 42.6; skew-x: -4.9; skew-y: -14.5; scale-x: 0.767; scale-y: 0.831; }
        frame 37 { x: 18.5; y: 43.7; skew-x: -6.2; skew-y: -18.2; scale-x: 0.759; scale-y: 0.839; }
        frame 38 { x: 16.2; y: 45.1; skew-x: -7.5; skew-y: -21.7; scale-x: 0.751; scale-y: 0.846; }
        frame 39 { x: 14.3; y: 46.6; skew-x: -8.9; skew-y: -25.5; scale-x: 0.743; scale-y: 0.855; }
        frame 40 { x: 22.8; y: 42.3; skew-x: -3.7; skew-y: -11.7; scale-x: 0.758; scale-y: 0.887; }
        frame 41 { x: 31.3; y: 38.3; skew-x: 1; skew-y: 2.1; scale-x: 0.774; scale-y: 0.92; }
        frame 42 { x: 40.1; y: 32.8; skew-x: 9.1; skew-y: 13.8; scale-x: 0.789; scale-y: 1.054; }
        frame 43 { x: 50.1; y: 27.6; skew-x: 17.5; skew-y: 25.9; scale-x: 0.805; scale-y: 1.189; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Blover_dirt_front";
        frame-count: 62;
        frame 0 { x: 36.3; y: 67.7; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_BLOVER_DIRT_FRONT; }
        frame 1 { x: 36.4; y: 67.6; scale-x: 0.788; scale-y: 0.821; image: none; }
        frame 2 { x: 36.5; y: -10000; scale-x: 0.777; scale-y: 0.843; }
        frame 3 { x: 36.6; y: 67.5; scale-x: 0.765; scale-y: 0.864; }
        frame 4 { x: 36.7; y: 67.3; scale-x: 0.754; scale-y: 0.886; }
        frame 5 { x: 36.6; y: 67.5; scale-x: 0.766; scale-y: 0.864; }
        frame 6 { x: 36.5; y: 67.6; scale-x: 0.777; scale-y: 0.843; }
        frame 7 { x: 36.4; y: -10000; scale-x: 0.788; scale-y: 0.821; }
        frame 8 { x: 36.3; y: 67.7; scale-x: 0.8; scale-y: 0.8; }
        frame 9 { x: 36.4; y: 67.6; scale-x: 0.788; scale-y: 0.821; }
        frame 10 { x: 36.5; y: -10000; scale-x: 0.777; scale-y: 0.843; }
        frame 11 { x: 36.6; y: 67.5; scale-x: 0.765; scale-y: 0.864; }
        frame 12 { x: 36.7; y: 67.3; scale-x: 0.754; scale-y: 0.886; }
        frame 13 { x: 36.6; y: 67.5; scale-x: 0.766; scale-y: 0.864; }
        frame 14 { x: 36.5; y: 67.6; scale-x: 0.777; scale-y: 0.843; }
        frame 15 { x: 36.4; y: -10000; scale-x: 0.788; scale-y: 0.821; }
        frame 16 { x: 36.3; y: 67.7; scale-x: 0.8; scale-y: 0.8; }
        frame 17 { x: 36.4; y: 67.6; scale-x: 0.788; scale-y: 0.821; }
        frame 18 { x: 36.5; y: -10000; scale-x: 0.777; scale-y: 0.843; }
        frame 19 { x: 36.6; y: 67.5; scale-x: 0.765; scale-y: 0.864; }
        frame 20 { x: 36.7; y: 67.3; scale-x: 0.754; scale-y: 0.886; }
        frame 21 { x: 36.6; y: 67.5; scale-x: 0.766; scale-y: 0.864; }
        frame 22 { x: 36.5; y: 67.6; scale-x: 0.777; scale-y: 0.843; }
        frame 23 { x: 36.4; y: -10000; scale-x: 0.788; scale-y: 0.821; }
        frame 24 { x: 36.3; y: 67.7; scale-x: 0.8; scale-y: 0.8; }
        frame 25 { x: 36.4; y: 67.6; scale-x: 0.788; scale-y: 0.821; }
        frame 26 { x: 36.5; y: -10000; scale-x: 0.777; scale-y: 0.843; }
        frame 27 { x: 36.6; y: 67.5; scale-x: 0.765; scale-y: 0.864; }
        frame 28 { x: 36.7; y: 67.3; scale-x: 0.754; scale-y: 0.886; }
        frame 29 { x: 36.6; y: 67.5; scale-x: 0.766; scale-y: 0.864; }
        frame 30 { x: 36.5; y: 67.6; scale-x: 0.777; scale-y: 0.843; }
        frame 31 { x: 36.4; y: -10000; scale-x: 0.788; scale-y: 0.821; }
        frame 32 { x: 36.3; y: 67.7; scale-x: 0.8; scale-y: 0.8; }
        frame 33 { x: 36.2; y: -10000; skew-y: -0.9; scale-x: -10000; scale-y: 0.801; }
        frame 34 { x: 36.1; y: 67.6; skew-y: -1.9; scale-y: 0.802; }
        frame 35 { x: -10000; y: 67.7; skew-y: -3.2; scale-y: 0.803; }
        frame 36 { y: 67.6; skew-y: -4.2; scale-y: 0.804; }
        frame 37 { x: 36; y: -10000; skew-y: -5.2; scale-y: 0.805; }
        frame 38 { x: -10000; skew-y: -6.4; scale-y: 0.806; }
        frame 39 { x: 35.9; skew-y: -7.5; scale-y: 0.807; }
        frame 40 { x: 36.1; skew-y: -2.4; scale-y: 0.81; }
        frame 41 { x: 36.5; y: 67.5; skew-y: 2.1; scale-y: 0.813; }
        frame 42 { x: 36.6; y: -10000; skew-y: 7; scale-y: 0.815; }
        frame 43 { x: 37; y: 67.6; skew-y: 12.1; scale-y: 0.818; }
        frame 44 { x: -10000; y: -10000; skew-y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Blover_petals";
        frame-count: 62;
        frame 0 { x: 21.4; y: -14.3; image: IMAGE_REANIM_BLOVER_PETAL; }
        frame 1 { x: 18.6; y: -14.7; image: none; }
        frame 2 { x: 15.7; y: -15.2; }
        frame 3 { x: 12.9; y: -18; }
        frame 4 { x: 10; y: -20.9; }
        frame 5 { x: 8.6; y: -19.5; }
        frame 6 { x: 7.2; y: -18.2; }
        frame 7 { x: 5.8; y: -14.4; }
        frame 8 { x: 4.3; y: -10.7; }
        frame 9 { x: 5.8; y: -11.4; }
        frame 10 { x: 7.2; y: -12.2; }
        frame 11 { x: 8.6; y: -16.5; }
        frame 12 { x: 10; y: -20.9; }
        frame 13 { x: 12.9; y: -20.1; }
        frame 14 { x: 15.7; y: -19.4; }
        frame 15 { x: 18.6; y: -16.8; }
        frame 16 { x: 21.4; y: -14.3; }
        frame 17 { x: 24.7; y: -14.7; }
        frame 18 { x: 28; y: -15.2; }
        frame 19 { x: 31.3; y: -18.6; }
        frame 20 { x: 34.6; y: -22.1; }
        frame 21 { x: 35.6; y: -20; }
        frame 22 { x: 36.7; y: -17.9; }
        frame 23 { x: 37.8; y: -14; }
        frame 24 { x: 38.8; y: -10.1; }
        frame 25 { x: 37.8; y: -11.4; }
        frame 26 { x: 36.7; y: -12.8; }
        frame 27 { x: 35.6; y: -17.4; }
        frame 28 { x: 34.6; y: -22.1; }
        frame 29 { x: 31.3; y: -21.5; }
        frame 30 { x: 28; y: -20.9; }
        frame 31 { x: 24.7; y: -17.6; }
        frame 32 { x: 21.4; y: -14.3; }
        frame 33 { x: 19.5; y: -13.1; scale-x: 0.993; }
        frame 34 { x: 17.4; y: -11.9; scale-x: 0.985; }
        frame 35 { x: 15.5; y: -10.8; scale-x: 0.978; }
        frame 36 { x: 13.5; y: -9.6; scale-x: 0.971; }
        frame 37 { x: 11.5; y: -8.5; scale-x: 0.963; }
        frame 38 { x: 9.5; y: -7.3; scale-x: 0.956; }
        frame 39 { x: 7.5; y: -6.1; scale-x: 0.949; }
        frame 40 { x: 14.9; y: -10.6; scale-x: 0.952; }
        frame 41 { x: 22.2; y: -15.1; scale-x: 0.956; }
        frame 42 { x: 30.8; y: -16.9; scale-x: 0.978; }
        frame 43 { x: 39.2; y: -18.7; scale-x: 1; }
        frame 44 { x: 71.9; y: -23.6; skew-x: 39.9; skew-y: 39.9; scale-x: 1.098; scale-y: 1.098; }
        frame 45 { x: 103.2; y: -3.9; skew-x: 80.2; skew-y: 80.2; scale-x: 1.199; scale-y: 1.199; }
        frame 46 { x: 115.6; y: 34.4; skew-x: 120; skew-y: 120; scale-x: 1.3; scale-y: 1.3; }
        frame 47 { x: 97.5; y: 71.7; skew-x: 160; skew-y: 160; scale-x: 1.332; scale-y: 1.332; }
        frame 48 { x: 58.4; y: 89; skew-x: 200; skew-y: 200; scale-x: 1.365; scale-y: 1.365; }
        frame 49 { x: 16.2; y: 76.9; skew-x: 240; skew-y: 240; scale-x: 1.4; scale-y: 1.4; }
        frame 50 { x: -5.8; y: 39.6; skew-x: 279.8; skew-y: 279.8; scale-x: 1.366; scale-y: 1.366; }
        frame 51 { x: 1.1; y: -2.4; skew-x: 320.1; skew-y: 320.1; scale-x: 1.331; scale-y: 1.331; }
        frame 52 { x: 32.8; y: -29.1; skew-x: 360; skew-y: 360; scale-x: 1.3; scale-y: 1.3; }
        frame 53 { x: 74.4; y: -32.6; skew-x: 399.9; skew-y: 399.9; scale-x: 1.331; scale-y: 1.331; }
        frame 54 { x: 109.3; y: -7.9; skew-x: 440.2; skew-y: 440.2; scale-x: 1.366; scale-y: 1.366; }
        frame 55 { x: 120.1; y: 34; skew-x: 480; skew-y: 480; scale-x: 1.4; scale-y: 1.4; }
        frame 56 { x: 99.5; y: 73.4; skew-x: 520; skew-y: 520; scale-x: 1.398; scale-y: 1.398; }
        frame 57 { x: 58.5; y: 90.3; skew-x: 560; skew-y: 560; scale-x: 1.4; scale-y: -10000; }
        frame 58 { x: 16.2; y: 76.9; skew-x: 600; skew-y: 600; scale-x: -10000; scale-y: 1.4; }
        frame 59 { x: -5.8; y: 39.6; skew-x: 639.8; skew-y: 639.8; scale-x: 1.366; scale-y: 1.366; }
        frame 60 { x: 1.1; y: -2.4; skew-x: 680.1; skew-y: 680.1; scale-x: 1.331; scale-y: 1.331; }
        frame 61 { x: 32.8; y: -29.1; skew-x: 720; skew-y: 720; scale-x: 1.3; scale-y: 1.3; }
    }
    Track {
        source-name: "Blover_petals2";
        frame-count: 62;
        frame 0 { x: 7.6; y: 66; skew-x: 240; skew-y: 240; image: IMAGE_REANIM_BLOVER_PETAL; }
        frame 1 { x: 4.7; y: 65.6; skew-x: -10000; skew-y: -10000; image: none; }
        frame 2 { x: 1.9; y: 65.1; }
        frame 3 { x: -0.9; y: 62.3; }
        frame 4 { x: -3.7; y: 59.4; }
        frame 5 { x: -5.1; y: 60.8; }
        frame 6 { x: -6.6; y: 62.1; }
        frame 7 { x: -8; y: 65.8; }
        frame 8 { x: -9.4; y: 69.6; }
        frame 9 { x: -8; y: 68.9; }
        frame 10 { x: -6.6; y: 68.1; }
        frame 11 { x: -5.1; y: 63.8; }
        frame 12 { x: -3.7; y: 59.4; }
        frame 13 { x: -0.9; y: 60.1; }
        frame 14 { x: 1.9; y: 60.9; }
        frame 15 { x: 4.7; y: 63.5; }
        frame 16 { x: 7.6; y: 66; }
        frame 17 { x: 10.9; y: 65.6; }
        frame 18 { x: 14.2; y: 65.1; }
        frame 19 { x: 17.5; y: 61.6; }
        frame 20 { x: 20.8; y: 58.2; }
        frame 21 { x: 21.8; y: 60.3; }
        frame 22 { x: 22.9; y: 62.4; }
        frame 23 { x: 23.9; y: 66.3; }
        frame 24 { x: 25; y: 70.2; }
        frame 25 { x: 23.9; y: 68.9; }
        frame 26 { x: 22.9; y: 67.5; }
        frame 27 { x: 21.8; y: 62.9; }
        frame 28 { x: 20.8; y: 58.2; }
        frame 29 { x: 17.5; y: 58.8; }
        frame 30 { x: 14.2; y: 59.4; }
        frame 31 { x: 10.9; y: 62.7; }
        frame 32 { x: 7.6; y: 66; }
        frame 33 { x: 5.7; y: 67.2; skew-x: 240.2; skew-y: 239.8; scale-x: 0.998; scale-y: 0.995; }
        frame 34 { x: 3.8; y: 68.4; skew-x: 240.4; skew-y: 239.6; scale-x: 0.996; scale-y: 0.989; }
        frame 35 { x: 1.9; y: 69.5; skew-x: 240.5; skew-y: 239.4; scale-x: 0.995; scale-y: 0.984; }
        frame 36 { x: 0.1; y: 70.7; skew-x: 240.7; skew-y: 239.3; scale-x: 0.993; scale-y: 0.978; }
        frame 37 { x: -1.7; y: 71.8; skew-x: 240.9; skew-y: 239.1; scale-x: 0.991; scale-y: 0.973; }
        frame 38 { x: -3.6; y: 73; skew-x: 241.1; skew-y: 238.9; scale-x: 0.989; scale-y: 0.967; }
        frame 39 { x: -5.5; y: 74.2; skew-x: 241.3; skew-y: 238.7; scale-x: 0.987; scale-y: 0.962; }
        frame 40 { x: 1.7; y: 69.7; skew-x: 241.2; skew-y: 238.8; scale-x: 0.988; scale-y: 0.965; }
        frame 41 { x: 9; y: 65.2; skew-x: 241.1; skew-y: 238.9; scale-x: 0.989; scale-y: 0.967; }
        frame 42 { x: 17.2; y: 63.4; skew-x: 240.5; skew-y: 239.5; scale-x: 0.995; scale-y: 0.984; }
        frame 43 { x: 25.4; y: 61.6; skew-x: 240; skew-y: 240; scale-x: 1; scale-y: 1; }
        frame 44 { x: 3.5; y: 34.3; skew-x: 279.9; skew-y: 279.9; scale-x: 1.098; scale-y: 1.098; }
        frame 45 { x: 5.4; y: -3.8; skew-x: 320.2; skew-y: 320.2; scale-x: 1.199; scale-y: 1.199; }
        frame 46 { x: 34; y: -33.3; skew-x: 360; skew-y: 360; scale-x: 1.3; scale-y: 1.3; }
        frame 47 { x: 78.2; y: -35.1; skew-x: 400; skew-y: 400; scale-x: 1.332; scale-y: 1.332; }
        frame 48 { x: 113.7; y: -7.5; skew-x: 440; skew-y: 440; scale-x: 1.365; scale-y: 1.365; }
        frame 49 { x: 123.4; y: 37.4; skew-x: 480; skew-y: 480; scale-x: 1.4; scale-y: 1.4; }
        frame 50 { x: 99; y: 77; skew-x: 519.8; skew-y: 519.8; scale-x: 1.366; scale-y: 1.366; }
        frame 51 { x: 55.6; y: 91.4; skew-x: 560.1; skew-y: 560.1; scale-x: 1.331; scale-y: 1.331; }
        frame 52 { x: 14.8; y: 75.3; skew-x: 600; skew-y: 600; scale-x: 1.3; scale-y: 1.3; }
        frame 53 { x: -8.3; y: 37.6; skew-x: 639.9; skew-y: 639.9; scale-x: 1.331; scale-y: 1.331; }
        frame 54 { x: -2; y: -7.8; skew-x: 680.2; skew-y: 680.2; scale-x: 1.366; scale-y: 1.366; }
        frame 55 { x: 32.3; y: -39; skew-x: 720; skew-y: 720; scale-x: 1.4; scale-y: 1.4; }
        frame 56 { x: 79.2; y: -38.8; skew-x: 760; skew-y: 760; scale-x: 1.398; scale-y: 1.398; }
        frame 57 { x: 115.2; y: -8.7; skew-x: 800; skew-y: 800; scale-x: 1.399; scale-y: 1.4; }
        frame 58 { x: 123.4; y: 37.4; skew-x: 840; skew-y: 840; scale-x: 1.4; scale-y: -10000; }
        frame 59 { x: 99; y: 77; skew-x: 879.8; skew-y: 879.8; scale-x: 1.366; scale-y: 1.366; }
        frame 60 { x: 55.6; y: 91.4; skew-x: 920.1; skew-y: 920.1; scale-x: 1.331; scale-y: 1.331; }
        frame 61 { x: 14.8; y: 75.3; skew-x: 960; skew-y: 960; scale-x: 1.3; scale-y: 1.3; }
    }
    Track {
        source-name: "Blover_petals3";
        frame-count: 62;
        frame 0 { x: 85.4; y: 35.1; skew-x: 120; skew-y: 120; image: IMAGE_REANIM_BLOVER_PETAL; }
        frame 1 { x: 82.6; y: 34.6; skew-x: -10000; skew-y: -10000; image: none; }
        frame 2 { x: 79.7; y: 34.2; }
        frame 3 { x: 76.9; y: 31.4; }
        frame 4 { x: 74; y: 28.5; }
        frame 5 { x: 72.6; y: 29.9; }
        frame 6 { x: 71.2; y: 31.2; }
        frame 7 { x: 69.8; y: 35; }
        frame 8 { x: 68.3; y: 38.7; }
        frame 9 { x: 69.8; y: 38; }
        frame 10 { x: 71.2; y: 37.2; }
        frame 11 { x: 72.6; y: 32.9; }
        frame 12 { x: 74; y: 28.5; }
        frame 13 { x: 76.9; y: 29.3; }
        frame 14 { x: 79.7; y: 30; }
        frame 15 { x: 82.6; y: 32.5; }
        frame 16 { x: 85.4; y: 35.1; }
        frame 17 { x: 88.7; y: 34.6; }
        frame 18 { x: 92; y: 34.2; }
        frame 19 { x: 95.3; y: 30.8; }
        frame 20 { x: 98.6; y: 27.3; }
        frame 21 { x: 99.7; y: 29.4; }
        frame 22 { x: 100.7; y: 31.5; }
        frame 23 { x: 101.8; y: 35.4; }
        frame 24 { x: 102.8; y: 39.3; }
        frame 25 { x: 101.8; y: 38; }
        frame 26 { x: 100.7; y: 36.6; }
        frame 27 { x: 99.7; y: 32; }
        frame 28 { x: 98.6; y: 27.3; }
        frame 29 { x: 95.3; y: 27.9; }
        frame 30 { x: 92; y: 28.5; }
        frame 31 { x: 88.7; y: 31.8; }
        frame 32 { x: 85.4; y: 35.1; }
        frame 33 { x: 83; y: 36.3; skew-x: 119.8; skew-y: 120.2; scale-x: 0.998; scale-y: 0.995; }
        frame 34 { x: 80.5; y: 37.5; skew-x: 119.6; skew-y: 120.4; scale-x: 0.996; scale-y: 0.989; }
        frame 35 { x: 78.1; y: 38.6; skew-x: 119.5; skew-y: 120.6; scale-x: 0.995; scale-y: 0.984; }
        frame 36 { x: 75.6; y: 39.8; skew-x: 119.3; skew-y: 120.7; scale-x: 0.993; scale-y: 0.978; }
        frame 37 { x: 73.2; y: 40.9; skew-x: 119.1; skew-y: 120.9; scale-x: 0.991; scale-y: 0.973; }
        frame 38 { x: 70.7; y: 42.1; skew-x: 118.9; skew-y: 121.1; scale-x: 0.989; scale-y: 0.967; }
        frame 39 { x: 68.2; y: 43.3; skew-x: 118.7; skew-y: 121.3; scale-x: 0.987; scale-y: 0.962; }
        frame 40 { x: 75.9; y: 38.8; skew-x: 118.8; skew-y: 121.2; scale-x: 0.988; scale-y: 0.965; }
        frame 41 { x: 83.5; y: 34.3; skew-x: 118.9; skew-y: 121.1; scale-x: 0.989; scale-y: 0.967; }
        frame 42 { x: 93.4; y: 32.5; skew-x: 119.5; skew-y: 120.6; scale-x: 0.995; scale-y: 0.984; }
        frame 43 { x: 103.2; y: 30.7; skew-x: 120; skew-y: 120; scale-x: 1; scale-y: 1; }
        frame 44 { x: 90.9; y: 63; skew-x: 159.9; skew-y: 159.9; scale-x: 1.098; scale-y: 1.098; }
        frame 45 { x: 57.8; y: 81.7; skew-x: 200.2; skew-y: 200.2; scale-x: 1.199; scale-y: 1.199; }
        frame 46 { x: 18.2; y: 74.3; skew-x: 240; skew-y: 240; scale-x: 1.3; scale-y: 1.3; }
        frame 47 { x: -5.1; y: 39; skew-x: 280; skew-y: 280; scale-x: 1.332; scale-y: 1.332; }
        frame 48 { x: -0.5; y: -4.3; skew-x: 320; skew-y: 320; scale-x: 1.365; scale-y: 1.365; }
        frame 49 { x: 31.4; y: -35.2; skew-x: 360; skew-y: 360; scale-x: 1.4; scale-y: 1.4; }
        frame 50 { x: 75.6; y: -34.8; skew-x: 399.8; skew-y: 399.8; scale-x: 1.366; scale-y: 1.366; }
        frame 51 { x: 108.8; y: -6.5; skew-x: 440.1; skew-y: 440.1; scale-x: 1.331; scale-y: 1.331; }
        frame 52 { x: 116; y: 35.1; skew-x: 480; skew-y: 480; scale-x: 1.3; scale-y: 1.3; }
        frame 53 { x: 97.5; y: 72.5; skew-x: 519.9; skew-y: 519.9; scale-x: 1.331; scale-y: 1.331; }
        frame 54 { x: 57.6; y: 89.7; skew-x: 560.2; skew-y: 560.2; scale-x: 1.366; scale-y: 1.366; }
        frame 55 { x: 15.3; y: 77; skew-x: 600; skew-y: 600; scale-x: 1.4; scale-y: 1.4; }
        frame 56 { x: -8.2; y: 38.9; skew-x: 640; skew-y: 640; scale-x: 1.398; scale-y: 1.398; }
        frame 57 { x: -1.9; y: -5.3; skew-x: 680; skew-y: 680; scale-x: 1.399; scale-y: 1.399; }
        frame 58 { x: 31.4; y: -35.2; skew-x: 720; skew-y: 720; scale-x: 1.4; scale-y: 1.4; }
        frame 59 { x: 75.6; y: -34.8; skew-x: 759.8; skew-y: 759.8; scale-x: 1.366; scale-y: 1.366; }
        frame 60 { x: 108.8; y: -6.5; skew-x: 800.1; skew-y: 800.1; scale-x: 1.331; scale-y: 1.331; }
        frame 61 { x: 116; y: 35.1; skew-x: 840; skew-y: 840; scale-x: 1.3; scale-y: 1.3; }
    }
    Track {
        source-name: "Blover_head";
        frame-count: 62;
        frame 0 { x: 21.9; y: 15.3; scale-x: 0.797; scale-y: 0.797; image: IMAGE_REANIM_BLOVER_HEAD; }
        frame 1 { x: 19; y: 13.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 16; y: 12.6; }
        frame 3 { x: 13; y: 11.2; }
        frame 4 { x: 10; y: 9.8; }
        frame 5 { x: 8.7; y: 12; }
        frame 6 { x: 7.4; y: 14.2; }
        frame 7 { x: 6.1; y: 16.4; }
        frame 8 { x: 4.8; y: 18.6; }
        frame 9 { x: 6.1; y: 16.4; }
        frame 10 { x: 7.4; y: 14.2; }
        frame 11 { x: 8.7; y: 12; }
        frame 12 { x: 10; y: 9.8; }
        frame 13 { x: 13; y: 11.2; }
        frame 14 { x: 16; y: 12.6; }
        frame 15 { x: 18.9; y: 13.9; }
        frame 16 { x: 21.9; y: 15.3; }
        frame 17 { x: 25.2; y: 13.6; }
        frame 18 { x: 28.4; y: 11.8; }
        frame 19 { x: 31.5; y: 10.1; }
        frame 20 { x: 34.6; y: 8.4; }
        frame 21 { x: 36.1; y: 11.2; }
        frame 22 { x: 37.5; y: 14.1; }
        frame 23 { x: 39; y: 16.9; }
        frame 24 { x: 40.4; y: 19.7; }
        frame 25 { x: 39; y: 16.9; }
        frame 26 { x: 37.5; y: 14.1; }
        frame 27 { x: 36.1; y: 11.2; }
        frame 28 { x: 34.6; y: 8.4; }
        frame 29 { x: 31.5; y: 10.1; }
        frame 30 { x: 28.3; y: 11.8; }
        frame 31 { x: 25.1; y: 13.5; }
        frame 32 { x: 21.9; y: 15.3; }
        frame 33 { x: 19.9; y: 16.4; }
        frame 34 { x: 17.9; y: 17.6; }
        frame 35 { x: 15.9; y: 18.7; }
        frame 36 { x: 13.9; y: 19.9; }
        frame 37 { x: 11.8; y: 21.1; }
        frame 38 { x: 9.8; y: 22.2; }
        frame 39 { x: 7.7; y: 23.4; }
        frame 40 { x: 15.9; y: 20.1; }
        frame 41 { x: 24; y: 16.8; }
        frame 42 { x: 32.1; y: 13.5; }
        frame 43 { x: 40.3; y: 10.2; image: IMAGE_REANIM_BLOVER_HEAD2; }
        frame 44 { x: 39.3; y: 9.2; scale-x: 0.851; scale-y: 0.851; image: none; }
        frame 45 { x: 38.1; y: 8.3; scale-x: 0.905; scale-y: 0.905; }
        frame 46 { x: 37; y: 7.3; scale-x: 0.959; scale-y: 0.959; }
        frame 47 { x: 36.9; y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 36.8; y: 7.7; }
        frame 49 { x: 36.6; y: 7.9; }
        frame 50 { x: 36.8; y: 7.7; }
        frame 51 { x: 36.9; y: 7.5; }
        frame 52 { x: 37; y: 7.3; }
        frame 53 { x: 36.9; y: 7.5; }
        frame 54 { x: 36.8; y: 7.7; }
        frame 55 { x: 36.6; y: 7.9; }
        frame 56 { x: -10000; y: -10000; }
        frame 59 { x: 36.8; y: 7.7; }
        frame 60 { x: 36.9; y: 7.5; }
        frame 61 { x: 37; y: 7.3; }
    }
}
