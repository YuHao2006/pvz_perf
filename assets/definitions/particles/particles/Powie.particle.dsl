export component Powie {
    kind: particle;
    source-name: "powie";
    Emitter {
        image: "IMAGE_EXPLOSIONCLOUD";
        name: "PowieSmallClouds";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 14; high: 14; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 10; high: 50; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 60; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 2000; high: 2500; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.7; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0.6; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0.4; low: 0.15; high: 0.15; curve: Linear; distribution: Linear; }
                { time: 1; low: 1; high: 1; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0.4; low: 0.18; high: 0.18; curve: Linear; distribution: Linear; }
                { time: 1; low: 1; high: 1; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_EXPLOSIONCLOUD";
        name: "PowieBigClouds";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 14; high: 14; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 10; high: 50; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 60; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 500; high: 1200; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.4; high: 0.4; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.7; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0.6; low: 1.2; high: 1.6; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0.4; low: 0.12; high: 0.12; curve: Linear; distribution: Linear; }
                { time: 1; low: 1; high: 1; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0.4; low: 0.18; high: 0.18; curve: Linear; distribution: Linear; }
                { time: 1; low: 1; high: 1; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_EXPLOSIONPOWIE";
        name: "PowieWord";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
    }
}
