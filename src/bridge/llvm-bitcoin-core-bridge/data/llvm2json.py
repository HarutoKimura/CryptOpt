import sys
import json
import re

def parse_llvm_ir(file_path):
    with open(file_path, 'r') as file:
        llvm_ir = file.read()

    # Extract the function definition
    match = re.search(r'define (\w+) (@_ZN[^(]+)\(([^)]+)\)', llvm_ir)
    if not match:
        raise ValueError("Function definition not found")

    return_type = match.group(1)
    function_name = match.group(2)
    function_args = match.group(3).strip()

    # Extract the function body
    match = re.search(r'{([^}]+)}', llvm_ir, flags=re.DOTALL)
    if not match:
        raise ValueError("Function body not found")

    function_body = match.group(1).strip()

    # Parse the function body
    #pattern = r'(%[\w.]+) = (\w+)(?: (inbounds))?\s*(?:\[[\d\s]*x\s*)?(\w+)[\]*\s]*(?:,?\s*(.+))?'
    operations = []

    for line in llvm_ir.strip().split('\n'):

        print("line before", line)
        # %N -> xN
        line = re.sub(r'%(\S+)', r'x\1', line)
        line = re.sub(r'_(\S+)', r'\1', line)

        print("line after % -> x", line)

         # xNN = function_name OPT_args iNN (datatype) whatever -> JSON
        match = re.match(r'(x[\w.]+) = (\w+)(?: (inbounds))?\s*(?:\[[\d\s]*x\s*)?(\w+)[\]*\s]*(?:,?\s*(.+))?', line.strip())
        if match:
            name, operation, modifier, datatype, args = match.groups()
            # Remove trailing comma from datatype if present
            datatype = datatype.rstrip(',')
            
            operations.append({
                'name': [name],
                'operation': operation,
                'modifier': modifier or '',
                'datatype': datatype,
                'arguments':  f"{datatype}, {args}" if args else ""
            })
        
        #only when store the data, we use different data structure
        match = re.match(r'store\s+(i\d+)\s+(\%\S+),\s+ptr\s+(\%\w+),\s+(align\s+\d+)', line.strip())
        if match:
            datatype, source_var, dest_ptr, modifier = match.groups()
            operation = "store"
            args = f"{datatype} {source_var}, ptr {dest_ptr}"

            operations.append({
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
        'arguments': [function_args],
        'returns': [{'datatype': 'i64*', 'name': 'x0'}],
        'body': operations
    }]

    return json_output

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Usage: python llvm2json.py <llvm_ir_file> <output_json_file>")
        sys.exit(1)

    llvm_ir_file = sys.argv[1]
    output_json_file = sys.argv[2]
    json_output = parse_llvm_ir(llvm_ir_file)

    with open(output_json_file, 'w') as outfile:
        json.dump(json_output, outfile, indent=2)