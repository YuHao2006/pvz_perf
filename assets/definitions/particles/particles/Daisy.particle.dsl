export component Daisy {
    kind: particle;
    source-name: "daisy";
    Emitter {
        image: "IMAGE_DAISY";
        name: "Daisy";
        dieIfOverloaded: 1;
        systemDuration: 18500;
        spawnRate: 10;
        spawnMaxLaunched: range { 6 10; }
        emitterBoxX: range { -40 40; }
        emitterBoxY: range { -10 10; }
        particleDuration: 18000;
        particleAlpha: track { 0 1,.4 1,99.5 0; }
        particleScale: track { 0 [.6 1.2],.5; }
        field {
            fieldType: Position;
            y: track { 0 -10,.5; }
        }
    }
}
