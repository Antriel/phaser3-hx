package global.matterjs;

/**
	The `Matter.Detector` module contains methods for detecting collisions given a set of pairs.
**/
@:native("MatterJS.Detector") extern class Detector {
	function new();
	static var prototype : Detector;
	/**
		Finds all collisions given a list of pairs.
	**/
	static function collisions(broadphasePairs:Array<IPair>, engine:Engine):Array<ICollisionData>;
	/**
		Returns `true` if both supplied collision filters will allow a collision to occur.
		See `body.collisionFilter` for more information.
	**/
	static function canCollide(filterA:ICollisionFilter, filterB:ICollisionFilter):Bool;
}