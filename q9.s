.section .rodata

.INP_STR:
    .string "%d"

.YES_MSG:
    .string "Y\n"

.NO_MSG:
    .string "N\n"

.section .text

.globl main

main:
    subq $56, %rsp
    leaq .INP_STR(%rip), %rdi
    leaq (%rsp), %rsi
    call __isoc99_scanf@PLT

    movq (%rsp), %rsi
    movq $2, %r8

    cmp $2, %rsi
    jl .no

    jmp .loop


.loop:
    cmp %r8, %rsi
    je .yes

    cqto
    movq %rsi, %rax
    idivq %r8

    cmp $0, %rdx
    je .no
    
    addq $1, %r8
    jmp .loop



.yes:
    leaq .YES_MSG(%rip), %rdi
    call printf@PLT
    addq $56, %rsp
    ret

.no:
    leaq .NO_MSG(%rip), %rdi
    call printf@PLT
    addq $56, %rsp
    ret