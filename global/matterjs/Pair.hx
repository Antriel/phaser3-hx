package global.matterjs;

/**
	The `Matter.Pair` module contains methods for creating and manipulating collision pairs.
**/
@:native("MatterJS.Pair") extern class Pair {
	function new();
	static var prototype : Pair;
	/**
		Creates a pair.
	**/
	static function create(collision:ICollisionData, timestamp:Float):IPair;
	/**
		Updates a pair given a collision.
	**/
	static function update(pair:IPair, collision:ICollisionData, timestamp:Float):Void;
	/**
		Set a pair as active or inactive.
	**/
	static function setActive(pair:IPair, isActive:Bool, timestamp:Float):Void;
	/**
		Get the id for the given pair.
	**/
	static function id(bodyA:BodyType, bodyB:BodyType):String;
}