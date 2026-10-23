export component PeaSplat {
    kind: particle;
    source-name: "peasplat";
    Emitter {
        images: ["particles/frames/pea_splats_r0_c0.png","particles/frames/pea_splats_r0_c1.png","particles/frames/pea_splats_r0_c2.png","particles/frames/pea_splats_r0_c3.png"];
        name: "PeaSplat";
        imageFrames: 4;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 20;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        emitterRadius: range { 0 10; }
        particleDuration: 20;
        particleAlpha: track { .9,70 0; }
        particleScale: track { [.4 .6] [.8 1.2]; }
    }
    Emitter {
        images: ["particles/frames/pea_particles_r0_c0.png","particles/frames/pea_particles_r0_c1.png","particles/frames/pea_particles_r0_c2.png"];
        name: "PeaSplatBits";
        imageFrames: 3;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 20;
        spawnMinActive: range { 6 10; }
        emitterRadius: range { 0 10; }
        particleDuration: 20;
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
