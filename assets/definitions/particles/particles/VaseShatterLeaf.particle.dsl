export component VaseShatterLeaf {
    kind: particle;
    source-name: "vaseshatterleaf";
    Emitter {
        images: ["particles/frames/vase_chunks_r1_c0.png","particles/frames/vase_chunks_r1_c1.png","particles/frames/vase_chunks_r1_c2.png","particles/frames/vase_chunks_r1_c3.png","particles/frames/vase_chunks_r1_c4.png","particles/frames/vase_chunks_r1_c5.png","particles/frames/vase_chunks_r1_c6.png","particles/frames/vase_chunks_r1_c7.png","particles/frames/vase_chunks_r1_c8.png"];
        name: "Vase";
        imageFrames: 9;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        spawnMinActive: nodes {
            { time: 0; low: 16; high: 16; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 16; high: 16; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -10; high: 40; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 0; high: 70; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 40; high: 80; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -1120; high: 1120; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.8; high: 0.9; curve: Linear; distribution: Linear; }
        }
        collisionReflect: nodes {
            { time: 0.4; low: 0.4; high: 0.4; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        collisionSpin: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 7; high: 7; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: GroundConstraint;
            y: nodes {
                { time: 0; low: 65; high: 78; curve: Linear; distribution: Linear; }
            }
        }
    }
}
