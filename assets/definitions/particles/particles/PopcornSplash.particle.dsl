export component PopcornSplash {
    kind: particle;
    source-name: "popcornsplash";
    Emitter {
        image: "IMAGE_COBCANNON_POPCORN";
        imageFrames: 5;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 50;
        spawnMinActive: 50;
        spawnMaxLaunched: 50;
        emitterRadius: range { 1 50; }
        particleDuration: 50;
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 300 600; }
        particleSpinSpeed: track { [-720 720] [-90 90],80; }
        field {
            fieldType: Friction;
            x: 0.05;
            y: 0.05;
        }
        field {
            fieldType: Acceleration;
            y: 5.0;
        }
    }
}
