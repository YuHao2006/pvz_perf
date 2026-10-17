export component ZombieArm {
    kind: particle;
    source-name: "zombiearm";
    Emitter {
        image: "IMAGE_ZOMBIEARM";
        randomLaunchSpin: 1;
        systemDuration: 60;
        spawnMinActive: 1;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: 40.0;
        launchAngle: range { 90 185; }
        particleSpinSpeed: track { [0 360] 0,40; }
        particleScale: .8;
        collisionReflect: .5;
        collisionSpin: range { 3 6; }
        field {
            fieldType: Acceleration;
            y: 15.0;
        }
        field {
            fieldType: GroundConstraint;
            y: 60.0;
        }
    }
}
