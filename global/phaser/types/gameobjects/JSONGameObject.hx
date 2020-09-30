package global.phaser.types.gameobjects;

typedef JSONGameObject = {
	/**
		The name of this Game Object.
	**/
	var name : String;
	/**
		A textual representation of this Game Object, i.e. `sprite`.
	**/
	var type : String;
	/**
		The x position of this Game Object.
	**/
	var x : Float;
	/**
		The y position of this Game Object.
	**/
	var y : Float;
	/**
		The scale of this Game Object
	**/
	var scale : Dynamic;
	/**
		The horizontal scale of this Game Object.
	**/
	@:native("scale.x")
	var scale_x : Float;
	/**
		The vertical scale of this Game Object.
	**/
	@:native("scale.y")
	var scale_y : Float;
	/**
		The origin of this Game Object.
	**/
	var origin : Dynamic;
	/**
		The horizontal origin of this Game Object.
	**/
	@:native("origin.x")
	var origin_x : Float;
	/**
		The vertical origin of this Game Object.
	**/
	@:native("origin.y")
	var origin_y : Float;
	/**
		The horizontally flipped state of the Game Object.
	**/
	var flipX : Bool;
	/**
		The vertically flipped state of the Game Object.
	**/
	var flipY : Bool;
	/**
		The angle of this Game Object in radians.
	**/
	var rotation : Float;
	/**
		The alpha value of the Game Object.
	**/
	var alpha : Float;
	/**
		The visible state of the Game Object.
	**/
	var visible : Bool;
	/**
		The Scale Mode being used by this Game Object.
	**/
	var scaleMode : Float;
	/**
		Sets the Blend Mode being used by this Game Object.
	**/
	var blendMode : ts.AnyOf2<String, Float>;
	/**
		The texture key of this Game Object.
	**/
	var textureKey : String;
	/**
		The frame key of this Game Object.
	**/
	var frameKey : String;
	/**
		The data of this Game Object.
	**/
	var data : Dynamic;
};