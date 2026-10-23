export component LilyPad {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 4;
        frame 0 { x: -0.2; y: 5.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_LILYPAD_BODY; }
        frame 1 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; image: none; }
        frame 2 { cel: -10000; }
    }
    Track {
        source-name: "anim_blink";
        frame-count: 4;
        frame 0 { cel: -1; }
        frame 1 { x: 45.2; y: 50.1; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_LILYPAD_BLINK1; }
        frame 2 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: IMAGE_REANIM_LILYPAD_BLINK2; }
        frame 3 { image: IMAGE_REANIM_LILYPAD_BLINK1; }
    }
}
