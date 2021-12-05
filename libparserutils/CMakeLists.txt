cmake_minimum_required(VERSION 3.10)

project(libparserutils)
	
file(GLOB_RECURSE PARSERUTILS_SRC src/*.c)

add_library(parserutils STATIC ${PARSERUTILS_SRC})

target_compile_definitions(parserutils PUBLIC WITHOUT_ICONV_FILTER)

target_include_directories(parserutils PUBLIC 
							src/
							include/
							include/parserutils)