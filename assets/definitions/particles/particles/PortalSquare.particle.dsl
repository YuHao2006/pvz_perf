export component PortalSquare {
    kind: particle;
    source-name: "portalsquare";
    Emitter {
        image: "IMAGE_WHITEELLIPSE";
        name: "PortalSquare";
        randomLaunchSpin: 1;
        systemLoops: 1;
        spawnMinActive: 20;
        emitterBoxX: range { 20 40; }
        emitterBoxY: range { 10 110; }
        particleDuration: range { 100 400; }
        particleAlpha: track { 0 1 1 0; }
        particleScale: range { .1 EaseIn 0.5; }
        particleStretch: range { .5 1; }
        field {
            fieldType: Position;
            x: track { 0 4; }
            y: track { 0 [-.5 .5]; }
        }
    }
}
