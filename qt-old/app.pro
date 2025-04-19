QT += core gui widgets
QT += core-private # For Notification permission request

SOURCES += main.cpp

# HEADERS += 

# RESOURCES += 

target.path = /work
INSTALLS += target

ANDROID_PACKAGE_SOURCE_DIR = /work/android
OTHER_FILES += android/AndroidManifest.xml