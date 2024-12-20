import cv2
import numpy as np
from tqdm.notebook import tqdm

# Output header file name
header_file_name = "video_buffers.h"

# Video input file
video_file = "output_video.mp4"

# Frame dimensions
imgHSize = 640
imgVSize = 360

# Open the video file
cap = cv2.VideoCapture(video_file)

if not cap.isOpened():
    raise IOError("Error: Cannot open video file.")

frame_count = 0
buffers = []

frame_total = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))

for _ in range(frame_total):
    ret, frame = cap.read()
    if not ret:
        break  # Exit the loop if no frames are left

    # Resize frame to desired dimensions
    frame = cv2.resize(frame, (imgHSize, imgVSize))

    # Convert BGR to RGB to fix inverted colors
    frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

    # Convert the frame to raw pixel data (flattened array)
    raw_data = frame.flatten()

    # Add the frame's pixel data to the list
    buffers.append(raw_data)
    frame_count += 1

cap.release()

# Write the header file
with open(header_file_name, "w") as header_file:
    header_file.write("#ifndef IMAGE_BUFFERS_H\n")
    header_file.write("#define IMAGE_BUFFERS_H\n\n")
    header_file.write(f"#define imgHSize  {imgHSize}\n")
    header_file.write(f"#define imgVSize {imgVSize}\n\n")
    header_file.write(f"#define NUM_IMAGES {frame_count}\n\n")


    for i, buffer in enumerate(buffers):
        header_file.write(f"unsigned char imageData{i + 1}[imgHSize * imgVSize * 3] = {{\n")
        buffer_str = ", ".join(map(str, buffer))
        header_file.write(f"    {buffer_str}\n")
        header_file.write("};\n\n")

    header_file.write("// Array of pointers to image buffers for convenience\n")
    image_pointers = ", ".join([f"imageData{i + 1}" for i in range(frame_count)])
    header_file.write(f"unsigned char *images[] = {{{image_pointers}}};\n\n")

    header_file.write("#endif // IMAGE_BUFFERS_H\n")

print(f"Header file '{header_file_name}' generated successfully with {frame_count} frames.")