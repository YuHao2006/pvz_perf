export component GloomCloud {
    kind: particle;
    source-name: "gloomcloud";
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_East";
        spawnMinActive: track { 0 5,20; }
        spawnMaxLaunched: 5;
        emitterOffsetX: 40;
        emitterOffsetY: -5;
        particleDuration: range { 20 30; }
        systemAlpha: track { .9,80 0; }
        particleAlpha: track { .9,80 0; }
        particleScale: range { .7 1.1; }
        field {
            fieldType: Away;
            x: track { 400 0; }
        }
        field {
            fieldType: Circle;
            x: range { -100 100; }
        }
        field {
            fieldType: Shake;
            x: track { 1 0; }
            y: track { 1 0; }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_South";
        spawnMinActive: track { 0 5,20; }
        spawnMaxLaunched: 5;
        emitterOffsetX: 0;
        emitterOffsetY: 28;
        particleDuration: range { 20 30; }
        systemAlpha: track { .9,80 0; }
        particleAlpha: track { .9,80 0; }
        particleScale: range { .7 1.1; }
        field {
            fieldType: Away;
            x: track { 400 0; }
        }
        field {
            fieldType: Circle;
            x: range { -100 100; }
        }
        field {
            fieldType: Shake;
            x: track { 1 0; }
            y: track { 1 0; }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_North";
        spawnMinActive: track { 0 5,20; }
        spawnMaxLaunched: 5;
        emitterOffsetX: 0;
        emitterOffsetY: -48;
        particleDuration: range { 20 30; }
        systemAlpha: track { .9,80 0; }
        particleAlpha: track { .9,80 0; }
        particleScale: range { .7 1.1; }
        field {
            fieldType: Away;
            x: track { 400 0; }
        }
        field {
            fieldType: Circle;
            x: range { -100 100; }
        }
        field {
            fieldType: Shake;
            x: track { 1 0; }
            y: track { 1 0; }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_West";
        spawnMinActive: track { 0 5,20; }
        spawnMaxLaunched: 5;
        emitterOffsetX: -40;
        emitterOffsetY: -5;
        particleDuration: range { 20 30; }
        systemAlpha: track { .9,80 0; }
        particleAlpha: track { .9,80 0; }
        particleScale: range { .7 1.1; }
        field {
            fieldType: Away;
            x: track { 400 0; }
        }
        field {
            fieldType: Circle;
            x: range { -100 100; }
        }
        field {
            fieldType: Shake;
            x: track { 1 0; }
            y: track { 1 0; }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_SouthEast";
        spawnMinActive: track { 0 5,20; }
        spawnMaxLaunched: 5;
        emitterOffsetX: 28;
        emitterOffsetY: 17;
        particleDuration: range { 20 30; }
        systemAlpha: track { .9,80 0; }
        particleAlpha: track { .9,80 0; }
        particleScale: range { .7 1.1; }
        field {
            fieldType: Away;
            x: track { 400 0; }
        }
        field {
            fieldType: Circle;
            x: range { -100 100; }
        }
        field {
            fieldType: Shake;
            x: track { 1 0; }
            y: track { 1 0; }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_SouthWest";
        spawnMinActive: track { 0 5,20; }
        spawnMaxLaunched: 5;
        emitterOffsetX: -28;
        emitterOffsetY: 17;
        particleDuration: range { 20 30; }
        systemAlpha: track { .9,80 0; }
        particleAlpha: track { .9,80 0; }
        particleScale: range { .7 1.1; }
        field {
            fieldType: Away;
            x: track { 400 0; }
        }
        field {
            fieldType: Circle;
            x: range { -100 100; }
        }
        field {
            fieldType: Shake;
            x: track { 1 0; }
            y: track { 1 0; }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_NorthEast";
        spawnMinActive: track { 0 5,20; }
        spawnMaxLaunched: 5;
        emitterOffsetX: 34;
        emitterOffsetY: -34;
        particleDuration: range { 20 30; }
        systemAlpha: track { .9,80 0; }
        particleAlpha: track { .9,80 0; }
        particleScale: range { .7 1.1; }
        field {
            fieldType: Away;
            x: track { 400 0; }
        }
        field {
            fieldType: Circle;
            x: range { -100 100; }
        }
        field {
            fieldType: Shake;
            x: track { 1 0; }
            y: track { 1 0; }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_NorthWest";
        spawnMinActive: track { 0 5,20; }
        spawnMaxLaunched: 5;
        emitterOffsetX: -34;
        emitterOffsetY: -34;
        particleDuration: range { 20 30; }
        systemAlpha: track { .9,80 0; }
        particleAlpha: track { .9,80 0; }
        particleScale: range { .7 1.1; }
        field {
            fieldType: Away;
            x: track { 400 0; }
        }
        field {
            fieldType: Circle;
            x: range { -100 100; }
        }
        field {
            fieldType: Shake;
            x: track { 1 0; }
            y: track { 1 0; }
        }
    }
}
