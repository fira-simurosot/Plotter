#include "mythread.h"

MyThread::MyThread(Plotter *plotter, QWidget *parent)
{
    connect(this, SIGNAL(status(WorldModel*)), plotter, SLOT(handleStatus(WorldModel*)));
}

MyThread::~MyThread() {

}

void MyThread::run()
{
    QUdpSocket* socket = new QUdpSocket();
    socket->bind(QHostAddress("172.21.224.130"), 10040, QUdpSocket::ShareAddress);
//    socket->joinMulticastGroup(QHostAddress("224.5.23.2"));
    while(runApp) {
        while (socket->hasPendingDatagrams()) {
            DataWrapper* head = new DataWrapper;
            QByteArray Buffer;
            Buffer.resize(socket->pendingDatagramSize());
            QHostAddress sender;
            quint16 senderPort;
            socket->readDatagram(Buffer.data(),Buffer.size(),&sender,&senderPort);
            if (head->ParseFromArray(Buffer.data(), Buffer.size())) {
                WorldModel* wm = const_cast<WorldModel*>(&head->worldmodel());
                emit status(wm);
            } else {
                qDebug() << "FAILED TO PARSE" << Buffer.size();
            }
        }
        msleep(100);
    }
}

