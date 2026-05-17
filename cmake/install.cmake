# Include for 
#	CMAKE_INSTALL_INCLUDEDIR  => usually 'include'
#	CMAKE_INSTALL_LIBDIR      => usually 'lib'
#	CMAKE_INSTALL_BINDIR      => usually 'bin'
#	CMAKE_INSTALL_DATAROOTDIR => usually 'share'
include(GNUInstallDirs)

# Trying out based on https://dominikberner.ch//cmake-interface-lib/
# https://crascit.com/2016/01/31/enhanced-source-file-handling-with-target_sources/
# message(STATUS "DEBUG: CMAKE_INSTALL_INCLUDEDIR  - ${CMAKE_INSTALL_INCLUDEDIR}")
# message(STATUS "DEBUG: CMAKE_INSTALL_LIBDIR      - ${CMAKE_INSTALL_LIBDIR}")
# message(STATUS "DEBUG: CMAKE_INSTALL_BINDIR      - ${CMAKE_INSTALL_BINDIR}")
# message(STATUS "DEBUG: CMAKE_INSTALL_DATAROOTDIR - ${CMAKE_INSTALL_DATAROOTDIR}")

#[[
Installtion planning:
install_dir
  |
  +-- include
  |   |
  |   +-- ch32v003
  |       |
  |       +-- core -> Contains headers from 'SRC/Core'
  |       |
  |       +-- peripheral -> Contains headers from 'SRC/Peripheral/inc'
  +-- startup
  |   |
  |   +-- ch32v003
  |       |
  |       +-- ch32v003.S -> ch32v003 Startup file
  +-- lib
  |   |
  |   +-- ch32v003 -> Contains all built archives and linker script
  +-- ld
  |   |
  |   +-- ch32v003
  |       |
  |       +-- ch32v003.ld -> Contains ch32v002 linker script
  +-- share
      |
      +-- cmake -> Contains cmake scripts. use this path for find_package
#]]

install(TARGETS core peripheral startup startupLib ld debug-print.sdi
		${install_debug_print_target}
	EXPORT ch32v003hal_Targets
	# INCLUDES DESTINATION include/ch32v008 # For include files => ${CMAKE_INSTALL_INCLUDEDIR}
	#	PUBLIC_HEADER DESTINATION include/ch32v008
	# HEADER DESTINATION  include/ch32v008
	# INTERFACE_SOURCES DESTINATION include/ch32v008
	ARCHIVE DESTINATION lib/ch32v003      # For static libs   => ${CMAKE_INSTALL_LIBDIR}
	LIBRARY DESTINATION lib               # For dyamic libs   => ${CMAKE_INSTALL_LIBDIR}
	RUNTIME DESTINATION bin               # For executables   => ${CMAKE_INSTALL_BINDIR}
)
include(CMakePackageConfigHelpers)
write_basic_package_version_file("ch32v003halConfigVersion.cmake"
	VERSION 1.7.0 # ${PROJECT_VERSION}
	COMPATIBILITY SameMajorVersion
)

configure_package_config_file(
	"${PROJECT_SOURCE_DIR}/cmake/ch32v003halConfig.cmake.in"
	"${PROJECT_BINARY_DIR}/ch32v003halConfig.cmake"
	INSTALL_DESTINATION
	${CMAKE_INSTALL_DATAROOTDIR}/cmake
)

install(EXPORT ch32v003hal_Targets
	FILE ch32v003halTargets.cmake
	NAMESPACE ch32v003::
	DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/cmake
)

install(
	FILES "${PROJECT_BINARY_DIR}/ch32v003halConfig.cmake"
	      "${PROJECT_BINARY_DIR}/ch32v003halConfigVersion.cmake"
	DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/cmake
)

# REVIEW: Is there no way to do it automatically, like the PUBLIC sources?
install(FILES ${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/core/core_riscv.h DESTINATION include/ch32v003/core)
install(FILES ${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/debug/debug.h DESTINATION include/ch32v003/debug)
# Following copies 'inc' directory in 'peripheral' creating 'peripheral/inc' path
# install(DIRECTORY ${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc DESTINATION include/ch32v003/peripheral)
list(APPEND peripheral_srcs
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_adc.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_dbgmcu.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_dma.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_exti.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_flash.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_gpio.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_i2c.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_iwdg.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_misc.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_opa.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_pwr.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_rcc.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_spi.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_tim.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_usart.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00x_wwdg.h
	${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Peripheral/inc/ch32v00X_conf.h
)
install(FILES ${peripheral_srcs} DESTINATION include/ch32v003/peripheral)
install(FILES ${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Startup/startup_ch32v00X.S DESTINATION startup/ch32v003 RENAME ch32v003.S)
install(FILES ${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Ld/Link.ld DESTINATION ld/ch32v003 RENAME ch32v003.ld)
install(FILES ${PROJECT_SOURCE_DIR}/EVT/EXAM/SRC/Targets.md DESTINATION docs RENAME ch32v003-Targets.md)
