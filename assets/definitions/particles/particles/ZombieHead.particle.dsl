export component ZombieHead {
    kind: particle;
    source-name: "zombiehead";
    Emitter {
        image: "IMAGE_ZOMBIEHEAD";
        randomLaunchSpin: 1;
        systemDuration: 180;
        spawnMinActive: 1;
        particleDuration: 180;
        systemAlpha: track { 1,95 0,100; }
        launchSpeed: 330.0;
        launchAngle: range { 150 185; }
        particleSpinSpeed: track { [-720 720] 0,40; }
        particleScale: .8;
        collisionReflect: track { .3 .3,40 0,50; }
        collisionSpin: track { [-3 -6] 0,40; }
        field {
            fieldType: Acceleration;
            y: 17.0;
        }
        field {
            fieldType: GroundConstraint;
            y: 90.0;
        }
    }
}
