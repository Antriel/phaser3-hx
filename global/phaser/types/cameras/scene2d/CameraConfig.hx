package global.phaser.types.cameras.scene2d;

typedef CameraConfig = {
	/**
		The name of the Camera.
	**/
	@:optional
	var name : String;
	/**
		The horizontal position of the Camera viewport.
	**/
	@:optional
	var x : Float;
	/**
		The vertical position of the Camera viewport.
	**/
	@:optional
	var y : Float;
	/**
		The width of the Camera viewport.
	**/
	@:optional
	var width : Float;
	/**
		The height of the Camera viewport.
	**/
	@:optional
	var height : Float;
	/**
		The default zoom level of the Camera.
	**/
	@:optional
	var zoom : Float;
	/**
		The rotation of the Camera, in radians.
	**/
	@:optional
	var rotation : Float;
	/**
		Should the Camera round pixels before rendering?
	**/
	@:optional
	var roundPixels : Bool;
	/**
		The horizontal scroll position of the Camera.
	**/
	@:optional
	var scrollX : Float;
	/**
		The vertical scroll position of the Camera.
	**/
	@:optional
	var scrollY : Float;
	/**
		A CSS color string controlling the Camera background color.
	**/
	@:optional
	var backgroundColor : ts.AnyOf2<String, Bool>;
	/**
		Defines the Camera bounds.
	**/
	@:optional
	var bounds : Dynamic;
	/**
		The top-left extent of the Camera bounds.
	**/
	@:optional
	@:native("bounds.x")
	var bounds_x : Float;
	/**
		The top-left extent of the Camera bounds.
	**/
	@:optional
	@:native("bounds.y")
	var bounds_y : Float;
	/**
		The width of the Camera bounds.
	**/
	@:optional
	@:native("bounds.width")
	var bounds_width : Float;
	/**
		The height of the Camera bounds.
	**/
	@:optional
	@:native("bounds.height")
	var bounds_height : Float;
};