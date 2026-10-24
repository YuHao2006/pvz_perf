export component IceTrapRelease {
    kind: particle;
    source-name: "icetraprelease";
    Emitter {
        images: ["particles/frames/icetrap_particles_r0_c0.png","particles/frames/icetrap_particles_r0_c1.png","particles/frames/icetrap_particles_r0_c2.png","particles/frames/icetrap_particles_r0_c3.png"];
        imageFrames: 4;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        spawnMinActive: nodes {
            { time: 0; low: 5; high: 10; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -20; high: 0; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: -70; high: -10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 100; high: 150; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0.4; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -600; high: 600; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 0.4; high: 1.5; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.4; high: 1.5; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 0.4; low: 15; high: 15; curve: Linear; distribution: Linear; }
            }
        }
    }
}
