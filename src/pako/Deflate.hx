package pako;

import js.html.Uint8Array;
import js.html.ArrayBuffer;

typedef GZIPHeader = {
	@:optional var text:Bool;
	@:optional var time:Int;
	@:optional var os:Int;
	@:optional var extra:Array<Int>;
	@:optional var name:String;
	@:optional var comment:String;
	@:optional var hcrc:Bool;
}

typedef DeflateOptions = {
	@:optional var level:Int;
	@:optional var windowBits:Int;
	@:optional var memLevel:Int;
	@:optional var strategy:Int;
	@:optional var chunkSize:Int;
	@:optional var raw:Bool;
	@:optional var gzip:Bool;
	@:optional var to:String;
	@:optional var header:GZIPHeader;
}

@:native('pako.Deflate')
extern class Deflate {
	public function new(?options:DeflateOptions);

	public var err(default, null):Int;
	public var msg(default, null):String;
	@:overload(var result:Array<Int>)
	public var result:Uint8Array;

	@:overload(function(chunk:Uint8Array):Void{})
	@:overload(function(chunk:Array<Int>):Void{})
	public function onData(chunk:String):Void;

	public function onEnd(status:Int):Void;

	@:overload(function(data:Uint8Array):Bool{})
	@:overload(function(data:Array<Int>):Bool{})
	@:overload(function(data:ArrayBuffer):Bool{})
	public function push(data:String, ?mode:Int):Bool;
}