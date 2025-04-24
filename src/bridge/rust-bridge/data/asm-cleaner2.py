import re
import sys
import os # Import the os module for path manipulation

def clean_assembly_lines(lines):
    """
    Cleans assembly lines by removing comments, unnecessary keywords,
    and formatting whitespace.

    Args:
        lines: A list of strings, where each string is a line of assembly code.

    Returns:
        A string containing the cleaned and formatted assembly code.
    """
    cleaned_output_lines = []
    num_lines = len(lines)

    for i, line in enumerate(lines):
        original_strip = line.strip()

        # Skip directives, blank lines, and endbr64 instruction
        if original_strip.startswith('.') or not original_strip or "endbr64" in original_strip:
            continue

        # Remove comments starting with #
        line_no_comment = line.split('#')[0]
        if not line_no_comment.strip():
            continue # Skip if line is only a comment

        # --- Start Cleaning ---
        cleaned_line = line_no_comment

        # Clean up memory & register syntax
        cleaned_line = cleaned_line.replace('ptr ', '')
        cleaned_line = cleaned_line.replace('QWORD PTR ', '')
        cleaned_line = cleaned_line.replace('byte ptr ', '')
        cleaned_line = cleaned_line.replace('movabs', 'mov')
        cleaned_line = cleaned_line.replace('%', '')
        cleaned_line = cleaned_line.replace('$', '')

        # Remove local labels like 0:, 1:, etc.
        cleaned_line = re.sub(r'\b\d+:', '', cleaned_line)

        # Remove extra whitespace
        cleaned_line = re.sub(r'\s+', ' ', cleaned_line.strip())

        # Add indentation to instructions (lines not ending with ':')
        if not cleaned_line.endswith(':'):
            cleaned_line = '\t' + cleaned_line

        cleaned_output_lines.append(cleaned_line)

        # Add a blank line after 'ret' for readability, but not if it's the last line
        # or the next line is already blank/comment/directive.
        if "ret" in cleaned_line and i < num_lines - 1:
             next_line_strip = lines[i+1].strip()
             if next_line_strip and not next_line_strip.startswith(('#', '.')):
                cleaned_output_lines.append('') # Add blank line

    return '\n'.join(cleaned_output_lines)

def main():
    """
    Main function to read an assembly file, clean it, and write the result
    to a new file.
    """
    if len(sys.argv) != 2:
        print("Usage: python3 clean_assembly.py <input_asm_file>")
        sys.exit(1)

    input_path = sys.argv[1]

    # Construct the output filename
    base, ext = os.path.splitext(input_path)
    if ext.lower() != '.asm':
        # Handle cases where the extension might not be .asm or is missing
        print(f"Warning: Input file '{input_path}' does not have a standard '.asm' extension.", file=sys.stderr)
        output_path = f"{base}_nasm{ext}" # Append _nasm anyway
    else:
         output_path = f"{base}_nasm{ext}"

    print(f"Input file: {input_path}")
    print(f"Output file: {output_path}")

    try:
        with open(input_path, 'r') as f:
            input_lines = f.readlines()
    except FileNotFoundError:
        print(f"Error: Input file not found: {input_path}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error reading file '{input_path}': {e}", file=sys.stderr)
        sys.exit(1)

    # Clean the assembly code
    cleaned_code = clean_assembly_lines(input_lines)

    # Write the cleaned code to the output file
    try:
        with open(output_path, 'w') as f_out:
            f_out.write(cleaned_code)
        print(f"Successfully cleaned assembly written to {output_path}")
    except Exception as e:
        print(f"Error writing to file '{output_path}': {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()