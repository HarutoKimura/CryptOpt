; ModuleID = '<stdin>'
source_filename = "openssl_poly1305_mul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @poly1305_mul(ptr nocapture noundef %0, ptr nocapture noundef %1, ptr nocapture noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5) local_unnamed_addr #0 {
  %7 = load i64, ptr %0, align 8, !tbaa !5
  %8 = zext i64 %7 to i128
  %9 = zext i64 %3 to i128
  %10 = mul nuw i128 %8, %9
  %11 = load i64, ptr %1, align 8, !tbaa !5
  %12 = zext i64 %11 to i128
  %13 = zext i64 %5 to i128
  %14 = mul nuw i128 %12, %13
  %15 = add i128 %14, %10
  %16 = zext i64 %4 to i128
  %17 = mul nuw i128 %8, %16
  %18 = mul nuw i128 %12, %9
  %19 = add i128 %18, %17
  %20 = load i64, ptr %2, align 8, !tbaa !5
  %21 = mul i64 %20, %5
  %22 = zext i64 %21 to i128
  %23 = add i128 %19, %22
  %24 = mul i64 %20, %3
  store i64 %24, ptr %2, align 8, !tbaa !5
  %25 = trunc i128 %15 to i64
  store i64 %25, ptr %0, align 8, !tbaa !5
  %26 = lshr i128 %15, 64
  %27 = add i128 %23, %26
  %28 = trunc i128 %27 to i64
  store i64 %28, ptr %1, align 8, !tbaa !5
  %29 = lshr i128 %27, 64
  %30 = trunc nuw i128 %29 to i64
  %31 = load i64, ptr %2, align 8, !tbaa !5
  %32 = add i64 %31, %30
  %33 = lshr i64 %32, 2
  %34 = and i64 %32, -4
  %35 = add i64 %33, %34
  %36 = and i64 %32, 3
  store i64 %36, ptr %2, align 8, !tbaa !5
  %37 = load i64, ptr %0, align 8, !tbaa !5
  %38 = add i64 %35, %37
  store i64 %38, ptr %0, align 8, !tbaa !5
  %39 = icmp ult i64 %38, %35
  %40 = zext i1 %39 to i64
  %41 = load i64, ptr %1, align 8, !tbaa !5
  %42 = add i64 %41, %40
  store i64 %42, ptr %1, align 8, !tbaa !5
  %43 = icmp ult i64 %42, %40
  %44 = zext i1 %43 to i64
  %45 = load i64, ptr %2, align 8, !tbaa !5
  %46 = add i64 %45, %44
  store i64 %46, ptr %2, align 8, !tbaa !5
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
