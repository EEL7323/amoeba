
/**
 * @file:   leitorCarteirnha.cpp
 * @section DESCRIPTION
 * A classe leitorCarterinha controla o leitor de RFID.
 *
 *
 *
 *Created on June 30, 2017, 5:24 PM
 */

#include "leitorCarteirinha.h"

/**
 * Construtor inicializa o leitor.
 *
 *
 */
leitorCarteirinha::leitorCarteirinha (void)
{
    mfrc.PCD_Init();

    for (byte i = 0; i < MFRC522::MF_KEY_SIZE; i++) {
          key.keyByte[i] = knownKeys[0][i];
      }
}
/**
 * A função carterinhaNoLeitor verifica se há alguma carterinha no leitor de RFID
 *
 * @return retorna 1 se houver carterinha e 0 caso contrário.
 */
int leitorCarteirinha::carteirinhaNoLeitor()
{
	return mfrc.PICC_IsNewCardPresent();
}

/**
 * A função getCarteirinha devolve o id da carterinha no leitor
 *
 * @return retorna o id da carterinha no leitor
 */
string leitorCarteirinha::getCarteirinha()
{
    if( !mfrc.PICC_ReadCardSerial())
        return "ERRO";

    char code[10] = "";

    for(byte i = 0; i < mfrc.uid.size; ++i){
      if(mfrc.uid.uidByte[i] < 0x10){
        sprintf(code,"%s0%X", code, mfrc.uid.uidByte[i]);
      }
      else{
        sprintf(code,"%s%X", code, mfrc.uid.uidByte[i]);
      }
    }

    string carteirinha(code);
	return carteirinha;
}
/**
 * A função updateCreditos atualiza os creditos da carterinha
 *
 * @param creditos informa o numero de creditos a ser adicionado na carterinha
 *
 * @return retorna 1 para operação realizada com sucesso e 0 caso contrário
 */
int leitorCarteirinha::updateCreditos(int creditos)
{
    byte block = 1;
    byte status;
    int result = 1;
    long valor = 0L;

    status = mfrc.MIFARE_GetValue(block, &valor);
    if (status != MFRC522::STATUS_OK) {
        result = 0;
    }
    else {
        valor = valor+creditos;

        status = mfrc.MIFARE_SetValue(block, valor);
        if (status != MFRC522::STATUS_OK) {
            result = 0;
        }
        else {
            result = 1;
        }
    }

    return result;
}
/**
 * A função acessoRestaurante informa que o aluno pode acessar ao restaurante e diminui os créditos
 *
 *
 *
 * @return retorna 1 para operação realizada com sucesso e 0 caso o aluno não tenha creditos o suficiente
 */
int leitorCarteirinha::acessoRestaurante()
{
    byte block = 1;
    byte status;
    int result = 1;
    long valor = 0L;


    status = mfrc.MIFARE_GetValue(block, &valor);
    if (status != MFRC522::STATUS_OK) {
        result = 0;
    }
    else {
      if (valor>0)
      {
        valor = valor-1;
        passesRestantes = valor;

        status = mfrc.MIFARE_SetValue(block, valor);
        if (status != MFRC522::STATUS_OK) {
            result = 0;
        }
        else {
            result = 1;
        }
      }
      else
        result = 0;
    }

    return result;
}

/**
 * A função abreCarteirnha permite a escrita na carterinha
 *
 *
 * @return retorna 1 para operação realizada com sucesso e 0 caso contrário
 */
int leitorCarteirinha::abreCarteirinha()
{
    byte block = 1;
    byte status;
    int result = 1;

    if(!mfrc.PICC_ReadCardSerial())
    {
        printf("Err.\n");
        return 0;
    }

    status = mfrc.PCD_Authenticate(MFRC522::PICC_CMD_MF_AUTH_KEY_A, block, &key, &(mfrc.uid));

    if (status != MFRC522::STATUS_OK) {
        result = 0;
    } else {
        result = 1;
    }

    return result;
}

/**
 * A função fechaCarteirnha bloqueia a escrita na carterinha
 *
 *
 * @return retorna 1 para operação realizada com sucesso e 0 caso contrário
 */
int leitorCarteirinha::fechaCarteirinha()
{
    mfrc.PICC_HaltA();       // Halt PICC
    mfrc.PCD_StopCrypto1();  // Stop encryption on PCD
    return 1;
}
