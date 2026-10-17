#define _GNU_SOURCE
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

int main(int argc, char** argv)
{
    if (argc != 2) return 2;
    const int file = open(argv[1], O_CREAT | O_EXCL | O_RDWR, 0600);
    if (file < 0) { perror("WSLg shared memory open"); return 1; }
    int result = 1;
    if (fallocate(file, 0, 0, 4096) != 0) {
        perror("WSLg shared memory fallocate");
    } else {
        void* memory = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, file, 0);
        if (memory == MAP_FAILED) {
            perror("WSLg shared memory mmap");
        } else {
            memcpy(memory, "PVZ VAIL diagnostic", 20);
            result = memcmp(memory, "PVZ VAIL diagnostic", 20) != 0;
            printf("WSLg shared memory mapped/read/write: %s\n", result ? "FAIL" : "PASS");
            munmap(memory, 4096);
        }
    }
    close(file);
    return result;
}
