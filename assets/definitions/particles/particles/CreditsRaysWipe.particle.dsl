export component CreditsRaysWipe {
    kind: particle;
    source-name: "credits_rayswipe";
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay8";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 1 5,90; }
        particleDuration: 100;
        particleAlpha: track { .7 .9,50 .9,70 0,80; }
        particleBrightness: .4;
        particleSpinAngle: 270;
        particleSpinSpeed: -60;
        particleScale: track { .4 EaseIn 20,100; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay7";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 1 5,90; }
        particleDuration: 100;
        particleAlpha: track { .7 .9,50 .9,70 0,80; }
        particleBrightness: .3;
        particleSpinAngle: 90;
        particleSpinSpeed: -60;
        particleScale: track { .4 EaseIn 20,100; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS1";
        name: "AwardRay6";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 1 5,90; }
        particleDuration: 100;
        particleAlpha: track { .7 .9,50 .9,70 0,80; }
        particleBrightness: .2;
        particleSpinAngle: 180;
        particleSpinSpeed: -60;
        particleScale: track { .4 EaseIn 20,100; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS1";
        name: "AwardRay5";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 1 5,90; }
        particleDuration: 100;
        particleAlpha: track { .7 .9,50 .9,70 0,80; }
        particleBrightness: .1;
        particleSpinAngle: 0;
        particleSpinSpeed: -60;
        particleScale: track { .4 EaseIn 20,100; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay4";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 0 5,70; }
        particleDuration: 100;
        particleAlpha: track { .7 .9,50 .9,70 0,80; }
        particleBrightness: .4;
        particleSpinAngle: 290;
        particleSpinSpeed: -45;
        particleScale: track { .4 EaseIn 30,100; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay3";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 0 5,70; }
        particleDuration: 100;
        particleAlpha: track { .7 .9,50 .9,70 0,80; }
        particleBrightness: .3;
        particleSpinAngle: 110;
        particleSpinSpeed: -45;
        particleScale: track { .4 EaseIn 30,100; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS1";
        name: "AwardRay2";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 0 5,70; }
        particleDuration: 100;
        particleAlpha: track { .7 .9,50 .9,70 0,80; }
        particleBrightness: .2;
        particleSpinAngle: 200;
        particleSpinSpeed: -45;
        particleScale: track { .4 EaseIn 30,100; }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS1";
        name: "AwardRay1";
        randomLaunchSpin: 1;
        additive: 1;
        spawnMinActive: track { 0 5,70; }
        particleDuration: 100;
        particleAlpha: track { .7 .9,50 .9,70 0,80; }
        particleBrightness: .1;
        particleSpinAngle: 20;
        particleSpinSpeed: -45;
        particleScale: track { .4 EaseIn 30,100; }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardGlow";
        spawnMinActive: track { 0,18 1,18; }
        particleDuration: 120;
        particleRed: 1;
        particleGreen: 1;
        particleBlue: 1;
        particleAlpha: track { 0 1,60 1,75 0; }
        particleScale: track { .1 100,80; }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardFlash2";
        additive: 1;
        systemDuration: 100;
        spawnMinActive: track { 0,20 1,20; }
        spawnMaxLaunched: 1;
        particleDuration: 40;
        particleRed: 1;
        particleGreen: 1;
        particleBlue: .9;
        particleAlpha: track { .2,50 0; }
        particleBrightness: .4;
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
        particleBlue: .9;
        particleAlpha: track { .6,50 0; }
        particleBrightness: .4;
        particleScale: track { 1 25; }
    }
}
