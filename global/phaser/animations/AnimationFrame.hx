package global.phaser.animations;

/**
	A single frame in an Animation sequence.
	
	An AnimationFrame consists of a reference to the Texture it uses for rendering, references to other
	frames in the animation, and index data. It also has the ability to modify the animation timing.
	
	AnimationFrames are generated automatically by the Animation class.
**/
@:native("Phaser.Animations.AnimationFrame") extern class AnimationFrame {
	function new(textureKey:String, textureFrame:ts.AnyOf2<String, Float>, index:Float, frame:global.phaser.textures.Frame);
	/**
		The key of the Texture this AnimationFrame uses.
	**/
	var textureKey : String;
	/**
		The key of the Frame within the Texture that this AnimationFrame uses.
	**/
	var textureFrame : ts.AnyOf2<String, Float>;
	/**
		The index of this AnimationFrame within the Animation sequence.
	**/
	var index : Float;
	/**
		A reference to the Texture Frame this AnimationFrame uses for rendering.
	**/
	var frame : global.phaser.textures.Frame;
	/**
		Is this the first frame in an animation sequence?
	**/
	final isFirst : Bool;
	/**
		Is this the last frame in an animation sequence?
	**/
	final isLast : Bool;
	/**
		A reference to the AnimationFrame that comes before this one in the animation, if any.
	**/
	final prevFrame : AnimationFrame;
	/**
		A reference to the AnimationFrame that comes after this one in the animation, if any.
	**/
	final nextFrame : AnimationFrame;
	/**
		Additional time (in ms) that this frame should appear for during playback.
		The value is added onto the msPerFrame set by the animation.
	**/
	var duration : Float;
	/**
		What % through the animation does this frame come?
		This value is generated when the animation is created and cached here.
	**/
	final progress : Float;
	/**
		Generates a JavaScript object suitable for converting to JSON.
	**/
	function toJSON():global.phaser.types.animations.JSONAnimationFrame;
	/**
		Destroys this object by removing references to external resources and callbacks.
	**/
	function destroy():Void;
	static var prototype : AnimationFrame;
}