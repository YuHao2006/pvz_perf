export component SeedPacketPickup {
    kind: particle;
    source-name: "seedpacketpickup";
    Emitter {
        image: "IMAGE_ZombieHead";
        emitterType: CircleEvenSpacing;
        systemDuration: 200;
        spawnMinActive: track { 15,0 15,20 30,20 30,40 45,40; }
        emitterRadius: 40;
        particleDuration: 120;
        systemAlpha: track { 1,80 0; }
        particleRed: .9;
        particleGreen: .9;
        particleBlue: .7;
        particleAlpha: track { 0 1,20 1,90 0; }
        particleScale: track { .5 EaseIn 5; }
        field {
            fieldType: Away;
            x: track { 0 300; }
            y: track { 3 0; }
        }
    }
    Emitter {
        image: "IMAGE_ZombieHead";
        emitterType: CircleEvenSpacing;
        systemDuration: 200;
        spawnMinActive: track { 0,10 11,10 11,30 27,30 27,50 42,50; }
        emitterRadius: 40;
        particleDuration: 120;
        systemAlpha: track { 1,80 0; }
        particleRed: .9;
        particleGreen: .9;
        particleBlue: .9;
        particleAlpha: track { 0 1,20 1,90 0; }
        particleScale: track { .5 EaseIn 5; }
        field {
            fieldType: Away;
            x: track { 0 300; }
            y: track { 3 0; }
        }
        field {
            fieldType: Circle;
            x: 50;
        }
    }
}
