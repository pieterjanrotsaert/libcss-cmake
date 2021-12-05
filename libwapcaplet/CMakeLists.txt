cmake_minimum_required(VERSION 3.10)

project(libwapcaplet)

set(WAPCAPLET_SRC src/libwapcaplet.c)

add_library(wapcaplet STATIC ${WAPCAPLET_SRC})

target_include_directories(wapcaplet PUBLIC include)