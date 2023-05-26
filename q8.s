.section .rodata

.INP_STR:
    .string "%Ld %Ld %Ld %Ld %Ld"

.OUT_STR:
    .string "%Ld\n"

.section .text

.globl main

main:
    subq $56, %rsp
    leaq .INP_STR(%rip), %rdi
    leaq (%rsp), %rsi
    leaq 8(%rsp), %rdx
    leaq 16(%rsp), %rcx
    leaq 24(%rsp), %r8
    leaq 32(%rsp), %r9
    call __isoc99_scanf@PLT

    movq (%rsp), %rsi
    movq 8(%rsp), %rdx
    movq 16(%rsp), %rcx
    movq 24(%rsp), %r8
    movq 32(%rsp), %r9

    cmpq %rsi,  %rdx
    jge .first
    jmp .second

.first:
    movq %rdx, %rax
    jmp .third

.second:
    movq %rsi, %rax
    jmp .third

.third:
    cmpq %rcx, %rax
    jl .fourth
    jmp .fifth

.fourth:
    movq %rcx, %rax
    jmp .fifth

.fifth:
    cmpq %r8, %rax
    jl .sixth
    jmp .seven

.sixth:
    movq %r8, %rax
    jmp .seven

.seven:
    cmpq %r9, %rax
    jl .eight
    jmp .nine

.eight:
    movq %r9, %rax
    jmp .nine

.nine:
    movq %rax, %rsi
    leaq .OUT_STR(%rip), %rdi
    call printf@PLT
    xorq %rsi, %rsi
    addq $56, %rsp
    ret
