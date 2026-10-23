export component MoweredZombieHead {
    kind: particle;
    source-name: "moweredzombiehead";
    Emitter {
        image: "IMAGE_ZOMBIEHEAD";
        randomLaunchSpin: 1;
        systemDuration: 180;
        spawnMinActive: 1;
        particleDuration: 180;
        systemAlpha: track { 1,95 0,100; }
        launchSpeed: 330.0;
        launchAngle: range { 190 220; }
        particleSpinSpeed: track { [-720 720] 0,30; }
        particleScale: .8;
        collisionReflect: track { .3 .3,40 0,50; }
        field {
            fieldType: Acceleration;
            y: 17.0;
        }
        field {
            fieldType: GroundConstraint;
            y: 0.0;
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
