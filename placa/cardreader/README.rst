MFRC522
=======

Raspberry PI library for MFRC522.

Example program, Read.cpp, which will read rfid cards.

This library uses the bcm2835 library found at:
http://www.airspayce.com/mikem/bcm2835/bcm2835-1.50.tar.gz 

Fetch the tar-file and install it:

  tar zxvf bcm2835-1.xx.tar.gz

  cd bcm2835-1.xx

  ./configure

  make

  sudo make check

  sudo make install


To build:

  g++ MFRC522.cpp Read.cpp -std=c++11 -lbcm2835

Pin Layout
----------

The following table shows the pin layout used:

+-----------+----------+-------------+
|           | MFRC522  | Raspberry Pi|
+-----------+----------+-------------+
| Signal    | Pin      | Pin         |
+===========+==========+=============+
| RST/Reset | RST      | 22          |
+-----------+----------+-------------+
| SPI SS    | SDA      | 24          |
+-----------+----------+-------------+
| SPI MOSI  | MOSI     | 19          |
+-----------+----------+-------------+
| SPI MISO  | MISO     | 21          |
+-----------+----------+-------------+
| SPI SCK   | SCK      | 23          |
+-----------+----------+-------------+
| 3V        | 3v       | 1           |
+-----------+----------+-------------+
| GND       | GND      | 25          |
+-----------+----------+-------------+
