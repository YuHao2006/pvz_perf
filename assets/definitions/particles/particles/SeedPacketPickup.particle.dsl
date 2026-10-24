export component SeedPacketPickup {
    kind: particle;
    source-name: "seedpacketpickup";
    Emitter {
        image: "IMAGE_ZombieHead";
        imageFrames: 1;
        animated: 0;
        emitterType: CircleEvenSpacing;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 15; high: 15; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 15; high: 15; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 30; high: 30; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 30; high: 30; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 45; high: 45; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 120; high: 120; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: EaseIn; distribution: Linear; }
            { time: 1; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 300; high: 300; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 3; high: 3; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_ZombieHead";
        imageFrames: 1;
        animated: 0;
        emitterType: CircleEvenSpacing;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0.1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 11; high: 11; curve: Linear; distribution: Linear; }
            { time: 0.3; low: 11; high: 11; curve: Linear; distribution: Linear; }
            { time: 0.3; low: 27; high: 27; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 27; high: 27; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 42; high: 42; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 120; high: 120; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: EaseIn; distribution: Linear; }
            { time: 1; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 300; high: 300; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 3; high: 3; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
            }
        }
    }
}
