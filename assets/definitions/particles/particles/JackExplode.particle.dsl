export component JackExplode {
    kind: particle;
    source-name: "jackexplode";
    Emitter {
        image: "IMAGE_ZOMBOSS_PARTICLES";
        name: "Parts";
        imageFrames: 5;
        randomLaunchSpin: 1;
        spawnMinActive: track { 0 6,20; }
        emitterBoxX: range { -50 0; }
        emitterBoxY: 30;
        particleDuration: 80;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: range { 500 800; }
        launchAngle: range { 170 200; }
        particleSpinSpeed: track { [-720 720] 0; }
        particleScale: range { .2 .4; }
        field {
            fieldType: Acceleration;
            y: 13.0;
        }
    }
    Emitter {
        image: "IMAGE_EXPLOSIONCLOUD";
        name: "JackSmallClouds";
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnRate: 150;
        spawnMaxLaunched: 14;
        emitterRadius: range { 10 50; }
        particleDuration: range { 40 60; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 2000 2500; }
        particleRed: .4;
        particleGreen: 0;
        particleBlue: .6;
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
        image: "IMAGE_EXPLOSIONCLOUD";
        name: "JackExplodeBigCloud";
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnRate: 150;
        spawnMaxLaunched: 14;
        emitterRadius: range { 10 50; }
        particleDuration: range { 40 60; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 500 1200; }
        particleRed: .4;
        particleGreen: 0;
        particleBlue: track { 0 .6; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: track { [1.2 1.6],60 0; }
        field {
            fieldType: Friction;
            x: track { 0.12,40 1; }
            y: track { 0.18,40 1; }
        }
    }
    Emitter {
        image: "IMAGE_SPROING";
        name: "JackExplodeSproing";
        systemDuration: 40;
        spawnMinActive: 1;
    }
}
