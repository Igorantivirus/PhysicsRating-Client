cmake_minimum_required(VERSION 3.16)

project(PhysicsRating VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(APP_VERSION "1.1.0")

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appPhysicsRating
    main.cpp
)

qt_add_qml_module(appPhysicsRating
    URI         PhysicsRating
    VERSION     1.0
    RESOURCES   android/AndroidManifest.xml android/build.gradle android/res/values/libs.xml android/res/xml/qtprovider_paths.xml android/gradle/wrapper/gradle-wrapper.jar android/gradle/wrapper/gradle-wrapper.properties android/gradle.properties android/gradlew android/gradlew.bat
    QML_FILES   Main.qml HelloPage.qml AboutPage.qml RegisterPage.qml OutputPage.qml
    SOURCES     Backend.hpp DataEncoder.hpp StudentWorkClasses.hpp StudetsInfo.hpp
    QML_FILES InfoPage.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appPhysicsRating PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appPhysicsRating
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

set(ANDROID_PACKAGE_SOURCE_DIR ${PROJECT_SOURCE_DIR}/android CACHE INTERNAL "")
set(ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android)
set_property(TARGET appPhysicsRating APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android)

#Попытка оптимизации
set(CMAKE_ANDROID_DEPLOY_QT_FLAGS "--release --no-strip --minimal")
set(CMAKE_CXX_FLAGS_RELEASE "-Oz -flto")
set(ANDROID_ABI "armeabi-v7a;arm64-v8a")
set(CMAKE_STRIP true)

target_link_libraries(appPhysicsRating
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appPhysicsRating
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
