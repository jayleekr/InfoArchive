# BB Layer 구조
## S32G274AVB 

### user configuration
  - local.conf
    - MACHINE = s32g274aevb 
    - DISTRO = fsl-auto

### Distro
- meta-alb/conf/distro fsl-auto.conf

### Machine
- meta-alb/conf/machine/s32g274aevb.conf
  - require conf/machine/include/s32-gen1-board.inc
- meta-alb/conf/machine/include/s32-gen1-board.inc
  - reqire meta-alb/conf/machine/include/s32-gen1.inc
- meta-alb/conf/machine/include/s32-gen1.inc
  - require meta-alb/conf/machine/include/s32-base.inc 
- meta-alb/conf/machine/include/s32-base.inc 
  - require meta/conf/machine/include/soc-family.inc 
  - reqire meta/conf/machine/include/arm/aarch-arm64.inc
  - PREFERRED_PROVIDER_u-boot ?= u-boot-s32 
  - PREFERRED_VERSION_u-boot-s32 ?= "2018.07"
    - (Probably!) -> meta-alb/recipes-bsp/u-boot/u-boot-s32_2019.04.bb
      - require meta-alb/recipes-bsp/u-boot/u-boot-s32.inc
  - PREFERRED_VERSION_linux-s32 ?= "4.19"
    - (Probably!) -> meta-alb/recipes-kernel/linux/linux-s32_4.19.bb
      - require meta-alb/recipes-kernel/linux/linux-s32.inc

### Uboot
- meta-alb/recipes-bsp/u-boot/u-boot-s32_2019.04.bb
  - require meta-alb/recipes-bsp/u-boot/u-boot-s32.inc
- meta-alb/recipes-bsp/u-boot/u-boot-s32.inc

### Kernel
- meta-alb/recipes-kernel/linux/linux-s32_4.19.bb
  - require meta-alb/recipes-kernel/linux/linux-s32.inc
- meta-alb/recipes-kernel/linux/linux-s32.inc
  

- meta/conf/machine/include/soc-family.inc 

- meta/conf/machine/include/arm/aarch-arm64.inc
  - reqire meta/conf/machine/include/arm/arch-armv7ve.inc
- meta/conf/machine/include/arm/arch-armv7ve.inc
  - reqire meta/conf/machine/include/arm/arch-armv7a.inc
- meta/conf/machine/include/arm/arch-armv7a.inc
  - reqire meta/conf/machine/include/arm/arch-armv6.inc
- meta/conf/machine/include/arm/arch-armv6.inc
  - reqire meta/conf/machine/include/arm/arch-armv5-dsp.inc
          
## Uboot        
- meta-alb/recipes-bsp/u-boot/u-boot-s32.inc

## 