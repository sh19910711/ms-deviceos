#ifndef __DEVICE_H__
#define __DEVICE_H__

#include <resea.h>

class _Device {
public:
    NORETURN void reset();
    NORETURN void reset(const char *errmsg);
};

#endif