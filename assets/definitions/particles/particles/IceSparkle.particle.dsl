export component IceSparkle {
    kind: particle;
    source-name: "icesparkle";
    Emitter {
        images: ["particles/frames/ice_sparkles_r0_c0.png","particles/frames/ice_sparkles_r0_c1.png","particles/frames/ice_sparkles_r0_c2.png"];
        imageFrames: 3;
        animated: 0;
        emitterType: Box;
        systemLoops: 1;
        particlesDontFollow: 1;
        spawnRate: nodes {
            { time: 0; low: 12; high: 12; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: 23; high: 800; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 28; high: 74; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 80; high: 200; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
    }
}
