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

# Include any dependencies generated for this target.
include apps/CMakeFiles/client_block_linux.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include apps/CMakeFiles/client_block_linux.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/CMakeFiles/client_block_linux.dir/progress.make

# Include the compile flags for this target's objects.
include apps/CMakeFiles/client_block_linux.dir/flags.make

apps/CMakeFiles/client_block_linux.dir/client_block_linux.c.o: apps/CMakeFiles/client_block_linux.dir/flags.make
apps/CMakeFiles/client_block_linux.dir/client_block_linux.c.o: ../apps/client_block_linux.c
apps/CMakeFiles/client_block_linux.dir/client_block_linux.c.o: apps/CMakeFiles/client_block_linux.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/CMakeFiles/client_block_linux.dir/client_block_linux.c.o"
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT apps/CMakeFiles/client_block_linux.dir/client_block_linux.c.o -MF CMakeFiles/client_block_linux.dir/client_block_linux.c.o.d -o CMakeFiles/client_block_linux.dir/client_block_linux.c.o -c /home/jclee/Development/Matter/WS_Matter/iotivity-lite/apps/client_block_linux.c

apps/CMakeFiles/client_block_linux.dir/client_block_linux.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/client_block_linux.dir/client_block_linux.c.i"
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jclee/Development/Matter/WS_Matter/iotivity-lite/apps/client_block_linux.c > CMakeFiles/client_block_linux.dir/client_block_linux.c.i

apps/CMakeFiles/client_block_linux.dir/client_block_linux.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/client_block_linux.dir/client_block_linux.c.s"
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jclee/Development/Matter/WS_Matter/iotivity-lite/apps/client_block_linux.c -o CMakeFiles/client_block_linux.dir/client_block_linux.c.s

# Object files for target client_block_linux
client_block_linux_OBJECTS = \
"CMakeFiles/client_block_linux.dir/client_block_linux.c.o"

# External object files for target client_block_linux
client_block_linux_EXTERNAL_OBJECTS =

apps/client_block_linux: apps/CMakeFiles/client_block_linux.dir/client_block_linux.c.o
apps/client_block_linux: apps/CMakeFiles/client_block_linux.dir/build.make
apps/client_block_linux: libiotivity-lite-client-static.a
apps/client_block_linux: deps/tinycbor/libtinycbor.a
apps/client_block_linux: deps/mbedtls/library/libmbedtls.a
apps/client_block_linux: deps/mbedtls/library/libmbedx509.a
apps/client_block_linux: deps/mbedtls/library/libmbedcrypto.a
apps/client_block_linux: apps/CMakeFiles/client_block_linux.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable client_block_linux"
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/client_block_linux.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/CMakeFiles/client_block_linux.dir/build: apps/client_block_linux
.PHONY : apps/CMakeFiles/client_block_linux.dir/build

apps/CMakeFiles/client_block_linux.dir/clean:
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps && $(CMAKE_COMMAND) -P CMakeFiles/client_block_linux.dir/cmake_clean.cmake
.PHONY : apps/CMakeFiles/client_block_linux.dir/clean

apps/CMakeFiles/client_block_linux.dir/depend:
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jclee/Development/Matter/WS_Matter/iotivity-lite /home/jclee/Development/Matter/WS_Matter/iotivity-lite/apps /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps/CMakeFiles/client_block_linux.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/CMakeFiles/client_block_linux.dir/depend

