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
    movq %rax, %r8
    movq $10, %r9
    xorq %rsi, %rsi

    jmp .loop

.loop:
    cmpq $0, %rax
    je .chk
    cqto
    idivq %r9

    cmp $0, %rdx
    je .fac0

    cmp $1, %rdx
    je .fac1
    

    cmp $2, %rdx
    je .fac2
    

    cmp $3, %rdx
    je .fac3
    

    cmp $4, %rdx
    je .fac4
    

    cmp $5, %rdx
    je .fac5
    

    cmp $6, %rdx
    je .fac6
    

    cmp $7, %rdx
    je .fac7
    

    cmp $8, %rdx
    je .fac8
    

    cmp $9, %rdx
    je .fac9
    

    jmp .loop

.fac0:
    addq $1, %rsi
    jmp .loop

.fac1:
    addq $1, %rsi
    jmp .loop

.fac2:
    addq $2, %rsi
    jmp .loop

.fac3:
    addq $6, %rsi
    jmp .loop

.fac4:
    addq $24, %rsi
    jmp .loop

.fac5:
    addq $120, %rsi
    jmp .loop

.fac6:
    addq $720, %rsi
    jmp .loop

.fac7:
    addq $5040, %rsi
    jmp .loop

.fac8:
    addq $40320, %rsi
    jmp .loop

.fac9:
    addq $362880, %rsi
    jmp .loop

.chk:
    cmpq %rsi, %r8
    je .yes
    jmp .no


.yes:
    leaq .YES_MSG(%rip), %rdi
    jmp .end

.no:        
    leaq .NO_MSG(%rip), %rdi
    jmp .end

.end:
    call printf@PLT
    xorq %rsi, %rsi
    addq $56, %rsp
    ret
