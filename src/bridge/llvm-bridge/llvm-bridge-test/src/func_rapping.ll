; ModuleID = 'func_rapping.1763ed0b28eaca35-cgu.0'
source_filename = "func_rapping.1763ed0b28eaca35-cgu.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx11.0.0"

; func_rapping::custom_func
; Function Attrs: uwtable
define i32 @_ZN12func_rapping11custom_func17hd6c5e0e9e2ff1a4eE(i32 %x, i32 %y) unnamed_addr #0 {
start:
  %_0.i = add i32 %x, %y
  %_0.i1 = mul i32 %_0.i, 1000
  ret i32 %_0.i1
}

attributes #0 = { uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="apple-m1" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.76.0 (07dca489a 2024-02-04)"}
