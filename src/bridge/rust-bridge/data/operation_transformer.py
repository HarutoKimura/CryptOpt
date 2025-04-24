import re

def decompose_sext(sext_instruction):
    # Parse the input instruction
    parts = sext_instruction.split()
    dest = parts[0].strip('%')
    src = parts[-3].strip('%')
    src_type = parts[-4]
    dest_type = parts[-1]

    # # Extract the bit widths
    # src_width = int(src_type[1:])
    # dest_width = int(dest_type[1:])

    # if dest_width == 1:
    #     sub_value = 1
    # elif dest_width == 8:
    #     sub_value = 255
    # elif dest_width == 16:
    #     sub_value = 65535
    # elif dest_width == 32:
    #     sub_value = 4294967295
    # elif dest_width == 64:
    #     sub_value = 2 ** 64 - 1
    # elif dest_width == 128:
    #     sub_value = 2 ** 128 - 1
    # ## conditional move version


    # previous one
    ## -1:u64 = 18446744073709551615:u64
    operations = [
        f" %{dest} = cmovznz {src_type} %{src}, i64 0, i64 18446744073709551615"
    ]

    # ## new one
    # operations = [
    #     f" %{dest} = cmovznz {src_type} %{src}, i64 18446744073709551615, i64 0"
    # ]


    # since sub operation maight cause the error, I changed the sub part by using xor and add

    return '\n'.join(operations)
    

def decompose_select(select_instruction):
    # %_1388 = select i1 %_1378.not, i64 0, i64 %_0.i551

    # Parse the input instruction
    parts = select_instruction.split(',')
   
    dest = parts[0].split('=')[0].strip()
    
    condition = parts[0].split()[-1].strip()
    condition_data_type = parts[0].split()[-2].strip()
    # condition data type is i1 but for CryptOpt, I set i64 as default
    true_value = parts[1].split(' ')[-1].strip()

    true_value_data_type = parts[1].split(' ')[1].strip()
   
    false_value_data_type = parts[2].split(' ')[1].strip()

    false_value = parts[2].split(' ')[-1].strip()

    # Extract the type
    type_parts = parts[0].split()
    result_type = type_parts[1]
    
    # # current one using cmovznz operation
    # operations = [
    #     f" {dest} = cmovznz {condition_data_type} {condition}, {true_value_data_type} {true_value}, {false_value_data_type} {false_value}"
    # ]

    # current one using cmovznz operation
    # new order
    operations = [
        f" {dest} = cmovznz {condition_data_type} {condition}, {false_value_data_type} {false_value}, {true_value_data_type} {true_value}"
    ]

    return '\n'.join(operations)

def negative_add_check(instruction):
    # Skip empty lines or lines that don't contain actual instructions
    if not instruction or '{' in instruction or '}' in instruction:
        return False
        
    # Split the instruction into parts
    parts = instruction.split()
    
    # Check if we have enough parts to be a valid instruction
    if len(parts) < 2:
        return False
        
    # Get the last part (potential negative number)
    src2 = parts[-1]
    
    # Check if it's a register (starts with %) or a number
    if not src2.startswith('%'):
        try:
            # Try to convert to integer
            value = int(src2)
            # Check if it's a negative add instruction
            return "add" in instruction and value < 0
        except ValueError:
            # If conversion fails, return False
            return False
            
    return False

def change_negative_add_to_sub(instruction):

    # input example
    # %x1.i540 = add nsw i128 %_8.i539, -18446744073709551615

    # Parse the input instruction
    parts = instruction.split()
    dest = parts[0].strip('%')
    src1 = parts[5].strip(',')
    src2 = parts[-1]
    new_src2 = src2.strip('-')
    datatype = parts[4]

    operations = [
        f"%{dest} = sub {datatype} {src1}, {new_src2} // change negative add to sub"
    ]   

    return '\n'.join(operations)





def combine_shift_trunc_operations(shift_instruction, trunc_instruction):
    """
    Combines a shift (lshr/ashr) and subsequent trunc operation into a single operation.
    Returns a tuple of the combined operation and the destination register.
    """
    # Parse shift instruction
    shift_parts = shift_instruction.split()
    if len(shift_parts) < 6:  # Basic validation
        return None, None, None
        
    shift_dest = shift_parts[0].strip('%')
    shift_type = shift_parts[3]  # i128
    shift_src = shift_parts[4].strip('%')
    shift_amount = shift_parts[5]
    
    # Parse trunc instruction
    trunc_parts = trunc_instruction.split()
    if len(trunc_parts) < 6:  # Basic validation
        return None, None, None
        
    trunc_dest = trunc_parts[0].strip('%')
    trunc_type = trunc_parts[5]  # i64/i8
    trunc_src = trunc_parts[4].strip('%,')
    
    # Verify the pattern matches (shift result is truncated)
    if shift_dest != trunc_src:
        return None
    
    # Always use i64 as the destination type as specified
    # some of ashr and trunc pair has i8 as a destination type but CryptOpt uses u64 and now it doesn't support i8
    dest_type = "i64"
    
    # Determine which shift operation it was
    shift_op = "lshr" if "lshr" in shift_instruction else "ashr"
    
    # Generate the combined operation
    return (
        f"%{trunc_dest} = {shift_op} {shift_type} %{shift_src} {shift_amount} // yes, I am marged: {shift_op}+trunc",
        shift_dest,
        trunc_dest
    )


def should_combine_shift_trunc(shift_instruction, next_instruction):
    """
    Determines if the given pair of instructions matches our shift+trunc pattern
    and should be combined.
    """
    if not shift_instruction or not next_instruction:
        return False
        
    # Check if first instruction is a shift
    if (not ("lshr" in shift_instruction)) and (not ("ashr" in shift_instruction)):
        return False
        
    # Check if second instruction is a trunc
    if "trunc" not in next_instruction:
        return False
        
    # Check if the shift result is used in the trunc
    shift_dest = shift_instruction.split()[0].strip('%')
    trunc_src = next_instruction.split()[4].strip('%')
    
    return shift_dest == trunc_src


def process_ir_instructions(instructions):
    """
    Process a list of LLVM IR instructions and combine shift+trunc patterns.
    Returns the transformed instructions.
    """
    result = []
    i = 0
    while i < len(instructions):
        if i + 1 < len(instructions) and should_combine_shift_trunc(instructions[i], instructions[i + 1]):
            combined = combine_shift_trunc_operations(instructions[i], instructions[i + 1])
            if combined:
                result.append(combined)
                i += 2  # Skip both instructions
                continue
        result.append(instructions[i])
        i += 1
    return result

def replace_variable_references(lines, start_idx, old_var, new_var):
    """
    Replace all references to old_var with new_var in the remaining lines
    """
    modified_lines = []
    for i, line in enumerate(lines):
        if i < start_idx:  # Keep lines before the replacement point unchanged
            modified_lines.append(line)
        else:
            # Replace references to the old variable with the new variable
            # Using word boundaries to ensure we only replace whole variable names
            modified_line = re.sub(
                r'%' + re.escape(old_var) + r'\b', 
                '%' + new_var, 
                line
            )
            modified_lines.append(modified_line)
    return modified_lines


## carry, arg1, arg2 exist so add 128 + add 128 pattern -> addcarryx_u64
def recognize_addcarryx_pattern_add_add_lshr(line1_add, line2_add, line3_lshr):
    # Look for this pattern:
    # 1. Two consecutive 128-bit adds
    lower_64_bit_part =extract_dest_name(line2_add)
    carry_out = extract_dest_name(line3_lshr)

    carry = extract_second_arg(line2_add)
    arg1 = extract_first_arg(line1_add)
    arg2 = extract_second_arg(line1_add)

    return f"{lower_64_bit_part}, {carry_out} = addcarryx i64 {carry} {arg1} {arg2}"   

def recognize_addcarryx_pattern_add_add_trunc(line1_add, line2_add, line3_trunc):

    lower_64_bit_part = extract_dest_name(line3_trunc)
    carry_out = extract_dest_name(line2_add) # bexaue no place to store the carry

    carry = extract_second_arg(line2_add)
    arg1 = extract_first_arg(line1_add)
    arg2 = extract_second_arg(line1_add)

    return f"{lower_64_bit_part}, {carry_out} = addcarryx i64 {carry} {arg1} {arg2}"

def recognize_addcarryx_pattern_add_add_trunc_lshr(line1_add, line2_add, line3_trunc, line4_lshr):

    lower_64_bit_part = extract_dest_name(line3_trunc)
    carry_out = extract_dest_name(line4_lshr)

    carry = extract_second_arg(line2_add)
    arg1 = extract_first_arg(line1_add)
    arg2 = extract_second_arg(line1_add)

    return f"{lower_64_bit_part}, {carry_out} = addcarryx i64 {carry} {arg1} {arg2}"    

## one of the carry, arg1, arg2 doesn't exist so add 128 -> addcarryx_u64
def recognize_addcarryx_pattern_add_lshr(line_add, line_lshr):
    # Look for this pattern:
    # 1. Two consecutive 128-bit adds
    lower_64_bit_part =extract_dest_name(line_add)
    carry_out = extract_dest_name(line_lshr)

    arg1 = extract_first_arg(line_add)
    arg2 = extract_second_arg(line_add)

    return f"{lower_64_bit_part}, {carry_out} = addcarryx i64 0 {arg1} {arg2}"

## trunc + lshr combination 
def recognize_addcarryx_pattern_add_trunc_lshr(line1_add, line2_trunc, line3_lshr):
    # Look for this pattern:
    # 1. Two consecutive 128-bit add
    lower_64_bit_part =extract_dest_name(line2_trunc)
    carry_out = extract_dest_name(line3_lshr)

    arg1 = extract_first_arg(line1_add)
    arg2 = extract_second_arg(line1_add)

    return f"{lower_64_bit_part}, {carry_out} = addcarryx i64 0 {arg1} {arg2}"

def recognize_addcarryx_pattern_add_lshr_and(line1_add, line2_lshr, line3_and):
    # Look for this pattern:
    # 1. Two consecutive 128-bit add
    lower_64_bit_part =extract_dest_name(line3_and)
    carry_out = extract_dest_name(line2_lshr)

    arg1 = extract_first_arg(line1_add)
    arg2 = extract_second_arg(line1_add)

    return f"{lower_64_bit_part}, {carry_out} = addcarryx i64 0 {arg1} {arg2}"

# def recognize_addcarryx_pattern_add_add_trunc_lshr(line1_add, line2_add, line3_trunc, line4_lshr):
#     return f"{extract_dest_name(line3_trunc)}, {extract_dest_name(line4_lshr)} = addcarryx i64 {extract_second_arg(line2_add)} {extract_first_arg(line1_add)} {extract_second_arg(line1_add)}"

def recognize_addcarryx_pattern_add_add_trunc_lshr(line1_add, line2_add, line3_trunc, line4_lshr):
    
    # Extract the carry from previous operation
    carry = extract_second_arg(line2_add)
    
    # Extract operands from first add
    arg1 = extract_first_arg(line1_add)
    arg2 = extract_second_arg(line1_add)
    
    # Get result and carry names
    lower_64_bit_part = extract_dest_name(line3_trunc)
    carry_out = extract_dest_name(line4_lshr)
    
    return f"{lower_64_bit_part}, {carry_out} = addcarryx i64 {carry} {arg1} {arg2}"

def recognize_addcarryx_pattern_add_add_lshr_and(line1_add, line2_add, line3_lshr, line4_and):
    
    # Extract the carry from previous operation
    carry = extract_second_arg(line2_add)
    
    # Extract operands from first add
    arg1 = extract_first_arg(line1_add)
    arg2 = extract_second_arg(line1_add)
    
    # Get result and carry names
    lower_64_bit_part = extract_dest_name(line4_and)
    carry_out = extract_dest_name(line3_lshr)
    
    return f"{lower_64_bit_part}, {carry_out} = addcarryx i64 {carry} {arg1} {arg2}"

def extract_first_arg(line):
    parts = line.split()
    return parts[6]

def extract_second_arg(line):
    parts = line.split()
    return parts[7]

def extract_dest_name(line):
    parts = line.split()
    return parts[0]


def find_related_operations(lines, start_index, current_var):
    """
    Find related lshr, trunc, and, and add operations that use the current variable.
    Returns a dictionary with found operations and their indices.
    """
    result = {
        'lshr_idx': -1, 'lshr_line': None,
        'trunc_idx': -1, 'trunc_line': None,
        'and_idx': -1, 'and_line': None,
        'add_idx': -1, 'add_line': None
    }
    
    # Find operations that use the current variable
    for i in range(start_index + 1, len(lines)):
        line = lines[i]
        if current_var in line:
            if "lshr i128" in line and result['lshr_idx'] == -1:
                result['lshr_idx'] = i
                result['lshr_line'] = line
            elif "trunc i128" in line and result['trunc_idx'] == -1:
                result['trunc_idx'] = i
                result['trunc_line'] = line
            elif "and i128" in line and result['and_idx'] == -1:
                result['and_idx'] = i
                result['and_line'] = line
            elif "add nuw nsw i128" in line and result['add_idx'] == -1:
                result['add_idx'] = i
                result['add_line'] = line
                
    return result

def recognize_addcarryx_pattern_preserve(lines, start_index):
    """
    Recognize all addcarryx patterns while preserving intermediate operations.
    Returns (result_line, lines_to_skip, skip_indices) if pattern found, (None, 0, []) otherwise.
    """
    current_line = lines[start_index]
    
    if "add nuw nsw i128" in current_line:
        current_var = extract_dest_name(current_line)
        ops = find_related_operations(lines, start_index, current_var)
        
        # Pattern 1: add + lshr + ... + and
        if ops['lshr_idx'] != -1 and ops['and_idx'] != -1:
            result_line = (
                f"{extract_dest_name(ops['and_line'])}, {extract_dest_name(ops['lshr_line'])} = "
                f"addcarryx i64 0 {extract_first_arg(current_line)} {extract_second_arg(current_line)}"
            )
            return result_line, 1, [start_index, ops['lshr_idx'], ops['and_idx']]
            
        # Pattern 2: add + lshr + trunc + ... + and
        if ops['lshr_idx'] != -1 and ops['trunc_idx'] != -1 and ops['and_idx'] != -1:
            result_line = (
                f"{extract_dest_name(ops['and_line'])}, {extract_dest_name(ops['trunc_line'])} = "
                f"addcarryx i64 0 {extract_first_arg(current_line)} {extract_second_arg(current_line)}"
            )
            return result_line, 1, [start_index, ops['lshr_idx'], ops['trunc_idx'], ops['and_idx']]
            
        # Pattern 3: add + lshr + ... + trunc
        if ops['lshr_idx'] != -1 and ops['trunc_idx'] != -1:
            result_line = (
                f"{extract_dest_name(ops['trunc_line'])}, {extract_dest_name(ops['lshr_line'])} = "
                f"addcarryx i64 0 {extract_first_arg(current_line)} {extract_second_arg(current_line)}"
            )
            return result_line, 1, [start_index, ops['lshr_idx'], ops['trunc_idx']]
            
        # Pattern 4: add + trunc + lshr
        if ops['trunc_idx'] != -1 and ops['lshr_idx'] != -1 and ops['trunc_idx'] < ops['lshr_idx']:
            result_line = (
                f"{extract_dest_name(ops['trunc_line'])}, {extract_dest_name(ops['lshr_line'])} = "
                f"addcarryx i64 0 {extract_first_arg(current_line)} {extract_second_arg(current_line)}"
            )
            return result_line, 1, [start_index, ops['trunc_idx'], ops['lshr_idx']]
        
        # For patterns 5-8, we need to look for another add operation first
        if ops['add_idx'] != -1:
            # Get operations related to the second add
            second_var = extract_dest_name(ops['add_line'])
            second_ops = find_related_operations(lines, ops['add_idx'], second_var)
            
            # Pattern 5: add + add + lshr + trunc + ... + and
            if second_ops['lshr_idx'] != -1 and second_ops['trunc_idx'] != -1 and second_ops['and_idx'] != -1:
                result_line = (
                    f"{extract_dest_name(second_ops['and_line'])}, {extract_dest_name(second_ops['trunc_line'])} = "
                    f"addcarryx i64 {extract_second_arg(ops['add_line'])} "
                    f"{extract_first_arg(current_line)} {extract_second_arg(current_line)}"
                )
                return result_line, 1, [start_index, ops['add_idx'], second_ops['lshr_idx'], 
                                      second_ops['trunc_idx'], second_ops['and_idx']]
                
            # Pattern 6: add + add + lshr + ... + and
            if second_ops['lshr_idx'] != -1 and second_ops['and_idx'] != -1:
                result_line = (
                    f"{extract_dest_name(second_ops['and_line'])}, {extract_dest_name(second_ops['lshr_line'])} = "
                    f"addcarryx i64 {extract_second_arg(ops['add_line'])} "
                    f"{extract_first_arg(current_line)} {extract_second_arg(current_line)}"
                )
                return result_line, 1, [start_index, ops['add_idx'], second_ops['lshr_idx'], second_ops['and_idx']]
                
            # Pattern 7: add + (another line) + add + lshr + trunc + ... + and
            if second_ops['lshr_idx'] != -1 and second_ops['trunc_idx'] != -1 and second_ops['and_idx'] != -1:
                result_line = (
                    f"{extract_dest_name(second_ops['and_line'])}, {extract_dest_name(second_ops['trunc_line'])} = "
                    f"addcarryx i64 {extract_second_arg(ops['add_line'])} "
                    f"{extract_first_arg(current_line)} {extract_second_arg(current_line)}"
                )
                return result_line, 1, [start_index, ops['add_idx'], second_ops['lshr_idx'], 
                                      second_ops['trunc_idx'], second_ops['and_idx']]
                
            # Pattern 8: add + (another line) + add + lshr + ... + and
            if second_ops['lshr_idx'] != -1 and second_ops['and_idx'] != -1:
                result_line = (
                    f"{extract_dest_name(second_ops['and_line'])}, {extract_dest_name(second_ops['lshr_line'])} = "
                    f"addcarryx i64 {extract_second_arg(ops['add_line'])} "
                    f"{extract_first_arg(current_line)} {extract_second_arg(current_line)}"
                )
                return result_line, 1, [start_index, ops['add_idx'], second_ops['lshr_idx'], second_ops['and_idx']]
    
    return None, 0, []


# def recognize_addcarryx_pattern_add_add_trunc_lshr(add1, add2, trunc1, trunc2):
#     """
#     Recognize pattern:
#     add + add + trunc + lshr + trunc -> addcarryx
#     Extract both destination variables correctly
#     """
#     # Extract first destination from first trunc
#     dest1 = trunc1.split('=')[0].strip()
#     # Extract second destination from second trunc
#     dest2 = trunc2.split('=')[0].strip()
    
#     # Extract arguments from the adds
#     parts1 = add1.split()
#     parts2 = add2.split()
#     arg1 = parts1[4]  # First argument
#     arg2 = parts1[5]  # Second argument
#     arg3 = parts2[5]  # Third argument
    
#     return f"{dest1}, {dest2} = addcarryx i64 {arg1}, {arg2}, {arg3}"


def recognize_addcarryx_chain_lshr_trunc(lines: list, i: int) -> tuple[dict, int]:
    # Check if we have enough lines to check the pattern
    if i + 3 >= len(lines):
        return None, 0
        
    line1 = lines[i].strip()
    line2 = lines[i+1].strip()
    line3 = lines[i+2].strip()
    line4 = lines[i+3].strip() if i + 3 < len(lines) else ""

    # Match the add + add + lshr + trunc pattern
    add1 = re.match(r'x([\w.]+)\s*=\s*add nuw nsw i128\s*x([\w.]+),\s*x([\w.]+)', line1)
    add2 = re.match(r'x([\w.]+)\s*=\s*add nuw nsw i128\s*x([\w.]+),\s*x([\w.]+)', line2)
    shift = re.match(r'x([\w.]+)\s*=\s*lshr i128\s*x([\w.]+),\s*64', line3)
    trunc = re.match(r'x([\w.]+)\s*=\s*trunc i128\s*x([\w.]+)\s*to i64', line4)

    if add1 and add2 and shift and trunc:
        result_var = add2.group(1)  # Result (lower 64 bits)
        carry_var = trunc.group(1)  # Carry output

        # Replace % with x using your existing mapping
        return {
            "name": [result_var, carry_var],  # Both result and carry
            "operation": "addcarryx",
            "datatype": "u64",
            "arguments": [
                add1.group(2),  # First argument
                add1.group(3),  # Second argument
                add2.group(3)   # Third argument or 0x0
            ]
        }, 4
    
    return None, 0

def track_zext_operations(lines):
    """
    Tracks zext operations and their source/destination variables.
    Returns a dictionary mapping post-zext variables to their original values.
    """
    zext_map = {}
    for line in lines:
        if not isinstance(line, str):
            continue
            
        # Match zext operations
        match = re.match(r'(x[\w.]+)\s*=\s*zext\s*i64\s*(x[\w.]+)\s*to\s*i128', line.strip())
        if match:
            dest_var = match.group(1)
            src_var = match.group(2)
            zext_map[dest_var] = src_var
    return zext_map

def eliminate_zext_for_addcarryx(line, zext_map):
    """
    Modifies addcarryx operations to use pre-zext variables where possible.
    """
    if "addcarryx" not in line:
        return line
        
    # Extract the arguments
    parts = line.split()
    try:
        dest_vars = parts[0:2]  # The two output variables
        args = parts[5:]  # The input arguments
        
        # Replace any arguments that are in our zext_map
        modified_args = []
        for arg in args:
            arg = arg.strip(',')
            if arg in zext_map:
                modified_args.append(zext_map[arg])
            else:
                modified_args.append(arg)
                
        # Reconstruct the line
        return f"{dest_vars[0]}, {dest_vars[1]} = addcarryx i64 {', '.join(modified_args)}"
    except IndexError:
        return line  # Return original line if parsing fails

def process_instructions_with_zext_elimination(lines):
    """
    Main processing function that combines zext tracking and elimination.
    """
    # First pass: track all zext operations
    zext_map = track_zext_operations(lines)
    
    # Second pass: process the instructions
    processed_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        
        # Handle addcarryx pattern recognition as before
        if i + 2 < len(lines) and "add nuw nsw i128" in line:
            # Your existing addcarryx pattern recognition code here
            # But now also eliminate zext operations in the result
            modified_line = eliminate_zext_for_addcarryx(line, zext_map)
            processed_lines.append(modified_line)
            i += 3  # Skip the combined operations
            continue
            
        # For regular lines, still check for zext elimination
        modified_line = eliminate_zext_for_addcarryx(line, zext_map)
        processed_lines.append(modified_line)
        i += 1
        
    return processed_lines

# test_addcarryx_pattern = [
#         "%_11.i554 = add nuw nsw i128 %_8.i553, %_9.i553",
#         "%_12.i555 = add nuw nsw i128 %_11.i554, %_10.i553",
#         "%_13.i556 = lshr i128 %_12.i555, 64"
#     ]



if __name__ == '__main__':

    # test case
    sext_input_instruction = "%x802.neg = sext i1 %_1351 to i64"
    print("sext input")
    print(f" {sext_input_instruction}\n")

    sext_translation = decompose_sext(sext_input_instruction)
    print("sext output")
    print(sext_translation)

    print("\n")

    select_input_instruction = "%_1388 = select i1 %_1378.not, i64 0, i64 %_0.i551"
    print("select input")
    print(f" {select_input_instruction}\n")
    
    select_instruction = decompose_select(select_input_instruction)
    print("select output")
    print(select_instruction)


    nagative_add_input_instruction = "%x1.i540 = add nsw i128 %_8.i539, -18446744073709551615"
    print("negative add input")
    print(f" {nagative_add_input_instruction}\n")
    print("negative add check")
    print(negative_add_check(nagative_add_input_instruction))
    print("negative add output")
    print(change_negative_add_to_sub(nagative_add_input_instruction))

    print("\nTesting shift+trunc combinations:")
    
    # # Test case 1: lshr + trunc
    # test_instructions1 = [
    #     "%_14.i499 = lshr i128 %x1.i497, 64",
    #     "%x3.i500 = trunc i128 %_14.i499 to i64"
    # ]
    # print("\nTest case 1 (lshr):")
    # print("Input:")
    # print('\n'.join(test_instructions1))
    # print("\nOutput:")
    # print('\n'.join(process_ir_instructions(test_instructions1)))
    
    # # Test case 2: ashr + trunc
    # test_instructions2 = [
    #     "%_12.i553 = ashr i128 %x1.i552, 64",
    #     "%x2.i554 = trunc i128 %_12.i553 to i8"
    # ]
    # print("\nTest case 2 (ashr):")
    # print("Input:")
    # print('\n'.join(test_instructions2))
    # print("\nOutput:")
    # print('\n'.join(process_ir_instructions(test_instructions2)))


    test_addcarryx_pattern1 = [
        "%_11.i554 = add nuw nsw i128 %_8.i553, %_9.i553",
        "%_12.i555 = add nuw nsw i128 %_11.i554, %_10.i553",
        "%_13.i556 = lshr i128 %_12.i555, 64"
    ]


    test_addcarryx_pattern2 = [
        "%_11.i554 = add nuw nsw i128 %_8.i553, %_9.i553",
        "%_12.i555 = add nuw nsw i128 %_11.i554, %_10.i553",
        "%_13.i556 = lshr i128 %_12.i555, 64",
        "%_14.i557 = trunc i128 %_13.i556 to i64"
    ]


    # print("\nTest addcarryx pattern")
    # print("Input:")
    # print('\n'.join(test_addcarryx_pattern1))
    # print("\nOutput:")
    # print(recognize_addcarryx_pattern(test_addcarryx_pattern1))
    # print("\n")


    print("\nTest addcarryx pattern1")
    print("Input:")
    print('\n'.join(test_addcarryx_pattern1))
    print("\nOutput:")
    print(recognize_addcarryx_chain_lshr(test_addcarryx_pattern1, 0))

    print("\nTest addcarryx chain2")
    print("Input:")
    print('\n'.join(test_addcarryx_pattern2))
    print("\nOutput:")
    print(recognize_addcarryx_chain_lshr_trunc(test_addcarryx_pattern2, 0))


