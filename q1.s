.section .rodata

.INT_STR:
    .string "%d %d %d"

.OUT_STR:
    .string "%d\n"

.section .text
.globl main

main:
    subq $56, %rsp
    leaq .INT_STR(%rip), %rdi
    leaq (%rsp), %rsi
    leaq 8(%rsp), %rdx
    leaq 16(%rsp), %rcx
    call __isoc99_scanf@PLT

    movq (%rsp), %r8
    movq 8(%rsp), %r9
    movq 16(%rsp), %rcx

    cmp $1, %rcx
    je .add

    cmp $2, %rcx
    je .sub
    
    cmp $3, %rcx
    je .div

    cmp $4, %rcx
    je .mod 

.add:
    movq %r8, %rsi
    addq %r9, %rsi
    jmp .print

.sub:
    movq %r8, %rsi
    subq %r9, %rsi
    jmp .print

.div:
    movq %r8, %rax
    cqto
    idivq  %r9
    movq %rax, %rsi
    jmp .print

.mod:
    movq %r8, %rax
    cqto
    idivq  %r9
    movq %rdx, %rsi
    jmp .print


.print:
    leaq    .OUT_STR(%rip), %rdi
    call printf@PLT
    addq $56, %rsp
    xorq %rsi, %rsi
    ret