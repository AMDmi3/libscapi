# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/liork/jsoncpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/liork/jsoncpp

# Utility rule file for jsoncpp_readerwriter_tests.

# Include the progress variables for this target.
include src/jsontestrunner/CMakeFiles/jsoncpp_readerwriter_tests.dir/progress.make

src/jsontestrunner/CMakeFiles/jsoncpp_readerwriter_tests: src/jsontestrunner/jsontestrunner_exe
src/jsontestrunner/CMakeFiles/jsoncpp_readerwriter_tests: src/test_lib_json/jsoncpp_test
	cd /home/liork/jsoncpp/src/jsontestrunner && /usr/bin/python2 -B /home/liork/jsoncpp/src/jsontestrunner/../../test/runjsontests.py /home/liork/jsoncpp/src/jsontestrunner/jsontestrunner_exe /home/liork/jsoncpp/src/jsontestrunner/../../test/data

jsoncpp_readerwriter_tests: src/jsontestrunner/CMakeFiles/jsoncpp_readerwriter_tests
jsoncpp_readerwriter_tests: src/jsontestrunner/CMakeFiles/jsoncpp_readerwriter_tests.dir/build.make

.PHONY : jsoncpp_readerwriter_tests

# Rule to build all files generated by this target.
src/jsontestrunner/CMakeFiles/jsoncpp_readerwriter_tests.dir/build: jsoncpp_readerwriter_tests

.PHONY : src/jsontestrunner/CMakeFiles/jsoncpp_readerwriter_tests.dir/build

src/jsontestrunner/CMakeFiles/jsoncpp_readerwriter_tests.dir/clean:
	cd /home/liork/jsoncpp/src/jsontestrunner && $(CMAKE_COMMAND) -P CMakeFiles/jsoncpp_readerwriter_tests.dir/cmake_clean.cmake
.PHONY : src/jsontestrunner/CMakeFiles/jsoncpp_readerwriter_tests.dir/clean

src/jsontestrunner/CMakeFiles/jsoncpp_readerwriter_tests.dir/depend:
	cd /home/liork/jsoncpp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liork/jsoncpp /home/liork/jsoncpp/src/jsontestrunner /home/liork/jsoncpp /home/liork/jsoncpp/src/jsontestrunner /home/liork/jsoncpp/src/jsontestrunner/CMakeFiles/jsoncpp_readerwriter_tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/jsontestrunner/CMakeFiles/jsoncpp_readerwriter_tests.dir/depend

