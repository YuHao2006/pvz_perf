export component SnowPeaPuff {
    kind: particle;
    source-name: "snowpeapuff";
    Emitter {
        image: "IMAGE_SNOWPEA_PUFF";
        imageCol: 3;
        animated: 1;
        emitterType: Circle;
        systemDuration: 20;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        emitterRadius: 0;
        particleDuration: 20;
        particleAlpha: track { 0,80 0; }
        particleSpinAngle: 0;
        particleScale: track { .2,0 .4,20 .6,80 .2,100; }
        particleStretch: track { 1 .3; }
        field {
            fieldType: Position;
            x: track { 0 15; }
        }
    }
    Emitter {
        image: "IMAGE_SNOWPEA_PARTICLES";
        imageFrames: 3;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 20;
        spawnMinActive: range { 8 12; }
        emitterRadius: range { 0 5; }
        particleDuration: 20;
        launchSpeed: 0;
        particleAlpha: track { [.3.8],80 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: track { [.8 1.2],70 0,100; }
        field {
            fieldType: Friction;
            x: track { 0.0,40 .1; }
            y: track { 0.0,40 .1; }
        }
        field {
            fieldType: Acceleration;
            y: 5;
        }
        field {
            fieldType: Position;
            x: track { 0 [20 40]; }
            y: track { 0 [-30 20]; }
        }
    }
}
