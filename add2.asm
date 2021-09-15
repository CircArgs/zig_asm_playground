.section .data

.section .text

.globl _start

_start:
    pushl $3
    pushl $2
    call add2
    movl %eax, %ebx
    movl $1, %eax
    int $0x80


add2:
    pushl %ebp
    movl %esp, %ebp
    subl $4, %esp
    movl 8(%ebp), %ebx
    movl 12(%ebp), %eax
    addl %ebx, %eax
    movl %ebp, %esp
    popl %ebp
    ret
