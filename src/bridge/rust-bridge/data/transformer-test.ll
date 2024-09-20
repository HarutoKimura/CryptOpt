; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @test_sext(i1 %x) #0 {
  %1 = alloca i1, align 1
  store i1 %x, i1* %1, align 1
  %2 = load i1, i1* %1, align 1
  %3 = sext i1 %2 to i64
  ret i64 %3
}

define dso_local i64 @test_sext_transformed1(i1 %x) #0 {
  %1 = alloca i1, align 1
  store i1 %x, i1* %1, align 1
  %2 = load i1, i1* %1, align 1
  %3 = zext i1 %2 to i64
  %4 = shl i64 %3, 63
  %5 = ashr i64 %4, 63
  ret i64 %5
}

define dso_local i64 @test_sext_transformed2(i1 %x) #0 {
  %1 = alloca i1, align 1
  store i1 %x, i1* %1, align 1
  %2 = load i1, i1* %1, align 1
  %dest_zext = zext i1 %2 to i64
  %dest_0 = sub i64 %dest_zext, 1
  %dest_1 = and i64 %dest_zext, %dest_0
  %dest_2 = xor i64 %dest_zext, 18446744073709551614  ; 2^64 - 2
  %dest_3 = and i64 %dest_2, 18446744073709551615     ; 2^64 - 1 (all 1s for i64)
  %dest = xor i64 %dest_1, %dest_3
  ret i64 %dest
}

define dso_local i64 @test_sext_sensei_formula_ver2(i1 %x) #0 {
  %1 = alloca i1, align 1
  store i1 %x, i1* %1, align 1
  %2 = load i1, i1* %1, align 1
  %dest_zext = zext i1 %2 to i64
  %dest_0 = sub i64 0, %dest_zext ; (-%x1)
  %dest_1 = xor i64 %dest_zext, 18446744073709551614  ; %x2 XOR 1111,,,,1110 (2^64 - 2)
  %dest = and i64 %dest_0, %dest_1     ; (%x2 XOR 1111,,,,1110) AND (-%x1)
  ret i64 %dest
}


define dso_local i64 @test_sext_transformed3(i1 %x) #0 {
  %1 = alloca i1, align 1
  store i1 %x, i1* %1, align 1
  %2 = load i1, i1* %1, align 1
  %dest_zext = zext i1 %2 to i64
  %dest_neg = sub i64 0, %dest_zext
  ret i64 %dest_neg
}


define i64 @sext_transformer(i64* %x0, i1* %x1) #0 {
  %x2 = load i1, i1* %x1, align 1
  %x3 = zext i1 %x2 to i64
  %x4 = sub i64 0, %x3
  %x5 = xor i64 %x3, 18446744073709551614
  %x6 = and i64 %x4, %x5
  store i64 %x6, i64* %x0, align 8
  %result = load i64, i64* %x0, align 8
  ret i64 %result
}

define i64 @sext_transformer2(i64* %x0, i64* %x1) #0 {
  %x2 = load i64, i64* %x1, align 1
  %x3 = sub i64 0, %x2
  %x4 = xor i64 %x2, 18446744073709551614
  %x5 = and i64 %x3, %x4
  %x6 = getelementptr i64, i64* %x0, i64 0
  store i64 %x5, i64* %x6, align 8
  %result = load i64, i64* %x0, align 8
  ret i64 %result
}


; Original select operation
define dso_local i64 @test_select(i1 %x, i64 %true_val, i64 %false_val) #0 {
  %1 = select i1 %x, i64 %true_val, i64 %false_val
  ret i64 %1
}

; Replacement using sensei formula
define dso_local i64 @test_select_sensei(i1 %x, i64 %true_val, i64 %false_val) #0 {
  %condition_zext = zext i1 %x to i64
  %condition = add i64 %condition_zext, 0
  %start = add i64 %false_val, 0
  %1 = sub i64 1, %condition
  %2 = mul i64 %start, %1
  %3 = mul i64 %true_val, %condition
  %result = add i64 %2, %3
  ret i64 %result
}

; Declare the printf function
declare i32 @printf(i8*, ...)

@.str = private unnamed_addr constant [17 x i8] c"sext(%d) = %lld\0A\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"sext_transformed1(%d) = %lld\0A\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"sext_transformed2(%d) = %lld\0A\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"test_sext_sensei_formula_ver2(%d) = %lld\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"select(%d) = %lld\0A\00", align 1
@.str.5 = private unnamed_addr constant [26 x i8] c"select_sensei(%d) = %lld\0A\00", align 1

@.str.6 = private unnamed_addr constant [29 x i8] c"sext_transformer(%d) = %lld\0A\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"sext_transformer2(%d) = %lld\0A\00", align 1

define dso_local i32 @main() #0 {
  ; Test sext operation
  ; Test with false (0)
  %1 = call i64 @test_sext(i1 false)
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0), i32 0, i64 %1)
  
  %3 = call i64 @test_sext_transformed1(i1 false)
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i64 0, i64 0), i32 0, i64 %3)
  
  %5 = call i64 @test_sext_transformed2(i1 false)
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.2, i64 0, i64 0), i32 0, i64 %5)

  %7 = call i64 @test_sext_sensei_formula_ver2(i1 false)
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i64 0, i64 0), i32 0, i64 %7)


  ; Test with true (1)
  %9 = call i64 @test_sext(i1 true)
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0), i32 1, i64 %9)
  
  %11 = call i64 @test_sext_transformed1(i1 true)
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i64 0, i64 0), i32 1, i64 %11)
  
  %13 = call i64 @test_sext_transformed2(i1 true)
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.2, i64 0, i64 0), i32 1, i64 %13)

  %15 = call i64 @test_sext_sensei_formula_ver2(i1 true)
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i64 0, i64 0), i32 1, i64 %15)

  ; Test select operation
  ; false (0)
  %17 = call i64 @test_select(i1 false, i64 100, i64 200)
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i64 0, i64 0), i32 0, i64 %17)
  
  %19 = call i64 @test_select_sensei(i1 false, i64 100, i64 200)
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i32 0, i64 %19)
  
  
  ; true (1)
  %21 = call i64 @test_select(i1 true, i64 100, i64 200)
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i64 0, i64 0), i32 1, i64 %21)
  
  %23 = call i64 @test_select_sensei(i1 true, i64 100, i64 200)
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0), i32 1, i64 %23)


  %sext_result = alloca i64, align 8

  ; Test with false (0)
  %sext_false = alloca i1, align 1
  store i1 false, i1* %sext_false, align 1
  %sext_false_result = call i64 @sext_transformer(i64* %sext_result, i1* %sext_false)
  %sext_false_print = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.6, i64 0, i64 0), i32 0, i64 %sext_false_result)

  ; Test with true (1)
  %sext_true = alloca i1, align 1
  store i1 true, i1* %sext_true, align 1
  %sext_true_result = call i64 @sext_transformer(i64* %sext_result, i1* %sext_true)
  %sext_true_print = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.6, i64 0, i64 0), i32 1, i64 %sext_true_result)

  
  ; Test with false (0)
  %sext_false2 = alloca i64, align 1
  store i64 0, i64* %sext_false2, align 1
  %sext_false_result2 = call i64 @sext_transformer2(i64* %sext_result, i64* %sext_false2)
  %sext_false_print2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.7, i64 0, i64 0), i32 0, i64 %sext_false_result2)

  ; Test with true (1)
  %sext_true2 = alloca i64, align 1
  store i64 1, i64* %sext_true2, align 1
  %sext_true_result2 = call i64 @sext_transformer2(i64* %sext_result, i64* %sext_true2)
  %sext_true_print2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.7, i64 0, i64 0), i32 1, i64 %sext_true_result2)


  ret i32 0
}