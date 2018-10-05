package lbe4.cs262.calvin.edu.lab05;

import android.content.Context;
import android.net.Network;
import android.support.annotation.NonNull;
import android.support.v4.content.AsyncTaskLoader;

public class BookLoader extends AsyncTaskLoader {

    private String mQueryString;

    @Override
    protected void onStartLoading() {
        forceLoad();
    }

    public BookLoader(@NonNull Context context, String QueryString) {
        super(context);
        mQueryString = QueryString;
    }

    @Override
    public String loadInBackground() {
        return NetworkUtils.getBookInfo(mQueryString);
    }

}
