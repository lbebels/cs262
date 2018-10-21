package lbe4.cs262.calvin.edu.homework2;

import android.os.AsyncTask;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

public class FetchPlayer extends AsyncTask<String,Void,String> {
    private TextView mPlayerText;

    public FetchPlayer(TextView mPlayerText) {
        this.mPlayerText = mPlayerText;
    }

    @Override
    protected String doInBackground(String... strings) {
        return NetworkUtils.getPlayerInfo(strings[0]);
    }

    @Override
    protected void onPostExecute(String s) {
        super.onPostExecute(s);
        try {
            JSONObject jsonObject = new JSONObject(s);
            JSONArray itemsArray = jsonObject.getJSONArray("items");

            for(int i = 0; i < itemsArray.length(); i++) {
                JSONObject player = itemsArray.getJSONObject(i);
                String emailAddress = "no email";
                String name = "no name";

                try {
                    emailAddress = player.getString("emailAddress");
                    name = player.getString("name");
                }
                catch(Exception e) {
                    e.printStackTrace();
                }

                String entry = i +  ", " + name + ", " + emailAddress;
                mPlayerText.setText(entry);
                return;
            }
            mPlayerText.setText("No results found");
        }
        catch (Exception e) {
            mPlayerText.setText("No results found");
            e.printStackTrace();
        }
    }
}
