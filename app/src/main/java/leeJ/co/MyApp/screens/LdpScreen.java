package leeJ.co.MyApp.screens;

import androidx.annotation.NonNull;

import android.content.Context;
import android.os.Bundle;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class LdpScreen extends FlutterActivity {

    private static final String TAG = LdpScreen.class.getSimpleName();
    private static final String CHANNEL = "myapp.ldp/request";


    @Override
    public FlutterEngine provideFlutterEngine(Context context) {
        Log.d(TAG, "provideFlutterEngine: ");
        return FlutterEngineCache.getInstance().get("my_engine_id");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Log.d(TAG, "onCreate: ");
        super.onCreate(savedInstanceState);
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        Log.d(TAG, "configureFlutterEngine: ");
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL).setMethodCallHandler(
                ((call, result) -> {
                    if (call.method.equals("getUsername")) {
                        String username = "placeholder for username";
                        result.success(username);
                    } else {
                        result.notImplemented();
                    }
                })
        );

    }
}
