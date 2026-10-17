export component ZombieBossFireball {
    kind: particle;
    source-name: "zombie_boss_fireball";
    Emitter {
        image: "IMAGE_ZOMBIE_BOSS_FIREBALL_PARTICLES";
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
        image: "IMAGE_ZOMBIE_BOSS_FIREBALL_PARTICLES";
        name: "BossFireball2";
        imageCol: 2;
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
