section .bss
    first_name resb 50
    last_name resb 50
    full_name resb 100

section .data
    hello_msg db "Hello, ", 0
    new_line db 10, 0

section .text
    global _start

_start:
    ; Read first name
    mov eax, 3
    mov ebx, 0
    mov ecx, first_name
    mov edx, 50
    int 0x80

    ; Read last name
    mov eax, 3
    mov ebx, 0
    mov ecx, last_name
    mov edx, 50
    int 0x80

    ; Concatenate "Hello, " with last name
    mov esi, hello_msg
    mov edi, full_name
concat_hello:
    lodsb
    stosb
    cmp al, 0
    jnz concat_hello

    ; Concatenate last name
    mov esi, last_name
concat_last:
    lodsb
    stosb
    cmp al, 0
    jnz concat_last

    ; Concatenate first name
    mov esi, first_name
concat_first:
    lodsb
    stosb
    cmp al, 0
    jnz concat_first

    ; Print full name
    mov eax, 4
    mov ebx, 1
    mov ecx, full_name
    mov edx, 100
    int 0x80

    ; Print new line
    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, 2
    int 0x80

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
