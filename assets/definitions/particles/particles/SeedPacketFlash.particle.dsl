export component SeedPacketFlash {
    kind: particle;
    source-name: "seedpacketflash";
    Emitter {
        image: "IMAGE_SEEDPACKETFLASH";
        spawnMinActive: 1;
        emitterOffsetX: 25;
        emitterOffsetY: 35;
        particleDuration: 25;
        particleAlpha: track { 0 1,40 0; }
    }
}
