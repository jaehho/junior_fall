processimage:
	python imageprocess.py
copyimagedata:
	scp imageData.h jaeho.cho@micro05.ee.cooper.edu:~/ECE311/proj3/
processvideo:
	ffmpeg -i video.mp4 -vf "fps=15" -c:v libx264 -crf 23 -preset fast -c:a copy output.mp4
copyvideodata:
	scp video_buffers.h jaeho.cho@micro05.ee.cooper.edu:~/ECE311/proj3/