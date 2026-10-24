export component FireballTrail {
    kind: particle;
    source-name: "fireball_trail";
    Emitter {
        images: ["particles/frames/zombie_boss_fireball_groundparticles_r0_c0.png","particles/frames/zombie_boss_fireball_groundparticles_r0_c1.png","particles/frames/zombie_boss_fireball_groundparticles_r0_c2.png","particles/frames/zombie_boss_fireball_groundparticles_r0_c3.png"];
        name: "Fireball_Trail_ground";
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
            { time: 0.2; low: 0.5; high: 1.1; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_ZOMBIE_BOSS_FIREBALL_ADDITIVEPARTICLE";
        name: "Fireball_Trail_embers";
        imageFrames: 1;
        animated: 0;
        emitterType: Circle;
        additive: 1;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0.8; low: 15; high: 15; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 30; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 10; high: 40; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 15; high: 60; curve: Linear; distribution: Linear; }
            { time: 1; low: 10; high: 30; curve: Linear; distribution: Linear; }
        }
        launchAngle: nodes {
            { time: 0; low: 120; high: 240; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.2; high: 0.7; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Velocity;
            x: nodes {
                { time: 0; low: -50; high: 50; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}
