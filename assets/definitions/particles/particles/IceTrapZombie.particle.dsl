export component IceTrapZombie {
    kind: particle;
    source-name: "icetrapzombie";
    Emitter {
        image: "IMAGE_ICETRAP_PARTICLES";
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
