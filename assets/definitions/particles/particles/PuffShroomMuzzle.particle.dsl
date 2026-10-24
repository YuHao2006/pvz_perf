export component PuffShroomMuzzle {
    kind: particle;
    source-name: "puffshroommuzzle";
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF2";
        imageFrames: 1;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 6; high: 8; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 5; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 0.3; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.2; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.6; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
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
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 20; high: 40; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: -30; high: 20; curve: Linear; distribution: Linear; }
            }
        }
    }
}
