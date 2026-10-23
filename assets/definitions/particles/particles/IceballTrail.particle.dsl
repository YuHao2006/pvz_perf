export component IceballTrail {
    kind: particle;
    source-name: "iceball_trail";
    Emitter {
        images: ["particles/frames/zombie_boss_iceball_groundparticles_r0_c0.png","particles/frames/zombie_boss_iceball_groundparticles_r0_c1.png","particles/frames/zombie_boss_iceball_groundparticles_r0_c2.png","particles/frames/zombie_boss_iceball_groundparticles_r0_c3.png"];
        imageFrames: 4;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        particleDuration: range { 500 600; }
        particleAlpha: track { 0 1,5 1,95 0; }
        particleScale: track { .1 [.5 1.5],20; }
    }
}
