package android.view;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.view.Surface;

extern interface SurfaceHolder
{
    function addCallback(var1 : Callback) : Void;
    function removeCallback(var1 : Callback) : Void;
    function isCreating() : Bool;
    function setKeepScreenOn(var1 : Bool) : Void;
    @:overload(function(var1 : Rect) : Canvas {})
    function lockCanvas() : Canvas;
    function unlockCanvasAndPost(var1 : Canvas) : Void;
    function getSurface() : Surface;
}

@:native("android.view.SurfaceHolder.Callback")
extern interface Callback
{
    function surfaceCreated(var1 : SurfaceHolder) : Void;
    function surfaceChanged(var1 : SurfaceHolder, var2 : Int, var3 : Int, var4 : Int) : Void;
    function surfaceDestroyed(var1 : SurfaceHolder) : Void;
}

@:native("android.view.SurfaceHolder.Callback2")
extern interface Callback2 extends Callback
{
    function surfaceRedrawNeeded(var1 : SurfaceHolder) : Void;
}