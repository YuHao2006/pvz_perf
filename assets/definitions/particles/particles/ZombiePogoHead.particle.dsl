export component ZombiePogoHead {
    kind: particle;
    source-name: "zombiepogohead";
    Emitter {
        image: "IMAGE_ZOMBIEPOGOHEAD";
        name: "Head";
        randomLaunchSpin: 1;
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
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_PAPER_GLASSES";
        name: "Glasses";
        randomLaunchSpin: 1;
        spawnMinActive: 1;
        particleDuration: 180;
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
