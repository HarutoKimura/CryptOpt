import sys
import json
import re

def parse_llvm_ir(file_path):
    with open(file_path, 'r') as file:
        llvm_ir = file.read()

    # regex to capture function definition including complex names and arguments up to 'unnamed_addr #0'
    pattern = r'define (\w+) @([^\s]+)\((.*?)\) unnamed_addr #0'
    match = re.search(pattern, llvm_ir, re.DOTALL)
    if not match:
        raise ValueError("Function definition not found")

    return_type = match.group(1)
    function_name = match.group(2)
    function_args = match.group(3)

    # Split the arguments by "," and strip whitespace
    args_list = [arg.strip() for arg in function_args.split(",")]

    #Exclude the first argument
    remanining_args = args_list[1:]

    remaining_args_str = ', '.join(remanining_args)


    remaining_args_str = re.sub(r'%(\S+)', r'x\1', remaining_args_str)
    remaining_args_str = re.sub(r'xa', r'x1', remaining_args_str)
    remaining_args_str = re.sub(r'xb', r'x2', remaining_args_str)

    # Extract the function body
    match = re.search(r'{([^}]+)}', llvm_ir, flags=re.DOTALL)
    if not match:
        raise ValueError("Function body not found")

    function_body = match.group(1).strip()

    entire_operations = []
    x_mapping = {}
    memory_counter = 0

    def replace_var(match):
        nonlocal memory_counter
        var = match.group(0)
        if var not in x_mapping:
            x_mapping[var] = f'x{memory_counter}'
            memory_counter += 1
        return x_mapping[var]

    for line in llvm_ir.strip().split('\n'):

        # Replace all variable names and memory locations with sequential numbers
        line = re.sub(r'%[\w.]+', replace_var, line)
        line = re.sub(r'ptr %(\w+)', lambda m: f'ptr x{x_mapping.get(m.group(1), m.group(1))}', line)


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


            # add the operations as the body
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