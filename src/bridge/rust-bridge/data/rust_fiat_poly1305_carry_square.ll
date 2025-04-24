; ModuleID = 'rust_fiat_poly1305_carry_square.738b5a6c1d110e9e-cgu.0'
source_filename = "rust_fiat_poly1305_carry_square.738b5a6c1d110e9e-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @rust_fiat_poly1305_carry_square(ptr noalias nocapture noundef writeonly align 8 dereferenceable(24) %out1, ptr noalias nocapture noundef readonly align 8 dereferenceable(24) %arg1) unnamed_addr #0 {
start:
  %_0.i = getelementptr inbounds i8, ptr %arg1, i64 16
  %_4 = load i64, ptr %_0.i, align 8, !noundef !3
  %x1 = mul i64 %_4, 5
  %x3 = shl i64 %_4, 1
  %_0.i2 = getelementptr inbounds i8, ptr %arg1, i64 8
  %_11 = load i64, ptr %_0.i2, align 8, !noundef !3
  %x4 = shl i64 %_11, 1
  %_14 = zext i64 %_4 to i128
  %_17 = zext i64 %x1 to i128
  %x5 = mul nuw i128 %_17, %_14
  %_19 = zext i64 %_11 to i128
  %_23 = mul i64 %_4, 20
  %_22 = zext i64 %_23 to i128
  %x6 = mul nuw i128 %_19, %_22
  %_28 = zext i64 %x4 to i128
  %x7 = mul nuw i128 %_28, %_19
  %_34 = load i64, ptr %arg1, align 8, !noundef !3
  %_33 = zext i64 %_34 to i128
  %_36 = zext i64 %x3 to i128
  %x8 = mul nuw i128 %_33, %_36
  %x9 = mul nuw i128 %_33, %_28
  %x10 = mul nuw i128 %_33, %_33
  %x11 = add i128 %x10, %x6
  %_51 = lshr i128 %x11, 44
  %0 = trunc i128 %x11 to i64
  %x13 = and i64 %0, 17592186044413
  %x14 = add i128 %x8, %x7
  %x15 = add i128 %x9, %x5
  %_57 = and i128 %_51, 18446744073709551615
  %x16 = add i128 %x15, %_57
  %_59 = lshr i128 %x16, 43
  %1 = trunc i128 %x16 to i64
  %x18 = and i64 %1, 8796093022207
  %_63 = and i128 %_59, 18446744073709551615
  %x19 = add i128 %x14, %_63
  %_65 = lshr i128 %x19, 43
  %x20 = trunc i128 %_65 to i64
  %2 = trunc i128 %x19 to i64
  %x21 = and i64 %2, 8796093022207
  %x22 = mul i64 %x20, 5
  %x23 = add i64 %x22, %x13
  %x24 = lshr i64 %x23, 44
  %x25 = and i64 %x23, 17592186044415
  %x26 = add nuw nsw i64 %x24, %x18
  %_74 = lshr i64 %x26, 43
  %x28 = and i64 %x26, 8796093022207
  %x29 = add nuw nsw i64 %_74, %x21
  store i64 %x25, ptr %out1, align 8
  %_0.i12 = getelementptr inbounds i8, ptr %out1, i64 8
  store i64 %x28, ptr %_0.i12, align 8
  %_0.i13 = getelementptr inbounds i8, ptr %out1, i64 16
  store i64 %x29, ptr %_0.i13, align 8
  ret void
}

attributes #0 = { inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.83.0 (90b35a623 2024-11-26)"}
!3 = !{}
