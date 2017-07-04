/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   RuManager.h
 * Author: mvalente
 *
 * Created on June 6, 2017, 2:30 PM
 */

#ifndef RUMANAGER_H
#define RUMANAGER_H

#include "Node.h"
#include "BinaryTree.h"
#include <string>
#include "conexaoServidor.h"
class RuManager {
    int numUsers;
    BinaryTree dados;
    int matricula;
    conexaoServidor cs;
    
    
public:
    RuManager();
    virtual ~RuManager();
    void entrouAluno(int novaMatricula);
    void saiuAluno(int novaMatricula);
    int getNumUsers();
    bool estaNoRu(int matricula);


};

#endif /* RUMANAGER_H */

