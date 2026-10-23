export component Stinky {
    fps: 12;
    Track {
        source-name: "_ground";
        frame-count: 71;
        frame 0 { x: -23.2; y: -6.3; }
        frame 1 { x: -23; y: -10000; }
        frame 2 { x: -22.9; }
        frame 3 { x: -22.8; }
        frame 4 { x: -22.7; }
        frame 5 { x: -22.5; }
        frame 6 { x: -22.4; }
        frame 7 { x: -21.7; }
        frame 8 { x: -21; }
        frame 9 { x: -20.3; }
        frame 10 { x: -19.6; }
        frame 11 { x: -18.9; }
        frame 12 { x: -10000; }
        frame 16 { cel: -1; }
        frame 17 { cel: -10000; }
    }
    Track {
        source-name: "turn";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 16 { x: 0.1; cel: 0; image: IMAGE_REANIM_STINKY_TURN1; }
        frame 17 { x: -10000; y: 0.2; cel: -10000; image: IMAGE_REANIM_STINKY_TURN2; }
        frame 18 { y: 0.9; image: IMAGE_REANIM_STINKY_TURN3; }
        frame 19 { x: -0; y: 0; image: IMAGE_REANIM_STINKY_TURN4; }
        frame 20 { x: 0.1; y: -10000; image: IMAGE_REANIM_STINKY_TURN5; }
        frame 21 { x: -10000; image: IMAGE_REANIM_STINKY_TURN6; }
        frame 22 { y: -0.9; image: IMAGE_REANIM_STINKY_TURN7; }
        frame 23 { y: -1.9; image: IMAGE_REANIM_STINKY_TURN8; }
        frame 24 { y: -10000; cel: -1; image: none; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_crawl";
        frame-count: 71;
        frame 16 { cel: -1; }
        frame 17 { cel: -10000; }
    }
    Track {
        source-name: "anim_turn";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 16 { cel: 0; }
        frame 17 { cel: -10000; }
        frame 24 { cel: -1; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_in";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
        frame 43 { cel: -1; }
        frame 44 { cel: -10000; }
    }
    Track {
        source-name: "anim_out";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 43 { cel: 0; }
        frame 44 { cel: -10000; }
        frame 58 { cel: -1; }
        frame 59 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 71;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 58 { cel: 0; }
        frame 59 { cel: -10000; }
    }
    Track {
        source-name: "tail";
        frame-count: 71;
        frame 0 { x: 58.1; y: 40.9; image: IMAGE_REANIM_STINKY_TAIL; }
        frame 1 { x: -10000; y: -10000; image: none; }
        frame 7 { x: 56.2; scale-x: 1.11; }
        frame 8 { x: 54.1; scale-x: 1.22; }
        frame 9 { x: 52.2; scale-x: 1.329; }
        frame 10 { x: 55.1; scale-x: 1.165; }
        frame 11 { x: 57.9; scale-x: 1; }
        frame 12 { x: 58; scale-x: -10000; }
        frame 14 { x: 58.1; }
        frame 15 { x: -10000; }
        frame 16 { cel: -1; }
        frame 17 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
        frame 29 { x: 58.2; scale-x: 0.855; }
        frame 30 { x: 58.3; scale-x: 0.709; }
        frame 31 { x: -10000; scale-x: 0.564; }
        frame 32 { x: 58.4; scale-x: 0.419; }
        frame 33 { x: 55.1; scale-x: -10000; }
        frame 34 { x: 51.9; }
        frame 35 { x: 51.3; y: 40.4; skew-x: -3.7; skew-y: -3.7; }
        frame 36 { x: 50.6; y: 40; skew-x: -7.4; skew-y: -7.4; }
        frame 37 { x: 51.2; y: 40.5; skew-x: -3.7; skew-y: -3.7; }
        frame 38 { x: 51.9; y: 40.9; skew-x: 0; skew-y: 0; }
        frame 39 { x: 52.4; y: 41; skew-x: 2; skew-y: 2; }
        frame 40 { x: 53; y: 41.1; skew-x: 4.3; skew-y: 4.3; scale-y: 0.999; }
        frame 41 { x: 52.5; y: 41; skew-x: 2; skew-y: 2; scale-y: 1; }
        frame 42 { x: 51.9; y: 40.9; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 55.1; scale-x: 0.466; }
        frame 45 { x: 58.4; scale-x: 0.513; }
        frame 46 { x: 61.6; scale-x: 0.56; }
        frame 47 { x: -10000; scale-x: -10000; }
        frame 50 { x: 60.3; scale-x: 0.646; }
        frame 51 { x: 59; scale-x: 0.733; }
        frame 52 { x: 57.6; scale-x: 0.82; }
        frame 53 { x: 57.8; scale-x: 0.856; }
        frame 54 { x: 57.9; scale-x: 0.892; }
        frame 55 { x: 58; scale-x: 0.928; }
        frame 56 { scale-x: 0.964; }
        frame 57 { x: 58.1; scale-x: 1; }
        frame 58 { x: -10000; scale-x: -10000; }
        frame 59 { x: 58.2; scale-x: 1.01; }
        frame 60 { x: 58.1; scale-x: 1.02; }
        frame 61 { x: 58.2; scale-x: 1.03; }
        frame 62 { x: 58.1; scale-x: 1.04; }
        frame 63 { x: -10000; scale-x: 1.05; }
        frame 64 { scale-x: 1.06; }
        frame 65 { x: 58.2; scale-x: 1.05; }
        frame 66 { x: 58.1; scale-x: 1.04; }
        frame 67 { x: 58.2; scale-x: 1.03; }
        frame 68 { x: -10000; scale-x: 1.02; }
        frame 69 { x: 58.1; scale-x: 1.01; }
        frame 70 { x: -10000; scale-x: 1; }
    }
    Track {
        source-name: "body";
        frame-count: 71;
        frame 0 { x: 1.2; y: 12.9; image: IMAGE_REANIM_STINKY_BODY; }
        frame 1 { x: 0.6; y: -10000; skew-y: -0.7; scale-x: 1.005; scale-y: 1.001; image: none; }
        frame 2 { x: -0.1; skew-y: -1.7; scale-x: 1.01; scale-y: 1.002; }
        frame 3 { x: -0.7; skew-y: -2.7; scale-x: 1.015; scale-y: -10000; }
        frame 4 { x: -1.5; skew-y: -3.7; scale-x: 1.02; scale-y: 1.003; }
        frame 5 { x: -2.2; skew-y: -4.7; scale-x: 1.025; scale-y: 1.004; }
        frame 6 { x: -2.9; skew-y: -5.6; scale-x: 1.03; scale-y: 1.005; }
        frame 7 { x: -1.5; skew-y: -4.4; scale-x: 1.024; scale-y: 1.004; }
        frame 8 { x: -0.2; skew-y: -3.2; scale-x: 1.018; scale-y: 1.003; }
        frame 9 { x: 1; skew-y: -2.2; scale-x: 1.012; scale-y: 1.002; }
        frame 10 { x: 2.3; skew-y: -0.9; scale-x: 1.006; scale-y: 1.001; }
        frame 11 { x: 3.6; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 12 { x: 3; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 2.4; }
        frame 14 { x: 1.8; }
        frame 15 { x: 1.2; }
        frame 16 { x: -10000; cel: -1; }
        frame 17 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { x: 1.1; y: 15.5; skew-x: -7.2; skew-y: -7.2; cel: -10000; }
        frame 26 { x: 1.3; y: 18.5; skew-x: -14.7; skew-y: -14.7; scale-x: 0.999; scale-y: 0.999; }
        frame 27 { x: 2; y: 21.7; skew-x: -22.2; skew-y: -22.2; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 3; y: 25.2; skew-x: -29.9; skew-y: -29.9; scale-x: 1; scale-y: 1; }
        frame 29 { x: 8.7; y: 41.4; skew-x: -47.3; skew-y: -47; scale-x: 0.993; scale-y: 0.984; }
        frame 30 { x: 16; y: 48.5; skew-x: -64.9; skew-y: -64.1; scale-x: 0.99; scale-y: 0.972; }
        frame 31 { x: 21.1; y: 52.6; skew-x: -82.4; skew-y: -81.3; scale-x: 0.986; scale-y: 0.958; }
        frame 32 { x: 28; y: 55; skew-x: -99.8; skew-y: -98.3; scale-x: 0.982; scale-y: 0.946; }
        frame 33 { x: 28.2; y: 55.1; skew-x: -99.7; skew-y: -98.2; scale-x: -10000; scale-y: 0.886; }
        frame 34 { x: 28.4; y: 55.4; skew-x: -99.8; skew-y: -98.3; scale-y: 0.827; }
        frame 35 { x: 29; y: 55.5; skew-x: -103.5; skew-y: -101.9; scale-x: 0.981; scale-y: 0.826; }
        frame 36 { x: 29.7; y: -10000; skew-x: -107.4; skew-y: -105.8; scale-x: 0.982; scale-y: -10000; }
        frame 37 { x: 29.4; y: 54.6; skew-x: -103.5; skew-y: -101.9; scale-x: 0.981; }
        frame 38 { x: 29.1; y: 53.6; skew-x: -99.8; skew-y: -98.3; scale-x: 0.982; scale-y: 0.827; }
        frame 39 { x: -10000; y: 52.8; skew-x: -97.7; skew-y: -96; scale-x: -10000; scale-y: 0.826; }
        frame 40 { x: 29.3; y: 52.1; skew-x: -95.6; skew-y: -94; scale-y: -10000; }
        frame 41 { x: 29.2; y: 52.9; skew-x: -97.7; skew-y: -96; }
        frame 42 { x: 29.1; y: 53.6; skew-x: -99.8; skew-y: -98.3; scale-y: 0.827; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 44 { x: 18.4; y: 54.7; skew-x: -78.9; skew-y: -77.4; scale-x: 0.981; scale-y: 0.877; }
        frame 45 { x: 10.2; y: 49.5; skew-x: -57.8; skew-y: -56.3; scale-x: 0.98; scale-y: 0.928; }
        frame 46 { x: 7.7; y: 44; skew-x: -48.5; skew-y: -46.9; scale-x: 0.981; scale-y: 0.981; }
        frame 47 { x: 5.5; y: 33.7; skew-x: -38.5; skew-y: -37; scale-x: 0.98; scale-y: 0.979; }
        frame 48 { x: 4.2; y: 23.5; skew-x: -28.5; skew-y: -26.9; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 3.6; y: 13.7; skew-x: -18.5; skew-y: -16.9; scale-x: 0.981; scale-y: 0.981; }
        frame 50 { x: 1.5; y: 15.7; skew-x: -15.9; skew-y: -14.2; scale-x: 0.98; scale-y: 0.98; }
        frame 51 { x: -0.5; y: 17.7; skew-x: -13.2; skew-y: -11.7; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: -2.7; y: 19.7; skew-x: -10.8; skew-y: -9.3; scale-x: 0.981; }
        frame 53 { x: -1.9; y: 18.3; skew-x: -8.5; skew-y: -7.2; scale-x: 0.984; scale-y: 0.984; }
        frame 54 { x: -1.1; y: 17.1; skew-x: -6.4; skew-y: -5.4; scale-x: 0.988; scale-y: 0.988; }
        frame 55 { x: -0.3; y: 15.7; skew-x: -4.2; skew-y: -3.5; scale-x: 0.992; scale-y: 0.992; }
        frame 56 { x: 0.3; y: 14.3; skew-x: -1.9; skew-y: -1.7; scale-x: 0.996; scale-y: 0.996; }
        frame 57 { x: 1.2; y: 12.9; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 0.9; y: 13.1; scale-x: 1.008; scale-y: 0.995; }
        frame 60 { x: 0.6; y: 13.3; scale-x: 1.015; scale-y: 0.99; }
        frame 61 { x: 0.3; y: 13.5; scale-x: 1.023; scale-y: 0.985; }
        frame 62 { x: 0.1; y: 13.7; scale-x: 1.031; scale-y: 0.98; }
        frame 63 { x: -0.1; y: 13.9; scale-x: 1.038; scale-y: 0.976; }
        frame 64 { x: -0.4; y: 14.1; scale-x: 1.046; scale-y: 0.971; }
        frame 65 { x: -0.1; y: 14.6; skew-x: -0.9; scale-x: 1.039; scale-y: 0.975; }
        frame 66 { x: 0; y: 15.2; skew-x: -2.1; scale-x: 1.032; scale-y: 0.98; }
        frame 67 { x: 0.3; y: 14.6; skew-x: -1.4; scale-x: 1.024; scale-y: 0.985; }
        frame 68 { x: 0.6; y: 14.1; skew-x: -0.9; scale-x: 1.016; scale-y: 0.99; }
        frame 69 { x: 0.9; y: 13.5; skew-x: -0.4; scale-x: 1.008; scale-y: 0.995; }
        frame 70 { x: 1.2; y: 12.9; skew-x: 0; scale-x: 1; scale-y: 1; }
    }
    Track {
        source-name: "antenna";
        frame-count: 71;
        frame 0 { x: 3.3; y: 2.8; image: IMAGE_REANIM_STINKY_ANTENNA; }
        frame 1 { x: -10000; y: 2.6; skew-y: 2; scale-x: 1.005; scale-y: 1.004; image: none; }
        frame 2 { x: 3.5; y: -10000; skew-y: 4.1; scale-x: 1.01; scale-y: 1.008; }
        frame 3 { x: -10000; y: 2.5; skew-y: 6.3; scale-x: 1.015; scale-y: 1.012; }
        frame 4 { y: 2.4; skew-y: 8.3; scale-x: 1.02; scale-y: 1.016; }
        frame 5 { x: 3.6; y: -10000; skew-y: 10.5; scale-x: 1.025; scale-y: 1.02; }
        frame 6 { x: 3.5; y: 2.3; skew-y: 12.6; scale-x: 1.03; scale-y: 1.025; }
        frame 7 { x: 4.1; y: 2.4; skew-y: 10; scale-x: 1.024; scale-y: 1.019; }
        frame 8 { x: 4.5; y: 2.5; skew-y: 7.5; scale-x: 1.018; scale-y: 1.014; }
        frame 9 { x: 4.8; y: -10000; skew-y: 5; scale-x: 1.012; scale-y: 1.01; }
        frame 10 { x: 5.3; y: 2.6; skew-y: 2.5; scale-x: 1.006; scale-y: 1.005; }
        frame 11 { x: 5.8; y: 2.8; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 12 { x: 5.2; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 4.6; }
        frame 14 { x: 4; }
        frame 15 { x: 3.3; }
        frame 16 { x: -10000; cel: -1; }
        frame 17 { cel: -10000; }
        frame 24 { x: 3; y: 2; cel: 0; }
        frame 25 { x: 0; y: 6.8; skew-x: -11.5; skew-y: -18.2; scale-x: 1.021; scale-y: 1.006; cel: -10000; }
        frame 26 { x: -2.6; y: 12.4; skew-x: -23.2; skew-y: -36.7; scale-x: 1.043; scale-y: 1.013; }
        frame 27 { x: -4.4; y: 18.6; skew-x: -35; skew-y: -55.3; scale-x: 1.064; scale-y: 1.02; }
        frame 28 { x: -5.2; y: 24.9; skew-x: -46.9; skew-y: -73.6; scale-x: 1.088; scale-y: 1.029; }
        frame 29 { x: 4.1; y: 37.5; skew-x: -45.8; skew-y: -72.1; scale-x: 1.081; scale-y: 0.664; }
        frame 30 { x: 12.2; y: 45.4; skew-x: -59.6; skew-y: -85.7; scale-x: 1.077; scale-y: 0.463; }
        frame 31 { x: 18.7; y: 48.5; skew-x: -80.9; skew-y: -83.9; scale-x: 1.072; scale-y: 0.399; }
        frame 32 { x: 25.4; y: 50.2; skew-x: -102.1; skew-y: -82; scale-x: 1.067; scale-y: 0.335; }
        frame 33 { x: 26.9; y: 50.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.23; }
        frame 34 { x: 27.7; y: 50.1; scale-y: 0.16; }
        frame 35 { x: -10000; y: -10000; scale-y: -10000; cel: -1; }
        frame 36 { cel: -10000; }
        frame 44 { x: 18.1; y: 49.8; skew-x: -87.1; skew-y: -67; scale-y: 0.333; cel: 0; }
        frame 45 { x: 10.2; y: 45.3; skew-x: -66.6; skew-y: -69.6; scale-x: 1.073; scale-y: 0.498; cel: -10000; }
        frame 46 { x: 2.4; y: 40; skew-x: -45.8; skew-y: -72.1; scale-x: 1.081; scale-y: 0.664; }
        frame 47 { x: -10000; y: 24.9; skew-x: -30.5; skew-y: -43.8; scale-x: 1.062; scale-y: 0.783; }
        frame 48 { x: 5; y: 10.7; skew-x: -15.2; skew-y: -15.4; scale-x: 1.045; scale-y: 0.903; }
        frame 49 { x: 10.3; y: -1.3; skew-x: 0; skew-y: 12.6; scale-x: 1.03; scale-y: 1.025; }
        frame 50 { x: 11.6; y: 0.5; skew-x: 7.5; skew-y: 24.3; scale-x: 1.029; scale-y: 1.048; }
        frame 51 { x: 12.9; y: 2.8; skew-x: 15; skew-y: 36.3; scale-x: 1.03; scale-y: 1.073; }
        frame 52 { x: 4.9; y: 5.3; skew-x: 7.5; skew-y: 18.1; scale-x: 1.014; scale-y: 1.036; }
        frame 53 { x: 0.8; y: 5.8; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 54 { x: 0.3; y: 5.3; skew-x: -1.7; skew-y: -7.4; scale-x: 0.992; scale-y: 1.017; }
        frame 55 { x: 0; y: 5.1; skew-x: -3.8; skew-y: -14.9; scale-x: 0.984; scale-y: 1.035; }
        frame 56 { x: 1.6; y: 3.9; skew-x: -1.7; skew-y: -7.4; scale-x: 0.992; scale-y: 1.017; }
        frame 57 { x: 3.3; y: 2.8; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: 1; }
        frame 58 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { y: 3; skew-y: 0.8; scale-x: 1.008; scale-y: 0.996; }
        frame 60 { x: 3.2; y: 3.4; skew-y: 1.8; scale-x: 1.015; scale-y: 0.992; }
        frame 61 { x: -10000; y: 3.5; skew-y: 2.8; scale-x: 1.023; scale-y: 0.988; }
        frame 62 { x: 3.1; y: 3.8; skew-y: 3.8; scale-x: 1.031; scale-y: 0.984; }
        frame 63 { x: 3.2; y: 4.1; skew-y: 4.8; scale-x: 1.038; scale-y: 0.979; }
        frame 64 { x: 3.1; y: 4.3; skew-y: 5.8; scale-x: 1.046; scale-y: 0.976; }
        frame 65 { x: 4; y: 4.8; skew-x: -0.9; skew-y: 7.3; scale-x: 1.039; scale-y: 0.987; }
        frame 66 { x: 4.5; y: 5.2; skew-x: -2.1; skew-y: 8.9; scale-x: 1.032; scale-y: 0.999; }
        frame 67 { x: 4.2; y: 4.5; skew-x: -1.4; skew-y: 6.5; scale-x: 1.024; scale-y: -10000; }
        frame 68 { x: 3.9; y: 4; skew-x: -0.9; skew-y: 4.3; scale-x: 1.016; }
        frame 69 { x: 3.5; y: 3.4; skew-x: -0.4; skew-y: 2.1; scale-x: 1.008; scale-y: 1; }
        frame 70 { x: 3.3; y: 2.8; skew-x: 0; skew-y: 0; scale-x: 1; scale-y: -10000; }
    }
    Track {
        source-name: "shell";
        frame-count: 71;
        frame 0 { x: 24.1; y: 7.8; image: IMAGE_REANIM_STINKY_SHELL; }
        frame 1 { x: 23.8; y: -10000; scale-x: 1.006; image: none; }
        frame 2 { x: 23.6; scale-x: 1.011; }
        frame 3 { x: 23.3; scale-x: 1.017; }
        frame 4 { x: 23; scale-x: 1.023; }
        frame 5 { x: 22.8; scale-x: 1.029; }
        frame 6 { x: 22.6; scale-x: 1.034; }
        frame 7 { x: 23.1; y: 7.7; scale-x: 1.016; scale-y: 1.003; }
        frame 8 { x: 23.7; y: 7.5; scale-x: 0.997; scale-y: 1.006; }
        frame 9 { x: 24.3; y: 7.3; scale-x: 0.978; scale-y: 1.009; }
        frame 10 { x: 24.9; y: 7.2; scale-x: 0.96; scale-y: 1.013; }
        frame 11 { x: 26.6; y: 7.1; scale-x: 0.941; scale-y: 1.016; }
        frame 12 { x: 25.9; y: 7.3; scale-x: 0.956; scale-y: 1.012; }
        frame 13 { x: 25.4; y: 7.5; scale-x: 0.971; scale-y: 1.008; }
        frame 14 { x: 24.7; y: 7.7; scale-x: 0.985; scale-y: 1.004; }
        frame 15 { x: 24.1; y: 7.8; scale-x: 1; scale-y: 1; }
        frame 16 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 17 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { x: 26.5; y: 5.8; skew-x: 3.6; skew-y: 3.6; cel: -10000; }
        frame 26 { x: 29.2; y: 3.8; skew-x: 7.3; skew-y: 7.3; }
        frame 27 { x: 32; y: 1.9; skew-x: 11.1; skew-y: 11.1; scale-x: 0.999; scale-y: 0.999; }
        frame 28 { x: 34.9; y: 0.1; skew-x: 15; skew-y: 15; scale-x: 1; scale-y: 1; }
        frame 29 { x: 32.5; y: 1.4; skew-x: 11.8; skew-y: 11.8; scale-x: 0.999; scale-y: 1.003; }
        frame 30 { x: 30.4; y: 2.6; skew-x: 8.8; skew-y: 8.8; scale-x: -10000; scale-y: 1.008; }
        frame 31 { x: 28.2; y: 4; skew-x: 5.8; skew-y: 5.8; scale-x: 1; scale-y: 1.012; }
        frame 32 { x: 26.1; y: 5.4; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: 1.017; }
        frame 33 { x: 24.1; y: 6.8; skew-x: 0; skew-y: 0; scale-y: 1.021; }
        frame 34 { x: 23.4; y: 7.3; skew-x: -1.7; skew-y: -1.7; scale-x: 0.975; scale-y: 1.023; }
        frame 35 { x: 22.5; y: 7.9; skew-x: -3.7; skew-y: -3.7; scale-x: 0.949; scale-y: 1.025; }
        frame 36 { x: 20.6; y: 9.2; skew-x: -5.4; skew-y: -5.4; scale-x: 0.974; scale-y: 1.012; }
        frame 37 { x: 18.7; y: 10.8; skew-x: -7.4; skew-y: -7.4; scale-x: 1; scale-y: 1; }
        frame 38 { x: 24.1; y: 7.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 25.8; y: 7; skew-x: 2; skew-y: 2; }
        frame 40 { x: 27.6; y: 6.1; skew-x: 4.3; skew-y: 4.3; scale-x: 0.999; scale-y: 0.999; }
        frame 41 { x: 25.8; y: 6.9; skew-x: 2; skew-y: 2; scale-x: 1; scale-y: 1; }
        frame 42 { x: 24.1; y: 7.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 44 { x: 25.6; y: 6.9; skew-x: 2; skew-y: 2; }
        frame 45 { x: 27.2; y: 6.1; skew-x: 4; skew-y: 4; }
        frame 46 { x: 28.9; y: 5.2; skew-x: 6.3; skew-y: 6.3; }
        frame 47 { x: 32.4; y: 2.7; skew-x: 11.3; skew-y: 11.3; scale-x: 0.999; scale-y: 0.999; }
        frame 48 { x: 36.1; y: 0.3; skew-x: 16.3; skew-y: 16.3; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: 39.9; y: -1.6; skew-x: 21.3; skew-y: 21.3; scale-x: 1; scale-y: 1; }
        frame 50 { x: 33.6; y: 1.2; skew-x: 13.8; skew-y: 13.8; scale-x: 0.999; scale-y: 0.999; }
        frame 51 { x: 27.7; y: 4.6; skew-x: 6.3; skew-y: 6.3; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 22.2; y: 8.4; skew-x: -0.9; skew-y: -0.9; }
        frame 53 { x: 21.9; y: 9.1; skew-x: -0.7; skew-y: -0.7; scale-x: 1.024; scale-y: 0.984; }
        frame 54 { x: 21.7; y: 9.7; skew-x: -0.4; skew-y: -0.4; scale-x: 1.049; scale-y: 0.968; }
        frame 55 { x: 22.6; y: 9; skew-x: -0.2; skew-y: -0.2; scale-x: 1.032; scale-y: 0.979; }
        frame 56 { x: 23.4; y: 8.4; skew-x: 0; skew-y: 0; scale-x: 1.016; scale-y: 0.989; }
        frame 57 { x: 24.1; y: 7.8; skew-x: -10000; skew-y: -10000; scale-x: 1; scale-y: 1; }
        frame 58 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 23.9; y: 8.1; scale-x: 1.005; scale-y: 0.994; }
        frame 60 { x: 23.8; y: 8.4; scale-x: 1.01; scale-y: 0.988; }
        frame 61 { x: 23.7; y: 8.7; scale-x: 1.015; scale-y: 0.982; }
        frame 62 { x: 23.6; y: 9; scale-x: 1.02; scale-y: 0.976; }
        frame 63 { x: 23.5; y: 9.3; scale-x: 1.025; scale-y: 0.97; }
        frame 64 { x: 23.3; y: 9.6; scale-x: 1.029; scale-y: 0.964; }
        frame 65 { x: 23.4; y: 9.3; scale-x: 1.025; scale-y: 0.97; }
        frame 66 { x: 23.6; y: 9; scale-x: 1.02; scale-y: 0.976; }
        frame 67 { x: 23.7; y: 8.7; scale-x: 1.015; scale-y: 0.982; }
        frame 68 { x: 23.8; y: 8.4; scale-x: 1.01; scale-y: 0.988; }
        frame 69 { x: 23.9; y: 8.1; scale-x: 1.005; scale-y: 0.994; }
        frame 70 { x: 24.1; y: 7.8; scale-x: 1; scale-y: 1; }
    }
}
