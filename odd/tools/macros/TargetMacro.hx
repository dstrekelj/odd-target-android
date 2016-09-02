package odd.tools.macros;

import haxe.io.Input;
import haxe.macro.Compiler;
import haxe.macro.Expr;

import odd.tools.SysUtils;
import odd.tools.macros.Utils;

import sys.io.File;
import sys.io.Process;
import sys.FileSystem;

class TargetMacro
{
    static inline var TEMPLATE_DIR : String = "template";

    public static macro function init() : Expr
    {
        if (Compiler.getDefine("display"))
        {
            return null;
        }

        Sys.println("Initialising Odd Android project.");

        var from = SysUtils.trimDirectoryPath(SysUtils.getHaxelibPath("odd-target-android") + TEMPLATE_DIR);
        var to = SysUtils.trimDirectoryPath(Utils.getOutputPath());
        
        Sys.println("Copying project template.");
        copyProjectTemplate(from, to);

        Sys.println("Generating sources.");
        /*
        if (FileSystem.exists(to + "/src"))
        {
            Sys.println("... Sources exist! Purging and regenerating");
            purgeDirectory(to + "/src");
        }
        */
        Compiler.include("io", true, [], [SysUtils.trimDirectoryPath(SysUtils.getHaxelibPath("odd-target-android"))], true);

        Sys.println("Done.");
        
        return null;
    }

    static function copyProjectTemplate(from : String, to : String) : Void
    {
        var contents : Array<String> = FileSystem.readDirectory(from);
        
        for (item in contents)
        {
            var sourcePath : String = from + "/" + item;
            var destPath : String = to + item;

            if (FileSystem.exists(destPath))
            {
                Sys.println("...Path exists! Skipping. " + destPath);
                continue;
            }

            if (FileSystem.isDirectory(sourcePath))
            {
                if (!FileSystem.exists(destPath))
                {
                    FileSystem.createDirectory(destPath);
                    copyProjectTemplate(SysUtils.trimDirectoryPath(sourcePath), SysUtils.trimDirectoryPath(destPath + "/"));
                }
            }
            else
            {
                File.copy(sourcePath, destPath);
            }
        }
    }
}