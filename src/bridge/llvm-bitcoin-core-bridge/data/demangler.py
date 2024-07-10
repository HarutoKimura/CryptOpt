import re
import sys

def extract_rust_functions(rust_file):
    functions = {}
    with open(rust_file, 'r') as f:
        content = f.read()
        # This regular expression is to capture the original function name and its parrameters
        for match in re.finditer(r'fn\s+(\w+)\s*\((.*?)\)', content, re.DOTALL):
            name = match.group(1)
            params = match.group(2)
            functions[name] = params
            
    return functions

def process_llvm_ir(llvm_file, rust_functions, output_file):
    with open(llvm_file, 'r') as f:
        content = f.read()
    
    for rust_name, params in rust_functions.items():
        # This regex needs to be adjusted based on the actual mangling pattern
        mangled_pattern = r'@(_RNv.*?' + re.escape(rust_name) + r')\('
        for match in re.finditer(mangled_pattern, content):
            mangled_name = match.group(1)
            content = content.replace(mangled_name, rust_name)

    # Remove attributes and metadata
    content = re.sub(r'attributes #0 = \{.*?\}', '', content, flags=re.DOTALL)
    
    # Remove specific metadata while keeping !3 = !{}
    lines = content.split('\n')
    filtered_lines = []
    skip_section = False
    for line in lines:
        if line.startswith('!llvm.module.flags') or line.startswith('!llvm.ident'):
            skip_section = True
            continue
        if skip_section:
            if line.strip() == '!3 = !{}':
                filtered_lines.append(line)
                skip_section = False
            elif line.strip() and not line.strip().startswith('!'):
                skip_section = False
                filtered_lines.append(line)
        else:
            filtered_lines.append(line)
    
    content = '\n'.join(filtered_lines)
    
    # Remove empty lines
    content = re.sub(r'\n\s*\n', '\n', content)
    
    with open(output_file, 'w') as f:
        f.write(content)

if __name__ == "__main__":
    rust_file = sys.argv[1]
    llvm_file = sys.argv[2]
    output_file = sys.argv[3]

    rust_functions = extract_rust_functions(rust_file)
    process_llvm_ir(llvm_file, rust_functions, output_file)