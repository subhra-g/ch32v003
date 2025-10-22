set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR RISCV)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(toolchain_prefix riscv-none-elf-)

if(WIN32)
  # Convert the path format for windows.
  file(TO_CMAKE_PATH "${toolchain_path}" toolchain_path)
  string(APPEND toolchain_path "/")
  set(extn ".exe")
endif()

set(CMAKE_C_COMPILER ${toolchain_path}${toolchain_prefix}gcc${extn})
set(CMAKE_CXX_COMPILER ${toolchain_path}${toolchain_prefix}g++${extn})
#set(CMAKE_ASM_COMPILER ${toolchain_path}${toolchain_prefix}-gcc{extn})
# CMake doesn't have a variable for 'size'. So create one.
set(CMAKE_SIZE ${toolchain_path}${toolchain_prefix}size${extn})
