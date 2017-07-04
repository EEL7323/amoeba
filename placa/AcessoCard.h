/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * File:   AcessoCard.h
 * Author: mvalente
 *
 * Created on June 30, 2017, 5:24 PM
 */

#ifndef ACESSOCARD_H
#define ACESSOCARD_H
#include <string>
#include <cstdlib>
#include "RuManager.h"
#include <iostream>
#include <unistd.h>
#include <leitorCarteirinha.h>

using namespace std;

class AcessoCard {

    RuManager *manager;

public:
    
    AcessoCard();
    AcessoCard(RuManager * anager);
    virtual ~AcessoCard();
    void liberaEntrada();
    void rodar();
    
private:
    
};

#endif /* ACESSOCARD_H */

