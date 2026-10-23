export component ZombieHead {
    kind: particle;
    source-name: "zombiehead";
    Emitter {
        image: "IMAGE_ZOMBIEHEAD";
        randomLaunchSpin: 1;
        systemDuration: 180;
        spawnMinActive: 1;
        particleDuration: 180;
        systemAlpha: track { 1,95 0,100; }
        launchSpeed: 330.0;
        launchAngle: range { 150 185; }
        particleSpinSpeed: track { [-720 720] 0,40; }
        particleScale: .8;
        collisionReflect: track { .3 .3,40 0,50; }
        collisionSpin: track { [-3 -6] 0,40; }
        field {
            fieldType: Acceleration;
            y: 17.0;
        }
        field {
            fieldType: GroundConstraint;
            y: 90.0;
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
