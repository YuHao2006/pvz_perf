#include "WebGLPlatform.h"
#include "graphics/WebTextureUpload.h"
#include "WebGLApi.h"
#include "graphics/gl/GLShaders.h"
#include <stdexcept>
#include <vector>
namespace Sexy {
bool WebGLPlatform::SupportsFrameSync() { return true; }
void WebGLPlatform::InitializeColorState() {}
void WebGLPlatform::UploadPixels(int width, int height, const void* pixels, int pitch, unsigned int format) {
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
    if (format == GL_BGRA) {
        glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
        UploadWebBgraRows(width, height, pixels, pitch, [&](int y, int rows, const unsigned char* rgba) {
            glTexSubImage2D(GL_TEXTURE_2D, 0, 0, y, width, rows, GL_RGBA, GL_UNSIGNED_BYTE, rgba);
        });
        return;
    }
    glPixelStorei(GL_UNPACK_ROW_LENGTH, pitch / (format == GL_RED ? 1 : 4));
    glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, width, height, format, GL_UNSIGNED_BYTE, pixels);
    glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
}
void WebGLPlatform::PrepareShaderSource(std::string& storage, std::string_view& source) {
    storage = GL3::WebShaderSource(source); source = storage;
}
void WebGLPlatform::BindFragmentOutputs(unsigned int, bool mixed) {
    if (mixed) throw std::logic_error("WebGL2 does not support dual-source blending");
}
std::string_view WebGLPlatform::MixedSpriteSource() { return GL3::SpriteFragmentShader(); }
void WebGLPlatform::ReadTextureFloats(int width, int height, unsigned int format, float* output) {
    if (format == GL_RGBA8 || format == GL_R8) {
        std::vector<unsigned char> bytes(size_t(width) * height * 4);
        glReadPixels(0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, bytes.data());
        for (size_t i = 0; i < bytes.size(); ++i) output[i] = bytes[i] / 255.0f;
    } else glReadPixels(0, 0, width, height, GL_RGBA, GL_FLOAT, output);
}
}
