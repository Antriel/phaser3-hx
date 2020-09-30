package global.phaser.renderer.webgl;

@:native("Phaser.Renderer.WebGL.Utils") @valueModuleOnly extern class Utils {
	/**
		Packs four floats on a range from 0.0 to 1.0 into a single Uint32
	**/
	static function getTintFromFloats(r:Float, g:Float, b:Float, a:Float):Float;
	/**
		Packs a Uint24, representing RGB components, with a Float32, representing
		the alpha component, with a range between 0.0 and 1.0 and return a Uint32
	**/
	static function getTintAppendFloatAlpha(rgb:Float, a:Float):Float;
	/**
		Packs a Uint24, representing RGB components, with a Float32, representing
		the alpha component, with a range between 0.0 and 1.0 and return a 
		swizzled Uint32
	**/
	static function getTintAppendFloatAlphaAndSwap(rgb:Float, a:Float):Float;
	/**
		Unpacks a Uint24 RGB into an array of floats of ranges of 0.0 and 1.0
	**/
	static function getFloatsFromUintRGB(rgb:Float):Array<Dynamic>;
	/**
		Counts how many attributes of 32 bits a vertex has
	**/
	static function getComponentCount(attributes:Array<Dynamic>, glContext:js.html.webgl.RenderingContext):Float;
}