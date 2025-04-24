; ModuleID = 'rust_fiat_curve25519_solinas_mul.3c20d5fb9e290536-cgu.0'
source_filename = "rust_fiat_curve25519_solinas_mul.3c20d5fb9e290536-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: write) uwtable
define void @fiat_curve25519_solinas_addcarryx_u64(ptr noalias nocapture noundef writeonly align 8 dereferenceable(8) %out1, ptr noalias nocapture noundef writeonly align 1 dereferenceable(1) %out2, i8 noundef %arg1, i64 noundef %arg2, i64 noundef %arg3) unnamed_addr #0 {
start:
  %_8 = zext i8 %arg1 to i128
  %_9 = zext i64 %arg2 to i128
  %_7 = add nuw nsw i128 %_9, %_8
  %_10 = zext i64 %arg3 to i128
  %x1 = add nuw nsw i128 %_7, %_10
  %x2 = trunc i128 %x1 to i64
  %_14 = lshr i128 %x1, 64
  %x3 = trunc i128 %_14 to i8
  store i64 %x2, ptr %out1, align 8
  store i8 %x3, ptr %out2, align 1
  ret void
}

attributes #0 = { inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: write) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)"}
