export component Pot {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 39;
        frame 13 { cel: -1; }
        frame 14 { cel: -10000; }
    }
    Track {
        source-name: "anim_zengarden";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 13 { cel: 0; }
        frame 14 { cel: -10000; }
        frame 26 { cel: -1; }
        frame 27 { cel: -10000; }
    }
    Track {
        source-name: "anim_waterplants";
        frame-count: 39;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 26 { cel: 0; }
        frame 27 { cel: -10000; }
    }
    Track {
        source-name: "Pot_bottom";
        frame-count: 39;
        frame 0 { x: 13.5; y: 55.1; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POT_BOTTOM; }
        frame 1 { x: -10000; y: 54.5; scale-x: -10000; scale-y: 0.831; image: none; }
        frame 2 { y: 53.8; scale-y: 0.862; }
        frame 3 { y: 53.1; scale-y: 0.893; }
        frame 4 { y: 52.5; scale-y: 0.924; }
        frame 5 { y: 51.8; scale-y: 0.955; }
        frame 6 { y: 51.1; scale-y: 0.986; }
        frame 7 { y: 51.9; scale-y: 0.955; }
        frame 8 { y: 52.5; scale-y: 0.924; }
        frame 9 { y: 53.1; scale-y: 0.893; }
        frame 10 { y: 53.9; scale-y: 0.862; }
        frame 11 { y: 54.4; scale-y: 0.831; }
        frame 12 { y: 55.1; scale-y: 0.8; }
        frame 13 { x: 13.6; y: 53.5; scale-y: 0.89; image: IMAGE_REANIM_POT_BOTTOM2; }
        frame 14 { x: -10000; y: 53.4; scale-x: 0.798; scale-y: 0.897; image: none; }
        frame 15 { x: 13.7; y: 53.2; scale-x: 0.795; scale-y: 0.904; }
        frame 16 { x: 13.8; y: 53; scale-x: 0.793; scale-y: 0.91; }
        frame 17 { x: -10000; y: 52.8; scale-x: 0.791; scale-y: 0.917; }
        frame 18 { y: 52.6; scale-x: 0.789; scale-y: 0.924; }
        frame 19 { x: 13.9; y: 52.5; scale-x: 0.786; scale-y: 0.93; }
        frame 20 { x: -10000; y: 52.8; scale-x: 0.789; scale-y: 0.924; }
        frame 21 { x: 13.8; y: 52.9; scale-x: 0.791; scale-y: 0.917; }
        frame 22 { x: 13.7; y: 53.1; scale-x: 0.793; scale-y: 0.91; }
        frame 23 { x: -10000; y: 53.3; scale-x: 0.795; scale-y: 0.904; }
        frame 24 { y: 53.5; scale-x: 0.798; scale-y: 0.897; }
        frame 25 { x: 13.6; y: -10000; scale-x: 0.8; scale-y: 0.89; }
        frame 26 { x: -2.5; y: 46.8; scale-x: -10000; scale-y: 0.8; image: IMAGE_REANIM_POT_WATER_BASE; }
        frame 27 { x: -2.6; y: 45.7; scale-y: 0.839; image: none; }
        frame 28 { x: -2.7; y: 44.6; scale-y: 0.879; }
        frame 29 { x: -2.8; y: 43.5; scale-y: 0.918; }
        frame 30 { x: -2.9; y: 42.5; scale-y: 0.958; }
        frame 31 { x: -10000; y: 41.4; scale-y: 0.997; }
        frame 32 { x: -3; y: 40.3; scale-y: 1.037; }
        frame 33 { x: -2.9; y: 41.4; scale-y: 0.997; }
        frame 34 { x: -10000; y: 42.5; scale-y: 0.958; }
        frame 35 { x: -2.8; y: 43.5; scale-y: 0.918; }
        frame 36 { x: -2.7; y: 44.5; scale-y: 0.879; }
        frame 37 { x: -2.6; y: 45.7; scale-y: 0.839; }
        frame 38 { x: -2.5; y: 46.8; scale-y: 0.8; }
    }
    Track {
        source-name: "Pot_stem";
        frame-count: 39;
        frame 0 { x: 24; y: 10.9; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POT_STEM; }
        frame 1 { x: 23.8; y: 11; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -10000; y: 11.1; skew-x: -7.2; skew-y: -7.2; }
        frame 3 { x: 23.7; y: 11; skew-x: -9; skew-y: -9; scale-x: 0.799; scale-y: 0.799; }
        frame 4 { x: 23.4; y: 10.8; skew-x: -10.9; skew-y: -10.9; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 23.3; y: 10.7; skew-x: -12.9; skew-y: -12.9; }
        frame 6 { x: 23.2; y: 10.5; skew-x: -14.9; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { x: 24.2; y: 9.5; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; }
        frame 8 { x: 25.5; y: 8.7; skew-x: 14.3; skew-y: 14.3; scale-x: 0.799; scale-y: 0.799; }
        frame 9 { x: 25; y: 9.3; skew-x: 10.6; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 24.7; y: 9.8; skew-x: 7; skew-y: 7; }
        frame 11 { x: 24.3; y: 10.3; skew-x: 3.5; skew-y: 3.5; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: 24; y: 10.9; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 14 { cel: -10000; }
        frame 26 { cel: 0; }
        frame 27 { x: 23.8; y: 11; skew-x: -3.4; skew-y: -3.4; cel: -10000; }
        frame 28 { x: -10000; y: 11.1; skew-x: -7.2; skew-y: -7.2; }
        frame 29 { x: 23.7; y: 11; skew-x: -9; skew-y: -9; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: 23.4; y: 10.8; skew-x: -10.9; skew-y: -10.9; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 23.3; y: 10.7; skew-x: -12.9; skew-y: -12.9; }
        frame 32 { x: 23.2; y: 10.5; skew-x: -14.9; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
        frame 33 { x: 24.2; y: 9.5; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 25.5; y: 8.7; skew-x: 14.3; skew-y: 14.3; scale-x: 0.799; scale-y: 0.799; }
        frame 35 { x: 25; y: 9.3; skew-x: 10.6; skew-y: 10.6; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 24.7; y: 9.8; skew-x: 7; skew-y: 7; }
        frame 37 { x: 24.3; y: 10.3; skew-x: 3.5; skew-y: 3.5; scale-x: 0.8; scale-y: 0.8; }
        frame 38 { x: 24; y: 10.9; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Pot_leaf1";
        frame-count: 39;
        frame 0 { x: 27; y: 7.8; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POT_LEAF1; }
        frame 1 { x: 27.6; y: 7.6; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 28.3; y: -10000; skew-x: 11.9; skew-y: 11.9; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -10000; y: 7.3; skew-x: 12.5; skew-y: 12.5; }
        frame 4 { x: 28.4; y: 7; skew-x: 13.3; skew-y: 13.3; }
        frame 5 { x: 28.5; y: 6.8; skew-x: 14.1; skew-y: 14.1; }
        frame 6 { x: 28.6; y: 6.5; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { x: 27.6; y: 6.8; skew-x: 2.5; skew-y: 2.5; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 26.9; y: 7.2; skew-x: -9.7; skew-y: -9.7; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: -10000; y: 7.3; skew-x: -7.2; skew-y: -7.2; }
        frame 10 { y: 7.5; skew-x: -4.7; skew-y: -4.7; }
        frame 11 { x: 27; y: 7.6; skew-x: -2.2; skew-y: -2.2; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: -10000; y: 7.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 13 { y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 14 { cel: -10000; }
        frame 26 { cel: 0; }
        frame 27 { x: 27.6; y: 7.6; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; cel: -10000; }
        frame 28 { x: 28.3; y: -10000; skew-x: 11.9; skew-y: 11.9; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: -10000; y: 7.3; skew-x: 12.5; skew-y: 12.5; }
        frame 30 { x: 28.4; y: 7; skew-x: 13.3; skew-y: 13.3; }
        frame 31 { x: 28.5; y: 6.8; skew-x: 14.1; skew-y: 14.1; }
        frame 32 { x: 28.6; y: 6.5; skew-x: 15; skew-y: 15; scale-x: 0.8; scale-y: 0.8; }
        frame 33 { x: 27.6; y: 6.8; skew-x: 2.5; skew-y: 2.5; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 26.9; y: 7.2; skew-x: -9.7; skew-y: -9.7; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: -10000; y: 7.3; skew-x: -7.2; skew-y: -7.2; }
        frame 36 { y: 7.5; skew-x: -4.7; skew-y: -4.7; }
        frame 37 { x: 27; y: 7.6; skew-x: -2.2; skew-y: -2.2; scale-x: 0.8; scale-y: 0.8; }
        frame 38 { x: -10000; y: 7.8; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Pot_leaf2";
        frame-count: 39;
        frame 0 { x: 17.6; y: 9.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POT_LEAF2; }
        frame 1 { x: 17.3; y: 10.5; skew-x: -5.9; skew-y: -5.9; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 17.1; y: 11.7; skew-x: -12.2; skew-y: -12.2; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 17.2; y: 11.5; skew-x: -12.9; skew-y: -12.9; }
        frame 4 { x: -10000; y: 11.2; skew-x: -13.5; skew-y: -13.5; }
        frame 5 { x: 17.3; y: 11; skew-x: -14.2; skew-y: -14.2; }
        frame 6 { x: -10000; y: 10.8; skew-x: -14.9; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { x: 17.7; y: 9; skew-x: -3.2; skew-y: -3.2; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 18.3; y: 7.3; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 18; y: 7.8; skew-x: 6.3; skew-y: 6.3; }
        frame 10 { x: 17.8; y: 8.3; skew-x: 4; skew-y: 4; }
        frame 11 { x: 17.7; y: 8.7; skew-x: 2; skew-y: 2; scale-x: 0.8; scale-y: 0.8; }
        frame 12 { x: 17.6; y: 9.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 14 { cel: -10000; }
        frame 26 { cel: 0; }
        frame 27 { x: 17.3; y: 10.5; skew-x: -5.9; skew-y: -5.9; scale-x: 0.799; scale-y: 0.799; cel: -10000; }
        frame 28 { x: 17.1; y: 11.7; skew-x: -12.2; skew-y: -12.2; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 17.2; y: 11.5; skew-x: -12.9; skew-y: -12.9; }
        frame 30 { x: -10000; y: 11.2; skew-x: -13.5; skew-y: -13.5; }
        frame 31 { x: 17.3; y: 11; skew-x: -14.2; skew-y: -14.2; }
        frame 32 { x: -10000; y: 10.8; skew-x: -14.9; skew-y: -14.9; scale-x: 0.8; scale-y: 0.8; }
        frame 33 { x: 17.7; y: 9; skew-x: -3.2; skew-y: -3.2; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 18.3; y: 7.3; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 18; y: 7.8; skew-x: 6.3; skew-y: 6.3; }
        frame 36 { x: 17.8; y: 8.3; skew-x: 4; skew-y: 4; }
        frame 37 { x: 17.7; y: 8.7; skew-x: 2; skew-y: 2; scale-x: 0.8; scale-y: 0.8; }
        frame 38 { x: 17.6; y: 9.3; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Pot_top";
        frame-count: 39;
        frame 0 { x: 7.2; y: 13.3; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_POT_TOP; }
        frame 1 { x: -10000; y: 12.9; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 12.5; }
        frame 3 { y: 12.2; }
        frame 4 { y: 11.8; }
        frame 5 { y: 11.4; }
        frame 6 { y: 11.1; }
        frame 7 { y: 11.4; }
        frame 8 { y: 11.8; }
        frame 9 { y: 12.2; }
        frame 10 { y: 12.5; }
        frame 11 { y: 12.9; }
        frame 12 { y: 13.3; }
        frame 13 { y: -10000; }
        frame 14 { y: 12.9; }
        frame 15 { y: 12.5; }
        frame 16 { y: 12.2; }
        frame 17 { y: 11.8; }
        frame 18 { y: 11.4; }
        frame 19 { y: 11.1; }
        frame 20 { y: 11.4; }
        frame 21 { y: 11.8; }
        frame 22 { y: 12.2; }
        frame 23 { y: 12.5; }
        frame 24 { y: 12.9; }
        frame 25 { y: 13.3; }
        frame 26 { x: -5.6; y: 4.3; image: IMAGE_REANIM_POT_WATER_TOP; }
        frame 27 { x: -5.7; y: 3.6; image: none; }
        frame 28 { x: -10000; y: 3; }
        frame 29 { x: -5.8; y: 2.3; }
        frame 30 { x: -5.9; y: 1.6; }
        frame 31 { x: -6; y: 0.9; }
        frame 32 { x: -10000; y: 0.3; }
        frame 33 { x: -5.9; y: 1; }
        frame 34 { x: -10000; y: 1.7; }
        frame 35 { x: -5.8; y: 2.4; }
        frame 36 { x: -5.7; y: 3; }
        frame 37 { x: -5.6; y: 3.8; }
        frame 38 { x: -10000; y: 4.3; }
    }
}
