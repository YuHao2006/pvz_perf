export component ScreenFlash {
    kind: particle;
    source-name: "screenflash";
    Emitter {
        image: "IMAGE_WHITEPIXEL";
        name: "ScreenFlash";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        fullScreen: 1;
        systemDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1600; high: 1600; curve: Linear; distribution: Linear; }
        }
    }
}
