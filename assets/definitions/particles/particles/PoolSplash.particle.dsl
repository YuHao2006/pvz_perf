export component PoolSplash {
    kind: particle;
    source-name: "poolsplash";
    Emitter {
        image: "IMAGE_WATERPARTICLE";
        name: "PoolSplash";
        imageRow: 1;
        imageCol: 1;
        dieIfOverloaded: 1;
        systemDuration: 60;
        spawnMinActive: track { 1,49 0,50; }
        emitterOffsetX: 0;
        emitterOffsetY: 0;
        particleDuration: 50;
        particleAlpha: track { 1,95 0; }
        particleScale: 1.5;
        particleStretch: track { .1 .8 .5; }
        field {
            fieldType: Position;
            y: track { 6 -20 -5; }
        }
    }
}
