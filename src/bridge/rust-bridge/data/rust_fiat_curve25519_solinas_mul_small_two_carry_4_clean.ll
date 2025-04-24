; ModuleID = 'rust_fiat_curve25519_solinas_mul_small_two_carry_4.cf0712c33c105060-cgu.0'
source_filename = "rust_fiat_curve25519_solinas_mul_small_two_carry_4.cf0712c33c105060-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"
; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @rust_fiat_curve25519_solinas_mul_small_two_carry_4(ptr noalias nocapture noundef writeonly align 8 dereferenceable(32) x0, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) x1, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) x2) unnamed_addr #0 {
start:
x3 = getelementptr inbounds [4 x i64], ptr x1, i64 0, i64 3
x4 = load i64, ptr x3, align 8, !noundef !3
x5 = getelementptr inbounds [4 x i64], ptr x2, i64 0, i64 3
x6 = load i64, ptr x5, align 8, !noundef !3
x7 = zext i64 x4 to i128
x8 = zext i64 x6 to i128
x9 = getelementptr inbounds [4 x i64], ptr x2, i64 0, i64 2
x10 = load i64, ptr x9, align 8, !noundef !3
x11 = zext i64 x10 to i128
x12 = getelementptr inbounds [4 x i64], ptr x2, i64 0, i64 1
x13 = load i64, ptr x12, align 8, !noundef !3
x14 = mul i64 x13, x4
x15 = load i64, ptr x2, align 8, !noundef !3
x16 = zext i64 x15 to i128
x17 = mul nuw i128 x16, x7
x18 = lshr i128 x17, 64
x19 = getelementptr inbounds [4 x i64], ptr x1, i64 0, i64 2
x20 = load i64, ptr x19, align 8, !noundef !3
x21 = mul i64 x20, x13
x22 = getelementptr inbounds [4 x i64], ptr x1, i64 0, i64 1
x23 = load i64, ptr x22, align 8, !noundef !3
x24 = zext i64 x23 to i128
x25 = mul nuw i128 x24, x8
x26 = lshr i128 x25, 64
x27 = trunc i128 x26 to i64
x28 = load i64, ptr x1, align 8, !noundef !3
x29 = zext i64 x28 to i128
x30 = mul nuw i128 x29, x8
x31 = lshr i128 x30, 64
x32 = mul nuw i128 x29, x11
x33 = lshr i128 x32, 64
x34 = and i128 x17, 18446744073709551615
x35 = add nuw nsw i128 x33, x34
x36 = lshr i128 x35, 64
x37 = zext i64 x14 to i128
x38 = add nuw nsw i128 x31, x37
x39 = add nuw nsw i128 x38, x36
x40 = lshr i128 x39, 64
x41 = trunc i128 x40 to i64
x42 = add nuw i64 x41, x27
x43 = and i128 x35, 18446744073709551615
x44 = zext i64 x21 to i128
x45 = add nuw nsw i128 x43, x44
x46 = lshr i128 x45, 64
x47 = add nuw nsw i128 x46, x18
x48 = add nuw nsw i128 x47, x39
x49 = trunc i128 x48 to i64
store i64 x42, ptr x0, align 8
x50 = getelementptr inbounds [4 x i64], ptr x0, i64 0, i64 1
store i64 x42, ptr x50, align 8
x51 = getelementptr inbounds [4 x i64], ptr x0, i64 0, i64 2
store i64 x49, ptr x51, align 8
x52 = getelementptr inbounds [4 x i64], ptr x0, i64 0, i64 3
store i64 x49, ptr x52, align 8
ret void