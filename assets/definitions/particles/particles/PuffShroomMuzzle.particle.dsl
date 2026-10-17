export component PuffShroomMuzzle {
    kind: particle;
    source-name: "puffshroommuzzle";
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF2";
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 20;
        spawnMinActive: range { 6 8; }
        emitterRadius: range { 0 5; }
        particleDuration: 20;
        launchSpeed: 0;
        particleAlpha: track { [.3 .8],80 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: track { [.2 .3] [.6 0.8],70 0,100; }
        field {
            fieldType: Friction;
            x: track { 0.0,40 .1; }
            y: track { 0.0,40 .1; }
        }
        field {
            fieldType: Acceleration;
            y: 5;
        }
        field {
            fieldType: Position;
            x: track { 0 [20 40]; }
            y: track { 0 [-30 20]; }
        }
    }
}
