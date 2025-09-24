cmake_minimum_required(VERSION 3.21)
project(XXX VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# auto generate start
set(SOURCES
    main.cpp
    mainwindow.cpp
)

set(HEADERS
    mainwindow.h
)

set(FORMS
    mainwindow.ui
)
# auto generate end

# auto allocate QtGen start
# ===== Qt 生成的 UI 头文件目录（自动生成，请勿手动修改） =====
set(UI_GEN_DIR "build/Desktop_Qt_6_4_0_MSVC2019_64bit-Debug")
include_directories(${UI_GEN_DIR})
# ===== 以上为自动生成内容 =====
# auto allocate QtGen end

# 创建可执行文件
add_executable(${PROJECT_NAME}
        ${SOURCES}
        ${HEADERS}
        ${FORMS}
        ${QTGEN}
)

# auto find package start
find_package(Qt6 COMPONENTS Core Widgets Gui Sql Concurrent Network Widgets REQUIRED)
target_link_libraries(${PROJECT_NAME}
        Qt6::Core
        Qt6::Widgets
        Qt6::Gui
        Qt6::Sql
        Qt6::Concurrent
        Qt6::Network
        Qt6::Widgets
)
# auto find package end

# 跨平台部署配置
if (WIN32 AND NOT UNIX)
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -ENTRY:mainCRTStartup")
else ()
    set(INSTALL_PATH "/opt/${PROJECT_NAME}/bin")
    install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${INSTALL_PATH})
endif ()
