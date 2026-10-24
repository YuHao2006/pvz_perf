export component Pinata {
    kind: particle;
    source-name: "pinata";
    Emitter {
        images: ["particles/frames/pinata_r0_c0.png","particles/frames/pinata_r0_c1.png","particles/frames/pinata_r0_c2.png","particles/frames/pinata_r0_c3.png","particles/frames/pinata_r0_c4.png"];
        name: "pinata";
        imageFrames: 5;
        animated: 0;
        emitterType: Circle;
        dieIfOverloaded: 1;
        spawnMinActive: nodes {
            { time: 0; low: 10; high: 15; curve: Linear; distribution: Linear; }
        }
        emitterRadius: nodes {
            { time: 0; low: 0; high: 70; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 180; high: 180; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.95; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        launchSpeed: nodes {
            { time: 0; low: 200; high: 500; curve: Linear; distribution: Linear; }
        }
        launchAngle: nodes {
            { time: 0; low: 130; high: 190; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -720; high: 720; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        collisionReflect: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        collisionSpin: nodes {
            { time: 0; low: -10; high: -50; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 17; high: 17; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: GroundConstraint;
            y: nodes {
                { time: 0; low: 90; high: 90; curve: Linear; distribution: Linear; }
            }
        }
    }
}
