# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/129/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/129/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/student/CLionProjects/Shell

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/student/CLionProjects/Shell/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Shell.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Shell.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Shell.dir/flags.make

CMakeFiles/Shell.dir/shell.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/shell.c.o: ../shell.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/student/CLionProjects/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Shell.dir/shell.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/shell.c.o   -c /home/student/CLionProjects/Shell/shell.c

CMakeFiles/Shell.dir/shell.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/shell.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/student/CLionProjects/Shell/shell.c > CMakeFiles/Shell.dir/shell.c.i

CMakeFiles/Shell.dir/shell.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/shell.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/student/CLionProjects/Shell/shell.c -o CMakeFiles/Shell.dir/shell.c.s

CMakeFiles/Shell.dir/myshell.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/myshell.c.o: ../myshell.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/student/CLionProjects/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/Shell.dir/myshell.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/myshell.c.o   -c /home/student/CLionProjects/Shell/myshell.c

CMakeFiles/Shell.dir/myshell.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/myshell.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/student/CLionProjects/Shell/myshell.c > CMakeFiles/Shell.dir/myshell.c.i

CMakeFiles/Shell.dir/myshell.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/myshell.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/student/CLionProjects/Shell/myshell.c -o CMakeFiles/Shell.dir/myshell.c.s

# Object files for target Shell
Shell_OBJECTS = \
"CMakeFiles/Shell.dir/shell.c.o" \
"CMakeFiles/Shell.dir/myshell.c.o"

# External object files for target Shell
Shell_EXTERNAL_OBJECTS =

Shell: CMakeFiles/Shell.dir/shell.c.o
Shell: CMakeFiles/Shell.dir/myshell.c.o
Shell: CMakeFiles/Shell.dir/build.make
Shell: CMakeFiles/Shell.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/student/CLionProjects/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable Shell"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Shell.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Shell.dir/build: Shell

.PHONY : CMakeFiles/Shell.dir/build

CMakeFiles/Shell.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Shell.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Shell.dir/clean

CMakeFiles/Shell.dir/depend:
	cd /home/student/CLionProjects/Shell/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/student/CLionProjects/Shell /home/student/CLionProjects/Shell /home/student/CLionProjects/Shell/cmake-build-debug /home/student/CLionProjects/Shell/cmake-build-debug /home/student/CLionProjects/Shell/cmake-build-debug/CMakeFiles/Shell.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Shell.dir/depend

