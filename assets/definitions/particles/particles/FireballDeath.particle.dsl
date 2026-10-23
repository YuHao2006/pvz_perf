export component FireballDeath {
    kind: particle;
    source-name: "fireballdeath";
    Emitter {
        images: ["particles/frames/zombie_boss_fireball_particles_r0_c0.png","particles/frames/zombie_boss_fireball_particles_r0_c1.png","particles/frames/zombie_boss_fireball_particles_r0_c2.png","particles/frames/zombie_boss_fireball_particles_r0_c3.png"];
        imageFrames: 2;
        animated: 0;
        emitterType: Circle;
        alignLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 20; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0.6; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 60; high: 60; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -300; high: -300; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 0.4; high: 1.5; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.6; high: 2; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
                { time: 1; low: 400; high: 800; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 50; high: 100; curve: Linear; distribution: Linear; }
                { time: 1; low: 100; high: 300; curve: Linear; distribution: Linear; }
            }
        }
    }
}
