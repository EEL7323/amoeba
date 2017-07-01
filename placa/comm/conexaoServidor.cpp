#include "conexaoServidor.h"


static size_t WriteCallback(void *contents, size_t size, size_t nmemb, void *userp)
{
    ((std::string*)userp)->append((char*)contents, size * nmemb);
    return size * nmemb;
}

conexaoServidor::conexaoServidor (void)
{

}

//Realiza conexão com a API do servidor para atualizar o número de pessoas no restaurante
int conexaoServidor::atualizaTotalUsuarios(int total)
{
    readBuffer = "";
    cout << "Total de usuários: " << total<<endl;
    linkServidor = serverUrl + "/setNumeroUsuariosRestaurante/" + std::to_string(total);
    cout << "LinkServidor: " << linkServidor<<endl;

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

    cout << "Consulta: " << readBuffer <<endl;

    if(root.get("status", "ERROR").asString()=="OK")
        return 1;

    return 0;
}

int conexaoServidor::verificaCarteirinha(string carteirinha)
{
    readBuffer = "";
    cout << "Carteirinha: " << carteirinha <<endl;
    linkServidor = serverUrl + "/getCreditosCarteirinha/" + carteirinha;
    cout << "LinkServidor: " << linkServidor<<endl;

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

    cout << "Consulta: " << readBuffer <<endl;

    if(root.get("status", "ERROR").asString()=="OK")
    {
        return 0;
    }
    else if (root.get("status", "ERROR").asString()=="RECARGA_PENDENTE")
    {
        return 1;
    }
    else if (root.get("status", "ERROR").asString()=="CARTEIRINHA_NOVA")
    {
        return 2;
    }

    return 0;
}

int conexaoServidor::confirmaRecarga(string carteirinha)
{
    readBuffer = "";
    cout << "Carteirinha: " << carteirinha <<endl;
    linkServidor = serverUrl + "/confirmaRecarga/" + carteirinha;
    cout << "LinkServidor: " << linkServidor<<endl;

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

    cout << "Consulta: " << readBuffer <<endl;

    if(root.get("status", "ERROR").asString()=="OK")
        return 1;

    return 0;
}
