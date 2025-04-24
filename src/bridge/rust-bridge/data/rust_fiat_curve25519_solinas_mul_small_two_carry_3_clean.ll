; ModuleID = 'rust_fiat_curve25519_solinas_mul_small_two_carry_3.4f7b9ecadc6a8e71-cgu.0'
source_filename = "rust_fiat_curve25519_solinas_mul_small_two_carry_3.4f7b9ecadc6a8e71-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"
; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @rust_fiat_curve25519_solinas_mul_small_two_carry_3(ptr noalias nocapture noundef writeonly align 8 dereferenceable(32) x0, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) x1, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) x2) unnamed_addr #0 {
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
x16 = getelementptr inbounds [4 x i64], ptr x1, i64 0, i64 2
x17 = load i64, ptr x16, align 8, !noundef !3
x18 = mul i64 x17, x12
x19 = getelementptr inbounds [4 x i64], ptr x1, i64 0, i64 1
x20 = load i64, ptr x19, align 8, !noundef !3
x21 = zext i64 x20 to i128
x22 = mul nuw i128 x21, x7
x23 = lshr i128 x22, 64
x24 = trunc i128 x23 to i64
x25 = load i64, ptr x1, align 8, !noundef !3
x26 = zext i64 x25 to i128
x27 = mul nuw i128 x26, x7
x28 = lshr i128 x27, 64
x29 = mul nuw i128 x26, x10
x30 = lshr i128 x29, 64
x31 = zext i64 x15 to i128
x32 = add nuw nsw i128 x30, x31
x33 = lshr i128 x32, 64
x34 = zext i64 x13 to i128
x35 = add nuw nsw i128 x28, x34
x36 = add nuw nsw i128 x35, x33
x37 = lshr i128 x36, 64
x38 = trunc i128 x37 to i64
x39 = add nuw i64 x38, x24
x40 = trunc i128 x32 to i64
x41 = add i64 x18, x40
store i64 x39, ptr x0, align 8
x42 = getelementptr inbounds [4 x i64], ptr x0, i64 0, i64 1
store i64 x39, ptr x42, align 8
x43 = getelementptr inbounds [4 x i64], ptr x0, i64 0, i64 2
store i64 x41, ptr x43, align 8
x44 = getelementptr inbounds [4 x i64], ptr x0, i64 0, i64 3
store i64 x41, ptr x44, align 8
ret void