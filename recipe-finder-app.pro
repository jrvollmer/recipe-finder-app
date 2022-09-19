QT += quick

CONFIG += c++11

SOURCES += \
        contextobject.cpp \
        main.cpp

resources.files = \
        main.qml \
        Untitled.png \
        Home_Page_Dashed_Lines.png
resources.prefix = /$${TARGET}
RESOURCES += resources

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
android: include(C:\Users\james\QtProjects\recipe-finder-app\android_openssl\openssl.pri)

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    contextobject.h

DISTFILES += \
    HomePage.qml \
    HomePageForm.ui.qml
