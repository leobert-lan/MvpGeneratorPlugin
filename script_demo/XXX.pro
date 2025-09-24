QT       += core widgets gui sql concurrent network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets printsupport

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# 编译器兼容性设置
win32-msvc* {
    QMAKE_CXXFLAGS += /Zc:__cplusplus
    QMAKE_CXXFLAGS += /permissive-
    QMAKE_CXXFLAGS += /Zc:wchar_t
    QMAKE_CXXFLAGS += /Zc:inline
}

# VLC SDK 路径
VLC_ROOT = $$PWD/thirdParty
INCLUDEPATH += $$VLC_ROOT/include
LIBS += -L$$VLC_ROOT/lib -llibvlc -llibvlccore

# VLC预处理器定义
DEFINES += VLC_DISABLE_DEPRECATED
DEFINES += __STDC_WANT_LIB_EXT1__=1

# 确保UI头文件正确生成
CONFIG += uic

# 添加必要的Qt模块
QT += widgets

# auto generate start
HEADERS += \
    mainwindow.h \

SOURCES += \
    main.cpp \
    mainwindow.cpp \
FORMS += \
    mainwindow.ui \
# auto generate end

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

LIBS += -L$$PWD/third_party/liblsl/lib -llsl

RESOURCES += \
      Image.qrc \
      qrouter.qrc

