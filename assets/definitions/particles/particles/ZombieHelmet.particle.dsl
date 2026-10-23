export component ZombieHelmet {
    kind: particle;
    source-name: "zombiehelmet";
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_FOOTBALL_HELMET3";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 120; high: 180; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -200; high: -400; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        collisionReflect: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
        }
        collisionSpin: nodes {
            { time: 0; low: -3; high: -6; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 17; high: 17; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: GroundConstraint;
            y: nodes {
                { time: 0; low: 90; high: 90; curve: Linear; distribution: Linear; }
            }
        }
    }
}
