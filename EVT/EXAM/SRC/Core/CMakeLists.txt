cmake_minimum_required(VERSION 3.23)

set(lib core)

add_library(${lib} STATIC)

target_sources(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/core_riscv.h>
	$<INSTALL_INTERFACE:include/ch32v003/core/core_riscv.h> # This file needs to be installed in include/core.
	PRIVATE
	"${CMAKE_CURRENT_SOURCE_DIR}/core_riscv.c"
)

target_include_directories(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
	$<INSTALL_INTERFACE:include> # It doesn't copy the headers in this dir. This dir is added to include path? 
	# TODO: That HAL headers directly includes from SDK. Following is WORKAROUND just for that.
	$<INSTALL_INTERFACE:include/ch32v003/core>
)

# Processor Arch related
target_compile_options(${lib} PUBLIC -mno-save-restore)

# Optimization. Intentionally kept private.
target_compile_options(${lib} PRIVATE -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common)
target_compile_options(${lib} PRIVATE -msmall-data-limit=8)
# target_compile_options(${lib} PRIVATE -Os)

# Debugging
# target_compile_options(${lib} PRIVATE $<$<CONFIG:Debug>:-g>)

# Linker options
target_link_options(${lib} PUBLIC -mno-save-restore)

target_link_directories(${lib}
	INTERFACE
	$<INSTALL_INTERFACE:lib/ch32v003>
)

# set the target's folder (for IDEs that support it, e.g. Visual Studio)
set_target_properties(${lib} PROPERTIES FOLDER "${PROJECT_NAME}")

add_library(ch32v003::core ALIAS ${lib})
