#include <iostream>
#include <unistd.h>
#include <leitorCarteirinha.h>

int main()
{

	if (geteuid() != 0){
        printf("Deve ser executado como administrador.\n");
        exit(1);
    }
	//Definição das variáveis de estado da máquina
	int estado = 0;
	int retorno =0;
    string tmp;
    string carteirinha;

    leitorCarteirinha lc;

    cout << "Aguardando carteirinha..." << endl;

    while(!lc.carteirinhaNoLeitor())
    {}

    cout << "Carteirinha encontrada: " << lc.getCarteirinha() << endl;
}
