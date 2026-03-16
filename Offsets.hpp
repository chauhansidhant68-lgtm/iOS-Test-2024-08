#ifndef Offsets_hpp
#define Offsets_hpp
#include <stdint.h>

#pragma pack(push, 1) 
struct UnityVariableNode {
    uint32_t bitSize;
    uint32_t bitAlign;
    uint64_t offset;
};
#pragma pack(pop)

class MemoryManager {
public:
    static uint64_t calculateTotalSize(UnityVariableNode node) {
        uint64_t size = node.bitSize;
        if (node.offset != static_cast<uint64_t>(-1)) {
            return size + node.offset;
        }
        return size;
    }
};
#endif
