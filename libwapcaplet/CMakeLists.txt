cmake_minimum_required(VERSION 3.10)

project(libwapcaplet)

set(WAPCAPLET_SRC src/libwapcaplet.c)

add_library(wapcaplet STATIC ${WAPCAPLET_SRC})

target_include_directories(wapcaplet PRIVATE include)

install(TARGETS wapcaplet
        EXPORT wapcaplet-targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        FRAMEWORK DESTINATION Library/Frameworks
        COMPONENT libraries)