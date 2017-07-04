/**
 * @file:   BinaryTree.cpp
 *
 * @section DESCRIPTION
 * A classe BinaryTree define a estrutura da árvore binária. Foi utilizada a árvore apresentada em sala de aula pelo professor.
 *
 *
 *
 *Created on June 30, 2017, 5:24 PM
 */

#include "BinaryTree.h"
#include <iostream>
using namespace std;
/**
 * Construtor que com raiz nula.
 */
BinaryTree::BinaryTree (){ // Construtor

	raiz = 0;
}
/**
 * Destrutor que apaga a árvore recursivamente.
 */
BinaryTree::~BinaryTree (){ // Destrutor

	auxApagaTree( raiz);
}

void BinaryTree::apagaTree (){ // Apaga toda a arvore

	auxApagaTree(raiz);
	raiz = 0;
}

/**
 * Função inserir nodo adiciona um novo nodo na arvore devidamente posicionado
 *
 * @param elemento recebe o elemento a ser inserido.
 */
void BinaryTree::inserirNodo (int elemento){
	auxInserir(raiz, elemento);
}
/**
 * Função remover nodo remove o nodo da arvore.
 *
 * @param elemento recebe o elemento a ser removido.
 */
void BinaryTree::removerNodo (int elemento ){
	auxRemoverNodo(raiz, elemento);
}

Node* BinaryTree::procurarNodo ( int elemento ){
	return auxProcurar ( raiz, elemento );
}
/**
 * Função para verificar se arvore esta vazia
 *
 *@return retorna true caso a arvore esteja vazia e false caso contrário.
 */
bool BinaryTree::estaVazia (){ // Retorna true, se a arvore estiver vazia

	return raiz == 0;
}

Node* BinaryTree::auxProcurar (Node *r, int val){
	if ( r == 0 )
		return 0 ;
	else
		if (val < r->getMatricula())
			return auxProcurar ( r->nodoEsquerda(), val);
		else
			if (val == r->getMatricula())
				return r;
			else
				return auxProcurar ( r->nodoDireita(), val );
}

void BinaryTree::auxInserir (Node *& r, int val){
	if ( r == 0 )
		r = new Node ( val, 0, 0) ;
	else
		if ( val < r->getMatricula() )
			auxInserir ( r->esquerda, val ) ;
		else
			auxInserir ( r->direita, val ) ;
}

void BinaryTree::auxRemoverNodo (Node *& r, int val){
	if ( r == 0 )
        r=0;//cout << val << "elemento nao encontrado" << endl;
	else
		if (val < r->getMatricula())         // busca a esquerda
			auxRemoverNodo ( r->esquerda, val );
		else
			if ( val > r->getMatricula() )     // busca a direita
				auxRemoverNodo ( r->direita, val );
			else{
				Node *temp = r;
				if ( r->esquerda == 0 )  // existe somente um filho a direita
					r = r->direita;   // aponta a direita
				else
					if ( r->direita == 0 ) // existe somente um filho a esquerda
						r = r->esquerda;
					else{
						// o nodo possui dois filhos
						temp = removerMenorValor ( r->direita );
						r->setMatricula ( temp->getMatricula() );
					}
				delete temp;
			}
}


void BinaryTree::auxApagaTree (Node *r){ // apaga toda a arvore

	if (r == 0)
		return ;
	auxApagaTree ( r->nodoEsquerda() );
	auxApagaTree ( r->nodoDireita() );
	delete r ;
}
/**
 * Função remover nodo remove o nodo de menor valor da arvore.
 *
 * @param r recebe o elemento a ser removido.
   @return devolve o elemento removido
 */
Node* BinaryTree::removerMenorValor (Node *& r){
	if (r->esquerda != 0)
		return removerMenorValor ( r->esquerda ) ;
	else{
		Node *temp = r;
		r = r->direita;
		return temp;
	}
}
