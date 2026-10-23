export component CreditsRaysWipe {
    kind: particle;
    source-name: "credits_rayswipe";
    Emitter {
        image: "IMAGE_AWARDRAYS2";
        name: "AwardRay8";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        additive: 1;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.9; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 270; high: 270; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -60; high: -60; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 1; low: 20; high: 20; curve: Linear; distribution: Linear; }
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
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.9; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 90; high: 90; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -60; high: -60; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 1; low: 20; high: 20; curve: Linear; distribution: Linear; }
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
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.9; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 180; high: 180; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -60; high: -60; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 1; low: 20; high: 20; curve: Linear; distribution: Linear; }
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
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.9; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -60; high: -60; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 1; low: 20; high: 20; curve: Linear; distribution: Linear; }
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
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 290; high: 290; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -45; high: -45; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 1; low: 30; high: 30; curve: Linear; distribution: Linear; }
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
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.3; high: 0.3; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 110; high: 110; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -45; high: -45; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 1; low: 30; high: 30; curve: Linear; distribution: Linear; }
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
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -45; high: -45; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 1; low: 30; high: 30; curve: Linear; distribution: Linear; }
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
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 5; high: 5; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
        }
        particleSpinAngle: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -45; high: -45; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: EaseIn; distribution: Linear; }
            { time: 1; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardGlow";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0.18; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.18; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 120; high: 120; curve: Linear; distribution: Linear; }
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
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.6; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.75; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_AWARDGLOW";
        name: "AwardFlash2";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        additive: 1;
        systemDuration: nodes {
            { time: 0; low: 100; high: 100; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0.2; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.2; low: 1; high: 1; curve: Linear; distribution: Linear; }
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
            { time: 0; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.5; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: Linear; distribution: Linear; }
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
            { time: 0; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.5; low: 0.6; high: 0.6; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleBrightness: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 25; high: 25; curve: Linear; distribution: Linear; }
        }
    }
}
