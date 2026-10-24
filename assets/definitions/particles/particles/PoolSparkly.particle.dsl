export component PoolSparkly {
    kind: particle;
    source-name: "poolsparkly";
    Emitter {
        image: "IMAGE_POOLSPARKLY";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemLoops: 1;
        spawnRate: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: 0; high: 290; curve: Linear; distribution: FastInOutWeak; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 0; high: 135; curve: Linear; distribution: Linear; }
        }
        emitterSkewX: nodes {
            { time: 0; low: -0.3; high: -0.3; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 80; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.3; high: 0.6; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 0.4; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.5; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.9; low: 0.4; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.3; high: 0.6; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Velocity;
            x: nodes {
                { time: 0; low: 0; high: -10; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: -2; high: 2; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_POOLSPARKLY";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemLoops: 1;
        spawnRate: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -330; high: 260; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 0; high: 135; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 60; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.3; high: 0.6; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 0.4; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.5; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0.4; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.3; high: 0.6; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Velocity;
            x: nodes {
                { time: 0; low: 0; high: -5; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: -2; high: 2; curve: Linear; distribution: Linear; }
            }
        }
    }
}
