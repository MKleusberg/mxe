/* This file is part of mingw-cross-env.       */
/* See doc/index.html for further information. */

#include <portaudio.h>
#include <stdio.h>

int main()
{
    int i;
    const PaDeviceInfo *device_info;

    Pa_Initialize();
    printf("Version: %s\n", Pa_GetVersionText());
    for( i = 0; i < Pa_GetDeviceCount(); i++ )
    {
        device_info = Pa_GetDeviceInfo(i);
        printf("Device %d: %s %s\n", i, device_info->name, Pa_GetHostApiInfo(device_info->hostApi)->name);
    }
    Pa_Terminate();
    return 0;
}