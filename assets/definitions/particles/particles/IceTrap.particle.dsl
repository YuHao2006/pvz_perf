export component IceTrap {
    kind: particle;
    source-name: "icetrap";
    Emitter {
        image: "IMAGE_WHITEPIXEL";
        name: "IceFlash";
        fullScreen: 1;
        systemDuration: 30;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        particleDuration: 30;
        particleRed: .5;
        particleGreen: 1;
        particleBlue: 1;
        particleAlpha: track { .5 0; }
        particleScale: 1600;
    }
    Emitter {
        image: "IMAGE_SNOWFLAKES";
        name: "IceTrap";
        imageFrames: 3;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 40;
        spawnMinActive: 40;
        emitterRadius: range { 0 200; }
        particleDuration: 40;
        launchSpeed: range { 200; }
        particleAlpha: track { 1 [.4 .8],80 0; }
        particleSpinSpeed: range { -600 600; }
        particleScale: track { .3,0 [.4 1.5],10 [.4 1.5],70 0,100; }
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
