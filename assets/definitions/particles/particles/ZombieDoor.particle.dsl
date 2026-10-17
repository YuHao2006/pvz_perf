export component ZombieDoor {
    kind: particle;
    source-name: "zombiedoor";
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_SCREENDOOR3";
        randomLaunchSpin: 1;
        systemDuration: 40;
        spawnMinActive: 1;
        systemAlpha: track { 1,60 0,100; }
        launchSpeed: 200.0;
        launchAngle: range { 120 180; }
        particleSpinSpeed: track { [-200 -400] 0,40; }
        particleScale: .8;
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
