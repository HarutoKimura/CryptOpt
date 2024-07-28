; ModuleID = 'func.fc3066d48445be0e-cgu.0'
source_filename = "func.fc3066d48445be0e-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nonlazybind uwtable
define void @secp256k1_fe_mul_inner(ptr align 8 %a, ptr align 8 %b) unnamed_addr #0 {
start:
  %_7 = load i64, ptr %a, align 8, !noundef !3
  %_8 = load i64, ptr %b, align 8, !noundef !3
  %_0.i16 = add i64 %_7, %_8
  %_0.i25 = mul i64 %_0.i16, 2
  %_12 = load i64, ptr %a, align 8, !noundef !3
  %_13 = load i64, ptr %b, align 8, !noundef !3
  %_0.i24 = mul i64 %_12, %_13
  %_0.i15 = add i64 %_0.i24, 3
  %_0.i14 = add i64 %_0.i25, %_0.i15
  %_17 = load i64, ptr %a, align 8, !noundef !3
  %_18 = load i64, ptr %b, align 8, !noundef !3
  %_0.i13 = add i64 %_17, %_18
  %_0.i23 = mul i64 %_0.i13, 4
  %_0.i12 = add i64 %_0.i14, %_0.i23
  %_22 = load i64, ptr %a, align 8, !noundef !3
  %_23 = load i64, ptr %b, align 8, !noundef !3
  %_0.i22 = mul i64 %_22, %_23
  %_0.i11 = add i64 %_0.i22, 5
  %_0.i10 = add i64 %_0.i12, %_0.i11
  %_27 = load i64, ptr %a, align 8, !noundef !3
  %_28 = load i64, ptr %b, align 8, !noundef !3
  %_0.i9 = add i64 %_27, %_28
  %_0.i21 = mul i64 %_0.i9, 6
  %_0.i8 = add i64 %_0.i10, %_0.i21
  %_32 = load i64, ptr %a, align 8, !noundef !3
  %_33 = load i64, ptr %b, align 8, !noundef !3
  %_0.i20 = mul i64 %_32, %_33
  %_0.i7 = add i64 %_0.i20, 7
  %_0.i6 = add i64 %_0.i8, %_0.i7
  %_37 = load i64, ptr %a, align 8, !noundef !3
  %_38 = load i64, ptr %b, align 8, !noundef !3
  %_0.i5 = add i64 %_37, %_38
  %_0.i19 = mul i64 %_0.i5, 8
  %_0.i4 = add i64 %_0.i6, %_0.i19
  %_42 = load i64, ptr %a, align 8, !noundef !3
  %_43 = load i64, ptr %b, align 8, !noundef !3
  %_0.i18 = mul i64 %_42, %_43
  %_0.i3 = add i64 %_0.i18, 9
  %_0.i2 = add i64 %_0.i4, %_0.i3
  %_47 = load i64, ptr %a, align 8, !noundef !3
  %_48 = load i64, ptr %b, align 8, !noundef !3
  %_0.i1 = add i64 %_47, %_48
  %_0.i17 = mul i64 %_0.i1, 10
  %_0.i = add i64 %_0.i2, %_0.i17
  ret void
}