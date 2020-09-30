package global.phaser.types.gameobjects;

typedef GameObjectConfig = {
	/**
		The x position of the Game Object.
	**/
	@:optional
	var x : Float;
	/**
		The y position of the Game Object.
	**/
	@:optional
	var y : Float;
	/**
		The depth of the GameObject.
	**/
	@:optional
	var depth : Float;
	/**
		The horizontally flipped state of the Game Object.
	**/
	@:optional
	var flipX : Bool;
	/**
		The vertically flipped state of the Game Object.
	**/
	@:optional
	var flipY : Bool;
	/**
		The scale of the GameObject.
	**/
	@:optional
	var scale : ts.AnyOf2<Float, Dynamic>;
	/**
		The scroll factor of the GameObject.
	**/
	@:optional
	var scrollFactor : ts.AnyOf2<Float, Dynamic>;
	/**
		The rotation angle of the Game Object, in radians.
	**/
	@:optional
	var rotation : Float;
	/**
		The rotation angle of the Game Object, in degrees.
	**/
	@:optional
	var angle : Float;
	/**
		The alpha (opacity) of the Game Object.
	**/
	@:optional
	var alpha : Float;
	/**
		The origin of the Game Object.
	**/
	@:optional
	var origin : ts.AnyOf2<Float, Dynamic>;
	/**
		The scale mode of the GameObject.
	**/
	@:optional
	var scaleMode : Float;
	/**
		The blend mode of the GameObject.
	**/
	@:optional
	var blendMode : Float;
	/**
		The visible state of the Game Object.
	**/
	@:optional
	var visible : Bool;
	/**
		Add the GameObject to the scene.
	**/
	@:optional
	var add : Bool;
};