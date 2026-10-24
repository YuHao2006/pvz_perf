export component MoweredZombieArm {
    kind: particle;
    source-name: "moweredzombiearm";
    Emitter {
        image: "IMAGE_ZOMBIEARM";
        name: "MoweredArm";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 60; high: 60; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 340; high: 340; curve: Linear; distribution: Linear; }
        }
        launchAngle: nodes {
            { time: 0; low: 190; high: 220; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: -90; high: -90; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -180; high: -360; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        collisionReflect: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
        }
        collisionSpin: nodes {
            { time: 0; low: 15; high: 15; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 15; high: 15; curve: Linear; distribution: Linear; }
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
export component MoweredZombieArmHand { kind: particle; source-name: "moweredzombiearmhand"; variant-of: MoweredZombieArm; images: [["IMAGE_REANIM_ZOMBIE_OUTERARM_HAND"]]; }
export component MoweredZombieArmNewspaper { kind: particle; source-name: "moweredzombiearmnewspaper"; variant-of: MoweredZombieArm; images: [["IMAGE_REANIM_ZOMBIE_PAPER_LEFTARM_LOWER"]]; }
export component MoweredZombieArmFootball { kind: particle; source-name: "moweredzombiearmfootball"; variant-of: MoweredZombieArm; images: [["IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTARM_HAND"]]; }
export component MoweredZombieArmDancer { kind: particle; source-name: "moweredzombiearmdancer"; variant-of: MoweredZombieArm; images: [["IMAGE_REANIM_ZOMBIE_DISCO_OUTERARM_HAND"]]; }
export component MoweredZombieArmBackupDancer { kind: particle; source-name: "moweredzombiearmbackupdancer"; variant-of: MoweredZombieArm; images: [["IMAGE_REANIM_ZOMBIE_BACKUP_INNERARM_HAND"]]; }
export component MoweredZombieArmBobsled { kind: particle; source-name: "moweredzombiearmbobsled"; variant-of: MoweredZombieArm; images: [["IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_HAND"]]; }
export component MoweredZombieArmJackbox { kind: particle; source-name: "moweredzombiearmjackbox"; variant-of: MoweredZombieArm; images: [["IMAGE_ZOMBIEJACKBOXARM"]]; }
export component MoweredZombieArmDigger { kind: particle; source-name: "moweredzombiearmdigger"; variant-of: MoweredZombieArm; images: [["IMAGE_ZOMBIEDIGGERARM"]]; }
export component MoweredZombieArmYeti { kind: particle; source-name: "moweredzombiearmyeti"; variant-of: MoweredZombieArm; images: [["IMAGE_REANIM_ZOMBIE_YETI_OUTERARM_HAND"]]; }
export component MoweredZombieArmImp { kind: particle; source-name: "moweredzombiearmimp"; variant-of: MoweredZombieArm; images: [["IMAGE_REANIM_ZOMBIE_IMP_ARM2"]]; }
