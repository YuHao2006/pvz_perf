export component TallNutBlock {
    kind: particle;
    source-name: "tallnutblock";
    Emitter {
        image: "IMAGE_STAR40";
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnMinActive: 6;
        spawnMaxLaunched: 6;
        emitterRadius: range { 10 50; }
        particleDuration: range { 20 20; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 100 100; }
        particleRed: 1;
        particleGreen: .9;
        particleBlue: 0;
        particleAlpha: track { 1,40 0; }
        particleSpinSpeed: range { -1400 1400; }
        particleScale: range { .2 .4; }
        field {
            fieldType: Friction;
            x: track { 0.0,40 0; }
            y: track { 0.0,40 0; }
        }
        field {
            fieldType: Acceleration;
            y: 0;
        }
    }
}
