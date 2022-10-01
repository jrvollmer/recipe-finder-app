QT += quick

CONFIG += c++11

SOURCES += \
        databaseactions.cpp \
        main.cpp

#resources.files = \
#        main.qml \
#        HomePage.qml \
#        AddRecipe.qml \
#        Images/Home_Page_Dashed_Lines.png \
#        Images/Home_Icon.png
#resources.prefix = /$${TARGET}
RESOURCES += UI/qml.qrc \ #resources
    UI/Images/images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
android: include(C:\Users\james\QtProjects\recipe-finder-app\android_openssl\openssl.pri)

OTHER_FILES += \
    android-sources/AndroidManifest.xml
ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android-sources

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    databaseactions.h

DISTFILES += \
    AddRecipe.qml \
    HomePage.qml
