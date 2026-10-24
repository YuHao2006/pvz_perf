export component WallnutEatSmall {
    kind: particle;
    source-name: "wallnuteatsmall";
    Emitter {
        images: ["particles/frames/wallnutparticlessmall_r0_c0.png","particles/frames/wallnutparticlessmall_r0_c1.png","particles/frames/wallnutparticlessmall_r0_c2.png","particles/frames/wallnutparticlessmall_r0_c3.png","particles/frames/wallnutparticlessmall_r0_c4.png"];
        imageFrames: 5;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 3; high: 3; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 30; high: 60; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 100; high: 120; curve: Linear; distribution: Linear; }
        }
        launchAngle: nodes {
            { time: 0; low: 180; high: 210; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -1400; high: 1400; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.9; high: 1.1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 8; high: 8; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -40; high: 10; curve: Linear; distribution: Linear; }
            }
        }
    }
}
