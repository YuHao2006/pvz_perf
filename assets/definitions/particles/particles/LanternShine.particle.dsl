export component LanternShine {
    kind: particle;
    source-name: "lanternshine";
    Emitter {
        image: "IMAGE_LANTERNSHINE";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemLoops: 1;
        particleLoops: 1;
        randomStartTime: 1;
        hardwareOnly: 1;
        spawnMinActive: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 60; high: 120; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Bounce; distribution: Linear; }
            { time: 1; low: 0.3; high: 0.5; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -20; high: -40; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1; high: 1; curve: Bounce; distribution: Linear; }
            { time: 1; low: 0.7; high: 1; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_LANTERNSHINE";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemLoops: 1;
        particleLoops: 1;
        randomStartTime: 1;
        hardwareOnly: 1;
        spawnMinActive: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 60; high: 120; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Bounce; distribution: Linear; }
            { time: 1; low: 0.3; high: 0.5; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: 20; high: 40; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1; high: 1; curve: Bounce; distribution: Linear; }
            { time: 1; low: 0.7; high: 1; curve: Linear; distribution: Linear; }
        }
    }
}
