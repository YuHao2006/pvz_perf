export component MowerCloud {
    kind: particle;
    source-name: "mowercloud";
    Emitter {
        image: "IMAGE_EXPLOSIONCLOUD";
        name: "PowieSmallClouds";
        randomLaunchSpin: 1;
        dieIfOverloaded: 1;
        systemDuration: 200;
        spawnRate: 150;
        spawnMaxLaunched: 3;
        emitterRadius: range { 10 50; }
        particleDuration: range { 40 60; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 2000 2500; }
        particleRed: .5;
        particleGreen: .55;
        particleBlue: .45;
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: track { .5,60 0; }
        field {
            fieldType: Friction;
            x: track { 0.30,40 1; }
            y: track { 0.24,40 1; }
        }
    }
    Emitter {
        image: "IMAGE_EXPLOSIONCLOUD";
        name: "PowieBigClouds";
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnRate: 150;
        spawnMaxLaunched: 10;
        emitterRadius: range { 10 50; }
        particleDuration: range { 40 60; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 400 700; }
        particleRed: .5;
        particleGreen: .55;
        particleBlue: .45;
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: track { [0.6 0.8],60 0; }
        field {
            fieldType: Friction;
            x: track { 0.20,40 1; }
            y: track { 0.10,40 1; }
        }
    }
}
