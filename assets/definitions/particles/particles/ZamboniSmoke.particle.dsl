export component ZamboniSmoke {
    kind: particle;
    source-name: "zambonismoke";
    Emitter {
        images: ["particles/frames/zambonismoke_r0_c0.png","particles/frames/zambonismoke_r0_c1.png","particles/frames/zambonismoke_r0_c2.png"];
        imageFrames: 3;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemLoops: 1;
        particlesDontFollow: 1;
        systemDuration: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 4; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 60; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0.4; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -800; high: 800; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 0.5; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 0.6; low: 0.8; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: -1; high: -1; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: EaseOut; distribution: Linear; }
                { time: 1; low: 30; high: 30; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -20; high: -20; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: none;
        name: "FadeOut";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        crossFadeDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
    }
}
