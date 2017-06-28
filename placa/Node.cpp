/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Node.cpp
 * Author: mvalente
 * 
 * Created on May 15, 2017, 3:35 PM
 */

#include "Node.h"


Node::Node (){
	esquerda = direita = 0;
}
Node::Node (int novaMatr, Node *esq, Node *dir){
	matricula = novaMatr;
	esquerda = esq;
	direita = dir;
}

int Node::getMatricula (){ // retorna o valor armazenado no nodo
	return matricula;
}

void Node::setMatricula (int novaMatricula){ // altera o valor armazenado no nodo
	matricula = novaMatricula;
}

Node* Node::nodoEsquerda(){ // retorna ponteiro para o filho esquerdo do nodo atual
	return esquerda;
}

Node* Node::nodoDireita (){ // retorna ponteiro para o filho direito do nodo atual

	return direita;
}

bool Node::ehFolha (){ // retorna verdadeiro se o nodo e' uma folha
	return (esquerda == 0) && (direita == 0);
}
