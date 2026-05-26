# CH32V003 SDK

## Targets

Target                              | Type       | Description 
------------------------------------|------------|-------------
`ch32v003::core`                    | Static     | 
`ch32v003::peripheral`              | Static     | The SDK HAL.
`ch32v003::startup`                 | Interface  | SDK provided startup in compiled form.
`ch32v003::startupLib`              | Static     | SDK provided startup source file.
`ch32v003::debug-print.sdi`         | Static     | Debug print library via SDI.
`ch32v003::debug-print.uart.pd5`<sup>DEFAULT</sup>| Static | Debug print library via UART (Port D Pin5).
`ch32v003::debug-print.uart.pd0`    | Static     | Debug print library via UART (Port D Pin0).
`ch32v003::debug-print.uart.pd6`    | Static     | Debug print library via UART (Port D Pin6).
`ch32v003::debug-print.uart.pc0`    | Static     | Debug print library via UART (Port C Pin0).

> Use any one of the `debug-print::uart` targets.
> Also use one of the startup targets (`ch32v003::startup` or `ch32v003::startupLib`)

## Compile options:

Following targets adds some compile options.

Target                           | Compile option
---------------------------------|----------------
`ch32v003::debug-print.sdi`      | `SDI_PRINT=SDI_PR_OPEN`
`ch32v003::debug-print.uart.pd5` | `DEBUG=DEBUG_UART1_NoRemap`
`ch32v003::debug-print.uart.pd0` | `DEBUG=DEBUG_UART1_Remap1`
`ch32v003::debug-print.uart.pd6` | `DEBUG=DEBUG_UART1_Remap2`
`ch32v003::debug-print.uart.pc0` | `DEBUG=DEBUG_UART1_Remap3`

## Usage guide

Define following 2 things to link with these targets. 
- Define a function `SystemInit`. 
- Define a static variable `static uint32_t SystemCoreClock` of type and set it with system clock frequency to use any of the `debug-print` target. 

> Refer SDK examples to know more. To make things easy use ch32v00x_it.c, system_ch32v00x.c and system_ch32v00x.h from one of the examples.
