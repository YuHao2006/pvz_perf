export component SimpleParticle {
    kind: particle;
    source-name: "simpleparticle";
    Emitter {
        image: "IMAGE_SUN";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -50; high: -50; curve: Linear; distribution: Linear; }
        }
    }
}
