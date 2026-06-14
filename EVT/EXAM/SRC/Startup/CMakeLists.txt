cmake_minimum_required(VERSION 3.23)

#ToDo: This assembly file expect a function 'SystemInit'. It doesn't create problem durinng compile
#      time, rather it causes linker error. How to solve it?
#      1. Expect a predefined target which must have the symbol(function). This will have PUBLIC dependency with that target.
#      2. Just keep it as it is. It is user's responsibility to link with a target with the symbol(function) defined.

set(lib startupLib)

add_library(${lib} STATIC)

target_sources(${lib}
	PRIVATE
	"${CMAKE_CURRENT_SOURCE_DIR}/startup_ch32v00x.S"
)

target_compile_definitions(${lib} PUBLIC ${MCU} ${MCU_FAMILY})

# Processor Arch related
target_compile_options(${lib} PUBLIC -mno-save-restore)

# Optimization. Intentionally kept private.
target_compile_options(${lib} PRIVATE -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common)
target_compile_options(${lib} PRIVATE -msmall-data-limit=8)

# Debugging and optimization
# target_compile_options(${lib} PRIVATE -Os)
# target_compile_options(${lib} PRIVATE $<$<CONFIG:Debug>:-g>)

# Linker options
target_link_options(${lib} PUBLIC -mno-save-restore)
#target_link_options(${lib} PUBLIC -Xlinker --gc-sections)

set_target_properties(${lib} PROPERTIES FOLDER "${PROJECT_NAME}")
add_library(ch32v003::startupLib ALIAS ${lib})


set(lib startup)
add_library(${lib} INTERFACE)
target_sources(${lib}
	INTERFACE
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/startup_ch32v00x.S>
	$<INSTALL_INTERFACE:startup/ch32v003/ch32v003.S> # This startup script needs to installed in 'lib/ch32v003'
)
target_compile_definitions(${lib} INTERFACE ${MCU} ${MCU_FAMILY})
set_target_properties(${lib} PROPERTIES FOLDER "${PROJECT_NAME}")
add_library(ch32v003::startup ALIAS ${lib})
