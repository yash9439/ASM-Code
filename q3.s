.section .rodata

.INP_STR:
    .string "%d"

.OUT_STR:
    .string "%d\n"

.section .text

.globl main

main:
    subq $56, %rsp
    leaq .INP_STR(%rip), %rdi
    leaq (%rsp), %rsi
    call __isoc99_scanf@PLT

    movq (%rsp), %rsi

    movq $1, %r8
    movq $1, %r9

    jmp .loop

.loop:
    movq %r9, %rax

    cqto 
    idivq %rsi
    cmpq $0, %rdx
    je .end

    addq $1, %r8
    imulq %r8, %r9

    jmp .loop

.end:
    movq %r8, %rsi

    leaq .OUT_STR(%rip), %rdi
    call printf@PLT
    xorq %rsi, %rsi
    addq $56, %rsp
    ret