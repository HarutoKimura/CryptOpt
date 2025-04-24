; ModuleID = '<stdin>'
source_filename = "c_fiat_curve25519_carry_mul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.compiler.used = appending global [1 x ptr] [ptr @c_fiat_25519_carry_mul], section "llvm.metadata"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @c_fiat_25519_carry_mul(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1, ptr nocapture noundef readonly %2) #0 {
  %4 = getelementptr inbounds i8, ptr %1, i64 32
  %5 = load i64, ptr %4, align 8, !tbaa !5
  %6 = zext i64 %5 to i128
  %7 = getelementptr inbounds i8, ptr %2, i64 32
  %8 = load i64, ptr %7, align 8, !tbaa !5
  %9 = mul i64 %8, 19
  %10 = zext i64 %9 to i128
  %11 = mul nuw i128 %10, %6
  %12 = getelementptr inbounds i8, ptr %2, i64 24
  %13 = load i64, ptr %12, align 8, !tbaa !5
  %14 = mul i64 %13, 19
  %15 = zext i64 %14 to i128
  %16 = mul nuw i128 %15, %6
  %17 = getelementptr inbounds i8, ptr %2, i64 16
  %18 = load i64, ptr %17, align 8, !tbaa !5
  %19 = mul i64 %18, 19
  %20 = zext i64 %19 to i128
  %21 = mul nuw i128 %20, %6
  %22 = getelementptr inbounds i8, ptr %2, i64 8
  %23 = load i64, ptr %22, align 8, !tbaa !5
  %24 = mul i64 %23, 19
  %25 = zext i64 %24 to i128
  %26 = mul nuw i128 %25, %6
  %27 = getelementptr inbounds i8, ptr %1, i64 24
  %28 = load i64, ptr %27, align 8, !tbaa !5
  %29 = zext i64 %28 to i128
  %30 = mul nuw i128 %29, %10
  %31 = mul nuw i128 %29, %15
  %32 = mul nuw i128 %29, %20
  %33 = getelementptr inbounds i8, ptr %1, i64 16
  %34 = load i64, ptr %33, align 8, !tbaa !5
  %35 = zext i64 %34 to i128
  %36 = mul nuw i128 %35, %10
  %37 = mul nuw i128 %35, %15
  %38 = getelementptr inbounds i8, ptr %1, i64 8
  %39 = load i64, ptr %38, align 8, !tbaa !5
  %40 = zext i64 %39 to i128
  %41 = mul nuw i128 %40, %10
  %42 = load i64, ptr %2, align 8, !tbaa !5
  %43 = zext i64 %42 to i128
  %44 = mul nuw i128 %43, %6
  %45 = zext i64 %23 to i128
  %46 = mul nuw i128 %29, %45
  %47 = mul nuw i128 %43, %29
  %48 = zext i64 %18 to i128
  %49 = mul nuw i128 %35, %48
  %50 = mul nuw i128 %35, %45
  %51 = mul nuw i128 %43, %35
  %52 = zext i64 %13 to i128
  %53 = mul nuw i128 %40, %52
  %54 = mul nuw i128 %40, %48
  %55 = mul nuw i128 %40, %45
  %56 = mul nuw i128 %43, %40
  %57 = load i64, ptr %1, align 8, !tbaa !5
  %58 = zext i64 %57 to i128
  %59 = zext i64 %8 to i128
  %60 = mul nuw i128 %58, %59
  %61 = mul nuw i128 %58, %52
  %62 = mul nuw i128 %58, %48
  %63 = mul nuw i128 %58, %45
  %64 = mul nuw i128 %58, %43
  %65 = add i128 %32, %26
  %66 = add i128 %65, %37
  %67 = add i128 %66, %41
  %68 = add i128 %67, %64
  %69 = lshr i128 %68, 51
  %70 = trunc i128 %68 to i64
  %71 = and i64 %70, 2251799813685247
  %72 = add i128 %30, %16
  %73 = add i128 %31, %21
  %74 = add i128 %73, %36
  %75 = add i128 %74, %56
  %76 = add i128 %75, %63
  %77 = and i128 %69, 18446744073709551615
  %78 = add i128 %76, %77
  %79 = lshr i128 %78, 51
  %80 = trunc i128 %78 to i64
  %81 = and i64 %80, 2251799813685247
  %82 = and i128 %79, 18446744073709551615
  %83 = add i128 %72, %55
  %84 = add i128 %83, %51
  %85 = add i128 %84, %62
  %86 = add i128 %85, %82
  %87 = lshr i128 %86, 51
  %88 = trunc i128 %86 to i64
  %89 = and i64 %88, 2251799813685247
  %90 = and i128 %87, 18446744073709551615
  %91 = add i128 %50, %11
  %92 = add i128 %91, %54
  %93 = add i128 %92, %47
  %94 = add i128 %93, %61
  %95 = add i128 %94, %90
  %96 = lshr i128 %95, 51
  %97 = trunc i128 %95 to i64
  %98 = and i64 %97, 2251799813685247
  %99 = and i128 %96, 18446744073709551615
  %100 = add i128 %49, %46
  %101 = add i128 %100, %53
  %102 = add i128 %101, %44
  %103 = add i128 %102, %60
  %104 = add i128 %103, %99
  %105 = lshr i128 %104, 51
  %106 = trunc i128 %105 to i64
  %107 = trunc i128 %104 to i64
  %108 = and i64 %107, 2251799813685247
  %109 = mul i64 %106, 19
  %110 = add i64 %109, %71
  %111 = lshr i64 %110, 51
  %112 = and i64 %110, 2251799813685247
  %113 = add nuw nsw i64 %111, %81
  %114 = lshr i64 %113, 51
  %115 = and i64 %113, 2251799813685247
  %116 = add nuw nsw i64 %114, %89
  store i64 %112, ptr %0, align 8, !tbaa !5
  %117 = getelementptr inbounds i8, ptr %0, i64 8
  store i64 %115, ptr %117, align 8, !tbaa !5
  %118 = getelementptr inbounds i8, ptr %0, i64 16
  store i64 %116, ptr %118, align 8, !tbaa !5
  %119 = getelementptr inbounds i8, ptr %0, i64 24
  store i64 %98, ptr %119, align 8, !tbaa !5
  %120 = getelementptr inbounds i8, ptr %0, i64 32
  store i64 %108, ptr %120, align 8, !tbaa !5
  ret void
}

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
