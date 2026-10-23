export component WallnutEatSmall {
    kind: particle;
    source-name: "wallnuteatsmall";
    Emitter {
        images: ["particles/frames/wallnutparticlessmall_r0_c0.png","particles/frames/wallnutparticlessmall_r0_c1.png","particles/frames/wallnutparticlessmall_r0_c2.png","particles/frames/wallnutparticlessmall_r0_c3.png","particles/frames/wallnutparticlessmall_r0_c4.png"];
        imageFrames: 5;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnRate: track { 40 0; }
        spawnMaxLaunched: 3;
        emitterRadius: range { 0 10; }
        particleDuration: range { 30 60; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 100 120; }
        launchAngle: range { 180 210; }
        particleAlpha: track { 1,80 0; }
        particleSpinSpeed: range { -1400 1400; }
        particleScale: range { .9 1.1; }
        field {
            fieldType: Acceleration;
            y: 8;
        }
        field {
            fieldType: Position;
            x: track { 0 [-40 10]; }
        }
    }
}
