export component ZamboniSmoke {
    kind: particle;
    source-name: "zambonismoke";
    Emitter {
        images: ["particles/frames/zambonismoke_r0_c0.png","particles/frames/zambonismoke_r0_c1.png","particles/frames/zambonismoke_r0_c2.png"];
        imageFrames: 3;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemLoops: 1;
        particlesDontFollow: 1;
        systemDuration: 20;
        spawnRate: 30;
        emitterRadius: range { 0 4; }
        particleDuration: range { 40 60; }
        launchSpeed: range { 10; }
        particleAlpha: track { 1 [.4 .8],80 0; }
        particleSpinSpeed: track { [-800 800] 0; }
        particleScale: track { .3,0 [.5 .8],20 [.8 1.0],60 0,100; }
        field {
            fieldType: Acceleration;
            y: -1;
        }
        field {
            fieldType: Position;
            x: track { 0 EaseOut 30; }
            y: track { 0 -20; }
        }
    }
    Emitter {
        image: none;
        name: "FadeOut";
        crossFadeDuration: 50;
        particleAlpha: track { 1 0; }
    }
}
