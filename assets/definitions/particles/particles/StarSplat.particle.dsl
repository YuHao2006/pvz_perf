export component StarSplat {
    kind: particle;
    source-name: "starsplat";
    Emitter {
        image: "IMAGE_STAR_SPLATS";
        name: "StarSplat";
        imageFrames: 4;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 20;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        emitterRadius: range { 0 10; }
        particleDuration: 20;
        particleAlpha: track { .9,70 0; }
        particleScale: track { [.4 .6] [.8 1.2]; }
    }
    Emitter {
        image: "IMAGE_STAR_PARTICLES";
        name: "StarSplatBits";
        imageFrames: 3;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 20;
        spawnMinActive: range { 6 10; }
        emitterRadius: range { 0 10; }
        particleDuration: 20;
        launchSpeed: range { 150; }
        particleAlpha: track { 1,80 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: range { .8 1.2; }
        field {
            fieldType: Friction;
            x: track { 0.0,40 .1; }
            y: track { 0.0,40 .1; }
        }
        field {
            fieldType: Acceleration;
            y: 10;
        }
    }
}
