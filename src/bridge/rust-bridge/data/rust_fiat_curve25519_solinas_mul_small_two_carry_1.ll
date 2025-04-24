; ModuleID = 'rust_fiat_curve25519_solinas_mul_small_two_carry_1.d0ef558d43a6d7c9-cgu.0'
source_filename = "rust_fiat_curve25519_solinas_mul_small_two_carry_1.d0ef558d43a6d7c9-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @rust_fiat_curve25519_solinas_mul_small_two_carry_1(ptr noalias nocapture noundef writeonly align 8 dereferenceable(32) %out1, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) %arg1, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) %arg2) unnamed_addr #0 {
start:
  %0 = getelementptr inbounds [4 x i64], ptr %arg1, i64 0, i64 3
  %_9 = load i64, ptr %0, align 8, !noundef !3
  %1 = getelementptr inbounds [4 x i64], ptr %arg2, i64 0, i64 2
  %_17 = load i64, ptr %1, align 8, !noundef !3
  %_7.i2 = zext i64 %_17 to i128
  %2 = getelementptr inbounds [4 x i64], ptr %arg2, i64 0, i64 1
  %_24 = load i64, ptr %2, align 8, !noundef !3
  %_7.i8 = zext i64 %_24 to i128
  %_31 = load i64, ptr %arg2, align 8, !noundef !3
  %_7.i14 = zext i64 %_31 to i128
  %x1.i15 = mul i64 %_31, %_9
  %_93 = load i64, ptr %arg1, align 8, !noundef !3
  %_6.i67 = zext i64 %_93 to i128
  %x1.i75 = mul nuw i128 %_6.i67, %_7.i2
  %_11.i77 = lshr i128 %x1.i75, 64
  %x3.i78 = trunc i128 %_11.i77 to i64
  %x1.i81 = mul nuw i128 %_6.i67, %_7.i8
  %_11.i83 = lshr i128 %x1.i81, 64
  %x3.i84 = trunc i128 %_11.i83 to i64
  %x1.i87 = mul nuw i128 %_6.i67, %_7.i14
  %x2.i88 = trunc i128 %x1.i87 to i64
  %_11.i89 = lshr i128 %x1.i87, 64
  %x3.i90 = trunc i128 %_11.i89 to i64
  %add.narrowed.i = add i64 %x1.i15, %x3.i78
  store i64 %x3.i84, ptr %out1, align 8
  %3 = getelementptr inbounds [4 x i64], ptr %out1, i64 0, i64 1
  store i64 %x2.i88, ptr %3, align 8
  %4 = getelementptr inbounds [4 x i64], ptr %out1, i64 0, i64 2
  store i64 %x3.i90, ptr %4, align 8
  %5 = getelementptr inbounds [4 x i64], ptr %out1, i64 0, i64 3
  store i64 %add.narrowed.i, ptr %5, align 8
  ret void
}

attributes #0 = { inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)"}
!3 = !{}
