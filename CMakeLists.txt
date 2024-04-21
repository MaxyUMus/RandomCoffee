cmake_minimum_required(VERSION 3.16)

project(RandomCoffee VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Sensors Svg Xml Sql)

qt_standard_project_setup()

qt_add_executable(appRandomCoffee
    main.cpp
    MANUAL_FINALIZATION
)

qt_add_qml_module(appRandomCoffee
    URI RandomCoffee
    VERSION 1.0
    QML_FILES
    Main.qml
        SOURCES myobject.h myobject.cpp
        QML_FILES
        QML_FILES
        RESOURCES icon.png
        RESOURCES user_u.png
        RESOURCES users_default.png
        RESOURCES send.png
)

set_target_properties(appRandomCoffee PROPERTIES
    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appRandomCoffee PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appRandomCoffee
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appRandomCoffee
    PRIVATE Qt6::Quick Qt6::Sensors Qt6::Svg Qt6::Xml Qt6::Sql
)

include(GNUInstallDirs)
install(TARGETS appRandomCoffee
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_finalize_executable(appRandomCoffee)
