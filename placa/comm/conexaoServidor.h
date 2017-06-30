#ifndef CONEXAOSERVIDOR_H
#define CONEXAOSERVIDOR_H
#include <iostream>
#include <string>
#include <curl/curl.h>
#include "lib/json/json.h"

using namespace std;

static std::string serverUrl = "http://rueba.site/api";

class conexaoServidor
{
	//Necessário para conexão com o servidor
	CURL *curl;
	CURLcode res;
	std::string readBuffer;
	std::string linkServidor;

	public:
	conexaoServidor();
	int verificaCarteirinha(string carteirinha);
	int confirmaRecarga(string carteirinha);
	int atualizaTotalUsuarios(int total);
};
#endif
