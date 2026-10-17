export component DustSquash {
    kind: particle;
    source-name: "dust_squash";
    Emitter {
        image: "IMAGE_DUST_PUFFS";
        name: "SquashRight";
        imageFrames: 3;
        randomLaunchSpin: 1;
        spawnMinActive: 12;
        emitterBoxX: range { -5 35; }
        emitterBoxY: range { 0 4; }
        particleDuration: 30;
        particleAlpha: track { [.3 .8],20 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: track { [.2 .3] [.6 .8],70; }
        field {
            fieldType: Position;
            x: track { 0 EaseOut [10 40]; }
            y: track { 0,20 EaseOut [-10 0]; }
        }
    }
    Emitter {
        image: "IMAGE_DUST_PUFFS";
        name: "SquashLeft";
        imageFrames: 3;
        randomLaunchSpin: 1;
        spawnMinActive: 12;
        emitterBoxX: range { -35 5; }
        emitterBoxY: range { 0 4; }
        particleDuration: 30;
        particleAlpha: track { [.3 .8],20 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: track { [.2 .3] [.6 .8],70; }
        field {
            fieldType: Position;
            x: track { 0 EaseOut [-10 -40]; }
            y: track { 0,20 EaseOut [-10 0]; }
        }
    }
}
