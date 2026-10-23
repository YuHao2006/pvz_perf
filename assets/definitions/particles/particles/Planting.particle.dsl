export component Planting {
    kind: particle;
    source-name: "planting";
    Emitter {
        images: ["particles/frames/dirtsmall_r0_c0.png","particles/frames/dirtsmall_r0_c1.png","particles/frames/dirtsmall_r0_c2.png","particles/frames/dirtsmall_r0_c3.png","particles/frames/dirtsmall_r0_c4.png","particles/frames/dirtsmall_r0_c5.png","particles/frames/dirtsmall_r0_c6.png","particles/frames/dirtsmall_r0_c7.png"];
        name: "Planting";
        imageFrames: 8;
        randomLaunchSpin: 1;
        systemDuration: 30;
        spawnMinActive: 8;
        emitterRadius: range { 0 10; }
        particleDuration: 30;
        systemAlpha: track { 1,85 0; }
        launchSpeed: range { 300 500; }
        launchAngle: range { 110 250; }
        particleSpinSpeed: range { -520 520; }
        particleScale: range { .7 .9; }
        field {
            fieldType: Friction;
            x: 0.08;
            y: 0.08;
        }
        field {
            fieldType: Acceleration;
            y: 8.0;
        }
    }
}
