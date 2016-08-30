package io.github.dstrekelj.odd;

import android.app.Activity;
import android.os.Bundle;

@:keep
class OddActivity extends Activity
{
    override public function onCreate(savedInstanceState : Bundle) : Void
    {
        super.onCreate(savedInstanceState);
        
        var mainClass = Type.resolveClass(odd.macros.UtilMacro.getEntryPoint());
        Reflect.callMethod(mainClass, Reflect.field(mainClass, "main"), []);
    }
}