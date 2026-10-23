export component CircleEvenSpacing {
    kind: particle;
    source-name: "circleevenspacing";
    Emitter {
        image: "IMAGE_PROJECTILE";
        emitterType: CircleEvenSpacing;
        randomLaunchSpin: 1;
        systemDuration: 220;
        spawnMinActive: 20;
        emitterRadius: 50;
        particleDuration: 220;
        systemAlpha: track { 1,85 0; }
        launchSpeed: range { 100 110; }
        launchAngle: range { -5 5; }
        particleSpinSpeed: range { -20 20; }
        particleScale: range { 2 3; }
        field {
            fieldType: Circle;
            y: range { -.8 -1.2; }
        }
    }
}
