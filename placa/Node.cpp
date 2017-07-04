/**
 * @file:   Node.cpp
 *
 * @section DESCRIPTION
 * A classe Node define o nodo da árvore binária. Foi utilizada o nodo apresentado em sala de aula pelo professor.
 *
 *
 *
 *Created on June 30, 2017, 5:24 PM
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
