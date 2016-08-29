package android.graphics;

extern class Rect
{
    public var bottom : Int;
    public var left : Int;
    public var right : Int;
    public var top : Int;

    @:overload(function(left : Int, top : Int, right : Int, bottom : Int) : Void {})
    @:overload(function(r : Rect) : Void {})
    public function new() : Void;
    public function getWidth() : Int;
    public function getHeight() : Int;
    public function centerX() : Int;
    public function centerY() : Int;
    public function exactCenterX() : Float;
    public function exactCenterY() : Float;
    @:overload(function(src : Rect) : Void {})
    public function set(left : Int, top : Int, right : Int, bottom : Int) : Void;
}