#!/usr/bin/env sed

# Replace %N -> xN
s/%\([[:digit:]]\+\)/x\1/g

# Convert LLVM IR to JSON format
s/\(x[[:digit:]]\+\) = \([[:lower:]]\+\) \([[:lower:][:space:]]\+\)*\(i[[:digit:]]\{1,3\}\)\([[:graph:][:space:]]\+\)/{ "name":\["\1"\],"operation":"\2","modifiers":"\3","datatype":"\4","arguments": "\4\5"},\t/p

# Handle function definitions, modifying to capture Rust-specific mangling
s/define i32 @_ZN[[:alnum:]_]\+E(i32 \(x[[:digit:]]*\), i32 \(x[[:digit:]]*\))/{"function":"\0","args":\["i32","\1","i32","\2"\],"returns":"i32","operations":\[/p

# End of function (close JSON array)
s/ret i32 \(x[[:digit:]]*\)/{"operation":"return","value":"\1"}\]}/p