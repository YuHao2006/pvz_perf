export component MindControl {
    kind: particle;
    source-name: "mindcontrol";
    Emitter {
        image: "IMAGE_MINDCONTROL";
        emitterType: CircleEvenSpacing;
        alignLaunchSpin: 1;
        spawnMinActive: 20;
        emitterRadius: 30;
        particleDuration: 40;
        systemAlpha: track { 0,0 .7,10 .7,85 0; }
        launchSpeed: range { 100 110; }
        particleSpinAngle: 180;
        particleScale: track { [.3 .6] [.4 .8] [.3 .6]; }
        field {
            fieldType: Friction;
            x: track { 0.0,40 .1; }
            y: track { 0.0,40 .1; }
        }
    }
}
