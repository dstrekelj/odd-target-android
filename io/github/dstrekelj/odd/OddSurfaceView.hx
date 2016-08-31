package io.github.dstrekelj.odd;

import android.content.Context;
import android.graphics.Canvas;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

import java.lang.Runnable;
import java.util.concurrent.atomic.AtomicBoolean;
import java.lang.Thread;

class OddSurfaceView extends SurfaceView implements Runnable 
{
    var canvas : Canvas;
    var drawThread : Thread;
    var holder : SurfaceHolder;
    var isRunning : AtomicBoolean;
    var isDrawing : AtomicBoolean;

    public function new(context : Context) : Void
    {
        super(context);
        
        canvas = null;
        drawThread = null;
        holder = getHolder();
        isRunning = new AtomicBoolean(false);
        isDrawing = new AtomicBoolean(false);
    }

    public function resume() : Void
    {
        trace("OddSurfaceView.resume()");
        if (drawThread == null)
        {
            isRunning.set(true);
            drawThread = new Thread(this);
            drawThread.start();
            isDrawing.set(true);
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
                // TODO: update
                canvas = holder.lockCanvas();
                canvas.drawRGB(0xff, 0x00, 0x00);
                // TODO: draw
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
                }
                catch (e : java.lang.InterruptedException)
                {
                    trace(e.getMessage());
                }
            }
        }
    }
}