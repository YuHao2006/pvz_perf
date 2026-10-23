export component PlantingPool {
    kind: particle;
    source-name: "plantingpool";
    Emitter {
        images: ["particles/frames/waterparticle_r0_c0.png","particles/frames/waterparticle_r0_c1.png","particles/frames/waterparticle_r0_c2.png","particles/frames/waterparticle_r0_c3.png","particles/frames/waterparticle_r0_c4.png","particles/frames/waterparticle_r0_c5.png"];
        name: "PlantingPool";
        imageFrames: 6;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 16; high: 16; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.85; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 200; high: 300; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 110; high: 250; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -100; high: 100; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0; low: 0.03; high: 0.03; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0.01; high: 0.01; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 8; high: 8; curve: Linear; distribution: Linear; }
            }
        }
    }
}
