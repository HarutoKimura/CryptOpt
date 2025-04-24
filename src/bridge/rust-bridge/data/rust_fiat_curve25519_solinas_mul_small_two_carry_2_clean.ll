; ModuleID = 'rust_fiat_curve25519_solinas_mul_small_two_carry_2.ba4b1ef78bbc41e5-cgu.0'
source_filename = "rust_fiat_curve25519_solinas_mul_small_two_carry_2.ba4b1ef78bbc41e5-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"
; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @rust_fiat_curve25519_solinas_mul_small_two_carry_2(ptr noalias nocapture noundef writeonly align 8 dereferenceable(32) x0, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) x1, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) x2) unnamed_addr #0 {
start:
x3 = getelementptr inbounds [4 x i64], ptr x1, i64 0, i64 3
x4 = load i64, ptr x3, align 8, !noundef !3
x5 = getelementptr inbounds [4 x i64], ptr x2, i64 0, i64 3
x6 = load i64, ptr x5, align 8, !noundef !3
x7 = zext i64 x6 to i128
x8 = getelementptr inbounds [4 x i64], ptr x2, i64 0, i64 2
x9 = load i64, ptr x8, align 8, !noundef !3
x10 = zext i64 x9 to i128
x11 = getelementptr inbounds [4 x i64], ptr x2, i64 0, i64 1
x12 = load i64, ptr x11, align 8, !noundef !3
x13 = mul i64 x12, x4
x14 = load i64, ptr x2, align 8, !noundef !3
x15 = mul i64 x14, x4
x16 = getelementptr inbounds [4 x i64], ptr x1, i64 0, i64 1
x17 = load i64, ptr x16, align 8, !noundef !3
x18 = zext i64 x17 to i128
x19 = mul nuw i128 x18, x7
x20 = lshr i128 x19, 64
x21 = trunc i128 x20 to i64
x22 = load i64, ptr x1, align 8, !noundef !3
x23 = zext i64 x22 to i128
x24 = mul nuw i128 x23, x7
x25 = lshr i128 x24, 64
x26 = mul nuw i128 x23, x10
x27 = lshr i128 x26, 64
x28 = mul i64 x22, x14
x29 = zext i64 x15 to i128
x30 = add nuw nsw i128 x27, x29
x31 = trunc i128 x30 to i64
x32 = lshr i128 x30, 64
x33 = zext i64 x13 to i128
x34 = add nuw nsw i128 x25, x33
x35 = add nuw nsw i128 x34, x32
x36 = trunc i128 x35 to i64
x37 = lshr i128 x35, 64
x38 = trunc i128 x37 to i64
x39 = add nuw i64 x38, x21
store i64 x28, ptr x0, align 8
x40 = getelementptr inbounds [4 x i64], ptr x0, i64 0, i64 1
store i64 x31, ptr x40, align 8
x41 = getelementptr inbounds [4 x i64], ptr x0, i64 0, i64 2
store i64 x36, ptr x41, align 8
x42 = getelementptr inbounds [4 x i64], ptr x0, i64 0, i64 3
store i64 x39, ptr x42, align 8
ret void