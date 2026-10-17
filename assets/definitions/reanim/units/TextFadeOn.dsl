export component TextFadeOn {
    fps: 12;
    Track {
        source-name: "anim_leave";
        frame-count: 40;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 19 { cel: 0; }
        frame 20 { cel: -10000; }
    }
    Track {
        source-name: "anim_enter";
        frame-count: 40;
        frame 20 { cel: -1; }
        frame 21 { cel: -10000; }
    }
    Track {
        source-name: "locator_text";
        frame-count: 40;
        frame 0 { x: 400; y: 300; scale-x: 2.00300002; scale-y: 2.00300002; alpha: 0; }
        frame 1 { x: -10000; y: -10000; scale-x: 1.96700001; scale-y: 1.96700001; alpha: 0.0500000007; }
        frame 2 { scale-x: 1.93299997; scale-y: 1.93299997; alpha: 0.109999999; }
        frame 3 { scale-x: 1.89900005; scale-y: 1.89900005; alpha: 0.159999996; }
        frame 4 { scale-x: 1.86600006; scale-y: 1.86600006; alpha: 0.209999993; }
        frame 5 { scale-x: 1.83399999; scale-y: 1.83399999; alpha: 0.25999999; }
        frame 6 { scale-x: 1.80200005; scale-y: 1.80200005; alpha: 0.319999993; }
        frame 7 { scale-x: 1.76900005; scale-y: 1.76900005; alpha: 0.370000005; }
        frame 8 { scale-x: 1.73500001; scale-y: 1.73500001; alpha: 0.419999987; }
        frame 9 { scale-x: 1.70000005; scale-y: 1.70000005; alpha: 0.469999999; }
        frame 10 { scale-x: 1.66299999; scale-y: 1.66299999; alpha: 0.529999971; }
        frame 11 { scale-x: 1.62199998; scale-y: 1.62199998; alpha: 0.579999983; }
        frame 12 { scale-x: 1.57599998; scale-y: 1.57599998; alpha: 0.629999995; }
        frame 13 { scale-x: 1.52400005; scale-y: 1.52400005; alpha: 0.680000007; }
        frame 14 { scale-x: 1.46399999; scale-y: 1.46399999; alpha: 0.74000001; }
        frame 15 { scale-x: 1.39499998; scale-y: 1.39499998; alpha: 0.790000021; }
        frame 16 { scale-x: 1.31599998; scale-y: 1.31599998; alpha: 0.839999974; }
        frame 17 { scale-x: 1.22399998; scale-y: 1.22399998; alpha: 0.889999986; }
        frame 18 { scale-x: 1.11899996; scale-y: 1.11899996; alpha: 0.949999988; }
        frame 19 { scale-x: 1.00100005; scale-y: 1.00100005; alpha: 1; }
        frame 20 { scale-x: -10000; scale-y: -10000; alpha: -10000; }
        frame 36 { alpha: 0.75; }
        frame 37 { alpha: 0.5; }
        frame 38 { alpha: 0.25; }
        frame 39 { alpha: 0; }
    }
}
