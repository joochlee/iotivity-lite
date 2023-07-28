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
include apps/CMakeFiles/server_certification_tests.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include apps/CMakeFiles/server_certification_tests.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/CMakeFiles/server_certification_tests.dir/progress.make

# Include the compile flags for this target's objects.
include apps/CMakeFiles/server_certification_tests.dir/flags.make

apps/CMakeFiles/server_certification_tests.dir/server_certification_tests.c.o: apps/CMakeFiles/server_certification_tests.dir/flags.make
apps/CMakeFiles/server_certification_tests.dir/server_certification_tests.c.o: ../apps/server_certification_tests.c
apps/CMakeFiles/server_certification_tests.dir/server_certification_tests.c.o: apps/CMakeFiles/server_certification_tests.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/CMakeFiles/server_certification_tests.dir/server_certification_tests.c.o"
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT apps/CMakeFiles/server_certification_tests.dir/server_certification_tests.c.o -MF CMakeFiles/server_certification_tests.dir/server_certification_tests.c.o.d -o CMakeFiles/server_certification_tests.dir/server_certification_tests.c.o -c /home/jclee/Development/Matter/WS_Matter/iotivity-lite/apps/server_certification_tests.c

apps/CMakeFiles/server_certification_tests.dir/server_certification_tests.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/server_certification_tests.dir/server_certification_tests.c.i"
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jclee/Development/Matter/WS_Matter/iotivity-lite/apps/server_certification_tests.c > CMakeFiles/server_certification_tests.dir/server_certification_tests.c.i

apps/CMakeFiles/server_certification_tests.dir/server_certification_tests.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/server_certification_tests.dir/server_certification_tests.c.s"
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jclee/Development/Matter/WS_Matter/iotivity-lite/apps/server_certification_tests.c -o CMakeFiles/server_certification_tests.dir/server_certification_tests.c.s

# Object files for target server_certification_tests
server_certification_tests_OBJECTS = \
"CMakeFiles/server_certification_tests.dir/server_certification_tests.c.o"

# External object files for target server_certification_tests
server_certification_tests_EXTERNAL_OBJECTS =

apps/server_certification_tests: apps/CMakeFiles/server_certification_tests.dir/server_certification_tests.c.o
apps/server_certification_tests: apps/CMakeFiles/server_certification_tests.dir/build.make
apps/server_certification_tests: libiotivity-lite-client-server-static.a
apps/server_certification_tests: deps/tinycbor/libtinycbor.a
apps/server_certification_tests: deps/mbedtls/library/libmbedtls.a
apps/server_certification_tests: deps/mbedtls/library/libmbedx509.a
apps/server_certification_tests: deps/mbedtls/library/libmbedcrypto.a
apps/server_certification_tests: apps/CMakeFiles/server_certification_tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable server_certification_tests"
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/server_certification_tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/CMakeFiles/server_certification_tests.dir/build: apps/server_certification_tests
.PHONY : apps/CMakeFiles/server_certification_tests.dir/build

apps/CMakeFiles/server_certification_tests.dir/clean:
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps && $(CMAKE_COMMAND) -P CMakeFiles/server_certification_tests.dir/cmake_clean.cmake
.PHONY : apps/CMakeFiles/server_certification_tests.dir/clean

apps/CMakeFiles/server_certification_tests.dir/depend:
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jclee/Development/Matter/WS_Matter/iotivity-lite /home/jclee/Development/Matter/WS_Matter/iotivity-lite/apps /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/apps/CMakeFiles/server_certification_tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/CMakeFiles/server_certification_tests.dir/depend

