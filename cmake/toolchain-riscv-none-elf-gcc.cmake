set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR RISCV)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(toolchain_prefix riscv-none-elf-)

set(CMAKE_C_COMPILER ${toolchain_path}${toolchain_prefix}gcc${CMAKE_HOST_EXECUTABLE_SUFFIX})
set(CMAKE_CXX_COMPILER ${toolchain_path}${toolchain_prefix}g++${CMAKE_HOST_EXECUTABLE_SUFFIX})
#set(CMAKE_ASM_COMPILER ${toolchain_path}${toolchain_prefix}-gcc{CMAKE_HOST_EXECUTABLE_SUFFIX})
# CMake doesn't have a variable for 'size'. So create one.
set(CMAKE_SIZE ${toolchain_path}${toolchain_prefix}size${CMAKE_HOST_EXECUTABLE_SUFFIX})
