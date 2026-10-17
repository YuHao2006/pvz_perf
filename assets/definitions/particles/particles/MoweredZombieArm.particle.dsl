export component MoweredZombieArm {
    kind: particle;
    source-name: "moweredzombiearm";
    Emitter {
        image: "IMAGE_ZOMBIEARM";
        name: "MoweredArm";
        randomLaunchSpin: 1;
        systemDuration: 60;
        spawnMinActive: 1;
        emitterOffsetX: 30;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: 340.0;
        launchAngle: range { 190 220; }
        particleSpinAngle: -90;
        particleSpinSpeed: track { [-180 -360] 0,40; }
        particleScale: .8;
        collisionReflect: .5;
        collisionSpin: 15;
        field {
            fieldType: Acceleration;
            y: 15.0;
        }
        field {
            fieldType: GroundConstraint;
            y: 0.0;
        }
    }
}
