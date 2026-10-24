export component UmbrellaReflect {
    kind: particle;
    source-name: "umbrellareflect";
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 80; high: 80; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.85; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 430; high: 430; curve: Linear; distribution: Linear; }
        }
        launchAngle: nodes {
            { time: 0; low: 190; high: 220; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -720; high: 720; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1.1; high: 1.1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
            }
        }
    }
}
