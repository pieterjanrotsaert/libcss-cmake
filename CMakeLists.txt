cmake_minimum_required(VERSION 3.10)

project(libcss)

if(NOT DEFINED LIBCSS_LIB_DIR)
	message(FATAL_ERROR "LIBCSS_LIB_DIR is not defined!\n Specify the directory where libwapcaplet and libparserutils libs are!")
endif()

file(GLOB_RECURSE CSS_SRC libcss/src/*.c)

add_library(css STATIC ${CSS_SRC})

target_include_directories(css PUBLIC libcss/include)

target_include_directories(css PRIVATE 
	libparserutils/include
	libwapcaplet/include
	libcss/src/)

find_library(LIB_WAPCAPLET NAMES wapcaplet wapcapletd PATHS ${LIBCSS_LIB_DIR} REQUIRED)
find_library(LIB_PARSERUTILS NAMES wapcaplet wapcapletd PATHS ${LIBCSS_LIB_DIR} REQUIRED)

target_compile_definitions(css PUBLIC WITHOUT_ICONV_FILTER)
target_link_libraries(css ${LIB_WAPCAPLET} ${LIB_PARSERUTILS})