export component CreditsZombieHeadWipe {
    kind: particle;
    source-name: "credits_zombieheadwipe";
    Emitter {
        image: "IMAGE_ZombieHead";
        emitterType: CircleEvenSpacing;
        systemDuration: 200;
        spawnMinActive: track { 10,0 10,10 20,10 20,20 30,20; }
        spawnMaxLaunched: 30;
        emitterRadius: 10;
        particleDuration: 80;
        systemAlpha: track { 0 1,10 1,45 0,55; }
        particleAlpha: track { 0 1,20 1,90 0; }
        particleScale: track { .5 EaseIn 8; }
        field {
            fieldType: Away;
            x: track { 200 1500; }
        }
        field {
            fieldType: Circle;
            x: 200;
        }
    }
    Emitter {
        image: "IMAGE_ZombieHead";
        emitterType: CircleEvenSpacing;
        systemDuration: 200;
        spawnMinActive: track { 0,5 11,5 11,15 27,15 27,25 38,25; }
        spawnMaxLaunched: 38;
        emitterRadius: 10;
        particleDuration: 80;
        systemAlpha: track { 0 1,10 1,45 0,55; }
        particleAlpha: track { 0 1,20 1,90 0; }
        particleScale: track { .5 EaseIn 8; }
        field {
            fieldType: Away;
            x: track { 200 1500; }
        }
        field {
            fieldType: Circle;
            x: 300;
        }
    }
}
