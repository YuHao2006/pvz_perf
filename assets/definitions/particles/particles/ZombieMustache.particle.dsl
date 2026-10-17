export component ZombieMustache {
    kind: particle;
    source-name: "zombiemustache";
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_MUSTACHE1";
        name: "Mustache";
        randomLaunchSpin: 1;
        spawnMinActive: 1;
        particleDuration: 120;
        systemAlpha: track { 1,95 0,100; }
        launchSpeed: 500.0;
        launchAngle: range { 150 170; }
        particleSpinSpeed: track { [-1720 1720] 0,40; }
        particleScale: .8;
        collisionReflect: track { .3 .3,40 0,50; }
        collisionSpin: track { [-300 -350] 0,40; }
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
