/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   RuManager.cpp
 * Author: mvalente
 * 
 * Created on June 6, 2017, 2:30 PM
 */

#include "RuManager.h"

RuManager::RuManager() {
    numUsers = 0;
    BinaryTree dados;
    matricula = 0;
    conexaoServidor cs;

}

RuManager::~RuManager() {
    
}

void RuManager::entrouAluno(int novaMatricula){

    dados.inserirNodo(novaMatricula);
    numUsers = numUsers+1;
    int resp;
    resp = cs.atualizaTotalUsuarios(numUsers);
}

void RuManager::saiuAluno(int novaMatricula){
    dados.removerNodo(novaMatricula);
    numUsers = numUsers-1;
    int resp;
    resp = cs.atualizaTotalUsuarios(numUsers);

}

int RuManager::getNumUsers(){
    
    return numUsers;
    
}

bool RuManager::estaNoRu(int matricula){
    

    if(dados.procurarNodo(matricula) == 0)
        return false;
    else
        return true;
}
