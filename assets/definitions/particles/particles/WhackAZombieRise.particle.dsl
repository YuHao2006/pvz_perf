export component WhackAZombieRise {
    kind: particle;
    source-name: "whackazombierise";
    Emitter {
        images: ["particles/frames/dirtsmall_r1_c0.png","particles/frames/dirtsmall_r1_c1.png","particles/frames/dirtsmall_r1_c2.png","particles/frames/dirtsmall_r1_c3.png","particles/frames/dirtsmall_r1_c4.png","particles/frames/dirtsmall_r1_c5.png","particles/frames/dirtsmall_r1_c6.png","particles/frames/dirtsmall_r1_c7.png"];
        name: "DirtSplash";
        imageFrames: 8;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        systemDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        spawnRate: nodes {
            { time: 0.6; low: 50; high: 50; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        spawnMaxActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 10; high: 10; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 100; high: 100; curve: Linear; distribution: Linear; }
            { time: 0.9; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -25; high: 25; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: -30; high: 0; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 30; high: 40; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.92; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 100; high: 200; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 100; high: 200; curve: Linear; distribution: Linear; }
            { time: 1; low: 100; high: 200; curve: Linear; distribution: Linear; }
        }
        launchAngle: nodes {
            { time: 0; low: 120; high: 240; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.7; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -1720; high: 1720; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 0.9; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Friction;
            x: nodes {
                { time: 0; low: 0.02; high: 0.02; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0.02; high: 0.02; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        images: ["particles/frames/dirtbig_r1_c0.png","particles/frames/dirtbig_r1_c1.png","particles/frames/dirtbig_r1_c2.png","particles/frames/dirtbig_r1_c3.png"];
        name: "DirtClumps";
        imageFrames: 4;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 6; high: 6; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: 5; high: 15; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: -18; high: -12; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.94; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 0.7; high: 0.9; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: -5; high: 5; curve: Linear; distribution: Linear; }
                { time: 0.5; low: -25; high: 25; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
                { time: 0.5; low: 12; high: 18; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 2; high: 2; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}
