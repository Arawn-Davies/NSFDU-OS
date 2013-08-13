; This file is part of fotix
; Copyright (c) 2013 Fotis Koutoulakis
;

[GLOBAL gdt_flush]      ; Allows the C code to call gdt_flush();

gdt_flush:
    mov eax, [esp+4]    ; Get the pointer to the GDT, passed as a parameter.
    lgdt [eax]          ; Load the new GDT pointer

    mov ax, 0x10        ; 0x10 is the offset in the GDT to our data segment
    mov ds, ax          ; data segment
    mov es, ax          ; extra segment
    mov fs, ax
    mov gs, ax
    mov ss, ax          ; stack segment
    jmp 0x08:.flush     ; 0x08 is the offset to our code segment: Far jump!
.flush
    ret
