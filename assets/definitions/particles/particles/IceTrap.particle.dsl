export component IceTrap {
    kind: particle;
    source-name: "icetrap";
    Emitter {
        image: "IMAGE_WHITEPIXEL";
        name: "IceFlash";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        fullScreen: 1;
        systemDuration: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1600; high: 1600; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        images: ["particles/frames/snowflakes_r0_c0.png","particles/frames/snowflakes_r0_c1.png","particles/frames/snowflakes_r0_c2.png"];
        name: "IceTrap";
        imageFrames: 3;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 200; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0.4; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -600; high: 600; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 0.4; high: 1.5; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.4; high: 1.5; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}
