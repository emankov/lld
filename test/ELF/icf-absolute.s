# REQUIRES: x86

# RUN: llvm-mc -filetype=obj -triple=x86_64-unknown-linux %s -o %t
# RUN: llvm-mc -filetype=obj -triple=x86_64-unknown-linux %S/Inputs/icf-absolute.s -o %t2
# RUN: ld.lld %t %t2 -o %t3 --icf=all --print-icf-sections | FileCheck %s

# CHECK: selected section '.text.f1' from file
# CHECK:   removing identical section '.text.f2' from file

.globl _start, f1, f2
_start:
  ret

.section .text.f1, "ax"
f1:
  .byte a1

.section .text.f2, "ax"
f2:
  .byte a2
