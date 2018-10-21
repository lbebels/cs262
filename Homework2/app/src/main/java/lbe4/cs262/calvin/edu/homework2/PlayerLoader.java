package lbe4.cs262.calvin.edu.homework2;

import android.app.DownloadManager;
import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.AsyncTaskLoader;

public class PlayerLoader extends AsyncTaskLoader {

    private String mQueryString;

    @Override
    protected void onStartLoading() {
        super.onStartLoading();
        forceLoad();
    }

    public PlayerLoader(@NonNull Context context, String QueryString) {
        super(context);
        mQueryString = QueryString;
    }

    @Override
    public String loadInBackground() {
        return NetworkUtils.getPlayerInfo(mQueryString);
    }
}
