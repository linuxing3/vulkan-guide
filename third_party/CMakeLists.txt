find_package(Vulkan REQUIRED)

add_library(glm INTERFACE)
add_library(vma INTERFACE)
#both vma and glm and header only libs so we only need the include path
target_include_directories(vma INTERFACE vma)
target_include_directories(glm INTERFACE glm)

add_library(stb_image INTERFACE)
target_include_directories(stb_image INTERFACE stb_image)

add_subdirectory(fastgltf)

add_subdirectory(fmt EXCLUDE_FROM_ALL)

add_library(imgui STATIC)
target_include_directories(imgui PUBLIC imgui)
target_sources(imgui PRIVATE 
  imgui/imgui.h
  imgui/imgui.cpp
  imgui/imgui_demo.cpp
  imgui/imgui_draw.cpp
  imgui/imgui_widgets.cpp
  imgui/imgui_tables.cpp
  imgui/imgui_impl_vulkan.cpp
  imgui/imgui_impl_sdl2.cpp
  )
target_link_libraries(imgui PUBLIC Vulkan::Vulkan SDL2)
