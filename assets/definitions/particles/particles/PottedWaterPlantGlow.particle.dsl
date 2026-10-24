export component PottedWaterPlantGlow {
    kind: particle;
    source-name: "pottedwaterplantglow";
    Emitter {
        image: "IMAGE_REANIM_POT_WATER_TOP_GLOW";
        name: "Ring";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemLoops: 1;
        additive: 1;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 150; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
            { time: 1; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.85; high: 0.85; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_GLOW_PARTICLE2";
        name: "Sparks";
        imageFrames: 1;
        animated: 0;
        emitterType: Circle;
        systemLoops: 1;
        additive: 1;
        spawnRate: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 40; high: 50; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 30; high: 60; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 40; high: 70; curve: Linear; distribution: Linear; }
        }
        launchAngle: nodes {
            { time: 0; low: 90; high: 270; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.3; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 0.9; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0; low: 0.015; high: 0.015; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0.015; high: 0.015; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            }
        }
    }
}
