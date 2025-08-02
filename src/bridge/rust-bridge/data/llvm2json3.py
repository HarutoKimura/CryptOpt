import sys
import json
import re
from operation_transformer import combine_shift_trunc_operations, negative_add_check, change_negative_add_to_sub, replace_variable_references, should_combine_shift_trunc

def parse_llvm_ir(file_path):
    with open(file_path, 'r') as file:
        llvm_ir = file.read()

    # regex to capture function definition including complex names and arguments up to 'unnamed_addr #0'
    # pattern = r'define (\w+) @([^\s]+)\((.*?)\) unnamed_addr #0'
    # pattern = r'define(?:\s+\w+)?\s+(\w+)\s+@([^\s]+)\((.*?)\)(?:\s+unnamed_addr)?\s+#0'
    pattern = r'define(?:\s+\w+)?\s+(\w+)\s+@([^\s]+)\((.*?)\)(?:\s+\w*unnamed_addr)?\s+#0'
    # pattern = r'define\s+i64\s+@(sext_transformer)\s*\(\s*(i1\s+%x)\s*\)\s*#0'
    match = re.search(pattern, llvm_ir, re.DOTALL)
    if not match:
        raise ValueError("Function definition not found")

    function_name = match.group(2)
    function_args_str = match.group(3)

        # ----------------------------------------------------------------
    # 2) Split the arguments by "," and parse
    # ----------------------------------------------------------------
    raw_args_list = [arg.strip() for arg in function_args_str.split(",")]

    # Let’s parse each argument into a `(full_attr_string, base_type, name)` triple.
    # Example single argument string might be:
    #   "ptr noalias nocapture noundef nonnull writeonly align 8 %out0.0"
    #   "i64 noundef %out0.1"
    # We'll do a simple RE that captures everything up to the final %something.
    arg_pattern = re.compile(r'^(?P<attributes>.*?)(?P<varname>%[\w\._]+)$')

    parsed_args = []
    for arg in raw_args_list:
        m = arg_pattern.search(arg)
        if not m:
            # Fallback if it doesn't match, or you can raise an error
            raise ValueError(f"Could not parse argument: {arg}")

        attributes = m.group('attributes').strip()
        var_name   = m.group('varname')  # e.g. "%out0.0"
        # For convenience, also extract "ptr" or "i64" from attributes if you want
        # but often you can keep the entire attribute string intact.
        # base_type = (attributes.split())[0]  # naive approach: first token
        # Instead, we’ll just keep the entire attributes as is.

        parsed_args.append((attributes, var_name))

    # ----------------------------------------------------------------
    # 3) Rename arguments in order => x0, x1, x2, ...
    #    (You can also detect function_name == "bls12_mul" to do special logic,
    #     or simply do enumerated renaming for *any* function.)
    # ----------------------------------------------------------------
    renamed_args = []
    for i, (attr, old_name) in enumerate(parsed_args):
        new_var_name = f"x{i}"
        # Reconstruct the argument line with the same attributes, but replaced variable name
        # So if it was "ptr noalias ... align 8 %out0.0" => "ptr noalias ... align 8 x0"
        new_arg_str = re.sub(old_name + r"$", new_var_name, attr + " " + old_name)
        # Or more directly:
        new_arg_str = attr.strip() + " " + new_var_name
        renamed_args.append(new_arg_str)

    # Turn the renamed list into the final string used in JSON
    remaining_args_str = ", ".join(renamed_args)


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
    count = 0
    print_yes = False
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

        # # Check for negative add pattern -> change to sub
        if negative_add_check(line):
            line = change_negative_add_to_sub(line)

        # if 'lshr' in line:
        #     print('okay we are here shift')

        # if 'trunc' in line:
        #     print('okay we are here trunc')

        # if 'lshr' in line and 'trunc' in lines[i + 1]:
        #     print('okay we are here shift and trunc')
        #     print('line:', line)
        #     print('lines[i + 1]:', lines[i + 1])
        #     splitted_line = line.split()
        #     splitted_line_next = lines[i + 1].split()

        #     print('splitted_line:', splitted_line)
        #     print('splitted_line_next:', splitted_line_next)

        #     line = f"{splitted_line_next[0]} = lshr i128 {splitted_line[4]} {splitted_line[5]}"

        #     print('line_test:', line)

        #     i += 1

        # ## general case
        i += 1

            

        # # Check for shift+trunc pattern -> combine into single operation
        # if i + 1 < len(lines) and should_combine_shift_trunc(line, lines[i + 1]):
        #     ##print(f"Combining shift+trunc: {line.strip()} {lines[i + 1].strip()}")
        #     combined_line, old_var, new_var = combine_shift_trunc_operations(line, lines[i + 1])
        #     if combined_line and old_var and new_var:
        #         # Replace all subsequent references to old_var with new_var
        #         lines = replace_variable_references(lines, i, old_var, new_var)
        #         # print(f"Replaced {old_var} with {new_var}")
        #         line = combined_line
        #         print(line)
        #         print_yes = True
        #         i += 2  # Skip the next line since we've combined it
        #     else:
        #         i += 1
        # else:
        #     i += 1

        # ## recognize the addcarryx pattern: add + add + lshr + trunc -> addcarryx
        # if (i + 2 < len(lines)) and ("add nuw nsw i128" in line) and ("add nuw nsw i128" in lines[i]) and ("lshr i128" in lines[i+1]) and ("trunc i128" in lines[i+2]):
        #     line = recognize_addcarryx_pattern_add_add_lshr(line, lines[i], lines[i+2])
        #     i += 3 # skip the next add line since I combined add + add -> addcarryx

        # ## recognize the addcarryx pattern: add + add + lshr -> addcarryx
        # if (i + 1 < len(lines)) and ("add nuw nsw i128" in line) and ("add nuw nsw i128" in lines[i]) and ("lshr i128" in lines[i+1]):
        #     line = recognize_addcarryx_pattern_add_add_lshr(line, lines[i], lines[i+1])
        #     i += 2 # skip the next add line since I combined add + add -> addcarryx

        # ## especially for the case of curve25519_solinas_addcaarryx_u64: through compiling it to the LLVM, addcarryx_u64 (u1 + u64) -> u128
        # if ('add nuw nsw i128' in line) and ("lshr i128" in lines[i]):
        #     line = recognize_addcarryx_pattern_add_lshr(line, lines[i])
        #     i += 1


        # if (i + 1 < len(lines)) and ('add nuw nsw i128' in line) and ("trunc i128" in lines[i]) and ("lshr i128" in lines[i+1]):
        #     line = recognize_addcarryx_pattern_trunc_lshr(line, lines[i], lines[i+1])
        #     i += 2
        # # Try to recognize addcarryx pattern first
        

        # Replace all variable names and memory locations with sequential numbers
        line = re.sub(r'%[\w.]+', replace_var, line)
        line = re.sub(r'ptr %(\w+)', lambda m: f'ptr x{x_mapping.get(m.group(1), m.group(1))}', line)


        ## from here, the cleaned llvm-ir is transformed to the json format


        # if "addcarryx" in line:
        #     print("Original line:", line)
        #     parts = line.strip().split()

        #     # Clean and prepare the names (remove comma)
        #     names = parts[0].rstrip(',')  # remove trailing comma from first name
            
        #     # Clean and prepare the arguments (remove commas)
        #     arg1 = parts[5].rstrip(',')  # remove trailing comma
        #     arg2 = parts[6].rstrip(',')  # remove trailing comma
        #     arg3 = parts[7].rstrip(',')  # remove trailing comma
            
        #     entire_operations.append({
        #         'name': [f"{names}", f"{parts[1]}"],  # Creates "x50, x51" format
        #         'operation': "addcarryx",
        #         'modifiers': "",
        #         'datatype': "i64",
        #         'arguments': f"{arg1}, {arg2}, {arg3}"  # Creates "x48, x18, x49" format
        #     })


        #Pattern for operations that might have nuw/nsw mdofifiers
        op_pattern = r'(x[\w.]+)\s*=\s*(\w+)\s*((?:nuw|nsw|ult|ugt|eq|ne|nneg)\s*(?:nuw|nsw|ns|ult|ugt|eq|ne|nneg)?)\s*(i\d+)\s*(.+)'
       
        op_match = re.match(op_pattern, line.strip())
        
        if op_match:
            name, operation, modifier, datatype, args = op_match.groups()

            # print(f"name:{name}", f"operation:{operation}", f"modifier:{modifier}", f"datatype:{datatype}", f"args:{args}")
            # print('\n')
            
            # Special handling for zext operation
            if operation == "zext":
                # For zext, we need to extract the target datatype from the arguments
                # The captured datatype is the source type, but we need the destination type
                # Pattern: "x46 to i128" or "%46 to i128" -> extract "i128" as the datatype
                zext_match = re.match(r'([x%]\d+)\s+to\s+(i\d+)', args.strip())
                if zext_match:
                    target_datatype = zext_match.group(2)
                    # Update datatype to the target type
                    datatype = target_datatype
                    # args remains unchanged - it should stay as "x46 to i128"
                
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
            #print("match", match)
            try:
                name, operation, modifier, datatype, args = match.groups()
            except ValueError:
                print(f"Error unpacking line: {line.strip()}")
                continue
            # Remove trailing comma from datatype if present
            datatype = datatype.rstrip(',')
            
            # Special handling for zext operation (same as above)
            if operation == "zext":
                # For zext, we need to extract the target datatype from the arguments
                # The captured datatype is the source type, but we need the destination type
                # Pattern: "x46 to i128" or "%46 to i128" -> extract "i128" as the datatype
                if args:
                    zext_match = re.match(r'([x%]\d+)\s+to\s+(i\d+)', args.strip())
                    if zext_match:
                        target_datatype = zext_match.group(2)
                        # Update datatype to the target type
                        datatype = target_datatype
                        # args remains unchanged

            # if operation == "icmp":
            #     print("datatype:", datatype)
            #     print("args:", args)
            #     # args_list = args.split(", ")
            #     # print("args_list", args_list)


            # if operation == "getelementptr":
            #     # ignore the first i64 0
            #     args_list = args.split(", ")
            #     # Check if 'i64 0' is present and remove the first occurrence
            #     if 'i64 0' in args:
            #         args_list.remove('i64 0')
            #     args = ", ".join(args_list)

############# for Fiat-C, get rid of alloca operations ############################


            if operation == "getelementptr":
                args_list = args.split(", ")

                # 1) Sometimes GEP includes an initial "i64 0". If you still want to remove that, do so:
                if 'i64 0' in args_list:
                    args_list.remove('i64 0')

                # 2) If the base type is `i8`, we want to convert any *constant* i64 offsets
                #    from byte-offsets into "word offsets" (divide by 8).
                if datatype == "i8":
                    # For each argument that looks like "i64 32", parse and divide by 8
                    new_args_list = []
                    pattern_i64_const = re.compile(r'^i64\s+(\d+)$')  
                    for item in args_list:
                        m = pattern_i64_const.match(item)
                        if m:
                            # It's a constant offset like "i64 32" 
                            offset_val = int(m.group(1))
                            offset_val //= 8  # divide by 8
                            item = f"i64 {offset_val}"
                        new_args_list.append(item)
                    args_list = new_args_list
                
                # Rebuild the final string
                args = ", ".join(args_list)



            if operation == "cmovznz":

                print(line)

                modified_args = re.sub(r'i64\s+0', '0', args)

                entire_operations.append({
                    'name': [name],
                    'operation': operation,
                    'modifiers': "",
                    'datatype':  "i64",
                    'arguments':  f"{datatype} {modified_args.strip()}"
                })
                continue

            # Remove align and !noundef from load operation
            if operation == "load":
                args = re.sub(r',\s*align\s+\d+,\s*!noundef\s+!\d+', '', args)


                #print(args)
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
        'arguments': [remaining_args_str], ## original one is remaining_args_str but I changed it to remaining_args_str_fiat
        'returns': [{'datatype': 'i64*', 'name': 'x0'}],
        'body': entire_operations
    }]

    return json_output

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Usage: python3 llvm2json.py <llvm_ir_file> <output_json_file>")
        sys.exit(1)

    llvm_ir_file = sys.argv[1]
    output_json_file = sys.argv[2]
    json_output = parse_llvm_ir(llvm_ir_file)

    with open(output_json_file, 'w') as outfile:
        json.dump(json_output, outfile, indent=2)