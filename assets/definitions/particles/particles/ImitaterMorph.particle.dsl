export component ImitaterMorph {
    kind: particle;
    source-name: "imitatermorph";
    Emitter {
        images: ["particles/frames/imitaterclouds_r0_c0.png","particles/frames/imitaterclouds_r0_c1.png"];
        name: "ImitaterClouds";
        imageFrames: 2;
        animated: 1;
        emitterType: Box;
        randomLaunchSpin: 1;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 60; high: 60; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.7; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.9; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 1; low: 1.2; high: 1.2; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        images: ["particles/frames/imitaterpuffs_r0_c0.png","particles/frames/imitaterpuffs_r0_c1.png","particles/frames/imitaterpuffs_r0_c2.png","particles/frames/imitaterpuffs_r0_c3.png","particles/frames/imitaterpuffs_r0_c4.png","particles/frames/imitaterpuffs_r0_c5.png","particles/frames/imitaterpuffs_r0_c6.png","particles/frames/imitaterpuffs_r0_c7.png"];
        name: "ImitaterPuffs";
        imageFrames: 8;
        animated: 0;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 60; high: 60; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0.2; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 1; high: 10; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 60; high: 60; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.6; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: 300; high: 400; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.6; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 1; low: 1.2; high: 1.5; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: -140; high: -70; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 100; high: 150; curve: Linear; distribution: Linear; }
            }
        }
    }
}
