export component AwardPickupArrow {
    kind: particle;
    source-name: "awardpickuparrow";
    Emitter {
        image: "IMAGE_AWARDPICKUPGLOW";
        name: "AwardGlow";
        systemLoops: 1;
        particleLoops: 1;
        systemDuration: 100;
        spawnMinActive: 1;
        emitterOffsetY: 62;
        particleDuration: 100;
        particleAlpha: 1;
        particleScale: 1;
    }
    Emitter {
        image: "IMAGE_DOWNARROW";
        systemLoops: 1;
        particleLoops: 1;
        systemDuration: 100;
        spawnMinActive: 1;
        particleDuration: 40;
        particleRed: 1;
        particleGreen: .9;
        particleBlue: .4;
        field {
            fieldType: Position;
            y: track { 0 EaseInOutWeak 10 EaseInOutWeak 0; }
        }
    }
}
