export component ZombieHeadPool {
    kind: particle;
    source-name: "zombieheadpool";
    Emitter {
        image: "IMAGE_ZOMBIEHEAD";
        name: "HeadPool";
        randomLaunchSpin: 1;
        systemDuration: 50;
        spawnMinActive: 1;
        emitterOffsetX: 5;
        systemAlpha: track { 1,80 0,100; }
        launchSpeed: 330.0;
        launchAngle: range { 150 185; }
        particleSpinSpeed: track { [-720 720] 0,40; }
        particleScale: .8;
        field {
            fieldType: Acceleration;
            y: 17.0;
        }
    }
}
