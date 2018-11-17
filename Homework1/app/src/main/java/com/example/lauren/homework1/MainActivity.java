package com.example.lauren.homework1;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final EditText value1 = findViewById(R.id.value1); //value1 entry
        final EditText value2 = findViewById(R.id.value2); //value2 entry
        final Button add = findViewById(R.id.add); //+ button
        final Button subt = findViewById(R.id.subtract); //-button
        final Button mult = findViewById(R.id.multiply); //*button
        final Button div = findViewById(R.id.divide); //(/)button
        final TextView result = findViewById(R.id.result); //result display

        /*for each operation (add,subt,mult,div), calculate the result of
        val1 and val2 when the operation is clicked. Set result to appear
        in result TextView*/

        //add calculation
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String val1 = value1.getText().toString();
                String val2 = value2.getText().toString();
                int addres = Integer.parseInt(val1) + Integer.parseInt(val2);
                result.setText(String.valueOf(addres));
            }
        });

        //subtract calculation
        subt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String val1 = value1.getText().toString();
                String val2 = value2.getText().toString();

                int subres = Integer.parseInt(val1) - Integer.parseInt(val2);
                result.setText(String.valueOf(subres));
            }
        });

        //multiply calculation
        mult.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String val1 = value1.getText().toString();
                String val2 = value2.getText().toString();

                int multres = Integer.parseInt(val1) * Integer.parseInt(val2);
                result.setText(String.valueOf(multres));
            }
        });

        //division calculation
        //in division operator, use try catch to avoid illegal division by 0
        div.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String val1 = value1.getText().toString();
                String val2 = value2.getText().toString();

                try {
                    float divres = Integer.parseInt(val1) / Integer.parseInt(val2);
                    result.setText(String.valueOf(divres));
                } catch (ArithmeticException e) {
                    result.setText(R.string.errmsg);
                }
            }
        });

    }
}
