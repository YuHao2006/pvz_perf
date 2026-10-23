export component CatapultExplosion {
    kind: particle;
    source-name: "catapultexplosion";
    Emitter {
        image: "IMAGE_EXPLOSIONCLOUD";
        name: "ZamboniSmallClouds";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 14; high: 14; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 10; high: 50; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 60; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 2000; high: 2500; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 0.55; high: 0.55; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.22; high: 0.22; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.7; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0.6; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0.4; low: 0.15; high: 0.15; curve: Linear; distribution: Linear; }
                { time: 1; low: 1; high: 1; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0.4; low: 0.18; high: 0.18; curve: Linear; distribution: Linear; }
                { time: 1; low: 1; high: 1; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_CATAPULT_MANHOLE";
        name: "Manhole";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -35; high: 35; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 80; high: 80; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 600; high: 600; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 130; high: 200; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -720; high: 720; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 13; high: 13; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        images: ["particles/frames/zomboss_particles_r0_c0.png","particles/frames/zomboss_particles_r0_c1.png","particles/frames/zomboss_particles_r0_c2.png","particles/frames/zomboss_particles_r0_c3.png","particles/frames/zomboss_particles_r0_c4.png"];
        name: "Parts";
        imageFrames: 5;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 6; high: 6; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -35; high: 35; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 80; high: 80; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 600; high: 600; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 130; high: 200; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -720; high: 720; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.6; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 13; high: 13; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_CATAPULT_POLE_DAMAGE";
        name: "Pole";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 80; high: 80; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 550; high: 650; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 130; high: 200; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -720; high: 720; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 13; high: 13; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL";
        name: "Backetballs";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.3; low: 3; high: 3; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 80; high: 80; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 500; high: 500; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 130; high: 200; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -720; high: 720; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 11; high: 11; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_EXPLOSIONCLOUD";
        name: "ZamboniBigClouds";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 14; high: 14; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 10; high: 50; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 60; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 500; high: 1200; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 0.55; high: 0.55; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.22; high: 0.22; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.7; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0.6; low: 1.2; high: 1.6; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0.4; low: 0.12; high: 0.12; curve: Linear; distribution: Linear; }
                { time: 1; low: 1; high: 1; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0.4; low: 0.18; high: 0.18; curve: Linear; distribution: Linear; }
                { time: 1; low: 1; high: 1; curve: Linear; distribution: Linear; }
            }
        }
    }
}
