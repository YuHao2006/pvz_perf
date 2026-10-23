export component SodRoll {
    kind: particle;
    source-name: "sodroll";
    Emitter {
        images: ["particles/frames/dirtsmall_r0_c0.png","particles/frames/dirtsmall_r0_c1.png","particles/frames/dirtsmall_r0_c2.png","particles/frames/dirtsmall_r0_c3.png","particles/frames/dirtsmall_r0_c4.png","particles/frames/dirtsmall_r0_c5.png","particles/frames/dirtsmall_r0_c6.png","particles/frames/dirtsmall_r0_c7.png"];
        imageFrames: 8;
        randomLaunchSpin: 1;
        systemDuration: 200;
        spawnRate: track { 200 100; }
        emitterBoxX: track { [0 25] [0 1]; }
        emitterBoxY: track { [-130 0] [-100 0]; }
        particleDuration: range { 10 25; }
        systemAlpha: track { 1,80 0; }
        launchSpeed: 100.0;
        launchAngle: range { 90 180; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -1720 1720; }
        particleScale: range { .7 .9; }
        field {
            fieldType: Friction;
            x: 0.05;
            y: 0.05;
        }
        field {
            fieldType: Acceleration;
            y: 10.0;
        }
        systemField {
            fieldType: SystemPosition;
            x: track { 0 740; }
            y: track { 30 0; }
        }
    }
}
