package android.graphics;

extern class Paint
{
    public static var ANTI_ALIAS_FLAG : Int;
    public static var DITHER_FLAG : Int;
    public static var EMBEDDED_BITMAP_TEXT_FLAG : Int;
    public static var FILTER_BITMAP_FLAG : Int;

    @:overload(function(flags : Int) : Void {})
    @:overload(function(paint : Paint) : Void {})
    public function new() : Void;
    public function reset() : Void;
    public function set(src : Paint) : Void;
    public function getFlags() : Int;
    public function setFlags(flags : Int) : Void;
    public function isAntiAlias() : Bool;
    public function setAntiAlias(aa : Bool) : Void;
    public function isDither() : Bool;
    public function setDither(dither : Bool) : Void;
    public function isFilterBitmap() : Bool;
    public function setFilterBitmap(filter : Bool) : Void;
    public function getColor() : Int;
    public function setColor(color : Int) : Void;
    public function getAlpha() : Int;
    public function setAlpha(a : Int) : Void;
    public function setARGB(a : Int, r : Int, g : Int, b : Int) : Void;
}