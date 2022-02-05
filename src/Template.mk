.PHONY: all clean

PROGRAM := $(basename $(wildcard *.c))

deps_o := $(addprefix $(LIBDIR)/,$(DEPS:=.o))

all: $(PROGRAM).dynamic $(PROGRAM).static

$(PROGRAM).dynamic: CFLAGS += $(addprefix -l,$(DEPS)) -L$(LIBDIR)
$(PROGRAM).dynamic: LDFLAGS += -Wl,-rpath,"\$$ORIGIN"/$(SODIR)

%.dynamic: %.c
	$(CC) $(CFLAGS)  -o $(BINDIR)/$@ $< $(LDFLAGS)

%.static: %.c
	$(CC) $(CFLAGS) -o $(BINDIR)/$@ $< $(deps_o) $(LDFLAGS)

clean:
	rm -f $(BINDIR)/$(PROGRAM).dynamic $(BINDIR)/$(PROGRAM).static
