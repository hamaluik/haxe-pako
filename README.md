# haxe-pako
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/hamaluik/haxe-pako/blob/master/LICENSE)

Haxe externs for the [pako][1] library.

**NOTE**: You must import the [pako][1] library into your HTML file for this to work. In case the source ever goes offline, a copy can be found here: https://github.com/hamaluik/haxe-pako/blob/master/libs/pako.min.js

## Examples

### Deflating and Inflating an Array

```haxe
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
```

### Live Sample

A [live sample](http://hamaluik.github.io/haxe-pako/) is available which deflates an array of integers and successfully re-inflates them.

[1]: https://github.com/nodeca/pako
