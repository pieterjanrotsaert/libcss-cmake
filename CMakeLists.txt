cmake_minimum_required(VERSION 3.10)

project(libcss)

if(NOT DEFINED LIBCSS_LIB_DIR)
	message(FATAL_ERROR "LIBCSS_LIB_DIR is not defined!\n Specify the directory where libwapcaplet and libparserutils libs are!")
endif()

file(GLOB_RECURSE CSS_PUBLIC_HEADERS libcss/include/*.h)

set(CSS_SRC 
	libcss/src/charset/detect.c
	libcss/src/lex/lex.c
	libcss/src/parse/properties/azimuth.c
	libcss/src/parse/properties/background.c
	libcss/src/parse/properties/background_position.c
	libcss/src/parse/properties/border.c
	libcss/src/parse/properties/border_color.c
	libcss/src/parse/properties/border_spacing.c
	libcss/src/parse/properties/border_style.c
	libcss/src/parse/properties/border_width.c
	libcss/src/parse/properties/clip.c
	libcss/src/parse/properties/columns.c
	libcss/src/parse/properties/column_rule.c
	libcss/src/parse/properties/content.c
	libcss/src/parse/properties/cue.c
	libcss/src/parse/properties/cursor.c
	libcss/src/parse/properties/elevation.c
	libcss/src/parse/properties/flex.c
	libcss/src/parse/properties/flex_flow.c
	libcss/src/parse/properties/font.c
	libcss/src/parse/properties/font_family.c
	libcss/src/parse/properties/font_weight.c
	libcss/src/parse/properties/list_style.c
	libcss/src/parse/properties/list_style_type.c
	libcss/src/parse/properties/margin.c
	libcss/src/parse/properties/opacity.c
	libcss/src/parse/properties/outline.c
	libcss/src/parse/properties/overflow.c
	libcss/src/parse/properties/padding.c
	libcss/src/parse/properties/pause.c
	libcss/src/parse/properties/play_during.c
	libcss/src/parse/properties/properties.c
	libcss/src/parse/properties/quotes.c
	libcss/src/parse/properties/text_decoration.c
	libcss/src/parse/properties/utils.c
	libcss/src/parse/properties/voice_family.c
	libcss/src/parse/font_face.c
	libcss/src/parse/important.c
	libcss/src/parse/language.c
	libcss/src/parse/mq.c
	libcss/src/parse/parse.c
	libcss/src/parse/propstrings.c
	libcss/src/select/properties/align_content.c
	libcss/src/select/properties/align_items.c
	libcss/src/select/properties/align_self.c
	libcss/src/select/properties/azimuth.c
	libcss/src/select/properties/background_attachment.c
	libcss/src/select/properties/background_color.c
	libcss/src/select/properties/background_image.c
	libcss/src/select/properties/background_position.c
	libcss/src/select/properties/background_repeat.c
	libcss/src/select/properties/border_bottom_color.c
	libcss/src/select/properties/border_bottom_style.c
	libcss/src/select/properties/border_bottom_width.c
	libcss/src/select/properties/border_collapse.c
	libcss/src/select/properties/border_left_color.c
	libcss/src/select/properties/border_left_style.c
	libcss/src/select/properties/border_left_width.c
	libcss/src/select/properties/border_right_color.c
	libcss/src/select/properties/border_right_style.c
	libcss/src/select/properties/border_right_width.c
	libcss/src/select/properties/border_spacing.c
	libcss/src/select/properties/border_top_color.c
	libcss/src/select/properties/border_top_style.c
	libcss/src/select/properties/border_top_width.c
	libcss/src/select/properties/bottom.c
	libcss/src/select/properties/box_sizing.c
	libcss/src/select/properties/break_after.c
	libcss/src/select/properties/break_before.c
	libcss/src/select/properties/break_inside.c
	libcss/src/select/properties/caption_side.c
	libcss/src/select/properties/clear.c
	libcss/src/select/properties/clip.c
	libcss/src/select/properties/color.c
	libcss/src/select/properties/column_count.c
	libcss/src/select/properties/column_fill.c
	libcss/src/select/properties/column_gap.c
	libcss/src/select/properties/column_rule_color.c
	libcss/src/select/properties/column_rule_style.c
	libcss/src/select/properties/column_rule_width.c
	libcss/src/select/properties/column_span.c
	libcss/src/select/properties/column_width.c
	libcss/src/select/properties/content.c
	libcss/src/select/properties/counter_increment.c
	libcss/src/select/properties/counter_reset.c
	libcss/src/select/properties/cue_after.c
	libcss/src/select/properties/cue_before.c
	libcss/src/select/properties/cursor.c
	libcss/src/select/properties/direction.c
	libcss/src/select/properties/display.c
	libcss/src/select/properties/elevation.c
	libcss/src/select/properties/empty_cells.c
	libcss/src/select/properties/flex_basis.c
	libcss/src/select/properties/flex_direction.c
	libcss/src/select/properties/flex_grow.c
	libcss/src/select/properties/flex_shrink.c
	libcss/src/select/properties/flex_wrap.c
	libcss/src/select/properties/float.c
	libcss/src/select/properties/font_family.c
	libcss/src/select/properties/font_size.c
	libcss/src/select/properties/font_style.c
	libcss/src/select/properties/font_variant.c
	libcss/src/select/properties/font_weight.c
	libcss/src/select/properties/height.c
	libcss/src/select/properties/helpers.c
	libcss/src/select/properties/justify_content.c
	libcss/src/select/properties/left.c
	libcss/src/select/properties/letter_spacing.c
	libcss/src/select/properties/line_height.c
	libcss/src/select/properties/list_style_image.c
	libcss/src/select/properties/list_style_position.c
	libcss/src/select/properties/list_style_type.c
	libcss/src/select/properties/margin_bottom.c
	libcss/src/select/properties/margin_left.c
	libcss/src/select/properties/margin_right.c
	libcss/src/select/properties/margin_top.c
	libcss/src/select/properties/max_height.c
	libcss/src/select/properties/max_width.c
	libcss/src/select/properties/min_height.c
	libcss/src/select/properties/min_width.c
	libcss/src/select/properties/opacity.c
	libcss/src/select/properties/order.c
	libcss/src/select/properties/orphans.c
	libcss/src/select/properties/outline_color.c
	libcss/src/select/properties/outline_style.c
	libcss/src/select/properties/outline_width.c
	libcss/src/select/properties/overflow_x.c
	libcss/src/select/properties/overflow_y.c
	libcss/src/select/properties/padding_bottom.c
	libcss/src/select/properties/padding_left.c
	libcss/src/select/properties/padding_right.c
	libcss/src/select/properties/padding_top.c
	libcss/src/select/properties/page_break_after.c
	libcss/src/select/properties/page_break_before.c
	libcss/src/select/properties/page_break_inside.c
	libcss/src/select/properties/pause_after.c
	libcss/src/select/properties/pause_before.c
	libcss/src/select/properties/pitch.c
	libcss/src/select/properties/pitch_range.c
	libcss/src/select/properties/play_during.c
	libcss/src/select/properties/position.c
	libcss/src/select/properties/quotes.c
	libcss/src/select/properties/richness.c
	libcss/src/select/properties/right.c
	libcss/src/select/properties/speak.c
	libcss/src/select/properties/speak_header.c
	libcss/src/select/properties/speak_numeral.c
	libcss/src/select/properties/speak_punctuation.c
	libcss/src/select/properties/speech_rate.c
	libcss/src/select/properties/stress.c
	libcss/src/select/properties/table_layout.c
	libcss/src/select/properties/text_align.c
	libcss/src/select/properties/text_decoration.c
	libcss/src/select/properties/text_indent.c
	libcss/src/select/properties/text_transform.c
	libcss/src/select/properties/top.c
	libcss/src/select/properties/unicode_bidi.c
	libcss/src/select/properties/vertical_align.c
	libcss/src/select/properties/visibility.c
	libcss/src/select/properties/voice_family.c
	libcss/src/select/properties/volume.c
	libcss/src/select/properties/white_space.c
	libcss/src/select/properties/widows.c
	libcss/src/select/properties/width.c
	libcss/src/select/properties/word_spacing.c
	libcss/src/select/properties/writing_mode.c
	libcss/src/select/properties/z_index.c
	libcss/src/select/arena.c
	libcss/src/select/computed.c
	libcss/src/select/dispatch.c
	libcss/src/select/font_face.c
	libcss/src/select/format_list_style.c
	libcss/src/select/hash.c
	libcss/src/select/select.c
	libcss/src/select/unit.c
	libcss/src/utils/errors.c
	libcss/src/utils/utils.c
	libcss/src/stylesheet.c
)

if(DEFINED LIBCSS_BUILD_PARSER_GENERATOR)
	
	# Build parser generator
	
	add_executable(css-parser-gen libcss/src/parse/properties/css_property_parser_gen.c ) #libcss/src/autogen_stubs.c
	
	install(TARGETS css-parser-gen RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
			
else()
	
	# Build LibCSS

	file(GLOB LIBCSS_SRC_AUTOGEN libcss/src/parse/properties/autogen*.c)
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
			
endif()
