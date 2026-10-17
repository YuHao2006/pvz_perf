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
        frame 25 { x: -39.7999992; y: 70.8000031; cel: 0; }
        frame 26 { x: -39; y: -10000; cel: -10000; }
        frame 27 { x: -38.0999985; }
        frame 28 { x: -37.2999992; }
        frame 29 { x: -36.5; }
        frame 30 { x: -33.5999985; }
        frame 31 { x: -30.7000008; }
        frame 32 { x: -27.8999996; }
        frame 33 { x: -25; }
        frame 34 { x: -21.1000004; }
        frame 35 { x: -17.2000008; }
        frame 36 { x: -13.1999998; }
        frame 37 { x: -9.30000019; }
        frame 38 { x: -5.4000001; }
        frame 39 { x: -4.5999999; }
        frame 40 { x: -3.9000001; }
        frame 41 { x: -3.0999999; }
        frame 42 { x: -2.4000001; }
        frame 43 { x: -1.60000002; }
        frame 44 { x: -10000; }
        frame 48 { x: -0.600000024; }
        frame 49 { x: 0.200000003; }
        frame 50 { x: 1.20000005; }
        frame 51 { x: 2.0999999; }
        frame 52 { x: 3; }
        frame 53 { x: 5.19999981; }
        frame 54 { x: 7.30000019; }
        frame 55 { x: 9.60000038; }
        frame 56 { x: 11.6999998; }
        frame 57 { x: 13.8999996; }
        frame 58 { x: 15.8999996; }
        frame 59 { x: 18; }
        frame 60 { x: 20.1000004; }
        frame 61 { x: 22.2000008; }
        frame 62 { x: 24.2000008; }
        frame 63 { x: 24.7000008; }
        frame 64 { x: 25.2000008; }
        frame 65 { x: 25.6000004; }
        frame 66 { x: 26.1000004; }
        frame 67 { x: -10000; }
        frame 72 { cel: -1; }
        frame 73 { cel: -10000; }
        frame 132 { x: -39.7999992; cel: 0; }
        frame 133 { x: -39; cel: -10000; }
        frame 134 { x: -38.0999985; }
        frame 135 { x: -37.2999992; }
        frame 136 { x: -36.5; }
        frame 137 { x: -33.5999985; }
        frame 138 { x: -30.7000008; }
        frame 139 { x: -27.8999996; }
        frame 140 { x: -25; }
        frame 141 { x: -21.1000004; }
        frame 142 { x: -17.2000008; }
        frame 143 { x: -13.1999998; }
        frame 144 { x: -9.30000019; }
        frame 145 { x: -5.4000001; }
        frame 146 { x: -4.5999999; }
        frame 147 { x: -3.9000001; }
        frame 148 { x: -3.0999999; }
        frame 149 { x: -2.4000001; }
        frame 150 { x: -1.60000002; }
        frame 151 { x: -10000; }
        frame 155 { x: -0.600000024; }
        frame 156 { x: 0.200000003; }
        frame 157 { x: 1.20000005; }
        frame 158 { x: 2.0999999; }
        frame 159 { x: 3; }
        frame 160 { x: 5.19999981; }
        frame 161 { x: 7.30000019; }
        frame 162 { x: 9.60000038; }
        frame 163 { x: 11.6999998; }
        frame 164 { x: 13.8999996; }
        frame 165 { x: 15.8999996; }
        frame 166 { x: 18; }
        frame 167 { x: 20.1000004; }
        frame 168 { x: 22.2000008; }
        frame 169 { x: 24.2000008; }
        frame 170 { x: 24.7000008; }
        frame 171 { x: 25.2000008; }
        frame 172 { x: 25.6000004; }
        frame 173 { x: 26.1000004; }
        frame 174 { x: -10000; }
        frame 179 { cel: -1; }
        frame 180 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_innererarm_hand";
        frame-count: 215;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 132 { x: 18.7999992; y: 83.5999985; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_ZOMBIE_INNERARM_HAND; }
        frame 133 { x: 18.5; y: 82.8000031; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 134 { x: 18.1000004; y: 82.1999969; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 135 { x: 17.7000008; y: 81.5; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 136 { x: 17.3999996; y: 80.8000031; skew-x: -1.60000002; skew-y: -1.60000002; scale-x: -10000; scale-y: -10000; }
        frame 137 { x: 16.8999996; y: 77.8000031; skew-x: 0.5; skew-y: 0.5; }
        frame 138 { x: 16.3999996; y: 74.8000031; skew-x: 3; skew-y: 3; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 139 { x: 15.8000002; y: 71.8000031; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 15.1999998; y: 68.8000031; skew-x: 7.80000019; skew-y: 7.80000019; }
        frame 141 { x: 14.6999998; y: 67.8000031; skew-x: 9.60000038; skew-y: 9.60000038; }
        frame 142 { x: 14.3999996; y: 67; skew-x: 11.5; skew-y: 11.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 143 { x: 14; y: 66.0999985; skew-x: 13.5; skew-y: 13.5; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 13.6999998; y: 65.1999969; skew-x: 15.3000002; skew-y: 15.3000002; }
        frame 145 { x: 13.3000002; y: 64.3000031; skew-x: 17.3999996; skew-y: 17.3999996; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 146 { x: 14.6999998; y: 68.1999969; skew-x: 12.3000002; skew-y: 12.3000002; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 147 { x: 16.2999992; y: 72.3000031; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 17.7000008; y: 76.5; skew-x: 2.0999999; skew-y: 2.0999999; }
        frame 149 { x: 19.3999996; y: 80.6999969; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 150 { x: 21.1000004; y: 84.9000015; skew-x: -7.80000019; skew-y: -7.80000019; scale-x: -10000; scale-y: -10000; }
        frame 151 { x: 20.7000008; y: 86.5999985; skew-x: -7.69999981; skew-y: -7.69999981; }
        frame 152 { x: 20.2000008; y: 88.3000031; skew-x: -10000; skew-y: -10000; }
        frame 153 { x: 19.7000008; y: 90.0999985; }
        frame 154 { x: 19.1000004; y: 91.9000015; skew-x: -7.80000019; skew-y: -7.80000019; }
        frame 155 { x: 20.2000008; y: 90; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 156 { x: 21.2000008; y: 88; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 22.2000008; y: 86; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 158 { x: 23.2999992; y: 84.0999985; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 159 { x: 24.2999992; y: 82; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 160 { x: 25.7999992; y: 80.3000031; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 161 { x: 27.2999992; y: 78.6999969; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 162 { x: 28.8999996; y: 77; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 30.3999996; y: 75.3000031; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 164 { x: 31.7999992; y: 73.6999969; skew-x: -5.30000019; skew-y: -5.30000019; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 165 { x: 31.2000008; y: 73.8000031; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: -10000; scale-y: -10000; }
        frame 166 { x: 30.5; y: -10000; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 167 { x: 29.7999992; y: 74; skew-x: -3.5; skew-y: -3.5; scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 168 { x: 29.1000004; y: 74.0999985; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 28.3999996; y: 74.1999969; skew-x: -2.5; skew-y: -2.5; }
        frame 170 { x: 27.2000008; y: 78; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 171 { x: 25.8999996; y: 82.0999985; skew-x: 0.5; skew-y: 0.5; }
        frame 172 { x: 24.7000008; y: 86; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 173 { x: 23.5; y: 90; skew-x: 3.9000001; skew-y: 3.9000001; }
        frame 174 { x: 22.5; y: 88.5999985; skew-x: 3; skew-y: 3; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 175 { x: 21.5; y: 87.3000031; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 176 { x: 20.6000004; y: 86.0999985; skew-x: 1.5; skew-y: 1.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 177 { x: 19.6000004; y: 84.8000031; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 178 { x: 18.7999992; y: 83.5999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 20.8999996; y: 81.8000031; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 181 { x: 22.8999996; y: 80.0999985; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 24.8999996; y: 78.3000031; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 183 { x: 26.8999996; y: 76.6999969; skew-x: -7.19999981; skew-y: -7.19999981; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: 28.8999996; y: 75; skew-x: -8.89999962; skew-y: -8.89999962; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 185 { x: 31; y: 73.3000031; skew-x: -10.6999998; skew-y: -10.6999998; scale-x: -10000; scale-y: -10000; }
        frame 186 { x: 33; y: 71.5999985; skew-x: -12.6999998; skew-y: -12.6999998; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 187 { x: 35; y: 70; skew-x: -14.5; skew-y: -14.5; scale-x: -10000; scale-y: -10000; }
        frame 188 { x: 37.0999985; y: 71.3000031; skew-x: -25.7000008; skew-y: -25.7000008; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 189 { x: 39.7999992; y: 72.8000031; skew-x: -37.2000008; skew-y: -37.2000008; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 190 { x: 42.7999992; y: 74.5; skew-x: -48.5; skew-y: -48.5; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 191 { x: 44.9000015; y: 72.8000031; skew-x: -59.7999992; skew-y: -59.7999992; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 192 { x: 47.4000015; y: 71.1999969; skew-x: -71.0999985; skew-y: -71.0999985; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 193 { x: 50.4000015; y: 69.3000031; skew-x: -82.5999985; skew-y: -82.5999985; scale-x: -10000; scale-y: -10000; }
        frame 194 { x: 53.7999992; y: 67.1999969; skew-x: -93.6999969; skew-y: -93.6999969; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 195 { x: 49; y: 71.5999985; skew-x: -82.0999985; skew-y: -82.0999985; scale-x: -10000; scale-y: -10000; }
        frame 196 { x: 44.5; y: 75.6999969; skew-x: -70.3000031; skew-y: -70.3000031; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 197 { x: 40.5999985; y: 79.5999985; skew-x: -58.5999985; skew-y: -58.5999985; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 37.2000008; y: 83.3000031; skew-x: -46.7999992; skew-y: -46.7999992; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 199 { x: 32; y: 83.1999969; skew-x: -35; skew-y: -35; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 200 { x: 27.2000008; y: 83.0999985; skew-x: -23.2000008; skew-y: -23.2000008; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 201 { x: 22.7999992; y: -10000; skew-x: -11.5; skew-y: -11.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 202 { x: 18.7999992; y: 83.5999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 204 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_innerleg_foot";
        frame-count: 215;
        frame 0 { x: 34.0999985; y: 110; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.75; scale-y: 0.75; image: IMAGE_REANIM_ZOMBIE_LADDER_INNERLEG_FOOT; }
        frame 1 { x: -10000; y: 110.199997; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 34.2000008; y: 110.300003; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 3 { x: 34.2999992; y: 110.599998; skew-x: 2; skew-y: 2; }
        frame 4 { x: 34.4000015; y: 110.699997; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 5 { x: 34.5; y: 110.800003; skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 6 { x: -10000; y: 111.099998; skew-x: 0; skew-y: 0; }
        frame 7 { x: 34.5999985; y: 111; skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 8 { x: 34.7999992; y: 110.699997; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 9 { x: -10000; y: 110.599998; skew-x: 2; skew-y: 2; }
        frame 10 { x: 34.9000015; y: 110.300003; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 11 { x: 35; y: 110.199997; skew-x: 3.5; skew-y: 3.5; }
        frame 12 { x: 35.0999985; y: 110; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 13 { x: 35.2000008; y: 109.800003; skew-x: 4.80000019; skew-y: 4.80000019; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 14 { x: 35.4000015; y: 109.599998; skew-x: 5.5; skew-y: 5.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: -10000; y: 109.5; skew-x: 6; skew-y: 6; }
        frame 16 { x: 35.5; y: 109.300003; skew-x: 6.80000019; skew-y: 6.80000019; }
        frame 17 { x: 35.5999985; y: 109.199997; skew-x: 7.30000019; skew-y: 7.30000019; }
        frame 18 { x: 35.7000008; y: 108.900002; skew-x: 8; skew-y: 8; scale-x: 0.75; scale-y: 0.75; }
        frame 19 { x: 35.5; y: 109.199997; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 20 { x: 35.0999985; y: 109.300003; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 34.9000015; y: 109.5; skew-x: 6; skew-y: 6; }
        frame 22 { x: 34.5999985; y: 109.599998; skew-x: 5.5; skew-y: 5.5; }
        frame 23 { x: 34.4000015; y: 109.800003; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 24 { x: 34.0999985; y: 110; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.75; scale-y: 0.75; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 35; y: 109.900002; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 27 { x: 36; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 36.9000015; }
        frame 29 { x: 37.7999992; y: 110; scale-x: 0.75; scale-y: 0.75; }
        frame 30 { x: 39.5; y: 110.400002; skew-x: 0; skew-y: 0; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 31 { x: 41.5; y: 110.900002; skew-x: -4.19999981; skew-y: -4.19999981; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 43.4000015; y: 111.5; skew-x: -8.39999962; skew-y: -8.39999962; }
        frame 33 { x: 45.5; y: 112.099998; skew-x: -12.8999996; skew-y: -12.8999996; }
        frame 34 { x: 48; y: -10000; skew-x: -14.6999998; skew-y: -14.6999998; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 35 { x: 50.5; skew-x: -16.5; skew-y: -16.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 36 { x: 53; y: 112.300003; skew-x: -18.3999996; skew-y: -18.3999996; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 55.5; y: -10000; skew-x: -20.2000008; skew-y: -20.2000008; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 38 { x: 58.0999985; y: 112.400002; skew-x: -22.1000004; skew-y: -22.1000004; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 39 { x: 59.2999992; y: 113.199997; skew-x: -26.7000008; skew-y: -26.7000008; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 40 { x: 60.5; y: 114.099998; skew-x: -31.2000008; skew-y: -31.2000008; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 41 { x: 62; y: 114.800003; skew-x: -35.7000008; skew-y: -35.7000008; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 63.5; y: 115.599998; skew-x: -40.2999992; skew-y: -40.2999992; }
        frame 43 { x: 65; y: 116.300003; skew-x: -44.9000015; skew-y: -44.9000015; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 44 { x: 65.1999969; y: 117.300003; skew-x: -49; skew-y: -49; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 45 { x: 65.3000031; y: 118.300003; skew-x: -53; skew-y: -53; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 65.5; y: 119.199997; skew-x: -57.0999985; skew-y: -57.0999985; }
        frame 47 { x: 65.8000031; y: 120; skew-x: -61.0999985; skew-y: -61.0999985; }
        frame 48 { x: 65.6999969; y: 120.300003; skew-x: -62.7999992; skew-y: -62.7999992; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 49 { x: 65.5; y: 120.599998; skew-x: -64.4000015; skew-y: -64.4000015; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 50 { x: 65.1999969; y: 121; skew-x: -66.0999985; skew-y: -66.0999985; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: 65; y: 121.300003; skew-x: -67.8000031; skew-y: -67.8000031; }
        frame 52 { x: 64.8000031; y: 121.5; skew-x: -69.3000031; skew-y: -69.3000031; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 53 { x: 61.5999985; y: 120.800003; skew-x: -68.4000015; skew-y: -68.4000015; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 54 { x: 58.2999992; y: 120.300003; skew-x: -67.5999985; skew-y: -67.5999985; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 55 { x: 54.9000015; y: 119.599998; skew-x: -66.5999985; skew-y: -66.5999985; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 56 { x: 50.7999992; y: 120.699997; skew-x: -69.0999985; skew-y: -69.0999985; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 46.5; y: 121.900002; skew-x: -71.5999985; skew-y: -71.5999985; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 58 { x: 42.5; y: 121.099998; skew-x: -63.7999992; skew-y: -63.7999992; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 59 { x: 38.5999985; y: 120.199997; skew-x: -55.7999992; skew-y: -55.7999992; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 60 { x: 35; y: 119.300003; skew-x: -48; skew-y: -48; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 31.7000008; y: 118; skew-x: -40; skew-y: -40; scale-x: 0.741999984; scale-y: 0.741999984; }
        frame 62 { x: 28.7000008; y: 117; skew-x: -32.2000008; skew-y: -32.2000008; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 63 { x: 29.7999992; y: 115.099998; skew-x: -23; skew-y: -23; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 64 { x: 31.3999996; y: 113.300003; skew-x: -13.6999998; skew-y: -13.6999998; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 65 { x: 33.0999985; y: 111.5; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 66 { x: 35.0999985; y: 110; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.75; scale-y: 0.75; }
        frame 67 { x: 35; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 68 { x: 34.7999992; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 34.5; }
        frame 70 { x: 34.4000015; }
        frame 71 { x: 34.0999985; scale-x: 0.75; scale-y: 0.75; }
        frame 72 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 34.5999985; y: 109.199997; skew-x: 6; skew-y: 6; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 74 { x: 35.0999985; y: 108.699997; skew-x: 7.80000019; skew-y: 7.80000019; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 35.7000008; y: 108; skew-x: 9.80000019; skew-y: 9.80000019; }
        frame 76 { x: 36.2999992; y: 107.5; skew-x: 11.6000004; skew-y: 11.6000004; }
        frame 77 { x: 36.5999985; y: 107; skew-x: 13; skew-y: 13; }
        frame 78 { x: 37; y: 106.5; skew-x: 14.5; skew-y: 14.5; }
        frame 79 { x: 37.4000015; y: 106; skew-x: 16; skew-y: 16; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 80 { x: 37.5999985; y: 105.5; skew-x: 17.6000004; skew-y: 17.6000004; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 81 { x: 36.9000015; y: 107; skew-x: 13.1000004; skew-y: 13.1000004; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 36; y: 108.400002; skew-x: 8.60000038; skew-y: 8.60000038; }
        frame 83 { x: 35.0999985; y: 110; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.75; scale-y: 0.75; }
        frame 84 { x: 35.2999992; y: 109.300003; skew-x: 6.30000019; skew-y: 6.30000019; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 85 { x: 35.5; y: 108.800003; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 35.7999992; y: 108.099998; skew-x: 10.5; skew-y: 10.5; }
        frame 87 { x: 36; y: 107.5; skew-x: 12.6999998; skew-y: 12.6999998; }
        frame 88 { x: 35.7000008; y: 107.800003; skew-x: 11.1000004; skew-y: 11.1000004; }
        frame 89 { x: 35.5; y: 108.199997; skew-x: 9.80000019; skew-y: 9.80000019; }
        frame 90 { x: 35.4000015; y: 108.699997; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 91 { x: 35.2000008; y: 109; skew-x: 7; skew-y: 7; }
        frame 92 { x: 35; y: 109.300003; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 93 { x: 34.7000008; y: 109.5; skew-x: 5.5; skew-y: 5.5; }
        frame 94 { x: 34.5; y: 109.800003; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 95 { x: 34.0999985; y: 110; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.75; scale-y: 0.75; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { y: 110.300003; skew-x: 1.10000002; skew-y: 1.10000002; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 98 { x: 34.2000008; y: 110.5; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 34.2999992; y: 110.900002; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 100 { x: 34.5; y: 111.400002; skew-x: -7.9000001; skew-y: -7.9000001; }
        frame 101 { x: 34; y: 111.800003; skew-x: -10.1999998; skew-y: -10.1999998; }
        frame 102 { x: 33.5; y: 112.199997; skew-x: -12.3999996; skew-y: -12.3999996; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 103 { x: 33.0999985; y: 112.5; skew-x: -14.6999998; skew-y: -14.6999998; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 32.7999992; y: 113; skew-x: -17.2000008; skew-y: -17.2000008; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 105 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 106 { scale-x: -10000; scale-y: -10000; }
        frame 107 { scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 108 { scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 109 { x: 32.4000015; y: 113.599998; skew-x: -21.2000008; skew-y: -21.2000008; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 110 { x: 32.0999985; y: 114.099998; skew-x: -25.5; skew-y: -25.5; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 31.7999992; y: 114.699997; skew-x: -29.7000008; skew-y: -29.7000008; }
        frame 112 { x: 31.6000004; y: 115.199997; skew-x: -34; skew-y: -34; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 113 { x: 33.5999985; y: 114.800003; skew-x: -48.5; skew-y: -48.5; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 114 { x: 36.5; y: 113.800003; skew-x: -62.7999992; skew-y: -62.7999992; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 40.2000008; y: 112.5; skew-x: -77.4000015; skew-y: -77.4000015; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 116 { x: 44.4000015; y: 110.5; skew-x: -91.6999969; skew-y: -91.6999969; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: 43.2999992; y: 102.5; skew-x: -111.199997; skew-y: -111.199997; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 118 { x: 42.4000015; y: 92.5999985; skew-x: -131.100006; skew-y: -131.100006; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 43.9000015; y: 91.8000031; skew-x: -136.800003; skew-y: -136.800003; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 120 { x: 45.2999992; y: 91; skew-x: -142.800003; skew-y: -142.800003; scale-x: 0.741999984; scale-y: 0.741999984; }
        frame 121 { x: 46.5999985; y: 90.1999969; skew-x: -148.5; skew-y: -148.5; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 122 { x: 47; y: 99.3000031; skew-x: -144; skew-y: -143; scale-x: -10000; scale-y: 0.744000018; }
        frame 123 { x: 47.2999992; y: 108.300003; skew-x: -139.300003; skew-y: -137.300003; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 124 { x: 47.5; y: 117.199997; skew-x: -134.800003; skew-y: -131.800003; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 125 { x: 47.7999992; y: 126.099998; skew-x: -130.199997; skew-y: -126.199997; scale-x: 0.748000026; scale-y: 0.749000013; }
        frame 126 { x: 46; y: 133.600006; skew-x: -98.5999985; skew-y: -94.5999985; scale-x: -10000; scale-y: 0.748000026; }
        frame 127 { x: 45.4000015; y: 131.600006; skew-x: -105; skew-y: -100.900002; scale-x: 0.746999979; scale-y: -10000; }
        frame 128 { x: 45; y: 129.399994; skew-x: -111.5; skew-y: -107.5; scale-x: -10000; }
        frame 129 { x: 45.2999992; y: 130.899994; skew-x: -107.199997; skew-y: -103.199997; scale-y: 0.746999979; }
        frame 130 { x: 45.5; y: 132.300003; skew-x: -102.900002; skew-y: -98.9000015; scale-y: 0.748000026; }
        frame 131 { x: 46; y: 133.600006; skew-x: -98.5999985; skew-y: -94.5999985; scale-x: 0.748000026; scale-y: -10000; }
        frame 132 { x: 34.0999985; y: 110; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.75; scale-y: 0.75; }
        frame 133 { x: 35; y: 109.900002; skew-x: -10000; skew-y: -10000; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 134 { x: 36; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 36.9000015; }
        frame 136 { x: 37.7999992; y: 110; scale-x: 0.75; scale-y: 0.75; }
        frame 137 { x: 39.5; y: 110.400002; skew-x: 0; skew-y: 0; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 138 { x: 41.5; y: 110.900002; skew-x: -4.19999981; skew-y: -4.19999981; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 43.4000015; y: 111.5; skew-x: -8.39999962; skew-y: -8.39999962; }
        frame 140 { x: 45.5; y: 112.099998; skew-x: -12.8999996; skew-y: -12.8999996; }
        frame 141 { x: 48; y: -10000; skew-x: -14.6999998; skew-y: -14.6999998; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 142 { x: 50.5; skew-x: -16.5; skew-y: -16.5; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 143 { x: 53; y: 112.300003; skew-x: -18.3999996; skew-y: -18.3999996; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 55.5; y: -10000; skew-x: -20.2000008; skew-y: -20.2000008; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 145 { x: 58.0999985; y: 112.400002; skew-x: -22.1000004; skew-y: -22.1000004; scale-x: 0.746999979; scale-y: 0.746999979; }
        frame 146 { x: 59.2999992; y: 113.199997; skew-x: -26.7000008; skew-y: -26.7000008; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 147 { x: 60.5; y: 114.099998; skew-x: -31.2000008; skew-y: -31.2000008; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 148 { x: 62; y: 114.800003; skew-x: -35.7000008; skew-y: -35.7000008; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 63.5; y: 115.599998; skew-x: -40.2999992; skew-y: -40.2999992; }
        frame 150 { x: 65; y: 116.300003; skew-x: -44.9000015; skew-y: -44.9000015; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 151 { x: 65.1999969; y: 117.300003; skew-x: -49; skew-y: -49; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 152 { x: 65.3000031; y: 118.300003; skew-x: -53; skew-y: -53; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 65.5; y: 119.199997; skew-x: -57.0999985; skew-y: -57.0999985; }
        frame 154 { x: 65.8000031; y: 120; skew-x: -61.0999985; skew-y: -61.0999985; }
        frame 155 { x: 65.6999969; y: 120.300003; skew-x: -62.7999992; skew-y: -62.7999992; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 156 { x: 65.5; y: 120.599998; skew-x: -64.4000015; skew-y: -64.4000015; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 157 { x: 65.1999969; y: 121; skew-x: -66.0999985; skew-y: -66.0999985; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 65; y: 121.300003; skew-x: -67.8000031; skew-y: -67.8000031; }
        frame 159 { x: 64.8000031; y: 121.5; skew-x: -69.3000031; skew-y: -69.3000031; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 160 { x: 61.5999985; y: 120.800003; skew-x: -68.4000015; skew-y: -68.4000015; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 161 { x: 58.2999992; y: 120.300003; skew-x: -67.5999985; skew-y: -67.5999985; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 162 { x: 54.9000015; y: 119.599998; skew-x: -66.5999985; skew-y: -66.5999985; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 163 { x: 50.7999992; y: 120.699997; skew-x: -69.0999985; skew-y: -69.0999985; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 46.5; y: 121.900002; skew-x: -71.5999985; skew-y: -71.5999985; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 165 { x: 42.5; y: 121.099998; skew-x: -63.7999992; skew-y: -63.7999992; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 166 { x: 38.5999985; y: 120.199997; skew-x: -55.7999992; skew-y: -55.7999992; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 167 { x: 35; y: 119.300003; skew-x: -48; skew-y: -48; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 31.7000008; y: 118; skew-x: -40; skew-y: -40; scale-x: 0.741999984; scale-y: 0.741999984; }
        frame 169 { x: 28.7000008; y: 117; skew-x: -32.2000008; skew-y: -32.2000008; scale-x: 0.742999971; scale-y: 0.742999971; }
        frame 170 { x: 29.7999992; y: 115.099998; skew-x: -23; skew-y: -23; scale-x: 0.744000018; scale-y: 0.744000018; }
        frame 171 { x: 31.3999996; y: 113.300003; skew-x: -13.6999998; skew-y: -13.6999998; scale-x: 0.745999992; scale-y: 0.745999992; }
        frame 172 { x: 33.0999985; y: 111.5; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 173 { x: 35.0999985; y: 110; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.75; scale-y: 0.75; }
        frame 174 { x: 35; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 175 { x: 34.7999992; scale-x: -10000; scale-y: -10000; }
        frame 176 { x: 34.5; }
        frame 177 { x: 34.4000015; }
        frame 178 { x: 34.0999985; scale-x: 0.75; scale-y: 0.75; }
        frame 179 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 34.5999985; y: 109.199997; skew-x: 6; skew-y: 6; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 181 { x: 35.0999985; y: 108.699997; skew-x: 7.80000019; skew-y: 7.80000019; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 35.7000008; y: 108; skew-x: 9.80000019; skew-y: 9.80000019; }
        frame 183 { x: 36.2999992; y: 107.5; skew-x: 11.6000004; skew-y: 11.6000004; }
        frame 184 { x: 36.5999985; y: 107; skew-x: 13; skew-y: 13; }
        frame 185 { x: 37; y: 106.5; skew-x: 14.5; skew-y: 14.5; }
        frame 186 { x: 37.4000015; y: 106; skew-x: 16; skew-y: 16; scale-x: 0.748000026; scale-y: 0.748000026; }
        frame 187 { x: 37.5999985; y: 105.5; skew-x: 17.6000004; skew-y: 17.6000004; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 188 { x: 36.9000015; y: 107; skew-x: 13.1000004; skew-y: 13.1000004; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 36; y: 108.400002; skew-x: 8.60000038; skew-y: 8.60000038; }
        frame 190 { x: 35.0999985; y: 110; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.75; scale-y: 0.75; }
        frame 191 { x: 35.2999992; y: 109.300003; skew-x: 6.30000019; skew-y: 6.30000019; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 192 { x: 35.5; y: 108.800003; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 35.7999992; y: 108.099998; skew-x: 10.5; skew-y: 10.5; }
        frame 194 { x: 36; y: 107.5; skew-x: 12.6999998; skew-y: 12.6999998; }
        frame 195 { x: 35.7000008; y: 107.800003; skew-x: 11.1000004; skew-y: 11.1000004; }
        frame 196 { x: 35.5; y: 108.199997; skew-x: 9.80000019; skew-y: 9.80000019; }
        frame 197 { x: 35.4000015; y: 108.699997; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 198 { x: 35.2000008; y: 109; skew-x: 7; skew-y: 7; }
        frame 199 { x: 35; y: 109.300003; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 200 { x: 34.7000008; y: 109.5; skew-x: 5.5; skew-y: 5.5; }
        frame 201 { x: 34.5; y: 109.800003; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 202 { x: 34.0999985; y: 110; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.75; scale-y: 0.75; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 204 { x: 34.4000015; y: 109.699997; skew-x: 5; skew-y: 5; scale-x: 0.749000013; scale-y: 0.749000013; }
        frame 205 { x: 34.5; y: 109.400002; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 34.7000008; y: 109.199997; skew-x: 6.5999999; skew-y: 6.5999999; }
        frame 207 { x: 35; y: 109.099998; skew-x: 7.5; skew-y: 7.5; }
        frame 208 { x: 35.0999985; y: 108.800003; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 209 { x: 35.4000015; y: 108.699997; skew-x: 9.10000038; skew-y: 9.10000038; }
        frame 210 { x: 35.0999985; y: 109.099998; skew-x: 7.80000019; skew-y: 7.80000019; }
        frame 211 { x: 34.7000008; y: 109.300003; skew-x: 6.5999999; skew-y: 6.5999999; }
        frame 212 { x: 34.5; y: 109.699997; skew-x: 5.5; skew-y: 5.5; }
        frame 213 { x: 34.0999985; y: 110; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.75; scale-y: 0.75; }
        frame 214 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_innerarm_hand";
        frame-count: 215;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 96 { x: 6.9000001; y: 62.2000008; skew-x: 60.4000015; skew-y: 60.4000015; scale-x: 0.799000025; scale-y: 0.799000025; cel: 0; image: IMAGE_REANIM_ZOMBIE_INNERARM_HAND; }
        frame 97 { x: 11.3000002; y: 63.9000015; skew-x: 53.9000015; skew-y: 53.9000015; scale-x: 0.796999991; scale-y: 0.796999991; cel: -10000; image: none; }
        frame 98 { x: 15.5; y: 65.6999969; skew-x: 47.5999985; skew-y: 47.5999985; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 19.8999996; y: 67.6999969; skew-x: 41.0999985; skew-y: 41.0999985; }
        frame 100 { x: 24.1000004; y: 69.8000031; skew-x: 34.5999985; skew-y: 34.5999985; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 101 { x: 24.8999996; y: 70.6999969; skew-x: 24.6000004; skew-y: 24.6000004; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 102 { x: 26; y: 71.8000031; skew-x: 14.6000004; skew-y: 14.6000004; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 27.1000004; y: 73.1999969; skew-x: 4.5999999; skew-y: 4.5999999; }
        frame 104 { x: 28.6000004; y: 74.8000031; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 105 { x: 26.8999996; y: 75.5; skew-x: -14; skew-y: -14; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 106 { x: 25.3999996; y: 76.3000031; skew-x: -23; skew-y: -23; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 24.1000004; y: 77.3000031; skew-x: -32; skew-y: -32; }
        frame 108 { x: 23.2000008; y: 78.3000031; skew-x: -41; skew-y: -41; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 109 { x: 22.6000004; y: 79.5; skew-x: -50; skew-y: -50; scale-x: -10000; scale-y: -10000; }
        frame 110 { x: 22.1000004; y: 80.5; skew-x: -59; skew-y: -59; }
        frame 111 { x: -10000; y: 81.6999969; skew-x: -68.0999985; skew-y: -68.0999985; }
        frame 112 { x: 22.2999992; y: 82.5; skew-x: -76.9000015; skew-y: -76.9000015; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 113 { x: 18.2000008; y: 84.1999969; skew-x: -81.8000031; skew-y: -81.8000031; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 114 { x: 14.1000004; y: 85.9000015; skew-x: -86.5999985; skew-y: -86.5999985; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 10.1000004; y: 87.5; skew-x: -91.1999969; skew-y: -91.1999969; }
        frame 116 { x: 6.19999981; y: 89.1999969; skew-x: -96.1999969; skew-y: -96.1999969; }
        frame 117 { x: 1.70000005; y: 94.4000015; skew-x: -118.699997; skew-y: -118.699997; scale-x: 0.791000009; scale-y: 0.791000009; }
        frame 118 { x: -2; y: 97.8000031; skew-x: -141.300003; skew-y: -141.300003; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 0.400000006; y: 108; skew-x: -131; skew-y: -131; scale-x: 0.790000021; scale-y: 0.790000021; }
        frame 120 { x: 3.0999999; y: 117.900002; skew-x: -120.699997; skew-y: -120.699997; scale-x: 0.788999975; scale-y: 0.788999975; }
        frame 121 { x: 5.80000019; y: 127.5; skew-x: -110.400002; skew-y: -110.400002; scale-x: 0.790000021; scale-y: 0.790000021; }
        frame 122 { x: 5.0999999; y: 128.399994; skew-x: -104.699997; skew-y: -104.699997; scale-x: 0.788999975; scale-y: 0.788999975; }
        frame 123 { x: 4.4000001; y: 129.199997; skew-x: -99; skew-y: -99; scale-x: -10000; scale-y: -10000; }
        frame 124 { x: 3.9000001; y: 130; skew-x: -93.4000015; skew-y: -93.4000015; }
        frame 125 { x: 3.29999995; y: 130.699997; skew-x: -87.8000031; skew-y: -87.8000031; }
        frame 126 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 127 { cel: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_innerarm_lower";
        frame-count: 215;
        frame 0 { x: 23.7999992; y: 58.0999985; skew-x: 71.6999969; skew-y: 71.6999969; scale-x: 0.848999977; scale-y: 0.848999977; image: IMAGE_REANIM_ZOMBIE_LADDER_INNERARM_LOWER; }
        frame 1 { x: 24.5; y: 57.4000015; skew-x: 72.8000031; skew-y: 72.8000031; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 25; y: 56.5999985; skew-x: 73.8000031; skew-y: 73.8000031; }
        frame 3 { x: 25.6000004; y: 56; skew-x: 74.8000031; skew-y: 74.8000031; }
        frame 4 { x: 26.2000008; y: 55.0999985; skew-x: 75.6999969; skew-y: 75.6999969; }
        frame 5 { x: 26.7999992; y: 54.5; skew-x: 76.6999969; skew-y: 76.6999969; }
        frame 6 { x: 27.3999996; y: 53.5; skew-x: 77.5; skew-y: 77.5; }
        frame 7 { x: 26.7999992; y: 54.2999992; skew-x: 76.6999969; skew-y: 76.6999969; }
        frame 8 { x: 26.2999992; y: 55.0999985; skew-x: 75.6999969; skew-y: 75.6999969; }
        frame 9 { x: 25.6000004; y: 55.9000015; skew-x: 74.8000031; skew-y: 74.8000031; }
        frame 10 { x: 25; y: 56.5999985; skew-x: 73.8000031; skew-y: 73.8000031; }
        frame 11 { x: 24.3999996; y: 57.4000015; skew-x: 72.8000031; skew-y: 72.8000031; }
        frame 12 { x: 23.7999992; y: 58.0999985; skew-x: 71.6999969; skew-y: 71.6999969; }
        frame 13 { x: 23.5; y: 58.7999992; skew-x: 70.8000031; skew-y: 70.8000031; }
        frame 14 { x: 23.2000008; y: 59.4000015; skew-x: 69.8000031; skew-y: 69.8000031; }
        frame 15 { x: 22.8999996; y: 60; skew-x: 68.6999969; skew-y: 68.6999969; }
        frame 16 { x: 22.6000004; y: 60.5; skew-x: 67.6999969; skew-y: 67.6999969; }
        frame 17 { x: 22.2999992; y: 61.0999985; skew-x: 66.6999969; skew-y: 66.6999969; }
        frame 18 { x: 21.8999996; y: 61.7000008; skew-x: 65.5; skew-y: 65.5; }
        frame 19 { x: 22.2000008; y: 61.2000008; skew-x: 66.6999969; skew-y: 66.6999969; }
        frame 20 { x: 22.5; y: 60.5; skew-x: 67.6999969; skew-y: 67.6999969; }
        frame 21 { x: 22.7999992; y: 60; skew-x: 68.6999969; skew-y: 68.6999969; }
        frame 22 { x: 23.1000004; y: 59.4000015; skew-x: 69.8000031; skew-y: 69.8000031; }
        frame 23 { x: 23.3999996; y: 58.7999992; skew-x: 70.8000031; skew-y: 70.8000031; }
        frame 24 { x: 23.7999992; y: 58.0999985; skew-x: 71.6999969; skew-y: 71.6999969; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 23.8999996; skew-x: 67; skew-y: 67.5; scale-y: 0.86500001; }
        frame 27 { x: 23.7999992; y: 58; skew-x: 62.2999992; skew-y: 63.0999985; scale-y: 0.880999982; }
        frame 28 { x: 23.6000004; skew-x: 57.4000015; skew-y: 58.5999985; scale-y: 0.897000015; }
        frame 29 { x: 23.3999996; y: 57.7999992; skew-x: 52.5999985; skew-y: 54.2000008; scale-x: 0.850000024; scale-y: 0.913999975; }
        frame 30 { x: 23.7000008; y: 56.2000008; skew-x: 50.9000015; skew-y: 53; scale-x: 0.848999977; scale-y: 0.930000007; }
        frame 31 { x: 24.1000004; y: 54.5999985; skew-x: 49.4000015; skew-y: 51.9000015; scale-x: 0.850000024; scale-y: 0.948000014; }
        frame 32 { x: 24.2000008; y: 53; skew-x: 47.7000008; skew-y: 50.5999985; scale-x: -10000; scale-y: 0.964999974; }
        frame 33 { x: 24.3999996; y: 51.2999992; skew-x: 46; skew-y: 49.2999992; scale-x: 0.851999998; scale-y: 0.984000027; }
        frame 34 { x: 24.5; y: 51.2000008; skew-x: 43.9000015; skew-y: 47.2000008; scale-x: 0.850000024; scale-y: 0.98299998; }
        frame 35 { x: 24.3999996; y: 51.0999985; skew-x: 41.7000008; skew-y: 45; scale-x: -10000; scale-y: 0.981999993; }
        frame 36 { x: 24.5; y: 51; skew-x: 39.7000008; skew-y: 43; scale-y: -10000; }
        frame 37 { x: 24.2999992; y: -10000; skew-x: 37.7000008; skew-y: 40.9000015; scale-x: 0.848999977; }
        frame 38 { x: -10000; skew-x: 35.5; skew-y: 38.7000008; scale-x: 0.850000024; scale-y: 0.98299998; }
        frame 39 { x: 23.6000004; y: 52.2000008; skew-x: 39.4000015; skew-y: 42.7000008; scale-x: 0.848999977; scale-y: 0.981000006; }
        frame 40 { x: 22.7999992; y: 53.5; skew-x: 43.2000008; skew-y: 46.4000015; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 21.8999996; y: 54.7999992; skew-x: 47; skew-y: 50.2000008; scale-x: 0.84799999; scale-y: 0.980000019; }
        frame 42 { x: 21; y: 56.2000008; skew-x: 50.7000008; skew-y: 54; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 20.2000008; y: 57.5; skew-x: 54.5; skew-y: 57.7999992; scale-x: 0.848999977; scale-y: 0.981000006; }
        frame 44 { x: 18.1000004; y: 59.2999992; skew-x: 53; skew-y: 56.2000008; scale-x: 0.847000003; scale-y: 0.978999972; }
        frame 45 { x: 16; y: 60.9000015; skew-x: 51.2000008; skew-y: 54.5; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 13.8000002; y: 62.5999985; skew-x: 49.5; skew-y: 52.7000008; scale-x: 0.846000016; scale-y: 0.977999985; }
        frame 47 { x: 11.8999996; y: 64.1999969; skew-x: 47.7999992; skew-y: 51; scale-x: 0.847000003; scale-y: 0.978999972; }
        frame 48 { x: 13.6999998; y: 63.0999985; skew-x: 50; skew-y: 53.2000008; scale-x: 0.846000016; scale-y: 0.977999985; }
        frame 49 { x: 15.5; y: 61.9000015; skew-x: 52.2000008; skew-y: 55.5; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 17.3999996; y: 60.9000015; skew-x: 54.5; skew-y: 57.7000008; scale-x: 0.847000003; scale-y: 0.978999972; }
        frame 51 { x: 19.2000008; y: 59.7000008; skew-x: 56.7000008; skew-y: 60; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 20.7999992; y: 58.5999985; skew-x: 58.7999992; skew-y: 62.0999985; scale-x: 0.848999977; scale-y: 0.981000006; }
        frame 53 { x: 21.7000008; y: 57; skew-x: 56; skew-y: 59.2999992; scale-x: 0.84799999; scale-y: 0.980000019; }
        frame 54 { x: 22.6000004; y: 55.0999985; skew-x: 53.2000008; skew-y: 56.5; scale-x: 0.848999977; scale-y: 0.981000006; }
        frame 55 { x: 23.5; y: 53.5; skew-x: 50.2000008; skew-y: 53.5; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 24.6000004; y: 51.9000015; skew-x: 47.4000015; skew-y: 50.7000008; scale-y: 0.981999993; }
        frame 57 { x: 25.3999996; y: 50.2000008; skew-x: 44.5; skew-y: 47.7999992; scale-x: 0.851000011; scale-y: 0.98299998; }
        frame 58 { x: 25.6000004; y: 50.2999992; skew-x: 47.5; skew-y: 50.7000008; scale-x: 0.850000024; scale-y: 0.981999993; }
        frame 59 { x: 25.8999996; y: 50.4000015; skew-x: 50.5; skew-y: 53.7999992; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 26; y: 50.5999985; skew-x: 53.5; skew-y: 56.7999992; }
        frame 61 { x: 26.2999992; y: 50.7999992; skew-x: 56.5; skew-y: 59.7999992; scale-y: 0.98299998; }
        frame 62 { x: -10000; y: 50.9000015; skew-x: 59.5; skew-y: 62.7999992; scale-x: 0.851000011; scale-y: 0.984000027; }
        frame 63 { x: 24.6000004; y: 53.5999985; skew-x: 54.4000015; skew-y: 57.2999992; scale-x: 0.848999977; scale-y: 0.964999974; }
        frame 64 { x: 22.7999992; y: 56.4000015; skew-x: 49.4000015; skew-y: 51.7999992; scale-x: -10000; scale-y: 0.947000027; }
        frame 65 { x: 21; y: 59.2999992; skew-x: 44.0999985; skew-y: 46.2000008; scale-x: 0.84799999; scale-y: 0.92900002; }
        frame 66 { x: 19.2999992; y: 62.5; skew-x: 39; skew-y: 40.5999985; scale-x: 0.848999977; scale-y: 0.912; }
        frame 67 { x: 20.3999996; y: 61.4000015; skew-x: 45.5; skew-y: 46.9000015; scale-x: 0.847000003; scale-y: 0.898000002; }
        frame 68 { x: 21.5; y: 60.4000015; skew-x: 52.2000008; skew-y: 53.2000008; scale-x: 0.84799999; scale-y: 0.885999978; }
        frame 69 { x: 22.3999996; y: 59.5; skew-x: 58.7000008; skew-y: 59.2999992; scale-x: -10000; scale-y: 0.873000026; }
        frame 70 { x: 23.2000008; y: 58.7999992; skew-x: 65.3000031; skew-y: 65.5999985; scale-y: 0.861000001; }
        frame 71 { x: 23.7999992; y: 58.0999985; skew-x: 71.6999969; skew-y: 71.6999969; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 26; y: 55.7999992; skew-x: 75.6999969; skew-y: 75.6999969; }
        frame 74 { x: 28.2000008; y: 53.4000015; skew-x: 79.3000031; skew-y: 79.3000031; }
        frame 75 { x: 30.2999992; y: 51; skew-x: 83.0999985; skew-y: 83.0999985; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 76 { x: 32.4000015; y: 48.5999985; skew-x: 87.0999985; skew-y: 87.0999985; scale-x: -10000; scale-y: -10000; }
        frame 77 { x: 36.5; y: 47.5; skew-x: 92.4000015; skew-y: 92.4000015; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 78 { x: 40.4000015; y: 46.5; skew-x: 97.9000015; skew-y: 97.9000015; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 44.0999985; y: 45.5; skew-x: 103.400002; skew-y: 103.400002; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 80 { x: 48; y: 44.5999985; skew-x: 109; skew-y: 109; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 81 { x: 38.7999992; y: 51.5999985; skew-x: 74; skew-y: 74; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 82 { x: 26.3999996; y: 61.2999992; skew-x: 38.9000015; skew-y: 38.9000015; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 83 { x: 13; y: 75.3000031; skew-x: 3.9000001; skew-y: 3.9000001; scale-x: -10000; scale-y: -10000; }
        frame 84 { x: 12.8000002; y: 75.8000031; skew-x: 1.60000002; skew-y: 1.60000002; }
        frame 85 { x: 12.6999998; y: 76.3000031; skew-x: -0.300000012; skew-y: -0.300000012; }
        frame 86 { x: 12.5; y: 76.8000031; skew-x: -2.5999999; skew-y: -2.5999999; }
        frame 87 { x: 12.3999996; y: 77.5; skew-x: -4.5999999; skew-y: -4.5999999; }
        frame 88 { x: 15.5; y: 73.3000031; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 89 { x: 18.5; y: 69.3000031; skew-x: 10.6000004; skew-y: 10.6000004; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 90 { x: 21.7000008; y: 65.5999985; skew-x: 18.1000004; skew-y: 18.1000004; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 24.7000008; y: 62; skew-x: 25.8999996; skew-y: 25.8999996; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 92 { x: -10000; y: 60.5; skew-x: 37.4000015; skew-y: 37.4000015; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 93 { x: 24.5; y: 59.4000015; skew-x: 48.9000015; skew-y: 48.9000015; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 94 { x: 24.2000008; y: 58.5999985; skew-x: 60.2999992; skew-y: 60.2999992; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 95 { x: 23.7999992; y: 58.0999985; skew-x: 71.6999969; skew-y: 71.6999969; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 25.1000004; y: 56.2000008; skew-x: 54.5; skew-y: 54.5; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 98 { x: 25.8999996; y: 55; skew-x: 37.0999985; skew-y: 37.0999985; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 99 { x: 26.6000004; y: 55.0999985; skew-x: 19.6000004; skew-y: 19.6000004; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 100 { x: 27.2000008; y: 56.0999985; skew-x: 2.4000001; skew-y: 2.4000001; scale-x: -10000; scale-y: -10000; }
        frame 101 { x: 26.2000008; y: 55.0999985; skew-x: -2.9000001; skew-y: -2.20000005; scale-y: 0.871999979; }
        frame 102 { x: 24.8999996; y: 54.0999985; skew-x: -8; skew-y: -6.69999981; scale-x: 0.846000016; scale-y: 0.898999989; }
        frame 103 { x: 23.7999992; y: 53.2000008; skew-x: -13.1999998; skew-y: -11.1999998; scale-x: -10000; scale-y: 0.925999999; }
        frame 104 { x: 22.7000008; y: 52.4000015; skew-x: -18.5; skew-y: -15.8000002; scale-x: 0.847000003; scale-y: 0.952000022; }
        frame 105 { x: 21.3999996; y: 54.5; skew-x: -24.1000004; skew-y: -21.3999996; scale-x: 0.845000029; scale-y: 0.949999988; }
        frame 106 { x: 20.1000004; y: 56.7999992; skew-x: -30; skew-y: -27.3999996; scale-x: 0.842999995; scale-y: 0.948000014; }
        frame 107 { x: 19; y: 59; skew-x: -35.7999992; skew-y: -33.2000008; scale-x: 0.841000021; scale-y: 0.94599998; }
        frame 108 { x: 17.8999996; y: 61.5; skew-x: -41.5999985; skew-y: -39; scale-x: -10000; scale-y: 0.944999993; }
        frame 109 { x: 14.8999996; y: 64.3000031; skew-x: -48.2999992; skew-y: -45.7000008; scale-x: 0.838999987; scale-y: 0.943000019; }
        frame 110 { x: 12.1999998; y: 67.1999969; skew-x: -55.0999985; skew-y: -52.2999992; scale-x: 0.839999974; scale-y: 0.941999972; }
        frame 111 { x: 9.5; y: 70.1999969; skew-x: -61.7000008; skew-y: -59; scale-x: 0.838999987; scale-y: -10000; }
        frame 112 { x: 7.0999999; y: 73; skew-x: -68.4000015; skew-y: -65.8000031; scale-x: 0.839999974; scale-y: 0.943000019; }
        frame 113 { x: 2.29999995; y: 77.5999985; skew-x: -76.9000015; skew-y: -74.3000031; scale-x: 0.838999987; scale-y: 0.940999985; }
        frame 114 { x: -2; y: 82.0999985; skew-x: -85.4000015; skew-y: -82.8000031; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: -6.0999999; y: 86.4000015; skew-x: -93.9000015; skew-y: -91.3000031; }
        frame 116 { x: -10; y: 90.6999969; skew-x: -102.199997; skew-y: -99.5999985; }
        frame 117 { x: -13.1999998; y: 100.099998; skew-x: -117.800003; skew-y: -115.199997; scale-x: 0.838; scale-y: 0.939999998; }
        frame 118 { x: -15.8999996; y: 109.099998; skew-x: -133.5; skew-y: -130.800003; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: -16.6000004; y: 113.900002; skew-x: -119.099998; skew-y: -114.400002; scale-x: 0.823000014; scale-y: 0.925000012; }
        frame 120 { x: -10000; y: 118.099998; skew-x: -104.699997; skew-y: -98.1999969; scale-x: 0.808000028; scale-y: 0.912999988; }
        frame 121 { x: -15.6000004; y: 121.800003; skew-x: -90.4000015; skew-y: -81.8000031; scale-x: 0.79400003; scale-y: 0.899999976; }
        frame 122 { x: -19.1000004; y: 121.300003; skew-x: -100; skew-y: -90; scale-x: 0.786000013; scale-y: 0.890999973; }
        frame 123 { x: -22.5; y: 120.800003; skew-x: -109.400002; skew-y: -98.0999985; scale-x: 0.77700001; scale-y: 0.88499999; }
        frame 124 { x: -25.7000008; y: 120.099998; skew-x: -118.900002; skew-y: -106.099998; scale-x: 0.768999994; scale-y: 0.876999974; }
        frame 125 { x: -28.6000004; y: 119.300003; skew-x: -128.399994; skew-y: -114.400002; scale-x: 0.760999978; scale-y: 0.870000005; }
        frame 126 { x: -29; y: 118.599998; skew-x: -126.5; skew-y: -112.5; scale-x: 0.75999999; scale-y: 0.869000018; }
        frame 127 { x: -29.2999992; y: 118.099998; skew-x: -124.699997; skew-y: -110.699997; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -29.7000008; y: 117.300003; skew-x: -122.900002; skew-y: -108.900002; }
        frame 129 { x: -30.1000004; y: 116.800003; skew-x: -121.099998; skew-y: -107.099998; scale-x: 0.760999978; scale-y: 0.870000005; }
        frame 130 { x: -29.3999996; y: 118.199997; skew-x: -124.699997; skew-y: -110.699997; scale-x: 0.75999999; scale-y: 0.869000018; }
        frame 131 { x: -28.6000004; y: 119.300003; skew-x: -128.399994; skew-y: -114.400002; scale-x: 0.760999978; scale-y: 0.870000005; }
        frame 132 { x: 19.5; y: 67.6999969; skew-x: 1.5; skew-y: 1.5; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 133 { x: 19.8999996; y: 66.8000031; skew-x: 3.5999999; skew-y: 3.5999999; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 134 { x: 20.2000008; y: 65.8000031; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 20.6000004; y: 64.8000031; skew-x: 7.80000019; skew-y: 7.80000019; }
        frame 136 { x: 21; y: 63.9000015; skew-x: 10.1000004; skew-y: 10.1000004; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 137 { x: 21.6000004; y: 61.2999992; skew-x: 13.8000002; skew-y: 13.8000002; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 138 { x: 22.2999992; y: 58.5999985; skew-x: 17.6000004; skew-y: 17.6000004; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 139 { x: 22.8999996; y: 56; skew-x: 21.3999996; skew-y: 21.3999996; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 23.6000004; y: 53.5; skew-x: 25.2000008; skew-y: 25.2000008; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 141 { x: 23.7000008; y: 52.9000015; skew-x: 27.1000004; skew-y: 27.1000004; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 142 { x: 23.7999992; y: 52.2999992; skew-x: 28.8999996; skew-y: 28.8999996; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: -10000; y: 51.7999992; skew-x: 30.8999996; skew-y: 30.8999996; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 144 { x: 24.1000004; y: 51.2999992; skew-x: 32.9000015; skew-y: 32.9000015; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: -10000; y: 50.7000008; skew-x: 34.7999992; skew-y: 34.7999992; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 146 { x: 23.5; y: 53.9000015; skew-x: 27.8999996; skew-y: 27.8999996; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 147 { x: 23; y: 57.0999985; skew-x: 21.1000004; skew-y: 21.1000004; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 22.6000004; y: 60.5; skew-x: 14.3999996; skew-y: 14.3999996; }
        frame 149 { x: 22; y: 64.1999969; skew-x: 7.5999999; skew-y: 7.5999999; }
        frame 150 { x: 21.7000008; y: 67.8000031; skew-x: 0.899999976; skew-y: 0.899999976; }
        frame 151 { x: 21.1000004; y: 69.5; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 152 { x: 20.6000004; y: 71; skew-x: -10000; skew-y: -10000; }
        frame 153 { x: 20.1000004; y: 72.5; }
        frame 154 { x: 19.7000008; y: 73.8000031; skew-x: 0.899999976; skew-y: 0.899999976; }
        frame 155 { x: 20.6000004; y: 72.5999985; skew-x: 1; skew-y: 1; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 156 { x: 21.3999996; y: 71.3000031; skew-x: 1.10000002; skew-y: 1.10000002; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 22.3999996; y: 70.0999985; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 158 { x: 23.2999992; y: 68.6999969; skew-x: -10000; skew-y: -10000; }
        frame 159 { x: 24.2000008; y: 67.4000015; skew-x: 1.60000002; skew-y: 1.60000002; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 160 { x: 25.3999996; y: 65.8000031; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 161 { x: 26.6000004; y: 64.0999985; skew-x: -0.600000024; skew-y: -0.600000024; scale-x: 0.842000008; scale-y: 0.842000008; }
        frame 162 { x: 27.7999992; y: 62.4000015; skew-x: -1.79999995; skew-y: -1.79999995; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 29; y: 60.7999992; skew-x: -3.0999999; skew-y: -3.0999999; }
        frame 164 { x: 30.2999992; y: 59.2000008; skew-x: -4; skew-y: -4; }
        frame 165 { x: 29.8999996; y: 59.4000015; skew-x: -3.5999999; skew-y: -3.5999999; scale-x: 0.841000021; scale-y: 0.841000021; }
        frame 166 { x: 29.2000008; y: -10000; skew-x: -3.0999999; skew-y: -3.0999999; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 28.7000008; y: 59.5; skew-x: -2.4000001; skew-y: -2.4000001; }
        frame 168 { x: 28.2000008; y: -10000; skew-x: -1.79999995; skew-y: -1.79999995; scale-x: 0.839999974; scale-y: 0.839999974; }
        frame 169 { x: 27.6000004; y: 59.7000008; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: -10000; scale-y: -10000; }
        frame 170 { x: 26.2999992; y: 63.5; skew-x: -1.60000002; skew-y: -1.60000002; }
        frame 171 { x: 25.1000004; y: 67.4000015; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 172 { x: 23.7000008; y: 71.3000031; skew-x: -2.29999995; skew-y: -2.29999995; }
        frame 173 { x: 22.5; y: 75; skew-x: -2.5; skew-y: -2.5; scale-x: 0.841000021; scale-y: 0.841000021; }
        frame 174 { x: 21.8999996; y: 73.5999985; skew-x: -1.79999995; skew-y: -1.79999995; scale-x: 0.842000008; scale-y: 0.842000008; }
        frame 175 { x: 21.3999996; y: 72.0999985; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 176 { x: 20.7000008; y: 70.6999969; skew-x: -0.100000001; skew-y: -0.100000001; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 177 { x: 20.2000008; y: 69.0999985; skew-x: 0.600000024; skew-y: 0.600000024; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 178 { x: 19.5; y: 67.6999969; skew-x: 1.5; skew-y: 1.5; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 21.7999992; y: 65.6999969; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 181 { x: 24.1000004; y: 63.7000008; skew-x: 2.0999999; skew-y: 2.0999999; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 26.2000008; y: 61.7000008; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 183 { x: 28.3999996; y: 59.7000008; skew-x: 2.5999999; skew-y: 2.5999999; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 184 { x: 30.6000004; y: 57.7000008; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: -10000; scale-y: -10000; }
        frame 185 { x: 32.9000015; y: 55.5999985; skew-x: 3.0999999; skew-y: 3.0999999; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 186 { x: 35; y: 53.7000008; skew-x: 3.29999995; skew-y: 3.29999995; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 37.2000008; y: 51.5; skew-x: 3.70000005; skew-y: 3.70000005; }
        frame 188 { x: 36.0999985; y: 53.4000015; skew-x: -7.5999999; skew-y: -7.5999999; }
        frame 189 { x: 35.5; y: 55.5; skew-x: -18.7000008; skew-y: -18.7000008; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 190 { x: 34.9000015; y: 58; skew-x: -30.1000004; skew-y: -30.1000004; scale-x: -10000; scale-y: -10000; }
        frame 191 { x: 34.5; y: 58.7999992; skew-x: -41.4000015; skew-y: -41.4000015; scale-x: 0.842000008; scale-y: 0.842000008; }
        frame 192 { x: 34.5999985; y: 59.7999992; skew-x: -52.7000008; skew-y: -52.7000008; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 35.0999985; y: 60.5999985; skew-x: -64; skew-y: -64; }
        frame 194 { x: 36.0999985; y: 61.5999985; skew-x: -75.4000015; skew-y: -75.4000015; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 195 { x: 33.5999985; y: 63.5; skew-x: -65.8000031; skew-y: -65.8000031; scale-x: 0.842000008; scale-y: 0.842000008; }
        frame 196 { x: 31.3999996; y: 65.3000031; skew-x: -56.2000008; skew-y: -56.2000008; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 197 { x: 29.7000008; y: 67; skew-x: -46.5; skew-y: -46.5; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 28.1000004; y: 69; skew-x: -36.9000015; skew-y: -36.9000015; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 199 { x: 25.6000004; y: 68.3000031; skew-x: -27.2000008; skew-y: -27.2000008; scale-x: -10000; scale-y: -10000; }
        frame 200 { x: 23.2999992; y: 67.8000031; skew-x: -17.6000004; skew-y: -17.6000004; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 201 { x: 21.2999992; y: 67.6999969; skew-x: -8.10000038; skew-y: -8.10000038; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 202 { x: 19.5; y: -10000; skew-x: 1.5; skew-y: 1.5; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 203 { x: 23.7999992; y: 58.0999985; skew-x: 71.6999969; skew-y: 71.6999969; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 204 { x: 27.3999996; y: 52.5; skew-x: 84.0999985; skew-y: 84.0999985; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 205 { x: 30.7000008; y: 47; skew-x: 96.5999985; skew-y: 96.5999985; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 206 { x: 33.2999992; y: 41.7999992; skew-x: 109.099998; skew-y: 109.099998; scale-x: -10000; scale-y: -10000; }
        frame 207 { x: 35.4000015; y: 36.5999985; skew-x: 121.699997; skew-y: 121.699997; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 208 { x: 37; y: 31.3999996; skew-x: 134.199997; skew-y: 134.199997; scale-x: -10000; scale-y: -10000; }
        frame 209 { x: 38; y: 26; skew-x: 146.600006; skew-y: 146.600006; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 210 { x: 33.7000008; y: 34.5999985; skew-x: 140.399994; skew-y: 140.399994; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 211 { x: 31; y: 38; skew-x: 117.400002; skew-y: 117.400002; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 212 { x: 26.7000008; y: 39.2000008; skew-x: 104.599998; skew-y: 104.599998; scale-x: 0.842000008; scale-y: 0.842000008; }
        frame 213 { x: 27.6000004; y: 45.4000015; skew-x: 75.5999985; skew-y: 75.5999985; scale-x: -10000; scale-y: -10000; }
        frame 214 { x: 24.2000008; y: 53.2000008; skew-x: 64; skew-y: 64; }
    }
    Track {
        source-name: "Zombie_ladder_innerleg_upper";
        frame-count: 215;
        frame 0 { x: 41; y: 80.1999969; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.850000024; scale-y: 0.850000024; image: IMAGE_REANIM_ZOMBIE_LADDER_INNERLEG_UPPER; }
        frame 1 { x: 41.4000015; y: 79.5; skew-x: 353.200012; skew-y: 353.200012; scale-x: 0.848999977; scale-y: 0.848999977; image: none; }
        frame 2 { x: 41.7000008; y: 78.9000015; skew-x: 354.5; skew-y: 354.5; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 42; y: 78.1999969; skew-x: 356; skew-y: 356; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 4 { x: 42.2999992; y: 77.5999985; skew-x: 357.200012; skew-y: 357.200012; scale-x: -10000; scale-y: -10000; }
        frame 5 { x: 42.5999985; y: 77; skew-x: 358.700012; skew-y: 358.700012; }
        frame 6 { x: 43; y: 76.3000031; skew-x: 360; skew-y: 360; }
        frame 7 { x: 42.5999985; y: 76.9000015; skew-x: 358.700012; skew-y: 358.700012; }
        frame 8 { x: 42.2999992; y: 77.5; skew-x: 357.200012; skew-y: 357.200012; }
        frame 9 { x: 42; y: 78.1999969; skew-x: 356; skew-y: 356; }
        frame 10 { x: 41.5999985; y: 78.8000031; skew-x: 354.5; skew-y: 354.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 11 { x: 41.4000015; y: 79.4000015; skew-x: 353.200012; skew-y: 353.200012; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 41; y: 80.1999969; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 13 { x: 40.9000015; y: 80.6999969; skew-x: 350.700012; skew-y: 350.700012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 14 { x: 40.5999985; y: 81.3000031; skew-x: 349.5; skew-y: 349.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 40.5; y: 81.8000031; skew-x: 348.5; skew-y: 348.5; }
        frame 16 { x: 40.2000008; y: 82.3000031; skew-x: 347.200012; skew-y: 347.200012; }
        frame 17 { x: 40; y: 82.8000031; skew-x: 346.200012; skew-y: 346.200012; }
        frame 18 { x: 39.7000008; y: 83.5; skew-x: 345; skew-y: 345; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 19 { x: 40; y: 83; skew-x: 346.200012; skew-y: 346.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 20 { x: 40.0999985; y: 82.3000031; skew-x: 347.200012; skew-y: 347.200012; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 40.4000015; y: 81.8000031; skew-x: 348.5; skew-y: 348.5; }
        frame 22 { x: 40.5999985; y: 81.3000031; skew-x: 349.5; skew-y: 349.5; }
        frame 23 { x: 40.9000015; y: 80.8000031; skew-x: 350.700012; skew-y: 350.700012; }
        frame 24 { x: 41; y: 80.1999969; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 41.7000008; y: 79.8000031; skew-x: 352.700012; skew-y: 352.700012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 27 { x: 42.2999992; y: 79.5; skew-x: 353.700012; skew-y: 353.700012; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 42.9000015; y: 79.3000031; skew-x: 354.700012; skew-y: 354.700012; }
        frame 29 { x: 43.4000015; y: 79; skew-x: 355.5; skew-y: 355.5; }
        frame 30 { x: 43.2000008; y: 78.1999969; skew-x: 353.700012; skew-y: 353.700012; scale-x: 0.84799999; scale-y: 0.893999994; }
        frame 31 { x: 43.0999985; y: 77.3000031; skew-x: 351.700012; skew-y: 351.700012; scale-x: -10000; scale-y: 0.939999998; }
        frame 32 { x: 42.7999992; y: 76.5999985; skew-x: 349.700012; skew-y: 349.700012; scale-y: 0.985000014; }
        frame 33 { x: 42.4000015; y: 75.8000031; skew-x: 347.5; skew-y: 347.5; scale-y: 1.03199995; }
        frame 34 { x: 41.5999985; y: 75.3000031; skew-x: 346; skew-y: 346; scale-x: 0.847000003; scale-y: 1.079; }
        frame 35 { x: 40.9000015; y: 74.8000031; skew-x: 344.200012; skew-y: 344.200012; scale-x: -10000; scale-y: 1.12699997; }
        frame 36 { x: 39.9000015; y: 74.3000031; skew-x: 342.700012; skew-y: 342.700012; scale-y: 1.17499995; }
        frame 37 { x: 39; y: 73.8000031; skew-x: 341; skew-y: 341; scale-x: 0.846000016; scale-y: 1.22300005; }
        frame 38 { x: 38; y: 73.1999969; skew-x: 339.299988; skew-y: 339.299988; scale-x: 0.847000003; scale-y: 1.27199996; }
        frame 39 { x: 37.0999985; y: 74; skew-x: 337.5; skew-y: 337.5; scale-x: 0.845000029; scale-y: 1.26999998; }
        frame 40 { x: 36.2000008; y: 74.6999969; skew-x: 335.700012; skew-y: 335.700012; scale-x: -10000; scale-y: 1.26900005; }
        frame 41 { x: 35.4000015; y: 75.3000031; skew-x: 333.899994; skew-y: 333.899994; scale-x: 0.843999982; scale-y: 1.26800001; }
        frame 42 { x: 34.5999985; y: 76; skew-x: 332.200012; skew-y: 332.200012; scale-x: 0.842999995; scale-y: 1.26699996; }
        frame 43 { x: 33.5999985; y: 76.6999969; skew-x: 330.299988; skew-y: 330.299988; scale-x: 0.843999982; scale-y: -10000; }
        frame 44 { x: 34.2999992; y: 75.8000031; skew-x: 333.700012; skew-y: 333.700012; scale-x: 0.842000008; scale-y: 1.26499999; }
        frame 45 { x: 35.0999985; y: 75; skew-x: 337.200012; skew-y: 337.200012; scale-x: -10000; scale-y: 1.26400006; }
        frame 46 { x: 36; y: 74.3000031; skew-x: 340.700012; skew-y: 340.700012; scale-y: -10000; }
        frame 47 { x: 36.9000015; y: 73.5999985; skew-x: 344; skew-y: 344; }
        frame 48 { x: 37.4000015; y: 73.0999985; skew-x: 344.5; skew-y: 344.5; scale-x: 0.841000021; scale-y: 1.26300001; }
        frame 49 { x: 37.7999992; y: 72.6999969; skew-x: 345; skew-y: 345; scale-x: -10000; scale-y: 1.26400006; }
        frame 50 { x: 38.0999985; y: 72.3000031; skew-x: 345.399994; skew-y: 345.399994; scale-x: 0.842000008; scale-y: -10000; }
        frame 51 { x: 38.5; y: 71.8000031; skew-x: 345.700012; skew-y: 345.700012; scale-x: -10000; }
        frame 52 { x: 39; y: 71.5; skew-x: 346.200012; skew-y: 346.200012; scale-y: 1.26499999; }
        frame 53 { x: 39.2999992; y: 70.4000015; skew-x: 349; skew-y: 349; scale-x: 0.841000021; scale-y: 1.26300001; }
        frame 54 { x: 39.5999985; y: 69.3000031; skew-x: 351.700012; skew-y: 351.700012; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 40; y: 68.3000031; skew-x: 354.5; skew-y: 354.5; scale-y: 1.26199996; }
        frame 56 { x: 41.5999985; y: 66.5999985; skew-x: 364.100006; skew-y: 364; scale-x: 0.839999974; scale-y: -10000; }
        frame 57 { x: 43.7999992; y: 65.6999969; skew-x: 373.899994; skew-y: 373.899994; scale-x: -10000; }
        frame 58 { x: 45.5; y: 66.8000031; skew-x: 378.799988; skew-y: 378.799988; scale-y: 1.16400003; }
        frame 59 { x: 47; y: 68.0999985; skew-x: 383.799988; skew-y: 383.799988; scale-x: 0.838999987; scale-y: 1.06700003; }
        frame 60 { x: 48.2999992; y: 69.5; skew-x: 388.899994; skew-y: 389; scale-x: -10000; scale-y: 0.968999982; }
        frame 61 { x: 49.0999985; y: 70.8000031; skew-x: 394.100006; skew-y: 394.100006; scale-y: 0.871999979; }
        frame 62 { x: 49.5999985; y: 72; skew-x: 399; skew-y: 399.100006; scale-x: 0.841000021; scale-y: 0.776000023; }
        frame 63 { x: 46.7999992; y: 73.5; skew-x: 385.100006; skew-y: 385.100006; scale-x: 0.842000008; scale-y: 0.79400003; }
        frame 64 { x: 44; y: 76.0999985; skew-x: 371; skew-y: 371; scale-x: 0.843999982; scale-y: 0.811999977; }
        frame 65 { x: 41.7000008; y: 79.6999969; skew-x: 357.200012; skew-y: 357.200012; scale-x: 0.847000003; scale-y: 0.83099997; }
        frame 66 { x: 39.7999992; y: 84.5999985; skew-x: 343.200012; skew-y: 343.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 67 { x: 40; y: 83.6999969; skew-x: 345; skew-y: 345; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 40.4000015; y: 82.6999969; skew-x: 346.700012; skew-y: 346.700012; }
        frame 69 { x: 40.5; y: 81.9000015; skew-x: 348.399994; skew-y: 348.399994; }
        frame 70 { x: 40.9000015; y: 81.0999985; skew-x: 350.200012; skew-y: 350.200012; }
        frame 71 { x: 41; y: 80.1999969; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 42.2999992; y: 79.0999985; skew-x: 354; skew-y: 354; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 74 { x: 43.4000015; y: 78.1999969; skew-x: 356; skew-y: 356; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 44.5; y: 77.1999969; skew-x: 358.200012; skew-y: 358.200012; }
        frame 76 { x: 45.7000008; y: 76.3000031; skew-x: 360.299988; skew-y: 360.299988; }
        frame 77 { x: 45.5999985; y: 75.8000031; skew-x: 359.700012; skew-y: 359.700012; }
        frame 78 { x: 45.2999992; y: 75.4000015; skew-x: 359; skew-y: 359; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 79 { x: 45.0999985; y: 75; skew-x: 358.5; skew-y: 358.5; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 44.9000015; y: 74.5999985; skew-x: 357.700012; skew-y: 357.700012; }
        frame 81 { x: 41.5999985; y: 76.5; skew-x: 354.200012; skew-y: 354.200012; }
        frame 82 { x: 38.2999992; y: 78.4000015; skew-x: 350.700012; skew-y: 350.700012; }
        frame 83 { x: 35.2999992; y: 80.4000015; skew-x: 347.200012; skew-y: 347.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 84 { x: 34.7000008; y: 81.5999985; skew-x: 342.700012; skew-y: 342.700012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 85 { x: 34.2000008; y: 82.8000031; skew-x: 338; skew-y: 338; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 33.7999992; y: 84.3000031; skew-x: 333.399994; skew-y: 333.399994; }
        frame 87 { x: 33.5; y: 85.6999969; skew-x: 328.799988; skew-y: 328.799988; }
        frame 88 { x: 34.0999985; y: 84.6999969; skew-x: 332.700012; skew-y: 332.700012; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 89 { x: 34.7999992; y: 83.6999969; skew-x: 336.399994; skew-y: 336.399994; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 35.5; y: 82.8000031; skew-x: 340.200012; skew-y: 340.200012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 91 { x: 36.2999992; y: 81.8000031; skew-x: 344; skew-y: 344; scale-x: -10000; scale-y: -10000; }
        frame 92 { x: 37.5; y: 81.4000015; skew-x: 346; skew-y: 346; }
        frame 93 { x: 38.7999992; y: 81; skew-x: 348; skew-y: 348; }
        frame 94 { x: 40; y: 80.5999985; skew-x: 349.899994; skew-y: 349.899994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 95 { x: 41; y: 80.1999969; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 40.5; y: 79.3000031; skew-x: 353.200012; skew-y: 353.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 98 { x: 39.9000015; y: 78.5; skew-x: 354.5; skew-y: 354.5; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 39.2999992; y: 77.6999969; skew-x: 355.700012; skew-y: 355.700012; }
        frame 100 { x: 38.7000008; y: 76.8000031; skew-x: 357; skew-y: 357; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 101 { x: 37.5; y: 77; skew-x: 356.5; skew-y: 356.5; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 36.2999992; y: 77.1999969; skew-x: 355.700012; skew-y: 355.700012; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 103 { x: 34.7999992; y: 77.3000031; skew-x: 355; skew-y: 355; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 33.5; y: 77.6999969; skew-x: 354.299988; skew-y: 354.299988; }
        frame 105 { x: 29.1000004; y: 78.8000031; skew-x: 346.700012; skew-y: 346.700012; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 106 { x: 25; y: 80.4000015; skew-x: 339; skew-y: 339; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 107 { x: 21.2000008; y: 82.1999969; skew-x: 331.399994; skew-y: 331.399994; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 108 { x: 17.7999992; y: 84.1999969; skew-x: 323.700012; skew-y: 323.700012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 109 { x: 15.3999996; y: 85.5999985; skew-x: 320.100006; skew-y: 320.100006; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 110 { x: 13.1000004; y: 87.1999969; skew-x: 316.399994; skew-y: 316.399994; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 10.8000002; y: 88.6999969; skew-x: 312.899994; skew-y: 312.899994; }
        frame 112 { x: 8.5; y: 90.0999985; skew-x: 309.200012; skew-y: 309.200012; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 113 { x: 6; y: 93.9000015; skew-x: 299.600006; skew-y: 299.600006; scale-x: 0.843999982; scale-y: 0.941999972; }
        frame 114 { x: 3.79999995; y: 98.3000031; skew-x: 289.799988; skew-y: 289.799988; scale-x: -10000; scale-y: 1.03900003; }
        frame 115 { x: 2; y: 103.300003; skew-x: 280.299988; skew-y: 280.299988; scale-y: 1.13699996; }
        frame 116 { x: 0.699999988; y: 108.800003; skew-x: 270.799988; skew-y: 270.799988; scale-x: 0.845000029; scale-y: 1.23500001; }
        frame 117 { x: 1.10000002; y: 115.300003; skew-x: 256.5; skew-y: 256.5; scale-x: 0.842999995; scale-y: 1.125; }
        frame 118 { x: 2.5999999; y: 119.599998; skew-x: 242.100006; skew-y: 242.100006; scale-x: -10000; scale-y: 1.01699996; }
        frame 119 { x: 2.20000005; y: 122.099998; skew-x: 238.399994; skew-y: 238.399994; scale-x: 0.842000008; scale-y: 1.09200001; }
        frame 120 { x: 2; y: 124.599998; skew-x: 234.899994; skew-y: 234.899994; scale-x: -10000; scale-y: 1.16999996; }
        frame 121 { x: 1.89999998; y: 127.199997; skew-x: 231.199997; skew-y: 231.199997; scale-x: 0.842999995; scale-y: 1.24899995; }
        frame 122 { x: -0.899999976; y: 128.800003; skew-x: 240.699997; skew-y: 240.399994; scale-x: 0.822000027; scale-y: 1.245; }
        frame 123 { x: -3.5; y: 130.100006; skew-x: 250.199997; skew-y: 249.5; scale-x: 0.802999973; scale-y: 1.24399996; }
        frame 124 { x: -6.5999999; y: 130.899994; skew-x: 262.700012; skew-y: 261.700012; scale-x: 0.782999992; scale-y: 1.24300003; }
        frame 125 { x: -8.30000019; y: 131.199997; skew-x: 275.200012; skew-y: 273.600006; scale-x: 0.763999999; scale-y: -10000; }
        frame 126 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 127 { y: 131.300003; skew-x: 275; skew-y: 273.5; scale-y: 1.24199998; }
        frame 128 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 129 { y: 131.399994; }
        frame 130 { y: 131.300003; }
        frame 131 { y: 131.199997; skew-x: 275.200012; skew-y: 273.600006; scale-y: 1.24300003; }
        frame 132 { x: 41; y: 80.1999969; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 133 { x: 41.7000008; y: 79.8000031; skew-x: 352.700012; skew-y: 352.700012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 134 { x: 42.2999992; y: 79.5; skew-x: 353.700012; skew-y: 353.700012; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 42.9000015; y: 79.3000031; skew-x: 354.700012; skew-y: 354.700012; }
        frame 136 { x: 43.4000015; y: 79; skew-x: 355.5; skew-y: 355.5; }
        frame 137 { x: 43.2000008; y: 78.1999969; skew-x: 353.700012; skew-y: 353.700012; scale-x: 0.84799999; scale-y: 0.893999994; }
        frame 138 { x: 43.0999985; y: 77.3000031; skew-x: 351.700012; skew-y: 351.700012; scale-x: -10000; scale-y: 0.939999998; }
        frame 139 { x: 42.7999992; y: 76.5999985; skew-x: 349.700012; skew-y: 349.700012; scale-y: 0.985000014; }
        frame 140 { x: 42.4000015; y: 75.8000031; skew-x: 347.5; skew-y: 347.5; scale-y: 1.03199995; }
        frame 141 { x: 41.5999985; y: 75.3000031; skew-x: 346; skew-y: 346; scale-x: 0.847000003; scale-y: 1.079; }
        frame 142 { x: 40.9000015; y: 74.8000031; skew-x: 344.200012; skew-y: 344.200012; scale-x: -10000; scale-y: 1.12699997; }
        frame 143 { x: 39.9000015; y: 74.3000031; skew-x: 342.700012; skew-y: 342.700012; scale-y: 1.17499995; }
        frame 144 { x: 39; y: 73.8000031; skew-x: 341; skew-y: 341; scale-x: 0.846000016; scale-y: 1.22300005; }
        frame 145 { x: 38; y: 73.1999969; skew-x: 339.299988; skew-y: 339.299988; scale-x: 0.847000003; scale-y: 1.27199996; }
        frame 146 { x: 37.0999985; y: 74; skew-x: 337.5; skew-y: 337.5; scale-x: 0.845000029; scale-y: 1.26999998; }
        frame 147 { x: 36.2000008; y: 74.6999969; skew-x: 335.700012; skew-y: 335.700012; scale-x: -10000; scale-y: 1.26900005; }
        frame 148 { x: 35.4000015; y: 75.3000031; skew-x: 333.899994; skew-y: 333.899994; scale-x: 0.843999982; scale-y: 1.26800001; }
        frame 149 { x: 34.5999985; y: 76; skew-x: 332.200012; skew-y: 332.200012; scale-x: 0.842999995; scale-y: 1.26699996; }
        frame 150 { x: 33.5999985; y: 76.6999969; skew-x: 330.299988; skew-y: 330.299988; scale-x: 0.843999982; scale-y: -10000; }
        frame 151 { x: 34.2999992; y: 75.8000031; skew-x: 333.700012; skew-y: 333.700012; scale-x: 0.842000008; scale-y: 1.26499999; }
        frame 152 { x: 35.0999985; y: 75; skew-x: 337.200012; skew-y: 337.200012; scale-x: -10000; scale-y: 1.26400006; }
        frame 153 { x: 36; y: 74.3000031; skew-x: 340.700012; skew-y: 340.700012; scale-y: -10000; }
        frame 154 { x: 36.9000015; y: 73.5999985; skew-x: 344; skew-y: 344; }
        frame 155 { x: 37.4000015; y: 73.0999985; skew-x: 344.5; skew-y: 344.5; scale-x: 0.841000021; scale-y: 1.26300001; }
        frame 156 { x: 37.7999992; y: 72.6999969; skew-x: 345; skew-y: 345; scale-x: -10000; scale-y: 1.26400006; }
        frame 157 { x: 38.0999985; y: 72.3000031; skew-x: 345.399994; skew-y: 345.399994; scale-x: 0.842000008; scale-y: -10000; }
        frame 158 { x: 38.5; y: 71.8000031; skew-x: 345.700012; skew-y: 345.700012; scale-x: -10000; }
        frame 159 { x: 39; y: 71.5; skew-x: 346.200012; skew-y: 346.200012; scale-y: 1.26499999; }
        frame 160 { x: 39.2999992; y: 70.4000015; skew-x: 349; skew-y: 349; scale-x: 0.841000021; scale-y: 1.26300001; }
        frame 161 { x: 39.5999985; y: 69.3000031; skew-x: 351.700012; skew-y: 351.700012; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 40; y: 68.3000031; skew-x: 354.5; skew-y: 354.5; scale-y: 1.26199996; }
        frame 163 { x: 41.5999985; y: 66.5999985; skew-x: 364.100006; skew-y: 364; scale-x: 0.839999974; scale-y: -10000; }
        frame 164 { x: 43.7999992; y: 65.6999969; skew-x: 373.899994; skew-y: 373.899994; scale-x: -10000; }
        frame 165 { x: 45.5; y: 66.8000031; skew-x: 378.799988; skew-y: 378.799988; scale-y: 1.16400003; }
        frame 166 { x: 47; y: 68.0999985; skew-x: 383.799988; skew-y: 383.799988; scale-x: 0.838999987; scale-y: 1.06700003; }
        frame 167 { x: 48.2999992; y: 69.5; skew-x: 388.899994; skew-y: 389; scale-x: -10000; scale-y: 0.968999982; }
        frame 168 { x: 49.0999985; y: 70.8000031; skew-x: 394.100006; skew-y: 394.100006; scale-y: 0.871999979; }
        frame 169 { x: 49.5999985; y: 72; skew-x: 399; skew-y: 399.100006; scale-x: 0.841000021; scale-y: 0.776000023; }
        frame 170 { x: 46.7999992; y: 73.5; skew-x: 385.100006; skew-y: 385.100006; scale-x: 0.842000008; scale-y: 0.79400003; }
        frame 171 { x: 44; y: 76.0999985; skew-x: 371; skew-y: 371; scale-x: 0.843999982; scale-y: 0.811999977; }
        frame 172 { x: 41.7000008; y: 79.6999969; skew-x: 357.200012; skew-y: 357.200012; scale-x: 0.847000003; scale-y: 0.83099997; }
        frame 173 { x: 39.7999992; y: 84.5999985; skew-x: 343.200012; skew-y: 343.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 174 { x: 40; y: 83.6999969; skew-x: 345; skew-y: 345; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 40.4000015; y: 82.6999969; skew-x: 346.700012; skew-y: 346.700012; }
        frame 176 { x: 40.5; y: 81.9000015; skew-x: 348.399994; skew-y: 348.399994; }
        frame 177 { x: 40.9000015; y: 81.0999985; skew-x: 350.200012; skew-y: 350.200012; }
        frame 178 { x: 41; y: 80.1999969; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 42.2999992; y: 79.0999985; skew-x: 354; skew-y: 354; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 181 { x: 43.4000015; y: 78.1999969; skew-x: 356; skew-y: 356; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 44.5; y: 77.1999969; skew-x: 358.200012; skew-y: 358.200012; }
        frame 183 { x: 45.7000008; y: 76.3000031; skew-x: 360.299988; skew-y: 360.299988; }
        frame 184 { x: 45.5999985; y: 75.8000031; skew-x: 359.700012; skew-y: 359.700012; }
        frame 185 { x: 45.2999992; y: 75.4000015; skew-x: 359; skew-y: 359; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 186 { x: 45.0999985; y: 75; skew-x: 358.5; skew-y: 358.5; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 44.9000015; y: 74.5999985; skew-x: 357.700012; skew-y: 357.700012; }
        frame 188 { x: 41.5999985; y: 76.5; skew-x: 354.200012; skew-y: 354.200012; }
        frame 189 { x: 38.2999992; y: 78.4000015; skew-x: 350.700012; skew-y: 350.700012; }
        frame 190 { x: 35.2999992; y: 80.4000015; skew-x: 347.200012; skew-y: 347.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 191 { x: 34.7000008; y: 81.5999985; skew-x: 342.700012; skew-y: 342.700012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 192 { x: 34.2000008; y: 82.8000031; skew-x: 338; skew-y: 338; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 33.7999992; y: 84.3000031; skew-x: 333.399994; skew-y: 333.399994; }
        frame 194 { x: 33.5; y: 85.6999969; skew-x: 328.799988; skew-y: 328.799988; }
        frame 195 { x: 34.0999985; y: 84.6999969; skew-x: 332.700012; skew-y: 332.700012; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 196 { x: 34.7999992; y: 83.6999969; skew-x: 336.399994; skew-y: 336.399994; scale-x: -10000; scale-y: -10000; }
        frame 197 { x: 35.5; y: 82.8000031; skew-x: 340.200012; skew-y: 340.200012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 198 { x: 36.2999992; y: 81.8000031; skew-x: 344; skew-y: 344; scale-x: -10000; scale-y: -10000; }
        frame 199 { x: 37.5; y: 81.4000015; skew-x: 346; skew-y: 346; }
        frame 200 { x: 38.7999992; y: 81; skew-x: 348; skew-y: 348; }
        frame 201 { x: 40; y: 80.5999985; skew-x: 349.899994; skew-y: 349.899994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 202 { x: 41; y: 80.1999969; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 204 { x: 42; y: 78.3000031; skew-x: 354.200012; skew-y: 354.200012; scale-x: 0.848999977; scale-y: 0.876999974; }
        frame 205 { x: 42.9000015; y: 76.5999985; skew-x: 356.5; skew-y: 356.5; scale-x: -10000; scale-y: 0.904999971; }
        frame 206 { x: 43.9000015; y: 74.8000031; skew-x: 358.700012; skew-y: 358.700012; scale-y: 0.934000015; }
        frame 207 { x: 44.7999992; y: 73.0999985; skew-x: 360.799988; skew-y: 360.799988; scale-y: 0.962000012; }
        frame 208 { x: 46; y: 71.4000015; skew-x: 363.299988; skew-y: 363.299988; scale-y: 0.99000001; }
        frame 209 { x: 47.0999985; y: 69.8000031; skew-x: 365.600006; skew-y: 365.600006; scale-y: 1.01800001; }
        frame 210 { x: 45.2999992; y: 70.0999985; skew-x: 360; skew-y: 360; scale-y: 1.03100002; }
        frame 211 { x: 43.5; y: 70.6999969; skew-x: 354.5; skew-y: 354.5; scale-y: 1.04400003; }
        frame 212 { x: 41.7000008; y: 71.5; skew-x: 348.700012; skew-y: 348.700012; scale-x: 0.84799999; scale-y: 1.05700004; }
        frame 213 { x: 39.9000015; y: 72.5; skew-x: 343; skew-y: 343; scale-x: 0.848999977; scale-y: 1.07099998; }
        frame 214 { x: 39; y: 75.6999969; skew-x: 337.899994; skew-y: 337.799988; scale-x: 0.84799999; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_innerleg_lower";
        frame-count: 215;
        frame 0 { x: 33.5; y: 95.9000015; scale-x: 0.850000024; scale-y: 0.850000024; image: IMAGE_REANIM_ZOMBIE_LADDER_INNERLEG_LOWER; }
        frame 1 { x: 33.4000015; y: 95.8000031; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 33.2000008; y: 95.5999985; }
        frame 3 { x: 33; y: 95.5; }
        frame 4 { x: 32.9000015; y: 95.3000031; }
        frame 5 { x: 32.7999992; y: 95.1999969; }
        frame 6 { x: 32.5999985; y: 95; }
        frame 7 { x: 32.7999992; y: 95.1999969; }
        frame 8 { x: 32.9000015; y: 95.3000031; }
        frame 9 { x: 33; y: 95.5; }
        frame 10 { x: 33.2000008; y: 95.5999985; }
        frame 11 { x: 33.4000015; y: 95.8000031; }
        frame 12 { x: 33.5; y: 95.9000015; }
        frame 13 { x: 33.5999985; y: 96.0999985; }
        frame 14 { x: 33.7000008; y: 96.1999969; }
        frame 15 { x: 33.7999992; y: 96.3000031; }
        frame 16 { x: 33.9000015; y: 96.4000015; }
        frame 17 { x: 34; y: 96.5999985; }
        frame 18 { y: 96.6999969; }
        frame 19 { y: 96.5999985; }
        frame 20 { x: 33.9000015; y: 96.4000015; }
        frame 21 { x: 33.7999992; y: 96.3000031; }
        frame 22 { x: 33.7000008; y: 96.1999969; }
        frame 23 { x: 33.5999985; y: 96.0999985; }
        frame 24 { x: 33.5; y: 95.9000015; }
        frame 25 { x: -10000; y: -10000; }
        frame 26 { x: 34.0999985; y: 95.5; skew-x: 1.5; skew-y: 1.5; }
        frame 27 { x: 34.9000015; y: 94.9000015; skew-x: 3; skew-y: 3; }
        frame 28 { x: 35.5; y: 94.5999985; skew-x: 4.5999999; skew-y: 4.5999999; }
        frame 29 { x: 36.2999992; y: 94; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 30 { x: 35.7999992; y: 96.5; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 31 { x: -10000; y: 99; skew-x: -8.69999981; skew-y: -8.69999981; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 36; y: 101.599998; skew-x: -16.2000008; skew-y: -16.2000008; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 33 { x: 36.5; y: 104.5; skew-x: -23.8999996; skew-y: -23.8999996; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 37.9000015; y: 108.199997; skew-x: -34; skew-y: -34; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 35 { x: 40; y: 111.800003; skew-x: -44; skew-y: -44; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 36 { x: 42.7999992; y: 115.5; skew-x: -54.2999992; skew-y: -54.2999992; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 46.0999985; y: 118.800003; skew-x: -64.3000031; skew-y: -64.3000031; }
        frame 38 { x: 49.9000015; y: 121.699997; skew-x: -74.3000031; skew-y: -74.3000031; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 39 { x: 51.7999992; y: 122.5; skew-x: -78.0999985; skew-y: -78.0999985; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 40 { x: 53.5; y: 123.300003; skew-x: -81.8000031; skew-y: -81.8000031; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 55.4000015; y: 124; skew-x: -85.4000015; skew-y: -85.4000015; }
        frame 42 { x: 57.2999992; y: 124.599998; skew-x: -89.0999985; skew-y: -89.0999985; }
        frame 43 { x: 59.0999985; y: 125.099998; skew-x: -92.6999969; skew-y: -92.6999969; }
        frame 44 { x: 59; y: 125.5; skew-x: -94.6999969; skew-y: -94.6999969; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 45 { x: -10000; y: 125.800003; skew-x: -96.9000015; skew-y: -96.9000015; scale-x: -10000; scale-y: -10000; }
        frame 46 { y: 126.199997; skew-x: -99.1999969; skew-y: -99.1999969; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 47 { y: 126.400002; skew-x: -101.400002; skew-y: -101.400002; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 48 { x: 58.7999992; y: -10000; skew-x: -101.699997; skew-y: -101.699997; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 49 { x: 58.5999985; skew-x: -101.900002; skew-y: -101.900002; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 58.2999992; skew-x: -102.199997; skew-y: -102.199997; }
        frame 51 { x: 58.0999985; y: 126.5; skew-x: -102.699997; skew-y: -102.699997; }
        frame 52 { x: 57.9000015; y: 126.599998; skew-x: -103; skew-y: -103; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 53 { x: 52.7999992; y: 124.599998; skew-x: -96.4000015; skew-y: -96.4000015; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 54 { x: 48; y: 122.400002; skew-x: -89.9000015; skew-y: -89.9000015; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 43.2000008; y: 120.099998; skew-x: -83.5999985; skew-y: -83.5999985; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 56 { x: 37.7999992; y: 120.199997; skew-x: -80.5999985; skew-y: -80.5999985; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 32.2999992; y: 120.099998; skew-x: -77.5999985; skew-y: -77.5999985; }
        frame 58 { x: 28; y: 116.300003; skew-x: -66.8000031; skew-y: -66.8000031; scale-x: 0.841000021; scale-y: 0.890999973; }
        frame 59 { x: 24.3999996; y: 111.800003; skew-x: -56; skew-y: -56; scale-x: 0.838999987; scale-y: 0.93900001; }
        frame 60 { x: 21.7999992; y: 106.699997; skew-x: -45; skew-y: -45; scale-x: -10000; scale-y: 0.987999976; }
        frame 61 { x: 20; y: 101.400002; skew-x: -34.2000008; skew-y: -34.2000008; scale-x: 0.838; scale-y: 1.03799999; }
        frame 62 { x: 19.2999992; y: 96.0999985; skew-x: -23.3999996; skew-y: -23.3999996; scale-x: -10000; scale-y: 1.08800006; }
        frame 63 { x: 23.1000004; y: 95.6999969; skew-x: -16.2000008; skew-y: -16.2000008; scale-x: 0.839999974; scale-y: 1.028; }
        frame 64 { x: 27; y: 95.5; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: 0.842999995; scale-y: 0.967999995; }
        frame 65 { x: 31.2000008; y: -10000; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.846000016; scale-y: 0.908999979; }
        frame 66 { x: 35.2999992; y: 95.5999985; skew-x: 4.80000019; skew-y: 4.80000019; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 67 { x: 34.7999992; y: 95.8000031; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 34.5; y: 95.6999969; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 69 { x: 34.0999985; y: 95.8000031; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 70 { x: 33.7999992; y: 95.9000015; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 33.5; y: -10000; skew-x: 0; skew-y: 0; }
        frame 72 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { y: 95.5999985; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 74 { y: 95.5; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 75 { y: 95.3000031; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 76 { y: -10000; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 77 { x: 33.5999985; skew-x: -4.9000001; skew-y: -4.9000001; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 78 { x: 33.7999992; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 33.9000015; y: 95.5; skew-x: -7; skew-y: -7; }
        frame 80 { x: -10000; y: 95.6999969; skew-x: -8.19999981; skew-y: -8.19999981; }
        frame 81 { x: 32.2000008; y: 96; skew-x: -6.9000001; skew-y: -6.9000001; }
        frame 82 { x: 30.5; y: 96.3000031; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 83 { x: 29; y: 96.6999969; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 84 { x: 30.2999992; y: 94.8000031; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: -10000; scale-y: 0.88499999; }
        frame 85 { x: 31.7000008; y: 93.0999985; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.848999977; scale-y: 0.920000017; }
        frame 86 { x: 33.0999985; y: 91.5; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: 0.953999996; }
        frame 87 { x: 34.7999992; y: 89.8000031; skew-x: 10.1999998; skew-y: 10.1999998; scale-y: 0.99000001; }
        frame 88 { x: 33.7999992; y: 91.1999969; skew-x: 7.80000019; skew-y: 7.80000019; scale-y: 0.953999996; }
        frame 89 { x: 33; y: 92.5; skew-x: 5.5; skew-y: 5.5; scale-y: 0.91900003; }
        frame 90 { x: 32.0999985; y: 93.9000015; skew-x: 3; skew-y: 3; scale-y: 0.88499999; }
        frame 91 { x: 31.3999996; y: 95.1999969; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 92 { x: 31.8999996; y: 95.4000015; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 32.5; y: 95.5999985; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 94 { x: 33; y: 95.8000031; skew-x: 0; skew-y: 0; }
        frame 95 { x: 33.5; y: 95.9000015; skew-x: -10000; skew-y: -10000; }
        frame 96 { x: -10000; y: -10000; }
        frame 97 { x: 32; y: 96.5999985; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 98 { x: 30.6000004; y: 97.3000031; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 99 { x: 29.1000004; y: 97.9000015; skew-x: -6.9000001; skew-y: -6.9000001; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 100 { x: 27.7000008; y: 98.6999969; skew-x: -9.39999962; skew-y: -9.39999962; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 101 { x: 26.7000008; y: 99.3000031; skew-x: -11.6999998; skew-y: -11.6999998; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 102 { x: 25.7999992; y: 100.099998; skew-x: -13.8999996; skew-y: -13.8999996; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 103 { x: 24.7000008; y: 100.800003; skew-x: -16.2000008; skew-y: -16.2000008; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 23.7000008; y: 101.599998; skew-x: -18.3999996; skew-y: -18.3999996; }
        frame 105 { x: 22.3999996; y: 103.699997; skew-x: -25.2000008; skew-y: -25.2000008; scale-y: 0.842999995; }
        frame 106 { x: 21.3999996; y: 105.800003; skew-x: -32; skew-y: -32; scale-y: 0.838999987; }
        frame 107 { x: 20.7000008; y: 108; skew-x: -38.7999992; skew-y: -38.7999992; scale-y: 0.834999979; }
        frame 108 { x: 20.2999992; y: 110.099998; skew-x: -45.5; skew-y: -45.5; scale-x: 0.850000024; scale-y: 0.832000017; }
        frame 109 { x: 19.7000008; y: 111.300003; skew-x: -48.2999992; skew-y: -48.2999992; scale-x: 0.848999977; scale-y: 0.828999996; }
        frame 110 { x: 19; y: 112.300003; skew-x: -51; skew-y: -51; scale-x: 0.850000024; scale-y: 0.825999975; }
        frame 111 { x: 18.3999996; y: 113.599998; skew-x: -53.7999992; skew-y: -53.7999992; scale-x: 0.851000011; scale-y: 0.824000001; }
        frame 112 { x: 17.7999992; y: 114.599998; skew-x: -56.4000015; skew-y: -56.4000015; scale-x: 0.852999985; scale-y: 0.823000014; }
        frame 113 { x: 21.8999996; y: 118.199997; skew-x: -73.0999985; skew-y: -71.3000031; scale-x: 0.851000011; scale-y: -10000; }
        frame 114 { x: 27.1000004; y: 120.599998; skew-x: -89.5999985; skew-y: -86.0999985; scale-x: -10000; scale-y: 0.824000001; }
        frame 115 { x: 32.9000015; y: 121.5; skew-x: -105.900002; skew-y: -100.699997; scale-x: 0.848999977; scale-y: 0.824999988; }
        frame 116 { x: 39; y: 120.800003; skew-x: -122.5; skew-y: -115.699997; scale-x: -10000; scale-y: 0.825999975; }
        frame 117 { x: 40.5; y: 116.800003; skew-x: -139.800003; skew-y: -134; scale-x: 0.861000001; scale-y: 0.964999974; }
        frame 118 { x: 42.4000015; y: 111.699997; skew-x: -157; skew-y: -152.300003; scale-x: 0.875999987; scale-y: 1.10599995; }
        frame 119 { x: 43; y: 111.099998; skew-x: -158.600006; skew-y: -153.800003; scale-x: 0.874000013; scale-y: 1.10399997; }
        frame 120 { x: 43.4000015; y: 110.5; skew-x: -160.100006; skew-y: -155.300003; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 43.9000015; y: 110; skew-x: -161.600006; skew-y: -156.800003; scale-y: 1.10500002; }
        frame 122 { x: 41.5; y: 118.199997; skew-x: -153.300003; skew-y: -148.300003; scale-x: 0.866999984; scale-y: 1.07799995; }
        frame 123 { x: 39.0999985; y: 126.099998; skew-x: -145.100006; skew-y: -140; scale-x: 0.860000014; scale-y: 1.05200005; }
        frame 124 { x: 36.5999985; y: 133.600006; skew-x: -136.800003; skew-y: -131.5; scale-x: 0.852999985; scale-y: 1.02699995; }
        frame 125 { x: 34.0999985; y: 140.600006; skew-x: -128.5; skew-y: -123; scale-x: 0.84799999; scale-y: 1.00300002; }
        frame 126 { x: 30.8999996; y: 143.899994; skew-x: -120; skew-y: -114.5; scale-x: 0.847000003; scale-y: 1.02600002; }
        frame 127 { x: 33.4000015; y: 143.600006; skew-x: -127.5; skew-y: -122; scale-x: 0.845000029; scale-y: 1.023; }
        frame 128 { x: 35.9000015; y: 142.800003; skew-x: -135.100006; skew-y: -129.600006; scale-x: -10000; scale-y: 1.02400005; }
        frame 129 { x: 34.2000008; y: 143.300003; skew-x: -130; skew-y: -124.5; scale-x: 0.843999982; scale-y: 1.023; }
        frame 130 { x: 32.5999985; y: 143.699997; skew-x: -125; skew-y: -119.5; scale-x: 0.845000029; scale-y: 1.02400005; }
        frame 131 { x: 30.8999996; y: 143.899994; skew-x: -120; skew-y: -114.5; scale-x: 0.847000003; scale-y: 1.02600002; }
        frame 132 { x: 33.5; y: 95.9000015; skew-x: 0; skew-y: 0; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 133 { x: 34.0999985; y: 95.5; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 134 { x: 34.9000015; y: 94.9000015; skew-x: 3; skew-y: 3; }
        frame 135 { x: 35.5; y: 94.5999985; skew-x: 4.5999999; skew-y: 4.5999999; }
        frame 136 { x: 36.2999992; y: 94; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 137 { x: 35.7999992; y: 96.5; skew-x: -1.20000005; skew-y: -1.20000005; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 138 { x: -10000; y: 99; skew-x: -8.69999981; skew-y: -8.69999981; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 36; y: 101.599998; skew-x: -16.2000008; skew-y: -16.2000008; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 140 { x: 36.5; y: 104.5; skew-x: -23.8999996; skew-y: -23.8999996; scale-x: -10000; scale-y: -10000; }
        frame 141 { x: 37.9000015; y: 108.199997; skew-x: -34; skew-y: -34; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 142 { x: 40; y: 111.800003; skew-x: -44; skew-y: -44; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 143 { x: 42.7999992; y: 115.5; skew-x: -54.2999992; skew-y: -54.2999992; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 46.0999985; y: 118.800003; skew-x: -64.3000031; skew-y: -64.3000031; }
        frame 145 { x: 49.9000015; y: 121.699997; skew-x: -74.3000031; skew-y: -74.3000031; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 146 { x: 51.7999992; y: 122.5; skew-x: -78.0999985; skew-y: -78.0999985; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 147 { x: 53.5; y: 123.300003; skew-x: -81.8000031; skew-y: -81.8000031; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 55.4000015; y: 124; skew-x: -85.4000015; skew-y: -85.4000015; }
        frame 149 { x: 57.2999992; y: 124.599998; skew-x: -89.0999985; skew-y: -89.0999985; }
        frame 150 { x: 59.0999985; y: 125.099998; skew-x: -92.6999969; skew-y: -92.6999969; }
        frame 151 { x: 59; y: 125.5; skew-x: -94.6999969; skew-y: -94.6999969; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 152 { x: -10000; y: 125.800003; skew-x: -96.9000015; skew-y: -96.9000015; scale-x: -10000; scale-y: -10000; }
        frame 153 { y: 126.199997; skew-x: -99.1999969; skew-y: -99.1999969; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 154 { y: 126.400002; skew-x: -101.400002; skew-y: -101.400002; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 155 { x: 58.7999992; y: -10000; skew-x: -101.699997; skew-y: -101.699997; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 156 { x: 58.5999985; skew-x: -101.900002; skew-y: -101.900002; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 58.2999992; skew-x: -102.199997; skew-y: -102.199997; }
        frame 158 { x: 58.0999985; y: 126.5; skew-x: -102.699997; skew-y: -102.699997; }
        frame 159 { x: 57.9000015; y: 126.599998; skew-x: -103; skew-y: -103; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 160 { x: 52.7999992; y: 124.599998; skew-x: -96.4000015; skew-y: -96.4000015; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 161 { x: 48; y: 122.400002; skew-x: -89.9000015; skew-y: -89.9000015; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 43.2000008; y: 120.099998; skew-x: -83.5999985; skew-y: -83.5999985; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 163 { x: 37.7999992; y: 120.199997; skew-x: -80.5999985; skew-y: -80.5999985; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 32.2999992; y: 120.099998; skew-x: -77.5999985; skew-y: -77.5999985; }
        frame 165 { x: 28; y: 116.300003; skew-x: -66.8000031; skew-y: -66.8000031; scale-x: 0.841000021; scale-y: 0.890999973; }
        frame 166 { x: 24.3999996; y: 111.800003; skew-x: -56; skew-y: -56; scale-x: 0.838999987; scale-y: 0.93900001; }
        frame 167 { x: 21.7999992; y: 106.699997; skew-x: -45; skew-y: -45; scale-x: -10000; scale-y: 0.987999976; }
        frame 168 { x: 20; y: 101.400002; skew-x: -34.2000008; skew-y: -34.2000008; scale-x: 0.838; scale-y: 1.03799999; }
        frame 169 { x: 19.2999992; y: 96.0999985; skew-x: -23.3999996; skew-y: -23.3999996; scale-x: -10000; scale-y: 1.08800006; }
        frame 170 { x: 23.1000004; y: 95.6999969; skew-x: -16.2000008; skew-y: -16.2000008; scale-x: 0.839999974; scale-y: 1.028; }
        frame 171 { x: 27; y: 95.5; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: 0.842999995; scale-y: 0.967999995; }
        frame 172 { x: 31.2000008; y: -10000; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.846000016; scale-y: 0.908999979; }
        frame 173 { x: 35.2999992; y: 95.5999985; skew-x: 4.80000019; skew-y: 4.80000019; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 174 { x: 34.7999992; y: 95.8000031; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 34.5; y: 95.6999969; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 176 { x: 34.0999985; y: 95.8000031; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 177 { x: 33.7999992; y: 95.9000015; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: -10000; }
        frame 178 { x: 33.5; y: -10000; skew-x: 0; skew-y: 0; }
        frame 179 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 180 { y: 95.5999985; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 181 { y: 95.5; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 182 { y: 95.3000031; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 183 { y: -10000; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 184 { x: 33.5999985; skew-x: -4.9000001; skew-y: -4.9000001; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 185 { x: 33.7999992; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: -10000; scale-y: -10000; }
        frame 186 { x: 33.9000015; y: 95.5; skew-x: -7; skew-y: -7; }
        frame 187 { x: -10000; y: 95.6999969; skew-x: -8.19999981; skew-y: -8.19999981; }
        frame 188 { x: 32.2000008; y: 96; skew-x: -6.9000001; skew-y: -6.9000001; }
        frame 189 { x: 30.5; y: 96.3000031; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 190 { x: 29; y: 96.6999969; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 191 { x: 30.2999992; y: 94.8000031; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: -10000; scale-y: 0.88499999; }
        frame 192 { x: 31.7000008; y: 93.0999985; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: 0.848999977; scale-y: 0.920000017; }
        frame 193 { x: 33.0999985; y: 91.5; skew-x: 6.5; skew-y: 6.5; scale-x: -10000; scale-y: 0.953999996; }
        frame 194 { x: 34.7999992; y: 89.8000031; skew-x: 10.1999998; skew-y: 10.1999998; scale-y: 0.99000001; }
        frame 195 { x: 33.7999992; y: 91.1999969; skew-x: 7.80000019; skew-y: 7.80000019; scale-y: 0.953999996; }
        frame 196 { x: 33; y: 92.5; skew-x: 5.5; skew-y: 5.5; scale-y: 0.91900003; }
        frame 197 { x: 32.0999985; y: 93.9000015; skew-x: 3; skew-y: 3; scale-y: 0.88499999; }
        frame 198 { x: 31.3999996; y: 95.1999969; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 199 { x: 31.8999996; y: 95.4000015; skew-x: 0.5; skew-y: 0.5; scale-x: -10000; scale-y: -10000; }
        frame 200 { x: 32.5; y: 95.5999985; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 201 { x: 33; y: 95.8000031; skew-x: 0; skew-y: 0; }
        frame 202 { x: 33.5; y: 95.9000015; skew-x: -10000; skew-y: -10000; }
        frame 203 { x: -10000; y: -10000; }
        frame 204 { x: 33.2999992; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 205 { x: 33.0999985; y: 96.0999985; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 206 { x: 33; y: -10000; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 207 { x: 32.5999985; y: 96.1999969; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 208 { x: 32.5; y: 96.3000031; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 209 { x: 32.4000015; y: 96.5; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 210 { x: 33.5; y: 95.8000031; skew-x: -2.5; skew-y: -2.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 211 { x: 34.7999992; y: 95.3000031; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: -10000; scale-y: -10000; }
        frame 212 { x: 36; y: 94.8000031; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 213 { x: 37.4000015; y: 94.3000031; skew-x: 9.5; skew-y: 9.5; scale-x: -10000; scale-y: -10000; }
        frame 214 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_outerleg_foot";
        frame-count: 215;
        frame 0 { x: 50.5; y: 116.599998; skew-x: 356.5; skew-y: 356.5; scale-x: 0.850000024; scale-y: 0.850000024; image: IMAGE_REANIM_ZOMBIE_OUTERLEG_FOOT; }
        frame 1 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.848999977; scale-y: 0.848999977; image: none; }
        frame 2 { scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 3 { scale-x: -10000; scale-y: -10000; }
        frame 6 { skew-x: 356.399994; skew-y: 356.399994; }
        frame 7 { skew-x: 356.5; skew-y: 356.5; }
        frame 8 { skew-x: -10000; skew-y: -10000; }
        frame 10 { y: 116.5; }
        frame 11 { y: -10000; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 12 { y: 116.599998; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 13 { y: 116.699997; skew-x: 356; skew-y: 356; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 14 { y: 116.800003; skew-x: 355.5; skew-y: 355.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 50.4000015; y: 117; skew-x: 355; skew-y: 355; }
        frame 16 { x: -10000; y: 117.099998; skew-x: 354.5; skew-y: 354.5; }
        frame 17 { y: 117.199997; skew-x: 354; skew-y: 354; }
        frame 18 { x: 50.2999992; y: -10000; skew-x: 353.5; skew-y: 353.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 19 { x: 50.4000015; y: 117.099998; skew-x: 354; skew-y: 354; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 20 { x: 50.2999992; y: 117; skew-x: 354.5; skew-y: 354.5; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 50.4000015; y: 116.900002; skew-x: 355; skew-y: 355; }
        frame 22 { x: 50.5; y: 116.800003; skew-x: 355.5; skew-y: 355.5; }
        frame 23 { x: -10000; y: 116.599998; skew-x: 356; skew-y: 356; }
        frame 24 { y: -10000; skew-x: 356.5; skew-y: 356.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 25 { skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 50; y: 117.199997; skew-x: 354.5; skew-y: 354.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 27 { x: 49.5; y: 117.699997; skew-x: 352.5; skew-y: 352.5; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 48.7999992; y: 118.300003; skew-x: 350.399994; skew-y: 350.399994; }
        frame 29 { x: 48.2000008; y: 119; skew-x: 348.200012; skew-y: 348.200012; }
        frame 30 { x: 47.4000015; y: 119.599998; skew-x: 347; skew-y: 347; }
        frame 31 { x: 46.5; y: 119.900002; skew-x: 345.700012; skew-y: 345.700012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 32 { x: 45.5999985; y: 120.5; skew-x: 344.200012; skew-y: 344.200012; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 44.7999992; y: 121; skew-x: 342.899994; skew-y: 342.899994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 34 { x: 41.2000008; skew-x: 342.700012; skew-y: 342.700012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 35 { x: 37.5999985; y: 121.099998; skew-x: 342.5; skew-y: 342.5; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 36 { x: 34.0999985; y: 121.300003; skew-x: 342.200012; skew-y: 342.200012; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 37 { x: 30.6000004; y: 121.400002; skew-x: 342; skew-y: 342; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 27; y: 121.5; skew-x: 341.700012; skew-y: 341.700012; }
        frame 39 { x: 27.6000004; y: 120.199997; skew-x: 345.5; skew-y: 345.5; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 40 { x: 28.2000008; y: 119; skew-x: 349.200012; skew-y: 349.200012; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 28.8999996; y: 118; skew-x: 352.700012; skew-y: 352.700012; }
        frame 42 { x: 29.7000008; y: 116.800003; skew-x: 356.5; skew-y: 356.5; }
        frame 43 { x: 30.5; y: 115.699997; skew-x: 360; skew-y: 360; }
        frame 44 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 48 { x: 31.3999996; }
        frame 49 { x: 32.4000015; }
        frame 50 { x: 33.4000015; }
        frame 51 { x: 34.2999992; }
        frame 52 { x: 35.2999992; }
        frame 53 { x: 37.2999992; y: 116.099998; skew-x: 358.899994; skew-y: 358.899994; }
        frame 54 { x: 39.0999985; y: 116.5; skew-x: 357.700012; skew-y: 357.700012; }
        frame 55 { x: 41.0999985; y: 116.900002; skew-x: 356.5; skew-y: 356.5; }
        frame 56 { x: 43; y: 117.300003; skew-x: 355.200012; skew-y: 355.200012; }
        frame 57 { x: 45; y: 117.800003; skew-x: 354; skew-y: 354; }
        frame 58 { x: 46.5; y: 118.099998; skew-x: 352.700012; skew-y: 352.700012; }
        frame 59 { x: 48; y: 118.5; skew-x: 351.200012; skew-y: 351.200012; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 60 { x: 49.4000015; y: 118.800003; skew-x: 349.700012; skew-y: 349.700012; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 50.9000015; y: 119.199997; skew-x: 348.200012; skew-y: 348.200012; }
        frame 62 { x: 52.5; y: 119.5; skew-x: 346.700012; skew-y: 346.700012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 63 { x: 52; y: 118.699997; skew-x: 349.200012; skew-y: 349.200012; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 51.5; y: 118; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 65 { x: 51.0999985; y: 117.199997; skew-x: 354.200012; skew-y: 354.200012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 66 { x: 50.5; y: 116.599998; skew-x: 356.5; skew-y: 356.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 67 { x: 50.5999985; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 68 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 71 { x: 50.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 72 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { y: 116.800003; skew-x: 355.200012; skew-y: 355.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 74 { x: 50.2999992; y: 117.199997; skew-x: 354; skew-y: 354; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 50.2000008; y: 117.599998; skew-x: 352.700012; skew-y: 352.700012; }
        frame 76 { x: 50; y: 117.900002; skew-x: 351.399994; skew-y: 351.399994; }
        frame 77 { x: 49.9000015; y: 118.300003; skew-x: 349.200012; skew-y: 349.200012; }
        frame 78 { x: 49.7999992; y: 118.800003; skew-x: 346.700012; skew-y: 346.700012; }
        frame 79 { x: 49.5999985; y: 119.199997; skew-x: 344.399994; skew-y: 344.399994; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 80 { x: 49.5; y: 119.699997; skew-x: 341.899994; skew-y: 341.899994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 81 { x: 49.7000008; y: 118.699997; skew-x: 346.899994; skew-y: 346.899994; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 50; y: 117.699997; skew-x: 351.700012; skew-y: 351.700012; }
        frame 83 { x: 50.5; y: 116.599998; skew-x: 356.5; skew-y: 356.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 84 { x: 50.4000015; y: 116.900002; skew-x: 354.700012; skew-y: 354.700012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 85 { x: 50.2999992; y: 117.400002; skew-x: 352.700012; skew-y: 352.700012; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 50; y: 117.699997; skew-x: 350.700012; skew-y: 350.700012; }
        frame 87 { x: 49.9000015; y: 118.199997; skew-x: 348.700012; skew-y: 348.700012; }
        frame 88 { x: -10000; y: 118; skew-x: 349.5; skew-y: 349.5; }
        frame 89 { x: 50; y: 117.800003; skew-x: 350.399994; skew-y: 350.399994; }
        frame 90 { x: 49.9000015; y: 117.699997; skew-x: 351.200012; skew-y: 351.200012; }
        frame 91 { x: 50; y: 117.5; skew-x: 351.899994; skew-y: 351.899994; }
        frame 92 { x: 50.2000008; y: 117.199997; skew-x: 353.200012; skew-y: 353.200012; }
        frame 93 { x: 50.4000015; y: 117.099998; skew-x: 354.200012; skew-y: 354.200012; }
        frame 94 { x: 50.5; y: 116.800003; skew-x: 355.5; skew-y: 355.5; }
        frame 95 { x: -10000; y: 116.599998; skew-x: 356.5; skew-y: 356.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 96 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 50.2000008; y: 117.400002; skew-x: 353; skew-y: 353; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 98 { x: 50; y: 118.300003; skew-x: 349.399994; skew-y: 349.399994; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 49.7000008; y: 119.199997; skew-x: 345.700012; skew-y: 345.700012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 100 { x: 49.5999985; y: 120.099998; skew-x: 342.100006; skew-y: 342.100006; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 101 { x: 49.2999992; y: 120.599998; skew-x: 339.700012; skew-y: 339.700012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 102 { x: 49; y: 121; skew-x: 337.200012; skew-y: 337.200012; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 48.7999992; y: 121.5; skew-x: 334.700012; skew-y: 334.700012; }
        frame 104 { x: 48.5; y: 122; skew-x: 332.100006; skew-y: 332.100006; }
        frame 105 { x: 50.7999992; y: 123.5; skew-x: 321.100006; skew-y: 321.100006; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 106 { x: 53.7000008; y: 124.800003; skew-x: 310.100006; skew-y: 310.100006; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 107 { x: 57.4000015; y: 125.800003; skew-x: 299.100006; skew-y: 299.100006; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 61.7000008; y: 126.199997; skew-x: 288.100006; skew-y: 288.100006; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 109 { x: 67.3000031; y: 125.099998; skew-x: 273.799988; skew-y: 273.799988; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 110 { x: 73.3000031; y: 122.800003; skew-x: 259.899994; skew-y: 259.899994; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: 79.5999985; y: 119.199997; skew-x: 245.699997; skew-y: 245.699997; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 112 { x: 85.6999969; y: 114.5; skew-x: 231.5; skew-y: 231.5; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: 83.5; y: 107; skew-x: 219.600006; skew-y: 219.600006; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 114 { x: 80.9000015; y: 98.8000031; skew-x: 207.600006; skew-y: 207.600006; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 77.5999985; y: 89.8000031; skew-x: 195.600006; skew-y: 195.600006; }
        frame 116 { x: 73.8000031; y: 80.3000031; skew-x: 183.800003; skew-y: 183.800003; }
        frame 117 { x: 55.2999992; y: 65; skew-x: 160; skew-y: 160; scale-x: 0.841000021; scale-y: 0.841000021; }
        frame 118 { x: 33; y: 49.5; skew-x: 136.199997; skew-y: 136.199997; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 34.9000015; y: 51; skew-x: 139.399994; skew-y: 139.399994; scale-x: 0.838999987; scale-y: 0.838999987; }
        frame 120 { x: 36.5; y: 52.5999985; skew-x: 142.600006; skew-y: 142.600006; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 38.2999992; y: 54.2999992; skew-x: 145.899994; skew-y: 145.899994; scale-x: 0.839999974; scale-y: 0.839999974; }
        frame 122 { x: 53.9000015; y: 75.6999969; skew-x: 159.5; skew-y: 160.5; scale-x: 0.841000021; scale-y: 0.841000021; }
        frame 123 { x: 68.1999969; y: 96.8000031; skew-x: 173; skew-y: 175; scale-x: 0.843999982; scale-y: 0.845000029; }
        frame 124 { x: 67.8000031; y: 119.699997; skew-x: 186.5; skew-y: 189.300003; scale-x: 0.846000016; scale-y: 0.847000003; }
        frame 125 { x: 66.3000031; y: 141.899994; skew-x: 200.100006; skew-y: 204; scale-x: 0.848999977; scale-y: 0.850000024; }
        frame 126 { x: 67.0999985; y: 139.199997; skew-x: 197.300003; skew-y: 201.100006; scale-x: 0.84799999; scale-y: 0.848999977; }
        frame 127 { x: 67.8000031; y: 136.600006; skew-x: 194.5; skew-y: 198.300003; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: 68.5; y: 133.800003; skew-x: 191.800003; skew-y: 195.600006; }
        frame 129 { x: 69.1999969; y: 131; skew-x: 189; skew-y: 192.899994; scale-x: 0.848999977; }
        frame 130 { x: 67.8000031; y: 136.5; skew-x: 194.5; skew-y: 198.300003; scale-x: 0.84799999; }
        frame 131 { x: 66.3000031; y: 141.899994; skew-x: 200.100006; skew-y: 204; scale-x: 0.848999977; scale-y: 0.850000024; }
        frame 132 { x: 50.5; y: 116.599998; skew-x: 356.5; skew-y: 356.5; scale-x: 0.850000024; scale-y: -10000; }
        frame 133 { x: 50; y: 117.199997; skew-x: 354.5; skew-y: 354.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 134 { x: 49.5; y: 117.699997; skew-x: 352.5; skew-y: 352.5; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 48.7999992; y: 118.300003; skew-x: 350.399994; skew-y: 350.399994; }
        frame 136 { x: 48.2000008; y: 119; skew-x: 348.200012; skew-y: 348.200012; }
        frame 137 { x: 47.4000015; y: 119.599998; skew-x: 347; skew-y: 347; }
        frame 138 { x: 46.5; y: 119.900002; skew-x: 345.700012; skew-y: 345.700012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 139 { x: 45.5999985; y: 120.5; skew-x: 344.200012; skew-y: 344.200012; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 44.7999992; y: 121; skew-x: 342.899994; skew-y: 342.899994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 141 { x: 41.2000008; skew-x: 342.700012; skew-y: 342.700012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 142 { x: 37.5999985; y: 121.099998; skew-x: 342.5; skew-y: 342.5; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 143 { x: 34.0999985; y: 121.300003; skew-x: 342.200012; skew-y: 342.200012; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 144 { x: 30.6000004; y: 121.400002; skew-x: 342; skew-y: 342; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 27; y: 121.5; skew-x: 341.700012; skew-y: 341.700012; }
        frame 146 { x: 27.6000004; y: 120.199997; skew-x: 345.5; skew-y: 345.5; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 147 { x: 28.2000008; y: 119; skew-x: 349.200012; skew-y: 349.200012; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 28.8999996; y: 118; skew-x: 352.700012; skew-y: 352.700012; }
        frame 149 { x: 29.7000008; y: 116.800003; skew-x: 356.5; skew-y: 356.5; }
        frame 150 { x: 30.5; y: 115.699997; skew-x: 360; skew-y: 360; }
        frame 151 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 155 { x: 31.3999996; }
        frame 156 { x: 32.4000015; }
        frame 157 { x: 33.4000015; }
        frame 158 { x: 34.2999992; }
        frame 159 { x: 35.2999992; }
        frame 160 { x: 37.2999992; y: 116.099998; skew-x: 358.899994; skew-y: 358.899994; }
        frame 161 { x: 39.0999985; y: 116.5; skew-x: 357.700012; skew-y: 357.700012; }
        frame 162 { x: 41.0999985; y: 116.900002; skew-x: 356.5; skew-y: 356.5; }
        frame 163 { x: 43; y: 117.300003; skew-x: 355.200012; skew-y: 355.200012; }
        frame 164 { x: 45; y: 117.800003; skew-x: 354; skew-y: 354; }
        frame 165 { x: 46.5999985; y: 118.199997; skew-x: 351.700012; skew-y: 351.700012; }
        frame 166 { x: 48.2999992; y: 118.5; skew-x: 349.700012; skew-y: 349.700012; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 167 { x: 50; y: 118.800003; skew-x: 347.399994; skew-y: 347.399994; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 51.7999992; y: 119.300003; skew-x: 345.200012; skew-y: 345.200012; }
        frame 169 { x: 53.5; y: 119.599998; skew-x: 342.899994; skew-y: 342.899994; }
        frame 170 { x: 52.5999985; y: 119.099998; skew-x: 345.200012; skew-y: 345.200012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 171 { x: 51.7999992; y: 118.5; skew-x: 347.700012; skew-y: 347.700012; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 172 { x: 51; y: 117.800003; skew-x: 350; skew-y: 350; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 173 { x: 50.0999985; y: 117.5; skew-x: 352.200012; skew-y: 352.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 174 { x: -10000; y: 117.199997; skew-x: 353.200012; skew-y: 353.200012; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 50.2999992; y: 117; skew-x: 354; skew-y: 354; }
        frame 176 { x: -10000; y: 116.900002; skew-x: 354.700012; skew-y: 354.700012; }
        frame 177 { x: 50.4000015; y: 116.699997; skew-x: 355.700012; skew-y: 355.700012; }
        frame 178 { x: 50.5; y: 116.599998; skew-x: 356.5; skew-y: 356.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { y: 116.800003; skew-x: 355.200012; skew-y: 355.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 181 { x: 50.2999992; y: 117.199997; skew-x: 354; skew-y: 354; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 50.2000008; y: 117.599998; skew-x: 352.700012; skew-y: 352.700012; }
        frame 183 { x: 50; y: 117.900002; skew-x: 351.399994; skew-y: 351.399994; }
        frame 184 { x: 49.9000015; y: 118.300003; skew-x: 349.200012; skew-y: 349.200012; }
        frame 185 { x: 49.7999992; y: 118.800003; skew-x: 346.700012; skew-y: 346.700012; }
        frame 186 { x: 49.5999985; y: 119.199997; skew-x: 344.399994; skew-y: 344.399994; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 187 { x: 49.5; y: 119.699997; skew-x: 341.899994; skew-y: 341.899994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 188 { x: 49.7000008; y: 118.699997; skew-x: 346.899994; skew-y: 346.899994; scale-x: -10000; scale-y: -10000; }
        frame 189 { x: 50; y: 117.699997; skew-x: 351.700012; skew-y: 351.700012; }
        frame 190 { x: 50.5; y: 116.599998; skew-x: 356.5; skew-y: 356.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 191 { x: 50.4000015; y: 116.900002; skew-x: 354.700012; skew-y: 354.700012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 192 { x: 50.2999992; y: 117.400002; skew-x: 352.700012; skew-y: 352.700012; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 50; y: 117.699997; skew-x: 350.700012; skew-y: 350.700012; }
        frame 194 { x: 49.9000015; y: 118.199997; skew-x: 348.700012; skew-y: 348.700012; }
        frame 195 { x: -10000; y: 118; skew-x: 349.5; skew-y: 349.5; }
        frame 196 { x: 50; y: 117.800003; skew-x: 350.399994; skew-y: 350.399994; }
        frame 197 { x: 49.9000015; y: 117.699997; skew-x: 351.200012; skew-y: 351.200012; }
        frame 198 { x: 50; y: 117.5; skew-x: 351.899994; skew-y: 351.899994; }
        frame 199 { x: 50.2000008; y: 117.199997; skew-x: 353.200012; skew-y: 353.200012; }
        frame 200 { x: 50.4000015; y: 117.099998; skew-x: 354.200012; skew-y: 354.200012; }
        frame 201 { x: 50.5; y: 116.800003; skew-x: 355.5; skew-y: 355.5; }
        frame 202 { x: -10000; y: 116.599998; skew-x: 356.5; skew-y: 356.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 203 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 204 { skew-x: 355.899994; skew-y: 355.899994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 205 { x: 50.4000015; y: 116.800003; skew-x: 355.200012; skew-y: 355.200012; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: -10000; y: 117; skew-x: 354.5; skew-y: 354.5; }
        frame 207 { skew-x: 353.899994; skew-y: 353.899994; }
        frame 208 { x: 50.2999992; y: 117.199997; skew-x: 353.200012; skew-y: 353.200012; }
        frame 209 { x: 50.0999985; y: 117.300003; skew-x: 352.5; skew-y: 352.5; }
        frame 210 { x: 49.9000015; y: 117.900002; skew-x: 349.700012; skew-y: 349.700012; }
        frame 211 { x: 49.5999985; y: 118.599998; skew-x: 347; skew-y: 347; }
        frame 212 { x: 49.4000015; y: 119.300003; skew-x: 344.200012; skew-y: 344.200012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 213 { x: 49.2999992; y: 119.900002; skew-x: 341.399994; skew-y: 341.399994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 214 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_outerleg_lower";
        frame-count: 215;
        frame 0 { x: 60.5; y: 100; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.699999988; scale-y: 0.699999988; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERLEG_LOWER; }
        frame 1 { x: 61.0999985; y: 99.4000015; skew-x: 353.200012; skew-y: 353.200012; scale-x: 0.699000001; scale-y: 0.699000001; image: none; }
        frame 2 { x: 61.7999992; y: 98.8000031; skew-x: 354.5; skew-y: 354.5; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 3 { x: 62.5; y: 98.3000031; skew-x: 356; skew-y: 356; scale-x: -10000; scale-y: -10000; }
        frame 4 { x: 63.2000008; y: 97.6999969; skew-x: 357.200012; skew-y: 357.200012; }
        frame 5 { x: 63.9000015; y: 97.1999969; skew-x: 358.700012; skew-y: 358.700012; }
        frame 6 { x: 64.5999985; y: 96.5999985; skew-x: 360; skew-y: 360; }
        frame 7 { x: 63.9000015; y: 96.8000031; skew-x: 358.700012; skew-y: 358.700012; }
        frame 8 { x: 63.0999985; y: 97; skew-x: 357.200012; skew-y: 357.200012; }
        frame 9 { x: 62.5; y: 97.1999969; skew-x: 356; skew-y: 356; }
        frame 10 { x: 61.9000015; y: 97.5; skew-x: 354.5; skew-y: 354.5; }
        frame 11 { x: 61.2000008; y: 97.5999985; skew-x: 353.200012; skew-y: 353.200012; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 12 { x: 60.5; y: 98; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 13 { x: 60; y: 98.3000031; skew-x: 350.700012; skew-y: 350.700012; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 14 { x: 59.5; y: 98.6999969; skew-x: 349.5; skew-y: 349.5; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 59.0999985; y: 98.9000015; skew-x: 348.5; skew-y: 348.5; }
        frame 16 { x: 58.5999985; y: 99.3000031; skew-x: 347.200012; skew-y: 347.200012; }
        frame 17 { x: 58.2999992; y: 99.5; skew-x: 346.200012; skew-y: 346.200012; }
        frame 18 { x: 57.5999985; y: 99.8000031; skew-x: 345; skew-y: 345; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 19 { x: 58.0999985; y: -10000; skew-x: 346.200012; skew-y: 346.200012; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 20 { x: 58.5; skew-x: 347.200012; skew-y: 347.200012; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 59.0999985; y: 100; skew-x: 348.5; skew-y: 348.5; }
        frame 22 { x: 59.5; y: -10000; skew-x: 349.5; skew-y: 349.5; }
        frame 23 { x: 59.9000015; skew-x: 350.700012; skew-y: 350.700012; }
        frame 24 { x: 60.5; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 25 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 59.4000015; skew-x: 349.399994; skew-y: 349.399994; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 27 { x: 58.2999992; y: 99.8000031; skew-x: 346.899994; skew-y: 346.899994; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 57.0999985; y: 99.9000015; skew-x: 344.5; skew-y: 344.5; }
        frame 29 { x: 56; y: 99.8000031; skew-x: 341.899994; skew-y: 341.899994; }
        frame 30 { x: 55.0999985; y: 99.0999985; skew-x: 342.700012; skew-y: 342.700012; scale-x: 0.698000014; scale-y: 0.698000014; }
        frame 31 { x: 54.4000015; y: 98.3000031; skew-x: 343.700012; skew-y: 343.700012; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 53.5; y: 97.5; skew-x: 344.399994; skew-y: 344.399994; }
        frame 33 { x: 52.7999992; y: 96.8000031; skew-x: 345.100006; skew-y: 345.100006; }
        frame 34 { x: 51; y: 95.6999969; skew-x: 349.700012; skew-y: 349.700012; scale-x: 0.697000027; scale-y: 0.708000004; }
        frame 35 { x: 49.2999992; y: 94.5999985; skew-x: 354.200012; skew-y: 354.200012; scale-x: -10000; scale-y: 0.717999995; }
        frame 36 { x: 47.9000015; y: 93.6999969; skew-x: 358.700012; skew-y: 358.700012; scale-y: 0.727999985; }
        frame 37 { x: 46.5; y: 93; skew-x: 363; skew-y: 363; scale-x: 0.69599998; scale-y: 0.739000022; }
        frame 38 { x: 45.2999992; y: 92.1999969; skew-x: 367.600006; skew-y: 367.600006; scale-x: -10000; scale-y: 0.749000013; }
        frame 39 { x: 44; y: 92.9000015; skew-x: 364.799988; skew-y: 363.5; scale-y: 0.753000021; }
        frame 40 { x: 42.5999985; y: 93.6999969; skew-x: 362.299988; skew-y: 359.700012; scale-x: 0.697000027; scale-y: 0.757000029; }
        frame 41 { x: 41.4000015; y: 94.4000015; skew-x: 359.700012; skew-y: 355.700012; scale-x: 0.698000014; scale-y: 0.760999978; }
        frame 42 { x: 40.0999985; y: 95.3000031; skew-x: 357.200012; skew-y: 351.899994; scale-x: 0.699000001; scale-y: 0.763999999; }
        frame 43 { x: 38.7999992; y: 96.3000031; skew-x: 354.5; skew-y: 347.799988; scale-x: 0.699999988; scale-y: 0.768999994; }
        frame 44 { x: 37.9000015; y: 97.3000031; skew-x: 351.5; skew-y: 345.700012; scale-x: 0.698000014; scale-y: 0.764999986; }
        frame 45 { x: 37.2000008; y: 98.5; skew-x: 348.399994; skew-y: 343.399994; scale-x: 0.697000027; scale-y: 0.762000024; }
        frame 46 { x: 36.4000015; y: 99.5; skew-x: 345.399994; skew-y: 341.200012; scale-x: 0.694999993; scale-y: 0.759000003; }
        frame 47 { x: 35.5999985; y: 100.699997; skew-x: 342.200012; skew-y: 338.799988; scale-x: 0.694000006; scale-y: 0.755999982; }
        frame 48 { x: 37; y: 99.8000031; skew-x: 343.200012; skew-y: 340.399994; scale-x: -10000; scale-y: 0.76700002; }
        frame 49 { x: 38.5; y: 99; skew-x: 343.899994; skew-y: 341.899994; scale-y: 0.777999997; }
        frame 50 { x: 39.7999992; y: 98.0999985; skew-x: 344.700012; skew-y: 343.399994; scale-y: 0.788999975; }
        frame 51 { x: 41.2999992; y: 97.3000031; skew-x: 345.700012; skew-y: 344.899994; scale-y: 0.800000012; }
        frame 52 { x: 42.5999985; y: 96.5; skew-x: 346.299988; skew-y: 346.299988; scale-x: 0.694999993; scale-y: 0.811999977; }
        frame 53 { x: 44.0999985; y: 97.3000031; skew-x: 345; skew-y: 345; scale-x: 0.694000006; scale-y: 0.787999988; }
        frame 54 { x: 45.7000008; y: 98.0999985; skew-x: 343.700012; skew-y: 343.700012; scale-x: -10000; scale-y: 0.763999999; }
        frame 55 { x: 47.0999985; y: 98.8000031; skew-x: 342.200012; skew-y: 342.200012; scale-y: 0.740999997; }
        frame 56 { x: 48.7000008; y: 99.6999969; skew-x: 340.700012; skew-y: 340.700012; scale-y: 0.717000008; }
        frame 57 { x: 50.2999992; y: 100.5; skew-x: 339.299988; skew-y: 339.299988; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 58 { x: 51.9000015; y: -10000; skew-x: 338.700012; skew-y: 338.700012; scale-x: 0.694000006; scale-y: 0.694000006; }
        frame 59 { x: 53.2999992; y: 100.599998; skew-x: 338; skew-y: 338; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 54.9000015; y: 100.5; skew-x: 337.399994; skew-y: 337.399994; }
        frame 61 { x: 56.2999992; y: 100.599998; skew-x: 336.700012; skew-y: 336.700012; }
        frame 62 { x: 57.7999992; y: 100.699997; skew-x: 336; skew-y: 336; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 63 { x: 56.7999992; y: 100.5; skew-x: 338.200012; skew-y: 335.700012; scale-x: 0.698000014; scale-y: 0.720000029; }
        frame 64 { x: 55.7999992; y: 100.199997; skew-x: 340.5; skew-y: 335.200012; scale-x: 0.700999975; scale-y: 0.746999979; }
        frame 65 { x: 54.7999992; y: 99.8000031; skew-x: 342.700012; skew-y: 334.899994; scale-x: 0.704999983; scale-y: 0.773999989; }
        frame 66 { x: 53.5999985; y: 99.5; skew-x: 344.799988; skew-y: 334.5; scale-x: 0.708999991; scale-y: 0.800999999; }
        frame 67 { x: 55; y: 99.3000031; skew-x: 346.200012; skew-y: 338; scale-x: 0.707000017; scale-y: 0.779999971; }
        frame 68 { x: 56.5; y: 99.5; skew-x: 347.700012; skew-y: 341.399994; scale-x: 0.704999983; scale-y: 0.75999999; }
        frame 69 { x: 57.7999992; y: -10000; skew-x: 349; skew-y: 344.899994; scale-x: 0.703000009; scale-y: 0.74000001; }
        frame 70 { x: 59.2000008; y: 99.5999985; skew-x: 350.5; skew-y: 348.399994; scale-x: 0.700999975; scale-y: 0.720000029; }
        frame 71 { x: 60.5; y: 100; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 60.9000015; y: 98.9000015; skew-x: 353.200012; skew-y: 353.200012; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 74 { x: 61.0999985; y: 97.9000015; skew-x: 354.700012; skew-y: 354.700012; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 61.4000015; y: 97; skew-x: 356; skew-y: 356; }
        frame 76 { x: 61.5999985; y: 95.9000015; skew-x: 357.299988; skew-y: 357.299988; }
        frame 77 { x: 61.9000015; y: 95.3000031; skew-x: 358.200012; skew-y: 358.200012; }
        frame 78 { x: 62.0999985; y: 94.6999969; skew-x: 359.200012; skew-y: 359.200012; }
        frame 79 { x: 62.2999992; y: 94.1999969; skew-x: 360; skew-y: 360; }
        frame 80 { x: 62.4000015; y: 93.5999985; skew-x: 360.799988; skew-y: 360.799988; }
        frame 81 { x: 60.4000015; y: 95.0999985; skew-x: 354.700012; skew-y: 354.700012; scale-y: 0.734000027; }
        frame 82 { x: 58.2999992; y: 96.6999969; skew-x: 348.700012; skew-y: 348.700012; scale-y: 0.768000007; }
        frame 83 { x: 56.0999985; y: 98.5; skew-x: 342.399994; skew-y: 342.399994; scale-y: 0.802999973; }
        frame 84 { x: 53.7999992; y: 101.099998; skew-x: 335.399994; skew-y: 335.399994; scale-x: 0.698000014; scale-y: 0.776000023; }
        frame 85 { x: 52; y: 103.900002; skew-x: 328.399994; skew-y: 328.399994; scale-x: -10000; scale-y: 0.749000013; }
        frame 86 { x: 50.2000008; y: 106.300003; skew-x: 321.600006; skew-y: 321.600006; scale-x: 0.697000027; scale-y: 0.72299999; }
        frame 87 { x: 49; y: 109.199997; skew-x: 314.600006; skew-y: 314.600006; scale-x: 0.698000014; scale-y: 0.698000014; }
        frame 88 { x: 50.2999992; y: 106.699997; skew-x: 320.700012; skew-y: 320.700012; scale-x: 0.697000027; scale-y: 0.697000027; }
        frame 89 { x: 51.5999985; y: 104.199997; skew-x: 326.899994; skew-y: 326.899994; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 53.2999992; y: 101.800003; skew-x: 333.200012; skew-y: 333.200012; }
        frame 91 { x: 55; y: 99.5; skew-x: 339.200012; skew-y: 339.200012; scale-x: 0.698000014; scale-y: 0.698000014; }
        frame 92 { x: 56.2999992; y: 99.5999985; skew-x: 342.399994; skew-y: 342.399994; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 57.7000008; y: 99.6999969; skew-x: 345.5; skew-y: 345.5; }
        frame 94 { x: 59.0999985; y: 99.8000031; skew-x: 348.700012; skew-y: 348.700012; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 95 { x: 60.5; y: 100; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 59.4000015; y: 99.8000031; skew-x: 349.5; skew-y: 349.5; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 98 { x: 58.2999992; y: -10000; skew-x: 347; skew-y: 347; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 57.0999985; y: 99.5999985; skew-x: 344.700012; skew-y: 344.700012; }
        frame 100 { x: 56.0999985; y: -10000; skew-x: 342.200012; skew-y: 342.200012; }
        frame 101 { x: 55.9000015; y: 98.8000031; skew-x: -10000; skew-y: -10000; scale-x: 0.698000014; scale-y: 0.698000014; }
        frame 102 { x: 55.5; y: 98.1999969; skew-x: 342; skew-y: 342; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 55.2999992; y: 97.4000015; skew-x: 341.899994; skew-y: 341.899994; }
        frame 104 { x: 54.9000015; y: 96.6999969; skew-x: 341.700012; skew-y: 341.700012; }
        frame 105 { x: 52.5999985; y: 97.1999969; skew-x: 333.399994; skew-y: 333.399994; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 106 { x: 50.5; y: 97.8000031; skew-x: 325.100006; skew-y: 325.100006; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 107 { x: 48.9000015; y: 98.6999969; skew-x: 316.600006; skew-y: 316.600006; scale-x: -10000; scale-y: -10000; }
        frame 108 { x: 47.5999985; y: 99.5; skew-x: 308.299988; skew-y: 308.299988; }
        frame 109 { x: 46.4000015; y: 100; skew-x: 299.799988; skew-y: 299.799988; scale-x: 0.694000006; scale-y: 0.722000003; }
        frame 110 { x: 45.2999992; y: 100.599998; skew-x: 291.100006; skew-y: 291.100006; scale-x: -10000; scale-y: 0.750999987; }
        frame 111 { x: 44.5; y: 101; skew-x: 282.5; skew-y: 282.5; scale-y: 0.779999971; }
        frame 112 { x: 44.2999992; y: 101.5; skew-x: 274; skew-y: 274; scale-y: 0.808000028; }
        frame 113 { x: 41.4000015; y: 100.300003; skew-x: 265.200012; skew-y: 265.200012; scale-x: 0.693000019; scale-y: 0.778999984; }
        frame 114 { x: 39; y: 98.5; skew-x: 256.200012; skew-y: 256.200012; scale-x: 0.691999972; scale-y: 0.749000013; }
        frame 115 { x: 36.7999992; y: 96.1999969; skew-x: 247.199997; skew-y: 247.199997; scale-x: 0.690999985; scale-y: 0.718999982; }
        frame 116 { x: 34.5; y: 93.3000031; skew-x: 238.199997; skew-y: 238.199997; scale-x: -10000; scale-y: 0.690999985; }
        frame 117 { x: 28.6000004; y: 92.5; skew-x: 208.300003; skew-y: 208.300003; scale-x: 0.689999998; scale-y: 0.689999998; }
        frame 118 { x: 21.5; y: 87; skew-x: 178.600006; skew-y: 178.600006; scale-x: -10000; scale-y: -10000; }
        frame 119 { x: 21.1000004; y: 87.5999985; skew-x: 181.800003; skew-y: 181.800003; }
        frame 120 { x: 20.7000008; y: 88.1999969; skew-x: 185; skew-y: 185; scale-x: 0.68900001; scale-y: 0.68900001; }
        frame 121 { x: 20.2999992; y: 88.8000031; skew-x: 188.399994; skew-y: 188.399994; scale-x: -10000; scale-y: -10000; }
        frame 122 { x: 22.1000004; y: 102.099998; skew-x: 226.600006; skew-y: 225.100006; scale-x: 0.689999998; scale-y: 0.689999998; }
        frame 123 { x: 23.7999992; y: 107.800003; skew-x: 264.700012; skew-y: 262; scale-x: 0.693000019; scale-y: 0.694000006; }
        frame 124 { x: 19.2000008; y: 118.300003; skew-x: 282.299988; skew-y: 278.299988; scale-x: 0.694999993; scale-y: 0.69599998; }
        frame 125 { x: 16; y: 127.800003; skew-x: 300.100006; skew-y: 294.700012; scale-x: 0.698000014; scale-y: 0.699000001; }
        frame 126 { y: 127.199997; skew-x: 299.299988; skew-y: 293.799988; scale-x: 0.697000027; scale-y: 0.698000014; }
        frame 127 { x: 15.8999996; y: 126.800003; skew-x: 298.600006; skew-y: 293.100006; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -10000; y: 126.199997; skew-x: 297.799988; skew-y: 292.299988; }
        frame 129 { y: 125.800003; skew-x: 297.200012; skew-y: 291.700012; scale-x: 0.698000014; scale-y: 0.699000001; }
        frame 130 { x: 16; y: 126.800003; skew-x: 298.600006; skew-y: 293.100006; scale-x: 0.697000027; scale-y: 0.698000014; }
        frame 131 { x: -10000; y: 127.800003; skew-x: 300.100006; skew-y: 294.700012; scale-x: 0.698000014; scale-y: 0.699000001; }
        frame 132 { x: 60.5; y: 100; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 133 { x: 59.4000015; y: -10000; skew-x: 349.399994; skew-y: 349.399994; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 134 { x: 58.2999992; y: 99.8000031; skew-x: 346.899994; skew-y: 346.899994; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 57.0999985; y: 99.9000015; skew-x: 344.5; skew-y: 344.5; }
        frame 136 { x: 56; y: 99.8000031; skew-x: 341.899994; skew-y: 341.899994; }
        frame 137 { x: 55.0999985; y: 99.0999985; skew-x: 342.700012; skew-y: 342.700012; scale-x: 0.698000014; scale-y: 0.698000014; }
        frame 138 { x: 54.4000015; y: 98.3000031; skew-x: 343.700012; skew-y: 343.700012; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 53.5; y: 97.5; skew-x: 344.399994; skew-y: 344.399994; }
        frame 140 { x: 52.7999992; y: 96.8000031; skew-x: 345.100006; skew-y: 345.100006; }
        frame 141 { x: 51; y: 95.6999969; skew-x: 349.700012; skew-y: 349.700012; scale-x: 0.697000027; scale-y: 0.708000004; }
        frame 142 { x: 49.2999992; y: 94.5999985; skew-x: 354.200012; skew-y: 354.200012; scale-x: -10000; scale-y: 0.717999995; }
        frame 143 { x: 47.9000015; y: 93.6999969; skew-x: 358.700012; skew-y: 358.700012; scale-y: 0.727999985; }
        frame 144 { x: 46.5; y: 93; skew-x: 363; skew-y: 363; scale-x: 0.69599998; scale-y: 0.739000022; }
        frame 145 { x: 45.2999992; y: 92.1999969; skew-x: 367.600006; skew-y: 367.600006; scale-x: -10000; scale-y: 0.749000013; }
        frame 146 { x: 44; y: 92.9000015; skew-x: 364.799988; skew-y: 363.5; scale-y: 0.753000021; }
        frame 147 { x: 42.5999985; y: 93.6999969; skew-x: 362.299988; skew-y: 359.700012; scale-x: 0.697000027; scale-y: 0.757000029; }
        frame 148 { x: 41.4000015; y: 94.4000015; skew-x: 359.700012; skew-y: 355.700012; scale-x: 0.698000014; scale-y: 0.760999978; }
        frame 149 { x: 40.0999985; y: 95.3000031; skew-x: 357.200012; skew-y: 351.899994; scale-x: 0.699000001; scale-y: 0.763999999; }
        frame 150 { x: 38.7999992; y: 96.3000031; skew-x: 354.5; skew-y: 347.799988; scale-x: 0.699999988; scale-y: 0.768999994; }
        frame 151 { x: 37.9000015; y: 97.3000031; skew-x: 351.5; skew-y: 345.700012; scale-x: 0.698000014; scale-y: 0.764999986; }
        frame 152 { x: 37.2000008; y: 98.5; skew-x: 348.399994; skew-y: 343.399994; scale-x: 0.697000027; scale-y: 0.762000024; }
        frame 153 { x: 36.4000015; y: 99.5; skew-x: 345.399994; skew-y: 341.200012; scale-x: 0.694999993; scale-y: 0.759000003; }
        frame 154 { x: 35.5999985; y: 100.699997; skew-x: 342.200012; skew-y: 338.799988; scale-x: 0.694000006; scale-y: 0.755999982; }
        frame 155 { x: 37; y: 99.8000031; skew-x: 343.200012; skew-y: 340.399994; scale-x: -10000; scale-y: 0.76700002; }
        frame 156 { x: 38.5; y: 99; skew-x: 343.899994; skew-y: 341.899994; scale-y: 0.777999997; }
        frame 157 { x: 39.7999992; y: 98.0999985; skew-x: 344.700012; skew-y: 343.399994; scale-y: 0.788999975; }
        frame 158 { x: 41.2999992; y: 97.3000031; skew-x: 345.700012; skew-y: 344.899994; scale-y: 0.800000012; }
        frame 159 { x: 42.5999985; y: 96.5; skew-x: 346.299988; skew-y: 346.299988; scale-x: 0.694999993; scale-y: 0.811999977; }
        frame 160 { x: 44.0999985; y: 97.3000031; skew-x: 345; skew-y: 345; scale-x: 0.694000006; scale-y: 0.787999988; }
        frame 161 { x: 45.7000008; y: 98.0999985; skew-x: 343.700012; skew-y: 343.700012; scale-x: -10000; scale-y: 0.763999999; }
        frame 162 { x: 47.0999985; y: 98.8000031; skew-x: 342.200012; skew-y: 342.200012; scale-y: 0.740999997; }
        frame 163 { x: 48.7000008; y: 99.6999969; skew-x: 340.700012; skew-y: 340.700012; scale-y: 0.717000008; }
        frame 164 { x: 50.2999992; y: 100.5; skew-x: 339.299988; skew-y: 339.299988; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 165 { x: 51.9000015; y: -10000; skew-x: 338.700012; skew-y: 338.700012; scale-x: 0.694000006; scale-y: 0.694000006; }
        frame 166 { x: 53.2999992; y: 100.599998; skew-x: 338; skew-y: 338; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 54.9000015; y: 100.5; skew-x: 337.399994; skew-y: 337.399994; }
        frame 168 { x: 56.2999992; y: 100.599998; skew-x: 336.700012; skew-y: 336.700012; }
        frame 169 { x: 57.7999992; y: 100.699997; skew-x: 336; skew-y: 336; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 170 { x: 56.7999992; y: 100.300003; skew-x: 338.700012; skew-y: -10000; scale-x: 0.698000014; scale-y: 0.711000025; }
        frame 171 { x: 55.7999992; y: 100; skew-x: 341.200012; scale-x: 0.700999975; scale-y: 0.727999985; }
        frame 172 { x: 54.5999985; y: 99.6999969; skew-x: 343.700012; skew-y: 335.899994; scale-x: 0.704999983; scale-y: 0.745000005; }
        frame 173 { x: 53.5; y: 99.1999969; skew-x: 346.200012; skew-y: -10000; scale-x: 0.709999979; scale-y: 0.763000011; }
        frame 174 { x: 55; y: 99.0999985; skew-x: 347.399994; skew-y: 339.200012; scale-x: 0.707000017; scale-y: 0.749000013; }
        frame 175 { x: 56.4000015; y: 99.3000031; skew-x: 348.5; skew-y: 342.200012; scale-x: 0.704999983; scale-y: 0.736999989; }
        frame 176 { x: 57.7999992; y: 99.4000015; skew-x: 349.700012; skew-y: 345.5; scale-x: 0.703000009; scale-y: 0.723999977; }
        frame 177 { x: 59.0999985; y: 99.5999985; skew-x: 350.700012; skew-y: 348.700012; scale-x: 0.700999975; scale-y: 0.712000012; }
        frame 178 { x: 60.5; y: 100; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 60.9000015; y: 98.9000015; skew-x: 353.200012; skew-y: 353.200012; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 181 { x: 61.0999985; y: 97.9000015; skew-x: 354.700012; skew-y: 354.700012; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 61.4000015; y: 97; skew-x: 356; skew-y: 356; }
        frame 183 { x: 61.5999985; y: 95.9000015; skew-x: 357.299988; skew-y: 357.299988; }
        frame 184 { x: 61.9000015; y: 95.3000031; skew-x: 358.200012; skew-y: 358.200012; }
        frame 185 { x: 62.0999985; y: 94.6999969; skew-x: 359.200012; skew-y: 359.200012; }
        frame 186 { x: 62.2999992; y: 94.1999969; skew-x: 360; skew-y: 360; }
        frame 187 { x: 62.4000015; y: 93.5999985; skew-x: 360.799988; skew-y: 360.799988; }
        frame 188 { x: 60.4000015; y: 95.0999985; skew-x: 354.700012; skew-y: 354.700012; scale-y: 0.734000027; }
        frame 189 { x: 58.2999992; y: 96.6999969; skew-x: 348.700012; skew-y: 348.700012; scale-y: 0.768000007; }
        frame 190 { x: 56.0999985; y: 98.5; skew-x: 342.399994; skew-y: 342.399994; scale-y: 0.802999973; }
        frame 191 { x: 52.5; y: 100.800003; skew-x: 333.899994; skew-y: 333.899994; scale-x: 0.698000014; scale-y: 0.822000027; }
        frame 192 { x: 49; y: 103.300003; skew-x: 325.399994; skew-y: 325.399994; scale-x: -10000; scale-y: 0.841000021; }
        frame 193 { x: 46; y: 106; skew-x: 316.899994; skew-y: 316.899994; scale-x: 0.697000027; scale-y: 0.861000001; }
        frame 194 { x: 43.4000015; y: 108.900002; skew-x: 308.5; skew-y: 308.5; scale-x: 0.698000014; scale-y: 0.883000016; }
        frame 195 { x: 46.2000008; y: 106.300003; skew-x: 316.100006; skew-y: 316.100006; scale-x: 0.697000027; scale-y: 0.851999998; }
        frame 196 { x: 49.2999992; y: 103.800003; skew-x: 323.899994; skew-y: 323.899994; scale-x: -10000; scale-y: 0.824000001; }
        frame 197 { x: 52.5999985; y: 101.400002; skew-x: 331.600006; skew-y: 331.600006; scale-y: 0.795000017; }
        frame 198 { x: 56.2000008; y: 99.5; skew-x: 339.200012; skew-y: 339.200012; scale-x: 0.698000014; scale-y: 0.76700002; }
        frame 199 { x: 57.2999992; y: 99.5999985; skew-x: 342.399994; skew-y: 342.399994; scale-x: -10000; scale-y: 0.75; }
        frame 200 { x: 58.4000015; y: 99.6999969; skew-x: 345.5; skew-y: 345.5; scale-y: 0.73299998; }
        frame 201 { x: 59.5; y: 99.8000031; skew-x: 348.700012; skew-y: 348.700012; scale-x: 0.699000001; scale-y: 0.716000021; }
        frame 202 { x: 60.5; y: 100; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.699999988; scale-y: 0.699999988; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 204 { x: 60.5999985; y: 99.5; skew-x: 352.700012; skew-y: 352.700012; scale-x: 0.699000001; scale-y: 0.699000001; }
        frame 205 { x: 60.9000015; y: 99.0999985; skew-x: 353.5; skew-y: 353.5; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 61; y: 98.6999969; skew-x: 354.200012; skew-y: 354.200012; }
        frame 207 { x: 61.0999985; y: 98.1999969; skew-x: 355.200012; skew-y: 355.200012; }
        frame 208 { x: 61.4000015; y: 98; skew-x: 356; skew-y: 356; }
        frame 209 { x: 61.5; y: 97.5; skew-x: 356.799988; skew-y: 356.799988; }
        frame 210 { x: 59.0999985; y: 97.6999969; skew-x: 351.700012; skew-y: 351.700012; scale-y: 0.712000012; }
        frame 211 { x: 56.9000015; y: 97.8000031; skew-x: 346.700012; skew-y: 346.700012; scale-y: 0.723999977; }
        frame 212 { x: 54.5; y: 98.1999969; skew-x: 341.700012; skew-y: 341.700012; scale-x: 0.698000014; scale-y: 0.736999989; }
        frame 213 { x: 52.4000015; y: 98.6999969; skew-x: 336.399994; skew-y: 336.399994; scale-x: 0.699000001; scale-y: 0.75; }
        frame 214 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_outerleg_upper";
        frame-count: 215;
        frame 0 { x: 59.9000015; y: 81; skew-x: 0.800000012; skew-y: 2.29999995; scale-x: 0.702000022; scale-y: 0.73299998; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERLEG_UPPER; }
        frame 1 { x: -10000; y: 80.8000031; skew-x: -0.5; skew-y: 0.600000024; scale-x: 0.700999975; scale-y: 0.726999998; image: none; }
        frame 2 { x: 59.7999992; y: 80.5999985; skew-x: -1.60000002; skew-y: -0.699999988; scale-x: -10000; scale-y: 0.721000016; }
        frame 3 { x: -10000; y: 80.4000015; skew-x: -3; skew-y: -2.20000005; scale-x: 0.699999988; scale-y: 0.716000021; }
        frame 4 { x: 59.9000015; y: 80.1999969; skew-x: -4.0999999; skew-y: -3.5999999; scale-x: -10000; scale-y: 0.709999979; }
        frame 5 { x: -10000; y: 80.0999985; skew-x: -5.5; skew-y: -5.19999981; scale-y: 0.704999983; }
        frame 6 { x: 60; y: 79.8000031; skew-x: -6.5999999; skew-y: -6.5999999; scale-y: 0.699999988; }
        frame 7 { x: 59.9000015; y: 80; skew-x: -5.5; skew-y: -5.19999981; scale-y: 0.704999983; }
        frame 8 { x: -10000; y: 80.1999969; skew-x: -4.0999999; skew-y: -3.5999999; scale-y: 0.709999979; }
        frame 9 { x: 59.7999992; y: 80.3000031; skew-x: -3; skew-y: -2.20000005; scale-y: 0.716000021; }
        frame 10 { x: 59.9000015; y: 80.5; skew-x: -1.60000002; skew-y: -0.699999988; scale-x: 0.700999975; scale-y: 0.721000016; }
        frame 11 { x: -10000; y: 80.8000031; skew-x: -0.5; skew-y: 0.600000024; scale-x: -10000; scale-y: 0.726999998; }
        frame 12 { y: 81; skew-x: 0.800000012; skew-y: 2.29999995; scale-x: 0.702000022; scale-y: 0.73299998; }
        frame 13 { x: 60; y: 80.6999969; skew-x: 2.20000005; skew-y: 3.79999995; scale-x: -10000; scale-y: 0.736999989; }
        frame 14 { y: 80.4000015; skew-x: 3.5999999; skew-y: 5.4000001; scale-y: 0.740999997; }
        frame 15 { x: 60.0999985; y: 80; skew-x: 5; skew-y: 7; scale-y: 0.745999992; }
        frame 16 { x: 60.2999992; y: 79.8000031; skew-x: 6.4000001; skew-y: 8.60000038; scale-x: 0.703000009; scale-y: 0.75; }
        frame 17 { x: 60.4000015; y: 79.5; skew-x: 7.9000001; skew-y: 10.1999998; scale-x: -10000; scale-y: 0.754999995; }
        frame 18 { x: 60.5; y: 79.1999969; skew-x: 9.39999962; skew-y: 11.8999996; scale-x: 0.703999996; scale-y: 0.75999999; }
        frame 19 { x: 60.2999992; y: 79.5; skew-x: 7.9000001; skew-y: 10.1999998; scale-x: 0.703000009; scale-y: 0.754999995; }
        frame 20 { x: 60.2000008; y: 79.8000031; skew-x: 6.4000001; skew-y: 8.60000038; scale-x: -10000; scale-y: 0.75; }
        frame 21 { x: -10000; y: 80; skew-x: 5; skew-y: 7; scale-x: 0.702000022; scale-y: 0.745999992; }
        frame 22 { x: 59.9000015; y: 80.4000015; skew-x: 3.5999999; skew-y: 5.4000001; scale-x: -10000; scale-y: 0.740999997; }
        frame 23 { x: -10000; y: 80.6999969; skew-x: 2.20000005; skew-y: 3.79999995; scale-y: 0.736999989; }
        frame 24 { y: 81; skew-x: 0.800000012; skew-y: 2.29999995; scale-y: 0.73299998; }
        frame 25 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { x: 59.7000008; y: 80.5; skew-x: 2.29999995; skew-y: 3.79999995; scale-x: 0.700999975; scale-y: 0.731999993; }
        frame 27 { x: 59.5999985; y: 80; skew-x: 4.0999999; skew-y: 5.5; scale-x: 0.699999988; scale-y: 0.731000006; }
        frame 28 { x: -10000; y: 79.5; skew-x: 5.80000019; skew-y: 7.30000019; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 59.5; y: 79.0999985; skew-x: 7.5999999; skew-y: 9; }
        frame 30 { x: 59.7000008; y: 78.5; skew-x: 10.6000004; skew-y: 12; scale-x: 0.699000001; scale-y: 0.730000019; }
        frame 31 { x: 59.5999985; y: 77.8000031; skew-x: 13.3999996; skew-y: 14.8000002; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -10000; y: 77.3000031; skew-x: 16.3999996; skew-y: 17.7999992; }
        frame 33 { x: 59.7999992; y: 76.5999985; skew-x: 19.3999996; skew-y: 20.8999996; scale-x: 0.699999988; scale-y: 0.731000006; }
        frame 34 { x: 59.9000015; y: 75.6999969; skew-x: 23.7000008; skew-y: 24.8999996; scale-x: 0.69599998; scale-y: 0.75; }
        frame 35 { x: 60.2999992; y: 74.8000031; skew-x: 28; skew-y: 28.8999996; scale-x: 0.693000019; scale-y: 0.771000028; }
        frame 36 { x: 60.7999992; y: 74.1999969; skew-x: 32.2999992; skew-y: 33; scale-x: 0.690999985; scale-y: 0.791999996; }
        frame 37 { x: 61.2000008; y: 73.5999985; skew-x: 36.7000008; skew-y: 36.9000015; scale-x: 0.68599999; scale-y: 0.813000023; }
        frame 38 { x: 61.7000008; y: 73.0999985; skew-x: 40.9000015; skew-y: 40.7999992; scale-x: 0.684000015; scale-y: 0.834999979; }
        frame 39 { x: 60; y: 73.8000031; skew-x: 38.9000015; skew-y: 39.5; scale-x: 0.686999977; scale-y: 0.818000019; }
        frame 40 { x: 58.2999992; y: 74.5999985; skew-x: 37; skew-y: 38; scale-x: 0.689999998; scale-y: 0.802999973; }
        frame 41 { x: 56.5; y: 75.5; skew-x: 34.9000015; skew-y: 36.4000015; scale-x: 0.693000019; scale-y: 0.787; }
        frame 42 { x: 55; y: 76.3000031; skew-x: 32.9000015; skew-y: 34.9000015; scale-x: 0.69599998; scale-y: 0.771000028; }
        frame 43 { x: 53.0999985; y: 77.0999985; skew-x: 30.8999996; skew-y: 33.5; scale-x: 0.699999988; scale-y: 0.757000029; }
        frame 44 { x: 53.5; y: -10000; skew-x: 31; skew-y: 35.4000015; scale-x: -10000; scale-y: 0.797999978; }
        frame 45 { x: 53.9000015; skew-x: 31.1000004; skew-y: 37.0999985; scale-x: 0.700999975; scale-y: 0.841000021; }
        frame 46 { x: 54.2999992; y: 77.1999969; skew-x: -10000; skew-y: 38.7999992; scale-x: 0.703000009; scale-y: 0.884000003; }
        frame 47 { x: 54.7999992; y: 77.3000031; skew-y: 40.4000015; scale-x: 0.70599997; scale-y: 0.92900002; }
        frame 48 { x: 54.5; y: 76.8000031; skew-x: 29.7999992; skew-y: 37.9000015; scale-x: 0.703000009; scale-y: 0.894999981; }
        frame 49 { x: 54; y: 76.4000015; skew-x: 28.2999992; skew-y: 35.2000008; scale-x: 0.702000022; scale-y: 0.864000022; }
        frame 50 { x: 53.9000015; y: 76.1999969; skew-x: 27; skew-y: 32.7000008; scale-x: 0.700999975; scale-y: 0.832000017; }
        frame 51 { x: 53.5; y: 75.8000031; skew-x: 25.5; skew-y: 29.8999996; scale-x: 0.699999988; scale-y: 0.800000012; }
        frame 52 { x: 53.2999992; y: 75.6999969; skew-x: 24.1000004; skew-y: 27.2999992; scale-x: -10000; scale-y: 0.769999981; }
        frame 53 { x: 53.0999985; y: 76; skew-x: 20.2000008; skew-y: 23.2999992; scale-x: 0.699000001; scale-y: 0.76700002; }
        frame 54 { x: 52.9000015; y: 76.3000031; skew-x: 16; skew-y: 19.1000004; scale-x: -10000; scale-y: 0.765999973; }
        frame 55 { x: -10000; y: 76.9000015; skew-x: 12; skew-y: 15; scale-y: 0.764999986; }
        frame 56 { y: 77.3000031; skew-x: 8; skew-y: 11; scale-y: -10000; }
        frame 57 { x: 52.7999992; y: 78; skew-x: 4.19999981; skew-y: 7.0999999; scale-y: 0.763999999; }
        frame 58 { x: 53.7000008; y: 78.0999985; skew-x: 3; skew-y: 5.9000001; scale-y: -10000; }
        frame 59 { x: 54.5999985; y: -10000; skew-x: 1.70000005; skew-y: 4.69999981; scale-x: 0.698000014; scale-y: 0.764999986; }
        frame 60 { x: 55.5; skew-x: 0.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: 56.2999992; y: 78.3000031; skew-x: -0.699999988; skew-y: 2.29999995; scale-y: 0.765999973; }
        frame 62 { x: 57.2999992; y: 78.0999985; skew-x: -1.79999995; skew-y: 1.20000005; scale-y: 0.76700002; }
        frame 63 { x: 57.5; y: 78.1999969; skew-x: 0.600000024; skew-y: 3.9000001; scale-x: 0.699000001; scale-y: 0.773000002; }
        frame 64 { x: 57.7999992; y: 78.0999985; skew-x: 3.20000005; skew-y: 6.69999981; scale-x: 0.700999975; scale-y: 0.778999984; }
        frame 65 { x: 58; y: 78.1999969; skew-x: 5.9000001; skew-y: 9.60000038; scale-x: 0.702000022; scale-y: 0.785000026; }
        frame 66 { x: 58.5; y: 78.5; skew-x: 8.5; skew-y: 12.3999996; scale-x: 0.704999983; scale-y: 0.792999983; }
        frame 67 { x: 58.7999992; y: 78.9000015; skew-x: 7; skew-y: 10.3999996; scale-x: 0.703000009; scale-y: 0.779999971; }
        frame 68 { x: 59; y: 79.3000031; skew-x: 5.30000019; skew-y: 8.19999981; scale-x: -10000; scale-y: 0.768000007; }
        frame 69 { x: 59.2999992; y: 79.8000031; skew-x: 3.79999995; skew-y: 6.19999981; scale-x: 0.702000022; scale-y: 0.755999982; }
        frame 70 { x: 59.5; y: 80.4000015; skew-x: 2.29999995; skew-y: 4.19999981; scale-x: -10000; scale-y: 0.744000018; }
        frame 71 { x: 59.9000015; y: 81; skew-x: 0.800000012; skew-y: 2.29999995; scale-y: 0.73299998; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 73 { y: 80.1999969; skew-x: 0; skew-y: 1.5; scale-x: 0.700999975; scale-y: 0.731999993; }
        frame 74 { x: 59.7999992; y: 79.5; skew-x: -0.600000024; skew-y: 0.699999988; scale-x: -10000; scale-y: 0.731000006; }
        frame 75 { x: 59.9000015; y: 78.6999969; skew-x: -1.39999998; skew-y: 0; scale-x: 0.699999988; scale-y: -10000; }
        frame 76 { x: 59.7999992; y: 77.9000015; skew-x: -2.0999999; skew-y: -0.699999988; scale-x: -10000; }
        frame 77 { x: 59.9000015; y: 77.6999969; skew-x: -2.5999999; skew-y: -1.20000005; }
        frame 78 { x: 60; y: 77.5999985; skew-x: -3.0999999; skew-y: -1.70000005; }
        frame 79 { x: 60.0999985; y: 77.1999969; skew-x: -3.5999999; skew-y: -2.20000005; }
        frame 80 { x: -10000; y: 77.0999985; skew-x: -4.0999999; skew-y: -2.70000005; }
        frame 81 { x: 57.7999992; y: 77.4000015; skew-x: -10000; skew-y: -2.5999999; }
        frame 82 { x: 55.5; y: 77.6999969; skew-x: -3.79999995; skew-y: -2.4000001; scale-x: 0.700999975; scale-y: 0.731999993; }
        frame 83 { x: 53.2999992; y: 77.9000015; skew-x: -3.5999999; skew-y: -2.20000005; scale-x: 0.702000022; scale-y: 0.73299998; }
        frame 84 { x: 53.5; y: 77.5999985; skew-x: -1.10000002; skew-y: 3.4000001; scale-x: 0.707000017; scale-y: 0.813000023; }
        frame 85 { x: 53.7999992; y: 77.4000015; skew-x: 1.29999995; skew-y: 8.89999962; scale-x: 0.713999987; scale-y: 0.894999981; }
        frame 86 { x: 54.4000015; y: -10000; skew-x: 3.9000001; skew-y: 14.1000004; scale-x: 0.721000016; scale-y: 0.976999998; }
        frame 87 { x: 55.2999992; y: 77.5; skew-x: 6.5; skew-y: 19.2000008; scale-x: 0.730000019; scale-y: 1.05999994; }
        frame 88 { x: 55.5; y: 77.5999985; skew-x: 5.4000001; skew-y: 15.6999998; scale-x: 0.721000016; scale-y: 0.976000011; }
        frame 89 { x: 55.7999992; y: 77.6999969; skew-x: 4.5999999; skew-y: 12.1000004; scale-x: 0.713; scale-y: 0.893999994; }
        frame 90 { x: 56.0999985; y: 78; skew-x: 3.5999999; skew-y: 8.19999981; scale-x: 0.70599997; scale-y: 0.811999977; }
        frame 91 { x: 56.7000008; y: 78.3000031; skew-x: 2.79999995; skew-y: 4.30000019; scale-x: 0.699999988; scale-y: 0.731000006; }
        frame 92 { x: 57.5; y: 79; skew-x: 2.29999995; skew-y: 3.70000005; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 58.2000008; y: 79.5999985; skew-x: 1.79999995; skew-y: 3.20000005; }
        frame 94 { x: 59; y: 80.3000031; skew-x: 1.29999995; skew-y: 2.70000005; scale-x: 0.700999975; scale-y: 0.731999993; }
        frame 95 { x: 59.9000015; y: 81; skew-x: 0.800000012; skew-y: 2.29999995; scale-x: 0.702000022; scale-y: 0.73299998; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 59.2000008; y: 80.3000031; skew-x: 1.89999998; skew-y: 3.29999995; scale-x: 0.700999975; scale-y: 0.731999993; }
        frame 98 { x: 58.7999992; y: 79.8000031; skew-x: 3.0999999; skew-y: 4.5; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 58.2000008; y: 79.3000031; skew-x: 4.30000019; skew-y: 5.80000019; scale-x: 0.699999988; scale-y: 0.731000006; }
        frame 100 { x: 57.5999985; y: 78.6999969; skew-x: 5.5999999; skew-y: 7; scale-x: 0.700999975; scale-y: 0.731999993; }
        frame 101 { x: 55.7000008; y: 77.9000015; skew-x: 1; skew-y: 3; scale-x: -10000; scale-y: 0.745999992; }
        frame 102 { x: 53.5999985; y: 77.1999969; skew-x: -3.5; skew-y: -0.800000012; scale-x: 0.702000022; scale-y: 0.760999978; }
        frame 103 { x: 51.7999992; y: 76.5999985; skew-x: -8.10000038; skew-y: -4.80000019; scale-x: 0.703000009; scale-y: 0.77700001; }
        frame 104 { x: 49.5999985; y: 76; skew-x: -12.6000004; skew-y: -8.80000019; scale-x: 0.704999983; scale-y: 0.791999996; }
        frame 105 { x: 44.5; y: 77.3000031; skew-x: -21.3999996; skew-y: -16.7999992; scale-x: 0.70599997; scale-y: 0.811999977; }
        frame 106 { x: 39.7999992; y: 78.9000015; skew-x: -30.3999996; skew-y: -25; scale-x: -10000; scale-y: 0.83099997; }
        frame 107 { x: 35.2999992; y: 80.8000031; skew-x: -39.2999992; skew-y: -33.2000008; scale-x: 0.707000017; scale-y: 0.850000024; }
        frame 108 { x: 31; y: 82.6999969; skew-x: -48.2000008; skew-y: -41.4000015; scale-x: 0.708999991; scale-y: 0.870999992; }
        frame 109 { x: 27.8999996; y: 83.8000031; skew-x: -53.2999992; skew-y: -45.5999985; scale-x: 0.709999979; scale-y: 0.893000007; }
        frame 110 { x: 25.1000004; y: 85; skew-x: -58.2999992; skew-y: -49.7999992; scale-x: 0.712000012; scale-y: 0.916999996; }
        frame 111 { x: 22.2999992; y: 86.0999985; skew-x: -63.2999992; skew-y: -54; scale-x: 0.713999987; scale-y: 0.940999985; }
        frame 112 { x: 19.6000004; y: 87.5; skew-x: -68.3000031; skew-y: -58.2000008; scale-x: 0.717999995; scale-y: 0.967000008; }
        frame 113 { x: 15.8999996; y: 91.8000031; skew-x: -80.3000031; skew-y: -70.3000031; scale-x: 0.716000021; scale-y: 0.964999974; }
        frame 114 { x: 13.1000004; y: 95.8000031; skew-x: -92.4000015; skew-y: -82.3000031; scale-x: -10000; scale-y: -10000; }
        frame 115 { x: 11.3000002; y: 99.3000031; skew-x: -104.400002; skew-y: -94.3000031; }
        frame 116 { x: 10.1999998; y: 102.199997; skew-x: -116.199997; skew-y: -106.199997; }
        frame 117 { x: 8.39999962; y: 108.5; skew-x: -138; skew-y: -128; scale-x: 0.714999974; scale-y: 0.963; }
        frame 118 { x: 7.5; y: 111.800003; skew-x: -160.100006; skew-y: -150.100006; scale-x: 0.716000021; scale-y: 0.963999987; }
        frame 119 { x: 9.69999981; y: -10000; skew-x: -163.800003; skew-y: -153.800003; scale-x: 0.713999987; scale-y: 0.962000012; }
        frame 120 { x: 11.6999998; skew-x: -167.300003; skew-y: -157.300003; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: 13.8000002; y: 111.699997; skew-x: -171; skew-y: -160.899994; scale-x: 0.714999974; scale-y: 0.963; }
        frame 122 { x: 7.30000019; y: 116.300003; skew-x: -141.5; skew-y: -132.699997; scale-x: 0.702000022; scale-y: 0.950999975; }
        frame 123 { x: 2.0999999; y: 115.699997; skew-x: -112.199997; skew-y: -104.699997; scale-x: 0.690999985; scale-y: 0.940999985; }
        frame 124 { x: -4; y: 115.199997; skew-x: -85.5999985; skew-y: -79.5999985; scale-x: 0.677999973; scale-y: 0.92900002; }
        frame 125 { x: -6.4000001; y: 113.300003; skew-x: -59.0999985; skew-y: -54.4000015; scale-x: 0.666999996; scale-y: 0.917999983; }
        frame 126 { x: -10000; y: 113; skew-x: -59.2000008; skew-y: -54.5999985; scale-x: 0.666000009; scale-y: 0.916999996; }
        frame 127 { x: -6.5999999; y: 112.599998; skew-x: -59.5; skew-y: -54.7999992; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -6.69999981; y: 112.199997; skew-x: -59.7000008; skew-y: -54.9000015; scale-x: 0.666999996; scale-y: 0.916000009; }
        frame 129 { x: -6.80000019; y: 111.800003; skew-x: -59.7999992; skew-y: -55.0999985; scale-x: 0.667999983; scale-y: 0.917999983; }
        frame 130 { x: -6.19999981; y: 112; skew-x: -56.7000008; skew-y: -52.0999985; scale-x: 0.666000009; scale-y: 0.916999996; }
        frame 131 { x: -5.5; y: 112.199997; skew-x: -53.5999985; skew-y: -48.9000015; scale-x: 0.667999983; scale-y: 0.917999983; }
        frame 132 { x: 59.9000015; y: 81; skew-x: 0.800000012; skew-y: 2.29999995; scale-x: 0.702000022; scale-y: 0.73299998; }
        frame 133 { x: 59.7000008; y: 80.5; skew-x: 2.29999995; skew-y: 3.79999995; scale-x: 0.700999975; scale-y: 0.731999993; }
        frame 134 { x: 59.5999985; y: 80; skew-x: 4.0999999; skew-y: 5.5; scale-x: 0.699999988; scale-y: 0.731000006; }
        frame 135 { x: -10000; y: 79.5; skew-x: 5.80000019; skew-y: 7.30000019; scale-x: -10000; scale-y: -10000; }
        frame 136 { x: 59.5; y: 79.0999985; skew-x: 7.5999999; skew-y: 9; }
        frame 137 { x: 59.7000008; y: 78.5; skew-x: 10.6000004; skew-y: 12; scale-x: 0.699000001; scale-y: 0.730000019; }
        frame 138 { x: 59.5999985; y: 77.8000031; skew-x: 13.3999996; skew-y: 14.8000002; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: -10000; y: 77.3000031; skew-x: 16.3999996; skew-y: 17.7999992; }
        frame 140 { x: 59.7999992; y: 76.5999985; skew-x: 19.3999996; skew-y: 20.8999996; scale-x: 0.699999988; scale-y: 0.731000006; }
        frame 141 { x: 59.9000015; y: 75.6999969; skew-x: 23.7000008; skew-y: 24.8999996; scale-x: 0.69599998; scale-y: 0.75; }
        frame 142 { x: 60.2999992; y: 74.8000031; skew-x: 28; skew-y: 28.8999996; scale-x: 0.693000019; scale-y: 0.771000028; }
        frame 143 { x: 60.7999992; y: 74.1999969; skew-x: 32.2999992; skew-y: 33; scale-x: 0.690999985; scale-y: 0.791999996; }
        frame 144 { x: 61.2000008; y: 73.5999985; skew-x: 36.7000008; skew-y: 36.9000015; scale-x: 0.68599999; scale-y: 0.813000023; }
        frame 145 { x: 61.7000008; y: 73.0999985; skew-x: 40.9000015; skew-y: 40.7999992; scale-x: 0.684000015; scale-y: 0.834999979; }
        frame 146 { x: 60; y: 73.8000031; skew-x: 38.9000015; skew-y: 39.5; scale-x: 0.686999977; scale-y: 0.818000019; }
        frame 147 { x: 58.2999992; y: 74.5999985; skew-x: 37; skew-y: 38; scale-x: 0.689999998; scale-y: 0.802999973; }
        frame 148 { x: 56.5; y: 75.5; skew-x: 34.9000015; skew-y: 36.4000015; scale-x: 0.693000019; scale-y: 0.787; }
        frame 149 { x: 55; y: 76.3000031; skew-x: 32.9000015; skew-y: 34.9000015; scale-x: 0.69599998; scale-y: 0.771000028; }
        frame 150 { x: 53.0999985; y: 77.0999985; skew-x: 30.8999996; skew-y: 33.5; scale-x: 0.699999988; scale-y: 0.757000029; }
        frame 151 { x: 53.5; y: -10000; skew-x: 31; skew-y: 35.4000015; scale-x: -10000; scale-y: 0.797999978; }
        frame 152 { x: 53.9000015; skew-x: 31.1000004; skew-y: 37.0999985; scale-x: 0.700999975; scale-y: 0.841000021; }
        frame 153 { x: 54.2999992; y: 77.1999969; skew-x: -10000; skew-y: 38.7999992; scale-x: 0.703000009; scale-y: 0.884000003; }
        frame 154 { x: 54.7999992; y: 77.3000031; skew-y: 40.4000015; scale-x: 0.70599997; scale-y: 0.92900002; }
        frame 155 { x: 54.5; y: 76.8000031; skew-x: 29.7999992; skew-y: 37.9000015; scale-x: 0.703000009; scale-y: 0.894999981; }
        frame 156 { x: 54; y: 76.4000015; skew-x: 28.2999992; skew-y: 35.2000008; scale-x: 0.702000022; scale-y: 0.864000022; }
        frame 157 { x: 53.9000015; y: 76.1999969; skew-x: 27; skew-y: 32.7000008; scale-x: 0.700999975; scale-y: 0.832000017; }
        frame 158 { x: 53.5; y: 75.8000031; skew-x: 25.5; skew-y: 29.8999996; scale-x: 0.699999988; scale-y: 0.800000012; }
        frame 159 { x: 53.2999992; y: 75.6999969; skew-x: 24.1000004; skew-y: 27.2999992; scale-x: -10000; scale-y: 0.769999981; }
        frame 160 { x: 53.0999985; y: 76; skew-x: 20.2000008; skew-y: 23.2999992; scale-x: 0.699000001; scale-y: 0.76700002; }
        frame 161 { x: 52.9000015; y: 76.3000031; skew-x: 16; skew-y: 19.1000004; scale-x: -10000; scale-y: 0.765999973; }
        frame 162 { x: -10000; y: 76.9000015; skew-x: 12; skew-y: 15; scale-y: 0.764999986; }
        frame 163 { y: 77.3000031; skew-x: 8; skew-y: 11; scale-y: -10000; }
        frame 164 { x: 52.7999992; y: 78; skew-x: 4.19999981; skew-y: 7.0999999; scale-y: 0.763999999; }
        frame 165 { x: 53.7000008; y: 78.0999985; skew-x: 3; skew-y: 5.9000001; scale-y: -10000; }
        frame 166 { x: 54.5999985; y: -10000; skew-x: 1.70000005; skew-y: 4.69999981; scale-x: 0.698000014; scale-y: 0.764999986; }
        frame 167 { x: 55.5; skew-x: 0.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 56.2999992; y: 78.3000031; skew-x: -0.699999988; skew-y: 2.29999995; scale-y: 0.765999973; }
        frame 169 { x: 57.2999992; y: 78.0999985; skew-x: -1.79999995; skew-y: 1.20000005; scale-y: 0.76700002; }
        frame 170 { x: 57.9000015; y: -10000; skew-x: 0.600000024; skew-y: 3.9000001; scale-x: 0.699000001; scale-y: 0.773000002; }
        frame 171 { x: 58.4000015; y: 78.3000031; skew-x: 3.20000005; skew-y: 6.69999981; scale-x: 0.700999975; scale-y: 0.778999984; }
        frame 172 { x: 58.9000015; y: 78.4000015; skew-x: 5.80000019; skew-y: 9.5; scale-x: 0.702000022; scale-y: 0.785000026; }
        frame 173 { x: 59.5999985; y: 78.6999969; skew-x: 8.39999962; skew-y: 12.3000002; scale-x: 0.704999983; scale-y: 0.792999983; }
        frame 174 { x: 59.5; y: 79.1999969; skew-x: 6.80000019; skew-y: 10.1999998; scale-x: 0.703000009; scale-y: 0.779999971; }
        frame 175 { x: 59.5999985; y: 79.5999985; skew-x: 5.30000019; skew-y: 8.19999981; scale-x: -10000; scale-y: 0.768000007; }
        frame 176 { x: -10000; y: 80; skew-x: 3.79999995; skew-y: 6.19999981; scale-x: 0.702000022; scale-y: 0.755999982; }
        frame 177 { x: 59.7000008; y: 80.5; skew-x: 2.29999995; skew-y: 4.19999981; scale-x: -10000; scale-y: 0.744000018; }
        frame 178 { x: 59.9000015; y: 81; skew-x: 0.800000012; skew-y: 2.29999995; scale-y: 0.73299998; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 180 { y: 80.1999969; skew-x: 0; skew-y: 1.5; scale-x: 0.700999975; scale-y: 0.731999993; }
        frame 181 { x: 59.7999992; y: 79.5; skew-x: -0.600000024; skew-y: 0.699999988; scale-x: -10000; scale-y: 0.731000006; }
        frame 182 { x: 59.9000015; y: 78.6999969; skew-x: -1.39999998; skew-y: 0; scale-x: 0.699999988; scale-y: -10000; }
        frame 183 { x: 59.7999992; y: 77.9000015; skew-x: -2.0999999; skew-y: -0.699999988; scale-x: -10000; }
        frame 184 { x: 59.9000015; y: 77.6999969; skew-x: -2.5999999; skew-y: -1.20000005; }
        frame 185 { x: 60; y: 77.5999985; skew-x: -3.0999999; skew-y: -1.70000005; }
        frame 186 { x: 60.0999985; y: 77.1999969; skew-x: -3.5999999; skew-y: -2.20000005; }
        frame 187 { x: -10000; y: 77.0999985; skew-x: -4.0999999; skew-y: -2.70000005; }
        frame 188 { x: 57.7999992; y: 77.4000015; skew-x: -10000; skew-y: -2.5999999; }
        frame 189 { x: 55.5; y: 77.6999969; skew-x: -3.79999995; skew-y: -2.4000001; scale-x: 0.700999975; scale-y: 0.731999993; }
        frame 190 { x: 53.2999992; y: 77.9000015; skew-x: -3.5999999; skew-y: -2.20000005; scale-x: 0.702000022; scale-y: 0.73299998; }
        frame 191 { x: 53.5; y: 77.5999985; skew-x: -1.10000002; skew-y: 3.4000001; scale-x: 0.707000017; scale-y: 0.813000023; }
        frame 192 { x: 53.7999992; y: 77.4000015; skew-x: 1.29999995; skew-y: 8.89999962; scale-x: 0.713999987; scale-y: 0.894999981; }
        frame 193 { x: 54.4000015; y: -10000; skew-x: 3.9000001; skew-y: 14.1000004; scale-x: 0.721000016; scale-y: 0.976999998; }
        frame 194 { x: 55.2999992; y: 77.5; skew-x: 6.5; skew-y: 19.2000008; scale-x: 0.730000019; scale-y: 1.05999994; }
        frame 195 { x: 55.5; y: 77.5999985; skew-x: 5.4000001; skew-y: 15.6999998; scale-x: 0.721000016; scale-y: 0.976000011; }
        frame 196 { x: 55.7999992; y: 77.6999969; skew-x: 4.5999999; skew-y: 12.1000004; scale-x: 0.713; scale-y: 0.893999994; }
        frame 197 { x: 56.0999985; y: 78; skew-x: 3.5999999; skew-y: 8.19999981; scale-x: 0.70599997; scale-y: 0.811999977; }
        frame 198 { x: 56.7000008; y: 78.3000031; skew-x: 2.79999995; skew-y: 4.30000019; scale-x: 0.699999988; scale-y: 0.731000006; }
        frame 199 { x: 57.5; y: 79; skew-x: 2.29999995; skew-y: 3.70000005; scale-x: -10000; scale-y: -10000; }
        frame 200 { x: 58.2000008; y: 79.5999985; skew-x: 1.79999995; skew-y: 3.20000005; }
        frame 201 { x: 59; y: 80.3000031; skew-x: 1.29999995; skew-y: 2.70000005; scale-x: 0.700999975; scale-y: 0.731999993; }
        frame 202 { x: 59.9000015; y: 81; skew-x: 0.800000012; skew-y: 2.29999995; scale-x: 0.702000022; scale-y: 0.73299998; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 204 { x: 60.4000015; y: 80.3000031; skew-x: 1.60000002; skew-y: 3; scale-x: 0.700999975; scale-y: 0.731999993; }
        frame 205 { x: 60.7999992; y: 79.5; skew-x: 2.5999999; skew-y: 4; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 61.0999985; y: 78.6999969; skew-x: 3.29999995; skew-y: 4.80000019; }
        frame 207 { x: 61.7000008; y: 77.8000031; skew-x: 4.30000019; skew-y: 5.80000019; }
        frame 208 { x: 62.2000008; y: 77.1999969; skew-x: 5.30000019; skew-y: 6.69999981; }
        frame 209 { x: 62.7000008; y: 76.3000031; skew-x: 6.19999981; skew-y: 7.5999999; scale-x: 0.702000022; scale-y: 0.73299998; }
        frame 210 { x: 61.7999992; y: 75.5; skew-x: 8.30000019; skew-y: 10.3999996; scale-x: 0.699999988; scale-y: 0.764999986; }
        frame 211 { x: 61.0999985; y: 74.5999985; skew-x: 10.6000004; skew-y: 13.1999998; scale-x: -10000; scale-y: 0.799000025; }
        frame 212 { x: 60.4000015; y: 73.8000031; skew-x: 12.6000004; skew-y: 15.8000002; scale-x: 0.699000001; scale-y: 0.832000017; }
        frame 213 { x: 59.7999992; y: 73.0999985; skew-x: 14.8999996; skew-y: 18.6000004; scale-x: -10000; scale-y: 0.866999984; }
        frame 214 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_body2";
        frame-count: 215;
        frame 0 { x: 45.5; y: 67.4000015; scale-x: 0.850000024; scale-y: 0.850000024; image: IMAGE_REANIM_ZOMBIE_LADDER_BODY2; }
        frame 1 { x: -10000; y: 67.1999969; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { y: 67; }
        frame 3 { y: 66.8000031; }
        frame 4 { y: 66.5999985; }
        frame 5 { y: 66.3000031; }
        frame 6 { y: 66.1999969; }
        frame 7 { y: 66.3000031; }
        frame 8 { y: 66.5999985; }
        frame 9 { y: 66.8000031; }
        frame 10 { y: 67; }
        frame 11 { y: 67.1999969; }
        frame 12 { y: 67.4000015; }
        frame 13 { y: 67.5999985; }
        frame 14 { y: 67.8000031; }
        frame 15 { y: 67.9000015; }
        frame 16 { y: 68.0999985; }
        frame 17 { y: 68.3000031; }
        frame 18 { y: 68.4000015; }
        frame 19 { y: 68.3000031; }
        frame 20 { y: 68.0999985; }
        frame 21 { y: 67.9000015; }
        frame 22 { y: 67.8000031; }
        frame 23 { y: 67.5999985; }
        frame 24 { y: 67.4000015; }
        frame 25 { y: -10000; }
        frame 26 { x: 45.7999992; y: 67.0999985; skew-x: 1; skew-y: 1; }
        frame 27 { x: 46; y: 66.8000031; skew-x: 2; skew-y: 2; }
        frame 28 { x: 46.2999992; y: 66.5; skew-x: 3; skew-y: 3; }
        frame 29 { x: 46.4000015; y: 66.1999969; skew-x: 4; skew-y: 4; }
        frame 30 { x: 46.5; y: 65.3000031; skew-x: 5.5999999; skew-y: 5.5999999; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 31 { x: 46.9000015; y: 64.4000015; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 47.0999985; y: 63.5; skew-x: 9; skew-y: 9; }
        frame 33 { x: 47.4000015; y: 62.5999985; skew-x: 10.8000002; skew-y: 10.8000002; }
        frame 34 { x: 48.5; y: 62; skew-x: 13.8000002; skew-y: 13; scale-x: 0.825999975; scale-y: 0.84799999; }
        frame 35 { x: 49.5999985; y: 61.5; skew-x: 16.6000004; skew-y: 15.3000002; scale-x: 0.80400002; scale-y: 0.847000003; }
        frame 36 { x: 50.9000015; y: 61.0999985; skew-x: 19.6000004; skew-y: 17.7999992; scale-x: 0.781000018; scale-y: 0.846000016; }
        frame 37 { x: 52.0999985; y: 60.7999992; skew-x: 22.6000004; skew-y: 20.1000004; scale-x: 0.758000016; scale-y: 0.845000029; }
        frame 38 { x: 53.2999992; y: 60.5; skew-x: 25.6000004; skew-y: 22.5; scale-x: 0.736999989; scale-y: -10000; }
        frame 39 { x: 53; y: 60.0999985; skew-x: 27; skew-y: 23.7999992; scale-x: 0.734000027; scale-y: 0.855000019; }
        frame 40 { x: 52.5999985; y: 59.7000008; skew-x: 28.2999992; skew-y: 25.1000004; scale-x: 0.731999993; scale-y: 0.866999984; }
        frame 41 { x: 52.4000015; y: 59.0999985; skew-x: 29.7999992; skew-y: 26.2999992; scale-x: 0.731000006; scale-y: 0.878000021; }
        frame 42 { x: 52; y: 58.7000008; skew-x: 31.2999992; skew-y: 27.7999992; scale-x: 0.728999972; scale-y: 0.888999999; }
        frame 43 { x: 51.9000015; y: 58.2000008; skew-x: 32.7999992; skew-y: 29.1000004; scale-x: -10000; scale-y: 0.90200001; }
        frame 44 { x: 51.5999985; y: 59; skew-x: 32.5999985; skew-y: 28.7999992; scale-x: 0.726999998; scale-y: 0.899999976; }
        frame 45 { x: 51.2999992; y: 59.9000015; skew-x: 32.2999992; skew-y: 28.6000004; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 51; y: 60.5999985; skew-x: 32.0999985; skew-y: 28.2999992; scale-y: 0.898999989; }
        frame 47 { x: 50.7000008; y: 61.2999992; skew-x: 31.7999992; skew-y: 28; scale-x: 0.727999985; scale-y: 0.899999976; }
        frame 48 { x: 51.0999985; y: 59.9000015; skew-x: 33.2999992; skew-y: 29.6000004; scale-x: 0.750999987; scale-y: 0.888999999; }
        frame 49 { x: 51.5; y: 58.2999992; skew-x: 34.9000015; skew-y: 31.1000004; scale-x: 0.774999976; scale-y: 0.878000021; }
        frame 50 { x: 51.9000015; y: 56.5999985; skew-x: 36.5999985; skew-y: 32.7999992; scale-x: 0.799000025; scale-y: 0.867999971; }
        frame 51 { x: 52.0999985; y: 55.0999985; skew-x: 38.0999985; skew-y: 34.4000015; scale-x: 0.823000014; scale-y: 0.85799998; }
        frame 52 { x: 52.7000008; y: 53.5; skew-x: 39.7999992; skew-y: 36.0999985; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 53 { x: 51.5999985; y: 54.5999985; skew-x: 36.9000015; skew-y: 33.2999992; scale-x: 0.847000003; scale-y: 0.84799999; }
        frame 54 { x: 50.5; y: 55.5999985; skew-x: 34.0999985; skew-y: 30.6000004; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 49.5; y: 56.7000008; skew-x: 31.2999992; skew-y: 27.7999992; scale-x: 0.84799999; }
        frame 56 { x: 48.4000015; y: 58; skew-x: 28.2999992; skew-y: 25.1000004; scale-x: -10000; scale-y: 0.848999977; }
        frame 57 { x: 47.4000015; y: 59.0999985; skew-x: 25.6000004; skew-y: 22.5; scale-x: 0.848999977; scale-y: 0.850000024; }
        frame 58 { x: 47.2000008; y: 59.7999992; skew-x: 22.6000004; skew-y: 20.1000004; scale-x: 0.84799999; scale-y: 0.848999977; }
        frame 59 { x: 47.2999992; y: 60.5; skew-x: 19.6000004; skew-y: 17.7999992; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 47.0999985; y: 61.2000008; skew-x: 16.6000004; skew-y: 15.3000002; }
        frame 61 { x: -10000; y: 61.9000015; skew-x: 13.8000002; skew-y: 13.1000004; scale-x: 0.848999977; }
        frame 62 { x: 47.4000015; y: 62.5999985; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: -10000; }
        frame 63 { x: 47.0999985; y: 63.9000015; skew-x: 9; skew-y: 9; }
        frame 64 { x: 46.9000015; y: 65.1999969; skew-x: 7.30000019; skew-y: 7.30000019; }
        frame 65 { x: 46.5; y: 66.5; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 66 { x: 46.4000015; y: 67.8000031; skew-x: 4; skew-y: 4; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 67 { x: 46.0999985; y: -10000; skew-x: 3.0999999; skew-y: 3.0999999; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 46; y: 67.5999985; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 69 { x: 45.9000015; y: -10000; skew-x: 1.5; skew-y: 1.5; }
        frame 70 { x: 45.7000008; y: 67.4000015; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 71 { x: 45.5; y: -10000; skew-x: 0; skew-y: 0; }
        frame 72 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: 45.7999992; y: 66.5999985; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 74 { x: 46.0999985; y: 65.8000031; skew-x: 1.5; skew-y: 1.5; }
        frame 75 { x: 46.4000015; y: 65; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 76 { x: 46.5999985; y: 64.3000031; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 77 { x: -10000; y: 63.9000015; skew-x: 3; skew-y: 3; }
        frame 78 { y: 63.5; skew-x: -10000; skew-y: -10000; }
        frame 79 { y: 63.0999985; }
        frame 80 { y: 62.7999992; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 81 { x: 43.4000015; y: 64.0999985; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 82 { x: 40.0999985; y: 65.5999985; skew-x: -4; skew-y: -4; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 83 { x: 37; y: 67.1999969; skew-x: -7.80000019; skew-y: -7.80000019; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 84 { x: 37.0999985; y: 68.5; skew-x: -8.39999962; skew-y: -8.39999962; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 85 { x: -10000; y: 69.8000031; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 37.2999992; y: 71; skew-x: -9.89999962; skew-y: -9.89999962; }
        frame 87 { x: -10000; y: 72.3000031; skew-x: -10.8000002; skew-y: -10.8000002; }
        frame 88 { x: 38.0999985; y: 71.3000031; skew-x: -9.69999981; skew-y: -9.69999981; }
        frame 89 { x: 39; y: 70.0999985; skew-x: -8.5; skew-y: -8.5; }
        frame 90 { x: 39.7000008; y: 69.0999985; skew-x: -7.4000001; skew-y: -7.4000001; }
        frame 91 { x: 40.4000015; y: 68; skew-x: -6.4000001; skew-y: -6.4000001; }
        frame 92 { x: 41.7000008; y: 67.8000031; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 93 { x: 42.9000015; y: 67.6999969; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 94 { x: 44.2000008; y: 67.5; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 45.5; y: 67.4000015; skew-x: 0; skew-y: 0; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 97 { y: 66.3000031; skew-x: 2; skew-y: 2; }
        frame 98 { x: 45.4000015; y: 65.3000031; skew-x: 4; skew-y: 4; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 99 { x: -10000; y: 64.3000031; skew-x: 6; skew-y: 6; scale-x: -10000; scale-y: -10000; }
        frame 100 { y: 63.4000015; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 101 { x: 42.7999992; y: 63.5; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 102 { x: 40.2999992; y: 63.5999985; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 37.9000015; y: 63.7000008; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 104 { x: 35.5; y: 64; skew-x: -0.800000012; skew-y: -0.800000012; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 105 { x: 29.7999992; y: 64.3000031; skew-x: -3.5; skew-y: -6.19999981; scale-x: 0.834999979; scale-y: 0.875; }
        frame 106 { x: 24.2000008; y: 64.6999969; skew-x: -6.19999981; skew-y: -11.8999996; scale-x: 0.823000014; scale-y: 0.902999997; }
        frame 107 { x: 18.3999996; y: 65.4000015; skew-x: -9.19999981; skew-y: -17.3999996; scale-x: 0.81099999; scale-y: 0.931999981; }
        frame 108 { x: 12.3999996; y: 66.1999969; skew-x: -12; skew-y: -23; scale-x: 0.799000025; scale-y: 0.961000025; }
        frame 109 { x: 8.80000019; y: 68.6999969; skew-x: -16.7000008; skew-y: -27; scale-x: 0.792999983; scale-y: 0.968999982; }
        frame 110 { x: 5.19999981; y: 71.3000031; skew-x: -21.2000008; skew-y: -31; scale-x: 0.787999988; scale-y: 0.978999972; }
        frame 111 { x: 1.79999995; y: 73.8000031; skew-x: -26; skew-y: -35.2000008; scale-x: 0.782999992; scale-y: 0.989000022; }
        frame 112 { x: -1.5; y: 76.3000031; skew-x: -30.7999992; skew-y: -39.2999992; scale-x: 0.778999984; scale-y: 1; }
        frame 113 { x: -6.0999999; y: 82.0999985; skew-x: -37.5; skew-y: -47.2999992; scale-x: 0.779999971; scale-y: 1.01199996; }
        frame 114 { x: -10.1999998; y: 88.1999969; skew-x: -44.2999992; skew-y: -55.2999992; scale-x: 0.781000018; scale-y: 1.02499998; }
        frame 115 { x: -13.8999996; y: 94.3000031; skew-x: -51.0999985; skew-y: -63.2999992; scale-x: 0.782999992; scale-y: 1.03799999; }
        frame 116 { x: -17.2000008; y: 100.699997; skew-x: -57.7999992; skew-y: -71.3000031; scale-x: 0.786000013; scale-y: 1.05299997; }
        frame 117 { x: -20.7000008; y: 113.5; skew-x: -71.5999985; skew-y: -87.5999985; scale-x: 0.790000021; scale-y: 1.08000004; }
        frame 118 { x: -21.8999996; y: 125.599998; skew-x: -85.3000031; skew-y: -103.699997; scale-x: 0.795000017; scale-y: 1.10699999; }
        frame 119 { x: -21.1000004; y: 128.5; skew-x: -85.0999985; skew-y: -107.199997; scale-x: 0.819999993; scale-y: 1.10599995; }
        frame 120 { x: -20.2000008; y: 131.399994; skew-x: -84.9000015; skew-y: -110.900002; scale-x: 0.846000016; scale-y: -10000; }
        frame 121 { x: -19.2999992; y: 134.300003; skew-x: -84.5; skew-y: -114.599998; scale-x: 0.870999992; scale-y: 1.10699999; }
        frame 122 { x: -20; y: 132.5; skew-x: -83.4000015; skew-y: -105.699997; scale-x: 0.865999997; scale-y: 1.04100001; }
        frame 123 { x: -19.8999996; y: 130.800003; skew-x: -82.0999985; skew-y: -96.6999969; scale-x: 0.860000014; scale-y: 0.977999985; }
        frame 124 { x: -19.2999992; y: 129.600006; skew-x: -80.8000031; skew-y: -87.9000015; scale-x: 0.855000019; scale-y: 0.913999975; }
        frame 125 { x: -18.1000004; y: 128.899994; skew-x: -79.4000015; skew-y: -78.9000015; scale-x: 0.850000024; scale-y: 0.848999977; }
        frame 126 { x: -10000; y: 128.5; skew-x: -79.5999985; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 127 { y: 128.100006; skew-x: -10000; }
        frame 128 { y: 127.800003; }
        frame 129 { y: 127.300003; skew-x: -79.4000015; }
        frame 130 { x: -18.2000008; y: 128.199997; skew-x: -79.5999985; }
        frame 131 { x: -18.1000004; y: 128.899994; skew-x: -79.4000015; }
        frame 132 { x: 45.5; y: 67.4000015; skew-x: 0; skew-y: 0; scale-y: 0.850000024; }
        frame 133 { x: 45.7999992; y: 67.0999985; skew-x: 1; skew-y: 1; scale-y: -10000; }
        frame 134 { x: 46; y: 66.8000031; skew-x: 2; skew-y: 2; }
        frame 135 { x: 46.2999992; y: 66.5; skew-x: 3; skew-y: 3; }
        frame 136 { x: 46.4000015; y: 66.1999969; skew-x: 4; skew-y: 4; }
        frame 137 { x: 46.5; y: 65.3000031; skew-x: 5.5999999; skew-y: 5.5999999; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 138 { x: 46.9000015; y: 64.4000015; skew-x: 7.30000019; skew-y: 7.30000019; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 47.0999985; y: 63.5; skew-x: 9; skew-y: 9; }
        frame 140 { x: 47.4000015; y: 62.5999985; skew-x: 10.8000002; skew-y: 10.8000002; }
        frame 141 { x: 48.5; y: 62; skew-x: 13.8000002; skew-y: 13; scale-x: 0.825999975; scale-y: 0.84799999; }
        frame 142 { x: 49.5999985; y: 61.5; skew-x: 16.6000004; skew-y: 15.3000002; scale-x: 0.80400002; scale-y: 0.847000003; }
        frame 143 { x: 50.9000015; y: 61.0999985; skew-x: 19.6000004; skew-y: 17.7999992; scale-x: 0.781000018; scale-y: 0.846000016; }
        frame 144 { x: 52.0999985; y: 60.7999992; skew-x: 22.6000004; skew-y: 20.1000004; scale-x: 0.758000016; scale-y: 0.845000029; }
        frame 145 { x: 53.2999992; y: 60.5; skew-x: 25.6000004; skew-y: 22.5; scale-x: 0.736999989; scale-y: -10000; }
        frame 146 { x: 53; y: 60.0999985; skew-x: 27; skew-y: 23.7999992; scale-x: 0.734000027; scale-y: 0.855000019; }
        frame 147 { x: 52.5999985; y: 59.7000008; skew-x: 28.2999992; skew-y: 25.1000004; scale-x: 0.731999993; scale-y: 0.866999984; }
        frame 148 { x: 52.4000015; y: 59.0999985; skew-x: 29.7999992; skew-y: 26.2999992; scale-x: 0.731000006; scale-y: 0.878000021; }
        frame 149 { x: 52; y: 58.7000008; skew-x: 31.2999992; skew-y: 27.7999992; scale-x: 0.728999972; scale-y: 0.888999999; }
        frame 150 { x: 51.9000015; y: 58.2000008; skew-x: 32.7999992; skew-y: 29.1000004; scale-x: -10000; scale-y: 0.90200001; }
        frame 151 { x: 51.5999985; y: 59; skew-x: 32.5999985; skew-y: 28.7999992; scale-x: 0.726999998; scale-y: 0.899999976; }
        frame 152 { x: 51.2999992; y: 59.9000015; skew-x: 32.2999992; skew-y: 28.6000004; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 51; y: 60.5999985; skew-x: 32.0999985; skew-y: 28.2999992; scale-y: 0.898999989; }
        frame 154 { x: 50.7000008; y: 61.2999992; skew-x: 31.7999992; skew-y: 28; scale-x: 0.727999985; scale-y: 0.899999976; }
        frame 155 { x: 51.0999985; y: 59.9000015; skew-x: 33.2999992; skew-y: 29.6000004; scale-x: 0.750999987; scale-y: 0.888999999; }
        frame 156 { x: 51.5; y: 58.2999992; skew-x: 34.9000015; skew-y: 31.1000004; scale-x: 0.774999976; scale-y: 0.878000021; }
        frame 157 { x: 51.9000015; y: 56.5999985; skew-x: 36.5999985; skew-y: 32.7999992; scale-x: 0.799000025; scale-y: 0.867999971; }
        frame 158 { x: 52.0999985; y: 55.0999985; skew-x: 38.0999985; skew-y: 34.4000015; scale-x: 0.823000014; scale-y: 0.85799998; }
        frame 159 { x: 52.7000008; y: 53.5; skew-x: 39.7999992; skew-y: 36.0999985; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 160 { x: 51.5999985; y: 54.5999985; skew-x: 36.9000015; skew-y: 33.2999992; scale-x: 0.847000003; scale-y: 0.84799999; }
        frame 161 { x: 50.5; y: 55.5999985; skew-x: 34.0999985; skew-y: 30.6000004; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 49.5; y: 56.7000008; skew-x: 31.2999992; skew-y: 27.7999992; scale-x: 0.84799999; }
        frame 163 { x: 48.4000015; y: 58; skew-x: 28.2999992; skew-y: 25.1000004; scale-x: -10000; scale-y: 0.848999977; }
        frame 164 { x: 47.4000015; y: 59.0999985; skew-x: 25.6000004; skew-y: 22.5; scale-x: 0.848999977; scale-y: 0.850000024; }
        frame 165 { x: 47.2000008; y: 59.7999992; skew-x: 22.6000004; skew-y: 20.1000004; scale-x: 0.84799999; scale-y: 0.848999977; }
        frame 166 { x: 47.2999992; y: 60.5; skew-x: 19.6000004; skew-y: 17.7999992; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 47.0999985; y: 61.2000008; skew-x: 16.6000004; skew-y: 15.3000002; }
        frame 168 { x: -10000; y: 61.9000015; skew-x: 13.8000002; skew-y: 13.1000004; scale-x: 0.848999977; }
        frame 169 { x: 47.4000015; y: 62.5999985; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: -10000; }
        frame 170 { x: 47.0999985; y: 63.9000015; skew-x: 9; skew-y: 9; }
        frame 171 { x: 46.9000015; y: 65.1999969; skew-x: 7.30000019; skew-y: 7.30000019; }
        frame 172 { x: 46.5; y: 66.5; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 173 { x: 46.4000015; y: 67.8000031; skew-x: 4; skew-y: 4; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 174 { x: 46.0999985; y: -10000; skew-x: 3.0999999; skew-y: 3.0999999; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 46; y: 67.5999985; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 176 { x: 45.9000015; y: -10000; skew-x: 1.5; skew-y: 1.5; }
        frame 177 { x: 45.7000008; y: 67.4000015; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 178 { x: 45.5; y: -10000; skew-x: 0; skew-y: 0; }
        frame 179 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 180 { x: 45.7999992; y: 66.5999985; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 181 { x: 46.0999985; y: 65.8000031; skew-x: 1.5; skew-y: 1.5; }
        frame 182 { x: 46.4000015; y: 65; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 183 { x: 46.5999985; y: 64.3000031; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 184 { x: -10000; y: 63.9000015; skew-x: 3; skew-y: 3; }
        frame 185 { y: 63.5; skew-x: -10000; skew-y: -10000; }
        frame 186 { y: 63.0999985; }
        frame 187 { y: 62.7999992; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 188 { x: 43.4000015; y: 64.0999985; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 189 { x: 40.0999985; y: 65.5999985; skew-x: -4; skew-y: -4; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 190 { x: 37; y: 67.1999969; skew-x: -7.80000019; skew-y: -7.80000019; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 191 { x: 37.0999985; y: 68.5; skew-x: -8.39999962; skew-y: -8.39999962; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 192 { x: -10000; y: 69.8000031; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 37.2999992; y: 71; skew-x: -9.89999962; skew-y: -9.89999962; }
        frame 194 { x: -10000; y: 72.3000031; skew-x: -10.8000002; skew-y: -10.8000002; }
        frame 195 { x: 38.0999985; y: 71.3000031; skew-x: -9.69999981; skew-y: -9.69999981; }
        frame 196 { x: 39; y: 70.0999985; skew-x: -8.5; skew-y: -8.5; }
        frame 197 { x: 39.7000008; y: 69.0999985; skew-x: -7.4000001; skew-y: -7.4000001; }
        frame 198 { x: 40.4000015; y: 68; skew-x: -6.4000001; skew-y: -6.4000001; }
        frame 199 { x: 41.7000008; y: 67.8000031; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 200 { x: 42.9000015; y: 67.6999969; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 201 { x: 44.2000008; y: 67.5; skew-x: -1.39999998; skew-y: -1.39999998; scale-x: -10000; scale-y: -10000; }
        frame 202 { x: 45.5; y: 67.4000015; skew-x: 0; skew-y: 0; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 204 { x: 46.2999992; y: 66.3000031; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 205 { x: 47.0999985; y: 65.0999985; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 206 { x: 48; y: 64.0999985; skew-x: 4.0999999; skew-y: 4.0999999; }
        frame 207 { x: 48.7999992; y: 62.9000015; skew-x: 5.5; skew-y: 5.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 208 { x: 49.5999985; y: 61.7999992; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: -10000; scale-y: -10000; }
        frame 209 { x: 50.5; y: 60.5999985; skew-x: 8.39999962; skew-y: 8.39999962; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 210 { x: 48.2000008; y: 62.5; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 211 { x: 46; y: 64.1999969; skew-x: -0.200000003; skew-y: -0.200000003; scale-x: -10000; scale-y: -10000; }
        frame 212 { x: 44; y: 66.1999969; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 213 { x: 41.7999992; y: 68.3000031; skew-x: -9.30000019; skew-y: -9.30000019; scale-x: -10000; scale-y: -10000; }
        frame 214 { x: 40.4000015; y: 70.5999985; skew-x: -14.3999996; skew-y: -14.6000004; scale-x: 0.847000003; }
    }
    Track {
        source-name: "Zombie_ladder_hammer";
        frame-count: 215;
        frame 0 { x: 61.5; y: 71.1999969; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_ZOMBIE_LADDER_HAMMER; }
        frame 1 { x: 61.7999992; y: 70.6999969; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 62; y: 70.3000031; skew-x: 2.0999999; skew-y: 2.0999999; }
        frame 3 { x: 62.2999992; y: 69.8000031; skew-x: 3.29999995; skew-y: 3.29999995; }
        frame 4 { x: 62.5; y: 69.3000031; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 5 { x: 62.7999992; y: 69.0999985; skew-x: 5.5; skew-y: 5.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 6 { x: 63; y: 68.5999985; skew-x: 6.5999999; skew-y: 6.5999999; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 7 { x: 62.5999985; y: 69; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 8 { x: 62.2999992; y: 69.4000015; skew-x: 4.80000019; skew-y: 4.80000019; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 62; y: 69.8000031; skew-x: 4; skew-y: 4; }
        frame 10 { x: 61.5999985; y: 70.1999969; skew-x: 3.0999999; skew-y: 3.0999999; }
        frame 11 { x: 61.2999992; y: 70.5999985; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 12 { x: 61; y: 70.8000031; skew-x: 1.60000002; skew-y: 1.60000002; }
        frame 13 { x: 61.0999985; y: -10000; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 14 { x: 61.4000015; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 15 { x: 61.5; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 16 { x: 61.7000008; skew-x: 7; skew-y: 7; }
        frame 17 { x: 61.9000015; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 18 { x: 62.0999985; y: 70.6999969; skew-x: 9.89999962; skew-y: 9.89999962; }
        frame 19 { x: 62; y: 70.8000031; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 20 { x: 61.9000015; y: -10000; skew-x: 6.5; skew-y: 6.5; }
        frame 21 { x: 61.7999992; y: 70.9000015; skew-x: 4.80000019; skew-y: 4.80000019; }
        frame 22 { x: 61.5999985; y: 71; skew-x: 3.29999995; skew-y: 3.29999995; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 23 { x: -10000; y: 71.0999985; skew-x: 1.5; skew-y: 1.5; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: 61.5; y: 71.1999969; skew-x: 0; skew-y: 0; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 61.0999985; y: 71.5; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 27 { x: 60.7999992; y: 71.5999985; skew-x: -1; skew-y: -1; }
        frame 28 { x: 60.2999992; y: 72; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 29 { x: 59.9000015; y: 72.3000031; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 30 { x: 59.5; y: 72.5999985; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 31 { x: 59; y: 72.8000031; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 32 { x: 58.5; y: 73.0999985; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 58.0999985; y: 73.4000015; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 34 { x: 57.0999985; y: 73.6999969; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 35 { x: 56.0999985; y: 73.9000015; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 55.0999985; y: 74.1999969; skew-x: -6.5; skew-y: -6.5; }
        frame 37 { x: 54.2000008; y: 74.5; skew-x: -7.19999981; skew-y: -7.19999981; }
        frame 38 { x: 53.0999985; y: 74.8000031; skew-x: -7.9000001; skew-y: -7.9000001; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 39 { x: -10000; y: 74.5; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 40 { x: 53; y: 74.1999969; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: -10000; y: 73.8000031; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 42 { x: 52.7999992; y: 73.6999969; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 43 { x: 52.9000015; y: 73.4000015; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 44 { x: -10000; y: 73.1999969; skew-x: 6.0999999; skew-y: 6.0999999; }
        frame 45 { x: 53; y: 73; skew-x: 8.5; skew-y: 8.5; }
        frame 46 { x: -10000; y: 72.9000015; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 47 { x: 53; y: 72.6999969; skew-x: 13.3000002; skew-y: 13.3000002; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 48 { x: 54.2999992; y: 71.8000031; skew-x: 19; skew-y: 19; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 49 { x: 55.5; y: 71; skew-x: 24.7000008; skew-y: 24.7000008; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 55.9000015; y: 70.4000015; skew-x: 22.7999992; skew-y: 22.7999992; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 51 { x: 56.5; y: 69.8000031; skew-x: 21; skew-y: 21; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 57; y: 69.3000031; skew-x: 19.2000008; skew-y: 19.2000008; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 53 { x: 58; y: 68.9000015; skew-x: 20; skew-y: 20; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 54 { x: 58.9000015; y: 68.5999985; skew-x: 21; skew-y: 21; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 59.9000015; y: 68.1999969; skew-x: 22; skew-y: 22; }
        frame 56 { x: 60.7000008; y: 68; skew-x: 22.7999992; skew-y: 22.7999992; }
        frame 57 { x: 61.5999985; y: 67.5999985; skew-x: 23.7999992; skew-y: 23.7999992; }
        frame 58 { x: 62.5999985; y: 67.1999969; skew-x: 24.7999992; skew-y: 24.7999992; }
        frame 59 { x: 63.5; y: 66.9000015; skew-x: 25.7999992; skew-y: 25.7999992; }
        frame 60 { x: 64.5; y: 66.5999985; skew-x: 26.7999992; skew-y: 26.7999992; }
        frame 61 { x: 65.4000015; y: 66.3000031; skew-x: 27.6000004; skew-y: 27.6000004; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 62 { x: 66.5; y: 66; skew-x: 28.7000008; skew-y: 28.7000008; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 63 { x: 65.8000031; y: 67.1999969; skew-x: 26.7999992; skew-y: 26.7999992; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 64 { x: 65.3000031; y: 68.1999969; skew-x: 25.1000004; skew-y: 25.1000004; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 64.8000031; y: 69.3000031; skew-x: 23.2999992; skew-y: 23.2999992; }
        frame 66 { x: 64.1999969; y: 70.5; skew-x: 21.5; skew-y: 21.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 67 { x: 63.5999985; y: 71.1999969; skew-x: 19; skew-y: 19; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 68 { x: 63.2999992; y: 71.8000031; skew-x: 16.7000008; skew-y: 16.7000008; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 62.5999985; y: 71.4000015; skew-x: 11; skew-y: 11; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 70 { x: 62.0999985; y: 71.1999969; skew-x: 5.5; skew-y: 5.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 71 { x: 61.5; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 72 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 62; y: 70.4000015; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 74 { x: 62.5; y: 69.5999985; skew-x: 2.5; skew-y: 2.5; }
        frame 75 { x: 63; y: 68.9000015; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 76 { x: 63.4000015; y: 68.3000031; skew-x: 5.30000019; skew-y: 5.30000019; }
        frame 77 { x: 63.9000015; y: 67.5; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 78 { x: 64.3000031; y: 66.8000031; skew-x: 7.80000019; skew-y: 7.80000019; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 64.8000031; y: 66.0999985; skew-x: 9.10000038; skew-y: 9.10000038; }
        frame 80 { x: 65.3000031; y: 65.4000015; skew-x: 10.6000004; skew-y: 10.6000004; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 81 { x: 61.7999992; y: 66.1999969; skew-x: 6.5999999; skew-y: 6.5999999; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 82 { x: 58.5; y: 66.8000031; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 55.4000015; y: 67.6999969; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 84 { x: 54.5999985; y: 69.4000015; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 85 { x: 53.7000008; y: 71.3000031; skew-x: -8.69999981; skew-y: -8.69999981; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 86 { x: 53; y: 73.3000031; skew-x: -12.3999996; skew-y: -12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 52.2999992; y: 75.3000031; skew-x: -16.3999996; skew-y: -16.3999996; }
        frame 88 { x: 53.9000015; y: 73.5999985; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 89 { x: 55.5; y: 71.9000015; skew-x: -1.60000002; skew-y: -1.60000002; }
        frame 90 { x: 57; y: 70.3000031; skew-x: -1; skew-y: -1; }
        frame 91 { x: 58.5; y: 68.8000031; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 92 { x: 59.2000008; y: 69.4000015; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 59.9000015; y: 70; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 94 { x: 60.7999992; y: 70.5999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 95 { x: 61.5; y: 71.1999969; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: -10000; y: -10000; }
        frame 97 { x: 60.5999985; y: 70.3000031; skew-x: 0.5; skew-y: 0.5; }
        frame 98 { x: 59.5999985; y: 69.5999985; skew-x: 1; skew-y: 1; }
        frame 99 { x: 58.7000008; y: 68.8000031; skew-x: 1.5; skew-y: 1.5; }
        frame 100 { x: 57.7999992; y: 68; skew-x: 2; skew-y: 2; }
        frame 101 { x: 56.9000015; y: 67.1999969; skew-x: 2.5; skew-y: 2.5; }
        frame 102 { x: 55.9000015; y: 66.5; skew-x: 3; skew-y: 3; }
        frame 103 { x: 55; y: 65.5999985; skew-x: 3.5; skew-y: 3.5; }
        frame 104 { x: 54; y: 64.8000031; skew-x: 4.0999999; skew-y: 4.0999999; }
        frame 105 { x: 47.9000015; y: 66; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 106 { x: 42.0999985; y: 67.4000015; skew-x: -13.3999996; skew-y: -13.3999996; scale-x: -10000; scale-y: -10000; }
        frame 107 { x: 36.7999992; y: 69.1999969; skew-x: -22.2000008; skew-y: -22.2000008; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 108 { x: 31.8999996; y: 71.1999969; skew-x: -31; skew-y: -31; scale-x: -10000; scale-y: -10000; }
        frame 109 { x: 27.3999996; y: 73.3000031; skew-x: -39.7999992; skew-y: -39.7999992; }
        frame 110 { x: 23.3999996; y: 75.8000031; skew-x: -48.7999992; skew-y: -48.7999992; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 111 { x: 19.8999996; y: 78.0999985; skew-x: -57.5999985; skew-y: -57.5999985; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 16.8999996; y: 80.3000031; skew-x: -66.3000031; skew-y: -66.3000031; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 113 { x: 12.8999996; y: 85.5999985; skew-x: -76.5999985; skew-y: -76.5999985; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 114 { x: 9.5; y: 90.5; skew-x: -86.5999985; skew-y: -86.5999985; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 115 { x: 6.5999999; y: 95; skew-x: -96.6999969; skew-y: -96.6999969; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 116 { x: 1.79999995; y: 100.5; skew-x: -106.699997; skew-y: -106.699997; scale-x: -10000; scale-y: -10000; }
        frame 117 { x: -2.5; y: 105.699997; skew-x: -116.900002; skew-y: -116.900002; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 118 { x: -6.69999981; y: 110.099998; skew-x: -127; skew-y: -127; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 119 { x: -9.80000019; y: 111.599998; skew-x: -115; skew-y: -115; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 120 { x: -12.3999996; y: 112.300003; skew-x: -103; skew-y: -103; scale-x: -10000; scale-y: -10000; }
        frame 121 { x: -14.5; y: 112.5; skew-x: -91.1999969; skew-y: -91.1999969; }
        frame 122 { x: -16.8999996; y: 110.300003; skew-x: -75.4000015; skew-y: -75.4000015; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 123 { x: -17.7000008; y: 107.599998; skew-x: -59.5; skew-y: -59.5; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 124 { x: -17.1000004; y: 104.599998; skew-x: -43.5; skew-y: -43.5; scale-x: -10000; scale-y: -10000; }
        frame 125 { x: -14.8999996; y: 101.900002; skew-x: -27.7000008; skew-y: -27.7000008; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 126 { x: -15; y: 102.599998; skew-x: -31; skew-y: -31; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 127 { x: -15.1000004; y: 103.5; skew-x: -34.2000008; skew-y: -34.2000008; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -10000; y: 104.199997; skew-x: -37.5; skew-y: -37.5; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 129 { y: 103.5; skew-x: -34.2000008; skew-y: -34.2000008; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 130 { x: -15; y: 102.599998; skew-x: -31; skew-y: -31; scale-x: -10000; scale-y: -10000; }
        frame 131 { x: -14.8999996; y: 101.900002; skew-x: -27.7000008; skew-y: -27.7000008; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 132 { x: 61.5; y: 71.1999969; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 133 { x: 61.0999985; y: 71.5; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: -10000; scale-y: -10000; }
        frame 134 { x: 60.7999992; y: 71.5999985; skew-x: -1; skew-y: -1; }
        frame 135 { x: 60.2999992; y: 72; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 136 { x: 59.9000015; y: 72.3000031; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 137 { x: 59.5; y: 72.5999985; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 138 { x: 59; y: 72.8000031; skew-x: -3.4000001; skew-y: -3.4000001; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 139 { x: 58.5; y: 73.0999985; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: -10000; scale-y: -10000; }
        frame 140 { x: 58.0999985; y: 73.4000015; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 141 { x: 57.0999985; y: 73.6999969; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 142 { x: 56.0999985; y: 73.9000015; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 55.0999985; y: 74.1999969; skew-x: -6.5; skew-y: -6.5; }
        frame 144 { x: 54.2000008; y: 74.5; skew-x: -7.19999981; skew-y: -7.19999981; }
        frame 145 { x: 53.0999985; y: 74.8000031; skew-x: -7.9000001; skew-y: -7.9000001; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 146 { x: -10000; y: 74.5; skew-x: -5.4000001; skew-y: -5.4000001; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 147 { x: 53; y: 74.1999969; skew-x: -3.20000005; skew-y: -3.20000005; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: -10000; y: 73.8000031; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 149 { x: 52.7999992; y: 73.6999969; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 150 { x: 52.9000015; y: 73.4000015; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 151 { x: -10000; y: 73.1999969; skew-x: 6.0999999; skew-y: 6.0999999; }
        frame 152 { x: 53; y: 73; skew-x: 8.5; skew-y: 8.5; }
        frame 153 { x: -10000; y: 72.9000015; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 154 { x: 53; y: 72.6999969; skew-x: 13.3000002; skew-y: 13.3000002; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 155 { x: 54.2999992; y: 71.8000031; skew-x: 19; skew-y: 19; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 156 { x: 55.5; y: 71; skew-x: 24.7000008; skew-y: 24.7000008; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 55.9000015; y: 70.4000015; skew-x: 22.7999992; skew-y: 22.7999992; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 158 { x: 56.5; y: 69.8000031; skew-x: 21; skew-y: 21; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: 57; y: 69.3000031; skew-x: 19.2000008; skew-y: 19.2000008; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 160 { x: 58; y: 68.9000015; skew-x: 20; skew-y: 20; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 161 { x: 58.9000015; y: 68.5999985; skew-x: 21; skew-y: 21; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 59.9000015; y: 68.1999969; skew-x: 22; skew-y: 22; }
        frame 163 { x: 60.7000008; y: 68; skew-x: 22.7999992; skew-y: 22.7999992; }
        frame 164 { x: 61.5999985; y: 67.5999985; skew-x: 23.7999992; skew-y: 23.7999992; }
        frame 165 { x: 62.5999985; y: 67.1999969; skew-x: 24.7999992; skew-y: 24.7999992; }
        frame 166 { x: 63.5; y: 66.9000015; skew-x: 25.7999992; skew-y: 25.7999992; }
        frame 167 { x: 64.5; y: 66.5999985; skew-x: 26.7999992; skew-y: 26.7999992; }
        frame 168 { x: 65.4000015; y: 66.3000031; skew-x: 27.6000004; skew-y: 27.6000004; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 169 { x: 66.5; y: 66; skew-x: 28.7000008; skew-y: 28.7000008; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 170 { x: 65.8000031; y: 67.1999969; skew-x: 26.7999992; skew-y: 26.7999992; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 171 { x: 65.3000031; y: 68.1999969; skew-x: 25.1000004; skew-y: 25.1000004; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 64.8000031; y: 69.3000031; skew-x: 23.2999992; skew-y: 23.2999992; }
        frame 173 { x: 64.1999969; y: 70.5; skew-x: 21.5; skew-y: 21.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 174 { x: 63.5999985; y: 71.1999969; skew-x: 19; skew-y: 19; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 175 { x: 63.2999992; y: 71.8000031; skew-x: 16.7000008; skew-y: 16.7000008; scale-x: -10000; scale-y: -10000; }
        frame 176 { x: 62.5999985; y: 71.4000015; skew-x: 11; skew-y: 11; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 177 { x: 62.0999985; y: 71.1999969; skew-x: 5.5; skew-y: 5.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 178 { x: 61.5; y: -10000; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 179 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 62; y: 70.4000015; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 181 { x: 62.5; y: 69.5999985; skew-x: 2.5; skew-y: 2.5; }
        frame 182 { x: 63; y: 68.9000015; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 183 { x: 63.4000015; y: 68.3000031; skew-x: 5.30000019; skew-y: 5.30000019; }
        frame 184 { x: 63.9000015; y: 67.5; skew-x: 6.5; skew-y: 6.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 185 { x: 64.3000031; y: 66.8000031; skew-x: 7.80000019; skew-y: 7.80000019; scale-x: -10000; scale-y: -10000; }
        frame 186 { x: 64.8000031; y: 66.0999985; skew-x: 9.10000038; skew-y: 9.10000038; }
        frame 187 { x: 65.3000031; y: 65.4000015; skew-x: 10.6000004; skew-y: 10.6000004; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 188 { x: 61.7999992; y: 66.1999969; skew-x: 6.5999999; skew-y: 6.5999999; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 189 { x: 58.5; y: 66.8000031; skew-x: 2.79999995; skew-y: 2.79999995; scale-x: -10000; scale-y: -10000; }
        frame 190 { x: 55.4000015; y: 67.6999969; skew-x: -0.899999976; skew-y: -0.899999976; }
        frame 191 { x: 54.5999985; y: 69.4000015; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 192 { x: 53.7000008; y: 71.3000031; skew-x: -8.69999981; skew-y: -8.69999981; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 193 { x: 53; y: 73.3000031; skew-x: -12.3999996; skew-y: -12.3999996; scale-x: -10000; scale-y: -10000; }
        frame 194 { x: 52.2999992; y: 75.3000031; skew-x: -16.3999996; skew-y: -16.3999996; }
        frame 195 { x: 53.9000015; y: 73.5999985; skew-x: -8.89999962; skew-y: -8.89999962; }
        frame 196 { x: 55.5; y: 71.9000015; skew-x: -1.60000002; skew-y: -1.60000002; }
        frame 197 { x: 57; y: 70.3000031; skew-x: -1; skew-y: -1; }
        frame 198 { x: 58.5; y: 68.8000031; skew-x: -0.699999988; skew-y: -0.699999988; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 199 { x: 59.2000008; y: 69.4000015; skew-x: -0.400000006; skew-y: -0.400000006; scale-x: -10000; scale-y: -10000; }
        frame 200 { x: 59.9000015; y: 70; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 201 { x: 60.7999992; y: 70.5999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 202 { x: 61.5; y: 71.1999969; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 203 { x: -10000; y: -10000; }
        frame 204 { x: 62.5; y: 69.8000031; skew-x: 2; skew-y: 2; }
        frame 205 { x: 63.4000015; y: 68.5; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 206 { x: 64.4000015; y: 67.3000031; skew-x: 6.30000019; skew-y: 6.30000019; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 207 { x: 65.5; y: 66; skew-x: 8.5; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 208 { x: 66.5999985; y: 64.8000031; skew-x: 10.6000004; skew-y: 10.6000004; }
        frame 209 { x: 67.5999985; y: 63.5; skew-x: 12.8000002; skew-y: 12.8000002; }
        frame 210 { x: 67.0999985; y: 63.7000008; skew-x: 14.8000002; skew-y: 14.8000002; }
        frame 211 { x: 66.5999985; y: 63.7999992; skew-x: 16.7999992; skew-y: 16.7999992; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 212 { x: 66.1999969; y: 64; skew-x: 19; skew-y: 19; scale-x: -10000; scale-y: -10000; }
        frame 213 { x: 65.6999969; y: 64.0999985; skew-x: 21; skew-y: 21; }
        frame 214 { x: 65.1999969; y: 64.3000031; skew-x: 23.2000008; skew-y: 23.2000008; scale-x: 0.799000025; scale-y: 0.799000025; }
    }
    Track {
        source-name: "Zombie_ladder_innerarm_upper";
        frame-count: 215;
        frame 0 { x: 24.1000004; y: 44.9000015; skew-x: 22.5; skew-y: 22.5; scale-x: 0.848999977; scale-y: 0.848999977; image: IMAGE_REANIM_ZOMBIE_LADDER_INNERARM_UPPER; }
        frame 1 { x: 24.7999992; y: 44.0999985; skew-x: 23.5; skew-y: 23.5; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 25.5; y: 43.5; skew-x: 24.5; skew-y: 24.5; }
        frame 3 { x: 26.2000008; y: 42.9000015; skew-x: 25.2999992; skew-y: 25.2999992; }
        frame 4 { x: 27; y: 42.2000008; skew-x: 26.2999992; skew-y: 26.2999992; }
        frame 5 { x: 27.6000004; y: 41.5; skew-x: 27.2000008; skew-y: 27.2000008; }
        frame 6 { x: 28.3999996; y: 40.9000015; skew-x: 28; skew-y: 28; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 7 { x: 27.6000004; y: 41.4000015; skew-x: 27.2000008; skew-y: 27.2000008; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 8 { x: 27; y: 42.0999985; skew-x: 26.2999992; skew-y: 26.2999992; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 26.1000004; y: 42.7999992; skew-x: 25.2999992; skew-y: 25.2999992; }
        frame 10 { x: 25.5; y: 43.4000015; skew-x: 24.5; skew-y: 24.5; }
        frame 11 { x: 24.7999992; y: 44.0999985; skew-x: 23.5; skew-y: 23.5; }
        frame 12 { x: 24.1000004; y: 44.9000015; skew-x: 22.5; skew-y: 22.5; }
        frame 13 { x: 23.3999996; y: 45.4000015; skew-x: 21; skew-y: 21; }
        frame 14 { x: 22.7999992; y: 46; skew-x: 19.5; skew-y: 19.5; }
        frame 15 { x: 22.1000004; y: 46.7000008; skew-x: 18; skew-y: 18; }
        frame 16 { x: 21.6000004; y: 47.2999992; skew-x: 16.5; skew-y: 16.5; }
        frame 17 { x: 21; y: 47.9000015; skew-x: 15; skew-y: 15; }
        frame 18 { x: 20.2999992; y: 48.5999985; skew-x: 13.5; skew-y: 13.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 19 { x: 21; y: 48; skew-x: 15; skew-y: 15; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 20 { x: 21.5; y: 47.4000015; skew-x: 16.5; skew-y: 16.5; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 22.1000004; y: 46.7000008; skew-x: 18; skew-y: 18; }
        frame 22 { x: 22.7999992; y: 46; skew-x: 19.5; skew-y: 19.5; }
        frame 23 { x: 23.2999992; y: 45.5; skew-x: 21; skew-y: 21; }
        frame 24 { x: 24.1000004; y: 44.9000015; skew-x: 22.5; skew-y: 22.5; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 24.2000008; y: 44.5; skew-x: 21; skew-y: 21; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 27 { x: 24.2999992; y: 44.2999992; skew-x: 19.2000008; skew-y: 19.2000008; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -10000; y: 43.9000015; skew-x: 17.5; skew-y: 17.5; }
        frame 29 { x: 24.3999996; y: 43.7999992; skew-x: 15.8000002; skew-y: 15.8000002; }
        frame 30 { x: 25.1000004; y: 42; skew-x: 16.2999992; skew-y: 16.2999992; }
        frame 31 { x: 26; y: 40.2000008; skew-x: 16.7999992; skew-y: 16.7999992; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 32 { x: 26.5; y: 38.4000015; skew-x: 17.2000008; skew-y: 17.2000008; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 27.2999992; y: 36.5999985; skew-x: 17.6000004; skew-y: 17.6000004; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 34 { x: 27.7000008; y: 36.0999985; skew-x: 18.2000008; skew-y: 18.2000008; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 35 { x: 28.1000004; y: 35.7999992; skew-x: 18.7999992; skew-y: 18.7999992; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 28.2999992; y: 35.4000015; skew-x: 19.2999992; skew-y: 19.2999992; }
        frame 37 { x: 28.7999992; y: 34.9000015; skew-x: 19.7999992; skew-y: 19.7999992; }
        frame 38 { x: 29.2000008; y: 34.5; skew-x: 20.2999992; skew-y: 20.2999992; }
        frame 39 { x: 28.5; y: 35.4000015; skew-x: 23.5; skew-y: 21.1000004; scale-x: 0.859000027; scale-y: 0.874000013; }
        frame 40 { x: 27.7999992; y: 36.5; skew-x: 26.3999996; skew-y: 21.7000008; scale-x: 0.870999992; scale-y: 0.901000023; }
        frame 41 { x: 27.1000004; y: 37.4000015; skew-x: 29.2999992; skew-y: 22.3999996; scale-x: 0.883000016; scale-y: 0.92900002; }
        frame 42 { x: 26.5; y: 38.2999992; skew-x: 32.4000015; skew-y: 23.3999996; scale-x: 0.896000028; scale-y: 0.957000017; }
        frame 43 { x: 25.8999996; y: 39.4000015; skew-x: 35.0999985; skew-y: 24.1000004; scale-x: 0.910000026; scale-y: 0.985000014; }
        frame 44 { x: 25.3999996; y: 40.9000015; skew-x: 38; skew-y: 27; scale-x: 0.908999979; scale-y: -10000; }
        frame 45 { x: 24.8999996; y: 42.5; skew-x: 40.5; skew-y: 29.6000004; scale-x: -10000; }
        frame 46 { x: 24.2999992; y: 44.4000015; skew-x: 43.2999992; skew-y: 32.2999992; scale-x: 0.907999992; scale-y: 0.984000027; }
        frame 47 { x: 23.8999996; y: 46.0999985; skew-x: 46.0999985; skew-y: 35.0999985; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: 24.6000004; y: 44.7999992; skew-x: 43.7999992; skew-y: 32.7999992; }
        frame 49 { x: 25.2999992; y: 43.4000015; skew-x: 41.5; skew-y: 30.6000004; }
        frame 50 { x: 26.1000004; y: 42.0999985; skew-x: 39.2999992; skew-y: 28.3999996; scale-x: 0.908999979; scale-y: 0.985000014; }
        frame 51 { x: 27; y: 41; skew-x: 37.4000015; skew-y: 26.5; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 27.7000008; y: 39.9000015; skew-x: 35.0999985; skew-y: 24.1000004; scale-x: 0.910000026; }
        frame 53 { x: 28; y: 38.7999992; skew-x: 32.4000015; skew-y: 23.3999996; scale-x: 0.896000028; scale-y: 0.957000017; }
        frame 54 { x: 28.1000004; y: 37.7999992; skew-x: 29.2999992; skew-y: 22.3999996; scale-x: 0.883000016; scale-y: 0.92900002; }
        frame 55 { x: 28.3999996; y: 36.7999992; skew-x: 26.3999996; skew-y: 21.7000008; scale-x: 0.870999992; scale-y: 0.901000023; }
        frame 56 { x: 28.8999996; y: 35.7999992; skew-x: 23.5; skew-y: 21.1000004; scale-x: 0.859000027; scale-y: 0.874000013; }
        frame 57 { x: 29.2000008; y: 34.7999992; skew-x: 20.2999992; skew-y: 20.2999992; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 58 { x: 28.8999996; y: 35; skew-x: 19.7999992; skew-y: 19.7999992; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 28.3999996; y: 35.5; skew-x: 19.2999992; skew-y: 19.2999992; }
        frame 60 { x: 28.1000004; y: 36; skew-x: 18.7999992; skew-y: 18.7999992; }
        frame 61 { x: 27.7000008; y: 36.4000015; skew-x: 18.2999992; skew-y: 18.2999992; }
        frame 62 { x: 27.2999992; y: 36.9000015; skew-x: 17.6000004; skew-y: 17.6000004; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 63 { x: 26.1000004; y: 40; skew-x: 18.2999992; skew-y: 18.2999992; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 64 { x: 25; y: 43.2000008; skew-x: 19; skew-y: 19; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 23.7999992; y: 46.4000015; skew-x: 19.5; skew-y: 19.5; }
        frame 66 { x: 22.3999996; y: 49.4000015; skew-x: 20; skew-y: 20; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 67 { x: 22.7999992; y: 48.5; skew-x: 20.5; skew-y: 20.5; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 23; y: 47.5999985; skew-x: 21; skew-y: 21; }
        frame 69 { x: 23.3999996; y: 46.7000008; skew-x: 21.5; skew-y: 21.5; }
        frame 70 { x: 23.7000008; y: 45.7999992; skew-x: 22; skew-y: 22; }
        frame 71 { x: 24.1000004; y: 44.9000015; skew-x: 22.5; skew-y: 22.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 25.7000008; y: 42.0999985; skew-x: 22.2999992; skew-y: 22.2999992; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 74 { x: 27.3999996; y: 39.2000008; skew-x: 22; skew-y: 22; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 29.1000004; y: 36.5; skew-x: -10000; skew-y: -10000; }
        frame 76 { x: 30.7999992; y: 33.5; skew-x: 21.6000004; skew-y: 21.6000004; }
        frame 77 { x: 31.7999992; y: -10000; skew-x: 18.7999992; skew-y: 18.7999992; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 78 { x: 32.9000015; skew-x: 16; skew-y: 16; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 79 { x: 33.9000015; skew-x: 13; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 80 { x: 35.0999985; skew-x: 10.1000004; skew-y: 10.1000004; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 81 { x: 26.1000004; y: 41.7999992; skew-x: 1.39999998; skew-y: 2; scale-x: -10000; scale-y: 0.842999995; }
        frame 82 { x: 17.2000008; y: 50.2000008; skew-x: -7; skew-y: -5.9000001; scale-x: 0.84799999; scale-y: 0.841000021; }
        frame 83 { x: 8.39999962; y: 59.0999985; skew-x: -15.6999998; skew-y: -14; scale-x: 0.850000024; scale-y: 0.839999974; }
        frame 84 { x: 7.80000019; y: 60.5; skew-x: -18.1000004; skew-y: -16.3999996; scale-x: 0.848999977; scale-y: 0.838; }
        frame 85 { x: 7.30000019; y: 62; skew-x: -20.2999992; skew-y: -18.6000004; scale-x: 0.84799999; scale-y: -10000; }
        frame 86 { x: 6.69999981; y: 63.4000015; skew-x: -22.6000004; skew-y: -20.8999996; scale-x: -10000; scale-y: 0.837000012; }
        frame 87 { x: 6.0999999; y: 64.8000031; skew-x: -24.7999992; skew-y: -23.1000004; scale-y: 0.838; }
        frame 88 { x: 8.39999962; y: 63.2999992; skew-x: -25.5; skew-y: -24; scale-x: 0.847000003; scale-y: -10000; }
        frame 89 { x: 10.6999998; y: 61.5999985; skew-x: -26.2000008; skew-y: -24.7999992; scale-x: -10000; scale-y: 0.838999987; }
        frame 90 { x: 13.1000004; y: 60.0999985; skew-x: -26.8999996; skew-y: -25.7000008; scale-y: 0.839999974; }
        frame 91 { x: 15.3000002; y: 58.5; skew-x: -27.5; skew-y: -26.5; scale-x: 0.84799999; scale-y: 0.842000008; }
        frame 92 { x: 16.7000008; y: 54.2999992; skew-x: -15.1000004; skew-y: -14.3000002; scale-x: 0.847000003; scale-y: 0.842999995; }
        frame 93 { x: 18.5; y: 50.5; skew-x: -2.4000001; skew-y: -1.89999998; scale-x: -10000; scale-y: 0.843999982; }
        frame 94 { x: 21; y: 47.4000015; skew-x: 10.1000004; skew-y: 10.3000002; scale-x: 0.84799999; scale-y: 0.846000016; }
        frame 95 { x: 24.1000004; y: 44.9000015; skew-x: 22.5; skew-y: 22.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 24.2000008; y: 43.5999985; skew-x: 16.7000008; skew-y: 16.7000008; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 98 { x: 24.3999996; y: 42.7000008; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 99 { x: 24.7000008; y: 41.7999992; skew-x: 5; skew-y: 5; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 100 { x: 24.8999996; y: 41.2000008; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 101 { x: 23.2000008; y: 40.0999985; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 102 { x: 21.6000004; y: 39.0999985; skew-x: -4.9000001; skew-y: -4.9000001; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 103 { x: 20; y: 38.0999985; skew-x: -6.9000001; skew-y: -6.9000001; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 104 { x: 18.5; y: 37.0999985; skew-x: -8.89999962; skew-y: -8.89999962; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 105 { x: 13.1999998; y: 38.7999992; skew-x: -14.6999998; skew-y: -14.6999998; scale-x: 0.842000008; scale-y: 0.841000021; }
        frame 106 { x: 7.80000019; y: 40.5; skew-x: -20.5; skew-y: -20.5; scale-x: 0.839999974; scale-y: 0.839999974; }
        frame 107 { x: 2.5999999; y: 42.2999992; skew-x: -26.3999996; skew-y: -26.3999996; scale-x: 0.841000021; scale-y: 0.837000012; }
        frame 108 { x: -2.4000001; y: 44.2999992; skew-x: -32.0999985; skew-y: -32.2000008; scale-x: 0.839999974; scale-y: -10000; }
        frame 109 { x: -7.4000001; y: 49.7000008; skew-x: -40.7999992; skew-y: -40.7999992; scale-x: 0.838; }
        frame 110 { x: -12.1000004; y: 55.4000015; skew-x: -49.2999992; skew-y: -49.2999992; scale-x: -10000; }
        frame 111 { x: -16.3999996; y: 60.7999992; skew-x: -57.7000008; skew-y: -57.7999992; scale-x: 0.838999987; scale-y: 0.836000025; }
        frame 112 { x: -20.2000008; y: 66.1999969; skew-x: -66.4000015; skew-y: -66.3000031; scale-x: 0.838; scale-y: -10000; }
        frame 113 { x: -24.7000008; y: 74; skew-x: -72.9000015; skew-y: -72.9000015; scale-x: 0.836000025; scale-y: 0.834999979; }
        frame 114 { x: -29; y: 81.5999985; skew-x: -79.5; skew-y: -79.5; scale-x: -10000; scale-y: 0.833000004; }
        frame 115 { x: -33; y: 89.1999969; skew-x: -86.0999985; skew-y: -86.0999985; scale-y: 0.832000017; }
        frame 116 { x: -36.9000015; y: 96.8000031; skew-x: -92.8000031; skew-y: -92.8000031; scale-y: 0.833000004; }
        frame 117 { x: -38.2000008; y: 115.199997; skew-x: -108.400002; skew-y: -108.400002; scale-x: 0.834999979; scale-y: 0.83099997; }
        frame 118 { x: -38.9000015; y: 132.600006; skew-x: -123.900002; skew-y: -123.900002; scale-x: 0.836000025; scale-y: 0.833000004; }
        frame 119 { x: -39; y: 132.800003; skew-x: -124.800003; skew-y: -123; scale-x: 0.815999985; scale-y: 0.824000001; }
        frame 120 { x: -38.9000015; y: 133; skew-x: -125.800003; skew-y: -122.099998; scale-x: 0.796000004; scale-y: 0.815999985; }
        frame 121 { x: -10000; y: 133.300003; skew-x: -126.699997; skew-y: -121.099998; scale-x: 0.778999984; scale-y: 0.808000028; }
        frame 122 { x: -39.7000008; y: 131.300003; skew-x: -124.599998; skew-y: -117.800003; scale-x: 0.76700002; scale-y: 0.801999986; }
        frame 123 { x: -40.5; y: 129.199997; skew-x: -122.599998; skew-y: -114.5; scale-x: 0.754999995; scale-y: 0.796999991; }
        frame 124 { x: -41.2000008; y: 127.199997; skew-x: -120.599998; skew-y: -111.199997; scale-x: 0.744000018; scale-y: 0.791999996; }
        frame 125 { x: -42; y: 125; skew-x: -118.599998; skew-y: -107.900002; scale-x: 0.734000027; scale-y: 0.788999975; }
        frame 126 { x: -42.5; y: 124; skew-x: -116.800003; skew-y: -106.099998; scale-x: 0.731999993; scale-y: 0.787; }
        frame 127 { x: -43; y: 123; skew-x: -115.099998; skew-y: -104.400002; scale-x: -10000; scale-y: -10000; }
        frame 128 { x: -43.5999985; y: 122; skew-x: -113.099998; skew-y: -102.400002; }
        frame 129 { x: -44; y: 121; skew-x: -111.300003; skew-y: -100.599998; scale-x: 0.73299998; scale-y: 0.787999988; }
        frame 130 { x: -43; y: 123.099998; skew-x: -115; skew-y: -104.400002; scale-x: 0.731999993; scale-y: 0.787; }
        frame 131 { x: -42; y: 125; skew-x: -118.599998; skew-y: -107.900002; scale-x: 0.734000027; scale-y: 0.788999975; }
        frame 132 { x: 21.2999992; y: 47; skew-x: 4.9000001; skew-y: 4.9000001; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 133 { x: 21.6000004; y: 46.5; skew-x: 5; skew-y: 5; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 134 { x: 21.7999992; y: 46.0999985; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: 22.1000004; y: 45.5999985; }
        frame 136 { x: 22.2999992; y: 45.2000008; skew-x: 4.9000001; skew-y: 4.9000001; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 137 { x: 23; y: 43.0999985; skew-x: 6.19999981; skew-y: 6.19999981; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 138 { x: 23.7000008; y: 41; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 24.6000004; y: 38.7999992; skew-x: 8.5; skew-y: 8.5; }
        frame 140 { x: 25.2999992; y: 36.5999985; skew-x: 9.69999981; skew-y: 9.69999981; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 141 { x: 25.7000008; y: 36.0999985; skew-x: 11.3000002; skew-y: 11.3000002; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 142 { x: 26.2999992; y: 35.4000015; skew-x: 13; skew-y: 13; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 26.7999992; y: 34.7999992; skew-x: 14.5; skew-y: 14.5; }
        frame 144 { x: 27.3999996; y: 34.2000008; skew-x: 16; skew-y: 16; }
        frame 145 { x: 28; y: 33.5999985; skew-x: 17.5; skew-y: 17.5; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 146 { x: 26.2000008; y: 36.5; skew-x: 13.1999998; skew-y: 13.1999998; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 147 { x: 24.3999996; y: 39.4000015; skew-x: 8.69999981; skew-y: 8.69999981; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 148 { x: 22.6000004; y: 42.5999985; skew-x: 4.19999981; skew-y: 4.19999981; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 21; y: 45.9000015; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 150 { x: 19.2999992; y: 49; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 151 { x: 18.7999992; y: 50.5999985; skew-x: -10000; skew-y: -10000; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 152 { x: 18.2999992; y: 52.0999985; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 17.7999992; y: 53.5999985; }
        frame 154 { x: 17.2999992; y: 55; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 155 { x: 17.7999992; y: 54; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 156 { x: 18.2999992; y: 53.0999985; skew-x: -6.9000001; skew-y: -6.9000001; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 18.7999992; y: 52; skew-x: -8; skew-y: -8; }
        frame 158 { x: 19.3999996; y: 51; skew-x: -9.19999981; skew-y: -9.19999981; }
        frame 159 { x: 19.8999996; y: 49.9000015; skew-x: -10.1999998; skew-y: -10.1999998; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 160 { x: 21.7000008; y: 47.7000008; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 161 { x: 23.2999992; y: 45.5999985; skew-x: -8.5; skew-y: -8.5; scale-x: -10000; scale-y: -10000; }
        frame 162 { x: 25; y: 43.4000015; skew-x: -7.5; skew-y: -7.5; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 163 { x: 26.7000008; y: 41.2999992; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 28.2999992; y: 39.0999985; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 165 { x: 27.8999996; y: -10000; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 166 { x: 27.6000004; y: 39.2999992; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 167 { x: 27.2000008; y: 39.4000015; skew-x: -4; skew-y: -4; scale-x: -10000; scale-y: -10000; }
        frame 168 { x: 26.8999996; y: 39.5; skew-x: -3.5; skew-y: -3.5; }
        frame 169 { x: 26.7000008; y: -10000; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 170 { x: 24.2000008; y: 43.7999992; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 171 { x: 21.7999992; y: 48.0999985; skew-x: -9; skew-y: -9; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 19.3999996; y: 52.5; skew-x: -12; skew-y: -12; }
        frame 173 { x: 17; y: 57; skew-x: -15; skew-y: -15; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 174 { x: 17.7999992; y: 54.7999992; skew-x: -11; skew-y: -11; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 175 { x: 18.6000004; y: 52.7999992; skew-x: -7; skew-y: -7; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 176 { x: 19.5; y: 50.7999992; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 177 { x: 20.3999996; y: 48.9000015; skew-x: 1; skew-y: 1; scale-x: -10000; scale-y: -10000; }
        frame 178 { x: 21.2999992; y: 47; skew-x: 4.9000001; skew-y: 4.9000001; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 21.8999996; y: 45.7999992; skew-x: 1; skew-y: 1; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 181 { x: 22.5; y: 44.5; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 23.1000004; y: 43.4000015; skew-x: -7; skew-y: -7; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 183 { x: 23.7999992; y: 42.5; skew-x: -11.1999998; skew-y: -11.1999998; scale-x: -10000; scale-y: -10000; }
        frame 184 { x: 24.3999996; y: 41.5; skew-x: -15.1999998; skew-y: -15.1999998; }
        frame 185 { x: 25.2999992; y: 40.5; skew-x: -19.2999992; skew-y: -19.2999992; }
        frame 186 { x: 26.2000008; y: 39.5999985; skew-x: -23.2999992; skew-y: -23.2999992; }
        frame 187 { x: 27.1000004; y: 38.7999992; skew-x: -27.2999992; skew-y: -27.2999992; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 188 { x: 24.3999996; y: 43.2999992; skew-x: -38.7999992; skew-y: -38.7999992; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 189 { x: 22.5; y: 47.9000015; skew-x: -50; skew-y: -50; scale-x: -10000; scale-y: -10000; }
        frame 190 { x: 21; y: 52.5; skew-x: -61.0999985; skew-y: -61.0999985; }
        frame 191 { x: 20.2999992; y: 57; skew-x: -72.4000015; skew-y: -72.4000015; }
        frame 192 { x: -10000; y: 61.4000015; skew-x: -83.9000015; skew-y: -83.9000015; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 193 { x: 20.7000008; y: 65.5; skew-x: -95.1999969; skew-y: -95.1999969; scale-x: -10000; scale-y: -10000; }
        frame 194 { x: 21.7999992; y: 69.1999969; skew-x: -106.599998; skew-y: -106.599998; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 195 { x: 18.6000004; y: 67.0999985; skew-x: -92.6999969; skew-y: -92.6999969; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 196 { x: 16.2000008; y: 64.1999969; skew-x: -78.5999985; skew-y: -78.6999969; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 197 { x: 14.6000004; y: 60.9000015; skew-x: -64.5999985; skew-y: -64.5999985; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 14.1000004; y: 57.5999985; skew-x: -50.7999992; skew-y: -50.7999992; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 199 { x: 14.5; y: 54.2999992; skew-x: -37; skew-y: -37; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 200 { x: 16; y: 51.2999992; skew-x: -23; skew-y: -23; scale-x: -10000; scale-y: -10000; }
        frame 201 { x: 18.2999992; y: 48.7999992; skew-x: -9; skew-y: -9; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 202 { x: 21.2999992; y: 47; skew-x: 4.9000001; skew-y: 4.9000001; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 203 { x: 24.1000004; y: 44.9000015; skew-x: 22.5; skew-y: 22.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 204 { x: 29.5; y: 40.7000008; skew-x: 35.7999992; skew-y: 35.7999992; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 205 { x: 35.2000008; y: 37.5; skew-x: 49.4000015; skew-y: 49.4000015; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 206 { x: 40.5; y: 35.4000015; skew-x: 62.9000015; skew-y: 62.9000015; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 207 { x: 45.5; y: 34; skew-x: 76.4000015; skew-y: 76.4000015; scale-x: -10000; scale-y: -10000; }
        frame 208 { x: 49.7000008; y: 33.4000015; skew-x: 90; skew-y: 90; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 209 { x: 53; y: 33.0999985; skew-x: 103.400002; skew-y: 103.400002; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 210 { x: 49.5; y: 34.5; skew-x: 99.1999969; skew-y: 99.1999969; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 211 { x: 47.5; y: 35.9000015; skew-x: 95; skew-y: 95; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 212 { x: 46.5999985; y: 38; skew-x: 90.6999969; skew-y: 90.6999969; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 213 { x: 47.2000008; y: 41.7999992; skew-x: 79.4000015; skew-y: 79.4000015; scale-x: 0.842000008; scale-y: 0.842000008; }
        frame 214 { x: 42.9000015; y: 46.5999985; skew-x: 69.9000015; skew-y: 70.0999985; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Zombie_ladder_body";
        frame-count: 215;
        frame 0 { x: 26.8999996; y: 35.4000015; skew-x: 357.200012; skew-y: 357.200012; scale-x: 0.850000024; scale-y: 0.850000024; image: IMAGE_REANIM_ZOMBIE_LADDER_BODY; }
        frame 1 { x: 27.3999996; y: 34.7999992; skew-x: 357.700012; skew-y: 357.700012; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 27.8999996; y: 34.2000008; skew-x: 358.200012; skew-y: 358.200012; }
        frame 3 { x: 28.2999992; y: 33.5999985; skew-x: 358.700012; skew-y: 358.700012; }
        frame 4 { x: 28.7999992; y: 33.0999985; skew-x: 359.200012; skew-y: 359.200012; }
        frame 5 { x: 29.2000008; y: 32.5999985; skew-x: 359.700012; skew-y: 359.700012; }
        frame 6 { x: 29.5; y: 32.0999985; skew-x: 360; skew-y: 360; }
        frame 7 { x: 29.1000004; y: 32.5999985; skew-x: 359.700012; skew-y: 359.700012; }
        frame 8 { x: 28.7000008; y: 33.0999985; skew-x: 359.200012; skew-y: 359.200012; }
        frame 9 { x: 28.2999992; y: 33.7000008; skew-x: 358.700012; skew-y: 358.700012; }
        frame 10 { x: 27.7999992; y: 34.2000008; skew-x: 358.200012; skew-y: 358.200012; }
        frame 11 { x: 27.2999992; y: 34.7999992; skew-x: 357.700012; skew-y: 357.700012; }
        frame 12 { x: 26.8999996; y: 35.4000015; skew-x: 357.200012; skew-y: 357.200012; }
        frame 13 { x: 26.6000004; y: 35.7999992; skew-x: 357; skew-y: 357; }
        frame 14 { x: 26.2000008; y: 36.2999992; skew-x: 356.5; skew-y: 356.5; }
        frame 15 { x: 26; y: 36.7000008; skew-x: 356.200012; skew-y: 356.200012; }
        frame 16 { x: 25.6000004; y: 37.2000008; skew-x: 355.700012; skew-y: 355.700012; }
        frame 17 { x: 25.2999992; y: 37.5; skew-x: 355.5; skew-y: 355.5; }
        frame 18 { x: 24.8999996; y: 38.0999985; skew-x: 355; skew-y: 355; }
        frame 19 { x: 25.2999992; y: 37.5999985; skew-x: 355.5; skew-y: 355.5; }
        frame 20 { x: 25.7000008; y: 37.2999992; skew-x: 355.700012; skew-y: 355.700012; }
        frame 21 { x: 26; y: 36.7999992; skew-x: 356.200012; skew-y: 356.200012; }
        frame 22 { x: 26.2999992; y: 36.2999992; skew-x: 356.5; skew-y: 356.5; }
        frame 23 { x: 26.7000008; y: 35.7999992; skew-x: 357; skew-y: 357; }
        frame 24 { x: 26.8999996; y: 35.4000015; skew-x: 357.200012; skew-y: 357.200012; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 27.8999996; y: 34.7999992; skew-x: 358.200012; skew-y: 358.200012; }
        frame 27 { x: 28.7999992; y: 34.2999992; skew-x: 359.200012; skew-y: 359.200012; }
        frame 28 { x: 29.6000004; y: 33.7000008; skew-x: 360; skew-y: 360; }
        frame 29 { x: 30.5; y: 33.2999992; skew-x: 360.799988; skew-y: 360.799988; }
        frame 30 { x: 31.7000008; y: 31.7000008; skew-x: 362.5; skew-y: 362.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 31 { x: 32.9000015; y: 30; skew-x: 364.5; skew-y: 364.5; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 34; y: 28.5; skew-x: 366.299988; skew-y: 366.299988; }
        frame 33 { x: 35.4000015; y: 27; skew-x: 368.399994; skew-y: 368.399994; }
        frame 34 { x: 36; y: 26.7000008; skew-x: 369.600006; skew-y: 369.600006; }
        frame 35 { x: 37; y: 26.1000004; skew-x: 371; skew-y: 371; }
        frame 36 { x: 37.9000015; y: 25.7999992; skew-x: 372.299988; skew-y: 372.299988; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 37 { x: 38.7999992; y: 25.3999996; skew-x: 373.799988; skew-y: 373.799988; scale-x: -10000; scale-y: -10000; }
        frame 38 { x: 39.5999985; y: 25; skew-x: 375.200012; skew-y: 375.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 39 { x: 37.4000015; y: 26.3999996; skew-x: 372.600006; skew-y: 372.600006; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 40 { x: 35.2999992; y: 27.7999992; skew-x: 370; skew-y: 370; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 33.0999985; y: 29.2999992; skew-x: 367.5; skew-y: 367.5; }
        frame 42 { x: 31.1000004; y: 30.7999992; skew-x: 365; skew-y: 365; }
        frame 43 { x: 29.1000004; y: 32.4000015; skew-x: 362.700012; skew-y: 362.700012; }
        frame 44 { x: 27.2999992; y: 34.4000015; skew-x: 360.5; skew-y: 360.5; scale-y: 0.850000024; }
        frame 45 { x: 25.7000008; y: 36.4000015; skew-x: 358.5; skew-y: 358.5; scale-x: 0.847000003; scale-y: 0.851999998; }
        frame 46 { x: 24; y: 38.4000015; skew-x: 356.200012; skew-y: 356.200012; scale-x: -10000; scale-y: 0.855000019; }
        frame 47 { x: 22.2000008; y: 40.5; skew-x: 354; skew-y: 354; scale-y: 0.856999993; }
        frame 48 { x: 23.2999992; y: 39.2999992; skew-x: 354.700012; skew-y: 354.700012; scale-y: 0.855000019; }
        frame 49 { x: 24.3999996; y: 38.2999992; skew-x: 355.200012; skew-y: 355.200012; scale-y: 0.852999985; }
        frame 50 { x: 25.5; y: 37.2000008; skew-x: 355.700012; skew-y: 355.700012; scale-y: 0.851000011; }
        frame 51 { x: 26.6000004; y: 36.0999985; skew-x: 356.399994; skew-y: 356.399994; scale-x: 0.84799999; scale-y: 0.850000024; }
        frame 52 { x: 27.7000008; y: 35.2999992; skew-x: 356.899994; skew-y: 356.899994; scale-x: -10000; scale-y: 0.84799999; }
        frame 53 { x: 29.8999996; y: 33; skew-x: 360.5; skew-y: 360.5; scale-y: -10000; }
        frame 54 { x: 32.0999985; y: 30.8999996; skew-x: 364; skew-y: 364; }
        frame 55 { x: 34.5; y: 28.7999992; skew-x: 367.799988; skew-y: 367.799988; }
        frame 56 { x: 37.0999985; y: 26.8999996; skew-x: 371.5; skew-y: 371.5; }
        frame 57 { x: 39.5999985; y: 25; skew-x: 375.200012; skew-y: 375.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 58 { x: 38.7999992; y: 25.3999996; skew-x: 373.799988; skew-y: 373.799988; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 59 { x: 37.9000015; y: 25.7999992; skew-x: 372.299988; skew-y: 372.299988; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 37; y: 26.2000008; skew-x: 371; skew-y: 371; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 61 { x: 36.0999985; y: 26.6000004; skew-x: 369.600006; skew-y: 369.600006; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 35.4000015; y: 27; skew-x: 368.399994; skew-y: 368.399994; }
        frame 63 { x: 32.5999985; y: 29.7999992; skew-x: 364.799988; skew-y: 364.799988; }
        frame 64 { x: 30.2000008; y: 32.5; skew-x: 361.5; skew-y: 361.5; }
        frame 65 { x: 27.7999992; y: 35.4000015; skew-x: 358.200012; skew-y: 358.200012; }
        frame 66 { x: 25.3999996; y: 38.4000015; skew-x: 354.799988; skew-y: 354.799988; }
        frame 67 { x: 25.7999992; y: 37.5999985; skew-x: 355.399994; skew-y: 355.399994; }
        frame 68 { x: 26; y: 37.0999985; skew-x: 355.700012; skew-y: 355.700012; }
        frame 69 { x: 26.3999996; y: 36.5999985; skew-x: 356.200012; skew-y: 356.200012; }
        frame 70 { x: 26.7000008; y: 36; skew-x: 356.700012; skew-y: 356.700012; }
        frame 71 { x: 26.8999996; y: 35.4000015; skew-x: 357.200012; skew-y: 357.200012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 28.7000008; y: 33.2999992; skew-x: 359.5; skew-y: 359.5; }
        frame 74 { x: 30.3999996; y: 31.5; skew-x: 361.299988; skew-y: 361.299988; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 75 { x: 32.2000008; y: 29.5; skew-x: 363.299988; skew-y: 363.299988; scale-x: -10000; scale-y: -10000; }
        frame 76 { x: 34.0999985; y: 27.5; skew-x: 365.5; skew-y: 365.5; }
        frame 77 { x: 35.4000015; y: 26.2999992; skew-x: 366.799988; skew-y: 366.799988; }
        frame 78 { x: 37; y: 24.8999996; skew-x: 368.299988; skew-y: 368.299988; }
        frame 79 { x: 38.5; y: 23.5; skew-x: 369.799988; skew-y: 369.799988; }
        frame 80 { x: 40; y: 22.2000008; skew-x: 371.299988; skew-y: 371.299988; }
        frame 81 { x: 29.7000008; y: 28.2999992; skew-x: 362.100006; skew-y: 362.100006; }
        frame 82 { x: 20.3999996; y: 34.9000015; skew-x: 353.200012; skew-y: 353.200012; }
        frame 83 { x: 11.6000004; y: 42.4000015; skew-x: 344.100006; skew-y: 344.100006; }
        frame 84 { x: 11.3000002; y: 44.9000015; skew-x: 342.399994; skew-y: 342.399994; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 85 { x: 10.8000002; y: 47.5; skew-x: 340.700012; skew-y: 340.700012; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 10.5; y: 50.0999985; skew-x: 338.899994; skew-y: 338.899994; }
        frame 87 { x: 10; y: 52.7999992; skew-x: 337; skew-y: 337; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 88 { x: 11.6999998; y: 50.4000015; skew-x: 339.200012; skew-y: 339.200012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 89 { x: 13.1999998; y: 48; skew-x: 341.200012; skew-y: 341.200012; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 14.6999998; y: 45.5999985; skew-x: 343.200012; skew-y: 343.200012; }
        frame 91 { x: 16.2999992; y: 43.2999992; skew-x: 345.200012; skew-y: 345.200012; }
        frame 92 { x: 18.7999992; y: 41.0999985; skew-x: 348.200012; skew-y: 348.200012; }
        frame 93 { x: 21.3999996; y: 39.0999985; skew-x: 351.200012; skew-y: 351.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 94 { x: 24; y: 37.2999992; skew-x: 354.200012; skew-y: 354.200012; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 26.8999996; y: 35.4000015; skew-x: 357.200012; skew-y: 357.200012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 97 { x: 28.1000004; y: 33.5999985; skew-x: 359.399994; skew-y: 359.399994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 98 { x: 29.1000004; y: 32.0999985; skew-x: 361.299988; skew-y: 361.299988; scale-x: -10000; scale-y: -10000; }
        frame 99 { x: 30.2999992; y: 30.6000004; skew-x: 363.299988; skew-y: 363.299988; }
        frame 100 { x: 31.5; y: 29; skew-x: 365.299988; skew-y: 365.299988; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 101 { x: 30.1000004; y: 27.7000008; skew-x: 366.100006; skew-y: 366.100006; scale-x: -10000; scale-y: -10000; }
        frame 102 { x: 29; y: 26.3999996; skew-x: 367; skew-y: 367; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 103 { x: 27.6000004; y: 25; skew-x: 367.799988; skew-y: 367.799988; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 26.2999992; y: 23.5; skew-x: 368.799988; skew-y: 368.799988; }
        frame 105 { x: 20.7000008; y: 24.1000004; skew-x: 368.299988; skew-y: 368.299988; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 106 { x: 15.3000002; y: 24.5; skew-x: 368; skew-y: 368; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 107 { x: 9.69999981; y: 25; skew-x: 367.5; skew-y: 367.5; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 108 { x: 4.19999981; y: 25.5; skew-x: 367.200012; skew-y: 367.299988; scale-x: 0.842000008; scale-y: -10000; }
        frame 109 { x: -2.79999995; y: 29.5; skew-x: 362.100006; skew-y: 362.299988; scale-x: -10000; scale-y: 0.842000008; }
        frame 110 { x: -9.69999981; y: 33.5; skew-x: 357.200012; skew-y: 357.399994; scale-x: 0.841000021; scale-y: -10000; }
        frame 111 { x: -16.3999996; y: 37.7999992; skew-x: 352.200012; skew-y: 352.399994; scale-x: 0.839999974; scale-y: 0.841000021; }
        frame 112 { x: -23.1000004; y: 42.0999985; skew-x: 347.200012; skew-y: 347.299988; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: -30.8999996; y: 50.5; skew-x: 340.700012; skew-y: 340.700012; scale-x: 0.838999987; scale-y: 0.839999974; }
        frame 114 { x: -38.2999992; y: 59.2000008; skew-x: 333.899994; skew-y: 334.200012; scale-x: 0.838; scale-y: 0.838999987; }
        frame 115 { x: -45; y: 68.0999985; skew-x: 327.399994; skew-y: 327.600006; scale-x: 0.837000012; scale-y: 0.838; }
        frame 116 { x: -51.5; y: 77; skew-x: 320.700012; skew-y: 320.899994; scale-x: -10000; scale-y: 0.838999987; }
        frame 117 { x: -57.5999985; y: 104.300003; skew-x: 298.600006; skew-y: 298.799988; scale-x: 0.836000025; scale-y: 0.837000012; }
        frame 118 { x: -58.2000008; y: 130.100006; skew-x: 276.700012; skew-y: 276.899994; scale-x: -10000; scale-y: 0.838; }
        frame 119 { x: -58; y: 130.300003; skew-x: 278; skew-y: 276.799988; scale-x: 0.811999977; scale-y: 0.833999991; }
        frame 120 { x: -57.7000008; y: 130.5; skew-x: 279.299988; skew-y: -10000; scale-x: 0.787; scale-y: 0.83099997; }
        frame 121 { x: -57.5999985; y: 130.699997; skew-x: 280.600006; skew-y: 277; scale-x: 0.763999999; scale-y: 0.828999996; }
        frame 122 { x: -58.2999992; y: 129.399994; skew-x: 282.5; skew-y: 278.299988; scale-x: 0.773999989; scale-y: 0.83099997; }
        frame 123 { x: -59.0999985; y: 128.300003; skew-x: 284.5; skew-y: 279.799988; scale-x: 0.783999979; scale-y: 0.833000004; }
        frame 124 { x: -59.9000015; y: 126.900002; skew-x: 286.5; skew-y: 281.299988; scale-x: 0.79400003; scale-y: 0.834999979; }
        frame 125 { x: -60.5999985; y: 125.5; skew-x: 288.299988; skew-y: 283; scale-x: 0.805000007; scale-y: 0.838; }
        frame 126 { x: -61.4000015; y: 124.099998; skew-x: 290.299988; skew-y: 284.5; scale-x: 0.814999998; scale-y: 0.839999974; }
        frame 127 { x: -62.2000008; y: 122.599998; skew-x: 292.299988; skew-y: 286; scale-x: 0.825999975; scale-y: 0.842000008; }
        frame 128 { x: -62.9000015; y: 121.199997; skew-x: 294.299988; skew-y: 287.5; scale-x: 0.836000025; scale-y: 0.845000029; }
        frame 129 { x: -63.5999985; y: 119.800003; skew-x: 296.299988; skew-y: 289.100006; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 130 { x: -61.0999985; y: 125.300003; skew-x: 286.5; skew-y: 282.799988; scale-x: 0.841000021; scale-y: 0.842000008; }
        frame 131 { x: -58.2000008; y: 130.100006; skew-x: 276.700012; skew-y: 276.899994; scale-x: 0.836000025; scale-y: 0.838; }
        frame 132 { x: 26.8999996; y: 35.4000015; skew-x: 357.200012; skew-y: 357.200012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 133 { x: 27.8999996; y: 34.7999992; skew-x: 358.200012; skew-y: 358.200012; scale-x: -10000; scale-y: -10000; }
        frame 134 { x: 28.7999992; y: 34.2999992; skew-x: 359.200012; skew-y: 359.200012; }
        frame 135 { x: 29.6000004; y: 33.7000008; skew-x: 360; skew-y: 360; }
        frame 136 { x: 30.5; y: 33.2999992; skew-x: 360.799988; skew-y: 360.799988; }
        frame 137 { x: 31.7000008; y: 31.7000008; skew-x: 362.5; skew-y: 362.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 138 { x: 32.9000015; y: 30; skew-x: 364.5; skew-y: 364.5; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 34; y: 28.5; skew-x: 366.299988; skew-y: 366.299988; }
        frame 140 { x: 35.4000015; y: 27; skew-x: 368.399994; skew-y: 368.399994; }
        frame 141 { x: 36; y: 26.7000008; skew-x: 369.600006; skew-y: 369.600006; }
        frame 142 { x: 37; y: 26.1000004; skew-x: 371; skew-y: 371; }
        frame 143 { x: 37.9000015; y: 25.7999992; skew-x: 372.299988; skew-y: 372.299988; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 144 { x: 38.7999992; y: 25.3999996; skew-x: 373.799988; skew-y: 373.799988; scale-x: -10000; scale-y: -10000; }
        frame 145 { x: 39.5999985; y: 25; skew-x: 375.200012; skew-y: 375.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 146 { x: 37.4000015; y: 26.3999996; skew-x: 372.600006; skew-y: 372.600006; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 147 { x: 35.2999992; y: 27.7999992; skew-x: 370; skew-y: 370; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 33.0999985; y: 29.2999992; skew-x: 367.5; skew-y: 367.5; }
        frame 149 { x: 31.1000004; y: 30.7999992; skew-x: 365; skew-y: 365; }
        frame 150 { x: 29.1000004; y: 32.4000015; skew-x: 362.700012; skew-y: 362.700012; }
        frame 151 { x: 27.2999992; y: 34.4000015; skew-x: 360.5; skew-y: 360.5; scale-y: 0.850000024; }
        frame 152 { x: 25.7000008; y: 36.4000015; skew-x: 358.5; skew-y: 358.5; scale-x: 0.847000003; scale-y: 0.851999998; }
        frame 153 { x: 24; y: 38.4000015; skew-x: 356.200012; skew-y: 356.200012; scale-x: -10000; scale-y: 0.855000019; }
        frame 154 { x: 22.2000008; y: 40.5; skew-x: 354; skew-y: 354; scale-y: 0.856999993; }
        frame 155 { x: 23.2999992; y: 39.2999992; skew-x: 354.700012; skew-y: 354.700012; scale-y: 0.855000019; }
        frame 156 { x: 24.3999996; y: 38.2999992; skew-x: 355.200012; skew-y: 355.200012; scale-y: 0.852999985; }
        frame 157 { x: 25.5; y: 37.2000008; skew-x: 355.700012; skew-y: 355.700012; scale-y: 0.851000011; }
        frame 158 { x: 26.6000004; y: 36.0999985; skew-x: 356.399994; skew-y: 356.399994; scale-x: 0.84799999; scale-y: 0.850000024; }
        frame 159 { x: 27.7000008; y: 35.2999992; skew-x: 356.899994; skew-y: 356.899994; scale-x: -10000; scale-y: 0.84799999; }
        frame 160 { x: 29.8999996; y: 33; skew-x: 360.5; skew-y: 360.5; scale-y: -10000; }
        frame 161 { x: 32.0999985; y: 30.8999996; skew-x: 364; skew-y: 364; }
        frame 162 { x: 34.5; y: 28.7999992; skew-x: 367.799988; skew-y: 367.799988; }
        frame 163 { x: 37.0999985; y: 26.8999996; skew-x: 371.5; skew-y: 371.5; }
        frame 164 { x: 39.5999985; y: 25; skew-x: 375.200012; skew-y: 375.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 165 { x: 38.7999992; y: 25.3999996; skew-x: 373.799988; skew-y: 373.799988; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 166 { x: 37.9000015; y: 25.7999992; skew-x: 372.299988; skew-y: 372.299988; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 37; y: 26.2000008; skew-x: 371; skew-y: 371; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 168 { x: 36.0999985; y: 26.6000004; skew-x: 369.600006; skew-y: 369.600006; scale-x: -10000; scale-y: -10000; }
        frame 169 { x: 35.4000015; y: 27; skew-x: 368.399994; skew-y: 368.399994; }
        frame 170 { x: 32.5999985; y: 29.7999992; skew-x: 364.799988; skew-y: 364.799988; }
        frame 171 { x: 30.2000008; y: 32.5; skew-x: 361.5; skew-y: 361.5; }
        frame 172 { x: 27.7999992; y: 35.4000015; skew-x: 358.200012; skew-y: 358.200012; }
        frame 173 { x: 25.3999996; y: 38.4000015; skew-x: 354.799988; skew-y: 354.799988; }
        frame 174 { x: 25.7999992; y: 37.5999985; skew-x: 355.399994; skew-y: 355.399994; }
        frame 175 { x: 26; y: 37.0999985; skew-x: 355.700012; skew-y: 355.700012; }
        frame 176 { x: 26.3999996; y: 36.5999985; skew-x: 356.200012; skew-y: 356.200012; }
        frame 177 { x: 26.7000008; y: 36; skew-x: 356.700012; skew-y: 356.700012; }
        frame 178 { x: 26.8999996; y: 35.4000015; skew-x: 357.200012; skew-y: 357.200012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 28.7000008; y: 33.2999992; skew-x: 359.5; skew-y: 359.5; }
        frame 181 { x: 30.3999996; y: 31.5; skew-x: 361.299988; skew-y: 361.299988; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 182 { x: 32.2000008; y: 29.5; skew-x: 363.299988; skew-y: 363.299988; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 34.0999985; y: 27.5; skew-x: 365.5; skew-y: 365.5; }
        frame 184 { x: 35.4000015; y: 26.2999992; skew-x: 366.799988; skew-y: 366.799988; }
        frame 185 { x: 37; y: 24.8999996; skew-x: 368.299988; skew-y: 368.299988; }
        frame 186 { x: 38.5; y: 23.5; skew-x: 369.799988; skew-y: 369.799988; }
        frame 187 { x: 40; y: 22.2000008; skew-x: 371.299988; skew-y: 371.299988; }
        frame 188 { x: 29.7000008; y: 28.2999992; skew-x: 362.100006; skew-y: 362.100006; }
        frame 189 { x: 20.3999996; y: 34.9000015; skew-x: 353.200012; skew-y: 353.200012; }
        frame 190 { x: 11.6000004; y: 42.4000015; skew-x: 344.100006; skew-y: 344.100006; }
        frame 191 { x: 11.3000002; y: 44.9000015; skew-x: 342.399994; skew-y: 342.399994; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 192 { x: 10.8000002; y: 47.5; skew-x: 340.700012; skew-y: 340.700012; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 10.5; y: 50.0999985; skew-x: 338.899994; skew-y: 338.899994; }
        frame 194 { x: 10; y: 52.7999992; skew-x: 337; skew-y: 337; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 195 { x: 11.6999998; y: 50.4000015; skew-x: 339.200012; skew-y: 339.200012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 196 { x: 13.1999998; y: 48; skew-x: 341.200012; skew-y: 341.200012; scale-x: -10000; scale-y: -10000; }
        frame 197 { x: 14.6999998; y: 45.5999985; skew-x: 343.200012; skew-y: 343.200012; }
        frame 198 { x: 16.2999992; y: 43.2999992; skew-x: 345.200012; skew-y: 345.200012; }
        frame 199 { x: 18.7999992; y: 41.0999985; skew-x: 348.200012; skew-y: 348.200012; }
        frame 200 { x: 21.3999996; y: 39.0999985; skew-x: 351.200012; skew-y: 351.200012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 201 { x: 24; y: 37.2999992; skew-x: 354.200012; skew-y: 354.200012; scale-x: -10000; scale-y: -10000; }
        frame 202 { x: 26.8999996; y: 35.4000015; skew-x: 357.200012; skew-y: 357.200012; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 204 { x: 29.6000004; y: 32.5999985; skew-x: 360; skew-y: 360; }
        frame 205 { x: 32.0999985; y: 30.2000008; skew-x: 362.299988; skew-y: 362.299988; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 206 { x: 34.9000015; y: 27.6000004; skew-x: 364.799988; skew-y: 364.799988; scale-x: -10000; scale-y: -10000; }
        frame 207 { x: 37.5999985; y: 25.1000004; skew-x: 367.5; skew-y: 367.5; }
        frame 208 { x: 40.4000015; y: 22.7000008; skew-x: 370; skew-y: 370; }
        frame 209 { x: 43.2000008; y: 20.2999992; skew-x: 372.700012; skew-y: 372.700012; }
        frame 210 { x: 37.7000008; y: 24; skew-x: 367.299988; skew-y: 367.299988; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 211 { x: 32.5; y: 27.8999996; skew-x: 362; skew-y: 362; scale-x: -10000; scale-y: -10000; }
        frame 212 { x: 27.6000004; y: 32; skew-x: 356.700012; skew-y: 356.700012; }
        frame 213 { x: 22.7000008; y: 36.4000015; skew-x: 351.299988; skew-y: 351.299988; }
        frame 214 { x: 18.7000008; y: 41.2999992; skew-x: 346.200012; skew-y: 346; scale-x: 0.847000003; }
    }
    Track {
        source-name: "anim_head2";
        frame-count: 215;
        frame 0 { x: 14.3000002; y: 44.5999985; skew-x: 351.899994; skew-y: 351.899994; scale-x: 0.848999977; scale-y: 0.848999977; image: IMAGE_REANIM_ZOMBIE_LADDER_JAW; }
        frame 1 { x: 14.6999998; y: 43.5; skew-x: 353.399994; skew-y: 353.399994; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 15.1000004; y: 42.5; skew-x: 354.700012; skew-y: 354.700012; }
        frame 3 { x: 15.5; y: 41.5; skew-x: 356; skew-y: 356; }
        frame 4 { x: 16; y: 40.4000015; skew-x: 357.5; skew-y: 357.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 5 { x: 16.3999996; y: 39.4000015; skew-x: 358.700012; skew-y: 358.700012; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 16.8999996; y: 38.5; skew-x: 360; skew-y: 360; }
        frame 7 { x: 16.7999992; y: 38.4000015; skew-x: 360.5; skew-y: 360.5; }
        frame 8 { x: 16.6000004; y: -10000; skew-x: 361; skew-y: 361; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 9 { x: 15.8999996; y: 39.7999992; skew-x: 358.700012; skew-y: 358.700012; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 15.3999996; y: 41.2999992; skew-x: 356.5; skew-y: 356.5; }
        frame 11 { x: 14.8000002; y: 42.7000008; skew-x: 354.200012; skew-y: 354.200012; }
        frame 12 { x: 14.3000002; y: 44.0999985; skew-x: 351.899994; skew-y: 351.899994; }
        frame 13 { x: 14; y: 45; skew-x: 350.899994; skew-y: 350.899994; scale-y: 0.862999976; }
        frame 14 { x: 13.6999998; y: 45.9000015; skew-x: 349.700012; skew-y: 349.700012; scale-y: 0.878000021; }
        frame 15 { x: 13.3999996; y: 46.5999985; skew-x: 348.700012; skew-y: 348.700012; scale-y: 0.89200002; }
        frame 16 { x: 13; y: 47.5; skew-x: 347.5; skew-y: 347.5; scale-y: 0.907000005; }
        frame 17 { x: 12.8000002; y: 48.2999992; skew-x: 346.399994; skew-y: 346.399994; scale-y: 0.921000004; }
        frame 18 { x: 12.5; y: 49.0999985; skew-x: 345.200012; skew-y: 345.200012; scale-y: 0.936999977; }
        frame 19 { x: 12.6999998; y: 49; skew-x: 344.700012; skew-y: 344.700012; scale-x: 0.84799999; scale-y: 0.931999981; }
        frame 20 { x: -10000; y: 48.9000015; skew-x: 344; skew-y: 344; scale-x: -10000; scale-y: 0.930000007; }
        frame 21 { x: 13; y: 47.7999992; skew-x: 346; skew-y: 346; scale-y: 0.908999979; }
        frame 22 { x: 13.5; y: 46.7999992; skew-x: 348; skew-y: 348; scale-y: 0.888999999; }
        frame 23 { x: 13.8999996; y: 45.5999985; skew-x: 350; skew-y: 350; scale-x: 0.848999977; scale-y: 0.869000018; }
        frame 24 { x: 14.3000002; y: 44.5999985; skew-x: 351.899994; skew-y: 351.899994; scale-x: -10000; scale-y: 0.848999977; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 26 { x: 15.1999998; y: 42.9000015; skew-x: 354.5; skew-y: 354.5; }
        frame 27 { x: 16.2000008; y: 41.0999985; skew-x: 356.700012; skew-y: 356.700012; }
        frame 28 { x: 17.2000008; y: 39.5; skew-x: 359.200012; skew-y: 359.200012; }
        frame 29 { x: 18.2000008; y: 37.9000015; skew-x: 361.5; skew-y: 361.5; }
        frame 30 { x: 19.2000008; y: 35.9000015; skew-x: 363.299988; skew-y: 363.299988; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 31 { x: 20.2999992; y: 33.9000015; skew-x: 365.299988; skew-y: 365.299988; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 21.3999996; y: 32; skew-x: 367.100006; skew-y: 367.100006; }
        frame 33 { x: 22.6000004; y: 30; skew-x: 369.100006; skew-y: 369.100006; }
        frame 34 { x: 23.5; y: 29.1000004; skew-x: 370.5; skew-y: 370.5; }
        frame 35 { x: 24.3999996; y: 28; skew-x: 372; skew-y: 372; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 36 { x: 25.2000008; y: 27; skew-x: 373.5; skew-y: 373.5; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 26.1000004; y: 26.1000004; skew-x: 375; skew-y: 375; }
        frame 38 { x: 26.7999992; y: 25.1000004; skew-x: 376.600006; skew-y: 376.600006; }
        frame 39 { x: 25.6000004; y: 26.2999992; skew-x: 376.299988; skew-y: 376.299988; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 40 { x: 24.2999992; y: 27.1000004; skew-x: 376.200012; skew-y: 376.200012; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 20.8999996; y: 32.5; skew-x: 366; skew-y: 366; }
        frame 42 { x: 18.1000004; y: 38.4000015; skew-x: 356.200012; skew-y: 356.200012; }
        frame 43 { x: 15.6999998; y: 44.5; skew-x: 346.100006; skew-y: 346.100006; }
        frame 44 { x: 14.6000004; y: 47; skew-x: 343.200012; skew-y: 343.200012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 45 { x: 13.6000004; y: 49.5; skew-x: 340.200012; skew-y: 340.200012; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 46 { x: 12.6000004; y: 52; skew-x: 337; skew-y: 337; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 47 { x: 11.6000004; y: 54.5999985; skew-x: 334; skew-y: 334; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 48 { x: 12.3999996; y: 53.5; skew-x: 334.200012; skew-y: 334.200012; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 49 { x: 13.1000004; y: 52.4000015; skew-x: -10000; skew-y: -10000; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 50 { x: 13.8999996; y: 49.7000008; skew-x: 338.200012; skew-y: 338.200012; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 51 { x: 14.6999998; y: 47; skew-x: 342.200012; skew-y: 342.200012; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 52 { x: 15.6999998; y: 44.5; skew-x: 346.100006; skew-y: 346.100006; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 53 { x: 17.6000004; y: 40.4000015; skew-x: 352.200012; skew-y: 352.200012; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 19.6000004; y: 36.4000015; skew-x: 358.5; skew-y: 358.5; }
        frame 55 { x: 21.7000008; y: 32.5999985; skew-x: 364.299988; skew-y: 364.299988; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 56 { x: 24.2000008; y: 28.7999992; skew-x: 370.5; skew-y: 370.5; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 26.7999992; y: 25.1000004; skew-x: 376.600006; skew-y: 376.600006; }
        frame 58 { x: 26.2000008; y: 25.2000008; skew-x: 376.299988; skew-y: 376.299988; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 59 { x: 25.6000004; y: 24.8999996; skew-x: 376.200012; skew-y: 376.200012; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 24.5; y: 26.7000008; skew-x: 373.799988; skew-y: 373.799988; }
        frame 61 { x: 23.5; y: 28.2999992; skew-x: 371.299988; skew-y: 371.299988; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 62 { x: 22.6000004; y: 30; skew-x: 369.100006; skew-y: 369.100006; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 63 { x: 20.1000004; y: 34.5999985; skew-x: 362.5; skew-y: 362.5; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 17.7000008; y: 39.4000015; skew-x: 356.399994; skew-y: 356.399994; }
        frame 65 { x: 15.5; y: 44.0999985; skew-x: 350; skew-y: 350; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 66 { x: 13.3999996; y: 49.2000008; skew-x: 343.5; skew-y: 343.5; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: 13.5; y: 50.4000015; skew-x: 338.899994; skew-y: 338.899994; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 68 { x: 13.6000004; y: 51.5; skew-x: 334.200012; skew-y: 334.200012; scale-x: -10000; scale-y: -10000; }
        frame 69 { x: 13.6999998; y: 49.2000008; skew-x: 340.200012; skew-y: 340.200012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 70 { x: 13.8000002; y: 47; skew-x: 346.200012; skew-y: 346.200012; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 71 { x: 14.3000002; y: 44.5999985; skew-x: 351.899994; skew-y: 351.899994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 16.2000008; y: 40.4000015; skew-x: 356.200012; skew-y: 356; scale-x: 0.843999982; scale-y: 0.88499999; }
        frame 74 { x: 18.5; y: 36.2999992; skew-x: 360.100006; skew-y: 359.700012; scale-x: 0.838999987; scale-y: 0.921999991; }
        frame 75 { x: 20.6000004; y: 32.0999985; skew-x: 364.299988; skew-y: 363.5; scale-x: 0.833999991; scale-y: 0.958000004; }
        frame 76 { x: 23; y: 28.2999992; skew-x: 368.5; skew-y: 367.5; scale-x: 0.828999996; scale-y: 0.995000005; }
        frame 77 { x: 25.1000004; y: 26.1000004; skew-x: 371.299988; skew-y: 370; scale-x: 0.823000014; scale-y: 1.00199997; }
        frame 78 { x: 27.2999992; y: 24; skew-x: 374.100006; skew-y: 372.799988; scale-x: 0.818000019; scale-y: 1.00899994; }
        frame 79 { x: 29.3999996; y: 21.8999996; skew-x: 377; skew-y: 375.299988; scale-x: 0.811999977; scale-y: 1.01600003; }
        frame 80 { x: 31.7000008; y: 20; skew-x: 380; skew-y: 378.100006; scale-x: 0.806999981; scale-y: 1.02400005; }
        frame 81 { x: 19.5; y: 27.3999996; skew-x: 369.299988; skew-y: 371; scale-x: 0.828999996; scale-y: 1.00300002; }
        frame 82 { x: 10.6000004; y: 38.5999985; skew-x: 354.5; skew-y: 358; scale-x: 0.839999974; scale-y: 0.992999971; }
        frame 83 { x: 2.79999995; y: 50.2999992; skew-x: 339.399994; skew-y: 344.899994; scale-x: 0.851000011; scale-y: 0.98299998; }
        frame 84 { x: 1.60000002; y: 51.9000015; skew-x: 341.899994; skew-y: 346; scale-x: 0.901000023; scale-y: 0.92900002; }
        frame 85 { x: 0.200000003; y: 53.4000015; skew-x: 344.200012; skew-y: 347; scale-x: 0.952000022; scale-y: 0.875; }
        frame 86 { x: -1.10000002; y: 54.7999992; skew-x: 346.700012; skew-y: 348; scale-x: 1.00300002; scale-y: 0.822000027; }
        frame 87 { x: -2.29999995; y: 56.0999985; skew-x: 349; skew-y: 349; scale-x: 1.05499995; scale-y: 0.768999994; }
        frame 88 { x: 0.600000024; y: 58.2000008; skew-x: 341; skew-y: 341; scale-x: 0.950999975; scale-y: 0.808000028; }
        frame 89 { x: 3.70000005; y: 60; skew-x: 332.899994; skew-y: 332.899994; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 90 { x: 5.0999999; y: 55.0999985; skew-x: 339.399994; skew-y: 339.399994; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 91 { x: 6.5999999; y: 50.5; skew-x: 345.700012; skew-y: 345.700012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 92 { x: 8.60000038; y: 49; skew-x: 347.399994; skew-y: 347.399994; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 93 { x: 10.5; y: 47.5; skew-x: 349; skew-y: 349; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 12.5; y: 46; skew-x: 350.5; skew-y: 350.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 95 { x: 14.3000002; y: 44.5999985; skew-x: 351.899994; skew-y: 351.899994; scale-x: -10000; scale-y: -10000; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
        frame 132 { cel: 0; }
        frame 133 { x: 15.1999998; y: 42.9000015; skew-x: 354.5; skew-y: 354.5; cel: -10000; }
        frame 134 { x: 16.2000008; y: 41.0999985; skew-x: 356.700012; skew-y: 356.700012; }
        frame 135 { x: 17.2000008; y: 39.5; skew-x: 359.200012; skew-y: 359.200012; }
        frame 136 { x: 18.2000008; y: 37.9000015; skew-x: 361.5; skew-y: 361.5; }
        frame 137 { x: 19.2000008; y: 35.9000015; skew-x: 363.299988; skew-y: 363.299988; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 138 { x: 20.2999992; y: 33.9000015; skew-x: 365.299988; skew-y: 365.299988; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 21.3999996; y: 32; skew-x: 367.100006; skew-y: 367.100006; }
        frame 140 { x: 22.6000004; y: 30; skew-x: 369.100006; skew-y: 369.100006; }
        frame 141 { x: 23.5; y: 29.1000004; skew-x: 370.5; skew-y: 370.5; }
        frame 142 { x: 24.3999996; y: 28; skew-x: 372; skew-y: 372; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 143 { x: 25.2000008; y: 27; skew-x: 373.5; skew-y: 373.5; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 26.1000004; y: 26.1000004; skew-x: 375; skew-y: 375; }
        frame 145 { x: 26.7999992; y: 25.1000004; skew-x: 376.600006; skew-y: 376.600006; }
        frame 146 { x: 25.6000004; y: 26.2999992; skew-x: 376.299988; skew-y: 376.299988; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 147 { x: 24.2999992; y: 27.1000004; skew-x: 376.200012; skew-y: 376.200012; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 20.8999996; y: 32.5; skew-x: 366; skew-y: 366; }
        frame 149 { x: 18.1000004; y: 38.4000015; skew-x: 356.200012; skew-y: 356.200012; }
        frame 150 { x: 15.6999998; y: 44.5; skew-x: 346.100006; skew-y: 346.100006; }
        frame 151 { x: 14.6000004; y: 47; skew-x: 343.200012; skew-y: 343.200012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 152 { x: 13.6000004; y: 49.5; skew-x: 340.200012; skew-y: 340.200012; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 153 { x: 12.6000004; y: 52; skew-x: 337; skew-y: 337; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 154 { x: 11.6000004; y: 54.5999985; skew-x: 334; skew-y: 334; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 155 { x: 12.3999996; y: 53.5; skew-x: 334.200012; skew-y: 334.200012; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 156 { x: 13.1000004; y: 52.4000015; skew-x: -10000; skew-y: -10000; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 157 { x: 13.8999996; y: 49.7000008; skew-x: 338.200012; skew-y: 338.200012; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 158 { x: 14.6999998; y: 47; skew-x: 342.200012; skew-y: 342.200012; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 159 { x: 15.6999998; y: 44.5; skew-x: 346.100006; skew-y: 346.100006; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 160 { x: 17.6000004; y: 40.4000015; skew-x: 352.200012; skew-y: 352.200012; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 19.6000004; y: 36.4000015; skew-x: 358.5; skew-y: 358.5; }
        frame 162 { x: 21.7000008; y: 32.5999985; skew-x: 364.299988; skew-y: 364.299988; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 163 { x: 24.2000008; y: 28.7999992; skew-x: 370.5; skew-y: 370.5; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 26.7999992; y: 25.1000004; skew-x: 376.600006; skew-y: 376.600006; }
        frame 165 { x: 26.2000008; y: 25.2000008; skew-x: 376.299988; skew-y: 376.299988; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 166 { x: 25.6000004; y: 24.8999996; skew-x: 376.200012; skew-y: 376.200012; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 24.5; y: 26.7000008; skew-x: 373.799988; skew-y: 373.799988; }
        frame 168 { x: 23.5; y: 28.2999992; skew-x: 371.299988; skew-y: 371.299988; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 169 { x: 22.6000004; y: 30; skew-x: 369.100006; skew-y: 369.100006; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 170 { x: 20.1000004; y: 34.5999985; skew-x: 362.5; skew-y: 362.5; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 17.7000008; y: 39.4000015; skew-x: 356.399994; skew-y: 356.399994; }
        frame 172 { x: 15.5; y: 44.0999985; skew-x: 350; skew-y: 350; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 173 { x: 13.3999996; y: 49.2000008; skew-x: 343.5; skew-y: 343.5; scale-x: -10000; scale-y: -10000; }
        frame 174 { x: 13.5; y: 50.4000015; skew-x: 338.899994; skew-y: 338.899994; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 175 { x: 13.6000004; y: 51.5; skew-x: 334.200012; skew-y: 334.200012; scale-x: -10000; scale-y: -10000; }
        frame 176 { x: 13.6999998; y: 49.2000008; skew-x: 340.200012; skew-y: 340.200012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 177 { x: 13.8000002; y: 47; skew-x: 346.200012; skew-y: 346.200012; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 178 { x: 14.3000002; y: 44.5999985; skew-x: 351.899994; skew-y: 351.899994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 16.2000008; y: 40.4000015; skew-x: 356.200012; skew-y: 356; scale-x: 0.843999982; scale-y: 0.88499999; }
        frame 181 { x: 18.5; y: 36.2999992; skew-x: 360.100006; skew-y: 359.700012; scale-x: 0.838999987; scale-y: 0.921999991; }
        frame 182 { x: 20.6000004; y: 32.0999985; skew-x: 364.299988; skew-y: 363.5; scale-x: 0.833999991; scale-y: 0.958000004; }
        frame 183 { x: 23; y: 28.2999992; skew-x: 368.5; skew-y: 367.5; scale-x: 0.828999996; scale-y: 0.995000005; }
        frame 184 { x: 25.1000004; y: 26.1000004; skew-x: 371.299988; skew-y: 370; scale-x: 0.823000014; scale-y: 1.00199997; }
        frame 185 { x: 27.2999992; y: 24; skew-x: 374.100006; skew-y: 372.799988; scale-x: 0.818000019; scale-y: 1.00899994; }
        frame 186 { x: 29.3999996; y: 21.8999996; skew-x: 377; skew-y: 375.299988; scale-x: 0.811999977; scale-y: 1.01600003; }
        frame 187 { x: 31.7000008; y: 20; skew-x: 380; skew-y: 378.100006; scale-x: 0.806999981; scale-y: 1.02400005; }
        frame 188 { x: 19.5; y: 27.3999996; skew-x: 369.299988; skew-y: 371; scale-x: 0.828999996; scale-y: 1.00300002; }
        frame 189 { x: 10.6000004; y: 38.5999985; skew-x: 354.5; skew-y: 358; scale-x: 0.839999974; scale-y: 0.992999971; }
        frame 190 { x: 2.79999995; y: 50.2999992; skew-x: 339.399994; skew-y: 344.899994; scale-x: 0.851000011; scale-y: 0.98299998; }
        frame 191 { x: 1.60000002; y: 51.9000015; skew-x: 341.899994; skew-y: 346; scale-x: 0.901000023; scale-y: 0.92900002; }
        frame 192 { x: 0.200000003; y: 53.4000015; skew-x: 344.200012; skew-y: 347; scale-x: 0.952000022; scale-y: 0.875; }
        frame 193 { x: -1.10000002; y: 54.7999992; skew-x: 346.700012; skew-y: 348; scale-x: 1.00300002; scale-y: 0.822000027; }
        frame 194 { x: -2.29999995; y: 56.0999985; skew-x: 349; skew-y: 349; scale-x: 1.05499995; scale-y: 0.768999994; }
        frame 195 { x: 0.600000024; y: 58.2000008; skew-x: 341; skew-y: 341; scale-x: 0.950999975; scale-y: 0.808000028; }
        frame 196 { x: 3.70000005; y: 60; skew-x: 332.899994; skew-y: 332.899994; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 197 { x: 5.0999999; y: 55.0999985; skew-x: 339.399994; skew-y: 339.399994; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 198 { x: 6.5999999; y: 50.5; skew-x: 345.700012; skew-y: 345.700012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 199 { x: 8.60000038; y: 49; skew-x: 347.399994; skew-y: 347.399994; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 200 { x: 10.5; y: 47.5; skew-x: 349; skew-y: 349; scale-x: -10000; scale-y: -10000; }
        frame 201 { x: 12.5; y: 46; skew-x: 350.5; skew-y: 350.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 202 { x: 14.3000002; y: 44.5999985; skew-x: 351.899994; skew-y: 351.899994; scale-x: -10000; scale-y: -10000; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 204 { x: 17; y: 40.7999992; skew-x: 356.700012; skew-y: 356.700012; scale-y: 0.870000005; }
        frame 205 { x: 19.7999992; y: 37; skew-x: 361; skew-y: 361; scale-y: 0.889999986; }
        frame 206 { x: 22.7999992; y: 33.5; skew-x: 365.799988; skew-y: 365.799988; scale-x: 0.84799999; scale-y: 0.911000013; }
        frame 207 { x: 26; y: 30; skew-x: 370.299988; skew-y: 370.299988; scale-x: -10000; scale-y: 0.930999994; }
        frame 208 { x: 29.2999992; y: 26.5; skew-x: 375; skew-y: 375; scale-x: 0.847000003; scale-y: 0.950999975; }
        frame 209 { x: 32.5999985; y: 23; skew-x: 379.700012; skew-y: 379.700012; scale-x: 0.84799999; scale-y: 0.97299999; }
        frame 210 { x: 27.7999992; y: 27.2000008; skew-x: 374.299988; skew-y: 374.299988; scale-x: 0.847000003; scale-y: 0.972000003; }
        frame 211 { x: 23; y: 31.3999996; skew-x: 369; skew-y: 369; scale-x: -10000; scale-y: -10000; }
        frame 212 { x: 18.2999992; y: 35.7999992; skew-x: 363.5; skew-y: 363.5; }
        frame 213 { x: 13.8000002; y: 40.2000008; skew-x: 358.299988; skew-y: 358.299988; }
        frame 214 { x: 10.1999998; y: 45.7999992; skew-x: 353.200012; skew-y: 353; }
    }
    Track {
        source-name: "anim_head1";
        frame-count: 215;
        frame 0 { x: 0.100000001; y: 10.6000004; skew-x: 351.899994; skew-y: 351.899994; scale-x: 0.848999977; scale-y: 0.848999977; image: IMAGE_REANIM_ZOMBIE_LADDER_HEAD; }
        frame 1 { x: 1.29999995; y: 9.39999962; skew-x: 353.399994; skew-y: 353.399994; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: 2.4000001; y: 8.19999981; skew-x: 354.700012; skew-y: 354.700012; }
        frame 3 { x: 3.5; y: 7; skew-x: 356; skew-y: 356; }
        frame 4 { x: 4.80000019; y: 5.80000019; skew-x: 357.5; skew-y: 357.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 5 { x: 5.9000001; y: 4.5999999; skew-x: 358.700012; skew-y: 358.700012; scale-x: -10000; scale-y: -10000; }
        frame 6 { x: 7.0999999; y: 3.4000001; skew-x: 360; skew-y: 360; }
        frame 7 { x: -10000; y: 3.29999995; skew-x: 360.5; skew-y: 360.5; }
        frame 8 { x: 7; y: 3.0999999; skew-x: 361; skew-y: 361; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 9 { x: 5.19999981; y: 4.80000019; skew-x: 358.700012; skew-y: 358.700012; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 3.5; y: 6.69999981; skew-x: 356.5; skew-y: 356.5; }
        frame 11 { x: 1.79999995; y: 8.69999981; skew-x: 354.200012; skew-y: 354.200012; }
        frame 12 { x: 0.100000001; y: 10.6000004; skew-x: 351.899994; skew-y: 351.899994; }
        frame 13 { x: -0.699999988; y: 11.6999998; skew-x: 350.899994; skew-y: 350.899994; }
        frame 14 { x: -1.60000002; y: 12.6999998; skew-x: 349.700012; skew-y: 349.700012; }
        frame 15 { x: -2.4000001; y: 13.6999998; skew-x: 348.700012; skew-y: 348.700012; }
        frame 16 { x: -3.4000001; y: 14.8999996; skew-x: 347.5; skew-y: 347.5; }
        frame 17 { x: -4.30000019; y: 15.8999996; skew-x: 346.399994; skew-y: 346.399994; }
        frame 18 { x: -5.19999981; y: 16.8999996; skew-x: 345.200012; skew-y: 345.200012; }
        frame 19 { x: -10000; y: -10000; skew-x: 344.700012; skew-y: 344.700012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 20 { x: -5.30000019; y: 17; skew-x: 344; skew-y: 344; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -4; y: 15.3999996; skew-x: 346; skew-y: 346; }
        frame 22 { x: -2.70000005; y: 13.8000002; skew-x: 348; skew-y: 348; }
        frame 23 { x: -1.29999995; y: 12.1999998; skew-x: 350; skew-y: 350; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 24 { x: 0.100000001; y: 10.6000004; skew-x: 351.899994; skew-y: 351.899994; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: 2.5; y: 8.60000038; skew-x: 354.5; skew-y: 354.5; }
        frame 27 { x: 4.9000001; y: 6.5; skew-x: 356.700012; skew-y: 356.700012; }
        frame 28 { x: 7.30000019; y: 4.4000001; skew-x: 359.200012; skew-y: 359.200012; }
        frame 29 { x: 9.80000019; y: 2.4000001; skew-x: 361.5; skew-y: 361.5; }
        frame 30 { x: 12; y: 0.200000003; skew-x: 363.299988; skew-y: 363.299988; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 31 { x: 14.3999996; y: -1.79999995; skew-x: 365.299988; skew-y: 365.299988; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 16.7000008; y: -4.0999999; skew-x: 367.100006; skew-y: 367.100006; }
        frame 33 { x: 18.8999996; y: -6.30000019; skew-x: 369.100006; skew-y: 369.100006; }
        frame 34 { x: 21.6000004; y: -7.5999999; skew-x: 371.799988; skew-y: 371.799988; }
        frame 35 { x: 24.5; y: -9; skew-x: 374.600006; skew-y: 374.600006; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 36 { x: 27.3999996; y: -10.3000002; skew-x: 377.5; skew-y: 377.5; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 30.2999992; y: -11.5; skew-x: 380.299988; skew-y: 380.299988; }
        frame 38 { x: 33.2000008; y: -12.6999998; skew-x: 383.100006; skew-y: 383.100006; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 39 { x: 30.7999992; y: -11.3000002; skew-x: 381.600006; skew-y: 381.600006; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 40 { x: 28.3999996; y: -9.80000019; skew-x: 380.100006; skew-y: 380.100006; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 19.1000004; y: -4.30000019; skew-x: 370.799988; skew-y: 370.799988; }
        frame 42 { x: 10; y: 1.79999995; skew-x: 361.600006; skew-y: 361.600006; }
        frame 43 { x: 2; y: 8.5; skew-x: 352.600006; skew-y: 352.600006; }
        frame 44 { x: -0.699999988; y: 11.8999996; skew-x: 349.700012; skew-y: 349.700012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 45 { x: -3.5999999; y: 15.5; skew-x: 346.700012; skew-y: 346.700012; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: -6.30000019; y: 19; skew-x: 343.700012; skew-y: 343.700012; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 47 { x: -9; y: 22.6000004; skew-x: 340.5; skew-y: 340.5; scale-x: -10000; scale-y: -10000; }
        frame 48 { x: -8.10000038; y: 21.2999992; skew-x: 340.700012; skew-y: 340.700012; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 49 { x: -7.30000019; y: 20; skew-x: -10000; skew-y: -10000; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 50 { x: -4.4000001; y: 16; skew-x: 344.700012; skew-y: 344.700012; scale-x: -10000; scale-y: -10000; }
        frame 51 { x: -1.10000002; y: 12.3000002; skew-x: 348.700012; skew-y: 348.700012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 52 { x: 2; y: 8.5; skew-x: 352.600006; skew-y: 352.600006; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 53 { x: 7.69999981; y: 3.5999999; skew-x: 358.700012; skew-y: 358.700012; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 13.8000002; y: -0.800000012; skew-x: 364.799988; skew-y: 364.799988; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 55 { x: 20; y: -5.0999999; skew-x: 370.799988; skew-y: 370.799988; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 26.5; y: -9.10000038; skew-x: 377; skew-y: 377; }
        frame 57 { x: 33.2000008; y: -12.6999998; skew-x: 383.100006; skew-y: 383.100006; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 58 { x: 31.1000004; y: -11.6999998; skew-x: 381.600006; skew-y: 381.600006; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 59 { x: 29; y: -10.6000004; skew-x: 380.100006; skew-y: 380.100006; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 25.6000004; y: -9.19999981; skew-x: 376.299988; skew-y: 376.299988; }
        frame 61 { x: 22.1000004; y: -7.69999981; skew-x: 372.600006; skew-y: 372.600006; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 62 { x: 18.8999996; y: -6.30000019; skew-x: 369.100006; skew-y: 369.100006; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 63 { x: 12.1999998; y: -0.600000024; skew-x: 362.5; skew-y: 362.5; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 6.0999999; y: 5.19999981; skew-x: 356.399994; skew-y: 356.399994; }
        frame 65 { x: 0.100000001; y: 11.3999996; skew-x: 350; skew-y: 350; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 66 { x: -5.4000001; y: 18.1000004; skew-x: 343.5; skew-y: 343.5; scale-x: -10000; scale-y: -10000; }
        frame 67 { x: -5.80000019; y: 18.8999996; skew-x: 342.200012; skew-y: 342.200012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 68 { x: -6.30000019; y: 19.6000004; skew-x: 340.700012; skew-y: 340.700012; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 69 { x: -4.30000019; y: 16.5; skew-x: 344.5; skew-y: 344.5; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 70 { x: -2.0999999; y: 13.3999996; skew-x: 348.200012; skew-y: 348.200012; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 71 { x: 0.100000001; y: 10.6000004; skew-x: 351.899994; skew-y: 351.899994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 5.4000001; y: 5; skew-x: 357.5; skew-y: 357.200012; scale-x: 0.843999982; scale-y: 0.856000006; }
        frame 74 { x: 10.8000002; y: -0.400000006; skew-x: 363; skew-y: 362.100006; scale-x: 0.838; scale-y: 0.861999989; }
        frame 75 { x: 16.6000004; y: -5.5999999; skew-x: 368.5; skew-y: 367.299988; scale-x: 0.833000004; scale-y: 0.867999971; }
        frame 76 { x: 22.7000008; y: -10.6999998; skew-x: 374.100006; skew-y: 372.5; scale-x: 0.828000009; scale-y: 0.875; }
        frame 77 { x: 27.7000008; y: -13.3000002; skew-x: 377.799988; skew-y: 376; scale-x: 0.822000027; scale-y: 0.880999982; }
        frame 78 { x: 32.7999992; y: -16; skew-x: 381.799988; skew-y: 379.5; scale-x: 0.816999972; scale-y: 0.887000024; }
        frame 79 { x: 37.9000015; y: -18.3999996; skew-x: 385.799988; skew-y: 383; scale-x: 0.811999977; scale-y: 0.893000007; }
        frame 80 { x: 43; y: -20.7999992; skew-x: 389.700012; skew-y: 386.600006; scale-x: 0.808000028; scale-y: 0.899999976; }
        frame 81 { x: 25.7000008; y: -13.6000004; skew-x: 380.600006; skew-y: 379.100006; scale-x: 0.796999991; scale-y: 0.922999978; }
        frame 82 { x: 5.30000019; y: -1.89999998; skew-x: 364.299988; skew-y: 363.5; scale-x: 0.791999996; scale-y: 0.935000002; }
        frame 83 { x: -13.5; y: 12.1000004; skew-x: 348.100006; skew-y: 348.100006; scale-x: 0.787999988; scale-y: 0.948000014; }
        frame 84 { x: -15; y: 17.2000008; skew-x: 346.5; skew-y: 346.5; scale-x: 0.802999973; scale-y: 0.907000005; }
        frame 85 { x: -16.2999992; y: 22.2000008; skew-x: 344.700012; skew-y: 344.700012; scale-x: 0.818000019; scale-y: 0.865999997; }
        frame 86 { x: -17.5; y: 27.2999992; skew-x: 342.899994; skew-y: 342.899994; scale-x: 0.833999991; scale-y: 0.825999975; }
        frame 87 { x: -19; y: 32.2999992; skew-x: 341; skew-y: 341; scale-x: 0.850000024; scale-y: 0.786000013; }
        frame 88 { x: -19.5; y: 32.7999992; skew-x: 336.700012; skew-y: 336.700012; scale-x: 0.84799999; scale-y: 0.810000002; }
        frame 89 { x: -20.3999996; y: 33.5999985; skew-x: 332.399994; skew-y: 332.399994; scale-x: -10000; scale-y: 0.836000025; }
        frame 90 { x: -16.2999992; y: 26.7999992; skew-x: 339; skew-y: 339; scale-y: 0.837000012; }
        frame 91 { x: -11.8000002; y: 20.2000008; skew-x: 345.5; skew-y: 345.5; scale-x: 0.848999977; scale-y: 0.839999974; }
        frame 92 { x: -8.80000019; y: 17.7000008; skew-x: 347.200012; skew-y: 347.200012; scale-x: 0.84799999; scale-y: 0.842000008; }
        frame 93 { x: -5.9000001; y: 15.1999998; skew-x: 348.700012; skew-y: 348.700012; scale-x: 0.848999977; scale-y: 0.843999982; }
        frame 94 { x: -3; y: 12.8000002; skew-x: 350.399994; skew-y: 350.399994; scale-x: -10000; scale-y: 0.846000016; }
        frame 95 { x: 0.100000001; y: 10.6000004; skew-x: 351.899994; skew-y: 351.899994; scale-y: 0.848999977; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
        frame 132 { cel: 0; }
        frame 133 { x: 2.5; y: 8.60000038; skew-x: 354.5; skew-y: 354.5; cel: -10000; }
        frame 134 { x: 4.9000001; y: 6.5; skew-x: 356.700012; skew-y: 356.700012; }
        frame 135 { x: 7.30000019; y: 4.4000001; skew-x: 359.200012; skew-y: 359.200012; }
        frame 136 { x: 9.80000019; y: 2.4000001; skew-x: 361.5; skew-y: 361.5; }
        frame 137 { x: 12; y: 0.200000003; skew-x: 363.299988; skew-y: 363.299988; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 138 { x: 14.3999996; y: -1.79999995; skew-x: 365.299988; skew-y: 365.299988; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 16.7000008; y: -4.0999999; skew-x: 367.100006; skew-y: 367.100006; }
        frame 140 { x: 18.8999996; y: -6.30000019; skew-x: 369.100006; skew-y: 369.100006; }
        frame 141 { x: 21.6000004; y: -7.5999999; skew-x: 371.799988; skew-y: 371.799988; }
        frame 142 { x: 24.5; y: -9; skew-x: 374.600006; skew-y: 374.600006; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 143 { x: 27.3999996; y: -10.3000002; skew-x: 377.5; skew-y: 377.5; scale-x: -10000; scale-y: -10000; }
        frame 144 { x: 30.2999992; y: -11.5; skew-x: 380.299988; skew-y: 380.299988; }
        frame 145 { x: 33.2000008; y: -12.6999998; skew-x: 383.100006; skew-y: 383.100006; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 146 { x: 30.7999992; y: -11.3000002; skew-x: 381.600006; skew-y: 381.600006; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 147 { x: 28.3999996; y: -9.80000019; skew-x: 380.100006; skew-y: 380.100006; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 19.1000004; y: -4.30000019; skew-x: 370.799988; skew-y: 370.799988; }
        frame 149 { x: 10; y: 1.79999995; skew-x: 361.600006; skew-y: 361.600006; }
        frame 150 { x: 2; y: 8.5; skew-x: 352.600006; skew-y: 352.600006; }
        frame 151 { x: -0.699999988; y: 11.8999996; skew-x: 349.700012; skew-y: 349.700012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 152 { x: -3.5999999; y: 15.5; skew-x: 346.700012; skew-y: 346.700012; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: -6.30000019; y: 19; skew-x: 343.700012; skew-y: 343.700012; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 154 { x: -9; y: 22.6000004; skew-x: 340.5; skew-y: 340.5; scale-x: -10000; scale-y: -10000; }
        frame 155 { x: -8.10000038; y: 21.2999992; skew-x: 340.700012; skew-y: 340.700012; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 156 { x: -7.30000019; y: 20; skew-x: -10000; skew-y: -10000; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 157 { x: -4.4000001; y: 16; skew-x: 344.700012; skew-y: 344.700012; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: -1.10000002; y: 12.3000002; skew-x: 348.700012; skew-y: 348.700012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 159 { x: 2; y: 8.5; skew-x: 352.600006; skew-y: 352.600006; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 160 { x: 7.69999981; y: 3.5999999; skew-x: 358.700012; skew-y: 358.700012; scale-x: -10000; scale-y: -10000; }
        frame 161 { x: 13.8000002; y: -0.800000012; skew-x: 364.799988; skew-y: 364.799988; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 162 { x: 20; y: -5.0999999; skew-x: 370.799988; skew-y: 370.799988; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 26.5; y: -9.10000038; skew-x: 377; skew-y: 377; }
        frame 164 { x: 33.2000008; y: -12.6999998; skew-x: 383.100006; skew-y: 383.100006; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 165 { x: 31.1000004; y: -11.6999998; skew-x: 381.600006; skew-y: 381.600006; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 166 { x: 29; y: -10.6000004; skew-x: 380.100006; skew-y: 380.100006; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 25.6000004; y: -9.19999981; skew-x: 376.299988; skew-y: 376.299988; }
        frame 168 { x: 22.1000004; y: -7.69999981; skew-x: 372.600006; skew-y: 372.600006; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 169 { x: 18.8999996; y: -6.30000019; skew-x: 369.100006; skew-y: 369.100006; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 170 { x: 12.1999998; y: -0.600000024; skew-x: 362.5; skew-y: 362.5; scale-x: -10000; scale-y: -10000; }
        frame 171 { x: 6.0999999; y: 5.19999981; skew-x: 356.399994; skew-y: 356.399994; }
        frame 172 { x: 0.100000001; y: 11.3999996; skew-x: 350; skew-y: 350; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 173 { x: -5.4000001; y: 18.1000004; skew-x: 343.5; skew-y: 343.5; scale-x: -10000; scale-y: -10000; }
        frame 174 { x: -5.80000019; y: 18.8999996; skew-x: 342.200012; skew-y: 342.200012; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 175 { x: -6.30000019; y: 19.6000004; skew-x: 340.700012; skew-y: 340.700012; scale-x: 0.843999982; scale-y: 0.843999982; }
        frame 176 { x: -4.30000019; y: 16.5; skew-x: 344.5; skew-y: 344.5; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 177 { x: -2.0999999; y: 13.3999996; skew-x: 348.200012; skew-y: 348.200012; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 178 { x: 0.100000001; y: 10.6000004; skew-x: 351.899994; skew-y: 351.899994; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 5.4000001; y: 5; skew-x: 357.5; skew-y: 357.200012; scale-x: 0.843999982; scale-y: 0.856000006; }
        frame 181 { x: 10.8000002; y: -0.400000006; skew-x: 363; skew-y: 362.100006; scale-x: 0.838; scale-y: 0.861999989; }
        frame 182 { x: 16.6000004; y: -5.5999999; skew-x: 368.5; skew-y: 367.299988; scale-x: 0.833000004; scale-y: 0.867999971; }
        frame 183 { x: 22.7000008; y: -10.6999998; skew-x: 374.100006; skew-y: 372.5; scale-x: 0.828000009; scale-y: 0.875; }
        frame 184 { x: 27.7000008; y: -13.3000002; skew-x: 377.799988; skew-y: 376; scale-x: 0.822000027; scale-y: 0.880999982; }
        frame 185 { x: 32.7999992; y: -16; skew-x: 381.799988; skew-y: 379.5; scale-x: 0.816999972; scale-y: 0.887000024; }
        frame 186 { x: 37.9000015; y: -18.3999996; skew-x: 385.799988; skew-y: 383; scale-x: 0.811999977; scale-y: 0.893000007; }
        frame 187 { x: 43; y: -20.7999992; skew-x: 389.700012; skew-y: 386.600006; scale-x: 0.808000028; scale-y: 0.899999976; }
        frame 188 { x: 25.7000008; y: -13.6000004; skew-x: 380.600006; skew-y: 379.100006; scale-x: 0.796999991; scale-y: 0.922999978; }
        frame 189 { x: 5.30000019; y: -1.89999998; skew-x: 364.299988; skew-y: 363.5; scale-x: 0.791999996; scale-y: 0.935000002; }
        frame 190 { x: -13.5; y: 12.1000004; skew-x: 348.100006; skew-y: 348.100006; scale-x: 0.787999988; scale-y: 0.948000014; }
        frame 191 { x: -15; y: 17.2000008; skew-x: 346.5; skew-y: 346.5; scale-x: 0.802999973; scale-y: 0.907000005; }
        frame 192 { x: -16.2999992; y: 22.2000008; skew-x: 344.700012; skew-y: 344.700012; scale-x: 0.818000019; scale-y: 0.865999997; }
        frame 193 { x: -17.5; y: 27.2999992; skew-x: 342.899994; skew-y: 342.899994; scale-x: 0.833999991; scale-y: 0.825999975; }
        frame 194 { x: -19; y: 32.2999992; skew-x: 341; skew-y: 341; scale-x: 0.850000024; scale-y: 0.786000013; }
        frame 195 { x: -19.5; y: 32.7999992; skew-x: 336.700012; skew-y: 336.700012; scale-x: 0.84799999; scale-y: 0.810000002; }
        frame 196 { x: -20.3999996; y: 33.5999985; skew-x: 332.399994; skew-y: 332.399994; scale-x: -10000; scale-y: 0.836000025; }
        frame 197 { x: -16.2999992; y: 26.7999992; skew-x: 339; skew-y: 339; scale-y: 0.837000012; }
        frame 198 { x: -11.8000002; y: 20.2000008; skew-x: 345.5; skew-y: 345.5; scale-x: 0.848999977; scale-y: 0.839999974; }
        frame 199 { x: -8.80000019; y: 17.7000008; skew-x: 347.200012; skew-y: 347.200012; scale-x: 0.84799999; scale-y: 0.842000008; }
        frame 200 { x: -5.9000001; y: 15.1999998; skew-x: 348.700012; skew-y: 348.700012; scale-x: 0.848999977; scale-y: 0.843999982; }
        frame 201 { x: -3; y: 12.8000002; skew-x: 350.399994; skew-y: 350.399994; scale-x: -10000; scale-y: 0.846000016; }
        frame 202 { x: 0.100000001; y: 10.6000004; skew-x: 351.899994; skew-y: 351.899994; scale-y: 0.848999977; }
        frame 203 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 204 { x: 5.69999981; y: 5.80000019; skew-x: 356.700012; skew-y: 356.700012; }
        frame 205 { x: 11.1000004; y: 1.20000005; skew-x: 361; skew-y: 361; }
        frame 206 { x: 17.1000004; y: -3.20000005; skew-x: 365.799988; skew-y: 365.799988; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 207 { x: 23; y: -7.5; skew-x: 370.299988; skew-y: 370.299988; scale-x: -10000; scale-y: -10000; }
        frame 208 { x: 29.1000004; y: -11.6000004; skew-x: 375; skew-y: 375; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 209 { x: 35.4000015; y: -15.5; skew-x: 379.700012; skew-y: 379.700012; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 210 { x: 25.2999992; y: -9.39999962; skew-x: 372; skew-y: 372; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 211 { x: 15.6999998; y: -2.70000005; skew-x: 364.5; skew-y: 364.5; scale-x: -10000; scale-y: -10000; }
        frame 212 { x: 6.30000019; y: 4.19999981; skew-x: 357.200012; skew-y: 357.200012; }
        frame 213 { x: -2.29999995; y: 11.6999998; skew-x: 349.600006; skew-y: 349.600006; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 214 { x: -8.5; y: 18.8999996; skew-x: 344.399994; skew-y: 344.299988; scale-x: -10000; scale-y: 0.847000003; }
    }
    Track {
        source-name: "Zombie_ladder_1";
        frame-count: 215;
        frame 0 { x: -10.3000002; y: 30.3999996; scale-x: 0.850000024; scale-y: 0.850000024; image: IMAGE_REANIM_ZOMBIE_LADDER_1; }
        frame 1 { x: -9.80000019; y: 29.7000008; scale-x: -10000; scale-y: -10000; image: none; }
        frame 2 { x: -9.19999981; y: 29; }
        frame 3 { x: -8.69999981; y: 28.2999992; }
        frame 4 { x: -8.19999981; y: 27.5; }
        frame 5 { x: -7.5999999; y: 26.7999992; }
        frame 6 { x: -7.0999999; y: 26.1000004; }
        frame 7 { x: -7.80000019; y: 27; }
        frame 8 { x: -8.60000038; y: 27.8999996; }
        frame 9 { x: -9.30000019; y: 28.7999992; }
        frame 10 { x: -10.1000004; y: 29.6000004; }
        frame 11 { x: -10.8000002; y: 30.5; }
        frame 12 { x: -11.6000004; y: 31.3999996; }
        frame 13 { x: -12.5; y: 32.5; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 14 { x: -13.3999996; y: 33.7999992; skew-x: -2.5; skew-y: -2.5; }
        frame 15 { x: -14.3999996; y: 35; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 16 { x: -15.3000002; y: 36.4000015; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 17 { x: -16.2000008; y: 37.5999985; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: -10000; scale-y: -10000; }
        frame 18 { x: -17.2000008; y: 39.0999985; skew-x: -8; skew-y: -8; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 19 { x: -16.1000004; y: 37.7000008; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 20 { x: -14.8999996; y: 36.0999985; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -13.8000002; y: 34.5999985; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 22 { x: -12.5; y: 33.0999985; skew-x: -2.5; skew-y: -2.5; scale-x: -10000; scale-y: -10000; }
        frame 23 { x: -11.5; y: 31.8999996; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 24 { x: -10.3000002; y: 30.3999996; skew-x: 0; skew-y: 0; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 26 { x: -9.69999981; y: 29.8999996; }
        frame 27 { x: -9.10000038; y: 29.3999996; }
        frame 28 { x: -8.39999962; y: 28.8999996; }
        frame 29 { x: -7.80000019; y: 28.3999996; }
        frame 30 { x: -9.30000019; y: 29.2000008; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 31 { x: -10.8000002; y: 30.2999992; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 32 { x: -12.1999998; y: 31.2000008; skew-x: -5.5; skew-y: -5.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 33 { x: -13.8000002; y: 32.4000015; skew-x: -7.5; skew-y: -7.5; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 34 { x: -15; y: 34.4000015; skew-x: -9.39999962; skew-y: -9.39999962; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 35 { x: -16; y: 36.2000008; skew-x: -11.1999998; skew-y: -11.1999998; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: -17.2000008; y: 38.2000008; skew-x: -13.1999998; skew-y: -13.1999998; }
        frame 37 { x: -18.2999992; y: 40.4000015; skew-x: -15.1999998; skew-y: -15.1999998; }
        frame 38 { x: -19.2999992; y: 42.5; skew-x: -17.1000004; skew-y: -17.1000004; }
        frame 39 { x: -20.2999992; y: 41.2000008; skew-x: -16.2000008; skew-y: -16.2000008; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 40 { x: -21.2000008; y: 40; skew-x: -15.1999998; skew-y: -15.1999998; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: -22.2999992; y: 38.7999992; skew-x: -14.3999996; skew-y: -14.3999996; }
        frame 42 { x: -23.3999996; y: 37.5999985; skew-x: -13.6999998; skew-y: -13.6999998; }
        frame 43 { x: -24.3999996; y: 36.4000015; skew-x: -12.8000002; skew-y: -12.8000002; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 44 { x: -25.6000004; y: 38.4000015; skew-x: -12.6999998; skew-y: -12.6999998; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 45 { x: -27; y: 40.4000015; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: -28.2999992; y: 42.4000015; }
        frame 47 { x: -29.8999996; y: 44.4000015; skew-x: -12.8000002; skew-y: -12.8000002; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 48 { x: -29.1000004; y: 43; skew-x: -12.6999998; skew-y: -12.6999998; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 49 { x: -28.2999992; y: 41.5999985; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: -27.7000008; y: 40.4000015; }
        frame 51 { x: -27; y: 39; }
        frame 52 { x: -26.3999996; y: 37.5999985; }
        frame 53 { x: -24.8999996; y: 37.2999992; }
        frame 54 { x: -23.5; y: 36.9000015; }
        frame 55 { x: -22; y: 36.2999992; }
        frame 56 { x: -20.5; y: 35.7999992; }
        frame 57 { x: -19.1000004; y: 35.4000015; skew-x: -12.8000002; skew-y: -12.8000002; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 58 { x: -18.2000008; y: 34.0999985; skew-x: -11.1999998; skew-y: -11.1999998; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 59 { x: -17.1000004; y: 32.9000015; skew-x: -9.5; skew-y: -9.5; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: -16.1000004; y: 31.7000008; skew-x: -7.9000001; skew-y: -7.9000001; }
        frame 61 { x: -15; y: 30.5; skew-x: -6.19999981; skew-y: -6.19999981; }
        frame 62 { x: -14.1000004; y: 29.3999996; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 63 { x: -14.5; y: 33; skew-x: -6.5; skew-y: -6.5; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 64 { x: -15.1999998; y: 36.9000015; skew-x: -8.39999962; skew-y: -8.39999962; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -15.6000004; y: 40.5999985; skew-x: -10.1999998; skew-y: -10.1999998; }
        frame 66 { x: -16.2000008; y: 44.5; skew-x: -12.3000002; skew-y: -12.3000002; }
        frame 67 { x: -15.1000004; y: 41.5; skew-x: -9.69999981; skew-y: -9.69999981; }
        frame 68 { x: -14; y: 38.5999985; skew-x: -7.19999981; skew-y: -7.19999981; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 69 { x: -12.8000002; y: 35.7000008; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: -10000; scale-y: -10000; }
        frame 70 { x: -11.6000004; y: 33; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 71 { x: -10.3000002; y: 30.3999996; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 73 { x: -7; y: 25.8999996; skew-x: 2; skew-y: 2; }
        frame 74 { x: -3.70000005; y: 21.5; skew-x: 4; skew-y: 4; }
        frame 75 { x: -0.300000012; y: 17.2000008; skew-x: 6; skew-y: 6; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 76 { x: 2.9000001; y: 12.8999996; skew-x: 8.10000038; skew-y: 8.10000038; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 77 { x: 4.5999999; y: 10.1000004; skew-x: 6.5; skew-y: 6.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 78 { x: 6.5; y: 7.19999981; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 8.19999981; y: 4.19999981; skew-x: 3.79999995; skew-y: 3.79999995; }
        frame 80 { x: 10.1000004; y: 1.29999995; skew-x: 2.5; skew-y: 2.5; }
        frame 81 { x: -2.29999995; y: 24.2000008; skew-x: -10.8999996; skew-y: -10.8999996; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 82 { x: -13.1000004; y: 49.5; skew-x: -24.5; skew-y: -24.5; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 83 { x: -21.5; y: 76.5; skew-x: -38; skew-y: -38; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 84 { x: -10000; y: 78; skew-x: -39.2999992; skew-y: -39.2999992; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 85 { x: -21.6000004; y: 79.4000015; skew-x: -40.5; skew-y: -40.5; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 86 { x: -21.7000008; y: 81; skew-x: -41.7999992; skew-y: -41.7999992; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: -21.8999996; y: 82.4000015; skew-x: -43; skew-y: -43; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 88 { x: -21.7999992; y: 78.0999985; skew-x: -40; skew-y: -40; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 89 { x: -21.6000004; y: 73.8000031; skew-x: -37; skew-y: -37; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: -21.3999996; y: 69.6999969; skew-x: -34.2000008; skew-y: -34.2000008; }
        frame 91 { x: -21.1000004; y: 65.3000031; skew-x: -31.2000008; skew-y: -31.2000008; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 92 { x: -19.5; y: 55.5; skew-x: -23.3999996; skew-y: -23.3999996; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: -17; y: 46.4000015; skew-x: -15.5; skew-y: -15.5; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 94 { x: -14; y: 37.9000015; skew-x: -7.69999981; skew-y: -7.69999981; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 95 { x: -10.3000002; y: 30.3999996; skew-x: 0; skew-y: 0; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
        frame 203 { cel: 0; }
        frame 204 { x: -1.89999998; y: 17.2999992; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: 0.848999977; scale-y: 0.848999977; cel: -10000; }
        frame 205 { x: 7.0999999; y: 5.5999999; skew-x: 18.7999992; skew-y: 18.7999992; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 16.5; y: -4.5; skew-x: 28.2999992; skew-y: 28.2999992; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 207 { x: 25.7999992; y: -13.3000002; skew-x: 37.7999992; skew-y: 37.7999992; scale-x: -10000; scale-y: -10000; }
        frame 208 { x: 35; y: -20.7000008; skew-x: 47.4000015; skew-y: 47.4000015; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 209 { x: 43.4000015; y: -26.7999992; skew-x: 56.7000008; skew-y: 56.7000008; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 210 { x: 22.2999992; y: -18; skew-x: 43.0999985; skew-y: 43.0999985; scale-x: 0.797999978; scale-y: 0.838; image: IMAGE_REANIM_ZOMBIE_LADDER_2; }
        frame 211 { x: 7.19999981; y: -10.5; skew-x: 36.4000015; skew-y: 36.4000015; scale-x: 0.795000017; scale-y: 0.795000017; image: IMAGE_REANIM_ZOMBIE_LADDER_3; }
        frame 212 { x: -17; y: -1.5; skew-x: 22.2999992; skew-y: 22.2999992; scale-x: 0.79400003; scale-y: 0.79400003; image: IMAGE_REANIM_ZOMBIE_LADDER_4; }
        frame 213 { x: -29.5; y: 21.1000004; skew-x: 3.20000005; skew-y: 3.20000005; scale-x: 0.792999983; scale-y: 0.792999983; image: IMAGE_REANIM_ZOMBIE_LADDER_5; }
        frame 214 { x: -32.2999992; y: 35.2000008; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; image: none; }
    }
    Track {
        source-name: "Zombie_outerarm_hand";
        frame-count: 215;
        frame 0 { x: 12.3000002; y: 72.1999969; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_HAND2; }
        frame 1 { x: 12.8999996; y: 71.5; skew-x: 345.200012; skew-y: 345.200012; scale-x: 0.799000025; scale-y: 0.799000025; image: none; }
        frame 2 { x: 13.5; y: 70.8000031; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: 14; y: 70.0999985; }
        frame 4 { x: 14.5; y: 69.3000031; }
        frame 5 { x: 15.1000004; y: 68.6999969; }
        frame 6 { x: 15.6000004; y: 68; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 7 { x: 14.8999996; y: 68.8000031; skew-x: 345.200012; skew-y: 345.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 8 { x: 14.1000004; y: 69.6999969; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: 13.3999996; y: 70.5999985; }
        frame 10 { x: 12.6000004; y: 71.5; }
        frame 11 { x: 11.8999996; y: 72.3000031; }
        frame 12 { x: 11.1000004; y: 73.1999969; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 13 { x: -10000; y: 73.8000031; skew-x: 343.700012; skew-y: 343.700012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 14 { y: 74.5999985; skew-x: 342.399994; skew-y: 342.399994; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: 11; y: 75.3000031; skew-x: 341; skew-y: 341; }
        frame 16 { x: 11.1000004; y: 76; skew-x: 339.700012; skew-y: 339.700012; }
        frame 17 { x: -10000; y: 76.6999969; skew-x: 338.200012; skew-y: 338.200012; }
        frame 18 { y: 77.3000031; skew-x: 336.899994; skew-y: 336.899994; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 19 { x: 11.3000002; y: 76.5; skew-x: 338.200012; skew-y: 338.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 20 { x: 11.6000004; y: 75.5999985; skew-x: 339.700012; skew-y: 339.700012; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: 11.6999998; y: 74.8000031; skew-x: 341; skew-y: 341; }
        frame 22 { x: 12; y: 73.8000031; skew-x: 342.399994; skew-y: 342.399994; }
        frame 23 { x: 12.1999998; y: 73; skew-x: 343.700012; skew-y: 343.700012; }
        frame 24 { x: 12.3000002; y: 72.1999969; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 13; y: 71.6999969; skew-x: 345.200012; skew-y: 345.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 27 { x: 13.6000004; y: 71.1999969; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 14.3000002; y: 70.6999969; }
        frame 29 { x: 14.8000002; y: 70.1999969; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 30 { x: 14.6999998; y: 70.3000031; skew-x: 343.200012; skew-y: 343.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 31 { x: 14.5; y: 70.5; skew-x: 341.200012; skew-y: 341.200012; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 14.3000002; y: 70.5999985; skew-x: 339.399994; skew-y: 339.399994; }
        frame 33 { x: 14.1000004; y: 70.8000031; skew-x: 337.399994; skew-y: 337.399994; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 34 { x: 14.1999998; y: 71.8000031; skew-x: 335.5; skew-y: 335.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 35 { x: 14.3000002; y: 72.8000031; skew-x: 333.700012; skew-y: 333.700012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 36 { x: 14.3999996; y: 73.6999969; skew-x: 331.700012; skew-y: 331.700012; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 14.6000004; y: 74.5999985; skew-x: 329.700012; skew-y: 329.700012; }
        frame 38 { x: -10000; y: 75.5999985; skew-x: 327.799988; skew-y: 327.799988; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 39 { x: 13.1000004; y: 74.9000015; skew-x: 328.700012; skew-y: 328.700012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 40 { x: 11.6000004; y: 74.1999969; skew-x: 329.600006; skew-y: 329.600006; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 10; y: 73.4000015; skew-x: 330.399994; skew-y: 330.399994; }
        frame 42 { x: 8.5; y: 72.6999969; skew-x: 331.200012; skew-y: 331.200012; }
        frame 43 { x: 7; y: 72; skew-x: 332.100006; skew-y: 332.100006; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 44 { x: 5.69999981; y: 74; skew-x: 332.200012; skew-y: 332.200012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 45 { x: 4.30000019; y: 76; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 3; y: 78; }
        frame 47 { x: 1.5; y: 80; skew-x: 332.100006; skew-y: 332.100006; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 48 { x: 2.29999995; y: 78.8000031; skew-x: 332.200012; skew-y: 332.200012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 49 { x: 3; y: 77.6999969; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 3.79999995; y: 76.5999985; }
        frame 51 { x: 4.5; y: 75.4000015; }
        frame 52 { x: 5.19999981; y: 74.3000031; skew-x: 332.100006; skew-y: 332.100006; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 53 { x: 6.5999999; y: 73.5999985; skew-x: 332.200012; skew-y: 332.200012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 54 { x: 8; y: 72.9000015; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 9.39999962; y: 72.3000031; }
        frame 56 { x: 10.8000002; y: 71.5999985; }
        frame 57 { x: 12.1999998; y: 71; skew-x: 332.100006; skew-y: 332.100006; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 58 { x: -10000; y: 70.6999969; skew-x: 333.700012; skew-y: 333.700012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 59 { x: 12.1000004; y: 70.3000031; skew-x: 335.399994; skew-y: 335.399994; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 12; y: 69.9000015; skew-x: 337; skew-y: 337; }
        frame 61 { y: 69.5; skew-x: 338.700012; skew-y: 338.700012; }
        frame 62 { x: 11.8999996; y: 69.0999985; skew-x: 340.200012; skew-y: 340.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 63 { x: 12.6999998; y: 72; skew-x: 338.399994; skew-y: 338.399994; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 64 { x: 13.3999996; y: 74.8000031; skew-x: 336.399994; skew-y: 336.399994; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 14.1999998; y: 77.5999985; skew-x: 334.700012; skew-y: 334.700012; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 66 { x: 14.8000002; y: 80.4000015; skew-x: 332.600006; skew-y: 332.600006; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 67 { x: 14.3000002; y: 78.6999969; skew-x: 335.200012; skew-y: 335.200012; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: 13.8000002; y: 77.0999985; skew-x: 337.700012; skew-y: 337.700012; }
        frame 69 { x: 13.3999996; y: 75.5; skew-x: 340.200012; skew-y: 340.200012; }
        frame 70 { x: 12.8999996; y: 73.8000031; skew-x: 342.700012; skew-y: 342.700012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 71 { x: 12.3000002; y: 72.1999969; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 14.1000004; y: 68.5; skew-x: 347.200012; skew-y: 347.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 74 { x: 16; y: 64.8000031; skew-x: 349.200012; skew-y: 349.200012; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 17.7000008; y: 61.0999985; skew-x: 351.200012; skew-y: 351.200012; }
        frame 76 { x: 19.6000004; y: 57.5; skew-x: 353; skew-y: 353; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 77 { x: 22.3999996; y: 54.0999985; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 78 { x: 25.2999992; y: 50.7999992; skew-x: 350.399994; skew-y: 350.399994; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 28.2000008; y: 47.4000015; skew-x: 349; skew-y: 349; }
        frame 80 { x: 31; y: 44; skew-x: 347.5; skew-y: 347.5; }
        frame 81 { x: 27.5; y: 61; skew-x: 334; skew-y: 334; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 82 { x: 24.3999996; y: 78.0999985; skew-x: 320.399994; skew-y: 320.399994; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 83 { x: 22.1000004; y: 95.3000031; skew-x: 306.899994; skew-y: 306.899994; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 84 { x: 22.2999992; y: 95.8000031; skew-x: 305.600006; skew-y: 305.600006; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 85 { x: 22.6000004; y: 96.4000015; skew-x: 304.299988; skew-y: 304.299988; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 22.8999996; y: 96.8000031; skew-x: 303.100006; skew-y: 303.100006; }
        frame 87 { x: 23.1000004; y: 97.4000015; skew-x: 301.899994; skew-y: 301.899994; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 88 { x: 22.2999992; y: 95.4000015; skew-x: 304.799988; skew-y: 304.799988; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 89 { x: 21.3999996; y: 93.3000031; skew-x: 307.799988; skew-y: 307.799988; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 20.6000004; y: 91.3000031; skew-x: 310.600006; skew-y: 310.600006; }
        frame 91 { x: 19.7999992; y: 89.1999969; skew-x: 313.700012; skew-y: 313.700012; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 92 { x: 17.6000004; y: 84.9000015; skew-x: 321.399994; skew-y: 321.399994; scale-x: -10000; scale-y: -10000; }
        frame 93 { x: 15.6000004; y: 80.5999985; skew-x: 329.399994; skew-y: 329.399994; }
        frame 94 { x: 13.8000002; y: 76.4000015; skew-x: 337.200012; skew-y: 337.200012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 95 { x: 12.3000002; y: 72.1999969; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
        frame 132 { x: 33.5; y: 85.8000031; skew-x: 360; skew-y: 360; cel: 0; image: IMAGE_REANIM_ZOMBIE_OUTERARM_HAND; }
        frame 133 { x: 34.9000015; y: 85.5999985; skew-x: 363.799988; skew-y: 363.799988; cel: -10000; image: none; }
        frame 134 { x: 36.4000015; y: 85.3000031; skew-x: 367.799988; skew-y: 367.799988; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 135 { x: 38; y: 85.1999969; skew-x: 371.5; skew-y: 371.5; scale-x: -10000; scale-y: -10000; }
        frame 136 { x: 39.5; y: 85.0999985; skew-x: 375.5; skew-y: 375.5; }
        frame 137 { x: 41.4000015; y: 83.5; skew-x: 377.799988; skew-y: 377.799988; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 138 { x: 43.2999992; y: 81.8000031; skew-x: 380; skew-y: 380; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 45.2000008; y: 80.3000031; skew-x: 382.299988; skew-y: 382.299988; }
        frame 140 { x: 47; y: 78.6999969; skew-x: 384.5; skew-y: 384.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 141 { x: 49.4000015; y: 78.5999985; skew-x: 383.299988; skew-y: 383.299988; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 142 { x: 51.9000015; y: 78.5; skew-x: 382; skew-y: 382; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 54.2999992; y: -10000; skew-x: 380.799988; skew-y: 380.799988; }
        frame 144 { x: 56.7000008; y: 78.4000015; skew-x: 379.299988; skew-y: 379.299988; }
        frame 145 { x: 59.0999985; y: 78.3000031; skew-x: 378.200012; skew-y: 378.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 146 { x: 55; y: 81; skew-x: 371.299988; skew-y: 371.299988; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 147 { x: 50.9000015; y: 83.6999969; skew-x: 364.299988; skew-y: 364.299988; scale-x: -10000; scale-y: -10000; }
        frame 148 { x: 47; y: 86.6999969; skew-x: 357.5; skew-y: 357.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 149 { x: 43.2999992; y: 89.8000031; skew-x: 350.700012; skew-y: 350.700012; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 39.5; y: 93.0999985; skew-x: 343.600006; skew-y: 343.600006; }
        frame 151 { x: 38.5; y: 94.5; skew-x: 343.700012; skew-y: 343.700012; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 152 { x: 37.4000015; y: 95.9000015; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 36.2999992; y: 97.3000031; }
        frame 154 { x: 35; y: 98.8000031; skew-x: 343.600006; skew-y: 343.600006; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 155 { x: 35.0999985; y: 96.6999969; skew-x: 345.5; skew-y: 345.5; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 156 { x: 35.2999992; y: 94.5999985; skew-x: 347.399994; skew-y: 347.399994; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: -10000; y: 92.5999985; skew-x: 349.200012; skew-y: 349.200012; }
        frame 158 { x: 35.5; y: 90.5; skew-x: 351.200012; skew-y: 351.200012; }
        frame 159 { x: 35.7000008; y: 88.5; skew-x: 352.899994; skew-y: 352.899994; }
        frame 160 { x: 34.9000015; y: 86.3000031; skew-x: 355.700012; skew-y: 355.700012; }
        frame 161 { x: 33.9000015; y: 84.0999985; skew-x: 358.5; skew-y: 358.5; }
        frame 162 { x: 33; y: 82; skew-x: 361.299988; skew-y: 361.299988; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 163 { x: 32.0999985; y: 79.9000015; skew-x: 364; skew-y: 364; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 31.2999992; y: 77.8000031; skew-x: 366.899994; skew-y: 366.899994; }
        frame 165 { x: 31.3999996; y: 76.5999985; skew-x: 370.5; skew-y: 370.5; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 166 { x: 31.7000008; y: 75.1999969; skew-x: 374.299988; skew-y: 374.299988; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 31.7999992; y: 74; skew-x: 377.799988; skew-y: 377.799988; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 168 { x: 32; y: 72.8000031; skew-x: 381.600006; skew-y: 381.600006; scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 169 { x: 32.4000015; y: 71.8000031; skew-x: 385.399994; skew-y: 385.399994; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 170 { x: 32.2999992; y: 76.3000031; skew-x: 376.600006; skew-y: 376.600006; scale-x: 0.791999996; scale-y: 0.791999996; }
        frame 171 { x: -10000; y: 81.1999969; skew-x: 367.799988; skew-y: 367.799988; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 32.5; y: 86.0999985; skew-x: 359.399994; skew-y: 359.399994; }
        frame 173 { x: 33; y: 91.4000015; skew-x: 350.600006; skew-y: 350.600006; }
        frame 174 { x: 33.0999985; y: 90.3000031; skew-x: 352.5; skew-y: 352.5; scale-x: 0.792999983; scale-y: 0.792999983; }
        frame 175 { x: -10000; y: 89.3000031; skew-x: 354.5; skew-y: 354.5; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 176 { x: 33.2999992; y: 88.1999969; skew-x: 356.200012; skew-y: 356.200012; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 177 { x: 33.5; y: 87.0999985; skew-x: 358.200012; skew-y: 358.200012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 178 { x: -10000; y: 85.8000031; skew-x: 360; skew-y: 360; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 179 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 34.9000015; y: 84.5999985; skew-x: 358; skew-y: 358; }
        frame 181 { x: 36.4000015; y: 83.5; skew-x: 355.700012; skew-y: 355.700012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 182 { x: 37.7999992; y: 82.3000031; skew-x: 353.5; skew-y: 353.5; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 39.4000015; y: 81.1999969; skew-x: 351.200012; skew-y: 351.200012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 184 { x: 40.7999992; y: 80.0999985; skew-x: 349.200012; skew-y: 349.200012; scale-x: -10000; scale-y: -10000; }
        frame 185 { x: 42.2999992; y: 79; skew-x: 347; skew-y: 347; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 186 { x: 43.9000015; y: 77.8000031; skew-x: 344.700012; skew-y: 344.700012; scale-x: -10000; scale-y: -10000; }
        frame 187 { x: 45.2999992; y: 76.8000031; skew-x: 342.5; skew-y: 342.5; }
        frame 188 { x: 45.4000015; y: 82.0999985; skew-x: 329.200012; skew-y: 329.200012; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 189 { x: 46; y: 87.5999985; skew-x: 315.600006; skew-y: 315.600006; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 190 { x: 47.7000008; y: 93.0999985; skew-x: 302.299988; skew-y: 302.299988; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 191 { x: 56; y: 93; skew-x: 288.799988; skew-y: 288.799988; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 192 { x: 64.8000031; y: 92.5; skew-x: 275.299988; skew-y: 275.299988; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 70.3000031; y: 88.3000031; skew-x: 262; skew-y: 262; }
        frame 194 { x: 76.1999969; y: 83.4000015; skew-x: 248.699997; skew-y: 248.699997; }
        frame 195 { x: 70.5; y: 88.9000015; skew-x: 262.700012; skew-y: 262.700012; }
        frame 196 { x: 65.3000031; y: 93.8000031; skew-x: 276.5; skew-y: 276.5; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 197 { x: 57.9000015; y: 95; skew-x: 290.299988; skew-y: 290.299988; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 51.0999985; y: 95.6999969; skew-x: 304.299988; skew-y: 304.299988; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 199 { x: 45.5; y: 92.9000015; skew-x: 318.200012; skew-y: 318.200012; scale-x: -10000; scale-y: -10000; }
        frame 200 { x: 40.7999992; y: 90.1999969; skew-x: 332.200012; skew-y: 332.200012; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 201 { x: 36.7999992; y: 87.8000031; skew-x: 346.200012; skew-y: 346.200012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 202 { x: 33.5; y: 85.8000031; skew-x: 360; skew-y: 360; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 203 { x: 12.3000002; y: 72.1999969; skew-x: 345; skew-y: 345; scale-x: -10000; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_HAND2; }
        frame 204 { x: 13.3999996; y: 62; skew-x: 354.5; skew-y: 354.5; scale-x: 0.799000025; scale-y: 0.799000025; image: none; }
        frame 205 { x: 14.6000004; y: 52; skew-x: 363.799988; skew-y: 363.799988; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 16.1000004; y: 42.2999992; skew-x: 373.299988; skew-y: 373.299988; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 207 { x: 17.7000008; y: 32.9000015; skew-x: 382.799988; skew-y: 382.799988; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 208 { x: 19.5; y: 23.7999992; skew-x: 392.299988; skew-y: 392.299988; scale-x: -10000; scale-y: -10000; }
        frame 209 { x: 21.2000008; y: 14.8999996; skew-x: 401.799988; skew-y: 401.799988; }
        frame 210 { x: 9.80000019; y: 26.3999996; skew-x: 388.100006; skew-y: 388.100006; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 211 { x: 0.300000012; y: 32.7999992; skew-x: 381.299988; skew-y: 381.299988; scale-x: 0.795000017; scale-y: 0.795000017; }
        frame 212 { x: -11.8999996; y: 41.0999985; skew-x: 367.299988; skew-y: 367.299988; scale-x: 0.79400003; scale-y: 0.79400003; }
        frame 213 { x: -9.89999962; y: 59.2999992; skew-x: 357.200012; skew-y: 356.899994; scale-x: 0.792999983; scale-y: -10000; }
        frame 214 { x: -10000; y: 72.3000031; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
    }
    Track {
        source-name: "Zombie_outerarm_lower";
        frame-count: 215;
        frame 0 { x: 47.9000015; y: 59; skew-x: 63.5999985; skew-y: 61.9000015; scale-x: 0.855000019; scale-y: 0.925999999; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_LOWER; }
        frame 1 { x: 49.2999992; y: 58; skew-x: 63.5; skew-y: 62.4000015; scale-x: 0.852999985; scale-y: 0.966000021; image: none; }
        frame 2 { x: 50.5; y: 57; skew-x: 63.2999992; skew-y: 62.7000008; scale-x: 0.851000011; scale-y: 1.005; }
        frame 3 { x: 51.9000015; y: 56; skew-x: 62.9000015; skew-y: 63; scale-x: 0.850000024; scale-y: 1.04400003; }
        frame 4 { x: 53.0999985; y: 55; skew-x: 62.7000008; skew-y: 63.2999992; scale-x: 0.847000003; scale-y: 1.08399999; }
        frame 5 { x: 54.5; y: 53.9000015; skew-x: 62.4000015; skew-y: 63.5; scale-x: 0.845000029; scale-y: 1.12300003; }
        frame 6 { x: 55.9000015; y: 53; skew-x: 62.0999985; skew-y: 63.5999985; scale-x: 0.842000008; scale-y: 1.16400003; }
        frame 7 { x: 54.5; y: 53.7999992; skew-x: -10000; skew-y: 63.2000008; scale-x: 0.845000029; scale-y: 1.12300003; }
        frame 8 { x: 52.9000015; y: 54.7000008; skew-x: 62; skew-y: 62.5; scale-x: 0.847000003; scale-y: 1.08399999; }
        frame 9 { x: 51.4000015; y: 55.5; skew-x: 61.9000015; skew-y: 62; scale-x: 0.848999977; scale-y: 1.04400003; }
        frame 10 { x: 49.7999992; y: 56.4000015; skew-x: 61.5999985; skew-y: 61.2000008; scale-x: 0.851999998; scale-y: 1.00399995; }
        frame 11 { x: 48.2999992; y: 57.2999992; skew-x: 61.5; skew-y: 60.5; scale-x: 0.853999972; scale-y: 0.963999987; }
        frame 12 { x: 46.5999985; y: 58.2000008; skew-x: 61.2999992; skew-y: 59.5999985; scale-x: 0.855000019; scale-y: 0.925999999; }
        frame 13 { x: 46.2999992; y: 58.4000015; skew-x: 60.2000008; skew-y: 59; scale-x: 0.859000027; scale-y: 0.921999991; }
        frame 14 { x: 46.0999985; y: 58.5999985; skew-x: 59.0999985; skew-y: 58.4000015; scale-x: 0.862999976; scale-y: 0.916999996; }
        frame 15 { x: 45.7999992; y: 59; skew-x: 57.7000008; skew-y: 57.7999992; scale-x: 0.867999971; scale-y: 0.912; }
        frame 16 { x: 45.5; y: 59.2999992; skew-x: 56.5999985; skew-y: 57.2000008; scale-x: 0.871999979; scale-y: 0.907999992; }
        frame 17 { x: 45.2000008; y: 59.5; skew-x: 55.4000015; skew-y: 56.5999985; scale-x: 0.875999987; scale-y: 0.902999997; }
        frame 18 { x: 45; y: 59.7999992; skew-x: 54.2000008; skew-y: 56; scale-x: 0.880999982; scale-y: 0.898999989; }
        frame 19 { x: 45.5; y: 59.5999985; skew-x: 55.9000015; skew-y: 57.0999985; scale-x: 0.875999987; scale-y: 0.902999997; }
        frame 20 { x: 46; y: 59.5; skew-x: 57.2999992; skew-y: 58; scale-x: 0.871999979; scale-y: 0.907999992; }
        frame 21 { x: 46.5; y: 59.4000015; skew-x: 59; skew-y: 59; scale-x: 0.867999971; scale-y: 0.912; }
        frame 22 { x: 47; y: 59.2000008; skew-x: 60.5999985; skew-y: 59.9000015; scale-x: 0.862999976; scale-y: 0.916999996; }
        frame 23 { x: 47.5; y: 59; skew-x: 62.2000008; skew-y: 61; scale-x: 0.859000027; scale-y: 0.921999991; }
        frame 24 { x: 47.9000015; skew-x: 63.5999985; skew-y: 61.9000015; scale-x: 0.855000019; scale-y: 0.925999999; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: 48.5; y: 58.0999985; skew-x: 62.5999985; skew-y: 60.9000015; }
        frame 27 { x: 49; y: 57.4000015; skew-x: 61.5999985; skew-y: 59.9000015; scale-x: 0.853999972; scale-y: 0.925000012; }
        frame 28 { x: 49.5999985; y: 56.5; skew-x: 60.7999992; skew-y: 59.0999985; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 50.2999992; y: 55.5999985; skew-x: 59.7000008; skew-y: 58; }
        frame 30 { x: 49.2999992; y: 54.5999985; skew-x: 57.5999985; skew-y: 55.9000015; scale-y: 0.924000025; }
        frame 31 { x: 48.2999992; y: 53.7000008; skew-x: 55.4000015; skew-y: 53.7000008; scale-x: 0.852999985; scale-y: -10000; }
        frame 32 { x: 47.2999992; y: 52.7999992; skew-x: 53.0999985; skew-y: 51.4000015; scale-x: -10000; }
        frame 33 { x: 46.2999992; y: 51.7999992; skew-x: 50.9000015; skew-y: 49.2000008; }
        frame 34 { x: 45.4000015; y: 51.5; skew-x: 48.7999992; skew-y: 47.0999985; scale-x: 0.851999998; scale-y: 0.922999978; }
        frame 35 { x: 44.5999985; y: -10000; skew-x: 46.5999985; skew-y: 44.9000015; scale-x: -10000; scale-y: 0.921999991; }
        frame 36 { x: 43.9000015; y: 51.2999992; skew-x: 44.5999985; skew-y: 42.9000015; scale-x: 0.851000011; scale-y: -10000; }
        frame 37 { x: 43.0999985; y: 51.0999985; skew-x: 42.4000015; skew-y: 40.5999985; scale-x: -10000; }
        frame 38 { x: 42.4000015; y: 50.9000015; skew-x: 40.2000008; skew-y: 38.5; scale-x: 0.851999998; scale-y: 0.922999978; }
        frame 39 { x: 42; y: 51.5; skew-x: 43.7999992; skew-y: 42.0999985; scale-x: 0.851000011; scale-y: 0.921000004; }
        frame 40 { x: 41.9000015; y: 52.0999985; skew-x: 47.2999992; skew-y: 45.5999985; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 41.5; y: 52.9000015; skew-x: 50.9000015; skew-y: 49.0999985; scale-x: 0.850000024; }
        frame 42 { x: 41.4000015; y: 53.5; skew-x: 54.4000015; skew-y: 52.5999985; scale-x: -10000; }
        frame 43 { x: 41.2999992; y: 54.4000015; skew-x: 57.7999992; skew-y: 56.0999985; scale-x: 0.851000011; }
        frame 44 { x: 39.9000015; y: 55.7999992; skew-x: 57.0999985; skew-y: 55.4000015; scale-x: 0.850000024; scale-y: 0.920000017; }
        frame 45 { x: 38.4000015; y: 57; skew-x: 56.4000015; skew-y: 54.7000008; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 36.9000015; y: 58.4000015; skew-x: 55.5999985; skew-y: 53.9000015; scale-x: 0.848999977; }
        frame 47 { x: 35.2999992; y: 59.7999992; skew-x: 54.9000015; skew-y: 53.2000008; scale-x: 0.850000024; }
        frame 48 { x: 36.0999985; y: 58.7999992; skew-x: 55.5999985; skew-y: 53.9000015; scale-x: 0.848999977; }
        frame 49 { x: 37; y: 57.7999992; skew-x: 56.0999985; skew-y: 54.4000015; scale-x: -10000; }
        frame 50 { x: 37.9000015; y: 56.7000008; skew-x: 56.5999985; skew-y: 54.9000015; scale-x: 0.850000024; }
        frame 51 { x: 38.7000008; y: 55.5999985; skew-x: 57.2999992; skew-y: 55.5999985; scale-x: -10000; }
        frame 52 { x: 39.5; y: 54.5999985; skew-x: 57.7999992; skew-y: 56.0999985; scale-x: 0.851000011; scale-y: 0.921000004; }
        frame 53 { x: 40.7999992; y: 53.7000008; skew-x: 56.9000015; skew-y: 55.0999985; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 42; y: 52.7999992; skew-x: 55.7999992; skew-y: 54.0999985; }
        frame 55 { x: 43; y: 51.7999992; skew-x: 54.5999985; skew-y: 52.9000015; scale-y: 0.921999991; }
        frame 56 { x: 44.2999992; y: 50.7999992; skew-x: 53.5999985; skew-y: 51.9000015; scale-x: 0.851999998; scale-y: -10000; }
        frame 57 { x: 45.2999992; y: 49.7999992; skew-x: 52.5; skew-y: 50.7999992; scale-x: 0.852999985; scale-y: 0.922999978; }
        frame 58 { x: 45.7999992; y: 50.0999985; skew-x: 54.0999985; skew-y: 52.4000015; scale-x: 0.851999998; scale-y: -10000; }
        frame 59 { x: 46.0999985; y: 50.4000015; skew-x: 55.5999985; skew-y: 53.9000015; scale-x: -10000; }
        frame 60 { x: 46.5999985; y: 50.7000008; skew-x: 56.9000015; skew-y: 55.2000008; }
        frame 61 { x: 47.0999985; y: 51; skew-x: 58.4000015; skew-y: 56.7000008; }
        frame 62 { x: 47.5; y: 51.2999992; skew-x: 59.7999992; skew-y: 58.0999985; scale-x: 0.852999985; scale-y: 0.924000025; }
        frame 63 { x: 47.7999992; y: 53.0999985; skew-x: 58.4000015; skew-y: 56.5999985; scale-x: -10000; scale-y: 0.922999978; }
        frame 64 { x: 47.9000015; y: 55; skew-x: 56.7999992; skew-y: 55.0999985; scale-y: -10000; }
        frame 65 { x: 48; y: 56.9000015; skew-x: 55.2999992; skew-y: 53.5999985; scale-y: 0.924000025; }
        frame 66 { x: 48.2999992; y: 58.9000015; skew-x: 53.5999985; skew-y: 51.9000015; scale-x: 0.853999972; scale-y: -10000; }
        frame 67 { x: 48.2000008; y: 58.7999992; skew-x: 55.5999985; skew-y: 53.9000015; scale-x: 0.852999985; }
        frame 68 { x: 48.2999992; y: -10000; skew-x: 57.5999985; skew-y: 55.9000015; scale-x: 0.853999972; }
        frame 69 { x: 48; y: 58.9000015; skew-x: 59.5999985; skew-y: 57.9000015; scale-x: -10000; scale-y: 0.925000012; }
        frame 70 { x: 48.0999985; y: -10000; skew-x: 61.5999985; skew-y: 59.9000015; scale-x: 0.855000019; scale-y: -10000; }
        frame 71 { x: 47.9000015; y: 59; skew-x: 63.5999985; skew-y: 61.9000015; scale-x: -10000; scale-y: 0.925999999; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 73 { x: 50.7999992; y: 56.9000015; skew-x: 67.3000031; skew-y: 65.5999985; }
        frame 74 { x: 53.5999985; y: 55; skew-x: 70.6999969; skew-y: 69; }
        frame 75 { x: 56.5; y: 53; skew-x: 74.1999969; skew-y: 72.5; }
        frame 76 { x: 59.5; y: 51.0999985; skew-x: 77.9000015; skew-y: 76.1999969; }
        frame 77 { x: 63.2999992; y: 49.0999985; skew-x: 82.4000015; skew-y: 77.6999969; scale-x: 0.834999979; scale-y: 0.939999998; }
        frame 78 { x: 67.1999969; y: 47.2999992; skew-x: 87; skew-y: 79.4000015; scale-x: 0.816999972; scale-y: 0.953000009; }
        frame 79 { x: 71; y: 45.5; skew-x: 91.5999985; skew-y: 81.0999985; scale-x: 0.799000025; scale-y: 0.966000021; }
        frame 80 { x: 74.8000031; y: 43.7000008; skew-x: 96.4000015; skew-y: 83; scale-x: 0.782000005; scale-y: 0.977999985; }
        frame 81 { x: 62.7999992; y: 45.5999985; skew-x: 68.1999969; skew-y: 60.7000008; scale-x: 0.816999972; scale-y: 0.950999975; }
        frame 82 { x: 52.0999985; y: 51.0999985; skew-x: 40.0999985; skew-y: 38.2999992; scale-x: 0.851999998; scale-y: 0.921999991; }
        frame 83 { x: 37.5999985; y: 61.9000015; skew-x: 16.6000004; skew-y: 14.8999996; scale-x: 0.852999985; scale-y: 0.922999978; }
        frame 84 { x: 39.2999992; y: 62; skew-x: 19.7999992; skew-y: 18; scale-x: 0.851000011; scale-y: 0.921999991; }
        frame 85 { x: 41; y: 62.2999992; skew-x: 23; skew-y: 21.2999992; scale-x: -10000; scale-y: 0.921000004; }
        frame 86 { x: 42.7999992; y: -10000; skew-x: 26; skew-y: 24.2999992; scale-x: 0.850000024; scale-y: -10000; }
        frame 87 { x: 44.5; skew-x: 29.2000008; skew-y: 27.5; scale-x: 0.851000011; scale-y: 0.921999991; }
        frame 88 { x: 44.7000008; y: 61.2999992; skew-x: 30.7999992; skew-y: 29.1000004; scale-x: 0.850000024; scale-y: 0.921000004; }
        frame 89 { x: 45; y: 60.4000015; skew-x: 32.5; skew-y: 30.7999992; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 45.0999985; y: 59.5; skew-x: 34.0999985; skew-y: 32.4000015; scale-x: 0.851000011; }
        frame 91 { x: 45.4000015; y: 58.5; skew-x: 35.7999992; skew-y: 34.0999985; scale-x: 0.851999998; scale-y: 0.922999978; }
        frame 92 { x: 45.7000008; y: 58.4000015; skew-x: 42.7999992; skew-y: 41.0999985; scale-x: -10000; scale-y: 0.921999991; }
        frame 93 { x: 46.2999992; y: 58.5; skew-x: 49.7999992; skew-y: 48.0999985; scale-x: 0.852999985; scale-y: 0.924000025; }
        frame 94 { x: 47; y: 58.5999985; skew-x: 56.7999992; skew-y: 55.0999985; scale-x: 0.853999972; scale-y: 0.925000012; }
        frame 95 { x: 47.9000015; y: 59; skew-x: 63.5999985; skew-y: 61.9000015; scale-x: 0.855000019; scale-y: 0.925999999; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
        frame 132 { x: 38.5; y: 64.8000031; skew-x: 8.19999981; skew-y: 6.5; scale-x: 0.852999985; scale-y: 0.924000025; cel: 0; }
        frame 133 { x: 38.5999985; y: 65.4000015; skew-x: 6.19999981; skew-y: 4.5; scale-x: 0.851999998; scale-y: 0.921999991; cel: -10000; }
        frame 134 { x: 38.7999992; y: 65.9000015; skew-x: 4.19999981; skew-y: 2.5; scale-x: -10000; scale-y: -10000; }
        frame 135 { x: -10000; y: 66.5999985; skew-x: 2.20000005; skew-y: 0.5; }
        frame 136 { x: 39; y: 67.0999985; skew-x: 0.400000006; skew-y: -1.20000005; scale-x: 0.852999985; scale-y: 0.922999978; }
        frame 137 { x: 40.7999992; y: 65.6999969; skew-x: 0.200000003; skew-y: -1.39999998; scale-x: 0.851999998; scale-y: 0.921999991; }
        frame 138 { x: 42.5; y: 64.1999969; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 139 { x: 44.0999985; y: 62.5999985; }
        frame 140 { x: 45.7999992; y: 61.0999985; skew-x: 0.400000006; skew-y: -1.20000005; scale-x: 0.852999985; scale-y: 0.922999978; }
        frame 141 { x: 46.7000008; y: 61.9000015; skew-x: -3; skew-y: -4.69999981; scale-x: 0.851999998; scale-y: 0.921999991; }
        frame 142 { x: 47.5999985; y: 62.7000008; skew-x: -6.4000001; skew-y: -8.10000038; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 48.5999985; y: 63.4000015; skew-x: -9.69999981; skew-y: -11.3999996; }
        frame 144 { x: 49.7999992; y: 64.1999969; skew-x: -13.1999998; skew-y: -14.8999996; }
        frame 145 { x: 50.7999992; y: 64.8000031; skew-x: -16.3999996; skew-y: -18.1000004; }
        frame 146 { x: 48.5; y: 65.6999969; skew-x: -14.6999998; skew-y: -16.3999996; scale-x: 0.851000011; }
        frame 147 { x: 46.0999985; y: 66.5; skew-x: -12.6999998; skew-y: -14.3999996; scale-x: -10000; }
        frame 148 { x: 43.9000015; y: 67.1999969; skew-x: -10.6999998; skew-y: -12.3999996; }
        frame 149 { x: 41.5999985; y: 68.0999985; skew-x: -8.89999962; skew-y: -10.6999998; scale-y: 0.921000004; }
        frame 150 { x: 39.2999992; y: 68.8000031; skew-x: -6.9000001; skew-y: -8.60000038; scale-y: 0.921999991; }
        frame 151 { x: 38.0999985; y: 69.9000015; skew-x: -7; skew-y: -8.69999981; scale-y: 0.921000004; }
        frame 152 { x: 37; y: 71; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 153 { x: 35.9000015; y: 72.0999985; }
        frame 154 { x: 34.7999992; y: 73.0999985; skew-x: -6.9000001; skew-y: -8.60000038; scale-y: 0.921999991; }
        frame 155 { x: 35.9000015; y: 71.4000015; skew-x: -4.4000001; skew-y: -6.19999981; scale-x: 0.850000024; scale-y: 0.921000004; }
        frame 156 { x: 37; y: 69.6999969; skew-x: -1.89999998; skew-y: -3.5999999; scale-x: -10000; scale-y: -10000; }
        frame 157 { x: 38.0999985; y: 67.9000015; skew-x: 0.699999988; skew-y: -0.899999976; scale-y: 0.920000017; }
        frame 158 { x: 39.2999992; y: 66.1999969; skew-x: 3.20000005; skew-y: 1.5; scale-y: -10000; }
        frame 159 { x: 40.5; y: 64.4000015; skew-x: 5.80000019; skew-y: 4.0999999; scale-x: 0.851000011; scale-y: 0.921000004; }
        frame 160 { x: 41; y: 63; skew-x: 9.69999981; skew-y: 8; scale-x: 0.848999977; scale-y: 0.920000017; }
        frame 161 { x: 41.7000008; y: 61.5; skew-x: 13.5; skew-y: 11.8000002; scale-x: -10000; scale-y: 0.91900003; }
        frame 162 { x: 42.5; y: 60; skew-x: 17.5; skew-y: 15.8000002; scale-y: -10000; }
        frame 163 { x: 43.4000015; y: 58.5999985; skew-x: 21.5; skew-y: 19.7999992; scale-x: 0.84799999; }
        frame 164 { x: 44.0999985; y: 57; skew-x: 25.3999996; skew-y: 23.6000004; scale-x: 0.850000024; scale-y: 0.920000017; }
        frame 165 { x: 43.9000015; y: 56.5; skew-x: 25.5; skew-y: 23.7999992; scale-x: 0.84799999; scale-y: 0.917999983; }
        frame 166 { x: 43.5999985; y: 56; skew-x: 25.7999992; skew-y: 24.1000004; scale-x: -10000; scale-y: -10000; }
        frame 167 { x: 43.4000015; y: 55.4000015; skew-x: 26; skew-y: 24.2999992; scale-x: 0.847000003; }
        frame 168 { x: 43.2000008; y: 55; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 0.916999996; }
        frame 169 { x: 42.7999992; y: 54.2999992; skew-x: 26.2999992; skew-y: 24.6000004; scale-x: 0.84799999; scale-y: 0.91900003; }
        frame 170 { x: 40.7000008; y: 58; skew-x: 19.7999992; skew-y: 18.1000004; scale-x: 0.847000003; scale-y: 0.916999996; }
        frame 171 { x: 38.9000015; y: 61.5999985; skew-x: 13.5; skew-y: 11.6999998; scale-x: 0.846000016; scale-y: -10000; }
        frame 172 { x: 37.2000008; y: 65.3000031; skew-x: 7; skew-y: 5.19999981; scale-x: -10000; }
        frame 173 { x: 35.7000008; y: 68.9000015; skew-x: 0.600000024; skew-y: -1.10000002; scale-x: 0.847000003; scale-y: 0.917999983; }
        frame 174 { x: 36.2999992; y: 68.0999985; skew-x: 2; skew-y: 0.300000012; scale-x: -10000; scale-y: -10000; }
        frame 175 { x: 36.9000015; y: 67.3000031; skew-x: 3.5; skew-y: 1.79999995; scale-x: 0.84799999; scale-y: 0.91900003; }
        frame 176 { x: 37.4000015; y: 66.5; skew-x: 5; skew-y: 3.29999995; scale-x: 0.850000024; scale-y: 0.920000017; }
        frame 177 { x: 38; y: 65.5999985; skew-x: 6.69999981; skew-y: 5; scale-x: 0.851000011; scale-y: 0.921000004; }
        frame 178 { x: 38.5; y: 64.8000031; skew-x: 8.19999981; skew-y: 6.5; scale-x: 0.852999985; scale-y: 0.924000025; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 40.5999985; y: 63.0999985; skew-x: 9.19999981; skew-y: 7.5; scale-x: 0.851000011; scale-y: 0.921999991; }
        frame 181 { x: 42.7999992; y: 61.5; skew-x: 10.1999998; skew-y: 8.5; scale-x: -10000; scale-y: -10000; }
        frame 182 { x: 44.9000015; y: 60; skew-x: 11.1999998; skew-y: 9.5; scale-y: 0.921000004; }
        frame 183 { x: 47; y: 58.4000015; skew-x: 12.1999998; skew-y: 10.5; scale-y: -10000; }
        frame 184 { x: 49.0999985; y: 56.7999992; skew-x: 13.1999998; skew-y: 11.5; scale-x: 0.850000024; }
        frame 185 { x: 51.4000015; y: 55.2000008; skew-x: 14.1999998; skew-y: 12.5; scale-x: -10000; }
        frame 186 { x: 53.5; y: 53.5; skew-x: 15.1999998; skew-y: 13.5; scale-y: 0.920000017; }
        frame 187 { x: 55.5; y: 52; skew-x: 16.2000008; skew-y: 14.5; scale-x: 0.851000011; scale-y: 0.921000004; }
        frame 188 { x: 49.0999985; y: 56.9000015; skew-x: 2.70000005; skew-y: 1; scale-x: 0.848999977; scale-y: 0.920000017; }
        frame 189 { x: 43.5; y: 61.5; skew-x: -10.5; skew-y: -12.1999998; scale-x: -10000; scale-y: -10000; }
        frame 190 { x: 38.5999985; y: 65.5999985; skew-x: -23.7999992; skew-y: -25.5; }
        frame 191 { x: 40.2999992; y: 69.1999969; skew-x: -37.0999985; skew-y: -38.7999992; scale-x: 0.84799999; scale-y: 0.91900003; }
        frame 192 { x: 42.5; y: 72; skew-x: -50.5999985; skew-y: -52.2999992; scale-x: -10000; scale-y: 0.917999983; }
        frame 193 { x: 45.0999985; y: 73.8000031; skew-x: -64.0999985; skew-y: -65.8000031; scale-x: 0.847000003; scale-y: 0.916999996; }
        frame 194 { x: 48; y: 74.8000031; skew-x: -77.4000015; skew-y: -79.0999985; scale-x: 0.84799999; scale-y: 0.91900003; }
        frame 195 { x: 45.9000015; y: 75.3000031; skew-x: -66.5999985; skew-y: -68.4000015; scale-x: 0.847000003; scale-y: 0.916999996; }
        frame 196 { x: 43.7999992; y: -10000; skew-x: -55.9000015; skew-y: -57.5999985; scale-x: 0.84799999; scale-y: 0.917999983; }
        frame 197 { x: 41.9000015; y: 74.6999969; skew-x: -45.2999992; skew-y: -47; scale-x: -10000; scale-y: 0.91900003; }
        frame 198 { x: 40.4000015; y: 73.5999985; skew-x: -34.5; skew-y: -36.2000008; scale-x: 0.850000024; scale-y: 0.920000017; }
        frame 199 { x: 39.0999985; y: 71.8000031; skew-x: -23.7999992; skew-y: -25.5; scale-x: -10000; scale-y: 0.921000004; }
        frame 200 { x: 38.5; y: 70; skew-x: -13.1999998; skew-y: -14.8999996; scale-x: 0.851000011; scale-y: 0.921999991; }
        frame 201 { x: 38.0999985; y: 67.5; skew-x: -2.5; skew-y: -4.19999981; scale-x: -10000; scale-y: -10000; }
        frame 202 { x: 38.5; y: 64.8000031; skew-x: 8.19999981; skew-y: 6.5; scale-x: 0.852999985; scale-y: 0.924000025; }
        frame 203 { x: 47.9000015; y: 59; skew-x: 63.5999985; skew-y: 61.9000015; scale-x: 0.855000019; scale-y: 0.925999999; }
        frame 204 { x: 48.0999985; y: 54.2999992; skew-x: 72.9000015; skew-y: 71.1999969; scale-x: -10000; scale-y: -10000; }
        frame 205 { x: 48.5999985; y: 50; skew-x: 82.4000015; skew-y: 80.6999969; scale-x: 0.853999972; scale-y: 0.925000012; }
        frame 206 { x: 49.2999992; y: 46.2000008; skew-x: 92; skew-y: 90.1999969; scale-x: 0.852999985; scale-y: 0.924000025; }
        frame 207 { x: 50; y: 42.7999992; skew-x: 101.5; skew-y: 99.8000031; scale-x: 0.851999998; scale-y: 0.922999978; }
        frame 208 { x: 50.9000015; y: 39.9000015; skew-x: 111; skew-y: 109.300003; scale-x: -10000; scale-y: 0.921999991; }
        frame 209 { x: 51.5; y: 37.5; skew-x: 120.400002; skew-y: 118.699997; scale-x: 0.852999985; scale-y: 0.922999978; }
        frame 210 { x: 44.5; y: 42.7999992; skew-x: 106.699997; skew-y: 105; scale-x: 0.851000011; scale-y: 0.921000004; }
        frame 211 { x: 38.4000015; y: 43.2000008; skew-x: 95.5999985; skew-y: 95.6999969; scale-x: 0.855000019; scale-y: 0.958999991; }
        frame 212 { x: 29.8999996; y: 42.5999985; skew-x: 79.6999969; skew-y: 83.4000015; scale-x: 0.86500001; scale-y: 1.03999996; }
        frame 213 { x: 26; y: 50; skew-x: 64.9000015; skew-y: 63.7999992; scale-x: 0.850000024; scale-y: 0.925000012; }
        frame 214 { x: 24.7999992; y: 59.9000015; skew-x: 57.7000008; skew-y: 59.9000015; scale-x: 0.860000014; scale-y: 0.999000013; }
    }
    Track {
        source-name: "Zombie_ladder_outerarm_upper";
        frame-count: 215;
        frame 0 { x: 45.2000008; y: 42; skew-x: 17; skew-y: 1.79999995; scale-x: 0.850000024; scale-y: 0.901000023; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_UPPER; }
        frame 1 { x: 45; skew-x: 13.3000002; skew-y: 0.600000024; scale-x: 0.848999977; scale-y: 0.893000007; image: none; }
        frame 2 { x: 44.9000015; y: -10000; skew-x: 9.80000019; skew-y: -0.200000003; scale-x: -10000; scale-y: 0.884000003; }
        frame 3 { x: -10000; y: 42.0999985; skew-x: 6.0999999; skew-y: -1.20000005; scale-x: 0.850000024; scale-y: 0.875999987; }
        frame 4 { y: 42.2999992; skew-x: 2.5; skew-y: -2.20000005; scale-x: -10000; scale-y: 0.866999984; }
        frame 5 { x: 45; y: -10000; skew-x: -0.699999988; skew-y: -3.4000001; scale-y: 0.85799998; }
        frame 6 { x: 45.5; y: 42.5; skew-x: -4.5; skew-y: -4.5; scale-y: 0.850000024; }
        frame 7 { x: 45.9000015; y: -10000; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: -10000; }
        frame 8 { x: 46.2000008; y: 42.5999985; skew-x: 0.5; skew-y: 0.5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 9 { x: 46.5; y: 42.9000015; skew-x: 3.29999995; skew-y: 3.29999995; scale-x: -10000; scale-y: -10000; }
        frame 10 { x: 47; y: 43.0999985; skew-x: 5.80000019; skew-y: 5.80000019; }
        frame 11 { x: 47.5; y: 43.2999992; skew-x: 8.30000019; skew-y: 8.30000019; }
        frame 12 { x: 47.9000015; y: 43.4000015; skew-x: 11.1000004; skew-y: 11.1000004; }
        frame 13 { x: 47.2999992; y: 43.5; skew-x: 10.5; skew-y: 9.60000038; }
        frame 14 { x: 46.7000008; y: 43.9000015; skew-x: 9.80000019; skew-y: 8.30000019; scale-x: 0.850000024; }
        frame 15 { x: 46.2000008; y: 44; skew-x: 9.30000019; skew-y: 7; scale-x: -10000; }
        frame 16 { x: 45.5999985; y: 44.2000008; skew-x: 8.80000019; skew-y: 5.5999999; scale-x: 0.851000011; }
        frame 17 { x: 45; y: 44.4000015; skew-x: 8.10000038; skew-y: 4.30000019; scale-x: 0.851999998; }
        frame 18 { x: 44.5; y: 44.7999992; skew-x: 7.69999981; skew-y: 3; scale-x: 0.852999985; scale-y: 0.850000024; }
        frame 19 { x: 44.5999985; y: 44.4000015; skew-x: 9.10000038; skew-y: 2.79999995; scale-x: 0.851999998; scale-y: 0.85799998; }
        frame 20 { x: 44.7999992; y: 43.9000015; skew-x: 10.8000002; skew-y: 2.5; scale-x: 0.851000011; scale-y: 0.866999984; }
        frame 21 { x: 45; y: 43.4000015; skew-x: 12.3000002; skew-y: 2.29999995; scale-x: -10000; scale-y: 0.875999987; }
        frame 22 { x: 45.2000008; y: 43; skew-x: 13.8000002; skew-y: 2; scale-x: 0.850000024; scale-y: 0.884000003; }
        frame 23 { x: 45.2999992; y: 42.5999985; skew-x: 15.3000002; skew-y: 1.79999995; scale-x: -10000; scale-y: 0.893000007; }
        frame 24 { x: 45.2000008; y: 42; skew-x: 17; skew-y: -10000; scale-y: 0.901000023; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 26 { x: 45.7999992; y: 42; skew-x: 13.3000002; skew-y: 2; scale-x: 0.848999977; scale-y: 0.888000011; }
        frame 27 { x: 46.4000015; y: -10000; skew-x: 9.80000019; skew-y: 2.29999995; scale-x: -10000; scale-y: 0.875; }
        frame 28 { x: 47; y: 42.0999985; skew-x: 6.30000019; skew-y: 2.5; scale-y: 0.861999989; }
        frame 29 { x: 48; y: 42.2000008; skew-x: 2.9000001; skew-y: 2.9000001; scale-y: 0.848999977; }
        frame 30 { x: 49.4000015; y: 40.7999992; skew-x: 7.0999999; skew-y: 7.0999999; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 31 { x: 50.7999992; y: 39.5; skew-x: 11.5; skew-y: 11.5; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: 52.2999992; y: 38.2999992; skew-x: 15.8000002; skew-y: 15.8000002; }
        frame 33 { x: 53.7999992; y: 37.0999985; skew-x: 20.2000008; skew-y: 20.2000008; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 34 { x: 54.5999985; y: 37; skew-x: 22.6000004; skew-y: 22.6000004; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 35 { x: 55.2999992; skew-x: 25; skew-y: 25; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 56; y: 36.9000015; skew-x: 27.2999992; skew-y: 27.2999992; }
        frame 37 { x: 56.7999992; y: -10000; skew-x: 29.7999992; skew-y: 29.7999992; }
        frame 38 { x: 57.5; skew-x: 32.2999992; skew-y: 32.2999992; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 39 { x: 55.5999985; y: 37.4000015; skew-x: 30.6000004; skew-y: 30.6000004; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 40 { x: 53.9000015; y: 38; skew-x: 28.7999992; skew-y: 28.7999992; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 41 { x: 52; y: 38.5; skew-x: 27; skew-y: 27; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 50.2999992; y: 39; skew-x: 25.2999992; skew-y: 25.2999992; }
        frame 43 { x: 48.5999985; y: 39.5; skew-x: 23.5; skew-y: 23.5; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 44 { x: 47.2999992; y: 40.7000008; skew-x: 22.7999992; skew-y: 22.7999992; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 45 { x: 46; y: 41.7999992; skew-x: 22; skew-y: 22; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 44.5999985; y: 43; skew-x: 21.2999992; skew-y: 21.2999992; }
        frame 47 { x: 43.2999992; y: 44.0999985; skew-x: 20.6000004; skew-y: 20.6000004; }
        frame 48 { x: 44.2999992; y: 43.2999992; skew-x: 21.1000004; skew-y: 21.1000004; }
        frame 49 { x: 45.4000015; y: 42.2999992; skew-x: 21.7999992; skew-y: 21.7999992; }
        frame 50 { x: 46.4000015; y: 41.4000015; skew-x: 22.2999992; skew-y: 22.2999992; }
        frame 51 { x: 47.5; y: 40.5; skew-x: 22.7999992; skew-y: 22.7999992; }
        frame 52 { x: 48.5999985; y: 39.5; skew-x: 23.5; skew-y: 23.5; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 53 { x: 50.2999992; y: 39; skew-x: 25.2999992; skew-y: 25.2999992; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 54 { x: 52; y: 38.5; skew-x: 27; skew-y: 27.1000004; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: 53.7999992; y: 38; skew-x: 28.7999992; skew-y: 28.7999992; }
        frame 56 { x: 55.5; y: 37.5999985; skew-x: 30.6000004; skew-y: 30.6000004; }
        frame 57 { x: 57.2999992; y: 37.0999985; skew-x: 32.2999992; skew-y: 32.2999992; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 58 { x: 56.4000015; y: 37; skew-x: 29.7999992; skew-y: 29.7999992; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 59 { x: 55.5; y: 36.9000015; skew-x: 27.2999992; skew-y: 27.2999992; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 54.7999992; y: 36.7000008; skew-x: 25; skew-y: 25; }
        frame 61 { x: 54; y: 36.5999985; skew-x: 22.6000004; skew-y: 22.6000004; scale-y: 0.84799999; }
        frame 62 { x: 53.2999992; y: -10000; skew-x: 20.2000008; skew-y: 20.2000008; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 63 { x: 51.2000008; y: 38.5999985; skew-x: 14.8000002; skew-y: 14.8000002; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 64 { x: 49.2999992; y: 40.5; skew-x: 9.80000019; skew-y: 9.80000019; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: 47.4000015; y: 42.5999985; skew-x: 4.5; skew-y: 4.5; }
        frame 66 { x: 45.5; y: 45; skew-x: -0.600000024; skew-y: -0.600000024; }
        frame 67 { x: -10000; y: 44.4000015; skew-x: 2.79999995; skew-y: 0; scale-x: 0.848999977; scale-y: 0.859000027; }
        frame 68 { x: 45.2999992; y: 43.7999992; skew-x: 6.30000019; skew-y: 0.300000012; scale-x: -10000; scale-y: 0.870000005; }
        frame 69 { x: 45.4000015; y: 43.2999992; skew-x: 9.80000019; skew-y: 0.800000012; scale-y: 0.879999995; }
        frame 70 { x: -10000; y: 42.7999992; skew-x: 13.3000002; skew-y: 1.29999995; scale-y: 0.890999973; }
        frame 71 { x: 45.2000008; y: 42; skew-x: 17; skew-y: 1.79999995; scale-x: 0.850000024; scale-y: 0.901000023; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: 46.7000008; y: 40.5; skew-x: 16.2999992; skew-y: 2.5; scale-x: 0.851999998; scale-y: 0.888000011; }
        frame 74 { x: 48.2000008; y: 38.9000015; skew-x: 15.8000002; skew-y: 3.29999995; scale-x: 0.855000019; scale-y: 0.875; }
        frame 75 { x: 49.7999992; y: 37.4000015; skew-x: 15.3000002; skew-y: 4.30000019; scale-x: 0.85799998; scale-y: 0.861999989; }
        frame 76 { x: 51.5; y: 36; skew-x: 14.8999996; skew-y: 5.0999999; scale-x: 0.861000001; scale-y: 0.848999977; }
        frame 77 { x: 51.2999992; y: 35; skew-x: 11.1000004; skew-y: -0.699999988; scale-x: 0.867999971; scale-y: -10000; }
        frame 78 { x: 51.2000008; y: 34.2000008; skew-x: 7.5; skew-y: -6.69999981; scale-x: 0.875999987; }
        frame 79 { x: -10000; y: 33.5; skew-x: 3.79999995; skew-y: -12.5; scale-x: 0.884000003; }
        frame 80 { x: 51.5; y: 33; skew-x: 0.200000003; skew-y: -18.6000004; scale-x: 0.89200002; scale-y: 0.850000024; }
        frame 81 { x: 44.2000008; y: 38.5999985; skew-x: -16.5; skew-y: -26; scale-x: 0.867999971; scale-y: 0.847000003; }
        frame 82 { x: 38.0999985; y: 44; skew-x: -33.5; skew-y: -33.5; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 83 { x: 32.4000015; y: 47; skew-x: -23.5; skew-y: -23.5; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 84 { x: 31.6000004; y: 49.0999985; skew-x: -28; skew-y: -28; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 85 { x: 30.8999996; y: 51.2000008; skew-x: -32.5; skew-y: -32.5; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 86 { x: 30.2000008; y: 53.4000015; skew-x: -37; skew-y: -37; scale-x: -10000; scale-y: -10000; }
        frame 87 { x: 29.5; y: 55.4000015; skew-x: -41.5; skew-y: -41.5; }
        frame 88 { x: 31.2000008; y: 53.5; skew-x: -37.2999992; skew-y: -37.2999992; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 89 { x: 32.5999985; y: 51.5999985; skew-x: -33.2000008; skew-y: -33.2000008; scale-x: -10000; scale-y: 0.846000016; }
        frame 90 { x: 34.4000015; y: 49.5999985; skew-x: -29; skew-y: -29; scale-x: 0.846000016; scale-y: -10000; }
        frame 91 { x: 36; y: 47.7999992; skew-x: -25; skew-y: -25; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 92 { x: 37.5; y: 46.4000015; skew-x: -14.3999996; skew-y: -18.2000008; scale-x: -10000; scale-y: 0.860000014; }
        frame 93 { x: 39.5999985; y: 44.7999992; skew-x: -3.9000001; skew-y: -11.3999996; scale-x: 0.84799999; scale-y: 0.874000013; }
        frame 94 { x: 42.2999992; y: 43.4000015; skew-x: 6.30000019; skew-y: -4.69999981; scale-x: 0.848999977; scale-y: 0.888000011; }
        frame 95 { x: 45.2000008; y: 42; skew-x: 17; skew-y: 1.79999995; scale-x: 0.850000024; scale-y: 0.901000023; }
        frame 96 { x: 45.0999985; y: 41.7000008; skew-x: -10000; skew-y: -10000; scale-x: 0.898999989; scale-y: -10000; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_UPPER2; }
        frame 97 { x: 46.2000008; y: 40.5999985; skew-x: 17.2999992; skew-y: 5.80000019; scale-x: 0.885999978; scale-y: 0.888000011; image: none; }
        frame 98 { x: 47.2000008; y: 39.5999985; skew-x: 17.5; skew-y: 9.80000019; scale-x: 0.873000026; scale-y: 0.874000013; }
        frame 99 { x: 48.0999985; y: 38.7000008; skew-x: 17.7999992; skew-y: 14; scale-x: 0.860000014; scale-y: 0.861000001; }
        frame 100 { x: 49.4000015; y: 38; skew-x: 18.1000004; skew-y: 18.1000004; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 101 { x: 48.0999985; y: 36.5999985; skew-x: 21; skew-y: 21; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 102 { x: 46.7999992; y: 35.4000015; skew-x: 24; skew-y: 24; scale-x: -10000; scale-y: -10000; }
        frame 103 { x: 45.5; y: 34.2000008; skew-x: 26.7999992; skew-y: 26.7999992; scale-x: 0.845000029; scale-y: 0.845000029; }
        frame 104 { x: 44.4000015; y: 33; skew-x: 29.8999996; skew-y: 29.8999996; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 105 { x: 37.5999985; skew-x: 23.7999992; skew-y: 23.7999992; scale-x: 0.842999995; scale-y: 0.842999995; }
        frame 106 { x: 30.8999996; skew-x: 17.7999992; skew-y: 17.7999992; scale-x: 0.842000008; scale-y: -10000; }
        frame 107 { x: 24.2000008; y: 33.2999992; skew-x: 11.8000002; skew-y: 11.8000002; scale-x: 0.841000021; scale-y: 0.842000008; }
        frame 108 { x: 17.7000008; y: 33.5999985; skew-x: 5.69999981; skew-y: 5.80000019; scale-x: -10000; scale-y: 0.841000021; }
        frame 109 { x: 11.8999996; y: 36.5; skew-x: -0.5; skew-y: -0.400000006; scale-x: 0.839999974; scale-y: -10000; }
        frame 110 { x: 6.0999999; y: 39.5999985; skew-x: -6.9000001; skew-y: -6.9000001; scale-x: 0.838999987; scale-y: 0.839999974; }
        frame 111 { x: 0.400000006; y: 43; skew-x: -13.3999996; skew-y: -13.3999996; scale-x: 0.838; scale-y: 0.838999987; }
        frame 112 { x: -4.80000019; y: 46.2999992; skew-x: -19.8999996; skew-y: -19.7999992; scale-x: -10000; scale-y: -10000; }
        frame 113 { x: -12.1000004; y: 53; skew-x: -26.5; skew-y: -26.3999996; scale-x: 0.836000025; scale-y: 0.837000012; }
        frame 114 { x: -18.8999996; y: 60; skew-x: -33.2000008; skew-y: -33; scale-x: 0.834999979; scale-y: -10000; }
        frame 115 { x: -25.7000008; y: 67; skew-x: -39.7999992; skew-y: -39.5; scale-x: 0.833999991; scale-y: 0.836000025; }
        frame 116 { x: -32.2000008; y: 73.9000015; skew-x: -46.5; skew-y: -46.2999992; scale-x: 0.834999979; scale-y: -10000; }
        frame 117 { x: -39.7000008; y: 97; skew-x: -72.0999985; skew-y: -72.0999985; scale-x: 0.82099998; scale-y: 0.828000009; }
        frame 118 { x: -44.2999992; y: 118.5; skew-x: -97.4000015; skew-y: -97.6999969; scale-x: 0.809000015; scale-y: 0.819999993; }
        frame 119 { x: -50.5999985; y: 115.300003; skew-x: -62.0999985; skew-y: -62.5999985; scale-x: 0.796999991; scale-y: 0.81400001; }
        frame 120 { x: -50.9000015; y: 110.5; skew-x: -26.7000008; skew-y: -27.5; scale-x: 0.787; scale-y: 0.809000015; }
        frame 121 { x: -45.4000015; y: 108; skew-x: 8.5; skew-y: 7.5; scale-x: 0.77700001; scale-y: 0.80400002; }
        frame 122 { x: -45.7999992; y: 107.099998; skew-x: 6.80000019; skew-y: 6; scale-x: 0.786000013; scale-y: 0.810000002; }
        frame 123 { x: -46.2000008; y: 106.300003; skew-x: 5.30000019; skew-y: 4.5; scale-x: 0.795000017; scale-y: 0.814999998; }
        frame 124 { x: -46.5999985; y: 105.5; skew-x: 3.79999995; skew-y: 3.0999999; scale-x: 0.80400002; scale-y: 0.82099998; }
        frame 125 { x: -46.9000015; y: 104.699997; skew-x: 2.0999999; skew-y: 1.79999995; scale-x: 0.811999977; scale-y: 0.825999975; }
        frame 126 { x: -47.2999992; y: 103.800003; skew-x: 0.5; skew-y: 0.300000012; scale-x: 0.82099998; scale-y: 0.832000017; }
        frame 127 { x: -47.7000008; y: 103; skew-x: -0.699999988; skew-y: -0.899999976; scale-x: 0.829999983; scale-y: 0.837000012; }
        frame 128 { x: -47.9000015; y: 102.300003; skew-x: -2.4000001; skew-y: -2.20000005; scale-x: 0.838999987; scale-y: 0.842999995; }
        frame 129 { x: -48.4000015; y: 101.599998; skew-x: -4; skew-y: -3.70000005; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 130 { x: -48; y: 104.800003; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.828000009; scale-y: 0.833999991; }
        frame 131 { x: -47.7000008; y: 108; skew-x: -5.0999999; skew-y: -5.4000001; scale-x: 0.808000028; scale-y: 0.819999993; }
        frame 132 { x: 44; y: 43.7000008; skew-x: 0; skew-y: 0; scale-x: 0.850000024; scale-y: 0.850000024; image: IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_UPPER; }
        frame 133 { x: 44.5; y: 43.4000015; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 134 { x: 45; y: 43; }
        frame 135 { x: 45.4000015; y: 42.5999985; }
        frame 136 { x: 45.7999992; y: 42.2000008; }
        frame 137 { x: 46.2000008; y: 41.4000015; skew-x: -2.20000005; skew-y: -2.20000005; }
        frame 138 { x: 46.5999985; y: 40.5999985; skew-x: -4.4000001; skew-y: -4.4000001; }
        frame 139 { x: 47.0999985; y: 39.9000015; skew-x: -6.69999981; skew-y: -6.69999981; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 140 { x: 47.7000008; y: 39.0999985; skew-x: -8.89999962; skew-y: -8.89999962; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 141 { x: 48; y: 39; skew-x: -10.1999998; skew-y: -10.1999998; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 142 { x: 48.4000015; y: -10000; skew-x: -11.3999996; skew-y: -11.3999996; scale-x: -10000; scale-y: -10000; }
        frame 143 { x: 48.5999985; skew-x: -12.6999998; skew-y: -12.6999998; }
        frame 144 { x: 49; y: 39; skew-x: -13.8999996; skew-y: -13.8999996; }
        frame 145 { x: 49.2000008; y: -10000; skew-x: -15.3000002; skew-y: -15.3000002; }
        frame 146 { x: 47.7999992; y: 39.7000008; skew-x: -13.1999998; skew-y: -13.1999998; }
        frame 147 { x: 46.2999992; y: 40.5; skew-x: -11.3999996; skew-y: -11.3999996; }
        frame 148 { x: 44.9000015; y: 41.2999992; skew-x: -9.39999962; skew-y: -9.39999962; }
        frame 149 { x: 43.4000015; y: 42.2999992; skew-x: -7.69999981; skew-y: -7.69999981; }
        frame 150 { x: 42; y: 43.0999985; skew-x: -5.80000019; skew-y: -5.80000019; }
        frame 151 { x: 40.9000015; y: 44.0999985; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 152 { x: 39.7000008; y: 45.2999992; skew-x: -10000; skew-y: -10000; }
        frame 153 { x: 38.5999985; y: 46.2999992; }
        frame 154 { x: 37.5; y: 47.4000015; skew-x: -5.80000019; skew-y: -5.80000019; }
        frame 155 { x: 38.5999985; y: 46.4000015; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 156 { x: 39.7999992; y: 45.4000015; skew-x: -10000; skew-y: -10000; }
        frame 157 { x: 40.9000015; y: 44.4000015; }
        frame 158 { x: 42; y: 43.4000015; }
        frame 159 { x: 43.2000008; y: 42.4000015; skew-x: -5.80000019; skew-y: -5.80000019; }
        frame 160 { x: 44.7999992; y: 41.5; skew-x: -3.20000005; skew-y: -3.20000005; }
        frame 161 { x: 46.0999985; y: 40.7999992; skew-x: -0.699999988; skew-y: -0.699999988; }
        frame 162 { x: 47.5; y: 40.2999992; skew-x: 1.5; skew-y: 1.5; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 163 { x: 49; y: 39.5; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: -10000; scale-y: -10000; }
        frame 164 { x: 50.5; y: 38.7999992; skew-x: 6.4000001; skew-y: 6.4000001; }
        frame 165 { x: 50.2999992; y: 38.5; skew-x: 7; skew-y: 7; }
        frame 166 { x: 50.0999985; y: 38.2000008; skew-x: 7.5; skew-y: 7.5; }
        frame 167 { x: 50; y: 37.9000015; skew-x: 8.10000038; skew-y: 8.10000038; }
        frame 168 { x: 49.9000015; y: 37.5999985; skew-x: 8.80000019; skew-y: 8.80000019; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 169 { x: -10000; y: 37.2999992; skew-x: 9.39999962; skew-y: 9.39999962; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 170 { x: 48.2000008; y: 39.2000008; skew-x: 7.5; skew-y: 7.5; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 171 { x: 46.5; y: 41.0999985; skew-x: 5.80000019; skew-y: 5.80000019; scale-x: -10000; scale-y: -10000; }
        frame 172 { x: 44.9000015; y: 43.0999985; skew-x: 4; skew-y: 4; }
        frame 173 { x: 43.2000008; y: 45.0999985; skew-x: 2.4000001; skew-y: 2.4000001; }
        frame 174 { x: 43.4000015; y: 44.7999992; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 175 { x: 43.5; y: 44.5; skew-x: 1.29999995; skew-y: 1.29999995; scale-x: -10000; scale-y: -10000; }
        frame 176 { x: 43.5999985; y: 44.0999985; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 177 { x: 43.9000015; y: 44; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: -10000; scale-y: -10000; }
        frame 178 { x: 44; y: 43.7000008; skew-x: 0; skew-y: 0; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 179 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 180 { x: 44.7999992; y: 42.7999992; skew-x: -2.4000001; skew-y: -2.4000001; }
        frame 181 { x: 45.5999985; y: 41.9000015; skew-x: -5; skew-y: -5; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 182 { x: 46.4000015; y: 41; skew-x: -7.69999981; skew-y: -7.69999981; scale-x: -10000; scale-y: -10000; }
        frame 183 { x: 47.2999992; y: 40.2000008; skew-x: -10.1999998; skew-y: -10.1999998; }
        frame 184 { x: 48.0999985; y: 39.4000015; skew-x: -12.6999998; skew-y: -12.6999998; }
        frame 185 { x: 49; y: 38.5999985; skew-x: -15.3999996; skew-y: -15.3999996; }
        frame 186 { x: 50; y: 37.5999985; skew-x: -18; skew-y: -18; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 187 { x: 51; y: 36.9000015; skew-x: -20.7000008; skew-y: -20.7000008; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 188 { x: 42.7000008; y: 40.9000015; skew-x: -29; skew-y: -29; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 189 { x: 34.7999992; y: 44.9000015; skew-x: -37.2000008; skew-y: -37.2000008; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 190 { x: 27.2999992; y: 48.9000015; skew-x: -45.5; skew-y: -45.5; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 191 { x: 26.3999996; y: 52.7999992; skew-x: -53.7999992; skew-y: -53.7999992; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 192 { x: 25.7000008; y: 56.5999985; skew-x: -62.0999985; skew-y: -62.0999985; scale-x: -10000; scale-y: -10000; }
        frame 193 { x: 25.6000004; y: 60.2999992; skew-x: -70.4000015; skew-y: -70.4000015; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 194 { x: -10000; y: 63.5999985; skew-x: -78.5999985; skew-y: -78.5999985; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 195 { x: 26.1000004; y: 61.5; skew-x: -68.8000031; skew-y: -68.8000031; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 196 { x: 27.1000004; y: 59.2000008; skew-x: -59; skew-y: -59; scale-x: 0.846000016; scale-y: 0.846000016; }
        frame 197 { x: 28.5; y: 56.5; skew-x: -49.0999985; skew-y: -49.0999985; scale-x: -10000; scale-y: -10000; }
        frame 198 { x: 30.5; y: 53.9000015; skew-x: -39.2999992; skew-y: -39.2999992; scale-x: 0.847000003; scale-y: 0.847000003; }
        frame 199 { x: 33; y: 51.2000008; skew-x: -29.5; skew-y: -29.3999996; scale-x: -10000; scale-y: -10000; }
        frame 200 { x: 36.2999992; y: 48.4000015; skew-x: -19.5; skew-y: -19.5; scale-x: 0.84799999; scale-y: 0.84799999; }
        frame 201 { x: 40; y: 46; skew-x: -9.69999981; skew-y: -9.69999981; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 202 { x: 44; y: 43.7000008; skew-x: 0; skew-y: 0; scale-x: 0.850000024; scale-y: 0.850000024; }
        frame 203 { x: 45.2000008; y: 42; skew-x: 17; skew-y: 1.79999995; scale-x: -10000; scale-y: 0.901000023; }
        frame 204 { x: 47.9000015; y: 37.9000015; skew-x: 26.2999992; skew-y: 11.1000004; scale-x: 0.84799999; scale-y: 0.899999976; }
        frame 205 { x: 51; y: 34.2000008; skew-x: 35.9000015; skew-y: 20.6000004; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 54.2000008; y: 31.2999992; skew-x: 45.4000015; skew-y: 30.1000004; scale-x: 0.847000003; scale-y: 0.898999989; }
        frame 207 { x: 57.5999985; y: 28.8999996; skew-x: 54.9000015; skew-y: 39.5999985; scale-x: -10000; scale-y: 0.898000002; }
        frame 208 { x: 61; y: 27.2000008; skew-x: 64.4000015; skew-y: 49.0999985; scale-y: -10000; }
        frame 209 { x: 64.3000031; y: 25.7999992; skew-x: 73.8000031; skew-y: 58.5999985; scale-y: 0.898999989; }
        frame 210 { x: 58.0999985; y: 29.7000008; skew-x: 65.3000031; skew-y: 50; scale-x: 0.846000016; scale-y: 0.897000015; }
        frame 211 { x: 53.5999985; y: 32.9000015; skew-x: 66.6999969; skew-y: 51.4000015; scale-x: 0.845000029; scale-y: 0.894999981; }
        frame 212 { x: 50.2000008; y: 35.5; skew-x: 73.9000015; skew-y: 58.5999985; scale-x: 0.843999982; scale-y: -10000; }
        frame 213 { x: 44.7999992; y: -10000; skew-x: 56.2999992; skew-y: 41; scale-x: -10000; scale-y: 0.890999973; }
        frame 214 { x: 38.2000008; y: 42.2999992; skew-x: 43.2000008; skew-y: 28; scale-x: 0.845000029; scale-y: 0.888000011; }
    }
    Track {
        source-name: "Zombie_ladder_innerarm_hand2";
        frame-count: 215;
        frame 0 { x: -4.5999999; y: 66.3000031; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_ZOMBIE_LADDER_INNERARM_HAND; }
        frame 1 { x: -4.0999999; y: 65.5999985; skew-x: 345.200012; skew-y: 345.200012; scale-x: 0.799000025; scale-y: 0.799000025; image: none; }
        frame 2 { x: -3.5; y: 64.8000031; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 3 { x: -3; y: 64.1999969; }
        frame 4 { x: -2.5; y: 63.4000015; }
        frame 5 { x: -1.89999998; y: 62.7000008; }
        frame 6 { x: -1.39999998; y: 62; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 7 { x: -2.0999999; y: 62.9000015; skew-x: 345.200012; skew-y: 345.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 8 { x: -2.9000001; y: 63.7999992; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 9 { x: -3.5999999; y: 64.6999969; }
        frame 10 { x: -4.4000001; y: 65.5; }
        frame 11 { x: -5.0999999; y: 66.4000015; }
        frame 12 { x: -5.9000001; y: 67.3000031; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 13 { x: -6; y: 68.3000031; skew-x: 343.700012; skew-y: 343.700012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 14 { x: -6.0999999; y: 69.4000015; skew-x: 342.399994; skew-y: 342.399994; scale-x: -10000; scale-y: -10000; }
        frame 15 { x: -6.19999981; y: 70.5999985; skew-x: 341; skew-y: 341; }
        frame 16 { x: -6.30000019; y: 71.5999985; skew-x: 339.700012; skew-y: 339.700012; }
        frame 17 { x: -6.4000001; y: 72.8000031; skew-x: 338.200012; skew-y: 338.200012; }
        frame 18 { x: -6.5; y: 73.8000031; skew-x: 336.899994; skew-y: 336.899994; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 19 { x: -6.19999981; y: 72.5999985; skew-x: 338.200012; skew-y: 338.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 20 { x: -5.9000001; y: 71.3000031; skew-x: 339.700012; skew-y: 339.700012; scale-x: -10000; scale-y: -10000; }
        frame 21 { x: -5.5999999; y: 70; skew-x: 341; skew-y: 341; }
        frame 22 { x: -5.19999981; y: 68.6999969; skew-x: 342.399994; skew-y: 342.399994; }
        frame 23 { x: -4.9000001; y: 67.5; skew-x: 343.700012; skew-y: 343.700012; }
        frame 24 { x: -4.5999999; y: 66.3000031; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 25 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 26 { x: -4; y: 65.8000031; skew-x: 345.200012; skew-y: 345.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 27 { x: -3.4000001; y: 65.3000031; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -2.70000005; y: 64.8000031; }
        frame 29 { x: -2.0999999; y: 64.3000031; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 30 { x: -2.4000001; y: 65; skew-x: 343.200012; skew-y: 343.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 31 { x: -2.79999995; y: 65.8000031; skew-x: 341.200012; skew-y: 341.200012; scale-x: -10000; scale-y: -10000; }
        frame 32 { x: -3.0999999; y: 66.4000015; skew-x: 339.399994; skew-y: 339.399994; }
        frame 33 { x: -3.5; y: 67.1999969; skew-x: 337.399994; skew-y: 337.399994; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 34 { x: -10000; y: 68.5999985; skew-x: 335.5; skew-y: 335.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 35 { y: 70.1999969; skew-x: 333.700012; skew-y: 333.700012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 36 { x: -3.4000001; y: 71.8000031; skew-x: 331.700012; skew-y: 331.700012; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: -10000; y: 73.3000031; skew-x: 329.700012; skew-y: 329.700012; }
        frame 38 { y: 75; skew-x: 327.799988; skew-y: 327.799988; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 39 { x: -4.9000001; y: 74; skew-x: 328.700012; skew-y: 328.700012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 40 { x: -6.4000001; y: 72.9000015; skew-x: 329.600006; skew-y: 329.600006; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: -7.9000001; y: 72; skew-x: 330.399994; skew-y: 330.399994; }
        frame 42 { x: -9.39999962; y: 71; skew-x: 331.200012; skew-y: 331.200012; }
        frame 43 { x: -11; y: 70; skew-x: 332.100006; skew-y: 332.100006; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 44 { x: -12.3000002; y: 72.0999985; skew-x: 332.200012; skew-y: 332.200012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 45 { x: -13.6999998; y: 74.0999985; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: -15.1000004; y: 76.0999985; }
        frame 47 { x: -16.5; y: 78; skew-x: 332.100006; skew-y: 332.100006; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 48 { x: -15.6999998; y: 76.9000015; skew-x: 332.200012; skew-y: 332.200012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 49 { x: -15; y: 75.8000031; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: -14.1999998; y: 74.5999985; }
        frame 51 { x: -13.5; y: 73.5; }
        frame 52 { x: -12.6999998; y: 72.3000031; skew-x: 332.100006; skew-y: 332.100006; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 53 { x: -11.3000002; y: 71.6999969; skew-x: 332.200012; skew-y: 332.200012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 54 { x: -9.89999962; y: 71; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 55 { x: -8.5; y: 70.3000031; }
        frame 56 { x: -7.0999999; y: 69.6999969; }
        frame 57 { x: -5.69999981; y: 69; skew-x: 332.100006; skew-y: 332.100006; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 58 { x: -10000; y: 68.1999969; skew-x: 333.700012; skew-y: 333.700012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 59 { y: 67.1999969; skew-x: 335.399994; skew-y: 335.399994; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: -5.5999999; y: 66.4000015; skew-x: 337; skew-y: 337; }
        frame 61 { x: -10000; y: 65.5; skew-x: 338.700012; skew-y: 338.700012; }
        frame 62 { y: 64.5999985; skew-x: 340.200012; skew-y: 340.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 63 { x: -5; y: 68.0999985; skew-x: 338.399994; skew-y: 338.399994; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 64 { x: -4.4000001; y: 71.5; skew-x: 336.399994; skew-y: 336.399994; scale-x: -10000; scale-y: -10000; }
        frame 65 { x: -3.70000005; y: 75; skew-x: 334.700012; skew-y: 334.700012; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 66 { x: -3.0999999; y: 78.3000031; skew-x: 332.600006; skew-y: 332.600006; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 67 { x: -3.5; y: 75.8000031; skew-x: 335.200012; skew-y: 335.200012; scale-x: -10000; scale-y: -10000; }
        frame 68 { x: -3.70000005; y: 73.3000031; skew-x: 337.700012; skew-y: 337.700012; }
        frame 69 { x: -4.0999999; y: 71; skew-x: 340.200012; skew-y: 340.200012; }
        frame 70 { x: -4.30000019; y: 68.5999985; skew-x: 342.700012; skew-y: 342.700012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 71 { x: -4.5999999; y: 66.3000031; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 72 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 73 { x: -2.5; y: 62; skew-x: 347.200012; skew-y: 347.200012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 74 { x: -0.5; y: 57.7000008; skew-x: 349.200012; skew-y: 349.200012; scale-x: -10000; scale-y: -10000; }
        frame 75 { x: 1.5; y: 53.5; skew-x: 351.200012; skew-y: 351.200012; }
        frame 76 { x: 3.5; y: 49.2999992; skew-x: 353; skew-y: 353; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 77 { x: 6.19999981; y: 46.2999992; skew-x: 351.700012; skew-y: 351.700012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 78 { x: 9; y: 43.4000015; skew-x: 350.399994; skew-y: 350.399994; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 11.6000004; y: 40.4000015; skew-x: 349; skew-y: 349; }
        frame 80 { x: 14.1999998; y: 37.4000015; skew-x: 347.5; skew-y: 347.5; }
        frame 81 { x: 10.3999996; y: 58.2000008; skew-x: 332.200012; skew-y: 332.200012; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 82 { x: 7.19999981; y: 79.5999985; skew-x: 316.700012; skew-y: 316.700012; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 83 { x: 4.5999999; y: 101; skew-x: 301.299988; skew-y: 301.299988; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 84 { x: 5; y: 102; skew-x: 300.100006; skew-y: 300.100006; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 85 { x: 5.4000001; y: 102.800003; skew-x: 298.799988; skew-y: 298.799988; scale-x: -10000; scale-y: -10000; }
        frame 86 { x: 5.80000019; y: 103.699997; skew-x: 297.600006; skew-y: 297.600006; }
        frame 87 { x: 6.30000019; y: 104.599998; skew-x: 296.299988; skew-y: 296.299988; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 88 { x: 5.19999981; y: 101.599998; skew-x: 299.299988; skew-y: 299.299988; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 89 { x: 4; y: 98.8000031; skew-x: 302.100006; skew-y: 302.100006; scale-x: -10000; scale-y: -10000; }
        frame 90 { x: 3; y: 95.8000031; skew-x: 305.100006; skew-y: 305.100006; }
        frame 91 { x: 1.89999998; y: 92.8000031; skew-x: 308.100006; skew-y: 308.100006; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 92 { x: -0; y: 86.0999985; skew-x: 317.399994; skew-y: 317.399994; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 93 { x: -1.70000005; y: 79.3000031; skew-x: 326.600006; skew-y: 326.600006; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 94 { x: -3.20000005; y: 72.6999969; skew-x: 335.899994; skew-y: 335.899994; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 95 { x: -4.5999999; y: 66.3000031; skew-x: 345; skew-y: 345; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 96 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 97 { cel: -10000; }
        frame 203 { cel: 0; }
        frame 204 { x: -1.20000005; y: 54.2999992; skew-x: 354.5; skew-y: 354.5; scale-x: 0.799000025; scale-y: 0.799000025; cel: -10000; }
        frame 205 { x: 2; y: 42.4000015; skew-x: 363.799988; skew-y: 363.799988; scale-x: -10000; scale-y: -10000; }
        frame 206 { x: 5.5999999; y: 30.7999992; skew-x: 373.299988; skew-y: 373.299988; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 207 { x: 9.30000019; y: 19.2999992; skew-x: 382.799988; skew-y: 382.799988; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 208 { x: 13; y: 8.30000019; skew-x: 392.299988; skew-y: 392.299988; scale-x: -10000; scale-y: -10000; }
        frame 209 { x: 16.7000008; y: -2.29999995; skew-x: 401.799988; skew-y: 401.799988; }
        frame 210 { x: 5; y: 11.8999996; skew-x: 388.100006; skew-y: 388.100006; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 211 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 212 { cel: -10000; }
    }
}
