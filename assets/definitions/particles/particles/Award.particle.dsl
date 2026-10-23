export component Award {
    kind: particle;
    source-name: "award";
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay8";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        additive: 1;
        spawnMinActive: nodes {
            { time: 0.02; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.02; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.21; low: 4; high: 4; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 1500; high: 1500; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 270; high: 270; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -41; high: -70; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 0.1; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay7";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        additive: 1;
        spawnMinActive: nodes {
            { time: 0.02; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.02; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.21; low: 4; high: 4; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 1500; high: 1500; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 90; high: 90; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -41; high: -70; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 0.1; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS1";
        name: "AwardRay6";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        additive: 1;
        spawnMinActive: nodes {
            { time: 0.02; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.02; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.21; low: 4; high: 4; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 1500; high: 1500; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 180; high: 180; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -41; high: -70; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 0.1; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS1";
        name: "AwardRay5";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        additive: 1;
        spawnMinActive: nodes {
            { time: 0.02; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.02; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.21; low: 4; high: 4; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 1500; high: 1500; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -41; high: -70; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 0.1; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay4";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        additive: 1;
        spawnMinActive: nodes {
            { time: 0.01; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.01; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 4; high: 4; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 1500; high: 1500; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 270; high: 270; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -30; high: -60; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 0.1; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay3";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        additive: 1;
        spawnMinActive: nodes {
            { time: 0.01; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.01; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 4; high: 4; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 1500; high: 1500; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 90; high: 90; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -30; high: -60; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 0.1; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS1";
        name: "AwardRay2";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        additive: 1;
        spawnMinActive: nodes {
            { time: 0.01; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.01; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 4; high: 4; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 1500; high: 1500; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 180; high: 180; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -30; high: -60; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 0.1; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDRAYS1";
        name: "AwardRay1";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        additive: 1;
        spawnMinActive: nodes {
            { time: 0.01; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.01; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 4; high: 4; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 1500; high: 1500; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -30; high: -60; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 0.1; low: 10; high: 10; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardGlow";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        additive: 1;
        spawnMinActive: nodes {
            { time: 0.18; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.18; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 1500; high: 1500; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.1; high: 0.1; curve: EaseIn; distribution: Linear; }
            { time: 0.25; low: 150; high: 150; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardFlash4";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0.8; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.5; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 25; high: 25; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardFlash3";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0.6; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.6; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.5; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 25; high: 25; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardFlash2";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        systemDuration: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0.4; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.4; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 40; high: 40; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.5; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 25; high: 25; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardFlash1";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        additive: 1;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.5; low: 0.6; high: 0.6; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 25; high: 25; curve: Linear; distribution: Linear; }
        }
    }
}
