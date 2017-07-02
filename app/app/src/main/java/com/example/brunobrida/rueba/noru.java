package com.example.brunobrida.rueba;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/**
 * Created by bruno.brida on 30/06/2017.
 */

public class noru extends MainActivity{

    String serverResponse = "";
    TcpClient mTcpClient;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.noru);

        TextView textView = (TextView) findViewById(R.id.welcome_sair);
        textView.setText("Bem-vindo ao RU da UFSC, " + nome + "!");

        new noru.ConnectTask().execute("");

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                if(TcpClient.catracaAvailable)
                    Toast.makeText(getApplicationContext(), "Aberto conexão.", Toast.LENGTH_SHORT).show();
                else
                    Toast.makeText(getApplicationContext(), "Catraca não encontrada.", Toast.LENGTH_SHORT).show();
            }
        }, 2000);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu){
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem menu) {

        String filename = "creditos";
        String inputString = "";
        FileInputStream inputStream;

        switch (menu.getItemId()) {
            case R.id.item_option1:
                try {
                    inputStream = openFileInput(filename);
                    byte[] input = new byte[inputStream.available()];
                    while (inputStream.read(input) != -1) {
                    }
                    inputString += new String(input);
                    inputStream.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                Toast.makeText(getApplicationContext(), "Seu saldo é de: " + inputString + " passe(s).", Toast.LENGTH_SHORT).show();
                return true;
            case R.id.item_option2:
                Intent i = new Intent(noru.this, comprar.class);
                startActivity(i);
                return true;
            case R.id.item_option3:
                Toast.makeText(getApplicationContext(), "Você deve sair digitando o código de saida!", Toast.LENGTH_SHORT).show();
            default:
                return super.onOptionsItemSelected(menu);
        }
    }

    public void onClickSair(View v){

        if(TcpClient.catracaAvailable) {
            EditText exit_code = (EditText) findViewById(R.id.exit_code);
            String codout = exit_code.getText().toString();


            if (mTcpClient != null) {

                mTcpClient.sendMessage("0&" + codout + "&" + matricula);
            }

                Toast.makeText(getApplicationContext(), "Processando...", Toast.LENGTH_SHORT).show();

                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {

                        FileOutputStream outputStream;

                        if (!serverResponse.equals("")) {
                            if (Integer.parseInt(serverResponse) == 1) {
                                Toast.makeText(getApplicationContext(), "Saída liberada!", Toast.LENGTH_SHORT).show();
                                serverResponse = "";
                                if (mTcpClient != null) {
                                    mTcpClient.stopClient();
                                }
                                Toast.makeText(getApplicationContext(), "Obrigado e volte sempre!.", Toast.LENGTH_SHORT).show();
                                Intent i = new Intent(noru.this, home.class);
                                startActivity(i);
                            } else {
                                Toast.makeText(getApplicationContext(), "Captcha inválido. Tente novamente.", Toast.LENGTH_SHORT).show();
                                serverResponse = "";

                                if (mTcpClient != null) {
                                    mTcpClient.stopClient();
                                }

                                new noru.ConnectTask().execute("");

                                if (TcpClient.catracaAvailable) {
                                    Toast.makeText(getApplicationContext(), "Aberto conexão.", Toast.LENGTH_SHORT).show();
                                    Toast.makeText(getApplicationContext(), "Por favor, insira o código novamente.", Toast.LENGTH_SHORT).show();
                                } else {
                                    Toast.makeText(getApplicationContext(), "Catraca não encontrada.", Toast.LENGTH_SHORT).show();
                                    Toast.makeText(getApplicationContext(), "Por favor, conecte-se na mesma rede que a catraca.", Toast.LENGTH_SHORT).show();
                                }

                            }
                        } else {
                            Toast.makeText(getApplicationContext(), "Catraca não respondeu.", Toast.LENGTH_SHORT).show();

                            if (mTcpClient != null) {
                                mTcpClient.stopClient();
                            }

                            new noru.ConnectTask().execute("");

                            if (TcpClient.catracaAvailable) {
                                Toast.makeText(getApplicationContext(), "Aberto conexão.", Toast.LENGTH_SHORT).show();
                                Toast.makeText(getApplicationContext(), "Por favor, insira o código novamente.", Toast.LENGTH_SHORT).show();
                            } else {
                                Toast.makeText(getApplicationContext(), "Catraca não encontrada.", Toast.LENGTH_SHORT).show();
                                Toast.makeText(getApplicationContext(), "Por favor, conecte-se na mesma rede que a catraca.", Toast.LENGTH_SHORT).show();
                            }
                        }
                    }
                }, 3000);
        }
        else {

            Toast.makeText(getApplicationContext(), "Sem conexão com a catraca.", Toast.LENGTH_SHORT).show();

            if (mTcpClient != null) {
                mTcpClient.stopClient();
            }

            Toast.makeText(getApplicationContext(), "Procurando a catraca...", Toast.LENGTH_SHORT).show();

            new noru.ConnectTask().execute("");

            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    if(TcpClient.catracaAvailable) {
                        Toast.makeText(getApplicationContext(), "Aberto conexão.", Toast.LENGTH_SHORT).show();
                        Toast.makeText(getApplicationContext(), "Por favor, insira o código novamente.", Toast.LENGTH_SHORT).show();
                    }
                    else {
                        Toast.makeText(getApplicationContext(), "Catraca não encontrada.", Toast.LENGTH_SHORT).show();
                        Toast.makeText(getApplicationContext(), "Por favor, conecte-se na mesma rede que a catraca.", Toast.LENGTH_SHORT).show();
                    }
                }
            }, 2000);
        }

    }


    public class ConnectTask extends AsyncTask<String, String, TcpClient> {

        @Override
        protected TcpClient doInBackground(String... message) {

            //we create a TCPClient object
            mTcpClient = new TcpClient(new TcpClient.OnMessageReceived() {
                @Override
                //here the messageReceived method is implemented
                public void messageReceived(String message) {
                    //this method calls the onProgressUpdate
                    publishProgress(message);
                    //Toast.makeText(getApplicationContext(), message, Toast.LENGTH_SHORT).show();
                }
            });
            mTcpClient.run();

            return null;
        }

        @Override
        protected void onProgressUpdate(String... values) {
            super.onProgressUpdate(values);
            //response received from server
            Log.d("test", "response " + values[0]);
            //process server response here....
            serverResponse = values[0];

        }
    }

}
