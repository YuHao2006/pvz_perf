export component BlastMark {
    kind: particle;
    source-name: "blastmark";
    Emitter {
        image: "IMAGE_BLASTMARK";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
    }
}
