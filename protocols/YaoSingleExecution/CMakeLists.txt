cmake_minimum_required(VERSION 3.5)
project(YaoSingleExecution)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -maes -mpclmul -msse4.1 -fPIC -march=native -O3")
cmake_policy(SET CMP0015 NEW)

SET (BOOST_ROOT $ENV{HOME}/boost_1_64_0/)
SET (BOOST_INCLUDEDIR $ENV{HOME}/boost_1_64_0/)
SET (BOOST_LIBRARYDIR $ENV{HOME}/boost_1_64_0/stage/lib)
find_package(Boost COMPONENTS system thread REQUIRED)


INCLUDE_DIRECTORIES($ENV{HOME} ${BOOST_INCLUDEDIR}
        ../../lib/OTExtensionBristol ../../lib/ ../../../)

link_directories(/usr/ssl/lib/ /usr/local/lib ../../install/lib ${BOOST_LIBRARYDIR})

set(SOURCE_FILES main.cpp YaoSEParty.cpp)
add_executable(YaoSingleExecution ${SOURCE_FILES})
add_library(yaoSingleExecution ${SOURCE_FILES})

TARGET_LINK_LIBRARIES(YaoSingleExecution $ENV{HOME}/libscapi/libscapi.a
        $ENV{HOME}/libscapi/install/lib/libjsoncpp.a
        boost_system boost_thread pthread crypto dl ssl z relic gmp emp-tool stdc++fs)
