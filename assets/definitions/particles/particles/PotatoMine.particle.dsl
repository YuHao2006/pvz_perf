export component PotatoMine {
    kind: particle;
    source-name: "potatomine";
    Emitter {
        image: "IMAGE_REANIM_POTATOMINE_MASHED";
        name: "Mashed";
        systemDuration: 200;
        spawnMinActive: 1;
        emitterOffsetY: 20;
        particleDuration: 200;
        particleAlpha: track { 1,95 0; }
        particleScale: .9;
    }
    Emitter {
        images: ["particles/frames/potatomine_particles_r0_c0.png","particles/frames/potatomine_particles_r0_c1.png","particles/frames/potatomine_particles_r0_c2.png","particles/frames/potatomine_particles_r0_c3.png","particles/frames/potatomine_particles_r0_c4.png","particles/frames/potatomine_particles_r0_c5.png"];
        name: "LowParts";
        imageFrames: 6;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnMinActive: 10;
        spawnMaxLaunched: 10;
        emitterRadius: range { 0 50; }
        emitterOffsetY: 20;
        particleDuration: 200;
        launchSpeed: range { 200 300; }
        particleAlpha: track { 1,95 0; }
        particleSpinSpeed: track { [-100 100] 0,20; }
        particleScale: range { 1 1.3; }
        field {
            fieldType: Acceleration;
            y: 0;
        }
        field {
            fieldType: Friction;
            x: track { .2 .1,30; }
            y: track { .2 .1,30; }
        }
    }
    Emitter {
        images: ["particles/frames/potatomine_particles_r0_c0.png","particles/frames/potatomine_particles_r0_c1.png","particles/frames/potatomine_particles_r0_c2.png","particles/frames/potatomine_particles_r0_c3.png","particles/frames/potatomine_particles_r0_c4.png","particles/frames/potatomine_particles_r0_c5.png"];
        name: "HighParts";
        imageFrames: 6;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 90;
        spawnMinActive: 30;
        spawnMaxLaunched: 30;
        emitterRadius: range { 0 50; }
        particleDuration: range { 70 80; }
        launchSpeed: range { 1300 2000; }
        launchAngle: range { 110 250; }
        particleAlpha: track { 1,90 0; }
        particleSpinSpeed: range { -600 600; }
        particleScale: range { 1 1.3; }
        field {
            fieldType: Acceleration;
            y: 5;
        }
        field {
            fieldType: Friction;
            x: track { .2 0,30; }
            y: track { .2 0,30; }
        }
    }
    Emitter {
        image: "IMAGE_EXPLOSIONSPUDOW";
        name: "Word";
        systemDuration: 70;
        spawnMinActive: 1;
        emitterOffsetY: -30;
        particleAlpha: track { 1,90 0; }
        field {
            fieldType: Shake;
            x: 2;
            y: 2;
        }
    }
    Emitter {
        image: "IMAGE_POTATOMINEFLASH";
        name: "Flash";
        systemDuration: 40;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        particleDuration: 40;
        particleRed: 1;
        particleGreen: 1;
        particleBlue: .5;
        particleAlpha: track { .5 0; }
        particleScale: track { 10 15; }
    }
}
