export component PoolSplash {
    kind: particle;
    source-name: "poolsplash";
    Emitter {
        images: ["particles/frames/waterparticle_r0_c1.png","particles/frames/waterparticle_r0_c2.png","particles/frames/waterparticle_r0_c3.png","particles/frames/waterparticle_r0_c4.png","particles/frames/waterparticle_r0_c5.png"];
        name: "PoolSplash";
        dieIfOverloaded: 1;
        systemDuration: 60;
        spawnMinActive: track { 1,49 0,50; }
        emitterOffsetX: 0;
        emitterOffsetY: 0;
        particleDuration: 50;
        particleAlpha: track { 1,95 0; }
        particleScale: 1.5;
        particleStretch: track { .1 .8 .5; }
        field {
            fieldType: Position;
            y: track { 6 -20 -5; }
        }
    }
}
