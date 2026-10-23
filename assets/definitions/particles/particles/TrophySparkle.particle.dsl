export component TrophySparkle {
    kind: particle;
    source-name: "trophysparkle";
    Emitter {
        images: ["particles/frames/ice_sparkles_r0_c0.png","particles/frames/ice_sparkles_r0_c1.png","particles/frames/ice_sparkles_r0_c2.png"];
        name: "Sparkle";
        imageFrames: 3;
        animated: 0;
        emitterType: Circle;
        systemLoops: 1;
        spawnRate: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 40; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 70; high: 100; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.5; low: -100; high: -100; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        images: ["particles/frames/ice_sparkles_r0_c0.png","particles/frames/ice_sparkles_r0_c1.png","particles/frames/ice_sparkles_r0_c2.png"];
        name: "SparkleBottom";
        imageFrames: 3;
        animated: 0;
        emitterType: Circle;
        systemLoops: 1;
        spawnRate: nodes {
            { time: 0; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 40; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 130; high: 130; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 80; high: 150; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.5; low: -100; high: -100; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
    }
}
