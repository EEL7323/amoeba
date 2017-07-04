package com.example.brunobrida.rueba;

import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import org.json.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.NumberFormat;

/**
 * Created by bruno.brida on 28/06/2017.
 */

public class comprar extends MainActivity {

    String passe = "";
    String data = "";
    int tmp;
    String authorized_credits = "";
    String filename = "creditos";
    String inputString = "";
    FileInputStream inputStream;
    FileOutputStream outputStream;
    NumberFormat format = NumberFormat.getCurrencyInstance();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        setContentView(R.layout.comprar);

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

        TextView textView1 = (TextView) findViewById(R.id.saldo);
        textView1.setText("Seu saldo é de: " + inputString + " passe(s).");

        switch(tipo_usuario){
            case "aluno":
                passe = "1.50";
                break;
            case "professor":
                passe = "2.90";
                break;
            case "servidor":
                passe = "2.90";
                break;
            default:
                passe = "5.60";
                break;
        }
        TextView textView2 = (TextView) findViewById(R.id.passe);
        textView2.setText(format.format(Float.parseFloat(passe)));

    }

    public void onClickComprar(View v){

            EditText credito = (EditText) findViewById(R.id.credito);
            String credit = credito.getText().toString();

        try {
            URL url = new URL("http://rueba.site/api/addPassesUsuarioSmartphone/"+credit);
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
            authorized_credits = jObject.getString("authorized_credits");
        } catch(Exception e) {
            Toast.makeText(getApplicationContext(), "Exception: " + e.getMessage(), Toast.LENGTH_SHORT).show();
        }

        Toast.makeText(getApplicationContext(), "Créditos adicionados com sucesso!", Toast.LENGTH_SHORT).show();
        Toast.makeText(getApplicationContext(), "Sua compra foi de: " + format.format(Float.parseFloat(authorized_credits)*Float.parseFloat(passe)) + ".", Toast.LENGTH_SHORT).show();

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

        tmp = Integer.parseInt(inputString) + Integer.parseInt(authorized_credits);

        try {
            File file = this.getFileStreamPath(filename);
            file.delete();
            outputStream = openFileOutput(filename, this.MODE_PRIVATE);
            outputStream.write(Integer.toString(tmp).getBytes());
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        TextView textView1 = (TextView) findViewById(R.id.saldo);
        textView1.setText("Seu saldo é de: " + tmp + " passes.");

        Toast.makeText(getApplicationContext(), "Seu saldo é de: " + tmp + " passe(s).", Toast.LENGTH_SHORT).show();

    }

}