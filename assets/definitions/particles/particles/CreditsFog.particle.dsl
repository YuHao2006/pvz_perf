export component CreditsFog {
    kind: particle;
    source-name: "credits_fog";
    Emitter {
        image: "IMAGE_FOG";
        imageFrames: 8;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemLoops: 1;
        systemDuration: 100;
        spawnRate: 15;
        emitterRadius: range { 0 10; }
        particleDuration: 100;
        launchSpeed: range { 10; }
        particleAlpha: track { 0 .7,20 [.4 .7],70 0; }
        particleSpinSpeed: range { -100 100; }
        particleScale: track { .2,0 [.3 .4],40 [.35 .45]; }
        field {
            fieldType: Position;
            x: track { 0 [20 100] [-20 200]; }
            y: track { 0 EaseOut [140 150]; }
        }
    }
}
