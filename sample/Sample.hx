import pako.Pako;
import js.html.Uint8Array;

class Sample {
	static public function main() {
		var arr:Array<Int> = new Array<Int>();
		for(i in 0...100) {
			arr.push(0);
		}
		arr[5] = 5;
		arr[20] = 20;

		var input:Uint8Array = new Uint8Array(arr);
		js.Browser.document.write('<p>Input: <pre><code>[' + input + ']</code></pre></p>');

		var deflated:Uint8Array = Pako.deflate(input);
		js.Browser.document.write('<p>Deflated: <pre><code>[' + deflated + ']</code></pre></p>');

		var inflated:Uint8Array = Pako.inflate(deflated);
		js.Browser.document.write('<p>Inflated: <pre><code>[' + inflated + ']</code></pre></p>');
	}
}