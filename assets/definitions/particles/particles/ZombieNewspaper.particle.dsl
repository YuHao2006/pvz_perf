export component ZombieNewspaper {
    kind: particle;
    source-name: "zombienewspaper";
    Emitter {
        image: "IMAGE_REANIM_ZOMBIE_PAPER_PAPER3";
        name: "ZombieNewspaper";
        randomLaunchSpin: 1;
        systemDuration: 40;
        spawnMinActive: 1;
        systemAlpha: track { 1,60 0,100; }
        launchSpeed: 200.0;
        launchAngle: range { 120 180; }
        particleSpinSpeed: track { [-200 -400] 0,40; }
        particleScale: track { .8 .33; }
        particleStretch: track { 1 3; }
        field {
            fieldType: Acceleration;
            y: 17.0;
        }
    }
}
