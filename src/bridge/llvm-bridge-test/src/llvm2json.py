import sys
import json
import re

def parse_llvm_ir(file_path):
    with open(file_path, 'r') as file:
        llvm_ir = file.read()

    # Remove comments and empty lines
    llvm_ir = re.sub(r';.*', '', llvm_ir)
    llvm_ir = re.sub(r'^\s*\n', '', llvm_ir, flags=re.MULTILINE)

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
    operations = []
    for line in function_body.split('\n'):
        line = line.strip()
        if not line:
            continue

        match = re.match(r'(%\w+(?:\.\w+)?) = (\w+)(?: (\w+))? (%\w+(?:\.\w+)?)(, (%\w+(?:\.\w+)?))?', line)
        if match:
            name = match.group(1)
            operation = match.group(2)
            datatype = match.group(3) if match.group(3) else ''
            arguments = ', '.join(filter(None, [match.group(4), match.group(6)]))
            operations.append({
                'name': [name],
                'operation': operation,
                'datatype': datatype,
                'arguments': arguments
            })
        elif line.startswith('ret '):
            match = re.match(r'ret (\w+) (\d+)', line)
            if match:
                operations.append({
                    'operation': 'return',
                    'datatype': match.group(1),
                    'value': match.group(2)
                })

    json_output = {
        'operation': function_name,
        'arguments': [function_args],
        'returns': [{'datatype': f'{return_type}*', 'name': '%x0'}],
        'body': operations
    }

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