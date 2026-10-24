export component ButterSplat {
    kind: particle;
    source-name: "buttersplat";
    Emitter {
        images: ["particles/frames/star_particles_r0_c0.png","particles/frames/star_particles_r0_c1.png","particles/frames/star_particles_r0_c2.png"];
        name: "StarSplatBits";
        imageFrames: 3;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        spawnMinActive: nodes {
            { time: 0; low: 6; high: 10; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 20; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.8; high: 1.2; curve: Linear; distribution: Linear; }
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
                { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
            }
        }
    }
}
