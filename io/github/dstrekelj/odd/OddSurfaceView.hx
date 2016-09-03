package io.github.dstrekelj.odd;

import android.content.Context;
import android.content.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.os.Process;

import io.github.dstrekelj.odd.OddActivity;

import java.lang.Runnable;
import java.lang.Thread;
import java.util.concurrent.atomic.AtomicBoolean;

import odd.Framebuffer;
import odd.impl.FramebufferImpl;

class OddSurfaceView extends SurfaceView implements Runnable 
{
    var canvas : Canvas;
    var drawThread : Thread;
    var framebuffer : FramebufferImpl;
    var holder : SurfaceHolder;
    var isRunning : AtomicBoolean;
    var isDrawing : AtomicBoolean;
    var onUpdate : Void->Void;
    var onDraw : Framebuffer->Void;
    var paint : Paint;
    var rectSrc : Rect;
    var rectDest : Rect;

    public function new(context : Context) : Void
    {
        super(context);
        
        canvas = null;
        drawThread = null;
        framebuffer = null;
        holder = getHolder();
        isRunning = new AtomicBoolean(false);
        isDrawing = new AtomicBoolean(false);
        onDraw = null;
        onUpdate = null;
        paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        rectSrc = null;
        rectDest = new Rect(0, 0, OddActivity.instance.getWidth(), OddActivity.instance.getHeight());
    }

    public function setFramebuffer(framebuffer : FramebufferImpl) : Void
    {
        this.framebuffer = framebuffer;
        rectSrc = new Rect(0, 0, this.framebuffer.width, this.framebuffer.height);
    }

    public function setOnUpdate(callback : Void->Void) : Void
    {
        this.onUpdate = callback;
    }

    public function setOnDraw(callback : Framebuffer->Void) : Void
    {
        this.onDraw = callback;
    }

    public function resume() : Void
    {
        trace("OddSurfaceView.resume()");
        if (drawThread == null)
        {
            trace("Creating new thread");
            isRunning.set(true);
            isDrawing.set(true);
            drawThread = new Thread(this);
            Process.setThreadPriority(Process.THREAD_PRIORITY_URGENT_DISPLAY);
            drawThread.start();
        }
    }

    public function run() : Void
    {
        while (!isDrawing.get())
        {
            continue;
        }

        while (isRunning.get())
        {
            if (isDrawing.get() && holder.getSurface().isValid())
            {
                if (onUpdate != null) onUpdate();
                canvas = holder.lockCanvas();
                canvas.drawColor(0xff232323);
                if (onDraw != null && framebuffer != null)
                {
                    onDraw(framebuffer);
                    canvas.drawBitmap(framebuffer.data, rectSrc, rectDest, paint);
                } 
                holder.unlockCanvasAndPost(canvas);
            }
            else
            {
                continue;
            }
        }
    }

    public function pause() : Void
    {
        trace("OddSurfaceView.pause()");
        isRunning.set(false);
        isDrawing.set(false);

        if (drawThread != null)
        {
            var retry = true;
            while (retry)
            {
                try
                {
                    drawThread.join();
                    drawThread = null;
                    retry = false;
                    trace("Thread joined");
                }
                catch (e : java.lang.InterruptedException)
                {
                    trace(e.getMessage());
                }
            }
        }
    }
}