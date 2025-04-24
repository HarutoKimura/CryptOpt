; ModuleID = 'rust_fiat_curve25519_solinas_mul_small_two_carry_2.ba4b1ef78bbc41e5-cgu.0'
source_filename = "rust_fiat_curve25519_solinas_mul_small_two_carry_2.ba4b1ef78bbc41e5-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @rust_fiat_curve25519_solinas_mul_small_two_carry_2(ptr noalias nocapture noundef writeonly align 8 dereferenceable(32) %out1, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) %arg1, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) %arg2) unnamed_addr #0 {
start:
  %0 = getelementptr inbounds [4 x i64], ptr %arg1, i64 0, i64 3
  %_9 = load i64, ptr %0, align 8, !noundef !3
  %1 = getelementptr inbounds [4 x i64], ptr %arg2, i64 0, i64 3
  %_10 = load i64, ptr %1, align 8, !noundef !3
  %_7.i = zext i64 %_10 to i128
  %2 = getelementptr inbounds [4 x i64], ptr %arg2, i64 0, i64 2
  %_17 = load i64, ptr %2, align 8, !noundef !3
  %_7.i2 = zext i64 %_17 to i128
  %3 = getelementptr inbounds [4 x i64], ptr %arg2, i64 0, i64 1
  %_24 = load i64, ptr %3, align 8, !noundef !3
  %x1.i9 = mul i64 %_24, %_9
  %_31 = load i64, ptr %arg2, align 8, !noundef !3
  %x1.i15 = mul i64 %_31, %_9
  %4 = getelementptr inbounds [4 x i64], ptr %arg1, i64 0, i64 1
  %_65 = load i64, ptr %4, align 8, !noundef !3
  %_6.i43 = zext i64 %_65 to i128
  %x1.i45 = mul nuw i128 %_6.i43, %_7.i
  %_11.i47 = lshr i128 %x1.i45, 64
  %x3.i48 = trunc i128 %_11.i47 to i64
  %_93 = load i64, ptr %arg1, align 8, !noundef !3
  %_6.i67 = zext i64 %_93 to i128
  %x1.i69 = mul nuw i128 %_6.i67, %_7.i
  %_11.i71 = lshr i128 %x1.i69, 64
  %x1.i75 = mul nuw i128 %_6.i67, %_7.i2
  %_11.i77 = lshr i128 %x1.i75, 64
  %x1.i87 = mul i64 %_93, %_31
  %_10.i = zext i64 %x1.i15 to i128
  %x1.i91 = add nuw nsw i128 %_11.i77, %_10.i
  %x2.i92 = trunc i128 %x1.i91 to i64
  %_14.i = lshr i128 %x1.i91, 64
  %_10.i96 = zext i64 %x1.i9 to i128
  %_7.i95 = add nuw nsw i128 %_11.i71, %_10.i96
  %x1.i97 = add nuw nsw i128 %_7.i95, %_14.i
  %x2.i98 = trunc i128 %x1.i97 to i64
  %_14.i99 = lshr i128 %x1.i97, 64
  %x3.i100 = trunc i128 %_14.i99 to i64
  %x37 = add nuw i64 %x3.i100, %x3.i48
  store i64 %x1.i87, ptr %out1, align 8
  %5 = getelementptr inbounds [4 x i64], ptr %out1, i64 0, i64 1
  store i64 %x2.i92, ptr %5, align 8
  %6 = getelementptr inbounds [4 x i64], ptr %out1, i64 0, i64 2
  store i64 %x2.i98, ptr %6, align 8
  %7 = getelementptr inbounds [4 x i64], ptr %out1, i64 0, i64 3
  store i64 %x37, ptr %7, align 8
  ret void
}

attributes #0 = { inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)"}
!3 = !{}
