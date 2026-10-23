export component ZombieArm {
    kind: particle;
    source-name: "zombiearm";
    Emitter {
        image: "IMAGE_ZOMBIEARM";
        randomLaunchSpin: 1;
        systemDuration: 60;
        spawnMinActive: 1;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: 40.0;
        launchAngle: range { 90 185; }
        particleSpinSpeed: track { [0 360] 0,40; }
        particleScale: .8;
        collisionReflect: .5;
        collisionSpin: range { 3 6; }
        field {
            fieldType: Acceleration;
            y: 15.0;
        }
        field {
            fieldType: GroundConstraint;
            y: 60.0;
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
