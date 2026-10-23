export component ZombieHeadPool {
    kind: particle;
    source-name: "zombieheadpool";
    Emitter {
        image: "IMAGE_ZOMBIEHEAD";
        name: "HeadPool";
        randomLaunchSpin: 1;
        systemDuration: 50;
        spawnMinActive: 1;
        emitterOffsetX: 5;
        systemAlpha: track { 1,80 0,100; }
        launchSpeed: 330.0;
        launchAngle: range { 150 185; }
        particleSpinSpeed: track { [-720 720] 0,40; }
        particleScale: .8;
        field {
            fieldType: Acceleration;
            y: 17.0;
        }
    }
}

// Compile-time appearances share this definition's motion and atlas.
export component ZombieHeadPoolPolevaulter { kind: particle; source-name: "zombieheadpoolpolevaulter"; variant-of: ZombieHeadPool; images: [["IMAGE_ZOMBIEPOLEVAULTERHEAD"]]; }
export component ZombieHeadPoolFootball { kind: particle; source-name: "zombieheadpoolfootball"; variant-of: ZombieHeadPool; images: [["IMAGE_ZOMBIEFOOTBALLHEAD"]]; }
export component ZombieHeadPoolDancer { kind: particle; source-name: "zombieheadpooldancer"; variant-of: ZombieHeadPool; images: [["IMAGE_ZOMBIEDANCERHEAD"]]; }
export component ZombieHeadPoolBackupDancer { kind: particle; source-name: "zombieheadpoolbackupdancer"; variant-of: ZombieHeadPool; images: [["IMAGE_ZOMBIEBACKUPDANCERHEAD"]]; }
export component ZombieHeadPoolSnorkel { kind: particle; source-name: "zombieheadpoolsnorkel"; variant-of: ZombieHeadPool; images: [["IMAGE_REANIM_ZOMBIE_SNORKLE_HEAD"]]; }
export component ZombieHeadPoolBobsled { kind: particle; source-name: "zombieheadpoolbobsled"; variant-of: ZombieHeadPool; images: [["IMAGE_ZOMBIEBOBSLEDHEAD"]]; }
export component ZombieHeadPoolDolphinRider { kind: particle; source-name: "zombieheadpooldolphinrider"; variant-of: ZombieHeadPool; images: [["IMAGE_ZOMBIEDOLPHINRIDERHEAD"]]; }
export component ZombieHeadPoolDigger { kind: particle; source-name: "zombieheadpooldigger"; variant-of: ZombieHeadPool; images: [["IMAGE_ZOMBIEDIGGERHEAD"]]; }
export component ZombieHeadPoolYeti { kind: particle; source-name: "zombieheadpoolyeti"; variant-of: ZombieHeadPool; images: [["IMAGE_ZOMBIEYETIHEAD"]]; }
export component ZombieHeadPoolLadder { kind: particle; source-name: "zombieheadpoolladder"; variant-of: ZombieHeadPool; images: [["IMAGE_ZOMBIELADDERHEAD"]]; }
export component ZombieHeadPoolImp { kind: particle; source-name: "zombieheadpoolimp"; variant-of: ZombieHeadPool; images: [["IMAGE_ZOMBIEIMPHEAD"]]; }
