; ModuleID = 'mul_r_mod_p.6278589cad896e82-cgu.0'
source_filename = "mul_r_mod_p.6278589cad896e82-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @mul_r_mod_p(ptr noalias nocapture noundef align 4 dereferenceable(40) %self) unnamed_addr #0 {
start:
  %0 = getelementptr inbounds i8, ptr %self, i64 20
  %_5 = load i32, ptr %0, align 4, !noundef !3
  %_4 = zext i32 %_5 to i64
  %_7 = load i32, ptr %self, align 4, !noundef !3
  %_6 = zext i32 %_7 to i64
  %_3 = mul nuw i64 %_6, %_4
  %1 = getelementptr inbounds i8, ptr %self, i64 4
  %_12 = load i32, ptr %1, align 4, !noundef !3
  %_11 = zext i32 %_12 to i64
  %_8 = mul nuw i64 %_11, %_4
  %2 = getelementptr inbounds i8, ptr %self, i64 8
  %_17 = load i32, ptr %2, align 4, !noundef !3
  %_16 = zext i32 %_17 to i64
  %_13 = mul nuw i64 %_16, %_4
  %3 = getelementptr inbounds i8, ptr %self, i64 12
  %_22 = load i32, ptr %3, align 4, !noundef !3
  %_21 = zext i32 %_22 to i64
  %_18 = mul nuw i64 %_21, %_4
  %4 = getelementptr inbounds i8, ptr %self, i64 16
  %_27 = load i32, ptr %4, align 4, !noundef !3
  %_26 = zext i32 %_27 to i64
  %_23 = mul nuw i64 %_26, %_4
  %5 = getelementptr inbounds i8, ptr %self, i64 24
  %_31 = load i32, ptr %5, align 4, !noundef !3
  %_30 = mul i32 %_31, 5
  %_29 = zext i32 %_30 to i64
  %_28 = mul nuw i64 %_29, %_26
  %6 = add i64 %_28, %_3
  %_35 = zext i32 %_31 to i64
  %_34 = mul nuw i64 %_35, %_6
  %7 = add i64 %_34, %_8
  %_39 = mul nuw i64 %_35, %_11
  %8 = add i64 %_39, %_13
  %_44 = mul nuw i64 %_35, %_16
  %9 = add i64 %_44, %_18
  %_49 = mul nuw i64 %_35, %_21
  %10 = add i64 %_49, %_23
  %11 = getelementptr inbounds i8, ptr %self, i64 28
  %_57 = load i32, ptr %11, align 4, !noundef !3
  %_56 = mul i32 %_57, 5
  %_55 = zext i32 %_56 to i64
  %_54 = mul nuw i64 %_55, %_21
  %12 = add i64 %6, %_54
  %_60 = mul nuw i64 %_55, %_26
  %13 = add i64 %7, %_60
  %_67 = zext i32 %_57 to i64
  %_66 = mul nuw i64 %_67, %_6
  %14 = add i64 %8, %_66
  %_71 = mul nuw i64 %_67, %_11
  %15 = add i64 %9, %_71
  %_76 = mul nuw i64 %_67, %_16
  %16 = add i64 %10, %_76
  %17 = getelementptr inbounds i8, ptr %self, i64 32
  %_84 = load i32, ptr %17, align 4, !noundef !3
  %_83 = mul i32 %_84, 5
  %_82 = zext i32 %_83 to i64
  %_81 = mul nuw i64 %_82, %_16
  %18 = add i64 %12, %_81
  %_87 = mul nuw i64 %_82, %_21
  %19 = add i64 %13, %_87
  %_93 = mul nuw i64 %_82, %_26
  %20 = add i64 %14, %_93
  %_100 = zext i32 %_84 to i64
  %_99 = mul nuw i64 %_100, %_6
  %21 = add i64 %15, %_99
  %_104 = mul nuw i64 %_100, %_11
  %22 = add i64 %16, %_104
  %23 = getelementptr inbounds i8, ptr %self, i64 36
  %_112 = load i32, ptr %23, align 4, !noundef !3
  %_111 = mul i32 %_112, 5
  %_110 = zext i32 %_111 to i64
  %_109 = mul nuw i64 %_110, %_11
  %24 = add i64 %18, %_109
  %_115 = mul nuw i64 %_110, %_16
  %25 = add i64 %19, %_115
  %_121 = mul nuw i64 %_110, %_21
  %26 = add i64 %20, %_121
  %_127 = mul nuw i64 %_110, %_26
  %27 = add i64 %21, %_127
  %_134 = zext i32 %_112 to i64
  %_133 = mul nuw i64 %_134, %_6
  %28 = add i64 %22, %_133
  %_138 = lshr i64 %24, 26
  %29 = add i64 %25, %_138
  %_140 = lshr i64 %29, 26
  %30 = add i64 %26, %_140
  %_142 = lshr i64 %30, 26
  %31 = add i64 %27, %_142
  %_144 = lshr i64 %31, 26
  %32 = add i64 %28, %_144
  %_146 = trunc i64 %24 to i32
  %33 = and i32 %_146, 67108863
  store i32 %33, ptr %self, align 4
  %_148 = trunc i64 %29 to i32
  %34 = and i32 %_148, 67108863
  store i32 %34, ptr %1, align 4
  %_150 = trunc i64 %30 to i32
  %35 = and i32 %_150, 67108863
  store i32 %35, ptr %2, align 4
  %_152 = trunc i64 %31 to i32
  %36 = and i32 %_152, 67108863
  store i32 %36, ptr %3, align 4
  %_154 = trunc i64 %32 to i32
  %37 = and i32 %_154, 67108863
  store i32 %37, ptr %4, align 4
  %_158 = lshr i64 %32, 26
  %_157 = trunc i64 %_158 to i32
  %_156 = mul i32 %_157, 5
  %38 = add i32 %_156, %33
  store i32 %38, ptr %self, align 4
  %_160 = lshr i32 %38, 26
  %39 = add nuw nsw i32 %_160, %34
  store i32 %39, ptr %1, align 4
  %40 = and i32 %38, 67108863
  store i32 %40, ptr %self, align 4
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.83.0 (90b35a623 2024-11-26)"}
!3 = !{}
