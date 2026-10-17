export component FumeCloud {
    kind: particle;
    source-name: "fumecloud";
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        systemDuration: 100;
        spawnMinActive: track { 0 40,40; }
        spawnMaxLaunched: 40;
        emitterOffsetX: 21;
        emitterOffsetY: -2;
        particleDuration: range { 50 60; }
        systemAlpha: track { .9,80 0; }
        particleAlpha: track { .9,80 0; }
        particleScale: range { .7 1.1; }
        field {
            fieldType: Position;
            x: track { 0 [20 300],60 [25 310]; }
            y: track { [-5 5] [-20 20]; }
        }
        field {
            fieldType: Shake;
            x: track { 1 0; }
            y: track { 1 0; }
        }
    }
}
