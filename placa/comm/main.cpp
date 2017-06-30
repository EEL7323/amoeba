#include <iostream>
#include <unistd.h>
#include <conexaoServidor.h>

int main()
{

	if (geteuid() != 0){
        printf("Deve ser executado como administrador.\n");
        exit(1);
    }
	//Definição das variáveis de estado da máquina
	int estado = 0;
	int tmp =0;

	conexaoServidor cs;

	//cs.atualizaTotalUsuarios(40);
	//cs.verificaCarteirinha("12206326");
	//cs.confirmaRecarga("12206326");

}
