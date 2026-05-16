#[[
CONFIGURATIONS:
- MCU: # TODO: Yet to do. These are from 
		CH32V00x_D8W: CH32V208
		CH32V00x_D8 : CH32V203RB
		CH32V00x_D6 : CH32V203F6-CH32V203F8-CH32V203G6-CH32V203G8-CH32V203K8-CH32V203C6-CH32V203C8-CH32V203G8
		If none defined, SDK will set the default one. The default in SDK can be controlled by commenting/uncommenting line.
- HSE_VALUE:

Usage instruction:
Using CMake,
1. Use `FetchContent`.
    include(FetchContent)
    FetchContent_Declare(ch32v003
      SOURCE_DIR "PATH/TO/SDK" # e.g ${HOME}/dev/libs/ch32v003/
      CMAKE_ARGS "-DMCU=${ch32v203c8}"
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

project("ch32v003hal" VERSION 1.7.0
		DESCRIPTION "CH32V003 HAL"
		HOMEPAGE_URL "https://github.com/openwch/ch32v003"
		LANGUAGES C CXX ASM)

#if(NOT DEFINED MCU)
#	message(FATAL_ERROR "MCU not defined to build CH32V20x HAL")
#endif()

# This is the manufacturer provided HAL.
add_subdirectory(EVT/EXAM)

# Don't setup installation when the project is not build standalone(e.g. `FetchContent`).
if(PROJECT_IS_TOP_LEVEL)
	message(STATUS "CH32V003 HAL is being build as top project")
	include(cmake/install.cmake)
endif()
