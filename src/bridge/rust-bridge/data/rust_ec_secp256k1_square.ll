; ModuleID = 'rust_ec_secp256k1_square.2c12f92f8d7bb4cc-cgu.0'
source_filename = "rust_ec_secp256k1_square.2c12f92f8d7bb4cc-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) uwtable
define void @rust_ec_secp25k61_square(ptr dead_on_unwind noalias nocapture noundef writable writeonly sret([40 x i8]) align 8 dereferenceable(40) %_0, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %self) unnamed_addr #0 {
start:
  tail call void @llvm.experimental.noalias.scope.decl(metadata !3)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !6)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !8)
  %_4.i = load i64, ptr %self, align 8, !alias.scope !10, !noalias !3, !noundef !11
  %a0.i = zext i64 %_4.i to i128
  %0 = getelementptr inbounds i8, ptr %self, i64 8
  %_6.i = load i64, ptr %0, align 8, !alias.scope !10, !noalias !3, !noundef !11
  %a1.i = zext i64 %_6.i to i128
  %1 = getelementptr inbounds i8, ptr %self, i64 16
  %_8.i = load i64, ptr %1, align 8, !alias.scope !10, !noalias !3, !noundef !11
  %a2.i = zext i64 %_8.i to i128
  %2 = getelementptr inbounds i8, ptr %self, i64 24
  %_10.i = load i64, ptr %2, align 8, !alias.scope !10, !noalias !3, !noundef !11
  %a3.i = zext i64 %_10.i to i128
  %3 = getelementptr inbounds i8, ptr %self, i64 32
  %_12.i = load i64, ptr %3, align 8, !alias.scope !10, !noalias !3, !noundef !11
  %a4.i = zext i64 %_12.i to i128
  %_26.i = mul nuw i128 %a3.i, %a0.i
  %_27.i = mul nuw i128 %a2.i, %a1.i
  %4 = mul nuw i128 %a4.i, %a4.i
  %_32.i = and i128 %4, 4503599627370493
  %_31.i = mul nuw nsw i128 %_32.i, 68719492368
  %reass.add2 = add i128 %_26.i, %_27.i
  %5 = shl i128 %reass.add2, 1
  %6 = add i128 %_31.i, %5
  %7 = lshr i128 %4, 52
  %8 = lshr i128 %6, 52
  %_45.i = and i128 %8, 18446744073709551615
  %_48.i = mul nuw i128 %a2.i, %a2.i
  %_52.i = and i128 %7, 18446744073709551615
  %_51.i = mul nuw nsw i128 %_52.i, 68719492368
  %factor = mul nuw i128 %a4.i, %a0.i
  %factor6 = mul nuw i128 %a3.i, %a1.i
  %reass.add7 = add i128 %factor, %factor6
  %reass.mul = shl i128 %reass.add7, 1
  %_41.i = add i128 %_51.i, %_48.i
  %9 = add i128 %_41.i, %_45.i
  %10 = add i128 %9, %reass.mul
  %11 = trunc i128 %10 to i64
  %12 = lshr i128 %10, 52
  %t4.i = lshr i64 %11, 48
  %tx.i = and i64 %t4.i, 15
  %13 = mul nuw i128 %a0.i, %a0.i
  %_63.i = and i128 %12, 18446744073709551615
  %_64.i = mul nuw i128 %a4.i, %a1.i
  %_65.i = mul nuw i128 %a3.i, %a2.i
  %reass.add4 = add i128 %_64.i, %_65.i
  %_60.i = shl i128 %reass.add4, 1
  %14 = add i128 %_63.i, %_60.i
  %15 = trunc i128 %14 to i64
  %16 = lshr i128 %14, 52
  %u0.i = shl i64 %15, 4
  %_74.i = and i64 %u0.i, 72057594037927920
  %u04.i = or disjoint i64 %_74.i, %tx.i
  %_76.i = zext nneg i64 %u04.i to i128
  %_75.i = mul nuw nsw i128 %_76.i, 4294968273
  %17 = add i128 %_75.i, %13
  %18 = trunc i128 %17 to i64
  %r0.i = and i64 %18, 4503599627370495
  %19 = lshr i128 %17, 52
  %_83.i = and i128 %19, 18446744073709551615
  %_88.i = and i128 %16, 18446744073709551615
  %_90.i = mul nuw i128 %a3.i, %a3.i
  %_89.i = shl nuw nsw i128 %a2.i, 1
  %reass.add = mul i128 %_89.i, %a4.i
  %_86.i = add i128 %reass.add, %_90.i
  %20 = add i128 %_86.i, %_88.i
  %_93.i = and i128 %20, 4503599627370495
  %_92.i = mul nuw nsw i128 %_93.i, 68719492368
  %_84.i = shl nuw nsw i128 %a0.i, 1
  %_82.i = mul i128 %_84.i, %a1.i
  %21 = add i128 %_92.i, %_82.i
  %22 = add i128 %21, %_83.i
  %23 = lshr i128 %20, 52
  %24 = trunc i128 %22 to i64
  %r1.i = and i64 %24, 4503599627370495
  %25 = lshr i128 %22, 52
  %_104.i = and i128 %25, 18446744073709551615
  %_106.i = mul nuw i128 %a1.i, %a1.i
  %_109.i = and i128 %23, 18446744073709551615
  %_110.i = shl nuw nsw i128 %a3.i, 1
  %_108.i = mul i128 %_110.i, %a4.i
  %26 = add i128 %_109.i, %_108.i
  %_113.i = and i128 %26, 4503599627370495
  %_112.i = mul nuw nsw i128 %_113.i, 68719492368
  %_105.i = shl nuw nsw i128 %a0.i, 1
  %reass.add5 = mul i128 %_105.i, %a2.i
  %_102.i = add i128 %reass.add5, %_106.i
  %27 = add i128 %_102.i, %_112.i
  %28 = add i128 %27, %_104.i
  %29 = lshr i128 %26, 52
  %30 = trunc i128 %28 to i64
  %r2.i = and i64 %30, 4503599627370495
  %31 = lshr i128 %28, 52
  %_123.i = and i128 %31, 18446744073709551615
  %_125.i = and i128 %29, 18446744073709551615
  %_124.i = mul nuw nsw i128 %_125.i, 68719492368
  %_126.i = and i128 %6, 4503599627370494
  %_122.i = add nuw nsw i128 %_124.i, %_126.i
  %32 = add nuw nsw i128 %_122.i, %_123.i
  %33 = trunc i128 %32 to i64
  %r3.i = and i64 %33, 4503599627370495
  %34 = lshr i128 %32, 52
  %_133.i = and i128 %10, 281474976710655
  %35 = add nuw nsw i128 %34, %_133.i
  %r4.i = trunc nuw nsw i128 %35 to i64
  store i64 %r0.i, ptr %_0, align 8, !alias.scope !3, !noalias !10
  %_136.sroa.4.0._0.sroa_idx.i = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %r1.i, ptr %_136.sroa.4.0._0.sroa_idx.i, align 8, !alias.scope !3, !noalias !10
  %_136.sroa.5.0._0.sroa_idx.i = getelementptr inbounds i8, ptr %_0, i64 16
  store i64 %r2.i, ptr %_136.sroa.5.0._0.sroa_idx.i, align 8, !alias.scope !3, !noalias !10
  %_136.sroa.6.0._0.sroa_idx.i = getelementptr inbounds i8, ptr %_0, i64 24
  store i64 %r3.i, ptr %_136.sroa.6.0._0.sroa_idx.i, align 8, !alias.scope !3, !noalias !10
  %_136.sroa.7.0._0.sroa_idx.i = getelementptr inbounds i8, ptr %_0, i64 32
  store i64 %r4.i, ptr %_136.sroa.7.0._0.sroa_idx.i, align 8, !alias.scope !3, !noalias !10
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.83.0 (90b35a623 2024-11-26)"}
!3 = !{!4}
!4 = distinct !{!4, !5, !"_ZN24rust_ec_secp256k1_square16FieldElement5x529mul_inner17h40707617c14e43afE: %_0"}
!5 = distinct !{!5, !"_ZN24rust_ec_secp256k1_square16FieldElement5x529mul_inner17h40707617c14e43afE"}
!6 = !{!7}
!7 = distinct !{!7, !5, !"_ZN24rust_ec_secp256k1_square16FieldElement5x529mul_inner17h40707617c14e43afE: %self"}
!8 = !{!9}
!9 = distinct !{!9, !5, !"_ZN24rust_ec_secp256k1_square16FieldElement5x529mul_inner17h40707617c14e43afE: %rhs"}
!10 = !{!7, !9}
!11 = !{}
