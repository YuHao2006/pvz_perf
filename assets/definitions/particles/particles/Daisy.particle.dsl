export component Daisy {
    kind: particle;
    source-name: "daisy";
    Emitter {
        image: "IMAGE_DAISY";
        name: "Daisy";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        dieIfOverloaded: 1;
        systemDuration: nodes {
            { time: 0; low: 18500; high: 18500; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 6; high: 10; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -40; high: 40; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: -10; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 18000; high: 18000; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.004; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.995; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.005; low: 0.6; high: 1.2; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 0.005; low: -10; high: -10; curve: Linear; distribution: Linear; }
            }
        }
    }
}
