import sys
import json
import re

def parse_llvm_ir(file_path):
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

    remaining_args_str = ', '.join(remanining_args)


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

    def replace_var(match):
        nonlocal memory_counter
        var = match.group(0)
        if var not in x_mapping:
            x_mapping[var] = f'x{memory_counter}'
            # if memory_counter == 1133 or memory_counter == 1141 or memory_counter == 1150 or memory_counter == 1158 or memory_counter == 1167 or memory_counter == 1175 or memory_counter == 1184 or memory_counter == 1192:
            #     print(f"var: {var}, x_mapping[var]: {x_mapping[var]}")
            memory_counter += 1
        return x_mapping[var]

    for line in llvm_ir.strip().split('\n'):

        #Skip and bb{number} lines
        if line.startswith('bb') or line.startswith('br'):
            continue

        # Skip panic calls until panic blocks finish with unreachable
        if 'panic' in line:
            panic_skip_flag = True
            continue
    
        if 'unreachable' in line:
            panic_skip_flag = False
            continue

        #skip while panic_skip_flag is True
        if panic_skip_flag:
            continue

        # Replace all variable names and memory locations with sequential numbers
        line = re.sub(r'%[\w.]+', replace_var, line)
        line = re.sub(r'ptr %(\w+)', lambda m: f'ptr x{x_mapping.get(m.group(1), m.group(1))}', line)


        #Pattern for operations that might have nuw/nsw mdofifiers
        op_pattern = r'(x[\w.]+)\s*=\s*(\w+)\s*((?:nuw|nsw|ult|ugt|eq|ne)\s*(?:nuw|nsw|ns|ult|ugt|eq|ne)?)\s*(i\d+)\s*(.+)'
        #op_pattern = r'(x[\w.]+)\s*=\s*(\w+)\s*((?:nuw|nsw|ult|ugt|eq|ne)\s*)*\s*(i\d+)\s*(.+)'
        op_match = re.match(op_pattern, line.strip())
        
        if op_match:
            name, operation, modifier, datatype, args = op_match.groups()


            # print(f"name:{name}", f"operation:{operation}", f"modifier:{modifier}", f"datatype:{datatype}", f"args:{args}")
            # print('\n')

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
        'arguments': [remaining_args_str],
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