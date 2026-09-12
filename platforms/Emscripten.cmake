add_executable(RetroEngine ${RETRO_FILES})

target_compile_options(RetroEngine PRIVATE -sUSE_SDL=2 -sUSE_OGG=1 -sUSE_VORBIS=1)
target_link_options(RetroEngine PRIVATE -sUSE_SDL=2 -sUSE_OGG=1 -sUSE_VORBIS=1 -sFORCE_FILESYSTEM=1 -sALLOW_MEMORY_GROWTH=1 -sINITIAL_MEMORY=33554432)

target_link_options(RetroEngine PRIVATE
    "SHELL:-sEXPORTED_FUNCTIONS=[\"_main\"]"
    "SHELL:-sEXPORTED_RUNTIME_METHODS=[\"ccall\",\"cwrap\",\"FS\"]"
)

if(RETRO_USE_MOD_LOADER)
    set_target_properties(RetroEngine PROPERTIES
        CXX_STANDARD 17
        CXX_STANDARD_REQUIRED ON
    )
endif()
