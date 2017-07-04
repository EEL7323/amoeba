/**
 * @file:   AcessoCard.cpp
 * @author: mvalente
 * @section DESCRIPTION
 * A classe AcessoCard controla a comunicação entre carteirinha e a placa se utilizand de um ponteiro de RuManager para controlar o acesso de *usuários ao refeitório.
 *
 *
 *
 *Created on June 30, 2017, 5:24 PM
 */

#include "AcessoCard.h"
#include <string>
#include <cstdlib>
#include <vector>
#include <iostream>
#include "RuManager.h"
#include <iostream>
#include <unistd.h>
#include <leitorCarteirinha.h>
#include "conexaoServidor.h"
using namespace std;

/**
 * Construtor que recebe o endereço do RuManger.
 *
 * @param *novoManager endereço do RuManeger a ser utilizado.
 */

AcessoCard::AcessoCard (RuManager *novoManager)
{
    manager = novoManager;
}
/**
 * Construtor nulo.
 *
 *
 */
AcessoCard::AcessoCard ()
{
    manager = 0;
}

AcessoCard::~AcessoCard()
{
    
}

//---------------------------------------------------------------------------//
/**
 * A função libera a cacatraca seria implementada caso o projeto tivesse continuade enviando um sinal para o controle da catatraca de modo a fazer a liberação.
 */

void AcessoCard::liberaEntrada()
{
 //LIBERAR A CATRACA
}

//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
/**
 * A função rodar serve como o main para a therad relativa ao cartão.
 *
 *
 *
 *
 */
void AcessoCard::rodar()
{
    if (geteuid() != 0)
    {
        printf("Deve ser executado como administrador.\n");
        exit(1);
    }
    while (true)
    {
    
    
        //Definição das variáveis de estado da máquina
        int estado = 0;
        int retorno =0;
        string tmp;
        string carteirinha;
        conexaoServidor cs;
        leitorCarteirinha lc;
    
        cout << "Aguardando carteirinha..." << endl;
    
        while(!lc.carteirinhaNoLeitor())
        {}

        std::string carteirinhaId;
        int carteirinhaIdINT;
        
        
        
            if (lc.abreCarteirinha())
            {
                //carteirinhaId = lc.getCarteirinha();
                carteirinhaId = "12206326";
                carteirinhaIdINT = atoi(carteirinhaId.c_str());
                if(!manager->estaNoRu(carteirinhaIdINT))
                {
                 
                    
                    //atualiza creditos
                    int novosCreditos;
                    novosCreditos = cs.verificaCarteirinha(carteirinhaId);
                    
                    if(novosCreditos > 0){
                        if (lc.updateCreditos(novosCreditos))
                        {
                            cout << "Créditos adicionados com sucesso!" << endl;
                            cs.confirmaRecarga(carteirinhaId);
                        } else
                        {
                            cout << "Erro ao atualizar créditos na cairteirinha!" << endl;
                        }
                    }
                    
                    //acesso ao restaurante
                    if (lc.acessoRestaurante())
                    {
                        cout << "Acesso ao restaurante permitido! Créditos restantes: " << lc.passesRestantes << endl;
                        manager->entrouAluno(carteirinhaIdINT);
                        cout << "\nUsuarios dentro do RU: "<< manager->getNumUsers();
                        lc.fechaCarteirinha();
                        while(lc.carteirinhaNoLeitor() == 0)
                        {}

                    } else
                    {
                        cout << "Não há créditos suficientes na carteirinha" << endl;
                    }
                }else
                {
                    manager->saiuAluno(carteirinhaIdINT);
                    cout << "\nUsuarios dentro do RU: "<< manager->getNumUsers();
                    std::cout << "\n SAIDA LIBERADA\n";
                    lc.fechaCarteirinha();
                    while(lc.carteirinhaNoLeitor() == 0)
                    {}
                }
            }
           // lc.fechaCarteirinha();
        }
    return;
}

