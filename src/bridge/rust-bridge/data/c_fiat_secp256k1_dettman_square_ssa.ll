; ModuleID = '<stdin>'
source_filename = "c_fiat_secp256k1_dettman_square.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.compiler.used = appending global [1 x ptr] [ptr @c_fiat_secp256k1_dettman_square], section "llvm.metadata"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @c_fiat_secp256k1_dettman_square(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1) #0 {
  %3 = getelementptr inbounds i8, ptr %1, i64 24
  %4 = load i64, ptr %3, align 8, !tbaa !5
  %5 = shl i64 %4, 1
  %6 = getelementptr inbounds i8, ptr %1, i64 16
  %7 = load i64, ptr %6, align 8, !tbaa !5
  %8 = shl i64 %7, 1
  %9 = getelementptr inbounds i8, ptr %1, i64 8
  %10 = load i64, ptr %9, align 8, !tbaa !5
  %11 = shl i64 %10, 1
  %12 = load i64, ptr %1, align 8, !tbaa !5
  %13 = shl i64 %12, 1
  %14 = getelementptr inbounds i8, ptr %1, i64 32
  %15 = load i64, ptr %14, align 8, !tbaa !5
  %16 = zext i64 %15 to i128
  %17 = mul nuw i128 %16, %16
  %18 = lshr i128 %17, 64
  %19 = zext i64 %13 to i128
  %20 = zext i64 %4 to i128
  %21 = mul nuw i128 %19, %20
  %22 = zext i64 %11 to i128
  %23 = zext i64 %7 to i128
  %24 = mul nuw i128 %22, %23
  %25 = add i128 %21, %24
  %26 = and i128 %17, 18446744073709551615
  %27 = mul nuw nsw i128 %26, 68719492368
  %28 = add i128 %25, %27
  %29 = lshr i128 %28, 52
  %30 = trunc i128 %28 to i64
  %31 = and i64 %30, 4503599627370494
  %32 = and i128 %29, 18446744073709551615
  %33 = mul nuw i128 %19, %16
  %34 = mul nuw i128 %22, %20
  %35 = mul nuw i128 %23, %23
  %36 = add i128 %34, %35
  %37 = add i128 %36, %33
  %38 = mul nuw nsw i128 %18, 281475040739328
  %39 = add i128 %37, %38
  %40 = add i128 %39, %32
  %41 = lshr i128 %40, 52
  %42 = trunc i128 %40 to i64
  %43 = and i128 %41, 18446744073709551615
  %44 = mul nuw i128 %16, %22
  %45 = zext i64 %8 to i128
  %46 = mul nuw i128 %45, %20
  %47 = add i128 %44, %46
  %48 = add i128 %47, %43
  %49 = lshr i128 %48, 52
  %50 = trunc i128 %48 to i64
  %51 = lshr i64 %42, 48
  %52 = and i64 %51, 15
  %53 = and i64 %42, 281474976710655
  %54 = zext i64 %12 to i128
  %55 = mul nuw i128 %54, %54
  %56 = shl i64 %50, 4
  %57 = and i64 %56, 72057594037927920
  %58 = or disjoint i64 %57, %52
  %59 = zext nneg i64 %58 to i128
  %60 = mul nuw nsw i128 %59, 4294968273
  %61 = add i128 %60, %55
  %62 = lshr i128 %61, 52
  %63 = trunc i128 %61 to i64
  %64 = and i64 %63, 4503599627370495
  %65 = and i128 %49, 18446744073709551615
  %66 = mul nuw i128 %16, %45
  %67 = mul nuw i128 %20, %20
  %68 = add i128 %66, %67
  %69 = add i128 %68, %65
  %70 = lshr i128 %69, 52
  %71 = and i128 %62, 18446744073709551615
  %72 = zext i64 %10 to i128
  %73 = mul nuw i128 %19, %72
  %74 = and i128 %69, 4503599627370495
  %75 = mul nuw nsw i128 %74, 68719492368
  %76 = add i128 %75, %73
  %77 = add i128 %76, %71
  %78 = lshr i128 %77, 52
  %79 = trunc i128 %77 to i64
  %80 = and i64 %79, 4503599627370495
  %81 = and i128 %70, 18446744073709551615
  %82 = zext i64 %5 to i128
  %83 = mul nuw i128 %16, %82
  %84 = add nuw i128 %81, %83
  %85 = lshr i128 %84, 64
  %86 = and i128 %78, 18446744073709551615
  %87 = mul nuw i128 %19, %23
  %88 = mul nuw i128 %72, %72
  %89 = add i128 %87, %88
  %90 = and i128 %84, 18446744073709551615
  %91 = mul nuw nsw i128 %90, 68719492368
  %92 = add i128 %89, %91
  %93 = add i128 %92, %86
  %94 = lshr i128 %93, 52
  %95 = trunc i128 %94 to i64
  %96 = trunc i128 %93 to i64
  %97 = and i64 %96, 4503599627370495
  %98 = add i64 %31, %95
  %99 = zext i64 %98 to i128
  %100 = mul nuw nsw i128 %85, 281475040739328
  %101 = add nuw nsw i128 %100, %99
  %102 = lshr i128 %101, 52
  %103 = trunc nuw nsw i128 %102 to i64
  %104 = trunc i128 %101 to i64
  %105 = and i64 %104, 4503599627370495
  %106 = add nuw nsw i64 %53, %103
  store i64 %64, ptr %0, align 8, !tbaa !5
  %107 = getelementptr inbounds i8, ptr %0, i64 8
  store i64 %80, ptr %107, align 8, !tbaa !5
  %108 = getelementptr inbounds i8, ptr %0, i64 16
  store i64 %97, ptr %108, align 8, !tbaa !5
  %109 = getelementptr inbounds i8, ptr %0, i64 24
  store i64 %105, ptr %109, align 8, !tbaa !5
  %110 = getelementptr inbounds i8, ptr %0, i64 32
  store i64 %106, ptr %110, align 8, !tbaa !5
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
