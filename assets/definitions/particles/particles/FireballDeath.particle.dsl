export component FireballDeath {
    kind: particle;
    source-name: "fireballdeath";
    Emitter {
        image: "IMAGE_ZOMBIE_BOSS_FIREBALL_PARTICLES";
        imageFrames: 2;
        emitterType: Circle;
        alignLaunchSpin: 1;
        systemDuration: 40;
        spawnMinActive: 20;
        emitterRadius: range { 0 20; }
        particleDuration: 40;
        launchSpeed: range { 200; }
        particleAlpha: track { 1 [.6 .9],80 0; }
        particleSpinAngle: 60;
        particleSpinSpeed: -300;
        particleScale: track { .3,0 [.4 1.5],10 [.6 2]; }
        field {
            fieldType: Circle;
            x: track { 100 [400 800]; }
        }
        field {
            fieldType: Away;
            x: track { [50 100] [100 300]; }
        }
    }
}
