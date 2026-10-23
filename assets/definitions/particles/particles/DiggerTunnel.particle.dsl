export component DiggerTunnel {
    kind: particle;
    source-name: "diggertunnel";
    Emitter {
        images: ["particles/frames/dirtsmall_r0_c0.png","particles/frames/dirtsmall_r0_c1.png","particles/frames/dirtsmall_r0_c2.png","particles/frames/dirtsmall_r0_c3.png","particles/frames/dirtsmall_r0_c4.png","particles/frames/dirtsmall_r0_c5.png","particles/frames/dirtsmall_r0_c6.png","particles/frames/dirtsmall_r0_c7.png"];
        name: "Tossed Rocks";
        imageFrames: 8;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemLoops: 1;
        spawnRate: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -35; high: 10; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 50; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 150; high: 300; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 140; high: 175; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.7; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -720; high: 720; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.5; high: 0.8; curve: Linear; distribution: Linear; }
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
                { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        images: ["particles/frames/dirtbig_r0_c0.png","particles/frames/dirtbig_r0_c1.png","particles/frames/dirtbig_r0_c2.png","particles/frames/dirtbig_r0_c3.png"];
        name: "Ground Rocks";
        imageFrames: 4;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemLoops: 1;
        particlesDontFollow: 1;
        spawnRate: nodes {
            { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
            { time: 0.125; low: 4; high: 4; curve: Linear; distribution: Linear; }
            { time: 0.25; low: 6; high: 6; curve: Linear; distribution: Linear; }
            { time: 0.375; low: 2; high: 2; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.625; low: 8; high: 8; curve: Linear; distribution: Linear; }
            { time: 0.75; low: 2; high: 2; curve: Linear; distribution: Linear; }
            { time: 0.875; low: 6; high: 6; curve: Linear; distribution: Linear; }
            { time: 1; low: 4; high: 4; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -40; high: -10; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 14; high: 20; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 60; high: 80; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.7; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -100; high: -700; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 0.3; high: 0.5; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Velocity;
            x: nodes {
                { time: 0; low: -1; high: -1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
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
}
