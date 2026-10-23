export component IceBallDeath {
    kind: particle;
    source-name: "iceballdeath";
    Emitter {
        images: ["particles/frames/snowflakes_r0_c0.png","particles/frames/snowflakes_r0_c1.png","particles/frames/snowflakes_r0_c2.png"];
        imageFrames: 3;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 40;
        spawnMinActive: 80;
        emitterRadius: range { 0 100; }
        particleDuration: 40;
        launchSpeed: range { 200; }
        particleAlpha: track { 1 [.6 .9],80 0; }
        particleSpinSpeed: range { -600 600; }
        particleScale: track { .3,0 [.4 1.5],10 [.6 2],70 0,100; }
        field {
            fieldType: Acceleration;
            y: 5;
        }
        field {
            fieldType: Position;
            x: 0;
        }
    }
}
