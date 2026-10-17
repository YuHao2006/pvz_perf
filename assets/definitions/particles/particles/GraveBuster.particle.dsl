export component GraveBuster {
    kind: particle;
    source-name: "gravebuster";
    Emitter {
        image: "IMAGE_ROCKSMALL";
        imageFrames: 8;
        randomLaunchSpin: 1;
        systemDuration: 400;
        spawnRate: 20;
        emitterBoxX: range { -25 25; }
        emitterBoxY: range { -10 -18; }
        particleDuration: range { 40 50; }
        systemAlpha: track { 1,92 0; }
        launchSpeed: range { 100 200; }
        launchAngle: range { 140 220; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -720 720; }
        particleScale: range { .3 .8; }
        field {
            fieldType: Friction;
            x: 0.02;
            y: 0.02;
        }
        field {
            fieldType: Acceleration;
            y: 5.0;
        }
        systemField {
            fieldType: SystemPosition;
            y: track { 0 30; }
        }
    }
}
