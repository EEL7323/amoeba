package com.example.brunobrida.rueba;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import android.os.AsyncTask;
import android.util.Log;

import org.json.JSONObject;

/**
 * Created by bruno.brida on 07/05/2017.
 */

public class home extends MainActivity{

    Context ctx = this;
    String serverResponse = "";
    String creditos = "";
    TcpClient mTcpClient;
    String connected_users;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.home);

        TextView textView = (TextView) findViewById(R.id.welcome_entrar);
        textView.setText("Bem-vindo, " + nome + "!");

        String filename = "creditos";
        String outputString = "0";
        FileOutputStream outputStream;
        File file = this.getFileStreamPath(filename);

        if(file == null || !file.exists()) {
            try {
                outputStream = openFileOutput(filename, this.MODE_PRIVATE);
                outputStream.write(outputString.getBytes());
                outputStream.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        try {
            URL url = new URL("http://rueba.site/api/numeroUsuariosNoRestaurante");
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setDoInput(true);
            urlConnection.setRequestMethod("GET");
            urlConnection.setRequestProperty("Authorization", "Bearer " + token);
            InputStream is = urlConnection.getInputStream();
            while ((tmp = is.read()) != -1) {
                data += (char) tmp;
            }
            is.close();
            urlConnection.disconnect();
        } catch (Exception e) {
            Toast.makeText(getApplicationContext(), "Exception: " + e.getMessage(), Toast.LENGTH_SHORT).show();
        }

        try {
            JSONObject jObject = new JSONObject(data);
            connected_users = jObject.getString("numUsuarios");
        } catch(Exception e) {
            Toast.makeText(getApplicationContext(), "Exception: " + e.getMessage(), Toast.LENGTH_SHORT).show();
        }

        TextView textView2 = (TextView) findViewById(R.id.connected_users);
        textView2.setText("Há " + connected_users + " pessoas no RU nesse momento.");

        new ConnectTask().execute("");

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
                Intent i = new Intent(home.this, comprar.class);
                startActivity(i);
                return true;
            case R.id.item_option3:
                Intent intent = new Intent(Intent.ACTION_MAIN);
                intent.addCategory(Intent.CATEGORY_HOME);
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            default:
                return super.onOptionsItemSelected(menu);
        }
    }

    public void onClickEntrar(View v){

        if(TcpClient.catracaAvailable) {
            EditText entry_code = (EditText) findViewById(R.id.entry_code);
            String codin = entry_code.getText().toString();

            final String filename = "creditos";
            String inputString = "";
            FileInputStream inputStream;

            try {
                inputStream = openFileInput(filename);
                byte[] input = new byte[inputStream.available()];
                inputString = "";
                while (inputStream.read(input) != -1) {
                }
                inputString += new String(input);
                inputStream.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            creditos = inputString;

            if (Integer.parseInt(creditos) <= 0)
                Toast.makeText(getApplicationContext(), "Seu saldo é insuficiente para entrar no RU.", Toast.LENGTH_SHORT).show();
            else {
                if (mTcpClient != null) {

                    mTcpClient.sendMessage("1&" + codin + "&" + matricula + "&" + creditos);
                }

                Toast.makeText(getApplicationContext(), "Processando...", Toast.LENGTH_SHORT).show();

                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {

                        FileOutputStream outputStream;

                        if (!serverResponse.equals("")) {
                            if (Integer.parseInt(serverResponse) == 1) {
                                Toast.makeText(getApplicationContext(), "Entrada liberada!", Toast.LENGTH_SHORT).show();
                                serverResponse = "";
                                if (mTcpClient != null) {
                                    mTcpClient.stopClient();
                                }

                                tmp = Integer.parseInt(creditos) - 1;

                                try {
                                    File file = ctx.getFileStreamPath(filename);
                                    file.delete();
                                    outputStream = openFileOutput(filename, ctx.MODE_PRIVATE);
                                    outputStream.write(Integer.toString(tmp).getBytes());
                                    outputStream.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                Toast.makeText(getApplicationContext(), "Seu saldo atual é de: " + tmp + " passe(s).", Toast.LENGTH_SHORT).show();
                                Intent i = new Intent(home.this, noru.class);
                                startActivity(i);
                            } else {
                                Toast.makeText(getApplicationContext(), "Captcha inválido. Tente novamente.", Toast.LENGTH_SHORT).show();
                                serverResponse = "";

                                if (mTcpClient != null) {
                                    mTcpClient.stopClient();
                                }

                                new ConnectTask().execute("");

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

                            new ConnectTask().execute("");

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
        }
        else {

            Toast.makeText(getApplicationContext(), "Sem conexão com a catraca.", Toast.LENGTH_SHORT).show();

            if (mTcpClient != null) {
                mTcpClient.stopClient();
            }

            Toast.makeText(getApplicationContext(), "Procurando a catraca...", Toast.LENGTH_SHORT).show();

            new ConnectTask().execute("");

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
