export component IceTrapZombie {
    kind: particle;
    source-name: "icetrapzombie";
    Emitter {
        images: ["particles/frames/icetrap_particles_r0_c0.png","particles/frames/icetrap_particles_r0_c1.png","particles/frames/icetrap_particles_r0_c2.png","particles/frames/icetrap_particles_r0_c3.png"];
        name: "IceTrapParticles";
        imageFrames: 4;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemLoops: 1;
        particleLoops: 1;
        spawnMinActive: nodes {
            { time: 0; low: 10; high: 12; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -20; high: 0; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: -70; high: -10; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.6; high: 0.8; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: none;
        name: "FadeOut";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        crossFadeDuration: nodes {
            { time: 0; low: 25; high: 25; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
    }
}
