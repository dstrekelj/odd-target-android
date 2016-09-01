package odd.impl;

import io.github.dstrekelj.odd.OddActivity;

import odd.impl.FramebufferImpl;

@:allow(odd.Context)
class ContextImpl
{
    var framebuffer : FramebufferImpl;

    function new(width : Int, height : Int) : Void
    {
        trace("-- odd-target-android --");

        framebuffer = new FramebufferImpl(width, height);
    }

    function run(onUpdate : Void->Void, onDraw : Framebuffer->Void) : Void
    {
        OddActivity.osvContext.setFramebuffer(framebuffer);
        OddActivity.osvContext.setOnUpdate(onUpdate);
        OddActivity.osvContext.setOnDraw(onDraw);
    }
}