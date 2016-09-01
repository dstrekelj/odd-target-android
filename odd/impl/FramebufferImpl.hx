package odd.impl;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;

import odd.Framebuffer;

class FramebufferImpl implements Framebuffer
{
    public var width(default, null) : Int;
    public var height(default, null) : Int;
    public var data(default, null) : Bitmap; 

    public function new(width : Int, height : Int) : Void
    {
        this.width = width;
        this.height = height;
        this.data = Bitmap.createBitmap(width, height, Config.ARGB_8888);
    }
    
    public function clear(rgb : Int) : Void
    {
        this.data.eraseColor(0xff000000 | rgb);
    }

    public function getPixel(x : Int, y : Int) : Int
    {
        if (isValidPoint(x, y))
        {
            return this.data.getPixel(x, y) & 0x00ffffff;
        }
        return -1;
    }

    public function getR(x : Int, y : Int) : Int
    {
        return 0;
    }

    public function getG(x : Int, y : Int) : Int
    {
        return 0;
    }

    public function getB(x : Int, y : Int) : Int
    {
        return 0;
    }
    
    public function setPixel(x : Int, y : Int, rgb : Int) : Void
    {
        if (isValidPoint(x, y))
        {
            this.data.setPixel(x, y, 0xff000000 | rgb);
        }
    }
    
    public function setR(x : Int, y : Int, r : Int) : Void
    {

    }
    
    public function setG(x : Int, y : Int, g : Int) : Void
    {

    }
    
    public function setB(x : Int, y : Int, b : Int) : Void
    {

    }

    function isValidPoint(x : Int, y : Int) : Bool
    {
        return x >= 0 && x < width && y >= 0 && y < height;
    }
}