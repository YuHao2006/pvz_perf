export component PlantingPool {
    kind: particle;
    source-name: "plantingpool";
    Emitter {
        images: ["particles/frames/waterparticle_r0_c0.png","particles/frames/waterparticle_r0_c1.png","particles/frames/waterparticle_r0_c2.png","particles/frames/waterparticle_r0_c3.png","particles/frames/waterparticle_r0_c4.png","particles/frames/waterparticle_r0_c5.png"];
        name: "PlantingPool";
        imageFrames: 6;
        randomLaunchSpin: 1;
        systemDuration: 40;
        spawnMinActive: 16;
        emitterRadius: range { 0 10; }
        particleDuration: 40;
        systemAlpha: track { 1,85 0; }
        launchSpeed: range { 200 300; }
        launchAngle: range { 110 250; }
        particleSpinSpeed: range { -100 100; }
        particleScale: range { .7 1; }
        field {
            fieldType: Friction;
            x: 0.03;
            y: 0.01;
        }
        field {
            fieldType: Acceleration;
            y: 8.0;
        }
    }
}
