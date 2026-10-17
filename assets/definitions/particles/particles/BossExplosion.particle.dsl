export component BossExplosion {
    kind: particle;
    source-name: "bossexplosion";
    Emitter {
        image: "IMAGE_ZOMBOSS_PARTICLES";
        name: "Parts";
        imageFrames: 5;
        randomLaunchSpin: 1;
        spawnMinActive: track { 0 [1 3],10; }
        emitterBoxX: range { -35 35; }
        emitterBoxY: 0;
        particleDuration: 80;
        systemAlpha: track { 1,90 0,100; }
        launchSpeed: 600.0;
        launchAngle: range { 130 200; }
        particleSpinSpeed: track { [-720 720] 0; }
        particleScale: range { .7 .9; }
        field {
            fieldType: Acceleration;
            y: 13.0;
        }
    }
    Emitter {
        image: "IMAGE_BOSSEXPLOSION1";
        name: "BossExplosion1";
        spawnMinActive: 1;
        particleDuration: 50;
        particleAlpha: track { .5,50 0; }
        particleScale: track { .7 .9,50 1; }
    }
    Emitter {
        image: "IMAGE_BOSSEXPLOSION2";
        name: "BossExplosion2";
        spawnMinActive: 1;
        particleDuration: 50;
        particleAlpha: track { 1,80 0; }
        particleScale: track { .7 .8,30 .85; }
    }
    Emitter {
        image: "IMAGE_BOSSEXPLOSION3";
        name: "BossExplosion3";
        spawnMinActive: 1;
        particleDuration: 50;
        particleAlpha: track { 0 1,30 1,80 0; }
        particleSpinSpeed: track { 0 [-20 20] 0; }
        particleScale: track { [.5 .7] [.65 .85],50 [.7 .9]; }
    }
    Emitter {
        image: "IMAGE_WHITEPIXEL";
        name: "Flash";
        fullScreen: 1;
        systemDuration: 50;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        particleDuration: 50;
        particleRed: 1;
        particleGreen: range { .5 1; }
        particleBlue: .1;
        particleAlpha: track { [.2 .2] 0; }
        particleScale: 1600;
    }
}
