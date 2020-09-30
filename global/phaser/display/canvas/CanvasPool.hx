package global.phaser.display.canvas;

/**
	The CanvasPool is a global static object, that allows Phaser to recycle and pool 2D Context Canvas DOM elements.
	It does not pool WebGL Contexts, because once the context options are set they cannot be modified again, 
	which is useless for some of the Phaser pipelines / renderer.
	
	This singleton is instantiated as soon as Phaser loads, before a Phaser.Game instance has even been created.
	Which means all instances of Phaser Games on the same page can share the one single pool.
**/
@:native("Phaser.Display.Canvas.CanvasPool") @valueModuleOnly extern class CanvasPool {
	/**
		Creates a new Canvas DOM element, or pulls one from the pool if free.
	**/
	static function create(parent:Dynamic, ?width:Float, ?height:Float, ?canvasType:Float, ?selfParent:Bool):js.html.CanvasElement;
	/**
		Creates a new Canvas DOM element, or pulls one from the pool if free.
	**/
	static function create2D(parent:Dynamic, ?width:Float, ?height:Float):js.html.CanvasElement;
	/**
		Creates a new Canvas DOM element, or pulls one from the pool if free.
	**/
	static function createWebGL(parent:Dynamic, ?width:Float, ?height:Float):js.html.CanvasElement;
	/**
		Gets the first free canvas index from the pool.
	**/
	static function first(?canvasType:Float):js.html.CanvasElement;
	/**
		Looks up a canvas based on its parent, and if found puts it back in the pool, freeing it up for re-use.
		The canvas has its width and height set to 1, and its parent attribute nulled.
	**/
	static function remove(parent:Dynamic):Void;
	/**
		Gets the total number of used canvas elements in the pool.
	**/
	static function total():Float;
	/**
		Gets the total number of free canvas elements in the pool.
	**/
	static function free():Float;
	/**
		Disable context smoothing on any new Canvas element created.
	**/
	static function disableSmoothing():Void;
	/**
		Enable context smoothing on any new Canvas element created.
	**/
	static function enableSmoothing():Void;
}