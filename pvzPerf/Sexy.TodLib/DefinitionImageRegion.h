#pragma once
#include "graphics/GpuBackend.h"
#include "misc/Rect.h"

// Generated loaders bind final GPU fields directly to their PNG assets.
void DefinitionBindAtlasPath(Sexy::GpuTexture*& texture, int width, int height,
    const char* path);
// Upload each shared atlas once, assign all waiting definition pointers, and
// discard both decoded pixels and temporary assignment records.
int DefinitionUploadAtlasImages();
// Cancel a pending assignment before freeing/moving a bound definition.
void DefinitionUnbindAtlas(Sexy::GpuTexture*& texture);
// Main-thread shutdown only: loading has stopped, all definitions are freed,
// and the renderer is still alive. Clears the registry and deletes each image.
void DefinitionFreeAtlasImages();
