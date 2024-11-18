import os
import fileinput

def add_timescale_to_files(directory):
    # Iterate over all files in the given directory
    for filename in os.listdir(directory):
        filepath = os.path.join(directory, filename)

        # Check if it is a file (not a directory)
        if os.path.isfile(filepath):
            with open(filepath, 'r') as file:
                content = file.readlines()

            # Insert the new line at the top
            content.insert(0, '`timescale 1 ns / 1 ps\n')

            # Write the modified content back to the file
            with open(filepath, 'w') as file:
                file.writelines(content)

if __name__ == "__main__":
    add_timescale_to_files('./verilog_modules')
    print("Added `timescale 1 ns / 1 ps to the top of each file in the directory.")