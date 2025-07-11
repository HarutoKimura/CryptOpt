; ModuleID = '<stdin>'
source_filename = "open_ssl_curve25519_fe51_mul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @open_ssl_curve25519_fe51_mul(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1, ptr nocapture noundef readonly %2) unnamed_addr #0 {
  %4 = load i64, ptr %1, align 8, !tbaa !5
  %5 = zext i64 %4 to i128
  %6 = load i64, ptr %2, align 8, !tbaa !5
  %7 = zext i64 %6 to i128
  %8 = mul nuw nsw i128 %7, %5
  %9 = getelementptr inbounds i8, ptr %2, i64 8
  %10 = load i64, ptr %9, align 8, !tbaa !5
  %11 = zext i64 %10 to i128
  %12 = mul nuw nsw i128 %11, %5
  %13 = getelementptr inbounds i8, ptr %2, i64 16
  %14 = load i64, ptr %13, align 8, !tbaa !5
  %15 = zext i64 %14 to i128
  %16 = mul nuw nsw i128 %15, %5
  %17 = getelementptr inbounds i8, ptr %2, i64 24
  %18 = load i64, ptr %17, align 8, !tbaa !5
  %19 = zext i64 %18 to i128
  %20 = mul nuw nsw i128 %19, %5
  %21 = getelementptr inbounds i8, ptr %2, i64 32
  %22 = load i64, ptr %21, align 8, !tbaa !5
  %23 = zext i64 %22 to i128
  %24 = mul nuw nsw i128 %23, %5
  %25 = getelementptr inbounds i8, ptr %1, i64 8
  %26 = load i64, ptr %25, align 8, !tbaa !5
  %27 = zext i64 %26 to i128
  %28 = mul i64 %22, 19
  %29 = zext i64 %28 to i128
  %30 = mul nuw nsw i128 %27, %29
  %31 = add nuw nsw i128 %30, %8
  %32 = mul nuw nsw i128 %27, %7
  %33 = add nuw nsw i128 %32, %12
  %34 = mul nuw nsw i128 %27, %11
  %35 = add nuw nsw i128 %34, %16
  %36 = mul nuw nsw i128 %27, %15
  %37 = add nuw nsw i128 %36, %20
  %38 = mul nuw nsw i128 %27, %19
  %39 = add nuw nsw i128 %38, %24
  %40 = getelementptr inbounds i8, ptr %1, i64 16
  %41 = load i64, ptr %40, align 8, !tbaa !5
  %42 = zext i64 %41 to i128
  %43 = mul i64 %18, 19
  %44 = zext i64 %43 to i128
  %45 = mul nuw nsw i128 %42, %44
  %46 = add nuw nsw i128 %31, %45
  %47 = mul nuw nsw i128 %42, %29
  %48 = add nuw nsw i128 %33, %47
  %49 = mul nuw nsw i128 %42, %7
  %50 = add nuw nsw i128 %35, %49
  %51 = mul nuw nsw i128 %42, %11
  %52 = add nuw nsw i128 %37, %51
  %53 = mul nuw nsw i128 %42, %15
  %54 = add nuw nsw i128 %39, %53
  %55 = getelementptr inbounds i8, ptr %1, i64 24
  %56 = load i64, ptr %55, align 8, !tbaa !5
  %57 = zext i64 %56 to i128
  %58 = mul i64 %14, 19
  %59 = zext i64 %58 to i128
  %60 = mul nuw nsw i128 %57, %59
  %61 = add nuw nsw i128 %46, %60
  %62 = mul nuw nsw i128 %57, %44
  %63 = add nuw nsw i128 %48, %62
  %64 = mul nuw nsw i128 %57, %29
  %65 = add nuw nsw i128 %50, %64
  %66 = mul nuw nsw i128 %57, %7
  %67 = add nuw nsw i128 %52, %66
  %68 = mul nuw nsw i128 %57, %11
  %69 = add nuw nsw i128 %54, %68
  %70 = getelementptr inbounds i8, ptr %1, i64 32
  %71 = load i64, ptr %70, align 8, !tbaa !5
  %72 = zext i64 %71 to i128
  %73 = mul i64 %10, 19
  %74 = zext i64 %73 to i128
  %75 = mul nuw nsw i128 %72, %74
  %76 = add nuw nsw i128 %61, %75
  %77 = mul nuw nsw i128 %72, %59
  %78 = add nuw nsw i128 %63, %77
  %79 = mul nuw nsw i128 %72, %44
  %80 = add nuw nsw i128 %65, %79
  %81 = mul nuw nsw i128 %72, %29
  %82 = add nuw nsw i128 %67, %81
  %83 = mul nuw nsw i128 %72, %7
  %84 = add nuw nsw i128 %69, %83
  %85 = lshr i128 %80, 51
  %86 = and i128 %85, 18446744073709551615
  %87 = add nuw nsw i128 %82, %86
  %88 = trunc i128 %80 to i64
  %89 = and i64 %88, 2251799813685247
  %90 = lshr i128 %76, 51
  %91 = and i128 %90, 18446744073709551615
  %92 = add nuw nsw i128 %78, %91
  %93 = trunc i128 %76 to i64
  %94 = and i64 %93, 2251799813685247
  %95 = lshr i128 %87, 51
  %96 = and i128 %95, 18446744073709551615
  %97 = add nuw nsw i128 %84, %96
  %98 = trunc i128 %87 to i64
  %99 = and i64 %98, 2251799813685247
  %100 = lshr i128 %92, 51
  %101 = trunc i128 %100 to i64
  %102 = add i64 %89, %101
  %103 = trunc i128 %92 to i64
  %104 = and i64 %103, 2251799813685247
  %105 = lshr i128 %97, 51
  %106 = trunc i128 %105 to i64
  %107 = mul i64 %106, 19
  %108 = add i64 %107, %94
  %109 = trunc i128 %97 to i64
  %110 = and i64 %109, 2251799813685247
  %111 = lshr i64 %102, 51
  %112 = add nuw nsw i64 %111, %99
  %113 = and i64 %102, 2251799813685247
  %114 = lshr i64 %108, 51
  %115 = add nuw nsw i64 %114, %104
  %116 = and i64 %108, 2251799813685247
  store i64 %116, ptr %0, align 8, !tbaa !5
  %117 = getelementptr inbounds i8, ptr %0, i64 8
  store i64 %115, ptr %117, align 8, !tbaa !5
  %118 = getelementptr inbounds i8, ptr %0, i64 16
  store i64 %113, ptr %118, align 8, !tbaa !5
  %119 = getelementptr inbounds i8, ptr %0, i64 24
  store i64 %112, ptr %119, align 8, !tbaa !5
  %120 = getelementptr inbounds i8, ptr %0, i64 32
  store i64 %110, ptr %120, align 8, !tbaa !5
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
