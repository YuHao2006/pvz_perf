export component CabbageSplat {
    kind: particle;
    source-name: "cabbagesplat";
    Emitter {
        images: ["particles/frames/pea_splats_r0_c0.png","particles/frames/pea_splats_r0_c1.png","particles/frames/pea_splats_r0_c2.png","particles/frames/pea_splats_r0_c3.png"];
        name: "PeaSplat";
        imageFrames: 4;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.7; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.6; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.8; high: 1.2; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        images: ["particles/frames/pea_particles_r0_c0.png","particles/frames/pea_particles_r0_c1.png","particles/frames/pea_particles_r0_c2.png"];
        name: "PeaSplatBits";
        imageFrames: 3;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 6; high: 10; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 2; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
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
