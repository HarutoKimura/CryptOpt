define void @bls12_mul(i64* %x0, i64* %x1) #0 {
  %x2 = load i64, i64* %x1, align 1
  %x3 = sub i64 0, %x2
  %x4 = xor i64 %x2, 18446744073709551614
  %x5 = and i64 %x3, %x4
  %x6 = getelementptr i64, i64* %x0, i64 0
  store i64 %x5, i64* %x6, align 8

  ret void
}

attributes #0 = { nounwind }