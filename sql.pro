TEMPLATE = lib
TARGET = QmlSql
QT += qml quick sql network
CONFIG += qt plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = QmlSql

# Input
SOURCES += \
    plugin.cpp \
    qmlsqldatabase.cpp \
    qqmlsqlquery.cpp \
    qmlsqlquerymodel.cpp \
    qmlsqlcreatedatabase.cpp
#    qmlsqltablemode.cpp \
#    qmlsqltablehelper.cpp

HEADERS += \
    plugin.h \
    qmlsqldatabase.h \
    qqmlsqlquery.h \
    qmlsqlquerymodel.h \
    qmlsqlcreatedatabase.h
#    qmlsqltablemode.h \
#    qmlsqltablehelper.h

DISTFILES = qmldir

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

    qmldir.files = qmldir
    installPath = $$OUT_PWD/$$replace(uri, \\., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
