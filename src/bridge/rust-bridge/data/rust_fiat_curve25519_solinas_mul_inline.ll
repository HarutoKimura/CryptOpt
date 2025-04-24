; ModuleID = 'rust_fiat_curve25519_solinas_mul.3c20d5fb9e290536-cgu.0'
source_filename = "rust_fiat_curve25519_solinas_mul.3c20d5fb9e290536-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: write) uwtable
define void @fiat_curve25519_solinas_addcarryx_u64(ptr noalias nocapture noundef writeonly align 8 dereferenceable(8) %out1, ptr noalias nocapture noundef writeonly align 1 dereferenceable(1) %out2, i8 noundef %arg1, i64 noundef %arg2, i64 noundef %arg3) unnamed_addr #0 {
start:
  %_8 = zext i8 %arg1 to i128
  %_9 = zext i64 %arg2 to i128
  %_7 = add nuw nsw i128 %_9, %_8
  %_10 = zext i64 %arg3 to i128
  %x1 = add nuw nsw i128 %_7, %_10
  %x2 = trunc i128 %x1 to i64
  %_14 = lshr i128 %x1, 64
  %x3 = trunc i128 %_14 to i8
  store i64 %x2, ptr %out1, align 8
  store i8 %x3, ptr %out2, align 1
  ret void
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: write) uwtable
define void @fiat_curve25519_solinas_subborrowx_u64(ptr noalias nocapture noundef writeonly align 8 dereferenceable(8) %out1, ptr noalias nocapture noundef writeonly align 1 dereferenceable(1) %out2, i8 noundef %arg1, i64 noundef %arg2, i64 noundef %arg3) unnamed_addr #0 {
start:
  %_8 = zext i64 %arg2 to i128
  %_9 = zext i8 %arg1 to i128
  %_10 = zext i64 %arg3 to i128
  %0 = add nuw nsw i128 %_9, %_10
  %x1 = sub nsw i128 %_8, %0
  %_12 = ashr i128 %x1, 64
  %x2 = trunc i128 %_12 to i8
  %x3 = trunc i128 %x1 to i64
  store i64 %x3, ptr %out1, align 8
  %_15 = sub nsw i8 0, %x2
  store i8 %_15, ptr %out2, align 1
  ret void
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: write) uwtable
define void @fiat_curve25519_solinas_mulx_u64(ptr noalias nocapture noundef writeonly align 8 dereferenceable(8) %out1, ptr noalias nocapture noundef writeonly align 8 dereferenceable(8) %out2, i64 noundef %arg1, i64 noundef %arg2) unnamed_addr #0 {
start:
  %_6 = zext i64 %arg1 to i128
  %_7 = zext i64 %arg2 to i128
  %x1 = mul nuw i128 %_7, %_6
  %x2 = trunc i128 %x1 to i64
  %_11 = lshr i128 %x1, 64
  %x3 = trunc i128 %_11 to i64
  store i64 %x2, ptr %out1, align 8
  store i64 %x3, ptr %out2, align 8
  ret void
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: write) uwtable
define void @fiat_curve25519_solinas_cmovznz_u64(ptr noalias nocapture noundef writeonly align 8 dereferenceable(8) %out1, i8 noundef %arg1, i64 noundef %arg2, i64 noundef %arg3) unnamed_addr #0 {
start:
  %_10 = sub i8 0, %arg1
  %_9 = sext i8 %_10 to i64
  %_13 = and i64 %_9, %arg3
  %_15 = xor i64 %_9, -1
  %_14 = and i64 %_15, %arg2
  %x3 = or i64 %_13, %_14
  store i64 %x3, ptr %out1, align 8
  ret void
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable
define void @rust_fiat_curve25519_solinas_mul(ptr noalias nocapture noundef writeonly align 8 dereferenceable(32) %out1, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) %arg1, ptr noalias nocapture noundef readonly align 8 dereferenceable(32) %arg2) unnamed_addr #1 {
start:
  %0 = getelementptr inbounds [4 x i64], ptr %arg1, i64 0, i64 3
  %_9 = load i64, ptr %0, align 8, !noundef !3
  %1 = getelementptr inbounds [4 x i64], ptr %arg2, i64 0, i64 3
  %_10 = load i64, ptr %1, align 8, !noundef !3
  %_6.i = zext i64 %_9 to i128
  %_7.i = zext i64 %_10 to i128
  %x1.i = mul nuw i128 %_7.i, %_6.i
  %_11.i = lshr i128 %x1.i, 64
  %x3.i = trunc i128 %_11.i to i64
  %2 = getelementptr inbounds [4 x i64], ptr %arg2, i64 0, i64 2
  %_17 = load i64, ptr %2, align 8, !noundef !3
  %_7.i2 = zext i64 %_17 to i128
  %x1.i3 = mul nuw i128 %_7.i2, %_6.i
  %_11.i5 = lshr i128 %x1.i3, 64
  %3 = getelementptr inbounds [4 x i64], ptr %arg2, i64 0, i64 1
  %_24 = load i64, ptr %3, align 8, !noundef !3
  %_7.i8 = zext i64 %_24 to i128
  %x1.i9 = mul nuw i128 %_7.i8, %_6.i
  %_11.i11 = lshr i128 %x1.i9, 64
  %_31 = load i64, ptr %arg2, align 8, !noundef !3
  %_7.i14 = zext i64 %_31 to i128
  %x1.i15 = mul nuw i128 %_7.i14, %_6.i
  %_11.i17 = lshr i128 %x1.i15, 64
  %4 = getelementptr inbounds [4 x i64], ptr %arg1, i64 0, i64 2
  %_37 = load i64, ptr %4, align 8, !noundef !3
  %_6.i19 = zext i64 %_37 to i128
  %x1.i21 = mul nuw i128 %_6.i19, %_7.i
  %_11.i23 = lshr i128 %x1.i21, 64
  %x3.i24 = trunc i128 %_11.i23 to i64
  %x1.i27 = mul nuw i128 %_6.i19, %_7.i2
  %_11.i29 = lshr i128 %x1.i27, 64
  %x1.i33 = mul nuw i128 %_6.i19, %_7.i8
  %_11.i35 = lshr i128 %x1.i33, 64
  %x1.i39 = mul nuw i128 %_6.i19, %_7.i14
  %_11.i41 = lshr i128 %x1.i39, 64
  %5 = getelementptr inbounds [4 x i64], ptr %arg1, i64 0, i64 1
  %_65 = load i64, ptr %5, align 8, !noundef !3
  %_6.i43 = zext i64 %_65 to i128
  %x1.i45 = mul nuw i128 %_6.i43, %_7.i
  %_11.i47 = lshr i128 %x1.i45, 64
  %x3.i48 = trunc i128 %_11.i47 to i64
  %x1.i51 = mul nuw i128 %_6.i43, %_7.i2
  %_11.i53 = lshr i128 %x1.i51, 64
  %x1.i57 = mul nuw i128 %_6.i43, %_7.i8
  %_11.i59 = lshr i128 %x1.i57, 64
  %x1.i63 = mul nuw i128 %_6.i43, %_7.i14
  %_11.i65 = lshr i128 %x1.i63, 64
  %_93 = load i64, ptr %arg1, align 8, !noundef !3
  %_6.i67 = zext i64 %_93 to i128
  %x1.i69 = mul nuw i128 %_6.i67, %_7.i
  %_11.i71 = lshr i128 %x1.i69, 64
  %x1.i75 = mul nuw i128 %_6.i67, %_7.i2
  %_11.i77 = lshr i128 %x1.i75, 64
  %x1.i81 = mul nuw i128 %_6.i67, %_7.i8
  %_11.i83 = lshr i128 %x1.i81, 64
  %x1.i87 = mul nuw i128 %_6.i67, %_7.i14
  %_11.i89 = lshr i128 %x1.i87, 64
  %_10.i = and i128 %x1.i15, 18446744073709551615
  %x1.i91 = add nuw nsw i128 %_11.i77, %_10.i
  %_14.i = lshr i128 %x1.i91, 64
  %_10.i96 = and i128 %x1.i9, 18446744073709551615
  %_7.i95 = add nuw nsw i128 %_11.i71, %_10.i96 // %_11.i77 is carry and %10.i96 is 1st arg. 
  %x1.i97 = add nuw nsw i128 %_7.i95, %_14.i // (carry + arg1) + arg2
  %_14.i99 = lshr i128 %x1.i97, 64 //carry from %x1.i97 
  %x3.i100 = trunc i128 %_14.i99 to i64
  %x37 = add nuw i64 %x3.i100, %x3.i48
  %_9.i101 = and i128 %x1.i91, 18446744073709551615
  %_10.i102 = and i128 %x1.i33, 18446744073709551615
  %x1.i103 = add nuw nsw i128 %_9.i101, %_10.i102
  %_14.i105 = lshr i128 %x1.i103, 64
  %_9.i108 = and i128 %x1.i97, 18446744073709551615
  %_7.i109 = add nuw nsw i128 %_14.i105, %_11.i17
  %x1.i111 = add nuw nsw i128 %_7.i109, %_9.i108
  %_14.i113 = lshr i128 %x1.i111, 64
  %_9.i116 = zext i64 %x37 to i128
  %_7.i117 = add nuw nsw i128 %_14.i113, %_9.i116
  %_14.i119 = lshr i128 %_7.i117, 64
  %x3.i120 = trunc i128 %_14.i119 to i64
  %x44 = add nuw i64 %x3.i120, %x3.i24
  %_10.i122 = and i128 %x1.i39, 18446744073709551615
  %x1.i123 = add nuw nsw i128 %_11.i83, %_10.i122
  %_14.i125 = lshr i128 %x1.i123, 64
  %_9.i128 = and i128 %x1.i103, 18446744073709551615
  %_7.i129 = add nuw nsw i128 %_14.i125, %_11.i41
  %x1.i131 = add nuw nsw i128 %_7.i129, %_9.i128
  %_14.i133 = lshr i128 %x1.i131, 64
  %_9.i136 = and i128 %x1.i111, 18446744073709551615
  %_10.i138 = and i128 %x1.i27, 18446744073709551615
  %_7.i137 = add nuw nsw i128 %_14.i133, %_10.i138
  %x1.i139 = add nuw nsw i128 %_7.i137, %_9.i136
  %_14.i141 = lshr i128 %x1.i139, 64
  %_9.i144 = and i128 %_7.i117, 18446744073709551615
  %_10.i146 = and i128 %x1.i3, 18446744073709551615
  %_7.i145 = add nuw nsw i128 %_9.i144, %_10.i146
  %x1.i147 = add nuw nsw i128 %_7.i145, %_14.i141
  %_14.i149 = lshr i128 %x1.i147, 64
  %_9.i152 = zext i64 %x44 to i128
  %_7.i153 = add nuw nsw i128 %_14.i149, %_9.i152
  %_14.i155 = lshr i128 %_7.i153, 64
  %x3.i156 = trunc i128 %_14.i155 to i64
  %x55 = add nuw i64 %x3.i156, %x3.i
  %_9.i157 = and i128 %x1.i123, 18446744073709551615
  %_10.i158 = and i128 %x1.i57, 18446744073709551615
  %x1.i159 = add nuw nsw i128 %_9.i157, %_10.i158
  %_14.i161 = lshr i128 %x1.i159, 64
  %_9.i164 = and i128 %x1.i131, 18446744073709551615
  %_10.i166 = and i128 %x1.i51, 18446744073709551615
  %_7.i165 = add nuw nsw i128 %_14.i161, %_10.i166
  %x1.i167 = add nuw nsw i128 %_7.i165, %_9.i164
  %_14.i169 = lshr i128 %x1.i167, 64
  %_9.i172 = and i128 %x1.i139, 18446744073709551615
  %_7.i173 = add nuw nsw i128 %_14.i169, %_11.i35
  %x1.i175 = add nuw nsw i128 %_7.i173, %_9.i172
  %_14.i177 = lshr i128 %x1.i175, 64
  %_9.i180 = and i128 %x1.i147, 18446744073709551615
  %_7.i181 = add nuw nsw i128 %_14.i177, %_11.i11
  %x1.i183 = add nuw nsw i128 %_7.i181, %_9.i180
  %_14.i185 = lshr i128 %x1.i183, 64
  %_9.i188 = and i128 %_7.i153, 18446744073709551615
  %_7.i189 = add nuw nsw i128 %_14.i185, %_9.i188
  %_14.i191 = lshr i128 %_7.i189, 64
  %6 = trunc i128 %_14.i191 to i64
  %x2.i196 = add i64 %x55, %6
  %_10.i200 = and i128 %x1.i63, 18446744073709551615
  %x1.i201 = add nuw nsw i128 %_11.i89, %_10.i200
  %_14.i203 = lshr i128 %x1.i201, 64
  %_9.i206 = and i128 %x1.i159, 18446744073709551615
  %_7.i207 = add nuw nsw i128 %_14.i203, %_11.i65
  %x1.i209 = add nuw nsw i128 %_7.i207, %_9.i206
  %_14.i211 = lshr i128 %x1.i209, 64
  %_9.i214 = and i128 %x1.i167, 18446744073709551615
  %_7.i215 = add nuw nsw i128 %_14.i211, %_11.i59
  %x1.i217 = add nuw nsw i128 %_7.i215, %_9.i214
  %_14.i219 = lshr i128 %x1.i217, 64
  %_9.i222 = and i128 %x1.i175, 18446744073709551615
  %_10.i224 = and i128 %x1.i45, 18446744073709551615
  %_7.i223 = add nuw nsw i128 %_14.i219, %_10.i224
  %x1.i225 = add nuw nsw i128 %_7.i223, %_9.i222
  %_14.i227 = lshr i128 %x1.i225, 64
  %_9.i230 = and i128 %x1.i183, 18446744073709551615
  %_10.i232 = and i128 %x1.i21, 18446744073709551615
  %_7.i231 = add nuw nsw i128 %_14.i227, %_10.i232
  %x1.i233 = add nuw nsw i128 %_7.i231, %_9.i230
  %_14.i235 = lshr i128 %x1.i233, 64
  %_9.i238 = and i128 %_7.i189, 18446744073709551615
  %_10.i240 = and i128 %x1.i, 18446744073709551615
  %_7.i239 = add nuw nsw i128 %_9.i238, %_10.i240
  %x1.i241 = add nuw nsw i128 %_7.i239, %_14.i235
  %_14.i243 = lshr i128 %x1.i241, 64
  %7 = trunc i128 %_14.i243 to i64
  %x2.i248 = add i64 %x2.i196, %7
  %_9.i251 = and i128 %x1.i201, 18446744073709551615
  %_10.i252 = and i128 %x1.i81, 18446744073709551615
  %x1.i253 = add nuw nsw i128 %_9.i251, %_10.i252
  %_14.i255 = lshr i128 %x1.i253, 64
  %_9.i258 = and i128 %x1.i209, 18446744073709551615
  %_10.i260 = and i128 %x1.i75, 18446744073709551615
  %_7.i259 = add nuw nsw i128 %_14.i255, %_10.i260
  %x1.i261 = add nuw nsw i128 %_7.i259, %_9.i258
  %_14.i263 = lshr i128 %x1.i261, 64
  %_9.i266 = and i128 %x1.i217, 18446744073709551615
  %_10.i268 = and i128 %x1.i69, 18446744073709551615
  %_7.i267 = add nuw nsw i128 %_14.i263, %_10.i268
  %x1.i269 = add nuw nsw i128 %_7.i267, %_9.i266
  %_14.i271 = lshr i128 %x1.i269, 64
  %_9.i274 = and i128 %x1.i225, 18446744073709551615
  %_7.i275 = add nuw nsw i128 %_14.i271, %_11.i53
  %x1.i277 = add nuw nsw i128 %_7.i275, %_9.i274
  %_14.i279 = lshr i128 %x1.i277, 64
  %_9.i282 = and i128 %x1.i233, 18446744073709551615
  %_7.i283 = add nuw nsw i128 %_14.i279, %_11.i29
  %x1.i285 = add nuw nsw i128 %_7.i283, %_9.i282
  %_14.i287 = lshr i128 %x1.i285, 64
  %_9.i290 = and i128 %x1.i241, 18446744073709551615
  %_7.i291 = add nuw nsw i128 %_14.i287, %_11.i5
  %x1.i293 = add nuw nsw i128 %_7.i291, %_9.i290
  %_14.i295 = lshr i128 %x1.i293, 64
  %8 = trunc i128 %_14.i295 to i64
  %x2.i300 = add i64 %x2.i248, %8
  %_7.i303 = zext i64 %x2.i300 to i128
  %x1.i304 = mul nuw nsw i128 %_7.i303, 38
  %_11.i306 = lshr i128 %x1.i304, 64
  %x3.i307 = trunc i128 %_11.i306 to i64
  %_7.i308 = and i128 %x1.i293, 18446744073709551615
  %x1.i309 = mul nuw nsw i128 %_7.i308, 38
  %_11.i311 = lshr i128 %x1.i309, 64
  %_7.i313 = and i128 %x1.i285, 18446744073709551615
  %x1.i314 = mul nuw nsw i128 %_7.i313, 38
  %_11.i316 = lshr i128 %x1.i314, 64
  %_7.i318 = and i128 %x1.i277, 18446744073709551615
  %x1.i319 = mul nuw nsw i128 %_7.i318, 38
  %_11.i321 = lshr i128 %x1.i319, 64
  %_9.i323 = and i128 %x1.i253, 18446744073709551615
  %_10.i324 = and i128 %x1.i314, 18446744073709551614
  %x1.i325 = add nuw nsw i128 %_10.i324, %_9.i323
  %_14.i327 = lshr i128 %x1.i325, 64
  %_9.i330 = and i128 %x1.i261, 18446744073709551615
  %_7.i331 = add nuw nsw i128 %_14.i327, %_9.i330
  %_10.i332 = and i128 %x1.i309, 18446744073709551614
  %x1.i333 = add nuw nsw i128 %_7.i331, %_10.i332
  %_14.i335 = lshr i128 %x1.i333, 64
  %_9.i338 = and i128 %x1.i269, 18446744073709551615
  %_7.i339 = add nuw nsw i128 %_14.i335, %_9.i338
  %_10.i340 = and i128 %x1.i304, 18446744073709551614
  %x1.i341 = add nuw nsw i128 %_7.i339, %_10.i340
  %_14.i343 = lshr i128 %x1.i341, 64
  %x3.i344 = trunc i128 %_14.i343 to i64
  %x110 = add nuw nsw i64 %x3.i344, %x3.i307
  %_9.i345 = and i128 %x1.i87, 18446744073709551615
  %_10.i346 = and i128 %x1.i319, 18446744073709551614
  %x1.i347 = add nuw nsw i128 %_10.i346, %_9.i345
  %_14.i349 = lshr i128 %x1.i347, 64
  %_9.i352 = and i128 %x1.i325, 18446744073709551615
  %_7.i353 = add nuw nsw i128 %_14.i349, %_11.i321
  %x1.i355 = add nuw nsw i128 %_7.i353, %_9.i352
  %_14.i357 = lshr i128 %x1.i355, 64
  %_9.i360 = and i128 %x1.i333, 18446744073709551615
  %_7.i361 = add nuw nsw i128 %_14.i357, %_11.i316
  %x1.i363 = add nuw nsw i128 %_7.i361, %_9.i360
  %_14.i365 = lshr i128 %x1.i363, 64
  %_9.i368 = and i128 %x1.i341, 18446744073709551615
  %_7.i369 = add nuw nsw i128 %_14.i365, %_11.i311
  %x1.i371 = add nuw nsw i128 %_7.i369, %_9.i368
  %_14.i373 = lshr i128 %x1.i371, 64
  %x3.i374 = trunc i128 %_14.i373 to i64
  %x119 = add nuw nsw i64 %x110, %x3.i374
  %x1.i376 = mul nuw nsw i64 %x119, 38
  %_9.i380 = and i128 %x1.i347, 18446744073709551615
  %_10.i381 = zext i64 %x1.i376 to i128
  %x1.i382 = add nuw nsw i128 %_9.i380, %_10.i381
  %_14.i384 = lshr i128 %x1.i382, 64
  %_9.i387 = and i128 %x1.i355, 18446744073709551615
  %_7.i388 = add nuw nsw i128 %_14.i384, %_9.i387
  %x2.i389 = trunc i128 %_7.i388 to i64
  %_14.i390 = lshr i128 %_7.i388, 64
  %_9.i393 = and i128 %x1.i363, 18446744073709551615
  %_7.i394 = add nuw nsw i128 %_14.i390, %_9.i393
  %x2.i395 = trunc i128 %_7.i394 to i64
  %_14.i396 = lshr i128 %_7.i394, 64
  %_9.i399 = and i128 %x1.i371, 18446744073709551615
  %_7.i400 = add nuw nsw i128 %_14.i396, %_9.i399
  %x2.i401 = trunc i128 %_7.i400 to i64
  %_14.i402 = lshr i128 %_7.i400, 64
  %x3.i403 = trunc i128 %_14.i402 to i64
  %_10.i404 = sub nsw i64 0, %x3.i403
  %_13.i = and i64 %_10.i404, 38
  %9 = trunc i128 %x1.i382 to i64
  %x2.i409 = add i64 %_13.i, %9
  store i64 %x2.i409, ptr %out1, align 8
  %10 = getelementptr inbounds [4 x i64], ptr %out1, i64 0, i64 1
  store i64 %x2.i389, ptr %10, align 8
  %11 = getelementptr inbounds [4 x i64], ptr %out1, i64 0, i64 2
  store i64 %x2.i395, ptr %11, align 8
  %12 = getelementptr inbounds [4 x i64], ptr %out1, i64 0, i64 3
  store i64 %x2.i401, ptr %12, align 8
  ret void
}

attributes #0 = { inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: write) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #1 = { inlinehint mustprogress nofree norecurse nosync nounwind nonlazybind willreturn memory(argmem: readwrite) uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)"}
!3 = !{}
