package global.phaser.textures;

/**
	A Frame is a section of a Texture.
**/
@:native("Phaser.Textures.Frame") extern class Frame {
	function new(texture:Texture, name:ts.AnyOf2<String, Float>, sourceIndex:Float, x:Float, y:Float, width:Float, height:Float);
	/**
		The Texture this Frame is a part of.
	**/
	var texture : Texture;
	/**
		The name of this Frame.
		The name is unique within the Texture.
	**/
	var name : String;
	/**
		The TextureSource this Frame is part of.
	**/
	var source : TextureSource;
	/**
		The index of the TextureSource in the Texture sources array.
	**/
	var sourceIndex : Float;
	/**
		A reference to the Texture Source WebGL Texture that this Frame is using.
	**/
	var glTexture : js.html.webgl.Texture;
	/**
		X position within the source image to cut from.
	**/
	var cutX : Float;
	/**
		Y position within the source image to cut from.
	**/
	var cutY : Float;
	/**
		The width of the area in the source image to cut.
	**/
	var cutWidth : Float;
	/**
		The height of the area in the source image to cut.
	**/
	var cutHeight : Float;
	/**
		The X rendering offset of this Frame, taking trim into account.
	**/
	var x : Float;
	/**
		The Y rendering offset of this Frame, taking trim into account.
	**/
	var y : Float;
	/**
		The rendering width of this Frame, taking trim into account.
	**/
	var width : Float;
	/**
		The rendering height of this Frame, taking trim into account.
	**/
	var height : Float;
	/**
		Half the width, floored.
		Precalculated for the renderer.
	**/
	var halfWidth : Float;
	/**
		Half the height, floored.
		Precalculated for the renderer.
	**/
	var halfHeight : Float;
	/**
		The x center of this frame, floored.
	**/
	var centerX : Float;
	/**
		The y center of this frame, floored.
	**/
	var centerY : Float;
	/**
		The horizontal pivot point of this Frame.
	**/
	var pivotX : Float;
	/**
		The vertical pivot point of this Frame.
	**/
	var pivotY : Float;
	/**
		Does this Frame have a custom pivot point?
	**/
	var customPivot : Bool;
	/**
		**CURRENTLY UNSUPPORTED**
		
		Is this frame is rotated or not in the Texture?
		Rotation allows you to use rotated frames in texture atlas packing.
		It has nothing to do with Sprite rotation.
	**/
	var rotated : Bool;
	/**
		Over-rides the Renderer setting.
		-1 = use Renderer Setting
		0 = No rounding
		1 = Round
	**/
	var autoRound : Float;
	/**
		Any Frame specific custom data can be stored here.
	**/
	var customData : Dynamic;
	/**
		WebGL UV u0 value.
	**/
	var u0 : Float;
	/**
		WebGL UV v0 value.
	**/
	var v0 : Float;
	/**
		WebGL UV u1 value.
	**/
	var u1 : Float;
	/**
		WebGL UV v1 value.
	**/
	var v1 : Float;
	/**
		Sets the width, height, x and y of this Frame.
		
		This is called automatically by the constructor
		and should rarely be changed on-the-fly.
	**/
	function setSize(width:Float, height:Float, ?x:Float, ?y:Float):Frame;
	/**
		If the frame was trimmed when added to the Texture Atlas, this records the trim and source data.
	**/
	function setTrim(actualWidth:Float, actualHeight:Float, destX:Float, destY:Float, destWidth:Float, destHeight:Float):Frame;
	/**
		Takes a crop data object and, based on the rectangular region given, calculates the
		required UV coordinates in order to crop this Frame for WebGL and Canvas rendering.
		
		This is called directly by the Game Object Texture Components `setCrop` method.
		Please use that method to crop a Game Object.
	**/
	function setCropUVs(crop:Dynamic, x:Float, y:Float, width:Float, height:Float, flipX:Bool, flipY:Bool):Dynamic;
	/**
		Takes a crop data object and recalculates the UVs based on the dimensions inside the crop object.
		Called automatically by `setFrame`.
	**/
	function updateCropUVs(crop:Dynamic, flipX:Bool, flipY:Bool):Dynamic;
	/**
		Directly sets the canvas and WebGL UV data for this frame.
		
		Use this if you need to override the values that are generated automatically
		when the Frame is created.
	**/
	function setUVs(width:Float, height:Float, u0:Float, v0:Float, u1:Float, v1:Float):Frame;
	/**
		Updates the internal WebGL UV cache and the drawImage cache.
	**/
	function updateUVs():Frame;
	/**
		Updates the internal WebGL UV cache.
	**/
	function updateUVsInverted():Frame;
	/**
		Clones this Frame into a new Frame object.
	**/
	function clone():Frame;
	/**
		Destroys this Frame by nulling its reference to the parent Texture and and data objects.
	**/
	function destroy():Void;
	/**
		The width of the Frame in its un-trimmed, un-padded state, as prepared in the art package,
		before being packed.
	**/
	final realWidth : Float;
	/**
		The height of the Frame in its un-trimmed, un-padded state, as prepared in the art package,
		before being packed.
	**/
	final realHeight : Float;
	/**
		The radius of the Frame (derived from sqrt(w * w + h * h) / 2)
	**/
	final radius : Float;
	/**
		Is the Frame trimmed or not?
	**/
	final trimmed : Bool;
	/**
		The Canvas drawImage data object.
	**/
	final canvasData : Dynamic;
	static var prototype : Frame;
}