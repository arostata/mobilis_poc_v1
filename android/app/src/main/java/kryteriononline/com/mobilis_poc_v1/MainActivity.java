package kryteriononline.com.mobilis_poc_v1;

import android.os.Bundle;
import android.view.WindowManager;
import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        /* Prevent taking screenshot and screen recording. */
        //getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);

        /* Hide overlay windows such as Chat heads, etc. This is only compatible starting Androi 12, Level 31. */
        getWindow().setHideOverlayWindows(true);
    }
}
