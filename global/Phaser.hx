package global;

@:native("Phaser") @valueModuleOnly extern class Phaser {
	/**
		Phaser Release Version
	**/
	static final VERSION : String;
	/**
		This setting will auto-detect if the browser is capable of suppporting WebGL.
		If it is, it will use the WebGL Renderer. If not, it will fall back to the Canvas Renderer.
	**/
	static final AUTO : Float;
	/**
		Forces Phaser to only use the Canvas Renderer, regardless if the browser supports
		WebGL or not.
	**/
	static final CANVAS : Float;
	/**
		Forces Phaser to use the WebGL Renderer. If the browser does not support it, there is
		no fallback to Canvas with this setting, so you should trap it and display a suitable
		message to the user.
	**/
	static final WEBGL : Float;
	/**
		A Headless Renderer doesn't create either a Canvas or WebGL Renderer. However, it still
		absolutely relies on the DOM being present and available. This mode is meant for unit testing,
		not for running Phaser on the server, which is something you really shouldn't do.
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