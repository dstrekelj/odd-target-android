package android.graphics;

import android.graphics.Canvas;

extern class Bitmap
{
    public static function createBitmap(width : Int, height : Int, config : BitmapConfig) : Bitmap;
    
    public function getWidth() : Int;
    public function getHeight() : Int;
    public function getScaledWidth(canvas : Canvas) : Int;
    public function getScaledHeight(canvas : Canvas) : Int;
    public function getPixel(x : Int, y : Int) : Void;
    public function getPixels(pixels : java.NativeArray<Int>, offset : Int, stride : Int, x : Int, y : Int, width : Int, height : Int) : Void;
    public function setPixel(x : Int, y : Int, color : Int) : Void;
    public function setPixels(pixels : java.NativeArray<Int>, offset : Int, stride : Int, x : Int, y : Int, width : Int, height : Int) : Void;
}

extern enum BitmapConfig
{
    ALPHA_8;
    ARGB_4444;
    ARGB_8888;
    RGB_565;
}