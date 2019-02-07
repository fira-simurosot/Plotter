#-------------------------------------------------
#
# Project created by QtCreator 2018-07-04T13:04:25
#
#-------------------------------------------------

QT       += core gui opengl network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = parsian-plotter
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    plot.cpp \
    plotterwidget.cpp \
    texturecache.cpp \
    guitimer.cpp \
    timer.cpp \
    leaffilterproxymodel.cpp \
    plotter.cpp \
    msg/cpp/messages_parsian_simurosot_data_wrapper.pb.cc \
    msg/cpp/messages_parsian_simurosot_debugs.pb.cc \
    msg/cpp/messages_parsian_simurosot_detection.pb.cc \
    msg/cpp/messages_parsian_simurosot_worldmodel.pb.cc \
    mythread.cpp

HEADERS  += mainwindow.h \
    plot.h \
    plotterwidget.h \
    texturecache.h \
    guitimer.h \
    timer.h \
    leaffilterproxymodel.h \
    plotter.h \
    msg/cpp/messages_parsian_simurosot_data_wrapper.pb.h \
    msg/cpp/messages_parsian_simurosot_debugs.pb.h \
    msg/cpp/messages_parsian_simurosot_detection.pb.h \
    msg/cpp/messages_parsian_simurosot_worldmodel.pb.h \
    mythread.h

FORMS    += \
    plotter.ui

RESOURCES += \
    resource.qrc

DISTFILES +=

MOC_DIR = objs
OBJECTS_DIR = objs

INCLUDEPATH+=msg/cpp
INCLUDEPATH+=/usr/local/Cellar/protobuf/3.6.1.3_1/include
LIBS+=-L/usr/local/Cellar/protobuf/3.6.1.3_1/lib/ -lprotobuf -lprotobuf-lite

