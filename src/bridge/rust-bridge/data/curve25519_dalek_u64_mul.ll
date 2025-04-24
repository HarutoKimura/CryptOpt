; ModuleID = 'curve25519_dalek_u64.80576f01c95d88f1-cgu.0'
source_filename = "curve25519_dalek_u64.80576f01c95d88f1-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @mul(ptr dead_on_unwind noalias nocapture noundef writable writeonly sret([40 x i8]) align 8 dereferenceable(40) %_0, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %self, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %_rhs) unnamed_addr #0 {
start:
  %0 = getelementptr inbounds i8, ptr %_rhs, i64 8
  %_6 = load i64, ptr %0, align 8, !noundef !3
  %b1_19 = mul i64 %_6, 19
  %1 = getelementptr inbounds i8, ptr %_rhs, i64 16
  %_8 = load i64, ptr %1, align 8, !noundef !3
  %b2_19 = mul i64 %_8, 19
  %2 = getelementptr inbounds i8, ptr %_rhs, i64 24
  %_10 = load i64, ptr %2, align 8, !noundef !3
  %b3_19 = mul i64 %_10, 19
  %3 = getelementptr inbounds i8, ptr %_rhs, i64 32
  %_12 = load i64, ptr %3, align 8, !noundef !3
  %b4_19 = mul i64 %_12, 19
  %_18 = load i64, ptr %self, align 8, !noundef !3
  %_19 = load i64, ptr %_rhs, align 8, !noundef !3
  %_3.i83 = zext i64 %_18 to i128
  %_4.i84 = zext i64 %_19 to i128
  %_0.i85 = mul nuw i128 %_4.i84, %_3.i83
  %4 = getelementptr inbounds i8, ptr %self, i64 32
  %_21 = load i64, ptr %4, align 8, !noundef !3
  %_3.i80 = zext i64 %_21 to i128
  %_4.i81 = zext i64 %b1_19 to i128
  %_0.i82 = mul nuw i128 %_3.i80, %_4.i81
  %_16 = add i128 %_0.i82, %_0.i85
  %5 = getelementptr inbounds i8, ptr %self, i64 24
  %_23 = load i64, ptr %5, align 8, !noundef !3
  %_3.i77 = zext i64 %_23 to i128
  %_4.i78 = zext i64 %b2_19 to i128
  %_0.i79 = mul nuw i128 %_3.i77, %_4.i78
  %_15 = add i128 %_16, %_0.i79
  %6 = getelementptr inbounds i8, ptr %self, i64 16
  %_25 = load i64, ptr %6, align 8, !noundef !3
  %_3.i74 = zext i64 %_25 to i128
  %_4.i75 = zext i64 %b3_19 to i128
  %_0.i76 = mul nuw i128 %_3.i74, %_4.i75
  %_14 = add i128 %_15, %_0.i76
  %7 = getelementptr inbounds i8, ptr %self, i64 8
  %_27 = load i64, ptr %7, align 8, !noundef !3
  %_3.i71 = zext i64 %_27 to i128
  %_4.i72 = zext i64 %b4_19 to i128
  %_0.i73 = mul nuw i128 %_3.i71, %_4.i72
  %c0 = add i128 %_14, %_0.i73
  %_0.i70 = mul nuw i128 %_3.i71, %_4.i84
  %_4.i66 = zext i64 %_6 to i128
  %_0.i67 = mul nuw i128 %_3.i83, %_4.i66
  %_0.i64 = mul nuw i128 %_3.i80, %_4.i78
  %_0.i61 = mul nuw i128 %_3.i77, %_4.i75
  %_0.i58 = mul nuw i128 %_3.i74, %_4.i72
  %_0.i55 = mul nuw i128 %_3.i74, %_4.i84
  %_0.i52 = mul nuw i128 %_3.i71, %_4.i66
  %_4.i48 = zext i64 %_8 to i128
  %_0.i49 = mul nuw i128 %_3.i83, %_4.i48
  %_0.i46 = mul nuw i128 %_3.i80, %_4.i75
  %_0.i43 = mul nuw i128 %_3.i77, %_4.i72
  %_0.i40 = mul nuw i128 %_3.i77, %_4.i84
  %_0.i37 = mul nuw i128 %_3.i74, %_4.i66
  %_0.i34 = mul nuw i128 %_3.i71, %_4.i48
  %_4.i30 = zext i64 %_10 to i128
  %_0.i31 = mul nuw i128 %_3.i83, %_4.i30
  %_0.i28 = mul nuw i128 %_3.i80, %_4.i72
  %_0.i25 = mul nuw i128 %_3.i80, %_4.i84
  %_0.i22 = mul nuw i128 %_3.i77, %_4.i66
  %_0.i19 = mul nuw i128 %_3.i74, %_4.i48
  %_0.i16 = mul nuw i128 %_3.i71, %_4.i30
  %_4.i = zext i64 %_12 to i128
  %_0.i = mul nuw i128 %_3.i83, %_4.i
  %_67 = lshr i128 %c0, 51
  %_65 = and i128 %_67, 18446744073709551615
  %_31 = add i128 %_0.i64, %_0.i67
  %_30 = add i128 %_31, %_0.i61
  %_29 = add i128 %_30, %_0.i58
  %8 = add i128 %_29, %_0.i70
  %9 = add i128 %8, %_65
  %_68 = trunc i128 %c0 to i64
  %10 = and i64 %_68, 2251799813685247
  %_71 = lshr i128 %9, 51
  %_69 = and i128 %_71, 18446744073709551615
  %_40 = add i128 %_0.i46, %_0.i49
  %_39 = add i128 %_40, %_0.i43
  %_38 = add i128 %_39, %_0.i55
  %11 = add i128 %_38, %_0.i52
  %12 = add i128 %11, %_69
  %_73 = trunc i128 %9 to i64
  %13 = and i64 %_73, 2251799813685247
  %_77 = lshr i128 %12, 51
  %_75 = and i128 %_77, 18446744073709551615
  %_49 = add i128 %_0.i28, %_0.i31
  %_48 = add i128 %_49, %_0.i40
  %_47 = add i128 %_48, %_0.i37
  %14 = add i128 %_47, %_0.i34
  %15 = add i128 %14, %_75
  %_79 = trunc i128 %12 to i64
  %16 = and i64 %_79, 2251799813685247
  %_83 = lshr i128 %15, 51
  %_81 = and i128 %_83, 18446744073709551615
  %_58 = add i128 %_0.i25, %_0.i
  %_57 = add i128 %_58, %_0.i22
  %_56 = add i128 %_57, %_0.i19
  %17 = add i128 %_56, %_0.i16
  %18 = add i128 %17, %_81
  %_85 = trunc i128 %15 to i64
  %19 = and i64 %_85, 2251799813685247
  %_88 = lshr i128 %18, 51
  %carry = trunc i128 %_88 to i64
  %_90 = trunc i128 %18 to i64
  %20 = and i64 %_90, 2251799813685247
  %_92 = mul i64 %carry, 19
  %21 = add i64 %_92, %10
  %_93 = lshr i64 %21, 51
  %22 = add nuw nsw i64 %_93, %13
  %23 = and i64 %21, 2251799813685247
  store i64 %23, ptr %_0, align 8
  %_95.sroa.4.0._0.sroa_idx = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 %22, ptr %_95.sroa.4.0._0.sroa_idx, align 8
  %_95.sroa.5.0._0.sroa_idx = getelementptr inbounds i8, ptr %_0, i64 16
  store i64 %16, ptr %_95.sroa.5.0._0.sroa_idx, align 8
  %_95.sroa.6.0._0.sroa_idx = getelementptr inbounds i8, ptr %_0, i64 24
  store i64 %19, ptr %_95.sroa.6.0._0.sroa_idx, align 8
  %_95.sroa.7.0._0.sroa_idx = getelementptr inbounds i8, ptr %_0, i64 32
  store i64 %20, ptr %_95.sroa.7.0._0.sroa_idx, align 8
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.83.0 (90b35a623 2024-11-26)"}
!3 = !{}
