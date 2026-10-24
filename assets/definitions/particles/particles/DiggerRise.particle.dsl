export component DiggerRise {
    kind: particle;
    source-name: "diggerrise";
    Emitter {
        images: ["particles/frames/dirtsmall_r0_c0.png","particles/frames/dirtsmall_r0_c1.png","particles/frames/dirtsmall_r0_c2.png","particles/frames/dirtsmall_r0_c3.png","particles/frames/dirtsmall_r0_c4.png","particles/frames/dirtsmall_r0_c5.png","particles/frames/dirtsmall_r0_c6.png","particles/frames/dirtsmall_r0_c7.png"];
        name: "Rocks";
        imageFrames: 8;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 500; high: 500; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
            { time: 0.05; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -35; high: 35; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: -14; high: -14; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 30; high: 40; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.92; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 50; high: 400; curve: Linear; distribution: Linear; }
        }
        launchAngle: nodes {
            { time: 0; low: 140; high: 220; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.7; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -720; high: 720; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 0.9; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0; low: 0.015; high: 0.015; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0.015; high: 0.015; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
            }
        }
    }
}
