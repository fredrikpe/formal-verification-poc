#include <stdint.h>

uint32_t ffs_ref(uint32_t word) {
    int i = 0;
    if(!word)
        return 0;
    for(int cnt = 0; cnt < 32; cnt++)
        if(((1 << i++) & word) != 0)
            return i;
    return 0; // notreached
}

uint32_t ffs_imp(uint32_t i) {
    char n = 1;
    if (!(i & 0xffff)) { n += 16; i >>= 16; }
    if (!(i & 0x00ff)) { n += 8;  i >>= 8; }
    if (!(i & 0x000f)) { n += 4;  i >>= 4; }
    if (!(i & 0x0003)) { n += 2;  i >>= 2; }
    return (i) ? (n+((i+1) & 0x01)) : 0;
}

uint32_t ffs_musl (uint32_t x) {
    static const char debruijn32[32] = {
        0, 1, 23, 2, 29, 24, 19, 3, 30, 27, 25, 11, 20, 8, 4, 13,
        31, 22, 28, 18, 26, 10, 7, 12, 21, 17, 9, 6, 16, 5, 15, 14
    };
    return x ? debruijn32[(x&-x)*0x076be629 >> 27]+1 : 0;
}

uint32_t ffs_bug(uint32_t word) {
    // injected bug:
    if(word == 0x101010) return 4; // instead of 5
    return ffs_ref(word);
}

int main(int argc, char** argv) {
    return 0;
}

