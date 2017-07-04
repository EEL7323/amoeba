#include "leitorCarteirinha.h"

/*
Aqui é destinado para o momento de leitura
da carteirinha.
 */

leitorCarteirinha::leitorCarteirinha (void)
{
    mfrc.PCD_Init();

    for (byte i = 0; i < MFRC522::MF_KEY_SIZE; i++) {
          key.keyByte[i] = knownKeys[0][i];
      }
}

int leitorCarteirinha::carteirinhaNoLeitor()
{
	return mfrc.PICC_IsNewCardPresent();
}

string leitorCarteirinha::getCarteirinha()
{
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


int leitorCarteirinha::fechaCarteirinha()
{
    mfrc.PICC_HaltA();       // Halt PICC
    mfrc.PCD_StopCrypto1();  // Stop encryption on PCD
    return 1;
}
