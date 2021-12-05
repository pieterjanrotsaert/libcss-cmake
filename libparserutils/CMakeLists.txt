cmake_minimum_required(VERSION 3.10)

project(libparserutils)
	
file(GLOB_RECURSE PARSERUTILS_SRC src/*.c)

add_library(parserutils STATIC ${PARSERUTILS_SRC})

target_compile_definitions(parserutils PRIVATE WITHOUT_ICONV_FILTER)

target_include_directories(parserutils PRIVATE 
							src/
							include/
							include/parserutils)
							
install(TARGETS parserutils
        EXPORT parserutils-targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        FRAMEWORK DESTINATION Library/Frameworks
        COMPONENT libraries)