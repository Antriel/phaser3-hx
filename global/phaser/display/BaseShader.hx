package global.phaser.display;

/**
	A BaseShader is a small resource class that contains the data required for a WebGL Shader to be created.
	
	It contains the raw source code to the fragment and vertex shader, as well as an object that defines
	the uniforms the shader requires, if any.
	
	BaseShaders are stored in the Shader Cache, available in a Scene via `this.cache.shaders` and are referenced
	by a unique key-based string. Retrieve them via `this.cache.shaders.get(key)`.
	
	BaseShaders are created automatically by the GLSL File Loader when loading an external shader resource.
	They can also be created at runtime, allowing you to use dynamically generated shader source code.
	
	Default fragment and vertex source is used if not provided in the constructor, setting-up a basic shader,
	suitable for debug rendering.
**/
@:native("Phaser.Display.BaseShader") extern class BaseShader {
	function new(key:String, ?fragmentSrc:String, ?vertexSrc:String, ?uniforms:Dynamic);
	/**
		The key of this shader, unique within the shader cache of this Phaser game instance.
	**/
	var key : String;
	/**
		The source code, as a string, of the fragment shader being used.
	**/
	var fragmentSrc : String;
	/**
		The source code, as a string, of the vertex shader being used.
	**/
	var vertexSrc : String;
	/**
		The default uniforms for this shader.
	**/
	var uniforms : Dynamic;
	static var prototype : BaseShader;
}