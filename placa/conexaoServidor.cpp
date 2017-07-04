/**
 * @file:   conexaoServidor.cpp
 * @section DESCRIPTION
 * A classe conexaoServidor controla toda a comunicao entre o server e a placa.
 *
 *
 *
 *Created on June 30, 2017, 5:24 PM
 */


#include "conexaoServidor.h"

static size_t WriteCallback(void *contents, size_t size, size_t nmemb, void *userp)
{
    ((std::string*)userp)->append((char*)contents, size * nmemb);
    return size * nmemb;
}
/**
 * Construtor nulo.
 *
 *
 */
conexaoServidor::conexaoServidor (void)
{

}
/**
 * A função atualizaTotalUsuarios realiza conexão com a API do servidor para atualizar o número de pessoas no restaurante
 * @param total numero de usuarios a ser atualizado.
 * @return retorna 1 se a conexão foi feita com sucesso e 0 caso contrário.
 */
int conexaoServidor::atualizaTotalUsuarios(int total)
{
    readBuffer = "";
    //cout << "Total de usuários: " << total<<endl;
    linkServidor = serverUrl + "/setNumeroUsuariosRestaurante/" + std::to_string(total);
    //cout << "LinkServidor: " << linkServidor<<endl;

    //Inicializa biblioteca cURL e configura os parâmetros de comunicação
    curl = curl_easy_init();
    if(curl)
    {
        curl_easy_setopt(curl, CURLOPT_URL, linkServidor.c_str());
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);
        res = curl_easy_perform(curl);
        curl_easy_cleanup(curl);
    }

    //Processa resposta em formato JSON para um objeto
	Json::Value root;
    Json::Reader reader;

    bool parsingSuccessful = reader.parse( readBuffer.c_str(), root );     //parse process
   	if ( !parsingSuccessful )
    {
        std::cout  << "Failed to parse"
               << reader.getFormattedErrorMessages();
        return 0;
    }

    //cout << "Consulta: " << readBuffer <<endl;

    if(root.get("status", "ERROR").asString()=="OK")
        return 1;

    return 0;
}
/**
 * A função verificaCarteirinha realiza conexão com a API do servidor para verificar se a carterinha deve ser regarrecada.
 * @param carterinha recebe o código da carterinha
 * @return retorna 1 se a conexão foi feita com sucesso e 0 caso contrário.
 */
int conexaoServidor::verificaCarteirinha(string carteirinha)
{
    readBuffer = "";
    //cout << "Carteirinha: " << carteirinha <<endl;
    linkServidor = serverUrl + "/getCreditosCarteirinha/" + carteirinha;
    //cout << "LinkServidor: " << linkServidor<<endl;

    //Inicializa biblioteca cURL e configura os parâmetros de comunicação
    curl = curl_easy_init();
    if(curl)
    {
        curl_easy_setopt(curl, CURLOPT_URL, linkServidor.c_str());
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);
        res = curl_easy_perform(curl);
        curl_easy_cleanup(curl);
    }

    //Processa resposta em formato JSON para um objeto
    Json::Value root;
    Json::Reader reader;

    bool parsingSuccessful = reader.parse( readBuffer.c_str(), root );     //parse process
    if ( !parsingSuccessful )
    {
        std::cout  << "Failed to parse"
               << reader.getFormattedErrorMessages();
        return 0;
    }

    //cout << "Consulta: " << readBuffer <<endl;

    if(root.get("status", "ERROR").asString()=="OK")
    {
        return 0;
    }
    else if (root.get("status", "ERROR").asString()=="RECARGA_PENDENTE")
    {
        return root.get("credits", "ERROR").asInt();
    }

    return 0;
}
/**
 * A função confirmaRecarga realiza conexão com a API do servidor avisar que a recarga foi realiza.
 * @param carterinha recebe o código da carterinha
 * @return retorna 1 se a conexão foi feita com sucesso e 0 caso contrário.
 */
int conexaoServidor::confirmaRecarga(string carteirinha)
{
    readBuffer = "";
    //cout << "Carteirinha: " << carteirinha <<endl;
    linkServidor = serverUrl + "/confirmaRecarga/" + carteirinha;
    //cout << "LinkServidor: " << linkServidor<<endl;

    //Inicializa biblioteca cURL e configura os parâmetros de comunicação
    curl = curl_easy_init();
    if(curl)
    {
        curl_easy_setopt(curl, CURLOPT_URL, linkServidor.c_str());
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);
        res = curl_easy_perform(curl);
        curl_easy_cleanup(curl);
    }

    //Processa resposta em formato JSON para um objeto
    Json::Value root;
    Json::Reader reader;

    bool parsingSuccessful = reader.parse( readBuffer.c_str(), root );     //parse process
    if ( !parsingSuccessful )
    {
        std::cout  << "Failed to parse"
               << reader.getFormattedErrorMessages();
        return 0;
    }

    //cout << "Consulta: " << readBuffer <<endl;

    if(root.get("status", "ERROR").asString()=="OK")
        return 1;

    return 0;
}
