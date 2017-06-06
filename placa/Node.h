/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Node.h
 * Author: mvalente
 *
 * Created on May 15, 2017, 3:35 PM
 */

#ifndef NODE_H
#define NODE_H

class Node {

	int matricula;		// matricula do aluno armazenada no nodo
   
   public:

	Node *esquerda;	// ponteiro para o elemento a esquerda do nodo
	Node *direita;	// ponteiro para o elemento a direita do nodo

	// construtor sem parametros
	Node();
	// construtor com parametros
	Node(int val, Node *esq, Node *dir);
	
	int getMatricula(); // retorna a matricula
	
 	void setMatricula(int novaMatricula); // altera a matricula
	
	Node* nodoEsquerda(); // retorna ponteiro para o filho esquerdo do nodo atual
	
	Node* nodoDireita(); // retorna ponteiro para o filho direito do nodo atual
 	
	bool ehFolha(); // verifica se o nodo é folha

};

#endif /* NODE_H */

