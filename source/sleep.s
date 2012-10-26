.globl Sleep
Sleep:
usecs .req r0
cntrAddr .req r1
ldr cntrAddr,=0x20003004

ldrd r2,r3,[cntrAddr]
add usecs,r2
.unreq usecs
endCntr .req r0

sleepLoop$:
  curCntr .req r2
  ldrd curCntr,r3,[cntrAddr]
  cmp endCntr,curCntr
  bhi sleepLoop$
  .unreq curCntr

.unreq endCntr
.unreq cntrAddr
mov pc,lr

