export component Zombie_hand {
    fps: 30;
    Track {
        source-name: "arm";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 381.6; y: 712.5; scale-y: 0.203; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ARM; }
        frame 5 { x: 379.1; y: 634.5; scale-x: 0.951; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 376.5; y: 556.5; scale-x: 0.902; }
        frame 7 { x: 382.5; y: 525.5; scale-x: 0.794; scale-y: 0.402; }
        frame 8 { x: 377.3; y: 494.4; scale-x: 0.951; scale-y: 0.601; }
        frame 9 { x: 374.4; y: 463.4; scale-x: 0.976; scale-y: 0.801; }
        frame 10 { x: 371.4; y: 432.3; scale-x: 1; scale-y: 1; }
        frame 11 { x: 373.3; y: 422.8; scale-x: 0.956; scale-y: 1.028; }
        frame 12 { x: 375.1; y: 413.3; scale-x: 0.913; scale-y: 1.056; }
        frame 13 { x: 373.8; y: 420.3; scale-x: 0.942; scale-y: 1.037; }
        frame 14 { x: 372.6; y: 427.2; scale-x: 0.971; scale-y: 1.019; }
        frame 15 { x: 371.4; y: 434.1; scale-x: 1; scale-y: 1; }
        frame 16 { x: -10000; y: 433.4; scale-x: -10000; scale-y: -10000; }
        frame 17 { y: 432.7; }
        frame 18 { y: 432; }
        frame 19 { y: 431.3; }
        frame 20 { y: -10000; }
    }
    Track {
        source-name: "hand";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 388.2; y: 656.5; scale-x: 0.694; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_HAND; }
        frame 5 { x: 385.4; y: 578.5; scale-x: 0.66; cel: -10000; image: none; }
        frame 6 { x: 382.5; y: 500.6; scale-x: 0.626; }
        frame 7 { x: 375.8; y: 468.3; scale-x: 0.72; }
        frame 8 { x: 369.1; y: 436; scale-x: 0.813; }
        frame 9 { x: 362.7; y: 405.2; scale-x: 0.86; }
        frame 10 { x: 356.2; y: 374.4; scale-x: 0.907; }
        frame 11 { x: 349.5; y: 366.9; skew-x: -2.9; skew-y: -2.9; scale-x: 0.953; }
        frame 12 { x: 343.1; y: 359.9; skew-x: -5.9; skew-y: -5.9; scale-x: 1; }
        frame 13 { x: 346.8; y: 363.9; skew-x: -3.4; skew-y: -3.4; scale-x: 0.984; scale-y: 0.999; }
        frame 14 { x: 350.7; y: 368.3; skew-x: -1.2; skew-y: -1.2; scale-x: 0.968; scale-y: -10000; }
        frame 15 { x: 354.6; y: 372.7; skew-x: 1; skew-y: 1; scale-x: 0.953; }
        frame 16 { x: 352.9; y: 372.6; skew-x: -0; skew-y: -0; scale-x: 0.957; }
        frame 17 { x: 351.1; y: 372.8; skew-x: -1.2; skew-y: -1.2; scale-x: 0.96; }
        frame 18 { x: 349.3; y: 373; skew-x: -2.5; skew-y: -2.5; scale-x: 0.964; }
        frame 19 { x: 347.4; y: 373.3; skew-x: -3.9; skew-y: -3.9; scale-x: 0.968; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
    }
    Track {
        source-name: "finger1-2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 401.2; y: 567.5; skew-x: 30; skew-y: 30; scale-x: 0.694; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_FINGER1_2; }
        frame 5 { x: 397.8; y: 489.4; skew-x: 31.3; skew-y: 28.8; scale-x: 0.668; scale-y: 0.987; cel: -10000; image: none; }
        frame 6 { x: 394.2; y: 411.5; skew-x: 32.6; skew-y: 27.5; scale-x: 0.644; scale-y: 0.977; }
        frame 7 { x: 367.3; y: 382; skew-x: 24.3; skew-y: 20.6; scale-x: 0.731; scale-y: 0.981; }
        frame 8 { x: 340.3; y: 353.5; skew-x: 16.3; skew-y: 13.8; scale-x: 0.821; scale-y: 0.988; }
        frame 9 { x: 323.6; y: 325.2; skew-x: 12; skew-y: 10.3; scale-x: 0.865; scale-y: 0.99; }
        frame 10 { x: 306.9; y: 296.9; skew-x: 8; skew-y: 6.8; scale-x: 0.91; scale-y: 0.993; }
        frame 11 { x: 277.5; y: 316.5; skew-x: -7.7; skew-y: -7.9; scale-x: 0.986; scale-y: 0.966; }
        frame 12 { x: 250.8; y: 338.8; skew-x: -23.8; skew-y: -22.8; scale-x: 1.063; scale-y: 0.94; }
        frame 13 { x: 272.5; y: 322.1; skew-x: -10.2; skew-y: -7; scale-x: 1.026; scale-y: 0.961; }
        frame 14 { x: 296.2; y: 307.6; skew-x: 3; skew-y: 8.3; scale-x: 0.99; scale-y: 0.982; }
        frame 15 { x: 321.6; y: 295.8; skew-x: 16.6; skew-y: 24.1; scale-x: 0.953; scale-y: 1.003; }
        frame 16 { x: 315.9; y: 297.7; skew-x: 15; skew-y: 21.8; scale-x: 0.956; scale-y: 1.002; }
        frame 17 { x: 310.4; y: 299.8; skew-x: 13.5; skew-y: 19.8; scale-x: 0.96; scale-y: 1.001; }
        frame 18 { x: 304.8; y: 301.9; skew-x: 12; skew-y: 17.6; scale-x: 0.964; scale-y: -10000; }
        frame 19 { x: 299.2; y: 303.9; skew-x: 10.5; skew-y: 15.5; scale-x: 0.968; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
    }
    Track {
        source-name: "finger1-1";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 395.8; y: 614.5; skew-x: 45; skew-y: 36.6; scale-x: 0.694; scale-y: 1.011; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_FINGER1_1; }
        frame 5 { x: 392.6; y: 536.5; skew-x: 46.4; skew-y: 35.3; scale-x: 0.676; scale-y: 0.992; cel: -10000; image: none; }
        frame 6 { x: 389.3; y: 458.5; skew-x: 47.9; skew-y: 33.9; scale-x: 0.661; scale-y: 0.977; }
        frame 7 { x: 369.5; y: 427.2; skew-x: 35.8; skew-y: 25.3; scale-x: 0.744; scale-y: 0.981; }
        frame 8 { x: 349.7; y: 398.1; skew-x: 23.8; skew-y: 16.8; scale-x: 0.829; scale-y: 0.987; }
        frame 9 { x: 336.7; y: 369.8; skew-x: 17.8; skew-y: 12.5; scale-x: 0.871; scale-y: 0.99; }
        frame 10 { x: 324; y: 341.9; skew-x: 11.8; skew-y: 8.3; scale-x: 0.914; scale-y: 0.993; }
        frame 11 { x: 306.1; y: 353.4; skew-x: -5.9; skew-y: -2.7; scale-x: 0.988; scale-y: 0.973; }
        frame 12 { x: 292; y: 367.2; skew-x: -23.8; skew-y: -14.1; scale-x: 1.063; scale-y: 0.953; }
        frame 13 { x: 300.8; y: 357.8; skew-x: -11.9; skew-y: -6; scale-x: 1.026; scale-y: 0.967; }
        frame 14 { x: 311.2; y: 349.3; skew-x: -0.2; skew-y: 1.8; scale-x: 0.991; scale-y: 0.981; }
        frame 15 { x: 323.5; y: 341.7; skew-x: 11.5; skew-y: 9.8; scale-x: 0.956; scale-y: 0.995; }
        frame 16 { x: 319.4; y: 343.8; skew-x: 8.6; skew-y: 7.1; scale-x: 0.959; scale-y: -10000; }
        frame 17 { x: 315.4; y: 346; skew-x: 5.8; skew-y: 4.5; scale-x: 0.963; scale-y: 0.996; }
        frame 18 { x: 311.6; y: 348.3; skew-x: 3; skew-y: 2; scale-x: 0.967; scale-y: -10000; }
        frame 19 { x: 307.7; y: 350.6; skew-x: 0.3; skew-y: -0.4; scale-x: 0.97; scale-y: 0.997; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "finger2-2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 402.2; y: 543.3; skew-x: 4.8; skew-y: 4.8; scale-x: 0.694; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_FINGER2_2; }
        frame 5 { x: 398.6; y: 465.4; skew-x: 5; skew-y: 4.5; scale-x: 0.66; scale-y: 0.999; cel: -10000; image: none; }
        frame 6 { x: 395.1; y: 387.3; skew-x: 5.3; skew-y: 4.3; scale-x: 0.626; scale-y: -10000; }
        frame 7 { x: 378.9; y: 358.1; skew-x: 3.8; skew-y: 3; scale-x: 0.72; }
        frame 8 { x: 362.9; y: 328.8; skew-x: 2.5; skew-y: 2; scale-x: 0.813; }
        frame 9 { x: 351.7; y: 299.6; skew-x: 1.8; skew-y: 1.5; scale-x: 0.86; }
        frame 10 { x: 340.7; y: 270.3; skew-x: 1.3; skew-y: 1; scale-x: 0.906; scale-y: 1; }
        frame 11 { x: 306.7; y: 279.6; skew-x: -13; skew-y: -16.2; scale-x: 0.965; scale-y: 0.989; }
        frame 12 { x: 274.9; y: 292.5; skew-x: -27.6; skew-y: -33.7; scale-x: 1.026; scale-y: 0.98; }
        frame 13 { x: 296.8; y: 281.6; skew-x: -15.2; skew-y: -20; scale-x: 0.996; scale-y: 0.989; }
        frame 14 { x: 320.4; y: 272.8; skew-x: -2.9; skew-y: -6.4; scale-x: 0.968; scale-y: 1.001; }
        frame 15 { x: 345.4; y: 266.3; skew-x: 9.1; skew-y: 7.1; scale-x: 0.939; scale-y: 1.012; }
        frame 16 { x: 339.1; y: 267.7; skew-x: 7; skew-y: 4.8; scale-x: 0.942; scale-y: -10000; }
        frame 17 { x: 332.8; y: 269.2; skew-x: 4.8; skew-y: 2.5; scale-x: 0.945; scale-y: 1.014; }
        frame 18 { x: 326.7; y: 270.5; skew-x: 2.8; skew-y: 0.3; scale-x: 0.948; scale-y: 1.015; }
        frame 19 { x: 320.5; y: 272.2; skew-x: 0.7; skew-y: -1.9; scale-x: 0.95; scale-y: 1.016; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "finger2-1";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 405.1; y: 599.4; skew-x: 30; skew-y: 34.5; scale-x: 0.694; scale-y: 1.003; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_FINGER2_1; }
        frame 5 { x: 401.4; y: 521.3; skew-x: 31.3; skew-y: 33.1; scale-x: 0.668; scale-y: 0.986; cel: -10000; image: none; }
        frame 6 { x: 397.7; y: 443.4; skew-x: 32.6; skew-y: 31.8; scale-x: 0.644; scale-y: 0.973; }
        frame 7 { x: 381.2; y: 412; skew-x: 24.3; skew-y: 23.8; scale-x: 0.731; scale-y: 0.978; }
        frame 8 { x: 364.5; y: 382.2; skew-x: 16.3; skew-y: 15.8; scale-x: 0.821; scale-y: 0.986; }
        frame 9 { x: 352.9; y: 353.4; skew-x: 12; skew-y: 11.8; scale-x: 0.865; scale-y: 0.988; }
        frame 10 { x: 341.5; y: 324.9; skew-x: 8; skew-y: 7.8; scale-x: 0.91; scale-y: 0.992; }
        frame 11 { x: 323.1; y: 327.7; skew-x: -2.5; skew-y: -2.9; scale-x: 0.966; scale-y: 0.985; }
        frame 12 { x: 306.1; y: 332.6; skew-x: -13.4; skew-y: -14; scale-x: 1.022; scale-y: 0.978; }
        frame 13 { x: 316.4; y: 327.1; skew-x: -5.2; skew-y: -6.7; scale-x: 0.999; scale-y: 0.984; }
        frame 14 { x: 327.7; y: 322.5; skew-x: 2.5; skew-y: 0.3; scale-x: 0.977; scale-y: 0.991; }
        frame 15 { x: 339.8; y: 318.6; skew-x: 10.6; skew-y: 7.8; scale-x: 0.954; scale-y: 0.998; }
        frame 16 { x: 335.7; y: 320; skew-x: 8.5; skew-y: 5.5; scale-x: 0.958; scale-y: -10000; }
        frame 17 { x: 331.5; y: 321.5; skew-x: 6.3; skew-y: 3.3; scale-x: 0.961; scale-y: 0.999; }
        frame 18 { x: 327.3; y: 323; skew-x: 4.3; skew-y: 0.8; scale-x: 0.965; scale-y: -10000; }
        frame 19 { x: 323.3; y: 324.3; skew-x: 2.3; skew-y: -1.2; scale-x: 0.969; scale-y: 1; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "finger3-2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 405.1; y: 552.3; skew-y: 2.5; scale-x: 0.694; scale-y: 1.001; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_FINGER3_2; }
        frame 5 { x: 401.4; y: 474.3; skew-y: 2.3; scale-x: 0.66; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 397.7; y: 396.3; skew-y: 2.2; scale-x: 0.626; }
        frame 7 { x: 391.5; y: 364; skew-y: 1.5; scale-x: 0.72; scale-y: 1; }
        frame 8 { x: 385.4; y: 331.7; skew-y: 1; scale-x: 0.813; scale-y: -10000; }
        frame 9 { x: 379.1; y: 300.9; skew-y: 0.8; scale-x: 0.86; }
        frame 10 { x: 372.9; y: 270.1; skew-y: 0.5; scale-x: 0.907; }
        frame 11 { x: 341.8; y: 272.2; skew-x: -13.2; skew-y: -16.4; scale-x: 0.954; scale-y: 1.001; }
        frame 12 { x: 312.6; y: 277.3; skew-x: -26.5; skew-y: -33.6; scale-x: 1.003; scale-y: 1.004; }
        frame 13 { x: 332.9; y: 272.8; skew-x: -15; skew-y: -20.7; scale-x: 0.985; scale-y: 1.002; }
        frame 14 { x: 354.5; y: 269.8; skew-x: -3.7; skew-y: -8; scale-x: 0.969; scale-y: -10000; }
        frame 15 { x: 376.9; y: 268.5; skew-x: 7.5; skew-y: 4.5; scale-x: 0.952; }
        frame 16 { x: 372.2; y: 268.7; skew-x: 6; skew-y: 3; scale-x: 0.955; scale-y: 1.001; }
        frame 17 { x: 367.7; y: 268.8; skew-x: 4.5; skew-y: 1.8; scale-x: 0.959; scale-y: -10000; }
        frame 18 { x: 363; y: 269; skew-x: 3.1; skew-y: 0.3; scale-x: 0.963; }
        frame 19 { x: 358.4; y: 269.2; skew-x: 1.8; skew-y: -0.9; scale-x: 0.967; scale-y: 1; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "finger3-1";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 402; y: 606.9; skew-y: 2.5; scale-x: 0.694; scale-y: 1.001; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_FINGER3_1; }
        frame 5 { x: 398.4; y: 528.9; skew-y: 2.3; scale-x: 0.66; scale-y: -10000; cel: -10000; image: none; }
        frame 6 { x: 394.9; y: 450.9; skew-y: 2.2; scale-x: 0.626; }
        frame 7 { x: 389.1; y: 418.6; skew-y: 1.5; scale-x: 0.72; scale-y: 1; }
        frame 8 { x: 383.4; y: 386.3; skew-y: 1; scale-x: 0.813; scale-y: -10000; }
        frame 9 { x: 377.3; y: 355.5; skew-y: 0.8; scale-x: 0.86; }
        frame 10 { x: 371.3; y: 324.7; skew-y: 0.5; scale-x: 0.907; }
        frame 11 { x: 355.9; y: 320.6; skew-x: -5.7; skew-y: -8.9; scale-x: 0.955; scale-y: 1.001; }
        frame 12 { x: 340.8; y: 317.6; skew-x: -11.6; skew-y: -18.5; scale-x: 1.004; scale-y: 1.002; }
        frame 13 { x: 351.1; y: -10000; skew-x: -5.4; skew-y: -11; scale-x: 0.987; scale-y: -10000; }
        frame 14 { x: 361.6; y: 318.4; skew-x: 0.3; skew-y: -3.7; scale-x: 0.97; }
        frame 15 { x: 372.5; y: 319.7; skew-x: 6.5; skew-y: 3.5; scale-x: 0.952; }
        frame 16 { x: 368.8; y: 319.8; skew-x: 4.8; skew-y: 1.5; scale-x: 0.956; scale-y: 1.003; }
        frame 17 { x: 365.1; y: 320; skew-x: 3; skew-y: -0.4; scale-x: 0.96; scale-y: -10000; }
        frame 18 { x: 361.5; y: 320.2; skew-x: 1.3; skew-y: -2.4; scale-x: 0.964; }
        frame 19 { x: 357.9; y: 320.3; skew-x: -0.2; skew-y: -4.4; scale-x: 0.968; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
    }
    Track {
        source-name: "finger4-2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 398.8; y: 587.5; skew-x: -29.9; skew-y: -29.9; scale-x: 0.694; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_FINGER4_2; }
        frame 5 { x: 395.4; y: 509.5; skew-x: -31.2; skew-y: -28.7; scale-x: 0.668; scale-y: 0.987; cel: -10000; image: none; }
        frame 6 { x: 392; y: 431.5; skew-x: -32.5; skew-y: -27.4; scale-x: 0.644; scale-y: 0.977; }
        frame 7 { x: 399.7; y: 398; skew-x: -24.2; skew-y: -20.5; scale-x: 0.731; scale-y: 0.981; }
        frame 8 { x: 407.4; y: 364.2; skew-x: -16.2; skew-y: -13.7; scale-x: 0.821; scale-y: 0.988; }
        frame 9 { x: 408.4; y: 332.3; skew-x: -11.9; skew-y: -10.2; scale-x: 0.865; scale-y: 0.99; }
        frame 10 { x: 409.4; y: 300.5; skew-x: -7.9; skew-y: -6.7; scale-x: 0.91; scale-y: 0.993; }
        frame 11 { x: 388.6; y: 294.2; skew-x: -16.5; skew-y: -23.4; scale-x: 0.936; scale-y: 1.032; }
        frame 12 { x: 368.6; y: 290.5; skew-x: -25.2; skew-y: -40.2; scale-x: 0.964; scale-y: 1.073; }
        frame 13 { x: 385.4; y: 291.3; skew-x: -14.7; skew-y: -26.5; scale-x: 0.959; scale-y: 1.049; }
        frame 14 { x: 403.2; y: 293.5; skew-x: -4.4; skew-y: -12.7; scale-x: 0.956; scale-y: 1.027; }
        frame 15 { x: 422; y: 297.3; skew-x: 5.8; skew-y: 0.8; scale-x: 0.953; scale-y: 1.004; }
        frame 16 { x: 418.4; y: 296.6; skew-x: 3.8; skew-y: 0; scale-x: 0.957; scale-y: 1.003; }
        frame 17 { x: 415; y: 296; skew-x: 1.8; skew-y: -0.7; scale-x: 0.96; scale-y: 1.002; }
        frame 18 { x: 411.4; y: 295.1; skew-x: 0; skew-y: -1.7; scale-x: 0.964; scale-y: 1.001; }
        frame 19 { x: 407.9; y: 294.5; skew-x: -2.1; skew-y: -2.6; scale-x: 0.968; scale-y: 1; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "finger4-1";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 4 { x: 409.8; y: 619.5; skew-x: -8.5; skew-y: -22.5; scale-x: 0.698; scale-y: 1.024; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_FINGER4_1; }
        frame 5 { x: 405.9; y: 541.5; skew-x: -8.9; skew-y: -21.5; scale-x: 0.664; scale-y: 1.016; cel: -10000; image: none; }
        frame 6 { x: 401.9; y: 463.6; skew-x: -9.4; skew-y: -20.5; scale-x: 0.632; scale-y: 1.01; }
        frame 7 { x: 405.1; y: 430.6; skew-x: -6.9; skew-y: -15.2; scale-x: 0.723; scale-y: 1.006; }
        frame 8 { x: 408.2; y: 397.7; skew-x: -4.7; skew-y: -10.2; scale-x: 0.816; scale-y: 1.004; }
        frame 9 { x: 406.8; y: 366.4; skew-x: -3.4; skew-y: -7.4; scale-x: 0.861; scale-y: 1.003; }
        frame 10 { x: 405.2; y: 335.3; skew-x: -2.2; skew-y: -4.9; scale-x: 0.908; scale-y: 1.002; }
        frame 11 { x: 394.9; y: 326.7; skew-x: -5.7; skew-y: -14.2; scale-x: 0.948; scale-y: 1.02; }
        frame 12 { x: 384.7; y: 318.9; skew-x: -9.5; skew-y: -23.5; scale-x: 0.99; scale-y: 1.041; }
        frame 13 { x: 393.8; y: 322.8; skew-x: -3.9; skew-y: -15.2; scale-x: 0.977; scale-y: 1.036; }
        frame 14 { x: 403.3; y: 327.3; skew-x: 1.3; skew-y: -6.7; scale-x: 0.965; scale-y: 1.033; }
        frame 15 { x: 412.7; y: 332.2; skew-x: 7; skew-y: 1.5; scale-x: 0.953; scale-y: 1.029; }
        frame 16 { x: 409.6; y: 331.2; skew-x: 5.1; skew-y: -0.2; scale-x: 0.956; scale-y: 1.028; }
        frame 17 { x: 406.4; y: 330.4; skew-x: 3.3; skew-y: -2.2; scale-x: 0.96; scale-y: 1.026; }
        frame 18 { x: 403.1; y: 329.5; skew-x: 1.6; skew-y: -4.2; scale-x: 0.964; scale-y: 1.024; }
        frame 19 { x: 399.8; y: 328.6; skew-x: 0; skew-y: -6.2; scale-x: 0.969; scale-y: 1.022; }
        frame 20 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 8 { x: 429.7; y: 513; scale-x: 0.552; scale-y: 0.552; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK2; }
        frame 9 { x: 449.6; y: 479.7; skew-x: 28.1; skew-y: 28.1; scale-x: 0.551; scale-y: 0.551; cel: -10000; image: none; }
        frame 10 { x: 470.7; y: 450.5; skew-x: 56.2; skew-y: 56.2; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 485.4; y: 491.8; skew-x: 98.3; skew-y: 98.3; scale-x: 0.55; scale-y: 0.55; }
        frame 12 { x: 492.5; y: 538.8; skew-x: 140.6; skew-y: 140.6; scale-x: 0.549; scale-y: 0.549; }
        frame 13 { x: -10000; y: 540.1; skew-x: 142.7; skew-y: 138.5; scale-x: 0.534; scale-y: 0.526; }
        frame 14 { y: 539.5; skew-x: 141.7; skew-y: 139.6; scale-x: 0.54; scale-y: 0.537; }
        frame 15 { x: 492.4; y: 538.8; skew-x: 140.6; skew-y: 140.6; scale-x: 0.549; scale-y: 0.549; }
        frame 16 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock5";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 8 { x: 399.4; y: 520; skew-x: -5.2; skew-y: -5.2; scale-x: 0.629; scale-y: 0.629; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK5; }
        frame 9 { x: 383.1; y: 503; skew-x: -21; skew-y: -21; scale-x: 0.628; scale-y: 0.628; cel: -10000; image: none; }
        frame 10 { x: 367.4; y: 486.4; skew-x: -37; skew-y: -37; scale-x: 0.627; scale-y: 0.627; }
        frame 11 { x: 352.2; y: 469.8; skew-x: -53; skew-y: -53; scale-x: 0.628; scale-y: 0.628; }
        frame 12 { x: 347.2; y: 499.2; skew-x: -75.8; skew-y: -75.8; scale-x: 0.749; scale-y: 0.749; }
        frame 13 { x: 343.7; y: 528.8; skew-x: -98.2; skew-y: -98.2; scale-x: 0.872; scale-y: 0.872; }
        frame 14 { x: 342.2; y: 557.9; skew-x: -120.9; skew-y: -120.9; scale-x: 0.994; scale-y: 0.994; }
        frame 15 { x: -10000; y: 558.8; skew-x: -122.8; skew-y: -119.1; scale-x: 0.942; scale-y: 0.976; }
        frame 16 { x: 342.1; y: 558.4; skew-x: -121.8; skew-y: -120; scale-x: 0.967; scale-y: 0.983; }
        frame 17 { x: 342.2; y: 557.9; skew-x: -120.9; skew-y: -120.9; scale-x: 0.994; scale-y: 0.994; }
        frame 18 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock2.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 6 { x: 423.5; y: 530.5; scale-x: 0.552; scale-y: 0.552; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK2; }
        frame 7 { x: 432.5; y: 523.6; skew-x: 14.8; skew-y: 14.8; scale-x: 0.654; scale-y: 0.654; cel: -10000; image: none; }
        frame 8 { x: 443.7; y: 517; skew-x: 30; skew-y: 30; scale-x: 0.757; scale-y: 0.757; }
        frame 9 { x: 459.2; y: 510; skew-x: 45; skew-y: 45; scale-x: 0.875; scale-y: 0.875; }
        frame 10 { x: 459.1; y: 508.6; skew-x: 44.9; skew-y: 44.9; scale-x: 0.874; scale-y: 0.874; }
        frame 11 { x: -10000; y: 507.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 459.2; y: 505.8; skew-x: 45; skew-y: 45; scale-x: 0.875; scale-y: 0.875; }
        frame 13 { x: 461.5; y: 506.9; skew-x: 48.4; skew-y: 48.4; scale-x: 0.874; scale-y: 0.874; }
        frame 14 { x: 463.8; y: 508.1; skew-x: 51.7; skew-y: 51.7; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 466; y: 509.3; skew-x: 55; skew-y: 55; scale-x: 0.875; scale-y: 0.875; }
        frame 16 { x: -10000; y: -10000; skew-x: 55.1; skew-y: 55.1; scale-x: 0.874; scale-y: 0.874; }
        frame 17 { skew-x: 55; skew-y: 55; scale-x: 0.875; scale-y: 0.875; }
        frame 18 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock1";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 6 { x: 383.4; y: 526.4; scale-x: 0.692; scale-y: 0.503; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK1; }
        frame 7 { x: 375; y: 518.5; skew-x: -7.2; skew-y: -7.4; scale-x: 0.722; scale-y: 0.659; cel: -10000; image: none; }
        frame 8 { x: 365.5; y: 511.4; skew-x: -14.9; skew-y: -14.9; scale-x: 0.752; scale-y: 0.815; }
        frame 9 { x: 347.9; y: 515.2; skew-x: -29.9; skew-y: -29.9; scale-x: 0.842; scale-y: 0.912; }
        frame 10 { x: 346.4; y: 515.4; skew-x: -32.5; skew-y: -32.5; scale-x: 0.84; scale-y: 0.91; }
        frame 11 { x: 344.8; y: 515.6; skew-x: -35.2; skew-y: -35.2; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 343.2; y: 515.9; skew-x: -37.9; skew-y: -37.9; scale-x: 0.841; scale-y: 0.912; }
        frame 13 { x: 342.7; y: 517; skew-x: -38.5; skew-y: -38.5; scale-x: 0.84; scale-y: 0.91; }
        frame 14 { x: 342.3; y: 518.1; skew-x: -39; skew-y: -39; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 341.8; y: 519.1; skew-x: -39.4; skew-y: -39.4; scale-x: 0.841; scale-y: 0.911; }
        frame 16 { x: -10000; y: -10000; skew-x: -39.5; skew-y: -39.5; scale-x: 0.84; scale-y: 0.91; }
        frame 17 { skew-x: -39.4; skew-y: -39.4; scale-x: 0.841; scale-y: 0.911; }
        frame 18 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock3";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 7 { x: 412.4; y: 539; scale-x: 0.461; scale-y: 0.461; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK3; }
        frame 8 { x: 410.6; y: 533.5; scale-x: 0.594; scale-y: 0.594; cel: -10000; image: none; }
        frame 9 { x: 408.9; y: 527.9; scale-x: 0.728; scale-y: 0.728; }
        frame 10 { x: -10000; y: 526.6; scale-x: -10000; scale-y: -10000; }
        frame 11 { y: 525.5; }
        frame 12 { y: 524.3; }
        frame 13 { y: 525.3; }
        frame 14 { y: 526.3; }
        frame 15 { y: 527.3; }
        frame 16 { y: -10000; }
    }
    Track {
        source-name: "rock6";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 412.9; y: 548.7; scale-x: 0.344; scale-y: 0.344; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK6; }
        frame 4 { x: 412.1; y: 546.8; scale-x: 0.452; scale-y: 0.452; cel: -10000; image: none; }
        frame 5 { x: 411.3; y: 544.9; scale-x: 0.56; scale-y: 0.56; }
        frame 6 { x: 413.1; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 415.2; y: 542.3; scale-x: 0.659; scale-y: 0.659; }
        frame 8 { x: 417.2; y: 539.8; scale-x: 0.758; scale-y: 0.758; }
        frame 9 { x: 419.4; y: 537.2; scale-x: 0.857; scale-y: 0.857; }
        frame 10 { x: 422.1; y: 538.2; scale-x: 0.851; scale-y: 0.851; }
        frame 11 { x: 424.7; y: 539.1; scale-x: 0.846; scale-y: 0.846; }
        frame 12 { x: 427.4; y: 540; scale-x: 0.84; scale-y: 0.84; }
        frame 13 { x: 428.3; y: 541.8; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 429.1; y: 543.5; }
        frame 15 { x: 429.8; y: 545.6; }
        frame 16 { x: -10000; y: 544.6; scale-y: 0.877; }
        frame 17 { y: 543.6; scale-y: 0.913; }
        frame 18 { y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock5.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 405.7; y: 549; scale-x: 0.368; scale-y: 0.368; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK5; }
        frame 4 { x: 401.9; y: 547.4; skew-x: -7.2; skew-y: -7.2; scale-x: 0.478; scale-y: 0.478; cel: -10000; image: none; }
        frame 5 { x: 398.1; y: 546.3; skew-x: -14.9; skew-y: -14.9; scale-x: 0.588; scale-y: 0.588; }
        frame 6 { x: 389.4; y: 543.5; skew-x: -29.9; skew-y: -29.9; scale-x: 0.828; scale-y: 0.925; }
        frame 7 { x: 387.3; y: 544.5; skew-x: -34.8; skew-y: -35; scale-x: 0.852; scale-y: 0.952; }
        frame 8 { x: 385.1; y: 545.7; skew-x: -39.8; skew-y: -40; scale-x: 0.877; scale-y: 0.98; }
        frame 9 { x: 383.2; y: 546.9; skew-x: -44.9; skew-y: -44.9; scale-x: 0.904; scale-y: 1.01; }
        frame 10 { x: 382.6; y: 546; skew-x: -44.8; skew-y: -45; scale-x: 0.903; scale-y: 1.009; }
        frame 11 { x: 382; y: 545.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 381.4; y: 544.5; skew-x: -44.9; skew-y: -44.9; scale-x: 0.904; scale-y: 1.01; }
        frame 13 { x: 381.5; y: 545.9; skew-x: -44.8; skew-y: -45; scale-x: 0.903; scale-y: 1.009; }
        frame 14 { x: -10000; y: 547.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 381.4; y: 548.6; skew-x: -44.9; skew-y: -44.9; scale-x: 0.904; scale-y: 1.01; }
        frame 16 { x: -10000; y: -10000; skew-x: -44.8; skew-y: -45; scale-x: 0.903; scale-y: 1.009; }
        frame 17 { skew-x: -44.9; skew-y: -44.9; scale-x: 0.904; scale-y: 1.01; }
        frame 18 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock4";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 420.3; y: 550.9; scale-x: 0.147; scale-y: 0.147; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK4; }
        frame 4 { x: 420.7; y: 547.5; skew-x: 14.8; skew-y: 14.8; scale-x: 0.204; scale-y: 0.204; cel: -10000; image: none; }
        frame 5 { x: 421.8; y: 543.6; skew-x: 30; skew-y: 30; scale-x: 0.26; scale-y: 0.26; }
        frame 6 { x: 427.9; y: 541.4; skew-x: 45; skew-y: 45; scale-x: 0.305; scale-y: 0.345; }
        frame 7 { x: 429.8; y: 540.3; skew-x: 49.9; skew-y: 49.9; scale-x: 0.331; scale-y: 0.374; }
        frame 8 { x: 432; y: 539; skew-x: 55.1; skew-y: 54.9; scale-x: 0.357; scale-y: 0.404; }
        frame 9 { x: 434.4; y: 537.9; skew-x: 60; skew-y: 60; scale-x: 0.384; scale-y: 0.434; }
        frame 10 { x: 435.2; y: 536.8; skew-x: 61.9; skew-y: 61.9; scale-x: -10000; scale-y: -10000; }
        frame 11 { x: 436.1; y: 535.6; skew-x: 63.7; skew-y: 63.7; }
        frame 12 { x: 437; y: 534.5; skew-x: 65.3; skew-y: 65.3; }
        frame 13 { x: -10000; y: 535.5; skew-x: 65.4; skew-y: 65.4; }
        frame 14 { y: 536.5; skew-x: -10000; skew-y: -10000; }
        frame 15 { y: 537.5; skew-x: 65.3; skew-y: 65.3; }
        frame 16 { y: -10000; skew-x: 65.4; skew-y: 65.4; }
        frame 17 { skew-x: 65.3; skew-y: 65.3; }
        frame 18 { skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "rock6.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { x: 410.5; y: 551.7; scale-x: 0.344; scale-y: 0.344; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK6; }
        frame 2 { x: 401.8; y: -10000; skew-x: -14.7; skew-y: -14.7; scale-x: 0.463; scale-y: 0.463; cel: -10000; image: none; }
        frame 3 { x: 393.4; y: 552.2; skew-x: -29.9; skew-y: -29.9; scale-x: 0.582; scale-y: 0.582; }
        frame 4 { x: 390.6; y: 553; skew-x: -44.8; skew-y: -44.8; scale-x: 0.649; scale-y: 0.649; }
        frame 5 { x: 388.3; y: 554; skew-x: -59.9; skew-y: -59.9; scale-x: 0.718; scale-y: 0.718; }
        frame 6 { x: 385.9; y: 555.5; skew-x: -104.9; skew-y: -104.9; scale-x: 0.848; scale-y: 0.848; }
        frame 7 { x: 383.6; y: -10000; skew-x: -119.8; skew-y: -119.8; scale-x: 0.879; scale-y: 0.879; }
        frame 8 { x: 381.5; y: 555; skew-x: -134.8; skew-y: -134.8; scale-x: 0.91; scale-y: 0.91; }
        frame 9 { x: 379.3; y: 554; skew-x: -149.9; skew-y: -149.9; scale-x: 0.942; scale-y: 0.942; }
        frame 10 { x: 377.6; y: 555.5; skew-x: -153.3; skew-y: -153.3; scale-x: 0.941; scale-y: 0.941; }
        frame 11 { x: 375.9; y: 556.8; skew-x: -156.6; skew-y: -156.6; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 374.1; y: 558; skew-x: -160; skew-y: -160; scale-x: 0.942; scale-y: 0.942; }
        frame 13 { x: 372.9; y: 560.2; skew-x: -166.1; skew-y: -166.1; scale-x: 0.941; scale-y: 0.941; }
        frame 14 { x: 371.6; y: 562.5; skew-x: -171.9; skew-y: -171.9; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 370.3; y: 564.8; skew-x: -177.9; skew-y: -177.9; }
        frame 16 { x: -10000; y: 564; skew-x: -10000; skew-y: -10000; scale-x: 0.94; scale-y: 0.962; }
        frame 17 { y: 563.1; scale-x: 0.941; scale-y: 0.983; }
        frame 18 { y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock4.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { x: 417.9; y: 552.6; scale-x: 0.147; scale-y: 0.147; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK4; }
        frame 2 { x: 422.5; y: 551.3; skew-x: 7.3; skew-y: 7.3; scale-x: 0.198; scale-y: 0.198; cel: -10000; image: none; }
        frame 3 { x: 427.3; y: 549.6; skew-x: 15; skew-y: 15; scale-x: 0.25; scale-y: 0.25; }
        frame 4 { x: 429.7; y: 547.1; skew-x: 29.9; skew-y: 29.9; scale-x: 0.275; scale-y: 0.275; }
        frame 5 { x: 432.7; y: 544.8; skew-x: 45; skew-y: 45; scale-x: 0.3; scale-y: 0.3; }
        frame 6 { x: 446; y: 541.2; skew-x: 90; skew-y: 90; scale-x: 0.379; scale-y: 0.369; }
        frame 7 { x: 453.1; y: 541; skew-x: 104.8; skew-y: 104.8; scale-x: 0.424; scale-y: 0.412; }
        frame 8 { x: 460.6; y: 541.8; skew-x: 119.9; skew-y: 119.9; scale-x: 0.468; scale-y: 0.455; }
        frame 9 { x: 467.8; y: 543.6; skew-x: 135; skew-y: 135; scale-x: 0.513; scale-y: 0.499; }
        frame 10 { x: 475; y: 540.4; skew-x: 139.6; skew-y: 139.6; scale-x: 0.512; scale-y: 0.498; }
        frame 11 { x: 482.1; y: 537.1; skew-x: 144.3; skew-y: 144.3; scale-x: 0.513; scale-y: 0.499; }
        frame 12 { x: 490.5; y: 549.2; skew-x: 139.6; skew-y: 139.6; scale-x: 0.512; scale-y: 0.498; }
        frame 13 { x: 498.6; y: 561.4; skew-x: 134.7; skew-y: 134.7; scale-x: -10000; scale-y: -10000; }
        frame 14 { x: 498.2; y: 561.2; skew-x: -10000; skew-y: -10000; scale-x: 0.515; scale-y: 0.479; }
        frame 15 { x: 497.7; y: 561.1; scale-x: 0.52; scale-y: 0.461; }
        frame 16 { x: 498.1; y: 561.3; scale-x: 0.515; scale-y: 0.479; }
        frame 17 { x: 498.6; y: 561.4; scale-x: 0.512; scale-y: 0.498; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock5.3";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { x: 414.3; y: 554; scale-x: 0.202; scale-y: 0.202; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK5; }
        frame 2 { x: 411.8; y: -10000; skew-x: -14.7; skew-y: -14.7; scale-x: 0.325; scale-y: 0.325; cel: -10000; image: none; }
        frame 3 { x: 409; y: 554.9; skew-x: -29.9; skew-y: -29.9; scale-x: 0.449; scale-y: 0.449; }
        frame 4 { x: 407.8; y: 555.4; skew-x: -37.3; skew-y: -33.2; scale-x: 0.505; scale-y: 0.505; }
        frame 5 { x: 406.8; y: 556; skew-x: -44.9; skew-y: -36.7; scale-x: 0.562; scale-y: 0.562; }
        frame 6 { x: 404.1; y: 557; skew-x: -10000; skew-y: -10000; scale-x: 0.585; scale-y: 0.584; }
        frame 7 { x: 406.9; y: 546.1; skew-x: -26.4; skew-y: -18.2; scale-x: 0.639; scale-y: 0.639; }
        frame 8 { x: 410.4; y: 535.1; skew-x: -7.7; skew-y: 0.1; scale-x: 0.695; scale-y: 0.694; }
        frame 9 { x: 414.8; y: 524.4; skew-x: 10.5; skew-y: 18.8; scale-x: 0.75; scale-y: 0.749; }
        frame 10 { x: 416; y: 525.7; skew-x: 9.5; skew-y: 17.8; scale-x: 0.774; scale-y: 0.774; }
        frame 11 { x: 417.1; y: 527.1; skew-x: 8.6; skew-y: 16.8; scale-x: 0.799; scale-y: 0.799; }
        frame 12 { x: 418.2; y: 528.5; skew-x: 7.8; skew-y: 16; scale-x: 0.825; scale-y: 0.824; }
        frame 13 { x: 417; y: 532.8; skew-x: 4.5; skew-y: 13.3; scale-x: 0.85; scale-y: 0.806; }
        frame 14 { x: 416; y: 537; skew-x: 1.5; skew-y: 10.8; scale-x: 0.876; scale-y: 0.789; }
        frame 15 { x: 415.3; y: 541.3; skew-x: -1.5; skew-y: 8.4; scale-x: 0.902; scale-y: 0.772; }
        frame 16 { x: 415.8; y: 539.5; skew-x: -1.4; skew-y: 7.3; scale-x: 0.882; scale-y: 0.817; }
        frame 17 { x: 416.2; y: 537.6; skew-x: -1.5; skew-y: 6.5; scale-x: 0.862; scale-y: 0.862; }
        frame 18 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock5.4";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 410.6; y: 509; skew-x: -5.2; skew-y: -5.2; scale-x: 0.769; scale-y: 0.769; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK5; }
        frame 10 { x: 404.8; y: 509.6; skew-x: -28.4; skew-y: -28.4; scale-x: 0.768; scale-y: 0.768; cel: -10000; image: none; }
        frame 11 { x: 400.4; y: 510.5; skew-x: -51.8; skew-y: -51.8; scale-x: 0.767; scale-y: 0.767; }
        frame 12 { x: 397.4; y: 511.2; skew-x: -74.9; skew-y: -74.9; scale-x: 0.768; scale-y: 0.768; }
        frame 13 { x: 404.5; y: 533.6; skew-x: -124; skew-y: -124; scale-x: 0.865; scale-y: 0.865; }
        frame 14 { x: 414.6; y: 549.5; skew-x: -173.4; skew-y: -173.4; scale-x: 0.965; scale-y: 0.965; }
        frame 15 { x: 421; y: 558; skew-x: -222.6; skew-y: -222.6; scale-x: 1.063; scale-y: 1.063; }
        frame 16 { x: 420.8; y: -10000; skew-x: -223.5; skew-y: -225.4; scale-x: -10000; scale-y: 1.064; }
        frame 17 { x: 421; skew-x: -222.6; skew-y: -222.6; scale-y: 1.063; }
        frame 18 { x: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock6.2";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 398.2; y: 520.8; skew-x: -59.9; skew-y: -59.9; scale-x: 0.505; scale-y: 0.505; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK6; }
        frame 10 { x: 394; y: 509.7; skew-x: -99.4; skew-y: -99.4; scale-x: 0.646; scale-y: 0.556; cel: -10000; image: none; }
        frame 11 { x: 391.9; y: 496.1; skew-x: -139.3; skew-y: -139.3; scale-x: 0.787; scale-y: 0.607; }
        frame 12 { x: 389.5; y: 479.2; skew-x: -178.8; skew-y: -178.8; scale-x: 0.929; scale-y: 0.659; }
        frame 13 { x: 375.1; y: 529.2; skew-x: -178.9; skew-y: -178.9; scale-x: 0.99; scale-y: 0.8; }
        frame 14 { x: 360.6; y: 579.3; skew-x: -178.8; skew-y: -178.8; scale-x: 1.05; scale-y: 0.94; }
        frame 15 { x: 361.6; y: 580; skew-x: -10000; skew-y: -10000; scale-x: 1.182; scale-y: 0.839; }
        frame 16 { x: 361.2; y: 579.6; skew-x: -178.9; skew-y: -178.9; scale-x: 1.116; scale-y: 0.89; }
        frame 17 { x: 360.6; y: 579.3; skew-x: -178.8; skew-y: -178.8; scale-x: 1.05; scale-y: 0.94; }
        frame 18 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "rock5.5";
        frame-count: 25;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 8 { x: 430.9; y: 511.8; skew-x: 28.1; skew-y: 28.1; scale-x: 0.768; scale-y: 0.768; cel: 0; image: IMAGE_REANIM_ZOMBIE_HAND_ROCK5; }
        frame 9 { x: 439.1; y: 503.3; skew-x: 57.1; skew-y: 57.1; scale-x: 0.799; scale-y: 0.842; cel: -10000; image: none; }
        frame 10 { x: 447.1; y: 497.5; skew-x: 86.2; skew-y: 86.2; scale-x: 0.833; scale-y: 0.918; }
        frame 11 { x: 453.7; y: 494.1; skew-x: 115; skew-y: 115; scale-x: 0.866; scale-y: 0.994; }
        frame 12 { x: 455.3; y: 530; skew-x: 125.1; skew-y: 125.1; scale-x: 0.893; scale-y: 1.031; }
        frame 13 { x: 456.7; y: 566; skew-x: 135; skew-y: 135; scale-x: 0.922; scale-y: 1.072; }
        frame 14 { x: 457.4; y: 565.9; skew-x: 134.4; skew-y: 131.3; scale-x: 0.92; scale-y: 1.104; }
        frame 15 { x: 458.1; y: 565.8; skew-x: 133.6; skew-y: 127.5; scale-x: 0.921; scale-y: 1.14; }
        frame 16 { x: 456.7; y: 566; skew-x: 135; skew-y: 135; scale-x: 0.922; scale-y: 1.072; }
        frame 17 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
}
