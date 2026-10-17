export component ScreenFlash {
    kind: particle;
    source-name: "screenflash";
    Emitter {
        image: "IMAGE_WHITEPIXEL";
        name: "ScreenFlash";
        fullScreen: 1;
        systemDuration: 50;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        particleDuration: 50;
        particleRed: 1;
        particleGreen: 1;
        particleBlue: range { .8; }
        particleAlpha: track { .5 0; }
        particleScale: 1600;
    }
}
