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
    string tmp;
    string carteirinha;

    leitorCarteirinha lc;

    cout << "Aguardando carteirinha..." << endl;

    while(!lc.carteirinhaNoLeitor())
    {}

    if (lc.abreCarteirinha())
    {
        cout << "Carteirinha: " << lc.getCarteirinha() << endl;
        if (lc.updateCreditos(3))
        {
            cout << "Créditos adicionados com sucesso!" << endl;
        } else
        {
            cout << "Erro ao atualizar créditos na cairteirinha!" << endl;
        }
        if (lc.acessoRestaurante())
        {
            cout << "Acesso ao restaurante permitido! Créditos restantes: " << lc.passesRestantes << endl;
        } else
        {
            cout << "Não há créditos suficientes na carteirinha" << endl;
        }
    }
    lc.fechaCarteirinha();

}
