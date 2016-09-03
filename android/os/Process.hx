package android.os;

extern class Process
{
    public static var THREAD_PRIORITY_AUDIO : Int;
    public static var THREAD_PRIORITY_BACKGROUND : Int;
    public static var THREAD_PRIORITY_DEFAULT : Int;
    public static var THREAD_PRIORITY_DISPLAY : Int;
    public static var THREAD_PRIORITY_FOREGROUND : Int;
    public static var THREAD_PRIORITY_LESS_FAVORABLE : Int;
    public static var THREAD_PRIORITY_LOWEST : Int;
    public static var THREAD_PRIORITY_MORE_FAVORABLE : Int;
    public static var THREAD_PRIORITY_URGENT_AUDIO : Int;
    public static var THREAD_PRIORITY_URGENT_DISPLAY : Int;

    public static function setThreadPriority(priority : Int) : Void;
}