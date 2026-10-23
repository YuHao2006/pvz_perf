export component CatapultExplosion {
    kind: particle;
    source-name: "catapultexplosion";
    Emitter {
        image: "IMAGE_EXPLOSIONCLOUD";
        name: "ZamboniSmallClouds";
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnRate: 150;
        spawnMaxLaunched: 14;
        emitterRadius: range { 10 50; }
        particleDuration: range { 40 60; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 2000 2500; }
        particleRed: track { .55 .22 0; }
        particleGreen: track { .3 0; }
        particleBlue: track { .2 0; }
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
        image: "IMAGE_REANIM_ZOMBIE_CATAPULT_MANHOLE";
        name: "Manhole";
        randomLaunchSpin: 1;
        spawnMinActive: track { 0 1,10; }
        emitterBoxX: range { -35 35; }
        emitterBoxY: 30;
        particleDuration: 80;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: 600.0;
        launchAngle: range { 130 200; }
        particleSpinSpeed: track { [-720 720] 0; }
        particleScale: .8;
        field {
            fieldType: Acceleration;
            y: 13.0;
        }
    }
    Emitter {
        images: ["particles/frames/zomboss_particles_r0_c0.png","particles/frames/zomboss_particles_r0_c1.png","particles/frames/zomboss_particles_r0_c2.png","particles/frames/zomboss_particles_r0_c3.png","particles/frames/zomboss_particles_r0_c4.png"];
        name: "Parts";
        imageFrames: 5;
        randomLaunchSpin: 1;
        spawnMinActive: track { 0 6,10; }
        emitterBoxX: range { -35 35; }
        emitterBoxY: 30;
        particleDuration: 80;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: 600.0;
        launchAngle: range { 130 200; }
        particleSpinSpeed: track { [-720 720] 0; }
        particleScale: range { .4 .6; }
        field {
            fieldType: Acceleration;
            y: 13.0;
        }
    }
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_CATAPULT_POLE_DAMAGE";
        name: "Pole";
        randomLaunchSpin: 1;
        spawnMinActive: 1;
        particleDuration: 80;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: range { 550 650; }
        launchAngle: range { 130 200; }
        particleSpinSpeed: track { [-720 720] 0; }
        particleScale: .8;
        field {
            fieldType: Acceleration;
            y: 13.0;
        }
    }
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL";
        name: "Backetballs";
        randomLaunchSpin: 1;
        spawnMinActive: track { 0 3,30; }
        particleDuration: 80;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: 500.0;
        launchAngle: range { 130 200; }
        particleSpinSpeed: track { [-720 720] 0; }
        particleScale: .8;
        field {
            fieldType: Acceleration;
            y: 11.0;
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
        particleDuration: range { 40 60; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 500 1200; }
        particleRed: track { .55 .22 0; }
        particleGreen: track { .3 0; }
        particleBlue: track { .2 0; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: track { [1.2 1.6],60 0; }
        field {
            fieldType: Friction;
            x: track { 0.12,40 1; }
            y: track { 0.18,40 1; }
        }
    }
}
