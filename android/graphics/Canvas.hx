package android.graphics;

import android.graphics.Bitmap;

extern class Canvas
{
    public static var ALL_SAVE_FLAG : Int;
    public static var CLIP_SAVE_FLAG : Int;
    public static var CLIP_TO_LAYER_SAVE_FLAG : Int;
    public static var FULL_COLOR_LAYER_SAVE_FLAG : Int;
    public static var HAS_ALPHA_LAYER_SAVE_FLAG : Int;
    public static var MATRIX_SAVE_FLAG : Int; 

    @:overload(function(bitmap : Bitmap) : Void {})
    public function new() : Void;
    public function isHardwareAccelerated() : Bool;    
    public function setBitmap(bitmap : Bitmap) : Void;
    public function isOpaque() : Bool;    
    public function getWidth() : Int;    
    public function getHeight() : Int;
    @:overload(function(saveFlags : Int) : Int {})
    public function save() : Int;
    public function drawRGB(r : Int, g : Int, b : Int) : Void;
    public function drawARGB(a : Int, r : Int, g : Int, b : Int) : Void;
    public function drawColor(color : Int) : Void;
    public function drawPaint(paint : Paint) : Void;    
    @:overload(function(bitmap : Bitmap, src : Rect, dst : Rect, paint : Paint) : Void {})
    public function drawBitmap(bitmap : Bitmap, left : Float, top : Float, paint : Paint) : Void;
}