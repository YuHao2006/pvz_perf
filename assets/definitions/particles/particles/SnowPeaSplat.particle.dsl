export component SnowPeaSplat {
    kind: particle;
    source-name: "snowpeasplat";
    Emitter {
        image: "IMAGE_SNOWPEA_SPLATS";
        imageFrames: 4;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 20;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        emitterRadius: range { 0 10; }
        particleDuration: 20;
        particleAlpha: track { .9,70 0; }
        particleScale: track { [.4 .6] [.8 1.2]; }
    }
    Emitter {
        image: "IMAGE_SNOWPEA_PARTICLES";
        imageFrames: 2;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 30;
        spawnMinActive: range { 6 10; }
        emitterRadius: range { 0 1; }
        particleDuration: 30;
        launchSpeed: range { 150; }
        particleAlpha: track { 1,80 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: track { .3,0 [.8 1.2],10 [.8 1.2],70 0,100; }
        field {
            fieldType: Friction;
            x: track { 0.0,40 .1; }
            y: track { 0.0,40 .1; }
        }
        field {
            fieldType: Acceleration;
            y: 10;
        }
    }
}
