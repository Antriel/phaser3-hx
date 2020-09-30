package global.phaser.physics;

@:native("Phaser.Physics.Arcade") @valueModuleOnly extern class Arcade {
	/**
		Calculates and returns the horizontal overlap between two arcade physics bodies and sets their properties
		accordingly, including: `touching.left`, `touching.right`, `touching.none` and `overlapX'.
	**/
	static function GetOverlapX(body1:global.phaser.physics.arcade.Body, body2:global.phaser.physics.arcade.Body, overlapOnly:Bool, bias:Float):Float;
	/**
		Calculates and returns the vertical overlap between two arcade physics bodies and sets their properties
		accordingly, including: `touching.up`, `touching.down`, `touching.none` and `overlapY'.
	**/
	static function GetOverlapY(body1:global.phaser.physics.arcade.Body, body2:global.phaser.physics.arcade.Body, overlapOnly:Bool, bias:Float):Float;
	/**
		Separates two overlapping bodies on the X-axis (horizontally).
		
		Separation involves moving two overlapping bodies so they don't overlap anymore and adjusting their velocities based on their mass. This is a core part of collision detection.
		
		The bodies won't be separated if there is no horizontal overlap between them, if they are static, or if either one uses custom logic for its separation.
	**/
	static function SeparateX(body1:global.phaser.physics.arcade.Body, body2:global.phaser.physics.arcade.Body, overlapOnly:Bool, bias:Float):Bool;
	/**
		Separates two overlapping bodies on the Y-axis (vertically).
		
		Separation involves moving two overlapping bodies so they don't overlap anymore and adjusting their velocities based on their mass. This is a core part of collision detection.
		
		The bodies won't be separated if there is no vertical overlap between them, if they are static, or if either one uses custom logic for its separation.
	**/
	static function SeparateY(body1:global.phaser.physics.arcade.Body, body2:global.phaser.physics.arcade.Body, overlapOnly:Bool, bias:Float):Bool;
	/**
		Dynamic Body.
	**/
	static var DYNAMIC_BODY : Float;
	/**
		Static Body.
	**/
	static var STATIC_BODY : Float;
	/**
		Arcade Physics Group containing Dynamic Bodies.
	**/
	static var GROUP : Float;
	/**
		A Tilemap Layer.
	**/
	static var TILEMAPLAYER : Float;
	/**
		Facing no direction (initial value).
	**/
	static var FACING_NONE : Float;
	/**
		Facing up.
	**/
	static var FACING_UP : Float;
	/**
		Facing down.
	**/
	static var FACING_DOWN : Float;
	/**
		Facing left.
	**/
	static var FACING_LEFT : Float;
	/**
		Facing right.
	**/
	static var FACING_RIGHT : Float;
}