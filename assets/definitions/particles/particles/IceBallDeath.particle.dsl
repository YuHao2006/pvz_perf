export component IceBallDeath {
    kind: particle;
    source-name: "iceballdeath";
    Emitter {
        images: ["particles/frames/snowflakes_r0_c0.png","particles/frames/snowflakes_r0_c1.png","particles/frames/snowflakes_r0_c2.png"];
        imageFrames: 3;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 80; high: 80; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 100; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0.6; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -600; high: 600; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 0.4; high: 1.5; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.6; high: 2; curve: Linear; distribution: Linear; }
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
