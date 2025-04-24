import re
import sys

# Extract the mul and square functions from the assembly code
def extract_functions(target_curve, input_text):
    lines = input_text.strip().split('\n')

    mul_lines = []
    square_lines = []
    current_function = None

    for line in lines:
        # Normalize line for easier detection
        norm_line = line.strip().lower()

        # Detect mul function
        if 'mul' in norm_line and f'{target_curve}' in norm_line and ':' in norm_line:
            current_function = 'mul'
            mul_lines.append(line)
        # Detect square function
        elif 'square' in norm_line and f'{target_curve}' in norm_line and ':' in norm_line:
            current_function = 'square'
            square_lines.append(line)
        else:
            if current_function == 'mul':
                mul_lines.append(line)
            elif current_function == 'square':
                square_lines.append(line)

    return mul_lines, square_lines

# Format the assembly code to be executed by AssemblyLine
def format_assembly_lines(lines, function_name):
    if not lines:
        return ""

    formatted_lines = []
    formatted_lines.append('SECTION .text')
    formatted_lines.append(f'GLOBAL {function_name}_nasm')

    for line in lines:
        if function_name in line and not function_name + "_nasm" in line:
            line = line.replace(function_name, f'{function_name}_nasm')

        if line.strip().startswith('.') or not line.strip() or "endbr64" in line:
            continue

        # Remove comments
        line = line.split('#')[0]
        if line == '' or not line.strip():
            continue

        # Clean up memory & register syntax
        line = line.replace('ptr ', '')
        line = line.replace('QWORD PTR ', '')
        line = line.replace('byte ptr ', '')
        line = line.replace('movabs', 'mov')
        line = line.replace('%', '')
        line = line.replace('$', '')

        # Remove labels like 0:, 1:, etc.
        line = re.sub(r'\b\d+:', '', line)

        # Remove extra whitespace
        line = re.sub(r'\s+', ' ', line.strip())

        # Add indentation
        if not line.endswith(':'):
            line = '\t' + line

        # Add blank line after ret (for readability)
        if "ret" in line and line != lines[-1]:
            line = line + '\n'

        formatted_lines.append(line)

    return '\n'.join(formatted_lines)

# Process the input file and write the formatted output to the output file
def process_files(target_curve, input, input_path, output_mul_path, output_square_path):
    with open(input_path, 'r') as f:
        input_text = f.read()

    # Extract functions
    mul_lines, square_lines = extract_functions(target_curve, input_text)

    # Format each function
    formatted_mul = format_assembly_lines(mul_lines, input)
    formatted_square = format_assembly_lines(square_lines, input)

    # Write mul function to its file
    with open(output_mul_path, 'w') as f:
        f.write(formatted_mul)

    # Write square function to its file
    with open(output_square_path, 'w') as f:
        f.write(formatted_square)

# Main
if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 asm-cleaner.py <target_curve> <input>")
        sys.exit(1)

    target_curve = sys.argv[1]
    input = sys.argv[2]
    input_asm = f"{input}.asm"

    # Generate proper output names
    if 'square' in input:
        output_square_file = input.replace('square', 'square_nasm') + '.asm'
        output_mul_file = input.replace('square', 'mul_nasm') + '.asm'
    elif 'mul' in input:
        output_mul_file = input.replace('mul', 'mul_nasm') + '.asm'
        output_square_file = input.replace('mul', 'square_nasm') + '.asm'
    else:
        # fallback default
        output_mul_file = f"{input}_mul_nasm.asm"
        output_square_file = f"{input}_square_nasm.asm"


    try:
        process_files(target_curve, input, input_asm, output_mul_file, output_square_file)
        print(f"Successfully separated and formatted functions from {input_asm}:")
        print(f"Multiplication -> {output_mul_file}")
        print(f"Square -> {output_square_file}")
    except FileNotFoundError:
        print("Please provide valid input and output file paths")
    except Exception as e:
        print(f"An error occurred: {str(e)}")
