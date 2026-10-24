export component MindControl {
    kind: particle;
    source-name: "mindcontrol";
    Emitter {
        image: "IMAGE_MINDCONTROL";
        imageFrames: 1;
        animated: 0;
        emitterType: CircleEvenSpacing;
        alignLaunchSpin: 1;
        spawnMinActive: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.85; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 100; high: 110; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 180; high: 180; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.3; high: 0.6; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.4; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.3; high: 0.6; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0.4; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0.4; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
            }
        }
    }
}
