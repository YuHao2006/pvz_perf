export component ZombieSeaweed {
    kind: particle;
    source-name: "zombie_seaweed";
    Emitter {
        images: ["particles/frames/zombie_seaweed_r0_c0.png","particles/frames/zombie_seaweed_r0_c1.png","particles/frames/zombie_seaweed_r0_c2.png","particles/frames/zombie_seaweed_r0_c3.png"];
        name: "SeaweedHead";
        imageFrames: 4;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemLoops: 1;
        particleLoops: 1;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 5; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 60; high: 60; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.6; high: 0.8; curve: Linear; distribution: Linear; }
        }
    }
}
