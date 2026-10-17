export component TrophySparkle {
    kind: particle;
    source-name: "trophysparkle";
    Emitter {
        image: "IMAGE_ICE_SPARKLES";
        name: "Sparkle";
        imageFrames: 3;
        emitterType: Circle;
        systemLoops: 1;
        spawnRate: .5;
        emitterRadius: range { 0 40; }
        particleDuration: range { 70 100; }
        particleAlpha: track { 0 1,20 1,80 0; }
        particleSpinSpeed: track { 0 -100 0; }
        particleScale: range { 1 1; }
    }
    Emitter {
        image: "IMAGE_ICE_SPARKLES";
        name: "SparkleBottom";
        imageFrames: 3;
        emitterType: Circle;
        systemLoops: 1;
        spawnRate: .9;
        emitterRadius: range { 0 40; }
        emitterOffsetY: 130;
        particleDuration: range { 80 150; }
        particleAlpha: track { 0 1,20 1,80 0; }
        particleSpinSpeed: track { 0 -100 0; }
        particleScale: range { 1 1; }
    }
}
