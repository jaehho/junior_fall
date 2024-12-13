from PIL import Image
import numpy as np

# Load the image
image_path = "./image.jpg"
image = Image.open(image_path)

# Resize the image to 1920x1080
resized_image = image.resize((512, 512))

# Convert the image to grayscale
grayscale_image = resized_image.convert("L")

# Convert the grayscale image to a numpy array
image_array = np.array(grayscale_image)

# Flatten the array and scale the values to match the expected format in imageData.h
# Divide each pixel value by 16 as in the provided code
flattened_data = (image_array.flatten() // 16).astype(int)

# Generate the imageData array as a C array string
image_data_h_content = "char imageData[] = {" + ",".join(map(str, flattened_data)) + "};"

# Save the imageData.h content to a file
image_data_h_path = "./imageData.h"
with open(image_data_h_path, "w") as file:
    file.write(image_data_h_content)
print(f"Saved the image data to {image_data_h_path}")