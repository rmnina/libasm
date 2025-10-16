**Libasm** is a project designed to help learn **basic assembly programming**. The goal was to write a small library in **NASM (Netwide Assembler)** that reimplements some standard C functions.
NASM is a widely used assembler for **x86 architectures**.
The code is written for **64-bit programs** and follows the **Intel syntax**. 

To use the library:
```
gcl https://github.com/rmnina/libasm && cd libasm
make # will create the library
```
You can include the library in your project with ```#include "libasm.h"```, and link it to your program with: ```[compiler] [flags] [source file] -L. -lasm```
To compile and use my main test file, you can use ```make test```.


## :fire::fire: RESSOURCES :fire: :fire:

Here are some ressources I used to learn basic assembly!

### :book: The Bible

- [nasm.us](https://www.nasm.us/docs/3.00/nasm03.html)

### :clipboard: Cheatsheets

- [cs.brown.edu](https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf)
- [ggbaker.ca](https://ggbaker.ca/295/x86.html)

### :wrench: Syscall

- [createcode.com](https://cratecode.com/info/x86-assembly-nasm-system-calls)

### :wrench::clipboard: Syscall table
:warning: Only Linux. 0x2000000 offset on macOS

- [rchapman.org](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)
