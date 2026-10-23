export component CreditsZombieHeadWipe {
    kind: particle;
    source-name: "credits_zombieheadwipe";
    Emitter {
        image: "IMAGE_ZombieHead";
        imageFrames: 1;
        animated: 0;
        emitterType: CircleEvenSpacing;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 10; high: 10; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 20; high: 20; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 20; high: 20; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 80; high: 80; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.45; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.55; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: EaseIn; distribution: Linear; }
            { time: 1; low: 8; high: 8; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
                { time: 1; low: 1500; high: 1500; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
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
            { time: 0.05; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.05; low: 11; high: 11; curve: Linear; distribution: Linear; }
            { time: 0.15; low: 11; high: 11; curve: Linear; distribution: Linear; }
            { time: 0.15; low: 27; high: 27; curve: Linear; distribution: Linear; }
            { time: 0.25; low: 27; high: 27; curve: Linear; distribution: Linear; }
            { time: 0.25; low: 38; high: 38; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 38; high: 38; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 80; high: 80; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.45; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.55; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: EaseIn; distribution: Linear; }
            { time: 1; low: 8; high: 8; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
                { time: 1; low: 1500; high: 1500; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: 300; high: 300; curve: Linear; distribution: Linear; }
            }
        }
    }
}
