; ModuleID = 'curve25519_64_mul.e9867dee1a61f2a0-cgu.0'
source_filename = "curve25519_64_mul.e9867dee1a61f2a0-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @fiat_25519_carry_mul(ptr noalias nocapture noundef writeonly align 8 dereferenceable(40) %out1, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %arg1, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %arg2) unnamed_addr #0 {
start:
  %_0.i = getelementptr inbounds [5 x i64], ptr %arg1, i64 0, i64 4
  %_6 = load i64, ptr %_0.i, align 8, !noundef !3
  %_5 = zext i64 %_6 to i128
  %_0.i1 = getelementptr inbounds [5 x i64], ptr %arg2, i64 0, i64 4
  %_10 = load i64, ptr %_0.i1, align 8, !noundef !3
  %_9 = mul i64 %_10, 19
  %_8 = zext i64 %_9 to i128
  %x1 = mul nuw i128 %_8, %_5
  %_0.i3 = getelementptr inbounds [5 x i64], ptr %arg2, i64 0, i64 3
  %_18 = load i64, ptr %_0.i3, align 8, !noundef !3
  %_17 = mul i64 %_18, 19
  %_16 = zext i64 %_17 to i128
  %x2 = mul nuw i128 %_16, %_5
  %_0.i5 = getelementptr inbounds [5 x i64], ptr %arg2, i64 0, i64 2
  %_26 = load i64, ptr %_0.i5, align 8, !noundef !3
  %_25 = mul i64 %_26, 19
  %_24 = zext i64 %_25 to i128
  %x3 = mul nuw i128 %_24, %_5
  %_0.i7 = getelementptr inbounds [5 x i64], ptr %arg2, i64 0, i64 1
  %_34 = load i64, ptr %_0.i7, align 8, !noundef !3
  %_33 = mul i64 %_34, 19
  %_32 = zext i64 %_33 to i128
  %x4 = mul nuw i128 %_32, %_5
  %_0.i8 = getelementptr inbounds [5 x i64], ptr %arg1, i64 0, i64 3
  %_38 = load i64, ptr %_0.i8, align 8, !noundef !3
  %_37 = zext i64 %_38 to i128
  %x5 = mul nuw i128 %_37, %_8
  %x6 = mul nuw i128 %_37, %_16
  %x7 = mul nuw i128 %_37, %_24
  %_0.i14 = getelementptr inbounds [5 x i64], ptr %arg1, i64 0, i64 2
  %_62 = load i64, ptr %_0.i14, align 8, !noundef !3
  %_61 = zext i64 %_62 to i128
  %x8 = mul nuw i128 %_61, %_8
  %x9 = mul nuw i128 %_61, %_16
  %_0.i18 = getelementptr inbounds [5 x i64], ptr %arg1, i64 0, i64 1
  %_78 = load i64, ptr %_0.i18, align 8, !noundef !3
  %_77 = zext i64 %_78 to i128
  %x10 = mul nuw i128 %_77, %_8
  %_89 = load i64, ptr %arg2, align 8, !noundef !3
  %_88 = zext i64 %_89 to i128
  %x11 = mul nuw i128 %_88, %_5
  %_95 = zext i64 %_34 to i128
  %x12 = mul nuw i128 %_37, %_95
  %x13 = mul nuw i128 %_88, %_37
  %_109 = zext i64 %_26 to i128
  %x14 = mul nuw i128 %_61, %_109
  %x15 = mul nuw i128 %_61, %_95
  %x16 = mul nuw i128 %_88, %_61
  %_130 = zext i64 %_18 to i128
  %x17 = mul nuw i128 %_77, %_130
  %x18 = mul nuw i128 %_77, %_109
  %x19 = mul nuw i128 %_77, %_95
  %x20 = mul nuw i128 %_88, %_77
  %_156 = load i64, ptr %arg1, align 8, !noundef !3
  %_155 = zext i64 %_156 to i128
  %_158 = zext i64 %_10 to i128
  %x21 = mul nuw i128 %_155, %_158
  %x22 = mul nuw i128 %_155, %_130
  %x23 = mul nuw i128 %_155, %_109
  %x24 = mul nuw i128 %_155, %_95
  %x25 = mul nuw i128 %_155, %_88
  %_192 = add i128 %x7, %x4
  %_191 = add i128 %_192, %x9
  %_190 = add i128 %_191, %x10
  %x26 = add i128 %_190, %x25
  %_194 = lshr i128 %x26, 51
  %0 = trunc i128 %x26 to i64
  %x28 = and i64 %0, 2251799813685247
  %_208 = add i128 %x5, %x2
  %_212 = add i128 %x6, %x3
  %_211 = add i128 %_212, %x8
  %_210 = add i128 %_211, %x20
  %x32 = add i128 %_210, %x24
  %_214 = and i128 %_194, 18446744073709551615
  %x33 = add i128 %x32, %_214
  %_216 = lshr i128 %x33, 51
  %1 = trunc i128 %x33 to i64
  %x35 = and i64 %1, 2251799813685247
  %_220 = and i128 %_216, 18446744073709551615
  %_207 = add i128 %_208, %x19
  %_206 = add i128 %_207, %x16
  %x31 = add i128 %_206, %x23
  %x36 = add i128 %x31, %_220
  %_222 = lshr i128 %x36, 51
  %2 = trunc i128 %x36 to i64
  %x38 = and i64 %2, 2251799813685247
  %_226 = and i128 %_222, 18446744073709551615
  %_204 = add i128 %x15, %x1
  %_203 = add i128 %_204, %x18
  %_202 = add i128 %_203, %x13
  %x30 = add i128 %_202, %x22
  %x39 = add i128 %x30, %_226
  %_228 = lshr i128 %x39, 51
  %3 = trunc i128 %x39 to i64
  %x41 = and i64 %3, 2251799813685247
  %_232 = and i128 %_228, 18446744073709551615
  %_200 = add i128 %x14, %x12
  %_199 = add i128 %_200, %x17
  %_198 = add i128 %_199, %x11
  %x29 = add i128 %_198, %x21
  %x42 = add i128 %x29, %_232
  %_234 = lshr i128 %x42, 51
  %x43 = trunc i128 %_234 to i64
  %4 = trunc i128 %x42 to i64
  %x44 = and i64 %4, 2251799813685247
  %x45 = mul i64 %x43, 19
  %x46 = add i64 %x45, %x28
  %x47 = lshr i64 %x46, 51
  %x48 = and i64 %x46, 2251799813685247
  %x49 = add nuw nsw i64 %x47, %x35
  %_243 = lshr i64 %x49, 51
  %x51 = and i64 %x49, 2251799813685247
  %x52 = add nuw nsw i64 %_243, %x38
  store i64 %x48, ptr %out1, align 8
  %_0.i40 = getelementptr inbounds [5 x i64], ptr %out1, i64 0, i64 1
  store i64 %x51, ptr %_0.i40, align 8
  %_0.i41 = getelementptr inbounds [5 x i64], ptr %out1, i64 0, i64 2
  store i64 %x52, ptr %_0.i41, align 8
  %_0.i42 = getelementptr inbounds [5 x i64], ptr %out1, i64 0, i64 3
  store i64 %x41, ptr %_0.i42, align 8
  %_0.i43 = getelementptr inbounds [5 x i64], ptr %out1, i64 0, i64 4
  store i64 %x44, ptr %_0.i43, align 8
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)"}
!3 = !{}
