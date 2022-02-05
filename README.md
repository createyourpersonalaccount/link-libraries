# An example makefile project

The makefile in the root directory has the purpose of compiling the libraries and then compiling the executables.

The libraries will be compiled into `foo.o` object files and then also into `libfoo.so` shared object files. They are placed in the same directory as their sources, `lib/`. There is a makefile there that performs these actions.

The programs are all in `src/<program_name>`. Each program has a makefile in its directory that describes its library dependencies. In this example there is only one program, `myprog` with only one dependency on `mylib`.

The intermediate makefile in `src/` calls each makefile under `src/<program_name/` after setting up some common variables. Because the behavior of linking a program under `src/` to libraries in `lib/` is common, it is written out in the makefile `src/Template` and included in others.

The recipes for building dynamic and static executables is located in the template file. For static compilation, we simply include the object files in the gcc compilation line, while for dynamic compilation, we use the linker option `-rpath` to pass the directory where the shared object files lie. Note that `-Wl` is used because the linker option is passed via `gcc`; moreover, we must pass `"$ORIGIN"` to signify that we wish the lookup to be relative to the executables' location.
