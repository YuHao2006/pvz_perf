export component PottedPlantGlow {
    kind: particle;
    source-name: "pottedplantglow";
    Emitter {
        image: "IMAGE_REANIM_POT_GLOW";
        name: "Ring";
        systemLoops: 1;
        additive: 1;
        spawnMinActive: 1;
        emitterOffsetY: 4;
        particleDuration: range { 100 150; }
        particleAlpha: track { 1 .5 1; }
        particleScale: .85;
    }
    Emitter {
        image: "IMAGE_GLOW_PARTICLE2";
        name: "Sparks";
        emitterType: Circle;
        systemLoops: 1;
        additive: 1;
        spawnRate: 30;
        emitterRadius: range { 40 50; }
        emitterOffsetX: 0;
        emitterOffsetY: 20;
        particleDuration: range { 30 60; }
        launchSpeed: range { 40 70; }
        launchAngle: range { 90 270; }
        particleAlpha: track { 0 .5,30 .5,70 0; }
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
