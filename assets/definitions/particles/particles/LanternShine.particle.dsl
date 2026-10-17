export component LanternShine {
    kind: particle;
    source-name: "lanternshine";
    Emitter {
        image: "IMAGE_LANTERNSHINE";
        randomLaunchSpin: 1;
        systemLoops: 1;
        particleLoops: 1;
        randomStartTime: 1;
        hardwareOnly: 1;
        spawnMinActive: 10;
        particleDuration: range { 60 120; }
        particleAlpha: track { .5 Bounce [.3 .5]; }
        particleSpinSpeed: range { -20 -40; }
        particleScale: track { 1 Bounce [.7 1]; }
    }
    Emitter {
        image: "IMAGE_LANTERNSHINE";
        randomLaunchSpin: 1;
        systemLoops: 1;
        particleLoops: 1;
        randomStartTime: 1;
        hardwareOnly: 1;
        spawnMinActive: 10;
        particleDuration: range { 60 120; }
        particleAlpha: track { .5 Bounce [.3 .5]; }
        particleSpinSpeed: range { 20 40; }
        particleScale: track { 1 Bounce [.7 1]; }
    }
}
