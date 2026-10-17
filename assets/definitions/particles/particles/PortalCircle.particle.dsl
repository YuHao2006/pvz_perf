export component PortalCircle {
    kind: particle;
    source-name: "portalcircle";
    Emitter {
        image: "IMAGE_WHITEELLIPSE";
        name: "PortalCircle";
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemLoops: 1;
        spawnRate: 20;
        emitterRadius: range { 0 30; }
        emitterOffsetX: 30;
        emitterOffsetY: range { 40 100; }
        particleDuration: range { 50 100; }
        particleAlpha: track { 0 1 1 0; }
        particleScale: range { .1 EaseIn 0.5; }
        particleStretch: range { .5 1; }
        field {
            fieldType: Position;
            x: track { 0 EaseOut 10; }
            y: track { 0 [-5 5]; }
        }
    }
}
