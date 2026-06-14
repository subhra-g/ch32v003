# NOTE: May be CMAKE_<LANG>_COMPILER_VERSION will be helpfull to support some of the recent breaking change
#       in recent RISC-V GCC (commandline) options.

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR RISCV)

set(RISCV_ARCH "rv32ecxw")
set(RISCV_ABI "ilp32e")
# Compile definition for the processor family.
add_compile_definitions(CH32V00X CH32V003)

include(${CMAKE_CURRENT_LIST_DIR}/toolchain-riscv-none-elf-gcc.cmake)
