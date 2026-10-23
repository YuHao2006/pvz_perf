export component ZombieSeaweed {
    kind: particle;
    source-name: "zombie_seaweed";
    Emitter {
        images: ["particles/frames/zombie_seaweed_r0_c0.png","particles/frames/zombie_seaweed_r0_c1.png","particles/frames/zombie_seaweed_r0_c2.png","particles/frames/zombie_seaweed_r0_c3.png"];
        name: "SeaweedHead";
        imageFrames: 4;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemLoops: 1;
        particleLoops: 1;
        spawnMinActive: 1;
        spawnMaxLaunched: 1;
        emitterRadius: range { 0 5; }
        particleDuration: 60;
        particleScale: range { .6 0.8; }
    }
}
