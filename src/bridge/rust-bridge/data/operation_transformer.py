def decompose_sext(sext_instruction):
    # Parse the input instruction
    parts = sext_instruction.split()
    dest = parts[0].strip('%')
    src = parts[-3].strip('%')
    src_type = parts[-4]
    dest_type = parts[-1]

    # Extract the bit widths
    src_width = int(src_type[1:])
    dest_width = int(dest_type[1:])

    if dest_width == 1:
        sub_value = 1
    elif dest_width == 8:
        sub_value == 255
    elif dest_width == 16:
        sub_value = 65535
    elif dest_width == 32:
        sub_value = 4294967295
    elif dest_width == 64:
        sub_value = 2 ** 64 - 1
    elif dest_width == 128:
        sub_value = 2 ** 128 - 1


    # Generate the decomposed operations
    operations = [
        f"  %{dest}_zext = zext {src_type} %{src} to {dest_type}",
        f"  %{dest}_0 = sub {dest_type} %{dest}_zext, 1",
        f"  %{dest}_1 = and {dest_type} %{dest}_zext, %{dest}_0",
        f"  %{dest}_2 = xor {dest_type} %{dest}_zext, {2**dest_width - 2}",
        f"  %{dest}_3 = and {dest_type} %{dest}_2, {sub_value}",
        f"  %{dest} = xor {dest_type} %{dest}_1, %{dest}_3"
    ]

    return '\n'.join(operations)
    

def decompose_select(select_instruction):
    # Parse the input instruction
    parts = select_instruction.split(',')
   
    dest = parts[0].split('=')[0].strip()
    
    condition = parts[0].split()[-1].strip()
    condition_data_type = parts[0].split()[-2].strip()
    # condition data type is i1 but for CryptOpt, I set i64 as default
    true_value = parts[1].split(' ')[-1].strip()

    data_type = parts[1].split(' ')[1].strip()
   
    false_value = parts[2].split(' ')[-1].strip()

    # Extract the type
    type_parts = parts[0].split()
    result_type = type_parts[1]
    
    # Generate the decomposed operations
    operations = [
        f"  {dest}_condition_zext = zext {condition_data_type} {condition} to i64",
        f"  {dest}_condtion = add i64 {dest}_condition_zext, 0",
        f"  {dest}_start = add {data_type} {false_value}, 0",
        f"  {dest}_0 = sub {data_type} 1, {dest}_condtion",
        f"  {dest}_1 = mul {data_type} {dest}_start, {dest}_0",
        f"  {dest}_2 = mul {data_type} {true_value}, {dest}_condtion",
        f"  {dest} = add {data_type} {dest}_1, {dest}_2"
    ]

    return '\n'.join(operations)



if __name__ == '__main__':
    # test case

    # sext operation is okay
    sext_input_instruction = "%x802.neg = sext i1 %_1351 to i64"
    sext_translation = decompose_sext(sext_input_instruction)
    print(sext_translation)

    print("\n")

    select_input_instruction = "%_1388 = select i1 %_1378.not, i64 0, i64 %_0.i551"
    select_instruction = decompose_select(select_input_instruction)
    print(select_instruction)