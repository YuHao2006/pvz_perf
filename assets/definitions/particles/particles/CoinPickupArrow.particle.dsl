export component CoinPickupArrow {
    kind: particle;
    source-name: "coinpickuparrow";
    Emitter {
        image: "IMAGE_DOWNARROW";
        systemLoops: 1;
        particleLoops: 1;
        systemDuration: 100;
        spawnMinActive: 1;
        emitterOffsetX: -11;
        particleDuration: 40;
        particleRed: 1;
        particleGreen: .9;
        particleBlue: .4;
        field {
            fieldType: Position;
            y: track { 0 EaseInOutWeak 10 EaseInOutWeak 0; }
        }
    }
}
