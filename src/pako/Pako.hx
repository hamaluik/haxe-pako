package pako;

import js.html.Uint8Array;
import pako.Deflate.DeflateOptions;
import pako.Inflate.InflateOptions;

@:native('pako')
extern class Pako {

	@:overload(function(data:Uint8Array, ?options:DeflateOptions):Uint8Array{})
	@:overload(function(data:Array<Int>, ?options:DeflateOptions):Array<Int>{})
	public static function deflate(data:String, ?options:DeflateOptions):String;

	@:overload(function(data:Uint8Array, ?options:DeflateOptions):Uint8Array{})
	@:overload(function(data:Array<Int>, ?options:DeflateOptions):Array<Int>{})
	public static function deflateRaw(data:String, ?options:DeflateOptions):String;

	@:overload(function(data:Uint8Array, ?options:DeflateOptions):Uint8Array{})
	@:overload(function(data:Array<Int>, ?options:DeflateOptions):Array<Int>{})
	public static function gzip(data:String, ?options:DeflateOptions):String;

	@:overload(function(data:Uint8Array, ?options:InflateOptions):Uint8Array{})
	@:overload(function(data:Array<Int>, ?options:InflateOptions):Array<Int>{})
	public static function inflate(data:String, ?options:InflateOptions):String;

	@:overload(function(data:Uint8Array, ?options:InflateOptions):Uint8Array{})
	@:overload(function(data:Array<Int>, ?options:InflateOptions):Array<Int>{})
	public static function inflateRaw(data:String, ?options:InflateOptions):String;

	@:overload(function(data:Uint8Array, ?options:InflateOptions):Uint8Array{})
	@:overload(function(data:Array<Int>, ?options:InflateOptions):Array<Int>{})
	public static function ungzip(data:String, ?options:InflateOptions):String;
}