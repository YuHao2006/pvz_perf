export component ButterSplat {
    kind: particle;
    source-name: "buttersplat";
    Emitter {
        images: ["particles/frames/star_particles_r0_c0.png","particles/frames/star_particles_r0_c1.png","particles/frames/star_particles_r0_c2.png"];
        name: "StarSplatBits";
        imageFrames: 3;
        emitterType: Circle;
        randomLaunchSpin: 1;
        spawnMinActive: range { 6 10; }
        emitterRadius: range { 0 20; }
        particleDuration: 30;
        launchSpeed: range { 150; }
        particleAlpha: track { 1,80 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: range { .8 1.2; }
        field {
            fieldType: Friction;
            x: track { 0.0,40 .1; }
            y: track { 0.0,40 .1; }
        }
        field {
            fieldType: Acceleration;
            y: 10;
        }
    }
}
