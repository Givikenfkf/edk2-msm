## @file
#
#  Copyright (c) 2011-2015, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Intel Corporation. All rights reserved.
#  Copyright (c) 2018 - 2019, Bingxing Wang. All rights reserved.
#  Copyright (c) 2022, Xilin Wu. All rights reserved.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

[Defines]
  PLATFORM_NAME           = nio
  PLATFORM_GUID           = 8f24b21d-720e-43f1-3837-7f8185c088a2
  PLATFORM_VERSION        = 0.1
  DSC_SPECIFICATION       = 0x0001001b
  OUTPUT_DIRECTORY        = Build/nio-AARCH64
  SUPPORTED_ARCHITECTURES = AARCH64
  BUILD_TARGETS           = RELEASE|DEBUG
  SKUID_IDENTIFIER        = DEFAULT
  FLASH_DEFINITION        = Silicon/Qualcomm/sm8250/sm8250.fdf

  SOC_PLATFORM            = SM8250
  USE_PHYSICAL_TIMER      = FALSE

!include Silicon/Qualcomm/QcomPkg/QcomCommonDsc.inc

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x080000000
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x17CC00000

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x9FF8C000
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|17
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|18
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x17a00000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x17a60000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00000850
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x9ff90000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|44

  gQcomTokenSpaceGuid.PcdUefiMemPoolBase|0xC0000000
  gQcomTokenSpaceGuid.PcdUefiMemPoolSize|0x0E000000

  # Framebuffer & Display Settings for Motorola nio
  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0x9C000000
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|2520

  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|3

  # SimpleInit
  gSimpleInitTokenSpaceGuid.PcdDeviceTreeStore|0x80650000
  gSimpleInitTokenSpaceGuid.PcdLoggerdUseConsole|FALSE

[LibraryClasses.common]
  # Motorola nio-specific SM8250 memory map
  PlatformMemoryMapLib|Platform/Motorola/sm8250/Library/nio/PlatformMemoryMapLib/PlatformMemoryMapLib.inf

  PlatformPeiLib|Silicon/Qualcomm/sm8250/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|Silicon/Qualcomm/sm8250/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  MsPlatformDevicesLib|Silicon/Qualcomm/sm8250/Library/MsPlatformDevicesLib/MsPlatformDevicesLib.inf
  SOCSmbiosInfoLib|Silicon/Qualcomm/sm8250/Library/SOCSmbiosInfoLib/SOCSmbiosInfoLib.inf

[Components.common]
  Platform/EFI_Binaries/Applications/LinuxSimpleMassStorage/LinuxSimpleMassStorage.inf
