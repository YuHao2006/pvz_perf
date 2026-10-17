export component BossIceBallTrail {
    kind: particle;
    source-name: "bossiceballtrail";
    Emitter {
        image: "IMAGE_SNOWFLAKES";
        imageFrames: 3;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemLoops: 1;
        particlesDontFollow: 1;
        spawnRate: 20;
        emitterRadius: range { 0 30; }
        emitterOffsetX: 60;
        particleDuration: 40;
        launchSpeed: range { 10; }
        particleAlpha: track { 1 [.4 .8],80 0; }
        particleSpinSpeed: range { -600 600; }
        particleScale: track { .6,0 [.4 1.0],10 [.8 2.0],70 0,100; }
        field {
            fieldType: Acceleration;
            y: 3;
        }
        field {
            fieldType: Position;
            x: track { 0 EaseOut 20; }
        }
    }
    Emitter {
        image: none;
        name: "FadeOut";
        crossFadeDuration: 50;
        particleAlpha: track { 1 0; }
    }
}
