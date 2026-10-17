export component SnowPeaTrail {
    kind: particle;
    source-name: "snowpeatrail";
    Emitter {
        image: "IMAGE_SNOWFLAKES";
        imageFrames: 3;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemLoops: 1;
        particlesDontFollow: 1;
        systemDuration: 20;
        spawnRate: 20;
        emitterRadius: range { 0 10; }
        particleDuration: 20;
        launchSpeed: range { 10; }
        particleAlpha: track { 1 [.4 .8],80 0; }
        particleSpinSpeed: range { -600 600; }
        particleScale: track { .3,0 [.4 1.0],10 [.4 1.0],70 0,100; }
        field {
            fieldType: Acceleration;
            y: 5;
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
