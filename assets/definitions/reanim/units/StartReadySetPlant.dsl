export component StartReadySetPlant {
    fps: 12;
    Track {
        source-name: "Plant";
        frame-count: 22;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 12 { x: -192.9; y: -91.4; scale-x: 1.3; scale-y: 1.3; cel: 0; image: IMAGE_REANIM_STARTPLANT; }
        frame 13 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
    }
    Track {
        source-name: "Set";
        frame-count: 22;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 6 { x: -150.3; y: -63.3; cel: 0; image: IMAGE_REANIM_STARTSET; }
        frame 7 { x: -153.3; y: -64.9; scale-x: 1.02; scale-y: 1.02; cel: -10000; image: none; }
        frame 8 { x: -156.3; y: -66.6; scale-x: 1.04; scale-y: 1.04; }
        frame 9 { x: -159.3; y: -68.3; scale-x: 1.06; scale-y: 1.06; }
        frame 10 { x: -162.3; y: -70; scale-x: 1.08; scale-y: 1.08; }
        frame 11 { x: -165.4; y: -71.6; scale-x: 1.1; scale-y: 1.1; }
        frame 12 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 13 { cel: -10000; }
    }
    Track {
        source-name: "Ready";
        frame-count: 22;
        frame 0 { x: -147.2; y: -63.7; image: IMAGE_REANIM_STARTREADY; }
        frame 1 { x: -150.1; y: -65.4; scale-x: 1.02; scale-y: 1.02; image: none; }
        frame 2 { x: -153.1; y: -67; scale-x: 1.04; scale-y: 1.04; }
        frame 3 { x: -156; y: -68.7; scale-x: 1.06; scale-y: 1.06; }
        frame 4 { x: -159; y: -70.4; scale-x: 1.08; scale-y: 1.08; }
        frame 5 { x: -161.9; y: -72.1; scale-x: 1.1; scale-y: 1.1; }
        frame 6 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 7 { cel: -10000; }
    }
}
