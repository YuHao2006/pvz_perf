export component Doom {
    kind: particle;
    source-name: "doom";
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_STEM";
        name: "DoomStem";
        systemDuration: 400;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        emitterOffsetY: -75;
        particleDuration: 150;
        particleAlpha: track { 1,90 0; }
        particleScale: track { 1.15 .9; }
        particleStretch: track { .6 1; }
        field {
            fieldType: Shake;
            x: track { 2 0; }
            y: track { 2 0; }
        }
        field {
            fieldType: Position;
            y: track { 35 15; }
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_BASE";
        name: "DoomBase";
        imageFrames: 3;
        systemDuration: 400;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        emitterOffsetX: -4;
        emitterOffsetY: 10;
        particleDuration: 150;
        particleAlpha: track { 1,90 0; }
        animationRate: 5;
        field {
            fieldType: Shake;
            x: track { 2 0; }
            y: track { 2 0; }
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomUnderCap";
        randomLaunchSpin: 1;
        systemDuration: 400;
        spawnMinActive: 8;
        spawnMaxLaunched: 8;
        emitterBoxX: range { -70 70; }
        emitterBoxY: range { 0 10; }
        particleDuration: 150;
        launchSpeed: 0;
        particleAlpha: track { 1,90 0; }
        particleBrightness: range { 0.7 1; }
        particleSpinSpeed: range { 200 300; }
        particleScale: range { .3 0.4; }
        field {
            fieldType: Position;
            x: 0;
            y: track { 0 -130; }
        }
        systemField {
            fieldType: SystemPosition;
            x: 0;
            y: -60;
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomLeft";
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 400;
        spawnMinActive: 2;
        spawnMaxLaunched: 2;
        emitterRadius: range { 1 20; }
        particleDuration: 150;
        launchSpeed: 0;
        particleAlpha: track { 1,90 0; }
        particleBrightness: range { 0.3 0.6; }
        particleSpinSpeed: range { 200 300; }
        particleScale: range { .5 0.6; }
        field {
            fieldType: Position;
            x: 0;
            y: track { 0 -60; }
        }
        systemField {
            fieldType: SystemPosition;
            x: -90;
            y: -120;
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomRight";
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 400;
        spawnMinActive: 2;
        spawnMaxLaunched: 2;
        emitterRadius: range { 1 30; }
        particleDuration: 150;
        launchSpeed: 0;
        particleAlpha: track { 1,90 0; }
        particleBrightness: range { 0.3 0.6; }
        particleSpinSpeed: range { -200 -300; }
        particleScale: range { .5 0.6; }
        field {
            fieldType: Position;
            x: 0;
            y: track { 0 -60; }
        }
        systemField {
            fieldType: SystemPosition;
            x: 90;
            y: -120;
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomCenterLeft";
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 400;
        spawnMinActive: 2;
        spawnMaxLaunched: 2;
        emitterRadius: range { 1 30; }
        particleDuration: 150;
        launchSpeed: 0;
        particleAlpha: track { 1,90 0; }
        particleBrightness: range { 0.3 0.6; }
        particleSpinSpeed: range { 200 300; }
        particleScale: range { .6 0.7; }
        field {
            fieldType: Position;
            x: 0;
            y: track { 0 -60; }
        }
        systemField {
            fieldType: SystemPosition;
            x: -40;
            y: -140;
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomCenterRight";
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 400;
        spawnMinActive: 2;
        spawnMaxLaunched: 2;
        emitterRadius: range { 1 20; }
        particleDuration: 150;
        launchSpeed: 0;
        particleAlpha: track { 1,90 0; }
        particleBrightness: range { 0.3 0.6; }
        particleSpinSpeed: range { -200 -300; }
        particleScale: range { .6 0.7; }
        field {
            fieldType: Position;
            x: 0;
            y: track { 0 -60; }
        }
        systemField {
            fieldType: SystemPosition;
            x: 40;
            y: -140;
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomTopCenter";
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 400;
        spawnMinActive: 2;
        spawnMaxLaunched: 2;
        emitterRadius: range { 0 10; }
        particleDuration: 150;
        launchSpeed: 0;
        particleAlpha: track { 1,90 0; }
        particleBrightness: range { 0.3 0.6; }
        particleSpinSpeed: range { 100 200; }
        particleScale: range { .6 0.8; }
        field {
            fieldType: Position;
            x: 0;
            y: track { 0 -60; }
        }
        systemField {
            fieldType: SystemPosition;
            x: 0;
            y: -160;
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomMiddleCenter";
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 400;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        emitterRadius: range { 0 10; }
        particleDuration: 150;
        launchSpeed: 0;
        particleAlpha: track { 1,90 0; }
        particleBrightness: range { 0.3 0.6; }
        particleSpinSpeed: range { -100 -200; }
        particleScale: range { .6 0.8; }
        field {
            fieldType: Position;
            x: 0;
            y: track { 0 -60; }
        }
        systemField {
            fieldType: SystemPosition;
            x: 0;
            y: -100;
        }
    }
    Emitter {
        image: "IMAGE_DOOM";
        name: "DoomWord";
        systemDuration: 400;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        emitterOffsetY: -20;
        particleDuration: 150;
        particleAlpha: track { 1,80 0; }
        field {
            fieldType: Shake;
            x: 2;
            y: 2;
        }
    }
    Emitter {
        image: "IMAGE_WHITEPIXEL";
        name: "DoomFlash";
        fullScreen: 1;
        systemDuration: 400;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        particleDuration: 50;
        particleRed: track { 1 .6; }
        particleGreen: track { 1 0; }
        particleBlue: track { 1 .4; }
        particleAlpha: track { 1 0; }
        particleScale: 1600;
    }
}
