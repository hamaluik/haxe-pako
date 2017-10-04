package pako;

import js.html.Uint8Array;
import js.html.ArrayBuffer;

typedef InflateOptions = {
	@:optional var windowBits:Int;
	@:optional var chunkSize:Int;
	@:optional var raw:Bool;
	@:optional var to:String;
}

@:native('pako.Inflate')
extern class Inflate {
	public function new(?options:InflateOptions);

	public var err(default, null):Int;
	public var msg(default, null):String;
	@:overload(var result:Array<Int>)
	@:overload(var result:Uint8Array)
	public var result:String;

	@:overload(function(chunk:Uint8Array):Void{})
	@:overload(function(chunk:Array<Int>):Void{})
	public function onData(chunk:String):Void;

	public function onEnd(status:Int):Void;

	@:overload(function(data:Uint8Array):Bool{})
	@:overload(function(data:Array<Int>):Bool{})
	@:overload(function(data:ArrayBuffer):Bool{})
	public function push(data:String, ?mode:Int):Bool;
}