# OpenGL 3.0 ordinary-sprite sampling

A dedicated GLSL 1.30 program uses hardware filtering/addressing for uploaded straight-alpha sprites targeting the main scene. Texture-owned filter/wrap state is changed only when needed; batches distinguish the shader program and sampler. Font coverage, generated textures, HSL/explicit edge filtering and offscreen premultiplied targets retain their existing paths. No save changes or production timing/logging added.

All native render tests passed on Windows with NVIDIA RTX 4070 Laptop / driver 591.44, actual GL 4.6 context requesting 3.0. This is not real Win7/old-driver certification. Compile/link checks use GLSL 1.30. New ordinary sampler tests compare mixed-alpha/tinted NPOT textures with negative UV under nearest/linear and clamp/repeat to the general shader, allowing up to 2/255 texture-unit precision error; source pixels and ordered state changes are checked.

The previous sampler-batching assertion assumed one shared texture always meant one batch. It now requires the intentional sprite-to-general program boundary (two batches), while all sixteen following general-filter combinations remain in one batch. D3D9 retains its own original assertion.

Font-weight reference tests and the known Win8+ hard-import gate also passed. GPU performance has not been measured; no speedup claimed. Functional tests use hidden fixture windows.
