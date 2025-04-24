; ModuleID = 'rust_fiat_curve25519_solinas_mul_small.f59498c6242c70c3-cgu.0'
source_filename = "rust_fiat_curve25519_solinas_mul_small.f59498c6242c70c3-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @rust_fiat_curve25519_solinas_mul(ptr noalias nocapture noundef writeonly align 8 dereferenceable(32) %out1, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) %arg1, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) %arg2) unnamed_addr #0 {
start:
  %0 = getelementptr inbounds [4 x i64], ptr %arg1, i64 0, i64 3
  %arg11 = load i64, ptr %0, align 8, !noundef !3
  %1 = getelementptr inbounds [4 x i64], ptr %arg2, i64 0, i64 3
  %arg22 = load i64, ptr %1, align 8, !noundef !3
  %_122 = zext i64 %arg22 to i128
  %2 = getelementptr inbounds [4 x i64], ptr %arg2, i64 0, i64 2
  %arg214 = load i64, ptr %2, align 8, !noundef !3
  %_129 = zext i64 %arg214 to i128
  %3 = getelementptr inbounds [4 x i64], ptr %arg2, i64 0, i64 1
  %arg219 = load i64, ptr %3, align 8, !noundef !3
  %x120.narrow = mul i64 %arg219, %arg11
  %arg224 = load i64, ptr %arg2, align 8, !noundef !3
  %_143 = zext i64 %arg224 to i128
  %x125.narrow = mul i64 %arg224, %arg11
  %4 = getelementptr inbounds [4 x i64], ptr %arg1, i64 0, i64 1
  %arg148 = load i64, ptr %4, align 8, !noundef !3
  %_177 = zext i64 %arg148 to i128
  %x150 = mul nuw i128 %_177, %_122
  %_182 = lshr i128 %x150, 64
  %x352 = trunc i128 %_182 to i64
  %arg168 = load i64, ptr %arg1, align 8, !noundef !3
  %_205 = zext i64 %arg168 to i128
  %x170 = mul nuw i128 %_205, %_122
  %_210 = lshr i128 %x170, 64
  %x175 = mul nuw i128 %_205, %_129
  %_217 = lshr i128 %x175, 64
  %x185 = mul nuw i128 %_205, %_143
  %_231 = lshr i128 %x185, 64
  %x387 = trunc i128 %_231 to i64
  %_235 = zext i64 %x125.narrow to i128
  %x189 = add nuw nsw i128 %_217, %_235
  %x290 = trunc i128 %x189 to i64
  %_239 = lshr i128 %x189, 64
  %_244 = zext i64 %x120.narrow to i128
  %_241 = add nuw nsw i128 %_210, %_244
  %x195 = add nuw nsw i128 %_241, %_239
  %x296 = trunc i128 %x195 to i64
  %_248 = lshr i128 %x195, 64
  %x397 = trunc i128 %_248 to i64
  %x37 = add nuw i64 %x397, %x352
  store i64 %x387, ptr %out1, align 8
  %5 = getelementptr inbounds [4 x i64], ptr %out1, i64 0, i64 1
  store i64 %x290, ptr %5, align 8
  %6 = getelementptr inbounds [4 x i64], ptr %out1, i64 0, i64 2
  store i64 %x296, ptr %6, align 8
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
