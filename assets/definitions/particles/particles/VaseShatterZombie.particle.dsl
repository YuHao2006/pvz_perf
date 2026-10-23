export component VaseShatterZombie {
    kind: particle;
    source-name: "vaseshatterzombie";
    Emitter {
        images: ["particles/frames/vase_chunks_r2_c0.png","particles/frames/vase_chunks_r2_c1.png","particles/frames/vase_chunks_r2_c2.png","particles/frames/vase_chunks_r2_c3.png","particles/frames/vase_chunks_r2_c4.png","particles/frames/vase_chunks_r2_c5.png","particles/frames/vase_chunks_r2_c6.png","particles/frames/vase_chunks_r2_c7.png","particles/frames/vase_chunks_r2_c8.png"];
        name: "Vase";
        imageFrames: 9;
        randomLaunchSpin: 1;
        spawnMinActive: 16;
        spawnMaxLaunched: 16;
        emitterBoxX: range { -10 40; }
        emitterBoxY: range { 0 70; }
        particleDuration: 100;
        systemAlpha: track { 1,90 0; }
        launchSpeed: range { 40 80; }
        particleSpinSpeed: track { [-1120 1120] 0,50; }
        particleScale: range { .8 .9; }
        collisionReflect: track { .4,40 0,50; }
        collisionSpin: 0;
        field {
            fieldType: Acceleration;
            y: 7.0;
        }
        field {
            fieldType: GroundConstraint;
            y: range { 65.0 78.0; }
        }
    }
}
