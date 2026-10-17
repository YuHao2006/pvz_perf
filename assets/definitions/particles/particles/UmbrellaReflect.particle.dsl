export component UmbrellaReflect {
    kind: particle;
    source-name: "umbrellareflect";
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL";
        randomLaunchSpin: 1;
        spawnMinActive: 1;
        particleDuration: 80;
        systemAlpha: track { 1,85 0,100; }
        launchSpeed: 430.0;
        launchAngle: range { 190 220; }
        particleSpinSpeed: range { -720 720; }
        particleScale: 1.1;
        field {
            fieldType: Acceleration;
            y: 10.0;
        }
    }
}
