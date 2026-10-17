export component PuffSplat {
    kind: particle;
    source-name: "puffsplat";
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF2";
        name: "PuffSplatBits";
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 20;
        spawnMinActive: range { 6 10; }
        emitterRadius: range { 0 10; }
        particleDuration: 20;
        launchSpeed: range { 50 100; }
        particleAlpha: track { 1,80 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: range { .6 0.8; }
        field {
            fieldType: Friction;
            x: track { 0.0,40 .1; }
            y: track { 0.0,40 .1; }
        }
        field {
            fieldType: Acceleration;
            y: 3;
        }
    }
}
