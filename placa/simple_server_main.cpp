#include "ServerSocket.h"
#include "SocketException.h"
#include <string>
#include<bits/stdc++.h>
#include "AcessoApp.h"
#include "AcessoCard.h"
#include "RuManager.h"
#include <thread>
#include "conexaoServidor.h"
using namespace std;



void rodaApp(AcessoApp *acApp)
{
    acApp->rodar();
}

void rodaCard(AcessoCard *acCard)
{
    acCard->rodar();
}

int main ( )
{
    RuManager manager;
    conexaoServidor cs;
    
    AcessoApp acApp(&manager);
    AcessoCard acCard(&manager);
    int resp = cs.atualizaTotalUsuarios(0);
    //acCard.rodar();
    std::thread app(rodaApp, &acApp);
    std::thread card(rodaCard, &acCard);
    while(true){}
    
    return 0;
}
