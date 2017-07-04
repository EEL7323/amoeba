/**
 * @file:   RuManager.cpp
 * @author: mvalente
 * @section DESCRIPTION
 * A classe RuManager controla o acesso ao refeitório bem como a inserção das informações na estrutura de dados e a conexao com o servidor para atualizações.
 *
 *
 *
 *Created on June 30, 2017, 5:24 PM
 */

#include "RuManager.h"
/**
 * Construtor que inicaliza a estrutura de dados, a conexaoServidor e o numero de usuarios
 *
 */
RuManager::RuManager() {
    numUsers = 0;
    BinaryTree dados;
    matricula = 0;
    conexaoServidor cs;

}

RuManager::~RuManager() {
    
}
/**
 * A função entrouAluno adiciona um novo aluno na estrutura de dados e atualiza o servidor com o novo total de alunos
 *
 * @param novaMatricula recebe a matricula do aluno a ser adicionado.
 */
void RuManager::entrouAluno(int novaMatricula){

    dados.inserirNodo(novaMatricula);
    numUsers = numUsers+1;
    int resp;
    resp = cs.atualizaTotalUsuarios(numUsers);
}
/**
 * A função saiuAluno remove um  aluno da estrutura de dados e atualiza o servidor com o novo total de alunos
 *
 * @param novaMatricula recebe a matricula do aluno a ser removido.
 */
void RuManager::saiuAluno(int novaMatricula){
    dados.removerNodo(novaMatricula);
    numUsers = numUsers-1;
    int resp;
    resp = cs.atualizaTotalUsuarios(numUsers);

}
/**
 * A função getNumUsers retorna o total de alunos no RU.
 *
 */
int RuManager::getNumUsers(){
    
    return numUsers;
    
}
/**
  * A função estaNoRu verifica se algum aluno está no Ru
  *
  * @param novaMatricula recebe a matricula do aluno a ser verificado.
  *
  *@return retorna true caso o aluno esteja no Ru e false caso contrário.
  */

bool RuManager::estaNoRu(int matricula){
    

    if(dados.procurarNodo(matricula) == 0)
        return false;
    else
        return true;
}
