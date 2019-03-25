# CapnZero

Eine Middleware besteht aus folgenden Komponenten:
  - Discovery: Vermittelt Sender und Empfänger die sich vorher nicht kannten nach einem festgelegten Protokoll.
  - Serialization/Deserialization: Verwandelt Datenstrukturen in Byte-Arrays, welche verschickt werden können. Oder eben anders herum.
  - Transport: Verschickt Byte-Arrays übers Netzwerk.

Wir sollten nicht alle Komponenten selbst schreiben, damit wir das Rad nicht komplett neu erfinden. Daher gehen wir jetzt auf die einzelnen Komponenten ein und skizzieren deren Aufgabe, Struktur und beurteilen existierende Lösungen.

## Discovery

  * Man benötigt eine gut **UUID Library** um den Robotern eine eindeutige ID zu geben. Diese sollte nicht zu groß sein, damit wir mit der Sender/Receiver-ID nicht das unnötig das Netzwerk belasten. 
  * UUIDs sind standartisiert und eine entsprechend kompatible Bibliothek ist **libuuid**. Die Bibliothek ist Standard auf allen Linux Systemen.

## Serialization/Deserialization

  * In diesem [Blog-Eintrag](https://capnproto.org/news/2014-06-17-capnproto-flatbuffers-sbe.html) wurden einige mögliche Lösungen verglichen: Protobuf, **Cap'n Proto**, SBE und FlatBuffers

## Transport

  * Mögliche Lösung [ZeroMQ](http://zeromq.org/).
  * **UDP Multicast Support** gibt es erst seit 2016. Hier ist ein [Test auf Github](https://github.com/zeromq/libzmq/blob/master/tests/test_radio_dish.cpp), der entsprechende Funktionalität zeigt. Hier die soweit [umfangreichste Doku](https://github.com/zeromq/libzmq/blob/master/doc/zmq_udp.txt) zum Thema.
  * Das CERN hat [einen Artikel](http://zeromq.wdfiles.com/local--files/intro%3Aread-the-manual/Middleware%20Trends%20and%20Market%20Leaders%202011.pdf) veröffentlicht, welches verschiedene Middlewares vergleicht: ZeroMQ gewinnt...
  * Es wäre wichtig, das die Transportkomponente auch **lokal** Daten zwischen Prozessen verschicken kann. Am effizientesten ist dabei **shared memory** basierte Kommunikation.

## Sketch

  * Discovery wird UDP Multicast basiert selbst geschrieben mit libuuid für UUIDs
  * Transport wird mit ZeroMQ gemacht
  * Serialization/Deserialization basiert auf Cap'n'Proto
   
### Installation of ZeroMQ   

    sudo su
    echo "deb http://download.opensuse.org/repositories/network:/messaging:/zeromq:/git-draft/xUbuntu_18.04/ ./" >> /etc/apt/sources.list
    exit
    wget https://download.opensuse.org/repositories/network:/messaging:/zeromq:/git-draft/xUbuntu_18.04/Release.key -O- | sudo apt-key add
    sudo apt install libzmq3-dev

### Installation of Cap'n'Proto

    sudo apt-get install capnproto libcapnp-dev
