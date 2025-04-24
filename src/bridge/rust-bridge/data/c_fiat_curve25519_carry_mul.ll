; ModuleID = 'c_fiat_curve25519_carry_mul.c'
source_filename = "c_fiat_curve25519_carry_mul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.compiler.used = appending global [1 x ptr] [ptr @fiat_25519_carry_mul], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define void @fiat_25519_carry_mul(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i128, align 16
  %8 = alloca i128, align 16
  %9 = alloca i128, align 16
  %10 = alloca i128, align 16
  %11 = alloca i128, align 16
  %12 = alloca i128, align 16
  %13 = alloca i128, align 16
  %14 = alloca i128, align 16
  %15 = alloca i128, align 16
  %16 = alloca i128, align 16
  %17 = alloca i128, align 16
  %18 = alloca i128, align 16
  %19 = alloca i128, align 16
  %20 = alloca i128, align 16
  %21 = alloca i128, align 16
  %22 = alloca i128, align 16
  %23 = alloca i128, align 16
  %24 = alloca i128, align 16
  %25 = alloca i128, align 16
  %26 = alloca i128, align 16
  %27 = alloca i128, align 16
  %28 = alloca i128, align 16
  %29 = alloca i128, align 16
  %30 = alloca i128, align 16
  %31 = alloca i128, align 16
  %32 = alloca i128, align 16
  %33 = alloca i64, align 8
  %34 = alloca i64, align 8
  %35 = alloca i128, align 16
  %36 = alloca i128, align 16
  %37 = alloca i128, align 16
  %38 = alloca i128, align 16
  %39 = alloca i128, align 16
  %40 = alloca i64, align 8
  %41 = alloca i64, align 8
  %42 = alloca i128, align 16
  %43 = alloca i64, align 8
  %44 = alloca i64, align 8
  %45 = alloca i128, align 16
  %46 = alloca i64, align 8
  %47 = alloca i64, align 8
  %48 = alloca i128, align 16
  %49 = alloca i64, align 8
  %50 = alloca i64, align 8
  %51 = alloca i64, align 8
  %52 = alloca i64, align 8
  %53 = alloca i64, align 8
  %54 = alloca i64, align 8
  %55 = alloca i64, align 8
  %56 = alloca i8, align 1
  %57 = alloca i64, align 8
  %58 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %59 = load ptr, ptr %5, align 8
  %60 = getelementptr inbounds i64, ptr %59, i64 4
  %61 = load i64, ptr %60, align 8
  %62 = zext i64 %61 to i128
  %63 = load ptr, ptr %6, align 8
  %64 = getelementptr inbounds i64, ptr %63, i64 4
  %65 = load i64, ptr %64, align 8
  %66 = mul i64 %65, 19
  %67 = zext i64 %66 to i128
  %68 = mul i128 %62, %67
  store i128 %68, ptr %7, align 16
  %69 = load ptr, ptr %5, align 8
  %70 = getelementptr inbounds i64, ptr %69, i64 4
  %71 = load i64, ptr %70, align 8
  %72 = zext i64 %71 to i128
  %73 = load ptr, ptr %6, align 8
  %74 = getelementptr inbounds i64, ptr %73, i64 3
  %75 = load i64, ptr %74, align 8
  %76 = mul i64 %75, 19
  %77 = zext i64 %76 to i128
  %78 = mul i128 %72, %77
  store i128 %78, ptr %8, align 16
  %79 = load ptr, ptr %5, align 8
  %80 = getelementptr inbounds i64, ptr %79, i64 4
  %81 = load i64, ptr %80, align 8
  %82 = zext i64 %81 to i128
  %83 = load ptr, ptr %6, align 8
  %84 = getelementptr inbounds i64, ptr %83, i64 2
  %85 = load i64, ptr %84, align 8
  %86 = mul i64 %85, 19
  %87 = zext i64 %86 to i128
  %88 = mul i128 %82, %87
  store i128 %88, ptr %9, align 16
  %89 = load ptr, ptr %5, align 8
  %90 = getelementptr inbounds i64, ptr %89, i64 4
  %91 = load i64, ptr %90, align 8
  %92 = zext i64 %91 to i128
  %93 = load ptr, ptr %6, align 8
  %94 = getelementptr inbounds i64, ptr %93, i64 1
  %95 = load i64, ptr %94, align 8
  %96 = mul i64 %95, 19
  %97 = zext i64 %96 to i128
  %98 = mul i128 %92, %97
  store i128 %98, ptr %10, align 16
  %99 = load ptr, ptr %5, align 8
  %100 = getelementptr inbounds i64, ptr %99, i64 3
  %101 = load i64, ptr %100, align 8
  %102 = zext i64 %101 to i128
  %103 = load ptr, ptr %6, align 8
  %104 = getelementptr inbounds i64, ptr %103, i64 4
  %105 = load i64, ptr %104, align 8
  %106 = mul i64 %105, 19
  %107 = zext i64 %106 to i128
  %108 = mul i128 %102, %107
  store i128 %108, ptr %11, align 16
  %109 = load ptr, ptr %5, align 8
  %110 = getelementptr inbounds i64, ptr %109, i64 3
  %111 = load i64, ptr %110, align 8
  %112 = zext i64 %111 to i128
  %113 = load ptr, ptr %6, align 8
  %114 = getelementptr inbounds i64, ptr %113, i64 3
  %115 = load i64, ptr %114, align 8
  %116 = mul i64 %115, 19
  %117 = zext i64 %116 to i128
  %118 = mul i128 %112, %117
  store i128 %118, ptr %12, align 16
  %119 = load ptr, ptr %5, align 8
  %120 = getelementptr inbounds i64, ptr %119, i64 3
  %121 = load i64, ptr %120, align 8
  %122 = zext i64 %121 to i128
  %123 = load ptr, ptr %6, align 8
  %124 = getelementptr inbounds i64, ptr %123, i64 2
  %125 = load i64, ptr %124, align 8
  %126 = mul i64 %125, 19
  %127 = zext i64 %126 to i128
  %128 = mul i128 %122, %127
  store i128 %128, ptr %13, align 16
  %129 = load ptr, ptr %5, align 8
  %130 = getelementptr inbounds i64, ptr %129, i64 2
  %131 = load i64, ptr %130, align 8
  %132 = zext i64 %131 to i128
  %133 = load ptr, ptr %6, align 8
  %134 = getelementptr inbounds i64, ptr %133, i64 4
  %135 = load i64, ptr %134, align 8
  %136 = mul i64 %135, 19
  %137 = zext i64 %136 to i128
  %138 = mul i128 %132, %137
  store i128 %138, ptr %14, align 16
  %139 = load ptr, ptr %5, align 8
  %140 = getelementptr inbounds i64, ptr %139, i64 2
  %141 = load i64, ptr %140, align 8
  %142 = zext i64 %141 to i128
  %143 = load ptr, ptr %6, align 8
  %144 = getelementptr inbounds i64, ptr %143, i64 3
  %145 = load i64, ptr %144, align 8
  %146 = mul i64 %145, 19
  %147 = zext i64 %146 to i128
  %148 = mul i128 %142, %147
  store i128 %148, ptr %15, align 16
  %149 = load ptr, ptr %5, align 8
  %150 = getelementptr inbounds i64, ptr %149, i64 1
  %151 = load i64, ptr %150, align 8
  %152 = zext i64 %151 to i128
  %153 = load ptr, ptr %6, align 8
  %154 = getelementptr inbounds i64, ptr %153, i64 4
  %155 = load i64, ptr %154, align 8
  %156 = mul i64 %155, 19
  %157 = zext i64 %156 to i128
  %158 = mul i128 %152, %157
  store i128 %158, ptr %16, align 16
  %159 = load ptr, ptr %5, align 8
  %160 = getelementptr inbounds i64, ptr %159, i64 4
  %161 = load i64, ptr %160, align 8
  %162 = zext i64 %161 to i128
  %163 = load ptr, ptr %6, align 8
  %164 = getelementptr inbounds i64, ptr %163, i64 0
  %165 = load i64, ptr %164, align 8
  %166 = zext i64 %165 to i128
  %167 = mul i128 %162, %166
  store i128 %167, ptr %17, align 16
  %168 = load ptr, ptr %5, align 8
  %169 = getelementptr inbounds i64, ptr %168, i64 3
  %170 = load i64, ptr %169, align 8
  %171 = zext i64 %170 to i128
  %172 = load ptr, ptr %6, align 8
  %173 = getelementptr inbounds i64, ptr %172, i64 1
  %174 = load i64, ptr %173, align 8
  %175 = zext i64 %174 to i128
  %176 = mul i128 %171, %175
  store i128 %176, ptr %18, align 16
  %177 = load ptr, ptr %5, align 8
  %178 = getelementptr inbounds i64, ptr %177, i64 3
  %179 = load i64, ptr %178, align 8
  %180 = zext i64 %179 to i128
  %181 = load ptr, ptr %6, align 8
  %182 = getelementptr inbounds i64, ptr %181, i64 0
  %183 = load i64, ptr %182, align 8
  %184 = zext i64 %183 to i128
  %185 = mul i128 %180, %184
  store i128 %185, ptr %19, align 16
  %186 = load ptr, ptr %5, align 8
  %187 = getelementptr inbounds i64, ptr %186, i64 2
  %188 = load i64, ptr %187, align 8
  %189 = zext i64 %188 to i128
  %190 = load ptr, ptr %6, align 8
  %191 = getelementptr inbounds i64, ptr %190, i64 2
  %192 = load i64, ptr %191, align 8
  %193 = zext i64 %192 to i128
  %194 = mul i128 %189, %193
  store i128 %194, ptr %20, align 16
  %195 = load ptr, ptr %5, align 8
  %196 = getelementptr inbounds i64, ptr %195, i64 2
  %197 = load i64, ptr %196, align 8
  %198 = zext i64 %197 to i128
  %199 = load ptr, ptr %6, align 8
  %200 = getelementptr inbounds i64, ptr %199, i64 1
  %201 = load i64, ptr %200, align 8
  %202 = zext i64 %201 to i128
  %203 = mul i128 %198, %202
  store i128 %203, ptr %21, align 16
  %204 = load ptr, ptr %5, align 8
  %205 = getelementptr inbounds i64, ptr %204, i64 2
  %206 = load i64, ptr %205, align 8
  %207 = zext i64 %206 to i128
  %208 = load ptr, ptr %6, align 8
  %209 = getelementptr inbounds i64, ptr %208, i64 0
  %210 = load i64, ptr %209, align 8
  %211 = zext i64 %210 to i128
  %212 = mul i128 %207, %211
  store i128 %212, ptr %22, align 16
  %213 = load ptr, ptr %5, align 8
  %214 = getelementptr inbounds i64, ptr %213, i64 1
  %215 = load i64, ptr %214, align 8
  %216 = zext i64 %215 to i128
  %217 = load ptr, ptr %6, align 8
  %218 = getelementptr inbounds i64, ptr %217, i64 3
  %219 = load i64, ptr %218, align 8
  %220 = zext i64 %219 to i128
  %221 = mul i128 %216, %220
  store i128 %221, ptr %23, align 16
  %222 = load ptr, ptr %5, align 8
  %223 = getelementptr inbounds i64, ptr %222, i64 1
  %224 = load i64, ptr %223, align 8
  %225 = zext i64 %224 to i128
  %226 = load ptr, ptr %6, align 8
  %227 = getelementptr inbounds i64, ptr %226, i64 2
  %228 = load i64, ptr %227, align 8
  %229 = zext i64 %228 to i128
  %230 = mul i128 %225, %229
  store i128 %230, ptr %24, align 16
  %231 = load ptr, ptr %5, align 8
  %232 = getelementptr inbounds i64, ptr %231, i64 1
  %233 = load i64, ptr %232, align 8
  %234 = zext i64 %233 to i128
  %235 = load ptr, ptr %6, align 8
  %236 = getelementptr inbounds i64, ptr %235, i64 1
  %237 = load i64, ptr %236, align 8
  %238 = zext i64 %237 to i128
  %239 = mul i128 %234, %238
  store i128 %239, ptr %25, align 16
  %240 = load ptr, ptr %5, align 8
  %241 = getelementptr inbounds i64, ptr %240, i64 1
  %242 = load i64, ptr %241, align 8
  %243 = zext i64 %242 to i128
  %244 = load ptr, ptr %6, align 8
  %245 = getelementptr inbounds i64, ptr %244, i64 0
  %246 = load i64, ptr %245, align 8
  %247 = zext i64 %246 to i128
  %248 = mul i128 %243, %247
  store i128 %248, ptr %26, align 16
  %249 = load ptr, ptr %5, align 8
  %250 = getelementptr inbounds i64, ptr %249, i64 0
  %251 = load i64, ptr %250, align 8
  %252 = zext i64 %251 to i128
  %253 = load ptr, ptr %6, align 8
  %254 = getelementptr inbounds i64, ptr %253, i64 4
  %255 = load i64, ptr %254, align 8
  %256 = zext i64 %255 to i128
  %257 = mul i128 %252, %256
  store i128 %257, ptr %27, align 16
  %258 = load ptr, ptr %5, align 8
  %259 = getelementptr inbounds i64, ptr %258, i64 0
  %260 = load i64, ptr %259, align 8
  %261 = zext i64 %260 to i128
  %262 = load ptr, ptr %6, align 8
  %263 = getelementptr inbounds i64, ptr %262, i64 3
  %264 = load i64, ptr %263, align 8
  %265 = zext i64 %264 to i128
  %266 = mul i128 %261, %265
  store i128 %266, ptr %28, align 16
  %267 = load ptr, ptr %5, align 8
  %268 = getelementptr inbounds i64, ptr %267, i64 0
  %269 = load i64, ptr %268, align 8
  %270 = zext i64 %269 to i128
  %271 = load ptr, ptr %6, align 8
  %272 = getelementptr inbounds i64, ptr %271, i64 2
  %273 = load i64, ptr %272, align 8
  %274 = zext i64 %273 to i128
  %275 = mul i128 %270, %274
  store i128 %275, ptr %29, align 16
  %276 = load ptr, ptr %5, align 8
  %277 = getelementptr inbounds i64, ptr %276, i64 0
  %278 = load i64, ptr %277, align 8
  %279 = zext i64 %278 to i128
  %280 = load ptr, ptr %6, align 8
  %281 = getelementptr inbounds i64, ptr %280, i64 1
  %282 = load i64, ptr %281, align 8
  %283 = zext i64 %282 to i128
  %284 = mul i128 %279, %283
  store i128 %284, ptr %30, align 16
  %285 = load ptr, ptr %5, align 8
  %286 = getelementptr inbounds i64, ptr %285, i64 0
  %287 = load i64, ptr %286, align 8
  %288 = zext i64 %287 to i128
  %289 = load ptr, ptr %6, align 8
  %290 = getelementptr inbounds i64, ptr %289, i64 0
  %291 = load i64, ptr %290, align 8
  %292 = zext i64 %291 to i128
  %293 = mul i128 %288, %292
  store i128 %293, ptr %31, align 16
  %294 = load i128, ptr %31, align 16
  %295 = load i128, ptr %16, align 16
  %296 = load i128, ptr %15, align 16
  %297 = load i128, ptr %13, align 16
  %298 = load i128, ptr %10, align 16
  %299 = add i128 %297, %298
  %300 = add i128 %296, %299
  %301 = add i128 %295, %300
  %302 = add i128 %294, %301
  store i128 %302, ptr %32, align 16
  %303 = load i128, ptr %32, align 16
  %304 = lshr i128 %303, 51
  %305 = trunc i128 %304 to i64
  store i64 %305, ptr %33, align 8
  %306 = load i128, ptr %32, align 16
  %307 = and i128 %306, 2251799813685247
  %308 = trunc i128 %307 to i64
  store i64 %308, ptr %34, align 8
  %309 = load i128, ptr %27, align 16
  %310 = load i128, ptr %23, align 16
  %311 = load i128, ptr %20, align 16
  %312 = load i128, ptr %18, align 16
  %313 = load i128, ptr %17, align 16
  %314 = add i128 %312, %313
  %315 = add i128 %311, %314
  %316 = add i128 %310, %315
  %317 = add i128 %309, %316
  store i128 %317, ptr %35, align 16
  %318 = load i128, ptr %28, align 16
  %319 = load i128, ptr %24, align 16
  %320 = load i128, ptr %21, align 16
  %321 = load i128, ptr %19, align 16
  %322 = load i128, ptr %7, align 16
  %323 = add i128 %321, %322
  %324 = add i128 %320, %323
  %325 = add i128 %319, %324
  %326 = add i128 %318, %325
  store i128 %326, ptr %36, align 16
  %327 = load i128, ptr %29, align 16
  %328 = load i128, ptr %25, align 16
  %329 = load i128, ptr %22, align 16
  %330 = load i128, ptr %11, align 16
  %331 = load i128, ptr %8, align 16
  %332 = add i128 %330, %331
  %333 = add i128 %329, %332
  %334 = add i128 %328, %333
  %335 = add i128 %327, %334
  store i128 %335, ptr %37, align 16
  %336 = load i128, ptr %30, align 16
  %337 = load i128, ptr %26, align 16
  %338 = load i128, ptr %14, align 16
  %339 = load i128, ptr %12, align 16
  %340 = load i128, ptr %9, align 16
  %341 = add i128 %339, %340
  %342 = add i128 %338, %341
  %343 = add i128 %337, %342
  %344 = add i128 %336, %343
  store i128 %344, ptr %38, align 16
  %345 = load i64, ptr %33, align 8
  %346 = zext i64 %345 to i128
  %347 = load i128, ptr %38, align 16
  %348 = add i128 %346, %347
  store i128 %348, ptr %39, align 16
  %349 = load i128, ptr %39, align 16
  %350 = lshr i128 %349, 51
  %351 = trunc i128 %350 to i64
  store i64 %351, ptr %40, align 8
  %352 = load i128, ptr %39, align 16
  %353 = and i128 %352, 2251799813685247
  %354 = trunc i128 %353 to i64
  store i64 %354, ptr %41, align 8
  %355 = load i64, ptr %40, align 8
  %356 = zext i64 %355 to i128
  %357 = load i128, ptr %37, align 16
  %358 = add i128 %356, %357
  store i128 %358, ptr %42, align 16
  %359 = load i128, ptr %42, align 16
  %360 = lshr i128 %359, 51
  %361 = trunc i128 %360 to i64
  store i64 %361, ptr %43, align 8
  %362 = load i128, ptr %42, align 16
  %363 = and i128 %362, 2251799813685247
  %364 = trunc i128 %363 to i64
  store i64 %364, ptr %44, align 8
  %365 = load i64, ptr %43, align 8
  %366 = zext i64 %365 to i128
  %367 = load i128, ptr %36, align 16
  %368 = add i128 %366, %367
  store i128 %368, ptr %45, align 16
  %369 = load i128, ptr %45, align 16
  %370 = lshr i128 %369, 51
  %371 = trunc i128 %370 to i64
  store i64 %371, ptr %46, align 8
  %372 = load i128, ptr %45, align 16
  %373 = and i128 %372, 2251799813685247
  %374 = trunc i128 %373 to i64
  store i64 %374, ptr %47, align 8
  %375 = load i64, ptr %46, align 8
  %376 = zext i64 %375 to i128
  %377 = load i128, ptr %35, align 16
  %378 = add i128 %376, %377
  store i128 %378, ptr %48, align 16
  %379 = load i128, ptr %48, align 16
  %380 = lshr i128 %379, 51
  %381 = trunc i128 %380 to i64
  store i64 %381, ptr %49, align 8
  %382 = load i128, ptr %48, align 16
  %383 = and i128 %382, 2251799813685247
  %384 = trunc i128 %383 to i64
  store i64 %384, ptr %50, align 8
  %385 = load i64, ptr %49, align 8
  %386 = mul i64 %385, 19
  store i64 %386, ptr %51, align 8
  %387 = load i64, ptr %34, align 8
  %388 = load i64, ptr %51, align 8
  %389 = add i64 %387, %388
  store i64 %389, ptr %52, align 8
  %390 = load i64, ptr %52, align 8
  %391 = lshr i64 %390, 51
  store i64 %391, ptr %53, align 8
  %392 = load i64, ptr %52, align 8
  %393 = and i64 %392, 2251799813685247
  store i64 %393, ptr %54, align 8
  %394 = load i64, ptr %53, align 8
  %395 = load i64, ptr %41, align 8
  %396 = add i64 %394, %395
  store i64 %396, ptr %55, align 8
  %397 = load i64, ptr %55, align 8
  %398 = lshr i64 %397, 51
  %399 = trunc i64 %398 to i8
  store i8 %399, ptr %56, align 1
  %400 = load i64, ptr %55, align 8
  %401 = and i64 %400, 2251799813685247
  store i64 %401, ptr %57, align 8
  %402 = load i8, ptr %56, align 1
  %403 = zext i8 %402 to i64
  %404 = load i64, ptr %44, align 8
  %405 = add i64 %403, %404
  store i64 %405, ptr %58, align 8
  %406 = load i64, ptr %54, align 8
  %407 = load ptr, ptr %4, align 8
  %408 = getelementptr inbounds i64, ptr %407, i64 0
  store i64 %406, ptr %408, align 8
  %409 = load i64, ptr %57, align 8
  %410 = load ptr, ptr %4, align 8
  %411 = getelementptr inbounds i64, ptr %410, i64 1
  store i64 %409, ptr %411, align 8
  %412 = load i64, ptr %58, align 8
  %413 = load ptr, ptr %4, align 8
  %414 = getelementptr inbounds i64, ptr %413, i64 2
  store i64 %412, ptr %414, align 8
  %415 = load i64, ptr %47, align 8
  %416 = load ptr, ptr %4, align 8
  %417 = getelementptr inbounds i64, ptr %416, i64 3
  store i64 %415, ptr %417, align 8
  %418 = load i64, ptr %50, align 8
  %419 = load ptr, ptr %4, align 8
  %420 = getelementptr inbounds i64, ptr %419, i64 4
  store i64 %418, ptr %420, align 8
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"}
