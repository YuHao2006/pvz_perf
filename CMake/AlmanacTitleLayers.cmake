# The standard title canvases are 800 x 100. The packer reports the SHA-256 of
# the decoded RGBA bytes before atlas placement. Only omit a proven empty layer.
set(draw_shared true)
if(EXISTS "${MANIFEST}")
    file(READ "${MANIFEST}" report)
    string(JSON images ERROR_VARIABLE error GET "${report}" scene_atlases "compiled/scene/almanac.compiled" images)
    if(NOT error)
        string(JSON count LENGTH "${images}")
        set(i 0)
        while(i LESS count)
            string(JSON name ERROR_VARIABLE error GET "${images}" ${i} source)
            if(name STREQUAL "generated:almanac_common")
                string(JSON digest ERROR_VARIABLE error GET "${images}" ${i} rgba_sha256)
                # hashlib.sha256(bytes(800 * 100 * 4)).hexdigest()
                if(digest STREQUAL "ac2878215ad33205d1732578c89f25ededaad1b676911c540825bcf4baa42d9b")
                    set(draw_shared false)
                endif()
                break()
            endif()
            math(EXPR i "${i} + 1")
        endwhile()
    endif()
endif()
file(CONFIGURE OUTPUT "${HEADER}" CONTENT
"// Generated from the cooked Almanac atlas.
#pragma once
namespace AlmanacAtlas { inline constexpr bool DrawSharedTitlePixels = @draw_shared@; }
" @ONLY)
