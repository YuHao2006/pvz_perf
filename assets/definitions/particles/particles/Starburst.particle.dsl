export component Starburst {
    kind: particle;
    source-name: "starburst";
    Emitter {
        image: "IMAGE_STAR40";
        emitterType: Circle;
        randomLaunchSpin: 1;
        additive: 1;
        systemDuration: 50;
        spawnMinActive: 25;
        spawnMaxLaunched: 50;
        emitterRadius: range { 1 75; }
        particleDuration: 50;
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 500 1800; }
        particleRed: 1;
        particleGreen: .9;
        particleBlue: range { 0 .4; }
        particleSpinSpeed: track { [-720 720] [-90 90],80; }
        particleScale: range { .1 .3; }
        field {
            fieldType: Friction;
            x: 0.05;
            y: 0.05;
        }
        field {
            fieldType: Acceleration;
            y: 0.5;
        }
    }
    Emitter {
        image: "IMAGE_STAR40";
        emitterType: Circle;
        randomLaunchSpin: 1;
        additive: 1;
        systemDuration: 50;
        spawnMinActive: 20;
        spawnMaxLaunched: 50;
        emitterRadius: range { 1 75; }
        particleDuration: 50;
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 500 1800; }
        particleRed: 1;
        particleGreen: 1;
        particleBlue: range { .6 .8; }
        particleSpinSpeed: track { [-720 720] [-90 90],80; }
        particleScale: range { .1 .3; }
        field {
            fieldType: Friction;
            x: 0.05;
            y: 0.05;
        }
        field {
            fieldType: Acceleration;
            y: 0.5;
        }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS_STAR";
        emitterType: Circle;
        randomLaunchSpin: 1;
        additive: 1;
        systemDuration: 50;
        spawnMinActive: 5;
        spawnMaxLaunched: 50;
        emitterRadius: range { 1 75; }
        particleDuration: 50;
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 500 1800; }
        particleRed: 1;
        particleGreen: range { .6 .7; }
        particleBlue: 0;
        particleSpinSpeed: track { [-720 720] [-90 90],80; }
        particleScale: range { .1 .3; }
        field {
            fieldType: Friction;
            x: 0.05;
            y: 0.05;
        }
        field {
            fieldType: Acceleration;
            y: 0.5;
        }
    }
}
