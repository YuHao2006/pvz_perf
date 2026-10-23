export component RoofCleaner {
    fps: 12;
    Track {
        source-name: "RoofCleaner_backwheel1";
        frame-count: 9;
        frame 0 { x: 10.6; y: 30; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ROOFCLEANER_WHEEL; }
        frame 1 { x: -10000; y: 30.1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 30.3; }
        frame 3 { y: 30.4; }
        frame 4 { y: 30.6; }
        frame 5 { y: 30.4; }
        frame 6 { y: 30.3; }
        frame 7 { y: 30.1; }
        frame 8 { y: 30; }
    }
    Track {
        source-name: "RoofCleaner_backwheel2";
        frame-count: 9;
        frame 0 { x: 61.5; y: 30; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ROOFCLEANER_WHEEL; }
        frame 1 { x: -10000; y: 29.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 29.8; }
        frame 3 { y: -10000; }
        frame 4 { y: 29.7; }
        frame 5 { y: 29.8; }
        frame 6 { y: -10000; }
        frame 7 { y: 29.9; }
        frame 8 { y: 30; }
    }
    Track {
        source-name: "RoofCleaner_body1";
        frame-count: 9;
        frame 0 { x: 12.1; y: 30; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ROOFCLEANER_BODY1; }
        frame 1 { x: -10000; y: 30.3; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 30.6; }
        frame 3 { y: 30.3; }
        frame 4 { y: 30; }
        frame 5 { y: 30.3; }
        frame 6 { y: 30.6; }
        frame 7 { y: 30.3; }
        frame 8 { y: 30; }
    }
    Track {
        source-name: "RoofCleaner_brushes";
        frame-count: 9;
        frame 0 { x: 11.8; y: 29.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ROOFCLEANER_BRUSH1; }
        frame 1 { x: 11.9; y: 30; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ROOFCLEANER_BRUSH2; }
        frame 2 { x: 11.8; y: -10000; image: IMAGE_REANIM_ROOFCLEANER_BRUSH3; }
        frame 3 { x: -10000; y: 30.1; image: IMAGE_REANIM_ROOFCLEANER_BRUSH4; }
        frame 4 { y: 30.3; image: IMAGE_REANIM_ROOFCLEANER_BRUSH5; }
        frame 5 { y: 30.2; image: IMAGE_REANIM_ROOFCLEANER_BRUSH4; }
        frame 6 { y: 30.1; image: IMAGE_REANIM_ROOFCLEANER_BRUSH3; }
        frame 7 { y: 29.9; image: IMAGE_REANIM_ROOFCLEANER_BRUSH2; }
        frame 8 { y: 29.8; image: IMAGE_REANIM_ROOFCLEANER_BRUSH1; }
    }
    Track {
        source-name: "RoofCleaner_body2";
        frame-count: 9;
        frame 0 { x: 9.1; y: 28; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ROOFCLEANER_BODY2; }
        frame 1 { x: -10000; y: 27.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 27.4; }
        frame 3 { y: 27.2; }
        frame 4 { y: 26.9; }
        frame 5 { y: 27.2; }
        frame 6 { y: 27.4; }
        frame 7 { y: 27.7; }
        frame 8 { y: 28; }
    }
    Track {
        source-name: "RoofCleaner_body3";
        frame-count: 9;
        frame 0 { x: 32.9; y: 33.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ROOFCLEANER_BODY3; }
        frame 1 { x: -10000; y: 33.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 33.9; }
        frame 3 { x: 32.5; y: 34.2; scale-x: 0.838; scale-y: 0.767; }
        frame 4 { x: 32.9; y: 33.1; scale-x: 0.8; scale-y: 0.8; }
        frame 5 { x: -10000; y: 33.5; scale-x: -10000; scale-y: -10000; }
        frame 6 { y: 33.9; }
        frame 7 { x: 32.5; y: 34.2; scale-x: 0.838; scale-y: 0.767; }
        frame 8 { x: 32.9; y: 33.1; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "RoofCleaner_body4";
        frame-count: 9;
        frame 0 { x: 45.9; y: 29.6; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ROOFCLEANER_BODY4; }
        frame 1 { x: -10000; y: 29.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 30.3; }
        frame 3 { x: 46.5; y: 30; skew-x: 5.5; skew-y: 5.5; }
        frame 4 { x: 45.9; y: 29.6; skew-x: 0; skew-y: 0; }
        frame 5 { x: -10000; y: 29.9; skew-x: -10000; skew-y: -10000; }
        frame 6 { y: 30.3; }
        frame 7 { x: 46.5; y: 30; skew-x: 5.5; skew-y: 5.5; }
        frame 8 { x: 45.9; y: 29.6; skew-x: 0; skew-y: 0; }
    }
    Track {
        source-name: "RoofCleaner_outerwheel1";
        frame-count: 9;
        frame 0 { x: 54; y: 64.5; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ROOFCLEANER_WHEEL; }
        frame 1 { x: -10000; y: 64.6; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 64.7; }
        frame 3 { y: 64.8; }
        frame 4 { y: -10000; }
        frame 6 { y: 64.7; }
        frame 7 { y: 64.6; }
        frame 8 { y: 64.5; }
    }
    Track {
        source-name: "RoofCleaner_hubcap1";
        frame-count: 9;
        frame 0 { x: 54.4; y: 64.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ROOFCLEANER_HUBCAP; }
        frame 1 { x: 55.2; y: 63.8; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 56.1; y: 63.4; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 55.2; y: 64; skew-x: 6; skew-y: 6; }
        frame 4 { x: 54.4; y: 64.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 5 { x: 55.2; y: 64; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 6 { x: 56.1; y: 63.4; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 55.2; y: 63.8; skew-x: 6; skew-y: 6; }
        frame 8 { x: 54.4; y: 64.3; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
    Track {
        source-name: "RoofCleaner_outerwheel2";
        frame-count: 9;
        frame 0 { x: 4.1; y: 65.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ROOFCLEANER_WHEEL; }
        frame 1 { x: -10000; y: 65.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 65.1; }
        frame 3 { y: 65; }
        frame 4 { y: 64.8; }
        frame 5 { y: 65; }
        frame 6 { y: 65.1; }
        frame 7 { y: 65.2; }
        frame 8 { y: 65.3; }
    }
    Track {
        source-name: "RoofCleaner_hubcap2";
        frame-count: 9;
        frame 0 { x: 4.2; y: 65.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ROOFCLEANER_HUBCAP; }
        frame 1 { x: 5; y: 64.3; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 6; y: 63.5; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 5; y: 64.1; skew-x: 6; skew-y: 6; }
        frame 4 { x: 4.2; y: 64.7; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 5 { x: 5; y: 64; skew-x: 6; skew-y: 6; scale-x: 0.799; scale-y: 0.799; }
        frame 6 { x: 6; y: 63.5; skew-x: 12.3; skew-y: 12.3; scale-x: -10000; scale-y: -10000; }
        frame 7 { x: 5; y: 64.3; skew-x: 6; skew-y: 6; }
        frame 8 { x: 4.2; y: 65.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
    }
}
