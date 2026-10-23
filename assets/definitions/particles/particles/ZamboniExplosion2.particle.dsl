export component ZamboniExplosion2 {
    kind: particle;
    source-name: "zamboniexplosion2";
    Emitter {
        image: "IMAGE_EXPLOSIONCLOUD";
        name: "ZamboniSmallClouds";
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnRate: 150;
        spawnMaxLaunched: 14;
        emitterRadius: range { 10 50; }
        emitterOffsetX: 100;
        particleDuration: range { 40 60; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 2000 2500; }
        particleRed: track { .5 .25 0; }
        particleGreen: track { .8 .4 0; }
        particleBlue: track { 1 .75 0; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: track { .5,60 0; }
        field {
            fieldType: Friction;
            x: track { 0.15,40 1; }
            y: track { 0.18,40 1; }
        }
    }
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_ZAMBONI_1_DAMAGE1";
        name: "Hood";
        randomLaunchSpin: 1;
        spawnMinActive: 1;
        emitterOffsetX: 100;
        particleDuration: 80;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: 600.0;
        launchAngle: range { 150 170; }
        particleSpinAngle: 270;
        particleSpinSpeed: track { [-720 -300] 0; }
        particleScale: .8;
        field {
            fieldType: Acceleration;
            y: 11.0;
        }
    }
    Emitter {
        images: ["particles/frames/zomboss_particles_r0_c0.png","particles/frames/zomboss_particles_r0_c1.png","particles/frames/zomboss_particles_r0_c2.png","particles/frames/zomboss_particles_r0_c3.png","particles/frames/zomboss_particles_r0_c4.png"];
        name: "Parts";
        imageFrames: 5;
        randomLaunchSpin: 1;
        spawnMinActive: track { 0 6,10; }
        emitterBoxX: range { 65 135; }
        emitterBoxY: 30;
        particleDuration: 80;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: range { 600 800; }
        launchAngle: range { 130 200; }
        particleSpinSpeed: track { [-720 720] 0; }
        particleScale: range { .4 .6; }
        field {
            fieldType: Acceleration;
            y: 13.0;
        }
    }
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_ZAMBONI_WHEEL";
        name: "Wheels";
        randomLaunchSpin: 1;
        spawnMinActive: track { 0 2,10; }
        emitterOffsetX: 100;
        emitterBoxX: range { -15 15; }
        emitterBoxY: range { -20 80; }
        particleDuration: 80;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: 800.0;
        launchAngle: range { 130 200; }
        particleSpinSpeed: track { [-720 720] 0; }
        particleScale: .8;
        field {
            fieldType: Acceleration;
            y: 13.0;
        }
    }
    Emitter {
        image: "IMAGE_REANIM_zOMBIE_ZAMBONI_BRUSH";
        name: "Brush";
        randomLaunchSpin: 1;
        spawnMinActive: track { 0 1,10; }
        emitterOffsetX: 100;
        particleDuration: 80;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: 800.0;
        launchAngle: range { 130 200; }
        particleSpinSpeed: track { [-720 720] 0; }
        particleScale: .8;
        field {
            fieldType: Acceleration;
            y: 13.0;
        }
    }
    Emitter {
        image: "IMAGE_EXPLOSIONCLOUD";
        name: "ZamboniBigClouds";
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnRate: 150;
        spawnMaxLaunched: 14;
        emitterRadius: range { 10 50; }
        emitterOffsetX: 100;
        particleDuration: range { 40 60; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 500 1200; }
        particleRed: track { .5 .25 0; }
        particleGreen: track { .8 .4 0; }
        particleBlue: track { 1 .75 0; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: track { [1.2 1.6],60 0; }
        field {
            fieldType: Friction;
            x: track { 0.18,40 1; }
            y: track { 0.12,40 1; }
        }
    }
}
