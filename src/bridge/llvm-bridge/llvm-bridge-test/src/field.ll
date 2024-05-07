; ModuleID = 'field.c'
source_filename = "field.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @secp256k1_fe_mul_inner(ptr noundef %0, ptr noundef %1, ptr noalias noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i128, align 16
  %8 = alloca i128, align 16
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds i64, ptr %20, i64 0
  %22 = load i64, ptr %21, align 8
  store i64 %22, ptr %13, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds i64, ptr %23, i64 1
  %25 = load i64, ptr %24, align 8
  store i64 %25, ptr %14, align 8
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds i64, ptr %26, i64 2
  %28 = load i64, ptr %27, align 8
  store i64 %28, ptr %15, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds i64, ptr %29, i64 3
  %31 = load i64, ptr %30, align 8
  store i64 %31, ptr %16, align 8
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds i64, ptr %32, i64 4
  %34 = load i64, ptr %33, align 8
  store i64 %34, ptr %17, align 8
  store i64 4503599627370495, ptr %18, align 8
  store i64 68719492368, ptr %19, align 8
  %35 = load i64, ptr %13, align 8
  %36 = zext i64 %35 to i128
  %37 = load ptr, ptr %6, align 8
  %38 = getelementptr inbounds i64, ptr %37, i64 3
  %39 = load i64, ptr %38, align 8
  %40 = zext i64 %39 to i128
  %41 = mul nsw i128 %36, %40
  %42 = load i64, ptr %14, align 8
  %43 = zext i64 %42 to i128
  %44 = load ptr, ptr %6, align 8
  %45 = getelementptr inbounds i64, ptr %44, i64 2
  %46 = load i64, ptr %45, align 8
  %47 = zext i64 %46 to i128
  %48 = mul nsw i128 %43, %47
  %49 = add nsw i128 %41, %48
  %50 = load i64, ptr %15, align 8
  %51 = zext i64 %50 to i128
  %52 = load ptr, ptr %6, align 8
  %53 = getelementptr inbounds i64, ptr %52, i64 1
  %54 = load i64, ptr %53, align 8
  %55 = zext i64 %54 to i128
  %56 = mul nsw i128 %51, %55
  %57 = add nsw i128 %49, %56
  %58 = load i64, ptr %16, align 8
  %59 = zext i64 %58 to i128
  %60 = load ptr, ptr %6, align 8
  %61 = getelementptr inbounds i64, ptr %60, i64 0
  %62 = load i64, ptr %61, align 8
  %63 = zext i64 %62 to i128
  %64 = mul nsw i128 %59, %63
  %65 = add nsw i128 %57, %64
  store i128 %65, ptr %8, align 16
  %66 = load i64, ptr %17, align 8
  %67 = zext i64 %66 to i128
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds i64, ptr %68, i64 4
  %70 = load i64, ptr %69, align 8
  %71 = zext i64 %70 to i128
  %72 = mul nsw i128 %67, %71
  store i128 %72, ptr %7, align 16
  %73 = load i128, ptr %7, align 16
  %74 = trunc i128 %73 to i64
  %75 = zext i64 %74 to i128
  %76 = mul nsw i128 68719492368, %75
  %77 = load i128, ptr %8, align 16
  %78 = add nsw i128 %77, %76
  store i128 %78, ptr %8, align 16
  %79 = load i128, ptr %7, align 16
  %80 = ashr i128 %79, 64
  store i128 %80, ptr %7, align 16
  %81 = load i128, ptr %8, align 16
  %82 = and i128 %81, 4503599627370495
  %83 = trunc i128 %82 to i64
  store i64 %83, ptr %9, align 8
  %84 = load i128, ptr %8, align 16
  %85 = ashr i128 %84, 52
  store i128 %85, ptr %8, align 16
  %86 = load i64, ptr %13, align 8
  %87 = zext i64 %86 to i128
  %88 = load ptr, ptr %6, align 8
  %89 = getelementptr inbounds i64, ptr %88, i64 4
  %90 = load i64, ptr %89, align 8
  %91 = zext i64 %90 to i128
  %92 = mul nsw i128 %87, %91
  %93 = load i64, ptr %14, align 8
  %94 = zext i64 %93 to i128
  %95 = load ptr, ptr %6, align 8
  %96 = getelementptr inbounds i64, ptr %95, i64 3
  %97 = load i64, ptr %96, align 8
  %98 = zext i64 %97 to i128
  %99 = mul nsw i128 %94, %98
  %100 = add nsw i128 %92, %99
  %101 = load i64, ptr %15, align 8
  %102 = zext i64 %101 to i128
  %103 = load ptr, ptr %6, align 8
  %104 = getelementptr inbounds i64, ptr %103, i64 2
  %105 = load i64, ptr %104, align 8
  %106 = zext i64 %105 to i128
  %107 = mul nsw i128 %102, %106
  %108 = add nsw i128 %100, %107
  %109 = load i64, ptr %16, align 8
  %110 = zext i64 %109 to i128
  %111 = load ptr, ptr %6, align 8
  %112 = getelementptr inbounds i64, ptr %111, i64 1
  %113 = load i64, ptr %112, align 8
  %114 = zext i64 %113 to i128
  %115 = mul nsw i128 %110, %114
  %116 = add nsw i128 %108, %115
  %117 = load i64, ptr %17, align 8
  %118 = zext i64 %117 to i128
  %119 = load ptr, ptr %6, align 8
  %120 = getelementptr inbounds i64, ptr %119, i64 0
  %121 = load i64, ptr %120, align 8
  %122 = zext i64 %121 to i128
  %123 = mul nsw i128 %118, %122
  %124 = add nsw i128 %116, %123
  %125 = load i128, ptr %8, align 16
  %126 = add nsw i128 %125, %124
  store i128 %126, ptr %8, align 16
  %127 = load i128, ptr %7, align 16
  %128 = trunc i128 %127 to i64
  %129 = zext i64 %128 to i128
  %130 = mul nsw i128 281475040739328, %129
  %131 = load i128, ptr %8, align 16
  %132 = add nsw i128 %131, %130
  store i128 %132, ptr %8, align 16
  %133 = load i128, ptr %8, align 16
  %134 = and i128 %133, 4503599627370495
  %135 = trunc i128 %134 to i64
  store i64 %135, ptr %10, align 8
  %136 = load i128, ptr %8, align 16
  %137 = ashr i128 %136, 52
  store i128 %137, ptr %8, align 16
  %138 = load i64, ptr %10, align 8
  %139 = lshr i64 %138, 48
  store i64 %139, ptr %11, align 8
  %140 = load i64, ptr %10, align 8
  %141 = and i64 %140, 281474976710655
  store i64 %141, ptr %10, align 8
  %142 = load i64, ptr %13, align 8
  %143 = zext i64 %142 to i128
  %144 = load ptr, ptr %6, align 8
  %145 = getelementptr inbounds i64, ptr %144, i64 0
  %146 = load i64, ptr %145, align 8
  %147 = zext i64 %146 to i128
  %148 = mul nsw i128 %143, %147
  store i128 %148, ptr %7, align 16
  %149 = load i64, ptr %14, align 8
  %150 = zext i64 %149 to i128
  %151 = load ptr, ptr %6, align 8
  %152 = getelementptr inbounds i64, ptr %151, i64 4
  %153 = load i64, ptr %152, align 8
  %154 = zext i64 %153 to i128
  %155 = mul nsw i128 %150, %154
  %156 = load i64, ptr %15, align 8
  %157 = zext i64 %156 to i128
  %158 = load ptr, ptr %6, align 8
  %159 = getelementptr inbounds i64, ptr %158, i64 3
  %160 = load i64, ptr %159, align 8
  %161 = zext i64 %160 to i128
  %162 = mul nsw i128 %157, %161
  %163 = add nsw i128 %155, %162
  %164 = load i64, ptr %16, align 8
  %165 = zext i64 %164 to i128
  %166 = load ptr, ptr %6, align 8
  %167 = getelementptr inbounds i64, ptr %166, i64 2
  %168 = load i64, ptr %167, align 8
  %169 = zext i64 %168 to i128
  %170 = mul nsw i128 %165, %169
  %171 = add nsw i128 %163, %170
  %172 = load i64, ptr %17, align 8
  %173 = zext i64 %172 to i128
  %174 = load ptr, ptr %6, align 8
  %175 = getelementptr inbounds i64, ptr %174, i64 1
  %176 = load i64, ptr %175, align 8
  %177 = zext i64 %176 to i128
  %178 = mul nsw i128 %173, %177
  %179 = add nsw i128 %171, %178
  %180 = load i128, ptr %8, align 16
  %181 = add nsw i128 %180, %179
  store i128 %181, ptr %8, align 16
  %182 = load i128, ptr %8, align 16
  %183 = and i128 %182, 4503599627370495
  %184 = trunc i128 %183 to i64
  store i64 %184, ptr %12, align 8
  %185 = load i128, ptr %8, align 16
  %186 = ashr i128 %185, 52
  store i128 %186, ptr %8, align 16
  %187 = load i64, ptr %12, align 8
  %188 = shl i64 %187, 4
  %189 = load i64, ptr %11, align 8
  %190 = or i64 %188, %189
  store i64 %190, ptr %12, align 8
  %191 = load i64, ptr %12, align 8
  %192 = zext i64 %191 to i128
  %193 = mul nsw i128 %192, 4294968273
  %194 = load i128, ptr %7, align 16
  %195 = add nsw i128 %194, %193
  store i128 %195, ptr %7, align 16
  %196 = load i128, ptr %7, align 16
  %197 = and i128 %196, 4503599627370495
  %198 = trunc i128 %197 to i64
  %199 = load ptr, ptr %4, align 8
  %200 = getelementptr inbounds i64, ptr %199, i64 0
  store i64 %198, ptr %200, align 8
  %201 = load i128, ptr %7, align 16
  %202 = ashr i128 %201, 52
  store i128 %202, ptr %7, align 16
  %203 = load i64, ptr %13, align 8
  %204 = zext i64 %203 to i128
  %205 = load ptr, ptr %6, align 8
  %206 = getelementptr inbounds i64, ptr %205, i64 1
  %207 = load i64, ptr %206, align 8
  %208 = zext i64 %207 to i128
  %209 = mul nsw i128 %204, %208
  %210 = load i64, ptr %14, align 8
  %211 = zext i64 %210 to i128
  %212 = load ptr, ptr %6, align 8
  %213 = getelementptr inbounds i64, ptr %212, i64 0
  %214 = load i64, ptr %213, align 8
  %215 = zext i64 %214 to i128
  %216 = mul nsw i128 %211, %215
  %217 = add nsw i128 %209, %216
  %218 = load i128, ptr %7, align 16
  %219 = add nsw i128 %218, %217
  store i128 %219, ptr %7, align 16
  %220 = load i64, ptr %15, align 8
  %221 = zext i64 %220 to i128
  %222 = load ptr, ptr %6, align 8
  %223 = getelementptr inbounds i64, ptr %222, i64 4
  %224 = load i64, ptr %223, align 8
  %225 = zext i64 %224 to i128
  %226 = mul nsw i128 %221, %225
  %227 = load i64, ptr %16, align 8
  %228 = zext i64 %227 to i128
  %229 = load ptr, ptr %6, align 8
  %230 = getelementptr inbounds i64, ptr %229, i64 3
  %231 = load i64, ptr %230, align 8
  %232 = zext i64 %231 to i128
  %233 = mul nsw i128 %228, %232
  %234 = add nsw i128 %226, %233
  %235 = load i64, ptr %17, align 8
  %236 = zext i64 %235 to i128
  %237 = load ptr, ptr %6, align 8
  %238 = getelementptr inbounds i64, ptr %237, i64 2
  %239 = load i64, ptr %238, align 8
  %240 = zext i64 %239 to i128
  %241 = mul nsw i128 %236, %240
  %242 = add nsw i128 %234, %241
  %243 = load i128, ptr %8, align 16
  %244 = add nsw i128 %243, %242
  store i128 %244, ptr %8, align 16
  %245 = load i128, ptr %8, align 16
  %246 = and i128 %245, 4503599627370495
  %247 = mul nsw i128 %246, 68719492368
  %248 = load i128, ptr %7, align 16
  %249 = add nsw i128 %248, %247
  store i128 %249, ptr %7, align 16
  %250 = load i128, ptr %8, align 16
  %251 = ashr i128 %250, 52
  store i128 %251, ptr %8, align 16
  %252 = load i128, ptr %7, align 16
  %253 = and i128 %252, 4503599627370495
  %254 = trunc i128 %253 to i64
  %255 = load ptr, ptr %4, align 8
  %256 = getelementptr inbounds i64, ptr %255, i64 1
  store i64 %254, ptr %256, align 8
  %257 = load i128, ptr %7, align 16
  %258 = ashr i128 %257, 52
  store i128 %258, ptr %7, align 16
  %259 = load i64, ptr %13, align 8
  %260 = zext i64 %259 to i128
  %261 = load ptr, ptr %6, align 8
  %262 = getelementptr inbounds i64, ptr %261, i64 2
  %263 = load i64, ptr %262, align 8
  %264 = zext i64 %263 to i128
  %265 = mul nsw i128 %260, %264
  %266 = load i64, ptr %14, align 8
  %267 = zext i64 %266 to i128
  %268 = load ptr, ptr %6, align 8
  %269 = getelementptr inbounds i64, ptr %268, i64 1
  %270 = load i64, ptr %269, align 8
  %271 = zext i64 %270 to i128
  %272 = mul nsw i128 %267, %271
  %273 = add nsw i128 %265, %272
  %274 = load i64, ptr %15, align 8
  %275 = zext i64 %274 to i128
  %276 = load ptr, ptr %6, align 8
  %277 = getelementptr inbounds i64, ptr %276, i64 0
  %278 = load i64, ptr %277, align 8
  %279 = zext i64 %278 to i128
  %280 = mul nsw i128 %275, %279
  %281 = add nsw i128 %273, %280
  %282 = load i128, ptr %7, align 16
  %283 = add nsw i128 %282, %281
  store i128 %283, ptr %7, align 16
  %284 = load i64, ptr %16, align 8
  %285 = zext i64 %284 to i128
  %286 = load ptr, ptr %6, align 8
  %287 = getelementptr inbounds i64, ptr %286, i64 4
  %288 = load i64, ptr %287, align 8
  %289 = zext i64 %288 to i128
  %290 = mul nsw i128 %285, %289
  %291 = load i64, ptr %17, align 8
  %292 = zext i64 %291 to i128
  %293 = load ptr, ptr %6, align 8
  %294 = getelementptr inbounds i64, ptr %293, i64 3
  %295 = load i64, ptr %294, align 8
  %296 = zext i64 %295 to i128
  %297 = mul nsw i128 %292, %296
  %298 = add nsw i128 %290, %297
  %299 = load i128, ptr %8, align 16
  %300 = add nsw i128 %299, %298
  store i128 %300, ptr %8, align 16
  %301 = load i128, ptr %8, align 16
  %302 = trunc i128 %301 to i64
  %303 = zext i64 %302 to i128
  %304 = mul nsw i128 68719492368, %303
  %305 = load i128, ptr %7, align 16
  %306 = add nsw i128 %305, %304
  store i128 %306, ptr %7, align 16
  %307 = load i128, ptr %8, align 16
  %308 = ashr i128 %307, 64
  store i128 %308, ptr %8, align 16
  %309 = load i128, ptr %7, align 16
  %310 = and i128 %309, 4503599627370495
  %311 = trunc i128 %310 to i64
  %312 = load ptr, ptr %4, align 8
  %313 = getelementptr inbounds i64, ptr %312, i64 2
  store i64 %311, ptr %313, align 8
  %314 = load i128, ptr %7, align 16
  %315 = ashr i128 %314, 52
  store i128 %315, ptr %7, align 16
  %316 = load i128, ptr %8, align 16
  %317 = trunc i128 %316 to i64
  %318 = zext i64 %317 to i128
  %319 = mul nsw i128 281475040739328, %318
  %320 = load i64, ptr %9, align 8
  %321 = zext i64 %320 to i128
  %322 = add nsw i128 %319, %321
  %323 = load i128, ptr %7, align 16
  %324 = add nsw i128 %323, %322
  store i128 %324, ptr %7, align 16
  %325 = load i128, ptr %7, align 16
  %326 = and i128 %325, 4503599627370495
  %327 = trunc i128 %326 to i64
  %328 = load ptr, ptr %4, align 8
  %329 = getelementptr inbounds i64, ptr %328, i64 3
  store i64 %327, ptr %329, align 8
  %330 = load i128, ptr %7, align 16
  %331 = ashr i128 %330, 52
  store i128 %331, ptr %7, align 16
  %332 = load i64, ptr %10, align 8
  %333 = zext i64 %332 to i128
  %334 = load i128, ptr %7, align 16
  %335 = add nsw i128 %334, %333
  store i128 %335, ptr %7, align 16
  %336 = load i128, ptr %7, align 16
  %337 = trunc i128 %336 to i64
  %338 = load ptr, ptr %4, align 8
  %339 = getelementptr inbounds i64, ptr %338, i64 4
  store i64 %337, ptr %339, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @secp256k1_fe_sqr_inner(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i128, align 16
  %6 = alloca i128, align 16
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds i64, ptr %18, i64 0
  %20 = load i64, ptr %19, align 8
  store i64 %20, ptr %7, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds i64, ptr %21, i64 1
  %23 = load i64, ptr %22, align 8
  store i64 %23, ptr %8, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds i64, ptr %24, i64 2
  %26 = load i64, ptr %25, align 8
  store i64 %26, ptr %9, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds i64, ptr %27, i64 3
  %29 = load i64, ptr %28, align 8
  store i64 %29, ptr %10, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds i64, ptr %30, i64 4
  %32 = load i64, ptr %31, align 8
  store i64 %32, ptr %11, align 8
  store i64 4503599627370495, ptr %16, align 8
  store i64 68719492368, ptr %17, align 8
  %33 = load i64, ptr %7, align 8
  %34 = mul i64 %33, 2
  %35 = zext i64 %34 to i128
  %36 = load i64, ptr %10, align 8
  %37 = zext i64 %36 to i128
  %38 = mul nsw i128 %35, %37
  %39 = load i64, ptr %8, align 8
  %40 = mul i64 %39, 2
  %41 = zext i64 %40 to i128
  %42 = load i64, ptr %9, align 8
  %43 = zext i64 %42 to i128
  %44 = mul nsw i128 %41, %43
  %45 = add nsw i128 %38, %44
  store i128 %45, ptr %6, align 16
  %46 = load i64, ptr %11, align 8
  %47 = zext i64 %46 to i128
  %48 = load i64, ptr %11, align 8
  %49 = zext i64 %48 to i128
  %50 = mul nsw i128 %47, %49
  store i128 %50, ptr %5, align 16
  %51 = load i128, ptr %5, align 16
  %52 = trunc i128 %51 to i64
  %53 = zext i64 %52 to i128
  %54 = mul nsw i128 68719492368, %53
  %55 = load i128, ptr %6, align 16
  %56 = add nsw i128 %55, %54
  store i128 %56, ptr %6, align 16
  %57 = load i128, ptr %5, align 16
  %58 = ashr i128 %57, 64
  store i128 %58, ptr %5, align 16
  %59 = load i128, ptr %6, align 16
  %60 = and i128 %59, 4503599627370495
  %61 = trunc i128 %60 to i64
  store i64 %61, ptr %12, align 8
  %62 = load i128, ptr %6, align 16
  %63 = ashr i128 %62, 52
  store i128 %63, ptr %6, align 16
  %64 = load i64, ptr %11, align 8
  %65 = mul i64 %64, 2
  store i64 %65, ptr %11, align 8
  %66 = load i64, ptr %7, align 8
  %67 = zext i64 %66 to i128
  %68 = load i64, ptr %11, align 8
  %69 = zext i64 %68 to i128
  %70 = mul nsw i128 %67, %69
  %71 = load i64, ptr %8, align 8
  %72 = mul i64 %71, 2
  %73 = zext i64 %72 to i128
  %74 = load i64, ptr %10, align 8
  %75 = zext i64 %74 to i128
  %76 = mul nsw i128 %73, %75
  %77 = add nsw i128 %70, %76
  %78 = load i64, ptr %9, align 8
  %79 = zext i64 %78 to i128
  %80 = load i64, ptr %9, align 8
  %81 = zext i64 %80 to i128
  %82 = mul nsw i128 %79, %81
  %83 = add nsw i128 %77, %82
  %84 = load i128, ptr %6, align 16
  %85 = add nsw i128 %84, %83
  store i128 %85, ptr %6, align 16
  %86 = load i128, ptr %5, align 16
  %87 = trunc i128 %86 to i64
  %88 = zext i64 %87 to i128
  %89 = mul nsw i128 281475040739328, %88
  %90 = load i128, ptr %6, align 16
  %91 = add nsw i128 %90, %89
  store i128 %91, ptr %6, align 16
  %92 = load i128, ptr %6, align 16
  %93 = and i128 %92, 4503599627370495
  %94 = trunc i128 %93 to i64
  store i64 %94, ptr %13, align 8
  %95 = load i128, ptr %6, align 16
  %96 = ashr i128 %95, 52
  store i128 %96, ptr %6, align 16
  %97 = load i64, ptr %13, align 8
  %98 = ashr i64 %97, 48
  store i64 %98, ptr %14, align 8
  %99 = load i64, ptr %13, align 8
  %100 = and i64 %99, 281474976710655
  store i64 %100, ptr %13, align 8
  %101 = load i64, ptr %7, align 8
  %102 = zext i64 %101 to i128
  %103 = load i64, ptr %7, align 8
  %104 = zext i64 %103 to i128
  %105 = mul nsw i128 %102, %104
  store i128 %105, ptr %5, align 16
  %106 = load i64, ptr %8, align 8
  %107 = zext i64 %106 to i128
  %108 = load i64, ptr %11, align 8
  %109 = zext i64 %108 to i128
  %110 = mul nsw i128 %107, %109
  %111 = load i64, ptr %9, align 8
  %112 = mul i64 %111, 2
  %113 = zext i64 %112 to i128
  %114 = load i64, ptr %10, align 8
  %115 = zext i64 %114 to i128
  %116 = mul nsw i128 %113, %115
  %117 = add nsw i128 %110, %116
  %118 = load i128, ptr %6, align 16
  %119 = add nsw i128 %118, %117
  store i128 %119, ptr %6, align 16
  %120 = load i128, ptr %6, align 16
  %121 = and i128 %120, 4503599627370495
  %122 = trunc i128 %121 to i64
  store i64 %122, ptr %15, align 8
  %123 = load i128, ptr %6, align 16
  %124 = ashr i128 %123, 52
  store i128 %124, ptr %6, align 16
  %125 = load i64, ptr %15, align 8
  %126 = shl i64 %125, 4
  %127 = load i64, ptr %14, align 8
  %128 = or i64 %126, %127
  store i64 %128, ptr %15, align 8
  %129 = load i64, ptr %15, align 8
  %130 = sext i64 %129 to i128
  %131 = mul nsw i128 %130, 4294968273
  %132 = load i128, ptr %5, align 16
  %133 = add nsw i128 %132, %131
  store i128 %133, ptr %5, align 16
  %134 = load i128, ptr %5, align 16
  %135 = and i128 %134, 4503599627370495
  %136 = trunc i128 %135 to i64
  %137 = load ptr, ptr %3, align 8
  %138 = getelementptr inbounds i64, ptr %137, i64 0
  store i64 %136, ptr %138, align 8
  %139 = load i128, ptr %5, align 16
  %140 = ashr i128 %139, 52
  store i128 %140, ptr %5, align 16
  %141 = load i64, ptr %7, align 8
  %142 = mul i64 %141, 2
  store i64 %142, ptr %7, align 8
  %143 = load i64, ptr %7, align 8
  %144 = zext i64 %143 to i128
  %145 = load i64, ptr %8, align 8
  %146 = zext i64 %145 to i128
  %147 = mul nsw i128 %144, %146
  %148 = load i128, ptr %5, align 16
  %149 = add nsw i128 %148, %147
  store i128 %149, ptr %5, align 16
  %150 = load i64, ptr %9, align 8
  %151 = zext i64 %150 to i128
  %152 = load i64, ptr %11, align 8
  %153 = zext i64 %152 to i128
  %154 = mul nsw i128 %151, %153
  %155 = load i64, ptr %10, align 8
  %156 = zext i64 %155 to i128
  %157 = load i64, ptr %10, align 8
  %158 = zext i64 %157 to i128
  %159 = mul nsw i128 %156, %158
  %160 = add nsw i128 %154, %159
  %161 = load i128, ptr %6, align 16
  %162 = add nsw i128 %161, %160
  store i128 %162, ptr %6, align 16
  %163 = load i128, ptr %6, align 16
  %164 = and i128 %163, 4503599627370495
  %165 = mul nsw i128 %164, 68719492368
  %166 = load i128, ptr %5, align 16
  %167 = add nsw i128 %166, %165
  store i128 %167, ptr %5, align 16
  %168 = load i128, ptr %6, align 16
  %169 = ashr i128 %168, 52
  store i128 %169, ptr %6, align 16
  %170 = load i128, ptr %5, align 16
  %171 = and i128 %170, 4503599627370495
  %172 = trunc i128 %171 to i64
  %173 = load ptr, ptr %3, align 8
  %174 = getelementptr inbounds i64, ptr %173, i64 1
  store i64 %172, ptr %174, align 8
  %175 = load i128, ptr %5, align 16
  %176 = ashr i128 %175, 52
  store i128 %176, ptr %5, align 16
  %177 = load i64, ptr %7, align 8
  %178 = zext i64 %177 to i128
  %179 = load i64, ptr %9, align 8
  %180 = zext i64 %179 to i128
  %181 = mul nsw i128 %178, %180
  %182 = load i64, ptr %8, align 8
  %183 = zext i64 %182 to i128
  %184 = load i64, ptr %8, align 8
  %185 = zext i64 %184 to i128
  %186 = mul nsw i128 %183, %185
  %187 = add nsw i128 %181, %186
  %188 = load i128, ptr %5, align 16
  %189 = add nsw i128 %188, %187
  store i128 %189, ptr %5, align 16
  %190 = load i64, ptr %10, align 8
  %191 = zext i64 %190 to i128
  %192 = load i64, ptr %11, align 8
  %193 = zext i64 %192 to i128
  %194 = mul nsw i128 %191, %193
  %195 = load i128, ptr %6, align 16
  %196 = add nsw i128 %195, %194
  store i128 %196, ptr %6, align 16
  %197 = load i128, ptr %6, align 16
  %198 = trunc i128 %197 to i64
  %199 = zext i64 %198 to i128
  %200 = mul nsw i128 68719492368, %199
  %201 = load i128, ptr %5, align 16
  %202 = add nsw i128 %201, %200
  store i128 %202, ptr %5, align 16
  %203 = load i128, ptr %6, align 16
  %204 = ashr i128 %203, 64
  store i128 %204, ptr %6, align 16
  %205 = load i128, ptr %5, align 16
  %206 = and i128 %205, 4503599627370495
  %207 = trunc i128 %206 to i64
  %208 = load ptr, ptr %3, align 8
  %209 = getelementptr inbounds i64, ptr %208, i64 2
  store i64 %207, ptr %209, align 8
  %210 = load i128, ptr %5, align 16
  %211 = ashr i128 %210, 52
  store i128 %211, ptr %5, align 16
  %212 = load i128, ptr %6, align 16
  %213 = trunc i128 %212 to i64
  %214 = zext i64 %213 to i128
  %215 = mul nsw i128 281475040739328, %214
  %216 = load i64, ptr %12, align 8
  %217 = sext i64 %216 to i128
  %218 = add nsw i128 %215, %217
  %219 = load i128, ptr %5, align 16
  %220 = add nsw i128 %219, %218
  store i128 %220, ptr %5, align 16
  %221 = load i128, ptr %5, align 16
  %222 = and i128 %221, 4503599627370495
  %223 = trunc i128 %222 to i64
  %224 = load ptr, ptr %3, align 8
  %225 = getelementptr inbounds i64, ptr %224, i64 3
  store i64 %223, ptr %225, align 8
  %226 = load i128, ptr %5, align 16
  %227 = ashr i128 %226, 52
  store i128 %227, ptr %5, align 16
  %228 = load i64, ptr %13, align 8
  %229 = sext i64 %228 to i128
  %230 = load i128, ptr %5, align 16
  %231 = add nsw i128 %230, %229
  store i128 %231, ptr %5, align 16
  %232 = load i128, ptr %5, align 16
  %233 = trunc i128 %232 to i64
  %234 = load ptr, ptr %3, align 8
  %235 = getelementptr inbounds i64, ptr %234, i64 4
  store i64 %233, ptr %235, align 8
  ret void
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.5a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 15.0.7"}
