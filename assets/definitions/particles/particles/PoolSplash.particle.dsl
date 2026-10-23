export component PoolSplash {
    kind: particle;
    source-name: "poolsplash";
    Emitter {
        images: ["particles/frames/waterparticle_r0_c1.png","particles/frames/waterparticle_r0_c2.png","particles/frames/waterparticle_r0_c3.png","particles/frames/waterparticle_r0_c4.png","particles/frames/waterparticle_r0_c5.png"];
        name: "PoolSplash";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        dieIfOverloaded: 1;
        systemDuration: nodes {
            { time: 0; low: 60; high: 60; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0.49; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.95; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1.5; high: 1.5; curve: Linear; distribution: Linear; }
        }
        particleStretch: nodes {
            { time: 0; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            y: nodes {
                { time: 0; low: 6; high: 6; curve: Linear; distribution: Linear; }
                { time: 0.5; low: -20; high: -20; curve: Linear; distribution: Linear; }
                { time: 1; low: -5; high: -5; curve: Linear; distribution: Linear; }
            }
        }
    }
}
