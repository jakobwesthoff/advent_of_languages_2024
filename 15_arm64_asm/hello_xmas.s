;    /\
;   /  \
;   /  \
;  /    \
;  /    \
; /      \
; --------
;    ||
;    ||
.global _main
.align 2

.EQU STDOUT, 1
.EQU SYS_EXIT, 1
.EQU SYS_WRITE, 4

 ; stp x29, x30, [sp, #-16]!
 ; mov x29, sp

 ; mov sp, x29
 ; ldp x29, x30, [sp], #16
 ; ret

; print character in x0 to stdout
print:
  stp x29, x30, [sp, #-16]!
  mov x29, sp
  
  sub sp, sp, #16
  strb w0, [sp]

  mov x0, #STDOUT
  mov x1, sp
  mov x2, #1
  mov x16, #SYS_WRITE
  svc #0x80

  mov sp, x29
  ldp x29, x30, [sp], #16
  ret

; Destroys x10
; print n spaces (x0) to stdout
space: 
  stp x29, x30, [sp, #-16]!
  mov x29, sp
  ; x10 = n
  mov x10, x0
space_loop:
  cmp x10, #0
  b.eq space_loop_end
  ; @TODO: Replace with space
  mov x0, ' '
  bl print
  sub x10, x10, #1
  b space_loop
space_loop_end:
  
  mov sp, x29
  ldp x29, x30, [sp], #16
  ret

tree:
  stp x29, x30, [sp, #-16]!
  mov x29, sp
 
  ; x11 = groups
  mov x11, x0
  ; x12 = i
  mov x12, #0
group_loop:
  ;first line
  ; x0 = groups - i
  mov x0, x11
  sub x0, x0, x12
  bl space
  mov x0, '/'
  bl print
  ; x0 = i*2
  mov x1, #2
  mul x0, x12, x1
  bl space
  mov x0, '\\'
  bl print
  mov x0, '\n'
  bl print
  ;second line
  ; x0 = groups - i - 1
  mov x0, x11
  sub x0, x0, x12
  sub x0, x0, #1
  bl space
  mov x0, '/'
  bl print
  ; x0 = (i+1)*2
  mov x0, x12
  add x0, x0, #1
  mov x1, #2
  mul x0, x0, x1
  bl space
  mov x0, '\\'
  bl print
  mov x0, '\n'
  bl print
  add x12, x12, #1
  cmp x12, x11
  b.lt group_loop
group_loop_end:
 
  ; x10 = groups*2+2
  mov x10, x11
  mov x0, #2
  mul x10, x10, x0
  add x10, x10, #2

divider_loop:
  cmp x10, #0
  b.eq divider_loop_end
  mov x0, '-'
  bl print
  sub x10, x10, #1
  b divider_loop
divider_loop_end:
  mov x0, '\n'
  bl print

; trunk
  ; x0 = groups
  mov x0, x11
  bl space
  mov x0, '|'
  bl print
  mov x0, '|'
  bl print
  mov x0, '\n'
  bl print
  ; x0 = groups
  mov x0, x11
  bl space
  mov x0, '|'
  bl print
  mov x0, '|'
  bl print
  mov x0, '\n'
  bl print

  mov sp, x29
  ldp x29, x30, [sp], #16
  ret

_main:
  mov x0, #7
  bl tree
  ; exit(0)
  mov x0, #0
  mov x16, #SYS_EXIT
  svc #0x80
