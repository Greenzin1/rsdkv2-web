add_executable(RetroEngine ${RETRO_FILES})

target_compile_options(RetroEngine PRIVATE -s USE_SDL=2)
target_link_options(RetroEngine PRIVATE -s USE_SDL=2 -s ALLOW_MEMORY_GROWTH=1 -s INITIAL_MEMORY=33554432 --closure 0)

if(COMPILE_OGG)
    target_compile_options(RetroEngine PRIVATE -s USE_OGG=1)
    target_link_options(RetroEngine PRIVATE -s USE_OGG=1)
else()
    target_compile_options(RetroEngine PRIVATE -s USE_OGG=1)
    target_link_options(RetroEngine PRIVATE -s USE_OGG=1)
endif()

if(COMPILE_VORBIS)
    target_compile_options(RetroEngine PRIVATE -s USE_VORBIS=1)
    target_link_options(RetroEngine PRIVATE -s USE_VORBIS=1)
else()
    target_compile_options(RetroEngine PRIVATE -s USE_VORBIS=1)
    target_link_options(RetroEngine PRIVATE -s USE_VORBIS=1)
endif()

target_link_options(RetroEngine PRIVATE -s EXPORTED_FUNCTIONS='["_main"]' -s EXPORTED_RUNTIME_METHODS='["ccall","cwrap"]')

if(RETRO_USE_MOD_LOADER)
    set_target_properties(RetroEngine PROPERTIES
        CXX_STANDARD 17
        CXX_STANDARD_REQUIRED ON
    )
endif()
