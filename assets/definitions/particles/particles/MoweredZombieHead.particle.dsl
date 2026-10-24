export component MoweredZombieHead {
    kind: particle;
    source-name: "moweredzombiehead";
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
        systemAlpha: nodes {
            { time: 0.95; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 330; high: 330; curve: Linear; distribution: Linear; }
        }
        launchAngle: nodes {
            { time: 0; low: 190; high: 220; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -720; high: 720; curve: Linear; distribution: Linear; }
            { time: 0.3; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        collisionReflect: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0; high: 0; curve: Linear; distribution: Linear; }
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
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}

// Compile-time appearances share this definition's motion and atlas.
export component MoweredZombieHeadPolevaulter { kind: particle; source-name: "moweredzombieheadpolevaulter"; variant-of: MoweredZombieHead; images: [["IMAGE_ZOMBIEPOLEVAULTERHEAD"]]; }
export component MoweredZombieHeadFootball { kind: particle; source-name: "moweredzombieheadfootball"; variant-of: MoweredZombieHead; images: [["IMAGE_ZOMBIEFOOTBALLHEAD"]]; }
export component MoweredZombieHeadDancer { kind: particle; source-name: "moweredzombieheaddancer"; variant-of: MoweredZombieHead; images: [["IMAGE_ZOMBIEDANCERHEAD"]]; }
export component MoweredZombieHeadBackupDancer { kind: particle; source-name: "moweredzombieheadbackupdancer"; variant-of: MoweredZombieHead; images: [["IMAGE_ZOMBIEBACKUPDANCERHEAD"]]; }
export component MoweredZombieHeadSnorkel { kind: particle; source-name: "moweredzombieheadsnorkel"; variant-of: MoweredZombieHead; images: [["IMAGE_REANIM_ZOMBIE_SNORKLE_HEAD"]]; }
export component MoweredZombieHeadBobsled { kind: particle; source-name: "moweredzombieheadbobsled"; variant-of: MoweredZombieHead; images: [["IMAGE_ZOMBIEBOBSLEDHEAD"]]; }
export component MoweredZombieHeadDolphinRider { kind: particle; source-name: "moweredzombieheaddolphinrider"; variant-of: MoweredZombieHead; images: [["IMAGE_ZOMBIEDOLPHINRIDERHEAD"]]; }
export component MoweredZombieHeadDigger { kind: particle; source-name: "moweredzombieheaddigger"; variant-of: MoweredZombieHead; images: [["IMAGE_ZOMBIEDIGGERHEAD"]]; }
export component MoweredZombieHeadYeti { kind: particle; source-name: "moweredzombieheadyeti"; variant-of: MoweredZombieHead; images: [["IMAGE_ZOMBIEYETIHEAD"]]; }
export component MoweredZombieHeadLadder { kind: particle; source-name: "moweredzombieheadladder"; variant-of: MoweredZombieHead; images: [["IMAGE_ZOMBIELADDERHEAD"]]; }
export component MoweredZombieHeadImp { kind: particle; source-name: "moweredzombieheadimp"; variant-of: MoweredZombieHead; images: [["IMAGE_ZOMBIEIMPHEAD"]]; }
