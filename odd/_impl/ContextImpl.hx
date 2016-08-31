package odd._impl;

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
        onUpdate();
        onDraw(framebuffer);
    }
}