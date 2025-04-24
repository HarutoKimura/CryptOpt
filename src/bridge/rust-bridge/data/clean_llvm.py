import sys
import re
from operation_transformer import negative_add_check, change_negative_add_to_sub, combine_shift_trunc_operations, should_combine_shift_trunc, replace_variable_references

def transform_llvm_ir(file_path):
    with open(file_path, 'r') as file:
        llvm_ir = file.read()

    # regex to capture function definition including complex names and arguments up to 'unnamed_addr #0'
    pattern = r'define (\w+) @([^\s]+)\((.*?)\) unnamed_addr #0'
    # pattern = r'define\s+i64\s+@(sext_transformer)\s*\(\s*(i1\s+%x)\s*\)\s*#0'
    match = re.search(pattern, llvm_ir, re.DOTALL)
    if not match:
        raise ValueError("Function definition not found")

    function_name = match.group(2)
    function_args = match.group(3)

    # Split the arguments by "," and strip whitespace
    args_list = [arg.strip() for arg in function_args.split(",")]

    #Exclude the first argument
    remanining_args = args_list[1:]

    # remaining_args_str = ', '.join(remanining_args)

    remaining_args_str = ', '.join(remanining_args)


    ######### future work ######### 
    ## automatically extract the remaining arguments and allocate the memory representation
    ######## 
    # this is the only for bls12_mul, very specific case
    # # In bls12 case, there are two outputs and four inputs arguments so, just for test, I directly paste the input arguements nopw
    # remaining_args_str = "ptr noalias nocapture noundef nonnull writeonly align 8  %out0.0, i64 noundef %out0.1, ptr noalias nocapture noundef nonnull readonly align 8 %in0.0, i64 noundef %in0.1, ptr noalias nocapture noundef nonnull readonly align 8 %in1.0, i64 noundef %in1.1"
    
    # # Replace %out0.0 with x0
    # # This is the final memory location where the result is stored
    # remaining_args_str = re.sub(r'%out0\.0', 'x0', remaining_args_str)
    # # Replace %out0.1 with x1
    # remaining_args_str = re.sub(r'%out0\.1', 'x1', remaining_args_str)
    # # Replace %in0.0 with x2
    # remaining_args_str = re.sub(r'%in0\.0', 'x2', remaining_args_str)
    # # Replace %in0.1 with x3
    # remaining_args_str = re.sub(r'%in0\.1', 'x3', remaining_args_str)
    # # Replace %in1.0 with x4
    # remaining_args_str = re.sub(r'%in1\.0', 'x4', remaining_args_str)
    # # Replace %in1.1 with x5
    # remaining_args_str = re.sub(r'%in1\.1', 'x5', remaining_args_str)


    # fiat-curve25519 carry_mul adnd solinas cases
    remaining_args_str_fiat = "ptr noalias nocapture noundef writeonly align 8 dereferenceable(40) %out1, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %arg1, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %arg2"
    remaining_args_str_fiat = re.sub(r'%out1', 'x0', remaining_args_str_fiat)
    remaining_args_str_fiat = re.sub(r'%arg1', 'x1', remaining_args_str_fiat)
    remaining_args_str_fiat = re.sub(r'%arg2', 'x2', remaining_args_str_fiat)

    # # these replacements are for the case of the secp256k1
    # remaining_args_str = re.sub(r'%(\S+)', r'x\1', remaining_args_str)
    # remaining_args_str = re.sub(r'xa', r'x1', remaining_args_str)
    # remaining_args_str = re.sub(r'xb', r'x2', remaining_args_str)

    # Extract the function body
    match = re.search(r'{([^}]+)}', llvm_ir, flags=re.DOTALL)
    if not match:
        raise ValueError("Function body not found")

    function_body = match.group(1).strip()

    entire_operations = []
    x_mapping = {}
    #when I used for the secop256k1, the memory counter starts from 0
    #when I use for the bls12, the memory counter starts from ???
    memory_counter = 0
    panic_skip_flag = False
    transformed_lines = []

    def replace_var(match):
        nonlocal memory_counter
        var = match.group(0)
        if var not in x_mapping:
            x_mapping[var] = f'x{memory_counter}'
            # if memory_counter == 1133 or memory_counter == 1141 or memory_counter == 1150 or memory_counter == 1158 or memory_counter == 1167 or memory_counter == 1175 or memory_counter == 1184 or memory_counter == 1192:
            #     print(f"var: {var}, x_mapping[var]: {x_mapping[var]}")
            memory_counter += 1
        return x_mapping[var]

    # Convert lines to list for easier pairwise processing
    lines = [line for line in llvm_ir.strip().split('\n') if line.strip()]

    i = 0
    while i < len(lines):
        line = lines[i].strip()

        # Skip bb{number} and br lines
        if line.startswith('bb') or line.startswith('br'):
            i += 1
            continue

        # Handle panic blocks
        if 'panic' in line:
            panic_skip_flag = True
            i += 1
            continue
    
        if 'unreachable' in line:
            panic_skip_flag = False
            i += 1
            continue

        if panic_skip_flag:
            i += 1
            continue

        # Check for negative add pattern
        if negative_add_check(line):
            line = change_negative_add_to_sub(line)

        # # Check for shift+trunc pattern
        # if i + 1 < len(lines) and should_combine_shift_trunc(line, lines[i + 1]):
        #     print(f"Combining shift+trunc: {line.strip()} {lines[i + 1].strip()}")
        #     combined_line, old_var, new_var = combine_shift_trunc_operations(line, lines[i + 1])
        #     if combined_line and old_var and new_var:
        #         # Replace all subsequent references to old_var with new_var
        #         lines = replace_variable_references(lines, i, old_var, new_var)
        #         print(f"Replaced {old_var} with {new_var}")
        #         line = combined_line
        #         print_yes = True
        #         i += 2  # Skip the next line since we've combined it
        #     else:
        #         i += 1
        # else:
        #     i += 1
        

        # Replace all variable names and memory locations with sequential numbers
        line = re.sub(r'%[\w.]+', replace_var, line)
        line = re.sub(r'ptr %(\w+)', lambda m: f'ptr x{x_mapping.get(m.group(1), m.group(1))}', line)

        transformed_lines.append(line)

        i += 1

        if line.strip() == 'ret void':
            break

    # Combine all lines back together
    transformed_ir = '\n'.join(transformed_lines)
    
    return transformed_ir

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Usage: python3 clean_llvm.py <input_llvm_file> <output_llvm_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]
    
    transformed_ir = transform_llvm_ir(input_file)
    
    with open(output_file, 'w') as outfile:
        outfile.write(transformed_ir)