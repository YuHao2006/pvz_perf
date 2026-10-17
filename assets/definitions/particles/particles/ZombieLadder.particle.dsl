export component ZombieLadder {
    kind: particle;
    source-name: "zombieladder";
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_LADDER_1_DAMAGE2";
        randomLaunchSpin: 1;
        systemDuration: 40;
        spawnMinActive: 1;
        systemAlpha: track { 1,60 0,100; }
        launchSpeed: 200.0;
        launchAngle: range { 100 120; }
        particleSpinSpeed: track { [-400 -500] 0,40; }
        particleScale: 0.8;
        collisionReflect: .3;
        collisionSpin: range { -3 -6; }
        field {
            fieldType: Acceleration;
            y: 17.0;
        }
        field {
            fieldType: GroundConstraint;
            y: 30.0;
        }
    }
}
