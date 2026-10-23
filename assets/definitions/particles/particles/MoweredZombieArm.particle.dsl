export component MoweredZombieArm {
    kind: particle;
    source-name: "moweredzombiearm";
    Emitter {
        image: "IMAGE_ZOMBIEARM";
        name: "MoweredArm";
        randomLaunchSpin: 1;
        systemDuration: 60;
        spawnMinActive: 1;
        emitterOffsetX: 30;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: 340.0;
        launchAngle: range { 190 220; }
        particleSpinAngle: -90;
        particleSpinSpeed: track { [-180 -360] 0,40; }
        particleScale: .8;
        collisionReflect: .5;
        collisionSpin: 15;
        field {
            fieldType: Acceleration;
            y: 15.0;
        }
        field {
            fieldType: GroundConstraint;
            y: 0.0;
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
