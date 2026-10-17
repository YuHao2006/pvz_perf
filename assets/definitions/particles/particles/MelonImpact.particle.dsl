export component MelonImpact {
    kind: particle;
    source-name: "melonimpact";
    Emitter {
        image: "IMAGE_MELONPULT_PARTICLES";
        imageFrames: 9;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 50;
        spawnRate: 200;
        spawnMaxLaunched: 15;
        emitterRadius: range { 5 30; }
        particleDuration: 50;
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 100 200; }
        particleSpinSpeed: track { [-1120 1120] [-300 300]; }
        field {
            fieldType: Friction;
            x: 0.03;
            y: 0.03;
        }
        field {
            fieldType: Acceleration;
            y: 5.0;
        }
        field {
            fieldType: Position;
            x: track { 0 20; }
            y: track { 0 10; }
        }
    }
}
