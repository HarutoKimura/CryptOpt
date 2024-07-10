; ModuleID = 'field_sqr.89c85882a1683492-cgu.0'
source_filename = "field_sqr.89c85882a1683492-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"
; field_sqr::secp256k1_fe_sqr_inner
; Function Attrs: mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @secp256k1_fe_sqr_inner(ptr noalias nocapture noundef writeonly align 8 dereferenceable(40) %r, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %a) unnamed_addr #0 {
start:
  %0 = load i64, ptr %a, align 8, !noundef !3
  %1 = getelementptr inbounds [5 x i64], ptr %a, i64 0, i64 1
  %a1 = load i64, ptr %1, align 8, !noundef !3
  %2 = getelementptr inbounds [5 x i64], ptr %a, i64 0, i64 2
  %a2 = load i64, ptr %2, align 8, !noundef !3
  %3 = getelementptr inbounds [5 x i64], ptr %a, i64 0, i64 3
  %a3 = load i64, ptr %3, align 8, !noundef !3
  %4 = getelementptr inbounds [5 x i64], ptr %a, i64 0, i64 4
  %5 = load i64, ptr %4, align 8, !noundef !3
  %_16 = zext i64 %0 to i128
  %_15 = shl nuw nsw i128 %_16, 1
  %_18 = zext i64 %a3 to i128
  %_14 = mul i128 %_15, %_18
  %_21 = zext i64 %a1 to i128
  %_20 = shl nuw nsw i128 %_21, 1
  %_22 = zext i64 %a2 to i128
  %_19 = mul i128 %_20, %_22
  %6 = add i128 %_14, %_19
  %_23 = zext i64 %5 to i128
  %7 = mul nuw i128 %_23, %_23
  %_28 = and i128 %7, 18446744073709551613
  %_27 = mul nuw nsw i128 %_28, 68719492368
  %8 = add i128 %6, %_27
  %9 = lshr i128 %7, 64
  %10 = lshr i128 %8, 52
  %11 = shl i64 %5, 1
  %_38 = zext i64 %11 to i128
  %_35 = mul nuw i128 %_38, %_16
  %_40 = mul i128 %_20, %_18
  %_44 = mul nuw i128 %_22, %_22
  %_47 = mul nuw nsw i128 %9, 281475040739328
  %_34 = add i128 %_40, %_44
  %_33 = add i128 %_34, %_35
  %12 = add i128 %_33, %_47
  %13 = add i128 %12, %10
  %14 = trunc i128 %13 to i64
  %15 = lshr i128 %13, 52
  %tx = lshr i64 %14, 48
  %16 = mul nuw i128 %_16, %_16
  %_59 = mul nuw i128 %_38, %_21
  %_64 = shl nuw nsw i128 %_22, 1
  %_63 = mul i128 %_64, %_18
  %_58 = add i128 %_59, %_63
  %17 = add i128 %_58, %15
  %18 = trunc i128 %17 to i64
  %19 = lshr i128 %17, 52
  %_69 = shl i64 %18, 4
  %20 = or i64 %_69, %tx
  %_72 = zext i64 %20 to i128
  %_71 = mul nuw nsw i128 %_72, 4294968273
  %21 = add i128 %_71, %16
  %22 = trunc i128 %21 to i64
  store i64 %22, ptr %r, align 8
  %23 = lshr i128 %21, 52
  %24 = shl i64 %0, 1
  %_77 = zext i64 %24 to i128
  %_76 = mul nuw i128 %_77, %_21
  %_81 = mul nuw i128 %_38, %_22
  %_85 = mul nuw i128 %_18, %_18
  %_80 = add i128 %_81, %_85
  %25 = add i128 %_80, %19
  %_89 = and i128 %25, 18446744073709551615
  %_88 = mul nuw nsw i128 %_89, 68719492368
  %26 = add i128 %_88, %_76
  %27 = add i128 %26, %23
  %28 = lshr i128 %25, 52
  %29 = getelementptr inbounds [5 x i64], ptr %r, i64 0, i64 1
  %30 = trunc i128 %27 to i64
  store i64 %30, ptr %29, align 8
  %31 = lshr i128 %27, 52
  %_96 = mul nuw i128 %_22, %_77
  %_100 = mul nuw i128 %_21, %_21
  %_95 = add i128 %_96, %_100
  %_103 = mul nuw i128 %_38, %_18
  %32 = add i128 %28, %_103
  %_108 = and i128 %32, 18446744073709551615
  %_107 = mul nuw nsw i128 %_108, 68719492368
  %33 = add i128 %_95, %_107
  %34 = add i128 %33, %31
  %35 = lshr i128 %32, 64
  %36 = getelementptr inbounds [5 x i64], ptr %r, i64 0, i64 2
  %37 = trunc i128 %34 to i64
  store i64 %37, ptr %36, align 8
  %38 = lshr i128 %34, 52
  %_114 = mul nuw nsw i128 %35, 281475040739328
  %_118 = and i128 %8, 18446744073709551614
  %_113 = add nuw nsw i128 %_114, %_118
  %39 = add nuw nsw i128 %_113, %38
  %40 = getelementptr inbounds [5 x i64], ptr %r, i64 0, i64 3
  %41 = trunc i128 %39 to i64
  store i64 %41, ptr %40, align 8
  %42 = lshr i128 %39, 52
  %_121 = and i128 %13, 1152921504606846975
  %43 = add nuw nsw i128 %42, %_121
  %44 = getelementptr inbounds [5 x i64], ptr %r, i64 0, i64 4
  %45 = trunc i128 %43 to i64
  store i64 %45, ptr %44, align 8
  ret void
}
!3 = !{}
