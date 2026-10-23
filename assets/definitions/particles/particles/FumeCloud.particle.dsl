export component FumeCloud {
    kind: particle;
    source-name: "fumecloud";
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 21; high: 21; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: -2; high: -2; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 60; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 1.1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 0.6; low: 20; high: 300; curve: Linear; distribution: Linear; }
                { time: 1; low: 25; high: 310; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: -5; high: 5; curve: Linear; distribution: Linear; }
                { time: 1; low: -20; high: 20; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}
