package java.util.concurrent.atomic;

import java.io.Serializable;
import java.lang.Object;

extern class AtomicBoolean extends Object implements Serializable
{
    @:overload(function(initialValue : Bool) : Void {})
    public function new() : Void;
    public function get() : Bool;
    public function compareAndSet(expect : Bool, update : Bool) : Bool;
    public function weakCompareAndSet(expect : Bool, update : Bool) : Bool;
    public function set(newValue : Bool) : Void;
    public function lazySet(newValue : Bool) : Void;
    public function getAndSet(newValue : Bool) : Bool;
}