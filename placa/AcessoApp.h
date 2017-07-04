/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * File:   AcessoApp.h
 * Author: mvalente
 *
 * Created on June 30, 2017, 5:24 PM
 */

#ifndef ACESSOAPP_H
#define ACESSOAPP_H
#include <string>
#include "ServerSocket.h"
#include "SocketException.h"
#include <bits/stdc++.h>
#include <cstdlib>
#include "RuManager.h"

using namespace std;

class AcessoApp {

    RuManager *manager;

public:
    
    AcessoApp();
    AcessoApp(RuManager * anager);
    virtual ~AcessoApp();
    string generateCaptcha(int n);
    string removeCreditos(string creditos);
    void liberaEntrada();
    void rodar();
    
private:
    
};

#endif /* ACESSOAPP_H */

