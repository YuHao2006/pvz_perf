export component SeedPacket {
    kind: particle;
    source-name: "seedpacket";
    Emitter {
        image: "IMAGE_DOWNARROW";
        systemLoops: 1;
        particleLoops: 1;
        systemDuration: 100;
        spawnMinActive: 1;
        particleDuration: 40;
        particleRed: 1;
        particleGreen: .9;
        particleBlue: .4;
        field {
            fieldType: Position;
            y: track { 0 EaseInOutWeak 10 EaseInOutWeak 0; }
        }
    }
    Emitter {
        image: "IMAGE_SEEDPACKETGLOW";
        name: "SeedPacketGlow";
        systemLoops: 1;
        particleLoops: 1;
        systemDuration: 100;
        spawnMinActive: 1;
        emitterOffsetY: 62;
        particleDuration: 100;
        particleAlpha: 1;
        particleScale: 1;
    }
}
