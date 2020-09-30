package global.matterjs;

@:native("MatterJS.PairFactory") extern class PairFactory {
	function new();
	/**
		Creates a pair.
	**/
	function create(collision:ICollisionData, timestamp:Float):IPair;
	/**
		Updates a pair given a collision.
	**/
	function update(pair:IPair, collision:ICollisionData, timestamp:Float):Void;
	/**
		Set a pair as active or inactive.
	**/
	function setActive(pair:IPair, isActive:Bool, timestamp:Float):Void;
	/**
		Get the id for the given pair.
	**/
	function id(bodyA:BodyType, bodyB:BodyType):String;
	static var prototype : PairFactory;
}