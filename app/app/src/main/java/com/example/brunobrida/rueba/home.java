package com.example.brunobrida.rueba;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;

/**
 * Created by bruno.brida on 07/05/2017.
 */

public class home extends MainActivity{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.home);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu){
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

}
