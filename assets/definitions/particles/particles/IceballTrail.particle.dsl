export component IceballTrail {
    kind: particle;
    source-name: "iceball_trail";
    Emitter {
        image: "IMAGE_ZOMBIE_BOSS_ICEBALL_GROUNDPARTICLES";
        imageFrames: 4;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        particleDuration: range { 500 600; }
        particleAlpha: track { 0 1,5 1,95 0; }
        particleScale: track { .1 [.5 1.5],20; }
    }
}
