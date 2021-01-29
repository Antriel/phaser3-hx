package global.phaser.renderer.webgl;

/**
	A Render Target encapsulates a WebGL framebuffer and the WebGL Texture that displays it.
	
	Instances of this class are typically created by, and belong to WebGL Pipelines, however
	other Game Objects and classes can take advantage of Render Targets as well.
**/
@:native("Phaser.Renderer.WebGL.RenderTarget") extern class RenderTarget {
	function new(renderer:WebGLRenderer, width:Float, height:Float, ?scale:Float, ?minFilter:Float, ?autoClear:Bool, ?autoResize:Bool);
	/**
		A reference to the WebGLRenderer instance.
	**/
	var renderer : WebGLRenderer;
	/**
		The WebGLFramebuffer of this Render Target.
		
		This is created in the `RenderTarget.resize` method.
	**/
	var framebuffer : js.html.webgl.Framebuffer;
	/**
		The WebGLTexture of this Render Target.
		
		This is created in the `RenderTarget.resize` method.
	**/
	var texture : js.html.webgl.Texture;
	/**
		The width of the texture.
	**/
	final width : Float;
	/**
		The height of the texture.
	**/
	final height : Float;
	/**
		A value between 0 and 1. Controls the size of this Render Target in relation to the Renderer.
		
		A value of 1 matches it. 0.5 makes the Render Target half the size of the renderer, etc.
	**/
	var scale : Float;
	/**
		The minFilter mode of the texture. 0 is `LINEAR`, 1 is `NEAREST`.
	**/
	var minFilter : Float;
	/**
		Controls if this Render Target is automatically cleared (via `gl.COLOR_BUFFER_BIT`)
		during the `RenderTarget.bind` method.
		
		If you need more control over how, or if, the target is cleared, you can disable
		this via the config on creation, or even toggle it directly at runtime.
	**/
	var autoClear : Bool;
	/**
		Does this Render Target automatically resize when the WebGL Renderer does?
		
		Modify this property via the `setAutoResize` method.
	**/
	final autoResize : Bool;
	/**
		Sets if this Render Target should automatically resize when the WebGL Renderer
		emits a resize event.
	**/
	function setAutoResize(autoResize:Bool):RenderTarget;
	/**
		Resizes this Render Target.
		
		Deletes both the frame buffer and texture, if they exist and then re-creates
		them using the new sizes.
		
		This method is called automatically by the pipeline during its resize handler.
	**/
	function resize(width:Float, height:Float):RenderTarget;
	/**
		Pushes this Render Target as the current frame buffer of the renderer.
		
		If `autoClear` is set, then clears the texture.
		
		If `adjustViewport` is `true` then it will flush the renderer and then adjust the GL viewport.
	**/
	function bind(?adjustViewport:Bool, ?width:Float, ?height:Float):Void;
	/**
		Adjusts the GL viewport to match the width and height of this Render Target.
		
		Also disables `SCISSOR_TEST`.
	**/
	function adjustViewport():Void;
	/**
		Clears this Render Target.
	**/
	function clear():Void;
	/**
		Unbinds this Render Target and optionally flushes the WebGL Renderer first.
	**/
	var unbind : Dynamic;
	/**
		Removes all external references from this class and deletes the
		WebGL framebuffer and texture instances.
		
		Does not remove this Render Target from the parent pipeline.
	**/
	var destroy : Dynamic;
	static var prototype : RenderTarget;
}