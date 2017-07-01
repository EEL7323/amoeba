#include "leitorCarteirinha.h"

/*
Aqui é destinado para o momento de leitura
da carteirinha.
 */

leitorCarteirinha::leitorCarteirinha (void)
{
    mfrc.PCD_Init();
}

int leitorCarteirinha::carteirinhaNoLeitor()
{
	return mfrc.PICC_IsNewCardPresent();
}

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

int leitorCarteirinha::updateCreditos(int creditos)
{
    if(!mfrc.PICC_IsNewCardPresent())
        return 0;

    if( !mfrc.PICC_ReadCardSerial())
        return 0;

    //PICC_DumpMifareClassicSectorToSerial(mfrc.uid, )

    return 0;
}
