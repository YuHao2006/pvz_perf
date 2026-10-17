export component DiggerTunnel {
    kind: particle;
    source-name: "diggertunnel";
    Emitter {
        image: "IMAGE_DIRTSMALL";
        name: "Tossed Rocks";
        imageFrames: 8;
        randomLaunchSpin: 1;
        systemLoops: 1;
        spawnRate: 20;
        emitterBoxX: range { -35 10; }
        emitterBoxY: 0;
        particleDuration: range { 40 50; }
        launchSpeed: range { 150 300; }
        launchAngle: range { 140 175; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -720 720; }
        particleScale: range { .5 0.8; }
        field {
            fieldType: Friction;
            x: 0.02;
            y: 0.02;
        }
        field {
            fieldType: Acceleration;
            y: 10.0;
        }
        field {
            fieldType: Shake;
            x: track { 1 0; }
            y: track { 1 0; }
        }
    }
    Emitter {
        image: "IMAGE_DIRTBIG";
        name: "Ground Rocks";
        imageFrames: 4;
        randomLaunchSpin: 1;
        systemLoops: 1;
        particlesDontFollow: 1;
        spawnRate: track { 2 4 6 2 0 8 2 6 4; }
        emitterBoxX: range { -40 -10; }
        emitterBoxY: range { 14 20; }
        particleDuration: range { 60 80; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -100 -700; }
        particleScale: track { 0,0 [.3 .5],10; }
        field {
            fieldType: Velocity;
            x: track { -1 0; }
        }
        field {
            fieldType: Shake;
            x: track { 2 0; }
            y: track { 2 0; }
        }
    }
}
