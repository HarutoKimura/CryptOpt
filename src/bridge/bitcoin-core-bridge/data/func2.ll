; ModuleID = 'func2.d2b847c4645c4b15-cgu.0'
source_filename = "func2.d2b847c4645c4b15-cgu.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx11.0.0"

; func2::custom_func_ver
; Function Attrs: uwtable
define i64 @_ZN5func215custom_func_ver17h7b98fac31cbea207E(i64 %x, i64 %y) unnamed_addr #0 {
start:
  %_0.i8 = add i64 %x, %y
  %_0.i17 = mul i64 %_0.i8, 2
  %_0.i16 = mul i64 %x, %y
  %_0.i7 = add i64 %_0.i16, 3
  %_0.i6 = add i64 %x, %y
  %_0.i15 = mul i64 %_0.i6, 4
  %_0.i14 = mul i64 %x, %y
  %_0.i5 = add i64 %_0.i14, 5
  %_0.i4 = add i64 %x, %y
  %_0.i13 = mul i64 %_0.i4, 6
  %_0.i12 = mul i64 %x, %y
  %_0.i3 = add i64 %_0.i12, 7
  %_0.i2 = add i64 %x, %y
  %_0.i11 = mul i64 %_0.i2, 8
  %_0.i10 = mul i64 %x, %y
  %_0.i1 = add i64 %_0.i10, 9
  %_0.i = add i64 %x, %y
  %_0.i9 = mul i64 %_0.i, 10
  ret i64 0
}

attributes #0 = { uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="apple-m1" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.76.0 (07dca489a 2024-02-04)"}
