; ModuleID = '<stdin>'
source_filename = "c_fiat_poly1305_carry_mul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.compiler.used = appending global [1 x ptr] [ptr @c_fiat_poly1305_carry_mul], section "llvm.metadata"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @c_fiat_poly1305_carry_mul(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1, ptr nocapture noundef readonly %2) #0 {
  %4 = getelementptr inbounds i8, ptr %1, i64 16
  %5 = load i64, ptr %4, align 8, !tbaa !5
  %6 = zext i64 %5 to i128
  %7 = getelementptr inbounds i8, ptr %2, i64 16
  %8 = load i64, ptr %7, align 8, !tbaa !5
  %9 = mul i64 %8, 5
  %10 = zext i64 %9 to i128
  %11 = mul nuw i128 %10, %6
  %12 = getelementptr inbounds i8, ptr %2, i64 8
  %13 = load i64, ptr %12, align 8, !tbaa !5
  %14 = mul i64 %13, 10
  %15 = zext i64 %14 to i128
  %16 = mul nuw i128 %15, %6
  %17 = getelementptr inbounds i8, ptr %1, i64 8
  %18 = load i64, ptr %17, align 8, !tbaa !5
  %19 = zext i64 %18 to i128
  %20 = mul i64 %8, 10
  %21 = zext i64 %20 to i128
  %22 = mul nuw i128 %19, %21
  %23 = load i64, ptr %2, align 8, !tbaa !5
  %24 = zext i64 %23 to i128
  %25 = mul nuw i128 %24, %6
  %26 = shl i64 %13, 1
  %27 = zext i64 %26 to i128
  %28 = mul nuw i128 %19, %27
  %29 = mul nuw i128 %24, %19
  %30 = load i64, ptr %1, align 8, !tbaa !5
  %31 = zext i64 %30 to i128
  %32 = zext i64 %8 to i128
  %33 = mul nuw i128 %31, %32
  %34 = zext i64 %13 to i128
  %35 = mul nuw i128 %31, %34
  %36 = mul nuw i128 %31, %24
  %37 = add i128 %22, %16
  %38 = add i128 %37, %36
  %39 = lshr i128 %38, 44
  %40 = trunc i128 %38 to i64
  %41 = and i64 %40, 17592186044415
  %42 = add i128 %25, %28
  %43 = add i128 %42, %33
  %44 = add i128 %29, %11
  %45 = add i128 %44, %35
  %46 = and i128 %39, 18446744073709551615
  %47 = add i128 %45, %46
  %48 = lshr i128 %47, 43
  %49 = trunc i128 %47 to i64
  %50 = and i64 %49, 8796093022207
  %51 = and i128 %48, 18446744073709551615
  %52 = add i128 %43, %51
  %53 = lshr i128 %52, 43
  %54 = trunc i128 %53 to i64
  %55 = trunc i128 %52 to i64
  %56 = and i64 %55, 8796093022207
  %57 = mul i64 %54, 5
  %58 = add i64 %57, %41
  %59 = lshr i64 %58, 44
  %60 = and i64 %58, 17592186044415
  %61 = add nuw nsw i64 %59, %50
  %62 = lshr i64 %61, 43
  %63 = and i64 %61, 8796093022207
  %64 = add nuw nsw i64 %62, %56
  store i64 %60, ptr %0, align 8, !tbaa !5
  %65 = getelementptr inbounds i8, ptr %0, i64 8
  store i64 %63, ptr %65, align 8, !tbaa !5
  %66 = getelementptr inbounds i8, ptr %0, i64 16
  store i64 %64, ptr %66, align 8, !tbaa !5
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
