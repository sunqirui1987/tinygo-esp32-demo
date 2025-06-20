idf_component_register(SRCS 
                    INCLUDE_DIRS "include")

# 添加符号映射来解决TinyGo的符号依赖
target_link_libraries(${COMPONENT_LIB} INTERFACE 
    "${CMAKE_CURRENT_LIST_DIR}/libgolib.a"
    "-Wl,--defsym,_sbss=_bss_start"
    "-Wl,--defsym,_ebss=_bss_end"
    "-Wl,--allow-multiple-definition"
)