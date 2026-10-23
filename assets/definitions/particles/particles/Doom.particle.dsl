export component Doom {
    kind: particle;
    source-name: "doom";
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_STEM";
        name: "DoomStem";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: -75; high: -75; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1.15; high: 1.15; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleStretch: nodes {
            { time: 0; low: 0.6; high: 0.6; curve: Linear; distribution: Linear; }
            { time: 1; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Position;
            y: nodes {
                { time: 0; low: 35; high: 35; curve: Linear; distribution: Linear; }
                { time: 1; low: 15; high: 15; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        images: ["particles/frames/doomshroom_explosion_base_r0_c0.png","particles/frames/doomshroom_explosion_base_r0_c1.png","particles/frames/doomshroom_explosion_base_r0_c2.png"];
        name: "DoomBase";
        imageFrames: 3;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: -4; high: -4; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        animationRate: nodes {
            { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomUnderCap";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 8; high: 8; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 8; high: 8; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -70; high: 70; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 0; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.7; high: 1; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: 200; high: 300; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.3; high: 0.4; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -130; high: -130; curve: Linear; distribution: Linear; }
            }
        }
        systemField {
            fieldType: SystemPosition;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: -60; high: -60; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomLeft";
        imageFrames: 1;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 1; high: 20; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.3; high: 0.6; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: 200; high: 300; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.5; high: 0.6; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -60; high: -60; curve: Linear; distribution: Linear; }
            }
        }
        systemField {
            fieldType: SystemPosition;
            x: nodes {
                { time: 0; low: -90; high: -90; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: -120; high: -120; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomRight";
        imageFrames: 1;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 1; high: 30; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.3; high: 0.6; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -200; high: -300; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.5; high: 0.6; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -60; high: -60; curve: Linear; distribution: Linear; }
            }
        }
        systemField {
            fieldType: SystemPosition;
            x: nodes {
                { time: 0; low: 90; high: 90; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: -120; high: -120; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomCenterLeft";
        imageFrames: 1;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 1; high: 30; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.3; high: 0.6; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: 200; high: 300; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.6; high: 0.7; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -60; high: -60; curve: Linear; distribution: Linear; }
            }
        }
        systemField {
            fieldType: SystemPosition;
            x: nodes {
                { time: 0; low: -40; high: -40; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: -140; high: -140; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomCenterRight";
        imageFrames: 1;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 1; high: 20; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.3; high: 0.6; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -200; high: -300; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.6; high: 0.7; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -60; high: -60; curve: Linear; distribution: Linear; }
            }
        }
        systemField {
            fieldType: SystemPosition;
            x: nodes {
                { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: -140; high: -140; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomTopCenter";
        imageFrames: 1;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.3; high: 0.6; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: 100; high: 200; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.6; high: 0.8; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -60; high: -60; curve: Linear; distribution: Linear; }
            }
        }
        systemField {
            fieldType: SystemPosition;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: -160; high: -160; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_DOOMSHROOM_EXPLOSION_TOP";
        name: "DoomMushroomMiddleCenter";
        imageFrames: 1;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.3; high: 0.6; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -100; high: -200; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.6; high: 0.8; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -60; high: -60; curve: Linear; distribution: Linear; }
            }
        }
        systemField {
            fieldType: SystemPosition;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: -100; high: -100; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_DOOM";
        name: "DoomWord";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: -20; high: -20; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_WHITEPIXEL";
        name: "DoomFlash";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        fullScreen: 1;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.6; high: 0.6; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.4; high: 0.4; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1600; high: 1600; curve: Linear; distribution: Linear; }
        }
    }
}
