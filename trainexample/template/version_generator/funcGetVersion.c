#include "../SomeProject_VERSION.h"
#include "funcGetVersion.h"
#include <stdio.h>

int GetShowVersion(void) {
    printf("%s\n", SomeProject_VERSION);
    return 0;
}
