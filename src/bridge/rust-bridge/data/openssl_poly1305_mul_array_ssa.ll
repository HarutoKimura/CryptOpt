; ModuleID = '<stdin>'
source_filename = "/home/harutok/CryptOpt/src/bridge/rust-bridge/data/openssl-poly1305_mul_array.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @poly1305_mul_array(ptr nocapture noundef %0, ptr nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = load i64, ptr %0, align 8, !tbaa !5
  %5 = zext i64 %4 to i128
  %6 = load i64, ptr %1, align 8, !tbaa !5
  %7 = zext i64 %6 to i128
  %8 = mul nuw i128 %7, %5
  %9 = getelementptr inbounds i8, ptr %0, i64 8
  %10 = load i64, ptr %9, align 8, !tbaa !5
  %11 = zext i64 %10 to i128
  %12 = zext i64 %2 to i128
  %13 = mul nuw i128 %11, %12
  %14 = add i128 %13, %8
  %15 = getelementptr inbounds i8, ptr %1, i64 8
  %16 = load i64, ptr %15, align 8, !tbaa !5
  %17 = zext i64 %16 to i128
  %18 = mul nuw i128 %17, %5
  %19 = mul nuw i128 %11, %7
  %20 = add i128 %18, %19
  %21 = getelementptr inbounds i8, ptr %0, i64 16
  %22 = load i64, ptr %21, align 8, !tbaa !5
  %23 = mul i64 %22, %2
  %24 = zext i64 %23 to i128
  %25 = add i128 %20, %24
  %26 = mul i64 %22, %6
  store i64 %26, ptr %21, align 8, !tbaa !5
  %27 = trunc i128 %14 to i64
  store i64 %27, ptr %0, align 8, !tbaa !5
  %28 = lshr i128 %14, 64
  %29 = add i128 %25, %28
  %30 = trunc i128 %29 to i64
  store i64 %30, ptr %9, align 8, !tbaa !5
  %31 = lshr i128 %29, 64
  %32 = trunc nuw i128 %31 to i64
  %33 = add i64 %26, %32
  %34 = lshr i64 %33, 2
  %35 = and i64 %33, -4
  %36 = add i64 %34, %35
  %37 = and i64 %33, 3
  store i64 %37, ptr %21, align 8, !tbaa !5
  %38 = add i64 %36, %27
  store i64 %38, ptr %0, align 8, !tbaa !5
  %39 = icmp ult i64 %38, %36
  %40 = zext i1 %39 to i64
  %41 = add i64 %40, %30
  store i64 %41, ptr %9, align 8, !tbaa !5
  %42 = icmp ult i64 %41, %40
  %43 = zext i1 %42 to i64
  %44 = add nuw nsw i64 %37, %43
  store i64 %44, ptr %21, align 8, !tbaa !5
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
