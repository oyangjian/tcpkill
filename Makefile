.PHONY: clean
CFLAGS = -Wall

ARM_INSTALL ?= 
CROSS_COMPILE ?= $(ARM_INSTALL)tool/gcc-linaro-arm-linux-gnueabihf-4.7-2012.11-20121123_linux/bin/arm-linux-gnueabihf-

CC = $(CROSS_COMPILE)gcc
STRIP = $(CROSS_COMPILE)strip
CFLAGS += -I $(ARM_INSTALL)install/include
LDFLAGS = -L $(ARM_INSTALL)install/lib
LDFLAGS += -lpcap -lnet
LDFLAGS += -static

tcpkill: pcaputil.o tcpkill.o
	$(CC) -o $@ $^ $(LDFLAGS)
	$(STRIP) $@

%.o : %.c
	$(CC) -c $(CFLAGS) -o $@ $^

clean:
	rm -f pcaputil.o tcpkill
