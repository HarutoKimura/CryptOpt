; ModuleID = '<stdin>'
source_filename = "open_ssl_curve25519_fe51_square.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @open_ssl_curve25519_fe51_square(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = load i64, ptr %1, align 8, !tbaa !5
  %4 = getelementptr inbounds i8, ptr %1, i64 8
  %5 = load i64, ptr %4, align 8, !tbaa !5
  %6 = getelementptr inbounds i8, ptr %1, i64 16
  %7 = load i64, ptr %6, align 8, !tbaa !5
  %8 = getelementptr inbounds i8, ptr %1, i64 24
  %9 = load i64, ptr %8, align 8, !tbaa !5
  %10 = getelementptr inbounds i8, ptr %1, i64 32
  %11 = load i64, ptr %10, align 8, !tbaa !5
  %12 = zext i64 %3 to i128
  %13 = mul nuw nsw i128 %12, %12
  %14 = shl i64 %3, 1
  %15 = zext i64 %14 to i128
  %16 = zext i64 %5 to i128
  %17 = mul nuw nsw i128 %15, %16
  %18 = zext i64 %7 to i128
  %19 = mul nuw nsw i128 %18, %15
  %20 = zext i64 %9 to i128
  %21 = mul nuw nsw i128 %20, %15
  %22 = zext i64 %11 to i128
  %23 = mul nuw nsw i128 %22, %15
  %24 = mul i64 %11, 19
  %25 = zext i64 %24 to i128
  %26 = mul nuw nsw i128 %25, %22
  %27 = mul nuw nsw i128 %16, %16
  %28 = add nuw nsw i128 %19, %27
  %29 = shl i64 %5, 1
  %30 = zext i64 %29 to i128
  %31 = mul nuw nsw i128 %30, %18
  %32 = mul nuw nsw i128 %20, %30
  %33 = mul nuw nsw i128 %25, %30
  %34 = mul i64 %9, 19
  %35 = zext i64 %34 to i128
  %36 = mul nuw nsw i128 %35, %20
  %37 = add nuw nsw i128 %36, %17
  %38 = shl i64 %9, 1
  %39 = zext i64 %38 to i128
  %40 = mul nuw nsw i128 %25, %39
  %41 = add nuw nsw i128 %28, %40
  %42 = mul nuw nsw i128 %18, %18
  %43 = shl i64 %7, 1
  %44 = zext i64 %43 to i128
  %45 = mul nuw nsw i128 %35, %44
  %46 = add nuw nsw i128 %45, %13
  %47 = add nuw nsw i128 %46, %33
  %48 = mul nuw nsw i128 %25, %44
  %49 = add nuw nsw i128 %37, %48
  %50 = lshr i128 %41, 51
  %51 = and i128 %50, 18446744073709551615
  %52 = add nuw nsw i128 %21, %31
  %53 = add nuw nsw i128 %52, %26
  %54 = add nuw nsw i128 %53, %51
  %55 = trunc i128 %41 to i64
  %56 = and i64 %55, 2251799813685247
  %57 = lshr i128 %47, 51
  %58 = and i128 %57, 18446744073709551615
  %59 = add nuw nsw i128 %49, %58
  %60 = trunc i128 %47 to i64
  %61 = and i64 %60, 2251799813685247
  %62 = lshr i128 %54, 51
  %63 = and i128 %62, 18446744073709551615
  %64 = add nuw nsw i128 %32, %42
  %65 = add nuw nsw i128 %64, %23
  %66 = add nuw nsw i128 %65, %63
  %67 = trunc i128 %54 to i64
  %68 = and i64 %67, 2251799813685247
  %69 = lshr i128 %59, 51
  %70 = trunc i128 %69 to i64
  %71 = add i64 %56, %70
  %72 = trunc i128 %59 to i64
  %73 = and i64 %72, 2251799813685247
  %74 = lshr i128 %66, 51
  %75 = trunc i128 %74 to i64
  %76 = mul i64 %75, 19
  %77 = add i64 %76, %61
  %78 = trunc i128 %66 to i64
  %79 = and i64 %78, 2251799813685247
  %80 = lshr i64 %71, 51
  %81 = add nuw nsw i64 %80, %68
  %82 = and i64 %71, 2251799813685247
  %83 = lshr i64 %77, 51
  %84 = add nuw nsw i64 %83, %73
  %85 = and i64 %77, 2251799813685247
  store i64 %85, ptr %0, align 8, !tbaa !5
  %86 = getelementptr inbounds i8, ptr %0, i64 8
  store i64 %84, ptr %86, align 8, !tbaa !5
  %87 = getelementptr inbounds i8, ptr %0, i64 16
  store i64 %82, ptr %87, align 8, !tbaa !5
  %88 = getelementptr inbounds i8, ptr %0, i64 24
  store i64 %81, ptr %88, align 8, !tbaa !5
  %89 = getelementptr inbounds i8, ptr %0, i64 32
  store i64 %79, ptr %89, align 8, !tbaa !5
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
