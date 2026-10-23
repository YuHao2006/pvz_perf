export component IceTrapRelease {
    kind: particle;
    source-name: "icetraprelease";
    Emitter {
        images: ["particles/frames/icetrap_particles_r0_c0.png","particles/frames/icetrap_particles_r0_c1.png","particles/frames/icetrap_particles_r0_c2.png","particles/frames/icetrap_particles_r0_c3.png"];
        imageFrames: 4;
        randomLaunchSpin: 1;
        spawnMinActive: range { 5 10; }
        emitterBoxX: range { -20 0; }
        emitterBoxY: range { -70 -10; }
        particleDuration: 50;
        launchSpeed: range { 100 150; }
        particleAlpha: track { 1 [.4 .8],80 0; }
        particleSpinSpeed: range { -600 600; }
        particleScale: track { .3,0 [.4 1.5],10 [.4 1.5],70 0,100; }
        field {
            fieldType: Acceleration;
            y: track { 0 15,40; }
        }
    }
}
