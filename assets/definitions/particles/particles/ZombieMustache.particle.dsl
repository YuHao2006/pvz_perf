export component ZombieMustache {
    kind: particle;
    source-name: "zombiemustache";
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_MUSTACHE1";
        name: "Mustache";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 120; high: 120; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.95; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 500; high: 500; curve: Linear; distribution: Linear; }
        }
        launchAngle: nodes {
            { time: 0; low: 150; high: 170; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -1720; high: 1720; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        collisionReflect: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        collisionSpin: nodes {
            { time: 0; low: -300; high: -350; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 0; high: 0; curve: Linear; distribution: Linear; }
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

// Compile-time appearances share this definition's motion and atlas.
export component ZombieMustache2 { kind: particle; source-name: "zombiemustache2"; variant-of: ZombieMustache; images: [["IMAGE_REANIM_ZOMBIE_MUSTACHE2"]]; }
export component ZombieMustache3 { kind: particle; source-name: "zombiemustache3"; variant-of: ZombieMustache; images: [["IMAGE_REANIM_ZOMBIE_MUSTACHE3"]]; }
