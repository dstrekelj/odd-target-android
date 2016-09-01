package android.content;

import android.util.DisplayMetrics;

extern class Resources
{
    public static function getSystem() : Resources;
    
    public function getDisplayMetrics() : DisplayMetrics;
}