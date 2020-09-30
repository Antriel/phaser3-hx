package global;

@:native("Phaser") @valueModuleOnly extern class Phaser {
	/**
		Phaser Release Version
	**/
	static final VERSION : String;
	/**
		AUTO Detect Renderer.
	**/
	static final AUTO : Float;
	/**
		Canvas Renderer.
	**/
	static final CANVAS : Float;
	/**
		WebGL Renderer.
	**/
	static final WEBGL : Float;
	/**
		Headless Renderer.
	**/
	static final HEADLESS : Float;
	/**
		In Phaser the value -1 means 'forever' in lots of cases, this const allows you to use it instead
		to help you remember what the value is doing in your code.
	**/
	static final FOREVER : Float;
	/**
		Direction constant.
	**/
	static final NONE : Float;
	/**
		Direction constant.
	**/
	static final UP : Float;
	/**
		Direction constant.
	**/
	static final DOWN : Float;
	/**
		Direction constant.
	**/
	static final LEFT : Float;
	/**
		Direction constant.
	**/
	static final RIGHT : Float;
}