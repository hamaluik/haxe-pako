package pako;

#if haxe4
import js.lib.Uint8Array;
import js.lib.ArrayBuffer;
#else
import js.html.Uint8Array;
import js.html.ArrayBuffer;
#end
import pako.Deflate.DeflateOptions;
import pako.Inflate.InflateOptions;
import haxe.extern.EitherType;

typedef Dictionary = EitherType<Uint8Array, EitherType<ArrayBuffer, String>>;

@:native('pako')
extern class Pako {

	static public var Z_BEST_COMPRESSION:Int;
	static public var Z_BEST_SPEED:Int;
	static public var Z_BINARY:Int;
	static public var Z_BLOCK:Int;
	static public var Z_BUF_ERROR:Int;
	static public var Z_DATA_ERROR:Int;
	static public var Z_DEFAULT_COMPRESSION:Int;
	static public var Z_DEFAULT_STRATEGY:Int;
	static public var Z_DEFLATED:Int;
	static public var Z_ERRNO:Int;
	static public var Z_FILTERED:Int;
	static public var Z_FINISH:Int;
	static public var Z_FIXED:Int;
	static public var Z_FULL_FLUSH:Int;
	static public var Z_HUFFMAN_ONLY:Int;
	static public var Z_NEED_DICT:Int;
	static public var Z_NO_COMPRESSION:Int;
	static public var Z_NO_FLUSH:Int;
	static public var Z_OK:Int;
	static public var Z_PARTIAL_FLUSH:Int;
	static public var Z_RLE:Int;
	static public var Z_STREAM_END:Int;
	static public var Z_STREAM_ERROR:Int;
	static public var Z_SYNC_FLUSH:Int;
	static public var Z_TEXT:Int;
	static public var Z_TREES:Int;
	static public var Z_UNKNOWN:Int;

	/**
		Compress `data` with deflate algorithm and `options`.

		Supported options are: `level`, `windowBits`, `memLevel`, `strategy`, `dictionary`
		@see http://zlib.net/manual.html#Advanced

		Sugar (options):
			`raw` (Boolean) - say that we work with raw stream, if you don't wish to specify negative windowBits implicitly.
			`to` (String) - if equal to 'string', then result will be "binary string" (each char code [0..255])
	**/
	@:overload(function(data:Uint8Array, ?options:DeflateOptions):Uint8Array{})
	@:overload(function(data:Array<Int>, ?options:DeflateOptions):Array<Int>{})
	public static function deflate(data:String, ?options:DeflateOptions):String;

	/**
		The same as `deflate`, but creates raw data, without wrapper (header and adler32 crc).
	**/
	@:overload(function(data:Uint8Array, ?options:DeflateOptions):Uint8Array{})
	@:overload(function(data:Array<Int>, ?options:DeflateOptions):Array<Int>{})
	public static function deflateRaw(data:String, ?options:DeflateOptions):String;

	/**
		The same as `deflate`, but create gzip wrapper instead of deflate one.
	**/
	@:overload(function(data:Uint8Array, ?options:DeflateOptions):Uint8Array{})
	@:overload(function(data:Array<Int>, ?options:DeflateOptions):Array<Int>{})
	public static function gzip(data:String, ?options:DeflateOptions):String;

	/**
		Decompress `data` with inflate/ungzip and `options`.
		Autodetect format via wrapper header by default. That's why we don't provide separate ungzip method.

		Supported options are: `windowBits`
		@see http://zlib.net/manual.html#Advanced

		Sugar (options):
			`raw` (Boolean) - say that we work with raw stream, if you don't wish to specify negative windowBits implicitly.
			`to` (String) - if equal to 'string', then result will be converted from utf8 to utf16 (javascript) string.
							When string output requested, chunk length can differ from chunkSize, depending on content.
	**/
	@:overload(function(data:Uint8Array, ?options:InflateOptions):Uint8Array{})
	@:overload(function(data:Array<Int>, ?options:InflateOptions):Array<Int>{})
	public static function inflate(data:String, ?options:InflateOptions):String;

	/**
		The same as `inflate`, but creates raw data, without wrapper (header and adler32 crc).
	**/
	@:overload(function(data:Uint8Array, ?options:InflateOptions):Uint8Array{})
	@:overload(function(data:Array<Int>, ?options:InflateOptions):Array<Int>{})
	public static function inflateRaw(data:String, ?options:InflateOptions):String;

	/**
		Just shortcut to `inflate`, because it autodetects format by header.content. Done for convenience.
	**/
	@:overload(function(data:Uint8Array, ?options:InflateOptions):Uint8Array{})
	@:overload(function(data:Array<Int>, ?options:InflateOptions):Array<Int>{})
	public static function ungzip(data:String, ?options:InflateOptions):String;
}