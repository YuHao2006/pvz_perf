export component Pow {
    kind: particle;
    source-name: "pow";
    Emitter {
        image: "IMAGE_POW";
        name: "Pow";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
            { time: 0.07; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 0.5; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 0.5; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}
