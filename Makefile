.PHONY: all clean

CFLAGS := -W -Wall -Wextra -pedantic
BINDIR := bin
LIBDIR := lib

.PHONY: $(BINDIR) $(BINDIR)_create $(BINDIR)_clean $(LIBDIR) $(LIBDIR)_clean

export CFLAGS BINDIR LIBDIR

all: $(LIBDIR) $(BINDIR)

$(BINDIR): $(BINDIR)_create
	make -C src

$(BINDIR)_create:
	mkdir -p $(BINDIR)

$(BINDIR)_clean:
	make -C src clean ; \
	rmdir $(BINDIR)

$(LIBDIR):
	$(MAKE) -C $(LIBDIR)

$(LIBDIR)_clean:
	$(MAKE) -C $(LIBDIR) clean

clean: $(BINDIR)_clean $(LIBDIR)_clean
