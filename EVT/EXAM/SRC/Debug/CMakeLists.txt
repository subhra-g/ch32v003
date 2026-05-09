cmake_minimum_required(VERSION 3.23)

set(lib hal.debug.pd5)

add_library(${lib} STATIC)

target_sources(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/debug.h>
	$<INSTALL_INTERFACE:include/ch32v003/debug/debug.h>
	PRIVATE
	"${CMAKE_CURRENT_SOURCE_DIR}/debug.c"
)

target_include_directories(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
	$<INSTALL_INTERFACE:include/>
	# TODO: "debug.c/h" directly includes somefile from SDK. Following is WORKAROUND just for that.
	$<INSTALL_INTERFACE:include/ch32v003/peripheral>
)

# Processor Arch related
target_compile_options(${lib} PUBLIC -msave-restore)

# Optimization
target_compile_options(${lib} PRIVATE -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common)
target_compile_options(${lib} PRIVATE -msmall-data-limit=8)
# target_compile_options(${lib} PRIVATE -Os)

# Debugging
# target_compile_options(${lib} PRIVATE $<$<CONFIG:Debug>:-g>)

target_link_options(${lib} PUBLIC -msave-restore)
target_link_libraries(${lib}
	PUBLIC
	$<BUILD_INTERFACE:hal.peripheral>
	$<INSTALL_INTERFACE:hal.peripheral>
)

target_link_directories(${lib}
	INTERFACE
	$<INSTALL_INTERFACE:lib/ch32v003>
)

# set the target's folder (for IDEs that support it, e.g. Visual Studio)
set_target_properties(${lib} PROPERTIES FOLDER "${PROJECT_NAME}")

add_library(hal::debug::pd5 ALIAS ${lib})
add_library(hal::debug ALIAS ${lib}) # Default as per SDK.
# --------------------------------------------------------------------------------------------------

set(lib hal.debug.pd0)
add_library(${lib} STATIC)

target_sources(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/debug.h>
	$<INSTALL_INTERFACE:include/ch32v003/debug/debug.h>
	PRIVATE
	"${CMAKE_CURRENT_SOURCE_DIR}/debug.c"
)

target_include_directories(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
	$<INSTALL_INTERFACE:include/>
	# TODO: "debug.c/h" directly includes somefile from SDK. Following is WORKAROUND just for that.
	$<INSTALL_INTERFACE:include/ch32v003/peripheral>
)

# Processor Arch related
target_compile_definitions(${lib} PUBLIC DEBUG=DEBUG_UART1_Remap1)
target_compile_options(${lib} PUBLIC -msave-restore)

# Optimization
target_compile_options(${lib} PRIVATE -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common)
target_compile_options(${lib} PRIVATE -msmall-data-limit=8)
# target_compile_options(${lib} PRIVATE -Os)

# Debugging
# target_compile_options(${lib} PRIVATE $<$<CONFIG:Debug>:-g>)

target_link_options(${lib} PUBLIC -msave-restore)
target_link_libraries(${lib}
	PUBLIC
	$<BUILD_INTERFACE:hal.peripheral>
	$<INSTALL_INTERFACE:hal.peripheral>
)

target_link_directories(${lib}
	INTERFACE
	$<INSTALL_INTERFACE:lib/ch32v003>
)

# set the target's folder (for IDEs that support it, e.g. Visual Studio)
set_target_properties(${lib} PROPERTIES FOLDER "${PROJECT_NAME}")

add_library(hal::debug::pd0 ALIAS ${lib})

# --------------------------------------------------------------------------------------------------

set(lib hal.debug.pd6)
add_library(${lib} STATIC)

target_sources(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/debug.h>
	$<INSTALL_INTERFACE:include/ch32v003/debug/debug.h>
	PRIVATE
	"${CMAKE_CURRENT_SOURCE_DIR}/debug.c"
)

target_include_directories(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
	$<INSTALL_INTERFACE:include/>
	# TODO: "debug.c/h" directly includes somefile from SDK. Following is WORKAROUND just for that.
	$<INSTALL_INTERFACE:include/ch32v003/peripheral>
)

# Processor Arch related
target_compile_definitions(${lib} PUBLIC DEBUG=DEBUG_UART1_Remap2)
target_compile_options(${lib} PUBLIC -msave-restore)

# Optimization
target_compile_options(${lib} PRIVATE -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common)
target_compile_options(${lib} PRIVATE -msmall-data-limit=8)
# target_compile_options(${lib} PRIVATE -Os)

# Debugging
# target_compile_options(${lib} PRIVATE $<$<CONFIG:Debug>:-g>)

target_link_options(${lib} PUBLIC -msave-restore)
target_link_libraries(${lib}
	PUBLIC
	$<BUILD_INTERFACE:hal.peripheral>
	$<INSTALL_INTERFACE:hal.peripheral>
)

target_link_directories(${lib}
	INTERFACE
	$<INSTALL_INTERFACE:lib/ch32v003>
)

# set the target's folder (for IDEs that support it, e.g. Visual Studio)
set_target_properties(${lib} PROPERTIES FOLDER "${PROJECT_NAME}")

add_library(hal::debug::pd6 ALIAS ${lib})

# --------------------------------------------------------------------------------------------------

set(lib hal.debug.pc0)
add_library(${lib} STATIC)

target_sources(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/debug.h>
	$<INSTALL_INTERFACE:include/ch32v003/debug/debug.h>
	PRIVATE
	"${CMAKE_CURRENT_SOURCE_DIR}/debug.c"
)

target_include_directories(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
	$<INSTALL_INTERFACE:include/>
	# TODO: "debug.c/h" directly includes somefile from SDK. Following is WORKAROUND just for that.
	$<INSTALL_INTERFACE:include/ch32v003/peripheral>
)

# Processor Arch related
target_compile_definitions(${lib} PUBLIC DEBUG=DEBUG_UART1_Remap3)
target_compile_options(${lib} PUBLIC -msave-restore)

# Optimization
target_compile_options(${lib} PRIVATE -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common)
target_compile_options(${lib} PRIVATE -msmall-data-limit=8)
# target_compile_options(${lib} PRIVATE -Os)

# Debugging
# target_compile_options(${lib} PRIVATE $<$<CONFIG:Debug>:-g>)

target_link_options(${lib} PUBLIC -msave-restore)
target_link_libraries(${lib}
	PUBLIC
	$<BUILD_INTERFACE:hal.peripheral>
	$<INSTALL_INTERFACE:hal.peripheral>
)

target_link_directories(${lib}
	INTERFACE
	$<INSTALL_INTERFACE:lib/ch32v003>
)

# set the target's folder (for IDEs that support it, e.g. Visual Studio)
set_target_properties(${lib} PROPERTIES FOLDER "${PROJECT_NAME}")

add_library(hal::debug::pc0 ALIAS ${lib})
# --------------------------------------------------------------------------------------------------

set(lib hal.debug.sdi)
add_library(${lib} STATIC)

target_sources(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/debug.h>
	$<INSTALL_INTERFACE:include/ch32v003/debug/debug.h>
	PRIVATE
	"${CMAKE_CURRENT_SOURCE_DIR}/debug.c"
)

target_include_directories(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
	$<INSTALL_INTERFACE:include/>
	# TODO: "debug.c/h" directly includes somefile from SDK. Following is WORKAROUND just for that.
	$<INSTALL_INTERFACE:include/ch32v003/peripheral>
)

# Processor Arch related
target_compile_definitions(${lib} PUBLIC SDI_PRINT=SDI_PR_OPEN)
target_compile_options(${lib} PUBLIC -msave-restore)

# Optimization
target_compile_options(${lib} PRIVATE -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common)
target_compile_options(${lib} PRIVATE -msmall-data-limit=8)
# target_compile_options(${lib} PRIVATE -Os)

# Debugging
# target_compile_options(${lib} PRIVATE $<$<CONFIG:Debug>:-g>)

target_link_options(${lib} PUBLIC -msave-restore)
target_link_libraries(${lib}
	PUBLIC
	$<BUILD_INTERFACE:hal.peripheral>
	$<INSTALL_INTERFACE:hal.peripheral>
)

target_link_directories(${lib}
	INTERFACE
	$<INSTALL_INTERFACE:lib/ch32v003>
)

# set the target's folder (for IDEs that support it, e.g. Visual Studio)
set_target_properties(${lib} PROPERTIES FOLDER "${PROJECT_NAME}")

add_library(hal::debug::sdi ALIAS ${lib})
