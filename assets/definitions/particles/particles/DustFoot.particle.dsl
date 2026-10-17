export component DustFoot {
    kind: particle;
    source-name: "dust_foot";
    Emitter {
        image: "IMAGE_DUST_PUFFS";
        name: "DustFoot";
        imageFrames: 3;
        randomLaunchSpin: 1;
        spawnMinActive: range { 6 8; }
        emitterBoxX: range { 0 10; }
        emitterBoxY: range { 0 4; }
        particleDuration: 20;
        particleRed: .5;
        particleGreen: .4;
        particleBlue: .1;
        particleAlpha: track { [.4 .6],20 0; }
        particleSpinSpeed: range { -200 200; }
        particleScale: track { [.2 .3] [.6 .8],70; }
        field {
            fieldType: Position;
            x: track { 0 EaseOut [10 20]; }
            y: track { 0 EaseOut [-10 0]; }
        }
    }
}
