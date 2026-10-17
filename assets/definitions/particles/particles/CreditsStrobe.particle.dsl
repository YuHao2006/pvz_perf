export component CreditsStrobe {
    kind: particle;
    source-name: "credits_strobe";
    Emitter {
        image: "IMAGE_WHITEPIXEL";
        name: "CreditsStrobe";
        fullScreen: 1;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        particleDuration: 6;
        particleRed: 1;
        particleGreen: 1;
        particleBlue: 1;
        particleAlpha: .5;
        particleScale: 1600;
    }
}
