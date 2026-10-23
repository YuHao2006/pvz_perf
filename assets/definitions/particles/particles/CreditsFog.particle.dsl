export component CreditsFog {
    kind: particle;
    source-name: "credits_fog";
    Emitter {
        images: ["particles/frames/fog_r0_c0.png","particles/frames/fog_r0_c1.png","particles/frames/fog_r0_c2.png","particles/frames/fog_r0_c3.png","particles/frames/fog_r0_c4.png","particles/frames/fog_r0_c5.png","particles/frames/fog_r0_c6.png","particles/frames/fog_r0_c7.png"];
        imageFrames: 8;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemLoops: 1;
        systemDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 15; high: 15; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.4; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -100; high: 100; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 0.3; high: 0.4; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.35; high: 0.45; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 0.5; low: 20; high: 100; curve: Linear; distribution: Linear; }
                { time: 1; low: -20; high: 200; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: EaseOut; distribution: Linear; }
                { time: 1; low: 140; high: 150; curve: Linear; distribution: Linear; }
            }
        }
    }
}
