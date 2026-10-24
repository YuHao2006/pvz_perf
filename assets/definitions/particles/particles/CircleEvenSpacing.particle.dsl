export component CircleEvenSpacing {
    kind: particle;
    source-name: "circleevenspacing";
    Emitter {
        image: "IMAGE_PROJECTILE";
        imageFrames: 1;
        animated: 0;
        emitterType: CircleEvenSpacing;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 220; high: 220; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 220; high: 220; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.85; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 100; high: 110; curve: Linear; distribution: Linear; }
        }
        launchAngle: nodes {
            { time: 0; low: -5; high: 5; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -20; high: 20; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 2; high: 3; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Circle;
            y: nodes {
                { time: 0; low: -0.8; high: -1.2; curve: Linear; distribution: Linear; }
            }
        }
    }
}
