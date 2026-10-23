export component SeedPacketPick {
    kind: particle;
    source-name: "seedpacketpick";
    Emitter {
        image: "IMAGE_DOWNARROW";
        name: "Arrow";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemLoops: 1;
        particleLoops: 1;
        systemDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 25; high: 25; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 80; high: 80; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: Linear; distribution: Linear; }
        }
        particleStretch: nodes {
            { time: 0; low: -1; high: -1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            y: nodes {
                { time: 0; low: 0; high: 0; curve: EaseInOutWeak; distribution: Linear; }
                { time: 0.5; low: 10; high: 10; curve: EaseInOutWeak; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}
