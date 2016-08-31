package io.github.dstrekelj.odd;

import android.app.Activity;
import android.os.Bundle;

import io.github.dstrekelj.odd.OddSurfaceView;

class OddActivity extends Activity
{
    public static var osvContext : OddSurfaceView;

    override public function onCreate(savedInstanceState : Bundle) : Void
    {
        super.onCreate(savedInstanceState);

        osvContext = new OddSurfaceView(this);
        setContentView(osvContext);
        
        var mainClass = Type.resolveClass(odd.macros.UtilMacro.getEntryPoint());
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