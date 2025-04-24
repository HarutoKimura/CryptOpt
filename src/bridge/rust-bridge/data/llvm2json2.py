import sys
import json
import re
from operation_transformer import negative_add_check, change_negative_add_to_sub, recognize_addcarryx_pattern_add_add_lshr, recognize_addcarryx_pattern_add_add_trunc, recognize_addcarryx_pattern_add_add_trunc_lshr, recognize_addcarryx_pattern_add_trunc_lshr,recognize_addcarryx_pattern_preserve, recognize_addcarryx_pattern_add_lshr, recognize_addcarryx_pattern_add_lshr_and, recognize_addcarryx_pattern_add_add_lshr_and
def parse_llvm_ir(file_path):

    cleaned_line = []
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

    ######### future work ######### 
    ## automatically extract the remaining arguments and allocate the memory representation
    ######## 
    # this is the only for bls12_mul, very specific case
    # In bls12 case, there are two outputs and four inputs arguments so, just for test, I directly paste the input arguements nopw
    remaining_args_str = "ptr noalias nocapture noundef nonnull writeonly align 8  %out0.0, i64 noundef %out0.1, ptr noalias nocapture noundef nonnull readonly align 8 %in0.0, i64 noundef %in0.1, ptr noalias nocapture noundef nonnull readonly align 8 %in1.0, i64 noundef %in1.1"
    
    # Replace %out0.0 with x0
    # This is the final memory location where the result is stored
    remaining_args_str = re.sub(r'%out0\.0', 'x0', remaining_args_str)
    # Replace %out0.1 with x1
    remaining_args_str = re.sub(r'%out0\.1', 'x1', remaining_args_str)
    # Replace %in0.0 with x2
    remaining_args_str = re.sub(r'%in0\.0', 'x2', remaining_args_str)
    # Replace %in0.1 with x3
    remaining_args_str = re.sub(r'%in0\.1', 'x3', remaining_args_str)
    # Replace %in1.0 with x4
    remaining_args_str = re.sub(r'%in1\.0', 'x4', remaining_args_str)
    # Replace %in1.1 with x5
    remaining_args_str = re.sub(r'%in1\.1', 'x5', remaining_args_str)


    # # fiat-curve25519 carry_mul adnd solinas cases
    # remaining_args_str_fiat = "ptr noalias nocapture noundef writeonly align 8 dereferenceable(40) %out1, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %arg1, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %arg2"
    # remaining_args_str_fiat = re.sub(r'%out1', 'x0', remaining_args_str_fiat)
    # remaining_args_str_fiat = re.sub(r'%arg1', 'x1', remaining_args_str_fiat)
    # remaining_args_str_fiat = re.sub(r'%arg2', 'x2', remaining_args_str_fiat)

    # # these replacements are for the case of the secp256k1
    # remaining_args_str = re.sub(r'%(\S+)', r'x\1', remaining_args_str)
    # remaining_args_str = re.sub(r'xa', r'x1', remaining_args_str)
    # remaining_args_str = re.sub(r'xb', r'x2', remaining_args_str)

    # Extract the function body
    match = re.search(r'{([^}]+)}', llvm_ir, flags=re.DOTALL)
    if not match:
        raise ValueError("Function body not found")

    x_mapping = {}
    #when I used for the secop256k1, the memory counter starts from 0
    #when I use for the bls12, the memory counter starts from ???
    memory_counter = 0
    panic_skip_flag = False

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

    # After converting lines to list

    i = 0
    lines_to_skip = set()  # Keep track of lines we want to skip
    addcarryx_flag = False ## to check if the addcarryx pattern is recognized
    while i < len(lines):
        line = lines[i].strip() ##line index starts from 0
        print(f"line: {line}")

        if line == "":
            i += 1
            continue

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

        # # Check for negative add pattern -> change to sub
        # if negative_add_check(line):
        #     line = change_negative_add_to_sub(line)


        # # Check for shift+trunc pattern -> combine into single operation
        # if i + 1 < len(lines) and should_combine_shift_trunc(line, lines[i + 1]):
        #     combined_line, old_var, new_var = combine_shift_trunc_operations(line, lines[i + 1])
        #     if combined_line and old_var and new_var:
        #         # Replace all subsequent references to old_var with new_var
        #         lines = replace_variable_references(lines, i, old_var, new_var)
        #         line = combined_line
        #         i += 2   # Skip the next line since we've combined it
        #         addcarryx_flag = True


        # if i + 1 < len(lines) and ("add nuw nsw i128" in lines[i]) and ("add nuw nsw i128" in lines[i+1]): ## first two lines are add 128 operations
        #     if i + 2 < len(lines) and ("lshr i128" in lines[i+2]): ## the third line is lshr 128 operation
        #         if i + 3 < len(lines) and ("trunc i128" in lines[i+3]): ## the fourth line is trunc 128 operation then skip the fourth line
        #             line = recognize_addcarryx_pattern(lines[i], lines[i+1], lines[i+3]) ## add + add + lshr + trunc
        #             addcarryx_flag = True
        #             i += 4
        #         else: ## the fourth line is not trunc 128 operation 
        #             line = recognize_addcarryx_pattern(lines[i], lines[i+1], lines[i+2]) ## add + add + lshr
        #             addcarryx_flag = True
        #             i += 3

        #     elif i + 2 < len(lines) and ("trunc i128" in lines[i+2]): ## the third line is trunc 128 operation -> to get the lower 64 bits parts
        #         if i + 3 < len(lines) and ("lshr i128" in lines[i+3]): ## the fourth line is lshr 128 operation -> to get the carry u1 bit part
        #             if i + 4 < len(lines) and ("trunc i128" in lines[i+4]): 
        #                 line = recognize_addcarryx_pattern_add_add_trunc_lshr(lines[i], lines[i+1], lines[i+2], lines[i+4]) ## add + add + trunc + lshr + trunc
        #                 i += 5
        #                 addcarryx_flag = True
        #             else:
        #                 line = recognize_addcarryx_pattern_add_add_trunc_lshr(lines[i], lines[i+1], lines[i+2], lines[i+3]) ## add + add + trunc + lshr
        #                 i += 4
        #                 addcarryx_flag = True
        #         else: ## the fourth line is not lshr 128 operation
        #             line = recognize_addcarryx_pattern(lines[i], lines[i+1], lines[i+2]) ## add + add + trunc
        #             i += 3
        #             addcarryx_flag = True

        # elif ("add nuw nsw i128" in lines[i]): ## the first line is add 128 operation
        #     if i + 1 < len(lines) and ("lshr i128" in lines[i+1]): ## the second line is lshr 128 operation

        #         if i + 2 < len(lines) and ("trunc i128" in lines[i+2]): ## the third line is trunc 128 operation then skip the third line
        #             line = recognize_addcarryx_pattern_two(line, lines[i+2]) ## add + lshr + trunc
        #             addcarryx_flag = True
        #             i += 3
        #         else: ## the third line is not trunc 128 operation
        #             line = recognize_addcarryx_pattern_two(line, lines[i+1]) ## add + lshr
        #             addcarryx_flag = True
        #             i += 2

        #     elif i + 1 < len(lines) and ("trunc i128" in lines[i+1]): ## the second line is trunc 128 operation
        #         if i + 2 < len(lines) and ("lshr i128" in lines[i+2]):  ## the third line is lshr 128 operation
        #             if i + 3 < len(lines) and ("trunc i128" in lines[i+3]): ## the third line is trunc 128 operation
        #                 line = recognize_addcarryx_pattern_add_trunc_lshr(lines[i], lines[i+1], lines[i+3]) ## add + trunc + lshr + trunc
        #                 i += 4
        #                 addcarryx_flag = True
        #             else:
        #                 line = recognize_addcarryx_pattern_add_trunc_lshr(lines[i], lines[i+1], lines[i+2]) ## add + trunc + lshr
                        
        #                 i += 3
        #                 addcarryx_flag = True
        #         # else: ## the third line is not lshr 128 operation
        #         #     line = recognize_addcarryx_pattern(lines[i], lines[i+1], lines[i+2]) ## add + trunc
        #         #     i += 3
        #         #     addcarryx_flag = True

        ## update the pattern recognition
        ##1. add + lshr + ... + and (if later and part exists otherwise, the lower part should be the addition result)
        ##2. add + lshr + trunc + ... + and (if later and part exists otherwise, the lower part should be the addition result)
        ##3. add + lshr + ... + trunc (if later trunc part exists otherwise, the lower part should be the addition result)
        ##4. add + trunc + lshr 
        ##5. add + add + lshr + trunc + ... + and (if later and part exists otherwise, the lower part should be the addition result)
        ##6. add + add + lshr + ... + and (if later and part exists otherwise, the lower part should be the addition result)
        ##7. add + (another line) + add + lshr + trunc + ... + and (if later and part exists otherwise, the lower part should be the addition result)
        ##8. add + (another line) + add + lshr + ... + and (if later and part exists otherwise, the lower part should be the addition result)
        ##9. add + trunc + lshr + trunc

        def find_latter_part(index, target_var):
            """
            Find the next operation that uses the target variable.
            
            Args:
                index: Starting line index to search from
                search_operation: Operation to look for ("and" or "trunc")
                target_var: Variable name to match
            """
            print(f"index: {index}, target_var: {target_var}")
            for i in range(index, len(lines)):
                split_line = lines[i].split()
                # print(f"line: {split_line}")
                # if ("and" or "trunc") not in line:
                #     continue
                    
                # Make sure the line has enough parts and contains the target variable
                if len(split_line) >= 5:
                    dest_var = split_line[4]
                    # print(f"dest_var: {dest_var}")
                    dest_var = re.sub(r',', '', dest_var)
                    # print(f"dest_var: {dest_var}")
                    # For "and" operations, check if it's using the target variable
                    if (("and i128" in lines[i]) or ("trunc i128" in lines[i])) and (target_var == dest_var):
                        return_line = lines[i]
                        lines[i] = ""
                        print(f"return_line: {return_line}")
                        return return_line
            return ""

        ## pattern 7: add + (another line) + add + lshr + trunc + ... + and
        if (i + 5 < len(lines)) and ("add nuw nsw i128" in lines[i]) and ("add nuw nsw i128" in lines[i+2]) and ("lshr i128" in lines[i+3]) and ("trunc i128" in lines[i+4]):
            print(f"pattern 7")
            split_line = lines[i+2].split()
            lower_part = split_line[0]
            and_line = find_latter_part(i+5, lower_part)
            if and_line != "":
                line = recognize_addcarryx_pattern_add_add_lshr_and(lines[i], lines[i+2], lines[i+4], and_line)
            else:
                line = recognize_addcarryx_pattern_add_add_lshr(lines[i], lines[i+2], lines[i+4]) ## the lower part should be the addition result
                print(f"pattern 7 : {line}")
            lines[i+2] = ""
            lines[i+3] = ""
            lines[i+4] = ""
            # print(f"addcarryx: {line}") 
        
        ## pattern 8: add + (another line) + add + lshr + ... + and
        elif (i + 3 < len(lines)) and ("add nuw nsw i128" in lines[i]) and ("add nuw nsw i128" in lines[i+2]) and ("lshr i128" in lines[i+3]):
            print(f"pattern 8")
            split_line = lines[i+2].split()
            lower_part = split_line[0]
            and_line = find_latter_part(i+4, lower_part)
            if and_line != "":
                line = recognize_addcarryx_pattern_add_add_lshr_and(lines[i], lines[i+2], lines[i+3], and_line)
            else:
                line = recognize_addcarryx_pattern_add_add_lshr(lines[i], lines[i+2], lines[i+3])
            lines[i+2] = ""
            lines[i+3] = ""
            # print(f"addcarryx: {line}")
            

        ## pattern 5: add + add + lshr + trunc + ... + and
        elif (i + 3 < len(lines)) and ("add nuw nsw i128" in lines[i]) and ("add nuw nsw i128" in lines[i+1]) and ("lshr i128" in lines[i+2]) and ("trunc i128" in lines[i+3]):
            print(f"pattern 5")
            split_line = lines[i+1].split()
            lower_part = split_line[0]
            and_line = find_latter_part(i+4, lower_part)
            if and_line != "":
                line = recognize_addcarryx_pattern_add_add_lshr_and(lines[i], lines[i+1], lines[i+3], and_line)
            else:
                line = recognize_addcarryx_pattern_add_add_lshr(lines[i], lines[i+1], lines[i+3])
                print(f"pattern 5: {line}")
            lines[i+1] = ""
            lines[i+2] = ""
            lines[i+3] = ""
            # print(f"addcarryx: {line}")


        ## pattern 6: add + add + lshr + ... + and
        elif (i + 2 < len(lines)) and ("add nuw nsw i128" in lines[i]) and ("add nuw nsw i128" in lines[i+1]) and ("lshr i128" in lines[i+2]):
            print(f"pattern 6")
            split_line = lines[i+1].split()
            lower_part = split_line[0]
            and_line = find_latter_part(i+3, lower_part)
            if and_line != "":
                line = recognize_addcarryx_pattern_add_add_lshr_and(lines[i], lines[i+1], lines[i+2], and_line)
            else:
                line = recognize_addcarryx_pattern_add_add_lshr(lines[i], lines[i+1], lines[i+2])
                print(f"pattern 6: {line}")
            lines[i+1] = ""
            lines[i+2] = ""
            # print(f"addcarryx: {line}")

        elif (i + 4 < len(lines)) and ("add nuw nsw i128" in lines[i]) and ("add nuw nsw i128" in lines[i+1]) and ("trunc i128" in lines[i+2]) and ("lshr i128" in lines[i+3]) and ("trunc i128" in lines[i+4]):
            print(f"pattern for two_carry_5")
            line = recognize_addcarryx_pattern_add_add_trunc_lshr(lines[i], lines[i+1], lines[i+2], lines[i+4])
            print(f"pattern for two_carry_5: {line}")
            lines[i+1] = ""
            lines[i+2] = ""
            lines[i+3] = ""
            lines[i+4] = ""
            # print(f"addcarryx: {line}")

        ## pattern special for two_carry_4 -> add + add + trunc (but no lshr) so no place to store the carry bit
        elif (i + 3 < len(lines)) and ("add nuw nsw i128" in lines[i]) and ("add nuw nsw i128" in lines[i+1]) and ("trunc i128" in lines[i+2]) and ("lshr i128" not in lines[i+3]):
            print(f"pattern for two_carry_4")
            line = recognize_addcarryx_pattern_add_add_trunc(lines[i], lines[i+1], lines[i+2])
            print(f"pattern for two_carry_4: {line}")
            lines[i+1] = ""
            lines[i+2] = ""
            # print(f"addcarryx: {line}")

        ## pattern 2: add + lshr + trunc + ... + and
        elif (i + 2 < len(lines)) and ("add nuw nsw i128" in lines[i]) and ("lshr i128" in lines[i+1]) and ("trunc i128" in lines[i+2]):
            print(f"pattern 2")
            split_line = lines[i].split()
            lower_part = split_line[0]
            and_line = find_latter_part(i+3, lower_part)
            if and_line != "":
                line = recognize_addcarryx_pattern_add_lshr_and(lines[i], lines[i+2], and_line)
            else:
                print(f"  before pattern 2: {lines[i]}")
                print(f"  before pattern 2: {lines[i+1]}")
                print(f"  before pattern 2: {lines[i+2]}")
                line = recognize_addcarryx_pattern_add_lshr(lines[i], lines[i+2])
                print(f"  pattern 2: {line}")
            lines[i+1] = ""
            lines[i+2] = ""
            # print(f"addcarryx: {line}")

        ## pattern 1: add + lshr + ... + and
        elif (i + 1 < len(lines)) and ("add nuw nsw i128" in lines[i]) and ("lshr i128" in lines[i+1]):
            print("pattern 1")
            # print(lines[i])
            # print(lines[i+1])
            split_line = lines[i].split()
            lower_part = split_line[0]
            and_line = find_latter_part(i+2, lower_part)
            if and_line != "":
                line = recognize_addcarryx_pattern_add_lshr_and(lines[i], lines[i+1], and_line)
            else:
                print(f"  before pattern 1: {lines[i]}")
                print(f"  before pattern 1: {lines[i+1]}")
                print(f"  before pattern 1: {lines[i+2]}")
                line = recognize_addcarryx_pattern_add_lshr(lines[i], lines[i+1])
                print(f"  pattern 1: {line}")
            lines[i+1] = ""
            # print(f"addcarryx: {line}")

        ## pattern 3: add + lshr + ... + trunc
        elif (i + 1 < len(lines)) and ("add nuw nsw i128" in lines[i]) and ("lshr i128" in lines[i+1]):
            print("pattern 3")
            # print(lines[i])
            # print(lines[i+1])
            split_line = lines[i].split()
            lower_part = split_line[0]
            trunc_line = find_latter_part(i+2, lower_part)
            if trunc_line != "":
                line = recognize_addcarryx_pattern_add_lshr_and(lines[i], lines[i+1], trunc_line)
            else:
                print(f"before pattern 3: {lines[i]}")
                print(f"before pattern 3: {lines[i+1]}")
                line = recognize_addcarryx_pattern_add_lshr(lines[i], lines[i+1])
                print(f"pattern 3: {line}")
            lines[i+1] = ""
            # print(f"addcarryx: {line}")

        ## pattern 9: add + trunc + lshr + trunc && add + trunc + lshr + ... + trunc
        elif (i + 3 < len(lines)) and ("add nuw nsw i128" in lines[i]) and ("trunc i128" in lines[i+1]) and ("lshr i128" in lines[i+2]) and ("trunc i128" in lines[i+3]):
            print("pattern 9")
            # print(lines[i])
            # print(lines[i+1])
            # print(lines[i+2])
            # print(lines[i+3])
            line = recognize_addcarryx_pattern_add_trunc_lshr(lines[i], lines[i+1], lines[i+3])
            lines[i+1] = ""
            lines[i+2] = ""
            lines[i+3] = ""
            # print(f"pattern 9 addcarryx: {line}")

        ##pattern 4: add + trunc + lshr
        elif (i + 2 < len(lines)) and ("add nuw nsw i128" in lines[i]) and ("trunc i128" in lines[i+1]) and ("lshr i128" in lines[i+2]):
            print("pattern 4")
            # print(lines[i])
            # print(lines[i+1])
            # print(lines[i+2])
            line = recognize_addcarryx_pattern_add_trunc_lshr(lines[i], lines[i+1], lines[i+2])
            lines[i+1] = ""
            lines[i+2] = ""
            # print(f"pattern 4 addcarryx: {line}")

        ## special pattern cmovznz operation
        if (i + 1 < len(lines)) and ("sub nsw i64" in lines[i]) and ("and i64" in lines[i+1]):
            line1 = lines[i].split()
            print(f"line1: {line1}")
            line2 = lines[i+1].split()
            dest_var = line2[0]
            condition_var = line1[-1]
            value_if_zero = line1[4]
            valeu_if_non_zero = line2[-1]
            print(condition_var)
            print(value_if_zero)
            print(valeu_if_non_zero)
            line = f"{dest_var} = cmovznz i64 {condition_var}, 0, {valeu_if_non_zero}"
            lines[i+1] = "" 
            print(f"cmovznz: {line}")

        print(f"before line number {i}: {line}")
        # Replace all variable names and memory locations with sequential numbers
        line = re.sub(r'%[\w.]+', replace_var, line)
        line = re.sub(r'ptr %(\w+)', lambda m: f'ptr x{x_mapping.get(m.group(1), m.group(1))}', line)

        print(f"after line number {i}: {line}")
        print("\n")
        cleaned_line.append(line)

        i += 1
    # print(f"cleaned_line: {cleaned_line}")  
        
    return cleaned_line

## to maintain the consistency, get rid of the unnecessary zext operations
def eliminate_unnecessary_zext(cleaned_lines):
    """Eliminate unnecessary zext operations that feed into addcarryx."""
    # Track zext operations and their mappings
    zext_map = {}  # maps zext output to original input
    result_lines = []
    i = 0
    
    # First pass: build zext mapping
    for line in cleaned_lines:
        if "zext i64" in line:
            # Extract source and destination variables
            parts = line.strip().split()
            dest = parts[0].rstrip(' =')
            src = parts[4]  # The source variable
            zext_map[dest] = src
    print (zext_map)

    # Second pass: process lines and replace variables in addcarryx
    while i < len(cleaned_lines):
        line = cleaned_lines[i]
        
        # If this is an addcarryx line, check its arguments
        if "addcarryx" in line:
            parts = line.strip().split()
            # print(f"parts: {parts}")
            # Get the three arguments
            args = [parts[5].rstrip(','), parts[6].rstrip(','), parts[7].rstrip(',')]
            
            # Replace any argument that has a zext mapping
            modified_args = []
            for arg in args:
                if arg in zext_map:
                    modified_args.append(zext_map[arg])
                else:
                    modified_args.append(arg)
                    
            # Reconstruct the addcarryx line
            line = f"{parts[0]} {parts[1]} = addcarryx i64 {modified_args[0]}, {modified_args[1]}, {modified_args[2]}"
            
        # Skip zext operations whose results are only used in addcarryx
        if "zext i64" in line:
            dest = line.split()[0].rstrip(' =')
            # Only keep zext if its result is used somewhere other than addcarryx
            keep_zext = False
            for future_line in cleaned_lines[i+1:]:
                if dest in future_line and "addcarryx" not in future_line:
                    keep_zext = True
                    break
            if not keep_zext:
                i += 1
                continue
        result_lines.append(line)
        i += 1
        
    return result_lines

def renumber_variables(lines):
    """Renumber all variables sequentially starting from x0."""
    var_map = {}  # old -> new variable mapping
    counter = 0
    renumbered_lines = []
    
    def get_new_var(old_var):
        if old_var not in var_map:
            nonlocal counter
            var_map[old_var] = f'x{counter}'
            counter += 1
        return var_map[old_var]
    
    # Process each line
    for line in lines:
        new_line = line
        
        # Find all variable references (x followed by numbers)
        vars_in_line = re.findall(r'x\d+', line)
        
        # Replace each variable with its new number
        for var in sorted(vars_in_line, key=len, reverse=True):  # Sort by length to avoid partial replacements
            new_var = get_new_var(var)
            new_line = new_line.replace(var, new_var)
            
        renumbered_lines.append(new_line)

        print(new_line)
        
    return renumbered_lines


def convert_to_json(cleaned_line, function_name, remaining_args_str_fiat):
    entire_operations = []
    for line in cleaned_line:
        if "addcarryx" in line:
            # print(f"addcarryx line: {line}")
            parts = line.strip().split()

            # Clean and prepare the names (remove comma)
            names = parts[0].rstrip(',')  # remove trailing comma from first name
            
            # Clean and prepare the arguments (remove commas)
            arg1 = parts[5].rstrip(',')  # remove trailing comma
            arg2 = parts[6].rstrip(',')  # remove trailing comma
            arg3 = parts[7].rstrip(',')  # remove trailing comma
            
            entire_operations.append({
                'name': [f"{names}", f"{parts[1]}"],  # Creates "x50, x51" format
                'operation': "addcarryx",
                'modifiers': "",
                'datatype': "i64",
                'arguments': f"{arg1}, {arg2}, {arg3}"  # Creates "x48, x18, x49" format
            })


        #Pattern for operations that might have nuw/nsw mdofifiers
        op_pattern = r'(x[\w.]+)\s*=\s*(\w+)\s*((?:nuw|nsw|ult|ugt|eq|ne)\s*(?:nuw|nsw|ns|ult|ugt|eq|ne)?)\s*(i\d+)\s*(.+)'
        
        op_match = re.match(op_pattern, line.strip())
        
        if op_match:
            name, operation, modifier, datatype, args = op_match.groups()

            entire_operations.append( {
                'name': [name],
                'operation': operation,
                'modifiers': modifier.strip(),
                'datatype': datatype,
                'arguments': f"{datatype}, {args.strip()}" if "ptr" in args.strip() else f"{datatype} {args.strip()}"
            })
            #skip the below code in this line
            continue



        # # xNN = function_name OPT_args iNN (datatype) whatever -> JSON
        # general mathing pattern
        general_pattern = r'(x[\w.]+) = (\w+)(?: (inbounds))?\s*(?:\[[\d\s]*x\s*)?(\w+)[\]*\s]*(?:,?\s*(.+))?'
        match = re.match(general_pattern, line.strip())
        if match:
            try:
                name, operation, modifier, datatype, args = match.groups()
            except ValueError:
                print(f"Error unpacking line: {line.strip()}")
                continue
            # Remove trailing comma from datatype if present
            datatype = datatype.rstrip(',')

            # if operation == "icmp":
            #     print("datatype:", datatype)
            #     print("args:", args)
            #     # args_list = args.split(", ")
            #     # print("args_list", args_list)

            if operation == "getelementptr":
                # ignore the first i64 0
                args_list = args.split(", ")
                # Check if 'i64 0' is present and remove the first occurrence
                if 'i64 0' in args:
                    args_list.remove('i64 0')
                args = ", ".join(args_list)


            if operation == "cmovznz":

                modified_args = re.sub(r'i64\s+0', '0', args)

                entire_operations.append({
                    'name': [name],
                    'operation': operation,
                    'modifiers': "",
                    'datatype':  "i64",
                    'arguments':  f"{modified_args.strip()}"
                })
                continue

            # Remove align and !noundef from load operation
            if operation == "load":
                args = re.sub(r',\s*align\s+\d+,\s*!noundef\s+!\d+', '', args)

                entire_operations.append({
                    'name': [name],
                    'operation': operation,
                    'modifiers': "",
                    'datatype':  "i64",
                    'arguments':  f"{datatype} {args.strip()}"
                })
                continue

            # add the operations as the body
            entire_operations.append({
                    'name': [name],
                    'operation': operation,
                    'modifiers': modifier or '' if operation != 'getelementptr' else "inbounds ", #to follow the original json file
                    'datatype':  datatype,
                    'arguments':  f"{datatype}, {args.strip()}" if "ptr" in args.strip() else f"{datatype} {args.strip()}"
                })
        
        #only when store the data, I use different data structure
        match = re.match(r'store\s+(i\d+)\s+(x\S+),\s+ptr\s+(x\w+),\s+(align\s+\d+)', line.strip())
        if match:
            datatype, source_var, dest_ptr, modifier = match.groups()
            operation = "store"
            args = f"{datatype} {source_var}, ptr {dest_ptr}"

            entire_operations.append( {
                "name": ["_"],
                "operation": operation,
                "datatype": datatype,
                "arguments": args,
                "modifiers": modifier
            })

        if line.strip() == 'ret void':
            break

    json_output = [{
        'operation': function_name,
        'arguments': [remaining_args_str_fiat], ## original one is remaining_args_str
        'returns': [{'datatype': 'i64*', 'name': 'x0'}],
        'body': entire_operations
    }]

    return json_output


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Usage: python3 llvm2json.py <llvm_ir_file> <output_json_file>")
        sys.exit(1)

    function_name = "rust_fiat_curve25519_solinas_mul_small_two_carry"

    reamain_args_str_fiat = "ptr noalias nocapture noundef writeonly align 8 dereferenceable(40) %out1, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %arg1, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %arg2"
    remaining_args_str_fiat = "%out1, %arg1, %arg2"
    remaining_args_str_fiat = re.sub(r'%out1', 'x0', remaining_args_str_fiat) ## x0 is the output argument
    remaining_args_str_fiat = re.sub(r'%arg1', 'x1', remaining_args_str_fiat) ## x1 is the first input argument
    remaining_args_str_fiat = re.sub(r'%arg2', 'x2', remaining_args_str_fiat) ## x2 is the second input argument

    llvm_ir_file = sys.argv[1]
    output_json_file = sys.argv[2]
    cleaned_llvm = parse_llvm_ir(llvm_ir_file) ## clean memory representation and integrate the operations s.t. addcarryx
    # print(f"cleaned_llvm: {cleaned_llvm}")
    optimised_llvm = eliminate_unnecessary_zext(cleaned_llvm) ## eliminate the unnecessary zext operations if they are used for addcarryx arguments
    # print(f"optimised_llvm: {optimised_llvm}")
    # renumbered_llvm = renumber_variables(optimised_llvm) ## renumber the variables sequentially starting from x0  
    json_output = convert_to_json(optimised_llvm, function_name, remaining_args_str_fiat) ## convert the cleaned llvm to json format
    # print(f"json_output: {json_output}")

    with open(output_json_file, 'w') as outfile:
        json.dump(json_output, outfile, indent=2)