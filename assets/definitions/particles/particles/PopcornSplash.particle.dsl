export component PopcornSplash {
    kind: particle;
    source-name: "popcornsplash";
    Emitter {
        images: ["particles/frames/cobcannon_popcorn_r0_c0.png","particles/frames/cobcannon_popcorn_r0_c1.png","particles/frames/cobcannon_popcorn_r0_c2.png","particles/frames/cobcannon_popcorn_r0_c3.png","particles/frames/cobcannon_popcorn_r0_c4.png"];
        imageFrames: 5;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 1; high: 50; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 300; high: 600; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -720; high: 720; curve: Linear; distribution: Linear; }
            { time: 0.8; low: -90; high: 90; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0; low: 0.05; high: 0.05; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0.05; high: 0.05; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
            }
        }
    }
}
