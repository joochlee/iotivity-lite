# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jclee/Development/Matter/WS_Matter/iotivity-lite

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build

# Utility rule file for smart_home_server_linux-idd.

# Include any custom commands dependencies for this target.
include apps/CMakeFiles/smart_home_server_linux-idd.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/CMakeFiles/smart_home_server_linux-idd.dir/progress.make

apps/CMakeFiles/smart_home_server_linux-idd:
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps && /usr/bin/cmake -E copy /home/jclee/Development/Matter/WS_Matter/iotivity-lite/apps/smart_home_server_linux_IDD.cbor /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps

smart_home_server_linux-idd: apps/CMakeFiles/smart_home_server_linux-idd
smart_home_server_linux-idd: apps/CMakeFiles/smart_home_server_linux-idd.dir/build.make
.PHONY : smart_home_server_linux-idd

# Rule to build all files generated by this target.
apps/CMakeFiles/smart_home_server_linux-idd.dir/build: smart_home_server_linux-idd
.PHONY : apps/CMakeFiles/smart_home_server_linux-idd.dir/build

apps/CMakeFiles/smart_home_server_linux-idd.dir/clean:
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps && $(CMAKE_COMMAND) -P CMakeFiles/smart_home_server_linux-idd.dir/cmake_clean.cmake
.PHONY : apps/CMakeFiles/smart_home_server_linux-idd.dir/clean

apps/CMakeFiles/smart_home_server_linux-idd.dir/depend:
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jclee/Development/Matter/WS_Matter/iotivity-lite /home/jclee/Development/Matter/WS_Matter/iotivity-lite/apps /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps/CMakeFiles/smart_home_server_linux-idd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/CMakeFiles/smart_home_server_linux-idd.dir/depend

