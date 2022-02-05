.PHONY: all clean

NAMES := $(basename $(wildcard *.c))
OBJ := $(NAMES:=.o)
SOBJ := $(addprefix lib,$(NAMES:=.so))

all: $(SOBJ)

%.o: %.c %.h
	$(CC) $(CFLAGS) -c $<

$(SOBJ): lib%.so: %.o
	$(CC) $(CFLAGS) -shared -o $@ $<

clean:
	rm -f $(OBJ) $(SOBJ)
