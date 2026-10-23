export component IceSparkle {
    kind: particle;
    source-name: "icesparkle";
    Emitter {
        images: ["particles/frames/ice_sparkles_r0_c0.png","particles/frames/ice_sparkles_r0_c1.png","particles/frames/ice_sparkles_r0_c2.png"];
        imageFrames: 3;
        systemLoops: 1;
        particlesDontFollow: 1;
        spawnRate: 12;
        emitterBoxX: range { 23 800; }
        emitterBoxY: range { 28 74; }
        particleDuration: range { 80 200; }
        particleAlpha: track { 0 1,20 1,80 0; }
        particleScale: range { 1 1; }
    }
}
