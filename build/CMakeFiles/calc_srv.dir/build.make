# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/smith/src/c/boost/calc_srv

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/smith/src/c/boost/calc_srv/build

# Include any dependencies generated for this target.
include CMakeFiles/calc_srv.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/calc_srv.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/calc_srv.dir/flags.make

CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o: CMakeFiles/calc_srv.dir/flags.make
CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o: ../src/calc_srv.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/smith/src/c/boost/calc_srv/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o -c /home/smith/src/c/boost/calc_srv/src/calc_srv.cpp

CMakeFiles/calc_srv.dir/src/calc_srv.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/calc_srv.dir/src/calc_srv.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/smith/src/c/boost/calc_srv/src/calc_srv.cpp > CMakeFiles/calc_srv.dir/src/calc_srv.cpp.i

CMakeFiles/calc_srv.dir/src/calc_srv.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/calc_srv.dir/src/calc_srv.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/smith/src/c/boost/calc_srv/src/calc_srv.cpp -o CMakeFiles/calc_srv.dir/src/calc_srv.cpp.s

CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o.requires:
.PHONY : CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o.requires

CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o.provides: CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o.requires
	$(MAKE) -f CMakeFiles/calc_srv.dir/build.make CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o.provides.build
.PHONY : CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o.provides

CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o.provides.build: CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o

# Object files for target calc_srv
calc_srv_OBJECTS = \
"CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o"

# External object files for target calc_srv
calc_srv_EXTERNAL_OBJECTS =

calc_srv: CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o
calc_srv: CMakeFiles/calc_srv.dir/build.make
calc_srv: /home/smith/src/c/boost/lib/boost_1_66_0/stage/lib/libboost_system.a
calc_srv: /home/smith/src/c/boost/lib/boost_1_66_0/stage/lib/libboost_thread.a
calc_srv: /home/smith/src/c/boost/lib/boost_1_66_0/stage/lib/libboost_regex.a
calc_srv: CMakeFiles/calc_srv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable calc_srv"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/calc_srv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/calc_srv.dir/build: calc_srv
.PHONY : CMakeFiles/calc_srv.dir/build

CMakeFiles/calc_srv.dir/requires: CMakeFiles/calc_srv.dir/src/calc_srv.cpp.o.requires
.PHONY : CMakeFiles/calc_srv.dir/requires

CMakeFiles/calc_srv.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/calc_srv.dir/cmake_clean.cmake
.PHONY : CMakeFiles/calc_srv.dir/clean

CMakeFiles/calc_srv.dir/depend:
	cd /home/smith/src/c/boost/calc_srv/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/smith/src/c/boost/calc_srv /home/smith/src/c/boost/calc_srv /home/smith/src/c/boost/calc_srv/build /home/smith/src/c/boost/calc_srv/build /home/smith/src/c/boost/calc_srv/build/CMakeFiles/calc_srv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/calc_srv.dir/depend

