#[[
CONFIGURATIONS:
- MCU: # TODO: Yet to do. These are from 
		CH32V003F4 (includes CH32V003F4P6 and CH32V003F4U6)
		CH32V003A4 (Includes CH32V003A4M6)
		CH32V003J4 (Includes CH32V003J4M6)
		If none defined, SDK will set the default one. The default in SDK can be controlled by commenting/uncommenting line.
- HSE_VALUE:

Usage instruction:
Using CMake,
1. Use `FetchContent`.
    include(FetchContent)
    FetchContent_Declare(ch32v003
      SOURCE_DIR "PATH/TO/SDK" # e.g ${HOME}/dev/libs/ch32v003/
      CMAKE_ARGS "-DMCU=${ch32v003f4}"
      EXCLUDE_FROM_ALL
      SYSTEM
    )
    Fetchcontent_MakeAvailable(ch32v003)
2. The main application needs to have a function `SystemInit` defined. This function is expected to be
	 called from the startup file. The function can be defined in the main application or in a target
	 which is linked with the main application. The function is expected to initialize the system clock
	 and other system related initializations. Refer to the examples in the SDK for more details.
#]]

cmake_minimum_required(VERSION 3.23)

project("ch32v003hal" VERSION 2.1.0 # CH32V00x Standard Peripheral Library version number from ch32v00x.h
		DESCRIPTION "CH32V003 HAL"
		HOMEPAGE_URL "https://github.com/openwch/ch32v003"
		LANGUAGES C CXX ASM)

set(supported_mcus CH32V003F4 CH32V003A4 CH32V003J4)
set(MCU_FAMILY CH32V003)
if(NOT DEFINED MCU)
	set(MCU CH32V003F4)
	message(WARNING "MCU not defined for CH32V003 HAL.\n"
	                "Allowed MCUs are...\n"
	                "    CH32V003F4 - For CH32V003F4P6 and CH32V003F4U6\n"
	                "    CH32V003A4 - For CH32V003A4M6\n"
	                "    CH32V003J4 - For CH32V003J4M6\n"
									"Assuming ${MCU}.\n")
else()
	string(TOUPPER ${MCU} MCU_UPPER)
	if(NOT MCU_UPPER IN_LIST supported_mcus)
		message(FATAL_ERROR "Invalid MCU. Use one of the following\n"
	                      "    CH32V003F4 - For CH32V003F4P6 and CH32V003F4U6\n"
	                      "    CH32V003A4 - For CH32V003A4M6\n"
	                      "    CH32V003J4 - For CH32V003J4M6\n")
	endif()
endif()
message(STATUS "MCU (${MCU}) and family (${MCU_FAMILY}) will be added to compile definition.")

# This is the manufacturer provided HAL.
add_subdirectory(EVT/EXAM)

# Don't setup installation when the project is not build standalone(e.g. `FetchContent`).
if(PROJECT_IS_TOP_LEVEL)
	message(STATUS "CH32V003 HAL is being build as top project")
	include(cmake/install.cmake)
endif()
