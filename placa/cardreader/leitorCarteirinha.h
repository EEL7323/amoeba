#ifndef LEITORCARTEIRINHA_H
#define LEITORCARTEIRINHA_H
#include <iostream>
#include <string>
#include "lib/MFRC522.h"

class leitorCarteirinha
{
	MFRC522 mfrc;
	int leitura;
	int numero;

	//naoLida = 0; lida = 1
	enum carteirinha {naoLida, lida};
	typedef enum carteirinha estado_carteirinha;
	estado_carteirinha estado;

	public:
		leitorCarteirinha();
		int carteirinhaNoLeitor();
		string getCarteirinha();
		int updateCreditos(int creditos);

};
#endif
