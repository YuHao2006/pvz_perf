export component PottedZenGlow {
    kind: particle;
    source-name: "pottedzenglow";
    Emitter {
        image: "IMAGE_GLOW_PARTICLE2";
        name: "Sparks";
        emitterType: Circle;
        systemLoops: 1;
        spawnRate: 30;
        emitterRadius: range { 40 50; }
        emitterOffsetX: 0;
        emitterOffsetY: 20;
        particleDuration: range { 30 60; }
        launchSpeed: range { 40 70; }
        launchAngle: range { 90 270; }
        particleAlpha: track { 0 1,30 1,70 0; }
        particleScale: range { .7 .9; }
        field {
            fieldType: Friction;
            x: 0.015;
            y: 0.015;
        }
        field {
            fieldType: Acceleration;
            y: 1.0;
        }
    }
}
