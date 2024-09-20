// #[link(name = "bls12_mul")] // when I use shared object, I need but not cryptopt's ASM
extern "C" {
    fn asm_from_json( // change function name depending on the running funciton
        x0: *mut i64,
        x1: *const i64
    );
}

fn main() {
    let mut x0: i64 = 0; 
    let x1: i64 = 0;  
    unsafe {
        asm_from_json(  // change function name depending on the running functions
            &mut x0 as *mut i64,
            &x1 as *const i64,
        );
    }

    println!("Input arguments: {:?}", x1);

    // println!("Result of local shared object: {:?}", x0);

    // println!("Result of ASM from shared object through CryptOpt: {:?}", x0);

    println!("Result of ASM from JSON thorugh CryptOpt: {:?}", x0);


    let x2: i64 = 1;
    unsafe {
        asm_from_json(
            &mut x0 as *mut i64,
            &x2 as *const i64,
        );
    }

    println!("Input arguments: {:?}", x2);

    // println!("Result of local shared object: {:?}", x0);

    // println!("Result of ASM from shared object through CryptOpt: {:?}", x0);

    println!("Result of ASM from JSON thorugh CryptOpt: {:?}", x0);



}
