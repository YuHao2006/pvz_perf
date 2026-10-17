export component ZombieFlag {
    kind: particle;
    source-name: "zombieflag";
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_FLAG3";
        randomLaunchSpin: 1;
        systemDuration: 50;
        spawnMinActive: 1;
        systemAlpha: track { 1,80 0,100; }
        launchSpeed: 200.0;
        launchAngle: range { 120 160; }
        particleSpinAngle: 30;
        particleSpinSpeed: track { [-200 -600] [-100 -300]; }
        particleScale: .8;
        collisionReflect: .3;
        collisionSpin: range { -3 -6; }
        field {
            fieldType: Acceleration;
            y: 17.0;
        }
        field {
            fieldType: GroundConstraint;
            y: 90.0;
        }
        field {
            fieldType: Velocity;
            x: 100;
        }
    }
}
