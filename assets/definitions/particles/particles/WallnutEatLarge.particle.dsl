export component WallnutEatLarge {
    kind: particle;
    source-name: "wallnuteatlarge";
    Emitter {
        images: ["particles/frames/wallnutparticleslarge_r0_c0.png","particles/frames/wallnutparticleslarge_r0_c1.png","particles/frames/wallnutparticleslarge_r0_c2.png","particles/frames/wallnutparticleslarge_r0_c3.png","particles/frames/wallnutparticleslarge_r0_c4.png"];
        imageFrames: 5;
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnRate: track { 50 0; }
        spawnMaxLaunched: 6;
        emitterOffsetX: range { -30 10; }
        emitterOffsetY: range { -10 30; }
        particleDuration: range { 30 60; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 100 120; }
        launchAngle: range { 180 210; }
        particleAlpha: track { 1,80 0; }
        particleSpinSpeed: range { -600 600; }
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
