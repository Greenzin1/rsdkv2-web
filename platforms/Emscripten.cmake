add_executable(RetroEngine ${RETRO_FILES})

set(EMSCRIPTEN_FLAGS "-sUSE_SDL=2 -sALLOW_MEMORY_GROWTH=1 -sINITIAL_MEMORY=33554432 -sUSE_OGG=1 -sUSE_VORBIS=1 --closure 0")

target_link_options(RetroEngine PRIVATE ${EMSCRIPTEN_FLAGS})

target_link_options(RetroEngine PRIVATE -sEXPORTED_FUNCTIONS='["_main"]' -sEXPORTED_RUNTIME_METHODS='["ccall","cwrap"]')

if(RETRO_USE_MOD_LOADER)
    set_target_properties(RetroEngine PROPERTIES
        CXX_STANDARD 17
        CXX_STANDARD_REQUIRED ON
    )
endif()
