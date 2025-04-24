; ModuleID = 'rust_fiat_curve25519_square.5092e006b1862508-cgu.0'
source_filename = "rust_fiat_curve25519_square.5092e006b1862508-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @rust_fiat_curve25519_carry_square(ptr noalias nocapture noundef writeonly align 8 dereferenceable(40) %out1, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %arg1) unnamed_addr #0 {
start:
  %_0.i = getelementptr inbounds i8, ptr %arg1, i64 32
  %_4 = load i64, ptr %_0.i, align 8, !noundef !3
  %x1 = mul i64 %_4, 19
  %x2 = mul i64 %_4, 38
  %x3 = shl i64 %_4, 1
  %_0.i2 = getelementptr inbounds i8, ptr %arg1, i64 24
  %_11 = load i64, ptr %_0.i2, align 8, !noundef !3
  %x4 = mul i64 %_11, 19
  %x5 = mul i64 %_11, 38
  %x6 = shl i64 %_11, 1
  %_0.i4 = getelementptr inbounds i8, ptr %arg1, i64 16
  %_18 = load i64, ptr %_0.i4, align 8, !noundef !3
  %x7 = shl i64 %_18, 1
  %_0.i5 = getelementptr inbounds i8, ptr %arg1, i64 8
  %_21 = load i64, ptr %_0.i5, align 8, !noundef !3
  %x8 = shl i64 %_21, 1
  %_24 = zext i64 %_4 to i128
  %_27 = zext i64 %x1 to i128
  %x9 = mul nuw i128 %_27, %_24
  %_29 = zext i64 %_11 to i128
  %_32 = zext i64 %x2 to i128
  %x10 = mul nuw i128 %_29, %_32
  %_37 = zext i64 %x4 to i128
  %x11 = mul nuw i128 %_37, %_29
  %_39 = zext i64 %_18 to i128
  %x12 = mul nuw i128 %_39, %_32
  %_46 = zext i64 %x5 to i128
  %x13 = mul nuw i128 %_39, %_46
  %x14 = mul nuw i128 %_39, %_39
  %_55 = zext i64 %_21 to i128
  %x15 = mul nuw i128 %_55, %_32
  %_62 = zext i64 %x6 to i128
  %x16 = mul nuw i128 %_55, %_62
  %_67 = zext i64 %x7 to i128
  %x17 = mul nuw i128 %_55, %_67
  %x18 = mul nuw i128 %_55, %_55
  %_77 = load i64, ptr %arg1, align 8, !noundef !3
  %_76 = zext i64 %_77 to i128
  %_79 = zext i64 %x3 to i128
  %x19 = mul nuw i128 %_76, %_79
  %x20 = mul nuw i128 %_76, %_62
  %x21 = mul nuw i128 %_76, %_67
  %_92 = zext i64 %x8 to i128
  %x22 = mul nuw i128 %_76, %_92
  %x23 = mul nuw i128 %_76, %_76
  %_101 = add i128 %x15, %x13
  %x24 = add i128 %_101, %x23
  %_103 = lshr i128 %x24, 51
  %0 = trunc i128 %x24 to i64
  %x26 = and i64 %0, 2251799813685247
  %_107 = add i128 %x16, %x14
  %x27 = add i128 %_107, %x19
  %_109 = add i128 %x17, %x9
  %x28 = add i128 %_109, %x20
  %_111 = add i128 %x18, %x10
  %x29 = add i128 %_111, %x21
  %_113 = add i128 %x12, %x11
  %x30 = add i128 %_113, %x22
  %_115 = and i128 %_103, 18446744073709551615
  %x31 = add i128 %x30, %_115
  %_117 = lshr i128 %x31, 51
  %1 = trunc i128 %x31 to i64
  %x33 = and i64 %1, 2251799813685247
  %_121 = and i128 %_117, 18446744073709551615
  %x34 = add i128 %x29, %_121
  %_123 = lshr i128 %x34, 51
  %2 = trunc i128 %x34 to i64
  %x36 = and i64 %2, 2251799813685247
  %_127 = and i128 %_123, 18446744073709551615
  %x37 = add i128 %x28, %_127
  %_129 = lshr i128 %x37, 51
  %3 = trunc i128 %x37 to i64
  %x39 = and i64 %3, 2251799813685247
  %_133 = and i128 %_129, 18446744073709551615
  %x40 = add i128 %x27, %_133
  %_135 = lshr i128 %x40, 51
  %x41 = trunc i128 %_135 to i64
  %4 = trunc i128 %x40 to i64
  %x42 = and i64 %4, 2251799813685247
  %x43 = mul i64 %x41, 19
  %x44 = add i64 %x43, %x26
  %x45 = lshr i64 %x44, 51
  %x46 = and i64 %x44, 2251799813685247
  %x47 = add nuw nsw i64 %x45, %x33
  %_144 = lshr i64 %x47, 51
  %x49 = and i64 %x47, 2251799813685247
  %x50 = add nuw nsw i64 %_144, %x36
  store i64 %x46, ptr %out1, align 8
  %_0.i25 = getelementptr inbounds i8, ptr %out1, i64 8
  store i64 %x49, ptr %_0.i25, align 8
  %_0.i26 = getelementptr inbounds i8, ptr %out1, i64 16
  store i64 %x50, ptr %_0.i26, align 8
  %_0.i27 = getelementptr inbounds i8, ptr %out1, i64 24
  store i64 %x39, ptr %_0.i27, align 8
  %_0.i28 = getelementptr inbounds i8, ptr %out1, i64 32
  store i64 %x42, ptr %_0.i28, align 8
  ret void
}

attributes #0 = { inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.83.0 (90b35a623 2024-11-26)"}
!3 = !{}
