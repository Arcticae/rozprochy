# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/timelock/Pulpit/clion-2017.3.4/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/timelock/Pulpit/clion-2017.3.4/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/main.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main.dir/flags.make

CMakeFiles/main.dir/main.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/main.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/main.cpp.o -c "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/main.cpp"

CMakeFiles/main.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/main.cpp" > CMakeFiles/main.dir/main.cpp.i

CMakeFiles/main.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/main.cpp" -o CMakeFiles/main.dir/main.cpp.s

CMakeFiles/main.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/main.dir/main.cpp.o.requires

CMakeFiles/main.dir/main.cpp.o.provides: CMakeFiles/main.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/main.dir/build.make CMakeFiles/main.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/main.dir/main.cpp.o.provides

CMakeFiles/main.dir/main.cpp.o.provides.build: CMakeFiles/main.dir/main.cpp.o


CMakeFiles/main.dir/TCP_client.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/TCP_client.cpp.o: ../TCP_client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/main.dir/TCP_client.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/TCP_client.cpp.o -c "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/TCP_client.cpp"

CMakeFiles/main.dir/TCP_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/TCP_client.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/TCP_client.cpp" > CMakeFiles/main.dir/TCP_client.cpp.i

CMakeFiles/main.dir/TCP_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/TCP_client.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/TCP_client.cpp" -o CMakeFiles/main.dir/TCP_client.cpp.s

CMakeFiles/main.dir/TCP_client.cpp.o.requires:

.PHONY : CMakeFiles/main.dir/TCP_client.cpp.o.requires

CMakeFiles/main.dir/TCP_client.cpp.o.provides: CMakeFiles/main.dir/TCP_client.cpp.o.requires
	$(MAKE) -f CMakeFiles/main.dir/build.make CMakeFiles/main.dir/TCP_client.cpp.o.provides.build
.PHONY : CMakeFiles/main.dir/TCP_client.cpp.o.provides

CMakeFiles/main.dir/TCP_client.cpp.o.provides.build: CMakeFiles/main.dir/TCP_client.cpp.o


CMakeFiles/main.dir/TokenRingUtils.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/TokenRingUtils.cpp.o: ../TokenRingUtils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/main.dir/TokenRingUtils.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/TokenRingUtils.cpp.o -c "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/TokenRingUtils.cpp"

CMakeFiles/main.dir/TokenRingUtils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/TokenRingUtils.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/TokenRingUtils.cpp" > CMakeFiles/main.dir/TokenRingUtils.cpp.i

CMakeFiles/main.dir/TokenRingUtils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/TokenRingUtils.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/TokenRingUtils.cpp" -o CMakeFiles/main.dir/TokenRingUtils.cpp.s

CMakeFiles/main.dir/TokenRingUtils.cpp.o.requires:

.PHONY : CMakeFiles/main.dir/TokenRingUtils.cpp.o.requires

CMakeFiles/main.dir/TokenRingUtils.cpp.o.provides: CMakeFiles/main.dir/TokenRingUtils.cpp.o.requires
	$(MAKE) -f CMakeFiles/main.dir/build.make CMakeFiles/main.dir/TokenRingUtils.cpp.o.provides.build
.PHONY : CMakeFiles/main.dir/TokenRingUtils.cpp.o.provides

CMakeFiles/main.dir/TokenRingUtils.cpp.o.provides.build: CMakeFiles/main.dir/TokenRingUtils.cpp.o


CMakeFiles/main.dir/Token.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/Token.cpp.o: ../Token.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/main.dir/Token.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/Token.cpp.o -c "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/Token.cpp"

CMakeFiles/main.dir/Token.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/Token.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/Token.cpp" > CMakeFiles/main.dir/Token.cpp.i

CMakeFiles/main.dir/Token.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/Token.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/Token.cpp" -o CMakeFiles/main.dir/Token.cpp.s

CMakeFiles/main.dir/Token.cpp.o.requires:

.PHONY : CMakeFiles/main.dir/Token.cpp.o.requires

CMakeFiles/main.dir/Token.cpp.o.provides: CMakeFiles/main.dir/Token.cpp.o.requires
	$(MAKE) -f CMakeFiles/main.dir/build.make CMakeFiles/main.dir/Token.cpp.o.provides.build
.PHONY : CMakeFiles/main.dir/Token.cpp.o.provides

CMakeFiles/main.dir/Token.cpp.o.provides.build: CMakeFiles/main.dir/Token.cpp.o


# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/main.cpp.o" \
"CMakeFiles/main.dir/TCP_client.cpp.o" \
"CMakeFiles/main.dir/TokenRingUtils.cpp.o" \
"CMakeFiles/main.dir/Token.cpp.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

main: CMakeFiles/main.dir/main.cpp.o
main: CMakeFiles/main.dir/TCP_client.cpp.o
main: CMakeFiles/main.dir/TokenRingUtils.cpp.o
main: CMakeFiles/main.dir/Token.cpp.o
main: CMakeFiles/main.dir/build.make
main: CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable main"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main.dir/build: main

.PHONY : CMakeFiles/main.dir/build

CMakeFiles/main.dir/requires: CMakeFiles/main.dir/main.cpp.o.requires
CMakeFiles/main.dir/requires: CMakeFiles/main.dir/TCP_client.cpp.o.requires
CMakeFiles/main.dir/requires: CMakeFiles/main.dir/TokenRingUtils.cpp.o.requires
CMakeFiles/main.dir/requires: CMakeFiles/main.dir/Token.cpp.o.requires

.PHONY : CMakeFiles/main.dir/requires

CMakeFiles/main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : CMakeFiles/main.dir/clean

CMakeFiles/main.dir/depend:
	cd "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring" "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring" "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/cmake-build-debug" "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/cmake-build-debug" "/home/timelock/Dokumenty/Semestr 6/Rozprochy/token_ring/cmake-build-debug/CMakeFiles/main.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/main.dir/depend
