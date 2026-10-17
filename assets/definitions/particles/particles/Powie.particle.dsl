export component Powie {
    kind: particle;
    source-name: "powie";
    Emitter {
        image: "IMAGE_EXPLOSIONCLOUD";
        name: "PowieSmallClouds";
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnRate: 150;
        spawnMaxLaunched: 14;
        emitterRadius: range { 10 50; }
        particleDuration: range { 40 60; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 2000 2500; }
        particleRed: 1;
        particleGreen: track { .7 0; }
        particleBlue: 0;
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
        name: "PowieBigClouds";
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnRate: 150;
        spawnMaxLaunched: 14;
        emitterRadius: range { 10 50; }
        particleDuration: range { 40 60; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 500 1200; }
        particleRed: 1;
        particleGreen: track { .9 .4; }
        particleBlue: 0;
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
        image: "IMAGE_EXPLOSIONPOWIE";
        name: "PowieWord";
        systemDuration: 50;
        spawnMinActive: 1;
    }
}
