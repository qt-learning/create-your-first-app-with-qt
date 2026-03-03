# Copyright (C) 2026 Qt Group.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

cmake_minimum_required(VERSION 3.18)

project(ToDoDemoApp LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 COMPONENTS Gui Qml Quick)
qt_add_executable(ToDoDemoApp src/main.cpp)

qt_add_resources(ToDoDemoApp "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
)

target_link_libraries(ToDoDemoApp PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::Qml
)

include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)
