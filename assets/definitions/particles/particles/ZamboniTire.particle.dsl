export component ZamboniTire {
    kind: particle;
    source-name: "zambonitire";
    Emitter {
        image: "IMAGE_DIRTSMALL";
        name: "Rocks";
        imageFrames: 8;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 500;
        spawnMinActive: track { 10,0 0,5; }
        emitterRadius: range { 0 10; }
        particleDuration: range { 30 40; }
        systemAlpha: track { 1,92 0; }
        launchSpeed: range { 50 200; }
        launchAngle: range { 140 220; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -720 720; }
        particleScale: range { .5 .6; }
        field {
            fieldType: Acceleration;
            y: 5.0;
        }
    }
    Emitter {
        image: "IMAGE_ZAMBONISMOKE";
        imageFrames: 3;
        emitterType: Circle;
        randomLaunchSpin: 1;
        particlesDontFollow: 1;
        spawnMinActive: track { [6 10] 0,50; }
        emitterRadius: range { 0 10; }
        particleDuration: range { 40 60; }
        launchSpeed: 0;
        particleAlpha: track { 1,50 0; }
        particleSpinSpeed: track { [-100 100] 0,50; }
        particleScale: track { 0 1.5,10 [1 2]; }
        field {
            fieldType: Away;
            x: track { [20 80] 0; }
        }
    }
}
