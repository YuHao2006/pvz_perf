export component BlastMark {
    kind: particle;
    source-name: "blastmark";
    Emitter {
        image: "IMAGE_BLASTMARK";
        systemDuration: 100;
        spawnMinActive: 1;
        systemAlpha: track { 1,80 0; }
    }
}
