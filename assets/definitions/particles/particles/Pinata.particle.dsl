export component Pinata {
    kind: particle;
    source-name: "pinata";
    Emitter {
        images: ["particles/frames/pinata_r0_c0.png","particles/frames/pinata_r0_c1.png","particles/frames/pinata_r0_c2.png","particles/frames/pinata_r0_c3.png","particles/frames/pinata_r0_c4.png"];
        name: "pinata";
        imageFrames: 5;
        emitterType: Circle;
        randomLaunchSpin: 1;
        dieIfOverloaded: 1;
        spawnMinActive: range { 10 15; }
        emitterRadius: range { 0 70; }
        particleDuration: 180;
        systemAlpha: track { 1,95 0,100; }
        launchSpeed: range { 200 500; }
        launchAngle: range { 130 190; }
        particleSpinSpeed: track { [-720 720] 0,40; }
        particleScale: .8;
        collisionReflect: track { .3 .3,40 0,50; }
        collisionSpin: track { [-10 -50] 0,40; }
        field {
            fieldType: Acceleration;
            y: 17.0;
        }
        field {
            fieldType: GroundConstraint;
            y: 90.0;
        }
    }
}
