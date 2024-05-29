; ModuleID = 'func.f98810fb60321f68-cgu.0'
source_filename = "func.f98810fb60321f68-cgu.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx11.0.0"

@alloc_151a32fa4fdc2162cda17e10f6277990 = private unnamed_addr constant <{ [7 x i8] }> <{ [7 x i8] c"func.rs" }>, align 1
@alloc_6aa0c3c82b677962801f27cdc102c1ef = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_151a32fa4fdc2162cda17e10f6277990, [16 x i8] c"\07\00\00\00\00\00\00\00\03\00\00\00\05\00\00\00" }>, align 8
@str.0 = internal unnamed_addr constant [28 x i8] c"attempt to add with overflow"
@str.1 = internal unnamed_addr constant [33 x i8] c"attempt to multiply with overflow"

; func::custom_func
; Function Attrs: uwtable
define i32 @_ZN4func11custom_func17h8e4390cd24f0b89bE(i32 %x, i32 %y) unnamed_addr #0 {
start:
  %0 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %x, i32 %y)
  %_4.0 = extractvalue { i32, i1 } %0, 0
  %_4.1 = extractvalue { i32, i1 } %0, 1
  %1 = call i1 @llvm.expect.i1(i1 %_4.1, i1 false)
  br i1 %1, label %panic, label %bb1

bb1:                                              ; preds = %start
  %2 = call { i32, i1 } @llvm.smul.with.overflow.i32(i32 %_4.0, i32 1000)
  %_5.0 = extractvalue { i32, i1 } %2, 0
  %_5.1 = extractvalue { i32, i1 } %2, 1
  %3 = call i1 @llvm.expect.i1(i1 %_5.1, i1 false)
  br i1 %3, label %panic1, label %bb2

panic:                                            ; preds = %start
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h57fd475c037a9df3E(ptr align 1 @str.0, i64 28, ptr align 8 @alloc_6aa0c3c82b677962801f27cdc102c1ef) #4
  unreachable

bb2:                                              ; preds = %bb1
  ret i32 %_5.0

panic1:                                           ; preds = %bb1
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h57fd475c037a9df3E(ptr align 1 @str.1, i64 33, ptr align 8 @alloc_6aa0c3c82b677962801f27cdc102c1ef) #4
  unreachable
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.expect.i1(i1, i1) #2

; core::panicking::panic
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking5panic17h57fd475c037a9df3E(ptr align 1, i64, ptr align 8) unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.smul.with.overflow.i32(i32, i32) #1

attributes #0 = { uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="apple-m1" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #3 = { cold noinline noreturn uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="apple-m1" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.76.0 (07dca489a 2024-02-04)"}
