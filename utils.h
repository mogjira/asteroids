#ifndef UTILS_H
#define UTILS_H

#include "w_world.h"
#include <stdio.h>

#define printBuffer(pBuffer, size, Type, printFn) { \
    const Type* util_pBuffer = (Type*)pBuffer; \
    for (int i = 0; i < size / sizeof(Type); i++) \
    { \
        printFn(&util_pBuffer[i]); \
    } \
} ;

void printWorld(const World*);
void printVec2(const Vec2*);

#endif /* end of include guard: UTILS_H */