; ModuleID = '<stdin>'
source_filename = "c_fiat_poly1305_carry_square.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.compiler.used = appending global [1 x ptr] [ptr @c_fiat_poly1305_carry_square], section "llvm.metadata"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @c_fiat_poly1305_carry_square(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1) #0 {
  %3 = getelementptr inbounds i8, ptr %1, i64 16
  %4 = load i64, ptr %3, align 8, !tbaa !5
  %5 = mul i64 %4, 5
  %6 = shl i64 %4, 1
  %7 = getelementptr inbounds i8, ptr %1, i64 8
  %8 = load i64, ptr %7, align 8, !tbaa !5
  %9 = shl i64 %8, 1
  %10 = zext i64 %4 to i128
  %11 = zext i64 %5 to i128
  %12 = mul nuw i128 %11, %10
  %13 = zext i64 %8 to i128
  %14 = mul i64 %4, 20
  %15 = zext i64 %14 to i128
  %16 = mul nuw i128 %13, %15
  %17 = zext i64 %9 to i128
  %18 = mul nuw i128 %17, %13
  %19 = load i64, ptr %1, align 8, !tbaa !5
  %20 = zext i64 %19 to i128
  %21 = zext i64 %6 to i128
  %22 = mul nuw i128 %20, %21
  %23 = mul nuw i128 %20, %17
  %24 = mul nuw i128 %20, %20
  %25 = add i128 %24, %16
  %26 = lshr i128 %25, 44
  %27 = trunc i128 %25 to i64
  %28 = and i64 %27, 17592186044415
  %29 = add i128 %22, %18
  %30 = add i128 %23, %12
  %31 = and i128 %26, 18446744073709551615
  %32 = add i128 %30, %31
  %33 = lshr i128 %32, 43
  %34 = trunc i128 %32 to i64
  %35 = and i64 %34, 8796093022207
  %36 = and i128 %33, 18446744073709551615
  %37 = add i128 %29, %36
  %38 = lshr i128 %37, 43
  %39 = trunc i128 %38 to i64
  %40 = trunc i128 %37 to i64
  %41 = and i64 %40, 8796093022207
  %42 = mul i64 %39, 5
  %43 = add i64 %42, %28
  %44 = lshr i64 %43, 44
  %45 = and i64 %43, 17592186044415
  %46 = add nuw nsw i64 %44, %35
  %47 = lshr i64 %46, 43
  %48 = and i64 %46, 8796093022207
  %49 = add nuw nsw i64 %47, %41
  store i64 %45, ptr %0, align 8, !tbaa !5
  %50 = getelementptr inbounds i8, ptr %0, i64 8
  store i64 %48, ptr %50, align 8, !tbaa !5
  %51 = getelementptr inbounds i8, ptr %0, i64 16
  store i64 %49, ptr %51, align 8, !tbaa !5
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
