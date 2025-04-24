; ModuleID = 'pow2k.4c4ecdcd6bd405c3-cgu.0'
source_filename = "pow2k.4c4ecdcd6bd405c3-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) uwtable
define void @square(ptr dead_on_unwind noalias nocapture noundef writable writeonly sret([40 x i8]) align 8 dereferenceable(40) %_0, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %self) unnamed_addr #0 {
start:
  tail call void @llvm.experimental.noalias.scope.decl(metadata !3)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !6)
  %a.sroa.37.0.self.sroa_idx.i = getelementptr inbounds i8, ptr %self, i64 32
  %a.sroa.37.0.copyload.i = load i64, ptr %a.sroa.37.0.self.sroa_idx.i, align 8, !alias.scope !6, !noalias !3
  %a.sroa.32.0.self.sroa_idx.i = getelementptr inbounds i8, ptr %self, i64 24
  %a.sroa.32.0.copyload.i = load i64, ptr %a.sroa.32.0.self.sroa_idx.i, align 8, !alias.scope !6, !noalias !3
  %a.sroa.25.0.self.sroa_idx.i = getelementptr inbounds i8, ptr %self, i64 16
  %a.sroa.25.0.copyload.i = load i64, ptr %a.sroa.25.0.self.sroa_idx.i, align 8, !alias.scope !6, !noalias !3
  %a.sroa.16.0.self.sroa_idx.i = getelementptr inbounds i8, ptr %self, i64 8
  %a.sroa.16.0.copyload.i = load i64, ptr %a.sroa.16.0.self.sroa_idx.i, align 8, !alias.scope !6, !noalias !3
  %a.sroa.0.0.copyload.i = load i64, ptr %self, align 8, !alias.scope !6, !noalias !3
  %a3_19.i = mul i64 %a.sroa.32.0.copyload.i, 19
  %a4_19.i = mul i64 %a.sroa.37.0.copyload.i, 19
  %_3.i58.i = zext i64 %a.sroa.0.0.copyload.i to i128
  %_0.i60.i = mul nuw i128 %_3.i58.i, %_3.i58.i
  %_3.i55.i = zext i64 %a.sroa.16.0.copyload.i to i128
  %_4.i56.i = zext i64 %a4_19.i to i128
  %_0.i57.i = mul nuw i128 %_3.i55.i, %_4.i56.i
  %_3.i52.i = zext i64 %a.sroa.25.0.copyload.i to i128
  %_4.i53.i = zext i64 %a3_19.i to i128
  %_0.i54.i = mul nuw i128 %_3.i52.i, %_4.i53.i
  %_3.i49.i = zext i64 %a.sroa.32.0.copyload.i to i128
  %_0.i51.i = mul nuw i128 %_4.i53.i, %_3.i49.i
  %_0.i48.i = mul nuw i128 %_3.i58.i, %_3.i55.i
  %_0.i45.i = mul nuw i128 %_3.i52.i, %_4.i56.i
  %_0.i42.i = mul nuw i128 %_3.i55.i, %_3.i55.i
  %_0.i39.i = mul nuw i128 %_3.i58.i, %_3.i52.i
  %_3.i34.i = zext i64 %a.sroa.37.0.copyload.i to i128
  %_0.i36.i = mul nuw i128 %_4.i53.i, %_3.i34.i
  %_0.i33.i = mul nuw i128 %_4.i56.i, %_3.i34.i
  %_0.i30.i = mul nuw i128 %_3.i58.i, %_3.i49.i
  %_0.i27.i = mul nuw i128 %_3.i55.i, %_3.i52.i
  %_0.i24.i = mul nuw i128 %_3.i52.i, %_3.i52.i
  %_0.i21.i = mul nuw i128 %_3.i58.i, %_3.i34.i
  %_0.i.i = mul nuw i128 %_3.i55.i, %_3.i49.i
  %_13.i = add i128 %_0.i57.i, %_0.i54.i
  %_12.i = shl i128 %_13.i, 1
  %c0.i = add i128 %_12.i, %_0.i60.i
  %_65.i = trunc i128 %c0.i to i64
  %0 = and i64 %_65.i, 2251799813685247
  %_55.i = add i128 %_0.i21.i, %_0.i.i
  %_54.i = shl i128 %_55.i, 1
  %1 = add i128 %_54.i, %_0.i24.i
  %_43.i = add i128 %_0.i30.i, %_0.i27.i
  %_42.i = shl i128 %_43.i, 1
  %2 = add i128 %_42.i, %_0.i33.i
  %_33.i = add i128 %_0.i39.i, %_0.i36.i
  %_32.i = shl i128 %_33.i, 1
  %3 = add i128 %_32.i, %_0.i42.i
  %_22.i = add i128 %_0.i48.i, %_0.i45.i
  %_21.i = shl i128 %_22.i, 1
  %4 = add i128 %_21.i, %_0.i51.i
  %_64.i = lshr i128 %c0.i, 51
  %_62.i = and i128 %_64.i, 18446744073709551615
  %5 = add i128 %4, %_62.i
  %_68.i = lshr i128 %5, 51
  %_66.i = and i128 %_68.i, 18446744073709551615
  %6 = add i128 %3, %_66.i
  %_74.i = lshr i128 %6, 51
  %_72.i = and i128 %_74.i, 18446744073709551615
  %7 = add i128 %2, %_72.i
  %_80.i = lshr i128 %7, 51
  %_78.i = and i128 %_80.i, 18446744073709551615
  %8 = add i128 %1, %_78.i
  %_85.i = lshr i128 %8, 51
  %carry.i = trunc i128 %_85.i to i64
  %_89.i = mul i64 %carry.i, 19
  %9 = add i64 %_89.i, %0
  %10 = and i64 %9, 2251799813685247
  %_70.i = trunc i128 %5 to i64
  %11 = and i64 %_70.i, 2251799813685247
  %_90.i = lshr i64 %9, 51
  %12 = add nuw nsw i64 %_90.i, %11
  %_87.i = trunc i128 %8 to i64
  %13 = and i64 %_87.i, 2251799813685247
  %_82.i = trunc i128 %7 to i64
  %14 = and i64 %_82.i, 2251799813685247
  %_76.i = trunc i128 %6 to i64
  %15 = and i64 %_76.i, 2251799813685247
  store i64 %10, ptr %_0, align 8, !alias.scope !3, !noalias !6
  %_93.sroa.4.0._0.sroa_idx.i = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %12, ptr %_93.sroa.4.0._0.sroa_idx.i, align 8, !alias.scope !3, !noalias !6
  %_93.sroa.5.0._0.sroa_idx.i = getelementptr inbounds i8, ptr %_0, i64 16
  store i64 %15, ptr %_93.sroa.5.0._0.sroa_idx.i, align 8, !alias.scope !3, !noalias !6
  %_93.sroa.6.0._0.sroa_idx.i = getelementptr inbounds i8, ptr %_0, i64 24
  store i64 %14, ptr %_93.sroa.6.0._0.sroa_idx.i, align 8, !alias.scope !3, !noalias !6
  %_93.sroa.7.0._0.sroa_idx.i = getelementptr inbounds i8, ptr %_0, i64 32
  store i64 %13, ptr %_93.sroa.7.0._0.sroa_idx.i, align 8, !alias.scope !3, !noalias !6
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
!4 = distinct !{!4, !5, !"_ZN5pow2k14FieldElement515pow2k17h644330a310324d38E: %_0"}
!5 = distinct !{!5, !"_ZN5pow2k14FieldElement515pow2k17h644330a310324d38E"}
!6 = !{!7}
!7 = distinct !{!7, !5, !"_ZN5pow2k14FieldElement515pow2k17h644330a310324d38E: %self"}
