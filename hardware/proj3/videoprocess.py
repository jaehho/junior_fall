import cv2

# Input and output file paths
input_video_path = "video.mp4"
output_video_path = "output_video.mp4"
frame_divisor = 5

# Open the input video
cap = cv2.VideoCapture(input_video_path)

# Get video properties
frame_width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
frame_height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
fps = int(cap.get(cv2.CAP_PROP_FPS))  # Original FPS
total_frames = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))  # Total number of frames in the input
fourcc = cv2.VideoWriter_fourcc(*'mp4v')  # Codec for MP4

# Define the VideoWriter for output
out = cv2.VideoWriter(output_video_path, fourcc, fps / frame_divisor, (frame_width, frame_height))

frame_count = 0
output_frame_count = 0  # Counter for output frames

while True:
    ret, frame = cap.read()
    if not ret:
        break  # End of video

    # Write every nth frame to the output video
    if frame_count % frame_divisor == 0:
        out.write(frame)
        output_frame_count += 1  # Increment output frame counter
    
    frame_count += 1

# Release resources
cap.release()
out.release()

# Print total frames
print(f"Total number of frames in the input video: {total_frames}")
print(f"Total number of frames in the output video: {output_frame_count}")
