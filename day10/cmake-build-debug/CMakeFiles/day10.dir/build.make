# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2019.3.2\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2019.3.2\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Brandon\Documents\aoc2021\day10

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Brandon\Documents\aoc2021\day10\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/day10.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/day10.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/day10.dir/flags.make

CMakeFiles/day10.dir/main.cpp.obj: CMakeFiles/day10.dir/flags.make
CMakeFiles/day10.dir/main.cpp.obj: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Brandon\Documents\aoc2021\day10\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/day10.dir/main.cpp.obj"
	C:\msys64\mingw64\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\day10.dir\main.cpp.obj -c C:\Users\Brandon\Documents\aoc2021\day10\main.cpp

CMakeFiles/day10.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/day10.dir/main.cpp.i"
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\Brandon\Documents\aoc2021\day10\main.cpp > CMakeFiles\day10.dir\main.cpp.i

CMakeFiles/day10.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/day10.dir/main.cpp.s"
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\Brandon\Documents\aoc2021\day10\main.cpp -o CMakeFiles\day10.dir\main.cpp.s

# Object files for target day10
day10_OBJECTS = \
"CMakeFiles/day10.dir/main.cpp.obj"

# External object files for target day10
day10_EXTERNAL_OBJECTS =

day10.exe: CMakeFiles/day10.dir/main.cpp.obj
day10.exe: CMakeFiles/day10.dir/build.make
day10.exe: CMakeFiles/day10.dir/linklibs.rsp
day10.exe: CMakeFiles/day10.dir/objects1.rsp
day10.exe: CMakeFiles/day10.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Brandon\Documents\aoc2021\day10\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable day10.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\day10.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/day10.dir/build: day10.exe

.PHONY : CMakeFiles/day10.dir/build

CMakeFiles/day10.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\day10.dir\cmake_clean.cmake
.PHONY : CMakeFiles/day10.dir/clean

CMakeFiles/day10.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Brandon\Documents\aoc2021\day10 C:\Users\Brandon\Documents\aoc2021\day10 C:\Users\Brandon\Documents\aoc2021\day10\cmake-build-debug C:\Users\Brandon\Documents\aoc2021\day10\cmake-build-debug C:\Users\Brandon\Documents\aoc2021\day10\cmake-build-debug\CMakeFiles\day10.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/day10.dir/depend

