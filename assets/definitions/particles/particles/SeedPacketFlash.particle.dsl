export component SeedPacketFlash {
    kind: particle;
    source-name: "seedpacketflash";
    Emitter {
        image: "IMAGE_SEEDPACKETFLASH";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 25; high: 25; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 35; high: 35; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 25; high: 25; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
    }
}
