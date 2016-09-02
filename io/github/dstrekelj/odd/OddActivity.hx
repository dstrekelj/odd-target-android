package io.github.dstrekelj.odd;

import android.app.Activity;
import android.os.Bundle;
import android.util.DisplayMetrics;

import io.github.dstrekelj.odd.OddSurfaceView;

class OddActivity extends Activity
{
    public static var instance : OddActivity;
    
    public var osvContext : OddSurfaceView;

    public function getWidth() : Int
    {
        var displayMetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        return displayMetrics.widthPixels;
    }
    
    public function getHeight() : Int
    {
        var displayMetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        return displayMetrics.heightPixels;
    }

    override public function onCreate(savedInstanceState : Bundle) : Void
    {
        super.onCreate(savedInstanceState);

        if (instance == null) instance = this;

        osvContext = new OddSurfaceView(this);
        setContentView(osvContext);
        
        var mainClass = Type.resolveClass(odd.tools.macros.Utils.getEntryPoint());
        Reflect.callMethod(mainClass, Reflect.field(mainClass, "main"), []);
    }

    override function onResume() : Void
    {
        super.onResume();
        osvContext.resume();
    }

    override function onPause() : Void
    {
        super.onPause();
        osvContext.pause();
    }
}