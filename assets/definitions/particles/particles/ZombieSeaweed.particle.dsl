export component ZombieSeaweed {
    kind: particle;
    source-name: "zombie_seaweed";
    Emitter {
        image: "IMAGE_ZOMBIE_SEAWEED";
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
