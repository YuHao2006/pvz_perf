export component VaseShatterLeaf {
    kind: particle;
    source-name: "vaseshatterleaf";
    Emitter {
        image: "IMAGE_VASE_CHUNKS";
        name: "Vase";
        imageRow: 1;
        imageFrames: 9;
        randomLaunchSpin: 1;
        spawnMinActive: 16;
        spawnMaxLaunched: 16;
        emitterBoxX: range { -10 40; }
        emitterBoxY: range { 0 70; }
        particleDuration: 100;
        systemAlpha: track { 1,90 0; }
        launchSpeed: range { 40 80; }
        particleSpinSpeed: track { [-1120 1120] 0,50; }
        particleScale: range { .8 .9; }
        collisionReflect: track { .4,40 0,50; }
        collisionSpin: 0;
        field {
            fieldType: Acceleration;
            y: 7.0;
        }
        field {
            fieldType: GroundConstraint;
            y: range { 65.0 78.0; }
        }
    }
}
