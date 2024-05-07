; ModuleID = 'func2.d2b847c4645c4b15-cgu.0'
source_filename = "func2.d2b847c4645c4b15-cgu.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx11.0.0"

; func2::custom_func
; Function Attrs: uwtable
define i32 @_ZN5func211custom_func17h4999def379d3faffE(i32 %x, i32 %y) unnamed_addr #0 {
start:
  %_0.i4 = add i32 %x, %y
  %_0.i9 = mul i32 %_0.i4, 2
  %_0.i3 = add i32 %x, %y
  %_0.i8 = mul i32 %_0.i3, 2
  %_0.i2 = add i32 %x, %y
  %_0.i7 = mul i32 %_0.i2, 2
  %_0.i1 = add i32 %x, %y
  %_0.i6 = mul i32 %_0.i1, 2
  %_0.i = add i32 %x, %y
  %_0.i5 = mul i32 %_0.i, 2
  ret i32 0
}

attributes #0 = { uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="apple-m1" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.76.0 (07dca489a 2024-02-04)"}
