package global.matterjs;

@:native("MatterJS.SATFactory") extern class SATFactory {
	function new();
	/**
		Detect collision between two bodies using the Separating Axis Theorem.
	**/
	function collides(bodyA:BodyType, bodyB:BodyType, previousCollision:ICollisionData):ICollisionData;
	static var prototype : SATFactory;
}