# libcss-cmake
LibCSS + Dependencies with CMake support

## For future reference

What I did:
Clone libparserutils, libwabcaplet & libparserutils.
Create cmake files for each of them (I simply used GLOB_RECURSE instead of listing every source file.)

For libparserutils, run 'perl ./build/make-aliases.pl'

For libcss, edit src\parse\properties\utils.cs: 
	Add #ifndef WIN32  around '#include <strings.h>' 
	
## Compiling

libparserutils and libwabcaplet are trivial to compile

for libcss, LIBCSS_LIB_DIR has to be set to the directory where libwabcaplet.lib and libparserutils.lib are located