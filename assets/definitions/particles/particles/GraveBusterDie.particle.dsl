export component GraveBusterDie {
    kind: particle;
    source-name: "gravebusterdie";
    Emitter {
        image: "IMAGE_DIRTSMALL";
        imageRow: 1;
        imageFrames: 8;
        randomLaunchSpin: 1;
        systemDuration: 500;
        spawnMinActive: track { 20,0 0,5; }
        emitterBoxX: range { -35 35; }
        emitterBoxY: -14;
        particleDuration: range { 30 40; }
        systemAlpha: track { 1,92 0; }
        launchSpeed: range { 50 400; }
        launchAngle: range { 140 220; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -720 720; }
        particleScale: range { .7 .9; }
        field {
            fieldType: Friction;
            x: 0.015;
            y: 0.015;
        }
        field {
            fieldType: Acceleration;
            y: 5.0;
        }
    }
}
