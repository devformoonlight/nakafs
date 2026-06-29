# SPDX-License-Identifier: GPL-2.0-only
#
# Makefile for the linux ramfs routines.
#

MODNAME := nakafs

obj-m += ${MODNAME}.o
${MODNAME}-objs := file.o inode.o

KERNELRELEASE	?= $(shell uname -r)
KDIR	?= /lib/modules/${KERNELRELEASE}/build
MDIR	?= /lib/modules/${KERNELRELEASE}
PWD	:= $(shell pwd)


.PHONY : all clean install uninstall

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

install:
	rm -f ${MDIR}/updates/${MODNAME}.ko
	install -m644 -b -D ${MODNAME}.ko ${MDIR}/updates/${MODNAME}.ko
	depmod -aq

uninstall:
	rm -f ${MDIR}/updates/${MODNAME}.ko
	depmod -aq
