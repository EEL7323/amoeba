package com.example.brunobrida.rueba;

import java.text.NumberFormat;
import java.io.*;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Toast;

/**
 * Created by bruno.brida on 07/05/2017.
 */

public class home extends MainActivity{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.home);

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
        NumberFormat format = NumberFormat.getCurrencyInstance();

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
                Toast.makeText(getApplicationContext(), "Seu saldo é de: " + format.format(Float.parseFloat(inputString)) + " reais.", Toast.LENGTH_SHORT).show();
                return true;
            case R.id.item_option2:
                Toast.makeText(getApplicationContext(), "Comprar créditos", Toast.LENGTH_SHORT).show();
                return true;
            default:
                return super.onOptionsItemSelected(menu);
        }
    }

}
