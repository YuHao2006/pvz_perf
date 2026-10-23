export component IceballTrail {
    kind: particle;
    source-name: "iceball_trail";
    Emitter {
        images: ["particles/frames/zombie_boss_iceball_groundparticles_r0_c0.png","particles/frames/zombie_boss_iceball_groundparticles_r0_c1.png","particles/frames/zombie_boss_iceball_groundparticles_r0_c2.png","particles/frames/zombie_boss_iceball_groundparticles_r0_c3.png"];
        imageFrames: 4;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 500; high: 600; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.05; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.95; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 0.5; high: 1.5; curve: Linear; distribution: Linear; }
        }
    }
}
