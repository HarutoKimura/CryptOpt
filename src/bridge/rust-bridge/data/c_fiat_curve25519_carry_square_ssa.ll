; ModuleID = '<stdin>'
source_filename = "c_fiat_curve25519_carry_square.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.compiler.used = appending global [1 x ptr] [ptr @c_fiat_curve25519_carry_square], section "llvm.metadata"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @c_fiat_curve25519_carry_square(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1) #0 {
  %3 = getelementptr inbounds i8, ptr %1, i64 32
  %4 = load i64, ptr %3, align 8, !tbaa !5
  %5 = mul i64 %4, 19
  %6 = mul i64 %4, 38
  %7 = shl i64 %4, 1
  %8 = getelementptr inbounds i8, ptr %1, i64 24
  %9 = load i64, ptr %8, align 8, !tbaa !5
  %10 = mul i64 %9, 19
  %11 = mul i64 %9, 38
  %12 = shl i64 %9, 1
  %13 = getelementptr inbounds i8, ptr %1, i64 16
  %14 = load i64, ptr %13, align 8, !tbaa !5
  %15 = shl i64 %14, 1
  %16 = getelementptr inbounds i8, ptr %1, i64 8
  %17 = load i64, ptr %16, align 8, !tbaa !5
  %18 = shl i64 %17, 1
  %19 = zext i64 %4 to i128
  %20 = zext i64 %5 to i128
  %21 = mul nuw i128 %20, %19
  %22 = zext i64 %9 to i128
  %23 = zext i64 %6 to i128
  %24 = mul nuw i128 %22, %23
  %25 = zext i64 %10 to i128
  %26 = mul nuw i128 %25, %22
  %27 = zext i64 %14 to i128
  %28 = mul nuw i128 %27, %23
  %29 = zext i64 %11 to i128
  %30 = mul nuw i128 %27, %29
  %31 = mul nuw i128 %27, %27
  %32 = zext i64 %17 to i128
  %33 = mul nuw i128 %32, %23
  %34 = zext i64 %12 to i128
  %35 = mul nuw i128 %32, %34
  %36 = zext i64 %15 to i128
  %37 = mul nuw i128 %32, %36
  %38 = mul nuw i128 %32, %32
  %39 = load i64, ptr %1, align 8, !tbaa !5
  %40 = zext i64 %39 to i128
  %41 = zext i64 %7 to i128
  %42 = mul nuw i128 %40, %41
  %43 = mul nuw i128 %40, %34
  %44 = mul nuw i128 %40, %36
  %45 = zext i64 %18 to i128
  %46 = mul nuw i128 %40, %45
  %47 = mul nuw i128 %40, %40
  %48 = add i128 %33, %30
  %49 = add i128 %48, %47
  %50 = lshr i128 %49, 51
  %51 = trunc i128 %49 to i64
  %52 = and i64 %51, 2251799813685247
  %53 = add i128 %35, %31
  %54 = add i128 %53, %42
  %55 = add i128 %37, %21
  %56 = add i128 %55, %43
  %57 = add i128 %38, %24
  %58 = add i128 %57, %44
  %59 = add i128 %28, %26
  %60 = add i128 %59, %46
  %61 = and i128 %50, 18446744073709551615
  %62 = add i128 %60, %61
  %63 = lshr i128 %62, 51
  %64 = trunc i128 %62 to i64
  %65 = and i64 %64, 2251799813685247
  %66 = and i128 %63, 18446744073709551615
  %67 = add i128 %58, %66
  %68 = lshr i128 %67, 51
  %69 = trunc i128 %67 to i64
  %70 = and i64 %69, 2251799813685247
  %71 = and i128 %68, 18446744073709551615
  %72 = add i128 %56, %71
  %73 = lshr i128 %72, 51
  %74 = trunc i128 %72 to i64
  %75 = and i64 %74, 2251799813685247
  %76 = and i128 %73, 18446744073709551615
  %77 = add i128 %54, %76
  %78 = lshr i128 %77, 51
  %79 = trunc i128 %78 to i64
  %80 = trunc i128 %77 to i64
  %81 = and i64 %80, 2251799813685247
  %82 = mul i64 %79, 19
  %83 = add i64 %82, %52
  %84 = lshr i64 %83, 51
  %85 = and i64 %83, 2251799813685247
  %86 = add nuw nsw i64 %84, %65
  %87 = lshr i64 %86, 51
  %88 = and i64 %86, 2251799813685247
  %89 = add nuw nsw i64 %87, %70
  store i64 %85, ptr %0, align 8, !tbaa !5
  %90 = getelementptr inbounds i8, ptr %0, i64 8
  store i64 %88, ptr %90, align 8, !tbaa !5
  %91 = getelementptr inbounds i8, ptr %0, i64 16
  store i64 %89, ptr %91, align 8, !tbaa !5
  %92 = getelementptr inbounds i8, ptr %0, i64 24
  store i64 %75, ptr %92, align 8, !tbaa !5
  %93 = getelementptr inbounds i8, ptr %0, i64 32
  store i64 %81, ptr %93, align 8, !tbaa !5
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
