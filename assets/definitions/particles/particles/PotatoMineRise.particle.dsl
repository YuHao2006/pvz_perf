export component PotatoMineRise {
    kind: particle;
    source-name: "potatominerise";
    Emitter {
        image: "IMAGE_DIRTSMALL";
        imageFrames: 8;
        randomLaunchSpin: 1;
        systemDuration: 120;
        spawnRate: track { 50,70 0,90; }
        spawnMaxActive: track { 0,0 10,40 100,50 0,70; }
        emitterBoxX: range { -40 40; }
        emitterBoxY: range { -25 25; }
        particleDuration: range { 30 40; }
        systemAlpha: track { 1,92 0; }
        launchSpeed: track { [100 200] [100 200] [100 200]; }
        launchAngle: range { 150 210; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -1720 1720; }
        particleScale: range { .7 .9; }
        field {
            fieldType: Friction;
            x: 0.02;
            y: 0.02;
        }
        field {
            fieldType: Acceleration;
            y: 5.0;
        }
    }
}
