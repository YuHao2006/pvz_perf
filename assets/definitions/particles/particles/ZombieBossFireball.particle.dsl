export component ZombieBossFireball {
    kind: particle;
    source-name: "zombie_boss_fireball";
    Emitter {
        images: ["particles/frames/zombie_boss_fireball_particles_r0_c0.png","particles/frames/zombie_boss_fireball_particles_r0_c1.png","particles/frames/zombie_boss_fireball_particles_r0_c2.png","particles/frames/zombie_boss_fireball_particles_r0_c3.png"];
        name: "BossFireball";
        imageFrames: 2;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 250; high: 250; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -40; high: 40; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: -10; high: 40; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 0; high: 10; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -50; high: 50; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.8; high: 1.2; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -70; high: -100; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -10; high: 30; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        images: ["particles/frames/zombie_boss_fireball_particles_r0_c2.png","particles/frames/zombie_boss_fireball_particles_r0_c3.png"];
        name: "BossFireball2";
        imageFrames: 2;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 250; high: 250; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -40; high: 40; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: -10; high: 40; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 15; high: 25; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 0; high: 10; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -30; high: 30; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.8; high: 1.2; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -70; high: -100; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -10; high: 30; curve: Linear; distribution: Linear; }
            }
        }
    }
}

// Compile-time appearances share this definition's motion and atlas.
export component ZombieBossIceballBurst { kind: particle; source-name: "zombiebossiceballburst"; variant-of: ZombieBossFireball; images: [["particles/frames/zombie_boss_iceball_particles_r0_c0.png","particles/frames/zombie_boss_iceball_particles_r0_c1.png","particles/frames/zombie_boss_iceball_particles_r0_c2.png","particles/frames/zombie_boss_iceball_particles_r0_c3.png"],["particles/frames/zombie_boss_iceball_particles_r0_c2.png","particles/frames/zombie_boss_iceball_particles_r0_c3.png"]]; }
