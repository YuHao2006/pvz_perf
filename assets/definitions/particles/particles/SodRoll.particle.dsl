export component SodRoll {
    kind: particle;
    source-name: "sodroll";
    Emitter {
        images: ["particles/frames/dirtsmall_r0_c0.png","particles/frames/dirtsmall_r0_c1.png","particles/frames/dirtsmall_r0_c2.png","particles/frames/dirtsmall_r0_c3.png","particles/frames/dirtsmall_r0_c4.png","particles/frames/dirtsmall_r0_c5.png","particles/frames/dirtsmall_r0_c6.png","particles/frames/dirtsmall_r0_c7.png"];
        imageFrames: 8;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
            { time: 1; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: 0; high: 25; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: -130; high: 0; curve: Linear; distribution: Linear; }
            { time: 1; low: -100; high: 0; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 10; high: 25; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 90; high: 180; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.7; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -1720; high: 1720; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 0.9; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0; low: 0.05; high: 0.05; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0.05; high: 0.05; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
            }
        }
        systemField {
            fieldType: SystemPosition;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 740; high: 740; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}
