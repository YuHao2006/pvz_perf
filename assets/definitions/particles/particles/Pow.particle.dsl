export component Pow {
    kind: particle;
    source-name: "pow";
    Emitter {
        image: "IMAGE_POW";
        name: "Pow";
        systemDuration: 50;
        spawnMinActive: 1;
        particleDuration: 50;
        systemAlpha: track { 1,90 0,100; }
        particleScale: track { .2 .5,7; }
        field {
            fieldType: Shake;
            x: track { 1 0 0; }
            y: track { 1 0 0; }
        }
    }
}
