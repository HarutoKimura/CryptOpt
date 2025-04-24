; ModuleID = 'rust_fiat_secp256k1_dettman_square.fa9f04e4069e5e9f-cgu.0'
source_filename = "rust_fiat_secp256k1_dettman_square.fa9f04e4069e5e9f-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @rust_fiat_secp256k1_dettman_square(ptr noalias nocapture noundef writeonly align 8 dereferenceable(40) %out1, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %arg1) unnamed_addr #0 {
start:
  %0 = getelementptr inbounds i8, ptr %arg1, i64 24
  %_4 = load i64, ptr %0, align 8, !noundef !3
  %x1 = shl i64 %_4, 1
  %1 = getelementptr inbounds i8, ptr %arg1, i64 16
  %_6 = load i64, ptr %1, align 8, !noundef !3
  %x2 = shl i64 %_6, 1
  %2 = getelementptr inbounds i8, ptr %arg1, i64 8
  %_8 = load i64, ptr %2, align 8, !noundef !3
  %x3 = shl i64 %_8, 1
  %_10 = load i64, ptr %arg1, align 8, !noundef !3
  %x4 = shl i64 %_10, 1
  %3 = getelementptr inbounds i8, ptr %arg1, i64 32
  %_13 = load i64, ptr %3, align 8, !noundef !3
  %_12 = zext i64 %_13 to i128
  %x5 = mul nuw i128 %_12, %_12
  %_15 = lshr i128 %x5, 64
  %_21 = zext i64 %x4 to i128
  %_22 = zext i64 %_4 to i128
  %_20 = mul nuw i128 %_21, %_22
  %_24 = zext i64 %x3 to i128
  %_25 = zext i64 %_6 to i128
  %_23 = mul nuw i128 %_24, %_25
  %_19 = add i128 %_20, %_23
  %_27 = and i128 %x5, 18446744073709551613
  %_26 = mul nuw nsw i128 %_27, 68719492368
  %x8 = add i128 %_19, %_26
  %_29 = lshr i128 %x8, 52
  %4 = trunc i128 %x8 to i64
  %x10 = and i64 %4, 4503599627370494
  %_34 = and i128 %_29, 18446744073709551615
  %_36 = mul nuw i128 %_21, %_12
  %_38 = mul nuw i128 %_24, %_22
  %_39 = mul nuw i128 %_25, %_25
  %_37 = add i128 %_38, %_39
  %_35 = add i128 %_37, %_36
  %_40 = mul nuw nsw i128 %_15, 281475040739328
  %_33 = add i128 %_35, %_40
  %x11 = add i128 %_33, %_34
  %_43 = lshr i128 %x11, 52
  %5 = trunc i128 %x11 to i64
  %_47 = and i128 %_43, 18446744073709551615
  %_49 = mul nuw i128 %_12, %_24
  %_51 = zext i64 %x2 to i128
  %_50 = mul nuw i128 %_51, %_22
  %_48 = add i128 %_49, %_50
  %x14 = add i128 %_48, %_47
  %_53 = lshr i128 %x14, 52
  %6 = trunc i128 %x14 to i64
  %x13 = lshr i64 %5, 48
  %x17 = and i64 %x13, 15
  %x18 = and i64 %5, 281474976710655
  %_60 = zext i64 %_10 to i128
  %_59 = mul nuw i128 %_60, %_60
  %x16 = shl i64 %6, 4
  %_64 = and i64 %x16, 72057594037927920
  %_63 = or disjoint i64 %_64, %x17
  %_62 = zext nneg i64 %_63 to i128
  %_61 = mul nuw nsw i128 %_62, 4294968273
  %x19 = add i128 %_61, %_59
  %_66 = lshr i128 %x19, 52
  %7 = trunc i128 %x19 to i64
  %x21 = and i64 %7, 4503599627370495
  %_70 = and i128 %_53, 18446744073709551615
  %_72 = mul nuw i128 %_12, %_51
  %_73 = mul nuw i128 %_22, %_22
  %_71 = add i128 %_72, %_73
  %x22 = add i128 %_71, %_70
  %_75 = lshr i128 %x22, 52
  %_80 = and i128 %_66, 18446744073709551615
  %_82 = zext i64 %_8 to i128
  %_81 = mul nuw i128 %_21, %_82
  %_84 = and i128 %x22, 4503599627370495
  %_83 = mul nuw nsw i128 %_84, 68719492368
  %_79 = add i128 %_83, %_81
  %x25 = add i128 %_79, %_80
  %_86 = lshr i128 %x25, 52
  %8 = trunc i128 %x25 to i64
  %x27 = and i64 %8, 4503599627370495
  %_90 = and i128 %_75, 18446744073709551615
  %_92 = zext i64 %x1 to i128
  %_91 = mul nuw i128 %_12, %_92
  %x28 = add nuw i128 %_90, %_91
  %_94 = lshr i128 %x28, 64
  %_99 = and i128 %_86, 18446744073709551615
  %_101 = mul nuw i128 %_21, %_25
  %_102 = mul nuw i128 %_82, %_82
  %_100 = add i128 %_101, %_102
  %_104 = and i128 %x28, 18446744073709551615
  %_103 = mul nuw nsw i128 %_104, 68719492368
  %_98 = add i128 %_100, %_103
  %x31 = add i128 %_98, %_99
  %_106 = lshr i128 %x31, 52
  %x32 = trunc i128 %_106 to i64
  %9 = trunc i128 %x31 to i64
  %x33 = and i64 %9, 4503599627370495
  %_111 = add i64 %x10, %x32
  %_110 = zext i64 %_111 to i128
  %_112 = mul nuw nsw i128 %_94, 281475040739328
  %x34 = add nuw nsw i128 %_112, %_110
  %_115 = lshr i128 %x34, 52
  %x35 = trunc nuw nsw i128 %_115 to i64
  %10 = trunc i128 %x34 to i64
  %x36 = and i64 %10, 4503599627370495
  %x37 = add nuw nsw i64 %x18, %x35
  store i64 %x21, ptr %out1, align 8
  %11 = getelementptr inbounds i8, ptr %out1, i64 8
  store i64 %x27, ptr %11, align 8
  %12 = getelementptr inbounds i8, ptr %out1, i64 16
  store i64 %x33, ptr %12, align 8
  %13 = getelementptr inbounds i8, ptr %out1, i64 24
  store i64 %x36, ptr %13, align 8
  %14 = getelementptr inbounds i8, ptr %out1, i64 32
  store i64 %x37, ptr %14, align 8
  ret void
}

attributes #0 = { inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.83.0 (90b35a623 2024-11-26)"}
!3 = !{}
