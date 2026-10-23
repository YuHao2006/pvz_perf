export component ZombieBossFireball {
    kind: particle;
    source-name: "zombie_boss_fireball";
    Emitter {
        images: ["particles/frames/zombie_boss_fireball_particles_r0_c0.png","particles/frames/zombie_boss_fireball_particles_r0_c1.png","particles/frames/zombie_boss_fireball_particles_r0_c2.png","particles/frames/zombie_boss_fireball_particles_r0_c3.png"];
        name: "BossFireball";
        imageFrames: 2;
        randomLaunchSpin: 1;
        systemDuration: 250;
        spawnRate: 40;
        spawnMaxLaunched: 40;
        emitterBoxX: range { -40 40; }
        emitterBoxY: range { -10 40; }
        particleDuration: 30;
        particleAlpha: track { 1,80 0; }
        particleSpinAngle: range { 0 10; }
        particleSpinSpeed: range { -50 50; }
        particleScale: track { .1 [0.8 1.2],50; }
        field {
            fieldType: Position;
            x: track { 0 [-70 -100]; }
            y: track { 0 [-10 30]; }
        }
    }
    Emitter {
        images: ["particles/frames/zombie_boss_fireball_particles_r0_c2.png","particles/frames/zombie_boss_fireball_particles_r0_c3.png"];
        name: "BossFireball2";
        imageFrames: 2;
        randomLaunchSpin: 1;
        systemDuration: 250;
        spawnRate: 40;
        spawnMaxLaunched: 40;
        emitterBoxX: range { -40 40; }
        emitterBoxY: range { -10 40; }
        particleDuration: range { 15 25; }
        particleAlpha: track { 1,80 0; }
        particleSpinAngle: range { 0 10; }
        particleSpinSpeed: range { -30 30; }
        particleScale: track { .1 [0.8 1.2],50; }
        field {
            fieldType: Position;
            x: track { 0 [-70 -100]; }
            y: track { 0 [-10 30]; }
        }
    }
}

// Compile-time appearances share this definition's motion and atlas.
export component ZombieBossIceballBurst { kind: particle; source-name: "zombiebossiceballburst"; variant-of: ZombieBossFireball; images: [["particles/frames/zombie_boss_iceball_particles_r0_c0.png","particles/frames/zombie_boss_iceball_particles_r0_c1.png","particles/frames/zombie_boss_iceball_particles_r0_c2.png","particles/frames/zombie_boss_iceball_particles_r0_c3.png"],["particles/frames/zombie_boss_iceball_particles_r0_c2.png","particles/frames/zombie_boss_iceball_particles_r0_c3.png"]]; }
