export component WinterMelonImpact {
    kind: particle;
    source-name: "wintermelonimpact";
    Emitter {
        images: ["particles/frames/wintermelon_particles_r0_c0.png","particles/frames/wintermelon_particles_r0_c1.png","particles/frames/wintermelon_particles_r0_c2.png","particles/frames/wintermelon_particles_r0_c3.png","particles/frames/wintermelon_particles_r0_c4.png","particles/frames/wintermelon_particles_r0_c5.png","particles/frames/wintermelon_particles_r0_c6.png","particles/frames/wintermelon_particles_r0_c7.png","particles/frames/wintermelon_particles_r0_c8.png"];
        imageFrames: 9;
        emitterType: Circle;
        randomLaunchSpin: 1;
        systemDuration: 50;
        spawnRate: 200;
        spawnMaxLaunched: 15;
        emitterRadius: range { 5 30; }
        particleDuration: 50;
        systemAlpha: track { 1,80 0; }
        launchSpeed: range { 100 200; }
        particleSpinSpeed: track { [-1120 1120] [-300 300]; }
        field {
            fieldType: Friction;
            x: 0.03;
            y: 0.03;
        }
        field {
            fieldType: Acceleration;
            y: 5.0;
        }
        field {
            fieldType: Position;
            x: track { 0 20; }
            y: track { 0 10; }
        }
    }
}
