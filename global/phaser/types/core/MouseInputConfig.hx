package global.phaser.types.core;

typedef MouseInputConfig = {
	/**
		Where the Mouse Manager listens for mouse input events. The default is the game canvas.
	**/
	@:optional
	var target : Dynamic;
	/**
		If `true` the DOM `mousedown` event will have `preventDefault` set.
	**/
	@:optional
	var preventDefaultDown : Bool;
	/**
		If `true` the DOM `mouseup` event will have `preventDefault` set.
	**/
	@:optional
	var preventDefaultUp : Bool;
	/**
		If `true` the DOM `mousemove` event will have `preventDefault` set.
	**/
	@:optional
	var preventDefaultMove : Bool;
	/**
		If `true` the DOM `wheel` event will have `preventDefault` set.
	**/
	@:optional
	var preventDefaultWheel : Bool;
};