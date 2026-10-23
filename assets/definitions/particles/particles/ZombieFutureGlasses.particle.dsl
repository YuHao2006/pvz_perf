export component ZombieFutureGlasses {
    kind: particle;
    source-name: "zombiefutureglasses";
    Emitter {
        images: ["particles/frames/zombiefutureglasses_r0_c0.png","particles/frames/zombiefutureglasses_r0_c1.png","particles/frames/zombiefutureglasses_r0_c2.png","particles/frames/zombiefutureglasses_r0_c3.png"];
        name: "FutureGlasses";
        imageFrames: 4;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 180; high: 180; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.95; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 500; high: 500; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 150; high: 170; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -1720; high: 1720; curve: Linear; distribution: Linear; }
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
            { time: 0; low: -300; high: -350; curve: Linear; distribution: Linear; }
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
