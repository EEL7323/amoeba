package com.example.brunobrida.rueba;

import android.os.StrictMode;
import java.net.URL;
import java.net.HttpURLConnection;
import java.io.InputStream;
import java.io.OutputStream;
import android.widget.Toast;
import org.json.JSONObject;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    String data="";
    String status = "";
    public static String matricula = "";
    public static String tipo_usuario = "";
    public static String token = "";
    public static String nome = "";
    int tmp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        setContentView(R.layout.activity_main);
    }

    public void onButtonClick(View v){

        try {
            EditText ID = (EditText) findViewById(R.id.ID);
            String user = ID.getText().toString();
            EditText passwd = (EditText) findViewById(R.id.password);
            String password = passwd.getText().toString();

            URL url = new URL("http://rueba.site/api/token");
            String urlParams = "matricula=" + user + "&senha=" + password;

            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setDoOutput(true);
            OutputStream os = urlConnection.getOutputStream();
            os.write(urlParams.getBytes());
            os.flush();
            os.close();
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
            status = jObject.getString("status");
            matricula = jObject.getString("matricula");
            tipo_usuario = jObject.getString("tipo_usuario");
            token = jObject.getString("token");
            nome = jObject.getString("nome");
        } catch(Exception e) {
            Toast.makeText(getApplicationContext(), "Exception: " + e.getMessage(), Toast.LENGTH_SHORT).show();
        }

        if(status.equals("OK")){
            Intent i = new Intent(MainActivity.this, home.class);
            startActivity(i);
            Toast.makeText(getApplicationContext(), "Login OK!", Toast.LENGTH_SHORT).show();
        }
        else
            Toast.makeText(getApplicationContext(), "Matrícula ou Senha inválida(s).", Toast.LENGTH_SHORT).show();

        data = "";
        status = "";

    }

}