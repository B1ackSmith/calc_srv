cmake_minimum_required (VERSION 2.6)
cmake_policy(SET CMP0015 NEW)
 
set (PROJECT 
	calc_srv)
 
#set (HEADERS 
#	../test.h)
 
set (SOURCES 
	../src/calc_srv.cpp)

set (BOOST_ROOT 
		../lib/boost_1_66_0)
 
set(Boost_INCLUDE_DIR 
	../lib/boost_1_66_0)
	
set(Boost_LIBRARY_DIR 
	../lib/boost_1_66_0/stage/lib)
 
set (BOOST_COMPONENTS 
	system
	thread
	regex)

set (Boost_USE_STATIC_LIBS ON)
 
set (Boost_USE_MULTITHREADED ON)
 
project (${PROJECT})
 
include_directories (../)

include_directories(${Boost_INCLUDE_DIR})

link_directories(${Boost_LIBRARY_DIR})
 
find_package (Threads)
 
find_package (Boost COMPONENTS ${BOOST_COMPONENTS} REQUIRED)

include_directories(${Boost_INCLUDE_DIRS})
 
add_executable (${PROJECT} ${HEADERS} ${SOURCES})
 
target_link_libraries (${PROJECT} ${CMAKE_THREAD_LIBS_INIT} ${Boost_LIBRARIES})

