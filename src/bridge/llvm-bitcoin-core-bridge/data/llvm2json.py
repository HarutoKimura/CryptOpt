import sys
import json
import re

def parse_llvm_ir(file_path):
    with open(file_path, 'r') as file:
        llvm_ir = file.read()

    # Extract the function definition
    #preivous one
    #match = re.search(r'define (\w+) (@_ZN[^(]+)\(([^)]+)\)', llvm_ir)
    match = re.search(r'define (\w+) @(\w+)\((.*?)\)', llvm_ir)
    if not match:
        raise ValueError("Function definition not found")

    return_type = match.group(1)
    function_name = match.group(2)
    function_args = ", ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %a, ptr noalias nocapture noundef readonly align 8 dereferenceable(40) %b"
    function_args = re.sub(r'%(\S+)', r'x\1', function_args)
    function_args = re.sub(r'xa', r'x1', function_args)
    function_args = re.sub(r'xb', r'x2', function_args)
    print("function_args", function_args)

    # Extract the function body
    match = re.search(r'{([^}]+)}', llvm_ir, flags=re.DOTALL)
    if not match:
        raise ValueError("Function body not found")

    function_body = match.group(1).strip()

    # Parse the function body
    #pattern = r'(%[\w.]+) = (\w+)(?: (inbounds))?\s*(?:\[[\d\s]*x\s*)?(\w+)[\]*\s]*(?:,?\s*(.+))?'
    entire_operations = []
    x_mapping = {}
    memory_counter = 1

    def replace_var(match):
        nonlocal memory_counter
        var = match.group(0)
        if var not in x_mapping:
            x_mapping[var] = f'x{memory_counter}'
            memory_counter += 1
        return x_mapping[var]

    for line in llvm_ir.strip().split('\n'):

        # #original line 
        # #print("line before", line)
        # #%N -> xN
        # # line = re.sub(r'%(\S+)', r'x\1', line)
        # # line = re.sub(r'_(\S+)', r'\1', line)

        # # %_0.iN -> xN
        # line = re.sub(r'%_0\.i(\d+)',  r'x\1', line)
        # # %_0.i -> x0
        # line = re.sub(r'%_0\.i',  r'x0', line)

        # # %_N -> xN
        # line = re.sub(r'%_(\d+)', r'x\1', line)

        # # %{string}{number} -> x100{number}
        # line = re.sub(r'%\{string\}\{(\d+)\}', r'x100\1', line)

        # # for input argument %a -> xa,  %b -> xb
        # line = re.sub(r'%(\S+)', r'x\1', line)

        # #print("line after % -> x", line)

        # # # xa and xb -> x100 and x101
        # # line = re.sub(r'xa', r'x1', line)
        # # line = re.sub(r'xb', r'x2', line)


        # print("line after replace to xa and xb", line)

        # # Replace variable names
        # line = re.sub(r'x\d+', replace_var, line)

        # print("line after replace_var", line)

        # line = re.sub(r'xa', r'x1', line)
        # line = re.sub(r'xb', r'x2', line)

        # print("line after replace xa and xb", line)

        # Replace all variable names and memory locations with sequential numbers
        line = re.sub(r'%[\w.]+', replace_var, line)
        line = re.sub(r'ptr %(\w+)', lambda m: f'ptr x{x_mapping.get(m.group(1), m.group(1))}', line)


        # #Speicfic pattern for mul
        # mul_pattern = r'(x[\w.]+)\s*=\s*mul\s*((?:nuw|nsw)\s*(?:nuw|nsw)?)\s*(i\d+)\s*(.+)'
        # mul_match = re.match(mul_pattern, line.strip())
        
        # if mul_match:
        #     name, modifier, datatype, args = mul_match.groups()
        #     entire_operations.append( {
        #         'name': [name],
        #         'operation': 'mul',
        #         'modifier': modifier.strip(),
        #         'datatype': datatype,
        #         'arguments': f"{datatype}, {args.strip()}"
        #     })

        #Pattern for operations that might have nuw/nsw mdofifiers
        op_pattern = r'(x[\w.]+)\s*=\s*(\w+)\s*((?:nuw|nsw)\s*(?:nuw|nsw)?)\s*(i\d+)\s*(.+)'
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
            #print("match", match)
            try:
                name, operation, modifier, datatype, args = match.groups()
            except ValueError:
                print(f"Error unpacking line: {line.strip()}")
                continue
            # Remove trailing comma from datatype if present
            datatype = datatype.rstrip(',')

            if operation == "getelementptr":
                # ignore the first i64 0
                args_list = args.split(", ")
                # Check if 'i64 0' is present and remove the first occurrence
                if 'i64 0' in args:
                    args_list.remove('i64 0')
                args = ", ".join(args_list)
            

            # Remove align and !noundef from load operation
            if operation == "load":
                args = re.sub(r',\s*align\s+\d+,\s*!noundef\s+!\d+', '', args)

            # if operation == "mul" and modifier in ["nuw", "nsw"]:
            #     arguments = f"{datatype}, " + args if args else ""
            # else:
            #     arguments = f"{datatype}, {args}" if args else ""

            # if operation == "mul":
            #     print(f"name: {name}, modifier: {modifier}, datatype: {datatype}, args: {args}")
            #     print("\n")


            # if operation != "mul":
            #     entire_operations.append({
            #         'name': [name],
            #         'operation': operation,
            #         'modifier': modifier or '',
            #         'datatype': datatype,
            #         'arguments':  f"{datatype}, {args}" if args else ""
            #     })

            entire_operations.append({
                    'name': [name],
                    'operation': operation,
                    'modifiers': modifier or '' if operation != 'getelementptr' else "inbounds ", #to follow the original json file
                    'datatype': datatype,
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
        'operation': 'secp256k1_fe_mul_inner',
        'arguments': ["x1, x2"],
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