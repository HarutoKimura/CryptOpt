; ModuleID = 'rust_fiat_curve25519_solinas_mul_small.f59498c6242c70c3-cgu.0'
source_filename = "rust_fiat_curve25519_solinas_mul_small.f59498c6242c70c3-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"
; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @rust_fiat_curve25519_solinas_mul_small(ptr noalias nocapture noundef writeonly align 8 dereferenceable(32) x0, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) x1, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) x2) unnamed_addr #0 {
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
x21 = zext i64 x20 to i128
x22 = mul nuw i128 x21, x8
x23 = lshr i128 x22, 64 // yes, I am marged: lshr+trunc
x24 = mul i64 x20, x13
x25 = getelementptr inbounds [4 x i64], ptr x1, i64 0, i64 1
x26 = load i64, ptr x25, align 8, !noundef !3
x27 = zext i64 x26 to i128
x28 = mul nuw i128 x27, x8
x29 = lshr i128 x28, 64 // yes, I am marged: lshr+trunc
x30 = load i64, ptr x1, align 8, !noundef !3
x31 = zext i64 x30 to i128
x32 = mul nuw i128 x31, x8
x33 = lshr i128 x32, 64
x34 = mul nuw i128 x31, x11
x35 = lshr i128 x34, 64
x36 = and i128 x17, 18446744073709551615
x37 = add nuw nsw i128 x35, x36
x38 = lshr i128 x37, 64
x39 = zext i64 x14 to i128
x40 = add nuw nsw i128 x33, x39
x41 = add nuw nsw i128 x40, x38
x42 = lshr i128 x41, 64 // yes, I am marged: lshr+trunc
x43 = add nuw i64 x42, x29
x44 = and i128 x37, 18446744073709551615
x45 = zext i64 x24 to i128
x46 = add nuw nsw i128 x44, x45
x47 = trunc i128 x46 to i64
x48 = lshr i128 x46, 64
x49 = and i128 x41, 18446744073709551615
x50 = add nuw nsw i128 x48, x18
x51 = add nuw nsw i128 x50, x49
x52 = lshr i128 x51, 64
x53 = zext i64 x43 to i128
x54 = add nuw nsw i128 x52, x53
x55 = trunc i128 x54 to i64
x56 = lshr i128 x54, 64 // yes, I am marged: lshr+trunc
x57 = add nuw i64 x56, x23
store i64 x43, ptr x0, align 8
x58 = getelementptr inbounds [4 x i64], ptr x0, i64 0, i64 1
store i64 x47, ptr x58, align 8
x59 = getelementptr inbounds [4 x i64], ptr x0, i64 0, i64 2
store i64 x55, ptr x59, align 8
x60 = getelementptr inbounds [4 x i64], ptr x0, i64 0, i64 3
store i64 x57, ptr x60, align 8
ret void