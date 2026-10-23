export component ZombieHead {
    kind: particle;
    source-name: "zombiehead";
    Emitter {
        image: "IMAGE_ZOMBIEHEAD";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 180; high: 180; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 180; high: 180; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.95; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 330; high: 330; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 150; high: 185; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -720; high: 720; curve: Linear; distribution: Linear; }
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
            { time: 0; low: -3; high: -6; curve: Linear; distribution: Linear; }
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
export component ZombieHeadPolevaulter { kind: particle; source-name: "zombieheadpolevaulter"; variant-of: ZombieHead; images: [["IMAGE_ZOMBIEPOLEVAULTERHEAD"]]; }
export component ZombieHeadFootball { kind: particle; source-name: "zombieheadfootball"; variant-of: ZombieHead; images: [["IMAGE_ZOMBIEFOOTBALLHEAD"]]; }
export component ZombieHeadDancer { kind: particle; source-name: "zombieheaddancer"; variant-of: ZombieHead; images: [["IMAGE_ZOMBIEDANCERHEAD"]]; }
export component ZombieHeadBackupDancer { kind: particle; source-name: "zombieheadbackupdancer"; variant-of: ZombieHead; images: [["IMAGE_ZOMBIEBACKUPDANCERHEAD"]]; }
export component ZombieHeadSnorkel { kind: particle; source-name: "zombieheadsnorkel"; variant-of: ZombieHead; images: [["IMAGE_REANIM_ZOMBIE_SNORKLE_HEAD"]]; }
export component ZombieHeadBobsled { kind: particle; source-name: "zombieheadbobsled"; variant-of: ZombieHead; images: [["IMAGE_ZOMBIEBOBSLEDHEAD"]]; }
export component ZombieHeadDolphinRider { kind: particle; source-name: "zombieheaddolphinrider"; variant-of: ZombieHead; images: [["IMAGE_ZOMBIEDOLPHINRIDERHEAD"]]; }
export component ZombieHeadDigger { kind: particle; source-name: "zombieheaddigger"; variant-of: ZombieHead; images: [["IMAGE_ZOMBIEDIGGERHEAD"]]; }
export component ZombieHeadYeti { kind: particle; source-name: "zombieheadyeti"; variant-of: ZombieHead; images: [["IMAGE_ZOMBIEYETIHEAD"]]; }
export component ZombieHeadLadder { kind: particle; source-name: "zombieheadladder"; variant-of: ZombieHead; images: [["IMAGE_ZOMBIELADDERHEAD"]]; }
export component ZombieHeadImp { kind: particle; source-name: "zombieheadimp"; variant-of: ZombieHead; images: [["IMAGE_ZOMBIEIMPHEAD"]]; }
