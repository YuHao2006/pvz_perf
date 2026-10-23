export component GraveBuster {
    kind: particle;
    source-name: "gravebuster";
    Emitter {
        images: ["particles/frames/rocksmall_r0_c0.png","particles/frames/rocksmall_r0_c1.png","particles/frames/rocksmall_r0_c2.png","particles/frames/rocksmall_r0_c3.png","particles/frames/rocksmall_r0_c4.png","particles/frames/rocksmall_r0_c5.png","particles/frames/rocksmall_r0_c6.png","particles/frames/rocksmall_r0_c7.png"];
        imageFrames: 8;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -25; high: 25; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: -10; high: -18; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 50; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.92; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 100; high: 200; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
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
            { time: 0; low: 0.3; high: 0.8; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0; low: 0.02; high: 0.02; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0.02; high: 0.02; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
            }
        }
        systemField {
            fieldType: SystemPosition;
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 30; high: 30; curve: Linear; distribution: Linear; }
            }
        }
    }
}
