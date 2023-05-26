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

    movq (%rsp), %rax
    xor %rsi, %rsi
    movq $2, %r9

    jmp .loop


.loop:
    cqto
    idivq %r9
    addq %rdx, %rsi
    cmpq $0, %rax
    je .end
    jmp .loop

.end:
    movq %rsi, %rax
    cqto
    idivq %r9
    cmpq $0, %rdx
    je .no
    jmp .yes

.no:
    leaq .NO_MSG(%rip), %rdi
    jmp .finish


.yes:
    leaq .YES_MSG(%rip), %rdi
    jmp .finish


.finish:
    call printf@PLT
    xorl    %eax, %eax
    addq    $56, %rsp
    ret
