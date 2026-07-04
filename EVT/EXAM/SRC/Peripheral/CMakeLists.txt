cmake_minimum_required(VERSION 3.23)

set(lib peripheral)

add_library(${lib} STATIC)

# HAL Peripherals
target_sources(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_adc.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_dbgmcu.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_dma.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_exti.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_flash.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_gpio.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_i2c.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_iwdg.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_misc.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_opa.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_pwr.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_rcc.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_spi.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_tim.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_usart.h>
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc/ch32v00x_wwdg.h>
	# Install location for following files needs to be in include/Peripheral
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_adc.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_dbgmcu.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_dma.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_exti.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_flash.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_gpio.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_i2c.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_iwdg.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_misc.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_opa.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_pwr.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_rcc.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_spi.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_tim.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_usart.h>
	$<INSTALL_INTERFACE:include/ch32v003/Peripheral/ch32v00x_wwdg.h>
	PRIVATE
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_adc.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_dbgmcu.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_dma.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_exti.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_flash.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_gpio.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_i2c.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_iwdg.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_misc.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_opa.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_pwr.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_rcc.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_spi.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_tim.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_usart.c"
	"${CMAKE_CURRENT_SOURCE_DIR}/src/ch32v00x_wwdg.c"
)

target_include_directories(${lib}
	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
	$<INSTALL_INTERFACE:include>
	# TODO: "ch32v00x.h" directly includes somefile from SDK. Following is WORKAROUND just for that.
	$<INSTALL_INTERFACE:include/ch32v003/peripheral>
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
# Linker
target_link_options(${lib} PUBLIC -mno-save-restore)
target_link_libraries(${lib}
	PUBLIC
	$<BUILD_INTERFACE:core>
	$<INSTALL_INTERFACE:ch32v003::core>
)
target_link_directories(${lib}
	INTERFACE
	$<INSTALL_INTERFACE:lib/ch32v003>
)

# set the target's folder (for IDEs that support it, e.g. Visual Studio)
set_target_properties(${lib} PROPERTIES FOLDER "${PROJECT_NAME}")
add_library(ch32v003::${lib} ALIAS ${lib})
