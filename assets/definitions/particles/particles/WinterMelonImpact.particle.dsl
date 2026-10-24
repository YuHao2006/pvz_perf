export component WinterMelonImpact {
    kind: particle;
    source-name: "wintermelonimpact";
    Emitter {
        images: ["particles/frames/wintermelon_particles_r0_c0.png","particles/frames/wintermelon_particles_r0_c1.png","particles/frames/wintermelon_particles_r0_c2.png","particles/frames/wintermelon_particles_r0_c3.png","particles/frames/wintermelon_particles_r0_c4.png","particles/frames/wintermelon_particles_r0_c5.png","particles/frames/wintermelon_particles_r0_c6.png","particles/frames/wintermelon_particles_r0_c7.png","particles/frames/wintermelon_particles_r0_c8.png"];
        imageFrames: 9;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 15; high: 15; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 5; high: 30; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 100; high: 200; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -1120; high: 1120; curve: Linear; distribution: Linear; }
            { time: 1; low: -300; high: 300; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0; low: 0.03; high: 0.03; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0.03; high: 0.03; curve: Linear; distribution: Linear; }
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
                { time: 1; low: 20; high: 20; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 1; low: 10; high: 10; curve: Linear; distribution: Linear; }
            }
        }
    }
}
