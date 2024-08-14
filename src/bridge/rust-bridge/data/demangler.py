import re
import sys
from operation_transformer import decompose_select, decompose_sext 

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
        mangled_pattern = r'@(_RNv.*?' + re.escape(rust_name) + r')\('
        for match in re.finditer(mangled_pattern, content):
            mangled_name = match.group(1)
            content = content.replace(mangled_name, rust_name)

    # # Remove attributes and metadata
    # content = re.sub(r'attributes #0 = \{.*?\}', '', content, flags=re.DOTALL)
    # content = re.sub(r'attributes #1 = \{.*?\}', '', content, flags=re.DOTALL)
    # content = re.sub(r'attributes #2 = \{.*?\}', '', content, flags=re.DOTALL)

    
    lines = content.split('\n')
    filtered_lines = []
    panic_skip_flag = False
    metadata_section = False
    for line in lines:
        print(f"line: {line}")
        # Skip and bb{number} lines
        if line.startswith('bb') or 'br' in line:
            # print(f"line: {line}")
            continue

        # Skip panic calls until panic blocks finish with unreachable
        if 'panic' in line:
            panic_skip_flag = True
            continue
    
        if 'unreachable' in line:
            panic_skip_flag = False
            continue

        # Skip while panic_skip_flag is True
        if panic_skip_flag:
            continue
        
        if "sext" in line:
            decompose = decompose_sext(line)
            filtered_lines.append(decompose)
            continue
            
        if "select" in line:
            decompose = decompose_select(line)
            filtered_lines.append(decompose)
            continue


        # Handle metadata section
        if "attributes" in line or line.startswith('!llvm.module.flags') or line.startswith('!llvm.ident'):
            metadata_section = True
            print(f"line: {line}")

        if metadata_section:
            if line.startswith('!3 =') or line.startswith('!4 =') or line.startswith('!5 ='):
                filtered_lines.append(line)
            elif not line.strip().startswith('!'):
                metadata_section = False
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