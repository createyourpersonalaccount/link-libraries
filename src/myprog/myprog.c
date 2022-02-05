#include <mylib.h>

void _start(void) {
  int x = f(0);
  (void)x;
  asm("mov $60,%rax;"
      "mov $0, %rdi;"
      "syscall");
}
