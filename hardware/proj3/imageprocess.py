import numpy as np
from PIL import Image

# Load the grayscale image
image = Image.open('lena_gray.bmp').convert('L')  # Ensure it's in grayscale
image_array = np.array(image)

# Open a file to write pixel values
with open('MyFile.txt', 'w') as file:
    for r in range(image_array.shape[0]):  # Loop over rows
        for c in range(image_array.shape[1]):  # Loop over columns
            file.write(f"{image_array[r, c]},")  # Write pixel value
        file.write("\n")  # Newline after each row
