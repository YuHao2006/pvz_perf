export component PerfTest {
    kind: particle;
    source-name: "perftest";
    Emitter {
        images: ["particles/frames/dirtsmall_r1_c0.png","particles/frames/dirtsmall_r1_c1.png","particles/frames/dirtsmall_r1_c2.png","particles/frames/dirtsmall_r1_c3.png","particles/frames/dirtsmall_r1_c4.png","particles/frames/dirtsmall_r1_c5.png","particles/frames/dirtsmall_r1_c6.png","particles/frames/dirtsmall_r1_c7.png"];
        name: "DirtSplash";
        imageFrames: 8;
        randomLaunchSpin: 1;
        systemLoops: 1;
        systemDuration: 200;
        spawnRate: 200;
        emitterBoxX: range { -25 25; }
        emitterBoxY: range { -30 0; }
        particleDuration: 60;
        launchSpeed: track { [100 200] [100 200] [100 200]; }
        launchAngle: range { 120 240; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -1720 1720; }
        particleScale: range { .7 .9; }
        field {
            fieldType: Friction;
            x: 0.02;
            y: 0.02;
        }
        field {
            fieldType: Acceleration;
            y: 5.0;
        }
    }
    Emitter {
        images: ["particles/frames/dirtbig_r1_c0.png","particles/frames/dirtbig_r1_c1.png","particles/frames/dirtbig_r1_c2.png","particles/frames/dirtbig_r1_c3.png"];
        name: "DirtClumps";
        imageFrames: 4;
        systemLoops: 1;
        systemDuration: 200;
        spawnRate: 100;
        emitterBoxX: range { 5 15; }
        emitterBoxY: range { -18 -12; }
        particleDuration: 200;
        particleAlpha: track { 1,90 0; }
        particleScale: track { 0,0 [.7 .9],10; }
        field {
            fieldType: Position;
            x: track { [-5 5] [-25 25],50; }
            y: track { 0 [12 18],50; }
        }
        field {
            fieldType: Shake;
            x: track { 2 0; }
            y: track { 2 0; }
        }
    }
    Emitter {
        image: "IMAGE_STAR40";
        name: "StarSplash";
        randomLaunchSpin: 1;
        systemLoops: 1;
        systemDuration: 200;
        spawnRate: 200;
        emitterBoxX: range { -25 25; }
        emitterBoxY: range { -30 0; }
        particleDuration: 60;
        launchSpeed: track { [100 200] [100 200] [100 200]; }
        launchAngle: range { 120 240; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -1720 1720; }
        particleScale: range { .7 .9; }
        field {
            fieldType: Friction;
            x: 0.02;
            y: 0.02;
        }
        field {
            fieldType: Acceleration;
            y: 5.0;
        }
    }
    Emitter {
        image: "IMAGE_DOWNARROW";
        name: "ArraySplash";
        randomLaunchSpin: 1;
        systemLoops: 1;
        systemDuration: 200;
        spawnRate: 200;
        emitterBoxX: range { -25 25; }
        emitterBoxY: range { -30 0; }
        particleDuration: 60;
        launchSpeed: track { [100 200] [100 200] [100 200]; }
        launchAngle: range { 120 240; }
        particleAlpha: track { 1,70 0; }
        particleSpinSpeed: range { -1720 1720; }
        particleScale: range { .7 .9; }
        field {
            fieldType: Friction;
            x: 0.02;
            y: 0.02;
        }
        field {
            fieldType: Acceleration;
            y: 5.0;
        }
    }
}
