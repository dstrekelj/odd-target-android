package android.view;

import android.view.View;

extern class SurfaceView extends View
{
    public function new(context : Context) : Void;
    public function getHolder() : SurfaceHolder;
    public function draw(canvas : Canvas) : Void;
}