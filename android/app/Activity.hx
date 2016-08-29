package android.app;

import android.content.Context;
import android.os.Bundle;
import android.view.View;

extern class Activity extends Context
{
    public function new() : Void;
    public function onCreate(savedInstanceState : Bundle) : Void;
    public function getApplicationContext() : Context;
    
    function finish() : Void;
    function onDestroy() : Void;
    function onPause() : Void;
    function onRestart() : Void;
    function onResume() : Void;
    function onStart() : Void;
    function onStop() : Void;
    function setContentView(view : View) : Void;
}