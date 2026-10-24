export component TallNutBlock {
    kind: particle;
    source-name: "tallnutblock";
    Emitter {
        image: "IMAGE_STAR40";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 6; high: 6; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 6; high: 6; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 10; high: 50; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.4; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -1400; high: 1400; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.2; high: 0.4; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0.4; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0.4; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}
