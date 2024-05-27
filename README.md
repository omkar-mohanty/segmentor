# seg

## Requirements
- [Cmake](https://cmake.org/)
- [Vcpkg](https://learn.microsoft.com/en-us/vcpkg/)

## Building/Compilation
1. ```
	git clone https://github.com/omkar-mohanty/segmentor && cd segmentor 
	```
2. ``` mkdir build && cd build```

3. ``` cmake ../ ```

4. ``` cmake --build ./ ```

This should give an exe file called ``` seg.exe ```

## Run
``` ./seg.exe filename max_clusters initial_smoothning ```

## Results
If everything went correctly this should give a folder called ```debug_segments``` with all of the segments.
