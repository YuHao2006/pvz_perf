export component ArtChallengePlant {
    kind: particle;
    source-name: "artchallengeplant";
    Emitter {
        image: "IMAGE_STAR40";
        randomLaunchSpin: 1;
        systemDuration: 60;
        spawnMinActive: 20;
        emitterRadius: range { 40 80; }
        particleDuration: 60;
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 50 200; }
        particleRed: 1;
        particleGreen: .9;
        particleBlue: 0;
        particleSpinSpeed: range { -800 800; }
        particleScale: range { .3 .5; }
        field {
            fieldType: Friction;
            x: track { 0.0,40 0; }
            y: track { 0.0,40 0; }
        }
        field {
            fieldType: Acceleration;
            y: range { 2 3; }
        }
    }
}
