package global.matterjs;

/**
	The `Matter.SAT` module contains methods for detecting collisions using the Separating Axis Theorem.
**/
@:native("MatterJS.SAT") extern class SAT {
	function new();
	static var prototype : SAT;
	/**
		Detect collision between two bodies using the Separating Axis Theorem.
	**/
	static function collides(bodyA:BodyType, bodyB:BodyType, previousCollision:ICollisionData):ICollisionData;
}