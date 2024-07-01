### README for ELF File Verification and Shared Library Creation

---

#### Introduction

This document provides instructions on how to create static and dynamic shared libraries, link them with a test program, and verify which generated files are ELF files. Additionally, it outlines how to use specific commands to inspect and analyze these files.

#### Prerequisites

Ensure you have the following tools installed:
- GCC (GNU Compiler Collection)
- `ar` (GNU Archive utility)
- `readelf` (part of the binutils package)
- `objdump` (part of the binutils package)
- NASM (Netwide Assembler)
- `ld` (GNU linker)

#### Steps to Create and Verify Shared Libraries

##### 1. Compile and Create Static and Dynamic Libraries

1. **Create a Static Library:**

    Compile the source file into an object file and archive it into a static library.

    ```sh
    gcc -c calculator.c -o calculator.o
    ar rcs libcalculator.a calculator.o
    ```

2. **Create a Dynamic Library:**

    Compile the source file into a position-independent object file and link it into a shared library.

    ```sh
    gcc -fPIC -c calculator.c -o calculator.o
    gcc -shared -o libcalculator.so calculator.o
    ```

##### 2. Link Test Program with Libraries

1. **Link with Static Library:**

    Compile and link the test program with the static library.

    ```sh
    gcc test.c -L. -lcalculator -o test1
    ```

2. **Link with Dynamic Library:**

    Compile and link the test program with the dynamic library, setting the runtime library search path.

    ```sh
    gcc test.c -L. -lcalculator -o test2 -Wl,-rpath=.
    ```

##### 3. Verify ELF Files

Use the `readelf` command to verify which of the generated files are ELF files. Run the following commands:

1. **Check the Dynamic Library:**

    ```sh
    readelf -h libcalculator.so
    ```

2. **Check the Static Library:**

    The static library itself is not an ELF file, but its contents are. List and extract the object file, then check it:

    ```sh
    ar -t libcalculator.a
    ar -x libcalculator.a
    readelf -h calculator.o
    ```

3. **Check the Executables:**

    ```sh
    readelf -h test1
    readelf -h test2
    ```

The output from `readelf` will display ELF header information, confirming the ELF file format.

##### 4. Analyze the Executable

Use `objdump` to make the `test1` executable readable and analyze its contents.

```sh
objdump -d test1
```

#### Task 2: Concatenate Names in Assembly

##### 1. Write and Compile the Assembly Program

1. **Write the Assembly Program:**

    Write a NASM assembly program to concatenate names and print them.

2. **Compile the Assembly Program:**

    ```sh
    nasm -f elf64 concat_names.asm -o concat_names.o
    ```

3. **Link the Assembly Program:**

    ```sh
    ld concat_names.o -o concat_names
    ```

#### Summary

Follow these steps to create and verify shared libraries and executables. Use the provided commands to confirm which files are ELF files and analyze their contents. This ensures proper understanding and usage of static and dynamic libraries in your projects.