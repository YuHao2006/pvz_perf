export component PortalCircle {
    kind: particle;
    source-name: "portalcircle";
    Emitter {
        image: "IMAGE_WHITEELLIPSE";
        name: "PortalCircle";
        imageFrames: 1;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemLoops: 1;
        spawnRate: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 30; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 40; high: 100; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 100; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { low: 1; high: 1; curve: Linear; distribution: Linear; }
            { low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.1; high: 0.5; curve: Linear; distribution: EaseIn; }
        }
        particleStretch: nodes {
            { time: 0; low: 0.5; high: 1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: EaseOut; distribution: Linear; }
                { time: 1; low: 10; high: 10; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -5; high: 5; curve: Linear; distribution: Linear; }
            }
        }
    }
}
