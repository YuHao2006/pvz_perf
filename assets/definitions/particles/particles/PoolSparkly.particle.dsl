export component PoolSparkly {
    kind: particle;
    source-name: "poolsparkly";
    Emitter {
        image: "IMAGE_POOLSPARKLY";
        systemLoops: 1;
        spawnRate: 150;
        emitterBoxX: range { 0 FastInOutWeak 290; }
        emitterBoxY: range { 0 135; }
        emitterSkewX: -.3;
        particleDuration: range { 20 80; }
        particleAlpha: .8;
        particleScale: track { [.3 .6] [.4 .8],10 [.5 1],50 [.4 .8],90 [.3 .6]; }
        field {
            fieldType: Velocity;
            x: range { 0 -10; }
            y: range { -2 2; }
        }
    }
    Emitter {
        image: "IMAGE_POOLSPARKLY";
        systemLoops: 1;
        spawnRate: 20;
        emitterBoxX: range { -330 260; }
        emitterBoxY: range { 0 135; }
        particleDuration: range { 20 60; }
        particleAlpha: .8;
        particleScale: track { [.3 .6] [.4 .8],20 [.5 1],50 [.4 .8],80 [.3 .6]; }
        field {
            fieldType: Velocity;
            x: range { 0 -5; }
            y: range { -2 2; }
        }
    }
}
