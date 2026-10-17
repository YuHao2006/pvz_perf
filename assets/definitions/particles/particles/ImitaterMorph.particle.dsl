export component ImitaterMorph {
    kind: particle;
    source-name: "imitatermorph";
    Emitter {
        image: "IMAGE_IMITATERCLOUDS";
        name: "ImitaterClouds";
        imageFrames: 2;
        animated: 1;
        randomLaunchSpin: 1;
        spawnMinActive: 1;
        particleDuration: 60;
        particleAlpha: track { 1,70 0,90; }
        particleSpinSpeed: 200;
        particleScale: track { .3 1.2; }
    }
    Emitter {
        image: "IMAGE_IMITATERPUFFS";
        name: "ImitaterPuffs";
        imageFrames: 8;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 60;
        spawnMinActive: track { 0,20 10,40; }
        spawnMaxLaunched: 10;
        emitterRadius: range { 1 10; }
        particleDuration: 60;
        systemAlpha: track { 1,60 0; }
        particleAlpha: track { 0 1,20; }
        particleSpinSpeed: range { 300 400; }
        particleScale: track { [0.6 .8] [1.2 1.5]; }
        field {
            fieldType: Circle;
            x: range { -140 -70; }
        }
        field {
            fieldType: Away;
            x: range { 100 150; }
        }
    }
}
