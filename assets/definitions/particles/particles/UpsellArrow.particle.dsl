export component UpsellArrow {
    kind: particle;
    source-name: "upsellarrow";
    Emitter {
        image: "IMAGE_DOWNARROW";
        name: "Arrow";
        systemLoops: 1;
        particleLoops: 1;
        systemDuration: 100;
        spawnMinActive: 1;
        emitterOffsetX: 25;
        emitterOffsetY: 80;
        particleDuration: 40;
        particleRed: 1;
        particleGreen: .9;
        particleBlue: .4;
        particleScale: 1.2;
        field {
            fieldType: Position;
            y: track { 0 EaseInOutWeak 10 EaseInOutWeak 0; }
        }
    }
}
