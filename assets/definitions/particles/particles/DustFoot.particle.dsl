export component DustFoot {
    kind: particle;
    source-name: "dust_foot";
    Emitter {
        images: ["particles/frames/dust_puffs_r0_c0.png","particles/frames/dust_puffs_r0_c1.png","particles/frames/dust_puffs_r0_c2.png"];
        name: "DustFoot";
        imageFrames: 3;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        spawnMinActive: nodes {
            { time: 0; low: 6; high: 8; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: 0; high: 10; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 0; high: 4; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 20; high: 20; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 0.4; high: 0.4; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.2; low: 0.4; high: 0.6; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -200; high: 200; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.2; high: 0.3; curve: Linear; distribution: Linear; }
            { time: 0.7; low: 0.6; high: 0.8; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Position;
            x: nodes {
                { time: 0; low: 0; high: 0; curve: EaseOut; distribution: Linear; }
                { time: 1; low: 10; high: 20; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0; low: 0; high: 0; curve: EaseOut; distribution: Linear; }
                { time: 1; low: -10; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}
