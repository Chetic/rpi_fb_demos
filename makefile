.PHONY: clean
ifeq ($(shell uname -a | grep armv6),)
CC := arm-unknown-linux-gnueabi-gcc
LD := arm-unknown-linux-gnueabi-gcc
AR := arm-unknown-linux-gnueabi-ar
else
CC := gcc
LD := gcc
AR := ar
endif
CCFLAGS := -c -ggdb -O0
LDFLAGS := -g -Llib
O_FILES := 

all: obj bin lib bin/demo1

bin/demo1: obj/main.o $(O_FILES)
	$(LD) $(LDFLAGS) $^ -o $@

obj bin lib:
	mkdir -p $@

clean:
	rm -rf bin || :
	rm -rf obj || :
	rm -rf lib || :

obj/%.o: src/%.c obj
	$(CC) $(CCFLAGS) $^ -o $@
