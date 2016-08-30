package odd.macros;

import haxe.macro.Context;
import haxe.macro.Expr;

class UtilMacro
{
    public static macro function getEntryPoint() : Expr
    {
        var args = Sys.args();
        var main = switch (args.indexOf("-main"))
        {
            case -1 : "";
            case id : args[id + 1];
        }
        return macro $v{main};
    }
}