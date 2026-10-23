export component PotatoMine {
    kind: particle;
    source-name: "potatomine";
    Emitter {
        image: "IMAGE_REANIM_POTATOMINE_MASHED";
        name: "Mashed";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.95; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        images: ["particles/frames/potatomine_particles_r0_c0.png","particles/frames/potatomine_particles_r0_c1.png","particles/frames/potatomine_particles_r0_c2.png","particles/frames/potatomine_particles_r0_c3.png","particles/frames/potatomine_particles_r0_c4.png","particles/frames/potatomine_particles_r0_c5.png"];
        name: "LowParts";
        imageFrames: 6;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 50; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 200; high: 300; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.95; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -100; high: 100; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1; high: 1.3; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
                { time: 0.3; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
                { time: 0.3; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        images: ["particles/frames/potatomine_particles_r0_c0.png","particles/frames/potatomine_particles_r0_c1.png","particles/frames/potatomine_particles_r0_c2.png","particles/frames/potatomine_particles_r0_c3.png","particles/frames/potatomine_particles_r0_c4.png","particles/frames/potatomine_particles_r0_c5.png"];
        name: "HighParts";
        imageFrames: 6;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 90; high: 90; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 50; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 70; high: 80; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 1300; high: 2000; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 110; high: 250; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -600; high: 600; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1; high: 1.3; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
                { time: 0.3; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
                { time: 0.3; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_EXPLOSIONSPUDOW";
        name: "Word";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 70; high: 70; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: -30; high: -30; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_POTATOMINEFLASH";
        name: "Flash";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
            { time: 1; low: 15; high: 15; curve: Linear; distribution: Linear; }
        }
    }
}
