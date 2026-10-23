export component DustSquash {
    kind: particle;
    source-name: "dust_squash";
    Emitter {
        images: ["particles/frames/dust_puffs_r0_c0.png","particles/frames/dust_puffs_r0_c1.png","particles/frames/dust_puffs_r0_c2.png"];
        name: "SquashRight";
        imageFrames: 3;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        spawnMinActive: nodes {
            { time: 0; low: 12; high: 12; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -5; high: 35; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 0; high: 4; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.2; low: 0.3; high: 0.8; curve: Linear; distribution: Linear; }
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
                { time: 1; low: 10; high: 40; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0.2; low: 0; high: 0; curve: EaseOut; distribution: Linear; }
                { time: 1; low: -10; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        images: ["particles/frames/dust_puffs_r0_c0.png","particles/frames/dust_puffs_r0_c1.png","particles/frames/dust_puffs_r0_c2.png"];
        name: "SquashLeft";
        imageFrames: 3;
        animated: 0;
        emitterType: Box;
        randomLaunchSpin: 1;
        spawnMinActive: nodes {
            { time: 0; low: 12; high: 12; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -35; high: 5; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 0; high: 4; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 30; high: 30; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.2; low: 0.3; high: 0.8; curve: Linear; distribution: Linear; }
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
                { time: 1; low: -10; high: -40; curve: Linear; distribution: Linear; }
            }
            y: nodes {
                { time: 0.2; low: 0; high: 0; curve: EaseOut; distribution: Linear; }
                { time: 1; low: -10; high: 0; curve: Linear; distribution: Linear; }
            }
        }
    }
}
