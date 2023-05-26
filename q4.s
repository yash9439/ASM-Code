.section .rodata

.INP_STR:
    .string "%d %d"

.OUT_STR:
    .string "%d\n"

.section .text

.globl main

main:
    subq $56, %rsp
    leaq .INP_STR(%rip), %rdi
    leaq (%rsp), %rsi
    leaq 8(%rsp), %rdx
    call __isoc99_scanf@PLT

    movq (%rsp), %rax
    movq 8(%rsp), %rdx

    cmp %rax, %rdx
    jl .switch
    jmp .chk

.switch:
    movq 8(%rsp), %rax
    movq (%rsp), %rdx
    jmp .chk

.chk:
    cmp $0, %rax
    je .end
    jmp .loop

.loop:
    movq %rax, %r8
    movq %rdx, %r9
    movq %r9, %rax
    cqto
    idivq %r8
    movq %rdx, %rax
    movq %r8, %rdx
    jmp .chk


.end:
    movq %rdx, %rsi
    leaq .OUT_STR(%rip), %rdi
    call printf@PLT
    xorq %rsi, %rsi
    addq $56, %rsp
    ret