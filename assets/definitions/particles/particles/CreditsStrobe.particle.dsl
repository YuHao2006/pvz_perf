export component CreditsStrobe {
    kind: particle;
    source-name: "credits_strobe";
    Emitter {
        image: "IMAGE_WHITEPIXEL";
        name: "CreditsStrobe";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        fullScreen: 1;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 6; high: 6; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1600; high: 1600; curve: Linear; distribution: Linear; }
        }
    }
}
