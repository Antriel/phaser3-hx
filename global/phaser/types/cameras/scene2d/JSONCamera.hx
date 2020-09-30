package global.phaser.types.cameras.scene2d;

typedef JSONCamera = {
	/**
		The name of the camera
	**/
	var name : String;
	/**
		The horizontal position of camera
	**/
	var x : Float;
	/**
		The vertical position of camera
	**/
	var y : Float;
	/**
		The width size of camera
	**/
	var width : Float;
	/**
		The height size of camera
	**/
	var height : Float;
	/**
		The zoom of camera
	**/
	var zoom : Float;
	/**
		The rotation of camera
	**/
	var rotation : Float;
	/**
		The round pixels st status of camera
	**/
	var roundPixels : Bool;
	/**
		The horizontal scroll of camera
	**/
	var scrollX : Float;
	/**
		The vertical scroll of camera
	**/
	var scrollY : Float;
	/**
		The background color of camera
	**/
	var backgroundColor : String;
	/**
		The bounds of camera
	**/
	@:optional
	var bounds : JSONCameraBounds;
};