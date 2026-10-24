export component GloomCloud {
    kind: particle;
    source-name: "gloomcloud";
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_East";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: -5; high: -5; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 30; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 1.1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: -100; high: 100; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_South";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 28; high: 28; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 30; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 1.1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: -100; high: 100; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_North";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: -48; high: -48; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 30; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 1.1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: -100; high: 100; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_West";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: -40; high: -40; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: -5; high: -5; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 30; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 1.1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: -100; high: 100; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_SouthEast";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 28; high: 28; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 17; high: 17; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 30; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 1.1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: -100; high: 100; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_SouthWest";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: -28; high: -28; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: 17; high: 17; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 30; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 1.1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: -100; high: 100; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_NorthEast";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: 34; high: 34; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: -34; high: -34; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 30; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 1.1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: -100; high: 100; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_PUFFSHROOM_PUFF1";
        name: "Gloom_NorthWest";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        emitterOffsetX: nodes {
            { time: 0; low: -34; high: -34; curve: Linear; distribution: Linear; }
        }
        emitterOffsetY: nodes {
            { time: 0; low: -34; high: -34; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 30; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 1.1; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Away;
            x: nodes {
                { time: 0; low: 400; high: 400; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Circle;
            x: nodes {
                { time: 0; low: -100; high: 100; curve: Linear; distribution: Linear; }
            }
        }
        field {
            fieldType: Shake;
            x: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
                { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}
