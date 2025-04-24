; ModuleID = 'rust_fiat_poly1305_carry_mul.3c1b1e91449fcaf7-cgu.0'
source_filename = "rust_fiat_poly1305_carry_mul.3c1b1e91449fcaf7-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @rust_fiat_poly1305_carry_mul(ptr noalias nocapture noundef writeonly align 8 dereferenceable(24) %out1, ptr noalias nocapture noundef readonly align 8 dereferenceable(24) %arg1, ptr noalias nocapture noundef readonly align 8 dereferenceable(24) %arg2) unnamed_addr #0 {
start:
  %_0.i = getelementptr inbounds i8, ptr %arg1, i64 16
  %_6 = load i64, ptr %_0.i, align 8, !noundef !3
  %_5 = zext i64 %_6 to i128
  %_0.i1 = getelementptr inbounds i8, ptr %arg2, i64 16
  %_10 = load i64, ptr %_0.i1, align 8, !noundef !3
  %_9 = mul i64 %_10, 5
  %_8 = zext i64 %_9 to i128
  %x1 = mul nuw i128 %_8, %_5
  %_0.i3 = getelementptr inbounds i8, ptr %arg2, i64 8
  %_18 = load i64, ptr %_0.i3, align 8, !noundef !3
  %_17 = mul i64 %_18, 10
  %_16 = zext i64 %_17 to i128
  %x2 = mul nuw i128 %_16, %_5
  %_0.i4 = getelementptr inbounds i8, ptr %arg1, i64 8
  %_22 = load i64, ptr %_0.i4, align 8, !noundef !3
  %_21 = zext i64 %_22 to i128
  %_25 = mul i64 %_10, 10
  %_24 = zext i64 %_25 to i128
  %x3 = mul nuw i128 %_21, %_24
  %_33 = load i64, ptr %arg2, align 8, !noundef !3
  %_32 = zext i64 %_33 to i128
  %x4 = mul nuw i128 %_32, %_5
  %_40 = shl i64 %_18, 1
  %_39 = zext i64 %_40 to i128
  %x5 = mul nuw i128 %_21, %_39
  %x6 = mul nuw i128 %_32, %_21
  %_52 = load i64, ptr %arg1, align 8, !noundef !3
  %_51 = zext i64 %_52 to i128
  %_54 = zext i64 %_10 to i128
  %x7 = mul nuw i128 %_51, %_54
  %_61 = zext i64 %_18 to i128
  %x8 = mul nuw i128 %_51, %_61
  %x9 = mul nuw i128 %_51, %_32
  %_72 = add i128 %x3, %x2
  %x10 = add i128 %_72, %x9
  %_74 = lshr i128 %x10, 44
  %0 = trunc i128 %x10 to i64
  %x12 = and i64 %0, 17592186044415
  %_78 = add i128 %x4, %x5
  %x13 = add i128 %_78, %x7
  %_80 = add i128 %x6, %x1
  %x14 = add i128 %_80, %x8
  %_82 = and i128 %_74, 18446744073709551615
  %x15 = add i128 %x14, %_82
  %_84 = lshr i128 %x15, 43
  %1 = trunc i128 %x15 to i64
  %x17 = and i64 %1, 8796093022207
  %_88 = and i128 %_84, 18446744073709551615
  %x18 = add i128 %x13, %_88
  %_90 = lshr i128 %x18, 43
  %x19 = trunc i128 %_90 to i64
  %2 = trunc i128 %x18 to i64
  %x20 = and i64 %2, 8796093022207
  %x21 = mul i64 %x19, 5
  %x22 = add i64 %x21, %x12
  %x23 = lshr i64 %x22, 44
  %x24 = and i64 %x22, 17592186044415
  %x25 = add nuw nsw i64 %x23, %x17
  %_99 = lshr i64 %x25, 43
  %x27 = and i64 %x25, 8796093022207
  %x28 = add nuw nsw i64 %_99, %x20
  store i64 %x24, ptr %out1, align 8
  %_0.i19 = getelementptr inbounds i8, ptr %out1, i64 8
  store i64 %x27, ptr %_0.i19, align 8
  %_0.i20 = getelementptr inbounds i8, ptr %out1, i64 16
  store i64 %x28, ptr %_0.i20, align 8
  ret void
}

attributes #0 = { inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.83.0 (90b35a623 2024-11-26)"}
!3 = !{}
