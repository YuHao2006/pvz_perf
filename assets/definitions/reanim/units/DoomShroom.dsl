export component DoomShroom {
    fps: 12;
    Track {
        source-name: "anim_sleep";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 52 { cel: 0; }
        frame 53 { cel: -10000; }
    }
    Track {
        source-name: "anim_explode";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 19 { cel: 0; }
        frame 20 { cel: -10000; }
        frame 52 { cel: -1; }
        frame 53 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 77;
        frame 20 { cel: -1; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "DoomShroom_body";
        frame-count: 77;
        frame 0 { x: 17.1; y: 40; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_DOOMSHROOM_BODY; }
        frame 1 { x: 16.9; y: 40.6; scale-x: 0.809; scale-y: 0.787; image: none; }
        frame 2 { x: 16.6; y: 41.4; scale-x: 0.818; scale-y: 0.773; }
        frame 3 { x: 16.4; y: 42; scale-x: 0.827; scale-y: 0.76; }
        frame 4 { x: 16.2; y: 42.7; scale-x: 0.837; scale-y: 0.747; }
        frame 5 { x: 15.9; y: 43.4; scale-x: 0.846; scale-y: 0.733; }
        frame 6 { x: 16.2; y: 42.6; scale-x: 0.837; scale-y: 0.747; }
        frame 7 { x: 16.4; y: 42; scale-x: 0.828; scale-y: 0.76; }
        frame 8 { x: 16.6; y: 41.3; scale-x: 0.818; scale-y: 0.773; }
        frame 9 { x: 16.9; y: 40.6; scale-x: 0.809; scale-y: 0.787; }
        frame 10 { x: 17.1; y: 40; scale-x: 0.8; scale-y: 0.8; }
        frame 11 { x: 17.4; y: 39.3; scale-x: 0.789; scale-y: 0.814; }
        frame 12 { x: 17.8; y: 38.5; scale-x: 0.777; scale-y: 0.829; }
        frame 13 { x: 18.1; y: 37.8; scale-x: 0.766; scale-y: 0.843; }
        frame 14 { x: 18.3; y: 37.1; scale-x: 0.755; scale-y: 0.857; }
        frame 15 { x: 18.1; y: 37.7; scale-x: 0.764; scale-y: 0.846; }
        frame 16 { x: 17.9; y: 38.3; scale-x: 0.773; scale-y: 0.834; }
        frame 17 { x: 17.6; y: 38.9; scale-x: 0.782; scale-y: 0.823; }
        frame 18 { x: 17.3; y: 39.4; scale-x: 0.791; scale-y: 0.811; }
        frame 19 { x: 17.1; y: 40; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 53 { x: 16.7; y: 40.5; skew-y: -0.7; scale-y: 0.789; }
        frame 54 { x: 16.3; y: 41; skew-y: -1.4; scale-y: 0.778; }
        frame 55 { x: 15.7; y: 41.6; skew-y: -2.2; scale-y: 0.767; }
        frame 56 { x: 15.3; y: 42.1; skew-y: -3; scale-y: 0.756; }
        frame 57 { x: 14.9; y: 42.6; skew-y: -3.9; scale-y: 0.744; }
        frame 58 { x: 14.4; y: 43.2; skew-y: -4.7; scale-y: 0.734; }
        frame 59 { x: 14.6; y: 43.1; skew-y: -4.2; scale-y: 0.738; }
        frame 60 { x: 14.8; y: 42.7; skew-y: -3.9; scale-y: 0.743; }
        frame 61 { x: 15; y: 42.6; skew-y: -3.7; scale-y: 0.748; }
        frame 62 { x: 15.2; y: 42.3; skew-y: -3.2; scale-y: 0.752; }
        frame 63 { x: 15.4; y: 42.1; skew-y: -2.9; scale-y: 0.757; }
        frame 64 { x: 15.5; y: 41.9; skew-y: -2.7; scale-y: 0.762; }
        frame 65 { x: 16.3; y: 42.1; skew-y: -1.4; scale-y: 0.757; }
        frame 66 { x: 17; y: 42.2; skew-y: -0; scale-y: 0.752; }
        frame 67 { x: 17.7; y: 42.5; skew-y: 1; scale-y: 0.748; }
        frame 68 { x: 18.4; y: 42.6; skew-y: 2.3; scale-y: 0.743; }
        frame 69 { x: 19.1; y: 42.8; skew-y: 3.5; scale-y: 0.738; }
        frame 70 { x: 19.8; y: 43; skew-y: 4.8; scale-y: 0.733; }
        frame 71 { x: 19.3; y: 42.5; skew-y: 3.8; scale-y: 0.744; }
        frame 72 { x: 18.9; y: 42; skew-y: 3; scale-y: 0.755; }
        frame 73 { x: 18.5; y: 41.5; skew-y: 2.3; scale-y: 0.767; }
        frame 74 { x: 18; y: 41; skew-y: 1.5; scale-y: 0.778; }
        frame 75 { x: 17.6; y: 40.5; skew-y: 0.8; scale-y: 0.789; }
        frame 76 { x: 17.1; y: 40; skew-y: 0; scale-y: 0.8; }
    }
    Track {
        source-name: "DoomShroom_head1";
        frame-count: 77;
        frame 0 { y: 3.6; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_DOOMSHROOM_HEAD1; }
        frame 1 { x: -0.2; y: 4.7; scale-x: 0.807; scale-y: 0.79; image: none; }
        frame 2 { x: -0.6; y: 5.8; scale-x: 0.814; scale-y: 0.78; }
        frame 3 { x: -1; y: 6.9; scale-x: 0.821; scale-y: 0.769; }
        frame 4 { x: -1.3; y: 7.9; scale-x: 0.829; scale-y: 0.759; }
        frame 5 { x: -1.7; y: 9; scale-x: 0.836; scale-y: 0.749; }
        frame 6 { x: -1.4; y: 7.9; scale-x: 0.829; scale-y: 0.759; }
        frame 7 { x: -1; y: 6.9; scale-x: 0.821; scale-y: 0.769; }
        frame 8 { x: -0.6; y: 5.8; scale-x: 0.814; scale-y: 0.78; }
        frame 9 { x: -0.3; y: 4.7; scale-x: 0.807; scale-y: 0.79; }
        frame 10 { x: 0; y: 3.6; scale-x: 0.8; scale-y: 0.8; }
        frame 11 { x: 0.4; y: 2.3; scale-x: 0.792; scale-y: 0.816; }
        frame 12 { x: 0.8; y: 0.9; scale-x: 0.784; scale-y: 0.833; }
        frame 13 { x: 1.2; y: -0.3; scale-x: 0.776; scale-y: 0.849; }
        frame 14 { x: 1.6; y: -1.6; scale-x: 0.768; scale-y: 0.865; }
        frame 15 { x: 1.3; y: -0.6; scale-x: 0.775; scale-y: 0.852; }
        frame 16 { x: 1; y: 0.4; scale-x: 0.781; scale-y: 0.839; }
        frame 17 { x: 0.6; y: 1.5; scale-x: 0.787; scale-y: 0.826; }
        frame 18 { x: 0.3; y: 2.5; scale-x: 0.794; scale-y: 0.813; }
        frame 19 { x: 0; y: 3.6; scale-x: 0.8; scale-y: 0.8; }
        frame 20 { x: -0.3; y: 2.9; scale-x: 0.809; scale-y: 0.812; }
        frame 21 { x: -0.7; y: 2.1; scale-x: 0.817; scale-y: 0.824; }
        frame 22 { x: -1.2; y: 1.4; scale-x: 0.826; scale-y: 0.836; }
        frame 23 { x: -1.6; y: 0.7; scale-x: 0.834; scale-y: 0.848; }
        frame 24 { x: -2; y: 0; scale-x: 0.843; scale-y: 0.859; }
        frame 25 { x: -2.5; y: -0.6; scale-x: 0.851; scale-y: 0.871; }
        frame 26 { x: -2.9; y: -1.3; scale-x: 0.86; scale-y: 0.883; }
        frame 27 { x: -3.3; y: -2; scale-x: 0.868; scale-y: 0.895; }
        frame 28 { x: -3.7; y: -2.8; scale-x: 0.877; scale-y: 0.907; }
        frame 29 { x: -4.2; y: -3.5; scale-x: 0.885; scale-y: 0.919; }
        frame 30 { x: -4.6; y: -4.2; scale-x: 0.894; scale-y: 0.931; }
        frame 31 { x: -5; y: -4.9; scale-x: 0.902; scale-y: 0.943; }
        frame 32 { x: -5.5; y: -5.7; scale-x: 0.911; scale-y: 0.955; }
        frame 33 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 34 { cel: -10000; }
    }
    Track {
        source-name: "DoomShroom_head2";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 26 { x: -6; y: -5; scale-x: 0.8; scale-y: 0.8; cel: 0; alpha: 0; image: IMAGE_REANIM_DOOMSHROOM_HEAD2; }
        frame 27 { x: -10000; y: -5.4; scale-x: -10000; scale-y: -10000; cel: -10000; alpha: 0.17; image: none; }
        frame 28 { y: -5.7; alpha: 0.33; }
        frame 29 { y: -6; alpha: 0.5; }
        frame 30 { y: -6.4; alpha: 0.67; }
        frame 31 { y: -6.7; alpha: 0.83; }
        frame 32 { y: -7; alpha: 1; }
        frame 33 { x: -6.6; y: -7.8; scale-x: 0.81; scale-y: 0.812; alpha: -10000; }
        frame 34 { x: -7.2; y: -8.5; scale-x: 0.819; scale-y: 0.823; }
        frame 35 { x: -7.8; y: -9.3; scale-x: 0.829; scale-y: 0.835; }
        frame 36 { x: -8.3; y: -10; scale-x: 0.839; scale-y: 0.846; }
        frame 37 { x: -8.9; y: -10.8; scale-x: 0.849; scale-y: 0.858; }
        frame 38 { x: -9.4; y: -11.6; scale-x: 0.858; scale-y: 0.87; }
        frame 39 { x: -10; y: -12.3; scale-x: 0.868; scale-y: 0.881; }
        frame 40 { x: -10.6; y: -13.1; scale-x: 0.878; scale-y: 0.893; }
        frame 41 { x: -10.2; y: -12.7; scale-x: 0.872; scale-y: -10000; }
        frame 42 { x: -9.8; y: -12.3; scale-x: 0.865; scale-y: 0.894; }
        frame 43 { x: -9.5; y: -11.9; scale-x: 0.859; scale-y: -10000; }
        frame 44 { x: -9.1; y: -11.4; scale-x: 0.853; }
        frame 45 { x: -8.7; y: -11; scale-x: 0.847; scale-y: 0.895; }
        frame 46 { x: -8.4; y: -10.7; scale-x: 0.84; scale-y: -10000; }
        frame 47 { x: -8; y: -10.4; scale-x: 0.834; }
        frame 48 { x: -10000; y: -10000; scale-x: -10000; cel: -1; }
        frame 49 { cel: -10000; }
    }
    Track {
        source-name: "DoomShroom_head3";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 32 { x: -6.3; y: -11.1; scale-x: 0.749; scale-y: 0.749; cel: 0; alpha: 0; image: IMAGE_REANIM_DOOMSHROOM_HEAD3; }
        frame 33 { x: -6.7; y: -11.3; scale-x: 0.756; scale-y: 0.756; cel: -10000; alpha: 0.13; image: none; }
        frame 34 { x: -7.1; y: -11.6; scale-x: 0.762; scale-y: 0.762; alpha: 0.25; }
        frame 35 { x: -7.5; y: -11.8; scale-x: 0.768; scale-y: 0.768; alpha: 0.38; }
        frame 36 { x: -7.9; y: -12.1; scale-x: 0.775; scale-y: 0.775; alpha: 0.5; }
        frame 37 { x: -8.3; y: -12.4; scale-x: 0.781; scale-y: 0.781; alpha: 0.63; }
        frame 38 { x: -8.7; y: -12.6; scale-x: 0.787; scale-y: 0.787; alpha: 0.75; }
        frame 39 { x: -9.1; y: -12.8; scale-x: 0.794; scale-y: 0.794; alpha: 0.88; }
        frame 40 { x: -9.5; y: -13.1; scale-x: 0.8; scale-y: 0.8; alpha: 1; }
        frame 41 { x: -10.5; y: -14.1; scale-x: 0.816; scale-y: 0.816; alpha: -10000; }
        frame 42 { x: -11.5; y: -15.3; scale-x: 0.832; scale-y: 0.832; }
        frame 43 { x: -12.6; y: -16.3; scale-x: 0.849; scale-y: 0.849; }
        frame 44 { x: -13.6; y: -17.4; scale-x: 0.865; scale-y: 0.865; }
        frame 45 { x: -14.6; y: -18.5; scale-x: 0.881; scale-y: 0.881; }
        frame 46 { x: -15.6; y: -19.7; scale-x: 0.897; scale-y: 0.897; }
        frame 47 { x: -16.7; y: -20.8; scale-x: 0.913; scale-y: 0.913; }
        frame 48 { x: -17.7; y: -21.8; scale-x: 0.929; scale-y: 0.929; }
        frame 49 { x: -18.7; y: -22.9; scale-x: 0.946; scale-y: 0.946; }
        frame 50 { x: -19.7; y: -24; scale-x: 0.962; scale-y: 0.962; }
        frame 51 { x: -20.8; y: -25.1; scale-x: 0.978; scale-y: 0.978; }
        frame 52 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 53 { cel: -10000; }
    }
    Track {
        source-name: "DoomShroom_sleepinghead";
        frame-count: 77;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 52 { y: 3.6; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_DOOMSHROOM_SLEEPINGHEAD; }
        frame 53 { x: -0.6; y: 5; scale-x: 0.806; scale-y: 0.782; cel: -10000; image: none; }
        frame 54 { x: -1.4; y: 6.5; scale-x: 0.812; scale-y: 0.763; }
        frame 55 { x: -2.2; y: 8; scale-x: 0.818; scale-y: 0.745; }
        frame 56 { x: -2.9; y: 9.4; scale-x: 0.824; scale-y: 0.727; }
        frame 57 { x: -3.7; y: 10.9; scale-x: 0.83; scale-y: 0.708; }
        frame 58 { x: -4.5; y: 12.4; scale-x: 0.836; scale-y: 0.69; }
        frame 59 { x: -3.7; y: 11; scale-x: 0.83; scale-y: 0.708; }
        frame 60 { x: -3; y: 9.5; scale-x: 0.824; scale-y: 0.727; }
        frame 61 { x: -2.2; y: 8; scale-x: 0.818; scale-y: 0.745; }
        frame 62 { x: -1.4; y: 6.5; scale-x: 0.812; scale-y: 0.763; }
        frame 63 { x: -0.7; y: 5.1; scale-x: 0.806; scale-y: 0.782; }
        frame 64 { x: 0; y: 3.6; scale-x: 0.8; scale-y: 0.8; }
        frame 65 { x: 0.3; y: 5; scale-x: 0.806; scale-y: 0.782; }
        frame 66 { x: 0.6; y: 6.5; scale-x: 0.812; scale-y: 0.763; }
        frame 67 { x: 1; y: 8; scale-x: 0.818; scale-y: 0.745; }
        frame 68 { x: 1.3; y: 9.4; scale-x: 0.824; scale-y: 0.727; }
        frame 69 { x: 1.6; y: 10.9; scale-x: 0.83; scale-y: 0.708; }
        frame 70 { x: 2; y: 12.4; scale-x: 0.836; scale-y: 0.69; }
        frame 71 { x: 1.6; y: 11; scale-x: 0.83; scale-y: 0.708; }
        frame 72 { x: 1.3; y: 9.5; scale-x: 0.824; scale-y: 0.727; }
        frame 73 { x: 1; y: 8; scale-x: 0.818; scale-y: 0.745; }
        frame 74 { x: 0.6; y: 6.5; scale-x: 0.812; scale-y: 0.763; }
        frame 75 { x: 0.3; y: 5.1; scale-x: 0.806; scale-y: 0.782; }
        frame 76 { x: 0; y: 3.6; scale-x: 0.8; scale-y: 0.8; }
    }
}
