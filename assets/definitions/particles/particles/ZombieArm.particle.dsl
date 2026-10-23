export component ZombieArm {
    kind: particle;
    source-name: "zombiearm";
    Emitter {
        image: "IMAGE_ZOMBIEARM";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 60; high: 60; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 90; high: 185; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: 0; high: 360; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        collisionReflect: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
        }
        collisionSpin: nodes {
            { time: 0; low: 3; high: 6; curve: Linear; distribution: Linear; }
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
                { time: 0; low: 60; high: 60; curve: Linear; distribution: Linear; }
            }
        }
    }
}

// Compile-time appearances share this definition's motion and atlas.
export component ZombieArmHand { kind: particle; source-name: "zombiearmhand"; variant-of: ZombieArm; images: [["IMAGE_REANIM_ZOMBIE_OUTERARM_HAND"]]; }
export component ZombieArmNewspaper { kind: particle; source-name: "zombiearmnewspaper"; variant-of: ZombieArm; images: [["IMAGE_REANIM_ZOMBIE_PAPER_LEFTARM_LOWER"]]; }
export component ZombieArmFootball { kind: particle; source-name: "zombiearmfootball"; variant-of: ZombieArm; images: [["IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTARM_HAND"]]; }
export component ZombieArmDancer { kind: particle; source-name: "zombiearmdancer"; variant-of: ZombieArm; images: [["IMAGE_REANIM_ZOMBIE_DISCO_OUTERARM_HAND"]]; }
export component ZombieArmBackupDancer { kind: particle; source-name: "zombiearmbackupdancer"; variant-of: ZombieArm; images: [["IMAGE_REANIM_ZOMBIE_BACKUP_INNERARM_HAND"]]; }
export component ZombieArmBobsled { kind: particle; source-name: "zombiearmbobsled"; variant-of: ZombieArm; images: [["IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_HAND"]]; }
export component ZombieArmJackbox { kind: particle; source-name: "zombiearmjackbox"; variant-of: ZombieArm; images: [["IMAGE_ZOMBIEJACKBOXARM"]]; }
export component ZombieArmDigger { kind: particle; source-name: "zombiearmdigger"; variant-of: ZombieArm; images: [["IMAGE_ZOMBIEDIGGERARM"]]; }
export component ZombieArmYeti { kind: particle; source-name: "zombiearmyeti"; variant-of: ZombieArm; images: [["IMAGE_REANIM_ZOMBIE_YETI_OUTERARM_HAND"]]; }
export component ZombieArmImp { kind: particle; source-name: "zombiearmimp"; variant-of: ZombieArm; images: [["IMAGE_REANIM_ZOMBIE_IMP_ARM2"]]; }
