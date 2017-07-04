#ifndef LEITORCARTEIRINHA_H
#define LEITORCARTEIRINHA_H
#include <iostream>
#include <string>
#include "lib/MFRC522.h"

const byte knownKeys[8][MFRC522::MF_KEY_SIZE] =  {
    {0xff, 0xff, 0xff, 0xff, 0xff, 0xff}, // FF FF FF FF FF FF = factory default
    {0xa0, 0xa1, 0xa2, 0xa3, 0xa4, 0xa5}, // A0 A1 A2 A3 A4 A5
    {0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5}, // B0 B1 B2 B3 B4 B5
    {0x4d, 0x3a, 0x99, 0xc3, 0x51, 0xdd}, // 4D 3A 99 C3 51 DD
    {0x1a, 0x98, 0x2c, 0x7e, 0x45, 0x9a}, // 1A 98 2C 7E 45 9A
    {0xd3, 0xf7, 0xd3, 0xf7, 0xd3, 0xf7}, // D3 F7 D3 F7 D3 F7
    {0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff}, // AA BB CC DD EE FF
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00}  // 00 00 00 00 00 00
};


class leitorCarteirinha
{
	MFRC522 mfrc;
	int leitura;
	int numero;
	//naoLida = 0; lida = 1
	enum carteirinha {naoLida, lida};
	typedef enum carteirinha estado_carteirinha;
	estado_carteirinha estado;
	MFRC522::MIFARE_Key key;

	public:
		leitorCarteirinha();
		int passesRestantes;
		int carteirinhaNoLeitor();
		string getCarteirinha();
		int updateCreditos(int creditos);
		int acessoRestaurante();
		int abreCarteirinha();
		int fechaCarteirinha();
};
#endif
