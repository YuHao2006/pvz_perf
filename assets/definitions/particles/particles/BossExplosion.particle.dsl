export component BossExplosion {
    kind: particle;
    source-name: "bossexplosion";
    Emitter {
        images: ["particles/frames/zomboss_particles_r0_c0.png","particles/frames/zomboss_particles_r0_c1.png","particles/frames/zomboss_particles_r0_c2.png","particles/frames/zomboss_particles_r0_c3.png","particles/frames/zomboss_particles_r0_c4.png"];
        name: "Parts";
        imageFrames: 5;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.1; low: 1; high: 3; curve: Linear; distribution: Linear; }
        }
        emitterBoxX: nodes {
            { time: 0; low: -35; high: 35; curve: Linear; distribution: Linear; }
        }
        emitterBoxY: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 80; high: 80; curve: Linear; distribution: Linear; }
        }
        systemGreen: nodes {
            { time: 0.9; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        systemAlpha: nodes {
            { time: 0; low: 600; high: 600; curve: Linear; distribution: Linear; }
        }
        systemBrightness: nodes {
            { time: 0; low: 130; high: 200; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: -720; high: 720; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 0.9; curve: Linear; distribution: Linear; }
        }
        field {
            fieldType: Acceleration;
            y: nodes {
                { time: 0; low: 13; high: 13; curve: Linear; distribution: Linear; }
            }
        }
    }
    Emitter {
        image: "IMAGE_BOSSEXPLOSION1";
        name: "BossExplosion1";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.5; low: 0.5; high: 0.5; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.9; high: 0.9; curve: Linear; distribution: Linear; }
            { time: 1; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_BOSSEXPLOSION2";
        name: "BossExplosion2";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.7; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.3; low: 0.8; high: 0.8; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.85; high: 0.85; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_BOSSEXPLOSION3";
        name: "BossExplosion3";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.3; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 0.8; low: 1; high: 1; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleSpinSpeed: nodes {
            { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
            { time: 0.5; low: -20; high: 20; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 0.5; high: 0.7; curve: Linear; distribution: Linear; }
            { time: 0.5; low: 0.65; high: 0.85; curve: Linear; distribution: Linear; }
            { time: 1; low: 0.7; high: 0.9; curve: Linear; distribution: Linear; }
        }
    }
    Emitter {
        image: "IMAGE_WHITEPIXEL";
        name: "Flash";
        imageFrames: 1;
        animated: 0;
        emitterType: Box;
        fullScreen: 1;
        systemDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        spawnMinActive: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        spawnMaxLaunched: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleDuration: nodes {
            { time: 0; low: 50; high: 50; curve: Linear; distribution: Linear; }
        }
        particleRed: nodes {
            { time: 0; low: 1; high: 1; curve: Linear; distribution: Linear; }
        }
        particleGreen: nodes {
            { time: 0; low: 0.5; high: 1; curve: Linear; distribution: Linear; }
        }
        particleBlue: nodes {
            { time: 0; low: 0.1; high: 0.1; curve: Linear; distribution: Linear; }
        }
        particleAlpha: nodes {
            { time: 0; low: 0.2; high: 0.2; curve: Linear; distribution: Linear; }
            { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
        }
        particleScale: nodes {
            { time: 0; low: 1600; high: 1600; curve: Linear; distribution: Linear; }
        }
    }
}
