/**
 * @file:   AcessoApp.cpp
 * @author: mvalente
 * @section DESCRIPTION 
 * A classe AcessoApp controla a comunicação entre o App e a placa se utilizand de um ponteiro de RuManager para controlar o acesso de *usuários ao refeitório.
 *
 *
 *
 *Created on June 30, 2017, 5:24 PM
 */

#include "AcessoApp.h"
#include <string>
#include <cstdlib>
#include <vector>
#include <iostream>
#include "RuManager.h"


using namespace std;

/**
 * Construtor que recebe o endereço do RuManger.
 *
 * @param *novoManager endereço do RuManeger a ser utilizado.
 */
AcessoApp::AcessoApp (RuManager *novoManager)
{
    manager = novoManager;
}
/**
 * Construtor nulo.
 *
 *
 */
AcessoApp::AcessoApp ()
{
    manager = 0;
}

AcessoApp::~AcessoApp()
{
    
}

//---------------------------------------------------------------------------//
/**
 * A função generate captcha gera um captcha numérico de um tamanho definido.
 *
 * @param n tamanho do captcha a ser retornado.
 *
 *@return Um string com o número de caracteres definidos por n.
 */
string AcessoApp::generateCaptcha(int n)
{
    
    time_t t;
    srand((unsigned)time(&t));
    
    // caracteres possiveis
    char *chrs = "0123456789";
    
    // gera caracter n vezes
    // adiciona na string
    
    string captcha = "";
    while (n--)
        captcha.push_back(chrs[rand()%9]);
    
    return captcha;
}

//---------------------------------------------------------------------------//

/**
 * A função libera a cacatraca seria implementada caso o projeto tivesse continuade enviando um sinal para o controle da catatraca de modo a fazer a liberação.
 */
void AcessoApp::liberaEntrada()
{
 //LIBERAR A CATRACA
}

//---------------------------------------------------------------------------//
/**
 * A função split devolve um vector de string a partir de uma string original e um delimitator
 *
 * @param  str string a ser dividida
 * @param delim caracter delimitador
 *@return vector com as strings devidamente separadas.
 */
vector<string> split(const string& str, const string& delim)
{
    vector<string> tokens;
    size_t prev = 0, pos = 0;
    do
    {
        pos = str.find(delim, prev);
        if (pos == string::npos) pos = str.length();
        string token = str.substr(prev, pos-prev);
        if (!token.empty()) tokens.push_back(token);
        prev = pos + delim.length();
    }
    while (pos < str.length() && prev < str.length());
    return tokens;
}

//---------------------------------------------------------------------------//
/**
 * A função rodar serve como o main para a therad relativa ao aplicativo.
 *
 *
 *
 *
 */
void AcessoApp::rodar()
{
    std::cout << "running....\n";
    
    try
    {
        // Create the socket
        ServerSocket server ( 30000 );
        
        while ( true )
        {
            std::string captcha = generateCaptcha(4);
            std::cout << "\nDIGITE:\n" << captcha << "\n";
            int captchaInt;
            captchaInt = atoi(captcha.c_str());
            
            ServerSocket new_sock;
            server.accept ( new_sock );
            cout << "passei por aqui";
            try
            {
                    //definicoes
                    std::string data;
                    std::string matricula;
                
                    int captchaRecv;
                    int matriculaInt;
                    int entrarOusair;
                
                    
                        //recebe informacoes
                        new_sock >> data;
                        cout << "\ninformacoes: " << data;
                        vector<string> infos;
                        infos = split(data, "&");
                        //informacoes separadas no vetor
                
                        entrarOusair = atoi(infos[0].c_str());
                        captchaRecv = atoi(infos[1].c_str());
                        matriculaInt = atoi(infos[2].c_str());
                
                if(entrarOusair == 1){
                    
                        if(captchaRecv == captchaInt)
                        {
                            new_sock << "1"; //captcha certo manda 1
                            //adiciona o aluno na estrutura de dados
                            manager->entrouAluno(matriculaInt);
                            //imprimir e atualizar o servidor
                            cout << "\nUsuarios dentro do RU: "<< manager->getNumUsers();
                            std::cout << "\n ENTRADA LIBERADA\n";
                            liberaEntrada();
                            
                        }else
                        {
                            
                            new_sock << "0"; //captcha errado manda 0
                            std::cout << "\n TENTE NOVAMENTE\n";
                            //new_sock << "\n TENTE NOVAMENTE\n";
                        }
                }else
                {
                    if(captchaRecv == captchaInt)
                    {
                        new_sock << "1"; //captcha certo manda 1
                        //remove o aluno na estrutura de dados
                        manager->saiuAluno(matriculaInt);
                        //imprimir e atualizar o servidor
                        cout << "\nUsuarios dentro do RU: "<< manager->getNumUsers();
                        std::cout << "\n SAIDA LIBERADA\n";
                        
                    }else
                    {
                        
                        new_sock << "0"; //captcha errado manda 0
                        std::cout << "\n TENTE NOVAMENTE\n";
                        //new_sock << "\n TENTE NOVAMENTE\n";
                    }
                
                }
                
            }
            catch ( SocketException& ) {}
            
        }
    }
    catch ( SocketException& e )
    {
        std::cout << "Exception was caught:" << e.description() << "\nExiting.\n";
    }
    
    return;
}

