export component FireballTrail {
    kind: particle;
    source-name: "fireball_trail";
    Emitter {
        images: ["particles/frames/zombie_boss_fireball_groundparticles_r0_c0.png","particles/frames/zombie_boss_fireball_groundparticles_r0_c1.png","particles/frames/zombie_boss_fireball_groundparticles_r0_c2.png","particles/frames/zombie_boss_fireball_groundparticles_r0_c3.png"];
        name: "Fireball_Trail_ground";
        imageFrames: 4;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        particleDuration: range { 500 600; }
        particleAlpha: track { 0 1,5 1,95 0; }
        particleScale: track { .1 [.5 1.1],20; }
    }
    Emitter {
        image: "IMAGE_ZOMBIE_BOSS_FIREBALL_ADDITIVEPARTICLE";
        name: "Fireball_Trail_embers";
        emitterType: Circle;
        additive: 1;
        systemDuration: 400;
        spawnRate: track { 15,80 0; }
        emitterRadius: range { 0 30; }
        particleDuration: range { 10 40; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: track { [15 60] [10 30]; }
        launchAngle: range { 120 240; }
        particleAlpha: track { 1,80 0; }
        particleScale: range { .2 0.7; }
        field {
            fieldType: Velocity;
            x: track { [-50 50] 0; }
        }
    }
}
