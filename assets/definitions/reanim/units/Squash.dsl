export component Squash {
    fps: 12;
    Track {
        source-name: "anim_jumpdown";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 65 { cel: 0; }
        frame 66 { cel: -10000; }
    }
    Track {
        source-name: "anim_jumpup";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 50 { cel: 0; }
        frame 51 { cel: -10000; }
        frame 65 { cel: -1; }
        frame 66 { cel: -10000; }
    }
    Track {
        source-name: "anim_lookright";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 37 { cel: 0; }
        frame 38 { cel: -10000; }
        frame 43 { cel: -1; }
        frame 44 { cel: -10000; }
    }
    Track {
        source-name: "anim_lookleft";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
        frame 30 { cel: -1; }
        frame 31 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { cel: 0; }
        frame 6 { cel: -10000; }
        frame 24 { cel: -1; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 73;
        frame 5 { cel: -1; }
        frame 6 { cel: -10000; }
    }
    Track {
        source-name: "Squash_stem";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 33.4; y: -1.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SQUASH_STEM; }
        frame 6 { x: 34; y: -3; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 7 { x: 34.5; y: -4.1; skew-x: 4.8; skew-y: 4.8; }
        frame 8 { x: 35.3; y: -5.2; skew-x: 7.3; skew-y: 7.3; }
        frame 9 { x: 36; y: -6.3; skew-x: 9.8; skew-y: 9.8; }
        frame 10 { x: 36.6; y: -7.4; skew-x: 12.3; skew-y: 12.3; scale-x: 0.799; scale-y: 0.799; }
        frame 11 { x: 37.3; y: -8.5; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: 36.2; y: -6.2; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 35.1; y: -3.9; skew-x: 5; skew-y: 5; }
        frame 14 { x: 34.3; y: -1.6; skew-x: 0; skew-y: 0; }
        frame 15 { x: 33.5; y: 0.7; skew-x: -4.9; skew-y: -4.9; }
        frame 16 { x: 32.7; y: 3; skew-x: -9.7; skew-y: -9.7; }
        frame 17 { x: 32; y: 5.6; skew-x: -14.9; skew-y: -14.9; }
        frame 18 { x: 32.3; y: 4.3; skew-x: -12.2; skew-y: -12.2; scale-x: 0.799; scale-y: 0.799; }
        frame 19 { x: 32.5; y: 2.9; skew-x: -9.7; skew-y: -9.7; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { x: 32.6; y: 1.8; skew-x: -7.2; skew-y: -7.2; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 32.9; y: 0.5; skew-x: -4.7; skew-y: -4.7; }
        frame 22 { x: 33.1; y: -0.6; skew-x: -2.4; skew-y: -2.4; }
        frame 23 { x: 33.4; y: -1.8; skew-x: 0; skew-y: 0; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 51 { x: 33.8; y: 2.5; skew-x: 2.5; skew-y: 2.5; scale-x: 0.819; scale-y: 0.755; }
        frame 52 { x: 34.1; y: 7; skew-x: 4.8; skew-y: 5; scale-x: 0.839; scale-y: 0.71; }
        frame 53 { x: 34.5; y: 11.4; skew-x: 7.3; skew-y: 7.5; scale-x: 0.858; scale-y: 0.665; }
        frame 54 { x: 34.9; y: 15.8; skew-x: 9.8; skew-y: 10; scale-x: 0.877; scale-y: 0.62; }
        frame 55 { x: 35.2; y: 20.2; skew-x: 12.3; skew-y: 12.5; scale-x: 0.897; scale-y: 0.575; }
        frame 56 { x: 35.5; y: 24.5; skew-x: 15; skew-y: 15; scale-x: 0.917; scale-y: 0.53; }
        frame 57 { x: 36.4; y: 19; skew-x: 16.8; skew-y: 16.8; scale-x: 0.894; scale-y: 0.583; }
        frame 58 { x: 37.3; y: 13.4; skew-x: 18.6; skew-y: 18.8; scale-x: 0.871; scale-y: 0.636; }
        frame 59 { x: 38.1; y: 7.8; skew-x: 20.6; skew-y: 20.6; scale-x: 0.849; scale-y: 0.689; }
        frame 60 { x: 39; y: 2.3; skew-x: 22.5; skew-y: 22.5; scale-x: 0.827; scale-y: 0.742; }
        frame 61 { x: 39.9; y: -3; skew-x: 24.3; skew-y: 24.3; scale-x: 0.805; scale-y: 0.795; }
        frame 62 { x: 40.9; y: -8.5; skew-x: 26.3; skew-y: 26.3; scale-x: 0.782; scale-y: 0.848; }
        frame 63 { x: 41.9; y: -13.8; skew-x: 28.1; skew-y: 28.1; scale-x: 0.76; scale-y: 0.901; }
        frame 64 { x: 42.8; y: -19.2; skew-x: 30; skew-y: 30; scale-x: 0.739; scale-y: 0.955; }
        frame 65 { x: 39.6; y: -15.4; skew-x: 18.8; skew-y: 18.6; scale-x: 0.753; scale-y: 0.915; }
        frame 66 { x: 36.9; y: -10.9; skew-x: 7.5; skew-y: 7.5; scale-x: 0.769; scale-y: 0.877; }
        frame 67 { x: 34.8; y: -6.1; skew-x: -3.5; skew-y: -3.5; scale-x: 0.785; scale-y: 0.839; }
        frame 68 { x: 33.1; y: -0.9; skew-x: -14.9; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
        frame 69 { x: 33.5; y: 8.3; skew-x: -8.4; skew-y: -5.9; scale-x: 0.853; scale-y: 0.71; }
        frame 70 { x: 33.6; y: 17.7; skew-x: -1.9; skew-y: 2.6; scale-x: 0.907; scale-y: 0.621; }
        frame 71 { x: 33.9; y: 27.1; skew-x: 4.3; skew-y: 11.5; scale-x: 0.96; scale-y: 0.531; }
        frame 72 { x: 34; y: 36.3; skew-x: 10.9; skew-y: 20.5; scale-x: 1.014; scale-y: 0.442; }
    }
    Track {
        source-name: "Squash_body";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 6.6; y: 5.2; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SQUASH_BODY; }
        frame 6 { x: 7; y: 4.1; scale-x: 0.793; scale-y: 0.811; cel: -10000; image: none; }
        frame 7 { x: 7.3; y: 3; scale-x: 0.787; scale-y: 0.822; }
        frame 8 { x: 7.8; y: 2; scale-x: 0.78; scale-y: 0.833; }
        frame 9 { x: 8.2; y: 1; scale-x: 0.774; scale-y: 0.844; }
        frame 10 { x: 8.5; y: 0; scale-x: 0.767; scale-y: 0.855; }
        frame 11 { x: 8.9; y: -1; scale-x: 0.761; scale-y: 0.866; }
        frame 12 { x: 8.3; y: 1; scale-x: 0.774; scale-y: 0.844; }
        frame 13 { x: 7.6; y: 3; scale-x: 0.787; scale-y: 0.822; }
        frame 14 { x: 6.9; y: 5.2; scale-x: 0.8; scale-y: 0.8; }
        frame 15 { x: 6.2; y: 7.2; scale-x: 0.813; scale-y: 0.778; }
        frame 16 { x: 5.5; y: 9.4; scale-x: 0.826; scale-y: 0.756; }
        frame 17 { x: 4.8; y: 11.5; scale-x: 0.84; scale-y: 0.733; }
        frame 18 { x: 5.2; y: 10.5; scale-x: 0.833; scale-y: 0.745; }
        frame 19 { x: 5.4; y: 9.5; scale-x: 0.826; scale-y: 0.756; }
        frame 20 { x: 5.8; y: 8.4; scale-x: 0.82; scale-y: 0.767; }
        frame 21 { x: 6; y: 7.4; scale-x: 0.813; scale-y: 0.778; }
        frame 22 { x: 6.3; y: 6.3; scale-x: 0.807; scale-y: 0.789; }
        frame 23 { x: 6.6; y: 5.2; scale-x: 0.8; scale-y: 0.8; }
        frame 24 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 5.2; y: 9.4; scale-x: 0.829; scale-y: 0.755; }
        frame 52 { x: 3.8; y: 13.7; scale-x: 0.857; scale-y: 0.71; }
        frame 53 { x: 2.4; y: 17.9; scale-x: 0.886; scale-y: 0.665; }
        frame 54 { x: 1.1; y: 22.1; scale-x: 0.915; scale-y: 0.62; }
        frame 55 { x: -0.1; y: 26.4; scale-x: 0.944; scale-y: 0.575; }
        frame 56 { x: -1.5; y: 30.6; scale-x: 0.972; scale-y: 0.53; }
        frame 57 { x: -0.1; y: 25.6; scale-x: 0.943; scale-y: 0.584; }
        frame 58 { x: 1.2; y: 20.6; scale-x: 0.914; scale-y: 0.637; }
        frame 59 { x: 2.5; y: 15.6; scale-x: 0.885; scale-y: 0.69; }
        frame 60 { x: 4; y: 10.7; scale-x: 0.856; scale-y: 0.743; }
        frame 61 { x: 5.4; y: 5.7; scale-x: 0.827; scale-y: 0.796; }
        frame 62 { x: 6.8; y: 0.7; scale-x: 0.797; scale-y: 0.849; }
        frame 63 { x: 8.3; y: -4.1; scale-x: 0.768; scale-y: 0.902; }
        frame 64 { x: 9.7; y: -9.1; scale-x: 0.739; scale-y: 0.955; }
        frame 65 { x: 9; y: -5.4; scale-x: 0.754; scale-y: 0.916; }
        frame 66 { x: 8.2; y: -1.8; scale-x: 0.769; scale-y: 0.877; }
        frame 67 { x: 7.4; y: 1.6; scale-x: 0.785; scale-y: 0.839; }
        frame 68 { x: 6.6; y: 5.2; scale-x: 0.8; scale-y: 0.8; }
        frame 69 { x: 3; y: 14; scale-x: 0.873; scale-y: 0.707; }
        frame 70 { x: -0.5; y: 22.7; scale-x: 0.947; scale-y: 0.614; }
        frame 71 { x: -4.1; y: 31.5; scale-x: 1.02; scale-y: 0.521; }
        frame 72 { x: -7.7; y: 40.1; scale-x: 1.093; scale-y: 0.428; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 73;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 5 { x: 33.2; y: 30; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SQUASH_EYES; }
        frame 6 { x: 33.4; y: 29.4; scale-x: 0.795; scale-y: 0.804; cel: -10000; image: none; }
        frame 7 { x: 33.5; y: 28.8; scale-x: 0.789; scale-y: 0.809; }
        frame 8 { x: 33.8; y: 28.3; scale-x: 0.784; scale-y: 0.813; }
        frame 9 { x: 33.9; y: 27.8; scale-x: 0.778; scale-y: 0.817; }
        frame 10 { x: 34; y: 27.2; scale-x: 0.773; scale-y: 0.821; }
        frame 11 { x: 34.2; y: 26.6; scale-x: 0.768; scale-y: 0.826; }
        frame 12 { x: 34; y: 27.9; scale-x: 0.773; scale-y: 0.81; }
        frame 13 { x: 33.9; y: 29.1; scale-x: 0.778; scale-y: 0.795; }
        frame 14 { x: 33.7; y: 30.4; scale-x: 0.784; scale-y: 0.779; }
        frame 15 { x: 33.5; y: 31.6; scale-x: 0.789; scale-y: 0.764; }
        frame 16 { x: 33.4; y: 32.9; scale-x: 0.795; scale-y: 0.749; }
        frame 17 { x: 33.2; y: 34.1; scale-x: 0.8; scale-y: 0.733; }
        frame 18 { x: -10000; y: 33.4; scale-x: -10000; scale-y: 0.745; }
        frame 19 { y: 32.8; scale-y: 0.756; }
        frame 20 { y: 32; scale-y: 0.767; }
        frame 21 { y: 31.3; scale-y: 0.778; }
        frame 22 { y: 30.7; scale-y: 0.789; }
        frame 23 { y: 30; scale-y: 0.8; }
        frame 24 { y: -10000; scale-y: -10000; }
        frame 25 { x: 32.8; }
        frame 26 { x: 32.4; }
        frame 27 { x: 32; }
        frame 28 { x: 31.5; }
        frame 29 { x: 31.1; }
        frame 30 { x: -10000; }
        frame 32 { x: 31.5; }
        frame 33 { x: 32; }
        frame 34 { x: 32.4; }
        frame 35 { x: 32.8; }
        frame 36 { x: 33.2; }
        frame 37 { x: -10000; }
        frame 38 { x: 33.6; }
        frame 39 { x: 34; }
        frame 40 { x: 34.4; }
        frame 41 { x: 34.8; }
        frame 42 { x: 35.1; }
        frame 43 { x: -10000; }
        frame 45 { x: 34.8; }
        frame 46 { x: 34.4; }
        frame 47 { x: 34; }
        frame 48 { x: 33.6; }
        frame 49 { x: 33.2; }
        frame 50 { x: -10000; }
        frame 51 { x: 32.9; y: 32.8; scale-x: 0.819; scale-y: 0.755; }
        frame 52 { x: 32.5; y: 35.6; scale-x: 0.839; scale-y: 0.71; }
        frame 53 { x: 32.2; y: 38.5; scale-x: 0.858; scale-y: 0.665; }
        frame 54 { x: 31.9; y: 41.3; scale-x: 0.878; scale-y: 0.62; }
        frame 55 { x: 31.6; y: 44.1; scale-x: 0.897; scale-y: 0.575; }
        frame 56 { x: 31.3; y: 47; scale-x: 0.917; scale-y: 0.53; }
        frame 57 { x: 31.7; y: 43.7; scale-x: 0.894; scale-y: 0.584; }
        frame 58 { x: 32; y: 40.4; scale-x: 0.872; scale-y: 0.637; }
        frame 59 { x: 32.5; y: 37; scale-x: 0.85; scale-y: 0.69; }
        frame 60 { x: 32.8; y: 33.7; scale-x: 0.828; scale-y: 0.743; }
        frame 61 { x: 33.1; y: 30.4; scale-x: 0.806; scale-y: 0.796; }
        frame 62 { x: 33.5; y: 27.1; scale-x: 0.783; scale-y: 0.849; }
        frame 63 { x: 34; y: 23.8; scale-x: 0.761; scale-y: 0.902; }
        frame 64 { x: 34.4; y: 20.3; scale-x: 0.739; scale-y: 0.955; }
        frame 65 { x: 34.1; y: 22.7; scale-x: 0.754; scale-y: 0.916; }
        frame 66 { x: 33.8; y: 25.1; scale-x: 0.769; scale-y: 0.877; }
        frame 67 { x: 33.5; y: 27.6; scale-x: 0.785; scale-y: 0.839; }
        frame 68 { x: 33.2; y: 30; scale-x: 0.8; scale-y: 0.8; }
        frame 69 { x: 32.2; y: 35.8; scale-x: 0.858; scale-y: 0.707; }
        frame 70 { x: 31.2; y: 41.7; scale-x: 0.915; scale-y: 0.614; }
        frame 71 { x: 30.1; y: 47.5; scale-x: 0.973; scale-y: 0.521; }
        frame 72 { x: 29.2; y: 53.4; scale-x: 1.03; scale-y: 0.428; }
    }
    Track {
        source-name: "anim_eye";
        frame-count: 73;
        frame 0 { x: 25.3; y: 18.9; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_SQUASH_EYEBROWS; }
        frame 1 { x: 24.4; y: 21.8; scale-x: 0.852; scale-y: 0.804; image: none; }
        frame 2 { x: 23.6; y: 22.1; scale-x: 0.894; scale-y: 0.916; }
        frame 3 { x: 24.4; y: 21.8; scale-x: 0.852; scale-y: 0.804; }
        frame 4 { x: 25.3; y: 18.9; scale-x: 0.8; scale-y: 0.8; }
        frame 5 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 25.6; y: 18.2; scale-x: 0.795; scale-y: 0.804; }
        frame 7 { x: 25.8; y: 17.5; scale-x: 0.789; scale-y: 0.809; }
        frame 8 { x: 26; y: 16.9; scale-x: 0.784; scale-y: 0.813; }
        frame 9 { x: 26.2; y: 16.2; scale-x: 0.778; scale-y: 0.817; }
        frame 10 { x: 26.5; y: 15.5; scale-x: 0.773; scale-y: 0.821; }
        frame 11 { x: 26.7; y: 14.8; scale-x: 0.768; scale-y: 0.826; }
        frame 12 { x: 26.5; y: 16.4; scale-x: 0.773; scale-y: 0.81; }
        frame 13 { x: 26.2; y: 17.9; scale-x: 0.778; scale-y: 0.795; }
        frame 14 { x: 26; y: 19.4; scale-x: 0.784; scale-y: 0.779; }
        frame 15 { x: 25.8; y: 20.9; scale-x: 0.789; scale-y: 0.764; }
        frame 16 { x: 25.6; y: 22.4; scale-x: 0.795; scale-y: 0.749; }
        frame 17 { x: 25.3; y: 24; scale-x: 0.8; scale-y: 0.733; }
        frame 18 { x: -10000; y: 23.1; scale-x: -10000; scale-y: 0.745; }
        frame 19 { y: 22.3; scale-y: 0.756; }
        frame 20 { y: 21.5; scale-y: 0.767; }
        frame 21 { y: 20.6; scale-y: 0.778; }
        frame 22 { y: 19.7; scale-y: 0.789; }
        frame 23 { y: 18.9; scale-y: 0.8; }
        frame 24 { y: -10000; scale-y: -10000; }
        frame 25 { y: 18.1; skew-x: 2.5; scale-x: 0.804; }
        frame 26 { x: 25.4; y: 17.2; skew-x: 5; scale-x: 0.808; }
        frame 27 { x: -10000; y: 16.4; skew-x: 7.5; scale-x: 0.811; }
        frame 28 { x: 25.6; y: 15.6; skew-x: 10; scale-x: 0.815; }
        frame 29 { x: 25.7; y: 14.7; skew-x: 12.6; scale-x: 0.82; }
        frame 30 { x: -10000; y: -10000; skew-x: 12.5; scale-x: 0.819; }
        frame 31 { skew-x: 12.6; scale-x: 0.82; }
        frame 32 { x: 25.6; y: 15.6; skew-x: 10; scale-x: 0.815; }
        frame 33 { x: 25.4; y: 16.4; skew-x: 7.5; scale-x: 0.811; }
        frame 34 { x: -10000; y: 17.2; skew-x: 5; scale-x: 0.808; }
        frame 35 { x: 25.3; y: 18; skew-x: 2.5; scale-x: 0.804; }
        frame 36 { x: -10000; y: 18.9; skew-x: 0; scale-x: 0.8; }
        frame 37 { y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 38 { x: 25.2; y: 19.7; skew-x: -3.2; scale-x: 0.807; }
        frame 39 { x: -10000; y: 20.6; skew-x: -6.4; scale-x: 0.813; }
        frame 40 { y: 21.4; skew-x: -9.7; scale-x: 0.82; }
        frame 41 { y: 22.3; skew-x: -12.9; scale-x: 0.826; }
        frame 42 { x: 25.3; y: 23.2; skew-x: -16.3; scale-x: 0.834; }
        frame 43 { x: -10000; y: -10000; skew-x: -16.2; scale-x: 0.833; }
        frame 44 { skew-x: -16.3; scale-x: 0.834; }
        frame 45 { x: 25.2; y: 22.3; skew-x: -12.9; scale-x: 0.826; }
        frame 46 { x: -10000; y: 21.4; skew-x: -9.7; scale-x: 0.82; }
        frame 47 { y: 20.6; skew-x: -6.4; scale-x: 0.813; }
        frame 48 { y: 19.7; skew-x: -3.2; scale-x: 0.807; }
        frame 49 { x: 25.3; y: 18.9; skew-x: 0; scale-x: 0.8; }
        frame 50 { x: -10000; y: -10000; skew-x: -10000; scale-x: -10000; }
        frame 51 { x: 24.6; y: 22.6; scale-x: 0.832; scale-y: 0.762; }
        frame 52 { x: 23.8; y: 26.4; scale-x: 0.864; scale-y: 0.723; }
        frame 53 { x: 23.1; y: 30.2; scale-x: 0.896; scale-y: 0.685; }
        frame 54 { x: 22.3; y: 33.9; scale-x: 0.927; scale-y: 0.646; }
        frame 55 { x: 21.6; y: 37.6; scale-x: 0.959; scale-y: 0.608; }
        frame 56 { x: 20.8; y: 41.4; scale-x: 0.991; scale-y: 0.569; }
        frame 57 { x: 21.6; y: 36.2; scale-x: 0.96; scale-y: 0.618; }
        frame 58 { x: 22.4; y: 31.1; scale-x: 0.928; scale-y: 0.666; }
        frame 59 { x: 23.1; y: 26; scale-x: 0.897; scale-y: 0.714; }
        frame 60 { x: 23.9; y: 20.9; scale-x: 0.865; scale-y: 0.762; }
        frame 61 { x: 24.7; y: 15.7; scale-x: 0.834; scale-y: 0.81; }
        frame 62 { x: 25.5; y: 10.6; scale-x: 0.802; scale-y: 0.859; }
        frame 63 { x: 26.2; y: 5.5; scale-x: 0.77; scale-y: 0.907; }
        frame 64 { x: 27; y: 0.4; scale-x: 0.739; scale-y: 0.955; }
        frame 65 { x: 26.6; y: 5; scale-x: 0.754; scale-y: 0.916; }
        frame 66 { x: 26.2; y: 9.6; scale-x: 0.769; scale-y: 0.877; }
        frame 67 { x: 25.8; y: 14.3; scale-x: 0.785; scale-y: 0.839; }
        frame 68 { x: 25.3; y: 18.9; scale-x: 0.8; scale-y: 0.8; }
        frame 69 { x: 23.4; y: 26.5; scale-x: 0.879; scale-y: 0.715; }
        frame 70 { x: 21.4; y: 34.3; scale-x: 0.957; scale-y: 0.63; }
        frame 71 { x: 19.4; y: 41.9; scale-x: 1.036; scale-y: 0.545; }
        frame 72 { x: 17.4; y: 49.5; scale-x: 1.114; scale-y: 0.46; }
    }
}
