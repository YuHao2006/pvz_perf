export component Zombie_ladder {
    fps: 12;
    Track {
        source-name: "anim_idle";
        frame-count: 215;
        frame 25 { cel: -1; }
        frame 26 { cel: -10000; }
    }
    Track {
        source-name: "anim_ladderwalk";
        frame-count: 215;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 25 { cel: 0; }
        frame 26 { cel: -10000; }
        frame 72 { cel: -1; }
        frame 73 { cel: -10000; }
    }
    Track {
        source-name: "anim_laddereat";
        frame-count: 215;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 72 { cel: 0; }
        frame 73 { cel: -10000; }
        frame 96 { cel: -1; }
        frame 97 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 215;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 96 { cel: 0; }
        frame 97 { cel: -10000; }
        frame 132 { cel: -1; }
        frame 133 { cel: -10000; }
    }
    Track {
        source-name: "anim_walk";
        frame-count: 215;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 132 { cel: 0; }
        frame 133 { cel: -10000; }
        frame 179 { cel: -1; }
        frame 180 { cel: -10000; }
    }
    Track {
        source-name: "anim_eat";
        frame-count: 215;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 179 { cel: 0; }
        frame 180 { cel: -10000; }
        frame 203 { cel: -1; }
        frame 204 { cel: -10000; }
    }
    Track {
        source-name: "anim_placeladder";
        frame-count: 215;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 203 { cel: 0; }
        frame 204 { cel: -10000; }
    }
    Track {
        source-name: "_ground";
        frame-count: 215;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 25 { x: -39.8; y: 70.8; cel: 0; }
        frame 26 { x: -39; y: -10000; cel: -10000; }
        frame 27 { x: -38.1; }
        frame 28 { x: -37.3; }
        frame 29 { x: -36.5; }
        frame 30 { x: -33.6; }
        frame 31 { x: -30.7; }
        frame 32 { x: -27.9; }
        frame 33 { x: -25; }
        frame 34 { x: -21.1; }
        frame 35 { x: -17.2; }
        frame 36 { x: -13.2; }
        frame 37 { x: -9.3; }
        frame 38 { x: -5.4; }
        frame 39 { x: -4.6; }
        frame 40 { x: -3.9; }
        frame 41 { x: -3.1; }
        frame 42 { x: -2.4; }
        frame 43 { x: -1.6; }
        frame 44 { x: -10000; }
        frame 48 { x: -0.6; }
        frame 49 { x: 0.2; }
        frame 50 { x: 1.2; }
        frame 51 { x: 2.1; }
        frame 52 { x: 3; }
        frame 53 { x: 5.2; }
        frame 54 { x: 7.3; }
        frame 55 { x: 9.6; }
        frame 56 { x: 11.7; }
        frame 57 { x: 13.9; }
        frame 58 { x: 15.9; }
        frame 59 { x: 18; }
        frame 60 { x: 20.1; }
        frame 61 { x: 22.2; }
        frame 62 { x: 24.2; }
        frame 63 { x: 24.7; }
        frame 64 { x: 25.2; }
        frame 65 { x: 25.6; }
        frame 66 { x: 26.1; }
        frame 67 { x: -10000; }
        frame 72 { cel: -1; }
        frame 73 { cel: -10000; }
        frame 132 { x: -39.8; cel: 0; }
        frame 133 { x: -39; cel: -10000; }
        frame 134 { x: -38.1; }
        frame 135 { x: -37.3; }
        frame 136 { x: -36.5; }
        frame 137 { x: -33.6; }
        frame 138 { x: -30.7; }
        frame 139 { x: -27.9; }
        frame 140 { x: -25; }
        frame 141 { x: -21.1; }
        frame 142 { x: -17.2; }
        frame 143 { x: -13.2; }
        frame 144 { x: -9.3; }
        frame 145 { x: -5.4; }
        frame 146 { x: -4.6; }
        frame 147 { x: -3.9; }
        frame 148 { x: -3.1; }
        frame 149 { x: -2.4; }
        frame 150 { x: -1.6; }
        frame 151 { x: -10000; }
        frame 155 { x: -0.6; }
        frame 156 { x: 0.2; }
        frame 157 { x: 1.2; }
        frame 158 { x: 2.1; }
        frame 159 { x: 3; }
        frame 160 { x: 5.2; }
        frame 161 { x: 7.3; }
        frame 162 { x: 9.6; }
        frame 163 { x: 11.7; }
        frame 164 { x: 13.9; }
        frame 165 { x: 15.9; }
        frame 166 { x: 18; }
        frame 167 { x: 20.1; }
        frame 168 { x: 22.2; }
        frame 169 { x: 24.2; }
        frame 170 { x: 24.7; }
        frame 171 { x: 25.2; }
        frame 172 { x: 25.6; }
        frame 173 { x: 26.1; }
        frame 174 { x: -10000; }
        frame 179 { cel: -1; }
        frame 180 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_innererarm_hand";
        frame-count: 215;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 132 { x: 18.8; y: 83.6; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_INNERARM_HAND; }
        frame 133 { x: 18.5; y: 82.8; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 134 { x: 18.1; y: 82.2; skew-x: -0.7; skew-y: -0.7; }
        frame 135 { x: 17.7; y: 81.5; skew-x: -1.2; skew-y: -1.2; scale-x: 0.799; scale-y: 0.799; }
        frame 136 { x: 17.4; y: 80.8; skew-x: -1.6; skew-y: -1.6; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 16.9; y: 77.8; skew-x: 0.5; skew-y: 0.5; }
        frame 138 { x: 16.4; y: 74.8; skew-x: 3; skew-y: 3; scale-x: 0.798; scale-y: 0.798; }
        frame 139 { x: 15.8; y: 71.8; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 15.2; y: 68.8; skew-x: 7.8; skew-y: 7.8; }
        frame 141 { x: 14.7; y: 67.8; skew-x: 9.6; skew-y: 9.6; }
        frame 142 { x: 14.4; y: 67; skew-x: 11.5; skew-y: 11.5; scale-x: 0.797; scale-y: 0.797; }
        frame 143 { x: 14; y: 66.1; skew-x: 13.5; skew-y: 13.5; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 13.7; y: 65.2; skew-x: 15.3; skew-y: 15.3; }
        frame 145 { x: 13.3; y: 64.3; skew-x: 17.4; skew-y: 17.4; scale-x: 0.798; scale-y: 0.798; }
        frame 146 { x: 14.7; y: 68.2; skew-x: 12.3; skew-y: 12.3; scale-x: 0.797; scale-y: 0.797; }
        frame 147 { x: 16.3; y: 72.3; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 17.7; y: 76.5; skew-x: 2.1; skew-y: 2.1; }
        frame 149 { x: 19.4; y: 80.7; skew-x: -2.7; skew-y: -2.7; scale-x: 0.796; scale-y: 0.796; }
        frame 150 { x: 21.1; y: 84.9; skew-x: -7.8; skew-y: -7.8; scale-x: -10000; scale-y: -10000; }
        frame 151 { x: 20.7; y: 86.6; skew-x: -7.7; skew-y: -7.7; }
        frame 152 { x: 20.2; y: 88.3; skew-x: -10000; skew-y: -10000; }
        frame 153 { x: 19.7; y: 90.1; }
        frame 154 { x: 19.1; y: 91.9; skew-x: -7.8; skew-y: -7.8; }
        frame 155 { x: 20.2; y: 90; skew-x: -6.2; skew-y: -6.2; scale-x: 0.795; scale-y: 0.795; }
        frame 156 { x: 21.2; y: 88; skew-x: -4.4; skew-y: -4.4; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 22.2; y: 86; skew-x: -2.7; skew-y: -2.7; }
        frame 158 { x: 23.3; y: 84.1; skew-x: -1.2; skew-y: -1.2; }
        frame 159 { x: 24.3; y: 82; skew-x: 0.3; skew-y: 0.3; }
        frame 160 { x: 25.8; y: 80.3; skew-x: -0.7; skew-y: -0.7; }
        frame 161 { x: 27.3; y: 78.7; skew-x: -1.7; skew-y: -1.7; scale-x: 0.794; scale-y: 0.794; }
        frame 162 { x: 28.9; y: 77; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 30.4; y: 75.3; skew-x: -4.2; skew-y: -4.2; }
        frame 164 { x: 31.8; y: 73.7; skew-x: -5.3; skew-y: -5.3; scale-x: 0.793; scale-y: 0.793; }
        frame 165 { x: 31.2; y: 73.8; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 166 { x: 30.5; y: -10000; skew-x: -4.2; skew-y: -4.2; }
        frame 167 { x: 29.8; y: 74; skew-x: -3.5; skew-y: -3.5; scale-x: 0.792; scale-y: 0.792; }
        frame 168 { x: 29.1; y: 74.1; skew-x: -2.9; skew-y: -2.9; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 28.4; y: 74.2; skew-x: -2.5; skew-y: -2.5; }
        frame 170 { x: 27.2; y: 78; skew-x: -0.7; skew-y: -0.7; }
        frame 171 { x: 25.9; y: 82.1; skew-x: 0.5; skew-y: 0.5; }
        frame 172 { x: 24.7; y: 86; skew-x: 2.3; skew-y: 2.3; }
        frame 173 { x: 23.5; y: 90; skew-x: 3.9; skew-y: 3.9; }
        frame 174 { x: 22.5; y: 88.6; skew-x: 3; skew-y: 3; scale-x: 0.794; scale-y: 0.794; }
        frame 175 { x: 21.5; y: 87.3; skew-x: 2.3; skew-y: 2.3; scale-x: 0.795; scale-y: 0.795; }
        frame 176 { x: 20.6; y: 86.1; skew-x: 1.5; skew-y: 1.5; scale-x: 0.797; scale-y: 0.797; }
        frame 177 { x: 19.6; y: 84.8; skew-x: 0.8; skew-y: 0.8; scale-x: 0.798; scale-y: 0.798; }
        frame 178 { x: 18.8; y: 83.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 20.9; y: 81.8; skew-x: -1.7; skew-y: -1.7; scale-x: 0.799; scale-y: 0.799; }
        frame 181 { x: 22.9; y: 80.1; skew-x: -3.4; skew-y: -3.4; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 24.9; y: 78.3; skew-x: -5.2; skew-y: -5.2; scale-x: 0.798; scale-y: 0.798; }
        frame 183 { x: 26.9; y: 76.7; skew-x: -7.2; skew-y: -7.2; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: 28.9; y: 75; skew-x: -8.9; skew-y: -8.9; scale-x: 0.797; scale-y: 0.797; }
        frame 185 { x: 31; y: 73.3; skew-x: -10.7; skew-y: -10.7; scale-x: -10000; scale-y: -10000; }
        frame 186 { x: 33; y: 71.6; skew-x: -12.7; skew-y: -12.7; scale-x: 0.796; scale-y: 0.796; }
        frame 187 { x: 35; y: 70; skew-x: -14.5; skew-y: -14.5; scale-x: -10000; scale-y: -10000; }
        frame 188 { x: 37.1; y: 71.3; skew-x: -25.7; skew-y: -25.7; scale-x: 0.795; scale-y: 0.795; }
        frame 189 { x: 39.8; y: 72.8; skew-x: -37.2; skew-y: -37.2; scale-x: 0.794; scale-y: 0.794; }
        frame 190 { x: 42.8; y: 74.5; skew-x: -48.5; skew-y: -48.5; scale-x: 0.795; scale-y: 0.795; }
        frame 191 { x: 44.9; y: 72.8; skew-x: -59.8; skew-y: -59.8; scale-x: 0.794; scale-y: 0.794; }
        frame 192 { x: 47.4; y: 71.2; skew-x: -71.1; skew-y: -71.1; scale-x: 0.795; scale-y: 0.795; }
        frame 193 { x: 50.4; y: 69.3; skew-x: -82.6; skew-y: -82.6; scale-x: -10000; scale-y: -10000; }
        frame 194 { x: 53.8; y: 67.2; skew-x: -93.7; skew-y: -93.7; scale-x: 0.796; scale-y: 0.796; }
        frame 195 { x: 49; y: 71.6; skew-x: -82.1; skew-y: -82.1; scale-x: -10000; scale-y: -10000; }
        frame 196 { x: 44.5; y: 75.7; skew-x: -70.3; skew-y: -70.3; scale-x: 0.795; scale-y: 0.795; }
        frame 197 { x: 40.6; y: 79.6; skew-x: -58.6; skew-y: -58.6; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 37.2; y: 83.3; skew-x: -46.8; skew-y: -46.8; scale-x: 0.797; scale-y: 0.797; }
        frame 199 { x: 32; y: 83.2; skew-x: -35; skew-y: -35; scale-x: 0.796; scale-y: 0.796; }
        frame 200 { x: 27.2; y: 83.1; skew-x: -23.2; skew-y: -23.2; scale-x: 0.797; scale-y: 0.797; }
        frame 201 { x: 22.8; y: -10000; skew-x: -11.5; skew-y: -11.5; scale-x: 0.799; scale-y: 0.799; }
        frame 202 { x: 18.8; y: 83.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 204 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_innerleg_foot";
        frame-count: 215;
        frame 0 { x: 34.1; y: 110; skew-x: 4.3; skew-y: 4.3; scale-x: 0.75; scale-y: 0.75; image: IMAGE_REANIM_ZOMBIE_LADDER_INNERLEG_FOOT; }
        frame 1 { x: -10000; y: 110.2; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 34.2; y: 110.3; skew-x: 2.8; skew-y: 2.8; }
        frame 3 { x: 34.3; y: 110.6; skew-x: 2; skew-y: 2; }
        frame 4 { x: 34.4; y: 110.7; skew-x: 1.3; skew-y: 1.3; }
        frame 5 { x: 34.5; y: 110.8; skew-x: 0.6; skew-y: 0.6; }
        frame 6 { x: -10000; y: 111.1; skew-x: 0; skew-y: 0; }
        frame 7 { x: 34.6; y: 111; skew-x: 0.6; skew-y: 0.6; }
        frame 8 { x: 34.8; y: 110.7; skew-x: 1.3; skew-y: 1.3; }
        frame 9 { x: -10000; y: 110.6; skew-x: 2; skew-y: 2; }
        frame 10 { x: 34.9; y: 110.3; skew-x: 2.8; skew-y: 2.8; }
        frame 11 { x: 35; y: 110.2; skew-x: 3.5; skew-y: 3.5; }
        frame 12 { x: 35.1; y: 110; skew-x: 4.3; skew-y: 4.3; }
        frame 13 { x: 35.2; y: 109.8; skew-x: 4.8; skew-y: 4.8; scale-x: 0.749; scale-y: 0.749; }
        frame 14 { x: 35.4; y: 109.6; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: -10000; y: 109.5; skew-x: 6; skew-y: 6; }
        frame 16 { x: 35.5; y: 109.3; skew-x: 6.8; skew-y: 6.8; }
        frame 17 { x: 35.6; y: 109.2; skew-x: 7.3; skew-y: 7.3; }
        frame 18 { x: 35.7; y: 108.9; skew-x: 8; skew-y: 8; scale-x: 0.75; scale-y: 0.75; }
        frame 19 { x: 35.5; y: 109.2; skew-x: 7.3; skew-y: 7.3; scale-x: 0.749; scale-y: 0.749; }
        frame 20 { x: 35.1; y: 109.3; skew-x: 6.8; skew-y: 6.8; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 34.9; y: 109.5; skew-x: 6; skew-y: 6; }
        frame 22 { x: 34.6; y: 109.6; skew-x: 5.5; skew-y: 5.5; }
        frame 23 { x: 34.4; y: 109.8; skew-x: 4.8; skew-y: 4.8; }
        frame 24 { x: 34.1; y: 110; skew-x: 4.3; skew-y: 4.3; scale-x: 0.75; scale-y: 0.75; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 35; y: 109.9; scale-x: 0.749; scale-y: 0.749; }
        frame 27 { x: 36; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 36.9; }
        frame 29 { x: 37.8; y: 110; scale-x: 0.75; scale-y: 0.75; }
        frame 30 { x: 39.5; y: 110.4; skew-x: 0; skew-y: 0; scale-x: 0.749; scale-y: 0.749; }
        frame 31 { x: 41.5; y: 110.9; skew-x: -4.2; skew-y: -4.2; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 43.4; y: 111.5; skew-x: -8.4; skew-y: -8.4; }
        frame 33 { x: 45.5; y: 112.1; skew-x: -12.9; skew-y: -12.9; }
        frame 34 { x: 48; y: -10000; skew-x: -14.7; skew-y: -14.7; scale-x: 0.748; scale-y: 0.748; }
        frame 35 { x: 50.5; skew-x: -16.5; skew-y: -16.5; scale-x: 0.747; scale-y: 0.747; }
        frame 36 { x: 53; y: 112.3; skew-x: -18.4; skew-y: -18.4; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 55.5; y: -10000; skew-x: -20.2; skew-y: -20.2; scale-x: 0.746; scale-y: 0.746; }
        frame 38 { x: 58.1; y: 112.4; skew-x: -22.1; skew-y: -22.1; scale-x: 0.747; scale-y: 0.747; }
        frame 39 { x: 59.3; y: 113.2; skew-x: -26.7; skew-y: -26.7; scale-x: 0.746; scale-y: 0.746; }
        frame 40 { x: 60.5; y: 114.1; skew-x: -31.2; skew-y: -31.2; scale-x: 0.745; scale-y: 0.745; }
        frame 41 { x: 62; y: 114.8; skew-x: -35.7; skew-y: -35.7; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 63.5; y: 115.6; skew-x: -40.3; skew-y: -40.3; }
        frame 43 { x: 65; y: 116.3; skew-x: -44.9; skew-y: -44.9; scale-x: 0.746; scale-y: 0.746; }
        frame 44 { x: 65.2; y: 117.3; skew-x: -49; skew-y: -49; scale-x: 0.744; scale-y: 0.744; }
        frame 45 { x: 65.3; y: 118.3; skew-x: -53; skew-y: -53; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 65.5; y: 119.2; skew-x: -57.1; skew-y: -57.1; }
        frame 47 { x: 65.8; y: 120; skew-x: -61.1; skew-y: -61.1; }
        frame 48 { x: 65.7; y: 120.3; skew-x: -62.8; skew-y: -62.8; scale-x: 0.743; scale-y: 0.743; }
        frame 49 { x: 65.5; y: 120.6; skew-x: -64.4; skew-y: -64.4; scale-x: 0.744; scale-y: 0.744; }
        frame 50 { x: 65.2; y: 121; skew-x: -66.1; skew-y: -66.1; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 65; y: 121.3; skew-x: -67.8; skew-y: -67.8; }
        frame 52 { x: 64.8; y: 121.5; skew-x: -69.3; skew-y: -69.3; scale-x: 0.745; scale-y: 0.745; }
        frame 53 { x: 61.6; y: 120.8; skew-x: -68.4; skew-y: -68.4; scale-x: 0.744; scale-y: 0.744; }
        frame 54 { x: 58.3; y: 120.3; skew-x: -67.6; skew-y: -67.6; scale-x: 0.743; scale-y: 0.743; }
        frame 55 { x: 54.9; y: 119.6; skew-x: -66.6; skew-y: -66.6; scale-x: 0.744; scale-y: 0.744; }
        frame 56 { x: 50.8; y: 120.7; skew-x: -69.1; skew-y: -69.1; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 46.5; y: 121.9; skew-x: -71.6; skew-y: -71.6; scale-x: 0.745; scale-y: 0.745; }
        frame 58 { x: 42.5; y: 121.1; skew-x: -63.8; skew-y: -63.8; scale-x: 0.744; scale-y: 0.744; }
        frame 59 { x: 38.6; y: 120.2; skew-x: -55.8; skew-y: -55.8; scale-x: 0.743; scale-y: 0.743; }
        frame 60 { x: 35; y: 119.3; skew-x: -48; skew-y: -48; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 31.7; y: 118; skew-x: -40; skew-y: -40; scale-x: 0.742; scale-y: 0.742; }
        frame 62 { x: 28.7; y: 117; skew-x: -32.2; skew-y: -32.2; scale-x: 0.743; scale-y: 0.743; }
        frame 63 { x: 29.8; y: 115.1; skew-x: -23; skew-y: -23; scale-x: 0.744; scale-y: 0.744; }
        frame 64 { x: 31.4; y: 113.3; skew-x: -13.7; skew-y: -13.7; scale-x: 0.746; scale-y: 0.746; }
        frame 65 { x: 33.1; y: 111.5; skew-x: -4.7; skew-y: -4.7; scale-x: 0.748; scale-y: 0.748; }
        frame 66 { x: 35.1; y: 110; skew-x: 4.3; skew-y: 4.3; scale-x: 0.75; scale-y: 0.75; }
        frame 67 { x: 35; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.749; scale-y: 0.749; }
        frame 68 { x: 34.8; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 34.5; }
        frame 70 { x: 34.4; }
        frame 71 { x: 34.1; scale-x: 0.75; scale-y: 0.75; }
        frame 72 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 34.6; y: 109.2; skew-x: 6; skew-y: 6; scale-x: 0.749; scale-y: 0.749; }
        frame 74 { x: 35.1; y: 108.7; skew-x: 7.8; skew-y: 7.8; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 35.7; y: 108; skew-x: 9.8; skew-y: 9.8; }
        frame 76 { x: 36.3; y: 107.5; skew-x: 11.6; skew-y: 11.6; }
        frame 77 { x: 36.6; y: 107; skew-x: 13; skew-y: 13; }
        frame 78 { x: 37; y: 106.5; skew-x: 14.5; skew-y: 14.5; }
        frame 79 { x: 37.4; y: 106; skew-x: 16; skew-y: 16; scale-x: 0.748; scale-y: 0.748; }
        frame 80 { x: 37.6; y: 105.5; skew-x: 17.6; skew-y: 17.6; scale-x: 0.749; scale-y: 0.749; }
        frame 81 { x: 36.9; y: 107; skew-x: 13.1; skew-y: 13.1; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 36; y: 108.4; skew-x: 8.6; skew-y: 8.6; }
        frame 83 { x: 35.1; y: 110; skew-x: 4.3; skew-y: 4.3; scale-x: 0.75; scale-y: 0.75; }
        frame 84 { x: 35.3; y: 109.3; skew-x: 6.3; skew-y: 6.3; scale-x: 0.749; scale-y: 0.749; }
        frame 85 { x: 35.5; y: 108.8; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 35.8; y: 108.1; skew-x: 10.5; skew-y: 10.5; }
        frame 87 { x: 36; y: 107.5; skew-x: 12.7; skew-y: 12.7; }
        frame 88 { x: 35.7; y: 107.8; skew-x: 11.1; skew-y: 11.1; }
        frame 89 { x: 35.5; y: 108.2; skew-x: 9.8; skew-y: 9.8; }
        frame 90 { x: 35.4; y: 108.7; skew-x: 8.3; skew-y: 8.3; }
        frame 91 { x: 35.2; y: 109; skew-x: 7; skew-y: 7; }
        frame 92 { x: 35; y: 109.3; skew-x: 6.3; skew-y: 6.3; }
        frame 93 { x: 34.7; y: 109.5; skew-x: 5.5; skew-y: 5.5; }
        frame 94 { x: 34.5; y: 109.8; skew-x: 4.8; skew-y: 4.8; }
        frame 95 { x: 34.1; y: 110; skew-x: 4.3; skew-y: 4.3; scale-x: 0.75; scale-y: 0.75; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { y: 110.3; skew-x: 1.1; skew-y: 1.1; scale-x: 0.749; scale-y: 0.749; }
        frame 98 { x: 34.2; y: 110.5; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 34.3; y: 110.9; skew-x: -4.7; skew-y: -4.7; }
        frame 100 { x: 34.5; y: 111.4; skew-x: -7.9; skew-y: -7.9; }
        frame 101 { x: 34; y: 111.8; skew-x: -10.2; skew-y: -10.2; }
        frame 102 { x: 33.5; y: 112.2; skew-x: -12.4; skew-y: -12.4; scale-x: 0.748; scale-y: 0.748; }
        frame 103 { x: 33.1; y: 112.5; skew-x: -14.7; skew-y: -14.7; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 32.8; y: 113; skew-x: -17.2; skew-y: -17.2; scale-x: 0.749; scale-y: 0.749; }
        frame 105 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.748; scale-y: 0.748; }
        frame 106 { scale-x: -10000; scale-y: -10000; }
        frame 107 { scale-x: 0.747; scale-y: 0.747; }
        frame 108 { scale-x: 0.748; scale-y: 0.748; }
        frame 109 { x: 32.4; y: 113.6; skew-x: -21.2; skew-y: -21.2; scale-x: 0.747; scale-y: 0.747; }
        frame 110 { x: 32.1; y: 114.1; skew-x: -25.5; skew-y: -25.5; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 31.8; y: 114.7; skew-x: -29.7; skew-y: -29.7; }
        frame 112 { x: 31.6; y: 115.2; skew-x: -34; skew-y: -34; scale-x: 0.748; scale-y: 0.748; }
        frame 113 { x: 33.6; y: 114.8; skew-x: -48.5; skew-y: -48.5; scale-x: 0.746; scale-y: 0.746; }
        frame 114 { x: 36.5; y: 113.8; skew-x: -62.8; skew-y: -62.8; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 40.2; y: 112.5; skew-x: -77.4; skew-y: -77.4; scale-x: 0.745; scale-y: 0.745; }
        frame 116 { x: 44.4; y: 110.5; skew-x: -91.7; skew-y: -91.7; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 43.3; y: 102.5; skew-x: -111.2; skew-y: -111.2; scale-x: 0.744; scale-y: 0.744; }
        frame 118 { x: 42.4; y: 92.6; skew-x: -131.1; skew-y: -131.1; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 43.9; y: 91.8; skew-x: -136.8; skew-y: -136.8; scale-x: 0.743; scale-y: 0.743; }
        frame 120 { x: 45.3; y: 91; skew-x: -142.8; skew-y: -142.8; scale-x: 0.742; scale-y: 0.742; }
        frame 121 { x: 46.6; y: 90.2; skew-x: -148.5; skew-y: -148.5; scale-x: 0.743; scale-y: 0.743; }
        frame 122 { x: 47; y: 99.3; skew-x: -144; skew-y: -143; scale-x: -10000; scale-y: 0.744; }
        frame 123 { x: 47.3; y: 108.3; skew-x: -139.3; skew-y: -137.3; scale-x: 0.745; scale-y: 0.745; }
        frame 124 { x: 47.5; y: 117.2; skew-x: -134.8; skew-y: -131.8; scale-x: 0.746; scale-y: 0.746; }
        frame 125 { x: 47.8; y: 126.1; skew-x: -130.2; skew-y: -126.2; scale-x: 0.748; scale-y: 0.749; }
        frame 126 { x: 46; y: 133.6; skew-x: -98.6; skew-y: -94.6; scale-x: -10000; scale-y: 0.748; }
        frame 127 { x: 45.4; y: 131.6; skew-x: -105; skew-y: -100.9; scale-x: 0.747; scale-y: -10000; }
        frame 128 { x: 45; y: 129.4; skew-x: -111.5; skew-y: -107.5; scale-x: -10000; }
        frame 129 { x: 45.3; y: 130.9; skew-x: -107.2; skew-y: -103.2; scale-y: 0.747; }
        frame 130 { x: 45.5; y: 132.3; skew-x: -102.9; skew-y: -98.9; scale-y: 0.748; }
        frame 131 { x: 46; y: 133.6; skew-x: -98.6; skew-y: -94.6; scale-x: 0.748; scale-y: -10000; }
        frame 132 { x: 34.1; y: 110; skew-x: 4.3; skew-y: 4.3; scale-x: 0.75; scale-y: 0.75; }
        frame 133 { x: 35; y: 109.9; skew-x: -10000; skew-y: -10000; scale-x: 0.749; scale-y: 0.749; }
        frame 134 { x: 36; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 36.9; }
        frame 136 { x: 37.8; y: 110; scale-x: 0.75; scale-y: 0.75; }
        frame 137 { x: 39.5; y: 110.4; skew-x: 0; skew-y: 0; scale-x: 0.749; scale-y: 0.749; }
        frame 138 { x: 41.5; y: 110.9; skew-x: -4.2; skew-y: -4.2; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 43.4; y: 111.5; skew-x: -8.4; skew-y: -8.4; }
        frame 140 { x: 45.5; y: 112.1; skew-x: -12.9; skew-y: -12.9; }
        frame 141 { x: 48; y: -10000; skew-x: -14.7; skew-y: -14.7; scale-x: 0.748; scale-y: 0.748; }
        frame 142 { x: 50.5; skew-x: -16.5; skew-y: -16.5; scale-x: 0.747; scale-y: 0.747; }
        frame 143 { x: 53; y: 112.3; skew-x: -18.4; skew-y: -18.4; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 55.5; y: -10000; skew-x: -20.2; skew-y: -20.2; scale-x: 0.746; scale-y: 0.746; }
        frame 145 { x: 58.1; y: 112.4; skew-x: -22.1; skew-y: -22.1; scale-x: 0.747; scale-y: 0.747; }
        frame 146 { x: 59.3; y: 113.2; skew-x: -26.7; skew-y: -26.7; scale-x: 0.746; scale-y: 0.746; }
        frame 147 { x: 60.5; y: 114.1; skew-x: -31.2; skew-y: -31.2; scale-x: 0.745; scale-y: 0.745; }
        frame 148 { x: 62; y: 114.8; skew-x: -35.7; skew-y: -35.7; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 63.5; y: 115.6; skew-x: -40.3; skew-y: -40.3; }
        frame 150 { x: 65; y: 116.3; skew-x: -44.9; skew-y: -44.9; scale-x: 0.746; scale-y: 0.746; }
        frame 151 { x: 65.2; y: 117.3; skew-x: -49; skew-y: -49; scale-x: 0.744; scale-y: 0.744; }
        frame 152 { x: 65.3; y: 118.3; skew-x: -53; skew-y: -53; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 65.5; y: 119.2; skew-x: -57.1; skew-y: -57.1; }
        frame 154 { x: 65.8; y: 120; skew-x: -61.1; skew-y: -61.1; }
        frame 155 { x: 65.7; y: 120.3; skew-x: -62.8; skew-y: -62.8; scale-x: 0.743; scale-y: 0.743; }
        frame 156 { x: 65.5; y: 120.6; skew-x: -64.4; skew-y: -64.4; scale-x: 0.744; scale-y: 0.744; }
        frame 157 { x: 65.2; y: 121; skew-x: -66.1; skew-y: -66.1; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 65; y: 121.3; skew-x: -67.8; skew-y: -67.8; }
        frame 159 { x: 64.8; y: 121.5; skew-x: -69.3; skew-y: -69.3; scale-x: 0.745; scale-y: 0.745; }
        frame 160 { x: 61.6; y: 120.8; skew-x: -68.4; skew-y: -68.4; scale-x: 0.744; scale-y: 0.744; }
        frame 161 { x: 58.3; y: 120.3; skew-x: -67.6; skew-y: -67.6; scale-x: 0.743; scale-y: 0.743; }
        frame 162 { x: 54.9; y: 119.6; skew-x: -66.6; skew-y: -66.6; scale-x: 0.744; scale-y: 0.744; }
        frame 163 { x: 50.8; y: 120.7; skew-x: -69.1; skew-y: -69.1; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 46.5; y: 121.9; skew-x: -71.6; skew-y: -71.6; scale-x: 0.745; scale-y: 0.745; }
        frame 165 { x: 42.5; y: 121.1; skew-x: -63.8; skew-y: -63.8; scale-x: 0.744; scale-y: 0.744; }
        frame 166 { x: 38.6; y: 120.2; skew-x: -55.8; skew-y: -55.8; scale-x: 0.743; scale-y: 0.743; }
        frame 167 { x: 35; y: 119.3; skew-x: -48; skew-y: -48; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 31.7; y: 118; skew-x: -40; skew-y: -40; scale-x: 0.742; scale-y: 0.742; }
        frame 169 { x: 28.7; y: 117; skew-x: -32.2; skew-y: -32.2; scale-x: 0.743; scale-y: 0.743; }
        frame 170 { x: 29.8; y: 115.1; skew-x: -23; skew-y: -23; scale-x: 0.744; scale-y: 0.744; }
        frame 171 { x: 31.4; y: 113.3; skew-x: -13.7; skew-y: -13.7; scale-x: 0.746; scale-y: 0.746; }
        frame 172 { x: 33.1; y: 111.5; skew-x: -4.7; skew-y: -4.7; scale-x: 0.748; scale-y: 0.748; }
        frame 173 { x: 35.1; y: 110; skew-x: 4.3; skew-y: 4.3; scale-x: 0.75; scale-y: 0.75; }
        frame 174 { x: 35; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.749; scale-y: 0.749; }
        frame 175 { x: 34.8; scale-x: -10000; scale-y: -10000; }
        frame 176 { x: 34.5; }
        frame 177 { x: 34.4; }
        frame 178 { x: 34.1; scale-x: 0.75; scale-y: 0.75; }
        frame 179 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 34.6; y: 109.2; skew-x: 6; skew-y: 6; scale-x: 0.749; scale-y: 0.749; }
        frame 181 { x: 35.1; y: 108.7; skew-x: 7.8; skew-y: 7.8; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 35.7; y: 108; skew-x: 9.8; skew-y: 9.8; }
        frame 183 { x: 36.3; y: 107.5; skew-x: 11.6; skew-y: 11.6; }
        frame 184 { x: 36.6; y: 107; skew-x: 13; skew-y: 13; }
        frame 185 { x: 37; y: 106.5; skew-x: 14.5; skew-y: 14.5; }
        frame 186 { x: 37.4; y: 106; skew-x: 16; skew-y: 16; scale-x: 0.748; scale-y: 0.748; }
        frame 187 { x: 37.6; y: 105.5; skew-x: 17.6; skew-y: 17.6; scale-x: 0.749; scale-y: 0.749; }
        frame 188 { x: 36.9; y: 107; skew-x: 13.1; skew-y: 13.1; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 36; y: 108.4; skew-x: 8.6; skew-y: 8.6; }
        frame 190 { x: 35.1; y: 110; skew-x: 4.3; skew-y: 4.3; scale-x: 0.75; scale-y: 0.75; }
        frame 191 { x: 35.3; y: 109.3; skew-x: 6.3; skew-y: 6.3; scale-x: 0.749; scale-y: 0.749; }
        frame 192 { x: 35.5; y: 108.8; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 35.8; y: 108.1; skew-x: 10.5; skew-y: 10.5; }
        frame 194 { x: 36; y: 107.5; skew-x: 12.7; skew-y: 12.7; }
        frame 195 { x: 35.7; y: 107.8; skew-x: 11.1; skew-y: 11.1; }
        frame 196 { x: 35.5; y: 108.2; skew-x: 9.8; skew-y: 9.8; }
        frame 197 { x: 35.4; y: 108.7; skew-x: 8.3; skew-y: 8.3; }
        frame 198 { x: 35.2; y: 109; skew-x: 7; skew-y: 7; }
        frame 199 { x: 35; y: 109.3; skew-x: 6.3; skew-y: 6.3; }
        frame 200 { x: 34.7; y: 109.5; skew-x: 5.5; skew-y: 5.5; }
        frame 201 { x: 34.5; y: 109.8; skew-x: 4.8; skew-y: 4.8; }
        frame 202 { x: 34.1; y: 110; skew-x: 4.3; skew-y: 4.3; scale-x: 0.75; scale-y: 0.75; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 204 { x: 34.4; y: 109.7; skew-x: 5; skew-y: 5; scale-x: 0.749; scale-y: 0.749; }
        frame 205 { x: 34.5; y: 109.4; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 34.7; y: 109.2; skew-x: 6.6; skew-y: 6.6; }
        frame 207 { x: 35; y: 109.1; skew-x: 7.5; skew-y: 7.5; }
        frame 208 { x: 35.1; y: 108.8; skew-x: 8.3; skew-y: 8.3; }
        frame 209 { x: 35.4; y: 108.7; skew-x: 9.1; skew-y: 9.1; }
        frame 210 { x: 35.1; y: 109.1; skew-x: 7.8; skew-y: 7.8; }
        frame 211 { x: 34.7; y: 109.3; skew-x: 6.6; skew-y: 6.6; }
        frame 212 { x: 34.5; y: 109.7; skew-x: 5.5; skew-y: 5.5; }
        frame 213 { x: 34.1; y: 110; skew-x: 4.3; skew-y: 4.3; scale-x: 0.75; scale-y: 0.75; }
        frame 214 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_innerarm_hand";
        frame-count: 215;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 96 { x: 6.9; y: 62.2; skew-x: 60.4; skew-y: 60.4; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_ZOMBIE_INNERARM_HAND; }
        frame 97 { x: 11.3; y: 63.9; skew-x: 53.9; skew-y: 53.9; scale-x: 0.797; scale-y: 0.797; cel: -10000; image: none; }
        frame 98 { x: 15.5; y: 65.7; skew-x: 47.6; skew-y: 47.6; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 19.9; y: 67.7; skew-x: 41.1; skew-y: 41.1; }
        frame 100 { x: 24.1; y: 69.8; skew-x: 34.6; skew-y: 34.6; scale-x: 0.798; scale-y: 0.798; }
        frame 101 { x: 24.9; y: 70.7; skew-x: 24.6; skew-y: 24.6; scale-x: 0.796; scale-y: 0.796; }
        frame 102 { x: 26; y: 71.8; skew-x: 14.6; skew-y: 14.6; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 27.1; y: 73.2; skew-x: 4.6; skew-y: 4.6; }
        frame 104 { x: 28.6; y: 74.8; skew-x: -5.2; skew-y: -5.2; scale-x: 0.795; scale-y: 0.795; }
        frame 105 { x: 26.9; y: 75.5; skew-x: -14; skew-y: -14; scale-x: 0.794; scale-y: 0.794; }
        frame 106 { x: 25.4; y: 76.3; skew-x: -23; skew-y: -23; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 24.1; y: 77.3; skew-x: -32; skew-y: -32; }
        frame 108 { x: 23.2; y: 78.3; skew-x: -41; skew-y: -41; scale-x: 0.793; scale-y: 0.793; }
        frame 109 { x: 22.6; y: 79.5; skew-x: -50; skew-y: -50; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 22.1; y: 80.5; skew-x: -59; skew-y: -59; }
        frame 111 { x: -10000; y: 81.7; skew-x: -68.1; skew-y: -68.1; }
        frame 112 { x: 22.3; y: 82.5; skew-x: -76.9; skew-y: -76.9; scale-x: 0.794; scale-y: 0.794; }
        frame 113 { x: 18.2; y: 84.2; skew-x: -81.8; skew-y: -81.8; scale-x: 0.793; scale-y: 0.793; }
        frame 114 { x: 14.1; y: 85.9; skew-x: -86.6; skew-y: -86.6; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 10.1; y: 87.5; skew-x: -91.2; skew-y: -91.2; }
        frame 116 { x: 6.2; y: 89.2; skew-x: -96.2; skew-y: -96.2; }
        frame 117 { x: 1.7; y: 94.4; skew-x: -118.7; skew-y: -118.7; scale-x: 0.791; scale-y: 0.791; }
        frame 118 { x: -2; y: 97.8; skew-x: -141.3; skew-y: -141.3; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 0.4; y: 108; skew-x: -131; skew-y: -131; scale-x: 0.79; scale-y: 0.79; }
        frame 120 { x: 3.1; y: 117.9; skew-x: -120.7; skew-y: -120.7; scale-x: 0.789; scale-y: 0.789; }
        frame 121 { x: 5.8; y: 127.5; skew-x: -110.4; skew-y: -110.4; scale-x: 0.79; scale-y: 0.79; }
        frame 122 { x: 5.1; y: 128.4; skew-x: -104.7; skew-y: -104.7; scale-x: 0.789; scale-y: 0.789; }
        frame 123 { x: 4.4; y: 129.2; skew-x: -99; skew-y: -99; scale-x: -10000; scale-y: -10000; }
        frame 124 { x: 3.9; y: 130; skew-x: -93.4; skew-y: -93.4; }
        frame 125 { x: 3.3; y: 130.7; skew-x: -87.8; skew-y: -87.8; }
        frame 126 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 127 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_innerarm_lower";
        frame-count: 215;
        frame 0 { x: 23.8; y: 58.1; skew-x: 71.7; skew-y: 71.7; scale-x: 0.849; scale-y: 0.849; image: IMAGE_REANIM_ZOMBIE_LADDER_INNERARM_LOWER; }
        frame 1 { x: 24.5; y: 57.4; skew-x: 72.8; skew-y: 72.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 25; y: 56.6; skew-x: 73.8; skew-y: 73.8; }
        frame 3 { x: 25.6; y: 56; skew-x: 74.8; skew-y: 74.8; }
        frame 4 { x: 26.2; y: 55.1; skew-x: 75.7; skew-y: 75.7; }
        frame 5 { x: 26.8; y: 54.5; skew-x: 76.7; skew-y: 76.7; }
        frame 6 { x: 27.4; y: 53.5; skew-x: 77.5; skew-y: 77.5; }
        frame 7 { x: 26.8; y: 54.3; skew-x: 76.7; skew-y: 76.7; }
        frame 8 { x: 26.3; y: 55.1; skew-x: 75.7; skew-y: 75.7; }
        frame 9 { x: 25.6; y: 55.9; skew-x: 74.8; skew-y: 74.8; }
        frame 10 { x: 25; y: 56.6; skew-x: 73.8; skew-y: 73.8; }
        frame 11 { x: 24.4; y: 57.4; skew-x: 72.8; skew-y: 72.8; }
        frame 12 { x: 23.8; y: 58.1; skew-x: 71.7; skew-y: 71.7; }
        frame 13 { x: 23.5; y: 58.8; skew-x: 70.8; skew-y: 70.8; }
        frame 14 { x: 23.2; y: 59.4; skew-x: 69.8; skew-y: 69.8; }
        frame 15 { x: 22.9; y: 60; skew-x: 68.7; skew-y: 68.7; }
        frame 16 { x: 22.6; y: 60.5; skew-x: 67.7; skew-y: 67.7; }
        frame 17 { x: 22.3; y: 61.1; skew-x: 66.7; skew-y: 66.7; }
        frame 18 { x: 21.9; y: 61.7; skew-x: 65.5; skew-y: 65.5; }
        frame 19 { x: 22.2; y: 61.2; skew-x: 66.7; skew-y: 66.7; }
        frame 20 { x: 22.5; y: 60.5; skew-x: 67.7; skew-y: 67.7; }
        frame 21 { x: 22.8; y: 60; skew-x: 68.7; skew-y: 68.7; }
        frame 22 { x: 23.1; y: 59.4; skew-x: 69.8; skew-y: 69.8; }
        frame 23 { x: 23.4; y: 58.8; skew-x: 70.8; skew-y: 70.8; }
        frame 24 { x: 23.8; y: 58.1; skew-x: 71.7; skew-y: 71.7; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 23.9; skew-x: 67; skew-y: 67.5; scale-y: 0.865; }
        frame 27 { x: 23.8; y: 58; skew-x: 62.3; skew-y: 63.1; scale-y: 0.881; }
        frame 28 { x: 23.6; skew-x: 57.4; skew-y: 58.6; scale-y: 0.897; }
        frame 29 { x: 23.4; y: 57.8; skew-x: 52.6; skew-y: 54.2; scale-x: 0.85; scale-y: 0.914; }
        frame 30 { x: 23.7; y: 56.2; skew-x: 50.9; skew-y: 53; scale-x: 0.849; scale-y: 0.93; }
        frame 31 { x: 24.1; y: 54.6; skew-x: 49.4; skew-y: 51.9; scale-x: 0.85; scale-y: 0.948; }
        frame 32 { x: 24.2; y: 53; skew-x: 47.7; skew-y: 50.6; scale-x: -10000; scale-y: 0.965; }
        frame 33 { x: 24.4; y: 51.3; skew-x: 46; skew-y: 49.3; scale-x: 0.852; scale-y: 0.984; }
        frame 34 { x: 24.5; y: 51.2; skew-x: 43.9; skew-y: 47.2; scale-x: 0.85; scale-y: 0.983; }
        frame 35 { x: 24.4; y: 51.1; skew-x: 41.7; skew-y: 45; scale-x: -10000; scale-y: 0.982; }
        frame 36 { x: 24.5; y: 51; skew-x: 39.7; skew-y: 43; scale-y: -10000; }
        frame 37 { x: 24.3; y: -10000; skew-x: 37.7; skew-y: 40.9; scale-x: 0.849; }
        frame 38 { x: -10000; skew-x: 35.5; skew-y: 38.7; scale-x: 0.85; scale-y: 0.983; }
        frame 39 { x: 23.6; y: 52.2; skew-x: 39.4; skew-y: 42.7; scale-x: 0.849; scale-y: 0.981; }
        frame 40 { x: 22.8; y: 53.5; skew-x: 43.2; skew-y: 46.4; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 21.9; y: 54.8; skew-x: 47; skew-y: 50.2; scale-x: 0.848; scale-y: 0.98; }
        frame 42 { x: 21; y: 56.2; skew-x: 50.7; skew-y: 54; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 20.2; y: 57.5; skew-x: 54.5; skew-y: 57.8; scale-x: 0.849; scale-y: 0.981; }
        frame 44 { x: 18.1; y: 59.3; skew-x: 53; skew-y: 56.2; scale-x: 0.847; scale-y: 0.979; }
        frame 45 { x: 16; y: 60.9; skew-x: 51.2; skew-y: 54.5; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 13.8; y: 62.6; skew-x: 49.5; skew-y: 52.7; scale-x: 0.846; scale-y: 0.978; }
        frame 47 { x: 11.9; y: 64.2; skew-x: 47.8; skew-y: 51; scale-x: 0.847; scale-y: 0.979; }
        frame 48 { x: 13.7; y: 63.1; skew-x: 50; skew-y: 53.2; scale-x: 0.846; scale-y: 0.978; }
        frame 49 { x: 15.5; y: 61.9; skew-x: 52.2; skew-y: 55.5; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 17.4; y: 60.9; skew-x: 54.5; skew-y: 57.7; scale-x: 0.847; scale-y: 0.979; }
        frame 51 { x: 19.2; y: 59.7; skew-x: 56.7; skew-y: 60; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 20.8; y: 58.6; skew-x: 58.8; skew-y: 62.1; scale-x: 0.849; scale-y: 0.981; }
        frame 53 { x: 21.7; y: 57; skew-x: 56; skew-y: 59.3; scale-x: 0.848; scale-y: 0.98; }
        frame 54 { x: 22.6; y: 55.1; skew-x: 53.2; skew-y: 56.5; scale-x: 0.849; scale-y: 0.981; }
        frame 55 { x: 23.5; y: 53.5; skew-x: 50.2; skew-y: 53.5; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 24.6; y: 51.9; skew-x: 47.4; skew-y: 50.7; scale-y: 0.982; }
        frame 57 { x: 25.4; y: 50.2; skew-x: 44.5; skew-y: 47.8; scale-x: 0.851; scale-y: 0.983; }
        frame 58 { x: 25.6; y: 50.3; skew-x: 47.5; skew-y: 50.7; scale-x: 0.85; scale-y: 0.982; }
        frame 59 { x: 25.9; y: 50.4; skew-x: 50.5; skew-y: 53.8; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 26; y: 50.6; skew-x: 53.5; skew-y: 56.8; }
        frame 61 { x: 26.3; y: 50.8; skew-x: 56.5; skew-y: 59.8; scale-y: 0.983; }
        frame 62 { x: -10000; y: 50.9; skew-x: 59.5; skew-y: 62.8; scale-x: 0.851; scale-y: 0.984; }
        frame 63 { x: 24.6; y: 53.6; skew-x: 54.4; skew-y: 57.3; scale-x: 0.849; scale-y: 0.965; }
        frame 64 { x: 22.8; y: 56.4; skew-x: 49.4; skew-y: 51.8; scale-x: -10000; scale-y: 0.947; }
        frame 65 { x: 21; y: 59.3; skew-x: 44.1; skew-y: 46.2; scale-x: 0.848; scale-y: 0.929; }
        frame 66 { x: 19.3; y: 62.5; skew-x: 39; skew-y: 40.6; scale-x: 0.849; scale-y: 0.912; }
        frame 67 { x: 20.4; y: 61.4; skew-x: 45.5; skew-y: 46.9; scale-x: 0.847; scale-y: 0.898; }
        frame 68 { x: 21.5; y: 60.4; skew-x: 52.2; skew-y: 53.2; scale-x: 0.848; scale-y: 0.886; }
        frame 69 { x: 22.4; y: 59.5; skew-x: 58.7; skew-y: 59.3; scale-x: -10000; scale-y: 0.873; }
        frame 70 { x: 23.2; y: 58.8; skew-x: 65.3; skew-y: 65.6; scale-y: 0.861; }
        frame 71 { x: 23.8; y: 58.1; skew-x: 71.7; skew-y: 71.7; scale-x: 0.849; scale-y: 0.849; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 26; y: 55.8; skew-x: 75.7; skew-y: 75.7; }
        frame 74 { x: 28.2; y: 53.4; skew-x: 79.3; skew-y: 79.3; }
        frame 75 { x: 30.3; y: 51; skew-x: 83.1; skew-y: 83.1; scale-x: 0.848; scale-y: 0.848; }
        frame 76 { x: 32.4; y: 48.6; skew-x: 87.1; skew-y: 87.1; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 36.5; y: 47.5; skew-x: 92.4; skew-y: 92.4; scale-x: 0.847; scale-y: 0.847; }
        frame 78 { x: 40.4; y: 46.5; skew-x: 97.9; skew-y: 97.9; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 44.1; y: 45.5; skew-x: 103.4; skew-y: 103.4; scale-x: 0.846; scale-y: 0.846; }
        frame 80 { x: 48; y: 44.6; skew-x: 109; skew-y: 109; scale-x: 0.847; scale-y: 0.847; }
        frame 81 { x: 38.8; y: 51.6; skew-x: 74; skew-y: 74; scale-x: 0.846; scale-y: 0.846; }
        frame 82 { x: 26.4; y: 61.3; skew-x: 38.9; skew-y: 38.9; scale-x: 0.844; scale-y: 0.844; }
        frame 83 { x: 13; y: 75.3; skew-x: 3.9; skew-y: 3.9; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 12.8; y: 75.8; skew-x: 1.6; skew-y: 1.6; }
        frame 85 { x: 12.7; y: 76.3; skew-x: -0.3; skew-y: -0.3; }
        frame 86 { x: 12.5; y: 76.8; skew-x: -2.6; skew-y: -2.6; }
        frame 87 { x: 12.4; y: 77.5; skew-x: -4.6; skew-y: -4.6; }
        frame 88 { x: 15.5; y: 73.3; skew-x: 2.8; skew-y: 2.8; }
        frame 89 { x: 18.5; y: 69.3; skew-x: 10.6; skew-y: 10.6; scale-x: 0.843; scale-y: 0.843; }
        frame 90 { x: 21.7; y: 65.6; skew-x: 18.1; skew-y: 18.1; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 24.7; y: 62; skew-x: 25.9; skew-y: 25.9; scale-x: 0.845; scale-y: 0.845; }
        frame 92 { x: -10000; y: 60.5; skew-x: 37.4; skew-y: 37.4; scale-x: 0.844; scale-y: 0.844; }
        frame 93 { x: 24.5; y: 59.4; skew-x: 48.9; skew-y: 48.9; scale-x: 0.846; scale-y: 0.846; }
        frame 94 { x: 24.2; y: 58.6; skew-x: 60.3; skew-y: 60.3; scale-x: 0.847; scale-y: 0.847; }
        frame 95 { x: 23.8; y: 58.1; skew-x: 71.7; skew-y: 71.7; scale-x: 0.849; scale-y: 0.849; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 25.1; y: 56.2; skew-x: 54.5; skew-y: 54.5; scale-x: 0.847; scale-y: 0.847; }
        frame 98 { x: 25.9; y: 55; skew-x: 37.1; skew-y: 37.1; scale-x: 0.846; scale-y: 0.846; }
        frame 99 { x: 26.6; y: 55.1; skew-x: 19.6; skew-y: 19.6; scale-x: 0.845; scale-y: 0.845; }
        frame 100 { x: 27.2; y: 56.1; skew-x: 2.4; skew-y: 2.4; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 26.2; y: 55.1; skew-x: -2.9; skew-y: -2.2; scale-y: 0.872; }
        frame 102 { x: 24.9; y: 54.1; skew-x: -8; skew-y: -6.7; scale-x: 0.846; scale-y: 0.899; }
        frame 103 { x: 23.8; y: 53.2; skew-x: -13.2; skew-y: -11.2; scale-x: -10000; scale-y: 0.926; }
        frame 104 { x: 22.7; y: 52.4; skew-x: -18.5; skew-y: -15.8; scale-x: 0.847; scale-y: 0.952; }
        frame 105 { x: 21.4; y: 54.5; skew-x: -24.1; skew-y: -21.4; scale-x: 0.845; scale-y: 0.95; }
        frame 106 { x: 20.1; y: 56.8; skew-x: -30; skew-y: -27.4; scale-x: 0.843; scale-y: 0.948; }
        frame 107 { x: 19; y: 59; skew-x: -35.8; skew-y: -33.2; scale-x: 0.841; scale-y: 0.946; }
        frame 108 { x: 17.9; y: 61.5; skew-x: -41.6; skew-y: -39; scale-x: -10000; scale-y: 0.945; }
        frame 109 { x: 14.9; y: 64.3; skew-x: -48.3; skew-y: -45.7; scale-x: 0.839; scale-y: 0.943; }
        frame 110 { x: 12.2; y: 67.2; skew-x: -55.1; skew-y: -52.3; scale-x: 0.84; scale-y: 0.942; }
        frame 111 { x: 9.5; y: 70.2; skew-x: -61.7; skew-y: -59; scale-x: 0.839; scale-y: -10000; }
        frame 112 { x: 7.1; y: 73; skew-x: -68.4; skew-y: -65.8; scale-x: 0.84; scale-y: 0.943; }
        frame 113 { x: 2.3; y: 77.6; skew-x: -76.9; skew-y: -74.3; scale-x: 0.839; scale-y: 0.941; }
        frame 114 { x: -2; y: 82.1; skew-x: -85.4; skew-y: -82.8; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: -6.1; y: 86.4; skew-x: -93.9; skew-y: -91.3; }
        frame 116 { x: -10; y: 90.7; skew-x: -102.2; skew-y: -99.6; }
        frame 117 { x: -13.2; y: 100.1; skew-x: -117.8; skew-y: -115.2; scale-x: 0.838; scale-y: 0.94; }
        frame 118 { x: -15.9; y: 109.1; skew-x: -133.5; skew-y: -130.8; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: -16.6; y: 113.9; skew-x: -119.1; skew-y: -114.4; scale-x: 0.823; scale-y: 0.925; }
        frame 120 { x: -10000; y: 118.1; skew-x: -104.7; skew-y: -98.2; scale-x: 0.808; scale-y: 0.913; }
        frame 121 { x: -15.6; y: 121.8; skew-x: -90.4; skew-y: -81.8; scale-x: 0.794; scale-y: 0.9; }
        frame 122 { x: -19.1; y: 121.3; skew-x: -100; skew-y: -90; scale-x: 0.786; scale-y: 0.891; }
        frame 123 { x: -22.5; y: 120.8; skew-x: -109.4; skew-y: -98.1; scale-x: 0.777; scale-y: 0.885; }
        frame 124 { x: -25.7; y: 120.1; skew-x: -118.9; skew-y: -106.1; scale-x: 0.769; scale-y: 0.877; }
        frame 125 { x: -28.6; y: 119.3; skew-x: -128.4; skew-y: -114.4; scale-x: 0.761; scale-y: 0.87; }
        frame 126 { x: -29; y: 118.6; skew-x: -126.5; skew-y: -112.5; scale-x: 0.76; scale-y: 0.869; }
        frame 127 { x: -29.3; y: 118.1; skew-x: -124.7; skew-y: -110.7; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -29.7; y: 117.3; skew-x: -122.9; skew-y: -108.9; }
        frame 129 { x: -30.1; y: 116.8; skew-x: -121.1; skew-y: -107.1; scale-x: 0.761; scale-y: 0.87; }
        frame 130 { x: -29.4; y: 118.2; skew-x: -124.7; skew-y: -110.7; scale-x: 0.76; scale-y: 0.869; }
        frame 131 { x: -28.6; y: 119.3; skew-x: -128.4; skew-y: -114.4; scale-x: 0.761; scale-y: 0.87; }
        frame 132 { x: 19.5; y: 67.7; skew-x: 1.5; skew-y: 1.5; scale-x: 0.847; scale-y: 0.847; }
        frame 133 { x: 19.9; y: 66.8; skew-x: 3.6; skew-y: 3.6; scale-x: 0.846; scale-y: 0.846; }
        frame 134 { x: 20.2; y: 65.8; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 20.6; y: 64.8; skew-x: 7.8; skew-y: 7.8; }
        frame 136 { x: 21; y: 63.9; skew-x: 10.1; skew-y: 10.1; scale-x: 0.847; scale-y: 0.847; }
        frame 137 { x: 21.6; y: 61.3; skew-x: 13.8; skew-y: 13.8; scale-x: 0.846; scale-y: 0.846; }
        frame 138 { x: 22.3; y: 58.6; skew-x: 17.6; skew-y: 17.6; scale-x: 0.845; scale-y: 0.845; }
        frame 139 { x: 22.9; y: 56; skew-x: 21.4; skew-y: 21.4; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 23.6; y: 53.5; skew-x: 25.2; skew-y: 25.2; scale-x: 0.846; scale-y: 0.846; }
        frame 141 { x: 23.7; y: 52.9; skew-x: 27.1; skew-y: 27.1; scale-x: 0.845; scale-y: 0.845; }
        frame 142 { x: 23.8; y: 52.3; skew-x: 28.9; skew-y: 28.9; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: -10000; y: 51.8; skew-x: 30.9; skew-y: 30.9; scale-x: 0.844; scale-y: 0.844; }
        frame 144 { x: 24.1; y: 51.3; skew-x: 32.9; skew-y: 32.9; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: -10000; y: 50.7; skew-x: 34.8; skew-y: 34.8; scale-x: 0.846; scale-y: 0.846; }
        frame 146 { x: 23.5; y: 53.9; skew-x: 27.9; skew-y: 27.9; scale-x: 0.844; scale-y: 0.844; }
        frame 147 { x: 23; y: 57.1; skew-x: 21.1; skew-y: 21.1; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 22.6; y: 60.5; skew-x: 14.4; skew-y: 14.4; }
        frame 149 { x: 22; y: 64.2; skew-x: 7.6; skew-y: 7.6; }
        frame 150 { x: 21.7; y: 67.8; skew-x: 0.9; skew-y: 0.9; }
        frame 151 { x: 21.1; y: 69.5; skew-x: 0.8; skew-y: 0.8; }
        frame 152 { x: 20.6; y: 71; skew-x: -10000; skew-y: -10000; }
        frame 153 { x: 20.1; y: 72.5; }
        frame 154 { x: 19.7; y: 73.8; skew-x: 0.9; skew-y: 0.9; }
        frame 155 { x: 20.6; y: 72.6; skew-x: 1; skew-y: 1; scale-x: 0.843; scale-y: 0.843; }
        frame 156 { x: 21.4; y: 71.3; skew-x: 1.1; skew-y: 1.1; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 22.4; y: 70.1; skew-x: 1.3; skew-y: 1.3; }
        frame 158 { x: 23.3; y: 68.7; skew-x: -10000; skew-y: -10000; }
        frame 159 { x: 24.2; y: 67.4; skew-x: 1.6; skew-y: 1.6; scale-x: 0.844; scale-y: 0.844; }
        frame 160 { x: 25.4; y: 65.8; skew-x: 0.3; skew-y: 0.3; scale-x: 0.843; scale-y: 0.843; }
        frame 161 { x: 26.6; y: 64.1; skew-x: -0.6; skew-y: -0.6; scale-x: 0.842; scale-y: 0.842; }
        frame 162 { x: 27.8; y: 62.4; skew-x: -1.8; skew-y: -1.8; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 29; y: 60.8; skew-x: -3.1; skew-y: -3.1; }
        frame 164 { x: 30.3; y: 59.2; skew-x: -4; skew-y: -4; }
        frame 165 { x: 29.9; y: 59.4; skew-x: -3.6; skew-y: -3.6; scale-x: 0.841; scale-y: 0.841; }
        frame 166 { x: 29.2; y: -10000; skew-x: -3.1; skew-y: -3.1; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 28.7; y: 59.5; skew-x: -2.4; skew-y: -2.4; }
        frame 168 { x: 28.2; y: -10000; skew-x: -1.8; skew-y: -1.8; scale-x: 0.84; scale-y: 0.84; }
        frame 169 { x: 27.6; y: 59.7; skew-x: -1.2; skew-y: -1.2; scale-x: -10000; scale-y: -10000; }
        frame 170 { x: 26.3; y: 63.5; skew-x: -1.6; skew-y: -1.6; }
        frame 171 { x: 25.1; y: 67.4; skew-x: -1.9; skew-y: -1.9; }
        frame 172 { x: 23.7; y: 71.3; skew-x: -2.3; skew-y: -2.3; }
        frame 173 { x: 22.5; y: 75; skew-x: -2.5; skew-y: -2.5; scale-x: 0.841; scale-y: 0.841; }
        frame 174 { x: 21.9; y: 73.6; skew-x: -1.8; skew-y: -1.8; scale-x: 0.842; scale-y: 0.842; }
        frame 175 { x: 21.4; y: 72.1; skew-x: -0.9; skew-y: -0.9; scale-x: 0.843; scale-y: 0.843; }
        frame 176 { x: 20.7; y: 70.7; skew-x: -0.1; skew-y: -0.1; scale-x: 0.844; scale-y: 0.844; }
        frame 177 { x: 20.2; y: 69.1; skew-x: 0.6; skew-y: 0.6; scale-x: 0.845; scale-y: 0.845; }
        frame 178 { x: 19.5; y: 67.7; skew-x: 1.5; skew-y: 1.5; scale-x: 0.847; scale-y: 0.847; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 21.8; y: 65.7; skew-x: 1.8; skew-y: 1.8; scale-x: 0.846; scale-y: 0.846; }
        frame 181 { x: 24.1; y: 63.7; skew-x: 2.1; skew-y: 2.1; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 26.2; y: 61.7; skew-x: 2.3; skew-y: 2.3; }
        frame 183 { x: 28.4; y: 59.7; skew-x: 2.6; skew-y: 2.6; scale-x: 0.845; scale-y: 0.845; }
        frame 184 { x: 30.6; y: 57.7; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 185 { x: 32.9; y: 55.6; skew-x: 3.1; skew-y: 3.1; scale-x: 0.844; scale-y: 0.844; }
        frame 186 { x: 35; y: 53.7; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 37.2; y: 51.5; skew-x: 3.7; skew-y: 3.7; }
        frame 188 { x: 36.1; y: 53.4; skew-x: -7.6; skew-y: -7.6; }
        frame 189 { x: 35.5; y: 55.5; skew-x: -18.7; skew-y: -18.7; scale-x: 0.843; scale-y: 0.843; }
        frame 190 { x: 34.9; y: 58; skew-x: -30.1; skew-y: -30.1; scale-x: -10000; scale-y: -10000; }
        frame 191 { x: 34.5; y: 58.8; skew-x: -41.4; skew-y: -41.4; scale-x: 0.842; scale-y: 0.842; }
        frame 192 { x: 34.6; y: 59.8; skew-x: -52.7; skew-y: -52.7; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 35.1; y: 60.6; skew-x: -64; skew-y: -64; }
        frame 194 { x: 36.1; y: 61.6; skew-x: -75.4; skew-y: -75.4; scale-x: 0.844; scale-y: 0.844; }
        frame 195 { x: 33.6; y: 63.5; skew-x: -65.8; skew-y: -65.8; scale-x: 0.842; scale-y: 0.842; }
        frame 196 { x: 31.4; y: 65.3; skew-x: -56.2; skew-y: -56.2; scale-x: 0.843; scale-y: 0.843; }
        frame 197 { x: 29.7; y: 67; skew-x: -46.5; skew-y: -46.5; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 28.1; y: 69; skew-x: -36.9; skew-y: -36.9; scale-x: 0.844; scale-y: 0.844; }
        frame 199 { x: 25.6; y: 68.3; skew-x: -27.2; skew-y: -27.2; scale-x: -10000; scale-y: -10000; }
        frame 200 { x: 23.3; y: 67.8; skew-x: -17.6; skew-y: -17.6; scale-x: 0.845; scale-y: 0.845; }
        frame 201 { x: 21.3; y: 67.7; skew-x: -8.1; skew-y: -8.1; scale-x: 0.846; scale-y: 0.846; }
        frame 202 { x: 19.5; y: -10000; skew-x: 1.5; skew-y: 1.5; scale-x: 0.847; scale-y: 0.847; }
        frame 203 { x: 23.8; y: 58.1; skew-x: 71.7; skew-y: 71.7; scale-x: 0.849; scale-y: 0.849; }
        frame 204 { x: 27.4; y: 52.5; skew-x: 84.1; skew-y: 84.1; scale-x: 0.848; scale-y: 0.848; }
        frame 205 { x: 30.7; y: 47; skew-x: 96.6; skew-y: 96.6; scale-x: 0.847; scale-y: 0.847; }
        frame 206 { x: 33.3; y: 41.8; skew-x: 109.1; skew-y: 109.1; scale-x: -10000; scale-y: -10000; }
        frame 207 { x: 35.4; y: 36.6; skew-x: 121.7; skew-y: 121.7; scale-x: 0.846; scale-y: 0.846; }
        frame 208 { x: 37; y: 31.4; skew-x: 134.2; skew-y: 134.2; scale-x: -10000; scale-y: -10000; }
        frame 209 { x: 38; y: 26; skew-x: 146.6; skew-y: 146.6; scale-x: 0.847; scale-y: 0.847; }
        frame 210 { x: 33.7; y: 34.6; skew-x: 140.4; skew-y: 140.4; scale-x: 0.845; scale-y: 0.845; }
        frame 211 { x: 31; y: 38; skew-x: 117.4; skew-y: 117.4; scale-x: 0.844; scale-y: 0.844; }
        frame 212 { x: 26.7; y: 39.2; skew-x: 104.6; skew-y: 104.6; scale-x: 0.842; scale-y: 0.842; }
        frame 213 { x: 27.6; y: 45.4; skew-x: 75.6; skew-y: 75.6; scale-x: -10000; scale-y: -10000; }
        frame 214 { x: 24.2; y: 53.2; skew-x: 64; skew-y: 64; }
    }
    Track {
        source-name: "Zombie_ladder_innerleg_upper";
        frame-count: 215;
        frame 0 { x: 41; y: 80.2; skew-x: 351.7; skew-y: 351.7; scale-x: 0.85; scale-y: 0.85; image: IMAGE_REANIM_ZOMBIE_LADDER_INNERLEG_UPPER; }
        frame 1 { x: 41.4; y: 79.5; skew-x: 353.2; skew-y: 353.2; scale-x: 0.849; scale-y: 0.849; image: none; }
        frame 2 { x: 41.7; y: 78.9; skew-x: 354.5; skew-y: 354.5; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 42; y: 78.2; skew-x: 356; skew-y: 356; scale-x: 0.85; scale-y: 0.85; }
        frame 4 { x: 42.3; y: 77.6; skew-x: 357.2; skew-y: 357.2; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 42.6; y: 77; skew-x: 358.7; skew-y: 358.7; }
        frame 6 { x: 43; y: 76.3; skew-x: 360; skew-y: 360; }
        frame 7 { x: 42.6; y: 76.9; skew-x: 358.7; skew-y: 358.7; }
        frame 8 { x: 42.3; y: 77.5; skew-x: 357.2; skew-y: 357.2; }
        frame 9 { x: 42; y: 78.2; skew-x: 356; skew-y: 356; }
        frame 10 { x: 41.6; y: 78.8; skew-x: 354.5; skew-y: 354.5; scale-x: 0.849; scale-y: 0.849; }
        frame 11 { x: 41.4; y: 79.4; skew-x: 353.2; skew-y: 353.2; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 41; y: 80.2; skew-x: 351.7; skew-y: 351.7; scale-x: 0.85; scale-y: 0.85; }
        frame 13 { x: 40.9; y: 80.7; skew-x: 350.7; skew-y: 350.7; scale-x: 0.849; scale-y: 0.849; }
        frame 14 { x: 40.6; y: 81.3; skew-x: 349.5; skew-y: 349.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 40.5; y: 81.8; skew-x: 348.5; skew-y: 348.5; }
        frame 16 { x: 40.2; y: 82.3; skew-x: 347.2; skew-y: 347.2; }
        frame 17 { x: 40; y: 82.8; skew-x: 346.2; skew-y: 346.2; }
        frame 18 { x: 39.7; y: 83.5; skew-x: 345; skew-y: 345; scale-x: 0.85; scale-y: 0.85; }
        frame 19 { x: 40; y: 83; skew-x: 346.2; skew-y: 346.2; scale-x: 0.849; scale-y: 0.849; }
        frame 20 { x: 40.1; y: 82.3; skew-x: 347.2; skew-y: 347.2; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 40.4; y: 81.8; skew-x: 348.5; skew-y: 348.5; }
        frame 22 { x: 40.6; y: 81.3; skew-x: 349.5; skew-y: 349.5; }
        frame 23 { x: 40.9; y: 80.8; skew-x: 350.7; skew-y: 350.7; }
        frame 24 { x: 41; y: 80.2; skew-x: 351.7; skew-y: 351.7; scale-x: 0.85; scale-y: 0.85; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 41.7; y: 79.8; skew-x: 352.7; skew-y: 352.7; scale-x: 0.849; scale-y: 0.849; }
        frame 27 { x: 42.3; y: 79.5; skew-x: 353.7; skew-y: 353.7; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 42.9; y: 79.3; skew-x: 354.7; skew-y: 354.7; }
        frame 29 { x: 43.4; y: 79; skew-x: 355.5; skew-y: 355.5; }
        frame 30 { x: 43.2; y: 78.2; skew-x: 353.7; skew-y: 353.7; scale-x: 0.848; scale-y: 0.894; }
        frame 31 { x: 43.1; y: 77.3; skew-x: 351.7; skew-y: 351.7; scale-x: -10000; scale-y: 0.94; }
        frame 32 { x: 42.8; y: 76.6; skew-x: 349.7; skew-y: 349.7; scale-y: 0.985; }
        frame 33 { x: 42.4; y: 75.8; skew-x: 347.5; skew-y: 347.5; scale-y: 1.032; }
        frame 34 { x: 41.6; y: 75.3; skew-x: 346; skew-y: 346; scale-x: 0.847; scale-y: 1.079; }
        frame 35 { x: 40.9; y: 74.8; skew-x: 344.2; skew-y: 344.2; scale-x: -10000; scale-y: 1.127; }
        frame 36 { x: 39.9; y: 74.3; skew-x: 342.7; skew-y: 342.7; scale-y: 1.175; }
        frame 37 { x: 39; y: 73.8; skew-x: 341; skew-y: 341; scale-x: 0.846; scale-y: 1.223; }
        frame 38 { x: 38; y: 73.2; skew-x: 339.3; skew-y: 339.3; scale-x: 0.847; scale-y: 1.272; }
        frame 39 { x: 37.1; y: 74; skew-x: 337.5; skew-y: 337.5; scale-x: 0.845; scale-y: 1.27; }
        frame 40 { x: 36.2; y: 74.7; skew-x: 335.7; skew-y: 335.7; scale-x: -10000; scale-y: 1.269; }
        frame 41 { x: 35.4; y: 75.3; skew-x: 333.9; skew-y: 333.9; scale-x: 0.844; scale-y: 1.268; }
        frame 42 { x: 34.6; y: 76; skew-x: 332.2; skew-y: 332.2; scale-x: 0.843; scale-y: 1.267; }
        frame 43 { x: 33.6; y: 76.7; skew-x: 330.3; skew-y: 330.3; scale-x: 0.844; scale-y: -10000; }
        frame 44 { x: 34.3; y: 75.8; skew-x: 333.7; skew-y: 333.7; scale-x: 0.842; scale-y: 1.265; }
        frame 45 { x: 35.1; y: 75; skew-x: 337.2; skew-y: 337.2; scale-x: -10000; scale-y: 1.264; }
        frame 46 { x: 36; y: 74.3; skew-x: 340.7; skew-y: 340.7; scale-y: -10000; }
        frame 47 { x: 36.9; y: 73.6; skew-x: 344; skew-y: 344; }
        frame 48 { x: 37.4; y: 73.1; skew-x: 344.5; skew-y: 344.5; scale-x: 0.841; scale-y: 1.263; }
        frame 49 { x: 37.8; y: 72.7; skew-x: 345; skew-y: 345; scale-x: -10000; scale-y: 1.264; }
        frame 50 { x: 38.1; y: 72.3; skew-x: 345.4; skew-y: 345.4; scale-x: 0.842; scale-y: -10000; }
        frame 51 { x: 38.5; y: 71.8; skew-x: 345.7; skew-y: 345.7; scale-x: -10000; }
        frame 52 { x: 39; y: 71.5; skew-x: 346.2; skew-y: 346.2; scale-y: 1.265; }
        frame 53 { x: 39.3; y: 70.4; skew-x: 349; skew-y: 349; scale-x: 0.841; scale-y: 1.263; }
        frame 54 { x: 39.6; y: 69.3; skew-x: 351.7; skew-y: 351.7; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 40; y: 68.3; skew-x: 354.5; skew-y: 354.5; scale-y: 1.262; }
        frame 56 { x: 41.6; y: 66.6; skew-x: 364.1; skew-y: 364; scale-x: 0.84; scale-y: -10000; }
        frame 57 { x: 43.8; y: 65.7; skew-x: 373.9; skew-y: 373.9; scale-x: -10000; }
        frame 58 { x: 45.5; y: 66.8; skew-x: 378.8; skew-y: 378.8; scale-y: 1.164; }
        frame 59 { x: 47; y: 68.1; skew-x: 383.8; skew-y: 383.8; scale-x: 0.839; scale-y: 1.067; }
        frame 60 { x: 48.3; y: 69.5; skew-x: 388.9; skew-y: 389; scale-x: -10000; scale-y: 0.969; }
        frame 61 { x: 49.1; y: 70.8; skew-x: 394.1; skew-y: 394.1; scale-y: 0.872; }
        frame 62 { x: 49.6; y: 72; skew-x: 399; skew-y: 399.1; scale-x: 0.841; scale-y: 0.776; }
        frame 63 { x: 46.8; y: 73.5; skew-x: 385.1; skew-y: 385.1; scale-x: 0.842; scale-y: 0.794; }
        frame 64 { x: 44; y: 76.1; skew-x: 371; skew-y: 371; scale-x: 0.844; scale-y: 0.812; }
        frame 65 { x: 41.7; y: 79.7; skew-x: 357.2; skew-y: 357.2; scale-x: 0.847; scale-y: 0.831; }
        frame 66 { x: 39.8; y: 84.6; skew-x: 343.2; skew-y: 343.2; scale-x: 0.849; scale-y: 0.849; }
        frame 67 { x: 40; y: 83.7; skew-x: 345; skew-y: 345; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 40.4; y: 82.7; skew-x: 346.7; skew-y: 346.7; }
        frame 69 { x: 40.5; y: 81.9; skew-x: 348.4; skew-y: 348.4; }
        frame 70 { x: 40.9; y: 81.1; skew-x: 350.2; skew-y: 350.2; }
        frame 71 { x: 41; y: 80.2; skew-x: 351.7; skew-y: 351.7; scale-x: 0.85; scale-y: 0.85; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 42.3; y: 79.1; skew-x: 354; skew-y: 354; scale-x: 0.849; scale-y: 0.849; }
        frame 74 { x: 43.4; y: 78.2; skew-x: 356; skew-y: 356; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 44.5; y: 77.2; skew-x: 358.2; skew-y: 358.2; }
        frame 76 { x: 45.7; y: 76.3; skew-x: 360.3; skew-y: 360.3; }
        frame 77 { x: 45.6; y: 75.8; skew-x: 359.7; skew-y: 359.7; }
        frame 78 { x: 45.3; y: 75.4; skew-x: 359; skew-y: 359; scale-x: 0.848; scale-y: 0.848; }
        frame 79 { x: 45.1; y: 75; skew-x: 358.5; skew-y: 358.5; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 44.9; y: 74.6; skew-x: 357.7; skew-y: 357.7; }
        frame 81 { x: 41.6; y: 76.5; skew-x: 354.2; skew-y: 354.2; }
        frame 82 { x: 38.3; y: 78.4; skew-x: 350.7; skew-y: 350.7; }
        frame 83 { x: 35.3; y: 80.4; skew-x: 347.2; skew-y: 347.2; scale-x: 0.849; scale-y: 0.849; }
        frame 84 { x: 34.7; y: 81.6; skew-x: 342.7; skew-y: 342.7; scale-x: 0.848; scale-y: 0.848; }
        frame 85 { x: 34.2; y: 82.8; skew-x: 338; skew-y: 338; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 33.8; y: 84.3; skew-x: 333.4; skew-y: 333.4; }
        frame 87 { x: 33.5; y: 85.7; skew-x: 328.8; skew-y: 328.8; }
        frame 88 { x: 34.1; y: 84.7; skew-x: 332.7; skew-y: 332.7; scale-x: 0.847; scale-y: 0.847; }
        frame 89 { x: 34.8; y: 83.7; skew-x: 336.4; skew-y: 336.4; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 35.5; y: 82.8; skew-x: 340.2; skew-y: 340.2; scale-x: 0.848; scale-y: 0.848; }
        frame 91 { x: 36.3; y: 81.8; skew-x: 344; skew-y: 344; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 37.5; y: 81.4; skew-x: 346; skew-y: 346; }
        frame 93 { x: 38.8; y: 81; skew-x: 348; skew-y: 348; }
        frame 94 { x: 40; y: 80.6; skew-x: 349.9; skew-y: 349.9; scale-x: 0.849; scale-y: 0.849; }
        frame 95 { x: 41; y: 80.2; skew-x: 351.7; skew-y: 351.7; scale-x: 0.85; scale-y: 0.85; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 40.5; y: 79.3; skew-x: 353.2; skew-y: 353.2; scale-x: 0.849; scale-y: 0.849; }
        frame 98 { x: 39.9; y: 78.5; skew-x: 354.5; skew-y: 354.5; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 39.3; y: 77.7; skew-x: 355.7; skew-y: 355.7; }
        frame 100 { x: 38.7; y: 76.8; skew-x: 357; skew-y: 357; scale-x: 0.848; scale-y: 0.848; }
        frame 101 { x: 37.5; y: 77; skew-x: 356.5; skew-y: 356.5; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 36.3; y: 77.2; skew-x: 355.7; skew-y: 355.7; scale-x: 0.847; scale-y: 0.847; }
        frame 103 { x: 34.8; y: 77.3; skew-x: 355; skew-y: 355; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 33.5; y: 77.7; skew-x: 354.3; skew-y: 354.3; }
        frame 105 { x: 29.1; y: 78.8; skew-x: 346.7; skew-y: 346.7; scale-x: 0.846; scale-y: 0.846; }
        frame 106 { x: 25; y: 80.4; skew-x: 339; skew-y: 339; scale-x: 0.845; scale-y: 0.845; }
        frame 107 { x: 21.2; y: 82.2; skew-x: 331.4; skew-y: 331.4; scale-x: 0.844; scale-y: 0.844; }
        frame 108 { x: 17.8; y: 84.2; skew-x: 323.7; skew-y: 323.7; scale-x: 0.845; scale-y: 0.845; }
        frame 109 { x: 15.4; y: 85.6; skew-x: 320.1; skew-y: 320.1; scale-x: 0.844; scale-y: 0.844; }
        frame 110 { x: 13.1; y: 87.2; skew-x: 316.4; skew-y: 316.4; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 10.8; y: 88.7; skew-x: 312.9; skew-y: 312.9; }
        frame 112 { x: 8.5; y: 90.1; skew-x: 309.2; skew-y: 309.2; scale-x: 0.846; scale-y: 0.846; }
        frame 113 { x: 6; y: 93.9; skew-x: 299.6; skew-y: 299.6; scale-x: 0.844; scale-y: 0.942; }
        frame 114 { x: 3.8; y: 98.3; skew-x: 289.8; skew-y: 289.8; scale-x: -10000; scale-y: 1.039; }
        frame 115 { x: 2; y: 103.3; skew-x: 280.3; skew-y: 280.3; scale-y: 1.137; }
        frame 116 { x: 0.7; y: 108.8; skew-x: 270.8; skew-y: 270.8; scale-x: 0.845; scale-y: 1.235; }
        frame 117 { x: 1.1; y: 115.3; skew-x: 256.5; skew-y: 256.5; scale-x: 0.843; scale-y: 1.125; }
        frame 118 { x: 2.6; y: 119.6; skew-x: 242.1; skew-y: 242.1; scale-x: -10000; scale-y: 1.017; }
        frame 119 { x: 2.2; y: 122.1; skew-x: 238.4; skew-y: 238.4; scale-x: 0.842; scale-y: 1.092; }
        frame 120 { x: 2; y: 124.6; skew-x: 234.9; skew-y: 234.9; scale-x: -10000; scale-y: 1.17; }
        frame 121 { x: 1.9; y: 127.2; skew-x: 231.2; skew-y: 231.2; scale-x: 0.843; scale-y: 1.249; }
        frame 122 { x: -0.9; y: 128.8; skew-x: 240.7; skew-y: 240.4; scale-x: 0.822; scale-y: 1.245; }
        frame 123 { x: -3.5; y: 130.1; skew-x: 250.2; skew-y: 249.5; scale-x: 0.803; scale-y: 1.244; }
        frame 124 { x: -6.6; y: 130.9; skew-x: 262.7; skew-y: 261.7; scale-x: 0.783; scale-y: 1.243; }
        frame 125 { x: -8.3; y: 131.2; skew-x: 275.2; skew-y: 273.6; scale-x: 0.764; scale-y: -10000; }
        frame 126 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 127 { y: 131.3; skew-x: 275; skew-y: 273.5; scale-y: 1.242; }
        frame 128 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 129 { y: 131.4; }
        frame 130 { y: 131.3; }
        frame 131 { y: 131.2; skew-x: 275.2; skew-y: 273.6; scale-y: 1.243; }
        frame 132 { x: 41; y: 80.2; skew-x: 351.7; skew-y: 351.7; scale-x: 0.85; scale-y: 0.85; }
        frame 133 { x: 41.7; y: 79.8; skew-x: 352.7; skew-y: 352.7; scale-x: 0.849; scale-y: 0.849; }
        frame 134 { x: 42.3; y: 79.5; skew-x: 353.7; skew-y: 353.7; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 42.9; y: 79.3; skew-x: 354.7; skew-y: 354.7; }
        frame 136 { x: 43.4; y: 79; skew-x: 355.5; skew-y: 355.5; }
        frame 137 { x: 43.2; y: 78.2; skew-x: 353.7; skew-y: 353.7; scale-x: 0.848; scale-y: 0.894; }
        frame 138 { x: 43.1; y: 77.3; skew-x: 351.7; skew-y: 351.7; scale-x: -10000; scale-y: 0.94; }
        frame 139 { x: 42.8; y: 76.6; skew-x: 349.7; skew-y: 349.7; scale-y: 0.985; }
        frame 140 { x: 42.4; y: 75.8; skew-x: 347.5; skew-y: 347.5; scale-y: 1.032; }
        frame 141 { x: 41.6; y: 75.3; skew-x: 346; skew-y: 346; scale-x: 0.847; scale-y: 1.079; }
        frame 142 { x: 40.9; y: 74.8; skew-x: 344.2; skew-y: 344.2; scale-x: -10000; scale-y: 1.127; }
        frame 143 { x: 39.9; y: 74.3; skew-x: 342.7; skew-y: 342.7; scale-y: 1.175; }
        frame 144 { x: 39; y: 73.8; skew-x: 341; skew-y: 341; scale-x: 0.846; scale-y: 1.223; }
        frame 145 { x: 38; y: 73.2; skew-x: 339.3; skew-y: 339.3; scale-x: 0.847; scale-y: 1.272; }
        frame 146 { x: 37.1; y: 74; skew-x: 337.5; skew-y: 337.5; scale-x: 0.845; scale-y: 1.27; }
        frame 147 { x: 36.2; y: 74.7; skew-x: 335.7; skew-y: 335.7; scale-x: -10000; scale-y: 1.269; }
        frame 148 { x: 35.4; y: 75.3; skew-x: 333.9; skew-y: 333.9; scale-x: 0.844; scale-y: 1.268; }
        frame 149 { x: 34.6; y: 76; skew-x: 332.2; skew-y: 332.2; scale-x: 0.843; scale-y: 1.267; }
        frame 150 { x: 33.6; y: 76.7; skew-x: 330.3; skew-y: 330.3; scale-x: 0.844; scale-y: -10000; }
        frame 151 { x: 34.3; y: 75.8; skew-x: 333.7; skew-y: 333.7; scale-x: 0.842; scale-y: 1.265; }
        frame 152 { x: 35.1; y: 75; skew-x: 337.2; skew-y: 337.2; scale-x: -10000; scale-y: 1.264; }
        frame 153 { x: 36; y: 74.3; skew-x: 340.7; skew-y: 340.7; scale-y: -10000; }
        frame 154 { x: 36.9; y: 73.6; skew-x: 344; skew-y: 344; }
        frame 155 { x: 37.4; y: 73.1; skew-x: 344.5; skew-y: 344.5; scale-x: 0.841; scale-y: 1.263; }
        frame 156 { x: 37.8; y: 72.7; skew-x: 345; skew-y: 345; scale-x: -10000; scale-y: 1.264; }
        frame 157 { x: 38.1; y: 72.3; skew-x: 345.4; skew-y: 345.4; scale-x: 0.842; scale-y: -10000; }
        frame 158 { x: 38.5; y: 71.8; skew-x: 345.7; skew-y: 345.7; scale-x: -10000; }
        frame 159 { x: 39; y: 71.5; skew-x: 346.2; skew-y: 346.2; scale-y: 1.265; }
        frame 160 { x: 39.3; y: 70.4; skew-x: 349; skew-y: 349; scale-x: 0.841; scale-y: 1.263; }
        frame 161 { x: 39.6; y: 69.3; skew-x: 351.7; skew-y: 351.7; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 40; y: 68.3; skew-x: 354.5; skew-y: 354.5; scale-y: 1.262; }
        frame 163 { x: 41.6; y: 66.6; skew-x: 364.1; skew-y: 364; scale-x: 0.84; scale-y: -10000; }
        frame 164 { x: 43.8; y: 65.7; skew-x: 373.9; skew-y: 373.9; scale-x: -10000; }
        frame 165 { x: 45.5; y: 66.8; skew-x: 378.8; skew-y: 378.8; scale-y: 1.164; }
        frame 166 { x: 47; y: 68.1; skew-x: 383.8; skew-y: 383.8; scale-x: 0.839; scale-y: 1.067; }
        frame 167 { x: 48.3; y: 69.5; skew-x: 388.9; skew-y: 389; scale-x: -10000; scale-y: 0.969; }
        frame 168 { x: 49.1; y: 70.8; skew-x: 394.1; skew-y: 394.1; scale-y: 0.872; }
        frame 169 { x: 49.6; y: 72; skew-x: 399; skew-y: 399.1; scale-x: 0.841; scale-y: 0.776; }
        frame 170 { x: 46.8; y: 73.5; skew-x: 385.1; skew-y: 385.1; scale-x: 0.842; scale-y: 0.794; }
        frame 171 { x: 44; y: 76.1; skew-x: 371; skew-y: 371; scale-x: 0.844; scale-y: 0.812; }
        frame 172 { x: 41.7; y: 79.7; skew-x: 357.2; skew-y: 357.2; scale-x: 0.847; scale-y: 0.831; }
        frame 173 { x: 39.8; y: 84.6; skew-x: 343.2; skew-y: 343.2; scale-x: 0.849; scale-y: 0.849; }
        frame 174 { x: 40; y: 83.7; skew-x: 345; skew-y: 345; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 40.4; y: 82.7; skew-x: 346.7; skew-y: 346.7; }
        frame 176 { x: 40.5; y: 81.9; skew-x: 348.4; skew-y: 348.4; }
        frame 177 { x: 40.9; y: 81.1; skew-x: 350.2; skew-y: 350.2; }
        frame 178 { x: 41; y: 80.2; skew-x: 351.7; skew-y: 351.7; scale-x: 0.85; scale-y: 0.85; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 42.3; y: 79.1; skew-x: 354; skew-y: 354; scale-x: 0.849; scale-y: 0.849; }
        frame 181 { x: 43.4; y: 78.2; skew-x: 356; skew-y: 356; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 44.5; y: 77.2; skew-x: 358.2; skew-y: 358.2; }
        frame 183 { x: 45.7; y: 76.3; skew-x: 360.3; skew-y: 360.3; }
        frame 184 { x: 45.6; y: 75.8; skew-x: 359.7; skew-y: 359.7; }
        frame 185 { x: 45.3; y: 75.4; skew-x: 359; skew-y: 359; scale-x: 0.848; scale-y: 0.848; }
        frame 186 { x: 45.1; y: 75; skew-x: 358.5; skew-y: 358.5; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 44.9; y: 74.6; skew-x: 357.7; skew-y: 357.7; }
        frame 188 { x: 41.6; y: 76.5; skew-x: 354.2; skew-y: 354.2; }
        frame 189 { x: 38.3; y: 78.4; skew-x: 350.7; skew-y: 350.7; }
        frame 190 { x: 35.3; y: 80.4; skew-x: 347.2; skew-y: 347.2; scale-x: 0.849; scale-y: 0.849; }
        frame 191 { x: 34.7; y: 81.6; skew-x: 342.7; skew-y: 342.7; scale-x: 0.848; scale-y: 0.848; }
        frame 192 { x: 34.2; y: 82.8; skew-x: 338; skew-y: 338; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 33.8; y: 84.3; skew-x: 333.4; skew-y: 333.4; }
        frame 194 { x: 33.5; y: 85.7; skew-x: 328.8; skew-y: 328.8; }
        frame 195 { x: 34.1; y: 84.7; skew-x: 332.7; skew-y: 332.7; scale-x: 0.847; scale-y: 0.847; }
        frame 196 { x: 34.8; y: 83.7; skew-x: 336.4; skew-y: 336.4; scale-x: -10000; scale-y: -10000; }
        frame 197 { x: 35.5; y: 82.8; skew-x: 340.2; skew-y: 340.2; scale-x: 0.848; scale-y: 0.848; }
        frame 198 { x: 36.3; y: 81.8; skew-x: 344; skew-y: 344; scale-x: -10000; scale-y: -10000; }
        frame 199 { x: 37.5; y: 81.4; skew-x: 346; skew-y: 346; }
        frame 200 { x: 38.8; y: 81; skew-x: 348; skew-y: 348; }
        frame 201 { x: 40; y: 80.6; skew-x: 349.9; skew-y: 349.9; scale-x: 0.849; scale-y: 0.849; }
        frame 202 { x: 41; y: 80.2; skew-x: 351.7; skew-y: 351.7; scale-x: 0.85; scale-y: 0.85; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 204 { x: 42; y: 78.3; skew-x: 354.2; skew-y: 354.2; scale-x: 0.849; scale-y: 0.877; }
        frame 205 { x: 42.9; y: 76.6; skew-x: 356.5; skew-y: 356.5; scale-x: -10000; scale-y: 0.905; }
        frame 206 { x: 43.9; y: 74.8; skew-x: 358.7; skew-y: 358.7; scale-y: 0.934; }
        frame 207 { x: 44.8; y: 73.1; skew-x: 360.8; skew-y: 360.8; scale-y: 0.962; }
        frame 208 { x: 46; y: 71.4; skew-x: 363.3; skew-y: 363.3; scale-y: 0.99; }
        frame 209 { x: 47.1; y: 69.8; skew-x: 365.6; skew-y: 365.6; scale-y: 1.018; }
        frame 210 { x: 45.3; y: 70.1; skew-x: 360; skew-y: 360; scale-y: 1.031; }
        frame 211 { x: 43.5; y: 70.7; skew-x: 354.5; skew-y: 354.5; scale-y: 1.044; }
        frame 212 { x: 41.7; y: 71.5; skew-x: 348.7; skew-y: 348.7; scale-x: 0.848; scale-y: 1.057; }
        frame 213 { x: 39.9; y: 72.5; skew-x: 343; skew-y: 343; scale-x: 0.849; scale-y: 1.071; }
        frame 214 { x: 39; y: 75.7; skew-x: 337.9; skew-y: 337.8; scale-x: 0.848; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_innerleg_lower";
        frame-count: 215;
        frame 0 { x: 33.5; y: 95.9; scale-x: 0.85; scale-y: 0.85; image: IMAGE_REANIM_ZOMBIE_LADDER_INNERLEG_LOWER; }
        frame 1 { x: 33.4; y: 95.8; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 33.2; y: 95.6; }
        frame 3 { x: 33; y: 95.5; }
        frame 4 { x: 32.9; y: 95.3; }
        frame 5 { x: 32.8; y: 95.2; }
        frame 6 { x: 32.6; y: 95; }
        frame 7 { x: 32.8; y: 95.2; }
        frame 8 { x: 32.9; y: 95.3; }
        frame 9 { x: 33; y: 95.5; }
        frame 10 { x: 33.2; y: 95.6; }
        frame 11 { x: 33.4; y: 95.8; }
        frame 12 { x: 33.5; y: 95.9; }
        frame 13 { x: 33.6; y: 96.1; }
        frame 14 { x: 33.7; y: 96.2; }
        frame 15 { x: 33.8; y: 96.3; }
        frame 16 { x: 33.9; y: 96.4; }
        frame 17 { x: 34; y: 96.6; }
        frame 18 { y: 96.7; }
        frame 19 { y: 96.6; }
        frame 20 { x: 33.9; y: 96.4; }
        frame 21 { x: 33.8; y: 96.3; }
        frame 22 { x: 33.7; y: 96.2; }
        frame 23 { x: 33.6; y: 96.1; }
        frame 24 { x: 33.5; y: 95.9; }
        frame 25 { x: -10000; y: -10000; }
        frame 26 { x: 34.1; y: 95.5; skew-x: 1.5; skew-y: 1.5; }
        frame 27 { x: 34.9; y: 94.9; skew-x: 3; skew-y: 3; }
        frame 28 { x: 35.5; y: 94.6; skew-x: 4.6; skew-y: 4.6; }
        frame 29 { x: 36.3; y: 94; skew-x: 6.3; skew-y: 6.3; }
        frame 30 { x: 35.8; y: 96.5; skew-x: -1.2; skew-y: -1.2; scale-x: 0.849; scale-y: 0.849; }
        frame 31 { x: -10000; y: 99; skew-x: -8.7; skew-y: -8.7; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 36; y: 101.6; skew-x: -16.2; skew-y: -16.2; scale-x: 0.848; scale-y: 0.848; }
        frame 33 { x: 36.5; y: 104.5; skew-x: -23.9; skew-y: -23.9; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 37.9; y: 108.2; skew-x: -34; skew-y: -34; scale-x: 0.847; scale-y: 0.847; }
        frame 35 { x: 40; y: 111.8; skew-x: -44; skew-y: -44; scale-x: 0.846; scale-y: 0.846; }
        frame 36 { x: 42.8; y: 115.5; skew-x: -54.3; skew-y: -54.3; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 46.1; y: 118.8; skew-x: -64.3; skew-y: -64.3; }
        frame 38 { x: 49.9; y: 121.7; skew-x: -74.3; skew-y: -74.3; scale-x: 0.847; scale-y: 0.847; }
        frame 39 { x: 51.8; y: 122.5; skew-x: -78.1; skew-y: -78.1; scale-x: 0.846; scale-y: 0.846; }
        frame 40 { x: 53.5; y: 123.3; skew-x: -81.8; skew-y: -81.8; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 55.4; y: 124; skew-x: -85.4; skew-y: -85.4; }
        frame 42 { x: 57.3; y: 124.6; skew-x: -89.1; skew-y: -89.1; }
        frame 43 { x: 59.1; y: 125.1; skew-x: -92.7; skew-y: -92.7; }
        frame 44 { x: 59; y: 125.5; skew-x: -94.7; skew-y: -94.7; scale-x: 0.845; scale-y: 0.845; }
        frame 45 { x: -10000; y: 125.8; skew-x: -96.9; skew-y: -96.9; scale-x: -10000; scale-y: -10000; }
        frame 46 { y: 126.2; skew-x: -99.2; skew-y: -99.2; scale-x: 0.844; scale-y: 0.844; }
        frame 47 { y: 126.4; skew-x: -101.4; skew-y: -101.4; scale-x: 0.845; scale-y: 0.845; }
        frame 48 { x: 58.8; y: -10000; skew-x: -101.7; skew-y: -101.7; scale-x: 0.844; scale-y: 0.844; }
        frame 49 { x: 58.6; skew-x: -101.9; skew-y: -101.9; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 58.3; skew-x: -102.2; skew-y: -102.2; }
        frame 51 { x: 58.1; y: 126.5; skew-x: -102.7; skew-y: -102.7; }
        frame 52 { x: 57.9; y: 126.6; skew-x: -103; skew-y: -103; scale-x: 0.845; scale-y: 0.845; }
        frame 53 { x: 52.8; y: 124.6; skew-x: -96.4; skew-y: -96.4; scale-x: 0.844; scale-y: 0.844; }
        frame 54 { x: 48; y: 122.4; skew-x: -89.9; skew-y: -89.9; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 43.2; y: 120.1; skew-x: -83.6; skew-y: -83.6; scale-x: 0.843; scale-y: 0.843; }
        frame 56 { x: 37.8; y: 120.2; skew-x: -80.6; skew-y: -80.6; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 32.3; y: 120.1; skew-x: -77.6; skew-y: -77.6; }
        frame 58 { x: 28; y: 116.3; skew-x: -66.8; skew-y: -66.8; scale-x: 0.841; scale-y: 0.891; }
        frame 59 { x: 24.4; y: 111.8; skew-x: -56; skew-y: -56; scale-x: 0.839; scale-y: 0.939; }
        frame 60 { x: 21.8; y: 106.7; skew-x: -45; skew-y: -45; scale-x: -10000; scale-y: 0.988; }
        frame 61 { x: 20; y: 101.4; skew-x: -34.2; skew-y: -34.2; scale-x: 0.838; scale-y: 1.038; }
        frame 62 { x: 19.3; y: 96.1; skew-x: -23.4; skew-y: -23.4; scale-x: -10000; scale-y: 1.088; }
        frame 63 { x: 23.1; y: 95.7; skew-x: -16.2; skew-y: -16.2; scale-x: 0.84; scale-y: 1.028; }
        frame 64 { x: 27; y: 95.5; skew-x: -9.2; skew-y: -9.2; scale-x: 0.843; scale-y: 0.968; }
        frame 65 { x: 31.2; y: -10000; skew-x: -2.2; skew-y: -2.2; scale-x: 0.846; scale-y: 0.909; }
        frame 66 { x: 35.3; y: 95.6; skew-x: 4.8; skew-y: 4.8; scale-x: 0.849; scale-y: 0.849; }
        frame 67 { x: 34.8; y: 95.8; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 34.5; y: 95.7; skew-x: 2.8; skew-y: 2.8; }
        frame 69 { x: 34.1; y: 95.8; skew-x: 1.8; skew-y: 1.8; scale-x: 0.85; scale-y: 0.85; }
        frame 70 { x: 33.8; y: 95.9; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 33.5; y: -10000; skew-x: 0; skew-y: 0; }
        frame 72 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { y: 95.6; skew-x: -0.7; skew-y: -0.7; }
        frame 74 { y: 95.5; skew-x: -1.7; skew-y: -1.7; }
        frame 75 { y: 95.3; skew-x: -2.7; skew-y: -2.7; }
        frame 76 { y: -10000; skew-x: -3.9; skew-y: -3.9; }
        frame 77 { x: 33.6; skew-x: -4.9; skew-y: -4.9; scale-x: 0.849; scale-y: 0.849; }
        frame 78 { x: 33.8; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 33.9; y: 95.5; skew-x: -7; skew-y: -7; }
        frame 80 { x: -10000; y: 95.7; skew-x: -8.2; skew-y: -8.2; }
        frame 81 { x: 32.2; y: 96; skew-x: -6.9; skew-y: -6.9; }
        frame 82 { x: 30.5; y: 96.3; skew-x: -5.7; skew-y: -5.7; }
        frame 83 { x: 29; y: 96.7; skew-x: -4.4; skew-y: -4.4; scale-x: 0.85; scale-y: 0.85; }
        frame 84 { x: 30.3; y: 94.8; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: 0.885; }
        frame 85 { x: 31.7; y: 93.1; skew-x: 2.8; skew-y: 2.8; scale-x: 0.849; scale-y: 0.92; }
        frame 86 { x: 33.1; y: 91.5; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: 0.954; }
        frame 87 { x: 34.8; y: 89.8; skew-x: 10.2; skew-y: 10.2; scale-y: 0.99; }
        frame 88 { x: 33.8; y: 91.2; skew-x: 7.8; skew-y: 7.8; scale-y: 0.954; }
        frame 89 { x: 33; y: 92.5; skew-x: 5.5; skew-y: 5.5; scale-y: 0.919; }
        frame 90 { x: 32.1; y: 93.9; skew-x: 3; skew-y: 3; scale-y: 0.885; }
        frame 91 { x: 31.4; y: 95.2; skew-x: 0.8; skew-y: 0.8; scale-x: 0.85; scale-y: 0.85; }
        frame 92 { x: 31.9; y: 95.4; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 32.5; y: 95.6; skew-x: 0.3; skew-y: 0.3; }
        frame 94 { x: 33; y: 95.8; skew-x: 0; skew-y: 0; }
        frame 95 { x: 33.5; y: 95.9; skew-x: -10000; skew-y: -10000; }
        frame 96 { x: -10000; y: -10000; }
        frame 97 { x: 32; y: 96.6; skew-x: -2.2; skew-y: -2.2; }
        frame 98 { x: 30.6; y: 97.3; skew-x: -4.7; skew-y: -4.7; }
        frame 99 { x: 29.1; y: 97.9; skew-x: -6.9; skew-y: -6.9; scale-x: 0.849; scale-y: 0.849; }
        frame 100 { x: 27.7; y: 98.7; skew-x: -9.4; skew-y: -9.4; scale-x: 0.85; scale-y: 0.85; }
        frame 101 { x: 26.7; y: 99.3; skew-x: -11.7; skew-y: -11.7; scale-x: 0.849; scale-y: 0.849; }
        frame 102 { x: 25.8; y: 100.1; skew-x: -13.9; skew-y: -13.9; scale-x: 0.848; scale-y: 0.848; }
        frame 103 { x: 24.7; y: 100.8; skew-x: -16.2; skew-y: -16.2; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 23.7; y: 101.6; skew-x: -18.4; skew-y: -18.4; }
        frame 105 { x: 22.4; y: 103.7; skew-x: -25.2; skew-y: -25.2; scale-y: 0.843; }
        frame 106 { x: 21.4; y: 105.8; skew-x: -32; skew-y: -32; scale-y: 0.839; }
        frame 107 { x: 20.7; y: 108; skew-x: -38.8; skew-y: -38.8; scale-y: 0.835; }
        frame 108 { x: 20.3; y: 110.1; skew-x: -45.5; skew-y: -45.5; scale-x: 0.85; scale-y: 0.832; }
        frame 109 { x: 19.7; y: 111.3; skew-x: -48.3; skew-y: -48.3; scale-x: 0.849; scale-y: 0.829; }
        frame 110 { x: 19; y: 112.3; skew-x: -51; skew-y: -51; scale-x: 0.85; scale-y: 0.826; }
        frame 111 { x: 18.4; y: 113.6; skew-x: -53.8; skew-y: -53.8; scale-x: 0.851; scale-y: 0.824; }
        frame 112 { x: 17.8; y: 114.6; skew-x: -56.4; skew-y: -56.4; scale-x: 0.853; scale-y: 0.823; }
        frame 113 { x: 21.9; y: 118.2; skew-x: -73.1; skew-y: -71.3; scale-x: 0.851; scale-y: -10000; }
        frame 114 { x: 27.1; y: 120.6; skew-x: -89.6; skew-y: -86.1; scale-x: -10000; scale-y: 0.824; }
        frame 115 { x: 32.9; y: 121.5; skew-x: -105.9; skew-y: -100.7; scale-x: 0.849; scale-y: 0.825; }
        frame 116 { x: 39; y: 120.8; skew-x: -122.5; skew-y: -115.7; scale-x: -10000; scale-y: 0.826; }
        frame 117 { x: 40.5; y: 116.8; skew-x: -139.8; skew-y: -134; scale-x: 0.861; scale-y: 0.965; }
        frame 118 { x: 42.4; y: 111.7; skew-x: -157; skew-y: -152.3; scale-x: 0.876; scale-y: 1.106; }
        frame 119 { x: 43; y: 111.1; skew-x: -158.6; skew-y: -153.8; scale-x: 0.874; scale-y: 1.104; }
        frame 120 { x: 43.4; y: 110.5; skew-x: -160.1; skew-y: -155.3; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 43.9; y: 110; skew-x: -161.6; skew-y: -156.8; scale-y: 1.105; }
        frame 122 { x: 41.5; y: 118.2; skew-x: -153.3; skew-y: -148.3; scale-x: 0.867; scale-y: 1.078; }
        frame 123 { x: 39.1; y: 126.1; skew-x: -145.1; skew-y: -140; scale-x: 0.86; scale-y: 1.052; }
        frame 124 { x: 36.6; y: 133.6; skew-x: -136.8; skew-y: -131.5; scale-x: 0.853; scale-y: 1.027; }
        frame 125 { x: 34.1; y: 140.6; skew-x: -128.5; skew-y: -123; scale-x: 0.848; scale-y: 1.003; }
        frame 126 { x: 30.9; y: 143.9; skew-x: -120; skew-y: -114.5; scale-x: 0.847; scale-y: 1.026; }
        frame 127 { x: 33.4; y: 143.6; skew-x: -127.5; skew-y: -122; scale-x: 0.845; scale-y: 1.023; }
        frame 128 { x: 35.9; y: 142.8; skew-x: -135.1; skew-y: -129.6; scale-x: -10000; scale-y: 1.024; }
        frame 129 { x: 34.2; y: 143.3; skew-x: -130; skew-y: -124.5; scale-x: 0.844; scale-y: 1.023; }
        frame 130 { x: 32.6; y: 143.7; skew-x: -125; skew-y: -119.5; scale-x: 0.845; scale-y: 1.024; }
        frame 131 { x: 30.9; y: 143.9; skew-x: -120; skew-y: -114.5; scale-x: 0.847; scale-y: 1.026; }
        frame 132 { x: 33.5; y: 95.9; skew-x: 0; skew-y: 0; scale-x: 0.85; scale-y: 0.85; }
        frame 133 { x: 34.1; y: 95.5; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 134 { x: 34.9; y: 94.9; skew-x: 3; skew-y: 3; }
        frame 135 { x: 35.5; y: 94.6; skew-x: 4.6; skew-y: 4.6; }
        frame 136 { x: 36.3; y: 94; skew-x: 6.3; skew-y: 6.3; }
        frame 137 { x: 35.8; y: 96.5; skew-x: -1.2; skew-y: -1.2; scale-x: 0.849; scale-y: 0.849; }
        frame 138 { x: -10000; y: 99; skew-x: -8.7; skew-y: -8.7; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 36; y: 101.6; skew-x: -16.2; skew-y: -16.2; scale-x: 0.848; scale-y: 0.848; }
        frame 140 { x: 36.5; y: 104.5; skew-x: -23.9; skew-y: -23.9; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: 37.9; y: 108.2; skew-x: -34; skew-y: -34; scale-x: 0.847; scale-y: 0.847; }
        frame 142 { x: 40; y: 111.8; skew-x: -44; skew-y: -44; scale-x: 0.846; scale-y: 0.846; }
        frame 143 { x: 42.8; y: 115.5; skew-x: -54.3; skew-y: -54.3; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 46.1; y: 118.8; skew-x: -64.3; skew-y: -64.3; }
        frame 145 { x: 49.9; y: 121.7; skew-x: -74.3; skew-y: -74.3; scale-x: 0.847; scale-y: 0.847; }
        frame 146 { x: 51.8; y: 122.5; skew-x: -78.1; skew-y: -78.1; scale-x: 0.846; scale-y: 0.846; }
        frame 147 { x: 53.5; y: 123.3; skew-x: -81.8; skew-y: -81.8; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 55.4; y: 124; skew-x: -85.4; skew-y: -85.4; }
        frame 149 { x: 57.3; y: 124.6; skew-x: -89.1; skew-y: -89.1; }
        frame 150 { x: 59.1; y: 125.1; skew-x: -92.7; skew-y: -92.7; }
        frame 151 { x: 59; y: 125.5; skew-x: -94.7; skew-y: -94.7; scale-x: 0.845; scale-y: 0.845; }
        frame 152 { x: -10000; y: 125.8; skew-x: -96.9; skew-y: -96.9; scale-x: -10000; scale-y: -10000; }
        frame 153 { y: 126.2; skew-x: -99.2; skew-y: -99.2; scale-x: 0.844; scale-y: 0.844; }
        frame 154 { y: 126.4; skew-x: -101.4; skew-y: -101.4; scale-x: 0.845; scale-y: 0.845; }
        frame 155 { x: 58.8; y: -10000; skew-x: -101.7; skew-y: -101.7; scale-x: 0.844; scale-y: 0.844; }
        frame 156 { x: 58.6; skew-x: -101.9; skew-y: -101.9; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 58.3; skew-x: -102.2; skew-y: -102.2; }
        frame 158 { x: 58.1; y: 126.5; skew-x: -102.7; skew-y: -102.7; }
        frame 159 { x: 57.9; y: 126.6; skew-x: -103; skew-y: -103; scale-x: 0.845; scale-y: 0.845; }
        frame 160 { x: 52.8; y: 124.6; skew-x: -96.4; skew-y: -96.4; scale-x: 0.844; scale-y: 0.844; }
        frame 161 { x: 48; y: 122.4; skew-x: -89.9; skew-y: -89.9; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 43.2; y: 120.1; skew-x: -83.6; skew-y: -83.6; scale-x: 0.843; scale-y: 0.843; }
        frame 163 { x: 37.8; y: 120.2; skew-x: -80.6; skew-y: -80.6; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 32.3; y: 120.1; skew-x: -77.6; skew-y: -77.6; }
        frame 165 { x: 28; y: 116.3; skew-x: -66.8; skew-y: -66.8; scale-x: 0.841; scale-y: 0.891; }
        frame 166 { x: 24.4; y: 111.8; skew-x: -56; skew-y: -56; scale-x: 0.839; scale-y: 0.939; }
        frame 167 { x: 21.8; y: 106.7; skew-x: -45; skew-y: -45; scale-x: -10000; scale-y: 0.988; }
        frame 168 { x: 20; y: 101.4; skew-x: -34.2; skew-y: -34.2; scale-x: 0.838; scale-y: 1.038; }
        frame 169 { x: 19.3; y: 96.1; skew-x: -23.4; skew-y: -23.4; scale-x: -10000; scale-y: 1.088; }
        frame 170 { x: 23.1; y: 95.7; skew-x: -16.2; skew-y: -16.2; scale-x: 0.84; scale-y: 1.028; }
        frame 171 { x: 27; y: 95.5; skew-x: -9.2; skew-y: -9.2; scale-x: 0.843; scale-y: 0.968; }
        frame 172 { x: 31.2; y: -10000; skew-x: -2.2; skew-y: -2.2; scale-x: 0.846; scale-y: 0.909; }
        frame 173 { x: 35.3; y: 95.6; skew-x: 4.8; skew-y: 4.8; scale-x: 0.849; scale-y: 0.849; }
        frame 174 { x: 34.8; y: 95.8; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 34.5; y: 95.7; skew-x: 2.8; skew-y: 2.8; }
        frame 176 { x: 34.1; y: 95.8; skew-x: 1.8; skew-y: 1.8; scale-x: 0.85; scale-y: 0.85; }
        frame 177 { x: 33.8; y: 95.9; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 178 { x: 33.5; y: -10000; skew-x: 0; skew-y: 0; }
        frame 179 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 180 { y: 95.6; skew-x: -0.7; skew-y: -0.7; }
        frame 181 { y: 95.5; skew-x: -1.7; skew-y: -1.7; }
        frame 182 { y: 95.3; skew-x: -2.7; skew-y: -2.7; }
        frame 183 { y: -10000; skew-x: -3.9; skew-y: -3.9; }
        frame 184 { x: 33.6; skew-x: -4.9; skew-y: -4.9; scale-x: 0.849; scale-y: 0.849; }
        frame 185 { x: 33.8; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; scale-y: -10000; }
        frame 186 { x: 33.9; y: 95.5; skew-x: -7; skew-y: -7; }
        frame 187 { x: -10000; y: 95.7; skew-x: -8.2; skew-y: -8.2; }
        frame 188 { x: 32.2; y: 96; skew-x: -6.9; skew-y: -6.9; }
        frame 189 { x: 30.5; y: 96.3; skew-x: -5.7; skew-y: -5.7; }
        frame 190 { x: 29; y: 96.7; skew-x: -4.4; skew-y: -4.4; scale-x: 0.85; scale-y: 0.85; }
        frame 191 { x: 30.3; y: 94.8; skew-x: -0.7; skew-y: -0.7; scale-x: -10000; scale-y: 0.885; }
        frame 192 { x: 31.7; y: 93.1; skew-x: 2.8; skew-y: 2.8; scale-x: 0.849; scale-y: 0.92; }
        frame 193 { x: 33.1; y: 91.5; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: 0.954; }
        frame 194 { x: 34.8; y: 89.8; skew-x: 10.2; skew-y: 10.2; scale-y: 0.99; }
        frame 195 { x: 33.8; y: 91.2; skew-x: 7.8; skew-y: 7.8; scale-y: 0.954; }
        frame 196 { x: 33; y: 92.5; skew-x: 5.5; skew-y: 5.5; scale-y: 0.919; }
        frame 197 { x: 32.1; y: 93.9; skew-x: 3; skew-y: 3; scale-y: 0.885; }
        frame 198 { x: 31.4; y: 95.2; skew-x: 0.8; skew-y: 0.8; scale-x: 0.85; scale-y: 0.85; }
        frame 199 { x: 31.9; y: 95.4; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 200 { x: 32.5; y: 95.6; skew-x: 0.3; skew-y: 0.3; }
        frame 201 { x: 33; y: 95.8; skew-x: 0; skew-y: 0; }
        frame 202 { x: 33.5; y: 95.9; skew-x: -10000; skew-y: -10000; }
        frame 203 { x: -10000; y: -10000; }
        frame 204 { x: 33.3; skew-x: -0.9; skew-y: -0.9; }
        frame 205 { x: 33.1; y: 96.1; skew-x: -2.2; skew-y: -2.2; }
        frame 206 { x: 33; y: -10000; skew-x: -3.2; skew-y: -3.2; }
        frame 207 { x: 32.6; y: 96.2; skew-x: -4.4; skew-y: -4.4; }
        frame 208 { x: 32.5; y: 96.3; skew-x: -5.4; skew-y: -5.4; scale-x: 0.849; scale-y: 0.849; }
        frame 209 { x: 32.4; y: 96.5; skew-x: -6.7; skew-y: -6.7; scale-x: 0.85; scale-y: 0.85; }
        frame 210 { x: 33.5; y: 95.8; skew-x: -2.5; skew-y: -2.5; scale-x: 0.849; scale-y: 0.849; }
        frame 211 { x: 34.8; y: 95.3; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 212 { x: 36; y: 94.8; skew-x: 5.3; skew-y: 5.3; scale-x: 0.848; scale-y: 0.848; }
        frame 213 { x: 37.4; y: 94.3; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 214 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_outerleg_foot";
        frame-count: 215;
        frame 0 { x: 50.5; y: 116.6; skew-x: 356.5; skew-y: 356.5; scale-x: 0.85; scale-y: 0.85; image: IMAGE_REANIM_ZOMBIE_OUTERLEG_FOOT; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.849; scale-y: 0.849; image: none; }
        frame 2 { scale-x: 0.85; scale-y: 0.85; }
        frame 3 { scale-x: -10000; scale-y: -10000; }
        frame 6 { skew-x: 356.4; skew-y: 356.4; }
        frame 7 { skew-x: 356.5; skew-y: 356.5; }
        frame 8 { skew-x: -10000; skew-y: -10000; }
        frame 10 { y: 116.5; }
        frame 11 { y: -10000; scale-x: 0.849; scale-y: 0.849; }
        frame 12 { y: 116.6; scale-x: 0.85; scale-y: 0.85; }
        frame 13 { y: 116.7; skew-x: 356; skew-y: 356; scale-x: 0.849; scale-y: 0.849; }
        frame 14 { y: 116.8; skew-x: 355.5; skew-y: 355.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 50.4; y: 117; skew-x: 355; skew-y: 355; }
        frame 16 { x: -10000; y: 117.1; skew-x: 354.5; skew-y: 354.5; }
        frame 17 { y: 117.2; skew-x: 354; skew-y: 354; }
        frame 18 { x: 50.3; y: -10000; skew-x: 353.5; skew-y: 353.5; scale-x: 0.85; scale-y: 0.85; }
        frame 19 { x: 50.4; y: 117.1; skew-x: 354; skew-y: 354; scale-x: 0.849; scale-y: 0.849; }
        frame 20 { x: 50.3; y: 117; skew-x: 354.5; skew-y: 354.5; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 50.4; y: 116.9; skew-x: 355; skew-y: 355; }
        frame 22 { x: 50.5; y: 116.8; skew-x: 355.5; skew-y: 355.5; }
        frame 23 { x: -10000; y: 116.6; skew-x: 356; skew-y: 356; }
        frame 24 { y: -10000; skew-x: 356.5; skew-y: 356.5; scale-x: 0.85; scale-y: 0.85; }
        frame 25 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 50; y: 117.2; skew-x: 354.5; skew-y: 354.5; scale-x: 0.849; scale-y: 0.849; }
        frame 27 { x: 49.5; y: 117.7; skew-x: 352.5; skew-y: 352.5; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 48.8; y: 118.3; skew-x: 350.4; skew-y: 350.4; }
        frame 29 { x: 48.2; y: 119; skew-x: 348.2; skew-y: 348.2; }
        frame 30 { x: 47.4; y: 119.6; skew-x: 347; skew-y: 347; }
        frame 31 { x: 46.5; y: 119.9; skew-x: 345.7; skew-y: 345.7; scale-x: 0.848; scale-y: 0.848; }
        frame 32 { x: 45.6; y: 120.5; skew-x: 344.2; skew-y: 344.2; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 44.8; y: 121; skew-x: 342.9; skew-y: 342.9; scale-x: 0.849; scale-y: 0.849; }
        frame 34 { x: 41.2; skew-x: 342.7; skew-y: 342.7; scale-x: 0.848; scale-y: 0.848; }
        frame 35 { x: 37.6; y: 121.1; skew-x: 342.5; skew-y: 342.5; scale-x: 0.847; scale-y: 0.847; }
        frame 36 { x: 34.1; y: 121.3; skew-x: 342.2; skew-y: 342.2; scale-x: 0.846; scale-y: 0.846; }
        frame 37 { x: 30.6; y: 121.4; skew-x: 342; skew-y: 342; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 27; y: 121.5; skew-x: 341.7; skew-y: 341.7; }
        frame 39 { x: 27.6; y: 120.2; skew-x: 345.5; skew-y: 345.5; scale-x: 0.845; scale-y: 0.845; }
        frame 40 { x: 28.2; y: 119; skew-x: 349.2; skew-y: 349.2; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 28.9; y: 118; skew-x: 352.7; skew-y: 352.7; }
        frame 42 { x: 29.7; y: 116.8; skew-x: 356.5; skew-y: 356.5; }
        frame 43 { x: 30.5; y: 115.7; skew-x: 360; skew-y: 360; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 48 { x: 31.4; }
        frame 49 { x: 32.4; }
        frame 50 { x: 33.4; }
        frame 51 { x: 34.3; }
        frame 52 { x: 35.3; }
        frame 53 { x: 37.3; y: 116.1; skew-x: 358.9; skew-y: 358.9; }
        frame 54 { x: 39.1; y: 116.5; skew-x: 357.7; skew-y: 357.7; }
        frame 55 { x: 41.1; y: 116.9; skew-x: 356.5; skew-y: 356.5; }
        frame 56 { x: 43; y: 117.3; skew-x: 355.2; skew-y: 355.2; }
        frame 57 { x: 45; y: 117.8; skew-x: 354; skew-y: 354; }
        frame 58 { x: 46.5; y: 118.1; skew-x: 352.7; skew-y: 352.7; }
        frame 59 { x: 48; y: 118.5; skew-x: 351.2; skew-y: 351.2; scale-x: 0.844; scale-y: 0.844; }
        frame 60 { x: 49.4; y: 118.8; skew-x: 349.7; skew-y: 349.7; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 50.9; y: 119.2; skew-x: 348.2; skew-y: 348.2; }
        frame 62 { x: 52.5; y: 119.5; skew-x: 346.7; skew-y: 346.7; scale-x: 0.845; scale-y: 0.845; }
        frame 63 { x: 52; y: 118.7; skew-x: 349.2; skew-y: 349.2; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 51.5; y: 118; skew-x: 351.7; skew-y: 351.7; scale-x: 0.847; scale-y: 0.847; }
        frame 65 { x: 51.1; y: 117.2; skew-x: 354.2; skew-y: 354.2; scale-x: 0.848; scale-y: 0.848; }
        frame 66 { x: 50.5; y: 116.6; skew-x: 356.5; skew-y: 356.5; scale-x: 0.85; scale-y: 0.85; }
        frame 67 { x: 50.6; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.849; scale-y: 0.849; }
        frame 68 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 50.5; scale-x: 0.85; scale-y: 0.85; }
        frame 72 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { y: 116.8; skew-x: 355.2; skew-y: 355.2; scale-x: 0.849; scale-y: 0.849; }
        frame 74 { x: 50.3; y: 117.2; skew-x: 354; skew-y: 354; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 50.2; y: 117.6; skew-x: 352.7; skew-y: 352.7; }
        frame 76 { x: 50; y: 117.9; skew-x: 351.4; skew-y: 351.4; }
        frame 77 { x: 49.9; y: 118.3; skew-x: 349.2; skew-y: 349.2; }
        frame 78 { x: 49.8; y: 118.8; skew-x: 346.7; skew-y: 346.7; }
        frame 79 { x: 49.6; y: 119.2; skew-x: 344.4; skew-y: 344.4; scale-x: 0.848; scale-y: 0.848; }
        frame 80 { x: 49.5; y: 119.7; skew-x: 341.9; skew-y: 341.9; scale-x: 0.849; scale-y: 0.849; }
        frame 81 { x: 49.7; y: 118.7; skew-x: 346.9; skew-y: 346.9; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 50; y: 117.7; skew-x: 351.7; skew-y: 351.7; }
        frame 83 { x: 50.5; y: 116.6; skew-x: 356.5; skew-y: 356.5; scale-x: 0.85; scale-y: 0.85; }
        frame 84 { x: 50.4; y: 116.9; skew-x: 354.7; skew-y: 354.7; scale-x: 0.849; scale-y: 0.849; }
        frame 85 { x: 50.3; y: 117.4; skew-x: 352.7; skew-y: 352.7; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 50; y: 117.7; skew-x: 350.7; skew-y: 350.7; }
        frame 87 { x: 49.9; y: 118.2; skew-x: 348.7; skew-y: 348.7; }
        frame 88 { x: -10000; y: 118; skew-x: 349.5; skew-y: 349.5; }
        frame 89 { x: 50; y: 117.8; skew-x: 350.4; skew-y: 350.4; }
        frame 90 { x: 49.9; y: 117.7; skew-x: 351.2; skew-y: 351.2; }
        frame 91 { x: 50; y: 117.5; skew-x: 351.9; skew-y: 351.9; }
        frame 92 { x: 50.2; y: 117.2; skew-x: 353.2; skew-y: 353.2; }
        frame 93 { x: 50.4; y: 117.1; skew-x: 354.2; skew-y: 354.2; }
        frame 94 { x: 50.5; y: 116.8; skew-x: 355.5; skew-y: 355.5; }
        frame 95 { x: -10000; y: 116.6; skew-x: 356.5; skew-y: 356.5; scale-x: 0.85; scale-y: 0.85; }
        frame 96 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 50.2; y: 117.4; skew-x: 353; skew-y: 353; scale-x: 0.849; scale-y: 0.849; }
        frame 98 { x: 50; y: 118.3; skew-x: 349.4; skew-y: 349.4; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 49.7; y: 119.2; skew-x: 345.7; skew-y: 345.7; scale-x: 0.848; scale-y: 0.848; }
        frame 100 { x: 49.6; y: 120.1; skew-x: 342.1; skew-y: 342.1; scale-x: 0.849; scale-y: 0.849; }
        frame 101 { x: 49.3; y: 120.6; skew-x: 339.7; skew-y: 339.7; scale-x: 0.848; scale-y: 0.848; }
        frame 102 { x: 49; y: 121; skew-x: 337.2; skew-y: 337.2; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 48.8; y: 121.5; skew-x: 334.7; skew-y: 334.7; }
        frame 104 { x: 48.5; y: 122; skew-x: 332.1; skew-y: 332.1; }
        frame 105 { x: 50.8; y: 123.5; skew-x: 321.1; skew-y: 321.1; scale-x: 0.847; scale-y: 0.847; }
        frame 106 { x: 53.7; y: 124.8; skew-x: 310.1; skew-y: 310.1; scale-x: 0.846; scale-y: 0.846; }
        frame 107 { x: 57.4; y: 125.8; skew-x: 299.1; skew-y: 299.1; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 61.7; y: 126.2; skew-x: 288.1; skew-y: 288.1; scale-x: 0.847; scale-y: 0.847; }
        frame 109 { x: 67.3; y: 125.1; skew-x: 273.8; skew-y: 273.8; scale-x: 0.846; scale-y: 0.846; }
        frame 110 { x: 73.3; y: 122.8; skew-x: 259.9; skew-y: 259.9; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 79.6; y: 119.2; skew-x: 245.7; skew-y: 245.7; scale-x: 0.845; scale-y: 0.845; }
        frame 112 { x: 85.7; y: 114.5; skew-x: 231.5; skew-y: 231.5; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 83.5; y: 107; skew-x: 219.6; skew-y: 219.6; scale-x: 0.843; scale-y: 0.843; }
        frame 114 { x: 80.9; y: 98.8; skew-x: 207.6; skew-y: 207.6; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 77.6; y: 89.8; skew-x: 195.6; skew-y: 195.6; }
        frame 116 { x: 73.8; y: 80.3; skew-x: 183.8; skew-y: 183.8; }
        frame 117 { x: 55.3; y: 65; skew-x: 160; skew-y: 160; scale-x: 0.841; scale-y: 0.841; }
        frame 118 { x: 33; y: 49.5; skew-x: 136.2; skew-y: 136.2; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 34.9; y: 51; skew-x: 139.4; skew-y: 139.4; scale-x: 0.839; scale-y: 0.839; }
        frame 120 { x: 36.5; y: 52.6; skew-x: 142.6; skew-y: 142.6; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 38.3; y: 54.3; skew-x: 145.9; skew-y: 145.9; scale-x: 0.84; scale-y: 0.84; }
        frame 122 { x: 53.9; y: 75.7; skew-x: 159.5; skew-y: 160.5; scale-x: 0.841; scale-y: 0.841; }
        frame 123 { x: 68.2; y: 96.8; skew-x: 173; skew-y: 175; scale-x: 0.844; scale-y: 0.845; }
        frame 124 { x: 67.8; y: 119.7; skew-x: 186.5; skew-y: 189.3; scale-x: 0.846; scale-y: 0.847; }
        frame 125 { x: 66.3; y: 141.9; skew-x: 200.1; skew-y: 204; scale-x: 0.849; scale-y: 0.85; }
        frame 126 { x: 67.1; y: 139.2; skew-x: 197.3; skew-y: 201.1; scale-x: 0.848; scale-y: 0.849; }
        frame 127 { x: 67.8; y: 136.6; skew-x: 194.5; skew-y: 198.3; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 68.5; y: 133.8; skew-x: 191.8; skew-y: 195.6; }
        frame 129 { x: 69.2; y: 131; skew-x: 189; skew-y: 192.9; scale-x: 0.849; }
        frame 130 { x: 67.8; y: 136.5; skew-x: 194.5; skew-y: 198.3; scale-x: 0.848; }
        frame 131 { x: 66.3; y: 141.9; skew-x: 200.1; skew-y: 204; scale-x: 0.849; scale-y: 0.85; }
        frame 132 { x: 50.5; y: 116.6; skew-x: 356.5; skew-y: 356.5; scale-x: 0.85; scale-y: -10000; }
        frame 133 { x: 50; y: 117.2; skew-x: 354.5; skew-y: 354.5; scale-x: 0.849; scale-y: 0.849; }
        frame 134 { x: 49.5; y: 117.7; skew-x: 352.5; skew-y: 352.5; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 48.8; y: 118.3; skew-x: 350.4; skew-y: 350.4; }
        frame 136 { x: 48.2; y: 119; skew-x: 348.2; skew-y: 348.2; }
        frame 137 { x: 47.4; y: 119.6; skew-x: 347; skew-y: 347; }
        frame 138 { x: 46.5; y: 119.9; skew-x: 345.7; skew-y: 345.7; scale-x: 0.848; scale-y: 0.848; }
        frame 139 { x: 45.6; y: 120.5; skew-x: 344.2; skew-y: 344.2; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 44.8; y: 121; skew-x: 342.9; skew-y: 342.9; scale-x: 0.849; scale-y: 0.849; }
        frame 141 { x: 41.2; skew-x: 342.7; skew-y: 342.7; scale-x: 0.848; scale-y: 0.848; }
        frame 142 { x: 37.6; y: 121.1; skew-x: 342.5; skew-y: 342.5; scale-x: 0.847; scale-y: 0.847; }
        frame 143 { x: 34.1; y: 121.3; skew-x: 342.2; skew-y: 342.2; scale-x: 0.846; scale-y: 0.846; }
        frame 144 { x: 30.6; y: 121.4; skew-x: 342; skew-y: 342; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 27; y: 121.5; skew-x: 341.7; skew-y: 341.7; }
        frame 146 { x: 27.6; y: 120.2; skew-x: 345.5; skew-y: 345.5; scale-x: 0.845; scale-y: 0.845; }
        frame 147 { x: 28.2; y: 119; skew-x: 349.2; skew-y: 349.2; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 28.9; y: 118; skew-x: 352.7; skew-y: 352.7; }
        frame 149 { x: 29.7; y: 116.8; skew-x: 356.5; skew-y: 356.5; }
        frame 150 { x: 30.5; y: 115.7; skew-x: 360; skew-y: 360; }
        frame 151 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 155 { x: 31.4; }
        frame 156 { x: 32.4; }
        frame 157 { x: 33.4; }
        frame 158 { x: 34.3; }
        frame 159 { x: 35.3; }
        frame 160 { x: 37.3; y: 116.1; skew-x: 358.9; skew-y: 358.9; }
        frame 161 { x: 39.1; y: 116.5; skew-x: 357.7; skew-y: 357.7; }
        frame 162 { x: 41.1; y: 116.9; skew-x: 356.5; skew-y: 356.5; }
        frame 163 { x: 43; y: 117.3; skew-x: 355.2; skew-y: 355.2; }
        frame 164 { x: 45; y: 117.8; skew-x: 354; skew-y: 354; }
        frame 165 { x: 46.6; y: 118.2; skew-x: 351.7; skew-y: 351.7; }
        frame 166 { x: 48.3; y: 118.5; skew-x: 349.7; skew-y: 349.7; scale-x: 0.844; scale-y: 0.844; }
        frame 167 { x: 50; y: 118.8; skew-x: 347.4; skew-y: 347.4; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 51.8; y: 119.3; skew-x: 345.2; skew-y: 345.2; }
        frame 169 { x: 53.5; y: 119.6; skew-x: 342.9; skew-y: 342.9; }
        frame 170 { x: 52.6; y: 119.1; skew-x: 345.2; skew-y: 345.2; scale-x: 0.845; scale-y: 0.845; }
        frame 171 { x: 51.8; y: 118.5; skew-x: 347.7; skew-y: 347.7; scale-x: 0.846; scale-y: 0.846; }
        frame 172 { x: 51; y: 117.8; skew-x: 350; skew-y: 350; scale-x: 0.848; scale-y: 0.848; }
        frame 173 { x: 50.1; y: 117.5; skew-x: 352.2; skew-y: 352.2; scale-x: 0.849; scale-y: 0.849; }
        frame 174 { x: -10000; y: 117.2; skew-x: 353.2; skew-y: 353.2; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 50.3; y: 117; skew-x: 354; skew-y: 354; }
        frame 176 { x: -10000; y: 116.9; skew-x: 354.7; skew-y: 354.7; }
        frame 177 { x: 50.4; y: 116.7; skew-x: 355.7; skew-y: 355.7; }
        frame 178 { x: 50.5; y: 116.6; skew-x: 356.5; skew-y: 356.5; scale-x: 0.85; scale-y: 0.85; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { y: 116.8; skew-x: 355.2; skew-y: 355.2; scale-x: 0.849; scale-y: 0.849; }
        frame 181 { x: 50.3; y: 117.2; skew-x: 354; skew-y: 354; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 50.2; y: 117.6; skew-x: 352.7; skew-y: 352.7; }
        frame 183 { x: 50; y: 117.9; skew-x: 351.4; skew-y: 351.4; }
        frame 184 { x: 49.9; y: 118.3; skew-x: 349.2; skew-y: 349.2; }
        frame 185 { x: 49.8; y: 118.8; skew-x: 346.7; skew-y: 346.7; }
        frame 186 { x: 49.6; y: 119.2; skew-x: 344.4; skew-y: 344.4; scale-x: 0.848; scale-y: 0.848; }
        frame 187 { x: 49.5; y: 119.7; skew-x: 341.9; skew-y: 341.9; scale-x: 0.849; scale-y: 0.849; }
        frame 188 { x: 49.7; y: 118.7; skew-x: 346.9; skew-y: 346.9; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 50; y: 117.7; skew-x: 351.7; skew-y: 351.7; }
        frame 190 { x: 50.5; y: 116.6; skew-x: 356.5; skew-y: 356.5; scale-x: 0.85; scale-y: 0.85; }
        frame 191 { x: 50.4; y: 116.9; skew-x: 354.7; skew-y: 354.7; scale-x: 0.849; scale-y: 0.849; }
        frame 192 { x: 50.3; y: 117.4; skew-x: 352.7; skew-y: 352.7; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 50; y: 117.7; skew-x: 350.7; skew-y: 350.7; }
        frame 194 { x: 49.9; y: 118.2; skew-x: 348.7; skew-y: 348.7; }
        frame 195 { x: -10000; y: 118; skew-x: 349.5; skew-y: 349.5; }
        frame 196 { x: 50; y: 117.8; skew-x: 350.4; skew-y: 350.4; }
        frame 197 { x: 49.9; y: 117.7; skew-x: 351.2; skew-y: 351.2; }
        frame 198 { x: 50; y: 117.5; skew-x: 351.9; skew-y: 351.9; }
        frame 199 { x: 50.2; y: 117.2; skew-x: 353.2; skew-y: 353.2; }
        frame 200 { x: 50.4; y: 117.1; skew-x: 354.2; skew-y: 354.2; }
        frame 201 { x: 50.5; y: 116.8; skew-x: 355.5; skew-y: 355.5; }
        frame 202 { x: -10000; y: 116.6; skew-x: 356.5; skew-y: 356.5; scale-x: 0.85; scale-y: 0.85; }
        frame 203 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 204 { skew-x: 355.9; skew-y: 355.9; scale-x: 0.849; scale-y: 0.849; }
        frame 205 { x: 50.4; y: 116.8; skew-x: 355.2; skew-y: 355.2; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: -10000; y: 117; skew-x: 354.5; skew-y: 354.5; }
        frame 207 { skew-x: 353.9; skew-y: 353.9; }
        frame 208 { x: 50.3; y: 117.2; skew-x: 353.2; skew-y: 353.2; }
        frame 209 { x: 50.1; y: 117.3; skew-x: 352.5; skew-y: 352.5; }
        frame 210 { x: 49.9; y: 117.9; skew-x: 349.7; skew-y: 349.7; }
        frame 211 { x: 49.6; y: 118.6; skew-x: 347; skew-y: 347; }
        frame 212 { x: 49.4; y: 119.3; skew-x: 344.2; skew-y: 344.2; scale-x: 0.848; scale-y: 0.848; }
        frame 213 { x: 49.3; y: 119.9; skew-x: 341.4; skew-y: 341.4; scale-x: 0.849; scale-y: 0.849; }
        frame 214 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_outerleg_lower";
        frame-count: 215;
        frame 0 { x: 60.5; y: 100; skew-x: 351.7; skew-y: 351.7; scale-x: 0.7; scale-y: 0.7; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERLEG_LOWER; }
        frame 1 { x: 61.1; y: 99.4; skew-x: 353.2; skew-y: 353.2; scale-x: 0.699; scale-y: 0.699; image: none; }
        frame 2 { x: 61.8; y: 98.8; skew-x: 354.5; skew-y: 354.5; scale-x: 0.7; scale-y: 0.7; }
        frame 3 { x: 62.5; y: 98.3; skew-x: 356; skew-y: 356; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 63.2; y: 97.7; skew-x: 357.2; skew-y: 357.2; }
        frame 5 { x: 63.9; y: 97.2; skew-x: 358.7; skew-y: 358.7; }
        frame 6 { x: 64.6; y: 96.6; skew-x: 360; skew-y: 360; }
        frame 7 { x: 63.9; y: 96.8; skew-x: 358.7; skew-y: 358.7; }
        frame 8 { x: 63.1; y: 97; skew-x: 357.2; skew-y: 357.2; }
        frame 9 { x: 62.5; y: 97.2; skew-x: 356; skew-y: 356; }
        frame 10 { x: 61.9; y: 97.5; skew-x: 354.5; skew-y: 354.5; }
        frame 11 { x: 61.2; y: 97.6; skew-x: 353.2; skew-y: 353.2; scale-x: 0.699; scale-y: 0.699; }
        frame 12 { x: 60.5; y: 98; skew-x: 351.7; skew-y: 351.7; scale-x: 0.7; scale-y: 0.7; }
        frame 13 { x: 60; y: 98.3; skew-x: 350.7; skew-y: 350.7; scale-x: 0.699; scale-y: 0.699; }
        frame 14 { x: 59.5; y: 98.7; skew-x: 349.5; skew-y: 349.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 59.1; y: 98.9; skew-x: 348.5; skew-y: 348.5; }
        frame 16 { x: 58.6; y: 99.3; skew-x: 347.2; skew-y: 347.2; }
        frame 17 { x: 58.3; y: 99.5; skew-x: 346.2; skew-y: 346.2; }
        frame 18 { x: 57.6; y: 99.8; skew-x: 345; skew-y: 345; scale-x: 0.7; scale-y: 0.7; }
        frame 19 { x: 58.1; y: -10000; skew-x: 346.2; skew-y: 346.2; scale-x: 0.699; scale-y: 0.699; }
        frame 20 { x: 58.5; skew-x: 347.2; skew-y: 347.2; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 59.1; y: 100; skew-x: 348.5; skew-y: 348.5; }
        frame 22 { x: 59.5; y: -10000; skew-x: 349.5; skew-y: 349.5; }
        frame 23 { x: 59.9; skew-x: 350.7; skew-y: 350.7; }
        frame 24 { x: 60.5; skew-x: 351.7; skew-y: 351.7; scale-x: 0.7; scale-y: 0.7; }
        frame 25 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 59.4; skew-x: 349.4; skew-y: 349.4; scale-x: 0.699; scale-y: 0.699; }
        frame 27 { x: 58.3; y: 99.8; skew-x: 346.9; skew-y: 346.9; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 57.1; y: 99.9; skew-x: 344.5; skew-y: 344.5; }
        frame 29 { x: 56; y: 99.8; skew-x: 341.9; skew-y: 341.9; }
        frame 30 { x: 55.1; y: 99.1; skew-x: 342.7; skew-y: 342.7; scale-x: 0.698; scale-y: 0.698; }
        frame 31 { x: 54.4; y: 98.3; skew-x: 343.7; skew-y: 343.7; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 53.5; y: 97.5; skew-x: 344.4; skew-y: 344.4; }
        frame 33 { x: 52.8; y: 96.8; skew-x: 345.1; skew-y: 345.1; }
        frame 34 { x: 51; y: 95.7; skew-x: 349.7; skew-y: 349.7; scale-x: 0.697; scale-y: 0.708; }
        frame 35 { x: 49.3; y: 94.6; skew-x: 354.2; skew-y: 354.2; scale-x: -10000; scale-y: 0.718; }
        frame 36 { x: 47.9; y: 93.7; skew-x: 358.7; skew-y: 358.7; scale-y: 0.728; }
        frame 37 { x: 46.5; y: 93; skew-x: 363; skew-y: 363; scale-x: 0.696; scale-y: 0.739; }
        frame 38 { x: 45.3; y: 92.2; skew-x: 367.6; skew-y: 367.6; scale-x: -10000; scale-y: 0.749; }
        frame 39 { x: 44; y: 92.9; skew-x: 364.8; skew-y: 363.5; scale-y: 0.753; }
        frame 40 { x: 42.6; y: 93.7; skew-x: 362.3; skew-y: 359.7; scale-x: 0.697; scale-y: 0.757; }
        frame 41 { x: 41.4; y: 94.4; skew-x: 359.7; skew-y: 355.7; scale-x: 0.698; scale-y: 0.761; }
        frame 42 { x: 40.1; y: 95.3; skew-x: 357.2; skew-y: 351.9; scale-x: 0.699; scale-y: 0.764; }
        frame 43 { x: 38.8; y: 96.3; skew-x: 354.5; skew-y: 347.8; scale-x: 0.7; scale-y: 0.769; }
        frame 44 { x: 37.9; y: 97.3; skew-x: 351.5; skew-y: 345.7; scale-x: 0.698; scale-y: 0.765; }
        frame 45 { x: 37.2; y: 98.5; skew-x: 348.4; skew-y: 343.4; scale-x: 0.697; scale-y: 0.762; }
        frame 46 { x: 36.4; y: 99.5; skew-x: 345.4; skew-y: 341.2; scale-x: 0.695; scale-y: 0.759; }
        frame 47 { x: 35.6; y: 100.7; skew-x: 342.2; skew-y: 338.8; scale-x: 0.694; scale-y: 0.756; }
        frame 48 { x: 37; y: 99.8; skew-x: 343.2; skew-y: 340.4; scale-x: -10000; scale-y: 0.767; }
        frame 49 { x: 38.5; y: 99; skew-x: 343.9; skew-y: 341.9; scale-y: 0.778; }
        frame 50 { x: 39.8; y: 98.1; skew-x: 344.7; skew-y: 343.4; scale-y: 0.789; }
        frame 51 { x: 41.3; y: 97.3; skew-x: 345.7; skew-y: 344.9; scale-y: 0.8; }
        frame 52 { x: 42.6; y: 96.5; skew-x: 346.3; skew-y: 346.3; scale-x: 0.695; scale-y: 0.812; }
        frame 53 { x: 44.1; y: 97.3; skew-x: 345; skew-y: 345; scale-x: 0.694; scale-y: 0.788; }
        frame 54 { x: 45.7; y: 98.1; skew-x: 343.7; skew-y: 343.7; scale-x: -10000; scale-y: 0.764; }
        frame 55 { x: 47.1; y: 98.8; skew-x: 342.2; skew-y: 342.2; scale-y: 0.741; }
        frame 56 { x: 48.7; y: 99.7; skew-x: 340.7; skew-y: 340.7; scale-y: 0.717; }
        frame 57 { x: 50.3; y: 100.5; skew-x: 339.3; skew-y: 339.3; scale-x: 0.695; scale-y: 0.695; }
        frame 58 { x: 51.9; y: -10000; skew-x: 338.7; skew-y: 338.7; scale-x: 0.694; scale-y: 0.694; }
        frame 59 { x: 53.3; y: 100.6; skew-x: 338; skew-y: 338; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 54.9; y: 100.5; skew-x: 337.4; skew-y: 337.4; }
        frame 61 { x: 56.3; y: 100.6; skew-x: 336.7; skew-y: 336.7; }
        frame 62 { x: 57.8; y: 100.7; skew-x: 336; skew-y: 336; scale-x: 0.695; scale-y: 0.695; }
        frame 63 { x: 56.8; y: 100.5; skew-x: 338.2; skew-y: 335.7; scale-x: 0.698; scale-y: 0.72; }
        frame 64 { x: 55.8; y: 100.2; skew-x: 340.5; skew-y: 335.2; scale-x: 0.701; scale-y: 0.747; }
        frame 65 { x: 54.8; y: 99.8; skew-x: 342.7; skew-y: 334.9; scale-x: 0.705; scale-y: 0.774; }
        frame 66 { x: 53.6; y: 99.5; skew-x: 344.8; skew-y: 334.5; scale-x: 0.709; scale-y: 0.801; }
        frame 67 { x: 55; y: 99.3; skew-x: 346.2; skew-y: 338; scale-x: 0.707; scale-y: 0.78; }
        frame 68 { x: 56.5; y: 99.5; skew-x: 347.7; skew-y: 341.4; scale-x: 0.705; scale-y: 0.76; }
        frame 69 { x: 57.8; y: -10000; skew-x: 349; skew-y: 344.9; scale-x: 0.703; scale-y: 0.74; }
        frame 70 { x: 59.2; y: 99.6; skew-x: 350.5; skew-y: 348.4; scale-x: 0.701; scale-y: 0.72; }
        frame 71 { x: 60.5; y: 100; skew-x: 351.7; skew-y: 351.7; scale-x: 0.7; scale-y: 0.7; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 60.9; y: 98.9; skew-x: 353.2; skew-y: 353.2; scale-x: 0.699; scale-y: 0.699; }
        frame 74 { x: 61.1; y: 97.9; skew-x: 354.7; skew-y: 354.7; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 61.4; y: 97; skew-x: 356; skew-y: 356; }
        frame 76 { x: 61.6; y: 95.9; skew-x: 357.3; skew-y: 357.3; }
        frame 77 { x: 61.9; y: 95.3; skew-x: 358.2; skew-y: 358.2; }
        frame 78 { x: 62.1; y: 94.7; skew-x: 359.2; skew-y: 359.2; }
        frame 79 { x: 62.3; y: 94.2; skew-x: 360; skew-y: 360; }
        frame 80 { x: 62.4; y: 93.6; skew-x: 360.8; skew-y: 360.8; }
        frame 81 { x: 60.4; y: 95.1; skew-x: 354.7; skew-y: 354.7; scale-y: 0.734; }
        frame 82 { x: 58.3; y: 96.7; skew-x: 348.7; skew-y: 348.7; scale-y: 0.768; }
        frame 83 { x: 56.1; y: 98.5; skew-x: 342.4; skew-y: 342.4; scale-y: 0.803; }
        frame 84 { x: 53.8; y: 101.1; skew-x: 335.4; skew-y: 335.4; scale-x: 0.698; scale-y: 0.776; }
        frame 85 { x: 52; y: 103.9; skew-x: 328.4; skew-y: 328.4; scale-x: -10000; scale-y: 0.749; }
        frame 86 { x: 50.2; y: 106.3; skew-x: 321.6; skew-y: 321.6; scale-x: 0.697; scale-y: 0.723; }
        frame 87 { x: 49; y: 109.2; skew-x: 314.6; skew-y: 314.6; scale-x: 0.698; scale-y: 0.698; }
        frame 88 { x: 50.3; y: 106.7; skew-x: 320.7; skew-y: 320.7; scale-x: 0.697; scale-y: 0.697; }
        frame 89 { x: 51.6; y: 104.2; skew-x: 326.9; skew-y: 326.9; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 53.3; y: 101.8; skew-x: 333.2; skew-y: 333.2; }
        frame 91 { x: 55; y: 99.5; skew-x: 339.2; skew-y: 339.2; scale-x: 0.698; scale-y: 0.698; }
        frame 92 { x: 56.3; y: 99.6; skew-x: 342.4; skew-y: 342.4; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 57.7; y: 99.7; skew-x: 345.5; skew-y: 345.5; }
        frame 94 { x: 59.1; y: 99.8; skew-x: 348.7; skew-y: 348.7; scale-x: 0.699; scale-y: 0.699; }
        frame 95 { x: 60.5; y: 100; skew-x: 351.7; skew-y: 351.7; scale-x: 0.7; scale-y: 0.7; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 59.4; y: 99.8; skew-x: 349.5; skew-y: 349.5; scale-x: 0.699; scale-y: 0.699; }
        frame 98 { x: 58.3; y: -10000; skew-x: 347; skew-y: 347; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 57.1; y: 99.6; skew-x: 344.7; skew-y: 344.7; }
        frame 100 { x: 56.1; y: -10000; skew-x: 342.2; skew-y: 342.2; }
        frame 101 { x: 55.9; y: 98.8; skew-x: -10000; skew-y: -10000; scale-x: 0.698; scale-y: 0.698; }
        frame 102 { x: 55.5; y: 98.2; skew-x: 342; skew-y: 342; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 55.3; y: 97.4; skew-x: 341.9; skew-y: 341.9; }
        frame 104 { x: 54.9; y: 96.7; skew-x: 341.7; skew-y: 341.7; }
        frame 105 { x: 52.6; y: 97.2; skew-x: 333.4; skew-y: 333.4; scale-x: 0.696; scale-y: 0.696; }
        frame 106 { x: 50.5; y: 97.8; skew-x: 325.1; skew-y: 325.1; scale-x: 0.695; scale-y: 0.695; }
        frame 107 { x: 48.9; y: 98.7; skew-x: 316.6; skew-y: 316.6; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 47.6; y: 99.5; skew-x: 308.3; skew-y: 308.3; }
        frame 109 { x: 46.4; y: 100; skew-x: 299.8; skew-y: 299.8; scale-x: 0.694; scale-y: 0.722; }
        frame 110 { x: 45.3; y: 100.6; skew-x: 291.1; skew-y: 291.1; scale-x: -10000; scale-y: 0.751; }
        frame 111 { x: 44.5; y: 101; skew-x: 282.5; skew-y: 282.5; scale-y: 0.78; }
        frame 112 { x: 44.3; y: 101.5; skew-x: 274; skew-y: 274; scale-y: 0.808; }
        frame 113 { x: 41.4; y: 100.3; skew-x: 265.2; skew-y: 265.2; scale-x: 0.693; scale-y: 0.779; }
        frame 114 { x: 39; y: 98.5; skew-x: 256.2; skew-y: 256.2; scale-x: 0.692; scale-y: 0.749; }
        frame 115 { x: 36.8; y: 96.2; skew-x: 247.2; skew-y: 247.2; scale-x: 0.691; scale-y: 0.719; }
        frame 116 { x: 34.5; y: 93.3; skew-x: 238.2; skew-y: 238.2; scale-x: -10000; scale-y: 0.691; }
        frame 117 { x: 28.6; y: 92.5; skew-x: 208.3; skew-y: 208.3; scale-x: 0.69; scale-y: 0.69; }
        frame 118 { x: 21.5; y: 87; skew-x: 178.6; skew-y: 178.6; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 21.1; y: 87.6; skew-x: 181.8; skew-y: 181.8; }
        frame 120 { x: 20.7; y: 88.2; skew-x: 185; skew-y: 185; scale-x: 0.689; scale-y: 0.689; }
        frame 121 { x: 20.3; y: 88.8; skew-x: 188.4; skew-y: 188.4; scale-x: -10000; scale-y: -10000; }
        frame 122 { x: 22.1; y: 102.1; skew-x: 226.6; skew-y: 225.1; scale-x: 0.69; scale-y: 0.69; }
        frame 123 { x: 23.8; y: 107.8; skew-x: 264.7; skew-y: 262; scale-x: 0.693; scale-y: 0.694; }
        frame 124 { x: 19.2; y: 118.3; skew-x: 282.3; skew-y: 278.3; scale-x: 0.695; scale-y: 0.696; }
        frame 125 { x: 16; y: 127.8; skew-x: 300.1; skew-y: 294.7; scale-x: 0.698; scale-y: 0.699; }
        frame 126 { y: 127.2; skew-x: 299.3; skew-y: 293.8; scale-x: 0.697; scale-y: 0.698; }
        frame 127 { x: 15.9; y: 126.8; skew-x: 298.6; skew-y: 293.1; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -10000; y: 126.2; skew-x: 297.8; skew-y: 292.3; }
        frame 129 { y: 125.8; skew-x: 297.2; skew-y: 291.7; scale-x: 0.698; scale-y: 0.699; }
        frame 130 { x: 16; y: 126.8; skew-x: 298.6; skew-y: 293.1; scale-x: 0.697; scale-y: 0.698; }
        frame 131 { x: -10000; y: 127.8; skew-x: 300.1; skew-y: 294.7; scale-x: 0.698; scale-y: 0.699; }
        frame 132 { x: 60.5; y: 100; skew-x: 351.7; skew-y: 351.7; scale-x: 0.7; scale-y: 0.7; }
        frame 133 { x: 59.4; y: -10000; skew-x: 349.4; skew-y: 349.4; scale-x: 0.699; scale-y: 0.699; }
        frame 134 { x: 58.3; y: 99.8; skew-x: 346.9; skew-y: 346.9; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 57.1; y: 99.9; skew-x: 344.5; skew-y: 344.5; }
        frame 136 { x: 56; y: 99.8; skew-x: 341.9; skew-y: 341.9; }
        frame 137 { x: 55.1; y: 99.1; skew-x: 342.7; skew-y: 342.7; scale-x: 0.698; scale-y: 0.698; }
        frame 138 { x: 54.4; y: 98.3; skew-x: 343.7; skew-y: 343.7; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 53.5; y: 97.5; skew-x: 344.4; skew-y: 344.4; }
        frame 140 { x: 52.8; y: 96.8; skew-x: 345.1; skew-y: 345.1; }
        frame 141 { x: 51; y: 95.7; skew-x: 349.7; skew-y: 349.7; scale-x: 0.697; scale-y: 0.708; }
        frame 142 { x: 49.3; y: 94.6; skew-x: 354.2; skew-y: 354.2; scale-x: -10000; scale-y: 0.718; }
        frame 143 { x: 47.9; y: 93.7; skew-x: 358.7; skew-y: 358.7; scale-y: 0.728; }
        frame 144 { x: 46.5; y: 93; skew-x: 363; skew-y: 363; scale-x: 0.696; scale-y: 0.739; }
        frame 145 { x: 45.3; y: 92.2; skew-x: 367.6; skew-y: 367.6; scale-x: -10000; scale-y: 0.749; }
        frame 146 { x: 44; y: 92.9; skew-x: 364.8; skew-y: 363.5; scale-y: 0.753; }
        frame 147 { x: 42.6; y: 93.7; skew-x: 362.3; skew-y: 359.7; scale-x: 0.697; scale-y: 0.757; }
        frame 148 { x: 41.4; y: 94.4; skew-x: 359.7; skew-y: 355.7; scale-x: 0.698; scale-y: 0.761; }
        frame 149 { x: 40.1; y: 95.3; skew-x: 357.2; skew-y: 351.9; scale-x: 0.699; scale-y: 0.764; }
        frame 150 { x: 38.8; y: 96.3; skew-x: 354.5; skew-y: 347.8; scale-x: 0.7; scale-y: 0.769; }
        frame 151 { x: 37.9; y: 97.3; skew-x: 351.5; skew-y: 345.7; scale-x: 0.698; scale-y: 0.765; }
        frame 152 { x: 37.2; y: 98.5; skew-x: 348.4; skew-y: 343.4; scale-x: 0.697; scale-y: 0.762; }
        frame 153 { x: 36.4; y: 99.5; skew-x: 345.4; skew-y: 341.2; scale-x: 0.695; scale-y: 0.759; }
        frame 154 { x: 35.6; y: 100.7; skew-x: 342.2; skew-y: 338.8; scale-x: 0.694; scale-y: 0.756; }
        frame 155 { x: 37; y: 99.8; skew-x: 343.2; skew-y: 340.4; scale-x: -10000; scale-y: 0.767; }
        frame 156 { x: 38.5; y: 99; skew-x: 343.9; skew-y: 341.9; scale-y: 0.778; }
        frame 157 { x: 39.8; y: 98.1; skew-x: 344.7; skew-y: 343.4; scale-y: 0.789; }
        frame 158 { x: 41.3; y: 97.3; skew-x: 345.7; skew-y: 344.9; scale-y: 0.8; }
        frame 159 { x: 42.6; y: 96.5; skew-x: 346.3; skew-y: 346.3; scale-x: 0.695; scale-y: 0.812; }
        frame 160 { x: 44.1; y: 97.3; skew-x: 345; skew-y: 345; scale-x: 0.694; scale-y: 0.788; }
        frame 161 { x: 45.7; y: 98.1; skew-x: 343.7; skew-y: 343.7; scale-x: -10000; scale-y: 0.764; }
        frame 162 { x: 47.1; y: 98.8; skew-x: 342.2; skew-y: 342.2; scale-y: 0.741; }
        frame 163 { x: 48.7; y: 99.7; skew-x: 340.7; skew-y: 340.7; scale-y: 0.717; }
        frame 164 { x: 50.3; y: 100.5; skew-x: 339.3; skew-y: 339.3; scale-x: 0.695; scale-y: 0.695; }
        frame 165 { x: 51.9; y: -10000; skew-x: 338.7; skew-y: 338.7; scale-x: 0.694; scale-y: 0.694; }
        frame 166 { x: 53.3; y: 100.6; skew-x: 338; skew-y: 338; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 54.9; y: 100.5; skew-x: 337.4; skew-y: 337.4; }
        frame 168 { x: 56.3; y: 100.6; skew-x: 336.7; skew-y: 336.7; }
        frame 169 { x: 57.8; y: 100.7; skew-x: 336; skew-y: 336; scale-x: 0.695; scale-y: 0.695; }
        frame 170 { x: 56.8; y: 100.3; skew-x: 338.7; skew-y: -10000; scale-x: 0.698; scale-y: 0.711; }
        frame 171 { x: 55.8; y: 100; skew-x: 341.2; scale-x: 0.701; scale-y: 0.728; }
        frame 172 { x: 54.6; y: 99.7; skew-x: 343.7; skew-y: 335.9; scale-x: 0.705; scale-y: 0.745; }
        frame 173 { x: 53.5; y: 99.2; skew-x: 346.2; skew-y: -10000; scale-x: 0.71; scale-y: 0.763; }
        frame 174 { x: 55; y: 99.1; skew-x: 347.4; skew-y: 339.2; scale-x: 0.707; scale-y: 0.749; }
        frame 175 { x: 56.4; y: 99.3; skew-x: 348.5; skew-y: 342.2; scale-x: 0.705; scale-y: 0.737; }
        frame 176 { x: 57.8; y: 99.4; skew-x: 349.7; skew-y: 345.5; scale-x: 0.703; scale-y: 0.724; }
        frame 177 { x: 59.1; y: 99.6; skew-x: 350.7; skew-y: 348.7; scale-x: 0.701; scale-y: 0.712; }
        frame 178 { x: 60.5; y: 100; skew-x: 351.7; skew-y: 351.7; scale-x: 0.7; scale-y: 0.7; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 60.9; y: 98.9; skew-x: 353.2; skew-y: 353.2; scale-x: 0.699; scale-y: 0.699; }
        frame 181 { x: 61.1; y: 97.9; skew-x: 354.7; skew-y: 354.7; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 61.4; y: 97; skew-x: 356; skew-y: 356; }
        frame 183 { x: 61.6; y: 95.9; skew-x: 357.3; skew-y: 357.3; }
        frame 184 { x: 61.9; y: 95.3; skew-x: 358.2; skew-y: 358.2; }
        frame 185 { x: 62.1; y: 94.7; skew-x: 359.2; skew-y: 359.2; }
        frame 186 { x: 62.3; y: 94.2; skew-x: 360; skew-y: 360; }
        frame 187 { x: 62.4; y: 93.6; skew-x: 360.8; skew-y: 360.8; }
        frame 188 { x: 60.4; y: 95.1; skew-x: 354.7; skew-y: 354.7; scale-y: 0.734; }
        frame 189 { x: 58.3; y: 96.7; skew-x: 348.7; skew-y: 348.7; scale-y: 0.768; }
        frame 190 { x: 56.1; y: 98.5; skew-x: 342.4; skew-y: 342.4; scale-y: 0.803; }
        frame 191 { x: 52.5; y: 100.8; skew-x: 333.9; skew-y: 333.9; scale-x: 0.698; scale-y: 0.822; }
        frame 192 { x: 49; y: 103.3; skew-x: 325.4; skew-y: 325.4; scale-x: -10000; scale-y: 0.841; }
        frame 193 { x: 46; y: 106; skew-x: 316.9; skew-y: 316.9; scale-x: 0.697; scale-y: 0.861; }
        frame 194 { x: 43.4; y: 108.9; skew-x: 308.5; skew-y: 308.5; scale-x: 0.698; scale-y: 0.883; }
        frame 195 { x: 46.2; y: 106.3; skew-x: 316.1; skew-y: 316.1; scale-x: 0.697; scale-y: 0.852; }
        frame 196 { x: 49.3; y: 103.8; skew-x: 323.9; skew-y: 323.9; scale-x: -10000; scale-y: 0.824; }
        frame 197 { x: 52.6; y: 101.4; skew-x: 331.6; skew-y: 331.6; scale-y: 0.795; }
        frame 198 { x: 56.2; y: 99.5; skew-x: 339.2; skew-y: 339.2; scale-x: 0.698; scale-y: 0.767; }
        frame 199 { x: 57.3; y: 99.6; skew-x: 342.4; skew-y: 342.4; scale-x: -10000; scale-y: 0.75; }
        frame 200 { x: 58.4; y: 99.7; skew-x: 345.5; skew-y: 345.5; scale-y: 0.733; }
        frame 201 { x: 59.5; y: 99.8; skew-x: 348.7; skew-y: 348.7; scale-x: 0.699; scale-y: 0.716; }
        frame 202 { x: 60.5; y: 100; skew-x: 351.7; skew-y: 351.7; scale-x: 0.7; scale-y: 0.7; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 204 { x: 60.6; y: 99.5; skew-x: 352.7; skew-y: 352.7; scale-x: 0.699; scale-y: 0.699; }
        frame 205 { x: 60.9; y: 99.1; skew-x: 353.5; skew-y: 353.5; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 61; y: 98.7; skew-x: 354.2; skew-y: 354.2; }
        frame 207 { x: 61.1; y: 98.2; skew-x: 355.2; skew-y: 355.2; }
        frame 208 { x: 61.4; y: 98; skew-x: 356; skew-y: 356; }
        frame 209 { x: 61.5; y: 97.5; skew-x: 356.8; skew-y: 356.8; }
        frame 210 { x: 59.1; y: 97.7; skew-x: 351.7; skew-y: 351.7; scale-y: 0.712; }
        frame 211 { x: 56.9; y: 97.8; skew-x: 346.7; skew-y: 346.7; scale-y: 0.724; }
        frame 212 { x: 54.5; y: 98.2; skew-x: 341.7; skew-y: 341.7; scale-x: 0.698; scale-y: 0.737; }
        frame 213 { x: 52.4; y: 98.7; skew-x: 336.4; skew-y: 336.4; scale-x: 0.699; scale-y: 0.75; }
        frame 214 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_outerleg_upper";
        frame-count: 215;
        frame 0 { x: 59.9; y: 81; skew-x: 0.8; skew-y: 2.3; scale-x: 0.702; scale-y: 0.733; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERLEG_UPPER; }
        frame 1 { x: -10000; y: 80.8; skew-x: -0.5; skew-y: 0.6; scale-x: 0.701; scale-y: 0.727; image: none; }
        frame 2 { x: 59.8; y: 80.6; skew-x: -1.6; skew-y: -0.7; scale-x: -10000; scale-y: 0.721; }
        frame 3 { x: -10000; y: 80.4; skew-x: -3; skew-y: -2.2; scale-x: 0.7; scale-y: 0.716; }
        frame 4 { x: 59.9; y: 80.2; skew-x: -4.1; skew-y: -3.6; scale-x: -10000; scale-y: 0.71; }
        frame 5 { x: -10000; y: 80.1; skew-x: -5.5; skew-y: -5.2; scale-y: 0.705; }
        frame 6 { x: 60; y: 79.8; skew-x: -6.6; skew-y: -6.6; scale-y: 0.7; }
        frame 7 { x: 59.9; y: 80; skew-x: -5.5; skew-y: -5.2; scale-y: 0.705; }
        frame 8 { x: -10000; y: 80.2; skew-x: -4.1; skew-y: -3.6; scale-y: 0.71; }
        frame 9 { x: 59.8; y: 80.3; skew-x: -3; skew-y: -2.2; scale-y: 0.716; }
        frame 10 { x: 59.9; y: 80.5; skew-x: -1.6; skew-y: -0.7; scale-x: 0.701; scale-y: 0.721; }
        frame 11 { x: -10000; y: 80.8; skew-x: -0.5; skew-y: 0.6; scale-x: -10000; scale-y: 0.727; }
        frame 12 { y: 81; skew-x: 0.8; skew-y: 2.3; scale-x: 0.702; scale-y: 0.733; }
        frame 13 { x: 60; y: 80.7; skew-x: 2.2; skew-y: 3.8; scale-x: -10000; scale-y: 0.737; }
        frame 14 { y: 80.4; skew-x: 3.6; skew-y: 5.4; scale-y: 0.741; }
        frame 15 { x: 60.1; y: 80; skew-x: 5; skew-y: 7; scale-y: 0.746; }
        frame 16 { x: 60.3; y: 79.8; skew-x: 6.4; skew-y: 8.6; scale-x: 0.703; scale-y: 0.75; }
        frame 17 { x: 60.4; y: 79.5; skew-x: 7.9; skew-y: 10.2; scale-x: -10000; scale-y: 0.755; }
        frame 18 { x: 60.5; y: 79.2; skew-x: 9.4; skew-y: 11.9; scale-x: 0.704; scale-y: 0.76; }
        frame 19 { x: 60.3; y: 79.5; skew-x: 7.9; skew-y: 10.2; scale-x: 0.703; scale-y: 0.755; }
        frame 20 { x: 60.2; y: 79.8; skew-x: 6.4; skew-y: 8.6; scale-x: -10000; scale-y: 0.75; }
        frame 21 { x: -10000; y: 80; skew-x: 5; skew-y: 7; scale-x: 0.702; scale-y: 0.746; }
        frame 22 { x: 59.9; y: 80.4; skew-x: 3.6; skew-y: 5.4; scale-x: -10000; scale-y: 0.741; }
        frame 23 { x: -10000; y: 80.7; skew-x: 2.2; skew-y: 3.8; scale-y: 0.737; }
        frame 24 { y: 81; skew-x: 0.8; skew-y: 2.3; scale-y: 0.733; }
        frame 25 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { x: 59.7; y: 80.5; skew-x: 2.3; skew-y: 3.8; scale-x: 0.701; scale-y: 0.732; }
        frame 27 { x: 59.6; y: 80; skew-x: 4.1; skew-y: 5.5; scale-x: 0.7; scale-y: 0.731; }
        frame 28 { x: -10000; y: 79.5; skew-x: 5.8; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 59.5; y: 79.1; skew-x: 7.6; skew-y: 9; }
        frame 30 { x: 59.7; y: 78.5; skew-x: 10.6; skew-y: 12; scale-x: 0.699; scale-y: 0.73; }
        frame 31 { x: 59.6; y: 77.8; skew-x: 13.4; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -10000; y: 77.3; skew-x: 16.4; skew-y: 17.8; }
        frame 33 { x: 59.8; y: 76.6; skew-x: 19.4; skew-y: 20.9; scale-x: 0.7; scale-y: 0.731; }
        frame 34 { x: 59.9; y: 75.7; skew-x: 23.7; skew-y: 24.9; scale-x: 0.696; scale-y: 0.75; }
        frame 35 { x: 60.3; y: 74.8; skew-x: 28; skew-y: 28.9; scale-x: 0.693; scale-y: 0.771; }
        frame 36 { x: 60.8; y: 74.2; skew-x: 32.3; skew-y: 33; scale-x: 0.691; scale-y: 0.792; }
        frame 37 { x: 61.2; y: 73.6; skew-x: 36.7; skew-y: 36.9; scale-x: 0.686; scale-y: 0.813; }
        frame 38 { x: 61.7; y: 73.1; skew-x: 40.9; skew-y: 40.8; scale-x: 0.684; scale-y: 0.835; }
        frame 39 { x: 60; y: 73.8; skew-x: 38.9; skew-y: 39.5; scale-x: 0.687; scale-y: 0.818; }
        frame 40 { x: 58.3; y: 74.6; skew-x: 37; skew-y: 38; scale-x: 0.69; scale-y: 0.803; }
        frame 41 { x: 56.5; y: 75.5; skew-x: 34.9; skew-y: 36.4; scale-x: 0.693; scale-y: 0.787; }
        frame 42 { x: 55; y: 76.3; skew-x: 32.9; skew-y: 34.9; scale-x: 0.696; scale-y: 0.771; }
        frame 43 { x: 53.1; y: 77.1; skew-x: 30.9; skew-y: 33.5; scale-x: 0.7; scale-y: 0.757; }
        frame 44 { x: 53.5; y: -10000; skew-x: 31; skew-y: 35.4; scale-x: -10000; scale-y: 0.798; }
        frame 45 { x: 53.9; skew-x: 31.1; skew-y: 37.1; scale-x: 0.701; scale-y: 0.841; }
        frame 46 { x: 54.3; y: 77.2; skew-x: -10000; skew-y: 38.8; scale-x: 0.703; scale-y: 0.884; }
        frame 47 { x: 54.8; y: 77.3; skew-y: 40.4; scale-x: 0.706; scale-y: 0.929; }
        frame 48 { x: 54.5; y: 76.8; skew-x: 29.8; skew-y: 37.9; scale-x: 0.703; scale-y: 0.895; }
        frame 49 { x: 54; y: 76.4; skew-x: 28.3; skew-y: 35.2; scale-x: 0.702; scale-y: 0.864; }
        frame 50 { x: 53.9; y: 76.2; skew-x: 27; skew-y: 32.7; scale-x: 0.701; scale-y: 0.832; }
        frame 51 { x: 53.5; y: 75.8; skew-x: 25.5; skew-y: 29.9; scale-x: 0.7; scale-y: 0.8; }
        frame 52 { x: 53.3; y: 75.7; skew-x: 24.1; skew-y: 27.3; scale-x: -10000; scale-y: 0.77; }
        frame 53 { x: 53.1; y: 76; skew-x: 20.2; skew-y: 23.3; scale-x: 0.699; scale-y: 0.767; }
        frame 54 { x: 52.9; y: 76.3; skew-x: 16; skew-y: 19.1; scale-x: -10000; scale-y: 0.766; }
        frame 55 { x: -10000; y: 76.9; skew-x: 12; skew-y: 15; scale-y: 0.765; }
        frame 56 { y: 77.3; skew-x: 8; skew-y: 11; scale-y: -10000; }
        frame 57 { x: 52.8; y: 78; skew-x: 4.2; skew-y: 7.1; scale-y: 0.764; }
        frame 58 { x: 53.7; y: 78.1; skew-x: 3; skew-y: 5.9; scale-y: -10000; }
        frame 59 { x: 54.6; y: -10000; skew-x: 1.7; skew-y: 4.7; scale-x: 0.698; scale-y: 0.765; }
        frame 60 { x: 55.5; skew-x: 0.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 56.3; y: 78.3; skew-x: -0.7; skew-y: 2.3; scale-y: 0.766; }
        frame 62 { x: 57.3; y: 78.1; skew-x: -1.8; skew-y: 1.2; scale-y: 0.767; }
        frame 63 { x: 57.5; y: 78.2; skew-x: 0.6; skew-y: 3.9; scale-x: 0.699; scale-y: 0.773; }
        frame 64 { x: 57.8; y: 78.1; skew-x: 3.2; skew-y: 6.7; scale-x: 0.701; scale-y: 0.779; }
        frame 65 { x: 58; y: 78.2; skew-x: 5.9; skew-y: 9.6; scale-x: 0.702; scale-y: 0.785; }
        frame 66 { x: 58.5; y: 78.5; skew-x: 8.5; skew-y: 12.4; scale-x: 0.705; scale-y: 0.793; }
        frame 67 { x: 58.8; y: 78.9; skew-x: 7; skew-y: 10.4; scale-x: 0.703; scale-y: 0.78; }
        frame 68 { x: 59; y: 79.3; skew-x: 5.3; skew-y: 8.2; scale-x: -10000; scale-y: 0.768; }
        frame 69 { x: 59.3; y: 79.8; skew-x: 3.8; skew-y: 6.2; scale-x: 0.702; scale-y: 0.756; }
        frame 70 { x: 59.5; y: 80.4; skew-x: 2.3; skew-y: 4.2; scale-x: -10000; scale-y: 0.744; }
        frame 71 { x: 59.9; y: 81; skew-x: 0.8; skew-y: 2.3; scale-y: 0.733; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 73 { y: 80.2; skew-x: 0; skew-y: 1.5; scale-x: 0.701; scale-y: 0.732; }
        frame 74 { x: 59.8; y: 79.5; skew-x: -0.6; skew-y: 0.7; scale-x: -10000; scale-y: 0.731; }
        frame 75 { x: 59.9; y: 78.7; skew-x: -1.4; skew-y: 0; scale-x: 0.7; scale-y: -10000; }
        frame 76 { x: 59.8; y: 77.9; skew-x: -2.1; skew-y: -0.7; scale-x: -10000; }
        frame 77 { x: 59.9; y: 77.7; skew-x: -2.6; skew-y: -1.2; }
        frame 78 { x: 60; y: 77.6; skew-x: -3.1; skew-y: -1.7; }
        frame 79 { x: 60.1; y: 77.2; skew-x: -3.6; skew-y: -2.2; }
        frame 80 { x: -10000; y: 77.1; skew-x: -4.1; skew-y: -2.7; }
        frame 81 { x: 57.8; y: 77.4; skew-x: -10000; skew-y: -2.6; }
        frame 82 { x: 55.5; y: 77.7; skew-x: -3.8; skew-y: -2.4; scale-x: 0.701; scale-y: 0.732; }
        frame 83 { x: 53.3; y: 77.9; skew-x: -3.6; skew-y: -2.2; scale-x: 0.702; scale-y: 0.733; }
        frame 84 { x: 53.5; y: 77.6; skew-x: -1.1; skew-y: 3.4; scale-x: 0.707; scale-y: 0.813; }
        frame 85 { x: 53.8; y: 77.4; skew-x: 1.3; skew-y: 8.9; scale-x: 0.714; scale-y: 0.895; }
        frame 86 { x: 54.4; y: -10000; skew-x: 3.9; skew-y: 14.1; scale-x: 0.721; scale-y: 0.977; }
        frame 87 { x: 55.3; y: 77.5; skew-x: 6.5; skew-y: 19.2; scale-x: 0.73; scale-y: 1.06; }
        frame 88 { x: 55.5; y: 77.6; skew-x: 5.4; skew-y: 15.7; scale-x: 0.721; scale-y: 0.976; }
        frame 89 { x: 55.8; y: 77.7; skew-x: 4.6; skew-y: 12.1; scale-x: 0.713; scale-y: 0.894; }
        frame 90 { x: 56.1; y: 78; skew-x: 3.6; skew-y: 8.2; scale-x: 0.706; scale-y: 0.812; }
        frame 91 { x: 56.7; y: 78.3; skew-x: 2.8; skew-y: 4.3; scale-x: 0.7; scale-y: 0.731; }
        frame 92 { x: 57.5; y: 79; skew-x: 2.3; skew-y: 3.7; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 58.2; y: 79.6; skew-x: 1.8; skew-y: 3.2; }
        frame 94 { x: 59; y: 80.3; skew-x: 1.3; skew-y: 2.7; scale-x: 0.701; scale-y: 0.732; }
        frame 95 { x: 59.9; y: 81; skew-x: 0.8; skew-y: 2.3; scale-x: 0.702; scale-y: 0.733; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 59.2; y: 80.3; skew-x: 1.9; skew-y: 3.3; scale-x: 0.701; scale-y: 0.732; }
        frame 98 { x: 58.8; y: 79.8; skew-x: 3.1; skew-y: 4.5; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 58.2; y: 79.3; skew-x: 4.3; skew-y: 5.8; scale-x: 0.7; scale-y: 0.731; }
        frame 100 { x: 57.6; y: 78.7; skew-x: 5.6; skew-y: 7; scale-x: 0.701; scale-y: 0.732; }
        frame 101 { x: 55.7; y: 77.9; skew-x: 1; skew-y: 3; scale-x: -10000; scale-y: 0.746; }
        frame 102 { x: 53.6; y: 77.2; skew-x: -3.5; skew-y: -0.8; scale-x: 0.702; scale-y: 0.761; }
        frame 103 { x: 51.8; y: 76.6; skew-x: -8.1; skew-y: -4.8; scale-x: 0.703; scale-y: 0.777; }
        frame 104 { x: 49.6; y: 76; skew-x: -12.6; skew-y: -8.8; scale-x: 0.705; scale-y: 0.792; }
        frame 105 { x: 44.5; y: 77.3; skew-x: -21.4; skew-y: -16.8; scale-x: 0.706; scale-y: 0.812; }
        frame 106 { x: 39.8; y: 78.9; skew-x: -30.4; skew-y: -25; scale-x: -10000; scale-y: 0.831; }
        frame 107 { x: 35.3; y: 80.8; skew-x: -39.3; skew-y: -33.2; scale-x: 0.707; scale-y: 0.85; }
        frame 108 { x: 31; y: 82.7; skew-x: -48.2; skew-y: -41.4; scale-x: 0.709; scale-y: 0.871; }
        frame 109 { x: 27.9; y: 83.8; skew-x: -53.3; skew-y: -45.6; scale-x: 0.71; scale-y: 0.893; }
        frame 110 { x: 25.1; y: 85; skew-x: -58.3; skew-y: -49.8; scale-x: 0.712; scale-y: 0.917; }
        frame 111 { x: 22.3; y: 86.1; skew-x: -63.3; skew-y: -54; scale-x: 0.714; scale-y: 0.941; }
        frame 112 { x: 19.6; y: 87.5; skew-x: -68.3; skew-y: -58.2; scale-x: 0.718; scale-y: 0.967; }
        frame 113 { x: 15.9; y: 91.8; skew-x: -80.3; skew-y: -70.3; scale-x: 0.716; scale-y: 0.965; }
        frame 114 { x: 13.1; y: 95.8; skew-x: -92.4; skew-y: -82.3; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 11.3; y: 99.3; skew-x: -104.4; skew-y: -94.3; }
        frame 116 { x: 10.2; y: 102.2; skew-x: -116.2; skew-y: -106.2; }
        frame 117 { x: 8.4; y: 108.5; skew-x: -138; skew-y: -128; scale-x: 0.715; scale-y: 0.963; }
        frame 118 { x: 7.5; y: 111.8; skew-x: -160.1; skew-y: -150.1; scale-x: 0.716; scale-y: 0.964; }
        frame 119 { x: 9.7; y: -10000; skew-x: -163.8; skew-y: -153.8; scale-x: 0.714; scale-y: 0.962; }
        frame 120 { x: 11.7; skew-x: -167.3; skew-y: -157.3; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 13.8; y: 111.7; skew-x: -171; skew-y: -160.9; scale-x: 0.715; scale-y: 0.963; }
        frame 122 { x: 7.3; y: 116.3; skew-x: -141.5; skew-y: -132.7; scale-x: 0.702; scale-y: 0.951; }
        frame 123 { x: 2.1; y: 115.7; skew-x: -112.2; skew-y: -104.7; scale-x: 0.691; scale-y: 0.941; }
        frame 124 { x: -4; y: 115.2; skew-x: -85.6; skew-y: -79.6; scale-x: 0.678; scale-y: 0.929; }
        frame 125 { x: -6.4; y: 113.3; skew-x: -59.1; skew-y: -54.4; scale-x: 0.667; scale-y: 0.918; }
        frame 126 { x: -10000; y: 113; skew-x: -59.2; skew-y: -54.6; scale-x: 0.666; scale-y: 0.917; }
        frame 127 { x: -6.6; y: 112.6; skew-x: -59.5; skew-y: -54.8; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -6.7; y: 112.2; skew-x: -59.7; skew-y: -54.9; scale-x: 0.667; scale-y: 0.916; }
        frame 129 { x: -6.8; y: 111.8; skew-x: -59.8; skew-y: -55.1; scale-x: 0.668; scale-y: 0.918; }
        frame 130 { x: -6.2; y: 112; skew-x: -56.7; skew-y: -52.1; scale-x: 0.666; scale-y: 0.917; }
        frame 131 { x: -5.5; y: 112.2; skew-x: -53.6; skew-y: -48.9; scale-x: 0.668; scale-y: 0.918; }
        frame 132 { x: 59.9; y: 81; skew-x: 0.8; skew-y: 2.3; scale-x: 0.702; scale-y: 0.733; }
        frame 133 { x: 59.7; y: 80.5; skew-x: 2.3; skew-y: 3.8; scale-x: 0.701; scale-y: 0.732; }
        frame 134 { x: 59.6; y: 80; skew-x: 4.1; skew-y: 5.5; scale-x: 0.7; scale-y: 0.731; }
        frame 135 { x: -10000; y: 79.5; skew-x: 5.8; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 136 { x: 59.5; y: 79.1; skew-x: 7.6; skew-y: 9; }
        frame 137 { x: 59.7; y: 78.5; skew-x: 10.6; skew-y: 12; scale-x: 0.699; scale-y: 0.73; }
        frame 138 { x: 59.6; y: 77.8; skew-x: 13.4; skew-y: 14.8; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: -10000; y: 77.3; skew-x: 16.4; skew-y: 17.8; }
        frame 140 { x: 59.8; y: 76.6; skew-x: 19.4; skew-y: 20.9; scale-x: 0.7; scale-y: 0.731; }
        frame 141 { x: 59.9; y: 75.7; skew-x: 23.7; skew-y: 24.9; scale-x: 0.696; scale-y: 0.75; }
        frame 142 { x: 60.3; y: 74.8; skew-x: 28; skew-y: 28.9; scale-x: 0.693; scale-y: 0.771; }
        frame 143 { x: 60.8; y: 74.2; skew-x: 32.3; skew-y: 33; scale-x: 0.691; scale-y: 0.792; }
        frame 144 { x: 61.2; y: 73.6; skew-x: 36.7; skew-y: 36.9; scale-x: 0.686; scale-y: 0.813; }
        frame 145 { x: 61.7; y: 73.1; skew-x: 40.9; skew-y: 40.8; scale-x: 0.684; scale-y: 0.835; }
        frame 146 { x: 60; y: 73.8; skew-x: 38.9; skew-y: 39.5; scale-x: 0.687; scale-y: 0.818; }
        frame 147 { x: 58.3; y: 74.6; skew-x: 37; skew-y: 38; scale-x: 0.69; scale-y: 0.803; }
        frame 148 { x: 56.5; y: 75.5; skew-x: 34.9; skew-y: 36.4; scale-x: 0.693; scale-y: 0.787; }
        frame 149 { x: 55; y: 76.3; skew-x: 32.9; skew-y: 34.9; scale-x: 0.696; scale-y: 0.771; }
        frame 150 { x: 53.1; y: 77.1; skew-x: 30.9; skew-y: 33.5; scale-x: 0.7; scale-y: 0.757; }
        frame 151 { x: 53.5; y: -10000; skew-x: 31; skew-y: 35.4; scale-x: -10000; scale-y: 0.798; }
        frame 152 { x: 53.9; skew-x: 31.1; skew-y: 37.1; scale-x: 0.701; scale-y: 0.841; }
        frame 153 { x: 54.3; y: 77.2; skew-x: -10000; skew-y: 38.8; scale-x: 0.703; scale-y: 0.884; }
        frame 154 { x: 54.8; y: 77.3; skew-y: 40.4; scale-x: 0.706; scale-y: 0.929; }
        frame 155 { x: 54.5; y: 76.8; skew-x: 29.8; skew-y: 37.9; scale-x: 0.703; scale-y: 0.895; }
        frame 156 { x: 54; y: 76.4; skew-x: 28.3; skew-y: 35.2; scale-x: 0.702; scale-y: 0.864; }
        frame 157 { x: 53.9; y: 76.2; skew-x: 27; skew-y: 32.7; scale-x: 0.701; scale-y: 0.832; }
        frame 158 { x: 53.5; y: 75.8; skew-x: 25.5; skew-y: 29.9; scale-x: 0.7; scale-y: 0.8; }
        frame 159 { x: 53.3; y: 75.7; skew-x: 24.1; skew-y: 27.3; scale-x: -10000; scale-y: 0.77; }
        frame 160 { x: 53.1; y: 76; skew-x: 20.2; skew-y: 23.3; scale-x: 0.699; scale-y: 0.767; }
        frame 161 { x: 52.9; y: 76.3; skew-x: 16; skew-y: 19.1; scale-x: -10000; scale-y: 0.766; }
        frame 162 { x: -10000; y: 76.9; skew-x: 12; skew-y: 15; scale-y: 0.765; }
        frame 163 { y: 77.3; skew-x: 8; skew-y: 11; scale-y: -10000; }
        frame 164 { x: 52.8; y: 78; skew-x: 4.2; skew-y: 7.1; scale-y: 0.764; }
        frame 165 { x: 53.7; y: 78.1; skew-x: 3; skew-y: 5.9; scale-y: -10000; }
        frame 166 { x: 54.6; y: -10000; skew-x: 1.7; skew-y: 4.7; scale-x: 0.698; scale-y: 0.765; }
        frame 167 { x: 55.5; skew-x: 0.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 56.3; y: 78.3; skew-x: -0.7; skew-y: 2.3; scale-y: 0.766; }
        frame 169 { x: 57.3; y: 78.1; skew-x: -1.8; skew-y: 1.2; scale-y: 0.767; }
        frame 170 { x: 57.9; y: -10000; skew-x: 0.6; skew-y: 3.9; scale-x: 0.699; scale-y: 0.773; }
        frame 171 { x: 58.4; y: 78.3; skew-x: 3.2; skew-y: 6.7; scale-x: 0.701; scale-y: 0.779; }
        frame 172 { x: 58.9; y: 78.4; skew-x: 5.8; skew-y: 9.5; scale-x: 0.702; scale-y: 0.785; }
        frame 173 { x: 59.6; y: 78.7; skew-x: 8.4; skew-y: 12.3; scale-x: 0.705; scale-y: 0.793; }
        frame 174 { x: 59.5; y: 79.2; skew-x: 6.8; skew-y: 10.2; scale-x: 0.703; scale-y: 0.78; }
        frame 175 { x: 59.6; y: 79.6; skew-x: 5.3; skew-y: 8.2; scale-x: -10000; scale-y: 0.768; }
        frame 176 { x: -10000; y: 80; skew-x: 3.8; skew-y: 6.2; scale-x: 0.702; scale-y: 0.756; }
        frame 177 { x: 59.7; y: 80.5; skew-x: 2.3; skew-y: 4.2; scale-x: -10000; scale-y: 0.744; }
        frame 178 { x: 59.9; y: 81; skew-x: 0.8; skew-y: 2.3; scale-y: 0.733; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 180 { y: 80.2; skew-x: 0; skew-y: 1.5; scale-x: 0.701; scale-y: 0.732; }
        frame 181 { x: 59.8; y: 79.5; skew-x: -0.6; skew-y: 0.7; scale-x: -10000; scale-y: 0.731; }
        frame 182 { x: 59.9; y: 78.7; skew-x: -1.4; skew-y: 0; scale-x: 0.7; scale-y: -10000; }
        frame 183 { x: 59.8; y: 77.9; skew-x: -2.1; skew-y: -0.7; scale-x: -10000; }
        frame 184 { x: 59.9; y: 77.7; skew-x: -2.6; skew-y: -1.2; }
        frame 185 { x: 60; y: 77.6; skew-x: -3.1; skew-y: -1.7; }
        frame 186 { x: 60.1; y: 77.2; skew-x: -3.6; skew-y: -2.2; }
        frame 187 { x: -10000; y: 77.1; skew-x: -4.1; skew-y: -2.7; }
        frame 188 { x: 57.8; y: 77.4; skew-x: -10000; skew-y: -2.6; }
        frame 189 { x: 55.5; y: 77.7; skew-x: -3.8; skew-y: -2.4; scale-x: 0.701; scale-y: 0.732; }
        frame 190 { x: 53.3; y: 77.9; skew-x: -3.6; skew-y: -2.2; scale-x: 0.702; scale-y: 0.733; }
        frame 191 { x: 53.5; y: 77.6; skew-x: -1.1; skew-y: 3.4; scale-x: 0.707; scale-y: 0.813; }
        frame 192 { x: 53.8; y: 77.4; skew-x: 1.3; skew-y: 8.9; scale-x: 0.714; scale-y: 0.895; }
        frame 193 { x: 54.4; y: -10000; skew-x: 3.9; skew-y: 14.1; scale-x: 0.721; scale-y: 0.977; }
        frame 194 { x: 55.3; y: 77.5; skew-x: 6.5; skew-y: 19.2; scale-x: 0.73; scale-y: 1.06; }
        frame 195 { x: 55.5; y: 77.6; skew-x: 5.4; skew-y: 15.7; scale-x: 0.721; scale-y: 0.976; }
        frame 196 { x: 55.8; y: 77.7; skew-x: 4.6; skew-y: 12.1; scale-x: 0.713; scale-y: 0.894; }
        frame 197 { x: 56.1; y: 78; skew-x: 3.6; skew-y: 8.2; scale-x: 0.706; scale-y: 0.812; }
        frame 198 { x: 56.7; y: 78.3; skew-x: 2.8; skew-y: 4.3; scale-x: 0.7; scale-y: 0.731; }
        frame 199 { x: 57.5; y: 79; skew-x: 2.3; skew-y: 3.7; scale-x: -10000; scale-y: -10000; }
        frame 200 { x: 58.2; y: 79.6; skew-x: 1.8; skew-y: 3.2; }
        frame 201 { x: 59; y: 80.3; skew-x: 1.3; skew-y: 2.7; scale-x: 0.701; scale-y: 0.732; }
        frame 202 { x: 59.9; y: 81; skew-x: 0.8; skew-y: 2.3; scale-x: 0.702; scale-y: 0.733; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 204 { x: 60.4; y: 80.3; skew-x: 1.6; skew-y: 3; scale-x: 0.701; scale-y: 0.732; }
        frame 205 { x: 60.8; y: 79.5; skew-x: 2.6; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 61.1; y: 78.7; skew-x: 3.3; skew-y: 4.8; }
        frame 207 { x: 61.7; y: 77.8; skew-x: 4.3; skew-y: 5.8; }
        frame 208 { x: 62.2; y: 77.2; skew-x: 5.3; skew-y: 6.7; }
        frame 209 { x: 62.7; y: 76.3; skew-x: 6.2; skew-y: 7.6; scale-x: 0.702; scale-y: 0.733; }
        frame 210 { x: 61.8; y: 75.5; skew-x: 8.3; skew-y: 10.4; scale-x: 0.7; scale-y: 0.765; }
        frame 211 { x: 61.1; y: 74.6; skew-x: 10.6; skew-y: 13.2; scale-x: -10000; scale-y: 0.799; }
        frame 212 { x: 60.4; y: 73.8; skew-x: 12.6; skew-y: 15.8; scale-x: 0.699; scale-y: 0.832; }
        frame 213 { x: 59.8; y: 73.1; skew-x: 14.9; skew-y: 18.6; scale-x: -10000; scale-y: 0.867; }
        frame 214 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_body2";
        frame-count: 215;
        frame 0 { x: 45.5; y: 67.4; scale-x: 0.85; scale-y: 0.85; image: IMAGE_REANIM_ZOMBIE_LADDER_BODY2; }
        frame 1 { x: -10000; y: 67.2; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 67; }
        frame 3 { y: 66.8; }
        frame 4 { y: 66.6; }
        frame 5 { y: 66.3; }
        frame 6 { y: 66.2; }
        frame 7 { y: 66.3; }
        frame 8 { y: 66.6; }
        frame 9 { y: 66.8; }
        frame 10 { y: 67; }
        frame 11 { y: 67.2; }
        frame 12 { y: 67.4; }
        frame 13 { y: 67.6; }
        frame 14 { y: 67.8; }
        frame 15 { y: 67.9; }
        frame 16 { y: 68.1; }
        frame 17 { y: 68.3; }
        frame 18 { y: 68.4; }
        frame 19 { y: 68.3; }
        frame 20 { y: 68.1; }
        frame 21 { y: 67.9; }
        frame 22 { y: 67.8; }
        frame 23 { y: 67.6; }
        frame 24 { y: 67.4; }
        frame 25 { y: -10000; }
        frame 26 { x: 45.8; y: 67.1; skew-x: 1; skew-y: 1; }
        frame 27 { x: 46; y: 66.8; skew-x: 2; skew-y: 2; }
        frame 28 { x: 46.3; y: 66.5; skew-x: 3; skew-y: 3; }
        frame 29 { x: 46.4; y: 66.2; skew-x: 4; skew-y: 4; }
        frame 30 { x: 46.5; y: 65.3; skew-x: 5.6; skew-y: 5.6; scale-x: 0.849; scale-y: 0.849; }
        frame 31 { x: 46.9; y: 64.4; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 47.1; y: 63.5; skew-x: 9; skew-y: 9; }
        frame 33 { x: 47.4; y: 62.6; skew-x: 10.8; skew-y: 10.8; }
        frame 34 { x: 48.5; y: 62; skew-x: 13.8; skew-y: 13; scale-x: 0.826; scale-y: 0.848; }
        frame 35 { x: 49.6; y: 61.5; skew-x: 16.6; skew-y: 15.3; scale-x: 0.804; scale-y: 0.847; }
        frame 36 { x: 50.9; y: 61.1; skew-x: 19.6; skew-y: 17.8; scale-x: 0.781; scale-y: 0.846; }
        frame 37 { x: 52.1; y: 60.8; skew-x: 22.6; skew-y: 20.1; scale-x: 0.758; scale-y: 0.845; }
        frame 38 { x: 53.3; y: 60.5; skew-x: 25.6; skew-y: 22.5; scale-x: 0.737; scale-y: -10000; }
        frame 39 { x: 53; y: 60.1; skew-x: 27; skew-y: 23.8; scale-x: 0.734; scale-y: 0.855; }
        frame 40 { x: 52.6; y: 59.7; skew-x: 28.3; skew-y: 25.1; scale-x: 0.732; scale-y: 0.867; }
        frame 41 { x: 52.4; y: 59.1; skew-x: 29.8; skew-y: 26.3; scale-x: 0.731; scale-y: 0.878; }
        frame 42 { x: 52; y: 58.7; skew-x: 31.3; skew-y: 27.8; scale-x: 0.729; scale-y: 0.889; }
        frame 43 { x: 51.9; y: 58.2; skew-x: 32.8; skew-y: 29.1; scale-x: -10000; scale-y: 0.902; }
        frame 44 { x: 51.6; y: 59; skew-x: 32.6; skew-y: 28.8; scale-x: 0.727; scale-y: 0.9; }
        frame 45 { x: 51.3; y: 59.9; skew-x: 32.3; skew-y: 28.6; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 51; y: 60.6; skew-x: 32.1; skew-y: 28.3; scale-y: 0.899; }
        frame 47 { x: 50.7; y: 61.3; skew-x: 31.8; skew-y: 28; scale-x: 0.728; scale-y: 0.9; }
        frame 48 { x: 51.1; y: 59.9; skew-x: 33.3; skew-y: 29.6; scale-x: 0.751; scale-y: 0.889; }
        frame 49 { x: 51.5; y: 58.3; skew-x: 34.9; skew-y: 31.1; scale-x: 0.775; scale-y: 0.878; }
        frame 50 { x: 51.9; y: 56.6; skew-x: 36.6; skew-y: 32.8; scale-x: 0.799; scale-y: 0.868; }
        frame 51 { x: 52.1; y: 55.1; skew-x: 38.1; skew-y: 34.4; scale-x: 0.823; scale-y: 0.858; }
        frame 52 { x: 52.7; y: 53.5; skew-x: 39.8; skew-y: 36.1; scale-x: 0.849; scale-y: 0.849; }
        frame 53 { x: 51.6; y: 54.6; skew-x: 36.9; skew-y: 33.3; scale-x: 0.847; scale-y: 0.848; }
        frame 54 { x: 50.5; y: 55.6; skew-x: 34.1; skew-y: 30.6; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 49.5; y: 56.7; skew-x: 31.3; skew-y: 27.8; scale-x: 0.848; }
        frame 56 { x: 48.4; y: 58; skew-x: 28.3; skew-y: 25.1; scale-x: -10000; scale-y: 0.849; }
        frame 57 { x: 47.4; y: 59.1; skew-x: 25.6; skew-y: 22.5; scale-x: 0.849; scale-y: 0.85; }
        frame 58 { x: 47.2; y: 59.8; skew-x: 22.6; skew-y: 20.1; scale-x: 0.848; scale-y: 0.849; }
        frame 59 { x: 47.3; y: 60.5; skew-x: 19.6; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 47.1; y: 61.2; skew-x: 16.6; skew-y: 15.3; }
        frame 61 { x: -10000; y: 61.9; skew-x: 13.8; skew-y: 13.1; scale-x: 0.849; }
        frame 62 { x: 47.4; y: 62.6; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; }
        frame 63 { x: 47.1; y: 63.9; skew-x: 9; skew-y: 9; }
        frame 64 { x: 46.9; y: 65.2; skew-x: 7.3; skew-y: 7.3; }
        frame 65 { x: 46.5; y: 66.5; skew-x: 5.6; skew-y: 5.6; }
        frame 66 { x: 46.4; y: 67.8; skew-x: 4; skew-y: 4; scale-x: 0.85; scale-y: 0.85; }
        frame 67 { x: 46.1; y: -10000; skew-x: 3.1; skew-y: 3.1; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 46; y: 67.6; skew-x: 2.3; skew-y: 2.3; }
        frame 69 { x: 45.9; y: -10000; skew-x: 1.5; skew-y: 1.5; }
        frame 70 { x: 45.7; y: 67.4; skew-x: 0.8; skew-y: 0.8; }
        frame 71 { x: 45.5; y: -10000; skew-x: 0; skew-y: 0; }
        frame 72 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 45.8; y: 66.6; skew-x: 0.8; skew-y: 0.8; }
        frame 74 { x: 46.1; y: 65.8; skew-x: 1.5; skew-y: 1.5; }
        frame 75 { x: 46.4; y: 65; skew-x: 2.3; skew-y: 2.3; }
        frame 76 { x: 46.6; y: 64.3; skew-x: 3.1; skew-y: 3.1; }
        frame 77 { x: -10000; y: 63.9; skew-x: 3; skew-y: 3; }
        frame 78 { y: 63.5; skew-x: -10000; skew-y: -10000; }
        frame 79 { y: 63.1; }
        frame 80 { y: 62.8; skew-x: 3.1; skew-y: 3.1; }
        frame 81 { x: 43.4; y: 64.1; skew-x: -0.4; skew-y: -0.4; }
        frame 82 { x: 40.1; y: 65.6; skew-x: -4; skew-y: -4; scale-x: 0.849; scale-y: 0.849; }
        frame 83 { x: 37; y: 67.2; skew-x: -7.8; skew-y: -7.8; scale-x: 0.85; scale-y: 0.85; }
        frame 84 { x: 37.1; y: 68.5; skew-x: -8.4; skew-y: -8.4; scale-x: 0.849; scale-y: 0.849; }
        frame 85 { x: -10000; y: 69.8; skew-x: -9.2; skew-y: -9.2; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 37.3; y: 71; skew-x: -9.9; skew-y: -9.9; }
        frame 87 { x: -10000; y: 72.3; skew-x: -10.8; skew-y: -10.8; }
        frame 88 { x: 38.1; y: 71.3; skew-x: -9.7; skew-y: -9.7; }
        frame 89 { x: 39; y: 70.1; skew-x: -8.5; skew-y: -8.5; }
        frame 90 { x: 39.7; y: 69.1; skew-x: -7.4; skew-y: -7.4; }
        frame 91 { x: 40.4; y: 68; skew-x: -6.4; skew-y: -6.4; }
        frame 92 { x: 41.7; y: 67.8; skew-x: -4.7; skew-y: -4.7; }
        frame 93 { x: 42.9; y: 67.7; skew-x: -3.2; skew-y: -3.2; scale-x: 0.85; scale-y: 0.85; }
        frame 94 { x: 44.2; y: 67.5; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 45.5; y: 67.4; skew-x: 0; skew-y: 0; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 97 { y: 66.3; skew-x: 2; skew-y: 2; }
        frame 98 { x: 45.4; y: 65.3; skew-x: 4; skew-y: 4; scale-x: 0.849; scale-y: 0.849; }
        frame 99 { x: -10000; y: 64.3; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 100 { y: 63.4; skew-x: 8.1; skew-y: 8.1; }
        frame 101 { x: 42.8; y: 63.5; skew-x: 5.8; skew-y: 5.8; scale-x: 0.848; scale-y: 0.848; }
        frame 102 { x: 40.3; y: 63.6; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 37.9; y: 63.7; skew-x: 1.3; skew-y: 1.3; }
        frame 104 { x: 35.5; y: 64; skew-x: -0.8; skew-y: -0.8; scale-x: 0.847; scale-y: 0.847; }
        frame 105 { x: 29.8; y: 64.3; skew-x: -3.5; skew-y: -6.2; scale-x: 0.835; scale-y: 0.875; }
        frame 106 { x: 24.2; y: 64.7; skew-x: -6.2; skew-y: -11.9; scale-x: 0.823; scale-y: 0.903; }
        frame 107 { x: 18.4; y: 65.4; skew-x: -9.2; skew-y: -17.4; scale-x: 0.811; scale-y: 0.932; }
        frame 108 { x: 12.4; y: 66.2; skew-x: -12; skew-y: -23; scale-x: 0.799; scale-y: 0.961; }
        frame 109 { x: 8.8; y: 68.7; skew-x: -16.7; skew-y: -27; scale-x: 0.793; scale-y: 0.969; }
        frame 110 { x: 5.2; y: 71.3; skew-x: -21.2; skew-y: -31; scale-x: 0.788; scale-y: 0.979; }
        frame 111 { x: 1.8; y: 73.8; skew-x: -26; skew-y: -35.2; scale-x: 0.783; scale-y: 0.989; }
        frame 112 { x: -1.5; y: 76.3; skew-x: -30.8; skew-y: -39.3; scale-x: 0.779; scale-y: 1; }
        frame 113 { x: -6.1; y: 82.1; skew-x: -37.5; skew-y: -47.3; scale-x: 0.78; scale-y: 1.012; }
        frame 114 { x: -10.2; y: 88.2; skew-x: -44.3; skew-y: -55.3; scale-x: 0.781; scale-y: 1.025; }
        frame 115 { x: -13.9; y: 94.3; skew-x: -51.1; skew-y: -63.3; scale-x: 0.783; scale-y: 1.038; }
        frame 116 { x: -17.2; y: 100.7; skew-x: -57.8; skew-y: -71.3; scale-x: 0.786; scale-y: 1.053; }
        frame 117 { x: -20.7; y: 113.5; skew-x: -71.6; skew-y: -87.6; scale-x: 0.79; scale-y: 1.08; }
        frame 118 { x: -21.9; y: 125.6; skew-x: -85.3; skew-y: -103.7; scale-x: 0.795; scale-y: 1.107; }
        frame 119 { x: -21.1; y: 128.5; skew-x: -85.1; skew-y: -107.2; scale-x: 0.82; scale-y: 1.106; }
        frame 120 { x: -20.2; y: 131.4; skew-x: -84.9; skew-y: -110.9; scale-x: 0.846; scale-y: -10000; }
        frame 121 { x: -19.3; y: 134.3; skew-x: -84.5; skew-y: -114.6; scale-x: 0.871; scale-y: 1.107; }
        frame 122 { x: -20; y: 132.5; skew-x: -83.4; skew-y: -105.7; scale-x: 0.866; scale-y: 1.041; }
        frame 123 { x: -19.9; y: 130.8; skew-x: -82.1; skew-y: -96.7; scale-x: 0.86; scale-y: 0.978; }
        frame 124 { x: -19.3; y: 129.6; skew-x: -80.8; skew-y: -87.9; scale-x: 0.855; scale-y: 0.914; }
        frame 125 { x: -18.1; y: 128.9; skew-x: -79.4; skew-y: -78.9; scale-x: 0.85; scale-y: 0.849; }
        frame 126 { x: -10000; y: 128.5; skew-x: -79.6; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 127 { y: 128.1; skew-x: -10000; }
        frame 128 { y: 127.8; }
        frame 129 { y: 127.3; skew-x: -79.4; }
        frame 130 { x: -18.2; y: 128.2; skew-x: -79.6; }
        frame 131 { x: -18.1; y: 128.9; skew-x: -79.4; }
        frame 132 { x: 45.5; y: 67.4; skew-x: 0; skew-y: 0; scale-y: 0.85; }
        frame 133 { x: 45.8; y: 67.1; skew-x: 1; skew-y: 1; scale-y: -10000; }
        frame 134 { x: 46; y: 66.8; skew-x: 2; skew-y: 2; }
        frame 135 { x: 46.3; y: 66.5; skew-x: 3; skew-y: 3; }
        frame 136 { x: 46.4; y: 66.2; skew-x: 4; skew-y: 4; }
        frame 137 { x: 46.5; y: 65.3; skew-x: 5.6; skew-y: 5.6; scale-x: 0.849; scale-y: 0.849; }
        frame 138 { x: 46.9; y: 64.4; skew-x: 7.3; skew-y: 7.3; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 47.1; y: 63.5; skew-x: 9; skew-y: 9; }
        frame 140 { x: 47.4; y: 62.6; skew-x: 10.8; skew-y: 10.8; }
        frame 141 { x: 48.5; y: 62; skew-x: 13.8; skew-y: 13; scale-x: 0.826; scale-y: 0.848; }
        frame 142 { x: 49.6; y: 61.5; skew-x: 16.6; skew-y: 15.3; scale-x: 0.804; scale-y: 0.847; }
        frame 143 { x: 50.9; y: 61.1; skew-x: 19.6; skew-y: 17.8; scale-x: 0.781; scale-y: 0.846; }
        frame 144 { x: 52.1; y: 60.8; skew-x: 22.6; skew-y: 20.1; scale-x: 0.758; scale-y: 0.845; }
        frame 145 { x: 53.3; y: 60.5; skew-x: 25.6; skew-y: 22.5; scale-x: 0.737; scale-y: -10000; }
        frame 146 { x: 53; y: 60.1; skew-x: 27; skew-y: 23.8; scale-x: 0.734; scale-y: 0.855; }
        frame 147 { x: 52.6; y: 59.7; skew-x: 28.3; skew-y: 25.1; scale-x: 0.732; scale-y: 0.867; }
        frame 148 { x: 52.4; y: 59.1; skew-x: 29.8; skew-y: 26.3; scale-x: 0.731; scale-y: 0.878; }
        frame 149 { x: 52; y: 58.7; skew-x: 31.3; skew-y: 27.8; scale-x: 0.729; scale-y: 0.889; }
        frame 150 { x: 51.9; y: 58.2; skew-x: 32.8; skew-y: 29.1; scale-x: -10000; scale-y: 0.902; }
        frame 151 { x: 51.6; y: 59; skew-x: 32.6; skew-y: 28.8; scale-x: 0.727; scale-y: 0.9; }
        frame 152 { x: 51.3; y: 59.9; skew-x: 32.3; skew-y: 28.6; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 51; y: 60.6; skew-x: 32.1; skew-y: 28.3; scale-y: 0.899; }
        frame 154 { x: 50.7; y: 61.3; skew-x: 31.8; skew-y: 28; scale-x: 0.728; scale-y: 0.9; }
        frame 155 { x: 51.1; y: 59.9; skew-x: 33.3; skew-y: 29.6; scale-x: 0.751; scale-y: 0.889; }
        frame 156 { x: 51.5; y: 58.3; skew-x: 34.9; skew-y: 31.1; scale-x: 0.775; scale-y: 0.878; }
        frame 157 { x: 51.9; y: 56.6; skew-x: 36.6; skew-y: 32.8; scale-x: 0.799; scale-y: 0.868; }
        frame 158 { x: 52.1; y: 55.1; skew-x: 38.1; skew-y: 34.4; scale-x: 0.823; scale-y: 0.858; }
        frame 159 { x: 52.7; y: 53.5; skew-x: 39.8; skew-y: 36.1; scale-x: 0.849; scale-y: 0.849; }
        frame 160 { x: 51.6; y: 54.6; skew-x: 36.9; skew-y: 33.3; scale-x: 0.847; scale-y: 0.848; }
        frame 161 { x: 50.5; y: 55.6; skew-x: 34.1; skew-y: 30.6; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 49.5; y: 56.7; skew-x: 31.3; skew-y: 27.8; scale-x: 0.848; }
        frame 163 { x: 48.4; y: 58; skew-x: 28.3; skew-y: 25.1; scale-x: -10000; scale-y: 0.849; }
        frame 164 { x: 47.4; y: 59.1; skew-x: 25.6; skew-y: 22.5; scale-x: 0.849; scale-y: 0.85; }
        frame 165 { x: 47.2; y: 59.8; skew-x: 22.6; skew-y: 20.1; scale-x: 0.848; scale-y: 0.849; }
        frame 166 { x: 47.3; y: 60.5; skew-x: 19.6; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 47.1; y: 61.2; skew-x: 16.6; skew-y: 15.3; }
        frame 168 { x: -10000; y: 61.9; skew-x: 13.8; skew-y: 13.1; scale-x: 0.849; }
        frame 169 { x: 47.4; y: 62.6; skew-x: 10.8; skew-y: 10.8; scale-x: -10000; }
        frame 170 { x: 47.1; y: 63.9; skew-x: 9; skew-y: 9; }
        frame 171 { x: 46.9; y: 65.2; skew-x: 7.3; skew-y: 7.3; }
        frame 172 { x: 46.5; y: 66.5; skew-x: 5.6; skew-y: 5.6; }
        frame 173 { x: 46.4; y: 67.8; skew-x: 4; skew-y: 4; scale-x: 0.85; scale-y: 0.85; }
        frame 174 { x: 46.1; y: -10000; skew-x: 3.1; skew-y: 3.1; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 46; y: 67.6; skew-x: 2.3; skew-y: 2.3; }
        frame 176 { x: 45.9; y: -10000; skew-x: 1.5; skew-y: 1.5; }
        frame 177 { x: 45.7; y: 67.4; skew-x: 0.8; skew-y: 0.8; }
        frame 178 { x: 45.5; y: -10000; skew-x: 0; skew-y: 0; }
        frame 179 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 180 { x: 45.8; y: 66.6; skew-x: 0.8; skew-y: 0.8; }
        frame 181 { x: 46.1; y: 65.8; skew-x: 1.5; skew-y: 1.5; }
        frame 182 { x: 46.4; y: 65; skew-x: 2.3; skew-y: 2.3; }
        frame 183 { x: 46.6; y: 64.3; skew-x: 3.1; skew-y: 3.1; }
        frame 184 { x: -10000; y: 63.9; skew-x: 3; skew-y: 3; }
        frame 185 { y: 63.5; skew-x: -10000; skew-y: -10000; }
        frame 186 { y: 63.1; }
        frame 187 { y: 62.8; skew-x: 3.1; skew-y: 3.1; }
        frame 188 { x: 43.4; y: 64.1; skew-x: -0.4; skew-y: -0.4; }
        frame 189 { x: 40.1; y: 65.6; skew-x: -4; skew-y: -4; scale-x: 0.849; scale-y: 0.849; }
        frame 190 { x: 37; y: 67.2; skew-x: -7.8; skew-y: -7.8; scale-x: 0.85; scale-y: 0.85; }
        frame 191 { x: 37.1; y: 68.5; skew-x: -8.4; skew-y: -8.4; scale-x: 0.849; scale-y: 0.849; }
        frame 192 { x: -10000; y: 69.8; skew-x: -9.2; skew-y: -9.2; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 37.3; y: 71; skew-x: -9.9; skew-y: -9.9; }
        frame 194 { x: -10000; y: 72.3; skew-x: -10.8; skew-y: -10.8; }
        frame 195 { x: 38.1; y: 71.3; skew-x: -9.7; skew-y: -9.7; }
        frame 196 { x: 39; y: 70.1; skew-x: -8.5; skew-y: -8.5; }
        frame 197 { x: 39.7; y: 69.1; skew-x: -7.4; skew-y: -7.4; }
        frame 198 { x: 40.4; y: 68; skew-x: -6.4; skew-y: -6.4; }
        frame 199 { x: 41.7; y: 67.8; skew-x: -4.7; skew-y: -4.7; }
        frame 200 { x: 42.9; y: 67.7; skew-x: -3.2; skew-y: -3.2; scale-x: 0.85; scale-y: 0.85; }
        frame 201 { x: 44.2; y: 67.5; skew-x: -1.4; skew-y: -1.4; scale-x: -10000; scale-y: -10000; }
        frame 202 { x: 45.5; y: 67.4; skew-x: 0; skew-y: 0; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 204 { x: 46.3; y: 66.3; skew-x: 1.3; skew-y: 1.3; }
        frame 205 { x: 47.1; y: 65.1; skew-x: 2.8; skew-y: 2.8; }
        frame 206 { x: 48; y: 64.1; skew-x: 4.1; skew-y: 4.1; }
        frame 207 { x: 48.8; y: 62.9; skew-x: 5.5; skew-y: 5.5; scale-x: 0.849; scale-y: 0.849; }
        frame 208 { x: 49.6; y: 61.8; skew-x: 6.8; skew-y: 6.8; scale-x: -10000; scale-y: -10000; }
        frame 209 { x: 50.5; y: 60.6; skew-x: 8.4; skew-y: 8.4; scale-x: 0.85; scale-y: 0.85; }
        frame 210 { x: 48.2; y: 62.5; skew-x: 3.8; skew-y: 3.8; scale-x: 0.849; scale-y: 0.849; }
        frame 211 { x: 46; y: 64.2; skew-x: -0.2; skew-y: -0.2; scale-x: -10000; scale-y: -10000; }
        frame 212 { x: 44; y: 66.2; skew-x: -4.7; skew-y: -4.7; scale-x: 0.848; scale-y: 0.848; }
        frame 213 { x: 41.8; y: 68.3; skew-x: -9.3; skew-y: -9.3; scale-x: -10000; scale-y: -10000; }
        frame 214 { x: 40.4; y: 70.6; skew-x: -14.4; skew-y: -14.6; scale-x: 0.847; }
    }
    Track {
        source-name: "Zombie_ladder_hammer";
        frame-count: 215;
        frame 0 { x: 61.5; y: 71.2; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_LADDER_HAMMER; }
        frame 1 { x: 61.8; y: 70.7; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 62; y: 70.3; skew-x: 2.1; skew-y: 2.1; }
        frame 3 { x: 62.3; y: 69.8; skew-x: 3.3; skew-y: 3.3; }
        frame 4 { x: 62.5; y: 69.3; skew-x: 4.3; skew-y: 4.3; }
        frame 5 { x: 62.8; y: 69.1; skew-x: 5.5; skew-y: 5.5; scale-x: 0.799; scale-y: 0.799; }
        frame 6 { x: 63; y: 68.6; skew-x: 6.6; skew-y: 6.6; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { x: 62.6; y: 69; skew-x: 5.8; skew-y: 5.8; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 62.3; y: 69.4; skew-x: 4.8; skew-y: 4.8; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 62; y: 69.8; skew-x: 4; skew-y: 4; }
        frame 10 { x: 61.6; y: 70.2; skew-x: 3.1; skew-y: 3.1; }
        frame 11 { x: 61.3; y: 70.6; skew-x: 2.3; skew-y: 2.3; }
        frame 12 { x: 61; y: 70.8; skew-x: 1.6; skew-y: 1.6; }
        frame 13 { x: 61.1; y: -10000; skew-x: 2.8; skew-y: 2.8; }
        frame 14 { x: 61.4; skew-x: 4.3; skew-y: 4.3; }
        frame 15 { x: 61.5; skew-x: 5.6; skew-y: 5.6; }
        frame 16 { x: 61.7; skew-x: 7; skew-y: 7; }
        frame 17 { x: 61.9; skew-x: 8.3; skew-y: 8.3; }
        frame 18 { x: 62.1; y: 70.7; skew-x: 9.9; skew-y: 9.9; }
        frame 19 { x: 62; y: 70.8; skew-x: 8.1; skew-y: 8.1; }
        frame 20 { x: 61.9; y: -10000; skew-x: 6.5; skew-y: 6.5; }
        frame 21 { x: 61.8; y: 70.9; skew-x: 4.8; skew-y: 4.8; }
        frame 22 { x: 61.6; y: 71; skew-x: 3.3; skew-y: 3.3; scale-x: 0.8; scale-y: 0.8; }
        frame 23 { x: -10000; y: 71.1; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 61.5; y: 71.2; skew-x: 0; skew-y: 0; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 61.1; y: 71.5; skew-x: -0.4; skew-y: -0.4; }
        frame 27 { x: 60.8; y: 71.6; skew-x: -1; skew-y: -1; }
        frame 28 { x: 60.3; y: 72; skew-x: -1.7; skew-y: -1.7; }
        frame 29 { x: 59.9; y: 72.3; skew-x: -2.2; skew-y: -2.2; }
        frame 30 { x: 59.5; y: 72.6; skew-x: -2.7; skew-y: -2.7; }
        frame 31 { x: 59; y: 72.8; skew-x: -3.4; skew-y: -3.4; scale-x: 0.799; scale-y: 0.799; }
        frame 32 { x: 58.5; y: 73.1; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 58.1; y: 73.4; skew-x: -4.7; skew-y: -4.7; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: 57.1; y: 73.7; skew-x: -5.2; skew-y: -5.2; scale-x: 0.799; scale-y: 0.799; }
        frame 35 { x: 56.1; y: 73.9; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 55.1; y: 74.2; skew-x: -6.5; skew-y: -6.5; }
        frame 37 { x: 54.2; y: 74.5; skew-x: -7.2; skew-y: -7.2; }
        frame 38 { x: 53.1; y: 74.8; skew-x: -7.9; skew-y: -7.9; scale-x: 0.8; scale-y: 0.8; }
        frame 39 { x: -10000; y: 74.5; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 40 { x: 53; y: 74.2; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: -10000; y: 73.8; skew-x: -0.7; skew-y: -0.7; }
        frame 42 { x: 52.8; y: 73.7; skew-x: 1.3; skew-y: 1.3; }
        frame 43 { x: 52.9; y: 73.4; skew-x: 3.8; skew-y: 3.8; }
        frame 44 { x: -10000; y: 73.2; skew-x: 6.1; skew-y: 6.1; }
        frame 45 { x: 53; y: 73; skew-x: 8.5; skew-y: 8.5; }
        frame 46 { x: -10000; y: 72.9; skew-x: 10.8; skew-y: 10.8; scale-x: 0.798; scale-y: 0.798; }
        frame 47 { x: 53; y: 72.7; skew-x: 13.3; skew-y: 13.3; scale-x: 0.799; scale-y: 0.799; }
        frame 48 { x: 54.3; y: 71.8; skew-x: 19; skew-y: 19; scale-x: 0.798; scale-y: 0.798; }
        frame 49 { x: 55.5; y: 71; skew-x: 24.7; skew-y: 24.7; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 55.9; y: 70.4; skew-x: 22.8; skew-y: 22.8; scale-x: 0.797; scale-y: 0.797; }
        frame 51 { x: 56.5; y: 69.8; skew-x: 21; skew-y: 21; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 57; y: 69.3; skew-x: 19.2; skew-y: 19.2; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: 58; y: 68.9; skew-x: 20; skew-y: 20; scale-x: 0.797; scale-y: 0.797; }
        frame 54 { x: 58.9; y: 68.6; skew-x: 21; skew-y: 21; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 59.9; y: 68.2; skew-x: 22; skew-y: 22; }
        frame 56 { x: 60.7; y: 68; skew-x: 22.8; skew-y: 22.8; }
        frame 57 { x: 61.6; y: 67.6; skew-x: 23.8; skew-y: 23.8; }
        frame 58 { x: 62.6; y: 67.2; skew-x: 24.8; skew-y: 24.8; }
        frame 59 { x: 63.5; y: 66.9; skew-x: 25.8; skew-y: 25.8; }
        frame 60 { x: 64.5; y: 66.6; skew-x: 26.8; skew-y: 26.8; }
        frame 61 { x: 65.4; y: 66.3; skew-x: 27.6; skew-y: 27.6; scale-x: 0.796; scale-y: 0.796; }
        frame 62 { x: 66.5; y: 66; skew-x: 28.7; skew-y: 28.7; scale-x: 0.798; scale-y: 0.798; }
        frame 63 { x: 65.8; y: 67.2; skew-x: 26.8; skew-y: 26.8; scale-x: 0.796; scale-y: 0.796; }
        frame 64 { x: 65.3; y: 68.2; skew-x: 25.1; skew-y: 25.1; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 64.8; y: 69.3; skew-x: 23.3; skew-y: 23.3; }
        frame 66 { x: 64.2; y: 70.5; skew-x: 21.5; skew-y: 21.5; scale-x: 0.797; scale-y: 0.797; }
        frame 67 { x: 63.6; y: 71.2; skew-x: 19; skew-y: 19; scale-x: 0.796; scale-y: 0.796; }
        frame 68 { x: 63.3; y: 71.8; skew-x: 16.7; skew-y: 16.7; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 62.6; y: 71.4; skew-x: 11; skew-y: 11; scale-x: 0.797; scale-y: 0.797; }
        frame 70 { x: 62.1; y: 71.2; skew-x: 5.5; skew-y: 5.5; scale-x: 0.799; scale-y: 0.799; }
        frame 71 { x: 61.5; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 72 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 62; y: 70.4; skew-x: 1.3; skew-y: 1.3; }
        frame 74 { x: 62.5; y: 69.6; skew-x: 2.5; skew-y: 2.5; }
        frame 75 { x: 63; y: 68.9; skew-x: 3.8; skew-y: 3.8; }
        frame 76 { x: 63.4; y: 68.3; skew-x: 5.3; skew-y: 5.3; }
        frame 77 { x: 63.9; y: 67.5; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 78 { x: 64.3; y: 66.8; skew-x: 7.8; skew-y: 7.8; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 64.8; y: 66.1; skew-x: 9.1; skew-y: 9.1; }
        frame 80 { x: 65.3; y: 65.4; skew-x: 10.6; skew-y: 10.6; scale-x: 0.8; scale-y: 0.8; }
        frame 81 { x: 61.8; y: 66.2; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 82 { x: 58.5; y: 66.8; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 55.4; y: 67.7; skew-x: -0.9; skew-y: -0.9; }
        frame 84 { x: 54.6; y: 69.4; skew-x: -4.7; skew-y: -4.7; }
        frame 85 { x: 53.7; y: 71.3; skew-x: -8.7; skew-y: -8.7; scale-x: 0.798; scale-y: 0.798; }
        frame 86 { x: 53; y: 73.3; skew-x: -12.4; skew-y: -12.4; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 52.3; y: 75.3; skew-x: -16.4; skew-y: -16.4; }
        frame 88 { x: 53.9; y: 73.6; skew-x: -8.9; skew-y: -8.9; }
        frame 89 { x: 55.5; y: 71.9; skew-x: -1.6; skew-y: -1.6; }
        frame 90 { x: 57; y: 70.3; skew-x: -1; skew-y: -1; }
        frame 91 { x: 58.5; y: 68.8; skew-x: -0.7; skew-y: -0.7; scale-x: 0.799; scale-y: 0.799; }
        frame 92 { x: 59.2; y: 69.4; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 59.9; y: 70; skew-x: -0.2; skew-y: -0.2; }
        frame 94 { x: 60.8; y: 70.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 95 { x: 61.5; y: 71.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: -10000; y: -10000; }
        frame 97 { x: 60.6; y: 70.3; skew-x: 0.5; skew-y: 0.5; }
        frame 98 { x: 59.6; y: 69.6; skew-x: 1; skew-y: 1; }
        frame 99 { x: 58.7; y: 68.8; skew-x: 1.5; skew-y: 1.5; }
        frame 100 { x: 57.8; y: 68; skew-x: 2; skew-y: 2; }
        frame 101 { x: 56.9; y: 67.2; skew-x: 2.5; skew-y: 2.5; }
        frame 102 { x: 55.9; y: 66.5; skew-x: 3; skew-y: 3; }
        frame 103 { x: 55; y: 65.6; skew-x: 3.5; skew-y: 3.5; }
        frame 104 { x: 54; y: 64.8; skew-x: 4.1; skew-y: 4.1; }
        frame 105 { x: 47.9; y: 66; skew-x: -4.7; skew-y: -4.7; scale-x: 0.799; scale-y: 0.799; }
        frame 106 { x: 42.1; y: 67.4; skew-x: -13.4; skew-y: -13.4; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 36.8; y: 69.2; skew-x: -22.2; skew-y: -22.2; scale-x: 0.798; scale-y: 0.798; }
        frame 108 { x: 31.9; y: 71.2; skew-x: -31; skew-y: -31; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: 27.4; y: 73.3; skew-x: -39.8; skew-y: -39.8; }
        frame 110 { x: 23.4; y: 75.8; skew-x: -48.8; skew-y: -48.8; scale-x: 0.797; scale-y: 0.797; }
        frame 111 { x: 19.9; y: 78.1; skew-x: -57.6; skew-y: -57.6; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 16.9; y: 80.3; skew-x: -66.3; skew-y: -66.3; scale-x: 0.798; scale-y: 0.798; }
        frame 113 { x: 12.9; y: 85.6; skew-x: -76.6; skew-y: -76.6; scale-x: 0.797; scale-y: 0.797; }
        frame 114 { x: 9.5; y: 90.5; skew-x: -86.6; skew-y: -86.6; scale-x: 0.798; scale-y: 0.798; }
        frame 115 { x: 6.6; y: 95; skew-x: -96.7; skew-y: -96.7; scale-x: 0.797; scale-y: 0.797; }
        frame 116 { x: 1.8; y: 100.5; skew-x: -106.7; skew-y: -106.7; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: -2.5; y: 105.7; skew-x: -116.9; skew-y: -116.9; scale-x: 0.796; scale-y: 0.796; }
        frame 118 { x: -6.7; y: 110.1; skew-x: -127; skew-y: -127; scale-x: 0.797; scale-y: 0.797; }
        frame 119 { x: -9.8; y: 111.6; skew-x: -115; skew-y: -115; scale-x: 0.796; scale-y: 0.796; }
        frame 120 { x: -12.4; y: 112.3; skew-x: -103; skew-y: -103; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: -14.5; y: 112.5; skew-x: -91.2; skew-y: -91.2; }
        frame 122 { x: -16.9; y: 110.3; skew-x: -75.4; skew-y: -75.4; scale-x: 0.795; scale-y: 0.795; }
        frame 123 { x: -17.7; y: 107.6; skew-x: -59.5; skew-y: -59.5; scale-x: 0.794; scale-y: 0.794; }
        frame 124 { x: -17.1; y: 104.6; skew-x: -43.5; skew-y: -43.5; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: -14.9; y: 101.9; skew-x: -27.7; skew-y: -27.7; scale-x: 0.795; scale-y: 0.795; }
        frame 126 { x: -15; y: 102.6; skew-x: -31; skew-y: -31; scale-x: 0.793; scale-y: 0.793; }
        frame 127 { x: -15.1; y: 103.5; skew-x: -34.2; skew-y: -34.2; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -10000; y: 104.2; skew-x: -37.5; skew-y: -37.5; scale-x: 0.794; scale-y: 0.794; }
        frame 129 { y: 103.5; skew-x: -34.2; skew-y: -34.2; scale-x: 0.793; scale-y: 0.793; }
        frame 130 { x: -15; y: 102.6; skew-x: -31; skew-y: -31; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: -14.9; y: 101.9; skew-x: -27.7; skew-y: -27.7; scale-x: 0.795; scale-y: 0.795; }
        frame 132 { x: 61.5; y: 71.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 133 { x: 61.1; y: 71.5; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 134 { x: 60.8; y: 71.6; skew-x: -1; skew-y: -1; }
        frame 135 { x: 60.3; y: 72; skew-x: -1.7; skew-y: -1.7; }
        frame 136 { x: 59.9; y: 72.3; skew-x: -2.2; skew-y: -2.2; }
        frame 137 { x: 59.5; y: 72.6; skew-x: -2.7; skew-y: -2.7; }
        frame 138 { x: 59; y: 72.8; skew-x: -3.4; skew-y: -3.4; scale-x: 0.799; scale-y: 0.799; }
        frame 139 { x: 58.5; y: 73.1; skew-x: -3.9; skew-y: -3.9; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 58.1; y: 73.4; skew-x: -4.7; skew-y: -4.7; scale-x: 0.8; scale-y: 0.8; }
        frame 141 { x: 57.1; y: 73.7; skew-x: -5.2; skew-y: -5.2; scale-x: 0.799; scale-y: 0.799; }
        frame 142 { x: 56.1; y: 73.9; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 55.1; y: 74.2; skew-x: -6.5; skew-y: -6.5; }
        frame 144 { x: 54.2; y: 74.5; skew-x: -7.2; skew-y: -7.2; }
        frame 145 { x: 53.1; y: 74.8; skew-x: -7.9; skew-y: -7.9; scale-x: 0.8; scale-y: 0.8; }
        frame 146 { x: -10000; y: 74.5; skew-x: -5.4; skew-y: -5.4; scale-x: 0.799; scale-y: 0.799; }
        frame 147 { x: 53; y: 74.2; skew-x: -3.2; skew-y: -3.2; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: -10000; y: 73.8; skew-x: -0.7; skew-y: -0.7; }
        frame 149 { x: 52.8; y: 73.7; skew-x: 1.3; skew-y: 1.3; }
        frame 150 { x: 52.9; y: 73.4; skew-x: 3.8; skew-y: 3.8; }
        frame 151 { x: -10000; y: 73.2; skew-x: 6.1; skew-y: 6.1; }
        frame 152 { x: 53; y: 73; skew-x: 8.5; skew-y: 8.5; }
        frame 153 { x: -10000; y: 72.9; skew-x: 10.8; skew-y: 10.8; scale-x: 0.798; scale-y: 0.798; }
        frame 154 { x: 53; y: 72.7; skew-x: 13.3; skew-y: 13.3; scale-x: 0.799; scale-y: 0.799; }
        frame 155 { x: 54.3; y: 71.8; skew-x: 19; skew-y: 19; scale-x: 0.798; scale-y: 0.798; }
        frame 156 { x: 55.5; y: 71; skew-x: 24.7; skew-y: 24.7; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 55.9; y: 70.4; skew-x: 22.8; skew-y: 22.8; scale-x: 0.797; scale-y: 0.797; }
        frame 158 { x: 56.5; y: 69.8; skew-x: 21; skew-y: 21; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: 57; y: 69.3; skew-x: 19.2; skew-y: 19.2; scale-x: 0.798; scale-y: 0.798; }
        frame 160 { x: 58; y: 68.9; skew-x: 20; skew-y: 20; scale-x: 0.797; scale-y: 0.797; }
        frame 161 { x: 58.9; y: 68.6; skew-x: 21; skew-y: 21; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 59.9; y: 68.2; skew-x: 22; skew-y: 22; }
        frame 163 { x: 60.7; y: 68; skew-x: 22.8; skew-y: 22.8; }
        frame 164 { x: 61.6; y: 67.6; skew-x: 23.8; skew-y: 23.8; }
        frame 165 { x: 62.6; y: 67.2; skew-x: 24.8; skew-y: 24.8; }
        frame 166 { x: 63.5; y: 66.9; skew-x: 25.8; skew-y: 25.8; }
        frame 167 { x: 64.5; y: 66.6; skew-x: 26.8; skew-y: 26.8; }
        frame 168 { x: 65.4; y: 66.3; skew-x: 27.6; skew-y: 27.6; scale-x: 0.796; scale-y: 0.796; }
        frame 169 { x: 66.5; y: 66; skew-x: 28.7; skew-y: 28.7; scale-x: 0.798; scale-y: 0.798; }
        frame 170 { x: 65.8; y: 67.2; skew-x: 26.8; skew-y: 26.8; scale-x: 0.796; scale-y: 0.796; }
        frame 171 { x: 65.3; y: 68.2; skew-x: 25.1; skew-y: 25.1; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 64.8; y: 69.3; skew-x: 23.3; skew-y: 23.3; }
        frame 173 { x: 64.2; y: 70.5; skew-x: 21.5; skew-y: 21.5; scale-x: 0.797; scale-y: 0.797; }
        frame 174 { x: 63.6; y: 71.2; skew-x: 19; skew-y: 19; scale-x: 0.796; scale-y: 0.796; }
        frame 175 { x: 63.3; y: 71.8; skew-x: 16.7; skew-y: 16.7; scale-x: -10000; scale-y: -10000; }
        frame 176 { x: 62.6; y: 71.4; skew-x: 11; skew-y: 11; scale-x: 0.797; scale-y: 0.797; }
        frame 177 { x: 62.1; y: 71.2; skew-x: 5.5; skew-y: 5.5; scale-x: 0.799; scale-y: 0.799; }
        frame 178 { x: 61.5; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 179 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 62; y: 70.4; skew-x: 1.3; skew-y: 1.3; }
        frame 181 { x: 62.5; y: 69.6; skew-x: 2.5; skew-y: 2.5; }
        frame 182 { x: 63; y: 68.9; skew-x: 3.8; skew-y: 3.8; }
        frame 183 { x: 63.4; y: 68.3; skew-x: 5.3; skew-y: 5.3; }
        frame 184 { x: 63.9; y: 67.5; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799; scale-y: 0.799; }
        frame 185 { x: 64.3; y: 66.8; skew-x: 7.8; skew-y: 7.8; scale-x: -10000; scale-y: -10000; }
        frame 186 { x: 64.8; y: 66.1; skew-x: 9.1; skew-y: 9.1; }
        frame 187 { x: 65.3; y: 65.4; skew-x: 10.6; skew-y: 10.6; scale-x: 0.8; scale-y: 0.8; }
        frame 188 { x: 61.8; y: 66.2; skew-x: 6.6; skew-y: 6.6; scale-x: 0.799; scale-y: 0.799; }
        frame 189 { x: 58.5; y: 66.8; skew-x: 2.8; skew-y: 2.8; scale-x: -10000; scale-y: -10000; }
        frame 190 { x: 55.4; y: 67.7; skew-x: -0.9; skew-y: -0.9; }
        frame 191 { x: 54.6; y: 69.4; skew-x: -4.7; skew-y: -4.7; }
        frame 192 { x: 53.7; y: 71.3; skew-x: -8.7; skew-y: -8.7; scale-x: 0.798; scale-y: 0.798; }
        frame 193 { x: 53; y: 73.3; skew-x: -12.4; skew-y: -12.4; scale-x: -10000; scale-y: -10000; }
        frame 194 { x: 52.3; y: 75.3; skew-x: -16.4; skew-y: -16.4; }
        frame 195 { x: 53.9; y: 73.6; skew-x: -8.9; skew-y: -8.9; }
        frame 196 { x: 55.5; y: 71.9; skew-x: -1.6; skew-y: -1.6; }
        frame 197 { x: 57; y: 70.3; skew-x: -1; skew-y: -1; }
        frame 198 { x: 58.5; y: 68.8; skew-x: -0.7; skew-y: -0.7; scale-x: 0.799; scale-y: 0.799; }
        frame 199 { x: 59.2; y: 69.4; skew-x: -0.4; skew-y: -0.4; scale-x: -10000; scale-y: -10000; }
        frame 200 { x: 59.9; y: 70; skew-x: -0.2; skew-y: -0.2; }
        frame 201 { x: 60.8; y: 70.6; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 202 { x: 61.5; y: 71.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 203 { x: -10000; y: -10000; }
        frame 204 { x: 62.5; y: 69.8; skew-x: 2; skew-y: 2; }
        frame 205 { x: 63.4; y: 68.5; skew-x: 4.3; skew-y: 4.3; }
        frame 206 { x: 64.4; y: 67.3; skew-x: 6.3; skew-y: 6.3; scale-x: 0.799; scale-y: 0.799; }
        frame 207 { x: 65.5; y: 66; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 208 { x: 66.6; y: 64.8; skew-x: 10.6; skew-y: 10.6; }
        frame 209 { x: 67.6; y: 63.5; skew-x: 12.8; skew-y: 12.8; }
        frame 210 { x: 67.1; y: 63.7; skew-x: 14.8; skew-y: 14.8; }
        frame 211 { x: 66.6; y: 63.8; skew-x: 16.8; skew-y: 16.8; scale-x: 0.798; scale-y: 0.798; }
        frame 212 { x: 66.2; y: 64; skew-x: 19; skew-y: 19; scale-x: -10000; scale-y: -10000; }
        frame 213 { x: 65.7; y: 64.1; skew-x: 21; skew-y: 21; }
        frame 214 { x: 65.2; y: 64.3; skew-x: 23.2; skew-y: 23.2; scale-x: 0.799; scale-y: 0.799; }
    }
    Track {
        source-name: "Zombie_ladder_innerarm_upper";
        frame-count: 215;
        frame 0 { x: 24.1; y: 44.9; skew-x: 22.5; skew-y: 22.5; scale-x: 0.849; scale-y: 0.849; image: IMAGE_REANIM_ZOMBIE_LADDER_INNERARM_UPPER; }
        frame 1 { x: 24.8; y: 44.1; skew-x: 23.5; skew-y: 23.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 25.5; y: 43.5; skew-x: 24.5; skew-y: 24.5; }
        frame 3 { x: 26.2; y: 42.9; skew-x: 25.3; skew-y: 25.3; }
        frame 4 { x: 27; y: 42.2; skew-x: 26.3; skew-y: 26.3; }
        frame 5 { x: 27.6; y: 41.5; skew-x: 27.2; skew-y: 27.2; }
        frame 6 { x: 28.4; y: 40.9; skew-x: 28; skew-y: 28; scale-x: 0.85; scale-y: 0.85; }
        frame 7 { x: 27.6; y: 41.4; skew-x: 27.2; skew-y: 27.2; scale-x: 0.849; scale-y: 0.849; }
        frame 8 { x: 27; y: 42.1; skew-x: 26.3; skew-y: 26.3; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 26.1; y: 42.8; skew-x: 25.3; skew-y: 25.3; }
        frame 10 { x: 25.5; y: 43.4; skew-x: 24.5; skew-y: 24.5; }
        frame 11 { x: 24.8; y: 44.1; skew-x: 23.5; skew-y: 23.5; }
        frame 12 { x: 24.1; y: 44.9; skew-x: 22.5; skew-y: 22.5; }
        frame 13 { x: 23.4; y: 45.4; skew-x: 21; skew-y: 21; }
        frame 14 { x: 22.8; y: 46; skew-x: 19.5; skew-y: 19.5; }
        frame 15 { x: 22.1; y: 46.7; skew-x: 18; skew-y: 18; }
        frame 16 { x: 21.6; y: 47.3; skew-x: 16.5; skew-y: 16.5; }
        frame 17 { x: 21; y: 47.9; skew-x: 15; skew-y: 15; }
        frame 18 { x: 20.3; y: 48.6; skew-x: 13.5; skew-y: 13.5; scale-x: 0.85; scale-y: 0.85; }
        frame 19 { x: 21; y: 48; skew-x: 15; skew-y: 15; scale-x: 0.849; scale-y: 0.849; }
        frame 20 { x: 21.5; y: 47.4; skew-x: 16.5; skew-y: 16.5; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 22.1; y: 46.7; skew-x: 18; skew-y: 18; }
        frame 22 { x: 22.8; y: 46; skew-x: 19.5; skew-y: 19.5; }
        frame 23 { x: 23.3; y: 45.5; skew-x: 21; skew-y: 21; }
        frame 24 { x: 24.1; y: 44.9; skew-x: 22.5; skew-y: 22.5; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 24.2; y: 44.5; skew-x: 21; skew-y: 21; scale-x: 0.848; scale-y: 0.848; }
        frame 27 { x: 24.3; y: 44.3; skew-x: 19.2; skew-y: 19.2; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -10000; y: 43.9; skew-x: 17.5; skew-y: 17.5; }
        frame 29 { x: 24.4; y: 43.8; skew-x: 15.8; skew-y: 15.8; }
        frame 30 { x: 25.1; y: 42; skew-x: 16.3; skew-y: 16.3; }
        frame 31 { x: 26; y: 40.2; skew-x: 16.8; skew-y: 16.8; scale-x: 0.847; scale-y: 0.847; }
        frame 32 { x: 26.5; y: 38.4; skew-x: 17.2; skew-y: 17.2; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 27.3; y: 36.6; skew-x: 17.6; skew-y: 17.6; scale-x: 0.848; scale-y: 0.848; }
        frame 34 { x: 27.7; y: 36.1; skew-x: 18.2; skew-y: 18.2; scale-x: 0.847; scale-y: 0.847; }
        frame 35 { x: 28.1; y: 35.8; skew-x: 18.8; skew-y: 18.8; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 28.3; y: 35.4; skew-x: 19.3; skew-y: 19.3; }
        frame 37 { x: 28.8; y: 34.9; skew-x: 19.8; skew-y: 19.8; }
        frame 38 { x: 29.2; y: 34.5; skew-x: 20.3; skew-y: 20.3; }
        frame 39 { x: 28.5; y: 35.4; skew-x: 23.5; skew-y: 21.1; scale-x: 0.859; scale-y: 0.874; }
        frame 40 { x: 27.8; y: 36.5; skew-x: 26.4; skew-y: 21.7; scale-x: 0.871; scale-y: 0.901; }
        frame 41 { x: 27.1; y: 37.4; skew-x: 29.3; skew-y: 22.4; scale-x: 0.883; scale-y: 0.929; }
        frame 42 { x: 26.5; y: 38.3; skew-x: 32.4; skew-y: 23.4; scale-x: 0.896; scale-y: 0.957; }
        frame 43 { x: 25.9; y: 39.4; skew-x: 35.1; skew-y: 24.1; scale-x: 0.91; scale-y: 0.985; }
        frame 44 { x: 25.4; y: 40.9; skew-x: 38; skew-y: 27; scale-x: 0.909; scale-y: -10000; }
        frame 45 { x: 24.9; y: 42.5; skew-x: 40.5; skew-y: 29.6; scale-x: -10000; }
        frame 46 { x: 24.3; y: 44.4; skew-x: 43.3; skew-y: 32.3; scale-x: 0.908; scale-y: 0.984; }
        frame 47 { x: 23.9; y: 46.1; skew-x: 46.1; skew-y: 35.1; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 24.6; y: 44.8; skew-x: 43.8; skew-y: 32.8; }
        frame 49 { x: 25.3; y: 43.4; skew-x: 41.5; skew-y: 30.6; }
        frame 50 { x: 26.1; y: 42.1; skew-x: 39.3; skew-y: 28.4; scale-x: 0.909; scale-y: 0.985; }
        frame 51 { x: 27; y: 41; skew-x: 37.4; skew-y: 26.5; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 27.7; y: 39.9; skew-x: 35.1; skew-y: 24.1; scale-x: 0.91; }
        frame 53 { x: 28; y: 38.8; skew-x: 32.4; skew-y: 23.4; scale-x: 0.896; scale-y: 0.957; }
        frame 54 { x: 28.1; y: 37.8; skew-x: 29.3; skew-y: 22.4; scale-x: 0.883; scale-y: 0.929; }
        frame 55 { x: 28.4; y: 36.8; skew-x: 26.4; skew-y: 21.7; scale-x: 0.871; scale-y: 0.901; }
        frame 56 { x: 28.9; y: 35.8; skew-x: 23.5; skew-y: 21.1; scale-x: 0.859; scale-y: 0.874; }
        frame 57 { x: 29.2; y: 34.8; skew-x: 20.3; skew-y: 20.3; scale-x: 0.847; scale-y: 0.847; }
        frame 58 { x: 28.9; y: 35; skew-x: 19.8; skew-y: 19.8; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 28.4; y: 35.5; skew-x: 19.3; skew-y: 19.3; }
        frame 60 { x: 28.1; y: 36; skew-x: 18.8; skew-y: 18.8; }
        frame 61 { x: 27.7; y: 36.4; skew-x: 18.3; skew-y: 18.3; }
        frame 62 { x: 27.3; y: 36.9; skew-x: 17.6; skew-y: 17.6; scale-x: 0.848; scale-y: 0.848; }
        frame 63 { x: 26.1; y: 40; skew-x: 18.3; skew-y: 18.3; scale-x: 0.847; scale-y: 0.847; }
        frame 64 { x: 25; y: 43.2; skew-x: 19; skew-y: 19; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 23.8; y: 46.4; skew-x: 19.5; skew-y: 19.5; }
        frame 66 { x: 22.4; y: 49.4; skew-x: 20; skew-y: 20; scale-x: 0.848; scale-y: 0.848; }
        frame 67 { x: 22.8; y: 48.5; skew-x: 20.5; skew-y: 20.5; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 23; y: 47.6; skew-x: 21; skew-y: 21; }
        frame 69 { x: 23.4; y: 46.7; skew-x: 21.5; skew-y: 21.5; }
        frame 70 { x: 23.7; y: 45.8; skew-x: 22; skew-y: 22; }
        frame 71 { x: 24.1; y: 44.9; skew-x: 22.5; skew-y: 22.5; scale-x: 0.849; scale-y: 0.849; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 25.7; y: 42.1; skew-x: 22.3; skew-y: 22.3; scale-x: 0.848; scale-y: 0.848; }
        frame 74 { x: 27.4; y: 39.2; skew-x: 22; skew-y: 22; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 29.1; y: 36.5; skew-x: -10000; skew-y: -10000; }
        frame 76 { x: 30.8; y: 33.5; skew-x: 21.6; skew-y: 21.6; }
        frame 77 { x: 31.8; y: -10000; skew-x: 18.8; skew-y: 18.8; scale-x: 0.847; scale-y: 0.847; }
        frame 78 { x: 32.9; skew-x: 16; skew-y: 16; scale-x: 0.846; scale-y: 0.846; }
        frame 79 { x: 33.9; skew-x: 13; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 35.1; skew-x: 10.1; skew-y: 10.1; scale-x: 0.847; scale-y: 0.847; }
        frame 81 { x: 26.1; y: 41.8; skew-x: 1.4; skew-y: 2; scale-x: -10000; scale-y: 0.843; }
        frame 82 { x: 17.2; y: 50.2; skew-x: -7; skew-y: -5.9; scale-x: 0.848; scale-y: 0.841; }
        frame 83 { x: 8.4; y: 59.1; skew-x: -15.7; skew-y: -14; scale-x: 0.85; scale-y: 0.84; }
        frame 84 { x: 7.8; y: 60.5; skew-x: -18.1; skew-y: -16.4; scale-x: 0.849; scale-y: 0.838; }
        frame 85 { x: 7.3; y: 62; skew-x: -20.3; skew-y: -18.6; scale-x: 0.848; scale-y: -10000; }
        frame 86 { x: 6.7; y: 63.4; skew-x: -22.6; skew-y: -20.9; scale-x: -10000; scale-y: 0.837; }
        frame 87 { x: 6.1; y: 64.8; skew-x: -24.8; skew-y: -23.1; scale-y: 0.838; }
        frame 88 { x: 8.4; y: 63.3; skew-x: -25.5; skew-y: -24; scale-x: 0.847; scale-y: -10000; }
        frame 89 { x: 10.7; y: 61.6; skew-x: -26.2; skew-y: -24.8; scale-x: -10000; scale-y: 0.839; }
        frame 90 { x: 13.1; y: 60.1; skew-x: -26.9; skew-y: -25.7; scale-y: 0.84; }
        frame 91 { x: 15.3; y: 58.5; skew-x: -27.5; skew-y: -26.5; scale-x: 0.848; scale-y: 0.842; }
        frame 92 { x: 16.7; y: 54.3; skew-x: -15.1; skew-y: -14.3; scale-x: 0.847; scale-y: 0.843; }
        frame 93 { x: 18.5; y: 50.5; skew-x: -2.4; skew-y: -1.9; scale-x: -10000; scale-y: 0.844; }
        frame 94 { x: 21; y: 47.4; skew-x: 10.1; skew-y: 10.3; scale-x: 0.848; scale-y: 0.846; }
        frame 95 { x: 24.1; y: 44.9; skew-x: 22.5; skew-y: 22.5; scale-x: 0.849; scale-y: 0.849; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 24.2; y: 43.6; skew-x: 16.7; skew-y: 16.7; scale-x: 0.848; scale-y: 0.848; }
        frame 98 { x: 24.4; y: 42.7; skew-x: 10.8; skew-y: 10.8; scale-x: 0.847; scale-y: 0.847; }
        frame 99 { x: 24.7; y: 41.8; skew-x: 5; skew-y: 5; scale-x: 0.846; scale-y: 0.846; }
        frame 100 { x: 24.9; y: 41.2; skew-x: -0.9; skew-y: -0.9; scale-x: 0.847; scale-y: 0.847; }
        frame 101 { x: 23.2; y: 40.1; skew-x: -2.9; skew-y: -2.9; scale-x: 0.845; scale-y: 0.845; }
        frame 102 { x: 21.6; y: 39.1; skew-x: -4.9; skew-y: -4.9; scale-x: 0.844; scale-y: 0.844; }
        frame 103 { x: 20; y: 38.1; skew-x: -6.9; skew-y: -6.9; scale-x: 0.843; scale-y: 0.843; }
        frame 104 { x: 18.5; y: 37.1; skew-x: -8.9; skew-y: -8.9; scale-x: 0.844; scale-y: 0.844; }
        frame 105 { x: 13.2; y: 38.8; skew-x: -14.7; skew-y: -14.7; scale-x: 0.842; scale-y: 0.841; }
        frame 106 { x: 7.8; y: 40.5; skew-x: -20.5; skew-y: -20.5; scale-x: 0.84; scale-y: 0.84; }
        frame 107 { x: 2.6; y: 42.3; skew-x: -26.4; skew-y: -26.4; scale-x: 0.841; scale-y: 0.837; }
        frame 108 { x: -2.4; y: 44.3; skew-x: -32.1; skew-y: -32.2; scale-x: 0.84; scale-y: -10000; }
        frame 109 { x: -7.4; y: 49.7; skew-x: -40.8; skew-y: -40.8; scale-x: 0.838; }
        frame 110 { x: -12.1; y: 55.4; skew-x: -49.3; skew-y: -49.3; scale-x: -10000; }
        frame 111 { x: -16.4; y: 60.8; skew-x: -57.7; skew-y: -57.8; scale-x: 0.839; scale-y: 0.836; }
        frame 112 { x: -20.2; y: 66.2; skew-x: -66.4; skew-y: -66.3; scale-x: 0.838; scale-y: -10000; }
        frame 113 { x: -24.7; y: 74; skew-x: -72.9; skew-y: -72.9; scale-x: 0.836; scale-y: 0.835; }
        frame 114 { x: -29; y: 81.6; skew-x: -79.5; skew-y: -79.5; scale-x: -10000; scale-y: 0.833; }
        frame 115 { x: -33; y: 89.2; skew-x: -86.1; skew-y: -86.1; scale-y: 0.832; }
        frame 116 { x: -36.9; y: 96.8; skew-x: -92.8; skew-y: -92.8; scale-y: 0.833; }
        frame 117 { x: -38.2; y: 115.2; skew-x: -108.4; skew-y: -108.4; scale-x: 0.835; scale-y: 0.831; }
        frame 118 { x: -38.9; y: 132.6; skew-x: -123.9; skew-y: -123.9; scale-x: 0.836; scale-y: 0.833; }
        frame 119 { x: -39; y: 132.8; skew-x: -124.8; skew-y: -123; scale-x: 0.816; scale-y: 0.824; }
        frame 120 { x: -38.9; y: 133; skew-x: -125.8; skew-y: -122.1; scale-x: 0.796; scale-y: 0.816; }
        frame 121 { x: -10000; y: 133.3; skew-x: -126.7; skew-y: -121.1; scale-x: 0.779; scale-y: 0.808; }
        frame 122 { x: -39.7; y: 131.3; skew-x: -124.6; skew-y: -117.8; scale-x: 0.767; scale-y: 0.802; }
        frame 123 { x: -40.5; y: 129.2; skew-x: -122.6; skew-y: -114.5; scale-x: 0.755; scale-y: 0.797; }
        frame 124 { x: -41.2; y: 127.2; skew-x: -120.6; skew-y: -111.2; scale-x: 0.744; scale-y: 0.792; }
        frame 125 { x: -42; y: 125; skew-x: -118.6; skew-y: -107.9; scale-x: 0.734; scale-y: 0.789; }
        frame 126 { x: -42.5; y: 124; skew-x: -116.8; skew-y: -106.1; scale-x: 0.732; scale-y: 0.787; }
        frame 127 { x: -43; y: 123; skew-x: -115.1; skew-y: -104.4; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -43.6; y: 122; skew-x: -113.1; skew-y: -102.4; }
        frame 129 { x: -44; y: 121; skew-x: -111.3; skew-y: -100.6; scale-x: 0.733; scale-y: 0.788; }
        frame 130 { x: -43; y: 123.1; skew-x: -115; skew-y: -104.4; scale-x: 0.732; scale-y: 0.787; }
        frame 131 { x: -42; y: 125; skew-x: -118.6; skew-y: -107.9; scale-x: 0.734; scale-y: 0.789; }
        frame 132 { x: 21.3; y: 47; skew-x: 4.9; skew-y: 4.9; scale-x: 0.848; scale-y: 0.848; }
        frame 133 { x: 21.6; y: 46.5; skew-x: 5; skew-y: 5; scale-x: 0.847; scale-y: 0.847; }
        frame 134 { x: 21.8; y: 46.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 22.1; y: 45.6; }
        frame 136 { x: 22.3; y: 45.2; skew-x: 4.9; skew-y: 4.9; scale-x: 0.848; scale-y: 0.848; }
        frame 137 { x: 23; y: 43.1; skew-x: 6.2; skew-y: 6.2; scale-x: 0.847; scale-y: 0.847; }
        frame 138 { x: 23.7; y: 41; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 24.6; y: 38.8; skew-x: 8.5; skew-y: 8.5; }
        frame 140 { x: 25.3; y: 36.6; skew-x: 9.7; skew-y: 9.7; scale-x: 0.848; scale-y: 0.848; }
        frame 141 { x: 25.7; y: 36.1; skew-x: 11.3; skew-y: 11.3; scale-x: 0.847; scale-y: 0.847; }
        frame 142 { x: 26.3; y: 35.4; skew-x: 13; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 26.8; y: 34.8; skew-x: 14.5; skew-y: 14.5; }
        frame 144 { x: 27.4; y: 34.2; skew-x: 16; skew-y: 16; }
        frame 145 { x: 28; y: 33.6; skew-x: 17.5; skew-y: 17.5; scale-x: 0.848; scale-y: 0.848; }
        frame 146 { x: 26.2; y: 36.5; skew-x: 13.2; skew-y: 13.2; scale-x: 0.847; scale-y: 0.847; }
        frame 147 { x: 24.4; y: 39.4; skew-x: 8.7; skew-y: 8.7; scale-x: 0.846; scale-y: 0.846; }
        frame 148 { x: 22.6; y: 42.6; skew-x: 4.2; skew-y: 4.2; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 21; y: 45.9; skew-x: -0.2; skew-y: -0.2; }
        frame 150 { x: 19.3; y: 49; skew-x: -4.7; skew-y: -4.7; scale-x: 0.847; scale-y: 0.847; }
        frame 151 { x: 18.8; y: 50.6; skew-x: -10000; skew-y: -10000; scale-x: 0.845; scale-y: 0.845; }
        frame 152 { x: 18.3; y: 52.1; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 17.8; y: 53.6; }
        frame 154 { x: 17.3; y: 55; scale-x: 0.847; scale-y: 0.847; }
        frame 155 { x: 17.8; y: 54; skew-x: -5.7; skew-y: -5.7; scale-x: 0.845; scale-y: 0.845; }
        frame 156 { x: 18.3; y: 53.1; skew-x: -6.9; skew-y: -6.9; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 18.8; y: 52; skew-x: -8; skew-y: -8; }
        frame 158 { x: 19.4; y: 51; skew-x: -9.2; skew-y: -9.2; }
        frame 159 { x: 19.9; y: 49.9; skew-x: -10.2; skew-y: -10.2; scale-x: 0.846; scale-y: 0.846; }
        frame 160 { x: 21.7; y: 47.7; skew-x: -9.2; skew-y: -9.2; scale-x: 0.845; scale-y: 0.845; }
        frame 161 { x: 23.3; y: 45.6; skew-x: -8.5; skew-y: -8.5; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 25; y: 43.4; skew-x: -7.5; skew-y: -7.5; scale-x: 0.844; scale-y: 0.844; }
        frame 163 { x: 26.7; y: 41.3; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 28.3; y: 39.1; skew-x: -5.7; skew-y: -5.7; scale-x: 0.845; scale-y: 0.845; }
        frame 165 { x: 27.9; y: -10000; skew-x: -5.2; skew-y: -5.2; scale-x: 0.844; scale-y: 0.844; }
        frame 166 { x: 27.6; y: 39.3; skew-x: -4.7; skew-y: -4.7; scale-x: 0.843; scale-y: 0.843; }
        frame 167 { x: 27.2; y: 39.4; skew-x: -4; skew-y: -4; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 26.9; y: 39.5; skew-x: -3.5; skew-y: -3.5; }
        frame 169 { x: 26.7; y: -10000; skew-x: -2.9; skew-y: -2.9; scale-x: 0.844; scale-y: 0.844; }
        frame 170 { x: 24.2; y: 43.8; skew-x: -5.9; skew-y: -5.9; scale-x: 0.843; scale-y: 0.843; }
        frame 171 { x: 21.8; y: 48.1; skew-x: -9; skew-y: -9; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 19.4; y: 52.5; skew-x: -12; skew-y: -12; }
        frame 173 { x: 17; y: 57; skew-x: -15; skew-y: -15; scale-x: 0.845; scale-y: 0.845; }
        frame 174 { x: 17.8; y: 54.8; skew-x: -11; skew-y: -11; scale-x: 0.844; scale-y: 0.844; }
        frame 175 { x: 18.6; y: 52.8; skew-x: -7; skew-y: -7; scale-x: 0.845; scale-y: 0.845; }
        frame 176 { x: 19.5; y: 50.8; skew-x: -2.9; skew-y: -2.9; scale-x: 0.846; scale-y: 0.846; }
        frame 177 { x: 20.4; y: 48.9; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; }
        frame 178 { x: 21.3; y: 47; skew-x: 4.9; skew-y: 4.9; scale-x: 0.848; scale-y: 0.848; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 21.9; y: 45.8; skew-x: 1; skew-y: 1; scale-x: 0.847; scale-y: 0.847; }
        frame 181 { x: 22.5; y: 44.5; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 23.1; y: 43.4; skew-x: -7; skew-y: -7; scale-x: 0.846; scale-y: 0.846; }
        frame 183 { x: 23.8; y: 42.5; skew-x: -11.2; skew-y: -11.2; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: 24.4; y: 41.5; skew-x: -15.2; skew-y: -15.2; }
        frame 185 { x: 25.3; y: 40.5; skew-x: -19.3; skew-y: -19.3; }
        frame 186 { x: 26.2; y: 39.6; skew-x: -23.3; skew-y: -23.3; }
        frame 187 { x: 27.1; y: 38.8; skew-x: -27.3; skew-y: -27.3; scale-x: 0.847; scale-y: 0.847; }
        frame 188 { x: 24.4; y: 43.3; skew-x: -38.8; skew-y: -38.8; scale-x: 0.846; scale-y: 0.846; }
        frame 189 { x: 22.5; y: 47.9; skew-x: -50; skew-y: -50; scale-x: -10000; scale-y: -10000; }
        frame 190 { x: 21; y: 52.5; skew-x: -61.1; skew-y: -61.1; }
        frame 191 { x: 20.3; y: 57; skew-x: -72.4; skew-y: -72.4; }
        frame 192 { x: -10000; y: 61.4; skew-x: -83.9; skew-y: -83.9; scale-x: 0.845; scale-y: 0.845; }
        frame 193 { x: 20.7; y: 65.5; skew-x: -95.2; skew-y: -95.2; scale-x: -10000; scale-y: -10000; }
        frame 194 { x: 21.8; y: 69.2; skew-x: -106.6; skew-y: -106.6; scale-x: 0.846; scale-y: 0.846; }
        frame 195 { x: 18.6; y: 67.1; skew-x: -92.7; skew-y: -92.7; scale-x: 0.845; scale-y: 0.845; }
        frame 196 { x: 16.2; y: 64.2; skew-x: -78.6; skew-y: -78.7; scale-x: 0.846; scale-y: 0.846; }
        frame 197 { x: 14.6; y: 60.9; skew-x: -64.6; skew-y: -64.6; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 14.1; y: 57.6; skew-x: -50.8; skew-y: -50.8; scale-x: 0.847; scale-y: 0.847; }
        frame 199 { x: 14.5; y: 54.3; skew-x: -37; skew-y: -37; scale-x: 0.846; scale-y: 0.846; }
        frame 200 { x: 16; y: 51.3; skew-x: -23; skew-y: -23; scale-x: -10000; scale-y: -10000; }
        frame 201 { x: 18.3; y: 48.8; skew-x: -9; skew-y: -9; scale-x: 0.847; scale-y: 0.847; }
        frame 202 { x: 21.3; y: 47; skew-x: 4.9; skew-y: 4.9; scale-x: 0.848; scale-y: 0.848; }
        frame 203 { x: 24.1; y: 44.9; skew-x: 22.5; skew-y: 22.5; scale-x: 0.849; scale-y: 0.849; }
        frame 204 { x: 29.5; y: 40.7; skew-x: 35.8; skew-y: 35.8; scale-x: 0.848; scale-y: 0.848; }
        frame 205 { x: 35.2; y: 37.5; skew-x: 49.4; skew-y: 49.4; scale-x: 0.847; scale-y: 0.847; }
        frame 206 { x: 40.5; y: 35.4; skew-x: 62.9; skew-y: 62.9; scale-x: 0.846; scale-y: 0.846; }
        frame 207 { x: 45.5; y: 34; skew-x: 76.4; skew-y: 76.4; scale-x: -10000; scale-y: -10000; }
        frame 208 { x: 49.7; y: 33.4; skew-x: 90; skew-y: 90; scale-x: 0.845; scale-y: 0.845; }
        frame 209 { x: 53; y: 33.1; skew-x: 103.4; skew-y: 103.4; scale-x: 0.846; scale-y: 0.846; }
        frame 210 { x: 49.5; y: 34.5; skew-x: 99.2; skew-y: 99.2; scale-x: 0.845; scale-y: 0.845; }
        frame 211 { x: 47.5; y: 35.9; skew-x: 95; skew-y: 95; scale-x: 0.844; scale-y: 0.844; }
        frame 212 { x: 46.6; y: 38; skew-x: 90.7; skew-y: 90.7; scale-x: 0.843; scale-y: 0.843; }
        frame 213 { x: 47.2; y: 41.8; skew-x: 79.4; skew-y: 79.4; scale-x: 0.842; scale-y: 0.842; }
        frame 214 { x: 42.9; y: 46.6; skew-x: 69.9; skew-y: 70.1; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_body";
        frame-count: 215;
        frame 0 { x: 26.9; y: 35.4; skew-x: 357.2; skew-y: 357.2; scale-x: 0.85; scale-y: 0.85; image: IMAGE_REANIM_ZOMBIE_LADDER_BODY; }
        frame 1 { x: 27.4; y: 34.8; skew-x: 357.7; skew-y: 357.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 27.9; y: 34.2; skew-x: 358.2; skew-y: 358.2; }
        frame 3 { x: 28.3; y: 33.6; skew-x: 358.7; skew-y: 358.7; }
        frame 4 { x: 28.8; y: 33.1; skew-x: 359.2; skew-y: 359.2; }
        frame 5 { x: 29.2; y: 32.6; skew-x: 359.7; skew-y: 359.7; }
        frame 6 { x: 29.5; y: 32.1; skew-x: 360; skew-y: 360; }
        frame 7 { x: 29.1; y: 32.6; skew-x: 359.7; skew-y: 359.7; }
        frame 8 { x: 28.7; y: 33.1; skew-x: 359.2; skew-y: 359.2; }
        frame 9 { x: 28.3; y: 33.7; skew-x: 358.7; skew-y: 358.7; }
        frame 10 { x: 27.8; y: 34.2; skew-x: 358.2; skew-y: 358.2; }
        frame 11 { x: 27.3; y: 34.8; skew-x: 357.7; skew-y: 357.7; }
        frame 12 { x: 26.9; y: 35.4; skew-x: 357.2; skew-y: 357.2; }
        frame 13 { x: 26.6; y: 35.8; skew-x: 357; skew-y: 357; }
        frame 14 { x: 26.2; y: 36.3; skew-x: 356.5; skew-y: 356.5; }
        frame 15 { x: 26; y: 36.7; skew-x: 356.2; skew-y: 356.2; }
        frame 16 { x: 25.6; y: 37.2; skew-x: 355.7; skew-y: 355.7; }
        frame 17 { x: 25.3; y: 37.5; skew-x: 355.5; skew-y: 355.5; }
        frame 18 { x: 24.9; y: 38.1; skew-x: 355; skew-y: 355; }
        frame 19 { x: 25.3; y: 37.6; skew-x: 355.5; skew-y: 355.5; }
        frame 20 { x: 25.7; y: 37.3; skew-x: 355.7; skew-y: 355.7; }
        frame 21 { x: 26; y: 36.8; skew-x: 356.2; skew-y: 356.2; }
        frame 22 { x: 26.3; y: 36.3; skew-x: 356.5; skew-y: 356.5; }
        frame 23 { x: 26.7; y: 35.8; skew-x: 357; skew-y: 357; }
        frame 24 { x: 26.9; y: 35.4; skew-x: 357.2; skew-y: 357.2; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 27.9; y: 34.8; skew-x: 358.2; skew-y: 358.2; }
        frame 27 { x: 28.8; y: 34.3; skew-x: 359.2; skew-y: 359.2; }
        frame 28 { x: 29.6; y: 33.7; skew-x: 360; skew-y: 360; }
        frame 29 { x: 30.5; y: 33.3; skew-x: 360.8; skew-y: 360.8; }
        frame 30 { x: 31.7; y: 31.7; skew-x: 362.5; skew-y: 362.5; scale-x: 0.849; scale-y: 0.849; }
        frame 31 { x: 32.9; y: 30; skew-x: 364.5; skew-y: 364.5; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 34; y: 28.5; skew-x: 366.3; skew-y: 366.3; }
        frame 33 { x: 35.4; y: 27; skew-x: 368.4; skew-y: 368.4; }
        frame 34 { x: 36; y: 26.7; skew-x: 369.6; skew-y: 369.6; }
        frame 35 { x: 37; y: 26.1; skew-x: 371; skew-y: 371; }
        frame 36 { x: 37.9; y: 25.8; skew-x: 372.3; skew-y: 372.3; scale-x: 0.848; scale-y: 0.848; }
        frame 37 { x: 38.8; y: 25.4; skew-x: 373.8; skew-y: 373.8; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 39.6; y: 25; skew-x: 375.2; skew-y: 375.2; scale-x: 0.849; scale-y: 0.849; }
        frame 39 { x: 37.4; y: 26.4; skew-x: 372.6; skew-y: 372.6; scale-x: 0.848; scale-y: 0.848; }
        frame 40 { x: 35.3; y: 27.8; skew-x: 370; skew-y: 370; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 33.1; y: 29.3; skew-x: 367.5; skew-y: 367.5; }
        frame 42 { x: 31.1; y: 30.8; skew-x: 365; skew-y: 365; }
        frame 43 { x: 29.1; y: 32.4; skew-x: 362.7; skew-y: 362.7; }
        frame 44 { x: 27.3; y: 34.4; skew-x: 360.5; skew-y: 360.5; scale-y: 0.85; }
        frame 45 { x: 25.7; y: 36.4; skew-x: 358.5; skew-y: 358.5; scale-x: 0.847; scale-y: 0.852; }
        frame 46 { x: 24; y: 38.4; skew-x: 356.2; skew-y: 356.2; scale-x: -10000; scale-y: 0.855; }
        frame 47 { x: 22.2; y: 40.5; skew-x: 354; skew-y: 354; scale-y: 0.857; }
        frame 48 { x: 23.3; y: 39.3; skew-x: 354.7; skew-y: 354.7; scale-y: 0.855; }
        frame 49 { x: 24.4; y: 38.3; skew-x: 355.2; skew-y: 355.2; scale-y: 0.853; }
        frame 50 { x: 25.5; y: 37.2; skew-x: 355.7; skew-y: 355.7; scale-y: 0.851; }
        frame 51 { x: 26.6; y: 36.1; skew-x: 356.4; skew-y: 356.4; scale-x: 0.848; scale-y: 0.85; }
        frame 52 { x: 27.7; y: 35.3; skew-x: 356.9; skew-y: 356.9; scale-x: -10000; scale-y: 0.848; }
        frame 53 { x: 29.9; y: 33; skew-x: 360.5; skew-y: 360.5; scale-y: -10000; }
        frame 54 { x: 32.1; y: 30.9; skew-x: 364; skew-y: 364; }
        frame 55 { x: 34.5; y: 28.8; skew-x: 367.8; skew-y: 367.8; }
        frame 56 { x: 37.1; y: 26.9; skew-x: 371.5; skew-y: 371.5; }
        frame 57 { x: 39.6; y: 25; skew-x: 375.2; skew-y: 375.2; scale-x: 0.849; scale-y: 0.849; }
        frame 58 { x: 38.8; y: 25.4; skew-x: 373.8; skew-y: 373.8; scale-x: 0.848; scale-y: 0.848; }
        frame 59 { x: 37.9; y: 25.8; skew-x: 372.3; skew-y: 372.3; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 37; y: 26.2; skew-x: 371; skew-y: 371; scale-x: 0.849; scale-y: 0.849; }
        frame 61 { x: 36.1; y: 26.6; skew-x: 369.6; skew-y: 369.6; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 35.4; y: 27; skew-x: 368.4; skew-y: 368.4; }
        frame 63 { x: 32.6; y: 29.8; skew-x: 364.8; skew-y: 364.8; }
        frame 64 { x: 30.2; y: 32.5; skew-x: 361.5; skew-y: 361.5; }
        frame 65 { x: 27.8; y: 35.4; skew-x: 358.2; skew-y: 358.2; }
        frame 66 { x: 25.4; y: 38.4; skew-x: 354.8; skew-y: 354.8; }
        frame 67 { x: 25.8; y: 37.6; skew-x: 355.4; skew-y: 355.4; }
        frame 68 { x: 26; y: 37.1; skew-x: 355.7; skew-y: 355.7; }
        frame 69 { x: 26.4; y: 36.6; skew-x: 356.2; skew-y: 356.2; }
        frame 70 { x: 26.7; y: 36; skew-x: 356.7; skew-y: 356.7; }
        frame 71 { x: 26.9; y: 35.4; skew-x: 357.2; skew-y: 357.2; scale-x: 0.85; scale-y: 0.85; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 28.7; y: 33.3; skew-x: 359.5; skew-y: 359.5; }
        frame 74 { x: 30.4; y: 31.5; skew-x: 361.3; skew-y: 361.3; scale-x: 0.849; scale-y: 0.849; }
        frame 75 { x: 32.2; y: 29.5; skew-x: 363.3; skew-y: 363.3; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 34.1; y: 27.5; skew-x: 365.5; skew-y: 365.5; }
        frame 77 { x: 35.4; y: 26.3; skew-x: 366.8; skew-y: 366.8; }
        frame 78 { x: 37; y: 24.9; skew-x: 368.3; skew-y: 368.3; }
        frame 79 { x: 38.5; y: 23.5; skew-x: 369.8; skew-y: 369.8; }
        frame 80 { x: 40; y: 22.2; skew-x: 371.3; skew-y: 371.3; }
        frame 81 { x: 29.7; y: 28.3; skew-x: 362.1; skew-y: 362.1; }
        frame 82 { x: 20.4; y: 34.9; skew-x: 353.2; skew-y: 353.2; }
        frame 83 { x: 11.6; y: 42.4; skew-x: 344.1; skew-y: 344.1; }
        frame 84 { x: 11.3; y: 44.9; skew-x: 342.4; skew-y: 342.4; scale-x: 0.848; scale-y: 0.848; }
        frame 85 { x: 10.8; y: 47.5; skew-x: 340.7; skew-y: 340.7; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 10.5; y: 50.1; skew-x: 338.9; skew-y: 338.9; }
        frame 87 { x: 10; y: 52.8; skew-x: 337; skew-y: 337; scale-x: 0.849; scale-y: 0.849; }
        frame 88 { x: 11.7; y: 50.4; skew-x: 339.2; skew-y: 339.2; scale-x: 0.848; scale-y: 0.848; }
        frame 89 { x: 13.2; y: 48; skew-x: 341.2; skew-y: 341.2; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 14.7; y: 45.6; skew-x: 343.2; skew-y: 343.2; }
        frame 91 { x: 16.3; y: 43.3; skew-x: 345.2; skew-y: 345.2; }
        frame 92 { x: 18.8; y: 41.1; skew-x: 348.2; skew-y: 348.2; }
        frame 93 { x: 21.4; y: 39.1; skew-x: 351.2; skew-y: 351.2; scale-x: 0.849; scale-y: 0.849; }
        frame 94 { x: 24; y: 37.3; skew-x: 354.2; skew-y: 354.2; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 26.9; y: 35.4; skew-x: 357.2; skew-y: 357.2; scale-x: 0.85; scale-y: 0.85; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 28.1; y: 33.6; skew-x: 359.4; skew-y: 359.4; scale-x: 0.849; scale-y: 0.849; }
        frame 98 { x: 29.1; y: 32.1; skew-x: 361.3; skew-y: 361.3; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 30.3; y: 30.6; skew-x: 363.3; skew-y: 363.3; }
        frame 100 { x: 31.5; y: 29; skew-x: 365.3; skew-y: 365.3; scale-x: 0.848; scale-y: 0.848; }
        frame 101 { x: 30.1; y: 27.7; skew-x: 366.1; skew-y: 366.1; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 29; y: 26.4; skew-x: 367; skew-y: 367; scale-x: 0.847; scale-y: 0.847; }
        frame 103 { x: 27.6; y: 25; skew-x: 367.8; skew-y: 367.8; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 26.3; y: 23.5; skew-x: 368.8; skew-y: 368.8; }
        frame 105 { x: 20.7; y: 24.1; skew-x: 368.3; skew-y: 368.3; scale-x: 0.845; scale-y: 0.845; }
        frame 106 { x: 15.3; y: 24.5; skew-x: 368; skew-y: 368; scale-x: 0.844; scale-y: 0.844; }
        frame 107 { x: 9.7; y: 25; skew-x: 367.5; skew-y: 367.5; scale-x: 0.843; scale-y: 0.843; }
        frame 108 { x: 4.2; y: 25.5; skew-x: 367.2; skew-y: 367.3; scale-x: 0.842; scale-y: -10000; }
        frame 109 { x: -2.8; y: 29.5; skew-x: 362.1; skew-y: 362.3; scale-x: -10000; scale-y: 0.842; }
        frame 110 { x: -9.7; y: 33.5; skew-x: 357.2; skew-y: 357.4; scale-x: 0.841; scale-y: -10000; }
        frame 111 { x: -16.4; y: 37.8; skew-x: 352.2; skew-y: 352.4; scale-x: 0.84; scale-y: 0.841; }
        frame 112 { x: -23.1; y: 42.1; skew-x: 347.2; skew-y: 347.3; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: -30.9; y: 50.5; skew-x: 340.7; skew-y: 340.7; scale-x: 0.839; scale-y: 0.84; }
        frame 114 { x: -38.3; y: 59.2; skew-x: 333.9; skew-y: 334.2; scale-x: 0.838; scale-y: 0.839; }
        frame 115 { x: -45; y: 68.1; skew-x: 327.4; skew-y: 327.6; scale-x: 0.837; scale-y: 0.838; }
        frame 116 { x: -51.5; y: 77; skew-x: 320.7; skew-y: 320.9; scale-x: -10000; scale-y: 0.839; }
        frame 117 { x: -57.6; y: 104.3; skew-x: 298.6; skew-y: 298.8; scale-x: 0.836; scale-y: 0.837; }
        frame 118 { x: -58.2; y: 130.1; skew-x: 276.7; skew-y: 276.9; scale-x: -10000; scale-y: 0.838; }
        frame 119 { x: -58; y: 130.3; skew-x: 278; skew-y: 276.8; scale-x: 0.812; scale-y: 0.834; }
        frame 120 { x: -57.7; y: 130.5; skew-x: 279.3; skew-y: -10000; scale-x: 0.787; scale-y: 0.831; }
        frame 121 { x: -57.6; y: 130.7; skew-x: 280.6; skew-y: 277; scale-x: 0.764; scale-y: 0.829; }
        frame 122 { x: -58.3; y: 129.4; skew-x: 282.5; skew-y: 278.3; scale-x: 0.774; scale-y: 0.831; }
        frame 123 { x: -59.1; y: 128.3; skew-x: 284.5; skew-y: 279.8; scale-x: 0.784; scale-y: 0.833; }
        frame 124 { x: -59.9; y: 126.9; skew-x: 286.5; skew-y: 281.3; scale-x: 0.794; scale-y: 0.835; }
        frame 125 { x: -60.6; y: 125.5; skew-x: 288.3; skew-y: 283; scale-x: 0.805; scale-y: 0.838; }
        frame 126 { x: -61.4; y: 124.1; skew-x: 290.3; skew-y: 284.5; scale-x: 0.815; scale-y: 0.84; }
        frame 127 { x: -62.2; y: 122.6; skew-x: 292.3; skew-y: 286; scale-x: 0.826; scale-y: 0.842; }
        frame 128 { x: -62.9; y: 121.2; skew-x: 294.3; skew-y: 287.5; scale-x: 0.836; scale-y: 0.845; }
        frame 129 { x: -63.6; y: 119.8; skew-x: 296.3; skew-y: 289.1; scale-x: 0.848; scale-y: 0.848; }
        frame 130 { x: -61.1; y: 125.3; skew-x: 286.5; skew-y: 282.8; scale-x: 0.841; scale-y: 0.842; }
        frame 131 { x: -58.2; y: 130.1; skew-x: 276.7; skew-y: 276.9; scale-x: 0.836; scale-y: 0.838; }
        frame 132 { x: 26.9; y: 35.4; skew-x: 357.2; skew-y: 357.2; scale-x: 0.85; scale-y: 0.85; }
        frame 133 { x: 27.9; y: 34.8; skew-x: 358.2; skew-y: 358.2; scale-x: -10000; scale-y: -10000; }
        frame 134 { x: 28.8; y: 34.3; skew-x: 359.2; skew-y: 359.2; }
        frame 135 { x: 29.6; y: 33.7; skew-x: 360; skew-y: 360; }
        frame 136 { x: 30.5; y: 33.3; skew-x: 360.8; skew-y: 360.8; }
        frame 137 { x: 31.7; y: 31.7; skew-x: 362.5; skew-y: 362.5; scale-x: 0.849; scale-y: 0.849; }
        frame 138 { x: 32.9; y: 30; skew-x: 364.5; skew-y: 364.5; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 34; y: 28.5; skew-x: 366.3; skew-y: 366.3; }
        frame 140 { x: 35.4; y: 27; skew-x: 368.4; skew-y: 368.4; }
        frame 141 { x: 36; y: 26.7; skew-x: 369.6; skew-y: 369.6; }
        frame 142 { x: 37; y: 26.1; skew-x: 371; skew-y: 371; }
        frame 143 { x: 37.9; y: 25.8; skew-x: 372.3; skew-y: 372.3; scale-x: 0.848; scale-y: 0.848; }
        frame 144 { x: 38.8; y: 25.4; skew-x: 373.8; skew-y: 373.8; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 39.6; y: 25; skew-x: 375.2; skew-y: 375.2; scale-x: 0.849; scale-y: 0.849; }
        frame 146 { x: 37.4; y: 26.4; skew-x: 372.6; skew-y: 372.6; scale-x: 0.848; scale-y: 0.848; }
        frame 147 { x: 35.3; y: 27.8; skew-x: 370; skew-y: 370; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 33.1; y: 29.3; skew-x: 367.5; skew-y: 367.5; }
        frame 149 { x: 31.1; y: 30.8; skew-x: 365; skew-y: 365; }
        frame 150 { x: 29.1; y: 32.4; skew-x: 362.7; skew-y: 362.7; }
        frame 151 { x: 27.3; y: 34.4; skew-x: 360.5; skew-y: 360.5; scale-y: 0.85; }
        frame 152 { x: 25.7; y: 36.4; skew-x: 358.5; skew-y: 358.5; scale-x: 0.847; scale-y: 0.852; }
        frame 153 { x: 24; y: 38.4; skew-x: 356.2; skew-y: 356.2; scale-x: -10000; scale-y: 0.855; }
        frame 154 { x: 22.2; y: 40.5; skew-x: 354; skew-y: 354; scale-y: 0.857; }
        frame 155 { x: 23.3; y: 39.3; skew-x: 354.7; skew-y: 354.7; scale-y: 0.855; }
        frame 156 { x: 24.4; y: 38.3; skew-x: 355.2; skew-y: 355.2; scale-y: 0.853; }
        frame 157 { x: 25.5; y: 37.2; skew-x: 355.7; skew-y: 355.7; scale-y: 0.851; }
        frame 158 { x: 26.6; y: 36.1; skew-x: 356.4; skew-y: 356.4; scale-x: 0.848; scale-y: 0.85; }
        frame 159 { x: 27.7; y: 35.3; skew-x: 356.9; skew-y: 356.9; scale-x: -10000; scale-y: 0.848; }
        frame 160 { x: 29.9; y: 33; skew-x: 360.5; skew-y: 360.5; scale-y: -10000; }
        frame 161 { x: 32.1; y: 30.9; skew-x: 364; skew-y: 364; }
        frame 162 { x: 34.5; y: 28.8; skew-x: 367.8; skew-y: 367.8; }
        frame 163 { x: 37.1; y: 26.9; skew-x: 371.5; skew-y: 371.5; }
        frame 164 { x: 39.6; y: 25; skew-x: 375.2; skew-y: 375.2; scale-x: 0.849; scale-y: 0.849; }
        frame 165 { x: 38.8; y: 25.4; skew-x: 373.8; skew-y: 373.8; scale-x: 0.848; scale-y: 0.848; }
        frame 166 { x: 37.9; y: 25.8; skew-x: 372.3; skew-y: 372.3; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 37; y: 26.2; skew-x: 371; skew-y: 371; scale-x: 0.849; scale-y: 0.849; }
        frame 168 { x: 36.1; y: 26.6; skew-x: 369.6; skew-y: 369.6; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 35.4; y: 27; skew-x: 368.4; skew-y: 368.4; }
        frame 170 { x: 32.6; y: 29.8; skew-x: 364.8; skew-y: 364.8; }
        frame 171 { x: 30.2; y: 32.5; skew-x: 361.5; skew-y: 361.5; }
        frame 172 { x: 27.8; y: 35.4; skew-x: 358.2; skew-y: 358.2; }
        frame 173 { x: 25.4; y: 38.4; skew-x: 354.8; skew-y: 354.8; }
        frame 174 { x: 25.8; y: 37.6; skew-x: 355.4; skew-y: 355.4; }
        frame 175 { x: 26; y: 37.1; skew-x: 355.7; skew-y: 355.7; }
        frame 176 { x: 26.4; y: 36.6; skew-x: 356.2; skew-y: 356.2; }
        frame 177 { x: 26.7; y: 36; skew-x: 356.7; skew-y: 356.7; }
        frame 178 { x: 26.9; y: 35.4; skew-x: 357.2; skew-y: 357.2; scale-x: 0.85; scale-y: 0.85; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 28.7; y: 33.3; skew-x: 359.5; skew-y: 359.5; }
        frame 181 { x: 30.4; y: 31.5; skew-x: 361.3; skew-y: 361.3; scale-x: 0.849; scale-y: 0.849; }
        frame 182 { x: 32.2; y: 29.5; skew-x: 363.3; skew-y: 363.3; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 34.1; y: 27.5; skew-x: 365.5; skew-y: 365.5; }
        frame 184 { x: 35.4; y: 26.3; skew-x: 366.8; skew-y: 366.8; }
        frame 185 { x: 37; y: 24.9; skew-x: 368.3; skew-y: 368.3; }
        frame 186 { x: 38.5; y: 23.5; skew-x: 369.8; skew-y: 369.8; }
        frame 187 { x: 40; y: 22.2; skew-x: 371.3; skew-y: 371.3; }
        frame 188 { x: 29.7; y: 28.3; skew-x: 362.1; skew-y: 362.1; }
        frame 189 { x: 20.4; y: 34.9; skew-x: 353.2; skew-y: 353.2; }
        frame 190 { x: 11.6; y: 42.4; skew-x: 344.1; skew-y: 344.1; }
        frame 191 { x: 11.3; y: 44.9; skew-x: 342.4; skew-y: 342.4; scale-x: 0.848; scale-y: 0.848; }
        frame 192 { x: 10.8; y: 47.5; skew-x: 340.7; skew-y: 340.7; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 10.5; y: 50.1; skew-x: 338.9; skew-y: 338.9; }
        frame 194 { x: 10; y: 52.8; skew-x: 337; skew-y: 337; scale-x: 0.849; scale-y: 0.849; }
        frame 195 { x: 11.7; y: 50.4; skew-x: 339.2; skew-y: 339.2; scale-x: 0.848; scale-y: 0.848; }
        frame 196 { x: 13.2; y: 48; skew-x: 341.2; skew-y: 341.2; scale-x: -10000; scale-y: -10000; }
        frame 197 { x: 14.7; y: 45.6; skew-x: 343.2; skew-y: 343.2; }
        frame 198 { x: 16.3; y: 43.3; skew-x: 345.2; skew-y: 345.2; }
        frame 199 { x: 18.8; y: 41.1; skew-x: 348.2; skew-y: 348.2; }
        frame 200 { x: 21.4; y: 39.1; skew-x: 351.2; skew-y: 351.2; scale-x: 0.849; scale-y: 0.849; }
        frame 201 { x: 24; y: 37.3; skew-x: 354.2; skew-y: 354.2; scale-x: -10000; scale-y: -10000; }
        frame 202 { x: 26.9; y: 35.4; skew-x: 357.2; skew-y: 357.2; scale-x: 0.85; scale-y: 0.85; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 204 { x: 29.6; y: 32.6; skew-x: 360; skew-y: 360; }
        frame 205 { x: 32.1; y: 30.2; skew-x: 362.3; skew-y: 362.3; scale-x: 0.849; scale-y: 0.849; }
        frame 206 { x: 34.9; y: 27.6; skew-x: 364.8; skew-y: 364.8; scale-x: -10000; scale-y: -10000; }
        frame 207 { x: 37.6; y: 25.1; skew-x: 367.5; skew-y: 367.5; }
        frame 208 { x: 40.4; y: 22.7; skew-x: 370; skew-y: 370; }
        frame 209 { x: 43.2; y: 20.3; skew-x: 372.7; skew-y: 372.7; }
        frame 210 { x: 37.7; y: 24; skew-x: 367.3; skew-y: 367.3; scale-x: 0.848; scale-y: 0.848; }
        frame 211 { x: 32.5; y: 27.9; skew-x: 362; skew-y: 362; scale-x: -10000; scale-y: -10000; }
        frame 212 { x: 27.6; y: 32; skew-x: 356.7; skew-y: 356.7; }
        frame 213 { x: 22.7; y: 36.4; skew-x: 351.3; skew-y: 351.3; }
        frame 214 { x: 18.7; y: 41.3; skew-x: 346.2; skew-y: 346; scale-x: 0.847; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 215;
        frame 0 { x: 14.3; y: 44.6; skew-x: 351.9; skew-y: 351.9; scale-x: 0.849; scale-y: 0.849; image: IMAGE_REANIM_ZOMBIE_LADDER_JAW; }
        frame 1 { x: 14.7; y: 43.5; skew-x: 353.4; skew-y: 353.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 15.1; y: 42.5; skew-x: 354.7; skew-y: 354.7; }
        frame 3 { x: 15.5; y: 41.5; skew-x: 356; skew-y: 356; }
        frame 4 { x: 16; y: 40.4; skew-x: 357.5; skew-y: 357.5; scale-x: 0.85; scale-y: 0.85; }
        frame 5 { x: 16.4; y: 39.4; skew-x: 358.7; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 16.9; y: 38.5; skew-x: 360; skew-y: 360; }
        frame 7 { x: 16.8; y: 38.4; skew-x: 360.5; skew-y: 360.5; }
        frame 8 { x: 16.6; y: -10000; skew-x: 361; skew-y: 361; scale-x: 0.849; scale-y: 0.849; }
        frame 9 { x: 15.9; y: 39.8; skew-x: 358.7; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 15.4; y: 41.3; skew-x: 356.5; skew-y: 356.5; }
        frame 11 { x: 14.8; y: 42.7; skew-x: 354.2; skew-y: 354.2; }
        frame 12 { x: 14.3; y: 44.1; skew-x: 351.9; skew-y: 351.9; }
        frame 13 { x: 14; y: 45; skew-x: 350.9; skew-y: 350.9; scale-y: 0.863; }
        frame 14 { x: 13.7; y: 45.9; skew-x: 349.7; skew-y: 349.7; scale-y: 0.878; }
        frame 15 { x: 13.4; y: 46.6; skew-x: 348.7; skew-y: 348.7; scale-y: 0.892; }
        frame 16 { x: 13; y: 47.5; skew-x: 347.5; skew-y: 347.5; scale-y: 0.907; }
        frame 17 { x: 12.8; y: 48.3; skew-x: 346.4; skew-y: 346.4; scale-y: 0.921; }
        frame 18 { x: 12.5; y: 49.1; skew-x: 345.2; skew-y: 345.2; scale-y: 0.937; }
        frame 19 { x: 12.7; y: 49; skew-x: 344.7; skew-y: 344.7; scale-x: 0.848; scale-y: 0.932; }
        frame 20 { x: -10000; y: 48.9; skew-x: 344; skew-y: 344; scale-x: -10000; scale-y: 0.93; }
        frame 21 { x: 13; y: 47.8; skew-x: 346; skew-y: 346; scale-y: 0.909; }
        frame 22 { x: 13.5; y: 46.8; skew-x: 348; skew-y: 348; scale-y: 0.889; }
        frame 23 { x: 13.9; y: 45.6; skew-x: 350; skew-y: 350; scale-x: 0.849; scale-y: 0.869; }
        frame 24 { x: 14.3; y: 44.6; skew-x: 351.9; skew-y: 351.9; scale-x: -10000; scale-y: 0.849; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { x: 15.2; y: 42.9; skew-x: 354.5; skew-y: 354.5; }
        frame 27 { x: 16.2; y: 41.1; skew-x: 356.7; skew-y: 356.7; }
        frame 28 { x: 17.2; y: 39.5; skew-x: 359.2; skew-y: 359.2; }
        frame 29 { x: 18.2; y: 37.9; skew-x: 361.5; skew-y: 361.5; }
        frame 30 { x: 19.2; y: 35.9; skew-x: 363.3; skew-y: 363.3; scale-x: 0.848; scale-y: 0.848; }
        frame 31 { x: 20.3; y: 33.9; skew-x: 365.3; skew-y: 365.3; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 21.4; y: 32; skew-x: 367.1; skew-y: 367.1; }
        frame 33 { x: 22.6; y: 30; skew-x: 369.1; skew-y: 369.1; }
        frame 34 { x: 23.5; y: 29.1; skew-x: 370.5; skew-y: 370.5; }
        frame 35 { x: 24.4; y: 28; skew-x: 372; skew-y: 372; scale-x: 0.847; scale-y: 0.847; }
        frame 36 { x: 25.2; y: 27; skew-x: 373.5; skew-y: 373.5; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 26.1; y: 26.1; skew-x: 375; skew-y: 375; }
        frame 38 { x: 26.8; y: 25.1; skew-x: 376.6; skew-y: 376.6; }
        frame 39 { x: 25.6; y: 26.3; skew-x: 376.3; skew-y: 376.3; scale-x: 0.846; scale-y: 0.846; }
        frame 40 { x: 24.3; y: 27.1; skew-x: 376.2; skew-y: 376.2; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 20.9; y: 32.5; skew-x: 366; skew-y: 366; }
        frame 42 { x: 18.1; y: 38.4; skew-x: 356.2; skew-y: 356.2; }
        frame 43 { x: 15.7; y: 44.5; skew-x: 346.1; skew-y: 346.1; }
        frame 44 { x: 14.6; y: 47; skew-x: 343.2; skew-y: 343.2; scale-x: 0.845; scale-y: 0.845; }
        frame 45 { x: 13.6; y: 49.5; skew-x: 340.2; skew-y: 340.2; scale-x: 0.844; scale-y: 0.844; }
        frame 46 { x: 12.6; y: 52; skew-x: 337; skew-y: 337; scale-x: 0.843; scale-y: 0.843; }
        frame 47 { x: 11.6; y: 54.6; skew-x: 334; skew-y: 334; scale-x: 0.844; scale-y: 0.844; }
        frame 48 { x: 12.4; y: 53.5; skew-x: 334.2; skew-y: 334.2; scale-x: 0.843; scale-y: 0.843; }
        frame 49 { x: 13.1; y: 52.4; skew-x: -10000; skew-y: -10000; scale-x: 0.844; scale-y: 0.844; }
        frame 50 { x: 13.9; y: 49.7; skew-x: 338.2; skew-y: 338.2; scale-x: 0.843; scale-y: 0.843; }
        frame 51 { x: 14.7; y: 47; skew-x: 342.2; skew-y: 342.2; scale-x: 0.844; scale-y: 0.844; }
        frame 52 { x: 15.7; y: 44.5; skew-x: 346.1; skew-y: 346.1; scale-x: 0.846; scale-y: 0.846; }
        frame 53 { x: 17.6; y: 40.4; skew-x: 352.2; skew-y: 352.2; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 19.6; y: 36.4; skew-x: 358.5; skew-y: 358.5; }
        frame 55 { x: 21.7; y: 32.6; skew-x: 364.3; skew-y: 364.3; scale-x: 0.847; scale-y: 0.847; }
        frame 56 { x: 24.2; y: 28.8; skew-x: 370.5; skew-y: 370.5; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 26.8; y: 25.1; skew-x: 376.6; skew-y: 376.6; }
        frame 58 { x: 26.2; y: 25.2; skew-x: 376.3; skew-y: 376.3; scale-x: 0.846; scale-y: 0.846; }
        frame 59 { x: 25.6; y: 24.9; skew-x: 376.2; skew-y: 376.2; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 24.5; y: 26.7; skew-x: 373.8; skew-y: 373.8; }
        frame 61 { x: 23.5; y: 28.3; skew-x: 371.3; skew-y: 371.3; scale-x: 0.847; scale-y: 0.847; }
        frame 62 { x: 22.6; y: 30; skew-x: 369.1; skew-y: 369.1; scale-x: 0.848; scale-y: 0.848; }
        frame 63 { x: 20.1; y: 34.6; skew-x: 362.5; skew-y: 362.5; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 17.7; y: 39.4; skew-x: 356.4; skew-y: 356.4; }
        frame 65 { x: 15.5; y: 44.1; skew-x: 350; skew-y: 350; scale-x: 0.847; scale-y: 0.847; }
        frame 66 { x: 13.4; y: 49.2; skew-x: 343.5; skew-y: 343.5; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 13.5; y: 50.4; skew-x: 338.9; skew-y: 338.9; scale-x: 0.844; scale-y: 0.844; }
        frame 68 { x: 13.6; y: 51.5; skew-x: 334.2; skew-y: 334.2; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 13.7; y: 49.2; skew-x: 340.2; skew-y: 340.2; scale-x: 0.845; scale-y: 0.845; }
        frame 70 { x: 13.8; y: 47; skew-x: 346.2; skew-y: 346.2; scale-x: 0.847; scale-y: 0.847; }
        frame 71 { x: 14.3; y: 44.6; skew-x: 351.9; skew-y: 351.9; scale-x: 0.849; scale-y: 0.849; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 16.2; y: 40.4; skew-x: 356.2; skew-y: 356; scale-x: 0.844; scale-y: 0.885; }
        frame 74 { x: 18.5; y: 36.3; skew-x: 360.1; skew-y: 359.7; scale-x: 0.839; scale-y: 0.922; }
        frame 75 { x: 20.6; y: 32.1; skew-x: 364.3; skew-y: 363.5; scale-x: 0.834; scale-y: 0.958; }
        frame 76 { x: 23; y: 28.3; skew-x: 368.5; skew-y: 367.5; scale-x: 0.829; scale-y: 0.995; }
        frame 77 { x: 25.1; y: 26.1; skew-x: 371.3; skew-y: 370; scale-x: 0.823; scale-y: 1.002; }
        frame 78 { x: 27.3; y: 24; skew-x: 374.1; skew-y: 372.8; scale-x: 0.818; scale-y: 1.009; }
        frame 79 { x: 29.4; y: 21.9; skew-x: 377; skew-y: 375.3; scale-x: 0.812; scale-y: 1.016; }
        frame 80 { x: 31.7; y: 20; skew-x: 380; skew-y: 378.1; scale-x: 0.807; scale-y: 1.024; }
        frame 81 { x: 19.5; y: 27.4; skew-x: 369.3; skew-y: 371; scale-x: 0.829; scale-y: 1.003; }
        frame 82 { x: 10.6; y: 38.6; skew-x: 354.5; skew-y: 358; scale-x: 0.84; scale-y: 0.993; }
        frame 83 { x: 2.8; y: 50.3; skew-x: 339.4; skew-y: 344.9; scale-x: 0.851; scale-y: 0.983; }
        frame 84 { x: 1.6; y: 51.9; skew-x: 341.9; skew-y: 346; scale-x: 0.901; scale-y: 0.929; }
        frame 85 { x: 0.2; y: 53.4; skew-x: 344.2; skew-y: 347; scale-x: 0.952; scale-y: 0.875; }
        frame 86 { x: -1.1; y: 54.8; skew-x: 346.7; skew-y: 348; scale-x: 1.003; scale-y: 0.822; }
        frame 87 { x: -2.3; y: 56.1; skew-x: 349; skew-y: 349; scale-x: 1.055; scale-y: 0.769; }
        frame 88 { x: 0.6; y: 58.2; skew-x: 341; skew-y: 341; scale-x: 0.951; scale-y: 0.808; }
        frame 89 { x: 3.7; y: 60; skew-x: 332.9; skew-y: 332.9; scale-x: 0.848; scale-y: 0.848; }
        frame 90 { x: 5.1; y: 55.1; skew-x: 339.4; skew-y: 339.4; scale-x: 0.847; scale-y: 0.847; }
        frame 91 { x: 6.6; y: 50.5; skew-x: 345.7; skew-y: 345.7; scale-x: 0.849; scale-y: 0.849; }
        frame 92 { x: 8.6; y: 49; skew-x: 347.4; skew-y: 347.4; scale-x: 0.848; scale-y: 0.848; }
        frame 93 { x: 10.5; y: 47.5; skew-x: 349; skew-y: 349; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 12.5; y: 46; skew-x: 350.5; skew-y: 350.5; scale-x: 0.849; scale-y: 0.849; }
        frame 95 { x: 14.3; y: 44.6; skew-x: 351.9; skew-y: 351.9; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
        frame 132 { cel: 0; }
        frame 133 { x: 15.2; y: 42.9; skew-x: 354.5; skew-y: 354.5; cel: -10000; }
        frame 134 { x: 16.2; y: 41.1; skew-x: 356.7; skew-y: 356.7; }
        frame 135 { x: 17.2; y: 39.5; skew-x: 359.2; skew-y: 359.2; }
        frame 136 { x: 18.2; y: 37.9; skew-x: 361.5; skew-y: 361.5; }
        frame 137 { x: 19.2; y: 35.9; skew-x: 363.3; skew-y: 363.3; scale-x: 0.848; scale-y: 0.848; }
        frame 138 { x: 20.3; y: 33.9; skew-x: 365.3; skew-y: 365.3; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 21.4; y: 32; skew-x: 367.1; skew-y: 367.1; }
        frame 140 { x: 22.6; y: 30; skew-x: 369.1; skew-y: 369.1; }
        frame 141 { x: 23.5; y: 29.1; skew-x: 370.5; skew-y: 370.5; }
        frame 142 { x: 24.4; y: 28; skew-x: 372; skew-y: 372; scale-x: 0.847; scale-y: 0.847; }
        frame 143 { x: 25.2; y: 27; skew-x: 373.5; skew-y: 373.5; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 26.1; y: 26.1; skew-x: 375; skew-y: 375; }
        frame 145 { x: 26.8; y: 25.1; skew-x: 376.6; skew-y: 376.6; }
        frame 146 { x: 25.6; y: 26.3; skew-x: 376.3; skew-y: 376.3; scale-x: 0.846; scale-y: 0.846; }
        frame 147 { x: 24.3; y: 27.1; skew-x: 376.2; skew-y: 376.2; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 20.9; y: 32.5; skew-x: 366; skew-y: 366; }
        frame 149 { x: 18.1; y: 38.4; skew-x: 356.2; skew-y: 356.2; }
        frame 150 { x: 15.7; y: 44.5; skew-x: 346.1; skew-y: 346.1; }
        frame 151 { x: 14.6; y: 47; skew-x: 343.2; skew-y: 343.2; scale-x: 0.845; scale-y: 0.845; }
        frame 152 { x: 13.6; y: 49.5; skew-x: 340.2; skew-y: 340.2; scale-x: 0.844; scale-y: 0.844; }
        frame 153 { x: 12.6; y: 52; skew-x: 337; skew-y: 337; scale-x: 0.843; scale-y: 0.843; }
        frame 154 { x: 11.6; y: 54.6; skew-x: 334; skew-y: 334; scale-x: 0.844; scale-y: 0.844; }
        frame 155 { x: 12.4; y: 53.5; skew-x: 334.2; skew-y: 334.2; scale-x: 0.843; scale-y: 0.843; }
        frame 156 { x: 13.1; y: 52.4; skew-x: -10000; skew-y: -10000; scale-x: 0.844; scale-y: 0.844; }
        frame 157 { x: 13.9; y: 49.7; skew-x: 338.2; skew-y: 338.2; scale-x: 0.843; scale-y: 0.843; }
        frame 158 { x: 14.7; y: 47; skew-x: 342.2; skew-y: 342.2; scale-x: 0.844; scale-y: 0.844; }
        frame 159 { x: 15.7; y: 44.5; skew-x: 346.1; skew-y: 346.1; scale-x: 0.846; scale-y: 0.846; }
        frame 160 { x: 17.6; y: 40.4; skew-x: 352.2; skew-y: 352.2; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 19.6; y: 36.4; skew-x: 358.5; skew-y: 358.5; }
        frame 162 { x: 21.7; y: 32.6; skew-x: 364.3; skew-y: 364.3; scale-x: 0.847; scale-y: 0.847; }
        frame 163 { x: 24.2; y: 28.8; skew-x: 370.5; skew-y: 370.5; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 26.8; y: 25.1; skew-x: 376.6; skew-y: 376.6; }
        frame 165 { x: 26.2; y: 25.2; skew-x: 376.3; skew-y: 376.3; scale-x: 0.846; scale-y: 0.846; }
        frame 166 { x: 25.6; y: 24.9; skew-x: 376.2; skew-y: 376.2; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 24.5; y: 26.7; skew-x: 373.8; skew-y: 373.8; }
        frame 168 { x: 23.5; y: 28.3; skew-x: 371.3; skew-y: 371.3; scale-x: 0.847; scale-y: 0.847; }
        frame 169 { x: 22.6; y: 30; skew-x: 369.1; skew-y: 369.1; scale-x: 0.848; scale-y: 0.848; }
        frame 170 { x: 20.1; y: 34.6; skew-x: 362.5; skew-y: 362.5; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 17.7; y: 39.4; skew-x: 356.4; skew-y: 356.4; }
        frame 172 { x: 15.5; y: 44.1; skew-x: 350; skew-y: 350; scale-x: 0.847; scale-y: 0.847; }
        frame 173 { x: 13.4; y: 49.2; skew-x: 343.5; skew-y: 343.5; scale-x: -10000; scale-y: -10000; }
        frame 174 { x: 13.5; y: 50.4; skew-x: 338.9; skew-y: 338.9; scale-x: 0.844; scale-y: 0.844; }
        frame 175 { x: 13.6; y: 51.5; skew-x: 334.2; skew-y: 334.2; scale-x: -10000; scale-y: -10000; }
        frame 176 { x: 13.7; y: 49.2; skew-x: 340.2; skew-y: 340.2; scale-x: 0.845; scale-y: 0.845; }
        frame 177 { x: 13.8; y: 47; skew-x: 346.2; skew-y: 346.2; scale-x: 0.847; scale-y: 0.847; }
        frame 178 { x: 14.3; y: 44.6; skew-x: 351.9; skew-y: 351.9; scale-x: 0.849; scale-y: 0.849; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 16.2; y: 40.4; skew-x: 356.2; skew-y: 356; scale-x: 0.844; scale-y: 0.885; }
        frame 181 { x: 18.5; y: 36.3; skew-x: 360.1; skew-y: 359.7; scale-x: 0.839; scale-y: 0.922; }
        frame 182 { x: 20.6; y: 32.1; skew-x: 364.3; skew-y: 363.5; scale-x: 0.834; scale-y: 0.958; }
        frame 183 { x: 23; y: 28.3; skew-x: 368.5; skew-y: 367.5; scale-x: 0.829; scale-y: 0.995; }
        frame 184 { x: 25.1; y: 26.1; skew-x: 371.3; skew-y: 370; scale-x: 0.823; scale-y: 1.002; }
        frame 185 { x: 27.3; y: 24; skew-x: 374.1; skew-y: 372.8; scale-x: 0.818; scale-y: 1.009; }
        frame 186 { x: 29.4; y: 21.9; skew-x: 377; skew-y: 375.3; scale-x: 0.812; scale-y: 1.016; }
        frame 187 { x: 31.7; y: 20; skew-x: 380; skew-y: 378.1; scale-x: 0.807; scale-y: 1.024; }
        frame 188 { x: 19.5; y: 27.4; skew-x: 369.3; skew-y: 371; scale-x: 0.829; scale-y: 1.003; }
        frame 189 { x: 10.6; y: 38.6; skew-x: 354.5; skew-y: 358; scale-x: 0.84; scale-y: 0.993; }
        frame 190 { x: 2.8; y: 50.3; skew-x: 339.4; skew-y: 344.9; scale-x: 0.851; scale-y: 0.983; }
        frame 191 { x: 1.6; y: 51.9; skew-x: 341.9; skew-y: 346; scale-x: 0.901; scale-y: 0.929; }
        frame 192 { x: 0.2; y: 53.4; skew-x: 344.2; skew-y: 347; scale-x: 0.952; scale-y: 0.875; }
        frame 193 { x: -1.1; y: 54.8; skew-x: 346.7; skew-y: 348; scale-x: 1.003; scale-y: 0.822; }
        frame 194 { x: -2.3; y: 56.1; skew-x: 349; skew-y: 349; scale-x: 1.055; scale-y: 0.769; }
        frame 195 { x: 0.6; y: 58.2; skew-x: 341; skew-y: 341; scale-x: 0.951; scale-y: 0.808; }
        frame 196 { x: 3.7; y: 60; skew-x: 332.9; skew-y: 332.9; scale-x: 0.848; scale-y: 0.848; }
        frame 197 { x: 5.1; y: 55.1; skew-x: 339.4; skew-y: 339.4; scale-x: 0.847; scale-y: 0.847; }
        frame 198 { x: 6.6; y: 50.5; skew-x: 345.7; skew-y: 345.7; scale-x: 0.849; scale-y: 0.849; }
        frame 199 { x: 8.6; y: 49; skew-x: 347.4; skew-y: 347.4; scale-x: 0.848; scale-y: 0.848; }
        frame 200 { x: 10.5; y: 47.5; skew-x: 349; skew-y: 349; scale-x: -10000; scale-y: -10000; }
        frame 201 { x: 12.5; y: 46; skew-x: 350.5; skew-y: 350.5; scale-x: 0.849; scale-y: 0.849; }
        frame 202 { x: 14.3; y: 44.6; skew-x: 351.9; skew-y: 351.9; scale-x: -10000; scale-y: -10000; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 204 { x: 17; y: 40.8; skew-x: 356.7; skew-y: 356.7; scale-y: 0.87; }
        frame 205 { x: 19.8; y: 37; skew-x: 361; skew-y: 361; scale-y: 0.89; }
        frame 206 { x: 22.8; y: 33.5; skew-x: 365.8; skew-y: 365.8; scale-x: 0.848; scale-y: 0.911; }
        frame 207 { x: 26; y: 30; skew-x: 370.3; skew-y: 370.3; scale-x: -10000; scale-y: 0.931; }
        frame 208 { x: 29.3; y: 26.5; skew-x: 375; skew-y: 375; scale-x: 0.847; scale-y: 0.951; }
        frame 209 { x: 32.6; y: 23; skew-x: 379.7; skew-y: 379.7; scale-x: 0.848; scale-y: 0.973; }
        frame 210 { x: 27.8; y: 27.2; skew-x: 374.3; skew-y: 374.3; scale-x: 0.847; scale-y: 0.972; }
        frame 211 { x: 23; y: 31.4; skew-x: 369; skew-y: 369; scale-x: -10000; scale-y: -10000; }
        frame 212 { x: 18.3; y: 35.8; skew-x: 363.5; skew-y: 363.5; }
        frame 213 { x: 13.8; y: 40.2; skew-x: 358.3; skew-y: 358.3; }
        frame 214 { x: 10.2; y: 45.8; skew-x: 353.2; skew-y: 353; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 215;
        frame 0 { x: 0.1; y: 10.6; skew-x: 351.9; skew-y: 351.9; scale-x: 0.849; scale-y: 0.849; image: IMAGE_REANIM_ZOMBIE_LADDER_HEAD; }
        frame 1 { x: 1.3; y: 9.4; skew-x: 353.4; skew-y: 353.4; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 2.4; y: 8.2; skew-x: 354.7; skew-y: 354.7; }
        frame 3 { x: 3.5; y: 7; skew-x: 356; skew-y: 356; }
        frame 4 { x: 4.8; y: 5.8; skew-x: 357.5; skew-y: 357.5; scale-x: 0.85; scale-y: 0.85; }
        frame 5 { x: 5.9; y: 4.6; skew-x: 358.7; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 7.1; y: 3.4; skew-x: 360; skew-y: 360; }
        frame 7 { x: -10000; y: 3.3; skew-x: 360.5; skew-y: 360.5; }
        frame 8 { x: 7; y: 3.1; skew-x: 361; skew-y: 361; scale-x: 0.849; scale-y: 0.849; }
        frame 9 { x: 5.2; y: 4.8; skew-x: 358.7; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 3.5; y: 6.7; skew-x: 356.5; skew-y: 356.5; }
        frame 11 { x: 1.8; y: 8.7; skew-x: 354.2; skew-y: 354.2; }
        frame 12 { x: 0.1; y: 10.6; skew-x: 351.9; skew-y: 351.9; }
        frame 13 { x: -0.7; y: 11.7; skew-x: 350.9; skew-y: 350.9; }
        frame 14 { x: -1.6; y: 12.7; skew-x: 349.7; skew-y: 349.7; }
        frame 15 { x: -2.4; y: 13.7; skew-x: 348.7; skew-y: 348.7; }
        frame 16 { x: -3.4; y: 14.9; skew-x: 347.5; skew-y: 347.5; }
        frame 17 { x: -4.3; y: 15.9; skew-x: 346.4; skew-y: 346.4; }
        frame 18 { x: -5.2; y: 16.9; skew-x: 345.2; skew-y: 345.2; }
        frame 19 { x: -10000; y: -10000; skew-x: 344.7; skew-y: 344.7; scale-x: 0.848; scale-y: 0.848; }
        frame 20 { x: -5.3; y: 17; skew-x: 344; skew-y: 344; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -4; y: 15.4; skew-x: 346; skew-y: 346; }
        frame 22 { x: -2.7; y: 13.8; skew-x: 348; skew-y: 348; }
        frame 23 { x: -1.3; y: 12.2; skew-x: 350; skew-y: 350; scale-x: 0.849; scale-y: 0.849; }
        frame 24 { x: 0.1; y: 10.6; skew-x: 351.9; skew-y: 351.9; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 2.5; y: 8.6; skew-x: 354.5; skew-y: 354.5; }
        frame 27 { x: 4.9; y: 6.5; skew-x: 356.7; skew-y: 356.7; }
        frame 28 { x: 7.3; y: 4.4; skew-x: 359.2; skew-y: 359.2; }
        frame 29 { x: 9.8; y: 2.4; skew-x: 361.5; skew-y: 361.5; }
        frame 30 { x: 12; y: 0.2; skew-x: 363.3; skew-y: 363.3; scale-x: 0.848; scale-y: 0.848; }
        frame 31 { x: 14.4; y: -1.8; skew-x: 365.3; skew-y: 365.3; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 16.7; y: -4.1; skew-x: 367.1; skew-y: 367.1; }
        frame 33 { x: 18.9; y: -6.3; skew-x: 369.1; skew-y: 369.1; }
        frame 34 { x: 21.6; y: -7.6; skew-x: 371.8; skew-y: 371.8; }
        frame 35 { x: 24.5; y: -9; skew-x: 374.6; skew-y: 374.6; scale-x: 0.847; scale-y: 0.847; }
        frame 36 { x: 27.4; y: -10.3; skew-x: 377.5; skew-y: 377.5; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 30.3; y: -11.5; skew-x: 380.3; skew-y: 380.3; }
        frame 38 { x: 33.2; y: -12.7; skew-x: 383.1; skew-y: 383.1; scale-x: 0.848; scale-y: 0.848; }
        frame 39 { x: 30.8; y: -11.3; skew-x: 381.6; skew-y: 381.6; scale-x: 0.846; scale-y: 0.846; }
        frame 40 { x: 28.4; y: -9.8; skew-x: 380.1; skew-y: 380.1; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 19.1; y: -4.3; skew-x: 370.8; skew-y: 370.8; }
        frame 42 { x: 10; y: 1.8; skew-x: 361.6; skew-y: 361.6; }
        frame 43 { x: 2; y: 8.5; skew-x: 352.6; skew-y: 352.6; }
        frame 44 { x: -0.7; y: 11.9; skew-x: 349.7; skew-y: 349.7; scale-x: 0.845; scale-y: 0.845; }
        frame 45 { x: -3.6; y: 15.5; skew-x: 346.7; skew-y: 346.7; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: -6.3; y: 19; skew-x: 343.7; skew-y: 343.7; scale-x: 0.844; scale-y: 0.844; }
        frame 47 { x: -9; y: 22.6; skew-x: 340.5; skew-y: 340.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: -8.1; y: 21.3; skew-x: 340.7; skew-y: 340.7; scale-x: 0.843; scale-y: 0.843; }
        frame 49 { x: -7.3; y: 20; skew-x: -10000; skew-y: -10000; scale-x: 0.844; scale-y: 0.844; }
        frame 50 { x: -4.4; y: 16; skew-x: 344.7; skew-y: 344.7; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: -1.1; y: 12.3; skew-x: 348.7; skew-y: 348.7; scale-x: 0.845; scale-y: 0.845; }
        frame 52 { x: 2; y: 8.5; skew-x: 352.6; skew-y: 352.6; scale-x: 0.846; scale-y: 0.846; }
        frame 53 { x: 7.7; y: 3.6; skew-x: 358.7; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 13.8; y: -0.8; skew-x: 364.8; skew-y: 364.8; scale-x: 0.847; scale-y: 0.847; }
        frame 55 { x: 20; y: -5.1; skew-x: 370.8; skew-y: 370.8; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 26.5; y: -9.1; skew-x: 377; skew-y: 377; }
        frame 57 { x: 33.2; y: -12.7; skew-x: 383.1; skew-y: 383.1; scale-x: 0.848; scale-y: 0.848; }
        frame 58 { x: 31.1; y: -11.7; skew-x: 381.6; skew-y: 381.6; scale-x: 0.846; scale-y: 0.846; }
        frame 59 { x: 29; y: -10.6; skew-x: 380.1; skew-y: 380.1; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 25.6; y: -9.2; skew-x: 376.3; skew-y: 376.3; }
        frame 61 { x: 22.1; y: -7.7; skew-x: 372.6; skew-y: 372.6; scale-x: 0.847; scale-y: 0.847; }
        frame 62 { x: 18.9; y: -6.3; skew-x: 369.1; skew-y: 369.1; scale-x: 0.848; scale-y: 0.848; }
        frame 63 { x: 12.2; y: -0.6; skew-x: 362.5; skew-y: 362.5; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 6.1; y: 5.2; skew-x: 356.4; skew-y: 356.4; }
        frame 65 { x: 0.1; y: 11.4; skew-x: 350; skew-y: 350; scale-x: 0.847; scale-y: 0.847; }
        frame 66 { x: -5.4; y: 18.1; skew-x: 343.5; skew-y: 343.5; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: -5.8; y: 18.9; skew-x: 342.2; skew-y: 342.2; scale-x: 0.845; scale-y: 0.845; }
        frame 68 { x: -6.3; y: 19.6; skew-x: 340.7; skew-y: 340.7; scale-x: 0.844; scale-y: 0.844; }
        frame 69 { x: -4.3; y: 16.5; skew-x: 344.5; skew-y: 344.5; scale-x: 0.845; scale-y: 0.845; }
        frame 70 { x: -2.1; y: 13.4; skew-x: 348.2; skew-y: 348.2; scale-x: 0.847; scale-y: 0.847; }
        frame 71 { x: 0.1; y: 10.6; skew-x: 351.9; skew-y: 351.9; scale-x: 0.849; scale-y: 0.849; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 5.4; y: 5; skew-x: 357.5; skew-y: 357.2; scale-x: 0.844; scale-y: 0.856; }
        frame 74 { x: 10.8; y: -0.4; skew-x: 363; skew-y: 362.1; scale-x: 0.838; scale-y: 0.862; }
        frame 75 { x: 16.6; y: -5.6; skew-x: 368.5; skew-y: 367.3; scale-x: 0.833; scale-y: 0.868; }
        frame 76 { x: 22.7; y: -10.7; skew-x: 374.1; skew-y: 372.5; scale-x: 0.828; scale-y: 0.875; }
        frame 77 { x: 27.7; y: -13.3; skew-x: 377.8; skew-y: 376; scale-x: 0.822; scale-y: 0.881; }
        frame 78 { x: 32.8; y: -16; skew-x: 381.8; skew-y: 379.5; scale-x: 0.817; scale-y: 0.887; }
        frame 79 { x: 37.9; y: -18.4; skew-x: 385.8; skew-y: 383; scale-x: 0.812; scale-y: 0.893; }
        frame 80 { x: 43; y: -20.8; skew-x: 389.7; skew-y: 386.6; scale-x: 0.808; scale-y: 0.9; }
        frame 81 { x: 25.7; y: -13.6; skew-x: 380.6; skew-y: 379.1; scale-x: 0.797; scale-y: 0.923; }
        frame 82 { x: 5.3; y: -1.9; skew-x: 364.3; skew-y: 363.5; scale-x: 0.792; scale-y: 0.935; }
        frame 83 { x: -13.5; y: 12.1; skew-x: 348.1; skew-y: 348.1; scale-x: 0.788; scale-y: 0.948; }
        frame 84 { x: -15; y: 17.2; skew-x: 346.5; skew-y: 346.5; scale-x: 0.803; scale-y: 0.907; }
        frame 85 { x: -16.3; y: 22.2; skew-x: 344.7; skew-y: 344.7; scale-x: 0.818; scale-y: 0.866; }
        frame 86 { x: -17.5; y: 27.3; skew-x: 342.9; skew-y: 342.9; scale-x: 0.834; scale-y: 0.826; }
        frame 87 { x: -19; y: 32.3; skew-x: 341; skew-y: 341; scale-x: 0.85; scale-y: 0.786; }
        frame 88 { x: -19.5; y: 32.8; skew-x: 336.7; skew-y: 336.7; scale-x: 0.848; scale-y: 0.81; }
        frame 89 { x: -20.4; y: 33.6; skew-x: 332.4; skew-y: 332.4; scale-x: -10000; scale-y: 0.836; }
        frame 90 { x: -16.3; y: 26.8; skew-x: 339; skew-y: 339; scale-y: 0.837; }
        frame 91 { x: -11.8; y: 20.2; skew-x: 345.5; skew-y: 345.5; scale-x: 0.849; scale-y: 0.84; }
        frame 92 { x: -8.8; y: 17.7; skew-x: 347.2; skew-y: 347.2; scale-x: 0.848; scale-y: 0.842; }
        frame 93 { x: -5.9; y: 15.2; skew-x: 348.7; skew-y: 348.7; scale-x: 0.849; scale-y: 0.844; }
        frame 94 { x: -3; y: 12.8; skew-x: 350.4; skew-y: 350.4; scale-x: -10000; scale-y: 0.846; }
        frame 95 { x: 0.1; y: 10.6; skew-x: 351.9; skew-y: 351.9; scale-y: 0.849; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
        frame 132 { cel: 0; }
        frame 133 { x: 2.5; y: 8.6; skew-x: 354.5; skew-y: 354.5; cel: -10000; }
        frame 134 { x: 4.9; y: 6.5; skew-x: 356.7; skew-y: 356.7; }
        frame 135 { x: 7.3; y: 4.4; skew-x: 359.2; skew-y: 359.2; }
        frame 136 { x: 9.8; y: 2.4; skew-x: 361.5; skew-y: 361.5; }
        frame 137 { x: 12; y: 0.2; skew-x: 363.3; skew-y: 363.3; scale-x: 0.848; scale-y: 0.848; }
        frame 138 { x: 14.4; y: -1.8; skew-x: 365.3; skew-y: 365.3; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 16.7; y: -4.1; skew-x: 367.1; skew-y: 367.1; }
        frame 140 { x: 18.9; y: -6.3; skew-x: 369.1; skew-y: 369.1; }
        frame 141 { x: 21.6; y: -7.6; skew-x: 371.8; skew-y: 371.8; }
        frame 142 { x: 24.5; y: -9; skew-x: 374.6; skew-y: 374.6; scale-x: 0.847; scale-y: 0.847; }
        frame 143 { x: 27.4; y: -10.3; skew-x: 377.5; skew-y: 377.5; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 30.3; y: -11.5; skew-x: 380.3; skew-y: 380.3; }
        frame 145 { x: 33.2; y: -12.7; skew-x: 383.1; skew-y: 383.1; scale-x: 0.848; scale-y: 0.848; }
        frame 146 { x: 30.8; y: -11.3; skew-x: 381.6; skew-y: 381.6; scale-x: 0.846; scale-y: 0.846; }
        frame 147 { x: 28.4; y: -9.8; skew-x: 380.1; skew-y: 380.1; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 19.1; y: -4.3; skew-x: 370.8; skew-y: 370.8; }
        frame 149 { x: 10; y: 1.8; skew-x: 361.6; skew-y: 361.6; }
        frame 150 { x: 2; y: 8.5; skew-x: 352.6; skew-y: 352.6; }
        frame 151 { x: -0.7; y: 11.9; skew-x: 349.7; skew-y: 349.7; scale-x: 0.845; scale-y: 0.845; }
        frame 152 { x: -3.6; y: 15.5; skew-x: 346.7; skew-y: 346.7; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: -6.3; y: 19; skew-x: 343.7; skew-y: 343.7; scale-x: 0.844; scale-y: 0.844; }
        frame 154 { x: -9; y: 22.6; skew-x: 340.5; skew-y: 340.5; scale-x: -10000; scale-y: -10000; }
        frame 155 { x: -8.1; y: 21.3; skew-x: 340.7; skew-y: 340.7; scale-x: 0.843; scale-y: 0.843; }
        frame 156 { x: -7.3; y: 20; skew-x: -10000; skew-y: -10000; scale-x: 0.844; scale-y: 0.844; }
        frame 157 { x: -4.4; y: 16; skew-x: 344.7; skew-y: 344.7; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: -1.1; y: 12.3; skew-x: 348.7; skew-y: 348.7; scale-x: 0.845; scale-y: 0.845; }
        frame 159 { x: 2; y: 8.5; skew-x: 352.6; skew-y: 352.6; scale-x: 0.846; scale-y: 0.846; }
        frame 160 { x: 7.7; y: 3.6; skew-x: 358.7; skew-y: 358.7; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 13.8; y: -0.8; skew-x: 364.8; skew-y: 364.8; scale-x: 0.847; scale-y: 0.847; }
        frame 162 { x: 20; y: -5.1; skew-x: 370.8; skew-y: 370.8; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 26.5; y: -9.1; skew-x: 377; skew-y: 377; }
        frame 164 { x: 33.2; y: -12.7; skew-x: 383.1; skew-y: 383.1; scale-x: 0.848; scale-y: 0.848; }
        frame 165 { x: 31.1; y: -11.7; skew-x: 381.6; skew-y: 381.6; scale-x: 0.846; scale-y: 0.846; }
        frame 166 { x: 29; y: -10.6; skew-x: 380.1; skew-y: 380.1; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 25.6; y: -9.2; skew-x: 376.3; skew-y: 376.3; }
        frame 168 { x: 22.1; y: -7.7; skew-x: 372.6; skew-y: 372.6; scale-x: 0.847; scale-y: 0.847; }
        frame 169 { x: 18.9; y: -6.3; skew-x: 369.1; skew-y: 369.1; scale-x: 0.848; scale-y: 0.848; }
        frame 170 { x: 12.2; y: -0.6; skew-x: 362.5; skew-y: 362.5; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 6.1; y: 5.2; skew-x: 356.4; skew-y: 356.4; }
        frame 172 { x: 0.1; y: 11.4; skew-x: 350; skew-y: 350; scale-x: 0.847; scale-y: 0.847; }
        frame 173 { x: -5.4; y: 18.1; skew-x: 343.5; skew-y: 343.5; scale-x: -10000; scale-y: -10000; }
        frame 174 { x: -5.8; y: 18.9; skew-x: 342.2; skew-y: 342.2; scale-x: 0.845; scale-y: 0.845; }
        frame 175 { x: -6.3; y: 19.6; skew-x: 340.7; skew-y: 340.7; scale-x: 0.844; scale-y: 0.844; }
        frame 176 { x: -4.3; y: 16.5; skew-x: 344.5; skew-y: 344.5; scale-x: 0.845; scale-y: 0.845; }
        frame 177 { x: -2.1; y: 13.4; skew-x: 348.2; skew-y: 348.2; scale-x: 0.847; scale-y: 0.847; }
        frame 178 { x: 0.1; y: 10.6; skew-x: 351.9; skew-y: 351.9; scale-x: 0.849; scale-y: 0.849; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 5.4; y: 5; skew-x: 357.5; skew-y: 357.2; scale-x: 0.844; scale-y: 0.856; }
        frame 181 { x: 10.8; y: -0.4; skew-x: 363; skew-y: 362.1; scale-x: 0.838; scale-y: 0.862; }
        frame 182 { x: 16.6; y: -5.6; skew-x: 368.5; skew-y: 367.3; scale-x: 0.833; scale-y: 0.868; }
        frame 183 { x: 22.7; y: -10.7; skew-x: 374.1; skew-y: 372.5; scale-x: 0.828; scale-y: 0.875; }
        frame 184 { x: 27.7; y: -13.3; skew-x: 377.8; skew-y: 376; scale-x: 0.822; scale-y: 0.881; }
        frame 185 { x: 32.8; y: -16; skew-x: 381.8; skew-y: 379.5; scale-x: 0.817; scale-y: 0.887; }
        frame 186 { x: 37.9; y: -18.4; skew-x: 385.8; skew-y: 383; scale-x: 0.812; scale-y: 0.893; }
        frame 187 { x: 43; y: -20.8; skew-x: 389.7; skew-y: 386.6; scale-x: 0.808; scale-y: 0.9; }
        frame 188 { x: 25.7; y: -13.6; skew-x: 380.6; skew-y: 379.1; scale-x: 0.797; scale-y: 0.923; }
        frame 189 { x: 5.3; y: -1.9; skew-x: 364.3; skew-y: 363.5; scale-x: 0.792; scale-y: 0.935; }
        frame 190 { x: -13.5; y: 12.1; skew-x: 348.1; skew-y: 348.1; scale-x: 0.788; scale-y: 0.948; }
        frame 191 { x: -15; y: 17.2; skew-x: 346.5; skew-y: 346.5; scale-x: 0.803; scale-y: 0.907; }
        frame 192 { x: -16.3; y: 22.2; skew-x: 344.7; skew-y: 344.7; scale-x: 0.818; scale-y: 0.866; }
        frame 193 { x: -17.5; y: 27.3; skew-x: 342.9; skew-y: 342.9; scale-x: 0.834; scale-y: 0.826; }
        frame 194 { x: -19; y: 32.3; skew-x: 341; skew-y: 341; scale-x: 0.85; scale-y: 0.786; }
        frame 195 { x: -19.5; y: 32.8; skew-x: 336.7; skew-y: 336.7; scale-x: 0.848; scale-y: 0.81; }
        frame 196 { x: -20.4; y: 33.6; skew-x: 332.4; skew-y: 332.4; scale-x: -10000; scale-y: 0.836; }
        frame 197 { x: -16.3; y: 26.8; skew-x: 339; skew-y: 339; scale-y: 0.837; }
        frame 198 { x: -11.8; y: 20.2; skew-x: 345.5; skew-y: 345.5; scale-x: 0.849; scale-y: 0.84; }
        frame 199 { x: -8.8; y: 17.7; skew-x: 347.2; skew-y: 347.2; scale-x: 0.848; scale-y: 0.842; }
        frame 200 { x: -5.9; y: 15.2; skew-x: 348.7; skew-y: 348.7; scale-x: 0.849; scale-y: 0.844; }
        frame 201 { x: -3; y: 12.8; skew-x: 350.4; skew-y: 350.4; scale-x: -10000; scale-y: 0.846; }
        frame 202 { x: 0.1; y: 10.6; skew-x: 351.9; skew-y: 351.9; scale-y: 0.849; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 204 { x: 5.7; y: 5.8; skew-x: 356.7; skew-y: 356.7; }
        frame 205 { x: 11.1; y: 1.2; skew-x: 361; skew-y: 361; }
        frame 206 { x: 17.1; y: -3.2; skew-x: 365.8; skew-y: 365.8; scale-x: 0.848; scale-y: 0.848; }
        frame 207 { x: 23; y: -7.5; skew-x: 370.3; skew-y: 370.3; scale-x: -10000; scale-y: -10000; }
        frame 208 { x: 29.1; y: -11.6; skew-x: 375; skew-y: 375; scale-x: 0.847; scale-y: 0.847; }
        frame 209 { x: 35.4; y: -15.5; skew-x: 379.7; skew-y: 379.7; scale-x: 0.848; scale-y: 0.848; }
        frame 210 { x: 25.3; y: -9.4; skew-x: 372; skew-y: 372; scale-x: 0.847; scale-y: 0.847; }
        frame 211 { x: 15.7; y: -2.7; skew-x: 364.5; skew-y: 364.5; scale-x: -10000; scale-y: -10000; }
        frame 212 { x: 6.3; y: 4.2; skew-x: 357.2; skew-y: 357.2; }
        frame 213 { x: -2.3; y: 11.7; skew-x: 349.6; skew-y: 349.6; scale-x: 0.846; scale-y: 0.846; }
        frame 214 { x: -8.5; y: 18.9; skew-x: 344.4; skew-y: 344.3; scale-x: -10000; scale-y: 0.847; }
    }
    Track {
        source-name: "Zombie_ladder_1";
        frame-count: 215;
        frame 0 { x: -10.3; y: 30.4; scale-x: 0.85; scale-y: 0.85; image: IMAGE_REANIM_ZOMBIE_LADDER_1; }
        frame 1 { x: -9.8; y: 29.7; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -9.2; y: 29; }
        frame 3 { x: -8.7; y: 28.3; }
        frame 4 { x: -8.2; y: 27.5; }
        frame 5 { x: -7.6; y: 26.8; }
        frame 6 { x: -7.1; y: 26.1; }
        frame 7 { x: -7.8; y: 27; }
        frame 8 { x: -8.6; y: 27.9; }
        frame 9 { x: -9.3; y: 28.8; }
        frame 10 { x: -10.1; y: 29.6; }
        frame 11 { x: -10.8; y: 30.5; }
        frame 12 { x: -11.6; y: 31.4; }
        frame 13 { x: -12.5; y: 32.5; skew-x: -1.2; skew-y: -1.2; }
        frame 14 { x: -13.4; y: 33.8; skew-x: -2.5; skew-y: -2.5; }
        frame 15 { x: -14.4; y: 35; skew-x: -3.9; skew-y: -3.9; }
        frame 16 { x: -15.3; y: 36.4; skew-x: -5.2; skew-y: -5.2; scale-x: 0.849; scale-y: 0.849; }
        frame 17 { x: -16.2; y: 37.6; skew-x: -6.7; skew-y: -6.7; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -17.2; y: 39.1; skew-x: -8; skew-y: -8; scale-x: 0.85; scale-y: 0.85; }
        frame 19 { x: -16.1; y: 37.7; skew-x: -6.7; skew-y: -6.7; scale-x: 0.849; scale-y: 0.849; }
        frame 20 { x: -14.9; y: 36.1; skew-x: -5.2; skew-y: -5.2; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -13.8; y: 34.6; skew-x: -3.9; skew-y: -3.9; scale-x: 0.85; scale-y: 0.85; }
        frame 22 { x: -12.5; y: 33.1; skew-x: -2.5; skew-y: -2.5; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -11.5; y: 31.9; skew-x: -1.2; skew-y: -1.2; }
        frame 24 { x: -10.3; y: 30.4; skew-x: 0; skew-y: 0; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: -9.7; y: 29.9; }
        frame 27 { x: -9.1; y: 29.4; }
        frame 28 { x: -8.4; y: 28.9; }
        frame 29 { x: -7.8; y: 28.4; }
        frame 30 { x: -9.3; y: 29.2; skew-x: -1.7; skew-y: -1.7; }
        frame 31 { x: -10.8; y: 30.3; skew-x: -3.7; skew-y: -3.7; }
        frame 32 { x: -12.2; y: 31.2; skew-x: -5.5; skew-y: -5.5; scale-x: 0.849; scale-y: 0.849; }
        frame 33 { x: -13.8; y: 32.4; skew-x: -7.5; skew-y: -7.5; scale-x: 0.85; scale-y: 0.85; }
        frame 34 { x: -15; y: 34.4; skew-x: -9.4; skew-y: -9.4; scale-x: 0.849; scale-y: 0.849; }
        frame 35 { x: -16; y: 36.2; skew-x: -11.2; skew-y: -11.2; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -17.2; y: 38.2; skew-x: -13.2; skew-y: -13.2; }
        frame 37 { x: -18.3; y: 40.4; skew-x: -15.2; skew-y: -15.2; }
        frame 38 { x: -19.3; y: 42.5; skew-x: -17.1; skew-y: -17.1; }
        frame 39 { x: -20.3; y: 41.2; skew-x: -16.2; skew-y: -16.2; scale-x: 0.848; scale-y: 0.848; }
        frame 40 { x: -21.2; y: 40; skew-x: -15.2; skew-y: -15.2; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: -22.3; y: 38.8; skew-x: -14.4; skew-y: -14.4; }
        frame 42 { x: -23.4; y: 37.6; skew-x: -13.7; skew-y: -13.7; }
        frame 43 { x: -24.4; y: 36.4; skew-x: -12.8; skew-y: -12.8; scale-x: 0.849; scale-y: 0.849; }
        frame 44 { x: -25.6; y: 38.4; skew-x: -12.7; skew-y: -12.7; scale-x: 0.848; scale-y: 0.848; }
        frame 45 { x: -27; y: 40.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: -28.3; y: 42.4; }
        frame 47 { x: -29.9; y: 44.4; skew-x: -12.8; skew-y: -12.8; scale-x: 0.849; scale-y: 0.849; }
        frame 48 { x: -29.1; y: 43; skew-x: -12.7; skew-y: -12.7; scale-x: 0.848; scale-y: 0.848; }
        frame 49 { x: -28.3; y: 41.6; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: -27.7; y: 40.4; }
        frame 51 { x: -27; y: 39; }
        frame 52 { x: -26.4; y: 37.6; }
        frame 53 { x: -24.9; y: 37.3; }
        frame 54 { x: -23.5; y: 36.9; }
        frame 55 { x: -22; y: 36.3; }
        frame 56 { x: -20.5; y: 35.8; }
        frame 57 { x: -19.1; y: 35.4; skew-x: -12.8; skew-y: -12.8; scale-x: 0.849; scale-y: 0.849; }
        frame 58 { x: -18.2; y: 34.1; skew-x: -11.2; skew-y: -11.2; scale-x: 0.848; scale-y: 0.848; }
        frame 59 { x: -17.1; y: 32.9; skew-x: -9.5; skew-y: -9.5; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: -16.1; y: 31.7; skew-x: -7.9; skew-y: -7.9; }
        frame 61 { x: -15; y: 30.5; skew-x: -6.2; skew-y: -6.2; }
        frame 62 { x: -14.1; y: 29.4; skew-x: -4.7; skew-y: -4.7; scale-x: 0.849; scale-y: 0.849; }
        frame 63 { x: -14.5; y: 33; skew-x: -6.5; skew-y: -6.5; scale-x: 0.848; scale-y: 0.848; }
        frame 64 { x: -15.2; y: 36.9; skew-x: -8.4; skew-y: -8.4; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -15.6; y: 40.6; skew-x: -10.2; skew-y: -10.2; }
        frame 66 { x: -16.2; y: 44.5; skew-x: -12.3; skew-y: -12.3; }
        frame 67 { x: -15.1; y: 41.5; skew-x: -9.7; skew-y: -9.7; }
        frame 68 { x: -14; y: 38.6; skew-x: -7.2; skew-y: -7.2; scale-x: 0.849; scale-y: 0.849; }
        frame 69 { x: -12.8; y: 35.7; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: -11.6; y: 33; skew-x: -2.2; skew-y: -2.2; scale-x: 0.85; scale-y: 0.85; }
        frame 71 { x: -10.3; y: 30.4; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: -7; y: 25.9; skew-x: 2; skew-y: 2; }
        frame 74 { x: -3.7; y: 21.5; skew-x: 4; skew-y: 4; }
        frame 75 { x: -0.3; y: 17.2; skew-x: 6; skew-y: 6; scale-x: 0.849; scale-y: 0.849; }
        frame 76 { x: 2.9; y: 12.9; skew-x: 8.1; skew-y: 8.1; scale-x: 0.85; scale-y: 0.85; }
        frame 77 { x: 4.6; y: 10.1; skew-x: 6.5; skew-y: 6.5; scale-x: 0.849; scale-y: 0.849; }
        frame 78 { x: 6.5; y: 7.2; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 8.2; y: 4.2; skew-x: 3.8; skew-y: 3.8; }
        frame 80 { x: 10.1; y: 1.3; skew-x: 2.5; skew-y: 2.5; }
        frame 81 { x: -2.3; y: 24.2; skew-x: -10.9; skew-y: -10.9; scale-x: 0.848; scale-y: 0.848; }
        frame 82 { x: -13.1; y: 49.5; skew-x: -24.5; skew-y: -24.5; scale-x: 0.847; scale-y: 0.847; }
        frame 83 { x: -21.5; y: 76.5; skew-x: -38; skew-y: -38; scale-x: 0.848; scale-y: 0.848; }
        frame 84 { x: -10000; y: 78; skew-x: -39.3; skew-y: -39.3; scale-x: 0.847; scale-y: 0.847; }
        frame 85 { x: -21.6; y: 79.4; skew-x: -40.5; skew-y: -40.5; scale-x: 0.846; scale-y: 0.846; }
        frame 86 { x: -21.7; y: 81; skew-x: -41.8; skew-y: -41.8; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -21.9; y: 82.4; skew-x: -43; skew-y: -43; scale-x: 0.848; scale-y: 0.848; }
        frame 88 { x: -21.8; y: 78.1; skew-x: -40; skew-y: -40; scale-x: 0.846; scale-y: 0.846; }
        frame 89 { x: -21.6; y: 73.8; skew-x: -37; skew-y: -37; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: -21.4; y: 69.7; skew-x: -34.2; skew-y: -34.2; }
        frame 91 { x: -21.1; y: 65.3; skew-x: -31.2; skew-y: -31.2; scale-x: 0.847; scale-y: 0.847; }
        frame 92 { x: -19.5; y: 55.5; skew-x: -23.4; skew-y: -23.4; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -17; y: 46.4; skew-x: -15.5; skew-y: -15.5; scale-x: 0.848; scale-y: 0.848; }
        frame 94 { x: -14; y: 37.9; skew-x: -7.7; skew-y: -7.7; scale-x: 0.849; scale-y: 0.849; }
        frame 95 { x: -10.3; y: 30.4; skew-x: 0; skew-y: 0; scale-x: 0.85; scale-y: 0.85; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
        frame 203 { cel: 0; }
        frame 204 { x: -1.9; y: 17.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.849; scale-y: 0.849; cel: -10000; }
        frame 205 { x: 7.1; y: 5.6; skew-x: 18.8; skew-y: 18.8; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 16.5; y: -4.5; skew-x: 28.3; skew-y: 28.3; scale-x: 0.848; scale-y: 0.848; }
        frame 207 { x: 25.8; y: -13.3; skew-x: 37.8; skew-y: 37.8; scale-x: -10000; scale-y: -10000; }
        frame 208 { x: 35; y: -20.7; skew-x: 47.4; skew-y: 47.4; scale-x: 0.847; scale-y: 0.847; }
        frame 209 { x: 43.4; y: -26.8; skew-x: 56.7; skew-y: 56.7; scale-x: 0.848; scale-y: 0.848; }
        frame 210 { x: 22.3; y: -18; skew-x: 43.1; skew-y: 43.1; scale-x: 0.798; scale-y: 0.838; image: IMAGE_REANIM_ZOMBIE_LADDER_2; }
        frame 211 { x: 7.2; y: -10.5; skew-x: 36.4; skew-y: 36.4; scale-x: 0.795; scale-y: 0.795; image: IMAGE_REANIM_ZOMBIE_LADDER_3; }
        frame 212 { x: -17; y: -1.5; skew-x: 22.3; skew-y: 22.3; scale-x: 0.794; scale-y: 0.794; image: IMAGE_REANIM_ZOMBIE_LADDER_4; }
        frame 213 { x: -29.5; y: 21.1; skew-x: 3.2; skew-y: 3.2; scale-x: 0.793; scale-y: 0.793; image: IMAGE_REANIM_ZOMBIE_LADDER_5; }
        frame 214 { x: -32.3; y: 35.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; image: none; }
    }
    Track {
        source-name: "Zombie_outerarm_hand";
        frame-count: 215;
        frame 0 { x: 12.3; y: 72.2; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_HAND2; }
        frame 1 { x: 12.9; y: 71.5; skew-x: 345.2; skew-y: 345.2; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: 13.5; y: 70.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 14; y: 70.1; }
        frame 4 { x: 14.5; y: 69.3; }
        frame 5 { x: 15.1; y: 68.7; }
        frame 6 { x: 15.6; y: 68; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { x: 14.9; y: 68.8; skew-x: 345.2; skew-y: 345.2; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: 14.1; y: 69.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 13.4; y: 70.6; }
        frame 10 { x: 12.6; y: 71.5; }
        frame 11 { x: 11.9; y: 72.3; }
        frame 12 { x: 11.1; y: 73.2; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 13 { x: -10000; y: 73.8; skew-x: 343.7; skew-y: 343.7; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { y: 74.6; skew-x: 342.4; skew-y: 342.4; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 11; y: 75.3; skew-x: 341; skew-y: 341; }
        frame 16 { x: 11.1; y: 76; skew-x: 339.7; skew-y: 339.7; }
        frame 17 { x: -10000; y: 76.7; skew-x: 338.2; skew-y: 338.2; }
        frame 18 { y: 77.3; skew-x: 336.9; skew-y: 336.9; scale-x: 0.8; scale-y: 0.8; }
        frame 19 { x: 11.3; y: 76.5; skew-x: 338.2; skew-y: 338.2; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { x: 11.6; y: 75.6; skew-x: 339.7; skew-y: 339.7; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 11.7; y: 74.8; skew-x: 341; skew-y: 341; }
        frame 22 { x: 12; y: 73.8; skew-x: 342.4; skew-y: 342.4; }
        frame 23 { x: 12.2; y: 73; skew-x: 343.7; skew-y: 343.7; }
        frame 24 { x: 12.3; y: 72.2; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 13; y: 71.7; skew-x: 345.2; skew-y: 345.2; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: 13.6; y: 71.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 14.3; y: 70.7; }
        frame 29 { x: 14.8; y: 70.2; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 30 { x: 14.7; y: 70.3; skew-x: 343.2; skew-y: 343.2; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: 14.5; y: 70.5; skew-x: 341.2; skew-y: 341.2; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 14.3; y: 70.6; skew-x: 339.4; skew-y: 339.4; }
        frame 33 { x: 14.1; y: 70.8; skew-x: 337.4; skew-y: 337.4; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: 14.2; y: 71.8; skew-x: 335.5; skew-y: 335.5; scale-x: 0.799; scale-y: 0.799; }
        frame 35 { x: 14.3; y: 72.8; skew-x: 333.7; skew-y: 333.7; scale-x: 0.798; scale-y: 0.798; }
        frame 36 { x: 14.4; y: 73.7; skew-x: 331.7; skew-y: 331.7; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 14.6; y: 74.6; skew-x: 329.7; skew-y: 329.7; }
        frame 38 { x: -10000; y: 75.6; skew-x: 327.8; skew-y: 327.8; scale-x: 0.799; scale-y: 0.799; }
        frame 39 { x: 13.1; y: 74.9; skew-x: 328.7; skew-y: 328.7; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 11.6; y: 74.2; skew-x: 329.6; skew-y: 329.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 10; y: 73.4; skew-x: 330.4; skew-y: 330.4; }
        frame 42 { x: 8.5; y: 72.7; skew-x: 331.2; skew-y: 331.2; }
        frame 43 { x: 7; y: 72; skew-x: 332.1; skew-y: 332.1; scale-x: 0.799; scale-y: 0.799; }
        frame 44 { x: 5.7; y: 74; skew-x: 332.2; skew-y: 332.2; scale-x: 0.798; scale-y: 0.798; }
        frame 45 { x: 4.3; y: 76; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 3; y: 78; }
        frame 47 { x: 1.5; y: 80; skew-x: 332.1; skew-y: 332.1; scale-x: 0.799; scale-y: 0.799; }
        frame 48 { x: 2.3; y: 78.8; skew-x: 332.2; skew-y: 332.2; scale-x: 0.798; scale-y: 0.798; }
        frame 49 { x: 3; y: 77.7; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 3.8; y: 76.6; }
        frame 51 { x: 4.5; y: 75.4; }
        frame 52 { x: 5.2; y: 74.3; skew-x: 332.1; skew-y: 332.1; scale-x: 0.799; scale-y: 0.799; }
        frame 53 { x: 6.6; y: 73.6; skew-x: 332.2; skew-y: 332.2; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: 8; y: 72.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 9.4; y: 72.3; }
        frame 56 { x: 10.8; y: 71.6; }
        frame 57 { x: 12.2; y: 71; skew-x: 332.1; skew-y: 332.1; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: -10000; y: 70.7; skew-x: 333.7; skew-y: 333.7; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: 12.1; y: 70.3; skew-x: 335.4; skew-y: 335.4; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 12; y: 69.9; skew-x: 337; skew-y: 337; }
        frame 61 { y: 69.5; skew-x: 338.7; skew-y: 338.7; }
        frame 62 { x: 11.9; y: 69.1; skew-x: 340.2; skew-y: 340.2; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: 12.7; y: 72; skew-x: 338.4; skew-y: 338.4; scale-x: 0.798; scale-y: 0.798; }
        frame 64 { x: 13.4; y: 74.8; skew-x: 336.4; skew-y: 336.4; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 14.2; y: 77.6; skew-x: 334.7; skew-y: 334.7; scale-x: 0.797; scale-y: 0.797; }
        frame 66 { x: 14.8; y: 80.4; skew-x: 332.6; skew-y: 332.6; scale-x: 0.798; scale-y: 0.798; }
        frame 67 { x: 14.3; y: 78.7; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 13.8; y: 77.1; skew-x: 337.7; skew-y: 337.7; }
        frame 69 { x: 13.4; y: 75.5; skew-x: 340.2; skew-y: 340.2; }
        frame 70 { x: 12.9; y: 73.8; skew-x: 342.7; skew-y: 342.7; scale-x: 0.799; scale-y: 0.799; }
        frame 71 { x: 12.3; y: 72.2; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 14.1; y: 68.5; skew-x: 347.2; skew-y: 347.2; scale-x: 0.799; scale-y: 0.799; }
        frame 74 { x: 16; y: 64.8; skew-x: 349.2; skew-y: 349.2; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 17.7; y: 61.1; skew-x: 351.2; skew-y: 351.2; }
        frame 76 { x: 19.6; y: 57.5; skew-x: 353; skew-y: 353; scale-x: 0.8; scale-y: 0.8; }
        frame 77 { x: 22.4; y: 54.1; skew-x: 351.7; skew-y: 351.7; scale-x: 0.799; scale-y: 0.799; }
        frame 78 { x: 25.3; y: 50.8; skew-x: 350.4; skew-y: 350.4; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 28.2; y: 47.4; skew-x: 349; skew-y: 349; }
        frame 80 { x: 31; y: 44; skew-x: 347.5; skew-y: 347.5; }
        frame 81 { x: 27.5; y: 61; skew-x: 334; skew-y: 334; scale-x: 0.798; scale-y: 0.798; }
        frame 82 { x: 24.4; y: 78.1; skew-x: 320.4; skew-y: 320.4; scale-x: 0.797; scale-y: 0.797; }
        frame 83 { x: 22.1; y: 95.3; skew-x: 306.9; skew-y: 306.9; scale-x: 0.798; scale-y: 0.798; }
        frame 84 { x: 22.3; y: 95.8; skew-x: 305.6; skew-y: 305.6; scale-x: 0.797; scale-y: 0.797; }
        frame 85 { x: 22.6; y: 96.4; skew-x: 304.3; skew-y: 304.3; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 22.9; y: 96.8; skew-x: 303.1; skew-y: 303.1; }
        frame 87 { x: 23.1; y: 97.4; skew-x: 301.9; skew-y: 301.9; scale-x: 0.798; scale-y: 0.798; }
        frame 88 { x: 22.3; y: 95.4; skew-x: 304.8; skew-y: 304.8; scale-x: 0.796; scale-y: 0.796; }
        frame 89 { x: 21.4; y: 93.3; skew-x: 307.8; skew-y: 307.8; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 20.6; y: 91.3; skew-x: 310.6; skew-y: 310.6; }
        frame 91 { x: 19.8; y: 89.2; skew-x: 313.7; skew-y: 313.7; scale-x: 0.797; scale-y: 0.797; }
        frame 92 { x: 17.6; y: 84.9; skew-x: 321.4; skew-y: 321.4; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 15.6; y: 80.6; skew-x: 329.4; skew-y: 329.4; }
        frame 94 { x: 13.8; y: 76.4; skew-x: 337.2; skew-y: 337.2; scale-x: 0.798; scale-y: 0.798; }
        frame 95 { x: 12.3; y: 72.2; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
        frame 132 { x: 33.5; y: 85.8; skew-x: 360; skew-y: 360; cel: 0; image: IMAGE_REANIM_ZOMBIE_OUTERARM_HAND; }
        frame 133 { x: 34.9; y: 85.6; skew-x: 363.8; skew-y: 363.8; cel: -10000; image: none; }
        frame 134 { x: 36.4; y: 85.3; skew-x: 367.8; skew-y: 367.8; scale-x: 0.799; scale-y: 0.799; }
        frame 135 { x: 38; y: 85.2; skew-x: 371.5; skew-y: 371.5; scale-x: -10000; scale-y: -10000; }
        frame 136 { x: 39.5; y: 85.1; skew-x: 375.5; skew-y: 375.5; }
        frame 137 { x: 41.4; y: 83.5; skew-x: 377.8; skew-y: 377.8; scale-x: 0.798; scale-y: 0.798; }
        frame 138 { x: 43.3; y: 81.8; skew-x: 380; skew-y: 380; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 45.2; y: 80.3; skew-x: 382.3; skew-y: 382.3; }
        frame 140 { x: 47; y: 78.7; skew-x: 384.5; skew-y: 384.5; scale-x: 0.799; scale-y: 0.799; }
        frame 141 { x: 49.4; y: 78.6; skew-x: 383.3; skew-y: 383.3; scale-x: 0.798; scale-y: 0.798; }
        frame 142 { x: 51.9; y: 78.5; skew-x: 382; skew-y: 382; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 54.3; y: -10000; skew-x: 380.8; skew-y: 380.8; }
        frame 144 { x: 56.7; y: 78.4; skew-x: 379.3; skew-y: 379.3; }
        frame 145 { x: 59.1; y: 78.3; skew-x: 378.2; skew-y: 378.2; scale-x: 0.799; scale-y: 0.799; }
        frame 146 { x: 55; y: 81; skew-x: 371.3; skew-y: 371.3; scale-x: 0.798; scale-y: 0.798; }
        frame 147 { x: 50.9; y: 83.7; skew-x: 364.3; skew-y: 364.3; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 47; y: 86.7; skew-x: 357.5; skew-y: 357.5; scale-x: 0.797; scale-y: 0.797; }
        frame 149 { x: 43.3; y: 89.8; skew-x: 350.7; skew-y: 350.7; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 39.5; y: 93.1; skew-x: 343.6; skew-y: 343.6; }
        frame 151 { x: 38.5; y: 94.5; skew-x: 343.7; skew-y: 343.7; scale-x: 0.796; scale-y: 0.796; }
        frame 152 { x: 37.4; y: 95.9; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 36.3; y: 97.3; }
        frame 154 { x: 35; y: 98.8; skew-x: 343.6; skew-y: 343.6; scale-x: 0.797; scale-y: 0.797; }
        frame 155 { x: 35.1; y: 96.7; skew-x: 345.5; skew-y: 345.5; scale-x: 0.796; scale-y: 0.796; }
        frame 156 { x: 35.3; y: 94.6; skew-x: 347.4; skew-y: 347.4; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: -10000; y: 92.6; skew-x: 349.2; skew-y: 349.2; }
        frame 158 { x: 35.5; y: 90.5; skew-x: 351.2; skew-y: 351.2; }
        frame 159 { x: 35.7; y: 88.5; skew-x: 352.9; skew-y: 352.9; }
        frame 160 { x: 34.9; y: 86.3; skew-x: 355.7; skew-y: 355.7; }
        frame 161 { x: 33.9; y: 84.1; skew-x: 358.5; skew-y: 358.5; }
        frame 162 { x: 33; y: 82; skew-x: 361.3; skew-y: 361.3; scale-x: 0.795; scale-y: 0.795; }
        frame 163 { x: 32.1; y: 79.9; skew-x: 364; skew-y: 364; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 31.3; y: 77.8; skew-x: 366.9; skew-y: 366.9; }
        frame 165 { x: 31.4; y: 76.6; skew-x: 370.5; skew-y: 370.5; scale-x: 0.794; scale-y: 0.794; }
        frame 166 { x: 31.7; y: 75.2; skew-x: 374.3; skew-y: 374.3; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 31.8; y: 74; skew-x: 377.8; skew-y: 377.8; scale-x: 0.793; scale-y: 0.793; }
        frame 168 { x: 32; y: 72.8; skew-x: 381.6; skew-y: 381.6; scale-x: 0.792; scale-y: 0.792; }
        frame 169 { x: 32.4; y: 71.8; skew-x: 385.4; skew-y: 385.4; scale-x: 0.793; scale-y: 0.793; }
        frame 170 { x: 32.3; y: 76.3; skew-x: 376.6; skew-y: 376.6; scale-x: 0.792; scale-y: 0.792; }
        frame 171 { x: -10000; y: 81.2; skew-x: 367.8; skew-y: 367.8; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 32.5; y: 86.1; skew-x: 359.4; skew-y: 359.4; }
        frame 173 { x: 33; y: 91.4; skew-x: 350.6; skew-y: 350.6; }
        frame 174 { x: 33.1; y: 90.3; skew-x: 352.5; skew-y: 352.5; scale-x: 0.793; scale-y: 0.793; }
        frame 175 { x: -10000; y: 89.3; skew-x: 354.5; skew-y: 354.5; scale-x: 0.795; scale-y: 0.795; }
        frame 176 { x: 33.3; y: 88.2; skew-x: 356.2; skew-y: 356.2; scale-x: 0.796; scale-y: 0.796; }
        frame 177 { x: 33.5; y: 87.1; skew-x: 358.2; skew-y: 358.2; scale-x: 0.798; scale-y: 0.798; }
        frame 178 { x: -10000; y: 85.8; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 179 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 34.9; y: 84.6; skew-x: 358; skew-y: 358; }
        frame 181 { x: 36.4; y: 83.5; skew-x: 355.7; skew-y: 355.7; scale-x: 0.799; scale-y: 0.799; }
        frame 182 { x: 37.8; y: 82.3; skew-x: 353.5; skew-y: 353.5; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 39.4; y: 81.2; skew-x: 351.2; skew-y: 351.2; scale-x: 0.798; scale-y: 0.798; }
        frame 184 { x: 40.8; y: 80.1; skew-x: 349.2; skew-y: 349.2; scale-x: -10000; scale-y: -10000; }
        frame 185 { x: 42.3; y: 79; skew-x: 347; skew-y: 347; scale-x: 0.797; scale-y: 0.797; }
        frame 186 { x: 43.9; y: 77.8; skew-x: 344.7; skew-y: 344.7; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 45.3; y: 76.8; skew-x: 342.5; skew-y: 342.5; }
        frame 188 { x: 45.4; y: 82.1; skew-x: 329.2; skew-y: 329.2; scale-x: 0.795; scale-y: 0.795; }
        frame 189 { x: 46; y: 87.6; skew-x: 315.6; skew-y: 315.6; scale-x: 0.794; scale-y: 0.794; }
        frame 190 { x: 47.7; y: 93.1; skew-x: 302.3; skew-y: 302.3; scale-x: 0.795; scale-y: 0.795; }
        frame 191 { x: 56; y: 93; skew-x: 288.8; skew-y: 288.8; scale-x: 0.794; scale-y: 0.794; }
        frame 192 { x: 64.8; y: 92.5; skew-x: 275.3; skew-y: 275.3; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 70.3; y: 88.3; skew-x: 262; skew-y: 262; }
        frame 194 { x: 76.2; y: 83.4; skew-x: 248.7; skew-y: 248.7; }
        frame 195 { x: 70.5; y: 88.9; skew-x: 262.7; skew-y: 262.7; }
        frame 196 { x: 65.3; y: 93.8; skew-x: 276.5; skew-y: 276.5; scale-x: 0.795; scale-y: 0.795; }
        frame 197 { x: 57.9; y: 95; skew-x: 290.3; skew-y: 290.3; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 51.1; y: 95.7; skew-x: 304.3; skew-y: 304.3; scale-x: 0.796; scale-y: 0.796; }
        frame 199 { x: 45.5; y: 92.9; skew-x: 318.2; skew-y: 318.2; scale-x: -10000; scale-y: -10000; }
        frame 200 { x: 40.8; y: 90.2; skew-x: 332.2; skew-y: 332.2; scale-x: 0.797; scale-y: 0.797; }
        frame 201 { x: 36.8; y: 87.8; skew-x: 346.2; skew-y: 346.2; scale-x: 0.798; scale-y: 0.798; }
        frame 202 { x: 33.5; y: 85.8; skew-x: 360; skew-y: 360; scale-x: 0.8; scale-y: 0.8; }
        frame 203 { x: 12.3; y: 72.2; skew-x: 345; skew-y: 345; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_HAND2; }
        frame 204 { x: 13.4; y: 62; skew-x: 354.5; skew-y: 354.5; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 205 { x: 14.6; y: 52; skew-x: 363.8; skew-y: 363.8; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 16.1; y: 42.3; skew-x: 373.3; skew-y: 373.3; scale-x: 0.798; scale-y: 0.798; }
        frame 207 { x: 17.7; y: 32.9; skew-x: 382.8; skew-y: 382.8; scale-x: 0.797; scale-y: 0.797; }
        frame 208 { x: 19.5; y: 23.8; skew-x: 392.3; skew-y: 392.3; scale-x: -10000; scale-y: -10000; }
        frame 209 { x: 21.2; y: 14.9; skew-x: 401.8; skew-y: 401.8; }
        frame 210 { x: 9.8; y: 26.4; skew-x: 388.1; skew-y: 388.1; scale-x: 0.796; scale-y: 0.796; }
        frame 211 { x: 0.3; y: 32.8; skew-x: 381.3; skew-y: 381.3; scale-x: 0.795; scale-y: 0.795; }
        frame 212 { x: -11.9; y: 41.1; skew-x: 367.3; skew-y: 367.3; scale-x: 0.794; scale-y: 0.794; }
        frame 213 { x: -9.9; y: 59.3; skew-x: 357.2; skew-y: 356.9; scale-x: 0.793; scale-y: -10000; }
        frame 214 { x: -10000; y: 72.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
    }
    Track {
        source-name: "Zombie_outerarm_lower";
        frame-count: 215;
        frame 0 { x: 47.9; y: 59; skew-x: 63.6; skew-y: 61.9; scale-x: 0.855; scale-y: 0.926; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_LOWER; }
        frame 1 { x: 49.3; y: 58; skew-x: 63.5; skew-y: 62.4; scale-x: 0.853; scale-y: 0.966; image: none; }
        frame 2 { x: 50.5; y: 57; skew-x: 63.3; skew-y: 62.7; scale-x: 0.851; scale-y: 1.005; }
        frame 3 { x: 51.9; y: 56; skew-x: 62.9; skew-y: 63; scale-x: 0.85; scale-y: 1.044; }
        frame 4 { x: 53.1; y: 55; skew-x: 62.7; skew-y: 63.3; scale-x: 0.847; scale-y: 1.084; }
        frame 5 { x: 54.5; y: 53.9; skew-x: 62.4; skew-y: 63.5; scale-x: 0.845; scale-y: 1.123; }
        frame 6 { x: 55.9; y: 53; skew-x: 62.1; skew-y: 63.6; scale-x: 0.842; scale-y: 1.164; }
        frame 7 { x: 54.5; y: 53.8; skew-x: -10000; skew-y: 63.2; scale-x: 0.845; scale-y: 1.123; }
        frame 8 { x: 52.9; y: 54.7; skew-x: 62; skew-y: 62.5; scale-x: 0.847; scale-y: 1.084; }
        frame 9 { x: 51.4; y: 55.5; skew-x: 61.9; skew-y: 62; scale-x: 0.849; scale-y: 1.044; }
        frame 10 { x: 49.8; y: 56.4; skew-x: 61.6; skew-y: 61.2; scale-x: 0.852; scale-y: 1.004; }
        frame 11 { x: 48.3; y: 57.3; skew-x: 61.5; skew-y: 60.5; scale-x: 0.854; scale-y: 0.964; }
        frame 12 { x: 46.6; y: 58.2; skew-x: 61.3; skew-y: 59.6; scale-x: 0.855; scale-y: 0.926; }
        frame 13 { x: 46.3; y: 58.4; skew-x: 60.2; skew-y: 59; scale-x: 0.859; scale-y: 0.922; }
        frame 14 { x: 46.1; y: 58.6; skew-x: 59.1; skew-y: 58.4; scale-x: 0.863; scale-y: 0.917; }
        frame 15 { x: 45.8; y: 59; skew-x: 57.7; skew-y: 57.8; scale-x: 0.868; scale-y: 0.912; }
        frame 16 { x: 45.5; y: 59.3; skew-x: 56.6; skew-y: 57.2; scale-x: 0.872; scale-y: 0.908; }
        frame 17 { x: 45.2; y: 59.5; skew-x: 55.4; skew-y: 56.6; scale-x: 0.876; scale-y: 0.903; }
        frame 18 { x: 45; y: 59.8; skew-x: 54.2; skew-y: 56; scale-x: 0.881; scale-y: 0.899; }
        frame 19 { x: 45.5; y: 59.6; skew-x: 55.9; skew-y: 57.1; scale-x: 0.876; scale-y: 0.903; }
        frame 20 { x: 46; y: 59.5; skew-x: 57.3; skew-y: 58; scale-x: 0.872; scale-y: 0.908; }
        frame 21 { x: 46.5; y: 59.4; skew-x: 59; skew-y: 59; scale-x: 0.868; scale-y: 0.912; }
        frame 22 { x: 47; y: 59.2; skew-x: 60.6; skew-y: 59.9; scale-x: 0.863; scale-y: 0.917; }
        frame 23 { x: 47.5; y: 59; skew-x: 62.2; skew-y: 61; scale-x: 0.859; scale-y: 0.922; }
        frame 24 { x: 47.9; skew-x: 63.6; skew-y: 61.9; scale-x: 0.855; scale-y: 0.926; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 48.5; y: 58.1; skew-x: 62.6; skew-y: 60.9; }
        frame 27 { x: 49; y: 57.4; skew-x: 61.6; skew-y: 59.9; scale-x: 0.854; scale-y: 0.925; }
        frame 28 { x: 49.6; y: 56.5; skew-x: 60.8; skew-y: 59.1; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 50.3; y: 55.6; skew-x: 59.7; skew-y: 58; }
        frame 30 { x: 49.3; y: 54.6; skew-x: 57.6; skew-y: 55.9; scale-y: 0.924; }
        frame 31 { x: 48.3; y: 53.7; skew-x: 55.4; skew-y: 53.7; scale-x: 0.853; scale-y: -10000; }
        frame 32 { x: 47.3; y: 52.8; skew-x: 53.1; skew-y: 51.4; scale-x: -10000; }
        frame 33 { x: 46.3; y: 51.8; skew-x: 50.9; skew-y: 49.2; }
        frame 34 { x: 45.4; y: 51.5; skew-x: 48.8; skew-y: 47.1; scale-x: 0.852; scale-y: 0.923; }
        frame 35 { x: 44.6; y: -10000; skew-x: 46.6; skew-y: 44.9; scale-x: -10000; scale-y: 0.922; }
        frame 36 { x: 43.9; y: 51.3; skew-x: 44.6; skew-y: 42.9; scale-x: 0.851; scale-y: -10000; }
        frame 37 { x: 43.1; y: 51.1; skew-x: 42.4; skew-y: 40.6; scale-x: -10000; }
        frame 38 { x: 42.4; y: 50.9; skew-x: 40.2; skew-y: 38.5; scale-x: 0.852; scale-y: 0.923; }
        frame 39 { x: 42; y: 51.5; skew-x: 43.8; skew-y: 42.1; scale-x: 0.851; scale-y: 0.921; }
        frame 40 { x: 41.9; y: 52.1; skew-x: 47.3; skew-y: 45.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 41.5; y: 52.9; skew-x: 50.9; skew-y: 49.1; scale-x: 0.85; }
        frame 42 { x: 41.4; y: 53.5; skew-x: 54.4; skew-y: 52.6; scale-x: -10000; }
        frame 43 { x: 41.3; y: 54.4; skew-x: 57.8; skew-y: 56.1; scale-x: 0.851; }
        frame 44 { x: 39.9; y: 55.8; skew-x: 57.1; skew-y: 55.4; scale-x: 0.85; scale-y: 0.92; }
        frame 45 { x: 38.4; y: 57; skew-x: 56.4; skew-y: 54.7; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 36.9; y: 58.4; skew-x: 55.6; skew-y: 53.9; scale-x: 0.849; }
        frame 47 { x: 35.3; y: 59.8; skew-x: 54.9; skew-y: 53.2; scale-x: 0.85; }
        frame 48 { x: 36.1; y: 58.8; skew-x: 55.6; skew-y: 53.9; scale-x: 0.849; }
        frame 49 { x: 37; y: 57.8; skew-x: 56.1; skew-y: 54.4; scale-x: -10000; }
        frame 50 { x: 37.9; y: 56.7; skew-x: 56.6; skew-y: 54.9; scale-x: 0.85; }
        frame 51 { x: 38.7; y: 55.6; skew-x: 57.3; skew-y: 55.6; scale-x: -10000; }
        frame 52 { x: 39.5; y: 54.6; skew-x: 57.8; skew-y: 56.1; scale-x: 0.851; scale-y: 0.921; }
        frame 53 { x: 40.8; y: 53.7; skew-x: 56.9; skew-y: 55.1; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 42; y: 52.8; skew-x: 55.8; skew-y: 54.1; }
        frame 55 { x: 43; y: 51.8; skew-x: 54.6; skew-y: 52.9; scale-y: 0.922; }
        frame 56 { x: 44.3; y: 50.8; skew-x: 53.6; skew-y: 51.9; scale-x: 0.852; scale-y: -10000; }
        frame 57 { x: 45.3; y: 49.8; skew-x: 52.5; skew-y: 50.8; scale-x: 0.853; scale-y: 0.923; }
        frame 58 { x: 45.8; y: 50.1; skew-x: 54.1; skew-y: 52.4; scale-x: 0.852; scale-y: -10000; }
        frame 59 { x: 46.1; y: 50.4; skew-x: 55.6; skew-y: 53.9; scale-x: -10000; }
        frame 60 { x: 46.6; y: 50.7; skew-x: 56.9; skew-y: 55.2; }
        frame 61 { x: 47.1; y: 51; skew-x: 58.4; skew-y: 56.7; }
        frame 62 { x: 47.5; y: 51.3; skew-x: 59.8; skew-y: 58.1; scale-x: 0.853; scale-y: 0.924; }
        frame 63 { x: 47.8; y: 53.1; skew-x: 58.4; skew-y: 56.6; scale-x: -10000; scale-y: 0.923; }
        frame 64 { x: 47.9; y: 55; skew-x: 56.8; skew-y: 55.1; scale-y: -10000; }
        frame 65 { x: 48; y: 56.9; skew-x: 55.3; skew-y: 53.6; scale-y: 0.924; }
        frame 66 { x: 48.3; y: 58.9; skew-x: 53.6; skew-y: 51.9; scale-x: 0.854; scale-y: -10000; }
        frame 67 { x: 48.2; y: 58.8; skew-x: 55.6; skew-y: 53.9; scale-x: 0.853; }
        frame 68 { x: 48.3; y: -10000; skew-x: 57.6; skew-y: 55.9; scale-x: 0.854; }
        frame 69 { x: 48; y: 58.9; skew-x: 59.6; skew-y: 57.9; scale-x: -10000; scale-y: 0.925; }
        frame 70 { x: 48.1; y: -10000; skew-x: 61.6; skew-y: 59.9; scale-x: 0.855; scale-y: -10000; }
        frame 71 { x: 47.9; y: 59; skew-x: 63.6; skew-y: 61.9; scale-x: -10000; scale-y: 0.926; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 73 { x: 50.8; y: 56.9; skew-x: 67.3; skew-y: 65.6; }
        frame 74 { x: 53.6; y: 55; skew-x: 70.7; skew-y: 69; }
        frame 75 { x: 56.5; y: 53; skew-x: 74.2; skew-y: 72.5; }
        frame 76 { x: 59.5; y: 51.1; skew-x: 77.9; skew-y: 76.2; }
        frame 77 { x: 63.3; y: 49.1; skew-x: 82.4; skew-y: 77.7; scale-x: 0.835; scale-y: 0.94; }
        frame 78 { x: 67.2; y: 47.3; skew-x: 87; skew-y: 79.4; scale-x: 0.817; scale-y: 0.953; }
        frame 79 { x: 71; y: 45.5; skew-x: 91.6; skew-y: 81.1; scale-x: 0.799; scale-y: 0.966; }
        frame 80 { x: 74.8; y: 43.7; skew-x: 96.4; skew-y: 83; scale-x: 0.782; scale-y: 0.978; }
        frame 81 { x: 62.8; y: 45.6; skew-x: 68.2; skew-y: 60.7; scale-x: 0.817; scale-y: 0.951; }
        frame 82 { x: 52.1; y: 51.1; skew-x: 40.1; skew-y: 38.3; scale-x: 0.852; scale-y: 0.922; }
        frame 83 { x: 37.6; y: 61.9; skew-x: 16.6; skew-y: 14.9; scale-x: 0.853; scale-y: 0.923; }
        frame 84 { x: 39.3; y: 62; skew-x: 19.8; skew-y: 18; scale-x: 0.851; scale-y: 0.922; }
        frame 85 { x: 41; y: 62.3; skew-x: 23; skew-y: 21.3; scale-x: -10000; scale-y: 0.921; }
        frame 86 { x: 42.8; y: -10000; skew-x: 26; skew-y: 24.3; scale-x: 0.85; scale-y: -10000; }
        frame 87 { x: 44.5; skew-x: 29.2; skew-y: 27.5; scale-x: 0.851; scale-y: 0.922; }
        frame 88 { x: 44.7; y: 61.3; skew-x: 30.8; skew-y: 29.1; scale-x: 0.85; scale-y: 0.921; }
        frame 89 { x: 45; y: 60.4; skew-x: 32.5; skew-y: 30.8; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 45.1; y: 59.5; skew-x: 34.1; skew-y: 32.4; scale-x: 0.851; }
        frame 91 { x: 45.4; y: 58.5; skew-x: 35.8; skew-y: 34.1; scale-x: 0.852; scale-y: 0.923; }
        frame 92 { x: 45.7; y: 58.4; skew-x: 42.8; skew-y: 41.1; scale-x: -10000; scale-y: 0.922; }
        frame 93 { x: 46.3; y: 58.5; skew-x: 49.8; skew-y: 48.1; scale-x: 0.853; scale-y: 0.924; }
        frame 94 { x: 47; y: 58.6; skew-x: 56.8; skew-y: 55.1; scale-x: 0.854; scale-y: 0.925; }
        frame 95 { x: 47.9; y: 59; skew-x: 63.6; skew-y: 61.9; scale-x: 0.855; scale-y: 0.926; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
        frame 132 { x: 38.5; y: 64.8; skew-x: 8.2; skew-y: 6.5; scale-x: 0.853; scale-y: 0.924; cel: 0; }
        frame 133 { x: 38.6; y: 65.4; skew-x: 6.2; skew-y: 4.5; scale-x: 0.852; scale-y: 0.922; cel: -10000; }
        frame 134 { x: 38.8; y: 65.9; skew-x: 4.2; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: -10000; y: 66.6; skew-x: 2.2; skew-y: 0.5; }
        frame 136 { x: 39; y: 67.1; skew-x: 0.4; skew-y: -1.2; scale-x: 0.853; scale-y: 0.923; }
        frame 137 { x: 40.8; y: 65.7; skew-x: 0.2; skew-y: -1.4; scale-x: 0.852; scale-y: 0.922; }
        frame 138 { x: 42.5; y: 64.2; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 44.1; y: 62.6; }
        frame 140 { x: 45.8; y: 61.1; skew-x: 0.4; skew-y: -1.2; scale-x: 0.853; scale-y: 0.923; }
        frame 141 { x: 46.7; y: 61.9; skew-x: -3; skew-y: -4.7; scale-x: 0.852; scale-y: 0.922; }
        frame 142 { x: 47.6; y: 62.7; skew-x: -6.4; skew-y: -8.1; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 48.6; y: 63.4; skew-x: -9.7; skew-y: -11.4; }
        frame 144 { x: 49.8; y: 64.2; skew-x: -13.2; skew-y: -14.9; }
        frame 145 { x: 50.8; y: 64.8; skew-x: -16.4; skew-y: -18.1; }
        frame 146 { x: 48.5; y: 65.7; skew-x: -14.7; skew-y: -16.4; scale-x: 0.851; }
        frame 147 { x: 46.1; y: 66.5; skew-x: -12.7; skew-y: -14.4; scale-x: -10000; }
        frame 148 { x: 43.9; y: 67.2; skew-x: -10.7; skew-y: -12.4; }
        frame 149 { x: 41.6; y: 68.1; skew-x: -8.9; skew-y: -10.7; scale-y: 0.921; }
        frame 150 { x: 39.3; y: 68.8; skew-x: -6.9; skew-y: -8.6; scale-y: 0.922; }
        frame 151 { x: 38.1; y: 69.9; skew-x: -7; skew-y: -8.7; scale-y: 0.921; }
        frame 152 { x: 37; y: 71; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 153 { x: 35.9; y: 72.1; }
        frame 154 { x: 34.8; y: 73.1; skew-x: -6.9; skew-y: -8.6; scale-y: 0.922; }
        frame 155 { x: 35.9; y: 71.4; skew-x: -4.4; skew-y: -6.2; scale-x: 0.85; scale-y: 0.921; }
        frame 156 { x: 37; y: 69.7; skew-x: -1.9; skew-y: -3.6; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 38.1; y: 67.9; skew-x: 0.7; skew-y: -0.9; scale-y: 0.92; }
        frame 158 { x: 39.3; y: 66.2; skew-x: 3.2; skew-y: 1.5; scale-y: -10000; }
        frame 159 { x: 40.5; y: 64.4; skew-x: 5.8; skew-y: 4.1; scale-x: 0.851; scale-y: 0.921; }
        frame 160 { x: 41; y: 63; skew-x: 9.7; skew-y: 8; scale-x: 0.849; scale-y: 0.92; }
        frame 161 { x: 41.7; y: 61.5; skew-x: 13.5; skew-y: 11.8; scale-x: -10000; scale-y: 0.919; }
        frame 162 { x: 42.5; y: 60; skew-x: 17.5; skew-y: 15.8; scale-y: -10000; }
        frame 163 { x: 43.4; y: 58.6; skew-x: 21.5; skew-y: 19.8; scale-x: 0.848; }
        frame 164 { x: 44.1; y: 57; skew-x: 25.4; skew-y: 23.6; scale-x: 0.85; scale-y: 0.92; }
        frame 165 { x: 43.9; y: 56.5; skew-x: 25.5; skew-y: 23.8; scale-x: 0.848; scale-y: 0.918; }
        frame 166 { x: 43.6; y: 56; skew-x: 25.8; skew-y: 24.1; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 43.4; y: 55.4; skew-x: 26; skew-y: 24.3; scale-x: 0.847; }
        frame 168 { x: 43.2; y: 55; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.917; }
        frame 169 { x: 42.8; y: 54.3; skew-x: 26.3; skew-y: 24.6; scale-x: 0.848; scale-y: 0.919; }
        frame 170 { x: 40.7; y: 58; skew-x: 19.8; skew-y: 18.1; scale-x: 0.847; scale-y: 0.917; }
        frame 171 { x: 38.9; y: 61.6; skew-x: 13.5; skew-y: 11.7; scale-x: 0.846; scale-y: -10000; }
        frame 172 { x: 37.2; y: 65.3; skew-x: 7; skew-y: 5.2; scale-x: -10000; }
        frame 173 { x: 35.7; y: 68.9; skew-x: 0.6; skew-y: -1.1; scale-x: 0.847; scale-y: 0.918; }
        frame 174 { x: 36.3; y: 68.1; skew-x: 2; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 36.9; y: 67.3; skew-x: 3.5; skew-y: 1.8; scale-x: 0.848; scale-y: 0.919; }
        frame 176 { x: 37.4; y: 66.5; skew-x: 5; skew-y: 3.3; scale-x: 0.85; scale-y: 0.92; }
        frame 177 { x: 38; y: 65.6; skew-x: 6.7; skew-y: 5; scale-x: 0.851; scale-y: 0.921; }
        frame 178 { x: 38.5; y: 64.8; skew-x: 8.2; skew-y: 6.5; scale-x: 0.853; scale-y: 0.924; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 40.6; y: 63.1; skew-x: 9.2; skew-y: 7.5; scale-x: 0.851; scale-y: 0.922; }
        frame 181 { x: 42.8; y: 61.5; skew-x: 10.2; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 44.9; y: 60; skew-x: 11.2; skew-y: 9.5; scale-y: 0.921; }
        frame 183 { x: 47; y: 58.4; skew-x: 12.2; skew-y: 10.5; scale-y: -10000; }
        frame 184 { x: 49.1; y: 56.8; skew-x: 13.2; skew-y: 11.5; scale-x: 0.85; }
        frame 185 { x: 51.4; y: 55.2; skew-x: 14.2; skew-y: 12.5; scale-x: -10000; }
        frame 186 { x: 53.5; y: 53.5; skew-x: 15.2; skew-y: 13.5; scale-y: 0.92; }
        frame 187 { x: 55.5; y: 52; skew-x: 16.2; skew-y: 14.5; scale-x: 0.851; scale-y: 0.921; }
        frame 188 { x: 49.1; y: 56.9; skew-x: 2.7; skew-y: 1; scale-x: 0.849; scale-y: 0.92; }
        frame 189 { x: 43.5; y: 61.5; skew-x: -10.5; skew-y: -12.2; scale-x: -10000; scale-y: -10000; }
        frame 190 { x: 38.6; y: 65.6; skew-x: -23.8; skew-y: -25.5; }
        frame 191 { x: 40.3; y: 69.2; skew-x: -37.1; skew-y: -38.8; scale-x: 0.848; scale-y: 0.919; }
        frame 192 { x: 42.5; y: 72; skew-x: -50.6; skew-y: -52.3; scale-x: -10000; scale-y: 0.918; }
        frame 193 { x: 45.1; y: 73.8; skew-x: -64.1; skew-y: -65.8; scale-x: 0.847; scale-y: 0.917; }
        frame 194 { x: 48; y: 74.8; skew-x: -77.4; skew-y: -79.1; scale-x: 0.848; scale-y: 0.919; }
        frame 195 { x: 45.9; y: 75.3; skew-x: -66.6; skew-y: -68.4; scale-x: 0.847; scale-y: 0.917; }
        frame 196 { x: 43.8; y: -10000; skew-x: -55.9; skew-y: -57.6; scale-x: 0.848; scale-y: 0.918; }
        frame 197 { x: 41.9; y: 74.7; skew-x: -45.3; skew-y: -47; scale-x: -10000; scale-y: 0.919; }
        frame 198 { x: 40.4; y: 73.6; skew-x: -34.5; skew-y: -36.2; scale-x: 0.85; scale-y: 0.92; }
        frame 199 { x: 39.1; y: 71.8; skew-x: -23.8; skew-y: -25.5; scale-x: -10000; scale-y: 0.921; }
        frame 200 { x: 38.5; y: 70; skew-x: -13.2; skew-y: -14.9; scale-x: 0.851; scale-y: 0.922; }
        frame 201 { x: 38.1; y: 67.5; skew-x: -2.5; skew-y: -4.2; scale-x: -10000; scale-y: -10000; }
        frame 202 { x: 38.5; y: 64.8; skew-x: 8.2; skew-y: 6.5; scale-x: 0.853; scale-y: 0.924; }
        frame 203 { x: 47.9; y: 59; skew-x: 63.6; skew-y: 61.9; scale-x: 0.855; scale-y: 0.926; }
        frame 204 { x: 48.1; y: 54.3; skew-x: 72.9; skew-y: 71.2; scale-x: -10000; scale-y: -10000; }
        frame 205 { x: 48.6; y: 50; skew-x: 82.4; skew-y: 80.7; scale-x: 0.854; scale-y: 0.925; }
        frame 206 { x: 49.3; y: 46.2; skew-x: 92; skew-y: 90.2; scale-x: 0.853; scale-y: 0.924; }
        frame 207 { x: 50; y: 42.8; skew-x: 101.5; skew-y: 99.8; scale-x: 0.852; scale-y: 0.923; }
        frame 208 { x: 50.9; y: 39.9; skew-x: 111; skew-y: 109.3; scale-x: -10000; scale-y: 0.922; }
        frame 209 { x: 51.5; y: 37.5; skew-x: 120.4; skew-y: 118.7; scale-x: 0.853; scale-y: 0.923; }
        frame 210 { x: 44.5; y: 42.8; skew-x: 106.7; skew-y: 105; scale-x: 0.851; scale-y: 0.921; }
        frame 211 { x: 38.4; y: 43.2; skew-x: 95.6; skew-y: 95.7; scale-x: 0.855; scale-y: 0.959; }
        frame 212 { x: 29.9; y: 42.6; skew-x: 79.7; skew-y: 83.4; scale-x: 0.865; scale-y: 1.04; }
        frame 213 { x: 26; y: 50; skew-x: 64.9; skew-y: 63.8; scale-x: 0.85; scale-y: 0.925; }
        frame 214 { x: 24.8; y: 59.9; skew-x: 57.7; skew-y: 59.9; scale-x: 0.86; scale-y: 0.999; }
    }
    Track {
        source-name: "Zombie_ladder_outerarm_upper";
        frame-count: 215;
        frame 0 { x: 45.2; y: 42; skew-x: 17; skew-y: 1.8; scale-x: 0.85; scale-y: 0.901; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_UPPER; }
        frame 1 { x: 45; skew-x: 13.3; skew-y: 0.6; scale-x: 0.849; scale-y: 0.893; image: none; }
        frame 2 { x: 44.9; y: -10000; skew-x: 9.8; skew-y: -0.2; scale-x: -10000; scale-y: 0.884; }
        frame 3 { x: -10000; y: 42.1; skew-x: 6.1; skew-y: -1.2; scale-x: 0.85; scale-y: 0.876; }
        frame 4 { y: 42.3; skew-x: 2.5; skew-y: -2.2; scale-x: -10000; scale-y: 0.867; }
        frame 5 { x: 45; y: -10000; skew-x: -0.7; skew-y: -3.4; scale-y: 0.858; }
        frame 6 { x: 45.5; y: 42.5; skew-x: -4.5; skew-y: -4.5; scale-y: 0.85; }
        frame 7 { x: 45.9; y: -10000; skew-x: -1.7; skew-y: -1.7; scale-y: -10000; }
        frame 8 { x: 46.2; y: 42.6; skew-x: 0.5; skew-y: 0.5; scale-x: 0.849; scale-y: 0.849; }
        frame 9 { x: 46.5; y: 42.9; skew-x: 3.3; skew-y: 3.3; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 47; y: 43.1; skew-x: 5.8; skew-y: 5.8; }
        frame 11 { x: 47.5; y: 43.3; skew-x: 8.3; skew-y: 8.3; }
        frame 12 { x: 47.9; y: 43.4; skew-x: 11.1; skew-y: 11.1; }
        frame 13 { x: 47.3; y: 43.5; skew-x: 10.5; skew-y: 9.6; }
        frame 14 { x: 46.7; y: 43.9; skew-x: 9.8; skew-y: 8.3; scale-x: 0.85; }
        frame 15 { x: 46.2; y: 44; skew-x: 9.3; skew-y: 7; scale-x: -10000; }
        frame 16 { x: 45.6; y: 44.2; skew-x: 8.8; skew-y: 5.6; scale-x: 0.851; }
        frame 17 { x: 45; y: 44.4; skew-x: 8.1; skew-y: 4.3; scale-x: 0.852; }
        frame 18 { x: 44.5; y: 44.8; skew-x: 7.7; skew-y: 3; scale-x: 0.853; scale-y: 0.85; }
        frame 19 { x: 44.6; y: 44.4; skew-x: 9.1; skew-y: 2.8; scale-x: 0.852; scale-y: 0.858; }
        frame 20 { x: 44.8; y: 43.9; skew-x: 10.8; skew-y: 2.5; scale-x: 0.851; scale-y: 0.867; }
        frame 21 { x: 45; y: 43.4; skew-x: 12.3; skew-y: 2.3; scale-x: -10000; scale-y: 0.876; }
        frame 22 { x: 45.2; y: 43; skew-x: 13.8; skew-y: 2; scale-x: 0.85; scale-y: 0.884; }
        frame 23 { x: 45.3; y: 42.6; skew-x: 15.3; skew-y: 1.8; scale-x: -10000; scale-y: 0.893; }
        frame 24 { x: 45.2; y: 42; skew-x: 17; skew-y: -10000; scale-y: 0.901; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 26 { x: 45.8; y: 42; skew-x: 13.3; skew-y: 2; scale-x: 0.849; scale-y: 0.888; }
        frame 27 { x: 46.4; y: -10000; skew-x: 9.8; skew-y: 2.3; scale-x: -10000; scale-y: 0.875; }
        frame 28 { x: 47; y: 42.1; skew-x: 6.3; skew-y: 2.5; scale-y: 0.862; }
        frame 29 { x: 48; y: 42.2; skew-x: 2.9; skew-y: 2.9; scale-y: 0.849; }
        frame 30 { x: 49.4; y: 40.8; skew-x: 7.1; skew-y: 7.1; scale-x: 0.848; scale-y: 0.848; }
        frame 31 { x: 50.8; y: 39.5; skew-x: 11.5; skew-y: 11.5; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 52.3; y: 38.3; skew-x: 15.8; skew-y: 15.8; }
        frame 33 { x: 53.8; y: 37.1; skew-x: 20.2; skew-y: 20.2; scale-x: 0.849; scale-y: 0.849; }
        frame 34 { x: 54.6; y: 37; skew-x: 22.6; skew-y: 22.6; scale-x: 0.847; scale-y: 0.847; }
        frame 35 { x: 55.3; skew-x: 25; skew-y: 25; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 56; y: 36.9; skew-x: 27.3; skew-y: 27.3; }
        frame 37 { x: 56.8; y: -10000; skew-x: 29.8; skew-y: 29.8; }
        frame 38 { x: 57.5; skew-x: 32.3; skew-y: 32.3; scale-x: 0.848; scale-y: 0.848; }
        frame 39 { x: 55.6; y: 37.4; skew-x: 30.6; skew-y: 30.6; scale-x: 0.847; scale-y: 0.847; }
        frame 40 { x: 53.9; y: 38; skew-x: 28.8; skew-y: 28.8; scale-x: 0.846; scale-y: 0.846; }
        frame 41 { x: 52; y: 38.5; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 50.3; y: 39; skew-x: 25.3; skew-y: 25.3; }
        frame 43 { x: 48.6; y: 39.5; skew-x: 23.5; skew-y: 23.5; scale-x: 0.847; scale-y: 0.847; }
        frame 44 { x: 47.3; y: 40.7; skew-x: 22.8; skew-y: 22.8; scale-x: 0.845; scale-y: 0.845; }
        frame 45 { x: 46; y: 41.8; skew-x: 22; skew-y: 22; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 44.6; y: 43; skew-x: 21.3; skew-y: 21.3; }
        frame 47 { x: 43.3; y: 44.1; skew-x: 20.6; skew-y: 20.6; }
        frame 48 { x: 44.3; y: 43.3; skew-x: 21.1; skew-y: 21.1; }
        frame 49 { x: 45.4; y: 42.3; skew-x: 21.8; skew-y: 21.8; }
        frame 50 { x: 46.4; y: 41.4; skew-x: 22.3; skew-y: 22.3; }
        frame 51 { x: 47.5; y: 40.5; skew-x: 22.8; skew-y: 22.8; }
        frame 52 { x: 48.6; y: 39.5; skew-x: 23.5; skew-y: 23.5; scale-x: 0.847; scale-y: 0.847; }
        frame 53 { x: 50.3; y: 39; skew-x: 25.3; skew-y: 25.3; scale-x: 0.846; scale-y: 0.846; }
        frame 54 { x: 52; y: 38.5; skew-x: 27; skew-y: 27.1; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 53.8; y: 38; skew-x: 28.8; skew-y: 28.8; }
        frame 56 { x: 55.5; y: 37.6; skew-x: 30.6; skew-y: 30.6; }
        frame 57 { x: 57.3; y: 37.1; skew-x: 32.3; skew-y: 32.3; scale-x: 0.848; scale-y: 0.848; }
        frame 58 { x: 56.4; y: 37; skew-x: 29.8; skew-y: 29.8; scale-x: 0.847; scale-y: 0.847; }
        frame 59 { x: 55.5; y: 36.9; skew-x: 27.3; skew-y: 27.3; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 54.8; y: 36.7; skew-x: 25; skew-y: 25; }
        frame 61 { x: 54; y: 36.6; skew-x: 22.6; skew-y: 22.6; scale-y: 0.848; }
        frame 62 { x: 53.3; y: -10000; skew-x: 20.2; skew-y: 20.2; scale-x: 0.849; scale-y: 0.849; }
        frame 63 { x: 51.2; y: 38.6; skew-x: 14.8; skew-y: 14.8; scale-x: 0.848; scale-y: 0.848; }
        frame 64 { x: 49.3; y: 40.5; skew-x: 9.8; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 47.4; y: 42.6; skew-x: 4.5; skew-y: 4.5; }
        frame 66 { x: 45.5; y: 45; skew-x: -0.6; skew-y: -0.6; }
        frame 67 { x: -10000; y: 44.4; skew-x: 2.8; skew-y: 0; scale-x: 0.849; scale-y: 0.859; }
        frame 68 { x: 45.3; y: 43.8; skew-x: 6.3; skew-y: 0.3; scale-x: -10000; scale-y: 0.87; }
        frame 69 { x: 45.4; y: 43.3; skew-x: 9.8; skew-y: 0.8; scale-y: 0.88; }
        frame 70 { x: -10000; y: 42.8; skew-x: 13.3; skew-y: 1.3; scale-y: 0.891; }
        frame 71 { x: 45.2; y: 42; skew-x: 17; skew-y: 1.8; scale-x: 0.85; scale-y: 0.901; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 46.7; y: 40.5; skew-x: 16.3; skew-y: 2.5; scale-x: 0.852; scale-y: 0.888; }
        frame 74 { x: 48.2; y: 38.9; skew-x: 15.8; skew-y: 3.3; scale-x: 0.855; scale-y: 0.875; }
        frame 75 { x: 49.8; y: 37.4; skew-x: 15.3; skew-y: 4.3; scale-x: 0.858; scale-y: 0.862; }
        frame 76 { x: 51.5; y: 36; skew-x: 14.9; skew-y: 5.1; scale-x: 0.861; scale-y: 0.849; }
        frame 77 { x: 51.3; y: 35; skew-x: 11.1; skew-y: -0.7; scale-x: 0.868; scale-y: -10000; }
        frame 78 { x: 51.2; y: 34.2; skew-x: 7.5; skew-y: -6.7; scale-x: 0.876; }
        frame 79 { x: -10000; y: 33.5; skew-x: 3.8; skew-y: -12.5; scale-x: 0.884; }
        frame 80 { x: 51.5; y: 33; skew-x: 0.2; skew-y: -18.6; scale-x: 0.892; scale-y: 0.85; }
        frame 81 { x: 44.2; y: 38.6; skew-x: -16.5; skew-y: -26; scale-x: 0.868; scale-y: 0.847; }
        frame 82 { x: 38.1; y: 44; skew-x: -33.5; skew-y: -33.5; scale-x: 0.846; scale-y: 0.846; }
        frame 83 { x: 32.4; y: 47; skew-x: -23.5; skew-y: -23.5; scale-x: 0.848; scale-y: 0.848; }
        frame 84 { x: 31.6; y: 49.1; skew-x: -28; skew-y: -28; scale-x: 0.847; scale-y: 0.847; }
        frame 85 { x: 30.9; y: 51.2; skew-x: -32.5; skew-y: -32.5; scale-x: 0.846; scale-y: 0.846; }
        frame 86 { x: 30.2; y: 53.4; skew-x: -37; skew-y: -37; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 29.5; y: 55.4; skew-x: -41.5; skew-y: -41.5; }
        frame 88 { x: 31.2; y: 53.5; skew-x: -37.3; skew-y: -37.3; scale-x: 0.845; scale-y: 0.845; }
        frame 89 { x: 32.6; y: 51.6; skew-x: -33.2; skew-y: -33.2; scale-x: -10000; scale-y: 0.846; }
        frame 90 { x: 34.4; y: 49.6; skew-x: -29; skew-y: -29; scale-x: 0.846; scale-y: -10000; }
        frame 91 { x: 36; y: 47.8; skew-x: -25; skew-y: -25; scale-x: 0.847; scale-y: 0.847; }
        frame 92 { x: 37.5; y: 46.4; skew-x: -14.4; skew-y: -18.2; scale-x: -10000; scale-y: 0.86; }
        frame 93 { x: 39.6; y: 44.8; skew-x: -3.9; skew-y: -11.4; scale-x: 0.848; scale-y: 0.874; }
        frame 94 { x: 42.3; y: 43.4; skew-x: 6.3; skew-y: -4.7; scale-x: 0.849; scale-y: 0.888; }
        frame 95 { x: 45.2; y: 42; skew-x: 17; skew-y: 1.8; scale-x: 0.85; scale-y: 0.901; }
        frame 96 { x: 45.1; y: 41.7; skew-x: -10000; skew-y: -10000; scale-x: 0.899; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_UPPER2; }
        frame 97 { x: 46.2; y: 40.6; skew-x: 17.3; skew-y: 5.8; scale-x: 0.886; scale-y: 0.888; image: none; }
        frame 98 { x: 47.2; y: 39.6; skew-x: 17.5; skew-y: 9.8; scale-x: 0.873; scale-y: 0.874; }
        frame 99 { x: 48.1; y: 38.7; skew-x: 17.8; skew-y: 14; scale-x: 0.86; scale-y: 0.861; }
        frame 100 { x: 49.4; y: 38; skew-x: 18.1; skew-y: 18.1; scale-x: 0.848; scale-y: 0.848; }
        frame 101 { x: 48.1; y: 36.6; skew-x: 21; skew-y: 21; scale-x: 0.846; scale-y: 0.846; }
        frame 102 { x: 46.8; y: 35.4; skew-x: 24; skew-y: 24; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 45.5; y: 34.2; skew-x: 26.8; skew-y: 26.8; scale-x: 0.845; scale-y: 0.845; }
        frame 104 { x: 44.4; y: 33; skew-x: 29.9; skew-y: 29.9; scale-x: 0.846; scale-y: 0.846; }
        frame 105 { x: 37.6; skew-x: 23.8; skew-y: 23.8; scale-x: 0.843; scale-y: 0.843; }
        frame 106 { x: 30.9; skew-x: 17.8; skew-y: 17.8; scale-x: 0.842; scale-y: -10000; }
        frame 107 { x: 24.2; y: 33.3; skew-x: 11.8; skew-y: 11.8; scale-x: 0.841; scale-y: 0.842; }
        frame 108 { x: 17.7; y: 33.6; skew-x: 5.7; skew-y: 5.8; scale-x: -10000; scale-y: 0.841; }
        frame 109 { x: 11.9; y: 36.5; skew-x: -0.5; skew-y: -0.4; scale-x: 0.84; scale-y: -10000; }
        frame 110 { x: 6.1; y: 39.6; skew-x: -6.9; skew-y: -6.9; scale-x: 0.839; scale-y: 0.84; }
        frame 111 { x: 0.4; y: 43; skew-x: -13.4; skew-y: -13.4; scale-x: 0.838; scale-y: 0.839; }
        frame 112 { x: -4.8; y: 46.3; skew-x: -19.9; skew-y: -19.8; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: -12.1; y: 53; skew-x: -26.5; skew-y: -26.4; scale-x: 0.836; scale-y: 0.837; }
        frame 114 { x: -18.9; y: 60; skew-x: -33.2; skew-y: -33; scale-x: 0.835; scale-y: -10000; }
        frame 115 { x: -25.7; y: 67; skew-x: -39.8; skew-y: -39.5; scale-x: 0.834; scale-y: 0.836; }
        frame 116 { x: -32.2; y: 73.9; skew-x: -46.5; skew-y: -46.3; scale-x: 0.835; scale-y: -10000; }
        frame 117 { x: -39.7; y: 97; skew-x: -72.1; skew-y: -72.1; scale-x: 0.821; scale-y: 0.828; }
        frame 118 { x: -44.3; y: 118.5; skew-x: -97.4; skew-y: -97.7; scale-x: 0.809; scale-y: 0.82; }
        frame 119 { x: -50.6; y: 115.3; skew-x: -62.1; skew-y: -62.6; scale-x: 0.797; scale-y: 0.814; }
        frame 120 { x: -50.9; y: 110.5; skew-x: -26.7; skew-y: -27.5; scale-x: 0.787; scale-y: 0.809; }
        frame 121 { x: -45.4; y: 108; skew-x: 8.5; skew-y: 7.5; scale-x: 0.777; scale-y: 0.804; }
        frame 122 { x: -45.8; y: 107.1; skew-x: 6.8; skew-y: 6; scale-x: 0.786; scale-y: 0.81; }
        frame 123 { x: -46.2; y: 106.3; skew-x: 5.3; skew-y: 4.5; scale-x: 0.795; scale-y: 0.815; }
        frame 124 { x: -46.6; y: 105.5; skew-x: 3.8; skew-y: 3.1; scale-x: 0.804; scale-y: 0.821; }
        frame 125 { x: -46.9; y: 104.7; skew-x: 2.1; skew-y: 1.8; scale-x: 0.812; scale-y: 0.826; }
        frame 126 { x: -47.3; y: 103.8; skew-x: 0.5; skew-y: 0.3; scale-x: 0.821; scale-y: 0.832; }
        frame 127 { x: -47.7; y: 103; skew-x: -0.7; skew-y: -0.9; scale-x: 0.83; scale-y: 0.837; }
        frame 128 { x: -47.9; y: 102.3; skew-x: -2.4; skew-y: -2.2; scale-x: 0.839; scale-y: 0.843; }
        frame 129 { x: -48.4; y: 101.6; skew-x: -4; skew-y: -3.7; scale-x: 0.848; scale-y: 0.848; }
        frame 130 { x: -48; y: 104.8; skew-x: -4.4; skew-y: -4.4; scale-x: 0.828; scale-y: 0.834; }
        frame 131 { x: -47.7; y: 108; skew-x: -5.1; skew-y: -5.4; scale-x: 0.808; scale-y: 0.82; }
        frame 132 { x: 44; y: 43.7; skew-x: 0; skew-y: 0; scale-x: 0.85; scale-y: 0.85; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_UPPER; }
        frame 133 { x: 44.5; y: 43.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 134 { x: 45; y: 43; }
        frame 135 { x: 45.4; y: 42.6; }
        frame 136 { x: 45.8; y: 42.2; }
        frame 137 { x: 46.2; y: 41.4; skew-x: -2.2; skew-y: -2.2; }
        frame 138 { x: 46.6; y: 40.6; skew-x: -4.4; skew-y: -4.4; }
        frame 139 { x: 47.1; y: 39.9; skew-x: -6.7; skew-y: -6.7; scale-x: 0.849; scale-y: 0.849; }
        frame 140 { x: 47.7; y: 39.1; skew-x: -8.9; skew-y: -8.9; scale-x: 0.85; scale-y: 0.85; }
        frame 141 { x: 48; y: 39; skew-x: -10.2; skew-y: -10.2; scale-x: 0.849; scale-y: 0.849; }
        frame 142 { x: 48.4; y: -10000; skew-x: -11.4; skew-y: -11.4; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 48.6; skew-x: -12.7; skew-y: -12.7; }
        frame 144 { x: 49; y: 39; skew-x: -13.9; skew-y: -13.9; }
        frame 145 { x: 49.2; y: -10000; skew-x: -15.3; skew-y: -15.3; }
        frame 146 { x: 47.8; y: 39.7; skew-x: -13.2; skew-y: -13.2; }
        frame 147 { x: 46.3; y: 40.5; skew-x: -11.4; skew-y: -11.4; }
        frame 148 { x: 44.9; y: 41.3; skew-x: -9.4; skew-y: -9.4; }
        frame 149 { x: 43.4; y: 42.3; skew-x: -7.7; skew-y: -7.7; }
        frame 150 { x: 42; y: 43.1; skew-x: -5.8; skew-y: -5.8; }
        frame 151 { x: 40.9; y: 44.1; skew-x: -5.7; skew-y: -5.7; }
        frame 152 { x: 39.7; y: 45.3; skew-x: -10000; skew-y: -10000; }
        frame 153 { x: 38.6; y: 46.3; }
        frame 154 { x: 37.5; y: 47.4; skew-x: -5.8; skew-y: -5.8; }
        frame 155 { x: 38.6; y: 46.4; skew-x: -5.7; skew-y: -5.7; }
        frame 156 { x: 39.8; y: 45.4; skew-x: -10000; skew-y: -10000; }
        frame 157 { x: 40.9; y: 44.4; }
        frame 158 { x: 42; y: 43.4; }
        frame 159 { x: 43.2; y: 42.4; skew-x: -5.8; skew-y: -5.8; }
        frame 160 { x: 44.8; y: 41.5; skew-x: -3.2; skew-y: -3.2; }
        frame 161 { x: 46.1; y: 40.8; skew-x: -0.7; skew-y: -0.7; }
        frame 162 { x: 47.5; y: 40.3; skew-x: 1.5; skew-y: 1.5; scale-x: 0.848; scale-y: 0.848; }
        frame 163 { x: 49; y: 39.5; skew-x: 3.8; skew-y: 3.8; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 50.5; y: 38.8; skew-x: 6.4; skew-y: 6.4; }
        frame 165 { x: 50.3; y: 38.5; skew-x: 7; skew-y: 7; }
        frame 166 { x: 50.1; y: 38.2; skew-x: 7.5; skew-y: 7.5; }
        frame 167 { x: 50; y: 37.9; skew-x: 8.1; skew-y: 8.1; }
        frame 168 { x: 49.9; y: 37.6; skew-x: 8.8; skew-y: 8.8; scale-x: 0.847; scale-y: 0.847; }
        frame 169 { x: -10000; y: 37.3; skew-x: 9.4; skew-y: 9.4; scale-x: 0.848; scale-y: 0.848; }
        frame 170 { x: 48.2; y: 39.2; skew-x: 7.5; skew-y: 7.5; scale-x: 0.847; scale-y: 0.847; }
        frame 171 { x: 46.5; y: 41.1; skew-x: 5.8; skew-y: 5.8; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 44.9; y: 43.1; skew-x: 4; skew-y: 4; }
        frame 173 { x: 43.2; y: 45.1; skew-x: 2.4; skew-y: 2.4; }
        frame 174 { x: 43.4; y: 44.8; skew-x: 1.8; skew-y: 1.8; scale-x: 0.848; scale-y: 0.848; }
        frame 175 { x: 43.5; y: 44.5; skew-x: 1.3; skew-y: 1.3; scale-x: -10000; scale-y: -10000; }
        frame 176 { x: 43.6; y: 44.1; skew-x: 0.8; skew-y: 0.8; scale-x: 0.849; scale-y: 0.849; }
        frame 177 { x: 43.9; y: 44; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 178 { x: 44; y: 43.7; skew-x: 0; skew-y: 0; scale-x: 0.85; scale-y: 0.85; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 44.8; y: 42.8; skew-x: -2.4; skew-y: -2.4; }
        frame 181 { x: 45.6; y: 41.9; skew-x: -5; skew-y: -5; scale-x: 0.849; scale-y: 0.849; }
        frame 182 { x: 46.4; y: 41; skew-x: -7.7; skew-y: -7.7; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 47.3; y: 40.2; skew-x: -10.2; skew-y: -10.2; }
        frame 184 { x: 48.1; y: 39.4; skew-x: -12.7; skew-y: -12.7; }
        frame 185 { x: 49; y: 38.6; skew-x: -15.4; skew-y: -15.4; }
        frame 186 { x: 50; y: 37.6; skew-x: -18; skew-y: -18; scale-x: 0.848; scale-y: 0.848; }
        frame 187 { x: 51; y: 36.9; skew-x: -20.7; skew-y: -20.7; scale-x: 0.849; scale-y: 0.849; }
        frame 188 { x: 42.7; y: 40.9; skew-x: -29; skew-y: -29; scale-x: 0.847; scale-y: 0.847; }
        frame 189 { x: 34.8; y: 44.9; skew-x: -37.2; skew-y: -37.2; scale-x: 0.846; scale-y: 0.846; }
        frame 190 { x: 27.3; y: 48.9; skew-x: -45.5; skew-y: -45.5; scale-x: 0.847; scale-y: 0.847; }
        frame 191 { x: 26.4; y: 52.8; skew-x: -53.8; skew-y: -53.8; scale-x: 0.846; scale-y: 0.846; }
        frame 192 { x: 25.7; y: 56.6; skew-x: -62.1; skew-y: -62.1; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 25.6; y: 60.3; skew-x: -70.4; skew-y: -70.4; scale-x: 0.847; scale-y: 0.847; }
        frame 194 { x: -10000; y: 63.6; skew-x: -78.6; skew-y: -78.6; scale-x: 0.848; scale-y: 0.848; }
        frame 195 { x: 26.1; y: 61.5; skew-x: -68.8; skew-y: -68.8; scale-x: 0.847; scale-y: 0.847; }
        frame 196 { x: 27.1; y: 59.2; skew-x: -59; skew-y: -59; scale-x: 0.846; scale-y: 0.846; }
        frame 197 { x: 28.5; y: 56.5; skew-x: -49.1; skew-y: -49.1; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 30.5; y: 53.9; skew-x: -39.3; skew-y: -39.3; scale-x: 0.847; scale-y: 0.847; }
        frame 199 { x: 33; y: 51.2; skew-x: -29.5; skew-y: -29.4; scale-x: -10000; scale-y: -10000; }
        frame 200 { x: 36.3; y: 48.4; skew-x: -19.5; skew-y: -19.5; scale-x: 0.848; scale-y: 0.848; }
        frame 201 { x: 40; y: 46; skew-x: -9.7; skew-y: -9.7; scale-x: 0.849; scale-y: 0.849; }
        frame 202 { x: 44; y: 43.7; skew-x: 0; skew-y: 0; scale-x: 0.85; scale-y: 0.85; }
        frame 203 { x: 45.2; y: 42; skew-x: 17; skew-y: 1.8; scale-x: -10000; scale-y: 0.901; }
        frame 204 { x: 47.9; y: 37.9; skew-x: 26.3; skew-y: 11.1; scale-x: 0.848; scale-y: 0.9; }
        frame 205 { x: 51; y: 34.2; skew-x: 35.9; skew-y: 20.6; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 54.2; y: 31.3; skew-x: 45.4; skew-y: 30.1; scale-x: 0.847; scale-y: 0.899; }
        frame 207 { x: 57.6; y: 28.9; skew-x: 54.9; skew-y: 39.6; scale-x: -10000; scale-y: 0.898; }
        frame 208 { x: 61; y: 27.2; skew-x: 64.4; skew-y: 49.1; scale-y: -10000; }
        frame 209 { x: 64.3; y: 25.8; skew-x: 73.8; skew-y: 58.6; scale-y: 0.899; }
        frame 210 { x: 58.1; y: 29.7; skew-x: 65.3; skew-y: 50; scale-x: 0.846; scale-y: 0.897; }
        frame 211 { x: 53.6; y: 32.9; skew-x: 66.7; skew-y: 51.4; scale-x: 0.845; scale-y: 0.895; }
        frame 212 { x: 50.2; y: 35.5; skew-x: 73.9; skew-y: 58.6; scale-x: 0.844; scale-y: -10000; }
        frame 213 { x: 44.8; y: -10000; skew-x: 56.3; skew-y: 41; scale-x: -10000; scale-y: 0.891; }
        frame 214 { x: 38.2; y: 42.3; skew-x: 43.2; skew-y: 28; scale-x: 0.845; scale-y: 0.888; }
    }
    Track {
        source-name: "Zombie_ladder_innerarm_hand2";
        frame-count: 215;
        frame 0 { x: -4.6; y: 66.3; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_LADDER_INNERARM_HAND; }
        frame 1 { x: -4.1; y: 65.6; skew-x: 345.2; skew-y: 345.2; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 2 { x: -3.5; y: 64.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -3; y: 64.2; }
        frame 4 { x: -2.5; y: 63.4; }
        frame 5 { x: -1.9; y: 62.7; }
        frame 6 { x: -1.4; y: 62; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 7 { x: -2.1; y: 62.9; skew-x: 345.2; skew-y: 345.2; scale-x: 0.799; scale-y: 0.799; }
        frame 8 { x: -2.9; y: 63.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: -3.6; y: 64.7; }
        frame 10 { x: -4.4; y: 65.5; }
        frame 11 { x: -5.1; y: 66.4; }
        frame 12 { x: -5.9; y: 67.3; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 13 { x: -6; y: 68.3; skew-x: 343.7; skew-y: 343.7; scale-x: 0.799; scale-y: 0.799; }
        frame 14 { x: -6.1; y: 69.4; skew-x: 342.4; skew-y: 342.4; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: -6.2; y: 70.6; skew-x: 341; skew-y: 341; }
        frame 16 { x: -6.3; y: 71.6; skew-x: 339.7; skew-y: 339.7; }
        frame 17 { x: -6.4; y: 72.8; skew-x: 338.2; skew-y: 338.2; }
        frame 18 { x: -6.5; y: 73.8; skew-x: 336.9; skew-y: 336.9; scale-x: 0.8; scale-y: 0.8; }
        frame 19 { x: -6.2; y: 72.6; skew-x: 338.2; skew-y: 338.2; scale-x: 0.799; scale-y: 0.799; }
        frame 20 { x: -5.9; y: 71.3; skew-x: 339.7; skew-y: 339.7; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -5.6; y: 70; skew-x: 341; skew-y: 341; }
        frame 22 { x: -5.2; y: 68.7; skew-x: 342.4; skew-y: 342.4; }
        frame 23 { x: -4.9; y: 67.5; skew-x: 343.7; skew-y: 343.7; }
        frame 24 { x: -4.6; y: 66.3; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: -4; y: 65.8; skew-x: 345.2; skew-y: 345.2; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: -3.4; y: 65.3; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -2.7; y: 64.8; }
        frame 29 { x: -2.1; y: 64.3; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 30 { x: -2.4; y: 65; skew-x: 343.2; skew-y: 343.2; scale-x: 0.799; scale-y: 0.799; }
        frame 31 { x: -2.8; y: 65.8; skew-x: 341.2; skew-y: 341.2; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -3.1; y: 66.4; skew-x: 339.4; skew-y: 339.4; }
        frame 33 { x: -3.5; y: 67.2; skew-x: 337.4; skew-y: 337.4; scale-x: 0.8; scale-y: 0.8; }
        frame 34 { x: -10000; y: 68.6; skew-x: 335.5; skew-y: 335.5; scale-x: 0.799; scale-y: 0.799; }
        frame 35 { y: 70.2; skew-x: 333.7; skew-y: 333.7; scale-x: 0.798; scale-y: 0.798; }
        frame 36 { x: -3.4; y: 71.8; skew-x: 331.7; skew-y: 331.7; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: -10000; y: 73.3; skew-x: 329.7; skew-y: 329.7; }
        frame 38 { y: 75; skew-x: 327.8; skew-y: 327.8; scale-x: 0.799; scale-y: 0.799; }
        frame 39 { x: -4.9; y: 74; skew-x: 328.7; skew-y: 328.7; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: -6.4; y: 72.9; skew-x: 329.6; skew-y: 329.6; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: -7.9; y: 72; skew-x: 330.4; skew-y: 330.4; }
        frame 42 { x: -9.4; y: 71; skew-x: 331.2; skew-y: 331.2; }
        frame 43 { x: -11; y: 70; skew-x: 332.1; skew-y: 332.1; scale-x: 0.799; scale-y: 0.799; }
        frame 44 { x: -12.3; y: 72.1; skew-x: 332.2; skew-y: 332.2; scale-x: 0.798; scale-y: 0.798; }
        frame 45 { x: -13.7; y: 74.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: -15.1; y: 76.1; }
        frame 47 { x: -16.5; y: 78; skew-x: 332.1; skew-y: 332.1; scale-x: 0.799; scale-y: 0.799; }
        frame 48 { x: -15.7; y: 76.9; skew-x: 332.2; skew-y: 332.2; scale-x: 0.798; scale-y: 0.798; }
        frame 49 { x: -15; y: 75.8; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: -14.2; y: 74.6; }
        frame 51 { x: -13.5; y: 73.5; }
        frame 52 { x: -12.7; y: 72.3; skew-x: 332.1; skew-y: 332.1; scale-x: 0.799; scale-y: 0.799; }
        frame 53 { x: -11.3; y: 71.7; skew-x: 332.2; skew-y: 332.2; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: -9.9; y: 71; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: -8.5; y: 70.3; }
        frame 56 { x: -7.1; y: 69.7; }
        frame 57 { x: -5.7; y: 69; skew-x: 332.1; skew-y: 332.1; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: -10000; y: 68.2; skew-x: 333.7; skew-y: 333.7; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { y: 67.2; skew-x: 335.4; skew-y: 335.4; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: -5.6; y: 66.4; skew-x: 337; skew-y: 337; }
        frame 61 { x: -10000; y: 65.5; skew-x: 338.7; skew-y: 338.7; }
        frame 62 { y: 64.6; skew-x: 340.2; skew-y: 340.2; scale-x: 0.799; scale-y: 0.799; }
        frame 63 { x: -5; y: 68.1; skew-x: 338.4; skew-y: 338.4; scale-x: 0.798; scale-y: 0.798; }
        frame 64 { x: -4.4; y: 71.5; skew-x: 336.4; skew-y: 336.4; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -3.7; y: 75; skew-x: 334.7; skew-y: 334.7; scale-x: 0.797; scale-y: 0.797; }
        frame 66 { x: -3.1; y: 78.3; skew-x: 332.6; skew-y: 332.6; scale-x: 0.798; scale-y: 0.798; }
        frame 67 { x: -3.5; y: 75.8; skew-x: 335.2; skew-y: 335.2; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: -3.7; y: 73.3; skew-x: 337.7; skew-y: 337.7; }
        frame 69 { x: -4.1; y: 71; skew-x: 340.2; skew-y: 340.2; }
        frame 70 { x: -4.3; y: 68.6; skew-x: 342.7; skew-y: 342.7; scale-x: 0.799; scale-y: 0.799; }
        frame 71 { x: -4.6; y: 66.3; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: -2.5; y: 62; skew-x: 347.2; skew-y: 347.2; scale-x: 0.799; scale-y: 0.799; }
        frame 74 { x: -0.5; y: 57.7; skew-x: 349.2; skew-y: 349.2; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 1.5; y: 53.5; skew-x: 351.2; skew-y: 351.2; }
        frame 76 { x: 3.5; y: 49.3; skew-x: 353; skew-y: 353; scale-x: 0.8; scale-y: 0.8; }
        frame 77 { x: 6.2; y: 46.3; skew-x: 351.7; skew-y: 351.7; scale-x: 0.799; scale-y: 0.799; }
        frame 78 { x: 9; y: 43.4; skew-x: 350.4; skew-y: 350.4; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 11.6; y: 40.4; skew-x: 349; skew-y: 349; }
        frame 80 { x: 14.2; y: 37.4; skew-x: 347.5; skew-y: 347.5; }
        frame 81 { x: 10.4; y: 58.2; skew-x: 332.2; skew-y: 332.2; scale-x: 0.798; scale-y: 0.798; }
        frame 82 { x: 7.2; y: 79.6; skew-x: 316.7; skew-y: 316.7; scale-x: 0.797; scale-y: 0.797; }
        frame 83 { x: 4.6; y: 101; skew-x: 301.3; skew-y: 301.3; scale-x: 0.798; scale-y: 0.798; }
        frame 84 { x: 5; y: 102; skew-x: 300.1; skew-y: 300.1; scale-x: 0.796; scale-y: 0.796; }
        frame 85 { x: 5.4; y: 102.8; skew-x: 298.8; skew-y: 298.8; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 5.8; y: 103.7; skew-x: 297.6; skew-y: 297.6; }
        frame 87 { x: 6.3; y: 104.6; skew-x: 296.3; skew-y: 296.3; scale-x: 0.797; scale-y: 0.797; }
        frame 88 { x: 5.2; y: 101.6; skew-x: 299.3; skew-y: 299.3; scale-x: 0.796; scale-y: 0.796; }
        frame 89 { x: 4; y: 98.8; skew-x: 302.1; skew-y: 302.1; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 3; y: 95.8; skew-x: 305.1; skew-y: 305.1; }
        frame 91 { x: 1.9; y: 92.8; skew-x: 308.1; skew-y: 308.1; scale-x: 0.797; scale-y: 0.797; }
        frame 92 { x: -0; y: 86.1; skew-x: 317.4; skew-y: 317.4; scale-x: 0.796; scale-y: 0.796; }
        frame 93 { x: -1.7; y: 79.3; skew-x: 326.6; skew-y: 326.6; scale-x: 0.797; scale-y: 0.797; }
        frame 94 { x: -3.2; y: 72.7; skew-x: 335.9; skew-y: 335.9; scale-x: 0.798; scale-y: 0.798; }
        frame 95 { x: -4.6; y: 66.3; skew-x: 345; skew-y: 345; scale-x: 0.8; scale-y: 0.8; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
        frame 203 { cel: 0; }
        frame 204 { x: -1.2; y: 54.3; skew-x: 354.5; skew-y: 354.5; scale-x: 0.799; scale-y: 0.799; cel: -10000; }
        frame 205 { x: 2; y: 42.4; skew-x: 363.8; skew-y: 363.8; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 5.6; y: 30.8; skew-x: 373.3; skew-y: 373.3; scale-x: 0.798; scale-y: 0.798; }
        frame 207 { x: 9.3; y: 19.3; skew-x: 382.8; skew-y: 382.8; scale-x: 0.797; scale-y: 0.797; }
        frame 208 { x: 13; y: 8.3; skew-x: 392.3; skew-y: 392.3; scale-x: -10000; scale-y: -10000; }
        frame 209 { x: 16.7; y: -2.3; skew-x: 401.8; skew-y: 401.8; }
        frame 210 { x: 5; y: 11.9; skew-x: 388.1; skew-y: 388.1; scale-x: 0.796; scale-y: 0.796; }
        frame 211 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 212 { cel: -10000; }
    }
}
