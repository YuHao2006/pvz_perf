export component SeedPacketPick {
    kind: particle;
    source-name: "seedpacketpick";
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
        particleStretch: -1;
        field {
            fieldType: Position;
            y: track { 0 EaseInOutWeak 10 EaseInOutWeak 0; }
        }
    }
}
