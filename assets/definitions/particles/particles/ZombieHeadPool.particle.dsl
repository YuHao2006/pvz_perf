export component ZombieHeadPool {
    kind: particle;
    source-name: "zombieheadpool";
    Emitter {
        image: "IMAGE_ZOMBIEHEAD";
        name: "HeadPool";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
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
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 17; high: 17; curve: Linear; distribution: Linear; }
            }
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
