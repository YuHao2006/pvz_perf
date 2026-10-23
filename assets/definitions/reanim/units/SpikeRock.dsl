export component SpikeRock {
    fps: 12;
    Track {
        source-name: "anim_blink";
        frame-count: 33;
        frame 3 { cel: -1; }
        frame 4 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { cel: 0; }
        frame 4 { cel: -10000; }
        frame 18 { cel: -1; }
        frame 19 { cel: -10000; }
    }
    Track {
        source-name: "anim_attack";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 18 { cel: 0; }
        frame 19 { cel: -10000; }
    }
    Track {
        source-name: "spike1";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 50.4; y: 39.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 50.3; y: 39.9; scale-x: 0.793; scale-y: 0.794; cel: -10000; image: none; }
        frame 5 { x: -10000; y: 40; scale-x: 0.785; scale-y: 0.787; }
        frame 6 { x: 50.4; y: 40.3; scale-x: 0.792; scale-y: 0.781; }
        frame 7 { x: -10000; y: 40.5; scale-x: 0.799; scale-y: 0.775; }
        frame 8 { x: 50.5; y: 40.9; scale-x: 0.806; scale-y: 0.769; }
        frame 9 { x: -10000; y: 41.1; scale-x: 0.813; scale-y: 0.762; }
        frame 10 { x: 50.6; y: 41.5; scale-x: 0.82; scale-y: 0.756; }
        frame 11 { x: -10000; y: -10000; scale-x: 0.817; scale-y: 0.735; }
        frame 12 { x: 50.5; y: 41.4; scale-x: 0.814; scale-y: 0.713; }
        frame 13 { x: -10000; y: 41; scale-x: 0.811; scale-y: 0.73; }
        frame 14 { y: 40.8; scale-x: 0.808; scale-y: 0.748; }
        frame 15 { y: 40.4; scale-x: 0.806; scale-y: 0.765; }
        frame 16 { x: 50.4; y: 40.1; scale-x: 0.803; scale-y: 0.783; }
        frame 17 { x: -10000; y: 39.8; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 38.6; scale-y: 0.829; }
        frame 20 { y: 37.5; scale-y: 0.857; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 23 { y: 33.3; scale-y: 1.025; }
        frame 24 { y: 34.9; scale-y: 0.969; }
        frame 25 { y: 36.5; scale-y: 0.912; }
        frame 26 { y: 38.1; scale-y: 0.856; }
        frame 27 { y: 39.8; scale-y: 0.8; }
        frame 28 { y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "spike7";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 59.1; y: 40.8; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 59; y: 40.4; scale-x: 0.793; scale-y: 0.794; cel: -10000; image: none; }
        frame 5 { x: -10000; y: 40; scale-x: 0.785; scale-y: 0.787; }
        frame 6 { x: 59.1; y: 40.3; scale-x: 0.792; scale-y: 0.781; }
        frame 7 { x: 59.2; y: 40.5; scale-x: 0.799; scale-y: 0.775; }
        frame 8 { x: 59.3; y: 40.9; scale-x: 0.806; scale-y: 0.769; }
        frame 9 { x: -10000; y: 41.1; scale-x: 0.813; scale-y: 0.762; }
        frame 10 { x: 59.4; y: 41.5; scale-x: 0.82; scale-y: 0.756; }
        frame 11 { x: -10000; y: -10000; scale-x: 0.817; scale-y: 0.735; }
        frame 12 { x: 59.3; y: 41.4; scale-x: 0.814; scale-y: 0.713; }
        frame 13 { x: -10000; y: 41; scale-x: 0.811; scale-y: 0.73; }
        frame 14 { x: 59.2; y: 40.8; scale-x: 0.808; scale-y: 0.748; }
        frame 15 { x: -10000; y: 40.4; scale-x: 0.806; scale-y: 0.765; }
        frame 16 { x: 59.1; y: 40.1; scale-x: 0.803; scale-y: 0.783; }
        frame 17 { x: -10000; y: 39.8; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 39.2; scale-y: 0.829; }
        frame 20 { y: 38.7; scale-y: 0.857; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 23 { y: 29.6; scale-y: 1.309; }
        frame 24 { y: 32.5; scale-y: 1.182; }
        frame 25 { y: 35.3; scale-y: 1.054; }
        frame 26 { y: 38.1; scale-y: 0.927; }
        frame 27 { y: 41; scale-y: 0.8; }
        frame 28 { y: 41.6; scale-y: -10000; }
        frame 29 { y: 42.3; }
        frame 30 { y: 41.9; }
        frame 31 { y: 41.4; }
        frame 32 { y: 41; }
    }
    Track {
        source-name: "spike8";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 6.6; y: 41; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 7.3; y: 40.5; scale-x: 0.793; scale-y: 0.794; cel: -10000; image: none; }
        frame 5 { x: 8; y: 40; scale-x: 0.785; scale-y: 0.787; }
        frame 6 { x: 7.8; y: 40.3; scale-x: 0.792; scale-y: 0.781; }
        frame 7 { x: 7.5; y: 40.5; scale-x: 0.799; scale-y: 0.775; }
        frame 8 { x: 7.2; y: 40.9; scale-x: 0.806; scale-y: 0.769; }
        frame 9 { x: 6.9; y: 41.1; scale-x: 0.813; scale-y: 0.762; }
        frame 10 { x: 6.6; y: 41.5; scale-x: 0.82; scale-y: 0.756; }
        frame 11 { x: 6.7; y: 42; scale-x: 0.817; scale-y: 0.735; }
        frame 12 { x: 6.8; y: 42.4; scale-x: 0.814; scale-y: 0.713; }
        frame 13 { x: -10000; y: 42.1; scale-x: 0.811; scale-y: 0.73; }
        frame 14 { x: 6.7; y: 41.8; scale-x: 0.808; scale-y: 0.748; }
        frame 15 { x: -10000; y: 41.5; scale-x: 0.806; scale-y: 0.765; }
        frame 16 { y: 41.3; scale-x: 0.803; scale-y: 0.783; }
        frame 17 { x: 6.6; y: 41; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 6.8; y: 39.9; scale-y: 0.829; }
        frame 20 { x: 7.1; y: 38.7; scale-y: 0.857; }
        frame 21 { x: -10000; y: -10000; scale-y: -10000; }
        frame 23 { x: 7.3; y: 30.1; scale-y: 1.309; }
        frame 24 { x: 7.2; y: 32.9; scale-y: 1.182; }
        frame 25 { x: 7; y: 35.5; scale-y: 1.054; }
        frame 26 { x: 6.8; y: 38.3; scale-y: 0.927; }
        frame 27 { x: 6.6; y: 41; scale-y: 0.8; }
        frame 28 { x: -10000; y: 41.6; scale-y: -10000; }
        frame 29 { y: 42.3; }
        frame 30 { y: 41.9; }
        frame 31 { y: 41.4; }
        frame 32 { y: 41; }
    }
    Track {
        source-name: "spike2";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 42; y: 39; scale-x: 0.8; scale-y: 0.683; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: -10000; y: 38.3; scale-x: 0.793; scale-y: 0.687; cel: -10000; image: none; }
        frame 5 { y: 37.6; scale-x: 0.786; scale-y: 0.691; }
        frame 6 { y: 38.3; scale-x: 0.793; scale-y: 0.682; }
        frame 7 { y: 38.9; scale-x: 0.799; scale-y: 0.673; }
        frame 8 { y: 39.5; scale-x: 0.806; scale-y: 0.663; }
        frame 9 { x: 42; y: 40.1; scale-x: 0.813; scale-y: 0.654; }
        frame 10 { x: -10000; y: 40.8; scale-x: 0.82; scale-y: 0.645; }
        frame 11 { x: 42; y: -10000; scale-x: 0.817; scale-y: 0.651; }
        frame 12 { x: -10000; scale-x: 0.814; scale-y: 0.656; }
        frame 13 { x: 42; y: 40.5; scale-x: 0.811; scale-y: 0.661; }
        frame 14 { y: 40; scale-x: 0.808; scale-y: 0.667; }
        frame 15 { x: -10000; y: 39.8; scale-x: 0.806; scale-y: 0.672; }
        frame 16 { y: 39.5; scale-x: 0.803; scale-y: 0.677; }
        frame 17 { y: 39; scale-x: 0.8; scale-y: 0.683; }
        frame 18 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 37.9; scale-y: 0.707; }
        frame 20 { y: 36.6; scale-y: 0.731; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 24 { y: 37.3; scale-y: 0.719; }
        frame 25 { y: 37.9; scale-y: 0.707; }
        frame 26 { y: 38.5; scale-y: 0.695; }
        frame 27 { y: 39; scale-y: 0.683; }
        frame 28 { y: 34; scale-y: 0.87; }
        frame 29 { y: 29.2; scale-y: 1.058; }
        frame 30 { y: 32.4; scale-y: 0.933; }
        frame 31 { y: 35.8; scale-y: 0.808; }
        frame 32 { y: 39; scale-y: 0.683; }
    }
    Track {
        source-name: "spike3";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 32.8; y: 37.3; scale-x: 0.944; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 32.9; y: 36.8; scale-x: 0.936; scale-y: 0.805; cel: -10000; image: none; }
        frame 5 { x: 33; y: 36.4; scale-x: 0.927; scale-y: 0.81; }
        frame 6 { x: 32.9; y: 36.9; scale-x: 0.935; scale-y: 0.799; }
        frame 7 { x: 32.8; y: 37.5; scale-x: 0.943; scale-y: 0.788; }
        frame 8 { x: -10000; y: 38; scale-x: 0.951; scale-y: 0.778; }
        frame 9 { x: 32.7; y: 38.6; scale-x: 0.959; scale-y: 0.767; }
        frame 10 { x: 32.6; y: 39.1; scale-x: 0.967; scale-y: 0.756; }
        frame 11 { x: -10000; y: 38.9; scale-x: 0.964; scale-y: 0.762; }
        frame 12 { y: 38.6; scale-x: 0.96; scale-y: 0.769; }
        frame 13 { x: 32.7; y: 38.3; scale-x: 0.957; scale-y: 0.775; }
        frame 14 { x: 32.8; y: 38; scale-x: 0.954; scale-y: 0.781; }
        frame 15 { x: -10000; y: 37.8; scale-x: 0.95; scale-y: 0.787; }
        frame 16 { x: 32.9; y: 37.5; scale-x: 0.947; scale-y: 0.794; }
        frame 17 { x: 32.8; y: 37.3; scale-x: 0.944; scale-y: 0.8; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 36; scale-y: 0.829; }
        frame 20 { y: 34.8; scale-y: 0.857; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 23 { y: 29; scale-y: 1.159; }
        frame 24 { y: 31.1; scale-y: 1.069; }
        frame 25 { y: 33.1; scale-y: 0.979; }
        frame 26 { y: 35.2; scale-y: 0.89; }
        frame 27 { y: 37.3; scale-y: 0.8; }
        frame 28 { y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "spike4";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 23.7; y: 39.4; scale-x: 0.862; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 23.9; y: 39.5; scale-x: 0.855; scale-y: 0.794; cel: -10000; image: none; }
        frame 5 { x: 24.1; y: -10000; scale-x: 0.847; scale-y: 0.787; }
        frame 6 { x: 23.9; y: 39.9; scale-x: 0.854; scale-y: 0.781; }
        frame 7 { x: 23.7; y: 40.2; scale-x: 0.861; scale-y: 0.775; }
        frame 8 { x: 23.6; y: 40.5; scale-x: 0.869; scale-y: 0.769; }
        frame 9 { x: 23.4; y: 40.8; scale-x: 0.876; scale-y: 0.762; }
        frame 10 { x: 23.3; y: 41.1; scale-x: 0.884; scale-y: 0.756; }
        frame 11 { x: 23.4; y: -10000; scale-x: 0.881; scale-y: 0.735; }
        frame 12 { x: -10000; y: 41.3; scale-x: 0.878; scale-y: 0.713; }
        frame 13 { x: 23.5; y: 40.9; scale-x: 0.875; scale-y: 0.73; }
        frame 14 { x: 23.6; y: 40.5; scale-x: 0.872; scale-y: 0.748; }
        frame 15 { x: -10000; y: 40.1; scale-x: 0.869; scale-y: 0.765; }
        frame 16 { x: 23.7; y: 39.8; scale-x: 0.866; scale-y: 0.783; }
        frame 17 { x: -10000; y: 39.4; scale-x: 0.862; scale-y: 0.8; }
        frame 18 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 38.1; scale-y: 0.829; }
        frame 20 { y: 37; scale-y: 0.857; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 24 { y: 37.6; scale-y: 0.843; }
        frame 25 { y: 38.2; scale-y: 0.829; }
        frame 26 { y: 38.8; scale-y: 0.814; }
        frame 27 { y: 39.4; scale-y: 0.8; }
        frame 28 { y: 33.8; scale-y: 1.019; }
        frame 29 { y: 28.3; scale-y: 1.237; }
        frame 30 { y: 32; scale-y: 1.091; }
        frame 31 { y: 35.7; scale-y: 0.946; }
        frame 32 { y: 39.4; scale-y: 0.8; }
    }
    Track {
        source-name: "spike5";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 15; y: 40; scale-x: 0.862; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 15.2; y: 39.7; scale-x: 0.855; scale-y: 0.805; cel: -10000; image: none; }
        frame 5 { x: 15.4; y: 39.4; scale-x: 0.847; scale-y: 0.81; }
        frame 6 { x: 15.2; y: 39.8; scale-x: 0.855; scale-y: 0.799; }
        frame 7 { x: 15; y: 40.3; scale-x: 0.862; scale-y: 0.788; }
        frame 8 { x: 14.8; y: 40.7; scale-x: 0.869; scale-y: 0.778; }
        frame 9 { x: 14.6; y: 41.1; scale-x: 0.876; scale-y: 0.767; }
        frame 10 { x: 14.4; y: 41.6; scale-x: 0.884; scale-y: 0.756; }
        frame 11 { x: 14.5; y: 41.5; scale-x: 0.881; scale-y: 0.762; }
        frame 12 { x: 14.6; y: 41.2; scale-x: 0.878; scale-y: 0.769; }
        frame 13 { x: -10000; y: 41; scale-x: 0.875; scale-y: 0.775; }
        frame 14 { x: 14.7; y: 40.6; scale-x: 0.872; scale-y: 0.781; }
        frame 15 { x: 14.8; y: 40.4; scale-x: 0.869; scale-y: 0.787; }
        frame 16 { x: 14.9; y: 40.2; scale-x: 0.866; scale-y: 0.794; }
        frame 17 { x: 15; y: 40; scale-x: 0.862; scale-y: 0.8; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 38.9; scale-y: 0.829; }
        frame 20 { y: 37.6; scale-y: 0.857; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 24 { y: 38.1; scale-y: 0.843; }
        frame 25 { y: 38.8; scale-y: 0.829; }
        frame 26 { y: 39.3; scale-y: 0.814; }
        frame 27 { y: 40; scale-y: 0.8; }
        frame 28 { y: 35.8; scale-y: 0.959; }
        frame 29 { y: 31.6; scale-y: 1.119; }
        frame 30 { y: 34.4; scale-y: 1.013; }
        frame 31 { y: 37.1; scale-y: 0.906; }
        frame 32 { y: 40; scale-y: 0.8; }
    }
    Track {
        source-name: "spike9";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 0.3; y: 44.1; scale-x: 0.755; scale-y: 0.635; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 0.5; y: 44.2; scale-x: 0.752; scale-y: 0.63; cel: -10000; image: none; }
        frame 5 { x: 0.7; y: 44.3; scale-x: 0.748; scale-y: 0.625; }
        frame 6 { x: 0.4; y: 44.5; scale-x: 0.753; scale-y: 0.62; }
        frame 7 { x: 0.1; y: 44.8; scale-x: 0.758; scale-y: 0.615; }
        frame 8 { x: 0; y: 45.1; scale-x: 0.763; scale-y: 0.61; }
        frame 9 { x: -0.2; y: 45.4; scale-x: 0.768; scale-y: 0.605; }
        frame 10 { x: -0.5; y: 45.6; scale-x: 0.773; scale-y: 0.6; }
        frame 11 { x: -0.3; y: 45.7; scale-x: 0.771; scale-y: 0.583; }
        frame 12 { x: -0.2; y: 45.8; scale-x: 0.768; scale-y: 0.566; }
        frame 13 { x: -0.1; y: 45.4; scale-x: 0.765; scale-y: 0.579; }
        frame 14 { x: 0; y: 45.1; scale-x: 0.763; scale-y: 0.593; }
        frame 15 { x: 0.1; y: 44.8; scale-x: 0.76; scale-y: 0.607; }
        frame 16 { x: 0.2; y: 44.5; scale-x: 0.757; scale-y: 0.621; }
        frame 17 { x: 0.3; y: 44.1; scale-x: 0.755; scale-y: 0.635; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 43.1; scale-y: 0.657; }
        frame 20 { y: 42.1; scale-y: 0.68; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 23 { y: 35.1; scale-y: 1.026; }
        frame 24 { y: 37.4; scale-y: 0.928; }
        frame 25 { y: 39.6; scale-y: 0.831; }
        frame 26 { y: 42; scale-y: 0.733; }
        frame 27 { y: 44.1; scale-y: 0.635; }
        frame 28 { y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "spike6";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 67; y: 44.9; scale-x: 0.755; scale-y: 0.635; cel: 0; image: IMAGE_REANIM_SPIKEROCK_SPIKE; }
        frame 4 { x: 66.8; y: 45; scale-x: 0.752; scale-y: 0.63; cel: -10000; image: none; }
        frame 5 { x: 66.7; y: -10000; scale-x: 0.748; scale-y: 0.625; }
        frame 6 { x: 66.8; y: 45.3; scale-x: 0.753; scale-y: 0.62; }
        frame 7 { x: 67.1; y: 45.5; scale-x: 0.758; scale-y: 0.615; }
        frame 8 { x: 67.2; y: 45.8; scale-x: 0.763; scale-y: 0.61; }
        frame 9 { x: 67.5; y: 46; scale-x: 0.768; scale-y: 0.605; }
        frame 10 { x: 67.6; y: 46.3; scale-x: 0.773; scale-y: 0.6; }
        frame 11 { x: 67.5; y: 46; scale-x: 0.771; scale-y: 0.583; }
        frame 12 { x: 67.4; y: 45.5; scale-x: 0.768; scale-y: 0.566; }
        frame 13 { x: 67.3; y: 45.4; scale-x: 0.765; scale-y: 0.579; }
        frame 14 { x: -10000; y: 45.3; scale-x: 0.763; scale-y: 0.593; }
        frame 15 { x: 67.1; y: 45.1; scale-x: 0.76; scale-y: 0.607; }
        frame 16 { x: 67; y: 45; scale-x: 0.757; scale-y: 0.621; }
        frame 17 { y: 44.9; scale-x: 0.755; scale-y: 0.635; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 43.9; scale-y: 0.657; }
        frame 20 { y: 42.9; scale-y: 0.68; }
        frame 21 { y: -10000; scale-y: -10000; }
        frame 24 { y: 43.4; scale-y: 0.669; }
        frame 25 { y: 43.9; scale-y: 0.657; }
        frame 26 { y: 44.4; scale-y: 0.646; }
        frame 27 { y: 44.9; scale-y: 0.635; }
        frame 28 { x: 67; y: 40.1; scale-y: 0.841; }
        frame 29 { y: 35.4; scale-y: 1.047; }
        frame 30 { x: -10000; y: 38.5; scale-y: 0.91; }
        frame 31 { x: 66.9; y: 41.6; scale-y: 0.772; }
        frame 32 { x: 67; y: 44.9; scale-y: 0.635; }
    }
    Track {
        source-name: "anim_face";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: -0.4; y: 40; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SPIKEROCK_BODY; }
        frame 4 { x: -0; y: 39.9; scale-x: 0.793; scale-y: 0.805; cel: -10000; image: none; }
        frame 5 { x: 0.2; y: 39.6; scale-x: 0.786; scale-y: 0.81; }
        frame 6 { x: -0; y: 40; scale-x: 0.793; scale-y: 0.799; }
        frame 7 { x: -0.3; y: 40.5; scale-x: 0.799; scale-y: 0.788; }
        frame 8 { x: -0.7; y: 40.9; scale-x: 0.806; scale-y: 0.778; }
        frame 9 { x: -1; y: 41.3; scale-x: 0.813; scale-y: 0.767; }
        frame 10 { x: -1.4; y: 41.8; scale-x: 0.82; scale-y: 0.756; }
        frame 11 { x: -1.3; y: 41.5; scale-x: 0.817; scale-y: 0.762; }
        frame 12 { x: -1.1; y: 41.3; scale-x: 0.814; scale-y: 0.769; }
        frame 13 { x: -1; y: 41; scale-x: 0.811; scale-y: 0.775; }
        frame 14 { x: -0.8; y: 40.8; scale-x: 0.808; scale-y: 0.781; }
        frame 15 { x: -0.7; y: 40.6; scale-x: 0.806; scale-y: 0.787; }
        frame 16 { x: -0.5; y: 40.4; scale-x: 0.803; scale-y: 0.794; }
        frame 17 { x: -0.4; y: 40; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 39; scale-y: 0.829; }
        frame 20 { y: 37.7; scale-y: 0.857; }
        frame 21 { x: -1; y: 41.4; scale-x: 0.812; scale-y: 0.754; }
        frame 22 { x: -1.6; y: 45.1; scale-x: 0.824; scale-y: 0.651; }
        frame 23 { x: -1.4; y: 44.3; scale-x: 0.82; scale-y: 0.676; }
        frame 24 { x: -1.2; y: 43.5; scale-x: 0.816; scale-y: 0.701; }
        frame 25 { x: -1; y: 42.4; scale-x: 0.811; scale-y: 0.734; }
        frame 26 { x: -0.7; y: 41.3; scale-x: 0.805; scale-y: 0.767; }
        frame 27 { x: -0.4; y: 40; scale-x: 0.8; scale-y: 0.8; }
        frame 28 { x: -1; y: 42.6; scale-x: 0.812; scale-y: 0.726; }
        frame 29 { x: -1.6; y: 45.1; scale-x: 0.824; scale-y: 0.651; }
        frame 30 { x: -1.2; y: 43.5; scale-x: 0.816; scale-y: 0.701; }
        frame 31 { x: -0.8; y: 41.8; scale-x: 0.808; scale-y: 0.75; }
        frame 32 { x: -0.4; y: 40; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "bigspike1";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 8.1; y: 29.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SPIKEROCK_BIGSPIKE1; }
        frame 4 { x: 8.4; y: 28.7; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 5 { x: 8.6; y: 28.3; }
        frame 6 { x: 8.4; y: 28.7; }
        frame 7 { x: 8.2; y: 29.1; }
        frame 8 { x: 8; y: 29.5; }
        frame 9 { x: 7.8; y: 29.9; }
        frame 10 { x: 7.6; y: 30.3; }
        frame 11 { x: 7.2; y: 31; scale-x: 0.842; scale-y: 0.789; }
        frame 12 { x: 6.8; y: 31.6; scale-x: 0.885; scale-y: 0.779; }
        frame 13 { x: 7.1; y: 31; scale-x: 0.868; scale-y: 0.783; }
        frame 14 { x: 7.4; y: 30.6; scale-x: 0.851; scale-y: 0.787; }
        frame 15 { x: 7.6; y: 30; scale-x: 0.834; scale-y: 0.792; }
        frame 16 { x: 7.8; y: 29.6; scale-x: 0.817; scale-y: 0.796; }
        frame 17 { x: 8.1; y: 29.1; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 27.7; }
        frame 20 { y: 26.3; }
        frame 21 { y: 28.8; }
        frame 22 { y: 31.3; }
        frame 23 { y: -10000; }
        frame 24 { y: 26.3; scale-y: 0.939; }
        frame 25 { y: 27.2; scale-y: 0.893; }
        frame 26 { x: 8.2; y: 28.2; scale-y: 0.846; }
        frame 27 { x: 8.1; y: 29.1; scale-y: 0.8; }
        frame 28 { x: -10000; y: -10000; scale-y: -10000; }
        frame 29 { y: 24.1; scale-y: 1.016; }
        frame 30 { y: 25.8; scale-y: 0.944; }
        frame 31 { x: 8.2; y: 27.5; scale-y: 0.872; }
        frame 32 { x: 8.1; y: 29.1; scale-y: 0.8; }
    }
    Track {
        source-name: "bigspike2";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 33; y: 33.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SPIKEROCK_BIGSPIKE2; }
        frame 4 { x: -10000; y: 32.9; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 5 { y: 32.4; }
        frame 6 { y: 32.6; }
        frame 7 { y: 32.8; }
        frame 8 { y: 33; }
        frame 9 { y: 33.2; }
        frame 10 { y: 33.4; }
        frame 11 { x: 32.8; y: 34; scale-x: 0.825; scale-y: 0.793; }
        frame 12 { x: 32.5; y: 34.6; scale-x: 0.851; scale-y: 0.787; }
        frame 13 { x: -10000; y: 34.4; scale-x: 0.84; scale-y: 0.789; }
        frame 14 { x: 32.7; y: 34.2; scale-x: 0.83; scale-y: 0.792; }
        frame 15 { x: 32.8; y: 33.9; scale-x: 0.82; scale-y: 0.795; }
        frame 16 { x: 32.9; y: 33.6; scale-x: 0.81; scale-y: 0.797; }
        frame 17 { x: 33; y: 33.4; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 32; }
        frame 20 { y: 30.7; }
        frame 21 { y: 33.4; }
        frame 22 { y: 36.1; }
        frame 23 { y: -10000; }
        frame 24 { y: 29.9; scale-y: 0.974; }
        frame 25 { y: 31; scale-y: 0.916; }
        frame 26 { y: 32.2; scale-y: 0.858; }
        frame 27 { y: 33.4; scale-y: 0.8; }
        frame 28 { y: -10000; scale-y: -10000; }
        frame 29 { y: 27.9; scale-y: 1.044; }
        frame 30 { y: 29.7; scale-y: 0.963; }
        frame 31 { y: 31.5; scale-y: 0.881; }
        frame 32 { y: 33.4; scale-y: 0.8; }
    }
    Track {
        source-name: "bigspike3";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 56.8; y: 29.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SPIKEROCK_BIGSPIKE3; }
        frame 4 { x: 56.5; y: 28.8; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 5 { x: 56.3; y: 28.4; }
        frame 6 { x: 56.6; y: 28.6; }
        frame 7 { x: 56.9; y: 28.9; }
        frame 8 { x: 57.2; y: 29.1; }
        frame 9 { x: 57.5; y: 29.4; }
        frame 10 { x: 57.8; y: 29.6; }
        frame 11 { x: 57.6; y: 30.4; scale-x: 0.822; scale-y: 0.785; }
        frame 12 { x: 57.3; y: 31.1; scale-x: 0.844; scale-y: 0.77; }
        frame 13 { x: 57.2; y: 30.7; scale-x: 0.835; scale-y: 0.776; }
        frame 14 { x: 57; y: 30.3; scale-x: 0.826; scale-y: 0.782; }
        frame 15 { y: 30; scale-x: 0.817; scale-y: 0.788; }
        frame 16 { x: 56.9; y: 29.6; scale-x: 0.809; scale-y: 0.794; }
        frame 17 { x: 56.8; y: 29.1; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { y: 27.8; }
        frame 20 { y: 26.4; }
        frame 21 { y: 29.4; }
        frame 22 { y: 32.4; }
        frame 23 { y: -10000; }
        frame 24 { y: 26.9; scale-y: 0.968; }
        frame 25 { y: 27.6; scale-y: 0.912; }
        frame 26 { y: 28.3; scale-y: 0.856; }
        frame 27 { y: 29.1; scale-y: 0.8; }
        frame 28 { y: -10000; scale-y: -10000; }
        frame 29 { y: 24.9; scale-y: 1.042; }
        frame 30 { y: 26.3; scale-y: 0.961; }
        frame 31 { y: 27.7; scale-y: 0.881; }
        frame 32 { y: 29.1; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_eye_leftbrow";
        frame-count: 33;
        frame 0 { x: 17.1; y: 49.3; skew-x: 354.5; skew-y: 354.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_SPIKEROCK_EYEBROW; }
        frame 1 { x: 16.3; y: 51; skew-x: 357.7; skew-y: 357.7; scale-x: 0.883; scale-y: 0.737; image: none; }
        frame 2 { x: 17.1; y: 49.3; skew-x: 354.5; skew-y: 354.5; scale-x: 0.8; scale-y: 0.8; }
        frame 3 { x: 18.8; y: 45.5; skew-x: 369.5; skew-y: 369.5; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: -10000; y: 45.1; skew-x: 368; skew-y: 367.8; scale-x: 0.792; scale-y: 0.804; }
        frame 5 { x: 18.9; y: 44.8; skew-x: 366.6; skew-y: 366.2; scale-x: 0.785; scale-y: 0.808; }
        frame 6 { x: 18.8; y: 45.3; skew-x: 367; skew-y: 367; scale-x: 0.791; scale-y: 0.798; }
        frame 7 { x: -10000; y: 45.9; skew-x: 367.3; skew-y: 367.8; scale-x: 0.798; scale-y: 0.788; }
        frame 8 { x: 18.6; y: 46.4; skew-x: 367.8; skew-y: 368.5; scale-x: 0.804; scale-y: 0.777; }
        frame 9 { x: 18.5; y: 46.9; skew-x: 368.3; skew-y: 369.3; scale-x: 0.811; scale-y: 0.767; }
        frame 10 { x: 18.3; y: 47.5; skew-x: 368.8; skew-y: 370.3; scale-x: 0.817; scale-y: 0.758; }
        frame 11 { x: 18.1; y: 47.6; skew-x: 367; skew-y: 368.3; scale-x: 0.814; scale-y: 0.763; }
        frame 12 { x: 17.8; y: 47.7; skew-x: 365.3; skew-y: 366.5; scale-x: 0.812; scale-y: 0.769; }
        frame 13 { x: 18.1; y: 47.3; skew-x: 366; skew-y: 367; scale-x: 0.809; scale-y: 0.775; }
        frame 14 { x: 18.2; y: 47; skew-x: 366.8; skew-y: 367.6; scale-x: 0.806; scale-y: 0.781; }
        frame 15 { x: 18.4; y: 46.5; skew-x: 367.8; skew-y: 368.3; scale-x: 0.804; scale-y: 0.787; }
        frame 16 { x: 18.6; y: 46; skew-x: 368.5; skew-y: 368.8; scale-x: 0.802; scale-y: 0.793; }
        frame 17 { x: 18.8; y: 45.5; skew-x: 369.5; skew-y: 369.5; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 17.8; y: 45.3; skew-x: 362.3; skew-y: 361.6; scale-y: 0.827; }
        frame 20 { x: 16.9; y: 45.1; skew-x: 355.2; skew-y: 353.9; scale-x: 0.801; scale-y: 0.855; }
        frame 21 { x: 17.8; y: 46.6; skew-x: 362.3; skew-y: 361.6; scale-x: 0.8; scale-y: 0.827; }
        frame 22 { x: 18.8; y: 48; skew-x: 369.5; skew-y: 369.5; scale-x: -10000; scale-y: 0.8; }
        frame 23 { x: -10000; y: 47.6; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { y: 47.2; scale-x: -10000; scale-y: -10000; }
        frame 25 { y: 46.7; }
        frame 26 { x: 18.9; y: 46.1; }
        frame 27 { x: 18.8; y: 45.5; scale-x: 0.8; scale-y: 0.8; }
        frame 28 { x: -10000; y: 46.9; scale-x: 0.799; scale-y: 0.799; }
        frame 29 { y: 48; scale-x: 0.8; scale-y: 0.8; }
        frame 30 { y: 47.2; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { y: 46.4; scale-x: -10000; scale-y: -10000; }
        frame 32 { y: 45.5; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "anim_eye_rightbrow";
        frame-count: 33;
        frame 0 { x: 63; y: 48.6; skew-x: 180; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_SPIKEROCK_EYEBROW; }
        frame 1 { x: 63.7; y: 50.9; skew-x: 177.2; skew-y: -2.7; scale-x: 0.884; scale-y: 0.737; image: none; }
        frame 2 { x: 63; y: 48.6; skew-x: 180; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 3 { x: 61.1; y: 45.1; skew-x: 165; skew-y: -14.9; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 61.5; y: 45; skew-x: 168.7; skew-y: -11.2; scale-x: 0.792; scale-y: 0.804; }
        frame 5 { x: 61.8; y: 44.9; skew-x: 172; skew-y: -7.8; scale-x: 0.784; scale-y: 0.809; }
        frame 6 { x: -10000; y: 45.4; skew-x: 171; skew-y: -9.4; scale-x: 0.79; scale-y: 0.798; }
        frame 7 { x: 61.7; y: 45.7; skew-x: 169.7; skew-y: -11; scale-x: 0.796; scale-y: 0.789; }
        frame 8 { x: 61.6; y: 46.1; skew-x: 168.5; skew-y: -12.7; scale-x: 0.802; scale-y: 0.779; }
        frame 9 { x: -10000; y: 46.6; skew-x: 167.4; skew-y: -14.4; scale-x: 0.809; scale-y: 0.77; }
        frame 10 { y: 47; skew-x: 166.1; skew-y: -16.1; scale-x: 0.815; scale-y: 0.761; }
        frame 11 { x: 61.9; y: 47.1; skew-x: 167.9; skew-y: -14; scale-x: 0.812; scale-y: 0.765; }
        frame 12 { x: 62; y: 47.3; skew-x: 169.4; skew-y: -12.2; scale-x: 0.81; scale-y: 0.771; }
        frame 13 { x: 61.9; y: 46.9; skew-x: 168.7; skew-y: -12.7; scale-x: 0.807; scale-y: 0.776; }
        frame 14 { x: 61.6; y: 46.4; skew-x: 167.7; skew-y: -13.2; scale-x: 0.805; scale-y: 0.782; }
        frame 15 { x: 61.5; y: 46; skew-x: 166.9; skew-y: -13.7; scale-x: 0.803; scale-y: 0.788; }
        frame 16 { x: 61.3; y: 45.5; skew-x: 166; skew-y: -14.2; scale-x: 0.801; scale-y: 0.793; }
        frame 17 { x: 61.1; y: 45.1; skew-x: 165; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 62.2; y: 44.5; skew-x: 172; skew-y: -6.9; scale-x: 0.802; scale-y: 0.826; }
        frame 20 { x: 63.3; y: 43.7; skew-x: 179; skew-y: 1; scale-x: 0.804; scale-y: 0.854; }
        frame 21 { x: 62.2; y: 45.6; skew-x: 172; skew-y: -6.9; scale-x: 0.802; scale-y: 0.826; }
        frame 22 { x: 61.1; y: 47.6; skew-x: 165; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
        frame 23 { x: -10000; y: 47.2; skew-x: 165.2; skew-y: -14.7; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { y: 46.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { y: 46.3; }
        frame 26 { y: 45.7; }
        frame 27 { y: 45.1; skew-x: 165; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
        frame 28 { y: 46.4; skew-x: 165.2; skew-y: -14.7; scale-x: 0.799; scale-y: 0.799; }
        frame 29 { y: 47.6; skew-x: 165; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
        frame 30 { y: 46.8; skew-x: 165.2; skew-y: -14.7; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { y: 46; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 32 { y: 45.1; skew-x: 165; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "mouth";
        frame-count: 33;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 3 { x: 28.3; y: 56.4; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_SPIKEROCK_MOUTH; }
        frame 4 { x: 28.6; y: 55.9; scale-x: 0.776; scale-y: 0.823; cel: -10000; image: none; }
        frame 5 { x: 29; y: 55.5; scale-x: 0.752; scale-y: 0.847; }
        frame 6 { x: 28.7; y: 55.6; scale-x: 0.766; scale-y: 0.835; }
        frame 7 { x: 28.6; y: 56; scale-x: 0.779; scale-y: 0.823; }
        frame 8 { x: 28.4; y: 56.2; scale-x: 0.793; scale-y: 0.811; }
        frame 9 { x: 28.2; y: 56.4; scale-x: 0.806; scale-y: 0.799; }
        frame 10 { x: 28; y: 56.5; scale-x: 0.82; scale-y: 0.787; }
        frame 11 { x: 27.9; y: 56.8; scale-x: 0.826; scale-y: 0.776; }
        frame 12 { x: 27.8; y: 56.9; scale-x: 0.833; scale-y: 0.766; }
        frame 13 { x: 27.9; y: 56.8; scale-x: 0.826; scale-y: 0.773; }
        frame 14 { x: 28; y: 56.6; scale-x: 0.82; scale-y: 0.78; }
        frame 15 { y: 56.5; scale-x: 0.813; scale-y: 0.786; }
        frame 16 { x: 28.1; y: 56.4; scale-x: 0.807; scale-y: 0.793; }
        frame 17 { x: 28.3; y: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 18 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 27.9; y: 56.7; scale-x: 0.826; scale-y: 0.784; }
        frame 20 { x: 27.5; y: 57; scale-x: 0.852; scale-y: 0.769; }
        frame 21 { x: 28.4; y: 55.3; scale-x: 0.791; scale-y: 0.849; }
        frame 22 { x: 29.3; y: 53.8; scale-x: 0.731; scale-y: 0.93; }
        frame 23 { x: 29.1; y: 54.2; scale-x: 0.743; scale-y: 0.908; }
        frame 24 { x: 28.9; y: 54.6; scale-x: 0.754; scale-y: 0.887; }
        frame 25 { x: 28.7; y: 55.2; scale-x: 0.769; scale-y: 0.858; }
        frame 26 { x: 28.4; y: 55.9; scale-x: 0.785; scale-y: 0.829; }
        frame 27 { x: 28.3; y: 56.4; scale-x: 0.8; scale-y: 0.8; }
        frame 28 { x: 28.8; y: 55; scale-x: 0.766; scale-y: 0.865; }
        frame 29 { x: 29.3; y: 53.8; scale-x: 0.731; scale-y: 0.93; }
        frame 30 { x: 28.9; y: 54.6; scale-x: 0.754; scale-y: 0.887; }
        frame 31 { x: 28.6; y: 55.5; scale-x: 0.777; scale-y: 0.843; }
        frame 32 { x: 28.3; y: 56.4; scale-x: 0.8; scale-y: 0.8; }
    }
}
