.section .init
.globl _start
_start:

ldr r0,=0x20200000 @ ADDR of GPIO reg
mov r2,#0x3F0000 @ Wait timer

mov r1,#1
lsl r1,#18
str r1,[r0,#4] @ enable GPIO pin 16
               @ Pins 10-19 in second GPIO DWORD
               @ 10 + 6th bit triplet starts at 18

mov r1,#1
lsl r1,#16

loop$:
str r1,[r0,#40]
bl wait1$

str r1,[r0,#28]
bl wait1$

b loop$

wait1$:
sub r2,#1
cmp r2,#0
bne wait1$
mov r2,#0x3F0000 @ Wait timer
mov pc,lr

