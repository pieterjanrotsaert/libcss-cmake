cmake_minimum_required(VERSION 3.10)

project(libwapcaplet)

set(WAPCAPLET_SRC src/libwapcaplet.c)

add_library(wapcaplet STATIC ${WAPCAPLET_SRC})

target_include_directories(wapcaplet PRIVATE include)

file(GLOB_RECURSE WAPCAPLET_PUBLIC_HEADERS include/*.h)
set_target_properties(wapcaplet PROPERTIES PUBLIC_HEADER "${WAPCAPLET_PUBLIC_HEADERS}")

install(TARGETS wapcaplet
        EXPORT wapcaplet-targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        FRAMEWORK DESTINATION Library/Frameworks
		PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/libwapcaplet
        COMPONENT libraries)