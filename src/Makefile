.PHONY: all clean

DIRECTORIES := $(patsubst %/,%,$(wildcard */))
SODIR := ../$(LIBDIR)
LIBDIR := ../../$(LIBDIR)
BINDIR := ../../$(BINDIR)
CFLAGS += -nostdlib -I$(LIBDIR)

export CFLAGS BINDIR LIBDIR SODIR

.PHONY: $(DIRECTORIES) $(DIRECTORIES:=_clean)

all: $(DIRECTORIES)

$(DIRECTORIES):
	$(MAKE) -C $@

$(DIRECTORIES:=_clean):
	$(MAKE) -C $(@:_clean=) clean

clean: $(DIRECTORIES:=_clean)
