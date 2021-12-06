cmake_minimum_required(VERSION 3.10)

project(libcss)

if(NOT DEFINED LIBCSS_LIB_DIR)
	message(FATAL_ERROR "LIBCSS_LIB_DIR is not defined!\n Specify the directory where libwapcaplet and libparserutils libs are!")
endif()

file(GLOB_RECURSE CSS_SRC libcss/src/*.c)

file(GLOB_RECURSE CSS_PUBLIC_HEADERS libcss/include/*.h)

add_library(css STATIC ${CSS_SRC})

target_include_directories(css PUBLIC libcss/include)

target_include_directories(css PRIVATE 
	libparserutils/include
	libwapcaplet/include
	libcss/src/)

find_library(LIB_WAPCAPLET NAMES wapcaplet PATHS ${LIBCSS_LIB_DIR} REQUIRED)
find_library(LIB_PARSERUTILS NAMES parserutils PATHS ${LIBCSS_LIB_DIR} REQUIRED)

target_compile_definitions(css PUBLIC WITHOUT_ICONV_FILTER)
target_link_libraries(css ${LIB_WAPCAPLET} ${LIB_PARSERUTILS})

set_target_properties(css PROPERTIES PUBLIC_HEADER "${CSS_PUBLIC_HEADERS}")

install(TARGETS css
        EXPORT css-targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
		PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/libcss
        FRAMEWORK DESTINATION Library/Frameworks
        COMPONENT libraries)