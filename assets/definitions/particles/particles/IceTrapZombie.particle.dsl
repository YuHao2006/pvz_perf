export component IceTrapZombie {
    kind: particle;
    source-name: "icetrapzombie";
    Emitter {
        images: ["particles/frames/icetrap_particles_r0_c0.png","particles/frames/icetrap_particles_r0_c1.png","particles/frames/icetrap_particles_r0_c2.png","particles/frames/icetrap_particles_r0_c3.png"];
        name: "IceTrapParticles";
        imageFrames: 4;
        randomLaunchSpin: 1;
        systemLoops: 1;
        particleLoops: 1;
        spawnMinActive: range { 10 12; }
        emitterBoxX: range { -20 0; }
        emitterBoxY: range { -70 -10; }
        particleAlpha: .8;
        particleScale: range { .6 .8; }
    }
    Emitter {
        image: none;
        name: "FadeOut";
        crossFadeDuration: 25;
        particleAlpha: track { 1 0; }
    }
}
