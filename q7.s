.section .rodata

.INP_STR:
    .string "%d %d %d %d"

.OUT_STR:
    .string "%d\n"

.section .text

.globl main

main:
    subq $72, %rsp
    leaq .INP_STR(%rip), %rdi
    leaq (%rsp), %rsi
    leaq 8(%rsp), %rdx
    leaq 16(%rsp), %rcx
    leaq 24(%rsp), %r8
    call __isoc99_scanf@PLT

    leaq .INP_STR(%rip), %rdi
    leaq 32(%rsp), %rsi
    leaq 40(%rsp), %rdx
    leaq 48(%rsp), %rcx
    leaq 56(%rsp), %r8
    call __isoc99_scanf@PLT

    addq $72, %rsp
    ret