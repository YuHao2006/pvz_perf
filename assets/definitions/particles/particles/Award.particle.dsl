export component Award {
    kind: particle;
    source-name: "award";
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay8";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 0,2 1,2 4,21; }
        particleDuration: 1500;
        particleAlpha: track { .7 .9,50; }
        particleBrightness: .4;
        particleSpinAngle: 270;
        particleSpinSpeed: range { -41 -70; }
        particleScale: track { .4 EaseIn 10,10; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay7";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 0,2 1,2 4,21; }
        particleDuration: 1500;
        particleAlpha: track { .7 .9,50; }
        particleBrightness: .3;
        particleSpinAngle: 90;
        particleSpinSpeed: range { -41 -70; }
        particleScale: track { .4 EaseIn 10,10; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS1";
        name: "AwardRay6";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 0,2 1,2 4,21; }
        particleDuration: 1500;
        particleAlpha: track { .7 .9,50; }
        particleBrightness: .2;
        particleSpinAngle: 180;
        particleSpinSpeed: range { -41 -70; }
        particleScale: track { .4 EaseIn 10,10; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS1";
        name: "AwardRay5";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 0,2 1,2 4,21; }
        particleDuration: 1500;
        particleAlpha: track { .7 .9,50; }
        particleBrightness: .1;
        particleSpinAngle: 0;
        particleSpinSpeed: range { -41 -70; }
        particleScale: track { .4 EaseIn 10,10; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay4";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 0,1 1,1 4,20; }
        particleDuration: 1500;
        particleAlpha: track { .7 .9,50; }
        particleBrightness: .4;
        particleSpinAngle: 270;
        particleSpinSpeed: range { -30 -60; }
        particleScale: track { .4 EaseIn 10,10; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay3";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 0,1 1,1 4,20; }
        particleDuration: 1500;
        particleAlpha: track { .7 .9,50; }
        particleBrightness: .3;
        particleSpinAngle: 90;
        particleSpinSpeed: range { -30 -60; }
        particleScale: track { .4 EaseIn 10,10; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS1";
        name: "AwardRay2";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 0,1 1,1 4,20; }
        particleDuration: 1500;
        particleAlpha: track { .7 .9,50; }
        particleBrightness: .2;
        particleSpinAngle: 180;
        particleSpinSpeed: range { -30 -60; }
        particleScale: track { .4 EaseIn 10,10; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS1";
        name: "AwardRay1";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 0,1 1,1 4,20; }
        particleDuration: 1500;
        particleAlpha: track { .7 .9,50; }
        particleBrightness: .1;
        particleSpinAngle: 0;
        particleSpinSpeed: range { -30 -60; }
        particleScale: track { .4 EaseIn 10,10; }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardGlow";
        additive: 1;
        spawnMinActive: track { 0,18 1,18; }
        particleDuration: 1500;
        particleRed: 1;
        particleGreen: 1;
        particleBlue: 1;
        particleScale: track { .1 EaseIn 150,25; }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardFlash4";
        systemDuration: 200;
        spawnMinActive: track { 0,80 1,80; }
        spawnMaxLaunched: 1;
        particleDuration: 40;
        particleRed: 1;
        particleGreen: 1;
        particleBlue: .8;
        particleAlpha: track { .2,50 0; }
        particleScale: track { 1 25; }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardFlash3";
        systemDuration: 200;
        spawnMinActive: track { 0,60 1,60; }
        spawnMaxLaunched: 1;
        particleDuration: 40;
        particleRed: 1;
        particleGreen: 1;
        particleBlue: .8;
        particleAlpha: track { .2,50 0; }
        particleScale: track { 1 25; }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardFlash2";
        systemDuration: 200;
        spawnMinActive: track { 0,40 1,40; }
        spawnMaxLaunched: 1;
        particleDuration: 40;
        particleRed: 1;
        particleGreen: 1;
        particleBlue: .8;
        particleAlpha: track { .2,50 0; }
        particleScale: track { 1 25; }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardFlash1";
        additive: 1;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        particleDuration: 30;
        particleRed: 1;
        particleGreen: 1;
        particleBlue: .5;
        particleAlpha: track { .6,50 0; }
        particleBrightness: .5;
        particleScale: track { 1 25; }
    }
}
