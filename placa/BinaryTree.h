/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   BinaryTree.h
 * Author: mvalente
 *
 * Created on May 15, 2017, 3:35 PM
 */

#ifndef BINARYTREE_H
#define BINARYTREE_H

#include "Node.h"

class BinaryTree {
        Node* raiz;
	void auxApagaTree (Node*);
	void auxInserir (Node *&, int) ;
	void auxRemoverNodo (Node *&, int) ;
	Node* auxProcurar (Node *, int);
        
   public:
	BinaryTree ();
	~BinaryTree ();
	void apagaTree ();
	void inserirNodo (int matricula);
	void removerNodo (int matricula);
	Node* procurarNodo (int matricula);
        Node* removerMenorValor (Node *&);
	bool estaVazia ();

};

#endif /* BINARYTREE_H */

