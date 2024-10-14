import re
import os

def split_verilog_modules(input_file):
    # Open the input Verilog file for reading
    with open(input_file, 'r') as file:
        verilog_code = file.read()

    # Regular expression to match module declarations
    module_pattern = re.compile(r'(module\s+(\w+)[\s\S]*?endmodule)', re.MULTILINE)

    # Find all modules in the Verilog code
    modules = module_pattern.findall(verilog_code)

    # Create a directory to store the modules if it doesn't exist
    output_dir = 'verilog_modules'
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Write each module to its own file
    for module, module_name in modules:
        module_filename = os.path.join(output_dir, f'{module_name}.v')
        with open(module_filename, 'w') as module_file:
            module_file.write(module)
        print(f'Module {module_name} written to {module_filename}')

# Example usage
input_verilog_file = './mipspipelined.v'
split_verilog_modules(input_verilog_file)
