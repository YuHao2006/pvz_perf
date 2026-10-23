export component ZamboniTire {
    kind: particle;
    source-name: "zambonitire";
    Emitter {
        images: ["particles/frames/dirtsmall_r0_c0.png","particles/frames/dirtsmall_r0_c1.png","particles/frames/dirtsmall_r0_c2.png","particles/frames/dirtsmall_r0_c3.png","particles/frames/dirtsmall_r0_c4.png","particles/frames/dirtsmall_r0_c5.png","particles/frames/dirtsmall_r0_c6.png","particles/frames/dirtsmall_r0_c7.png"];
        name: "Rocks";
        imageFrames: 8;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 500; high: 500; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
            { time: 0.05; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 30; high: 40; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.92; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 50; high: 200; curve: Linear; distribution: Linear; }
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
            { time: 0; low: 0.5; high: 0.6; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        images: ["particles/frames/zambonismoke_r0_c0.png","particles/frames/zambonismoke_r0_c1.png","particles/frames/zambonismoke_r0_c2.png"];
        imageFrames: 3;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        particlesDontFollow: 1;
        spawnMinActive: nodes {
            { time: 0; low: 6; high: 10; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 60; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.5; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -100; high: 100; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 1.5; high: 1.5; curve: Linear; distribution: Linear; }
            { time: 1; low: 1; high: 2; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 20; high: 80; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}
