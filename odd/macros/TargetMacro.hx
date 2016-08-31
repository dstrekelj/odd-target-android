package odd.macros;

import haxe.io.Input;
import haxe.macro.Compiler;
import haxe.macro.Expr;
import sys.FileSystem;
import sys.io.File;
import sys.io.Process;

class TargetMacro
{
    static inline var DATA : String = "data";

    public static macro function init() : Expr
    {
        var from = asDirectoryPath(getLibPath() + DATA);
        var to = asDirectoryPath(FileSystem.fullPath(Compiler.getOutput()));
        Sys.println("Initialising odd-target-android project");
        
        Sys.println("Copying project template");
        copyProjectTemplate(asDirectoryPath(getLibPath() + DATA), asDirectoryPath(FileSystem.fullPath(Compiler.getOutput())));

        Sys.println("Generating sources");
        /*
        if (FileSystem.exists(to + "/src"))
        {
            Sys.println("... Sources exist! Purging and regenerating");
            purgeDirectory(to + "/src");
        }
        */

        Compiler.include("io", true, [], [asDirectoryPath(getLibPath())], true);

        Sys.println("Done");
        
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
                Sys.println("... Path exists! Skipping " + destPath);
                continue;
            }

            if (FileSystem.isDirectory(sourcePath))
            {
                if (!FileSystem.exists(destPath))
                {
                    FileSystem.createDirectory(destPath);
                    copyProjectTemplate(asDirectoryPath(sourcePath), asDirectoryPath(destPath + "/"));
                }
            }
            else
            {
                File.copy(sourcePath, destPath);
            }
        }
    }

    static function getLibPath() : String
    {
        var haxelib = new Process("haxelib", ["path", "odd-target-android"]);
        var haxelibOut : haxe.io.Input = haxelib.stdout;
        
        var line : String;

        try
        {
            while ((line = haxelibOut.readLine()) != "")
            {
                if (~/odd-target-android/gi.match(line)) break;
            }
        }
        catch(e : haxe.io.Eof)
        {
            Sys.println("... Could not find library odd-target-android");
            line = null;
        }
        
        haxelibOut.close();
        haxelib.kill();

        return line;
    }

    static function purgeDirectory(path : String) : Void
    {
        if (FileSystem.exists(path) && FileSystem.isDirectory(path))
        {
            var items : Array<String> = FileSystem.readDirectory(path);
            for (i in items)
            {
                var ip = path + "/" + i;
                if (FileSystem.isDirectory(ip))
                {
                    purgeDirectory(ip);
                    FileSystem.deleteDirectory(ip);
                }
                else
                {
                    FileSystem.deleteFile(ip);
                }
            }
        }
    }

    static function asDirectoryPath(path : String) : String
    {
        var newPath = new StringBuf();
        var foundSlash = false; 
        
        for (i in 0...path.length)
        {
            var char = path.charAt(i);
            
            if (char == "/" || char == "\\")
            {
                if (foundSlash) continue;
                foundSlash = true;
            }
            else
            {
                foundSlash = false;
            }
            
            newPath.add(char);
        }

        if (!(StringTools.endsWith(path, "/") || StringTools.endsWith(path, "\\")))
        {
            newPath.add("/");
        }

        return newPath.toString();
    }
}