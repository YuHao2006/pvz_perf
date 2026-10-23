export component PortalSquare {
    kind: particle;
    source-name: "portalsquare";
    Emitter {
        image: "IMAGE_WHITEELLIPSE";
        name: "PortalSquare";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemLoops: 1;
        spawnMinActive: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: 20; high: 40; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 10; high: 110; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 400; curve: Linear; distribution: Linear; }
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
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 4; high: 4; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -0.5; high: 0.5; curve: Linear; distribution: Linear; }
            }
        }
    }
}
